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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1244 - SURFACE
      ?auto_1245 - SURFACE
    )
    :vars
    (
      ?auto_1246 - HOIST
      ?auto_1247 - PLACE
      ?auto_1249 - PLACE
      ?auto_1250 - HOIST
      ?auto_1251 - SURFACE
      ?auto_1248 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1246 ?auto_1247 ) ( SURFACE-AT ?auto_1244 ?auto_1247 ) ( CLEAR ?auto_1244 ) ( IS-CRATE ?auto_1245 ) ( AVAILABLE ?auto_1246 ) ( not ( = ?auto_1249 ?auto_1247 ) ) ( HOIST-AT ?auto_1250 ?auto_1249 ) ( AVAILABLE ?auto_1250 ) ( SURFACE-AT ?auto_1245 ?auto_1249 ) ( ON ?auto_1245 ?auto_1251 ) ( CLEAR ?auto_1245 ) ( TRUCK-AT ?auto_1248 ?auto_1247 ) ( not ( = ?auto_1244 ?auto_1245 ) ) ( not ( = ?auto_1244 ?auto_1251 ) ) ( not ( = ?auto_1245 ?auto_1251 ) ) ( not ( = ?auto_1246 ?auto_1250 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1248 ?auto_1247 ?auto_1249 )
      ( !LIFT ?auto_1250 ?auto_1245 ?auto_1251 ?auto_1249 )
      ( !LOAD ?auto_1250 ?auto_1245 ?auto_1248 ?auto_1249 )
      ( !DRIVE ?auto_1248 ?auto_1249 ?auto_1247 )
      ( !UNLOAD ?auto_1246 ?auto_1245 ?auto_1248 ?auto_1247 )
      ( !DROP ?auto_1246 ?auto_1245 ?auto_1244 ?auto_1247 )
      ( MAKE-1CRATE-VERIFY ?auto_1244 ?auto_1245 ) )
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
      ?auto_1259 - HOIST
      ?auto_1261 - PLACE
      ?auto_1262 - PLACE
      ?auto_1260 - HOIST
      ?auto_1258 - SURFACE
      ?auto_1265 - PLACE
      ?auto_1266 - HOIST
      ?auto_1264 - SURFACE
      ?auto_1263 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1259 ?auto_1261 ) ( IS-CRATE ?auto_1257 ) ( not ( = ?auto_1262 ?auto_1261 ) ) ( HOIST-AT ?auto_1260 ?auto_1262 ) ( AVAILABLE ?auto_1260 ) ( SURFACE-AT ?auto_1257 ?auto_1262 ) ( ON ?auto_1257 ?auto_1258 ) ( CLEAR ?auto_1257 ) ( not ( = ?auto_1256 ?auto_1257 ) ) ( not ( = ?auto_1256 ?auto_1258 ) ) ( not ( = ?auto_1257 ?auto_1258 ) ) ( not ( = ?auto_1259 ?auto_1260 ) ) ( SURFACE-AT ?auto_1255 ?auto_1261 ) ( CLEAR ?auto_1255 ) ( IS-CRATE ?auto_1256 ) ( AVAILABLE ?auto_1259 ) ( not ( = ?auto_1265 ?auto_1261 ) ) ( HOIST-AT ?auto_1266 ?auto_1265 ) ( AVAILABLE ?auto_1266 ) ( SURFACE-AT ?auto_1256 ?auto_1265 ) ( ON ?auto_1256 ?auto_1264 ) ( CLEAR ?auto_1256 ) ( TRUCK-AT ?auto_1263 ?auto_1261 ) ( not ( = ?auto_1255 ?auto_1256 ) ) ( not ( = ?auto_1255 ?auto_1264 ) ) ( not ( = ?auto_1256 ?auto_1264 ) ) ( not ( = ?auto_1259 ?auto_1266 ) ) ( not ( = ?auto_1255 ?auto_1257 ) ) ( not ( = ?auto_1255 ?auto_1258 ) ) ( not ( = ?auto_1257 ?auto_1264 ) ) ( not ( = ?auto_1262 ?auto_1265 ) ) ( not ( = ?auto_1260 ?auto_1266 ) ) ( not ( = ?auto_1258 ?auto_1264 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1255 ?auto_1256 )
      ( MAKE-1CRATE ?auto_1256 ?auto_1257 )
      ( MAKE-2CRATE-VERIFY ?auto_1255 ?auto_1256 ?auto_1257 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1269 - SURFACE
      ?auto_1270 - SURFACE
    )
    :vars
    (
      ?auto_1271 - HOIST
      ?auto_1272 - PLACE
      ?auto_1274 - PLACE
      ?auto_1275 - HOIST
      ?auto_1276 - SURFACE
      ?auto_1273 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1271 ?auto_1272 ) ( SURFACE-AT ?auto_1269 ?auto_1272 ) ( CLEAR ?auto_1269 ) ( IS-CRATE ?auto_1270 ) ( AVAILABLE ?auto_1271 ) ( not ( = ?auto_1274 ?auto_1272 ) ) ( HOIST-AT ?auto_1275 ?auto_1274 ) ( AVAILABLE ?auto_1275 ) ( SURFACE-AT ?auto_1270 ?auto_1274 ) ( ON ?auto_1270 ?auto_1276 ) ( CLEAR ?auto_1270 ) ( TRUCK-AT ?auto_1273 ?auto_1272 ) ( not ( = ?auto_1269 ?auto_1270 ) ) ( not ( = ?auto_1269 ?auto_1276 ) ) ( not ( = ?auto_1270 ?auto_1276 ) ) ( not ( = ?auto_1271 ?auto_1275 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1273 ?auto_1272 ?auto_1274 )
      ( !LIFT ?auto_1275 ?auto_1270 ?auto_1276 ?auto_1274 )
      ( !LOAD ?auto_1275 ?auto_1270 ?auto_1273 ?auto_1274 )
      ( !DRIVE ?auto_1273 ?auto_1274 ?auto_1272 )
      ( !UNLOAD ?auto_1271 ?auto_1270 ?auto_1273 ?auto_1272 )
      ( !DROP ?auto_1271 ?auto_1270 ?auto_1269 ?auto_1272 )
      ( MAKE-1CRATE-VERIFY ?auto_1269 ?auto_1270 ) )
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
      ?auto_1285 - PLACE
      ?auto_1290 - PLACE
      ?auto_1288 - HOIST
      ?auto_1286 - SURFACE
      ?auto_1291 - PLACE
      ?auto_1294 - HOIST
      ?auto_1293 - SURFACE
      ?auto_1292 - SURFACE
      ?auto_1289 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1287 ?auto_1285 ) ( IS-CRATE ?auto_1284 ) ( not ( = ?auto_1290 ?auto_1285 ) ) ( HOIST-AT ?auto_1288 ?auto_1290 ) ( SURFACE-AT ?auto_1284 ?auto_1290 ) ( ON ?auto_1284 ?auto_1286 ) ( CLEAR ?auto_1284 ) ( not ( = ?auto_1283 ?auto_1284 ) ) ( not ( = ?auto_1283 ?auto_1286 ) ) ( not ( = ?auto_1284 ?auto_1286 ) ) ( not ( = ?auto_1287 ?auto_1288 ) ) ( IS-CRATE ?auto_1283 ) ( not ( = ?auto_1291 ?auto_1285 ) ) ( HOIST-AT ?auto_1294 ?auto_1291 ) ( AVAILABLE ?auto_1294 ) ( SURFACE-AT ?auto_1283 ?auto_1291 ) ( ON ?auto_1283 ?auto_1293 ) ( CLEAR ?auto_1283 ) ( not ( = ?auto_1282 ?auto_1283 ) ) ( not ( = ?auto_1282 ?auto_1293 ) ) ( not ( = ?auto_1283 ?auto_1293 ) ) ( not ( = ?auto_1287 ?auto_1294 ) ) ( SURFACE-AT ?auto_1281 ?auto_1285 ) ( CLEAR ?auto_1281 ) ( IS-CRATE ?auto_1282 ) ( AVAILABLE ?auto_1287 ) ( AVAILABLE ?auto_1288 ) ( SURFACE-AT ?auto_1282 ?auto_1290 ) ( ON ?auto_1282 ?auto_1292 ) ( CLEAR ?auto_1282 ) ( TRUCK-AT ?auto_1289 ?auto_1285 ) ( not ( = ?auto_1281 ?auto_1282 ) ) ( not ( = ?auto_1281 ?auto_1292 ) ) ( not ( = ?auto_1282 ?auto_1292 ) ) ( not ( = ?auto_1281 ?auto_1283 ) ) ( not ( = ?auto_1281 ?auto_1293 ) ) ( not ( = ?auto_1283 ?auto_1292 ) ) ( not ( = ?auto_1291 ?auto_1290 ) ) ( not ( = ?auto_1294 ?auto_1288 ) ) ( not ( = ?auto_1293 ?auto_1292 ) ) ( not ( = ?auto_1281 ?auto_1284 ) ) ( not ( = ?auto_1281 ?auto_1286 ) ) ( not ( = ?auto_1282 ?auto_1284 ) ) ( not ( = ?auto_1282 ?auto_1286 ) ) ( not ( = ?auto_1284 ?auto_1293 ) ) ( not ( = ?auto_1284 ?auto_1292 ) ) ( not ( = ?auto_1286 ?auto_1293 ) ) ( not ( = ?auto_1286 ?auto_1292 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1281 ?auto_1282 ?auto_1283 )
      ( MAKE-1CRATE ?auto_1283 ?auto_1284 )
      ( MAKE-3CRATE-VERIFY ?auto_1281 ?auto_1282 ?auto_1283 ?auto_1284 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1297 - SURFACE
      ?auto_1298 - SURFACE
    )
    :vars
    (
      ?auto_1299 - HOIST
      ?auto_1300 - PLACE
      ?auto_1302 - PLACE
      ?auto_1303 - HOIST
      ?auto_1304 - SURFACE
      ?auto_1301 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1299 ?auto_1300 ) ( SURFACE-AT ?auto_1297 ?auto_1300 ) ( CLEAR ?auto_1297 ) ( IS-CRATE ?auto_1298 ) ( AVAILABLE ?auto_1299 ) ( not ( = ?auto_1302 ?auto_1300 ) ) ( HOIST-AT ?auto_1303 ?auto_1302 ) ( AVAILABLE ?auto_1303 ) ( SURFACE-AT ?auto_1298 ?auto_1302 ) ( ON ?auto_1298 ?auto_1304 ) ( CLEAR ?auto_1298 ) ( TRUCK-AT ?auto_1301 ?auto_1300 ) ( not ( = ?auto_1297 ?auto_1298 ) ) ( not ( = ?auto_1297 ?auto_1304 ) ) ( not ( = ?auto_1298 ?auto_1304 ) ) ( not ( = ?auto_1299 ?auto_1303 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1301 ?auto_1300 ?auto_1302 )
      ( !LIFT ?auto_1303 ?auto_1298 ?auto_1304 ?auto_1302 )
      ( !LOAD ?auto_1303 ?auto_1298 ?auto_1301 ?auto_1302 )
      ( !DRIVE ?auto_1301 ?auto_1302 ?auto_1300 )
      ( !UNLOAD ?auto_1299 ?auto_1298 ?auto_1301 ?auto_1300 )
      ( !DROP ?auto_1299 ?auto_1298 ?auto_1297 ?auto_1300 )
      ( MAKE-1CRATE-VERIFY ?auto_1297 ?auto_1298 ) )
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
      ?auto_1318 - HOIST
      ?auto_1315 - PLACE
      ?auto_1319 - PLACE
      ?auto_1317 - HOIST
      ?auto_1316 - SURFACE
      ?auto_1325 - PLACE
      ?auto_1322 - HOIST
      ?auto_1324 - SURFACE
      ?auto_1323 - SURFACE
      ?auto_1321 - SURFACE
      ?auto_1320 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1318 ?auto_1315 ) ( IS-CRATE ?auto_1314 ) ( not ( = ?auto_1319 ?auto_1315 ) ) ( HOIST-AT ?auto_1317 ?auto_1319 ) ( SURFACE-AT ?auto_1314 ?auto_1319 ) ( ON ?auto_1314 ?auto_1316 ) ( CLEAR ?auto_1314 ) ( not ( = ?auto_1313 ?auto_1314 ) ) ( not ( = ?auto_1313 ?auto_1316 ) ) ( not ( = ?auto_1314 ?auto_1316 ) ) ( not ( = ?auto_1318 ?auto_1317 ) ) ( IS-CRATE ?auto_1313 ) ( not ( = ?auto_1325 ?auto_1315 ) ) ( HOIST-AT ?auto_1322 ?auto_1325 ) ( SURFACE-AT ?auto_1313 ?auto_1325 ) ( ON ?auto_1313 ?auto_1324 ) ( CLEAR ?auto_1313 ) ( not ( = ?auto_1312 ?auto_1313 ) ) ( not ( = ?auto_1312 ?auto_1324 ) ) ( not ( = ?auto_1313 ?auto_1324 ) ) ( not ( = ?auto_1318 ?auto_1322 ) ) ( IS-CRATE ?auto_1312 ) ( AVAILABLE ?auto_1317 ) ( SURFACE-AT ?auto_1312 ?auto_1319 ) ( ON ?auto_1312 ?auto_1323 ) ( CLEAR ?auto_1312 ) ( not ( = ?auto_1311 ?auto_1312 ) ) ( not ( = ?auto_1311 ?auto_1323 ) ) ( not ( = ?auto_1312 ?auto_1323 ) ) ( SURFACE-AT ?auto_1310 ?auto_1315 ) ( CLEAR ?auto_1310 ) ( IS-CRATE ?auto_1311 ) ( AVAILABLE ?auto_1318 ) ( AVAILABLE ?auto_1322 ) ( SURFACE-AT ?auto_1311 ?auto_1325 ) ( ON ?auto_1311 ?auto_1321 ) ( CLEAR ?auto_1311 ) ( TRUCK-AT ?auto_1320 ?auto_1315 ) ( not ( = ?auto_1310 ?auto_1311 ) ) ( not ( = ?auto_1310 ?auto_1321 ) ) ( not ( = ?auto_1311 ?auto_1321 ) ) ( not ( = ?auto_1310 ?auto_1312 ) ) ( not ( = ?auto_1310 ?auto_1323 ) ) ( not ( = ?auto_1312 ?auto_1321 ) ) ( not ( = ?auto_1319 ?auto_1325 ) ) ( not ( = ?auto_1317 ?auto_1322 ) ) ( not ( = ?auto_1323 ?auto_1321 ) ) ( not ( = ?auto_1310 ?auto_1313 ) ) ( not ( = ?auto_1310 ?auto_1324 ) ) ( not ( = ?auto_1311 ?auto_1313 ) ) ( not ( = ?auto_1311 ?auto_1324 ) ) ( not ( = ?auto_1313 ?auto_1323 ) ) ( not ( = ?auto_1313 ?auto_1321 ) ) ( not ( = ?auto_1324 ?auto_1323 ) ) ( not ( = ?auto_1324 ?auto_1321 ) ) ( not ( = ?auto_1310 ?auto_1314 ) ) ( not ( = ?auto_1310 ?auto_1316 ) ) ( not ( = ?auto_1311 ?auto_1314 ) ) ( not ( = ?auto_1311 ?auto_1316 ) ) ( not ( = ?auto_1312 ?auto_1314 ) ) ( not ( = ?auto_1312 ?auto_1316 ) ) ( not ( = ?auto_1314 ?auto_1324 ) ) ( not ( = ?auto_1314 ?auto_1323 ) ) ( not ( = ?auto_1314 ?auto_1321 ) ) ( not ( = ?auto_1316 ?auto_1324 ) ) ( not ( = ?auto_1316 ?auto_1323 ) ) ( not ( = ?auto_1316 ?auto_1321 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_1310 ?auto_1311 ?auto_1312 ?auto_1313 )
      ( MAKE-1CRATE ?auto_1313 ?auto_1314 )
      ( MAKE-4CRATE-VERIFY ?auto_1310 ?auto_1311 ?auto_1312 ?auto_1313 ?auto_1314 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1328 - SURFACE
      ?auto_1329 - SURFACE
    )
    :vars
    (
      ?auto_1330 - HOIST
      ?auto_1331 - PLACE
      ?auto_1333 - PLACE
      ?auto_1334 - HOIST
      ?auto_1335 - SURFACE
      ?auto_1332 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1330 ?auto_1331 ) ( SURFACE-AT ?auto_1328 ?auto_1331 ) ( CLEAR ?auto_1328 ) ( IS-CRATE ?auto_1329 ) ( AVAILABLE ?auto_1330 ) ( not ( = ?auto_1333 ?auto_1331 ) ) ( HOIST-AT ?auto_1334 ?auto_1333 ) ( AVAILABLE ?auto_1334 ) ( SURFACE-AT ?auto_1329 ?auto_1333 ) ( ON ?auto_1329 ?auto_1335 ) ( CLEAR ?auto_1329 ) ( TRUCK-AT ?auto_1332 ?auto_1331 ) ( not ( = ?auto_1328 ?auto_1329 ) ) ( not ( = ?auto_1328 ?auto_1335 ) ) ( not ( = ?auto_1329 ?auto_1335 ) ) ( not ( = ?auto_1330 ?auto_1334 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1332 ?auto_1331 ?auto_1333 )
      ( !LIFT ?auto_1334 ?auto_1329 ?auto_1335 ?auto_1333 )
      ( !LOAD ?auto_1334 ?auto_1329 ?auto_1332 ?auto_1333 )
      ( !DRIVE ?auto_1332 ?auto_1333 ?auto_1331 )
      ( !UNLOAD ?auto_1330 ?auto_1329 ?auto_1332 ?auto_1331 )
      ( !DROP ?auto_1330 ?auto_1329 ?auto_1328 ?auto_1331 )
      ( MAKE-1CRATE-VERIFY ?auto_1328 ?auto_1329 ) )
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
      ?auto_1353 - HOIST
      ?auto_1352 - PLACE
      ?auto_1348 - PLACE
      ?auto_1351 - HOIST
      ?auto_1350 - SURFACE
      ?auto_1356 - PLACE
      ?auto_1354 - HOIST
      ?auto_1360 - SURFACE
      ?auto_1357 - PLACE
      ?auto_1355 - HOIST
      ?auto_1358 - SURFACE
      ?auto_1361 - SURFACE
      ?auto_1359 - SURFACE
      ?auto_1349 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1353 ?auto_1352 ) ( IS-CRATE ?auto_1347 ) ( not ( = ?auto_1348 ?auto_1352 ) ) ( HOIST-AT ?auto_1351 ?auto_1348 ) ( AVAILABLE ?auto_1351 ) ( SURFACE-AT ?auto_1347 ?auto_1348 ) ( ON ?auto_1347 ?auto_1350 ) ( CLEAR ?auto_1347 ) ( not ( = ?auto_1346 ?auto_1347 ) ) ( not ( = ?auto_1346 ?auto_1350 ) ) ( not ( = ?auto_1347 ?auto_1350 ) ) ( not ( = ?auto_1353 ?auto_1351 ) ) ( IS-CRATE ?auto_1346 ) ( not ( = ?auto_1356 ?auto_1352 ) ) ( HOIST-AT ?auto_1354 ?auto_1356 ) ( SURFACE-AT ?auto_1346 ?auto_1356 ) ( ON ?auto_1346 ?auto_1360 ) ( CLEAR ?auto_1346 ) ( not ( = ?auto_1345 ?auto_1346 ) ) ( not ( = ?auto_1345 ?auto_1360 ) ) ( not ( = ?auto_1346 ?auto_1360 ) ) ( not ( = ?auto_1353 ?auto_1354 ) ) ( IS-CRATE ?auto_1345 ) ( not ( = ?auto_1357 ?auto_1352 ) ) ( HOIST-AT ?auto_1355 ?auto_1357 ) ( SURFACE-AT ?auto_1345 ?auto_1357 ) ( ON ?auto_1345 ?auto_1358 ) ( CLEAR ?auto_1345 ) ( not ( = ?auto_1344 ?auto_1345 ) ) ( not ( = ?auto_1344 ?auto_1358 ) ) ( not ( = ?auto_1345 ?auto_1358 ) ) ( not ( = ?auto_1353 ?auto_1355 ) ) ( IS-CRATE ?auto_1344 ) ( AVAILABLE ?auto_1354 ) ( SURFACE-AT ?auto_1344 ?auto_1356 ) ( ON ?auto_1344 ?auto_1361 ) ( CLEAR ?auto_1344 ) ( not ( = ?auto_1343 ?auto_1344 ) ) ( not ( = ?auto_1343 ?auto_1361 ) ) ( not ( = ?auto_1344 ?auto_1361 ) ) ( SURFACE-AT ?auto_1342 ?auto_1352 ) ( CLEAR ?auto_1342 ) ( IS-CRATE ?auto_1343 ) ( AVAILABLE ?auto_1353 ) ( AVAILABLE ?auto_1355 ) ( SURFACE-AT ?auto_1343 ?auto_1357 ) ( ON ?auto_1343 ?auto_1359 ) ( CLEAR ?auto_1343 ) ( TRUCK-AT ?auto_1349 ?auto_1352 ) ( not ( = ?auto_1342 ?auto_1343 ) ) ( not ( = ?auto_1342 ?auto_1359 ) ) ( not ( = ?auto_1343 ?auto_1359 ) ) ( not ( = ?auto_1342 ?auto_1344 ) ) ( not ( = ?auto_1342 ?auto_1361 ) ) ( not ( = ?auto_1344 ?auto_1359 ) ) ( not ( = ?auto_1356 ?auto_1357 ) ) ( not ( = ?auto_1354 ?auto_1355 ) ) ( not ( = ?auto_1361 ?auto_1359 ) ) ( not ( = ?auto_1342 ?auto_1345 ) ) ( not ( = ?auto_1342 ?auto_1358 ) ) ( not ( = ?auto_1343 ?auto_1345 ) ) ( not ( = ?auto_1343 ?auto_1358 ) ) ( not ( = ?auto_1345 ?auto_1361 ) ) ( not ( = ?auto_1345 ?auto_1359 ) ) ( not ( = ?auto_1358 ?auto_1361 ) ) ( not ( = ?auto_1358 ?auto_1359 ) ) ( not ( = ?auto_1342 ?auto_1346 ) ) ( not ( = ?auto_1342 ?auto_1360 ) ) ( not ( = ?auto_1343 ?auto_1346 ) ) ( not ( = ?auto_1343 ?auto_1360 ) ) ( not ( = ?auto_1344 ?auto_1346 ) ) ( not ( = ?auto_1344 ?auto_1360 ) ) ( not ( = ?auto_1346 ?auto_1358 ) ) ( not ( = ?auto_1346 ?auto_1361 ) ) ( not ( = ?auto_1346 ?auto_1359 ) ) ( not ( = ?auto_1360 ?auto_1358 ) ) ( not ( = ?auto_1360 ?auto_1361 ) ) ( not ( = ?auto_1360 ?auto_1359 ) ) ( not ( = ?auto_1342 ?auto_1347 ) ) ( not ( = ?auto_1342 ?auto_1350 ) ) ( not ( = ?auto_1343 ?auto_1347 ) ) ( not ( = ?auto_1343 ?auto_1350 ) ) ( not ( = ?auto_1344 ?auto_1347 ) ) ( not ( = ?auto_1344 ?auto_1350 ) ) ( not ( = ?auto_1345 ?auto_1347 ) ) ( not ( = ?auto_1345 ?auto_1350 ) ) ( not ( = ?auto_1347 ?auto_1360 ) ) ( not ( = ?auto_1347 ?auto_1358 ) ) ( not ( = ?auto_1347 ?auto_1361 ) ) ( not ( = ?auto_1347 ?auto_1359 ) ) ( not ( = ?auto_1348 ?auto_1356 ) ) ( not ( = ?auto_1348 ?auto_1357 ) ) ( not ( = ?auto_1351 ?auto_1354 ) ) ( not ( = ?auto_1351 ?auto_1355 ) ) ( not ( = ?auto_1350 ?auto_1360 ) ) ( not ( = ?auto_1350 ?auto_1358 ) ) ( not ( = ?auto_1350 ?auto_1361 ) ) ( not ( = ?auto_1350 ?auto_1359 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_1342 ?auto_1343 ?auto_1344 ?auto_1345 ?auto_1346 )
      ( MAKE-1CRATE ?auto_1346 ?auto_1347 )
      ( MAKE-5CRATE-VERIFY ?auto_1342 ?auto_1343 ?auto_1344 ?auto_1345 ?auto_1346 ?auto_1347 ) )
  )

)

