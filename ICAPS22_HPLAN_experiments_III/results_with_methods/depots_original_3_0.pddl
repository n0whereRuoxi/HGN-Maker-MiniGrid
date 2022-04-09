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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1273 - SURFACE
      ?auto_1274 - SURFACE
    )
    :vars
    (
      ?auto_1275 - HOIST
      ?auto_1276 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1275 ?auto_1276 ) ( SURFACE-AT ?auto_1273 ?auto_1276 ) ( CLEAR ?auto_1273 ) ( LIFTING ?auto_1275 ?auto_1274 ) ( IS-CRATE ?auto_1274 ) ( not ( = ?auto_1273 ?auto_1274 ) ) )
    :subtasks
    ( ( !DROP ?auto_1275 ?auto_1274 ?auto_1273 ?auto_1276 )
      ( MAKE-1CRATE-VERIFY ?auto_1273 ?auto_1274 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1277 - SURFACE
      ?auto_1278 - SURFACE
    )
    :vars
    (
      ?auto_1279 - HOIST
      ?auto_1280 - PLACE
      ?auto_1281 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1279 ?auto_1280 ) ( SURFACE-AT ?auto_1277 ?auto_1280 ) ( CLEAR ?auto_1277 ) ( IS-CRATE ?auto_1278 ) ( not ( = ?auto_1277 ?auto_1278 ) ) ( TRUCK-AT ?auto_1281 ?auto_1280 ) ( AVAILABLE ?auto_1279 ) ( IN ?auto_1278 ?auto_1281 ) )
    :subtasks
    ( ( !UNLOAD ?auto_1279 ?auto_1278 ?auto_1281 ?auto_1280 )
      ( MAKE-1CRATE ?auto_1277 ?auto_1278 )
      ( MAKE-1CRATE-VERIFY ?auto_1277 ?auto_1278 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1282 - SURFACE
      ?auto_1283 - SURFACE
    )
    :vars
    (
      ?auto_1284 - HOIST
      ?auto_1285 - PLACE
      ?auto_1286 - TRUCK
      ?auto_1287 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1284 ?auto_1285 ) ( SURFACE-AT ?auto_1282 ?auto_1285 ) ( CLEAR ?auto_1282 ) ( IS-CRATE ?auto_1283 ) ( not ( = ?auto_1282 ?auto_1283 ) ) ( AVAILABLE ?auto_1284 ) ( IN ?auto_1283 ?auto_1286 ) ( TRUCK-AT ?auto_1286 ?auto_1287 ) ( not ( = ?auto_1287 ?auto_1285 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1286 ?auto_1287 ?auto_1285 )
      ( MAKE-1CRATE ?auto_1282 ?auto_1283 )
      ( MAKE-1CRATE-VERIFY ?auto_1282 ?auto_1283 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1288 - SURFACE
      ?auto_1289 - SURFACE
    )
    :vars
    (
      ?auto_1291 - HOIST
      ?auto_1290 - PLACE
      ?auto_1293 - TRUCK
      ?auto_1292 - PLACE
      ?auto_1294 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1291 ?auto_1290 ) ( SURFACE-AT ?auto_1288 ?auto_1290 ) ( CLEAR ?auto_1288 ) ( IS-CRATE ?auto_1289 ) ( not ( = ?auto_1288 ?auto_1289 ) ) ( AVAILABLE ?auto_1291 ) ( TRUCK-AT ?auto_1293 ?auto_1292 ) ( not ( = ?auto_1292 ?auto_1290 ) ) ( HOIST-AT ?auto_1294 ?auto_1292 ) ( LIFTING ?auto_1294 ?auto_1289 ) ( not ( = ?auto_1291 ?auto_1294 ) ) )
    :subtasks
    ( ( !LOAD ?auto_1294 ?auto_1289 ?auto_1293 ?auto_1292 )
      ( MAKE-1CRATE ?auto_1288 ?auto_1289 )
      ( MAKE-1CRATE-VERIFY ?auto_1288 ?auto_1289 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1295 - SURFACE
      ?auto_1296 - SURFACE
    )
    :vars
    (
      ?auto_1298 - HOIST
      ?auto_1300 - PLACE
      ?auto_1299 - TRUCK
      ?auto_1297 - PLACE
      ?auto_1301 - HOIST
      ?auto_1302 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1298 ?auto_1300 ) ( SURFACE-AT ?auto_1295 ?auto_1300 ) ( CLEAR ?auto_1295 ) ( IS-CRATE ?auto_1296 ) ( not ( = ?auto_1295 ?auto_1296 ) ) ( AVAILABLE ?auto_1298 ) ( TRUCK-AT ?auto_1299 ?auto_1297 ) ( not ( = ?auto_1297 ?auto_1300 ) ) ( HOIST-AT ?auto_1301 ?auto_1297 ) ( not ( = ?auto_1298 ?auto_1301 ) ) ( AVAILABLE ?auto_1301 ) ( SURFACE-AT ?auto_1296 ?auto_1297 ) ( ON ?auto_1296 ?auto_1302 ) ( CLEAR ?auto_1296 ) ( not ( = ?auto_1295 ?auto_1302 ) ) ( not ( = ?auto_1296 ?auto_1302 ) ) )
    :subtasks
    ( ( !LIFT ?auto_1301 ?auto_1296 ?auto_1302 ?auto_1297 )
      ( MAKE-1CRATE ?auto_1295 ?auto_1296 )
      ( MAKE-1CRATE-VERIFY ?auto_1295 ?auto_1296 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1303 - SURFACE
      ?auto_1304 - SURFACE
    )
    :vars
    (
      ?auto_1305 - HOIST
      ?auto_1307 - PLACE
      ?auto_1309 - PLACE
      ?auto_1310 - HOIST
      ?auto_1308 - SURFACE
      ?auto_1306 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1305 ?auto_1307 ) ( SURFACE-AT ?auto_1303 ?auto_1307 ) ( CLEAR ?auto_1303 ) ( IS-CRATE ?auto_1304 ) ( not ( = ?auto_1303 ?auto_1304 ) ) ( AVAILABLE ?auto_1305 ) ( not ( = ?auto_1309 ?auto_1307 ) ) ( HOIST-AT ?auto_1310 ?auto_1309 ) ( not ( = ?auto_1305 ?auto_1310 ) ) ( AVAILABLE ?auto_1310 ) ( SURFACE-AT ?auto_1304 ?auto_1309 ) ( ON ?auto_1304 ?auto_1308 ) ( CLEAR ?auto_1304 ) ( not ( = ?auto_1303 ?auto_1308 ) ) ( not ( = ?auto_1304 ?auto_1308 ) ) ( TRUCK-AT ?auto_1306 ?auto_1307 ) )
    :subtasks
    ( ( !DRIVE ?auto_1306 ?auto_1307 ?auto_1309 )
      ( MAKE-1CRATE ?auto_1303 ?auto_1304 )
      ( MAKE-1CRATE-VERIFY ?auto_1303 ?auto_1304 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1316 - SURFACE
      ?auto_1317 - SURFACE
    )
    :vars
    (
      ?auto_1318 - HOIST
      ?auto_1319 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1318 ?auto_1319 ) ( SURFACE-AT ?auto_1316 ?auto_1319 ) ( CLEAR ?auto_1316 ) ( LIFTING ?auto_1318 ?auto_1317 ) ( IS-CRATE ?auto_1317 ) ( not ( = ?auto_1316 ?auto_1317 ) ) )
    :subtasks
    ( ( !DROP ?auto_1318 ?auto_1317 ?auto_1316 ?auto_1319 )
      ( MAKE-1CRATE-VERIFY ?auto_1316 ?auto_1317 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1320 - SURFACE
      ?auto_1321 - SURFACE
      ?auto_1322 - SURFACE
    )
    :vars
    (
      ?auto_1323 - HOIST
      ?auto_1324 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1323 ?auto_1324 ) ( SURFACE-AT ?auto_1321 ?auto_1324 ) ( CLEAR ?auto_1321 ) ( LIFTING ?auto_1323 ?auto_1322 ) ( IS-CRATE ?auto_1322 ) ( not ( = ?auto_1321 ?auto_1322 ) ) ( ON ?auto_1321 ?auto_1320 ) ( not ( = ?auto_1320 ?auto_1321 ) ) ( not ( = ?auto_1320 ?auto_1322 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1321 ?auto_1322 )
      ( MAKE-2CRATE-VERIFY ?auto_1320 ?auto_1321 ?auto_1322 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1325 - SURFACE
      ?auto_1326 - SURFACE
    )
    :vars
    (
      ?auto_1327 - HOIST
      ?auto_1328 - PLACE
      ?auto_1329 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1327 ?auto_1328 ) ( SURFACE-AT ?auto_1325 ?auto_1328 ) ( CLEAR ?auto_1325 ) ( IS-CRATE ?auto_1326 ) ( not ( = ?auto_1325 ?auto_1326 ) ) ( TRUCK-AT ?auto_1329 ?auto_1328 ) ( AVAILABLE ?auto_1327 ) ( IN ?auto_1326 ?auto_1329 ) )
    :subtasks
    ( ( !UNLOAD ?auto_1327 ?auto_1326 ?auto_1329 ?auto_1328 )
      ( MAKE-1CRATE ?auto_1325 ?auto_1326 )
      ( MAKE-1CRATE-VERIFY ?auto_1325 ?auto_1326 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1330 - SURFACE
      ?auto_1331 - SURFACE
      ?auto_1332 - SURFACE
    )
    :vars
    (
      ?auto_1335 - HOIST
      ?auto_1334 - PLACE
      ?auto_1333 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1335 ?auto_1334 ) ( SURFACE-AT ?auto_1331 ?auto_1334 ) ( CLEAR ?auto_1331 ) ( IS-CRATE ?auto_1332 ) ( not ( = ?auto_1331 ?auto_1332 ) ) ( TRUCK-AT ?auto_1333 ?auto_1334 ) ( AVAILABLE ?auto_1335 ) ( IN ?auto_1332 ?auto_1333 ) ( ON ?auto_1331 ?auto_1330 ) ( not ( = ?auto_1330 ?auto_1331 ) ) ( not ( = ?auto_1330 ?auto_1332 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1331 ?auto_1332 )
      ( MAKE-2CRATE-VERIFY ?auto_1330 ?auto_1331 ?auto_1332 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1336 - SURFACE
      ?auto_1337 - SURFACE
    )
    :vars
    (
      ?auto_1341 - HOIST
      ?auto_1338 - PLACE
      ?auto_1340 - TRUCK
      ?auto_1339 - SURFACE
      ?auto_1342 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1341 ?auto_1338 ) ( SURFACE-AT ?auto_1336 ?auto_1338 ) ( CLEAR ?auto_1336 ) ( IS-CRATE ?auto_1337 ) ( not ( = ?auto_1336 ?auto_1337 ) ) ( AVAILABLE ?auto_1341 ) ( IN ?auto_1337 ?auto_1340 ) ( ON ?auto_1336 ?auto_1339 ) ( not ( = ?auto_1339 ?auto_1336 ) ) ( not ( = ?auto_1339 ?auto_1337 ) ) ( TRUCK-AT ?auto_1340 ?auto_1342 ) ( not ( = ?auto_1342 ?auto_1338 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1340 ?auto_1342 ?auto_1338 )
      ( MAKE-2CRATE ?auto_1339 ?auto_1336 ?auto_1337 )
      ( MAKE-1CRATE-VERIFY ?auto_1336 ?auto_1337 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1343 - SURFACE
      ?auto_1344 - SURFACE
      ?auto_1345 - SURFACE
    )
    :vars
    (
      ?auto_1346 - HOIST
      ?auto_1348 - PLACE
      ?auto_1347 - TRUCK
      ?auto_1349 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1346 ?auto_1348 ) ( SURFACE-AT ?auto_1344 ?auto_1348 ) ( CLEAR ?auto_1344 ) ( IS-CRATE ?auto_1345 ) ( not ( = ?auto_1344 ?auto_1345 ) ) ( AVAILABLE ?auto_1346 ) ( IN ?auto_1345 ?auto_1347 ) ( ON ?auto_1344 ?auto_1343 ) ( not ( = ?auto_1343 ?auto_1344 ) ) ( not ( = ?auto_1343 ?auto_1345 ) ) ( TRUCK-AT ?auto_1347 ?auto_1349 ) ( not ( = ?auto_1349 ?auto_1348 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1344 ?auto_1345 )
      ( MAKE-2CRATE-VERIFY ?auto_1343 ?auto_1344 ?auto_1345 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1350 - SURFACE
      ?auto_1351 - SURFACE
    )
    :vars
    (
      ?auto_1356 - HOIST
      ?auto_1352 - PLACE
      ?auto_1354 - SURFACE
      ?auto_1355 - TRUCK
      ?auto_1353 - PLACE
      ?auto_1357 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1356 ?auto_1352 ) ( SURFACE-AT ?auto_1350 ?auto_1352 ) ( CLEAR ?auto_1350 ) ( IS-CRATE ?auto_1351 ) ( not ( = ?auto_1350 ?auto_1351 ) ) ( AVAILABLE ?auto_1356 ) ( ON ?auto_1350 ?auto_1354 ) ( not ( = ?auto_1354 ?auto_1350 ) ) ( not ( = ?auto_1354 ?auto_1351 ) ) ( TRUCK-AT ?auto_1355 ?auto_1353 ) ( not ( = ?auto_1353 ?auto_1352 ) ) ( HOIST-AT ?auto_1357 ?auto_1353 ) ( LIFTING ?auto_1357 ?auto_1351 ) ( not ( = ?auto_1356 ?auto_1357 ) ) )
    :subtasks
    ( ( !LOAD ?auto_1357 ?auto_1351 ?auto_1355 ?auto_1353 )
      ( MAKE-2CRATE ?auto_1354 ?auto_1350 ?auto_1351 )
      ( MAKE-1CRATE-VERIFY ?auto_1350 ?auto_1351 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1358 - SURFACE
      ?auto_1359 - SURFACE
      ?auto_1360 - SURFACE
    )
    :vars
    (
      ?auto_1363 - HOIST
      ?auto_1364 - PLACE
      ?auto_1365 - TRUCK
      ?auto_1361 - PLACE
      ?auto_1362 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1363 ?auto_1364 ) ( SURFACE-AT ?auto_1359 ?auto_1364 ) ( CLEAR ?auto_1359 ) ( IS-CRATE ?auto_1360 ) ( not ( = ?auto_1359 ?auto_1360 ) ) ( AVAILABLE ?auto_1363 ) ( ON ?auto_1359 ?auto_1358 ) ( not ( = ?auto_1358 ?auto_1359 ) ) ( not ( = ?auto_1358 ?auto_1360 ) ) ( TRUCK-AT ?auto_1365 ?auto_1361 ) ( not ( = ?auto_1361 ?auto_1364 ) ) ( HOIST-AT ?auto_1362 ?auto_1361 ) ( LIFTING ?auto_1362 ?auto_1360 ) ( not ( = ?auto_1363 ?auto_1362 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1359 ?auto_1360 )
      ( MAKE-2CRATE-VERIFY ?auto_1358 ?auto_1359 ?auto_1360 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1366 - SURFACE
      ?auto_1367 - SURFACE
    )
    :vars
    (
      ?auto_1371 - HOIST
      ?auto_1368 - PLACE
      ?auto_1372 - SURFACE
      ?auto_1370 - TRUCK
      ?auto_1369 - PLACE
      ?auto_1373 - HOIST
      ?auto_1374 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1371 ?auto_1368 ) ( SURFACE-AT ?auto_1366 ?auto_1368 ) ( CLEAR ?auto_1366 ) ( IS-CRATE ?auto_1367 ) ( not ( = ?auto_1366 ?auto_1367 ) ) ( AVAILABLE ?auto_1371 ) ( ON ?auto_1366 ?auto_1372 ) ( not ( = ?auto_1372 ?auto_1366 ) ) ( not ( = ?auto_1372 ?auto_1367 ) ) ( TRUCK-AT ?auto_1370 ?auto_1369 ) ( not ( = ?auto_1369 ?auto_1368 ) ) ( HOIST-AT ?auto_1373 ?auto_1369 ) ( not ( = ?auto_1371 ?auto_1373 ) ) ( AVAILABLE ?auto_1373 ) ( SURFACE-AT ?auto_1367 ?auto_1369 ) ( ON ?auto_1367 ?auto_1374 ) ( CLEAR ?auto_1367 ) ( not ( = ?auto_1366 ?auto_1374 ) ) ( not ( = ?auto_1367 ?auto_1374 ) ) ( not ( = ?auto_1372 ?auto_1374 ) ) )
    :subtasks
    ( ( !LIFT ?auto_1373 ?auto_1367 ?auto_1374 ?auto_1369 )
      ( MAKE-2CRATE ?auto_1372 ?auto_1366 ?auto_1367 )
      ( MAKE-1CRATE-VERIFY ?auto_1366 ?auto_1367 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1375 - SURFACE
      ?auto_1376 - SURFACE
      ?auto_1377 - SURFACE
    )
    :vars
    (
      ?auto_1379 - HOIST
      ?auto_1382 - PLACE
      ?auto_1380 - TRUCK
      ?auto_1378 - PLACE
      ?auto_1381 - HOIST
      ?auto_1383 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1379 ?auto_1382 ) ( SURFACE-AT ?auto_1376 ?auto_1382 ) ( CLEAR ?auto_1376 ) ( IS-CRATE ?auto_1377 ) ( not ( = ?auto_1376 ?auto_1377 ) ) ( AVAILABLE ?auto_1379 ) ( ON ?auto_1376 ?auto_1375 ) ( not ( = ?auto_1375 ?auto_1376 ) ) ( not ( = ?auto_1375 ?auto_1377 ) ) ( TRUCK-AT ?auto_1380 ?auto_1378 ) ( not ( = ?auto_1378 ?auto_1382 ) ) ( HOIST-AT ?auto_1381 ?auto_1378 ) ( not ( = ?auto_1379 ?auto_1381 ) ) ( AVAILABLE ?auto_1381 ) ( SURFACE-AT ?auto_1377 ?auto_1378 ) ( ON ?auto_1377 ?auto_1383 ) ( CLEAR ?auto_1377 ) ( not ( = ?auto_1376 ?auto_1383 ) ) ( not ( = ?auto_1377 ?auto_1383 ) ) ( not ( = ?auto_1375 ?auto_1383 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1376 ?auto_1377 )
      ( MAKE-2CRATE-VERIFY ?auto_1375 ?auto_1376 ?auto_1377 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1384 - SURFACE
      ?auto_1385 - SURFACE
    )
    :vars
    (
      ?auto_1389 - HOIST
      ?auto_1386 - PLACE
      ?auto_1390 - SURFACE
      ?auto_1388 - PLACE
      ?auto_1391 - HOIST
      ?auto_1392 - SURFACE
      ?auto_1387 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1389 ?auto_1386 ) ( SURFACE-AT ?auto_1384 ?auto_1386 ) ( CLEAR ?auto_1384 ) ( IS-CRATE ?auto_1385 ) ( not ( = ?auto_1384 ?auto_1385 ) ) ( AVAILABLE ?auto_1389 ) ( ON ?auto_1384 ?auto_1390 ) ( not ( = ?auto_1390 ?auto_1384 ) ) ( not ( = ?auto_1390 ?auto_1385 ) ) ( not ( = ?auto_1388 ?auto_1386 ) ) ( HOIST-AT ?auto_1391 ?auto_1388 ) ( not ( = ?auto_1389 ?auto_1391 ) ) ( AVAILABLE ?auto_1391 ) ( SURFACE-AT ?auto_1385 ?auto_1388 ) ( ON ?auto_1385 ?auto_1392 ) ( CLEAR ?auto_1385 ) ( not ( = ?auto_1384 ?auto_1392 ) ) ( not ( = ?auto_1385 ?auto_1392 ) ) ( not ( = ?auto_1390 ?auto_1392 ) ) ( TRUCK-AT ?auto_1387 ?auto_1386 ) )
    :subtasks
    ( ( !DRIVE ?auto_1387 ?auto_1386 ?auto_1388 )
      ( MAKE-2CRATE ?auto_1390 ?auto_1384 ?auto_1385 )
      ( MAKE-1CRATE-VERIFY ?auto_1384 ?auto_1385 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1393 - SURFACE
      ?auto_1394 - SURFACE
      ?auto_1395 - SURFACE
    )
    :vars
    (
      ?auto_1401 - HOIST
      ?auto_1400 - PLACE
      ?auto_1399 - PLACE
      ?auto_1397 - HOIST
      ?auto_1396 - SURFACE
      ?auto_1398 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1401 ?auto_1400 ) ( SURFACE-AT ?auto_1394 ?auto_1400 ) ( CLEAR ?auto_1394 ) ( IS-CRATE ?auto_1395 ) ( not ( = ?auto_1394 ?auto_1395 ) ) ( AVAILABLE ?auto_1401 ) ( ON ?auto_1394 ?auto_1393 ) ( not ( = ?auto_1393 ?auto_1394 ) ) ( not ( = ?auto_1393 ?auto_1395 ) ) ( not ( = ?auto_1399 ?auto_1400 ) ) ( HOIST-AT ?auto_1397 ?auto_1399 ) ( not ( = ?auto_1401 ?auto_1397 ) ) ( AVAILABLE ?auto_1397 ) ( SURFACE-AT ?auto_1395 ?auto_1399 ) ( ON ?auto_1395 ?auto_1396 ) ( CLEAR ?auto_1395 ) ( not ( = ?auto_1394 ?auto_1396 ) ) ( not ( = ?auto_1395 ?auto_1396 ) ) ( not ( = ?auto_1393 ?auto_1396 ) ) ( TRUCK-AT ?auto_1398 ?auto_1400 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1394 ?auto_1395 )
      ( MAKE-2CRATE-VERIFY ?auto_1393 ?auto_1394 ?auto_1395 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1402 - SURFACE
      ?auto_1403 - SURFACE
    )
    :vars
    (
      ?auto_1409 - HOIST
      ?auto_1410 - PLACE
      ?auto_1404 - SURFACE
      ?auto_1407 - PLACE
      ?auto_1406 - HOIST
      ?auto_1405 - SURFACE
      ?auto_1408 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1409 ?auto_1410 ) ( IS-CRATE ?auto_1403 ) ( not ( = ?auto_1402 ?auto_1403 ) ) ( not ( = ?auto_1404 ?auto_1402 ) ) ( not ( = ?auto_1404 ?auto_1403 ) ) ( not ( = ?auto_1407 ?auto_1410 ) ) ( HOIST-AT ?auto_1406 ?auto_1407 ) ( not ( = ?auto_1409 ?auto_1406 ) ) ( AVAILABLE ?auto_1406 ) ( SURFACE-AT ?auto_1403 ?auto_1407 ) ( ON ?auto_1403 ?auto_1405 ) ( CLEAR ?auto_1403 ) ( not ( = ?auto_1402 ?auto_1405 ) ) ( not ( = ?auto_1403 ?auto_1405 ) ) ( not ( = ?auto_1404 ?auto_1405 ) ) ( TRUCK-AT ?auto_1408 ?auto_1410 ) ( SURFACE-AT ?auto_1404 ?auto_1410 ) ( CLEAR ?auto_1404 ) ( LIFTING ?auto_1409 ?auto_1402 ) ( IS-CRATE ?auto_1402 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1404 ?auto_1402 )
      ( MAKE-2CRATE ?auto_1404 ?auto_1402 ?auto_1403 )
      ( MAKE-1CRATE-VERIFY ?auto_1402 ?auto_1403 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1411 - SURFACE
      ?auto_1412 - SURFACE
      ?auto_1413 - SURFACE
    )
    :vars
    (
      ?auto_1414 - HOIST
      ?auto_1415 - PLACE
      ?auto_1417 - PLACE
      ?auto_1419 - HOIST
      ?auto_1418 - SURFACE
      ?auto_1416 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1414 ?auto_1415 ) ( IS-CRATE ?auto_1413 ) ( not ( = ?auto_1412 ?auto_1413 ) ) ( not ( = ?auto_1411 ?auto_1412 ) ) ( not ( = ?auto_1411 ?auto_1413 ) ) ( not ( = ?auto_1417 ?auto_1415 ) ) ( HOIST-AT ?auto_1419 ?auto_1417 ) ( not ( = ?auto_1414 ?auto_1419 ) ) ( AVAILABLE ?auto_1419 ) ( SURFACE-AT ?auto_1413 ?auto_1417 ) ( ON ?auto_1413 ?auto_1418 ) ( CLEAR ?auto_1413 ) ( not ( = ?auto_1412 ?auto_1418 ) ) ( not ( = ?auto_1413 ?auto_1418 ) ) ( not ( = ?auto_1411 ?auto_1418 ) ) ( TRUCK-AT ?auto_1416 ?auto_1415 ) ( SURFACE-AT ?auto_1411 ?auto_1415 ) ( CLEAR ?auto_1411 ) ( LIFTING ?auto_1414 ?auto_1412 ) ( IS-CRATE ?auto_1412 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1412 ?auto_1413 )
      ( MAKE-2CRATE-VERIFY ?auto_1411 ?auto_1412 ?auto_1413 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1420 - SURFACE
      ?auto_1421 - SURFACE
    )
    :vars
    (
      ?auto_1424 - HOIST
      ?auto_1423 - PLACE
      ?auto_1426 - SURFACE
      ?auto_1422 - PLACE
      ?auto_1425 - HOIST
      ?auto_1427 - SURFACE
      ?auto_1428 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1424 ?auto_1423 ) ( IS-CRATE ?auto_1421 ) ( not ( = ?auto_1420 ?auto_1421 ) ) ( not ( = ?auto_1426 ?auto_1420 ) ) ( not ( = ?auto_1426 ?auto_1421 ) ) ( not ( = ?auto_1422 ?auto_1423 ) ) ( HOIST-AT ?auto_1425 ?auto_1422 ) ( not ( = ?auto_1424 ?auto_1425 ) ) ( AVAILABLE ?auto_1425 ) ( SURFACE-AT ?auto_1421 ?auto_1422 ) ( ON ?auto_1421 ?auto_1427 ) ( CLEAR ?auto_1421 ) ( not ( = ?auto_1420 ?auto_1427 ) ) ( not ( = ?auto_1421 ?auto_1427 ) ) ( not ( = ?auto_1426 ?auto_1427 ) ) ( TRUCK-AT ?auto_1428 ?auto_1423 ) ( SURFACE-AT ?auto_1426 ?auto_1423 ) ( CLEAR ?auto_1426 ) ( IS-CRATE ?auto_1420 ) ( AVAILABLE ?auto_1424 ) ( IN ?auto_1420 ?auto_1428 ) )
    :subtasks
    ( ( !UNLOAD ?auto_1424 ?auto_1420 ?auto_1428 ?auto_1423 )
      ( MAKE-2CRATE ?auto_1426 ?auto_1420 ?auto_1421 )
      ( MAKE-1CRATE-VERIFY ?auto_1420 ?auto_1421 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1429 - SURFACE
      ?auto_1430 - SURFACE
      ?auto_1431 - SURFACE
    )
    :vars
    (
      ?auto_1434 - HOIST
      ?auto_1437 - PLACE
      ?auto_1436 - PLACE
      ?auto_1435 - HOIST
      ?auto_1432 - SURFACE
      ?auto_1433 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1434 ?auto_1437 ) ( IS-CRATE ?auto_1431 ) ( not ( = ?auto_1430 ?auto_1431 ) ) ( not ( = ?auto_1429 ?auto_1430 ) ) ( not ( = ?auto_1429 ?auto_1431 ) ) ( not ( = ?auto_1436 ?auto_1437 ) ) ( HOIST-AT ?auto_1435 ?auto_1436 ) ( not ( = ?auto_1434 ?auto_1435 ) ) ( AVAILABLE ?auto_1435 ) ( SURFACE-AT ?auto_1431 ?auto_1436 ) ( ON ?auto_1431 ?auto_1432 ) ( CLEAR ?auto_1431 ) ( not ( = ?auto_1430 ?auto_1432 ) ) ( not ( = ?auto_1431 ?auto_1432 ) ) ( not ( = ?auto_1429 ?auto_1432 ) ) ( TRUCK-AT ?auto_1433 ?auto_1437 ) ( SURFACE-AT ?auto_1429 ?auto_1437 ) ( CLEAR ?auto_1429 ) ( IS-CRATE ?auto_1430 ) ( AVAILABLE ?auto_1434 ) ( IN ?auto_1430 ?auto_1433 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1430 ?auto_1431 )
      ( MAKE-2CRATE-VERIFY ?auto_1429 ?auto_1430 ?auto_1431 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1438 - SURFACE
      ?auto_1439 - SURFACE
    )
    :vars
    (
      ?auto_1443 - HOIST
      ?auto_1442 - PLACE
      ?auto_1444 - SURFACE
      ?auto_1446 - PLACE
      ?auto_1445 - HOIST
      ?auto_1441 - SURFACE
      ?auto_1440 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1443 ?auto_1442 ) ( IS-CRATE ?auto_1439 ) ( not ( = ?auto_1438 ?auto_1439 ) ) ( not ( = ?auto_1444 ?auto_1438 ) ) ( not ( = ?auto_1444 ?auto_1439 ) ) ( not ( = ?auto_1446 ?auto_1442 ) ) ( HOIST-AT ?auto_1445 ?auto_1446 ) ( not ( = ?auto_1443 ?auto_1445 ) ) ( AVAILABLE ?auto_1445 ) ( SURFACE-AT ?auto_1439 ?auto_1446 ) ( ON ?auto_1439 ?auto_1441 ) ( CLEAR ?auto_1439 ) ( not ( = ?auto_1438 ?auto_1441 ) ) ( not ( = ?auto_1439 ?auto_1441 ) ) ( not ( = ?auto_1444 ?auto_1441 ) ) ( SURFACE-AT ?auto_1444 ?auto_1442 ) ( CLEAR ?auto_1444 ) ( IS-CRATE ?auto_1438 ) ( AVAILABLE ?auto_1443 ) ( IN ?auto_1438 ?auto_1440 ) ( TRUCK-AT ?auto_1440 ?auto_1446 ) )
    :subtasks
    ( ( !DRIVE ?auto_1440 ?auto_1446 ?auto_1442 )
      ( MAKE-2CRATE ?auto_1444 ?auto_1438 ?auto_1439 )
      ( MAKE-1CRATE-VERIFY ?auto_1438 ?auto_1439 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1447 - SURFACE
      ?auto_1448 - SURFACE
      ?auto_1449 - SURFACE
    )
    :vars
    (
      ?auto_1454 - HOIST
      ?auto_1452 - PLACE
      ?auto_1451 - PLACE
      ?auto_1450 - HOIST
      ?auto_1455 - SURFACE
      ?auto_1453 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1454 ?auto_1452 ) ( IS-CRATE ?auto_1449 ) ( not ( = ?auto_1448 ?auto_1449 ) ) ( not ( = ?auto_1447 ?auto_1448 ) ) ( not ( = ?auto_1447 ?auto_1449 ) ) ( not ( = ?auto_1451 ?auto_1452 ) ) ( HOIST-AT ?auto_1450 ?auto_1451 ) ( not ( = ?auto_1454 ?auto_1450 ) ) ( AVAILABLE ?auto_1450 ) ( SURFACE-AT ?auto_1449 ?auto_1451 ) ( ON ?auto_1449 ?auto_1455 ) ( CLEAR ?auto_1449 ) ( not ( = ?auto_1448 ?auto_1455 ) ) ( not ( = ?auto_1449 ?auto_1455 ) ) ( not ( = ?auto_1447 ?auto_1455 ) ) ( SURFACE-AT ?auto_1447 ?auto_1452 ) ( CLEAR ?auto_1447 ) ( IS-CRATE ?auto_1448 ) ( AVAILABLE ?auto_1454 ) ( IN ?auto_1448 ?auto_1453 ) ( TRUCK-AT ?auto_1453 ?auto_1451 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1448 ?auto_1449 )
      ( MAKE-2CRATE-VERIFY ?auto_1447 ?auto_1448 ?auto_1449 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1456 - SURFACE
      ?auto_1457 - SURFACE
    )
    :vars
    (
      ?auto_1459 - HOIST
      ?auto_1462 - PLACE
      ?auto_1464 - SURFACE
      ?auto_1461 - PLACE
      ?auto_1463 - HOIST
      ?auto_1460 - SURFACE
      ?auto_1458 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1459 ?auto_1462 ) ( IS-CRATE ?auto_1457 ) ( not ( = ?auto_1456 ?auto_1457 ) ) ( not ( = ?auto_1464 ?auto_1456 ) ) ( not ( = ?auto_1464 ?auto_1457 ) ) ( not ( = ?auto_1461 ?auto_1462 ) ) ( HOIST-AT ?auto_1463 ?auto_1461 ) ( not ( = ?auto_1459 ?auto_1463 ) ) ( SURFACE-AT ?auto_1457 ?auto_1461 ) ( ON ?auto_1457 ?auto_1460 ) ( CLEAR ?auto_1457 ) ( not ( = ?auto_1456 ?auto_1460 ) ) ( not ( = ?auto_1457 ?auto_1460 ) ) ( not ( = ?auto_1464 ?auto_1460 ) ) ( SURFACE-AT ?auto_1464 ?auto_1462 ) ( CLEAR ?auto_1464 ) ( IS-CRATE ?auto_1456 ) ( AVAILABLE ?auto_1459 ) ( TRUCK-AT ?auto_1458 ?auto_1461 ) ( LIFTING ?auto_1463 ?auto_1456 ) )
    :subtasks
    ( ( !LOAD ?auto_1463 ?auto_1456 ?auto_1458 ?auto_1461 )
      ( MAKE-2CRATE ?auto_1464 ?auto_1456 ?auto_1457 )
      ( MAKE-1CRATE-VERIFY ?auto_1456 ?auto_1457 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1465 - SURFACE
      ?auto_1466 - SURFACE
      ?auto_1467 - SURFACE
    )
    :vars
    (
      ?auto_1472 - HOIST
      ?auto_1470 - PLACE
      ?auto_1468 - PLACE
      ?auto_1471 - HOIST
      ?auto_1469 - SURFACE
      ?auto_1473 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1472 ?auto_1470 ) ( IS-CRATE ?auto_1467 ) ( not ( = ?auto_1466 ?auto_1467 ) ) ( not ( = ?auto_1465 ?auto_1466 ) ) ( not ( = ?auto_1465 ?auto_1467 ) ) ( not ( = ?auto_1468 ?auto_1470 ) ) ( HOIST-AT ?auto_1471 ?auto_1468 ) ( not ( = ?auto_1472 ?auto_1471 ) ) ( SURFACE-AT ?auto_1467 ?auto_1468 ) ( ON ?auto_1467 ?auto_1469 ) ( CLEAR ?auto_1467 ) ( not ( = ?auto_1466 ?auto_1469 ) ) ( not ( = ?auto_1467 ?auto_1469 ) ) ( not ( = ?auto_1465 ?auto_1469 ) ) ( SURFACE-AT ?auto_1465 ?auto_1470 ) ( CLEAR ?auto_1465 ) ( IS-CRATE ?auto_1466 ) ( AVAILABLE ?auto_1472 ) ( TRUCK-AT ?auto_1473 ?auto_1468 ) ( LIFTING ?auto_1471 ?auto_1466 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1466 ?auto_1467 )
      ( MAKE-2CRATE-VERIFY ?auto_1465 ?auto_1466 ?auto_1467 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1474 - SURFACE
      ?auto_1475 - SURFACE
    )
    :vars
    (
      ?auto_1480 - HOIST
      ?auto_1476 - PLACE
      ?auto_1482 - SURFACE
      ?auto_1481 - PLACE
      ?auto_1479 - HOIST
      ?auto_1478 - SURFACE
      ?auto_1477 - TRUCK
      ?auto_1483 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1480 ?auto_1476 ) ( IS-CRATE ?auto_1475 ) ( not ( = ?auto_1474 ?auto_1475 ) ) ( not ( = ?auto_1482 ?auto_1474 ) ) ( not ( = ?auto_1482 ?auto_1475 ) ) ( not ( = ?auto_1481 ?auto_1476 ) ) ( HOIST-AT ?auto_1479 ?auto_1481 ) ( not ( = ?auto_1480 ?auto_1479 ) ) ( SURFACE-AT ?auto_1475 ?auto_1481 ) ( ON ?auto_1475 ?auto_1478 ) ( CLEAR ?auto_1475 ) ( not ( = ?auto_1474 ?auto_1478 ) ) ( not ( = ?auto_1475 ?auto_1478 ) ) ( not ( = ?auto_1482 ?auto_1478 ) ) ( SURFACE-AT ?auto_1482 ?auto_1476 ) ( CLEAR ?auto_1482 ) ( IS-CRATE ?auto_1474 ) ( AVAILABLE ?auto_1480 ) ( TRUCK-AT ?auto_1477 ?auto_1481 ) ( AVAILABLE ?auto_1479 ) ( SURFACE-AT ?auto_1474 ?auto_1481 ) ( ON ?auto_1474 ?auto_1483 ) ( CLEAR ?auto_1474 ) ( not ( = ?auto_1474 ?auto_1483 ) ) ( not ( = ?auto_1475 ?auto_1483 ) ) ( not ( = ?auto_1482 ?auto_1483 ) ) ( not ( = ?auto_1478 ?auto_1483 ) ) )
    :subtasks
    ( ( !LIFT ?auto_1479 ?auto_1474 ?auto_1483 ?auto_1481 )
      ( MAKE-2CRATE ?auto_1482 ?auto_1474 ?auto_1475 )
      ( MAKE-1CRATE-VERIFY ?auto_1474 ?auto_1475 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1484 - SURFACE
      ?auto_1485 - SURFACE
      ?auto_1486 - SURFACE
    )
    :vars
    (
      ?auto_1493 - HOIST
      ?auto_1490 - PLACE
      ?auto_1488 - PLACE
      ?auto_1492 - HOIST
      ?auto_1489 - SURFACE
      ?auto_1491 - TRUCK
      ?auto_1487 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1493 ?auto_1490 ) ( IS-CRATE ?auto_1486 ) ( not ( = ?auto_1485 ?auto_1486 ) ) ( not ( = ?auto_1484 ?auto_1485 ) ) ( not ( = ?auto_1484 ?auto_1486 ) ) ( not ( = ?auto_1488 ?auto_1490 ) ) ( HOIST-AT ?auto_1492 ?auto_1488 ) ( not ( = ?auto_1493 ?auto_1492 ) ) ( SURFACE-AT ?auto_1486 ?auto_1488 ) ( ON ?auto_1486 ?auto_1489 ) ( CLEAR ?auto_1486 ) ( not ( = ?auto_1485 ?auto_1489 ) ) ( not ( = ?auto_1486 ?auto_1489 ) ) ( not ( = ?auto_1484 ?auto_1489 ) ) ( SURFACE-AT ?auto_1484 ?auto_1490 ) ( CLEAR ?auto_1484 ) ( IS-CRATE ?auto_1485 ) ( AVAILABLE ?auto_1493 ) ( TRUCK-AT ?auto_1491 ?auto_1488 ) ( AVAILABLE ?auto_1492 ) ( SURFACE-AT ?auto_1485 ?auto_1488 ) ( ON ?auto_1485 ?auto_1487 ) ( CLEAR ?auto_1485 ) ( not ( = ?auto_1485 ?auto_1487 ) ) ( not ( = ?auto_1486 ?auto_1487 ) ) ( not ( = ?auto_1484 ?auto_1487 ) ) ( not ( = ?auto_1489 ?auto_1487 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1485 ?auto_1486 )
      ( MAKE-2CRATE-VERIFY ?auto_1484 ?auto_1485 ?auto_1486 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1494 - SURFACE
      ?auto_1495 - SURFACE
    )
    :vars
    (
      ?auto_1497 - HOIST
      ?auto_1496 - PLACE
      ?auto_1503 - SURFACE
      ?auto_1500 - PLACE
      ?auto_1498 - HOIST
      ?auto_1501 - SURFACE
      ?auto_1502 - SURFACE
      ?auto_1499 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1497 ?auto_1496 ) ( IS-CRATE ?auto_1495 ) ( not ( = ?auto_1494 ?auto_1495 ) ) ( not ( = ?auto_1503 ?auto_1494 ) ) ( not ( = ?auto_1503 ?auto_1495 ) ) ( not ( = ?auto_1500 ?auto_1496 ) ) ( HOIST-AT ?auto_1498 ?auto_1500 ) ( not ( = ?auto_1497 ?auto_1498 ) ) ( SURFACE-AT ?auto_1495 ?auto_1500 ) ( ON ?auto_1495 ?auto_1501 ) ( CLEAR ?auto_1495 ) ( not ( = ?auto_1494 ?auto_1501 ) ) ( not ( = ?auto_1495 ?auto_1501 ) ) ( not ( = ?auto_1503 ?auto_1501 ) ) ( SURFACE-AT ?auto_1503 ?auto_1496 ) ( CLEAR ?auto_1503 ) ( IS-CRATE ?auto_1494 ) ( AVAILABLE ?auto_1497 ) ( AVAILABLE ?auto_1498 ) ( SURFACE-AT ?auto_1494 ?auto_1500 ) ( ON ?auto_1494 ?auto_1502 ) ( CLEAR ?auto_1494 ) ( not ( = ?auto_1494 ?auto_1502 ) ) ( not ( = ?auto_1495 ?auto_1502 ) ) ( not ( = ?auto_1503 ?auto_1502 ) ) ( not ( = ?auto_1501 ?auto_1502 ) ) ( TRUCK-AT ?auto_1499 ?auto_1496 ) )
    :subtasks
    ( ( !DRIVE ?auto_1499 ?auto_1496 ?auto_1500 )
      ( MAKE-2CRATE ?auto_1503 ?auto_1494 ?auto_1495 )
      ( MAKE-1CRATE-VERIFY ?auto_1494 ?auto_1495 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1504 - SURFACE
      ?auto_1505 - SURFACE
      ?auto_1506 - SURFACE
    )
    :vars
    (
      ?auto_1512 - HOIST
      ?auto_1509 - PLACE
      ?auto_1510 - PLACE
      ?auto_1511 - HOIST
      ?auto_1513 - SURFACE
      ?auto_1507 - SURFACE
      ?auto_1508 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1512 ?auto_1509 ) ( IS-CRATE ?auto_1506 ) ( not ( = ?auto_1505 ?auto_1506 ) ) ( not ( = ?auto_1504 ?auto_1505 ) ) ( not ( = ?auto_1504 ?auto_1506 ) ) ( not ( = ?auto_1510 ?auto_1509 ) ) ( HOIST-AT ?auto_1511 ?auto_1510 ) ( not ( = ?auto_1512 ?auto_1511 ) ) ( SURFACE-AT ?auto_1506 ?auto_1510 ) ( ON ?auto_1506 ?auto_1513 ) ( CLEAR ?auto_1506 ) ( not ( = ?auto_1505 ?auto_1513 ) ) ( not ( = ?auto_1506 ?auto_1513 ) ) ( not ( = ?auto_1504 ?auto_1513 ) ) ( SURFACE-AT ?auto_1504 ?auto_1509 ) ( CLEAR ?auto_1504 ) ( IS-CRATE ?auto_1505 ) ( AVAILABLE ?auto_1512 ) ( AVAILABLE ?auto_1511 ) ( SURFACE-AT ?auto_1505 ?auto_1510 ) ( ON ?auto_1505 ?auto_1507 ) ( CLEAR ?auto_1505 ) ( not ( = ?auto_1505 ?auto_1507 ) ) ( not ( = ?auto_1506 ?auto_1507 ) ) ( not ( = ?auto_1504 ?auto_1507 ) ) ( not ( = ?auto_1513 ?auto_1507 ) ) ( TRUCK-AT ?auto_1508 ?auto_1509 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1505 ?auto_1506 )
      ( MAKE-2CRATE-VERIFY ?auto_1504 ?auto_1505 ?auto_1506 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1523 - SURFACE
      ?auto_1524 - SURFACE
    )
    :vars
    (
      ?auto_1525 - HOIST
      ?auto_1526 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1525 ?auto_1526 ) ( SURFACE-AT ?auto_1523 ?auto_1526 ) ( CLEAR ?auto_1523 ) ( LIFTING ?auto_1525 ?auto_1524 ) ( IS-CRATE ?auto_1524 ) ( not ( = ?auto_1523 ?auto_1524 ) ) )
    :subtasks
    ( ( !DROP ?auto_1525 ?auto_1524 ?auto_1523 ?auto_1526 )
      ( MAKE-1CRATE-VERIFY ?auto_1523 ?auto_1524 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1527 - SURFACE
      ?auto_1528 - SURFACE
      ?auto_1529 - SURFACE
    )
    :vars
    (
      ?auto_1531 - HOIST
      ?auto_1530 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1531 ?auto_1530 ) ( SURFACE-AT ?auto_1528 ?auto_1530 ) ( CLEAR ?auto_1528 ) ( LIFTING ?auto_1531 ?auto_1529 ) ( IS-CRATE ?auto_1529 ) ( not ( = ?auto_1528 ?auto_1529 ) ) ( ON ?auto_1528 ?auto_1527 ) ( not ( = ?auto_1527 ?auto_1528 ) ) ( not ( = ?auto_1527 ?auto_1529 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1528 ?auto_1529 )
      ( MAKE-2CRATE-VERIFY ?auto_1527 ?auto_1528 ?auto_1529 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1532 - SURFACE
      ?auto_1533 - SURFACE
      ?auto_1534 - SURFACE
      ?auto_1535 - SURFACE
    )
    :vars
    (
      ?auto_1537 - HOIST
      ?auto_1536 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1537 ?auto_1536 ) ( SURFACE-AT ?auto_1534 ?auto_1536 ) ( CLEAR ?auto_1534 ) ( LIFTING ?auto_1537 ?auto_1535 ) ( IS-CRATE ?auto_1535 ) ( not ( = ?auto_1534 ?auto_1535 ) ) ( ON ?auto_1533 ?auto_1532 ) ( ON ?auto_1534 ?auto_1533 ) ( not ( = ?auto_1532 ?auto_1533 ) ) ( not ( = ?auto_1532 ?auto_1534 ) ) ( not ( = ?auto_1532 ?auto_1535 ) ) ( not ( = ?auto_1533 ?auto_1534 ) ) ( not ( = ?auto_1533 ?auto_1535 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1534 ?auto_1535 )
      ( MAKE-3CRATE-VERIFY ?auto_1532 ?auto_1533 ?auto_1534 ?auto_1535 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1538 - SURFACE
      ?auto_1539 - SURFACE
    )
    :vars
    (
      ?auto_1541 - HOIST
      ?auto_1540 - PLACE
      ?auto_1542 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1541 ?auto_1540 ) ( SURFACE-AT ?auto_1538 ?auto_1540 ) ( CLEAR ?auto_1538 ) ( IS-CRATE ?auto_1539 ) ( not ( = ?auto_1538 ?auto_1539 ) ) ( TRUCK-AT ?auto_1542 ?auto_1540 ) ( AVAILABLE ?auto_1541 ) ( IN ?auto_1539 ?auto_1542 ) )
    :subtasks
    ( ( !UNLOAD ?auto_1541 ?auto_1539 ?auto_1542 ?auto_1540 )
      ( MAKE-1CRATE ?auto_1538 ?auto_1539 )
      ( MAKE-1CRATE-VERIFY ?auto_1538 ?auto_1539 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1543 - SURFACE
      ?auto_1544 - SURFACE
      ?auto_1545 - SURFACE
    )
    :vars
    (
      ?auto_1548 - HOIST
      ?auto_1546 - PLACE
      ?auto_1547 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1548 ?auto_1546 ) ( SURFACE-AT ?auto_1544 ?auto_1546 ) ( CLEAR ?auto_1544 ) ( IS-CRATE ?auto_1545 ) ( not ( = ?auto_1544 ?auto_1545 ) ) ( TRUCK-AT ?auto_1547 ?auto_1546 ) ( AVAILABLE ?auto_1548 ) ( IN ?auto_1545 ?auto_1547 ) ( ON ?auto_1544 ?auto_1543 ) ( not ( = ?auto_1543 ?auto_1544 ) ) ( not ( = ?auto_1543 ?auto_1545 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1544 ?auto_1545 )
      ( MAKE-2CRATE-VERIFY ?auto_1543 ?auto_1544 ?auto_1545 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1549 - SURFACE
      ?auto_1550 - SURFACE
      ?auto_1551 - SURFACE
      ?auto_1552 - SURFACE
    )
    :vars
    (
      ?auto_1555 - HOIST
      ?auto_1554 - PLACE
      ?auto_1553 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1555 ?auto_1554 ) ( SURFACE-AT ?auto_1551 ?auto_1554 ) ( CLEAR ?auto_1551 ) ( IS-CRATE ?auto_1552 ) ( not ( = ?auto_1551 ?auto_1552 ) ) ( TRUCK-AT ?auto_1553 ?auto_1554 ) ( AVAILABLE ?auto_1555 ) ( IN ?auto_1552 ?auto_1553 ) ( ON ?auto_1551 ?auto_1550 ) ( not ( = ?auto_1550 ?auto_1551 ) ) ( not ( = ?auto_1550 ?auto_1552 ) ) ( ON ?auto_1550 ?auto_1549 ) ( not ( = ?auto_1549 ?auto_1550 ) ) ( not ( = ?auto_1549 ?auto_1551 ) ) ( not ( = ?auto_1549 ?auto_1552 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1550 ?auto_1551 ?auto_1552 )
      ( MAKE-3CRATE-VERIFY ?auto_1549 ?auto_1550 ?auto_1551 ?auto_1552 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1556 - SURFACE
      ?auto_1557 - SURFACE
    )
    :vars
    (
      ?auto_1560 - HOIST
      ?auto_1559 - PLACE
      ?auto_1558 - TRUCK
      ?auto_1561 - SURFACE
      ?auto_1562 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1560 ?auto_1559 ) ( SURFACE-AT ?auto_1556 ?auto_1559 ) ( CLEAR ?auto_1556 ) ( IS-CRATE ?auto_1557 ) ( not ( = ?auto_1556 ?auto_1557 ) ) ( AVAILABLE ?auto_1560 ) ( IN ?auto_1557 ?auto_1558 ) ( ON ?auto_1556 ?auto_1561 ) ( not ( = ?auto_1561 ?auto_1556 ) ) ( not ( = ?auto_1561 ?auto_1557 ) ) ( TRUCK-AT ?auto_1558 ?auto_1562 ) ( not ( = ?auto_1562 ?auto_1559 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1558 ?auto_1562 ?auto_1559 )
      ( MAKE-2CRATE ?auto_1561 ?auto_1556 ?auto_1557 )
      ( MAKE-1CRATE-VERIFY ?auto_1556 ?auto_1557 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1563 - SURFACE
      ?auto_1564 - SURFACE
      ?auto_1565 - SURFACE
    )
    :vars
    (
      ?auto_1566 - HOIST
      ?auto_1569 - PLACE
      ?auto_1567 - TRUCK
      ?auto_1568 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1566 ?auto_1569 ) ( SURFACE-AT ?auto_1564 ?auto_1569 ) ( CLEAR ?auto_1564 ) ( IS-CRATE ?auto_1565 ) ( not ( = ?auto_1564 ?auto_1565 ) ) ( AVAILABLE ?auto_1566 ) ( IN ?auto_1565 ?auto_1567 ) ( ON ?auto_1564 ?auto_1563 ) ( not ( = ?auto_1563 ?auto_1564 ) ) ( not ( = ?auto_1563 ?auto_1565 ) ) ( TRUCK-AT ?auto_1567 ?auto_1568 ) ( not ( = ?auto_1568 ?auto_1569 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1564 ?auto_1565 )
      ( MAKE-2CRATE-VERIFY ?auto_1563 ?auto_1564 ?auto_1565 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1570 - SURFACE
      ?auto_1571 - SURFACE
      ?auto_1572 - SURFACE
      ?auto_1573 - SURFACE
    )
    :vars
    (
      ?auto_1577 - HOIST
      ?auto_1576 - PLACE
      ?auto_1574 - TRUCK
      ?auto_1575 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1577 ?auto_1576 ) ( SURFACE-AT ?auto_1572 ?auto_1576 ) ( CLEAR ?auto_1572 ) ( IS-CRATE ?auto_1573 ) ( not ( = ?auto_1572 ?auto_1573 ) ) ( AVAILABLE ?auto_1577 ) ( IN ?auto_1573 ?auto_1574 ) ( ON ?auto_1572 ?auto_1571 ) ( not ( = ?auto_1571 ?auto_1572 ) ) ( not ( = ?auto_1571 ?auto_1573 ) ) ( TRUCK-AT ?auto_1574 ?auto_1575 ) ( not ( = ?auto_1575 ?auto_1576 ) ) ( ON ?auto_1571 ?auto_1570 ) ( not ( = ?auto_1570 ?auto_1571 ) ) ( not ( = ?auto_1570 ?auto_1572 ) ) ( not ( = ?auto_1570 ?auto_1573 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1571 ?auto_1572 ?auto_1573 )
      ( MAKE-3CRATE-VERIFY ?auto_1570 ?auto_1571 ?auto_1572 ?auto_1573 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1578 - SURFACE
      ?auto_1579 - SURFACE
    )
    :vars
    (
      ?auto_1583 - HOIST
      ?auto_1582 - PLACE
      ?auto_1584 - SURFACE
      ?auto_1580 - TRUCK
      ?auto_1581 - PLACE
      ?auto_1585 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1583 ?auto_1582 ) ( SURFACE-AT ?auto_1578 ?auto_1582 ) ( CLEAR ?auto_1578 ) ( IS-CRATE ?auto_1579 ) ( not ( = ?auto_1578 ?auto_1579 ) ) ( AVAILABLE ?auto_1583 ) ( ON ?auto_1578 ?auto_1584 ) ( not ( = ?auto_1584 ?auto_1578 ) ) ( not ( = ?auto_1584 ?auto_1579 ) ) ( TRUCK-AT ?auto_1580 ?auto_1581 ) ( not ( = ?auto_1581 ?auto_1582 ) ) ( HOIST-AT ?auto_1585 ?auto_1581 ) ( LIFTING ?auto_1585 ?auto_1579 ) ( not ( = ?auto_1583 ?auto_1585 ) ) )
    :subtasks
    ( ( !LOAD ?auto_1585 ?auto_1579 ?auto_1580 ?auto_1581 )
      ( MAKE-2CRATE ?auto_1584 ?auto_1578 ?auto_1579 )
      ( MAKE-1CRATE-VERIFY ?auto_1578 ?auto_1579 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1586 - SURFACE
      ?auto_1587 - SURFACE
      ?auto_1588 - SURFACE
    )
    :vars
    (
      ?auto_1589 - HOIST
      ?auto_1593 - PLACE
      ?auto_1591 - TRUCK
      ?auto_1590 - PLACE
      ?auto_1592 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1589 ?auto_1593 ) ( SURFACE-AT ?auto_1587 ?auto_1593 ) ( CLEAR ?auto_1587 ) ( IS-CRATE ?auto_1588 ) ( not ( = ?auto_1587 ?auto_1588 ) ) ( AVAILABLE ?auto_1589 ) ( ON ?auto_1587 ?auto_1586 ) ( not ( = ?auto_1586 ?auto_1587 ) ) ( not ( = ?auto_1586 ?auto_1588 ) ) ( TRUCK-AT ?auto_1591 ?auto_1590 ) ( not ( = ?auto_1590 ?auto_1593 ) ) ( HOIST-AT ?auto_1592 ?auto_1590 ) ( LIFTING ?auto_1592 ?auto_1588 ) ( not ( = ?auto_1589 ?auto_1592 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1587 ?auto_1588 )
      ( MAKE-2CRATE-VERIFY ?auto_1586 ?auto_1587 ?auto_1588 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1594 - SURFACE
      ?auto_1595 - SURFACE
      ?auto_1596 - SURFACE
      ?auto_1597 - SURFACE
    )
    :vars
    (
      ?auto_1599 - HOIST
      ?auto_1601 - PLACE
      ?auto_1602 - TRUCK
      ?auto_1598 - PLACE
      ?auto_1600 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1599 ?auto_1601 ) ( SURFACE-AT ?auto_1596 ?auto_1601 ) ( CLEAR ?auto_1596 ) ( IS-CRATE ?auto_1597 ) ( not ( = ?auto_1596 ?auto_1597 ) ) ( AVAILABLE ?auto_1599 ) ( ON ?auto_1596 ?auto_1595 ) ( not ( = ?auto_1595 ?auto_1596 ) ) ( not ( = ?auto_1595 ?auto_1597 ) ) ( TRUCK-AT ?auto_1602 ?auto_1598 ) ( not ( = ?auto_1598 ?auto_1601 ) ) ( HOIST-AT ?auto_1600 ?auto_1598 ) ( LIFTING ?auto_1600 ?auto_1597 ) ( not ( = ?auto_1599 ?auto_1600 ) ) ( ON ?auto_1595 ?auto_1594 ) ( not ( = ?auto_1594 ?auto_1595 ) ) ( not ( = ?auto_1594 ?auto_1596 ) ) ( not ( = ?auto_1594 ?auto_1597 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1595 ?auto_1596 ?auto_1597 )
      ( MAKE-3CRATE-VERIFY ?auto_1594 ?auto_1595 ?auto_1596 ?auto_1597 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1603 - SURFACE
      ?auto_1604 - SURFACE
    )
    :vars
    (
      ?auto_1606 - HOIST
      ?auto_1608 - PLACE
      ?auto_1610 - SURFACE
      ?auto_1609 - TRUCK
      ?auto_1605 - PLACE
      ?auto_1607 - HOIST
      ?auto_1611 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1606 ?auto_1608 ) ( SURFACE-AT ?auto_1603 ?auto_1608 ) ( CLEAR ?auto_1603 ) ( IS-CRATE ?auto_1604 ) ( not ( = ?auto_1603 ?auto_1604 ) ) ( AVAILABLE ?auto_1606 ) ( ON ?auto_1603 ?auto_1610 ) ( not ( = ?auto_1610 ?auto_1603 ) ) ( not ( = ?auto_1610 ?auto_1604 ) ) ( TRUCK-AT ?auto_1609 ?auto_1605 ) ( not ( = ?auto_1605 ?auto_1608 ) ) ( HOIST-AT ?auto_1607 ?auto_1605 ) ( not ( = ?auto_1606 ?auto_1607 ) ) ( AVAILABLE ?auto_1607 ) ( SURFACE-AT ?auto_1604 ?auto_1605 ) ( ON ?auto_1604 ?auto_1611 ) ( CLEAR ?auto_1604 ) ( not ( = ?auto_1603 ?auto_1611 ) ) ( not ( = ?auto_1604 ?auto_1611 ) ) ( not ( = ?auto_1610 ?auto_1611 ) ) )
    :subtasks
    ( ( !LIFT ?auto_1607 ?auto_1604 ?auto_1611 ?auto_1605 )
      ( MAKE-2CRATE ?auto_1610 ?auto_1603 ?auto_1604 )
      ( MAKE-1CRATE-VERIFY ?auto_1603 ?auto_1604 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1612 - SURFACE
      ?auto_1613 - SURFACE
      ?auto_1614 - SURFACE
    )
    :vars
    (
      ?auto_1619 - HOIST
      ?auto_1615 - PLACE
      ?auto_1617 - TRUCK
      ?auto_1616 - PLACE
      ?auto_1618 - HOIST
      ?auto_1620 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1619 ?auto_1615 ) ( SURFACE-AT ?auto_1613 ?auto_1615 ) ( CLEAR ?auto_1613 ) ( IS-CRATE ?auto_1614 ) ( not ( = ?auto_1613 ?auto_1614 ) ) ( AVAILABLE ?auto_1619 ) ( ON ?auto_1613 ?auto_1612 ) ( not ( = ?auto_1612 ?auto_1613 ) ) ( not ( = ?auto_1612 ?auto_1614 ) ) ( TRUCK-AT ?auto_1617 ?auto_1616 ) ( not ( = ?auto_1616 ?auto_1615 ) ) ( HOIST-AT ?auto_1618 ?auto_1616 ) ( not ( = ?auto_1619 ?auto_1618 ) ) ( AVAILABLE ?auto_1618 ) ( SURFACE-AT ?auto_1614 ?auto_1616 ) ( ON ?auto_1614 ?auto_1620 ) ( CLEAR ?auto_1614 ) ( not ( = ?auto_1613 ?auto_1620 ) ) ( not ( = ?auto_1614 ?auto_1620 ) ) ( not ( = ?auto_1612 ?auto_1620 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1613 ?auto_1614 )
      ( MAKE-2CRATE-VERIFY ?auto_1612 ?auto_1613 ?auto_1614 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1621 - SURFACE
      ?auto_1622 - SURFACE
      ?auto_1623 - SURFACE
      ?auto_1624 - SURFACE
    )
    :vars
    (
      ?auto_1629 - HOIST
      ?auto_1626 - PLACE
      ?auto_1630 - TRUCK
      ?auto_1627 - PLACE
      ?auto_1625 - HOIST
      ?auto_1628 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1629 ?auto_1626 ) ( SURFACE-AT ?auto_1623 ?auto_1626 ) ( CLEAR ?auto_1623 ) ( IS-CRATE ?auto_1624 ) ( not ( = ?auto_1623 ?auto_1624 ) ) ( AVAILABLE ?auto_1629 ) ( ON ?auto_1623 ?auto_1622 ) ( not ( = ?auto_1622 ?auto_1623 ) ) ( not ( = ?auto_1622 ?auto_1624 ) ) ( TRUCK-AT ?auto_1630 ?auto_1627 ) ( not ( = ?auto_1627 ?auto_1626 ) ) ( HOIST-AT ?auto_1625 ?auto_1627 ) ( not ( = ?auto_1629 ?auto_1625 ) ) ( AVAILABLE ?auto_1625 ) ( SURFACE-AT ?auto_1624 ?auto_1627 ) ( ON ?auto_1624 ?auto_1628 ) ( CLEAR ?auto_1624 ) ( not ( = ?auto_1623 ?auto_1628 ) ) ( not ( = ?auto_1624 ?auto_1628 ) ) ( not ( = ?auto_1622 ?auto_1628 ) ) ( ON ?auto_1622 ?auto_1621 ) ( not ( = ?auto_1621 ?auto_1622 ) ) ( not ( = ?auto_1621 ?auto_1623 ) ) ( not ( = ?auto_1621 ?auto_1624 ) ) ( not ( = ?auto_1621 ?auto_1628 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1622 ?auto_1623 ?auto_1624 )
      ( MAKE-3CRATE-VERIFY ?auto_1621 ?auto_1622 ?auto_1623 ?auto_1624 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1631 - SURFACE
      ?auto_1632 - SURFACE
    )
    :vars
    (
      ?auto_1637 - HOIST
      ?auto_1634 - PLACE
      ?auto_1639 - SURFACE
      ?auto_1635 - PLACE
      ?auto_1633 - HOIST
      ?auto_1636 - SURFACE
      ?auto_1638 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1637 ?auto_1634 ) ( SURFACE-AT ?auto_1631 ?auto_1634 ) ( CLEAR ?auto_1631 ) ( IS-CRATE ?auto_1632 ) ( not ( = ?auto_1631 ?auto_1632 ) ) ( AVAILABLE ?auto_1637 ) ( ON ?auto_1631 ?auto_1639 ) ( not ( = ?auto_1639 ?auto_1631 ) ) ( not ( = ?auto_1639 ?auto_1632 ) ) ( not ( = ?auto_1635 ?auto_1634 ) ) ( HOIST-AT ?auto_1633 ?auto_1635 ) ( not ( = ?auto_1637 ?auto_1633 ) ) ( AVAILABLE ?auto_1633 ) ( SURFACE-AT ?auto_1632 ?auto_1635 ) ( ON ?auto_1632 ?auto_1636 ) ( CLEAR ?auto_1632 ) ( not ( = ?auto_1631 ?auto_1636 ) ) ( not ( = ?auto_1632 ?auto_1636 ) ) ( not ( = ?auto_1639 ?auto_1636 ) ) ( TRUCK-AT ?auto_1638 ?auto_1634 ) )
    :subtasks
    ( ( !DRIVE ?auto_1638 ?auto_1634 ?auto_1635 )
      ( MAKE-2CRATE ?auto_1639 ?auto_1631 ?auto_1632 )
      ( MAKE-1CRATE-VERIFY ?auto_1631 ?auto_1632 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1640 - SURFACE
      ?auto_1641 - SURFACE
      ?auto_1642 - SURFACE
    )
    :vars
    (
      ?auto_1643 - HOIST
      ?auto_1646 - PLACE
      ?auto_1644 - PLACE
      ?auto_1648 - HOIST
      ?auto_1647 - SURFACE
      ?auto_1645 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1643 ?auto_1646 ) ( SURFACE-AT ?auto_1641 ?auto_1646 ) ( CLEAR ?auto_1641 ) ( IS-CRATE ?auto_1642 ) ( not ( = ?auto_1641 ?auto_1642 ) ) ( AVAILABLE ?auto_1643 ) ( ON ?auto_1641 ?auto_1640 ) ( not ( = ?auto_1640 ?auto_1641 ) ) ( not ( = ?auto_1640 ?auto_1642 ) ) ( not ( = ?auto_1644 ?auto_1646 ) ) ( HOIST-AT ?auto_1648 ?auto_1644 ) ( not ( = ?auto_1643 ?auto_1648 ) ) ( AVAILABLE ?auto_1648 ) ( SURFACE-AT ?auto_1642 ?auto_1644 ) ( ON ?auto_1642 ?auto_1647 ) ( CLEAR ?auto_1642 ) ( not ( = ?auto_1641 ?auto_1647 ) ) ( not ( = ?auto_1642 ?auto_1647 ) ) ( not ( = ?auto_1640 ?auto_1647 ) ) ( TRUCK-AT ?auto_1645 ?auto_1646 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1641 ?auto_1642 )
      ( MAKE-2CRATE-VERIFY ?auto_1640 ?auto_1641 ?auto_1642 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1649 - SURFACE
      ?auto_1650 - SURFACE
      ?auto_1651 - SURFACE
      ?auto_1652 - SURFACE
    )
    :vars
    (
      ?auto_1656 - HOIST
      ?auto_1653 - PLACE
      ?auto_1658 - PLACE
      ?auto_1654 - HOIST
      ?auto_1657 - SURFACE
      ?auto_1655 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1656 ?auto_1653 ) ( SURFACE-AT ?auto_1651 ?auto_1653 ) ( CLEAR ?auto_1651 ) ( IS-CRATE ?auto_1652 ) ( not ( = ?auto_1651 ?auto_1652 ) ) ( AVAILABLE ?auto_1656 ) ( ON ?auto_1651 ?auto_1650 ) ( not ( = ?auto_1650 ?auto_1651 ) ) ( not ( = ?auto_1650 ?auto_1652 ) ) ( not ( = ?auto_1658 ?auto_1653 ) ) ( HOIST-AT ?auto_1654 ?auto_1658 ) ( not ( = ?auto_1656 ?auto_1654 ) ) ( AVAILABLE ?auto_1654 ) ( SURFACE-AT ?auto_1652 ?auto_1658 ) ( ON ?auto_1652 ?auto_1657 ) ( CLEAR ?auto_1652 ) ( not ( = ?auto_1651 ?auto_1657 ) ) ( not ( = ?auto_1652 ?auto_1657 ) ) ( not ( = ?auto_1650 ?auto_1657 ) ) ( TRUCK-AT ?auto_1655 ?auto_1653 ) ( ON ?auto_1650 ?auto_1649 ) ( not ( = ?auto_1649 ?auto_1650 ) ) ( not ( = ?auto_1649 ?auto_1651 ) ) ( not ( = ?auto_1649 ?auto_1652 ) ) ( not ( = ?auto_1649 ?auto_1657 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1650 ?auto_1651 ?auto_1652 )
      ( MAKE-3CRATE-VERIFY ?auto_1649 ?auto_1650 ?auto_1651 ?auto_1652 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1659 - SURFACE
      ?auto_1660 - SURFACE
    )
    :vars
    (
      ?auto_1664 - HOIST
      ?auto_1661 - PLACE
      ?auto_1667 - SURFACE
      ?auto_1666 - PLACE
      ?auto_1662 - HOIST
      ?auto_1665 - SURFACE
      ?auto_1663 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1664 ?auto_1661 ) ( IS-CRATE ?auto_1660 ) ( not ( = ?auto_1659 ?auto_1660 ) ) ( not ( = ?auto_1667 ?auto_1659 ) ) ( not ( = ?auto_1667 ?auto_1660 ) ) ( not ( = ?auto_1666 ?auto_1661 ) ) ( HOIST-AT ?auto_1662 ?auto_1666 ) ( not ( = ?auto_1664 ?auto_1662 ) ) ( AVAILABLE ?auto_1662 ) ( SURFACE-AT ?auto_1660 ?auto_1666 ) ( ON ?auto_1660 ?auto_1665 ) ( CLEAR ?auto_1660 ) ( not ( = ?auto_1659 ?auto_1665 ) ) ( not ( = ?auto_1660 ?auto_1665 ) ) ( not ( = ?auto_1667 ?auto_1665 ) ) ( TRUCK-AT ?auto_1663 ?auto_1661 ) ( SURFACE-AT ?auto_1667 ?auto_1661 ) ( CLEAR ?auto_1667 ) ( LIFTING ?auto_1664 ?auto_1659 ) ( IS-CRATE ?auto_1659 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1667 ?auto_1659 )
      ( MAKE-2CRATE ?auto_1667 ?auto_1659 ?auto_1660 )
      ( MAKE-1CRATE-VERIFY ?auto_1659 ?auto_1660 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1668 - SURFACE
      ?auto_1669 - SURFACE
      ?auto_1670 - SURFACE
    )
    :vars
    (
      ?auto_1672 - HOIST
      ?auto_1671 - PLACE
      ?auto_1674 - PLACE
      ?auto_1675 - HOIST
      ?auto_1676 - SURFACE
      ?auto_1673 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1672 ?auto_1671 ) ( IS-CRATE ?auto_1670 ) ( not ( = ?auto_1669 ?auto_1670 ) ) ( not ( = ?auto_1668 ?auto_1669 ) ) ( not ( = ?auto_1668 ?auto_1670 ) ) ( not ( = ?auto_1674 ?auto_1671 ) ) ( HOIST-AT ?auto_1675 ?auto_1674 ) ( not ( = ?auto_1672 ?auto_1675 ) ) ( AVAILABLE ?auto_1675 ) ( SURFACE-AT ?auto_1670 ?auto_1674 ) ( ON ?auto_1670 ?auto_1676 ) ( CLEAR ?auto_1670 ) ( not ( = ?auto_1669 ?auto_1676 ) ) ( not ( = ?auto_1670 ?auto_1676 ) ) ( not ( = ?auto_1668 ?auto_1676 ) ) ( TRUCK-AT ?auto_1673 ?auto_1671 ) ( SURFACE-AT ?auto_1668 ?auto_1671 ) ( CLEAR ?auto_1668 ) ( LIFTING ?auto_1672 ?auto_1669 ) ( IS-CRATE ?auto_1669 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1669 ?auto_1670 )
      ( MAKE-2CRATE-VERIFY ?auto_1668 ?auto_1669 ?auto_1670 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1677 - SURFACE
      ?auto_1678 - SURFACE
      ?auto_1679 - SURFACE
      ?auto_1680 - SURFACE
    )
    :vars
    (
      ?auto_1684 - HOIST
      ?auto_1683 - PLACE
      ?auto_1685 - PLACE
      ?auto_1686 - HOIST
      ?auto_1681 - SURFACE
      ?auto_1682 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1684 ?auto_1683 ) ( IS-CRATE ?auto_1680 ) ( not ( = ?auto_1679 ?auto_1680 ) ) ( not ( = ?auto_1678 ?auto_1679 ) ) ( not ( = ?auto_1678 ?auto_1680 ) ) ( not ( = ?auto_1685 ?auto_1683 ) ) ( HOIST-AT ?auto_1686 ?auto_1685 ) ( not ( = ?auto_1684 ?auto_1686 ) ) ( AVAILABLE ?auto_1686 ) ( SURFACE-AT ?auto_1680 ?auto_1685 ) ( ON ?auto_1680 ?auto_1681 ) ( CLEAR ?auto_1680 ) ( not ( = ?auto_1679 ?auto_1681 ) ) ( not ( = ?auto_1680 ?auto_1681 ) ) ( not ( = ?auto_1678 ?auto_1681 ) ) ( TRUCK-AT ?auto_1682 ?auto_1683 ) ( SURFACE-AT ?auto_1678 ?auto_1683 ) ( CLEAR ?auto_1678 ) ( LIFTING ?auto_1684 ?auto_1679 ) ( IS-CRATE ?auto_1679 ) ( ON ?auto_1678 ?auto_1677 ) ( not ( = ?auto_1677 ?auto_1678 ) ) ( not ( = ?auto_1677 ?auto_1679 ) ) ( not ( = ?auto_1677 ?auto_1680 ) ) ( not ( = ?auto_1677 ?auto_1681 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1678 ?auto_1679 ?auto_1680 )
      ( MAKE-3CRATE-VERIFY ?auto_1677 ?auto_1678 ?auto_1679 ?auto_1680 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1687 - SURFACE
      ?auto_1688 - SURFACE
    )
    :vars
    (
      ?auto_1692 - HOIST
      ?auto_1691 - PLACE
      ?auto_1695 - SURFACE
      ?auto_1693 - PLACE
      ?auto_1694 - HOIST
      ?auto_1689 - SURFACE
      ?auto_1690 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1692 ?auto_1691 ) ( IS-CRATE ?auto_1688 ) ( not ( = ?auto_1687 ?auto_1688 ) ) ( not ( = ?auto_1695 ?auto_1687 ) ) ( not ( = ?auto_1695 ?auto_1688 ) ) ( not ( = ?auto_1693 ?auto_1691 ) ) ( HOIST-AT ?auto_1694 ?auto_1693 ) ( not ( = ?auto_1692 ?auto_1694 ) ) ( AVAILABLE ?auto_1694 ) ( SURFACE-AT ?auto_1688 ?auto_1693 ) ( ON ?auto_1688 ?auto_1689 ) ( CLEAR ?auto_1688 ) ( not ( = ?auto_1687 ?auto_1689 ) ) ( not ( = ?auto_1688 ?auto_1689 ) ) ( not ( = ?auto_1695 ?auto_1689 ) ) ( TRUCK-AT ?auto_1690 ?auto_1691 ) ( SURFACE-AT ?auto_1695 ?auto_1691 ) ( CLEAR ?auto_1695 ) ( IS-CRATE ?auto_1687 ) ( AVAILABLE ?auto_1692 ) ( IN ?auto_1687 ?auto_1690 ) )
    :subtasks
    ( ( !UNLOAD ?auto_1692 ?auto_1687 ?auto_1690 ?auto_1691 )
      ( MAKE-2CRATE ?auto_1695 ?auto_1687 ?auto_1688 )
      ( MAKE-1CRATE-VERIFY ?auto_1687 ?auto_1688 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1696 - SURFACE
      ?auto_1697 - SURFACE
      ?auto_1698 - SURFACE
    )
    :vars
    (
      ?auto_1702 - HOIST
      ?auto_1704 - PLACE
      ?auto_1703 - PLACE
      ?auto_1701 - HOIST
      ?auto_1699 - SURFACE
      ?auto_1700 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1702 ?auto_1704 ) ( IS-CRATE ?auto_1698 ) ( not ( = ?auto_1697 ?auto_1698 ) ) ( not ( = ?auto_1696 ?auto_1697 ) ) ( not ( = ?auto_1696 ?auto_1698 ) ) ( not ( = ?auto_1703 ?auto_1704 ) ) ( HOIST-AT ?auto_1701 ?auto_1703 ) ( not ( = ?auto_1702 ?auto_1701 ) ) ( AVAILABLE ?auto_1701 ) ( SURFACE-AT ?auto_1698 ?auto_1703 ) ( ON ?auto_1698 ?auto_1699 ) ( CLEAR ?auto_1698 ) ( not ( = ?auto_1697 ?auto_1699 ) ) ( not ( = ?auto_1698 ?auto_1699 ) ) ( not ( = ?auto_1696 ?auto_1699 ) ) ( TRUCK-AT ?auto_1700 ?auto_1704 ) ( SURFACE-AT ?auto_1696 ?auto_1704 ) ( CLEAR ?auto_1696 ) ( IS-CRATE ?auto_1697 ) ( AVAILABLE ?auto_1702 ) ( IN ?auto_1697 ?auto_1700 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1697 ?auto_1698 )
      ( MAKE-2CRATE-VERIFY ?auto_1696 ?auto_1697 ?auto_1698 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1705 - SURFACE
      ?auto_1706 - SURFACE
      ?auto_1707 - SURFACE
      ?auto_1708 - SURFACE
    )
    :vars
    (
      ?auto_1710 - HOIST
      ?auto_1709 - PLACE
      ?auto_1714 - PLACE
      ?auto_1713 - HOIST
      ?auto_1711 - SURFACE
      ?auto_1712 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1710 ?auto_1709 ) ( IS-CRATE ?auto_1708 ) ( not ( = ?auto_1707 ?auto_1708 ) ) ( not ( = ?auto_1706 ?auto_1707 ) ) ( not ( = ?auto_1706 ?auto_1708 ) ) ( not ( = ?auto_1714 ?auto_1709 ) ) ( HOIST-AT ?auto_1713 ?auto_1714 ) ( not ( = ?auto_1710 ?auto_1713 ) ) ( AVAILABLE ?auto_1713 ) ( SURFACE-AT ?auto_1708 ?auto_1714 ) ( ON ?auto_1708 ?auto_1711 ) ( CLEAR ?auto_1708 ) ( not ( = ?auto_1707 ?auto_1711 ) ) ( not ( = ?auto_1708 ?auto_1711 ) ) ( not ( = ?auto_1706 ?auto_1711 ) ) ( TRUCK-AT ?auto_1712 ?auto_1709 ) ( SURFACE-AT ?auto_1706 ?auto_1709 ) ( CLEAR ?auto_1706 ) ( IS-CRATE ?auto_1707 ) ( AVAILABLE ?auto_1710 ) ( IN ?auto_1707 ?auto_1712 ) ( ON ?auto_1706 ?auto_1705 ) ( not ( = ?auto_1705 ?auto_1706 ) ) ( not ( = ?auto_1705 ?auto_1707 ) ) ( not ( = ?auto_1705 ?auto_1708 ) ) ( not ( = ?auto_1705 ?auto_1711 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1706 ?auto_1707 ?auto_1708 )
      ( MAKE-3CRATE-VERIFY ?auto_1705 ?auto_1706 ?auto_1707 ?auto_1708 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1715 - SURFACE
      ?auto_1716 - SURFACE
    )
    :vars
    (
      ?auto_1718 - HOIST
      ?auto_1717 - PLACE
      ?auto_1723 - SURFACE
      ?auto_1722 - PLACE
      ?auto_1721 - HOIST
      ?auto_1719 - SURFACE
      ?auto_1720 - TRUCK
      ?auto_1724 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1718 ?auto_1717 ) ( IS-CRATE ?auto_1716 ) ( not ( = ?auto_1715 ?auto_1716 ) ) ( not ( = ?auto_1723 ?auto_1715 ) ) ( not ( = ?auto_1723 ?auto_1716 ) ) ( not ( = ?auto_1722 ?auto_1717 ) ) ( HOIST-AT ?auto_1721 ?auto_1722 ) ( not ( = ?auto_1718 ?auto_1721 ) ) ( AVAILABLE ?auto_1721 ) ( SURFACE-AT ?auto_1716 ?auto_1722 ) ( ON ?auto_1716 ?auto_1719 ) ( CLEAR ?auto_1716 ) ( not ( = ?auto_1715 ?auto_1719 ) ) ( not ( = ?auto_1716 ?auto_1719 ) ) ( not ( = ?auto_1723 ?auto_1719 ) ) ( SURFACE-AT ?auto_1723 ?auto_1717 ) ( CLEAR ?auto_1723 ) ( IS-CRATE ?auto_1715 ) ( AVAILABLE ?auto_1718 ) ( IN ?auto_1715 ?auto_1720 ) ( TRUCK-AT ?auto_1720 ?auto_1724 ) ( not ( = ?auto_1724 ?auto_1717 ) ) ( not ( = ?auto_1722 ?auto_1724 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1720 ?auto_1724 ?auto_1717 )
      ( MAKE-2CRATE ?auto_1723 ?auto_1715 ?auto_1716 )
      ( MAKE-1CRATE-VERIFY ?auto_1715 ?auto_1716 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1725 - SURFACE
      ?auto_1726 - SURFACE
      ?auto_1727 - SURFACE
    )
    :vars
    (
      ?auto_1734 - HOIST
      ?auto_1728 - PLACE
      ?auto_1732 - PLACE
      ?auto_1730 - HOIST
      ?auto_1731 - SURFACE
      ?auto_1729 - TRUCK
      ?auto_1733 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1734 ?auto_1728 ) ( IS-CRATE ?auto_1727 ) ( not ( = ?auto_1726 ?auto_1727 ) ) ( not ( = ?auto_1725 ?auto_1726 ) ) ( not ( = ?auto_1725 ?auto_1727 ) ) ( not ( = ?auto_1732 ?auto_1728 ) ) ( HOIST-AT ?auto_1730 ?auto_1732 ) ( not ( = ?auto_1734 ?auto_1730 ) ) ( AVAILABLE ?auto_1730 ) ( SURFACE-AT ?auto_1727 ?auto_1732 ) ( ON ?auto_1727 ?auto_1731 ) ( CLEAR ?auto_1727 ) ( not ( = ?auto_1726 ?auto_1731 ) ) ( not ( = ?auto_1727 ?auto_1731 ) ) ( not ( = ?auto_1725 ?auto_1731 ) ) ( SURFACE-AT ?auto_1725 ?auto_1728 ) ( CLEAR ?auto_1725 ) ( IS-CRATE ?auto_1726 ) ( AVAILABLE ?auto_1734 ) ( IN ?auto_1726 ?auto_1729 ) ( TRUCK-AT ?auto_1729 ?auto_1733 ) ( not ( = ?auto_1733 ?auto_1728 ) ) ( not ( = ?auto_1732 ?auto_1733 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1726 ?auto_1727 )
      ( MAKE-2CRATE-VERIFY ?auto_1725 ?auto_1726 ?auto_1727 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1735 - SURFACE
      ?auto_1736 - SURFACE
      ?auto_1737 - SURFACE
      ?auto_1738 - SURFACE
    )
    :vars
    (
      ?auto_1740 - HOIST
      ?auto_1739 - PLACE
      ?auto_1744 - PLACE
      ?auto_1742 - HOIST
      ?auto_1745 - SURFACE
      ?auto_1741 - TRUCK
      ?auto_1743 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1740 ?auto_1739 ) ( IS-CRATE ?auto_1738 ) ( not ( = ?auto_1737 ?auto_1738 ) ) ( not ( = ?auto_1736 ?auto_1737 ) ) ( not ( = ?auto_1736 ?auto_1738 ) ) ( not ( = ?auto_1744 ?auto_1739 ) ) ( HOIST-AT ?auto_1742 ?auto_1744 ) ( not ( = ?auto_1740 ?auto_1742 ) ) ( AVAILABLE ?auto_1742 ) ( SURFACE-AT ?auto_1738 ?auto_1744 ) ( ON ?auto_1738 ?auto_1745 ) ( CLEAR ?auto_1738 ) ( not ( = ?auto_1737 ?auto_1745 ) ) ( not ( = ?auto_1738 ?auto_1745 ) ) ( not ( = ?auto_1736 ?auto_1745 ) ) ( SURFACE-AT ?auto_1736 ?auto_1739 ) ( CLEAR ?auto_1736 ) ( IS-CRATE ?auto_1737 ) ( AVAILABLE ?auto_1740 ) ( IN ?auto_1737 ?auto_1741 ) ( TRUCK-AT ?auto_1741 ?auto_1743 ) ( not ( = ?auto_1743 ?auto_1739 ) ) ( not ( = ?auto_1744 ?auto_1743 ) ) ( ON ?auto_1736 ?auto_1735 ) ( not ( = ?auto_1735 ?auto_1736 ) ) ( not ( = ?auto_1735 ?auto_1737 ) ) ( not ( = ?auto_1735 ?auto_1738 ) ) ( not ( = ?auto_1735 ?auto_1745 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1736 ?auto_1737 ?auto_1738 )
      ( MAKE-3CRATE-VERIFY ?auto_1735 ?auto_1736 ?auto_1737 ?auto_1738 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1746 - SURFACE
      ?auto_1747 - SURFACE
    )
    :vars
    (
      ?auto_1749 - HOIST
      ?auto_1748 - PLACE
      ?auto_1755 - SURFACE
      ?auto_1753 - PLACE
      ?auto_1751 - HOIST
      ?auto_1754 - SURFACE
      ?auto_1750 - TRUCK
      ?auto_1752 - PLACE
      ?auto_1756 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1749 ?auto_1748 ) ( IS-CRATE ?auto_1747 ) ( not ( = ?auto_1746 ?auto_1747 ) ) ( not ( = ?auto_1755 ?auto_1746 ) ) ( not ( = ?auto_1755 ?auto_1747 ) ) ( not ( = ?auto_1753 ?auto_1748 ) ) ( HOIST-AT ?auto_1751 ?auto_1753 ) ( not ( = ?auto_1749 ?auto_1751 ) ) ( AVAILABLE ?auto_1751 ) ( SURFACE-AT ?auto_1747 ?auto_1753 ) ( ON ?auto_1747 ?auto_1754 ) ( CLEAR ?auto_1747 ) ( not ( = ?auto_1746 ?auto_1754 ) ) ( not ( = ?auto_1747 ?auto_1754 ) ) ( not ( = ?auto_1755 ?auto_1754 ) ) ( SURFACE-AT ?auto_1755 ?auto_1748 ) ( CLEAR ?auto_1755 ) ( IS-CRATE ?auto_1746 ) ( AVAILABLE ?auto_1749 ) ( TRUCK-AT ?auto_1750 ?auto_1752 ) ( not ( = ?auto_1752 ?auto_1748 ) ) ( not ( = ?auto_1753 ?auto_1752 ) ) ( HOIST-AT ?auto_1756 ?auto_1752 ) ( LIFTING ?auto_1756 ?auto_1746 ) ( not ( = ?auto_1749 ?auto_1756 ) ) ( not ( = ?auto_1751 ?auto_1756 ) ) )
    :subtasks
    ( ( !LOAD ?auto_1756 ?auto_1746 ?auto_1750 ?auto_1752 )
      ( MAKE-2CRATE ?auto_1755 ?auto_1746 ?auto_1747 )
      ( MAKE-1CRATE-VERIFY ?auto_1746 ?auto_1747 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1757 - SURFACE
      ?auto_1758 - SURFACE
      ?auto_1759 - SURFACE
    )
    :vars
    (
      ?auto_1762 - HOIST
      ?auto_1763 - PLACE
      ?auto_1761 - PLACE
      ?auto_1764 - HOIST
      ?auto_1765 - SURFACE
      ?auto_1767 - TRUCK
      ?auto_1760 - PLACE
      ?auto_1766 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1762 ?auto_1763 ) ( IS-CRATE ?auto_1759 ) ( not ( = ?auto_1758 ?auto_1759 ) ) ( not ( = ?auto_1757 ?auto_1758 ) ) ( not ( = ?auto_1757 ?auto_1759 ) ) ( not ( = ?auto_1761 ?auto_1763 ) ) ( HOIST-AT ?auto_1764 ?auto_1761 ) ( not ( = ?auto_1762 ?auto_1764 ) ) ( AVAILABLE ?auto_1764 ) ( SURFACE-AT ?auto_1759 ?auto_1761 ) ( ON ?auto_1759 ?auto_1765 ) ( CLEAR ?auto_1759 ) ( not ( = ?auto_1758 ?auto_1765 ) ) ( not ( = ?auto_1759 ?auto_1765 ) ) ( not ( = ?auto_1757 ?auto_1765 ) ) ( SURFACE-AT ?auto_1757 ?auto_1763 ) ( CLEAR ?auto_1757 ) ( IS-CRATE ?auto_1758 ) ( AVAILABLE ?auto_1762 ) ( TRUCK-AT ?auto_1767 ?auto_1760 ) ( not ( = ?auto_1760 ?auto_1763 ) ) ( not ( = ?auto_1761 ?auto_1760 ) ) ( HOIST-AT ?auto_1766 ?auto_1760 ) ( LIFTING ?auto_1766 ?auto_1758 ) ( not ( = ?auto_1762 ?auto_1766 ) ) ( not ( = ?auto_1764 ?auto_1766 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1758 ?auto_1759 )
      ( MAKE-2CRATE-VERIFY ?auto_1757 ?auto_1758 ?auto_1759 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1768 - SURFACE
      ?auto_1769 - SURFACE
      ?auto_1770 - SURFACE
      ?auto_1771 - SURFACE
    )
    :vars
    (
      ?auto_1778 - HOIST
      ?auto_1779 - PLACE
      ?auto_1776 - PLACE
      ?auto_1775 - HOIST
      ?auto_1772 - SURFACE
      ?auto_1773 - TRUCK
      ?auto_1777 - PLACE
      ?auto_1774 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1778 ?auto_1779 ) ( IS-CRATE ?auto_1771 ) ( not ( = ?auto_1770 ?auto_1771 ) ) ( not ( = ?auto_1769 ?auto_1770 ) ) ( not ( = ?auto_1769 ?auto_1771 ) ) ( not ( = ?auto_1776 ?auto_1779 ) ) ( HOIST-AT ?auto_1775 ?auto_1776 ) ( not ( = ?auto_1778 ?auto_1775 ) ) ( AVAILABLE ?auto_1775 ) ( SURFACE-AT ?auto_1771 ?auto_1776 ) ( ON ?auto_1771 ?auto_1772 ) ( CLEAR ?auto_1771 ) ( not ( = ?auto_1770 ?auto_1772 ) ) ( not ( = ?auto_1771 ?auto_1772 ) ) ( not ( = ?auto_1769 ?auto_1772 ) ) ( SURFACE-AT ?auto_1769 ?auto_1779 ) ( CLEAR ?auto_1769 ) ( IS-CRATE ?auto_1770 ) ( AVAILABLE ?auto_1778 ) ( TRUCK-AT ?auto_1773 ?auto_1777 ) ( not ( = ?auto_1777 ?auto_1779 ) ) ( not ( = ?auto_1776 ?auto_1777 ) ) ( HOIST-AT ?auto_1774 ?auto_1777 ) ( LIFTING ?auto_1774 ?auto_1770 ) ( not ( = ?auto_1778 ?auto_1774 ) ) ( not ( = ?auto_1775 ?auto_1774 ) ) ( ON ?auto_1769 ?auto_1768 ) ( not ( = ?auto_1768 ?auto_1769 ) ) ( not ( = ?auto_1768 ?auto_1770 ) ) ( not ( = ?auto_1768 ?auto_1771 ) ) ( not ( = ?auto_1768 ?auto_1772 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1769 ?auto_1770 ?auto_1771 )
      ( MAKE-3CRATE-VERIFY ?auto_1768 ?auto_1769 ?auto_1770 ?auto_1771 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1780 - SURFACE
      ?auto_1781 - SURFACE
    )
    :vars
    (
      ?auto_1788 - HOIST
      ?auto_1789 - PLACE
      ?auto_1790 - SURFACE
      ?auto_1786 - PLACE
      ?auto_1785 - HOIST
      ?auto_1782 - SURFACE
      ?auto_1783 - TRUCK
      ?auto_1787 - PLACE
      ?auto_1784 - HOIST
      ?auto_1791 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1788 ?auto_1789 ) ( IS-CRATE ?auto_1781 ) ( not ( = ?auto_1780 ?auto_1781 ) ) ( not ( = ?auto_1790 ?auto_1780 ) ) ( not ( = ?auto_1790 ?auto_1781 ) ) ( not ( = ?auto_1786 ?auto_1789 ) ) ( HOIST-AT ?auto_1785 ?auto_1786 ) ( not ( = ?auto_1788 ?auto_1785 ) ) ( AVAILABLE ?auto_1785 ) ( SURFACE-AT ?auto_1781 ?auto_1786 ) ( ON ?auto_1781 ?auto_1782 ) ( CLEAR ?auto_1781 ) ( not ( = ?auto_1780 ?auto_1782 ) ) ( not ( = ?auto_1781 ?auto_1782 ) ) ( not ( = ?auto_1790 ?auto_1782 ) ) ( SURFACE-AT ?auto_1790 ?auto_1789 ) ( CLEAR ?auto_1790 ) ( IS-CRATE ?auto_1780 ) ( AVAILABLE ?auto_1788 ) ( TRUCK-AT ?auto_1783 ?auto_1787 ) ( not ( = ?auto_1787 ?auto_1789 ) ) ( not ( = ?auto_1786 ?auto_1787 ) ) ( HOIST-AT ?auto_1784 ?auto_1787 ) ( not ( = ?auto_1788 ?auto_1784 ) ) ( not ( = ?auto_1785 ?auto_1784 ) ) ( AVAILABLE ?auto_1784 ) ( SURFACE-AT ?auto_1780 ?auto_1787 ) ( ON ?auto_1780 ?auto_1791 ) ( CLEAR ?auto_1780 ) ( not ( = ?auto_1780 ?auto_1791 ) ) ( not ( = ?auto_1781 ?auto_1791 ) ) ( not ( = ?auto_1790 ?auto_1791 ) ) ( not ( = ?auto_1782 ?auto_1791 ) ) )
    :subtasks
    ( ( !LIFT ?auto_1784 ?auto_1780 ?auto_1791 ?auto_1787 )
      ( MAKE-2CRATE ?auto_1790 ?auto_1780 ?auto_1781 )
      ( MAKE-1CRATE-VERIFY ?auto_1780 ?auto_1781 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1792 - SURFACE
      ?auto_1793 - SURFACE
      ?auto_1794 - SURFACE
    )
    :vars
    (
      ?auto_1799 - HOIST
      ?auto_1803 - PLACE
      ?auto_1795 - PLACE
      ?auto_1801 - HOIST
      ?auto_1798 - SURFACE
      ?auto_1802 - TRUCK
      ?auto_1796 - PLACE
      ?auto_1797 - HOIST
      ?auto_1800 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1799 ?auto_1803 ) ( IS-CRATE ?auto_1794 ) ( not ( = ?auto_1793 ?auto_1794 ) ) ( not ( = ?auto_1792 ?auto_1793 ) ) ( not ( = ?auto_1792 ?auto_1794 ) ) ( not ( = ?auto_1795 ?auto_1803 ) ) ( HOIST-AT ?auto_1801 ?auto_1795 ) ( not ( = ?auto_1799 ?auto_1801 ) ) ( AVAILABLE ?auto_1801 ) ( SURFACE-AT ?auto_1794 ?auto_1795 ) ( ON ?auto_1794 ?auto_1798 ) ( CLEAR ?auto_1794 ) ( not ( = ?auto_1793 ?auto_1798 ) ) ( not ( = ?auto_1794 ?auto_1798 ) ) ( not ( = ?auto_1792 ?auto_1798 ) ) ( SURFACE-AT ?auto_1792 ?auto_1803 ) ( CLEAR ?auto_1792 ) ( IS-CRATE ?auto_1793 ) ( AVAILABLE ?auto_1799 ) ( TRUCK-AT ?auto_1802 ?auto_1796 ) ( not ( = ?auto_1796 ?auto_1803 ) ) ( not ( = ?auto_1795 ?auto_1796 ) ) ( HOIST-AT ?auto_1797 ?auto_1796 ) ( not ( = ?auto_1799 ?auto_1797 ) ) ( not ( = ?auto_1801 ?auto_1797 ) ) ( AVAILABLE ?auto_1797 ) ( SURFACE-AT ?auto_1793 ?auto_1796 ) ( ON ?auto_1793 ?auto_1800 ) ( CLEAR ?auto_1793 ) ( not ( = ?auto_1793 ?auto_1800 ) ) ( not ( = ?auto_1794 ?auto_1800 ) ) ( not ( = ?auto_1792 ?auto_1800 ) ) ( not ( = ?auto_1798 ?auto_1800 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1793 ?auto_1794 )
      ( MAKE-2CRATE-VERIFY ?auto_1792 ?auto_1793 ?auto_1794 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1804 - SURFACE
      ?auto_1805 - SURFACE
      ?auto_1806 - SURFACE
      ?auto_1807 - SURFACE
    )
    :vars
    (
      ?auto_1816 - HOIST
      ?auto_1813 - PLACE
      ?auto_1812 - PLACE
      ?auto_1815 - HOIST
      ?auto_1811 - SURFACE
      ?auto_1809 - TRUCK
      ?auto_1814 - PLACE
      ?auto_1810 - HOIST
      ?auto_1808 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1816 ?auto_1813 ) ( IS-CRATE ?auto_1807 ) ( not ( = ?auto_1806 ?auto_1807 ) ) ( not ( = ?auto_1805 ?auto_1806 ) ) ( not ( = ?auto_1805 ?auto_1807 ) ) ( not ( = ?auto_1812 ?auto_1813 ) ) ( HOIST-AT ?auto_1815 ?auto_1812 ) ( not ( = ?auto_1816 ?auto_1815 ) ) ( AVAILABLE ?auto_1815 ) ( SURFACE-AT ?auto_1807 ?auto_1812 ) ( ON ?auto_1807 ?auto_1811 ) ( CLEAR ?auto_1807 ) ( not ( = ?auto_1806 ?auto_1811 ) ) ( not ( = ?auto_1807 ?auto_1811 ) ) ( not ( = ?auto_1805 ?auto_1811 ) ) ( SURFACE-AT ?auto_1805 ?auto_1813 ) ( CLEAR ?auto_1805 ) ( IS-CRATE ?auto_1806 ) ( AVAILABLE ?auto_1816 ) ( TRUCK-AT ?auto_1809 ?auto_1814 ) ( not ( = ?auto_1814 ?auto_1813 ) ) ( not ( = ?auto_1812 ?auto_1814 ) ) ( HOIST-AT ?auto_1810 ?auto_1814 ) ( not ( = ?auto_1816 ?auto_1810 ) ) ( not ( = ?auto_1815 ?auto_1810 ) ) ( AVAILABLE ?auto_1810 ) ( SURFACE-AT ?auto_1806 ?auto_1814 ) ( ON ?auto_1806 ?auto_1808 ) ( CLEAR ?auto_1806 ) ( not ( = ?auto_1806 ?auto_1808 ) ) ( not ( = ?auto_1807 ?auto_1808 ) ) ( not ( = ?auto_1805 ?auto_1808 ) ) ( not ( = ?auto_1811 ?auto_1808 ) ) ( ON ?auto_1805 ?auto_1804 ) ( not ( = ?auto_1804 ?auto_1805 ) ) ( not ( = ?auto_1804 ?auto_1806 ) ) ( not ( = ?auto_1804 ?auto_1807 ) ) ( not ( = ?auto_1804 ?auto_1811 ) ) ( not ( = ?auto_1804 ?auto_1808 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1805 ?auto_1806 ?auto_1807 )
      ( MAKE-3CRATE-VERIFY ?auto_1804 ?auto_1805 ?auto_1806 ?auto_1807 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1817 - SURFACE
      ?auto_1818 - SURFACE
    )
    :vars
    (
      ?auto_1827 - HOIST
      ?auto_1824 - PLACE
      ?auto_1828 - SURFACE
      ?auto_1823 - PLACE
      ?auto_1826 - HOIST
      ?auto_1822 - SURFACE
      ?auto_1825 - PLACE
      ?auto_1821 - HOIST
      ?auto_1819 - SURFACE
      ?auto_1820 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1827 ?auto_1824 ) ( IS-CRATE ?auto_1818 ) ( not ( = ?auto_1817 ?auto_1818 ) ) ( not ( = ?auto_1828 ?auto_1817 ) ) ( not ( = ?auto_1828 ?auto_1818 ) ) ( not ( = ?auto_1823 ?auto_1824 ) ) ( HOIST-AT ?auto_1826 ?auto_1823 ) ( not ( = ?auto_1827 ?auto_1826 ) ) ( AVAILABLE ?auto_1826 ) ( SURFACE-AT ?auto_1818 ?auto_1823 ) ( ON ?auto_1818 ?auto_1822 ) ( CLEAR ?auto_1818 ) ( not ( = ?auto_1817 ?auto_1822 ) ) ( not ( = ?auto_1818 ?auto_1822 ) ) ( not ( = ?auto_1828 ?auto_1822 ) ) ( SURFACE-AT ?auto_1828 ?auto_1824 ) ( CLEAR ?auto_1828 ) ( IS-CRATE ?auto_1817 ) ( AVAILABLE ?auto_1827 ) ( not ( = ?auto_1825 ?auto_1824 ) ) ( not ( = ?auto_1823 ?auto_1825 ) ) ( HOIST-AT ?auto_1821 ?auto_1825 ) ( not ( = ?auto_1827 ?auto_1821 ) ) ( not ( = ?auto_1826 ?auto_1821 ) ) ( AVAILABLE ?auto_1821 ) ( SURFACE-AT ?auto_1817 ?auto_1825 ) ( ON ?auto_1817 ?auto_1819 ) ( CLEAR ?auto_1817 ) ( not ( = ?auto_1817 ?auto_1819 ) ) ( not ( = ?auto_1818 ?auto_1819 ) ) ( not ( = ?auto_1828 ?auto_1819 ) ) ( not ( = ?auto_1822 ?auto_1819 ) ) ( TRUCK-AT ?auto_1820 ?auto_1824 ) )
    :subtasks
    ( ( !DRIVE ?auto_1820 ?auto_1824 ?auto_1825 )
      ( MAKE-2CRATE ?auto_1828 ?auto_1817 ?auto_1818 )
      ( MAKE-1CRATE-VERIFY ?auto_1817 ?auto_1818 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1829 - SURFACE
      ?auto_1830 - SURFACE
      ?auto_1831 - SURFACE
    )
    :vars
    (
      ?auto_1835 - HOIST
      ?auto_1838 - PLACE
      ?auto_1833 - PLACE
      ?auto_1837 - HOIST
      ?auto_1832 - SURFACE
      ?auto_1834 - PLACE
      ?auto_1840 - HOIST
      ?auto_1839 - SURFACE
      ?auto_1836 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1835 ?auto_1838 ) ( IS-CRATE ?auto_1831 ) ( not ( = ?auto_1830 ?auto_1831 ) ) ( not ( = ?auto_1829 ?auto_1830 ) ) ( not ( = ?auto_1829 ?auto_1831 ) ) ( not ( = ?auto_1833 ?auto_1838 ) ) ( HOIST-AT ?auto_1837 ?auto_1833 ) ( not ( = ?auto_1835 ?auto_1837 ) ) ( AVAILABLE ?auto_1837 ) ( SURFACE-AT ?auto_1831 ?auto_1833 ) ( ON ?auto_1831 ?auto_1832 ) ( CLEAR ?auto_1831 ) ( not ( = ?auto_1830 ?auto_1832 ) ) ( not ( = ?auto_1831 ?auto_1832 ) ) ( not ( = ?auto_1829 ?auto_1832 ) ) ( SURFACE-AT ?auto_1829 ?auto_1838 ) ( CLEAR ?auto_1829 ) ( IS-CRATE ?auto_1830 ) ( AVAILABLE ?auto_1835 ) ( not ( = ?auto_1834 ?auto_1838 ) ) ( not ( = ?auto_1833 ?auto_1834 ) ) ( HOIST-AT ?auto_1840 ?auto_1834 ) ( not ( = ?auto_1835 ?auto_1840 ) ) ( not ( = ?auto_1837 ?auto_1840 ) ) ( AVAILABLE ?auto_1840 ) ( SURFACE-AT ?auto_1830 ?auto_1834 ) ( ON ?auto_1830 ?auto_1839 ) ( CLEAR ?auto_1830 ) ( not ( = ?auto_1830 ?auto_1839 ) ) ( not ( = ?auto_1831 ?auto_1839 ) ) ( not ( = ?auto_1829 ?auto_1839 ) ) ( not ( = ?auto_1832 ?auto_1839 ) ) ( TRUCK-AT ?auto_1836 ?auto_1838 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1830 ?auto_1831 )
      ( MAKE-2CRATE-VERIFY ?auto_1829 ?auto_1830 ?auto_1831 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1841 - SURFACE
      ?auto_1842 - SURFACE
      ?auto_1843 - SURFACE
      ?auto_1844 - SURFACE
    )
    :vars
    (
      ?auto_1846 - HOIST
      ?auto_1853 - PLACE
      ?auto_1851 - PLACE
      ?auto_1847 - HOIST
      ?auto_1848 - SURFACE
      ?auto_1849 - PLACE
      ?auto_1845 - HOIST
      ?auto_1852 - SURFACE
      ?auto_1850 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1846 ?auto_1853 ) ( IS-CRATE ?auto_1844 ) ( not ( = ?auto_1843 ?auto_1844 ) ) ( not ( = ?auto_1842 ?auto_1843 ) ) ( not ( = ?auto_1842 ?auto_1844 ) ) ( not ( = ?auto_1851 ?auto_1853 ) ) ( HOIST-AT ?auto_1847 ?auto_1851 ) ( not ( = ?auto_1846 ?auto_1847 ) ) ( AVAILABLE ?auto_1847 ) ( SURFACE-AT ?auto_1844 ?auto_1851 ) ( ON ?auto_1844 ?auto_1848 ) ( CLEAR ?auto_1844 ) ( not ( = ?auto_1843 ?auto_1848 ) ) ( not ( = ?auto_1844 ?auto_1848 ) ) ( not ( = ?auto_1842 ?auto_1848 ) ) ( SURFACE-AT ?auto_1842 ?auto_1853 ) ( CLEAR ?auto_1842 ) ( IS-CRATE ?auto_1843 ) ( AVAILABLE ?auto_1846 ) ( not ( = ?auto_1849 ?auto_1853 ) ) ( not ( = ?auto_1851 ?auto_1849 ) ) ( HOIST-AT ?auto_1845 ?auto_1849 ) ( not ( = ?auto_1846 ?auto_1845 ) ) ( not ( = ?auto_1847 ?auto_1845 ) ) ( AVAILABLE ?auto_1845 ) ( SURFACE-AT ?auto_1843 ?auto_1849 ) ( ON ?auto_1843 ?auto_1852 ) ( CLEAR ?auto_1843 ) ( not ( = ?auto_1843 ?auto_1852 ) ) ( not ( = ?auto_1844 ?auto_1852 ) ) ( not ( = ?auto_1842 ?auto_1852 ) ) ( not ( = ?auto_1848 ?auto_1852 ) ) ( TRUCK-AT ?auto_1850 ?auto_1853 ) ( ON ?auto_1842 ?auto_1841 ) ( not ( = ?auto_1841 ?auto_1842 ) ) ( not ( = ?auto_1841 ?auto_1843 ) ) ( not ( = ?auto_1841 ?auto_1844 ) ) ( not ( = ?auto_1841 ?auto_1848 ) ) ( not ( = ?auto_1841 ?auto_1852 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1842 ?auto_1843 ?auto_1844 )
      ( MAKE-3CRATE-VERIFY ?auto_1841 ?auto_1842 ?auto_1843 ?auto_1844 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1854 - SURFACE
      ?auto_1855 - SURFACE
    )
    :vars
    (
      ?auto_1857 - HOIST
      ?auto_1864 - PLACE
      ?auto_1865 - SURFACE
      ?auto_1862 - PLACE
      ?auto_1858 - HOIST
      ?auto_1859 - SURFACE
      ?auto_1860 - PLACE
      ?auto_1856 - HOIST
      ?auto_1863 - SURFACE
      ?auto_1861 - TRUCK
      ?auto_1866 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1857 ?auto_1864 ) ( IS-CRATE ?auto_1855 ) ( not ( = ?auto_1854 ?auto_1855 ) ) ( not ( = ?auto_1865 ?auto_1854 ) ) ( not ( = ?auto_1865 ?auto_1855 ) ) ( not ( = ?auto_1862 ?auto_1864 ) ) ( HOIST-AT ?auto_1858 ?auto_1862 ) ( not ( = ?auto_1857 ?auto_1858 ) ) ( AVAILABLE ?auto_1858 ) ( SURFACE-AT ?auto_1855 ?auto_1862 ) ( ON ?auto_1855 ?auto_1859 ) ( CLEAR ?auto_1855 ) ( not ( = ?auto_1854 ?auto_1859 ) ) ( not ( = ?auto_1855 ?auto_1859 ) ) ( not ( = ?auto_1865 ?auto_1859 ) ) ( IS-CRATE ?auto_1854 ) ( not ( = ?auto_1860 ?auto_1864 ) ) ( not ( = ?auto_1862 ?auto_1860 ) ) ( HOIST-AT ?auto_1856 ?auto_1860 ) ( not ( = ?auto_1857 ?auto_1856 ) ) ( not ( = ?auto_1858 ?auto_1856 ) ) ( AVAILABLE ?auto_1856 ) ( SURFACE-AT ?auto_1854 ?auto_1860 ) ( ON ?auto_1854 ?auto_1863 ) ( CLEAR ?auto_1854 ) ( not ( = ?auto_1854 ?auto_1863 ) ) ( not ( = ?auto_1855 ?auto_1863 ) ) ( not ( = ?auto_1865 ?auto_1863 ) ) ( not ( = ?auto_1859 ?auto_1863 ) ) ( TRUCK-AT ?auto_1861 ?auto_1864 ) ( SURFACE-AT ?auto_1866 ?auto_1864 ) ( CLEAR ?auto_1866 ) ( LIFTING ?auto_1857 ?auto_1865 ) ( IS-CRATE ?auto_1865 ) ( not ( = ?auto_1866 ?auto_1865 ) ) ( not ( = ?auto_1854 ?auto_1866 ) ) ( not ( = ?auto_1855 ?auto_1866 ) ) ( not ( = ?auto_1859 ?auto_1866 ) ) ( not ( = ?auto_1863 ?auto_1866 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1866 ?auto_1865 )
      ( MAKE-2CRATE ?auto_1865 ?auto_1854 ?auto_1855 )
      ( MAKE-1CRATE-VERIFY ?auto_1854 ?auto_1855 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1867 - SURFACE
      ?auto_1868 - SURFACE
      ?auto_1869 - SURFACE
    )
    :vars
    (
      ?auto_1879 - HOIST
      ?auto_1873 - PLACE
      ?auto_1878 - PLACE
      ?auto_1871 - HOIST
      ?auto_1876 - SURFACE
      ?auto_1870 - PLACE
      ?auto_1872 - HOIST
      ?auto_1874 - SURFACE
      ?auto_1877 - TRUCK
      ?auto_1875 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1879 ?auto_1873 ) ( IS-CRATE ?auto_1869 ) ( not ( = ?auto_1868 ?auto_1869 ) ) ( not ( = ?auto_1867 ?auto_1868 ) ) ( not ( = ?auto_1867 ?auto_1869 ) ) ( not ( = ?auto_1878 ?auto_1873 ) ) ( HOIST-AT ?auto_1871 ?auto_1878 ) ( not ( = ?auto_1879 ?auto_1871 ) ) ( AVAILABLE ?auto_1871 ) ( SURFACE-AT ?auto_1869 ?auto_1878 ) ( ON ?auto_1869 ?auto_1876 ) ( CLEAR ?auto_1869 ) ( not ( = ?auto_1868 ?auto_1876 ) ) ( not ( = ?auto_1869 ?auto_1876 ) ) ( not ( = ?auto_1867 ?auto_1876 ) ) ( IS-CRATE ?auto_1868 ) ( not ( = ?auto_1870 ?auto_1873 ) ) ( not ( = ?auto_1878 ?auto_1870 ) ) ( HOIST-AT ?auto_1872 ?auto_1870 ) ( not ( = ?auto_1879 ?auto_1872 ) ) ( not ( = ?auto_1871 ?auto_1872 ) ) ( AVAILABLE ?auto_1872 ) ( SURFACE-AT ?auto_1868 ?auto_1870 ) ( ON ?auto_1868 ?auto_1874 ) ( CLEAR ?auto_1868 ) ( not ( = ?auto_1868 ?auto_1874 ) ) ( not ( = ?auto_1869 ?auto_1874 ) ) ( not ( = ?auto_1867 ?auto_1874 ) ) ( not ( = ?auto_1876 ?auto_1874 ) ) ( TRUCK-AT ?auto_1877 ?auto_1873 ) ( SURFACE-AT ?auto_1875 ?auto_1873 ) ( CLEAR ?auto_1875 ) ( LIFTING ?auto_1879 ?auto_1867 ) ( IS-CRATE ?auto_1867 ) ( not ( = ?auto_1875 ?auto_1867 ) ) ( not ( = ?auto_1868 ?auto_1875 ) ) ( not ( = ?auto_1869 ?auto_1875 ) ) ( not ( = ?auto_1876 ?auto_1875 ) ) ( not ( = ?auto_1874 ?auto_1875 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1868 ?auto_1869 )
      ( MAKE-2CRATE-VERIFY ?auto_1867 ?auto_1868 ?auto_1869 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1880 - SURFACE
      ?auto_1881 - SURFACE
      ?auto_1882 - SURFACE
      ?auto_1883 - SURFACE
    )
    :vars
    (
      ?auto_1889 - HOIST
      ?auto_1886 - PLACE
      ?auto_1885 - PLACE
      ?auto_1892 - HOIST
      ?auto_1888 - SURFACE
      ?auto_1884 - PLACE
      ?auto_1887 - HOIST
      ?auto_1891 - SURFACE
      ?auto_1890 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1889 ?auto_1886 ) ( IS-CRATE ?auto_1883 ) ( not ( = ?auto_1882 ?auto_1883 ) ) ( not ( = ?auto_1881 ?auto_1882 ) ) ( not ( = ?auto_1881 ?auto_1883 ) ) ( not ( = ?auto_1885 ?auto_1886 ) ) ( HOIST-AT ?auto_1892 ?auto_1885 ) ( not ( = ?auto_1889 ?auto_1892 ) ) ( AVAILABLE ?auto_1892 ) ( SURFACE-AT ?auto_1883 ?auto_1885 ) ( ON ?auto_1883 ?auto_1888 ) ( CLEAR ?auto_1883 ) ( not ( = ?auto_1882 ?auto_1888 ) ) ( not ( = ?auto_1883 ?auto_1888 ) ) ( not ( = ?auto_1881 ?auto_1888 ) ) ( IS-CRATE ?auto_1882 ) ( not ( = ?auto_1884 ?auto_1886 ) ) ( not ( = ?auto_1885 ?auto_1884 ) ) ( HOIST-AT ?auto_1887 ?auto_1884 ) ( not ( = ?auto_1889 ?auto_1887 ) ) ( not ( = ?auto_1892 ?auto_1887 ) ) ( AVAILABLE ?auto_1887 ) ( SURFACE-AT ?auto_1882 ?auto_1884 ) ( ON ?auto_1882 ?auto_1891 ) ( CLEAR ?auto_1882 ) ( not ( = ?auto_1882 ?auto_1891 ) ) ( not ( = ?auto_1883 ?auto_1891 ) ) ( not ( = ?auto_1881 ?auto_1891 ) ) ( not ( = ?auto_1888 ?auto_1891 ) ) ( TRUCK-AT ?auto_1890 ?auto_1886 ) ( SURFACE-AT ?auto_1880 ?auto_1886 ) ( CLEAR ?auto_1880 ) ( LIFTING ?auto_1889 ?auto_1881 ) ( IS-CRATE ?auto_1881 ) ( not ( = ?auto_1880 ?auto_1881 ) ) ( not ( = ?auto_1882 ?auto_1880 ) ) ( not ( = ?auto_1883 ?auto_1880 ) ) ( not ( = ?auto_1888 ?auto_1880 ) ) ( not ( = ?auto_1891 ?auto_1880 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1881 ?auto_1882 ?auto_1883 )
      ( MAKE-3CRATE-VERIFY ?auto_1880 ?auto_1881 ?auto_1882 ?auto_1883 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1893 - SURFACE
      ?auto_1894 - SURFACE
    )
    :vars
    (
      ?auto_1901 - HOIST
      ?auto_1898 - PLACE
      ?auto_1895 - SURFACE
      ?auto_1897 - PLACE
      ?auto_1905 - HOIST
      ?auto_1900 - SURFACE
      ?auto_1896 - PLACE
      ?auto_1899 - HOIST
      ?auto_1904 - SURFACE
      ?auto_1902 - TRUCK
      ?auto_1903 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1901 ?auto_1898 ) ( IS-CRATE ?auto_1894 ) ( not ( = ?auto_1893 ?auto_1894 ) ) ( not ( = ?auto_1895 ?auto_1893 ) ) ( not ( = ?auto_1895 ?auto_1894 ) ) ( not ( = ?auto_1897 ?auto_1898 ) ) ( HOIST-AT ?auto_1905 ?auto_1897 ) ( not ( = ?auto_1901 ?auto_1905 ) ) ( AVAILABLE ?auto_1905 ) ( SURFACE-AT ?auto_1894 ?auto_1897 ) ( ON ?auto_1894 ?auto_1900 ) ( CLEAR ?auto_1894 ) ( not ( = ?auto_1893 ?auto_1900 ) ) ( not ( = ?auto_1894 ?auto_1900 ) ) ( not ( = ?auto_1895 ?auto_1900 ) ) ( IS-CRATE ?auto_1893 ) ( not ( = ?auto_1896 ?auto_1898 ) ) ( not ( = ?auto_1897 ?auto_1896 ) ) ( HOIST-AT ?auto_1899 ?auto_1896 ) ( not ( = ?auto_1901 ?auto_1899 ) ) ( not ( = ?auto_1905 ?auto_1899 ) ) ( AVAILABLE ?auto_1899 ) ( SURFACE-AT ?auto_1893 ?auto_1896 ) ( ON ?auto_1893 ?auto_1904 ) ( CLEAR ?auto_1893 ) ( not ( = ?auto_1893 ?auto_1904 ) ) ( not ( = ?auto_1894 ?auto_1904 ) ) ( not ( = ?auto_1895 ?auto_1904 ) ) ( not ( = ?auto_1900 ?auto_1904 ) ) ( TRUCK-AT ?auto_1902 ?auto_1898 ) ( SURFACE-AT ?auto_1903 ?auto_1898 ) ( CLEAR ?auto_1903 ) ( IS-CRATE ?auto_1895 ) ( not ( = ?auto_1903 ?auto_1895 ) ) ( not ( = ?auto_1893 ?auto_1903 ) ) ( not ( = ?auto_1894 ?auto_1903 ) ) ( not ( = ?auto_1900 ?auto_1903 ) ) ( not ( = ?auto_1904 ?auto_1903 ) ) ( AVAILABLE ?auto_1901 ) ( IN ?auto_1895 ?auto_1902 ) )
    :subtasks
    ( ( !UNLOAD ?auto_1901 ?auto_1895 ?auto_1902 ?auto_1898 )
      ( MAKE-2CRATE ?auto_1895 ?auto_1893 ?auto_1894 )
      ( MAKE-1CRATE-VERIFY ?auto_1893 ?auto_1894 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1906 - SURFACE
      ?auto_1907 - SURFACE
      ?auto_1908 - SURFACE
    )
    :vars
    (
      ?auto_1914 - HOIST
      ?auto_1916 - PLACE
      ?auto_1913 - PLACE
      ?auto_1918 - HOIST
      ?auto_1909 - SURFACE
      ?auto_1911 - PLACE
      ?auto_1915 - HOIST
      ?auto_1917 - SURFACE
      ?auto_1910 - TRUCK
      ?auto_1912 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1914 ?auto_1916 ) ( IS-CRATE ?auto_1908 ) ( not ( = ?auto_1907 ?auto_1908 ) ) ( not ( = ?auto_1906 ?auto_1907 ) ) ( not ( = ?auto_1906 ?auto_1908 ) ) ( not ( = ?auto_1913 ?auto_1916 ) ) ( HOIST-AT ?auto_1918 ?auto_1913 ) ( not ( = ?auto_1914 ?auto_1918 ) ) ( AVAILABLE ?auto_1918 ) ( SURFACE-AT ?auto_1908 ?auto_1913 ) ( ON ?auto_1908 ?auto_1909 ) ( CLEAR ?auto_1908 ) ( not ( = ?auto_1907 ?auto_1909 ) ) ( not ( = ?auto_1908 ?auto_1909 ) ) ( not ( = ?auto_1906 ?auto_1909 ) ) ( IS-CRATE ?auto_1907 ) ( not ( = ?auto_1911 ?auto_1916 ) ) ( not ( = ?auto_1913 ?auto_1911 ) ) ( HOIST-AT ?auto_1915 ?auto_1911 ) ( not ( = ?auto_1914 ?auto_1915 ) ) ( not ( = ?auto_1918 ?auto_1915 ) ) ( AVAILABLE ?auto_1915 ) ( SURFACE-AT ?auto_1907 ?auto_1911 ) ( ON ?auto_1907 ?auto_1917 ) ( CLEAR ?auto_1907 ) ( not ( = ?auto_1907 ?auto_1917 ) ) ( not ( = ?auto_1908 ?auto_1917 ) ) ( not ( = ?auto_1906 ?auto_1917 ) ) ( not ( = ?auto_1909 ?auto_1917 ) ) ( TRUCK-AT ?auto_1910 ?auto_1916 ) ( SURFACE-AT ?auto_1912 ?auto_1916 ) ( CLEAR ?auto_1912 ) ( IS-CRATE ?auto_1906 ) ( not ( = ?auto_1912 ?auto_1906 ) ) ( not ( = ?auto_1907 ?auto_1912 ) ) ( not ( = ?auto_1908 ?auto_1912 ) ) ( not ( = ?auto_1909 ?auto_1912 ) ) ( not ( = ?auto_1917 ?auto_1912 ) ) ( AVAILABLE ?auto_1914 ) ( IN ?auto_1906 ?auto_1910 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1907 ?auto_1908 )
      ( MAKE-2CRATE-VERIFY ?auto_1906 ?auto_1907 ?auto_1908 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1919 - SURFACE
      ?auto_1920 - SURFACE
      ?auto_1921 - SURFACE
      ?auto_1922 - SURFACE
    )
    :vars
    (
      ?auto_1925 - HOIST
      ?auto_1929 - PLACE
      ?auto_1928 - PLACE
      ?auto_1927 - HOIST
      ?auto_1923 - SURFACE
      ?auto_1930 - PLACE
      ?auto_1924 - HOIST
      ?auto_1931 - SURFACE
      ?auto_1926 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1925 ?auto_1929 ) ( IS-CRATE ?auto_1922 ) ( not ( = ?auto_1921 ?auto_1922 ) ) ( not ( = ?auto_1920 ?auto_1921 ) ) ( not ( = ?auto_1920 ?auto_1922 ) ) ( not ( = ?auto_1928 ?auto_1929 ) ) ( HOIST-AT ?auto_1927 ?auto_1928 ) ( not ( = ?auto_1925 ?auto_1927 ) ) ( AVAILABLE ?auto_1927 ) ( SURFACE-AT ?auto_1922 ?auto_1928 ) ( ON ?auto_1922 ?auto_1923 ) ( CLEAR ?auto_1922 ) ( not ( = ?auto_1921 ?auto_1923 ) ) ( not ( = ?auto_1922 ?auto_1923 ) ) ( not ( = ?auto_1920 ?auto_1923 ) ) ( IS-CRATE ?auto_1921 ) ( not ( = ?auto_1930 ?auto_1929 ) ) ( not ( = ?auto_1928 ?auto_1930 ) ) ( HOIST-AT ?auto_1924 ?auto_1930 ) ( not ( = ?auto_1925 ?auto_1924 ) ) ( not ( = ?auto_1927 ?auto_1924 ) ) ( AVAILABLE ?auto_1924 ) ( SURFACE-AT ?auto_1921 ?auto_1930 ) ( ON ?auto_1921 ?auto_1931 ) ( CLEAR ?auto_1921 ) ( not ( = ?auto_1921 ?auto_1931 ) ) ( not ( = ?auto_1922 ?auto_1931 ) ) ( not ( = ?auto_1920 ?auto_1931 ) ) ( not ( = ?auto_1923 ?auto_1931 ) ) ( TRUCK-AT ?auto_1926 ?auto_1929 ) ( SURFACE-AT ?auto_1919 ?auto_1929 ) ( CLEAR ?auto_1919 ) ( IS-CRATE ?auto_1920 ) ( not ( = ?auto_1919 ?auto_1920 ) ) ( not ( = ?auto_1921 ?auto_1919 ) ) ( not ( = ?auto_1922 ?auto_1919 ) ) ( not ( = ?auto_1923 ?auto_1919 ) ) ( not ( = ?auto_1931 ?auto_1919 ) ) ( AVAILABLE ?auto_1925 ) ( IN ?auto_1920 ?auto_1926 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1920 ?auto_1921 ?auto_1922 )
      ( MAKE-3CRATE-VERIFY ?auto_1919 ?auto_1920 ?auto_1921 ?auto_1922 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1932 - SURFACE
      ?auto_1933 - SURFACE
    )
    :vars
    (
      ?auto_1936 - HOIST
      ?auto_1940 - PLACE
      ?auto_1944 - SURFACE
      ?auto_1939 - PLACE
      ?auto_1938 - HOIST
      ?auto_1934 - SURFACE
      ?auto_1941 - PLACE
      ?auto_1935 - HOIST
      ?auto_1942 - SURFACE
      ?auto_1943 - SURFACE
      ?auto_1937 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1936 ?auto_1940 ) ( IS-CRATE ?auto_1933 ) ( not ( = ?auto_1932 ?auto_1933 ) ) ( not ( = ?auto_1944 ?auto_1932 ) ) ( not ( = ?auto_1944 ?auto_1933 ) ) ( not ( = ?auto_1939 ?auto_1940 ) ) ( HOIST-AT ?auto_1938 ?auto_1939 ) ( not ( = ?auto_1936 ?auto_1938 ) ) ( AVAILABLE ?auto_1938 ) ( SURFACE-AT ?auto_1933 ?auto_1939 ) ( ON ?auto_1933 ?auto_1934 ) ( CLEAR ?auto_1933 ) ( not ( = ?auto_1932 ?auto_1934 ) ) ( not ( = ?auto_1933 ?auto_1934 ) ) ( not ( = ?auto_1944 ?auto_1934 ) ) ( IS-CRATE ?auto_1932 ) ( not ( = ?auto_1941 ?auto_1940 ) ) ( not ( = ?auto_1939 ?auto_1941 ) ) ( HOIST-AT ?auto_1935 ?auto_1941 ) ( not ( = ?auto_1936 ?auto_1935 ) ) ( not ( = ?auto_1938 ?auto_1935 ) ) ( AVAILABLE ?auto_1935 ) ( SURFACE-AT ?auto_1932 ?auto_1941 ) ( ON ?auto_1932 ?auto_1942 ) ( CLEAR ?auto_1932 ) ( not ( = ?auto_1932 ?auto_1942 ) ) ( not ( = ?auto_1933 ?auto_1942 ) ) ( not ( = ?auto_1944 ?auto_1942 ) ) ( not ( = ?auto_1934 ?auto_1942 ) ) ( SURFACE-AT ?auto_1943 ?auto_1940 ) ( CLEAR ?auto_1943 ) ( IS-CRATE ?auto_1944 ) ( not ( = ?auto_1943 ?auto_1944 ) ) ( not ( = ?auto_1932 ?auto_1943 ) ) ( not ( = ?auto_1933 ?auto_1943 ) ) ( not ( = ?auto_1934 ?auto_1943 ) ) ( not ( = ?auto_1942 ?auto_1943 ) ) ( AVAILABLE ?auto_1936 ) ( IN ?auto_1944 ?auto_1937 ) ( TRUCK-AT ?auto_1937 ?auto_1941 ) )
    :subtasks
    ( ( !DRIVE ?auto_1937 ?auto_1941 ?auto_1940 )
      ( MAKE-2CRATE ?auto_1944 ?auto_1932 ?auto_1933 )
      ( MAKE-1CRATE-VERIFY ?auto_1932 ?auto_1933 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1945 - SURFACE
      ?auto_1946 - SURFACE
      ?auto_1947 - SURFACE
    )
    :vars
    (
      ?auto_1951 - HOIST
      ?auto_1955 - PLACE
      ?auto_1954 - PLACE
      ?auto_1952 - HOIST
      ?auto_1950 - SURFACE
      ?auto_1948 - PLACE
      ?auto_1957 - HOIST
      ?auto_1953 - SURFACE
      ?auto_1949 - SURFACE
      ?auto_1956 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1951 ?auto_1955 ) ( IS-CRATE ?auto_1947 ) ( not ( = ?auto_1946 ?auto_1947 ) ) ( not ( = ?auto_1945 ?auto_1946 ) ) ( not ( = ?auto_1945 ?auto_1947 ) ) ( not ( = ?auto_1954 ?auto_1955 ) ) ( HOIST-AT ?auto_1952 ?auto_1954 ) ( not ( = ?auto_1951 ?auto_1952 ) ) ( AVAILABLE ?auto_1952 ) ( SURFACE-AT ?auto_1947 ?auto_1954 ) ( ON ?auto_1947 ?auto_1950 ) ( CLEAR ?auto_1947 ) ( not ( = ?auto_1946 ?auto_1950 ) ) ( not ( = ?auto_1947 ?auto_1950 ) ) ( not ( = ?auto_1945 ?auto_1950 ) ) ( IS-CRATE ?auto_1946 ) ( not ( = ?auto_1948 ?auto_1955 ) ) ( not ( = ?auto_1954 ?auto_1948 ) ) ( HOIST-AT ?auto_1957 ?auto_1948 ) ( not ( = ?auto_1951 ?auto_1957 ) ) ( not ( = ?auto_1952 ?auto_1957 ) ) ( AVAILABLE ?auto_1957 ) ( SURFACE-AT ?auto_1946 ?auto_1948 ) ( ON ?auto_1946 ?auto_1953 ) ( CLEAR ?auto_1946 ) ( not ( = ?auto_1946 ?auto_1953 ) ) ( not ( = ?auto_1947 ?auto_1953 ) ) ( not ( = ?auto_1945 ?auto_1953 ) ) ( not ( = ?auto_1950 ?auto_1953 ) ) ( SURFACE-AT ?auto_1949 ?auto_1955 ) ( CLEAR ?auto_1949 ) ( IS-CRATE ?auto_1945 ) ( not ( = ?auto_1949 ?auto_1945 ) ) ( not ( = ?auto_1946 ?auto_1949 ) ) ( not ( = ?auto_1947 ?auto_1949 ) ) ( not ( = ?auto_1950 ?auto_1949 ) ) ( not ( = ?auto_1953 ?auto_1949 ) ) ( AVAILABLE ?auto_1951 ) ( IN ?auto_1945 ?auto_1956 ) ( TRUCK-AT ?auto_1956 ?auto_1948 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1946 ?auto_1947 )
      ( MAKE-2CRATE-VERIFY ?auto_1945 ?auto_1946 ?auto_1947 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1958 - SURFACE
      ?auto_1959 - SURFACE
      ?auto_1960 - SURFACE
      ?auto_1961 - SURFACE
    )
    :vars
    (
      ?auto_1970 - HOIST
      ?auto_1969 - PLACE
      ?auto_1964 - PLACE
      ?auto_1968 - HOIST
      ?auto_1965 - SURFACE
      ?auto_1966 - PLACE
      ?auto_1967 - HOIST
      ?auto_1963 - SURFACE
      ?auto_1962 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1970 ?auto_1969 ) ( IS-CRATE ?auto_1961 ) ( not ( = ?auto_1960 ?auto_1961 ) ) ( not ( = ?auto_1959 ?auto_1960 ) ) ( not ( = ?auto_1959 ?auto_1961 ) ) ( not ( = ?auto_1964 ?auto_1969 ) ) ( HOIST-AT ?auto_1968 ?auto_1964 ) ( not ( = ?auto_1970 ?auto_1968 ) ) ( AVAILABLE ?auto_1968 ) ( SURFACE-AT ?auto_1961 ?auto_1964 ) ( ON ?auto_1961 ?auto_1965 ) ( CLEAR ?auto_1961 ) ( not ( = ?auto_1960 ?auto_1965 ) ) ( not ( = ?auto_1961 ?auto_1965 ) ) ( not ( = ?auto_1959 ?auto_1965 ) ) ( IS-CRATE ?auto_1960 ) ( not ( = ?auto_1966 ?auto_1969 ) ) ( not ( = ?auto_1964 ?auto_1966 ) ) ( HOIST-AT ?auto_1967 ?auto_1966 ) ( not ( = ?auto_1970 ?auto_1967 ) ) ( not ( = ?auto_1968 ?auto_1967 ) ) ( AVAILABLE ?auto_1967 ) ( SURFACE-AT ?auto_1960 ?auto_1966 ) ( ON ?auto_1960 ?auto_1963 ) ( CLEAR ?auto_1960 ) ( not ( = ?auto_1960 ?auto_1963 ) ) ( not ( = ?auto_1961 ?auto_1963 ) ) ( not ( = ?auto_1959 ?auto_1963 ) ) ( not ( = ?auto_1965 ?auto_1963 ) ) ( SURFACE-AT ?auto_1958 ?auto_1969 ) ( CLEAR ?auto_1958 ) ( IS-CRATE ?auto_1959 ) ( not ( = ?auto_1958 ?auto_1959 ) ) ( not ( = ?auto_1960 ?auto_1958 ) ) ( not ( = ?auto_1961 ?auto_1958 ) ) ( not ( = ?auto_1965 ?auto_1958 ) ) ( not ( = ?auto_1963 ?auto_1958 ) ) ( AVAILABLE ?auto_1970 ) ( IN ?auto_1959 ?auto_1962 ) ( TRUCK-AT ?auto_1962 ?auto_1966 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1959 ?auto_1960 ?auto_1961 )
      ( MAKE-3CRATE-VERIFY ?auto_1958 ?auto_1959 ?auto_1960 ?auto_1961 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1971 - SURFACE
      ?auto_1972 - SURFACE
    )
    :vars
    (
      ?auto_1982 - HOIST
      ?auto_1980 - PLACE
      ?auto_1983 - SURFACE
      ?auto_1975 - PLACE
      ?auto_1979 - HOIST
      ?auto_1976 - SURFACE
      ?auto_1977 - PLACE
      ?auto_1978 - HOIST
      ?auto_1974 - SURFACE
      ?auto_1981 - SURFACE
      ?auto_1973 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1982 ?auto_1980 ) ( IS-CRATE ?auto_1972 ) ( not ( = ?auto_1971 ?auto_1972 ) ) ( not ( = ?auto_1983 ?auto_1971 ) ) ( not ( = ?auto_1983 ?auto_1972 ) ) ( not ( = ?auto_1975 ?auto_1980 ) ) ( HOIST-AT ?auto_1979 ?auto_1975 ) ( not ( = ?auto_1982 ?auto_1979 ) ) ( AVAILABLE ?auto_1979 ) ( SURFACE-AT ?auto_1972 ?auto_1975 ) ( ON ?auto_1972 ?auto_1976 ) ( CLEAR ?auto_1972 ) ( not ( = ?auto_1971 ?auto_1976 ) ) ( not ( = ?auto_1972 ?auto_1976 ) ) ( not ( = ?auto_1983 ?auto_1976 ) ) ( IS-CRATE ?auto_1971 ) ( not ( = ?auto_1977 ?auto_1980 ) ) ( not ( = ?auto_1975 ?auto_1977 ) ) ( HOIST-AT ?auto_1978 ?auto_1977 ) ( not ( = ?auto_1982 ?auto_1978 ) ) ( not ( = ?auto_1979 ?auto_1978 ) ) ( SURFACE-AT ?auto_1971 ?auto_1977 ) ( ON ?auto_1971 ?auto_1974 ) ( CLEAR ?auto_1971 ) ( not ( = ?auto_1971 ?auto_1974 ) ) ( not ( = ?auto_1972 ?auto_1974 ) ) ( not ( = ?auto_1983 ?auto_1974 ) ) ( not ( = ?auto_1976 ?auto_1974 ) ) ( SURFACE-AT ?auto_1981 ?auto_1980 ) ( CLEAR ?auto_1981 ) ( IS-CRATE ?auto_1983 ) ( not ( = ?auto_1981 ?auto_1983 ) ) ( not ( = ?auto_1971 ?auto_1981 ) ) ( not ( = ?auto_1972 ?auto_1981 ) ) ( not ( = ?auto_1976 ?auto_1981 ) ) ( not ( = ?auto_1974 ?auto_1981 ) ) ( AVAILABLE ?auto_1982 ) ( TRUCK-AT ?auto_1973 ?auto_1977 ) ( LIFTING ?auto_1978 ?auto_1983 ) )
    :subtasks
    ( ( !LOAD ?auto_1978 ?auto_1983 ?auto_1973 ?auto_1977 )
      ( MAKE-2CRATE ?auto_1983 ?auto_1971 ?auto_1972 )
      ( MAKE-1CRATE-VERIFY ?auto_1971 ?auto_1972 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1984 - SURFACE
      ?auto_1985 - SURFACE
      ?auto_1986 - SURFACE
    )
    :vars
    (
      ?auto_1994 - HOIST
      ?auto_1989 - PLACE
      ?auto_1990 - PLACE
      ?auto_1987 - HOIST
      ?auto_1993 - SURFACE
      ?auto_1995 - PLACE
      ?auto_1992 - HOIST
      ?auto_1991 - SURFACE
      ?auto_1988 - SURFACE
      ?auto_1996 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1994 ?auto_1989 ) ( IS-CRATE ?auto_1986 ) ( not ( = ?auto_1985 ?auto_1986 ) ) ( not ( = ?auto_1984 ?auto_1985 ) ) ( not ( = ?auto_1984 ?auto_1986 ) ) ( not ( = ?auto_1990 ?auto_1989 ) ) ( HOIST-AT ?auto_1987 ?auto_1990 ) ( not ( = ?auto_1994 ?auto_1987 ) ) ( AVAILABLE ?auto_1987 ) ( SURFACE-AT ?auto_1986 ?auto_1990 ) ( ON ?auto_1986 ?auto_1993 ) ( CLEAR ?auto_1986 ) ( not ( = ?auto_1985 ?auto_1993 ) ) ( not ( = ?auto_1986 ?auto_1993 ) ) ( not ( = ?auto_1984 ?auto_1993 ) ) ( IS-CRATE ?auto_1985 ) ( not ( = ?auto_1995 ?auto_1989 ) ) ( not ( = ?auto_1990 ?auto_1995 ) ) ( HOIST-AT ?auto_1992 ?auto_1995 ) ( not ( = ?auto_1994 ?auto_1992 ) ) ( not ( = ?auto_1987 ?auto_1992 ) ) ( SURFACE-AT ?auto_1985 ?auto_1995 ) ( ON ?auto_1985 ?auto_1991 ) ( CLEAR ?auto_1985 ) ( not ( = ?auto_1985 ?auto_1991 ) ) ( not ( = ?auto_1986 ?auto_1991 ) ) ( not ( = ?auto_1984 ?auto_1991 ) ) ( not ( = ?auto_1993 ?auto_1991 ) ) ( SURFACE-AT ?auto_1988 ?auto_1989 ) ( CLEAR ?auto_1988 ) ( IS-CRATE ?auto_1984 ) ( not ( = ?auto_1988 ?auto_1984 ) ) ( not ( = ?auto_1985 ?auto_1988 ) ) ( not ( = ?auto_1986 ?auto_1988 ) ) ( not ( = ?auto_1993 ?auto_1988 ) ) ( not ( = ?auto_1991 ?auto_1988 ) ) ( AVAILABLE ?auto_1994 ) ( TRUCK-AT ?auto_1996 ?auto_1995 ) ( LIFTING ?auto_1992 ?auto_1984 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1985 ?auto_1986 )
      ( MAKE-2CRATE-VERIFY ?auto_1984 ?auto_1985 ?auto_1986 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1997 - SURFACE
      ?auto_1998 - SURFACE
      ?auto_1999 - SURFACE
      ?auto_2000 - SURFACE
    )
    :vars
    (
      ?auto_2006 - HOIST
      ?auto_2002 - PLACE
      ?auto_2004 - PLACE
      ?auto_2003 - HOIST
      ?auto_2001 - SURFACE
      ?auto_2007 - PLACE
      ?auto_2008 - HOIST
      ?auto_2009 - SURFACE
      ?auto_2005 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2006 ?auto_2002 ) ( IS-CRATE ?auto_2000 ) ( not ( = ?auto_1999 ?auto_2000 ) ) ( not ( = ?auto_1998 ?auto_1999 ) ) ( not ( = ?auto_1998 ?auto_2000 ) ) ( not ( = ?auto_2004 ?auto_2002 ) ) ( HOIST-AT ?auto_2003 ?auto_2004 ) ( not ( = ?auto_2006 ?auto_2003 ) ) ( AVAILABLE ?auto_2003 ) ( SURFACE-AT ?auto_2000 ?auto_2004 ) ( ON ?auto_2000 ?auto_2001 ) ( CLEAR ?auto_2000 ) ( not ( = ?auto_1999 ?auto_2001 ) ) ( not ( = ?auto_2000 ?auto_2001 ) ) ( not ( = ?auto_1998 ?auto_2001 ) ) ( IS-CRATE ?auto_1999 ) ( not ( = ?auto_2007 ?auto_2002 ) ) ( not ( = ?auto_2004 ?auto_2007 ) ) ( HOIST-AT ?auto_2008 ?auto_2007 ) ( not ( = ?auto_2006 ?auto_2008 ) ) ( not ( = ?auto_2003 ?auto_2008 ) ) ( SURFACE-AT ?auto_1999 ?auto_2007 ) ( ON ?auto_1999 ?auto_2009 ) ( CLEAR ?auto_1999 ) ( not ( = ?auto_1999 ?auto_2009 ) ) ( not ( = ?auto_2000 ?auto_2009 ) ) ( not ( = ?auto_1998 ?auto_2009 ) ) ( not ( = ?auto_2001 ?auto_2009 ) ) ( SURFACE-AT ?auto_1997 ?auto_2002 ) ( CLEAR ?auto_1997 ) ( IS-CRATE ?auto_1998 ) ( not ( = ?auto_1997 ?auto_1998 ) ) ( not ( = ?auto_1999 ?auto_1997 ) ) ( not ( = ?auto_2000 ?auto_1997 ) ) ( not ( = ?auto_2001 ?auto_1997 ) ) ( not ( = ?auto_2009 ?auto_1997 ) ) ( AVAILABLE ?auto_2006 ) ( TRUCK-AT ?auto_2005 ?auto_2007 ) ( LIFTING ?auto_2008 ?auto_1998 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1998 ?auto_1999 ?auto_2000 )
      ( MAKE-3CRATE-VERIFY ?auto_1997 ?auto_1998 ?auto_1999 ?auto_2000 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2010 - SURFACE
      ?auto_2011 - SURFACE
    )
    :vars
    (
      ?auto_2017 - HOIST
      ?auto_2013 - PLACE
      ?auto_2022 - SURFACE
      ?auto_2015 - PLACE
      ?auto_2014 - HOIST
      ?auto_2012 - SURFACE
      ?auto_2018 - PLACE
      ?auto_2019 - HOIST
      ?auto_2020 - SURFACE
      ?auto_2021 - SURFACE
      ?auto_2016 - TRUCK
      ?auto_2023 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2017 ?auto_2013 ) ( IS-CRATE ?auto_2011 ) ( not ( = ?auto_2010 ?auto_2011 ) ) ( not ( = ?auto_2022 ?auto_2010 ) ) ( not ( = ?auto_2022 ?auto_2011 ) ) ( not ( = ?auto_2015 ?auto_2013 ) ) ( HOIST-AT ?auto_2014 ?auto_2015 ) ( not ( = ?auto_2017 ?auto_2014 ) ) ( AVAILABLE ?auto_2014 ) ( SURFACE-AT ?auto_2011 ?auto_2015 ) ( ON ?auto_2011 ?auto_2012 ) ( CLEAR ?auto_2011 ) ( not ( = ?auto_2010 ?auto_2012 ) ) ( not ( = ?auto_2011 ?auto_2012 ) ) ( not ( = ?auto_2022 ?auto_2012 ) ) ( IS-CRATE ?auto_2010 ) ( not ( = ?auto_2018 ?auto_2013 ) ) ( not ( = ?auto_2015 ?auto_2018 ) ) ( HOIST-AT ?auto_2019 ?auto_2018 ) ( not ( = ?auto_2017 ?auto_2019 ) ) ( not ( = ?auto_2014 ?auto_2019 ) ) ( SURFACE-AT ?auto_2010 ?auto_2018 ) ( ON ?auto_2010 ?auto_2020 ) ( CLEAR ?auto_2010 ) ( not ( = ?auto_2010 ?auto_2020 ) ) ( not ( = ?auto_2011 ?auto_2020 ) ) ( not ( = ?auto_2022 ?auto_2020 ) ) ( not ( = ?auto_2012 ?auto_2020 ) ) ( SURFACE-AT ?auto_2021 ?auto_2013 ) ( CLEAR ?auto_2021 ) ( IS-CRATE ?auto_2022 ) ( not ( = ?auto_2021 ?auto_2022 ) ) ( not ( = ?auto_2010 ?auto_2021 ) ) ( not ( = ?auto_2011 ?auto_2021 ) ) ( not ( = ?auto_2012 ?auto_2021 ) ) ( not ( = ?auto_2020 ?auto_2021 ) ) ( AVAILABLE ?auto_2017 ) ( TRUCK-AT ?auto_2016 ?auto_2018 ) ( AVAILABLE ?auto_2019 ) ( SURFACE-AT ?auto_2022 ?auto_2018 ) ( ON ?auto_2022 ?auto_2023 ) ( CLEAR ?auto_2022 ) ( not ( = ?auto_2010 ?auto_2023 ) ) ( not ( = ?auto_2011 ?auto_2023 ) ) ( not ( = ?auto_2022 ?auto_2023 ) ) ( not ( = ?auto_2012 ?auto_2023 ) ) ( not ( = ?auto_2020 ?auto_2023 ) ) ( not ( = ?auto_2021 ?auto_2023 ) ) )
    :subtasks
    ( ( !LIFT ?auto_2019 ?auto_2022 ?auto_2023 ?auto_2018 )
      ( MAKE-2CRATE ?auto_2022 ?auto_2010 ?auto_2011 )
      ( MAKE-1CRATE-VERIFY ?auto_2010 ?auto_2011 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2024 - SURFACE
      ?auto_2025 - SURFACE
      ?auto_2026 - SURFACE
    )
    :vars
    (
      ?auto_2027 - HOIST
      ?auto_2036 - PLACE
      ?auto_2029 - PLACE
      ?auto_2030 - HOIST
      ?auto_2032 - SURFACE
      ?auto_2034 - PLACE
      ?auto_2033 - HOIST
      ?auto_2037 - SURFACE
      ?auto_2028 - SURFACE
      ?auto_2031 - TRUCK
      ?auto_2035 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2027 ?auto_2036 ) ( IS-CRATE ?auto_2026 ) ( not ( = ?auto_2025 ?auto_2026 ) ) ( not ( = ?auto_2024 ?auto_2025 ) ) ( not ( = ?auto_2024 ?auto_2026 ) ) ( not ( = ?auto_2029 ?auto_2036 ) ) ( HOIST-AT ?auto_2030 ?auto_2029 ) ( not ( = ?auto_2027 ?auto_2030 ) ) ( AVAILABLE ?auto_2030 ) ( SURFACE-AT ?auto_2026 ?auto_2029 ) ( ON ?auto_2026 ?auto_2032 ) ( CLEAR ?auto_2026 ) ( not ( = ?auto_2025 ?auto_2032 ) ) ( not ( = ?auto_2026 ?auto_2032 ) ) ( not ( = ?auto_2024 ?auto_2032 ) ) ( IS-CRATE ?auto_2025 ) ( not ( = ?auto_2034 ?auto_2036 ) ) ( not ( = ?auto_2029 ?auto_2034 ) ) ( HOIST-AT ?auto_2033 ?auto_2034 ) ( not ( = ?auto_2027 ?auto_2033 ) ) ( not ( = ?auto_2030 ?auto_2033 ) ) ( SURFACE-AT ?auto_2025 ?auto_2034 ) ( ON ?auto_2025 ?auto_2037 ) ( CLEAR ?auto_2025 ) ( not ( = ?auto_2025 ?auto_2037 ) ) ( not ( = ?auto_2026 ?auto_2037 ) ) ( not ( = ?auto_2024 ?auto_2037 ) ) ( not ( = ?auto_2032 ?auto_2037 ) ) ( SURFACE-AT ?auto_2028 ?auto_2036 ) ( CLEAR ?auto_2028 ) ( IS-CRATE ?auto_2024 ) ( not ( = ?auto_2028 ?auto_2024 ) ) ( not ( = ?auto_2025 ?auto_2028 ) ) ( not ( = ?auto_2026 ?auto_2028 ) ) ( not ( = ?auto_2032 ?auto_2028 ) ) ( not ( = ?auto_2037 ?auto_2028 ) ) ( AVAILABLE ?auto_2027 ) ( TRUCK-AT ?auto_2031 ?auto_2034 ) ( AVAILABLE ?auto_2033 ) ( SURFACE-AT ?auto_2024 ?auto_2034 ) ( ON ?auto_2024 ?auto_2035 ) ( CLEAR ?auto_2024 ) ( not ( = ?auto_2025 ?auto_2035 ) ) ( not ( = ?auto_2026 ?auto_2035 ) ) ( not ( = ?auto_2024 ?auto_2035 ) ) ( not ( = ?auto_2032 ?auto_2035 ) ) ( not ( = ?auto_2037 ?auto_2035 ) ) ( not ( = ?auto_2028 ?auto_2035 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2025 ?auto_2026 )
      ( MAKE-2CRATE-VERIFY ?auto_2024 ?auto_2025 ?auto_2026 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2038 - SURFACE
      ?auto_2039 - SURFACE
      ?auto_2040 - SURFACE
      ?auto_2041 - SURFACE
    )
    :vars
    (
      ?auto_2044 - HOIST
      ?auto_2046 - PLACE
      ?auto_2048 - PLACE
      ?auto_2049 - HOIST
      ?auto_2050 - SURFACE
      ?auto_2045 - PLACE
      ?auto_2051 - HOIST
      ?auto_2042 - SURFACE
      ?auto_2047 - TRUCK
      ?auto_2043 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2044 ?auto_2046 ) ( IS-CRATE ?auto_2041 ) ( not ( = ?auto_2040 ?auto_2041 ) ) ( not ( = ?auto_2039 ?auto_2040 ) ) ( not ( = ?auto_2039 ?auto_2041 ) ) ( not ( = ?auto_2048 ?auto_2046 ) ) ( HOIST-AT ?auto_2049 ?auto_2048 ) ( not ( = ?auto_2044 ?auto_2049 ) ) ( AVAILABLE ?auto_2049 ) ( SURFACE-AT ?auto_2041 ?auto_2048 ) ( ON ?auto_2041 ?auto_2050 ) ( CLEAR ?auto_2041 ) ( not ( = ?auto_2040 ?auto_2050 ) ) ( not ( = ?auto_2041 ?auto_2050 ) ) ( not ( = ?auto_2039 ?auto_2050 ) ) ( IS-CRATE ?auto_2040 ) ( not ( = ?auto_2045 ?auto_2046 ) ) ( not ( = ?auto_2048 ?auto_2045 ) ) ( HOIST-AT ?auto_2051 ?auto_2045 ) ( not ( = ?auto_2044 ?auto_2051 ) ) ( not ( = ?auto_2049 ?auto_2051 ) ) ( SURFACE-AT ?auto_2040 ?auto_2045 ) ( ON ?auto_2040 ?auto_2042 ) ( CLEAR ?auto_2040 ) ( not ( = ?auto_2040 ?auto_2042 ) ) ( not ( = ?auto_2041 ?auto_2042 ) ) ( not ( = ?auto_2039 ?auto_2042 ) ) ( not ( = ?auto_2050 ?auto_2042 ) ) ( SURFACE-AT ?auto_2038 ?auto_2046 ) ( CLEAR ?auto_2038 ) ( IS-CRATE ?auto_2039 ) ( not ( = ?auto_2038 ?auto_2039 ) ) ( not ( = ?auto_2040 ?auto_2038 ) ) ( not ( = ?auto_2041 ?auto_2038 ) ) ( not ( = ?auto_2050 ?auto_2038 ) ) ( not ( = ?auto_2042 ?auto_2038 ) ) ( AVAILABLE ?auto_2044 ) ( TRUCK-AT ?auto_2047 ?auto_2045 ) ( AVAILABLE ?auto_2051 ) ( SURFACE-AT ?auto_2039 ?auto_2045 ) ( ON ?auto_2039 ?auto_2043 ) ( CLEAR ?auto_2039 ) ( not ( = ?auto_2040 ?auto_2043 ) ) ( not ( = ?auto_2041 ?auto_2043 ) ) ( not ( = ?auto_2039 ?auto_2043 ) ) ( not ( = ?auto_2050 ?auto_2043 ) ) ( not ( = ?auto_2042 ?auto_2043 ) ) ( not ( = ?auto_2038 ?auto_2043 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2039 ?auto_2040 ?auto_2041 )
      ( MAKE-3CRATE-VERIFY ?auto_2038 ?auto_2039 ?auto_2040 ?auto_2041 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2052 - SURFACE
      ?auto_2053 - SURFACE
    )
    :vars
    (
      ?auto_2056 - HOIST
      ?auto_2058 - PLACE
      ?auto_2065 - SURFACE
      ?auto_2061 - PLACE
      ?auto_2062 - HOIST
      ?auto_2063 - SURFACE
      ?auto_2057 - PLACE
      ?auto_2064 - HOIST
      ?auto_2054 - SURFACE
      ?auto_2060 - SURFACE
      ?auto_2055 - SURFACE
      ?auto_2059 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2056 ?auto_2058 ) ( IS-CRATE ?auto_2053 ) ( not ( = ?auto_2052 ?auto_2053 ) ) ( not ( = ?auto_2065 ?auto_2052 ) ) ( not ( = ?auto_2065 ?auto_2053 ) ) ( not ( = ?auto_2061 ?auto_2058 ) ) ( HOIST-AT ?auto_2062 ?auto_2061 ) ( not ( = ?auto_2056 ?auto_2062 ) ) ( AVAILABLE ?auto_2062 ) ( SURFACE-AT ?auto_2053 ?auto_2061 ) ( ON ?auto_2053 ?auto_2063 ) ( CLEAR ?auto_2053 ) ( not ( = ?auto_2052 ?auto_2063 ) ) ( not ( = ?auto_2053 ?auto_2063 ) ) ( not ( = ?auto_2065 ?auto_2063 ) ) ( IS-CRATE ?auto_2052 ) ( not ( = ?auto_2057 ?auto_2058 ) ) ( not ( = ?auto_2061 ?auto_2057 ) ) ( HOIST-AT ?auto_2064 ?auto_2057 ) ( not ( = ?auto_2056 ?auto_2064 ) ) ( not ( = ?auto_2062 ?auto_2064 ) ) ( SURFACE-AT ?auto_2052 ?auto_2057 ) ( ON ?auto_2052 ?auto_2054 ) ( CLEAR ?auto_2052 ) ( not ( = ?auto_2052 ?auto_2054 ) ) ( not ( = ?auto_2053 ?auto_2054 ) ) ( not ( = ?auto_2065 ?auto_2054 ) ) ( not ( = ?auto_2063 ?auto_2054 ) ) ( SURFACE-AT ?auto_2060 ?auto_2058 ) ( CLEAR ?auto_2060 ) ( IS-CRATE ?auto_2065 ) ( not ( = ?auto_2060 ?auto_2065 ) ) ( not ( = ?auto_2052 ?auto_2060 ) ) ( not ( = ?auto_2053 ?auto_2060 ) ) ( not ( = ?auto_2063 ?auto_2060 ) ) ( not ( = ?auto_2054 ?auto_2060 ) ) ( AVAILABLE ?auto_2056 ) ( AVAILABLE ?auto_2064 ) ( SURFACE-AT ?auto_2065 ?auto_2057 ) ( ON ?auto_2065 ?auto_2055 ) ( CLEAR ?auto_2065 ) ( not ( = ?auto_2052 ?auto_2055 ) ) ( not ( = ?auto_2053 ?auto_2055 ) ) ( not ( = ?auto_2065 ?auto_2055 ) ) ( not ( = ?auto_2063 ?auto_2055 ) ) ( not ( = ?auto_2054 ?auto_2055 ) ) ( not ( = ?auto_2060 ?auto_2055 ) ) ( TRUCK-AT ?auto_2059 ?auto_2058 ) )
    :subtasks
    ( ( !DRIVE ?auto_2059 ?auto_2058 ?auto_2057 )
      ( MAKE-2CRATE ?auto_2065 ?auto_2052 ?auto_2053 )
      ( MAKE-1CRATE-VERIFY ?auto_2052 ?auto_2053 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2066 - SURFACE
      ?auto_2067 - SURFACE
      ?auto_2068 - SURFACE
    )
    :vars
    (
      ?auto_2077 - HOIST
      ?auto_2071 - PLACE
      ?auto_2076 - PLACE
      ?auto_2069 - HOIST
      ?auto_2074 - SURFACE
      ?auto_2075 - PLACE
      ?auto_2078 - HOIST
      ?auto_2079 - SURFACE
      ?auto_2070 - SURFACE
      ?auto_2073 - SURFACE
      ?auto_2072 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2077 ?auto_2071 ) ( IS-CRATE ?auto_2068 ) ( not ( = ?auto_2067 ?auto_2068 ) ) ( not ( = ?auto_2066 ?auto_2067 ) ) ( not ( = ?auto_2066 ?auto_2068 ) ) ( not ( = ?auto_2076 ?auto_2071 ) ) ( HOIST-AT ?auto_2069 ?auto_2076 ) ( not ( = ?auto_2077 ?auto_2069 ) ) ( AVAILABLE ?auto_2069 ) ( SURFACE-AT ?auto_2068 ?auto_2076 ) ( ON ?auto_2068 ?auto_2074 ) ( CLEAR ?auto_2068 ) ( not ( = ?auto_2067 ?auto_2074 ) ) ( not ( = ?auto_2068 ?auto_2074 ) ) ( not ( = ?auto_2066 ?auto_2074 ) ) ( IS-CRATE ?auto_2067 ) ( not ( = ?auto_2075 ?auto_2071 ) ) ( not ( = ?auto_2076 ?auto_2075 ) ) ( HOIST-AT ?auto_2078 ?auto_2075 ) ( not ( = ?auto_2077 ?auto_2078 ) ) ( not ( = ?auto_2069 ?auto_2078 ) ) ( SURFACE-AT ?auto_2067 ?auto_2075 ) ( ON ?auto_2067 ?auto_2079 ) ( CLEAR ?auto_2067 ) ( not ( = ?auto_2067 ?auto_2079 ) ) ( not ( = ?auto_2068 ?auto_2079 ) ) ( not ( = ?auto_2066 ?auto_2079 ) ) ( not ( = ?auto_2074 ?auto_2079 ) ) ( SURFACE-AT ?auto_2070 ?auto_2071 ) ( CLEAR ?auto_2070 ) ( IS-CRATE ?auto_2066 ) ( not ( = ?auto_2070 ?auto_2066 ) ) ( not ( = ?auto_2067 ?auto_2070 ) ) ( not ( = ?auto_2068 ?auto_2070 ) ) ( not ( = ?auto_2074 ?auto_2070 ) ) ( not ( = ?auto_2079 ?auto_2070 ) ) ( AVAILABLE ?auto_2077 ) ( AVAILABLE ?auto_2078 ) ( SURFACE-AT ?auto_2066 ?auto_2075 ) ( ON ?auto_2066 ?auto_2073 ) ( CLEAR ?auto_2066 ) ( not ( = ?auto_2067 ?auto_2073 ) ) ( not ( = ?auto_2068 ?auto_2073 ) ) ( not ( = ?auto_2066 ?auto_2073 ) ) ( not ( = ?auto_2074 ?auto_2073 ) ) ( not ( = ?auto_2079 ?auto_2073 ) ) ( not ( = ?auto_2070 ?auto_2073 ) ) ( TRUCK-AT ?auto_2072 ?auto_2071 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2067 ?auto_2068 )
      ( MAKE-2CRATE-VERIFY ?auto_2066 ?auto_2067 ?auto_2068 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2080 - SURFACE
      ?auto_2081 - SURFACE
      ?auto_2082 - SURFACE
      ?auto_2083 - SURFACE
    )
    :vars
    (
      ?auto_2091 - HOIST
      ?auto_2086 - PLACE
      ?auto_2085 - PLACE
      ?auto_2093 - HOIST
      ?auto_2084 - SURFACE
      ?auto_2092 - PLACE
      ?auto_2087 - HOIST
      ?auto_2089 - SURFACE
      ?auto_2090 - SURFACE
      ?auto_2088 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2091 ?auto_2086 ) ( IS-CRATE ?auto_2083 ) ( not ( = ?auto_2082 ?auto_2083 ) ) ( not ( = ?auto_2081 ?auto_2082 ) ) ( not ( = ?auto_2081 ?auto_2083 ) ) ( not ( = ?auto_2085 ?auto_2086 ) ) ( HOIST-AT ?auto_2093 ?auto_2085 ) ( not ( = ?auto_2091 ?auto_2093 ) ) ( AVAILABLE ?auto_2093 ) ( SURFACE-AT ?auto_2083 ?auto_2085 ) ( ON ?auto_2083 ?auto_2084 ) ( CLEAR ?auto_2083 ) ( not ( = ?auto_2082 ?auto_2084 ) ) ( not ( = ?auto_2083 ?auto_2084 ) ) ( not ( = ?auto_2081 ?auto_2084 ) ) ( IS-CRATE ?auto_2082 ) ( not ( = ?auto_2092 ?auto_2086 ) ) ( not ( = ?auto_2085 ?auto_2092 ) ) ( HOIST-AT ?auto_2087 ?auto_2092 ) ( not ( = ?auto_2091 ?auto_2087 ) ) ( not ( = ?auto_2093 ?auto_2087 ) ) ( SURFACE-AT ?auto_2082 ?auto_2092 ) ( ON ?auto_2082 ?auto_2089 ) ( CLEAR ?auto_2082 ) ( not ( = ?auto_2082 ?auto_2089 ) ) ( not ( = ?auto_2083 ?auto_2089 ) ) ( not ( = ?auto_2081 ?auto_2089 ) ) ( not ( = ?auto_2084 ?auto_2089 ) ) ( SURFACE-AT ?auto_2080 ?auto_2086 ) ( CLEAR ?auto_2080 ) ( IS-CRATE ?auto_2081 ) ( not ( = ?auto_2080 ?auto_2081 ) ) ( not ( = ?auto_2082 ?auto_2080 ) ) ( not ( = ?auto_2083 ?auto_2080 ) ) ( not ( = ?auto_2084 ?auto_2080 ) ) ( not ( = ?auto_2089 ?auto_2080 ) ) ( AVAILABLE ?auto_2091 ) ( AVAILABLE ?auto_2087 ) ( SURFACE-AT ?auto_2081 ?auto_2092 ) ( ON ?auto_2081 ?auto_2090 ) ( CLEAR ?auto_2081 ) ( not ( = ?auto_2082 ?auto_2090 ) ) ( not ( = ?auto_2083 ?auto_2090 ) ) ( not ( = ?auto_2081 ?auto_2090 ) ) ( not ( = ?auto_2084 ?auto_2090 ) ) ( not ( = ?auto_2089 ?auto_2090 ) ) ( not ( = ?auto_2080 ?auto_2090 ) ) ( TRUCK-AT ?auto_2088 ?auto_2086 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2081 ?auto_2082 ?auto_2083 )
      ( MAKE-3CRATE-VERIFY ?auto_2080 ?auto_2081 ?auto_2082 ?auto_2083 ) )
  )

)

