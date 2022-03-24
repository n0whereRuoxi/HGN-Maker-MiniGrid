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
      ?auto_326 - BLOCK
      ?auto_327 - BLOCK
    )
    :vars
    (
      ?auto_328 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_328 ?auto_327 ) ( CLEAR ?auto_328 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_326 ) ( ON ?auto_327 ?auto_326 ) ( not ( = ?auto_326 ?auto_327 ) ) ( not ( = ?auto_326 ?auto_328 ) ) ( not ( = ?auto_327 ?auto_328 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_328 ?auto_327 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_330 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_330 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_330 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_331 - BLOCK
    )
    :vars
    (
      ?auto_332 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_331 ?auto_332 ) ( CLEAR ?auto_331 ) ( HAND-EMPTY ) ( not ( = ?auto_331 ?auto_332 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_331 ?auto_332 )
      ( MAKE-1PILE ?auto_331 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_334 - BLOCK
    )
    :vars
    (
      ?auto_335 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_335 ?auto_334 ) ( CLEAR ?auto_335 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_334 ) ( not ( = ?auto_334 ?auto_335 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_335 ?auto_334 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_336 - BLOCK
    )
    :vars
    (
      ?auto_337 - BLOCK
      ?auto_338 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_337 ?auto_336 ) ( CLEAR ?auto_337 ) ( ON-TABLE ?auto_336 ) ( not ( = ?auto_336 ?auto_337 ) ) ( HOLDING ?auto_338 ) ( not ( = ?auto_336 ?auto_338 ) ) ( not ( = ?auto_337 ?auto_338 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_338 )
      ( MAKE-1PILE ?auto_336 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_339 - BLOCK
    )
    :vars
    (
      ?auto_341 - BLOCK
      ?auto_340 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_341 ?auto_339 ) ( ON-TABLE ?auto_339 ) ( not ( = ?auto_339 ?auto_341 ) ) ( not ( = ?auto_339 ?auto_340 ) ) ( not ( = ?auto_341 ?auto_340 ) ) ( ON ?auto_340 ?auto_341 ) ( CLEAR ?auto_340 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_339 ?auto_341 )
      ( MAKE-1PILE ?auto_339 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_344 - BLOCK
      ?auto_345 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_345 ) ( CLEAR ?auto_344 ) ( ON-TABLE ?auto_344 ) ( not ( = ?auto_344 ?auto_345 ) ) )
    :subtasks
    ( ( !STACK ?auto_345 ?auto_344 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_346 - BLOCK
      ?auto_347 - BLOCK
    )
    :vars
    (
      ?auto_348 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_346 ) ( ON-TABLE ?auto_346 ) ( not ( = ?auto_346 ?auto_347 ) ) ( ON ?auto_347 ?auto_348 ) ( CLEAR ?auto_347 ) ( HAND-EMPTY ) ( not ( = ?auto_346 ?auto_348 ) ) ( not ( = ?auto_347 ?auto_348 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_347 ?auto_348 )
      ( MAKE-2PILE ?auto_346 ?auto_347 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_349 - BLOCK
      ?auto_350 - BLOCK
    )
    :vars
    (
      ?auto_351 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_349 ?auto_350 ) ) ( ON ?auto_350 ?auto_351 ) ( CLEAR ?auto_350 ) ( not ( = ?auto_349 ?auto_351 ) ) ( not ( = ?auto_350 ?auto_351 ) ) ( HOLDING ?auto_349 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_349 )
      ( MAKE-2PILE ?auto_349 ?auto_350 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_352 - BLOCK
      ?auto_353 - BLOCK
    )
    :vars
    (
      ?auto_354 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_352 ?auto_353 ) ) ( ON ?auto_353 ?auto_354 ) ( not ( = ?auto_352 ?auto_354 ) ) ( not ( = ?auto_353 ?auto_354 ) ) ( ON ?auto_352 ?auto_353 ) ( CLEAR ?auto_352 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_354 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_354 ?auto_353 )
      ( MAKE-2PILE ?auto_352 ?auto_353 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_356 - BLOCK
    )
    :vars
    (
      ?auto_357 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_357 ?auto_356 ) ( CLEAR ?auto_357 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_356 ) ( not ( = ?auto_356 ?auto_357 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_357 ?auto_356 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_363 - BLOCK
    )
    :vars
    (
      ?auto_364 - BLOCK
      ?auto_365 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_363 ?auto_364 ) ) ( ON ?auto_364 ?auto_365 ) ( CLEAR ?auto_364 ) ( not ( = ?auto_363 ?auto_365 ) ) ( not ( = ?auto_364 ?auto_365 ) ) ( HOLDING ?auto_363 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_363 ?auto_364 )
      ( MAKE-1PILE ?auto_363 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_366 - BLOCK
    )
    :vars
    (
      ?auto_367 - BLOCK
      ?auto_368 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_366 ?auto_367 ) ) ( ON ?auto_367 ?auto_368 ) ( not ( = ?auto_366 ?auto_368 ) ) ( not ( = ?auto_367 ?auto_368 ) ) ( ON ?auto_366 ?auto_367 ) ( CLEAR ?auto_366 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_368 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_368 ?auto_367 )
      ( MAKE-1PILE ?auto_366 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_370 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_370 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_370 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_371 - BLOCK
    )
    :vars
    (
      ?auto_372 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_371 ?auto_372 ) ( CLEAR ?auto_371 ) ( HAND-EMPTY ) ( not ( = ?auto_371 ?auto_372 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_371 ?auto_372 )
      ( MAKE-1PILE ?auto_371 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_373 - BLOCK
    )
    :vars
    (
      ?auto_374 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_373 ?auto_374 ) ) ( HOLDING ?auto_373 ) ( CLEAR ?auto_374 ) ( ON-TABLE ?auto_374 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_374 ?auto_373 )
      ( MAKE-1PILE ?auto_373 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_375 - BLOCK
    )
    :vars
    (
      ?auto_376 - BLOCK
      ?auto_377 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_375 ?auto_376 ) ) ( CLEAR ?auto_376 ) ( ON-TABLE ?auto_376 ) ( ON ?auto_375 ?auto_377 ) ( CLEAR ?auto_375 ) ( HAND-EMPTY ) ( not ( = ?auto_375 ?auto_377 ) ) ( not ( = ?auto_376 ?auto_377 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_375 ?auto_377 )
      ( MAKE-1PILE ?auto_375 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_378 - BLOCK
    )
    :vars
    (
      ?auto_379 - BLOCK
      ?auto_380 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_378 ?auto_379 ) ) ( ON ?auto_378 ?auto_380 ) ( CLEAR ?auto_378 ) ( not ( = ?auto_378 ?auto_380 ) ) ( not ( = ?auto_379 ?auto_380 ) ) ( HOLDING ?auto_379 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_379 )
      ( MAKE-1PILE ?auto_378 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_381 - BLOCK
    )
    :vars
    (
      ?auto_383 - BLOCK
      ?auto_382 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_381 ?auto_383 ) ) ( ON ?auto_381 ?auto_382 ) ( not ( = ?auto_381 ?auto_382 ) ) ( not ( = ?auto_383 ?auto_382 ) ) ( ON ?auto_383 ?auto_381 ) ( CLEAR ?auto_383 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_382 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_382 ?auto_381 )
      ( MAKE-1PILE ?auto_381 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_386 - BLOCK
      ?auto_387 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_387 ) ( CLEAR ?auto_386 ) ( ON-TABLE ?auto_386 ) ( not ( = ?auto_386 ?auto_387 ) ) )
    :subtasks
    ( ( !STACK ?auto_387 ?auto_386 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_388 - BLOCK
      ?auto_389 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_388 ) ( ON-TABLE ?auto_388 ) ( not ( = ?auto_388 ?auto_389 ) ) ( ON-TABLE ?auto_389 ) ( CLEAR ?auto_389 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_389 )
      ( MAKE-2PILE ?auto_388 ?auto_389 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_390 - BLOCK
      ?auto_391 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_390 ?auto_391 ) ) ( ON-TABLE ?auto_391 ) ( CLEAR ?auto_391 ) ( HOLDING ?auto_390 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_390 )
      ( MAKE-2PILE ?auto_390 ?auto_391 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_392 - BLOCK
      ?auto_393 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_392 ?auto_393 ) ) ( ON-TABLE ?auto_393 ) ( ON ?auto_392 ?auto_393 ) ( CLEAR ?auto_392 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_393 )
      ( MAKE-2PILE ?auto_392 ?auto_393 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_394 - BLOCK
      ?auto_395 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_394 ?auto_395 ) ) ( ON-TABLE ?auto_395 ) ( HOLDING ?auto_394 ) ( CLEAR ?auto_395 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_395 ?auto_394 )
      ( MAKE-2PILE ?auto_394 ?auto_395 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_396 - BLOCK
      ?auto_397 - BLOCK
    )
    :vars
    (
      ?auto_398 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_396 ?auto_397 ) ) ( ON-TABLE ?auto_397 ) ( CLEAR ?auto_397 ) ( ON ?auto_396 ?auto_398 ) ( CLEAR ?auto_396 ) ( HAND-EMPTY ) ( not ( = ?auto_396 ?auto_398 ) ) ( not ( = ?auto_397 ?auto_398 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_396 ?auto_398 )
      ( MAKE-2PILE ?auto_396 ?auto_397 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_399 - BLOCK
      ?auto_400 - BLOCK
    )
    :vars
    (
      ?auto_401 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_399 ?auto_400 ) ) ( ON ?auto_399 ?auto_401 ) ( CLEAR ?auto_399 ) ( not ( = ?auto_399 ?auto_401 ) ) ( not ( = ?auto_400 ?auto_401 ) ) ( HOLDING ?auto_400 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_400 )
      ( MAKE-2PILE ?auto_399 ?auto_400 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_402 - BLOCK
      ?auto_403 - BLOCK
    )
    :vars
    (
      ?auto_404 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_402 ?auto_403 ) ) ( ON ?auto_402 ?auto_404 ) ( not ( = ?auto_402 ?auto_404 ) ) ( not ( = ?auto_403 ?auto_404 ) ) ( ON ?auto_403 ?auto_402 ) ( CLEAR ?auto_403 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_404 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_404 ?auto_402 )
      ( MAKE-2PILE ?auto_402 ?auto_403 ) )
  )

)

