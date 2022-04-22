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

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_1229 - BLOCK
    )
    :vars
    (
      ?auto_1230 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1229 ?auto_1230 ) ( CLEAR ?auto_1229 ) ( HAND-EMPTY ) ( not ( = ?auto_1229 ?auto_1230 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_1229 ?auto_1230 )
      ( !PUTDOWN ?auto_1229 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1236 - BLOCK
      ?auto_1237 - BLOCK
    )
    :vars
    (
      ?auto_1238 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_1236 ) ( ON ?auto_1237 ?auto_1238 ) ( CLEAR ?auto_1237 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_1236 ) ( not ( = ?auto_1236 ?auto_1237 ) ) ( not ( = ?auto_1236 ?auto_1238 ) ) ( not ( = ?auto_1237 ?auto_1238 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_1237 ?auto_1238 )
      ( !STACK ?auto_1237 ?auto_1236 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1246 - BLOCK
      ?auto_1247 - BLOCK
    )
    :vars
    (
      ?auto_1248 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1247 ?auto_1248 ) ( not ( = ?auto_1246 ?auto_1247 ) ) ( not ( = ?auto_1246 ?auto_1248 ) ) ( not ( = ?auto_1247 ?auto_1248 ) ) ( ON ?auto_1246 ?auto_1247 ) ( CLEAR ?auto_1246 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_1246 )
      ( MAKE-2PILE ?auto_1246 ?auto_1247 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_1257 - BLOCK
      ?auto_1258 - BLOCK
      ?auto_1259 - BLOCK
    )
    :vars
    (
      ?auto_1260 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_1258 ) ( ON ?auto_1259 ?auto_1260 ) ( CLEAR ?auto_1259 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_1257 ) ( ON ?auto_1258 ?auto_1257 ) ( not ( = ?auto_1257 ?auto_1258 ) ) ( not ( = ?auto_1257 ?auto_1259 ) ) ( not ( = ?auto_1257 ?auto_1260 ) ) ( not ( = ?auto_1258 ?auto_1259 ) ) ( not ( = ?auto_1258 ?auto_1260 ) ) ( not ( = ?auto_1259 ?auto_1260 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_1259 ?auto_1260 )
      ( !STACK ?auto_1259 ?auto_1258 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_1264 - BLOCK
      ?auto_1265 - BLOCK
      ?auto_1266 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_1265 ) ( ON-TABLE ?auto_1266 ) ( CLEAR ?auto_1266 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_1264 ) ( ON ?auto_1265 ?auto_1264 ) ( not ( = ?auto_1264 ?auto_1265 ) ) ( not ( = ?auto_1264 ?auto_1266 ) ) ( not ( = ?auto_1265 ?auto_1266 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_1266 )
      ( !STACK ?auto_1266 ?auto_1265 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_1270 - BLOCK
      ?auto_1271 - BLOCK
      ?auto_1272 - BLOCK
    )
    :vars
    (
      ?auto_1273 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1272 ?auto_1273 ) ( ON-TABLE ?auto_1270 ) ( not ( = ?auto_1270 ?auto_1271 ) ) ( not ( = ?auto_1270 ?auto_1272 ) ) ( not ( = ?auto_1270 ?auto_1273 ) ) ( not ( = ?auto_1271 ?auto_1272 ) ) ( not ( = ?auto_1271 ?auto_1273 ) ) ( not ( = ?auto_1272 ?auto_1273 ) ) ( CLEAR ?auto_1270 ) ( ON ?auto_1271 ?auto_1272 ) ( CLEAR ?auto_1271 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_1270 ?auto_1271 )
      ( MAKE-3PILE ?auto_1270 ?auto_1271 ?auto_1272 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_1277 - BLOCK
      ?auto_1278 - BLOCK
      ?auto_1279 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_1279 ) ( ON-TABLE ?auto_1277 ) ( not ( = ?auto_1277 ?auto_1278 ) ) ( not ( = ?auto_1277 ?auto_1279 ) ) ( not ( = ?auto_1278 ?auto_1279 ) ) ( CLEAR ?auto_1277 ) ( ON ?auto_1278 ?auto_1279 ) ( CLEAR ?auto_1278 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_1277 ?auto_1278 )
      ( MAKE-3PILE ?auto_1277 ?auto_1278 ?auto_1279 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_1283 - BLOCK
      ?auto_1284 - BLOCK
      ?auto_1285 - BLOCK
    )
    :vars
    (
      ?auto_1286 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1285 ?auto_1286 ) ( not ( = ?auto_1283 ?auto_1284 ) ) ( not ( = ?auto_1283 ?auto_1285 ) ) ( not ( = ?auto_1283 ?auto_1286 ) ) ( not ( = ?auto_1284 ?auto_1285 ) ) ( not ( = ?auto_1284 ?auto_1286 ) ) ( not ( = ?auto_1285 ?auto_1286 ) ) ( ON ?auto_1284 ?auto_1285 ) ( ON ?auto_1283 ?auto_1284 ) ( CLEAR ?auto_1283 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_1283 )
      ( MAKE-3PILE ?auto_1283 ?auto_1284 ?auto_1285 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_1290 - BLOCK
      ?auto_1291 - BLOCK
      ?auto_1292 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_1292 ) ( not ( = ?auto_1290 ?auto_1291 ) ) ( not ( = ?auto_1290 ?auto_1292 ) ) ( not ( = ?auto_1291 ?auto_1292 ) ) ( ON ?auto_1291 ?auto_1292 ) ( ON ?auto_1290 ?auto_1291 ) ( CLEAR ?auto_1290 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_1290 )
      ( MAKE-3PILE ?auto_1290 ?auto_1291 ?auto_1292 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_1296 - BLOCK
      ?auto_1297 - BLOCK
      ?auto_1298 - BLOCK
    )
    :vars
    (
      ?auto_1299 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1296 ?auto_1297 ) ) ( not ( = ?auto_1296 ?auto_1298 ) ) ( not ( = ?auto_1297 ?auto_1298 ) ) ( ON ?auto_1296 ?auto_1299 ) ( not ( = ?auto_1298 ?auto_1299 ) ) ( not ( = ?auto_1297 ?auto_1299 ) ) ( not ( = ?auto_1296 ?auto_1299 ) ) ( ON ?auto_1297 ?auto_1296 ) ( ON ?auto_1298 ?auto_1297 ) ( CLEAR ?auto_1298 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_1298 ?auto_1297 ?auto_1296 )
      ( MAKE-3PILE ?auto_1296 ?auto_1297 ?auto_1298 ) )
  )

)

