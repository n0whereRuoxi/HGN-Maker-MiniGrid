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
      ?auto_9368 - BLOCK
      ?auto_9369 - BLOCK
      ?auto_9370 - BLOCK
      ?auto_9371 - BLOCK
    )
    :vars
    (
      ?auto_9372 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_9372 ?auto_9371 ) ( CLEAR ?auto_9372 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_9368 ) ( ON ?auto_9369 ?auto_9368 ) ( ON ?auto_9370 ?auto_9369 ) ( ON ?auto_9371 ?auto_9370 ) ( not ( = ?auto_9368 ?auto_9369 ) ) ( not ( = ?auto_9368 ?auto_9370 ) ) ( not ( = ?auto_9368 ?auto_9371 ) ) ( not ( = ?auto_9368 ?auto_9372 ) ) ( not ( = ?auto_9369 ?auto_9370 ) ) ( not ( = ?auto_9369 ?auto_9371 ) ) ( not ( = ?auto_9369 ?auto_9372 ) ) ( not ( = ?auto_9370 ?auto_9371 ) ) ( not ( = ?auto_9370 ?auto_9372 ) ) ( not ( = ?auto_9371 ?auto_9372 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_9372 ?auto_9371 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_9374 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_9374 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_9374 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_9375 - BLOCK
    )
    :vars
    (
      ?auto_9376 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_9375 ?auto_9376 ) ( CLEAR ?auto_9375 ) ( HAND-EMPTY ) ( not ( = ?auto_9375 ?auto_9376 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_9375 ?auto_9376 )
      ( MAKE-1PILE ?auto_9375 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_9380 - BLOCK
      ?auto_9381 - BLOCK
      ?auto_9382 - BLOCK
    )
    :vars
    (
      ?auto_9383 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_9383 ?auto_9382 ) ( CLEAR ?auto_9383 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_9380 ) ( ON ?auto_9381 ?auto_9380 ) ( ON ?auto_9382 ?auto_9381 ) ( not ( = ?auto_9380 ?auto_9381 ) ) ( not ( = ?auto_9380 ?auto_9382 ) ) ( not ( = ?auto_9380 ?auto_9383 ) ) ( not ( = ?auto_9381 ?auto_9382 ) ) ( not ( = ?auto_9381 ?auto_9383 ) ) ( not ( = ?auto_9382 ?auto_9383 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_9383 ?auto_9382 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_9384 - BLOCK
      ?auto_9385 - BLOCK
      ?auto_9386 - BLOCK
    )
    :vars
    (
      ?auto_9387 - BLOCK
      ?auto_9388 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_9387 ?auto_9386 ) ( CLEAR ?auto_9387 ) ( ON-TABLE ?auto_9384 ) ( ON ?auto_9385 ?auto_9384 ) ( ON ?auto_9386 ?auto_9385 ) ( not ( = ?auto_9384 ?auto_9385 ) ) ( not ( = ?auto_9384 ?auto_9386 ) ) ( not ( = ?auto_9384 ?auto_9387 ) ) ( not ( = ?auto_9385 ?auto_9386 ) ) ( not ( = ?auto_9385 ?auto_9387 ) ) ( not ( = ?auto_9386 ?auto_9387 ) ) ( HOLDING ?auto_9388 ) ( not ( = ?auto_9384 ?auto_9388 ) ) ( not ( = ?auto_9385 ?auto_9388 ) ) ( not ( = ?auto_9386 ?auto_9388 ) ) ( not ( = ?auto_9387 ?auto_9388 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_9388 )
      ( MAKE-3PILE ?auto_9384 ?auto_9385 ?auto_9386 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_9389 - BLOCK
      ?auto_9390 - BLOCK
      ?auto_9391 - BLOCK
    )
    :vars
    (
      ?auto_9392 - BLOCK
      ?auto_9393 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_9392 ?auto_9391 ) ( ON-TABLE ?auto_9389 ) ( ON ?auto_9390 ?auto_9389 ) ( ON ?auto_9391 ?auto_9390 ) ( not ( = ?auto_9389 ?auto_9390 ) ) ( not ( = ?auto_9389 ?auto_9391 ) ) ( not ( = ?auto_9389 ?auto_9392 ) ) ( not ( = ?auto_9390 ?auto_9391 ) ) ( not ( = ?auto_9390 ?auto_9392 ) ) ( not ( = ?auto_9391 ?auto_9392 ) ) ( not ( = ?auto_9389 ?auto_9393 ) ) ( not ( = ?auto_9390 ?auto_9393 ) ) ( not ( = ?auto_9391 ?auto_9393 ) ) ( not ( = ?auto_9392 ?auto_9393 ) ) ( ON ?auto_9393 ?auto_9392 ) ( CLEAR ?auto_9393 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_9389 ?auto_9390 ?auto_9391 ?auto_9392 )
      ( MAKE-3PILE ?auto_9389 ?auto_9390 ?auto_9391 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_9396 - BLOCK
      ?auto_9397 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_9397 ) ( CLEAR ?auto_9396 ) ( ON-TABLE ?auto_9396 ) ( not ( = ?auto_9396 ?auto_9397 ) ) )
    :subtasks
    ( ( !STACK ?auto_9397 ?auto_9396 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_9398 - BLOCK
      ?auto_9399 - BLOCK
    )
    :vars
    (
      ?auto_9400 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_9398 ) ( ON-TABLE ?auto_9398 ) ( not ( = ?auto_9398 ?auto_9399 ) ) ( ON ?auto_9399 ?auto_9400 ) ( CLEAR ?auto_9399 ) ( HAND-EMPTY ) ( not ( = ?auto_9398 ?auto_9400 ) ) ( not ( = ?auto_9399 ?auto_9400 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_9399 ?auto_9400 )
      ( MAKE-2PILE ?auto_9398 ?auto_9399 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_9401 - BLOCK
      ?auto_9402 - BLOCK
    )
    :vars
    (
      ?auto_9403 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_9401 ?auto_9402 ) ) ( ON ?auto_9402 ?auto_9403 ) ( CLEAR ?auto_9402 ) ( not ( = ?auto_9401 ?auto_9403 ) ) ( not ( = ?auto_9402 ?auto_9403 ) ) ( HOLDING ?auto_9401 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_9401 )
      ( MAKE-2PILE ?auto_9401 ?auto_9402 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_9404 - BLOCK
      ?auto_9405 - BLOCK
    )
    :vars
    (
      ?auto_9406 - BLOCK
      ?auto_9407 - BLOCK
      ?auto_9408 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_9404 ?auto_9405 ) ) ( ON ?auto_9405 ?auto_9406 ) ( not ( = ?auto_9404 ?auto_9406 ) ) ( not ( = ?auto_9405 ?auto_9406 ) ) ( ON ?auto_9404 ?auto_9405 ) ( CLEAR ?auto_9404 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_9407 ) ( ON ?auto_9408 ?auto_9407 ) ( ON ?auto_9406 ?auto_9408 ) ( not ( = ?auto_9407 ?auto_9408 ) ) ( not ( = ?auto_9407 ?auto_9406 ) ) ( not ( = ?auto_9407 ?auto_9405 ) ) ( not ( = ?auto_9407 ?auto_9404 ) ) ( not ( = ?auto_9408 ?auto_9406 ) ) ( not ( = ?auto_9408 ?auto_9405 ) ) ( not ( = ?auto_9408 ?auto_9404 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_9407 ?auto_9408 ?auto_9406 ?auto_9405 )
      ( MAKE-2PILE ?auto_9404 ?auto_9405 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_9411 - BLOCK
      ?auto_9412 - BLOCK
    )
    :vars
    (
      ?auto_9413 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_9413 ?auto_9412 ) ( CLEAR ?auto_9413 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_9411 ) ( ON ?auto_9412 ?auto_9411 ) ( not ( = ?auto_9411 ?auto_9412 ) ) ( not ( = ?auto_9411 ?auto_9413 ) ) ( not ( = ?auto_9412 ?auto_9413 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_9413 ?auto_9412 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_9414 - BLOCK
      ?auto_9415 - BLOCK
    )
    :vars
    (
      ?auto_9416 - BLOCK
      ?auto_9417 - BLOCK
      ?auto_9418 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_9416 ?auto_9415 ) ( CLEAR ?auto_9416 ) ( ON-TABLE ?auto_9414 ) ( ON ?auto_9415 ?auto_9414 ) ( not ( = ?auto_9414 ?auto_9415 ) ) ( not ( = ?auto_9414 ?auto_9416 ) ) ( not ( = ?auto_9415 ?auto_9416 ) ) ( HOLDING ?auto_9417 ) ( CLEAR ?auto_9418 ) ( not ( = ?auto_9414 ?auto_9417 ) ) ( not ( = ?auto_9414 ?auto_9418 ) ) ( not ( = ?auto_9415 ?auto_9417 ) ) ( not ( = ?auto_9415 ?auto_9418 ) ) ( not ( = ?auto_9416 ?auto_9417 ) ) ( not ( = ?auto_9416 ?auto_9418 ) ) ( not ( = ?auto_9417 ?auto_9418 ) ) )
    :subtasks
    ( ( !STACK ?auto_9417 ?auto_9418 )
      ( MAKE-2PILE ?auto_9414 ?auto_9415 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_9614 - BLOCK
      ?auto_9615 - BLOCK
    )
    :vars
    (
      ?auto_9616 - BLOCK
      ?auto_9617 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_9616 ?auto_9615 ) ( ON-TABLE ?auto_9614 ) ( ON ?auto_9615 ?auto_9614 ) ( not ( = ?auto_9614 ?auto_9615 ) ) ( not ( = ?auto_9614 ?auto_9616 ) ) ( not ( = ?auto_9615 ?auto_9616 ) ) ( not ( = ?auto_9614 ?auto_9617 ) ) ( not ( = ?auto_9615 ?auto_9617 ) ) ( not ( = ?auto_9616 ?auto_9617 ) ) ( ON ?auto_9617 ?auto_9616 ) ( CLEAR ?auto_9617 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_9614 ?auto_9615 ?auto_9616 )
      ( MAKE-2PILE ?auto_9614 ?auto_9615 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_9424 - BLOCK
      ?auto_9425 - BLOCK
    )
    :vars
    (
      ?auto_9428 - BLOCK
      ?auto_9427 - BLOCK
      ?auto_9426 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_9428 ?auto_9425 ) ( ON-TABLE ?auto_9424 ) ( ON ?auto_9425 ?auto_9424 ) ( not ( = ?auto_9424 ?auto_9425 ) ) ( not ( = ?auto_9424 ?auto_9428 ) ) ( not ( = ?auto_9425 ?auto_9428 ) ) ( not ( = ?auto_9424 ?auto_9427 ) ) ( not ( = ?auto_9424 ?auto_9426 ) ) ( not ( = ?auto_9425 ?auto_9427 ) ) ( not ( = ?auto_9425 ?auto_9426 ) ) ( not ( = ?auto_9428 ?auto_9427 ) ) ( not ( = ?auto_9428 ?auto_9426 ) ) ( not ( = ?auto_9427 ?auto_9426 ) ) ( ON ?auto_9427 ?auto_9428 ) ( CLEAR ?auto_9427 ) ( HOLDING ?auto_9426 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_9426 )
      ( MAKE-2PILE ?auto_9424 ?auto_9425 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_9429 - BLOCK
      ?auto_9430 - BLOCK
    )
    :vars
    (
      ?auto_9431 - BLOCK
      ?auto_9433 - BLOCK
      ?auto_9432 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_9431 ?auto_9430 ) ( ON-TABLE ?auto_9429 ) ( ON ?auto_9430 ?auto_9429 ) ( not ( = ?auto_9429 ?auto_9430 ) ) ( not ( = ?auto_9429 ?auto_9431 ) ) ( not ( = ?auto_9430 ?auto_9431 ) ) ( not ( = ?auto_9429 ?auto_9433 ) ) ( not ( = ?auto_9429 ?auto_9432 ) ) ( not ( = ?auto_9430 ?auto_9433 ) ) ( not ( = ?auto_9430 ?auto_9432 ) ) ( not ( = ?auto_9431 ?auto_9433 ) ) ( not ( = ?auto_9431 ?auto_9432 ) ) ( not ( = ?auto_9433 ?auto_9432 ) ) ( ON ?auto_9433 ?auto_9431 ) ( ON ?auto_9432 ?auto_9433 ) ( CLEAR ?auto_9432 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_9429 ?auto_9430 ?auto_9431 ?auto_9433 )
      ( MAKE-2PILE ?auto_9429 ?auto_9430 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_9437 - BLOCK
      ?auto_9438 - BLOCK
      ?auto_9439 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_9439 ) ( CLEAR ?auto_9438 ) ( ON-TABLE ?auto_9437 ) ( ON ?auto_9438 ?auto_9437 ) ( not ( = ?auto_9437 ?auto_9438 ) ) ( not ( = ?auto_9437 ?auto_9439 ) ) ( not ( = ?auto_9438 ?auto_9439 ) ) )
    :subtasks
    ( ( !STACK ?auto_9439 ?auto_9438 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_9440 - BLOCK
      ?auto_9441 - BLOCK
      ?auto_9442 - BLOCK
    )
    :vars
    (
      ?auto_9443 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_9441 ) ( ON-TABLE ?auto_9440 ) ( ON ?auto_9441 ?auto_9440 ) ( not ( = ?auto_9440 ?auto_9441 ) ) ( not ( = ?auto_9440 ?auto_9442 ) ) ( not ( = ?auto_9441 ?auto_9442 ) ) ( ON ?auto_9442 ?auto_9443 ) ( CLEAR ?auto_9442 ) ( HAND-EMPTY ) ( not ( = ?auto_9440 ?auto_9443 ) ) ( not ( = ?auto_9441 ?auto_9443 ) ) ( not ( = ?auto_9442 ?auto_9443 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_9442 ?auto_9443 )
      ( MAKE-3PILE ?auto_9440 ?auto_9441 ?auto_9442 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_9444 - BLOCK
      ?auto_9445 - BLOCK
      ?auto_9446 - BLOCK
    )
    :vars
    (
      ?auto_9447 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_9444 ) ( not ( = ?auto_9444 ?auto_9445 ) ) ( not ( = ?auto_9444 ?auto_9446 ) ) ( not ( = ?auto_9445 ?auto_9446 ) ) ( ON ?auto_9446 ?auto_9447 ) ( CLEAR ?auto_9446 ) ( not ( = ?auto_9444 ?auto_9447 ) ) ( not ( = ?auto_9445 ?auto_9447 ) ) ( not ( = ?auto_9446 ?auto_9447 ) ) ( HOLDING ?auto_9445 ) ( CLEAR ?auto_9444 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_9444 ?auto_9445 )
      ( MAKE-3PILE ?auto_9444 ?auto_9445 ?auto_9446 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_9448 - BLOCK
      ?auto_9449 - BLOCK
      ?auto_9450 - BLOCK
    )
    :vars
    (
      ?auto_9451 - BLOCK
      ?auto_9452 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_9448 ) ( not ( = ?auto_9448 ?auto_9449 ) ) ( not ( = ?auto_9448 ?auto_9450 ) ) ( not ( = ?auto_9449 ?auto_9450 ) ) ( ON ?auto_9450 ?auto_9451 ) ( not ( = ?auto_9448 ?auto_9451 ) ) ( not ( = ?auto_9449 ?auto_9451 ) ) ( not ( = ?auto_9450 ?auto_9451 ) ) ( CLEAR ?auto_9448 ) ( ON ?auto_9449 ?auto_9450 ) ( CLEAR ?auto_9449 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_9452 ) ( ON ?auto_9451 ?auto_9452 ) ( not ( = ?auto_9452 ?auto_9451 ) ) ( not ( = ?auto_9452 ?auto_9450 ) ) ( not ( = ?auto_9452 ?auto_9449 ) ) ( not ( = ?auto_9448 ?auto_9452 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_9452 ?auto_9451 ?auto_9450 )
      ( MAKE-3PILE ?auto_9448 ?auto_9449 ?auto_9450 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_9453 - BLOCK
      ?auto_9454 - BLOCK
      ?auto_9455 - BLOCK
    )
    :vars
    (
      ?auto_9456 - BLOCK
      ?auto_9457 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_9453 ?auto_9454 ) ) ( not ( = ?auto_9453 ?auto_9455 ) ) ( not ( = ?auto_9454 ?auto_9455 ) ) ( ON ?auto_9455 ?auto_9456 ) ( not ( = ?auto_9453 ?auto_9456 ) ) ( not ( = ?auto_9454 ?auto_9456 ) ) ( not ( = ?auto_9455 ?auto_9456 ) ) ( ON ?auto_9454 ?auto_9455 ) ( CLEAR ?auto_9454 ) ( ON-TABLE ?auto_9457 ) ( ON ?auto_9456 ?auto_9457 ) ( not ( = ?auto_9457 ?auto_9456 ) ) ( not ( = ?auto_9457 ?auto_9455 ) ) ( not ( = ?auto_9457 ?auto_9454 ) ) ( not ( = ?auto_9453 ?auto_9457 ) ) ( HOLDING ?auto_9453 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_9453 )
      ( MAKE-3PILE ?auto_9453 ?auto_9454 ?auto_9455 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_9458 - BLOCK
      ?auto_9459 - BLOCK
      ?auto_9460 - BLOCK
    )
    :vars
    (
      ?auto_9461 - BLOCK
      ?auto_9462 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_9458 ?auto_9459 ) ) ( not ( = ?auto_9458 ?auto_9460 ) ) ( not ( = ?auto_9459 ?auto_9460 ) ) ( ON ?auto_9460 ?auto_9461 ) ( not ( = ?auto_9458 ?auto_9461 ) ) ( not ( = ?auto_9459 ?auto_9461 ) ) ( not ( = ?auto_9460 ?auto_9461 ) ) ( ON ?auto_9459 ?auto_9460 ) ( ON-TABLE ?auto_9462 ) ( ON ?auto_9461 ?auto_9462 ) ( not ( = ?auto_9462 ?auto_9461 ) ) ( not ( = ?auto_9462 ?auto_9460 ) ) ( not ( = ?auto_9462 ?auto_9459 ) ) ( not ( = ?auto_9458 ?auto_9462 ) ) ( ON ?auto_9458 ?auto_9459 ) ( CLEAR ?auto_9458 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_9462 ?auto_9461 ?auto_9460 ?auto_9459 )
      ( MAKE-3PILE ?auto_9458 ?auto_9459 ?auto_9460 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_9464 - BLOCK
    )
    :vars
    (
      ?auto_9465 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_9465 ?auto_9464 ) ( CLEAR ?auto_9465 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_9464 ) ( not ( = ?auto_9464 ?auto_9465 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_9465 ?auto_9464 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_9466 - BLOCK
    )
    :vars
    (
      ?auto_9467 - BLOCK
      ?auto_9468 - BLOCK
      ?auto_9469 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_9467 ?auto_9466 ) ( CLEAR ?auto_9467 ) ( ON-TABLE ?auto_9466 ) ( not ( = ?auto_9466 ?auto_9467 ) ) ( HOLDING ?auto_9468 ) ( CLEAR ?auto_9469 ) ( not ( = ?auto_9466 ?auto_9468 ) ) ( not ( = ?auto_9466 ?auto_9469 ) ) ( not ( = ?auto_9467 ?auto_9468 ) ) ( not ( = ?auto_9467 ?auto_9469 ) ) ( not ( = ?auto_9468 ?auto_9469 ) ) )
    :subtasks
    ( ( !STACK ?auto_9468 ?auto_9469 )
      ( MAKE-1PILE ?auto_9466 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_9470 - BLOCK
    )
    :vars
    (
      ?auto_9471 - BLOCK
      ?auto_9473 - BLOCK
      ?auto_9472 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_9471 ?auto_9470 ) ( ON-TABLE ?auto_9470 ) ( not ( = ?auto_9470 ?auto_9471 ) ) ( CLEAR ?auto_9473 ) ( not ( = ?auto_9470 ?auto_9472 ) ) ( not ( = ?auto_9470 ?auto_9473 ) ) ( not ( = ?auto_9471 ?auto_9472 ) ) ( not ( = ?auto_9471 ?auto_9473 ) ) ( not ( = ?auto_9472 ?auto_9473 ) ) ( ON ?auto_9472 ?auto_9471 ) ( CLEAR ?auto_9472 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_9470 ?auto_9471 )
      ( MAKE-1PILE ?auto_9470 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_9474 - BLOCK
    )
    :vars
    (
      ?auto_9475 - BLOCK
      ?auto_9476 - BLOCK
      ?auto_9477 - BLOCK
      ?auto_9478 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_9475 ?auto_9474 ) ( ON-TABLE ?auto_9474 ) ( not ( = ?auto_9474 ?auto_9475 ) ) ( not ( = ?auto_9474 ?auto_9476 ) ) ( not ( = ?auto_9474 ?auto_9477 ) ) ( not ( = ?auto_9475 ?auto_9476 ) ) ( not ( = ?auto_9475 ?auto_9477 ) ) ( not ( = ?auto_9476 ?auto_9477 ) ) ( ON ?auto_9476 ?auto_9475 ) ( CLEAR ?auto_9476 ) ( HOLDING ?auto_9477 ) ( CLEAR ?auto_9478 ) ( ON-TABLE ?auto_9478 ) ( not ( = ?auto_9478 ?auto_9477 ) ) ( not ( = ?auto_9474 ?auto_9478 ) ) ( not ( = ?auto_9475 ?auto_9478 ) ) ( not ( = ?auto_9476 ?auto_9478 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_9478 ?auto_9477 )
      ( MAKE-1PILE ?auto_9474 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_9702 - BLOCK
    )
    :vars
    (
      ?auto_9705 - BLOCK
      ?auto_9703 - BLOCK
      ?auto_9704 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_9705 ?auto_9702 ) ( ON-TABLE ?auto_9702 ) ( not ( = ?auto_9702 ?auto_9705 ) ) ( not ( = ?auto_9702 ?auto_9703 ) ) ( not ( = ?auto_9702 ?auto_9704 ) ) ( not ( = ?auto_9705 ?auto_9703 ) ) ( not ( = ?auto_9705 ?auto_9704 ) ) ( not ( = ?auto_9703 ?auto_9704 ) ) ( ON ?auto_9703 ?auto_9705 ) ( ON ?auto_9704 ?auto_9703 ) ( CLEAR ?auto_9704 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_9702 ?auto_9705 ?auto_9703 )
      ( MAKE-1PILE ?auto_9702 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_9484 - BLOCK
    )
    :vars
    (
      ?auto_9486 - BLOCK
      ?auto_9485 - BLOCK
      ?auto_9488 - BLOCK
      ?auto_9487 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_9486 ?auto_9484 ) ( ON-TABLE ?auto_9484 ) ( not ( = ?auto_9484 ?auto_9486 ) ) ( not ( = ?auto_9484 ?auto_9485 ) ) ( not ( = ?auto_9484 ?auto_9488 ) ) ( not ( = ?auto_9486 ?auto_9485 ) ) ( not ( = ?auto_9486 ?auto_9488 ) ) ( not ( = ?auto_9485 ?auto_9488 ) ) ( ON ?auto_9485 ?auto_9486 ) ( not ( = ?auto_9487 ?auto_9488 ) ) ( not ( = ?auto_9484 ?auto_9487 ) ) ( not ( = ?auto_9486 ?auto_9487 ) ) ( not ( = ?auto_9485 ?auto_9487 ) ) ( ON ?auto_9488 ?auto_9485 ) ( CLEAR ?auto_9488 ) ( HOLDING ?auto_9487 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_9487 )
      ( MAKE-1PILE ?auto_9484 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_9489 - BLOCK
    )
    :vars
    (
      ?auto_9491 - BLOCK
      ?auto_9490 - BLOCK
      ?auto_9492 - BLOCK
      ?auto_9493 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_9491 ?auto_9489 ) ( ON-TABLE ?auto_9489 ) ( not ( = ?auto_9489 ?auto_9491 ) ) ( not ( = ?auto_9489 ?auto_9490 ) ) ( not ( = ?auto_9489 ?auto_9492 ) ) ( not ( = ?auto_9491 ?auto_9490 ) ) ( not ( = ?auto_9491 ?auto_9492 ) ) ( not ( = ?auto_9490 ?auto_9492 ) ) ( ON ?auto_9490 ?auto_9491 ) ( not ( = ?auto_9493 ?auto_9492 ) ) ( not ( = ?auto_9489 ?auto_9493 ) ) ( not ( = ?auto_9491 ?auto_9493 ) ) ( not ( = ?auto_9490 ?auto_9493 ) ) ( ON ?auto_9492 ?auto_9490 ) ( ON ?auto_9493 ?auto_9492 ) ( CLEAR ?auto_9493 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_9489 ?auto_9491 ?auto_9490 ?auto_9492 )
      ( MAKE-1PILE ?auto_9489 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_9498 - BLOCK
      ?auto_9499 - BLOCK
      ?auto_9500 - BLOCK
      ?auto_9501 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_9501 ) ( CLEAR ?auto_9500 ) ( ON-TABLE ?auto_9498 ) ( ON ?auto_9499 ?auto_9498 ) ( ON ?auto_9500 ?auto_9499 ) ( not ( = ?auto_9498 ?auto_9499 ) ) ( not ( = ?auto_9498 ?auto_9500 ) ) ( not ( = ?auto_9498 ?auto_9501 ) ) ( not ( = ?auto_9499 ?auto_9500 ) ) ( not ( = ?auto_9499 ?auto_9501 ) ) ( not ( = ?auto_9500 ?auto_9501 ) ) )
    :subtasks
    ( ( !STACK ?auto_9501 ?auto_9500 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
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
    ( and ( CLEAR ?auto_9504 ) ( ON-TABLE ?auto_9502 ) ( ON ?auto_9503 ?auto_9502 ) ( ON ?auto_9504 ?auto_9503 ) ( not ( = ?auto_9502 ?auto_9503 ) ) ( not ( = ?auto_9502 ?auto_9504 ) ) ( not ( = ?auto_9502 ?auto_9505 ) ) ( not ( = ?auto_9503 ?auto_9504 ) ) ( not ( = ?auto_9503 ?auto_9505 ) ) ( not ( = ?auto_9504 ?auto_9505 ) ) ( ON ?auto_9505 ?auto_9506 ) ( CLEAR ?auto_9505 ) ( HAND-EMPTY ) ( not ( = ?auto_9502 ?auto_9506 ) ) ( not ( = ?auto_9503 ?auto_9506 ) ) ( not ( = ?auto_9504 ?auto_9506 ) ) ( not ( = ?auto_9505 ?auto_9506 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_9505 ?auto_9506 )
      ( MAKE-4PILE ?auto_9502 ?auto_9503 ?auto_9504 ?auto_9505 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_9507 - BLOCK
      ?auto_9508 - BLOCK
      ?auto_9509 - BLOCK
      ?auto_9510 - BLOCK
    )
    :vars
    (
      ?auto_9511 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_9507 ) ( ON ?auto_9508 ?auto_9507 ) ( not ( = ?auto_9507 ?auto_9508 ) ) ( not ( = ?auto_9507 ?auto_9509 ) ) ( not ( = ?auto_9507 ?auto_9510 ) ) ( not ( = ?auto_9508 ?auto_9509 ) ) ( not ( = ?auto_9508 ?auto_9510 ) ) ( not ( = ?auto_9509 ?auto_9510 ) ) ( ON ?auto_9510 ?auto_9511 ) ( CLEAR ?auto_9510 ) ( not ( = ?auto_9507 ?auto_9511 ) ) ( not ( = ?auto_9508 ?auto_9511 ) ) ( not ( = ?auto_9509 ?auto_9511 ) ) ( not ( = ?auto_9510 ?auto_9511 ) ) ( HOLDING ?auto_9509 ) ( CLEAR ?auto_9508 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_9507 ?auto_9508 ?auto_9509 )
      ( MAKE-4PILE ?auto_9507 ?auto_9508 ?auto_9509 ?auto_9510 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_9512 - BLOCK
      ?auto_9513 - BLOCK
      ?auto_9514 - BLOCK
      ?auto_9515 - BLOCK
    )
    :vars
    (
      ?auto_9516 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_9512 ) ( ON ?auto_9513 ?auto_9512 ) ( not ( = ?auto_9512 ?auto_9513 ) ) ( not ( = ?auto_9512 ?auto_9514 ) ) ( not ( = ?auto_9512 ?auto_9515 ) ) ( not ( = ?auto_9513 ?auto_9514 ) ) ( not ( = ?auto_9513 ?auto_9515 ) ) ( not ( = ?auto_9514 ?auto_9515 ) ) ( ON ?auto_9515 ?auto_9516 ) ( not ( = ?auto_9512 ?auto_9516 ) ) ( not ( = ?auto_9513 ?auto_9516 ) ) ( not ( = ?auto_9514 ?auto_9516 ) ) ( not ( = ?auto_9515 ?auto_9516 ) ) ( CLEAR ?auto_9513 ) ( ON ?auto_9514 ?auto_9515 ) ( CLEAR ?auto_9514 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_9516 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_9516 ?auto_9515 )
      ( MAKE-4PILE ?auto_9512 ?auto_9513 ?auto_9514 ?auto_9515 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_9517 - BLOCK
      ?auto_9518 - BLOCK
      ?auto_9519 - BLOCK
      ?auto_9520 - BLOCK
    )
    :vars
    (
      ?auto_9521 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_9517 ) ( not ( = ?auto_9517 ?auto_9518 ) ) ( not ( = ?auto_9517 ?auto_9519 ) ) ( not ( = ?auto_9517 ?auto_9520 ) ) ( not ( = ?auto_9518 ?auto_9519 ) ) ( not ( = ?auto_9518 ?auto_9520 ) ) ( not ( = ?auto_9519 ?auto_9520 ) ) ( ON ?auto_9520 ?auto_9521 ) ( not ( = ?auto_9517 ?auto_9521 ) ) ( not ( = ?auto_9518 ?auto_9521 ) ) ( not ( = ?auto_9519 ?auto_9521 ) ) ( not ( = ?auto_9520 ?auto_9521 ) ) ( ON ?auto_9519 ?auto_9520 ) ( CLEAR ?auto_9519 ) ( ON-TABLE ?auto_9521 ) ( HOLDING ?auto_9518 ) ( CLEAR ?auto_9517 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_9517 ?auto_9518 )
      ( MAKE-4PILE ?auto_9517 ?auto_9518 ?auto_9519 ?auto_9520 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_9522 - BLOCK
      ?auto_9523 - BLOCK
      ?auto_9524 - BLOCK
      ?auto_9525 - BLOCK
    )
    :vars
    (
      ?auto_9526 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_9522 ) ( not ( = ?auto_9522 ?auto_9523 ) ) ( not ( = ?auto_9522 ?auto_9524 ) ) ( not ( = ?auto_9522 ?auto_9525 ) ) ( not ( = ?auto_9523 ?auto_9524 ) ) ( not ( = ?auto_9523 ?auto_9525 ) ) ( not ( = ?auto_9524 ?auto_9525 ) ) ( ON ?auto_9525 ?auto_9526 ) ( not ( = ?auto_9522 ?auto_9526 ) ) ( not ( = ?auto_9523 ?auto_9526 ) ) ( not ( = ?auto_9524 ?auto_9526 ) ) ( not ( = ?auto_9525 ?auto_9526 ) ) ( ON ?auto_9524 ?auto_9525 ) ( ON-TABLE ?auto_9526 ) ( CLEAR ?auto_9522 ) ( ON ?auto_9523 ?auto_9524 ) ( CLEAR ?auto_9523 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_9526 ?auto_9525 ?auto_9524 )
      ( MAKE-4PILE ?auto_9522 ?auto_9523 ?auto_9524 ?auto_9525 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_9527 - BLOCK
      ?auto_9528 - BLOCK
      ?auto_9529 - BLOCK
      ?auto_9530 - BLOCK
    )
    :vars
    (
      ?auto_9531 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_9527 ?auto_9528 ) ) ( not ( = ?auto_9527 ?auto_9529 ) ) ( not ( = ?auto_9527 ?auto_9530 ) ) ( not ( = ?auto_9528 ?auto_9529 ) ) ( not ( = ?auto_9528 ?auto_9530 ) ) ( not ( = ?auto_9529 ?auto_9530 ) ) ( ON ?auto_9530 ?auto_9531 ) ( not ( = ?auto_9527 ?auto_9531 ) ) ( not ( = ?auto_9528 ?auto_9531 ) ) ( not ( = ?auto_9529 ?auto_9531 ) ) ( not ( = ?auto_9530 ?auto_9531 ) ) ( ON ?auto_9529 ?auto_9530 ) ( ON-TABLE ?auto_9531 ) ( ON ?auto_9528 ?auto_9529 ) ( CLEAR ?auto_9528 ) ( HOLDING ?auto_9527 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_9527 )
      ( MAKE-4PILE ?auto_9527 ?auto_9528 ?auto_9529 ?auto_9530 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_9532 - BLOCK
      ?auto_9533 - BLOCK
      ?auto_9534 - BLOCK
      ?auto_9535 - BLOCK
    )
    :vars
    (
      ?auto_9536 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_9532 ?auto_9533 ) ) ( not ( = ?auto_9532 ?auto_9534 ) ) ( not ( = ?auto_9532 ?auto_9535 ) ) ( not ( = ?auto_9533 ?auto_9534 ) ) ( not ( = ?auto_9533 ?auto_9535 ) ) ( not ( = ?auto_9534 ?auto_9535 ) ) ( ON ?auto_9535 ?auto_9536 ) ( not ( = ?auto_9532 ?auto_9536 ) ) ( not ( = ?auto_9533 ?auto_9536 ) ) ( not ( = ?auto_9534 ?auto_9536 ) ) ( not ( = ?auto_9535 ?auto_9536 ) ) ( ON ?auto_9534 ?auto_9535 ) ( ON-TABLE ?auto_9536 ) ( ON ?auto_9533 ?auto_9534 ) ( ON ?auto_9532 ?auto_9533 ) ( CLEAR ?auto_9532 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_9536 ?auto_9535 ?auto_9534 ?auto_9533 )
      ( MAKE-4PILE ?auto_9532 ?auto_9533 ?auto_9534 ?auto_9535 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_9577 - BLOCK
    )
    :vars
    (
      ?auto_9578 - BLOCK
      ?auto_9579 - BLOCK
      ?auto_9580 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_9577 ?auto_9578 ) ( CLEAR ?auto_9577 ) ( not ( = ?auto_9577 ?auto_9578 ) ) ( HOLDING ?auto_9579 ) ( CLEAR ?auto_9580 ) ( not ( = ?auto_9577 ?auto_9579 ) ) ( not ( = ?auto_9577 ?auto_9580 ) ) ( not ( = ?auto_9578 ?auto_9579 ) ) ( not ( = ?auto_9578 ?auto_9580 ) ) ( not ( = ?auto_9579 ?auto_9580 ) ) )
    :subtasks
    ( ( !STACK ?auto_9579 ?auto_9580 )
      ( MAKE-1PILE ?auto_9577 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_9581 - BLOCK
    )
    :vars
    (
      ?auto_9582 - BLOCK
      ?auto_9584 - BLOCK
      ?auto_9583 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_9581 ?auto_9582 ) ( not ( = ?auto_9581 ?auto_9582 ) ) ( CLEAR ?auto_9584 ) ( not ( = ?auto_9581 ?auto_9583 ) ) ( not ( = ?auto_9581 ?auto_9584 ) ) ( not ( = ?auto_9582 ?auto_9583 ) ) ( not ( = ?auto_9582 ?auto_9584 ) ) ( not ( = ?auto_9583 ?auto_9584 ) ) ( ON ?auto_9583 ?auto_9581 ) ( CLEAR ?auto_9583 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_9582 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_9582 ?auto_9581 )
      ( MAKE-1PILE ?auto_9581 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_9585 - BLOCK
    )
    :vars
    (
      ?auto_9588 - BLOCK
      ?auto_9586 - BLOCK
      ?auto_9587 - BLOCK
      ?auto_9589 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_9585 ?auto_9588 ) ( not ( = ?auto_9585 ?auto_9588 ) ) ( not ( = ?auto_9585 ?auto_9586 ) ) ( not ( = ?auto_9585 ?auto_9587 ) ) ( not ( = ?auto_9588 ?auto_9586 ) ) ( not ( = ?auto_9588 ?auto_9587 ) ) ( not ( = ?auto_9586 ?auto_9587 ) ) ( ON ?auto_9586 ?auto_9585 ) ( CLEAR ?auto_9586 ) ( ON-TABLE ?auto_9588 ) ( HOLDING ?auto_9587 ) ( CLEAR ?auto_9589 ) ( ON-TABLE ?auto_9589 ) ( not ( = ?auto_9589 ?auto_9587 ) ) ( not ( = ?auto_9585 ?auto_9589 ) ) ( not ( = ?auto_9588 ?auto_9589 ) ) ( not ( = ?auto_9586 ?auto_9589 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_9589 ?auto_9587 )
      ( MAKE-1PILE ?auto_9585 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_9590 - BLOCK
    )
    :vars
    (
      ?auto_9591 - BLOCK
      ?auto_9593 - BLOCK
      ?auto_9592 - BLOCK
      ?auto_9594 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_9590 ?auto_9591 ) ( not ( = ?auto_9590 ?auto_9591 ) ) ( not ( = ?auto_9590 ?auto_9593 ) ) ( not ( = ?auto_9590 ?auto_9592 ) ) ( not ( = ?auto_9591 ?auto_9593 ) ) ( not ( = ?auto_9591 ?auto_9592 ) ) ( not ( = ?auto_9593 ?auto_9592 ) ) ( ON ?auto_9593 ?auto_9590 ) ( ON-TABLE ?auto_9591 ) ( CLEAR ?auto_9594 ) ( ON-TABLE ?auto_9594 ) ( not ( = ?auto_9594 ?auto_9592 ) ) ( not ( = ?auto_9590 ?auto_9594 ) ) ( not ( = ?auto_9591 ?auto_9594 ) ) ( not ( = ?auto_9593 ?auto_9594 ) ) ( ON ?auto_9592 ?auto_9593 ) ( CLEAR ?auto_9592 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_9591 ?auto_9590 ?auto_9593 )
      ( MAKE-1PILE ?auto_9590 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_9595 - BLOCK
    )
    :vars
    (
      ?auto_9597 - BLOCK
      ?auto_9598 - BLOCK
      ?auto_9599 - BLOCK
      ?auto_9596 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_9595 ?auto_9597 ) ( not ( = ?auto_9595 ?auto_9597 ) ) ( not ( = ?auto_9595 ?auto_9598 ) ) ( not ( = ?auto_9595 ?auto_9599 ) ) ( not ( = ?auto_9597 ?auto_9598 ) ) ( not ( = ?auto_9597 ?auto_9599 ) ) ( not ( = ?auto_9598 ?auto_9599 ) ) ( ON ?auto_9598 ?auto_9595 ) ( ON-TABLE ?auto_9597 ) ( not ( = ?auto_9596 ?auto_9599 ) ) ( not ( = ?auto_9595 ?auto_9596 ) ) ( not ( = ?auto_9597 ?auto_9596 ) ) ( not ( = ?auto_9598 ?auto_9596 ) ) ( ON ?auto_9599 ?auto_9598 ) ( CLEAR ?auto_9599 ) ( HOLDING ?auto_9596 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_9596 )
      ( MAKE-1PILE ?auto_9595 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_9600 - BLOCK
    )
    :vars
    (
      ?auto_9603 - BLOCK
      ?auto_9604 - BLOCK
      ?auto_9602 - BLOCK
      ?auto_9601 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_9600 ?auto_9603 ) ( not ( = ?auto_9600 ?auto_9603 ) ) ( not ( = ?auto_9600 ?auto_9604 ) ) ( not ( = ?auto_9600 ?auto_9602 ) ) ( not ( = ?auto_9603 ?auto_9604 ) ) ( not ( = ?auto_9603 ?auto_9602 ) ) ( not ( = ?auto_9604 ?auto_9602 ) ) ( ON ?auto_9604 ?auto_9600 ) ( ON-TABLE ?auto_9603 ) ( not ( = ?auto_9601 ?auto_9602 ) ) ( not ( = ?auto_9600 ?auto_9601 ) ) ( not ( = ?auto_9603 ?auto_9601 ) ) ( not ( = ?auto_9604 ?auto_9601 ) ) ( ON ?auto_9602 ?auto_9604 ) ( ON ?auto_9601 ?auto_9602 ) ( CLEAR ?auto_9601 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_9603 ?auto_9600 ?auto_9604 ?auto_9602 )
      ( MAKE-1PILE ?auto_9600 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_9610 - BLOCK
      ?auto_9611 - BLOCK
    )
    :vars
    (
      ?auto_9612 - BLOCK
      ?auto_9613 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_9612 ?auto_9611 ) ( CLEAR ?auto_9612 ) ( ON-TABLE ?auto_9610 ) ( ON ?auto_9611 ?auto_9610 ) ( not ( = ?auto_9610 ?auto_9611 ) ) ( not ( = ?auto_9610 ?auto_9612 ) ) ( not ( = ?auto_9611 ?auto_9612 ) ) ( HOLDING ?auto_9613 ) ( not ( = ?auto_9610 ?auto_9613 ) ) ( not ( = ?auto_9611 ?auto_9613 ) ) ( not ( = ?auto_9612 ?auto_9613 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_9613 )
      ( MAKE-2PILE ?auto_9610 ?auto_9611 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_9647 - BLOCK
      ?auto_9648 - BLOCK
    )
    :vars
    (
      ?auto_9649 - BLOCK
      ?auto_9650 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_9647 ?auto_9648 ) ) ( ON ?auto_9648 ?auto_9649 ) ( not ( = ?auto_9647 ?auto_9649 ) ) ( not ( = ?auto_9648 ?auto_9649 ) ) ( ON ?auto_9647 ?auto_9648 ) ( CLEAR ?auto_9647 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_9650 ) ( ON ?auto_9649 ?auto_9650 ) ( not ( = ?auto_9650 ?auto_9649 ) ) ( not ( = ?auto_9650 ?auto_9648 ) ) ( not ( = ?auto_9650 ?auto_9647 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_9650 ?auto_9649 ?auto_9648 )
      ( MAKE-2PILE ?auto_9647 ?auto_9648 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_9653 - BLOCK
      ?auto_9654 - BLOCK
    )
    :vars
    (
      ?auto_9655 - BLOCK
      ?auto_9656 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_9653 ?auto_9654 ) ) ( ON ?auto_9654 ?auto_9655 ) ( CLEAR ?auto_9654 ) ( not ( = ?auto_9653 ?auto_9655 ) ) ( not ( = ?auto_9654 ?auto_9655 ) ) ( ON ?auto_9653 ?auto_9656 ) ( CLEAR ?auto_9653 ) ( HAND-EMPTY ) ( not ( = ?auto_9653 ?auto_9656 ) ) ( not ( = ?auto_9654 ?auto_9656 ) ) ( not ( = ?auto_9655 ?auto_9656 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_9653 ?auto_9656 )
      ( MAKE-2PILE ?auto_9653 ?auto_9654 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_9657 - BLOCK
      ?auto_9658 - BLOCK
    )
    :vars
    (
      ?auto_9660 - BLOCK
      ?auto_9659 - BLOCK
      ?auto_9661 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_9657 ?auto_9658 ) ) ( not ( = ?auto_9657 ?auto_9660 ) ) ( not ( = ?auto_9658 ?auto_9660 ) ) ( ON ?auto_9657 ?auto_9659 ) ( CLEAR ?auto_9657 ) ( not ( = ?auto_9657 ?auto_9659 ) ) ( not ( = ?auto_9658 ?auto_9659 ) ) ( not ( = ?auto_9660 ?auto_9659 ) ) ( HOLDING ?auto_9658 ) ( CLEAR ?auto_9660 ) ( ON-TABLE ?auto_9661 ) ( ON ?auto_9660 ?auto_9661 ) ( not ( = ?auto_9661 ?auto_9660 ) ) ( not ( = ?auto_9661 ?auto_9658 ) ) ( not ( = ?auto_9657 ?auto_9661 ) ) ( not ( = ?auto_9659 ?auto_9661 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_9661 ?auto_9660 ?auto_9658 )
      ( MAKE-2PILE ?auto_9657 ?auto_9658 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_9662 - BLOCK
      ?auto_9663 - BLOCK
    )
    :vars
    (
      ?auto_9664 - BLOCK
      ?auto_9665 - BLOCK
      ?auto_9666 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_9662 ?auto_9663 ) ) ( not ( = ?auto_9662 ?auto_9664 ) ) ( not ( = ?auto_9663 ?auto_9664 ) ) ( ON ?auto_9662 ?auto_9665 ) ( not ( = ?auto_9662 ?auto_9665 ) ) ( not ( = ?auto_9663 ?auto_9665 ) ) ( not ( = ?auto_9664 ?auto_9665 ) ) ( CLEAR ?auto_9664 ) ( ON-TABLE ?auto_9666 ) ( ON ?auto_9664 ?auto_9666 ) ( not ( = ?auto_9666 ?auto_9664 ) ) ( not ( = ?auto_9666 ?auto_9663 ) ) ( not ( = ?auto_9662 ?auto_9666 ) ) ( not ( = ?auto_9665 ?auto_9666 ) ) ( ON ?auto_9663 ?auto_9662 ) ( CLEAR ?auto_9663 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_9665 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_9665 ?auto_9662 )
      ( MAKE-2PILE ?auto_9662 ?auto_9663 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_9667 - BLOCK
      ?auto_9668 - BLOCK
    )
    :vars
    (
      ?auto_9670 - BLOCK
      ?auto_9671 - BLOCK
      ?auto_9669 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_9667 ?auto_9668 ) ) ( not ( = ?auto_9667 ?auto_9670 ) ) ( not ( = ?auto_9668 ?auto_9670 ) ) ( ON ?auto_9667 ?auto_9671 ) ( not ( = ?auto_9667 ?auto_9671 ) ) ( not ( = ?auto_9668 ?auto_9671 ) ) ( not ( = ?auto_9670 ?auto_9671 ) ) ( ON-TABLE ?auto_9669 ) ( not ( = ?auto_9669 ?auto_9670 ) ) ( not ( = ?auto_9669 ?auto_9668 ) ) ( not ( = ?auto_9667 ?auto_9669 ) ) ( not ( = ?auto_9671 ?auto_9669 ) ) ( ON ?auto_9668 ?auto_9667 ) ( CLEAR ?auto_9668 ) ( ON-TABLE ?auto_9671 ) ( HOLDING ?auto_9670 ) ( CLEAR ?auto_9669 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_9669 ?auto_9670 )
      ( MAKE-2PILE ?auto_9667 ?auto_9668 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_9672 - BLOCK
      ?auto_9673 - BLOCK
    )
    :vars
    (
      ?auto_9674 - BLOCK
      ?auto_9675 - BLOCK
      ?auto_9676 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_9672 ?auto_9673 ) ) ( not ( = ?auto_9672 ?auto_9674 ) ) ( not ( = ?auto_9673 ?auto_9674 ) ) ( ON ?auto_9672 ?auto_9675 ) ( not ( = ?auto_9672 ?auto_9675 ) ) ( not ( = ?auto_9673 ?auto_9675 ) ) ( not ( = ?auto_9674 ?auto_9675 ) ) ( ON-TABLE ?auto_9676 ) ( not ( = ?auto_9676 ?auto_9674 ) ) ( not ( = ?auto_9676 ?auto_9673 ) ) ( not ( = ?auto_9672 ?auto_9676 ) ) ( not ( = ?auto_9675 ?auto_9676 ) ) ( ON ?auto_9673 ?auto_9672 ) ( ON-TABLE ?auto_9675 ) ( CLEAR ?auto_9676 ) ( ON ?auto_9674 ?auto_9673 ) ( CLEAR ?auto_9674 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_9675 ?auto_9672 ?auto_9673 )
      ( MAKE-2PILE ?auto_9672 ?auto_9673 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_9677 - BLOCK
      ?auto_9678 - BLOCK
    )
    :vars
    (
      ?auto_9679 - BLOCK
      ?auto_9680 - BLOCK
      ?auto_9681 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_9677 ?auto_9678 ) ) ( not ( = ?auto_9677 ?auto_9679 ) ) ( not ( = ?auto_9678 ?auto_9679 ) ) ( ON ?auto_9677 ?auto_9680 ) ( not ( = ?auto_9677 ?auto_9680 ) ) ( not ( = ?auto_9678 ?auto_9680 ) ) ( not ( = ?auto_9679 ?auto_9680 ) ) ( not ( = ?auto_9681 ?auto_9679 ) ) ( not ( = ?auto_9681 ?auto_9678 ) ) ( not ( = ?auto_9677 ?auto_9681 ) ) ( not ( = ?auto_9680 ?auto_9681 ) ) ( ON ?auto_9678 ?auto_9677 ) ( ON-TABLE ?auto_9680 ) ( ON ?auto_9679 ?auto_9678 ) ( CLEAR ?auto_9679 ) ( HOLDING ?auto_9681 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_9681 )
      ( MAKE-2PILE ?auto_9677 ?auto_9678 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_9682 - BLOCK
      ?auto_9683 - BLOCK
    )
    :vars
    (
      ?auto_9684 - BLOCK
      ?auto_9686 - BLOCK
      ?auto_9685 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_9682 ?auto_9683 ) ) ( not ( = ?auto_9682 ?auto_9684 ) ) ( not ( = ?auto_9683 ?auto_9684 ) ) ( ON ?auto_9682 ?auto_9686 ) ( not ( = ?auto_9682 ?auto_9686 ) ) ( not ( = ?auto_9683 ?auto_9686 ) ) ( not ( = ?auto_9684 ?auto_9686 ) ) ( not ( = ?auto_9685 ?auto_9684 ) ) ( not ( = ?auto_9685 ?auto_9683 ) ) ( not ( = ?auto_9682 ?auto_9685 ) ) ( not ( = ?auto_9686 ?auto_9685 ) ) ( ON ?auto_9683 ?auto_9682 ) ( ON-TABLE ?auto_9686 ) ( ON ?auto_9684 ?auto_9683 ) ( ON ?auto_9685 ?auto_9684 ) ( CLEAR ?auto_9685 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_9686 ?auto_9682 ?auto_9683 ?auto_9684 )
      ( MAKE-2PILE ?auto_9682 ?auto_9683 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_9698 - BLOCK
    )
    :vars
    (
      ?auto_9699 - BLOCK
      ?auto_9700 - BLOCK
      ?auto_9701 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_9699 ?auto_9698 ) ( ON-TABLE ?auto_9698 ) ( not ( = ?auto_9698 ?auto_9699 ) ) ( not ( = ?auto_9698 ?auto_9700 ) ) ( not ( = ?auto_9698 ?auto_9701 ) ) ( not ( = ?auto_9699 ?auto_9700 ) ) ( not ( = ?auto_9699 ?auto_9701 ) ) ( not ( = ?auto_9700 ?auto_9701 ) ) ( ON ?auto_9700 ?auto_9699 ) ( CLEAR ?auto_9700 ) ( HOLDING ?auto_9701 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_9701 )
      ( MAKE-1PILE ?auto_9698 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_9731 - BLOCK
      ?auto_9732 - BLOCK
      ?auto_9733 - BLOCK
    )
    :vars
    (
      ?auto_9734 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_9731 ) ( not ( = ?auto_9731 ?auto_9732 ) ) ( not ( = ?auto_9731 ?auto_9733 ) ) ( not ( = ?auto_9732 ?auto_9733 ) ) ( ON ?auto_9733 ?auto_9734 ) ( not ( = ?auto_9731 ?auto_9734 ) ) ( not ( = ?auto_9732 ?auto_9734 ) ) ( not ( = ?auto_9733 ?auto_9734 ) ) ( CLEAR ?auto_9731 ) ( ON ?auto_9732 ?auto_9733 ) ( CLEAR ?auto_9732 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_9734 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_9734 ?auto_9733 )
      ( MAKE-3PILE ?auto_9731 ?auto_9732 ?auto_9733 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_9735 - BLOCK
      ?auto_9736 - BLOCK
      ?auto_9737 - BLOCK
    )
    :vars
    (
      ?auto_9738 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_9735 ?auto_9736 ) ) ( not ( = ?auto_9735 ?auto_9737 ) ) ( not ( = ?auto_9736 ?auto_9737 ) ) ( ON ?auto_9737 ?auto_9738 ) ( not ( = ?auto_9735 ?auto_9738 ) ) ( not ( = ?auto_9736 ?auto_9738 ) ) ( not ( = ?auto_9737 ?auto_9738 ) ) ( ON ?auto_9736 ?auto_9737 ) ( CLEAR ?auto_9736 ) ( ON-TABLE ?auto_9738 ) ( HOLDING ?auto_9735 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_9735 )
      ( MAKE-3PILE ?auto_9735 ?auto_9736 ?auto_9737 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_9739 - BLOCK
      ?auto_9740 - BLOCK
      ?auto_9741 - BLOCK
    )
    :vars
    (
      ?auto_9742 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_9739 ?auto_9740 ) ) ( not ( = ?auto_9739 ?auto_9741 ) ) ( not ( = ?auto_9740 ?auto_9741 ) ) ( ON ?auto_9741 ?auto_9742 ) ( not ( = ?auto_9739 ?auto_9742 ) ) ( not ( = ?auto_9740 ?auto_9742 ) ) ( not ( = ?auto_9741 ?auto_9742 ) ) ( ON ?auto_9740 ?auto_9741 ) ( ON-TABLE ?auto_9742 ) ( ON ?auto_9739 ?auto_9740 ) ( CLEAR ?auto_9739 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_9742 ?auto_9741 ?auto_9740 )
      ( MAKE-3PILE ?auto_9739 ?auto_9740 ?auto_9741 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_9746 - BLOCK
      ?auto_9747 - BLOCK
      ?auto_9748 - BLOCK
    )
    :vars
    (
      ?auto_9749 - BLOCK
      ?auto_9750 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_9746 ?auto_9747 ) ) ( not ( = ?auto_9746 ?auto_9748 ) ) ( not ( = ?auto_9747 ?auto_9748 ) ) ( ON ?auto_9748 ?auto_9749 ) ( not ( = ?auto_9746 ?auto_9749 ) ) ( not ( = ?auto_9747 ?auto_9749 ) ) ( not ( = ?auto_9748 ?auto_9749 ) ) ( ON ?auto_9747 ?auto_9748 ) ( CLEAR ?auto_9747 ) ( ON-TABLE ?auto_9749 ) ( ON ?auto_9746 ?auto_9750 ) ( CLEAR ?auto_9746 ) ( HAND-EMPTY ) ( not ( = ?auto_9746 ?auto_9750 ) ) ( not ( = ?auto_9747 ?auto_9750 ) ) ( not ( = ?auto_9748 ?auto_9750 ) ) ( not ( = ?auto_9749 ?auto_9750 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_9746 ?auto_9750 )
      ( MAKE-3PILE ?auto_9746 ?auto_9747 ?auto_9748 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_9751 - BLOCK
      ?auto_9752 - BLOCK
      ?auto_9753 - BLOCK
    )
    :vars
    (
      ?auto_9755 - BLOCK
      ?auto_9754 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_9751 ?auto_9752 ) ) ( not ( = ?auto_9751 ?auto_9753 ) ) ( not ( = ?auto_9752 ?auto_9753 ) ) ( ON ?auto_9753 ?auto_9755 ) ( not ( = ?auto_9751 ?auto_9755 ) ) ( not ( = ?auto_9752 ?auto_9755 ) ) ( not ( = ?auto_9753 ?auto_9755 ) ) ( ON-TABLE ?auto_9755 ) ( ON ?auto_9751 ?auto_9754 ) ( CLEAR ?auto_9751 ) ( not ( = ?auto_9751 ?auto_9754 ) ) ( not ( = ?auto_9752 ?auto_9754 ) ) ( not ( = ?auto_9753 ?auto_9754 ) ) ( not ( = ?auto_9755 ?auto_9754 ) ) ( HOLDING ?auto_9752 ) ( CLEAR ?auto_9753 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_9755 ?auto_9753 ?auto_9752 )
      ( MAKE-3PILE ?auto_9751 ?auto_9752 ?auto_9753 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_9756 - BLOCK
      ?auto_9757 - BLOCK
      ?auto_9758 - BLOCK
    )
    :vars
    (
      ?auto_9760 - BLOCK
      ?auto_9759 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_9756 ?auto_9757 ) ) ( not ( = ?auto_9756 ?auto_9758 ) ) ( not ( = ?auto_9757 ?auto_9758 ) ) ( ON ?auto_9758 ?auto_9760 ) ( not ( = ?auto_9756 ?auto_9760 ) ) ( not ( = ?auto_9757 ?auto_9760 ) ) ( not ( = ?auto_9758 ?auto_9760 ) ) ( ON-TABLE ?auto_9760 ) ( ON ?auto_9756 ?auto_9759 ) ( not ( = ?auto_9756 ?auto_9759 ) ) ( not ( = ?auto_9757 ?auto_9759 ) ) ( not ( = ?auto_9758 ?auto_9759 ) ) ( not ( = ?auto_9760 ?auto_9759 ) ) ( CLEAR ?auto_9758 ) ( ON ?auto_9757 ?auto_9756 ) ( CLEAR ?auto_9757 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_9759 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_9759 ?auto_9756 )
      ( MAKE-3PILE ?auto_9756 ?auto_9757 ?auto_9758 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_9761 - BLOCK
      ?auto_9762 - BLOCK
      ?auto_9763 - BLOCK
    )
    :vars
    (
      ?auto_9764 - BLOCK
      ?auto_9765 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_9761 ?auto_9762 ) ) ( not ( = ?auto_9761 ?auto_9763 ) ) ( not ( = ?auto_9762 ?auto_9763 ) ) ( not ( = ?auto_9761 ?auto_9764 ) ) ( not ( = ?auto_9762 ?auto_9764 ) ) ( not ( = ?auto_9763 ?auto_9764 ) ) ( ON-TABLE ?auto_9764 ) ( ON ?auto_9761 ?auto_9765 ) ( not ( = ?auto_9761 ?auto_9765 ) ) ( not ( = ?auto_9762 ?auto_9765 ) ) ( not ( = ?auto_9763 ?auto_9765 ) ) ( not ( = ?auto_9764 ?auto_9765 ) ) ( ON ?auto_9762 ?auto_9761 ) ( CLEAR ?auto_9762 ) ( ON-TABLE ?auto_9765 ) ( HOLDING ?auto_9763 ) ( CLEAR ?auto_9764 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_9764 ?auto_9763 )
      ( MAKE-3PILE ?auto_9761 ?auto_9762 ?auto_9763 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_9766 - BLOCK
      ?auto_9767 - BLOCK
      ?auto_9768 - BLOCK
    )
    :vars
    (
      ?auto_9769 - BLOCK
      ?auto_9770 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_9766 ?auto_9767 ) ) ( not ( = ?auto_9766 ?auto_9768 ) ) ( not ( = ?auto_9767 ?auto_9768 ) ) ( not ( = ?auto_9766 ?auto_9769 ) ) ( not ( = ?auto_9767 ?auto_9769 ) ) ( not ( = ?auto_9768 ?auto_9769 ) ) ( ON-TABLE ?auto_9769 ) ( ON ?auto_9766 ?auto_9770 ) ( not ( = ?auto_9766 ?auto_9770 ) ) ( not ( = ?auto_9767 ?auto_9770 ) ) ( not ( = ?auto_9768 ?auto_9770 ) ) ( not ( = ?auto_9769 ?auto_9770 ) ) ( ON ?auto_9767 ?auto_9766 ) ( ON-TABLE ?auto_9770 ) ( CLEAR ?auto_9769 ) ( ON ?auto_9768 ?auto_9767 ) ( CLEAR ?auto_9768 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_9770 ?auto_9766 ?auto_9767 )
      ( MAKE-3PILE ?auto_9766 ?auto_9767 ?auto_9768 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_9771 - BLOCK
      ?auto_9772 - BLOCK
      ?auto_9773 - BLOCK
    )
    :vars
    (
      ?auto_9774 - BLOCK
      ?auto_9775 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_9771 ?auto_9772 ) ) ( not ( = ?auto_9771 ?auto_9773 ) ) ( not ( = ?auto_9772 ?auto_9773 ) ) ( not ( = ?auto_9771 ?auto_9774 ) ) ( not ( = ?auto_9772 ?auto_9774 ) ) ( not ( = ?auto_9773 ?auto_9774 ) ) ( ON ?auto_9771 ?auto_9775 ) ( not ( = ?auto_9771 ?auto_9775 ) ) ( not ( = ?auto_9772 ?auto_9775 ) ) ( not ( = ?auto_9773 ?auto_9775 ) ) ( not ( = ?auto_9774 ?auto_9775 ) ) ( ON ?auto_9772 ?auto_9771 ) ( ON-TABLE ?auto_9775 ) ( ON ?auto_9773 ?auto_9772 ) ( CLEAR ?auto_9773 ) ( HOLDING ?auto_9774 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_9774 )
      ( MAKE-3PILE ?auto_9771 ?auto_9772 ?auto_9773 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_9776 - BLOCK
      ?auto_9777 - BLOCK
      ?auto_9778 - BLOCK
    )
    :vars
    (
      ?auto_9779 - BLOCK
      ?auto_9780 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_9776 ?auto_9777 ) ) ( not ( = ?auto_9776 ?auto_9778 ) ) ( not ( = ?auto_9777 ?auto_9778 ) ) ( not ( = ?auto_9776 ?auto_9779 ) ) ( not ( = ?auto_9777 ?auto_9779 ) ) ( not ( = ?auto_9778 ?auto_9779 ) ) ( ON ?auto_9776 ?auto_9780 ) ( not ( = ?auto_9776 ?auto_9780 ) ) ( not ( = ?auto_9777 ?auto_9780 ) ) ( not ( = ?auto_9778 ?auto_9780 ) ) ( not ( = ?auto_9779 ?auto_9780 ) ) ( ON ?auto_9777 ?auto_9776 ) ( ON-TABLE ?auto_9780 ) ( ON ?auto_9778 ?auto_9777 ) ( ON ?auto_9779 ?auto_9778 ) ( CLEAR ?auto_9779 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_9780 ?auto_9776 ?auto_9777 ?auto_9778 )
      ( MAKE-3PILE ?auto_9776 ?auto_9777 ?auto_9778 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_9789 - BLOCK
      ?auto_9790 - BLOCK
      ?auto_9791 - BLOCK
      ?auto_9792 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_9791 ) ( ON-TABLE ?auto_9789 ) ( ON ?auto_9790 ?auto_9789 ) ( ON ?auto_9791 ?auto_9790 ) ( not ( = ?auto_9789 ?auto_9790 ) ) ( not ( = ?auto_9789 ?auto_9791 ) ) ( not ( = ?auto_9789 ?auto_9792 ) ) ( not ( = ?auto_9790 ?auto_9791 ) ) ( not ( = ?auto_9790 ?auto_9792 ) ) ( not ( = ?auto_9791 ?auto_9792 ) ) ( ON-TABLE ?auto_9792 ) ( CLEAR ?auto_9792 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_9792 )
      ( MAKE-4PILE ?auto_9789 ?auto_9790 ?auto_9791 ?auto_9792 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_9793 - BLOCK
      ?auto_9794 - BLOCK
      ?auto_9795 - BLOCK
      ?auto_9796 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_9793 ) ( ON ?auto_9794 ?auto_9793 ) ( not ( = ?auto_9793 ?auto_9794 ) ) ( not ( = ?auto_9793 ?auto_9795 ) ) ( not ( = ?auto_9793 ?auto_9796 ) ) ( not ( = ?auto_9794 ?auto_9795 ) ) ( not ( = ?auto_9794 ?auto_9796 ) ) ( not ( = ?auto_9795 ?auto_9796 ) ) ( ON-TABLE ?auto_9796 ) ( CLEAR ?auto_9796 ) ( HOLDING ?auto_9795 ) ( CLEAR ?auto_9794 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_9793 ?auto_9794 ?auto_9795 )
      ( MAKE-4PILE ?auto_9793 ?auto_9794 ?auto_9795 ?auto_9796 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_9797 - BLOCK
      ?auto_9798 - BLOCK
      ?auto_9799 - BLOCK
      ?auto_9800 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_9797 ) ( ON ?auto_9798 ?auto_9797 ) ( not ( = ?auto_9797 ?auto_9798 ) ) ( not ( = ?auto_9797 ?auto_9799 ) ) ( not ( = ?auto_9797 ?auto_9800 ) ) ( not ( = ?auto_9798 ?auto_9799 ) ) ( not ( = ?auto_9798 ?auto_9800 ) ) ( not ( = ?auto_9799 ?auto_9800 ) ) ( ON-TABLE ?auto_9800 ) ( CLEAR ?auto_9798 ) ( ON ?auto_9799 ?auto_9800 ) ( CLEAR ?auto_9799 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_9800 )
      ( MAKE-4PILE ?auto_9797 ?auto_9798 ?auto_9799 ?auto_9800 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_9801 - BLOCK
      ?auto_9802 - BLOCK
      ?auto_9803 - BLOCK
      ?auto_9804 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_9801 ) ( not ( = ?auto_9801 ?auto_9802 ) ) ( not ( = ?auto_9801 ?auto_9803 ) ) ( not ( = ?auto_9801 ?auto_9804 ) ) ( not ( = ?auto_9802 ?auto_9803 ) ) ( not ( = ?auto_9802 ?auto_9804 ) ) ( not ( = ?auto_9803 ?auto_9804 ) ) ( ON-TABLE ?auto_9804 ) ( ON ?auto_9803 ?auto_9804 ) ( CLEAR ?auto_9803 ) ( HOLDING ?auto_9802 ) ( CLEAR ?auto_9801 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_9801 ?auto_9802 )
      ( MAKE-4PILE ?auto_9801 ?auto_9802 ?auto_9803 ?auto_9804 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_9805 - BLOCK
      ?auto_9806 - BLOCK
      ?auto_9807 - BLOCK
      ?auto_9808 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_9805 ) ( not ( = ?auto_9805 ?auto_9806 ) ) ( not ( = ?auto_9805 ?auto_9807 ) ) ( not ( = ?auto_9805 ?auto_9808 ) ) ( not ( = ?auto_9806 ?auto_9807 ) ) ( not ( = ?auto_9806 ?auto_9808 ) ) ( not ( = ?auto_9807 ?auto_9808 ) ) ( ON-TABLE ?auto_9808 ) ( ON ?auto_9807 ?auto_9808 ) ( CLEAR ?auto_9805 ) ( ON ?auto_9806 ?auto_9807 ) ( CLEAR ?auto_9806 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_9808 ?auto_9807 )
      ( MAKE-4PILE ?auto_9805 ?auto_9806 ?auto_9807 ?auto_9808 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_9809 - BLOCK
      ?auto_9810 - BLOCK
      ?auto_9811 - BLOCK
      ?auto_9812 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_9809 ?auto_9810 ) ) ( not ( = ?auto_9809 ?auto_9811 ) ) ( not ( = ?auto_9809 ?auto_9812 ) ) ( not ( = ?auto_9810 ?auto_9811 ) ) ( not ( = ?auto_9810 ?auto_9812 ) ) ( not ( = ?auto_9811 ?auto_9812 ) ) ( ON-TABLE ?auto_9812 ) ( ON ?auto_9811 ?auto_9812 ) ( ON ?auto_9810 ?auto_9811 ) ( CLEAR ?auto_9810 ) ( HOLDING ?auto_9809 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_9809 )
      ( MAKE-4PILE ?auto_9809 ?auto_9810 ?auto_9811 ?auto_9812 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_9813 - BLOCK
      ?auto_9814 - BLOCK
      ?auto_9815 - BLOCK
      ?auto_9816 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_9813 ?auto_9814 ) ) ( not ( = ?auto_9813 ?auto_9815 ) ) ( not ( = ?auto_9813 ?auto_9816 ) ) ( not ( = ?auto_9814 ?auto_9815 ) ) ( not ( = ?auto_9814 ?auto_9816 ) ) ( not ( = ?auto_9815 ?auto_9816 ) ) ( ON-TABLE ?auto_9816 ) ( ON ?auto_9815 ?auto_9816 ) ( ON ?auto_9814 ?auto_9815 ) ( ON ?auto_9813 ?auto_9814 ) ( CLEAR ?auto_9813 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_9816 ?auto_9815 ?auto_9814 )
      ( MAKE-4PILE ?auto_9813 ?auto_9814 ?auto_9815 ?auto_9816 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_9821 - BLOCK
      ?auto_9822 - BLOCK
      ?auto_9823 - BLOCK
      ?auto_9824 - BLOCK
    )
    :vars
    (
      ?auto_9825 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_9821 ?auto_9822 ) ) ( not ( = ?auto_9821 ?auto_9823 ) ) ( not ( = ?auto_9821 ?auto_9824 ) ) ( not ( = ?auto_9822 ?auto_9823 ) ) ( not ( = ?auto_9822 ?auto_9824 ) ) ( not ( = ?auto_9823 ?auto_9824 ) ) ( ON-TABLE ?auto_9824 ) ( ON ?auto_9823 ?auto_9824 ) ( ON ?auto_9822 ?auto_9823 ) ( CLEAR ?auto_9822 ) ( ON ?auto_9821 ?auto_9825 ) ( CLEAR ?auto_9821 ) ( HAND-EMPTY ) ( not ( = ?auto_9821 ?auto_9825 ) ) ( not ( = ?auto_9822 ?auto_9825 ) ) ( not ( = ?auto_9823 ?auto_9825 ) ) ( not ( = ?auto_9824 ?auto_9825 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_9821 ?auto_9825 )
      ( MAKE-4PILE ?auto_9821 ?auto_9822 ?auto_9823 ?auto_9824 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_9826 - BLOCK
      ?auto_9827 - BLOCK
      ?auto_9828 - BLOCK
      ?auto_9829 - BLOCK
    )
    :vars
    (
      ?auto_9830 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_9826 ?auto_9827 ) ) ( not ( = ?auto_9826 ?auto_9828 ) ) ( not ( = ?auto_9826 ?auto_9829 ) ) ( not ( = ?auto_9827 ?auto_9828 ) ) ( not ( = ?auto_9827 ?auto_9829 ) ) ( not ( = ?auto_9828 ?auto_9829 ) ) ( ON-TABLE ?auto_9829 ) ( ON ?auto_9828 ?auto_9829 ) ( ON ?auto_9826 ?auto_9830 ) ( CLEAR ?auto_9826 ) ( not ( = ?auto_9826 ?auto_9830 ) ) ( not ( = ?auto_9827 ?auto_9830 ) ) ( not ( = ?auto_9828 ?auto_9830 ) ) ( not ( = ?auto_9829 ?auto_9830 ) ) ( HOLDING ?auto_9827 ) ( CLEAR ?auto_9828 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_9829 ?auto_9828 ?auto_9827 )
      ( MAKE-4PILE ?auto_9826 ?auto_9827 ?auto_9828 ?auto_9829 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_9831 - BLOCK
      ?auto_9832 - BLOCK
      ?auto_9833 - BLOCK
      ?auto_9834 - BLOCK
    )
    :vars
    (
      ?auto_9835 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_9831 ?auto_9832 ) ) ( not ( = ?auto_9831 ?auto_9833 ) ) ( not ( = ?auto_9831 ?auto_9834 ) ) ( not ( = ?auto_9832 ?auto_9833 ) ) ( not ( = ?auto_9832 ?auto_9834 ) ) ( not ( = ?auto_9833 ?auto_9834 ) ) ( ON-TABLE ?auto_9834 ) ( ON ?auto_9833 ?auto_9834 ) ( ON ?auto_9831 ?auto_9835 ) ( not ( = ?auto_9831 ?auto_9835 ) ) ( not ( = ?auto_9832 ?auto_9835 ) ) ( not ( = ?auto_9833 ?auto_9835 ) ) ( not ( = ?auto_9834 ?auto_9835 ) ) ( CLEAR ?auto_9833 ) ( ON ?auto_9832 ?auto_9831 ) ( CLEAR ?auto_9832 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_9835 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_9835 ?auto_9831 )
      ( MAKE-4PILE ?auto_9831 ?auto_9832 ?auto_9833 ?auto_9834 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_9836 - BLOCK
      ?auto_9837 - BLOCK
      ?auto_9838 - BLOCK
      ?auto_9839 - BLOCK
    )
    :vars
    (
      ?auto_9840 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_9836 ?auto_9837 ) ) ( not ( = ?auto_9836 ?auto_9838 ) ) ( not ( = ?auto_9836 ?auto_9839 ) ) ( not ( = ?auto_9837 ?auto_9838 ) ) ( not ( = ?auto_9837 ?auto_9839 ) ) ( not ( = ?auto_9838 ?auto_9839 ) ) ( ON-TABLE ?auto_9839 ) ( ON ?auto_9836 ?auto_9840 ) ( not ( = ?auto_9836 ?auto_9840 ) ) ( not ( = ?auto_9837 ?auto_9840 ) ) ( not ( = ?auto_9838 ?auto_9840 ) ) ( not ( = ?auto_9839 ?auto_9840 ) ) ( ON ?auto_9837 ?auto_9836 ) ( CLEAR ?auto_9837 ) ( ON-TABLE ?auto_9840 ) ( HOLDING ?auto_9838 ) ( CLEAR ?auto_9839 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_9839 ?auto_9838 )
      ( MAKE-4PILE ?auto_9836 ?auto_9837 ?auto_9838 ?auto_9839 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_9841 - BLOCK
      ?auto_9842 - BLOCK
      ?auto_9843 - BLOCK
      ?auto_9844 - BLOCK
    )
    :vars
    (
      ?auto_9845 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_9841 ?auto_9842 ) ) ( not ( = ?auto_9841 ?auto_9843 ) ) ( not ( = ?auto_9841 ?auto_9844 ) ) ( not ( = ?auto_9842 ?auto_9843 ) ) ( not ( = ?auto_9842 ?auto_9844 ) ) ( not ( = ?auto_9843 ?auto_9844 ) ) ( ON-TABLE ?auto_9844 ) ( ON ?auto_9841 ?auto_9845 ) ( not ( = ?auto_9841 ?auto_9845 ) ) ( not ( = ?auto_9842 ?auto_9845 ) ) ( not ( = ?auto_9843 ?auto_9845 ) ) ( not ( = ?auto_9844 ?auto_9845 ) ) ( ON ?auto_9842 ?auto_9841 ) ( ON-TABLE ?auto_9845 ) ( CLEAR ?auto_9844 ) ( ON ?auto_9843 ?auto_9842 ) ( CLEAR ?auto_9843 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_9845 ?auto_9841 ?auto_9842 )
      ( MAKE-4PILE ?auto_9841 ?auto_9842 ?auto_9843 ?auto_9844 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_9846 - BLOCK
      ?auto_9847 - BLOCK
      ?auto_9848 - BLOCK
      ?auto_9849 - BLOCK
    )
    :vars
    (
      ?auto_9850 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_9846 ?auto_9847 ) ) ( not ( = ?auto_9846 ?auto_9848 ) ) ( not ( = ?auto_9846 ?auto_9849 ) ) ( not ( = ?auto_9847 ?auto_9848 ) ) ( not ( = ?auto_9847 ?auto_9849 ) ) ( not ( = ?auto_9848 ?auto_9849 ) ) ( ON ?auto_9846 ?auto_9850 ) ( not ( = ?auto_9846 ?auto_9850 ) ) ( not ( = ?auto_9847 ?auto_9850 ) ) ( not ( = ?auto_9848 ?auto_9850 ) ) ( not ( = ?auto_9849 ?auto_9850 ) ) ( ON ?auto_9847 ?auto_9846 ) ( ON-TABLE ?auto_9850 ) ( ON ?auto_9848 ?auto_9847 ) ( CLEAR ?auto_9848 ) ( HOLDING ?auto_9849 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_9849 )
      ( MAKE-4PILE ?auto_9846 ?auto_9847 ?auto_9848 ?auto_9849 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_9851 - BLOCK
      ?auto_9852 - BLOCK
      ?auto_9853 - BLOCK
      ?auto_9854 - BLOCK
    )
    :vars
    (
      ?auto_9855 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_9851 ?auto_9852 ) ) ( not ( = ?auto_9851 ?auto_9853 ) ) ( not ( = ?auto_9851 ?auto_9854 ) ) ( not ( = ?auto_9852 ?auto_9853 ) ) ( not ( = ?auto_9852 ?auto_9854 ) ) ( not ( = ?auto_9853 ?auto_9854 ) ) ( ON ?auto_9851 ?auto_9855 ) ( not ( = ?auto_9851 ?auto_9855 ) ) ( not ( = ?auto_9852 ?auto_9855 ) ) ( not ( = ?auto_9853 ?auto_9855 ) ) ( not ( = ?auto_9854 ?auto_9855 ) ) ( ON ?auto_9852 ?auto_9851 ) ( ON-TABLE ?auto_9855 ) ( ON ?auto_9853 ?auto_9852 ) ( ON ?auto_9854 ?auto_9853 ) ( CLEAR ?auto_9854 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_9855 ?auto_9851 ?auto_9852 ?auto_9853 )
      ( MAKE-4PILE ?auto_9851 ?auto_9852 ?auto_9853 ?auto_9854 ) )
  )

)

