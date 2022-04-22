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
      ?auto_240201 - BLOCK
    )
    :vars
    (
      ?auto_240202 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_240201 ?auto_240202 ) ( CLEAR ?auto_240201 ) ( HAND-EMPTY ) ( not ( = ?auto_240201 ?auto_240202 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_240201 ?auto_240202 )
      ( !PUTDOWN ?auto_240201 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_240204 - BLOCK
    )
    :vars
    (
      ?auto_240205 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_240204 ?auto_240205 ) ( CLEAR ?auto_240204 ) ( HAND-EMPTY ) ( not ( = ?auto_240204 ?auto_240205 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_240204 ?auto_240205 )
      ( !PUTDOWN ?auto_240204 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_240208 - BLOCK
      ?auto_240209 - BLOCK
    )
    :vars
    (
      ?auto_240210 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_240208 ) ( ON ?auto_240209 ?auto_240210 ) ( CLEAR ?auto_240209 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_240208 ) ( not ( = ?auto_240208 ?auto_240209 ) ) ( not ( = ?auto_240208 ?auto_240210 ) ) ( not ( = ?auto_240209 ?auto_240210 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_240209 ?auto_240210 )
      ( !STACK ?auto_240209 ?auto_240208 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_240213 - BLOCK
      ?auto_240214 - BLOCK
    )
    :vars
    (
      ?auto_240215 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_240213 ) ( ON ?auto_240214 ?auto_240215 ) ( CLEAR ?auto_240214 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_240213 ) ( not ( = ?auto_240213 ?auto_240214 ) ) ( not ( = ?auto_240213 ?auto_240215 ) ) ( not ( = ?auto_240214 ?auto_240215 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_240214 ?auto_240215 )
      ( !STACK ?auto_240214 ?auto_240213 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_240218 - BLOCK
      ?auto_240219 - BLOCK
    )
    :vars
    (
      ?auto_240220 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_240219 ?auto_240220 ) ( not ( = ?auto_240218 ?auto_240219 ) ) ( not ( = ?auto_240218 ?auto_240220 ) ) ( not ( = ?auto_240219 ?auto_240220 ) ) ( ON ?auto_240218 ?auto_240219 ) ( CLEAR ?auto_240218 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_240218 )
      ( MAKE-2PILE ?auto_240218 ?auto_240219 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_240223 - BLOCK
      ?auto_240224 - BLOCK
    )
    :vars
    (
      ?auto_240225 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_240224 ?auto_240225 ) ( not ( = ?auto_240223 ?auto_240224 ) ) ( not ( = ?auto_240223 ?auto_240225 ) ) ( not ( = ?auto_240224 ?auto_240225 ) ) ( ON ?auto_240223 ?auto_240224 ) ( CLEAR ?auto_240223 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_240223 )
      ( MAKE-2PILE ?auto_240223 ?auto_240224 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_240229 - BLOCK
      ?auto_240230 - BLOCK
      ?auto_240231 - BLOCK
    )
    :vars
    (
      ?auto_240232 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_240230 ) ( ON ?auto_240231 ?auto_240232 ) ( CLEAR ?auto_240231 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_240229 ) ( ON ?auto_240230 ?auto_240229 ) ( not ( = ?auto_240229 ?auto_240230 ) ) ( not ( = ?auto_240229 ?auto_240231 ) ) ( not ( = ?auto_240229 ?auto_240232 ) ) ( not ( = ?auto_240230 ?auto_240231 ) ) ( not ( = ?auto_240230 ?auto_240232 ) ) ( not ( = ?auto_240231 ?auto_240232 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_240231 ?auto_240232 )
      ( !STACK ?auto_240231 ?auto_240230 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_240236 - BLOCK
      ?auto_240237 - BLOCK
      ?auto_240238 - BLOCK
    )
    :vars
    (
      ?auto_240239 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_240237 ) ( ON ?auto_240238 ?auto_240239 ) ( CLEAR ?auto_240238 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_240236 ) ( ON ?auto_240237 ?auto_240236 ) ( not ( = ?auto_240236 ?auto_240237 ) ) ( not ( = ?auto_240236 ?auto_240238 ) ) ( not ( = ?auto_240236 ?auto_240239 ) ) ( not ( = ?auto_240237 ?auto_240238 ) ) ( not ( = ?auto_240237 ?auto_240239 ) ) ( not ( = ?auto_240238 ?auto_240239 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_240238 ?auto_240239 )
      ( !STACK ?auto_240238 ?auto_240237 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_240243 - BLOCK
      ?auto_240244 - BLOCK
      ?auto_240245 - BLOCK
    )
    :vars
    (
      ?auto_240246 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_240245 ?auto_240246 ) ( ON-TABLE ?auto_240243 ) ( not ( = ?auto_240243 ?auto_240244 ) ) ( not ( = ?auto_240243 ?auto_240245 ) ) ( not ( = ?auto_240243 ?auto_240246 ) ) ( not ( = ?auto_240244 ?auto_240245 ) ) ( not ( = ?auto_240244 ?auto_240246 ) ) ( not ( = ?auto_240245 ?auto_240246 ) ) ( CLEAR ?auto_240243 ) ( ON ?auto_240244 ?auto_240245 ) ( CLEAR ?auto_240244 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_240243 ?auto_240244 )
      ( MAKE-3PILE ?auto_240243 ?auto_240244 ?auto_240245 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_240250 - BLOCK
      ?auto_240251 - BLOCK
      ?auto_240252 - BLOCK
    )
    :vars
    (
      ?auto_240253 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_240252 ?auto_240253 ) ( ON-TABLE ?auto_240250 ) ( not ( = ?auto_240250 ?auto_240251 ) ) ( not ( = ?auto_240250 ?auto_240252 ) ) ( not ( = ?auto_240250 ?auto_240253 ) ) ( not ( = ?auto_240251 ?auto_240252 ) ) ( not ( = ?auto_240251 ?auto_240253 ) ) ( not ( = ?auto_240252 ?auto_240253 ) ) ( CLEAR ?auto_240250 ) ( ON ?auto_240251 ?auto_240252 ) ( CLEAR ?auto_240251 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_240250 ?auto_240251 )
      ( MAKE-3PILE ?auto_240250 ?auto_240251 ?auto_240252 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_240257 - BLOCK
      ?auto_240258 - BLOCK
      ?auto_240259 - BLOCK
    )
    :vars
    (
      ?auto_240260 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_240259 ?auto_240260 ) ( not ( = ?auto_240257 ?auto_240258 ) ) ( not ( = ?auto_240257 ?auto_240259 ) ) ( not ( = ?auto_240257 ?auto_240260 ) ) ( not ( = ?auto_240258 ?auto_240259 ) ) ( not ( = ?auto_240258 ?auto_240260 ) ) ( not ( = ?auto_240259 ?auto_240260 ) ) ( ON ?auto_240258 ?auto_240259 ) ( ON ?auto_240257 ?auto_240258 ) ( CLEAR ?auto_240257 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_240257 )
      ( MAKE-3PILE ?auto_240257 ?auto_240258 ?auto_240259 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_240264 - BLOCK
      ?auto_240265 - BLOCK
      ?auto_240266 - BLOCK
    )
    :vars
    (
      ?auto_240267 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_240266 ?auto_240267 ) ( not ( = ?auto_240264 ?auto_240265 ) ) ( not ( = ?auto_240264 ?auto_240266 ) ) ( not ( = ?auto_240264 ?auto_240267 ) ) ( not ( = ?auto_240265 ?auto_240266 ) ) ( not ( = ?auto_240265 ?auto_240267 ) ) ( not ( = ?auto_240266 ?auto_240267 ) ) ( ON ?auto_240265 ?auto_240266 ) ( ON ?auto_240264 ?auto_240265 ) ( CLEAR ?auto_240264 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_240264 )
      ( MAKE-3PILE ?auto_240264 ?auto_240265 ?auto_240266 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_240272 - BLOCK
      ?auto_240273 - BLOCK
      ?auto_240274 - BLOCK
      ?auto_240275 - BLOCK
    )
    :vars
    (
      ?auto_240276 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_240274 ) ( ON ?auto_240275 ?auto_240276 ) ( CLEAR ?auto_240275 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_240272 ) ( ON ?auto_240273 ?auto_240272 ) ( ON ?auto_240274 ?auto_240273 ) ( not ( = ?auto_240272 ?auto_240273 ) ) ( not ( = ?auto_240272 ?auto_240274 ) ) ( not ( = ?auto_240272 ?auto_240275 ) ) ( not ( = ?auto_240272 ?auto_240276 ) ) ( not ( = ?auto_240273 ?auto_240274 ) ) ( not ( = ?auto_240273 ?auto_240275 ) ) ( not ( = ?auto_240273 ?auto_240276 ) ) ( not ( = ?auto_240274 ?auto_240275 ) ) ( not ( = ?auto_240274 ?auto_240276 ) ) ( not ( = ?auto_240275 ?auto_240276 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_240275 ?auto_240276 )
      ( !STACK ?auto_240275 ?auto_240274 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_240281 - BLOCK
      ?auto_240282 - BLOCK
      ?auto_240283 - BLOCK
      ?auto_240284 - BLOCK
    )
    :vars
    (
      ?auto_240285 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_240283 ) ( ON ?auto_240284 ?auto_240285 ) ( CLEAR ?auto_240284 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_240281 ) ( ON ?auto_240282 ?auto_240281 ) ( ON ?auto_240283 ?auto_240282 ) ( not ( = ?auto_240281 ?auto_240282 ) ) ( not ( = ?auto_240281 ?auto_240283 ) ) ( not ( = ?auto_240281 ?auto_240284 ) ) ( not ( = ?auto_240281 ?auto_240285 ) ) ( not ( = ?auto_240282 ?auto_240283 ) ) ( not ( = ?auto_240282 ?auto_240284 ) ) ( not ( = ?auto_240282 ?auto_240285 ) ) ( not ( = ?auto_240283 ?auto_240284 ) ) ( not ( = ?auto_240283 ?auto_240285 ) ) ( not ( = ?auto_240284 ?auto_240285 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_240284 ?auto_240285 )
      ( !STACK ?auto_240284 ?auto_240283 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_240290 - BLOCK
      ?auto_240291 - BLOCK
      ?auto_240292 - BLOCK
      ?auto_240293 - BLOCK
    )
    :vars
    (
      ?auto_240294 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_240293 ?auto_240294 ) ( ON-TABLE ?auto_240290 ) ( ON ?auto_240291 ?auto_240290 ) ( not ( = ?auto_240290 ?auto_240291 ) ) ( not ( = ?auto_240290 ?auto_240292 ) ) ( not ( = ?auto_240290 ?auto_240293 ) ) ( not ( = ?auto_240290 ?auto_240294 ) ) ( not ( = ?auto_240291 ?auto_240292 ) ) ( not ( = ?auto_240291 ?auto_240293 ) ) ( not ( = ?auto_240291 ?auto_240294 ) ) ( not ( = ?auto_240292 ?auto_240293 ) ) ( not ( = ?auto_240292 ?auto_240294 ) ) ( not ( = ?auto_240293 ?auto_240294 ) ) ( CLEAR ?auto_240291 ) ( ON ?auto_240292 ?auto_240293 ) ( CLEAR ?auto_240292 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_240290 ?auto_240291 ?auto_240292 )
      ( MAKE-4PILE ?auto_240290 ?auto_240291 ?auto_240292 ?auto_240293 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_240299 - BLOCK
      ?auto_240300 - BLOCK
      ?auto_240301 - BLOCK
      ?auto_240302 - BLOCK
    )
    :vars
    (
      ?auto_240303 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_240302 ?auto_240303 ) ( ON-TABLE ?auto_240299 ) ( ON ?auto_240300 ?auto_240299 ) ( not ( = ?auto_240299 ?auto_240300 ) ) ( not ( = ?auto_240299 ?auto_240301 ) ) ( not ( = ?auto_240299 ?auto_240302 ) ) ( not ( = ?auto_240299 ?auto_240303 ) ) ( not ( = ?auto_240300 ?auto_240301 ) ) ( not ( = ?auto_240300 ?auto_240302 ) ) ( not ( = ?auto_240300 ?auto_240303 ) ) ( not ( = ?auto_240301 ?auto_240302 ) ) ( not ( = ?auto_240301 ?auto_240303 ) ) ( not ( = ?auto_240302 ?auto_240303 ) ) ( CLEAR ?auto_240300 ) ( ON ?auto_240301 ?auto_240302 ) ( CLEAR ?auto_240301 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_240299 ?auto_240300 ?auto_240301 )
      ( MAKE-4PILE ?auto_240299 ?auto_240300 ?auto_240301 ?auto_240302 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_240308 - BLOCK
      ?auto_240309 - BLOCK
      ?auto_240310 - BLOCK
      ?auto_240311 - BLOCK
    )
    :vars
    (
      ?auto_240312 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_240311 ?auto_240312 ) ( ON-TABLE ?auto_240308 ) ( not ( = ?auto_240308 ?auto_240309 ) ) ( not ( = ?auto_240308 ?auto_240310 ) ) ( not ( = ?auto_240308 ?auto_240311 ) ) ( not ( = ?auto_240308 ?auto_240312 ) ) ( not ( = ?auto_240309 ?auto_240310 ) ) ( not ( = ?auto_240309 ?auto_240311 ) ) ( not ( = ?auto_240309 ?auto_240312 ) ) ( not ( = ?auto_240310 ?auto_240311 ) ) ( not ( = ?auto_240310 ?auto_240312 ) ) ( not ( = ?auto_240311 ?auto_240312 ) ) ( ON ?auto_240310 ?auto_240311 ) ( CLEAR ?auto_240308 ) ( ON ?auto_240309 ?auto_240310 ) ( CLEAR ?auto_240309 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_240308 ?auto_240309 )
      ( MAKE-4PILE ?auto_240308 ?auto_240309 ?auto_240310 ?auto_240311 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_240317 - BLOCK
      ?auto_240318 - BLOCK
      ?auto_240319 - BLOCK
      ?auto_240320 - BLOCK
    )
    :vars
    (
      ?auto_240321 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_240320 ?auto_240321 ) ( ON-TABLE ?auto_240317 ) ( not ( = ?auto_240317 ?auto_240318 ) ) ( not ( = ?auto_240317 ?auto_240319 ) ) ( not ( = ?auto_240317 ?auto_240320 ) ) ( not ( = ?auto_240317 ?auto_240321 ) ) ( not ( = ?auto_240318 ?auto_240319 ) ) ( not ( = ?auto_240318 ?auto_240320 ) ) ( not ( = ?auto_240318 ?auto_240321 ) ) ( not ( = ?auto_240319 ?auto_240320 ) ) ( not ( = ?auto_240319 ?auto_240321 ) ) ( not ( = ?auto_240320 ?auto_240321 ) ) ( ON ?auto_240319 ?auto_240320 ) ( CLEAR ?auto_240317 ) ( ON ?auto_240318 ?auto_240319 ) ( CLEAR ?auto_240318 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_240317 ?auto_240318 )
      ( MAKE-4PILE ?auto_240317 ?auto_240318 ?auto_240319 ?auto_240320 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_240326 - BLOCK
      ?auto_240327 - BLOCK
      ?auto_240328 - BLOCK
      ?auto_240329 - BLOCK
    )
    :vars
    (
      ?auto_240330 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_240329 ?auto_240330 ) ( not ( = ?auto_240326 ?auto_240327 ) ) ( not ( = ?auto_240326 ?auto_240328 ) ) ( not ( = ?auto_240326 ?auto_240329 ) ) ( not ( = ?auto_240326 ?auto_240330 ) ) ( not ( = ?auto_240327 ?auto_240328 ) ) ( not ( = ?auto_240327 ?auto_240329 ) ) ( not ( = ?auto_240327 ?auto_240330 ) ) ( not ( = ?auto_240328 ?auto_240329 ) ) ( not ( = ?auto_240328 ?auto_240330 ) ) ( not ( = ?auto_240329 ?auto_240330 ) ) ( ON ?auto_240328 ?auto_240329 ) ( ON ?auto_240327 ?auto_240328 ) ( ON ?auto_240326 ?auto_240327 ) ( CLEAR ?auto_240326 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_240326 )
      ( MAKE-4PILE ?auto_240326 ?auto_240327 ?auto_240328 ?auto_240329 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_240335 - BLOCK
      ?auto_240336 - BLOCK
      ?auto_240337 - BLOCK
      ?auto_240338 - BLOCK
    )
    :vars
    (
      ?auto_240339 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_240338 ?auto_240339 ) ( not ( = ?auto_240335 ?auto_240336 ) ) ( not ( = ?auto_240335 ?auto_240337 ) ) ( not ( = ?auto_240335 ?auto_240338 ) ) ( not ( = ?auto_240335 ?auto_240339 ) ) ( not ( = ?auto_240336 ?auto_240337 ) ) ( not ( = ?auto_240336 ?auto_240338 ) ) ( not ( = ?auto_240336 ?auto_240339 ) ) ( not ( = ?auto_240337 ?auto_240338 ) ) ( not ( = ?auto_240337 ?auto_240339 ) ) ( not ( = ?auto_240338 ?auto_240339 ) ) ( ON ?auto_240337 ?auto_240338 ) ( ON ?auto_240336 ?auto_240337 ) ( ON ?auto_240335 ?auto_240336 ) ( CLEAR ?auto_240335 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_240335 )
      ( MAKE-4PILE ?auto_240335 ?auto_240336 ?auto_240337 ?auto_240338 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_240345 - BLOCK
      ?auto_240346 - BLOCK
      ?auto_240347 - BLOCK
      ?auto_240348 - BLOCK
      ?auto_240349 - BLOCK
    )
    :vars
    (
      ?auto_240350 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_240348 ) ( ON ?auto_240349 ?auto_240350 ) ( CLEAR ?auto_240349 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_240345 ) ( ON ?auto_240346 ?auto_240345 ) ( ON ?auto_240347 ?auto_240346 ) ( ON ?auto_240348 ?auto_240347 ) ( not ( = ?auto_240345 ?auto_240346 ) ) ( not ( = ?auto_240345 ?auto_240347 ) ) ( not ( = ?auto_240345 ?auto_240348 ) ) ( not ( = ?auto_240345 ?auto_240349 ) ) ( not ( = ?auto_240345 ?auto_240350 ) ) ( not ( = ?auto_240346 ?auto_240347 ) ) ( not ( = ?auto_240346 ?auto_240348 ) ) ( not ( = ?auto_240346 ?auto_240349 ) ) ( not ( = ?auto_240346 ?auto_240350 ) ) ( not ( = ?auto_240347 ?auto_240348 ) ) ( not ( = ?auto_240347 ?auto_240349 ) ) ( not ( = ?auto_240347 ?auto_240350 ) ) ( not ( = ?auto_240348 ?auto_240349 ) ) ( not ( = ?auto_240348 ?auto_240350 ) ) ( not ( = ?auto_240349 ?auto_240350 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_240349 ?auto_240350 )
      ( !STACK ?auto_240349 ?auto_240348 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_240356 - BLOCK
      ?auto_240357 - BLOCK
      ?auto_240358 - BLOCK
      ?auto_240359 - BLOCK
      ?auto_240360 - BLOCK
    )
    :vars
    (
      ?auto_240361 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_240359 ) ( ON ?auto_240360 ?auto_240361 ) ( CLEAR ?auto_240360 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_240356 ) ( ON ?auto_240357 ?auto_240356 ) ( ON ?auto_240358 ?auto_240357 ) ( ON ?auto_240359 ?auto_240358 ) ( not ( = ?auto_240356 ?auto_240357 ) ) ( not ( = ?auto_240356 ?auto_240358 ) ) ( not ( = ?auto_240356 ?auto_240359 ) ) ( not ( = ?auto_240356 ?auto_240360 ) ) ( not ( = ?auto_240356 ?auto_240361 ) ) ( not ( = ?auto_240357 ?auto_240358 ) ) ( not ( = ?auto_240357 ?auto_240359 ) ) ( not ( = ?auto_240357 ?auto_240360 ) ) ( not ( = ?auto_240357 ?auto_240361 ) ) ( not ( = ?auto_240358 ?auto_240359 ) ) ( not ( = ?auto_240358 ?auto_240360 ) ) ( not ( = ?auto_240358 ?auto_240361 ) ) ( not ( = ?auto_240359 ?auto_240360 ) ) ( not ( = ?auto_240359 ?auto_240361 ) ) ( not ( = ?auto_240360 ?auto_240361 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_240360 ?auto_240361 )
      ( !STACK ?auto_240360 ?auto_240359 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_240367 - BLOCK
      ?auto_240368 - BLOCK
      ?auto_240369 - BLOCK
      ?auto_240370 - BLOCK
      ?auto_240371 - BLOCK
    )
    :vars
    (
      ?auto_240372 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_240371 ?auto_240372 ) ( ON-TABLE ?auto_240367 ) ( ON ?auto_240368 ?auto_240367 ) ( ON ?auto_240369 ?auto_240368 ) ( not ( = ?auto_240367 ?auto_240368 ) ) ( not ( = ?auto_240367 ?auto_240369 ) ) ( not ( = ?auto_240367 ?auto_240370 ) ) ( not ( = ?auto_240367 ?auto_240371 ) ) ( not ( = ?auto_240367 ?auto_240372 ) ) ( not ( = ?auto_240368 ?auto_240369 ) ) ( not ( = ?auto_240368 ?auto_240370 ) ) ( not ( = ?auto_240368 ?auto_240371 ) ) ( not ( = ?auto_240368 ?auto_240372 ) ) ( not ( = ?auto_240369 ?auto_240370 ) ) ( not ( = ?auto_240369 ?auto_240371 ) ) ( not ( = ?auto_240369 ?auto_240372 ) ) ( not ( = ?auto_240370 ?auto_240371 ) ) ( not ( = ?auto_240370 ?auto_240372 ) ) ( not ( = ?auto_240371 ?auto_240372 ) ) ( CLEAR ?auto_240369 ) ( ON ?auto_240370 ?auto_240371 ) ( CLEAR ?auto_240370 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_240367 ?auto_240368 ?auto_240369 ?auto_240370 )
      ( MAKE-5PILE ?auto_240367 ?auto_240368 ?auto_240369 ?auto_240370 ?auto_240371 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_240378 - BLOCK
      ?auto_240379 - BLOCK
      ?auto_240380 - BLOCK
      ?auto_240381 - BLOCK
      ?auto_240382 - BLOCK
    )
    :vars
    (
      ?auto_240383 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_240382 ?auto_240383 ) ( ON-TABLE ?auto_240378 ) ( ON ?auto_240379 ?auto_240378 ) ( ON ?auto_240380 ?auto_240379 ) ( not ( = ?auto_240378 ?auto_240379 ) ) ( not ( = ?auto_240378 ?auto_240380 ) ) ( not ( = ?auto_240378 ?auto_240381 ) ) ( not ( = ?auto_240378 ?auto_240382 ) ) ( not ( = ?auto_240378 ?auto_240383 ) ) ( not ( = ?auto_240379 ?auto_240380 ) ) ( not ( = ?auto_240379 ?auto_240381 ) ) ( not ( = ?auto_240379 ?auto_240382 ) ) ( not ( = ?auto_240379 ?auto_240383 ) ) ( not ( = ?auto_240380 ?auto_240381 ) ) ( not ( = ?auto_240380 ?auto_240382 ) ) ( not ( = ?auto_240380 ?auto_240383 ) ) ( not ( = ?auto_240381 ?auto_240382 ) ) ( not ( = ?auto_240381 ?auto_240383 ) ) ( not ( = ?auto_240382 ?auto_240383 ) ) ( CLEAR ?auto_240380 ) ( ON ?auto_240381 ?auto_240382 ) ( CLEAR ?auto_240381 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_240378 ?auto_240379 ?auto_240380 ?auto_240381 )
      ( MAKE-5PILE ?auto_240378 ?auto_240379 ?auto_240380 ?auto_240381 ?auto_240382 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_240389 - BLOCK
      ?auto_240390 - BLOCK
      ?auto_240391 - BLOCK
      ?auto_240392 - BLOCK
      ?auto_240393 - BLOCK
    )
    :vars
    (
      ?auto_240394 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_240393 ?auto_240394 ) ( ON-TABLE ?auto_240389 ) ( ON ?auto_240390 ?auto_240389 ) ( not ( = ?auto_240389 ?auto_240390 ) ) ( not ( = ?auto_240389 ?auto_240391 ) ) ( not ( = ?auto_240389 ?auto_240392 ) ) ( not ( = ?auto_240389 ?auto_240393 ) ) ( not ( = ?auto_240389 ?auto_240394 ) ) ( not ( = ?auto_240390 ?auto_240391 ) ) ( not ( = ?auto_240390 ?auto_240392 ) ) ( not ( = ?auto_240390 ?auto_240393 ) ) ( not ( = ?auto_240390 ?auto_240394 ) ) ( not ( = ?auto_240391 ?auto_240392 ) ) ( not ( = ?auto_240391 ?auto_240393 ) ) ( not ( = ?auto_240391 ?auto_240394 ) ) ( not ( = ?auto_240392 ?auto_240393 ) ) ( not ( = ?auto_240392 ?auto_240394 ) ) ( not ( = ?auto_240393 ?auto_240394 ) ) ( ON ?auto_240392 ?auto_240393 ) ( CLEAR ?auto_240390 ) ( ON ?auto_240391 ?auto_240392 ) ( CLEAR ?auto_240391 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_240389 ?auto_240390 ?auto_240391 )
      ( MAKE-5PILE ?auto_240389 ?auto_240390 ?auto_240391 ?auto_240392 ?auto_240393 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_240400 - BLOCK
      ?auto_240401 - BLOCK
      ?auto_240402 - BLOCK
      ?auto_240403 - BLOCK
      ?auto_240404 - BLOCK
    )
    :vars
    (
      ?auto_240405 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_240404 ?auto_240405 ) ( ON-TABLE ?auto_240400 ) ( ON ?auto_240401 ?auto_240400 ) ( not ( = ?auto_240400 ?auto_240401 ) ) ( not ( = ?auto_240400 ?auto_240402 ) ) ( not ( = ?auto_240400 ?auto_240403 ) ) ( not ( = ?auto_240400 ?auto_240404 ) ) ( not ( = ?auto_240400 ?auto_240405 ) ) ( not ( = ?auto_240401 ?auto_240402 ) ) ( not ( = ?auto_240401 ?auto_240403 ) ) ( not ( = ?auto_240401 ?auto_240404 ) ) ( not ( = ?auto_240401 ?auto_240405 ) ) ( not ( = ?auto_240402 ?auto_240403 ) ) ( not ( = ?auto_240402 ?auto_240404 ) ) ( not ( = ?auto_240402 ?auto_240405 ) ) ( not ( = ?auto_240403 ?auto_240404 ) ) ( not ( = ?auto_240403 ?auto_240405 ) ) ( not ( = ?auto_240404 ?auto_240405 ) ) ( ON ?auto_240403 ?auto_240404 ) ( CLEAR ?auto_240401 ) ( ON ?auto_240402 ?auto_240403 ) ( CLEAR ?auto_240402 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_240400 ?auto_240401 ?auto_240402 )
      ( MAKE-5PILE ?auto_240400 ?auto_240401 ?auto_240402 ?auto_240403 ?auto_240404 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_240411 - BLOCK
      ?auto_240412 - BLOCK
      ?auto_240413 - BLOCK
      ?auto_240414 - BLOCK
      ?auto_240415 - BLOCK
    )
    :vars
    (
      ?auto_240416 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_240415 ?auto_240416 ) ( ON-TABLE ?auto_240411 ) ( not ( = ?auto_240411 ?auto_240412 ) ) ( not ( = ?auto_240411 ?auto_240413 ) ) ( not ( = ?auto_240411 ?auto_240414 ) ) ( not ( = ?auto_240411 ?auto_240415 ) ) ( not ( = ?auto_240411 ?auto_240416 ) ) ( not ( = ?auto_240412 ?auto_240413 ) ) ( not ( = ?auto_240412 ?auto_240414 ) ) ( not ( = ?auto_240412 ?auto_240415 ) ) ( not ( = ?auto_240412 ?auto_240416 ) ) ( not ( = ?auto_240413 ?auto_240414 ) ) ( not ( = ?auto_240413 ?auto_240415 ) ) ( not ( = ?auto_240413 ?auto_240416 ) ) ( not ( = ?auto_240414 ?auto_240415 ) ) ( not ( = ?auto_240414 ?auto_240416 ) ) ( not ( = ?auto_240415 ?auto_240416 ) ) ( ON ?auto_240414 ?auto_240415 ) ( ON ?auto_240413 ?auto_240414 ) ( CLEAR ?auto_240411 ) ( ON ?auto_240412 ?auto_240413 ) ( CLEAR ?auto_240412 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_240411 ?auto_240412 )
      ( MAKE-5PILE ?auto_240411 ?auto_240412 ?auto_240413 ?auto_240414 ?auto_240415 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_240422 - BLOCK
      ?auto_240423 - BLOCK
      ?auto_240424 - BLOCK
      ?auto_240425 - BLOCK
      ?auto_240426 - BLOCK
    )
    :vars
    (
      ?auto_240427 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_240426 ?auto_240427 ) ( ON-TABLE ?auto_240422 ) ( not ( = ?auto_240422 ?auto_240423 ) ) ( not ( = ?auto_240422 ?auto_240424 ) ) ( not ( = ?auto_240422 ?auto_240425 ) ) ( not ( = ?auto_240422 ?auto_240426 ) ) ( not ( = ?auto_240422 ?auto_240427 ) ) ( not ( = ?auto_240423 ?auto_240424 ) ) ( not ( = ?auto_240423 ?auto_240425 ) ) ( not ( = ?auto_240423 ?auto_240426 ) ) ( not ( = ?auto_240423 ?auto_240427 ) ) ( not ( = ?auto_240424 ?auto_240425 ) ) ( not ( = ?auto_240424 ?auto_240426 ) ) ( not ( = ?auto_240424 ?auto_240427 ) ) ( not ( = ?auto_240425 ?auto_240426 ) ) ( not ( = ?auto_240425 ?auto_240427 ) ) ( not ( = ?auto_240426 ?auto_240427 ) ) ( ON ?auto_240425 ?auto_240426 ) ( ON ?auto_240424 ?auto_240425 ) ( CLEAR ?auto_240422 ) ( ON ?auto_240423 ?auto_240424 ) ( CLEAR ?auto_240423 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_240422 ?auto_240423 )
      ( MAKE-5PILE ?auto_240422 ?auto_240423 ?auto_240424 ?auto_240425 ?auto_240426 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_240433 - BLOCK
      ?auto_240434 - BLOCK
      ?auto_240435 - BLOCK
      ?auto_240436 - BLOCK
      ?auto_240437 - BLOCK
    )
    :vars
    (
      ?auto_240438 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_240437 ?auto_240438 ) ( not ( = ?auto_240433 ?auto_240434 ) ) ( not ( = ?auto_240433 ?auto_240435 ) ) ( not ( = ?auto_240433 ?auto_240436 ) ) ( not ( = ?auto_240433 ?auto_240437 ) ) ( not ( = ?auto_240433 ?auto_240438 ) ) ( not ( = ?auto_240434 ?auto_240435 ) ) ( not ( = ?auto_240434 ?auto_240436 ) ) ( not ( = ?auto_240434 ?auto_240437 ) ) ( not ( = ?auto_240434 ?auto_240438 ) ) ( not ( = ?auto_240435 ?auto_240436 ) ) ( not ( = ?auto_240435 ?auto_240437 ) ) ( not ( = ?auto_240435 ?auto_240438 ) ) ( not ( = ?auto_240436 ?auto_240437 ) ) ( not ( = ?auto_240436 ?auto_240438 ) ) ( not ( = ?auto_240437 ?auto_240438 ) ) ( ON ?auto_240436 ?auto_240437 ) ( ON ?auto_240435 ?auto_240436 ) ( ON ?auto_240434 ?auto_240435 ) ( ON ?auto_240433 ?auto_240434 ) ( CLEAR ?auto_240433 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_240433 )
      ( MAKE-5PILE ?auto_240433 ?auto_240434 ?auto_240435 ?auto_240436 ?auto_240437 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_240444 - BLOCK
      ?auto_240445 - BLOCK
      ?auto_240446 - BLOCK
      ?auto_240447 - BLOCK
      ?auto_240448 - BLOCK
    )
    :vars
    (
      ?auto_240449 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_240448 ?auto_240449 ) ( not ( = ?auto_240444 ?auto_240445 ) ) ( not ( = ?auto_240444 ?auto_240446 ) ) ( not ( = ?auto_240444 ?auto_240447 ) ) ( not ( = ?auto_240444 ?auto_240448 ) ) ( not ( = ?auto_240444 ?auto_240449 ) ) ( not ( = ?auto_240445 ?auto_240446 ) ) ( not ( = ?auto_240445 ?auto_240447 ) ) ( not ( = ?auto_240445 ?auto_240448 ) ) ( not ( = ?auto_240445 ?auto_240449 ) ) ( not ( = ?auto_240446 ?auto_240447 ) ) ( not ( = ?auto_240446 ?auto_240448 ) ) ( not ( = ?auto_240446 ?auto_240449 ) ) ( not ( = ?auto_240447 ?auto_240448 ) ) ( not ( = ?auto_240447 ?auto_240449 ) ) ( not ( = ?auto_240448 ?auto_240449 ) ) ( ON ?auto_240447 ?auto_240448 ) ( ON ?auto_240446 ?auto_240447 ) ( ON ?auto_240445 ?auto_240446 ) ( ON ?auto_240444 ?auto_240445 ) ( CLEAR ?auto_240444 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_240444 )
      ( MAKE-5PILE ?auto_240444 ?auto_240445 ?auto_240446 ?auto_240447 ?auto_240448 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_240456 - BLOCK
      ?auto_240457 - BLOCK
      ?auto_240458 - BLOCK
      ?auto_240459 - BLOCK
      ?auto_240460 - BLOCK
      ?auto_240461 - BLOCK
    )
    :vars
    (
      ?auto_240462 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_240460 ) ( ON ?auto_240461 ?auto_240462 ) ( CLEAR ?auto_240461 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_240456 ) ( ON ?auto_240457 ?auto_240456 ) ( ON ?auto_240458 ?auto_240457 ) ( ON ?auto_240459 ?auto_240458 ) ( ON ?auto_240460 ?auto_240459 ) ( not ( = ?auto_240456 ?auto_240457 ) ) ( not ( = ?auto_240456 ?auto_240458 ) ) ( not ( = ?auto_240456 ?auto_240459 ) ) ( not ( = ?auto_240456 ?auto_240460 ) ) ( not ( = ?auto_240456 ?auto_240461 ) ) ( not ( = ?auto_240456 ?auto_240462 ) ) ( not ( = ?auto_240457 ?auto_240458 ) ) ( not ( = ?auto_240457 ?auto_240459 ) ) ( not ( = ?auto_240457 ?auto_240460 ) ) ( not ( = ?auto_240457 ?auto_240461 ) ) ( not ( = ?auto_240457 ?auto_240462 ) ) ( not ( = ?auto_240458 ?auto_240459 ) ) ( not ( = ?auto_240458 ?auto_240460 ) ) ( not ( = ?auto_240458 ?auto_240461 ) ) ( not ( = ?auto_240458 ?auto_240462 ) ) ( not ( = ?auto_240459 ?auto_240460 ) ) ( not ( = ?auto_240459 ?auto_240461 ) ) ( not ( = ?auto_240459 ?auto_240462 ) ) ( not ( = ?auto_240460 ?auto_240461 ) ) ( not ( = ?auto_240460 ?auto_240462 ) ) ( not ( = ?auto_240461 ?auto_240462 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_240461 ?auto_240462 )
      ( !STACK ?auto_240461 ?auto_240460 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_240469 - BLOCK
      ?auto_240470 - BLOCK
      ?auto_240471 - BLOCK
      ?auto_240472 - BLOCK
      ?auto_240473 - BLOCK
      ?auto_240474 - BLOCK
    )
    :vars
    (
      ?auto_240475 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_240473 ) ( ON ?auto_240474 ?auto_240475 ) ( CLEAR ?auto_240474 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_240469 ) ( ON ?auto_240470 ?auto_240469 ) ( ON ?auto_240471 ?auto_240470 ) ( ON ?auto_240472 ?auto_240471 ) ( ON ?auto_240473 ?auto_240472 ) ( not ( = ?auto_240469 ?auto_240470 ) ) ( not ( = ?auto_240469 ?auto_240471 ) ) ( not ( = ?auto_240469 ?auto_240472 ) ) ( not ( = ?auto_240469 ?auto_240473 ) ) ( not ( = ?auto_240469 ?auto_240474 ) ) ( not ( = ?auto_240469 ?auto_240475 ) ) ( not ( = ?auto_240470 ?auto_240471 ) ) ( not ( = ?auto_240470 ?auto_240472 ) ) ( not ( = ?auto_240470 ?auto_240473 ) ) ( not ( = ?auto_240470 ?auto_240474 ) ) ( not ( = ?auto_240470 ?auto_240475 ) ) ( not ( = ?auto_240471 ?auto_240472 ) ) ( not ( = ?auto_240471 ?auto_240473 ) ) ( not ( = ?auto_240471 ?auto_240474 ) ) ( not ( = ?auto_240471 ?auto_240475 ) ) ( not ( = ?auto_240472 ?auto_240473 ) ) ( not ( = ?auto_240472 ?auto_240474 ) ) ( not ( = ?auto_240472 ?auto_240475 ) ) ( not ( = ?auto_240473 ?auto_240474 ) ) ( not ( = ?auto_240473 ?auto_240475 ) ) ( not ( = ?auto_240474 ?auto_240475 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_240474 ?auto_240475 )
      ( !STACK ?auto_240474 ?auto_240473 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_240482 - BLOCK
      ?auto_240483 - BLOCK
      ?auto_240484 - BLOCK
      ?auto_240485 - BLOCK
      ?auto_240486 - BLOCK
      ?auto_240487 - BLOCK
    )
    :vars
    (
      ?auto_240488 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_240487 ?auto_240488 ) ( ON-TABLE ?auto_240482 ) ( ON ?auto_240483 ?auto_240482 ) ( ON ?auto_240484 ?auto_240483 ) ( ON ?auto_240485 ?auto_240484 ) ( not ( = ?auto_240482 ?auto_240483 ) ) ( not ( = ?auto_240482 ?auto_240484 ) ) ( not ( = ?auto_240482 ?auto_240485 ) ) ( not ( = ?auto_240482 ?auto_240486 ) ) ( not ( = ?auto_240482 ?auto_240487 ) ) ( not ( = ?auto_240482 ?auto_240488 ) ) ( not ( = ?auto_240483 ?auto_240484 ) ) ( not ( = ?auto_240483 ?auto_240485 ) ) ( not ( = ?auto_240483 ?auto_240486 ) ) ( not ( = ?auto_240483 ?auto_240487 ) ) ( not ( = ?auto_240483 ?auto_240488 ) ) ( not ( = ?auto_240484 ?auto_240485 ) ) ( not ( = ?auto_240484 ?auto_240486 ) ) ( not ( = ?auto_240484 ?auto_240487 ) ) ( not ( = ?auto_240484 ?auto_240488 ) ) ( not ( = ?auto_240485 ?auto_240486 ) ) ( not ( = ?auto_240485 ?auto_240487 ) ) ( not ( = ?auto_240485 ?auto_240488 ) ) ( not ( = ?auto_240486 ?auto_240487 ) ) ( not ( = ?auto_240486 ?auto_240488 ) ) ( not ( = ?auto_240487 ?auto_240488 ) ) ( CLEAR ?auto_240485 ) ( ON ?auto_240486 ?auto_240487 ) ( CLEAR ?auto_240486 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_240482 ?auto_240483 ?auto_240484 ?auto_240485 ?auto_240486 )
      ( MAKE-6PILE ?auto_240482 ?auto_240483 ?auto_240484 ?auto_240485 ?auto_240486 ?auto_240487 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_240495 - BLOCK
      ?auto_240496 - BLOCK
      ?auto_240497 - BLOCK
      ?auto_240498 - BLOCK
      ?auto_240499 - BLOCK
      ?auto_240500 - BLOCK
    )
    :vars
    (
      ?auto_240501 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_240500 ?auto_240501 ) ( ON-TABLE ?auto_240495 ) ( ON ?auto_240496 ?auto_240495 ) ( ON ?auto_240497 ?auto_240496 ) ( ON ?auto_240498 ?auto_240497 ) ( not ( = ?auto_240495 ?auto_240496 ) ) ( not ( = ?auto_240495 ?auto_240497 ) ) ( not ( = ?auto_240495 ?auto_240498 ) ) ( not ( = ?auto_240495 ?auto_240499 ) ) ( not ( = ?auto_240495 ?auto_240500 ) ) ( not ( = ?auto_240495 ?auto_240501 ) ) ( not ( = ?auto_240496 ?auto_240497 ) ) ( not ( = ?auto_240496 ?auto_240498 ) ) ( not ( = ?auto_240496 ?auto_240499 ) ) ( not ( = ?auto_240496 ?auto_240500 ) ) ( not ( = ?auto_240496 ?auto_240501 ) ) ( not ( = ?auto_240497 ?auto_240498 ) ) ( not ( = ?auto_240497 ?auto_240499 ) ) ( not ( = ?auto_240497 ?auto_240500 ) ) ( not ( = ?auto_240497 ?auto_240501 ) ) ( not ( = ?auto_240498 ?auto_240499 ) ) ( not ( = ?auto_240498 ?auto_240500 ) ) ( not ( = ?auto_240498 ?auto_240501 ) ) ( not ( = ?auto_240499 ?auto_240500 ) ) ( not ( = ?auto_240499 ?auto_240501 ) ) ( not ( = ?auto_240500 ?auto_240501 ) ) ( CLEAR ?auto_240498 ) ( ON ?auto_240499 ?auto_240500 ) ( CLEAR ?auto_240499 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_240495 ?auto_240496 ?auto_240497 ?auto_240498 ?auto_240499 )
      ( MAKE-6PILE ?auto_240495 ?auto_240496 ?auto_240497 ?auto_240498 ?auto_240499 ?auto_240500 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_240508 - BLOCK
      ?auto_240509 - BLOCK
      ?auto_240510 - BLOCK
      ?auto_240511 - BLOCK
      ?auto_240512 - BLOCK
      ?auto_240513 - BLOCK
    )
    :vars
    (
      ?auto_240514 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_240513 ?auto_240514 ) ( ON-TABLE ?auto_240508 ) ( ON ?auto_240509 ?auto_240508 ) ( ON ?auto_240510 ?auto_240509 ) ( not ( = ?auto_240508 ?auto_240509 ) ) ( not ( = ?auto_240508 ?auto_240510 ) ) ( not ( = ?auto_240508 ?auto_240511 ) ) ( not ( = ?auto_240508 ?auto_240512 ) ) ( not ( = ?auto_240508 ?auto_240513 ) ) ( not ( = ?auto_240508 ?auto_240514 ) ) ( not ( = ?auto_240509 ?auto_240510 ) ) ( not ( = ?auto_240509 ?auto_240511 ) ) ( not ( = ?auto_240509 ?auto_240512 ) ) ( not ( = ?auto_240509 ?auto_240513 ) ) ( not ( = ?auto_240509 ?auto_240514 ) ) ( not ( = ?auto_240510 ?auto_240511 ) ) ( not ( = ?auto_240510 ?auto_240512 ) ) ( not ( = ?auto_240510 ?auto_240513 ) ) ( not ( = ?auto_240510 ?auto_240514 ) ) ( not ( = ?auto_240511 ?auto_240512 ) ) ( not ( = ?auto_240511 ?auto_240513 ) ) ( not ( = ?auto_240511 ?auto_240514 ) ) ( not ( = ?auto_240512 ?auto_240513 ) ) ( not ( = ?auto_240512 ?auto_240514 ) ) ( not ( = ?auto_240513 ?auto_240514 ) ) ( ON ?auto_240512 ?auto_240513 ) ( CLEAR ?auto_240510 ) ( ON ?auto_240511 ?auto_240512 ) ( CLEAR ?auto_240511 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_240508 ?auto_240509 ?auto_240510 ?auto_240511 )
      ( MAKE-6PILE ?auto_240508 ?auto_240509 ?auto_240510 ?auto_240511 ?auto_240512 ?auto_240513 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_240521 - BLOCK
      ?auto_240522 - BLOCK
      ?auto_240523 - BLOCK
      ?auto_240524 - BLOCK
      ?auto_240525 - BLOCK
      ?auto_240526 - BLOCK
    )
    :vars
    (
      ?auto_240527 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_240526 ?auto_240527 ) ( ON-TABLE ?auto_240521 ) ( ON ?auto_240522 ?auto_240521 ) ( ON ?auto_240523 ?auto_240522 ) ( not ( = ?auto_240521 ?auto_240522 ) ) ( not ( = ?auto_240521 ?auto_240523 ) ) ( not ( = ?auto_240521 ?auto_240524 ) ) ( not ( = ?auto_240521 ?auto_240525 ) ) ( not ( = ?auto_240521 ?auto_240526 ) ) ( not ( = ?auto_240521 ?auto_240527 ) ) ( not ( = ?auto_240522 ?auto_240523 ) ) ( not ( = ?auto_240522 ?auto_240524 ) ) ( not ( = ?auto_240522 ?auto_240525 ) ) ( not ( = ?auto_240522 ?auto_240526 ) ) ( not ( = ?auto_240522 ?auto_240527 ) ) ( not ( = ?auto_240523 ?auto_240524 ) ) ( not ( = ?auto_240523 ?auto_240525 ) ) ( not ( = ?auto_240523 ?auto_240526 ) ) ( not ( = ?auto_240523 ?auto_240527 ) ) ( not ( = ?auto_240524 ?auto_240525 ) ) ( not ( = ?auto_240524 ?auto_240526 ) ) ( not ( = ?auto_240524 ?auto_240527 ) ) ( not ( = ?auto_240525 ?auto_240526 ) ) ( not ( = ?auto_240525 ?auto_240527 ) ) ( not ( = ?auto_240526 ?auto_240527 ) ) ( ON ?auto_240525 ?auto_240526 ) ( CLEAR ?auto_240523 ) ( ON ?auto_240524 ?auto_240525 ) ( CLEAR ?auto_240524 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_240521 ?auto_240522 ?auto_240523 ?auto_240524 )
      ( MAKE-6PILE ?auto_240521 ?auto_240522 ?auto_240523 ?auto_240524 ?auto_240525 ?auto_240526 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_240534 - BLOCK
      ?auto_240535 - BLOCK
      ?auto_240536 - BLOCK
      ?auto_240537 - BLOCK
      ?auto_240538 - BLOCK
      ?auto_240539 - BLOCK
    )
    :vars
    (
      ?auto_240540 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_240539 ?auto_240540 ) ( ON-TABLE ?auto_240534 ) ( ON ?auto_240535 ?auto_240534 ) ( not ( = ?auto_240534 ?auto_240535 ) ) ( not ( = ?auto_240534 ?auto_240536 ) ) ( not ( = ?auto_240534 ?auto_240537 ) ) ( not ( = ?auto_240534 ?auto_240538 ) ) ( not ( = ?auto_240534 ?auto_240539 ) ) ( not ( = ?auto_240534 ?auto_240540 ) ) ( not ( = ?auto_240535 ?auto_240536 ) ) ( not ( = ?auto_240535 ?auto_240537 ) ) ( not ( = ?auto_240535 ?auto_240538 ) ) ( not ( = ?auto_240535 ?auto_240539 ) ) ( not ( = ?auto_240535 ?auto_240540 ) ) ( not ( = ?auto_240536 ?auto_240537 ) ) ( not ( = ?auto_240536 ?auto_240538 ) ) ( not ( = ?auto_240536 ?auto_240539 ) ) ( not ( = ?auto_240536 ?auto_240540 ) ) ( not ( = ?auto_240537 ?auto_240538 ) ) ( not ( = ?auto_240537 ?auto_240539 ) ) ( not ( = ?auto_240537 ?auto_240540 ) ) ( not ( = ?auto_240538 ?auto_240539 ) ) ( not ( = ?auto_240538 ?auto_240540 ) ) ( not ( = ?auto_240539 ?auto_240540 ) ) ( ON ?auto_240538 ?auto_240539 ) ( ON ?auto_240537 ?auto_240538 ) ( CLEAR ?auto_240535 ) ( ON ?auto_240536 ?auto_240537 ) ( CLEAR ?auto_240536 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_240534 ?auto_240535 ?auto_240536 )
      ( MAKE-6PILE ?auto_240534 ?auto_240535 ?auto_240536 ?auto_240537 ?auto_240538 ?auto_240539 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_240547 - BLOCK
      ?auto_240548 - BLOCK
      ?auto_240549 - BLOCK
      ?auto_240550 - BLOCK
      ?auto_240551 - BLOCK
      ?auto_240552 - BLOCK
    )
    :vars
    (
      ?auto_240553 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_240552 ?auto_240553 ) ( ON-TABLE ?auto_240547 ) ( ON ?auto_240548 ?auto_240547 ) ( not ( = ?auto_240547 ?auto_240548 ) ) ( not ( = ?auto_240547 ?auto_240549 ) ) ( not ( = ?auto_240547 ?auto_240550 ) ) ( not ( = ?auto_240547 ?auto_240551 ) ) ( not ( = ?auto_240547 ?auto_240552 ) ) ( not ( = ?auto_240547 ?auto_240553 ) ) ( not ( = ?auto_240548 ?auto_240549 ) ) ( not ( = ?auto_240548 ?auto_240550 ) ) ( not ( = ?auto_240548 ?auto_240551 ) ) ( not ( = ?auto_240548 ?auto_240552 ) ) ( not ( = ?auto_240548 ?auto_240553 ) ) ( not ( = ?auto_240549 ?auto_240550 ) ) ( not ( = ?auto_240549 ?auto_240551 ) ) ( not ( = ?auto_240549 ?auto_240552 ) ) ( not ( = ?auto_240549 ?auto_240553 ) ) ( not ( = ?auto_240550 ?auto_240551 ) ) ( not ( = ?auto_240550 ?auto_240552 ) ) ( not ( = ?auto_240550 ?auto_240553 ) ) ( not ( = ?auto_240551 ?auto_240552 ) ) ( not ( = ?auto_240551 ?auto_240553 ) ) ( not ( = ?auto_240552 ?auto_240553 ) ) ( ON ?auto_240551 ?auto_240552 ) ( ON ?auto_240550 ?auto_240551 ) ( CLEAR ?auto_240548 ) ( ON ?auto_240549 ?auto_240550 ) ( CLEAR ?auto_240549 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_240547 ?auto_240548 ?auto_240549 )
      ( MAKE-6PILE ?auto_240547 ?auto_240548 ?auto_240549 ?auto_240550 ?auto_240551 ?auto_240552 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_240560 - BLOCK
      ?auto_240561 - BLOCK
      ?auto_240562 - BLOCK
      ?auto_240563 - BLOCK
      ?auto_240564 - BLOCK
      ?auto_240565 - BLOCK
    )
    :vars
    (
      ?auto_240566 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_240565 ?auto_240566 ) ( ON-TABLE ?auto_240560 ) ( not ( = ?auto_240560 ?auto_240561 ) ) ( not ( = ?auto_240560 ?auto_240562 ) ) ( not ( = ?auto_240560 ?auto_240563 ) ) ( not ( = ?auto_240560 ?auto_240564 ) ) ( not ( = ?auto_240560 ?auto_240565 ) ) ( not ( = ?auto_240560 ?auto_240566 ) ) ( not ( = ?auto_240561 ?auto_240562 ) ) ( not ( = ?auto_240561 ?auto_240563 ) ) ( not ( = ?auto_240561 ?auto_240564 ) ) ( not ( = ?auto_240561 ?auto_240565 ) ) ( not ( = ?auto_240561 ?auto_240566 ) ) ( not ( = ?auto_240562 ?auto_240563 ) ) ( not ( = ?auto_240562 ?auto_240564 ) ) ( not ( = ?auto_240562 ?auto_240565 ) ) ( not ( = ?auto_240562 ?auto_240566 ) ) ( not ( = ?auto_240563 ?auto_240564 ) ) ( not ( = ?auto_240563 ?auto_240565 ) ) ( not ( = ?auto_240563 ?auto_240566 ) ) ( not ( = ?auto_240564 ?auto_240565 ) ) ( not ( = ?auto_240564 ?auto_240566 ) ) ( not ( = ?auto_240565 ?auto_240566 ) ) ( ON ?auto_240564 ?auto_240565 ) ( ON ?auto_240563 ?auto_240564 ) ( ON ?auto_240562 ?auto_240563 ) ( CLEAR ?auto_240560 ) ( ON ?auto_240561 ?auto_240562 ) ( CLEAR ?auto_240561 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_240560 ?auto_240561 )
      ( MAKE-6PILE ?auto_240560 ?auto_240561 ?auto_240562 ?auto_240563 ?auto_240564 ?auto_240565 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_240573 - BLOCK
      ?auto_240574 - BLOCK
      ?auto_240575 - BLOCK
      ?auto_240576 - BLOCK
      ?auto_240577 - BLOCK
      ?auto_240578 - BLOCK
    )
    :vars
    (
      ?auto_240579 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_240578 ?auto_240579 ) ( ON-TABLE ?auto_240573 ) ( not ( = ?auto_240573 ?auto_240574 ) ) ( not ( = ?auto_240573 ?auto_240575 ) ) ( not ( = ?auto_240573 ?auto_240576 ) ) ( not ( = ?auto_240573 ?auto_240577 ) ) ( not ( = ?auto_240573 ?auto_240578 ) ) ( not ( = ?auto_240573 ?auto_240579 ) ) ( not ( = ?auto_240574 ?auto_240575 ) ) ( not ( = ?auto_240574 ?auto_240576 ) ) ( not ( = ?auto_240574 ?auto_240577 ) ) ( not ( = ?auto_240574 ?auto_240578 ) ) ( not ( = ?auto_240574 ?auto_240579 ) ) ( not ( = ?auto_240575 ?auto_240576 ) ) ( not ( = ?auto_240575 ?auto_240577 ) ) ( not ( = ?auto_240575 ?auto_240578 ) ) ( not ( = ?auto_240575 ?auto_240579 ) ) ( not ( = ?auto_240576 ?auto_240577 ) ) ( not ( = ?auto_240576 ?auto_240578 ) ) ( not ( = ?auto_240576 ?auto_240579 ) ) ( not ( = ?auto_240577 ?auto_240578 ) ) ( not ( = ?auto_240577 ?auto_240579 ) ) ( not ( = ?auto_240578 ?auto_240579 ) ) ( ON ?auto_240577 ?auto_240578 ) ( ON ?auto_240576 ?auto_240577 ) ( ON ?auto_240575 ?auto_240576 ) ( CLEAR ?auto_240573 ) ( ON ?auto_240574 ?auto_240575 ) ( CLEAR ?auto_240574 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_240573 ?auto_240574 )
      ( MAKE-6PILE ?auto_240573 ?auto_240574 ?auto_240575 ?auto_240576 ?auto_240577 ?auto_240578 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_240586 - BLOCK
      ?auto_240587 - BLOCK
      ?auto_240588 - BLOCK
      ?auto_240589 - BLOCK
      ?auto_240590 - BLOCK
      ?auto_240591 - BLOCK
    )
    :vars
    (
      ?auto_240592 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_240591 ?auto_240592 ) ( not ( = ?auto_240586 ?auto_240587 ) ) ( not ( = ?auto_240586 ?auto_240588 ) ) ( not ( = ?auto_240586 ?auto_240589 ) ) ( not ( = ?auto_240586 ?auto_240590 ) ) ( not ( = ?auto_240586 ?auto_240591 ) ) ( not ( = ?auto_240586 ?auto_240592 ) ) ( not ( = ?auto_240587 ?auto_240588 ) ) ( not ( = ?auto_240587 ?auto_240589 ) ) ( not ( = ?auto_240587 ?auto_240590 ) ) ( not ( = ?auto_240587 ?auto_240591 ) ) ( not ( = ?auto_240587 ?auto_240592 ) ) ( not ( = ?auto_240588 ?auto_240589 ) ) ( not ( = ?auto_240588 ?auto_240590 ) ) ( not ( = ?auto_240588 ?auto_240591 ) ) ( not ( = ?auto_240588 ?auto_240592 ) ) ( not ( = ?auto_240589 ?auto_240590 ) ) ( not ( = ?auto_240589 ?auto_240591 ) ) ( not ( = ?auto_240589 ?auto_240592 ) ) ( not ( = ?auto_240590 ?auto_240591 ) ) ( not ( = ?auto_240590 ?auto_240592 ) ) ( not ( = ?auto_240591 ?auto_240592 ) ) ( ON ?auto_240590 ?auto_240591 ) ( ON ?auto_240589 ?auto_240590 ) ( ON ?auto_240588 ?auto_240589 ) ( ON ?auto_240587 ?auto_240588 ) ( ON ?auto_240586 ?auto_240587 ) ( CLEAR ?auto_240586 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_240586 )
      ( MAKE-6PILE ?auto_240586 ?auto_240587 ?auto_240588 ?auto_240589 ?auto_240590 ?auto_240591 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_240599 - BLOCK
      ?auto_240600 - BLOCK
      ?auto_240601 - BLOCK
      ?auto_240602 - BLOCK
      ?auto_240603 - BLOCK
      ?auto_240604 - BLOCK
    )
    :vars
    (
      ?auto_240605 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_240604 ?auto_240605 ) ( not ( = ?auto_240599 ?auto_240600 ) ) ( not ( = ?auto_240599 ?auto_240601 ) ) ( not ( = ?auto_240599 ?auto_240602 ) ) ( not ( = ?auto_240599 ?auto_240603 ) ) ( not ( = ?auto_240599 ?auto_240604 ) ) ( not ( = ?auto_240599 ?auto_240605 ) ) ( not ( = ?auto_240600 ?auto_240601 ) ) ( not ( = ?auto_240600 ?auto_240602 ) ) ( not ( = ?auto_240600 ?auto_240603 ) ) ( not ( = ?auto_240600 ?auto_240604 ) ) ( not ( = ?auto_240600 ?auto_240605 ) ) ( not ( = ?auto_240601 ?auto_240602 ) ) ( not ( = ?auto_240601 ?auto_240603 ) ) ( not ( = ?auto_240601 ?auto_240604 ) ) ( not ( = ?auto_240601 ?auto_240605 ) ) ( not ( = ?auto_240602 ?auto_240603 ) ) ( not ( = ?auto_240602 ?auto_240604 ) ) ( not ( = ?auto_240602 ?auto_240605 ) ) ( not ( = ?auto_240603 ?auto_240604 ) ) ( not ( = ?auto_240603 ?auto_240605 ) ) ( not ( = ?auto_240604 ?auto_240605 ) ) ( ON ?auto_240603 ?auto_240604 ) ( ON ?auto_240602 ?auto_240603 ) ( ON ?auto_240601 ?auto_240602 ) ( ON ?auto_240600 ?auto_240601 ) ( ON ?auto_240599 ?auto_240600 ) ( CLEAR ?auto_240599 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_240599 )
      ( MAKE-6PILE ?auto_240599 ?auto_240600 ?auto_240601 ?auto_240602 ?auto_240603 ?auto_240604 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_240613 - BLOCK
      ?auto_240614 - BLOCK
      ?auto_240615 - BLOCK
      ?auto_240616 - BLOCK
      ?auto_240617 - BLOCK
      ?auto_240618 - BLOCK
      ?auto_240619 - BLOCK
    )
    :vars
    (
      ?auto_240620 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_240618 ) ( ON ?auto_240619 ?auto_240620 ) ( CLEAR ?auto_240619 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_240613 ) ( ON ?auto_240614 ?auto_240613 ) ( ON ?auto_240615 ?auto_240614 ) ( ON ?auto_240616 ?auto_240615 ) ( ON ?auto_240617 ?auto_240616 ) ( ON ?auto_240618 ?auto_240617 ) ( not ( = ?auto_240613 ?auto_240614 ) ) ( not ( = ?auto_240613 ?auto_240615 ) ) ( not ( = ?auto_240613 ?auto_240616 ) ) ( not ( = ?auto_240613 ?auto_240617 ) ) ( not ( = ?auto_240613 ?auto_240618 ) ) ( not ( = ?auto_240613 ?auto_240619 ) ) ( not ( = ?auto_240613 ?auto_240620 ) ) ( not ( = ?auto_240614 ?auto_240615 ) ) ( not ( = ?auto_240614 ?auto_240616 ) ) ( not ( = ?auto_240614 ?auto_240617 ) ) ( not ( = ?auto_240614 ?auto_240618 ) ) ( not ( = ?auto_240614 ?auto_240619 ) ) ( not ( = ?auto_240614 ?auto_240620 ) ) ( not ( = ?auto_240615 ?auto_240616 ) ) ( not ( = ?auto_240615 ?auto_240617 ) ) ( not ( = ?auto_240615 ?auto_240618 ) ) ( not ( = ?auto_240615 ?auto_240619 ) ) ( not ( = ?auto_240615 ?auto_240620 ) ) ( not ( = ?auto_240616 ?auto_240617 ) ) ( not ( = ?auto_240616 ?auto_240618 ) ) ( not ( = ?auto_240616 ?auto_240619 ) ) ( not ( = ?auto_240616 ?auto_240620 ) ) ( not ( = ?auto_240617 ?auto_240618 ) ) ( not ( = ?auto_240617 ?auto_240619 ) ) ( not ( = ?auto_240617 ?auto_240620 ) ) ( not ( = ?auto_240618 ?auto_240619 ) ) ( not ( = ?auto_240618 ?auto_240620 ) ) ( not ( = ?auto_240619 ?auto_240620 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_240619 ?auto_240620 )
      ( !STACK ?auto_240619 ?auto_240618 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_240628 - BLOCK
      ?auto_240629 - BLOCK
      ?auto_240630 - BLOCK
      ?auto_240631 - BLOCK
      ?auto_240632 - BLOCK
      ?auto_240633 - BLOCK
      ?auto_240634 - BLOCK
    )
    :vars
    (
      ?auto_240635 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_240633 ) ( ON ?auto_240634 ?auto_240635 ) ( CLEAR ?auto_240634 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_240628 ) ( ON ?auto_240629 ?auto_240628 ) ( ON ?auto_240630 ?auto_240629 ) ( ON ?auto_240631 ?auto_240630 ) ( ON ?auto_240632 ?auto_240631 ) ( ON ?auto_240633 ?auto_240632 ) ( not ( = ?auto_240628 ?auto_240629 ) ) ( not ( = ?auto_240628 ?auto_240630 ) ) ( not ( = ?auto_240628 ?auto_240631 ) ) ( not ( = ?auto_240628 ?auto_240632 ) ) ( not ( = ?auto_240628 ?auto_240633 ) ) ( not ( = ?auto_240628 ?auto_240634 ) ) ( not ( = ?auto_240628 ?auto_240635 ) ) ( not ( = ?auto_240629 ?auto_240630 ) ) ( not ( = ?auto_240629 ?auto_240631 ) ) ( not ( = ?auto_240629 ?auto_240632 ) ) ( not ( = ?auto_240629 ?auto_240633 ) ) ( not ( = ?auto_240629 ?auto_240634 ) ) ( not ( = ?auto_240629 ?auto_240635 ) ) ( not ( = ?auto_240630 ?auto_240631 ) ) ( not ( = ?auto_240630 ?auto_240632 ) ) ( not ( = ?auto_240630 ?auto_240633 ) ) ( not ( = ?auto_240630 ?auto_240634 ) ) ( not ( = ?auto_240630 ?auto_240635 ) ) ( not ( = ?auto_240631 ?auto_240632 ) ) ( not ( = ?auto_240631 ?auto_240633 ) ) ( not ( = ?auto_240631 ?auto_240634 ) ) ( not ( = ?auto_240631 ?auto_240635 ) ) ( not ( = ?auto_240632 ?auto_240633 ) ) ( not ( = ?auto_240632 ?auto_240634 ) ) ( not ( = ?auto_240632 ?auto_240635 ) ) ( not ( = ?auto_240633 ?auto_240634 ) ) ( not ( = ?auto_240633 ?auto_240635 ) ) ( not ( = ?auto_240634 ?auto_240635 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_240634 ?auto_240635 )
      ( !STACK ?auto_240634 ?auto_240633 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_240643 - BLOCK
      ?auto_240644 - BLOCK
      ?auto_240645 - BLOCK
      ?auto_240646 - BLOCK
      ?auto_240647 - BLOCK
      ?auto_240648 - BLOCK
      ?auto_240649 - BLOCK
    )
    :vars
    (
      ?auto_240650 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_240649 ?auto_240650 ) ( ON-TABLE ?auto_240643 ) ( ON ?auto_240644 ?auto_240643 ) ( ON ?auto_240645 ?auto_240644 ) ( ON ?auto_240646 ?auto_240645 ) ( ON ?auto_240647 ?auto_240646 ) ( not ( = ?auto_240643 ?auto_240644 ) ) ( not ( = ?auto_240643 ?auto_240645 ) ) ( not ( = ?auto_240643 ?auto_240646 ) ) ( not ( = ?auto_240643 ?auto_240647 ) ) ( not ( = ?auto_240643 ?auto_240648 ) ) ( not ( = ?auto_240643 ?auto_240649 ) ) ( not ( = ?auto_240643 ?auto_240650 ) ) ( not ( = ?auto_240644 ?auto_240645 ) ) ( not ( = ?auto_240644 ?auto_240646 ) ) ( not ( = ?auto_240644 ?auto_240647 ) ) ( not ( = ?auto_240644 ?auto_240648 ) ) ( not ( = ?auto_240644 ?auto_240649 ) ) ( not ( = ?auto_240644 ?auto_240650 ) ) ( not ( = ?auto_240645 ?auto_240646 ) ) ( not ( = ?auto_240645 ?auto_240647 ) ) ( not ( = ?auto_240645 ?auto_240648 ) ) ( not ( = ?auto_240645 ?auto_240649 ) ) ( not ( = ?auto_240645 ?auto_240650 ) ) ( not ( = ?auto_240646 ?auto_240647 ) ) ( not ( = ?auto_240646 ?auto_240648 ) ) ( not ( = ?auto_240646 ?auto_240649 ) ) ( not ( = ?auto_240646 ?auto_240650 ) ) ( not ( = ?auto_240647 ?auto_240648 ) ) ( not ( = ?auto_240647 ?auto_240649 ) ) ( not ( = ?auto_240647 ?auto_240650 ) ) ( not ( = ?auto_240648 ?auto_240649 ) ) ( not ( = ?auto_240648 ?auto_240650 ) ) ( not ( = ?auto_240649 ?auto_240650 ) ) ( CLEAR ?auto_240647 ) ( ON ?auto_240648 ?auto_240649 ) ( CLEAR ?auto_240648 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_240643 ?auto_240644 ?auto_240645 ?auto_240646 ?auto_240647 ?auto_240648 )
      ( MAKE-7PILE ?auto_240643 ?auto_240644 ?auto_240645 ?auto_240646 ?auto_240647 ?auto_240648 ?auto_240649 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_240658 - BLOCK
      ?auto_240659 - BLOCK
      ?auto_240660 - BLOCK
      ?auto_240661 - BLOCK
      ?auto_240662 - BLOCK
      ?auto_240663 - BLOCK
      ?auto_240664 - BLOCK
    )
    :vars
    (
      ?auto_240665 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_240664 ?auto_240665 ) ( ON-TABLE ?auto_240658 ) ( ON ?auto_240659 ?auto_240658 ) ( ON ?auto_240660 ?auto_240659 ) ( ON ?auto_240661 ?auto_240660 ) ( ON ?auto_240662 ?auto_240661 ) ( not ( = ?auto_240658 ?auto_240659 ) ) ( not ( = ?auto_240658 ?auto_240660 ) ) ( not ( = ?auto_240658 ?auto_240661 ) ) ( not ( = ?auto_240658 ?auto_240662 ) ) ( not ( = ?auto_240658 ?auto_240663 ) ) ( not ( = ?auto_240658 ?auto_240664 ) ) ( not ( = ?auto_240658 ?auto_240665 ) ) ( not ( = ?auto_240659 ?auto_240660 ) ) ( not ( = ?auto_240659 ?auto_240661 ) ) ( not ( = ?auto_240659 ?auto_240662 ) ) ( not ( = ?auto_240659 ?auto_240663 ) ) ( not ( = ?auto_240659 ?auto_240664 ) ) ( not ( = ?auto_240659 ?auto_240665 ) ) ( not ( = ?auto_240660 ?auto_240661 ) ) ( not ( = ?auto_240660 ?auto_240662 ) ) ( not ( = ?auto_240660 ?auto_240663 ) ) ( not ( = ?auto_240660 ?auto_240664 ) ) ( not ( = ?auto_240660 ?auto_240665 ) ) ( not ( = ?auto_240661 ?auto_240662 ) ) ( not ( = ?auto_240661 ?auto_240663 ) ) ( not ( = ?auto_240661 ?auto_240664 ) ) ( not ( = ?auto_240661 ?auto_240665 ) ) ( not ( = ?auto_240662 ?auto_240663 ) ) ( not ( = ?auto_240662 ?auto_240664 ) ) ( not ( = ?auto_240662 ?auto_240665 ) ) ( not ( = ?auto_240663 ?auto_240664 ) ) ( not ( = ?auto_240663 ?auto_240665 ) ) ( not ( = ?auto_240664 ?auto_240665 ) ) ( CLEAR ?auto_240662 ) ( ON ?auto_240663 ?auto_240664 ) ( CLEAR ?auto_240663 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_240658 ?auto_240659 ?auto_240660 ?auto_240661 ?auto_240662 ?auto_240663 )
      ( MAKE-7PILE ?auto_240658 ?auto_240659 ?auto_240660 ?auto_240661 ?auto_240662 ?auto_240663 ?auto_240664 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_240673 - BLOCK
      ?auto_240674 - BLOCK
      ?auto_240675 - BLOCK
      ?auto_240676 - BLOCK
      ?auto_240677 - BLOCK
      ?auto_240678 - BLOCK
      ?auto_240679 - BLOCK
    )
    :vars
    (
      ?auto_240680 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_240679 ?auto_240680 ) ( ON-TABLE ?auto_240673 ) ( ON ?auto_240674 ?auto_240673 ) ( ON ?auto_240675 ?auto_240674 ) ( ON ?auto_240676 ?auto_240675 ) ( not ( = ?auto_240673 ?auto_240674 ) ) ( not ( = ?auto_240673 ?auto_240675 ) ) ( not ( = ?auto_240673 ?auto_240676 ) ) ( not ( = ?auto_240673 ?auto_240677 ) ) ( not ( = ?auto_240673 ?auto_240678 ) ) ( not ( = ?auto_240673 ?auto_240679 ) ) ( not ( = ?auto_240673 ?auto_240680 ) ) ( not ( = ?auto_240674 ?auto_240675 ) ) ( not ( = ?auto_240674 ?auto_240676 ) ) ( not ( = ?auto_240674 ?auto_240677 ) ) ( not ( = ?auto_240674 ?auto_240678 ) ) ( not ( = ?auto_240674 ?auto_240679 ) ) ( not ( = ?auto_240674 ?auto_240680 ) ) ( not ( = ?auto_240675 ?auto_240676 ) ) ( not ( = ?auto_240675 ?auto_240677 ) ) ( not ( = ?auto_240675 ?auto_240678 ) ) ( not ( = ?auto_240675 ?auto_240679 ) ) ( not ( = ?auto_240675 ?auto_240680 ) ) ( not ( = ?auto_240676 ?auto_240677 ) ) ( not ( = ?auto_240676 ?auto_240678 ) ) ( not ( = ?auto_240676 ?auto_240679 ) ) ( not ( = ?auto_240676 ?auto_240680 ) ) ( not ( = ?auto_240677 ?auto_240678 ) ) ( not ( = ?auto_240677 ?auto_240679 ) ) ( not ( = ?auto_240677 ?auto_240680 ) ) ( not ( = ?auto_240678 ?auto_240679 ) ) ( not ( = ?auto_240678 ?auto_240680 ) ) ( not ( = ?auto_240679 ?auto_240680 ) ) ( ON ?auto_240678 ?auto_240679 ) ( CLEAR ?auto_240676 ) ( ON ?auto_240677 ?auto_240678 ) ( CLEAR ?auto_240677 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_240673 ?auto_240674 ?auto_240675 ?auto_240676 ?auto_240677 )
      ( MAKE-7PILE ?auto_240673 ?auto_240674 ?auto_240675 ?auto_240676 ?auto_240677 ?auto_240678 ?auto_240679 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_240688 - BLOCK
      ?auto_240689 - BLOCK
      ?auto_240690 - BLOCK
      ?auto_240691 - BLOCK
      ?auto_240692 - BLOCK
      ?auto_240693 - BLOCK
      ?auto_240694 - BLOCK
    )
    :vars
    (
      ?auto_240695 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_240694 ?auto_240695 ) ( ON-TABLE ?auto_240688 ) ( ON ?auto_240689 ?auto_240688 ) ( ON ?auto_240690 ?auto_240689 ) ( ON ?auto_240691 ?auto_240690 ) ( not ( = ?auto_240688 ?auto_240689 ) ) ( not ( = ?auto_240688 ?auto_240690 ) ) ( not ( = ?auto_240688 ?auto_240691 ) ) ( not ( = ?auto_240688 ?auto_240692 ) ) ( not ( = ?auto_240688 ?auto_240693 ) ) ( not ( = ?auto_240688 ?auto_240694 ) ) ( not ( = ?auto_240688 ?auto_240695 ) ) ( not ( = ?auto_240689 ?auto_240690 ) ) ( not ( = ?auto_240689 ?auto_240691 ) ) ( not ( = ?auto_240689 ?auto_240692 ) ) ( not ( = ?auto_240689 ?auto_240693 ) ) ( not ( = ?auto_240689 ?auto_240694 ) ) ( not ( = ?auto_240689 ?auto_240695 ) ) ( not ( = ?auto_240690 ?auto_240691 ) ) ( not ( = ?auto_240690 ?auto_240692 ) ) ( not ( = ?auto_240690 ?auto_240693 ) ) ( not ( = ?auto_240690 ?auto_240694 ) ) ( not ( = ?auto_240690 ?auto_240695 ) ) ( not ( = ?auto_240691 ?auto_240692 ) ) ( not ( = ?auto_240691 ?auto_240693 ) ) ( not ( = ?auto_240691 ?auto_240694 ) ) ( not ( = ?auto_240691 ?auto_240695 ) ) ( not ( = ?auto_240692 ?auto_240693 ) ) ( not ( = ?auto_240692 ?auto_240694 ) ) ( not ( = ?auto_240692 ?auto_240695 ) ) ( not ( = ?auto_240693 ?auto_240694 ) ) ( not ( = ?auto_240693 ?auto_240695 ) ) ( not ( = ?auto_240694 ?auto_240695 ) ) ( ON ?auto_240693 ?auto_240694 ) ( CLEAR ?auto_240691 ) ( ON ?auto_240692 ?auto_240693 ) ( CLEAR ?auto_240692 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_240688 ?auto_240689 ?auto_240690 ?auto_240691 ?auto_240692 )
      ( MAKE-7PILE ?auto_240688 ?auto_240689 ?auto_240690 ?auto_240691 ?auto_240692 ?auto_240693 ?auto_240694 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_240703 - BLOCK
      ?auto_240704 - BLOCK
      ?auto_240705 - BLOCK
      ?auto_240706 - BLOCK
      ?auto_240707 - BLOCK
      ?auto_240708 - BLOCK
      ?auto_240709 - BLOCK
    )
    :vars
    (
      ?auto_240710 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_240709 ?auto_240710 ) ( ON-TABLE ?auto_240703 ) ( ON ?auto_240704 ?auto_240703 ) ( ON ?auto_240705 ?auto_240704 ) ( not ( = ?auto_240703 ?auto_240704 ) ) ( not ( = ?auto_240703 ?auto_240705 ) ) ( not ( = ?auto_240703 ?auto_240706 ) ) ( not ( = ?auto_240703 ?auto_240707 ) ) ( not ( = ?auto_240703 ?auto_240708 ) ) ( not ( = ?auto_240703 ?auto_240709 ) ) ( not ( = ?auto_240703 ?auto_240710 ) ) ( not ( = ?auto_240704 ?auto_240705 ) ) ( not ( = ?auto_240704 ?auto_240706 ) ) ( not ( = ?auto_240704 ?auto_240707 ) ) ( not ( = ?auto_240704 ?auto_240708 ) ) ( not ( = ?auto_240704 ?auto_240709 ) ) ( not ( = ?auto_240704 ?auto_240710 ) ) ( not ( = ?auto_240705 ?auto_240706 ) ) ( not ( = ?auto_240705 ?auto_240707 ) ) ( not ( = ?auto_240705 ?auto_240708 ) ) ( not ( = ?auto_240705 ?auto_240709 ) ) ( not ( = ?auto_240705 ?auto_240710 ) ) ( not ( = ?auto_240706 ?auto_240707 ) ) ( not ( = ?auto_240706 ?auto_240708 ) ) ( not ( = ?auto_240706 ?auto_240709 ) ) ( not ( = ?auto_240706 ?auto_240710 ) ) ( not ( = ?auto_240707 ?auto_240708 ) ) ( not ( = ?auto_240707 ?auto_240709 ) ) ( not ( = ?auto_240707 ?auto_240710 ) ) ( not ( = ?auto_240708 ?auto_240709 ) ) ( not ( = ?auto_240708 ?auto_240710 ) ) ( not ( = ?auto_240709 ?auto_240710 ) ) ( ON ?auto_240708 ?auto_240709 ) ( ON ?auto_240707 ?auto_240708 ) ( CLEAR ?auto_240705 ) ( ON ?auto_240706 ?auto_240707 ) ( CLEAR ?auto_240706 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_240703 ?auto_240704 ?auto_240705 ?auto_240706 )
      ( MAKE-7PILE ?auto_240703 ?auto_240704 ?auto_240705 ?auto_240706 ?auto_240707 ?auto_240708 ?auto_240709 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_240718 - BLOCK
      ?auto_240719 - BLOCK
      ?auto_240720 - BLOCK
      ?auto_240721 - BLOCK
      ?auto_240722 - BLOCK
      ?auto_240723 - BLOCK
      ?auto_240724 - BLOCK
    )
    :vars
    (
      ?auto_240725 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_240724 ?auto_240725 ) ( ON-TABLE ?auto_240718 ) ( ON ?auto_240719 ?auto_240718 ) ( ON ?auto_240720 ?auto_240719 ) ( not ( = ?auto_240718 ?auto_240719 ) ) ( not ( = ?auto_240718 ?auto_240720 ) ) ( not ( = ?auto_240718 ?auto_240721 ) ) ( not ( = ?auto_240718 ?auto_240722 ) ) ( not ( = ?auto_240718 ?auto_240723 ) ) ( not ( = ?auto_240718 ?auto_240724 ) ) ( not ( = ?auto_240718 ?auto_240725 ) ) ( not ( = ?auto_240719 ?auto_240720 ) ) ( not ( = ?auto_240719 ?auto_240721 ) ) ( not ( = ?auto_240719 ?auto_240722 ) ) ( not ( = ?auto_240719 ?auto_240723 ) ) ( not ( = ?auto_240719 ?auto_240724 ) ) ( not ( = ?auto_240719 ?auto_240725 ) ) ( not ( = ?auto_240720 ?auto_240721 ) ) ( not ( = ?auto_240720 ?auto_240722 ) ) ( not ( = ?auto_240720 ?auto_240723 ) ) ( not ( = ?auto_240720 ?auto_240724 ) ) ( not ( = ?auto_240720 ?auto_240725 ) ) ( not ( = ?auto_240721 ?auto_240722 ) ) ( not ( = ?auto_240721 ?auto_240723 ) ) ( not ( = ?auto_240721 ?auto_240724 ) ) ( not ( = ?auto_240721 ?auto_240725 ) ) ( not ( = ?auto_240722 ?auto_240723 ) ) ( not ( = ?auto_240722 ?auto_240724 ) ) ( not ( = ?auto_240722 ?auto_240725 ) ) ( not ( = ?auto_240723 ?auto_240724 ) ) ( not ( = ?auto_240723 ?auto_240725 ) ) ( not ( = ?auto_240724 ?auto_240725 ) ) ( ON ?auto_240723 ?auto_240724 ) ( ON ?auto_240722 ?auto_240723 ) ( CLEAR ?auto_240720 ) ( ON ?auto_240721 ?auto_240722 ) ( CLEAR ?auto_240721 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_240718 ?auto_240719 ?auto_240720 ?auto_240721 )
      ( MAKE-7PILE ?auto_240718 ?auto_240719 ?auto_240720 ?auto_240721 ?auto_240722 ?auto_240723 ?auto_240724 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_240733 - BLOCK
      ?auto_240734 - BLOCK
      ?auto_240735 - BLOCK
      ?auto_240736 - BLOCK
      ?auto_240737 - BLOCK
      ?auto_240738 - BLOCK
      ?auto_240739 - BLOCK
    )
    :vars
    (
      ?auto_240740 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_240739 ?auto_240740 ) ( ON-TABLE ?auto_240733 ) ( ON ?auto_240734 ?auto_240733 ) ( not ( = ?auto_240733 ?auto_240734 ) ) ( not ( = ?auto_240733 ?auto_240735 ) ) ( not ( = ?auto_240733 ?auto_240736 ) ) ( not ( = ?auto_240733 ?auto_240737 ) ) ( not ( = ?auto_240733 ?auto_240738 ) ) ( not ( = ?auto_240733 ?auto_240739 ) ) ( not ( = ?auto_240733 ?auto_240740 ) ) ( not ( = ?auto_240734 ?auto_240735 ) ) ( not ( = ?auto_240734 ?auto_240736 ) ) ( not ( = ?auto_240734 ?auto_240737 ) ) ( not ( = ?auto_240734 ?auto_240738 ) ) ( not ( = ?auto_240734 ?auto_240739 ) ) ( not ( = ?auto_240734 ?auto_240740 ) ) ( not ( = ?auto_240735 ?auto_240736 ) ) ( not ( = ?auto_240735 ?auto_240737 ) ) ( not ( = ?auto_240735 ?auto_240738 ) ) ( not ( = ?auto_240735 ?auto_240739 ) ) ( not ( = ?auto_240735 ?auto_240740 ) ) ( not ( = ?auto_240736 ?auto_240737 ) ) ( not ( = ?auto_240736 ?auto_240738 ) ) ( not ( = ?auto_240736 ?auto_240739 ) ) ( not ( = ?auto_240736 ?auto_240740 ) ) ( not ( = ?auto_240737 ?auto_240738 ) ) ( not ( = ?auto_240737 ?auto_240739 ) ) ( not ( = ?auto_240737 ?auto_240740 ) ) ( not ( = ?auto_240738 ?auto_240739 ) ) ( not ( = ?auto_240738 ?auto_240740 ) ) ( not ( = ?auto_240739 ?auto_240740 ) ) ( ON ?auto_240738 ?auto_240739 ) ( ON ?auto_240737 ?auto_240738 ) ( ON ?auto_240736 ?auto_240737 ) ( CLEAR ?auto_240734 ) ( ON ?auto_240735 ?auto_240736 ) ( CLEAR ?auto_240735 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_240733 ?auto_240734 ?auto_240735 )
      ( MAKE-7PILE ?auto_240733 ?auto_240734 ?auto_240735 ?auto_240736 ?auto_240737 ?auto_240738 ?auto_240739 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_240748 - BLOCK
      ?auto_240749 - BLOCK
      ?auto_240750 - BLOCK
      ?auto_240751 - BLOCK
      ?auto_240752 - BLOCK
      ?auto_240753 - BLOCK
      ?auto_240754 - BLOCK
    )
    :vars
    (
      ?auto_240755 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_240754 ?auto_240755 ) ( ON-TABLE ?auto_240748 ) ( ON ?auto_240749 ?auto_240748 ) ( not ( = ?auto_240748 ?auto_240749 ) ) ( not ( = ?auto_240748 ?auto_240750 ) ) ( not ( = ?auto_240748 ?auto_240751 ) ) ( not ( = ?auto_240748 ?auto_240752 ) ) ( not ( = ?auto_240748 ?auto_240753 ) ) ( not ( = ?auto_240748 ?auto_240754 ) ) ( not ( = ?auto_240748 ?auto_240755 ) ) ( not ( = ?auto_240749 ?auto_240750 ) ) ( not ( = ?auto_240749 ?auto_240751 ) ) ( not ( = ?auto_240749 ?auto_240752 ) ) ( not ( = ?auto_240749 ?auto_240753 ) ) ( not ( = ?auto_240749 ?auto_240754 ) ) ( not ( = ?auto_240749 ?auto_240755 ) ) ( not ( = ?auto_240750 ?auto_240751 ) ) ( not ( = ?auto_240750 ?auto_240752 ) ) ( not ( = ?auto_240750 ?auto_240753 ) ) ( not ( = ?auto_240750 ?auto_240754 ) ) ( not ( = ?auto_240750 ?auto_240755 ) ) ( not ( = ?auto_240751 ?auto_240752 ) ) ( not ( = ?auto_240751 ?auto_240753 ) ) ( not ( = ?auto_240751 ?auto_240754 ) ) ( not ( = ?auto_240751 ?auto_240755 ) ) ( not ( = ?auto_240752 ?auto_240753 ) ) ( not ( = ?auto_240752 ?auto_240754 ) ) ( not ( = ?auto_240752 ?auto_240755 ) ) ( not ( = ?auto_240753 ?auto_240754 ) ) ( not ( = ?auto_240753 ?auto_240755 ) ) ( not ( = ?auto_240754 ?auto_240755 ) ) ( ON ?auto_240753 ?auto_240754 ) ( ON ?auto_240752 ?auto_240753 ) ( ON ?auto_240751 ?auto_240752 ) ( CLEAR ?auto_240749 ) ( ON ?auto_240750 ?auto_240751 ) ( CLEAR ?auto_240750 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_240748 ?auto_240749 ?auto_240750 )
      ( MAKE-7PILE ?auto_240748 ?auto_240749 ?auto_240750 ?auto_240751 ?auto_240752 ?auto_240753 ?auto_240754 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_240763 - BLOCK
      ?auto_240764 - BLOCK
      ?auto_240765 - BLOCK
      ?auto_240766 - BLOCK
      ?auto_240767 - BLOCK
      ?auto_240768 - BLOCK
      ?auto_240769 - BLOCK
    )
    :vars
    (
      ?auto_240770 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_240769 ?auto_240770 ) ( ON-TABLE ?auto_240763 ) ( not ( = ?auto_240763 ?auto_240764 ) ) ( not ( = ?auto_240763 ?auto_240765 ) ) ( not ( = ?auto_240763 ?auto_240766 ) ) ( not ( = ?auto_240763 ?auto_240767 ) ) ( not ( = ?auto_240763 ?auto_240768 ) ) ( not ( = ?auto_240763 ?auto_240769 ) ) ( not ( = ?auto_240763 ?auto_240770 ) ) ( not ( = ?auto_240764 ?auto_240765 ) ) ( not ( = ?auto_240764 ?auto_240766 ) ) ( not ( = ?auto_240764 ?auto_240767 ) ) ( not ( = ?auto_240764 ?auto_240768 ) ) ( not ( = ?auto_240764 ?auto_240769 ) ) ( not ( = ?auto_240764 ?auto_240770 ) ) ( not ( = ?auto_240765 ?auto_240766 ) ) ( not ( = ?auto_240765 ?auto_240767 ) ) ( not ( = ?auto_240765 ?auto_240768 ) ) ( not ( = ?auto_240765 ?auto_240769 ) ) ( not ( = ?auto_240765 ?auto_240770 ) ) ( not ( = ?auto_240766 ?auto_240767 ) ) ( not ( = ?auto_240766 ?auto_240768 ) ) ( not ( = ?auto_240766 ?auto_240769 ) ) ( not ( = ?auto_240766 ?auto_240770 ) ) ( not ( = ?auto_240767 ?auto_240768 ) ) ( not ( = ?auto_240767 ?auto_240769 ) ) ( not ( = ?auto_240767 ?auto_240770 ) ) ( not ( = ?auto_240768 ?auto_240769 ) ) ( not ( = ?auto_240768 ?auto_240770 ) ) ( not ( = ?auto_240769 ?auto_240770 ) ) ( ON ?auto_240768 ?auto_240769 ) ( ON ?auto_240767 ?auto_240768 ) ( ON ?auto_240766 ?auto_240767 ) ( ON ?auto_240765 ?auto_240766 ) ( CLEAR ?auto_240763 ) ( ON ?auto_240764 ?auto_240765 ) ( CLEAR ?auto_240764 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_240763 ?auto_240764 )
      ( MAKE-7PILE ?auto_240763 ?auto_240764 ?auto_240765 ?auto_240766 ?auto_240767 ?auto_240768 ?auto_240769 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_240778 - BLOCK
      ?auto_240779 - BLOCK
      ?auto_240780 - BLOCK
      ?auto_240781 - BLOCK
      ?auto_240782 - BLOCK
      ?auto_240783 - BLOCK
      ?auto_240784 - BLOCK
    )
    :vars
    (
      ?auto_240785 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_240784 ?auto_240785 ) ( ON-TABLE ?auto_240778 ) ( not ( = ?auto_240778 ?auto_240779 ) ) ( not ( = ?auto_240778 ?auto_240780 ) ) ( not ( = ?auto_240778 ?auto_240781 ) ) ( not ( = ?auto_240778 ?auto_240782 ) ) ( not ( = ?auto_240778 ?auto_240783 ) ) ( not ( = ?auto_240778 ?auto_240784 ) ) ( not ( = ?auto_240778 ?auto_240785 ) ) ( not ( = ?auto_240779 ?auto_240780 ) ) ( not ( = ?auto_240779 ?auto_240781 ) ) ( not ( = ?auto_240779 ?auto_240782 ) ) ( not ( = ?auto_240779 ?auto_240783 ) ) ( not ( = ?auto_240779 ?auto_240784 ) ) ( not ( = ?auto_240779 ?auto_240785 ) ) ( not ( = ?auto_240780 ?auto_240781 ) ) ( not ( = ?auto_240780 ?auto_240782 ) ) ( not ( = ?auto_240780 ?auto_240783 ) ) ( not ( = ?auto_240780 ?auto_240784 ) ) ( not ( = ?auto_240780 ?auto_240785 ) ) ( not ( = ?auto_240781 ?auto_240782 ) ) ( not ( = ?auto_240781 ?auto_240783 ) ) ( not ( = ?auto_240781 ?auto_240784 ) ) ( not ( = ?auto_240781 ?auto_240785 ) ) ( not ( = ?auto_240782 ?auto_240783 ) ) ( not ( = ?auto_240782 ?auto_240784 ) ) ( not ( = ?auto_240782 ?auto_240785 ) ) ( not ( = ?auto_240783 ?auto_240784 ) ) ( not ( = ?auto_240783 ?auto_240785 ) ) ( not ( = ?auto_240784 ?auto_240785 ) ) ( ON ?auto_240783 ?auto_240784 ) ( ON ?auto_240782 ?auto_240783 ) ( ON ?auto_240781 ?auto_240782 ) ( ON ?auto_240780 ?auto_240781 ) ( CLEAR ?auto_240778 ) ( ON ?auto_240779 ?auto_240780 ) ( CLEAR ?auto_240779 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_240778 ?auto_240779 )
      ( MAKE-7PILE ?auto_240778 ?auto_240779 ?auto_240780 ?auto_240781 ?auto_240782 ?auto_240783 ?auto_240784 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_240793 - BLOCK
      ?auto_240794 - BLOCK
      ?auto_240795 - BLOCK
      ?auto_240796 - BLOCK
      ?auto_240797 - BLOCK
      ?auto_240798 - BLOCK
      ?auto_240799 - BLOCK
    )
    :vars
    (
      ?auto_240800 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_240799 ?auto_240800 ) ( not ( = ?auto_240793 ?auto_240794 ) ) ( not ( = ?auto_240793 ?auto_240795 ) ) ( not ( = ?auto_240793 ?auto_240796 ) ) ( not ( = ?auto_240793 ?auto_240797 ) ) ( not ( = ?auto_240793 ?auto_240798 ) ) ( not ( = ?auto_240793 ?auto_240799 ) ) ( not ( = ?auto_240793 ?auto_240800 ) ) ( not ( = ?auto_240794 ?auto_240795 ) ) ( not ( = ?auto_240794 ?auto_240796 ) ) ( not ( = ?auto_240794 ?auto_240797 ) ) ( not ( = ?auto_240794 ?auto_240798 ) ) ( not ( = ?auto_240794 ?auto_240799 ) ) ( not ( = ?auto_240794 ?auto_240800 ) ) ( not ( = ?auto_240795 ?auto_240796 ) ) ( not ( = ?auto_240795 ?auto_240797 ) ) ( not ( = ?auto_240795 ?auto_240798 ) ) ( not ( = ?auto_240795 ?auto_240799 ) ) ( not ( = ?auto_240795 ?auto_240800 ) ) ( not ( = ?auto_240796 ?auto_240797 ) ) ( not ( = ?auto_240796 ?auto_240798 ) ) ( not ( = ?auto_240796 ?auto_240799 ) ) ( not ( = ?auto_240796 ?auto_240800 ) ) ( not ( = ?auto_240797 ?auto_240798 ) ) ( not ( = ?auto_240797 ?auto_240799 ) ) ( not ( = ?auto_240797 ?auto_240800 ) ) ( not ( = ?auto_240798 ?auto_240799 ) ) ( not ( = ?auto_240798 ?auto_240800 ) ) ( not ( = ?auto_240799 ?auto_240800 ) ) ( ON ?auto_240798 ?auto_240799 ) ( ON ?auto_240797 ?auto_240798 ) ( ON ?auto_240796 ?auto_240797 ) ( ON ?auto_240795 ?auto_240796 ) ( ON ?auto_240794 ?auto_240795 ) ( ON ?auto_240793 ?auto_240794 ) ( CLEAR ?auto_240793 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_240793 )
      ( MAKE-7PILE ?auto_240793 ?auto_240794 ?auto_240795 ?auto_240796 ?auto_240797 ?auto_240798 ?auto_240799 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_240808 - BLOCK
      ?auto_240809 - BLOCK
      ?auto_240810 - BLOCK
      ?auto_240811 - BLOCK
      ?auto_240812 - BLOCK
      ?auto_240813 - BLOCK
      ?auto_240814 - BLOCK
    )
    :vars
    (
      ?auto_240815 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_240814 ?auto_240815 ) ( not ( = ?auto_240808 ?auto_240809 ) ) ( not ( = ?auto_240808 ?auto_240810 ) ) ( not ( = ?auto_240808 ?auto_240811 ) ) ( not ( = ?auto_240808 ?auto_240812 ) ) ( not ( = ?auto_240808 ?auto_240813 ) ) ( not ( = ?auto_240808 ?auto_240814 ) ) ( not ( = ?auto_240808 ?auto_240815 ) ) ( not ( = ?auto_240809 ?auto_240810 ) ) ( not ( = ?auto_240809 ?auto_240811 ) ) ( not ( = ?auto_240809 ?auto_240812 ) ) ( not ( = ?auto_240809 ?auto_240813 ) ) ( not ( = ?auto_240809 ?auto_240814 ) ) ( not ( = ?auto_240809 ?auto_240815 ) ) ( not ( = ?auto_240810 ?auto_240811 ) ) ( not ( = ?auto_240810 ?auto_240812 ) ) ( not ( = ?auto_240810 ?auto_240813 ) ) ( not ( = ?auto_240810 ?auto_240814 ) ) ( not ( = ?auto_240810 ?auto_240815 ) ) ( not ( = ?auto_240811 ?auto_240812 ) ) ( not ( = ?auto_240811 ?auto_240813 ) ) ( not ( = ?auto_240811 ?auto_240814 ) ) ( not ( = ?auto_240811 ?auto_240815 ) ) ( not ( = ?auto_240812 ?auto_240813 ) ) ( not ( = ?auto_240812 ?auto_240814 ) ) ( not ( = ?auto_240812 ?auto_240815 ) ) ( not ( = ?auto_240813 ?auto_240814 ) ) ( not ( = ?auto_240813 ?auto_240815 ) ) ( not ( = ?auto_240814 ?auto_240815 ) ) ( ON ?auto_240813 ?auto_240814 ) ( ON ?auto_240812 ?auto_240813 ) ( ON ?auto_240811 ?auto_240812 ) ( ON ?auto_240810 ?auto_240811 ) ( ON ?auto_240809 ?auto_240810 ) ( ON ?auto_240808 ?auto_240809 ) ( CLEAR ?auto_240808 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_240808 )
      ( MAKE-7PILE ?auto_240808 ?auto_240809 ?auto_240810 ?auto_240811 ?auto_240812 ?auto_240813 ?auto_240814 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_240824 - BLOCK
      ?auto_240825 - BLOCK
      ?auto_240826 - BLOCK
      ?auto_240827 - BLOCK
      ?auto_240828 - BLOCK
      ?auto_240829 - BLOCK
      ?auto_240830 - BLOCK
      ?auto_240831 - BLOCK
    )
    :vars
    (
      ?auto_240832 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_240830 ) ( ON ?auto_240831 ?auto_240832 ) ( CLEAR ?auto_240831 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_240824 ) ( ON ?auto_240825 ?auto_240824 ) ( ON ?auto_240826 ?auto_240825 ) ( ON ?auto_240827 ?auto_240826 ) ( ON ?auto_240828 ?auto_240827 ) ( ON ?auto_240829 ?auto_240828 ) ( ON ?auto_240830 ?auto_240829 ) ( not ( = ?auto_240824 ?auto_240825 ) ) ( not ( = ?auto_240824 ?auto_240826 ) ) ( not ( = ?auto_240824 ?auto_240827 ) ) ( not ( = ?auto_240824 ?auto_240828 ) ) ( not ( = ?auto_240824 ?auto_240829 ) ) ( not ( = ?auto_240824 ?auto_240830 ) ) ( not ( = ?auto_240824 ?auto_240831 ) ) ( not ( = ?auto_240824 ?auto_240832 ) ) ( not ( = ?auto_240825 ?auto_240826 ) ) ( not ( = ?auto_240825 ?auto_240827 ) ) ( not ( = ?auto_240825 ?auto_240828 ) ) ( not ( = ?auto_240825 ?auto_240829 ) ) ( not ( = ?auto_240825 ?auto_240830 ) ) ( not ( = ?auto_240825 ?auto_240831 ) ) ( not ( = ?auto_240825 ?auto_240832 ) ) ( not ( = ?auto_240826 ?auto_240827 ) ) ( not ( = ?auto_240826 ?auto_240828 ) ) ( not ( = ?auto_240826 ?auto_240829 ) ) ( not ( = ?auto_240826 ?auto_240830 ) ) ( not ( = ?auto_240826 ?auto_240831 ) ) ( not ( = ?auto_240826 ?auto_240832 ) ) ( not ( = ?auto_240827 ?auto_240828 ) ) ( not ( = ?auto_240827 ?auto_240829 ) ) ( not ( = ?auto_240827 ?auto_240830 ) ) ( not ( = ?auto_240827 ?auto_240831 ) ) ( not ( = ?auto_240827 ?auto_240832 ) ) ( not ( = ?auto_240828 ?auto_240829 ) ) ( not ( = ?auto_240828 ?auto_240830 ) ) ( not ( = ?auto_240828 ?auto_240831 ) ) ( not ( = ?auto_240828 ?auto_240832 ) ) ( not ( = ?auto_240829 ?auto_240830 ) ) ( not ( = ?auto_240829 ?auto_240831 ) ) ( not ( = ?auto_240829 ?auto_240832 ) ) ( not ( = ?auto_240830 ?auto_240831 ) ) ( not ( = ?auto_240830 ?auto_240832 ) ) ( not ( = ?auto_240831 ?auto_240832 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_240831 ?auto_240832 )
      ( !STACK ?auto_240831 ?auto_240830 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_240841 - BLOCK
      ?auto_240842 - BLOCK
      ?auto_240843 - BLOCK
      ?auto_240844 - BLOCK
      ?auto_240845 - BLOCK
      ?auto_240846 - BLOCK
      ?auto_240847 - BLOCK
      ?auto_240848 - BLOCK
    )
    :vars
    (
      ?auto_240849 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_240847 ) ( ON ?auto_240848 ?auto_240849 ) ( CLEAR ?auto_240848 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_240841 ) ( ON ?auto_240842 ?auto_240841 ) ( ON ?auto_240843 ?auto_240842 ) ( ON ?auto_240844 ?auto_240843 ) ( ON ?auto_240845 ?auto_240844 ) ( ON ?auto_240846 ?auto_240845 ) ( ON ?auto_240847 ?auto_240846 ) ( not ( = ?auto_240841 ?auto_240842 ) ) ( not ( = ?auto_240841 ?auto_240843 ) ) ( not ( = ?auto_240841 ?auto_240844 ) ) ( not ( = ?auto_240841 ?auto_240845 ) ) ( not ( = ?auto_240841 ?auto_240846 ) ) ( not ( = ?auto_240841 ?auto_240847 ) ) ( not ( = ?auto_240841 ?auto_240848 ) ) ( not ( = ?auto_240841 ?auto_240849 ) ) ( not ( = ?auto_240842 ?auto_240843 ) ) ( not ( = ?auto_240842 ?auto_240844 ) ) ( not ( = ?auto_240842 ?auto_240845 ) ) ( not ( = ?auto_240842 ?auto_240846 ) ) ( not ( = ?auto_240842 ?auto_240847 ) ) ( not ( = ?auto_240842 ?auto_240848 ) ) ( not ( = ?auto_240842 ?auto_240849 ) ) ( not ( = ?auto_240843 ?auto_240844 ) ) ( not ( = ?auto_240843 ?auto_240845 ) ) ( not ( = ?auto_240843 ?auto_240846 ) ) ( not ( = ?auto_240843 ?auto_240847 ) ) ( not ( = ?auto_240843 ?auto_240848 ) ) ( not ( = ?auto_240843 ?auto_240849 ) ) ( not ( = ?auto_240844 ?auto_240845 ) ) ( not ( = ?auto_240844 ?auto_240846 ) ) ( not ( = ?auto_240844 ?auto_240847 ) ) ( not ( = ?auto_240844 ?auto_240848 ) ) ( not ( = ?auto_240844 ?auto_240849 ) ) ( not ( = ?auto_240845 ?auto_240846 ) ) ( not ( = ?auto_240845 ?auto_240847 ) ) ( not ( = ?auto_240845 ?auto_240848 ) ) ( not ( = ?auto_240845 ?auto_240849 ) ) ( not ( = ?auto_240846 ?auto_240847 ) ) ( not ( = ?auto_240846 ?auto_240848 ) ) ( not ( = ?auto_240846 ?auto_240849 ) ) ( not ( = ?auto_240847 ?auto_240848 ) ) ( not ( = ?auto_240847 ?auto_240849 ) ) ( not ( = ?auto_240848 ?auto_240849 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_240848 ?auto_240849 )
      ( !STACK ?auto_240848 ?auto_240847 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_240858 - BLOCK
      ?auto_240859 - BLOCK
      ?auto_240860 - BLOCK
      ?auto_240861 - BLOCK
      ?auto_240862 - BLOCK
      ?auto_240863 - BLOCK
      ?auto_240864 - BLOCK
      ?auto_240865 - BLOCK
    )
    :vars
    (
      ?auto_240866 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_240865 ?auto_240866 ) ( ON-TABLE ?auto_240858 ) ( ON ?auto_240859 ?auto_240858 ) ( ON ?auto_240860 ?auto_240859 ) ( ON ?auto_240861 ?auto_240860 ) ( ON ?auto_240862 ?auto_240861 ) ( ON ?auto_240863 ?auto_240862 ) ( not ( = ?auto_240858 ?auto_240859 ) ) ( not ( = ?auto_240858 ?auto_240860 ) ) ( not ( = ?auto_240858 ?auto_240861 ) ) ( not ( = ?auto_240858 ?auto_240862 ) ) ( not ( = ?auto_240858 ?auto_240863 ) ) ( not ( = ?auto_240858 ?auto_240864 ) ) ( not ( = ?auto_240858 ?auto_240865 ) ) ( not ( = ?auto_240858 ?auto_240866 ) ) ( not ( = ?auto_240859 ?auto_240860 ) ) ( not ( = ?auto_240859 ?auto_240861 ) ) ( not ( = ?auto_240859 ?auto_240862 ) ) ( not ( = ?auto_240859 ?auto_240863 ) ) ( not ( = ?auto_240859 ?auto_240864 ) ) ( not ( = ?auto_240859 ?auto_240865 ) ) ( not ( = ?auto_240859 ?auto_240866 ) ) ( not ( = ?auto_240860 ?auto_240861 ) ) ( not ( = ?auto_240860 ?auto_240862 ) ) ( not ( = ?auto_240860 ?auto_240863 ) ) ( not ( = ?auto_240860 ?auto_240864 ) ) ( not ( = ?auto_240860 ?auto_240865 ) ) ( not ( = ?auto_240860 ?auto_240866 ) ) ( not ( = ?auto_240861 ?auto_240862 ) ) ( not ( = ?auto_240861 ?auto_240863 ) ) ( not ( = ?auto_240861 ?auto_240864 ) ) ( not ( = ?auto_240861 ?auto_240865 ) ) ( not ( = ?auto_240861 ?auto_240866 ) ) ( not ( = ?auto_240862 ?auto_240863 ) ) ( not ( = ?auto_240862 ?auto_240864 ) ) ( not ( = ?auto_240862 ?auto_240865 ) ) ( not ( = ?auto_240862 ?auto_240866 ) ) ( not ( = ?auto_240863 ?auto_240864 ) ) ( not ( = ?auto_240863 ?auto_240865 ) ) ( not ( = ?auto_240863 ?auto_240866 ) ) ( not ( = ?auto_240864 ?auto_240865 ) ) ( not ( = ?auto_240864 ?auto_240866 ) ) ( not ( = ?auto_240865 ?auto_240866 ) ) ( CLEAR ?auto_240863 ) ( ON ?auto_240864 ?auto_240865 ) ( CLEAR ?auto_240864 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_240858 ?auto_240859 ?auto_240860 ?auto_240861 ?auto_240862 ?auto_240863 ?auto_240864 )
      ( MAKE-8PILE ?auto_240858 ?auto_240859 ?auto_240860 ?auto_240861 ?auto_240862 ?auto_240863 ?auto_240864 ?auto_240865 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_240875 - BLOCK
      ?auto_240876 - BLOCK
      ?auto_240877 - BLOCK
      ?auto_240878 - BLOCK
      ?auto_240879 - BLOCK
      ?auto_240880 - BLOCK
      ?auto_240881 - BLOCK
      ?auto_240882 - BLOCK
    )
    :vars
    (
      ?auto_240883 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_240882 ?auto_240883 ) ( ON-TABLE ?auto_240875 ) ( ON ?auto_240876 ?auto_240875 ) ( ON ?auto_240877 ?auto_240876 ) ( ON ?auto_240878 ?auto_240877 ) ( ON ?auto_240879 ?auto_240878 ) ( ON ?auto_240880 ?auto_240879 ) ( not ( = ?auto_240875 ?auto_240876 ) ) ( not ( = ?auto_240875 ?auto_240877 ) ) ( not ( = ?auto_240875 ?auto_240878 ) ) ( not ( = ?auto_240875 ?auto_240879 ) ) ( not ( = ?auto_240875 ?auto_240880 ) ) ( not ( = ?auto_240875 ?auto_240881 ) ) ( not ( = ?auto_240875 ?auto_240882 ) ) ( not ( = ?auto_240875 ?auto_240883 ) ) ( not ( = ?auto_240876 ?auto_240877 ) ) ( not ( = ?auto_240876 ?auto_240878 ) ) ( not ( = ?auto_240876 ?auto_240879 ) ) ( not ( = ?auto_240876 ?auto_240880 ) ) ( not ( = ?auto_240876 ?auto_240881 ) ) ( not ( = ?auto_240876 ?auto_240882 ) ) ( not ( = ?auto_240876 ?auto_240883 ) ) ( not ( = ?auto_240877 ?auto_240878 ) ) ( not ( = ?auto_240877 ?auto_240879 ) ) ( not ( = ?auto_240877 ?auto_240880 ) ) ( not ( = ?auto_240877 ?auto_240881 ) ) ( not ( = ?auto_240877 ?auto_240882 ) ) ( not ( = ?auto_240877 ?auto_240883 ) ) ( not ( = ?auto_240878 ?auto_240879 ) ) ( not ( = ?auto_240878 ?auto_240880 ) ) ( not ( = ?auto_240878 ?auto_240881 ) ) ( not ( = ?auto_240878 ?auto_240882 ) ) ( not ( = ?auto_240878 ?auto_240883 ) ) ( not ( = ?auto_240879 ?auto_240880 ) ) ( not ( = ?auto_240879 ?auto_240881 ) ) ( not ( = ?auto_240879 ?auto_240882 ) ) ( not ( = ?auto_240879 ?auto_240883 ) ) ( not ( = ?auto_240880 ?auto_240881 ) ) ( not ( = ?auto_240880 ?auto_240882 ) ) ( not ( = ?auto_240880 ?auto_240883 ) ) ( not ( = ?auto_240881 ?auto_240882 ) ) ( not ( = ?auto_240881 ?auto_240883 ) ) ( not ( = ?auto_240882 ?auto_240883 ) ) ( CLEAR ?auto_240880 ) ( ON ?auto_240881 ?auto_240882 ) ( CLEAR ?auto_240881 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_240875 ?auto_240876 ?auto_240877 ?auto_240878 ?auto_240879 ?auto_240880 ?auto_240881 )
      ( MAKE-8PILE ?auto_240875 ?auto_240876 ?auto_240877 ?auto_240878 ?auto_240879 ?auto_240880 ?auto_240881 ?auto_240882 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_240892 - BLOCK
      ?auto_240893 - BLOCK
      ?auto_240894 - BLOCK
      ?auto_240895 - BLOCK
      ?auto_240896 - BLOCK
      ?auto_240897 - BLOCK
      ?auto_240898 - BLOCK
      ?auto_240899 - BLOCK
    )
    :vars
    (
      ?auto_240900 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_240899 ?auto_240900 ) ( ON-TABLE ?auto_240892 ) ( ON ?auto_240893 ?auto_240892 ) ( ON ?auto_240894 ?auto_240893 ) ( ON ?auto_240895 ?auto_240894 ) ( ON ?auto_240896 ?auto_240895 ) ( not ( = ?auto_240892 ?auto_240893 ) ) ( not ( = ?auto_240892 ?auto_240894 ) ) ( not ( = ?auto_240892 ?auto_240895 ) ) ( not ( = ?auto_240892 ?auto_240896 ) ) ( not ( = ?auto_240892 ?auto_240897 ) ) ( not ( = ?auto_240892 ?auto_240898 ) ) ( not ( = ?auto_240892 ?auto_240899 ) ) ( not ( = ?auto_240892 ?auto_240900 ) ) ( not ( = ?auto_240893 ?auto_240894 ) ) ( not ( = ?auto_240893 ?auto_240895 ) ) ( not ( = ?auto_240893 ?auto_240896 ) ) ( not ( = ?auto_240893 ?auto_240897 ) ) ( not ( = ?auto_240893 ?auto_240898 ) ) ( not ( = ?auto_240893 ?auto_240899 ) ) ( not ( = ?auto_240893 ?auto_240900 ) ) ( not ( = ?auto_240894 ?auto_240895 ) ) ( not ( = ?auto_240894 ?auto_240896 ) ) ( not ( = ?auto_240894 ?auto_240897 ) ) ( not ( = ?auto_240894 ?auto_240898 ) ) ( not ( = ?auto_240894 ?auto_240899 ) ) ( not ( = ?auto_240894 ?auto_240900 ) ) ( not ( = ?auto_240895 ?auto_240896 ) ) ( not ( = ?auto_240895 ?auto_240897 ) ) ( not ( = ?auto_240895 ?auto_240898 ) ) ( not ( = ?auto_240895 ?auto_240899 ) ) ( not ( = ?auto_240895 ?auto_240900 ) ) ( not ( = ?auto_240896 ?auto_240897 ) ) ( not ( = ?auto_240896 ?auto_240898 ) ) ( not ( = ?auto_240896 ?auto_240899 ) ) ( not ( = ?auto_240896 ?auto_240900 ) ) ( not ( = ?auto_240897 ?auto_240898 ) ) ( not ( = ?auto_240897 ?auto_240899 ) ) ( not ( = ?auto_240897 ?auto_240900 ) ) ( not ( = ?auto_240898 ?auto_240899 ) ) ( not ( = ?auto_240898 ?auto_240900 ) ) ( not ( = ?auto_240899 ?auto_240900 ) ) ( ON ?auto_240898 ?auto_240899 ) ( CLEAR ?auto_240896 ) ( ON ?auto_240897 ?auto_240898 ) ( CLEAR ?auto_240897 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_240892 ?auto_240893 ?auto_240894 ?auto_240895 ?auto_240896 ?auto_240897 )
      ( MAKE-8PILE ?auto_240892 ?auto_240893 ?auto_240894 ?auto_240895 ?auto_240896 ?auto_240897 ?auto_240898 ?auto_240899 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_240909 - BLOCK
      ?auto_240910 - BLOCK
      ?auto_240911 - BLOCK
      ?auto_240912 - BLOCK
      ?auto_240913 - BLOCK
      ?auto_240914 - BLOCK
      ?auto_240915 - BLOCK
      ?auto_240916 - BLOCK
    )
    :vars
    (
      ?auto_240917 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_240916 ?auto_240917 ) ( ON-TABLE ?auto_240909 ) ( ON ?auto_240910 ?auto_240909 ) ( ON ?auto_240911 ?auto_240910 ) ( ON ?auto_240912 ?auto_240911 ) ( ON ?auto_240913 ?auto_240912 ) ( not ( = ?auto_240909 ?auto_240910 ) ) ( not ( = ?auto_240909 ?auto_240911 ) ) ( not ( = ?auto_240909 ?auto_240912 ) ) ( not ( = ?auto_240909 ?auto_240913 ) ) ( not ( = ?auto_240909 ?auto_240914 ) ) ( not ( = ?auto_240909 ?auto_240915 ) ) ( not ( = ?auto_240909 ?auto_240916 ) ) ( not ( = ?auto_240909 ?auto_240917 ) ) ( not ( = ?auto_240910 ?auto_240911 ) ) ( not ( = ?auto_240910 ?auto_240912 ) ) ( not ( = ?auto_240910 ?auto_240913 ) ) ( not ( = ?auto_240910 ?auto_240914 ) ) ( not ( = ?auto_240910 ?auto_240915 ) ) ( not ( = ?auto_240910 ?auto_240916 ) ) ( not ( = ?auto_240910 ?auto_240917 ) ) ( not ( = ?auto_240911 ?auto_240912 ) ) ( not ( = ?auto_240911 ?auto_240913 ) ) ( not ( = ?auto_240911 ?auto_240914 ) ) ( not ( = ?auto_240911 ?auto_240915 ) ) ( not ( = ?auto_240911 ?auto_240916 ) ) ( not ( = ?auto_240911 ?auto_240917 ) ) ( not ( = ?auto_240912 ?auto_240913 ) ) ( not ( = ?auto_240912 ?auto_240914 ) ) ( not ( = ?auto_240912 ?auto_240915 ) ) ( not ( = ?auto_240912 ?auto_240916 ) ) ( not ( = ?auto_240912 ?auto_240917 ) ) ( not ( = ?auto_240913 ?auto_240914 ) ) ( not ( = ?auto_240913 ?auto_240915 ) ) ( not ( = ?auto_240913 ?auto_240916 ) ) ( not ( = ?auto_240913 ?auto_240917 ) ) ( not ( = ?auto_240914 ?auto_240915 ) ) ( not ( = ?auto_240914 ?auto_240916 ) ) ( not ( = ?auto_240914 ?auto_240917 ) ) ( not ( = ?auto_240915 ?auto_240916 ) ) ( not ( = ?auto_240915 ?auto_240917 ) ) ( not ( = ?auto_240916 ?auto_240917 ) ) ( ON ?auto_240915 ?auto_240916 ) ( CLEAR ?auto_240913 ) ( ON ?auto_240914 ?auto_240915 ) ( CLEAR ?auto_240914 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_240909 ?auto_240910 ?auto_240911 ?auto_240912 ?auto_240913 ?auto_240914 )
      ( MAKE-8PILE ?auto_240909 ?auto_240910 ?auto_240911 ?auto_240912 ?auto_240913 ?auto_240914 ?auto_240915 ?auto_240916 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_240926 - BLOCK
      ?auto_240927 - BLOCK
      ?auto_240928 - BLOCK
      ?auto_240929 - BLOCK
      ?auto_240930 - BLOCK
      ?auto_240931 - BLOCK
      ?auto_240932 - BLOCK
      ?auto_240933 - BLOCK
    )
    :vars
    (
      ?auto_240934 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_240933 ?auto_240934 ) ( ON-TABLE ?auto_240926 ) ( ON ?auto_240927 ?auto_240926 ) ( ON ?auto_240928 ?auto_240927 ) ( ON ?auto_240929 ?auto_240928 ) ( not ( = ?auto_240926 ?auto_240927 ) ) ( not ( = ?auto_240926 ?auto_240928 ) ) ( not ( = ?auto_240926 ?auto_240929 ) ) ( not ( = ?auto_240926 ?auto_240930 ) ) ( not ( = ?auto_240926 ?auto_240931 ) ) ( not ( = ?auto_240926 ?auto_240932 ) ) ( not ( = ?auto_240926 ?auto_240933 ) ) ( not ( = ?auto_240926 ?auto_240934 ) ) ( not ( = ?auto_240927 ?auto_240928 ) ) ( not ( = ?auto_240927 ?auto_240929 ) ) ( not ( = ?auto_240927 ?auto_240930 ) ) ( not ( = ?auto_240927 ?auto_240931 ) ) ( not ( = ?auto_240927 ?auto_240932 ) ) ( not ( = ?auto_240927 ?auto_240933 ) ) ( not ( = ?auto_240927 ?auto_240934 ) ) ( not ( = ?auto_240928 ?auto_240929 ) ) ( not ( = ?auto_240928 ?auto_240930 ) ) ( not ( = ?auto_240928 ?auto_240931 ) ) ( not ( = ?auto_240928 ?auto_240932 ) ) ( not ( = ?auto_240928 ?auto_240933 ) ) ( not ( = ?auto_240928 ?auto_240934 ) ) ( not ( = ?auto_240929 ?auto_240930 ) ) ( not ( = ?auto_240929 ?auto_240931 ) ) ( not ( = ?auto_240929 ?auto_240932 ) ) ( not ( = ?auto_240929 ?auto_240933 ) ) ( not ( = ?auto_240929 ?auto_240934 ) ) ( not ( = ?auto_240930 ?auto_240931 ) ) ( not ( = ?auto_240930 ?auto_240932 ) ) ( not ( = ?auto_240930 ?auto_240933 ) ) ( not ( = ?auto_240930 ?auto_240934 ) ) ( not ( = ?auto_240931 ?auto_240932 ) ) ( not ( = ?auto_240931 ?auto_240933 ) ) ( not ( = ?auto_240931 ?auto_240934 ) ) ( not ( = ?auto_240932 ?auto_240933 ) ) ( not ( = ?auto_240932 ?auto_240934 ) ) ( not ( = ?auto_240933 ?auto_240934 ) ) ( ON ?auto_240932 ?auto_240933 ) ( ON ?auto_240931 ?auto_240932 ) ( CLEAR ?auto_240929 ) ( ON ?auto_240930 ?auto_240931 ) ( CLEAR ?auto_240930 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_240926 ?auto_240927 ?auto_240928 ?auto_240929 ?auto_240930 )
      ( MAKE-8PILE ?auto_240926 ?auto_240927 ?auto_240928 ?auto_240929 ?auto_240930 ?auto_240931 ?auto_240932 ?auto_240933 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_240943 - BLOCK
      ?auto_240944 - BLOCK
      ?auto_240945 - BLOCK
      ?auto_240946 - BLOCK
      ?auto_240947 - BLOCK
      ?auto_240948 - BLOCK
      ?auto_240949 - BLOCK
      ?auto_240950 - BLOCK
    )
    :vars
    (
      ?auto_240951 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_240950 ?auto_240951 ) ( ON-TABLE ?auto_240943 ) ( ON ?auto_240944 ?auto_240943 ) ( ON ?auto_240945 ?auto_240944 ) ( ON ?auto_240946 ?auto_240945 ) ( not ( = ?auto_240943 ?auto_240944 ) ) ( not ( = ?auto_240943 ?auto_240945 ) ) ( not ( = ?auto_240943 ?auto_240946 ) ) ( not ( = ?auto_240943 ?auto_240947 ) ) ( not ( = ?auto_240943 ?auto_240948 ) ) ( not ( = ?auto_240943 ?auto_240949 ) ) ( not ( = ?auto_240943 ?auto_240950 ) ) ( not ( = ?auto_240943 ?auto_240951 ) ) ( not ( = ?auto_240944 ?auto_240945 ) ) ( not ( = ?auto_240944 ?auto_240946 ) ) ( not ( = ?auto_240944 ?auto_240947 ) ) ( not ( = ?auto_240944 ?auto_240948 ) ) ( not ( = ?auto_240944 ?auto_240949 ) ) ( not ( = ?auto_240944 ?auto_240950 ) ) ( not ( = ?auto_240944 ?auto_240951 ) ) ( not ( = ?auto_240945 ?auto_240946 ) ) ( not ( = ?auto_240945 ?auto_240947 ) ) ( not ( = ?auto_240945 ?auto_240948 ) ) ( not ( = ?auto_240945 ?auto_240949 ) ) ( not ( = ?auto_240945 ?auto_240950 ) ) ( not ( = ?auto_240945 ?auto_240951 ) ) ( not ( = ?auto_240946 ?auto_240947 ) ) ( not ( = ?auto_240946 ?auto_240948 ) ) ( not ( = ?auto_240946 ?auto_240949 ) ) ( not ( = ?auto_240946 ?auto_240950 ) ) ( not ( = ?auto_240946 ?auto_240951 ) ) ( not ( = ?auto_240947 ?auto_240948 ) ) ( not ( = ?auto_240947 ?auto_240949 ) ) ( not ( = ?auto_240947 ?auto_240950 ) ) ( not ( = ?auto_240947 ?auto_240951 ) ) ( not ( = ?auto_240948 ?auto_240949 ) ) ( not ( = ?auto_240948 ?auto_240950 ) ) ( not ( = ?auto_240948 ?auto_240951 ) ) ( not ( = ?auto_240949 ?auto_240950 ) ) ( not ( = ?auto_240949 ?auto_240951 ) ) ( not ( = ?auto_240950 ?auto_240951 ) ) ( ON ?auto_240949 ?auto_240950 ) ( ON ?auto_240948 ?auto_240949 ) ( CLEAR ?auto_240946 ) ( ON ?auto_240947 ?auto_240948 ) ( CLEAR ?auto_240947 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_240943 ?auto_240944 ?auto_240945 ?auto_240946 ?auto_240947 )
      ( MAKE-8PILE ?auto_240943 ?auto_240944 ?auto_240945 ?auto_240946 ?auto_240947 ?auto_240948 ?auto_240949 ?auto_240950 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_240960 - BLOCK
      ?auto_240961 - BLOCK
      ?auto_240962 - BLOCK
      ?auto_240963 - BLOCK
      ?auto_240964 - BLOCK
      ?auto_240965 - BLOCK
      ?auto_240966 - BLOCK
      ?auto_240967 - BLOCK
    )
    :vars
    (
      ?auto_240968 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_240967 ?auto_240968 ) ( ON-TABLE ?auto_240960 ) ( ON ?auto_240961 ?auto_240960 ) ( ON ?auto_240962 ?auto_240961 ) ( not ( = ?auto_240960 ?auto_240961 ) ) ( not ( = ?auto_240960 ?auto_240962 ) ) ( not ( = ?auto_240960 ?auto_240963 ) ) ( not ( = ?auto_240960 ?auto_240964 ) ) ( not ( = ?auto_240960 ?auto_240965 ) ) ( not ( = ?auto_240960 ?auto_240966 ) ) ( not ( = ?auto_240960 ?auto_240967 ) ) ( not ( = ?auto_240960 ?auto_240968 ) ) ( not ( = ?auto_240961 ?auto_240962 ) ) ( not ( = ?auto_240961 ?auto_240963 ) ) ( not ( = ?auto_240961 ?auto_240964 ) ) ( not ( = ?auto_240961 ?auto_240965 ) ) ( not ( = ?auto_240961 ?auto_240966 ) ) ( not ( = ?auto_240961 ?auto_240967 ) ) ( not ( = ?auto_240961 ?auto_240968 ) ) ( not ( = ?auto_240962 ?auto_240963 ) ) ( not ( = ?auto_240962 ?auto_240964 ) ) ( not ( = ?auto_240962 ?auto_240965 ) ) ( not ( = ?auto_240962 ?auto_240966 ) ) ( not ( = ?auto_240962 ?auto_240967 ) ) ( not ( = ?auto_240962 ?auto_240968 ) ) ( not ( = ?auto_240963 ?auto_240964 ) ) ( not ( = ?auto_240963 ?auto_240965 ) ) ( not ( = ?auto_240963 ?auto_240966 ) ) ( not ( = ?auto_240963 ?auto_240967 ) ) ( not ( = ?auto_240963 ?auto_240968 ) ) ( not ( = ?auto_240964 ?auto_240965 ) ) ( not ( = ?auto_240964 ?auto_240966 ) ) ( not ( = ?auto_240964 ?auto_240967 ) ) ( not ( = ?auto_240964 ?auto_240968 ) ) ( not ( = ?auto_240965 ?auto_240966 ) ) ( not ( = ?auto_240965 ?auto_240967 ) ) ( not ( = ?auto_240965 ?auto_240968 ) ) ( not ( = ?auto_240966 ?auto_240967 ) ) ( not ( = ?auto_240966 ?auto_240968 ) ) ( not ( = ?auto_240967 ?auto_240968 ) ) ( ON ?auto_240966 ?auto_240967 ) ( ON ?auto_240965 ?auto_240966 ) ( ON ?auto_240964 ?auto_240965 ) ( CLEAR ?auto_240962 ) ( ON ?auto_240963 ?auto_240964 ) ( CLEAR ?auto_240963 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_240960 ?auto_240961 ?auto_240962 ?auto_240963 )
      ( MAKE-8PILE ?auto_240960 ?auto_240961 ?auto_240962 ?auto_240963 ?auto_240964 ?auto_240965 ?auto_240966 ?auto_240967 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_240977 - BLOCK
      ?auto_240978 - BLOCK
      ?auto_240979 - BLOCK
      ?auto_240980 - BLOCK
      ?auto_240981 - BLOCK
      ?auto_240982 - BLOCK
      ?auto_240983 - BLOCK
      ?auto_240984 - BLOCK
    )
    :vars
    (
      ?auto_240985 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_240984 ?auto_240985 ) ( ON-TABLE ?auto_240977 ) ( ON ?auto_240978 ?auto_240977 ) ( ON ?auto_240979 ?auto_240978 ) ( not ( = ?auto_240977 ?auto_240978 ) ) ( not ( = ?auto_240977 ?auto_240979 ) ) ( not ( = ?auto_240977 ?auto_240980 ) ) ( not ( = ?auto_240977 ?auto_240981 ) ) ( not ( = ?auto_240977 ?auto_240982 ) ) ( not ( = ?auto_240977 ?auto_240983 ) ) ( not ( = ?auto_240977 ?auto_240984 ) ) ( not ( = ?auto_240977 ?auto_240985 ) ) ( not ( = ?auto_240978 ?auto_240979 ) ) ( not ( = ?auto_240978 ?auto_240980 ) ) ( not ( = ?auto_240978 ?auto_240981 ) ) ( not ( = ?auto_240978 ?auto_240982 ) ) ( not ( = ?auto_240978 ?auto_240983 ) ) ( not ( = ?auto_240978 ?auto_240984 ) ) ( not ( = ?auto_240978 ?auto_240985 ) ) ( not ( = ?auto_240979 ?auto_240980 ) ) ( not ( = ?auto_240979 ?auto_240981 ) ) ( not ( = ?auto_240979 ?auto_240982 ) ) ( not ( = ?auto_240979 ?auto_240983 ) ) ( not ( = ?auto_240979 ?auto_240984 ) ) ( not ( = ?auto_240979 ?auto_240985 ) ) ( not ( = ?auto_240980 ?auto_240981 ) ) ( not ( = ?auto_240980 ?auto_240982 ) ) ( not ( = ?auto_240980 ?auto_240983 ) ) ( not ( = ?auto_240980 ?auto_240984 ) ) ( not ( = ?auto_240980 ?auto_240985 ) ) ( not ( = ?auto_240981 ?auto_240982 ) ) ( not ( = ?auto_240981 ?auto_240983 ) ) ( not ( = ?auto_240981 ?auto_240984 ) ) ( not ( = ?auto_240981 ?auto_240985 ) ) ( not ( = ?auto_240982 ?auto_240983 ) ) ( not ( = ?auto_240982 ?auto_240984 ) ) ( not ( = ?auto_240982 ?auto_240985 ) ) ( not ( = ?auto_240983 ?auto_240984 ) ) ( not ( = ?auto_240983 ?auto_240985 ) ) ( not ( = ?auto_240984 ?auto_240985 ) ) ( ON ?auto_240983 ?auto_240984 ) ( ON ?auto_240982 ?auto_240983 ) ( ON ?auto_240981 ?auto_240982 ) ( CLEAR ?auto_240979 ) ( ON ?auto_240980 ?auto_240981 ) ( CLEAR ?auto_240980 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_240977 ?auto_240978 ?auto_240979 ?auto_240980 )
      ( MAKE-8PILE ?auto_240977 ?auto_240978 ?auto_240979 ?auto_240980 ?auto_240981 ?auto_240982 ?auto_240983 ?auto_240984 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_240994 - BLOCK
      ?auto_240995 - BLOCK
      ?auto_240996 - BLOCK
      ?auto_240997 - BLOCK
      ?auto_240998 - BLOCK
      ?auto_240999 - BLOCK
      ?auto_241000 - BLOCK
      ?auto_241001 - BLOCK
    )
    :vars
    (
      ?auto_241002 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_241001 ?auto_241002 ) ( ON-TABLE ?auto_240994 ) ( ON ?auto_240995 ?auto_240994 ) ( not ( = ?auto_240994 ?auto_240995 ) ) ( not ( = ?auto_240994 ?auto_240996 ) ) ( not ( = ?auto_240994 ?auto_240997 ) ) ( not ( = ?auto_240994 ?auto_240998 ) ) ( not ( = ?auto_240994 ?auto_240999 ) ) ( not ( = ?auto_240994 ?auto_241000 ) ) ( not ( = ?auto_240994 ?auto_241001 ) ) ( not ( = ?auto_240994 ?auto_241002 ) ) ( not ( = ?auto_240995 ?auto_240996 ) ) ( not ( = ?auto_240995 ?auto_240997 ) ) ( not ( = ?auto_240995 ?auto_240998 ) ) ( not ( = ?auto_240995 ?auto_240999 ) ) ( not ( = ?auto_240995 ?auto_241000 ) ) ( not ( = ?auto_240995 ?auto_241001 ) ) ( not ( = ?auto_240995 ?auto_241002 ) ) ( not ( = ?auto_240996 ?auto_240997 ) ) ( not ( = ?auto_240996 ?auto_240998 ) ) ( not ( = ?auto_240996 ?auto_240999 ) ) ( not ( = ?auto_240996 ?auto_241000 ) ) ( not ( = ?auto_240996 ?auto_241001 ) ) ( not ( = ?auto_240996 ?auto_241002 ) ) ( not ( = ?auto_240997 ?auto_240998 ) ) ( not ( = ?auto_240997 ?auto_240999 ) ) ( not ( = ?auto_240997 ?auto_241000 ) ) ( not ( = ?auto_240997 ?auto_241001 ) ) ( not ( = ?auto_240997 ?auto_241002 ) ) ( not ( = ?auto_240998 ?auto_240999 ) ) ( not ( = ?auto_240998 ?auto_241000 ) ) ( not ( = ?auto_240998 ?auto_241001 ) ) ( not ( = ?auto_240998 ?auto_241002 ) ) ( not ( = ?auto_240999 ?auto_241000 ) ) ( not ( = ?auto_240999 ?auto_241001 ) ) ( not ( = ?auto_240999 ?auto_241002 ) ) ( not ( = ?auto_241000 ?auto_241001 ) ) ( not ( = ?auto_241000 ?auto_241002 ) ) ( not ( = ?auto_241001 ?auto_241002 ) ) ( ON ?auto_241000 ?auto_241001 ) ( ON ?auto_240999 ?auto_241000 ) ( ON ?auto_240998 ?auto_240999 ) ( ON ?auto_240997 ?auto_240998 ) ( CLEAR ?auto_240995 ) ( ON ?auto_240996 ?auto_240997 ) ( CLEAR ?auto_240996 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_240994 ?auto_240995 ?auto_240996 )
      ( MAKE-8PILE ?auto_240994 ?auto_240995 ?auto_240996 ?auto_240997 ?auto_240998 ?auto_240999 ?auto_241000 ?auto_241001 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_241011 - BLOCK
      ?auto_241012 - BLOCK
      ?auto_241013 - BLOCK
      ?auto_241014 - BLOCK
      ?auto_241015 - BLOCK
      ?auto_241016 - BLOCK
      ?auto_241017 - BLOCK
      ?auto_241018 - BLOCK
    )
    :vars
    (
      ?auto_241019 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_241018 ?auto_241019 ) ( ON-TABLE ?auto_241011 ) ( ON ?auto_241012 ?auto_241011 ) ( not ( = ?auto_241011 ?auto_241012 ) ) ( not ( = ?auto_241011 ?auto_241013 ) ) ( not ( = ?auto_241011 ?auto_241014 ) ) ( not ( = ?auto_241011 ?auto_241015 ) ) ( not ( = ?auto_241011 ?auto_241016 ) ) ( not ( = ?auto_241011 ?auto_241017 ) ) ( not ( = ?auto_241011 ?auto_241018 ) ) ( not ( = ?auto_241011 ?auto_241019 ) ) ( not ( = ?auto_241012 ?auto_241013 ) ) ( not ( = ?auto_241012 ?auto_241014 ) ) ( not ( = ?auto_241012 ?auto_241015 ) ) ( not ( = ?auto_241012 ?auto_241016 ) ) ( not ( = ?auto_241012 ?auto_241017 ) ) ( not ( = ?auto_241012 ?auto_241018 ) ) ( not ( = ?auto_241012 ?auto_241019 ) ) ( not ( = ?auto_241013 ?auto_241014 ) ) ( not ( = ?auto_241013 ?auto_241015 ) ) ( not ( = ?auto_241013 ?auto_241016 ) ) ( not ( = ?auto_241013 ?auto_241017 ) ) ( not ( = ?auto_241013 ?auto_241018 ) ) ( not ( = ?auto_241013 ?auto_241019 ) ) ( not ( = ?auto_241014 ?auto_241015 ) ) ( not ( = ?auto_241014 ?auto_241016 ) ) ( not ( = ?auto_241014 ?auto_241017 ) ) ( not ( = ?auto_241014 ?auto_241018 ) ) ( not ( = ?auto_241014 ?auto_241019 ) ) ( not ( = ?auto_241015 ?auto_241016 ) ) ( not ( = ?auto_241015 ?auto_241017 ) ) ( not ( = ?auto_241015 ?auto_241018 ) ) ( not ( = ?auto_241015 ?auto_241019 ) ) ( not ( = ?auto_241016 ?auto_241017 ) ) ( not ( = ?auto_241016 ?auto_241018 ) ) ( not ( = ?auto_241016 ?auto_241019 ) ) ( not ( = ?auto_241017 ?auto_241018 ) ) ( not ( = ?auto_241017 ?auto_241019 ) ) ( not ( = ?auto_241018 ?auto_241019 ) ) ( ON ?auto_241017 ?auto_241018 ) ( ON ?auto_241016 ?auto_241017 ) ( ON ?auto_241015 ?auto_241016 ) ( ON ?auto_241014 ?auto_241015 ) ( CLEAR ?auto_241012 ) ( ON ?auto_241013 ?auto_241014 ) ( CLEAR ?auto_241013 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_241011 ?auto_241012 ?auto_241013 )
      ( MAKE-8PILE ?auto_241011 ?auto_241012 ?auto_241013 ?auto_241014 ?auto_241015 ?auto_241016 ?auto_241017 ?auto_241018 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_241028 - BLOCK
      ?auto_241029 - BLOCK
      ?auto_241030 - BLOCK
      ?auto_241031 - BLOCK
      ?auto_241032 - BLOCK
      ?auto_241033 - BLOCK
      ?auto_241034 - BLOCK
      ?auto_241035 - BLOCK
    )
    :vars
    (
      ?auto_241036 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_241035 ?auto_241036 ) ( ON-TABLE ?auto_241028 ) ( not ( = ?auto_241028 ?auto_241029 ) ) ( not ( = ?auto_241028 ?auto_241030 ) ) ( not ( = ?auto_241028 ?auto_241031 ) ) ( not ( = ?auto_241028 ?auto_241032 ) ) ( not ( = ?auto_241028 ?auto_241033 ) ) ( not ( = ?auto_241028 ?auto_241034 ) ) ( not ( = ?auto_241028 ?auto_241035 ) ) ( not ( = ?auto_241028 ?auto_241036 ) ) ( not ( = ?auto_241029 ?auto_241030 ) ) ( not ( = ?auto_241029 ?auto_241031 ) ) ( not ( = ?auto_241029 ?auto_241032 ) ) ( not ( = ?auto_241029 ?auto_241033 ) ) ( not ( = ?auto_241029 ?auto_241034 ) ) ( not ( = ?auto_241029 ?auto_241035 ) ) ( not ( = ?auto_241029 ?auto_241036 ) ) ( not ( = ?auto_241030 ?auto_241031 ) ) ( not ( = ?auto_241030 ?auto_241032 ) ) ( not ( = ?auto_241030 ?auto_241033 ) ) ( not ( = ?auto_241030 ?auto_241034 ) ) ( not ( = ?auto_241030 ?auto_241035 ) ) ( not ( = ?auto_241030 ?auto_241036 ) ) ( not ( = ?auto_241031 ?auto_241032 ) ) ( not ( = ?auto_241031 ?auto_241033 ) ) ( not ( = ?auto_241031 ?auto_241034 ) ) ( not ( = ?auto_241031 ?auto_241035 ) ) ( not ( = ?auto_241031 ?auto_241036 ) ) ( not ( = ?auto_241032 ?auto_241033 ) ) ( not ( = ?auto_241032 ?auto_241034 ) ) ( not ( = ?auto_241032 ?auto_241035 ) ) ( not ( = ?auto_241032 ?auto_241036 ) ) ( not ( = ?auto_241033 ?auto_241034 ) ) ( not ( = ?auto_241033 ?auto_241035 ) ) ( not ( = ?auto_241033 ?auto_241036 ) ) ( not ( = ?auto_241034 ?auto_241035 ) ) ( not ( = ?auto_241034 ?auto_241036 ) ) ( not ( = ?auto_241035 ?auto_241036 ) ) ( ON ?auto_241034 ?auto_241035 ) ( ON ?auto_241033 ?auto_241034 ) ( ON ?auto_241032 ?auto_241033 ) ( ON ?auto_241031 ?auto_241032 ) ( ON ?auto_241030 ?auto_241031 ) ( CLEAR ?auto_241028 ) ( ON ?auto_241029 ?auto_241030 ) ( CLEAR ?auto_241029 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_241028 ?auto_241029 )
      ( MAKE-8PILE ?auto_241028 ?auto_241029 ?auto_241030 ?auto_241031 ?auto_241032 ?auto_241033 ?auto_241034 ?auto_241035 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_241045 - BLOCK
      ?auto_241046 - BLOCK
      ?auto_241047 - BLOCK
      ?auto_241048 - BLOCK
      ?auto_241049 - BLOCK
      ?auto_241050 - BLOCK
      ?auto_241051 - BLOCK
      ?auto_241052 - BLOCK
    )
    :vars
    (
      ?auto_241053 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_241052 ?auto_241053 ) ( ON-TABLE ?auto_241045 ) ( not ( = ?auto_241045 ?auto_241046 ) ) ( not ( = ?auto_241045 ?auto_241047 ) ) ( not ( = ?auto_241045 ?auto_241048 ) ) ( not ( = ?auto_241045 ?auto_241049 ) ) ( not ( = ?auto_241045 ?auto_241050 ) ) ( not ( = ?auto_241045 ?auto_241051 ) ) ( not ( = ?auto_241045 ?auto_241052 ) ) ( not ( = ?auto_241045 ?auto_241053 ) ) ( not ( = ?auto_241046 ?auto_241047 ) ) ( not ( = ?auto_241046 ?auto_241048 ) ) ( not ( = ?auto_241046 ?auto_241049 ) ) ( not ( = ?auto_241046 ?auto_241050 ) ) ( not ( = ?auto_241046 ?auto_241051 ) ) ( not ( = ?auto_241046 ?auto_241052 ) ) ( not ( = ?auto_241046 ?auto_241053 ) ) ( not ( = ?auto_241047 ?auto_241048 ) ) ( not ( = ?auto_241047 ?auto_241049 ) ) ( not ( = ?auto_241047 ?auto_241050 ) ) ( not ( = ?auto_241047 ?auto_241051 ) ) ( not ( = ?auto_241047 ?auto_241052 ) ) ( not ( = ?auto_241047 ?auto_241053 ) ) ( not ( = ?auto_241048 ?auto_241049 ) ) ( not ( = ?auto_241048 ?auto_241050 ) ) ( not ( = ?auto_241048 ?auto_241051 ) ) ( not ( = ?auto_241048 ?auto_241052 ) ) ( not ( = ?auto_241048 ?auto_241053 ) ) ( not ( = ?auto_241049 ?auto_241050 ) ) ( not ( = ?auto_241049 ?auto_241051 ) ) ( not ( = ?auto_241049 ?auto_241052 ) ) ( not ( = ?auto_241049 ?auto_241053 ) ) ( not ( = ?auto_241050 ?auto_241051 ) ) ( not ( = ?auto_241050 ?auto_241052 ) ) ( not ( = ?auto_241050 ?auto_241053 ) ) ( not ( = ?auto_241051 ?auto_241052 ) ) ( not ( = ?auto_241051 ?auto_241053 ) ) ( not ( = ?auto_241052 ?auto_241053 ) ) ( ON ?auto_241051 ?auto_241052 ) ( ON ?auto_241050 ?auto_241051 ) ( ON ?auto_241049 ?auto_241050 ) ( ON ?auto_241048 ?auto_241049 ) ( ON ?auto_241047 ?auto_241048 ) ( CLEAR ?auto_241045 ) ( ON ?auto_241046 ?auto_241047 ) ( CLEAR ?auto_241046 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_241045 ?auto_241046 )
      ( MAKE-8PILE ?auto_241045 ?auto_241046 ?auto_241047 ?auto_241048 ?auto_241049 ?auto_241050 ?auto_241051 ?auto_241052 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_241062 - BLOCK
      ?auto_241063 - BLOCK
      ?auto_241064 - BLOCK
      ?auto_241065 - BLOCK
      ?auto_241066 - BLOCK
      ?auto_241067 - BLOCK
      ?auto_241068 - BLOCK
      ?auto_241069 - BLOCK
    )
    :vars
    (
      ?auto_241070 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_241069 ?auto_241070 ) ( not ( = ?auto_241062 ?auto_241063 ) ) ( not ( = ?auto_241062 ?auto_241064 ) ) ( not ( = ?auto_241062 ?auto_241065 ) ) ( not ( = ?auto_241062 ?auto_241066 ) ) ( not ( = ?auto_241062 ?auto_241067 ) ) ( not ( = ?auto_241062 ?auto_241068 ) ) ( not ( = ?auto_241062 ?auto_241069 ) ) ( not ( = ?auto_241062 ?auto_241070 ) ) ( not ( = ?auto_241063 ?auto_241064 ) ) ( not ( = ?auto_241063 ?auto_241065 ) ) ( not ( = ?auto_241063 ?auto_241066 ) ) ( not ( = ?auto_241063 ?auto_241067 ) ) ( not ( = ?auto_241063 ?auto_241068 ) ) ( not ( = ?auto_241063 ?auto_241069 ) ) ( not ( = ?auto_241063 ?auto_241070 ) ) ( not ( = ?auto_241064 ?auto_241065 ) ) ( not ( = ?auto_241064 ?auto_241066 ) ) ( not ( = ?auto_241064 ?auto_241067 ) ) ( not ( = ?auto_241064 ?auto_241068 ) ) ( not ( = ?auto_241064 ?auto_241069 ) ) ( not ( = ?auto_241064 ?auto_241070 ) ) ( not ( = ?auto_241065 ?auto_241066 ) ) ( not ( = ?auto_241065 ?auto_241067 ) ) ( not ( = ?auto_241065 ?auto_241068 ) ) ( not ( = ?auto_241065 ?auto_241069 ) ) ( not ( = ?auto_241065 ?auto_241070 ) ) ( not ( = ?auto_241066 ?auto_241067 ) ) ( not ( = ?auto_241066 ?auto_241068 ) ) ( not ( = ?auto_241066 ?auto_241069 ) ) ( not ( = ?auto_241066 ?auto_241070 ) ) ( not ( = ?auto_241067 ?auto_241068 ) ) ( not ( = ?auto_241067 ?auto_241069 ) ) ( not ( = ?auto_241067 ?auto_241070 ) ) ( not ( = ?auto_241068 ?auto_241069 ) ) ( not ( = ?auto_241068 ?auto_241070 ) ) ( not ( = ?auto_241069 ?auto_241070 ) ) ( ON ?auto_241068 ?auto_241069 ) ( ON ?auto_241067 ?auto_241068 ) ( ON ?auto_241066 ?auto_241067 ) ( ON ?auto_241065 ?auto_241066 ) ( ON ?auto_241064 ?auto_241065 ) ( ON ?auto_241063 ?auto_241064 ) ( ON ?auto_241062 ?auto_241063 ) ( CLEAR ?auto_241062 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_241062 )
      ( MAKE-8PILE ?auto_241062 ?auto_241063 ?auto_241064 ?auto_241065 ?auto_241066 ?auto_241067 ?auto_241068 ?auto_241069 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_241079 - BLOCK
      ?auto_241080 - BLOCK
      ?auto_241081 - BLOCK
      ?auto_241082 - BLOCK
      ?auto_241083 - BLOCK
      ?auto_241084 - BLOCK
      ?auto_241085 - BLOCK
      ?auto_241086 - BLOCK
    )
    :vars
    (
      ?auto_241087 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_241086 ?auto_241087 ) ( not ( = ?auto_241079 ?auto_241080 ) ) ( not ( = ?auto_241079 ?auto_241081 ) ) ( not ( = ?auto_241079 ?auto_241082 ) ) ( not ( = ?auto_241079 ?auto_241083 ) ) ( not ( = ?auto_241079 ?auto_241084 ) ) ( not ( = ?auto_241079 ?auto_241085 ) ) ( not ( = ?auto_241079 ?auto_241086 ) ) ( not ( = ?auto_241079 ?auto_241087 ) ) ( not ( = ?auto_241080 ?auto_241081 ) ) ( not ( = ?auto_241080 ?auto_241082 ) ) ( not ( = ?auto_241080 ?auto_241083 ) ) ( not ( = ?auto_241080 ?auto_241084 ) ) ( not ( = ?auto_241080 ?auto_241085 ) ) ( not ( = ?auto_241080 ?auto_241086 ) ) ( not ( = ?auto_241080 ?auto_241087 ) ) ( not ( = ?auto_241081 ?auto_241082 ) ) ( not ( = ?auto_241081 ?auto_241083 ) ) ( not ( = ?auto_241081 ?auto_241084 ) ) ( not ( = ?auto_241081 ?auto_241085 ) ) ( not ( = ?auto_241081 ?auto_241086 ) ) ( not ( = ?auto_241081 ?auto_241087 ) ) ( not ( = ?auto_241082 ?auto_241083 ) ) ( not ( = ?auto_241082 ?auto_241084 ) ) ( not ( = ?auto_241082 ?auto_241085 ) ) ( not ( = ?auto_241082 ?auto_241086 ) ) ( not ( = ?auto_241082 ?auto_241087 ) ) ( not ( = ?auto_241083 ?auto_241084 ) ) ( not ( = ?auto_241083 ?auto_241085 ) ) ( not ( = ?auto_241083 ?auto_241086 ) ) ( not ( = ?auto_241083 ?auto_241087 ) ) ( not ( = ?auto_241084 ?auto_241085 ) ) ( not ( = ?auto_241084 ?auto_241086 ) ) ( not ( = ?auto_241084 ?auto_241087 ) ) ( not ( = ?auto_241085 ?auto_241086 ) ) ( not ( = ?auto_241085 ?auto_241087 ) ) ( not ( = ?auto_241086 ?auto_241087 ) ) ( ON ?auto_241085 ?auto_241086 ) ( ON ?auto_241084 ?auto_241085 ) ( ON ?auto_241083 ?auto_241084 ) ( ON ?auto_241082 ?auto_241083 ) ( ON ?auto_241081 ?auto_241082 ) ( ON ?auto_241080 ?auto_241081 ) ( ON ?auto_241079 ?auto_241080 ) ( CLEAR ?auto_241079 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_241079 )
      ( MAKE-8PILE ?auto_241079 ?auto_241080 ?auto_241081 ?auto_241082 ?auto_241083 ?auto_241084 ?auto_241085 ?auto_241086 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_241097 - BLOCK
      ?auto_241098 - BLOCK
      ?auto_241099 - BLOCK
      ?auto_241100 - BLOCK
      ?auto_241101 - BLOCK
      ?auto_241102 - BLOCK
      ?auto_241103 - BLOCK
      ?auto_241104 - BLOCK
      ?auto_241105 - BLOCK
    )
    :vars
    (
      ?auto_241106 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_241104 ) ( ON ?auto_241105 ?auto_241106 ) ( CLEAR ?auto_241105 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_241097 ) ( ON ?auto_241098 ?auto_241097 ) ( ON ?auto_241099 ?auto_241098 ) ( ON ?auto_241100 ?auto_241099 ) ( ON ?auto_241101 ?auto_241100 ) ( ON ?auto_241102 ?auto_241101 ) ( ON ?auto_241103 ?auto_241102 ) ( ON ?auto_241104 ?auto_241103 ) ( not ( = ?auto_241097 ?auto_241098 ) ) ( not ( = ?auto_241097 ?auto_241099 ) ) ( not ( = ?auto_241097 ?auto_241100 ) ) ( not ( = ?auto_241097 ?auto_241101 ) ) ( not ( = ?auto_241097 ?auto_241102 ) ) ( not ( = ?auto_241097 ?auto_241103 ) ) ( not ( = ?auto_241097 ?auto_241104 ) ) ( not ( = ?auto_241097 ?auto_241105 ) ) ( not ( = ?auto_241097 ?auto_241106 ) ) ( not ( = ?auto_241098 ?auto_241099 ) ) ( not ( = ?auto_241098 ?auto_241100 ) ) ( not ( = ?auto_241098 ?auto_241101 ) ) ( not ( = ?auto_241098 ?auto_241102 ) ) ( not ( = ?auto_241098 ?auto_241103 ) ) ( not ( = ?auto_241098 ?auto_241104 ) ) ( not ( = ?auto_241098 ?auto_241105 ) ) ( not ( = ?auto_241098 ?auto_241106 ) ) ( not ( = ?auto_241099 ?auto_241100 ) ) ( not ( = ?auto_241099 ?auto_241101 ) ) ( not ( = ?auto_241099 ?auto_241102 ) ) ( not ( = ?auto_241099 ?auto_241103 ) ) ( not ( = ?auto_241099 ?auto_241104 ) ) ( not ( = ?auto_241099 ?auto_241105 ) ) ( not ( = ?auto_241099 ?auto_241106 ) ) ( not ( = ?auto_241100 ?auto_241101 ) ) ( not ( = ?auto_241100 ?auto_241102 ) ) ( not ( = ?auto_241100 ?auto_241103 ) ) ( not ( = ?auto_241100 ?auto_241104 ) ) ( not ( = ?auto_241100 ?auto_241105 ) ) ( not ( = ?auto_241100 ?auto_241106 ) ) ( not ( = ?auto_241101 ?auto_241102 ) ) ( not ( = ?auto_241101 ?auto_241103 ) ) ( not ( = ?auto_241101 ?auto_241104 ) ) ( not ( = ?auto_241101 ?auto_241105 ) ) ( not ( = ?auto_241101 ?auto_241106 ) ) ( not ( = ?auto_241102 ?auto_241103 ) ) ( not ( = ?auto_241102 ?auto_241104 ) ) ( not ( = ?auto_241102 ?auto_241105 ) ) ( not ( = ?auto_241102 ?auto_241106 ) ) ( not ( = ?auto_241103 ?auto_241104 ) ) ( not ( = ?auto_241103 ?auto_241105 ) ) ( not ( = ?auto_241103 ?auto_241106 ) ) ( not ( = ?auto_241104 ?auto_241105 ) ) ( not ( = ?auto_241104 ?auto_241106 ) ) ( not ( = ?auto_241105 ?auto_241106 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_241105 ?auto_241106 )
      ( !STACK ?auto_241105 ?auto_241104 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_241116 - BLOCK
      ?auto_241117 - BLOCK
      ?auto_241118 - BLOCK
      ?auto_241119 - BLOCK
      ?auto_241120 - BLOCK
      ?auto_241121 - BLOCK
      ?auto_241122 - BLOCK
      ?auto_241123 - BLOCK
      ?auto_241124 - BLOCK
    )
    :vars
    (
      ?auto_241125 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_241123 ) ( ON ?auto_241124 ?auto_241125 ) ( CLEAR ?auto_241124 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_241116 ) ( ON ?auto_241117 ?auto_241116 ) ( ON ?auto_241118 ?auto_241117 ) ( ON ?auto_241119 ?auto_241118 ) ( ON ?auto_241120 ?auto_241119 ) ( ON ?auto_241121 ?auto_241120 ) ( ON ?auto_241122 ?auto_241121 ) ( ON ?auto_241123 ?auto_241122 ) ( not ( = ?auto_241116 ?auto_241117 ) ) ( not ( = ?auto_241116 ?auto_241118 ) ) ( not ( = ?auto_241116 ?auto_241119 ) ) ( not ( = ?auto_241116 ?auto_241120 ) ) ( not ( = ?auto_241116 ?auto_241121 ) ) ( not ( = ?auto_241116 ?auto_241122 ) ) ( not ( = ?auto_241116 ?auto_241123 ) ) ( not ( = ?auto_241116 ?auto_241124 ) ) ( not ( = ?auto_241116 ?auto_241125 ) ) ( not ( = ?auto_241117 ?auto_241118 ) ) ( not ( = ?auto_241117 ?auto_241119 ) ) ( not ( = ?auto_241117 ?auto_241120 ) ) ( not ( = ?auto_241117 ?auto_241121 ) ) ( not ( = ?auto_241117 ?auto_241122 ) ) ( not ( = ?auto_241117 ?auto_241123 ) ) ( not ( = ?auto_241117 ?auto_241124 ) ) ( not ( = ?auto_241117 ?auto_241125 ) ) ( not ( = ?auto_241118 ?auto_241119 ) ) ( not ( = ?auto_241118 ?auto_241120 ) ) ( not ( = ?auto_241118 ?auto_241121 ) ) ( not ( = ?auto_241118 ?auto_241122 ) ) ( not ( = ?auto_241118 ?auto_241123 ) ) ( not ( = ?auto_241118 ?auto_241124 ) ) ( not ( = ?auto_241118 ?auto_241125 ) ) ( not ( = ?auto_241119 ?auto_241120 ) ) ( not ( = ?auto_241119 ?auto_241121 ) ) ( not ( = ?auto_241119 ?auto_241122 ) ) ( not ( = ?auto_241119 ?auto_241123 ) ) ( not ( = ?auto_241119 ?auto_241124 ) ) ( not ( = ?auto_241119 ?auto_241125 ) ) ( not ( = ?auto_241120 ?auto_241121 ) ) ( not ( = ?auto_241120 ?auto_241122 ) ) ( not ( = ?auto_241120 ?auto_241123 ) ) ( not ( = ?auto_241120 ?auto_241124 ) ) ( not ( = ?auto_241120 ?auto_241125 ) ) ( not ( = ?auto_241121 ?auto_241122 ) ) ( not ( = ?auto_241121 ?auto_241123 ) ) ( not ( = ?auto_241121 ?auto_241124 ) ) ( not ( = ?auto_241121 ?auto_241125 ) ) ( not ( = ?auto_241122 ?auto_241123 ) ) ( not ( = ?auto_241122 ?auto_241124 ) ) ( not ( = ?auto_241122 ?auto_241125 ) ) ( not ( = ?auto_241123 ?auto_241124 ) ) ( not ( = ?auto_241123 ?auto_241125 ) ) ( not ( = ?auto_241124 ?auto_241125 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_241124 ?auto_241125 )
      ( !STACK ?auto_241124 ?auto_241123 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_241135 - BLOCK
      ?auto_241136 - BLOCK
      ?auto_241137 - BLOCK
      ?auto_241138 - BLOCK
      ?auto_241139 - BLOCK
      ?auto_241140 - BLOCK
      ?auto_241141 - BLOCK
      ?auto_241142 - BLOCK
      ?auto_241143 - BLOCK
    )
    :vars
    (
      ?auto_241144 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_241143 ?auto_241144 ) ( ON-TABLE ?auto_241135 ) ( ON ?auto_241136 ?auto_241135 ) ( ON ?auto_241137 ?auto_241136 ) ( ON ?auto_241138 ?auto_241137 ) ( ON ?auto_241139 ?auto_241138 ) ( ON ?auto_241140 ?auto_241139 ) ( ON ?auto_241141 ?auto_241140 ) ( not ( = ?auto_241135 ?auto_241136 ) ) ( not ( = ?auto_241135 ?auto_241137 ) ) ( not ( = ?auto_241135 ?auto_241138 ) ) ( not ( = ?auto_241135 ?auto_241139 ) ) ( not ( = ?auto_241135 ?auto_241140 ) ) ( not ( = ?auto_241135 ?auto_241141 ) ) ( not ( = ?auto_241135 ?auto_241142 ) ) ( not ( = ?auto_241135 ?auto_241143 ) ) ( not ( = ?auto_241135 ?auto_241144 ) ) ( not ( = ?auto_241136 ?auto_241137 ) ) ( not ( = ?auto_241136 ?auto_241138 ) ) ( not ( = ?auto_241136 ?auto_241139 ) ) ( not ( = ?auto_241136 ?auto_241140 ) ) ( not ( = ?auto_241136 ?auto_241141 ) ) ( not ( = ?auto_241136 ?auto_241142 ) ) ( not ( = ?auto_241136 ?auto_241143 ) ) ( not ( = ?auto_241136 ?auto_241144 ) ) ( not ( = ?auto_241137 ?auto_241138 ) ) ( not ( = ?auto_241137 ?auto_241139 ) ) ( not ( = ?auto_241137 ?auto_241140 ) ) ( not ( = ?auto_241137 ?auto_241141 ) ) ( not ( = ?auto_241137 ?auto_241142 ) ) ( not ( = ?auto_241137 ?auto_241143 ) ) ( not ( = ?auto_241137 ?auto_241144 ) ) ( not ( = ?auto_241138 ?auto_241139 ) ) ( not ( = ?auto_241138 ?auto_241140 ) ) ( not ( = ?auto_241138 ?auto_241141 ) ) ( not ( = ?auto_241138 ?auto_241142 ) ) ( not ( = ?auto_241138 ?auto_241143 ) ) ( not ( = ?auto_241138 ?auto_241144 ) ) ( not ( = ?auto_241139 ?auto_241140 ) ) ( not ( = ?auto_241139 ?auto_241141 ) ) ( not ( = ?auto_241139 ?auto_241142 ) ) ( not ( = ?auto_241139 ?auto_241143 ) ) ( not ( = ?auto_241139 ?auto_241144 ) ) ( not ( = ?auto_241140 ?auto_241141 ) ) ( not ( = ?auto_241140 ?auto_241142 ) ) ( not ( = ?auto_241140 ?auto_241143 ) ) ( not ( = ?auto_241140 ?auto_241144 ) ) ( not ( = ?auto_241141 ?auto_241142 ) ) ( not ( = ?auto_241141 ?auto_241143 ) ) ( not ( = ?auto_241141 ?auto_241144 ) ) ( not ( = ?auto_241142 ?auto_241143 ) ) ( not ( = ?auto_241142 ?auto_241144 ) ) ( not ( = ?auto_241143 ?auto_241144 ) ) ( CLEAR ?auto_241141 ) ( ON ?auto_241142 ?auto_241143 ) ( CLEAR ?auto_241142 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_241135 ?auto_241136 ?auto_241137 ?auto_241138 ?auto_241139 ?auto_241140 ?auto_241141 ?auto_241142 )
      ( MAKE-9PILE ?auto_241135 ?auto_241136 ?auto_241137 ?auto_241138 ?auto_241139 ?auto_241140 ?auto_241141 ?auto_241142 ?auto_241143 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_241154 - BLOCK
      ?auto_241155 - BLOCK
      ?auto_241156 - BLOCK
      ?auto_241157 - BLOCK
      ?auto_241158 - BLOCK
      ?auto_241159 - BLOCK
      ?auto_241160 - BLOCK
      ?auto_241161 - BLOCK
      ?auto_241162 - BLOCK
    )
    :vars
    (
      ?auto_241163 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_241162 ?auto_241163 ) ( ON-TABLE ?auto_241154 ) ( ON ?auto_241155 ?auto_241154 ) ( ON ?auto_241156 ?auto_241155 ) ( ON ?auto_241157 ?auto_241156 ) ( ON ?auto_241158 ?auto_241157 ) ( ON ?auto_241159 ?auto_241158 ) ( ON ?auto_241160 ?auto_241159 ) ( not ( = ?auto_241154 ?auto_241155 ) ) ( not ( = ?auto_241154 ?auto_241156 ) ) ( not ( = ?auto_241154 ?auto_241157 ) ) ( not ( = ?auto_241154 ?auto_241158 ) ) ( not ( = ?auto_241154 ?auto_241159 ) ) ( not ( = ?auto_241154 ?auto_241160 ) ) ( not ( = ?auto_241154 ?auto_241161 ) ) ( not ( = ?auto_241154 ?auto_241162 ) ) ( not ( = ?auto_241154 ?auto_241163 ) ) ( not ( = ?auto_241155 ?auto_241156 ) ) ( not ( = ?auto_241155 ?auto_241157 ) ) ( not ( = ?auto_241155 ?auto_241158 ) ) ( not ( = ?auto_241155 ?auto_241159 ) ) ( not ( = ?auto_241155 ?auto_241160 ) ) ( not ( = ?auto_241155 ?auto_241161 ) ) ( not ( = ?auto_241155 ?auto_241162 ) ) ( not ( = ?auto_241155 ?auto_241163 ) ) ( not ( = ?auto_241156 ?auto_241157 ) ) ( not ( = ?auto_241156 ?auto_241158 ) ) ( not ( = ?auto_241156 ?auto_241159 ) ) ( not ( = ?auto_241156 ?auto_241160 ) ) ( not ( = ?auto_241156 ?auto_241161 ) ) ( not ( = ?auto_241156 ?auto_241162 ) ) ( not ( = ?auto_241156 ?auto_241163 ) ) ( not ( = ?auto_241157 ?auto_241158 ) ) ( not ( = ?auto_241157 ?auto_241159 ) ) ( not ( = ?auto_241157 ?auto_241160 ) ) ( not ( = ?auto_241157 ?auto_241161 ) ) ( not ( = ?auto_241157 ?auto_241162 ) ) ( not ( = ?auto_241157 ?auto_241163 ) ) ( not ( = ?auto_241158 ?auto_241159 ) ) ( not ( = ?auto_241158 ?auto_241160 ) ) ( not ( = ?auto_241158 ?auto_241161 ) ) ( not ( = ?auto_241158 ?auto_241162 ) ) ( not ( = ?auto_241158 ?auto_241163 ) ) ( not ( = ?auto_241159 ?auto_241160 ) ) ( not ( = ?auto_241159 ?auto_241161 ) ) ( not ( = ?auto_241159 ?auto_241162 ) ) ( not ( = ?auto_241159 ?auto_241163 ) ) ( not ( = ?auto_241160 ?auto_241161 ) ) ( not ( = ?auto_241160 ?auto_241162 ) ) ( not ( = ?auto_241160 ?auto_241163 ) ) ( not ( = ?auto_241161 ?auto_241162 ) ) ( not ( = ?auto_241161 ?auto_241163 ) ) ( not ( = ?auto_241162 ?auto_241163 ) ) ( CLEAR ?auto_241160 ) ( ON ?auto_241161 ?auto_241162 ) ( CLEAR ?auto_241161 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_241154 ?auto_241155 ?auto_241156 ?auto_241157 ?auto_241158 ?auto_241159 ?auto_241160 ?auto_241161 )
      ( MAKE-9PILE ?auto_241154 ?auto_241155 ?auto_241156 ?auto_241157 ?auto_241158 ?auto_241159 ?auto_241160 ?auto_241161 ?auto_241162 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_241173 - BLOCK
      ?auto_241174 - BLOCK
      ?auto_241175 - BLOCK
      ?auto_241176 - BLOCK
      ?auto_241177 - BLOCK
      ?auto_241178 - BLOCK
      ?auto_241179 - BLOCK
      ?auto_241180 - BLOCK
      ?auto_241181 - BLOCK
    )
    :vars
    (
      ?auto_241182 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_241181 ?auto_241182 ) ( ON-TABLE ?auto_241173 ) ( ON ?auto_241174 ?auto_241173 ) ( ON ?auto_241175 ?auto_241174 ) ( ON ?auto_241176 ?auto_241175 ) ( ON ?auto_241177 ?auto_241176 ) ( ON ?auto_241178 ?auto_241177 ) ( not ( = ?auto_241173 ?auto_241174 ) ) ( not ( = ?auto_241173 ?auto_241175 ) ) ( not ( = ?auto_241173 ?auto_241176 ) ) ( not ( = ?auto_241173 ?auto_241177 ) ) ( not ( = ?auto_241173 ?auto_241178 ) ) ( not ( = ?auto_241173 ?auto_241179 ) ) ( not ( = ?auto_241173 ?auto_241180 ) ) ( not ( = ?auto_241173 ?auto_241181 ) ) ( not ( = ?auto_241173 ?auto_241182 ) ) ( not ( = ?auto_241174 ?auto_241175 ) ) ( not ( = ?auto_241174 ?auto_241176 ) ) ( not ( = ?auto_241174 ?auto_241177 ) ) ( not ( = ?auto_241174 ?auto_241178 ) ) ( not ( = ?auto_241174 ?auto_241179 ) ) ( not ( = ?auto_241174 ?auto_241180 ) ) ( not ( = ?auto_241174 ?auto_241181 ) ) ( not ( = ?auto_241174 ?auto_241182 ) ) ( not ( = ?auto_241175 ?auto_241176 ) ) ( not ( = ?auto_241175 ?auto_241177 ) ) ( not ( = ?auto_241175 ?auto_241178 ) ) ( not ( = ?auto_241175 ?auto_241179 ) ) ( not ( = ?auto_241175 ?auto_241180 ) ) ( not ( = ?auto_241175 ?auto_241181 ) ) ( not ( = ?auto_241175 ?auto_241182 ) ) ( not ( = ?auto_241176 ?auto_241177 ) ) ( not ( = ?auto_241176 ?auto_241178 ) ) ( not ( = ?auto_241176 ?auto_241179 ) ) ( not ( = ?auto_241176 ?auto_241180 ) ) ( not ( = ?auto_241176 ?auto_241181 ) ) ( not ( = ?auto_241176 ?auto_241182 ) ) ( not ( = ?auto_241177 ?auto_241178 ) ) ( not ( = ?auto_241177 ?auto_241179 ) ) ( not ( = ?auto_241177 ?auto_241180 ) ) ( not ( = ?auto_241177 ?auto_241181 ) ) ( not ( = ?auto_241177 ?auto_241182 ) ) ( not ( = ?auto_241178 ?auto_241179 ) ) ( not ( = ?auto_241178 ?auto_241180 ) ) ( not ( = ?auto_241178 ?auto_241181 ) ) ( not ( = ?auto_241178 ?auto_241182 ) ) ( not ( = ?auto_241179 ?auto_241180 ) ) ( not ( = ?auto_241179 ?auto_241181 ) ) ( not ( = ?auto_241179 ?auto_241182 ) ) ( not ( = ?auto_241180 ?auto_241181 ) ) ( not ( = ?auto_241180 ?auto_241182 ) ) ( not ( = ?auto_241181 ?auto_241182 ) ) ( ON ?auto_241180 ?auto_241181 ) ( CLEAR ?auto_241178 ) ( ON ?auto_241179 ?auto_241180 ) ( CLEAR ?auto_241179 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_241173 ?auto_241174 ?auto_241175 ?auto_241176 ?auto_241177 ?auto_241178 ?auto_241179 )
      ( MAKE-9PILE ?auto_241173 ?auto_241174 ?auto_241175 ?auto_241176 ?auto_241177 ?auto_241178 ?auto_241179 ?auto_241180 ?auto_241181 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_241192 - BLOCK
      ?auto_241193 - BLOCK
      ?auto_241194 - BLOCK
      ?auto_241195 - BLOCK
      ?auto_241196 - BLOCK
      ?auto_241197 - BLOCK
      ?auto_241198 - BLOCK
      ?auto_241199 - BLOCK
      ?auto_241200 - BLOCK
    )
    :vars
    (
      ?auto_241201 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_241200 ?auto_241201 ) ( ON-TABLE ?auto_241192 ) ( ON ?auto_241193 ?auto_241192 ) ( ON ?auto_241194 ?auto_241193 ) ( ON ?auto_241195 ?auto_241194 ) ( ON ?auto_241196 ?auto_241195 ) ( ON ?auto_241197 ?auto_241196 ) ( not ( = ?auto_241192 ?auto_241193 ) ) ( not ( = ?auto_241192 ?auto_241194 ) ) ( not ( = ?auto_241192 ?auto_241195 ) ) ( not ( = ?auto_241192 ?auto_241196 ) ) ( not ( = ?auto_241192 ?auto_241197 ) ) ( not ( = ?auto_241192 ?auto_241198 ) ) ( not ( = ?auto_241192 ?auto_241199 ) ) ( not ( = ?auto_241192 ?auto_241200 ) ) ( not ( = ?auto_241192 ?auto_241201 ) ) ( not ( = ?auto_241193 ?auto_241194 ) ) ( not ( = ?auto_241193 ?auto_241195 ) ) ( not ( = ?auto_241193 ?auto_241196 ) ) ( not ( = ?auto_241193 ?auto_241197 ) ) ( not ( = ?auto_241193 ?auto_241198 ) ) ( not ( = ?auto_241193 ?auto_241199 ) ) ( not ( = ?auto_241193 ?auto_241200 ) ) ( not ( = ?auto_241193 ?auto_241201 ) ) ( not ( = ?auto_241194 ?auto_241195 ) ) ( not ( = ?auto_241194 ?auto_241196 ) ) ( not ( = ?auto_241194 ?auto_241197 ) ) ( not ( = ?auto_241194 ?auto_241198 ) ) ( not ( = ?auto_241194 ?auto_241199 ) ) ( not ( = ?auto_241194 ?auto_241200 ) ) ( not ( = ?auto_241194 ?auto_241201 ) ) ( not ( = ?auto_241195 ?auto_241196 ) ) ( not ( = ?auto_241195 ?auto_241197 ) ) ( not ( = ?auto_241195 ?auto_241198 ) ) ( not ( = ?auto_241195 ?auto_241199 ) ) ( not ( = ?auto_241195 ?auto_241200 ) ) ( not ( = ?auto_241195 ?auto_241201 ) ) ( not ( = ?auto_241196 ?auto_241197 ) ) ( not ( = ?auto_241196 ?auto_241198 ) ) ( not ( = ?auto_241196 ?auto_241199 ) ) ( not ( = ?auto_241196 ?auto_241200 ) ) ( not ( = ?auto_241196 ?auto_241201 ) ) ( not ( = ?auto_241197 ?auto_241198 ) ) ( not ( = ?auto_241197 ?auto_241199 ) ) ( not ( = ?auto_241197 ?auto_241200 ) ) ( not ( = ?auto_241197 ?auto_241201 ) ) ( not ( = ?auto_241198 ?auto_241199 ) ) ( not ( = ?auto_241198 ?auto_241200 ) ) ( not ( = ?auto_241198 ?auto_241201 ) ) ( not ( = ?auto_241199 ?auto_241200 ) ) ( not ( = ?auto_241199 ?auto_241201 ) ) ( not ( = ?auto_241200 ?auto_241201 ) ) ( ON ?auto_241199 ?auto_241200 ) ( CLEAR ?auto_241197 ) ( ON ?auto_241198 ?auto_241199 ) ( CLEAR ?auto_241198 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_241192 ?auto_241193 ?auto_241194 ?auto_241195 ?auto_241196 ?auto_241197 ?auto_241198 )
      ( MAKE-9PILE ?auto_241192 ?auto_241193 ?auto_241194 ?auto_241195 ?auto_241196 ?auto_241197 ?auto_241198 ?auto_241199 ?auto_241200 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_241211 - BLOCK
      ?auto_241212 - BLOCK
      ?auto_241213 - BLOCK
      ?auto_241214 - BLOCK
      ?auto_241215 - BLOCK
      ?auto_241216 - BLOCK
      ?auto_241217 - BLOCK
      ?auto_241218 - BLOCK
      ?auto_241219 - BLOCK
    )
    :vars
    (
      ?auto_241220 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_241219 ?auto_241220 ) ( ON-TABLE ?auto_241211 ) ( ON ?auto_241212 ?auto_241211 ) ( ON ?auto_241213 ?auto_241212 ) ( ON ?auto_241214 ?auto_241213 ) ( ON ?auto_241215 ?auto_241214 ) ( not ( = ?auto_241211 ?auto_241212 ) ) ( not ( = ?auto_241211 ?auto_241213 ) ) ( not ( = ?auto_241211 ?auto_241214 ) ) ( not ( = ?auto_241211 ?auto_241215 ) ) ( not ( = ?auto_241211 ?auto_241216 ) ) ( not ( = ?auto_241211 ?auto_241217 ) ) ( not ( = ?auto_241211 ?auto_241218 ) ) ( not ( = ?auto_241211 ?auto_241219 ) ) ( not ( = ?auto_241211 ?auto_241220 ) ) ( not ( = ?auto_241212 ?auto_241213 ) ) ( not ( = ?auto_241212 ?auto_241214 ) ) ( not ( = ?auto_241212 ?auto_241215 ) ) ( not ( = ?auto_241212 ?auto_241216 ) ) ( not ( = ?auto_241212 ?auto_241217 ) ) ( not ( = ?auto_241212 ?auto_241218 ) ) ( not ( = ?auto_241212 ?auto_241219 ) ) ( not ( = ?auto_241212 ?auto_241220 ) ) ( not ( = ?auto_241213 ?auto_241214 ) ) ( not ( = ?auto_241213 ?auto_241215 ) ) ( not ( = ?auto_241213 ?auto_241216 ) ) ( not ( = ?auto_241213 ?auto_241217 ) ) ( not ( = ?auto_241213 ?auto_241218 ) ) ( not ( = ?auto_241213 ?auto_241219 ) ) ( not ( = ?auto_241213 ?auto_241220 ) ) ( not ( = ?auto_241214 ?auto_241215 ) ) ( not ( = ?auto_241214 ?auto_241216 ) ) ( not ( = ?auto_241214 ?auto_241217 ) ) ( not ( = ?auto_241214 ?auto_241218 ) ) ( not ( = ?auto_241214 ?auto_241219 ) ) ( not ( = ?auto_241214 ?auto_241220 ) ) ( not ( = ?auto_241215 ?auto_241216 ) ) ( not ( = ?auto_241215 ?auto_241217 ) ) ( not ( = ?auto_241215 ?auto_241218 ) ) ( not ( = ?auto_241215 ?auto_241219 ) ) ( not ( = ?auto_241215 ?auto_241220 ) ) ( not ( = ?auto_241216 ?auto_241217 ) ) ( not ( = ?auto_241216 ?auto_241218 ) ) ( not ( = ?auto_241216 ?auto_241219 ) ) ( not ( = ?auto_241216 ?auto_241220 ) ) ( not ( = ?auto_241217 ?auto_241218 ) ) ( not ( = ?auto_241217 ?auto_241219 ) ) ( not ( = ?auto_241217 ?auto_241220 ) ) ( not ( = ?auto_241218 ?auto_241219 ) ) ( not ( = ?auto_241218 ?auto_241220 ) ) ( not ( = ?auto_241219 ?auto_241220 ) ) ( ON ?auto_241218 ?auto_241219 ) ( ON ?auto_241217 ?auto_241218 ) ( CLEAR ?auto_241215 ) ( ON ?auto_241216 ?auto_241217 ) ( CLEAR ?auto_241216 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_241211 ?auto_241212 ?auto_241213 ?auto_241214 ?auto_241215 ?auto_241216 )
      ( MAKE-9PILE ?auto_241211 ?auto_241212 ?auto_241213 ?auto_241214 ?auto_241215 ?auto_241216 ?auto_241217 ?auto_241218 ?auto_241219 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_241230 - BLOCK
      ?auto_241231 - BLOCK
      ?auto_241232 - BLOCK
      ?auto_241233 - BLOCK
      ?auto_241234 - BLOCK
      ?auto_241235 - BLOCK
      ?auto_241236 - BLOCK
      ?auto_241237 - BLOCK
      ?auto_241238 - BLOCK
    )
    :vars
    (
      ?auto_241239 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_241238 ?auto_241239 ) ( ON-TABLE ?auto_241230 ) ( ON ?auto_241231 ?auto_241230 ) ( ON ?auto_241232 ?auto_241231 ) ( ON ?auto_241233 ?auto_241232 ) ( ON ?auto_241234 ?auto_241233 ) ( not ( = ?auto_241230 ?auto_241231 ) ) ( not ( = ?auto_241230 ?auto_241232 ) ) ( not ( = ?auto_241230 ?auto_241233 ) ) ( not ( = ?auto_241230 ?auto_241234 ) ) ( not ( = ?auto_241230 ?auto_241235 ) ) ( not ( = ?auto_241230 ?auto_241236 ) ) ( not ( = ?auto_241230 ?auto_241237 ) ) ( not ( = ?auto_241230 ?auto_241238 ) ) ( not ( = ?auto_241230 ?auto_241239 ) ) ( not ( = ?auto_241231 ?auto_241232 ) ) ( not ( = ?auto_241231 ?auto_241233 ) ) ( not ( = ?auto_241231 ?auto_241234 ) ) ( not ( = ?auto_241231 ?auto_241235 ) ) ( not ( = ?auto_241231 ?auto_241236 ) ) ( not ( = ?auto_241231 ?auto_241237 ) ) ( not ( = ?auto_241231 ?auto_241238 ) ) ( not ( = ?auto_241231 ?auto_241239 ) ) ( not ( = ?auto_241232 ?auto_241233 ) ) ( not ( = ?auto_241232 ?auto_241234 ) ) ( not ( = ?auto_241232 ?auto_241235 ) ) ( not ( = ?auto_241232 ?auto_241236 ) ) ( not ( = ?auto_241232 ?auto_241237 ) ) ( not ( = ?auto_241232 ?auto_241238 ) ) ( not ( = ?auto_241232 ?auto_241239 ) ) ( not ( = ?auto_241233 ?auto_241234 ) ) ( not ( = ?auto_241233 ?auto_241235 ) ) ( not ( = ?auto_241233 ?auto_241236 ) ) ( not ( = ?auto_241233 ?auto_241237 ) ) ( not ( = ?auto_241233 ?auto_241238 ) ) ( not ( = ?auto_241233 ?auto_241239 ) ) ( not ( = ?auto_241234 ?auto_241235 ) ) ( not ( = ?auto_241234 ?auto_241236 ) ) ( not ( = ?auto_241234 ?auto_241237 ) ) ( not ( = ?auto_241234 ?auto_241238 ) ) ( not ( = ?auto_241234 ?auto_241239 ) ) ( not ( = ?auto_241235 ?auto_241236 ) ) ( not ( = ?auto_241235 ?auto_241237 ) ) ( not ( = ?auto_241235 ?auto_241238 ) ) ( not ( = ?auto_241235 ?auto_241239 ) ) ( not ( = ?auto_241236 ?auto_241237 ) ) ( not ( = ?auto_241236 ?auto_241238 ) ) ( not ( = ?auto_241236 ?auto_241239 ) ) ( not ( = ?auto_241237 ?auto_241238 ) ) ( not ( = ?auto_241237 ?auto_241239 ) ) ( not ( = ?auto_241238 ?auto_241239 ) ) ( ON ?auto_241237 ?auto_241238 ) ( ON ?auto_241236 ?auto_241237 ) ( CLEAR ?auto_241234 ) ( ON ?auto_241235 ?auto_241236 ) ( CLEAR ?auto_241235 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_241230 ?auto_241231 ?auto_241232 ?auto_241233 ?auto_241234 ?auto_241235 )
      ( MAKE-9PILE ?auto_241230 ?auto_241231 ?auto_241232 ?auto_241233 ?auto_241234 ?auto_241235 ?auto_241236 ?auto_241237 ?auto_241238 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_241249 - BLOCK
      ?auto_241250 - BLOCK
      ?auto_241251 - BLOCK
      ?auto_241252 - BLOCK
      ?auto_241253 - BLOCK
      ?auto_241254 - BLOCK
      ?auto_241255 - BLOCK
      ?auto_241256 - BLOCK
      ?auto_241257 - BLOCK
    )
    :vars
    (
      ?auto_241258 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_241257 ?auto_241258 ) ( ON-TABLE ?auto_241249 ) ( ON ?auto_241250 ?auto_241249 ) ( ON ?auto_241251 ?auto_241250 ) ( ON ?auto_241252 ?auto_241251 ) ( not ( = ?auto_241249 ?auto_241250 ) ) ( not ( = ?auto_241249 ?auto_241251 ) ) ( not ( = ?auto_241249 ?auto_241252 ) ) ( not ( = ?auto_241249 ?auto_241253 ) ) ( not ( = ?auto_241249 ?auto_241254 ) ) ( not ( = ?auto_241249 ?auto_241255 ) ) ( not ( = ?auto_241249 ?auto_241256 ) ) ( not ( = ?auto_241249 ?auto_241257 ) ) ( not ( = ?auto_241249 ?auto_241258 ) ) ( not ( = ?auto_241250 ?auto_241251 ) ) ( not ( = ?auto_241250 ?auto_241252 ) ) ( not ( = ?auto_241250 ?auto_241253 ) ) ( not ( = ?auto_241250 ?auto_241254 ) ) ( not ( = ?auto_241250 ?auto_241255 ) ) ( not ( = ?auto_241250 ?auto_241256 ) ) ( not ( = ?auto_241250 ?auto_241257 ) ) ( not ( = ?auto_241250 ?auto_241258 ) ) ( not ( = ?auto_241251 ?auto_241252 ) ) ( not ( = ?auto_241251 ?auto_241253 ) ) ( not ( = ?auto_241251 ?auto_241254 ) ) ( not ( = ?auto_241251 ?auto_241255 ) ) ( not ( = ?auto_241251 ?auto_241256 ) ) ( not ( = ?auto_241251 ?auto_241257 ) ) ( not ( = ?auto_241251 ?auto_241258 ) ) ( not ( = ?auto_241252 ?auto_241253 ) ) ( not ( = ?auto_241252 ?auto_241254 ) ) ( not ( = ?auto_241252 ?auto_241255 ) ) ( not ( = ?auto_241252 ?auto_241256 ) ) ( not ( = ?auto_241252 ?auto_241257 ) ) ( not ( = ?auto_241252 ?auto_241258 ) ) ( not ( = ?auto_241253 ?auto_241254 ) ) ( not ( = ?auto_241253 ?auto_241255 ) ) ( not ( = ?auto_241253 ?auto_241256 ) ) ( not ( = ?auto_241253 ?auto_241257 ) ) ( not ( = ?auto_241253 ?auto_241258 ) ) ( not ( = ?auto_241254 ?auto_241255 ) ) ( not ( = ?auto_241254 ?auto_241256 ) ) ( not ( = ?auto_241254 ?auto_241257 ) ) ( not ( = ?auto_241254 ?auto_241258 ) ) ( not ( = ?auto_241255 ?auto_241256 ) ) ( not ( = ?auto_241255 ?auto_241257 ) ) ( not ( = ?auto_241255 ?auto_241258 ) ) ( not ( = ?auto_241256 ?auto_241257 ) ) ( not ( = ?auto_241256 ?auto_241258 ) ) ( not ( = ?auto_241257 ?auto_241258 ) ) ( ON ?auto_241256 ?auto_241257 ) ( ON ?auto_241255 ?auto_241256 ) ( ON ?auto_241254 ?auto_241255 ) ( CLEAR ?auto_241252 ) ( ON ?auto_241253 ?auto_241254 ) ( CLEAR ?auto_241253 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_241249 ?auto_241250 ?auto_241251 ?auto_241252 ?auto_241253 )
      ( MAKE-9PILE ?auto_241249 ?auto_241250 ?auto_241251 ?auto_241252 ?auto_241253 ?auto_241254 ?auto_241255 ?auto_241256 ?auto_241257 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_241268 - BLOCK
      ?auto_241269 - BLOCK
      ?auto_241270 - BLOCK
      ?auto_241271 - BLOCK
      ?auto_241272 - BLOCK
      ?auto_241273 - BLOCK
      ?auto_241274 - BLOCK
      ?auto_241275 - BLOCK
      ?auto_241276 - BLOCK
    )
    :vars
    (
      ?auto_241277 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_241276 ?auto_241277 ) ( ON-TABLE ?auto_241268 ) ( ON ?auto_241269 ?auto_241268 ) ( ON ?auto_241270 ?auto_241269 ) ( ON ?auto_241271 ?auto_241270 ) ( not ( = ?auto_241268 ?auto_241269 ) ) ( not ( = ?auto_241268 ?auto_241270 ) ) ( not ( = ?auto_241268 ?auto_241271 ) ) ( not ( = ?auto_241268 ?auto_241272 ) ) ( not ( = ?auto_241268 ?auto_241273 ) ) ( not ( = ?auto_241268 ?auto_241274 ) ) ( not ( = ?auto_241268 ?auto_241275 ) ) ( not ( = ?auto_241268 ?auto_241276 ) ) ( not ( = ?auto_241268 ?auto_241277 ) ) ( not ( = ?auto_241269 ?auto_241270 ) ) ( not ( = ?auto_241269 ?auto_241271 ) ) ( not ( = ?auto_241269 ?auto_241272 ) ) ( not ( = ?auto_241269 ?auto_241273 ) ) ( not ( = ?auto_241269 ?auto_241274 ) ) ( not ( = ?auto_241269 ?auto_241275 ) ) ( not ( = ?auto_241269 ?auto_241276 ) ) ( not ( = ?auto_241269 ?auto_241277 ) ) ( not ( = ?auto_241270 ?auto_241271 ) ) ( not ( = ?auto_241270 ?auto_241272 ) ) ( not ( = ?auto_241270 ?auto_241273 ) ) ( not ( = ?auto_241270 ?auto_241274 ) ) ( not ( = ?auto_241270 ?auto_241275 ) ) ( not ( = ?auto_241270 ?auto_241276 ) ) ( not ( = ?auto_241270 ?auto_241277 ) ) ( not ( = ?auto_241271 ?auto_241272 ) ) ( not ( = ?auto_241271 ?auto_241273 ) ) ( not ( = ?auto_241271 ?auto_241274 ) ) ( not ( = ?auto_241271 ?auto_241275 ) ) ( not ( = ?auto_241271 ?auto_241276 ) ) ( not ( = ?auto_241271 ?auto_241277 ) ) ( not ( = ?auto_241272 ?auto_241273 ) ) ( not ( = ?auto_241272 ?auto_241274 ) ) ( not ( = ?auto_241272 ?auto_241275 ) ) ( not ( = ?auto_241272 ?auto_241276 ) ) ( not ( = ?auto_241272 ?auto_241277 ) ) ( not ( = ?auto_241273 ?auto_241274 ) ) ( not ( = ?auto_241273 ?auto_241275 ) ) ( not ( = ?auto_241273 ?auto_241276 ) ) ( not ( = ?auto_241273 ?auto_241277 ) ) ( not ( = ?auto_241274 ?auto_241275 ) ) ( not ( = ?auto_241274 ?auto_241276 ) ) ( not ( = ?auto_241274 ?auto_241277 ) ) ( not ( = ?auto_241275 ?auto_241276 ) ) ( not ( = ?auto_241275 ?auto_241277 ) ) ( not ( = ?auto_241276 ?auto_241277 ) ) ( ON ?auto_241275 ?auto_241276 ) ( ON ?auto_241274 ?auto_241275 ) ( ON ?auto_241273 ?auto_241274 ) ( CLEAR ?auto_241271 ) ( ON ?auto_241272 ?auto_241273 ) ( CLEAR ?auto_241272 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_241268 ?auto_241269 ?auto_241270 ?auto_241271 ?auto_241272 )
      ( MAKE-9PILE ?auto_241268 ?auto_241269 ?auto_241270 ?auto_241271 ?auto_241272 ?auto_241273 ?auto_241274 ?auto_241275 ?auto_241276 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_241287 - BLOCK
      ?auto_241288 - BLOCK
      ?auto_241289 - BLOCK
      ?auto_241290 - BLOCK
      ?auto_241291 - BLOCK
      ?auto_241292 - BLOCK
      ?auto_241293 - BLOCK
      ?auto_241294 - BLOCK
      ?auto_241295 - BLOCK
    )
    :vars
    (
      ?auto_241296 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_241295 ?auto_241296 ) ( ON-TABLE ?auto_241287 ) ( ON ?auto_241288 ?auto_241287 ) ( ON ?auto_241289 ?auto_241288 ) ( not ( = ?auto_241287 ?auto_241288 ) ) ( not ( = ?auto_241287 ?auto_241289 ) ) ( not ( = ?auto_241287 ?auto_241290 ) ) ( not ( = ?auto_241287 ?auto_241291 ) ) ( not ( = ?auto_241287 ?auto_241292 ) ) ( not ( = ?auto_241287 ?auto_241293 ) ) ( not ( = ?auto_241287 ?auto_241294 ) ) ( not ( = ?auto_241287 ?auto_241295 ) ) ( not ( = ?auto_241287 ?auto_241296 ) ) ( not ( = ?auto_241288 ?auto_241289 ) ) ( not ( = ?auto_241288 ?auto_241290 ) ) ( not ( = ?auto_241288 ?auto_241291 ) ) ( not ( = ?auto_241288 ?auto_241292 ) ) ( not ( = ?auto_241288 ?auto_241293 ) ) ( not ( = ?auto_241288 ?auto_241294 ) ) ( not ( = ?auto_241288 ?auto_241295 ) ) ( not ( = ?auto_241288 ?auto_241296 ) ) ( not ( = ?auto_241289 ?auto_241290 ) ) ( not ( = ?auto_241289 ?auto_241291 ) ) ( not ( = ?auto_241289 ?auto_241292 ) ) ( not ( = ?auto_241289 ?auto_241293 ) ) ( not ( = ?auto_241289 ?auto_241294 ) ) ( not ( = ?auto_241289 ?auto_241295 ) ) ( not ( = ?auto_241289 ?auto_241296 ) ) ( not ( = ?auto_241290 ?auto_241291 ) ) ( not ( = ?auto_241290 ?auto_241292 ) ) ( not ( = ?auto_241290 ?auto_241293 ) ) ( not ( = ?auto_241290 ?auto_241294 ) ) ( not ( = ?auto_241290 ?auto_241295 ) ) ( not ( = ?auto_241290 ?auto_241296 ) ) ( not ( = ?auto_241291 ?auto_241292 ) ) ( not ( = ?auto_241291 ?auto_241293 ) ) ( not ( = ?auto_241291 ?auto_241294 ) ) ( not ( = ?auto_241291 ?auto_241295 ) ) ( not ( = ?auto_241291 ?auto_241296 ) ) ( not ( = ?auto_241292 ?auto_241293 ) ) ( not ( = ?auto_241292 ?auto_241294 ) ) ( not ( = ?auto_241292 ?auto_241295 ) ) ( not ( = ?auto_241292 ?auto_241296 ) ) ( not ( = ?auto_241293 ?auto_241294 ) ) ( not ( = ?auto_241293 ?auto_241295 ) ) ( not ( = ?auto_241293 ?auto_241296 ) ) ( not ( = ?auto_241294 ?auto_241295 ) ) ( not ( = ?auto_241294 ?auto_241296 ) ) ( not ( = ?auto_241295 ?auto_241296 ) ) ( ON ?auto_241294 ?auto_241295 ) ( ON ?auto_241293 ?auto_241294 ) ( ON ?auto_241292 ?auto_241293 ) ( ON ?auto_241291 ?auto_241292 ) ( CLEAR ?auto_241289 ) ( ON ?auto_241290 ?auto_241291 ) ( CLEAR ?auto_241290 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_241287 ?auto_241288 ?auto_241289 ?auto_241290 )
      ( MAKE-9PILE ?auto_241287 ?auto_241288 ?auto_241289 ?auto_241290 ?auto_241291 ?auto_241292 ?auto_241293 ?auto_241294 ?auto_241295 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_241306 - BLOCK
      ?auto_241307 - BLOCK
      ?auto_241308 - BLOCK
      ?auto_241309 - BLOCK
      ?auto_241310 - BLOCK
      ?auto_241311 - BLOCK
      ?auto_241312 - BLOCK
      ?auto_241313 - BLOCK
      ?auto_241314 - BLOCK
    )
    :vars
    (
      ?auto_241315 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_241314 ?auto_241315 ) ( ON-TABLE ?auto_241306 ) ( ON ?auto_241307 ?auto_241306 ) ( ON ?auto_241308 ?auto_241307 ) ( not ( = ?auto_241306 ?auto_241307 ) ) ( not ( = ?auto_241306 ?auto_241308 ) ) ( not ( = ?auto_241306 ?auto_241309 ) ) ( not ( = ?auto_241306 ?auto_241310 ) ) ( not ( = ?auto_241306 ?auto_241311 ) ) ( not ( = ?auto_241306 ?auto_241312 ) ) ( not ( = ?auto_241306 ?auto_241313 ) ) ( not ( = ?auto_241306 ?auto_241314 ) ) ( not ( = ?auto_241306 ?auto_241315 ) ) ( not ( = ?auto_241307 ?auto_241308 ) ) ( not ( = ?auto_241307 ?auto_241309 ) ) ( not ( = ?auto_241307 ?auto_241310 ) ) ( not ( = ?auto_241307 ?auto_241311 ) ) ( not ( = ?auto_241307 ?auto_241312 ) ) ( not ( = ?auto_241307 ?auto_241313 ) ) ( not ( = ?auto_241307 ?auto_241314 ) ) ( not ( = ?auto_241307 ?auto_241315 ) ) ( not ( = ?auto_241308 ?auto_241309 ) ) ( not ( = ?auto_241308 ?auto_241310 ) ) ( not ( = ?auto_241308 ?auto_241311 ) ) ( not ( = ?auto_241308 ?auto_241312 ) ) ( not ( = ?auto_241308 ?auto_241313 ) ) ( not ( = ?auto_241308 ?auto_241314 ) ) ( not ( = ?auto_241308 ?auto_241315 ) ) ( not ( = ?auto_241309 ?auto_241310 ) ) ( not ( = ?auto_241309 ?auto_241311 ) ) ( not ( = ?auto_241309 ?auto_241312 ) ) ( not ( = ?auto_241309 ?auto_241313 ) ) ( not ( = ?auto_241309 ?auto_241314 ) ) ( not ( = ?auto_241309 ?auto_241315 ) ) ( not ( = ?auto_241310 ?auto_241311 ) ) ( not ( = ?auto_241310 ?auto_241312 ) ) ( not ( = ?auto_241310 ?auto_241313 ) ) ( not ( = ?auto_241310 ?auto_241314 ) ) ( not ( = ?auto_241310 ?auto_241315 ) ) ( not ( = ?auto_241311 ?auto_241312 ) ) ( not ( = ?auto_241311 ?auto_241313 ) ) ( not ( = ?auto_241311 ?auto_241314 ) ) ( not ( = ?auto_241311 ?auto_241315 ) ) ( not ( = ?auto_241312 ?auto_241313 ) ) ( not ( = ?auto_241312 ?auto_241314 ) ) ( not ( = ?auto_241312 ?auto_241315 ) ) ( not ( = ?auto_241313 ?auto_241314 ) ) ( not ( = ?auto_241313 ?auto_241315 ) ) ( not ( = ?auto_241314 ?auto_241315 ) ) ( ON ?auto_241313 ?auto_241314 ) ( ON ?auto_241312 ?auto_241313 ) ( ON ?auto_241311 ?auto_241312 ) ( ON ?auto_241310 ?auto_241311 ) ( CLEAR ?auto_241308 ) ( ON ?auto_241309 ?auto_241310 ) ( CLEAR ?auto_241309 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_241306 ?auto_241307 ?auto_241308 ?auto_241309 )
      ( MAKE-9PILE ?auto_241306 ?auto_241307 ?auto_241308 ?auto_241309 ?auto_241310 ?auto_241311 ?auto_241312 ?auto_241313 ?auto_241314 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_241325 - BLOCK
      ?auto_241326 - BLOCK
      ?auto_241327 - BLOCK
      ?auto_241328 - BLOCK
      ?auto_241329 - BLOCK
      ?auto_241330 - BLOCK
      ?auto_241331 - BLOCK
      ?auto_241332 - BLOCK
      ?auto_241333 - BLOCK
    )
    :vars
    (
      ?auto_241334 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_241333 ?auto_241334 ) ( ON-TABLE ?auto_241325 ) ( ON ?auto_241326 ?auto_241325 ) ( not ( = ?auto_241325 ?auto_241326 ) ) ( not ( = ?auto_241325 ?auto_241327 ) ) ( not ( = ?auto_241325 ?auto_241328 ) ) ( not ( = ?auto_241325 ?auto_241329 ) ) ( not ( = ?auto_241325 ?auto_241330 ) ) ( not ( = ?auto_241325 ?auto_241331 ) ) ( not ( = ?auto_241325 ?auto_241332 ) ) ( not ( = ?auto_241325 ?auto_241333 ) ) ( not ( = ?auto_241325 ?auto_241334 ) ) ( not ( = ?auto_241326 ?auto_241327 ) ) ( not ( = ?auto_241326 ?auto_241328 ) ) ( not ( = ?auto_241326 ?auto_241329 ) ) ( not ( = ?auto_241326 ?auto_241330 ) ) ( not ( = ?auto_241326 ?auto_241331 ) ) ( not ( = ?auto_241326 ?auto_241332 ) ) ( not ( = ?auto_241326 ?auto_241333 ) ) ( not ( = ?auto_241326 ?auto_241334 ) ) ( not ( = ?auto_241327 ?auto_241328 ) ) ( not ( = ?auto_241327 ?auto_241329 ) ) ( not ( = ?auto_241327 ?auto_241330 ) ) ( not ( = ?auto_241327 ?auto_241331 ) ) ( not ( = ?auto_241327 ?auto_241332 ) ) ( not ( = ?auto_241327 ?auto_241333 ) ) ( not ( = ?auto_241327 ?auto_241334 ) ) ( not ( = ?auto_241328 ?auto_241329 ) ) ( not ( = ?auto_241328 ?auto_241330 ) ) ( not ( = ?auto_241328 ?auto_241331 ) ) ( not ( = ?auto_241328 ?auto_241332 ) ) ( not ( = ?auto_241328 ?auto_241333 ) ) ( not ( = ?auto_241328 ?auto_241334 ) ) ( not ( = ?auto_241329 ?auto_241330 ) ) ( not ( = ?auto_241329 ?auto_241331 ) ) ( not ( = ?auto_241329 ?auto_241332 ) ) ( not ( = ?auto_241329 ?auto_241333 ) ) ( not ( = ?auto_241329 ?auto_241334 ) ) ( not ( = ?auto_241330 ?auto_241331 ) ) ( not ( = ?auto_241330 ?auto_241332 ) ) ( not ( = ?auto_241330 ?auto_241333 ) ) ( not ( = ?auto_241330 ?auto_241334 ) ) ( not ( = ?auto_241331 ?auto_241332 ) ) ( not ( = ?auto_241331 ?auto_241333 ) ) ( not ( = ?auto_241331 ?auto_241334 ) ) ( not ( = ?auto_241332 ?auto_241333 ) ) ( not ( = ?auto_241332 ?auto_241334 ) ) ( not ( = ?auto_241333 ?auto_241334 ) ) ( ON ?auto_241332 ?auto_241333 ) ( ON ?auto_241331 ?auto_241332 ) ( ON ?auto_241330 ?auto_241331 ) ( ON ?auto_241329 ?auto_241330 ) ( ON ?auto_241328 ?auto_241329 ) ( CLEAR ?auto_241326 ) ( ON ?auto_241327 ?auto_241328 ) ( CLEAR ?auto_241327 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_241325 ?auto_241326 ?auto_241327 )
      ( MAKE-9PILE ?auto_241325 ?auto_241326 ?auto_241327 ?auto_241328 ?auto_241329 ?auto_241330 ?auto_241331 ?auto_241332 ?auto_241333 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_241344 - BLOCK
      ?auto_241345 - BLOCK
      ?auto_241346 - BLOCK
      ?auto_241347 - BLOCK
      ?auto_241348 - BLOCK
      ?auto_241349 - BLOCK
      ?auto_241350 - BLOCK
      ?auto_241351 - BLOCK
      ?auto_241352 - BLOCK
    )
    :vars
    (
      ?auto_241353 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_241352 ?auto_241353 ) ( ON-TABLE ?auto_241344 ) ( ON ?auto_241345 ?auto_241344 ) ( not ( = ?auto_241344 ?auto_241345 ) ) ( not ( = ?auto_241344 ?auto_241346 ) ) ( not ( = ?auto_241344 ?auto_241347 ) ) ( not ( = ?auto_241344 ?auto_241348 ) ) ( not ( = ?auto_241344 ?auto_241349 ) ) ( not ( = ?auto_241344 ?auto_241350 ) ) ( not ( = ?auto_241344 ?auto_241351 ) ) ( not ( = ?auto_241344 ?auto_241352 ) ) ( not ( = ?auto_241344 ?auto_241353 ) ) ( not ( = ?auto_241345 ?auto_241346 ) ) ( not ( = ?auto_241345 ?auto_241347 ) ) ( not ( = ?auto_241345 ?auto_241348 ) ) ( not ( = ?auto_241345 ?auto_241349 ) ) ( not ( = ?auto_241345 ?auto_241350 ) ) ( not ( = ?auto_241345 ?auto_241351 ) ) ( not ( = ?auto_241345 ?auto_241352 ) ) ( not ( = ?auto_241345 ?auto_241353 ) ) ( not ( = ?auto_241346 ?auto_241347 ) ) ( not ( = ?auto_241346 ?auto_241348 ) ) ( not ( = ?auto_241346 ?auto_241349 ) ) ( not ( = ?auto_241346 ?auto_241350 ) ) ( not ( = ?auto_241346 ?auto_241351 ) ) ( not ( = ?auto_241346 ?auto_241352 ) ) ( not ( = ?auto_241346 ?auto_241353 ) ) ( not ( = ?auto_241347 ?auto_241348 ) ) ( not ( = ?auto_241347 ?auto_241349 ) ) ( not ( = ?auto_241347 ?auto_241350 ) ) ( not ( = ?auto_241347 ?auto_241351 ) ) ( not ( = ?auto_241347 ?auto_241352 ) ) ( not ( = ?auto_241347 ?auto_241353 ) ) ( not ( = ?auto_241348 ?auto_241349 ) ) ( not ( = ?auto_241348 ?auto_241350 ) ) ( not ( = ?auto_241348 ?auto_241351 ) ) ( not ( = ?auto_241348 ?auto_241352 ) ) ( not ( = ?auto_241348 ?auto_241353 ) ) ( not ( = ?auto_241349 ?auto_241350 ) ) ( not ( = ?auto_241349 ?auto_241351 ) ) ( not ( = ?auto_241349 ?auto_241352 ) ) ( not ( = ?auto_241349 ?auto_241353 ) ) ( not ( = ?auto_241350 ?auto_241351 ) ) ( not ( = ?auto_241350 ?auto_241352 ) ) ( not ( = ?auto_241350 ?auto_241353 ) ) ( not ( = ?auto_241351 ?auto_241352 ) ) ( not ( = ?auto_241351 ?auto_241353 ) ) ( not ( = ?auto_241352 ?auto_241353 ) ) ( ON ?auto_241351 ?auto_241352 ) ( ON ?auto_241350 ?auto_241351 ) ( ON ?auto_241349 ?auto_241350 ) ( ON ?auto_241348 ?auto_241349 ) ( ON ?auto_241347 ?auto_241348 ) ( CLEAR ?auto_241345 ) ( ON ?auto_241346 ?auto_241347 ) ( CLEAR ?auto_241346 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_241344 ?auto_241345 ?auto_241346 )
      ( MAKE-9PILE ?auto_241344 ?auto_241345 ?auto_241346 ?auto_241347 ?auto_241348 ?auto_241349 ?auto_241350 ?auto_241351 ?auto_241352 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_241363 - BLOCK
      ?auto_241364 - BLOCK
      ?auto_241365 - BLOCK
      ?auto_241366 - BLOCK
      ?auto_241367 - BLOCK
      ?auto_241368 - BLOCK
      ?auto_241369 - BLOCK
      ?auto_241370 - BLOCK
      ?auto_241371 - BLOCK
    )
    :vars
    (
      ?auto_241372 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_241371 ?auto_241372 ) ( ON-TABLE ?auto_241363 ) ( not ( = ?auto_241363 ?auto_241364 ) ) ( not ( = ?auto_241363 ?auto_241365 ) ) ( not ( = ?auto_241363 ?auto_241366 ) ) ( not ( = ?auto_241363 ?auto_241367 ) ) ( not ( = ?auto_241363 ?auto_241368 ) ) ( not ( = ?auto_241363 ?auto_241369 ) ) ( not ( = ?auto_241363 ?auto_241370 ) ) ( not ( = ?auto_241363 ?auto_241371 ) ) ( not ( = ?auto_241363 ?auto_241372 ) ) ( not ( = ?auto_241364 ?auto_241365 ) ) ( not ( = ?auto_241364 ?auto_241366 ) ) ( not ( = ?auto_241364 ?auto_241367 ) ) ( not ( = ?auto_241364 ?auto_241368 ) ) ( not ( = ?auto_241364 ?auto_241369 ) ) ( not ( = ?auto_241364 ?auto_241370 ) ) ( not ( = ?auto_241364 ?auto_241371 ) ) ( not ( = ?auto_241364 ?auto_241372 ) ) ( not ( = ?auto_241365 ?auto_241366 ) ) ( not ( = ?auto_241365 ?auto_241367 ) ) ( not ( = ?auto_241365 ?auto_241368 ) ) ( not ( = ?auto_241365 ?auto_241369 ) ) ( not ( = ?auto_241365 ?auto_241370 ) ) ( not ( = ?auto_241365 ?auto_241371 ) ) ( not ( = ?auto_241365 ?auto_241372 ) ) ( not ( = ?auto_241366 ?auto_241367 ) ) ( not ( = ?auto_241366 ?auto_241368 ) ) ( not ( = ?auto_241366 ?auto_241369 ) ) ( not ( = ?auto_241366 ?auto_241370 ) ) ( not ( = ?auto_241366 ?auto_241371 ) ) ( not ( = ?auto_241366 ?auto_241372 ) ) ( not ( = ?auto_241367 ?auto_241368 ) ) ( not ( = ?auto_241367 ?auto_241369 ) ) ( not ( = ?auto_241367 ?auto_241370 ) ) ( not ( = ?auto_241367 ?auto_241371 ) ) ( not ( = ?auto_241367 ?auto_241372 ) ) ( not ( = ?auto_241368 ?auto_241369 ) ) ( not ( = ?auto_241368 ?auto_241370 ) ) ( not ( = ?auto_241368 ?auto_241371 ) ) ( not ( = ?auto_241368 ?auto_241372 ) ) ( not ( = ?auto_241369 ?auto_241370 ) ) ( not ( = ?auto_241369 ?auto_241371 ) ) ( not ( = ?auto_241369 ?auto_241372 ) ) ( not ( = ?auto_241370 ?auto_241371 ) ) ( not ( = ?auto_241370 ?auto_241372 ) ) ( not ( = ?auto_241371 ?auto_241372 ) ) ( ON ?auto_241370 ?auto_241371 ) ( ON ?auto_241369 ?auto_241370 ) ( ON ?auto_241368 ?auto_241369 ) ( ON ?auto_241367 ?auto_241368 ) ( ON ?auto_241366 ?auto_241367 ) ( ON ?auto_241365 ?auto_241366 ) ( CLEAR ?auto_241363 ) ( ON ?auto_241364 ?auto_241365 ) ( CLEAR ?auto_241364 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_241363 ?auto_241364 )
      ( MAKE-9PILE ?auto_241363 ?auto_241364 ?auto_241365 ?auto_241366 ?auto_241367 ?auto_241368 ?auto_241369 ?auto_241370 ?auto_241371 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_241382 - BLOCK
      ?auto_241383 - BLOCK
      ?auto_241384 - BLOCK
      ?auto_241385 - BLOCK
      ?auto_241386 - BLOCK
      ?auto_241387 - BLOCK
      ?auto_241388 - BLOCK
      ?auto_241389 - BLOCK
      ?auto_241390 - BLOCK
    )
    :vars
    (
      ?auto_241391 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_241390 ?auto_241391 ) ( ON-TABLE ?auto_241382 ) ( not ( = ?auto_241382 ?auto_241383 ) ) ( not ( = ?auto_241382 ?auto_241384 ) ) ( not ( = ?auto_241382 ?auto_241385 ) ) ( not ( = ?auto_241382 ?auto_241386 ) ) ( not ( = ?auto_241382 ?auto_241387 ) ) ( not ( = ?auto_241382 ?auto_241388 ) ) ( not ( = ?auto_241382 ?auto_241389 ) ) ( not ( = ?auto_241382 ?auto_241390 ) ) ( not ( = ?auto_241382 ?auto_241391 ) ) ( not ( = ?auto_241383 ?auto_241384 ) ) ( not ( = ?auto_241383 ?auto_241385 ) ) ( not ( = ?auto_241383 ?auto_241386 ) ) ( not ( = ?auto_241383 ?auto_241387 ) ) ( not ( = ?auto_241383 ?auto_241388 ) ) ( not ( = ?auto_241383 ?auto_241389 ) ) ( not ( = ?auto_241383 ?auto_241390 ) ) ( not ( = ?auto_241383 ?auto_241391 ) ) ( not ( = ?auto_241384 ?auto_241385 ) ) ( not ( = ?auto_241384 ?auto_241386 ) ) ( not ( = ?auto_241384 ?auto_241387 ) ) ( not ( = ?auto_241384 ?auto_241388 ) ) ( not ( = ?auto_241384 ?auto_241389 ) ) ( not ( = ?auto_241384 ?auto_241390 ) ) ( not ( = ?auto_241384 ?auto_241391 ) ) ( not ( = ?auto_241385 ?auto_241386 ) ) ( not ( = ?auto_241385 ?auto_241387 ) ) ( not ( = ?auto_241385 ?auto_241388 ) ) ( not ( = ?auto_241385 ?auto_241389 ) ) ( not ( = ?auto_241385 ?auto_241390 ) ) ( not ( = ?auto_241385 ?auto_241391 ) ) ( not ( = ?auto_241386 ?auto_241387 ) ) ( not ( = ?auto_241386 ?auto_241388 ) ) ( not ( = ?auto_241386 ?auto_241389 ) ) ( not ( = ?auto_241386 ?auto_241390 ) ) ( not ( = ?auto_241386 ?auto_241391 ) ) ( not ( = ?auto_241387 ?auto_241388 ) ) ( not ( = ?auto_241387 ?auto_241389 ) ) ( not ( = ?auto_241387 ?auto_241390 ) ) ( not ( = ?auto_241387 ?auto_241391 ) ) ( not ( = ?auto_241388 ?auto_241389 ) ) ( not ( = ?auto_241388 ?auto_241390 ) ) ( not ( = ?auto_241388 ?auto_241391 ) ) ( not ( = ?auto_241389 ?auto_241390 ) ) ( not ( = ?auto_241389 ?auto_241391 ) ) ( not ( = ?auto_241390 ?auto_241391 ) ) ( ON ?auto_241389 ?auto_241390 ) ( ON ?auto_241388 ?auto_241389 ) ( ON ?auto_241387 ?auto_241388 ) ( ON ?auto_241386 ?auto_241387 ) ( ON ?auto_241385 ?auto_241386 ) ( ON ?auto_241384 ?auto_241385 ) ( CLEAR ?auto_241382 ) ( ON ?auto_241383 ?auto_241384 ) ( CLEAR ?auto_241383 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_241382 ?auto_241383 )
      ( MAKE-9PILE ?auto_241382 ?auto_241383 ?auto_241384 ?auto_241385 ?auto_241386 ?auto_241387 ?auto_241388 ?auto_241389 ?auto_241390 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_241401 - BLOCK
      ?auto_241402 - BLOCK
      ?auto_241403 - BLOCK
      ?auto_241404 - BLOCK
      ?auto_241405 - BLOCK
      ?auto_241406 - BLOCK
      ?auto_241407 - BLOCK
      ?auto_241408 - BLOCK
      ?auto_241409 - BLOCK
    )
    :vars
    (
      ?auto_241410 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_241409 ?auto_241410 ) ( not ( = ?auto_241401 ?auto_241402 ) ) ( not ( = ?auto_241401 ?auto_241403 ) ) ( not ( = ?auto_241401 ?auto_241404 ) ) ( not ( = ?auto_241401 ?auto_241405 ) ) ( not ( = ?auto_241401 ?auto_241406 ) ) ( not ( = ?auto_241401 ?auto_241407 ) ) ( not ( = ?auto_241401 ?auto_241408 ) ) ( not ( = ?auto_241401 ?auto_241409 ) ) ( not ( = ?auto_241401 ?auto_241410 ) ) ( not ( = ?auto_241402 ?auto_241403 ) ) ( not ( = ?auto_241402 ?auto_241404 ) ) ( not ( = ?auto_241402 ?auto_241405 ) ) ( not ( = ?auto_241402 ?auto_241406 ) ) ( not ( = ?auto_241402 ?auto_241407 ) ) ( not ( = ?auto_241402 ?auto_241408 ) ) ( not ( = ?auto_241402 ?auto_241409 ) ) ( not ( = ?auto_241402 ?auto_241410 ) ) ( not ( = ?auto_241403 ?auto_241404 ) ) ( not ( = ?auto_241403 ?auto_241405 ) ) ( not ( = ?auto_241403 ?auto_241406 ) ) ( not ( = ?auto_241403 ?auto_241407 ) ) ( not ( = ?auto_241403 ?auto_241408 ) ) ( not ( = ?auto_241403 ?auto_241409 ) ) ( not ( = ?auto_241403 ?auto_241410 ) ) ( not ( = ?auto_241404 ?auto_241405 ) ) ( not ( = ?auto_241404 ?auto_241406 ) ) ( not ( = ?auto_241404 ?auto_241407 ) ) ( not ( = ?auto_241404 ?auto_241408 ) ) ( not ( = ?auto_241404 ?auto_241409 ) ) ( not ( = ?auto_241404 ?auto_241410 ) ) ( not ( = ?auto_241405 ?auto_241406 ) ) ( not ( = ?auto_241405 ?auto_241407 ) ) ( not ( = ?auto_241405 ?auto_241408 ) ) ( not ( = ?auto_241405 ?auto_241409 ) ) ( not ( = ?auto_241405 ?auto_241410 ) ) ( not ( = ?auto_241406 ?auto_241407 ) ) ( not ( = ?auto_241406 ?auto_241408 ) ) ( not ( = ?auto_241406 ?auto_241409 ) ) ( not ( = ?auto_241406 ?auto_241410 ) ) ( not ( = ?auto_241407 ?auto_241408 ) ) ( not ( = ?auto_241407 ?auto_241409 ) ) ( not ( = ?auto_241407 ?auto_241410 ) ) ( not ( = ?auto_241408 ?auto_241409 ) ) ( not ( = ?auto_241408 ?auto_241410 ) ) ( not ( = ?auto_241409 ?auto_241410 ) ) ( ON ?auto_241408 ?auto_241409 ) ( ON ?auto_241407 ?auto_241408 ) ( ON ?auto_241406 ?auto_241407 ) ( ON ?auto_241405 ?auto_241406 ) ( ON ?auto_241404 ?auto_241405 ) ( ON ?auto_241403 ?auto_241404 ) ( ON ?auto_241402 ?auto_241403 ) ( ON ?auto_241401 ?auto_241402 ) ( CLEAR ?auto_241401 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_241401 )
      ( MAKE-9PILE ?auto_241401 ?auto_241402 ?auto_241403 ?auto_241404 ?auto_241405 ?auto_241406 ?auto_241407 ?auto_241408 ?auto_241409 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_241420 - BLOCK
      ?auto_241421 - BLOCK
      ?auto_241422 - BLOCK
      ?auto_241423 - BLOCK
      ?auto_241424 - BLOCK
      ?auto_241425 - BLOCK
      ?auto_241426 - BLOCK
      ?auto_241427 - BLOCK
      ?auto_241428 - BLOCK
    )
    :vars
    (
      ?auto_241429 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_241428 ?auto_241429 ) ( not ( = ?auto_241420 ?auto_241421 ) ) ( not ( = ?auto_241420 ?auto_241422 ) ) ( not ( = ?auto_241420 ?auto_241423 ) ) ( not ( = ?auto_241420 ?auto_241424 ) ) ( not ( = ?auto_241420 ?auto_241425 ) ) ( not ( = ?auto_241420 ?auto_241426 ) ) ( not ( = ?auto_241420 ?auto_241427 ) ) ( not ( = ?auto_241420 ?auto_241428 ) ) ( not ( = ?auto_241420 ?auto_241429 ) ) ( not ( = ?auto_241421 ?auto_241422 ) ) ( not ( = ?auto_241421 ?auto_241423 ) ) ( not ( = ?auto_241421 ?auto_241424 ) ) ( not ( = ?auto_241421 ?auto_241425 ) ) ( not ( = ?auto_241421 ?auto_241426 ) ) ( not ( = ?auto_241421 ?auto_241427 ) ) ( not ( = ?auto_241421 ?auto_241428 ) ) ( not ( = ?auto_241421 ?auto_241429 ) ) ( not ( = ?auto_241422 ?auto_241423 ) ) ( not ( = ?auto_241422 ?auto_241424 ) ) ( not ( = ?auto_241422 ?auto_241425 ) ) ( not ( = ?auto_241422 ?auto_241426 ) ) ( not ( = ?auto_241422 ?auto_241427 ) ) ( not ( = ?auto_241422 ?auto_241428 ) ) ( not ( = ?auto_241422 ?auto_241429 ) ) ( not ( = ?auto_241423 ?auto_241424 ) ) ( not ( = ?auto_241423 ?auto_241425 ) ) ( not ( = ?auto_241423 ?auto_241426 ) ) ( not ( = ?auto_241423 ?auto_241427 ) ) ( not ( = ?auto_241423 ?auto_241428 ) ) ( not ( = ?auto_241423 ?auto_241429 ) ) ( not ( = ?auto_241424 ?auto_241425 ) ) ( not ( = ?auto_241424 ?auto_241426 ) ) ( not ( = ?auto_241424 ?auto_241427 ) ) ( not ( = ?auto_241424 ?auto_241428 ) ) ( not ( = ?auto_241424 ?auto_241429 ) ) ( not ( = ?auto_241425 ?auto_241426 ) ) ( not ( = ?auto_241425 ?auto_241427 ) ) ( not ( = ?auto_241425 ?auto_241428 ) ) ( not ( = ?auto_241425 ?auto_241429 ) ) ( not ( = ?auto_241426 ?auto_241427 ) ) ( not ( = ?auto_241426 ?auto_241428 ) ) ( not ( = ?auto_241426 ?auto_241429 ) ) ( not ( = ?auto_241427 ?auto_241428 ) ) ( not ( = ?auto_241427 ?auto_241429 ) ) ( not ( = ?auto_241428 ?auto_241429 ) ) ( ON ?auto_241427 ?auto_241428 ) ( ON ?auto_241426 ?auto_241427 ) ( ON ?auto_241425 ?auto_241426 ) ( ON ?auto_241424 ?auto_241425 ) ( ON ?auto_241423 ?auto_241424 ) ( ON ?auto_241422 ?auto_241423 ) ( ON ?auto_241421 ?auto_241422 ) ( ON ?auto_241420 ?auto_241421 ) ( CLEAR ?auto_241420 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_241420 )
      ( MAKE-9PILE ?auto_241420 ?auto_241421 ?auto_241422 ?auto_241423 ?auto_241424 ?auto_241425 ?auto_241426 ?auto_241427 ?auto_241428 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_241440 - BLOCK
      ?auto_241441 - BLOCK
      ?auto_241442 - BLOCK
      ?auto_241443 - BLOCK
      ?auto_241444 - BLOCK
      ?auto_241445 - BLOCK
      ?auto_241446 - BLOCK
      ?auto_241447 - BLOCK
      ?auto_241448 - BLOCK
      ?auto_241449 - BLOCK
    )
    :vars
    (
      ?auto_241450 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_241448 ) ( ON ?auto_241449 ?auto_241450 ) ( CLEAR ?auto_241449 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_241440 ) ( ON ?auto_241441 ?auto_241440 ) ( ON ?auto_241442 ?auto_241441 ) ( ON ?auto_241443 ?auto_241442 ) ( ON ?auto_241444 ?auto_241443 ) ( ON ?auto_241445 ?auto_241444 ) ( ON ?auto_241446 ?auto_241445 ) ( ON ?auto_241447 ?auto_241446 ) ( ON ?auto_241448 ?auto_241447 ) ( not ( = ?auto_241440 ?auto_241441 ) ) ( not ( = ?auto_241440 ?auto_241442 ) ) ( not ( = ?auto_241440 ?auto_241443 ) ) ( not ( = ?auto_241440 ?auto_241444 ) ) ( not ( = ?auto_241440 ?auto_241445 ) ) ( not ( = ?auto_241440 ?auto_241446 ) ) ( not ( = ?auto_241440 ?auto_241447 ) ) ( not ( = ?auto_241440 ?auto_241448 ) ) ( not ( = ?auto_241440 ?auto_241449 ) ) ( not ( = ?auto_241440 ?auto_241450 ) ) ( not ( = ?auto_241441 ?auto_241442 ) ) ( not ( = ?auto_241441 ?auto_241443 ) ) ( not ( = ?auto_241441 ?auto_241444 ) ) ( not ( = ?auto_241441 ?auto_241445 ) ) ( not ( = ?auto_241441 ?auto_241446 ) ) ( not ( = ?auto_241441 ?auto_241447 ) ) ( not ( = ?auto_241441 ?auto_241448 ) ) ( not ( = ?auto_241441 ?auto_241449 ) ) ( not ( = ?auto_241441 ?auto_241450 ) ) ( not ( = ?auto_241442 ?auto_241443 ) ) ( not ( = ?auto_241442 ?auto_241444 ) ) ( not ( = ?auto_241442 ?auto_241445 ) ) ( not ( = ?auto_241442 ?auto_241446 ) ) ( not ( = ?auto_241442 ?auto_241447 ) ) ( not ( = ?auto_241442 ?auto_241448 ) ) ( not ( = ?auto_241442 ?auto_241449 ) ) ( not ( = ?auto_241442 ?auto_241450 ) ) ( not ( = ?auto_241443 ?auto_241444 ) ) ( not ( = ?auto_241443 ?auto_241445 ) ) ( not ( = ?auto_241443 ?auto_241446 ) ) ( not ( = ?auto_241443 ?auto_241447 ) ) ( not ( = ?auto_241443 ?auto_241448 ) ) ( not ( = ?auto_241443 ?auto_241449 ) ) ( not ( = ?auto_241443 ?auto_241450 ) ) ( not ( = ?auto_241444 ?auto_241445 ) ) ( not ( = ?auto_241444 ?auto_241446 ) ) ( not ( = ?auto_241444 ?auto_241447 ) ) ( not ( = ?auto_241444 ?auto_241448 ) ) ( not ( = ?auto_241444 ?auto_241449 ) ) ( not ( = ?auto_241444 ?auto_241450 ) ) ( not ( = ?auto_241445 ?auto_241446 ) ) ( not ( = ?auto_241445 ?auto_241447 ) ) ( not ( = ?auto_241445 ?auto_241448 ) ) ( not ( = ?auto_241445 ?auto_241449 ) ) ( not ( = ?auto_241445 ?auto_241450 ) ) ( not ( = ?auto_241446 ?auto_241447 ) ) ( not ( = ?auto_241446 ?auto_241448 ) ) ( not ( = ?auto_241446 ?auto_241449 ) ) ( not ( = ?auto_241446 ?auto_241450 ) ) ( not ( = ?auto_241447 ?auto_241448 ) ) ( not ( = ?auto_241447 ?auto_241449 ) ) ( not ( = ?auto_241447 ?auto_241450 ) ) ( not ( = ?auto_241448 ?auto_241449 ) ) ( not ( = ?auto_241448 ?auto_241450 ) ) ( not ( = ?auto_241449 ?auto_241450 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_241449 ?auto_241450 )
      ( !STACK ?auto_241449 ?auto_241448 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_241461 - BLOCK
      ?auto_241462 - BLOCK
      ?auto_241463 - BLOCK
      ?auto_241464 - BLOCK
      ?auto_241465 - BLOCK
      ?auto_241466 - BLOCK
      ?auto_241467 - BLOCK
      ?auto_241468 - BLOCK
      ?auto_241469 - BLOCK
      ?auto_241470 - BLOCK
    )
    :vars
    (
      ?auto_241471 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_241469 ) ( ON ?auto_241470 ?auto_241471 ) ( CLEAR ?auto_241470 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_241461 ) ( ON ?auto_241462 ?auto_241461 ) ( ON ?auto_241463 ?auto_241462 ) ( ON ?auto_241464 ?auto_241463 ) ( ON ?auto_241465 ?auto_241464 ) ( ON ?auto_241466 ?auto_241465 ) ( ON ?auto_241467 ?auto_241466 ) ( ON ?auto_241468 ?auto_241467 ) ( ON ?auto_241469 ?auto_241468 ) ( not ( = ?auto_241461 ?auto_241462 ) ) ( not ( = ?auto_241461 ?auto_241463 ) ) ( not ( = ?auto_241461 ?auto_241464 ) ) ( not ( = ?auto_241461 ?auto_241465 ) ) ( not ( = ?auto_241461 ?auto_241466 ) ) ( not ( = ?auto_241461 ?auto_241467 ) ) ( not ( = ?auto_241461 ?auto_241468 ) ) ( not ( = ?auto_241461 ?auto_241469 ) ) ( not ( = ?auto_241461 ?auto_241470 ) ) ( not ( = ?auto_241461 ?auto_241471 ) ) ( not ( = ?auto_241462 ?auto_241463 ) ) ( not ( = ?auto_241462 ?auto_241464 ) ) ( not ( = ?auto_241462 ?auto_241465 ) ) ( not ( = ?auto_241462 ?auto_241466 ) ) ( not ( = ?auto_241462 ?auto_241467 ) ) ( not ( = ?auto_241462 ?auto_241468 ) ) ( not ( = ?auto_241462 ?auto_241469 ) ) ( not ( = ?auto_241462 ?auto_241470 ) ) ( not ( = ?auto_241462 ?auto_241471 ) ) ( not ( = ?auto_241463 ?auto_241464 ) ) ( not ( = ?auto_241463 ?auto_241465 ) ) ( not ( = ?auto_241463 ?auto_241466 ) ) ( not ( = ?auto_241463 ?auto_241467 ) ) ( not ( = ?auto_241463 ?auto_241468 ) ) ( not ( = ?auto_241463 ?auto_241469 ) ) ( not ( = ?auto_241463 ?auto_241470 ) ) ( not ( = ?auto_241463 ?auto_241471 ) ) ( not ( = ?auto_241464 ?auto_241465 ) ) ( not ( = ?auto_241464 ?auto_241466 ) ) ( not ( = ?auto_241464 ?auto_241467 ) ) ( not ( = ?auto_241464 ?auto_241468 ) ) ( not ( = ?auto_241464 ?auto_241469 ) ) ( not ( = ?auto_241464 ?auto_241470 ) ) ( not ( = ?auto_241464 ?auto_241471 ) ) ( not ( = ?auto_241465 ?auto_241466 ) ) ( not ( = ?auto_241465 ?auto_241467 ) ) ( not ( = ?auto_241465 ?auto_241468 ) ) ( not ( = ?auto_241465 ?auto_241469 ) ) ( not ( = ?auto_241465 ?auto_241470 ) ) ( not ( = ?auto_241465 ?auto_241471 ) ) ( not ( = ?auto_241466 ?auto_241467 ) ) ( not ( = ?auto_241466 ?auto_241468 ) ) ( not ( = ?auto_241466 ?auto_241469 ) ) ( not ( = ?auto_241466 ?auto_241470 ) ) ( not ( = ?auto_241466 ?auto_241471 ) ) ( not ( = ?auto_241467 ?auto_241468 ) ) ( not ( = ?auto_241467 ?auto_241469 ) ) ( not ( = ?auto_241467 ?auto_241470 ) ) ( not ( = ?auto_241467 ?auto_241471 ) ) ( not ( = ?auto_241468 ?auto_241469 ) ) ( not ( = ?auto_241468 ?auto_241470 ) ) ( not ( = ?auto_241468 ?auto_241471 ) ) ( not ( = ?auto_241469 ?auto_241470 ) ) ( not ( = ?auto_241469 ?auto_241471 ) ) ( not ( = ?auto_241470 ?auto_241471 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_241470 ?auto_241471 )
      ( !STACK ?auto_241470 ?auto_241469 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_241482 - BLOCK
      ?auto_241483 - BLOCK
      ?auto_241484 - BLOCK
      ?auto_241485 - BLOCK
      ?auto_241486 - BLOCK
      ?auto_241487 - BLOCK
      ?auto_241488 - BLOCK
      ?auto_241489 - BLOCK
      ?auto_241490 - BLOCK
      ?auto_241491 - BLOCK
    )
    :vars
    (
      ?auto_241492 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_241491 ?auto_241492 ) ( ON-TABLE ?auto_241482 ) ( ON ?auto_241483 ?auto_241482 ) ( ON ?auto_241484 ?auto_241483 ) ( ON ?auto_241485 ?auto_241484 ) ( ON ?auto_241486 ?auto_241485 ) ( ON ?auto_241487 ?auto_241486 ) ( ON ?auto_241488 ?auto_241487 ) ( ON ?auto_241489 ?auto_241488 ) ( not ( = ?auto_241482 ?auto_241483 ) ) ( not ( = ?auto_241482 ?auto_241484 ) ) ( not ( = ?auto_241482 ?auto_241485 ) ) ( not ( = ?auto_241482 ?auto_241486 ) ) ( not ( = ?auto_241482 ?auto_241487 ) ) ( not ( = ?auto_241482 ?auto_241488 ) ) ( not ( = ?auto_241482 ?auto_241489 ) ) ( not ( = ?auto_241482 ?auto_241490 ) ) ( not ( = ?auto_241482 ?auto_241491 ) ) ( not ( = ?auto_241482 ?auto_241492 ) ) ( not ( = ?auto_241483 ?auto_241484 ) ) ( not ( = ?auto_241483 ?auto_241485 ) ) ( not ( = ?auto_241483 ?auto_241486 ) ) ( not ( = ?auto_241483 ?auto_241487 ) ) ( not ( = ?auto_241483 ?auto_241488 ) ) ( not ( = ?auto_241483 ?auto_241489 ) ) ( not ( = ?auto_241483 ?auto_241490 ) ) ( not ( = ?auto_241483 ?auto_241491 ) ) ( not ( = ?auto_241483 ?auto_241492 ) ) ( not ( = ?auto_241484 ?auto_241485 ) ) ( not ( = ?auto_241484 ?auto_241486 ) ) ( not ( = ?auto_241484 ?auto_241487 ) ) ( not ( = ?auto_241484 ?auto_241488 ) ) ( not ( = ?auto_241484 ?auto_241489 ) ) ( not ( = ?auto_241484 ?auto_241490 ) ) ( not ( = ?auto_241484 ?auto_241491 ) ) ( not ( = ?auto_241484 ?auto_241492 ) ) ( not ( = ?auto_241485 ?auto_241486 ) ) ( not ( = ?auto_241485 ?auto_241487 ) ) ( not ( = ?auto_241485 ?auto_241488 ) ) ( not ( = ?auto_241485 ?auto_241489 ) ) ( not ( = ?auto_241485 ?auto_241490 ) ) ( not ( = ?auto_241485 ?auto_241491 ) ) ( not ( = ?auto_241485 ?auto_241492 ) ) ( not ( = ?auto_241486 ?auto_241487 ) ) ( not ( = ?auto_241486 ?auto_241488 ) ) ( not ( = ?auto_241486 ?auto_241489 ) ) ( not ( = ?auto_241486 ?auto_241490 ) ) ( not ( = ?auto_241486 ?auto_241491 ) ) ( not ( = ?auto_241486 ?auto_241492 ) ) ( not ( = ?auto_241487 ?auto_241488 ) ) ( not ( = ?auto_241487 ?auto_241489 ) ) ( not ( = ?auto_241487 ?auto_241490 ) ) ( not ( = ?auto_241487 ?auto_241491 ) ) ( not ( = ?auto_241487 ?auto_241492 ) ) ( not ( = ?auto_241488 ?auto_241489 ) ) ( not ( = ?auto_241488 ?auto_241490 ) ) ( not ( = ?auto_241488 ?auto_241491 ) ) ( not ( = ?auto_241488 ?auto_241492 ) ) ( not ( = ?auto_241489 ?auto_241490 ) ) ( not ( = ?auto_241489 ?auto_241491 ) ) ( not ( = ?auto_241489 ?auto_241492 ) ) ( not ( = ?auto_241490 ?auto_241491 ) ) ( not ( = ?auto_241490 ?auto_241492 ) ) ( not ( = ?auto_241491 ?auto_241492 ) ) ( CLEAR ?auto_241489 ) ( ON ?auto_241490 ?auto_241491 ) ( CLEAR ?auto_241490 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_241482 ?auto_241483 ?auto_241484 ?auto_241485 ?auto_241486 ?auto_241487 ?auto_241488 ?auto_241489 ?auto_241490 )
      ( MAKE-10PILE ?auto_241482 ?auto_241483 ?auto_241484 ?auto_241485 ?auto_241486 ?auto_241487 ?auto_241488 ?auto_241489 ?auto_241490 ?auto_241491 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_241503 - BLOCK
      ?auto_241504 - BLOCK
      ?auto_241505 - BLOCK
      ?auto_241506 - BLOCK
      ?auto_241507 - BLOCK
      ?auto_241508 - BLOCK
      ?auto_241509 - BLOCK
      ?auto_241510 - BLOCK
      ?auto_241511 - BLOCK
      ?auto_241512 - BLOCK
    )
    :vars
    (
      ?auto_241513 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_241512 ?auto_241513 ) ( ON-TABLE ?auto_241503 ) ( ON ?auto_241504 ?auto_241503 ) ( ON ?auto_241505 ?auto_241504 ) ( ON ?auto_241506 ?auto_241505 ) ( ON ?auto_241507 ?auto_241506 ) ( ON ?auto_241508 ?auto_241507 ) ( ON ?auto_241509 ?auto_241508 ) ( ON ?auto_241510 ?auto_241509 ) ( not ( = ?auto_241503 ?auto_241504 ) ) ( not ( = ?auto_241503 ?auto_241505 ) ) ( not ( = ?auto_241503 ?auto_241506 ) ) ( not ( = ?auto_241503 ?auto_241507 ) ) ( not ( = ?auto_241503 ?auto_241508 ) ) ( not ( = ?auto_241503 ?auto_241509 ) ) ( not ( = ?auto_241503 ?auto_241510 ) ) ( not ( = ?auto_241503 ?auto_241511 ) ) ( not ( = ?auto_241503 ?auto_241512 ) ) ( not ( = ?auto_241503 ?auto_241513 ) ) ( not ( = ?auto_241504 ?auto_241505 ) ) ( not ( = ?auto_241504 ?auto_241506 ) ) ( not ( = ?auto_241504 ?auto_241507 ) ) ( not ( = ?auto_241504 ?auto_241508 ) ) ( not ( = ?auto_241504 ?auto_241509 ) ) ( not ( = ?auto_241504 ?auto_241510 ) ) ( not ( = ?auto_241504 ?auto_241511 ) ) ( not ( = ?auto_241504 ?auto_241512 ) ) ( not ( = ?auto_241504 ?auto_241513 ) ) ( not ( = ?auto_241505 ?auto_241506 ) ) ( not ( = ?auto_241505 ?auto_241507 ) ) ( not ( = ?auto_241505 ?auto_241508 ) ) ( not ( = ?auto_241505 ?auto_241509 ) ) ( not ( = ?auto_241505 ?auto_241510 ) ) ( not ( = ?auto_241505 ?auto_241511 ) ) ( not ( = ?auto_241505 ?auto_241512 ) ) ( not ( = ?auto_241505 ?auto_241513 ) ) ( not ( = ?auto_241506 ?auto_241507 ) ) ( not ( = ?auto_241506 ?auto_241508 ) ) ( not ( = ?auto_241506 ?auto_241509 ) ) ( not ( = ?auto_241506 ?auto_241510 ) ) ( not ( = ?auto_241506 ?auto_241511 ) ) ( not ( = ?auto_241506 ?auto_241512 ) ) ( not ( = ?auto_241506 ?auto_241513 ) ) ( not ( = ?auto_241507 ?auto_241508 ) ) ( not ( = ?auto_241507 ?auto_241509 ) ) ( not ( = ?auto_241507 ?auto_241510 ) ) ( not ( = ?auto_241507 ?auto_241511 ) ) ( not ( = ?auto_241507 ?auto_241512 ) ) ( not ( = ?auto_241507 ?auto_241513 ) ) ( not ( = ?auto_241508 ?auto_241509 ) ) ( not ( = ?auto_241508 ?auto_241510 ) ) ( not ( = ?auto_241508 ?auto_241511 ) ) ( not ( = ?auto_241508 ?auto_241512 ) ) ( not ( = ?auto_241508 ?auto_241513 ) ) ( not ( = ?auto_241509 ?auto_241510 ) ) ( not ( = ?auto_241509 ?auto_241511 ) ) ( not ( = ?auto_241509 ?auto_241512 ) ) ( not ( = ?auto_241509 ?auto_241513 ) ) ( not ( = ?auto_241510 ?auto_241511 ) ) ( not ( = ?auto_241510 ?auto_241512 ) ) ( not ( = ?auto_241510 ?auto_241513 ) ) ( not ( = ?auto_241511 ?auto_241512 ) ) ( not ( = ?auto_241511 ?auto_241513 ) ) ( not ( = ?auto_241512 ?auto_241513 ) ) ( CLEAR ?auto_241510 ) ( ON ?auto_241511 ?auto_241512 ) ( CLEAR ?auto_241511 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_241503 ?auto_241504 ?auto_241505 ?auto_241506 ?auto_241507 ?auto_241508 ?auto_241509 ?auto_241510 ?auto_241511 )
      ( MAKE-10PILE ?auto_241503 ?auto_241504 ?auto_241505 ?auto_241506 ?auto_241507 ?auto_241508 ?auto_241509 ?auto_241510 ?auto_241511 ?auto_241512 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_241524 - BLOCK
      ?auto_241525 - BLOCK
      ?auto_241526 - BLOCK
      ?auto_241527 - BLOCK
      ?auto_241528 - BLOCK
      ?auto_241529 - BLOCK
      ?auto_241530 - BLOCK
      ?auto_241531 - BLOCK
      ?auto_241532 - BLOCK
      ?auto_241533 - BLOCK
    )
    :vars
    (
      ?auto_241534 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_241533 ?auto_241534 ) ( ON-TABLE ?auto_241524 ) ( ON ?auto_241525 ?auto_241524 ) ( ON ?auto_241526 ?auto_241525 ) ( ON ?auto_241527 ?auto_241526 ) ( ON ?auto_241528 ?auto_241527 ) ( ON ?auto_241529 ?auto_241528 ) ( ON ?auto_241530 ?auto_241529 ) ( not ( = ?auto_241524 ?auto_241525 ) ) ( not ( = ?auto_241524 ?auto_241526 ) ) ( not ( = ?auto_241524 ?auto_241527 ) ) ( not ( = ?auto_241524 ?auto_241528 ) ) ( not ( = ?auto_241524 ?auto_241529 ) ) ( not ( = ?auto_241524 ?auto_241530 ) ) ( not ( = ?auto_241524 ?auto_241531 ) ) ( not ( = ?auto_241524 ?auto_241532 ) ) ( not ( = ?auto_241524 ?auto_241533 ) ) ( not ( = ?auto_241524 ?auto_241534 ) ) ( not ( = ?auto_241525 ?auto_241526 ) ) ( not ( = ?auto_241525 ?auto_241527 ) ) ( not ( = ?auto_241525 ?auto_241528 ) ) ( not ( = ?auto_241525 ?auto_241529 ) ) ( not ( = ?auto_241525 ?auto_241530 ) ) ( not ( = ?auto_241525 ?auto_241531 ) ) ( not ( = ?auto_241525 ?auto_241532 ) ) ( not ( = ?auto_241525 ?auto_241533 ) ) ( not ( = ?auto_241525 ?auto_241534 ) ) ( not ( = ?auto_241526 ?auto_241527 ) ) ( not ( = ?auto_241526 ?auto_241528 ) ) ( not ( = ?auto_241526 ?auto_241529 ) ) ( not ( = ?auto_241526 ?auto_241530 ) ) ( not ( = ?auto_241526 ?auto_241531 ) ) ( not ( = ?auto_241526 ?auto_241532 ) ) ( not ( = ?auto_241526 ?auto_241533 ) ) ( not ( = ?auto_241526 ?auto_241534 ) ) ( not ( = ?auto_241527 ?auto_241528 ) ) ( not ( = ?auto_241527 ?auto_241529 ) ) ( not ( = ?auto_241527 ?auto_241530 ) ) ( not ( = ?auto_241527 ?auto_241531 ) ) ( not ( = ?auto_241527 ?auto_241532 ) ) ( not ( = ?auto_241527 ?auto_241533 ) ) ( not ( = ?auto_241527 ?auto_241534 ) ) ( not ( = ?auto_241528 ?auto_241529 ) ) ( not ( = ?auto_241528 ?auto_241530 ) ) ( not ( = ?auto_241528 ?auto_241531 ) ) ( not ( = ?auto_241528 ?auto_241532 ) ) ( not ( = ?auto_241528 ?auto_241533 ) ) ( not ( = ?auto_241528 ?auto_241534 ) ) ( not ( = ?auto_241529 ?auto_241530 ) ) ( not ( = ?auto_241529 ?auto_241531 ) ) ( not ( = ?auto_241529 ?auto_241532 ) ) ( not ( = ?auto_241529 ?auto_241533 ) ) ( not ( = ?auto_241529 ?auto_241534 ) ) ( not ( = ?auto_241530 ?auto_241531 ) ) ( not ( = ?auto_241530 ?auto_241532 ) ) ( not ( = ?auto_241530 ?auto_241533 ) ) ( not ( = ?auto_241530 ?auto_241534 ) ) ( not ( = ?auto_241531 ?auto_241532 ) ) ( not ( = ?auto_241531 ?auto_241533 ) ) ( not ( = ?auto_241531 ?auto_241534 ) ) ( not ( = ?auto_241532 ?auto_241533 ) ) ( not ( = ?auto_241532 ?auto_241534 ) ) ( not ( = ?auto_241533 ?auto_241534 ) ) ( ON ?auto_241532 ?auto_241533 ) ( CLEAR ?auto_241530 ) ( ON ?auto_241531 ?auto_241532 ) ( CLEAR ?auto_241531 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_241524 ?auto_241525 ?auto_241526 ?auto_241527 ?auto_241528 ?auto_241529 ?auto_241530 ?auto_241531 )
      ( MAKE-10PILE ?auto_241524 ?auto_241525 ?auto_241526 ?auto_241527 ?auto_241528 ?auto_241529 ?auto_241530 ?auto_241531 ?auto_241532 ?auto_241533 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_241545 - BLOCK
      ?auto_241546 - BLOCK
      ?auto_241547 - BLOCK
      ?auto_241548 - BLOCK
      ?auto_241549 - BLOCK
      ?auto_241550 - BLOCK
      ?auto_241551 - BLOCK
      ?auto_241552 - BLOCK
      ?auto_241553 - BLOCK
      ?auto_241554 - BLOCK
    )
    :vars
    (
      ?auto_241555 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_241554 ?auto_241555 ) ( ON-TABLE ?auto_241545 ) ( ON ?auto_241546 ?auto_241545 ) ( ON ?auto_241547 ?auto_241546 ) ( ON ?auto_241548 ?auto_241547 ) ( ON ?auto_241549 ?auto_241548 ) ( ON ?auto_241550 ?auto_241549 ) ( ON ?auto_241551 ?auto_241550 ) ( not ( = ?auto_241545 ?auto_241546 ) ) ( not ( = ?auto_241545 ?auto_241547 ) ) ( not ( = ?auto_241545 ?auto_241548 ) ) ( not ( = ?auto_241545 ?auto_241549 ) ) ( not ( = ?auto_241545 ?auto_241550 ) ) ( not ( = ?auto_241545 ?auto_241551 ) ) ( not ( = ?auto_241545 ?auto_241552 ) ) ( not ( = ?auto_241545 ?auto_241553 ) ) ( not ( = ?auto_241545 ?auto_241554 ) ) ( not ( = ?auto_241545 ?auto_241555 ) ) ( not ( = ?auto_241546 ?auto_241547 ) ) ( not ( = ?auto_241546 ?auto_241548 ) ) ( not ( = ?auto_241546 ?auto_241549 ) ) ( not ( = ?auto_241546 ?auto_241550 ) ) ( not ( = ?auto_241546 ?auto_241551 ) ) ( not ( = ?auto_241546 ?auto_241552 ) ) ( not ( = ?auto_241546 ?auto_241553 ) ) ( not ( = ?auto_241546 ?auto_241554 ) ) ( not ( = ?auto_241546 ?auto_241555 ) ) ( not ( = ?auto_241547 ?auto_241548 ) ) ( not ( = ?auto_241547 ?auto_241549 ) ) ( not ( = ?auto_241547 ?auto_241550 ) ) ( not ( = ?auto_241547 ?auto_241551 ) ) ( not ( = ?auto_241547 ?auto_241552 ) ) ( not ( = ?auto_241547 ?auto_241553 ) ) ( not ( = ?auto_241547 ?auto_241554 ) ) ( not ( = ?auto_241547 ?auto_241555 ) ) ( not ( = ?auto_241548 ?auto_241549 ) ) ( not ( = ?auto_241548 ?auto_241550 ) ) ( not ( = ?auto_241548 ?auto_241551 ) ) ( not ( = ?auto_241548 ?auto_241552 ) ) ( not ( = ?auto_241548 ?auto_241553 ) ) ( not ( = ?auto_241548 ?auto_241554 ) ) ( not ( = ?auto_241548 ?auto_241555 ) ) ( not ( = ?auto_241549 ?auto_241550 ) ) ( not ( = ?auto_241549 ?auto_241551 ) ) ( not ( = ?auto_241549 ?auto_241552 ) ) ( not ( = ?auto_241549 ?auto_241553 ) ) ( not ( = ?auto_241549 ?auto_241554 ) ) ( not ( = ?auto_241549 ?auto_241555 ) ) ( not ( = ?auto_241550 ?auto_241551 ) ) ( not ( = ?auto_241550 ?auto_241552 ) ) ( not ( = ?auto_241550 ?auto_241553 ) ) ( not ( = ?auto_241550 ?auto_241554 ) ) ( not ( = ?auto_241550 ?auto_241555 ) ) ( not ( = ?auto_241551 ?auto_241552 ) ) ( not ( = ?auto_241551 ?auto_241553 ) ) ( not ( = ?auto_241551 ?auto_241554 ) ) ( not ( = ?auto_241551 ?auto_241555 ) ) ( not ( = ?auto_241552 ?auto_241553 ) ) ( not ( = ?auto_241552 ?auto_241554 ) ) ( not ( = ?auto_241552 ?auto_241555 ) ) ( not ( = ?auto_241553 ?auto_241554 ) ) ( not ( = ?auto_241553 ?auto_241555 ) ) ( not ( = ?auto_241554 ?auto_241555 ) ) ( ON ?auto_241553 ?auto_241554 ) ( CLEAR ?auto_241551 ) ( ON ?auto_241552 ?auto_241553 ) ( CLEAR ?auto_241552 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_241545 ?auto_241546 ?auto_241547 ?auto_241548 ?auto_241549 ?auto_241550 ?auto_241551 ?auto_241552 )
      ( MAKE-10PILE ?auto_241545 ?auto_241546 ?auto_241547 ?auto_241548 ?auto_241549 ?auto_241550 ?auto_241551 ?auto_241552 ?auto_241553 ?auto_241554 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_241566 - BLOCK
      ?auto_241567 - BLOCK
      ?auto_241568 - BLOCK
      ?auto_241569 - BLOCK
      ?auto_241570 - BLOCK
      ?auto_241571 - BLOCK
      ?auto_241572 - BLOCK
      ?auto_241573 - BLOCK
      ?auto_241574 - BLOCK
      ?auto_241575 - BLOCK
    )
    :vars
    (
      ?auto_241576 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_241575 ?auto_241576 ) ( ON-TABLE ?auto_241566 ) ( ON ?auto_241567 ?auto_241566 ) ( ON ?auto_241568 ?auto_241567 ) ( ON ?auto_241569 ?auto_241568 ) ( ON ?auto_241570 ?auto_241569 ) ( ON ?auto_241571 ?auto_241570 ) ( not ( = ?auto_241566 ?auto_241567 ) ) ( not ( = ?auto_241566 ?auto_241568 ) ) ( not ( = ?auto_241566 ?auto_241569 ) ) ( not ( = ?auto_241566 ?auto_241570 ) ) ( not ( = ?auto_241566 ?auto_241571 ) ) ( not ( = ?auto_241566 ?auto_241572 ) ) ( not ( = ?auto_241566 ?auto_241573 ) ) ( not ( = ?auto_241566 ?auto_241574 ) ) ( not ( = ?auto_241566 ?auto_241575 ) ) ( not ( = ?auto_241566 ?auto_241576 ) ) ( not ( = ?auto_241567 ?auto_241568 ) ) ( not ( = ?auto_241567 ?auto_241569 ) ) ( not ( = ?auto_241567 ?auto_241570 ) ) ( not ( = ?auto_241567 ?auto_241571 ) ) ( not ( = ?auto_241567 ?auto_241572 ) ) ( not ( = ?auto_241567 ?auto_241573 ) ) ( not ( = ?auto_241567 ?auto_241574 ) ) ( not ( = ?auto_241567 ?auto_241575 ) ) ( not ( = ?auto_241567 ?auto_241576 ) ) ( not ( = ?auto_241568 ?auto_241569 ) ) ( not ( = ?auto_241568 ?auto_241570 ) ) ( not ( = ?auto_241568 ?auto_241571 ) ) ( not ( = ?auto_241568 ?auto_241572 ) ) ( not ( = ?auto_241568 ?auto_241573 ) ) ( not ( = ?auto_241568 ?auto_241574 ) ) ( not ( = ?auto_241568 ?auto_241575 ) ) ( not ( = ?auto_241568 ?auto_241576 ) ) ( not ( = ?auto_241569 ?auto_241570 ) ) ( not ( = ?auto_241569 ?auto_241571 ) ) ( not ( = ?auto_241569 ?auto_241572 ) ) ( not ( = ?auto_241569 ?auto_241573 ) ) ( not ( = ?auto_241569 ?auto_241574 ) ) ( not ( = ?auto_241569 ?auto_241575 ) ) ( not ( = ?auto_241569 ?auto_241576 ) ) ( not ( = ?auto_241570 ?auto_241571 ) ) ( not ( = ?auto_241570 ?auto_241572 ) ) ( not ( = ?auto_241570 ?auto_241573 ) ) ( not ( = ?auto_241570 ?auto_241574 ) ) ( not ( = ?auto_241570 ?auto_241575 ) ) ( not ( = ?auto_241570 ?auto_241576 ) ) ( not ( = ?auto_241571 ?auto_241572 ) ) ( not ( = ?auto_241571 ?auto_241573 ) ) ( not ( = ?auto_241571 ?auto_241574 ) ) ( not ( = ?auto_241571 ?auto_241575 ) ) ( not ( = ?auto_241571 ?auto_241576 ) ) ( not ( = ?auto_241572 ?auto_241573 ) ) ( not ( = ?auto_241572 ?auto_241574 ) ) ( not ( = ?auto_241572 ?auto_241575 ) ) ( not ( = ?auto_241572 ?auto_241576 ) ) ( not ( = ?auto_241573 ?auto_241574 ) ) ( not ( = ?auto_241573 ?auto_241575 ) ) ( not ( = ?auto_241573 ?auto_241576 ) ) ( not ( = ?auto_241574 ?auto_241575 ) ) ( not ( = ?auto_241574 ?auto_241576 ) ) ( not ( = ?auto_241575 ?auto_241576 ) ) ( ON ?auto_241574 ?auto_241575 ) ( ON ?auto_241573 ?auto_241574 ) ( CLEAR ?auto_241571 ) ( ON ?auto_241572 ?auto_241573 ) ( CLEAR ?auto_241572 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_241566 ?auto_241567 ?auto_241568 ?auto_241569 ?auto_241570 ?auto_241571 ?auto_241572 )
      ( MAKE-10PILE ?auto_241566 ?auto_241567 ?auto_241568 ?auto_241569 ?auto_241570 ?auto_241571 ?auto_241572 ?auto_241573 ?auto_241574 ?auto_241575 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_241587 - BLOCK
      ?auto_241588 - BLOCK
      ?auto_241589 - BLOCK
      ?auto_241590 - BLOCK
      ?auto_241591 - BLOCK
      ?auto_241592 - BLOCK
      ?auto_241593 - BLOCK
      ?auto_241594 - BLOCK
      ?auto_241595 - BLOCK
      ?auto_241596 - BLOCK
    )
    :vars
    (
      ?auto_241597 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_241596 ?auto_241597 ) ( ON-TABLE ?auto_241587 ) ( ON ?auto_241588 ?auto_241587 ) ( ON ?auto_241589 ?auto_241588 ) ( ON ?auto_241590 ?auto_241589 ) ( ON ?auto_241591 ?auto_241590 ) ( ON ?auto_241592 ?auto_241591 ) ( not ( = ?auto_241587 ?auto_241588 ) ) ( not ( = ?auto_241587 ?auto_241589 ) ) ( not ( = ?auto_241587 ?auto_241590 ) ) ( not ( = ?auto_241587 ?auto_241591 ) ) ( not ( = ?auto_241587 ?auto_241592 ) ) ( not ( = ?auto_241587 ?auto_241593 ) ) ( not ( = ?auto_241587 ?auto_241594 ) ) ( not ( = ?auto_241587 ?auto_241595 ) ) ( not ( = ?auto_241587 ?auto_241596 ) ) ( not ( = ?auto_241587 ?auto_241597 ) ) ( not ( = ?auto_241588 ?auto_241589 ) ) ( not ( = ?auto_241588 ?auto_241590 ) ) ( not ( = ?auto_241588 ?auto_241591 ) ) ( not ( = ?auto_241588 ?auto_241592 ) ) ( not ( = ?auto_241588 ?auto_241593 ) ) ( not ( = ?auto_241588 ?auto_241594 ) ) ( not ( = ?auto_241588 ?auto_241595 ) ) ( not ( = ?auto_241588 ?auto_241596 ) ) ( not ( = ?auto_241588 ?auto_241597 ) ) ( not ( = ?auto_241589 ?auto_241590 ) ) ( not ( = ?auto_241589 ?auto_241591 ) ) ( not ( = ?auto_241589 ?auto_241592 ) ) ( not ( = ?auto_241589 ?auto_241593 ) ) ( not ( = ?auto_241589 ?auto_241594 ) ) ( not ( = ?auto_241589 ?auto_241595 ) ) ( not ( = ?auto_241589 ?auto_241596 ) ) ( not ( = ?auto_241589 ?auto_241597 ) ) ( not ( = ?auto_241590 ?auto_241591 ) ) ( not ( = ?auto_241590 ?auto_241592 ) ) ( not ( = ?auto_241590 ?auto_241593 ) ) ( not ( = ?auto_241590 ?auto_241594 ) ) ( not ( = ?auto_241590 ?auto_241595 ) ) ( not ( = ?auto_241590 ?auto_241596 ) ) ( not ( = ?auto_241590 ?auto_241597 ) ) ( not ( = ?auto_241591 ?auto_241592 ) ) ( not ( = ?auto_241591 ?auto_241593 ) ) ( not ( = ?auto_241591 ?auto_241594 ) ) ( not ( = ?auto_241591 ?auto_241595 ) ) ( not ( = ?auto_241591 ?auto_241596 ) ) ( not ( = ?auto_241591 ?auto_241597 ) ) ( not ( = ?auto_241592 ?auto_241593 ) ) ( not ( = ?auto_241592 ?auto_241594 ) ) ( not ( = ?auto_241592 ?auto_241595 ) ) ( not ( = ?auto_241592 ?auto_241596 ) ) ( not ( = ?auto_241592 ?auto_241597 ) ) ( not ( = ?auto_241593 ?auto_241594 ) ) ( not ( = ?auto_241593 ?auto_241595 ) ) ( not ( = ?auto_241593 ?auto_241596 ) ) ( not ( = ?auto_241593 ?auto_241597 ) ) ( not ( = ?auto_241594 ?auto_241595 ) ) ( not ( = ?auto_241594 ?auto_241596 ) ) ( not ( = ?auto_241594 ?auto_241597 ) ) ( not ( = ?auto_241595 ?auto_241596 ) ) ( not ( = ?auto_241595 ?auto_241597 ) ) ( not ( = ?auto_241596 ?auto_241597 ) ) ( ON ?auto_241595 ?auto_241596 ) ( ON ?auto_241594 ?auto_241595 ) ( CLEAR ?auto_241592 ) ( ON ?auto_241593 ?auto_241594 ) ( CLEAR ?auto_241593 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_241587 ?auto_241588 ?auto_241589 ?auto_241590 ?auto_241591 ?auto_241592 ?auto_241593 )
      ( MAKE-10PILE ?auto_241587 ?auto_241588 ?auto_241589 ?auto_241590 ?auto_241591 ?auto_241592 ?auto_241593 ?auto_241594 ?auto_241595 ?auto_241596 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_241608 - BLOCK
      ?auto_241609 - BLOCK
      ?auto_241610 - BLOCK
      ?auto_241611 - BLOCK
      ?auto_241612 - BLOCK
      ?auto_241613 - BLOCK
      ?auto_241614 - BLOCK
      ?auto_241615 - BLOCK
      ?auto_241616 - BLOCK
      ?auto_241617 - BLOCK
    )
    :vars
    (
      ?auto_241618 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_241617 ?auto_241618 ) ( ON-TABLE ?auto_241608 ) ( ON ?auto_241609 ?auto_241608 ) ( ON ?auto_241610 ?auto_241609 ) ( ON ?auto_241611 ?auto_241610 ) ( ON ?auto_241612 ?auto_241611 ) ( not ( = ?auto_241608 ?auto_241609 ) ) ( not ( = ?auto_241608 ?auto_241610 ) ) ( not ( = ?auto_241608 ?auto_241611 ) ) ( not ( = ?auto_241608 ?auto_241612 ) ) ( not ( = ?auto_241608 ?auto_241613 ) ) ( not ( = ?auto_241608 ?auto_241614 ) ) ( not ( = ?auto_241608 ?auto_241615 ) ) ( not ( = ?auto_241608 ?auto_241616 ) ) ( not ( = ?auto_241608 ?auto_241617 ) ) ( not ( = ?auto_241608 ?auto_241618 ) ) ( not ( = ?auto_241609 ?auto_241610 ) ) ( not ( = ?auto_241609 ?auto_241611 ) ) ( not ( = ?auto_241609 ?auto_241612 ) ) ( not ( = ?auto_241609 ?auto_241613 ) ) ( not ( = ?auto_241609 ?auto_241614 ) ) ( not ( = ?auto_241609 ?auto_241615 ) ) ( not ( = ?auto_241609 ?auto_241616 ) ) ( not ( = ?auto_241609 ?auto_241617 ) ) ( not ( = ?auto_241609 ?auto_241618 ) ) ( not ( = ?auto_241610 ?auto_241611 ) ) ( not ( = ?auto_241610 ?auto_241612 ) ) ( not ( = ?auto_241610 ?auto_241613 ) ) ( not ( = ?auto_241610 ?auto_241614 ) ) ( not ( = ?auto_241610 ?auto_241615 ) ) ( not ( = ?auto_241610 ?auto_241616 ) ) ( not ( = ?auto_241610 ?auto_241617 ) ) ( not ( = ?auto_241610 ?auto_241618 ) ) ( not ( = ?auto_241611 ?auto_241612 ) ) ( not ( = ?auto_241611 ?auto_241613 ) ) ( not ( = ?auto_241611 ?auto_241614 ) ) ( not ( = ?auto_241611 ?auto_241615 ) ) ( not ( = ?auto_241611 ?auto_241616 ) ) ( not ( = ?auto_241611 ?auto_241617 ) ) ( not ( = ?auto_241611 ?auto_241618 ) ) ( not ( = ?auto_241612 ?auto_241613 ) ) ( not ( = ?auto_241612 ?auto_241614 ) ) ( not ( = ?auto_241612 ?auto_241615 ) ) ( not ( = ?auto_241612 ?auto_241616 ) ) ( not ( = ?auto_241612 ?auto_241617 ) ) ( not ( = ?auto_241612 ?auto_241618 ) ) ( not ( = ?auto_241613 ?auto_241614 ) ) ( not ( = ?auto_241613 ?auto_241615 ) ) ( not ( = ?auto_241613 ?auto_241616 ) ) ( not ( = ?auto_241613 ?auto_241617 ) ) ( not ( = ?auto_241613 ?auto_241618 ) ) ( not ( = ?auto_241614 ?auto_241615 ) ) ( not ( = ?auto_241614 ?auto_241616 ) ) ( not ( = ?auto_241614 ?auto_241617 ) ) ( not ( = ?auto_241614 ?auto_241618 ) ) ( not ( = ?auto_241615 ?auto_241616 ) ) ( not ( = ?auto_241615 ?auto_241617 ) ) ( not ( = ?auto_241615 ?auto_241618 ) ) ( not ( = ?auto_241616 ?auto_241617 ) ) ( not ( = ?auto_241616 ?auto_241618 ) ) ( not ( = ?auto_241617 ?auto_241618 ) ) ( ON ?auto_241616 ?auto_241617 ) ( ON ?auto_241615 ?auto_241616 ) ( ON ?auto_241614 ?auto_241615 ) ( CLEAR ?auto_241612 ) ( ON ?auto_241613 ?auto_241614 ) ( CLEAR ?auto_241613 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_241608 ?auto_241609 ?auto_241610 ?auto_241611 ?auto_241612 ?auto_241613 )
      ( MAKE-10PILE ?auto_241608 ?auto_241609 ?auto_241610 ?auto_241611 ?auto_241612 ?auto_241613 ?auto_241614 ?auto_241615 ?auto_241616 ?auto_241617 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_241629 - BLOCK
      ?auto_241630 - BLOCK
      ?auto_241631 - BLOCK
      ?auto_241632 - BLOCK
      ?auto_241633 - BLOCK
      ?auto_241634 - BLOCK
      ?auto_241635 - BLOCK
      ?auto_241636 - BLOCK
      ?auto_241637 - BLOCK
      ?auto_241638 - BLOCK
    )
    :vars
    (
      ?auto_241639 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_241638 ?auto_241639 ) ( ON-TABLE ?auto_241629 ) ( ON ?auto_241630 ?auto_241629 ) ( ON ?auto_241631 ?auto_241630 ) ( ON ?auto_241632 ?auto_241631 ) ( ON ?auto_241633 ?auto_241632 ) ( not ( = ?auto_241629 ?auto_241630 ) ) ( not ( = ?auto_241629 ?auto_241631 ) ) ( not ( = ?auto_241629 ?auto_241632 ) ) ( not ( = ?auto_241629 ?auto_241633 ) ) ( not ( = ?auto_241629 ?auto_241634 ) ) ( not ( = ?auto_241629 ?auto_241635 ) ) ( not ( = ?auto_241629 ?auto_241636 ) ) ( not ( = ?auto_241629 ?auto_241637 ) ) ( not ( = ?auto_241629 ?auto_241638 ) ) ( not ( = ?auto_241629 ?auto_241639 ) ) ( not ( = ?auto_241630 ?auto_241631 ) ) ( not ( = ?auto_241630 ?auto_241632 ) ) ( not ( = ?auto_241630 ?auto_241633 ) ) ( not ( = ?auto_241630 ?auto_241634 ) ) ( not ( = ?auto_241630 ?auto_241635 ) ) ( not ( = ?auto_241630 ?auto_241636 ) ) ( not ( = ?auto_241630 ?auto_241637 ) ) ( not ( = ?auto_241630 ?auto_241638 ) ) ( not ( = ?auto_241630 ?auto_241639 ) ) ( not ( = ?auto_241631 ?auto_241632 ) ) ( not ( = ?auto_241631 ?auto_241633 ) ) ( not ( = ?auto_241631 ?auto_241634 ) ) ( not ( = ?auto_241631 ?auto_241635 ) ) ( not ( = ?auto_241631 ?auto_241636 ) ) ( not ( = ?auto_241631 ?auto_241637 ) ) ( not ( = ?auto_241631 ?auto_241638 ) ) ( not ( = ?auto_241631 ?auto_241639 ) ) ( not ( = ?auto_241632 ?auto_241633 ) ) ( not ( = ?auto_241632 ?auto_241634 ) ) ( not ( = ?auto_241632 ?auto_241635 ) ) ( not ( = ?auto_241632 ?auto_241636 ) ) ( not ( = ?auto_241632 ?auto_241637 ) ) ( not ( = ?auto_241632 ?auto_241638 ) ) ( not ( = ?auto_241632 ?auto_241639 ) ) ( not ( = ?auto_241633 ?auto_241634 ) ) ( not ( = ?auto_241633 ?auto_241635 ) ) ( not ( = ?auto_241633 ?auto_241636 ) ) ( not ( = ?auto_241633 ?auto_241637 ) ) ( not ( = ?auto_241633 ?auto_241638 ) ) ( not ( = ?auto_241633 ?auto_241639 ) ) ( not ( = ?auto_241634 ?auto_241635 ) ) ( not ( = ?auto_241634 ?auto_241636 ) ) ( not ( = ?auto_241634 ?auto_241637 ) ) ( not ( = ?auto_241634 ?auto_241638 ) ) ( not ( = ?auto_241634 ?auto_241639 ) ) ( not ( = ?auto_241635 ?auto_241636 ) ) ( not ( = ?auto_241635 ?auto_241637 ) ) ( not ( = ?auto_241635 ?auto_241638 ) ) ( not ( = ?auto_241635 ?auto_241639 ) ) ( not ( = ?auto_241636 ?auto_241637 ) ) ( not ( = ?auto_241636 ?auto_241638 ) ) ( not ( = ?auto_241636 ?auto_241639 ) ) ( not ( = ?auto_241637 ?auto_241638 ) ) ( not ( = ?auto_241637 ?auto_241639 ) ) ( not ( = ?auto_241638 ?auto_241639 ) ) ( ON ?auto_241637 ?auto_241638 ) ( ON ?auto_241636 ?auto_241637 ) ( ON ?auto_241635 ?auto_241636 ) ( CLEAR ?auto_241633 ) ( ON ?auto_241634 ?auto_241635 ) ( CLEAR ?auto_241634 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_241629 ?auto_241630 ?auto_241631 ?auto_241632 ?auto_241633 ?auto_241634 )
      ( MAKE-10PILE ?auto_241629 ?auto_241630 ?auto_241631 ?auto_241632 ?auto_241633 ?auto_241634 ?auto_241635 ?auto_241636 ?auto_241637 ?auto_241638 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_241650 - BLOCK
      ?auto_241651 - BLOCK
      ?auto_241652 - BLOCK
      ?auto_241653 - BLOCK
      ?auto_241654 - BLOCK
      ?auto_241655 - BLOCK
      ?auto_241656 - BLOCK
      ?auto_241657 - BLOCK
      ?auto_241658 - BLOCK
      ?auto_241659 - BLOCK
    )
    :vars
    (
      ?auto_241660 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_241659 ?auto_241660 ) ( ON-TABLE ?auto_241650 ) ( ON ?auto_241651 ?auto_241650 ) ( ON ?auto_241652 ?auto_241651 ) ( ON ?auto_241653 ?auto_241652 ) ( not ( = ?auto_241650 ?auto_241651 ) ) ( not ( = ?auto_241650 ?auto_241652 ) ) ( not ( = ?auto_241650 ?auto_241653 ) ) ( not ( = ?auto_241650 ?auto_241654 ) ) ( not ( = ?auto_241650 ?auto_241655 ) ) ( not ( = ?auto_241650 ?auto_241656 ) ) ( not ( = ?auto_241650 ?auto_241657 ) ) ( not ( = ?auto_241650 ?auto_241658 ) ) ( not ( = ?auto_241650 ?auto_241659 ) ) ( not ( = ?auto_241650 ?auto_241660 ) ) ( not ( = ?auto_241651 ?auto_241652 ) ) ( not ( = ?auto_241651 ?auto_241653 ) ) ( not ( = ?auto_241651 ?auto_241654 ) ) ( not ( = ?auto_241651 ?auto_241655 ) ) ( not ( = ?auto_241651 ?auto_241656 ) ) ( not ( = ?auto_241651 ?auto_241657 ) ) ( not ( = ?auto_241651 ?auto_241658 ) ) ( not ( = ?auto_241651 ?auto_241659 ) ) ( not ( = ?auto_241651 ?auto_241660 ) ) ( not ( = ?auto_241652 ?auto_241653 ) ) ( not ( = ?auto_241652 ?auto_241654 ) ) ( not ( = ?auto_241652 ?auto_241655 ) ) ( not ( = ?auto_241652 ?auto_241656 ) ) ( not ( = ?auto_241652 ?auto_241657 ) ) ( not ( = ?auto_241652 ?auto_241658 ) ) ( not ( = ?auto_241652 ?auto_241659 ) ) ( not ( = ?auto_241652 ?auto_241660 ) ) ( not ( = ?auto_241653 ?auto_241654 ) ) ( not ( = ?auto_241653 ?auto_241655 ) ) ( not ( = ?auto_241653 ?auto_241656 ) ) ( not ( = ?auto_241653 ?auto_241657 ) ) ( not ( = ?auto_241653 ?auto_241658 ) ) ( not ( = ?auto_241653 ?auto_241659 ) ) ( not ( = ?auto_241653 ?auto_241660 ) ) ( not ( = ?auto_241654 ?auto_241655 ) ) ( not ( = ?auto_241654 ?auto_241656 ) ) ( not ( = ?auto_241654 ?auto_241657 ) ) ( not ( = ?auto_241654 ?auto_241658 ) ) ( not ( = ?auto_241654 ?auto_241659 ) ) ( not ( = ?auto_241654 ?auto_241660 ) ) ( not ( = ?auto_241655 ?auto_241656 ) ) ( not ( = ?auto_241655 ?auto_241657 ) ) ( not ( = ?auto_241655 ?auto_241658 ) ) ( not ( = ?auto_241655 ?auto_241659 ) ) ( not ( = ?auto_241655 ?auto_241660 ) ) ( not ( = ?auto_241656 ?auto_241657 ) ) ( not ( = ?auto_241656 ?auto_241658 ) ) ( not ( = ?auto_241656 ?auto_241659 ) ) ( not ( = ?auto_241656 ?auto_241660 ) ) ( not ( = ?auto_241657 ?auto_241658 ) ) ( not ( = ?auto_241657 ?auto_241659 ) ) ( not ( = ?auto_241657 ?auto_241660 ) ) ( not ( = ?auto_241658 ?auto_241659 ) ) ( not ( = ?auto_241658 ?auto_241660 ) ) ( not ( = ?auto_241659 ?auto_241660 ) ) ( ON ?auto_241658 ?auto_241659 ) ( ON ?auto_241657 ?auto_241658 ) ( ON ?auto_241656 ?auto_241657 ) ( ON ?auto_241655 ?auto_241656 ) ( CLEAR ?auto_241653 ) ( ON ?auto_241654 ?auto_241655 ) ( CLEAR ?auto_241654 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_241650 ?auto_241651 ?auto_241652 ?auto_241653 ?auto_241654 )
      ( MAKE-10PILE ?auto_241650 ?auto_241651 ?auto_241652 ?auto_241653 ?auto_241654 ?auto_241655 ?auto_241656 ?auto_241657 ?auto_241658 ?auto_241659 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_241671 - BLOCK
      ?auto_241672 - BLOCK
      ?auto_241673 - BLOCK
      ?auto_241674 - BLOCK
      ?auto_241675 - BLOCK
      ?auto_241676 - BLOCK
      ?auto_241677 - BLOCK
      ?auto_241678 - BLOCK
      ?auto_241679 - BLOCK
      ?auto_241680 - BLOCK
    )
    :vars
    (
      ?auto_241681 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_241680 ?auto_241681 ) ( ON-TABLE ?auto_241671 ) ( ON ?auto_241672 ?auto_241671 ) ( ON ?auto_241673 ?auto_241672 ) ( ON ?auto_241674 ?auto_241673 ) ( not ( = ?auto_241671 ?auto_241672 ) ) ( not ( = ?auto_241671 ?auto_241673 ) ) ( not ( = ?auto_241671 ?auto_241674 ) ) ( not ( = ?auto_241671 ?auto_241675 ) ) ( not ( = ?auto_241671 ?auto_241676 ) ) ( not ( = ?auto_241671 ?auto_241677 ) ) ( not ( = ?auto_241671 ?auto_241678 ) ) ( not ( = ?auto_241671 ?auto_241679 ) ) ( not ( = ?auto_241671 ?auto_241680 ) ) ( not ( = ?auto_241671 ?auto_241681 ) ) ( not ( = ?auto_241672 ?auto_241673 ) ) ( not ( = ?auto_241672 ?auto_241674 ) ) ( not ( = ?auto_241672 ?auto_241675 ) ) ( not ( = ?auto_241672 ?auto_241676 ) ) ( not ( = ?auto_241672 ?auto_241677 ) ) ( not ( = ?auto_241672 ?auto_241678 ) ) ( not ( = ?auto_241672 ?auto_241679 ) ) ( not ( = ?auto_241672 ?auto_241680 ) ) ( not ( = ?auto_241672 ?auto_241681 ) ) ( not ( = ?auto_241673 ?auto_241674 ) ) ( not ( = ?auto_241673 ?auto_241675 ) ) ( not ( = ?auto_241673 ?auto_241676 ) ) ( not ( = ?auto_241673 ?auto_241677 ) ) ( not ( = ?auto_241673 ?auto_241678 ) ) ( not ( = ?auto_241673 ?auto_241679 ) ) ( not ( = ?auto_241673 ?auto_241680 ) ) ( not ( = ?auto_241673 ?auto_241681 ) ) ( not ( = ?auto_241674 ?auto_241675 ) ) ( not ( = ?auto_241674 ?auto_241676 ) ) ( not ( = ?auto_241674 ?auto_241677 ) ) ( not ( = ?auto_241674 ?auto_241678 ) ) ( not ( = ?auto_241674 ?auto_241679 ) ) ( not ( = ?auto_241674 ?auto_241680 ) ) ( not ( = ?auto_241674 ?auto_241681 ) ) ( not ( = ?auto_241675 ?auto_241676 ) ) ( not ( = ?auto_241675 ?auto_241677 ) ) ( not ( = ?auto_241675 ?auto_241678 ) ) ( not ( = ?auto_241675 ?auto_241679 ) ) ( not ( = ?auto_241675 ?auto_241680 ) ) ( not ( = ?auto_241675 ?auto_241681 ) ) ( not ( = ?auto_241676 ?auto_241677 ) ) ( not ( = ?auto_241676 ?auto_241678 ) ) ( not ( = ?auto_241676 ?auto_241679 ) ) ( not ( = ?auto_241676 ?auto_241680 ) ) ( not ( = ?auto_241676 ?auto_241681 ) ) ( not ( = ?auto_241677 ?auto_241678 ) ) ( not ( = ?auto_241677 ?auto_241679 ) ) ( not ( = ?auto_241677 ?auto_241680 ) ) ( not ( = ?auto_241677 ?auto_241681 ) ) ( not ( = ?auto_241678 ?auto_241679 ) ) ( not ( = ?auto_241678 ?auto_241680 ) ) ( not ( = ?auto_241678 ?auto_241681 ) ) ( not ( = ?auto_241679 ?auto_241680 ) ) ( not ( = ?auto_241679 ?auto_241681 ) ) ( not ( = ?auto_241680 ?auto_241681 ) ) ( ON ?auto_241679 ?auto_241680 ) ( ON ?auto_241678 ?auto_241679 ) ( ON ?auto_241677 ?auto_241678 ) ( ON ?auto_241676 ?auto_241677 ) ( CLEAR ?auto_241674 ) ( ON ?auto_241675 ?auto_241676 ) ( CLEAR ?auto_241675 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_241671 ?auto_241672 ?auto_241673 ?auto_241674 ?auto_241675 )
      ( MAKE-10PILE ?auto_241671 ?auto_241672 ?auto_241673 ?auto_241674 ?auto_241675 ?auto_241676 ?auto_241677 ?auto_241678 ?auto_241679 ?auto_241680 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_241692 - BLOCK
      ?auto_241693 - BLOCK
      ?auto_241694 - BLOCK
      ?auto_241695 - BLOCK
      ?auto_241696 - BLOCK
      ?auto_241697 - BLOCK
      ?auto_241698 - BLOCK
      ?auto_241699 - BLOCK
      ?auto_241700 - BLOCK
      ?auto_241701 - BLOCK
    )
    :vars
    (
      ?auto_241702 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_241701 ?auto_241702 ) ( ON-TABLE ?auto_241692 ) ( ON ?auto_241693 ?auto_241692 ) ( ON ?auto_241694 ?auto_241693 ) ( not ( = ?auto_241692 ?auto_241693 ) ) ( not ( = ?auto_241692 ?auto_241694 ) ) ( not ( = ?auto_241692 ?auto_241695 ) ) ( not ( = ?auto_241692 ?auto_241696 ) ) ( not ( = ?auto_241692 ?auto_241697 ) ) ( not ( = ?auto_241692 ?auto_241698 ) ) ( not ( = ?auto_241692 ?auto_241699 ) ) ( not ( = ?auto_241692 ?auto_241700 ) ) ( not ( = ?auto_241692 ?auto_241701 ) ) ( not ( = ?auto_241692 ?auto_241702 ) ) ( not ( = ?auto_241693 ?auto_241694 ) ) ( not ( = ?auto_241693 ?auto_241695 ) ) ( not ( = ?auto_241693 ?auto_241696 ) ) ( not ( = ?auto_241693 ?auto_241697 ) ) ( not ( = ?auto_241693 ?auto_241698 ) ) ( not ( = ?auto_241693 ?auto_241699 ) ) ( not ( = ?auto_241693 ?auto_241700 ) ) ( not ( = ?auto_241693 ?auto_241701 ) ) ( not ( = ?auto_241693 ?auto_241702 ) ) ( not ( = ?auto_241694 ?auto_241695 ) ) ( not ( = ?auto_241694 ?auto_241696 ) ) ( not ( = ?auto_241694 ?auto_241697 ) ) ( not ( = ?auto_241694 ?auto_241698 ) ) ( not ( = ?auto_241694 ?auto_241699 ) ) ( not ( = ?auto_241694 ?auto_241700 ) ) ( not ( = ?auto_241694 ?auto_241701 ) ) ( not ( = ?auto_241694 ?auto_241702 ) ) ( not ( = ?auto_241695 ?auto_241696 ) ) ( not ( = ?auto_241695 ?auto_241697 ) ) ( not ( = ?auto_241695 ?auto_241698 ) ) ( not ( = ?auto_241695 ?auto_241699 ) ) ( not ( = ?auto_241695 ?auto_241700 ) ) ( not ( = ?auto_241695 ?auto_241701 ) ) ( not ( = ?auto_241695 ?auto_241702 ) ) ( not ( = ?auto_241696 ?auto_241697 ) ) ( not ( = ?auto_241696 ?auto_241698 ) ) ( not ( = ?auto_241696 ?auto_241699 ) ) ( not ( = ?auto_241696 ?auto_241700 ) ) ( not ( = ?auto_241696 ?auto_241701 ) ) ( not ( = ?auto_241696 ?auto_241702 ) ) ( not ( = ?auto_241697 ?auto_241698 ) ) ( not ( = ?auto_241697 ?auto_241699 ) ) ( not ( = ?auto_241697 ?auto_241700 ) ) ( not ( = ?auto_241697 ?auto_241701 ) ) ( not ( = ?auto_241697 ?auto_241702 ) ) ( not ( = ?auto_241698 ?auto_241699 ) ) ( not ( = ?auto_241698 ?auto_241700 ) ) ( not ( = ?auto_241698 ?auto_241701 ) ) ( not ( = ?auto_241698 ?auto_241702 ) ) ( not ( = ?auto_241699 ?auto_241700 ) ) ( not ( = ?auto_241699 ?auto_241701 ) ) ( not ( = ?auto_241699 ?auto_241702 ) ) ( not ( = ?auto_241700 ?auto_241701 ) ) ( not ( = ?auto_241700 ?auto_241702 ) ) ( not ( = ?auto_241701 ?auto_241702 ) ) ( ON ?auto_241700 ?auto_241701 ) ( ON ?auto_241699 ?auto_241700 ) ( ON ?auto_241698 ?auto_241699 ) ( ON ?auto_241697 ?auto_241698 ) ( ON ?auto_241696 ?auto_241697 ) ( CLEAR ?auto_241694 ) ( ON ?auto_241695 ?auto_241696 ) ( CLEAR ?auto_241695 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_241692 ?auto_241693 ?auto_241694 ?auto_241695 )
      ( MAKE-10PILE ?auto_241692 ?auto_241693 ?auto_241694 ?auto_241695 ?auto_241696 ?auto_241697 ?auto_241698 ?auto_241699 ?auto_241700 ?auto_241701 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_241713 - BLOCK
      ?auto_241714 - BLOCK
      ?auto_241715 - BLOCK
      ?auto_241716 - BLOCK
      ?auto_241717 - BLOCK
      ?auto_241718 - BLOCK
      ?auto_241719 - BLOCK
      ?auto_241720 - BLOCK
      ?auto_241721 - BLOCK
      ?auto_241722 - BLOCK
    )
    :vars
    (
      ?auto_241723 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_241722 ?auto_241723 ) ( ON-TABLE ?auto_241713 ) ( ON ?auto_241714 ?auto_241713 ) ( ON ?auto_241715 ?auto_241714 ) ( not ( = ?auto_241713 ?auto_241714 ) ) ( not ( = ?auto_241713 ?auto_241715 ) ) ( not ( = ?auto_241713 ?auto_241716 ) ) ( not ( = ?auto_241713 ?auto_241717 ) ) ( not ( = ?auto_241713 ?auto_241718 ) ) ( not ( = ?auto_241713 ?auto_241719 ) ) ( not ( = ?auto_241713 ?auto_241720 ) ) ( not ( = ?auto_241713 ?auto_241721 ) ) ( not ( = ?auto_241713 ?auto_241722 ) ) ( not ( = ?auto_241713 ?auto_241723 ) ) ( not ( = ?auto_241714 ?auto_241715 ) ) ( not ( = ?auto_241714 ?auto_241716 ) ) ( not ( = ?auto_241714 ?auto_241717 ) ) ( not ( = ?auto_241714 ?auto_241718 ) ) ( not ( = ?auto_241714 ?auto_241719 ) ) ( not ( = ?auto_241714 ?auto_241720 ) ) ( not ( = ?auto_241714 ?auto_241721 ) ) ( not ( = ?auto_241714 ?auto_241722 ) ) ( not ( = ?auto_241714 ?auto_241723 ) ) ( not ( = ?auto_241715 ?auto_241716 ) ) ( not ( = ?auto_241715 ?auto_241717 ) ) ( not ( = ?auto_241715 ?auto_241718 ) ) ( not ( = ?auto_241715 ?auto_241719 ) ) ( not ( = ?auto_241715 ?auto_241720 ) ) ( not ( = ?auto_241715 ?auto_241721 ) ) ( not ( = ?auto_241715 ?auto_241722 ) ) ( not ( = ?auto_241715 ?auto_241723 ) ) ( not ( = ?auto_241716 ?auto_241717 ) ) ( not ( = ?auto_241716 ?auto_241718 ) ) ( not ( = ?auto_241716 ?auto_241719 ) ) ( not ( = ?auto_241716 ?auto_241720 ) ) ( not ( = ?auto_241716 ?auto_241721 ) ) ( not ( = ?auto_241716 ?auto_241722 ) ) ( not ( = ?auto_241716 ?auto_241723 ) ) ( not ( = ?auto_241717 ?auto_241718 ) ) ( not ( = ?auto_241717 ?auto_241719 ) ) ( not ( = ?auto_241717 ?auto_241720 ) ) ( not ( = ?auto_241717 ?auto_241721 ) ) ( not ( = ?auto_241717 ?auto_241722 ) ) ( not ( = ?auto_241717 ?auto_241723 ) ) ( not ( = ?auto_241718 ?auto_241719 ) ) ( not ( = ?auto_241718 ?auto_241720 ) ) ( not ( = ?auto_241718 ?auto_241721 ) ) ( not ( = ?auto_241718 ?auto_241722 ) ) ( not ( = ?auto_241718 ?auto_241723 ) ) ( not ( = ?auto_241719 ?auto_241720 ) ) ( not ( = ?auto_241719 ?auto_241721 ) ) ( not ( = ?auto_241719 ?auto_241722 ) ) ( not ( = ?auto_241719 ?auto_241723 ) ) ( not ( = ?auto_241720 ?auto_241721 ) ) ( not ( = ?auto_241720 ?auto_241722 ) ) ( not ( = ?auto_241720 ?auto_241723 ) ) ( not ( = ?auto_241721 ?auto_241722 ) ) ( not ( = ?auto_241721 ?auto_241723 ) ) ( not ( = ?auto_241722 ?auto_241723 ) ) ( ON ?auto_241721 ?auto_241722 ) ( ON ?auto_241720 ?auto_241721 ) ( ON ?auto_241719 ?auto_241720 ) ( ON ?auto_241718 ?auto_241719 ) ( ON ?auto_241717 ?auto_241718 ) ( CLEAR ?auto_241715 ) ( ON ?auto_241716 ?auto_241717 ) ( CLEAR ?auto_241716 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_241713 ?auto_241714 ?auto_241715 ?auto_241716 )
      ( MAKE-10PILE ?auto_241713 ?auto_241714 ?auto_241715 ?auto_241716 ?auto_241717 ?auto_241718 ?auto_241719 ?auto_241720 ?auto_241721 ?auto_241722 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_241734 - BLOCK
      ?auto_241735 - BLOCK
      ?auto_241736 - BLOCK
      ?auto_241737 - BLOCK
      ?auto_241738 - BLOCK
      ?auto_241739 - BLOCK
      ?auto_241740 - BLOCK
      ?auto_241741 - BLOCK
      ?auto_241742 - BLOCK
      ?auto_241743 - BLOCK
    )
    :vars
    (
      ?auto_241744 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_241743 ?auto_241744 ) ( ON-TABLE ?auto_241734 ) ( ON ?auto_241735 ?auto_241734 ) ( not ( = ?auto_241734 ?auto_241735 ) ) ( not ( = ?auto_241734 ?auto_241736 ) ) ( not ( = ?auto_241734 ?auto_241737 ) ) ( not ( = ?auto_241734 ?auto_241738 ) ) ( not ( = ?auto_241734 ?auto_241739 ) ) ( not ( = ?auto_241734 ?auto_241740 ) ) ( not ( = ?auto_241734 ?auto_241741 ) ) ( not ( = ?auto_241734 ?auto_241742 ) ) ( not ( = ?auto_241734 ?auto_241743 ) ) ( not ( = ?auto_241734 ?auto_241744 ) ) ( not ( = ?auto_241735 ?auto_241736 ) ) ( not ( = ?auto_241735 ?auto_241737 ) ) ( not ( = ?auto_241735 ?auto_241738 ) ) ( not ( = ?auto_241735 ?auto_241739 ) ) ( not ( = ?auto_241735 ?auto_241740 ) ) ( not ( = ?auto_241735 ?auto_241741 ) ) ( not ( = ?auto_241735 ?auto_241742 ) ) ( not ( = ?auto_241735 ?auto_241743 ) ) ( not ( = ?auto_241735 ?auto_241744 ) ) ( not ( = ?auto_241736 ?auto_241737 ) ) ( not ( = ?auto_241736 ?auto_241738 ) ) ( not ( = ?auto_241736 ?auto_241739 ) ) ( not ( = ?auto_241736 ?auto_241740 ) ) ( not ( = ?auto_241736 ?auto_241741 ) ) ( not ( = ?auto_241736 ?auto_241742 ) ) ( not ( = ?auto_241736 ?auto_241743 ) ) ( not ( = ?auto_241736 ?auto_241744 ) ) ( not ( = ?auto_241737 ?auto_241738 ) ) ( not ( = ?auto_241737 ?auto_241739 ) ) ( not ( = ?auto_241737 ?auto_241740 ) ) ( not ( = ?auto_241737 ?auto_241741 ) ) ( not ( = ?auto_241737 ?auto_241742 ) ) ( not ( = ?auto_241737 ?auto_241743 ) ) ( not ( = ?auto_241737 ?auto_241744 ) ) ( not ( = ?auto_241738 ?auto_241739 ) ) ( not ( = ?auto_241738 ?auto_241740 ) ) ( not ( = ?auto_241738 ?auto_241741 ) ) ( not ( = ?auto_241738 ?auto_241742 ) ) ( not ( = ?auto_241738 ?auto_241743 ) ) ( not ( = ?auto_241738 ?auto_241744 ) ) ( not ( = ?auto_241739 ?auto_241740 ) ) ( not ( = ?auto_241739 ?auto_241741 ) ) ( not ( = ?auto_241739 ?auto_241742 ) ) ( not ( = ?auto_241739 ?auto_241743 ) ) ( not ( = ?auto_241739 ?auto_241744 ) ) ( not ( = ?auto_241740 ?auto_241741 ) ) ( not ( = ?auto_241740 ?auto_241742 ) ) ( not ( = ?auto_241740 ?auto_241743 ) ) ( not ( = ?auto_241740 ?auto_241744 ) ) ( not ( = ?auto_241741 ?auto_241742 ) ) ( not ( = ?auto_241741 ?auto_241743 ) ) ( not ( = ?auto_241741 ?auto_241744 ) ) ( not ( = ?auto_241742 ?auto_241743 ) ) ( not ( = ?auto_241742 ?auto_241744 ) ) ( not ( = ?auto_241743 ?auto_241744 ) ) ( ON ?auto_241742 ?auto_241743 ) ( ON ?auto_241741 ?auto_241742 ) ( ON ?auto_241740 ?auto_241741 ) ( ON ?auto_241739 ?auto_241740 ) ( ON ?auto_241738 ?auto_241739 ) ( ON ?auto_241737 ?auto_241738 ) ( CLEAR ?auto_241735 ) ( ON ?auto_241736 ?auto_241737 ) ( CLEAR ?auto_241736 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_241734 ?auto_241735 ?auto_241736 )
      ( MAKE-10PILE ?auto_241734 ?auto_241735 ?auto_241736 ?auto_241737 ?auto_241738 ?auto_241739 ?auto_241740 ?auto_241741 ?auto_241742 ?auto_241743 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_241755 - BLOCK
      ?auto_241756 - BLOCK
      ?auto_241757 - BLOCK
      ?auto_241758 - BLOCK
      ?auto_241759 - BLOCK
      ?auto_241760 - BLOCK
      ?auto_241761 - BLOCK
      ?auto_241762 - BLOCK
      ?auto_241763 - BLOCK
      ?auto_241764 - BLOCK
    )
    :vars
    (
      ?auto_241765 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_241764 ?auto_241765 ) ( ON-TABLE ?auto_241755 ) ( ON ?auto_241756 ?auto_241755 ) ( not ( = ?auto_241755 ?auto_241756 ) ) ( not ( = ?auto_241755 ?auto_241757 ) ) ( not ( = ?auto_241755 ?auto_241758 ) ) ( not ( = ?auto_241755 ?auto_241759 ) ) ( not ( = ?auto_241755 ?auto_241760 ) ) ( not ( = ?auto_241755 ?auto_241761 ) ) ( not ( = ?auto_241755 ?auto_241762 ) ) ( not ( = ?auto_241755 ?auto_241763 ) ) ( not ( = ?auto_241755 ?auto_241764 ) ) ( not ( = ?auto_241755 ?auto_241765 ) ) ( not ( = ?auto_241756 ?auto_241757 ) ) ( not ( = ?auto_241756 ?auto_241758 ) ) ( not ( = ?auto_241756 ?auto_241759 ) ) ( not ( = ?auto_241756 ?auto_241760 ) ) ( not ( = ?auto_241756 ?auto_241761 ) ) ( not ( = ?auto_241756 ?auto_241762 ) ) ( not ( = ?auto_241756 ?auto_241763 ) ) ( not ( = ?auto_241756 ?auto_241764 ) ) ( not ( = ?auto_241756 ?auto_241765 ) ) ( not ( = ?auto_241757 ?auto_241758 ) ) ( not ( = ?auto_241757 ?auto_241759 ) ) ( not ( = ?auto_241757 ?auto_241760 ) ) ( not ( = ?auto_241757 ?auto_241761 ) ) ( not ( = ?auto_241757 ?auto_241762 ) ) ( not ( = ?auto_241757 ?auto_241763 ) ) ( not ( = ?auto_241757 ?auto_241764 ) ) ( not ( = ?auto_241757 ?auto_241765 ) ) ( not ( = ?auto_241758 ?auto_241759 ) ) ( not ( = ?auto_241758 ?auto_241760 ) ) ( not ( = ?auto_241758 ?auto_241761 ) ) ( not ( = ?auto_241758 ?auto_241762 ) ) ( not ( = ?auto_241758 ?auto_241763 ) ) ( not ( = ?auto_241758 ?auto_241764 ) ) ( not ( = ?auto_241758 ?auto_241765 ) ) ( not ( = ?auto_241759 ?auto_241760 ) ) ( not ( = ?auto_241759 ?auto_241761 ) ) ( not ( = ?auto_241759 ?auto_241762 ) ) ( not ( = ?auto_241759 ?auto_241763 ) ) ( not ( = ?auto_241759 ?auto_241764 ) ) ( not ( = ?auto_241759 ?auto_241765 ) ) ( not ( = ?auto_241760 ?auto_241761 ) ) ( not ( = ?auto_241760 ?auto_241762 ) ) ( not ( = ?auto_241760 ?auto_241763 ) ) ( not ( = ?auto_241760 ?auto_241764 ) ) ( not ( = ?auto_241760 ?auto_241765 ) ) ( not ( = ?auto_241761 ?auto_241762 ) ) ( not ( = ?auto_241761 ?auto_241763 ) ) ( not ( = ?auto_241761 ?auto_241764 ) ) ( not ( = ?auto_241761 ?auto_241765 ) ) ( not ( = ?auto_241762 ?auto_241763 ) ) ( not ( = ?auto_241762 ?auto_241764 ) ) ( not ( = ?auto_241762 ?auto_241765 ) ) ( not ( = ?auto_241763 ?auto_241764 ) ) ( not ( = ?auto_241763 ?auto_241765 ) ) ( not ( = ?auto_241764 ?auto_241765 ) ) ( ON ?auto_241763 ?auto_241764 ) ( ON ?auto_241762 ?auto_241763 ) ( ON ?auto_241761 ?auto_241762 ) ( ON ?auto_241760 ?auto_241761 ) ( ON ?auto_241759 ?auto_241760 ) ( ON ?auto_241758 ?auto_241759 ) ( CLEAR ?auto_241756 ) ( ON ?auto_241757 ?auto_241758 ) ( CLEAR ?auto_241757 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_241755 ?auto_241756 ?auto_241757 )
      ( MAKE-10PILE ?auto_241755 ?auto_241756 ?auto_241757 ?auto_241758 ?auto_241759 ?auto_241760 ?auto_241761 ?auto_241762 ?auto_241763 ?auto_241764 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_241776 - BLOCK
      ?auto_241777 - BLOCK
      ?auto_241778 - BLOCK
      ?auto_241779 - BLOCK
      ?auto_241780 - BLOCK
      ?auto_241781 - BLOCK
      ?auto_241782 - BLOCK
      ?auto_241783 - BLOCK
      ?auto_241784 - BLOCK
      ?auto_241785 - BLOCK
    )
    :vars
    (
      ?auto_241786 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_241785 ?auto_241786 ) ( ON-TABLE ?auto_241776 ) ( not ( = ?auto_241776 ?auto_241777 ) ) ( not ( = ?auto_241776 ?auto_241778 ) ) ( not ( = ?auto_241776 ?auto_241779 ) ) ( not ( = ?auto_241776 ?auto_241780 ) ) ( not ( = ?auto_241776 ?auto_241781 ) ) ( not ( = ?auto_241776 ?auto_241782 ) ) ( not ( = ?auto_241776 ?auto_241783 ) ) ( not ( = ?auto_241776 ?auto_241784 ) ) ( not ( = ?auto_241776 ?auto_241785 ) ) ( not ( = ?auto_241776 ?auto_241786 ) ) ( not ( = ?auto_241777 ?auto_241778 ) ) ( not ( = ?auto_241777 ?auto_241779 ) ) ( not ( = ?auto_241777 ?auto_241780 ) ) ( not ( = ?auto_241777 ?auto_241781 ) ) ( not ( = ?auto_241777 ?auto_241782 ) ) ( not ( = ?auto_241777 ?auto_241783 ) ) ( not ( = ?auto_241777 ?auto_241784 ) ) ( not ( = ?auto_241777 ?auto_241785 ) ) ( not ( = ?auto_241777 ?auto_241786 ) ) ( not ( = ?auto_241778 ?auto_241779 ) ) ( not ( = ?auto_241778 ?auto_241780 ) ) ( not ( = ?auto_241778 ?auto_241781 ) ) ( not ( = ?auto_241778 ?auto_241782 ) ) ( not ( = ?auto_241778 ?auto_241783 ) ) ( not ( = ?auto_241778 ?auto_241784 ) ) ( not ( = ?auto_241778 ?auto_241785 ) ) ( not ( = ?auto_241778 ?auto_241786 ) ) ( not ( = ?auto_241779 ?auto_241780 ) ) ( not ( = ?auto_241779 ?auto_241781 ) ) ( not ( = ?auto_241779 ?auto_241782 ) ) ( not ( = ?auto_241779 ?auto_241783 ) ) ( not ( = ?auto_241779 ?auto_241784 ) ) ( not ( = ?auto_241779 ?auto_241785 ) ) ( not ( = ?auto_241779 ?auto_241786 ) ) ( not ( = ?auto_241780 ?auto_241781 ) ) ( not ( = ?auto_241780 ?auto_241782 ) ) ( not ( = ?auto_241780 ?auto_241783 ) ) ( not ( = ?auto_241780 ?auto_241784 ) ) ( not ( = ?auto_241780 ?auto_241785 ) ) ( not ( = ?auto_241780 ?auto_241786 ) ) ( not ( = ?auto_241781 ?auto_241782 ) ) ( not ( = ?auto_241781 ?auto_241783 ) ) ( not ( = ?auto_241781 ?auto_241784 ) ) ( not ( = ?auto_241781 ?auto_241785 ) ) ( not ( = ?auto_241781 ?auto_241786 ) ) ( not ( = ?auto_241782 ?auto_241783 ) ) ( not ( = ?auto_241782 ?auto_241784 ) ) ( not ( = ?auto_241782 ?auto_241785 ) ) ( not ( = ?auto_241782 ?auto_241786 ) ) ( not ( = ?auto_241783 ?auto_241784 ) ) ( not ( = ?auto_241783 ?auto_241785 ) ) ( not ( = ?auto_241783 ?auto_241786 ) ) ( not ( = ?auto_241784 ?auto_241785 ) ) ( not ( = ?auto_241784 ?auto_241786 ) ) ( not ( = ?auto_241785 ?auto_241786 ) ) ( ON ?auto_241784 ?auto_241785 ) ( ON ?auto_241783 ?auto_241784 ) ( ON ?auto_241782 ?auto_241783 ) ( ON ?auto_241781 ?auto_241782 ) ( ON ?auto_241780 ?auto_241781 ) ( ON ?auto_241779 ?auto_241780 ) ( ON ?auto_241778 ?auto_241779 ) ( CLEAR ?auto_241776 ) ( ON ?auto_241777 ?auto_241778 ) ( CLEAR ?auto_241777 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_241776 ?auto_241777 )
      ( MAKE-10PILE ?auto_241776 ?auto_241777 ?auto_241778 ?auto_241779 ?auto_241780 ?auto_241781 ?auto_241782 ?auto_241783 ?auto_241784 ?auto_241785 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_241797 - BLOCK
      ?auto_241798 - BLOCK
      ?auto_241799 - BLOCK
      ?auto_241800 - BLOCK
      ?auto_241801 - BLOCK
      ?auto_241802 - BLOCK
      ?auto_241803 - BLOCK
      ?auto_241804 - BLOCK
      ?auto_241805 - BLOCK
      ?auto_241806 - BLOCK
    )
    :vars
    (
      ?auto_241807 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_241806 ?auto_241807 ) ( ON-TABLE ?auto_241797 ) ( not ( = ?auto_241797 ?auto_241798 ) ) ( not ( = ?auto_241797 ?auto_241799 ) ) ( not ( = ?auto_241797 ?auto_241800 ) ) ( not ( = ?auto_241797 ?auto_241801 ) ) ( not ( = ?auto_241797 ?auto_241802 ) ) ( not ( = ?auto_241797 ?auto_241803 ) ) ( not ( = ?auto_241797 ?auto_241804 ) ) ( not ( = ?auto_241797 ?auto_241805 ) ) ( not ( = ?auto_241797 ?auto_241806 ) ) ( not ( = ?auto_241797 ?auto_241807 ) ) ( not ( = ?auto_241798 ?auto_241799 ) ) ( not ( = ?auto_241798 ?auto_241800 ) ) ( not ( = ?auto_241798 ?auto_241801 ) ) ( not ( = ?auto_241798 ?auto_241802 ) ) ( not ( = ?auto_241798 ?auto_241803 ) ) ( not ( = ?auto_241798 ?auto_241804 ) ) ( not ( = ?auto_241798 ?auto_241805 ) ) ( not ( = ?auto_241798 ?auto_241806 ) ) ( not ( = ?auto_241798 ?auto_241807 ) ) ( not ( = ?auto_241799 ?auto_241800 ) ) ( not ( = ?auto_241799 ?auto_241801 ) ) ( not ( = ?auto_241799 ?auto_241802 ) ) ( not ( = ?auto_241799 ?auto_241803 ) ) ( not ( = ?auto_241799 ?auto_241804 ) ) ( not ( = ?auto_241799 ?auto_241805 ) ) ( not ( = ?auto_241799 ?auto_241806 ) ) ( not ( = ?auto_241799 ?auto_241807 ) ) ( not ( = ?auto_241800 ?auto_241801 ) ) ( not ( = ?auto_241800 ?auto_241802 ) ) ( not ( = ?auto_241800 ?auto_241803 ) ) ( not ( = ?auto_241800 ?auto_241804 ) ) ( not ( = ?auto_241800 ?auto_241805 ) ) ( not ( = ?auto_241800 ?auto_241806 ) ) ( not ( = ?auto_241800 ?auto_241807 ) ) ( not ( = ?auto_241801 ?auto_241802 ) ) ( not ( = ?auto_241801 ?auto_241803 ) ) ( not ( = ?auto_241801 ?auto_241804 ) ) ( not ( = ?auto_241801 ?auto_241805 ) ) ( not ( = ?auto_241801 ?auto_241806 ) ) ( not ( = ?auto_241801 ?auto_241807 ) ) ( not ( = ?auto_241802 ?auto_241803 ) ) ( not ( = ?auto_241802 ?auto_241804 ) ) ( not ( = ?auto_241802 ?auto_241805 ) ) ( not ( = ?auto_241802 ?auto_241806 ) ) ( not ( = ?auto_241802 ?auto_241807 ) ) ( not ( = ?auto_241803 ?auto_241804 ) ) ( not ( = ?auto_241803 ?auto_241805 ) ) ( not ( = ?auto_241803 ?auto_241806 ) ) ( not ( = ?auto_241803 ?auto_241807 ) ) ( not ( = ?auto_241804 ?auto_241805 ) ) ( not ( = ?auto_241804 ?auto_241806 ) ) ( not ( = ?auto_241804 ?auto_241807 ) ) ( not ( = ?auto_241805 ?auto_241806 ) ) ( not ( = ?auto_241805 ?auto_241807 ) ) ( not ( = ?auto_241806 ?auto_241807 ) ) ( ON ?auto_241805 ?auto_241806 ) ( ON ?auto_241804 ?auto_241805 ) ( ON ?auto_241803 ?auto_241804 ) ( ON ?auto_241802 ?auto_241803 ) ( ON ?auto_241801 ?auto_241802 ) ( ON ?auto_241800 ?auto_241801 ) ( ON ?auto_241799 ?auto_241800 ) ( CLEAR ?auto_241797 ) ( ON ?auto_241798 ?auto_241799 ) ( CLEAR ?auto_241798 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_241797 ?auto_241798 )
      ( MAKE-10PILE ?auto_241797 ?auto_241798 ?auto_241799 ?auto_241800 ?auto_241801 ?auto_241802 ?auto_241803 ?auto_241804 ?auto_241805 ?auto_241806 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_241818 - BLOCK
      ?auto_241819 - BLOCK
      ?auto_241820 - BLOCK
      ?auto_241821 - BLOCK
      ?auto_241822 - BLOCK
      ?auto_241823 - BLOCK
      ?auto_241824 - BLOCK
      ?auto_241825 - BLOCK
      ?auto_241826 - BLOCK
      ?auto_241827 - BLOCK
    )
    :vars
    (
      ?auto_241828 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_241827 ?auto_241828 ) ( not ( = ?auto_241818 ?auto_241819 ) ) ( not ( = ?auto_241818 ?auto_241820 ) ) ( not ( = ?auto_241818 ?auto_241821 ) ) ( not ( = ?auto_241818 ?auto_241822 ) ) ( not ( = ?auto_241818 ?auto_241823 ) ) ( not ( = ?auto_241818 ?auto_241824 ) ) ( not ( = ?auto_241818 ?auto_241825 ) ) ( not ( = ?auto_241818 ?auto_241826 ) ) ( not ( = ?auto_241818 ?auto_241827 ) ) ( not ( = ?auto_241818 ?auto_241828 ) ) ( not ( = ?auto_241819 ?auto_241820 ) ) ( not ( = ?auto_241819 ?auto_241821 ) ) ( not ( = ?auto_241819 ?auto_241822 ) ) ( not ( = ?auto_241819 ?auto_241823 ) ) ( not ( = ?auto_241819 ?auto_241824 ) ) ( not ( = ?auto_241819 ?auto_241825 ) ) ( not ( = ?auto_241819 ?auto_241826 ) ) ( not ( = ?auto_241819 ?auto_241827 ) ) ( not ( = ?auto_241819 ?auto_241828 ) ) ( not ( = ?auto_241820 ?auto_241821 ) ) ( not ( = ?auto_241820 ?auto_241822 ) ) ( not ( = ?auto_241820 ?auto_241823 ) ) ( not ( = ?auto_241820 ?auto_241824 ) ) ( not ( = ?auto_241820 ?auto_241825 ) ) ( not ( = ?auto_241820 ?auto_241826 ) ) ( not ( = ?auto_241820 ?auto_241827 ) ) ( not ( = ?auto_241820 ?auto_241828 ) ) ( not ( = ?auto_241821 ?auto_241822 ) ) ( not ( = ?auto_241821 ?auto_241823 ) ) ( not ( = ?auto_241821 ?auto_241824 ) ) ( not ( = ?auto_241821 ?auto_241825 ) ) ( not ( = ?auto_241821 ?auto_241826 ) ) ( not ( = ?auto_241821 ?auto_241827 ) ) ( not ( = ?auto_241821 ?auto_241828 ) ) ( not ( = ?auto_241822 ?auto_241823 ) ) ( not ( = ?auto_241822 ?auto_241824 ) ) ( not ( = ?auto_241822 ?auto_241825 ) ) ( not ( = ?auto_241822 ?auto_241826 ) ) ( not ( = ?auto_241822 ?auto_241827 ) ) ( not ( = ?auto_241822 ?auto_241828 ) ) ( not ( = ?auto_241823 ?auto_241824 ) ) ( not ( = ?auto_241823 ?auto_241825 ) ) ( not ( = ?auto_241823 ?auto_241826 ) ) ( not ( = ?auto_241823 ?auto_241827 ) ) ( not ( = ?auto_241823 ?auto_241828 ) ) ( not ( = ?auto_241824 ?auto_241825 ) ) ( not ( = ?auto_241824 ?auto_241826 ) ) ( not ( = ?auto_241824 ?auto_241827 ) ) ( not ( = ?auto_241824 ?auto_241828 ) ) ( not ( = ?auto_241825 ?auto_241826 ) ) ( not ( = ?auto_241825 ?auto_241827 ) ) ( not ( = ?auto_241825 ?auto_241828 ) ) ( not ( = ?auto_241826 ?auto_241827 ) ) ( not ( = ?auto_241826 ?auto_241828 ) ) ( not ( = ?auto_241827 ?auto_241828 ) ) ( ON ?auto_241826 ?auto_241827 ) ( ON ?auto_241825 ?auto_241826 ) ( ON ?auto_241824 ?auto_241825 ) ( ON ?auto_241823 ?auto_241824 ) ( ON ?auto_241822 ?auto_241823 ) ( ON ?auto_241821 ?auto_241822 ) ( ON ?auto_241820 ?auto_241821 ) ( ON ?auto_241819 ?auto_241820 ) ( ON ?auto_241818 ?auto_241819 ) ( CLEAR ?auto_241818 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_241818 )
      ( MAKE-10PILE ?auto_241818 ?auto_241819 ?auto_241820 ?auto_241821 ?auto_241822 ?auto_241823 ?auto_241824 ?auto_241825 ?auto_241826 ?auto_241827 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_241839 - BLOCK
      ?auto_241840 - BLOCK
      ?auto_241841 - BLOCK
      ?auto_241842 - BLOCK
      ?auto_241843 - BLOCK
      ?auto_241844 - BLOCK
      ?auto_241845 - BLOCK
      ?auto_241846 - BLOCK
      ?auto_241847 - BLOCK
      ?auto_241848 - BLOCK
    )
    :vars
    (
      ?auto_241849 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_241848 ?auto_241849 ) ( not ( = ?auto_241839 ?auto_241840 ) ) ( not ( = ?auto_241839 ?auto_241841 ) ) ( not ( = ?auto_241839 ?auto_241842 ) ) ( not ( = ?auto_241839 ?auto_241843 ) ) ( not ( = ?auto_241839 ?auto_241844 ) ) ( not ( = ?auto_241839 ?auto_241845 ) ) ( not ( = ?auto_241839 ?auto_241846 ) ) ( not ( = ?auto_241839 ?auto_241847 ) ) ( not ( = ?auto_241839 ?auto_241848 ) ) ( not ( = ?auto_241839 ?auto_241849 ) ) ( not ( = ?auto_241840 ?auto_241841 ) ) ( not ( = ?auto_241840 ?auto_241842 ) ) ( not ( = ?auto_241840 ?auto_241843 ) ) ( not ( = ?auto_241840 ?auto_241844 ) ) ( not ( = ?auto_241840 ?auto_241845 ) ) ( not ( = ?auto_241840 ?auto_241846 ) ) ( not ( = ?auto_241840 ?auto_241847 ) ) ( not ( = ?auto_241840 ?auto_241848 ) ) ( not ( = ?auto_241840 ?auto_241849 ) ) ( not ( = ?auto_241841 ?auto_241842 ) ) ( not ( = ?auto_241841 ?auto_241843 ) ) ( not ( = ?auto_241841 ?auto_241844 ) ) ( not ( = ?auto_241841 ?auto_241845 ) ) ( not ( = ?auto_241841 ?auto_241846 ) ) ( not ( = ?auto_241841 ?auto_241847 ) ) ( not ( = ?auto_241841 ?auto_241848 ) ) ( not ( = ?auto_241841 ?auto_241849 ) ) ( not ( = ?auto_241842 ?auto_241843 ) ) ( not ( = ?auto_241842 ?auto_241844 ) ) ( not ( = ?auto_241842 ?auto_241845 ) ) ( not ( = ?auto_241842 ?auto_241846 ) ) ( not ( = ?auto_241842 ?auto_241847 ) ) ( not ( = ?auto_241842 ?auto_241848 ) ) ( not ( = ?auto_241842 ?auto_241849 ) ) ( not ( = ?auto_241843 ?auto_241844 ) ) ( not ( = ?auto_241843 ?auto_241845 ) ) ( not ( = ?auto_241843 ?auto_241846 ) ) ( not ( = ?auto_241843 ?auto_241847 ) ) ( not ( = ?auto_241843 ?auto_241848 ) ) ( not ( = ?auto_241843 ?auto_241849 ) ) ( not ( = ?auto_241844 ?auto_241845 ) ) ( not ( = ?auto_241844 ?auto_241846 ) ) ( not ( = ?auto_241844 ?auto_241847 ) ) ( not ( = ?auto_241844 ?auto_241848 ) ) ( not ( = ?auto_241844 ?auto_241849 ) ) ( not ( = ?auto_241845 ?auto_241846 ) ) ( not ( = ?auto_241845 ?auto_241847 ) ) ( not ( = ?auto_241845 ?auto_241848 ) ) ( not ( = ?auto_241845 ?auto_241849 ) ) ( not ( = ?auto_241846 ?auto_241847 ) ) ( not ( = ?auto_241846 ?auto_241848 ) ) ( not ( = ?auto_241846 ?auto_241849 ) ) ( not ( = ?auto_241847 ?auto_241848 ) ) ( not ( = ?auto_241847 ?auto_241849 ) ) ( not ( = ?auto_241848 ?auto_241849 ) ) ( ON ?auto_241847 ?auto_241848 ) ( ON ?auto_241846 ?auto_241847 ) ( ON ?auto_241845 ?auto_241846 ) ( ON ?auto_241844 ?auto_241845 ) ( ON ?auto_241843 ?auto_241844 ) ( ON ?auto_241842 ?auto_241843 ) ( ON ?auto_241841 ?auto_241842 ) ( ON ?auto_241840 ?auto_241841 ) ( ON ?auto_241839 ?auto_241840 ) ( CLEAR ?auto_241839 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_241839 )
      ( MAKE-10PILE ?auto_241839 ?auto_241840 ?auto_241841 ?auto_241842 ?auto_241843 ?auto_241844 ?auto_241845 ?auto_241846 ?auto_241847 ?auto_241848 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_241861 - BLOCK
      ?auto_241862 - BLOCK
      ?auto_241863 - BLOCK
      ?auto_241864 - BLOCK
      ?auto_241865 - BLOCK
      ?auto_241866 - BLOCK
      ?auto_241867 - BLOCK
      ?auto_241868 - BLOCK
      ?auto_241869 - BLOCK
      ?auto_241870 - BLOCK
      ?auto_241871 - BLOCK
    )
    :vars
    (
      ?auto_241872 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_241870 ) ( ON ?auto_241871 ?auto_241872 ) ( CLEAR ?auto_241871 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_241861 ) ( ON ?auto_241862 ?auto_241861 ) ( ON ?auto_241863 ?auto_241862 ) ( ON ?auto_241864 ?auto_241863 ) ( ON ?auto_241865 ?auto_241864 ) ( ON ?auto_241866 ?auto_241865 ) ( ON ?auto_241867 ?auto_241866 ) ( ON ?auto_241868 ?auto_241867 ) ( ON ?auto_241869 ?auto_241868 ) ( ON ?auto_241870 ?auto_241869 ) ( not ( = ?auto_241861 ?auto_241862 ) ) ( not ( = ?auto_241861 ?auto_241863 ) ) ( not ( = ?auto_241861 ?auto_241864 ) ) ( not ( = ?auto_241861 ?auto_241865 ) ) ( not ( = ?auto_241861 ?auto_241866 ) ) ( not ( = ?auto_241861 ?auto_241867 ) ) ( not ( = ?auto_241861 ?auto_241868 ) ) ( not ( = ?auto_241861 ?auto_241869 ) ) ( not ( = ?auto_241861 ?auto_241870 ) ) ( not ( = ?auto_241861 ?auto_241871 ) ) ( not ( = ?auto_241861 ?auto_241872 ) ) ( not ( = ?auto_241862 ?auto_241863 ) ) ( not ( = ?auto_241862 ?auto_241864 ) ) ( not ( = ?auto_241862 ?auto_241865 ) ) ( not ( = ?auto_241862 ?auto_241866 ) ) ( not ( = ?auto_241862 ?auto_241867 ) ) ( not ( = ?auto_241862 ?auto_241868 ) ) ( not ( = ?auto_241862 ?auto_241869 ) ) ( not ( = ?auto_241862 ?auto_241870 ) ) ( not ( = ?auto_241862 ?auto_241871 ) ) ( not ( = ?auto_241862 ?auto_241872 ) ) ( not ( = ?auto_241863 ?auto_241864 ) ) ( not ( = ?auto_241863 ?auto_241865 ) ) ( not ( = ?auto_241863 ?auto_241866 ) ) ( not ( = ?auto_241863 ?auto_241867 ) ) ( not ( = ?auto_241863 ?auto_241868 ) ) ( not ( = ?auto_241863 ?auto_241869 ) ) ( not ( = ?auto_241863 ?auto_241870 ) ) ( not ( = ?auto_241863 ?auto_241871 ) ) ( not ( = ?auto_241863 ?auto_241872 ) ) ( not ( = ?auto_241864 ?auto_241865 ) ) ( not ( = ?auto_241864 ?auto_241866 ) ) ( not ( = ?auto_241864 ?auto_241867 ) ) ( not ( = ?auto_241864 ?auto_241868 ) ) ( not ( = ?auto_241864 ?auto_241869 ) ) ( not ( = ?auto_241864 ?auto_241870 ) ) ( not ( = ?auto_241864 ?auto_241871 ) ) ( not ( = ?auto_241864 ?auto_241872 ) ) ( not ( = ?auto_241865 ?auto_241866 ) ) ( not ( = ?auto_241865 ?auto_241867 ) ) ( not ( = ?auto_241865 ?auto_241868 ) ) ( not ( = ?auto_241865 ?auto_241869 ) ) ( not ( = ?auto_241865 ?auto_241870 ) ) ( not ( = ?auto_241865 ?auto_241871 ) ) ( not ( = ?auto_241865 ?auto_241872 ) ) ( not ( = ?auto_241866 ?auto_241867 ) ) ( not ( = ?auto_241866 ?auto_241868 ) ) ( not ( = ?auto_241866 ?auto_241869 ) ) ( not ( = ?auto_241866 ?auto_241870 ) ) ( not ( = ?auto_241866 ?auto_241871 ) ) ( not ( = ?auto_241866 ?auto_241872 ) ) ( not ( = ?auto_241867 ?auto_241868 ) ) ( not ( = ?auto_241867 ?auto_241869 ) ) ( not ( = ?auto_241867 ?auto_241870 ) ) ( not ( = ?auto_241867 ?auto_241871 ) ) ( not ( = ?auto_241867 ?auto_241872 ) ) ( not ( = ?auto_241868 ?auto_241869 ) ) ( not ( = ?auto_241868 ?auto_241870 ) ) ( not ( = ?auto_241868 ?auto_241871 ) ) ( not ( = ?auto_241868 ?auto_241872 ) ) ( not ( = ?auto_241869 ?auto_241870 ) ) ( not ( = ?auto_241869 ?auto_241871 ) ) ( not ( = ?auto_241869 ?auto_241872 ) ) ( not ( = ?auto_241870 ?auto_241871 ) ) ( not ( = ?auto_241870 ?auto_241872 ) ) ( not ( = ?auto_241871 ?auto_241872 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_241871 ?auto_241872 )
      ( !STACK ?auto_241871 ?auto_241870 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_241884 - BLOCK
      ?auto_241885 - BLOCK
      ?auto_241886 - BLOCK
      ?auto_241887 - BLOCK
      ?auto_241888 - BLOCK
      ?auto_241889 - BLOCK
      ?auto_241890 - BLOCK
      ?auto_241891 - BLOCK
      ?auto_241892 - BLOCK
      ?auto_241893 - BLOCK
      ?auto_241894 - BLOCK
    )
    :vars
    (
      ?auto_241895 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_241893 ) ( ON ?auto_241894 ?auto_241895 ) ( CLEAR ?auto_241894 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_241884 ) ( ON ?auto_241885 ?auto_241884 ) ( ON ?auto_241886 ?auto_241885 ) ( ON ?auto_241887 ?auto_241886 ) ( ON ?auto_241888 ?auto_241887 ) ( ON ?auto_241889 ?auto_241888 ) ( ON ?auto_241890 ?auto_241889 ) ( ON ?auto_241891 ?auto_241890 ) ( ON ?auto_241892 ?auto_241891 ) ( ON ?auto_241893 ?auto_241892 ) ( not ( = ?auto_241884 ?auto_241885 ) ) ( not ( = ?auto_241884 ?auto_241886 ) ) ( not ( = ?auto_241884 ?auto_241887 ) ) ( not ( = ?auto_241884 ?auto_241888 ) ) ( not ( = ?auto_241884 ?auto_241889 ) ) ( not ( = ?auto_241884 ?auto_241890 ) ) ( not ( = ?auto_241884 ?auto_241891 ) ) ( not ( = ?auto_241884 ?auto_241892 ) ) ( not ( = ?auto_241884 ?auto_241893 ) ) ( not ( = ?auto_241884 ?auto_241894 ) ) ( not ( = ?auto_241884 ?auto_241895 ) ) ( not ( = ?auto_241885 ?auto_241886 ) ) ( not ( = ?auto_241885 ?auto_241887 ) ) ( not ( = ?auto_241885 ?auto_241888 ) ) ( not ( = ?auto_241885 ?auto_241889 ) ) ( not ( = ?auto_241885 ?auto_241890 ) ) ( not ( = ?auto_241885 ?auto_241891 ) ) ( not ( = ?auto_241885 ?auto_241892 ) ) ( not ( = ?auto_241885 ?auto_241893 ) ) ( not ( = ?auto_241885 ?auto_241894 ) ) ( not ( = ?auto_241885 ?auto_241895 ) ) ( not ( = ?auto_241886 ?auto_241887 ) ) ( not ( = ?auto_241886 ?auto_241888 ) ) ( not ( = ?auto_241886 ?auto_241889 ) ) ( not ( = ?auto_241886 ?auto_241890 ) ) ( not ( = ?auto_241886 ?auto_241891 ) ) ( not ( = ?auto_241886 ?auto_241892 ) ) ( not ( = ?auto_241886 ?auto_241893 ) ) ( not ( = ?auto_241886 ?auto_241894 ) ) ( not ( = ?auto_241886 ?auto_241895 ) ) ( not ( = ?auto_241887 ?auto_241888 ) ) ( not ( = ?auto_241887 ?auto_241889 ) ) ( not ( = ?auto_241887 ?auto_241890 ) ) ( not ( = ?auto_241887 ?auto_241891 ) ) ( not ( = ?auto_241887 ?auto_241892 ) ) ( not ( = ?auto_241887 ?auto_241893 ) ) ( not ( = ?auto_241887 ?auto_241894 ) ) ( not ( = ?auto_241887 ?auto_241895 ) ) ( not ( = ?auto_241888 ?auto_241889 ) ) ( not ( = ?auto_241888 ?auto_241890 ) ) ( not ( = ?auto_241888 ?auto_241891 ) ) ( not ( = ?auto_241888 ?auto_241892 ) ) ( not ( = ?auto_241888 ?auto_241893 ) ) ( not ( = ?auto_241888 ?auto_241894 ) ) ( not ( = ?auto_241888 ?auto_241895 ) ) ( not ( = ?auto_241889 ?auto_241890 ) ) ( not ( = ?auto_241889 ?auto_241891 ) ) ( not ( = ?auto_241889 ?auto_241892 ) ) ( not ( = ?auto_241889 ?auto_241893 ) ) ( not ( = ?auto_241889 ?auto_241894 ) ) ( not ( = ?auto_241889 ?auto_241895 ) ) ( not ( = ?auto_241890 ?auto_241891 ) ) ( not ( = ?auto_241890 ?auto_241892 ) ) ( not ( = ?auto_241890 ?auto_241893 ) ) ( not ( = ?auto_241890 ?auto_241894 ) ) ( not ( = ?auto_241890 ?auto_241895 ) ) ( not ( = ?auto_241891 ?auto_241892 ) ) ( not ( = ?auto_241891 ?auto_241893 ) ) ( not ( = ?auto_241891 ?auto_241894 ) ) ( not ( = ?auto_241891 ?auto_241895 ) ) ( not ( = ?auto_241892 ?auto_241893 ) ) ( not ( = ?auto_241892 ?auto_241894 ) ) ( not ( = ?auto_241892 ?auto_241895 ) ) ( not ( = ?auto_241893 ?auto_241894 ) ) ( not ( = ?auto_241893 ?auto_241895 ) ) ( not ( = ?auto_241894 ?auto_241895 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_241894 ?auto_241895 )
      ( !STACK ?auto_241894 ?auto_241893 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_241907 - BLOCK
      ?auto_241908 - BLOCK
      ?auto_241909 - BLOCK
      ?auto_241910 - BLOCK
      ?auto_241911 - BLOCK
      ?auto_241912 - BLOCK
      ?auto_241913 - BLOCK
      ?auto_241914 - BLOCK
      ?auto_241915 - BLOCK
      ?auto_241916 - BLOCK
      ?auto_241917 - BLOCK
    )
    :vars
    (
      ?auto_241918 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_241917 ?auto_241918 ) ( ON-TABLE ?auto_241907 ) ( ON ?auto_241908 ?auto_241907 ) ( ON ?auto_241909 ?auto_241908 ) ( ON ?auto_241910 ?auto_241909 ) ( ON ?auto_241911 ?auto_241910 ) ( ON ?auto_241912 ?auto_241911 ) ( ON ?auto_241913 ?auto_241912 ) ( ON ?auto_241914 ?auto_241913 ) ( ON ?auto_241915 ?auto_241914 ) ( not ( = ?auto_241907 ?auto_241908 ) ) ( not ( = ?auto_241907 ?auto_241909 ) ) ( not ( = ?auto_241907 ?auto_241910 ) ) ( not ( = ?auto_241907 ?auto_241911 ) ) ( not ( = ?auto_241907 ?auto_241912 ) ) ( not ( = ?auto_241907 ?auto_241913 ) ) ( not ( = ?auto_241907 ?auto_241914 ) ) ( not ( = ?auto_241907 ?auto_241915 ) ) ( not ( = ?auto_241907 ?auto_241916 ) ) ( not ( = ?auto_241907 ?auto_241917 ) ) ( not ( = ?auto_241907 ?auto_241918 ) ) ( not ( = ?auto_241908 ?auto_241909 ) ) ( not ( = ?auto_241908 ?auto_241910 ) ) ( not ( = ?auto_241908 ?auto_241911 ) ) ( not ( = ?auto_241908 ?auto_241912 ) ) ( not ( = ?auto_241908 ?auto_241913 ) ) ( not ( = ?auto_241908 ?auto_241914 ) ) ( not ( = ?auto_241908 ?auto_241915 ) ) ( not ( = ?auto_241908 ?auto_241916 ) ) ( not ( = ?auto_241908 ?auto_241917 ) ) ( not ( = ?auto_241908 ?auto_241918 ) ) ( not ( = ?auto_241909 ?auto_241910 ) ) ( not ( = ?auto_241909 ?auto_241911 ) ) ( not ( = ?auto_241909 ?auto_241912 ) ) ( not ( = ?auto_241909 ?auto_241913 ) ) ( not ( = ?auto_241909 ?auto_241914 ) ) ( not ( = ?auto_241909 ?auto_241915 ) ) ( not ( = ?auto_241909 ?auto_241916 ) ) ( not ( = ?auto_241909 ?auto_241917 ) ) ( not ( = ?auto_241909 ?auto_241918 ) ) ( not ( = ?auto_241910 ?auto_241911 ) ) ( not ( = ?auto_241910 ?auto_241912 ) ) ( not ( = ?auto_241910 ?auto_241913 ) ) ( not ( = ?auto_241910 ?auto_241914 ) ) ( not ( = ?auto_241910 ?auto_241915 ) ) ( not ( = ?auto_241910 ?auto_241916 ) ) ( not ( = ?auto_241910 ?auto_241917 ) ) ( not ( = ?auto_241910 ?auto_241918 ) ) ( not ( = ?auto_241911 ?auto_241912 ) ) ( not ( = ?auto_241911 ?auto_241913 ) ) ( not ( = ?auto_241911 ?auto_241914 ) ) ( not ( = ?auto_241911 ?auto_241915 ) ) ( not ( = ?auto_241911 ?auto_241916 ) ) ( not ( = ?auto_241911 ?auto_241917 ) ) ( not ( = ?auto_241911 ?auto_241918 ) ) ( not ( = ?auto_241912 ?auto_241913 ) ) ( not ( = ?auto_241912 ?auto_241914 ) ) ( not ( = ?auto_241912 ?auto_241915 ) ) ( not ( = ?auto_241912 ?auto_241916 ) ) ( not ( = ?auto_241912 ?auto_241917 ) ) ( not ( = ?auto_241912 ?auto_241918 ) ) ( not ( = ?auto_241913 ?auto_241914 ) ) ( not ( = ?auto_241913 ?auto_241915 ) ) ( not ( = ?auto_241913 ?auto_241916 ) ) ( not ( = ?auto_241913 ?auto_241917 ) ) ( not ( = ?auto_241913 ?auto_241918 ) ) ( not ( = ?auto_241914 ?auto_241915 ) ) ( not ( = ?auto_241914 ?auto_241916 ) ) ( not ( = ?auto_241914 ?auto_241917 ) ) ( not ( = ?auto_241914 ?auto_241918 ) ) ( not ( = ?auto_241915 ?auto_241916 ) ) ( not ( = ?auto_241915 ?auto_241917 ) ) ( not ( = ?auto_241915 ?auto_241918 ) ) ( not ( = ?auto_241916 ?auto_241917 ) ) ( not ( = ?auto_241916 ?auto_241918 ) ) ( not ( = ?auto_241917 ?auto_241918 ) ) ( CLEAR ?auto_241915 ) ( ON ?auto_241916 ?auto_241917 ) ( CLEAR ?auto_241916 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_241907 ?auto_241908 ?auto_241909 ?auto_241910 ?auto_241911 ?auto_241912 ?auto_241913 ?auto_241914 ?auto_241915 ?auto_241916 )
      ( MAKE-11PILE ?auto_241907 ?auto_241908 ?auto_241909 ?auto_241910 ?auto_241911 ?auto_241912 ?auto_241913 ?auto_241914 ?auto_241915 ?auto_241916 ?auto_241917 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_241930 - BLOCK
      ?auto_241931 - BLOCK
      ?auto_241932 - BLOCK
      ?auto_241933 - BLOCK
      ?auto_241934 - BLOCK
      ?auto_241935 - BLOCK
      ?auto_241936 - BLOCK
      ?auto_241937 - BLOCK
      ?auto_241938 - BLOCK
      ?auto_241939 - BLOCK
      ?auto_241940 - BLOCK
    )
    :vars
    (
      ?auto_241941 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_241940 ?auto_241941 ) ( ON-TABLE ?auto_241930 ) ( ON ?auto_241931 ?auto_241930 ) ( ON ?auto_241932 ?auto_241931 ) ( ON ?auto_241933 ?auto_241932 ) ( ON ?auto_241934 ?auto_241933 ) ( ON ?auto_241935 ?auto_241934 ) ( ON ?auto_241936 ?auto_241935 ) ( ON ?auto_241937 ?auto_241936 ) ( ON ?auto_241938 ?auto_241937 ) ( not ( = ?auto_241930 ?auto_241931 ) ) ( not ( = ?auto_241930 ?auto_241932 ) ) ( not ( = ?auto_241930 ?auto_241933 ) ) ( not ( = ?auto_241930 ?auto_241934 ) ) ( not ( = ?auto_241930 ?auto_241935 ) ) ( not ( = ?auto_241930 ?auto_241936 ) ) ( not ( = ?auto_241930 ?auto_241937 ) ) ( not ( = ?auto_241930 ?auto_241938 ) ) ( not ( = ?auto_241930 ?auto_241939 ) ) ( not ( = ?auto_241930 ?auto_241940 ) ) ( not ( = ?auto_241930 ?auto_241941 ) ) ( not ( = ?auto_241931 ?auto_241932 ) ) ( not ( = ?auto_241931 ?auto_241933 ) ) ( not ( = ?auto_241931 ?auto_241934 ) ) ( not ( = ?auto_241931 ?auto_241935 ) ) ( not ( = ?auto_241931 ?auto_241936 ) ) ( not ( = ?auto_241931 ?auto_241937 ) ) ( not ( = ?auto_241931 ?auto_241938 ) ) ( not ( = ?auto_241931 ?auto_241939 ) ) ( not ( = ?auto_241931 ?auto_241940 ) ) ( not ( = ?auto_241931 ?auto_241941 ) ) ( not ( = ?auto_241932 ?auto_241933 ) ) ( not ( = ?auto_241932 ?auto_241934 ) ) ( not ( = ?auto_241932 ?auto_241935 ) ) ( not ( = ?auto_241932 ?auto_241936 ) ) ( not ( = ?auto_241932 ?auto_241937 ) ) ( not ( = ?auto_241932 ?auto_241938 ) ) ( not ( = ?auto_241932 ?auto_241939 ) ) ( not ( = ?auto_241932 ?auto_241940 ) ) ( not ( = ?auto_241932 ?auto_241941 ) ) ( not ( = ?auto_241933 ?auto_241934 ) ) ( not ( = ?auto_241933 ?auto_241935 ) ) ( not ( = ?auto_241933 ?auto_241936 ) ) ( not ( = ?auto_241933 ?auto_241937 ) ) ( not ( = ?auto_241933 ?auto_241938 ) ) ( not ( = ?auto_241933 ?auto_241939 ) ) ( not ( = ?auto_241933 ?auto_241940 ) ) ( not ( = ?auto_241933 ?auto_241941 ) ) ( not ( = ?auto_241934 ?auto_241935 ) ) ( not ( = ?auto_241934 ?auto_241936 ) ) ( not ( = ?auto_241934 ?auto_241937 ) ) ( not ( = ?auto_241934 ?auto_241938 ) ) ( not ( = ?auto_241934 ?auto_241939 ) ) ( not ( = ?auto_241934 ?auto_241940 ) ) ( not ( = ?auto_241934 ?auto_241941 ) ) ( not ( = ?auto_241935 ?auto_241936 ) ) ( not ( = ?auto_241935 ?auto_241937 ) ) ( not ( = ?auto_241935 ?auto_241938 ) ) ( not ( = ?auto_241935 ?auto_241939 ) ) ( not ( = ?auto_241935 ?auto_241940 ) ) ( not ( = ?auto_241935 ?auto_241941 ) ) ( not ( = ?auto_241936 ?auto_241937 ) ) ( not ( = ?auto_241936 ?auto_241938 ) ) ( not ( = ?auto_241936 ?auto_241939 ) ) ( not ( = ?auto_241936 ?auto_241940 ) ) ( not ( = ?auto_241936 ?auto_241941 ) ) ( not ( = ?auto_241937 ?auto_241938 ) ) ( not ( = ?auto_241937 ?auto_241939 ) ) ( not ( = ?auto_241937 ?auto_241940 ) ) ( not ( = ?auto_241937 ?auto_241941 ) ) ( not ( = ?auto_241938 ?auto_241939 ) ) ( not ( = ?auto_241938 ?auto_241940 ) ) ( not ( = ?auto_241938 ?auto_241941 ) ) ( not ( = ?auto_241939 ?auto_241940 ) ) ( not ( = ?auto_241939 ?auto_241941 ) ) ( not ( = ?auto_241940 ?auto_241941 ) ) ( CLEAR ?auto_241938 ) ( ON ?auto_241939 ?auto_241940 ) ( CLEAR ?auto_241939 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_241930 ?auto_241931 ?auto_241932 ?auto_241933 ?auto_241934 ?auto_241935 ?auto_241936 ?auto_241937 ?auto_241938 ?auto_241939 )
      ( MAKE-11PILE ?auto_241930 ?auto_241931 ?auto_241932 ?auto_241933 ?auto_241934 ?auto_241935 ?auto_241936 ?auto_241937 ?auto_241938 ?auto_241939 ?auto_241940 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_241953 - BLOCK
      ?auto_241954 - BLOCK
      ?auto_241955 - BLOCK
      ?auto_241956 - BLOCK
      ?auto_241957 - BLOCK
      ?auto_241958 - BLOCK
      ?auto_241959 - BLOCK
      ?auto_241960 - BLOCK
      ?auto_241961 - BLOCK
      ?auto_241962 - BLOCK
      ?auto_241963 - BLOCK
    )
    :vars
    (
      ?auto_241964 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_241963 ?auto_241964 ) ( ON-TABLE ?auto_241953 ) ( ON ?auto_241954 ?auto_241953 ) ( ON ?auto_241955 ?auto_241954 ) ( ON ?auto_241956 ?auto_241955 ) ( ON ?auto_241957 ?auto_241956 ) ( ON ?auto_241958 ?auto_241957 ) ( ON ?auto_241959 ?auto_241958 ) ( ON ?auto_241960 ?auto_241959 ) ( not ( = ?auto_241953 ?auto_241954 ) ) ( not ( = ?auto_241953 ?auto_241955 ) ) ( not ( = ?auto_241953 ?auto_241956 ) ) ( not ( = ?auto_241953 ?auto_241957 ) ) ( not ( = ?auto_241953 ?auto_241958 ) ) ( not ( = ?auto_241953 ?auto_241959 ) ) ( not ( = ?auto_241953 ?auto_241960 ) ) ( not ( = ?auto_241953 ?auto_241961 ) ) ( not ( = ?auto_241953 ?auto_241962 ) ) ( not ( = ?auto_241953 ?auto_241963 ) ) ( not ( = ?auto_241953 ?auto_241964 ) ) ( not ( = ?auto_241954 ?auto_241955 ) ) ( not ( = ?auto_241954 ?auto_241956 ) ) ( not ( = ?auto_241954 ?auto_241957 ) ) ( not ( = ?auto_241954 ?auto_241958 ) ) ( not ( = ?auto_241954 ?auto_241959 ) ) ( not ( = ?auto_241954 ?auto_241960 ) ) ( not ( = ?auto_241954 ?auto_241961 ) ) ( not ( = ?auto_241954 ?auto_241962 ) ) ( not ( = ?auto_241954 ?auto_241963 ) ) ( not ( = ?auto_241954 ?auto_241964 ) ) ( not ( = ?auto_241955 ?auto_241956 ) ) ( not ( = ?auto_241955 ?auto_241957 ) ) ( not ( = ?auto_241955 ?auto_241958 ) ) ( not ( = ?auto_241955 ?auto_241959 ) ) ( not ( = ?auto_241955 ?auto_241960 ) ) ( not ( = ?auto_241955 ?auto_241961 ) ) ( not ( = ?auto_241955 ?auto_241962 ) ) ( not ( = ?auto_241955 ?auto_241963 ) ) ( not ( = ?auto_241955 ?auto_241964 ) ) ( not ( = ?auto_241956 ?auto_241957 ) ) ( not ( = ?auto_241956 ?auto_241958 ) ) ( not ( = ?auto_241956 ?auto_241959 ) ) ( not ( = ?auto_241956 ?auto_241960 ) ) ( not ( = ?auto_241956 ?auto_241961 ) ) ( not ( = ?auto_241956 ?auto_241962 ) ) ( not ( = ?auto_241956 ?auto_241963 ) ) ( not ( = ?auto_241956 ?auto_241964 ) ) ( not ( = ?auto_241957 ?auto_241958 ) ) ( not ( = ?auto_241957 ?auto_241959 ) ) ( not ( = ?auto_241957 ?auto_241960 ) ) ( not ( = ?auto_241957 ?auto_241961 ) ) ( not ( = ?auto_241957 ?auto_241962 ) ) ( not ( = ?auto_241957 ?auto_241963 ) ) ( not ( = ?auto_241957 ?auto_241964 ) ) ( not ( = ?auto_241958 ?auto_241959 ) ) ( not ( = ?auto_241958 ?auto_241960 ) ) ( not ( = ?auto_241958 ?auto_241961 ) ) ( not ( = ?auto_241958 ?auto_241962 ) ) ( not ( = ?auto_241958 ?auto_241963 ) ) ( not ( = ?auto_241958 ?auto_241964 ) ) ( not ( = ?auto_241959 ?auto_241960 ) ) ( not ( = ?auto_241959 ?auto_241961 ) ) ( not ( = ?auto_241959 ?auto_241962 ) ) ( not ( = ?auto_241959 ?auto_241963 ) ) ( not ( = ?auto_241959 ?auto_241964 ) ) ( not ( = ?auto_241960 ?auto_241961 ) ) ( not ( = ?auto_241960 ?auto_241962 ) ) ( not ( = ?auto_241960 ?auto_241963 ) ) ( not ( = ?auto_241960 ?auto_241964 ) ) ( not ( = ?auto_241961 ?auto_241962 ) ) ( not ( = ?auto_241961 ?auto_241963 ) ) ( not ( = ?auto_241961 ?auto_241964 ) ) ( not ( = ?auto_241962 ?auto_241963 ) ) ( not ( = ?auto_241962 ?auto_241964 ) ) ( not ( = ?auto_241963 ?auto_241964 ) ) ( ON ?auto_241962 ?auto_241963 ) ( CLEAR ?auto_241960 ) ( ON ?auto_241961 ?auto_241962 ) ( CLEAR ?auto_241961 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_241953 ?auto_241954 ?auto_241955 ?auto_241956 ?auto_241957 ?auto_241958 ?auto_241959 ?auto_241960 ?auto_241961 )
      ( MAKE-11PILE ?auto_241953 ?auto_241954 ?auto_241955 ?auto_241956 ?auto_241957 ?auto_241958 ?auto_241959 ?auto_241960 ?auto_241961 ?auto_241962 ?auto_241963 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_241976 - BLOCK
      ?auto_241977 - BLOCK
      ?auto_241978 - BLOCK
      ?auto_241979 - BLOCK
      ?auto_241980 - BLOCK
      ?auto_241981 - BLOCK
      ?auto_241982 - BLOCK
      ?auto_241983 - BLOCK
      ?auto_241984 - BLOCK
      ?auto_241985 - BLOCK
      ?auto_241986 - BLOCK
    )
    :vars
    (
      ?auto_241987 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_241986 ?auto_241987 ) ( ON-TABLE ?auto_241976 ) ( ON ?auto_241977 ?auto_241976 ) ( ON ?auto_241978 ?auto_241977 ) ( ON ?auto_241979 ?auto_241978 ) ( ON ?auto_241980 ?auto_241979 ) ( ON ?auto_241981 ?auto_241980 ) ( ON ?auto_241982 ?auto_241981 ) ( ON ?auto_241983 ?auto_241982 ) ( not ( = ?auto_241976 ?auto_241977 ) ) ( not ( = ?auto_241976 ?auto_241978 ) ) ( not ( = ?auto_241976 ?auto_241979 ) ) ( not ( = ?auto_241976 ?auto_241980 ) ) ( not ( = ?auto_241976 ?auto_241981 ) ) ( not ( = ?auto_241976 ?auto_241982 ) ) ( not ( = ?auto_241976 ?auto_241983 ) ) ( not ( = ?auto_241976 ?auto_241984 ) ) ( not ( = ?auto_241976 ?auto_241985 ) ) ( not ( = ?auto_241976 ?auto_241986 ) ) ( not ( = ?auto_241976 ?auto_241987 ) ) ( not ( = ?auto_241977 ?auto_241978 ) ) ( not ( = ?auto_241977 ?auto_241979 ) ) ( not ( = ?auto_241977 ?auto_241980 ) ) ( not ( = ?auto_241977 ?auto_241981 ) ) ( not ( = ?auto_241977 ?auto_241982 ) ) ( not ( = ?auto_241977 ?auto_241983 ) ) ( not ( = ?auto_241977 ?auto_241984 ) ) ( not ( = ?auto_241977 ?auto_241985 ) ) ( not ( = ?auto_241977 ?auto_241986 ) ) ( not ( = ?auto_241977 ?auto_241987 ) ) ( not ( = ?auto_241978 ?auto_241979 ) ) ( not ( = ?auto_241978 ?auto_241980 ) ) ( not ( = ?auto_241978 ?auto_241981 ) ) ( not ( = ?auto_241978 ?auto_241982 ) ) ( not ( = ?auto_241978 ?auto_241983 ) ) ( not ( = ?auto_241978 ?auto_241984 ) ) ( not ( = ?auto_241978 ?auto_241985 ) ) ( not ( = ?auto_241978 ?auto_241986 ) ) ( not ( = ?auto_241978 ?auto_241987 ) ) ( not ( = ?auto_241979 ?auto_241980 ) ) ( not ( = ?auto_241979 ?auto_241981 ) ) ( not ( = ?auto_241979 ?auto_241982 ) ) ( not ( = ?auto_241979 ?auto_241983 ) ) ( not ( = ?auto_241979 ?auto_241984 ) ) ( not ( = ?auto_241979 ?auto_241985 ) ) ( not ( = ?auto_241979 ?auto_241986 ) ) ( not ( = ?auto_241979 ?auto_241987 ) ) ( not ( = ?auto_241980 ?auto_241981 ) ) ( not ( = ?auto_241980 ?auto_241982 ) ) ( not ( = ?auto_241980 ?auto_241983 ) ) ( not ( = ?auto_241980 ?auto_241984 ) ) ( not ( = ?auto_241980 ?auto_241985 ) ) ( not ( = ?auto_241980 ?auto_241986 ) ) ( not ( = ?auto_241980 ?auto_241987 ) ) ( not ( = ?auto_241981 ?auto_241982 ) ) ( not ( = ?auto_241981 ?auto_241983 ) ) ( not ( = ?auto_241981 ?auto_241984 ) ) ( not ( = ?auto_241981 ?auto_241985 ) ) ( not ( = ?auto_241981 ?auto_241986 ) ) ( not ( = ?auto_241981 ?auto_241987 ) ) ( not ( = ?auto_241982 ?auto_241983 ) ) ( not ( = ?auto_241982 ?auto_241984 ) ) ( not ( = ?auto_241982 ?auto_241985 ) ) ( not ( = ?auto_241982 ?auto_241986 ) ) ( not ( = ?auto_241982 ?auto_241987 ) ) ( not ( = ?auto_241983 ?auto_241984 ) ) ( not ( = ?auto_241983 ?auto_241985 ) ) ( not ( = ?auto_241983 ?auto_241986 ) ) ( not ( = ?auto_241983 ?auto_241987 ) ) ( not ( = ?auto_241984 ?auto_241985 ) ) ( not ( = ?auto_241984 ?auto_241986 ) ) ( not ( = ?auto_241984 ?auto_241987 ) ) ( not ( = ?auto_241985 ?auto_241986 ) ) ( not ( = ?auto_241985 ?auto_241987 ) ) ( not ( = ?auto_241986 ?auto_241987 ) ) ( ON ?auto_241985 ?auto_241986 ) ( CLEAR ?auto_241983 ) ( ON ?auto_241984 ?auto_241985 ) ( CLEAR ?auto_241984 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_241976 ?auto_241977 ?auto_241978 ?auto_241979 ?auto_241980 ?auto_241981 ?auto_241982 ?auto_241983 ?auto_241984 )
      ( MAKE-11PILE ?auto_241976 ?auto_241977 ?auto_241978 ?auto_241979 ?auto_241980 ?auto_241981 ?auto_241982 ?auto_241983 ?auto_241984 ?auto_241985 ?auto_241986 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_241999 - BLOCK
      ?auto_242000 - BLOCK
      ?auto_242001 - BLOCK
      ?auto_242002 - BLOCK
      ?auto_242003 - BLOCK
      ?auto_242004 - BLOCK
      ?auto_242005 - BLOCK
      ?auto_242006 - BLOCK
      ?auto_242007 - BLOCK
      ?auto_242008 - BLOCK
      ?auto_242009 - BLOCK
    )
    :vars
    (
      ?auto_242010 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_242009 ?auto_242010 ) ( ON-TABLE ?auto_241999 ) ( ON ?auto_242000 ?auto_241999 ) ( ON ?auto_242001 ?auto_242000 ) ( ON ?auto_242002 ?auto_242001 ) ( ON ?auto_242003 ?auto_242002 ) ( ON ?auto_242004 ?auto_242003 ) ( ON ?auto_242005 ?auto_242004 ) ( not ( = ?auto_241999 ?auto_242000 ) ) ( not ( = ?auto_241999 ?auto_242001 ) ) ( not ( = ?auto_241999 ?auto_242002 ) ) ( not ( = ?auto_241999 ?auto_242003 ) ) ( not ( = ?auto_241999 ?auto_242004 ) ) ( not ( = ?auto_241999 ?auto_242005 ) ) ( not ( = ?auto_241999 ?auto_242006 ) ) ( not ( = ?auto_241999 ?auto_242007 ) ) ( not ( = ?auto_241999 ?auto_242008 ) ) ( not ( = ?auto_241999 ?auto_242009 ) ) ( not ( = ?auto_241999 ?auto_242010 ) ) ( not ( = ?auto_242000 ?auto_242001 ) ) ( not ( = ?auto_242000 ?auto_242002 ) ) ( not ( = ?auto_242000 ?auto_242003 ) ) ( not ( = ?auto_242000 ?auto_242004 ) ) ( not ( = ?auto_242000 ?auto_242005 ) ) ( not ( = ?auto_242000 ?auto_242006 ) ) ( not ( = ?auto_242000 ?auto_242007 ) ) ( not ( = ?auto_242000 ?auto_242008 ) ) ( not ( = ?auto_242000 ?auto_242009 ) ) ( not ( = ?auto_242000 ?auto_242010 ) ) ( not ( = ?auto_242001 ?auto_242002 ) ) ( not ( = ?auto_242001 ?auto_242003 ) ) ( not ( = ?auto_242001 ?auto_242004 ) ) ( not ( = ?auto_242001 ?auto_242005 ) ) ( not ( = ?auto_242001 ?auto_242006 ) ) ( not ( = ?auto_242001 ?auto_242007 ) ) ( not ( = ?auto_242001 ?auto_242008 ) ) ( not ( = ?auto_242001 ?auto_242009 ) ) ( not ( = ?auto_242001 ?auto_242010 ) ) ( not ( = ?auto_242002 ?auto_242003 ) ) ( not ( = ?auto_242002 ?auto_242004 ) ) ( not ( = ?auto_242002 ?auto_242005 ) ) ( not ( = ?auto_242002 ?auto_242006 ) ) ( not ( = ?auto_242002 ?auto_242007 ) ) ( not ( = ?auto_242002 ?auto_242008 ) ) ( not ( = ?auto_242002 ?auto_242009 ) ) ( not ( = ?auto_242002 ?auto_242010 ) ) ( not ( = ?auto_242003 ?auto_242004 ) ) ( not ( = ?auto_242003 ?auto_242005 ) ) ( not ( = ?auto_242003 ?auto_242006 ) ) ( not ( = ?auto_242003 ?auto_242007 ) ) ( not ( = ?auto_242003 ?auto_242008 ) ) ( not ( = ?auto_242003 ?auto_242009 ) ) ( not ( = ?auto_242003 ?auto_242010 ) ) ( not ( = ?auto_242004 ?auto_242005 ) ) ( not ( = ?auto_242004 ?auto_242006 ) ) ( not ( = ?auto_242004 ?auto_242007 ) ) ( not ( = ?auto_242004 ?auto_242008 ) ) ( not ( = ?auto_242004 ?auto_242009 ) ) ( not ( = ?auto_242004 ?auto_242010 ) ) ( not ( = ?auto_242005 ?auto_242006 ) ) ( not ( = ?auto_242005 ?auto_242007 ) ) ( not ( = ?auto_242005 ?auto_242008 ) ) ( not ( = ?auto_242005 ?auto_242009 ) ) ( not ( = ?auto_242005 ?auto_242010 ) ) ( not ( = ?auto_242006 ?auto_242007 ) ) ( not ( = ?auto_242006 ?auto_242008 ) ) ( not ( = ?auto_242006 ?auto_242009 ) ) ( not ( = ?auto_242006 ?auto_242010 ) ) ( not ( = ?auto_242007 ?auto_242008 ) ) ( not ( = ?auto_242007 ?auto_242009 ) ) ( not ( = ?auto_242007 ?auto_242010 ) ) ( not ( = ?auto_242008 ?auto_242009 ) ) ( not ( = ?auto_242008 ?auto_242010 ) ) ( not ( = ?auto_242009 ?auto_242010 ) ) ( ON ?auto_242008 ?auto_242009 ) ( ON ?auto_242007 ?auto_242008 ) ( CLEAR ?auto_242005 ) ( ON ?auto_242006 ?auto_242007 ) ( CLEAR ?auto_242006 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_241999 ?auto_242000 ?auto_242001 ?auto_242002 ?auto_242003 ?auto_242004 ?auto_242005 ?auto_242006 )
      ( MAKE-11PILE ?auto_241999 ?auto_242000 ?auto_242001 ?auto_242002 ?auto_242003 ?auto_242004 ?auto_242005 ?auto_242006 ?auto_242007 ?auto_242008 ?auto_242009 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_242022 - BLOCK
      ?auto_242023 - BLOCK
      ?auto_242024 - BLOCK
      ?auto_242025 - BLOCK
      ?auto_242026 - BLOCK
      ?auto_242027 - BLOCK
      ?auto_242028 - BLOCK
      ?auto_242029 - BLOCK
      ?auto_242030 - BLOCK
      ?auto_242031 - BLOCK
      ?auto_242032 - BLOCK
    )
    :vars
    (
      ?auto_242033 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_242032 ?auto_242033 ) ( ON-TABLE ?auto_242022 ) ( ON ?auto_242023 ?auto_242022 ) ( ON ?auto_242024 ?auto_242023 ) ( ON ?auto_242025 ?auto_242024 ) ( ON ?auto_242026 ?auto_242025 ) ( ON ?auto_242027 ?auto_242026 ) ( ON ?auto_242028 ?auto_242027 ) ( not ( = ?auto_242022 ?auto_242023 ) ) ( not ( = ?auto_242022 ?auto_242024 ) ) ( not ( = ?auto_242022 ?auto_242025 ) ) ( not ( = ?auto_242022 ?auto_242026 ) ) ( not ( = ?auto_242022 ?auto_242027 ) ) ( not ( = ?auto_242022 ?auto_242028 ) ) ( not ( = ?auto_242022 ?auto_242029 ) ) ( not ( = ?auto_242022 ?auto_242030 ) ) ( not ( = ?auto_242022 ?auto_242031 ) ) ( not ( = ?auto_242022 ?auto_242032 ) ) ( not ( = ?auto_242022 ?auto_242033 ) ) ( not ( = ?auto_242023 ?auto_242024 ) ) ( not ( = ?auto_242023 ?auto_242025 ) ) ( not ( = ?auto_242023 ?auto_242026 ) ) ( not ( = ?auto_242023 ?auto_242027 ) ) ( not ( = ?auto_242023 ?auto_242028 ) ) ( not ( = ?auto_242023 ?auto_242029 ) ) ( not ( = ?auto_242023 ?auto_242030 ) ) ( not ( = ?auto_242023 ?auto_242031 ) ) ( not ( = ?auto_242023 ?auto_242032 ) ) ( not ( = ?auto_242023 ?auto_242033 ) ) ( not ( = ?auto_242024 ?auto_242025 ) ) ( not ( = ?auto_242024 ?auto_242026 ) ) ( not ( = ?auto_242024 ?auto_242027 ) ) ( not ( = ?auto_242024 ?auto_242028 ) ) ( not ( = ?auto_242024 ?auto_242029 ) ) ( not ( = ?auto_242024 ?auto_242030 ) ) ( not ( = ?auto_242024 ?auto_242031 ) ) ( not ( = ?auto_242024 ?auto_242032 ) ) ( not ( = ?auto_242024 ?auto_242033 ) ) ( not ( = ?auto_242025 ?auto_242026 ) ) ( not ( = ?auto_242025 ?auto_242027 ) ) ( not ( = ?auto_242025 ?auto_242028 ) ) ( not ( = ?auto_242025 ?auto_242029 ) ) ( not ( = ?auto_242025 ?auto_242030 ) ) ( not ( = ?auto_242025 ?auto_242031 ) ) ( not ( = ?auto_242025 ?auto_242032 ) ) ( not ( = ?auto_242025 ?auto_242033 ) ) ( not ( = ?auto_242026 ?auto_242027 ) ) ( not ( = ?auto_242026 ?auto_242028 ) ) ( not ( = ?auto_242026 ?auto_242029 ) ) ( not ( = ?auto_242026 ?auto_242030 ) ) ( not ( = ?auto_242026 ?auto_242031 ) ) ( not ( = ?auto_242026 ?auto_242032 ) ) ( not ( = ?auto_242026 ?auto_242033 ) ) ( not ( = ?auto_242027 ?auto_242028 ) ) ( not ( = ?auto_242027 ?auto_242029 ) ) ( not ( = ?auto_242027 ?auto_242030 ) ) ( not ( = ?auto_242027 ?auto_242031 ) ) ( not ( = ?auto_242027 ?auto_242032 ) ) ( not ( = ?auto_242027 ?auto_242033 ) ) ( not ( = ?auto_242028 ?auto_242029 ) ) ( not ( = ?auto_242028 ?auto_242030 ) ) ( not ( = ?auto_242028 ?auto_242031 ) ) ( not ( = ?auto_242028 ?auto_242032 ) ) ( not ( = ?auto_242028 ?auto_242033 ) ) ( not ( = ?auto_242029 ?auto_242030 ) ) ( not ( = ?auto_242029 ?auto_242031 ) ) ( not ( = ?auto_242029 ?auto_242032 ) ) ( not ( = ?auto_242029 ?auto_242033 ) ) ( not ( = ?auto_242030 ?auto_242031 ) ) ( not ( = ?auto_242030 ?auto_242032 ) ) ( not ( = ?auto_242030 ?auto_242033 ) ) ( not ( = ?auto_242031 ?auto_242032 ) ) ( not ( = ?auto_242031 ?auto_242033 ) ) ( not ( = ?auto_242032 ?auto_242033 ) ) ( ON ?auto_242031 ?auto_242032 ) ( ON ?auto_242030 ?auto_242031 ) ( CLEAR ?auto_242028 ) ( ON ?auto_242029 ?auto_242030 ) ( CLEAR ?auto_242029 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_242022 ?auto_242023 ?auto_242024 ?auto_242025 ?auto_242026 ?auto_242027 ?auto_242028 ?auto_242029 )
      ( MAKE-11PILE ?auto_242022 ?auto_242023 ?auto_242024 ?auto_242025 ?auto_242026 ?auto_242027 ?auto_242028 ?auto_242029 ?auto_242030 ?auto_242031 ?auto_242032 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_242045 - BLOCK
      ?auto_242046 - BLOCK
      ?auto_242047 - BLOCK
      ?auto_242048 - BLOCK
      ?auto_242049 - BLOCK
      ?auto_242050 - BLOCK
      ?auto_242051 - BLOCK
      ?auto_242052 - BLOCK
      ?auto_242053 - BLOCK
      ?auto_242054 - BLOCK
      ?auto_242055 - BLOCK
    )
    :vars
    (
      ?auto_242056 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_242055 ?auto_242056 ) ( ON-TABLE ?auto_242045 ) ( ON ?auto_242046 ?auto_242045 ) ( ON ?auto_242047 ?auto_242046 ) ( ON ?auto_242048 ?auto_242047 ) ( ON ?auto_242049 ?auto_242048 ) ( ON ?auto_242050 ?auto_242049 ) ( not ( = ?auto_242045 ?auto_242046 ) ) ( not ( = ?auto_242045 ?auto_242047 ) ) ( not ( = ?auto_242045 ?auto_242048 ) ) ( not ( = ?auto_242045 ?auto_242049 ) ) ( not ( = ?auto_242045 ?auto_242050 ) ) ( not ( = ?auto_242045 ?auto_242051 ) ) ( not ( = ?auto_242045 ?auto_242052 ) ) ( not ( = ?auto_242045 ?auto_242053 ) ) ( not ( = ?auto_242045 ?auto_242054 ) ) ( not ( = ?auto_242045 ?auto_242055 ) ) ( not ( = ?auto_242045 ?auto_242056 ) ) ( not ( = ?auto_242046 ?auto_242047 ) ) ( not ( = ?auto_242046 ?auto_242048 ) ) ( not ( = ?auto_242046 ?auto_242049 ) ) ( not ( = ?auto_242046 ?auto_242050 ) ) ( not ( = ?auto_242046 ?auto_242051 ) ) ( not ( = ?auto_242046 ?auto_242052 ) ) ( not ( = ?auto_242046 ?auto_242053 ) ) ( not ( = ?auto_242046 ?auto_242054 ) ) ( not ( = ?auto_242046 ?auto_242055 ) ) ( not ( = ?auto_242046 ?auto_242056 ) ) ( not ( = ?auto_242047 ?auto_242048 ) ) ( not ( = ?auto_242047 ?auto_242049 ) ) ( not ( = ?auto_242047 ?auto_242050 ) ) ( not ( = ?auto_242047 ?auto_242051 ) ) ( not ( = ?auto_242047 ?auto_242052 ) ) ( not ( = ?auto_242047 ?auto_242053 ) ) ( not ( = ?auto_242047 ?auto_242054 ) ) ( not ( = ?auto_242047 ?auto_242055 ) ) ( not ( = ?auto_242047 ?auto_242056 ) ) ( not ( = ?auto_242048 ?auto_242049 ) ) ( not ( = ?auto_242048 ?auto_242050 ) ) ( not ( = ?auto_242048 ?auto_242051 ) ) ( not ( = ?auto_242048 ?auto_242052 ) ) ( not ( = ?auto_242048 ?auto_242053 ) ) ( not ( = ?auto_242048 ?auto_242054 ) ) ( not ( = ?auto_242048 ?auto_242055 ) ) ( not ( = ?auto_242048 ?auto_242056 ) ) ( not ( = ?auto_242049 ?auto_242050 ) ) ( not ( = ?auto_242049 ?auto_242051 ) ) ( not ( = ?auto_242049 ?auto_242052 ) ) ( not ( = ?auto_242049 ?auto_242053 ) ) ( not ( = ?auto_242049 ?auto_242054 ) ) ( not ( = ?auto_242049 ?auto_242055 ) ) ( not ( = ?auto_242049 ?auto_242056 ) ) ( not ( = ?auto_242050 ?auto_242051 ) ) ( not ( = ?auto_242050 ?auto_242052 ) ) ( not ( = ?auto_242050 ?auto_242053 ) ) ( not ( = ?auto_242050 ?auto_242054 ) ) ( not ( = ?auto_242050 ?auto_242055 ) ) ( not ( = ?auto_242050 ?auto_242056 ) ) ( not ( = ?auto_242051 ?auto_242052 ) ) ( not ( = ?auto_242051 ?auto_242053 ) ) ( not ( = ?auto_242051 ?auto_242054 ) ) ( not ( = ?auto_242051 ?auto_242055 ) ) ( not ( = ?auto_242051 ?auto_242056 ) ) ( not ( = ?auto_242052 ?auto_242053 ) ) ( not ( = ?auto_242052 ?auto_242054 ) ) ( not ( = ?auto_242052 ?auto_242055 ) ) ( not ( = ?auto_242052 ?auto_242056 ) ) ( not ( = ?auto_242053 ?auto_242054 ) ) ( not ( = ?auto_242053 ?auto_242055 ) ) ( not ( = ?auto_242053 ?auto_242056 ) ) ( not ( = ?auto_242054 ?auto_242055 ) ) ( not ( = ?auto_242054 ?auto_242056 ) ) ( not ( = ?auto_242055 ?auto_242056 ) ) ( ON ?auto_242054 ?auto_242055 ) ( ON ?auto_242053 ?auto_242054 ) ( ON ?auto_242052 ?auto_242053 ) ( CLEAR ?auto_242050 ) ( ON ?auto_242051 ?auto_242052 ) ( CLEAR ?auto_242051 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_242045 ?auto_242046 ?auto_242047 ?auto_242048 ?auto_242049 ?auto_242050 ?auto_242051 )
      ( MAKE-11PILE ?auto_242045 ?auto_242046 ?auto_242047 ?auto_242048 ?auto_242049 ?auto_242050 ?auto_242051 ?auto_242052 ?auto_242053 ?auto_242054 ?auto_242055 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_242068 - BLOCK
      ?auto_242069 - BLOCK
      ?auto_242070 - BLOCK
      ?auto_242071 - BLOCK
      ?auto_242072 - BLOCK
      ?auto_242073 - BLOCK
      ?auto_242074 - BLOCK
      ?auto_242075 - BLOCK
      ?auto_242076 - BLOCK
      ?auto_242077 - BLOCK
      ?auto_242078 - BLOCK
    )
    :vars
    (
      ?auto_242079 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_242078 ?auto_242079 ) ( ON-TABLE ?auto_242068 ) ( ON ?auto_242069 ?auto_242068 ) ( ON ?auto_242070 ?auto_242069 ) ( ON ?auto_242071 ?auto_242070 ) ( ON ?auto_242072 ?auto_242071 ) ( ON ?auto_242073 ?auto_242072 ) ( not ( = ?auto_242068 ?auto_242069 ) ) ( not ( = ?auto_242068 ?auto_242070 ) ) ( not ( = ?auto_242068 ?auto_242071 ) ) ( not ( = ?auto_242068 ?auto_242072 ) ) ( not ( = ?auto_242068 ?auto_242073 ) ) ( not ( = ?auto_242068 ?auto_242074 ) ) ( not ( = ?auto_242068 ?auto_242075 ) ) ( not ( = ?auto_242068 ?auto_242076 ) ) ( not ( = ?auto_242068 ?auto_242077 ) ) ( not ( = ?auto_242068 ?auto_242078 ) ) ( not ( = ?auto_242068 ?auto_242079 ) ) ( not ( = ?auto_242069 ?auto_242070 ) ) ( not ( = ?auto_242069 ?auto_242071 ) ) ( not ( = ?auto_242069 ?auto_242072 ) ) ( not ( = ?auto_242069 ?auto_242073 ) ) ( not ( = ?auto_242069 ?auto_242074 ) ) ( not ( = ?auto_242069 ?auto_242075 ) ) ( not ( = ?auto_242069 ?auto_242076 ) ) ( not ( = ?auto_242069 ?auto_242077 ) ) ( not ( = ?auto_242069 ?auto_242078 ) ) ( not ( = ?auto_242069 ?auto_242079 ) ) ( not ( = ?auto_242070 ?auto_242071 ) ) ( not ( = ?auto_242070 ?auto_242072 ) ) ( not ( = ?auto_242070 ?auto_242073 ) ) ( not ( = ?auto_242070 ?auto_242074 ) ) ( not ( = ?auto_242070 ?auto_242075 ) ) ( not ( = ?auto_242070 ?auto_242076 ) ) ( not ( = ?auto_242070 ?auto_242077 ) ) ( not ( = ?auto_242070 ?auto_242078 ) ) ( not ( = ?auto_242070 ?auto_242079 ) ) ( not ( = ?auto_242071 ?auto_242072 ) ) ( not ( = ?auto_242071 ?auto_242073 ) ) ( not ( = ?auto_242071 ?auto_242074 ) ) ( not ( = ?auto_242071 ?auto_242075 ) ) ( not ( = ?auto_242071 ?auto_242076 ) ) ( not ( = ?auto_242071 ?auto_242077 ) ) ( not ( = ?auto_242071 ?auto_242078 ) ) ( not ( = ?auto_242071 ?auto_242079 ) ) ( not ( = ?auto_242072 ?auto_242073 ) ) ( not ( = ?auto_242072 ?auto_242074 ) ) ( not ( = ?auto_242072 ?auto_242075 ) ) ( not ( = ?auto_242072 ?auto_242076 ) ) ( not ( = ?auto_242072 ?auto_242077 ) ) ( not ( = ?auto_242072 ?auto_242078 ) ) ( not ( = ?auto_242072 ?auto_242079 ) ) ( not ( = ?auto_242073 ?auto_242074 ) ) ( not ( = ?auto_242073 ?auto_242075 ) ) ( not ( = ?auto_242073 ?auto_242076 ) ) ( not ( = ?auto_242073 ?auto_242077 ) ) ( not ( = ?auto_242073 ?auto_242078 ) ) ( not ( = ?auto_242073 ?auto_242079 ) ) ( not ( = ?auto_242074 ?auto_242075 ) ) ( not ( = ?auto_242074 ?auto_242076 ) ) ( not ( = ?auto_242074 ?auto_242077 ) ) ( not ( = ?auto_242074 ?auto_242078 ) ) ( not ( = ?auto_242074 ?auto_242079 ) ) ( not ( = ?auto_242075 ?auto_242076 ) ) ( not ( = ?auto_242075 ?auto_242077 ) ) ( not ( = ?auto_242075 ?auto_242078 ) ) ( not ( = ?auto_242075 ?auto_242079 ) ) ( not ( = ?auto_242076 ?auto_242077 ) ) ( not ( = ?auto_242076 ?auto_242078 ) ) ( not ( = ?auto_242076 ?auto_242079 ) ) ( not ( = ?auto_242077 ?auto_242078 ) ) ( not ( = ?auto_242077 ?auto_242079 ) ) ( not ( = ?auto_242078 ?auto_242079 ) ) ( ON ?auto_242077 ?auto_242078 ) ( ON ?auto_242076 ?auto_242077 ) ( ON ?auto_242075 ?auto_242076 ) ( CLEAR ?auto_242073 ) ( ON ?auto_242074 ?auto_242075 ) ( CLEAR ?auto_242074 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_242068 ?auto_242069 ?auto_242070 ?auto_242071 ?auto_242072 ?auto_242073 ?auto_242074 )
      ( MAKE-11PILE ?auto_242068 ?auto_242069 ?auto_242070 ?auto_242071 ?auto_242072 ?auto_242073 ?auto_242074 ?auto_242075 ?auto_242076 ?auto_242077 ?auto_242078 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_242091 - BLOCK
      ?auto_242092 - BLOCK
      ?auto_242093 - BLOCK
      ?auto_242094 - BLOCK
      ?auto_242095 - BLOCK
      ?auto_242096 - BLOCK
      ?auto_242097 - BLOCK
      ?auto_242098 - BLOCK
      ?auto_242099 - BLOCK
      ?auto_242100 - BLOCK
      ?auto_242101 - BLOCK
    )
    :vars
    (
      ?auto_242102 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_242101 ?auto_242102 ) ( ON-TABLE ?auto_242091 ) ( ON ?auto_242092 ?auto_242091 ) ( ON ?auto_242093 ?auto_242092 ) ( ON ?auto_242094 ?auto_242093 ) ( ON ?auto_242095 ?auto_242094 ) ( not ( = ?auto_242091 ?auto_242092 ) ) ( not ( = ?auto_242091 ?auto_242093 ) ) ( not ( = ?auto_242091 ?auto_242094 ) ) ( not ( = ?auto_242091 ?auto_242095 ) ) ( not ( = ?auto_242091 ?auto_242096 ) ) ( not ( = ?auto_242091 ?auto_242097 ) ) ( not ( = ?auto_242091 ?auto_242098 ) ) ( not ( = ?auto_242091 ?auto_242099 ) ) ( not ( = ?auto_242091 ?auto_242100 ) ) ( not ( = ?auto_242091 ?auto_242101 ) ) ( not ( = ?auto_242091 ?auto_242102 ) ) ( not ( = ?auto_242092 ?auto_242093 ) ) ( not ( = ?auto_242092 ?auto_242094 ) ) ( not ( = ?auto_242092 ?auto_242095 ) ) ( not ( = ?auto_242092 ?auto_242096 ) ) ( not ( = ?auto_242092 ?auto_242097 ) ) ( not ( = ?auto_242092 ?auto_242098 ) ) ( not ( = ?auto_242092 ?auto_242099 ) ) ( not ( = ?auto_242092 ?auto_242100 ) ) ( not ( = ?auto_242092 ?auto_242101 ) ) ( not ( = ?auto_242092 ?auto_242102 ) ) ( not ( = ?auto_242093 ?auto_242094 ) ) ( not ( = ?auto_242093 ?auto_242095 ) ) ( not ( = ?auto_242093 ?auto_242096 ) ) ( not ( = ?auto_242093 ?auto_242097 ) ) ( not ( = ?auto_242093 ?auto_242098 ) ) ( not ( = ?auto_242093 ?auto_242099 ) ) ( not ( = ?auto_242093 ?auto_242100 ) ) ( not ( = ?auto_242093 ?auto_242101 ) ) ( not ( = ?auto_242093 ?auto_242102 ) ) ( not ( = ?auto_242094 ?auto_242095 ) ) ( not ( = ?auto_242094 ?auto_242096 ) ) ( not ( = ?auto_242094 ?auto_242097 ) ) ( not ( = ?auto_242094 ?auto_242098 ) ) ( not ( = ?auto_242094 ?auto_242099 ) ) ( not ( = ?auto_242094 ?auto_242100 ) ) ( not ( = ?auto_242094 ?auto_242101 ) ) ( not ( = ?auto_242094 ?auto_242102 ) ) ( not ( = ?auto_242095 ?auto_242096 ) ) ( not ( = ?auto_242095 ?auto_242097 ) ) ( not ( = ?auto_242095 ?auto_242098 ) ) ( not ( = ?auto_242095 ?auto_242099 ) ) ( not ( = ?auto_242095 ?auto_242100 ) ) ( not ( = ?auto_242095 ?auto_242101 ) ) ( not ( = ?auto_242095 ?auto_242102 ) ) ( not ( = ?auto_242096 ?auto_242097 ) ) ( not ( = ?auto_242096 ?auto_242098 ) ) ( not ( = ?auto_242096 ?auto_242099 ) ) ( not ( = ?auto_242096 ?auto_242100 ) ) ( not ( = ?auto_242096 ?auto_242101 ) ) ( not ( = ?auto_242096 ?auto_242102 ) ) ( not ( = ?auto_242097 ?auto_242098 ) ) ( not ( = ?auto_242097 ?auto_242099 ) ) ( not ( = ?auto_242097 ?auto_242100 ) ) ( not ( = ?auto_242097 ?auto_242101 ) ) ( not ( = ?auto_242097 ?auto_242102 ) ) ( not ( = ?auto_242098 ?auto_242099 ) ) ( not ( = ?auto_242098 ?auto_242100 ) ) ( not ( = ?auto_242098 ?auto_242101 ) ) ( not ( = ?auto_242098 ?auto_242102 ) ) ( not ( = ?auto_242099 ?auto_242100 ) ) ( not ( = ?auto_242099 ?auto_242101 ) ) ( not ( = ?auto_242099 ?auto_242102 ) ) ( not ( = ?auto_242100 ?auto_242101 ) ) ( not ( = ?auto_242100 ?auto_242102 ) ) ( not ( = ?auto_242101 ?auto_242102 ) ) ( ON ?auto_242100 ?auto_242101 ) ( ON ?auto_242099 ?auto_242100 ) ( ON ?auto_242098 ?auto_242099 ) ( ON ?auto_242097 ?auto_242098 ) ( CLEAR ?auto_242095 ) ( ON ?auto_242096 ?auto_242097 ) ( CLEAR ?auto_242096 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_242091 ?auto_242092 ?auto_242093 ?auto_242094 ?auto_242095 ?auto_242096 )
      ( MAKE-11PILE ?auto_242091 ?auto_242092 ?auto_242093 ?auto_242094 ?auto_242095 ?auto_242096 ?auto_242097 ?auto_242098 ?auto_242099 ?auto_242100 ?auto_242101 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_242114 - BLOCK
      ?auto_242115 - BLOCK
      ?auto_242116 - BLOCK
      ?auto_242117 - BLOCK
      ?auto_242118 - BLOCK
      ?auto_242119 - BLOCK
      ?auto_242120 - BLOCK
      ?auto_242121 - BLOCK
      ?auto_242122 - BLOCK
      ?auto_242123 - BLOCK
      ?auto_242124 - BLOCK
    )
    :vars
    (
      ?auto_242125 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_242124 ?auto_242125 ) ( ON-TABLE ?auto_242114 ) ( ON ?auto_242115 ?auto_242114 ) ( ON ?auto_242116 ?auto_242115 ) ( ON ?auto_242117 ?auto_242116 ) ( ON ?auto_242118 ?auto_242117 ) ( not ( = ?auto_242114 ?auto_242115 ) ) ( not ( = ?auto_242114 ?auto_242116 ) ) ( not ( = ?auto_242114 ?auto_242117 ) ) ( not ( = ?auto_242114 ?auto_242118 ) ) ( not ( = ?auto_242114 ?auto_242119 ) ) ( not ( = ?auto_242114 ?auto_242120 ) ) ( not ( = ?auto_242114 ?auto_242121 ) ) ( not ( = ?auto_242114 ?auto_242122 ) ) ( not ( = ?auto_242114 ?auto_242123 ) ) ( not ( = ?auto_242114 ?auto_242124 ) ) ( not ( = ?auto_242114 ?auto_242125 ) ) ( not ( = ?auto_242115 ?auto_242116 ) ) ( not ( = ?auto_242115 ?auto_242117 ) ) ( not ( = ?auto_242115 ?auto_242118 ) ) ( not ( = ?auto_242115 ?auto_242119 ) ) ( not ( = ?auto_242115 ?auto_242120 ) ) ( not ( = ?auto_242115 ?auto_242121 ) ) ( not ( = ?auto_242115 ?auto_242122 ) ) ( not ( = ?auto_242115 ?auto_242123 ) ) ( not ( = ?auto_242115 ?auto_242124 ) ) ( not ( = ?auto_242115 ?auto_242125 ) ) ( not ( = ?auto_242116 ?auto_242117 ) ) ( not ( = ?auto_242116 ?auto_242118 ) ) ( not ( = ?auto_242116 ?auto_242119 ) ) ( not ( = ?auto_242116 ?auto_242120 ) ) ( not ( = ?auto_242116 ?auto_242121 ) ) ( not ( = ?auto_242116 ?auto_242122 ) ) ( not ( = ?auto_242116 ?auto_242123 ) ) ( not ( = ?auto_242116 ?auto_242124 ) ) ( not ( = ?auto_242116 ?auto_242125 ) ) ( not ( = ?auto_242117 ?auto_242118 ) ) ( not ( = ?auto_242117 ?auto_242119 ) ) ( not ( = ?auto_242117 ?auto_242120 ) ) ( not ( = ?auto_242117 ?auto_242121 ) ) ( not ( = ?auto_242117 ?auto_242122 ) ) ( not ( = ?auto_242117 ?auto_242123 ) ) ( not ( = ?auto_242117 ?auto_242124 ) ) ( not ( = ?auto_242117 ?auto_242125 ) ) ( not ( = ?auto_242118 ?auto_242119 ) ) ( not ( = ?auto_242118 ?auto_242120 ) ) ( not ( = ?auto_242118 ?auto_242121 ) ) ( not ( = ?auto_242118 ?auto_242122 ) ) ( not ( = ?auto_242118 ?auto_242123 ) ) ( not ( = ?auto_242118 ?auto_242124 ) ) ( not ( = ?auto_242118 ?auto_242125 ) ) ( not ( = ?auto_242119 ?auto_242120 ) ) ( not ( = ?auto_242119 ?auto_242121 ) ) ( not ( = ?auto_242119 ?auto_242122 ) ) ( not ( = ?auto_242119 ?auto_242123 ) ) ( not ( = ?auto_242119 ?auto_242124 ) ) ( not ( = ?auto_242119 ?auto_242125 ) ) ( not ( = ?auto_242120 ?auto_242121 ) ) ( not ( = ?auto_242120 ?auto_242122 ) ) ( not ( = ?auto_242120 ?auto_242123 ) ) ( not ( = ?auto_242120 ?auto_242124 ) ) ( not ( = ?auto_242120 ?auto_242125 ) ) ( not ( = ?auto_242121 ?auto_242122 ) ) ( not ( = ?auto_242121 ?auto_242123 ) ) ( not ( = ?auto_242121 ?auto_242124 ) ) ( not ( = ?auto_242121 ?auto_242125 ) ) ( not ( = ?auto_242122 ?auto_242123 ) ) ( not ( = ?auto_242122 ?auto_242124 ) ) ( not ( = ?auto_242122 ?auto_242125 ) ) ( not ( = ?auto_242123 ?auto_242124 ) ) ( not ( = ?auto_242123 ?auto_242125 ) ) ( not ( = ?auto_242124 ?auto_242125 ) ) ( ON ?auto_242123 ?auto_242124 ) ( ON ?auto_242122 ?auto_242123 ) ( ON ?auto_242121 ?auto_242122 ) ( ON ?auto_242120 ?auto_242121 ) ( CLEAR ?auto_242118 ) ( ON ?auto_242119 ?auto_242120 ) ( CLEAR ?auto_242119 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_242114 ?auto_242115 ?auto_242116 ?auto_242117 ?auto_242118 ?auto_242119 )
      ( MAKE-11PILE ?auto_242114 ?auto_242115 ?auto_242116 ?auto_242117 ?auto_242118 ?auto_242119 ?auto_242120 ?auto_242121 ?auto_242122 ?auto_242123 ?auto_242124 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_242137 - BLOCK
      ?auto_242138 - BLOCK
      ?auto_242139 - BLOCK
      ?auto_242140 - BLOCK
      ?auto_242141 - BLOCK
      ?auto_242142 - BLOCK
      ?auto_242143 - BLOCK
      ?auto_242144 - BLOCK
      ?auto_242145 - BLOCK
      ?auto_242146 - BLOCK
      ?auto_242147 - BLOCK
    )
    :vars
    (
      ?auto_242148 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_242147 ?auto_242148 ) ( ON-TABLE ?auto_242137 ) ( ON ?auto_242138 ?auto_242137 ) ( ON ?auto_242139 ?auto_242138 ) ( ON ?auto_242140 ?auto_242139 ) ( not ( = ?auto_242137 ?auto_242138 ) ) ( not ( = ?auto_242137 ?auto_242139 ) ) ( not ( = ?auto_242137 ?auto_242140 ) ) ( not ( = ?auto_242137 ?auto_242141 ) ) ( not ( = ?auto_242137 ?auto_242142 ) ) ( not ( = ?auto_242137 ?auto_242143 ) ) ( not ( = ?auto_242137 ?auto_242144 ) ) ( not ( = ?auto_242137 ?auto_242145 ) ) ( not ( = ?auto_242137 ?auto_242146 ) ) ( not ( = ?auto_242137 ?auto_242147 ) ) ( not ( = ?auto_242137 ?auto_242148 ) ) ( not ( = ?auto_242138 ?auto_242139 ) ) ( not ( = ?auto_242138 ?auto_242140 ) ) ( not ( = ?auto_242138 ?auto_242141 ) ) ( not ( = ?auto_242138 ?auto_242142 ) ) ( not ( = ?auto_242138 ?auto_242143 ) ) ( not ( = ?auto_242138 ?auto_242144 ) ) ( not ( = ?auto_242138 ?auto_242145 ) ) ( not ( = ?auto_242138 ?auto_242146 ) ) ( not ( = ?auto_242138 ?auto_242147 ) ) ( not ( = ?auto_242138 ?auto_242148 ) ) ( not ( = ?auto_242139 ?auto_242140 ) ) ( not ( = ?auto_242139 ?auto_242141 ) ) ( not ( = ?auto_242139 ?auto_242142 ) ) ( not ( = ?auto_242139 ?auto_242143 ) ) ( not ( = ?auto_242139 ?auto_242144 ) ) ( not ( = ?auto_242139 ?auto_242145 ) ) ( not ( = ?auto_242139 ?auto_242146 ) ) ( not ( = ?auto_242139 ?auto_242147 ) ) ( not ( = ?auto_242139 ?auto_242148 ) ) ( not ( = ?auto_242140 ?auto_242141 ) ) ( not ( = ?auto_242140 ?auto_242142 ) ) ( not ( = ?auto_242140 ?auto_242143 ) ) ( not ( = ?auto_242140 ?auto_242144 ) ) ( not ( = ?auto_242140 ?auto_242145 ) ) ( not ( = ?auto_242140 ?auto_242146 ) ) ( not ( = ?auto_242140 ?auto_242147 ) ) ( not ( = ?auto_242140 ?auto_242148 ) ) ( not ( = ?auto_242141 ?auto_242142 ) ) ( not ( = ?auto_242141 ?auto_242143 ) ) ( not ( = ?auto_242141 ?auto_242144 ) ) ( not ( = ?auto_242141 ?auto_242145 ) ) ( not ( = ?auto_242141 ?auto_242146 ) ) ( not ( = ?auto_242141 ?auto_242147 ) ) ( not ( = ?auto_242141 ?auto_242148 ) ) ( not ( = ?auto_242142 ?auto_242143 ) ) ( not ( = ?auto_242142 ?auto_242144 ) ) ( not ( = ?auto_242142 ?auto_242145 ) ) ( not ( = ?auto_242142 ?auto_242146 ) ) ( not ( = ?auto_242142 ?auto_242147 ) ) ( not ( = ?auto_242142 ?auto_242148 ) ) ( not ( = ?auto_242143 ?auto_242144 ) ) ( not ( = ?auto_242143 ?auto_242145 ) ) ( not ( = ?auto_242143 ?auto_242146 ) ) ( not ( = ?auto_242143 ?auto_242147 ) ) ( not ( = ?auto_242143 ?auto_242148 ) ) ( not ( = ?auto_242144 ?auto_242145 ) ) ( not ( = ?auto_242144 ?auto_242146 ) ) ( not ( = ?auto_242144 ?auto_242147 ) ) ( not ( = ?auto_242144 ?auto_242148 ) ) ( not ( = ?auto_242145 ?auto_242146 ) ) ( not ( = ?auto_242145 ?auto_242147 ) ) ( not ( = ?auto_242145 ?auto_242148 ) ) ( not ( = ?auto_242146 ?auto_242147 ) ) ( not ( = ?auto_242146 ?auto_242148 ) ) ( not ( = ?auto_242147 ?auto_242148 ) ) ( ON ?auto_242146 ?auto_242147 ) ( ON ?auto_242145 ?auto_242146 ) ( ON ?auto_242144 ?auto_242145 ) ( ON ?auto_242143 ?auto_242144 ) ( ON ?auto_242142 ?auto_242143 ) ( CLEAR ?auto_242140 ) ( ON ?auto_242141 ?auto_242142 ) ( CLEAR ?auto_242141 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_242137 ?auto_242138 ?auto_242139 ?auto_242140 ?auto_242141 )
      ( MAKE-11PILE ?auto_242137 ?auto_242138 ?auto_242139 ?auto_242140 ?auto_242141 ?auto_242142 ?auto_242143 ?auto_242144 ?auto_242145 ?auto_242146 ?auto_242147 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_242160 - BLOCK
      ?auto_242161 - BLOCK
      ?auto_242162 - BLOCK
      ?auto_242163 - BLOCK
      ?auto_242164 - BLOCK
      ?auto_242165 - BLOCK
      ?auto_242166 - BLOCK
      ?auto_242167 - BLOCK
      ?auto_242168 - BLOCK
      ?auto_242169 - BLOCK
      ?auto_242170 - BLOCK
    )
    :vars
    (
      ?auto_242171 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_242170 ?auto_242171 ) ( ON-TABLE ?auto_242160 ) ( ON ?auto_242161 ?auto_242160 ) ( ON ?auto_242162 ?auto_242161 ) ( ON ?auto_242163 ?auto_242162 ) ( not ( = ?auto_242160 ?auto_242161 ) ) ( not ( = ?auto_242160 ?auto_242162 ) ) ( not ( = ?auto_242160 ?auto_242163 ) ) ( not ( = ?auto_242160 ?auto_242164 ) ) ( not ( = ?auto_242160 ?auto_242165 ) ) ( not ( = ?auto_242160 ?auto_242166 ) ) ( not ( = ?auto_242160 ?auto_242167 ) ) ( not ( = ?auto_242160 ?auto_242168 ) ) ( not ( = ?auto_242160 ?auto_242169 ) ) ( not ( = ?auto_242160 ?auto_242170 ) ) ( not ( = ?auto_242160 ?auto_242171 ) ) ( not ( = ?auto_242161 ?auto_242162 ) ) ( not ( = ?auto_242161 ?auto_242163 ) ) ( not ( = ?auto_242161 ?auto_242164 ) ) ( not ( = ?auto_242161 ?auto_242165 ) ) ( not ( = ?auto_242161 ?auto_242166 ) ) ( not ( = ?auto_242161 ?auto_242167 ) ) ( not ( = ?auto_242161 ?auto_242168 ) ) ( not ( = ?auto_242161 ?auto_242169 ) ) ( not ( = ?auto_242161 ?auto_242170 ) ) ( not ( = ?auto_242161 ?auto_242171 ) ) ( not ( = ?auto_242162 ?auto_242163 ) ) ( not ( = ?auto_242162 ?auto_242164 ) ) ( not ( = ?auto_242162 ?auto_242165 ) ) ( not ( = ?auto_242162 ?auto_242166 ) ) ( not ( = ?auto_242162 ?auto_242167 ) ) ( not ( = ?auto_242162 ?auto_242168 ) ) ( not ( = ?auto_242162 ?auto_242169 ) ) ( not ( = ?auto_242162 ?auto_242170 ) ) ( not ( = ?auto_242162 ?auto_242171 ) ) ( not ( = ?auto_242163 ?auto_242164 ) ) ( not ( = ?auto_242163 ?auto_242165 ) ) ( not ( = ?auto_242163 ?auto_242166 ) ) ( not ( = ?auto_242163 ?auto_242167 ) ) ( not ( = ?auto_242163 ?auto_242168 ) ) ( not ( = ?auto_242163 ?auto_242169 ) ) ( not ( = ?auto_242163 ?auto_242170 ) ) ( not ( = ?auto_242163 ?auto_242171 ) ) ( not ( = ?auto_242164 ?auto_242165 ) ) ( not ( = ?auto_242164 ?auto_242166 ) ) ( not ( = ?auto_242164 ?auto_242167 ) ) ( not ( = ?auto_242164 ?auto_242168 ) ) ( not ( = ?auto_242164 ?auto_242169 ) ) ( not ( = ?auto_242164 ?auto_242170 ) ) ( not ( = ?auto_242164 ?auto_242171 ) ) ( not ( = ?auto_242165 ?auto_242166 ) ) ( not ( = ?auto_242165 ?auto_242167 ) ) ( not ( = ?auto_242165 ?auto_242168 ) ) ( not ( = ?auto_242165 ?auto_242169 ) ) ( not ( = ?auto_242165 ?auto_242170 ) ) ( not ( = ?auto_242165 ?auto_242171 ) ) ( not ( = ?auto_242166 ?auto_242167 ) ) ( not ( = ?auto_242166 ?auto_242168 ) ) ( not ( = ?auto_242166 ?auto_242169 ) ) ( not ( = ?auto_242166 ?auto_242170 ) ) ( not ( = ?auto_242166 ?auto_242171 ) ) ( not ( = ?auto_242167 ?auto_242168 ) ) ( not ( = ?auto_242167 ?auto_242169 ) ) ( not ( = ?auto_242167 ?auto_242170 ) ) ( not ( = ?auto_242167 ?auto_242171 ) ) ( not ( = ?auto_242168 ?auto_242169 ) ) ( not ( = ?auto_242168 ?auto_242170 ) ) ( not ( = ?auto_242168 ?auto_242171 ) ) ( not ( = ?auto_242169 ?auto_242170 ) ) ( not ( = ?auto_242169 ?auto_242171 ) ) ( not ( = ?auto_242170 ?auto_242171 ) ) ( ON ?auto_242169 ?auto_242170 ) ( ON ?auto_242168 ?auto_242169 ) ( ON ?auto_242167 ?auto_242168 ) ( ON ?auto_242166 ?auto_242167 ) ( ON ?auto_242165 ?auto_242166 ) ( CLEAR ?auto_242163 ) ( ON ?auto_242164 ?auto_242165 ) ( CLEAR ?auto_242164 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_242160 ?auto_242161 ?auto_242162 ?auto_242163 ?auto_242164 )
      ( MAKE-11PILE ?auto_242160 ?auto_242161 ?auto_242162 ?auto_242163 ?auto_242164 ?auto_242165 ?auto_242166 ?auto_242167 ?auto_242168 ?auto_242169 ?auto_242170 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_242183 - BLOCK
      ?auto_242184 - BLOCK
      ?auto_242185 - BLOCK
      ?auto_242186 - BLOCK
      ?auto_242187 - BLOCK
      ?auto_242188 - BLOCK
      ?auto_242189 - BLOCK
      ?auto_242190 - BLOCK
      ?auto_242191 - BLOCK
      ?auto_242192 - BLOCK
      ?auto_242193 - BLOCK
    )
    :vars
    (
      ?auto_242194 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_242193 ?auto_242194 ) ( ON-TABLE ?auto_242183 ) ( ON ?auto_242184 ?auto_242183 ) ( ON ?auto_242185 ?auto_242184 ) ( not ( = ?auto_242183 ?auto_242184 ) ) ( not ( = ?auto_242183 ?auto_242185 ) ) ( not ( = ?auto_242183 ?auto_242186 ) ) ( not ( = ?auto_242183 ?auto_242187 ) ) ( not ( = ?auto_242183 ?auto_242188 ) ) ( not ( = ?auto_242183 ?auto_242189 ) ) ( not ( = ?auto_242183 ?auto_242190 ) ) ( not ( = ?auto_242183 ?auto_242191 ) ) ( not ( = ?auto_242183 ?auto_242192 ) ) ( not ( = ?auto_242183 ?auto_242193 ) ) ( not ( = ?auto_242183 ?auto_242194 ) ) ( not ( = ?auto_242184 ?auto_242185 ) ) ( not ( = ?auto_242184 ?auto_242186 ) ) ( not ( = ?auto_242184 ?auto_242187 ) ) ( not ( = ?auto_242184 ?auto_242188 ) ) ( not ( = ?auto_242184 ?auto_242189 ) ) ( not ( = ?auto_242184 ?auto_242190 ) ) ( not ( = ?auto_242184 ?auto_242191 ) ) ( not ( = ?auto_242184 ?auto_242192 ) ) ( not ( = ?auto_242184 ?auto_242193 ) ) ( not ( = ?auto_242184 ?auto_242194 ) ) ( not ( = ?auto_242185 ?auto_242186 ) ) ( not ( = ?auto_242185 ?auto_242187 ) ) ( not ( = ?auto_242185 ?auto_242188 ) ) ( not ( = ?auto_242185 ?auto_242189 ) ) ( not ( = ?auto_242185 ?auto_242190 ) ) ( not ( = ?auto_242185 ?auto_242191 ) ) ( not ( = ?auto_242185 ?auto_242192 ) ) ( not ( = ?auto_242185 ?auto_242193 ) ) ( not ( = ?auto_242185 ?auto_242194 ) ) ( not ( = ?auto_242186 ?auto_242187 ) ) ( not ( = ?auto_242186 ?auto_242188 ) ) ( not ( = ?auto_242186 ?auto_242189 ) ) ( not ( = ?auto_242186 ?auto_242190 ) ) ( not ( = ?auto_242186 ?auto_242191 ) ) ( not ( = ?auto_242186 ?auto_242192 ) ) ( not ( = ?auto_242186 ?auto_242193 ) ) ( not ( = ?auto_242186 ?auto_242194 ) ) ( not ( = ?auto_242187 ?auto_242188 ) ) ( not ( = ?auto_242187 ?auto_242189 ) ) ( not ( = ?auto_242187 ?auto_242190 ) ) ( not ( = ?auto_242187 ?auto_242191 ) ) ( not ( = ?auto_242187 ?auto_242192 ) ) ( not ( = ?auto_242187 ?auto_242193 ) ) ( not ( = ?auto_242187 ?auto_242194 ) ) ( not ( = ?auto_242188 ?auto_242189 ) ) ( not ( = ?auto_242188 ?auto_242190 ) ) ( not ( = ?auto_242188 ?auto_242191 ) ) ( not ( = ?auto_242188 ?auto_242192 ) ) ( not ( = ?auto_242188 ?auto_242193 ) ) ( not ( = ?auto_242188 ?auto_242194 ) ) ( not ( = ?auto_242189 ?auto_242190 ) ) ( not ( = ?auto_242189 ?auto_242191 ) ) ( not ( = ?auto_242189 ?auto_242192 ) ) ( not ( = ?auto_242189 ?auto_242193 ) ) ( not ( = ?auto_242189 ?auto_242194 ) ) ( not ( = ?auto_242190 ?auto_242191 ) ) ( not ( = ?auto_242190 ?auto_242192 ) ) ( not ( = ?auto_242190 ?auto_242193 ) ) ( not ( = ?auto_242190 ?auto_242194 ) ) ( not ( = ?auto_242191 ?auto_242192 ) ) ( not ( = ?auto_242191 ?auto_242193 ) ) ( not ( = ?auto_242191 ?auto_242194 ) ) ( not ( = ?auto_242192 ?auto_242193 ) ) ( not ( = ?auto_242192 ?auto_242194 ) ) ( not ( = ?auto_242193 ?auto_242194 ) ) ( ON ?auto_242192 ?auto_242193 ) ( ON ?auto_242191 ?auto_242192 ) ( ON ?auto_242190 ?auto_242191 ) ( ON ?auto_242189 ?auto_242190 ) ( ON ?auto_242188 ?auto_242189 ) ( ON ?auto_242187 ?auto_242188 ) ( CLEAR ?auto_242185 ) ( ON ?auto_242186 ?auto_242187 ) ( CLEAR ?auto_242186 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_242183 ?auto_242184 ?auto_242185 ?auto_242186 )
      ( MAKE-11PILE ?auto_242183 ?auto_242184 ?auto_242185 ?auto_242186 ?auto_242187 ?auto_242188 ?auto_242189 ?auto_242190 ?auto_242191 ?auto_242192 ?auto_242193 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_242206 - BLOCK
      ?auto_242207 - BLOCK
      ?auto_242208 - BLOCK
      ?auto_242209 - BLOCK
      ?auto_242210 - BLOCK
      ?auto_242211 - BLOCK
      ?auto_242212 - BLOCK
      ?auto_242213 - BLOCK
      ?auto_242214 - BLOCK
      ?auto_242215 - BLOCK
      ?auto_242216 - BLOCK
    )
    :vars
    (
      ?auto_242217 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_242216 ?auto_242217 ) ( ON-TABLE ?auto_242206 ) ( ON ?auto_242207 ?auto_242206 ) ( ON ?auto_242208 ?auto_242207 ) ( not ( = ?auto_242206 ?auto_242207 ) ) ( not ( = ?auto_242206 ?auto_242208 ) ) ( not ( = ?auto_242206 ?auto_242209 ) ) ( not ( = ?auto_242206 ?auto_242210 ) ) ( not ( = ?auto_242206 ?auto_242211 ) ) ( not ( = ?auto_242206 ?auto_242212 ) ) ( not ( = ?auto_242206 ?auto_242213 ) ) ( not ( = ?auto_242206 ?auto_242214 ) ) ( not ( = ?auto_242206 ?auto_242215 ) ) ( not ( = ?auto_242206 ?auto_242216 ) ) ( not ( = ?auto_242206 ?auto_242217 ) ) ( not ( = ?auto_242207 ?auto_242208 ) ) ( not ( = ?auto_242207 ?auto_242209 ) ) ( not ( = ?auto_242207 ?auto_242210 ) ) ( not ( = ?auto_242207 ?auto_242211 ) ) ( not ( = ?auto_242207 ?auto_242212 ) ) ( not ( = ?auto_242207 ?auto_242213 ) ) ( not ( = ?auto_242207 ?auto_242214 ) ) ( not ( = ?auto_242207 ?auto_242215 ) ) ( not ( = ?auto_242207 ?auto_242216 ) ) ( not ( = ?auto_242207 ?auto_242217 ) ) ( not ( = ?auto_242208 ?auto_242209 ) ) ( not ( = ?auto_242208 ?auto_242210 ) ) ( not ( = ?auto_242208 ?auto_242211 ) ) ( not ( = ?auto_242208 ?auto_242212 ) ) ( not ( = ?auto_242208 ?auto_242213 ) ) ( not ( = ?auto_242208 ?auto_242214 ) ) ( not ( = ?auto_242208 ?auto_242215 ) ) ( not ( = ?auto_242208 ?auto_242216 ) ) ( not ( = ?auto_242208 ?auto_242217 ) ) ( not ( = ?auto_242209 ?auto_242210 ) ) ( not ( = ?auto_242209 ?auto_242211 ) ) ( not ( = ?auto_242209 ?auto_242212 ) ) ( not ( = ?auto_242209 ?auto_242213 ) ) ( not ( = ?auto_242209 ?auto_242214 ) ) ( not ( = ?auto_242209 ?auto_242215 ) ) ( not ( = ?auto_242209 ?auto_242216 ) ) ( not ( = ?auto_242209 ?auto_242217 ) ) ( not ( = ?auto_242210 ?auto_242211 ) ) ( not ( = ?auto_242210 ?auto_242212 ) ) ( not ( = ?auto_242210 ?auto_242213 ) ) ( not ( = ?auto_242210 ?auto_242214 ) ) ( not ( = ?auto_242210 ?auto_242215 ) ) ( not ( = ?auto_242210 ?auto_242216 ) ) ( not ( = ?auto_242210 ?auto_242217 ) ) ( not ( = ?auto_242211 ?auto_242212 ) ) ( not ( = ?auto_242211 ?auto_242213 ) ) ( not ( = ?auto_242211 ?auto_242214 ) ) ( not ( = ?auto_242211 ?auto_242215 ) ) ( not ( = ?auto_242211 ?auto_242216 ) ) ( not ( = ?auto_242211 ?auto_242217 ) ) ( not ( = ?auto_242212 ?auto_242213 ) ) ( not ( = ?auto_242212 ?auto_242214 ) ) ( not ( = ?auto_242212 ?auto_242215 ) ) ( not ( = ?auto_242212 ?auto_242216 ) ) ( not ( = ?auto_242212 ?auto_242217 ) ) ( not ( = ?auto_242213 ?auto_242214 ) ) ( not ( = ?auto_242213 ?auto_242215 ) ) ( not ( = ?auto_242213 ?auto_242216 ) ) ( not ( = ?auto_242213 ?auto_242217 ) ) ( not ( = ?auto_242214 ?auto_242215 ) ) ( not ( = ?auto_242214 ?auto_242216 ) ) ( not ( = ?auto_242214 ?auto_242217 ) ) ( not ( = ?auto_242215 ?auto_242216 ) ) ( not ( = ?auto_242215 ?auto_242217 ) ) ( not ( = ?auto_242216 ?auto_242217 ) ) ( ON ?auto_242215 ?auto_242216 ) ( ON ?auto_242214 ?auto_242215 ) ( ON ?auto_242213 ?auto_242214 ) ( ON ?auto_242212 ?auto_242213 ) ( ON ?auto_242211 ?auto_242212 ) ( ON ?auto_242210 ?auto_242211 ) ( CLEAR ?auto_242208 ) ( ON ?auto_242209 ?auto_242210 ) ( CLEAR ?auto_242209 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_242206 ?auto_242207 ?auto_242208 ?auto_242209 )
      ( MAKE-11PILE ?auto_242206 ?auto_242207 ?auto_242208 ?auto_242209 ?auto_242210 ?auto_242211 ?auto_242212 ?auto_242213 ?auto_242214 ?auto_242215 ?auto_242216 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_242229 - BLOCK
      ?auto_242230 - BLOCK
      ?auto_242231 - BLOCK
      ?auto_242232 - BLOCK
      ?auto_242233 - BLOCK
      ?auto_242234 - BLOCK
      ?auto_242235 - BLOCK
      ?auto_242236 - BLOCK
      ?auto_242237 - BLOCK
      ?auto_242238 - BLOCK
      ?auto_242239 - BLOCK
    )
    :vars
    (
      ?auto_242240 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_242239 ?auto_242240 ) ( ON-TABLE ?auto_242229 ) ( ON ?auto_242230 ?auto_242229 ) ( not ( = ?auto_242229 ?auto_242230 ) ) ( not ( = ?auto_242229 ?auto_242231 ) ) ( not ( = ?auto_242229 ?auto_242232 ) ) ( not ( = ?auto_242229 ?auto_242233 ) ) ( not ( = ?auto_242229 ?auto_242234 ) ) ( not ( = ?auto_242229 ?auto_242235 ) ) ( not ( = ?auto_242229 ?auto_242236 ) ) ( not ( = ?auto_242229 ?auto_242237 ) ) ( not ( = ?auto_242229 ?auto_242238 ) ) ( not ( = ?auto_242229 ?auto_242239 ) ) ( not ( = ?auto_242229 ?auto_242240 ) ) ( not ( = ?auto_242230 ?auto_242231 ) ) ( not ( = ?auto_242230 ?auto_242232 ) ) ( not ( = ?auto_242230 ?auto_242233 ) ) ( not ( = ?auto_242230 ?auto_242234 ) ) ( not ( = ?auto_242230 ?auto_242235 ) ) ( not ( = ?auto_242230 ?auto_242236 ) ) ( not ( = ?auto_242230 ?auto_242237 ) ) ( not ( = ?auto_242230 ?auto_242238 ) ) ( not ( = ?auto_242230 ?auto_242239 ) ) ( not ( = ?auto_242230 ?auto_242240 ) ) ( not ( = ?auto_242231 ?auto_242232 ) ) ( not ( = ?auto_242231 ?auto_242233 ) ) ( not ( = ?auto_242231 ?auto_242234 ) ) ( not ( = ?auto_242231 ?auto_242235 ) ) ( not ( = ?auto_242231 ?auto_242236 ) ) ( not ( = ?auto_242231 ?auto_242237 ) ) ( not ( = ?auto_242231 ?auto_242238 ) ) ( not ( = ?auto_242231 ?auto_242239 ) ) ( not ( = ?auto_242231 ?auto_242240 ) ) ( not ( = ?auto_242232 ?auto_242233 ) ) ( not ( = ?auto_242232 ?auto_242234 ) ) ( not ( = ?auto_242232 ?auto_242235 ) ) ( not ( = ?auto_242232 ?auto_242236 ) ) ( not ( = ?auto_242232 ?auto_242237 ) ) ( not ( = ?auto_242232 ?auto_242238 ) ) ( not ( = ?auto_242232 ?auto_242239 ) ) ( not ( = ?auto_242232 ?auto_242240 ) ) ( not ( = ?auto_242233 ?auto_242234 ) ) ( not ( = ?auto_242233 ?auto_242235 ) ) ( not ( = ?auto_242233 ?auto_242236 ) ) ( not ( = ?auto_242233 ?auto_242237 ) ) ( not ( = ?auto_242233 ?auto_242238 ) ) ( not ( = ?auto_242233 ?auto_242239 ) ) ( not ( = ?auto_242233 ?auto_242240 ) ) ( not ( = ?auto_242234 ?auto_242235 ) ) ( not ( = ?auto_242234 ?auto_242236 ) ) ( not ( = ?auto_242234 ?auto_242237 ) ) ( not ( = ?auto_242234 ?auto_242238 ) ) ( not ( = ?auto_242234 ?auto_242239 ) ) ( not ( = ?auto_242234 ?auto_242240 ) ) ( not ( = ?auto_242235 ?auto_242236 ) ) ( not ( = ?auto_242235 ?auto_242237 ) ) ( not ( = ?auto_242235 ?auto_242238 ) ) ( not ( = ?auto_242235 ?auto_242239 ) ) ( not ( = ?auto_242235 ?auto_242240 ) ) ( not ( = ?auto_242236 ?auto_242237 ) ) ( not ( = ?auto_242236 ?auto_242238 ) ) ( not ( = ?auto_242236 ?auto_242239 ) ) ( not ( = ?auto_242236 ?auto_242240 ) ) ( not ( = ?auto_242237 ?auto_242238 ) ) ( not ( = ?auto_242237 ?auto_242239 ) ) ( not ( = ?auto_242237 ?auto_242240 ) ) ( not ( = ?auto_242238 ?auto_242239 ) ) ( not ( = ?auto_242238 ?auto_242240 ) ) ( not ( = ?auto_242239 ?auto_242240 ) ) ( ON ?auto_242238 ?auto_242239 ) ( ON ?auto_242237 ?auto_242238 ) ( ON ?auto_242236 ?auto_242237 ) ( ON ?auto_242235 ?auto_242236 ) ( ON ?auto_242234 ?auto_242235 ) ( ON ?auto_242233 ?auto_242234 ) ( ON ?auto_242232 ?auto_242233 ) ( CLEAR ?auto_242230 ) ( ON ?auto_242231 ?auto_242232 ) ( CLEAR ?auto_242231 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_242229 ?auto_242230 ?auto_242231 )
      ( MAKE-11PILE ?auto_242229 ?auto_242230 ?auto_242231 ?auto_242232 ?auto_242233 ?auto_242234 ?auto_242235 ?auto_242236 ?auto_242237 ?auto_242238 ?auto_242239 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_242252 - BLOCK
      ?auto_242253 - BLOCK
      ?auto_242254 - BLOCK
      ?auto_242255 - BLOCK
      ?auto_242256 - BLOCK
      ?auto_242257 - BLOCK
      ?auto_242258 - BLOCK
      ?auto_242259 - BLOCK
      ?auto_242260 - BLOCK
      ?auto_242261 - BLOCK
      ?auto_242262 - BLOCK
    )
    :vars
    (
      ?auto_242263 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_242262 ?auto_242263 ) ( ON-TABLE ?auto_242252 ) ( ON ?auto_242253 ?auto_242252 ) ( not ( = ?auto_242252 ?auto_242253 ) ) ( not ( = ?auto_242252 ?auto_242254 ) ) ( not ( = ?auto_242252 ?auto_242255 ) ) ( not ( = ?auto_242252 ?auto_242256 ) ) ( not ( = ?auto_242252 ?auto_242257 ) ) ( not ( = ?auto_242252 ?auto_242258 ) ) ( not ( = ?auto_242252 ?auto_242259 ) ) ( not ( = ?auto_242252 ?auto_242260 ) ) ( not ( = ?auto_242252 ?auto_242261 ) ) ( not ( = ?auto_242252 ?auto_242262 ) ) ( not ( = ?auto_242252 ?auto_242263 ) ) ( not ( = ?auto_242253 ?auto_242254 ) ) ( not ( = ?auto_242253 ?auto_242255 ) ) ( not ( = ?auto_242253 ?auto_242256 ) ) ( not ( = ?auto_242253 ?auto_242257 ) ) ( not ( = ?auto_242253 ?auto_242258 ) ) ( not ( = ?auto_242253 ?auto_242259 ) ) ( not ( = ?auto_242253 ?auto_242260 ) ) ( not ( = ?auto_242253 ?auto_242261 ) ) ( not ( = ?auto_242253 ?auto_242262 ) ) ( not ( = ?auto_242253 ?auto_242263 ) ) ( not ( = ?auto_242254 ?auto_242255 ) ) ( not ( = ?auto_242254 ?auto_242256 ) ) ( not ( = ?auto_242254 ?auto_242257 ) ) ( not ( = ?auto_242254 ?auto_242258 ) ) ( not ( = ?auto_242254 ?auto_242259 ) ) ( not ( = ?auto_242254 ?auto_242260 ) ) ( not ( = ?auto_242254 ?auto_242261 ) ) ( not ( = ?auto_242254 ?auto_242262 ) ) ( not ( = ?auto_242254 ?auto_242263 ) ) ( not ( = ?auto_242255 ?auto_242256 ) ) ( not ( = ?auto_242255 ?auto_242257 ) ) ( not ( = ?auto_242255 ?auto_242258 ) ) ( not ( = ?auto_242255 ?auto_242259 ) ) ( not ( = ?auto_242255 ?auto_242260 ) ) ( not ( = ?auto_242255 ?auto_242261 ) ) ( not ( = ?auto_242255 ?auto_242262 ) ) ( not ( = ?auto_242255 ?auto_242263 ) ) ( not ( = ?auto_242256 ?auto_242257 ) ) ( not ( = ?auto_242256 ?auto_242258 ) ) ( not ( = ?auto_242256 ?auto_242259 ) ) ( not ( = ?auto_242256 ?auto_242260 ) ) ( not ( = ?auto_242256 ?auto_242261 ) ) ( not ( = ?auto_242256 ?auto_242262 ) ) ( not ( = ?auto_242256 ?auto_242263 ) ) ( not ( = ?auto_242257 ?auto_242258 ) ) ( not ( = ?auto_242257 ?auto_242259 ) ) ( not ( = ?auto_242257 ?auto_242260 ) ) ( not ( = ?auto_242257 ?auto_242261 ) ) ( not ( = ?auto_242257 ?auto_242262 ) ) ( not ( = ?auto_242257 ?auto_242263 ) ) ( not ( = ?auto_242258 ?auto_242259 ) ) ( not ( = ?auto_242258 ?auto_242260 ) ) ( not ( = ?auto_242258 ?auto_242261 ) ) ( not ( = ?auto_242258 ?auto_242262 ) ) ( not ( = ?auto_242258 ?auto_242263 ) ) ( not ( = ?auto_242259 ?auto_242260 ) ) ( not ( = ?auto_242259 ?auto_242261 ) ) ( not ( = ?auto_242259 ?auto_242262 ) ) ( not ( = ?auto_242259 ?auto_242263 ) ) ( not ( = ?auto_242260 ?auto_242261 ) ) ( not ( = ?auto_242260 ?auto_242262 ) ) ( not ( = ?auto_242260 ?auto_242263 ) ) ( not ( = ?auto_242261 ?auto_242262 ) ) ( not ( = ?auto_242261 ?auto_242263 ) ) ( not ( = ?auto_242262 ?auto_242263 ) ) ( ON ?auto_242261 ?auto_242262 ) ( ON ?auto_242260 ?auto_242261 ) ( ON ?auto_242259 ?auto_242260 ) ( ON ?auto_242258 ?auto_242259 ) ( ON ?auto_242257 ?auto_242258 ) ( ON ?auto_242256 ?auto_242257 ) ( ON ?auto_242255 ?auto_242256 ) ( CLEAR ?auto_242253 ) ( ON ?auto_242254 ?auto_242255 ) ( CLEAR ?auto_242254 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_242252 ?auto_242253 ?auto_242254 )
      ( MAKE-11PILE ?auto_242252 ?auto_242253 ?auto_242254 ?auto_242255 ?auto_242256 ?auto_242257 ?auto_242258 ?auto_242259 ?auto_242260 ?auto_242261 ?auto_242262 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_242275 - BLOCK
      ?auto_242276 - BLOCK
      ?auto_242277 - BLOCK
      ?auto_242278 - BLOCK
      ?auto_242279 - BLOCK
      ?auto_242280 - BLOCK
      ?auto_242281 - BLOCK
      ?auto_242282 - BLOCK
      ?auto_242283 - BLOCK
      ?auto_242284 - BLOCK
      ?auto_242285 - BLOCK
    )
    :vars
    (
      ?auto_242286 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_242285 ?auto_242286 ) ( ON-TABLE ?auto_242275 ) ( not ( = ?auto_242275 ?auto_242276 ) ) ( not ( = ?auto_242275 ?auto_242277 ) ) ( not ( = ?auto_242275 ?auto_242278 ) ) ( not ( = ?auto_242275 ?auto_242279 ) ) ( not ( = ?auto_242275 ?auto_242280 ) ) ( not ( = ?auto_242275 ?auto_242281 ) ) ( not ( = ?auto_242275 ?auto_242282 ) ) ( not ( = ?auto_242275 ?auto_242283 ) ) ( not ( = ?auto_242275 ?auto_242284 ) ) ( not ( = ?auto_242275 ?auto_242285 ) ) ( not ( = ?auto_242275 ?auto_242286 ) ) ( not ( = ?auto_242276 ?auto_242277 ) ) ( not ( = ?auto_242276 ?auto_242278 ) ) ( not ( = ?auto_242276 ?auto_242279 ) ) ( not ( = ?auto_242276 ?auto_242280 ) ) ( not ( = ?auto_242276 ?auto_242281 ) ) ( not ( = ?auto_242276 ?auto_242282 ) ) ( not ( = ?auto_242276 ?auto_242283 ) ) ( not ( = ?auto_242276 ?auto_242284 ) ) ( not ( = ?auto_242276 ?auto_242285 ) ) ( not ( = ?auto_242276 ?auto_242286 ) ) ( not ( = ?auto_242277 ?auto_242278 ) ) ( not ( = ?auto_242277 ?auto_242279 ) ) ( not ( = ?auto_242277 ?auto_242280 ) ) ( not ( = ?auto_242277 ?auto_242281 ) ) ( not ( = ?auto_242277 ?auto_242282 ) ) ( not ( = ?auto_242277 ?auto_242283 ) ) ( not ( = ?auto_242277 ?auto_242284 ) ) ( not ( = ?auto_242277 ?auto_242285 ) ) ( not ( = ?auto_242277 ?auto_242286 ) ) ( not ( = ?auto_242278 ?auto_242279 ) ) ( not ( = ?auto_242278 ?auto_242280 ) ) ( not ( = ?auto_242278 ?auto_242281 ) ) ( not ( = ?auto_242278 ?auto_242282 ) ) ( not ( = ?auto_242278 ?auto_242283 ) ) ( not ( = ?auto_242278 ?auto_242284 ) ) ( not ( = ?auto_242278 ?auto_242285 ) ) ( not ( = ?auto_242278 ?auto_242286 ) ) ( not ( = ?auto_242279 ?auto_242280 ) ) ( not ( = ?auto_242279 ?auto_242281 ) ) ( not ( = ?auto_242279 ?auto_242282 ) ) ( not ( = ?auto_242279 ?auto_242283 ) ) ( not ( = ?auto_242279 ?auto_242284 ) ) ( not ( = ?auto_242279 ?auto_242285 ) ) ( not ( = ?auto_242279 ?auto_242286 ) ) ( not ( = ?auto_242280 ?auto_242281 ) ) ( not ( = ?auto_242280 ?auto_242282 ) ) ( not ( = ?auto_242280 ?auto_242283 ) ) ( not ( = ?auto_242280 ?auto_242284 ) ) ( not ( = ?auto_242280 ?auto_242285 ) ) ( not ( = ?auto_242280 ?auto_242286 ) ) ( not ( = ?auto_242281 ?auto_242282 ) ) ( not ( = ?auto_242281 ?auto_242283 ) ) ( not ( = ?auto_242281 ?auto_242284 ) ) ( not ( = ?auto_242281 ?auto_242285 ) ) ( not ( = ?auto_242281 ?auto_242286 ) ) ( not ( = ?auto_242282 ?auto_242283 ) ) ( not ( = ?auto_242282 ?auto_242284 ) ) ( not ( = ?auto_242282 ?auto_242285 ) ) ( not ( = ?auto_242282 ?auto_242286 ) ) ( not ( = ?auto_242283 ?auto_242284 ) ) ( not ( = ?auto_242283 ?auto_242285 ) ) ( not ( = ?auto_242283 ?auto_242286 ) ) ( not ( = ?auto_242284 ?auto_242285 ) ) ( not ( = ?auto_242284 ?auto_242286 ) ) ( not ( = ?auto_242285 ?auto_242286 ) ) ( ON ?auto_242284 ?auto_242285 ) ( ON ?auto_242283 ?auto_242284 ) ( ON ?auto_242282 ?auto_242283 ) ( ON ?auto_242281 ?auto_242282 ) ( ON ?auto_242280 ?auto_242281 ) ( ON ?auto_242279 ?auto_242280 ) ( ON ?auto_242278 ?auto_242279 ) ( ON ?auto_242277 ?auto_242278 ) ( CLEAR ?auto_242275 ) ( ON ?auto_242276 ?auto_242277 ) ( CLEAR ?auto_242276 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_242275 ?auto_242276 )
      ( MAKE-11PILE ?auto_242275 ?auto_242276 ?auto_242277 ?auto_242278 ?auto_242279 ?auto_242280 ?auto_242281 ?auto_242282 ?auto_242283 ?auto_242284 ?auto_242285 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_242298 - BLOCK
      ?auto_242299 - BLOCK
      ?auto_242300 - BLOCK
      ?auto_242301 - BLOCK
      ?auto_242302 - BLOCK
      ?auto_242303 - BLOCK
      ?auto_242304 - BLOCK
      ?auto_242305 - BLOCK
      ?auto_242306 - BLOCK
      ?auto_242307 - BLOCK
      ?auto_242308 - BLOCK
    )
    :vars
    (
      ?auto_242309 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_242308 ?auto_242309 ) ( ON-TABLE ?auto_242298 ) ( not ( = ?auto_242298 ?auto_242299 ) ) ( not ( = ?auto_242298 ?auto_242300 ) ) ( not ( = ?auto_242298 ?auto_242301 ) ) ( not ( = ?auto_242298 ?auto_242302 ) ) ( not ( = ?auto_242298 ?auto_242303 ) ) ( not ( = ?auto_242298 ?auto_242304 ) ) ( not ( = ?auto_242298 ?auto_242305 ) ) ( not ( = ?auto_242298 ?auto_242306 ) ) ( not ( = ?auto_242298 ?auto_242307 ) ) ( not ( = ?auto_242298 ?auto_242308 ) ) ( not ( = ?auto_242298 ?auto_242309 ) ) ( not ( = ?auto_242299 ?auto_242300 ) ) ( not ( = ?auto_242299 ?auto_242301 ) ) ( not ( = ?auto_242299 ?auto_242302 ) ) ( not ( = ?auto_242299 ?auto_242303 ) ) ( not ( = ?auto_242299 ?auto_242304 ) ) ( not ( = ?auto_242299 ?auto_242305 ) ) ( not ( = ?auto_242299 ?auto_242306 ) ) ( not ( = ?auto_242299 ?auto_242307 ) ) ( not ( = ?auto_242299 ?auto_242308 ) ) ( not ( = ?auto_242299 ?auto_242309 ) ) ( not ( = ?auto_242300 ?auto_242301 ) ) ( not ( = ?auto_242300 ?auto_242302 ) ) ( not ( = ?auto_242300 ?auto_242303 ) ) ( not ( = ?auto_242300 ?auto_242304 ) ) ( not ( = ?auto_242300 ?auto_242305 ) ) ( not ( = ?auto_242300 ?auto_242306 ) ) ( not ( = ?auto_242300 ?auto_242307 ) ) ( not ( = ?auto_242300 ?auto_242308 ) ) ( not ( = ?auto_242300 ?auto_242309 ) ) ( not ( = ?auto_242301 ?auto_242302 ) ) ( not ( = ?auto_242301 ?auto_242303 ) ) ( not ( = ?auto_242301 ?auto_242304 ) ) ( not ( = ?auto_242301 ?auto_242305 ) ) ( not ( = ?auto_242301 ?auto_242306 ) ) ( not ( = ?auto_242301 ?auto_242307 ) ) ( not ( = ?auto_242301 ?auto_242308 ) ) ( not ( = ?auto_242301 ?auto_242309 ) ) ( not ( = ?auto_242302 ?auto_242303 ) ) ( not ( = ?auto_242302 ?auto_242304 ) ) ( not ( = ?auto_242302 ?auto_242305 ) ) ( not ( = ?auto_242302 ?auto_242306 ) ) ( not ( = ?auto_242302 ?auto_242307 ) ) ( not ( = ?auto_242302 ?auto_242308 ) ) ( not ( = ?auto_242302 ?auto_242309 ) ) ( not ( = ?auto_242303 ?auto_242304 ) ) ( not ( = ?auto_242303 ?auto_242305 ) ) ( not ( = ?auto_242303 ?auto_242306 ) ) ( not ( = ?auto_242303 ?auto_242307 ) ) ( not ( = ?auto_242303 ?auto_242308 ) ) ( not ( = ?auto_242303 ?auto_242309 ) ) ( not ( = ?auto_242304 ?auto_242305 ) ) ( not ( = ?auto_242304 ?auto_242306 ) ) ( not ( = ?auto_242304 ?auto_242307 ) ) ( not ( = ?auto_242304 ?auto_242308 ) ) ( not ( = ?auto_242304 ?auto_242309 ) ) ( not ( = ?auto_242305 ?auto_242306 ) ) ( not ( = ?auto_242305 ?auto_242307 ) ) ( not ( = ?auto_242305 ?auto_242308 ) ) ( not ( = ?auto_242305 ?auto_242309 ) ) ( not ( = ?auto_242306 ?auto_242307 ) ) ( not ( = ?auto_242306 ?auto_242308 ) ) ( not ( = ?auto_242306 ?auto_242309 ) ) ( not ( = ?auto_242307 ?auto_242308 ) ) ( not ( = ?auto_242307 ?auto_242309 ) ) ( not ( = ?auto_242308 ?auto_242309 ) ) ( ON ?auto_242307 ?auto_242308 ) ( ON ?auto_242306 ?auto_242307 ) ( ON ?auto_242305 ?auto_242306 ) ( ON ?auto_242304 ?auto_242305 ) ( ON ?auto_242303 ?auto_242304 ) ( ON ?auto_242302 ?auto_242303 ) ( ON ?auto_242301 ?auto_242302 ) ( ON ?auto_242300 ?auto_242301 ) ( CLEAR ?auto_242298 ) ( ON ?auto_242299 ?auto_242300 ) ( CLEAR ?auto_242299 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_242298 ?auto_242299 )
      ( MAKE-11PILE ?auto_242298 ?auto_242299 ?auto_242300 ?auto_242301 ?auto_242302 ?auto_242303 ?auto_242304 ?auto_242305 ?auto_242306 ?auto_242307 ?auto_242308 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_242321 - BLOCK
      ?auto_242322 - BLOCK
      ?auto_242323 - BLOCK
      ?auto_242324 - BLOCK
      ?auto_242325 - BLOCK
      ?auto_242326 - BLOCK
      ?auto_242327 - BLOCK
      ?auto_242328 - BLOCK
      ?auto_242329 - BLOCK
      ?auto_242330 - BLOCK
      ?auto_242331 - BLOCK
    )
    :vars
    (
      ?auto_242332 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_242331 ?auto_242332 ) ( not ( = ?auto_242321 ?auto_242322 ) ) ( not ( = ?auto_242321 ?auto_242323 ) ) ( not ( = ?auto_242321 ?auto_242324 ) ) ( not ( = ?auto_242321 ?auto_242325 ) ) ( not ( = ?auto_242321 ?auto_242326 ) ) ( not ( = ?auto_242321 ?auto_242327 ) ) ( not ( = ?auto_242321 ?auto_242328 ) ) ( not ( = ?auto_242321 ?auto_242329 ) ) ( not ( = ?auto_242321 ?auto_242330 ) ) ( not ( = ?auto_242321 ?auto_242331 ) ) ( not ( = ?auto_242321 ?auto_242332 ) ) ( not ( = ?auto_242322 ?auto_242323 ) ) ( not ( = ?auto_242322 ?auto_242324 ) ) ( not ( = ?auto_242322 ?auto_242325 ) ) ( not ( = ?auto_242322 ?auto_242326 ) ) ( not ( = ?auto_242322 ?auto_242327 ) ) ( not ( = ?auto_242322 ?auto_242328 ) ) ( not ( = ?auto_242322 ?auto_242329 ) ) ( not ( = ?auto_242322 ?auto_242330 ) ) ( not ( = ?auto_242322 ?auto_242331 ) ) ( not ( = ?auto_242322 ?auto_242332 ) ) ( not ( = ?auto_242323 ?auto_242324 ) ) ( not ( = ?auto_242323 ?auto_242325 ) ) ( not ( = ?auto_242323 ?auto_242326 ) ) ( not ( = ?auto_242323 ?auto_242327 ) ) ( not ( = ?auto_242323 ?auto_242328 ) ) ( not ( = ?auto_242323 ?auto_242329 ) ) ( not ( = ?auto_242323 ?auto_242330 ) ) ( not ( = ?auto_242323 ?auto_242331 ) ) ( not ( = ?auto_242323 ?auto_242332 ) ) ( not ( = ?auto_242324 ?auto_242325 ) ) ( not ( = ?auto_242324 ?auto_242326 ) ) ( not ( = ?auto_242324 ?auto_242327 ) ) ( not ( = ?auto_242324 ?auto_242328 ) ) ( not ( = ?auto_242324 ?auto_242329 ) ) ( not ( = ?auto_242324 ?auto_242330 ) ) ( not ( = ?auto_242324 ?auto_242331 ) ) ( not ( = ?auto_242324 ?auto_242332 ) ) ( not ( = ?auto_242325 ?auto_242326 ) ) ( not ( = ?auto_242325 ?auto_242327 ) ) ( not ( = ?auto_242325 ?auto_242328 ) ) ( not ( = ?auto_242325 ?auto_242329 ) ) ( not ( = ?auto_242325 ?auto_242330 ) ) ( not ( = ?auto_242325 ?auto_242331 ) ) ( not ( = ?auto_242325 ?auto_242332 ) ) ( not ( = ?auto_242326 ?auto_242327 ) ) ( not ( = ?auto_242326 ?auto_242328 ) ) ( not ( = ?auto_242326 ?auto_242329 ) ) ( not ( = ?auto_242326 ?auto_242330 ) ) ( not ( = ?auto_242326 ?auto_242331 ) ) ( not ( = ?auto_242326 ?auto_242332 ) ) ( not ( = ?auto_242327 ?auto_242328 ) ) ( not ( = ?auto_242327 ?auto_242329 ) ) ( not ( = ?auto_242327 ?auto_242330 ) ) ( not ( = ?auto_242327 ?auto_242331 ) ) ( not ( = ?auto_242327 ?auto_242332 ) ) ( not ( = ?auto_242328 ?auto_242329 ) ) ( not ( = ?auto_242328 ?auto_242330 ) ) ( not ( = ?auto_242328 ?auto_242331 ) ) ( not ( = ?auto_242328 ?auto_242332 ) ) ( not ( = ?auto_242329 ?auto_242330 ) ) ( not ( = ?auto_242329 ?auto_242331 ) ) ( not ( = ?auto_242329 ?auto_242332 ) ) ( not ( = ?auto_242330 ?auto_242331 ) ) ( not ( = ?auto_242330 ?auto_242332 ) ) ( not ( = ?auto_242331 ?auto_242332 ) ) ( ON ?auto_242330 ?auto_242331 ) ( ON ?auto_242329 ?auto_242330 ) ( ON ?auto_242328 ?auto_242329 ) ( ON ?auto_242327 ?auto_242328 ) ( ON ?auto_242326 ?auto_242327 ) ( ON ?auto_242325 ?auto_242326 ) ( ON ?auto_242324 ?auto_242325 ) ( ON ?auto_242323 ?auto_242324 ) ( ON ?auto_242322 ?auto_242323 ) ( ON ?auto_242321 ?auto_242322 ) ( CLEAR ?auto_242321 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_242321 )
      ( MAKE-11PILE ?auto_242321 ?auto_242322 ?auto_242323 ?auto_242324 ?auto_242325 ?auto_242326 ?auto_242327 ?auto_242328 ?auto_242329 ?auto_242330 ?auto_242331 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_242344 - BLOCK
      ?auto_242345 - BLOCK
      ?auto_242346 - BLOCK
      ?auto_242347 - BLOCK
      ?auto_242348 - BLOCK
      ?auto_242349 - BLOCK
      ?auto_242350 - BLOCK
      ?auto_242351 - BLOCK
      ?auto_242352 - BLOCK
      ?auto_242353 - BLOCK
      ?auto_242354 - BLOCK
    )
    :vars
    (
      ?auto_242355 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_242354 ?auto_242355 ) ( not ( = ?auto_242344 ?auto_242345 ) ) ( not ( = ?auto_242344 ?auto_242346 ) ) ( not ( = ?auto_242344 ?auto_242347 ) ) ( not ( = ?auto_242344 ?auto_242348 ) ) ( not ( = ?auto_242344 ?auto_242349 ) ) ( not ( = ?auto_242344 ?auto_242350 ) ) ( not ( = ?auto_242344 ?auto_242351 ) ) ( not ( = ?auto_242344 ?auto_242352 ) ) ( not ( = ?auto_242344 ?auto_242353 ) ) ( not ( = ?auto_242344 ?auto_242354 ) ) ( not ( = ?auto_242344 ?auto_242355 ) ) ( not ( = ?auto_242345 ?auto_242346 ) ) ( not ( = ?auto_242345 ?auto_242347 ) ) ( not ( = ?auto_242345 ?auto_242348 ) ) ( not ( = ?auto_242345 ?auto_242349 ) ) ( not ( = ?auto_242345 ?auto_242350 ) ) ( not ( = ?auto_242345 ?auto_242351 ) ) ( not ( = ?auto_242345 ?auto_242352 ) ) ( not ( = ?auto_242345 ?auto_242353 ) ) ( not ( = ?auto_242345 ?auto_242354 ) ) ( not ( = ?auto_242345 ?auto_242355 ) ) ( not ( = ?auto_242346 ?auto_242347 ) ) ( not ( = ?auto_242346 ?auto_242348 ) ) ( not ( = ?auto_242346 ?auto_242349 ) ) ( not ( = ?auto_242346 ?auto_242350 ) ) ( not ( = ?auto_242346 ?auto_242351 ) ) ( not ( = ?auto_242346 ?auto_242352 ) ) ( not ( = ?auto_242346 ?auto_242353 ) ) ( not ( = ?auto_242346 ?auto_242354 ) ) ( not ( = ?auto_242346 ?auto_242355 ) ) ( not ( = ?auto_242347 ?auto_242348 ) ) ( not ( = ?auto_242347 ?auto_242349 ) ) ( not ( = ?auto_242347 ?auto_242350 ) ) ( not ( = ?auto_242347 ?auto_242351 ) ) ( not ( = ?auto_242347 ?auto_242352 ) ) ( not ( = ?auto_242347 ?auto_242353 ) ) ( not ( = ?auto_242347 ?auto_242354 ) ) ( not ( = ?auto_242347 ?auto_242355 ) ) ( not ( = ?auto_242348 ?auto_242349 ) ) ( not ( = ?auto_242348 ?auto_242350 ) ) ( not ( = ?auto_242348 ?auto_242351 ) ) ( not ( = ?auto_242348 ?auto_242352 ) ) ( not ( = ?auto_242348 ?auto_242353 ) ) ( not ( = ?auto_242348 ?auto_242354 ) ) ( not ( = ?auto_242348 ?auto_242355 ) ) ( not ( = ?auto_242349 ?auto_242350 ) ) ( not ( = ?auto_242349 ?auto_242351 ) ) ( not ( = ?auto_242349 ?auto_242352 ) ) ( not ( = ?auto_242349 ?auto_242353 ) ) ( not ( = ?auto_242349 ?auto_242354 ) ) ( not ( = ?auto_242349 ?auto_242355 ) ) ( not ( = ?auto_242350 ?auto_242351 ) ) ( not ( = ?auto_242350 ?auto_242352 ) ) ( not ( = ?auto_242350 ?auto_242353 ) ) ( not ( = ?auto_242350 ?auto_242354 ) ) ( not ( = ?auto_242350 ?auto_242355 ) ) ( not ( = ?auto_242351 ?auto_242352 ) ) ( not ( = ?auto_242351 ?auto_242353 ) ) ( not ( = ?auto_242351 ?auto_242354 ) ) ( not ( = ?auto_242351 ?auto_242355 ) ) ( not ( = ?auto_242352 ?auto_242353 ) ) ( not ( = ?auto_242352 ?auto_242354 ) ) ( not ( = ?auto_242352 ?auto_242355 ) ) ( not ( = ?auto_242353 ?auto_242354 ) ) ( not ( = ?auto_242353 ?auto_242355 ) ) ( not ( = ?auto_242354 ?auto_242355 ) ) ( ON ?auto_242353 ?auto_242354 ) ( ON ?auto_242352 ?auto_242353 ) ( ON ?auto_242351 ?auto_242352 ) ( ON ?auto_242350 ?auto_242351 ) ( ON ?auto_242349 ?auto_242350 ) ( ON ?auto_242348 ?auto_242349 ) ( ON ?auto_242347 ?auto_242348 ) ( ON ?auto_242346 ?auto_242347 ) ( ON ?auto_242345 ?auto_242346 ) ( ON ?auto_242344 ?auto_242345 ) ( CLEAR ?auto_242344 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_242344 )
      ( MAKE-11PILE ?auto_242344 ?auto_242345 ?auto_242346 ?auto_242347 ?auto_242348 ?auto_242349 ?auto_242350 ?auto_242351 ?auto_242352 ?auto_242353 ?auto_242354 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_242368 - BLOCK
      ?auto_242369 - BLOCK
      ?auto_242370 - BLOCK
      ?auto_242371 - BLOCK
      ?auto_242372 - BLOCK
      ?auto_242373 - BLOCK
      ?auto_242374 - BLOCK
      ?auto_242375 - BLOCK
      ?auto_242376 - BLOCK
      ?auto_242377 - BLOCK
      ?auto_242378 - BLOCK
      ?auto_242379 - BLOCK
    )
    :vars
    (
      ?auto_242380 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_242378 ) ( ON ?auto_242379 ?auto_242380 ) ( CLEAR ?auto_242379 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_242368 ) ( ON ?auto_242369 ?auto_242368 ) ( ON ?auto_242370 ?auto_242369 ) ( ON ?auto_242371 ?auto_242370 ) ( ON ?auto_242372 ?auto_242371 ) ( ON ?auto_242373 ?auto_242372 ) ( ON ?auto_242374 ?auto_242373 ) ( ON ?auto_242375 ?auto_242374 ) ( ON ?auto_242376 ?auto_242375 ) ( ON ?auto_242377 ?auto_242376 ) ( ON ?auto_242378 ?auto_242377 ) ( not ( = ?auto_242368 ?auto_242369 ) ) ( not ( = ?auto_242368 ?auto_242370 ) ) ( not ( = ?auto_242368 ?auto_242371 ) ) ( not ( = ?auto_242368 ?auto_242372 ) ) ( not ( = ?auto_242368 ?auto_242373 ) ) ( not ( = ?auto_242368 ?auto_242374 ) ) ( not ( = ?auto_242368 ?auto_242375 ) ) ( not ( = ?auto_242368 ?auto_242376 ) ) ( not ( = ?auto_242368 ?auto_242377 ) ) ( not ( = ?auto_242368 ?auto_242378 ) ) ( not ( = ?auto_242368 ?auto_242379 ) ) ( not ( = ?auto_242368 ?auto_242380 ) ) ( not ( = ?auto_242369 ?auto_242370 ) ) ( not ( = ?auto_242369 ?auto_242371 ) ) ( not ( = ?auto_242369 ?auto_242372 ) ) ( not ( = ?auto_242369 ?auto_242373 ) ) ( not ( = ?auto_242369 ?auto_242374 ) ) ( not ( = ?auto_242369 ?auto_242375 ) ) ( not ( = ?auto_242369 ?auto_242376 ) ) ( not ( = ?auto_242369 ?auto_242377 ) ) ( not ( = ?auto_242369 ?auto_242378 ) ) ( not ( = ?auto_242369 ?auto_242379 ) ) ( not ( = ?auto_242369 ?auto_242380 ) ) ( not ( = ?auto_242370 ?auto_242371 ) ) ( not ( = ?auto_242370 ?auto_242372 ) ) ( not ( = ?auto_242370 ?auto_242373 ) ) ( not ( = ?auto_242370 ?auto_242374 ) ) ( not ( = ?auto_242370 ?auto_242375 ) ) ( not ( = ?auto_242370 ?auto_242376 ) ) ( not ( = ?auto_242370 ?auto_242377 ) ) ( not ( = ?auto_242370 ?auto_242378 ) ) ( not ( = ?auto_242370 ?auto_242379 ) ) ( not ( = ?auto_242370 ?auto_242380 ) ) ( not ( = ?auto_242371 ?auto_242372 ) ) ( not ( = ?auto_242371 ?auto_242373 ) ) ( not ( = ?auto_242371 ?auto_242374 ) ) ( not ( = ?auto_242371 ?auto_242375 ) ) ( not ( = ?auto_242371 ?auto_242376 ) ) ( not ( = ?auto_242371 ?auto_242377 ) ) ( not ( = ?auto_242371 ?auto_242378 ) ) ( not ( = ?auto_242371 ?auto_242379 ) ) ( not ( = ?auto_242371 ?auto_242380 ) ) ( not ( = ?auto_242372 ?auto_242373 ) ) ( not ( = ?auto_242372 ?auto_242374 ) ) ( not ( = ?auto_242372 ?auto_242375 ) ) ( not ( = ?auto_242372 ?auto_242376 ) ) ( not ( = ?auto_242372 ?auto_242377 ) ) ( not ( = ?auto_242372 ?auto_242378 ) ) ( not ( = ?auto_242372 ?auto_242379 ) ) ( not ( = ?auto_242372 ?auto_242380 ) ) ( not ( = ?auto_242373 ?auto_242374 ) ) ( not ( = ?auto_242373 ?auto_242375 ) ) ( not ( = ?auto_242373 ?auto_242376 ) ) ( not ( = ?auto_242373 ?auto_242377 ) ) ( not ( = ?auto_242373 ?auto_242378 ) ) ( not ( = ?auto_242373 ?auto_242379 ) ) ( not ( = ?auto_242373 ?auto_242380 ) ) ( not ( = ?auto_242374 ?auto_242375 ) ) ( not ( = ?auto_242374 ?auto_242376 ) ) ( not ( = ?auto_242374 ?auto_242377 ) ) ( not ( = ?auto_242374 ?auto_242378 ) ) ( not ( = ?auto_242374 ?auto_242379 ) ) ( not ( = ?auto_242374 ?auto_242380 ) ) ( not ( = ?auto_242375 ?auto_242376 ) ) ( not ( = ?auto_242375 ?auto_242377 ) ) ( not ( = ?auto_242375 ?auto_242378 ) ) ( not ( = ?auto_242375 ?auto_242379 ) ) ( not ( = ?auto_242375 ?auto_242380 ) ) ( not ( = ?auto_242376 ?auto_242377 ) ) ( not ( = ?auto_242376 ?auto_242378 ) ) ( not ( = ?auto_242376 ?auto_242379 ) ) ( not ( = ?auto_242376 ?auto_242380 ) ) ( not ( = ?auto_242377 ?auto_242378 ) ) ( not ( = ?auto_242377 ?auto_242379 ) ) ( not ( = ?auto_242377 ?auto_242380 ) ) ( not ( = ?auto_242378 ?auto_242379 ) ) ( not ( = ?auto_242378 ?auto_242380 ) ) ( not ( = ?auto_242379 ?auto_242380 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_242379 ?auto_242380 )
      ( !STACK ?auto_242379 ?auto_242378 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_242393 - BLOCK
      ?auto_242394 - BLOCK
      ?auto_242395 - BLOCK
      ?auto_242396 - BLOCK
      ?auto_242397 - BLOCK
      ?auto_242398 - BLOCK
      ?auto_242399 - BLOCK
      ?auto_242400 - BLOCK
      ?auto_242401 - BLOCK
      ?auto_242402 - BLOCK
      ?auto_242403 - BLOCK
      ?auto_242404 - BLOCK
    )
    :vars
    (
      ?auto_242405 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_242403 ) ( ON ?auto_242404 ?auto_242405 ) ( CLEAR ?auto_242404 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_242393 ) ( ON ?auto_242394 ?auto_242393 ) ( ON ?auto_242395 ?auto_242394 ) ( ON ?auto_242396 ?auto_242395 ) ( ON ?auto_242397 ?auto_242396 ) ( ON ?auto_242398 ?auto_242397 ) ( ON ?auto_242399 ?auto_242398 ) ( ON ?auto_242400 ?auto_242399 ) ( ON ?auto_242401 ?auto_242400 ) ( ON ?auto_242402 ?auto_242401 ) ( ON ?auto_242403 ?auto_242402 ) ( not ( = ?auto_242393 ?auto_242394 ) ) ( not ( = ?auto_242393 ?auto_242395 ) ) ( not ( = ?auto_242393 ?auto_242396 ) ) ( not ( = ?auto_242393 ?auto_242397 ) ) ( not ( = ?auto_242393 ?auto_242398 ) ) ( not ( = ?auto_242393 ?auto_242399 ) ) ( not ( = ?auto_242393 ?auto_242400 ) ) ( not ( = ?auto_242393 ?auto_242401 ) ) ( not ( = ?auto_242393 ?auto_242402 ) ) ( not ( = ?auto_242393 ?auto_242403 ) ) ( not ( = ?auto_242393 ?auto_242404 ) ) ( not ( = ?auto_242393 ?auto_242405 ) ) ( not ( = ?auto_242394 ?auto_242395 ) ) ( not ( = ?auto_242394 ?auto_242396 ) ) ( not ( = ?auto_242394 ?auto_242397 ) ) ( not ( = ?auto_242394 ?auto_242398 ) ) ( not ( = ?auto_242394 ?auto_242399 ) ) ( not ( = ?auto_242394 ?auto_242400 ) ) ( not ( = ?auto_242394 ?auto_242401 ) ) ( not ( = ?auto_242394 ?auto_242402 ) ) ( not ( = ?auto_242394 ?auto_242403 ) ) ( not ( = ?auto_242394 ?auto_242404 ) ) ( not ( = ?auto_242394 ?auto_242405 ) ) ( not ( = ?auto_242395 ?auto_242396 ) ) ( not ( = ?auto_242395 ?auto_242397 ) ) ( not ( = ?auto_242395 ?auto_242398 ) ) ( not ( = ?auto_242395 ?auto_242399 ) ) ( not ( = ?auto_242395 ?auto_242400 ) ) ( not ( = ?auto_242395 ?auto_242401 ) ) ( not ( = ?auto_242395 ?auto_242402 ) ) ( not ( = ?auto_242395 ?auto_242403 ) ) ( not ( = ?auto_242395 ?auto_242404 ) ) ( not ( = ?auto_242395 ?auto_242405 ) ) ( not ( = ?auto_242396 ?auto_242397 ) ) ( not ( = ?auto_242396 ?auto_242398 ) ) ( not ( = ?auto_242396 ?auto_242399 ) ) ( not ( = ?auto_242396 ?auto_242400 ) ) ( not ( = ?auto_242396 ?auto_242401 ) ) ( not ( = ?auto_242396 ?auto_242402 ) ) ( not ( = ?auto_242396 ?auto_242403 ) ) ( not ( = ?auto_242396 ?auto_242404 ) ) ( not ( = ?auto_242396 ?auto_242405 ) ) ( not ( = ?auto_242397 ?auto_242398 ) ) ( not ( = ?auto_242397 ?auto_242399 ) ) ( not ( = ?auto_242397 ?auto_242400 ) ) ( not ( = ?auto_242397 ?auto_242401 ) ) ( not ( = ?auto_242397 ?auto_242402 ) ) ( not ( = ?auto_242397 ?auto_242403 ) ) ( not ( = ?auto_242397 ?auto_242404 ) ) ( not ( = ?auto_242397 ?auto_242405 ) ) ( not ( = ?auto_242398 ?auto_242399 ) ) ( not ( = ?auto_242398 ?auto_242400 ) ) ( not ( = ?auto_242398 ?auto_242401 ) ) ( not ( = ?auto_242398 ?auto_242402 ) ) ( not ( = ?auto_242398 ?auto_242403 ) ) ( not ( = ?auto_242398 ?auto_242404 ) ) ( not ( = ?auto_242398 ?auto_242405 ) ) ( not ( = ?auto_242399 ?auto_242400 ) ) ( not ( = ?auto_242399 ?auto_242401 ) ) ( not ( = ?auto_242399 ?auto_242402 ) ) ( not ( = ?auto_242399 ?auto_242403 ) ) ( not ( = ?auto_242399 ?auto_242404 ) ) ( not ( = ?auto_242399 ?auto_242405 ) ) ( not ( = ?auto_242400 ?auto_242401 ) ) ( not ( = ?auto_242400 ?auto_242402 ) ) ( not ( = ?auto_242400 ?auto_242403 ) ) ( not ( = ?auto_242400 ?auto_242404 ) ) ( not ( = ?auto_242400 ?auto_242405 ) ) ( not ( = ?auto_242401 ?auto_242402 ) ) ( not ( = ?auto_242401 ?auto_242403 ) ) ( not ( = ?auto_242401 ?auto_242404 ) ) ( not ( = ?auto_242401 ?auto_242405 ) ) ( not ( = ?auto_242402 ?auto_242403 ) ) ( not ( = ?auto_242402 ?auto_242404 ) ) ( not ( = ?auto_242402 ?auto_242405 ) ) ( not ( = ?auto_242403 ?auto_242404 ) ) ( not ( = ?auto_242403 ?auto_242405 ) ) ( not ( = ?auto_242404 ?auto_242405 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_242404 ?auto_242405 )
      ( !STACK ?auto_242404 ?auto_242403 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_242418 - BLOCK
      ?auto_242419 - BLOCK
      ?auto_242420 - BLOCK
      ?auto_242421 - BLOCK
      ?auto_242422 - BLOCK
      ?auto_242423 - BLOCK
      ?auto_242424 - BLOCK
      ?auto_242425 - BLOCK
      ?auto_242426 - BLOCK
      ?auto_242427 - BLOCK
      ?auto_242428 - BLOCK
      ?auto_242429 - BLOCK
    )
    :vars
    (
      ?auto_242430 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_242429 ?auto_242430 ) ( ON-TABLE ?auto_242418 ) ( ON ?auto_242419 ?auto_242418 ) ( ON ?auto_242420 ?auto_242419 ) ( ON ?auto_242421 ?auto_242420 ) ( ON ?auto_242422 ?auto_242421 ) ( ON ?auto_242423 ?auto_242422 ) ( ON ?auto_242424 ?auto_242423 ) ( ON ?auto_242425 ?auto_242424 ) ( ON ?auto_242426 ?auto_242425 ) ( ON ?auto_242427 ?auto_242426 ) ( not ( = ?auto_242418 ?auto_242419 ) ) ( not ( = ?auto_242418 ?auto_242420 ) ) ( not ( = ?auto_242418 ?auto_242421 ) ) ( not ( = ?auto_242418 ?auto_242422 ) ) ( not ( = ?auto_242418 ?auto_242423 ) ) ( not ( = ?auto_242418 ?auto_242424 ) ) ( not ( = ?auto_242418 ?auto_242425 ) ) ( not ( = ?auto_242418 ?auto_242426 ) ) ( not ( = ?auto_242418 ?auto_242427 ) ) ( not ( = ?auto_242418 ?auto_242428 ) ) ( not ( = ?auto_242418 ?auto_242429 ) ) ( not ( = ?auto_242418 ?auto_242430 ) ) ( not ( = ?auto_242419 ?auto_242420 ) ) ( not ( = ?auto_242419 ?auto_242421 ) ) ( not ( = ?auto_242419 ?auto_242422 ) ) ( not ( = ?auto_242419 ?auto_242423 ) ) ( not ( = ?auto_242419 ?auto_242424 ) ) ( not ( = ?auto_242419 ?auto_242425 ) ) ( not ( = ?auto_242419 ?auto_242426 ) ) ( not ( = ?auto_242419 ?auto_242427 ) ) ( not ( = ?auto_242419 ?auto_242428 ) ) ( not ( = ?auto_242419 ?auto_242429 ) ) ( not ( = ?auto_242419 ?auto_242430 ) ) ( not ( = ?auto_242420 ?auto_242421 ) ) ( not ( = ?auto_242420 ?auto_242422 ) ) ( not ( = ?auto_242420 ?auto_242423 ) ) ( not ( = ?auto_242420 ?auto_242424 ) ) ( not ( = ?auto_242420 ?auto_242425 ) ) ( not ( = ?auto_242420 ?auto_242426 ) ) ( not ( = ?auto_242420 ?auto_242427 ) ) ( not ( = ?auto_242420 ?auto_242428 ) ) ( not ( = ?auto_242420 ?auto_242429 ) ) ( not ( = ?auto_242420 ?auto_242430 ) ) ( not ( = ?auto_242421 ?auto_242422 ) ) ( not ( = ?auto_242421 ?auto_242423 ) ) ( not ( = ?auto_242421 ?auto_242424 ) ) ( not ( = ?auto_242421 ?auto_242425 ) ) ( not ( = ?auto_242421 ?auto_242426 ) ) ( not ( = ?auto_242421 ?auto_242427 ) ) ( not ( = ?auto_242421 ?auto_242428 ) ) ( not ( = ?auto_242421 ?auto_242429 ) ) ( not ( = ?auto_242421 ?auto_242430 ) ) ( not ( = ?auto_242422 ?auto_242423 ) ) ( not ( = ?auto_242422 ?auto_242424 ) ) ( not ( = ?auto_242422 ?auto_242425 ) ) ( not ( = ?auto_242422 ?auto_242426 ) ) ( not ( = ?auto_242422 ?auto_242427 ) ) ( not ( = ?auto_242422 ?auto_242428 ) ) ( not ( = ?auto_242422 ?auto_242429 ) ) ( not ( = ?auto_242422 ?auto_242430 ) ) ( not ( = ?auto_242423 ?auto_242424 ) ) ( not ( = ?auto_242423 ?auto_242425 ) ) ( not ( = ?auto_242423 ?auto_242426 ) ) ( not ( = ?auto_242423 ?auto_242427 ) ) ( not ( = ?auto_242423 ?auto_242428 ) ) ( not ( = ?auto_242423 ?auto_242429 ) ) ( not ( = ?auto_242423 ?auto_242430 ) ) ( not ( = ?auto_242424 ?auto_242425 ) ) ( not ( = ?auto_242424 ?auto_242426 ) ) ( not ( = ?auto_242424 ?auto_242427 ) ) ( not ( = ?auto_242424 ?auto_242428 ) ) ( not ( = ?auto_242424 ?auto_242429 ) ) ( not ( = ?auto_242424 ?auto_242430 ) ) ( not ( = ?auto_242425 ?auto_242426 ) ) ( not ( = ?auto_242425 ?auto_242427 ) ) ( not ( = ?auto_242425 ?auto_242428 ) ) ( not ( = ?auto_242425 ?auto_242429 ) ) ( not ( = ?auto_242425 ?auto_242430 ) ) ( not ( = ?auto_242426 ?auto_242427 ) ) ( not ( = ?auto_242426 ?auto_242428 ) ) ( not ( = ?auto_242426 ?auto_242429 ) ) ( not ( = ?auto_242426 ?auto_242430 ) ) ( not ( = ?auto_242427 ?auto_242428 ) ) ( not ( = ?auto_242427 ?auto_242429 ) ) ( not ( = ?auto_242427 ?auto_242430 ) ) ( not ( = ?auto_242428 ?auto_242429 ) ) ( not ( = ?auto_242428 ?auto_242430 ) ) ( not ( = ?auto_242429 ?auto_242430 ) ) ( CLEAR ?auto_242427 ) ( ON ?auto_242428 ?auto_242429 ) ( CLEAR ?auto_242428 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_242418 ?auto_242419 ?auto_242420 ?auto_242421 ?auto_242422 ?auto_242423 ?auto_242424 ?auto_242425 ?auto_242426 ?auto_242427 ?auto_242428 )
      ( MAKE-12PILE ?auto_242418 ?auto_242419 ?auto_242420 ?auto_242421 ?auto_242422 ?auto_242423 ?auto_242424 ?auto_242425 ?auto_242426 ?auto_242427 ?auto_242428 ?auto_242429 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_242443 - BLOCK
      ?auto_242444 - BLOCK
      ?auto_242445 - BLOCK
      ?auto_242446 - BLOCK
      ?auto_242447 - BLOCK
      ?auto_242448 - BLOCK
      ?auto_242449 - BLOCK
      ?auto_242450 - BLOCK
      ?auto_242451 - BLOCK
      ?auto_242452 - BLOCK
      ?auto_242453 - BLOCK
      ?auto_242454 - BLOCK
    )
    :vars
    (
      ?auto_242455 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_242454 ?auto_242455 ) ( ON-TABLE ?auto_242443 ) ( ON ?auto_242444 ?auto_242443 ) ( ON ?auto_242445 ?auto_242444 ) ( ON ?auto_242446 ?auto_242445 ) ( ON ?auto_242447 ?auto_242446 ) ( ON ?auto_242448 ?auto_242447 ) ( ON ?auto_242449 ?auto_242448 ) ( ON ?auto_242450 ?auto_242449 ) ( ON ?auto_242451 ?auto_242450 ) ( ON ?auto_242452 ?auto_242451 ) ( not ( = ?auto_242443 ?auto_242444 ) ) ( not ( = ?auto_242443 ?auto_242445 ) ) ( not ( = ?auto_242443 ?auto_242446 ) ) ( not ( = ?auto_242443 ?auto_242447 ) ) ( not ( = ?auto_242443 ?auto_242448 ) ) ( not ( = ?auto_242443 ?auto_242449 ) ) ( not ( = ?auto_242443 ?auto_242450 ) ) ( not ( = ?auto_242443 ?auto_242451 ) ) ( not ( = ?auto_242443 ?auto_242452 ) ) ( not ( = ?auto_242443 ?auto_242453 ) ) ( not ( = ?auto_242443 ?auto_242454 ) ) ( not ( = ?auto_242443 ?auto_242455 ) ) ( not ( = ?auto_242444 ?auto_242445 ) ) ( not ( = ?auto_242444 ?auto_242446 ) ) ( not ( = ?auto_242444 ?auto_242447 ) ) ( not ( = ?auto_242444 ?auto_242448 ) ) ( not ( = ?auto_242444 ?auto_242449 ) ) ( not ( = ?auto_242444 ?auto_242450 ) ) ( not ( = ?auto_242444 ?auto_242451 ) ) ( not ( = ?auto_242444 ?auto_242452 ) ) ( not ( = ?auto_242444 ?auto_242453 ) ) ( not ( = ?auto_242444 ?auto_242454 ) ) ( not ( = ?auto_242444 ?auto_242455 ) ) ( not ( = ?auto_242445 ?auto_242446 ) ) ( not ( = ?auto_242445 ?auto_242447 ) ) ( not ( = ?auto_242445 ?auto_242448 ) ) ( not ( = ?auto_242445 ?auto_242449 ) ) ( not ( = ?auto_242445 ?auto_242450 ) ) ( not ( = ?auto_242445 ?auto_242451 ) ) ( not ( = ?auto_242445 ?auto_242452 ) ) ( not ( = ?auto_242445 ?auto_242453 ) ) ( not ( = ?auto_242445 ?auto_242454 ) ) ( not ( = ?auto_242445 ?auto_242455 ) ) ( not ( = ?auto_242446 ?auto_242447 ) ) ( not ( = ?auto_242446 ?auto_242448 ) ) ( not ( = ?auto_242446 ?auto_242449 ) ) ( not ( = ?auto_242446 ?auto_242450 ) ) ( not ( = ?auto_242446 ?auto_242451 ) ) ( not ( = ?auto_242446 ?auto_242452 ) ) ( not ( = ?auto_242446 ?auto_242453 ) ) ( not ( = ?auto_242446 ?auto_242454 ) ) ( not ( = ?auto_242446 ?auto_242455 ) ) ( not ( = ?auto_242447 ?auto_242448 ) ) ( not ( = ?auto_242447 ?auto_242449 ) ) ( not ( = ?auto_242447 ?auto_242450 ) ) ( not ( = ?auto_242447 ?auto_242451 ) ) ( not ( = ?auto_242447 ?auto_242452 ) ) ( not ( = ?auto_242447 ?auto_242453 ) ) ( not ( = ?auto_242447 ?auto_242454 ) ) ( not ( = ?auto_242447 ?auto_242455 ) ) ( not ( = ?auto_242448 ?auto_242449 ) ) ( not ( = ?auto_242448 ?auto_242450 ) ) ( not ( = ?auto_242448 ?auto_242451 ) ) ( not ( = ?auto_242448 ?auto_242452 ) ) ( not ( = ?auto_242448 ?auto_242453 ) ) ( not ( = ?auto_242448 ?auto_242454 ) ) ( not ( = ?auto_242448 ?auto_242455 ) ) ( not ( = ?auto_242449 ?auto_242450 ) ) ( not ( = ?auto_242449 ?auto_242451 ) ) ( not ( = ?auto_242449 ?auto_242452 ) ) ( not ( = ?auto_242449 ?auto_242453 ) ) ( not ( = ?auto_242449 ?auto_242454 ) ) ( not ( = ?auto_242449 ?auto_242455 ) ) ( not ( = ?auto_242450 ?auto_242451 ) ) ( not ( = ?auto_242450 ?auto_242452 ) ) ( not ( = ?auto_242450 ?auto_242453 ) ) ( not ( = ?auto_242450 ?auto_242454 ) ) ( not ( = ?auto_242450 ?auto_242455 ) ) ( not ( = ?auto_242451 ?auto_242452 ) ) ( not ( = ?auto_242451 ?auto_242453 ) ) ( not ( = ?auto_242451 ?auto_242454 ) ) ( not ( = ?auto_242451 ?auto_242455 ) ) ( not ( = ?auto_242452 ?auto_242453 ) ) ( not ( = ?auto_242452 ?auto_242454 ) ) ( not ( = ?auto_242452 ?auto_242455 ) ) ( not ( = ?auto_242453 ?auto_242454 ) ) ( not ( = ?auto_242453 ?auto_242455 ) ) ( not ( = ?auto_242454 ?auto_242455 ) ) ( CLEAR ?auto_242452 ) ( ON ?auto_242453 ?auto_242454 ) ( CLEAR ?auto_242453 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_242443 ?auto_242444 ?auto_242445 ?auto_242446 ?auto_242447 ?auto_242448 ?auto_242449 ?auto_242450 ?auto_242451 ?auto_242452 ?auto_242453 )
      ( MAKE-12PILE ?auto_242443 ?auto_242444 ?auto_242445 ?auto_242446 ?auto_242447 ?auto_242448 ?auto_242449 ?auto_242450 ?auto_242451 ?auto_242452 ?auto_242453 ?auto_242454 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_242468 - BLOCK
      ?auto_242469 - BLOCK
      ?auto_242470 - BLOCK
      ?auto_242471 - BLOCK
      ?auto_242472 - BLOCK
      ?auto_242473 - BLOCK
      ?auto_242474 - BLOCK
      ?auto_242475 - BLOCK
      ?auto_242476 - BLOCK
      ?auto_242477 - BLOCK
      ?auto_242478 - BLOCK
      ?auto_242479 - BLOCK
    )
    :vars
    (
      ?auto_242480 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_242479 ?auto_242480 ) ( ON-TABLE ?auto_242468 ) ( ON ?auto_242469 ?auto_242468 ) ( ON ?auto_242470 ?auto_242469 ) ( ON ?auto_242471 ?auto_242470 ) ( ON ?auto_242472 ?auto_242471 ) ( ON ?auto_242473 ?auto_242472 ) ( ON ?auto_242474 ?auto_242473 ) ( ON ?auto_242475 ?auto_242474 ) ( ON ?auto_242476 ?auto_242475 ) ( not ( = ?auto_242468 ?auto_242469 ) ) ( not ( = ?auto_242468 ?auto_242470 ) ) ( not ( = ?auto_242468 ?auto_242471 ) ) ( not ( = ?auto_242468 ?auto_242472 ) ) ( not ( = ?auto_242468 ?auto_242473 ) ) ( not ( = ?auto_242468 ?auto_242474 ) ) ( not ( = ?auto_242468 ?auto_242475 ) ) ( not ( = ?auto_242468 ?auto_242476 ) ) ( not ( = ?auto_242468 ?auto_242477 ) ) ( not ( = ?auto_242468 ?auto_242478 ) ) ( not ( = ?auto_242468 ?auto_242479 ) ) ( not ( = ?auto_242468 ?auto_242480 ) ) ( not ( = ?auto_242469 ?auto_242470 ) ) ( not ( = ?auto_242469 ?auto_242471 ) ) ( not ( = ?auto_242469 ?auto_242472 ) ) ( not ( = ?auto_242469 ?auto_242473 ) ) ( not ( = ?auto_242469 ?auto_242474 ) ) ( not ( = ?auto_242469 ?auto_242475 ) ) ( not ( = ?auto_242469 ?auto_242476 ) ) ( not ( = ?auto_242469 ?auto_242477 ) ) ( not ( = ?auto_242469 ?auto_242478 ) ) ( not ( = ?auto_242469 ?auto_242479 ) ) ( not ( = ?auto_242469 ?auto_242480 ) ) ( not ( = ?auto_242470 ?auto_242471 ) ) ( not ( = ?auto_242470 ?auto_242472 ) ) ( not ( = ?auto_242470 ?auto_242473 ) ) ( not ( = ?auto_242470 ?auto_242474 ) ) ( not ( = ?auto_242470 ?auto_242475 ) ) ( not ( = ?auto_242470 ?auto_242476 ) ) ( not ( = ?auto_242470 ?auto_242477 ) ) ( not ( = ?auto_242470 ?auto_242478 ) ) ( not ( = ?auto_242470 ?auto_242479 ) ) ( not ( = ?auto_242470 ?auto_242480 ) ) ( not ( = ?auto_242471 ?auto_242472 ) ) ( not ( = ?auto_242471 ?auto_242473 ) ) ( not ( = ?auto_242471 ?auto_242474 ) ) ( not ( = ?auto_242471 ?auto_242475 ) ) ( not ( = ?auto_242471 ?auto_242476 ) ) ( not ( = ?auto_242471 ?auto_242477 ) ) ( not ( = ?auto_242471 ?auto_242478 ) ) ( not ( = ?auto_242471 ?auto_242479 ) ) ( not ( = ?auto_242471 ?auto_242480 ) ) ( not ( = ?auto_242472 ?auto_242473 ) ) ( not ( = ?auto_242472 ?auto_242474 ) ) ( not ( = ?auto_242472 ?auto_242475 ) ) ( not ( = ?auto_242472 ?auto_242476 ) ) ( not ( = ?auto_242472 ?auto_242477 ) ) ( not ( = ?auto_242472 ?auto_242478 ) ) ( not ( = ?auto_242472 ?auto_242479 ) ) ( not ( = ?auto_242472 ?auto_242480 ) ) ( not ( = ?auto_242473 ?auto_242474 ) ) ( not ( = ?auto_242473 ?auto_242475 ) ) ( not ( = ?auto_242473 ?auto_242476 ) ) ( not ( = ?auto_242473 ?auto_242477 ) ) ( not ( = ?auto_242473 ?auto_242478 ) ) ( not ( = ?auto_242473 ?auto_242479 ) ) ( not ( = ?auto_242473 ?auto_242480 ) ) ( not ( = ?auto_242474 ?auto_242475 ) ) ( not ( = ?auto_242474 ?auto_242476 ) ) ( not ( = ?auto_242474 ?auto_242477 ) ) ( not ( = ?auto_242474 ?auto_242478 ) ) ( not ( = ?auto_242474 ?auto_242479 ) ) ( not ( = ?auto_242474 ?auto_242480 ) ) ( not ( = ?auto_242475 ?auto_242476 ) ) ( not ( = ?auto_242475 ?auto_242477 ) ) ( not ( = ?auto_242475 ?auto_242478 ) ) ( not ( = ?auto_242475 ?auto_242479 ) ) ( not ( = ?auto_242475 ?auto_242480 ) ) ( not ( = ?auto_242476 ?auto_242477 ) ) ( not ( = ?auto_242476 ?auto_242478 ) ) ( not ( = ?auto_242476 ?auto_242479 ) ) ( not ( = ?auto_242476 ?auto_242480 ) ) ( not ( = ?auto_242477 ?auto_242478 ) ) ( not ( = ?auto_242477 ?auto_242479 ) ) ( not ( = ?auto_242477 ?auto_242480 ) ) ( not ( = ?auto_242478 ?auto_242479 ) ) ( not ( = ?auto_242478 ?auto_242480 ) ) ( not ( = ?auto_242479 ?auto_242480 ) ) ( ON ?auto_242478 ?auto_242479 ) ( CLEAR ?auto_242476 ) ( ON ?auto_242477 ?auto_242478 ) ( CLEAR ?auto_242477 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_242468 ?auto_242469 ?auto_242470 ?auto_242471 ?auto_242472 ?auto_242473 ?auto_242474 ?auto_242475 ?auto_242476 ?auto_242477 )
      ( MAKE-12PILE ?auto_242468 ?auto_242469 ?auto_242470 ?auto_242471 ?auto_242472 ?auto_242473 ?auto_242474 ?auto_242475 ?auto_242476 ?auto_242477 ?auto_242478 ?auto_242479 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_242493 - BLOCK
      ?auto_242494 - BLOCK
      ?auto_242495 - BLOCK
      ?auto_242496 - BLOCK
      ?auto_242497 - BLOCK
      ?auto_242498 - BLOCK
      ?auto_242499 - BLOCK
      ?auto_242500 - BLOCK
      ?auto_242501 - BLOCK
      ?auto_242502 - BLOCK
      ?auto_242503 - BLOCK
      ?auto_242504 - BLOCK
    )
    :vars
    (
      ?auto_242505 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_242504 ?auto_242505 ) ( ON-TABLE ?auto_242493 ) ( ON ?auto_242494 ?auto_242493 ) ( ON ?auto_242495 ?auto_242494 ) ( ON ?auto_242496 ?auto_242495 ) ( ON ?auto_242497 ?auto_242496 ) ( ON ?auto_242498 ?auto_242497 ) ( ON ?auto_242499 ?auto_242498 ) ( ON ?auto_242500 ?auto_242499 ) ( ON ?auto_242501 ?auto_242500 ) ( not ( = ?auto_242493 ?auto_242494 ) ) ( not ( = ?auto_242493 ?auto_242495 ) ) ( not ( = ?auto_242493 ?auto_242496 ) ) ( not ( = ?auto_242493 ?auto_242497 ) ) ( not ( = ?auto_242493 ?auto_242498 ) ) ( not ( = ?auto_242493 ?auto_242499 ) ) ( not ( = ?auto_242493 ?auto_242500 ) ) ( not ( = ?auto_242493 ?auto_242501 ) ) ( not ( = ?auto_242493 ?auto_242502 ) ) ( not ( = ?auto_242493 ?auto_242503 ) ) ( not ( = ?auto_242493 ?auto_242504 ) ) ( not ( = ?auto_242493 ?auto_242505 ) ) ( not ( = ?auto_242494 ?auto_242495 ) ) ( not ( = ?auto_242494 ?auto_242496 ) ) ( not ( = ?auto_242494 ?auto_242497 ) ) ( not ( = ?auto_242494 ?auto_242498 ) ) ( not ( = ?auto_242494 ?auto_242499 ) ) ( not ( = ?auto_242494 ?auto_242500 ) ) ( not ( = ?auto_242494 ?auto_242501 ) ) ( not ( = ?auto_242494 ?auto_242502 ) ) ( not ( = ?auto_242494 ?auto_242503 ) ) ( not ( = ?auto_242494 ?auto_242504 ) ) ( not ( = ?auto_242494 ?auto_242505 ) ) ( not ( = ?auto_242495 ?auto_242496 ) ) ( not ( = ?auto_242495 ?auto_242497 ) ) ( not ( = ?auto_242495 ?auto_242498 ) ) ( not ( = ?auto_242495 ?auto_242499 ) ) ( not ( = ?auto_242495 ?auto_242500 ) ) ( not ( = ?auto_242495 ?auto_242501 ) ) ( not ( = ?auto_242495 ?auto_242502 ) ) ( not ( = ?auto_242495 ?auto_242503 ) ) ( not ( = ?auto_242495 ?auto_242504 ) ) ( not ( = ?auto_242495 ?auto_242505 ) ) ( not ( = ?auto_242496 ?auto_242497 ) ) ( not ( = ?auto_242496 ?auto_242498 ) ) ( not ( = ?auto_242496 ?auto_242499 ) ) ( not ( = ?auto_242496 ?auto_242500 ) ) ( not ( = ?auto_242496 ?auto_242501 ) ) ( not ( = ?auto_242496 ?auto_242502 ) ) ( not ( = ?auto_242496 ?auto_242503 ) ) ( not ( = ?auto_242496 ?auto_242504 ) ) ( not ( = ?auto_242496 ?auto_242505 ) ) ( not ( = ?auto_242497 ?auto_242498 ) ) ( not ( = ?auto_242497 ?auto_242499 ) ) ( not ( = ?auto_242497 ?auto_242500 ) ) ( not ( = ?auto_242497 ?auto_242501 ) ) ( not ( = ?auto_242497 ?auto_242502 ) ) ( not ( = ?auto_242497 ?auto_242503 ) ) ( not ( = ?auto_242497 ?auto_242504 ) ) ( not ( = ?auto_242497 ?auto_242505 ) ) ( not ( = ?auto_242498 ?auto_242499 ) ) ( not ( = ?auto_242498 ?auto_242500 ) ) ( not ( = ?auto_242498 ?auto_242501 ) ) ( not ( = ?auto_242498 ?auto_242502 ) ) ( not ( = ?auto_242498 ?auto_242503 ) ) ( not ( = ?auto_242498 ?auto_242504 ) ) ( not ( = ?auto_242498 ?auto_242505 ) ) ( not ( = ?auto_242499 ?auto_242500 ) ) ( not ( = ?auto_242499 ?auto_242501 ) ) ( not ( = ?auto_242499 ?auto_242502 ) ) ( not ( = ?auto_242499 ?auto_242503 ) ) ( not ( = ?auto_242499 ?auto_242504 ) ) ( not ( = ?auto_242499 ?auto_242505 ) ) ( not ( = ?auto_242500 ?auto_242501 ) ) ( not ( = ?auto_242500 ?auto_242502 ) ) ( not ( = ?auto_242500 ?auto_242503 ) ) ( not ( = ?auto_242500 ?auto_242504 ) ) ( not ( = ?auto_242500 ?auto_242505 ) ) ( not ( = ?auto_242501 ?auto_242502 ) ) ( not ( = ?auto_242501 ?auto_242503 ) ) ( not ( = ?auto_242501 ?auto_242504 ) ) ( not ( = ?auto_242501 ?auto_242505 ) ) ( not ( = ?auto_242502 ?auto_242503 ) ) ( not ( = ?auto_242502 ?auto_242504 ) ) ( not ( = ?auto_242502 ?auto_242505 ) ) ( not ( = ?auto_242503 ?auto_242504 ) ) ( not ( = ?auto_242503 ?auto_242505 ) ) ( not ( = ?auto_242504 ?auto_242505 ) ) ( ON ?auto_242503 ?auto_242504 ) ( CLEAR ?auto_242501 ) ( ON ?auto_242502 ?auto_242503 ) ( CLEAR ?auto_242502 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_242493 ?auto_242494 ?auto_242495 ?auto_242496 ?auto_242497 ?auto_242498 ?auto_242499 ?auto_242500 ?auto_242501 ?auto_242502 )
      ( MAKE-12PILE ?auto_242493 ?auto_242494 ?auto_242495 ?auto_242496 ?auto_242497 ?auto_242498 ?auto_242499 ?auto_242500 ?auto_242501 ?auto_242502 ?auto_242503 ?auto_242504 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_242518 - BLOCK
      ?auto_242519 - BLOCK
      ?auto_242520 - BLOCK
      ?auto_242521 - BLOCK
      ?auto_242522 - BLOCK
      ?auto_242523 - BLOCK
      ?auto_242524 - BLOCK
      ?auto_242525 - BLOCK
      ?auto_242526 - BLOCK
      ?auto_242527 - BLOCK
      ?auto_242528 - BLOCK
      ?auto_242529 - BLOCK
    )
    :vars
    (
      ?auto_242530 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_242529 ?auto_242530 ) ( ON-TABLE ?auto_242518 ) ( ON ?auto_242519 ?auto_242518 ) ( ON ?auto_242520 ?auto_242519 ) ( ON ?auto_242521 ?auto_242520 ) ( ON ?auto_242522 ?auto_242521 ) ( ON ?auto_242523 ?auto_242522 ) ( ON ?auto_242524 ?auto_242523 ) ( ON ?auto_242525 ?auto_242524 ) ( not ( = ?auto_242518 ?auto_242519 ) ) ( not ( = ?auto_242518 ?auto_242520 ) ) ( not ( = ?auto_242518 ?auto_242521 ) ) ( not ( = ?auto_242518 ?auto_242522 ) ) ( not ( = ?auto_242518 ?auto_242523 ) ) ( not ( = ?auto_242518 ?auto_242524 ) ) ( not ( = ?auto_242518 ?auto_242525 ) ) ( not ( = ?auto_242518 ?auto_242526 ) ) ( not ( = ?auto_242518 ?auto_242527 ) ) ( not ( = ?auto_242518 ?auto_242528 ) ) ( not ( = ?auto_242518 ?auto_242529 ) ) ( not ( = ?auto_242518 ?auto_242530 ) ) ( not ( = ?auto_242519 ?auto_242520 ) ) ( not ( = ?auto_242519 ?auto_242521 ) ) ( not ( = ?auto_242519 ?auto_242522 ) ) ( not ( = ?auto_242519 ?auto_242523 ) ) ( not ( = ?auto_242519 ?auto_242524 ) ) ( not ( = ?auto_242519 ?auto_242525 ) ) ( not ( = ?auto_242519 ?auto_242526 ) ) ( not ( = ?auto_242519 ?auto_242527 ) ) ( not ( = ?auto_242519 ?auto_242528 ) ) ( not ( = ?auto_242519 ?auto_242529 ) ) ( not ( = ?auto_242519 ?auto_242530 ) ) ( not ( = ?auto_242520 ?auto_242521 ) ) ( not ( = ?auto_242520 ?auto_242522 ) ) ( not ( = ?auto_242520 ?auto_242523 ) ) ( not ( = ?auto_242520 ?auto_242524 ) ) ( not ( = ?auto_242520 ?auto_242525 ) ) ( not ( = ?auto_242520 ?auto_242526 ) ) ( not ( = ?auto_242520 ?auto_242527 ) ) ( not ( = ?auto_242520 ?auto_242528 ) ) ( not ( = ?auto_242520 ?auto_242529 ) ) ( not ( = ?auto_242520 ?auto_242530 ) ) ( not ( = ?auto_242521 ?auto_242522 ) ) ( not ( = ?auto_242521 ?auto_242523 ) ) ( not ( = ?auto_242521 ?auto_242524 ) ) ( not ( = ?auto_242521 ?auto_242525 ) ) ( not ( = ?auto_242521 ?auto_242526 ) ) ( not ( = ?auto_242521 ?auto_242527 ) ) ( not ( = ?auto_242521 ?auto_242528 ) ) ( not ( = ?auto_242521 ?auto_242529 ) ) ( not ( = ?auto_242521 ?auto_242530 ) ) ( not ( = ?auto_242522 ?auto_242523 ) ) ( not ( = ?auto_242522 ?auto_242524 ) ) ( not ( = ?auto_242522 ?auto_242525 ) ) ( not ( = ?auto_242522 ?auto_242526 ) ) ( not ( = ?auto_242522 ?auto_242527 ) ) ( not ( = ?auto_242522 ?auto_242528 ) ) ( not ( = ?auto_242522 ?auto_242529 ) ) ( not ( = ?auto_242522 ?auto_242530 ) ) ( not ( = ?auto_242523 ?auto_242524 ) ) ( not ( = ?auto_242523 ?auto_242525 ) ) ( not ( = ?auto_242523 ?auto_242526 ) ) ( not ( = ?auto_242523 ?auto_242527 ) ) ( not ( = ?auto_242523 ?auto_242528 ) ) ( not ( = ?auto_242523 ?auto_242529 ) ) ( not ( = ?auto_242523 ?auto_242530 ) ) ( not ( = ?auto_242524 ?auto_242525 ) ) ( not ( = ?auto_242524 ?auto_242526 ) ) ( not ( = ?auto_242524 ?auto_242527 ) ) ( not ( = ?auto_242524 ?auto_242528 ) ) ( not ( = ?auto_242524 ?auto_242529 ) ) ( not ( = ?auto_242524 ?auto_242530 ) ) ( not ( = ?auto_242525 ?auto_242526 ) ) ( not ( = ?auto_242525 ?auto_242527 ) ) ( not ( = ?auto_242525 ?auto_242528 ) ) ( not ( = ?auto_242525 ?auto_242529 ) ) ( not ( = ?auto_242525 ?auto_242530 ) ) ( not ( = ?auto_242526 ?auto_242527 ) ) ( not ( = ?auto_242526 ?auto_242528 ) ) ( not ( = ?auto_242526 ?auto_242529 ) ) ( not ( = ?auto_242526 ?auto_242530 ) ) ( not ( = ?auto_242527 ?auto_242528 ) ) ( not ( = ?auto_242527 ?auto_242529 ) ) ( not ( = ?auto_242527 ?auto_242530 ) ) ( not ( = ?auto_242528 ?auto_242529 ) ) ( not ( = ?auto_242528 ?auto_242530 ) ) ( not ( = ?auto_242529 ?auto_242530 ) ) ( ON ?auto_242528 ?auto_242529 ) ( ON ?auto_242527 ?auto_242528 ) ( CLEAR ?auto_242525 ) ( ON ?auto_242526 ?auto_242527 ) ( CLEAR ?auto_242526 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_242518 ?auto_242519 ?auto_242520 ?auto_242521 ?auto_242522 ?auto_242523 ?auto_242524 ?auto_242525 ?auto_242526 )
      ( MAKE-12PILE ?auto_242518 ?auto_242519 ?auto_242520 ?auto_242521 ?auto_242522 ?auto_242523 ?auto_242524 ?auto_242525 ?auto_242526 ?auto_242527 ?auto_242528 ?auto_242529 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_242543 - BLOCK
      ?auto_242544 - BLOCK
      ?auto_242545 - BLOCK
      ?auto_242546 - BLOCK
      ?auto_242547 - BLOCK
      ?auto_242548 - BLOCK
      ?auto_242549 - BLOCK
      ?auto_242550 - BLOCK
      ?auto_242551 - BLOCK
      ?auto_242552 - BLOCK
      ?auto_242553 - BLOCK
      ?auto_242554 - BLOCK
    )
    :vars
    (
      ?auto_242555 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_242554 ?auto_242555 ) ( ON-TABLE ?auto_242543 ) ( ON ?auto_242544 ?auto_242543 ) ( ON ?auto_242545 ?auto_242544 ) ( ON ?auto_242546 ?auto_242545 ) ( ON ?auto_242547 ?auto_242546 ) ( ON ?auto_242548 ?auto_242547 ) ( ON ?auto_242549 ?auto_242548 ) ( ON ?auto_242550 ?auto_242549 ) ( not ( = ?auto_242543 ?auto_242544 ) ) ( not ( = ?auto_242543 ?auto_242545 ) ) ( not ( = ?auto_242543 ?auto_242546 ) ) ( not ( = ?auto_242543 ?auto_242547 ) ) ( not ( = ?auto_242543 ?auto_242548 ) ) ( not ( = ?auto_242543 ?auto_242549 ) ) ( not ( = ?auto_242543 ?auto_242550 ) ) ( not ( = ?auto_242543 ?auto_242551 ) ) ( not ( = ?auto_242543 ?auto_242552 ) ) ( not ( = ?auto_242543 ?auto_242553 ) ) ( not ( = ?auto_242543 ?auto_242554 ) ) ( not ( = ?auto_242543 ?auto_242555 ) ) ( not ( = ?auto_242544 ?auto_242545 ) ) ( not ( = ?auto_242544 ?auto_242546 ) ) ( not ( = ?auto_242544 ?auto_242547 ) ) ( not ( = ?auto_242544 ?auto_242548 ) ) ( not ( = ?auto_242544 ?auto_242549 ) ) ( not ( = ?auto_242544 ?auto_242550 ) ) ( not ( = ?auto_242544 ?auto_242551 ) ) ( not ( = ?auto_242544 ?auto_242552 ) ) ( not ( = ?auto_242544 ?auto_242553 ) ) ( not ( = ?auto_242544 ?auto_242554 ) ) ( not ( = ?auto_242544 ?auto_242555 ) ) ( not ( = ?auto_242545 ?auto_242546 ) ) ( not ( = ?auto_242545 ?auto_242547 ) ) ( not ( = ?auto_242545 ?auto_242548 ) ) ( not ( = ?auto_242545 ?auto_242549 ) ) ( not ( = ?auto_242545 ?auto_242550 ) ) ( not ( = ?auto_242545 ?auto_242551 ) ) ( not ( = ?auto_242545 ?auto_242552 ) ) ( not ( = ?auto_242545 ?auto_242553 ) ) ( not ( = ?auto_242545 ?auto_242554 ) ) ( not ( = ?auto_242545 ?auto_242555 ) ) ( not ( = ?auto_242546 ?auto_242547 ) ) ( not ( = ?auto_242546 ?auto_242548 ) ) ( not ( = ?auto_242546 ?auto_242549 ) ) ( not ( = ?auto_242546 ?auto_242550 ) ) ( not ( = ?auto_242546 ?auto_242551 ) ) ( not ( = ?auto_242546 ?auto_242552 ) ) ( not ( = ?auto_242546 ?auto_242553 ) ) ( not ( = ?auto_242546 ?auto_242554 ) ) ( not ( = ?auto_242546 ?auto_242555 ) ) ( not ( = ?auto_242547 ?auto_242548 ) ) ( not ( = ?auto_242547 ?auto_242549 ) ) ( not ( = ?auto_242547 ?auto_242550 ) ) ( not ( = ?auto_242547 ?auto_242551 ) ) ( not ( = ?auto_242547 ?auto_242552 ) ) ( not ( = ?auto_242547 ?auto_242553 ) ) ( not ( = ?auto_242547 ?auto_242554 ) ) ( not ( = ?auto_242547 ?auto_242555 ) ) ( not ( = ?auto_242548 ?auto_242549 ) ) ( not ( = ?auto_242548 ?auto_242550 ) ) ( not ( = ?auto_242548 ?auto_242551 ) ) ( not ( = ?auto_242548 ?auto_242552 ) ) ( not ( = ?auto_242548 ?auto_242553 ) ) ( not ( = ?auto_242548 ?auto_242554 ) ) ( not ( = ?auto_242548 ?auto_242555 ) ) ( not ( = ?auto_242549 ?auto_242550 ) ) ( not ( = ?auto_242549 ?auto_242551 ) ) ( not ( = ?auto_242549 ?auto_242552 ) ) ( not ( = ?auto_242549 ?auto_242553 ) ) ( not ( = ?auto_242549 ?auto_242554 ) ) ( not ( = ?auto_242549 ?auto_242555 ) ) ( not ( = ?auto_242550 ?auto_242551 ) ) ( not ( = ?auto_242550 ?auto_242552 ) ) ( not ( = ?auto_242550 ?auto_242553 ) ) ( not ( = ?auto_242550 ?auto_242554 ) ) ( not ( = ?auto_242550 ?auto_242555 ) ) ( not ( = ?auto_242551 ?auto_242552 ) ) ( not ( = ?auto_242551 ?auto_242553 ) ) ( not ( = ?auto_242551 ?auto_242554 ) ) ( not ( = ?auto_242551 ?auto_242555 ) ) ( not ( = ?auto_242552 ?auto_242553 ) ) ( not ( = ?auto_242552 ?auto_242554 ) ) ( not ( = ?auto_242552 ?auto_242555 ) ) ( not ( = ?auto_242553 ?auto_242554 ) ) ( not ( = ?auto_242553 ?auto_242555 ) ) ( not ( = ?auto_242554 ?auto_242555 ) ) ( ON ?auto_242553 ?auto_242554 ) ( ON ?auto_242552 ?auto_242553 ) ( CLEAR ?auto_242550 ) ( ON ?auto_242551 ?auto_242552 ) ( CLEAR ?auto_242551 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_242543 ?auto_242544 ?auto_242545 ?auto_242546 ?auto_242547 ?auto_242548 ?auto_242549 ?auto_242550 ?auto_242551 )
      ( MAKE-12PILE ?auto_242543 ?auto_242544 ?auto_242545 ?auto_242546 ?auto_242547 ?auto_242548 ?auto_242549 ?auto_242550 ?auto_242551 ?auto_242552 ?auto_242553 ?auto_242554 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_242568 - BLOCK
      ?auto_242569 - BLOCK
      ?auto_242570 - BLOCK
      ?auto_242571 - BLOCK
      ?auto_242572 - BLOCK
      ?auto_242573 - BLOCK
      ?auto_242574 - BLOCK
      ?auto_242575 - BLOCK
      ?auto_242576 - BLOCK
      ?auto_242577 - BLOCK
      ?auto_242578 - BLOCK
      ?auto_242579 - BLOCK
    )
    :vars
    (
      ?auto_242580 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_242579 ?auto_242580 ) ( ON-TABLE ?auto_242568 ) ( ON ?auto_242569 ?auto_242568 ) ( ON ?auto_242570 ?auto_242569 ) ( ON ?auto_242571 ?auto_242570 ) ( ON ?auto_242572 ?auto_242571 ) ( ON ?auto_242573 ?auto_242572 ) ( ON ?auto_242574 ?auto_242573 ) ( not ( = ?auto_242568 ?auto_242569 ) ) ( not ( = ?auto_242568 ?auto_242570 ) ) ( not ( = ?auto_242568 ?auto_242571 ) ) ( not ( = ?auto_242568 ?auto_242572 ) ) ( not ( = ?auto_242568 ?auto_242573 ) ) ( not ( = ?auto_242568 ?auto_242574 ) ) ( not ( = ?auto_242568 ?auto_242575 ) ) ( not ( = ?auto_242568 ?auto_242576 ) ) ( not ( = ?auto_242568 ?auto_242577 ) ) ( not ( = ?auto_242568 ?auto_242578 ) ) ( not ( = ?auto_242568 ?auto_242579 ) ) ( not ( = ?auto_242568 ?auto_242580 ) ) ( not ( = ?auto_242569 ?auto_242570 ) ) ( not ( = ?auto_242569 ?auto_242571 ) ) ( not ( = ?auto_242569 ?auto_242572 ) ) ( not ( = ?auto_242569 ?auto_242573 ) ) ( not ( = ?auto_242569 ?auto_242574 ) ) ( not ( = ?auto_242569 ?auto_242575 ) ) ( not ( = ?auto_242569 ?auto_242576 ) ) ( not ( = ?auto_242569 ?auto_242577 ) ) ( not ( = ?auto_242569 ?auto_242578 ) ) ( not ( = ?auto_242569 ?auto_242579 ) ) ( not ( = ?auto_242569 ?auto_242580 ) ) ( not ( = ?auto_242570 ?auto_242571 ) ) ( not ( = ?auto_242570 ?auto_242572 ) ) ( not ( = ?auto_242570 ?auto_242573 ) ) ( not ( = ?auto_242570 ?auto_242574 ) ) ( not ( = ?auto_242570 ?auto_242575 ) ) ( not ( = ?auto_242570 ?auto_242576 ) ) ( not ( = ?auto_242570 ?auto_242577 ) ) ( not ( = ?auto_242570 ?auto_242578 ) ) ( not ( = ?auto_242570 ?auto_242579 ) ) ( not ( = ?auto_242570 ?auto_242580 ) ) ( not ( = ?auto_242571 ?auto_242572 ) ) ( not ( = ?auto_242571 ?auto_242573 ) ) ( not ( = ?auto_242571 ?auto_242574 ) ) ( not ( = ?auto_242571 ?auto_242575 ) ) ( not ( = ?auto_242571 ?auto_242576 ) ) ( not ( = ?auto_242571 ?auto_242577 ) ) ( not ( = ?auto_242571 ?auto_242578 ) ) ( not ( = ?auto_242571 ?auto_242579 ) ) ( not ( = ?auto_242571 ?auto_242580 ) ) ( not ( = ?auto_242572 ?auto_242573 ) ) ( not ( = ?auto_242572 ?auto_242574 ) ) ( not ( = ?auto_242572 ?auto_242575 ) ) ( not ( = ?auto_242572 ?auto_242576 ) ) ( not ( = ?auto_242572 ?auto_242577 ) ) ( not ( = ?auto_242572 ?auto_242578 ) ) ( not ( = ?auto_242572 ?auto_242579 ) ) ( not ( = ?auto_242572 ?auto_242580 ) ) ( not ( = ?auto_242573 ?auto_242574 ) ) ( not ( = ?auto_242573 ?auto_242575 ) ) ( not ( = ?auto_242573 ?auto_242576 ) ) ( not ( = ?auto_242573 ?auto_242577 ) ) ( not ( = ?auto_242573 ?auto_242578 ) ) ( not ( = ?auto_242573 ?auto_242579 ) ) ( not ( = ?auto_242573 ?auto_242580 ) ) ( not ( = ?auto_242574 ?auto_242575 ) ) ( not ( = ?auto_242574 ?auto_242576 ) ) ( not ( = ?auto_242574 ?auto_242577 ) ) ( not ( = ?auto_242574 ?auto_242578 ) ) ( not ( = ?auto_242574 ?auto_242579 ) ) ( not ( = ?auto_242574 ?auto_242580 ) ) ( not ( = ?auto_242575 ?auto_242576 ) ) ( not ( = ?auto_242575 ?auto_242577 ) ) ( not ( = ?auto_242575 ?auto_242578 ) ) ( not ( = ?auto_242575 ?auto_242579 ) ) ( not ( = ?auto_242575 ?auto_242580 ) ) ( not ( = ?auto_242576 ?auto_242577 ) ) ( not ( = ?auto_242576 ?auto_242578 ) ) ( not ( = ?auto_242576 ?auto_242579 ) ) ( not ( = ?auto_242576 ?auto_242580 ) ) ( not ( = ?auto_242577 ?auto_242578 ) ) ( not ( = ?auto_242577 ?auto_242579 ) ) ( not ( = ?auto_242577 ?auto_242580 ) ) ( not ( = ?auto_242578 ?auto_242579 ) ) ( not ( = ?auto_242578 ?auto_242580 ) ) ( not ( = ?auto_242579 ?auto_242580 ) ) ( ON ?auto_242578 ?auto_242579 ) ( ON ?auto_242577 ?auto_242578 ) ( ON ?auto_242576 ?auto_242577 ) ( CLEAR ?auto_242574 ) ( ON ?auto_242575 ?auto_242576 ) ( CLEAR ?auto_242575 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_242568 ?auto_242569 ?auto_242570 ?auto_242571 ?auto_242572 ?auto_242573 ?auto_242574 ?auto_242575 )
      ( MAKE-12PILE ?auto_242568 ?auto_242569 ?auto_242570 ?auto_242571 ?auto_242572 ?auto_242573 ?auto_242574 ?auto_242575 ?auto_242576 ?auto_242577 ?auto_242578 ?auto_242579 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_242593 - BLOCK
      ?auto_242594 - BLOCK
      ?auto_242595 - BLOCK
      ?auto_242596 - BLOCK
      ?auto_242597 - BLOCK
      ?auto_242598 - BLOCK
      ?auto_242599 - BLOCK
      ?auto_242600 - BLOCK
      ?auto_242601 - BLOCK
      ?auto_242602 - BLOCK
      ?auto_242603 - BLOCK
      ?auto_242604 - BLOCK
    )
    :vars
    (
      ?auto_242605 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_242604 ?auto_242605 ) ( ON-TABLE ?auto_242593 ) ( ON ?auto_242594 ?auto_242593 ) ( ON ?auto_242595 ?auto_242594 ) ( ON ?auto_242596 ?auto_242595 ) ( ON ?auto_242597 ?auto_242596 ) ( ON ?auto_242598 ?auto_242597 ) ( ON ?auto_242599 ?auto_242598 ) ( not ( = ?auto_242593 ?auto_242594 ) ) ( not ( = ?auto_242593 ?auto_242595 ) ) ( not ( = ?auto_242593 ?auto_242596 ) ) ( not ( = ?auto_242593 ?auto_242597 ) ) ( not ( = ?auto_242593 ?auto_242598 ) ) ( not ( = ?auto_242593 ?auto_242599 ) ) ( not ( = ?auto_242593 ?auto_242600 ) ) ( not ( = ?auto_242593 ?auto_242601 ) ) ( not ( = ?auto_242593 ?auto_242602 ) ) ( not ( = ?auto_242593 ?auto_242603 ) ) ( not ( = ?auto_242593 ?auto_242604 ) ) ( not ( = ?auto_242593 ?auto_242605 ) ) ( not ( = ?auto_242594 ?auto_242595 ) ) ( not ( = ?auto_242594 ?auto_242596 ) ) ( not ( = ?auto_242594 ?auto_242597 ) ) ( not ( = ?auto_242594 ?auto_242598 ) ) ( not ( = ?auto_242594 ?auto_242599 ) ) ( not ( = ?auto_242594 ?auto_242600 ) ) ( not ( = ?auto_242594 ?auto_242601 ) ) ( not ( = ?auto_242594 ?auto_242602 ) ) ( not ( = ?auto_242594 ?auto_242603 ) ) ( not ( = ?auto_242594 ?auto_242604 ) ) ( not ( = ?auto_242594 ?auto_242605 ) ) ( not ( = ?auto_242595 ?auto_242596 ) ) ( not ( = ?auto_242595 ?auto_242597 ) ) ( not ( = ?auto_242595 ?auto_242598 ) ) ( not ( = ?auto_242595 ?auto_242599 ) ) ( not ( = ?auto_242595 ?auto_242600 ) ) ( not ( = ?auto_242595 ?auto_242601 ) ) ( not ( = ?auto_242595 ?auto_242602 ) ) ( not ( = ?auto_242595 ?auto_242603 ) ) ( not ( = ?auto_242595 ?auto_242604 ) ) ( not ( = ?auto_242595 ?auto_242605 ) ) ( not ( = ?auto_242596 ?auto_242597 ) ) ( not ( = ?auto_242596 ?auto_242598 ) ) ( not ( = ?auto_242596 ?auto_242599 ) ) ( not ( = ?auto_242596 ?auto_242600 ) ) ( not ( = ?auto_242596 ?auto_242601 ) ) ( not ( = ?auto_242596 ?auto_242602 ) ) ( not ( = ?auto_242596 ?auto_242603 ) ) ( not ( = ?auto_242596 ?auto_242604 ) ) ( not ( = ?auto_242596 ?auto_242605 ) ) ( not ( = ?auto_242597 ?auto_242598 ) ) ( not ( = ?auto_242597 ?auto_242599 ) ) ( not ( = ?auto_242597 ?auto_242600 ) ) ( not ( = ?auto_242597 ?auto_242601 ) ) ( not ( = ?auto_242597 ?auto_242602 ) ) ( not ( = ?auto_242597 ?auto_242603 ) ) ( not ( = ?auto_242597 ?auto_242604 ) ) ( not ( = ?auto_242597 ?auto_242605 ) ) ( not ( = ?auto_242598 ?auto_242599 ) ) ( not ( = ?auto_242598 ?auto_242600 ) ) ( not ( = ?auto_242598 ?auto_242601 ) ) ( not ( = ?auto_242598 ?auto_242602 ) ) ( not ( = ?auto_242598 ?auto_242603 ) ) ( not ( = ?auto_242598 ?auto_242604 ) ) ( not ( = ?auto_242598 ?auto_242605 ) ) ( not ( = ?auto_242599 ?auto_242600 ) ) ( not ( = ?auto_242599 ?auto_242601 ) ) ( not ( = ?auto_242599 ?auto_242602 ) ) ( not ( = ?auto_242599 ?auto_242603 ) ) ( not ( = ?auto_242599 ?auto_242604 ) ) ( not ( = ?auto_242599 ?auto_242605 ) ) ( not ( = ?auto_242600 ?auto_242601 ) ) ( not ( = ?auto_242600 ?auto_242602 ) ) ( not ( = ?auto_242600 ?auto_242603 ) ) ( not ( = ?auto_242600 ?auto_242604 ) ) ( not ( = ?auto_242600 ?auto_242605 ) ) ( not ( = ?auto_242601 ?auto_242602 ) ) ( not ( = ?auto_242601 ?auto_242603 ) ) ( not ( = ?auto_242601 ?auto_242604 ) ) ( not ( = ?auto_242601 ?auto_242605 ) ) ( not ( = ?auto_242602 ?auto_242603 ) ) ( not ( = ?auto_242602 ?auto_242604 ) ) ( not ( = ?auto_242602 ?auto_242605 ) ) ( not ( = ?auto_242603 ?auto_242604 ) ) ( not ( = ?auto_242603 ?auto_242605 ) ) ( not ( = ?auto_242604 ?auto_242605 ) ) ( ON ?auto_242603 ?auto_242604 ) ( ON ?auto_242602 ?auto_242603 ) ( ON ?auto_242601 ?auto_242602 ) ( CLEAR ?auto_242599 ) ( ON ?auto_242600 ?auto_242601 ) ( CLEAR ?auto_242600 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_242593 ?auto_242594 ?auto_242595 ?auto_242596 ?auto_242597 ?auto_242598 ?auto_242599 ?auto_242600 )
      ( MAKE-12PILE ?auto_242593 ?auto_242594 ?auto_242595 ?auto_242596 ?auto_242597 ?auto_242598 ?auto_242599 ?auto_242600 ?auto_242601 ?auto_242602 ?auto_242603 ?auto_242604 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_242618 - BLOCK
      ?auto_242619 - BLOCK
      ?auto_242620 - BLOCK
      ?auto_242621 - BLOCK
      ?auto_242622 - BLOCK
      ?auto_242623 - BLOCK
      ?auto_242624 - BLOCK
      ?auto_242625 - BLOCK
      ?auto_242626 - BLOCK
      ?auto_242627 - BLOCK
      ?auto_242628 - BLOCK
      ?auto_242629 - BLOCK
    )
    :vars
    (
      ?auto_242630 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_242629 ?auto_242630 ) ( ON-TABLE ?auto_242618 ) ( ON ?auto_242619 ?auto_242618 ) ( ON ?auto_242620 ?auto_242619 ) ( ON ?auto_242621 ?auto_242620 ) ( ON ?auto_242622 ?auto_242621 ) ( ON ?auto_242623 ?auto_242622 ) ( not ( = ?auto_242618 ?auto_242619 ) ) ( not ( = ?auto_242618 ?auto_242620 ) ) ( not ( = ?auto_242618 ?auto_242621 ) ) ( not ( = ?auto_242618 ?auto_242622 ) ) ( not ( = ?auto_242618 ?auto_242623 ) ) ( not ( = ?auto_242618 ?auto_242624 ) ) ( not ( = ?auto_242618 ?auto_242625 ) ) ( not ( = ?auto_242618 ?auto_242626 ) ) ( not ( = ?auto_242618 ?auto_242627 ) ) ( not ( = ?auto_242618 ?auto_242628 ) ) ( not ( = ?auto_242618 ?auto_242629 ) ) ( not ( = ?auto_242618 ?auto_242630 ) ) ( not ( = ?auto_242619 ?auto_242620 ) ) ( not ( = ?auto_242619 ?auto_242621 ) ) ( not ( = ?auto_242619 ?auto_242622 ) ) ( not ( = ?auto_242619 ?auto_242623 ) ) ( not ( = ?auto_242619 ?auto_242624 ) ) ( not ( = ?auto_242619 ?auto_242625 ) ) ( not ( = ?auto_242619 ?auto_242626 ) ) ( not ( = ?auto_242619 ?auto_242627 ) ) ( not ( = ?auto_242619 ?auto_242628 ) ) ( not ( = ?auto_242619 ?auto_242629 ) ) ( not ( = ?auto_242619 ?auto_242630 ) ) ( not ( = ?auto_242620 ?auto_242621 ) ) ( not ( = ?auto_242620 ?auto_242622 ) ) ( not ( = ?auto_242620 ?auto_242623 ) ) ( not ( = ?auto_242620 ?auto_242624 ) ) ( not ( = ?auto_242620 ?auto_242625 ) ) ( not ( = ?auto_242620 ?auto_242626 ) ) ( not ( = ?auto_242620 ?auto_242627 ) ) ( not ( = ?auto_242620 ?auto_242628 ) ) ( not ( = ?auto_242620 ?auto_242629 ) ) ( not ( = ?auto_242620 ?auto_242630 ) ) ( not ( = ?auto_242621 ?auto_242622 ) ) ( not ( = ?auto_242621 ?auto_242623 ) ) ( not ( = ?auto_242621 ?auto_242624 ) ) ( not ( = ?auto_242621 ?auto_242625 ) ) ( not ( = ?auto_242621 ?auto_242626 ) ) ( not ( = ?auto_242621 ?auto_242627 ) ) ( not ( = ?auto_242621 ?auto_242628 ) ) ( not ( = ?auto_242621 ?auto_242629 ) ) ( not ( = ?auto_242621 ?auto_242630 ) ) ( not ( = ?auto_242622 ?auto_242623 ) ) ( not ( = ?auto_242622 ?auto_242624 ) ) ( not ( = ?auto_242622 ?auto_242625 ) ) ( not ( = ?auto_242622 ?auto_242626 ) ) ( not ( = ?auto_242622 ?auto_242627 ) ) ( not ( = ?auto_242622 ?auto_242628 ) ) ( not ( = ?auto_242622 ?auto_242629 ) ) ( not ( = ?auto_242622 ?auto_242630 ) ) ( not ( = ?auto_242623 ?auto_242624 ) ) ( not ( = ?auto_242623 ?auto_242625 ) ) ( not ( = ?auto_242623 ?auto_242626 ) ) ( not ( = ?auto_242623 ?auto_242627 ) ) ( not ( = ?auto_242623 ?auto_242628 ) ) ( not ( = ?auto_242623 ?auto_242629 ) ) ( not ( = ?auto_242623 ?auto_242630 ) ) ( not ( = ?auto_242624 ?auto_242625 ) ) ( not ( = ?auto_242624 ?auto_242626 ) ) ( not ( = ?auto_242624 ?auto_242627 ) ) ( not ( = ?auto_242624 ?auto_242628 ) ) ( not ( = ?auto_242624 ?auto_242629 ) ) ( not ( = ?auto_242624 ?auto_242630 ) ) ( not ( = ?auto_242625 ?auto_242626 ) ) ( not ( = ?auto_242625 ?auto_242627 ) ) ( not ( = ?auto_242625 ?auto_242628 ) ) ( not ( = ?auto_242625 ?auto_242629 ) ) ( not ( = ?auto_242625 ?auto_242630 ) ) ( not ( = ?auto_242626 ?auto_242627 ) ) ( not ( = ?auto_242626 ?auto_242628 ) ) ( not ( = ?auto_242626 ?auto_242629 ) ) ( not ( = ?auto_242626 ?auto_242630 ) ) ( not ( = ?auto_242627 ?auto_242628 ) ) ( not ( = ?auto_242627 ?auto_242629 ) ) ( not ( = ?auto_242627 ?auto_242630 ) ) ( not ( = ?auto_242628 ?auto_242629 ) ) ( not ( = ?auto_242628 ?auto_242630 ) ) ( not ( = ?auto_242629 ?auto_242630 ) ) ( ON ?auto_242628 ?auto_242629 ) ( ON ?auto_242627 ?auto_242628 ) ( ON ?auto_242626 ?auto_242627 ) ( ON ?auto_242625 ?auto_242626 ) ( CLEAR ?auto_242623 ) ( ON ?auto_242624 ?auto_242625 ) ( CLEAR ?auto_242624 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_242618 ?auto_242619 ?auto_242620 ?auto_242621 ?auto_242622 ?auto_242623 ?auto_242624 )
      ( MAKE-12PILE ?auto_242618 ?auto_242619 ?auto_242620 ?auto_242621 ?auto_242622 ?auto_242623 ?auto_242624 ?auto_242625 ?auto_242626 ?auto_242627 ?auto_242628 ?auto_242629 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_242643 - BLOCK
      ?auto_242644 - BLOCK
      ?auto_242645 - BLOCK
      ?auto_242646 - BLOCK
      ?auto_242647 - BLOCK
      ?auto_242648 - BLOCK
      ?auto_242649 - BLOCK
      ?auto_242650 - BLOCK
      ?auto_242651 - BLOCK
      ?auto_242652 - BLOCK
      ?auto_242653 - BLOCK
      ?auto_242654 - BLOCK
    )
    :vars
    (
      ?auto_242655 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_242654 ?auto_242655 ) ( ON-TABLE ?auto_242643 ) ( ON ?auto_242644 ?auto_242643 ) ( ON ?auto_242645 ?auto_242644 ) ( ON ?auto_242646 ?auto_242645 ) ( ON ?auto_242647 ?auto_242646 ) ( ON ?auto_242648 ?auto_242647 ) ( not ( = ?auto_242643 ?auto_242644 ) ) ( not ( = ?auto_242643 ?auto_242645 ) ) ( not ( = ?auto_242643 ?auto_242646 ) ) ( not ( = ?auto_242643 ?auto_242647 ) ) ( not ( = ?auto_242643 ?auto_242648 ) ) ( not ( = ?auto_242643 ?auto_242649 ) ) ( not ( = ?auto_242643 ?auto_242650 ) ) ( not ( = ?auto_242643 ?auto_242651 ) ) ( not ( = ?auto_242643 ?auto_242652 ) ) ( not ( = ?auto_242643 ?auto_242653 ) ) ( not ( = ?auto_242643 ?auto_242654 ) ) ( not ( = ?auto_242643 ?auto_242655 ) ) ( not ( = ?auto_242644 ?auto_242645 ) ) ( not ( = ?auto_242644 ?auto_242646 ) ) ( not ( = ?auto_242644 ?auto_242647 ) ) ( not ( = ?auto_242644 ?auto_242648 ) ) ( not ( = ?auto_242644 ?auto_242649 ) ) ( not ( = ?auto_242644 ?auto_242650 ) ) ( not ( = ?auto_242644 ?auto_242651 ) ) ( not ( = ?auto_242644 ?auto_242652 ) ) ( not ( = ?auto_242644 ?auto_242653 ) ) ( not ( = ?auto_242644 ?auto_242654 ) ) ( not ( = ?auto_242644 ?auto_242655 ) ) ( not ( = ?auto_242645 ?auto_242646 ) ) ( not ( = ?auto_242645 ?auto_242647 ) ) ( not ( = ?auto_242645 ?auto_242648 ) ) ( not ( = ?auto_242645 ?auto_242649 ) ) ( not ( = ?auto_242645 ?auto_242650 ) ) ( not ( = ?auto_242645 ?auto_242651 ) ) ( not ( = ?auto_242645 ?auto_242652 ) ) ( not ( = ?auto_242645 ?auto_242653 ) ) ( not ( = ?auto_242645 ?auto_242654 ) ) ( not ( = ?auto_242645 ?auto_242655 ) ) ( not ( = ?auto_242646 ?auto_242647 ) ) ( not ( = ?auto_242646 ?auto_242648 ) ) ( not ( = ?auto_242646 ?auto_242649 ) ) ( not ( = ?auto_242646 ?auto_242650 ) ) ( not ( = ?auto_242646 ?auto_242651 ) ) ( not ( = ?auto_242646 ?auto_242652 ) ) ( not ( = ?auto_242646 ?auto_242653 ) ) ( not ( = ?auto_242646 ?auto_242654 ) ) ( not ( = ?auto_242646 ?auto_242655 ) ) ( not ( = ?auto_242647 ?auto_242648 ) ) ( not ( = ?auto_242647 ?auto_242649 ) ) ( not ( = ?auto_242647 ?auto_242650 ) ) ( not ( = ?auto_242647 ?auto_242651 ) ) ( not ( = ?auto_242647 ?auto_242652 ) ) ( not ( = ?auto_242647 ?auto_242653 ) ) ( not ( = ?auto_242647 ?auto_242654 ) ) ( not ( = ?auto_242647 ?auto_242655 ) ) ( not ( = ?auto_242648 ?auto_242649 ) ) ( not ( = ?auto_242648 ?auto_242650 ) ) ( not ( = ?auto_242648 ?auto_242651 ) ) ( not ( = ?auto_242648 ?auto_242652 ) ) ( not ( = ?auto_242648 ?auto_242653 ) ) ( not ( = ?auto_242648 ?auto_242654 ) ) ( not ( = ?auto_242648 ?auto_242655 ) ) ( not ( = ?auto_242649 ?auto_242650 ) ) ( not ( = ?auto_242649 ?auto_242651 ) ) ( not ( = ?auto_242649 ?auto_242652 ) ) ( not ( = ?auto_242649 ?auto_242653 ) ) ( not ( = ?auto_242649 ?auto_242654 ) ) ( not ( = ?auto_242649 ?auto_242655 ) ) ( not ( = ?auto_242650 ?auto_242651 ) ) ( not ( = ?auto_242650 ?auto_242652 ) ) ( not ( = ?auto_242650 ?auto_242653 ) ) ( not ( = ?auto_242650 ?auto_242654 ) ) ( not ( = ?auto_242650 ?auto_242655 ) ) ( not ( = ?auto_242651 ?auto_242652 ) ) ( not ( = ?auto_242651 ?auto_242653 ) ) ( not ( = ?auto_242651 ?auto_242654 ) ) ( not ( = ?auto_242651 ?auto_242655 ) ) ( not ( = ?auto_242652 ?auto_242653 ) ) ( not ( = ?auto_242652 ?auto_242654 ) ) ( not ( = ?auto_242652 ?auto_242655 ) ) ( not ( = ?auto_242653 ?auto_242654 ) ) ( not ( = ?auto_242653 ?auto_242655 ) ) ( not ( = ?auto_242654 ?auto_242655 ) ) ( ON ?auto_242653 ?auto_242654 ) ( ON ?auto_242652 ?auto_242653 ) ( ON ?auto_242651 ?auto_242652 ) ( ON ?auto_242650 ?auto_242651 ) ( CLEAR ?auto_242648 ) ( ON ?auto_242649 ?auto_242650 ) ( CLEAR ?auto_242649 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_242643 ?auto_242644 ?auto_242645 ?auto_242646 ?auto_242647 ?auto_242648 ?auto_242649 )
      ( MAKE-12PILE ?auto_242643 ?auto_242644 ?auto_242645 ?auto_242646 ?auto_242647 ?auto_242648 ?auto_242649 ?auto_242650 ?auto_242651 ?auto_242652 ?auto_242653 ?auto_242654 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_242668 - BLOCK
      ?auto_242669 - BLOCK
      ?auto_242670 - BLOCK
      ?auto_242671 - BLOCK
      ?auto_242672 - BLOCK
      ?auto_242673 - BLOCK
      ?auto_242674 - BLOCK
      ?auto_242675 - BLOCK
      ?auto_242676 - BLOCK
      ?auto_242677 - BLOCK
      ?auto_242678 - BLOCK
      ?auto_242679 - BLOCK
    )
    :vars
    (
      ?auto_242680 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_242679 ?auto_242680 ) ( ON-TABLE ?auto_242668 ) ( ON ?auto_242669 ?auto_242668 ) ( ON ?auto_242670 ?auto_242669 ) ( ON ?auto_242671 ?auto_242670 ) ( ON ?auto_242672 ?auto_242671 ) ( not ( = ?auto_242668 ?auto_242669 ) ) ( not ( = ?auto_242668 ?auto_242670 ) ) ( not ( = ?auto_242668 ?auto_242671 ) ) ( not ( = ?auto_242668 ?auto_242672 ) ) ( not ( = ?auto_242668 ?auto_242673 ) ) ( not ( = ?auto_242668 ?auto_242674 ) ) ( not ( = ?auto_242668 ?auto_242675 ) ) ( not ( = ?auto_242668 ?auto_242676 ) ) ( not ( = ?auto_242668 ?auto_242677 ) ) ( not ( = ?auto_242668 ?auto_242678 ) ) ( not ( = ?auto_242668 ?auto_242679 ) ) ( not ( = ?auto_242668 ?auto_242680 ) ) ( not ( = ?auto_242669 ?auto_242670 ) ) ( not ( = ?auto_242669 ?auto_242671 ) ) ( not ( = ?auto_242669 ?auto_242672 ) ) ( not ( = ?auto_242669 ?auto_242673 ) ) ( not ( = ?auto_242669 ?auto_242674 ) ) ( not ( = ?auto_242669 ?auto_242675 ) ) ( not ( = ?auto_242669 ?auto_242676 ) ) ( not ( = ?auto_242669 ?auto_242677 ) ) ( not ( = ?auto_242669 ?auto_242678 ) ) ( not ( = ?auto_242669 ?auto_242679 ) ) ( not ( = ?auto_242669 ?auto_242680 ) ) ( not ( = ?auto_242670 ?auto_242671 ) ) ( not ( = ?auto_242670 ?auto_242672 ) ) ( not ( = ?auto_242670 ?auto_242673 ) ) ( not ( = ?auto_242670 ?auto_242674 ) ) ( not ( = ?auto_242670 ?auto_242675 ) ) ( not ( = ?auto_242670 ?auto_242676 ) ) ( not ( = ?auto_242670 ?auto_242677 ) ) ( not ( = ?auto_242670 ?auto_242678 ) ) ( not ( = ?auto_242670 ?auto_242679 ) ) ( not ( = ?auto_242670 ?auto_242680 ) ) ( not ( = ?auto_242671 ?auto_242672 ) ) ( not ( = ?auto_242671 ?auto_242673 ) ) ( not ( = ?auto_242671 ?auto_242674 ) ) ( not ( = ?auto_242671 ?auto_242675 ) ) ( not ( = ?auto_242671 ?auto_242676 ) ) ( not ( = ?auto_242671 ?auto_242677 ) ) ( not ( = ?auto_242671 ?auto_242678 ) ) ( not ( = ?auto_242671 ?auto_242679 ) ) ( not ( = ?auto_242671 ?auto_242680 ) ) ( not ( = ?auto_242672 ?auto_242673 ) ) ( not ( = ?auto_242672 ?auto_242674 ) ) ( not ( = ?auto_242672 ?auto_242675 ) ) ( not ( = ?auto_242672 ?auto_242676 ) ) ( not ( = ?auto_242672 ?auto_242677 ) ) ( not ( = ?auto_242672 ?auto_242678 ) ) ( not ( = ?auto_242672 ?auto_242679 ) ) ( not ( = ?auto_242672 ?auto_242680 ) ) ( not ( = ?auto_242673 ?auto_242674 ) ) ( not ( = ?auto_242673 ?auto_242675 ) ) ( not ( = ?auto_242673 ?auto_242676 ) ) ( not ( = ?auto_242673 ?auto_242677 ) ) ( not ( = ?auto_242673 ?auto_242678 ) ) ( not ( = ?auto_242673 ?auto_242679 ) ) ( not ( = ?auto_242673 ?auto_242680 ) ) ( not ( = ?auto_242674 ?auto_242675 ) ) ( not ( = ?auto_242674 ?auto_242676 ) ) ( not ( = ?auto_242674 ?auto_242677 ) ) ( not ( = ?auto_242674 ?auto_242678 ) ) ( not ( = ?auto_242674 ?auto_242679 ) ) ( not ( = ?auto_242674 ?auto_242680 ) ) ( not ( = ?auto_242675 ?auto_242676 ) ) ( not ( = ?auto_242675 ?auto_242677 ) ) ( not ( = ?auto_242675 ?auto_242678 ) ) ( not ( = ?auto_242675 ?auto_242679 ) ) ( not ( = ?auto_242675 ?auto_242680 ) ) ( not ( = ?auto_242676 ?auto_242677 ) ) ( not ( = ?auto_242676 ?auto_242678 ) ) ( not ( = ?auto_242676 ?auto_242679 ) ) ( not ( = ?auto_242676 ?auto_242680 ) ) ( not ( = ?auto_242677 ?auto_242678 ) ) ( not ( = ?auto_242677 ?auto_242679 ) ) ( not ( = ?auto_242677 ?auto_242680 ) ) ( not ( = ?auto_242678 ?auto_242679 ) ) ( not ( = ?auto_242678 ?auto_242680 ) ) ( not ( = ?auto_242679 ?auto_242680 ) ) ( ON ?auto_242678 ?auto_242679 ) ( ON ?auto_242677 ?auto_242678 ) ( ON ?auto_242676 ?auto_242677 ) ( ON ?auto_242675 ?auto_242676 ) ( ON ?auto_242674 ?auto_242675 ) ( CLEAR ?auto_242672 ) ( ON ?auto_242673 ?auto_242674 ) ( CLEAR ?auto_242673 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_242668 ?auto_242669 ?auto_242670 ?auto_242671 ?auto_242672 ?auto_242673 )
      ( MAKE-12PILE ?auto_242668 ?auto_242669 ?auto_242670 ?auto_242671 ?auto_242672 ?auto_242673 ?auto_242674 ?auto_242675 ?auto_242676 ?auto_242677 ?auto_242678 ?auto_242679 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_242693 - BLOCK
      ?auto_242694 - BLOCK
      ?auto_242695 - BLOCK
      ?auto_242696 - BLOCK
      ?auto_242697 - BLOCK
      ?auto_242698 - BLOCK
      ?auto_242699 - BLOCK
      ?auto_242700 - BLOCK
      ?auto_242701 - BLOCK
      ?auto_242702 - BLOCK
      ?auto_242703 - BLOCK
      ?auto_242704 - BLOCK
    )
    :vars
    (
      ?auto_242705 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_242704 ?auto_242705 ) ( ON-TABLE ?auto_242693 ) ( ON ?auto_242694 ?auto_242693 ) ( ON ?auto_242695 ?auto_242694 ) ( ON ?auto_242696 ?auto_242695 ) ( ON ?auto_242697 ?auto_242696 ) ( not ( = ?auto_242693 ?auto_242694 ) ) ( not ( = ?auto_242693 ?auto_242695 ) ) ( not ( = ?auto_242693 ?auto_242696 ) ) ( not ( = ?auto_242693 ?auto_242697 ) ) ( not ( = ?auto_242693 ?auto_242698 ) ) ( not ( = ?auto_242693 ?auto_242699 ) ) ( not ( = ?auto_242693 ?auto_242700 ) ) ( not ( = ?auto_242693 ?auto_242701 ) ) ( not ( = ?auto_242693 ?auto_242702 ) ) ( not ( = ?auto_242693 ?auto_242703 ) ) ( not ( = ?auto_242693 ?auto_242704 ) ) ( not ( = ?auto_242693 ?auto_242705 ) ) ( not ( = ?auto_242694 ?auto_242695 ) ) ( not ( = ?auto_242694 ?auto_242696 ) ) ( not ( = ?auto_242694 ?auto_242697 ) ) ( not ( = ?auto_242694 ?auto_242698 ) ) ( not ( = ?auto_242694 ?auto_242699 ) ) ( not ( = ?auto_242694 ?auto_242700 ) ) ( not ( = ?auto_242694 ?auto_242701 ) ) ( not ( = ?auto_242694 ?auto_242702 ) ) ( not ( = ?auto_242694 ?auto_242703 ) ) ( not ( = ?auto_242694 ?auto_242704 ) ) ( not ( = ?auto_242694 ?auto_242705 ) ) ( not ( = ?auto_242695 ?auto_242696 ) ) ( not ( = ?auto_242695 ?auto_242697 ) ) ( not ( = ?auto_242695 ?auto_242698 ) ) ( not ( = ?auto_242695 ?auto_242699 ) ) ( not ( = ?auto_242695 ?auto_242700 ) ) ( not ( = ?auto_242695 ?auto_242701 ) ) ( not ( = ?auto_242695 ?auto_242702 ) ) ( not ( = ?auto_242695 ?auto_242703 ) ) ( not ( = ?auto_242695 ?auto_242704 ) ) ( not ( = ?auto_242695 ?auto_242705 ) ) ( not ( = ?auto_242696 ?auto_242697 ) ) ( not ( = ?auto_242696 ?auto_242698 ) ) ( not ( = ?auto_242696 ?auto_242699 ) ) ( not ( = ?auto_242696 ?auto_242700 ) ) ( not ( = ?auto_242696 ?auto_242701 ) ) ( not ( = ?auto_242696 ?auto_242702 ) ) ( not ( = ?auto_242696 ?auto_242703 ) ) ( not ( = ?auto_242696 ?auto_242704 ) ) ( not ( = ?auto_242696 ?auto_242705 ) ) ( not ( = ?auto_242697 ?auto_242698 ) ) ( not ( = ?auto_242697 ?auto_242699 ) ) ( not ( = ?auto_242697 ?auto_242700 ) ) ( not ( = ?auto_242697 ?auto_242701 ) ) ( not ( = ?auto_242697 ?auto_242702 ) ) ( not ( = ?auto_242697 ?auto_242703 ) ) ( not ( = ?auto_242697 ?auto_242704 ) ) ( not ( = ?auto_242697 ?auto_242705 ) ) ( not ( = ?auto_242698 ?auto_242699 ) ) ( not ( = ?auto_242698 ?auto_242700 ) ) ( not ( = ?auto_242698 ?auto_242701 ) ) ( not ( = ?auto_242698 ?auto_242702 ) ) ( not ( = ?auto_242698 ?auto_242703 ) ) ( not ( = ?auto_242698 ?auto_242704 ) ) ( not ( = ?auto_242698 ?auto_242705 ) ) ( not ( = ?auto_242699 ?auto_242700 ) ) ( not ( = ?auto_242699 ?auto_242701 ) ) ( not ( = ?auto_242699 ?auto_242702 ) ) ( not ( = ?auto_242699 ?auto_242703 ) ) ( not ( = ?auto_242699 ?auto_242704 ) ) ( not ( = ?auto_242699 ?auto_242705 ) ) ( not ( = ?auto_242700 ?auto_242701 ) ) ( not ( = ?auto_242700 ?auto_242702 ) ) ( not ( = ?auto_242700 ?auto_242703 ) ) ( not ( = ?auto_242700 ?auto_242704 ) ) ( not ( = ?auto_242700 ?auto_242705 ) ) ( not ( = ?auto_242701 ?auto_242702 ) ) ( not ( = ?auto_242701 ?auto_242703 ) ) ( not ( = ?auto_242701 ?auto_242704 ) ) ( not ( = ?auto_242701 ?auto_242705 ) ) ( not ( = ?auto_242702 ?auto_242703 ) ) ( not ( = ?auto_242702 ?auto_242704 ) ) ( not ( = ?auto_242702 ?auto_242705 ) ) ( not ( = ?auto_242703 ?auto_242704 ) ) ( not ( = ?auto_242703 ?auto_242705 ) ) ( not ( = ?auto_242704 ?auto_242705 ) ) ( ON ?auto_242703 ?auto_242704 ) ( ON ?auto_242702 ?auto_242703 ) ( ON ?auto_242701 ?auto_242702 ) ( ON ?auto_242700 ?auto_242701 ) ( ON ?auto_242699 ?auto_242700 ) ( CLEAR ?auto_242697 ) ( ON ?auto_242698 ?auto_242699 ) ( CLEAR ?auto_242698 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_242693 ?auto_242694 ?auto_242695 ?auto_242696 ?auto_242697 ?auto_242698 )
      ( MAKE-12PILE ?auto_242693 ?auto_242694 ?auto_242695 ?auto_242696 ?auto_242697 ?auto_242698 ?auto_242699 ?auto_242700 ?auto_242701 ?auto_242702 ?auto_242703 ?auto_242704 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_242718 - BLOCK
      ?auto_242719 - BLOCK
      ?auto_242720 - BLOCK
      ?auto_242721 - BLOCK
      ?auto_242722 - BLOCK
      ?auto_242723 - BLOCK
      ?auto_242724 - BLOCK
      ?auto_242725 - BLOCK
      ?auto_242726 - BLOCK
      ?auto_242727 - BLOCK
      ?auto_242728 - BLOCK
      ?auto_242729 - BLOCK
    )
    :vars
    (
      ?auto_242730 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_242729 ?auto_242730 ) ( ON-TABLE ?auto_242718 ) ( ON ?auto_242719 ?auto_242718 ) ( ON ?auto_242720 ?auto_242719 ) ( ON ?auto_242721 ?auto_242720 ) ( not ( = ?auto_242718 ?auto_242719 ) ) ( not ( = ?auto_242718 ?auto_242720 ) ) ( not ( = ?auto_242718 ?auto_242721 ) ) ( not ( = ?auto_242718 ?auto_242722 ) ) ( not ( = ?auto_242718 ?auto_242723 ) ) ( not ( = ?auto_242718 ?auto_242724 ) ) ( not ( = ?auto_242718 ?auto_242725 ) ) ( not ( = ?auto_242718 ?auto_242726 ) ) ( not ( = ?auto_242718 ?auto_242727 ) ) ( not ( = ?auto_242718 ?auto_242728 ) ) ( not ( = ?auto_242718 ?auto_242729 ) ) ( not ( = ?auto_242718 ?auto_242730 ) ) ( not ( = ?auto_242719 ?auto_242720 ) ) ( not ( = ?auto_242719 ?auto_242721 ) ) ( not ( = ?auto_242719 ?auto_242722 ) ) ( not ( = ?auto_242719 ?auto_242723 ) ) ( not ( = ?auto_242719 ?auto_242724 ) ) ( not ( = ?auto_242719 ?auto_242725 ) ) ( not ( = ?auto_242719 ?auto_242726 ) ) ( not ( = ?auto_242719 ?auto_242727 ) ) ( not ( = ?auto_242719 ?auto_242728 ) ) ( not ( = ?auto_242719 ?auto_242729 ) ) ( not ( = ?auto_242719 ?auto_242730 ) ) ( not ( = ?auto_242720 ?auto_242721 ) ) ( not ( = ?auto_242720 ?auto_242722 ) ) ( not ( = ?auto_242720 ?auto_242723 ) ) ( not ( = ?auto_242720 ?auto_242724 ) ) ( not ( = ?auto_242720 ?auto_242725 ) ) ( not ( = ?auto_242720 ?auto_242726 ) ) ( not ( = ?auto_242720 ?auto_242727 ) ) ( not ( = ?auto_242720 ?auto_242728 ) ) ( not ( = ?auto_242720 ?auto_242729 ) ) ( not ( = ?auto_242720 ?auto_242730 ) ) ( not ( = ?auto_242721 ?auto_242722 ) ) ( not ( = ?auto_242721 ?auto_242723 ) ) ( not ( = ?auto_242721 ?auto_242724 ) ) ( not ( = ?auto_242721 ?auto_242725 ) ) ( not ( = ?auto_242721 ?auto_242726 ) ) ( not ( = ?auto_242721 ?auto_242727 ) ) ( not ( = ?auto_242721 ?auto_242728 ) ) ( not ( = ?auto_242721 ?auto_242729 ) ) ( not ( = ?auto_242721 ?auto_242730 ) ) ( not ( = ?auto_242722 ?auto_242723 ) ) ( not ( = ?auto_242722 ?auto_242724 ) ) ( not ( = ?auto_242722 ?auto_242725 ) ) ( not ( = ?auto_242722 ?auto_242726 ) ) ( not ( = ?auto_242722 ?auto_242727 ) ) ( not ( = ?auto_242722 ?auto_242728 ) ) ( not ( = ?auto_242722 ?auto_242729 ) ) ( not ( = ?auto_242722 ?auto_242730 ) ) ( not ( = ?auto_242723 ?auto_242724 ) ) ( not ( = ?auto_242723 ?auto_242725 ) ) ( not ( = ?auto_242723 ?auto_242726 ) ) ( not ( = ?auto_242723 ?auto_242727 ) ) ( not ( = ?auto_242723 ?auto_242728 ) ) ( not ( = ?auto_242723 ?auto_242729 ) ) ( not ( = ?auto_242723 ?auto_242730 ) ) ( not ( = ?auto_242724 ?auto_242725 ) ) ( not ( = ?auto_242724 ?auto_242726 ) ) ( not ( = ?auto_242724 ?auto_242727 ) ) ( not ( = ?auto_242724 ?auto_242728 ) ) ( not ( = ?auto_242724 ?auto_242729 ) ) ( not ( = ?auto_242724 ?auto_242730 ) ) ( not ( = ?auto_242725 ?auto_242726 ) ) ( not ( = ?auto_242725 ?auto_242727 ) ) ( not ( = ?auto_242725 ?auto_242728 ) ) ( not ( = ?auto_242725 ?auto_242729 ) ) ( not ( = ?auto_242725 ?auto_242730 ) ) ( not ( = ?auto_242726 ?auto_242727 ) ) ( not ( = ?auto_242726 ?auto_242728 ) ) ( not ( = ?auto_242726 ?auto_242729 ) ) ( not ( = ?auto_242726 ?auto_242730 ) ) ( not ( = ?auto_242727 ?auto_242728 ) ) ( not ( = ?auto_242727 ?auto_242729 ) ) ( not ( = ?auto_242727 ?auto_242730 ) ) ( not ( = ?auto_242728 ?auto_242729 ) ) ( not ( = ?auto_242728 ?auto_242730 ) ) ( not ( = ?auto_242729 ?auto_242730 ) ) ( ON ?auto_242728 ?auto_242729 ) ( ON ?auto_242727 ?auto_242728 ) ( ON ?auto_242726 ?auto_242727 ) ( ON ?auto_242725 ?auto_242726 ) ( ON ?auto_242724 ?auto_242725 ) ( ON ?auto_242723 ?auto_242724 ) ( CLEAR ?auto_242721 ) ( ON ?auto_242722 ?auto_242723 ) ( CLEAR ?auto_242722 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_242718 ?auto_242719 ?auto_242720 ?auto_242721 ?auto_242722 )
      ( MAKE-12PILE ?auto_242718 ?auto_242719 ?auto_242720 ?auto_242721 ?auto_242722 ?auto_242723 ?auto_242724 ?auto_242725 ?auto_242726 ?auto_242727 ?auto_242728 ?auto_242729 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_242743 - BLOCK
      ?auto_242744 - BLOCK
      ?auto_242745 - BLOCK
      ?auto_242746 - BLOCK
      ?auto_242747 - BLOCK
      ?auto_242748 - BLOCK
      ?auto_242749 - BLOCK
      ?auto_242750 - BLOCK
      ?auto_242751 - BLOCK
      ?auto_242752 - BLOCK
      ?auto_242753 - BLOCK
      ?auto_242754 - BLOCK
    )
    :vars
    (
      ?auto_242755 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_242754 ?auto_242755 ) ( ON-TABLE ?auto_242743 ) ( ON ?auto_242744 ?auto_242743 ) ( ON ?auto_242745 ?auto_242744 ) ( ON ?auto_242746 ?auto_242745 ) ( not ( = ?auto_242743 ?auto_242744 ) ) ( not ( = ?auto_242743 ?auto_242745 ) ) ( not ( = ?auto_242743 ?auto_242746 ) ) ( not ( = ?auto_242743 ?auto_242747 ) ) ( not ( = ?auto_242743 ?auto_242748 ) ) ( not ( = ?auto_242743 ?auto_242749 ) ) ( not ( = ?auto_242743 ?auto_242750 ) ) ( not ( = ?auto_242743 ?auto_242751 ) ) ( not ( = ?auto_242743 ?auto_242752 ) ) ( not ( = ?auto_242743 ?auto_242753 ) ) ( not ( = ?auto_242743 ?auto_242754 ) ) ( not ( = ?auto_242743 ?auto_242755 ) ) ( not ( = ?auto_242744 ?auto_242745 ) ) ( not ( = ?auto_242744 ?auto_242746 ) ) ( not ( = ?auto_242744 ?auto_242747 ) ) ( not ( = ?auto_242744 ?auto_242748 ) ) ( not ( = ?auto_242744 ?auto_242749 ) ) ( not ( = ?auto_242744 ?auto_242750 ) ) ( not ( = ?auto_242744 ?auto_242751 ) ) ( not ( = ?auto_242744 ?auto_242752 ) ) ( not ( = ?auto_242744 ?auto_242753 ) ) ( not ( = ?auto_242744 ?auto_242754 ) ) ( not ( = ?auto_242744 ?auto_242755 ) ) ( not ( = ?auto_242745 ?auto_242746 ) ) ( not ( = ?auto_242745 ?auto_242747 ) ) ( not ( = ?auto_242745 ?auto_242748 ) ) ( not ( = ?auto_242745 ?auto_242749 ) ) ( not ( = ?auto_242745 ?auto_242750 ) ) ( not ( = ?auto_242745 ?auto_242751 ) ) ( not ( = ?auto_242745 ?auto_242752 ) ) ( not ( = ?auto_242745 ?auto_242753 ) ) ( not ( = ?auto_242745 ?auto_242754 ) ) ( not ( = ?auto_242745 ?auto_242755 ) ) ( not ( = ?auto_242746 ?auto_242747 ) ) ( not ( = ?auto_242746 ?auto_242748 ) ) ( not ( = ?auto_242746 ?auto_242749 ) ) ( not ( = ?auto_242746 ?auto_242750 ) ) ( not ( = ?auto_242746 ?auto_242751 ) ) ( not ( = ?auto_242746 ?auto_242752 ) ) ( not ( = ?auto_242746 ?auto_242753 ) ) ( not ( = ?auto_242746 ?auto_242754 ) ) ( not ( = ?auto_242746 ?auto_242755 ) ) ( not ( = ?auto_242747 ?auto_242748 ) ) ( not ( = ?auto_242747 ?auto_242749 ) ) ( not ( = ?auto_242747 ?auto_242750 ) ) ( not ( = ?auto_242747 ?auto_242751 ) ) ( not ( = ?auto_242747 ?auto_242752 ) ) ( not ( = ?auto_242747 ?auto_242753 ) ) ( not ( = ?auto_242747 ?auto_242754 ) ) ( not ( = ?auto_242747 ?auto_242755 ) ) ( not ( = ?auto_242748 ?auto_242749 ) ) ( not ( = ?auto_242748 ?auto_242750 ) ) ( not ( = ?auto_242748 ?auto_242751 ) ) ( not ( = ?auto_242748 ?auto_242752 ) ) ( not ( = ?auto_242748 ?auto_242753 ) ) ( not ( = ?auto_242748 ?auto_242754 ) ) ( not ( = ?auto_242748 ?auto_242755 ) ) ( not ( = ?auto_242749 ?auto_242750 ) ) ( not ( = ?auto_242749 ?auto_242751 ) ) ( not ( = ?auto_242749 ?auto_242752 ) ) ( not ( = ?auto_242749 ?auto_242753 ) ) ( not ( = ?auto_242749 ?auto_242754 ) ) ( not ( = ?auto_242749 ?auto_242755 ) ) ( not ( = ?auto_242750 ?auto_242751 ) ) ( not ( = ?auto_242750 ?auto_242752 ) ) ( not ( = ?auto_242750 ?auto_242753 ) ) ( not ( = ?auto_242750 ?auto_242754 ) ) ( not ( = ?auto_242750 ?auto_242755 ) ) ( not ( = ?auto_242751 ?auto_242752 ) ) ( not ( = ?auto_242751 ?auto_242753 ) ) ( not ( = ?auto_242751 ?auto_242754 ) ) ( not ( = ?auto_242751 ?auto_242755 ) ) ( not ( = ?auto_242752 ?auto_242753 ) ) ( not ( = ?auto_242752 ?auto_242754 ) ) ( not ( = ?auto_242752 ?auto_242755 ) ) ( not ( = ?auto_242753 ?auto_242754 ) ) ( not ( = ?auto_242753 ?auto_242755 ) ) ( not ( = ?auto_242754 ?auto_242755 ) ) ( ON ?auto_242753 ?auto_242754 ) ( ON ?auto_242752 ?auto_242753 ) ( ON ?auto_242751 ?auto_242752 ) ( ON ?auto_242750 ?auto_242751 ) ( ON ?auto_242749 ?auto_242750 ) ( ON ?auto_242748 ?auto_242749 ) ( CLEAR ?auto_242746 ) ( ON ?auto_242747 ?auto_242748 ) ( CLEAR ?auto_242747 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_242743 ?auto_242744 ?auto_242745 ?auto_242746 ?auto_242747 )
      ( MAKE-12PILE ?auto_242743 ?auto_242744 ?auto_242745 ?auto_242746 ?auto_242747 ?auto_242748 ?auto_242749 ?auto_242750 ?auto_242751 ?auto_242752 ?auto_242753 ?auto_242754 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_242768 - BLOCK
      ?auto_242769 - BLOCK
      ?auto_242770 - BLOCK
      ?auto_242771 - BLOCK
      ?auto_242772 - BLOCK
      ?auto_242773 - BLOCK
      ?auto_242774 - BLOCK
      ?auto_242775 - BLOCK
      ?auto_242776 - BLOCK
      ?auto_242777 - BLOCK
      ?auto_242778 - BLOCK
      ?auto_242779 - BLOCK
    )
    :vars
    (
      ?auto_242780 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_242779 ?auto_242780 ) ( ON-TABLE ?auto_242768 ) ( ON ?auto_242769 ?auto_242768 ) ( ON ?auto_242770 ?auto_242769 ) ( not ( = ?auto_242768 ?auto_242769 ) ) ( not ( = ?auto_242768 ?auto_242770 ) ) ( not ( = ?auto_242768 ?auto_242771 ) ) ( not ( = ?auto_242768 ?auto_242772 ) ) ( not ( = ?auto_242768 ?auto_242773 ) ) ( not ( = ?auto_242768 ?auto_242774 ) ) ( not ( = ?auto_242768 ?auto_242775 ) ) ( not ( = ?auto_242768 ?auto_242776 ) ) ( not ( = ?auto_242768 ?auto_242777 ) ) ( not ( = ?auto_242768 ?auto_242778 ) ) ( not ( = ?auto_242768 ?auto_242779 ) ) ( not ( = ?auto_242768 ?auto_242780 ) ) ( not ( = ?auto_242769 ?auto_242770 ) ) ( not ( = ?auto_242769 ?auto_242771 ) ) ( not ( = ?auto_242769 ?auto_242772 ) ) ( not ( = ?auto_242769 ?auto_242773 ) ) ( not ( = ?auto_242769 ?auto_242774 ) ) ( not ( = ?auto_242769 ?auto_242775 ) ) ( not ( = ?auto_242769 ?auto_242776 ) ) ( not ( = ?auto_242769 ?auto_242777 ) ) ( not ( = ?auto_242769 ?auto_242778 ) ) ( not ( = ?auto_242769 ?auto_242779 ) ) ( not ( = ?auto_242769 ?auto_242780 ) ) ( not ( = ?auto_242770 ?auto_242771 ) ) ( not ( = ?auto_242770 ?auto_242772 ) ) ( not ( = ?auto_242770 ?auto_242773 ) ) ( not ( = ?auto_242770 ?auto_242774 ) ) ( not ( = ?auto_242770 ?auto_242775 ) ) ( not ( = ?auto_242770 ?auto_242776 ) ) ( not ( = ?auto_242770 ?auto_242777 ) ) ( not ( = ?auto_242770 ?auto_242778 ) ) ( not ( = ?auto_242770 ?auto_242779 ) ) ( not ( = ?auto_242770 ?auto_242780 ) ) ( not ( = ?auto_242771 ?auto_242772 ) ) ( not ( = ?auto_242771 ?auto_242773 ) ) ( not ( = ?auto_242771 ?auto_242774 ) ) ( not ( = ?auto_242771 ?auto_242775 ) ) ( not ( = ?auto_242771 ?auto_242776 ) ) ( not ( = ?auto_242771 ?auto_242777 ) ) ( not ( = ?auto_242771 ?auto_242778 ) ) ( not ( = ?auto_242771 ?auto_242779 ) ) ( not ( = ?auto_242771 ?auto_242780 ) ) ( not ( = ?auto_242772 ?auto_242773 ) ) ( not ( = ?auto_242772 ?auto_242774 ) ) ( not ( = ?auto_242772 ?auto_242775 ) ) ( not ( = ?auto_242772 ?auto_242776 ) ) ( not ( = ?auto_242772 ?auto_242777 ) ) ( not ( = ?auto_242772 ?auto_242778 ) ) ( not ( = ?auto_242772 ?auto_242779 ) ) ( not ( = ?auto_242772 ?auto_242780 ) ) ( not ( = ?auto_242773 ?auto_242774 ) ) ( not ( = ?auto_242773 ?auto_242775 ) ) ( not ( = ?auto_242773 ?auto_242776 ) ) ( not ( = ?auto_242773 ?auto_242777 ) ) ( not ( = ?auto_242773 ?auto_242778 ) ) ( not ( = ?auto_242773 ?auto_242779 ) ) ( not ( = ?auto_242773 ?auto_242780 ) ) ( not ( = ?auto_242774 ?auto_242775 ) ) ( not ( = ?auto_242774 ?auto_242776 ) ) ( not ( = ?auto_242774 ?auto_242777 ) ) ( not ( = ?auto_242774 ?auto_242778 ) ) ( not ( = ?auto_242774 ?auto_242779 ) ) ( not ( = ?auto_242774 ?auto_242780 ) ) ( not ( = ?auto_242775 ?auto_242776 ) ) ( not ( = ?auto_242775 ?auto_242777 ) ) ( not ( = ?auto_242775 ?auto_242778 ) ) ( not ( = ?auto_242775 ?auto_242779 ) ) ( not ( = ?auto_242775 ?auto_242780 ) ) ( not ( = ?auto_242776 ?auto_242777 ) ) ( not ( = ?auto_242776 ?auto_242778 ) ) ( not ( = ?auto_242776 ?auto_242779 ) ) ( not ( = ?auto_242776 ?auto_242780 ) ) ( not ( = ?auto_242777 ?auto_242778 ) ) ( not ( = ?auto_242777 ?auto_242779 ) ) ( not ( = ?auto_242777 ?auto_242780 ) ) ( not ( = ?auto_242778 ?auto_242779 ) ) ( not ( = ?auto_242778 ?auto_242780 ) ) ( not ( = ?auto_242779 ?auto_242780 ) ) ( ON ?auto_242778 ?auto_242779 ) ( ON ?auto_242777 ?auto_242778 ) ( ON ?auto_242776 ?auto_242777 ) ( ON ?auto_242775 ?auto_242776 ) ( ON ?auto_242774 ?auto_242775 ) ( ON ?auto_242773 ?auto_242774 ) ( ON ?auto_242772 ?auto_242773 ) ( CLEAR ?auto_242770 ) ( ON ?auto_242771 ?auto_242772 ) ( CLEAR ?auto_242771 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_242768 ?auto_242769 ?auto_242770 ?auto_242771 )
      ( MAKE-12PILE ?auto_242768 ?auto_242769 ?auto_242770 ?auto_242771 ?auto_242772 ?auto_242773 ?auto_242774 ?auto_242775 ?auto_242776 ?auto_242777 ?auto_242778 ?auto_242779 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_242793 - BLOCK
      ?auto_242794 - BLOCK
      ?auto_242795 - BLOCK
      ?auto_242796 - BLOCK
      ?auto_242797 - BLOCK
      ?auto_242798 - BLOCK
      ?auto_242799 - BLOCK
      ?auto_242800 - BLOCK
      ?auto_242801 - BLOCK
      ?auto_242802 - BLOCK
      ?auto_242803 - BLOCK
      ?auto_242804 - BLOCK
    )
    :vars
    (
      ?auto_242805 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_242804 ?auto_242805 ) ( ON-TABLE ?auto_242793 ) ( ON ?auto_242794 ?auto_242793 ) ( ON ?auto_242795 ?auto_242794 ) ( not ( = ?auto_242793 ?auto_242794 ) ) ( not ( = ?auto_242793 ?auto_242795 ) ) ( not ( = ?auto_242793 ?auto_242796 ) ) ( not ( = ?auto_242793 ?auto_242797 ) ) ( not ( = ?auto_242793 ?auto_242798 ) ) ( not ( = ?auto_242793 ?auto_242799 ) ) ( not ( = ?auto_242793 ?auto_242800 ) ) ( not ( = ?auto_242793 ?auto_242801 ) ) ( not ( = ?auto_242793 ?auto_242802 ) ) ( not ( = ?auto_242793 ?auto_242803 ) ) ( not ( = ?auto_242793 ?auto_242804 ) ) ( not ( = ?auto_242793 ?auto_242805 ) ) ( not ( = ?auto_242794 ?auto_242795 ) ) ( not ( = ?auto_242794 ?auto_242796 ) ) ( not ( = ?auto_242794 ?auto_242797 ) ) ( not ( = ?auto_242794 ?auto_242798 ) ) ( not ( = ?auto_242794 ?auto_242799 ) ) ( not ( = ?auto_242794 ?auto_242800 ) ) ( not ( = ?auto_242794 ?auto_242801 ) ) ( not ( = ?auto_242794 ?auto_242802 ) ) ( not ( = ?auto_242794 ?auto_242803 ) ) ( not ( = ?auto_242794 ?auto_242804 ) ) ( not ( = ?auto_242794 ?auto_242805 ) ) ( not ( = ?auto_242795 ?auto_242796 ) ) ( not ( = ?auto_242795 ?auto_242797 ) ) ( not ( = ?auto_242795 ?auto_242798 ) ) ( not ( = ?auto_242795 ?auto_242799 ) ) ( not ( = ?auto_242795 ?auto_242800 ) ) ( not ( = ?auto_242795 ?auto_242801 ) ) ( not ( = ?auto_242795 ?auto_242802 ) ) ( not ( = ?auto_242795 ?auto_242803 ) ) ( not ( = ?auto_242795 ?auto_242804 ) ) ( not ( = ?auto_242795 ?auto_242805 ) ) ( not ( = ?auto_242796 ?auto_242797 ) ) ( not ( = ?auto_242796 ?auto_242798 ) ) ( not ( = ?auto_242796 ?auto_242799 ) ) ( not ( = ?auto_242796 ?auto_242800 ) ) ( not ( = ?auto_242796 ?auto_242801 ) ) ( not ( = ?auto_242796 ?auto_242802 ) ) ( not ( = ?auto_242796 ?auto_242803 ) ) ( not ( = ?auto_242796 ?auto_242804 ) ) ( not ( = ?auto_242796 ?auto_242805 ) ) ( not ( = ?auto_242797 ?auto_242798 ) ) ( not ( = ?auto_242797 ?auto_242799 ) ) ( not ( = ?auto_242797 ?auto_242800 ) ) ( not ( = ?auto_242797 ?auto_242801 ) ) ( not ( = ?auto_242797 ?auto_242802 ) ) ( not ( = ?auto_242797 ?auto_242803 ) ) ( not ( = ?auto_242797 ?auto_242804 ) ) ( not ( = ?auto_242797 ?auto_242805 ) ) ( not ( = ?auto_242798 ?auto_242799 ) ) ( not ( = ?auto_242798 ?auto_242800 ) ) ( not ( = ?auto_242798 ?auto_242801 ) ) ( not ( = ?auto_242798 ?auto_242802 ) ) ( not ( = ?auto_242798 ?auto_242803 ) ) ( not ( = ?auto_242798 ?auto_242804 ) ) ( not ( = ?auto_242798 ?auto_242805 ) ) ( not ( = ?auto_242799 ?auto_242800 ) ) ( not ( = ?auto_242799 ?auto_242801 ) ) ( not ( = ?auto_242799 ?auto_242802 ) ) ( not ( = ?auto_242799 ?auto_242803 ) ) ( not ( = ?auto_242799 ?auto_242804 ) ) ( not ( = ?auto_242799 ?auto_242805 ) ) ( not ( = ?auto_242800 ?auto_242801 ) ) ( not ( = ?auto_242800 ?auto_242802 ) ) ( not ( = ?auto_242800 ?auto_242803 ) ) ( not ( = ?auto_242800 ?auto_242804 ) ) ( not ( = ?auto_242800 ?auto_242805 ) ) ( not ( = ?auto_242801 ?auto_242802 ) ) ( not ( = ?auto_242801 ?auto_242803 ) ) ( not ( = ?auto_242801 ?auto_242804 ) ) ( not ( = ?auto_242801 ?auto_242805 ) ) ( not ( = ?auto_242802 ?auto_242803 ) ) ( not ( = ?auto_242802 ?auto_242804 ) ) ( not ( = ?auto_242802 ?auto_242805 ) ) ( not ( = ?auto_242803 ?auto_242804 ) ) ( not ( = ?auto_242803 ?auto_242805 ) ) ( not ( = ?auto_242804 ?auto_242805 ) ) ( ON ?auto_242803 ?auto_242804 ) ( ON ?auto_242802 ?auto_242803 ) ( ON ?auto_242801 ?auto_242802 ) ( ON ?auto_242800 ?auto_242801 ) ( ON ?auto_242799 ?auto_242800 ) ( ON ?auto_242798 ?auto_242799 ) ( ON ?auto_242797 ?auto_242798 ) ( CLEAR ?auto_242795 ) ( ON ?auto_242796 ?auto_242797 ) ( CLEAR ?auto_242796 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_242793 ?auto_242794 ?auto_242795 ?auto_242796 )
      ( MAKE-12PILE ?auto_242793 ?auto_242794 ?auto_242795 ?auto_242796 ?auto_242797 ?auto_242798 ?auto_242799 ?auto_242800 ?auto_242801 ?auto_242802 ?auto_242803 ?auto_242804 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_242818 - BLOCK
      ?auto_242819 - BLOCK
      ?auto_242820 - BLOCK
      ?auto_242821 - BLOCK
      ?auto_242822 - BLOCK
      ?auto_242823 - BLOCK
      ?auto_242824 - BLOCK
      ?auto_242825 - BLOCK
      ?auto_242826 - BLOCK
      ?auto_242827 - BLOCK
      ?auto_242828 - BLOCK
      ?auto_242829 - BLOCK
    )
    :vars
    (
      ?auto_242830 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_242829 ?auto_242830 ) ( ON-TABLE ?auto_242818 ) ( ON ?auto_242819 ?auto_242818 ) ( not ( = ?auto_242818 ?auto_242819 ) ) ( not ( = ?auto_242818 ?auto_242820 ) ) ( not ( = ?auto_242818 ?auto_242821 ) ) ( not ( = ?auto_242818 ?auto_242822 ) ) ( not ( = ?auto_242818 ?auto_242823 ) ) ( not ( = ?auto_242818 ?auto_242824 ) ) ( not ( = ?auto_242818 ?auto_242825 ) ) ( not ( = ?auto_242818 ?auto_242826 ) ) ( not ( = ?auto_242818 ?auto_242827 ) ) ( not ( = ?auto_242818 ?auto_242828 ) ) ( not ( = ?auto_242818 ?auto_242829 ) ) ( not ( = ?auto_242818 ?auto_242830 ) ) ( not ( = ?auto_242819 ?auto_242820 ) ) ( not ( = ?auto_242819 ?auto_242821 ) ) ( not ( = ?auto_242819 ?auto_242822 ) ) ( not ( = ?auto_242819 ?auto_242823 ) ) ( not ( = ?auto_242819 ?auto_242824 ) ) ( not ( = ?auto_242819 ?auto_242825 ) ) ( not ( = ?auto_242819 ?auto_242826 ) ) ( not ( = ?auto_242819 ?auto_242827 ) ) ( not ( = ?auto_242819 ?auto_242828 ) ) ( not ( = ?auto_242819 ?auto_242829 ) ) ( not ( = ?auto_242819 ?auto_242830 ) ) ( not ( = ?auto_242820 ?auto_242821 ) ) ( not ( = ?auto_242820 ?auto_242822 ) ) ( not ( = ?auto_242820 ?auto_242823 ) ) ( not ( = ?auto_242820 ?auto_242824 ) ) ( not ( = ?auto_242820 ?auto_242825 ) ) ( not ( = ?auto_242820 ?auto_242826 ) ) ( not ( = ?auto_242820 ?auto_242827 ) ) ( not ( = ?auto_242820 ?auto_242828 ) ) ( not ( = ?auto_242820 ?auto_242829 ) ) ( not ( = ?auto_242820 ?auto_242830 ) ) ( not ( = ?auto_242821 ?auto_242822 ) ) ( not ( = ?auto_242821 ?auto_242823 ) ) ( not ( = ?auto_242821 ?auto_242824 ) ) ( not ( = ?auto_242821 ?auto_242825 ) ) ( not ( = ?auto_242821 ?auto_242826 ) ) ( not ( = ?auto_242821 ?auto_242827 ) ) ( not ( = ?auto_242821 ?auto_242828 ) ) ( not ( = ?auto_242821 ?auto_242829 ) ) ( not ( = ?auto_242821 ?auto_242830 ) ) ( not ( = ?auto_242822 ?auto_242823 ) ) ( not ( = ?auto_242822 ?auto_242824 ) ) ( not ( = ?auto_242822 ?auto_242825 ) ) ( not ( = ?auto_242822 ?auto_242826 ) ) ( not ( = ?auto_242822 ?auto_242827 ) ) ( not ( = ?auto_242822 ?auto_242828 ) ) ( not ( = ?auto_242822 ?auto_242829 ) ) ( not ( = ?auto_242822 ?auto_242830 ) ) ( not ( = ?auto_242823 ?auto_242824 ) ) ( not ( = ?auto_242823 ?auto_242825 ) ) ( not ( = ?auto_242823 ?auto_242826 ) ) ( not ( = ?auto_242823 ?auto_242827 ) ) ( not ( = ?auto_242823 ?auto_242828 ) ) ( not ( = ?auto_242823 ?auto_242829 ) ) ( not ( = ?auto_242823 ?auto_242830 ) ) ( not ( = ?auto_242824 ?auto_242825 ) ) ( not ( = ?auto_242824 ?auto_242826 ) ) ( not ( = ?auto_242824 ?auto_242827 ) ) ( not ( = ?auto_242824 ?auto_242828 ) ) ( not ( = ?auto_242824 ?auto_242829 ) ) ( not ( = ?auto_242824 ?auto_242830 ) ) ( not ( = ?auto_242825 ?auto_242826 ) ) ( not ( = ?auto_242825 ?auto_242827 ) ) ( not ( = ?auto_242825 ?auto_242828 ) ) ( not ( = ?auto_242825 ?auto_242829 ) ) ( not ( = ?auto_242825 ?auto_242830 ) ) ( not ( = ?auto_242826 ?auto_242827 ) ) ( not ( = ?auto_242826 ?auto_242828 ) ) ( not ( = ?auto_242826 ?auto_242829 ) ) ( not ( = ?auto_242826 ?auto_242830 ) ) ( not ( = ?auto_242827 ?auto_242828 ) ) ( not ( = ?auto_242827 ?auto_242829 ) ) ( not ( = ?auto_242827 ?auto_242830 ) ) ( not ( = ?auto_242828 ?auto_242829 ) ) ( not ( = ?auto_242828 ?auto_242830 ) ) ( not ( = ?auto_242829 ?auto_242830 ) ) ( ON ?auto_242828 ?auto_242829 ) ( ON ?auto_242827 ?auto_242828 ) ( ON ?auto_242826 ?auto_242827 ) ( ON ?auto_242825 ?auto_242826 ) ( ON ?auto_242824 ?auto_242825 ) ( ON ?auto_242823 ?auto_242824 ) ( ON ?auto_242822 ?auto_242823 ) ( ON ?auto_242821 ?auto_242822 ) ( CLEAR ?auto_242819 ) ( ON ?auto_242820 ?auto_242821 ) ( CLEAR ?auto_242820 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_242818 ?auto_242819 ?auto_242820 )
      ( MAKE-12PILE ?auto_242818 ?auto_242819 ?auto_242820 ?auto_242821 ?auto_242822 ?auto_242823 ?auto_242824 ?auto_242825 ?auto_242826 ?auto_242827 ?auto_242828 ?auto_242829 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_242843 - BLOCK
      ?auto_242844 - BLOCK
      ?auto_242845 - BLOCK
      ?auto_242846 - BLOCK
      ?auto_242847 - BLOCK
      ?auto_242848 - BLOCK
      ?auto_242849 - BLOCK
      ?auto_242850 - BLOCK
      ?auto_242851 - BLOCK
      ?auto_242852 - BLOCK
      ?auto_242853 - BLOCK
      ?auto_242854 - BLOCK
    )
    :vars
    (
      ?auto_242855 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_242854 ?auto_242855 ) ( ON-TABLE ?auto_242843 ) ( ON ?auto_242844 ?auto_242843 ) ( not ( = ?auto_242843 ?auto_242844 ) ) ( not ( = ?auto_242843 ?auto_242845 ) ) ( not ( = ?auto_242843 ?auto_242846 ) ) ( not ( = ?auto_242843 ?auto_242847 ) ) ( not ( = ?auto_242843 ?auto_242848 ) ) ( not ( = ?auto_242843 ?auto_242849 ) ) ( not ( = ?auto_242843 ?auto_242850 ) ) ( not ( = ?auto_242843 ?auto_242851 ) ) ( not ( = ?auto_242843 ?auto_242852 ) ) ( not ( = ?auto_242843 ?auto_242853 ) ) ( not ( = ?auto_242843 ?auto_242854 ) ) ( not ( = ?auto_242843 ?auto_242855 ) ) ( not ( = ?auto_242844 ?auto_242845 ) ) ( not ( = ?auto_242844 ?auto_242846 ) ) ( not ( = ?auto_242844 ?auto_242847 ) ) ( not ( = ?auto_242844 ?auto_242848 ) ) ( not ( = ?auto_242844 ?auto_242849 ) ) ( not ( = ?auto_242844 ?auto_242850 ) ) ( not ( = ?auto_242844 ?auto_242851 ) ) ( not ( = ?auto_242844 ?auto_242852 ) ) ( not ( = ?auto_242844 ?auto_242853 ) ) ( not ( = ?auto_242844 ?auto_242854 ) ) ( not ( = ?auto_242844 ?auto_242855 ) ) ( not ( = ?auto_242845 ?auto_242846 ) ) ( not ( = ?auto_242845 ?auto_242847 ) ) ( not ( = ?auto_242845 ?auto_242848 ) ) ( not ( = ?auto_242845 ?auto_242849 ) ) ( not ( = ?auto_242845 ?auto_242850 ) ) ( not ( = ?auto_242845 ?auto_242851 ) ) ( not ( = ?auto_242845 ?auto_242852 ) ) ( not ( = ?auto_242845 ?auto_242853 ) ) ( not ( = ?auto_242845 ?auto_242854 ) ) ( not ( = ?auto_242845 ?auto_242855 ) ) ( not ( = ?auto_242846 ?auto_242847 ) ) ( not ( = ?auto_242846 ?auto_242848 ) ) ( not ( = ?auto_242846 ?auto_242849 ) ) ( not ( = ?auto_242846 ?auto_242850 ) ) ( not ( = ?auto_242846 ?auto_242851 ) ) ( not ( = ?auto_242846 ?auto_242852 ) ) ( not ( = ?auto_242846 ?auto_242853 ) ) ( not ( = ?auto_242846 ?auto_242854 ) ) ( not ( = ?auto_242846 ?auto_242855 ) ) ( not ( = ?auto_242847 ?auto_242848 ) ) ( not ( = ?auto_242847 ?auto_242849 ) ) ( not ( = ?auto_242847 ?auto_242850 ) ) ( not ( = ?auto_242847 ?auto_242851 ) ) ( not ( = ?auto_242847 ?auto_242852 ) ) ( not ( = ?auto_242847 ?auto_242853 ) ) ( not ( = ?auto_242847 ?auto_242854 ) ) ( not ( = ?auto_242847 ?auto_242855 ) ) ( not ( = ?auto_242848 ?auto_242849 ) ) ( not ( = ?auto_242848 ?auto_242850 ) ) ( not ( = ?auto_242848 ?auto_242851 ) ) ( not ( = ?auto_242848 ?auto_242852 ) ) ( not ( = ?auto_242848 ?auto_242853 ) ) ( not ( = ?auto_242848 ?auto_242854 ) ) ( not ( = ?auto_242848 ?auto_242855 ) ) ( not ( = ?auto_242849 ?auto_242850 ) ) ( not ( = ?auto_242849 ?auto_242851 ) ) ( not ( = ?auto_242849 ?auto_242852 ) ) ( not ( = ?auto_242849 ?auto_242853 ) ) ( not ( = ?auto_242849 ?auto_242854 ) ) ( not ( = ?auto_242849 ?auto_242855 ) ) ( not ( = ?auto_242850 ?auto_242851 ) ) ( not ( = ?auto_242850 ?auto_242852 ) ) ( not ( = ?auto_242850 ?auto_242853 ) ) ( not ( = ?auto_242850 ?auto_242854 ) ) ( not ( = ?auto_242850 ?auto_242855 ) ) ( not ( = ?auto_242851 ?auto_242852 ) ) ( not ( = ?auto_242851 ?auto_242853 ) ) ( not ( = ?auto_242851 ?auto_242854 ) ) ( not ( = ?auto_242851 ?auto_242855 ) ) ( not ( = ?auto_242852 ?auto_242853 ) ) ( not ( = ?auto_242852 ?auto_242854 ) ) ( not ( = ?auto_242852 ?auto_242855 ) ) ( not ( = ?auto_242853 ?auto_242854 ) ) ( not ( = ?auto_242853 ?auto_242855 ) ) ( not ( = ?auto_242854 ?auto_242855 ) ) ( ON ?auto_242853 ?auto_242854 ) ( ON ?auto_242852 ?auto_242853 ) ( ON ?auto_242851 ?auto_242852 ) ( ON ?auto_242850 ?auto_242851 ) ( ON ?auto_242849 ?auto_242850 ) ( ON ?auto_242848 ?auto_242849 ) ( ON ?auto_242847 ?auto_242848 ) ( ON ?auto_242846 ?auto_242847 ) ( CLEAR ?auto_242844 ) ( ON ?auto_242845 ?auto_242846 ) ( CLEAR ?auto_242845 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_242843 ?auto_242844 ?auto_242845 )
      ( MAKE-12PILE ?auto_242843 ?auto_242844 ?auto_242845 ?auto_242846 ?auto_242847 ?auto_242848 ?auto_242849 ?auto_242850 ?auto_242851 ?auto_242852 ?auto_242853 ?auto_242854 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_242868 - BLOCK
      ?auto_242869 - BLOCK
      ?auto_242870 - BLOCK
      ?auto_242871 - BLOCK
      ?auto_242872 - BLOCK
      ?auto_242873 - BLOCK
      ?auto_242874 - BLOCK
      ?auto_242875 - BLOCK
      ?auto_242876 - BLOCK
      ?auto_242877 - BLOCK
      ?auto_242878 - BLOCK
      ?auto_242879 - BLOCK
    )
    :vars
    (
      ?auto_242880 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_242879 ?auto_242880 ) ( ON-TABLE ?auto_242868 ) ( not ( = ?auto_242868 ?auto_242869 ) ) ( not ( = ?auto_242868 ?auto_242870 ) ) ( not ( = ?auto_242868 ?auto_242871 ) ) ( not ( = ?auto_242868 ?auto_242872 ) ) ( not ( = ?auto_242868 ?auto_242873 ) ) ( not ( = ?auto_242868 ?auto_242874 ) ) ( not ( = ?auto_242868 ?auto_242875 ) ) ( not ( = ?auto_242868 ?auto_242876 ) ) ( not ( = ?auto_242868 ?auto_242877 ) ) ( not ( = ?auto_242868 ?auto_242878 ) ) ( not ( = ?auto_242868 ?auto_242879 ) ) ( not ( = ?auto_242868 ?auto_242880 ) ) ( not ( = ?auto_242869 ?auto_242870 ) ) ( not ( = ?auto_242869 ?auto_242871 ) ) ( not ( = ?auto_242869 ?auto_242872 ) ) ( not ( = ?auto_242869 ?auto_242873 ) ) ( not ( = ?auto_242869 ?auto_242874 ) ) ( not ( = ?auto_242869 ?auto_242875 ) ) ( not ( = ?auto_242869 ?auto_242876 ) ) ( not ( = ?auto_242869 ?auto_242877 ) ) ( not ( = ?auto_242869 ?auto_242878 ) ) ( not ( = ?auto_242869 ?auto_242879 ) ) ( not ( = ?auto_242869 ?auto_242880 ) ) ( not ( = ?auto_242870 ?auto_242871 ) ) ( not ( = ?auto_242870 ?auto_242872 ) ) ( not ( = ?auto_242870 ?auto_242873 ) ) ( not ( = ?auto_242870 ?auto_242874 ) ) ( not ( = ?auto_242870 ?auto_242875 ) ) ( not ( = ?auto_242870 ?auto_242876 ) ) ( not ( = ?auto_242870 ?auto_242877 ) ) ( not ( = ?auto_242870 ?auto_242878 ) ) ( not ( = ?auto_242870 ?auto_242879 ) ) ( not ( = ?auto_242870 ?auto_242880 ) ) ( not ( = ?auto_242871 ?auto_242872 ) ) ( not ( = ?auto_242871 ?auto_242873 ) ) ( not ( = ?auto_242871 ?auto_242874 ) ) ( not ( = ?auto_242871 ?auto_242875 ) ) ( not ( = ?auto_242871 ?auto_242876 ) ) ( not ( = ?auto_242871 ?auto_242877 ) ) ( not ( = ?auto_242871 ?auto_242878 ) ) ( not ( = ?auto_242871 ?auto_242879 ) ) ( not ( = ?auto_242871 ?auto_242880 ) ) ( not ( = ?auto_242872 ?auto_242873 ) ) ( not ( = ?auto_242872 ?auto_242874 ) ) ( not ( = ?auto_242872 ?auto_242875 ) ) ( not ( = ?auto_242872 ?auto_242876 ) ) ( not ( = ?auto_242872 ?auto_242877 ) ) ( not ( = ?auto_242872 ?auto_242878 ) ) ( not ( = ?auto_242872 ?auto_242879 ) ) ( not ( = ?auto_242872 ?auto_242880 ) ) ( not ( = ?auto_242873 ?auto_242874 ) ) ( not ( = ?auto_242873 ?auto_242875 ) ) ( not ( = ?auto_242873 ?auto_242876 ) ) ( not ( = ?auto_242873 ?auto_242877 ) ) ( not ( = ?auto_242873 ?auto_242878 ) ) ( not ( = ?auto_242873 ?auto_242879 ) ) ( not ( = ?auto_242873 ?auto_242880 ) ) ( not ( = ?auto_242874 ?auto_242875 ) ) ( not ( = ?auto_242874 ?auto_242876 ) ) ( not ( = ?auto_242874 ?auto_242877 ) ) ( not ( = ?auto_242874 ?auto_242878 ) ) ( not ( = ?auto_242874 ?auto_242879 ) ) ( not ( = ?auto_242874 ?auto_242880 ) ) ( not ( = ?auto_242875 ?auto_242876 ) ) ( not ( = ?auto_242875 ?auto_242877 ) ) ( not ( = ?auto_242875 ?auto_242878 ) ) ( not ( = ?auto_242875 ?auto_242879 ) ) ( not ( = ?auto_242875 ?auto_242880 ) ) ( not ( = ?auto_242876 ?auto_242877 ) ) ( not ( = ?auto_242876 ?auto_242878 ) ) ( not ( = ?auto_242876 ?auto_242879 ) ) ( not ( = ?auto_242876 ?auto_242880 ) ) ( not ( = ?auto_242877 ?auto_242878 ) ) ( not ( = ?auto_242877 ?auto_242879 ) ) ( not ( = ?auto_242877 ?auto_242880 ) ) ( not ( = ?auto_242878 ?auto_242879 ) ) ( not ( = ?auto_242878 ?auto_242880 ) ) ( not ( = ?auto_242879 ?auto_242880 ) ) ( ON ?auto_242878 ?auto_242879 ) ( ON ?auto_242877 ?auto_242878 ) ( ON ?auto_242876 ?auto_242877 ) ( ON ?auto_242875 ?auto_242876 ) ( ON ?auto_242874 ?auto_242875 ) ( ON ?auto_242873 ?auto_242874 ) ( ON ?auto_242872 ?auto_242873 ) ( ON ?auto_242871 ?auto_242872 ) ( ON ?auto_242870 ?auto_242871 ) ( CLEAR ?auto_242868 ) ( ON ?auto_242869 ?auto_242870 ) ( CLEAR ?auto_242869 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_242868 ?auto_242869 )
      ( MAKE-12PILE ?auto_242868 ?auto_242869 ?auto_242870 ?auto_242871 ?auto_242872 ?auto_242873 ?auto_242874 ?auto_242875 ?auto_242876 ?auto_242877 ?auto_242878 ?auto_242879 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_242893 - BLOCK
      ?auto_242894 - BLOCK
      ?auto_242895 - BLOCK
      ?auto_242896 - BLOCK
      ?auto_242897 - BLOCK
      ?auto_242898 - BLOCK
      ?auto_242899 - BLOCK
      ?auto_242900 - BLOCK
      ?auto_242901 - BLOCK
      ?auto_242902 - BLOCK
      ?auto_242903 - BLOCK
      ?auto_242904 - BLOCK
    )
    :vars
    (
      ?auto_242905 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_242904 ?auto_242905 ) ( ON-TABLE ?auto_242893 ) ( not ( = ?auto_242893 ?auto_242894 ) ) ( not ( = ?auto_242893 ?auto_242895 ) ) ( not ( = ?auto_242893 ?auto_242896 ) ) ( not ( = ?auto_242893 ?auto_242897 ) ) ( not ( = ?auto_242893 ?auto_242898 ) ) ( not ( = ?auto_242893 ?auto_242899 ) ) ( not ( = ?auto_242893 ?auto_242900 ) ) ( not ( = ?auto_242893 ?auto_242901 ) ) ( not ( = ?auto_242893 ?auto_242902 ) ) ( not ( = ?auto_242893 ?auto_242903 ) ) ( not ( = ?auto_242893 ?auto_242904 ) ) ( not ( = ?auto_242893 ?auto_242905 ) ) ( not ( = ?auto_242894 ?auto_242895 ) ) ( not ( = ?auto_242894 ?auto_242896 ) ) ( not ( = ?auto_242894 ?auto_242897 ) ) ( not ( = ?auto_242894 ?auto_242898 ) ) ( not ( = ?auto_242894 ?auto_242899 ) ) ( not ( = ?auto_242894 ?auto_242900 ) ) ( not ( = ?auto_242894 ?auto_242901 ) ) ( not ( = ?auto_242894 ?auto_242902 ) ) ( not ( = ?auto_242894 ?auto_242903 ) ) ( not ( = ?auto_242894 ?auto_242904 ) ) ( not ( = ?auto_242894 ?auto_242905 ) ) ( not ( = ?auto_242895 ?auto_242896 ) ) ( not ( = ?auto_242895 ?auto_242897 ) ) ( not ( = ?auto_242895 ?auto_242898 ) ) ( not ( = ?auto_242895 ?auto_242899 ) ) ( not ( = ?auto_242895 ?auto_242900 ) ) ( not ( = ?auto_242895 ?auto_242901 ) ) ( not ( = ?auto_242895 ?auto_242902 ) ) ( not ( = ?auto_242895 ?auto_242903 ) ) ( not ( = ?auto_242895 ?auto_242904 ) ) ( not ( = ?auto_242895 ?auto_242905 ) ) ( not ( = ?auto_242896 ?auto_242897 ) ) ( not ( = ?auto_242896 ?auto_242898 ) ) ( not ( = ?auto_242896 ?auto_242899 ) ) ( not ( = ?auto_242896 ?auto_242900 ) ) ( not ( = ?auto_242896 ?auto_242901 ) ) ( not ( = ?auto_242896 ?auto_242902 ) ) ( not ( = ?auto_242896 ?auto_242903 ) ) ( not ( = ?auto_242896 ?auto_242904 ) ) ( not ( = ?auto_242896 ?auto_242905 ) ) ( not ( = ?auto_242897 ?auto_242898 ) ) ( not ( = ?auto_242897 ?auto_242899 ) ) ( not ( = ?auto_242897 ?auto_242900 ) ) ( not ( = ?auto_242897 ?auto_242901 ) ) ( not ( = ?auto_242897 ?auto_242902 ) ) ( not ( = ?auto_242897 ?auto_242903 ) ) ( not ( = ?auto_242897 ?auto_242904 ) ) ( not ( = ?auto_242897 ?auto_242905 ) ) ( not ( = ?auto_242898 ?auto_242899 ) ) ( not ( = ?auto_242898 ?auto_242900 ) ) ( not ( = ?auto_242898 ?auto_242901 ) ) ( not ( = ?auto_242898 ?auto_242902 ) ) ( not ( = ?auto_242898 ?auto_242903 ) ) ( not ( = ?auto_242898 ?auto_242904 ) ) ( not ( = ?auto_242898 ?auto_242905 ) ) ( not ( = ?auto_242899 ?auto_242900 ) ) ( not ( = ?auto_242899 ?auto_242901 ) ) ( not ( = ?auto_242899 ?auto_242902 ) ) ( not ( = ?auto_242899 ?auto_242903 ) ) ( not ( = ?auto_242899 ?auto_242904 ) ) ( not ( = ?auto_242899 ?auto_242905 ) ) ( not ( = ?auto_242900 ?auto_242901 ) ) ( not ( = ?auto_242900 ?auto_242902 ) ) ( not ( = ?auto_242900 ?auto_242903 ) ) ( not ( = ?auto_242900 ?auto_242904 ) ) ( not ( = ?auto_242900 ?auto_242905 ) ) ( not ( = ?auto_242901 ?auto_242902 ) ) ( not ( = ?auto_242901 ?auto_242903 ) ) ( not ( = ?auto_242901 ?auto_242904 ) ) ( not ( = ?auto_242901 ?auto_242905 ) ) ( not ( = ?auto_242902 ?auto_242903 ) ) ( not ( = ?auto_242902 ?auto_242904 ) ) ( not ( = ?auto_242902 ?auto_242905 ) ) ( not ( = ?auto_242903 ?auto_242904 ) ) ( not ( = ?auto_242903 ?auto_242905 ) ) ( not ( = ?auto_242904 ?auto_242905 ) ) ( ON ?auto_242903 ?auto_242904 ) ( ON ?auto_242902 ?auto_242903 ) ( ON ?auto_242901 ?auto_242902 ) ( ON ?auto_242900 ?auto_242901 ) ( ON ?auto_242899 ?auto_242900 ) ( ON ?auto_242898 ?auto_242899 ) ( ON ?auto_242897 ?auto_242898 ) ( ON ?auto_242896 ?auto_242897 ) ( ON ?auto_242895 ?auto_242896 ) ( CLEAR ?auto_242893 ) ( ON ?auto_242894 ?auto_242895 ) ( CLEAR ?auto_242894 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_242893 ?auto_242894 )
      ( MAKE-12PILE ?auto_242893 ?auto_242894 ?auto_242895 ?auto_242896 ?auto_242897 ?auto_242898 ?auto_242899 ?auto_242900 ?auto_242901 ?auto_242902 ?auto_242903 ?auto_242904 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_242918 - BLOCK
      ?auto_242919 - BLOCK
      ?auto_242920 - BLOCK
      ?auto_242921 - BLOCK
      ?auto_242922 - BLOCK
      ?auto_242923 - BLOCK
      ?auto_242924 - BLOCK
      ?auto_242925 - BLOCK
      ?auto_242926 - BLOCK
      ?auto_242927 - BLOCK
      ?auto_242928 - BLOCK
      ?auto_242929 - BLOCK
    )
    :vars
    (
      ?auto_242930 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_242929 ?auto_242930 ) ( not ( = ?auto_242918 ?auto_242919 ) ) ( not ( = ?auto_242918 ?auto_242920 ) ) ( not ( = ?auto_242918 ?auto_242921 ) ) ( not ( = ?auto_242918 ?auto_242922 ) ) ( not ( = ?auto_242918 ?auto_242923 ) ) ( not ( = ?auto_242918 ?auto_242924 ) ) ( not ( = ?auto_242918 ?auto_242925 ) ) ( not ( = ?auto_242918 ?auto_242926 ) ) ( not ( = ?auto_242918 ?auto_242927 ) ) ( not ( = ?auto_242918 ?auto_242928 ) ) ( not ( = ?auto_242918 ?auto_242929 ) ) ( not ( = ?auto_242918 ?auto_242930 ) ) ( not ( = ?auto_242919 ?auto_242920 ) ) ( not ( = ?auto_242919 ?auto_242921 ) ) ( not ( = ?auto_242919 ?auto_242922 ) ) ( not ( = ?auto_242919 ?auto_242923 ) ) ( not ( = ?auto_242919 ?auto_242924 ) ) ( not ( = ?auto_242919 ?auto_242925 ) ) ( not ( = ?auto_242919 ?auto_242926 ) ) ( not ( = ?auto_242919 ?auto_242927 ) ) ( not ( = ?auto_242919 ?auto_242928 ) ) ( not ( = ?auto_242919 ?auto_242929 ) ) ( not ( = ?auto_242919 ?auto_242930 ) ) ( not ( = ?auto_242920 ?auto_242921 ) ) ( not ( = ?auto_242920 ?auto_242922 ) ) ( not ( = ?auto_242920 ?auto_242923 ) ) ( not ( = ?auto_242920 ?auto_242924 ) ) ( not ( = ?auto_242920 ?auto_242925 ) ) ( not ( = ?auto_242920 ?auto_242926 ) ) ( not ( = ?auto_242920 ?auto_242927 ) ) ( not ( = ?auto_242920 ?auto_242928 ) ) ( not ( = ?auto_242920 ?auto_242929 ) ) ( not ( = ?auto_242920 ?auto_242930 ) ) ( not ( = ?auto_242921 ?auto_242922 ) ) ( not ( = ?auto_242921 ?auto_242923 ) ) ( not ( = ?auto_242921 ?auto_242924 ) ) ( not ( = ?auto_242921 ?auto_242925 ) ) ( not ( = ?auto_242921 ?auto_242926 ) ) ( not ( = ?auto_242921 ?auto_242927 ) ) ( not ( = ?auto_242921 ?auto_242928 ) ) ( not ( = ?auto_242921 ?auto_242929 ) ) ( not ( = ?auto_242921 ?auto_242930 ) ) ( not ( = ?auto_242922 ?auto_242923 ) ) ( not ( = ?auto_242922 ?auto_242924 ) ) ( not ( = ?auto_242922 ?auto_242925 ) ) ( not ( = ?auto_242922 ?auto_242926 ) ) ( not ( = ?auto_242922 ?auto_242927 ) ) ( not ( = ?auto_242922 ?auto_242928 ) ) ( not ( = ?auto_242922 ?auto_242929 ) ) ( not ( = ?auto_242922 ?auto_242930 ) ) ( not ( = ?auto_242923 ?auto_242924 ) ) ( not ( = ?auto_242923 ?auto_242925 ) ) ( not ( = ?auto_242923 ?auto_242926 ) ) ( not ( = ?auto_242923 ?auto_242927 ) ) ( not ( = ?auto_242923 ?auto_242928 ) ) ( not ( = ?auto_242923 ?auto_242929 ) ) ( not ( = ?auto_242923 ?auto_242930 ) ) ( not ( = ?auto_242924 ?auto_242925 ) ) ( not ( = ?auto_242924 ?auto_242926 ) ) ( not ( = ?auto_242924 ?auto_242927 ) ) ( not ( = ?auto_242924 ?auto_242928 ) ) ( not ( = ?auto_242924 ?auto_242929 ) ) ( not ( = ?auto_242924 ?auto_242930 ) ) ( not ( = ?auto_242925 ?auto_242926 ) ) ( not ( = ?auto_242925 ?auto_242927 ) ) ( not ( = ?auto_242925 ?auto_242928 ) ) ( not ( = ?auto_242925 ?auto_242929 ) ) ( not ( = ?auto_242925 ?auto_242930 ) ) ( not ( = ?auto_242926 ?auto_242927 ) ) ( not ( = ?auto_242926 ?auto_242928 ) ) ( not ( = ?auto_242926 ?auto_242929 ) ) ( not ( = ?auto_242926 ?auto_242930 ) ) ( not ( = ?auto_242927 ?auto_242928 ) ) ( not ( = ?auto_242927 ?auto_242929 ) ) ( not ( = ?auto_242927 ?auto_242930 ) ) ( not ( = ?auto_242928 ?auto_242929 ) ) ( not ( = ?auto_242928 ?auto_242930 ) ) ( not ( = ?auto_242929 ?auto_242930 ) ) ( ON ?auto_242928 ?auto_242929 ) ( ON ?auto_242927 ?auto_242928 ) ( ON ?auto_242926 ?auto_242927 ) ( ON ?auto_242925 ?auto_242926 ) ( ON ?auto_242924 ?auto_242925 ) ( ON ?auto_242923 ?auto_242924 ) ( ON ?auto_242922 ?auto_242923 ) ( ON ?auto_242921 ?auto_242922 ) ( ON ?auto_242920 ?auto_242921 ) ( ON ?auto_242919 ?auto_242920 ) ( ON ?auto_242918 ?auto_242919 ) ( CLEAR ?auto_242918 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_242918 )
      ( MAKE-12PILE ?auto_242918 ?auto_242919 ?auto_242920 ?auto_242921 ?auto_242922 ?auto_242923 ?auto_242924 ?auto_242925 ?auto_242926 ?auto_242927 ?auto_242928 ?auto_242929 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_242943 - BLOCK
      ?auto_242944 - BLOCK
      ?auto_242945 - BLOCK
      ?auto_242946 - BLOCK
      ?auto_242947 - BLOCK
      ?auto_242948 - BLOCK
      ?auto_242949 - BLOCK
      ?auto_242950 - BLOCK
      ?auto_242951 - BLOCK
      ?auto_242952 - BLOCK
      ?auto_242953 - BLOCK
      ?auto_242954 - BLOCK
    )
    :vars
    (
      ?auto_242955 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_242954 ?auto_242955 ) ( not ( = ?auto_242943 ?auto_242944 ) ) ( not ( = ?auto_242943 ?auto_242945 ) ) ( not ( = ?auto_242943 ?auto_242946 ) ) ( not ( = ?auto_242943 ?auto_242947 ) ) ( not ( = ?auto_242943 ?auto_242948 ) ) ( not ( = ?auto_242943 ?auto_242949 ) ) ( not ( = ?auto_242943 ?auto_242950 ) ) ( not ( = ?auto_242943 ?auto_242951 ) ) ( not ( = ?auto_242943 ?auto_242952 ) ) ( not ( = ?auto_242943 ?auto_242953 ) ) ( not ( = ?auto_242943 ?auto_242954 ) ) ( not ( = ?auto_242943 ?auto_242955 ) ) ( not ( = ?auto_242944 ?auto_242945 ) ) ( not ( = ?auto_242944 ?auto_242946 ) ) ( not ( = ?auto_242944 ?auto_242947 ) ) ( not ( = ?auto_242944 ?auto_242948 ) ) ( not ( = ?auto_242944 ?auto_242949 ) ) ( not ( = ?auto_242944 ?auto_242950 ) ) ( not ( = ?auto_242944 ?auto_242951 ) ) ( not ( = ?auto_242944 ?auto_242952 ) ) ( not ( = ?auto_242944 ?auto_242953 ) ) ( not ( = ?auto_242944 ?auto_242954 ) ) ( not ( = ?auto_242944 ?auto_242955 ) ) ( not ( = ?auto_242945 ?auto_242946 ) ) ( not ( = ?auto_242945 ?auto_242947 ) ) ( not ( = ?auto_242945 ?auto_242948 ) ) ( not ( = ?auto_242945 ?auto_242949 ) ) ( not ( = ?auto_242945 ?auto_242950 ) ) ( not ( = ?auto_242945 ?auto_242951 ) ) ( not ( = ?auto_242945 ?auto_242952 ) ) ( not ( = ?auto_242945 ?auto_242953 ) ) ( not ( = ?auto_242945 ?auto_242954 ) ) ( not ( = ?auto_242945 ?auto_242955 ) ) ( not ( = ?auto_242946 ?auto_242947 ) ) ( not ( = ?auto_242946 ?auto_242948 ) ) ( not ( = ?auto_242946 ?auto_242949 ) ) ( not ( = ?auto_242946 ?auto_242950 ) ) ( not ( = ?auto_242946 ?auto_242951 ) ) ( not ( = ?auto_242946 ?auto_242952 ) ) ( not ( = ?auto_242946 ?auto_242953 ) ) ( not ( = ?auto_242946 ?auto_242954 ) ) ( not ( = ?auto_242946 ?auto_242955 ) ) ( not ( = ?auto_242947 ?auto_242948 ) ) ( not ( = ?auto_242947 ?auto_242949 ) ) ( not ( = ?auto_242947 ?auto_242950 ) ) ( not ( = ?auto_242947 ?auto_242951 ) ) ( not ( = ?auto_242947 ?auto_242952 ) ) ( not ( = ?auto_242947 ?auto_242953 ) ) ( not ( = ?auto_242947 ?auto_242954 ) ) ( not ( = ?auto_242947 ?auto_242955 ) ) ( not ( = ?auto_242948 ?auto_242949 ) ) ( not ( = ?auto_242948 ?auto_242950 ) ) ( not ( = ?auto_242948 ?auto_242951 ) ) ( not ( = ?auto_242948 ?auto_242952 ) ) ( not ( = ?auto_242948 ?auto_242953 ) ) ( not ( = ?auto_242948 ?auto_242954 ) ) ( not ( = ?auto_242948 ?auto_242955 ) ) ( not ( = ?auto_242949 ?auto_242950 ) ) ( not ( = ?auto_242949 ?auto_242951 ) ) ( not ( = ?auto_242949 ?auto_242952 ) ) ( not ( = ?auto_242949 ?auto_242953 ) ) ( not ( = ?auto_242949 ?auto_242954 ) ) ( not ( = ?auto_242949 ?auto_242955 ) ) ( not ( = ?auto_242950 ?auto_242951 ) ) ( not ( = ?auto_242950 ?auto_242952 ) ) ( not ( = ?auto_242950 ?auto_242953 ) ) ( not ( = ?auto_242950 ?auto_242954 ) ) ( not ( = ?auto_242950 ?auto_242955 ) ) ( not ( = ?auto_242951 ?auto_242952 ) ) ( not ( = ?auto_242951 ?auto_242953 ) ) ( not ( = ?auto_242951 ?auto_242954 ) ) ( not ( = ?auto_242951 ?auto_242955 ) ) ( not ( = ?auto_242952 ?auto_242953 ) ) ( not ( = ?auto_242952 ?auto_242954 ) ) ( not ( = ?auto_242952 ?auto_242955 ) ) ( not ( = ?auto_242953 ?auto_242954 ) ) ( not ( = ?auto_242953 ?auto_242955 ) ) ( not ( = ?auto_242954 ?auto_242955 ) ) ( ON ?auto_242953 ?auto_242954 ) ( ON ?auto_242952 ?auto_242953 ) ( ON ?auto_242951 ?auto_242952 ) ( ON ?auto_242950 ?auto_242951 ) ( ON ?auto_242949 ?auto_242950 ) ( ON ?auto_242948 ?auto_242949 ) ( ON ?auto_242947 ?auto_242948 ) ( ON ?auto_242946 ?auto_242947 ) ( ON ?auto_242945 ?auto_242946 ) ( ON ?auto_242944 ?auto_242945 ) ( ON ?auto_242943 ?auto_242944 ) ( CLEAR ?auto_242943 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_242943 )
      ( MAKE-12PILE ?auto_242943 ?auto_242944 ?auto_242945 ?auto_242946 ?auto_242947 ?auto_242948 ?auto_242949 ?auto_242950 ?auto_242951 ?auto_242952 ?auto_242953 ?auto_242954 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_242969 - BLOCK
      ?auto_242970 - BLOCK
      ?auto_242971 - BLOCK
      ?auto_242972 - BLOCK
      ?auto_242973 - BLOCK
      ?auto_242974 - BLOCK
      ?auto_242975 - BLOCK
      ?auto_242976 - BLOCK
      ?auto_242977 - BLOCK
      ?auto_242978 - BLOCK
      ?auto_242979 - BLOCK
      ?auto_242980 - BLOCK
      ?auto_242981 - BLOCK
    )
    :vars
    (
      ?auto_242982 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_242980 ) ( ON ?auto_242981 ?auto_242982 ) ( CLEAR ?auto_242981 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_242969 ) ( ON ?auto_242970 ?auto_242969 ) ( ON ?auto_242971 ?auto_242970 ) ( ON ?auto_242972 ?auto_242971 ) ( ON ?auto_242973 ?auto_242972 ) ( ON ?auto_242974 ?auto_242973 ) ( ON ?auto_242975 ?auto_242974 ) ( ON ?auto_242976 ?auto_242975 ) ( ON ?auto_242977 ?auto_242976 ) ( ON ?auto_242978 ?auto_242977 ) ( ON ?auto_242979 ?auto_242978 ) ( ON ?auto_242980 ?auto_242979 ) ( not ( = ?auto_242969 ?auto_242970 ) ) ( not ( = ?auto_242969 ?auto_242971 ) ) ( not ( = ?auto_242969 ?auto_242972 ) ) ( not ( = ?auto_242969 ?auto_242973 ) ) ( not ( = ?auto_242969 ?auto_242974 ) ) ( not ( = ?auto_242969 ?auto_242975 ) ) ( not ( = ?auto_242969 ?auto_242976 ) ) ( not ( = ?auto_242969 ?auto_242977 ) ) ( not ( = ?auto_242969 ?auto_242978 ) ) ( not ( = ?auto_242969 ?auto_242979 ) ) ( not ( = ?auto_242969 ?auto_242980 ) ) ( not ( = ?auto_242969 ?auto_242981 ) ) ( not ( = ?auto_242969 ?auto_242982 ) ) ( not ( = ?auto_242970 ?auto_242971 ) ) ( not ( = ?auto_242970 ?auto_242972 ) ) ( not ( = ?auto_242970 ?auto_242973 ) ) ( not ( = ?auto_242970 ?auto_242974 ) ) ( not ( = ?auto_242970 ?auto_242975 ) ) ( not ( = ?auto_242970 ?auto_242976 ) ) ( not ( = ?auto_242970 ?auto_242977 ) ) ( not ( = ?auto_242970 ?auto_242978 ) ) ( not ( = ?auto_242970 ?auto_242979 ) ) ( not ( = ?auto_242970 ?auto_242980 ) ) ( not ( = ?auto_242970 ?auto_242981 ) ) ( not ( = ?auto_242970 ?auto_242982 ) ) ( not ( = ?auto_242971 ?auto_242972 ) ) ( not ( = ?auto_242971 ?auto_242973 ) ) ( not ( = ?auto_242971 ?auto_242974 ) ) ( not ( = ?auto_242971 ?auto_242975 ) ) ( not ( = ?auto_242971 ?auto_242976 ) ) ( not ( = ?auto_242971 ?auto_242977 ) ) ( not ( = ?auto_242971 ?auto_242978 ) ) ( not ( = ?auto_242971 ?auto_242979 ) ) ( not ( = ?auto_242971 ?auto_242980 ) ) ( not ( = ?auto_242971 ?auto_242981 ) ) ( not ( = ?auto_242971 ?auto_242982 ) ) ( not ( = ?auto_242972 ?auto_242973 ) ) ( not ( = ?auto_242972 ?auto_242974 ) ) ( not ( = ?auto_242972 ?auto_242975 ) ) ( not ( = ?auto_242972 ?auto_242976 ) ) ( not ( = ?auto_242972 ?auto_242977 ) ) ( not ( = ?auto_242972 ?auto_242978 ) ) ( not ( = ?auto_242972 ?auto_242979 ) ) ( not ( = ?auto_242972 ?auto_242980 ) ) ( not ( = ?auto_242972 ?auto_242981 ) ) ( not ( = ?auto_242972 ?auto_242982 ) ) ( not ( = ?auto_242973 ?auto_242974 ) ) ( not ( = ?auto_242973 ?auto_242975 ) ) ( not ( = ?auto_242973 ?auto_242976 ) ) ( not ( = ?auto_242973 ?auto_242977 ) ) ( not ( = ?auto_242973 ?auto_242978 ) ) ( not ( = ?auto_242973 ?auto_242979 ) ) ( not ( = ?auto_242973 ?auto_242980 ) ) ( not ( = ?auto_242973 ?auto_242981 ) ) ( not ( = ?auto_242973 ?auto_242982 ) ) ( not ( = ?auto_242974 ?auto_242975 ) ) ( not ( = ?auto_242974 ?auto_242976 ) ) ( not ( = ?auto_242974 ?auto_242977 ) ) ( not ( = ?auto_242974 ?auto_242978 ) ) ( not ( = ?auto_242974 ?auto_242979 ) ) ( not ( = ?auto_242974 ?auto_242980 ) ) ( not ( = ?auto_242974 ?auto_242981 ) ) ( not ( = ?auto_242974 ?auto_242982 ) ) ( not ( = ?auto_242975 ?auto_242976 ) ) ( not ( = ?auto_242975 ?auto_242977 ) ) ( not ( = ?auto_242975 ?auto_242978 ) ) ( not ( = ?auto_242975 ?auto_242979 ) ) ( not ( = ?auto_242975 ?auto_242980 ) ) ( not ( = ?auto_242975 ?auto_242981 ) ) ( not ( = ?auto_242975 ?auto_242982 ) ) ( not ( = ?auto_242976 ?auto_242977 ) ) ( not ( = ?auto_242976 ?auto_242978 ) ) ( not ( = ?auto_242976 ?auto_242979 ) ) ( not ( = ?auto_242976 ?auto_242980 ) ) ( not ( = ?auto_242976 ?auto_242981 ) ) ( not ( = ?auto_242976 ?auto_242982 ) ) ( not ( = ?auto_242977 ?auto_242978 ) ) ( not ( = ?auto_242977 ?auto_242979 ) ) ( not ( = ?auto_242977 ?auto_242980 ) ) ( not ( = ?auto_242977 ?auto_242981 ) ) ( not ( = ?auto_242977 ?auto_242982 ) ) ( not ( = ?auto_242978 ?auto_242979 ) ) ( not ( = ?auto_242978 ?auto_242980 ) ) ( not ( = ?auto_242978 ?auto_242981 ) ) ( not ( = ?auto_242978 ?auto_242982 ) ) ( not ( = ?auto_242979 ?auto_242980 ) ) ( not ( = ?auto_242979 ?auto_242981 ) ) ( not ( = ?auto_242979 ?auto_242982 ) ) ( not ( = ?auto_242980 ?auto_242981 ) ) ( not ( = ?auto_242980 ?auto_242982 ) ) ( not ( = ?auto_242981 ?auto_242982 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_242981 ?auto_242982 )
      ( !STACK ?auto_242981 ?auto_242980 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_242996 - BLOCK
      ?auto_242997 - BLOCK
      ?auto_242998 - BLOCK
      ?auto_242999 - BLOCK
      ?auto_243000 - BLOCK
      ?auto_243001 - BLOCK
      ?auto_243002 - BLOCK
      ?auto_243003 - BLOCK
      ?auto_243004 - BLOCK
      ?auto_243005 - BLOCK
      ?auto_243006 - BLOCK
      ?auto_243007 - BLOCK
      ?auto_243008 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_243007 ) ( ON-TABLE ?auto_243008 ) ( CLEAR ?auto_243008 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_242996 ) ( ON ?auto_242997 ?auto_242996 ) ( ON ?auto_242998 ?auto_242997 ) ( ON ?auto_242999 ?auto_242998 ) ( ON ?auto_243000 ?auto_242999 ) ( ON ?auto_243001 ?auto_243000 ) ( ON ?auto_243002 ?auto_243001 ) ( ON ?auto_243003 ?auto_243002 ) ( ON ?auto_243004 ?auto_243003 ) ( ON ?auto_243005 ?auto_243004 ) ( ON ?auto_243006 ?auto_243005 ) ( ON ?auto_243007 ?auto_243006 ) ( not ( = ?auto_242996 ?auto_242997 ) ) ( not ( = ?auto_242996 ?auto_242998 ) ) ( not ( = ?auto_242996 ?auto_242999 ) ) ( not ( = ?auto_242996 ?auto_243000 ) ) ( not ( = ?auto_242996 ?auto_243001 ) ) ( not ( = ?auto_242996 ?auto_243002 ) ) ( not ( = ?auto_242996 ?auto_243003 ) ) ( not ( = ?auto_242996 ?auto_243004 ) ) ( not ( = ?auto_242996 ?auto_243005 ) ) ( not ( = ?auto_242996 ?auto_243006 ) ) ( not ( = ?auto_242996 ?auto_243007 ) ) ( not ( = ?auto_242996 ?auto_243008 ) ) ( not ( = ?auto_242997 ?auto_242998 ) ) ( not ( = ?auto_242997 ?auto_242999 ) ) ( not ( = ?auto_242997 ?auto_243000 ) ) ( not ( = ?auto_242997 ?auto_243001 ) ) ( not ( = ?auto_242997 ?auto_243002 ) ) ( not ( = ?auto_242997 ?auto_243003 ) ) ( not ( = ?auto_242997 ?auto_243004 ) ) ( not ( = ?auto_242997 ?auto_243005 ) ) ( not ( = ?auto_242997 ?auto_243006 ) ) ( not ( = ?auto_242997 ?auto_243007 ) ) ( not ( = ?auto_242997 ?auto_243008 ) ) ( not ( = ?auto_242998 ?auto_242999 ) ) ( not ( = ?auto_242998 ?auto_243000 ) ) ( not ( = ?auto_242998 ?auto_243001 ) ) ( not ( = ?auto_242998 ?auto_243002 ) ) ( not ( = ?auto_242998 ?auto_243003 ) ) ( not ( = ?auto_242998 ?auto_243004 ) ) ( not ( = ?auto_242998 ?auto_243005 ) ) ( not ( = ?auto_242998 ?auto_243006 ) ) ( not ( = ?auto_242998 ?auto_243007 ) ) ( not ( = ?auto_242998 ?auto_243008 ) ) ( not ( = ?auto_242999 ?auto_243000 ) ) ( not ( = ?auto_242999 ?auto_243001 ) ) ( not ( = ?auto_242999 ?auto_243002 ) ) ( not ( = ?auto_242999 ?auto_243003 ) ) ( not ( = ?auto_242999 ?auto_243004 ) ) ( not ( = ?auto_242999 ?auto_243005 ) ) ( not ( = ?auto_242999 ?auto_243006 ) ) ( not ( = ?auto_242999 ?auto_243007 ) ) ( not ( = ?auto_242999 ?auto_243008 ) ) ( not ( = ?auto_243000 ?auto_243001 ) ) ( not ( = ?auto_243000 ?auto_243002 ) ) ( not ( = ?auto_243000 ?auto_243003 ) ) ( not ( = ?auto_243000 ?auto_243004 ) ) ( not ( = ?auto_243000 ?auto_243005 ) ) ( not ( = ?auto_243000 ?auto_243006 ) ) ( not ( = ?auto_243000 ?auto_243007 ) ) ( not ( = ?auto_243000 ?auto_243008 ) ) ( not ( = ?auto_243001 ?auto_243002 ) ) ( not ( = ?auto_243001 ?auto_243003 ) ) ( not ( = ?auto_243001 ?auto_243004 ) ) ( not ( = ?auto_243001 ?auto_243005 ) ) ( not ( = ?auto_243001 ?auto_243006 ) ) ( not ( = ?auto_243001 ?auto_243007 ) ) ( not ( = ?auto_243001 ?auto_243008 ) ) ( not ( = ?auto_243002 ?auto_243003 ) ) ( not ( = ?auto_243002 ?auto_243004 ) ) ( not ( = ?auto_243002 ?auto_243005 ) ) ( not ( = ?auto_243002 ?auto_243006 ) ) ( not ( = ?auto_243002 ?auto_243007 ) ) ( not ( = ?auto_243002 ?auto_243008 ) ) ( not ( = ?auto_243003 ?auto_243004 ) ) ( not ( = ?auto_243003 ?auto_243005 ) ) ( not ( = ?auto_243003 ?auto_243006 ) ) ( not ( = ?auto_243003 ?auto_243007 ) ) ( not ( = ?auto_243003 ?auto_243008 ) ) ( not ( = ?auto_243004 ?auto_243005 ) ) ( not ( = ?auto_243004 ?auto_243006 ) ) ( not ( = ?auto_243004 ?auto_243007 ) ) ( not ( = ?auto_243004 ?auto_243008 ) ) ( not ( = ?auto_243005 ?auto_243006 ) ) ( not ( = ?auto_243005 ?auto_243007 ) ) ( not ( = ?auto_243005 ?auto_243008 ) ) ( not ( = ?auto_243006 ?auto_243007 ) ) ( not ( = ?auto_243006 ?auto_243008 ) ) ( not ( = ?auto_243007 ?auto_243008 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_243008 )
      ( !STACK ?auto_243008 ?auto_243007 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_243022 - BLOCK
      ?auto_243023 - BLOCK
      ?auto_243024 - BLOCK
      ?auto_243025 - BLOCK
      ?auto_243026 - BLOCK
      ?auto_243027 - BLOCK
      ?auto_243028 - BLOCK
      ?auto_243029 - BLOCK
      ?auto_243030 - BLOCK
      ?auto_243031 - BLOCK
      ?auto_243032 - BLOCK
      ?auto_243033 - BLOCK
      ?auto_243034 - BLOCK
    )
    :vars
    (
      ?auto_243035 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_243034 ?auto_243035 ) ( ON-TABLE ?auto_243022 ) ( ON ?auto_243023 ?auto_243022 ) ( ON ?auto_243024 ?auto_243023 ) ( ON ?auto_243025 ?auto_243024 ) ( ON ?auto_243026 ?auto_243025 ) ( ON ?auto_243027 ?auto_243026 ) ( ON ?auto_243028 ?auto_243027 ) ( ON ?auto_243029 ?auto_243028 ) ( ON ?auto_243030 ?auto_243029 ) ( ON ?auto_243031 ?auto_243030 ) ( ON ?auto_243032 ?auto_243031 ) ( not ( = ?auto_243022 ?auto_243023 ) ) ( not ( = ?auto_243022 ?auto_243024 ) ) ( not ( = ?auto_243022 ?auto_243025 ) ) ( not ( = ?auto_243022 ?auto_243026 ) ) ( not ( = ?auto_243022 ?auto_243027 ) ) ( not ( = ?auto_243022 ?auto_243028 ) ) ( not ( = ?auto_243022 ?auto_243029 ) ) ( not ( = ?auto_243022 ?auto_243030 ) ) ( not ( = ?auto_243022 ?auto_243031 ) ) ( not ( = ?auto_243022 ?auto_243032 ) ) ( not ( = ?auto_243022 ?auto_243033 ) ) ( not ( = ?auto_243022 ?auto_243034 ) ) ( not ( = ?auto_243022 ?auto_243035 ) ) ( not ( = ?auto_243023 ?auto_243024 ) ) ( not ( = ?auto_243023 ?auto_243025 ) ) ( not ( = ?auto_243023 ?auto_243026 ) ) ( not ( = ?auto_243023 ?auto_243027 ) ) ( not ( = ?auto_243023 ?auto_243028 ) ) ( not ( = ?auto_243023 ?auto_243029 ) ) ( not ( = ?auto_243023 ?auto_243030 ) ) ( not ( = ?auto_243023 ?auto_243031 ) ) ( not ( = ?auto_243023 ?auto_243032 ) ) ( not ( = ?auto_243023 ?auto_243033 ) ) ( not ( = ?auto_243023 ?auto_243034 ) ) ( not ( = ?auto_243023 ?auto_243035 ) ) ( not ( = ?auto_243024 ?auto_243025 ) ) ( not ( = ?auto_243024 ?auto_243026 ) ) ( not ( = ?auto_243024 ?auto_243027 ) ) ( not ( = ?auto_243024 ?auto_243028 ) ) ( not ( = ?auto_243024 ?auto_243029 ) ) ( not ( = ?auto_243024 ?auto_243030 ) ) ( not ( = ?auto_243024 ?auto_243031 ) ) ( not ( = ?auto_243024 ?auto_243032 ) ) ( not ( = ?auto_243024 ?auto_243033 ) ) ( not ( = ?auto_243024 ?auto_243034 ) ) ( not ( = ?auto_243024 ?auto_243035 ) ) ( not ( = ?auto_243025 ?auto_243026 ) ) ( not ( = ?auto_243025 ?auto_243027 ) ) ( not ( = ?auto_243025 ?auto_243028 ) ) ( not ( = ?auto_243025 ?auto_243029 ) ) ( not ( = ?auto_243025 ?auto_243030 ) ) ( not ( = ?auto_243025 ?auto_243031 ) ) ( not ( = ?auto_243025 ?auto_243032 ) ) ( not ( = ?auto_243025 ?auto_243033 ) ) ( not ( = ?auto_243025 ?auto_243034 ) ) ( not ( = ?auto_243025 ?auto_243035 ) ) ( not ( = ?auto_243026 ?auto_243027 ) ) ( not ( = ?auto_243026 ?auto_243028 ) ) ( not ( = ?auto_243026 ?auto_243029 ) ) ( not ( = ?auto_243026 ?auto_243030 ) ) ( not ( = ?auto_243026 ?auto_243031 ) ) ( not ( = ?auto_243026 ?auto_243032 ) ) ( not ( = ?auto_243026 ?auto_243033 ) ) ( not ( = ?auto_243026 ?auto_243034 ) ) ( not ( = ?auto_243026 ?auto_243035 ) ) ( not ( = ?auto_243027 ?auto_243028 ) ) ( not ( = ?auto_243027 ?auto_243029 ) ) ( not ( = ?auto_243027 ?auto_243030 ) ) ( not ( = ?auto_243027 ?auto_243031 ) ) ( not ( = ?auto_243027 ?auto_243032 ) ) ( not ( = ?auto_243027 ?auto_243033 ) ) ( not ( = ?auto_243027 ?auto_243034 ) ) ( not ( = ?auto_243027 ?auto_243035 ) ) ( not ( = ?auto_243028 ?auto_243029 ) ) ( not ( = ?auto_243028 ?auto_243030 ) ) ( not ( = ?auto_243028 ?auto_243031 ) ) ( not ( = ?auto_243028 ?auto_243032 ) ) ( not ( = ?auto_243028 ?auto_243033 ) ) ( not ( = ?auto_243028 ?auto_243034 ) ) ( not ( = ?auto_243028 ?auto_243035 ) ) ( not ( = ?auto_243029 ?auto_243030 ) ) ( not ( = ?auto_243029 ?auto_243031 ) ) ( not ( = ?auto_243029 ?auto_243032 ) ) ( not ( = ?auto_243029 ?auto_243033 ) ) ( not ( = ?auto_243029 ?auto_243034 ) ) ( not ( = ?auto_243029 ?auto_243035 ) ) ( not ( = ?auto_243030 ?auto_243031 ) ) ( not ( = ?auto_243030 ?auto_243032 ) ) ( not ( = ?auto_243030 ?auto_243033 ) ) ( not ( = ?auto_243030 ?auto_243034 ) ) ( not ( = ?auto_243030 ?auto_243035 ) ) ( not ( = ?auto_243031 ?auto_243032 ) ) ( not ( = ?auto_243031 ?auto_243033 ) ) ( not ( = ?auto_243031 ?auto_243034 ) ) ( not ( = ?auto_243031 ?auto_243035 ) ) ( not ( = ?auto_243032 ?auto_243033 ) ) ( not ( = ?auto_243032 ?auto_243034 ) ) ( not ( = ?auto_243032 ?auto_243035 ) ) ( not ( = ?auto_243033 ?auto_243034 ) ) ( not ( = ?auto_243033 ?auto_243035 ) ) ( not ( = ?auto_243034 ?auto_243035 ) ) ( CLEAR ?auto_243032 ) ( ON ?auto_243033 ?auto_243034 ) ( CLEAR ?auto_243033 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_243022 ?auto_243023 ?auto_243024 ?auto_243025 ?auto_243026 ?auto_243027 ?auto_243028 ?auto_243029 ?auto_243030 ?auto_243031 ?auto_243032 ?auto_243033 )
      ( MAKE-13PILE ?auto_243022 ?auto_243023 ?auto_243024 ?auto_243025 ?auto_243026 ?auto_243027 ?auto_243028 ?auto_243029 ?auto_243030 ?auto_243031 ?auto_243032 ?auto_243033 ?auto_243034 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_243049 - BLOCK
      ?auto_243050 - BLOCK
      ?auto_243051 - BLOCK
      ?auto_243052 - BLOCK
      ?auto_243053 - BLOCK
      ?auto_243054 - BLOCK
      ?auto_243055 - BLOCK
      ?auto_243056 - BLOCK
      ?auto_243057 - BLOCK
      ?auto_243058 - BLOCK
      ?auto_243059 - BLOCK
      ?auto_243060 - BLOCK
      ?auto_243061 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_243061 ) ( ON-TABLE ?auto_243049 ) ( ON ?auto_243050 ?auto_243049 ) ( ON ?auto_243051 ?auto_243050 ) ( ON ?auto_243052 ?auto_243051 ) ( ON ?auto_243053 ?auto_243052 ) ( ON ?auto_243054 ?auto_243053 ) ( ON ?auto_243055 ?auto_243054 ) ( ON ?auto_243056 ?auto_243055 ) ( ON ?auto_243057 ?auto_243056 ) ( ON ?auto_243058 ?auto_243057 ) ( ON ?auto_243059 ?auto_243058 ) ( not ( = ?auto_243049 ?auto_243050 ) ) ( not ( = ?auto_243049 ?auto_243051 ) ) ( not ( = ?auto_243049 ?auto_243052 ) ) ( not ( = ?auto_243049 ?auto_243053 ) ) ( not ( = ?auto_243049 ?auto_243054 ) ) ( not ( = ?auto_243049 ?auto_243055 ) ) ( not ( = ?auto_243049 ?auto_243056 ) ) ( not ( = ?auto_243049 ?auto_243057 ) ) ( not ( = ?auto_243049 ?auto_243058 ) ) ( not ( = ?auto_243049 ?auto_243059 ) ) ( not ( = ?auto_243049 ?auto_243060 ) ) ( not ( = ?auto_243049 ?auto_243061 ) ) ( not ( = ?auto_243050 ?auto_243051 ) ) ( not ( = ?auto_243050 ?auto_243052 ) ) ( not ( = ?auto_243050 ?auto_243053 ) ) ( not ( = ?auto_243050 ?auto_243054 ) ) ( not ( = ?auto_243050 ?auto_243055 ) ) ( not ( = ?auto_243050 ?auto_243056 ) ) ( not ( = ?auto_243050 ?auto_243057 ) ) ( not ( = ?auto_243050 ?auto_243058 ) ) ( not ( = ?auto_243050 ?auto_243059 ) ) ( not ( = ?auto_243050 ?auto_243060 ) ) ( not ( = ?auto_243050 ?auto_243061 ) ) ( not ( = ?auto_243051 ?auto_243052 ) ) ( not ( = ?auto_243051 ?auto_243053 ) ) ( not ( = ?auto_243051 ?auto_243054 ) ) ( not ( = ?auto_243051 ?auto_243055 ) ) ( not ( = ?auto_243051 ?auto_243056 ) ) ( not ( = ?auto_243051 ?auto_243057 ) ) ( not ( = ?auto_243051 ?auto_243058 ) ) ( not ( = ?auto_243051 ?auto_243059 ) ) ( not ( = ?auto_243051 ?auto_243060 ) ) ( not ( = ?auto_243051 ?auto_243061 ) ) ( not ( = ?auto_243052 ?auto_243053 ) ) ( not ( = ?auto_243052 ?auto_243054 ) ) ( not ( = ?auto_243052 ?auto_243055 ) ) ( not ( = ?auto_243052 ?auto_243056 ) ) ( not ( = ?auto_243052 ?auto_243057 ) ) ( not ( = ?auto_243052 ?auto_243058 ) ) ( not ( = ?auto_243052 ?auto_243059 ) ) ( not ( = ?auto_243052 ?auto_243060 ) ) ( not ( = ?auto_243052 ?auto_243061 ) ) ( not ( = ?auto_243053 ?auto_243054 ) ) ( not ( = ?auto_243053 ?auto_243055 ) ) ( not ( = ?auto_243053 ?auto_243056 ) ) ( not ( = ?auto_243053 ?auto_243057 ) ) ( not ( = ?auto_243053 ?auto_243058 ) ) ( not ( = ?auto_243053 ?auto_243059 ) ) ( not ( = ?auto_243053 ?auto_243060 ) ) ( not ( = ?auto_243053 ?auto_243061 ) ) ( not ( = ?auto_243054 ?auto_243055 ) ) ( not ( = ?auto_243054 ?auto_243056 ) ) ( not ( = ?auto_243054 ?auto_243057 ) ) ( not ( = ?auto_243054 ?auto_243058 ) ) ( not ( = ?auto_243054 ?auto_243059 ) ) ( not ( = ?auto_243054 ?auto_243060 ) ) ( not ( = ?auto_243054 ?auto_243061 ) ) ( not ( = ?auto_243055 ?auto_243056 ) ) ( not ( = ?auto_243055 ?auto_243057 ) ) ( not ( = ?auto_243055 ?auto_243058 ) ) ( not ( = ?auto_243055 ?auto_243059 ) ) ( not ( = ?auto_243055 ?auto_243060 ) ) ( not ( = ?auto_243055 ?auto_243061 ) ) ( not ( = ?auto_243056 ?auto_243057 ) ) ( not ( = ?auto_243056 ?auto_243058 ) ) ( not ( = ?auto_243056 ?auto_243059 ) ) ( not ( = ?auto_243056 ?auto_243060 ) ) ( not ( = ?auto_243056 ?auto_243061 ) ) ( not ( = ?auto_243057 ?auto_243058 ) ) ( not ( = ?auto_243057 ?auto_243059 ) ) ( not ( = ?auto_243057 ?auto_243060 ) ) ( not ( = ?auto_243057 ?auto_243061 ) ) ( not ( = ?auto_243058 ?auto_243059 ) ) ( not ( = ?auto_243058 ?auto_243060 ) ) ( not ( = ?auto_243058 ?auto_243061 ) ) ( not ( = ?auto_243059 ?auto_243060 ) ) ( not ( = ?auto_243059 ?auto_243061 ) ) ( not ( = ?auto_243060 ?auto_243061 ) ) ( CLEAR ?auto_243059 ) ( ON ?auto_243060 ?auto_243061 ) ( CLEAR ?auto_243060 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_243049 ?auto_243050 ?auto_243051 ?auto_243052 ?auto_243053 ?auto_243054 ?auto_243055 ?auto_243056 ?auto_243057 ?auto_243058 ?auto_243059 ?auto_243060 )
      ( MAKE-13PILE ?auto_243049 ?auto_243050 ?auto_243051 ?auto_243052 ?auto_243053 ?auto_243054 ?auto_243055 ?auto_243056 ?auto_243057 ?auto_243058 ?auto_243059 ?auto_243060 ?auto_243061 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_243075 - BLOCK
      ?auto_243076 - BLOCK
      ?auto_243077 - BLOCK
      ?auto_243078 - BLOCK
      ?auto_243079 - BLOCK
      ?auto_243080 - BLOCK
      ?auto_243081 - BLOCK
      ?auto_243082 - BLOCK
      ?auto_243083 - BLOCK
      ?auto_243084 - BLOCK
      ?auto_243085 - BLOCK
      ?auto_243086 - BLOCK
      ?auto_243087 - BLOCK
    )
    :vars
    (
      ?auto_243088 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_243087 ?auto_243088 ) ( ON-TABLE ?auto_243075 ) ( ON ?auto_243076 ?auto_243075 ) ( ON ?auto_243077 ?auto_243076 ) ( ON ?auto_243078 ?auto_243077 ) ( ON ?auto_243079 ?auto_243078 ) ( ON ?auto_243080 ?auto_243079 ) ( ON ?auto_243081 ?auto_243080 ) ( ON ?auto_243082 ?auto_243081 ) ( ON ?auto_243083 ?auto_243082 ) ( ON ?auto_243084 ?auto_243083 ) ( not ( = ?auto_243075 ?auto_243076 ) ) ( not ( = ?auto_243075 ?auto_243077 ) ) ( not ( = ?auto_243075 ?auto_243078 ) ) ( not ( = ?auto_243075 ?auto_243079 ) ) ( not ( = ?auto_243075 ?auto_243080 ) ) ( not ( = ?auto_243075 ?auto_243081 ) ) ( not ( = ?auto_243075 ?auto_243082 ) ) ( not ( = ?auto_243075 ?auto_243083 ) ) ( not ( = ?auto_243075 ?auto_243084 ) ) ( not ( = ?auto_243075 ?auto_243085 ) ) ( not ( = ?auto_243075 ?auto_243086 ) ) ( not ( = ?auto_243075 ?auto_243087 ) ) ( not ( = ?auto_243075 ?auto_243088 ) ) ( not ( = ?auto_243076 ?auto_243077 ) ) ( not ( = ?auto_243076 ?auto_243078 ) ) ( not ( = ?auto_243076 ?auto_243079 ) ) ( not ( = ?auto_243076 ?auto_243080 ) ) ( not ( = ?auto_243076 ?auto_243081 ) ) ( not ( = ?auto_243076 ?auto_243082 ) ) ( not ( = ?auto_243076 ?auto_243083 ) ) ( not ( = ?auto_243076 ?auto_243084 ) ) ( not ( = ?auto_243076 ?auto_243085 ) ) ( not ( = ?auto_243076 ?auto_243086 ) ) ( not ( = ?auto_243076 ?auto_243087 ) ) ( not ( = ?auto_243076 ?auto_243088 ) ) ( not ( = ?auto_243077 ?auto_243078 ) ) ( not ( = ?auto_243077 ?auto_243079 ) ) ( not ( = ?auto_243077 ?auto_243080 ) ) ( not ( = ?auto_243077 ?auto_243081 ) ) ( not ( = ?auto_243077 ?auto_243082 ) ) ( not ( = ?auto_243077 ?auto_243083 ) ) ( not ( = ?auto_243077 ?auto_243084 ) ) ( not ( = ?auto_243077 ?auto_243085 ) ) ( not ( = ?auto_243077 ?auto_243086 ) ) ( not ( = ?auto_243077 ?auto_243087 ) ) ( not ( = ?auto_243077 ?auto_243088 ) ) ( not ( = ?auto_243078 ?auto_243079 ) ) ( not ( = ?auto_243078 ?auto_243080 ) ) ( not ( = ?auto_243078 ?auto_243081 ) ) ( not ( = ?auto_243078 ?auto_243082 ) ) ( not ( = ?auto_243078 ?auto_243083 ) ) ( not ( = ?auto_243078 ?auto_243084 ) ) ( not ( = ?auto_243078 ?auto_243085 ) ) ( not ( = ?auto_243078 ?auto_243086 ) ) ( not ( = ?auto_243078 ?auto_243087 ) ) ( not ( = ?auto_243078 ?auto_243088 ) ) ( not ( = ?auto_243079 ?auto_243080 ) ) ( not ( = ?auto_243079 ?auto_243081 ) ) ( not ( = ?auto_243079 ?auto_243082 ) ) ( not ( = ?auto_243079 ?auto_243083 ) ) ( not ( = ?auto_243079 ?auto_243084 ) ) ( not ( = ?auto_243079 ?auto_243085 ) ) ( not ( = ?auto_243079 ?auto_243086 ) ) ( not ( = ?auto_243079 ?auto_243087 ) ) ( not ( = ?auto_243079 ?auto_243088 ) ) ( not ( = ?auto_243080 ?auto_243081 ) ) ( not ( = ?auto_243080 ?auto_243082 ) ) ( not ( = ?auto_243080 ?auto_243083 ) ) ( not ( = ?auto_243080 ?auto_243084 ) ) ( not ( = ?auto_243080 ?auto_243085 ) ) ( not ( = ?auto_243080 ?auto_243086 ) ) ( not ( = ?auto_243080 ?auto_243087 ) ) ( not ( = ?auto_243080 ?auto_243088 ) ) ( not ( = ?auto_243081 ?auto_243082 ) ) ( not ( = ?auto_243081 ?auto_243083 ) ) ( not ( = ?auto_243081 ?auto_243084 ) ) ( not ( = ?auto_243081 ?auto_243085 ) ) ( not ( = ?auto_243081 ?auto_243086 ) ) ( not ( = ?auto_243081 ?auto_243087 ) ) ( not ( = ?auto_243081 ?auto_243088 ) ) ( not ( = ?auto_243082 ?auto_243083 ) ) ( not ( = ?auto_243082 ?auto_243084 ) ) ( not ( = ?auto_243082 ?auto_243085 ) ) ( not ( = ?auto_243082 ?auto_243086 ) ) ( not ( = ?auto_243082 ?auto_243087 ) ) ( not ( = ?auto_243082 ?auto_243088 ) ) ( not ( = ?auto_243083 ?auto_243084 ) ) ( not ( = ?auto_243083 ?auto_243085 ) ) ( not ( = ?auto_243083 ?auto_243086 ) ) ( not ( = ?auto_243083 ?auto_243087 ) ) ( not ( = ?auto_243083 ?auto_243088 ) ) ( not ( = ?auto_243084 ?auto_243085 ) ) ( not ( = ?auto_243084 ?auto_243086 ) ) ( not ( = ?auto_243084 ?auto_243087 ) ) ( not ( = ?auto_243084 ?auto_243088 ) ) ( not ( = ?auto_243085 ?auto_243086 ) ) ( not ( = ?auto_243085 ?auto_243087 ) ) ( not ( = ?auto_243085 ?auto_243088 ) ) ( not ( = ?auto_243086 ?auto_243087 ) ) ( not ( = ?auto_243086 ?auto_243088 ) ) ( not ( = ?auto_243087 ?auto_243088 ) ) ( ON ?auto_243086 ?auto_243087 ) ( CLEAR ?auto_243084 ) ( ON ?auto_243085 ?auto_243086 ) ( CLEAR ?auto_243085 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_243075 ?auto_243076 ?auto_243077 ?auto_243078 ?auto_243079 ?auto_243080 ?auto_243081 ?auto_243082 ?auto_243083 ?auto_243084 ?auto_243085 )
      ( MAKE-13PILE ?auto_243075 ?auto_243076 ?auto_243077 ?auto_243078 ?auto_243079 ?auto_243080 ?auto_243081 ?auto_243082 ?auto_243083 ?auto_243084 ?auto_243085 ?auto_243086 ?auto_243087 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_243102 - BLOCK
      ?auto_243103 - BLOCK
      ?auto_243104 - BLOCK
      ?auto_243105 - BLOCK
      ?auto_243106 - BLOCK
      ?auto_243107 - BLOCK
      ?auto_243108 - BLOCK
      ?auto_243109 - BLOCK
      ?auto_243110 - BLOCK
      ?auto_243111 - BLOCK
      ?auto_243112 - BLOCK
      ?auto_243113 - BLOCK
      ?auto_243114 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_243114 ) ( ON-TABLE ?auto_243102 ) ( ON ?auto_243103 ?auto_243102 ) ( ON ?auto_243104 ?auto_243103 ) ( ON ?auto_243105 ?auto_243104 ) ( ON ?auto_243106 ?auto_243105 ) ( ON ?auto_243107 ?auto_243106 ) ( ON ?auto_243108 ?auto_243107 ) ( ON ?auto_243109 ?auto_243108 ) ( ON ?auto_243110 ?auto_243109 ) ( ON ?auto_243111 ?auto_243110 ) ( not ( = ?auto_243102 ?auto_243103 ) ) ( not ( = ?auto_243102 ?auto_243104 ) ) ( not ( = ?auto_243102 ?auto_243105 ) ) ( not ( = ?auto_243102 ?auto_243106 ) ) ( not ( = ?auto_243102 ?auto_243107 ) ) ( not ( = ?auto_243102 ?auto_243108 ) ) ( not ( = ?auto_243102 ?auto_243109 ) ) ( not ( = ?auto_243102 ?auto_243110 ) ) ( not ( = ?auto_243102 ?auto_243111 ) ) ( not ( = ?auto_243102 ?auto_243112 ) ) ( not ( = ?auto_243102 ?auto_243113 ) ) ( not ( = ?auto_243102 ?auto_243114 ) ) ( not ( = ?auto_243103 ?auto_243104 ) ) ( not ( = ?auto_243103 ?auto_243105 ) ) ( not ( = ?auto_243103 ?auto_243106 ) ) ( not ( = ?auto_243103 ?auto_243107 ) ) ( not ( = ?auto_243103 ?auto_243108 ) ) ( not ( = ?auto_243103 ?auto_243109 ) ) ( not ( = ?auto_243103 ?auto_243110 ) ) ( not ( = ?auto_243103 ?auto_243111 ) ) ( not ( = ?auto_243103 ?auto_243112 ) ) ( not ( = ?auto_243103 ?auto_243113 ) ) ( not ( = ?auto_243103 ?auto_243114 ) ) ( not ( = ?auto_243104 ?auto_243105 ) ) ( not ( = ?auto_243104 ?auto_243106 ) ) ( not ( = ?auto_243104 ?auto_243107 ) ) ( not ( = ?auto_243104 ?auto_243108 ) ) ( not ( = ?auto_243104 ?auto_243109 ) ) ( not ( = ?auto_243104 ?auto_243110 ) ) ( not ( = ?auto_243104 ?auto_243111 ) ) ( not ( = ?auto_243104 ?auto_243112 ) ) ( not ( = ?auto_243104 ?auto_243113 ) ) ( not ( = ?auto_243104 ?auto_243114 ) ) ( not ( = ?auto_243105 ?auto_243106 ) ) ( not ( = ?auto_243105 ?auto_243107 ) ) ( not ( = ?auto_243105 ?auto_243108 ) ) ( not ( = ?auto_243105 ?auto_243109 ) ) ( not ( = ?auto_243105 ?auto_243110 ) ) ( not ( = ?auto_243105 ?auto_243111 ) ) ( not ( = ?auto_243105 ?auto_243112 ) ) ( not ( = ?auto_243105 ?auto_243113 ) ) ( not ( = ?auto_243105 ?auto_243114 ) ) ( not ( = ?auto_243106 ?auto_243107 ) ) ( not ( = ?auto_243106 ?auto_243108 ) ) ( not ( = ?auto_243106 ?auto_243109 ) ) ( not ( = ?auto_243106 ?auto_243110 ) ) ( not ( = ?auto_243106 ?auto_243111 ) ) ( not ( = ?auto_243106 ?auto_243112 ) ) ( not ( = ?auto_243106 ?auto_243113 ) ) ( not ( = ?auto_243106 ?auto_243114 ) ) ( not ( = ?auto_243107 ?auto_243108 ) ) ( not ( = ?auto_243107 ?auto_243109 ) ) ( not ( = ?auto_243107 ?auto_243110 ) ) ( not ( = ?auto_243107 ?auto_243111 ) ) ( not ( = ?auto_243107 ?auto_243112 ) ) ( not ( = ?auto_243107 ?auto_243113 ) ) ( not ( = ?auto_243107 ?auto_243114 ) ) ( not ( = ?auto_243108 ?auto_243109 ) ) ( not ( = ?auto_243108 ?auto_243110 ) ) ( not ( = ?auto_243108 ?auto_243111 ) ) ( not ( = ?auto_243108 ?auto_243112 ) ) ( not ( = ?auto_243108 ?auto_243113 ) ) ( not ( = ?auto_243108 ?auto_243114 ) ) ( not ( = ?auto_243109 ?auto_243110 ) ) ( not ( = ?auto_243109 ?auto_243111 ) ) ( not ( = ?auto_243109 ?auto_243112 ) ) ( not ( = ?auto_243109 ?auto_243113 ) ) ( not ( = ?auto_243109 ?auto_243114 ) ) ( not ( = ?auto_243110 ?auto_243111 ) ) ( not ( = ?auto_243110 ?auto_243112 ) ) ( not ( = ?auto_243110 ?auto_243113 ) ) ( not ( = ?auto_243110 ?auto_243114 ) ) ( not ( = ?auto_243111 ?auto_243112 ) ) ( not ( = ?auto_243111 ?auto_243113 ) ) ( not ( = ?auto_243111 ?auto_243114 ) ) ( not ( = ?auto_243112 ?auto_243113 ) ) ( not ( = ?auto_243112 ?auto_243114 ) ) ( not ( = ?auto_243113 ?auto_243114 ) ) ( ON ?auto_243113 ?auto_243114 ) ( CLEAR ?auto_243111 ) ( ON ?auto_243112 ?auto_243113 ) ( CLEAR ?auto_243112 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_243102 ?auto_243103 ?auto_243104 ?auto_243105 ?auto_243106 ?auto_243107 ?auto_243108 ?auto_243109 ?auto_243110 ?auto_243111 ?auto_243112 )
      ( MAKE-13PILE ?auto_243102 ?auto_243103 ?auto_243104 ?auto_243105 ?auto_243106 ?auto_243107 ?auto_243108 ?auto_243109 ?auto_243110 ?auto_243111 ?auto_243112 ?auto_243113 ?auto_243114 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_243128 - BLOCK
      ?auto_243129 - BLOCK
      ?auto_243130 - BLOCK
      ?auto_243131 - BLOCK
      ?auto_243132 - BLOCK
      ?auto_243133 - BLOCK
      ?auto_243134 - BLOCK
      ?auto_243135 - BLOCK
      ?auto_243136 - BLOCK
      ?auto_243137 - BLOCK
      ?auto_243138 - BLOCK
      ?auto_243139 - BLOCK
      ?auto_243140 - BLOCK
    )
    :vars
    (
      ?auto_243141 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_243140 ?auto_243141 ) ( ON-TABLE ?auto_243128 ) ( ON ?auto_243129 ?auto_243128 ) ( ON ?auto_243130 ?auto_243129 ) ( ON ?auto_243131 ?auto_243130 ) ( ON ?auto_243132 ?auto_243131 ) ( ON ?auto_243133 ?auto_243132 ) ( ON ?auto_243134 ?auto_243133 ) ( ON ?auto_243135 ?auto_243134 ) ( ON ?auto_243136 ?auto_243135 ) ( not ( = ?auto_243128 ?auto_243129 ) ) ( not ( = ?auto_243128 ?auto_243130 ) ) ( not ( = ?auto_243128 ?auto_243131 ) ) ( not ( = ?auto_243128 ?auto_243132 ) ) ( not ( = ?auto_243128 ?auto_243133 ) ) ( not ( = ?auto_243128 ?auto_243134 ) ) ( not ( = ?auto_243128 ?auto_243135 ) ) ( not ( = ?auto_243128 ?auto_243136 ) ) ( not ( = ?auto_243128 ?auto_243137 ) ) ( not ( = ?auto_243128 ?auto_243138 ) ) ( not ( = ?auto_243128 ?auto_243139 ) ) ( not ( = ?auto_243128 ?auto_243140 ) ) ( not ( = ?auto_243128 ?auto_243141 ) ) ( not ( = ?auto_243129 ?auto_243130 ) ) ( not ( = ?auto_243129 ?auto_243131 ) ) ( not ( = ?auto_243129 ?auto_243132 ) ) ( not ( = ?auto_243129 ?auto_243133 ) ) ( not ( = ?auto_243129 ?auto_243134 ) ) ( not ( = ?auto_243129 ?auto_243135 ) ) ( not ( = ?auto_243129 ?auto_243136 ) ) ( not ( = ?auto_243129 ?auto_243137 ) ) ( not ( = ?auto_243129 ?auto_243138 ) ) ( not ( = ?auto_243129 ?auto_243139 ) ) ( not ( = ?auto_243129 ?auto_243140 ) ) ( not ( = ?auto_243129 ?auto_243141 ) ) ( not ( = ?auto_243130 ?auto_243131 ) ) ( not ( = ?auto_243130 ?auto_243132 ) ) ( not ( = ?auto_243130 ?auto_243133 ) ) ( not ( = ?auto_243130 ?auto_243134 ) ) ( not ( = ?auto_243130 ?auto_243135 ) ) ( not ( = ?auto_243130 ?auto_243136 ) ) ( not ( = ?auto_243130 ?auto_243137 ) ) ( not ( = ?auto_243130 ?auto_243138 ) ) ( not ( = ?auto_243130 ?auto_243139 ) ) ( not ( = ?auto_243130 ?auto_243140 ) ) ( not ( = ?auto_243130 ?auto_243141 ) ) ( not ( = ?auto_243131 ?auto_243132 ) ) ( not ( = ?auto_243131 ?auto_243133 ) ) ( not ( = ?auto_243131 ?auto_243134 ) ) ( not ( = ?auto_243131 ?auto_243135 ) ) ( not ( = ?auto_243131 ?auto_243136 ) ) ( not ( = ?auto_243131 ?auto_243137 ) ) ( not ( = ?auto_243131 ?auto_243138 ) ) ( not ( = ?auto_243131 ?auto_243139 ) ) ( not ( = ?auto_243131 ?auto_243140 ) ) ( not ( = ?auto_243131 ?auto_243141 ) ) ( not ( = ?auto_243132 ?auto_243133 ) ) ( not ( = ?auto_243132 ?auto_243134 ) ) ( not ( = ?auto_243132 ?auto_243135 ) ) ( not ( = ?auto_243132 ?auto_243136 ) ) ( not ( = ?auto_243132 ?auto_243137 ) ) ( not ( = ?auto_243132 ?auto_243138 ) ) ( not ( = ?auto_243132 ?auto_243139 ) ) ( not ( = ?auto_243132 ?auto_243140 ) ) ( not ( = ?auto_243132 ?auto_243141 ) ) ( not ( = ?auto_243133 ?auto_243134 ) ) ( not ( = ?auto_243133 ?auto_243135 ) ) ( not ( = ?auto_243133 ?auto_243136 ) ) ( not ( = ?auto_243133 ?auto_243137 ) ) ( not ( = ?auto_243133 ?auto_243138 ) ) ( not ( = ?auto_243133 ?auto_243139 ) ) ( not ( = ?auto_243133 ?auto_243140 ) ) ( not ( = ?auto_243133 ?auto_243141 ) ) ( not ( = ?auto_243134 ?auto_243135 ) ) ( not ( = ?auto_243134 ?auto_243136 ) ) ( not ( = ?auto_243134 ?auto_243137 ) ) ( not ( = ?auto_243134 ?auto_243138 ) ) ( not ( = ?auto_243134 ?auto_243139 ) ) ( not ( = ?auto_243134 ?auto_243140 ) ) ( not ( = ?auto_243134 ?auto_243141 ) ) ( not ( = ?auto_243135 ?auto_243136 ) ) ( not ( = ?auto_243135 ?auto_243137 ) ) ( not ( = ?auto_243135 ?auto_243138 ) ) ( not ( = ?auto_243135 ?auto_243139 ) ) ( not ( = ?auto_243135 ?auto_243140 ) ) ( not ( = ?auto_243135 ?auto_243141 ) ) ( not ( = ?auto_243136 ?auto_243137 ) ) ( not ( = ?auto_243136 ?auto_243138 ) ) ( not ( = ?auto_243136 ?auto_243139 ) ) ( not ( = ?auto_243136 ?auto_243140 ) ) ( not ( = ?auto_243136 ?auto_243141 ) ) ( not ( = ?auto_243137 ?auto_243138 ) ) ( not ( = ?auto_243137 ?auto_243139 ) ) ( not ( = ?auto_243137 ?auto_243140 ) ) ( not ( = ?auto_243137 ?auto_243141 ) ) ( not ( = ?auto_243138 ?auto_243139 ) ) ( not ( = ?auto_243138 ?auto_243140 ) ) ( not ( = ?auto_243138 ?auto_243141 ) ) ( not ( = ?auto_243139 ?auto_243140 ) ) ( not ( = ?auto_243139 ?auto_243141 ) ) ( not ( = ?auto_243140 ?auto_243141 ) ) ( ON ?auto_243139 ?auto_243140 ) ( ON ?auto_243138 ?auto_243139 ) ( CLEAR ?auto_243136 ) ( ON ?auto_243137 ?auto_243138 ) ( CLEAR ?auto_243137 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_243128 ?auto_243129 ?auto_243130 ?auto_243131 ?auto_243132 ?auto_243133 ?auto_243134 ?auto_243135 ?auto_243136 ?auto_243137 )
      ( MAKE-13PILE ?auto_243128 ?auto_243129 ?auto_243130 ?auto_243131 ?auto_243132 ?auto_243133 ?auto_243134 ?auto_243135 ?auto_243136 ?auto_243137 ?auto_243138 ?auto_243139 ?auto_243140 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_243155 - BLOCK
      ?auto_243156 - BLOCK
      ?auto_243157 - BLOCK
      ?auto_243158 - BLOCK
      ?auto_243159 - BLOCK
      ?auto_243160 - BLOCK
      ?auto_243161 - BLOCK
      ?auto_243162 - BLOCK
      ?auto_243163 - BLOCK
      ?auto_243164 - BLOCK
      ?auto_243165 - BLOCK
      ?auto_243166 - BLOCK
      ?auto_243167 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_243167 ) ( ON-TABLE ?auto_243155 ) ( ON ?auto_243156 ?auto_243155 ) ( ON ?auto_243157 ?auto_243156 ) ( ON ?auto_243158 ?auto_243157 ) ( ON ?auto_243159 ?auto_243158 ) ( ON ?auto_243160 ?auto_243159 ) ( ON ?auto_243161 ?auto_243160 ) ( ON ?auto_243162 ?auto_243161 ) ( ON ?auto_243163 ?auto_243162 ) ( not ( = ?auto_243155 ?auto_243156 ) ) ( not ( = ?auto_243155 ?auto_243157 ) ) ( not ( = ?auto_243155 ?auto_243158 ) ) ( not ( = ?auto_243155 ?auto_243159 ) ) ( not ( = ?auto_243155 ?auto_243160 ) ) ( not ( = ?auto_243155 ?auto_243161 ) ) ( not ( = ?auto_243155 ?auto_243162 ) ) ( not ( = ?auto_243155 ?auto_243163 ) ) ( not ( = ?auto_243155 ?auto_243164 ) ) ( not ( = ?auto_243155 ?auto_243165 ) ) ( not ( = ?auto_243155 ?auto_243166 ) ) ( not ( = ?auto_243155 ?auto_243167 ) ) ( not ( = ?auto_243156 ?auto_243157 ) ) ( not ( = ?auto_243156 ?auto_243158 ) ) ( not ( = ?auto_243156 ?auto_243159 ) ) ( not ( = ?auto_243156 ?auto_243160 ) ) ( not ( = ?auto_243156 ?auto_243161 ) ) ( not ( = ?auto_243156 ?auto_243162 ) ) ( not ( = ?auto_243156 ?auto_243163 ) ) ( not ( = ?auto_243156 ?auto_243164 ) ) ( not ( = ?auto_243156 ?auto_243165 ) ) ( not ( = ?auto_243156 ?auto_243166 ) ) ( not ( = ?auto_243156 ?auto_243167 ) ) ( not ( = ?auto_243157 ?auto_243158 ) ) ( not ( = ?auto_243157 ?auto_243159 ) ) ( not ( = ?auto_243157 ?auto_243160 ) ) ( not ( = ?auto_243157 ?auto_243161 ) ) ( not ( = ?auto_243157 ?auto_243162 ) ) ( not ( = ?auto_243157 ?auto_243163 ) ) ( not ( = ?auto_243157 ?auto_243164 ) ) ( not ( = ?auto_243157 ?auto_243165 ) ) ( not ( = ?auto_243157 ?auto_243166 ) ) ( not ( = ?auto_243157 ?auto_243167 ) ) ( not ( = ?auto_243158 ?auto_243159 ) ) ( not ( = ?auto_243158 ?auto_243160 ) ) ( not ( = ?auto_243158 ?auto_243161 ) ) ( not ( = ?auto_243158 ?auto_243162 ) ) ( not ( = ?auto_243158 ?auto_243163 ) ) ( not ( = ?auto_243158 ?auto_243164 ) ) ( not ( = ?auto_243158 ?auto_243165 ) ) ( not ( = ?auto_243158 ?auto_243166 ) ) ( not ( = ?auto_243158 ?auto_243167 ) ) ( not ( = ?auto_243159 ?auto_243160 ) ) ( not ( = ?auto_243159 ?auto_243161 ) ) ( not ( = ?auto_243159 ?auto_243162 ) ) ( not ( = ?auto_243159 ?auto_243163 ) ) ( not ( = ?auto_243159 ?auto_243164 ) ) ( not ( = ?auto_243159 ?auto_243165 ) ) ( not ( = ?auto_243159 ?auto_243166 ) ) ( not ( = ?auto_243159 ?auto_243167 ) ) ( not ( = ?auto_243160 ?auto_243161 ) ) ( not ( = ?auto_243160 ?auto_243162 ) ) ( not ( = ?auto_243160 ?auto_243163 ) ) ( not ( = ?auto_243160 ?auto_243164 ) ) ( not ( = ?auto_243160 ?auto_243165 ) ) ( not ( = ?auto_243160 ?auto_243166 ) ) ( not ( = ?auto_243160 ?auto_243167 ) ) ( not ( = ?auto_243161 ?auto_243162 ) ) ( not ( = ?auto_243161 ?auto_243163 ) ) ( not ( = ?auto_243161 ?auto_243164 ) ) ( not ( = ?auto_243161 ?auto_243165 ) ) ( not ( = ?auto_243161 ?auto_243166 ) ) ( not ( = ?auto_243161 ?auto_243167 ) ) ( not ( = ?auto_243162 ?auto_243163 ) ) ( not ( = ?auto_243162 ?auto_243164 ) ) ( not ( = ?auto_243162 ?auto_243165 ) ) ( not ( = ?auto_243162 ?auto_243166 ) ) ( not ( = ?auto_243162 ?auto_243167 ) ) ( not ( = ?auto_243163 ?auto_243164 ) ) ( not ( = ?auto_243163 ?auto_243165 ) ) ( not ( = ?auto_243163 ?auto_243166 ) ) ( not ( = ?auto_243163 ?auto_243167 ) ) ( not ( = ?auto_243164 ?auto_243165 ) ) ( not ( = ?auto_243164 ?auto_243166 ) ) ( not ( = ?auto_243164 ?auto_243167 ) ) ( not ( = ?auto_243165 ?auto_243166 ) ) ( not ( = ?auto_243165 ?auto_243167 ) ) ( not ( = ?auto_243166 ?auto_243167 ) ) ( ON ?auto_243166 ?auto_243167 ) ( ON ?auto_243165 ?auto_243166 ) ( CLEAR ?auto_243163 ) ( ON ?auto_243164 ?auto_243165 ) ( CLEAR ?auto_243164 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_243155 ?auto_243156 ?auto_243157 ?auto_243158 ?auto_243159 ?auto_243160 ?auto_243161 ?auto_243162 ?auto_243163 ?auto_243164 )
      ( MAKE-13PILE ?auto_243155 ?auto_243156 ?auto_243157 ?auto_243158 ?auto_243159 ?auto_243160 ?auto_243161 ?auto_243162 ?auto_243163 ?auto_243164 ?auto_243165 ?auto_243166 ?auto_243167 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_243181 - BLOCK
      ?auto_243182 - BLOCK
      ?auto_243183 - BLOCK
      ?auto_243184 - BLOCK
      ?auto_243185 - BLOCK
      ?auto_243186 - BLOCK
      ?auto_243187 - BLOCK
      ?auto_243188 - BLOCK
      ?auto_243189 - BLOCK
      ?auto_243190 - BLOCK
      ?auto_243191 - BLOCK
      ?auto_243192 - BLOCK
      ?auto_243193 - BLOCK
    )
    :vars
    (
      ?auto_243194 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_243193 ?auto_243194 ) ( ON-TABLE ?auto_243181 ) ( ON ?auto_243182 ?auto_243181 ) ( ON ?auto_243183 ?auto_243182 ) ( ON ?auto_243184 ?auto_243183 ) ( ON ?auto_243185 ?auto_243184 ) ( ON ?auto_243186 ?auto_243185 ) ( ON ?auto_243187 ?auto_243186 ) ( ON ?auto_243188 ?auto_243187 ) ( not ( = ?auto_243181 ?auto_243182 ) ) ( not ( = ?auto_243181 ?auto_243183 ) ) ( not ( = ?auto_243181 ?auto_243184 ) ) ( not ( = ?auto_243181 ?auto_243185 ) ) ( not ( = ?auto_243181 ?auto_243186 ) ) ( not ( = ?auto_243181 ?auto_243187 ) ) ( not ( = ?auto_243181 ?auto_243188 ) ) ( not ( = ?auto_243181 ?auto_243189 ) ) ( not ( = ?auto_243181 ?auto_243190 ) ) ( not ( = ?auto_243181 ?auto_243191 ) ) ( not ( = ?auto_243181 ?auto_243192 ) ) ( not ( = ?auto_243181 ?auto_243193 ) ) ( not ( = ?auto_243181 ?auto_243194 ) ) ( not ( = ?auto_243182 ?auto_243183 ) ) ( not ( = ?auto_243182 ?auto_243184 ) ) ( not ( = ?auto_243182 ?auto_243185 ) ) ( not ( = ?auto_243182 ?auto_243186 ) ) ( not ( = ?auto_243182 ?auto_243187 ) ) ( not ( = ?auto_243182 ?auto_243188 ) ) ( not ( = ?auto_243182 ?auto_243189 ) ) ( not ( = ?auto_243182 ?auto_243190 ) ) ( not ( = ?auto_243182 ?auto_243191 ) ) ( not ( = ?auto_243182 ?auto_243192 ) ) ( not ( = ?auto_243182 ?auto_243193 ) ) ( not ( = ?auto_243182 ?auto_243194 ) ) ( not ( = ?auto_243183 ?auto_243184 ) ) ( not ( = ?auto_243183 ?auto_243185 ) ) ( not ( = ?auto_243183 ?auto_243186 ) ) ( not ( = ?auto_243183 ?auto_243187 ) ) ( not ( = ?auto_243183 ?auto_243188 ) ) ( not ( = ?auto_243183 ?auto_243189 ) ) ( not ( = ?auto_243183 ?auto_243190 ) ) ( not ( = ?auto_243183 ?auto_243191 ) ) ( not ( = ?auto_243183 ?auto_243192 ) ) ( not ( = ?auto_243183 ?auto_243193 ) ) ( not ( = ?auto_243183 ?auto_243194 ) ) ( not ( = ?auto_243184 ?auto_243185 ) ) ( not ( = ?auto_243184 ?auto_243186 ) ) ( not ( = ?auto_243184 ?auto_243187 ) ) ( not ( = ?auto_243184 ?auto_243188 ) ) ( not ( = ?auto_243184 ?auto_243189 ) ) ( not ( = ?auto_243184 ?auto_243190 ) ) ( not ( = ?auto_243184 ?auto_243191 ) ) ( not ( = ?auto_243184 ?auto_243192 ) ) ( not ( = ?auto_243184 ?auto_243193 ) ) ( not ( = ?auto_243184 ?auto_243194 ) ) ( not ( = ?auto_243185 ?auto_243186 ) ) ( not ( = ?auto_243185 ?auto_243187 ) ) ( not ( = ?auto_243185 ?auto_243188 ) ) ( not ( = ?auto_243185 ?auto_243189 ) ) ( not ( = ?auto_243185 ?auto_243190 ) ) ( not ( = ?auto_243185 ?auto_243191 ) ) ( not ( = ?auto_243185 ?auto_243192 ) ) ( not ( = ?auto_243185 ?auto_243193 ) ) ( not ( = ?auto_243185 ?auto_243194 ) ) ( not ( = ?auto_243186 ?auto_243187 ) ) ( not ( = ?auto_243186 ?auto_243188 ) ) ( not ( = ?auto_243186 ?auto_243189 ) ) ( not ( = ?auto_243186 ?auto_243190 ) ) ( not ( = ?auto_243186 ?auto_243191 ) ) ( not ( = ?auto_243186 ?auto_243192 ) ) ( not ( = ?auto_243186 ?auto_243193 ) ) ( not ( = ?auto_243186 ?auto_243194 ) ) ( not ( = ?auto_243187 ?auto_243188 ) ) ( not ( = ?auto_243187 ?auto_243189 ) ) ( not ( = ?auto_243187 ?auto_243190 ) ) ( not ( = ?auto_243187 ?auto_243191 ) ) ( not ( = ?auto_243187 ?auto_243192 ) ) ( not ( = ?auto_243187 ?auto_243193 ) ) ( not ( = ?auto_243187 ?auto_243194 ) ) ( not ( = ?auto_243188 ?auto_243189 ) ) ( not ( = ?auto_243188 ?auto_243190 ) ) ( not ( = ?auto_243188 ?auto_243191 ) ) ( not ( = ?auto_243188 ?auto_243192 ) ) ( not ( = ?auto_243188 ?auto_243193 ) ) ( not ( = ?auto_243188 ?auto_243194 ) ) ( not ( = ?auto_243189 ?auto_243190 ) ) ( not ( = ?auto_243189 ?auto_243191 ) ) ( not ( = ?auto_243189 ?auto_243192 ) ) ( not ( = ?auto_243189 ?auto_243193 ) ) ( not ( = ?auto_243189 ?auto_243194 ) ) ( not ( = ?auto_243190 ?auto_243191 ) ) ( not ( = ?auto_243190 ?auto_243192 ) ) ( not ( = ?auto_243190 ?auto_243193 ) ) ( not ( = ?auto_243190 ?auto_243194 ) ) ( not ( = ?auto_243191 ?auto_243192 ) ) ( not ( = ?auto_243191 ?auto_243193 ) ) ( not ( = ?auto_243191 ?auto_243194 ) ) ( not ( = ?auto_243192 ?auto_243193 ) ) ( not ( = ?auto_243192 ?auto_243194 ) ) ( not ( = ?auto_243193 ?auto_243194 ) ) ( ON ?auto_243192 ?auto_243193 ) ( ON ?auto_243191 ?auto_243192 ) ( ON ?auto_243190 ?auto_243191 ) ( CLEAR ?auto_243188 ) ( ON ?auto_243189 ?auto_243190 ) ( CLEAR ?auto_243189 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_243181 ?auto_243182 ?auto_243183 ?auto_243184 ?auto_243185 ?auto_243186 ?auto_243187 ?auto_243188 ?auto_243189 )
      ( MAKE-13PILE ?auto_243181 ?auto_243182 ?auto_243183 ?auto_243184 ?auto_243185 ?auto_243186 ?auto_243187 ?auto_243188 ?auto_243189 ?auto_243190 ?auto_243191 ?auto_243192 ?auto_243193 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_243208 - BLOCK
      ?auto_243209 - BLOCK
      ?auto_243210 - BLOCK
      ?auto_243211 - BLOCK
      ?auto_243212 - BLOCK
      ?auto_243213 - BLOCK
      ?auto_243214 - BLOCK
      ?auto_243215 - BLOCK
      ?auto_243216 - BLOCK
      ?auto_243217 - BLOCK
      ?auto_243218 - BLOCK
      ?auto_243219 - BLOCK
      ?auto_243220 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_243220 ) ( ON-TABLE ?auto_243208 ) ( ON ?auto_243209 ?auto_243208 ) ( ON ?auto_243210 ?auto_243209 ) ( ON ?auto_243211 ?auto_243210 ) ( ON ?auto_243212 ?auto_243211 ) ( ON ?auto_243213 ?auto_243212 ) ( ON ?auto_243214 ?auto_243213 ) ( ON ?auto_243215 ?auto_243214 ) ( not ( = ?auto_243208 ?auto_243209 ) ) ( not ( = ?auto_243208 ?auto_243210 ) ) ( not ( = ?auto_243208 ?auto_243211 ) ) ( not ( = ?auto_243208 ?auto_243212 ) ) ( not ( = ?auto_243208 ?auto_243213 ) ) ( not ( = ?auto_243208 ?auto_243214 ) ) ( not ( = ?auto_243208 ?auto_243215 ) ) ( not ( = ?auto_243208 ?auto_243216 ) ) ( not ( = ?auto_243208 ?auto_243217 ) ) ( not ( = ?auto_243208 ?auto_243218 ) ) ( not ( = ?auto_243208 ?auto_243219 ) ) ( not ( = ?auto_243208 ?auto_243220 ) ) ( not ( = ?auto_243209 ?auto_243210 ) ) ( not ( = ?auto_243209 ?auto_243211 ) ) ( not ( = ?auto_243209 ?auto_243212 ) ) ( not ( = ?auto_243209 ?auto_243213 ) ) ( not ( = ?auto_243209 ?auto_243214 ) ) ( not ( = ?auto_243209 ?auto_243215 ) ) ( not ( = ?auto_243209 ?auto_243216 ) ) ( not ( = ?auto_243209 ?auto_243217 ) ) ( not ( = ?auto_243209 ?auto_243218 ) ) ( not ( = ?auto_243209 ?auto_243219 ) ) ( not ( = ?auto_243209 ?auto_243220 ) ) ( not ( = ?auto_243210 ?auto_243211 ) ) ( not ( = ?auto_243210 ?auto_243212 ) ) ( not ( = ?auto_243210 ?auto_243213 ) ) ( not ( = ?auto_243210 ?auto_243214 ) ) ( not ( = ?auto_243210 ?auto_243215 ) ) ( not ( = ?auto_243210 ?auto_243216 ) ) ( not ( = ?auto_243210 ?auto_243217 ) ) ( not ( = ?auto_243210 ?auto_243218 ) ) ( not ( = ?auto_243210 ?auto_243219 ) ) ( not ( = ?auto_243210 ?auto_243220 ) ) ( not ( = ?auto_243211 ?auto_243212 ) ) ( not ( = ?auto_243211 ?auto_243213 ) ) ( not ( = ?auto_243211 ?auto_243214 ) ) ( not ( = ?auto_243211 ?auto_243215 ) ) ( not ( = ?auto_243211 ?auto_243216 ) ) ( not ( = ?auto_243211 ?auto_243217 ) ) ( not ( = ?auto_243211 ?auto_243218 ) ) ( not ( = ?auto_243211 ?auto_243219 ) ) ( not ( = ?auto_243211 ?auto_243220 ) ) ( not ( = ?auto_243212 ?auto_243213 ) ) ( not ( = ?auto_243212 ?auto_243214 ) ) ( not ( = ?auto_243212 ?auto_243215 ) ) ( not ( = ?auto_243212 ?auto_243216 ) ) ( not ( = ?auto_243212 ?auto_243217 ) ) ( not ( = ?auto_243212 ?auto_243218 ) ) ( not ( = ?auto_243212 ?auto_243219 ) ) ( not ( = ?auto_243212 ?auto_243220 ) ) ( not ( = ?auto_243213 ?auto_243214 ) ) ( not ( = ?auto_243213 ?auto_243215 ) ) ( not ( = ?auto_243213 ?auto_243216 ) ) ( not ( = ?auto_243213 ?auto_243217 ) ) ( not ( = ?auto_243213 ?auto_243218 ) ) ( not ( = ?auto_243213 ?auto_243219 ) ) ( not ( = ?auto_243213 ?auto_243220 ) ) ( not ( = ?auto_243214 ?auto_243215 ) ) ( not ( = ?auto_243214 ?auto_243216 ) ) ( not ( = ?auto_243214 ?auto_243217 ) ) ( not ( = ?auto_243214 ?auto_243218 ) ) ( not ( = ?auto_243214 ?auto_243219 ) ) ( not ( = ?auto_243214 ?auto_243220 ) ) ( not ( = ?auto_243215 ?auto_243216 ) ) ( not ( = ?auto_243215 ?auto_243217 ) ) ( not ( = ?auto_243215 ?auto_243218 ) ) ( not ( = ?auto_243215 ?auto_243219 ) ) ( not ( = ?auto_243215 ?auto_243220 ) ) ( not ( = ?auto_243216 ?auto_243217 ) ) ( not ( = ?auto_243216 ?auto_243218 ) ) ( not ( = ?auto_243216 ?auto_243219 ) ) ( not ( = ?auto_243216 ?auto_243220 ) ) ( not ( = ?auto_243217 ?auto_243218 ) ) ( not ( = ?auto_243217 ?auto_243219 ) ) ( not ( = ?auto_243217 ?auto_243220 ) ) ( not ( = ?auto_243218 ?auto_243219 ) ) ( not ( = ?auto_243218 ?auto_243220 ) ) ( not ( = ?auto_243219 ?auto_243220 ) ) ( ON ?auto_243219 ?auto_243220 ) ( ON ?auto_243218 ?auto_243219 ) ( ON ?auto_243217 ?auto_243218 ) ( CLEAR ?auto_243215 ) ( ON ?auto_243216 ?auto_243217 ) ( CLEAR ?auto_243216 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_243208 ?auto_243209 ?auto_243210 ?auto_243211 ?auto_243212 ?auto_243213 ?auto_243214 ?auto_243215 ?auto_243216 )
      ( MAKE-13PILE ?auto_243208 ?auto_243209 ?auto_243210 ?auto_243211 ?auto_243212 ?auto_243213 ?auto_243214 ?auto_243215 ?auto_243216 ?auto_243217 ?auto_243218 ?auto_243219 ?auto_243220 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_243234 - BLOCK
      ?auto_243235 - BLOCK
      ?auto_243236 - BLOCK
      ?auto_243237 - BLOCK
      ?auto_243238 - BLOCK
      ?auto_243239 - BLOCK
      ?auto_243240 - BLOCK
      ?auto_243241 - BLOCK
      ?auto_243242 - BLOCK
      ?auto_243243 - BLOCK
      ?auto_243244 - BLOCK
      ?auto_243245 - BLOCK
      ?auto_243246 - BLOCK
    )
    :vars
    (
      ?auto_243247 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_243246 ?auto_243247 ) ( ON-TABLE ?auto_243234 ) ( ON ?auto_243235 ?auto_243234 ) ( ON ?auto_243236 ?auto_243235 ) ( ON ?auto_243237 ?auto_243236 ) ( ON ?auto_243238 ?auto_243237 ) ( ON ?auto_243239 ?auto_243238 ) ( ON ?auto_243240 ?auto_243239 ) ( not ( = ?auto_243234 ?auto_243235 ) ) ( not ( = ?auto_243234 ?auto_243236 ) ) ( not ( = ?auto_243234 ?auto_243237 ) ) ( not ( = ?auto_243234 ?auto_243238 ) ) ( not ( = ?auto_243234 ?auto_243239 ) ) ( not ( = ?auto_243234 ?auto_243240 ) ) ( not ( = ?auto_243234 ?auto_243241 ) ) ( not ( = ?auto_243234 ?auto_243242 ) ) ( not ( = ?auto_243234 ?auto_243243 ) ) ( not ( = ?auto_243234 ?auto_243244 ) ) ( not ( = ?auto_243234 ?auto_243245 ) ) ( not ( = ?auto_243234 ?auto_243246 ) ) ( not ( = ?auto_243234 ?auto_243247 ) ) ( not ( = ?auto_243235 ?auto_243236 ) ) ( not ( = ?auto_243235 ?auto_243237 ) ) ( not ( = ?auto_243235 ?auto_243238 ) ) ( not ( = ?auto_243235 ?auto_243239 ) ) ( not ( = ?auto_243235 ?auto_243240 ) ) ( not ( = ?auto_243235 ?auto_243241 ) ) ( not ( = ?auto_243235 ?auto_243242 ) ) ( not ( = ?auto_243235 ?auto_243243 ) ) ( not ( = ?auto_243235 ?auto_243244 ) ) ( not ( = ?auto_243235 ?auto_243245 ) ) ( not ( = ?auto_243235 ?auto_243246 ) ) ( not ( = ?auto_243235 ?auto_243247 ) ) ( not ( = ?auto_243236 ?auto_243237 ) ) ( not ( = ?auto_243236 ?auto_243238 ) ) ( not ( = ?auto_243236 ?auto_243239 ) ) ( not ( = ?auto_243236 ?auto_243240 ) ) ( not ( = ?auto_243236 ?auto_243241 ) ) ( not ( = ?auto_243236 ?auto_243242 ) ) ( not ( = ?auto_243236 ?auto_243243 ) ) ( not ( = ?auto_243236 ?auto_243244 ) ) ( not ( = ?auto_243236 ?auto_243245 ) ) ( not ( = ?auto_243236 ?auto_243246 ) ) ( not ( = ?auto_243236 ?auto_243247 ) ) ( not ( = ?auto_243237 ?auto_243238 ) ) ( not ( = ?auto_243237 ?auto_243239 ) ) ( not ( = ?auto_243237 ?auto_243240 ) ) ( not ( = ?auto_243237 ?auto_243241 ) ) ( not ( = ?auto_243237 ?auto_243242 ) ) ( not ( = ?auto_243237 ?auto_243243 ) ) ( not ( = ?auto_243237 ?auto_243244 ) ) ( not ( = ?auto_243237 ?auto_243245 ) ) ( not ( = ?auto_243237 ?auto_243246 ) ) ( not ( = ?auto_243237 ?auto_243247 ) ) ( not ( = ?auto_243238 ?auto_243239 ) ) ( not ( = ?auto_243238 ?auto_243240 ) ) ( not ( = ?auto_243238 ?auto_243241 ) ) ( not ( = ?auto_243238 ?auto_243242 ) ) ( not ( = ?auto_243238 ?auto_243243 ) ) ( not ( = ?auto_243238 ?auto_243244 ) ) ( not ( = ?auto_243238 ?auto_243245 ) ) ( not ( = ?auto_243238 ?auto_243246 ) ) ( not ( = ?auto_243238 ?auto_243247 ) ) ( not ( = ?auto_243239 ?auto_243240 ) ) ( not ( = ?auto_243239 ?auto_243241 ) ) ( not ( = ?auto_243239 ?auto_243242 ) ) ( not ( = ?auto_243239 ?auto_243243 ) ) ( not ( = ?auto_243239 ?auto_243244 ) ) ( not ( = ?auto_243239 ?auto_243245 ) ) ( not ( = ?auto_243239 ?auto_243246 ) ) ( not ( = ?auto_243239 ?auto_243247 ) ) ( not ( = ?auto_243240 ?auto_243241 ) ) ( not ( = ?auto_243240 ?auto_243242 ) ) ( not ( = ?auto_243240 ?auto_243243 ) ) ( not ( = ?auto_243240 ?auto_243244 ) ) ( not ( = ?auto_243240 ?auto_243245 ) ) ( not ( = ?auto_243240 ?auto_243246 ) ) ( not ( = ?auto_243240 ?auto_243247 ) ) ( not ( = ?auto_243241 ?auto_243242 ) ) ( not ( = ?auto_243241 ?auto_243243 ) ) ( not ( = ?auto_243241 ?auto_243244 ) ) ( not ( = ?auto_243241 ?auto_243245 ) ) ( not ( = ?auto_243241 ?auto_243246 ) ) ( not ( = ?auto_243241 ?auto_243247 ) ) ( not ( = ?auto_243242 ?auto_243243 ) ) ( not ( = ?auto_243242 ?auto_243244 ) ) ( not ( = ?auto_243242 ?auto_243245 ) ) ( not ( = ?auto_243242 ?auto_243246 ) ) ( not ( = ?auto_243242 ?auto_243247 ) ) ( not ( = ?auto_243243 ?auto_243244 ) ) ( not ( = ?auto_243243 ?auto_243245 ) ) ( not ( = ?auto_243243 ?auto_243246 ) ) ( not ( = ?auto_243243 ?auto_243247 ) ) ( not ( = ?auto_243244 ?auto_243245 ) ) ( not ( = ?auto_243244 ?auto_243246 ) ) ( not ( = ?auto_243244 ?auto_243247 ) ) ( not ( = ?auto_243245 ?auto_243246 ) ) ( not ( = ?auto_243245 ?auto_243247 ) ) ( not ( = ?auto_243246 ?auto_243247 ) ) ( ON ?auto_243245 ?auto_243246 ) ( ON ?auto_243244 ?auto_243245 ) ( ON ?auto_243243 ?auto_243244 ) ( ON ?auto_243242 ?auto_243243 ) ( CLEAR ?auto_243240 ) ( ON ?auto_243241 ?auto_243242 ) ( CLEAR ?auto_243241 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_243234 ?auto_243235 ?auto_243236 ?auto_243237 ?auto_243238 ?auto_243239 ?auto_243240 ?auto_243241 )
      ( MAKE-13PILE ?auto_243234 ?auto_243235 ?auto_243236 ?auto_243237 ?auto_243238 ?auto_243239 ?auto_243240 ?auto_243241 ?auto_243242 ?auto_243243 ?auto_243244 ?auto_243245 ?auto_243246 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_243261 - BLOCK
      ?auto_243262 - BLOCK
      ?auto_243263 - BLOCK
      ?auto_243264 - BLOCK
      ?auto_243265 - BLOCK
      ?auto_243266 - BLOCK
      ?auto_243267 - BLOCK
      ?auto_243268 - BLOCK
      ?auto_243269 - BLOCK
      ?auto_243270 - BLOCK
      ?auto_243271 - BLOCK
      ?auto_243272 - BLOCK
      ?auto_243273 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_243273 ) ( ON-TABLE ?auto_243261 ) ( ON ?auto_243262 ?auto_243261 ) ( ON ?auto_243263 ?auto_243262 ) ( ON ?auto_243264 ?auto_243263 ) ( ON ?auto_243265 ?auto_243264 ) ( ON ?auto_243266 ?auto_243265 ) ( ON ?auto_243267 ?auto_243266 ) ( not ( = ?auto_243261 ?auto_243262 ) ) ( not ( = ?auto_243261 ?auto_243263 ) ) ( not ( = ?auto_243261 ?auto_243264 ) ) ( not ( = ?auto_243261 ?auto_243265 ) ) ( not ( = ?auto_243261 ?auto_243266 ) ) ( not ( = ?auto_243261 ?auto_243267 ) ) ( not ( = ?auto_243261 ?auto_243268 ) ) ( not ( = ?auto_243261 ?auto_243269 ) ) ( not ( = ?auto_243261 ?auto_243270 ) ) ( not ( = ?auto_243261 ?auto_243271 ) ) ( not ( = ?auto_243261 ?auto_243272 ) ) ( not ( = ?auto_243261 ?auto_243273 ) ) ( not ( = ?auto_243262 ?auto_243263 ) ) ( not ( = ?auto_243262 ?auto_243264 ) ) ( not ( = ?auto_243262 ?auto_243265 ) ) ( not ( = ?auto_243262 ?auto_243266 ) ) ( not ( = ?auto_243262 ?auto_243267 ) ) ( not ( = ?auto_243262 ?auto_243268 ) ) ( not ( = ?auto_243262 ?auto_243269 ) ) ( not ( = ?auto_243262 ?auto_243270 ) ) ( not ( = ?auto_243262 ?auto_243271 ) ) ( not ( = ?auto_243262 ?auto_243272 ) ) ( not ( = ?auto_243262 ?auto_243273 ) ) ( not ( = ?auto_243263 ?auto_243264 ) ) ( not ( = ?auto_243263 ?auto_243265 ) ) ( not ( = ?auto_243263 ?auto_243266 ) ) ( not ( = ?auto_243263 ?auto_243267 ) ) ( not ( = ?auto_243263 ?auto_243268 ) ) ( not ( = ?auto_243263 ?auto_243269 ) ) ( not ( = ?auto_243263 ?auto_243270 ) ) ( not ( = ?auto_243263 ?auto_243271 ) ) ( not ( = ?auto_243263 ?auto_243272 ) ) ( not ( = ?auto_243263 ?auto_243273 ) ) ( not ( = ?auto_243264 ?auto_243265 ) ) ( not ( = ?auto_243264 ?auto_243266 ) ) ( not ( = ?auto_243264 ?auto_243267 ) ) ( not ( = ?auto_243264 ?auto_243268 ) ) ( not ( = ?auto_243264 ?auto_243269 ) ) ( not ( = ?auto_243264 ?auto_243270 ) ) ( not ( = ?auto_243264 ?auto_243271 ) ) ( not ( = ?auto_243264 ?auto_243272 ) ) ( not ( = ?auto_243264 ?auto_243273 ) ) ( not ( = ?auto_243265 ?auto_243266 ) ) ( not ( = ?auto_243265 ?auto_243267 ) ) ( not ( = ?auto_243265 ?auto_243268 ) ) ( not ( = ?auto_243265 ?auto_243269 ) ) ( not ( = ?auto_243265 ?auto_243270 ) ) ( not ( = ?auto_243265 ?auto_243271 ) ) ( not ( = ?auto_243265 ?auto_243272 ) ) ( not ( = ?auto_243265 ?auto_243273 ) ) ( not ( = ?auto_243266 ?auto_243267 ) ) ( not ( = ?auto_243266 ?auto_243268 ) ) ( not ( = ?auto_243266 ?auto_243269 ) ) ( not ( = ?auto_243266 ?auto_243270 ) ) ( not ( = ?auto_243266 ?auto_243271 ) ) ( not ( = ?auto_243266 ?auto_243272 ) ) ( not ( = ?auto_243266 ?auto_243273 ) ) ( not ( = ?auto_243267 ?auto_243268 ) ) ( not ( = ?auto_243267 ?auto_243269 ) ) ( not ( = ?auto_243267 ?auto_243270 ) ) ( not ( = ?auto_243267 ?auto_243271 ) ) ( not ( = ?auto_243267 ?auto_243272 ) ) ( not ( = ?auto_243267 ?auto_243273 ) ) ( not ( = ?auto_243268 ?auto_243269 ) ) ( not ( = ?auto_243268 ?auto_243270 ) ) ( not ( = ?auto_243268 ?auto_243271 ) ) ( not ( = ?auto_243268 ?auto_243272 ) ) ( not ( = ?auto_243268 ?auto_243273 ) ) ( not ( = ?auto_243269 ?auto_243270 ) ) ( not ( = ?auto_243269 ?auto_243271 ) ) ( not ( = ?auto_243269 ?auto_243272 ) ) ( not ( = ?auto_243269 ?auto_243273 ) ) ( not ( = ?auto_243270 ?auto_243271 ) ) ( not ( = ?auto_243270 ?auto_243272 ) ) ( not ( = ?auto_243270 ?auto_243273 ) ) ( not ( = ?auto_243271 ?auto_243272 ) ) ( not ( = ?auto_243271 ?auto_243273 ) ) ( not ( = ?auto_243272 ?auto_243273 ) ) ( ON ?auto_243272 ?auto_243273 ) ( ON ?auto_243271 ?auto_243272 ) ( ON ?auto_243270 ?auto_243271 ) ( ON ?auto_243269 ?auto_243270 ) ( CLEAR ?auto_243267 ) ( ON ?auto_243268 ?auto_243269 ) ( CLEAR ?auto_243268 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_243261 ?auto_243262 ?auto_243263 ?auto_243264 ?auto_243265 ?auto_243266 ?auto_243267 ?auto_243268 )
      ( MAKE-13PILE ?auto_243261 ?auto_243262 ?auto_243263 ?auto_243264 ?auto_243265 ?auto_243266 ?auto_243267 ?auto_243268 ?auto_243269 ?auto_243270 ?auto_243271 ?auto_243272 ?auto_243273 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_243287 - BLOCK
      ?auto_243288 - BLOCK
      ?auto_243289 - BLOCK
      ?auto_243290 - BLOCK
      ?auto_243291 - BLOCK
      ?auto_243292 - BLOCK
      ?auto_243293 - BLOCK
      ?auto_243294 - BLOCK
      ?auto_243295 - BLOCK
      ?auto_243296 - BLOCK
      ?auto_243297 - BLOCK
      ?auto_243298 - BLOCK
      ?auto_243299 - BLOCK
    )
    :vars
    (
      ?auto_243300 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_243299 ?auto_243300 ) ( ON-TABLE ?auto_243287 ) ( ON ?auto_243288 ?auto_243287 ) ( ON ?auto_243289 ?auto_243288 ) ( ON ?auto_243290 ?auto_243289 ) ( ON ?auto_243291 ?auto_243290 ) ( ON ?auto_243292 ?auto_243291 ) ( not ( = ?auto_243287 ?auto_243288 ) ) ( not ( = ?auto_243287 ?auto_243289 ) ) ( not ( = ?auto_243287 ?auto_243290 ) ) ( not ( = ?auto_243287 ?auto_243291 ) ) ( not ( = ?auto_243287 ?auto_243292 ) ) ( not ( = ?auto_243287 ?auto_243293 ) ) ( not ( = ?auto_243287 ?auto_243294 ) ) ( not ( = ?auto_243287 ?auto_243295 ) ) ( not ( = ?auto_243287 ?auto_243296 ) ) ( not ( = ?auto_243287 ?auto_243297 ) ) ( not ( = ?auto_243287 ?auto_243298 ) ) ( not ( = ?auto_243287 ?auto_243299 ) ) ( not ( = ?auto_243287 ?auto_243300 ) ) ( not ( = ?auto_243288 ?auto_243289 ) ) ( not ( = ?auto_243288 ?auto_243290 ) ) ( not ( = ?auto_243288 ?auto_243291 ) ) ( not ( = ?auto_243288 ?auto_243292 ) ) ( not ( = ?auto_243288 ?auto_243293 ) ) ( not ( = ?auto_243288 ?auto_243294 ) ) ( not ( = ?auto_243288 ?auto_243295 ) ) ( not ( = ?auto_243288 ?auto_243296 ) ) ( not ( = ?auto_243288 ?auto_243297 ) ) ( not ( = ?auto_243288 ?auto_243298 ) ) ( not ( = ?auto_243288 ?auto_243299 ) ) ( not ( = ?auto_243288 ?auto_243300 ) ) ( not ( = ?auto_243289 ?auto_243290 ) ) ( not ( = ?auto_243289 ?auto_243291 ) ) ( not ( = ?auto_243289 ?auto_243292 ) ) ( not ( = ?auto_243289 ?auto_243293 ) ) ( not ( = ?auto_243289 ?auto_243294 ) ) ( not ( = ?auto_243289 ?auto_243295 ) ) ( not ( = ?auto_243289 ?auto_243296 ) ) ( not ( = ?auto_243289 ?auto_243297 ) ) ( not ( = ?auto_243289 ?auto_243298 ) ) ( not ( = ?auto_243289 ?auto_243299 ) ) ( not ( = ?auto_243289 ?auto_243300 ) ) ( not ( = ?auto_243290 ?auto_243291 ) ) ( not ( = ?auto_243290 ?auto_243292 ) ) ( not ( = ?auto_243290 ?auto_243293 ) ) ( not ( = ?auto_243290 ?auto_243294 ) ) ( not ( = ?auto_243290 ?auto_243295 ) ) ( not ( = ?auto_243290 ?auto_243296 ) ) ( not ( = ?auto_243290 ?auto_243297 ) ) ( not ( = ?auto_243290 ?auto_243298 ) ) ( not ( = ?auto_243290 ?auto_243299 ) ) ( not ( = ?auto_243290 ?auto_243300 ) ) ( not ( = ?auto_243291 ?auto_243292 ) ) ( not ( = ?auto_243291 ?auto_243293 ) ) ( not ( = ?auto_243291 ?auto_243294 ) ) ( not ( = ?auto_243291 ?auto_243295 ) ) ( not ( = ?auto_243291 ?auto_243296 ) ) ( not ( = ?auto_243291 ?auto_243297 ) ) ( not ( = ?auto_243291 ?auto_243298 ) ) ( not ( = ?auto_243291 ?auto_243299 ) ) ( not ( = ?auto_243291 ?auto_243300 ) ) ( not ( = ?auto_243292 ?auto_243293 ) ) ( not ( = ?auto_243292 ?auto_243294 ) ) ( not ( = ?auto_243292 ?auto_243295 ) ) ( not ( = ?auto_243292 ?auto_243296 ) ) ( not ( = ?auto_243292 ?auto_243297 ) ) ( not ( = ?auto_243292 ?auto_243298 ) ) ( not ( = ?auto_243292 ?auto_243299 ) ) ( not ( = ?auto_243292 ?auto_243300 ) ) ( not ( = ?auto_243293 ?auto_243294 ) ) ( not ( = ?auto_243293 ?auto_243295 ) ) ( not ( = ?auto_243293 ?auto_243296 ) ) ( not ( = ?auto_243293 ?auto_243297 ) ) ( not ( = ?auto_243293 ?auto_243298 ) ) ( not ( = ?auto_243293 ?auto_243299 ) ) ( not ( = ?auto_243293 ?auto_243300 ) ) ( not ( = ?auto_243294 ?auto_243295 ) ) ( not ( = ?auto_243294 ?auto_243296 ) ) ( not ( = ?auto_243294 ?auto_243297 ) ) ( not ( = ?auto_243294 ?auto_243298 ) ) ( not ( = ?auto_243294 ?auto_243299 ) ) ( not ( = ?auto_243294 ?auto_243300 ) ) ( not ( = ?auto_243295 ?auto_243296 ) ) ( not ( = ?auto_243295 ?auto_243297 ) ) ( not ( = ?auto_243295 ?auto_243298 ) ) ( not ( = ?auto_243295 ?auto_243299 ) ) ( not ( = ?auto_243295 ?auto_243300 ) ) ( not ( = ?auto_243296 ?auto_243297 ) ) ( not ( = ?auto_243296 ?auto_243298 ) ) ( not ( = ?auto_243296 ?auto_243299 ) ) ( not ( = ?auto_243296 ?auto_243300 ) ) ( not ( = ?auto_243297 ?auto_243298 ) ) ( not ( = ?auto_243297 ?auto_243299 ) ) ( not ( = ?auto_243297 ?auto_243300 ) ) ( not ( = ?auto_243298 ?auto_243299 ) ) ( not ( = ?auto_243298 ?auto_243300 ) ) ( not ( = ?auto_243299 ?auto_243300 ) ) ( ON ?auto_243298 ?auto_243299 ) ( ON ?auto_243297 ?auto_243298 ) ( ON ?auto_243296 ?auto_243297 ) ( ON ?auto_243295 ?auto_243296 ) ( ON ?auto_243294 ?auto_243295 ) ( CLEAR ?auto_243292 ) ( ON ?auto_243293 ?auto_243294 ) ( CLEAR ?auto_243293 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_243287 ?auto_243288 ?auto_243289 ?auto_243290 ?auto_243291 ?auto_243292 ?auto_243293 )
      ( MAKE-13PILE ?auto_243287 ?auto_243288 ?auto_243289 ?auto_243290 ?auto_243291 ?auto_243292 ?auto_243293 ?auto_243294 ?auto_243295 ?auto_243296 ?auto_243297 ?auto_243298 ?auto_243299 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_243314 - BLOCK
      ?auto_243315 - BLOCK
      ?auto_243316 - BLOCK
      ?auto_243317 - BLOCK
      ?auto_243318 - BLOCK
      ?auto_243319 - BLOCK
      ?auto_243320 - BLOCK
      ?auto_243321 - BLOCK
      ?auto_243322 - BLOCK
      ?auto_243323 - BLOCK
      ?auto_243324 - BLOCK
      ?auto_243325 - BLOCK
      ?auto_243326 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_243326 ) ( ON-TABLE ?auto_243314 ) ( ON ?auto_243315 ?auto_243314 ) ( ON ?auto_243316 ?auto_243315 ) ( ON ?auto_243317 ?auto_243316 ) ( ON ?auto_243318 ?auto_243317 ) ( ON ?auto_243319 ?auto_243318 ) ( not ( = ?auto_243314 ?auto_243315 ) ) ( not ( = ?auto_243314 ?auto_243316 ) ) ( not ( = ?auto_243314 ?auto_243317 ) ) ( not ( = ?auto_243314 ?auto_243318 ) ) ( not ( = ?auto_243314 ?auto_243319 ) ) ( not ( = ?auto_243314 ?auto_243320 ) ) ( not ( = ?auto_243314 ?auto_243321 ) ) ( not ( = ?auto_243314 ?auto_243322 ) ) ( not ( = ?auto_243314 ?auto_243323 ) ) ( not ( = ?auto_243314 ?auto_243324 ) ) ( not ( = ?auto_243314 ?auto_243325 ) ) ( not ( = ?auto_243314 ?auto_243326 ) ) ( not ( = ?auto_243315 ?auto_243316 ) ) ( not ( = ?auto_243315 ?auto_243317 ) ) ( not ( = ?auto_243315 ?auto_243318 ) ) ( not ( = ?auto_243315 ?auto_243319 ) ) ( not ( = ?auto_243315 ?auto_243320 ) ) ( not ( = ?auto_243315 ?auto_243321 ) ) ( not ( = ?auto_243315 ?auto_243322 ) ) ( not ( = ?auto_243315 ?auto_243323 ) ) ( not ( = ?auto_243315 ?auto_243324 ) ) ( not ( = ?auto_243315 ?auto_243325 ) ) ( not ( = ?auto_243315 ?auto_243326 ) ) ( not ( = ?auto_243316 ?auto_243317 ) ) ( not ( = ?auto_243316 ?auto_243318 ) ) ( not ( = ?auto_243316 ?auto_243319 ) ) ( not ( = ?auto_243316 ?auto_243320 ) ) ( not ( = ?auto_243316 ?auto_243321 ) ) ( not ( = ?auto_243316 ?auto_243322 ) ) ( not ( = ?auto_243316 ?auto_243323 ) ) ( not ( = ?auto_243316 ?auto_243324 ) ) ( not ( = ?auto_243316 ?auto_243325 ) ) ( not ( = ?auto_243316 ?auto_243326 ) ) ( not ( = ?auto_243317 ?auto_243318 ) ) ( not ( = ?auto_243317 ?auto_243319 ) ) ( not ( = ?auto_243317 ?auto_243320 ) ) ( not ( = ?auto_243317 ?auto_243321 ) ) ( not ( = ?auto_243317 ?auto_243322 ) ) ( not ( = ?auto_243317 ?auto_243323 ) ) ( not ( = ?auto_243317 ?auto_243324 ) ) ( not ( = ?auto_243317 ?auto_243325 ) ) ( not ( = ?auto_243317 ?auto_243326 ) ) ( not ( = ?auto_243318 ?auto_243319 ) ) ( not ( = ?auto_243318 ?auto_243320 ) ) ( not ( = ?auto_243318 ?auto_243321 ) ) ( not ( = ?auto_243318 ?auto_243322 ) ) ( not ( = ?auto_243318 ?auto_243323 ) ) ( not ( = ?auto_243318 ?auto_243324 ) ) ( not ( = ?auto_243318 ?auto_243325 ) ) ( not ( = ?auto_243318 ?auto_243326 ) ) ( not ( = ?auto_243319 ?auto_243320 ) ) ( not ( = ?auto_243319 ?auto_243321 ) ) ( not ( = ?auto_243319 ?auto_243322 ) ) ( not ( = ?auto_243319 ?auto_243323 ) ) ( not ( = ?auto_243319 ?auto_243324 ) ) ( not ( = ?auto_243319 ?auto_243325 ) ) ( not ( = ?auto_243319 ?auto_243326 ) ) ( not ( = ?auto_243320 ?auto_243321 ) ) ( not ( = ?auto_243320 ?auto_243322 ) ) ( not ( = ?auto_243320 ?auto_243323 ) ) ( not ( = ?auto_243320 ?auto_243324 ) ) ( not ( = ?auto_243320 ?auto_243325 ) ) ( not ( = ?auto_243320 ?auto_243326 ) ) ( not ( = ?auto_243321 ?auto_243322 ) ) ( not ( = ?auto_243321 ?auto_243323 ) ) ( not ( = ?auto_243321 ?auto_243324 ) ) ( not ( = ?auto_243321 ?auto_243325 ) ) ( not ( = ?auto_243321 ?auto_243326 ) ) ( not ( = ?auto_243322 ?auto_243323 ) ) ( not ( = ?auto_243322 ?auto_243324 ) ) ( not ( = ?auto_243322 ?auto_243325 ) ) ( not ( = ?auto_243322 ?auto_243326 ) ) ( not ( = ?auto_243323 ?auto_243324 ) ) ( not ( = ?auto_243323 ?auto_243325 ) ) ( not ( = ?auto_243323 ?auto_243326 ) ) ( not ( = ?auto_243324 ?auto_243325 ) ) ( not ( = ?auto_243324 ?auto_243326 ) ) ( not ( = ?auto_243325 ?auto_243326 ) ) ( ON ?auto_243325 ?auto_243326 ) ( ON ?auto_243324 ?auto_243325 ) ( ON ?auto_243323 ?auto_243324 ) ( ON ?auto_243322 ?auto_243323 ) ( ON ?auto_243321 ?auto_243322 ) ( CLEAR ?auto_243319 ) ( ON ?auto_243320 ?auto_243321 ) ( CLEAR ?auto_243320 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_243314 ?auto_243315 ?auto_243316 ?auto_243317 ?auto_243318 ?auto_243319 ?auto_243320 )
      ( MAKE-13PILE ?auto_243314 ?auto_243315 ?auto_243316 ?auto_243317 ?auto_243318 ?auto_243319 ?auto_243320 ?auto_243321 ?auto_243322 ?auto_243323 ?auto_243324 ?auto_243325 ?auto_243326 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_243340 - BLOCK
      ?auto_243341 - BLOCK
      ?auto_243342 - BLOCK
      ?auto_243343 - BLOCK
      ?auto_243344 - BLOCK
      ?auto_243345 - BLOCK
      ?auto_243346 - BLOCK
      ?auto_243347 - BLOCK
      ?auto_243348 - BLOCK
      ?auto_243349 - BLOCK
      ?auto_243350 - BLOCK
      ?auto_243351 - BLOCK
      ?auto_243352 - BLOCK
    )
    :vars
    (
      ?auto_243353 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_243352 ?auto_243353 ) ( ON-TABLE ?auto_243340 ) ( ON ?auto_243341 ?auto_243340 ) ( ON ?auto_243342 ?auto_243341 ) ( ON ?auto_243343 ?auto_243342 ) ( ON ?auto_243344 ?auto_243343 ) ( not ( = ?auto_243340 ?auto_243341 ) ) ( not ( = ?auto_243340 ?auto_243342 ) ) ( not ( = ?auto_243340 ?auto_243343 ) ) ( not ( = ?auto_243340 ?auto_243344 ) ) ( not ( = ?auto_243340 ?auto_243345 ) ) ( not ( = ?auto_243340 ?auto_243346 ) ) ( not ( = ?auto_243340 ?auto_243347 ) ) ( not ( = ?auto_243340 ?auto_243348 ) ) ( not ( = ?auto_243340 ?auto_243349 ) ) ( not ( = ?auto_243340 ?auto_243350 ) ) ( not ( = ?auto_243340 ?auto_243351 ) ) ( not ( = ?auto_243340 ?auto_243352 ) ) ( not ( = ?auto_243340 ?auto_243353 ) ) ( not ( = ?auto_243341 ?auto_243342 ) ) ( not ( = ?auto_243341 ?auto_243343 ) ) ( not ( = ?auto_243341 ?auto_243344 ) ) ( not ( = ?auto_243341 ?auto_243345 ) ) ( not ( = ?auto_243341 ?auto_243346 ) ) ( not ( = ?auto_243341 ?auto_243347 ) ) ( not ( = ?auto_243341 ?auto_243348 ) ) ( not ( = ?auto_243341 ?auto_243349 ) ) ( not ( = ?auto_243341 ?auto_243350 ) ) ( not ( = ?auto_243341 ?auto_243351 ) ) ( not ( = ?auto_243341 ?auto_243352 ) ) ( not ( = ?auto_243341 ?auto_243353 ) ) ( not ( = ?auto_243342 ?auto_243343 ) ) ( not ( = ?auto_243342 ?auto_243344 ) ) ( not ( = ?auto_243342 ?auto_243345 ) ) ( not ( = ?auto_243342 ?auto_243346 ) ) ( not ( = ?auto_243342 ?auto_243347 ) ) ( not ( = ?auto_243342 ?auto_243348 ) ) ( not ( = ?auto_243342 ?auto_243349 ) ) ( not ( = ?auto_243342 ?auto_243350 ) ) ( not ( = ?auto_243342 ?auto_243351 ) ) ( not ( = ?auto_243342 ?auto_243352 ) ) ( not ( = ?auto_243342 ?auto_243353 ) ) ( not ( = ?auto_243343 ?auto_243344 ) ) ( not ( = ?auto_243343 ?auto_243345 ) ) ( not ( = ?auto_243343 ?auto_243346 ) ) ( not ( = ?auto_243343 ?auto_243347 ) ) ( not ( = ?auto_243343 ?auto_243348 ) ) ( not ( = ?auto_243343 ?auto_243349 ) ) ( not ( = ?auto_243343 ?auto_243350 ) ) ( not ( = ?auto_243343 ?auto_243351 ) ) ( not ( = ?auto_243343 ?auto_243352 ) ) ( not ( = ?auto_243343 ?auto_243353 ) ) ( not ( = ?auto_243344 ?auto_243345 ) ) ( not ( = ?auto_243344 ?auto_243346 ) ) ( not ( = ?auto_243344 ?auto_243347 ) ) ( not ( = ?auto_243344 ?auto_243348 ) ) ( not ( = ?auto_243344 ?auto_243349 ) ) ( not ( = ?auto_243344 ?auto_243350 ) ) ( not ( = ?auto_243344 ?auto_243351 ) ) ( not ( = ?auto_243344 ?auto_243352 ) ) ( not ( = ?auto_243344 ?auto_243353 ) ) ( not ( = ?auto_243345 ?auto_243346 ) ) ( not ( = ?auto_243345 ?auto_243347 ) ) ( not ( = ?auto_243345 ?auto_243348 ) ) ( not ( = ?auto_243345 ?auto_243349 ) ) ( not ( = ?auto_243345 ?auto_243350 ) ) ( not ( = ?auto_243345 ?auto_243351 ) ) ( not ( = ?auto_243345 ?auto_243352 ) ) ( not ( = ?auto_243345 ?auto_243353 ) ) ( not ( = ?auto_243346 ?auto_243347 ) ) ( not ( = ?auto_243346 ?auto_243348 ) ) ( not ( = ?auto_243346 ?auto_243349 ) ) ( not ( = ?auto_243346 ?auto_243350 ) ) ( not ( = ?auto_243346 ?auto_243351 ) ) ( not ( = ?auto_243346 ?auto_243352 ) ) ( not ( = ?auto_243346 ?auto_243353 ) ) ( not ( = ?auto_243347 ?auto_243348 ) ) ( not ( = ?auto_243347 ?auto_243349 ) ) ( not ( = ?auto_243347 ?auto_243350 ) ) ( not ( = ?auto_243347 ?auto_243351 ) ) ( not ( = ?auto_243347 ?auto_243352 ) ) ( not ( = ?auto_243347 ?auto_243353 ) ) ( not ( = ?auto_243348 ?auto_243349 ) ) ( not ( = ?auto_243348 ?auto_243350 ) ) ( not ( = ?auto_243348 ?auto_243351 ) ) ( not ( = ?auto_243348 ?auto_243352 ) ) ( not ( = ?auto_243348 ?auto_243353 ) ) ( not ( = ?auto_243349 ?auto_243350 ) ) ( not ( = ?auto_243349 ?auto_243351 ) ) ( not ( = ?auto_243349 ?auto_243352 ) ) ( not ( = ?auto_243349 ?auto_243353 ) ) ( not ( = ?auto_243350 ?auto_243351 ) ) ( not ( = ?auto_243350 ?auto_243352 ) ) ( not ( = ?auto_243350 ?auto_243353 ) ) ( not ( = ?auto_243351 ?auto_243352 ) ) ( not ( = ?auto_243351 ?auto_243353 ) ) ( not ( = ?auto_243352 ?auto_243353 ) ) ( ON ?auto_243351 ?auto_243352 ) ( ON ?auto_243350 ?auto_243351 ) ( ON ?auto_243349 ?auto_243350 ) ( ON ?auto_243348 ?auto_243349 ) ( ON ?auto_243347 ?auto_243348 ) ( ON ?auto_243346 ?auto_243347 ) ( CLEAR ?auto_243344 ) ( ON ?auto_243345 ?auto_243346 ) ( CLEAR ?auto_243345 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_243340 ?auto_243341 ?auto_243342 ?auto_243343 ?auto_243344 ?auto_243345 )
      ( MAKE-13PILE ?auto_243340 ?auto_243341 ?auto_243342 ?auto_243343 ?auto_243344 ?auto_243345 ?auto_243346 ?auto_243347 ?auto_243348 ?auto_243349 ?auto_243350 ?auto_243351 ?auto_243352 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_243367 - BLOCK
      ?auto_243368 - BLOCK
      ?auto_243369 - BLOCK
      ?auto_243370 - BLOCK
      ?auto_243371 - BLOCK
      ?auto_243372 - BLOCK
      ?auto_243373 - BLOCK
      ?auto_243374 - BLOCK
      ?auto_243375 - BLOCK
      ?auto_243376 - BLOCK
      ?auto_243377 - BLOCK
      ?auto_243378 - BLOCK
      ?auto_243379 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_243379 ) ( ON-TABLE ?auto_243367 ) ( ON ?auto_243368 ?auto_243367 ) ( ON ?auto_243369 ?auto_243368 ) ( ON ?auto_243370 ?auto_243369 ) ( ON ?auto_243371 ?auto_243370 ) ( not ( = ?auto_243367 ?auto_243368 ) ) ( not ( = ?auto_243367 ?auto_243369 ) ) ( not ( = ?auto_243367 ?auto_243370 ) ) ( not ( = ?auto_243367 ?auto_243371 ) ) ( not ( = ?auto_243367 ?auto_243372 ) ) ( not ( = ?auto_243367 ?auto_243373 ) ) ( not ( = ?auto_243367 ?auto_243374 ) ) ( not ( = ?auto_243367 ?auto_243375 ) ) ( not ( = ?auto_243367 ?auto_243376 ) ) ( not ( = ?auto_243367 ?auto_243377 ) ) ( not ( = ?auto_243367 ?auto_243378 ) ) ( not ( = ?auto_243367 ?auto_243379 ) ) ( not ( = ?auto_243368 ?auto_243369 ) ) ( not ( = ?auto_243368 ?auto_243370 ) ) ( not ( = ?auto_243368 ?auto_243371 ) ) ( not ( = ?auto_243368 ?auto_243372 ) ) ( not ( = ?auto_243368 ?auto_243373 ) ) ( not ( = ?auto_243368 ?auto_243374 ) ) ( not ( = ?auto_243368 ?auto_243375 ) ) ( not ( = ?auto_243368 ?auto_243376 ) ) ( not ( = ?auto_243368 ?auto_243377 ) ) ( not ( = ?auto_243368 ?auto_243378 ) ) ( not ( = ?auto_243368 ?auto_243379 ) ) ( not ( = ?auto_243369 ?auto_243370 ) ) ( not ( = ?auto_243369 ?auto_243371 ) ) ( not ( = ?auto_243369 ?auto_243372 ) ) ( not ( = ?auto_243369 ?auto_243373 ) ) ( not ( = ?auto_243369 ?auto_243374 ) ) ( not ( = ?auto_243369 ?auto_243375 ) ) ( not ( = ?auto_243369 ?auto_243376 ) ) ( not ( = ?auto_243369 ?auto_243377 ) ) ( not ( = ?auto_243369 ?auto_243378 ) ) ( not ( = ?auto_243369 ?auto_243379 ) ) ( not ( = ?auto_243370 ?auto_243371 ) ) ( not ( = ?auto_243370 ?auto_243372 ) ) ( not ( = ?auto_243370 ?auto_243373 ) ) ( not ( = ?auto_243370 ?auto_243374 ) ) ( not ( = ?auto_243370 ?auto_243375 ) ) ( not ( = ?auto_243370 ?auto_243376 ) ) ( not ( = ?auto_243370 ?auto_243377 ) ) ( not ( = ?auto_243370 ?auto_243378 ) ) ( not ( = ?auto_243370 ?auto_243379 ) ) ( not ( = ?auto_243371 ?auto_243372 ) ) ( not ( = ?auto_243371 ?auto_243373 ) ) ( not ( = ?auto_243371 ?auto_243374 ) ) ( not ( = ?auto_243371 ?auto_243375 ) ) ( not ( = ?auto_243371 ?auto_243376 ) ) ( not ( = ?auto_243371 ?auto_243377 ) ) ( not ( = ?auto_243371 ?auto_243378 ) ) ( not ( = ?auto_243371 ?auto_243379 ) ) ( not ( = ?auto_243372 ?auto_243373 ) ) ( not ( = ?auto_243372 ?auto_243374 ) ) ( not ( = ?auto_243372 ?auto_243375 ) ) ( not ( = ?auto_243372 ?auto_243376 ) ) ( not ( = ?auto_243372 ?auto_243377 ) ) ( not ( = ?auto_243372 ?auto_243378 ) ) ( not ( = ?auto_243372 ?auto_243379 ) ) ( not ( = ?auto_243373 ?auto_243374 ) ) ( not ( = ?auto_243373 ?auto_243375 ) ) ( not ( = ?auto_243373 ?auto_243376 ) ) ( not ( = ?auto_243373 ?auto_243377 ) ) ( not ( = ?auto_243373 ?auto_243378 ) ) ( not ( = ?auto_243373 ?auto_243379 ) ) ( not ( = ?auto_243374 ?auto_243375 ) ) ( not ( = ?auto_243374 ?auto_243376 ) ) ( not ( = ?auto_243374 ?auto_243377 ) ) ( not ( = ?auto_243374 ?auto_243378 ) ) ( not ( = ?auto_243374 ?auto_243379 ) ) ( not ( = ?auto_243375 ?auto_243376 ) ) ( not ( = ?auto_243375 ?auto_243377 ) ) ( not ( = ?auto_243375 ?auto_243378 ) ) ( not ( = ?auto_243375 ?auto_243379 ) ) ( not ( = ?auto_243376 ?auto_243377 ) ) ( not ( = ?auto_243376 ?auto_243378 ) ) ( not ( = ?auto_243376 ?auto_243379 ) ) ( not ( = ?auto_243377 ?auto_243378 ) ) ( not ( = ?auto_243377 ?auto_243379 ) ) ( not ( = ?auto_243378 ?auto_243379 ) ) ( ON ?auto_243378 ?auto_243379 ) ( ON ?auto_243377 ?auto_243378 ) ( ON ?auto_243376 ?auto_243377 ) ( ON ?auto_243375 ?auto_243376 ) ( ON ?auto_243374 ?auto_243375 ) ( ON ?auto_243373 ?auto_243374 ) ( CLEAR ?auto_243371 ) ( ON ?auto_243372 ?auto_243373 ) ( CLEAR ?auto_243372 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_243367 ?auto_243368 ?auto_243369 ?auto_243370 ?auto_243371 ?auto_243372 )
      ( MAKE-13PILE ?auto_243367 ?auto_243368 ?auto_243369 ?auto_243370 ?auto_243371 ?auto_243372 ?auto_243373 ?auto_243374 ?auto_243375 ?auto_243376 ?auto_243377 ?auto_243378 ?auto_243379 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_243393 - BLOCK
      ?auto_243394 - BLOCK
      ?auto_243395 - BLOCK
      ?auto_243396 - BLOCK
      ?auto_243397 - BLOCK
      ?auto_243398 - BLOCK
      ?auto_243399 - BLOCK
      ?auto_243400 - BLOCK
      ?auto_243401 - BLOCK
      ?auto_243402 - BLOCK
      ?auto_243403 - BLOCK
      ?auto_243404 - BLOCK
      ?auto_243405 - BLOCK
    )
    :vars
    (
      ?auto_243406 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_243405 ?auto_243406 ) ( ON-TABLE ?auto_243393 ) ( ON ?auto_243394 ?auto_243393 ) ( ON ?auto_243395 ?auto_243394 ) ( ON ?auto_243396 ?auto_243395 ) ( not ( = ?auto_243393 ?auto_243394 ) ) ( not ( = ?auto_243393 ?auto_243395 ) ) ( not ( = ?auto_243393 ?auto_243396 ) ) ( not ( = ?auto_243393 ?auto_243397 ) ) ( not ( = ?auto_243393 ?auto_243398 ) ) ( not ( = ?auto_243393 ?auto_243399 ) ) ( not ( = ?auto_243393 ?auto_243400 ) ) ( not ( = ?auto_243393 ?auto_243401 ) ) ( not ( = ?auto_243393 ?auto_243402 ) ) ( not ( = ?auto_243393 ?auto_243403 ) ) ( not ( = ?auto_243393 ?auto_243404 ) ) ( not ( = ?auto_243393 ?auto_243405 ) ) ( not ( = ?auto_243393 ?auto_243406 ) ) ( not ( = ?auto_243394 ?auto_243395 ) ) ( not ( = ?auto_243394 ?auto_243396 ) ) ( not ( = ?auto_243394 ?auto_243397 ) ) ( not ( = ?auto_243394 ?auto_243398 ) ) ( not ( = ?auto_243394 ?auto_243399 ) ) ( not ( = ?auto_243394 ?auto_243400 ) ) ( not ( = ?auto_243394 ?auto_243401 ) ) ( not ( = ?auto_243394 ?auto_243402 ) ) ( not ( = ?auto_243394 ?auto_243403 ) ) ( not ( = ?auto_243394 ?auto_243404 ) ) ( not ( = ?auto_243394 ?auto_243405 ) ) ( not ( = ?auto_243394 ?auto_243406 ) ) ( not ( = ?auto_243395 ?auto_243396 ) ) ( not ( = ?auto_243395 ?auto_243397 ) ) ( not ( = ?auto_243395 ?auto_243398 ) ) ( not ( = ?auto_243395 ?auto_243399 ) ) ( not ( = ?auto_243395 ?auto_243400 ) ) ( not ( = ?auto_243395 ?auto_243401 ) ) ( not ( = ?auto_243395 ?auto_243402 ) ) ( not ( = ?auto_243395 ?auto_243403 ) ) ( not ( = ?auto_243395 ?auto_243404 ) ) ( not ( = ?auto_243395 ?auto_243405 ) ) ( not ( = ?auto_243395 ?auto_243406 ) ) ( not ( = ?auto_243396 ?auto_243397 ) ) ( not ( = ?auto_243396 ?auto_243398 ) ) ( not ( = ?auto_243396 ?auto_243399 ) ) ( not ( = ?auto_243396 ?auto_243400 ) ) ( not ( = ?auto_243396 ?auto_243401 ) ) ( not ( = ?auto_243396 ?auto_243402 ) ) ( not ( = ?auto_243396 ?auto_243403 ) ) ( not ( = ?auto_243396 ?auto_243404 ) ) ( not ( = ?auto_243396 ?auto_243405 ) ) ( not ( = ?auto_243396 ?auto_243406 ) ) ( not ( = ?auto_243397 ?auto_243398 ) ) ( not ( = ?auto_243397 ?auto_243399 ) ) ( not ( = ?auto_243397 ?auto_243400 ) ) ( not ( = ?auto_243397 ?auto_243401 ) ) ( not ( = ?auto_243397 ?auto_243402 ) ) ( not ( = ?auto_243397 ?auto_243403 ) ) ( not ( = ?auto_243397 ?auto_243404 ) ) ( not ( = ?auto_243397 ?auto_243405 ) ) ( not ( = ?auto_243397 ?auto_243406 ) ) ( not ( = ?auto_243398 ?auto_243399 ) ) ( not ( = ?auto_243398 ?auto_243400 ) ) ( not ( = ?auto_243398 ?auto_243401 ) ) ( not ( = ?auto_243398 ?auto_243402 ) ) ( not ( = ?auto_243398 ?auto_243403 ) ) ( not ( = ?auto_243398 ?auto_243404 ) ) ( not ( = ?auto_243398 ?auto_243405 ) ) ( not ( = ?auto_243398 ?auto_243406 ) ) ( not ( = ?auto_243399 ?auto_243400 ) ) ( not ( = ?auto_243399 ?auto_243401 ) ) ( not ( = ?auto_243399 ?auto_243402 ) ) ( not ( = ?auto_243399 ?auto_243403 ) ) ( not ( = ?auto_243399 ?auto_243404 ) ) ( not ( = ?auto_243399 ?auto_243405 ) ) ( not ( = ?auto_243399 ?auto_243406 ) ) ( not ( = ?auto_243400 ?auto_243401 ) ) ( not ( = ?auto_243400 ?auto_243402 ) ) ( not ( = ?auto_243400 ?auto_243403 ) ) ( not ( = ?auto_243400 ?auto_243404 ) ) ( not ( = ?auto_243400 ?auto_243405 ) ) ( not ( = ?auto_243400 ?auto_243406 ) ) ( not ( = ?auto_243401 ?auto_243402 ) ) ( not ( = ?auto_243401 ?auto_243403 ) ) ( not ( = ?auto_243401 ?auto_243404 ) ) ( not ( = ?auto_243401 ?auto_243405 ) ) ( not ( = ?auto_243401 ?auto_243406 ) ) ( not ( = ?auto_243402 ?auto_243403 ) ) ( not ( = ?auto_243402 ?auto_243404 ) ) ( not ( = ?auto_243402 ?auto_243405 ) ) ( not ( = ?auto_243402 ?auto_243406 ) ) ( not ( = ?auto_243403 ?auto_243404 ) ) ( not ( = ?auto_243403 ?auto_243405 ) ) ( not ( = ?auto_243403 ?auto_243406 ) ) ( not ( = ?auto_243404 ?auto_243405 ) ) ( not ( = ?auto_243404 ?auto_243406 ) ) ( not ( = ?auto_243405 ?auto_243406 ) ) ( ON ?auto_243404 ?auto_243405 ) ( ON ?auto_243403 ?auto_243404 ) ( ON ?auto_243402 ?auto_243403 ) ( ON ?auto_243401 ?auto_243402 ) ( ON ?auto_243400 ?auto_243401 ) ( ON ?auto_243399 ?auto_243400 ) ( ON ?auto_243398 ?auto_243399 ) ( CLEAR ?auto_243396 ) ( ON ?auto_243397 ?auto_243398 ) ( CLEAR ?auto_243397 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_243393 ?auto_243394 ?auto_243395 ?auto_243396 ?auto_243397 )
      ( MAKE-13PILE ?auto_243393 ?auto_243394 ?auto_243395 ?auto_243396 ?auto_243397 ?auto_243398 ?auto_243399 ?auto_243400 ?auto_243401 ?auto_243402 ?auto_243403 ?auto_243404 ?auto_243405 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_243420 - BLOCK
      ?auto_243421 - BLOCK
      ?auto_243422 - BLOCK
      ?auto_243423 - BLOCK
      ?auto_243424 - BLOCK
      ?auto_243425 - BLOCK
      ?auto_243426 - BLOCK
      ?auto_243427 - BLOCK
      ?auto_243428 - BLOCK
      ?auto_243429 - BLOCK
      ?auto_243430 - BLOCK
      ?auto_243431 - BLOCK
      ?auto_243432 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_243432 ) ( ON-TABLE ?auto_243420 ) ( ON ?auto_243421 ?auto_243420 ) ( ON ?auto_243422 ?auto_243421 ) ( ON ?auto_243423 ?auto_243422 ) ( not ( = ?auto_243420 ?auto_243421 ) ) ( not ( = ?auto_243420 ?auto_243422 ) ) ( not ( = ?auto_243420 ?auto_243423 ) ) ( not ( = ?auto_243420 ?auto_243424 ) ) ( not ( = ?auto_243420 ?auto_243425 ) ) ( not ( = ?auto_243420 ?auto_243426 ) ) ( not ( = ?auto_243420 ?auto_243427 ) ) ( not ( = ?auto_243420 ?auto_243428 ) ) ( not ( = ?auto_243420 ?auto_243429 ) ) ( not ( = ?auto_243420 ?auto_243430 ) ) ( not ( = ?auto_243420 ?auto_243431 ) ) ( not ( = ?auto_243420 ?auto_243432 ) ) ( not ( = ?auto_243421 ?auto_243422 ) ) ( not ( = ?auto_243421 ?auto_243423 ) ) ( not ( = ?auto_243421 ?auto_243424 ) ) ( not ( = ?auto_243421 ?auto_243425 ) ) ( not ( = ?auto_243421 ?auto_243426 ) ) ( not ( = ?auto_243421 ?auto_243427 ) ) ( not ( = ?auto_243421 ?auto_243428 ) ) ( not ( = ?auto_243421 ?auto_243429 ) ) ( not ( = ?auto_243421 ?auto_243430 ) ) ( not ( = ?auto_243421 ?auto_243431 ) ) ( not ( = ?auto_243421 ?auto_243432 ) ) ( not ( = ?auto_243422 ?auto_243423 ) ) ( not ( = ?auto_243422 ?auto_243424 ) ) ( not ( = ?auto_243422 ?auto_243425 ) ) ( not ( = ?auto_243422 ?auto_243426 ) ) ( not ( = ?auto_243422 ?auto_243427 ) ) ( not ( = ?auto_243422 ?auto_243428 ) ) ( not ( = ?auto_243422 ?auto_243429 ) ) ( not ( = ?auto_243422 ?auto_243430 ) ) ( not ( = ?auto_243422 ?auto_243431 ) ) ( not ( = ?auto_243422 ?auto_243432 ) ) ( not ( = ?auto_243423 ?auto_243424 ) ) ( not ( = ?auto_243423 ?auto_243425 ) ) ( not ( = ?auto_243423 ?auto_243426 ) ) ( not ( = ?auto_243423 ?auto_243427 ) ) ( not ( = ?auto_243423 ?auto_243428 ) ) ( not ( = ?auto_243423 ?auto_243429 ) ) ( not ( = ?auto_243423 ?auto_243430 ) ) ( not ( = ?auto_243423 ?auto_243431 ) ) ( not ( = ?auto_243423 ?auto_243432 ) ) ( not ( = ?auto_243424 ?auto_243425 ) ) ( not ( = ?auto_243424 ?auto_243426 ) ) ( not ( = ?auto_243424 ?auto_243427 ) ) ( not ( = ?auto_243424 ?auto_243428 ) ) ( not ( = ?auto_243424 ?auto_243429 ) ) ( not ( = ?auto_243424 ?auto_243430 ) ) ( not ( = ?auto_243424 ?auto_243431 ) ) ( not ( = ?auto_243424 ?auto_243432 ) ) ( not ( = ?auto_243425 ?auto_243426 ) ) ( not ( = ?auto_243425 ?auto_243427 ) ) ( not ( = ?auto_243425 ?auto_243428 ) ) ( not ( = ?auto_243425 ?auto_243429 ) ) ( not ( = ?auto_243425 ?auto_243430 ) ) ( not ( = ?auto_243425 ?auto_243431 ) ) ( not ( = ?auto_243425 ?auto_243432 ) ) ( not ( = ?auto_243426 ?auto_243427 ) ) ( not ( = ?auto_243426 ?auto_243428 ) ) ( not ( = ?auto_243426 ?auto_243429 ) ) ( not ( = ?auto_243426 ?auto_243430 ) ) ( not ( = ?auto_243426 ?auto_243431 ) ) ( not ( = ?auto_243426 ?auto_243432 ) ) ( not ( = ?auto_243427 ?auto_243428 ) ) ( not ( = ?auto_243427 ?auto_243429 ) ) ( not ( = ?auto_243427 ?auto_243430 ) ) ( not ( = ?auto_243427 ?auto_243431 ) ) ( not ( = ?auto_243427 ?auto_243432 ) ) ( not ( = ?auto_243428 ?auto_243429 ) ) ( not ( = ?auto_243428 ?auto_243430 ) ) ( not ( = ?auto_243428 ?auto_243431 ) ) ( not ( = ?auto_243428 ?auto_243432 ) ) ( not ( = ?auto_243429 ?auto_243430 ) ) ( not ( = ?auto_243429 ?auto_243431 ) ) ( not ( = ?auto_243429 ?auto_243432 ) ) ( not ( = ?auto_243430 ?auto_243431 ) ) ( not ( = ?auto_243430 ?auto_243432 ) ) ( not ( = ?auto_243431 ?auto_243432 ) ) ( ON ?auto_243431 ?auto_243432 ) ( ON ?auto_243430 ?auto_243431 ) ( ON ?auto_243429 ?auto_243430 ) ( ON ?auto_243428 ?auto_243429 ) ( ON ?auto_243427 ?auto_243428 ) ( ON ?auto_243426 ?auto_243427 ) ( ON ?auto_243425 ?auto_243426 ) ( CLEAR ?auto_243423 ) ( ON ?auto_243424 ?auto_243425 ) ( CLEAR ?auto_243424 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_243420 ?auto_243421 ?auto_243422 ?auto_243423 ?auto_243424 )
      ( MAKE-13PILE ?auto_243420 ?auto_243421 ?auto_243422 ?auto_243423 ?auto_243424 ?auto_243425 ?auto_243426 ?auto_243427 ?auto_243428 ?auto_243429 ?auto_243430 ?auto_243431 ?auto_243432 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_243446 - BLOCK
      ?auto_243447 - BLOCK
      ?auto_243448 - BLOCK
      ?auto_243449 - BLOCK
      ?auto_243450 - BLOCK
      ?auto_243451 - BLOCK
      ?auto_243452 - BLOCK
      ?auto_243453 - BLOCK
      ?auto_243454 - BLOCK
      ?auto_243455 - BLOCK
      ?auto_243456 - BLOCK
      ?auto_243457 - BLOCK
      ?auto_243458 - BLOCK
    )
    :vars
    (
      ?auto_243459 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_243458 ?auto_243459 ) ( ON-TABLE ?auto_243446 ) ( ON ?auto_243447 ?auto_243446 ) ( ON ?auto_243448 ?auto_243447 ) ( not ( = ?auto_243446 ?auto_243447 ) ) ( not ( = ?auto_243446 ?auto_243448 ) ) ( not ( = ?auto_243446 ?auto_243449 ) ) ( not ( = ?auto_243446 ?auto_243450 ) ) ( not ( = ?auto_243446 ?auto_243451 ) ) ( not ( = ?auto_243446 ?auto_243452 ) ) ( not ( = ?auto_243446 ?auto_243453 ) ) ( not ( = ?auto_243446 ?auto_243454 ) ) ( not ( = ?auto_243446 ?auto_243455 ) ) ( not ( = ?auto_243446 ?auto_243456 ) ) ( not ( = ?auto_243446 ?auto_243457 ) ) ( not ( = ?auto_243446 ?auto_243458 ) ) ( not ( = ?auto_243446 ?auto_243459 ) ) ( not ( = ?auto_243447 ?auto_243448 ) ) ( not ( = ?auto_243447 ?auto_243449 ) ) ( not ( = ?auto_243447 ?auto_243450 ) ) ( not ( = ?auto_243447 ?auto_243451 ) ) ( not ( = ?auto_243447 ?auto_243452 ) ) ( not ( = ?auto_243447 ?auto_243453 ) ) ( not ( = ?auto_243447 ?auto_243454 ) ) ( not ( = ?auto_243447 ?auto_243455 ) ) ( not ( = ?auto_243447 ?auto_243456 ) ) ( not ( = ?auto_243447 ?auto_243457 ) ) ( not ( = ?auto_243447 ?auto_243458 ) ) ( not ( = ?auto_243447 ?auto_243459 ) ) ( not ( = ?auto_243448 ?auto_243449 ) ) ( not ( = ?auto_243448 ?auto_243450 ) ) ( not ( = ?auto_243448 ?auto_243451 ) ) ( not ( = ?auto_243448 ?auto_243452 ) ) ( not ( = ?auto_243448 ?auto_243453 ) ) ( not ( = ?auto_243448 ?auto_243454 ) ) ( not ( = ?auto_243448 ?auto_243455 ) ) ( not ( = ?auto_243448 ?auto_243456 ) ) ( not ( = ?auto_243448 ?auto_243457 ) ) ( not ( = ?auto_243448 ?auto_243458 ) ) ( not ( = ?auto_243448 ?auto_243459 ) ) ( not ( = ?auto_243449 ?auto_243450 ) ) ( not ( = ?auto_243449 ?auto_243451 ) ) ( not ( = ?auto_243449 ?auto_243452 ) ) ( not ( = ?auto_243449 ?auto_243453 ) ) ( not ( = ?auto_243449 ?auto_243454 ) ) ( not ( = ?auto_243449 ?auto_243455 ) ) ( not ( = ?auto_243449 ?auto_243456 ) ) ( not ( = ?auto_243449 ?auto_243457 ) ) ( not ( = ?auto_243449 ?auto_243458 ) ) ( not ( = ?auto_243449 ?auto_243459 ) ) ( not ( = ?auto_243450 ?auto_243451 ) ) ( not ( = ?auto_243450 ?auto_243452 ) ) ( not ( = ?auto_243450 ?auto_243453 ) ) ( not ( = ?auto_243450 ?auto_243454 ) ) ( not ( = ?auto_243450 ?auto_243455 ) ) ( not ( = ?auto_243450 ?auto_243456 ) ) ( not ( = ?auto_243450 ?auto_243457 ) ) ( not ( = ?auto_243450 ?auto_243458 ) ) ( not ( = ?auto_243450 ?auto_243459 ) ) ( not ( = ?auto_243451 ?auto_243452 ) ) ( not ( = ?auto_243451 ?auto_243453 ) ) ( not ( = ?auto_243451 ?auto_243454 ) ) ( not ( = ?auto_243451 ?auto_243455 ) ) ( not ( = ?auto_243451 ?auto_243456 ) ) ( not ( = ?auto_243451 ?auto_243457 ) ) ( not ( = ?auto_243451 ?auto_243458 ) ) ( not ( = ?auto_243451 ?auto_243459 ) ) ( not ( = ?auto_243452 ?auto_243453 ) ) ( not ( = ?auto_243452 ?auto_243454 ) ) ( not ( = ?auto_243452 ?auto_243455 ) ) ( not ( = ?auto_243452 ?auto_243456 ) ) ( not ( = ?auto_243452 ?auto_243457 ) ) ( not ( = ?auto_243452 ?auto_243458 ) ) ( not ( = ?auto_243452 ?auto_243459 ) ) ( not ( = ?auto_243453 ?auto_243454 ) ) ( not ( = ?auto_243453 ?auto_243455 ) ) ( not ( = ?auto_243453 ?auto_243456 ) ) ( not ( = ?auto_243453 ?auto_243457 ) ) ( not ( = ?auto_243453 ?auto_243458 ) ) ( not ( = ?auto_243453 ?auto_243459 ) ) ( not ( = ?auto_243454 ?auto_243455 ) ) ( not ( = ?auto_243454 ?auto_243456 ) ) ( not ( = ?auto_243454 ?auto_243457 ) ) ( not ( = ?auto_243454 ?auto_243458 ) ) ( not ( = ?auto_243454 ?auto_243459 ) ) ( not ( = ?auto_243455 ?auto_243456 ) ) ( not ( = ?auto_243455 ?auto_243457 ) ) ( not ( = ?auto_243455 ?auto_243458 ) ) ( not ( = ?auto_243455 ?auto_243459 ) ) ( not ( = ?auto_243456 ?auto_243457 ) ) ( not ( = ?auto_243456 ?auto_243458 ) ) ( not ( = ?auto_243456 ?auto_243459 ) ) ( not ( = ?auto_243457 ?auto_243458 ) ) ( not ( = ?auto_243457 ?auto_243459 ) ) ( not ( = ?auto_243458 ?auto_243459 ) ) ( ON ?auto_243457 ?auto_243458 ) ( ON ?auto_243456 ?auto_243457 ) ( ON ?auto_243455 ?auto_243456 ) ( ON ?auto_243454 ?auto_243455 ) ( ON ?auto_243453 ?auto_243454 ) ( ON ?auto_243452 ?auto_243453 ) ( ON ?auto_243451 ?auto_243452 ) ( ON ?auto_243450 ?auto_243451 ) ( CLEAR ?auto_243448 ) ( ON ?auto_243449 ?auto_243450 ) ( CLEAR ?auto_243449 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_243446 ?auto_243447 ?auto_243448 ?auto_243449 )
      ( MAKE-13PILE ?auto_243446 ?auto_243447 ?auto_243448 ?auto_243449 ?auto_243450 ?auto_243451 ?auto_243452 ?auto_243453 ?auto_243454 ?auto_243455 ?auto_243456 ?auto_243457 ?auto_243458 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_243473 - BLOCK
      ?auto_243474 - BLOCK
      ?auto_243475 - BLOCK
      ?auto_243476 - BLOCK
      ?auto_243477 - BLOCK
      ?auto_243478 - BLOCK
      ?auto_243479 - BLOCK
      ?auto_243480 - BLOCK
      ?auto_243481 - BLOCK
      ?auto_243482 - BLOCK
      ?auto_243483 - BLOCK
      ?auto_243484 - BLOCK
      ?auto_243485 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_243485 ) ( ON-TABLE ?auto_243473 ) ( ON ?auto_243474 ?auto_243473 ) ( ON ?auto_243475 ?auto_243474 ) ( not ( = ?auto_243473 ?auto_243474 ) ) ( not ( = ?auto_243473 ?auto_243475 ) ) ( not ( = ?auto_243473 ?auto_243476 ) ) ( not ( = ?auto_243473 ?auto_243477 ) ) ( not ( = ?auto_243473 ?auto_243478 ) ) ( not ( = ?auto_243473 ?auto_243479 ) ) ( not ( = ?auto_243473 ?auto_243480 ) ) ( not ( = ?auto_243473 ?auto_243481 ) ) ( not ( = ?auto_243473 ?auto_243482 ) ) ( not ( = ?auto_243473 ?auto_243483 ) ) ( not ( = ?auto_243473 ?auto_243484 ) ) ( not ( = ?auto_243473 ?auto_243485 ) ) ( not ( = ?auto_243474 ?auto_243475 ) ) ( not ( = ?auto_243474 ?auto_243476 ) ) ( not ( = ?auto_243474 ?auto_243477 ) ) ( not ( = ?auto_243474 ?auto_243478 ) ) ( not ( = ?auto_243474 ?auto_243479 ) ) ( not ( = ?auto_243474 ?auto_243480 ) ) ( not ( = ?auto_243474 ?auto_243481 ) ) ( not ( = ?auto_243474 ?auto_243482 ) ) ( not ( = ?auto_243474 ?auto_243483 ) ) ( not ( = ?auto_243474 ?auto_243484 ) ) ( not ( = ?auto_243474 ?auto_243485 ) ) ( not ( = ?auto_243475 ?auto_243476 ) ) ( not ( = ?auto_243475 ?auto_243477 ) ) ( not ( = ?auto_243475 ?auto_243478 ) ) ( not ( = ?auto_243475 ?auto_243479 ) ) ( not ( = ?auto_243475 ?auto_243480 ) ) ( not ( = ?auto_243475 ?auto_243481 ) ) ( not ( = ?auto_243475 ?auto_243482 ) ) ( not ( = ?auto_243475 ?auto_243483 ) ) ( not ( = ?auto_243475 ?auto_243484 ) ) ( not ( = ?auto_243475 ?auto_243485 ) ) ( not ( = ?auto_243476 ?auto_243477 ) ) ( not ( = ?auto_243476 ?auto_243478 ) ) ( not ( = ?auto_243476 ?auto_243479 ) ) ( not ( = ?auto_243476 ?auto_243480 ) ) ( not ( = ?auto_243476 ?auto_243481 ) ) ( not ( = ?auto_243476 ?auto_243482 ) ) ( not ( = ?auto_243476 ?auto_243483 ) ) ( not ( = ?auto_243476 ?auto_243484 ) ) ( not ( = ?auto_243476 ?auto_243485 ) ) ( not ( = ?auto_243477 ?auto_243478 ) ) ( not ( = ?auto_243477 ?auto_243479 ) ) ( not ( = ?auto_243477 ?auto_243480 ) ) ( not ( = ?auto_243477 ?auto_243481 ) ) ( not ( = ?auto_243477 ?auto_243482 ) ) ( not ( = ?auto_243477 ?auto_243483 ) ) ( not ( = ?auto_243477 ?auto_243484 ) ) ( not ( = ?auto_243477 ?auto_243485 ) ) ( not ( = ?auto_243478 ?auto_243479 ) ) ( not ( = ?auto_243478 ?auto_243480 ) ) ( not ( = ?auto_243478 ?auto_243481 ) ) ( not ( = ?auto_243478 ?auto_243482 ) ) ( not ( = ?auto_243478 ?auto_243483 ) ) ( not ( = ?auto_243478 ?auto_243484 ) ) ( not ( = ?auto_243478 ?auto_243485 ) ) ( not ( = ?auto_243479 ?auto_243480 ) ) ( not ( = ?auto_243479 ?auto_243481 ) ) ( not ( = ?auto_243479 ?auto_243482 ) ) ( not ( = ?auto_243479 ?auto_243483 ) ) ( not ( = ?auto_243479 ?auto_243484 ) ) ( not ( = ?auto_243479 ?auto_243485 ) ) ( not ( = ?auto_243480 ?auto_243481 ) ) ( not ( = ?auto_243480 ?auto_243482 ) ) ( not ( = ?auto_243480 ?auto_243483 ) ) ( not ( = ?auto_243480 ?auto_243484 ) ) ( not ( = ?auto_243480 ?auto_243485 ) ) ( not ( = ?auto_243481 ?auto_243482 ) ) ( not ( = ?auto_243481 ?auto_243483 ) ) ( not ( = ?auto_243481 ?auto_243484 ) ) ( not ( = ?auto_243481 ?auto_243485 ) ) ( not ( = ?auto_243482 ?auto_243483 ) ) ( not ( = ?auto_243482 ?auto_243484 ) ) ( not ( = ?auto_243482 ?auto_243485 ) ) ( not ( = ?auto_243483 ?auto_243484 ) ) ( not ( = ?auto_243483 ?auto_243485 ) ) ( not ( = ?auto_243484 ?auto_243485 ) ) ( ON ?auto_243484 ?auto_243485 ) ( ON ?auto_243483 ?auto_243484 ) ( ON ?auto_243482 ?auto_243483 ) ( ON ?auto_243481 ?auto_243482 ) ( ON ?auto_243480 ?auto_243481 ) ( ON ?auto_243479 ?auto_243480 ) ( ON ?auto_243478 ?auto_243479 ) ( ON ?auto_243477 ?auto_243478 ) ( CLEAR ?auto_243475 ) ( ON ?auto_243476 ?auto_243477 ) ( CLEAR ?auto_243476 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_243473 ?auto_243474 ?auto_243475 ?auto_243476 )
      ( MAKE-13PILE ?auto_243473 ?auto_243474 ?auto_243475 ?auto_243476 ?auto_243477 ?auto_243478 ?auto_243479 ?auto_243480 ?auto_243481 ?auto_243482 ?auto_243483 ?auto_243484 ?auto_243485 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_243499 - BLOCK
      ?auto_243500 - BLOCK
      ?auto_243501 - BLOCK
      ?auto_243502 - BLOCK
      ?auto_243503 - BLOCK
      ?auto_243504 - BLOCK
      ?auto_243505 - BLOCK
      ?auto_243506 - BLOCK
      ?auto_243507 - BLOCK
      ?auto_243508 - BLOCK
      ?auto_243509 - BLOCK
      ?auto_243510 - BLOCK
      ?auto_243511 - BLOCK
    )
    :vars
    (
      ?auto_243512 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_243511 ?auto_243512 ) ( ON-TABLE ?auto_243499 ) ( ON ?auto_243500 ?auto_243499 ) ( not ( = ?auto_243499 ?auto_243500 ) ) ( not ( = ?auto_243499 ?auto_243501 ) ) ( not ( = ?auto_243499 ?auto_243502 ) ) ( not ( = ?auto_243499 ?auto_243503 ) ) ( not ( = ?auto_243499 ?auto_243504 ) ) ( not ( = ?auto_243499 ?auto_243505 ) ) ( not ( = ?auto_243499 ?auto_243506 ) ) ( not ( = ?auto_243499 ?auto_243507 ) ) ( not ( = ?auto_243499 ?auto_243508 ) ) ( not ( = ?auto_243499 ?auto_243509 ) ) ( not ( = ?auto_243499 ?auto_243510 ) ) ( not ( = ?auto_243499 ?auto_243511 ) ) ( not ( = ?auto_243499 ?auto_243512 ) ) ( not ( = ?auto_243500 ?auto_243501 ) ) ( not ( = ?auto_243500 ?auto_243502 ) ) ( not ( = ?auto_243500 ?auto_243503 ) ) ( not ( = ?auto_243500 ?auto_243504 ) ) ( not ( = ?auto_243500 ?auto_243505 ) ) ( not ( = ?auto_243500 ?auto_243506 ) ) ( not ( = ?auto_243500 ?auto_243507 ) ) ( not ( = ?auto_243500 ?auto_243508 ) ) ( not ( = ?auto_243500 ?auto_243509 ) ) ( not ( = ?auto_243500 ?auto_243510 ) ) ( not ( = ?auto_243500 ?auto_243511 ) ) ( not ( = ?auto_243500 ?auto_243512 ) ) ( not ( = ?auto_243501 ?auto_243502 ) ) ( not ( = ?auto_243501 ?auto_243503 ) ) ( not ( = ?auto_243501 ?auto_243504 ) ) ( not ( = ?auto_243501 ?auto_243505 ) ) ( not ( = ?auto_243501 ?auto_243506 ) ) ( not ( = ?auto_243501 ?auto_243507 ) ) ( not ( = ?auto_243501 ?auto_243508 ) ) ( not ( = ?auto_243501 ?auto_243509 ) ) ( not ( = ?auto_243501 ?auto_243510 ) ) ( not ( = ?auto_243501 ?auto_243511 ) ) ( not ( = ?auto_243501 ?auto_243512 ) ) ( not ( = ?auto_243502 ?auto_243503 ) ) ( not ( = ?auto_243502 ?auto_243504 ) ) ( not ( = ?auto_243502 ?auto_243505 ) ) ( not ( = ?auto_243502 ?auto_243506 ) ) ( not ( = ?auto_243502 ?auto_243507 ) ) ( not ( = ?auto_243502 ?auto_243508 ) ) ( not ( = ?auto_243502 ?auto_243509 ) ) ( not ( = ?auto_243502 ?auto_243510 ) ) ( not ( = ?auto_243502 ?auto_243511 ) ) ( not ( = ?auto_243502 ?auto_243512 ) ) ( not ( = ?auto_243503 ?auto_243504 ) ) ( not ( = ?auto_243503 ?auto_243505 ) ) ( not ( = ?auto_243503 ?auto_243506 ) ) ( not ( = ?auto_243503 ?auto_243507 ) ) ( not ( = ?auto_243503 ?auto_243508 ) ) ( not ( = ?auto_243503 ?auto_243509 ) ) ( not ( = ?auto_243503 ?auto_243510 ) ) ( not ( = ?auto_243503 ?auto_243511 ) ) ( not ( = ?auto_243503 ?auto_243512 ) ) ( not ( = ?auto_243504 ?auto_243505 ) ) ( not ( = ?auto_243504 ?auto_243506 ) ) ( not ( = ?auto_243504 ?auto_243507 ) ) ( not ( = ?auto_243504 ?auto_243508 ) ) ( not ( = ?auto_243504 ?auto_243509 ) ) ( not ( = ?auto_243504 ?auto_243510 ) ) ( not ( = ?auto_243504 ?auto_243511 ) ) ( not ( = ?auto_243504 ?auto_243512 ) ) ( not ( = ?auto_243505 ?auto_243506 ) ) ( not ( = ?auto_243505 ?auto_243507 ) ) ( not ( = ?auto_243505 ?auto_243508 ) ) ( not ( = ?auto_243505 ?auto_243509 ) ) ( not ( = ?auto_243505 ?auto_243510 ) ) ( not ( = ?auto_243505 ?auto_243511 ) ) ( not ( = ?auto_243505 ?auto_243512 ) ) ( not ( = ?auto_243506 ?auto_243507 ) ) ( not ( = ?auto_243506 ?auto_243508 ) ) ( not ( = ?auto_243506 ?auto_243509 ) ) ( not ( = ?auto_243506 ?auto_243510 ) ) ( not ( = ?auto_243506 ?auto_243511 ) ) ( not ( = ?auto_243506 ?auto_243512 ) ) ( not ( = ?auto_243507 ?auto_243508 ) ) ( not ( = ?auto_243507 ?auto_243509 ) ) ( not ( = ?auto_243507 ?auto_243510 ) ) ( not ( = ?auto_243507 ?auto_243511 ) ) ( not ( = ?auto_243507 ?auto_243512 ) ) ( not ( = ?auto_243508 ?auto_243509 ) ) ( not ( = ?auto_243508 ?auto_243510 ) ) ( not ( = ?auto_243508 ?auto_243511 ) ) ( not ( = ?auto_243508 ?auto_243512 ) ) ( not ( = ?auto_243509 ?auto_243510 ) ) ( not ( = ?auto_243509 ?auto_243511 ) ) ( not ( = ?auto_243509 ?auto_243512 ) ) ( not ( = ?auto_243510 ?auto_243511 ) ) ( not ( = ?auto_243510 ?auto_243512 ) ) ( not ( = ?auto_243511 ?auto_243512 ) ) ( ON ?auto_243510 ?auto_243511 ) ( ON ?auto_243509 ?auto_243510 ) ( ON ?auto_243508 ?auto_243509 ) ( ON ?auto_243507 ?auto_243508 ) ( ON ?auto_243506 ?auto_243507 ) ( ON ?auto_243505 ?auto_243506 ) ( ON ?auto_243504 ?auto_243505 ) ( ON ?auto_243503 ?auto_243504 ) ( ON ?auto_243502 ?auto_243503 ) ( CLEAR ?auto_243500 ) ( ON ?auto_243501 ?auto_243502 ) ( CLEAR ?auto_243501 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_243499 ?auto_243500 ?auto_243501 )
      ( MAKE-13PILE ?auto_243499 ?auto_243500 ?auto_243501 ?auto_243502 ?auto_243503 ?auto_243504 ?auto_243505 ?auto_243506 ?auto_243507 ?auto_243508 ?auto_243509 ?auto_243510 ?auto_243511 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_243526 - BLOCK
      ?auto_243527 - BLOCK
      ?auto_243528 - BLOCK
      ?auto_243529 - BLOCK
      ?auto_243530 - BLOCK
      ?auto_243531 - BLOCK
      ?auto_243532 - BLOCK
      ?auto_243533 - BLOCK
      ?auto_243534 - BLOCK
      ?auto_243535 - BLOCK
      ?auto_243536 - BLOCK
      ?auto_243537 - BLOCK
      ?auto_243538 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_243538 ) ( ON-TABLE ?auto_243526 ) ( ON ?auto_243527 ?auto_243526 ) ( not ( = ?auto_243526 ?auto_243527 ) ) ( not ( = ?auto_243526 ?auto_243528 ) ) ( not ( = ?auto_243526 ?auto_243529 ) ) ( not ( = ?auto_243526 ?auto_243530 ) ) ( not ( = ?auto_243526 ?auto_243531 ) ) ( not ( = ?auto_243526 ?auto_243532 ) ) ( not ( = ?auto_243526 ?auto_243533 ) ) ( not ( = ?auto_243526 ?auto_243534 ) ) ( not ( = ?auto_243526 ?auto_243535 ) ) ( not ( = ?auto_243526 ?auto_243536 ) ) ( not ( = ?auto_243526 ?auto_243537 ) ) ( not ( = ?auto_243526 ?auto_243538 ) ) ( not ( = ?auto_243527 ?auto_243528 ) ) ( not ( = ?auto_243527 ?auto_243529 ) ) ( not ( = ?auto_243527 ?auto_243530 ) ) ( not ( = ?auto_243527 ?auto_243531 ) ) ( not ( = ?auto_243527 ?auto_243532 ) ) ( not ( = ?auto_243527 ?auto_243533 ) ) ( not ( = ?auto_243527 ?auto_243534 ) ) ( not ( = ?auto_243527 ?auto_243535 ) ) ( not ( = ?auto_243527 ?auto_243536 ) ) ( not ( = ?auto_243527 ?auto_243537 ) ) ( not ( = ?auto_243527 ?auto_243538 ) ) ( not ( = ?auto_243528 ?auto_243529 ) ) ( not ( = ?auto_243528 ?auto_243530 ) ) ( not ( = ?auto_243528 ?auto_243531 ) ) ( not ( = ?auto_243528 ?auto_243532 ) ) ( not ( = ?auto_243528 ?auto_243533 ) ) ( not ( = ?auto_243528 ?auto_243534 ) ) ( not ( = ?auto_243528 ?auto_243535 ) ) ( not ( = ?auto_243528 ?auto_243536 ) ) ( not ( = ?auto_243528 ?auto_243537 ) ) ( not ( = ?auto_243528 ?auto_243538 ) ) ( not ( = ?auto_243529 ?auto_243530 ) ) ( not ( = ?auto_243529 ?auto_243531 ) ) ( not ( = ?auto_243529 ?auto_243532 ) ) ( not ( = ?auto_243529 ?auto_243533 ) ) ( not ( = ?auto_243529 ?auto_243534 ) ) ( not ( = ?auto_243529 ?auto_243535 ) ) ( not ( = ?auto_243529 ?auto_243536 ) ) ( not ( = ?auto_243529 ?auto_243537 ) ) ( not ( = ?auto_243529 ?auto_243538 ) ) ( not ( = ?auto_243530 ?auto_243531 ) ) ( not ( = ?auto_243530 ?auto_243532 ) ) ( not ( = ?auto_243530 ?auto_243533 ) ) ( not ( = ?auto_243530 ?auto_243534 ) ) ( not ( = ?auto_243530 ?auto_243535 ) ) ( not ( = ?auto_243530 ?auto_243536 ) ) ( not ( = ?auto_243530 ?auto_243537 ) ) ( not ( = ?auto_243530 ?auto_243538 ) ) ( not ( = ?auto_243531 ?auto_243532 ) ) ( not ( = ?auto_243531 ?auto_243533 ) ) ( not ( = ?auto_243531 ?auto_243534 ) ) ( not ( = ?auto_243531 ?auto_243535 ) ) ( not ( = ?auto_243531 ?auto_243536 ) ) ( not ( = ?auto_243531 ?auto_243537 ) ) ( not ( = ?auto_243531 ?auto_243538 ) ) ( not ( = ?auto_243532 ?auto_243533 ) ) ( not ( = ?auto_243532 ?auto_243534 ) ) ( not ( = ?auto_243532 ?auto_243535 ) ) ( not ( = ?auto_243532 ?auto_243536 ) ) ( not ( = ?auto_243532 ?auto_243537 ) ) ( not ( = ?auto_243532 ?auto_243538 ) ) ( not ( = ?auto_243533 ?auto_243534 ) ) ( not ( = ?auto_243533 ?auto_243535 ) ) ( not ( = ?auto_243533 ?auto_243536 ) ) ( not ( = ?auto_243533 ?auto_243537 ) ) ( not ( = ?auto_243533 ?auto_243538 ) ) ( not ( = ?auto_243534 ?auto_243535 ) ) ( not ( = ?auto_243534 ?auto_243536 ) ) ( not ( = ?auto_243534 ?auto_243537 ) ) ( not ( = ?auto_243534 ?auto_243538 ) ) ( not ( = ?auto_243535 ?auto_243536 ) ) ( not ( = ?auto_243535 ?auto_243537 ) ) ( not ( = ?auto_243535 ?auto_243538 ) ) ( not ( = ?auto_243536 ?auto_243537 ) ) ( not ( = ?auto_243536 ?auto_243538 ) ) ( not ( = ?auto_243537 ?auto_243538 ) ) ( ON ?auto_243537 ?auto_243538 ) ( ON ?auto_243536 ?auto_243537 ) ( ON ?auto_243535 ?auto_243536 ) ( ON ?auto_243534 ?auto_243535 ) ( ON ?auto_243533 ?auto_243534 ) ( ON ?auto_243532 ?auto_243533 ) ( ON ?auto_243531 ?auto_243532 ) ( ON ?auto_243530 ?auto_243531 ) ( ON ?auto_243529 ?auto_243530 ) ( CLEAR ?auto_243527 ) ( ON ?auto_243528 ?auto_243529 ) ( CLEAR ?auto_243528 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_243526 ?auto_243527 ?auto_243528 )
      ( MAKE-13PILE ?auto_243526 ?auto_243527 ?auto_243528 ?auto_243529 ?auto_243530 ?auto_243531 ?auto_243532 ?auto_243533 ?auto_243534 ?auto_243535 ?auto_243536 ?auto_243537 ?auto_243538 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_243552 - BLOCK
      ?auto_243553 - BLOCK
      ?auto_243554 - BLOCK
      ?auto_243555 - BLOCK
      ?auto_243556 - BLOCK
      ?auto_243557 - BLOCK
      ?auto_243558 - BLOCK
      ?auto_243559 - BLOCK
      ?auto_243560 - BLOCK
      ?auto_243561 - BLOCK
      ?auto_243562 - BLOCK
      ?auto_243563 - BLOCK
      ?auto_243564 - BLOCK
    )
    :vars
    (
      ?auto_243565 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_243564 ?auto_243565 ) ( ON-TABLE ?auto_243552 ) ( not ( = ?auto_243552 ?auto_243553 ) ) ( not ( = ?auto_243552 ?auto_243554 ) ) ( not ( = ?auto_243552 ?auto_243555 ) ) ( not ( = ?auto_243552 ?auto_243556 ) ) ( not ( = ?auto_243552 ?auto_243557 ) ) ( not ( = ?auto_243552 ?auto_243558 ) ) ( not ( = ?auto_243552 ?auto_243559 ) ) ( not ( = ?auto_243552 ?auto_243560 ) ) ( not ( = ?auto_243552 ?auto_243561 ) ) ( not ( = ?auto_243552 ?auto_243562 ) ) ( not ( = ?auto_243552 ?auto_243563 ) ) ( not ( = ?auto_243552 ?auto_243564 ) ) ( not ( = ?auto_243552 ?auto_243565 ) ) ( not ( = ?auto_243553 ?auto_243554 ) ) ( not ( = ?auto_243553 ?auto_243555 ) ) ( not ( = ?auto_243553 ?auto_243556 ) ) ( not ( = ?auto_243553 ?auto_243557 ) ) ( not ( = ?auto_243553 ?auto_243558 ) ) ( not ( = ?auto_243553 ?auto_243559 ) ) ( not ( = ?auto_243553 ?auto_243560 ) ) ( not ( = ?auto_243553 ?auto_243561 ) ) ( not ( = ?auto_243553 ?auto_243562 ) ) ( not ( = ?auto_243553 ?auto_243563 ) ) ( not ( = ?auto_243553 ?auto_243564 ) ) ( not ( = ?auto_243553 ?auto_243565 ) ) ( not ( = ?auto_243554 ?auto_243555 ) ) ( not ( = ?auto_243554 ?auto_243556 ) ) ( not ( = ?auto_243554 ?auto_243557 ) ) ( not ( = ?auto_243554 ?auto_243558 ) ) ( not ( = ?auto_243554 ?auto_243559 ) ) ( not ( = ?auto_243554 ?auto_243560 ) ) ( not ( = ?auto_243554 ?auto_243561 ) ) ( not ( = ?auto_243554 ?auto_243562 ) ) ( not ( = ?auto_243554 ?auto_243563 ) ) ( not ( = ?auto_243554 ?auto_243564 ) ) ( not ( = ?auto_243554 ?auto_243565 ) ) ( not ( = ?auto_243555 ?auto_243556 ) ) ( not ( = ?auto_243555 ?auto_243557 ) ) ( not ( = ?auto_243555 ?auto_243558 ) ) ( not ( = ?auto_243555 ?auto_243559 ) ) ( not ( = ?auto_243555 ?auto_243560 ) ) ( not ( = ?auto_243555 ?auto_243561 ) ) ( not ( = ?auto_243555 ?auto_243562 ) ) ( not ( = ?auto_243555 ?auto_243563 ) ) ( not ( = ?auto_243555 ?auto_243564 ) ) ( not ( = ?auto_243555 ?auto_243565 ) ) ( not ( = ?auto_243556 ?auto_243557 ) ) ( not ( = ?auto_243556 ?auto_243558 ) ) ( not ( = ?auto_243556 ?auto_243559 ) ) ( not ( = ?auto_243556 ?auto_243560 ) ) ( not ( = ?auto_243556 ?auto_243561 ) ) ( not ( = ?auto_243556 ?auto_243562 ) ) ( not ( = ?auto_243556 ?auto_243563 ) ) ( not ( = ?auto_243556 ?auto_243564 ) ) ( not ( = ?auto_243556 ?auto_243565 ) ) ( not ( = ?auto_243557 ?auto_243558 ) ) ( not ( = ?auto_243557 ?auto_243559 ) ) ( not ( = ?auto_243557 ?auto_243560 ) ) ( not ( = ?auto_243557 ?auto_243561 ) ) ( not ( = ?auto_243557 ?auto_243562 ) ) ( not ( = ?auto_243557 ?auto_243563 ) ) ( not ( = ?auto_243557 ?auto_243564 ) ) ( not ( = ?auto_243557 ?auto_243565 ) ) ( not ( = ?auto_243558 ?auto_243559 ) ) ( not ( = ?auto_243558 ?auto_243560 ) ) ( not ( = ?auto_243558 ?auto_243561 ) ) ( not ( = ?auto_243558 ?auto_243562 ) ) ( not ( = ?auto_243558 ?auto_243563 ) ) ( not ( = ?auto_243558 ?auto_243564 ) ) ( not ( = ?auto_243558 ?auto_243565 ) ) ( not ( = ?auto_243559 ?auto_243560 ) ) ( not ( = ?auto_243559 ?auto_243561 ) ) ( not ( = ?auto_243559 ?auto_243562 ) ) ( not ( = ?auto_243559 ?auto_243563 ) ) ( not ( = ?auto_243559 ?auto_243564 ) ) ( not ( = ?auto_243559 ?auto_243565 ) ) ( not ( = ?auto_243560 ?auto_243561 ) ) ( not ( = ?auto_243560 ?auto_243562 ) ) ( not ( = ?auto_243560 ?auto_243563 ) ) ( not ( = ?auto_243560 ?auto_243564 ) ) ( not ( = ?auto_243560 ?auto_243565 ) ) ( not ( = ?auto_243561 ?auto_243562 ) ) ( not ( = ?auto_243561 ?auto_243563 ) ) ( not ( = ?auto_243561 ?auto_243564 ) ) ( not ( = ?auto_243561 ?auto_243565 ) ) ( not ( = ?auto_243562 ?auto_243563 ) ) ( not ( = ?auto_243562 ?auto_243564 ) ) ( not ( = ?auto_243562 ?auto_243565 ) ) ( not ( = ?auto_243563 ?auto_243564 ) ) ( not ( = ?auto_243563 ?auto_243565 ) ) ( not ( = ?auto_243564 ?auto_243565 ) ) ( ON ?auto_243563 ?auto_243564 ) ( ON ?auto_243562 ?auto_243563 ) ( ON ?auto_243561 ?auto_243562 ) ( ON ?auto_243560 ?auto_243561 ) ( ON ?auto_243559 ?auto_243560 ) ( ON ?auto_243558 ?auto_243559 ) ( ON ?auto_243557 ?auto_243558 ) ( ON ?auto_243556 ?auto_243557 ) ( ON ?auto_243555 ?auto_243556 ) ( ON ?auto_243554 ?auto_243555 ) ( CLEAR ?auto_243552 ) ( ON ?auto_243553 ?auto_243554 ) ( CLEAR ?auto_243553 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_243552 ?auto_243553 )
      ( MAKE-13PILE ?auto_243552 ?auto_243553 ?auto_243554 ?auto_243555 ?auto_243556 ?auto_243557 ?auto_243558 ?auto_243559 ?auto_243560 ?auto_243561 ?auto_243562 ?auto_243563 ?auto_243564 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_243579 - BLOCK
      ?auto_243580 - BLOCK
      ?auto_243581 - BLOCK
      ?auto_243582 - BLOCK
      ?auto_243583 - BLOCK
      ?auto_243584 - BLOCK
      ?auto_243585 - BLOCK
      ?auto_243586 - BLOCK
      ?auto_243587 - BLOCK
      ?auto_243588 - BLOCK
      ?auto_243589 - BLOCK
      ?auto_243590 - BLOCK
      ?auto_243591 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_243591 ) ( ON-TABLE ?auto_243579 ) ( not ( = ?auto_243579 ?auto_243580 ) ) ( not ( = ?auto_243579 ?auto_243581 ) ) ( not ( = ?auto_243579 ?auto_243582 ) ) ( not ( = ?auto_243579 ?auto_243583 ) ) ( not ( = ?auto_243579 ?auto_243584 ) ) ( not ( = ?auto_243579 ?auto_243585 ) ) ( not ( = ?auto_243579 ?auto_243586 ) ) ( not ( = ?auto_243579 ?auto_243587 ) ) ( not ( = ?auto_243579 ?auto_243588 ) ) ( not ( = ?auto_243579 ?auto_243589 ) ) ( not ( = ?auto_243579 ?auto_243590 ) ) ( not ( = ?auto_243579 ?auto_243591 ) ) ( not ( = ?auto_243580 ?auto_243581 ) ) ( not ( = ?auto_243580 ?auto_243582 ) ) ( not ( = ?auto_243580 ?auto_243583 ) ) ( not ( = ?auto_243580 ?auto_243584 ) ) ( not ( = ?auto_243580 ?auto_243585 ) ) ( not ( = ?auto_243580 ?auto_243586 ) ) ( not ( = ?auto_243580 ?auto_243587 ) ) ( not ( = ?auto_243580 ?auto_243588 ) ) ( not ( = ?auto_243580 ?auto_243589 ) ) ( not ( = ?auto_243580 ?auto_243590 ) ) ( not ( = ?auto_243580 ?auto_243591 ) ) ( not ( = ?auto_243581 ?auto_243582 ) ) ( not ( = ?auto_243581 ?auto_243583 ) ) ( not ( = ?auto_243581 ?auto_243584 ) ) ( not ( = ?auto_243581 ?auto_243585 ) ) ( not ( = ?auto_243581 ?auto_243586 ) ) ( not ( = ?auto_243581 ?auto_243587 ) ) ( not ( = ?auto_243581 ?auto_243588 ) ) ( not ( = ?auto_243581 ?auto_243589 ) ) ( not ( = ?auto_243581 ?auto_243590 ) ) ( not ( = ?auto_243581 ?auto_243591 ) ) ( not ( = ?auto_243582 ?auto_243583 ) ) ( not ( = ?auto_243582 ?auto_243584 ) ) ( not ( = ?auto_243582 ?auto_243585 ) ) ( not ( = ?auto_243582 ?auto_243586 ) ) ( not ( = ?auto_243582 ?auto_243587 ) ) ( not ( = ?auto_243582 ?auto_243588 ) ) ( not ( = ?auto_243582 ?auto_243589 ) ) ( not ( = ?auto_243582 ?auto_243590 ) ) ( not ( = ?auto_243582 ?auto_243591 ) ) ( not ( = ?auto_243583 ?auto_243584 ) ) ( not ( = ?auto_243583 ?auto_243585 ) ) ( not ( = ?auto_243583 ?auto_243586 ) ) ( not ( = ?auto_243583 ?auto_243587 ) ) ( not ( = ?auto_243583 ?auto_243588 ) ) ( not ( = ?auto_243583 ?auto_243589 ) ) ( not ( = ?auto_243583 ?auto_243590 ) ) ( not ( = ?auto_243583 ?auto_243591 ) ) ( not ( = ?auto_243584 ?auto_243585 ) ) ( not ( = ?auto_243584 ?auto_243586 ) ) ( not ( = ?auto_243584 ?auto_243587 ) ) ( not ( = ?auto_243584 ?auto_243588 ) ) ( not ( = ?auto_243584 ?auto_243589 ) ) ( not ( = ?auto_243584 ?auto_243590 ) ) ( not ( = ?auto_243584 ?auto_243591 ) ) ( not ( = ?auto_243585 ?auto_243586 ) ) ( not ( = ?auto_243585 ?auto_243587 ) ) ( not ( = ?auto_243585 ?auto_243588 ) ) ( not ( = ?auto_243585 ?auto_243589 ) ) ( not ( = ?auto_243585 ?auto_243590 ) ) ( not ( = ?auto_243585 ?auto_243591 ) ) ( not ( = ?auto_243586 ?auto_243587 ) ) ( not ( = ?auto_243586 ?auto_243588 ) ) ( not ( = ?auto_243586 ?auto_243589 ) ) ( not ( = ?auto_243586 ?auto_243590 ) ) ( not ( = ?auto_243586 ?auto_243591 ) ) ( not ( = ?auto_243587 ?auto_243588 ) ) ( not ( = ?auto_243587 ?auto_243589 ) ) ( not ( = ?auto_243587 ?auto_243590 ) ) ( not ( = ?auto_243587 ?auto_243591 ) ) ( not ( = ?auto_243588 ?auto_243589 ) ) ( not ( = ?auto_243588 ?auto_243590 ) ) ( not ( = ?auto_243588 ?auto_243591 ) ) ( not ( = ?auto_243589 ?auto_243590 ) ) ( not ( = ?auto_243589 ?auto_243591 ) ) ( not ( = ?auto_243590 ?auto_243591 ) ) ( ON ?auto_243590 ?auto_243591 ) ( ON ?auto_243589 ?auto_243590 ) ( ON ?auto_243588 ?auto_243589 ) ( ON ?auto_243587 ?auto_243588 ) ( ON ?auto_243586 ?auto_243587 ) ( ON ?auto_243585 ?auto_243586 ) ( ON ?auto_243584 ?auto_243585 ) ( ON ?auto_243583 ?auto_243584 ) ( ON ?auto_243582 ?auto_243583 ) ( ON ?auto_243581 ?auto_243582 ) ( CLEAR ?auto_243579 ) ( ON ?auto_243580 ?auto_243581 ) ( CLEAR ?auto_243580 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_243579 ?auto_243580 )
      ( MAKE-13PILE ?auto_243579 ?auto_243580 ?auto_243581 ?auto_243582 ?auto_243583 ?auto_243584 ?auto_243585 ?auto_243586 ?auto_243587 ?auto_243588 ?auto_243589 ?auto_243590 ?auto_243591 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_243605 - BLOCK
      ?auto_243606 - BLOCK
      ?auto_243607 - BLOCK
      ?auto_243608 - BLOCK
      ?auto_243609 - BLOCK
      ?auto_243610 - BLOCK
      ?auto_243611 - BLOCK
      ?auto_243612 - BLOCK
      ?auto_243613 - BLOCK
      ?auto_243614 - BLOCK
      ?auto_243615 - BLOCK
      ?auto_243616 - BLOCK
      ?auto_243617 - BLOCK
    )
    :vars
    (
      ?auto_243618 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_243617 ?auto_243618 ) ( not ( = ?auto_243605 ?auto_243606 ) ) ( not ( = ?auto_243605 ?auto_243607 ) ) ( not ( = ?auto_243605 ?auto_243608 ) ) ( not ( = ?auto_243605 ?auto_243609 ) ) ( not ( = ?auto_243605 ?auto_243610 ) ) ( not ( = ?auto_243605 ?auto_243611 ) ) ( not ( = ?auto_243605 ?auto_243612 ) ) ( not ( = ?auto_243605 ?auto_243613 ) ) ( not ( = ?auto_243605 ?auto_243614 ) ) ( not ( = ?auto_243605 ?auto_243615 ) ) ( not ( = ?auto_243605 ?auto_243616 ) ) ( not ( = ?auto_243605 ?auto_243617 ) ) ( not ( = ?auto_243605 ?auto_243618 ) ) ( not ( = ?auto_243606 ?auto_243607 ) ) ( not ( = ?auto_243606 ?auto_243608 ) ) ( not ( = ?auto_243606 ?auto_243609 ) ) ( not ( = ?auto_243606 ?auto_243610 ) ) ( not ( = ?auto_243606 ?auto_243611 ) ) ( not ( = ?auto_243606 ?auto_243612 ) ) ( not ( = ?auto_243606 ?auto_243613 ) ) ( not ( = ?auto_243606 ?auto_243614 ) ) ( not ( = ?auto_243606 ?auto_243615 ) ) ( not ( = ?auto_243606 ?auto_243616 ) ) ( not ( = ?auto_243606 ?auto_243617 ) ) ( not ( = ?auto_243606 ?auto_243618 ) ) ( not ( = ?auto_243607 ?auto_243608 ) ) ( not ( = ?auto_243607 ?auto_243609 ) ) ( not ( = ?auto_243607 ?auto_243610 ) ) ( not ( = ?auto_243607 ?auto_243611 ) ) ( not ( = ?auto_243607 ?auto_243612 ) ) ( not ( = ?auto_243607 ?auto_243613 ) ) ( not ( = ?auto_243607 ?auto_243614 ) ) ( not ( = ?auto_243607 ?auto_243615 ) ) ( not ( = ?auto_243607 ?auto_243616 ) ) ( not ( = ?auto_243607 ?auto_243617 ) ) ( not ( = ?auto_243607 ?auto_243618 ) ) ( not ( = ?auto_243608 ?auto_243609 ) ) ( not ( = ?auto_243608 ?auto_243610 ) ) ( not ( = ?auto_243608 ?auto_243611 ) ) ( not ( = ?auto_243608 ?auto_243612 ) ) ( not ( = ?auto_243608 ?auto_243613 ) ) ( not ( = ?auto_243608 ?auto_243614 ) ) ( not ( = ?auto_243608 ?auto_243615 ) ) ( not ( = ?auto_243608 ?auto_243616 ) ) ( not ( = ?auto_243608 ?auto_243617 ) ) ( not ( = ?auto_243608 ?auto_243618 ) ) ( not ( = ?auto_243609 ?auto_243610 ) ) ( not ( = ?auto_243609 ?auto_243611 ) ) ( not ( = ?auto_243609 ?auto_243612 ) ) ( not ( = ?auto_243609 ?auto_243613 ) ) ( not ( = ?auto_243609 ?auto_243614 ) ) ( not ( = ?auto_243609 ?auto_243615 ) ) ( not ( = ?auto_243609 ?auto_243616 ) ) ( not ( = ?auto_243609 ?auto_243617 ) ) ( not ( = ?auto_243609 ?auto_243618 ) ) ( not ( = ?auto_243610 ?auto_243611 ) ) ( not ( = ?auto_243610 ?auto_243612 ) ) ( not ( = ?auto_243610 ?auto_243613 ) ) ( not ( = ?auto_243610 ?auto_243614 ) ) ( not ( = ?auto_243610 ?auto_243615 ) ) ( not ( = ?auto_243610 ?auto_243616 ) ) ( not ( = ?auto_243610 ?auto_243617 ) ) ( not ( = ?auto_243610 ?auto_243618 ) ) ( not ( = ?auto_243611 ?auto_243612 ) ) ( not ( = ?auto_243611 ?auto_243613 ) ) ( not ( = ?auto_243611 ?auto_243614 ) ) ( not ( = ?auto_243611 ?auto_243615 ) ) ( not ( = ?auto_243611 ?auto_243616 ) ) ( not ( = ?auto_243611 ?auto_243617 ) ) ( not ( = ?auto_243611 ?auto_243618 ) ) ( not ( = ?auto_243612 ?auto_243613 ) ) ( not ( = ?auto_243612 ?auto_243614 ) ) ( not ( = ?auto_243612 ?auto_243615 ) ) ( not ( = ?auto_243612 ?auto_243616 ) ) ( not ( = ?auto_243612 ?auto_243617 ) ) ( not ( = ?auto_243612 ?auto_243618 ) ) ( not ( = ?auto_243613 ?auto_243614 ) ) ( not ( = ?auto_243613 ?auto_243615 ) ) ( not ( = ?auto_243613 ?auto_243616 ) ) ( not ( = ?auto_243613 ?auto_243617 ) ) ( not ( = ?auto_243613 ?auto_243618 ) ) ( not ( = ?auto_243614 ?auto_243615 ) ) ( not ( = ?auto_243614 ?auto_243616 ) ) ( not ( = ?auto_243614 ?auto_243617 ) ) ( not ( = ?auto_243614 ?auto_243618 ) ) ( not ( = ?auto_243615 ?auto_243616 ) ) ( not ( = ?auto_243615 ?auto_243617 ) ) ( not ( = ?auto_243615 ?auto_243618 ) ) ( not ( = ?auto_243616 ?auto_243617 ) ) ( not ( = ?auto_243616 ?auto_243618 ) ) ( not ( = ?auto_243617 ?auto_243618 ) ) ( ON ?auto_243616 ?auto_243617 ) ( ON ?auto_243615 ?auto_243616 ) ( ON ?auto_243614 ?auto_243615 ) ( ON ?auto_243613 ?auto_243614 ) ( ON ?auto_243612 ?auto_243613 ) ( ON ?auto_243611 ?auto_243612 ) ( ON ?auto_243610 ?auto_243611 ) ( ON ?auto_243609 ?auto_243610 ) ( ON ?auto_243608 ?auto_243609 ) ( ON ?auto_243607 ?auto_243608 ) ( ON ?auto_243606 ?auto_243607 ) ( ON ?auto_243605 ?auto_243606 ) ( CLEAR ?auto_243605 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_243605 )
      ( MAKE-13PILE ?auto_243605 ?auto_243606 ?auto_243607 ?auto_243608 ?auto_243609 ?auto_243610 ?auto_243611 ?auto_243612 ?auto_243613 ?auto_243614 ?auto_243615 ?auto_243616 ?auto_243617 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_243632 - BLOCK
      ?auto_243633 - BLOCK
      ?auto_243634 - BLOCK
      ?auto_243635 - BLOCK
      ?auto_243636 - BLOCK
      ?auto_243637 - BLOCK
      ?auto_243638 - BLOCK
      ?auto_243639 - BLOCK
      ?auto_243640 - BLOCK
      ?auto_243641 - BLOCK
      ?auto_243642 - BLOCK
      ?auto_243643 - BLOCK
      ?auto_243644 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_243644 ) ( not ( = ?auto_243632 ?auto_243633 ) ) ( not ( = ?auto_243632 ?auto_243634 ) ) ( not ( = ?auto_243632 ?auto_243635 ) ) ( not ( = ?auto_243632 ?auto_243636 ) ) ( not ( = ?auto_243632 ?auto_243637 ) ) ( not ( = ?auto_243632 ?auto_243638 ) ) ( not ( = ?auto_243632 ?auto_243639 ) ) ( not ( = ?auto_243632 ?auto_243640 ) ) ( not ( = ?auto_243632 ?auto_243641 ) ) ( not ( = ?auto_243632 ?auto_243642 ) ) ( not ( = ?auto_243632 ?auto_243643 ) ) ( not ( = ?auto_243632 ?auto_243644 ) ) ( not ( = ?auto_243633 ?auto_243634 ) ) ( not ( = ?auto_243633 ?auto_243635 ) ) ( not ( = ?auto_243633 ?auto_243636 ) ) ( not ( = ?auto_243633 ?auto_243637 ) ) ( not ( = ?auto_243633 ?auto_243638 ) ) ( not ( = ?auto_243633 ?auto_243639 ) ) ( not ( = ?auto_243633 ?auto_243640 ) ) ( not ( = ?auto_243633 ?auto_243641 ) ) ( not ( = ?auto_243633 ?auto_243642 ) ) ( not ( = ?auto_243633 ?auto_243643 ) ) ( not ( = ?auto_243633 ?auto_243644 ) ) ( not ( = ?auto_243634 ?auto_243635 ) ) ( not ( = ?auto_243634 ?auto_243636 ) ) ( not ( = ?auto_243634 ?auto_243637 ) ) ( not ( = ?auto_243634 ?auto_243638 ) ) ( not ( = ?auto_243634 ?auto_243639 ) ) ( not ( = ?auto_243634 ?auto_243640 ) ) ( not ( = ?auto_243634 ?auto_243641 ) ) ( not ( = ?auto_243634 ?auto_243642 ) ) ( not ( = ?auto_243634 ?auto_243643 ) ) ( not ( = ?auto_243634 ?auto_243644 ) ) ( not ( = ?auto_243635 ?auto_243636 ) ) ( not ( = ?auto_243635 ?auto_243637 ) ) ( not ( = ?auto_243635 ?auto_243638 ) ) ( not ( = ?auto_243635 ?auto_243639 ) ) ( not ( = ?auto_243635 ?auto_243640 ) ) ( not ( = ?auto_243635 ?auto_243641 ) ) ( not ( = ?auto_243635 ?auto_243642 ) ) ( not ( = ?auto_243635 ?auto_243643 ) ) ( not ( = ?auto_243635 ?auto_243644 ) ) ( not ( = ?auto_243636 ?auto_243637 ) ) ( not ( = ?auto_243636 ?auto_243638 ) ) ( not ( = ?auto_243636 ?auto_243639 ) ) ( not ( = ?auto_243636 ?auto_243640 ) ) ( not ( = ?auto_243636 ?auto_243641 ) ) ( not ( = ?auto_243636 ?auto_243642 ) ) ( not ( = ?auto_243636 ?auto_243643 ) ) ( not ( = ?auto_243636 ?auto_243644 ) ) ( not ( = ?auto_243637 ?auto_243638 ) ) ( not ( = ?auto_243637 ?auto_243639 ) ) ( not ( = ?auto_243637 ?auto_243640 ) ) ( not ( = ?auto_243637 ?auto_243641 ) ) ( not ( = ?auto_243637 ?auto_243642 ) ) ( not ( = ?auto_243637 ?auto_243643 ) ) ( not ( = ?auto_243637 ?auto_243644 ) ) ( not ( = ?auto_243638 ?auto_243639 ) ) ( not ( = ?auto_243638 ?auto_243640 ) ) ( not ( = ?auto_243638 ?auto_243641 ) ) ( not ( = ?auto_243638 ?auto_243642 ) ) ( not ( = ?auto_243638 ?auto_243643 ) ) ( not ( = ?auto_243638 ?auto_243644 ) ) ( not ( = ?auto_243639 ?auto_243640 ) ) ( not ( = ?auto_243639 ?auto_243641 ) ) ( not ( = ?auto_243639 ?auto_243642 ) ) ( not ( = ?auto_243639 ?auto_243643 ) ) ( not ( = ?auto_243639 ?auto_243644 ) ) ( not ( = ?auto_243640 ?auto_243641 ) ) ( not ( = ?auto_243640 ?auto_243642 ) ) ( not ( = ?auto_243640 ?auto_243643 ) ) ( not ( = ?auto_243640 ?auto_243644 ) ) ( not ( = ?auto_243641 ?auto_243642 ) ) ( not ( = ?auto_243641 ?auto_243643 ) ) ( not ( = ?auto_243641 ?auto_243644 ) ) ( not ( = ?auto_243642 ?auto_243643 ) ) ( not ( = ?auto_243642 ?auto_243644 ) ) ( not ( = ?auto_243643 ?auto_243644 ) ) ( ON ?auto_243643 ?auto_243644 ) ( ON ?auto_243642 ?auto_243643 ) ( ON ?auto_243641 ?auto_243642 ) ( ON ?auto_243640 ?auto_243641 ) ( ON ?auto_243639 ?auto_243640 ) ( ON ?auto_243638 ?auto_243639 ) ( ON ?auto_243637 ?auto_243638 ) ( ON ?auto_243636 ?auto_243637 ) ( ON ?auto_243635 ?auto_243636 ) ( ON ?auto_243634 ?auto_243635 ) ( ON ?auto_243633 ?auto_243634 ) ( ON ?auto_243632 ?auto_243633 ) ( CLEAR ?auto_243632 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_243632 )
      ( MAKE-13PILE ?auto_243632 ?auto_243633 ?auto_243634 ?auto_243635 ?auto_243636 ?auto_243637 ?auto_243638 ?auto_243639 ?auto_243640 ?auto_243641 ?auto_243642 ?auto_243643 ?auto_243644 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_243658 - BLOCK
      ?auto_243659 - BLOCK
      ?auto_243660 - BLOCK
      ?auto_243661 - BLOCK
      ?auto_243662 - BLOCK
      ?auto_243663 - BLOCK
      ?auto_243664 - BLOCK
      ?auto_243665 - BLOCK
      ?auto_243666 - BLOCK
      ?auto_243667 - BLOCK
      ?auto_243668 - BLOCK
      ?auto_243669 - BLOCK
      ?auto_243670 - BLOCK
    )
    :vars
    (
      ?auto_243671 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_243658 ?auto_243659 ) ) ( not ( = ?auto_243658 ?auto_243660 ) ) ( not ( = ?auto_243658 ?auto_243661 ) ) ( not ( = ?auto_243658 ?auto_243662 ) ) ( not ( = ?auto_243658 ?auto_243663 ) ) ( not ( = ?auto_243658 ?auto_243664 ) ) ( not ( = ?auto_243658 ?auto_243665 ) ) ( not ( = ?auto_243658 ?auto_243666 ) ) ( not ( = ?auto_243658 ?auto_243667 ) ) ( not ( = ?auto_243658 ?auto_243668 ) ) ( not ( = ?auto_243658 ?auto_243669 ) ) ( not ( = ?auto_243658 ?auto_243670 ) ) ( not ( = ?auto_243659 ?auto_243660 ) ) ( not ( = ?auto_243659 ?auto_243661 ) ) ( not ( = ?auto_243659 ?auto_243662 ) ) ( not ( = ?auto_243659 ?auto_243663 ) ) ( not ( = ?auto_243659 ?auto_243664 ) ) ( not ( = ?auto_243659 ?auto_243665 ) ) ( not ( = ?auto_243659 ?auto_243666 ) ) ( not ( = ?auto_243659 ?auto_243667 ) ) ( not ( = ?auto_243659 ?auto_243668 ) ) ( not ( = ?auto_243659 ?auto_243669 ) ) ( not ( = ?auto_243659 ?auto_243670 ) ) ( not ( = ?auto_243660 ?auto_243661 ) ) ( not ( = ?auto_243660 ?auto_243662 ) ) ( not ( = ?auto_243660 ?auto_243663 ) ) ( not ( = ?auto_243660 ?auto_243664 ) ) ( not ( = ?auto_243660 ?auto_243665 ) ) ( not ( = ?auto_243660 ?auto_243666 ) ) ( not ( = ?auto_243660 ?auto_243667 ) ) ( not ( = ?auto_243660 ?auto_243668 ) ) ( not ( = ?auto_243660 ?auto_243669 ) ) ( not ( = ?auto_243660 ?auto_243670 ) ) ( not ( = ?auto_243661 ?auto_243662 ) ) ( not ( = ?auto_243661 ?auto_243663 ) ) ( not ( = ?auto_243661 ?auto_243664 ) ) ( not ( = ?auto_243661 ?auto_243665 ) ) ( not ( = ?auto_243661 ?auto_243666 ) ) ( not ( = ?auto_243661 ?auto_243667 ) ) ( not ( = ?auto_243661 ?auto_243668 ) ) ( not ( = ?auto_243661 ?auto_243669 ) ) ( not ( = ?auto_243661 ?auto_243670 ) ) ( not ( = ?auto_243662 ?auto_243663 ) ) ( not ( = ?auto_243662 ?auto_243664 ) ) ( not ( = ?auto_243662 ?auto_243665 ) ) ( not ( = ?auto_243662 ?auto_243666 ) ) ( not ( = ?auto_243662 ?auto_243667 ) ) ( not ( = ?auto_243662 ?auto_243668 ) ) ( not ( = ?auto_243662 ?auto_243669 ) ) ( not ( = ?auto_243662 ?auto_243670 ) ) ( not ( = ?auto_243663 ?auto_243664 ) ) ( not ( = ?auto_243663 ?auto_243665 ) ) ( not ( = ?auto_243663 ?auto_243666 ) ) ( not ( = ?auto_243663 ?auto_243667 ) ) ( not ( = ?auto_243663 ?auto_243668 ) ) ( not ( = ?auto_243663 ?auto_243669 ) ) ( not ( = ?auto_243663 ?auto_243670 ) ) ( not ( = ?auto_243664 ?auto_243665 ) ) ( not ( = ?auto_243664 ?auto_243666 ) ) ( not ( = ?auto_243664 ?auto_243667 ) ) ( not ( = ?auto_243664 ?auto_243668 ) ) ( not ( = ?auto_243664 ?auto_243669 ) ) ( not ( = ?auto_243664 ?auto_243670 ) ) ( not ( = ?auto_243665 ?auto_243666 ) ) ( not ( = ?auto_243665 ?auto_243667 ) ) ( not ( = ?auto_243665 ?auto_243668 ) ) ( not ( = ?auto_243665 ?auto_243669 ) ) ( not ( = ?auto_243665 ?auto_243670 ) ) ( not ( = ?auto_243666 ?auto_243667 ) ) ( not ( = ?auto_243666 ?auto_243668 ) ) ( not ( = ?auto_243666 ?auto_243669 ) ) ( not ( = ?auto_243666 ?auto_243670 ) ) ( not ( = ?auto_243667 ?auto_243668 ) ) ( not ( = ?auto_243667 ?auto_243669 ) ) ( not ( = ?auto_243667 ?auto_243670 ) ) ( not ( = ?auto_243668 ?auto_243669 ) ) ( not ( = ?auto_243668 ?auto_243670 ) ) ( not ( = ?auto_243669 ?auto_243670 ) ) ( ON ?auto_243658 ?auto_243671 ) ( not ( = ?auto_243670 ?auto_243671 ) ) ( not ( = ?auto_243669 ?auto_243671 ) ) ( not ( = ?auto_243668 ?auto_243671 ) ) ( not ( = ?auto_243667 ?auto_243671 ) ) ( not ( = ?auto_243666 ?auto_243671 ) ) ( not ( = ?auto_243665 ?auto_243671 ) ) ( not ( = ?auto_243664 ?auto_243671 ) ) ( not ( = ?auto_243663 ?auto_243671 ) ) ( not ( = ?auto_243662 ?auto_243671 ) ) ( not ( = ?auto_243661 ?auto_243671 ) ) ( not ( = ?auto_243660 ?auto_243671 ) ) ( not ( = ?auto_243659 ?auto_243671 ) ) ( not ( = ?auto_243658 ?auto_243671 ) ) ( ON ?auto_243659 ?auto_243658 ) ( ON ?auto_243660 ?auto_243659 ) ( ON ?auto_243661 ?auto_243660 ) ( ON ?auto_243662 ?auto_243661 ) ( ON ?auto_243663 ?auto_243662 ) ( ON ?auto_243664 ?auto_243663 ) ( ON ?auto_243665 ?auto_243664 ) ( ON ?auto_243666 ?auto_243665 ) ( ON ?auto_243667 ?auto_243666 ) ( ON ?auto_243668 ?auto_243667 ) ( ON ?auto_243669 ?auto_243668 ) ( ON ?auto_243670 ?auto_243669 ) ( CLEAR ?auto_243670 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_243670 ?auto_243669 ?auto_243668 ?auto_243667 ?auto_243666 ?auto_243665 ?auto_243664 ?auto_243663 ?auto_243662 ?auto_243661 ?auto_243660 ?auto_243659 ?auto_243658 )
      ( MAKE-13PILE ?auto_243658 ?auto_243659 ?auto_243660 ?auto_243661 ?auto_243662 ?auto_243663 ?auto_243664 ?auto_243665 ?auto_243666 ?auto_243667 ?auto_243668 ?auto_243669 ?auto_243670 ) )
  )

)

