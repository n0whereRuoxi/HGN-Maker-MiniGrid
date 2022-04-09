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
      ?auto_1231 - SURFACE
      ?auto_1232 - SURFACE
    )
    :vars
    (
      ?auto_1233 - HOIST
      ?auto_1234 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1233 ?auto_1234 ) ( SURFACE-AT ?auto_1231 ?auto_1234 ) ( CLEAR ?auto_1231 ) ( LIFTING ?auto_1233 ?auto_1232 ) ( IS-CRATE ?auto_1232 ) ( not ( = ?auto_1231 ?auto_1232 ) ) )
    :subtasks
    ( ( !DROP ?auto_1233 ?auto_1232 ?auto_1231 ?auto_1234 )
      ( MAKE-1CRATE-VERIFY ?auto_1231 ?auto_1232 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1235 - SURFACE
      ?auto_1236 - SURFACE
    )
    :vars
    (
      ?auto_1238 - HOIST
      ?auto_1237 - PLACE
      ?auto_1239 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1238 ?auto_1237 ) ( SURFACE-AT ?auto_1235 ?auto_1237 ) ( CLEAR ?auto_1235 ) ( IS-CRATE ?auto_1236 ) ( not ( = ?auto_1235 ?auto_1236 ) ) ( TRUCK-AT ?auto_1239 ?auto_1237 ) ( AVAILABLE ?auto_1238 ) ( IN ?auto_1236 ?auto_1239 ) )
    :subtasks
    ( ( !UNLOAD ?auto_1238 ?auto_1236 ?auto_1239 ?auto_1237 )
      ( MAKE-1CRATE ?auto_1235 ?auto_1236 )
      ( MAKE-1CRATE-VERIFY ?auto_1235 ?auto_1236 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1240 - SURFACE
      ?auto_1241 - SURFACE
    )
    :vars
    (
      ?auto_1244 - HOIST
      ?auto_1243 - PLACE
      ?auto_1242 - TRUCK
      ?auto_1245 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1244 ?auto_1243 ) ( SURFACE-AT ?auto_1240 ?auto_1243 ) ( CLEAR ?auto_1240 ) ( IS-CRATE ?auto_1241 ) ( not ( = ?auto_1240 ?auto_1241 ) ) ( AVAILABLE ?auto_1244 ) ( IN ?auto_1241 ?auto_1242 ) ( TRUCK-AT ?auto_1242 ?auto_1245 ) ( not ( = ?auto_1245 ?auto_1243 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1242 ?auto_1245 ?auto_1243 )
      ( MAKE-1CRATE ?auto_1240 ?auto_1241 )
      ( MAKE-1CRATE-VERIFY ?auto_1240 ?auto_1241 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1246 - SURFACE
      ?auto_1247 - SURFACE
    )
    :vars
    (
      ?auto_1248 - HOIST
      ?auto_1250 - PLACE
      ?auto_1249 - TRUCK
      ?auto_1251 - PLACE
      ?auto_1252 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1248 ?auto_1250 ) ( SURFACE-AT ?auto_1246 ?auto_1250 ) ( CLEAR ?auto_1246 ) ( IS-CRATE ?auto_1247 ) ( not ( = ?auto_1246 ?auto_1247 ) ) ( AVAILABLE ?auto_1248 ) ( TRUCK-AT ?auto_1249 ?auto_1251 ) ( not ( = ?auto_1251 ?auto_1250 ) ) ( HOIST-AT ?auto_1252 ?auto_1251 ) ( LIFTING ?auto_1252 ?auto_1247 ) ( not ( = ?auto_1248 ?auto_1252 ) ) )
    :subtasks
    ( ( !LOAD ?auto_1252 ?auto_1247 ?auto_1249 ?auto_1251 )
      ( MAKE-1CRATE ?auto_1246 ?auto_1247 )
      ( MAKE-1CRATE-VERIFY ?auto_1246 ?auto_1247 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1253 - SURFACE
      ?auto_1254 - SURFACE
    )
    :vars
    (
      ?auto_1258 - HOIST
      ?auto_1256 - PLACE
      ?auto_1259 - TRUCK
      ?auto_1257 - PLACE
      ?auto_1255 - HOIST
      ?auto_1260 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1258 ?auto_1256 ) ( SURFACE-AT ?auto_1253 ?auto_1256 ) ( CLEAR ?auto_1253 ) ( IS-CRATE ?auto_1254 ) ( not ( = ?auto_1253 ?auto_1254 ) ) ( AVAILABLE ?auto_1258 ) ( TRUCK-AT ?auto_1259 ?auto_1257 ) ( not ( = ?auto_1257 ?auto_1256 ) ) ( HOIST-AT ?auto_1255 ?auto_1257 ) ( not ( = ?auto_1258 ?auto_1255 ) ) ( AVAILABLE ?auto_1255 ) ( SURFACE-AT ?auto_1254 ?auto_1257 ) ( ON ?auto_1254 ?auto_1260 ) ( CLEAR ?auto_1254 ) ( not ( = ?auto_1253 ?auto_1260 ) ) ( not ( = ?auto_1254 ?auto_1260 ) ) )
    :subtasks
    ( ( !LIFT ?auto_1255 ?auto_1254 ?auto_1260 ?auto_1257 )
      ( MAKE-1CRATE ?auto_1253 ?auto_1254 )
      ( MAKE-1CRATE-VERIFY ?auto_1253 ?auto_1254 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1261 - SURFACE
      ?auto_1262 - SURFACE
    )
    :vars
    (
      ?auto_1265 - HOIST
      ?auto_1264 - PLACE
      ?auto_1268 - PLACE
      ?auto_1267 - HOIST
      ?auto_1266 - SURFACE
      ?auto_1263 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1265 ?auto_1264 ) ( SURFACE-AT ?auto_1261 ?auto_1264 ) ( CLEAR ?auto_1261 ) ( IS-CRATE ?auto_1262 ) ( not ( = ?auto_1261 ?auto_1262 ) ) ( AVAILABLE ?auto_1265 ) ( not ( = ?auto_1268 ?auto_1264 ) ) ( HOIST-AT ?auto_1267 ?auto_1268 ) ( not ( = ?auto_1265 ?auto_1267 ) ) ( AVAILABLE ?auto_1267 ) ( SURFACE-AT ?auto_1262 ?auto_1268 ) ( ON ?auto_1262 ?auto_1266 ) ( CLEAR ?auto_1262 ) ( not ( = ?auto_1261 ?auto_1266 ) ) ( not ( = ?auto_1262 ?auto_1266 ) ) ( TRUCK-AT ?auto_1263 ?auto_1264 ) )
    :subtasks
    ( ( !DRIVE ?auto_1263 ?auto_1264 ?auto_1268 )
      ( MAKE-1CRATE ?auto_1261 ?auto_1262 )
      ( MAKE-1CRATE-VERIFY ?auto_1261 ?auto_1262 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1274 - SURFACE
      ?auto_1275 - SURFACE
    )
    :vars
    (
      ?auto_1276 - HOIST
      ?auto_1277 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1276 ?auto_1277 ) ( SURFACE-AT ?auto_1274 ?auto_1277 ) ( CLEAR ?auto_1274 ) ( LIFTING ?auto_1276 ?auto_1275 ) ( IS-CRATE ?auto_1275 ) ( not ( = ?auto_1274 ?auto_1275 ) ) )
    :subtasks
    ( ( !DROP ?auto_1276 ?auto_1275 ?auto_1274 ?auto_1277 )
      ( MAKE-1CRATE-VERIFY ?auto_1274 ?auto_1275 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1278 - SURFACE
      ?auto_1279 - SURFACE
      ?auto_1280 - SURFACE
    )
    :vars
    (
      ?auto_1282 - HOIST
      ?auto_1281 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1282 ?auto_1281 ) ( SURFACE-AT ?auto_1279 ?auto_1281 ) ( CLEAR ?auto_1279 ) ( LIFTING ?auto_1282 ?auto_1280 ) ( IS-CRATE ?auto_1280 ) ( not ( = ?auto_1279 ?auto_1280 ) ) ( ON ?auto_1279 ?auto_1278 ) ( not ( = ?auto_1278 ?auto_1279 ) ) ( not ( = ?auto_1278 ?auto_1280 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1279 ?auto_1280 )
      ( MAKE-2CRATE-VERIFY ?auto_1278 ?auto_1279 ?auto_1280 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1283 - SURFACE
      ?auto_1284 - SURFACE
    )
    :vars
    (
      ?auto_1286 - HOIST
      ?auto_1285 - PLACE
      ?auto_1287 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1286 ?auto_1285 ) ( SURFACE-AT ?auto_1283 ?auto_1285 ) ( CLEAR ?auto_1283 ) ( IS-CRATE ?auto_1284 ) ( not ( = ?auto_1283 ?auto_1284 ) ) ( TRUCK-AT ?auto_1287 ?auto_1285 ) ( AVAILABLE ?auto_1286 ) ( IN ?auto_1284 ?auto_1287 ) )
    :subtasks
    ( ( !UNLOAD ?auto_1286 ?auto_1284 ?auto_1287 ?auto_1285 )
      ( MAKE-1CRATE ?auto_1283 ?auto_1284 )
      ( MAKE-1CRATE-VERIFY ?auto_1283 ?auto_1284 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1288 - SURFACE
      ?auto_1289 - SURFACE
      ?auto_1290 - SURFACE
    )
    :vars
    (
      ?auto_1293 - HOIST
      ?auto_1291 - PLACE
      ?auto_1292 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1293 ?auto_1291 ) ( SURFACE-AT ?auto_1289 ?auto_1291 ) ( CLEAR ?auto_1289 ) ( IS-CRATE ?auto_1290 ) ( not ( = ?auto_1289 ?auto_1290 ) ) ( TRUCK-AT ?auto_1292 ?auto_1291 ) ( AVAILABLE ?auto_1293 ) ( IN ?auto_1290 ?auto_1292 ) ( ON ?auto_1289 ?auto_1288 ) ( not ( = ?auto_1288 ?auto_1289 ) ) ( not ( = ?auto_1288 ?auto_1290 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1289 ?auto_1290 )
      ( MAKE-2CRATE-VERIFY ?auto_1288 ?auto_1289 ?auto_1290 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1294 - SURFACE
      ?auto_1295 - SURFACE
    )
    :vars
    (
      ?auto_1297 - HOIST
      ?auto_1298 - PLACE
      ?auto_1296 - TRUCK
      ?auto_1299 - SURFACE
      ?auto_1300 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1297 ?auto_1298 ) ( SURFACE-AT ?auto_1294 ?auto_1298 ) ( CLEAR ?auto_1294 ) ( IS-CRATE ?auto_1295 ) ( not ( = ?auto_1294 ?auto_1295 ) ) ( AVAILABLE ?auto_1297 ) ( IN ?auto_1295 ?auto_1296 ) ( ON ?auto_1294 ?auto_1299 ) ( not ( = ?auto_1299 ?auto_1294 ) ) ( not ( = ?auto_1299 ?auto_1295 ) ) ( TRUCK-AT ?auto_1296 ?auto_1300 ) ( not ( = ?auto_1300 ?auto_1298 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1296 ?auto_1300 ?auto_1298 )
      ( MAKE-2CRATE ?auto_1299 ?auto_1294 ?auto_1295 )
      ( MAKE-1CRATE-VERIFY ?auto_1294 ?auto_1295 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1301 - SURFACE
      ?auto_1302 - SURFACE
      ?auto_1303 - SURFACE
    )
    :vars
    (
      ?auto_1306 - HOIST
      ?auto_1305 - PLACE
      ?auto_1304 - TRUCK
      ?auto_1307 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1306 ?auto_1305 ) ( SURFACE-AT ?auto_1302 ?auto_1305 ) ( CLEAR ?auto_1302 ) ( IS-CRATE ?auto_1303 ) ( not ( = ?auto_1302 ?auto_1303 ) ) ( AVAILABLE ?auto_1306 ) ( IN ?auto_1303 ?auto_1304 ) ( ON ?auto_1302 ?auto_1301 ) ( not ( = ?auto_1301 ?auto_1302 ) ) ( not ( = ?auto_1301 ?auto_1303 ) ) ( TRUCK-AT ?auto_1304 ?auto_1307 ) ( not ( = ?auto_1307 ?auto_1305 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1302 ?auto_1303 )
      ( MAKE-2CRATE-VERIFY ?auto_1301 ?auto_1302 ?auto_1303 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1308 - SURFACE
      ?auto_1309 - SURFACE
    )
    :vars
    (
      ?auto_1312 - HOIST
      ?auto_1314 - PLACE
      ?auto_1310 - SURFACE
      ?auto_1311 - TRUCK
      ?auto_1313 - PLACE
      ?auto_1315 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1312 ?auto_1314 ) ( SURFACE-AT ?auto_1308 ?auto_1314 ) ( CLEAR ?auto_1308 ) ( IS-CRATE ?auto_1309 ) ( not ( = ?auto_1308 ?auto_1309 ) ) ( AVAILABLE ?auto_1312 ) ( ON ?auto_1308 ?auto_1310 ) ( not ( = ?auto_1310 ?auto_1308 ) ) ( not ( = ?auto_1310 ?auto_1309 ) ) ( TRUCK-AT ?auto_1311 ?auto_1313 ) ( not ( = ?auto_1313 ?auto_1314 ) ) ( HOIST-AT ?auto_1315 ?auto_1313 ) ( LIFTING ?auto_1315 ?auto_1309 ) ( not ( = ?auto_1312 ?auto_1315 ) ) )
    :subtasks
    ( ( !LOAD ?auto_1315 ?auto_1309 ?auto_1311 ?auto_1313 )
      ( MAKE-2CRATE ?auto_1310 ?auto_1308 ?auto_1309 )
      ( MAKE-1CRATE-VERIFY ?auto_1308 ?auto_1309 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1316 - SURFACE
      ?auto_1317 - SURFACE
      ?auto_1318 - SURFACE
    )
    :vars
    (
      ?auto_1321 - HOIST
      ?auto_1320 - PLACE
      ?auto_1319 - TRUCK
      ?auto_1323 - PLACE
      ?auto_1322 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1321 ?auto_1320 ) ( SURFACE-AT ?auto_1317 ?auto_1320 ) ( CLEAR ?auto_1317 ) ( IS-CRATE ?auto_1318 ) ( not ( = ?auto_1317 ?auto_1318 ) ) ( AVAILABLE ?auto_1321 ) ( ON ?auto_1317 ?auto_1316 ) ( not ( = ?auto_1316 ?auto_1317 ) ) ( not ( = ?auto_1316 ?auto_1318 ) ) ( TRUCK-AT ?auto_1319 ?auto_1323 ) ( not ( = ?auto_1323 ?auto_1320 ) ) ( HOIST-AT ?auto_1322 ?auto_1323 ) ( LIFTING ?auto_1322 ?auto_1318 ) ( not ( = ?auto_1321 ?auto_1322 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1317 ?auto_1318 )
      ( MAKE-2CRATE-VERIFY ?auto_1316 ?auto_1317 ?auto_1318 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1324 - SURFACE
      ?auto_1325 - SURFACE
    )
    :vars
    (
      ?auto_1326 - HOIST
      ?auto_1329 - PLACE
      ?auto_1330 - SURFACE
      ?auto_1327 - TRUCK
      ?auto_1331 - PLACE
      ?auto_1328 - HOIST
      ?auto_1332 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1326 ?auto_1329 ) ( SURFACE-AT ?auto_1324 ?auto_1329 ) ( CLEAR ?auto_1324 ) ( IS-CRATE ?auto_1325 ) ( not ( = ?auto_1324 ?auto_1325 ) ) ( AVAILABLE ?auto_1326 ) ( ON ?auto_1324 ?auto_1330 ) ( not ( = ?auto_1330 ?auto_1324 ) ) ( not ( = ?auto_1330 ?auto_1325 ) ) ( TRUCK-AT ?auto_1327 ?auto_1331 ) ( not ( = ?auto_1331 ?auto_1329 ) ) ( HOIST-AT ?auto_1328 ?auto_1331 ) ( not ( = ?auto_1326 ?auto_1328 ) ) ( AVAILABLE ?auto_1328 ) ( SURFACE-AT ?auto_1325 ?auto_1331 ) ( ON ?auto_1325 ?auto_1332 ) ( CLEAR ?auto_1325 ) ( not ( = ?auto_1324 ?auto_1332 ) ) ( not ( = ?auto_1325 ?auto_1332 ) ) ( not ( = ?auto_1330 ?auto_1332 ) ) )
    :subtasks
    ( ( !LIFT ?auto_1328 ?auto_1325 ?auto_1332 ?auto_1331 )
      ( MAKE-2CRATE ?auto_1330 ?auto_1324 ?auto_1325 )
      ( MAKE-1CRATE-VERIFY ?auto_1324 ?auto_1325 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1333 - SURFACE
      ?auto_1334 - SURFACE
      ?auto_1335 - SURFACE
    )
    :vars
    (
      ?auto_1341 - HOIST
      ?auto_1336 - PLACE
      ?auto_1339 - TRUCK
      ?auto_1338 - PLACE
      ?auto_1337 - HOIST
      ?auto_1340 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1341 ?auto_1336 ) ( SURFACE-AT ?auto_1334 ?auto_1336 ) ( CLEAR ?auto_1334 ) ( IS-CRATE ?auto_1335 ) ( not ( = ?auto_1334 ?auto_1335 ) ) ( AVAILABLE ?auto_1341 ) ( ON ?auto_1334 ?auto_1333 ) ( not ( = ?auto_1333 ?auto_1334 ) ) ( not ( = ?auto_1333 ?auto_1335 ) ) ( TRUCK-AT ?auto_1339 ?auto_1338 ) ( not ( = ?auto_1338 ?auto_1336 ) ) ( HOIST-AT ?auto_1337 ?auto_1338 ) ( not ( = ?auto_1341 ?auto_1337 ) ) ( AVAILABLE ?auto_1337 ) ( SURFACE-AT ?auto_1335 ?auto_1338 ) ( ON ?auto_1335 ?auto_1340 ) ( CLEAR ?auto_1335 ) ( not ( = ?auto_1334 ?auto_1340 ) ) ( not ( = ?auto_1335 ?auto_1340 ) ) ( not ( = ?auto_1333 ?auto_1340 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1334 ?auto_1335 )
      ( MAKE-2CRATE-VERIFY ?auto_1333 ?auto_1334 ?auto_1335 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1342 - SURFACE
      ?auto_1343 - SURFACE
    )
    :vars
    (
      ?auto_1346 - HOIST
      ?auto_1347 - PLACE
      ?auto_1345 - SURFACE
      ?auto_1349 - PLACE
      ?auto_1350 - HOIST
      ?auto_1344 - SURFACE
      ?auto_1348 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1346 ?auto_1347 ) ( SURFACE-AT ?auto_1342 ?auto_1347 ) ( CLEAR ?auto_1342 ) ( IS-CRATE ?auto_1343 ) ( not ( = ?auto_1342 ?auto_1343 ) ) ( AVAILABLE ?auto_1346 ) ( ON ?auto_1342 ?auto_1345 ) ( not ( = ?auto_1345 ?auto_1342 ) ) ( not ( = ?auto_1345 ?auto_1343 ) ) ( not ( = ?auto_1349 ?auto_1347 ) ) ( HOIST-AT ?auto_1350 ?auto_1349 ) ( not ( = ?auto_1346 ?auto_1350 ) ) ( AVAILABLE ?auto_1350 ) ( SURFACE-AT ?auto_1343 ?auto_1349 ) ( ON ?auto_1343 ?auto_1344 ) ( CLEAR ?auto_1343 ) ( not ( = ?auto_1342 ?auto_1344 ) ) ( not ( = ?auto_1343 ?auto_1344 ) ) ( not ( = ?auto_1345 ?auto_1344 ) ) ( TRUCK-AT ?auto_1348 ?auto_1347 ) )
    :subtasks
    ( ( !DRIVE ?auto_1348 ?auto_1347 ?auto_1349 )
      ( MAKE-2CRATE ?auto_1345 ?auto_1342 ?auto_1343 )
      ( MAKE-1CRATE-VERIFY ?auto_1342 ?auto_1343 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1351 - SURFACE
      ?auto_1352 - SURFACE
      ?auto_1353 - SURFACE
    )
    :vars
    (
      ?auto_1357 - HOIST
      ?auto_1356 - PLACE
      ?auto_1355 - PLACE
      ?auto_1359 - HOIST
      ?auto_1354 - SURFACE
      ?auto_1358 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1357 ?auto_1356 ) ( SURFACE-AT ?auto_1352 ?auto_1356 ) ( CLEAR ?auto_1352 ) ( IS-CRATE ?auto_1353 ) ( not ( = ?auto_1352 ?auto_1353 ) ) ( AVAILABLE ?auto_1357 ) ( ON ?auto_1352 ?auto_1351 ) ( not ( = ?auto_1351 ?auto_1352 ) ) ( not ( = ?auto_1351 ?auto_1353 ) ) ( not ( = ?auto_1355 ?auto_1356 ) ) ( HOIST-AT ?auto_1359 ?auto_1355 ) ( not ( = ?auto_1357 ?auto_1359 ) ) ( AVAILABLE ?auto_1359 ) ( SURFACE-AT ?auto_1353 ?auto_1355 ) ( ON ?auto_1353 ?auto_1354 ) ( CLEAR ?auto_1353 ) ( not ( = ?auto_1352 ?auto_1354 ) ) ( not ( = ?auto_1353 ?auto_1354 ) ) ( not ( = ?auto_1351 ?auto_1354 ) ) ( TRUCK-AT ?auto_1358 ?auto_1356 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1352 ?auto_1353 )
      ( MAKE-2CRATE-VERIFY ?auto_1351 ?auto_1352 ?auto_1353 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1360 - SURFACE
      ?auto_1361 - SURFACE
    )
    :vars
    (
      ?auto_1362 - HOIST
      ?auto_1367 - PLACE
      ?auto_1368 - SURFACE
      ?auto_1363 - PLACE
      ?auto_1364 - HOIST
      ?auto_1365 - SURFACE
      ?auto_1366 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1362 ?auto_1367 ) ( IS-CRATE ?auto_1361 ) ( not ( = ?auto_1360 ?auto_1361 ) ) ( not ( = ?auto_1368 ?auto_1360 ) ) ( not ( = ?auto_1368 ?auto_1361 ) ) ( not ( = ?auto_1363 ?auto_1367 ) ) ( HOIST-AT ?auto_1364 ?auto_1363 ) ( not ( = ?auto_1362 ?auto_1364 ) ) ( AVAILABLE ?auto_1364 ) ( SURFACE-AT ?auto_1361 ?auto_1363 ) ( ON ?auto_1361 ?auto_1365 ) ( CLEAR ?auto_1361 ) ( not ( = ?auto_1360 ?auto_1365 ) ) ( not ( = ?auto_1361 ?auto_1365 ) ) ( not ( = ?auto_1368 ?auto_1365 ) ) ( TRUCK-AT ?auto_1366 ?auto_1367 ) ( SURFACE-AT ?auto_1368 ?auto_1367 ) ( CLEAR ?auto_1368 ) ( LIFTING ?auto_1362 ?auto_1360 ) ( IS-CRATE ?auto_1360 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1368 ?auto_1360 )
      ( MAKE-2CRATE ?auto_1368 ?auto_1360 ?auto_1361 )
      ( MAKE-1CRATE-VERIFY ?auto_1360 ?auto_1361 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1369 - SURFACE
      ?auto_1370 - SURFACE
      ?auto_1371 - SURFACE
    )
    :vars
    (
      ?auto_1376 - HOIST
      ?auto_1374 - PLACE
      ?auto_1375 - PLACE
      ?auto_1377 - HOIST
      ?auto_1373 - SURFACE
      ?auto_1372 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1376 ?auto_1374 ) ( IS-CRATE ?auto_1371 ) ( not ( = ?auto_1370 ?auto_1371 ) ) ( not ( = ?auto_1369 ?auto_1370 ) ) ( not ( = ?auto_1369 ?auto_1371 ) ) ( not ( = ?auto_1375 ?auto_1374 ) ) ( HOIST-AT ?auto_1377 ?auto_1375 ) ( not ( = ?auto_1376 ?auto_1377 ) ) ( AVAILABLE ?auto_1377 ) ( SURFACE-AT ?auto_1371 ?auto_1375 ) ( ON ?auto_1371 ?auto_1373 ) ( CLEAR ?auto_1371 ) ( not ( = ?auto_1370 ?auto_1373 ) ) ( not ( = ?auto_1371 ?auto_1373 ) ) ( not ( = ?auto_1369 ?auto_1373 ) ) ( TRUCK-AT ?auto_1372 ?auto_1374 ) ( SURFACE-AT ?auto_1369 ?auto_1374 ) ( CLEAR ?auto_1369 ) ( LIFTING ?auto_1376 ?auto_1370 ) ( IS-CRATE ?auto_1370 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1370 ?auto_1371 )
      ( MAKE-2CRATE-VERIFY ?auto_1369 ?auto_1370 ?auto_1371 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1378 - SURFACE
      ?auto_1379 - SURFACE
    )
    :vars
    (
      ?auto_1384 - HOIST
      ?auto_1383 - PLACE
      ?auto_1380 - SURFACE
      ?auto_1386 - PLACE
      ?auto_1382 - HOIST
      ?auto_1385 - SURFACE
      ?auto_1381 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1384 ?auto_1383 ) ( IS-CRATE ?auto_1379 ) ( not ( = ?auto_1378 ?auto_1379 ) ) ( not ( = ?auto_1380 ?auto_1378 ) ) ( not ( = ?auto_1380 ?auto_1379 ) ) ( not ( = ?auto_1386 ?auto_1383 ) ) ( HOIST-AT ?auto_1382 ?auto_1386 ) ( not ( = ?auto_1384 ?auto_1382 ) ) ( AVAILABLE ?auto_1382 ) ( SURFACE-AT ?auto_1379 ?auto_1386 ) ( ON ?auto_1379 ?auto_1385 ) ( CLEAR ?auto_1379 ) ( not ( = ?auto_1378 ?auto_1385 ) ) ( not ( = ?auto_1379 ?auto_1385 ) ) ( not ( = ?auto_1380 ?auto_1385 ) ) ( TRUCK-AT ?auto_1381 ?auto_1383 ) ( SURFACE-AT ?auto_1380 ?auto_1383 ) ( CLEAR ?auto_1380 ) ( IS-CRATE ?auto_1378 ) ( AVAILABLE ?auto_1384 ) ( IN ?auto_1378 ?auto_1381 ) )
    :subtasks
    ( ( !UNLOAD ?auto_1384 ?auto_1378 ?auto_1381 ?auto_1383 )
      ( MAKE-2CRATE ?auto_1380 ?auto_1378 ?auto_1379 )
      ( MAKE-1CRATE-VERIFY ?auto_1378 ?auto_1379 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1387 - SURFACE
      ?auto_1388 - SURFACE
      ?auto_1389 - SURFACE
    )
    :vars
    (
      ?auto_1393 - HOIST
      ?auto_1394 - PLACE
      ?auto_1390 - PLACE
      ?auto_1392 - HOIST
      ?auto_1391 - SURFACE
      ?auto_1395 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1393 ?auto_1394 ) ( IS-CRATE ?auto_1389 ) ( not ( = ?auto_1388 ?auto_1389 ) ) ( not ( = ?auto_1387 ?auto_1388 ) ) ( not ( = ?auto_1387 ?auto_1389 ) ) ( not ( = ?auto_1390 ?auto_1394 ) ) ( HOIST-AT ?auto_1392 ?auto_1390 ) ( not ( = ?auto_1393 ?auto_1392 ) ) ( AVAILABLE ?auto_1392 ) ( SURFACE-AT ?auto_1389 ?auto_1390 ) ( ON ?auto_1389 ?auto_1391 ) ( CLEAR ?auto_1389 ) ( not ( = ?auto_1388 ?auto_1391 ) ) ( not ( = ?auto_1389 ?auto_1391 ) ) ( not ( = ?auto_1387 ?auto_1391 ) ) ( TRUCK-AT ?auto_1395 ?auto_1394 ) ( SURFACE-AT ?auto_1387 ?auto_1394 ) ( CLEAR ?auto_1387 ) ( IS-CRATE ?auto_1388 ) ( AVAILABLE ?auto_1393 ) ( IN ?auto_1388 ?auto_1395 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1388 ?auto_1389 )
      ( MAKE-2CRATE-VERIFY ?auto_1387 ?auto_1388 ?auto_1389 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1396 - SURFACE
      ?auto_1397 - SURFACE
    )
    :vars
    (
      ?auto_1404 - HOIST
      ?auto_1401 - PLACE
      ?auto_1402 - SURFACE
      ?auto_1398 - PLACE
      ?auto_1403 - HOIST
      ?auto_1400 - SURFACE
      ?auto_1399 - TRUCK
      ?auto_1405 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1404 ?auto_1401 ) ( IS-CRATE ?auto_1397 ) ( not ( = ?auto_1396 ?auto_1397 ) ) ( not ( = ?auto_1402 ?auto_1396 ) ) ( not ( = ?auto_1402 ?auto_1397 ) ) ( not ( = ?auto_1398 ?auto_1401 ) ) ( HOIST-AT ?auto_1403 ?auto_1398 ) ( not ( = ?auto_1404 ?auto_1403 ) ) ( AVAILABLE ?auto_1403 ) ( SURFACE-AT ?auto_1397 ?auto_1398 ) ( ON ?auto_1397 ?auto_1400 ) ( CLEAR ?auto_1397 ) ( not ( = ?auto_1396 ?auto_1400 ) ) ( not ( = ?auto_1397 ?auto_1400 ) ) ( not ( = ?auto_1402 ?auto_1400 ) ) ( SURFACE-AT ?auto_1402 ?auto_1401 ) ( CLEAR ?auto_1402 ) ( IS-CRATE ?auto_1396 ) ( AVAILABLE ?auto_1404 ) ( IN ?auto_1396 ?auto_1399 ) ( TRUCK-AT ?auto_1399 ?auto_1405 ) ( not ( = ?auto_1405 ?auto_1401 ) ) ( not ( = ?auto_1398 ?auto_1405 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1399 ?auto_1405 ?auto_1401 )
      ( MAKE-2CRATE ?auto_1402 ?auto_1396 ?auto_1397 )
      ( MAKE-1CRATE-VERIFY ?auto_1396 ?auto_1397 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1406 - SURFACE
      ?auto_1407 - SURFACE
      ?auto_1408 - SURFACE
    )
    :vars
    (
      ?auto_1415 - HOIST
      ?auto_1411 - PLACE
      ?auto_1412 - PLACE
      ?auto_1409 - HOIST
      ?auto_1410 - SURFACE
      ?auto_1414 - TRUCK
      ?auto_1413 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1415 ?auto_1411 ) ( IS-CRATE ?auto_1408 ) ( not ( = ?auto_1407 ?auto_1408 ) ) ( not ( = ?auto_1406 ?auto_1407 ) ) ( not ( = ?auto_1406 ?auto_1408 ) ) ( not ( = ?auto_1412 ?auto_1411 ) ) ( HOIST-AT ?auto_1409 ?auto_1412 ) ( not ( = ?auto_1415 ?auto_1409 ) ) ( AVAILABLE ?auto_1409 ) ( SURFACE-AT ?auto_1408 ?auto_1412 ) ( ON ?auto_1408 ?auto_1410 ) ( CLEAR ?auto_1408 ) ( not ( = ?auto_1407 ?auto_1410 ) ) ( not ( = ?auto_1408 ?auto_1410 ) ) ( not ( = ?auto_1406 ?auto_1410 ) ) ( SURFACE-AT ?auto_1406 ?auto_1411 ) ( CLEAR ?auto_1406 ) ( IS-CRATE ?auto_1407 ) ( AVAILABLE ?auto_1415 ) ( IN ?auto_1407 ?auto_1414 ) ( TRUCK-AT ?auto_1414 ?auto_1413 ) ( not ( = ?auto_1413 ?auto_1411 ) ) ( not ( = ?auto_1412 ?auto_1413 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1407 ?auto_1408 )
      ( MAKE-2CRATE-VERIFY ?auto_1406 ?auto_1407 ?auto_1408 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1416 - SURFACE
      ?auto_1417 - SURFACE
    )
    :vars
    (
      ?auto_1420 - HOIST
      ?auto_1419 - PLACE
      ?auto_1425 - SURFACE
      ?auto_1422 - PLACE
      ?auto_1424 - HOIST
      ?auto_1418 - SURFACE
      ?auto_1421 - TRUCK
      ?auto_1423 - PLACE
      ?auto_1426 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1420 ?auto_1419 ) ( IS-CRATE ?auto_1417 ) ( not ( = ?auto_1416 ?auto_1417 ) ) ( not ( = ?auto_1425 ?auto_1416 ) ) ( not ( = ?auto_1425 ?auto_1417 ) ) ( not ( = ?auto_1422 ?auto_1419 ) ) ( HOIST-AT ?auto_1424 ?auto_1422 ) ( not ( = ?auto_1420 ?auto_1424 ) ) ( AVAILABLE ?auto_1424 ) ( SURFACE-AT ?auto_1417 ?auto_1422 ) ( ON ?auto_1417 ?auto_1418 ) ( CLEAR ?auto_1417 ) ( not ( = ?auto_1416 ?auto_1418 ) ) ( not ( = ?auto_1417 ?auto_1418 ) ) ( not ( = ?auto_1425 ?auto_1418 ) ) ( SURFACE-AT ?auto_1425 ?auto_1419 ) ( CLEAR ?auto_1425 ) ( IS-CRATE ?auto_1416 ) ( AVAILABLE ?auto_1420 ) ( TRUCK-AT ?auto_1421 ?auto_1423 ) ( not ( = ?auto_1423 ?auto_1419 ) ) ( not ( = ?auto_1422 ?auto_1423 ) ) ( HOIST-AT ?auto_1426 ?auto_1423 ) ( LIFTING ?auto_1426 ?auto_1416 ) ( not ( = ?auto_1420 ?auto_1426 ) ) ( not ( = ?auto_1424 ?auto_1426 ) ) )
    :subtasks
    ( ( !LOAD ?auto_1426 ?auto_1416 ?auto_1421 ?auto_1423 )
      ( MAKE-2CRATE ?auto_1425 ?auto_1416 ?auto_1417 )
      ( MAKE-1CRATE-VERIFY ?auto_1416 ?auto_1417 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1427 - SURFACE
      ?auto_1428 - SURFACE
      ?auto_1429 - SURFACE
    )
    :vars
    (
      ?auto_1431 - HOIST
      ?auto_1436 - PLACE
      ?auto_1434 - PLACE
      ?auto_1430 - HOIST
      ?auto_1437 - SURFACE
      ?auto_1432 - TRUCK
      ?auto_1433 - PLACE
      ?auto_1435 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1431 ?auto_1436 ) ( IS-CRATE ?auto_1429 ) ( not ( = ?auto_1428 ?auto_1429 ) ) ( not ( = ?auto_1427 ?auto_1428 ) ) ( not ( = ?auto_1427 ?auto_1429 ) ) ( not ( = ?auto_1434 ?auto_1436 ) ) ( HOIST-AT ?auto_1430 ?auto_1434 ) ( not ( = ?auto_1431 ?auto_1430 ) ) ( AVAILABLE ?auto_1430 ) ( SURFACE-AT ?auto_1429 ?auto_1434 ) ( ON ?auto_1429 ?auto_1437 ) ( CLEAR ?auto_1429 ) ( not ( = ?auto_1428 ?auto_1437 ) ) ( not ( = ?auto_1429 ?auto_1437 ) ) ( not ( = ?auto_1427 ?auto_1437 ) ) ( SURFACE-AT ?auto_1427 ?auto_1436 ) ( CLEAR ?auto_1427 ) ( IS-CRATE ?auto_1428 ) ( AVAILABLE ?auto_1431 ) ( TRUCK-AT ?auto_1432 ?auto_1433 ) ( not ( = ?auto_1433 ?auto_1436 ) ) ( not ( = ?auto_1434 ?auto_1433 ) ) ( HOIST-AT ?auto_1435 ?auto_1433 ) ( LIFTING ?auto_1435 ?auto_1428 ) ( not ( = ?auto_1431 ?auto_1435 ) ) ( not ( = ?auto_1430 ?auto_1435 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1428 ?auto_1429 )
      ( MAKE-2CRATE-VERIFY ?auto_1427 ?auto_1428 ?auto_1429 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1438 - SURFACE
      ?auto_1439 - SURFACE
    )
    :vars
    (
      ?auto_1441 - HOIST
      ?auto_1440 - PLACE
      ?auto_1448 - SURFACE
      ?auto_1446 - PLACE
      ?auto_1447 - HOIST
      ?auto_1445 - SURFACE
      ?auto_1442 - TRUCK
      ?auto_1443 - PLACE
      ?auto_1444 - HOIST
      ?auto_1449 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1441 ?auto_1440 ) ( IS-CRATE ?auto_1439 ) ( not ( = ?auto_1438 ?auto_1439 ) ) ( not ( = ?auto_1448 ?auto_1438 ) ) ( not ( = ?auto_1448 ?auto_1439 ) ) ( not ( = ?auto_1446 ?auto_1440 ) ) ( HOIST-AT ?auto_1447 ?auto_1446 ) ( not ( = ?auto_1441 ?auto_1447 ) ) ( AVAILABLE ?auto_1447 ) ( SURFACE-AT ?auto_1439 ?auto_1446 ) ( ON ?auto_1439 ?auto_1445 ) ( CLEAR ?auto_1439 ) ( not ( = ?auto_1438 ?auto_1445 ) ) ( not ( = ?auto_1439 ?auto_1445 ) ) ( not ( = ?auto_1448 ?auto_1445 ) ) ( SURFACE-AT ?auto_1448 ?auto_1440 ) ( CLEAR ?auto_1448 ) ( IS-CRATE ?auto_1438 ) ( AVAILABLE ?auto_1441 ) ( TRUCK-AT ?auto_1442 ?auto_1443 ) ( not ( = ?auto_1443 ?auto_1440 ) ) ( not ( = ?auto_1446 ?auto_1443 ) ) ( HOIST-AT ?auto_1444 ?auto_1443 ) ( not ( = ?auto_1441 ?auto_1444 ) ) ( not ( = ?auto_1447 ?auto_1444 ) ) ( AVAILABLE ?auto_1444 ) ( SURFACE-AT ?auto_1438 ?auto_1443 ) ( ON ?auto_1438 ?auto_1449 ) ( CLEAR ?auto_1438 ) ( not ( = ?auto_1438 ?auto_1449 ) ) ( not ( = ?auto_1439 ?auto_1449 ) ) ( not ( = ?auto_1448 ?auto_1449 ) ) ( not ( = ?auto_1445 ?auto_1449 ) ) )
    :subtasks
    ( ( !LIFT ?auto_1444 ?auto_1438 ?auto_1449 ?auto_1443 )
      ( MAKE-2CRATE ?auto_1448 ?auto_1438 ?auto_1439 )
      ( MAKE-1CRATE-VERIFY ?auto_1438 ?auto_1439 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1450 - SURFACE
      ?auto_1451 - SURFACE
      ?auto_1452 - SURFACE
    )
    :vars
    (
      ?auto_1456 - HOIST
      ?auto_1459 - PLACE
      ?auto_1460 - PLACE
      ?auto_1457 - HOIST
      ?auto_1454 - SURFACE
      ?auto_1453 - TRUCK
      ?auto_1455 - PLACE
      ?auto_1458 - HOIST
      ?auto_1461 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1456 ?auto_1459 ) ( IS-CRATE ?auto_1452 ) ( not ( = ?auto_1451 ?auto_1452 ) ) ( not ( = ?auto_1450 ?auto_1451 ) ) ( not ( = ?auto_1450 ?auto_1452 ) ) ( not ( = ?auto_1460 ?auto_1459 ) ) ( HOIST-AT ?auto_1457 ?auto_1460 ) ( not ( = ?auto_1456 ?auto_1457 ) ) ( AVAILABLE ?auto_1457 ) ( SURFACE-AT ?auto_1452 ?auto_1460 ) ( ON ?auto_1452 ?auto_1454 ) ( CLEAR ?auto_1452 ) ( not ( = ?auto_1451 ?auto_1454 ) ) ( not ( = ?auto_1452 ?auto_1454 ) ) ( not ( = ?auto_1450 ?auto_1454 ) ) ( SURFACE-AT ?auto_1450 ?auto_1459 ) ( CLEAR ?auto_1450 ) ( IS-CRATE ?auto_1451 ) ( AVAILABLE ?auto_1456 ) ( TRUCK-AT ?auto_1453 ?auto_1455 ) ( not ( = ?auto_1455 ?auto_1459 ) ) ( not ( = ?auto_1460 ?auto_1455 ) ) ( HOIST-AT ?auto_1458 ?auto_1455 ) ( not ( = ?auto_1456 ?auto_1458 ) ) ( not ( = ?auto_1457 ?auto_1458 ) ) ( AVAILABLE ?auto_1458 ) ( SURFACE-AT ?auto_1451 ?auto_1455 ) ( ON ?auto_1451 ?auto_1461 ) ( CLEAR ?auto_1451 ) ( not ( = ?auto_1451 ?auto_1461 ) ) ( not ( = ?auto_1452 ?auto_1461 ) ) ( not ( = ?auto_1450 ?auto_1461 ) ) ( not ( = ?auto_1454 ?auto_1461 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1451 ?auto_1452 )
      ( MAKE-2CRATE-VERIFY ?auto_1450 ?auto_1451 ?auto_1452 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1462 - SURFACE
      ?auto_1463 - SURFACE
    )
    :vars
    (
      ?auto_1464 - HOIST
      ?auto_1469 - PLACE
      ?auto_1473 - SURFACE
      ?auto_1466 - PLACE
      ?auto_1472 - HOIST
      ?auto_1465 - SURFACE
      ?auto_1467 - PLACE
      ?auto_1470 - HOIST
      ?auto_1471 - SURFACE
      ?auto_1468 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1464 ?auto_1469 ) ( IS-CRATE ?auto_1463 ) ( not ( = ?auto_1462 ?auto_1463 ) ) ( not ( = ?auto_1473 ?auto_1462 ) ) ( not ( = ?auto_1473 ?auto_1463 ) ) ( not ( = ?auto_1466 ?auto_1469 ) ) ( HOIST-AT ?auto_1472 ?auto_1466 ) ( not ( = ?auto_1464 ?auto_1472 ) ) ( AVAILABLE ?auto_1472 ) ( SURFACE-AT ?auto_1463 ?auto_1466 ) ( ON ?auto_1463 ?auto_1465 ) ( CLEAR ?auto_1463 ) ( not ( = ?auto_1462 ?auto_1465 ) ) ( not ( = ?auto_1463 ?auto_1465 ) ) ( not ( = ?auto_1473 ?auto_1465 ) ) ( SURFACE-AT ?auto_1473 ?auto_1469 ) ( CLEAR ?auto_1473 ) ( IS-CRATE ?auto_1462 ) ( AVAILABLE ?auto_1464 ) ( not ( = ?auto_1467 ?auto_1469 ) ) ( not ( = ?auto_1466 ?auto_1467 ) ) ( HOIST-AT ?auto_1470 ?auto_1467 ) ( not ( = ?auto_1464 ?auto_1470 ) ) ( not ( = ?auto_1472 ?auto_1470 ) ) ( AVAILABLE ?auto_1470 ) ( SURFACE-AT ?auto_1462 ?auto_1467 ) ( ON ?auto_1462 ?auto_1471 ) ( CLEAR ?auto_1462 ) ( not ( = ?auto_1462 ?auto_1471 ) ) ( not ( = ?auto_1463 ?auto_1471 ) ) ( not ( = ?auto_1473 ?auto_1471 ) ) ( not ( = ?auto_1465 ?auto_1471 ) ) ( TRUCK-AT ?auto_1468 ?auto_1469 ) )
    :subtasks
    ( ( !DRIVE ?auto_1468 ?auto_1469 ?auto_1467 )
      ( MAKE-2CRATE ?auto_1473 ?auto_1462 ?auto_1463 )
      ( MAKE-1CRATE-VERIFY ?auto_1462 ?auto_1463 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1474 - SURFACE
      ?auto_1475 - SURFACE
      ?auto_1476 - SURFACE
    )
    :vars
    (
      ?auto_1480 - HOIST
      ?auto_1485 - PLACE
      ?auto_1484 - PLACE
      ?auto_1477 - HOIST
      ?auto_1478 - SURFACE
      ?auto_1479 - PLACE
      ?auto_1482 - HOIST
      ?auto_1481 - SURFACE
      ?auto_1483 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1480 ?auto_1485 ) ( IS-CRATE ?auto_1476 ) ( not ( = ?auto_1475 ?auto_1476 ) ) ( not ( = ?auto_1474 ?auto_1475 ) ) ( not ( = ?auto_1474 ?auto_1476 ) ) ( not ( = ?auto_1484 ?auto_1485 ) ) ( HOIST-AT ?auto_1477 ?auto_1484 ) ( not ( = ?auto_1480 ?auto_1477 ) ) ( AVAILABLE ?auto_1477 ) ( SURFACE-AT ?auto_1476 ?auto_1484 ) ( ON ?auto_1476 ?auto_1478 ) ( CLEAR ?auto_1476 ) ( not ( = ?auto_1475 ?auto_1478 ) ) ( not ( = ?auto_1476 ?auto_1478 ) ) ( not ( = ?auto_1474 ?auto_1478 ) ) ( SURFACE-AT ?auto_1474 ?auto_1485 ) ( CLEAR ?auto_1474 ) ( IS-CRATE ?auto_1475 ) ( AVAILABLE ?auto_1480 ) ( not ( = ?auto_1479 ?auto_1485 ) ) ( not ( = ?auto_1484 ?auto_1479 ) ) ( HOIST-AT ?auto_1482 ?auto_1479 ) ( not ( = ?auto_1480 ?auto_1482 ) ) ( not ( = ?auto_1477 ?auto_1482 ) ) ( AVAILABLE ?auto_1482 ) ( SURFACE-AT ?auto_1475 ?auto_1479 ) ( ON ?auto_1475 ?auto_1481 ) ( CLEAR ?auto_1475 ) ( not ( = ?auto_1475 ?auto_1481 ) ) ( not ( = ?auto_1476 ?auto_1481 ) ) ( not ( = ?auto_1474 ?auto_1481 ) ) ( not ( = ?auto_1478 ?auto_1481 ) ) ( TRUCK-AT ?auto_1483 ?auto_1485 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1475 ?auto_1476 )
      ( MAKE-2CRATE-VERIFY ?auto_1474 ?auto_1475 ?auto_1476 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1495 - SURFACE
      ?auto_1496 - SURFACE
    )
    :vars
    (
      ?auto_1497 - HOIST
      ?auto_1498 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1497 ?auto_1498 ) ( SURFACE-AT ?auto_1495 ?auto_1498 ) ( CLEAR ?auto_1495 ) ( LIFTING ?auto_1497 ?auto_1496 ) ( IS-CRATE ?auto_1496 ) ( not ( = ?auto_1495 ?auto_1496 ) ) )
    :subtasks
    ( ( !DROP ?auto_1497 ?auto_1496 ?auto_1495 ?auto_1498 )
      ( MAKE-1CRATE-VERIFY ?auto_1495 ?auto_1496 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1499 - SURFACE
      ?auto_1500 - SURFACE
      ?auto_1501 - SURFACE
    )
    :vars
    (
      ?auto_1502 - HOIST
      ?auto_1503 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1502 ?auto_1503 ) ( SURFACE-AT ?auto_1500 ?auto_1503 ) ( CLEAR ?auto_1500 ) ( LIFTING ?auto_1502 ?auto_1501 ) ( IS-CRATE ?auto_1501 ) ( not ( = ?auto_1500 ?auto_1501 ) ) ( ON ?auto_1500 ?auto_1499 ) ( not ( = ?auto_1499 ?auto_1500 ) ) ( not ( = ?auto_1499 ?auto_1501 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1500 ?auto_1501 )
      ( MAKE-2CRATE-VERIFY ?auto_1499 ?auto_1500 ?auto_1501 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1504 - SURFACE
      ?auto_1505 - SURFACE
      ?auto_1506 - SURFACE
      ?auto_1507 - SURFACE
    )
    :vars
    (
      ?auto_1508 - HOIST
      ?auto_1509 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1508 ?auto_1509 ) ( SURFACE-AT ?auto_1506 ?auto_1509 ) ( CLEAR ?auto_1506 ) ( LIFTING ?auto_1508 ?auto_1507 ) ( IS-CRATE ?auto_1507 ) ( not ( = ?auto_1506 ?auto_1507 ) ) ( ON ?auto_1505 ?auto_1504 ) ( ON ?auto_1506 ?auto_1505 ) ( not ( = ?auto_1504 ?auto_1505 ) ) ( not ( = ?auto_1504 ?auto_1506 ) ) ( not ( = ?auto_1504 ?auto_1507 ) ) ( not ( = ?auto_1505 ?auto_1506 ) ) ( not ( = ?auto_1505 ?auto_1507 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1506 ?auto_1507 )
      ( MAKE-3CRATE-VERIFY ?auto_1504 ?auto_1505 ?auto_1506 ?auto_1507 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1510 - SURFACE
      ?auto_1511 - SURFACE
    )
    :vars
    (
      ?auto_1512 - HOIST
      ?auto_1513 - PLACE
      ?auto_1514 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1512 ?auto_1513 ) ( SURFACE-AT ?auto_1510 ?auto_1513 ) ( CLEAR ?auto_1510 ) ( IS-CRATE ?auto_1511 ) ( not ( = ?auto_1510 ?auto_1511 ) ) ( TRUCK-AT ?auto_1514 ?auto_1513 ) ( AVAILABLE ?auto_1512 ) ( IN ?auto_1511 ?auto_1514 ) )
    :subtasks
    ( ( !UNLOAD ?auto_1512 ?auto_1511 ?auto_1514 ?auto_1513 )
      ( MAKE-1CRATE ?auto_1510 ?auto_1511 )
      ( MAKE-1CRATE-VERIFY ?auto_1510 ?auto_1511 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1515 - SURFACE
      ?auto_1516 - SURFACE
      ?auto_1517 - SURFACE
    )
    :vars
    (
      ?auto_1518 - HOIST
      ?auto_1520 - PLACE
      ?auto_1519 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1518 ?auto_1520 ) ( SURFACE-AT ?auto_1516 ?auto_1520 ) ( CLEAR ?auto_1516 ) ( IS-CRATE ?auto_1517 ) ( not ( = ?auto_1516 ?auto_1517 ) ) ( TRUCK-AT ?auto_1519 ?auto_1520 ) ( AVAILABLE ?auto_1518 ) ( IN ?auto_1517 ?auto_1519 ) ( ON ?auto_1516 ?auto_1515 ) ( not ( = ?auto_1515 ?auto_1516 ) ) ( not ( = ?auto_1515 ?auto_1517 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1516 ?auto_1517 )
      ( MAKE-2CRATE-VERIFY ?auto_1515 ?auto_1516 ?auto_1517 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1521 - SURFACE
      ?auto_1522 - SURFACE
      ?auto_1523 - SURFACE
      ?auto_1524 - SURFACE
    )
    :vars
    (
      ?auto_1526 - HOIST
      ?auto_1527 - PLACE
      ?auto_1525 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1526 ?auto_1527 ) ( SURFACE-AT ?auto_1523 ?auto_1527 ) ( CLEAR ?auto_1523 ) ( IS-CRATE ?auto_1524 ) ( not ( = ?auto_1523 ?auto_1524 ) ) ( TRUCK-AT ?auto_1525 ?auto_1527 ) ( AVAILABLE ?auto_1526 ) ( IN ?auto_1524 ?auto_1525 ) ( ON ?auto_1523 ?auto_1522 ) ( not ( = ?auto_1522 ?auto_1523 ) ) ( not ( = ?auto_1522 ?auto_1524 ) ) ( ON ?auto_1522 ?auto_1521 ) ( not ( = ?auto_1521 ?auto_1522 ) ) ( not ( = ?auto_1521 ?auto_1523 ) ) ( not ( = ?auto_1521 ?auto_1524 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1522 ?auto_1523 ?auto_1524 )
      ( MAKE-3CRATE-VERIFY ?auto_1521 ?auto_1522 ?auto_1523 ?auto_1524 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1528 - SURFACE
      ?auto_1529 - SURFACE
    )
    :vars
    (
      ?auto_1531 - HOIST
      ?auto_1532 - PLACE
      ?auto_1530 - TRUCK
      ?auto_1533 - SURFACE
      ?auto_1534 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1531 ?auto_1532 ) ( SURFACE-AT ?auto_1528 ?auto_1532 ) ( CLEAR ?auto_1528 ) ( IS-CRATE ?auto_1529 ) ( not ( = ?auto_1528 ?auto_1529 ) ) ( AVAILABLE ?auto_1531 ) ( IN ?auto_1529 ?auto_1530 ) ( ON ?auto_1528 ?auto_1533 ) ( not ( = ?auto_1533 ?auto_1528 ) ) ( not ( = ?auto_1533 ?auto_1529 ) ) ( TRUCK-AT ?auto_1530 ?auto_1534 ) ( not ( = ?auto_1534 ?auto_1532 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1530 ?auto_1534 ?auto_1532 )
      ( MAKE-2CRATE ?auto_1533 ?auto_1528 ?auto_1529 )
      ( MAKE-1CRATE-VERIFY ?auto_1528 ?auto_1529 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1535 - SURFACE
      ?auto_1536 - SURFACE
      ?auto_1537 - SURFACE
    )
    :vars
    (
      ?auto_1541 - HOIST
      ?auto_1538 - PLACE
      ?auto_1539 - TRUCK
      ?auto_1540 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1541 ?auto_1538 ) ( SURFACE-AT ?auto_1536 ?auto_1538 ) ( CLEAR ?auto_1536 ) ( IS-CRATE ?auto_1537 ) ( not ( = ?auto_1536 ?auto_1537 ) ) ( AVAILABLE ?auto_1541 ) ( IN ?auto_1537 ?auto_1539 ) ( ON ?auto_1536 ?auto_1535 ) ( not ( = ?auto_1535 ?auto_1536 ) ) ( not ( = ?auto_1535 ?auto_1537 ) ) ( TRUCK-AT ?auto_1539 ?auto_1540 ) ( not ( = ?auto_1540 ?auto_1538 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1536 ?auto_1537 )
      ( MAKE-2CRATE-VERIFY ?auto_1535 ?auto_1536 ?auto_1537 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1542 - SURFACE
      ?auto_1543 - SURFACE
      ?auto_1544 - SURFACE
      ?auto_1545 - SURFACE
    )
    :vars
    (
      ?auto_1548 - HOIST
      ?auto_1549 - PLACE
      ?auto_1547 - TRUCK
      ?auto_1546 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1548 ?auto_1549 ) ( SURFACE-AT ?auto_1544 ?auto_1549 ) ( CLEAR ?auto_1544 ) ( IS-CRATE ?auto_1545 ) ( not ( = ?auto_1544 ?auto_1545 ) ) ( AVAILABLE ?auto_1548 ) ( IN ?auto_1545 ?auto_1547 ) ( ON ?auto_1544 ?auto_1543 ) ( not ( = ?auto_1543 ?auto_1544 ) ) ( not ( = ?auto_1543 ?auto_1545 ) ) ( TRUCK-AT ?auto_1547 ?auto_1546 ) ( not ( = ?auto_1546 ?auto_1549 ) ) ( ON ?auto_1543 ?auto_1542 ) ( not ( = ?auto_1542 ?auto_1543 ) ) ( not ( = ?auto_1542 ?auto_1544 ) ) ( not ( = ?auto_1542 ?auto_1545 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1543 ?auto_1544 ?auto_1545 )
      ( MAKE-3CRATE-VERIFY ?auto_1542 ?auto_1543 ?auto_1544 ?auto_1545 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1550 - SURFACE
      ?auto_1551 - SURFACE
    )
    :vars
    (
      ?auto_1554 - HOIST
      ?auto_1555 - PLACE
      ?auto_1556 - SURFACE
      ?auto_1553 - TRUCK
      ?auto_1552 - PLACE
      ?auto_1557 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1554 ?auto_1555 ) ( SURFACE-AT ?auto_1550 ?auto_1555 ) ( CLEAR ?auto_1550 ) ( IS-CRATE ?auto_1551 ) ( not ( = ?auto_1550 ?auto_1551 ) ) ( AVAILABLE ?auto_1554 ) ( ON ?auto_1550 ?auto_1556 ) ( not ( = ?auto_1556 ?auto_1550 ) ) ( not ( = ?auto_1556 ?auto_1551 ) ) ( TRUCK-AT ?auto_1553 ?auto_1552 ) ( not ( = ?auto_1552 ?auto_1555 ) ) ( HOIST-AT ?auto_1557 ?auto_1552 ) ( LIFTING ?auto_1557 ?auto_1551 ) ( not ( = ?auto_1554 ?auto_1557 ) ) )
    :subtasks
    ( ( !LOAD ?auto_1557 ?auto_1551 ?auto_1553 ?auto_1552 )
      ( MAKE-2CRATE ?auto_1556 ?auto_1550 ?auto_1551 )
      ( MAKE-1CRATE-VERIFY ?auto_1550 ?auto_1551 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1558 - SURFACE
      ?auto_1559 - SURFACE
      ?auto_1560 - SURFACE
    )
    :vars
    (
      ?auto_1565 - HOIST
      ?auto_1561 - PLACE
      ?auto_1562 - TRUCK
      ?auto_1563 - PLACE
      ?auto_1564 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1565 ?auto_1561 ) ( SURFACE-AT ?auto_1559 ?auto_1561 ) ( CLEAR ?auto_1559 ) ( IS-CRATE ?auto_1560 ) ( not ( = ?auto_1559 ?auto_1560 ) ) ( AVAILABLE ?auto_1565 ) ( ON ?auto_1559 ?auto_1558 ) ( not ( = ?auto_1558 ?auto_1559 ) ) ( not ( = ?auto_1558 ?auto_1560 ) ) ( TRUCK-AT ?auto_1562 ?auto_1563 ) ( not ( = ?auto_1563 ?auto_1561 ) ) ( HOIST-AT ?auto_1564 ?auto_1563 ) ( LIFTING ?auto_1564 ?auto_1560 ) ( not ( = ?auto_1565 ?auto_1564 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1559 ?auto_1560 )
      ( MAKE-2CRATE-VERIFY ?auto_1558 ?auto_1559 ?auto_1560 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1566 - SURFACE
      ?auto_1567 - SURFACE
      ?auto_1568 - SURFACE
      ?auto_1569 - SURFACE
    )
    :vars
    (
      ?auto_1573 - HOIST
      ?auto_1571 - PLACE
      ?auto_1570 - TRUCK
      ?auto_1574 - PLACE
      ?auto_1572 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1573 ?auto_1571 ) ( SURFACE-AT ?auto_1568 ?auto_1571 ) ( CLEAR ?auto_1568 ) ( IS-CRATE ?auto_1569 ) ( not ( = ?auto_1568 ?auto_1569 ) ) ( AVAILABLE ?auto_1573 ) ( ON ?auto_1568 ?auto_1567 ) ( not ( = ?auto_1567 ?auto_1568 ) ) ( not ( = ?auto_1567 ?auto_1569 ) ) ( TRUCK-AT ?auto_1570 ?auto_1574 ) ( not ( = ?auto_1574 ?auto_1571 ) ) ( HOIST-AT ?auto_1572 ?auto_1574 ) ( LIFTING ?auto_1572 ?auto_1569 ) ( not ( = ?auto_1573 ?auto_1572 ) ) ( ON ?auto_1567 ?auto_1566 ) ( not ( = ?auto_1566 ?auto_1567 ) ) ( not ( = ?auto_1566 ?auto_1568 ) ) ( not ( = ?auto_1566 ?auto_1569 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1567 ?auto_1568 ?auto_1569 )
      ( MAKE-3CRATE-VERIFY ?auto_1566 ?auto_1567 ?auto_1568 ?auto_1569 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1575 - SURFACE
      ?auto_1576 - SURFACE
    )
    :vars
    (
      ?auto_1580 - HOIST
      ?auto_1578 - PLACE
      ?auto_1582 - SURFACE
      ?auto_1577 - TRUCK
      ?auto_1581 - PLACE
      ?auto_1579 - HOIST
      ?auto_1583 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1580 ?auto_1578 ) ( SURFACE-AT ?auto_1575 ?auto_1578 ) ( CLEAR ?auto_1575 ) ( IS-CRATE ?auto_1576 ) ( not ( = ?auto_1575 ?auto_1576 ) ) ( AVAILABLE ?auto_1580 ) ( ON ?auto_1575 ?auto_1582 ) ( not ( = ?auto_1582 ?auto_1575 ) ) ( not ( = ?auto_1582 ?auto_1576 ) ) ( TRUCK-AT ?auto_1577 ?auto_1581 ) ( not ( = ?auto_1581 ?auto_1578 ) ) ( HOIST-AT ?auto_1579 ?auto_1581 ) ( not ( = ?auto_1580 ?auto_1579 ) ) ( AVAILABLE ?auto_1579 ) ( SURFACE-AT ?auto_1576 ?auto_1581 ) ( ON ?auto_1576 ?auto_1583 ) ( CLEAR ?auto_1576 ) ( not ( = ?auto_1575 ?auto_1583 ) ) ( not ( = ?auto_1576 ?auto_1583 ) ) ( not ( = ?auto_1582 ?auto_1583 ) ) )
    :subtasks
    ( ( !LIFT ?auto_1579 ?auto_1576 ?auto_1583 ?auto_1581 )
      ( MAKE-2CRATE ?auto_1582 ?auto_1575 ?auto_1576 )
      ( MAKE-1CRATE-VERIFY ?auto_1575 ?auto_1576 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1584 - SURFACE
      ?auto_1585 - SURFACE
      ?auto_1586 - SURFACE
    )
    :vars
    (
      ?auto_1587 - HOIST
      ?auto_1591 - PLACE
      ?auto_1588 - TRUCK
      ?auto_1589 - PLACE
      ?auto_1590 - HOIST
      ?auto_1592 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1587 ?auto_1591 ) ( SURFACE-AT ?auto_1585 ?auto_1591 ) ( CLEAR ?auto_1585 ) ( IS-CRATE ?auto_1586 ) ( not ( = ?auto_1585 ?auto_1586 ) ) ( AVAILABLE ?auto_1587 ) ( ON ?auto_1585 ?auto_1584 ) ( not ( = ?auto_1584 ?auto_1585 ) ) ( not ( = ?auto_1584 ?auto_1586 ) ) ( TRUCK-AT ?auto_1588 ?auto_1589 ) ( not ( = ?auto_1589 ?auto_1591 ) ) ( HOIST-AT ?auto_1590 ?auto_1589 ) ( not ( = ?auto_1587 ?auto_1590 ) ) ( AVAILABLE ?auto_1590 ) ( SURFACE-AT ?auto_1586 ?auto_1589 ) ( ON ?auto_1586 ?auto_1592 ) ( CLEAR ?auto_1586 ) ( not ( = ?auto_1585 ?auto_1592 ) ) ( not ( = ?auto_1586 ?auto_1592 ) ) ( not ( = ?auto_1584 ?auto_1592 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1585 ?auto_1586 )
      ( MAKE-2CRATE-VERIFY ?auto_1584 ?auto_1585 ?auto_1586 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1593 - SURFACE
      ?auto_1594 - SURFACE
      ?auto_1595 - SURFACE
      ?auto_1596 - SURFACE
    )
    :vars
    (
      ?auto_1597 - HOIST
      ?auto_1601 - PLACE
      ?auto_1599 - TRUCK
      ?auto_1602 - PLACE
      ?auto_1598 - HOIST
      ?auto_1600 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1597 ?auto_1601 ) ( SURFACE-AT ?auto_1595 ?auto_1601 ) ( CLEAR ?auto_1595 ) ( IS-CRATE ?auto_1596 ) ( not ( = ?auto_1595 ?auto_1596 ) ) ( AVAILABLE ?auto_1597 ) ( ON ?auto_1595 ?auto_1594 ) ( not ( = ?auto_1594 ?auto_1595 ) ) ( not ( = ?auto_1594 ?auto_1596 ) ) ( TRUCK-AT ?auto_1599 ?auto_1602 ) ( not ( = ?auto_1602 ?auto_1601 ) ) ( HOIST-AT ?auto_1598 ?auto_1602 ) ( not ( = ?auto_1597 ?auto_1598 ) ) ( AVAILABLE ?auto_1598 ) ( SURFACE-AT ?auto_1596 ?auto_1602 ) ( ON ?auto_1596 ?auto_1600 ) ( CLEAR ?auto_1596 ) ( not ( = ?auto_1595 ?auto_1600 ) ) ( not ( = ?auto_1596 ?auto_1600 ) ) ( not ( = ?auto_1594 ?auto_1600 ) ) ( ON ?auto_1594 ?auto_1593 ) ( not ( = ?auto_1593 ?auto_1594 ) ) ( not ( = ?auto_1593 ?auto_1595 ) ) ( not ( = ?auto_1593 ?auto_1596 ) ) ( not ( = ?auto_1593 ?auto_1600 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1594 ?auto_1595 ?auto_1596 )
      ( MAKE-3CRATE-VERIFY ?auto_1593 ?auto_1594 ?auto_1595 ?auto_1596 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1603 - SURFACE
      ?auto_1604 - SURFACE
    )
    :vars
    (
      ?auto_1605 - HOIST
      ?auto_1609 - PLACE
      ?auto_1611 - SURFACE
      ?auto_1610 - PLACE
      ?auto_1606 - HOIST
      ?auto_1608 - SURFACE
      ?auto_1607 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1605 ?auto_1609 ) ( SURFACE-AT ?auto_1603 ?auto_1609 ) ( CLEAR ?auto_1603 ) ( IS-CRATE ?auto_1604 ) ( not ( = ?auto_1603 ?auto_1604 ) ) ( AVAILABLE ?auto_1605 ) ( ON ?auto_1603 ?auto_1611 ) ( not ( = ?auto_1611 ?auto_1603 ) ) ( not ( = ?auto_1611 ?auto_1604 ) ) ( not ( = ?auto_1610 ?auto_1609 ) ) ( HOIST-AT ?auto_1606 ?auto_1610 ) ( not ( = ?auto_1605 ?auto_1606 ) ) ( AVAILABLE ?auto_1606 ) ( SURFACE-AT ?auto_1604 ?auto_1610 ) ( ON ?auto_1604 ?auto_1608 ) ( CLEAR ?auto_1604 ) ( not ( = ?auto_1603 ?auto_1608 ) ) ( not ( = ?auto_1604 ?auto_1608 ) ) ( not ( = ?auto_1611 ?auto_1608 ) ) ( TRUCK-AT ?auto_1607 ?auto_1609 ) )
    :subtasks
    ( ( !DRIVE ?auto_1607 ?auto_1609 ?auto_1610 )
      ( MAKE-2CRATE ?auto_1611 ?auto_1603 ?auto_1604 )
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
      ?auto_1620 - HOIST
      ?auto_1615 - PLACE
      ?auto_1617 - PLACE
      ?auto_1618 - HOIST
      ?auto_1619 - SURFACE
      ?auto_1616 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1620 ?auto_1615 ) ( SURFACE-AT ?auto_1613 ?auto_1615 ) ( CLEAR ?auto_1613 ) ( IS-CRATE ?auto_1614 ) ( not ( = ?auto_1613 ?auto_1614 ) ) ( AVAILABLE ?auto_1620 ) ( ON ?auto_1613 ?auto_1612 ) ( not ( = ?auto_1612 ?auto_1613 ) ) ( not ( = ?auto_1612 ?auto_1614 ) ) ( not ( = ?auto_1617 ?auto_1615 ) ) ( HOIST-AT ?auto_1618 ?auto_1617 ) ( not ( = ?auto_1620 ?auto_1618 ) ) ( AVAILABLE ?auto_1618 ) ( SURFACE-AT ?auto_1614 ?auto_1617 ) ( ON ?auto_1614 ?auto_1619 ) ( CLEAR ?auto_1614 ) ( not ( = ?auto_1613 ?auto_1619 ) ) ( not ( = ?auto_1614 ?auto_1619 ) ) ( not ( = ?auto_1612 ?auto_1619 ) ) ( TRUCK-AT ?auto_1616 ?auto_1615 ) )
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
      ?auto_1626 - HOIST
      ?auto_1628 - PLACE
      ?auto_1627 - PLACE
      ?auto_1625 - HOIST
      ?auto_1629 - SURFACE
      ?auto_1630 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1626 ?auto_1628 ) ( SURFACE-AT ?auto_1623 ?auto_1628 ) ( CLEAR ?auto_1623 ) ( IS-CRATE ?auto_1624 ) ( not ( = ?auto_1623 ?auto_1624 ) ) ( AVAILABLE ?auto_1626 ) ( ON ?auto_1623 ?auto_1622 ) ( not ( = ?auto_1622 ?auto_1623 ) ) ( not ( = ?auto_1622 ?auto_1624 ) ) ( not ( = ?auto_1627 ?auto_1628 ) ) ( HOIST-AT ?auto_1625 ?auto_1627 ) ( not ( = ?auto_1626 ?auto_1625 ) ) ( AVAILABLE ?auto_1625 ) ( SURFACE-AT ?auto_1624 ?auto_1627 ) ( ON ?auto_1624 ?auto_1629 ) ( CLEAR ?auto_1624 ) ( not ( = ?auto_1623 ?auto_1629 ) ) ( not ( = ?auto_1624 ?auto_1629 ) ) ( not ( = ?auto_1622 ?auto_1629 ) ) ( TRUCK-AT ?auto_1630 ?auto_1628 ) ( ON ?auto_1622 ?auto_1621 ) ( not ( = ?auto_1621 ?auto_1622 ) ) ( not ( = ?auto_1621 ?auto_1623 ) ) ( not ( = ?auto_1621 ?auto_1624 ) ) ( not ( = ?auto_1621 ?auto_1629 ) ) )
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
      ?auto_1634 - HOIST
      ?auto_1636 - PLACE
      ?auto_1639 - SURFACE
      ?auto_1635 - PLACE
      ?auto_1633 - HOIST
      ?auto_1637 - SURFACE
      ?auto_1638 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1634 ?auto_1636 ) ( IS-CRATE ?auto_1632 ) ( not ( = ?auto_1631 ?auto_1632 ) ) ( not ( = ?auto_1639 ?auto_1631 ) ) ( not ( = ?auto_1639 ?auto_1632 ) ) ( not ( = ?auto_1635 ?auto_1636 ) ) ( HOIST-AT ?auto_1633 ?auto_1635 ) ( not ( = ?auto_1634 ?auto_1633 ) ) ( AVAILABLE ?auto_1633 ) ( SURFACE-AT ?auto_1632 ?auto_1635 ) ( ON ?auto_1632 ?auto_1637 ) ( CLEAR ?auto_1632 ) ( not ( = ?auto_1631 ?auto_1637 ) ) ( not ( = ?auto_1632 ?auto_1637 ) ) ( not ( = ?auto_1639 ?auto_1637 ) ) ( TRUCK-AT ?auto_1638 ?auto_1636 ) ( SURFACE-AT ?auto_1639 ?auto_1636 ) ( CLEAR ?auto_1639 ) ( LIFTING ?auto_1634 ?auto_1631 ) ( IS-CRATE ?auto_1631 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1639 ?auto_1631 )
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
      ?auto_1647 - HOIST
      ?auto_1644 - PLACE
      ?auto_1645 - PLACE
      ?auto_1643 - HOIST
      ?auto_1648 - SURFACE
      ?auto_1646 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1647 ?auto_1644 ) ( IS-CRATE ?auto_1642 ) ( not ( = ?auto_1641 ?auto_1642 ) ) ( not ( = ?auto_1640 ?auto_1641 ) ) ( not ( = ?auto_1640 ?auto_1642 ) ) ( not ( = ?auto_1645 ?auto_1644 ) ) ( HOIST-AT ?auto_1643 ?auto_1645 ) ( not ( = ?auto_1647 ?auto_1643 ) ) ( AVAILABLE ?auto_1643 ) ( SURFACE-AT ?auto_1642 ?auto_1645 ) ( ON ?auto_1642 ?auto_1648 ) ( CLEAR ?auto_1642 ) ( not ( = ?auto_1641 ?auto_1648 ) ) ( not ( = ?auto_1642 ?auto_1648 ) ) ( not ( = ?auto_1640 ?auto_1648 ) ) ( TRUCK-AT ?auto_1646 ?auto_1644 ) ( SURFACE-AT ?auto_1640 ?auto_1644 ) ( CLEAR ?auto_1640 ) ( LIFTING ?auto_1647 ?auto_1641 ) ( IS-CRATE ?auto_1641 ) )
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
      ?auto_1657 - HOIST
      ?auto_1658 - PLACE
      ?auto_1654 - PLACE
      ?auto_1655 - HOIST
      ?auto_1653 - SURFACE
      ?auto_1656 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1657 ?auto_1658 ) ( IS-CRATE ?auto_1652 ) ( not ( = ?auto_1651 ?auto_1652 ) ) ( not ( = ?auto_1650 ?auto_1651 ) ) ( not ( = ?auto_1650 ?auto_1652 ) ) ( not ( = ?auto_1654 ?auto_1658 ) ) ( HOIST-AT ?auto_1655 ?auto_1654 ) ( not ( = ?auto_1657 ?auto_1655 ) ) ( AVAILABLE ?auto_1655 ) ( SURFACE-AT ?auto_1652 ?auto_1654 ) ( ON ?auto_1652 ?auto_1653 ) ( CLEAR ?auto_1652 ) ( not ( = ?auto_1651 ?auto_1653 ) ) ( not ( = ?auto_1652 ?auto_1653 ) ) ( not ( = ?auto_1650 ?auto_1653 ) ) ( TRUCK-AT ?auto_1656 ?auto_1658 ) ( SURFACE-AT ?auto_1650 ?auto_1658 ) ( CLEAR ?auto_1650 ) ( LIFTING ?auto_1657 ?auto_1651 ) ( IS-CRATE ?auto_1651 ) ( ON ?auto_1650 ?auto_1649 ) ( not ( = ?auto_1649 ?auto_1650 ) ) ( not ( = ?auto_1649 ?auto_1651 ) ) ( not ( = ?auto_1649 ?auto_1652 ) ) ( not ( = ?auto_1649 ?auto_1653 ) ) )
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
      ?auto_1665 - HOIST
      ?auto_1666 - PLACE
      ?auto_1667 - SURFACE
      ?auto_1662 - PLACE
      ?auto_1663 - HOIST
      ?auto_1661 - SURFACE
      ?auto_1664 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1665 ?auto_1666 ) ( IS-CRATE ?auto_1660 ) ( not ( = ?auto_1659 ?auto_1660 ) ) ( not ( = ?auto_1667 ?auto_1659 ) ) ( not ( = ?auto_1667 ?auto_1660 ) ) ( not ( = ?auto_1662 ?auto_1666 ) ) ( HOIST-AT ?auto_1663 ?auto_1662 ) ( not ( = ?auto_1665 ?auto_1663 ) ) ( AVAILABLE ?auto_1663 ) ( SURFACE-AT ?auto_1660 ?auto_1662 ) ( ON ?auto_1660 ?auto_1661 ) ( CLEAR ?auto_1660 ) ( not ( = ?auto_1659 ?auto_1661 ) ) ( not ( = ?auto_1660 ?auto_1661 ) ) ( not ( = ?auto_1667 ?auto_1661 ) ) ( TRUCK-AT ?auto_1664 ?auto_1666 ) ( SURFACE-AT ?auto_1667 ?auto_1666 ) ( CLEAR ?auto_1667 ) ( IS-CRATE ?auto_1659 ) ( AVAILABLE ?auto_1665 ) ( IN ?auto_1659 ?auto_1664 ) )
    :subtasks
    ( ( !UNLOAD ?auto_1665 ?auto_1659 ?auto_1664 ?auto_1666 )
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
      ?auto_1673 - HOIST
      ?auto_1675 - PLACE
      ?auto_1672 - PLACE
      ?auto_1676 - HOIST
      ?auto_1671 - SURFACE
      ?auto_1674 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1673 ?auto_1675 ) ( IS-CRATE ?auto_1670 ) ( not ( = ?auto_1669 ?auto_1670 ) ) ( not ( = ?auto_1668 ?auto_1669 ) ) ( not ( = ?auto_1668 ?auto_1670 ) ) ( not ( = ?auto_1672 ?auto_1675 ) ) ( HOIST-AT ?auto_1676 ?auto_1672 ) ( not ( = ?auto_1673 ?auto_1676 ) ) ( AVAILABLE ?auto_1676 ) ( SURFACE-AT ?auto_1670 ?auto_1672 ) ( ON ?auto_1670 ?auto_1671 ) ( CLEAR ?auto_1670 ) ( not ( = ?auto_1669 ?auto_1671 ) ) ( not ( = ?auto_1670 ?auto_1671 ) ) ( not ( = ?auto_1668 ?auto_1671 ) ) ( TRUCK-AT ?auto_1674 ?auto_1675 ) ( SURFACE-AT ?auto_1668 ?auto_1675 ) ( CLEAR ?auto_1668 ) ( IS-CRATE ?auto_1669 ) ( AVAILABLE ?auto_1673 ) ( IN ?auto_1669 ?auto_1674 ) )
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
      ?auto_1685 - HOIST
      ?auto_1686 - PLACE
      ?auto_1684 - PLACE
      ?auto_1682 - HOIST
      ?auto_1683 - SURFACE
      ?auto_1681 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1685 ?auto_1686 ) ( IS-CRATE ?auto_1680 ) ( not ( = ?auto_1679 ?auto_1680 ) ) ( not ( = ?auto_1678 ?auto_1679 ) ) ( not ( = ?auto_1678 ?auto_1680 ) ) ( not ( = ?auto_1684 ?auto_1686 ) ) ( HOIST-AT ?auto_1682 ?auto_1684 ) ( not ( = ?auto_1685 ?auto_1682 ) ) ( AVAILABLE ?auto_1682 ) ( SURFACE-AT ?auto_1680 ?auto_1684 ) ( ON ?auto_1680 ?auto_1683 ) ( CLEAR ?auto_1680 ) ( not ( = ?auto_1679 ?auto_1683 ) ) ( not ( = ?auto_1680 ?auto_1683 ) ) ( not ( = ?auto_1678 ?auto_1683 ) ) ( TRUCK-AT ?auto_1681 ?auto_1686 ) ( SURFACE-AT ?auto_1678 ?auto_1686 ) ( CLEAR ?auto_1678 ) ( IS-CRATE ?auto_1679 ) ( AVAILABLE ?auto_1685 ) ( IN ?auto_1679 ?auto_1681 ) ( ON ?auto_1678 ?auto_1677 ) ( not ( = ?auto_1677 ?auto_1678 ) ) ( not ( = ?auto_1677 ?auto_1679 ) ) ( not ( = ?auto_1677 ?auto_1680 ) ) ( not ( = ?auto_1677 ?auto_1683 ) ) )
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
      ?auto_1693 - HOIST
      ?auto_1694 - PLACE
      ?auto_1695 - SURFACE
      ?auto_1692 - PLACE
      ?auto_1690 - HOIST
      ?auto_1691 - SURFACE
      ?auto_1689 - TRUCK
      ?auto_1696 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1693 ?auto_1694 ) ( IS-CRATE ?auto_1688 ) ( not ( = ?auto_1687 ?auto_1688 ) ) ( not ( = ?auto_1695 ?auto_1687 ) ) ( not ( = ?auto_1695 ?auto_1688 ) ) ( not ( = ?auto_1692 ?auto_1694 ) ) ( HOIST-AT ?auto_1690 ?auto_1692 ) ( not ( = ?auto_1693 ?auto_1690 ) ) ( AVAILABLE ?auto_1690 ) ( SURFACE-AT ?auto_1688 ?auto_1692 ) ( ON ?auto_1688 ?auto_1691 ) ( CLEAR ?auto_1688 ) ( not ( = ?auto_1687 ?auto_1691 ) ) ( not ( = ?auto_1688 ?auto_1691 ) ) ( not ( = ?auto_1695 ?auto_1691 ) ) ( SURFACE-AT ?auto_1695 ?auto_1694 ) ( CLEAR ?auto_1695 ) ( IS-CRATE ?auto_1687 ) ( AVAILABLE ?auto_1693 ) ( IN ?auto_1687 ?auto_1689 ) ( TRUCK-AT ?auto_1689 ?auto_1696 ) ( not ( = ?auto_1696 ?auto_1694 ) ) ( not ( = ?auto_1692 ?auto_1696 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1689 ?auto_1696 ?auto_1694 )
      ( MAKE-2CRATE ?auto_1695 ?auto_1687 ?auto_1688 )
      ( MAKE-1CRATE-VERIFY ?auto_1687 ?auto_1688 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1697 - SURFACE
      ?auto_1698 - SURFACE
      ?auto_1699 - SURFACE
    )
    :vars
    (
      ?auto_1700 - HOIST
      ?auto_1704 - PLACE
      ?auto_1701 - PLACE
      ?auto_1706 - HOIST
      ?auto_1703 - SURFACE
      ?auto_1702 - TRUCK
      ?auto_1705 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1700 ?auto_1704 ) ( IS-CRATE ?auto_1699 ) ( not ( = ?auto_1698 ?auto_1699 ) ) ( not ( = ?auto_1697 ?auto_1698 ) ) ( not ( = ?auto_1697 ?auto_1699 ) ) ( not ( = ?auto_1701 ?auto_1704 ) ) ( HOIST-AT ?auto_1706 ?auto_1701 ) ( not ( = ?auto_1700 ?auto_1706 ) ) ( AVAILABLE ?auto_1706 ) ( SURFACE-AT ?auto_1699 ?auto_1701 ) ( ON ?auto_1699 ?auto_1703 ) ( CLEAR ?auto_1699 ) ( not ( = ?auto_1698 ?auto_1703 ) ) ( not ( = ?auto_1699 ?auto_1703 ) ) ( not ( = ?auto_1697 ?auto_1703 ) ) ( SURFACE-AT ?auto_1697 ?auto_1704 ) ( CLEAR ?auto_1697 ) ( IS-CRATE ?auto_1698 ) ( AVAILABLE ?auto_1700 ) ( IN ?auto_1698 ?auto_1702 ) ( TRUCK-AT ?auto_1702 ?auto_1705 ) ( not ( = ?auto_1705 ?auto_1704 ) ) ( not ( = ?auto_1701 ?auto_1705 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1698 ?auto_1699 )
      ( MAKE-2CRATE-VERIFY ?auto_1697 ?auto_1698 ?auto_1699 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1707 - SURFACE
      ?auto_1708 - SURFACE
      ?auto_1709 - SURFACE
      ?auto_1710 - SURFACE
    )
    :vars
    (
      ?auto_1712 - HOIST
      ?auto_1716 - PLACE
      ?auto_1713 - PLACE
      ?auto_1711 - HOIST
      ?auto_1717 - SURFACE
      ?auto_1714 - TRUCK
      ?auto_1715 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1712 ?auto_1716 ) ( IS-CRATE ?auto_1710 ) ( not ( = ?auto_1709 ?auto_1710 ) ) ( not ( = ?auto_1708 ?auto_1709 ) ) ( not ( = ?auto_1708 ?auto_1710 ) ) ( not ( = ?auto_1713 ?auto_1716 ) ) ( HOIST-AT ?auto_1711 ?auto_1713 ) ( not ( = ?auto_1712 ?auto_1711 ) ) ( AVAILABLE ?auto_1711 ) ( SURFACE-AT ?auto_1710 ?auto_1713 ) ( ON ?auto_1710 ?auto_1717 ) ( CLEAR ?auto_1710 ) ( not ( = ?auto_1709 ?auto_1717 ) ) ( not ( = ?auto_1710 ?auto_1717 ) ) ( not ( = ?auto_1708 ?auto_1717 ) ) ( SURFACE-AT ?auto_1708 ?auto_1716 ) ( CLEAR ?auto_1708 ) ( IS-CRATE ?auto_1709 ) ( AVAILABLE ?auto_1712 ) ( IN ?auto_1709 ?auto_1714 ) ( TRUCK-AT ?auto_1714 ?auto_1715 ) ( not ( = ?auto_1715 ?auto_1716 ) ) ( not ( = ?auto_1713 ?auto_1715 ) ) ( ON ?auto_1708 ?auto_1707 ) ( not ( = ?auto_1707 ?auto_1708 ) ) ( not ( = ?auto_1707 ?auto_1709 ) ) ( not ( = ?auto_1707 ?auto_1710 ) ) ( not ( = ?auto_1707 ?auto_1717 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1708 ?auto_1709 ?auto_1710 )
      ( MAKE-3CRATE-VERIFY ?auto_1707 ?auto_1708 ?auto_1709 ?auto_1710 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1718 - SURFACE
      ?auto_1719 - SURFACE
    )
    :vars
    (
      ?auto_1721 - HOIST
      ?auto_1725 - PLACE
      ?auto_1727 - SURFACE
      ?auto_1722 - PLACE
      ?auto_1720 - HOIST
      ?auto_1726 - SURFACE
      ?auto_1723 - TRUCK
      ?auto_1724 - PLACE
      ?auto_1728 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1721 ?auto_1725 ) ( IS-CRATE ?auto_1719 ) ( not ( = ?auto_1718 ?auto_1719 ) ) ( not ( = ?auto_1727 ?auto_1718 ) ) ( not ( = ?auto_1727 ?auto_1719 ) ) ( not ( = ?auto_1722 ?auto_1725 ) ) ( HOIST-AT ?auto_1720 ?auto_1722 ) ( not ( = ?auto_1721 ?auto_1720 ) ) ( AVAILABLE ?auto_1720 ) ( SURFACE-AT ?auto_1719 ?auto_1722 ) ( ON ?auto_1719 ?auto_1726 ) ( CLEAR ?auto_1719 ) ( not ( = ?auto_1718 ?auto_1726 ) ) ( not ( = ?auto_1719 ?auto_1726 ) ) ( not ( = ?auto_1727 ?auto_1726 ) ) ( SURFACE-AT ?auto_1727 ?auto_1725 ) ( CLEAR ?auto_1727 ) ( IS-CRATE ?auto_1718 ) ( AVAILABLE ?auto_1721 ) ( TRUCK-AT ?auto_1723 ?auto_1724 ) ( not ( = ?auto_1724 ?auto_1725 ) ) ( not ( = ?auto_1722 ?auto_1724 ) ) ( HOIST-AT ?auto_1728 ?auto_1724 ) ( LIFTING ?auto_1728 ?auto_1718 ) ( not ( = ?auto_1721 ?auto_1728 ) ) ( not ( = ?auto_1720 ?auto_1728 ) ) )
    :subtasks
    ( ( !LOAD ?auto_1728 ?auto_1718 ?auto_1723 ?auto_1724 )
      ( MAKE-2CRATE ?auto_1727 ?auto_1718 ?auto_1719 )
      ( MAKE-1CRATE-VERIFY ?auto_1718 ?auto_1719 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1729 - SURFACE
      ?auto_1730 - SURFACE
      ?auto_1731 - SURFACE
    )
    :vars
    (
      ?auto_1734 - HOIST
      ?auto_1733 - PLACE
      ?auto_1739 - PLACE
      ?auto_1735 - HOIST
      ?auto_1737 - SURFACE
      ?auto_1736 - TRUCK
      ?auto_1732 - PLACE
      ?auto_1738 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1734 ?auto_1733 ) ( IS-CRATE ?auto_1731 ) ( not ( = ?auto_1730 ?auto_1731 ) ) ( not ( = ?auto_1729 ?auto_1730 ) ) ( not ( = ?auto_1729 ?auto_1731 ) ) ( not ( = ?auto_1739 ?auto_1733 ) ) ( HOIST-AT ?auto_1735 ?auto_1739 ) ( not ( = ?auto_1734 ?auto_1735 ) ) ( AVAILABLE ?auto_1735 ) ( SURFACE-AT ?auto_1731 ?auto_1739 ) ( ON ?auto_1731 ?auto_1737 ) ( CLEAR ?auto_1731 ) ( not ( = ?auto_1730 ?auto_1737 ) ) ( not ( = ?auto_1731 ?auto_1737 ) ) ( not ( = ?auto_1729 ?auto_1737 ) ) ( SURFACE-AT ?auto_1729 ?auto_1733 ) ( CLEAR ?auto_1729 ) ( IS-CRATE ?auto_1730 ) ( AVAILABLE ?auto_1734 ) ( TRUCK-AT ?auto_1736 ?auto_1732 ) ( not ( = ?auto_1732 ?auto_1733 ) ) ( not ( = ?auto_1739 ?auto_1732 ) ) ( HOIST-AT ?auto_1738 ?auto_1732 ) ( LIFTING ?auto_1738 ?auto_1730 ) ( not ( = ?auto_1734 ?auto_1738 ) ) ( not ( = ?auto_1735 ?auto_1738 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1730 ?auto_1731 )
      ( MAKE-2CRATE-VERIFY ?auto_1729 ?auto_1730 ?auto_1731 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1740 - SURFACE
      ?auto_1741 - SURFACE
      ?auto_1742 - SURFACE
      ?auto_1743 - SURFACE
    )
    :vars
    (
      ?auto_1750 - HOIST
      ?auto_1748 - PLACE
      ?auto_1745 - PLACE
      ?auto_1751 - HOIST
      ?auto_1744 - SURFACE
      ?auto_1747 - TRUCK
      ?auto_1749 - PLACE
      ?auto_1746 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1750 ?auto_1748 ) ( IS-CRATE ?auto_1743 ) ( not ( = ?auto_1742 ?auto_1743 ) ) ( not ( = ?auto_1741 ?auto_1742 ) ) ( not ( = ?auto_1741 ?auto_1743 ) ) ( not ( = ?auto_1745 ?auto_1748 ) ) ( HOIST-AT ?auto_1751 ?auto_1745 ) ( not ( = ?auto_1750 ?auto_1751 ) ) ( AVAILABLE ?auto_1751 ) ( SURFACE-AT ?auto_1743 ?auto_1745 ) ( ON ?auto_1743 ?auto_1744 ) ( CLEAR ?auto_1743 ) ( not ( = ?auto_1742 ?auto_1744 ) ) ( not ( = ?auto_1743 ?auto_1744 ) ) ( not ( = ?auto_1741 ?auto_1744 ) ) ( SURFACE-AT ?auto_1741 ?auto_1748 ) ( CLEAR ?auto_1741 ) ( IS-CRATE ?auto_1742 ) ( AVAILABLE ?auto_1750 ) ( TRUCK-AT ?auto_1747 ?auto_1749 ) ( not ( = ?auto_1749 ?auto_1748 ) ) ( not ( = ?auto_1745 ?auto_1749 ) ) ( HOIST-AT ?auto_1746 ?auto_1749 ) ( LIFTING ?auto_1746 ?auto_1742 ) ( not ( = ?auto_1750 ?auto_1746 ) ) ( not ( = ?auto_1751 ?auto_1746 ) ) ( ON ?auto_1741 ?auto_1740 ) ( not ( = ?auto_1740 ?auto_1741 ) ) ( not ( = ?auto_1740 ?auto_1742 ) ) ( not ( = ?auto_1740 ?auto_1743 ) ) ( not ( = ?auto_1740 ?auto_1744 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1741 ?auto_1742 ?auto_1743 )
      ( MAKE-3CRATE-VERIFY ?auto_1740 ?auto_1741 ?auto_1742 ?auto_1743 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1752 - SURFACE
      ?auto_1753 - SURFACE
    )
    :vars
    (
      ?auto_1760 - HOIST
      ?auto_1758 - PLACE
      ?auto_1762 - SURFACE
      ?auto_1755 - PLACE
      ?auto_1761 - HOIST
      ?auto_1754 - SURFACE
      ?auto_1757 - TRUCK
      ?auto_1759 - PLACE
      ?auto_1756 - HOIST
      ?auto_1763 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1760 ?auto_1758 ) ( IS-CRATE ?auto_1753 ) ( not ( = ?auto_1752 ?auto_1753 ) ) ( not ( = ?auto_1762 ?auto_1752 ) ) ( not ( = ?auto_1762 ?auto_1753 ) ) ( not ( = ?auto_1755 ?auto_1758 ) ) ( HOIST-AT ?auto_1761 ?auto_1755 ) ( not ( = ?auto_1760 ?auto_1761 ) ) ( AVAILABLE ?auto_1761 ) ( SURFACE-AT ?auto_1753 ?auto_1755 ) ( ON ?auto_1753 ?auto_1754 ) ( CLEAR ?auto_1753 ) ( not ( = ?auto_1752 ?auto_1754 ) ) ( not ( = ?auto_1753 ?auto_1754 ) ) ( not ( = ?auto_1762 ?auto_1754 ) ) ( SURFACE-AT ?auto_1762 ?auto_1758 ) ( CLEAR ?auto_1762 ) ( IS-CRATE ?auto_1752 ) ( AVAILABLE ?auto_1760 ) ( TRUCK-AT ?auto_1757 ?auto_1759 ) ( not ( = ?auto_1759 ?auto_1758 ) ) ( not ( = ?auto_1755 ?auto_1759 ) ) ( HOIST-AT ?auto_1756 ?auto_1759 ) ( not ( = ?auto_1760 ?auto_1756 ) ) ( not ( = ?auto_1761 ?auto_1756 ) ) ( AVAILABLE ?auto_1756 ) ( SURFACE-AT ?auto_1752 ?auto_1759 ) ( ON ?auto_1752 ?auto_1763 ) ( CLEAR ?auto_1752 ) ( not ( = ?auto_1752 ?auto_1763 ) ) ( not ( = ?auto_1753 ?auto_1763 ) ) ( not ( = ?auto_1762 ?auto_1763 ) ) ( not ( = ?auto_1754 ?auto_1763 ) ) )
    :subtasks
    ( ( !LIFT ?auto_1756 ?auto_1752 ?auto_1763 ?auto_1759 )
      ( MAKE-2CRATE ?auto_1762 ?auto_1752 ?auto_1753 )
      ( MAKE-1CRATE-VERIFY ?auto_1752 ?auto_1753 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1764 - SURFACE
      ?auto_1765 - SURFACE
      ?auto_1766 - SURFACE
    )
    :vars
    (
      ?auto_1771 - HOIST
      ?auto_1767 - PLACE
      ?auto_1774 - PLACE
      ?auto_1775 - HOIST
      ?auto_1770 - SURFACE
      ?auto_1773 - TRUCK
      ?auto_1768 - PLACE
      ?auto_1769 - HOIST
      ?auto_1772 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1771 ?auto_1767 ) ( IS-CRATE ?auto_1766 ) ( not ( = ?auto_1765 ?auto_1766 ) ) ( not ( = ?auto_1764 ?auto_1765 ) ) ( not ( = ?auto_1764 ?auto_1766 ) ) ( not ( = ?auto_1774 ?auto_1767 ) ) ( HOIST-AT ?auto_1775 ?auto_1774 ) ( not ( = ?auto_1771 ?auto_1775 ) ) ( AVAILABLE ?auto_1775 ) ( SURFACE-AT ?auto_1766 ?auto_1774 ) ( ON ?auto_1766 ?auto_1770 ) ( CLEAR ?auto_1766 ) ( not ( = ?auto_1765 ?auto_1770 ) ) ( not ( = ?auto_1766 ?auto_1770 ) ) ( not ( = ?auto_1764 ?auto_1770 ) ) ( SURFACE-AT ?auto_1764 ?auto_1767 ) ( CLEAR ?auto_1764 ) ( IS-CRATE ?auto_1765 ) ( AVAILABLE ?auto_1771 ) ( TRUCK-AT ?auto_1773 ?auto_1768 ) ( not ( = ?auto_1768 ?auto_1767 ) ) ( not ( = ?auto_1774 ?auto_1768 ) ) ( HOIST-AT ?auto_1769 ?auto_1768 ) ( not ( = ?auto_1771 ?auto_1769 ) ) ( not ( = ?auto_1775 ?auto_1769 ) ) ( AVAILABLE ?auto_1769 ) ( SURFACE-AT ?auto_1765 ?auto_1768 ) ( ON ?auto_1765 ?auto_1772 ) ( CLEAR ?auto_1765 ) ( not ( = ?auto_1765 ?auto_1772 ) ) ( not ( = ?auto_1766 ?auto_1772 ) ) ( not ( = ?auto_1764 ?auto_1772 ) ) ( not ( = ?auto_1770 ?auto_1772 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1765 ?auto_1766 )
      ( MAKE-2CRATE-VERIFY ?auto_1764 ?auto_1765 ?auto_1766 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1776 - SURFACE
      ?auto_1777 - SURFACE
      ?auto_1778 - SURFACE
      ?auto_1779 - SURFACE
    )
    :vars
    (
      ?auto_1788 - HOIST
      ?auto_1784 - PLACE
      ?auto_1781 - PLACE
      ?auto_1785 - HOIST
      ?auto_1783 - SURFACE
      ?auto_1787 - TRUCK
      ?auto_1786 - PLACE
      ?auto_1782 - HOIST
      ?auto_1780 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1788 ?auto_1784 ) ( IS-CRATE ?auto_1779 ) ( not ( = ?auto_1778 ?auto_1779 ) ) ( not ( = ?auto_1777 ?auto_1778 ) ) ( not ( = ?auto_1777 ?auto_1779 ) ) ( not ( = ?auto_1781 ?auto_1784 ) ) ( HOIST-AT ?auto_1785 ?auto_1781 ) ( not ( = ?auto_1788 ?auto_1785 ) ) ( AVAILABLE ?auto_1785 ) ( SURFACE-AT ?auto_1779 ?auto_1781 ) ( ON ?auto_1779 ?auto_1783 ) ( CLEAR ?auto_1779 ) ( not ( = ?auto_1778 ?auto_1783 ) ) ( not ( = ?auto_1779 ?auto_1783 ) ) ( not ( = ?auto_1777 ?auto_1783 ) ) ( SURFACE-AT ?auto_1777 ?auto_1784 ) ( CLEAR ?auto_1777 ) ( IS-CRATE ?auto_1778 ) ( AVAILABLE ?auto_1788 ) ( TRUCK-AT ?auto_1787 ?auto_1786 ) ( not ( = ?auto_1786 ?auto_1784 ) ) ( not ( = ?auto_1781 ?auto_1786 ) ) ( HOIST-AT ?auto_1782 ?auto_1786 ) ( not ( = ?auto_1788 ?auto_1782 ) ) ( not ( = ?auto_1785 ?auto_1782 ) ) ( AVAILABLE ?auto_1782 ) ( SURFACE-AT ?auto_1778 ?auto_1786 ) ( ON ?auto_1778 ?auto_1780 ) ( CLEAR ?auto_1778 ) ( not ( = ?auto_1778 ?auto_1780 ) ) ( not ( = ?auto_1779 ?auto_1780 ) ) ( not ( = ?auto_1777 ?auto_1780 ) ) ( not ( = ?auto_1783 ?auto_1780 ) ) ( ON ?auto_1777 ?auto_1776 ) ( not ( = ?auto_1776 ?auto_1777 ) ) ( not ( = ?auto_1776 ?auto_1778 ) ) ( not ( = ?auto_1776 ?auto_1779 ) ) ( not ( = ?auto_1776 ?auto_1783 ) ) ( not ( = ?auto_1776 ?auto_1780 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1777 ?auto_1778 ?auto_1779 )
      ( MAKE-3CRATE-VERIFY ?auto_1776 ?auto_1777 ?auto_1778 ?auto_1779 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1789 - SURFACE
      ?auto_1790 - SURFACE
    )
    :vars
    (
      ?auto_1799 - HOIST
      ?auto_1795 - PLACE
      ?auto_1800 - SURFACE
      ?auto_1792 - PLACE
      ?auto_1796 - HOIST
      ?auto_1794 - SURFACE
      ?auto_1797 - PLACE
      ?auto_1793 - HOIST
      ?auto_1791 - SURFACE
      ?auto_1798 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1799 ?auto_1795 ) ( IS-CRATE ?auto_1790 ) ( not ( = ?auto_1789 ?auto_1790 ) ) ( not ( = ?auto_1800 ?auto_1789 ) ) ( not ( = ?auto_1800 ?auto_1790 ) ) ( not ( = ?auto_1792 ?auto_1795 ) ) ( HOIST-AT ?auto_1796 ?auto_1792 ) ( not ( = ?auto_1799 ?auto_1796 ) ) ( AVAILABLE ?auto_1796 ) ( SURFACE-AT ?auto_1790 ?auto_1792 ) ( ON ?auto_1790 ?auto_1794 ) ( CLEAR ?auto_1790 ) ( not ( = ?auto_1789 ?auto_1794 ) ) ( not ( = ?auto_1790 ?auto_1794 ) ) ( not ( = ?auto_1800 ?auto_1794 ) ) ( SURFACE-AT ?auto_1800 ?auto_1795 ) ( CLEAR ?auto_1800 ) ( IS-CRATE ?auto_1789 ) ( AVAILABLE ?auto_1799 ) ( not ( = ?auto_1797 ?auto_1795 ) ) ( not ( = ?auto_1792 ?auto_1797 ) ) ( HOIST-AT ?auto_1793 ?auto_1797 ) ( not ( = ?auto_1799 ?auto_1793 ) ) ( not ( = ?auto_1796 ?auto_1793 ) ) ( AVAILABLE ?auto_1793 ) ( SURFACE-AT ?auto_1789 ?auto_1797 ) ( ON ?auto_1789 ?auto_1791 ) ( CLEAR ?auto_1789 ) ( not ( = ?auto_1789 ?auto_1791 ) ) ( not ( = ?auto_1790 ?auto_1791 ) ) ( not ( = ?auto_1800 ?auto_1791 ) ) ( not ( = ?auto_1794 ?auto_1791 ) ) ( TRUCK-AT ?auto_1798 ?auto_1795 ) )
    :subtasks
    ( ( !DRIVE ?auto_1798 ?auto_1795 ?auto_1797 )
      ( MAKE-2CRATE ?auto_1800 ?auto_1789 ?auto_1790 )
      ( MAKE-1CRATE-VERIFY ?auto_1789 ?auto_1790 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1801 - SURFACE
      ?auto_1802 - SURFACE
      ?auto_1803 - SURFACE
    )
    :vars
    (
      ?auto_1807 - HOIST
      ?auto_1805 - PLACE
      ?auto_1808 - PLACE
      ?auto_1810 - HOIST
      ?auto_1804 - SURFACE
      ?auto_1806 - PLACE
      ?auto_1812 - HOIST
      ?auto_1811 - SURFACE
      ?auto_1809 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1807 ?auto_1805 ) ( IS-CRATE ?auto_1803 ) ( not ( = ?auto_1802 ?auto_1803 ) ) ( not ( = ?auto_1801 ?auto_1802 ) ) ( not ( = ?auto_1801 ?auto_1803 ) ) ( not ( = ?auto_1808 ?auto_1805 ) ) ( HOIST-AT ?auto_1810 ?auto_1808 ) ( not ( = ?auto_1807 ?auto_1810 ) ) ( AVAILABLE ?auto_1810 ) ( SURFACE-AT ?auto_1803 ?auto_1808 ) ( ON ?auto_1803 ?auto_1804 ) ( CLEAR ?auto_1803 ) ( not ( = ?auto_1802 ?auto_1804 ) ) ( not ( = ?auto_1803 ?auto_1804 ) ) ( not ( = ?auto_1801 ?auto_1804 ) ) ( SURFACE-AT ?auto_1801 ?auto_1805 ) ( CLEAR ?auto_1801 ) ( IS-CRATE ?auto_1802 ) ( AVAILABLE ?auto_1807 ) ( not ( = ?auto_1806 ?auto_1805 ) ) ( not ( = ?auto_1808 ?auto_1806 ) ) ( HOIST-AT ?auto_1812 ?auto_1806 ) ( not ( = ?auto_1807 ?auto_1812 ) ) ( not ( = ?auto_1810 ?auto_1812 ) ) ( AVAILABLE ?auto_1812 ) ( SURFACE-AT ?auto_1802 ?auto_1806 ) ( ON ?auto_1802 ?auto_1811 ) ( CLEAR ?auto_1802 ) ( not ( = ?auto_1802 ?auto_1811 ) ) ( not ( = ?auto_1803 ?auto_1811 ) ) ( not ( = ?auto_1801 ?auto_1811 ) ) ( not ( = ?auto_1804 ?auto_1811 ) ) ( TRUCK-AT ?auto_1809 ?auto_1805 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1802 ?auto_1803 )
      ( MAKE-2CRATE-VERIFY ?auto_1801 ?auto_1802 ?auto_1803 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1813 - SURFACE
      ?auto_1814 - SURFACE
      ?auto_1815 - SURFACE
      ?auto_1816 - SURFACE
    )
    :vars
    (
      ?auto_1818 - HOIST
      ?auto_1823 - PLACE
      ?auto_1822 - PLACE
      ?auto_1825 - HOIST
      ?auto_1820 - SURFACE
      ?auto_1821 - PLACE
      ?auto_1817 - HOIST
      ?auto_1824 - SURFACE
      ?auto_1819 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1818 ?auto_1823 ) ( IS-CRATE ?auto_1816 ) ( not ( = ?auto_1815 ?auto_1816 ) ) ( not ( = ?auto_1814 ?auto_1815 ) ) ( not ( = ?auto_1814 ?auto_1816 ) ) ( not ( = ?auto_1822 ?auto_1823 ) ) ( HOIST-AT ?auto_1825 ?auto_1822 ) ( not ( = ?auto_1818 ?auto_1825 ) ) ( AVAILABLE ?auto_1825 ) ( SURFACE-AT ?auto_1816 ?auto_1822 ) ( ON ?auto_1816 ?auto_1820 ) ( CLEAR ?auto_1816 ) ( not ( = ?auto_1815 ?auto_1820 ) ) ( not ( = ?auto_1816 ?auto_1820 ) ) ( not ( = ?auto_1814 ?auto_1820 ) ) ( SURFACE-AT ?auto_1814 ?auto_1823 ) ( CLEAR ?auto_1814 ) ( IS-CRATE ?auto_1815 ) ( AVAILABLE ?auto_1818 ) ( not ( = ?auto_1821 ?auto_1823 ) ) ( not ( = ?auto_1822 ?auto_1821 ) ) ( HOIST-AT ?auto_1817 ?auto_1821 ) ( not ( = ?auto_1818 ?auto_1817 ) ) ( not ( = ?auto_1825 ?auto_1817 ) ) ( AVAILABLE ?auto_1817 ) ( SURFACE-AT ?auto_1815 ?auto_1821 ) ( ON ?auto_1815 ?auto_1824 ) ( CLEAR ?auto_1815 ) ( not ( = ?auto_1815 ?auto_1824 ) ) ( not ( = ?auto_1816 ?auto_1824 ) ) ( not ( = ?auto_1814 ?auto_1824 ) ) ( not ( = ?auto_1820 ?auto_1824 ) ) ( TRUCK-AT ?auto_1819 ?auto_1823 ) ( ON ?auto_1814 ?auto_1813 ) ( not ( = ?auto_1813 ?auto_1814 ) ) ( not ( = ?auto_1813 ?auto_1815 ) ) ( not ( = ?auto_1813 ?auto_1816 ) ) ( not ( = ?auto_1813 ?auto_1820 ) ) ( not ( = ?auto_1813 ?auto_1824 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1814 ?auto_1815 ?auto_1816 )
      ( MAKE-3CRATE-VERIFY ?auto_1813 ?auto_1814 ?auto_1815 ?auto_1816 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1826 - SURFACE
      ?auto_1827 - SURFACE
    )
    :vars
    (
      ?auto_1829 - HOIST
      ?auto_1834 - PLACE
      ?auto_1837 - SURFACE
      ?auto_1833 - PLACE
      ?auto_1836 - HOIST
      ?auto_1831 - SURFACE
      ?auto_1832 - PLACE
      ?auto_1828 - HOIST
      ?auto_1835 - SURFACE
      ?auto_1830 - TRUCK
      ?auto_1838 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1829 ?auto_1834 ) ( IS-CRATE ?auto_1827 ) ( not ( = ?auto_1826 ?auto_1827 ) ) ( not ( = ?auto_1837 ?auto_1826 ) ) ( not ( = ?auto_1837 ?auto_1827 ) ) ( not ( = ?auto_1833 ?auto_1834 ) ) ( HOIST-AT ?auto_1836 ?auto_1833 ) ( not ( = ?auto_1829 ?auto_1836 ) ) ( AVAILABLE ?auto_1836 ) ( SURFACE-AT ?auto_1827 ?auto_1833 ) ( ON ?auto_1827 ?auto_1831 ) ( CLEAR ?auto_1827 ) ( not ( = ?auto_1826 ?auto_1831 ) ) ( not ( = ?auto_1827 ?auto_1831 ) ) ( not ( = ?auto_1837 ?auto_1831 ) ) ( IS-CRATE ?auto_1826 ) ( not ( = ?auto_1832 ?auto_1834 ) ) ( not ( = ?auto_1833 ?auto_1832 ) ) ( HOIST-AT ?auto_1828 ?auto_1832 ) ( not ( = ?auto_1829 ?auto_1828 ) ) ( not ( = ?auto_1836 ?auto_1828 ) ) ( AVAILABLE ?auto_1828 ) ( SURFACE-AT ?auto_1826 ?auto_1832 ) ( ON ?auto_1826 ?auto_1835 ) ( CLEAR ?auto_1826 ) ( not ( = ?auto_1826 ?auto_1835 ) ) ( not ( = ?auto_1827 ?auto_1835 ) ) ( not ( = ?auto_1837 ?auto_1835 ) ) ( not ( = ?auto_1831 ?auto_1835 ) ) ( TRUCK-AT ?auto_1830 ?auto_1834 ) ( SURFACE-AT ?auto_1838 ?auto_1834 ) ( CLEAR ?auto_1838 ) ( LIFTING ?auto_1829 ?auto_1837 ) ( IS-CRATE ?auto_1837 ) ( not ( = ?auto_1838 ?auto_1837 ) ) ( not ( = ?auto_1826 ?auto_1838 ) ) ( not ( = ?auto_1827 ?auto_1838 ) ) ( not ( = ?auto_1831 ?auto_1838 ) ) ( not ( = ?auto_1835 ?auto_1838 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1838 ?auto_1837 )
      ( MAKE-2CRATE ?auto_1837 ?auto_1826 ?auto_1827 )
      ( MAKE-1CRATE-VERIFY ?auto_1826 ?auto_1827 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1839 - SURFACE
      ?auto_1840 - SURFACE
      ?auto_1841 - SURFACE
    )
    :vars
    (
      ?auto_1851 - HOIST
      ?auto_1850 - PLACE
      ?auto_1849 - PLACE
      ?auto_1845 - HOIST
      ?auto_1848 - SURFACE
      ?auto_1842 - PLACE
      ?auto_1844 - HOIST
      ?auto_1846 - SURFACE
      ?auto_1843 - TRUCK
      ?auto_1847 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1851 ?auto_1850 ) ( IS-CRATE ?auto_1841 ) ( not ( = ?auto_1840 ?auto_1841 ) ) ( not ( = ?auto_1839 ?auto_1840 ) ) ( not ( = ?auto_1839 ?auto_1841 ) ) ( not ( = ?auto_1849 ?auto_1850 ) ) ( HOIST-AT ?auto_1845 ?auto_1849 ) ( not ( = ?auto_1851 ?auto_1845 ) ) ( AVAILABLE ?auto_1845 ) ( SURFACE-AT ?auto_1841 ?auto_1849 ) ( ON ?auto_1841 ?auto_1848 ) ( CLEAR ?auto_1841 ) ( not ( = ?auto_1840 ?auto_1848 ) ) ( not ( = ?auto_1841 ?auto_1848 ) ) ( not ( = ?auto_1839 ?auto_1848 ) ) ( IS-CRATE ?auto_1840 ) ( not ( = ?auto_1842 ?auto_1850 ) ) ( not ( = ?auto_1849 ?auto_1842 ) ) ( HOIST-AT ?auto_1844 ?auto_1842 ) ( not ( = ?auto_1851 ?auto_1844 ) ) ( not ( = ?auto_1845 ?auto_1844 ) ) ( AVAILABLE ?auto_1844 ) ( SURFACE-AT ?auto_1840 ?auto_1842 ) ( ON ?auto_1840 ?auto_1846 ) ( CLEAR ?auto_1840 ) ( not ( = ?auto_1840 ?auto_1846 ) ) ( not ( = ?auto_1841 ?auto_1846 ) ) ( not ( = ?auto_1839 ?auto_1846 ) ) ( not ( = ?auto_1848 ?auto_1846 ) ) ( TRUCK-AT ?auto_1843 ?auto_1850 ) ( SURFACE-AT ?auto_1847 ?auto_1850 ) ( CLEAR ?auto_1847 ) ( LIFTING ?auto_1851 ?auto_1839 ) ( IS-CRATE ?auto_1839 ) ( not ( = ?auto_1847 ?auto_1839 ) ) ( not ( = ?auto_1840 ?auto_1847 ) ) ( not ( = ?auto_1841 ?auto_1847 ) ) ( not ( = ?auto_1848 ?auto_1847 ) ) ( not ( = ?auto_1846 ?auto_1847 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1840 ?auto_1841 )
      ( MAKE-2CRATE-VERIFY ?auto_1839 ?auto_1840 ?auto_1841 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1852 - SURFACE
      ?auto_1853 - SURFACE
      ?auto_1854 - SURFACE
      ?auto_1855 - SURFACE
    )
    :vars
    (
      ?auto_1861 - HOIST
      ?auto_1857 - PLACE
      ?auto_1862 - PLACE
      ?auto_1858 - HOIST
      ?auto_1860 - SURFACE
      ?auto_1856 - PLACE
      ?auto_1859 - HOIST
      ?auto_1863 - SURFACE
      ?auto_1864 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1861 ?auto_1857 ) ( IS-CRATE ?auto_1855 ) ( not ( = ?auto_1854 ?auto_1855 ) ) ( not ( = ?auto_1853 ?auto_1854 ) ) ( not ( = ?auto_1853 ?auto_1855 ) ) ( not ( = ?auto_1862 ?auto_1857 ) ) ( HOIST-AT ?auto_1858 ?auto_1862 ) ( not ( = ?auto_1861 ?auto_1858 ) ) ( AVAILABLE ?auto_1858 ) ( SURFACE-AT ?auto_1855 ?auto_1862 ) ( ON ?auto_1855 ?auto_1860 ) ( CLEAR ?auto_1855 ) ( not ( = ?auto_1854 ?auto_1860 ) ) ( not ( = ?auto_1855 ?auto_1860 ) ) ( not ( = ?auto_1853 ?auto_1860 ) ) ( IS-CRATE ?auto_1854 ) ( not ( = ?auto_1856 ?auto_1857 ) ) ( not ( = ?auto_1862 ?auto_1856 ) ) ( HOIST-AT ?auto_1859 ?auto_1856 ) ( not ( = ?auto_1861 ?auto_1859 ) ) ( not ( = ?auto_1858 ?auto_1859 ) ) ( AVAILABLE ?auto_1859 ) ( SURFACE-AT ?auto_1854 ?auto_1856 ) ( ON ?auto_1854 ?auto_1863 ) ( CLEAR ?auto_1854 ) ( not ( = ?auto_1854 ?auto_1863 ) ) ( not ( = ?auto_1855 ?auto_1863 ) ) ( not ( = ?auto_1853 ?auto_1863 ) ) ( not ( = ?auto_1860 ?auto_1863 ) ) ( TRUCK-AT ?auto_1864 ?auto_1857 ) ( SURFACE-AT ?auto_1852 ?auto_1857 ) ( CLEAR ?auto_1852 ) ( LIFTING ?auto_1861 ?auto_1853 ) ( IS-CRATE ?auto_1853 ) ( not ( = ?auto_1852 ?auto_1853 ) ) ( not ( = ?auto_1854 ?auto_1852 ) ) ( not ( = ?auto_1855 ?auto_1852 ) ) ( not ( = ?auto_1860 ?auto_1852 ) ) ( not ( = ?auto_1863 ?auto_1852 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1853 ?auto_1854 ?auto_1855 )
      ( MAKE-3CRATE-VERIFY ?auto_1852 ?auto_1853 ?auto_1854 ?auto_1855 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1865 - SURFACE
      ?auto_1866 - SURFACE
    )
    :vars
    (
      ?auto_1872 - HOIST
      ?auto_1868 - PLACE
      ?auto_1877 - SURFACE
      ?auto_1873 - PLACE
      ?auto_1869 - HOIST
      ?auto_1871 - SURFACE
      ?auto_1867 - PLACE
      ?auto_1870 - HOIST
      ?auto_1875 - SURFACE
      ?auto_1876 - TRUCK
      ?auto_1874 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1872 ?auto_1868 ) ( IS-CRATE ?auto_1866 ) ( not ( = ?auto_1865 ?auto_1866 ) ) ( not ( = ?auto_1877 ?auto_1865 ) ) ( not ( = ?auto_1877 ?auto_1866 ) ) ( not ( = ?auto_1873 ?auto_1868 ) ) ( HOIST-AT ?auto_1869 ?auto_1873 ) ( not ( = ?auto_1872 ?auto_1869 ) ) ( AVAILABLE ?auto_1869 ) ( SURFACE-AT ?auto_1866 ?auto_1873 ) ( ON ?auto_1866 ?auto_1871 ) ( CLEAR ?auto_1866 ) ( not ( = ?auto_1865 ?auto_1871 ) ) ( not ( = ?auto_1866 ?auto_1871 ) ) ( not ( = ?auto_1877 ?auto_1871 ) ) ( IS-CRATE ?auto_1865 ) ( not ( = ?auto_1867 ?auto_1868 ) ) ( not ( = ?auto_1873 ?auto_1867 ) ) ( HOIST-AT ?auto_1870 ?auto_1867 ) ( not ( = ?auto_1872 ?auto_1870 ) ) ( not ( = ?auto_1869 ?auto_1870 ) ) ( AVAILABLE ?auto_1870 ) ( SURFACE-AT ?auto_1865 ?auto_1867 ) ( ON ?auto_1865 ?auto_1875 ) ( CLEAR ?auto_1865 ) ( not ( = ?auto_1865 ?auto_1875 ) ) ( not ( = ?auto_1866 ?auto_1875 ) ) ( not ( = ?auto_1877 ?auto_1875 ) ) ( not ( = ?auto_1871 ?auto_1875 ) ) ( TRUCK-AT ?auto_1876 ?auto_1868 ) ( SURFACE-AT ?auto_1874 ?auto_1868 ) ( CLEAR ?auto_1874 ) ( IS-CRATE ?auto_1877 ) ( not ( = ?auto_1874 ?auto_1877 ) ) ( not ( = ?auto_1865 ?auto_1874 ) ) ( not ( = ?auto_1866 ?auto_1874 ) ) ( not ( = ?auto_1871 ?auto_1874 ) ) ( not ( = ?auto_1875 ?auto_1874 ) ) ( AVAILABLE ?auto_1872 ) ( IN ?auto_1877 ?auto_1876 ) )
    :subtasks
    ( ( !UNLOAD ?auto_1872 ?auto_1877 ?auto_1876 ?auto_1868 )
      ( MAKE-2CRATE ?auto_1877 ?auto_1865 ?auto_1866 )
      ( MAKE-1CRATE-VERIFY ?auto_1865 ?auto_1866 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1878 - SURFACE
      ?auto_1879 - SURFACE
      ?auto_1880 - SURFACE
    )
    :vars
    (
      ?auto_1886 - HOIST
      ?auto_1887 - PLACE
      ?auto_1885 - PLACE
      ?auto_1888 - HOIST
      ?auto_1882 - SURFACE
      ?auto_1890 - PLACE
      ?auto_1881 - HOIST
      ?auto_1889 - SURFACE
      ?auto_1883 - TRUCK
      ?auto_1884 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1886 ?auto_1887 ) ( IS-CRATE ?auto_1880 ) ( not ( = ?auto_1879 ?auto_1880 ) ) ( not ( = ?auto_1878 ?auto_1879 ) ) ( not ( = ?auto_1878 ?auto_1880 ) ) ( not ( = ?auto_1885 ?auto_1887 ) ) ( HOIST-AT ?auto_1888 ?auto_1885 ) ( not ( = ?auto_1886 ?auto_1888 ) ) ( AVAILABLE ?auto_1888 ) ( SURFACE-AT ?auto_1880 ?auto_1885 ) ( ON ?auto_1880 ?auto_1882 ) ( CLEAR ?auto_1880 ) ( not ( = ?auto_1879 ?auto_1882 ) ) ( not ( = ?auto_1880 ?auto_1882 ) ) ( not ( = ?auto_1878 ?auto_1882 ) ) ( IS-CRATE ?auto_1879 ) ( not ( = ?auto_1890 ?auto_1887 ) ) ( not ( = ?auto_1885 ?auto_1890 ) ) ( HOIST-AT ?auto_1881 ?auto_1890 ) ( not ( = ?auto_1886 ?auto_1881 ) ) ( not ( = ?auto_1888 ?auto_1881 ) ) ( AVAILABLE ?auto_1881 ) ( SURFACE-AT ?auto_1879 ?auto_1890 ) ( ON ?auto_1879 ?auto_1889 ) ( CLEAR ?auto_1879 ) ( not ( = ?auto_1879 ?auto_1889 ) ) ( not ( = ?auto_1880 ?auto_1889 ) ) ( not ( = ?auto_1878 ?auto_1889 ) ) ( not ( = ?auto_1882 ?auto_1889 ) ) ( TRUCK-AT ?auto_1883 ?auto_1887 ) ( SURFACE-AT ?auto_1884 ?auto_1887 ) ( CLEAR ?auto_1884 ) ( IS-CRATE ?auto_1878 ) ( not ( = ?auto_1884 ?auto_1878 ) ) ( not ( = ?auto_1879 ?auto_1884 ) ) ( not ( = ?auto_1880 ?auto_1884 ) ) ( not ( = ?auto_1882 ?auto_1884 ) ) ( not ( = ?auto_1889 ?auto_1884 ) ) ( AVAILABLE ?auto_1886 ) ( IN ?auto_1878 ?auto_1883 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1879 ?auto_1880 )
      ( MAKE-2CRATE-VERIFY ?auto_1878 ?auto_1879 ?auto_1880 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1891 - SURFACE
      ?auto_1892 - SURFACE
      ?auto_1893 - SURFACE
      ?auto_1894 - SURFACE
    )
    :vars
    (
      ?auto_1900 - HOIST
      ?auto_1901 - PLACE
      ?auto_1899 - PLACE
      ?auto_1903 - HOIST
      ?auto_1898 - SURFACE
      ?auto_1897 - PLACE
      ?auto_1902 - HOIST
      ?auto_1895 - SURFACE
      ?auto_1896 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1900 ?auto_1901 ) ( IS-CRATE ?auto_1894 ) ( not ( = ?auto_1893 ?auto_1894 ) ) ( not ( = ?auto_1892 ?auto_1893 ) ) ( not ( = ?auto_1892 ?auto_1894 ) ) ( not ( = ?auto_1899 ?auto_1901 ) ) ( HOIST-AT ?auto_1903 ?auto_1899 ) ( not ( = ?auto_1900 ?auto_1903 ) ) ( AVAILABLE ?auto_1903 ) ( SURFACE-AT ?auto_1894 ?auto_1899 ) ( ON ?auto_1894 ?auto_1898 ) ( CLEAR ?auto_1894 ) ( not ( = ?auto_1893 ?auto_1898 ) ) ( not ( = ?auto_1894 ?auto_1898 ) ) ( not ( = ?auto_1892 ?auto_1898 ) ) ( IS-CRATE ?auto_1893 ) ( not ( = ?auto_1897 ?auto_1901 ) ) ( not ( = ?auto_1899 ?auto_1897 ) ) ( HOIST-AT ?auto_1902 ?auto_1897 ) ( not ( = ?auto_1900 ?auto_1902 ) ) ( not ( = ?auto_1903 ?auto_1902 ) ) ( AVAILABLE ?auto_1902 ) ( SURFACE-AT ?auto_1893 ?auto_1897 ) ( ON ?auto_1893 ?auto_1895 ) ( CLEAR ?auto_1893 ) ( not ( = ?auto_1893 ?auto_1895 ) ) ( not ( = ?auto_1894 ?auto_1895 ) ) ( not ( = ?auto_1892 ?auto_1895 ) ) ( not ( = ?auto_1898 ?auto_1895 ) ) ( TRUCK-AT ?auto_1896 ?auto_1901 ) ( SURFACE-AT ?auto_1891 ?auto_1901 ) ( CLEAR ?auto_1891 ) ( IS-CRATE ?auto_1892 ) ( not ( = ?auto_1891 ?auto_1892 ) ) ( not ( = ?auto_1893 ?auto_1891 ) ) ( not ( = ?auto_1894 ?auto_1891 ) ) ( not ( = ?auto_1898 ?auto_1891 ) ) ( not ( = ?auto_1895 ?auto_1891 ) ) ( AVAILABLE ?auto_1900 ) ( IN ?auto_1892 ?auto_1896 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1892 ?auto_1893 ?auto_1894 )
      ( MAKE-3CRATE-VERIFY ?auto_1891 ?auto_1892 ?auto_1893 ?auto_1894 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1904 - SURFACE
      ?auto_1905 - SURFACE
    )
    :vars
    (
      ?auto_1912 - HOIST
      ?auto_1913 - PLACE
      ?auto_1916 - SURFACE
      ?auto_1911 - PLACE
      ?auto_1915 - HOIST
      ?auto_1910 - SURFACE
      ?auto_1909 - PLACE
      ?auto_1914 - HOIST
      ?auto_1907 - SURFACE
      ?auto_1906 - SURFACE
      ?auto_1908 - TRUCK
      ?auto_1917 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1912 ?auto_1913 ) ( IS-CRATE ?auto_1905 ) ( not ( = ?auto_1904 ?auto_1905 ) ) ( not ( = ?auto_1916 ?auto_1904 ) ) ( not ( = ?auto_1916 ?auto_1905 ) ) ( not ( = ?auto_1911 ?auto_1913 ) ) ( HOIST-AT ?auto_1915 ?auto_1911 ) ( not ( = ?auto_1912 ?auto_1915 ) ) ( AVAILABLE ?auto_1915 ) ( SURFACE-AT ?auto_1905 ?auto_1911 ) ( ON ?auto_1905 ?auto_1910 ) ( CLEAR ?auto_1905 ) ( not ( = ?auto_1904 ?auto_1910 ) ) ( not ( = ?auto_1905 ?auto_1910 ) ) ( not ( = ?auto_1916 ?auto_1910 ) ) ( IS-CRATE ?auto_1904 ) ( not ( = ?auto_1909 ?auto_1913 ) ) ( not ( = ?auto_1911 ?auto_1909 ) ) ( HOIST-AT ?auto_1914 ?auto_1909 ) ( not ( = ?auto_1912 ?auto_1914 ) ) ( not ( = ?auto_1915 ?auto_1914 ) ) ( AVAILABLE ?auto_1914 ) ( SURFACE-AT ?auto_1904 ?auto_1909 ) ( ON ?auto_1904 ?auto_1907 ) ( CLEAR ?auto_1904 ) ( not ( = ?auto_1904 ?auto_1907 ) ) ( not ( = ?auto_1905 ?auto_1907 ) ) ( not ( = ?auto_1916 ?auto_1907 ) ) ( not ( = ?auto_1910 ?auto_1907 ) ) ( SURFACE-AT ?auto_1906 ?auto_1913 ) ( CLEAR ?auto_1906 ) ( IS-CRATE ?auto_1916 ) ( not ( = ?auto_1906 ?auto_1916 ) ) ( not ( = ?auto_1904 ?auto_1906 ) ) ( not ( = ?auto_1905 ?auto_1906 ) ) ( not ( = ?auto_1910 ?auto_1906 ) ) ( not ( = ?auto_1907 ?auto_1906 ) ) ( AVAILABLE ?auto_1912 ) ( IN ?auto_1916 ?auto_1908 ) ( TRUCK-AT ?auto_1908 ?auto_1917 ) ( not ( = ?auto_1917 ?auto_1913 ) ) ( not ( = ?auto_1911 ?auto_1917 ) ) ( not ( = ?auto_1909 ?auto_1917 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1908 ?auto_1917 ?auto_1913 )
      ( MAKE-2CRATE ?auto_1916 ?auto_1904 ?auto_1905 )
      ( MAKE-1CRATE-VERIFY ?auto_1904 ?auto_1905 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1918 - SURFACE
      ?auto_1919 - SURFACE
      ?auto_1920 - SURFACE
    )
    :vars
    (
      ?auto_1928 - HOIST
      ?auto_1924 - PLACE
      ?auto_1923 - PLACE
      ?auto_1921 - HOIST
      ?auto_1922 - SURFACE
      ?auto_1929 - PLACE
      ?auto_1927 - HOIST
      ?auto_1931 - SURFACE
      ?auto_1926 - SURFACE
      ?auto_1925 - TRUCK
      ?auto_1930 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1928 ?auto_1924 ) ( IS-CRATE ?auto_1920 ) ( not ( = ?auto_1919 ?auto_1920 ) ) ( not ( = ?auto_1918 ?auto_1919 ) ) ( not ( = ?auto_1918 ?auto_1920 ) ) ( not ( = ?auto_1923 ?auto_1924 ) ) ( HOIST-AT ?auto_1921 ?auto_1923 ) ( not ( = ?auto_1928 ?auto_1921 ) ) ( AVAILABLE ?auto_1921 ) ( SURFACE-AT ?auto_1920 ?auto_1923 ) ( ON ?auto_1920 ?auto_1922 ) ( CLEAR ?auto_1920 ) ( not ( = ?auto_1919 ?auto_1922 ) ) ( not ( = ?auto_1920 ?auto_1922 ) ) ( not ( = ?auto_1918 ?auto_1922 ) ) ( IS-CRATE ?auto_1919 ) ( not ( = ?auto_1929 ?auto_1924 ) ) ( not ( = ?auto_1923 ?auto_1929 ) ) ( HOIST-AT ?auto_1927 ?auto_1929 ) ( not ( = ?auto_1928 ?auto_1927 ) ) ( not ( = ?auto_1921 ?auto_1927 ) ) ( AVAILABLE ?auto_1927 ) ( SURFACE-AT ?auto_1919 ?auto_1929 ) ( ON ?auto_1919 ?auto_1931 ) ( CLEAR ?auto_1919 ) ( not ( = ?auto_1919 ?auto_1931 ) ) ( not ( = ?auto_1920 ?auto_1931 ) ) ( not ( = ?auto_1918 ?auto_1931 ) ) ( not ( = ?auto_1922 ?auto_1931 ) ) ( SURFACE-AT ?auto_1926 ?auto_1924 ) ( CLEAR ?auto_1926 ) ( IS-CRATE ?auto_1918 ) ( not ( = ?auto_1926 ?auto_1918 ) ) ( not ( = ?auto_1919 ?auto_1926 ) ) ( not ( = ?auto_1920 ?auto_1926 ) ) ( not ( = ?auto_1922 ?auto_1926 ) ) ( not ( = ?auto_1931 ?auto_1926 ) ) ( AVAILABLE ?auto_1928 ) ( IN ?auto_1918 ?auto_1925 ) ( TRUCK-AT ?auto_1925 ?auto_1930 ) ( not ( = ?auto_1930 ?auto_1924 ) ) ( not ( = ?auto_1923 ?auto_1930 ) ) ( not ( = ?auto_1929 ?auto_1930 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1919 ?auto_1920 )
      ( MAKE-2CRATE-VERIFY ?auto_1918 ?auto_1919 ?auto_1920 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1932 - SURFACE
      ?auto_1933 - SURFACE
      ?auto_1934 - SURFACE
      ?auto_1935 - SURFACE
    )
    :vars
    (
      ?auto_1945 - HOIST
      ?auto_1939 - PLACE
      ?auto_1938 - PLACE
      ?auto_1936 - HOIST
      ?auto_1942 - SURFACE
      ?auto_1943 - PLACE
      ?auto_1944 - HOIST
      ?auto_1941 - SURFACE
      ?auto_1937 - TRUCK
      ?auto_1940 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1945 ?auto_1939 ) ( IS-CRATE ?auto_1935 ) ( not ( = ?auto_1934 ?auto_1935 ) ) ( not ( = ?auto_1933 ?auto_1934 ) ) ( not ( = ?auto_1933 ?auto_1935 ) ) ( not ( = ?auto_1938 ?auto_1939 ) ) ( HOIST-AT ?auto_1936 ?auto_1938 ) ( not ( = ?auto_1945 ?auto_1936 ) ) ( AVAILABLE ?auto_1936 ) ( SURFACE-AT ?auto_1935 ?auto_1938 ) ( ON ?auto_1935 ?auto_1942 ) ( CLEAR ?auto_1935 ) ( not ( = ?auto_1934 ?auto_1942 ) ) ( not ( = ?auto_1935 ?auto_1942 ) ) ( not ( = ?auto_1933 ?auto_1942 ) ) ( IS-CRATE ?auto_1934 ) ( not ( = ?auto_1943 ?auto_1939 ) ) ( not ( = ?auto_1938 ?auto_1943 ) ) ( HOIST-AT ?auto_1944 ?auto_1943 ) ( not ( = ?auto_1945 ?auto_1944 ) ) ( not ( = ?auto_1936 ?auto_1944 ) ) ( AVAILABLE ?auto_1944 ) ( SURFACE-AT ?auto_1934 ?auto_1943 ) ( ON ?auto_1934 ?auto_1941 ) ( CLEAR ?auto_1934 ) ( not ( = ?auto_1934 ?auto_1941 ) ) ( not ( = ?auto_1935 ?auto_1941 ) ) ( not ( = ?auto_1933 ?auto_1941 ) ) ( not ( = ?auto_1942 ?auto_1941 ) ) ( SURFACE-AT ?auto_1932 ?auto_1939 ) ( CLEAR ?auto_1932 ) ( IS-CRATE ?auto_1933 ) ( not ( = ?auto_1932 ?auto_1933 ) ) ( not ( = ?auto_1934 ?auto_1932 ) ) ( not ( = ?auto_1935 ?auto_1932 ) ) ( not ( = ?auto_1942 ?auto_1932 ) ) ( not ( = ?auto_1941 ?auto_1932 ) ) ( AVAILABLE ?auto_1945 ) ( IN ?auto_1933 ?auto_1937 ) ( TRUCK-AT ?auto_1937 ?auto_1940 ) ( not ( = ?auto_1940 ?auto_1939 ) ) ( not ( = ?auto_1938 ?auto_1940 ) ) ( not ( = ?auto_1943 ?auto_1940 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1933 ?auto_1934 ?auto_1935 )
      ( MAKE-3CRATE-VERIFY ?auto_1932 ?auto_1933 ?auto_1934 ?auto_1935 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1946 - SURFACE
      ?auto_1947 - SURFACE
    )
    :vars
    (
      ?auto_1958 - HOIST
      ?auto_1952 - PLACE
      ?auto_1959 - SURFACE
      ?auto_1951 - PLACE
      ?auto_1948 - HOIST
      ?auto_1955 - SURFACE
      ?auto_1956 - PLACE
      ?auto_1957 - HOIST
      ?auto_1954 - SURFACE
      ?auto_1950 - SURFACE
      ?auto_1949 - TRUCK
      ?auto_1953 - PLACE
      ?auto_1960 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1958 ?auto_1952 ) ( IS-CRATE ?auto_1947 ) ( not ( = ?auto_1946 ?auto_1947 ) ) ( not ( = ?auto_1959 ?auto_1946 ) ) ( not ( = ?auto_1959 ?auto_1947 ) ) ( not ( = ?auto_1951 ?auto_1952 ) ) ( HOIST-AT ?auto_1948 ?auto_1951 ) ( not ( = ?auto_1958 ?auto_1948 ) ) ( AVAILABLE ?auto_1948 ) ( SURFACE-AT ?auto_1947 ?auto_1951 ) ( ON ?auto_1947 ?auto_1955 ) ( CLEAR ?auto_1947 ) ( not ( = ?auto_1946 ?auto_1955 ) ) ( not ( = ?auto_1947 ?auto_1955 ) ) ( not ( = ?auto_1959 ?auto_1955 ) ) ( IS-CRATE ?auto_1946 ) ( not ( = ?auto_1956 ?auto_1952 ) ) ( not ( = ?auto_1951 ?auto_1956 ) ) ( HOIST-AT ?auto_1957 ?auto_1956 ) ( not ( = ?auto_1958 ?auto_1957 ) ) ( not ( = ?auto_1948 ?auto_1957 ) ) ( AVAILABLE ?auto_1957 ) ( SURFACE-AT ?auto_1946 ?auto_1956 ) ( ON ?auto_1946 ?auto_1954 ) ( CLEAR ?auto_1946 ) ( not ( = ?auto_1946 ?auto_1954 ) ) ( not ( = ?auto_1947 ?auto_1954 ) ) ( not ( = ?auto_1959 ?auto_1954 ) ) ( not ( = ?auto_1955 ?auto_1954 ) ) ( SURFACE-AT ?auto_1950 ?auto_1952 ) ( CLEAR ?auto_1950 ) ( IS-CRATE ?auto_1959 ) ( not ( = ?auto_1950 ?auto_1959 ) ) ( not ( = ?auto_1946 ?auto_1950 ) ) ( not ( = ?auto_1947 ?auto_1950 ) ) ( not ( = ?auto_1955 ?auto_1950 ) ) ( not ( = ?auto_1954 ?auto_1950 ) ) ( AVAILABLE ?auto_1958 ) ( TRUCK-AT ?auto_1949 ?auto_1953 ) ( not ( = ?auto_1953 ?auto_1952 ) ) ( not ( = ?auto_1951 ?auto_1953 ) ) ( not ( = ?auto_1956 ?auto_1953 ) ) ( HOIST-AT ?auto_1960 ?auto_1953 ) ( LIFTING ?auto_1960 ?auto_1959 ) ( not ( = ?auto_1958 ?auto_1960 ) ) ( not ( = ?auto_1948 ?auto_1960 ) ) ( not ( = ?auto_1957 ?auto_1960 ) ) )
    :subtasks
    ( ( !LOAD ?auto_1960 ?auto_1959 ?auto_1949 ?auto_1953 )
      ( MAKE-2CRATE ?auto_1959 ?auto_1946 ?auto_1947 )
      ( MAKE-1CRATE-VERIFY ?auto_1946 ?auto_1947 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1961 - SURFACE
      ?auto_1962 - SURFACE
      ?auto_1963 - SURFACE
    )
    :vars
    (
      ?auto_1968 - HOIST
      ?auto_1970 - PLACE
      ?auto_1966 - PLACE
      ?auto_1975 - HOIST
      ?auto_1973 - SURFACE
      ?auto_1972 - PLACE
      ?auto_1967 - HOIST
      ?auto_1965 - SURFACE
      ?auto_1969 - SURFACE
      ?auto_1964 - TRUCK
      ?auto_1971 - PLACE
      ?auto_1974 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1968 ?auto_1970 ) ( IS-CRATE ?auto_1963 ) ( not ( = ?auto_1962 ?auto_1963 ) ) ( not ( = ?auto_1961 ?auto_1962 ) ) ( not ( = ?auto_1961 ?auto_1963 ) ) ( not ( = ?auto_1966 ?auto_1970 ) ) ( HOIST-AT ?auto_1975 ?auto_1966 ) ( not ( = ?auto_1968 ?auto_1975 ) ) ( AVAILABLE ?auto_1975 ) ( SURFACE-AT ?auto_1963 ?auto_1966 ) ( ON ?auto_1963 ?auto_1973 ) ( CLEAR ?auto_1963 ) ( not ( = ?auto_1962 ?auto_1973 ) ) ( not ( = ?auto_1963 ?auto_1973 ) ) ( not ( = ?auto_1961 ?auto_1973 ) ) ( IS-CRATE ?auto_1962 ) ( not ( = ?auto_1972 ?auto_1970 ) ) ( not ( = ?auto_1966 ?auto_1972 ) ) ( HOIST-AT ?auto_1967 ?auto_1972 ) ( not ( = ?auto_1968 ?auto_1967 ) ) ( not ( = ?auto_1975 ?auto_1967 ) ) ( AVAILABLE ?auto_1967 ) ( SURFACE-AT ?auto_1962 ?auto_1972 ) ( ON ?auto_1962 ?auto_1965 ) ( CLEAR ?auto_1962 ) ( not ( = ?auto_1962 ?auto_1965 ) ) ( not ( = ?auto_1963 ?auto_1965 ) ) ( not ( = ?auto_1961 ?auto_1965 ) ) ( not ( = ?auto_1973 ?auto_1965 ) ) ( SURFACE-AT ?auto_1969 ?auto_1970 ) ( CLEAR ?auto_1969 ) ( IS-CRATE ?auto_1961 ) ( not ( = ?auto_1969 ?auto_1961 ) ) ( not ( = ?auto_1962 ?auto_1969 ) ) ( not ( = ?auto_1963 ?auto_1969 ) ) ( not ( = ?auto_1973 ?auto_1969 ) ) ( not ( = ?auto_1965 ?auto_1969 ) ) ( AVAILABLE ?auto_1968 ) ( TRUCK-AT ?auto_1964 ?auto_1971 ) ( not ( = ?auto_1971 ?auto_1970 ) ) ( not ( = ?auto_1966 ?auto_1971 ) ) ( not ( = ?auto_1972 ?auto_1971 ) ) ( HOIST-AT ?auto_1974 ?auto_1971 ) ( LIFTING ?auto_1974 ?auto_1961 ) ( not ( = ?auto_1968 ?auto_1974 ) ) ( not ( = ?auto_1975 ?auto_1974 ) ) ( not ( = ?auto_1967 ?auto_1974 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1962 ?auto_1963 )
      ( MAKE-2CRATE-VERIFY ?auto_1961 ?auto_1962 ?auto_1963 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1976 - SURFACE
      ?auto_1977 - SURFACE
      ?auto_1978 - SURFACE
      ?auto_1979 - SURFACE
    )
    :vars
    (
      ?auto_1984 - HOIST
      ?auto_1981 - PLACE
      ?auto_1990 - PLACE
      ?auto_1983 - HOIST
      ?auto_1985 - SURFACE
      ?auto_1982 - PLACE
      ?auto_1987 - HOIST
      ?auto_1989 - SURFACE
      ?auto_1988 - TRUCK
      ?auto_1986 - PLACE
      ?auto_1980 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1984 ?auto_1981 ) ( IS-CRATE ?auto_1979 ) ( not ( = ?auto_1978 ?auto_1979 ) ) ( not ( = ?auto_1977 ?auto_1978 ) ) ( not ( = ?auto_1977 ?auto_1979 ) ) ( not ( = ?auto_1990 ?auto_1981 ) ) ( HOIST-AT ?auto_1983 ?auto_1990 ) ( not ( = ?auto_1984 ?auto_1983 ) ) ( AVAILABLE ?auto_1983 ) ( SURFACE-AT ?auto_1979 ?auto_1990 ) ( ON ?auto_1979 ?auto_1985 ) ( CLEAR ?auto_1979 ) ( not ( = ?auto_1978 ?auto_1985 ) ) ( not ( = ?auto_1979 ?auto_1985 ) ) ( not ( = ?auto_1977 ?auto_1985 ) ) ( IS-CRATE ?auto_1978 ) ( not ( = ?auto_1982 ?auto_1981 ) ) ( not ( = ?auto_1990 ?auto_1982 ) ) ( HOIST-AT ?auto_1987 ?auto_1982 ) ( not ( = ?auto_1984 ?auto_1987 ) ) ( not ( = ?auto_1983 ?auto_1987 ) ) ( AVAILABLE ?auto_1987 ) ( SURFACE-AT ?auto_1978 ?auto_1982 ) ( ON ?auto_1978 ?auto_1989 ) ( CLEAR ?auto_1978 ) ( not ( = ?auto_1978 ?auto_1989 ) ) ( not ( = ?auto_1979 ?auto_1989 ) ) ( not ( = ?auto_1977 ?auto_1989 ) ) ( not ( = ?auto_1985 ?auto_1989 ) ) ( SURFACE-AT ?auto_1976 ?auto_1981 ) ( CLEAR ?auto_1976 ) ( IS-CRATE ?auto_1977 ) ( not ( = ?auto_1976 ?auto_1977 ) ) ( not ( = ?auto_1978 ?auto_1976 ) ) ( not ( = ?auto_1979 ?auto_1976 ) ) ( not ( = ?auto_1985 ?auto_1976 ) ) ( not ( = ?auto_1989 ?auto_1976 ) ) ( AVAILABLE ?auto_1984 ) ( TRUCK-AT ?auto_1988 ?auto_1986 ) ( not ( = ?auto_1986 ?auto_1981 ) ) ( not ( = ?auto_1990 ?auto_1986 ) ) ( not ( = ?auto_1982 ?auto_1986 ) ) ( HOIST-AT ?auto_1980 ?auto_1986 ) ( LIFTING ?auto_1980 ?auto_1977 ) ( not ( = ?auto_1984 ?auto_1980 ) ) ( not ( = ?auto_1983 ?auto_1980 ) ) ( not ( = ?auto_1987 ?auto_1980 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1977 ?auto_1978 ?auto_1979 )
      ( MAKE-3CRATE-VERIFY ?auto_1976 ?auto_1977 ?auto_1978 ?auto_1979 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1991 - SURFACE
      ?auto_1992 - SURFACE
    )
    :vars
    (
      ?auto_1998 - HOIST
      ?auto_1994 - PLACE
      ?auto_2005 - SURFACE
      ?auto_2004 - PLACE
      ?auto_1997 - HOIST
      ?auto_1999 - SURFACE
      ?auto_1995 - PLACE
      ?auto_2001 - HOIST
      ?auto_2003 - SURFACE
      ?auto_1996 - SURFACE
      ?auto_2002 - TRUCK
      ?auto_2000 - PLACE
      ?auto_1993 - HOIST
      ?auto_2006 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1998 ?auto_1994 ) ( IS-CRATE ?auto_1992 ) ( not ( = ?auto_1991 ?auto_1992 ) ) ( not ( = ?auto_2005 ?auto_1991 ) ) ( not ( = ?auto_2005 ?auto_1992 ) ) ( not ( = ?auto_2004 ?auto_1994 ) ) ( HOIST-AT ?auto_1997 ?auto_2004 ) ( not ( = ?auto_1998 ?auto_1997 ) ) ( AVAILABLE ?auto_1997 ) ( SURFACE-AT ?auto_1992 ?auto_2004 ) ( ON ?auto_1992 ?auto_1999 ) ( CLEAR ?auto_1992 ) ( not ( = ?auto_1991 ?auto_1999 ) ) ( not ( = ?auto_1992 ?auto_1999 ) ) ( not ( = ?auto_2005 ?auto_1999 ) ) ( IS-CRATE ?auto_1991 ) ( not ( = ?auto_1995 ?auto_1994 ) ) ( not ( = ?auto_2004 ?auto_1995 ) ) ( HOIST-AT ?auto_2001 ?auto_1995 ) ( not ( = ?auto_1998 ?auto_2001 ) ) ( not ( = ?auto_1997 ?auto_2001 ) ) ( AVAILABLE ?auto_2001 ) ( SURFACE-AT ?auto_1991 ?auto_1995 ) ( ON ?auto_1991 ?auto_2003 ) ( CLEAR ?auto_1991 ) ( not ( = ?auto_1991 ?auto_2003 ) ) ( not ( = ?auto_1992 ?auto_2003 ) ) ( not ( = ?auto_2005 ?auto_2003 ) ) ( not ( = ?auto_1999 ?auto_2003 ) ) ( SURFACE-AT ?auto_1996 ?auto_1994 ) ( CLEAR ?auto_1996 ) ( IS-CRATE ?auto_2005 ) ( not ( = ?auto_1996 ?auto_2005 ) ) ( not ( = ?auto_1991 ?auto_1996 ) ) ( not ( = ?auto_1992 ?auto_1996 ) ) ( not ( = ?auto_1999 ?auto_1996 ) ) ( not ( = ?auto_2003 ?auto_1996 ) ) ( AVAILABLE ?auto_1998 ) ( TRUCK-AT ?auto_2002 ?auto_2000 ) ( not ( = ?auto_2000 ?auto_1994 ) ) ( not ( = ?auto_2004 ?auto_2000 ) ) ( not ( = ?auto_1995 ?auto_2000 ) ) ( HOIST-AT ?auto_1993 ?auto_2000 ) ( not ( = ?auto_1998 ?auto_1993 ) ) ( not ( = ?auto_1997 ?auto_1993 ) ) ( not ( = ?auto_2001 ?auto_1993 ) ) ( AVAILABLE ?auto_1993 ) ( SURFACE-AT ?auto_2005 ?auto_2000 ) ( ON ?auto_2005 ?auto_2006 ) ( CLEAR ?auto_2005 ) ( not ( = ?auto_1991 ?auto_2006 ) ) ( not ( = ?auto_1992 ?auto_2006 ) ) ( not ( = ?auto_2005 ?auto_2006 ) ) ( not ( = ?auto_1999 ?auto_2006 ) ) ( not ( = ?auto_2003 ?auto_2006 ) ) ( not ( = ?auto_1996 ?auto_2006 ) ) )
    :subtasks
    ( ( !LIFT ?auto_1993 ?auto_2005 ?auto_2006 ?auto_2000 )
      ( MAKE-2CRATE ?auto_2005 ?auto_1991 ?auto_1992 )
      ( MAKE-1CRATE-VERIFY ?auto_1991 ?auto_1992 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2007 - SURFACE
      ?auto_2008 - SURFACE
      ?auto_2009 - SURFACE
    )
    :vars
    (
      ?auto_2010 - HOIST
      ?auto_2021 - PLACE
      ?auto_2011 - PLACE
      ?auto_2014 - HOIST
      ?auto_2018 - SURFACE
      ?auto_2013 - PLACE
      ?auto_2022 - HOIST
      ?auto_2012 - SURFACE
      ?auto_2017 - SURFACE
      ?auto_2019 - TRUCK
      ?auto_2016 - PLACE
      ?auto_2015 - HOIST
      ?auto_2020 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2010 ?auto_2021 ) ( IS-CRATE ?auto_2009 ) ( not ( = ?auto_2008 ?auto_2009 ) ) ( not ( = ?auto_2007 ?auto_2008 ) ) ( not ( = ?auto_2007 ?auto_2009 ) ) ( not ( = ?auto_2011 ?auto_2021 ) ) ( HOIST-AT ?auto_2014 ?auto_2011 ) ( not ( = ?auto_2010 ?auto_2014 ) ) ( AVAILABLE ?auto_2014 ) ( SURFACE-AT ?auto_2009 ?auto_2011 ) ( ON ?auto_2009 ?auto_2018 ) ( CLEAR ?auto_2009 ) ( not ( = ?auto_2008 ?auto_2018 ) ) ( not ( = ?auto_2009 ?auto_2018 ) ) ( not ( = ?auto_2007 ?auto_2018 ) ) ( IS-CRATE ?auto_2008 ) ( not ( = ?auto_2013 ?auto_2021 ) ) ( not ( = ?auto_2011 ?auto_2013 ) ) ( HOIST-AT ?auto_2022 ?auto_2013 ) ( not ( = ?auto_2010 ?auto_2022 ) ) ( not ( = ?auto_2014 ?auto_2022 ) ) ( AVAILABLE ?auto_2022 ) ( SURFACE-AT ?auto_2008 ?auto_2013 ) ( ON ?auto_2008 ?auto_2012 ) ( CLEAR ?auto_2008 ) ( not ( = ?auto_2008 ?auto_2012 ) ) ( not ( = ?auto_2009 ?auto_2012 ) ) ( not ( = ?auto_2007 ?auto_2012 ) ) ( not ( = ?auto_2018 ?auto_2012 ) ) ( SURFACE-AT ?auto_2017 ?auto_2021 ) ( CLEAR ?auto_2017 ) ( IS-CRATE ?auto_2007 ) ( not ( = ?auto_2017 ?auto_2007 ) ) ( not ( = ?auto_2008 ?auto_2017 ) ) ( not ( = ?auto_2009 ?auto_2017 ) ) ( not ( = ?auto_2018 ?auto_2017 ) ) ( not ( = ?auto_2012 ?auto_2017 ) ) ( AVAILABLE ?auto_2010 ) ( TRUCK-AT ?auto_2019 ?auto_2016 ) ( not ( = ?auto_2016 ?auto_2021 ) ) ( not ( = ?auto_2011 ?auto_2016 ) ) ( not ( = ?auto_2013 ?auto_2016 ) ) ( HOIST-AT ?auto_2015 ?auto_2016 ) ( not ( = ?auto_2010 ?auto_2015 ) ) ( not ( = ?auto_2014 ?auto_2015 ) ) ( not ( = ?auto_2022 ?auto_2015 ) ) ( AVAILABLE ?auto_2015 ) ( SURFACE-AT ?auto_2007 ?auto_2016 ) ( ON ?auto_2007 ?auto_2020 ) ( CLEAR ?auto_2007 ) ( not ( = ?auto_2008 ?auto_2020 ) ) ( not ( = ?auto_2009 ?auto_2020 ) ) ( not ( = ?auto_2007 ?auto_2020 ) ) ( not ( = ?auto_2018 ?auto_2020 ) ) ( not ( = ?auto_2012 ?auto_2020 ) ) ( not ( = ?auto_2017 ?auto_2020 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2008 ?auto_2009 )
      ( MAKE-2CRATE-VERIFY ?auto_2007 ?auto_2008 ?auto_2009 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2023 - SURFACE
      ?auto_2024 - SURFACE
      ?auto_2025 - SURFACE
      ?auto_2026 - SURFACE
    )
    :vars
    (
      ?auto_2035 - HOIST
      ?auto_2028 - PLACE
      ?auto_2034 - PLACE
      ?auto_2033 - HOIST
      ?auto_2027 - SURFACE
      ?auto_2036 - PLACE
      ?auto_2030 - HOIST
      ?auto_2029 - SURFACE
      ?auto_2032 - TRUCK
      ?auto_2038 - PLACE
      ?auto_2037 - HOIST
      ?auto_2031 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2035 ?auto_2028 ) ( IS-CRATE ?auto_2026 ) ( not ( = ?auto_2025 ?auto_2026 ) ) ( not ( = ?auto_2024 ?auto_2025 ) ) ( not ( = ?auto_2024 ?auto_2026 ) ) ( not ( = ?auto_2034 ?auto_2028 ) ) ( HOIST-AT ?auto_2033 ?auto_2034 ) ( not ( = ?auto_2035 ?auto_2033 ) ) ( AVAILABLE ?auto_2033 ) ( SURFACE-AT ?auto_2026 ?auto_2034 ) ( ON ?auto_2026 ?auto_2027 ) ( CLEAR ?auto_2026 ) ( not ( = ?auto_2025 ?auto_2027 ) ) ( not ( = ?auto_2026 ?auto_2027 ) ) ( not ( = ?auto_2024 ?auto_2027 ) ) ( IS-CRATE ?auto_2025 ) ( not ( = ?auto_2036 ?auto_2028 ) ) ( not ( = ?auto_2034 ?auto_2036 ) ) ( HOIST-AT ?auto_2030 ?auto_2036 ) ( not ( = ?auto_2035 ?auto_2030 ) ) ( not ( = ?auto_2033 ?auto_2030 ) ) ( AVAILABLE ?auto_2030 ) ( SURFACE-AT ?auto_2025 ?auto_2036 ) ( ON ?auto_2025 ?auto_2029 ) ( CLEAR ?auto_2025 ) ( not ( = ?auto_2025 ?auto_2029 ) ) ( not ( = ?auto_2026 ?auto_2029 ) ) ( not ( = ?auto_2024 ?auto_2029 ) ) ( not ( = ?auto_2027 ?auto_2029 ) ) ( SURFACE-AT ?auto_2023 ?auto_2028 ) ( CLEAR ?auto_2023 ) ( IS-CRATE ?auto_2024 ) ( not ( = ?auto_2023 ?auto_2024 ) ) ( not ( = ?auto_2025 ?auto_2023 ) ) ( not ( = ?auto_2026 ?auto_2023 ) ) ( not ( = ?auto_2027 ?auto_2023 ) ) ( not ( = ?auto_2029 ?auto_2023 ) ) ( AVAILABLE ?auto_2035 ) ( TRUCK-AT ?auto_2032 ?auto_2038 ) ( not ( = ?auto_2038 ?auto_2028 ) ) ( not ( = ?auto_2034 ?auto_2038 ) ) ( not ( = ?auto_2036 ?auto_2038 ) ) ( HOIST-AT ?auto_2037 ?auto_2038 ) ( not ( = ?auto_2035 ?auto_2037 ) ) ( not ( = ?auto_2033 ?auto_2037 ) ) ( not ( = ?auto_2030 ?auto_2037 ) ) ( AVAILABLE ?auto_2037 ) ( SURFACE-AT ?auto_2024 ?auto_2038 ) ( ON ?auto_2024 ?auto_2031 ) ( CLEAR ?auto_2024 ) ( not ( = ?auto_2025 ?auto_2031 ) ) ( not ( = ?auto_2026 ?auto_2031 ) ) ( not ( = ?auto_2024 ?auto_2031 ) ) ( not ( = ?auto_2027 ?auto_2031 ) ) ( not ( = ?auto_2029 ?auto_2031 ) ) ( not ( = ?auto_2023 ?auto_2031 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2024 ?auto_2025 ?auto_2026 )
      ( MAKE-3CRATE-VERIFY ?auto_2023 ?auto_2024 ?auto_2025 ?auto_2026 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2039 - SURFACE
      ?auto_2040 - SURFACE
    )
    :vars
    (
      ?auto_2050 - HOIST
      ?auto_2042 - PLACE
      ?auto_2054 - SURFACE
      ?auto_2049 - PLACE
      ?auto_2048 - HOIST
      ?auto_2041 - SURFACE
      ?auto_2051 - PLACE
      ?auto_2044 - HOIST
      ?auto_2043 - SURFACE
      ?auto_2045 - SURFACE
      ?auto_2053 - PLACE
      ?auto_2052 - HOIST
      ?auto_2046 - SURFACE
      ?auto_2047 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2050 ?auto_2042 ) ( IS-CRATE ?auto_2040 ) ( not ( = ?auto_2039 ?auto_2040 ) ) ( not ( = ?auto_2054 ?auto_2039 ) ) ( not ( = ?auto_2054 ?auto_2040 ) ) ( not ( = ?auto_2049 ?auto_2042 ) ) ( HOIST-AT ?auto_2048 ?auto_2049 ) ( not ( = ?auto_2050 ?auto_2048 ) ) ( AVAILABLE ?auto_2048 ) ( SURFACE-AT ?auto_2040 ?auto_2049 ) ( ON ?auto_2040 ?auto_2041 ) ( CLEAR ?auto_2040 ) ( not ( = ?auto_2039 ?auto_2041 ) ) ( not ( = ?auto_2040 ?auto_2041 ) ) ( not ( = ?auto_2054 ?auto_2041 ) ) ( IS-CRATE ?auto_2039 ) ( not ( = ?auto_2051 ?auto_2042 ) ) ( not ( = ?auto_2049 ?auto_2051 ) ) ( HOIST-AT ?auto_2044 ?auto_2051 ) ( not ( = ?auto_2050 ?auto_2044 ) ) ( not ( = ?auto_2048 ?auto_2044 ) ) ( AVAILABLE ?auto_2044 ) ( SURFACE-AT ?auto_2039 ?auto_2051 ) ( ON ?auto_2039 ?auto_2043 ) ( CLEAR ?auto_2039 ) ( not ( = ?auto_2039 ?auto_2043 ) ) ( not ( = ?auto_2040 ?auto_2043 ) ) ( not ( = ?auto_2054 ?auto_2043 ) ) ( not ( = ?auto_2041 ?auto_2043 ) ) ( SURFACE-AT ?auto_2045 ?auto_2042 ) ( CLEAR ?auto_2045 ) ( IS-CRATE ?auto_2054 ) ( not ( = ?auto_2045 ?auto_2054 ) ) ( not ( = ?auto_2039 ?auto_2045 ) ) ( not ( = ?auto_2040 ?auto_2045 ) ) ( not ( = ?auto_2041 ?auto_2045 ) ) ( not ( = ?auto_2043 ?auto_2045 ) ) ( AVAILABLE ?auto_2050 ) ( not ( = ?auto_2053 ?auto_2042 ) ) ( not ( = ?auto_2049 ?auto_2053 ) ) ( not ( = ?auto_2051 ?auto_2053 ) ) ( HOIST-AT ?auto_2052 ?auto_2053 ) ( not ( = ?auto_2050 ?auto_2052 ) ) ( not ( = ?auto_2048 ?auto_2052 ) ) ( not ( = ?auto_2044 ?auto_2052 ) ) ( AVAILABLE ?auto_2052 ) ( SURFACE-AT ?auto_2054 ?auto_2053 ) ( ON ?auto_2054 ?auto_2046 ) ( CLEAR ?auto_2054 ) ( not ( = ?auto_2039 ?auto_2046 ) ) ( not ( = ?auto_2040 ?auto_2046 ) ) ( not ( = ?auto_2054 ?auto_2046 ) ) ( not ( = ?auto_2041 ?auto_2046 ) ) ( not ( = ?auto_2043 ?auto_2046 ) ) ( not ( = ?auto_2045 ?auto_2046 ) ) ( TRUCK-AT ?auto_2047 ?auto_2042 ) )
    :subtasks
    ( ( !DRIVE ?auto_2047 ?auto_2042 ?auto_2053 )
      ( MAKE-2CRATE ?auto_2054 ?auto_2039 ?auto_2040 )
      ( MAKE-1CRATE-VERIFY ?auto_2039 ?auto_2040 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2055 - SURFACE
      ?auto_2056 - SURFACE
      ?auto_2057 - SURFACE
    )
    :vars
    (
      ?auto_2069 - HOIST
      ?auto_2064 - PLACE
      ?auto_2063 - PLACE
      ?auto_2061 - HOIST
      ?auto_2066 - SURFACE
      ?auto_2067 - PLACE
      ?auto_2060 - HOIST
      ?auto_2062 - SURFACE
      ?auto_2059 - SURFACE
      ?auto_2070 - PLACE
      ?auto_2068 - HOIST
      ?auto_2065 - SURFACE
      ?auto_2058 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2069 ?auto_2064 ) ( IS-CRATE ?auto_2057 ) ( not ( = ?auto_2056 ?auto_2057 ) ) ( not ( = ?auto_2055 ?auto_2056 ) ) ( not ( = ?auto_2055 ?auto_2057 ) ) ( not ( = ?auto_2063 ?auto_2064 ) ) ( HOIST-AT ?auto_2061 ?auto_2063 ) ( not ( = ?auto_2069 ?auto_2061 ) ) ( AVAILABLE ?auto_2061 ) ( SURFACE-AT ?auto_2057 ?auto_2063 ) ( ON ?auto_2057 ?auto_2066 ) ( CLEAR ?auto_2057 ) ( not ( = ?auto_2056 ?auto_2066 ) ) ( not ( = ?auto_2057 ?auto_2066 ) ) ( not ( = ?auto_2055 ?auto_2066 ) ) ( IS-CRATE ?auto_2056 ) ( not ( = ?auto_2067 ?auto_2064 ) ) ( not ( = ?auto_2063 ?auto_2067 ) ) ( HOIST-AT ?auto_2060 ?auto_2067 ) ( not ( = ?auto_2069 ?auto_2060 ) ) ( not ( = ?auto_2061 ?auto_2060 ) ) ( AVAILABLE ?auto_2060 ) ( SURFACE-AT ?auto_2056 ?auto_2067 ) ( ON ?auto_2056 ?auto_2062 ) ( CLEAR ?auto_2056 ) ( not ( = ?auto_2056 ?auto_2062 ) ) ( not ( = ?auto_2057 ?auto_2062 ) ) ( not ( = ?auto_2055 ?auto_2062 ) ) ( not ( = ?auto_2066 ?auto_2062 ) ) ( SURFACE-AT ?auto_2059 ?auto_2064 ) ( CLEAR ?auto_2059 ) ( IS-CRATE ?auto_2055 ) ( not ( = ?auto_2059 ?auto_2055 ) ) ( not ( = ?auto_2056 ?auto_2059 ) ) ( not ( = ?auto_2057 ?auto_2059 ) ) ( not ( = ?auto_2066 ?auto_2059 ) ) ( not ( = ?auto_2062 ?auto_2059 ) ) ( AVAILABLE ?auto_2069 ) ( not ( = ?auto_2070 ?auto_2064 ) ) ( not ( = ?auto_2063 ?auto_2070 ) ) ( not ( = ?auto_2067 ?auto_2070 ) ) ( HOIST-AT ?auto_2068 ?auto_2070 ) ( not ( = ?auto_2069 ?auto_2068 ) ) ( not ( = ?auto_2061 ?auto_2068 ) ) ( not ( = ?auto_2060 ?auto_2068 ) ) ( AVAILABLE ?auto_2068 ) ( SURFACE-AT ?auto_2055 ?auto_2070 ) ( ON ?auto_2055 ?auto_2065 ) ( CLEAR ?auto_2055 ) ( not ( = ?auto_2056 ?auto_2065 ) ) ( not ( = ?auto_2057 ?auto_2065 ) ) ( not ( = ?auto_2055 ?auto_2065 ) ) ( not ( = ?auto_2066 ?auto_2065 ) ) ( not ( = ?auto_2062 ?auto_2065 ) ) ( not ( = ?auto_2059 ?auto_2065 ) ) ( TRUCK-AT ?auto_2058 ?auto_2064 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2056 ?auto_2057 )
      ( MAKE-2CRATE-VERIFY ?auto_2055 ?auto_2056 ?auto_2057 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2071 - SURFACE
      ?auto_2072 - SURFACE
      ?auto_2073 - SURFACE
      ?auto_2074 - SURFACE
    )
    :vars
    (
      ?auto_2075 - HOIST
      ?auto_2084 - PLACE
      ?auto_2076 - PLACE
      ?auto_2082 - HOIST
      ?auto_2080 - SURFACE
      ?auto_2077 - PLACE
      ?auto_2079 - HOIST
      ?auto_2086 - SURFACE
      ?auto_2078 - PLACE
      ?auto_2081 - HOIST
      ?auto_2085 - SURFACE
      ?auto_2083 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2075 ?auto_2084 ) ( IS-CRATE ?auto_2074 ) ( not ( = ?auto_2073 ?auto_2074 ) ) ( not ( = ?auto_2072 ?auto_2073 ) ) ( not ( = ?auto_2072 ?auto_2074 ) ) ( not ( = ?auto_2076 ?auto_2084 ) ) ( HOIST-AT ?auto_2082 ?auto_2076 ) ( not ( = ?auto_2075 ?auto_2082 ) ) ( AVAILABLE ?auto_2082 ) ( SURFACE-AT ?auto_2074 ?auto_2076 ) ( ON ?auto_2074 ?auto_2080 ) ( CLEAR ?auto_2074 ) ( not ( = ?auto_2073 ?auto_2080 ) ) ( not ( = ?auto_2074 ?auto_2080 ) ) ( not ( = ?auto_2072 ?auto_2080 ) ) ( IS-CRATE ?auto_2073 ) ( not ( = ?auto_2077 ?auto_2084 ) ) ( not ( = ?auto_2076 ?auto_2077 ) ) ( HOIST-AT ?auto_2079 ?auto_2077 ) ( not ( = ?auto_2075 ?auto_2079 ) ) ( not ( = ?auto_2082 ?auto_2079 ) ) ( AVAILABLE ?auto_2079 ) ( SURFACE-AT ?auto_2073 ?auto_2077 ) ( ON ?auto_2073 ?auto_2086 ) ( CLEAR ?auto_2073 ) ( not ( = ?auto_2073 ?auto_2086 ) ) ( not ( = ?auto_2074 ?auto_2086 ) ) ( not ( = ?auto_2072 ?auto_2086 ) ) ( not ( = ?auto_2080 ?auto_2086 ) ) ( SURFACE-AT ?auto_2071 ?auto_2084 ) ( CLEAR ?auto_2071 ) ( IS-CRATE ?auto_2072 ) ( not ( = ?auto_2071 ?auto_2072 ) ) ( not ( = ?auto_2073 ?auto_2071 ) ) ( not ( = ?auto_2074 ?auto_2071 ) ) ( not ( = ?auto_2080 ?auto_2071 ) ) ( not ( = ?auto_2086 ?auto_2071 ) ) ( AVAILABLE ?auto_2075 ) ( not ( = ?auto_2078 ?auto_2084 ) ) ( not ( = ?auto_2076 ?auto_2078 ) ) ( not ( = ?auto_2077 ?auto_2078 ) ) ( HOIST-AT ?auto_2081 ?auto_2078 ) ( not ( = ?auto_2075 ?auto_2081 ) ) ( not ( = ?auto_2082 ?auto_2081 ) ) ( not ( = ?auto_2079 ?auto_2081 ) ) ( AVAILABLE ?auto_2081 ) ( SURFACE-AT ?auto_2072 ?auto_2078 ) ( ON ?auto_2072 ?auto_2085 ) ( CLEAR ?auto_2072 ) ( not ( = ?auto_2073 ?auto_2085 ) ) ( not ( = ?auto_2074 ?auto_2085 ) ) ( not ( = ?auto_2072 ?auto_2085 ) ) ( not ( = ?auto_2080 ?auto_2085 ) ) ( not ( = ?auto_2086 ?auto_2085 ) ) ( not ( = ?auto_2071 ?auto_2085 ) ) ( TRUCK-AT ?auto_2083 ?auto_2084 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2072 ?auto_2073 ?auto_2074 )
      ( MAKE-3CRATE-VERIFY ?auto_2071 ?auto_2072 ?auto_2073 ?auto_2074 ) )
  )

)

