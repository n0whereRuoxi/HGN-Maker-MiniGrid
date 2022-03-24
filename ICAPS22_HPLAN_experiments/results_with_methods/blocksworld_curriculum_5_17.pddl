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
      ?auto_9273 - BLOCK
    )
    :vars
    (
      ?auto_9274 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_9273 ?auto_9274 ) ( CLEAR ?auto_9273 ) ( HAND-EMPTY ) ( not ( = ?auto_9273 ?auto_9274 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_9273 ?auto_9274 )
      ( !PUTDOWN ?auto_9273 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_9276 - BLOCK
    )
    :vars
    (
      ?auto_9277 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_9276 ?auto_9277 ) ( CLEAR ?auto_9276 ) ( HAND-EMPTY ) ( not ( = ?auto_9276 ?auto_9277 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_9276 ?auto_9277 )
      ( !PUTDOWN ?auto_9276 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_9280 - BLOCK
      ?auto_9281 - BLOCK
    )
    :vars
    (
      ?auto_9282 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_9280 ) ( ON ?auto_9281 ?auto_9282 ) ( CLEAR ?auto_9281 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_9280 ) ( not ( = ?auto_9280 ?auto_9281 ) ) ( not ( = ?auto_9280 ?auto_9282 ) ) ( not ( = ?auto_9281 ?auto_9282 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_9281 ?auto_9282 )
      ( !STACK ?auto_9281 ?auto_9280 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_9285 - BLOCK
      ?auto_9286 - BLOCK
    )
    :vars
    (
      ?auto_9287 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_9285 ) ( ON ?auto_9286 ?auto_9287 ) ( CLEAR ?auto_9286 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_9285 ) ( not ( = ?auto_9285 ?auto_9286 ) ) ( not ( = ?auto_9285 ?auto_9287 ) ) ( not ( = ?auto_9286 ?auto_9287 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_9286 ?auto_9287 )
      ( !STACK ?auto_9286 ?auto_9285 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_9290 - BLOCK
      ?auto_9291 - BLOCK
    )
    :vars
    (
      ?auto_9292 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_9291 ?auto_9292 ) ( not ( = ?auto_9290 ?auto_9291 ) ) ( not ( = ?auto_9290 ?auto_9292 ) ) ( not ( = ?auto_9291 ?auto_9292 ) ) ( ON ?auto_9290 ?auto_9291 ) ( CLEAR ?auto_9290 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_9290 )
      ( MAKE-2PILE ?auto_9290 ?auto_9291 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_9295 - BLOCK
      ?auto_9296 - BLOCK
    )
    :vars
    (
      ?auto_9297 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_9296 ?auto_9297 ) ( not ( = ?auto_9295 ?auto_9296 ) ) ( not ( = ?auto_9295 ?auto_9297 ) ) ( not ( = ?auto_9296 ?auto_9297 ) ) ( ON ?auto_9295 ?auto_9296 ) ( CLEAR ?auto_9295 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_9295 )
      ( MAKE-2PILE ?auto_9295 ?auto_9296 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_9301 - BLOCK
      ?auto_9302 - BLOCK
      ?auto_9303 - BLOCK
    )
    :vars
    (
      ?auto_9304 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_9302 ) ( ON ?auto_9303 ?auto_9304 ) ( CLEAR ?auto_9303 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_9301 ) ( ON ?auto_9302 ?auto_9301 ) ( not ( = ?auto_9301 ?auto_9302 ) ) ( not ( = ?auto_9301 ?auto_9303 ) ) ( not ( = ?auto_9301 ?auto_9304 ) ) ( not ( = ?auto_9302 ?auto_9303 ) ) ( not ( = ?auto_9302 ?auto_9304 ) ) ( not ( = ?auto_9303 ?auto_9304 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_9303 ?auto_9304 )
      ( !STACK ?auto_9303 ?auto_9302 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_9308 - BLOCK
      ?auto_9309 - BLOCK
      ?auto_9310 - BLOCK
    )
    :vars
    (
      ?auto_9311 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_9309 ) ( ON ?auto_9310 ?auto_9311 ) ( CLEAR ?auto_9310 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_9308 ) ( ON ?auto_9309 ?auto_9308 ) ( not ( = ?auto_9308 ?auto_9309 ) ) ( not ( = ?auto_9308 ?auto_9310 ) ) ( not ( = ?auto_9308 ?auto_9311 ) ) ( not ( = ?auto_9309 ?auto_9310 ) ) ( not ( = ?auto_9309 ?auto_9311 ) ) ( not ( = ?auto_9310 ?auto_9311 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_9310 ?auto_9311 )
      ( !STACK ?auto_9310 ?auto_9309 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_9315 - BLOCK
      ?auto_9316 - BLOCK
      ?auto_9317 - BLOCK
    )
    :vars
    (
      ?auto_9318 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_9317 ?auto_9318 ) ( ON-TABLE ?auto_9315 ) ( not ( = ?auto_9315 ?auto_9316 ) ) ( not ( = ?auto_9315 ?auto_9317 ) ) ( not ( = ?auto_9315 ?auto_9318 ) ) ( not ( = ?auto_9316 ?auto_9317 ) ) ( not ( = ?auto_9316 ?auto_9318 ) ) ( not ( = ?auto_9317 ?auto_9318 ) ) ( CLEAR ?auto_9315 ) ( ON ?auto_9316 ?auto_9317 ) ( CLEAR ?auto_9316 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_9315 ?auto_9316 )
      ( MAKE-3PILE ?auto_9315 ?auto_9316 ?auto_9317 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_9322 - BLOCK
      ?auto_9323 - BLOCK
      ?auto_9324 - BLOCK
    )
    :vars
    (
      ?auto_9325 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_9324 ?auto_9325 ) ( ON-TABLE ?auto_9322 ) ( not ( = ?auto_9322 ?auto_9323 ) ) ( not ( = ?auto_9322 ?auto_9324 ) ) ( not ( = ?auto_9322 ?auto_9325 ) ) ( not ( = ?auto_9323 ?auto_9324 ) ) ( not ( = ?auto_9323 ?auto_9325 ) ) ( not ( = ?auto_9324 ?auto_9325 ) ) ( CLEAR ?auto_9322 ) ( ON ?auto_9323 ?auto_9324 ) ( CLEAR ?auto_9323 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_9322 ?auto_9323 )
      ( MAKE-3PILE ?auto_9322 ?auto_9323 ?auto_9324 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_9329 - BLOCK
      ?auto_9330 - BLOCK
      ?auto_9331 - BLOCK
    )
    :vars
    (
      ?auto_9332 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_9331 ?auto_9332 ) ( not ( = ?auto_9329 ?auto_9330 ) ) ( not ( = ?auto_9329 ?auto_9331 ) ) ( not ( = ?auto_9329 ?auto_9332 ) ) ( not ( = ?auto_9330 ?auto_9331 ) ) ( not ( = ?auto_9330 ?auto_9332 ) ) ( not ( = ?auto_9331 ?auto_9332 ) ) ( ON ?auto_9330 ?auto_9331 ) ( ON ?auto_9329 ?auto_9330 ) ( CLEAR ?auto_9329 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_9329 )
      ( MAKE-3PILE ?auto_9329 ?auto_9330 ?auto_9331 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_9336 - BLOCK
      ?auto_9337 - BLOCK
      ?auto_9338 - BLOCK
    )
    :vars
    (
      ?auto_9339 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_9338 ?auto_9339 ) ( not ( = ?auto_9336 ?auto_9337 ) ) ( not ( = ?auto_9336 ?auto_9338 ) ) ( not ( = ?auto_9336 ?auto_9339 ) ) ( not ( = ?auto_9337 ?auto_9338 ) ) ( not ( = ?auto_9337 ?auto_9339 ) ) ( not ( = ?auto_9338 ?auto_9339 ) ) ( ON ?auto_9337 ?auto_9338 ) ( ON ?auto_9336 ?auto_9337 ) ( CLEAR ?auto_9336 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_9336 )
      ( MAKE-3PILE ?auto_9336 ?auto_9337 ?auto_9338 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_9344 - BLOCK
      ?auto_9345 - BLOCK
      ?auto_9346 - BLOCK
      ?auto_9347 - BLOCK
    )
    :vars
    (
      ?auto_9348 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_9346 ) ( ON ?auto_9347 ?auto_9348 ) ( CLEAR ?auto_9347 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_9344 ) ( ON ?auto_9345 ?auto_9344 ) ( ON ?auto_9346 ?auto_9345 ) ( not ( = ?auto_9344 ?auto_9345 ) ) ( not ( = ?auto_9344 ?auto_9346 ) ) ( not ( = ?auto_9344 ?auto_9347 ) ) ( not ( = ?auto_9344 ?auto_9348 ) ) ( not ( = ?auto_9345 ?auto_9346 ) ) ( not ( = ?auto_9345 ?auto_9347 ) ) ( not ( = ?auto_9345 ?auto_9348 ) ) ( not ( = ?auto_9346 ?auto_9347 ) ) ( not ( = ?auto_9346 ?auto_9348 ) ) ( not ( = ?auto_9347 ?auto_9348 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_9347 ?auto_9348 )
      ( !STACK ?auto_9347 ?auto_9346 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_9353 - BLOCK
      ?auto_9354 - BLOCK
      ?auto_9355 - BLOCK
      ?auto_9356 - BLOCK
    )
    :vars
    (
      ?auto_9357 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_9355 ) ( ON ?auto_9356 ?auto_9357 ) ( CLEAR ?auto_9356 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_9353 ) ( ON ?auto_9354 ?auto_9353 ) ( ON ?auto_9355 ?auto_9354 ) ( not ( = ?auto_9353 ?auto_9354 ) ) ( not ( = ?auto_9353 ?auto_9355 ) ) ( not ( = ?auto_9353 ?auto_9356 ) ) ( not ( = ?auto_9353 ?auto_9357 ) ) ( not ( = ?auto_9354 ?auto_9355 ) ) ( not ( = ?auto_9354 ?auto_9356 ) ) ( not ( = ?auto_9354 ?auto_9357 ) ) ( not ( = ?auto_9355 ?auto_9356 ) ) ( not ( = ?auto_9355 ?auto_9357 ) ) ( not ( = ?auto_9356 ?auto_9357 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_9356 ?auto_9357 )
      ( !STACK ?auto_9356 ?auto_9355 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_9362 - BLOCK
      ?auto_9363 - BLOCK
      ?auto_9364 - BLOCK
      ?auto_9365 - BLOCK
    )
    :vars
    (
      ?auto_9366 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_9365 ?auto_9366 ) ( ON-TABLE ?auto_9362 ) ( ON ?auto_9363 ?auto_9362 ) ( not ( = ?auto_9362 ?auto_9363 ) ) ( not ( = ?auto_9362 ?auto_9364 ) ) ( not ( = ?auto_9362 ?auto_9365 ) ) ( not ( = ?auto_9362 ?auto_9366 ) ) ( not ( = ?auto_9363 ?auto_9364 ) ) ( not ( = ?auto_9363 ?auto_9365 ) ) ( not ( = ?auto_9363 ?auto_9366 ) ) ( not ( = ?auto_9364 ?auto_9365 ) ) ( not ( = ?auto_9364 ?auto_9366 ) ) ( not ( = ?auto_9365 ?auto_9366 ) ) ( CLEAR ?auto_9363 ) ( ON ?auto_9364 ?auto_9365 ) ( CLEAR ?auto_9364 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_9362 ?auto_9363 ?auto_9364 )
      ( MAKE-4PILE ?auto_9362 ?auto_9363 ?auto_9364 ?auto_9365 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_9371 - BLOCK
      ?auto_9372 - BLOCK
      ?auto_9373 - BLOCK
      ?auto_9374 - BLOCK
    )
    :vars
    (
      ?auto_9375 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_9374 ?auto_9375 ) ( ON-TABLE ?auto_9371 ) ( ON ?auto_9372 ?auto_9371 ) ( not ( = ?auto_9371 ?auto_9372 ) ) ( not ( = ?auto_9371 ?auto_9373 ) ) ( not ( = ?auto_9371 ?auto_9374 ) ) ( not ( = ?auto_9371 ?auto_9375 ) ) ( not ( = ?auto_9372 ?auto_9373 ) ) ( not ( = ?auto_9372 ?auto_9374 ) ) ( not ( = ?auto_9372 ?auto_9375 ) ) ( not ( = ?auto_9373 ?auto_9374 ) ) ( not ( = ?auto_9373 ?auto_9375 ) ) ( not ( = ?auto_9374 ?auto_9375 ) ) ( CLEAR ?auto_9372 ) ( ON ?auto_9373 ?auto_9374 ) ( CLEAR ?auto_9373 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_9371 ?auto_9372 ?auto_9373 )
      ( MAKE-4PILE ?auto_9371 ?auto_9372 ?auto_9373 ?auto_9374 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_9380 - BLOCK
      ?auto_9381 - BLOCK
      ?auto_9382 - BLOCK
      ?auto_9383 - BLOCK
    )
    :vars
    (
      ?auto_9384 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_9383 ?auto_9384 ) ( ON-TABLE ?auto_9380 ) ( not ( = ?auto_9380 ?auto_9381 ) ) ( not ( = ?auto_9380 ?auto_9382 ) ) ( not ( = ?auto_9380 ?auto_9383 ) ) ( not ( = ?auto_9380 ?auto_9384 ) ) ( not ( = ?auto_9381 ?auto_9382 ) ) ( not ( = ?auto_9381 ?auto_9383 ) ) ( not ( = ?auto_9381 ?auto_9384 ) ) ( not ( = ?auto_9382 ?auto_9383 ) ) ( not ( = ?auto_9382 ?auto_9384 ) ) ( not ( = ?auto_9383 ?auto_9384 ) ) ( ON ?auto_9382 ?auto_9383 ) ( CLEAR ?auto_9380 ) ( ON ?auto_9381 ?auto_9382 ) ( CLEAR ?auto_9381 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_9380 ?auto_9381 )
      ( MAKE-4PILE ?auto_9380 ?auto_9381 ?auto_9382 ?auto_9383 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_9389 - BLOCK
      ?auto_9390 - BLOCK
      ?auto_9391 - BLOCK
      ?auto_9392 - BLOCK
    )
    :vars
    (
      ?auto_9393 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_9392 ?auto_9393 ) ( ON-TABLE ?auto_9389 ) ( not ( = ?auto_9389 ?auto_9390 ) ) ( not ( = ?auto_9389 ?auto_9391 ) ) ( not ( = ?auto_9389 ?auto_9392 ) ) ( not ( = ?auto_9389 ?auto_9393 ) ) ( not ( = ?auto_9390 ?auto_9391 ) ) ( not ( = ?auto_9390 ?auto_9392 ) ) ( not ( = ?auto_9390 ?auto_9393 ) ) ( not ( = ?auto_9391 ?auto_9392 ) ) ( not ( = ?auto_9391 ?auto_9393 ) ) ( not ( = ?auto_9392 ?auto_9393 ) ) ( ON ?auto_9391 ?auto_9392 ) ( CLEAR ?auto_9389 ) ( ON ?auto_9390 ?auto_9391 ) ( CLEAR ?auto_9390 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_9389 ?auto_9390 )
      ( MAKE-4PILE ?auto_9389 ?auto_9390 ?auto_9391 ?auto_9392 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_9398 - BLOCK
      ?auto_9399 - BLOCK
      ?auto_9400 - BLOCK
      ?auto_9401 - BLOCK
    )
    :vars
    (
      ?auto_9402 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_9401 ?auto_9402 ) ( not ( = ?auto_9398 ?auto_9399 ) ) ( not ( = ?auto_9398 ?auto_9400 ) ) ( not ( = ?auto_9398 ?auto_9401 ) ) ( not ( = ?auto_9398 ?auto_9402 ) ) ( not ( = ?auto_9399 ?auto_9400 ) ) ( not ( = ?auto_9399 ?auto_9401 ) ) ( not ( = ?auto_9399 ?auto_9402 ) ) ( not ( = ?auto_9400 ?auto_9401 ) ) ( not ( = ?auto_9400 ?auto_9402 ) ) ( not ( = ?auto_9401 ?auto_9402 ) ) ( ON ?auto_9400 ?auto_9401 ) ( ON ?auto_9399 ?auto_9400 ) ( ON ?auto_9398 ?auto_9399 ) ( CLEAR ?auto_9398 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_9398 )
      ( MAKE-4PILE ?auto_9398 ?auto_9399 ?auto_9400 ?auto_9401 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_9407 - BLOCK
      ?auto_9408 - BLOCK
      ?auto_9409 - BLOCK
      ?auto_9410 - BLOCK
    )
    :vars
    (
      ?auto_9411 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_9410 ?auto_9411 ) ( not ( = ?auto_9407 ?auto_9408 ) ) ( not ( = ?auto_9407 ?auto_9409 ) ) ( not ( = ?auto_9407 ?auto_9410 ) ) ( not ( = ?auto_9407 ?auto_9411 ) ) ( not ( = ?auto_9408 ?auto_9409 ) ) ( not ( = ?auto_9408 ?auto_9410 ) ) ( not ( = ?auto_9408 ?auto_9411 ) ) ( not ( = ?auto_9409 ?auto_9410 ) ) ( not ( = ?auto_9409 ?auto_9411 ) ) ( not ( = ?auto_9410 ?auto_9411 ) ) ( ON ?auto_9409 ?auto_9410 ) ( ON ?auto_9408 ?auto_9409 ) ( ON ?auto_9407 ?auto_9408 ) ( CLEAR ?auto_9407 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_9407 )
      ( MAKE-4PILE ?auto_9407 ?auto_9408 ?auto_9409 ?auto_9410 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_9417 - BLOCK
      ?auto_9418 - BLOCK
      ?auto_9419 - BLOCK
      ?auto_9420 - BLOCK
      ?auto_9421 - BLOCK
    )
    :vars
    (
      ?auto_9422 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_9420 ) ( ON ?auto_9421 ?auto_9422 ) ( CLEAR ?auto_9421 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_9417 ) ( ON ?auto_9418 ?auto_9417 ) ( ON ?auto_9419 ?auto_9418 ) ( ON ?auto_9420 ?auto_9419 ) ( not ( = ?auto_9417 ?auto_9418 ) ) ( not ( = ?auto_9417 ?auto_9419 ) ) ( not ( = ?auto_9417 ?auto_9420 ) ) ( not ( = ?auto_9417 ?auto_9421 ) ) ( not ( = ?auto_9417 ?auto_9422 ) ) ( not ( = ?auto_9418 ?auto_9419 ) ) ( not ( = ?auto_9418 ?auto_9420 ) ) ( not ( = ?auto_9418 ?auto_9421 ) ) ( not ( = ?auto_9418 ?auto_9422 ) ) ( not ( = ?auto_9419 ?auto_9420 ) ) ( not ( = ?auto_9419 ?auto_9421 ) ) ( not ( = ?auto_9419 ?auto_9422 ) ) ( not ( = ?auto_9420 ?auto_9421 ) ) ( not ( = ?auto_9420 ?auto_9422 ) ) ( not ( = ?auto_9421 ?auto_9422 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_9421 ?auto_9422 )
      ( !STACK ?auto_9421 ?auto_9420 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_9428 - BLOCK
      ?auto_9429 - BLOCK
      ?auto_9430 - BLOCK
      ?auto_9431 - BLOCK
      ?auto_9432 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_9431 ) ( ON-TABLE ?auto_9432 ) ( CLEAR ?auto_9432 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_9428 ) ( ON ?auto_9429 ?auto_9428 ) ( ON ?auto_9430 ?auto_9429 ) ( ON ?auto_9431 ?auto_9430 ) ( not ( = ?auto_9428 ?auto_9429 ) ) ( not ( = ?auto_9428 ?auto_9430 ) ) ( not ( = ?auto_9428 ?auto_9431 ) ) ( not ( = ?auto_9428 ?auto_9432 ) ) ( not ( = ?auto_9429 ?auto_9430 ) ) ( not ( = ?auto_9429 ?auto_9431 ) ) ( not ( = ?auto_9429 ?auto_9432 ) ) ( not ( = ?auto_9430 ?auto_9431 ) ) ( not ( = ?auto_9430 ?auto_9432 ) ) ( not ( = ?auto_9431 ?auto_9432 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_9432 )
      ( !STACK ?auto_9432 ?auto_9431 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_9438 - BLOCK
      ?auto_9439 - BLOCK
      ?auto_9440 - BLOCK
      ?auto_9441 - BLOCK
      ?auto_9442 - BLOCK
    )
    :vars
    (
      ?auto_9443 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_9442 ?auto_9443 ) ( ON-TABLE ?auto_9438 ) ( ON ?auto_9439 ?auto_9438 ) ( ON ?auto_9440 ?auto_9439 ) ( not ( = ?auto_9438 ?auto_9439 ) ) ( not ( = ?auto_9438 ?auto_9440 ) ) ( not ( = ?auto_9438 ?auto_9441 ) ) ( not ( = ?auto_9438 ?auto_9442 ) ) ( not ( = ?auto_9438 ?auto_9443 ) ) ( not ( = ?auto_9439 ?auto_9440 ) ) ( not ( = ?auto_9439 ?auto_9441 ) ) ( not ( = ?auto_9439 ?auto_9442 ) ) ( not ( = ?auto_9439 ?auto_9443 ) ) ( not ( = ?auto_9440 ?auto_9441 ) ) ( not ( = ?auto_9440 ?auto_9442 ) ) ( not ( = ?auto_9440 ?auto_9443 ) ) ( not ( = ?auto_9441 ?auto_9442 ) ) ( not ( = ?auto_9441 ?auto_9443 ) ) ( not ( = ?auto_9442 ?auto_9443 ) ) ( CLEAR ?auto_9440 ) ( ON ?auto_9441 ?auto_9442 ) ( CLEAR ?auto_9441 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_9438 ?auto_9439 ?auto_9440 ?auto_9441 )
      ( MAKE-5PILE ?auto_9438 ?auto_9439 ?auto_9440 ?auto_9441 ?auto_9442 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_9449 - BLOCK
      ?auto_9450 - BLOCK
      ?auto_9451 - BLOCK
      ?auto_9452 - BLOCK
      ?auto_9453 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_9453 ) ( ON-TABLE ?auto_9449 ) ( ON ?auto_9450 ?auto_9449 ) ( ON ?auto_9451 ?auto_9450 ) ( not ( = ?auto_9449 ?auto_9450 ) ) ( not ( = ?auto_9449 ?auto_9451 ) ) ( not ( = ?auto_9449 ?auto_9452 ) ) ( not ( = ?auto_9449 ?auto_9453 ) ) ( not ( = ?auto_9450 ?auto_9451 ) ) ( not ( = ?auto_9450 ?auto_9452 ) ) ( not ( = ?auto_9450 ?auto_9453 ) ) ( not ( = ?auto_9451 ?auto_9452 ) ) ( not ( = ?auto_9451 ?auto_9453 ) ) ( not ( = ?auto_9452 ?auto_9453 ) ) ( CLEAR ?auto_9451 ) ( ON ?auto_9452 ?auto_9453 ) ( CLEAR ?auto_9452 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_9449 ?auto_9450 ?auto_9451 ?auto_9452 )
      ( MAKE-5PILE ?auto_9449 ?auto_9450 ?auto_9451 ?auto_9452 ?auto_9453 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_9459 - BLOCK
      ?auto_9460 - BLOCK
      ?auto_9461 - BLOCK
      ?auto_9462 - BLOCK
      ?auto_9463 - BLOCK
    )
    :vars
    (
      ?auto_9464 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_9463 ?auto_9464 ) ( ON-TABLE ?auto_9459 ) ( ON ?auto_9460 ?auto_9459 ) ( not ( = ?auto_9459 ?auto_9460 ) ) ( not ( = ?auto_9459 ?auto_9461 ) ) ( not ( = ?auto_9459 ?auto_9462 ) ) ( not ( = ?auto_9459 ?auto_9463 ) ) ( not ( = ?auto_9459 ?auto_9464 ) ) ( not ( = ?auto_9460 ?auto_9461 ) ) ( not ( = ?auto_9460 ?auto_9462 ) ) ( not ( = ?auto_9460 ?auto_9463 ) ) ( not ( = ?auto_9460 ?auto_9464 ) ) ( not ( = ?auto_9461 ?auto_9462 ) ) ( not ( = ?auto_9461 ?auto_9463 ) ) ( not ( = ?auto_9461 ?auto_9464 ) ) ( not ( = ?auto_9462 ?auto_9463 ) ) ( not ( = ?auto_9462 ?auto_9464 ) ) ( not ( = ?auto_9463 ?auto_9464 ) ) ( ON ?auto_9462 ?auto_9463 ) ( CLEAR ?auto_9460 ) ( ON ?auto_9461 ?auto_9462 ) ( CLEAR ?auto_9461 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_9459 ?auto_9460 ?auto_9461 )
      ( MAKE-5PILE ?auto_9459 ?auto_9460 ?auto_9461 ?auto_9462 ?auto_9463 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_9470 - BLOCK
      ?auto_9471 - BLOCK
      ?auto_9472 - BLOCK
      ?auto_9473 - BLOCK
      ?auto_9474 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_9474 ) ( ON-TABLE ?auto_9470 ) ( ON ?auto_9471 ?auto_9470 ) ( not ( = ?auto_9470 ?auto_9471 ) ) ( not ( = ?auto_9470 ?auto_9472 ) ) ( not ( = ?auto_9470 ?auto_9473 ) ) ( not ( = ?auto_9470 ?auto_9474 ) ) ( not ( = ?auto_9471 ?auto_9472 ) ) ( not ( = ?auto_9471 ?auto_9473 ) ) ( not ( = ?auto_9471 ?auto_9474 ) ) ( not ( = ?auto_9472 ?auto_9473 ) ) ( not ( = ?auto_9472 ?auto_9474 ) ) ( not ( = ?auto_9473 ?auto_9474 ) ) ( ON ?auto_9473 ?auto_9474 ) ( CLEAR ?auto_9471 ) ( ON ?auto_9472 ?auto_9473 ) ( CLEAR ?auto_9472 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_9470 ?auto_9471 ?auto_9472 )
      ( MAKE-5PILE ?auto_9470 ?auto_9471 ?auto_9472 ?auto_9473 ?auto_9474 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_9480 - BLOCK
      ?auto_9481 - BLOCK
      ?auto_9482 - BLOCK
      ?auto_9483 - BLOCK
      ?auto_9484 - BLOCK
    )
    :vars
    (
      ?auto_9485 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_9484 ?auto_9485 ) ( ON-TABLE ?auto_9480 ) ( not ( = ?auto_9480 ?auto_9481 ) ) ( not ( = ?auto_9480 ?auto_9482 ) ) ( not ( = ?auto_9480 ?auto_9483 ) ) ( not ( = ?auto_9480 ?auto_9484 ) ) ( not ( = ?auto_9480 ?auto_9485 ) ) ( not ( = ?auto_9481 ?auto_9482 ) ) ( not ( = ?auto_9481 ?auto_9483 ) ) ( not ( = ?auto_9481 ?auto_9484 ) ) ( not ( = ?auto_9481 ?auto_9485 ) ) ( not ( = ?auto_9482 ?auto_9483 ) ) ( not ( = ?auto_9482 ?auto_9484 ) ) ( not ( = ?auto_9482 ?auto_9485 ) ) ( not ( = ?auto_9483 ?auto_9484 ) ) ( not ( = ?auto_9483 ?auto_9485 ) ) ( not ( = ?auto_9484 ?auto_9485 ) ) ( ON ?auto_9483 ?auto_9484 ) ( ON ?auto_9482 ?auto_9483 ) ( CLEAR ?auto_9480 ) ( ON ?auto_9481 ?auto_9482 ) ( CLEAR ?auto_9481 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_9480 ?auto_9481 )
      ( MAKE-5PILE ?auto_9480 ?auto_9481 ?auto_9482 ?auto_9483 ?auto_9484 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_9491 - BLOCK
      ?auto_9492 - BLOCK
      ?auto_9493 - BLOCK
      ?auto_9494 - BLOCK
      ?auto_9495 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_9495 ) ( ON-TABLE ?auto_9491 ) ( not ( = ?auto_9491 ?auto_9492 ) ) ( not ( = ?auto_9491 ?auto_9493 ) ) ( not ( = ?auto_9491 ?auto_9494 ) ) ( not ( = ?auto_9491 ?auto_9495 ) ) ( not ( = ?auto_9492 ?auto_9493 ) ) ( not ( = ?auto_9492 ?auto_9494 ) ) ( not ( = ?auto_9492 ?auto_9495 ) ) ( not ( = ?auto_9493 ?auto_9494 ) ) ( not ( = ?auto_9493 ?auto_9495 ) ) ( not ( = ?auto_9494 ?auto_9495 ) ) ( ON ?auto_9494 ?auto_9495 ) ( ON ?auto_9493 ?auto_9494 ) ( CLEAR ?auto_9491 ) ( ON ?auto_9492 ?auto_9493 ) ( CLEAR ?auto_9492 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_9491 ?auto_9492 )
      ( MAKE-5PILE ?auto_9491 ?auto_9492 ?auto_9493 ?auto_9494 ?auto_9495 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_9501 - BLOCK
      ?auto_9502 - BLOCK
      ?auto_9503 - BLOCK
      ?auto_9504 - BLOCK
      ?auto_9505 - BLOCK
    )
    :vars
    (
      ?auto_9506 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_9505 ?auto_9506 ) ( not ( = ?auto_9501 ?auto_9502 ) ) ( not ( = ?auto_9501 ?auto_9503 ) ) ( not ( = ?auto_9501 ?auto_9504 ) ) ( not ( = ?auto_9501 ?auto_9505 ) ) ( not ( = ?auto_9501 ?auto_9506 ) ) ( not ( = ?auto_9502 ?auto_9503 ) ) ( not ( = ?auto_9502 ?auto_9504 ) ) ( not ( = ?auto_9502 ?auto_9505 ) ) ( not ( = ?auto_9502 ?auto_9506 ) ) ( not ( = ?auto_9503 ?auto_9504 ) ) ( not ( = ?auto_9503 ?auto_9505 ) ) ( not ( = ?auto_9503 ?auto_9506 ) ) ( not ( = ?auto_9504 ?auto_9505 ) ) ( not ( = ?auto_9504 ?auto_9506 ) ) ( not ( = ?auto_9505 ?auto_9506 ) ) ( ON ?auto_9504 ?auto_9505 ) ( ON ?auto_9503 ?auto_9504 ) ( ON ?auto_9502 ?auto_9503 ) ( ON ?auto_9501 ?auto_9502 ) ( CLEAR ?auto_9501 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_9501 )
      ( MAKE-5PILE ?auto_9501 ?auto_9502 ?auto_9503 ?auto_9504 ?auto_9505 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_9512 - BLOCK
      ?auto_9513 - BLOCK
      ?auto_9514 - BLOCK
      ?auto_9515 - BLOCK
      ?auto_9516 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_9516 ) ( not ( = ?auto_9512 ?auto_9513 ) ) ( not ( = ?auto_9512 ?auto_9514 ) ) ( not ( = ?auto_9512 ?auto_9515 ) ) ( not ( = ?auto_9512 ?auto_9516 ) ) ( not ( = ?auto_9513 ?auto_9514 ) ) ( not ( = ?auto_9513 ?auto_9515 ) ) ( not ( = ?auto_9513 ?auto_9516 ) ) ( not ( = ?auto_9514 ?auto_9515 ) ) ( not ( = ?auto_9514 ?auto_9516 ) ) ( not ( = ?auto_9515 ?auto_9516 ) ) ( ON ?auto_9515 ?auto_9516 ) ( ON ?auto_9514 ?auto_9515 ) ( ON ?auto_9513 ?auto_9514 ) ( ON ?auto_9512 ?auto_9513 ) ( CLEAR ?auto_9512 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_9512 )
      ( MAKE-5PILE ?auto_9512 ?auto_9513 ?auto_9514 ?auto_9515 ?auto_9516 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_9522 - BLOCK
      ?auto_9523 - BLOCK
      ?auto_9524 - BLOCK
      ?auto_9525 - BLOCK
      ?auto_9526 - BLOCK
    )
    :vars
    (
      ?auto_9527 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_9522 ?auto_9523 ) ) ( not ( = ?auto_9522 ?auto_9524 ) ) ( not ( = ?auto_9522 ?auto_9525 ) ) ( not ( = ?auto_9522 ?auto_9526 ) ) ( not ( = ?auto_9523 ?auto_9524 ) ) ( not ( = ?auto_9523 ?auto_9525 ) ) ( not ( = ?auto_9523 ?auto_9526 ) ) ( not ( = ?auto_9524 ?auto_9525 ) ) ( not ( = ?auto_9524 ?auto_9526 ) ) ( not ( = ?auto_9525 ?auto_9526 ) ) ( ON ?auto_9522 ?auto_9527 ) ( not ( = ?auto_9526 ?auto_9527 ) ) ( not ( = ?auto_9525 ?auto_9527 ) ) ( not ( = ?auto_9524 ?auto_9527 ) ) ( not ( = ?auto_9523 ?auto_9527 ) ) ( not ( = ?auto_9522 ?auto_9527 ) ) ( ON ?auto_9523 ?auto_9522 ) ( ON ?auto_9524 ?auto_9523 ) ( ON ?auto_9525 ?auto_9524 ) ( ON ?auto_9526 ?auto_9525 ) ( CLEAR ?auto_9526 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_9526 ?auto_9525 ?auto_9524 ?auto_9523 ?auto_9522 )
      ( MAKE-5PILE ?auto_9522 ?auto_9523 ?auto_9524 ?auto_9525 ?auto_9526 ) )
  )

)

