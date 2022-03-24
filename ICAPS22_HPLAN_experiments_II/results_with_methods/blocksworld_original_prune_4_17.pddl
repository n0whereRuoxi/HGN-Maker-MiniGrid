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
      ?auto_14288 - BLOCK
      ?auto_14289 - BLOCK
      ?auto_14290 - BLOCK
      ?auto_14291 - BLOCK
    )
    :vars
    (
      ?auto_14292 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_14292 ?auto_14291 ) ( CLEAR ?auto_14292 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_14288 ) ( ON ?auto_14289 ?auto_14288 ) ( ON ?auto_14290 ?auto_14289 ) ( ON ?auto_14291 ?auto_14290 ) ( not ( = ?auto_14288 ?auto_14289 ) ) ( not ( = ?auto_14288 ?auto_14290 ) ) ( not ( = ?auto_14288 ?auto_14291 ) ) ( not ( = ?auto_14288 ?auto_14292 ) ) ( not ( = ?auto_14289 ?auto_14290 ) ) ( not ( = ?auto_14289 ?auto_14291 ) ) ( not ( = ?auto_14289 ?auto_14292 ) ) ( not ( = ?auto_14290 ?auto_14291 ) ) ( not ( = ?auto_14290 ?auto_14292 ) ) ( not ( = ?auto_14291 ?auto_14292 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_14292 ?auto_14291 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_14294 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_14294 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_14294 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_14295 - BLOCK
    )
    :vars
    (
      ?auto_14296 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_14295 ?auto_14296 ) ( CLEAR ?auto_14295 ) ( HAND-EMPTY ) ( not ( = ?auto_14295 ?auto_14296 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_14295 ?auto_14296 )
      ( MAKE-1PILE ?auto_14295 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_14300 - BLOCK
      ?auto_14301 - BLOCK
      ?auto_14302 - BLOCK
    )
    :vars
    (
      ?auto_14303 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_14303 ?auto_14302 ) ( CLEAR ?auto_14303 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_14300 ) ( ON ?auto_14301 ?auto_14300 ) ( ON ?auto_14302 ?auto_14301 ) ( not ( = ?auto_14300 ?auto_14301 ) ) ( not ( = ?auto_14300 ?auto_14302 ) ) ( not ( = ?auto_14300 ?auto_14303 ) ) ( not ( = ?auto_14301 ?auto_14302 ) ) ( not ( = ?auto_14301 ?auto_14303 ) ) ( not ( = ?auto_14302 ?auto_14303 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_14303 ?auto_14302 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_14304 - BLOCK
      ?auto_14305 - BLOCK
      ?auto_14306 - BLOCK
    )
    :vars
    (
      ?auto_14307 - BLOCK
      ?auto_14308 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_14307 ?auto_14306 ) ( CLEAR ?auto_14307 ) ( ON-TABLE ?auto_14304 ) ( ON ?auto_14305 ?auto_14304 ) ( ON ?auto_14306 ?auto_14305 ) ( not ( = ?auto_14304 ?auto_14305 ) ) ( not ( = ?auto_14304 ?auto_14306 ) ) ( not ( = ?auto_14304 ?auto_14307 ) ) ( not ( = ?auto_14305 ?auto_14306 ) ) ( not ( = ?auto_14305 ?auto_14307 ) ) ( not ( = ?auto_14306 ?auto_14307 ) ) ( HOLDING ?auto_14308 ) ( not ( = ?auto_14304 ?auto_14308 ) ) ( not ( = ?auto_14305 ?auto_14308 ) ) ( not ( = ?auto_14306 ?auto_14308 ) ) ( not ( = ?auto_14307 ?auto_14308 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_14308 )
      ( MAKE-3PILE ?auto_14304 ?auto_14305 ?auto_14306 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_14309 - BLOCK
      ?auto_14310 - BLOCK
      ?auto_14311 - BLOCK
    )
    :vars
    (
      ?auto_14313 - BLOCK
      ?auto_14312 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_14313 ?auto_14311 ) ( ON-TABLE ?auto_14309 ) ( ON ?auto_14310 ?auto_14309 ) ( ON ?auto_14311 ?auto_14310 ) ( not ( = ?auto_14309 ?auto_14310 ) ) ( not ( = ?auto_14309 ?auto_14311 ) ) ( not ( = ?auto_14309 ?auto_14313 ) ) ( not ( = ?auto_14310 ?auto_14311 ) ) ( not ( = ?auto_14310 ?auto_14313 ) ) ( not ( = ?auto_14311 ?auto_14313 ) ) ( not ( = ?auto_14309 ?auto_14312 ) ) ( not ( = ?auto_14310 ?auto_14312 ) ) ( not ( = ?auto_14311 ?auto_14312 ) ) ( not ( = ?auto_14313 ?auto_14312 ) ) ( ON ?auto_14312 ?auto_14313 ) ( CLEAR ?auto_14312 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_14309 ?auto_14310 ?auto_14311 ?auto_14313 )
      ( MAKE-3PILE ?auto_14309 ?auto_14310 ?auto_14311 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_14316 - BLOCK
      ?auto_14317 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_14317 ) ( CLEAR ?auto_14316 ) ( ON-TABLE ?auto_14316 ) ( not ( = ?auto_14316 ?auto_14317 ) ) )
    :subtasks
    ( ( !STACK ?auto_14317 ?auto_14316 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_14318 - BLOCK
      ?auto_14319 - BLOCK
    )
    :vars
    (
      ?auto_14320 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_14318 ) ( ON-TABLE ?auto_14318 ) ( not ( = ?auto_14318 ?auto_14319 ) ) ( ON ?auto_14319 ?auto_14320 ) ( CLEAR ?auto_14319 ) ( HAND-EMPTY ) ( not ( = ?auto_14318 ?auto_14320 ) ) ( not ( = ?auto_14319 ?auto_14320 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_14319 ?auto_14320 )
      ( MAKE-2PILE ?auto_14318 ?auto_14319 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_14321 - BLOCK
      ?auto_14322 - BLOCK
    )
    :vars
    (
      ?auto_14323 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_14321 ?auto_14322 ) ) ( ON ?auto_14322 ?auto_14323 ) ( CLEAR ?auto_14322 ) ( not ( = ?auto_14321 ?auto_14323 ) ) ( not ( = ?auto_14322 ?auto_14323 ) ) ( HOLDING ?auto_14321 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_14321 )
      ( MAKE-2PILE ?auto_14321 ?auto_14322 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_14324 - BLOCK
      ?auto_14325 - BLOCK
    )
    :vars
    (
      ?auto_14326 - BLOCK
      ?auto_14327 - BLOCK
      ?auto_14328 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_14324 ?auto_14325 ) ) ( ON ?auto_14325 ?auto_14326 ) ( not ( = ?auto_14324 ?auto_14326 ) ) ( not ( = ?auto_14325 ?auto_14326 ) ) ( ON ?auto_14324 ?auto_14325 ) ( CLEAR ?auto_14324 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_14327 ) ( ON ?auto_14328 ?auto_14327 ) ( ON ?auto_14326 ?auto_14328 ) ( not ( = ?auto_14327 ?auto_14328 ) ) ( not ( = ?auto_14327 ?auto_14326 ) ) ( not ( = ?auto_14327 ?auto_14325 ) ) ( not ( = ?auto_14327 ?auto_14324 ) ) ( not ( = ?auto_14328 ?auto_14326 ) ) ( not ( = ?auto_14328 ?auto_14325 ) ) ( not ( = ?auto_14328 ?auto_14324 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_14327 ?auto_14328 ?auto_14326 ?auto_14325 )
      ( MAKE-2PILE ?auto_14324 ?auto_14325 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_14331 - BLOCK
      ?auto_14332 - BLOCK
    )
    :vars
    (
      ?auto_14333 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_14333 ?auto_14332 ) ( CLEAR ?auto_14333 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_14331 ) ( ON ?auto_14332 ?auto_14331 ) ( not ( = ?auto_14331 ?auto_14332 ) ) ( not ( = ?auto_14331 ?auto_14333 ) ) ( not ( = ?auto_14332 ?auto_14333 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_14333 ?auto_14332 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_14334 - BLOCK
      ?auto_14335 - BLOCK
    )
    :vars
    (
      ?auto_14336 - BLOCK
      ?auto_14337 - BLOCK
      ?auto_14338 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_14336 ?auto_14335 ) ( CLEAR ?auto_14336 ) ( ON-TABLE ?auto_14334 ) ( ON ?auto_14335 ?auto_14334 ) ( not ( = ?auto_14334 ?auto_14335 ) ) ( not ( = ?auto_14334 ?auto_14336 ) ) ( not ( = ?auto_14335 ?auto_14336 ) ) ( HOLDING ?auto_14337 ) ( CLEAR ?auto_14338 ) ( not ( = ?auto_14334 ?auto_14337 ) ) ( not ( = ?auto_14334 ?auto_14338 ) ) ( not ( = ?auto_14335 ?auto_14337 ) ) ( not ( = ?auto_14335 ?auto_14338 ) ) ( not ( = ?auto_14336 ?auto_14337 ) ) ( not ( = ?auto_14336 ?auto_14338 ) ) ( not ( = ?auto_14337 ?auto_14338 ) ) )
    :subtasks
    ( ( !STACK ?auto_14337 ?auto_14338 )
      ( MAKE-2PILE ?auto_14334 ?auto_14335 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_14534 - BLOCK
      ?auto_14535 - BLOCK
    )
    :vars
    (
      ?auto_14537 - BLOCK
      ?auto_14536 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_14537 ?auto_14535 ) ( ON-TABLE ?auto_14534 ) ( ON ?auto_14535 ?auto_14534 ) ( not ( = ?auto_14534 ?auto_14535 ) ) ( not ( = ?auto_14534 ?auto_14537 ) ) ( not ( = ?auto_14535 ?auto_14537 ) ) ( not ( = ?auto_14534 ?auto_14536 ) ) ( not ( = ?auto_14535 ?auto_14536 ) ) ( not ( = ?auto_14537 ?auto_14536 ) ) ( ON ?auto_14536 ?auto_14537 ) ( CLEAR ?auto_14536 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_14534 ?auto_14535 ?auto_14537 )
      ( MAKE-2PILE ?auto_14534 ?auto_14535 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_14344 - BLOCK
      ?auto_14345 - BLOCK
    )
    :vars
    (
      ?auto_14347 - BLOCK
      ?auto_14348 - BLOCK
      ?auto_14346 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_14347 ?auto_14345 ) ( ON-TABLE ?auto_14344 ) ( ON ?auto_14345 ?auto_14344 ) ( not ( = ?auto_14344 ?auto_14345 ) ) ( not ( = ?auto_14344 ?auto_14347 ) ) ( not ( = ?auto_14345 ?auto_14347 ) ) ( not ( = ?auto_14344 ?auto_14348 ) ) ( not ( = ?auto_14344 ?auto_14346 ) ) ( not ( = ?auto_14345 ?auto_14348 ) ) ( not ( = ?auto_14345 ?auto_14346 ) ) ( not ( = ?auto_14347 ?auto_14348 ) ) ( not ( = ?auto_14347 ?auto_14346 ) ) ( not ( = ?auto_14348 ?auto_14346 ) ) ( ON ?auto_14348 ?auto_14347 ) ( CLEAR ?auto_14348 ) ( HOLDING ?auto_14346 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_14346 )
      ( MAKE-2PILE ?auto_14344 ?auto_14345 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_14349 - BLOCK
      ?auto_14350 - BLOCK
    )
    :vars
    (
      ?auto_14352 - BLOCK
      ?auto_14353 - BLOCK
      ?auto_14351 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_14352 ?auto_14350 ) ( ON-TABLE ?auto_14349 ) ( ON ?auto_14350 ?auto_14349 ) ( not ( = ?auto_14349 ?auto_14350 ) ) ( not ( = ?auto_14349 ?auto_14352 ) ) ( not ( = ?auto_14350 ?auto_14352 ) ) ( not ( = ?auto_14349 ?auto_14353 ) ) ( not ( = ?auto_14349 ?auto_14351 ) ) ( not ( = ?auto_14350 ?auto_14353 ) ) ( not ( = ?auto_14350 ?auto_14351 ) ) ( not ( = ?auto_14352 ?auto_14353 ) ) ( not ( = ?auto_14352 ?auto_14351 ) ) ( not ( = ?auto_14353 ?auto_14351 ) ) ( ON ?auto_14353 ?auto_14352 ) ( ON ?auto_14351 ?auto_14353 ) ( CLEAR ?auto_14351 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_14349 ?auto_14350 ?auto_14352 ?auto_14353 )
      ( MAKE-2PILE ?auto_14349 ?auto_14350 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_14357 - BLOCK
      ?auto_14358 - BLOCK
      ?auto_14359 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_14359 ) ( CLEAR ?auto_14358 ) ( ON-TABLE ?auto_14357 ) ( ON ?auto_14358 ?auto_14357 ) ( not ( = ?auto_14357 ?auto_14358 ) ) ( not ( = ?auto_14357 ?auto_14359 ) ) ( not ( = ?auto_14358 ?auto_14359 ) ) )
    :subtasks
    ( ( !STACK ?auto_14359 ?auto_14358 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_14360 - BLOCK
      ?auto_14361 - BLOCK
      ?auto_14362 - BLOCK
    )
    :vars
    (
      ?auto_14363 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_14361 ) ( ON-TABLE ?auto_14360 ) ( ON ?auto_14361 ?auto_14360 ) ( not ( = ?auto_14360 ?auto_14361 ) ) ( not ( = ?auto_14360 ?auto_14362 ) ) ( not ( = ?auto_14361 ?auto_14362 ) ) ( ON ?auto_14362 ?auto_14363 ) ( CLEAR ?auto_14362 ) ( HAND-EMPTY ) ( not ( = ?auto_14360 ?auto_14363 ) ) ( not ( = ?auto_14361 ?auto_14363 ) ) ( not ( = ?auto_14362 ?auto_14363 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_14362 ?auto_14363 )
      ( MAKE-3PILE ?auto_14360 ?auto_14361 ?auto_14362 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_14364 - BLOCK
      ?auto_14365 - BLOCK
      ?auto_14366 - BLOCK
    )
    :vars
    (
      ?auto_14367 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_14364 ) ( not ( = ?auto_14364 ?auto_14365 ) ) ( not ( = ?auto_14364 ?auto_14366 ) ) ( not ( = ?auto_14365 ?auto_14366 ) ) ( ON ?auto_14366 ?auto_14367 ) ( CLEAR ?auto_14366 ) ( not ( = ?auto_14364 ?auto_14367 ) ) ( not ( = ?auto_14365 ?auto_14367 ) ) ( not ( = ?auto_14366 ?auto_14367 ) ) ( HOLDING ?auto_14365 ) ( CLEAR ?auto_14364 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_14364 ?auto_14365 )
      ( MAKE-3PILE ?auto_14364 ?auto_14365 ?auto_14366 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_14368 - BLOCK
      ?auto_14369 - BLOCK
      ?auto_14370 - BLOCK
    )
    :vars
    (
      ?auto_14371 - BLOCK
      ?auto_14372 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_14368 ) ( not ( = ?auto_14368 ?auto_14369 ) ) ( not ( = ?auto_14368 ?auto_14370 ) ) ( not ( = ?auto_14369 ?auto_14370 ) ) ( ON ?auto_14370 ?auto_14371 ) ( not ( = ?auto_14368 ?auto_14371 ) ) ( not ( = ?auto_14369 ?auto_14371 ) ) ( not ( = ?auto_14370 ?auto_14371 ) ) ( CLEAR ?auto_14368 ) ( ON ?auto_14369 ?auto_14370 ) ( CLEAR ?auto_14369 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_14372 ) ( ON ?auto_14371 ?auto_14372 ) ( not ( = ?auto_14372 ?auto_14371 ) ) ( not ( = ?auto_14372 ?auto_14370 ) ) ( not ( = ?auto_14372 ?auto_14369 ) ) ( not ( = ?auto_14368 ?auto_14372 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_14372 ?auto_14371 ?auto_14370 )
      ( MAKE-3PILE ?auto_14368 ?auto_14369 ?auto_14370 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_14373 - BLOCK
      ?auto_14374 - BLOCK
      ?auto_14375 - BLOCK
    )
    :vars
    (
      ?auto_14377 - BLOCK
      ?auto_14376 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_14373 ?auto_14374 ) ) ( not ( = ?auto_14373 ?auto_14375 ) ) ( not ( = ?auto_14374 ?auto_14375 ) ) ( ON ?auto_14375 ?auto_14377 ) ( not ( = ?auto_14373 ?auto_14377 ) ) ( not ( = ?auto_14374 ?auto_14377 ) ) ( not ( = ?auto_14375 ?auto_14377 ) ) ( ON ?auto_14374 ?auto_14375 ) ( CLEAR ?auto_14374 ) ( ON-TABLE ?auto_14376 ) ( ON ?auto_14377 ?auto_14376 ) ( not ( = ?auto_14376 ?auto_14377 ) ) ( not ( = ?auto_14376 ?auto_14375 ) ) ( not ( = ?auto_14376 ?auto_14374 ) ) ( not ( = ?auto_14373 ?auto_14376 ) ) ( HOLDING ?auto_14373 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_14373 )
      ( MAKE-3PILE ?auto_14373 ?auto_14374 ?auto_14375 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_14378 - BLOCK
      ?auto_14379 - BLOCK
      ?auto_14380 - BLOCK
    )
    :vars
    (
      ?auto_14382 - BLOCK
      ?auto_14381 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_14378 ?auto_14379 ) ) ( not ( = ?auto_14378 ?auto_14380 ) ) ( not ( = ?auto_14379 ?auto_14380 ) ) ( ON ?auto_14380 ?auto_14382 ) ( not ( = ?auto_14378 ?auto_14382 ) ) ( not ( = ?auto_14379 ?auto_14382 ) ) ( not ( = ?auto_14380 ?auto_14382 ) ) ( ON ?auto_14379 ?auto_14380 ) ( ON-TABLE ?auto_14381 ) ( ON ?auto_14382 ?auto_14381 ) ( not ( = ?auto_14381 ?auto_14382 ) ) ( not ( = ?auto_14381 ?auto_14380 ) ) ( not ( = ?auto_14381 ?auto_14379 ) ) ( not ( = ?auto_14378 ?auto_14381 ) ) ( ON ?auto_14378 ?auto_14379 ) ( CLEAR ?auto_14378 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_14381 ?auto_14382 ?auto_14380 ?auto_14379 )
      ( MAKE-3PILE ?auto_14378 ?auto_14379 ?auto_14380 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_14384 - BLOCK
    )
    :vars
    (
      ?auto_14385 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_14385 ?auto_14384 ) ( CLEAR ?auto_14385 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_14384 ) ( not ( = ?auto_14384 ?auto_14385 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_14385 ?auto_14384 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_14386 - BLOCK
    )
    :vars
    (
      ?auto_14387 - BLOCK
      ?auto_14388 - BLOCK
      ?auto_14389 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_14387 ?auto_14386 ) ( CLEAR ?auto_14387 ) ( ON-TABLE ?auto_14386 ) ( not ( = ?auto_14386 ?auto_14387 ) ) ( HOLDING ?auto_14388 ) ( CLEAR ?auto_14389 ) ( not ( = ?auto_14386 ?auto_14388 ) ) ( not ( = ?auto_14386 ?auto_14389 ) ) ( not ( = ?auto_14387 ?auto_14388 ) ) ( not ( = ?auto_14387 ?auto_14389 ) ) ( not ( = ?auto_14388 ?auto_14389 ) ) )
    :subtasks
    ( ( !STACK ?auto_14388 ?auto_14389 )
      ( MAKE-1PILE ?auto_14386 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_14390 - BLOCK
    )
    :vars
    (
      ?auto_14392 - BLOCK
      ?auto_14393 - BLOCK
      ?auto_14391 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_14392 ?auto_14390 ) ( ON-TABLE ?auto_14390 ) ( not ( = ?auto_14390 ?auto_14392 ) ) ( CLEAR ?auto_14393 ) ( not ( = ?auto_14390 ?auto_14391 ) ) ( not ( = ?auto_14390 ?auto_14393 ) ) ( not ( = ?auto_14392 ?auto_14391 ) ) ( not ( = ?auto_14392 ?auto_14393 ) ) ( not ( = ?auto_14391 ?auto_14393 ) ) ( ON ?auto_14391 ?auto_14392 ) ( CLEAR ?auto_14391 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_14390 ?auto_14392 )
      ( MAKE-1PILE ?auto_14390 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_14394 - BLOCK
    )
    :vars
    (
      ?auto_14397 - BLOCK
      ?auto_14395 - BLOCK
      ?auto_14396 - BLOCK
      ?auto_14398 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_14397 ?auto_14394 ) ( ON-TABLE ?auto_14394 ) ( not ( = ?auto_14394 ?auto_14397 ) ) ( not ( = ?auto_14394 ?auto_14395 ) ) ( not ( = ?auto_14394 ?auto_14396 ) ) ( not ( = ?auto_14397 ?auto_14395 ) ) ( not ( = ?auto_14397 ?auto_14396 ) ) ( not ( = ?auto_14395 ?auto_14396 ) ) ( ON ?auto_14395 ?auto_14397 ) ( CLEAR ?auto_14395 ) ( HOLDING ?auto_14396 ) ( CLEAR ?auto_14398 ) ( ON-TABLE ?auto_14398 ) ( not ( = ?auto_14398 ?auto_14396 ) ) ( not ( = ?auto_14394 ?auto_14398 ) ) ( not ( = ?auto_14397 ?auto_14398 ) ) ( not ( = ?auto_14395 ?auto_14398 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_14398 ?auto_14396 )
      ( MAKE-1PILE ?auto_14394 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_14622 - BLOCK
    )
    :vars
    (
      ?auto_14623 - BLOCK
      ?auto_14625 - BLOCK
      ?auto_14624 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_14623 ?auto_14622 ) ( ON-TABLE ?auto_14622 ) ( not ( = ?auto_14622 ?auto_14623 ) ) ( not ( = ?auto_14622 ?auto_14625 ) ) ( not ( = ?auto_14622 ?auto_14624 ) ) ( not ( = ?auto_14623 ?auto_14625 ) ) ( not ( = ?auto_14623 ?auto_14624 ) ) ( not ( = ?auto_14625 ?auto_14624 ) ) ( ON ?auto_14625 ?auto_14623 ) ( ON ?auto_14624 ?auto_14625 ) ( CLEAR ?auto_14624 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_14622 ?auto_14623 ?auto_14625 )
      ( MAKE-1PILE ?auto_14622 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_14404 - BLOCK
    )
    :vars
    (
      ?auto_14407 - BLOCK
      ?auto_14405 - BLOCK
      ?auto_14408 - BLOCK
      ?auto_14406 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_14407 ?auto_14404 ) ( ON-TABLE ?auto_14404 ) ( not ( = ?auto_14404 ?auto_14407 ) ) ( not ( = ?auto_14404 ?auto_14405 ) ) ( not ( = ?auto_14404 ?auto_14408 ) ) ( not ( = ?auto_14407 ?auto_14405 ) ) ( not ( = ?auto_14407 ?auto_14408 ) ) ( not ( = ?auto_14405 ?auto_14408 ) ) ( ON ?auto_14405 ?auto_14407 ) ( not ( = ?auto_14406 ?auto_14408 ) ) ( not ( = ?auto_14404 ?auto_14406 ) ) ( not ( = ?auto_14407 ?auto_14406 ) ) ( not ( = ?auto_14405 ?auto_14406 ) ) ( ON ?auto_14408 ?auto_14405 ) ( CLEAR ?auto_14408 ) ( HOLDING ?auto_14406 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_14406 )
      ( MAKE-1PILE ?auto_14404 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_14409 - BLOCK
    )
    :vars
    (
      ?auto_14411 - BLOCK
      ?auto_14413 - BLOCK
      ?auto_14412 - BLOCK
      ?auto_14410 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_14411 ?auto_14409 ) ( ON-TABLE ?auto_14409 ) ( not ( = ?auto_14409 ?auto_14411 ) ) ( not ( = ?auto_14409 ?auto_14413 ) ) ( not ( = ?auto_14409 ?auto_14412 ) ) ( not ( = ?auto_14411 ?auto_14413 ) ) ( not ( = ?auto_14411 ?auto_14412 ) ) ( not ( = ?auto_14413 ?auto_14412 ) ) ( ON ?auto_14413 ?auto_14411 ) ( not ( = ?auto_14410 ?auto_14412 ) ) ( not ( = ?auto_14409 ?auto_14410 ) ) ( not ( = ?auto_14411 ?auto_14410 ) ) ( not ( = ?auto_14413 ?auto_14410 ) ) ( ON ?auto_14412 ?auto_14413 ) ( ON ?auto_14410 ?auto_14412 ) ( CLEAR ?auto_14410 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_14409 ?auto_14411 ?auto_14413 ?auto_14412 )
      ( MAKE-1PILE ?auto_14409 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_14418 - BLOCK
      ?auto_14419 - BLOCK
      ?auto_14420 - BLOCK
      ?auto_14421 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_14421 ) ( CLEAR ?auto_14420 ) ( ON-TABLE ?auto_14418 ) ( ON ?auto_14419 ?auto_14418 ) ( ON ?auto_14420 ?auto_14419 ) ( not ( = ?auto_14418 ?auto_14419 ) ) ( not ( = ?auto_14418 ?auto_14420 ) ) ( not ( = ?auto_14418 ?auto_14421 ) ) ( not ( = ?auto_14419 ?auto_14420 ) ) ( not ( = ?auto_14419 ?auto_14421 ) ) ( not ( = ?auto_14420 ?auto_14421 ) ) )
    :subtasks
    ( ( !STACK ?auto_14421 ?auto_14420 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_14422 - BLOCK
      ?auto_14423 - BLOCK
      ?auto_14424 - BLOCK
      ?auto_14425 - BLOCK
    )
    :vars
    (
      ?auto_14426 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_14424 ) ( ON-TABLE ?auto_14422 ) ( ON ?auto_14423 ?auto_14422 ) ( ON ?auto_14424 ?auto_14423 ) ( not ( = ?auto_14422 ?auto_14423 ) ) ( not ( = ?auto_14422 ?auto_14424 ) ) ( not ( = ?auto_14422 ?auto_14425 ) ) ( not ( = ?auto_14423 ?auto_14424 ) ) ( not ( = ?auto_14423 ?auto_14425 ) ) ( not ( = ?auto_14424 ?auto_14425 ) ) ( ON ?auto_14425 ?auto_14426 ) ( CLEAR ?auto_14425 ) ( HAND-EMPTY ) ( not ( = ?auto_14422 ?auto_14426 ) ) ( not ( = ?auto_14423 ?auto_14426 ) ) ( not ( = ?auto_14424 ?auto_14426 ) ) ( not ( = ?auto_14425 ?auto_14426 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_14425 ?auto_14426 )
      ( MAKE-4PILE ?auto_14422 ?auto_14423 ?auto_14424 ?auto_14425 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_14427 - BLOCK
      ?auto_14428 - BLOCK
      ?auto_14429 - BLOCK
      ?auto_14430 - BLOCK
    )
    :vars
    (
      ?auto_14431 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_14427 ) ( ON ?auto_14428 ?auto_14427 ) ( not ( = ?auto_14427 ?auto_14428 ) ) ( not ( = ?auto_14427 ?auto_14429 ) ) ( not ( = ?auto_14427 ?auto_14430 ) ) ( not ( = ?auto_14428 ?auto_14429 ) ) ( not ( = ?auto_14428 ?auto_14430 ) ) ( not ( = ?auto_14429 ?auto_14430 ) ) ( ON ?auto_14430 ?auto_14431 ) ( CLEAR ?auto_14430 ) ( not ( = ?auto_14427 ?auto_14431 ) ) ( not ( = ?auto_14428 ?auto_14431 ) ) ( not ( = ?auto_14429 ?auto_14431 ) ) ( not ( = ?auto_14430 ?auto_14431 ) ) ( HOLDING ?auto_14429 ) ( CLEAR ?auto_14428 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_14427 ?auto_14428 ?auto_14429 )
      ( MAKE-4PILE ?auto_14427 ?auto_14428 ?auto_14429 ?auto_14430 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_14432 - BLOCK
      ?auto_14433 - BLOCK
      ?auto_14434 - BLOCK
      ?auto_14435 - BLOCK
    )
    :vars
    (
      ?auto_14436 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_14432 ) ( ON ?auto_14433 ?auto_14432 ) ( not ( = ?auto_14432 ?auto_14433 ) ) ( not ( = ?auto_14432 ?auto_14434 ) ) ( not ( = ?auto_14432 ?auto_14435 ) ) ( not ( = ?auto_14433 ?auto_14434 ) ) ( not ( = ?auto_14433 ?auto_14435 ) ) ( not ( = ?auto_14434 ?auto_14435 ) ) ( ON ?auto_14435 ?auto_14436 ) ( not ( = ?auto_14432 ?auto_14436 ) ) ( not ( = ?auto_14433 ?auto_14436 ) ) ( not ( = ?auto_14434 ?auto_14436 ) ) ( not ( = ?auto_14435 ?auto_14436 ) ) ( CLEAR ?auto_14433 ) ( ON ?auto_14434 ?auto_14435 ) ( CLEAR ?auto_14434 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_14436 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_14436 ?auto_14435 )
      ( MAKE-4PILE ?auto_14432 ?auto_14433 ?auto_14434 ?auto_14435 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_14437 - BLOCK
      ?auto_14438 - BLOCK
      ?auto_14439 - BLOCK
      ?auto_14440 - BLOCK
    )
    :vars
    (
      ?auto_14441 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_14437 ) ( not ( = ?auto_14437 ?auto_14438 ) ) ( not ( = ?auto_14437 ?auto_14439 ) ) ( not ( = ?auto_14437 ?auto_14440 ) ) ( not ( = ?auto_14438 ?auto_14439 ) ) ( not ( = ?auto_14438 ?auto_14440 ) ) ( not ( = ?auto_14439 ?auto_14440 ) ) ( ON ?auto_14440 ?auto_14441 ) ( not ( = ?auto_14437 ?auto_14441 ) ) ( not ( = ?auto_14438 ?auto_14441 ) ) ( not ( = ?auto_14439 ?auto_14441 ) ) ( not ( = ?auto_14440 ?auto_14441 ) ) ( ON ?auto_14439 ?auto_14440 ) ( CLEAR ?auto_14439 ) ( ON-TABLE ?auto_14441 ) ( HOLDING ?auto_14438 ) ( CLEAR ?auto_14437 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_14437 ?auto_14438 )
      ( MAKE-4PILE ?auto_14437 ?auto_14438 ?auto_14439 ?auto_14440 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_14442 - BLOCK
      ?auto_14443 - BLOCK
      ?auto_14444 - BLOCK
      ?auto_14445 - BLOCK
    )
    :vars
    (
      ?auto_14446 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_14442 ) ( not ( = ?auto_14442 ?auto_14443 ) ) ( not ( = ?auto_14442 ?auto_14444 ) ) ( not ( = ?auto_14442 ?auto_14445 ) ) ( not ( = ?auto_14443 ?auto_14444 ) ) ( not ( = ?auto_14443 ?auto_14445 ) ) ( not ( = ?auto_14444 ?auto_14445 ) ) ( ON ?auto_14445 ?auto_14446 ) ( not ( = ?auto_14442 ?auto_14446 ) ) ( not ( = ?auto_14443 ?auto_14446 ) ) ( not ( = ?auto_14444 ?auto_14446 ) ) ( not ( = ?auto_14445 ?auto_14446 ) ) ( ON ?auto_14444 ?auto_14445 ) ( ON-TABLE ?auto_14446 ) ( CLEAR ?auto_14442 ) ( ON ?auto_14443 ?auto_14444 ) ( CLEAR ?auto_14443 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_14446 ?auto_14445 ?auto_14444 )
      ( MAKE-4PILE ?auto_14442 ?auto_14443 ?auto_14444 ?auto_14445 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_14447 - BLOCK
      ?auto_14448 - BLOCK
      ?auto_14449 - BLOCK
      ?auto_14450 - BLOCK
    )
    :vars
    (
      ?auto_14451 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_14447 ?auto_14448 ) ) ( not ( = ?auto_14447 ?auto_14449 ) ) ( not ( = ?auto_14447 ?auto_14450 ) ) ( not ( = ?auto_14448 ?auto_14449 ) ) ( not ( = ?auto_14448 ?auto_14450 ) ) ( not ( = ?auto_14449 ?auto_14450 ) ) ( ON ?auto_14450 ?auto_14451 ) ( not ( = ?auto_14447 ?auto_14451 ) ) ( not ( = ?auto_14448 ?auto_14451 ) ) ( not ( = ?auto_14449 ?auto_14451 ) ) ( not ( = ?auto_14450 ?auto_14451 ) ) ( ON ?auto_14449 ?auto_14450 ) ( ON-TABLE ?auto_14451 ) ( ON ?auto_14448 ?auto_14449 ) ( CLEAR ?auto_14448 ) ( HOLDING ?auto_14447 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_14447 )
      ( MAKE-4PILE ?auto_14447 ?auto_14448 ?auto_14449 ?auto_14450 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_14452 - BLOCK
      ?auto_14453 - BLOCK
      ?auto_14454 - BLOCK
      ?auto_14455 - BLOCK
    )
    :vars
    (
      ?auto_14456 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_14452 ?auto_14453 ) ) ( not ( = ?auto_14452 ?auto_14454 ) ) ( not ( = ?auto_14452 ?auto_14455 ) ) ( not ( = ?auto_14453 ?auto_14454 ) ) ( not ( = ?auto_14453 ?auto_14455 ) ) ( not ( = ?auto_14454 ?auto_14455 ) ) ( ON ?auto_14455 ?auto_14456 ) ( not ( = ?auto_14452 ?auto_14456 ) ) ( not ( = ?auto_14453 ?auto_14456 ) ) ( not ( = ?auto_14454 ?auto_14456 ) ) ( not ( = ?auto_14455 ?auto_14456 ) ) ( ON ?auto_14454 ?auto_14455 ) ( ON-TABLE ?auto_14456 ) ( ON ?auto_14453 ?auto_14454 ) ( ON ?auto_14452 ?auto_14453 ) ( CLEAR ?auto_14452 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_14456 ?auto_14455 ?auto_14454 ?auto_14453 )
      ( MAKE-4PILE ?auto_14452 ?auto_14453 ?auto_14454 ?auto_14455 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_14497 - BLOCK
    )
    :vars
    (
      ?auto_14498 - BLOCK
      ?auto_14499 - BLOCK
      ?auto_14500 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_14497 ?auto_14498 ) ( CLEAR ?auto_14497 ) ( not ( = ?auto_14497 ?auto_14498 ) ) ( HOLDING ?auto_14499 ) ( CLEAR ?auto_14500 ) ( not ( = ?auto_14497 ?auto_14499 ) ) ( not ( = ?auto_14497 ?auto_14500 ) ) ( not ( = ?auto_14498 ?auto_14499 ) ) ( not ( = ?auto_14498 ?auto_14500 ) ) ( not ( = ?auto_14499 ?auto_14500 ) ) )
    :subtasks
    ( ( !STACK ?auto_14499 ?auto_14500 )
      ( MAKE-1PILE ?auto_14497 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_14501 - BLOCK
    )
    :vars
    (
      ?auto_14504 - BLOCK
      ?auto_14502 - BLOCK
      ?auto_14503 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_14501 ?auto_14504 ) ( not ( = ?auto_14501 ?auto_14504 ) ) ( CLEAR ?auto_14502 ) ( not ( = ?auto_14501 ?auto_14503 ) ) ( not ( = ?auto_14501 ?auto_14502 ) ) ( not ( = ?auto_14504 ?auto_14503 ) ) ( not ( = ?auto_14504 ?auto_14502 ) ) ( not ( = ?auto_14503 ?auto_14502 ) ) ( ON ?auto_14503 ?auto_14501 ) ( CLEAR ?auto_14503 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_14504 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_14504 ?auto_14501 )
      ( MAKE-1PILE ?auto_14501 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_14505 - BLOCK
    )
    :vars
    (
      ?auto_14507 - BLOCK
      ?auto_14508 - BLOCK
      ?auto_14506 - BLOCK
      ?auto_14509 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_14505 ?auto_14507 ) ( not ( = ?auto_14505 ?auto_14507 ) ) ( not ( = ?auto_14505 ?auto_14508 ) ) ( not ( = ?auto_14505 ?auto_14506 ) ) ( not ( = ?auto_14507 ?auto_14508 ) ) ( not ( = ?auto_14507 ?auto_14506 ) ) ( not ( = ?auto_14508 ?auto_14506 ) ) ( ON ?auto_14508 ?auto_14505 ) ( CLEAR ?auto_14508 ) ( ON-TABLE ?auto_14507 ) ( HOLDING ?auto_14506 ) ( CLEAR ?auto_14509 ) ( ON-TABLE ?auto_14509 ) ( not ( = ?auto_14509 ?auto_14506 ) ) ( not ( = ?auto_14505 ?auto_14509 ) ) ( not ( = ?auto_14507 ?auto_14509 ) ) ( not ( = ?auto_14508 ?auto_14509 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_14509 ?auto_14506 )
      ( MAKE-1PILE ?auto_14505 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_14510 - BLOCK
    )
    :vars
    (
      ?auto_14511 - BLOCK
      ?auto_14512 - BLOCK
      ?auto_14513 - BLOCK
      ?auto_14514 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_14510 ?auto_14511 ) ( not ( = ?auto_14510 ?auto_14511 ) ) ( not ( = ?auto_14510 ?auto_14512 ) ) ( not ( = ?auto_14510 ?auto_14513 ) ) ( not ( = ?auto_14511 ?auto_14512 ) ) ( not ( = ?auto_14511 ?auto_14513 ) ) ( not ( = ?auto_14512 ?auto_14513 ) ) ( ON ?auto_14512 ?auto_14510 ) ( ON-TABLE ?auto_14511 ) ( CLEAR ?auto_14514 ) ( ON-TABLE ?auto_14514 ) ( not ( = ?auto_14514 ?auto_14513 ) ) ( not ( = ?auto_14510 ?auto_14514 ) ) ( not ( = ?auto_14511 ?auto_14514 ) ) ( not ( = ?auto_14512 ?auto_14514 ) ) ( ON ?auto_14513 ?auto_14512 ) ( CLEAR ?auto_14513 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_14511 ?auto_14510 ?auto_14512 )
      ( MAKE-1PILE ?auto_14510 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_14515 - BLOCK
    )
    :vars
    (
      ?auto_14517 - BLOCK
      ?auto_14516 - BLOCK
      ?auto_14518 - BLOCK
      ?auto_14519 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_14515 ?auto_14517 ) ( not ( = ?auto_14515 ?auto_14517 ) ) ( not ( = ?auto_14515 ?auto_14516 ) ) ( not ( = ?auto_14515 ?auto_14518 ) ) ( not ( = ?auto_14517 ?auto_14516 ) ) ( not ( = ?auto_14517 ?auto_14518 ) ) ( not ( = ?auto_14516 ?auto_14518 ) ) ( ON ?auto_14516 ?auto_14515 ) ( ON-TABLE ?auto_14517 ) ( not ( = ?auto_14519 ?auto_14518 ) ) ( not ( = ?auto_14515 ?auto_14519 ) ) ( not ( = ?auto_14517 ?auto_14519 ) ) ( not ( = ?auto_14516 ?auto_14519 ) ) ( ON ?auto_14518 ?auto_14516 ) ( CLEAR ?auto_14518 ) ( HOLDING ?auto_14519 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_14519 )
      ( MAKE-1PILE ?auto_14515 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_14520 - BLOCK
    )
    :vars
    (
      ?auto_14523 - BLOCK
      ?auto_14522 - BLOCK
      ?auto_14521 - BLOCK
      ?auto_14524 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_14520 ?auto_14523 ) ( not ( = ?auto_14520 ?auto_14523 ) ) ( not ( = ?auto_14520 ?auto_14522 ) ) ( not ( = ?auto_14520 ?auto_14521 ) ) ( not ( = ?auto_14523 ?auto_14522 ) ) ( not ( = ?auto_14523 ?auto_14521 ) ) ( not ( = ?auto_14522 ?auto_14521 ) ) ( ON ?auto_14522 ?auto_14520 ) ( ON-TABLE ?auto_14523 ) ( not ( = ?auto_14524 ?auto_14521 ) ) ( not ( = ?auto_14520 ?auto_14524 ) ) ( not ( = ?auto_14523 ?auto_14524 ) ) ( not ( = ?auto_14522 ?auto_14524 ) ) ( ON ?auto_14521 ?auto_14522 ) ( ON ?auto_14524 ?auto_14521 ) ( CLEAR ?auto_14524 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_14523 ?auto_14520 ?auto_14522 ?auto_14521 )
      ( MAKE-1PILE ?auto_14520 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_14530 - BLOCK
      ?auto_14531 - BLOCK
    )
    :vars
    (
      ?auto_14532 - BLOCK
      ?auto_14533 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_14532 ?auto_14531 ) ( CLEAR ?auto_14532 ) ( ON-TABLE ?auto_14530 ) ( ON ?auto_14531 ?auto_14530 ) ( not ( = ?auto_14530 ?auto_14531 ) ) ( not ( = ?auto_14530 ?auto_14532 ) ) ( not ( = ?auto_14531 ?auto_14532 ) ) ( HOLDING ?auto_14533 ) ( not ( = ?auto_14530 ?auto_14533 ) ) ( not ( = ?auto_14531 ?auto_14533 ) ) ( not ( = ?auto_14532 ?auto_14533 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_14533 )
      ( MAKE-2PILE ?auto_14530 ?auto_14531 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_14567 - BLOCK
      ?auto_14568 - BLOCK
    )
    :vars
    (
      ?auto_14569 - BLOCK
      ?auto_14570 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_14567 ?auto_14568 ) ) ( ON ?auto_14568 ?auto_14569 ) ( not ( = ?auto_14567 ?auto_14569 ) ) ( not ( = ?auto_14568 ?auto_14569 ) ) ( ON ?auto_14567 ?auto_14568 ) ( CLEAR ?auto_14567 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_14570 ) ( ON ?auto_14569 ?auto_14570 ) ( not ( = ?auto_14570 ?auto_14569 ) ) ( not ( = ?auto_14570 ?auto_14568 ) ) ( not ( = ?auto_14570 ?auto_14567 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_14570 ?auto_14569 ?auto_14568 )
      ( MAKE-2PILE ?auto_14567 ?auto_14568 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_14573 - BLOCK
      ?auto_14574 - BLOCK
    )
    :vars
    (
      ?auto_14575 - BLOCK
      ?auto_14576 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_14573 ?auto_14574 ) ) ( ON ?auto_14574 ?auto_14575 ) ( CLEAR ?auto_14574 ) ( not ( = ?auto_14573 ?auto_14575 ) ) ( not ( = ?auto_14574 ?auto_14575 ) ) ( ON ?auto_14573 ?auto_14576 ) ( CLEAR ?auto_14573 ) ( HAND-EMPTY ) ( not ( = ?auto_14573 ?auto_14576 ) ) ( not ( = ?auto_14574 ?auto_14576 ) ) ( not ( = ?auto_14575 ?auto_14576 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_14573 ?auto_14576 )
      ( MAKE-2PILE ?auto_14573 ?auto_14574 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_14577 - BLOCK
      ?auto_14578 - BLOCK
    )
    :vars
    (
      ?auto_14580 - BLOCK
      ?auto_14579 - BLOCK
      ?auto_14581 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_14577 ?auto_14578 ) ) ( not ( = ?auto_14577 ?auto_14580 ) ) ( not ( = ?auto_14578 ?auto_14580 ) ) ( ON ?auto_14577 ?auto_14579 ) ( CLEAR ?auto_14577 ) ( not ( = ?auto_14577 ?auto_14579 ) ) ( not ( = ?auto_14578 ?auto_14579 ) ) ( not ( = ?auto_14580 ?auto_14579 ) ) ( HOLDING ?auto_14578 ) ( CLEAR ?auto_14580 ) ( ON-TABLE ?auto_14581 ) ( ON ?auto_14580 ?auto_14581 ) ( not ( = ?auto_14581 ?auto_14580 ) ) ( not ( = ?auto_14581 ?auto_14578 ) ) ( not ( = ?auto_14577 ?auto_14581 ) ) ( not ( = ?auto_14579 ?auto_14581 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_14581 ?auto_14580 ?auto_14578 )
      ( MAKE-2PILE ?auto_14577 ?auto_14578 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_14582 - BLOCK
      ?auto_14583 - BLOCK
    )
    :vars
    (
      ?auto_14586 - BLOCK
      ?auto_14585 - BLOCK
      ?auto_14584 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_14582 ?auto_14583 ) ) ( not ( = ?auto_14582 ?auto_14586 ) ) ( not ( = ?auto_14583 ?auto_14586 ) ) ( ON ?auto_14582 ?auto_14585 ) ( not ( = ?auto_14582 ?auto_14585 ) ) ( not ( = ?auto_14583 ?auto_14585 ) ) ( not ( = ?auto_14586 ?auto_14585 ) ) ( CLEAR ?auto_14586 ) ( ON-TABLE ?auto_14584 ) ( ON ?auto_14586 ?auto_14584 ) ( not ( = ?auto_14584 ?auto_14586 ) ) ( not ( = ?auto_14584 ?auto_14583 ) ) ( not ( = ?auto_14582 ?auto_14584 ) ) ( not ( = ?auto_14585 ?auto_14584 ) ) ( ON ?auto_14583 ?auto_14582 ) ( CLEAR ?auto_14583 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_14585 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_14585 ?auto_14582 )
      ( MAKE-2PILE ?auto_14582 ?auto_14583 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_14587 - BLOCK
      ?auto_14588 - BLOCK
    )
    :vars
    (
      ?auto_14589 - BLOCK
      ?auto_14591 - BLOCK
      ?auto_14590 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_14587 ?auto_14588 ) ) ( not ( = ?auto_14587 ?auto_14589 ) ) ( not ( = ?auto_14588 ?auto_14589 ) ) ( ON ?auto_14587 ?auto_14591 ) ( not ( = ?auto_14587 ?auto_14591 ) ) ( not ( = ?auto_14588 ?auto_14591 ) ) ( not ( = ?auto_14589 ?auto_14591 ) ) ( ON-TABLE ?auto_14590 ) ( not ( = ?auto_14590 ?auto_14589 ) ) ( not ( = ?auto_14590 ?auto_14588 ) ) ( not ( = ?auto_14587 ?auto_14590 ) ) ( not ( = ?auto_14591 ?auto_14590 ) ) ( ON ?auto_14588 ?auto_14587 ) ( CLEAR ?auto_14588 ) ( ON-TABLE ?auto_14591 ) ( HOLDING ?auto_14589 ) ( CLEAR ?auto_14590 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_14590 ?auto_14589 )
      ( MAKE-2PILE ?auto_14587 ?auto_14588 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_14592 - BLOCK
      ?auto_14593 - BLOCK
    )
    :vars
    (
      ?auto_14595 - BLOCK
      ?auto_14594 - BLOCK
      ?auto_14596 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_14592 ?auto_14593 ) ) ( not ( = ?auto_14592 ?auto_14595 ) ) ( not ( = ?auto_14593 ?auto_14595 ) ) ( ON ?auto_14592 ?auto_14594 ) ( not ( = ?auto_14592 ?auto_14594 ) ) ( not ( = ?auto_14593 ?auto_14594 ) ) ( not ( = ?auto_14595 ?auto_14594 ) ) ( ON-TABLE ?auto_14596 ) ( not ( = ?auto_14596 ?auto_14595 ) ) ( not ( = ?auto_14596 ?auto_14593 ) ) ( not ( = ?auto_14592 ?auto_14596 ) ) ( not ( = ?auto_14594 ?auto_14596 ) ) ( ON ?auto_14593 ?auto_14592 ) ( ON-TABLE ?auto_14594 ) ( CLEAR ?auto_14596 ) ( ON ?auto_14595 ?auto_14593 ) ( CLEAR ?auto_14595 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_14594 ?auto_14592 ?auto_14593 )
      ( MAKE-2PILE ?auto_14592 ?auto_14593 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_14597 - BLOCK
      ?auto_14598 - BLOCK
    )
    :vars
    (
      ?auto_14600 - BLOCK
      ?auto_14599 - BLOCK
      ?auto_14601 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_14597 ?auto_14598 ) ) ( not ( = ?auto_14597 ?auto_14600 ) ) ( not ( = ?auto_14598 ?auto_14600 ) ) ( ON ?auto_14597 ?auto_14599 ) ( not ( = ?auto_14597 ?auto_14599 ) ) ( not ( = ?auto_14598 ?auto_14599 ) ) ( not ( = ?auto_14600 ?auto_14599 ) ) ( not ( = ?auto_14601 ?auto_14600 ) ) ( not ( = ?auto_14601 ?auto_14598 ) ) ( not ( = ?auto_14597 ?auto_14601 ) ) ( not ( = ?auto_14599 ?auto_14601 ) ) ( ON ?auto_14598 ?auto_14597 ) ( ON-TABLE ?auto_14599 ) ( ON ?auto_14600 ?auto_14598 ) ( CLEAR ?auto_14600 ) ( HOLDING ?auto_14601 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_14601 )
      ( MAKE-2PILE ?auto_14597 ?auto_14598 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_14602 - BLOCK
      ?auto_14603 - BLOCK
    )
    :vars
    (
      ?auto_14605 - BLOCK
      ?auto_14606 - BLOCK
      ?auto_14604 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_14602 ?auto_14603 ) ) ( not ( = ?auto_14602 ?auto_14605 ) ) ( not ( = ?auto_14603 ?auto_14605 ) ) ( ON ?auto_14602 ?auto_14606 ) ( not ( = ?auto_14602 ?auto_14606 ) ) ( not ( = ?auto_14603 ?auto_14606 ) ) ( not ( = ?auto_14605 ?auto_14606 ) ) ( not ( = ?auto_14604 ?auto_14605 ) ) ( not ( = ?auto_14604 ?auto_14603 ) ) ( not ( = ?auto_14602 ?auto_14604 ) ) ( not ( = ?auto_14606 ?auto_14604 ) ) ( ON ?auto_14603 ?auto_14602 ) ( ON-TABLE ?auto_14606 ) ( ON ?auto_14605 ?auto_14603 ) ( ON ?auto_14604 ?auto_14605 ) ( CLEAR ?auto_14604 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_14606 ?auto_14602 ?auto_14603 ?auto_14605 )
      ( MAKE-2PILE ?auto_14602 ?auto_14603 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_14618 - BLOCK
    )
    :vars
    (
      ?auto_14621 - BLOCK
      ?auto_14619 - BLOCK
      ?auto_14620 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_14621 ?auto_14618 ) ( ON-TABLE ?auto_14618 ) ( not ( = ?auto_14618 ?auto_14621 ) ) ( not ( = ?auto_14618 ?auto_14619 ) ) ( not ( = ?auto_14618 ?auto_14620 ) ) ( not ( = ?auto_14621 ?auto_14619 ) ) ( not ( = ?auto_14621 ?auto_14620 ) ) ( not ( = ?auto_14619 ?auto_14620 ) ) ( ON ?auto_14619 ?auto_14621 ) ( CLEAR ?auto_14619 ) ( HOLDING ?auto_14620 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_14620 )
      ( MAKE-1PILE ?auto_14618 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_14651 - BLOCK
      ?auto_14652 - BLOCK
      ?auto_14653 - BLOCK
    )
    :vars
    (
      ?auto_14654 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_14651 ) ( not ( = ?auto_14651 ?auto_14652 ) ) ( not ( = ?auto_14651 ?auto_14653 ) ) ( not ( = ?auto_14652 ?auto_14653 ) ) ( ON ?auto_14653 ?auto_14654 ) ( not ( = ?auto_14651 ?auto_14654 ) ) ( not ( = ?auto_14652 ?auto_14654 ) ) ( not ( = ?auto_14653 ?auto_14654 ) ) ( CLEAR ?auto_14651 ) ( ON ?auto_14652 ?auto_14653 ) ( CLEAR ?auto_14652 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_14654 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_14654 ?auto_14653 )
      ( MAKE-3PILE ?auto_14651 ?auto_14652 ?auto_14653 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_14655 - BLOCK
      ?auto_14656 - BLOCK
      ?auto_14657 - BLOCK
    )
    :vars
    (
      ?auto_14658 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_14655 ?auto_14656 ) ) ( not ( = ?auto_14655 ?auto_14657 ) ) ( not ( = ?auto_14656 ?auto_14657 ) ) ( ON ?auto_14657 ?auto_14658 ) ( not ( = ?auto_14655 ?auto_14658 ) ) ( not ( = ?auto_14656 ?auto_14658 ) ) ( not ( = ?auto_14657 ?auto_14658 ) ) ( ON ?auto_14656 ?auto_14657 ) ( CLEAR ?auto_14656 ) ( ON-TABLE ?auto_14658 ) ( HOLDING ?auto_14655 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_14655 )
      ( MAKE-3PILE ?auto_14655 ?auto_14656 ?auto_14657 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_14659 - BLOCK
      ?auto_14660 - BLOCK
      ?auto_14661 - BLOCK
    )
    :vars
    (
      ?auto_14662 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_14659 ?auto_14660 ) ) ( not ( = ?auto_14659 ?auto_14661 ) ) ( not ( = ?auto_14660 ?auto_14661 ) ) ( ON ?auto_14661 ?auto_14662 ) ( not ( = ?auto_14659 ?auto_14662 ) ) ( not ( = ?auto_14660 ?auto_14662 ) ) ( not ( = ?auto_14661 ?auto_14662 ) ) ( ON ?auto_14660 ?auto_14661 ) ( ON-TABLE ?auto_14662 ) ( ON ?auto_14659 ?auto_14660 ) ( CLEAR ?auto_14659 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_14662 ?auto_14661 ?auto_14660 )
      ( MAKE-3PILE ?auto_14659 ?auto_14660 ?auto_14661 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_14666 - BLOCK
      ?auto_14667 - BLOCK
      ?auto_14668 - BLOCK
    )
    :vars
    (
      ?auto_14669 - BLOCK
      ?auto_14670 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_14666 ?auto_14667 ) ) ( not ( = ?auto_14666 ?auto_14668 ) ) ( not ( = ?auto_14667 ?auto_14668 ) ) ( ON ?auto_14668 ?auto_14669 ) ( not ( = ?auto_14666 ?auto_14669 ) ) ( not ( = ?auto_14667 ?auto_14669 ) ) ( not ( = ?auto_14668 ?auto_14669 ) ) ( ON ?auto_14667 ?auto_14668 ) ( CLEAR ?auto_14667 ) ( ON-TABLE ?auto_14669 ) ( ON ?auto_14666 ?auto_14670 ) ( CLEAR ?auto_14666 ) ( HAND-EMPTY ) ( not ( = ?auto_14666 ?auto_14670 ) ) ( not ( = ?auto_14667 ?auto_14670 ) ) ( not ( = ?auto_14668 ?auto_14670 ) ) ( not ( = ?auto_14669 ?auto_14670 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_14666 ?auto_14670 )
      ( MAKE-3PILE ?auto_14666 ?auto_14667 ?auto_14668 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_14671 - BLOCK
      ?auto_14672 - BLOCK
      ?auto_14673 - BLOCK
    )
    :vars
    (
      ?auto_14675 - BLOCK
      ?auto_14674 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_14671 ?auto_14672 ) ) ( not ( = ?auto_14671 ?auto_14673 ) ) ( not ( = ?auto_14672 ?auto_14673 ) ) ( ON ?auto_14673 ?auto_14675 ) ( not ( = ?auto_14671 ?auto_14675 ) ) ( not ( = ?auto_14672 ?auto_14675 ) ) ( not ( = ?auto_14673 ?auto_14675 ) ) ( ON-TABLE ?auto_14675 ) ( ON ?auto_14671 ?auto_14674 ) ( CLEAR ?auto_14671 ) ( not ( = ?auto_14671 ?auto_14674 ) ) ( not ( = ?auto_14672 ?auto_14674 ) ) ( not ( = ?auto_14673 ?auto_14674 ) ) ( not ( = ?auto_14675 ?auto_14674 ) ) ( HOLDING ?auto_14672 ) ( CLEAR ?auto_14673 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_14675 ?auto_14673 ?auto_14672 )
      ( MAKE-3PILE ?auto_14671 ?auto_14672 ?auto_14673 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_14676 - BLOCK
      ?auto_14677 - BLOCK
      ?auto_14678 - BLOCK
    )
    :vars
    (
      ?auto_14680 - BLOCK
      ?auto_14679 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_14676 ?auto_14677 ) ) ( not ( = ?auto_14676 ?auto_14678 ) ) ( not ( = ?auto_14677 ?auto_14678 ) ) ( ON ?auto_14678 ?auto_14680 ) ( not ( = ?auto_14676 ?auto_14680 ) ) ( not ( = ?auto_14677 ?auto_14680 ) ) ( not ( = ?auto_14678 ?auto_14680 ) ) ( ON-TABLE ?auto_14680 ) ( ON ?auto_14676 ?auto_14679 ) ( not ( = ?auto_14676 ?auto_14679 ) ) ( not ( = ?auto_14677 ?auto_14679 ) ) ( not ( = ?auto_14678 ?auto_14679 ) ) ( not ( = ?auto_14680 ?auto_14679 ) ) ( CLEAR ?auto_14678 ) ( ON ?auto_14677 ?auto_14676 ) ( CLEAR ?auto_14677 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_14679 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_14679 ?auto_14676 )
      ( MAKE-3PILE ?auto_14676 ?auto_14677 ?auto_14678 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_14681 - BLOCK
      ?auto_14682 - BLOCK
      ?auto_14683 - BLOCK
    )
    :vars
    (
      ?auto_14684 - BLOCK
      ?auto_14685 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_14681 ?auto_14682 ) ) ( not ( = ?auto_14681 ?auto_14683 ) ) ( not ( = ?auto_14682 ?auto_14683 ) ) ( not ( = ?auto_14681 ?auto_14684 ) ) ( not ( = ?auto_14682 ?auto_14684 ) ) ( not ( = ?auto_14683 ?auto_14684 ) ) ( ON-TABLE ?auto_14684 ) ( ON ?auto_14681 ?auto_14685 ) ( not ( = ?auto_14681 ?auto_14685 ) ) ( not ( = ?auto_14682 ?auto_14685 ) ) ( not ( = ?auto_14683 ?auto_14685 ) ) ( not ( = ?auto_14684 ?auto_14685 ) ) ( ON ?auto_14682 ?auto_14681 ) ( CLEAR ?auto_14682 ) ( ON-TABLE ?auto_14685 ) ( HOLDING ?auto_14683 ) ( CLEAR ?auto_14684 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_14684 ?auto_14683 )
      ( MAKE-3PILE ?auto_14681 ?auto_14682 ?auto_14683 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_14686 - BLOCK
      ?auto_14687 - BLOCK
      ?auto_14688 - BLOCK
    )
    :vars
    (
      ?auto_14689 - BLOCK
      ?auto_14690 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_14686 ?auto_14687 ) ) ( not ( = ?auto_14686 ?auto_14688 ) ) ( not ( = ?auto_14687 ?auto_14688 ) ) ( not ( = ?auto_14686 ?auto_14689 ) ) ( not ( = ?auto_14687 ?auto_14689 ) ) ( not ( = ?auto_14688 ?auto_14689 ) ) ( ON-TABLE ?auto_14689 ) ( ON ?auto_14686 ?auto_14690 ) ( not ( = ?auto_14686 ?auto_14690 ) ) ( not ( = ?auto_14687 ?auto_14690 ) ) ( not ( = ?auto_14688 ?auto_14690 ) ) ( not ( = ?auto_14689 ?auto_14690 ) ) ( ON ?auto_14687 ?auto_14686 ) ( ON-TABLE ?auto_14690 ) ( CLEAR ?auto_14689 ) ( ON ?auto_14688 ?auto_14687 ) ( CLEAR ?auto_14688 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_14690 ?auto_14686 ?auto_14687 )
      ( MAKE-3PILE ?auto_14686 ?auto_14687 ?auto_14688 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_14691 - BLOCK
      ?auto_14692 - BLOCK
      ?auto_14693 - BLOCK
    )
    :vars
    (
      ?auto_14694 - BLOCK
      ?auto_14695 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_14691 ?auto_14692 ) ) ( not ( = ?auto_14691 ?auto_14693 ) ) ( not ( = ?auto_14692 ?auto_14693 ) ) ( not ( = ?auto_14691 ?auto_14694 ) ) ( not ( = ?auto_14692 ?auto_14694 ) ) ( not ( = ?auto_14693 ?auto_14694 ) ) ( ON ?auto_14691 ?auto_14695 ) ( not ( = ?auto_14691 ?auto_14695 ) ) ( not ( = ?auto_14692 ?auto_14695 ) ) ( not ( = ?auto_14693 ?auto_14695 ) ) ( not ( = ?auto_14694 ?auto_14695 ) ) ( ON ?auto_14692 ?auto_14691 ) ( ON-TABLE ?auto_14695 ) ( ON ?auto_14693 ?auto_14692 ) ( CLEAR ?auto_14693 ) ( HOLDING ?auto_14694 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_14694 )
      ( MAKE-3PILE ?auto_14691 ?auto_14692 ?auto_14693 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_14696 - BLOCK
      ?auto_14697 - BLOCK
      ?auto_14698 - BLOCK
    )
    :vars
    (
      ?auto_14699 - BLOCK
      ?auto_14700 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_14696 ?auto_14697 ) ) ( not ( = ?auto_14696 ?auto_14698 ) ) ( not ( = ?auto_14697 ?auto_14698 ) ) ( not ( = ?auto_14696 ?auto_14699 ) ) ( not ( = ?auto_14697 ?auto_14699 ) ) ( not ( = ?auto_14698 ?auto_14699 ) ) ( ON ?auto_14696 ?auto_14700 ) ( not ( = ?auto_14696 ?auto_14700 ) ) ( not ( = ?auto_14697 ?auto_14700 ) ) ( not ( = ?auto_14698 ?auto_14700 ) ) ( not ( = ?auto_14699 ?auto_14700 ) ) ( ON ?auto_14697 ?auto_14696 ) ( ON-TABLE ?auto_14700 ) ( ON ?auto_14698 ?auto_14697 ) ( ON ?auto_14699 ?auto_14698 ) ( CLEAR ?auto_14699 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_14700 ?auto_14696 ?auto_14697 ?auto_14698 )
      ( MAKE-3PILE ?auto_14696 ?auto_14697 ?auto_14698 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_14709 - BLOCK
      ?auto_14710 - BLOCK
      ?auto_14711 - BLOCK
      ?auto_14712 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_14711 ) ( ON-TABLE ?auto_14709 ) ( ON ?auto_14710 ?auto_14709 ) ( ON ?auto_14711 ?auto_14710 ) ( not ( = ?auto_14709 ?auto_14710 ) ) ( not ( = ?auto_14709 ?auto_14711 ) ) ( not ( = ?auto_14709 ?auto_14712 ) ) ( not ( = ?auto_14710 ?auto_14711 ) ) ( not ( = ?auto_14710 ?auto_14712 ) ) ( not ( = ?auto_14711 ?auto_14712 ) ) ( ON-TABLE ?auto_14712 ) ( CLEAR ?auto_14712 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_14712 )
      ( MAKE-4PILE ?auto_14709 ?auto_14710 ?auto_14711 ?auto_14712 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_14713 - BLOCK
      ?auto_14714 - BLOCK
      ?auto_14715 - BLOCK
      ?auto_14716 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_14713 ) ( ON ?auto_14714 ?auto_14713 ) ( not ( = ?auto_14713 ?auto_14714 ) ) ( not ( = ?auto_14713 ?auto_14715 ) ) ( not ( = ?auto_14713 ?auto_14716 ) ) ( not ( = ?auto_14714 ?auto_14715 ) ) ( not ( = ?auto_14714 ?auto_14716 ) ) ( not ( = ?auto_14715 ?auto_14716 ) ) ( ON-TABLE ?auto_14716 ) ( CLEAR ?auto_14716 ) ( HOLDING ?auto_14715 ) ( CLEAR ?auto_14714 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_14713 ?auto_14714 ?auto_14715 )
      ( MAKE-4PILE ?auto_14713 ?auto_14714 ?auto_14715 ?auto_14716 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_14717 - BLOCK
      ?auto_14718 - BLOCK
      ?auto_14719 - BLOCK
      ?auto_14720 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_14717 ) ( ON ?auto_14718 ?auto_14717 ) ( not ( = ?auto_14717 ?auto_14718 ) ) ( not ( = ?auto_14717 ?auto_14719 ) ) ( not ( = ?auto_14717 ?auto_14720 ) ) ( not ( = ?auto_14718 ?auto_14719 ) ) ( not ( = ?auto_14718 ?auto_14720 ) ) ( not ( = ?auto_14719 ?auto_14720 ) ) ( ON-TABLE ?auto_14720 ) ( CLEAR ?auto_14718 ) ( ON ?auto_14719 ?auto_14720 ) ( CLEAR ?auto_14719 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_14720 )
      ( MAKE-4PILE ?auto_14717 ?auto_14718 ?auto_14719 ?auto_14720 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_14721 - BLOCK
      ?auto_14722 - BLOCK
      ?auto_14723 - BLOCK
      ?auto_14724 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_14721 ) ( not ( = ?auto_14721 ?auto_14722 ) ) ( not ( = ?auto_14721 ?auto_14723 ) ) ( not ( = ?auto_14721 ?auto_14724 ) ) ( not ( = ?auto_14722 ?auto_14723 ) ) ( not ( = ?auto_14722 ?auto_14724 ) ) ( not ( = ?auto_14723 ?auto_14724 ) ) ( ON-TABLE ?auto_14724 ) ( ON ?auto_14723 ?auto_14724 ) ( CLEAR ?auto_14723 ) ( HOLDING ?auto_14722 ) ( CLEAR ?auto_14721 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_14721 ?auto_14722 )
      ( MAKE-4PILE ?auto_14721 ?auto_14722 ?auto_14723 ?auto_14724 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_14725 - BLOCK
      ?auto_14726 - BLOCK
      ?auto_14727 - BLOCK
      ?auto_14728 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_14725 ) ( not ( = ?auto_14725 ?auto_14726 ) ) ( not ( = ?auto_14725 ?auto_14727 ) ) ( not ( = ?auto_14725 ?auto_14728 ) ) ( not ( = ?auto_14726 ?auto_14727 ) ) ( not ( = ?auto_14726 ?auto_14728 ) ) ( not ( = ?auto_14727 ?auto_14728 ) ) ( ON-TABLE ?auto_14728 ) ( ON ?auto_14727 ?auto_14728 ) ( CLEAR ?auto_14725 ) ( ON ?auto_14726 ?auto_14727 ) ( CLEAR ?auto_14726 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_14728 ?auto_14727 )
      ( MAKE-4PILE ?auto_14725 ?auto_14726 ?auto_14727 ?auto_14728 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_14729 - BLOCK
      ?auto_14730 - BLOCK
      ?auto_14731 - BLOCK
      ?auto_14732 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_14729 ?auto_14730 ) ) ( not ( = ?auto_14729 ?auto_14731 ) ) ( not ( = ?auto_14729 ?auto_14732 ) ) ( not ( = ?auto_14730 ?auto_14731 ) ) ( not ( = ?auto_14730 ?auto_14732 ) ) ( not ( = ?auto_14731 ?auto_14732 ) ) ( ON-TABLE ?auto_14732 ) ( ON ?auto_14731 ?auto_14732 ) ( ON ?auto_14730 ?auto_14731 ) ( CLEAR ?auto_14730 ) ( HOLDING ?auto_14729 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_14729 )
      ( MAKE-4PILE ?auto_14729 ?auto_14730 ?auto_14731 ?auto_14732 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_14733 - BLOCK
      ?auto_14734 - BLOCK
      ?auto_14735 - BLOCK
      ?auto_14736 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_14733 ?auto_14734 ) ) ( not ( = ?auto_14733 ?auto_14735 ) ) ( not ( = ?auto_14733 ?auto_14736 ) ) ( not ( = ?auto_14734 ?auto_14735 ) ) ( not ( = ?auto_14734 ?auto_14736 ) ) ( not ( = ?auto_14735 ?auto_14736 ) ) ( ON-TABLE ?auto_14736 ) ( ON ?auto_14735 ?auto_14736 ) ( ON ?auto_14734 ?auto_14735 ) ( ON ?auto_14733 ?auto_14734 ) ( CLEAR ?auto_14733 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_14736 ?auto_14735 ?auto_14734 )
      ( MAKE-4PILE ?auto_14733 ?auto_14734 ?auto_14735 ?auto_14736 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_14741 - BLOCK
      ?auto_14742 - BLOCK
      ?auto_14743 - BLOCK
      ?auto_14744 - BLOCK
    )
    :vars
    (
      ?auto_14745 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_14741 ?auto_14742 ) ) ( not ( = ?auto_14741 ?auto_14743 ) ) ( not ( = ?auto_14741 ?auto_14744 ) ) ( not ( = ?auto_14742 ?auto_14743 ) ) ( not ( = ?auto_14742 ?auto_14744 ) ) ( not ( = ?auto_14743 ?auto_14744 ) ) ( ON-TABLE ?auto_14744 ) ( ON ?auto_14743 ?auto_14744 ) ( ON ?auto_14742 ?auto_14743 ) ( CLEAR ?auto_14742 ) ( ON ?auto_14741 ?auto_14745 ) ( CLEAR ?auto_14741 ) ( HAND-EMPTY ) ( not ( = ?auto_14741 ?auto_14745 ) ) ( not ( = ?auto_14742 ?auto_14745 ) ) ( not ( = ?auto_14743 ?auto_14745 ) ) ( not ( = ?auto_14744 ?auto_14745 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_14741 ?auto_14745 )
      ( MAKE-4PILE ?auto_14741 ?auto_14742 ?auto_14743 ?auto_14744 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_14746 - BLOCK
      ?auto_14747 - BLOCK
      ?auto_14748 - BLOCK
      ?auto_14749 - BLOCK
    )
    :vars
    (
      ?auto_14750 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_14746 ?auto_14747 ) ) ( not ( = ?auto_14746 ?auto_14748 ) ) ( not ( = ?auto_14746 ?auto_14749 ) ) ( not ( = ?auto_14747 ?auto_14748 ) ) ( not ( = ?auto_14747 ?auto_14749 ) ) ( not ( = ?auto_14748 ?auto_14749 ) ) ( ON-TABLE ?auto_14749 ) ( ON ?auto_14748 ?auto_14749 ) ( ON ?auto_14746 ?auto_14750 ) ( CLEAR ?auto_14746 ) ( not ( = ?auto_14746 ?auto_14750 ) ) ( not ( = ?auto_14747 ?auto_14750 ) ) ( not ( = ?auto_14748 ?auto_14750 ) ) ( not ( = ?auto_14749 ?auto_14750 ) ) ( HOLDING ?auto_14747 ) ( CLEAR ?auto_14748 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_14749 ?auto_14748 ?auto_14747 )
      ( MAKE-4PILE ?auto_14746 ?auto_14747 ?auto_14748 ?auto_14749 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_14751 - BLOCK
      ?auto_14752 - BLOCK
      ?auto_14753 - BLOCK
      ?auto_14754 - BLOCK
    )
    :vars
    (
      ?auto_14755 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_14751 ?auto_14752 ) ) ( not ( = ?auto_14751 ?auto_14753 ) ) ( not ( = ?auto_14751 ?auto_14754 ) ) ( not ( = ?auto_14752 ?auto_14753 ) ) ( not ( = ?auto_14752 ?auto_14754 ) ) ( not ( = ?auto_14753 ?auto_14754 ) ) ( ON-TABLE ?auto_14754 ) ( ON ?auto_14753 ?auto_14754 ) ( ON ?auto_14751 ?auto_14755 ) ( not ( = ?auto_14751 ?auto_14755 ) ) ( not ( = ?auto_14752 ?auto_14755 ) ) ( not ( = ?auto_14753 ?auto_14755 ) ) ( not ( = ?auto_14754 ?auto_14755 ) ) ( CLEAR ?auto_14753 ) ( ON ?auto_14752 ?auto_14751 ) ( CLEAR ?auto_14752 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_14755 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_14755 ?auto_14751 )
      ( MAKE-4PILE ?auto_14751 ?auto_14752 ?auto_14753 ?auto_14754 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_14756 - BLOCK
      ?auto_14757 - BLOCK
      ?auto_14758 - BLOCK
      ?auto_14759 - BLOCK
    )
    :vars
    (
      ?auto_14760 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_14756 ?auto_14757 ) ) ( not ( = ?auto_14756 ?auto_14758 ) ) ( not ( = ?auto_14756 ?auto_14759 ) ) ( not ( = ?auto_14757 ?auto_14758 ) ) ( not ( = ?auto_14757 ?auto_14759 ) ) ( not ( = ?auto_14758 ?auto_14759 ) ) ( ON-TABLE ?auto_14759 ) ( ON ?auto_14756 ?auto_14760 ) ( not ( = ?auto_14756 ?auto_14760 ) ) ( not ( = ?auto_14757 ?auto_14760 ) ) ( not ( = ?auto_14758 ?auto_14760 ) ) ( not ( = ?auto_14759 ?auto_14760 ) ) ( ON ?auto_14757 ?auto_14756 ) ( CLEAR ?auto_14757 ) ( ON-TABLE ?auto_14760 ) ( HOLDING ?auto_14758 ) ( CLEAR ?auto_14759 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_14759 ?auto_14758 )
      ( MAKE-4PILE ?auto_14756 ?auto_14757 ?auto_14758 ?auto_14759 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_14761 - BLOCK
      ?auto_14762 - BLOCK
      ?auto_14763 - BLOCK
      ?auto_14764 - BLOCK
    )
    :vars
    (
      ?auto_14765 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_14761 ?auto_14762 ) ) ( not ( = ?auto_14761 ?auto_14763 ) ) ( not ( = ?auto_14761 ?auto_14764 ) ) ( not ( = ?auto_14762 ?auto_14763 ) ) ( not ( = ?auto_14762 ?auto_14764 ) ) ( not ( = ?auto_14763 ?auto_14764 ) ) ( ON-TABLE ?auto_14764 ) ( ON ?auto_14761 ?auto_14765 ) ( not ( = ?auto_14761 ?auto_14765 ) ) ( not ( = ?auto_14762 ?auto_14765 ) ) ( not ( = ?auto_14763 ?auto_14765 ) ) ( not ( = ?auto_14764 ?auto_14765 ) ) ( ON ?auto_14762 ?auto_14761 ) ( ON-TABLE ?auto_14765 ) ( CLEAR ?auto_14764 ) ( ON ?auto_14763 ?auto_14762 ) ( CLEAR ?auto_14763 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_14765 ?auto_14761 ?auto_14762 )
      ( MAKE-4PILE ?auto_14761 ?auto_14762 ?auto_14763 ?auto_14764 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_14766 - BLOCK
      ?auto_14767 - BLOCK
      ?auto_14768 - BLOCK
      ?auto_14769 - BLOCK
    )
    :vars
    (
      ?auto_14770 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_14766 ?auto_14767 ) ) ( not ( = ?auto_14766 ?auto_14768 ) ) ( not ( = ?auto_14766 ?auto_14769 ) ) ( not ( = ?auto_14767 ?auto_14768 ) ) ( not ( = ?auto_14767 ?auto_14769 ) ) ( not ( = ?auto_14768 ?auto_14769 ) ) ( ON ?auto_14766 ?auto_14770 ) ( not ( = ?auto_14766 ?auto_14770 ) ) ( not ( = ?auto_14767 ?auto_14770 ) ) ( not ( = ?auto_14768 ?auto_14770 ) ) ( not ( = ?auto_14769 ?auto_14770 ) ) ( ON ?auto_14767 ?auto_14766 ) ( ON-TABLE ?auto_14770 ) ( ON ?auto_14768 ?auto_14767 ) ( CLEAR ?auto_14768 ) ( HOLDING ?auto_14769 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_14769 )
      ( MAKE-4PILE ?auto_14766 ?auto_14767 ?auto_14768 ?auto_14769 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_14771 - BLOCK
      ?auto_14772 - BLOCK
      ?auto_14773 - BLOCK
      ?auto_14774 - BLOCK
    )
    :vars
    (
      ?auto_14775 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_14771 ?auto_14772 ) ) ( not ( = ?auto_14771 ?auto_14773 ) ) ( not ( = ?auto_14771 ?auto_14774 ) ) ( not ( = ?auto_14772 ?auto_14773 ) ) ( not ( = ?auto_14772 ?auto_14774 ) ) ( not ( = ?auto_14773 ?auto_14774 ) ) ( ON ?auto_14771 ?auto_14775 ) ( not ( = ?auto_14771 ?auto_14775 ) ) ( not ( = ?auto_14772 ?auto_14775 ) ) ( not ( = ?auto_14773 ?auto_14775 ) ) ( not ( = ?auto_14774 ?auto_14775 ) ) ( ON ?auto_14772 ?auto_14771 ) ( ON-TABLE ?auto_14775 ) ( ON ?auto_14773 ?auto_14772 ) ( ON ?auto_14774 ?auto_14773 ) ( CLEAR ?auto_14774 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_14775 ?auto_14771 ?auto_14772 ?auto_14773 )
      ( MAKE-4PILE ?auto_14771 ?auto_14772 ?auto_14773 ?auto_14774 ) )
  )

)

