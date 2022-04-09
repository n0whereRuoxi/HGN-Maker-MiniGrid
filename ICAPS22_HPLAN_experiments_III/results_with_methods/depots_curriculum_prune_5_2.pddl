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
      ?auto_1234 - SURFACE
      ?auto_1235 - SURFACE
    )
    :vars
    (
      ?auto_1236 - HOIST
      ?auto_1237 - PLACE
      ?auto_1239 - PLACE
      ?auto_1240 - HOIST
      ?auto_1241 - SURFACE
      ?auto_1238 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1236 ?auto_1237 ) ( SURFACE-AT ?auto_1234 ?auto_1237 ) ( CLEAR ?auto_1234 ) ( IS-CRATE ?auto_1235 ) ( AVAILABLE ?auto_1236 ) ( not ( = ?auto_1239 ?auto_1237 ) ) ( HOIST-AT ?auto_1240 ?auto_1239 ) ( AVAILABLE ?auto_1240 ) ( SURFACE-AT ?auto_1235 ?auto_1239 ) ( ON ?auto_1235 ?auto_1241 ) ( CLEAR ?auto_1235 ) ( TRUCK-AT ?auto_1238 ?auto_1237 ) ( not ( = ?auto_1234 ?auto_1235 ) ) ( not ( = ?auto_1234 ?auto_1241 ) ) ( not ( = ?auto_1235 ?auto_1241 ) ) ( not ( = ?auto_1236 ?auto_1240 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1238 ?auto_1237 ?auto_1239 )
      ( !LIFT ?auto_1240 ?auto_1235 ?auto_1241 ?auto_1239 )
      ( !LOAD ?auto_1240 ?auto_1235 ?auto_1238 ?auto_1239 )
      ( !DRIVE ?auto_1238 ?auto_1239 ?auto_1237 )
      ( !UNLOAD ?auto_1236 ?auto_1235 ?auto_1238 ?auto_1237 )
      ( !DROP ?auto_1236 ?auto_1235 ?auto_1234 ?auto_1237 )
      ( MAKE-1CRATE-VERIFY ?auto_1234 ?auto_1235 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1255 - SURFACE
      ?auto_1256 - SURFACE
      ?auto_1257 - SURFACE
    )
    :vars
    (
      ?auto_1263 - HOIST
      ?auto_1259 - PLACE
      ?auto_1258 - PLACE
      ?auto_1261 - HOIST
      ?auto_1262 - SURFACE
      ?auto_1266 - PLACE
      ?auto_1264 - HOIST
      ?auto_1265 - SURFACE
      ?auto_1260 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1263 ?auto_1259 ) ( IS-CRATE ?auto_1257 ) ( not ( = ?auto_1258 ?auto_1259 ) ) ( HOIST-AT ?auto_1261 ?auto_1258 ) ( AVAILABLE ?auto_1261 ) ( SURFACE-AT ?auto_1257 ?auto_1258 ) ( ON ?auto_1257 ?auto_1262 ) ( CLEAR ?auto_1257 ) ( not ( = ?auto_1256 ?auto_1257 ) ) ( not ( = ?auto_1256 ?auto_1262 ) ) ( not ( = ?auto_1257 ?auto_1262 ) ) ( not ( = ?auto_1263 ?auto_1261 ) ) ( SURFACE-AT ?auto_1255 ?auto_1259 ) ( CLEAR ?auto_1255 ) ( IS-CRATE ?auto_1256 ) ( AVAILABLE ?auto_1263 ) ( not ( = ?auto_1266 ?auto_1259 ) ) ( HOIST-AT ?auto_1264 ?auto_1266 ) ( AVAILABLE ?auto_1264 ) ( SURFACE-AT ?auto_1256 ?auto_1266 ) ( ON ?auto_1256 ?auto_1265 ) ( CLEAR ?auto_1256 ) ( TRUCK-AT ?auto_1260 ?auto_1259 ) ( not ( = ?auto_1255 ?auto_1256 ) ) ( not ( = ?auto_1255 ?auto_1265 ) ) ( not ( = ?auto_1256 ?auto_1265 ) ) ( not ( = ?auto_1263 ?auto_1264 ) ) ( not ( = ?auto_1255 ?auto_1257 ) ) ( not ( = ?auto_1255 ?auto_1262 ) ) ( not ( = ?auto_1257 ?auto_1265 ) ) ( not ( = ?auto_1258 ?auto_1266 ) ) ( not ( = ?auto_1261 ?auto_1264 ) ) ( not ( = ?auto_1262 ?auto_1265 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1255 ?auto_1256 )
      ( MAKE-1CRATE ?auto_1256 ?auto_1257 )
      ( MAKE-2CRATE-VERIFY ?auto_1255 ?auto_1256 ?auto_1257 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1281 - SURFACE
      ?auto_1282 - SURFACE
      ?auto_1283 - SURFACE
      ?auto_1284 - SURFACE
    )
    :vars
    (
      ?auto_1287 - HOIST
      ?auto_1289 - PLACE
      ?auto_1288 - PLACE
      ?auto_1285 - HOIST
      ?auto_1286 - SURFACE
      ?auto_1294 - PLACE
      ?auto_1292 - HOIST
      ?auto_1293 - SURFACE
      ?auto_1291 - SURFACE
      ?auto_1290 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1287 ?auto_1289 ) ( IS-CRATE ?auto_1284 ) ( not ( = ?auto_1288 ?auto_1289 ) ) ( HOIST-AT ?auto_1285 ?auto_1288 ) ( SURFACE-AT ?auto_1284 ?auto_1288 ) ( ON ?auto_1284 ?auto_1286 ) ( CLEAR ?auto_1284 ) ( not ( = ?auto_1283 ?auto_1284 ) ) ( not ( = ?auto_1283 ?auto_1286 ) ) ( not ( = ?auto_1284 ?auto_1286 ) ) ( not ( = ?auto_1287 ?auto_1285 ) ) ( IS-CRATE ?auto_1283 ) ( not ( = ?auto_1294 ?auto_1289 ) ) ( HOIST-AT ?auto_1292 ?auto_1294 ) ( AVAILABLE ?auto_1292 ) ( SURFACE-AT ?auto_1283 ?auto_1294 ) ( ON ?auto_1283 ?auto_1293 ) ( CLEAR ?auto_1283 ) ( not ( = ?auto_1282 ?auto_1283 ) ) ( not ( = ?auto_1282 ?auto_1293 ) ) ( not ( = ?auto_1283 ?auto_1293 ) ) ( not ( = ?auto_1287 ?auto_1292 ) ) ( SURFACE-AT ?auto_1281 ?auto_1289 ) ( CLEAR ?auto_1281 ) ( IS-CRATE ?auto_1282 ) ( AVAILABLE ?auto_1287 ) ( AVAILABLE ?auto_1285 ) ( SURFACE-AT ?auto_1282 ?auto_1288 ) ( ON ?auto_1282 ?auto_1291 ) ( CLEAR ?auto_1282 ) ( TRUCK-AT ?auto_1290 ?auto_1289 ) ( not ( = ?auto_1281 ?auto_1282 ) ) ( not ( = ?auto_1281 ?auto_1291 ) ) ( not ( = ?auto_1282 ?auto_1291 ) ) ( not ( = ?auto_1281 ?auto_1283 ) ) ( not ( = ?auto_1281 ?auto_1293 ) ) ( not ( = ?auto_1283 ?auto_1291 ) ) ( not ( = ?auto_1294 ?auto_1288 ) ) ( not ( = ?auto_1292 ?auto_1285 ) ) ( not ( = ?auto_1293 ?auto_1291 ) ) ( not ( = ?auto_1281 ?auto_1284 ) ) ( not ( = ?auto_1281 ?auto_1286 ) ) ( not ( = ?auto_1282 ?auto_1284 ) ) ( not ( = ?auto_1282 ?auto_1286 ) ) ( not ( = ?auto_1284 ?auto_1293 ) ) ( not ( = ?auto_1284 ?auto_1291 ) ) ( not ( = ?auto_1286 ?auto_1293 ) ) ( not ( = ?auto_1286 ?auto_1291 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1281 ?auto_1282 ?auto_1283 )
      ( MAKE-1CRATE ?auto_1283 ?auto_1284 )
      ( MAKE-3CRATE-VERIFY ?auto_1281 ?auto_1282 ?auto_1283 ?auto_1284 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1310 - SURFACE
      ?auto_1311 - SURFACE
      ?auto_1312 - SURFACE
      ?auto_1313 - SURFACE
      ?auto_1314 - SURFACE
    )
    :vars
    (
      ?auto_1315 - HOIST
      ?auto_1319 - PLACE
      ?auto_1317 - PLACE
      ?auto_1320 - HOIST
      ?auto_1318 - SURFACE
      ?auto_1324 - PLACE
      ?auto_1323 - HOIST
      ?auto_1322 - SURFACE
      ?auto_1321 - SURFACE
      ?auto_1325 - SURFACE
      ?auto_1316 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1315 ?auto_1319 ) ( IS-CRATE ?auto_1314 ) ( not ( = ?auto_1317 ?auto_1319 ) ) ( HOIST-AT ?auto_1320 ?auto_1317 ) ( SURFACE-AT ?auto_1314 ?auto_1317 ) ( ON ?auto_1314 ?auto_1318 ) ( CLEAR ?auto_1314 ) ( not ( = ?auto_1313 ?auto_1314 ) ) ( not ( = ?auto_1313 ?auto_1318 ) ) ( not ( = ?auto_1314 ?auto_1318 ) ) ( not ( = ?auto_1315 ?auto_1320 ) ) ( IS-CRATE ?auto_1313 ) ( not ( = ?auto_1324 ?auto_1319 ) ) ( HOIST-AT ?auto_1323 ?auto_1324 ) ( SURFACE-AT ?auto_1313 ?auto_1324 ) ( ON ?auto_1313 ?auto_1322 ) ( CLEAR ?auto_1313 ) ( not ( = ?auto_1312 ?auto_1313 ) ) ( not ( = ?auto_1312 ?auto_1322 ) ) ( not ( = ?auto_1313 ?auto_1322 ) ) ( not ( = ?auto_1315 ?auto_1323 ) ) ( IS-CRATE ?auto_1312 ) ( AVAILABLE ?auto_1320 ) ( SURFACE-AT ?auto_1312 ?auto_1317 ) ( ON ?auto_1312 ?auto_1321 ) ( CLEAR ?auto_1312 ) ( not ( = ?auto_1311 ?auto_1312 ) ) ( not ( = ?auto_1311 ?auto_1321 ) ) ( not ( = ?auto_1312 ?auto_1321 ) ) ( SURFACE-AT ?auto_1310 ?auto_1319 ) ( CLEAR ?auto_1310 ) ( IS-CRATE ?auto_1311 ) ( AVAILABLE ?auto_1315 ) ( AVAILABLE ?auto_1323 ) ( SURFACE-AT ?auto_1311 ?auto_1324 ) ( ON ?auto_1311 ?auto_1325 ) ( CLEAR ?auto_1311 ) ( TRUCK-AT ?auto_1316 ?auto_1319 ) ( not ( = ?auto_1310 ?auto_1311 ) ) ( not ( = ?auto_1310 ?auto_1325 ) ) ( not ( = ?auto_1311 ?auto_1325 ) ) ( not ( = ?auto_1310 ?auto_1312 ) ) ( not ( = ?auto_1310 ?auto_1321 ) ) ( not ( = ?auto_1312 ?auto_1325 ) ) ( not ( = ?auto_1317 ?auto_1324 ) ) ( not ( = ?auto_1320 ?auto_1323 ) ) ( not ( = ?auto_1321 ?auto_1325 ) ) ( not ( = ?auto_1310 ?auto_1313 ) ) ( not ( = ?auto_1310 ?auto_1322 ) ) ( not ( = ?auto_1311 ?auto_1313 ) ) ( not ( = ?auto_1311 ?auto_1322 ) ) ( not ( = ?auto_1313 ?auto_1321 ) ) ( not ( = ?auto_1313 ?auto_1325 ) ) ( not ( = ?auto_1322 ?auto_1321 ) ) ( not ( = ?auto_1322 ?auto_1325 ) ) ( not ( = ?auto_1310 ?auto_1314 ) ) ( not ( = ?auto_1310 ?auto_1318 ) ) ( not ( = ?auto_1311 ?auto_1314 ) ) ( not ( = ?auto_1311 ?auto_1318 ) ) ( not ( = ?auto_1312 ?auto_1314 ) ) ( not ( = ?auto_1312 ?auto_1318 ) ) ( not ( = ?auto_1314 ?auto_1322 ) ) ( not ( = ?auto_1314 ?auto_1321 ) ) ( not ( = ?auto_1314 ?auto_1325 ) ) ( not ( = ?auto_1318 ?auto_1322 ) ) ( not ( = ?auto_1318 ?auto_1321 ) ) ( not ( = ?auto_1318 ?auto_1325 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_1310 ?auto_1311 ?auto_1312 ?auto_1313 )
      ( MAKE-1CRATE ?auto_1313 ?auto_1314 )
      ( MAKE-4CRATE-VERIFY ?auto_1310 ?auto_1311 ?auto_1312 ?auto_1313 ?auto_1314 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1342 - SURFACE
      ?auto_1343 - SURFACE
      ?auto_1344 - SURFACE
      ?auto_1345 - SURFACE
      ?auto_1346 - SURFACE
      ?auto_1347 - SURFACE
    )
    :vars
    (
      ?auto_1348 - HOIST
      ?auto_1353 - PLACE
      ?auto_1350 - PLACE
      ?auto_1349 - HOIST
      ?auto_1351 - SURFACE
      ?auto_1358 - PLACE
      ?auto_1359 - HOIST
      ?auto_1354 - SURFACE
      ?auto_1357 - PLACE
      ?auto_1361 - HOIST
      ?auto_1355 - SURFACE
      ?auto_1360 - SURFACE
      ?auto_1356 - SURFACE
      ?auto_1352 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1348 ?auto_1353 ) ( IS-CRATE ?auto_1347 ) ( not ( = ?auto_1350 ?auto_1353 ) ) ( HOIST-AT ?auto_1349 ?auto_1350 ) ( AVAILABLE ?auto_1349 ) ( SURFACE-AT ?auto_1347 ?auto_1350 ) ( ON ?auto_1347 ?auto_1351 ) ( CLEAR ?auto_1347 ) ( not ( = ?auto_1346 ?auto_1347 ) ) ( not ( = ?auto_1346 ?auto_1351 ) ) ( not ( = ?auto_1347 ?auto_1351 ) ) ( not ( = ?auto_1348 ?auto_1349 ) ) ( IS-CRATE ?auto_1346 ) ( not ( = ?auto_1358 ?auto_1353 ) ) ( HOIST-AT ?auto_1359 ?auto_1358 ) ( SURFACE-AT ?auto_1346 ?auto_1358 ) ( ON ?auto_1346 ?auto_1354 ) ( CLEAR ?auto_1346 ) ( not ( = ?auto_1345 ?auto_1346 ) ) ( not ( = ?auto_1345 ?auto_1354 ) ) ( not ( = ?auto_1346 ?auto_1354 ) ) ( not ( = ?auto_1348 ?auto_1359 ) ) ( IS-CRATE ?auto_1345 ) ( not ( = ?auto_1357 ?auto_1353 ) ) ( HOIST-AT ?auto_1361 ?auto_1357 ) ( SURFACE-AT ?auto_1345 ?auto_1357 ) ( ON ?auto_1345 ?auto_1355 ) ( CLEAR ?auto_1345 ) ( not ( = ?auto_1344 ?auto_1345 ) ) ( not ( = ?auto_1344 ?auto_1355 ) ) ( not ( = ?auto_1345 ?auto_1355 ) ) ( not ( = ?auto_1348 ?auto_1361 ) ) ( IS-CRATE ?auto_1344 ) ( AVAILABLE ?auto_1359 ) ( SURFACE-AT ?auto_1344 ?auto_1358 ) ( ON ?auto_1344 ?auto_1360 ) ( CLEAR ?auto_1344 ) ( not ( = ?auto_1343 ?auto_1344 ) ) ( not ( = ?auto_1343 ?auto_1360 ) ) ( not ( = ?auto_1344 ?auto_1360 ) ) ( SURFACE-AT ?auto_1342 ?auto_1353 ) ( CLEAR ?auto_1342 ) ( IS-CRATE ?auto_1343 ) ( AVAILABLE ?auto_1348 ) ( AVAILABLE ?auto_1361 ) ( SURFACE-AT ?auto_1343 ?auto_1357 ) ( ON ?auto_1343 ?auto_1356 ) ( CLEAR ?auto_1343 ) ( TRUCK-AT ?auto_1352 ?auto_1353 ) ( not ( = ?auto_1342 ?auto_1343 ) ) ( not ( = ?auto_1342 ?auto_1356 ) ) ( not ( = ?auto_1343 ?auto_1356 ) ) ( not ( = ?auto_1342 ?auto_1344 ) ) ( not ( = ?auto_1342 ?auto_1360 ) ) ( not ( = ?auto_1344 ?auto_1356 ) ) ( not ( = ?auto_1358 ?auto_1357 ) ) ( not ( = ?auto_1359 ?auto_1361 ) ) ( not ( = ?auto_1360 ?auto_1356 ) ) ( not ( = ?auto_1342 ?auto_1345 ) ) ( not ( = ?auto_1342 ?auto_1355 ) ) ( not ( = ?auto_1343 ?auto_1345 ) ) ( not ( = ?auto_1343 ?auto_1355 ) ) ( not ( = ?auto_1345 ?auto_1360 ) ) ( not ( = ?auto_1345 ?auto_1356 ) ) ( not ( = ?auto_1355 ?auto_1360 ) ) ( not ( = ?auto_1355 ?auto_1356 ) ) ( not ( = ?auto_1342 ?auto_1346 ) ) ( not ( = ?auto_1342 ?auto_1354 ) ) ( not ( = ?auto_1343 ?auto_1346 ) ) ( not ( = ?auto_1343 ?auto_1354 ) ) ( not ( = ?auto_1344 ?auto_1346 ) ) ( not ( = ?auto_1344 ?auto_1354 ) ) ( not ( = ?auto_1346 ?auto_1355 ) ) ( not ( = ?auto_1346 ?auto_1360 ) ) ( not ( = ?auto_1346 ?auto_1356 ) ) ( not ( = ?auto_1354 ?auto_1355 ) ) ( not ( = ?auto_1354 ?auto_1360 ) ) ( not ( = ?auto_1354 ?auto_1356 ) ) ( not ( = ?auto_1342 ?auto_1347 ) ) ( not ( = ?auto_1342 ?auto_1351 ) ) ( not ( = ?auto_1343 ?auto_1347 ) ) ( not ( = ?auto_1343 ?auto_1351 ) ) ( not ( = ?auto_1344 ?auto_1347 ) ) ( not ( = ?auto_1344 ?auto_1351 ) ) ( not ( = ?auto_1345 ?auto_1347 ) ) ( not ( = ?auto_1345 ?auto_1351 ) ) ( not ( = ?auto_1347 ?auto_1354 ) ) ( not ( = ?auto_1347 ?auto_1355 ) ) ( not ( = ?auto_1347 ?auto_1360 ) ) ( not ( = ?auto_1347 ?auto_1356 ) ) ( not ( = ?auto_1350 ?auto_1358 ) ) ( not ( = ?auto_1350 ?auto_1357 ) ) ( not ( = ?auto_1349 ?auto_1359 ) ) ( not ( = ?auto_1349 ?auto_1361 ) ) ( not ( = ?auto_1351 ?auto_1354 ) ) ( not ( = ?auto_1351 ?auto_1355 ) ) ( not ( = ?auto_1351 ?auto_1360 ) ) ( not ( = ?auto_1351 ?auto_1356 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_1342 ?auto_1343 ?auto_1344 ?auto_1345 ?auto_1346 )
      ( MAKE-1CRATE ?auto_1346 ?auto_1347 )
      ( MAKE-5CRATE-VERIFY ?auto_1342 ?auto_1343 ?auto_1344 ?auto_1345 ?auto_1346 ?auto_1347 ) )
  )

)

