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
      ?auto_1217 - BLOCK
      ?auto_1218 - BLOCK
    )
    :vars
    (
      ?auto_1219 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1219 ?auto_1218 ) ( CLEAR ?auto_1219 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_1217 ) ( ON ?auto_1218 ?auto_1217 ) ( not ( = ?auto_1217 ?auto_1218 ) ) ( not ( = ?auto_1217 ?auto_1219 ) ) ( not ( = ?auto_1218 ?auto_1219 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_1219 ?auto_1218 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_1221 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_1221 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_1221 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_1222 - BLOCK
    )
    :vars
    (
      ?auto_1223 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1222 ?auto_1223 ) ( CLEAR ?auto_1222 ) ( HAND-EMPTY ) ( not ( = ?auto_1222 ?auto_1223 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_1222 ?auto_1223 )
      ( MAKE-1PILE ?auto_1222 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_1225 - BLOCK
    )
    :vars
    (
      ?auto_1226 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1226 ?auto_1225 ) ( CLEAR ?auto_1226 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_1225 ) ( not ( = ?auto_1225 ?auto_1226 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_1226 ?auto_1225 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_1227 - BLOCK
    )
    :vars
    (
      ?auto_1228 - BLOCK
      ?auto_1229 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1228 ?auto_1227 ) ( CLEAR ?auto_1228 ) ( ON-TABLE ?auto_1227 ) ( not ( = ?auto_1227 ?auto_1228 ) ) ( HOLDING ?auto_1229 ) ( not ( = ?auto_1227 ?auto_1229 ) ) ( not ( = ?auto_1228 ?auto_1229 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_1229 )
      ( MAKE-1PILE ?auto_1227 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_1230 - BLOCK
    )
    :vars
    (
      ?auto_1231 - BLOCK
      ?auto_1232 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1231 ?auto_1230 ) ( ON-TABLE ?auto_1230 ) ( not ( = ?auto_1230 ?auto_1231 ) ) ( not ( = ?auto_1230 ?auto_1232 ) ) ( not ( = ?auto_1231 ?auto_1232 ) ) ( ON ?auto_1232 ?auto_1231 ) ( CLEAR ?auto_1232 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_1230 ?auto_1231 )
      ( MAKE-1PILE ?auto_1230 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1235 - BLOCK
      ?auto_1236 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_1236 ) ( CLEAR ?auto_1235 ) ( ON-TABLE ?auto_1235 ) ( not ( = ?auto_1235 ?auto_1236 ) ) )
    :subtasks
    ( ( !STACK ?auto_1236 ?auto_1235 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1237 - BLOCK
      ?auto_1238 - BLOCK
    )
    :vars
    (
      ?auto_1239 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_1237 ) ( ON-TABLE ?auto_1237 ) ( not ( = ?auto_1237 ?auto_1238 ) ) ( ON ?auto_1238 ?auto_1239 ) ( CLEAR ?auto_1238 ) ( HAND-EMPTY ) ( not ( = ?auto_1237 ?auto_1239 ) ) ( not ( = ?auto_1238 ?auto_1239 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_1238 ?auto_1239 )
      ( MAKE-2PILE ?auto_1237 ?auto_1238 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1240 - BLOCK
      ?auto_1241 - BLOCK
    )
    :vars
    (
      ?auto_1242 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1240 ?auto_1241 ) ) ( ON ?auto_1241 ?auto_1242 ) ( CLEAR ?auto_1241 ) ( not ( = ?auto_1240 ?auto_1242 ) ) ( not ( = ?auto_1241 ?auto_1242 ) ) ( HOLDING ?auto_1240 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_1240 )
      ( MAKE-2PILE ?auto_1240 ?auto_1241 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1243 - BLOCK
      ?auto_1244 - BLOCK
    )
    :vars
    (
      ?auto_1245 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1243 ?auto_1244 ) ) ( ON ?auto_1244 ?auto_1245 ) ( not ( = ?auto_1243 ?auto_1245 ) ) ( not ( = ?auto_1244 ?auto_1245 ) ) ( ON ?auto_1243 ?auto_1244 ) ( CLEAR ?auto_1243 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_1245 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_1245 ?auto_1244 )
      ( MAKE-2PILE ?auto_1243 ?auto_1244 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_1247 - BLOCK
    )
    :vars
    (
      ?auto_1248 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1248 ?auto_1247 ) ( CLEAR ?auto_1248 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_1247 ) ( not ( = ?auto_1247 ?auto_1248 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_1248 ?auto_1247 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_1254 - BLOCK
    )
    :vars
    (
      ?auto_1255 - BLOCK
      ?auto_1256 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1254 ?auto_1255 ) ) ( ON ?auto_1255 ?auto_1256 ) ( CLEAR ?auto_1255 ) ( not ( = ?auto_1254 ?auto_1256 ) ) ( not ( = ?auto_1255 ?auto_1256 ) ) ( HOLDING ?auto_1254 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_1254 ?auto_1255 )
      ( MAKE-1PILE ?auto_1254 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_1257 - BLOCK
    )
    :vars
    (
      ?auto_1259 - BLOCK
      ?auto_1258 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1257 ?auto_1259 ) ) ( ON ?auto_1259 ?auto_1258 ) ( not ( = ?auto_1257 ?auto_1258 ) ) ( not ( = ?auto_1259 ?auto_1258 ) ) ( ON ?auto_1257 ?auto_1259 ) ( CLEAR ?auto_1257 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_1258 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_1258 ?auto_1259 )
      ( MAKE-1PILE ?auto_1257 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_1261 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_1261 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_1261 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_1262 - BLOCK
    )
    :vars
    (
      ?auto_1263 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1262 ?auto_1263 ) ( CLEAR ?auto_1262 ) ( HAND-EMPTY ) ( not ( = ?auto_1262 ?auto_1263 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_1262 ?auto_1263 )
      ( MAKE-1PILE ?auto_1262 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_1264 - BLOCK
    )
    :vars
    (
      ?auto_1265 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1264 ?auto_1265 ) ) ( HOLDING ?auto_1264 ) ( CLEAR ?auto_1265 ) ( ON-TABLE ?auto_1265 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_1265 ?auto_1264 )
      ( MAKE-1PILE ?auto_1264 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_1266 - BLOCK
    )
    :vars
    (
      ?auto_1267 - BLOCK
      ?auto_1268 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1266 ?auto_1267 ) ) ( CLEAR ?auto_1267 ) ( ON-TABLE ?auto_1267 ) ( ON ?auto_1266 ?auto_1268 ) ( CLEAR ?auto_1266 ) ( HAND-EMPTY ) ( not ( = ?auto_1266 ?auto_1268 ) ) ( not ( = ?auto_1267 ?auto_1268 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_1266 ?auto_1268 )
      ( MAKE-1PILE ?auto_1266 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_1269 - BLOCK
    )
    :vars
    (
      ?auto_1271 - BLOCK
      ?auto_1270 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1269 ?auto_1271 ) ) ( ON ?auto_1269 ?auto_1270 ) ( CLEAR ?auto_1269 ) ( not ( = ?auto_1269 ?auto_1270 ) ) ( not ( = ?auto_1271 ?auto_1270 ) ) ( HOLDING ?auto_1271 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_1271 )
      ( MAKE-1PILE ?auto_1269 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_1272 - BLOCK
    )
    :vars
    (
      ?auto_1274 - BLOCK
      ?auto_1273 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1272 ?auto_1274 ) ) ( ON ?auto_1272 ?auto_1273 ) ( not ( = ?auto_1272 ?auto_1273 ) ) ( not ( = ?auto_1274 ?auto_1273 ) ) ( ON ?auto_1274 ?auto_1272 ) ( CLEAR ?auto_1274 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_1273 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_1273 ?auto_1272 )
      ( MAKE-1PILE ?auto_1272 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1277 - BLOCK
      ?auto_1278 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_1278 ) ( CLEAR ?auto_1277 ) ( ON-TABLE ?auto_1277 ) ( not ( = ?auto_1277 ?auto_1278 ) ) )
    :subtasks
    ( ( !STACK ?auto_1278 ?auto_1277 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1279 - BLOCK
      ?auto_1280 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_1279 ) ( ON-TABLE ?auto_1279 ) ( not ( = ?auto_1279 ?auto_1280 ) ) ( ON-TABLE ?auto_1280 ) ( CLEAR ?auto_1280 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_1280 )
      ( MAKE-2PILE ?auto_1279 ?auto_1280 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1281 - BLOCK
      ?auto_1282 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1281 ?auto_1282 ) ) ( ON-TABLE ?auto_1282 ) ( CLEAR ?auto_1282 ) ( HOLDING ?auto_1281 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_1281 )
      ( MAKE-2PILE ?auto_1281 ?auto_1282 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1283 - BLOCK
      ?auto_1284 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1283 ?auto_1284 ) ) ( ON-TABLE ?auto_1284 ) ( ON ?auto_1283 ?auto_1284 ) ( CLEAR ?auto_1283 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_1284 )
      ( MAKE-2PILE ?auto_1283 ?auto_1284 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1285 - BLOCK
      ?auto_1286 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1285 ?auto_1286 ) ) ( ON-TABLE ?auto_1286 ) ( HOLDING ?auto_1285 ) ( CLEAR ?auto_1286 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_1286 ?auto_1285 )
      ( MAKE-2PILE ?auto_1285 ?auto_1286 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1287 - BLOCK
      ?auto_1288 - BLOCK
    )
    :vars
    (
      ?auto_1289 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1287 ?auto_1288 ) ) ( ON-TABLE ?auto_1288 ) ( CLEAR ?auto_1288 ) ( ON ?auto_1287 ?auto_1289 ) ( CLEAR ?auto_1287 ) ( HAND-EMPTY ) ( not ( = ?auto_1287 ?auto_1289 ) ) ( not ( = ?auto_1288 ?auto_1289 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_1287 ?auto_1289 )
      ( MAKE-2PILE ?auto_1287 ?auto_1288 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1290 - BLOCK
      ?auto_1291 - BLOCK
    )
    :vars
    (
      ?auto_1292 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1290 ?auto_1291 ) ) ( ON ?auto_1290 ?auto_1292 ) ( CLEAR ?auto_1290 ) ( not ( = ?auto_1290 ?auto_1292 ) ) ( not ( = ?auto_1291 ?auto_1292 ) ) ( HOLDING ?auto_1291 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_1291 )
      ( MAKE-2PILE ?auto_1290 ?auto_1291 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1293 - BLOCK
      ?auto_1294 - BLOCK
    )
    :vars
    (
      ?auto_1295 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1293 ?auto_1294 ) ) ( ON ?auto_1293 ?auto_1295 ) ( not ( = ?auto_1293 ?auto_1295 ) ) ( not ( = ?auto_1294 ?auto_1295 ) ) ( ON ?auto_1294 ?auto_1293 ) ( CLEAR ?auto_1294 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_1295 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_1295 ?auto_1293 )
      ( MAKE-2PILE ?auto_1293 ?auto_1294 ) )
  )

)

