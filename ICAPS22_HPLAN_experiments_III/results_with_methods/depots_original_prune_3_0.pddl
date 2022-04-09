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
      ?auto_1198 - SURFACE
      ?auto_1199 - SURFACE
    )
    :vars
    (
      ?auto_1200 - HOIST
      ?auto_1201 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1200 ?auto_1201 ) ( SURFACE-AT ?auto_1198 ?auto_1201 ) ( CLEAR ?auto_1198 ) ( LIFTING ?auto_1200 ?auto_1199 ) ( IS-CRATE ?auto_1199 ) ( not ( = ?auto_1198 ?auto_1199 ) ) )
    :subtasks
    ( ( !DROP ?auto_1200 ?auto_1199 ?auto_1198 ?auto_1201 )
      ( MAKE-1CRATE-VERIFY ?auto_1198 ?auto_1199 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1202 - SURFACE
      ?auto_1203 - SURFACE
    )
    :vars
    (
      ?auto_1204 - HOIST
      ?auto_1205 - PLACE
      ?auto_1206 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1204 ?auto_1205 ) ( SURFACE-AT ?auto_1202 ?auto_1205 ) ( CLEAR ?auto_1202 ) ( IS-CRATE ?auto_1203 ) ( not ( = ?auto_1202 ?auto_1203 ) ) ( TRUCK-AT ?auto_1206 ?auto_1205 ) ( AVAILABLE ?auto_1204 ) ( IN ?auto_1203 ?auto_1206 ) )
    :subtasks
    ( ( !UNLOAD ?auto_1204 ?auto_1203 ?auto_1206 ?auto_1205 )
      ( MAKE-1CRATE ?auto_1202 ?auto_1203 )
      ( MAKE-1CRATE-VERIFY ?auto_1202 ?auto_1203 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1207 - SURFACE
      ?auto_1208 - SURFACE
    )
    :vars
    (
      ?auto_1211 - HOIST
      ?auto_1210 - PLACE
      ?auto_1209 - TRUCK
      ?auto_1212 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1211 ?auto_1210 ) ( SURFACE-AT ?auto_1207 ?auto_1210 ) ( CLEAR ?auto_1207 ) ( IS-CRATE ?auto_1208 ) ( not ( = ?auto_1207 ?auto_1208 ) ) ( AVAILABLE ?auto_1211 ) ( IN ?auto_1208 ?auto_1209 ) ( TRUCK-AT ?auto_1209 ?auto_1212 ) ( not ( = ?auto_1212 ?auto_1210 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1209 ?auto_1212 ?auto_1210 )
      ( MAKE-1CRATE ?auto_1207 ?auto_1208 )
      ( MAKE-1CRATE-VERIFY ?auto_1207 ?auto_1208 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1213 - SURFACE
      ?auto_1214 - SURFACE
    )
    :vars
    (
      ?auto_1217 - HOIST
      ?auto_1218 - PLACE
      ?auto_1216 - TRUCK
      ?auto_1215 - PLACE
      ?auto_1219 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1217 ?auto_1218 ) ( SURFACE-AT ?auto_1213 ?auto_1218 ) ( CLEAR ?auto_1213 ) ( IS-CRATE ?auto_1214 ) ( not ( = ?auto_1213 ?auto_1214 ) ) ( AVAILABLE ?auto_1217 ) ( TRUCK-AT ?auto_1216 ?auto_1215 ) ( not ( = ?auto_1215 ?auto_1218 ) ) ( HOIST-AT ?auto_1219 ?auto_1215 ) ( LIFTING ?auto_1219 ?auto_1214 ) ( not ( = ?auto_1217 ?auto_1219 ) ) )
    :subtasks
    ( ( !LOAD ?auto_1219 ?auto_1214 ?auto_1216 ?auto_1215 )
      ( MAKE-1CRATE ?auto_1213 ?auto_1214 )
      ( MAKE-1CRATE-VERIFY ?auto_1213 ?auto_1214 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1220 - SURFACE
      ?auto_1221 - SURFACE
    )
    :vars
    (
      ?auto_1222 - HOIST
      ?auto_1225 - PLACE
      ?auto_1224 - TRUCK
      ?auto_1226 - PLACE
      ?auto_1223 - HOIST
      ?auto_1227 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1222 ?auto_1225 ) ( SURFACE-AT ?auto_1220 ?auto_1225 ) ( CLEAR ?auto_1220 ) ( IS-CRATE ?auto_1221 ) ( not ( = ?auto_1220 ?auto_1221 ) ) ( AVAILABLE ?auto_1222 ) ( TRUCK-AT ?auto_1224 ?auto_1226 ) ( not ( = ?auto_1226 ?auto_1225 ) ) ( HOIST-AT ?auto_1223 ?auto_1226 ) ( not ( = ?auto_1222 ?auto_1223 ) ) ( AVAILABLE ?auto_1223 ) ( SURFACE-AT ?auto_1221 ?auto_1226 ) ( ON ?auto_1221 ?auto_1227 ) ( CLEAR ?auto_1221 ) ( not ( = ?auto_1220 ?auto_1227 ) ) ( not ( = ?auto_1221 ?auto_1227 ) ) )
    :subtasks
    ( ( !LIFT ?auto_1223 ?auto_1221 ?auto_1227 ?auto_1226 )
      ( MAKE-1CRATE ?auto_1220 ?auto_1221 )
      ( MAKE-1CRATE-VERIFY ?auto_1220 ?auto_1221 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1228 - SURFACE
      ?auto_1229 - SURFACE
    )
    :vars
    (
      ?auto_1230 - HOIST
      ?auto_1231 - PLACE
      ?auto_1233 - PLACE
      ?auto_1232 - HOIST
      ?auto_1234 - SURFACE
      ?auto_1235 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1230 ?auto_1231 ) ( SURFACE-AT ?auto_1228 ?auto_1231 ) ( CLEAR ?auto_1228 ) ( IS-CRATE ?auto_1229 ) ( not ( = ?auto_1228 ?auto_1229 ) ) ( AVAILABLE ?auto_1230 ) ( not ( = ?auto_1233 ?auto_1231 ) ) ( HOIST-AT ?auto_1232 ?auto_1233 ) ( not ( = ?auto_1230 ?auto_1232 ) ) ( AVAILABLE ?auto_1232 ) ( SURFACE-AT ?auto_1229 ?auto_1233 ) ( ON ?auto_1229 ?auto_1234 ) ( CLEAR ?auto_1229 ) ( not ( = ?auto_1228 ?auto_1234 ) ) ( not ( = ?auto_1229 ?auto_1234 ) ) ( TRUCK-AT ?auto_1235 ?auto_1231 ) )
    :subtasks
    ( ( !DRIVE ?auto_1235 ?auto_1231 ?auto_1233 )
      ( MAKE-1CRATE ?auto_1228 ?auto_1229 )
      ( MAKE-1CRATE-VERIFY ?auto_1228 ?auto_1229 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1245 - SURFACE
      ?auto_1246 - SURFACE
      ?auto_1247 - SURFACE
    )
    :vars
    (
      ?auto_1248 - HOIST
      ?auto_1249 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1248 ?auto_1249 ) ( SURFACE-AT ?auto_1246 ?auto_1249 ) ( CLEAR ?auto_1246 ) ( LIFTING ?auto_1248 ?auto_1247 ) ( IS-CRATE ?auto_1247 ) ( not ( = ?auto_1246 ?auto_1247 ) ) ( ON ?auto_1246 ?auto_1245 ) ( not ( = ?auto_1245 ?auto_1246 ) ) ( not ( = ?auto_1245 ?auto_1247 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1246 ?auto_1247 )
      ( MAKE-2CRATE-VERIFY ?auto_1245 ?auto_1246 ?auto_1247 ) )
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
      ?auto_1258 - HOIST
      ?auto_1260 - PLACE
      ?auto_1259 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1258 ?auto_1260 ) ( SURFACE-AT ?auto_1256 ?auto_1260 ) ( CLEAR ?auto_1256 ) ( IS-CRATE ?auto_1257 ) ( not ( = ?auto_1256 ?auto_1257 ) ) ( TRUCK-AT ?auto_1259 ?auto_1260 ) ( AVAILABLE ?auto_1258 ) ( IN ?auto_1257 ?auto_1259 ) ( ON ?auto_1256 ?auto_1255 ) ( not ( = ?auto_1255 ?auto_1256 ) ) ( not ( = ?auto_1255 ?auto_1257 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1256 ?auto_1257 )
      ( MAKE-2CRATE-VERIFY ?auto_1255 ?auto_1256 ?auto_1257 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1261 - SURFACE
      ?auto_1262 - SURFACE
    )
    :vars
    (
      ?auto_1264 - HOIST
      ?auto_1263 - PLACE
      ?auto_1266 - TRUCK
      ?auto_1265 - SURFACE
      ?auto_1267 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1264 ?auto_1263 ) ( SURFACE-AT ?auto_1261 ?auto_1263 ) ( CLEAR ?auto_1261 ) ( IS-CRATE ?auto_1262 ) ( not ( = ?auto_1261 ?auto_1262 ) ) ( AVAILABLE ?auto_1264 ) ( IN ?auto_1262 ?auto_1266 ) ( ON ?auto_1261 ?auto_1265 ) ( not ( = ?auto_1265 ?auto_1261 ) ) ( not ( = ?auto_1265 ?auto_1262 ) ) ( TRUCK-AT ?auto_1266 ?auto_1267 ) ( not ( = ?auto_1267 ?auto_1263 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1266 ?auto_1267 ?auto_1263 )
      ( MAKE-2CRATE ?auto_1265 ?auto_1261 ?auto_1262 )
      ( MAKE-1CRATE-VERIFY ?auto_1261 ?auto_1262 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1268 - SURFACE
      ?auto_1269 - SURFACE
      ?auto_1270 - SURFACE
    )
    :vars
    (
      ?auto_1274 - HOIST
      ?auto_1272 - PLACE
      ?auto_1273 - TRUCK
      ?auto_1271 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1274 ?auto_1272 ) ( SURFACE-AT ?auto_1269 ?auto_1272 ) ( CLEAR ?auto_1269 ) ( IS-CRATE ?auto_1270 ) ( not ( = ?auto_1269 ?auto_1270 ) ) ( AVAILABLE ?auto_1274 ) ( IN ?auto_1270 ?auto_1273 ) ( ON ?auto_1269 ?auto_1268 ) ( not ( = ?auto_1268 ?auto_1269 ) ) ( not ( = ?auto_1268 ?auto_1270 ) ) ( TRUCK-AT ?auto_1273 ?auto_1271 ) ( not ( = ?auto_1271 ?auto_1272 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1269 ?auto_1270 )
      ( MAKE-2CRATE-VERIFY ?auto_1268 ?auto_1269 ?auto_1270 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1275 - SURFACE
      ?auto_1276 - SURFACE
    )
    :vars
    (
      ?auto_1280 - HOIST
      ?auto_1281 - PLACE
      ?auto_1277 - SURFACE
      ?auto_1278 - TRUCK
      ?auto_1279 - PLACE
      ?auto_1282 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1280 ?auto_1281 ) ( SURFACE-AT ?auto_1275 ?auto_1281 ) ( CLEAR ?auto_1275 ) ( IS-CRATE ?auto_1276 ) ( not ( = ?auto_1275 ?auto_1276 ) ) ( AVAILABLE ?auto_1280 ) ( ON ?auto_1275 ?auto_1277 ) ( not ( = ?auto_1277 ?auto_1275 ) ) ( not ( = ?auto_1277 ?auto_1276 ) ) ( TRUCK-AT ?auto_1278 ?auto_1279 ) ( not ( = ?auto_1279 ?auto_1281 ) ) ( HOIST-AT ?auto_1282 ?auto_1279 ) ( LIFTING ?auto_1282 ?auto_1276 ) ( not ( = ?auto_1280 ?auto_1282 ) ) )
    :subtasks
    ( ( !LOAD ?auto_1282 ?auto_1276 ?auto_1278 ?auto_1279 )
      ( MAKE-2CRATE ?auto_1277 ?auto_1275 ?auto_1276 )
      ( MAKE-1CRATE-VERIFY ?auto_1275 ?auto_1276 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1283 - SURFACE
      ?auto_1284 - SURFACE
      ?auto_1285 - SURFACE
    )
    :vars
    (
      ?auto_1286 - HOIST
      ?auto_1288 - PLACE
      ?auto_1289 - TRUCK
      ?auto_1287 - PLACE
      ?auto_1290 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1286 ?auto_1288 ) ( SURFACE-AT ?auto_1284 ?auto_1288 ) ( CLEAR ?auto_1284 ) ( IS-CRATE ?auto_1285 ) ( not ( = ?auto_1284 ?auto_1285 ) ) ( AVAILABLE ?auto_1286 ) ( ON ?auto_1284 ?auto_1283 ) ( not ( = ?auto_1283 ?auto_1284 ) ) ( not ( = ?auto_1283 ?auto_1285 ) ) ( TRUCK-AT ?auto_1289 ?auto_1287 ) ( not ( = ?auto_1287 ?auto_1288 ) ) ( HOIST-AT ?auto_1290 ?auto_1287 ) ( LIFTING ?auto_1290 ?auto_1285 ) ( not ( = ?auto_1286 ?auto_1290 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1284 ?auto_1285 )
      ( MAKE-2CRATE-VERIFY ?auto_1283 ?auto_1284 ?auto_1285 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1291 - SURFACE
      ?auto_1292 - SURFACE
    )
    :vars
    (
      ?auto_1297 - HOIST
      ?auto_1296 - PLACE
      ?auto_1295 - SURFACE
      ?auto_1294 - TRUCK
      ?auto_1298 - PLACE
      ?auto_1293 - HOIST
      ?auto_1299 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1297 ?auto_1296 ) ( SURFACE-AT ?auto_1291 ?auto_1296 ) ( CLEAR ?auto_1291 ) ( IS-CRATE ?auto_1292 ) ( not ( = ?auto_1291 ?auto_1292 ) ) ( AVAILABLE ?auto_1297 ) ( ON ?auto_1291 ?auto_1295 ) ( not ( = ?auto_1295 ?auto_1291 ) ) ( not ( = ?auto_1295 ?auto_1292 ) ) ( TRUCK-AT ?auto_1294 ?auto_1298 ) ( not ( = ?auto_1298 ?auto_1296 ) ) ( HOIST-AT ?auto_1293 ?auto_1298 ) ( not ( = ?auto_1297 ?auto_1293 ) ) ( AVAILABLE ?auto_1293 ) ( SURFACE-AT ?auto_1292 ?auto_1298 ) ( ON ?auto_1292 ?auto_1299 ) ( CLEAR ?auto_1292 ) ( not ( = ?auto_1291 ?auto_1299 ) ) ( not ( = ?auto_1292 ?auto_1299 ) ) ( not ( = ?auto_1295 ?auto_1299 ) ) )
    :subtasks
    ( ( !LIFT ?auto_1293 ?auto_1292 ?auto_1299 ?auto_1298 )
      ( MAKE-2CRATE ?auto_1295 ?auto_1291 ?auto_1292 )
      ( MAKE-1CRATE-VERIFY ?auto_1291 ?auto_1292 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1300 - SURFACE
      ?auto_1301 - SURFACE
      ?auto_1302 - SURFACE
    )
    :vars
    (
      ?auto_1305 - HOIST
      ?auto_1308 - PLACE
      ?auto_1306 - TRUCK
      ?auto_1304 - PLACE
      ?auto_1307 - HOIST
      ?auto_1303 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1305 ?auto_1308 ) ( SURFACE-AT ?auto_1301 ?auto_1308 ) ( CLEAR ?auto_1301 ) ( IS-CRATE ?auto_1302 ) ( not ( = ?auto_1301 ?auto_1302 ) ) ( AVAILABLE ?auto_1305 ) ( ON ?auto_1301 ?auto_1300 ) ( not ( = ?auto_1300 ?auto_1301 ) ) ( not ( = ?auto_1300 ?auto_1302 ) ) ( TRUCK-AT ?auto_1306 ?auto_1304 ) ( not ( = ?auto_1304 ?auto_1308 ) ) ( HOIST-AT ?auto_1307 ?auto_1304 ) ( not ( = ?auto_1305 ?auto_1307 ) ) ( AVAILABLE ?auto_1307 ) ( SURFACE-AT ?auto_1302 ?auto_1304 ) ( ON ?auto_1302 ?auto_1303 ) ( CLEAR ?auto_1302 ) ( not ( = ?auto_1301 ?auto_1303 ) ) ( not ( = ?auto_1302 ?auto_1303 ) ) ( not ( = ?auto_1300 ?auto_1303 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1301 ?auto_1302 )
      ( MAKE-2CRATE-VERIFY ?auto_1300 ?auto_1301 ?auto_1302 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1309 - SURFACE
      ?auto_1310 - SURFACE
    )
    :vars
    (
      ?auto_1314 - HOIST
      ?auto_1317 - PLACE
      ?auto_1313 - SURFACE
      ?auto_1312 - PLACE
      ?auto_1315 - HOIST
      ?auto_1311 - SURFACE
      ?auto_1316 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1314 ?auto_1317 ) ( SURFACE-AT ?auto_1309 ?auto_1317 ) ( CLEAR ?auto_1309 ) ( IS-CRATE ?auto_1310 ) ( not ( = ?auto_1309 ?auto_1310 ) ) ( AVAILABLE ?auto_1314 ) ( ON ?auto_1309 ?auto_1313 ) ( not ( = ?auto_1313 ?auto_1309 ) ) ( not ( = ?auto_1313 ?auto_1310 ) ) ( not ( = ?auto_1312 ?auto_1317 ) ) ( HOIST-AT ?auto_1315 ?auto_1312 ) ( not ( = ?auto_1314 ?auto_1315 ) ) ( AVAILABLE ?auto_1315 ) ( SURFACE-AT ?auto_1310 ?auto_1312 ) ( ON ?auto_1310 ?auto_1311 ) ( CLEAR ?auto_1310 ) ( not ( = ?auto_1309 ?auto_1311 ) ) ( not ( = ?auto_1310 ?auto_1311 ) ) ( not ( = ?auto_1313 ?auto_1311 ) ) ( TRUCK-AT ?auto_1316 ?auto_1317 ) )
    :subtasks
    ( ( !DRIVE ?auto_1316 ?auto_1317 ?auto_1312 )
      ( MAKE-2CRATE ?auto_1313 ?auto_1309 ?auto_1310 )
      ( MAKE-1CRATE-VERIFY ?auto_1309 ?auto_1310 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1318 - SURFACE
      ?auto_1319 - SURFACE
      ?auto_1320 - SURFACE
    )
    :vars
    (
      ?auto_1321 - HOIST
      ?auto_1323 - PLACE
      ?auto_1322 - PLACE
      ?auto_1324 - HOIST
      ?auto_1325 - SURFACE
      ?auto_1326 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1321 ?auto_1323 ) ( SURFACE-AT ?auto_1319 ?auto_1323 ) ( CLEAR ?auto_1319 ) ( IS-CRATE ?auto_1320 ) ( not ( = ?auto_1319 ?auto_1320 ) ) ( AVAILABLE ?auto_1321 ) ( ON ?auto_1319 ?auto_1318 ) ( not ( = ?auto_1318 ?auto_1319 ) ) ( not ( = ?auto_1318 ?auto_1320 ) ) ( not ( = ?auto_1322 ?auto_1323 ) ) ( HOIST-AT ?auto_1324 ?auto_1322 ) ( not ( = ?auto_1321 ?auto_1324 ) ) ( AVAILABLE ?auto_1324 ) ( SURFACE-AT ?auto_1320 ?auto_1322 ) ( ON ?auto_1320 ?auto_1325 ) ( CLEAR ?auto_1320 ) ( not ( = ?auto_1319 ?auto_1325 ) ) ( not ( = ?auto_1320 ?auto_1325 ) ) ( not ( = ?auto_1318 ?auto_1325 ) ) ( TRUCK-AT ?auto_1326 ?auto_1323 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1319 ?auto_1320 )
      ( MAKE-2CRATE-VERIFY ?auto_1318 ?auto_1319 ?auto_1320 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1327 - SURFACE
      ?auto_1328 - SURFACE
    )
    :vars
    (
      ?auto_1334 - HOIST
      ?auto_1332 - PLACE
      ?auto_1331 - SURFACE
      ?auto_1333 - PLACE
      ?auto_1329 - HOIST
      ?auto_1330 - SURFACE
      ?auto_1335 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1334 ?auto_1332 ) ( IS-CRATE ?auto_1328 ) ( not ( = ?auto_1327 ?auto_1328 ) ) ( not ( = ?auto_1331 ?auto_1327 ) ) ( not ( = ?auto_1331 ?auto_1328 ) ) ( not ( = ?auto_1333 ?auto_1332 ) ) ( HOIST-AT ?auto_1329 ?auto_1333 ) ( not ( = ?auto_1334 ?auto_1329 ) ) ( AVAILABLE ?auto_1329 ) ( SURFACE-AT ?auto_1328 ?auto_1333 ) ( ON ?auto_1328 ?auto_1330 ) ( CLEAR ?auto_1328 ) ( not ( = ?auto_1327 ?auto_1330 ) ) ( not ( = ?auto_1328 ?auto_1330 ) ) ( not ( = ?auto_1331 ?auto_1330 ) ) ( TRUCK-AT ?auto_1335 ?auto_1332 ) ( SURFACE-AT ?auto_1331 ?auto_1332 ) ( CLEAR ?auto_1331 ) ( LIFTING ?auto_1334 ?auto_1327 ) ( IS-CRATE ?auto_1327 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1331 ?auto_1327 )
      ( MAKE-2CRATE ?auto_1331 ?auto_1327 ?auto_1328 )
      ( MAKE-1CRATE-VERIFY ?auto_1327 ?auto_1328 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1336 - SURFACE
      ?auto_1337 - SURFACE
      ?auto_1338 - SURFACE
    )
    :vars
    (
      ?auto_1340 - HOIST
      ?auto_1343 - PLACE
      ?auto_1342 - PLACE
      ?auto_1344 - HOIST
      ?auto_1341 - SURFACE
      ?auto_1339 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1340 ?auto_1343 ) ( IS-CRATE ?auto_1338 ) ( not ( = ?auto_1337 ?auto_1338 ) ) ( not ( = ?auto_1336 ?auto_1337 ) ) ( not ( = ?auto_1336 ?auto_1338 ) ) ( not ( = ?auto_1342 ?auto_1343 ) ) ( HOIST-AT ?auto_1344 ?auto_1342 ) ( not ( = ?auto_1340 ?auto_1344 ) ) ( AVAILABLE ?auto_1344 ) ( SURFACE-AT ?auto_1338 ?auto_1342 ) ( ON ?auto_1338 ?auto_1341 ) ( CLEAR ?auto_1338 ) ( not ( = ?auto_1337 ?auto_1341 ) ) ( not ( = ?auto_1338 ?auto_1341 ) ) ( not ( = ?auto_1336 ?auto_1341 ) ) ( TRUCK-AT ?auto_1339 ?auto_1343 ) ( SURFACE-AT ?auto_1336 ?auto_1343 ) ( CLEAR ?auto_1336 ) ( LIFTING ?auto_1340 ?auto_1337 ) ( IS-CRATE ?auto_1337 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1337 ?auto_1338 )
      ( MAKE-2CRATE-VERIFY ?auto_1336 ?auto_1337 ?auto_1338 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1345 - SURFACE
      ?auto_1346 - SURFACE
    )
    :vars
    (
      ?auto_1347 - HOIST
      ?auto_1352 - PLACE
      ?auto_1353 - SURFACE
      ?auto_1350 - PLACE
      ?auto_1349 - HOIST
      ?auto_1348 - SURFACE
      ?auto_1351 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1347 ?auto_1352 ) ( IS-CRATE ?auto_1346 ) ( not ( = ?auto_1345 ?auto_1346 ) ) ( not ( = ?auto_1353 ?auto_1345 ) ) ( not ( = ?auto_1353 ?auto_1346 ) ) ( not ( = ?auto_1350 ?auto_1352 ) ) ( HOIST-AT ?auto_1349 ?auto_1350 ) ( not ( = ?auto_1347 ?auto_1349 ) ) ( AVAILABLE ?auto_1349 ) ( SURFACE-AT ?auto_1346 ?auto_1350 ) ( ON ?auto_1346 ?auto_1348 ) ( CLEAR ?auto_1346 ) ( not ( = ?auto_1345 ?auto_1348 ) ) ( not ( = ?auto_1346 ?auto_1348 ) ) ( not ( = ?auto_1353 ?auto_1348 ) ) ( TRUCK-AT ?auto_1351 ?auto_1352 ) ( SURFACE-AT ?auto_1353 ?auto_1352 ) ( CLEAR ?auto_1353 ) ( IS-CRATE ?auto_1345 ) ( AVAILABLE ?auto_1347 ) ( IN ?auto_1345 ?auto_1351 ) )
    :subtasks
    ( ( !UNLOAD ?auto_1347 ?auto_1345 ?auto_1351 ?auto_1352 )
      ( MAKE-2CRATE ?auto_1353 ?auto_1345 ?auto_1346 )
      ( MAKE-1CRATE-VERIFY ?auto_1345 ?auto_1346 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1354 - SURFACE
      ?auto_1355 - SURFACE
      ?auto_1356 - SURFACE
    )
    :vars
    (
      ?auto_1358 - HOIST
      ?auto_1357 - PLACE
      ?auto_1362 - PLACE
      ?auto_1361 - HOIST
      ?auto_1359 - SURFACE
      ?auto_1360 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1358 ?auto_1357 ) ( IS-CRATE ?auto_1356 ) ( not ( = ?auto_1355 ?auto_1356 ) ) ( not ( = ?auto_1354 ?auto_1355 ) ) ( not ( = ?auto_1354 ?auto_1356 ) ) ( not ( = ?auto_1362 ?auto_1357 ) ) ( HOIST-AT ?auto_1361 ?auto_1362 ) ( not ( = ?auto_1358 ?auto_1361 ) ) ( AVAILABLE ?auto_1361 ) ( SURFACE-AT ?auto_1356 ?auto_1362 ) ( ON ?auto_1356 ?auto_1359 ) ( CLEAR ?auto_1356 ) ( not ( = ?auto_1355 ?auto_1359 ) ) ( not ( = ?auto_1356 ?auto_1359 ) ) ( not ( = ?auto_1354 ?auto_1359 ) ) ( TRUCK-AT ?auto_1360 ?auto_1357 ) ( SURFACE-AT ?auto_1354 ?auto_1357 ) ( CLEAR ?auto_1354 ) ( IS-CRATE ?auto_1355 ) ( AVAILABLE ?auto_1358 ) ( IN ?auto_1355 ?auto_1360 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1355 ?auto_1356 )
      ( MAKE-2CRATE-VERIFY ?auto_1354 ?auto_1355 ?auto_1356 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1399 - SURFACE
      ?auto_1400 - SURFACE
    )
    :vars
    (
      ?auto_1404 - HOIST
      ?auto_1402 - PLACE
      ?auto_1401 - SURFACE
      ?auto_1403 - PLACE
      ?auto_1406 - HOIST
      ?auto_1407 - SURFACE
      ?auto_1405 - TRUCK
      ?auto_1408 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1404 ?auto_1402 ) ( SURFACE-AT ?auto_1399 ?auto_1402 ) ( CLEAR ?auto_1399 ) ( IS-CRATE ?auto_1400 ) ( not ( = ?auto_1399 ?auto_1400 ) ) ( AVAILABLE ?auto_1404 ) ( ON ?auto_1399 ?auto_1401 ) ( not ( = ?auto_1401 ?auto_1399 ) ) ( not ( = ?auto_1401 ?auto_1400 ) ) ( not ( = ?auto_1403 ?auto_1402 ) ) ( HOIST-AT ?auto_1406 ?auto_1403 ) ( not ( = ?auto_1404 ?auto_1406 ) ) ( AVAILABLE ?auto_1406 ) ( SURFACE-AT ?auto_1400 ?auto_1403 ) ( ON ?auto_1400 ?auto_1407 ) ( CLEAR ?auto_1400 ) ( not ( = ?auto_1399 ?auto_1407 ) ) ( not ( = ?auto_1400 ?auto_1407 ) ) ( not ( = ?auto_1401 ?auto_1407 ) ) ( TRUCK-AT ?auto_1405 ?auto_1408 ) ( not ( = ?auto_1408 ?auto_1402 ) ) ( not ( = ?auto_1403 ?auto_1408 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1405 ?auto_1408 ?auto_1402 )
      ( MAKE-1CRATE ?auto_1399 ?auto_1400 )
      ( MAKE-1CRATE-VERIFY ?auto_1399 ?auto_1400 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1438 - SURFACE
      ?auto_1439 - SURFACE
      ?auto_1440 - SURFACE
      ?auto_1441 - SURFACE
    )
    :vars
    (
      ?auto_1442 - HOIST
      ?auto_1443 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1442 ?auto_1443 ) ( SURFACE-AT ?auto_1440 ?auto_1443 ) ( CLEAR ?auto_1440 ) ( LIFTING ?auto_1442 ?auto_1441 ) ( IS-CRATE ?auto_1441 ) ( not ( = ?auto_1440 ?auto_1441 ) ) ( ON ?auto_1439 ?auto_1438 ) ( ON ?auto_1440 ?auto_1439 ) ( not ( = ?auto_1438 ?auto_1439 ) ) ( not ( = ?auto_1438 ?auto_1440 ) ) ( not ( = ?auto_1438 ?auto_1441 ) ) ( not ( = ?auto_1439 ?auto_1440 ) ) ( not ( = ?auto_1439 ?auto_1441 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1440 ?auto_1441 )
      ( MAKE-3CRATE-VERIFY ?auto_1438 ?auto_1439 ?auto_1440 ?auto_1441 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1455 - SURFACE
      ?auto_1456 - SURFACE
      ?auto_1457 - SURFACE
      ?auto_1458 - SURFACE
    )
    :vars
    (
      ?auto_1460 - HOIST
      ?auto_1459 - PLACE
      ?auto_1461 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1460 ?auto_1459 ) ( SURFACE-AT ?auto_1457 ?auto_1459 ) ( CLEAR ?auto_1457 ) ( IS-CRATE ?auto_1458 ) ( not ( = ?auto_1457 ?auto_1458 ) ) ( TRUCK-AT ?auto_1461 ?auto_1459 ) ( AVAILABLE ?auto_1460 ) ( IN ?auto_1458 ?auto_1461 ) ( ON ?auto_1457 ?auto_1456 ) ( not ( = ?auto_1456 ?auto_1457 ) ) ( not ( = ?auto_1456 ?auto_1458 ) ) ( ON ?auto_1456 ?auto_1455 ) ( not ( = ?auto_1455 ?auto_1456 ) ) ( not ( = ?auto_1455 ?auto_1457 ) ) ( not ( = ?auto_1455 ?auto_1458 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1456 ?auto_1457 ?auto_1458 )
      ( MAKE-3CRATE-VERIFY ?auto_1455 ?auto_1456 ?auto_1457 ?auto_1458 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1476 - SURFACE
      ?auto_1477 - SURFACE
      ?auto_1478 - SURFACE
      ?auto_1479 - SURFACE
    )
    :vars
    (
      ?auto_1480 - HOIST
      ?auto_1481 - PLACE
      ?auto_1483 - TRUCK
      ?auto_1482 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1480 ?auto_1481 ) ( SURFACE-AT ?auto_1478 ?auto_1481 ) ( CLEAR ?auto_1478 ) ( IS-CRATE ?auto_1479 ) ( not ( = ?auto_1478 ?auto_1479 ) ) ( AVAILABLE ?auto_1480 ) ( IN ?auto_1479 ?auto_1483 ) ( ON ?auto_1478 ?auto_1477 ) ( not ( = ?auto_1477 ?auto_1478 ) ) ( not ( = ?auto_1477 ?auto_1479 ) ) ( TRUCK-AT ?auto_1483 ?auto_1482 ) ( not ( = ?auto_1482 ?auto_1481 ) ) ( ON ?auto_1477 ?auto_1476 ) ( not ( = ?auto_1476 ?auto_1477 ) ) ( not ( = ?auto_1476 ?auto_1478 ) ) ( not ( = ?auto_1476 ?auto_1479 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1477 ?auto_1478 ?auto_1479 )
      ( MAKE-3CRATE-VERIFY ?auto_1476 ?auto_1477 ?auto_1478 ?auto_1479 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1500 - SURFACE
      ?auto_1501 - SURFACE
      ?auto_1502 - SURFACE
      ?auto_1503 - SURFACE
    )
    :vars
    (
      ?auto_1505 - HOIST
      ?auto_1504 - PLACE
      ?auto_1506 - TRUCK
      ?auto_1508 - PLACE
      ?auto_1507 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1505 ?auto_1504 ) ( SURFACE-AT ?auto_1502 ?auto_1504 ) ( CLEAR ?auto_1502 ) ( IS-CRATE ?auto_1503 ) ( not ( = ?auto_1502 ?auto_1503 ) ) ( AVAILABLE ?auto_1505 ) ( ON ?auto_1502 ?auto_1501 ) ( not ( = ?auto_1501 ?auto_1502 ) ) ( not ( = ?auto_1501 ?auto_1503 ) ) ( TRUCK-AT ?auto_1506 ?auto_1508 ) ( not ( = ?auto_1508 ?auto_1504 ) ) ( HOIST-AT ?auto_1507 ?auto_1508 ) ( LIFTING ?auto_1507 ?auto_1503 ) ( not ( = ?auto_1505 ?auto_1507 ) ) ( ON ?auto_1501 ?auto_1500 ) ( not ( = ?auto_1500 ?auto_1501 ) ) ( not ( = ?auto_1500 ?auto_1502 ) ) ( not ( = ?auto_1500 ?auto_1503 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1501 ?auto_1502 ?auto_1503 )
      ( MAKE-3CRATE-VERIFY ?auto_1500 ?auto_1501 ?auto_1502 ?auto_1503 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1527 - SURFACE
      ?auto_1528 - SURFACE
      ?auto_1529 - SURFACE
      ?auto_1530 - SURFACE
    )
    :vars
    (
      ?auto_1534 - HOIST
      ?auto_1532 - PLACE
      ?auto_1533 - TRUCK
      ?auto_1536 - PLACE
      ?auto_1535 - HOIST
      ?auto_1531 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1534 ?auto_1532 ) ( SURFACE-AT ?auto_1529 ?auto_1532 ) ( CLEAR ?auto_1529 ) ( IS-CRATE ?auto_1530 ) ( not ( = ?auto_1529 ?auto_1530 ) ) ( AVAILABLE ?auto_1534 ) ( ON ?auto_1529 ?auto_1528 ) ( not ( = ?auto_1528 ?auto_1529 ) ) ( not ( = ?auto_1528 ?auto_1530 ) ) ( TRUCK-AT ?auto_1533 ?auto_1536 ) ( not ( = ?auto_1536 ?auto_1532 ) ) ( HOIST-AT ?auto_1535 ?auto_1536 ) ( not ( = ?auto_1534 ?auto_1535 ) ) ( AVAILABLE ?auto_1535 ) ( SURFACE-AT ?auto_1530 ?auto_1536 ) ( ON ?auto_1530 ?auto_1531 ) ( CLEAR ?auto_1530 ) ( not ( = ?auto_1529 ?auto_1531 ) ) ( not ( = ?auto_1530 ?auto_1531 ) ) ( not ( = ?auto_1528 ?auto_1531 ) ) ( ON ?auto_1528 ?auto_1527 ) ( not ( = ?auto_1527 ?auto_1528 ) ) ( not ( = ?auto_1527 ?auto_1529 ) ) ( not ( = ?auto_1527 ?auto_1530 ) ) ( not ( = ?auto_1527 ?auto_1531 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1528 ?auto_1529 ?auto_1530 )
      ( MAKE-3CRATE-VERIFY ?auto_1527 ?auto_1528 ?auto_1529 ?auto_1530 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1555 - SURFACE
      ?auto_1556 - SURFACE
      ?auto_1557 - SURFACE
      ?auto_1558 - SURFACE
    )
    :vars
    (
      ?auto_1560 - HOIST
      ?auto_1561 - PLACE
      ?auto_1563 - PLACE
      ?auto_1559 - HOIST
      ?auto_1562 - SURFACE
      ?auto_1564 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1560 ?auto_1561 ) ( SURFACE-AT ?auto_1557 ?auto_1561 ) ( CLEAR ?auto_1557 ) ( IS-CRATE ?auto_1558 ) ( not ( = ?auto_1557 ?auto_1558 ) ) ( AVAILABLE ?auto_1560 ) ( ON ?auto_1557 ?auto_1556 ) ( not ( = ?auto_1556 ?auto_1557 ) ) ( not ( = ?auto_1556 ?auto_1558 ) ) ( not ( = ?auto_1563 ?auto_1561 ) ) ( HOIST-AT ?auto_1559 ?auto_1563 ) ( not ( = ?auto_1560 ?auto_1559 ) ) ( AVAILABLE ?auto_1559 ) ( SURFACE-AT ?auto_1558 ?auto_1563 ) ( ON ?auto_1558 ?auto_1562 ) ( CLEAR ?auto_1558 ) ( not ( = ?auto_1557 ?auto_1562 ) ) ( not ( = ?auto_1558 ?auto_1562 ) ) ( not ( = ?auto_1556 ?auto_1562 ) ) ( TRUCK-AT ?auto_1564 ?auto_1561 ) ( ON ?auto_1556 ?auto_1555 ) ( not ( = ?auto_1555 ?auto_1556 ) ) ( not ( = ?auto_1555 ?auto_1557 ) ) ( not ( = ?auto_1555 ?auto_1558 ) ) ( not ( = ?auto_1555 ?auto_1562 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1556 ?auto_1557 ?auto_1558 )
      ( MAKE-3CRATE-VERIFY ?auto_1555 ?auto_1556 ?auto_1557 ?auto_1558 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1583 - SURFACE
      ?auto_1584 - SURFACE
      ?auto_1585 - SURFACE
      ?auto_1586 - SURFACE
    )
    :vars
    (
      ?auto_1589 - HOIST
      ?auto_1587 - PLACE
      ?auto_1592 - PLACE
      ?auto_1588 - HOIST
      ?auto_1590 - SURFACE
      ?auto_1591 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1589 ?auto_1587 ) ( IS-CRATE ?auto_1586 ) ( not ( = ?auto_1585 ?auto_1586 ) ) ( not ( = ?auto_1584 ?auto_1585 ) ) ( not ( = ?auto_1584 ?auto_1586 ) ) ( not ( = ?auto_1592 ?auto_1587 ) ) ( HOIST-AT ?auto_1588 ?auto_1592 ) ( not ( = ?auto_1589 ?auto_1588 ) ) ( AVAILABLE ?auto_1588 ) ( SURFACE-AT ?auto_1586 ?auto_1592 ) ( ON ?auto_1586 ?auto_1590 ) ( CLEAR ?auto_1586 ) ( not ( = ?auto_1585 ?auto_1590 ) ) ( not ( = ?auto_1586 ?auto_1590 ) ) ( not ( = ?auto_1584 ?auto_1590 ) ) ( TRUCK-AT ?auto_1591 ?auto_1587 ) ( SURFACE-AT ?auto_1584 ?auto_1587 ) ( CLEAR ?auto_1584 ) ( LIFTING ?auto_1589 ?auto_1585 ) ( IS-CRATE ?auto_1585 ) ( ON ?auto_1584 ?auto_1583 ) ( not ( = ?auto_1583 ?auto_1584 ) ) ( not ( = ?auto_1583 ?auto_1585 ) ) ( not ( = ?auto_1583 ?auto_1586 ) ) ( not ( = ?auto_1583 ?auto_1590 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1584 ?auto_1585 ?auto_1586 )
      ( MAKE-3CRATE-VERIFY ?auto_1583 ?auto_1584 ?auto_1585 ?auto_1586 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1611 - SURFACE
      ?auto_1612 - SURFACE
      ?auto_1613 - SURFACE
      ?auto_1614 - SURFACE
    )
    :vars
    (
      ?auto_1616 - HOIST
      ?auto_1619 - PLACE
      ?auto_1618 - PLACE
      ?auto_1615 - HOIST
      ?auto_1620 - SURFACE
      ?auto_1617 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1616 ?auto_1619 ) ( IS-CRATE ?auto_1614 ) ( not ( = ?auto_1613 ?auto_1614 ) ) ( not ( = ?auto_1612 ?auto_1613 ) ) ( not ( = ?auto_1612 ?auto_1614 ) ) ( not ( = ?auto_1618 ?auto_1619 ) ) ( HOIST-AT ?auto_1615 ?auto_1618 ) ( not ( = ?auto_1616 ?auto_1615 ) ) ( AVAILABLE ?auto_1615 ) ( SURFACE-AT ?auto_1614 ?auto_1618 ) ( ON ?auto_1614 ?auto_1620 ) ( CLEAR ?auto_1614 ) ( not ( = ?auto_1613 ?auto_1620 ) ) ( not ( = ?auto_1614 ?auto_1620 ) ) ( not ( = ?auto_1612 ?auto_1620 ) ) ( TRUCK-AT ?auto_1617 ?auto_1619 ) ( SURFACE-AT ?auto_1612 ?auto_1619 ) ( CLEAR ?auto_1612 ) ( IS-CRATE ?auto_1613 ) ( AVAILABLE ?auto_1616 ) ( IN ?auto_1613 ?auto_1617 ) ( ON ?auto_1612 ?auto_1611 ) ( not ( = ?auto_1611 ?auto_1612 ) ) ( not ( = ?auto_1611 ?auto_1613 ) ) ( not ( = ?auto_1611 ?auto_1614 ) ) ( not ( = ?auto_1611 ?auto_1620 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1612 ?auto_1613 ?auto_1614 )
      ( MAKE-3CRATE-VERIFY ?auto_1611 ?auto_1612 ?auto_1613 ?auto_1614 ) )
  )

)

