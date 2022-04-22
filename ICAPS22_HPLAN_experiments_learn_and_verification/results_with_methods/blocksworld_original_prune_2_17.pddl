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
      ?auto_1260 - BLOCK
      ?auto_1261 - BLOCK
    )
    :vars
    (
      ?auto_1262 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1262 ?auto_1261 ) ( CLEAR ?auto_1262 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_1260 ) ( ON ?auto_1261 ?auto_1260 ) ( not ( = ?auto_1260 ?auto_1261 ) ) ( not ( = ?auto_1260 ?auto_1262 ) ) ( not ( = ?auto_1261 ?auto_1262 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_1262 ?auto_1261 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_1264 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_1264 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_1264 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_1265 - BLOCK
    )
    :vars
    (
      ?auto_1266 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1265 ?auto_1266 ) ( CLEAR ?auto_1265 ) ( HAND-EMPTY ) ( not ( = ?auto_1265 ?auto_1266 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_1265 ?auto_1266 )
      ( MAKE-1PILE ?auto_1265 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_1268 - BLOCK
    )
    :vars
    (
      ?auto_1269 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1269 ?auto_1268 ) ( CLEAR ?auto_1269 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_1268 ) ( not ( = ?auto_1268 ?auto_1269 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_1269 ?auto_1268 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_1270 - BLOCK
    )
    :vars
    (
      ?auto_1271 - BLOCK
      ?auto_1272 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1271 ?auto_1270 ) ( CLEAR ?auto_1271 ) ( ON-TABLE ?auto_1270 ) ( not ( = ?auto_1270 ?auto_1271 ) ) ( HOLDING ?auto_1272 ) ( not ( = ?auto_1270 ?auto_1272 ) ) ( not ( = ?auto_1271 ?auto_1272 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_1272 )
      ( MAKE-1PILE ?auto_1270 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_1273 - BLOCK
    )
    :vars
    (
      ?auto_1275 - BLOCK
      ?auto_1274 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1275 ?auto_1273 ) ( ON-TABLE ?auto_1273 ) ( not ( = ?auto_1273 ?auto_1275 ) ) ( not ( = ?auto_1273 ?auto_1274 ) ) ( not ( = ?auto_1275 ?auto_1274 ) ) ( ON ?auto_1274 ?auto_1275 ) ( CLEAR ?auto_1274 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_1273 ?auto_1275 )
      ( MAKE-1PILE ?auto_1273 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1278 - BLOCK
      ?auto_1279 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_1279 ) ( CLEAR ?auto_1278 ) ( ON-TABLE ?auto_1278 ) ( not ( = ?auto_1278 ?auto_1279 ) ) )
    :subtasks
    ( ( !STACK ?auto_1279 ?auto_1278 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1280 - BLOCK
      ?auto_1281 - BLOCK
    )
    :vars
    (
      ?auto_1282 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_1280 ) ( ON-TABLE ?auto_1280 ) ( not ( = ?auto_1280 ?auto_1281 ) ) ( ON ?auto_1281 ?auto_1282 ) ( CLEAR ?auto_1281 ) ( HAND-EMPTY ) ( not ( = ?auto_1280 ?auto_1282 ) ) ( not ( = ?auto_1281 ?auto_1282 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_1281 ?auto_1282 )
      ( MAKE-2PILE ?auto_1280 ?auto_1281 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1283 - BLOCK
      ?auto_1284 - BLOCK
    )
    :vars
    (
      ?auto_1285 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1283 ?auto_1284 ) ) ( ON ?auto_1284 ?auto_1285 ) ( CLEAR ?auto_1284 ) ( not ( = ?auto_1283 ?auto_1285 ) ) ( not ( = ?auto_1284 ?auto_1285 ) ) ( HOLDING ?auto_1283 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_1283 )
      ( MAKE-2PILE ?auto_1283 ?auto_1284 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1286 - BLOCK
      ?auto_1287 - BLOCK
    )
    :vars
    (
      ?auto_1288 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1286 ?auto_1287 ) ) ( ON ?auto_1287 ?auto_1288 ) ( not ( = ?auto_1286 ?auto_1288 ) ) ( not ( = ?auto_1287 ?auto_1288 ) ) ( ON ?auto_1286 ?auto_1287 ) ( CLEAR ?auto_1286 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_1288 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_1288 ?auto_1287 )
      ( MAKE-2PILE ?auto_1286 ?auto_1287 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_1305 - BLOCK
    )
    :vars
    (
      ?auto_1306 - BLOCK
      ?auto_1307 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1305 ?auto_1306 ) ( CLEAR ?auto_1305 ) ( not ( = ?auto_1305 ?auto_1306 ) ) ( HOLDING ?auto_1307 ) ( not ( = ?auto_1305 ?auto_1307 ) ) ( not ( = ?auto_1306 ?auto_1307 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_1307 )
      ( MAKE-1PILE ?auto_1305 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_1308 - BLOCK
    )
    :vars
    (
      ?auto_1310 - BLOCK
      ?auto_1309 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1308 ?auto_1310 ) ( not ( = ?auto_1308 ?auto_1310 ) ) ( not ( = ?auto_1308 ?auto_1309 ) ) ( not ( = ?auto_1310 ?auto_1309 ) ) ( ON ?auto_1309 ?auto_1308 ) ( CLEAR ?auto_1309 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_1310 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_1310 ?auto_1308 )
      ( MAKE-1PILE ?auto_1308 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1315 - BLOCK
      ?auto_1316 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_1315 ) ( ON-TABLE ?auto_1315 ) ( not ( = ?auto_1315 ?auto_1316 ) ) ( ON-TABLE ?auto_1316 ) ( CLEAR ?auto_1316 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_1316 )
      ( MAKE-2PILE ?auto_1315 ?auto_1316 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1317 - BLOCK
      ?auto_1318 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1317 ?auto_1318 ) ) ( ON-TABLE ?auto_1318 ) ( CLEAR ?auto_1318 ) ( HOLDING ?auto_1317 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_1317 )
      ( MAKE-2PILE ?auto_1317 ?auto_1318 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1319 - BLOCK
      ?auto_1320 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1319 ?auto_1320 ) ) ( ON-TABLE ?auto_1320 ) ( ON ?auto_1319 ?auto_1320 ) ( CLEAR ?auto_1319 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_1320 )
      ( MAKE-2PILE ?auto_1319 ?auto_1320 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1323 - BLOCK
      ?auto_1324 - BLOCK
    )
    :vars
    (
      ?auto_1325 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1323 ?auto_1324 ) ) ( ON-TABLE ?auto_1324 ) ( CLEAR ?auto_1324 ) ( ON ?auto_1323 ?auto_1325 ) ( CLEAR ?auto_1323 ) ( HAND-EMPTY ) ( not ( = ?auto_1323 ?auto_1325 ) ) ( not ( = ?auto_1324 ?auto_1325 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_1323 ?auto_1325 )
      ( MAKE-2PILE ?auto_1323 ?auto_1324 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1326 - BLOCK
      ?auto_1327 - BLOCK
    )
    :vars
    (
      ?auto_1328 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1326 ?auto_1327 ) ) ( ON ?auto_1326 ?auto_1328 ) ( CLEAR ?auto_1326 ) ( not ( = ?auto_1326 ?auto_1328 ) ) ( not ( = ?auto_1327 ?auto_1328 ) ) ( HOLDING ?auto_1327 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_1327 )
      ( MAKE-2PILE ?auto_1326 ?auto_1327 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1329 - BLOCK
      ?auto_1330 - BLOCK
    )
    :vars
    (
      ?auto_1331 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1329 ?auto_1330 ) ) ( ON ?auto_1329 ?auto_1331 ) ( not ( = ?auto_1329 ?auto_1331 ) ) ( not ( = ?auto_1330 ?auto_1331 ) ) ( ON ?auto_1330 ?auto_1329 ) ( CLEAR ?auto_1330 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_1331 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_1331 ?auto_1329 )
      ( MAKE-2PILE ?auto_1329 ?auto_1330 ) )
  )

)

