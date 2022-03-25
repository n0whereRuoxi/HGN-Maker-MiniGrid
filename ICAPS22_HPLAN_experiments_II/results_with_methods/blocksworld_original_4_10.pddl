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

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_12274 - BLOCK
      ?auto_12275 - BLOCK
      ?auto_12276 - BLOCK
      ?auto_12277 - BLOCK
    )
    :vars
    (
      ?auto_12278 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_12278 ?auto_12277 ) ( CLEAR ?auto_12278 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_12274 ) ( ON ?auto_12275 ?auto_12274 ) ( ON ?auto_12276 ?auto_12275 ) ( ON ?auto_12277 ?auto_12276 ) ( not ( = ?auto_12274 ?auto_12275 ) ) ( not ( = ?auto_12274 ?auto_12276 ) ) ( not ( = ?auto_12274 ?auto_12277 ) ) ( not ( = ?auto_12274 ?auto_12278 ) ) ( not ( = ?auto_12275 ?auto_12276 ) ) ( not ( = ?auto_12275 ?auto_12277 ) ) ( not ( = ?auto_12275 ?auto_12278 ) ) ( not ( = ?auto_12276 ?auto_12277 ) ) ( not ( = ?auto_12276 ?auto_12278 ) ) ( not ( = ?auto_12277 ?auto_12278 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_12278 ?auto_12277 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_12280 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_12280 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_12280 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_12281 - BLOCK
    )
    :vars
    (
      ?auto_12282 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_12281 ?auto_12282 ) ( CLEAR ?auto_12281 ) ( HAND-EMPTY ) ( not ( = ?auto_12281 ?auto_12282 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_12281 ?auto_12282 )
      ( MAKE-1PILE ?auto_12281 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_12286 - BLOCK
      ?auto_12287 - BLOCK
      ?auto_12288 - BLOCK
    )
    :vars
    (
      ?auto_12289 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_12289 ?auto_12288 ) ( CLEAR ?auto_12289 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_12286 ) ( ON ?auto_12287 ?auto_12286 ) ( ON ?auto_12288 ?auto_12287 ) ( not ( = ?auto_12286 ?auto_12287 ) ) ( not ( = ?auto_12286 ?auto_12288 ) ) ( not ( = ?auto_12286 ?auto_12289 ) ) ( not ( = ?auto_12287 ?auto_12288 ) ) ( not ( = ?auto_12287 ?auto_12289 ) ) ( not ( = ?auto_12288 ?auto_12289 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_12289 ?auto_12288 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_12290 - BLOCK
      ?auto_12291 - BLOCK
      ?auto_12292 - BLOCK
    )
    :vars
    (
      ?auto_12293 - BLOCK
      ?auto_12294 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_12293 ?auto_12292 ) ( CLEAR ?auto_12293 ) ( ON-TABLE ?auto_12290 ) ( ON ?auto_12291 ?auto_12290 ) ( ON ?auto_12292 ?auto_12291 ) ( not ( = ?auto_12290 ?auto_12291 ) ) ( not ( = ?auto_12290 ?auto_12292 ) ) ( not ( = ?auto_12290 ?auto_12293 ) ) ( not ( = ?auto_12291 ?auto_12292 ) ) ( not ( = ?auto_12291 ?auto_12293 ) ) ( not ( = ?auto_12292 ?auto_12293 ) ) ( HOLDING ?auto_12294 ) ( not ( = ?auto_12290 ?auto_12294 ) ) ( not ( = ?auto_12291 ?auto_12294 ) ) ( not ( = ?auto_12292 ?auto_12294 ) ) ( not ( = ?auto_12293 ?auto_12294 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_12294 )
      ( MAKE-3PILE ?auto_12290 ?auto_12291 ?auto_12292 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_12295 - BLOCK
      ?auto_12296 - BLOCK
      ?auto_12297 - BLOCK
    )
    :vars
    (
      ?auto_12298 - BLOCK
      ?auto_12299 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_12298 ?auto_12297 ) ( ON-TABLE ?auto_12295 ) ( ON ?auto_12296 ?auto_12295 ) ( ON ?auto_12297 ?auto_12296 ) ( not ( = ?auto_12295 ?auto_12296 ) ) ( not ( = ?auto_12295 ?auto_12297 ) ) ( not ( = ?auto_12295 ?auto_12298 ) ) ( not ( = ?auto_12296 ?auto_12297 ) ) ( not ( = ?auto_12296 ?auto_12298 ) ) ( not ( = ?auto_12297 ?auto_12298 ) ) ( not ( = ?auto_12295 ?auto_12299 ) ) ( not ( = ?auto_12296 ?auto_12299 ) ) ( not ( = ?auto_12297 ?auto_12299 ) ) ( not ( = ?auto_12298 ?auto_12299 ) ) ( ON ?auto_12299 ?auto_12298 ) ( CLEAR ?auto_12299 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_12295 ?auto_12296 ?auto_12297 ?auto_12298 )
      ( MAKE-3PILE ?auto_12295 ?auto_12296 ?auto_12297 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_12302 - BLOCK
      ?auto_12303 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_12303 ) ( CLEAR ?auto_12302 ) ( ON-TABLE ?auto_12302 ) ( not ( = ?auto_12302 ?auto_12303 ) ) )
    :subtasks
    ( ( !STACK ?auto_12303 ?auto_12302 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_12304 - BLOCK
      ?auto_12305 - BLOCK
    )
    :vars
    (
      ?auto_12306 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_12304 ) ( ON-TABLE ?auto_12304 ) ( not ( = ?auto_12304 ?auto_12305 ) ) ( ON ?auto_12305 ?auto_12306 ) ( CLEAR ?auto_12305 ) ( HAND-EMPTY ) ( not ( = ?auto_12304 ?auto_12306 ) ) ( not ( = ?auto_12305 ?auto_12306 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_12305 ?auto_12306 )
      ( MAKE-2PILE ?auto_12304 ?auto_12305 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_12307 - BLOCK
      ?auto_12308 - BLOCK
    )
    :vars
    (
      ?auto_12309 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_12307 ?auto_12308 ) ) ( ON ?auto_12308 ?auto_12309 ) ( CLEAR ?auto_12308 ) ( not ( = ?auto_12307 ?auto_12309 ) ) ( not ( = ?auto_12308 ?auto_12309 ) ) ( HOLDING ?auto_12307 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_12307 )
      ( MAKE-2PILE ?auto_12307 ?auto_12308 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_12310 - BLOCK
      ?auto_12311 - BLOCK
    )
    :vars
    (
      ?auto_12312 - BLOCK
      ?auto_12314 - BLOCK
      ?auto_12313 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_12310 ?auto_12311 ) ) ( ON ?auto_12311 ?auto_12312 ) ( not ( = ?auto_12310 ?auto_12312 ) ) ( not ( = ?auto_12311 ?auto_12312 ) ) ( ON ?auto_12310 ?auto_12311 ) ( CLEAR ?auto_12310 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_12314 ) ( ON ?auto_12313 ?auto_12314 ) ( ON ?auto_12312 ?auto_12313 ) ( not ( = ?auto_12314 ?auto_12313 ) ) ( not ( = ?auto_12314 ?auto_12312 ) ) ( not ( = ?auto_12314 ?auto_12311 ) ) ( not ( = ?auto_12314 ?auto_12310 ) ) ( not ( = ?auto_12313 ?auto_12312 ) ) ( not ( = ?auto_12313 ?auto_12311 ) ) ( not ( = ?auto_12313 ?auto_12310 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_12314 ?auto_12313 ?auto_12312 ?auto_12311 )
      ( MAKE-2PILE ?auto_12310 ?auto_12311 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_12317 - BLOCK
      ?auto_12318 - BLOCK
    )
    :vars
    (
      ?auto_12319 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_12319 ?auto_12318 ) ( CLEAR ?auto_12319 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_12317 ) ( ON ?auto_12318 ?auto_12317 ) ( not ( = ?auto_12317 ?auto_12318 ) ) ( not ( = ?auto_12317 ?auto_12319 ) ) ( not ( = ?auto_12318 ?auto_12319 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_12319 ?auto_12318 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_12320 - BLOCK
      ?auto_12321 - BLOCK
    )
    :vars
    (
      ?auto_12322 - BLOCK
      ?auto_12323 - BLOCK
      ?auto_12324 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_12322 ?auto_12321 ) ( CLEAR ?auto_12322 ) ( ON-TABLE ?auto_12320 ) ( ON ?auto_12321 ?auto_12320 ) ( not ( = ?auto_12320 ?auto_12321 ) ) ( not ( = ?auto_12320 ?auto_12322 ) ) ( not ( = ?auto_12321 ?auto_12322 ) ) ( HOLDING ?auto_12323 ) ( CLEAR ?auto_12324 ) ( not ( = ?auto_12320 ?auto_12323 ) ) ( not ( = ?auto_12320 ?auto_12324 ) ) ( not ( = ?auto_12321 ?auto_12323 ) ) ( not ( = ?auto_12321 ?auto_12324 ) ) ( not ( = ?auto_12322 ?auto_12323 ) ) ( not ( = ?auto_12322 ?auto_12324 ) ) ( not ( = ?auto_12323 ?auto_12324 ) ) )
    :subtasks
    ( ( !STACK ?auto_12323 ?auto_12324 )
      ( MAKE-2PILE ?auto_12320 ?auto_12321 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_12325 - BLOCK
      ?auto_12326 - BLOCK
    )
    :vars
    (
      ?auto_12329 - BLOCK
      ?auto_12327 - BLOCK
      ?auto_12328 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_12329 ?auto_12326 ) ( ON-TABLE ?auto_12325 ) ( ON ?auto_12326 ?auto_12325 ) ( not ( = ?auto_12325 ?auto_12326 ) ) ( not ( = ?auto_12325 ?auto_12329 ) ) ( not ( = ?auto_12326 ?auto_12329 ) ) ( CLEAR ?auto_12327 ) ( not ( = ?auto_12325 ?auto_12328 ) ) ( not ( = ?auto_12325 ?auto_12327 ) ) ( not ( = ?auto_12326 ?auto_12328 ) ) ( not ( = ?auto_12326 ?auto_12327 ) ) ( not ( = ?auto_12329 ?auto_12328 ) ) ( not ( = ?auto_12329 ?auto_12327 ) ) ( not ( = ?auto_12328 ?auto_12327 ) ) ( ON ?auto_12328 ?auto_12329 ) ( CLEAR ?auto_12328 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_12325 ?auto_12326 ?auto_12329 )
      ( MAKE-2PILE ?auto_12325 ?auto_12326 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_12330 - BLOCK
      ?auto_12331 - BLOCK
    )
    :vars
    (
      ?auto_12334 - BLOCK
      ?auto_12333 - BLOCK
      ?auto_12332 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_12334 ?auto_12331 ) ( ON-TABLE ?auto_12330 ) ( ON ?auto_12331 ?auto_12330 ) ( not ( = ?auto_12330 ?auto_12331 ) ) ( not ( = ?auto_12330 ?auto_12334 ) ) ( not ( = ?auto_12331 ?auto_12334 ) ) ( not ( = ?auto_12330 ?auto_12333 ) ) ( not ( = ?auto_12330 ?auto_12332 ) ) ( not ( = ?auto_12331 ?auto_12333 ) ) ( not ( = ?auto_12331 ?auto_12332 ) ) ( not ( = ?auto_12334 ?auto_12333 ) ) ( not ( = ?auto_12334 ?auto_12332 ) ) ( not ( = ?auto_12333 ?auto_12332 ) ) ( ON ?auto_12333 ?auto_12334 ) ( CLEAR ?auto_12333 ) ( HOLDING ?auto_12332 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_12332 )
      ( MAKE-2PILE ?auto_12330 ?auto_12331 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_12335 - BLOCK
      ?auto_12336 - BLOCK
    )
    :vars
    (
      ?auto_12338 - BLOCK
      ?auto_12337 - BLOCK
      ?auto_12339 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_12338 ?auto_12336 ) ( ON-TABLE ?auto_12335 ) ( ON ?auto_12336 ?auto_12335 ) ( not ( = ?auto_12335 ?auto_12336 ) ) ( not ( = ?auto_12335 ?auto_12338 ) ) ( not ( = ?auto_12336 ?auto_12338 ) ) ( not ( = ?auto_12335 ?auto_12337 ) ) ( not ( = ?auto_12335 ?auto_12339 ) ) ( not ( = ?auto_12336 ?auto_12337 ) ) ( not ( = ?auto_12336 ?auto_12339 ) ) ( not ( = ?auto_12338 ?auto_12337 ) ) ( not ( = ?auto_12338 ?auto_12339 ) ) ( not ( = ?auto_12337 ?auto_12339 ) ) ( ON ?auto_12337 ?auto_12338 ) ( ON ?auto_12339 ?auto_12337 ) ( CLEAR ?auto_12339 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_12335 ?auto_12336 ?auto_12338 ?auto_12337 )
      ( MAKE-2PILE ?auto_12335 ?auto_12336 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_12343 - BLOCK
      ?auto_12344 - BLOCK
      ?auto_12345 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_12345 ) ( CLEAR ?auto_12344 ) ( ON-TABLE ?auto_12343 ) ( ON ?auto_12344 ?auto_12343 ) ( not ( = ?auto_12343 ?auto_12344 ) ) ( not ( = ?auto_12343 ?auto_12345 ) ) ( not ( = ?auto_12344 ?auto_12345 ) ) )
    :subtasks
    ( ( !STACK ?auto_12345 ?auto_12344 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_12346 - BLOCK
      ?auto_12347 - BLOCK
      ?auto_12348 - BLOCK
    )
    :vars
    (
      ?auto_12349 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_12347 ) ( ON-TABLE ?auto_12346 ) ( ON ?auto_12347 ?auto_12346 ) ( not ( = ?auto_12346 ?auto_12347 ) ) ( not ( = ?auto_12346 ?auto_12348 ) ) ( not ( = ?auto_12347 ?auto_12348 ) ) ( ON ?auto_12348 ?auto_12349 ) ( CLEAR ?auto_12348 ) ( HAND-EMPTY ) ( not ( = ?auto_12346 ?auto_12349 ) ) ( not ( = ?auto_12347 ?auto_12349 ) ) ( not ( = ?auto_12348 ?auto_12349 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_12348 ?auto_12349 )
      ( MAKE-3PILE ?auto_12346 ?auto_12347 ?auto_12348 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_12350 - BLOCK
      ?auto_12351 - BLOCK
      ?auto_12352 - BLOCK
    )
    :vars
    (
      ?auto_12353 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_12350 ) ( not ( = ?auto_12350 ?auto_12351 ) ) ( not ( = ?auto_12350 ?auto_12352 ) ) ( not ( = ?auto_12351 ?auto_12352 ) ) ( ON ?auto_12352 ?auto_12353 ) ( CLEAR ?auto_12352 ) ( not ( = ?auto_12350 ?auto_12353 ) ) ( not ( = ?auto_12351 ?auto_12353 ) ) ( not ( = ?auto_12352 ?auto_12353 ) ) ( HOLDING ?auto_12351 ) ( CLEAR ?auto_12350 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_12350 ?auto_12351 )
      ( MAKE-3PILE ?auto_12350 ?auto_12351 ?auto_12352 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_12354 - BLOCK
      ?auto_12355 - BLOCK
      ?auto_12356 - BLOCK
    )
    :vars
    (
      ?auto_12357 - BLOCK
      ?auto_12358 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_12354 ) ( not ( = ?auto_12354 ?auto_12355 ) ) ( not ( = ?auto_12354 ?auto_12356 ) ) ( not ( = ?auto_12355 ?auto_12356 ) ) ( ON ?auto_12356 ?auto_12357 ) ( not ( = ?auto_12354 ?auto_12357 ) ) ( not ( = ?auto_12355 ?auto_12357 ) ) ( not ( = ?auto_12356 ?auto_12357 ) ) ( CLEAR ?auto_12354 ) ( ON ?auto_12355 ?auto_12356 ) ( CLEAR ?auto_12355 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_12358 ) ( ON ?auto_12357 ?auto_12358 ) ( not ( = ?auto_12358 ?auto_12357 ) ) ( not ( = ?auto_12358 ?auto_12356 ) ) ( not ( = ?auto_12358 ?auto_12355 ) ) ( not ( = ?auto_12354 ?auto_12358 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_12358 ?auto_12357 ?auto_12356 )
      ( MAKE-3PILE ?auto_12354 ?auto_12355 ?auto_12356 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_12359 - BLOCK
      ?auto_12360 - BLOCK
      ?auto_12361 - BLOCK
    )
    :vars
    (
      ?auto_12362 - BLOCK
      ?auto_12363 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_12359 ?auto_12360 ) ) ( not ( = ?auto_12359 ?auto_12361 ) ) ( not ( = ?auto_12360 ?auto_12361 ) ) ( ON ?auto_12361 ?auto_12362 ) ( not ( = ?auto_12359 ?auto_12362 ) ) ( not ( = ?auto_12360 ?auto_12362 ) ) ( not ( = ?auto_12361 ?auto_12362 ) ) ( ON ?auto_12360 ?auto_12361 ) ( CLEAR ?auto_12360 ) ( ON-TABLE ?auto_12363 ) ( ON ?auto_12362 ?auto_12363 ) ( not ( = ?auto_12363 ?auto_12362 ) ) ( not ( = ?auto_12363 ?auto_12361 ) ) ( not ( = ?auto_12363 ?auto_12360 ) ) ( not ( = ?auto_12359 ?auto_12363 ) ) ( HOLDING ?auto_12359 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_12359 )
      ( MAKE-3PILE ?auto_12359 ?auto_12360 ?auto_12361 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_12364 - BLOCK
      ?auto_12365 - BLOCK
      ?auto_12366 - BLOCK
    )
    :vars
    (
      ?auto_12368 - BLOCK
      ?auto_12367 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_12364 ?auto_12365 ) ) ( not ( = ?auto_12364 ?auto_12366 ) ) ( not ( = ?auto_12365 ?auto_12366 ) ) ( ON ?auto_12366 ?auto_12368 ) ( not ( = ?auto_12364 ?auto_12368 ) ) ( not ( = ?auto_12365 ?auto_12368 ) ) ( not ( = ?auto_12366 ?auto_12368 ) ) ( ON ?auto_12365 ?auto_12366 ) ( ON-TABLE ?auto_12367 ) ( ON ?auto_12368 ?auto_12367 ) ( not ( = ?auto_12367 ?auto_12368 ) ) ( not ( = ?auto_12367 ?auto_12366 ) ) ( not ( = ?auto_12367 ?auto_12365 ) ) ( not ( = ?auto_12364 ?auto_12367 ) ) ( ON ?auto_12364 ?auto_12365 ) ( CLEAR ?auto_12364 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_12367 ?auto_12368 ?auto_12366 ?auto_12365 )
      ( MAKE-3PILE ?auto_12364 ?auto_12365 ?auto_12366 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_12370 - BLOCK
    )
    :vars
    (
      ?auto_12371 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_12371 ?auto_12370 ) ( CLEAR ?auto_12371 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_12370 ) ( not ( = ?auto_12370 ?auto_12371 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_12371 ?auto_12370 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_12372 - BLOCK
    )
    :vars
    (
      ?auto_12373 - BLOCK
      ?auto_12374 - BLOCK
      ?auto_12375 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_12373 ?auto_12372 ) ( CLEAR ?auto_12373 ) ( ON-TABLE ?auto_12372 ) ( not ( = ?auto_12372 ?auto_12373 ) ) ( HOLDING ?auto_12374 ) ( CLEAR ?auto_12375 ) ( not ( = ?auto_12372 ?auto_12374 ) ) ( not ( = ?auto_12372 ?auto_12375 ) ) ( not ( = ?auto_12373 ?auto_12374 ) ) ( not ( = ?auto_12373 ?auto_12375 ) ) ( not ( = ?auto_12374 ?auto_12375 ) ) )
    :subtasks
    ( ( !STACK ?auto_12374 ?auto_12375 )
      ( MAKE-1PILE ?auto_12372 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_12376 - BLOCK
    )
    :vars
    (
      ?auto_12379 - BLOCK
      ?auto_12378 - BLOCK
      ?auto_12377 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_12379 ?auto_12376 ) ( ON-TABLE ?auto_12376 ) ( not ( = ?auto_12376 ?auto_12379 ) ) ( CLEAR ?auto_12378 ) ( not ( = ?auto_12376 ?auto_12377 ) ) ( not ( = ?auto_12376 ?auto_12378 ) ) ( not ( = ?auto_12379 ?auto_12377 ) ) ( not ( = ?auto_12379 ?auto_12378 ) ) ( not ( = ?auto_12377 ?auto_12378 ) ) ( ON ?auto_12377 ?auto_12379 ) ( CLEAR ?auto_12377 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_12376 ?auto_12379 )
      ( MAKE-1PILE ?auto_12376 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_12380 - BLOCK
    )
    :vars
    (
      ?auto_12383 - BLOCK
      ?auto_12381 - BLOCK
      ?auto_12382 - BLOCK
      ?auto_12384 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_12383 ?auto_12380 ) ( ON-TABLE ?auto_12380 ) ( not ( = ?auto_12380 ?auto_12383 ) ) ( not ( = ?auto_12380 ?auto_12381 ) ) ( not ( = ?auto_12380 ?auto_12382 ) ) ( not ( = ?auto_12383 ?auto_12381 ) ) ( not ( = ?auto_12383 ?auto_12382 ) ) ( not ( = ?auto_12381 ?auto_12382 ) ) ( ON ?auto_12381 ?auto_12383 ) ( CLEAR ?auto_12381 ) ( HOLDING ?auto_12382 ) ( CLEAR ?auto_12384 ) ( ON-TABLE ?auto_12384 ) ( not ( = ?auto_12384 ?auto_12382 ) ) ( not ( = ?auto_12380 ?auto_12384 ) ) ( not ( = ?auto_12383 ?auto_12384 ) ) ( not ( = ?auto_12381 ?auto_12384 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_12384 ?auto_12382 )
      ( MAKE-1PILE ?auto_12380 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_12385 - BLOCK
    )
    :vars
    (
      ?auto_12386 - BLOCK
      ?auto_12387 - BLOCK
      ?auto_12389 - BLOCK
      ?auto_12388 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_12386 ?auto_12385 ) ( ON-TABLE ?auto_12385 ) ( not ( = ?auto_12385 ?auto_12386 ) ) ( not ( = ?auto_12385 ?auto_12387 ) ) ( not ( = ?auto_12385 ?auto_12389 ) ) ( not ( = ?auto_12386 ?auto_12387 ) ) ( not ( = ?auto_12386 ?auto_12389 ) ) ( not ( = ?auto_12387 ?auto_12389 ) ) ( ON ?auto_12387 ?auto_12386 ) ( CLEAR ?auto_12388 ) ( ON-TABLE ?auto_12388 ) ( not ( = ?auto_12388 ?auto_12389 ) ) ( not ( = ?auto_12385 ?auto_12388 ) ) ( not ( = ?auto_12386 ?auto_12388 ) ) ( not ( = ?auto_12387 ?auto_12388 ) ) ( ON ?auto_12389 ?auto_12387 ) ( CLEAR ?auto_12389 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_12385 ?auto_12386 ?auto_12387 )
      ( MAKE-1PILE ?auto_12385 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_12390 - BLOCK
    )
    :vars
    (
      ?auto_12392 - BLOCK
      ?auto_12393 - BLOCK
      ?auto_12391 - BLOCK
      ?auto_12394 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_12392 ?auto_12390 ) ( ON-TABLE ?auto_12390 ) ( not ( = ?auto_12390 ?auto_12392 ) ) ( not ( = ?auto_12390 ?auto_12393 ) ) ( not ( = ?auto_12390 ?auto_12391 ) ) ( not ( = ?auto_12392 ?auto_12393 ) ) ( not ( = ?auto_12392 ?auto_12391 ) ) ( not ( = ?auto_12393 ?auto_12391 ) ) ( ON ?auto_12393 ?auto_12392 ) ( not ( = ?auto_12394 ?auto_12391 ) ) ( not ( = ?auto_12390 ?auto_12394 ) ) ( not ( = ?auto_12392 ?auto_12394 ) ) ( not ( = ?auto_12393 ?auto_12394 ) ) ( ON ?auto_12391 ?auto_12393 ) ( CLEAR ?auto_12391 ) ( HOLDING ?auto_12394 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_12394 )
      ( MAKE-1PILE ?auto_12390 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_12395 - BLOCK
    )
    :vars
    (
      ?auto_12396 - BLOCK
      ?auto_12397 - BLOCK
      ?auto_12398 - BLOCK
      ?auto_12399 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_12396 ?auto_12395 ) ( ON-TABLE ?auto_12395 ) ( not ( = ?auto_12395 ?auto_12396 ) ) ( not ( = ?auto_12395 ?auto_12397 ) ) ( not ( = ?auto_12395 ?auto_12398 ) ) ( not ( = ?auto_12396 ?auto_12397 ) ) ( not ( = ?auto_12396 ?auto_12398 ) ) ( not ( = ?auto_12397 ?auto_12398 ) ) ( ON ?auto_12397 ?auto_12396 ) ( not ( = ?auto_12399 ?auto_12398 ) ) ( not ( = ?auto_12395 ?auto_12399 ) ) ( not ( = ?auto_12396 ?auto_12399 ) ) ( not ( = ?auto_12397 ?auto_12399 ) ) ( ON ?auto_12398 ?auto_12397 ) ( ON ?auto_12399 ?auto_12398 ) ( CLEAR ?auto_12399 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_12395 ?auto_12396 ?auto_12397 ?auto_12398 )
      ( MAKE-1PILE ?auto_12395 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_12404 - BLOCK
      ?auto_12405 - BLOCK
      ?auto_12406 - BLOCK
      ?auto_12407 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_12407 ) ( CLEAR ?auto_12406 ) ( ON-TABLE ?auto_12404 ) ( ON ?auto_12405 ?auto_12404 ) ( ON ?auto_12406 ?auto_12405 ) ( not ( = ?auto_12404 ?auto_12405 ) ) ( not ( = ?auto_12404 ?auto_12406 ) ) ( not ( = ?auto_12404 ?auto_12407 ) ) ( not ( = ?auto_12405 ?auto_12406 ) ) ( not ( = ?auto_12405 ?auto_12407 ) ) ( not ( = ?auto_12406 ?auto_12407 ) ) )
    :subtasks
    ( ( !STACK ?auto_12407 ?auto_12406 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_12408 - BLOCK
      ?auto_12409 - BLOCK
      ?auto_12410 - BLOCK
      ?auto_12411 - BLOCK
    )
    :vars
    (
      ?auto_12412 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_12410 ) ( ON-TABLE ?auto_12408 ) ( ON ?auto_12409 ?auto_12408 ) ( ON ?auto_12410 ?auto_12409 ) ( not ( = ?auto_12408 ?auto_12409 ) ) ( not ( = ?auto_12408 ?auto_12410 ) ) ( not ( = ?auto_12408 ?auto_12411 ) ) ( not ( = ?auto_12409 ?auto_12410 ) ) ( not ( = ?auto_12409 ?auto_12411 ) ) ( not ( = ?auto_12410 ?auto_12411 ) ) ( ON ?auto_12411 ?auto_12412 ) ( CLEAR ?auto_12411 ) ( HAND-EMPTY ) ( not ( = ?auto_12408 ?auto_12412 ) ) ( not ( = ?auto_12409 ?auto_12412 ) ) ( not ( = ?auto_12410 ?auto_12412 ) ) ( not ( = ?auto_12411 ?auto_12412 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_12411 ?auto_12412 )
      ( MAKE-4PILE ?auto_12408 ?auto_12409 ?auto_12410 ?auto_12411 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_12413 - BLOCK
      ?auto_12414 - BLOCK
      ?auto_12415 - BLOCK
      ?auto_12416 - BLOCK
    )
    :vars
    (
      ?auto_12417 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_12413 ) ( ON ?auto_12414 ?auto_12413 ) ( not ( = ?auto_12413 ?auto_12414 ) ) ( not ( = ?auto_12413 ?auto_12415 ) ) ( not ( = ?auto_12413 ?auto_12416 ) ) ( not ( = ?auto_12414 ?auto_12415 ) ) ( not ( = ?auto_12414 ?auto_12416 ) ) ( not ( = ?auto_12415 ?auto_12416 ) ) ( ON ?auto_12416 ?auto_12417 ) ( CLEAR ?auto_12416 ) ( not ( = ?auto_12413 ?auto_12417 ) ) ( not ( = ?auto_12414 ?auto_12417 ) ) ( not ( = ?auto_12415 ?auto_12417 ) ) ( not ( = ?auto_12416 ?auto_12417 ) ) ( HOLDING ?auto_12415 ) ( CLEAR ?auto_12414 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_12413 ?auto_12414 ?auto_12415 )
      ( MAKE-4PILE ?auto_12413 ?auto_12414 ?auto_12415 ?auto_12416 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_12418 - BLOCK
      ?auto_12419 - BLOCK
      ?auto_12420 - BLOCK
      ?auto_12421 - BLOCK
    )
    :vars
    (
      ?auto_12422 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_12418 ) ( ON ?auto_12419 ?auto_12418 ) ( not ( = ?auto_12418 ?auto_12419 ) ) ( not ( = ?auto_12418 ?auto_12420 ) ) ( not ( = ?auto_12418 ?auto_12421 ) ) ( not ( = ?auto_12419 ?auto_12420 ) ) ( not ( = ?auto_12419 ?auto_12421 ) ) ( not ( = ?auto_12420 ?auto_12421 ) ) ( ON ?auto_12421 ?auto_12422 ) ( not ( = ?auto_12418 ?auto_12422 ) ) ( not ( = ?auto_12419 ?auto_12422 ) ) ( not ( = ?auto_12420 ?auto_12422 ) ) ( not ( = ?auto_12421 ?auto_12422 ) ) ( CLEAR ?auto_12419 ) ( ON ?auto_12420 ?auto_12421 ) ( CLEAR ?auto_12420 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_12422 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_12422 ?auto_12421 )
      ( MAKE-4PILE ?auto_12418 ?auto_12419 ?auto_12420 ?auto_12421 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_12423 - BLOCK
      ?auto_12424 - BLOCK
      ?auto_12425 - BLOCK
      ?auto_12426 - BLOCK
    )
    :vars
    (
      ?auto_12427 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_12423 ) ( not ( = ?auto_12423 ?auto_12424 ) ) ( not ( = ?auto_12423 ?auto_12425 ) ) ( not ( = ?auto_12423 ?auto_12426 ) ) ( not ( = ?auto_12424 ?auto_12425 ) ) ( not ( = ?auto_12424 ?auto_12426 ) ) ( not ( = ?auto_12425 ?auto_12426 ) ) ( ON ?auto_12426 ?auto_12427 ) ( not ( = ?auto_12423 ?auto_12427 ) ) ( not ( = ?auto_12424 ?auto_12427 ) ) ( not ( = ?auto_12425 ?auto_12427 ) ) ( not ( = ?auto_12426 ?auto_12427 ) ) ( ON ?auto_12425 ?auto_12426 ) ( CLEAR ?auto_12425 ) ( ON-TABLE ?auto_12427 ) ( HOLDING ?auto_12424 ) ( CLEAR ?auto_12423 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_12423 ?auto_12424 )
      ( MAKE-4PILE ?auto_12423 ?auto_12424 ?auto_12425 ?auto_12426 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_12428 - BLOCK
      ?auto_12429 - BLOCK
      ?auto_12430 - BLOCK
      ?auto_12431 - BLOCK
    )
    :vars
    (
      ?auto_12432 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_12428 ) ( not ( = ?auto_12428 ?auto_12429 ) ) ( not ( = ?auto_12428 ?auto_12430 ) ) ( not ( = ?auto_12428 ?auto_12431 ) ) ( not ( = ?auto_12429 ?auto_12430 ) ) ( not ( = ?auto_12429 ?auto_12431 ) ) ( not ( = ?auto_12430 ?auto_12431 ) ) ( ON ?auto_12431 ?auto_12432 ) ( not ( = ?auto_12428 ?auto_12432 ) ) ( not ( = ?auto_12429 ?auto_12432 ) ) ( not ( = ?auto_12430 ?auto_12432 ) ) ( not ( = ?auto_12431 ?auto_12432 ) ) ( ON ?auto_12430 ?auto_12431 ) ( ON-TABLE ?auto_12432 ) ( CLEAR ?auto_12428 ) ( ON ?auto_12429 ?auto_12430 ) ( CLEAR ?auto_12429 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_12432 ?auto_12431 ?auto_12430 )
      ( MAKE-4PILE ?auto_12428 ?auto_12429 ?auto_12430 ?auto_12431 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_12433 - BLOCK
      ?auto_12434 - BLOCK
      ?auto_12435 - BLOCK
      ?auto_12436 - BLOCK
    )
    :vars
    (
      ?auto_12437 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_12433 ?auto_12434 ) ) ( not ( = ?auto_12433 ?auto_12435 ) ) ( not ( = ?auto_12433 ?auto_12436 ) ) ( not ( = ?auto_12434 ?auto_12435 ) ) ( not ( = ?auto_12434 ?auto_12436 ) ) ( not ( = ?auto_12435 ?auto_12436 ) ) ( ON ?auto_12436 ?auto_12437 ) ( not ( = ?auto_12433 ?auto_12437 ) ) ( not ( = ?auto_12434 ?auto_12437 ) ) ( not ( = ?auto_12435 ?auto_12437 ) ) ( not ( = ?auto_12436 ?auto_12437 ) ) ( ON ?auto_12435 ?auto_12436 ) ( ON-TABLE ?auto_12437 ) ( ON ?auto_12434 ?auto_12435 ) ( CLEAR ?auto_12434 ) ( HOLDING ?auto_12433 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_12433 )
      ( MAKE-4PILE ?auto_12433 ?auto_12434 ?auto_12435 ?auto_12436 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_12438 - BLOCK
      ?auto_12439 - BLOCK
      ?auto_12440 - BLOCK
      ?auto_12441 - BLOCK
    )
    :vars
    (
      ?auto_12442 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_12438 ?auto_12439 ) ) ( not ( = ?auto_12438 ?auto_12440 ) ) ( not ( = ?auto_12438 ?auto_12441 ) ) ( not ( = ?auto_12439 ?auto_12440 ) ) ( not ( = ?auto_12439 ?auto_12441 ) ) ( not ( = ?auto_12440 ?auto_12441 ) ) ( ON ?auto_12441 ?auto_12442 ) ( not ( = ?auto_12438 ?auto_12442 ) ) ( not ( = ?auto_12439 ?auto_12442 ) ) ( not ( = ?auto_12440 ?auto_12442 ) ) ( not ( = ?auto_12441 ?auto_12442 ) ) ( ON ?auto_12440 ?auto_12441 ) ( ON-TABLE ?auto_12442 ) ( ON ?auto_12439 ?auto_12440 ) ( ON ?auto_12438 ?auto_12439 ) ( CLEAR ?auto_12438 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_12442 ?auto_12441 ?auto_12440 ?auto_12439 )
      ( MAKE-4PILE ?auto_12438 ?auto_12439 ?auto_12440 ?auto_12441 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_12446 - BLOCK
      ?auto_12447 - BLOCK
      ?auto_12448 - BLOCK
    )
    :vars
    (
      ?auto_12449 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_12449 ?auto_12448 ) ( CLEAR ?auto_12449 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_12446 ) ( ON ?auto_12447 ?auto_12446 ) ( ON ?auto_12448 ?auto_12447 ) ( not ( = ?auto_12446 ?auto_12447 ) ) ( not ( = ?auto_12446 ?auto_12448 ) ) ( not ( = ?auto_12446 ?auto_12449 ) ) ( not ( = ?auto_12447 ?auto_12448 ) ) ( not ( = ?auto_12447 ?auto_12449 ) ) ( not ( = ?auto_12448 ?auto_12449 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_12449 ?auto_12448 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_12459 - BLOCK
      ?auto_12460 - BLOCK
      ?auto_12461 - BLOCK
    )
    :vars
    (
      ?auto_12462 - BLOCK
      ?auto_12463 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_12459 ) ( ON ?auto_12460 ?auto_12459 ) ( not ( = ?auto_12459 ?auto_12460 ) ) ( not ( = ?auto_12459 ?auto_12461 ) ) ( not ( = ?auto_12459 ?auto_12462 ) ) ( not ( = ?auto_12460 ?auto_12461 ) ) ( not ( = ?auto_12460 ?auto_12462 ) ) ( not ( = ?auto_12461 ?auto_12462 ) ) ( ON ?auto_12462 ?auto_12463 ) ( CLEAR ?auto_12462 ) ( not ( = ?auto_12459 ?auto_12463 ) ) ( not ( = ?auto_12460 ?auto_12463 ) ) ( not ( = ?auto_12461 ?auto_12463 ) ) ( not ( = ?auto_12462 ?auto_12463 ) ) ( HOLDING ?auto_12461 ) ( CLEAR ?auto_12460 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_12459 ?auto_12460 ?auto_12461 ?auto_12462 )
      ( MAKE-3PILE ?auto_12459 ?auto_12460 ?auto_12461 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_12464 - BLOCK
      ?auto_12465 - BLOCK
      ?auto_12466 - BLOCK
    )
    :vars
    (
      ?auto_12467 - BLOCK
      ?auto_12468 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_12464 ) ( ON ?auto_12465 ?auto_12464 ) ( not ( = ?auto_12464 ?auto_12465 ) ) ( not ( = ?auto_12464 ?auto_12466 ) ) ( not ( = ?auto_12464 ?auto_12467 ) ) ( not ( = ?auto_12465 ?auto_12466 ) ) ( not ( = ?auto_12465 ?auto_12467 ) ) ( not ( = ?auto_12466 ?auto_12467 ) ) ( ON ?auto_12467 ?auto_12468 ) ( not ( = ?auto_12464 ?auto_12468 ) ) ( not ( = ?auto_12465 ?auto_12468 ) ) ( not ( = ?auto_12466 ?auto_12468 ) ) ( not ( = ?auto_12467 ?auto_12468 ) ) ( CLEAR ?auto_12465 ) ( ON ?auto_12466 ?auto_12467 ) ( CLEAR ?auto_12466 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_12468 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_12468 ?auto_12467 )
      ( MAKE-3PILE ?auto_12464 ?auto_12465 ?auto_12466 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_12469 - BLOCK
      ?auto_12470 - BLOCK
      ?auto_12471 - BLOCK
    )
    :vars
    (
      ?auto_12472 - BLOCK
      ?auto_12473 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_12469 ) ( not ( = ?auto_12469 ?auto_12470 ) ) ( not ( = ?auto_12469 ?auto_12471 ) ) ( not ( = ?auto_12469 ?auto_12472 ) ) ( not ( = ?auto_12470 ?auto_12471 ) ) ( not ( = ?auto_12470 ?auto_12472 ) ) ( not ( = ?auto_12471 ?auto_12472 ) ) ( ON ?auto_12472 ?auto_12473 ) ( not ( = ?auto_12469 ?auto_12473 ) ) ( not ( = ?auto_12470 ?auto_12473 ) ) ( not ( = ?auto_12471 ?auto_12473 ) ) ( not ( = ?auto_12472 ?auto_12473 ) ) ( ON ?auto_12471 ?auto_12472 ) ( CLEAR ?auto_12471 ) ( ON-TABLE ?auto_12473 ) ( HOLDING ?auto_12470 ) ( CLEAR ?auto_12469 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_12469 ?auto_12470 )
      ( MAKE-3PILE ?auto_12469 ?auto_12470 ?auto_12471 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_12474 - BLOCK
      ?auto_12475 - BLOCK
      ?auto_12476 - BLOCK
    )
    :vars
    (
      ?auto_12477 - BLOCK
      ?auto_12478 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_12474 ) ( not ( = ?auto_12474 ?auto_12475 ) ) ( not ( = ?auto_12474 ?auto_12476 ) ) ( not ( = ?auto_12474 ?auto_12477 ) ) ( not ( = ?auto_12475 ?auto_12476 ) ) ( not ( = ?auto_12475 ?auto_12477 ) ) ( not ( = ?auto_12476 ?auto_12477 ) ) ( ON ?auto_12477 ?auto_12478 ) ( not ( = ?auto_12474 ?auto_12478 ) ) ( not ( = ?auto_12475 ?auto_12478 ) ) ( not ( = ?auto_12476 ?auto_12478 ) ) ( not ( = ?auto_12477 ?auto_12478 ) ) ( ON ?auto_12476 ?auto_12477 ) ( ON-TABLE ?auto_12478 ) ( CLEAR ?auto_12474 ) ( ON ?auto_12475 ?auto_12476 ) ( CLEAR ?auto_12475 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_12478 ?auto_12477 ?auto_12476 )
      ( MAKE-3PILE ?auto_12474 ?auto_12475 ?auto_12476 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_12479 - BLOCK
      ?auto_12480 - BLOCK
      ?auto_12481 - BLOCK
    )
    :vars
    (
      ?auto_12482 - BLOCK
      ?auto_12483 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_12479 ?auto_12480 ) ) ( not ( = ?auto_12479 ?auto_12481 ) ) ( not ( = ?auto_12479 ?auto_12482 ) ) ( not ( = ?auto_12480 ?auto_12481 ) ) ( not ( = ?auto_12480 ?auto_12482 ) ) ( not ( = ?auto_12481 ?auto_12482 ) ) ( ON ?auto_12482 ?auto_12483 ) ( not ( = ?auto_12479 ?auto_12483 ) ) ( not ( = ?auto_12480 ?auto_12483 ) ) ( not ( = ?auto_12481 ?auto_12483 ) ) ( not ( = ?auto_12482 ?auto_12483 ) ) ( ON ?auto_12481 ?auto_12482 ) ( ON-TABLE ?auto_12483 ) ( ON ?auto_12480 ?auto_12481 ) ( CLEAR ?auto_12480 ) ( HOLDING ?auto_12479 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_12479 )
      ( MAKE-3PILE ?auto_12479 ?auto_12480 ?auto_12481 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_12484 - BLOCK
      ?auto_12485 - BLOCK
      ?auto_12486 - BLOCK
    )
    :vars
    (
      ?auto_12488 - BLOCK
      ?auto_12487 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_12484 ?auto_12485 ) ) ( not ( = ?auto_12484 ?auto_12486 ) ) ( not ( = ?auto_12484 ?auto_12488 ) ) ( not ( = ?auto_12485 ?auto_12486 ) ) ( not ( = ?auto_12485 ?auto_12488 ) ) ( not ( = ?auto_12486 ?auto_12488 ) ) ( ON ?auto_12488 ?auto_12487 ) ( not ( = ?auto_12484 ?auto_12487 ) ) ( not ( = ?auto_12485 ?auto_12487 ) ) ( not ( = ?auto_12486 ?auto_12487 ) ) ( not ( = ?auto_12488 ?auto_12487 ) ) ( ON ?auto_12486 ?auto_12488 ) ( ON-TABLE ?auto_12487 ) ( ON ?auto_12485 ?auto_12486 ) ( ON ?auto_12484 ?auto_12485 ) ( CLEAR ?auto_12484 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_12487 ?auto_12488 ?auto_12486 ?auto_12485 )
      ( MAKE-3PILE ?auto_12484 ?auto_12485 ?auto_12486 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_12490 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_12490 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_12490 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_12491 - BLOCK
    )
    :vars
    (
      ?auto_12492 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_12491 ?auto_12492 ) ( CLEAR ?auto_12491 ) ( HAND-EMPTY ) ( not ( = ?auto_12491 ?auto_12492 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_12491 ?auto_12492 )
      ( MAKE-1PILE ?auto_12491 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_12493 - BLOCK
    )
    :vars
    (
      ?auto_12494 - BLOCK
      ?auto_12496 - BLOCK
      ?auto_12495 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_12493 ?auto_12494 ) ) ( HOLDING ?auto_12493 ) ( CLEAR ?auto_12494 ) ( ON-TABLE ?auto_12496 ) ( ON ?auto_12495 ?auto_12496 ) ( ON ?auto_12494 ?auto_12495 ) ( not ( = ?auto_12496 ?auto_12495 ) ) ( not ( = ?auto_12496 ?auto_12494 ) ) ( not ( = ?auto_12496 ?auto_12493 ) ) ( not ( = ?auto_12495 ?auto_12494 ) ) ( not ( = ?auto_12495 ?auto_12493 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_12496 ?auto_12495 ?auto_12494 ?auto_12493 )
      ( MAKE-1PILE ?auto_12493 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_12497 - BLOCK
    )
    :vars
    (
      ?auto_12500 - BLOCK
      ?auto_12499 - BLOCK
      ?auto_12498 - BLOCK
      ?auto_12501 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_12497 ?auto_12500 ) ) ( CLEAR ?auto_12500 ) ( ON-TABLE ?auto_12499 ) ( ON ?auto_12498 ?auto_12499 ) ( ON ?auto_12500 ?auto_12498 ) ( not ( = ?auto_12499 ?auto_12498 ) ) ( not ( = ?auto_12499 ?auto_12500 ) ) ( not ( = ?auto_12499 ?auto_12497 ) ) ( not ( = ?auto_12498 ?auto_12500 ) ) ( not ( = ?auto_12498 ?auto_12497 ) ) ( ON ?auto_12497 ?auto_12501 ) ( CLEAR ?auto_12497 ) ( HAND-EMPTY ) ( not ( = ?auto_12497 ?auto_12501 ) ) ( not ( = ?auto_12500 ?auto_12501 ) ) ( not ( = ?auto_12499 ?auto_12501 ) ) ( not ( = ?auto_12498 ?auto_12501 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_12497 ?auto_12501 )
      ( MAKE-1PILE ?auto_12497 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_12502 - BLOCK
    )
    :vars
    (
      ?auto_12503 - BLOCK
      ?auto_12504 - BLOCK
      ?auto_12506 - BLOCK
      ?auto_12505 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_12502 ?auto_12503 ) ) ( ON-TABLE ?auto_12504 ) ( ON ?auto_12506 ?auto_12504 ) ( not ( = ?auto_12504 ?auto_12506 ) ) ( not ( = ?auto_12504 ?auto_12503 ) ) ( not ( = ?auto_12504 ?auto_12502 ) ) ( not ( = ?auto_12506 ?auto_12503 ) ) ( not ( = ?auto_12506 ?auto_12502 ) ) ( ON ?auto_12502 ?auto_12505 ) ( CLEAR ?auto_12502 ) ( not ( = ?auto_12502 ?auto_12505 ) ) ( not ( = ?auto_12503 ?auto_12505 ) ) ( not ( = ?auto_12504 ?auto_12505 ) ) ( not ( = ?auto_12506 ?auto_12505 ) ) ( HOLDING ?auto_12503 ) ( CLEAR ?auto_12506 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_12504 ?auto_12506 ?auto_12503 )
      ( MAKE-1PILE ?auto_12502 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_12507 - BLOCK
    )
    :vars
    (
      ?auto_12510 - BLOCK
      ?auto_12508 - BLOCK
      ?auto_12509 - BLOCK
      ?auto_12511 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_12507 ?auto_12510 ) ) ( ON-TABLE ?auto_12508 ) ( ON ?auto_12509 ?auto_12508 ) ( not ( = ?auto_12508 ?auto_12509 ) ) ( not ( = ?auto_12508 ?auto_12510 ) ) ( not ( = ?auto_12508 ?auto_12507 ) ) ( not ( = ?auto_12509 ?auto_12510 ) ) ( not ( = ?auto_12509 ?auto_12507 ) ) ( ON ?auto_12507 ?auto_12511 ) ( not ( = ?auto_12507 ?auto_12511 ) ) ( not ( = ?auto_12510 ?auto_12511 ) ) ( not ( = ?auto_12508 ?auto_12511 ) ) ( not ( = ?auto_12509 ?auto_12511 ) ) ( CLEAR ?auto_12509 ) ( ON ?auto_12510 ?auto_12507 ) ( CLEAR ?auto_12510 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_12511 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_12511 ?auto_12507 )
      ( MAKE-1PILE ?auto_12507 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_12512 - BLOCK
    )
    :vars
    (
      ?auto_12514 - BLOCK
      ?auto_12515 - BLOCK
      ?auto_12516 - BLOCK
      ?auto_12513 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_12512 ?auto_12514 ) ) ( ON-TABLE ?auto_12515 ) ( not ( = ?auto_12515 ?auto_12516 ) ) ( not ( = ?auto_12515 ?auto_12514 ) ) ( not ( = ?auto_12515 ?auto_12512 ) ) ( not ( = ?auto_12516 ?auto_12514 ) ) ( not ( = ?auto_12516 ?auto_12512 ) ) ( ON ?auto_12512 ?auto_12513 ) ( not ( = ?auto_12512 ?auto_12513 ) ) ( not ( = ?auto_12514 ?auto_12513 ) ) ( not ( = ?auto_12515 ?auto_12513 ) ) ( not ( = ?auto_12516 ?auto_12513 ) ) ( ON ?auto_12514 ?auto_12512 ) ( CLEAR ?auto_12514 ) ( ON-TABLE ?auto_12513 ) ( HOLDING ?auto_12516 ) ( CLEAR ?auto_12515 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_12515 ?auto_12516 )
      ( MAKE-1PILE ?auto_12512 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_12517 - BLOCK
    )
    :vars
    (
      ?auto_12521 - BLOCK
      ?auto_12520 - BLOCK
      ?auto_12518 - BLOCK
      ?auto_12519 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_12517 ?auto_12521 ) ) ( ON-TABLE ?auto_12520 ) ( not ( = ?auto_12520 ?auto_12518 ) ) ( not ( = ?auto_12520 ?auto_12521 ) ) ( not ( = ?auto_12520 ?auto_12517 ) ) ( not ( = ?auto_12518 ?auto_12521 ) ) ( not ( = ?auto_12518 ?auto_12517 ) ) ( ON ?auto_12517 ?auto_12519 ) ( not ( = ?auto_12517 ?auto_12519 ) ) ( not ( = ?auto_12521 ?auto_12519 ) ) ( not ( = ?auto_12520 ?auto_12519 ) ) ( not ( = ?auto_12518 ?auto_12519 ) ) ( ON ?auto_12521 ?auto_12517 ) ( ON-TABLE ?auto_12519 ) ( CLEAR ?auto_12520 ) ( ON ?auto_12518 ?auto_12521 ) ( CLEAR ?auto_12518 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_12519 ?auto_12517 ?auto_12521 )
      ( MAKE-1PILE ?auto_12517 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_12522 - BLOCK
    )
    :vars
    (
      ?auto_12523 - BLOCK
      ?auto_12524 - BLOCK
      ?auto_12526 - BLOCK
      ?auto_12525 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_12522 ?auto_12523 ) ) ( not ( = ?auto_12524 ?auto_12526 ) ) ( not ( = ?auto_12524 ?auto_12523 ) ) ( not ( = ?auto_12524 ?auto_12522 ) ) ( not ( = ?auto_12526 ?auto_12523 ) ) ( not ( = ?auto_12526 ?auto_12522 ) ) ( ON ?auto_12522 ?auto_12525 ) ( not ( = ?auto_12522 ?auto_12525 ) ) ( not ( = ?auto_12523 ?auto_12525 ) ) ( not ( = ?auto_12524 ?auto_12525 ) ) ( not ( = ?auto_12526 ?auto_12525 ) ) ( ON ?auto_12523 ?auto_12522 ) ( ON-TABLE ?auto_12525 ) ( ON ?auto_12526 ?auto_12523 ) ( CLEAR ?auto_12526 ) ( HOLDING ?auto_12524 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_12524 )
      ( MAKE-1PILE ?auto_12522 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_12527 - BLOCK
    )
    :vars
    (
      ?auto_12529 - BLOCK
      ?auto_12528 - BLOCK
      ?auto_12531 - BLOCK
      ?auto_12530 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_12527 ?auto_12529 ) ) ( not ( = ?auto_12528 ?auto_12531 ) ) ( not ( = ?auto_12528 ?auto_12529 ) ) ( not ( = ?auto_12528 ?auto_12527 ) ) ( not ( = ?auto_12531 ?auto_12529 ) ) ( not ( = ?auto_12531 ?auto_12527 ) ) ( ON ?auto_12527 ?auto_12530 ) ( not ( = ?auto_12527 ?auto_12530 ) ) ( not ( = ?auto_12529 ?auto_12530 ) ) ( not ( = ?auto_12528 ?auto_12530 ) ) ( not ( = ?auto_12531 ?auto_12530 ) ) ( ON ?auto_12529 ?auto_12527 ) ( ON-TABLE ?auto_12530 ) ( ON ?auto_12531 ?auto_12529 ) ( ON ?auto_12528 ?auto_12531 ) ( CLEAR ?auto_12528 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_12530 ?auto_12527 ?auto_12529 ?auto_12531 )
      ( MAKE-1PILE ?auto_12527 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_12534 - BLOCK
      ?auto_12535 - BLOCK
    )
    :vars
    (
      ?auto_12536 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_12536 ?auto_12535 ) ( CLEAR ?auto_12536 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_12534 ) ( ON ?auto_12535 ?auto_12534 ) ( not ( = ?auto_12534 ?auto_12535 ) ) ( not ( = ?auto_12534 ?auto_12536 ) ) ( not ( = ?auto_12535 ?auto_12536 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_12536 ?auto_12535 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_12537 - BLOCK
      ?auto_12538 - BLOCK
    )
    :vars
    (
      ?auto_12539 - BLOCK
      ?auto_12540 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_12539 ?auto_12538 ) ( CLEAR ?auto_12539 ) ( ON-TABLE ?auto_12537 ) ( ON ?auto_12538 ?auto_12537 ) ( not ( = ?auto_12537 ?auto_12538 ) ) ( not ( = ?auto_12537 ?auto_12539 ) ) ( not ( = ?auto_12538 ?auto_12539 ) ) ( HOLDING ?auto_12540 ) ( not ( = ?auto_12537 ?auto_12540 ) ) ( not ( = ?auto_12538 ?auto_12540 ) ) ( not ( = ?auto_12539 ?auto_12540 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_12540 )
      ( MAKE-2PILE ?auto_12537 ?auto_12538 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_12541 - BLOCK
      ?auto_12542 - BLOCK
    )
    :vars
    (
      ?auto_12543 - BLOCK
      ?auto_12544 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_12543 ?auto_12542 ) ( ON-TABLE ?auto_12541 ) ( ON ?auto_12542 ?auto_12541 ) ( not ( = ?auto_12541 ?auto_12542 ) ) ( not ( = ?auto_12541 ?auto_12543 ) ) ( not ( = ?auto_12542 ?auto_12543 ) ) ( not ( = ?auto_12541 ?auto_12544 ) ) ( not ( = ?auto_12542 ?auto_12544 ) ) ( not ( = ?auto_12543 ?auto_12544 ) ) ( ON ?auto_12544 ?auto_12543 ) ( CLEAR ?auto_12544 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_12541 ?auto_12542 ?auto_12543 )
      ( MAKE-2PILE ?auto_12541 ?auto_12542 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_12545 - BLOCK
      ?auto_12546 - BLOCK
    )
    :vars
    (
      ?auto_12547 - BLOCK
      ?auto_12548 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_12547 ?auto_12546 ) ( ON-TABLE ?auto_12545 ) ( ON ?auto_12546 ?auto_12545 ) ( not ( = ?auto_12545 ?auto_12546 ) ) ( not ( = ?auto_12545 ?auto_12547 ) ) ( not ( = ?auto_12546 ?auto_12547 ) ) ( not ( = ?auto_12545 ?auto_12548 ) ) ( not ( = ?auto_12546 ?auto_12548 ) ) ( not ( = ?auto_12547 ?auto_12548 ) ) ( HOLDING ?auto_12548 ) ( CLEAR ?auto_12547 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_12545 ?auto_12546 ?auto_12547 ?auto_12548 )
      ( MAKE-2PILE ?auto_12545 ?auto_12546 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_12549 - BLOCK
      ?auto_12550 - BLOCK
    )
    :vars
    (
      ?auto_12552 - BLOCK
      ?auto_12551 - BLOCK
      ?auto_12553 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_12552 ?auto_12550 ) ( ON-TABLE ?auto_12549 ) ( ON ?auto_12550 ?auto_12549 ) ( not ( = ?auto_12549 ?auto_12550 ) ) ( not ( = ?auto_12549 ?auto_12552 ) ) ( not ( = ?auto_12550 ?auto_12552 ) ) ( not ( = ?auto_12549 ?auto_12551 ) ) ( not ( = ?auto_12550 ?auto_12551 ) ) ( not ( = ?auto_12552 ?auto_12551 ) ) ( CLEAR ?auto_12552 ) ( ON ?auto_12551 ?auto_12553 ) ( CLEAR ?auto_12551 ) ( HAND-EMPTY ) ( not ( = ?auto_12549 ?auto_12553 ) ) ( not ( = ?auto_12550 ?auto_12553 ) ) ( not ( = ?auto_12552 ?auto_12553 ) ) ( not ( = ?auto_12551 ?auto_12553 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_12551 ?auto_12553 )
      ( MAKE-2PILE ?auto_12549 ?auto_12550 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_12564 - BLOCK
      ?auto_12565 - BLOCK
    )
    :vars
    (
      ?auto_12567 - BLOCK
      ?auto_12566 - BLOCK
      ?auto_12568 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_12564 ) ( not ( = ?auto_12564 ?auto_12565 ) ) ( not ( = ?auto_12564 ?auto_12567 ) ) ( not ( = ?auto_12565 ?auto_12567 ) ) ( not ( = ?auto_12564 ?auto_12566 ) ) ( not ( = ?auto_12565 ?auto_12566 ) ) ( not ( = ?auto_12567 ?auto_12566 ) ) ( ON ?auto_12566 ?auto_12568 ) ( not ( = ?auto_12564 ?auto_12568 ) ) ( not ( = ?auto_12565 ?auto_12568 ) ) ( not ( = ?auto_12567 ?auto_12568 ) ) ( not ( = ?auto_12566 ?auto_12568 ) ) ( ON ?auto_12567 ?auto_12566 ) ( CLEAR ?auto_12567 ) ( HOLDING ?auto_12565 ) ( CLEAR ?auto_12564 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_12564 ?auto_12565 ?auto_12567 )
      ( MAKE-2PILE ?auto_12564 ?auto_12565 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_12569 - BLOCK
      ?auto_12570 - BLOCK
    )
    :vars
    (
      ?auto_12573 - BLOCK
      ?auto_12571 - BLOCK
      ?auto_12572 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_12569 ) ( not ( = ?auto_12569 ?auto_12570 ) ) ( not ( = ?auto_12569 ?auto_12573 ) ) ( not ( = ?auto_12570 ?auto_12573 ) ) ( not ( = ?auto_12569 ?auto_12571 ) ) ( not ( = ?auto_12570 ?auto_12571 ) ) ( not ( = ?auto_12573 ?auto_12571 ) ) ( ON ?auto_12571 ?auto_12572 ) ( not ( = ?auto_12569 ?auto_12572 ) ) ( not ( = ?auto_12570 ?auto_12572 ) ) ( not ( = ?auto_12573 ?auto_12572 ) ) ( not ( = ?auto_12571 ?auto_12572 ) ) ( ON ?auto_12573 ?auto_12571 ) ( CLEAR ?auto_12569 ) ( ON ?auto_12570 ?auto_12573 ) ( CLEAR ?auto_12570 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_12572 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_12572 ?auto_12571 ?auto_12573 )
      ( MAKE-2PILE ?auto_12569 ?auto_12570 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_12574 - BLOCK
      ?auto_12575 - BLOCK
    )
    :vars
    (
      ?auto_12578 - BLOCK
      ?auto_12576 - BLOCK
      ?auto_12577 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_12574 ?auto_12575 ) ) ( not ( = ?auto_12574 ?auto_12578 ) ) ( not ( = ?auto_12575 ?auto_12578 ) ) ( not ( = ?auto_12574 ?auto_12576 ) ) ( not ( = ?auto_12575 ?auto_12576 ) ) ( not ( = ?auto_12578 ?auto_12576 ) ) ( ON ?auto_12576 ?auto_12577 ) ( not ( = ?auto_12574 ?auto_12577 ) ) ( not ( = ?auto_12575 ?auto_12577 ) ) ( not ( = ?auto_12578 ?auto_12577 ) ) ( not ( = ?auto_12576 ?auto_12577 ) ) ( ON ?auto_12578 ?auto_12576 ) ( ON ?auto_12575 ?auto_12578 ) ( CLEAR ?auto_12575 ) ( ON-TABLE ?auto_12577 ) ( HOLDING ?auto_12574 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_12574 )
      ( MAKE-2PILE ?auto_12574 ?auto_12575 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_12579 - BLOCK
      ?auto_12580 - BLOCK
    )
    :vars
    (
      ?auto_12581 - BLOCK
      ?auto_12583 - BLOCK
      ?auto_12582 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_12579 ?auto_12580 ) ) ( not ( = ?auto_12579 ?auto_12581 ) ) ( not ( = ?auto_12580 ?auto_12581 ) ) ( not ( = ?auto_12579 ?auto_12583 ) ) ( not ( = ?auto_12580 ?auto_12583 ) ) ( not ( = ?auto_12581 ?auto_12583 ) ) ( ON ?auto_12583 ?auto_12582 ) ( not ( = ?auto_12579 ?auto_12582 ) ) ( not ( = ?auto_12580 ?auto_12582 ) ) ( not ( = ?auto_12581 ?auto_12582 ) ) ( not ( = ?auto_12583 ?auto_12582 ) ) ( ON ?auto_12581 ?auto_12583 ) ( ON ?auto_12580 ?auto_12581 ) ( ON-TABLE ?auto_12582 ) ( ON ?auto_12579 ?auto_12580 ) ( CLEAR ?auto_12579 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_12582 ?auto_12583 ?auto_12581 ?auto_12580 )
      ( MAKE-2PILE ?auto_12579 ?auto_12580 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_12586 - BLOCK
      ?auto_12587 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_12587 ) ( CLEAR ?auto_12586 ) ( ON-TABLE ?auto_12586 ) ( not ( = ?auto_12586 ?auto_12587 ) ) )
    :subtasks
    ( ( !STACK ?auto_12587 ?auto_12586 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_12588 - BLOCK
      ?auto_12589 - BLOCK
    )
    :vars
    (
      ?auto_12590 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_12588 ) ( ON-TABLE ?auto_12588 ) ( not ( = ?auto_12588 ?auto_12589 ) ) ( ON ?auto_12589 ?auto_12590 ) ( CLEAR ?auto_12589 ) ( HAND-EMPTY ) ( not ( = ?auto_12588 ?auto_12590 ) ) ( not ( = ?auto_12589 ?auto_12590 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_12589 ?auto_12590 )
      ( MAKE-2PILE ?auto_12588 ?auto_12589 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_12591 - BLOCK
      ?auto_12592 - BLOCK
    )
    :vars
    (
      ?auto_12593 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_12591 ?auto_12592 ) ) ( ON ?auto_12592 ?auto_12593 ) ( CLEAR ?auto_12592 ) ( not ( = ?auto_12591 ?auto_12593 ) ) ( not ( = ?auto_12592 ?auto_12593 ) ) ( HOLDING ?auto_12591 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_12591 )
      ( MAKE-2PILE ?auto_12591 ?auto_12592 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_12594 - BLOCK
      ?auto_12595 - BLOCK
    )
    :vars
    (
      ?auto_12596 - BLOCK
      ?auto_12597 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_12594 ?auto_12595 ) ) ( ON ?auto_12595 ?auto_12596 ) ( not ( = ?auto_12594 ?auto_12596 ) ) ( not ( = ?auto_12595 ?auto_12596 ) ) ( ON ?auto_12594 ?auto_12595 ) ( CLEAR ?auto_12594 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_12597 ) ( ON ?auto_12596 ?auto_12597 ) ( not ( = ?auto_12597 ?auto_12596 ) ) ( not ( = ?auto_12597 ?auto_12595 ) ) ( not ( = ?auto_12597 ?auto_12594 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_12597 ?auto_12596 ?auto_12595 )
      ( MAKE-2PILE ?auto_12594 ?auto_12595 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_12598 - BLOCK
      ?auto_12599 - BLOCK
    )
    :vars
    (
      ?auto_12600 - BLOCK
      ?auto_12601 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_12598 ?auto_12599 ) ) ( ON ?auto_12599 ?auto_12600 ) ( not ( = ?auto_12598 ?auto_12600 ) ) ( not ( = ?auto_12599 ?auto_12600 ) ) ( ON-TABLE ?auto_12601 ) ( ON ?auto_12600 ?auto_12601 ) ( not ( = ?auto_12601 ?auto_12600 ) ) ( not ( = ?auto_12601 ?auto_12599 ) ) ( not ( = ?auto_12601 ?auto_12598 ) ) ( HOLDING ?auto_12598 ) ( CLEAR ?auto_12599 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_12601 ?auto_12600 ?auto_12599 ?auto_12598 )
      ( MAKE-2PILE ?auto_12598 ?auto_12599 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_12602 - BLOCK
      ?auto_12603 - BLOCK
    )
    :vars
    (
      ?auto_12604 - BLOCK
      ?auto_12605 - BLOCK
      ?auto_12606 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_12602 ?auto_12603 ) ) ( ON ?auto_12603 ?auto_12604 ) ( not ( = ?auto_12602 ?auto_12604 ) ) ( not ( = ?auto_12603 ?auto_12604 ) ) ( ON-TABLE ?auto_12605 ) ( ON ?auto_12604 ?auto_12605 ) ( not ( = ?auto_12605 ?auto_12604 ) ) ( not ( = ?auto_12605 ?auto_12603 ) ) ( not ( = ?auto_12605 ?auto_12602 ) ) ( CLEAR ?auto_12603 ) ( ON ?auto_12602 ?auto_12606 ) ( CLEAR ?auto_12602 ) ( HAND-EMPTY ) ( not ( = ?auto_12602 ?auto_12606 ) ) ( not ( = ?auto_12603 ?auto_12606 ) ) ( not ( = ?auto_12604 ?auto_12606 ) ) ( not ( = ?auto_12605 ?auto_12606 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_12602 ?auto_12606 )
      ( MAKE-2PILE ?auto_12602 ?auto_12603 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_12607 - BLOCK
      ?auto_12608 - BLOCK
    )
    :vars
    (
      ?auto_12610 - BLOCK
      ?auto_12609 - BLOCK
      ?auto_12611 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_12607 ?auto_12608 ) ) ( not ( = ?auto_12607 ?auto_12610 ) ) ( not ( = ?auto_12608 ?auto_12610 ) ) ( ON-TABLE ?auto_12609 ) ( ON ?auto_12610 ?auto_12609 ) ( not ( = ?auto_12609 ?auto_12610 ) ) ( not ( = ?auto_12609 ?auto_12608 ) ) ( not ( = ?auto_12609 ?auto_12607 ) ) ( ON ?auto_12607 ?auto_12611 ) ( CLEAR ?auto_12607 ) ( not ( = ?auto_12607 ?auto_12611 ) ) ( not ( = ?auto_12608 ?auto_12611 ) ) ( not ( = ?auto_12610 ?auto_12611 ) ) ( not ( = ?auto_12609 ?auto_12611 ) ) ( HOLDING ?auto_12608 ) ( CLEAR ?auto_12610 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_12609 ?auto_12610 ?auto_12608 )
      ( MAKE-2PILE ?auto_12607 ?auto_12608 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_12612 - BLOCK
      ?auto_12613 - BLOCK
    )
    :vars
    (
      ?auto_12615 - BLOCK
      ?auto_12614 - BLOCK
      ?auto_12616 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_12612 ?auto_12613 ) ) ( not ( = ?auto_12612 ?auto_12615 ) ) ( not ( = ?auto_12613 ?auto_12615 ) ) ( ON-TABLE ?auto_12614 ) ( ON ?auto_12615 ?auto_12614 ) ( not ( = ?auto_12614 ?auto_12615 ) ) ( not ( = ?auto_12614 ?auto_12613 ) ) ( not ( = ?auto_12614 ?auto_12612 ) ) ( ON ?auto_12612 ?auto_12616 ) ( not ( = ?auto_12612 ?auto_12616 ) ) ( not ( = ?auto_12613 ?auto_12616 ) ) ( not ( = ?auto_12615 ?auto_12616 ) ) ( not ( = ?auto_12614 ?auto_12616 ) ) ( CLEAR ?auto_12615 ) ( ON ?auto_12613 ?auto_12612 ) ( CLEAR ?auto_12613 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_12616 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_12616 ?auto_12612 )
      ( MAKE-2PILE ?auto_12612 ?auto_12613 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_12617 - BLOCK
      ?auto_12618 - BLOCK
    )
    :vars
    (
      ?auto_12621 - BLOCK
      ?auto_12620 - BLOCK
      ?auto_12619 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_12617 ?auto_12618 ) ) ( not ( = ?auto_12617 ?auto_12621 ) ) ( not ( = ?auto_12618 ?auto_12621 ) ) ( ON-TABLE ?auto_12620 ) ( not ( = ?auto_12620 ?auto_12621 ) ) ( not ( = ?auto_12620 ?auto_12618 ) ) ( not ( = ?auto_12620 ?auto_12617 ) ) ( ON ?auto_12617 ?auto_12619 ) ( not ( = ?auto_12617 ?auto_12619 ) ) ( not ( = ?auto_12618 ?auto_12619 ) ) ( not ( = ?auto_12621 ?auto_12619 ) ) ( not ( = ?auto_12620 ?auto_12619 ) ) ( ON ?auto_12618 ?auto_12617 ) ( CLEAR ?auto_12618 ) ( ON-TABLE ?auto_12619 ) ( HOLDING ?auto_12621 ) ( CLEAR ?auto_12620 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_12620 ?auto_12621 )
      ( MAKE-2PILE ?auto_12617 ?auto_12618 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_12622 - BLOCK
      ?auto_12623 - BLOCK
    )
    :vars
    (
      ?auto_12626 - BLOCK
      ?auto_12624 - BLOCK
      ?auto_12625 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_12622 ?auto_12623 ) ) ( not ( = ?auto_12622 ?auto_12626 ) ) ( not ( = ?auto_12623 ?auto_12626 ) ) ( ON-TABLE ?auto_12624 ) ( not ( = ?auto_12624 ?auto_12626 ) ) ( not ( = ?auto_12624 ?auto_12623 ) ) ( not ( = ?auto_12624 ?auto_12622 ) ) ( ON ?auto_12622 ?auto_12625 ) ( not ( = ?auto_12622 ?auto_12625 ) ) ( not ( = ?auto_12623 ?auto_12625 ) ) ( not ( = ?auto_12626 ?auto_12625 ) ) ( not ( = ?auto_12624 ?auto_12625 ) ) ( ON ?auto_12623 ?auto_12622 ) ( ON-TABLE ?auto_12625 ) ( CLEAR ?auto_12624 ) ( ON ?auto_12626 ?auto_12623 ) ( CLEAR ?auto_12626 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_12625 ?auto_12622 ?auto_12623 )
      ( MAKE-2PILE ?auto_12622 ?auto_12623 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_12627 - BLOCK
      ?auto_12628 - BLOCK
    )
    :vars
    (
      ?auto_12630 - BLOCK
      ?auto_12631 - BLOCK
      ?auto_12629 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_12627 ?auto_12628 ) ) ( not ( = ?auto_12627 ?auto_12630 ) ) ( not ( = ?auto_12628 ?auto_12630 ) ) ( not ( = ?auto_12631 ?auto_12630 ) ) ( not ( = ?auto_12631 ?auto_12628 ) ) ( not ( = ?auto_12631 ?auto_12627 ) ) ( ON ?auto_12627 ?auto_12629 ) ( not ( = ?auto_12627 ?auto_12629 ) ) ( not ( = ?auto_12628 ?auto_12629 ) ) ( not ( = ?auto_12630 ?auto_12629 ) ) ( not ( = ?auto_12631 ?auto_12629 ) ) ( ON ?auto_12628 ?auto_12627 ) ( ON-TABLE ?auto_12629 ) ( ON ?auto_12630 ?auto_12628 ) ( CLEAR ?auto_12630 ) ( HOLDING ?auto_12631 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_12631 )
      ( MAKE-2PILE ?auto_12627 ?auto_12628 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_12632 - BLOCK
      ?auto_12633 - BLOCK
    )
    :vars
    (
      ?auto_12636 - BLOCK
      ?auto_12634 - BLOCK
      ?auto_12635 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_12632 ?auto_12633 ) ) ( not ( = ?auto_12632 ?auto_12636 ) ) ( not ( = ?auto_12633 ?auto_12636 ) ) ( not ( = ?auto_12634 ?auto_12636 ) ) ( not ( = ?auto_12634 ?auto_12633 ) ) ( not ( = ?auto_12634 ?auto_12632 ) ) ( ON ?auto_12632 ?auto_12635 ) ( not ( = ?auto_12632 ?auto_12635 ) ) ( not ( = ?auto_12633 ?auto_12635 ) ) ( not ( = ?auto_12636 ?auto_12635 ) ) ( not ( = ?auto_12634 ?auto_12635 ) ) ( ON ?auto_12633 ?auto_12632 ) ( ON-TABLE ?auto_12635 ) ( ON ?auto_12636 ?auto_12633 ) ( ON ?auto_12634 ?auto_12636 ) ( CLEAR ?auto_12634 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_12635 ?auto_12632 ?auto_12633 ?auto_12636 )
      ( MAKE-2PILE ?auto_12632 ?auto_12633 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_12638 - BLOCK
    )
    :vars
    (
      ?auto_12639 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_12639 ?auto_12638 ) ( CLEAR ?auto_12639 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_12638 ) ( not ( = ?auto_12638 ?auto_12639 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_12639 ?auto_12638 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_12640 - BLOCK
    )
    :vars
    (
      ?auto_12641 - BLOCK
      ?auto_12642 - BLOCK
      ?auto_12643 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_12641 ?auto_12640 ) ( CLEAR ?auto_12641 ) ( ON-TABLE ?auto_12640 ) ( not ( = ?auto_12640 ?auto_12641 ) ) ( HOLDING ?auto_12642 ) ( CLEAR ?auto_12643 ) ( not ( = ?auto_12640 ?auto_12642 ) ) ( not ( = ?auto_12640 ?auto_12643 ) ) ( not ( = ?auto_12641 ?auto_12642 ) ) ( not ( = ?auto_12641 ?auto_12643 ) ) ( not ( = ?auto_12642 ?auto_12643 ) ) )
    :subtasks
    ( ( !STACK ?auto_12642 ?auto_12643 )
      ( MAKE-1PILE ?auto_12640 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_12644 - BLOCK
    )
    :vars
    (
      ?auto_12647 - BLOCK
      ?auto_12646 - BLOCK
      ?auto_12645 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_12647 ?auto_12644 ) ( ON-TABLE ?auto_12644 ) ( not ( = ?auto_12644 ?auto_12647 ) ) ( CLEAR ?auto_12646 ) ( not ( = ?auto_12644 ?auto_12645 ) ) ( not ( = ?auto_12644 ?auto_12646 ) ) ( not ( = ?auto_12647 ?auto_12645 ) ) ( not ( = ?auto_12647 ?auto_12646 ) ) ( not ( = ?auto_12645 ?auto_12646 ) ) ( ON ?auto_12645 ?auto_12647 ) ( CLEAR ?auto_12645 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_12644 ?auto_12647 )
      ( MAKE-1PILE ?auto_12644 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_12648 - BLOCK
    )
    :vars
    (
      ?auto_12650 - BLOCK
      ?auto_12649 - BLOCK
      ?auto_12651 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_12650 ?auto_12648 ) ( ON-TABLE ?auto_12648 ) ( not ( = ?auto_12648 ?auto_12650 ) ) ( not ( = ?auto_12648 ?auto_12649 ) ) ( not ( = ?auto_12648 ?auto_12651 ) ) ( not ( = ?auto_12650 ?auto_12649 ) ) ( not ( = ?auto_12650 ?auto_12651 ) ) ( not ( = ?auto_12649 ?auto_12651 ) ) ( ON ?auto_12649 ?auto_12650 ) ( CLEAR ?auto_12649 ) ( HOLDING ?auto_12651 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_12651 )
      ( MAKE-1PILE ?auto_12648 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_12652 - BLOCK
    )
    :vars
    (
      ?auto_12654 - BLOCK
      ?auto_12653 - BLOCK
      ?auto_12655 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_12654 ?auto_12652 ) ( ON-TABLE ?auto_12652 ) ( not ( = ?auto_12652 ?auto_12654 ) ) ( not ( = ?auto_12652 ?auto_12653 ) ) ( not ( = ?auto_12652 ?auto_12655 ) ) ( not ( = ?auto_12654 ?auto_12653 ) ) ( not ( = ?auto_12654 ?auto_12655 ) ) ( not ( = ?auto_12653 ?auto_12655 ) ) ( ON ?auto_12653 ?auto_12654 ) ( ON ?auto_12655 ?auto_12653 ) ( CLEAR ?auto_12655 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_12652 ?auto_12654 ?auto_12653 )
      ( MAKE-1PILE ?auto_12652 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_12656 - BLOCK
    )
    :vars
    (
      ?auto_12659 - BLOCK
      ?auto_12658 - BLOCK
      ?auto_12657 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_12659 ?auto_12656 ) ( ON-TABLE ?auto_12656 ) ( not ( = ?auto_12656 ?auto_12659 ) ) ( not ( = ?auto_12656 ?auto_12658 ) ) ( not ( = ?auto_12656 ?auto_12657 ) ) ( not ( = ?auto_12659 ?auto_12658 ) ) ( not ( = ?auto_12659 ?auto_12657 ) ) ( not ( = ?auto_12658 ?auto_12657 ) ) ( ON ?auto_12658 ?auto_12659 ) ( HOLDING ?auto_12657 ) ( CLEAR ?auto_12658 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_12656 ?auto_12659 ?auto_12658 ?auto_12657 )
      ( MAKE-1PILE ?auto_12656 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_12660 - BLOCK
    )
    :vars
    (
      ?auto_12661 - BLOCK
      ?auto_12662 - BLOCK
      ?auto_12663 - BLOCK
      ?auto_12664 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_12661 ?auto_12660 ) ( ON-TABLE ?auto_12660 ) ( not ( = ?auto_12660 ?auto_12661 ) ) ( not ( = ?auto_12660 ?auto_12662 ) ) ( not ( = ?auto_12660 ?auto_12663 ) ) ( not ( = ?auto_12661 ?auto_12662 ) ) ( not ( = ?auto_12661 ?auto_12663 ) ) ( not ( = ?auto_12662 ?auto_12663 ) ) ( ON ?auto_12662 ?auto_12661 ) ( CLEAR ?auto_12662 ) ( ON ?auto_12663 ?auto_12664 ) ( CLEAR ?auto_12663 ) ( HAND-EMPTY ) ( not ( = ?auto_12660 ?auto_12664 ) ) ( not ( = ?auto_12661 ?auto_12664 ) ) ( not ( = ?auto_12662 ?auto_12664 ) ) ( not ( = ?auto_12663 ?auto_12664 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_12663 ?auto_12664 )
      ( MAKE-1PILE ?auto_12660 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_12665 - BLOCK
    )
    :vars
    (
      ?auto_12668 - BLOCK
      ?auto_12669 - BLOCK
      ?auto_12666 - BLOCK
      ?auto_12667 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_12668 ?auto_12665 ) ( ON-TABLE ?auto_12665 ) ( not ( = ?auto_12665 ?auto_12668 ) ) ( not ( = ?auto_12665 ?auto_12669 ) ) ( not ( = ?auto_12665 ?auto_12666 ) ) ( not ( = ?auto_12668 ?auto_12669 ) ) ( not ( = ?auto_12668 ?auto_12666 ) ) ( not ( = ?auto_12669 ?auto_12666 ) ) ( ON ?auto_12666 ?auto_12667 ) ( CLEAR ?auto_12666 ) ( not ( = ?auto_12665 ?auto_12667 ) ) ( not ( = ?auto_12668 ?auto_12667 ) ) ( not ( = ?auto_12669 ?auto_12667 ) ) ( not ( = ?auto_12666 ?auto_12667 ) ) ( HOLDING ?auto_12669 ) ( CLEAR ?auto_12668 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_12665 ?auto_12668 ?auto_12669 )
      ( MAKE-1PILE ?auto_12665 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_12670 - BLOCK
    )
    :vars
    (
      ?auto_12671 - BLOCK
      ?auto_12674 - BLOCK
      ?auto_12672 - BLOCK
      ?auto_12673 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_12671 ?auto_12670 ) ( ON-TABLE ?auto_12670 ) ( not ( = ?auto_12670 ?auto_12671 ) ) ( not ( = ?auto_12670 ?auto_12674 ) ) ( not ( = ?auto_12670 ?auto_12672 ) ) ( not ( = ?auto_12671 ?auto_12674 ) ) ( not ( = ?auto_12671 ?auto_12672 ) ) ( not ( = ?auto_12674 ?auto_12672 ) ) ( ON ?auto_12672 ?auto_12673 ) ( not ( = ?auto_12670 ?auto_12673 ) ) ( not ( = ?auto_12671 ?auto_12673 ) ) ( not ( = ?auto_12674 ?auto_12673 ) ) ( not ( = ?auto_12672 ?auto_12673 ) ) ( CLEAR ?auto_12671 ) ( ON ?auto_12674 ?auto_12672 ) ( CLEAR ?auto_12674 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_12673 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_12673 ?auto_12672 )
      ( MAKE-1PILE ?auto_12670 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_12685 - BLOCK
    )
    :vars
    (
      ?auto_12689 - BLOCK
      ?auto_12687 - BLOCK
      ?auto_12686 - BLOCK
      ?auto_12688 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_12685 ?auto_12689 ) ) ( not ( = ?auto_12685 ?auto_12687 ) ) ( not ( = ?auto_12685 ?auto_12686 ) ) ( not ( = ?auto_12689 ?auto_12687 ) ) ( not ( = ?auto_12689 ?auto_12686 ) ) ( not ( = ?auto_12687 ?auto_12686 ) ) ( ON ?auto_12686 ?auto_12688 ) ( not ( = ?auto_12685 ?auto_12688 ) ) ( not ( = ?auto_12689 ?auto_12688 ) ) ( not ( = ?auto_12687 ?auto_12688 ) ) ( not ( = ?auto_12686 ?auto_12688 ) ) ( ON ?auto_12687 ?auto_12686 ) ( ON-TABLE ?auto_12688 ) ( ON ?auto_12689 ?auto_12687 ) ( CLEAR ?auto_12689 ) ( HOLDING ?auto_12685 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_12685 ?auto_12689 )
      ( MAKE-1PILE ?auto_12685 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_12690 - BLOCK
    )
    :vars
    (
      ?auto_12691 - BLOCK
      ?auto_12694 - BLOCK
      ?auto_12693 - BLOCK
      ?auto_12692 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_12690 ?auto_12691 ) ) ( not ( = ?auto_12690 ?auto_12694 ) ) ( not ( = ?auto_12690 ?auto_12693 ) ) ( not ( = ?auto_12691 ?auto_12694 ) ) ( not ( = ?auto_12691 ?auto_12693 ) ) ( not ( = ?auto_12694 ?auto_12693 ) ) ( ON ?auto_12693 ?auto_12692 ) ( not ( = ?auto_12690 ?auto_12692 ) ) ( not ( = ?auto_12691 ?auto_12692 ) ) ( not ( = ?auto_12694 ?auto_12692 ) ) ( not ( = ?auto_12693 ?auto_12692 ) ) ( ON ?auto_12694 ?auto_12693 ) ( ON-TABLE ?auto_12692 ) ( ON ?auto_12691 ?auto_12694 ) ( ON ?auto_12690 ?auto_12691 ) ( CLEAR ?auto_12690 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_12692 ?auto_12693 ?auto_12694 ?auto_12691 )
      ( MAKE-1PILE ?auto_12690 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_12698 - BLOCK
      ?auto_12699 - BLOCK
      ?auto_12700 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_12700 ) ( CLEAR ?auto_12699 ) ( ON-TABLE ?auto_12698 ) ( ON ?auto_12699 ?auto_12698 ) ( not ( = ?auto_12698 ?auto_12699 ) ) ( not ( = ?auto_12698 ?auto_12700 ) ) ( not ( = ?auto_12699 ?auto_12700 ) ) )
    :subtasks
    ( ( !STACK ?auto_12700 ?auto_12699 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_12701 - BLOCK
      ?auto_12702 - BLOCK
      ?auto_12703 - BLOCK
    )
    :vars
    (
      ?auto_12704 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_12702 ) ( ON-TABLE ?auto_12701 ) ( ON ?auto_12702 ?auto_12701 ) ( not ( = ?auto_12701 ?auto_12702 ) ) ( not ( = ?auto_12701 ?auto_12703 ) ) ( not ( = ?auto_12702 ?auto_12703 ) ) ( ON ?auto_12703 ?auto_12704 ) ( CLEAR ?auto_12703 ) ( HAND-EMPTY ) ( not ( = ?auto_12701 ?auto_12704 ) ) ( not ( = ?auto_12702 ?auto_12704 ) ) ( not ( = ?auto_12703 ?auto_12704 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_12703 ?auto_12704 )
      ( MAKE-3PILE ?auto_12701 ?auto_12702 ?auto_12703 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_12705 - BLOCK
      ?auto_12706 - BLOCK
      ?auto_12707 - BLOCK
    )
    :vars
    (
      ?auto_12708 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_12705 ) ( not ( = ?auto_12705 ?auto_12706 ) ) ( not ( = ?auto_12705 ?auto_12707 ) ) ( not ( = ?auto_12706 ?auto_12707 ) ) ( ON ?auto_12707 ?auto_12708 ) ( CLEAR ?auto_12707 ) ( not ( = ?auto_12705 ?auto_12708 ) ) ( not ( = ?auto_12706 ?auto_12708 ) ) ( not ( = ?auto_12707 ?auto_12708 ) ) ( HOLDING ?auto_12706 ) ( CLEAR ?auto_12705 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_12705 ?auto_12706 )
      ( MAKE-3PILE ?auto_12705 ?auto_12706 ?auto_12707 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_12709 - BLOCK
      ?auto_12710 - BLOCK
      ?auto_12711 - BLOCK
    )
    :vars
    (
      ?auto_12712 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_12709 ) ( not ( = ?auto_12709 ?auto_12710 ) ) ( not ( = ?auto_12709 ?auto_12711 ) ) ( not ( = ?auto_12710 ?auto_12711 ) ) ( ON ?auto_12711 ?auto_12712 ) ( not ( = ?auto_12709 ?auto_12712 ) ) ( not ( = ?auto_12710 ?auto_12712 ) ) ( not ( = ?auto_12711 ?auto_12712 ) ) ( CLEAR ?auto_12709 ) ( ON ?auto_12710 ?auto_12711 ) ( CLEAR ?auto_12710 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_12712 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_12712 ?auto_12711 )
      ( MAKE-3PILE ?auto_12709 ?auto_12710 ?auto_12711 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_12713 - BLOCK
      ?auto_12714 - BLOCK
      ?auto_12715 - BLOCK
    )
    :vars
    (
      ?auto_12716 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_12713 ?auto_12714 ) ) ( not ( = ?auto_12713 ?auto_12715 ) ) ( not ( = ?auto_12714 ?auto_12715 ) ) ( ON ?auto_12715 ?auto_12716 ) ( not ( = ?auto_12713 ?auto_12716 ) ) ( not ( = ?auto_12714 ?auto_12716 ) ) ( not ( = ?auto_12715 ?auto_12716 ) ) ( ON ?auto_12714 ?auto_12715 ) ( CLEAR ?auto_12714 ) ( ON-TABLE ?auto_12716 ) ( HOLDING ?auto_12713 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_12713 )
      ( MAKE-3PILE ?auto_12713 ?auto_12714 ?auto_12715 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_12717 - BLOCK
      ?auto_12718 - BLOCK
      ?auto_12719 - BLOCK
    )
    :vars
    (
      ?auto_12720 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_12717 ?auto_12718 ) ) ( not ( = ?auto_12717 ?auto_12719 ) ) ( not ( = ?auto_12718 ?auto_12719 ) ) ( ON ?auto_12719 ?auto_12720 ) ( not ( = ?auto_12717 ?auto_12720 ) ) ( not ( = ?auto_12718 ?auto_12720 ) ) ( not ( = ?auto_12719 ?auto_12720 ) ) ( ON ?auto_12718 ?auto_12719 ) ( ON-TABLE ?auto_12720 ) ( ON ?auto_12717 ?auto_12718 ) ( CLEAR ?auto_12717 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_12720 ?auto_12719 ?auto_12718 )
      ( MAKE-3PILE ?auto_12717 ?auto_12718 ?auto_12719 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_12721 - BLOCK
      ?auto_12722 - BLOCK
      ?auto_12723 - BLOCK
    )
    :vars
    (
      ?auto_12724 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_12721 ?auto_12722 ) ) ( not ( = ?auto_12721 ?auto_12723 ) ) ( not ( = ?auto_12722 ?auto_12723 ) ) ( ON ?auto_12723 ?auto_12724 ) ( not ( = ?auto_12721 ?auto_12724 ) ) ( not ( = ?auto_12722 ?auto_12724 ) ) ( not ( = ?auto_12723 ?auto_12724 ) ) ( ON ?auto_12722 ?auto_12723 ) ( ON-TABLE ?auto_12724 ) ( HOLDING ?auto_12721 ) ( CLEAR ?auto_12722 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_12724 ?auto_12723 ?auto_12722 ?auto_12721 )
      ( MAKE-3PILE ?auto_12721 ?auto_12722 ?auto_12723 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_12725 - BLOCK
      ?auto_12726 - BLOCK
      ?auto_12727 - BLOCK
    )
    :vars
    (
      ?auto_12728 - BLOCK
      ?auto_12729 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_12725 ?auto_12726 ) ) ( not ( = ?auto_12725 ?auto_12727 ) ) ( not ( = ?auto_12726 ?auto_12727 ) ) ( ON ?auto_12727 ?auto_12728 ) ( not ( = ?auto_12725 ?auto_12728 ) ) ( not ( = ?auto_12726 ?auto_12728 ) ) ( not ( = ?auto_12727 ?auto_12728 ) ) ( ON ?auto_12726 ?auto_12727 ) ( ON-TABLE ?auto_12728 ) ( CLEAR ?auto_12726 ) ( ON ?auto_12725 ?auto_12729 ) ( CLEAR ?auto_12725 ) ( HAND-EMPTY ) ( not ( = ?auto_12725 ?auto_12729 ) ) ( not ( = ?auto_12726 ?auto_12729 ) ) ( not ( = ?auto_12727 ?auto_12729 ) ) ( not ( = ?auto_12728 ?auto_12729 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_12725 ?auto_12729 )
      ( MAKE-3PILE ?auto_12725 ?auto_12726 ?auto_12727 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_12730 - BLOCK
      ?auto_12731 - BLOCK
      ?auto_12732 - BLOCK
    )
    :vars
    (
      ?auto_12734 - BLOCK
      ?auto_12733 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_12730 ?auto_12731 ) ) ( not ( = ?auto_12730 ?auto_12732 ) ) ( not ( = ?auto_12731 ?auto_12732 ) ) ( ON ?auto_12732 ?auto_12734 ) ( not ( = ?auto_12730 ?auto_12734 ) ) ( not ( = ?auto_12731 ?auto_12734 ) ) ( not ( = ?auto_12732 ?auto_12734 ) ) ( ON-TABLE ?auto_12734 ) ( ON ?auto_12730 ?auto_12733 ) ( CLEAR ?auto_12730 ) ( not ( = ?auto_12730 ?auto_12733 ) ) ( not ( = ?auto_12731 ?auto_12733 ) ) ( not ( = ?auto_12732 ?auto_12733 ) ) ( not ( = ?auto_12734 ?auto_12733 ) ) ( HOLDING ?auto_12731 ) ( CLEAR ?auto_12732 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_12734 ?auto_12732 ?auto_12731 )
      ( MAKE-3PILE ?auto_12730 ?auto_12731 ?auto_12732 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_12735 - BLOCK
      ?auto_12736 - BLOCK
      ?auto_12737 - BLOCK
    )
    :vars
    (
      ?auto_12739 - BLOCK
      ?auto_12738 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_12735 ?auto_12736 ) ) ( not ( = ?auto_12735 ?auto_12737 ) ) ( not ( = ?auto_12736 ?auto_12737 ) ) ( ON ?auto_12737 ?auto_12739 ) ( not ( = ?auto_12735 ?auto_12739 ) ) ( not ( = ?auto_12736 ?auto_12739 ) ) ( not ( = ?auto_12737 ?auto_12739 ) ) ( ON-TABLE ?auto_12739 ) ( ON ?auto_12735 ?auto_12738 ) ( not ( = ?auto_12735 ?auto_12738 ) ) ( not ( = ?auto_12736 ?auto_12738 ) ) ( not ( = ?auto_12737 ?auto_12738 ) ) ( not ( = ?auto_12739 ?auto_12738 ) ) ( CLEAR ?auto_12737 ) ( ON ?auto_12736 ?auto_12735 ) ( CLEAR ?auto_12736 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_12738 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_12738 ?auto_12735 )
      ( MAKE-3PILE ?auto_12735 ?auto_12736 ?auto_12737 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_12740 - BLOCK
      ?auto_12741 - BLOCK
      ?auto_12742 - BLOCK
    )
    :vars
    (
      ?auto_12743 - BLOCK
      ?auto_12744 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_12740 ?auto_12741 ) ) ( not ( = ?auto_12740 ?auto_12742 ) ) ( not ( = ?auto_12741 ?auto_12742 ) ) ( not ( = ?auto_12740 ?auto_12743 ) ) ( not ( = ?auto_12741 ?auto_12743 ) ) ( not ( = ?auto_12742 ?auto_12743 ) ) ( ON-TABLE ?auto_12743 ) ( ON ?auto_12740 ?auto_12744 ) ( not ( = ?auto_12740 ?auto_12744 ) ) ( not ( = ?auto_12741 ?auto_12744 ) ) ( not ( = ?auto_12742 ?auto_12744 ) ) ( not ( = ?auto_12743 ?auto_12744 ) ) ( ON ?auto_12741 ?auto_12740 ) ( CLEAR ?auto_12741 ) ( ON-TABLE ?auto_12744 ) ( HOLDING ?auto_12742 ) ( CLEAR ?auto_12743 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_12743 ?auto_12742 )
      ( MAKE-3PILE ?auto_12740 ?auto_12741 ?auto_12742 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_12745 - BLOCK
      ?auto_12746 - BLOCK
      ?auto_12747 - BLOCK
    )
    :vars
    (
      ?auto_12748 - BLOCK
      ?auto_12749 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_12745 ?auto_12746 ) ) ( not ( = ?auto_12745 ?auto_12747 ) ) ( not ( = ?auto_12746 ?auto_12747 ) ) ( not ( = ?auto_12745 ?auto_12748 ) ) ( not ( = ?auto_12746 ?auto_12748 ) ) ( not ( = ?auto_12747 ?auto_12748 ) ) ( ON-TABLE ?auto_12748 ) ( ON ?auto_12745 ?auto_12749 ) ( not ( = ?auto_12745 ?auto_12749 ) ) ( not ( = ?auto_12746 ?auto_12749 ) ) ( not ( = ?auto_12747 ?auto_12749 ) ) ( not ( = ?auto_12748 ?auto_12749 ) ) ( ON ?auto_12746 ?auto_12745 ) ( ON-TABLE ?auto_12749 ) ( CLEAR ?auto_12748 ) ( ON ?auto_12747 ?auto_12746 ) ( CLEAR ?auto_12747 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_12749 ?auto_12745 ?auto_12746 )
      ( MAKE-3PILE ?auto_12745 ?auto_12746 ?auto_12747 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_12750 - BLOCK
      ?auto_12751 - BLOCK
      ?auto_12752 - BLOCK
    )
    :vars
    (
      ?auto_12753 - BLOCK
      ?auto_12754 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_12750 ?auto_12751 ) ) ( not ( = ?auto_12750 ?auto_12752 ) ) ( not ( = ?auto_12751 ?auto_12752 ) ) ( not ( = ?auto_12750 ?auto_12753 ) ) ( not ( = ?auto_12751 ?auto_12753 ) ) ( not ( = ?auto_12752 ?auto_12753 ) ) ( ON ?auto_12750 ?auto_12754 ) ( not ( = ?auto_12750 ?auto_12754 ) ) ( not ( = ?auto_12751 ?auto_12754 ) ) ( not ( = ?auto_12752 ?auto_12754 ) ) ( not ( = ?auto_12753 ?auto_12754 ) ) ( ON ?auto_12751 ?auto_12750 ) ( ON-TABLE ?auto_12754 ) ( ON ?auto_12752 ?auto_12751 ) ( CLEAR ?auto_12752 ) ( HOLDING ?auto_12753 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_12753 )
      ( MAKE-3PILE ?auto_12750 ?auto_12751 ?auto_12752 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_12755 - BLOCK
      ?auto_12756 - BLOCK
      ?auto_12757 - BLOCK
    )
    :vars
    (
      ?auto_12759 - BLOCK
      ?auto_12758 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_12755 ?auto_12756 ) ) ( not ( = ?auto_12755 ?auto_12757 ) ) ( not ( = ?auto_12756 ?auto_12757 ) ) ( not ( = ?auto_12755 ?auto_12759 ) ) ( not ( = ?auto_12756 ?auto_12759 ) ) ( not ( = ?auto_12757 ?auto_12759 ) ) ( ON ?auto_12755 ?auto_12758 ) ( not ( = ?auto_12755 ?auto_12758 ) ) ( not ( = ?auto_12756 ?auto_12758 ) ) ( not ( = ?auto_12757 ?auto_12758 ) ) ( not ( = ?auto_12759 ?auto_12758 ) ) ( ON ?auto_12756 ?auto_12755 ) ( ON-TABLE ?auto_12758 ) ( ON ?auto_12757 ?auto_12756 ) ( ON ?auto_12759 ?auto_12757 ) ( CLEAR ?auto_12759 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_12758 ?auto_12755 ?auto_12756 ?auto_12757 )
      ( MAKE-3PILE ?auto_12755 ?auto_12756 ?auto_12757 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_12764 - BLOCK
      ?auto_12765 - BLOCK
      ?auto_12766 - BLOCK
      ?auto_12767 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_12767 ) ( CLEAR ?auto_12766 ) ( ON-TABLE ?auto_12764 ) ( ON ?auto_12765 ?auto_12764 ) ( ON ?auto_12766 ?auto_12765 ) ( not ( = ?auto_12764 ?auto_12765 ) ) ( not ( = ?auto_12764 ?auto_12766 ) ) ( not ( = ?auto_12764 ?auto_12767 ) ) ( not ( = ?auto_12765 ?auto_12766 ) ) ( not ( = ?auto_12765 ?auto_12767 ) ) ( not ( = ?auto_12766 ?auto_12767 ) ) )
    :subtasks
    ( ( !STACK ?auto_12767 ?auto_12766 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_12768 - BLOCK
      ?auto_12769 - BLOCK
      ?auto_12770 - BLOCK
      ?auto_12771 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_12770 ) ( ON-TABLE ?auto_12768 ) ( ON ?auto_12769 ?auto_12768 ) ( ON ?auto_12770 ?auto_12769 ) ( not ( = ?auto_12768 ?auto_12769 ) ) ( not ( = ?auto_12768 ?auto_12770 ) ) ( not ( = ?auto_12768 ?auto_12771 ) ) ( not ( = ?auto_12769 ?auto_12770 ) ) ( not ( = ?auto_12769 ?auto_12771 ) ) ( not ( = ?auto_12770 ?auto_12771 ) ) ( ON-TABLE ?auto_12771 ) ( CLEAR ?auto_12771 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_12771 )
      ( MAKE-4PILE ?auto_12768 ?auto_12769 ?auto_12770 ?auto_12771 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_12772 - BLOCK
      ?auto_12773 - BLOCK
      ?auto_12774 - BLOCK
      ?auto_12775 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_12772 ) ( ON ?auto_12773 ?auto_12772 ) ( not ( = ?auto_12772 ?auto_12773 ) ) ( not ( = ?auto_12772 ?auto_12774 ) ) ( not ( = ?auto_12772 ?auto_12775 ) ) ( not ( = ?auto_12773 ?auto_12774 ) ) ( not ( = ?auto_12773 ?auto_12775 ) ) ( not ( = ?auto_12774 ?auto_12775 ) ) ( ON-TABLE ?auto_12775 ) ( CLEAR ?auto_12775 ) ( HOLDING ?auto_12774 ) ( CLEAR ?auto_12773 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_12772 ?auto_12773 ?auto_12774 )
      ( MAKE-4PILE ?auto_12772 ?auto_12773 ?auto_12774 ?auto_12775 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_12776 - BLOCK
      ?auto_12777 - BLOCK
      ?auto_12778 - BLOCK
      ?auto_12779 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_12776 ) ( ON ?auto_12777 ?auto_12776 ) ( not ( = ?auto_12776 ?auto_12777 ) ) ( not ( = ?auto_12776 ?auto_12778 ) ) ( not ( = ?auto_12776 ?auto_12779 ) ) ( not ( = ?auto_12777 ?auto_12778 ) ) ( not ( = ?auto_12777 ?auto_12779 ) ) ( not ( = ?auto_12778 ?auto_12779 ) ) ( ON-TABLE ?auto_12779 ) ( CLEAR ?auto_12777 ) ( ON ?auto_12778 ?auto_12779 ) ( CLEAR ?auto_12778 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_12779 )
      ( MAKE-4PILE ?auto_12776 ?auto_12777 ?auto_12778 ?auto_12779 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_12780 - BLOCK
      ?auto_12781 - BLOCK
      ?auto_12782 - BLOCK
      ?auto_12783 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_12780 ) ( not ( = ?auto_12780 ?auto_12781 ) ) ( not ( = ?auto_12780 ?auto_12782 ) ) ( not ( = ?auto_12780 ?auto_12783 ) ) ( not ( = ?auto_12781 ?auto_12782 ) ) ( not ( = ?auto_12781 ?auto_12783 ) ) ( not ( = ?auto_12782 ?auto_12783 ) ) ( ON-TABLE ?auto_12783 ) ( ON ?auto_12782 ?auto_12783 ) ( CLEAR ?auto_12782 ) ( HOLDING ?auto_12781 ) ( CLEAR ?auto_12780 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_12780 ?auto_12781 )
      ( MAKE-4PILE ?auto_12780 ?auto_12781 ?auto_12782 ?auto_12783 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_12784 - BLOCK
      ?auto_12785 - BLOCK
      ?auto_12786 - BLOCK
      ?auto_12787 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_12784 ) ( not ( = ?auto_12784 ?auto_12785 ) ) ( not ( = ?auto_12784 ?auto_12786 ) ) ( not ( = ?auto_12784 ?auto_12787 ) ) ( not ( = ?auto_12785 ?auto_12786 ) ) ( not ( = ?auto_12785 ?auto_12787 ) ) ( not ( = ?auto_12786 ?auto_12787 ) ) ( ON-TABLE ?auto_12787 ) ( ON ?auto_12786 ?auto_12787 ) ( CLEAR ?auto_12784 ) ( ON ?auto_12785 ?auto_12786 ) ( CLEAR ?auto_12785 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_12787 ?auto_12786 )
      ( MAKE-4PILE ?auto_12784 ?auto_12785 ?auto_12786 ?auto_12787 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_12788 - BLOCK
      ?auto_12789 - BLOCK
      ?auto_12790 - BLOCK
      ?auto_12791 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_12788 ?auto_12789 ) ) ( not ( = ?auto_12788 ?auto_12790 ) ) ( not ( = ?auto_12788 ?auto_12791 ) ) ( not ( = ?auto_12789 ?auto_12790 ) ) ( not ( = ?auto_12789 ?auto_12791 ) ) ( not ( = ?auto_12790 ?auto_12791 ) ) ( ON-TABLE ?auto_12791 ) ( ON ?auto_12790 ?auto_12791 ) ( ON ?auto_12789 ?auto_12790 ) ( CLEAR ?auto_12789 ) ( HOLDING ?auto_12788 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_12788 )
      ( MAKE-4PILE ?auto_12788 ?auto_12789 ?auto_12790 ?auto_12791 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_12792 - BLOCK
      ?auto_12793 - BLOCK
      ?auto_12794 - BLOCK
      ?auto_12795 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_12792 ?auto_12793 ) ) ( not ( = ?auto_12792 ?auto_12794 ) ) ( not ( = ?auto_12792 ?auto_12795 ) ) ( not ( = ?auto_12793 ?auto_12794 ) ) ( not ( = ?auto_12793 ?auto_12795 ) ) ( not ( = ?auto_12794 ?auto_12795 ) ) ( ON-TABLE ?auto_12795 ) ( ON ?auto_12794 ?auto_12795 ) ( ON ?auto_12793 ?auto_12794 ) ( ON ?auto_12792 ?auto_12793 ) ( CLEAR ?auto_12792 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_12795 ?auto_12794 ?auto_12793 )
      ( MAKE-4PILE ?auto_12792 ?auto_12793 ?auto_12794 ?auto_12795 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_12796 - BLOCK
      ?auto_12797 - BLOCK
      ?auto_12798 - BLOCK
      ?auto_12799 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_12796 ?auto_12797 ) ) ( not ( = ?auto_12796 ?auto_12798 ) ) ( not ( = ?auto_12796 ?auto_12799 ) ) ( not ( = ?auto_12797 ?auto_12798 ) ) ( not ( = ?auto_12797 ?auto_12799 ) ) ( not ( = ?auto_12798 ?auto_12799 ) ) ( ON-TABLE ?auto_12799 ) ( ON ?auto_12798 ?auto_12799 ) ( ON ?auto_12797 ?auto_12798 ) ( HOLDING ?auto_12796 ) ( CLEAR ?auto_12797 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_12799 ?auto_12798 ?auto_12797 ?auto_12796 )
      ( MAKE-4PILE ?auto_12796 ?auto_12797 ?auto_12798 ?auto_12799 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_12800 - BLOCK
      ?auto_12801 - BLOCK
      ?auto_12802 - BLOCK
      ?auto_12803 - BLOCK
    )
    :vars
    (
      ?auto_12804 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_12800 ?auto_12801 ) ) ( not ( = ?auto_12800 ?auto_12802 ) ) ( not ( = ?auto_12800 ?auto_12803 ) ) ( not ( = ?auto_12801 ?auto_12802 ) ) ( not ( = ?auto_12801 ?auto_12803 ) ) ( not ( = ?auto_12802 ?auto_12803 ) ) ( ON-TABLE ?auto_12803 ) ( ON ?auto_12802 ?auto_12803 ) ( ON ?auto_12801 ?auto_12802 ) ( CLEAR ?auto_12801 ) ( ON ?auto_12800 ?auto_12804 ) ( CLEAR ?auto_12800 ) ( HAND-EMPTY ) ( not ( = ?auto_12800 ?auto_12804 ) ) ( not ( = ?auto_12801 ?auto_12804 ) ) ( not ( = ?auto_12802 ?auto_12804 ) ) ( not ( = ?auto_12803 ?auto_12804 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_12800 ?auto_12804 )
      ( MAKE-4PILE ?auto_12800 ?auto_12801 ?auto_12802 ?auto_12803 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_12805 - BLOCK
      ?auto_12806 - BLOCK
      ?auto_12807 - BLOCK
      ?auto_12808 - BLOCK
    )
    :vars
    (
      ?auto_12809 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_12805 ?auto_12806 ) ) ( not ( = ?auto_12805 ?auto_12807 ) ) ( not ( = ?auto_12805 ?auto_12808 ) ) ( not ( = ?auto_12806 ?auto_12807 ) ) ( not ( = ?auto_12806 ?auto_12808 ) ) ( not ( = ?auto_12807 ?auto_12808 ) ) ( ON-TABLE ?auto_12808 ) ( ON ?auto_12807 ?auto_12808 ) ( ON ?auto_12805 ?auto_12809 ) ( CLEAR ?auto_12805 ) ( not ( = ?auto_12805 ?auto_12809 ) ) ( not ( = ?auto_12806 ?auto_12809 ) ) ( not ( = ?auto_12807 ?auto_12809 ) ) ( not ( = ?auto_12808 ?auto_12809 ) ) ( HOLDING ?auto_12806 ) ( CLEAR ?auto_12807 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_12808 ?auto_12807 ?auto_12806 )
      ( MAKE-4PILE ?auto_12805 ?auto_12806 ?auto_12807 ?auto_12808 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_12810 - BLOCK
      ?auto_12811 - BLOCK
      ?auto_12812 - BLOCK
      ?auto_12813 - BLOCK
    )
    :vars
    (
      ?auto_12814 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_12810 ?auto_12811 ) ) ( not ( = ?auto_12810 ?auto_12812 ) ) ( not ( = ?auto_12810 ?auto_12813 ) ) ( not ( = ?auto_12811 ?auto_12812 ) ) ( not ( = ?auto_12811 ?auto_12813 ) ) ( not ( = ?auto_12812 ?auto_12813 ) ) ( ON-TABLE ?auto_12813 ) ( ON ?auto_12812 ?auto_12813 ) ( ON ?auto_12810 ?auto_12814 ) ( not ( = ?auto_12810 ?auto_12814 ) ) ( not ( = ?auto_12811 ?auto_12814 ) ) ( not ( = ?auto_12812 ?auto_12814 ) ) ( not ( = ?auto_12813 ?auto_12814 ) ) ( CLEAR ?auto_12812 ) ( ON ?auto_12811 ?auto_12810 ) ( CLEAR ?auto_12811 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_12814 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_12814 ?auto_12810 )
      ( MAKE-4PILE ?auto_12810 ?auto_12811 ?auto_12812 ?auto_12813 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_12815 - BLOCK
      ?auto_12816 - BLOCK
      ?auto_12817 - BLOCK
      ?auto_12818 - BLOCK
    )
    :vars
    (
      ?auto_12819 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_12815 ?auto_12816 ) ) ( not ( = ?auto_12815 ?auto_12817 ) ) ( not ( = ?auto_12815 ?auto_12818 ) ) ( not ( = ?auto_12816 ?auto_12817 ) ) ( not ( = ?auto_12816 ?auto_12818 ) ) ( not ( = ?auto_12817 ?auto_12818 ) ) ( ON-TABLE ?auto_12818 ) ( ON ?auto_12815 ?auto_12819 ) ( not ( = ?auto_12815 ?auto_12819 ) ) ( not ( = ?auto_12816 ?auto_12819 ) ) ( not ( = ?auto_12817 ?auto_12819 ) ) ( not ( = ?auto_12818 ?auto_12819 ) ) ( ON ?auto_12816 ?auto_12815 ) ( CLEAR ?auto_12816 ) ( ON-TABLE ?auto_12819 ) ( HOLDING ?auto_12817 ) ( CLEAR ?auto_12818 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_12818 ?auto_12817 )
      ( MAKE-4PILE ?auto_12815 ?auto_12816 ?auto_12817 ?auto_12818 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_12820 - BLOCK
      ?auto_12821 - BLOCK
      ?auto_12822 - BLOCK
      ?auto_12823 - BLOCK
    )
    :vars
    (
      ?auto_12824 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_12820 ?auto_12821 ) ) ( not ( = ?auto_12820 ?auto_12822 ) ) ( not ( = ?auto_12820 ?auto_12823 ) ) ( not ( = ?auto_12821 ?auto_12822 ) ) ( not ( = ?auto_12821 ?auto_12823 ) ) ( not ( = ?auto_12822 ?auto_12823 ) ) ( ON-TABLE ?auto_12823 ) ( ON ?auto_12820 ?auto_12824 ) ( not ( = ?auto_12820 ?auto_12824 ) ) ( not ( = ?auto_12821 ?auto_12824 ) ) ( not ( = ?auto_12822 ?auto_12824 ) ) ( not ( = ?auto_12823 ?auto_12824 ) ) ( ON ?auto_12821 ?auto_12820 ) ( ON-TABLE ?auto_12824 ) ( CLEAR ?auto_12823 ) ( ON ?auto_12822 ?auto_12821 ) ( CLEAR ?auto_12822 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_12824 ?auto_12820 ?auto_12821 )
      ( MAKE-4PILE ?auto_12820 ?auto_12821 ?auto_12822 ?auto_12823 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_12825 - BLOCK
      ?auto_12826 - BLOCK
      ?auto_12827 - BLOCK
      ?auto_12828 - BLOCK
    )
    :vars
    (
      ?auto_12829 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_12825 ?auto_12826 ) ) ( not ( = ?auto_12825 ?auto_12827 ) ) ( not ( = ?auto_12825 ?auto_12828 ) ) ( not ( = ?auto_12826 ?auto_12827 ) ) ( not ( = ?auto_12826 ?auto_12828 ) ) ( not ( = ?auto_12827 ?auto_12828 ) ) ( ON ?auto_12825 ?auto_12829 ) ( not ( = ?auto_12825 ?auto_12829 ) ) ( not ( = ?auto_12826 ?auto_12829 ) ) ( not ( = ?auto_12827 ?auto_12829 ) ) ( not ( = ?auto_12828 ?auto_12829 ) ) ( ON ?auto_12826 ?auto_12825 ) ( ON-TABLE ?auto_12829 ) ( ON ?auto_12827 ?auto_12826 ) ( CLEAR ?auto_12827 ) ( HOLDING ?auto_12828 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_12828 )
      ( MAKE-4PILE ?auto_12825 ?auto_12826 ?auto_12827 ?auto_12828 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_12830 - BLOCK
      ?auto_12831 - BLOCK
      ?auto_12832 - BLOCK
      ?auto_12833 - BLOCK
    )
    :vars
    (
      ?auto_12834 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_12830 ?auto_12831 ) ) ( not ( = ?auto_12830 ?auto_12832 ) ) ( not ( = ?auto_12830 ?auto_12833 ) ) ( not ( = ?auto_12831 ?auto_12832 ) ) ( not ( = ?auto_12831 ?auto_12833 ) ) ( not ( = ?auto_12832 ?auto_12833 ) ) ( ON ?auto_12830 ?auto_12834 ) ( not ( = ?auto_12830 ?auto_12834 ) ) ( not ( = ?auto_12831 ?auto_12834 ) ) ( not ( = ?auto_12832 ?auto_12834 ) ) ( not ( = ?auto_12833 ?auto_12834 ) ) ( ON ?auto_12831 ?auto_12830 ) ( ON-TABLE ?auto_12834 ) ( ON ?auto_12832 ?auto_12831 ) ( ON ?auto_12833 ?auto_12832 ) ( CLEAR ?auto_12833 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_12834 ?auto_12830 ?auto_12831 ?auto_12832 )
      ( MAKE-4PILE ?auto_12830 ?auto_12831 ?auto_12832 ?auto_12833 ) )
  )

)

