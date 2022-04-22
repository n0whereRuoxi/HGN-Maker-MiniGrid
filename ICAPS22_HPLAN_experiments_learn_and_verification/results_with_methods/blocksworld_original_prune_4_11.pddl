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
      ?auto_11336 - BLOCK
      ?auto_11337 - BLOCK
      ?auto_11338 - BLOCK
      ?auto_11339 - BLOCK
    )
    :vars
    (
      ?auto_11340 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_11340 ?auto_11339 ) ( CLEAR ?auto_11340 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_11336 ) ( ON ?auto_11337 ?auto_11336 ) ( ON ?auto_11338 ?auto_11337 ) ( ON ?auto_11339 ?auto_11338 ) ( not ( = ?auto_11336 ?auto_11337 ) ) ( not ( = ?auto_11336 ?auto_11338 ) ) ( not ( = ?auto_11336 ?auto_11339 ) ) ( not ( = ?auto_11336 ?auto_11340 ) ) ( not ( = ?auto_11337 ?auto_11338 ) ) ( not ( = ?auto_11337 ?auto_11339 ) ) ( not ( = ?auto_11337 ?auto_11340 ) ) ( not ( = ?auto_11338 ?auto_11339 ) ) ( not ( = ?auto_11338 ?auto_11340 ) ) ( not ( = ?auto_11339 ?auto_11340 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_11340 ?auto_11339 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_11342 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_11342 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_11342 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_11343 - BLOCK
    )
    :vars
    (
      ?auto_11344 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_11343 ?auto_11344 ) ( CLEAR ?auto_11343 ) ( HAND-EMPTY ) ( not ( = ?auto_11343 ?auto_11344 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_11343 ?auto_11344 )
      ( MAKE-1PILE ?auto_11343 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_11348 - BLOCK
      ?auto_11349 - BLOCK
      ?auto_11350 - BLOCK
    )
    :vars
    (
      ?auto_11351 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_11351 ?auto_11350 ) ( CLEAR ?auto_11351 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_11348 ) ( ON ?auto_11349 ?auto_11348 ) ( ON ?auto_11350 ?auto_11349 ) ( not ( = ?auto_11348 ?auto_11349 ) ) ( not ( = ?auto_11348 ?auto_11350 ) ) ( not ( = ?auto_11348 ?auto_11351 ) ) ( not ( = ?auto_11349 ?auto_11350 ) ) ( not ( = ?auto_11349 ?auto_11351 ) ) ( not ( = ?auto_11350 ?auto_11351 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_11351 ?auto_11350 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_11352 - BLOCK
      ?auto_11353 - BLOCK
      ?auto_11354 - BLOCK
    )
    :vars
    (
      ?auto_11355 - BLOCK
      ?auto_11356 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_11355 ?auto_11354 ) ( CLEAR ?auto_11355 ) ( ON-TABLE ?auto_11352 ) ( ON ?auto_11353 ?auto_11352 ) ( ON ?auto_11354 ?auto_11353 ) ( not ( = ?auto_11352 ?auto_11353 ) ) ( not ( = ?auto_11352 ?auto_11354 ) ) ( not ( = ?auto_11352 ?auto_11355 ) ) ( not ( = ?auto_11353 ?auto_11354 ) ) ( not ( = ?auto_11353 ?auto_11355 ) ) ( not ( = ?auto_11354 ?auto_11355 ) ) ( HOLDING ?auto_11356 ) ( not ( = ?auto_11352 ?auto_11356 ) ) ( not ( = ?auto_11353 ?auto_11356 ) ) ( not ( = ?auto_11354 ?auto_11356 ) ) ( not ( = ?auto_11355 ?auto_11356 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_11356 )
      ( MAKE-3PILE ?auto_11352 ?auto_11353 ?auto_11354 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_11357 - BLOCK
      ?auto_11358 - BLOCK
      ?auto_11359 - BLOCK
    )
    :vars
    (
      ?auto_11360 - BLOCK
      ?auto_11361 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_11360 ?auto_11359 ) ( ON-TABLE ?auto_11357 ) ( ON ?auto_11358 ?auto_11357 ) ( ON ?auto_11359 ?auto_11358 ) ( not ( = ?auto_11357 ?auto_11358 ) ) ( not ( = ?auto_11357 ?auto_11359 ) ) ( not ( = ?auto_11357 ?auto_11360 ) ) ( not ( = ?auto_11358 ?auto_11359 ) ) ( not ( = ?auto_11358 ?auto_11360 ) ) ( not ( = ?auto_11359 ?auto_11360 ) ) ( not ( = ?auto_11357 ?auto_11361 ) ) ( not ( = ?auto_11358 ?auto_11361 ) ) ( not ( = ?auto_11359 ?auto_11361 ) ) ( not ( = ?auto_11360 ?auto_11361 ) ) ( ON ?auto_11361 ?auto_11360 ) ( CLEAR ?auto_11361 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_11357 ?auto_11358 ?auto_11359 ?auto_11360 )
      ( MAKE-3PILE ?auto_11357 ?auto_11358 ?auto_11359 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_11364 - BLOCK
      ?auto_11365 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_11365 ) ( CLEAR ?auto_11364 ) ( ON-TABLE ?auto_11364 ) ( not ( = ?auto_11364 ?auto_11365 ) ) )
    :subtasks
    ( ( !STACK ?auto_11365 ?auto_11364 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_11366 - BLOCK
      ?auto_11367 - BLOCK
    )
    :vars
    (
      ?auto_11368 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_11366 ) ( ON-TABLE ?auto_11366 ) ( not ( = ?auto_11366 ?auto_11367 ) ) ( ON ?auto_11367 ?auto_11368 ) ( CLEAR ?auto_11367 ) ( HAND-EMPTY ) ( not ( = ?auto_11366 ?auto_11368 ) ) ( not ( = ?auto_11367 ?auto_11368 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_11367 ?auto_11368 )
      ( MAKE-2PILE ?auto_11366 ?auto_11367 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_11369 - BLOCK
      ?auto_11370 - BLOCK
    )
    :vars
    (
      ?auto_11371 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_11369 ?auto_11370 ) ) ( ON ?auto_11370 ?auto_11371 ) ( CLEAR ?auto_11370 ) ( not ( = ?auto_11369 ?auto_11371 ) ) ( not ( = ?auto_11370 ?auto_11371 ) ) ( HOLDING ?auto_11369 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_11369 )
      ( MAKE-2PILE ?auto_11369 ?auto_11370 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_11372 - BLOCK
      ?auto_11373 - BLOCK
    )
    :vars
    (
      ?auto_11374 - BLOCK
      ?auto_11375 - BLOCK
      ?auto_11376 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_11372 ?auto_11373 ) ) ( ON ?auto_11373 ?auto_11374 ) ( not ( = ?auto_11372 ?auto_11374 ) ) ( not ( = ?auto_11373 ?auto_11374 ) ) ( ON ?auto_11372 ?auto_11373 ) ( CLEAR ?auto_11372 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_11375 ) ( ON ?auto_11376 ?auto_11375 ) ( ON ?auto_11374 ?auto_11376 ) ( not ( = ?auto_11375 ?auto_11376 ) ) ( not ( = ?auto_11375 ?auto_11374 ) ) ( not ( = ?auto_11375 ?auto_11373 ) ) ( not ( = ?auto_11375 ?auto_11372 ) ) ( not ( = ?auto_11376 ?auto_11374 ) ) ( not ( = ?auto_11376 ?auto_11373 ) ) ( not ( = ?auto_11376 ?auto_11372 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_11375 ?auto_11376 ?auto_11374 ?auto_11373 )
      ( MAKE-2PILE ?auto_11372 ?auto_11373 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_11379 - BLOCK
      ?auto_11380 - BLOCK
    )
    :vars
    (
      ?auto_11381 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_11381 ?auto_11380 ) ( CLEAR ?auto_11381 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_11379 ) ( ON ?auto_11380 ?auto_11379 ) ( not ( = ?auto_11379 ?auto_11380 ) ) ( not ( = ?auto_11379 ?auto_11381 ) ) ( not ( = ?auto_11380 ?auto_11381 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_11381 ?auto_11380 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_11382 - BLOCK
      ?auto_11383 - BLOCK
    )
    :vars
    (
      ?auto_11384 - BLOCK
      ?auto_11385 - BLOCK
      ?auto_11386 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_11384 ?auto_11383 ) ( CLEAR ?auto_11384 ) ( ON-TABLE ?auto_11382 ) ( ON ?auto_11383 ?auto_11382 ) ( not ( = ?auto_11382 ?auto_11383 ) ) ( not ( = ?auto_11382 ?auto_11384 ) ) ( not ( = ?auto_11383 ?auto_11384 ) ) ( HOLDING ?auto_11385 ) ( CLEAR ?auto_11386 ) ( not ( = ?auto_11382 ?auto_11385 ) ) ( not ( = ?auto_11382 ?auto_11386 ) ) ( not ( = ?auto_11383 ?auto_11385 ) ) ( not ( = ?auto_11383 ?auto_11386 ) ) ( not ( = ?auto_11384 ?auto_11385 ) ) ( not ( = ?auto_11384 ?auto_11386 ) ) ( not ( = ?auto_11385 ?auto_11386 ) ) )
    :subtasks
    ( ( !STACK ?auto_11385 ?auto_11386 )
      ( MAKE-2PILE ?auto_11382 ?auto_11383 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_11582 - BLOCK
      ?auto_11583 - BLOCK
    )
    :vars
    (
      ?auto_11584 - BLOCK
      ?auto_11585 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_11584 ?auto_11583 ) ( ON-TABLE ?auto_11582 ) ( ON ?auto_11583 ?auto_11582 ) ( not ( = ?auto_11582 ?auto_11583 ) ) ( not ( = ?auto_11582 ?auto_11584 ) ) ( not ( = ?auto_11583 ?auto_11584 ) ) ( not ( = ?auto_11582 ?auto_11585 ) ) ( not ( = ?auto_11583 ?auto_11585 ) ) ( not ( = ?auto_11584 ?auto_11585 ) ) ( ON ?auto_11585 ?auto_11584 ) ( CLEAR ?auto_11585 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_11582 ?auto_11583 ?auto_11584 )
      ( MAKE-2PILE ?auto_11582 ?auto_11583 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_11392 - BLOCK
      ?auto_11393 - BLOCK
    )
    :vars
    (
      ?auto_11396 - BLOCK
      ?auto_11394 - BLOCK
      ?auto_11395 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_11396 ?auto_11393 ) ( ON-TABLE ?auto_11392 ) ( ON ?auto_11393 ?auto_11392 ) ( not ( = ?auto_11392 ?auto_11393 ) ) ( not ( = ?auto_11392 ?auto_11396 ) ) ( not ( = ?auto_11393 ?auto_11396 ) ) ( not ( = ?auto_11392 ?auto_11394 ) ) ( not ( = ?auto_11392 ?auto_11395 ) ) ( not ( = ?auto_11393 ?auto_11394 ) ) ( not ( = ?auto_11393 ?auto_11395 ) ) ( not ( = ?auto_11396 ?auto_11394 ) ) ( not ( = ?auto_11396 ?auto_11395 ) ) ( not ( = ?auto_11394 ?auto_11395 ) ) ( ON ?auto_11394 ?auto_11396 ) ( CLEAR ?auto_11394 ) ( HOLDING ?auto_11395 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_11395 )
      ( MAKE-2PILE ?auto_11392 ?auto_11393 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_11397 - BLOCK
      ?auto_11398 - BLOCK
    )
    :vars
    (
      ?auto_11399 - BLOCK
      ?auto_11401 - BLOCK
      ?auto_11400 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_11399 ?auto_11398 ) ( ON-TABLE ?auto_11397 ) ( ON ?auto_11398 ?auto_11397 ) ( not ( = ?auto_11397 ?auto_11398 ) ) ( not ( = ?auto_11397 ?auto_11399 ) ) ( not ( = ?auto_11398 ?auto_11399 ) ) ( not ( = ?auto_11397 ?auto_11401 ) ) ( not ( = ?auto_11397 ?auto_11400 ) ) ( not ( = ?auto_11398 ?auto_11401 ) ) ( not ( = ?auto_11398 ?auto_11400 ) ) ( not ( = ?auto_11399 ?auto_11401 ) ) ( not ( = ?auto_11399 ?auto_11400 ) ) ( not ( = ?auto_11401 ?auto_11400 ) ) ( ON ?auto_11401 ?auto_11399 ) ( ON ?auto_11400 ?auto_11401 ) ( CLEAR ?auto_11400 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_11397 ?auto_11398 ?auto_11399 ?auto_11401 )
      ( MAKE-2PILE ?auto_11397 ?auto_11398 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_11405 - BLOCK
      ?auto_11406 - BLOCK
      ?auto_11407 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_11407 ) ( CLEAR ?auto_11406 ) ( ON-TABLE ?auto_11405 ) ( ON ?auto_11406 ?auto_11405 ) ( not ( = ?auto_11405 ?auto_11406 ) ) ( not ( = ?auto_11405 ?auto_11407 ) ) ( not ( = ?auto_11406 ?auto_11407 ) ) )
    :subtasks
    ( ( !STACK ?auto_11407 ?auto_11406 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_11408 - BLOCK
      ?auto_11409 - BLOCK
      ?auto_11410 - BLOCK
    )
    :vars
    (
      ?auto_11411 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_11409 ) ( ON-TABLE ?auto_11408 ) ( ON ?auto_11409 ?auto_11408 ) ( not ( = ?auto_11408 ?auto_11409 ) ) ( not ( = ?auto_11408 ?auto_11410 ) ) ( not ( = ?auto_11409 ?auto_11410 ) ) ( ON ?auto_11410 ?auto_11411 ) ( CLEAR ?auto_11410 ) ( HAND-EMPTY ) ( not ( = ?auto_11408 ?auto_11411 ) ) ( not ( = ?auto_11409 ?auto_11411 ) ) ( not ( = ?auto_11410 ?auto_11411 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_11410 ?auto_11411 )
      ( MAKE-3PILE ?auto_11408 ?auto_11409 ?auto_11410 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_11412 - BLOCK
      ?auto_11413 - BLOCK
      ?auto_11414 - BLOCK
    )
    :vars
    (
      ?auto_11415 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_11412 ) ( not ( = ?auto_11412 ?auto_11413 ) ) ( not ( = ?auto_11412 ?auto_11414 ) ) ( not ( = ?auto_11413 ?auto_11414 ) ) ( ON ?auto_11414 ?auto_11415 ) ( CLEAR ?auto_11414 ) ( not ( = ?auto_11412 ?auto_11415 ) ) ( not ( = ?auto_11413 ?auto_11415 ) ) ( not ( = ?auto_11414 ?auto_11415 ) ) ( HOLDING ?auto_11413 ) ( CLEAR ?auto_11412 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_11412 ?auto_11413 )
      ( MAKE-3PILE ?auto_11412 ?auto_11413 ?auto_11414 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_11416 - BLOCK
      ?auto_11417 - BLOCK
      ?auto_11418 - BLOCK
    )
    :vars
    (
      ?auto_11419 - BLOCK
      ?auto_11420 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_11416 ) ( not ( = ?auto_11416 ?auto_11417 ) ) ( not ( = ?auto_11416 ?auto_11418 ) ) ( not ( = ?auto_11417 ?auto_11418 ) ) ( ON ?auto_11418 ?auto_11419 ) ( not ( = ?auto_11416 ?auto_11419 ) ) ( not ( = ?auto_11417 ?auto_11419 ) ) ( not ( = ?auto_11418 ?auto_11419 ) ) ( CLEAR ?auto_11416 ) ( ON ?auto_11417 ?auto_11418 ) ( CLEAR ?auto_11417 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_11420 ) ( ON ?auto_11419 ?auto_11420 ) ( not ( = ?auto_11420 ?auto_11419 ) ) ( not ( = ?auto_11420 ?auto_11418 ) ) ( not ( = ?auto_11420 ?auto_11417 ) ) ( not ( = ?auto_11416 ?auto_11420 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_11420 ?auto_11419 ?auto_11418 )
      ( MAKE-3PILE ?auto_11416 ?auto_11417 ?auto_11418 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_11421 - BLOCK
      ?auto_11422 - BLOCK
      ?auto_11423 - BLOCK
    )
    :vars
    (
      ?auto_11425 - BLOCK
      ?auto_11424 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_11421 ?auto_11422 ) ) ( not ( = ?auto_11421 ?auto_11423 ) ) ( not ( = ?auto_11422 ?auto_11423 ) ) ( ON ?auto_11423 ?auto_11425 ) ( not ( = ?auto_11421 ?auto_11425 ) ) ( not ( = ?auto_11422 ?auto_11425 ) ) ( not ( = ?auto_11423 ?auto_11425 ) ) ( ON ?auto_11422 ?auto_11423 ) ( CLEAR ?auto_11422 ) ( ON-TABLE ?auto_11424 ) ( ON ?auto_11425 ?auto_11424 ) ( not ( = ?auto_11424 ?auto_11425 ) ) ( not ( = ?auto_11424 ?auto_11423 ) ) ( not ( = ?auto_11424 ?auto_11422 ) ) ( not ( = ?auto_11421 ?auto_11424 ) ) ( HOLDING ?auto_11421 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_11421 )
      ( MAKE-3PILE ?auto_11421 ?auto_11422 ?auto_11423 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_11426 - BLOCK
      ?auto_11427 - BLOCK
      ?auto_11428 - BLOCK
    )
    :vars
    (
      ?auto_11430 - BLOCK
      ?auto_11429 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_11426 ?auto_11427 ) ) ( not ( = ?auto_11426 ?auto_11428 ) ) ( not ( = ?auto_11427 ?auto_11428 ) ) ( ON ?auto_11428 ?auto_11430 ) ( not ( = ?auto_11426 ?auto_11430 ) ) ( not ( = ?auto_11427 ?auto_11430 ) ) ( not ( = ?auto_11428 ?auto_11430 ) ) ( ON ?auto_11427 ?auto_11428 ) ( ON-TABLE ?auto_11429 ) ( ON ?auto_11430 ?auto_11429 ) ( not ( = ?auto_11429 ?auto_11430 ) ) ( not ( = ?auto_11429 ?auto_11428 ) ) ( not ( = ?auto_11429 ?auto_11427 ) ) ( not ( = ?auto_11426 ?auto_11429 ) ) ( ON ?auto_11426 ?auto_11427 ) ( CLEAR ?auto_11426 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_11429 ?auto_11430 ?auto_11428 ?auto_11427 )
      ( MAKE-3PILE ?auto_11426 ?auto_11427 ?auto_11428 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_11432 - BLOCK
    )
    :vars
    (
      ?auto_11433 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_11433 ?auto_11432 ) ( CLEAR ?auto_11433 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_11432 ) ( not ( = ?auto_11432 ?auto_11433 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_11433 ?auto_11432 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_11434 - BLOCK
    )
    :vars
    (
      ?auto_11435 - BLOCK
      ?auto_11436 - BLOCK
      ?auto_11437 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_11435 ?auto_11434 ) ( CLEAR ?auto_11435 ) ( ON-TABLE ?auto_11434 ) ( not ( = ?auto_11434 ?auto_11435 ) ) ( HOLDING ?auto_11436 ) ( CLEAR ?auto_11437 ) ( not ( = ?auto_11434 ?auto_11436 ) ) ( not ( = ?auto_11434 ?auto_11437 ) ) ( not ( = ?auto_11435 ?auto_11436 ) ) ( not ( = ?auto_11435 ?auto_11437 ) ) ( not ( = ?auto_11436 ?auto_11437 ) ) )
    :subtasks
    ( ( !STACK ?auto_11436 ?auto_11437 )
      ( MAKE-1PILE ?auto_11434 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_11438 - BLOCK
    )
    :vars
    (
      ?auto_11440 - BLOCK
      ?auto_11441 - BLOCK
      ?auto_11439 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_11440 ?auto_11438 ) ( ON-TABLE ?auto_11438 ) ( not ( = ?auto_11438 ?auto_11440 ) ) ( CLEAR ?auto_11441 ) ( not ( = ?auto_11438 ?auto_11439 ) ) ( not ( = ?auto_11438 ?auto_11441 ) ) ( not ( = ?auto_11440 ?auto_11439 ) ) ( not ( = ?auto_11440 ?auto_11441 ) ) ( not ( = ?auto_11439 ?auto_11441 ) ) ( ON ?auto_11439 ?auto_11440 ) ( CLEAR ?auto_11439 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_11438 ?auto_11440 )
      ( MAKE-1PILE ?auto_11438 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_11442 - BLOCK
    )
    :vars
    (
      ?auto_11445 - BLOCK
      ?auto_11444 - BLOCK
      ?auto_11443 - BLOCK
      ?auto_11446 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_11445 ?auto_11442 ) ( ON-TABLE ?auto_11442 ) ( not ( = ?auto_11442 ?auto_11445 ) ) ( not ( = ?auto_11442 ?auto_11444 ) ) ( not ( = ?auto_11442 ?auto_11443 ) ) ( not ( = ?auto_11445 ?auto_11444 ) ) ( not ( = ?auto_11445 ?auto_11443 ) ) ( not ( = ?auto_11444 ?auto_11443 ) ) ( ON ?auto_11444 ?auto_11445 ) ( CLEAR ?auto_11444 ) ( HOLDING ?auto_11443 ) ( CLEAR ?auto_11446 ) ( ON-TABLE ?auto_11446 ) ( not ( = ?auto_11446 ?auto_11443 ) ) ( not ( = ?auto_11442 ?auto_11446 ) ) ( not ( = ?auto_11445 ?auto_11446 ) ) ( not ( = ?auto_11444 ?auto_11446 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_11446 ?auto_11443 )
      ( MAKE-1PILE ?auto_11442 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_11670 - BLOCK
    )
    :vars
    (
      ?auto_11673 - BLOCK
      ?auto_11672 - BLOCK
      ?auto_11671 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_11673 ?auto_11670 ) ( ON-TABLE ?auto_11670 ) ( not ( = ?auto_11670 ?auto_11673 ) ) ( not ( = ?auto_11670 ?auto_11672 ) ) ( not ( = ?auto_11670 ?auto_11671 ) ) ( not ( = ?auto_11673 ?auto_11672 ) ) ( not ( = ?auto_11673 ?auto_11671 ) ) ( not ( = ?auto_11672 ?auto_11671 ) ) ( ON ?auto_11672 ?auto_11673 ) ( ON ?auto_11671 ?auto_11672 ) ( CLEAR ?auto_11671 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_11670 ?auto_11673 ?auto_11672 )
      ( MAKE-1PILE ?auto_11670 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_11452 - BLOCK
    )
    :vars
    (
      ?auto_11455 - BLOCK
      ?auto_11456 - BLOCK
      ?auto_11453 - BLOCK
      ?auto_11454 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_11455 ?auto_11452 ) ( ON-TABLE ?auto_11452 ) ( not ( = ?auto_11452 ?auto_11455 ) ) ( not ( = ?auto_11452 ?auto_11456 ) ) ( not ( = ?auto_11452 ?auto_11453 ) ) ( not ( = ?auto_11455 ?auto_11456 ) ) ( not ( = ?auto_11455 ?auto_11453 ) ) ( not ( = ?auto_11456 ?auto_11453 ) ) ( ON ?auto_11456 ?auto_11455 ) ( not ( = ?auto_11454 ?auto_11453 ) ) ( not ( = ?auto_11452 ?auto_11454 ) ) ( not ( = ?auto_11455 ?auto_11454 ) ) ( not ( = ?auto_11456 ?auto_11454 ) ) ( ON ?auto_11453 ?auto_11456 ) ( CLEAR ?auto_11453 ) ( HOLDING ?auto_11454 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_11454 )
      ( MAKE-1PILE ?auto_11452 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_11457 - BLOCK
    )
    :vars
    (
      ?auto_11459 - BLOCK
      ?auto_11460 - BLOCK
      ?auto_11461 - BLOCK
      ?auto_11458 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_11459 ?auto_11457 ) ( ON-TABLE ?auto_11457 ) ( not ( = ?auto_11457 ?auto_11459 ) ) ( not ( = ?auto_11457 ?auto_11460 ) ) ( not ( = ?auto_11457 ?auto_11461 ) ) ( not ( = ?auto_11459 ?auto_11460 ) ) ( not ( = ?auto_11459 ?auto_11461 ) ) ( not ( = ?auto_11460 ?auto_11461 ) ) ( ON ?auto_11460 ?auto_11459 ) ( not ( = ?auto_11458 ?auto_11461 ) ) ( not ( = ?auto_11457 ?auto_11458 ) ) ( not ( = ?auto_11459 ?auto_11458 ) ) ( not ( = ?auto_11460 ?auto_11458 ) ) ( ON ?auto_11461 ?auto_11460 ) ( ON ?auto_11458 ?auto_11461 ) ( CLEAR ?auto_11458 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_11457 ?auto_11459 ?auto_11460 ?auto_11461 )
      ( MAKE-1PILE ?auto_11457 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_11466 - BLOCK
      ?auto_11467 - BLOCK
      ?auto_11468 - BLOCK
      ?auto_11469 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_11469 ) ( CLEAR ?auto_11468 ) ( ON-TABLE ?auto_11466 ) ( ON ?auto_11467 ?auto_11466 ) ( ON ?auto_11468 ?auto_11467 ) ( not ( = ?auto_11466 ?auto_11467 ) ) ( not ( = ?auto_11466 ?auto_11468 ) ) ( not ( = ?auto_11466 ?auto_11469 ) ) ( not ( = ?auto_11467 ?auto_11468 ) ) ( not ( = ?auto_11467 ?auto_11469 ) ) ( not ( = ?auto_11468 ?auto_11469 ) ) )
    :subtasks
    ( ( !STACK ?auto_11469 ?auto_11468 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_11470 - BLOCK
      ?auto_11471 - BLOCK
      ?auto_11472 - BLOCK
      ?auto_11473 - BLOCK
    )
    :vars
    (
      ?auto_11474 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_11472 ) ( ON-TABLE ?auto_11470 ) ( ON ?auto_11471 ?auto_11470 ) ( ON ?auto_11472 ?auto_11471 ) ( not ( = ?auto_11470 ?auto_11471 ) ) ( not ( = ?auto_11470 ?auto_11472 ) ) ( not ( = ?auto_11470 ?auto_11473 ) ) ( not ( = ?auto_11471 ?auto_11472 ) ) ( not ( = ?auto_11471 ?auto_11473 ) ) ( not ( = ?auto_11472 ?auto_11473 ) ) ( ON ?auto_11473 ?auto_11474 ) ( CLEAR ?auto_11473 ) ( HAND-EMPTY ) ( not ( = ?auto_11470 ?auto_11474 ) ) ( not ( = ?auto_11471 ?auto_11474 ) ) ( not ( = ?auto_11472 ?auto_11474 ) ) ( not ( = ?auto_11473 ?auto_11474 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_11473 ?auto_11474 )
      ( MAKE-4PILE ?auto_11470 ?auto_11471 ?auto_11472 ?auto_11473 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_11475 - BLOCK
      ?auto_11476 - BLOCK
      ?auto_11477 - BLOCK
      ?auto_11478 - BLOCK
    )
    :vars
    (
      ?auto_11479 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_11475 ) ( ON ?auto_11476 ?auto_11475 ) ( not ( = ?auto_11475 ?auto_11476 ) ) ( not ( = ?auto_11475 ?auto_11477 ) ) ( not ( = ?auto_11475 ?auto_11478 ) ) ( not ( = ?auto_11476 ?auto_11477 ) ) ( not ( = ?auto_11476 ?auto_11478 ) ) ( not ( = ?auto_11477 ?auto_11478 ) ) ( ON ?auto_11478 ?auto_11479 ) ( CLEAR ?auto_11478 ) ( not ( = ?auto_11475 ?auto_11479 ) ) ( not ( = ?auto_11476 ?auto_11479 ) ) ( not ( = ?auto_11477 ?auto_11479 ) ) ( not ( = ?auto_11478 ?auto_11479 ) ) ( HOLDING ?auto_11477 ) ( CLEAR ?auto_11476 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_11475 ?auto_11476 ?auto_11477 )
      ( MAKE-4PILE ?auto_11475 ?auto_11476 ?auto_11477 ?auto_11478 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_11480 - BLOCK
      ?auto_11481 - BLOCK
      ?auto_11482 - BLOCK
      ?auto_11483 - BLOCK
    )
    :vars
    (
      ?auto_11484 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_11480 ) ( ON ?auto_11481 ?auto_11480 ) ( not ( = ?auto_11480 ?auto_11481 ) ) ( not ( = ?auto_11480 ?auto_11482 ) ) ( not ( = ?auto_11480 ?auto_11483 ) ) ( not ( = ?auto_11481 ?auto_11482 ) ) ( not ( = ?auto_11481 ?auto_11483 ) ) ( not ( = ?auto_11482 ?auto_11483 ) ) ( ON ?auto_11483 ?auto_11484 ) ( not ( = ?auto_11480 ?auto_11484 ) ) ( not ( = ?auto_11481 ?auto_11484 ) ) ( not ( = ?auto_11482 ?auto_11484 ) ) ( not ( = ?auto_11483 ?auto_11484 ) ) ( CLEAR ?auto_11481 ) ( ON ?auto_11482 ?auto_11483 ) ( CLEAR ?auto_11482 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_11484 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_11484 ?auto_11483 )
      ( MAKE-4PILE ?auto_11480 ?auto_11481 ?auto_11482 ?auto_11483 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_11485 - BLOCK
      ?auto_11486 - BLOCK
      ?auto_11487 - BLOCK
      ?auto_11488 - BLOCK
    )
    :vars
    (
      ?auto_11489 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_11485 ) ( not ( = ?auto_11485 ?auto_11486 ) ) ( not ( = ?auto_11485 ?auto_11487 ) ) ( not ( = ?auto_11485 ?auto_11488 ) ) ( not ( = ?auto_11486 ?auto_11487 ) ) ( not ( = ?auto_11486 ?auto_11488 ) ) ( not ( = ?auto_11487 ?auto_11488 ) ) ( ON ?auto_11488 ?auto_11489 ) ( not ( = ?auto_11485 ?auto_11489 ) ) ( not ( = ?auto_11486 ?auto_11489 ) ) ( not ( = ?auto_11487 ?auto_11489 ) ) ( not ( = ?auto_11488 ?auto_11489 ) ) ( ON ?auto_11487 ?auto_11488 ) ( CLEAR ?auto_11487 ) ( ON-TABLE ?auto_11489 ) ( HOLDING ?auto_11486 ) ( CLEAR ?auto_11485 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_11485 ?auto_11486 )
      ( MAKE-4PILE ?auto_11485 ?auto_11486 ?auto_11487 ?auto_11488 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_11490 - BLOCK
      ?auto_11491 - BLOCK
      ?auto_11492 - BLOCK
      ?auto_11493 - BLOCK
    )
    :vars
    (
      ?auto_11494 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_11490 ) ( not ( = ?auto_11490 ?auto_11491 ) ) ( not ( = ?auto_11490 ?auto_11492 ) ) ( not ( = ?auto_11490 ?auto_11493 ) ) ( not ( = ?auto_11491 ?auto_11492 ) ) ( not ( = ?auto_11491 ?auto_11493 ) ) ( not ( = ?auto_11492 ?auto_11493 ) ) ( ON ?auto_11493 ?auto_11494 ) ( not ( = ?auto_11490 ?auto_11494 ) ) ( not ( = ?auto_11491 ?auto_11494 ) ) ( not ( = ?auto_11492 ?auto_11494 ) ) ( not ( = ?auto_11493 ?auto_11494 ) ) ( ON ?auto_11492 ?auto_11493 ) ( ON-TABLE ?auto_11494 ) ( CLEAR ?auto_11490 ) ( ON ?auto_11491 ?auto_11492 ) ( CLEAR ?auto_11491 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_11494 ?auto_11493 ?auto_11492 )
      ( MAKE-4PILE ?auto_11490 ?auto_11491 ?auto_11492 ?auto_11493 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_11495 - BLOCK
      ?auto_11496 - BLOCK
      ?auto_11497 - BLOCK
      ?auto_11498 - BLOCK
    )
    :vars
    (
      ?auto_11499 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_11495 ?auto_11496 ) ) ( not ( = ?auto_11495 ?auto_11497 ) ) ( not ( = ?auto_11495 ?auto_11498 ) ) ( not ( = ?auto_11496 ?auto_11497 ) ) ( not ( = ?auto_11496 ?auto_11498 ) ) ( not ( = ?auto_11497 ?auto_11498 ) ) ( ON ?auto_11498 ?auto_11499 ) ( not ( = ?auto_11495 ?auto_11499 ) ) ( not ( = ?auto_11496 ?auto_11499 ) ) ( not ( = ?auto_11497 ?auto_11499 ) ) ( not ( = ?auto_11498 ?auto_11499 ) ) ( ON ?auto_11497 ?auto_11498 ) ( ON-TABLE ?auto_11499 ) ( ON ?auto_11496 ?auto_11497 ) ( CLEAR ?auto_11496 ) ( HOLDING ?auto_11495 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_11495 )
      ( MAKE-4PILE ?auto_11495 ?auto_11496 ?auto_11497 ?auto_11498 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_11500 - BLOCK
      ?auto_11501 - BLOCK
      ?auto_11502 - BLOCK
      ?auto_11503 - BLOCK
    )
    :vars
    (
      ?auto_11504 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_11500 ?auto_11501 ) ) ( not ( = ?auto_11500 ?auto_11502 ) ) ( not ( = ?auto_11500 ?auto_11503 ) ) ( not ( = ?auto_11501 ?auto_11502 ) ) ( not ( = ?auto_11501 ?auto_11503 ) ) ( not ( = ?auto_11502 ?auto_11503 ) ) ( ON ?auto_11503 ?auto_11504 ) ( not ( = ?auto_11500 ?auto_11504 ) ) ( not ( = ?auto_11501 ?auto_11504 ) ) ( not ( = ?auto_11502 ?auto_11504 ) ) ( not ( = ?auto_11503 ?auto_11504 ) ) ( ON ?auto_11502 ?auto_11503 ) ( ON-TABLE ?auto_11504 ) ( ON ?auto_11501 ?auto_11502 ) ( ON ?auto_11500 ?auto_11501 ) ( CLEAR ?auto_11500 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_11504 ?auto_11503 ?auto_11502 ?auto_11501 )
      ( MAKE-4PILE ?auto_11500 ?auto_11501 ?auto_11502 ?auto_11503 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_11545 - BLOCK
    )
    :vars
    (
      ?auto_11546 - BLOCK
      ?auto_11547 - BLOCK
      ?auto_11548 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_11545 ?auto_11546 ) ( CLEAR ?auto_11545 ) ( not ( = ?auto_11545 ?auto_11546 ) ) ( HOLDING ?auto_11547 ) ( CLEAR ?auto_11548 ) ( not ( = ?auto_11545 ?auto_11547 ) ) ( not ( = ?auto_11545 ?auto_11548 ) ) ( not ( = ?auto_11546 ?auto_11547 ) ) ( not ( = ?auto_11546 ?auto_11548 ) ) ( not ( = ?auto_11547 ?auto_11548 ) ) )
    :subtasks
    ( ( !STACK ?auto_11547 ?auto_11548 )
      ( MAKE-1PILE ?auto_11545 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_11549 - BLOCK
    )
    :vars
    (
      ?auto_11551 - BLOCK
      ?auto_11550 - BLOCK
      ?auto_11552 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_11549 ?auto_11551 ) ( not ( = ?auto_11549 ?auto_11551 ) ) ( CLEAR ?auto_11550 ) ( not ( = ?auto_11549 ?auto_11552 ) ) ( not ( = ?auto_11549 ?auto_11550 ) ) ( not ( = ?auto_11551 ?auto_11552 ) ) ( not ( = ?auto_11551 ?auto_11550 ) ) ( not ( = ?auto_11552 ?auto_11550 ) ) ( ON ?auto_11552 ?auto_11549 ) ( CLEAR ?auto_11552 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_11551 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_11551 ?auto_11549 )
      ( MAKE-1PILE ?auto_11549 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_11553 - BLOCK
    )
    :vars
    (
      ?auto_11555 - BLOCK
      ?auto_11556 - BLOCK
      ?auto_11554 - BLOCK
      ?auto_11557 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_11553 ?auto_11555 ) ( not ( = ?auto_11553 ?auto_11555 ) ) ( not ( = ?auto_11553 ?auto_11556 ) ) ( not ( = ?auto_11553 ?auto_11554 ) ) ( not ( = ?auto_11555 ?auto_11556 ) ) ( not ( = ?auto_11555 ?auto_11554 ) ) ( not ( = ?auto_11556 ?auto_11554 ) ) ( ON ?auto_11556 ?auto_11553 ) ( CLEAR ?auto_11556 ) ( ON-TABLE ?auto_11555 ) ( HOLDING ?auto_11554 ) ( CLEAR ?auto_11557 ) ( ON-TABLE ?auto_11557 ) ( not ( = ?auto_11557 ?auto_11554 ) ) ( not ( = ?auto_11553 ?auto_11557 ) ) ( not ( = ?auto_11555 ?auto_11557 ) ) ( not ( = ?auto_11556 ?auto_11557 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_11557 ?auto_11554 )
      ( MAKE-1PILE ?auto_11553 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_11558 - BLOCK
    )
    :vars
    (
      ?auto_11561 - BLOCK
      ?auto_11559 - BLOCK
      ?auto_11560 - BLOCK
      ?auto_11562 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_11558 ?auto_11561 ) ( not ( = ?auto_11558 ?auto_11561 ) ) ( not ( = ?auto_11558 ?auto_11559 ) ) ( not ( = ?auto_11558 ?auto_11560 ) ) ( not ( = ?auto_11561 ?auto_11559 ) ) ( not ( = ?auto_11561 ?auto_11560 ) ) ( not ( = ?auto_11559 ?auto_11560 ) ) ( ON ?auto_11559 ?auto_11558 ) ( ON-TABLE ?auto_11561 ) ( CLEAR ?auto_11562 ) ( ON-TABLE ?auto_11562 ) ( not ( = ?auto_11562 ?auto_11560 ) ) ( not ( = ?auto_11558 ?auto_11562 ) ) ( not ( = ?auto_11561 ?auto_11562 ) ) ( not ( = ?auto_11559 ?auto_11562 ) ) ( ON ?auto_11560 ?auto_11559 ) ( CLEAR ?auto_11560 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_11561 ?auto_11558 ?auto_11559 )
      ( MAKE-1PILE ?auto_11558 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_11563 - BLOCK
    )
    :vars
    (
      ?auto_11565 - BLOCK
      ?auto_11564 - BLOCK
      ?auto_11566 - BLOCK
      ?auto_11567 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_11563 ?auto_11565 ) ( not ( = ?auto_11563 ?auto_11565 ) ) ( not ( = ?auto_11563 ?auto_11564 ) ) ( not ( = ?auto_11563 ?auto_11566 ) ) ( not ( = ?auto_11565 ?auto_11564 ) ) ( not ( = ?auto_11565 ?auto_11566 ) ) ( not ( = ?auto_11564 ?auto_11566 ) ) ( ON ?auto_11564 ?auto_11563 ) ( ON-TABLE ?auto_11565 ) ( not ( = ?auto_11567 ?auto_11566 ) ) ( not ( = ?auto_11563 ?auto_11567 ) ) ( not ( = ?auto_11565 ?auto_11567 ) ) ( not ( = ?auto_11564 ?auto_11567 ) ) ( ON ?auto_11566 ?auto_11564 ) ( CLEAR ?auto_11566 ) ( HOLDING ?auto_11567 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_11567 )
      ( MAKE-1PILE ?auto_11563 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_11568 - BLOCK
    )
    :vars
    (
      ?auto_11571 - BLOCK
      ?auto_11572 - BLOCK
      ?auto_11570 - BLOCK
      ?auto_11569 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_11568 ?auto_11571 ) ( not ( = ?auto_11568 ?auto_11571 ) ) ( not ( = ?auto_11568 ?auto_11572 ) ) ( not ( = ?auto_11568 ?auto_11570 ) ) ( not ( = ?auto_11571 ?auto_11572 ) ) ( not ( = ?auto_11571 ?auto_11570 ) ) ( not ( = ?auto_11572 ?auto_11570 ) ) ( ON ?auto_11572 ?auto_11568 ) ( ON-TABLE ?auto_11571 ) ( not ( = ?auto_11569 ?auto_11570 ) ) ( not ( = ?auto_11568 ?auto_11569 ) ) ( not ( = ?auto_11571 ?auto_11569 ) ) ( not ( = ?auto_11572 ?auto_11569 ) ) ( ON ?auto_11570 ?auto_11572 ) ( ON ?auto_11569 ?auto_11570 ) ( CLEAR ?auto_11569 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_11571 ?auto_11568 ?auto_11572 ?auto_11570 )
      ( MAKE-1PILE ?auto_11568 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_11578 - BLOCK
      ?auto_11579 - BLOCK
    )
    :vars
    (
      ?auto_11580 - BLOCK
      ?auto_11581 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_11580 ?auto_11579 ) ( CLEAR ?auto_11580 ) ( ON-TABLE ?auto_11578 ) ( ON ?auto_11579 ?auto_11578 ) ( not ( = ?auto_11578 ?auto_11579 ) ) ( not ( = ?auto_11578 ?auto_11580 ) ) ( not ( = ?auto_11579 ?auto_11580 ) ) ( HOLDING ?auto_11581 ) ( not ( = ?auto_11578 ?auto_11581 ) ) ( not ( = ?auto_11579 ?auto_11581 ) ) ( not ( = ?auto_11580 ?auto_11581 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_11581 )
      ( MAKE-2PILE ?auto_11578 ?auto_11579 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_11615 - BLOCK
      ?auto_11616 - BLOCK
    )
    :vars
    (
      ?auto_11617 - BLOCK
      ?auto_11618 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_11615 ?auto_11616 ) ) ( ON ?auto_11616 ?auto_11617 ) ( not ( = ?auto_11615 ?auto_11617 ) ) ( not ( = ?auto_11616 ?auto_11617 ) ) ( ON ?auto_11615 ?auto_11616 ) ( CLEAR ?auto_11615 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_11618 ) ( ON ?auto_11617 ?auto_11618 ) ( not ( = ?auto_11618 ?auto_11617 ) ) ( not ( = ?auto_11618 ?auto_11616 ) ) ( not ( = ?auto_11618 ?auto_11615 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_11618 ?auto_11617 ?auto_11616 )
      ( MAKE-2PILE ?auto_11615 ?auto_11616 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_11621 - BLOCK
      ?auto_11622 - BLOCK
    )
    :vars
    (
      ?auto_11623 - BLOCK
      ?auto_11624 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_11621 ?auto_11622 ) ) ( ON ?auto_11622 ?auto_11623 ) ( CLEAR ?auto_11622 ) ( not ( = ?auto_11621 ?auto_11623 ) ) ( not ( = ?auto_11622 ?auto_11623 ) ) ( ON ?auto_11621 ?auto_11624 ) ( CLEAR ?auto_11621 ) ( HAND-EMPTY ) ( not ( = ?auto_11621 ?auto_11624 ) ) ( not ( = ?auto_11622 ?auto_11624 ) ) ( not ( = ?auto_11623 ?auto_11624 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_11621 ?auto_11624 )
      ( MAKE-2PILE ?auto_11621 ?auto_11622 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_11625 - BLOCK
      ?auto_11626 - BLOCK
    )
    :vars
    (
      ?auto_11628 - BLOCK
      ?auto_11627 - BLOCK
      ?auto_11629 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_11625 ?auto_11626 ) ) ( not ( = ?auto_11625 ?auto_11628 ) ) ( not ( = ?auto_11626 ?auto_11628 ) ) ( ON ?auto_11625 ?auto_11627 ) ( CLEAR ?auto_11625 ) ( not ( = ?auto_11625 ?auto_11627 ) ) ( not ( = ?auto_11626 ?auto_11627 ) ) ( not ( = ?auto_11628 ?auto_11627 ) ) ( HOLDING ?auto_11626 ) ( CLEAR ?auto_11628 ) ( ON-TABLE ?auto_11629 ) ( ON ?auto_11628 ?auto_11629 ) ( not ( = ?auto_11629 ?auto_11628 ) ) ( not ( = ?auto_11629 ?auto_11626 ) ) ( not ( = ?auto_11625 ?auto_11629 ) ) ( not ( = ?auto_11627 ?auto_11629 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_11629 ?auto_11628 ?auto_11626 )
      ( MAKE-2PILE ?auto_11625 ?auto_11626 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_11630 - BLOCK
      ?auto_11631 - BLOCK
    )
    :vars
    (
      ?auto_11632 - BLOCK
      ?auto_11634 - BLOCK
      ?auto_11633 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_11630 ?auto_11631 ) ) ( not ( = ?auto_11630 ?auto_11632 ) ) ( not ( = ?auto_11631 ?auto_11632 ) ) ( ON ?auto_11630 ?auto_11634 ) ( not ( = ?auto_11630 ?auto_11634 ) ) ( not ( = ?auto_11631 ?auto_11634 ) ) ( not ( = ?auto_11632 ?auto_11634 ) ) ( CLEAR ?auto_11632 ) ( ON-TABLE ?auto_11633 ) ( ON ?auto_11632 ?auto_11633 ) ( not ( = ?auto_11633 ?auto_11632 ) ) ( not ( = ?auto_11633 ?auto_11631 ) ) ( not ( = ?auto_11630 ?auto_11633 ) ) ( not ( = ?auto_11634 ?auto_11633 ) ) ( ON ?auto_11631 ?auto_11630 ) ( CLEAR ?auto_11631 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_11634 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_11634 ?auto_11630 )
      ( MAKE-2PILE ?auto_11630 ?auto_11631 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_11635 - BLOCK
      ?auto_11636 - BLOCK
    )
    :vars
    (
      ?auto_11637 - BLOCK
      ?auto_11639 - BLOCK
      ?auto_11638 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_11635 ?auto_11636 ) ) ( not ( = ?auto_11635 ?auto_11637 ) ) ( not ( = ?auto_11636 ?auto_11637 ) ) ( ON ?auto_11635 ?auto_11639 ) ( not ( = ?auto_11635 ?auto_11639 ) ) ( not ( = ?auto_11636 ?auto_11639 ) ) ( not ( = ?auto_11637 ?auto_11639 ) ) ( ON-TABLE ?auto_11638 ) ( not ( = ?auto_11638 ?auto_11637 ) ) ( not ( = ?auto_11638 ?auto_11636 ) ) ( not ( = ?auto_11635 ?auto_11638 ) ) ( not ( = ?auto_11639 ?auto_11638 ) ) ( ON ?auto_11636 ?auto_11635 ) ( CLEAR ?auto_11636 ) ( ON-TABLE ?auto_11639 ) ( HOLDING ?auto_11637 ) ( CLEAR ?auto_11638 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_11638 ?auto_11637 )
      ( MAKE-2PILE ?auto_11635 ?auto_11636 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_11640 - BLOCK
      ?auto_11641 - BLOCK
    )
    :vars
    (
      ?auto_11643 - BLOCK
      ?auto_11644 - BLOCK
      ?auto_11642 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_11640 ?auto_11641 ) ) ( not ( = ?auto_11640 ?auto_11643 ) ) ( not ( = ?auto_11641 ?auto_11643 ) ) ( ON ?auto_11640 ?auto_11644 ) ( not ( = ?auto_11640 ?auto_11644 ) ) ( not ( = ?auto_11641 ?auto_11644 ) ) ( not ( = ?auto_11643 ?auto_11644 ) ) ( ON-TABLE ?auto_11642 ) ( not ( = ?auto_11642 ?auto_11643 ) ) ( not ( = ?auto_11642 ?auto_11641 ) ) ( not ( = ?auto_11640 ?auto_11642 ) ) ( not ( = ?auto_11644 ?auto_11642 ) ) ( ON ?auto_11641 ?auto_11640 ) ( ON-TABLE ?auto_11644 ) ( CLEAR ?auto_11642 ) ( ON ?auto_11643 ?auto_11641 ) ( CLEAR ?auto_11643 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_11644 ?auto_11640 ?auto_11641 )
      ( MAKE-2PILE ?auto_11640 ?auto_11641 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_11645 - BLOCK
      ?auto_11646 - BLOCK
    )
    :vars
    (
      ?auto_11647 - BLOCK
      ?auto_11648 - BLOCK
      ?auto_11649 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_11645 ?auto_11646 ) ) ( not ( = ?auto_11645 ?auto_11647 ) ) ( not ( = ?auto_11646 ?auto_11647 ) ) ( ON ?auto_11645 ?auto_11648 ) ( not ( = ?auto_11645 ?auto_11648 ) ) ( not ( = ?auto_11646 ?auto_11648 ) ) ( not ( = ?auto_11647 ?auto_11648 ) ) ( not ( = ?auto_11649 ?auto_11647 ) ) ( not ( = ?auto_11649 ?auto_11646 ) ) ( not ( = ?auto_11645 ?auto_11649 ) ) ( not ( = ?auto_11648 ?auto_11649 ) ) ( ON ?auto_11646 ?auto_11645 ) ( ON-TABLE ?auto_11648 ) ( ON ?auto_11647 ?auto_11646 ) ( CLEAR ?auto_11647 ) ( HOLDING ?auto_11649 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_11649 )
      ( MAKE-2PILE ?auto_11645 ?auto_11646 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_11650 - BLOCK
      ?auto_11651 - BLOCK
    )
    :vars
    (
      ?auto_11653 - BLOCK
      ?auto_11654 - BLOCK
      ?auto_11652 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_11650 ?auto_11651 ) ) ( not ( = ?auto_11650 ?auto_11653 ) ) ( not ( = ?auto_11651 ?auto_11653 ) ) ( ON ?auto_11650 ?auto_11654 ) ( not ( = ?auto_11650 ?auto_11654 ) ) ( not ( = ?auto_11651 ?auto_11654 ) ) ( not ( = ?auto_11653 ?auto_11654 ) ) ( not ( = ?auto_11652 ?auto_11653 ) ) ( not ( = ?auto_11652 ?auto_11651 ) ) ( not ( = ?auto_11650 ?auto_11652 ) ) ( not ( = ?auto_11654 ?auto_11652 ) ) ( ON ?auto_11651 ?auto_11650 ) ( ON-TABLE ?auto_11654 ) ( ON ?auto_11653 ?auto_11651 ) ( ON ?auto_11652 ?auto_11653 ) ( CLEAR ?auto_11652 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_11654 ?auto_11650 ?auto_11651 ?auto_11653 )
      ( MAKE-2PILE ?auto_11650 ?auto_11651 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_11666 - BLOCK
    )
    :vars
    (
      ?auto_11669 - BLOCK
      ?auto_11667 - BLOCK
      ?auto_11668 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_11669 ?auto_11666 ) ( ON-TABLE ?auto_11666 ) ( not ( = ?auto_11666 ?auto_11669 ) ) ( not ( = ?auto_11666 ?auto_11667 ) ) ( not ( = ?auto_11666 ?auto_11668 ) ) ( not ( = ?auto_11669 ?auto_11667 ) ) ( not ( = ?auto_11669 ?auto_11668 ) ) ( not ( = ?auto_11667 ?auto_11668 ) ) ( ON ?auto_11667 ?auto_11669 ) ( CLEAR ?auto_11667 ) ( HOLDING ?auto_11668 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_11668 )
      ( MAKE-1PILE ?auto_11666 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_11699 - BLOCK
      ?auto_11700 - BLOCK
      ?auto_11701 - BLOCK
    )
    :vars
    (
      ?auto_11702 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_11699 ) ( not ( = ?auto_11699 ?auto_11700 ) ) ( not ( = ?auto_11699 ?auto_11701 ) ) ( not ( = ?auto_11700 ?auto_11701 ) ) ( ON ?auto_11701 ?auto_11702 ) ( not ( = ?auto_11699 ?auto_11702 ) ) ( not ( = ?auto_11700 ?auto_11702 ) ) ( not ( = ?auto_11701 ?auto_11702 ) ) ( CLEAR ?auto_11699 ) ( ON ?auto_11700 ?auto_11701 ) ( CLEAR ?auto_11700 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_11702 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_11702 ?auto_11701 )
      ( MAKE-3PILE ?auto_11699 ?auto_11700 ?auto_11701 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_11703 - BLOCK
      ?auto_11704 - BLOCK
      ?auto_11705 - BLOCK
    )
    :vars
    (
      ?auto_11706 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_11703 ?auto_11704 ) ) ( not ( = ?auto_11703 ?auto_11705 ) ) ( not ( = ?auto_11704 ?auto_11705 ) ) ( ON ?auto_11705 ?auto_11706 ) ( not ( = ?auto_11703 ?auto_11706 ) ) ( not ( = ?auto_11704 ?auto_11706 ) ) ( not ( = ?auto_11705 ?auto_11706 ) ) ( ON ?auto_11704 ?auto_11705 ) ( CLEAR ?auto_11704 ) ( ON-TABLE ?auto_11706 ) ( HOLDING ?auto_11703 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_11703 )
      ( MAKE-3PILE ?auto_11703 ?auto_11704 ?auto_11705 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_11707 - BLOCK
      ?auto_11708 - BLOCK
      ?auto_11709 - BLOCK
    )
    :vars
    (
      ?auto_11710 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_11707 ?auto_11708 ) ) ( not ( = ?auto_11707 ?auto_11709 ) ) ( not ( = ?auto_11708 ?auto_11709 ) ) ( ON ?auto_11709 ?auto_11710 ) ( not ( = ?auto_11707 ?auto_11710 ) ) ( not ( = ?auto_11708 ?auto_11710 ) ) ( not ( = ?auto_11709 ?auto_11710 ) ) ( ON ?auto_11708 ?auto_11709 ) ( ON-TABLE ?auto_11710 ) ( ON ?auto_11707 ?auto_11708 ) ( CLEAR ?auto_11707 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_11710 ?auto_11709 ?auto_11708 )
      ( MAKE-3PILE ?auto_11707 ?auto_11708 ?auto_11709 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_11714 - BLOCK
      ?auto_11715 - BLOCK
      ?auto_11716 - BLOCK
    )
    :vars
    (
      ?auto_11717 - BLOCK
      ?auto_11718 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_11714 ?auto_11715 ) ) ( not ( = ?auto_11714 ?auto_11716 ) ) ( not ( = ?auto_11715 ?auto_11716 ) ) ( ON ?auto_11716 ?auto_11717 ) ( not ( = ?auto_11714 ?auto_11717 ) ) ( not ( = ?auto_11715 ?auto_11717 ) ) ( not ( = ?auto_11716 ?auto_11717 ) ) ( ON ?auto_11715 ?auto_11716 ) ( CLEAR ?auto_11715 ) ( ON-TABLE ?auto_11717 ) ( ON ?auto_11714 ?auto_11718 ) ( CLEAR ?auto_11714 ) ( HAND-EMPTY ) ( not ( = ?auto_11714 ?auto_11718 ) ) ( not ( = ?auto_11715 ?auto_11718 ) ) ( not ( = ?auto_11716 ?auto_11718 ) ) ( not ( = ?auto_11717 ?auto_11718 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_11714 ?auto_11718 )
      ( MAKE-3PILE ?auto_11714 ?auto_11715 ?auto_11716 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_11719 - BLOCK
      ?auto_11720 - BLOCK
      ?auto_11721 - BLOCK
    )
    :vars
    (
      ?auto_11723 - BLOCK
      ?auto_11722 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_11719 ?auto_11720 ) ) ( not ( = ?auto_11719 ?auto_11721 ) ) ( not ( = ?auto_11720 ?auto_11721 ) ) ( ON ?auto_11721 ?auto_11723 ) ( not ( = ?auto_11719 ?auto_11723 ) ) ( not ( = ?auto_11720 ?auto_11723 ) ) ( not ( = ?auto_11721 ?auto_11723 ) ) ( ON-TABLE ?auto_11723 ) ( ON ?auto_11719 ?auto_11722 ) ( CLEAR ?auto_11719 ) ( not ( = ?auto_11719 ?auto_11722 ) ) ( not ( = ?auto_11720 ?auto_11722 ) ) ( not ( = ?auto_11721 ?auto_11722 ) ) ( not ( = ?auto_11723 ?auto_11722 ) ) ( HOLDING ?auto_11720 ) ( CLEAR ?auto_11721 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_11723 ?auto_11721 ?auto_11720 )
      ( MAKE-3PILE ?auto_11719 ?auto_11720 ?auto_11721 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_11724 - BLOCK
      ?auto_11725 - BLOCK
      ?auto_11726 - BLOCK
    )
    :vars
    (
      ?auto_11728 - BLOCK
      ?auto_11727 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_11724 ?auto_11725 ) ) ( not ( = ?auto_11724 ?auto_11726 ) ) ( not ( = ?auto_11725 ?auto_11726 ) ) ( ON ?auto_11726 ?auto_11728 ) ( not ( = ?auto_11724 ?auto_11728 ) ) ( not ( = ?auto_11725 ?auto_11728 ) ) ( not ( = ?auto_11726 ?auto_11728 ) ) ( ON-TABLE ?auto_11728 ) ( ON ?auto_11724 ?auto_11727 ) ( not ( = ?auto_11724 ?auto_11727 ) ) ( not ( = ?auto_11725 ?auto_11727 ) ) ( not ( = ?auto_11726 ?auto_11727 ) ) ( not ( = ?auto_11728 ?auto_11727 ) ) ( CLEAR ?auto_11726 ) ( ON ?auto_11725 ?auto_11724 ) ( CLEAR ?auto_11725 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_11727 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_11727 ?auto_11724 )
      ( MAKE-3PILE ?auto_11724 ?auto_11725 ?auto_11726 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_11729 - BLOCK
      ?auto_11730 - BLOCK
      ?auto_11731 - BLOCK
    )
    :vars
    (
      ?auto_11732 - BLOCK
      ?auto_11733 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_11729 ?auto_11730 ) ) ( not ( = ?auto_11729 ?auto_11731 ) ) ( not ( = ?auto_11730 ?auto_11731 ) ) ( not ( = ?auto_11729 ?auto_11732 ) ) ( not ( = ?auto_11730 ?auto_11732 ) ) ( not ( = ?auto_11731 ?auto_11732 ) ) ( ON-TABLE ?auto_11732 ) ( ON ?auto_11729 ?auto_11733 ) ( not ( = ?auto_11729 ?auto_11733 ) ) ( not ( = ?auto_11730 ?auto_11733 ) ) ( not ( = ?auto_11731 ?auto_11733 ) ) ( not ( = ?auto_11732 ?auto_11733 ) ) ( ON ?auto_11730 ?auto_11729 ) ( CLEAR ?auto_11730 ) ( ON-TABLE ?auto_11733 ) ( HOLDING ?auto_11731 ) ( CLEAR ?auto_11732 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_11732 ?auto_11731 )
      ( MAKE-3PILE ?auto_11729 ?auto_11730 ?auto_11731 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_11734 - BLOCK
      ?auto_11735 - BLOCK
      ?auto_11736 - BLOCK
    )
    :vars
    (
      ?auto_11737 - BLOCK
      ?auto_11738 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_11734 ?auto_11735 ) ) ( not ( = ?auto_11734 ?auto_11736 ) ) ( not ( = ?auto_11735 ?auto_11736 ) ) ( not ( = ?auto_11734 ?auto_11737 ) ) ( not ( = ?auto_11735 ?auto_11737 ) ) ( not ( = ?auto_11736 ?auto_11737 ) ) ( ON-TABLE ?auto_11737 ) ( ON ?auto_11734 ?auto_11738 ) ( not ( = ?auto_11734 ?auto_11738 ) ) ( not ( = ?auto_11735 ?auto_11738 ) ) ( not ( = ?auto_11736 ?auto_11738 ) ) ( not ( = ?auto_11737 ?auto_11738 ) ) ( ON ?auto_11735 ?auto_11734 ) ( ON-TABLE ?auto_11738 ) ( CLEAR ?auto_11737 ) ( ON ?auto_11736 ?auto_11735 ) ( CLEAR ?auto_11736 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_11738 ?auto_11734 ?auto_11735 )
      ( MAKE-3PILE ?auto_11734 ?auto_11735 ?auto_11736 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_11739 - BLOCK
      ?auto_11740 - BLOCK
      ?auto_11741 - BLOCK
    )
    :vars
    (
      ?auto_11742 - BLOCK
      ?auto_11743 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_11739 ?auto_11740 ) ) ( not ( = ?auto_11739 ?auto_11741 ) ) ( not ( = ?auto_11740 ?auto_11741 ) ) ( not ( = ?auto_11739 ?auto_11742 ) ) ( not ( = ?auto_11740 ?auto_11742 ) ) ( not ( = ?auto_11741 ?auto_11742 ) ) ( ON ?auto_11739 ?auto_11743 ) ( not ( = ?auto_11739 ?auto_11743 ) ) ( not ( = ?auto_11740 ?auto_11743 ) ) ( not ( = ?auto_11741 ?auto_11743 ) ) ( not ( = ?auto_11742 ?auto_11743 ) ) ( ON ?auto_11740 ?auto_11739 ) ( ON-TABLE ?auto_11743 ) ( ON ?auto_11741 ?auto_11740 ) ( CLEAR ?auto_11741 ) ( HOLDING ?auto_11742 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_11742 )
      ( MAKE-3PILE ?auto_11739 ?auto_11740 ?auto_11741 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_11744 - BLOCK
      ?auto_11745 - BLOCK
      ?auto_11746 - BLOCK
    )
    :vars
    (
      ?auto_11747 - BLOCK
      ?auto_11748 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_11744 ?auto_11745 ) ) ( not ( = ?auto_11744 ?auto_11746 ) ) ( not ( = ?auto_11745 ?auto_11746 ) ) ( not ( = ?auto_11744 ?auto_11747 ) ) ( not ( = ?auto_11745 ?auto_11747 ) ) ( not ( = ?auto_11746 ?auto_11747 ) ) ( ON ?auto_11744 ?auto_11748 ) ( not ( = ?auto_11744 ?auto_11748 ) ) ( not ( = ?auto_11745 ?auto_11748 ) ) ( not ( = ?auto_11746 ?auto_11748 ) ) ( not ( = ?auto_11747 ?auto_11748 ) ) ( ON ?auto_11745 ?auto_11744 ) ( ON-TABLE ?auto_11748 ) ( ON ?auto_11746 ?auto_11745 ) ( ON ?auto_11747 ?auto_11746 ) ( CLEAR ?auto_11747 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_11748 ?auto_11744 ?auto_11745 ?auto_11746 )
      ( MAKE-3PILE ?auto_11744 ?auto_11745 ?auto_11746 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_11757 - BLOCK
      ?auto_11758 - BLOCK
      ?auto_11759 - BLOCK
      ?auto_11760 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_11759 ) ( ON-TABLE ?auto_11757 ) ( ON ?auto_11758 ?auto_11757 ) ( ON ?auto_11759 ?auto_11758 ) ( not ( = ?auto_11757 ?auto_11758 ) ) ( not ( = ?auto_11757 ?auto_11759 ) ) ( not ( = ?auto_11757 ?auto_11760 ) ) ( not ( = ?auto_11758 ?auto_11759 ) ) ( not ( = ?auto_11758 ?auto_11760 ) ) ( not ( = ?auto_11759 ?auto_11760 ) ) ( ON-TABLE ?auto_11760 ) ( CLEAR ?auto_11760 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_11760 )
      ( MAKE-4PILE ?auto_11757 ?auto_11758 ?auto_11759 ?auto_11760 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_11761 - BLOCK
      ?auto_11762 - BLOCK
      ?auto_11763 - BLOCK
      ?auto_11764 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_11761 ) ( ON ?auto_11762 ?auto_11761 ) ( not ( = ?auto_11761 ?auto_11762 ) ) ( not ( = ?auto_11761 ?auto_11763 ) ) ( not ( = ?auto_11761 ?auto_11764 ) ) ( not ( = ?auto_11762 ?auto_11763 ) ) ( not ( = ?auto_11762 ?auto_11764 ) ) ( not ( = ?auto_11763 ?auto_11764 ) ) ( ON-TABLE ?auto_11764 ) ( CLEAR ?auto_11764 ) ( HOLDING ?auto_11763 ) ( CLEAR ?auto_11762 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_11761 ?auto_11762 ?auto_11763 )
      ( MAKE-4PILE ?auto_11761 ?auto_11762 ?auto_11763 ?auto_11764 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_11765 - BLOCK
      ?auto_11766 - BLOCK
      ?auto_11767 - BLOCK
      ?auto_11768 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_11765 ) ( ON ?auto_11766 ?auto_11765 ) ( not ( = ?auto_11765 ?auto_11766 ) ) ( not ( = ?auto_11765 ?auto_11767 ) ) ( not ( = ?auto_11765 ?auto_11768 ) ) ( not ( = ?auto_11766 ?auto_11767 ) ) ( not ( = ?auto_11766 ?auto_11768 ) ) ( not ( = ?auto_11767 ?auto_11768 ) ) ( ON-TABLE ?auto_11768 ) ( CLEAR ?auto_11766 ) ( ON ?auto_11767 ?auto_11768 ) ( CLEAR ?auto_11767 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_11768 )
      ( MAKE-4PILE ?auto_11765 ?auto_11766 ?auto_11767 ?auto_11768 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_11769 - BLOCK
      ?auto_11770 - BLOCK
      ?auto_11771 - BLOCK
      ?auto_11772 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_11769 ) ( not ( = ?auto_11769 ?auto_11770 ) ) ( not ( = ?auto_11769 ?auto_11771 ) ) ( not ( = ?auto_11769 ?auto_11772 ) ) ( not ( = ?auto_11770 ?auto_11771 ) ) ( not ( = ?auto_11770 ?auto_11772 ) ) ( not ( = ?auto_11771 ?auto_11772 ) ) ( ON-TABLE ?auto_11772 ) ( ON ?auto_11771 ?auto_11772 ) ( CLEAR ?auto_11771 ) ( HOLDING ?auto_11770 ) ( CLEAR ?auto_11769 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_11769 ?auto_11770 )
      ( MAKE-4PILE ?auto_11769 ?auto_11770 ?auto_11771 ?auto_11772 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_11773 - BLOCK
      ?auto_11774 - BLOCK
      ?auto_11775 - BLOCK
      ?auto_11776 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_11773 ) ( not ( = ?auto_11773 ?auto_11774 ) ) ( not ( = ?auto_11773 ?auto_11775 ) ) ( not ( = ?auto_11773 ?auto_11776 ) ) ( not ( = ?auto_11774 ?auto_11775 ) ) ( not ( = ?auto_11774 ?auto_11776 ) ) ( not ( = ?auto_11775 ?auto_11776 ) ) ( ON-TABLE ?auto_11776 ) ( ON ?auto_11775 ?auto_11776 ) ( CLEAR ?auto_11773 ) ( ON ?auto_11774 ?auto_11775 ) ( CLEAR ?auto_11774 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_11776 ?auto_11775 )
      ( MAKE-4PILE ?auto_11773 ?auto_11774 ?auto_11775 ?auto_11776 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_11777 - BLOCK
      ?auto_11778 - BLOCK
      ?auto_11779 - BLOCK
      ?auto_11780 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_11777 ?auto_11778 ) ) ( not ( = ?auto_11777 ?auto_11779 ) ) ( not ( = ?auto_11777 ?auto_11780 ) ) ( not ( = ?auto_11778 ?auto_11779 ) ) ( not ( = ?auto_11778 ?auto_11780 ) ) ( not ( = ?auto_11779 ?auto_11780 ) ) ( ON-TABLE ?auto_11780 ) ( ON ?auto_11779 ?auto_11780 ) ( ON ?auto_11778 ?auto_11779 ) ( CLEAR ?auto_11778 ) ( HOLDING ?auto_11777 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_11777 )
      ( MAKE-4PILE ?auto_11777 ?auto_11778 ?auto_11779 ?auto_11780 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_11781 - BLOCK
      ?auto_11782 - BLOCK
      ?auto_11783 - BLOCK
      ?auto_11784 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_11781 ?auto_11782 ) ) ( not ( = ?auto_11781 ?auto_11783 ) ) ( not ( = ?auto_11781 ?auto_11784 ) ) ( not ( = ?auto_11782 ?auto_11783 ) ) ( not ( = ?auto_11782 ?auto_11784 ) ) ( not ( = ?auto_11783 ?auto_11784 ) ) ( ON-TABLE ?auto_11784 ) ( ON ?auto_11783 ?auto_11784 ) ( ON ?auto_11782 ?auto_11783 ) ( ON ?auto_11781 ?auto_11782 ) ( CLEAR ?auto_11781 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_11784 ?auto_11783 ?auto_11782 )
      ( MAKE-4PILE ?auto_11781 ?auto_11782 ?auto_11783 ?auto_11784 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_11789 - BLOCK
      ?auto_11790 - BLOCK
      ?auto_11791 - BLOCK
      ?auto_11792 - BLOCK
    )
    :vars
    (
      ?auto_11793 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_11789 ?auto_11790 ) ) ( not ( = ?auto_11789 ?auto_11791 ) ) ( not ( = ?auto_11789 ?auto_11792 ) ) ( not ( = ?auto_11790 ?auto_11791 ) ) ( not ( = ?auto_11790 ?auto_11792 ) ) ( not ( = ?auto_11791 ?auto_11792 ) ) ( ON-TABLE ?auto_11792 ) ( ON ?auto_11791 ?auto_11792 ) ( ON ?auto_11790 ?auto_11791 ) ( CLEAR ?auto_11790 ) ( ON ?auto_11789 ?auto_11793 ) ( CLEAR ?auto_11789 ) ( HAND-EMPTY ) ( not ( = ?auto_11789 ?auto_11793 ) ) ( not ( = ?auto_11790 ?auto_11793 ) ) ( not ( = ?auto_11791 ?auto_11793 ) ) ( not ( = ?auto_11792 ?auto_11793 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_11789 ?auto_11793 )
      ( MAKE-4PILE ?auto_11789 ?auto_11790 ?auto_11791 ?auto_11792 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_11794 - BLOCK
      ?auto_11795 - BLOCK
      ?auto_11796 - BLOCK
      ?auto_11797 - BLOCK
    )
    :vars
    (
      ?auto_11798 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_11794 ?auto_11795 ) ) ( not ( = ?auto_11794 ?auto_11796 ) ) ( not ( = ?auto_11794 ?auto_11797 ) ) ( not ( = ?auto_11795 ?auto_11796 ) ) ( not ( = ?auto_11795 ?auto_11797 ) ) ( not ( = ?auto_11796 ?auto_11797 ) ) ( ON-TABLE ?auto_11797 ) ( ON ?auto_11796 ?auto_11797 ) ( ON ?auto_11794 ?auto_11798 ) ( CLEAR ?auto_11794 ) ( not ( = ?auto_11794 ?auto_11798 ) ) ( not ( = ?auto_11795 ?auto_11798 ) ) ( not ( = ?auto_11796 ?auto_11798 ) ) ( not ( = ?auto_11797 ?auto_11798 ) ) ( HOLDING ?auto_11795 ) ( CLEAR ?auto_11796 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_11797 ?auto_11796 ?auto_11795 )
      ( MAKE-4PILE ?auto_11794 ?auto_11795 ?auto_11796 ?auto_11797 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_11799 - BLOCK
      ?auto_11800 - BLOCK
      ?auto_11801 - BLOCK
      ?auto_11802 - BLOCK
    )
    :vars
    (
      ?auto_11803 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_11799 ?auto_11800 ) ) ( not ( = ?auto_11799 ?auto_11801 ) ) ( not ( = ?auto_11799 ?auto_11802 ) ) ( not ( = ?auto_11800 ?auto_11801 ) ) ( not ( = ?auto_11800 ?auto_11802 ) ) ( not ( = ?auto_11801 ?auto_11802 ) ) ( ON-TABLE ?auto_11802 ) ( ON ?auto_11801 ?auto_11802 ) ( ON ?auto_11799 ?auto_11803 ) ( not ( = ?auto_11799 ?auto_11803 ) ) ( not ( = ?auto_11800 ?auto_11803 ) ) ( not ( = ?auto_11801 ?auto_11803 ) ) ( not ( = ?auto_11802 ?auto_11803 ) ) ( CLEAR ?auto_11801 ) ( ON ?auto_11800 ?auto_11799 ) ( CLEAR ?auto_11800 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_11803 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_11803 ?auto_11799 )
      ( MAKE-4PILE ?auto_11799 ?auto_11800 ?auto_11801 ?auto_11802 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_11804 - BLOCK
      ?auto_11805 - BLOCK
      ?auto_11806 - BLOCK
      ?auto_11807 - BLOCK
    )
    :vars
    (
      ?auto_11808 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_11804 ?auto_11805 ) ) ( not ( = ?auto_11804 ?auto_11806 ) ) ( not ( = ?auto_11804 ?auto_11807 ) ) ( not ( = ?auto_11805 ?auto_11806 ) ) ( not ( = ?auto_11805 ?auto_11807 ) ) ( not ( = ?auto_11806 ?auto_11807 ) ) ( ON-TABLE ?auto_11807 ) ( ON ?auto_11804 ?auto_11808 ) ( not ( = ?auto_11804 ?auto_11808 ) ) ( not ( = ?auto_11805 ?auto_11808 ) ) ( not ( = ?auto_11806 ?auto_11808 ) ) ( not ( = ?auto_11807 ?auto_11808 ) ) ( ON ?auto_11805 ?auto_11804 ) ( CLEAR ?auto_11805 ) ( ON-TABLE ?auto_11808 ) ( HOLDING ?auto_11806 ) ( CLEAR ?auto_11807 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_11807 ?auto_11806 )
      ( MAKE-4PILE ?auto_11804 ?auto_11805 ?auto_11806 ?auto_11807 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_11809 - BLOCK
      ?auto_11810 - BLOCK
      ?auto_11811 - BLOCK
      ?auto_11812 - BLOCK
    )
    :vars
    (
      ?auto_11813 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_11809 ?auto_11810 ) ) ( not ( = ?auto_11809 ?auto_11811 ) ) ( not ( = ?auto_11809 ?auto_11812 ) ) ( not ( = ?auto_11810 ?auto_11811 ) ) ( not ( = ?auto_11810 ?auto_11812 ) ) ( not ( = ?auto_11811 ?auto_11812 ) ) ( ON-TABLE ?auto_11812 ) ( ON ?auto_11809 ?auto_11813 ) ( not ( = ?auto_11809 ?auto_11813 ) ) ( not ( = ?auto_11810 ?auto_11813 ) ) ( not ( = ?auto_11811 ?auto_11813 ) ) ( not ( = ?auto_11812 ?auto_11813 ) ) ( ON ?auto_11810 ?auto_11809 ) ( ON-TABLE ?auto_11813 ) ( CLEAR ?auto_11812 ) ( ON ?auto_11811 ?auto_11810 ) ( CLEAR ?auto_11811 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_11813 ?auto_11809 ?auto_11810 )
      ( MAKE-4PILE ?auto_11809 ?auto_11810 ?auto_11811 ?auto_11812 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_11814 - BLOCK
      ?auto_11815 - BLOCK
      ?auto_11816 - BLOCK
      ?auto_11817 - BLOCK
    )
    :vars
    (
      ?auto_11818 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_11814 ?auto_11815 ) ) ( not ( = ?auto_11814 ?auto_11816 ) ) ( not ( = ?auto_11814 ?auto_11817 ) ) ( not ( = ?auto_11815 ?auto_11816 ) ) ( not ( = ?auto_11815 ?auto_11817 ) ) ( not ( = ?auto_11816 ?auto_11817 ) ) ( ON ?auto_11814 ?auto_11818 ) ( not ( = ?auto_11814 ?auto_11818 ) ) ( not ( = ?auto_11815 ?auto_11818 ) ) ( not ( = ?auto_11816 ?auto_11818 ) ) ( not ( = ?auto_11817 ?auto_11818 ) ) ( ON ?auto_11815 ?auto_11814 ) ( ON-TABLE ?auto_11818 ) ( ON ?auto_11816 ?auto_11815 ) ( CLEAR ?auto_11816 ) ( HOLDING ?auto_11817 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_11817 )
      ( MAKE-4PILE ?auto_11814 ?auto_11815 ?auto_11816 ?auto_11817 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_11819 - BLOCK
      ?auto_11820 - BLOCK
      ?auto_11821 - BLOCK
      ?auto_11822 - BLOCK
    )
    :vars
    (
      ?auto_11823 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_11819 ?auto_11820 ) ) ( not ( = ?auto_11819 ?auto_11821 ) ) ( not ( = ?auto_11819 ?auto_11822 ) ) ( not ( = ?auto_11820 ?auto_11821 ) ) ( not ( = ?auto_11820 ?auto_11822 ) ) ( not ( = ?auto_11821 ?auto_11822 ) ) ( ON ?auto_11819 ?auto_11823 ) ( not ( = ?auto_11819 ?auto_11823 ) ) ( not ( = ?auto_11820 ?auto_11823 ) ) ( not ( = ?auto_11821 ?auto_11823 ) ) ( not ( = ?auto_11822 ?auto_11823 ) ) ( ON ?auto_11820 ?auto_11819 ) ( ON-TABLE ?auto_11823 ) ( ON ?auto_11821 ?auto_11820 ) ( ON ?auto_11822 ?auto_11821 ) ( CLEAR ?auto_11822 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_11823 ?auto_11819 ?auto_11820 ?auto_11821 )
      ( MAKE-4PILE ?auto_11819 ?auto_11820 ?auto_11821 ?auto_11822 ) )
  )

)

