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
      ?auto_17359 - BLOCK
      ?auto_17360 - BLOCK
      ?auto_17361 - BLOCK
      ?auto_17362 - BLOCK
    )
    :vars
    (
      ?auto_17363 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_17363 ?auto_17362 ) ( CLEAR ?auto_17363 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_17359 ) ( ON ?auto_17360 ?auto_17359 ) ( ON ?auto_17361 ?auto_17360 ) ( ON ?auto_17362 ?auto_17361 ) ( not ( = ?auto_17359 ?auto_17360 ) ) ( not ( = ?auto_17359 ?auto_17361 ) ) ( not ( = ?auto_17359 ?auto_17362 ) ) ( not ( = ?auto_17359 ?auto_17363 ) ) ( not ( = ?auto_17360 ?auto_17361 ) ) ( not ( = ?auto_17360 ?auto_17362 ) ) ( not ( = ?auto_17360 ?auto_17363 ) ) ( not ( = ?auto_17361 ?auto_17362 ) ) ( not ( = ?auto_17361 ?auto_17363 ) ) ( not ( = ?auto_17362 ?auto_17363 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_17363 ?auto_17362 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_17365 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_17365 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_17365 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_17366 - BLOCK
    )
    :vars
    (
      ?auto_17367 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_17366 ?auto_17367 ) ( CLEAR ?auto_17366 ) ( HAND-EMPTY ) ( not ( = ?auto_17366 ?auto_17367 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_17366 ?auto_17367 )
      ( MAKE-1PILE ?auto_17366 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_17371 - BLOCK
      ?auto_17372 - BLOCK
      ?auto_17373 - BLOCK
    )
    :vars
    (
      ?auto_17374 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_17374 ?auto_17373 ) ( CLEAR ?auto_17374 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_17371 ) ( ON ?auto_17372 ?auto_17371 ) ( ON ?auto_17373 ?auto_17372 ) ( not ( = ?auto_17371 ?auto_17372 ) ) ( not ( = ?auto_17371 ?auto_17373 ) ) ( not ( = ?auto_17371 ?auto_17374 ) ) ( not ( = ?auto_17372 ?auto_17373 ) ) ( not ( = ?auto_17372 ?auto_17374 ) ) ( not ( = ?auto_17373 ?auto_17374 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_17374 ?auto_17373 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_17375 - BLOCK
      ?auto_17376 - BLOCK
      ?auto_17377 - BLOCK
    )
    :vars
    (
      ?auto_17378 - BLOCK
      ?auto_17379 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_17378 ?auto_17377 ) ( CLEAR ?auto_17378 ) ( ON-TABLE ?auto_17375 ) ( ON ?auto_17376 ?auto_17375 ) ( ON ?auto_17377 ?auto_17376 ) ( not ( = ?auto_17375 ?auto_17376 ) ) ( not ( = ?auto_17375 ?auto_17377 ) ) ( not ( = ?auto_17375 ?auto_17378 ) ) ( not ( = ?auto_17376 ?auto_17377 ) ) ( not ( = ?auto_17376 ?auto_17378 ) ) ( not ( = ?auto_17377 ?auto_17378 ) ) ( HOLDING ?auto_17379 ) ( not ( = ?auto_17375 ?auto_17379 ) ) ( not ( = ?auto_17376 ?auto_17379 ) ) ( not ( = ?auto_17377 ?auto_17379 ) ) ( not ( = ?auto_17378 ?auto_17379 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_17379 )
      ( MAKE-3PILE ?auto_17375 ?auto_17376 ?auto_17377 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_17380 - BLOCK
      ?auto_17381 - BLOCK
      ?auto_17382 - BLOCK
    )
    :vars
    (
      ?auto_17383 - BLOCK
      ?auto_17384 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_17383 ?auto_17382 ) ( ON-TABLE ?auto_17380 ) ( ON ?auto_17381 ?auto_17380 ) ( ON ?auto_17382 ?auto_17381 ) ( not ( = ?auto_17380 ?auto_17381 ) ) ( not ( = ?auto_17380 ?auto_17382 ) ) ( not ( = ?auto_17380 ?auto_17383 ) ) ( not ( = ?auto_17381 ?auto_17382 ) ) ( not ( = ?auto_17381 ?auto_17383 ) ) ( not ( = ?auto_17382 ?auto_17383 ) ) ( not ( = ?auto_17380 ?auto_17384 ) ) ( not ( = ?auto_17381 ?auto_17384 ) ) ( not ( = ?auto_17382 ?auto_17384 ) ) ( not ( = ?auto_17383 ?auto_17384 ) ) ( ON ?auto_17384 ?auto_17383 ) ( CLEAR ?auto_17384 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_17380 ?auto_17381 ?auto_17382 ?auto_17383 )
      ( MAKE-3PILE ?auto_17380 ?auto_17381 ?auto_17382 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_17387 - BLOCK
      ?auto_17388 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_17388 ) ( CLEAR ?auto_17387 ) ( ON-TABLE ?auto_17387 ) ( not ( = ?auto_17387 ?auto_17388 ) ) )
    :subtasks
    ( ( !STACK ?auto_17388 ?auto_17387 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_17389 - BLOCK
      ?auto_17390 - BLOCK
    )
    :vars
    (
      ?auto_17391 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_17389 ) ( ON-TABLE ?auto_17389 ) ( not ( = ?auto_17389 ?auto_17390 ) ) ( ON ?auto_17390 ?auto_17391 ) ( CLEAR ?auto_17390 ) ( HAND-EMPTY ) ( not ( = ?auto_17389 ?auto_17391 ) ) ( not ( = ?auto_17390 ?auto_17391 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_17390 ?auto_17391 )
      ( MAKE-2PILE ?auto_17389 ?auto_17390 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_17392 - BLOCK
      ?auto_17393 - BLOCK
    )
    :vars
    (
      ?auto_17394 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_17392 ?auto_17393 ) ) ( ON ?auto_17393 ?auto_17394 ) ( CLEAR ?auto_17393 ) ( not ( = ?auto_17392 ?auto_17394 ) ) ( not ( = ?auto_17393 ?auto_17394 ) ) ( HOLDING ?auto_17392 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_17392 )
      ( MAKE-2PILE ?auto_17392 ?auto_17393 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_17395 - BLOCK
      ?auto_17396 - BLOCK
    )
    :vars
    (
      ?auto_17397 - BLOCK
      ?auto_17398 - BLOCK
      ?auto_17399 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_17395 ?auto_17396 ) ) ( ON ?auto_17396 ?auto_17397 ) ( not ( = ?auto_17395 ?auto_17397 ) ) ( not ( = ?auto_17396 ?auto_17397 ) ) ( ON ?auto_17395 ?auto_17396 ) ( CLEAR ?auto_17395 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_17398 ) ( ON ?auto_17399 ?auto_17398 ) ( ON ?auto_17397 ?auto_17399 ) ( not ( = ?auto_17398 ?auto_17399 ) ) ( not ( = ?auto_17398 ?auto_17397 ) ) ( not ( = ?auto_17398 ?auto_17396 ) ) ( not ( = ?auto_17398 ?auto_17395 ) ) ( not ( = ?auto_17399 ?auto_17397 ) ) ( not ( = ?auto_17399 ?auto_17396 ) ) ( not ( = ?auto_17399 ?auto_17395 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_17398 ?auto_17399 ?auto_17397 ?auto_17396 )
      ( MAKE-2PILE ?auto_17395 ?auto_17396 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_17402 - BLOCK
      ?auto_17403 - BLOCK
    )
    :vars
    (
      ?auto_17404 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_17404 ?auto_17403 ) ( CLEAR ?auto_17404 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_17402 ) ( ON ?auto_17403 ?auto_17402 ) ( not ( = ?auto_17402 ?auto_17403 ) ) ( not ( = ?auto_17402 ?auto_17404 ) ) ( not ( = ?auto_17403 ?auto_17404 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_17404 ?auto_17403 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_17405 - BLOCK
      ?auto_17406 - BLOCK
    )
    :vars
    (
      ?auto_17407 - BLOCK
      ?auto_17408 - BLOCK
      ?auto_17409 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_17407 ?auto_17406 ) ( CLEAR ?auto_17407 ) ( ON-TABLE ?auto_17405 ) ( ON ?auto_17406 ?auto_17405 ) ( not ( = ?auto_17405 ?auto_17406 ) ) ( not ( = ?auto_17405 ?auto_17407 ) ) ( not ( = ?auto_17406 ?auto_17407 ) ) ( HOLDING ?auto_17408 ) ( CLEAR ?auto_17409 ) ( not ( = ?auto_17405 ?auto_17408 ) ) ( not ( = ?auto_17405 ?auto_17409 ) ) ( not ( = ?auto_17406 ?auto_17408 ) ) ( not ( = ?auto_17406 ?auto_17409 ) ) ( not ( = ?auto_17407 ?auto_17408 ) ) ( not ( = ?auto_17407 ?auto_17409 ) ) ( not ( = ?auto_17408 ?auto_17409 ) ) )
    :subtasks
    ( ( !STACK ?auto_17408 ?auto_17409 )
      ( MAKE-2PILE ?auto_17405 ?auto_17406 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_17410 - BLOCK
      ?auto_17411 - BLOCK
    )
    :vars
    (
      ?auto_17412 - BLOCK
      ?auto_17414 - BLOCK
      ?auto_17413 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_17412 ?auto_17411 ) ( ON-TABLE ?auto_17410 ) ( ON ?auto_17411 ?auto_17410 ) ( not ( = ?auto_17410 ?auto_17411 ) ) ( not ( = ?auto_17410 ?auto_17412 ) ) ( not ( = ?auto_17411 ?auto_17412 ) ) ( CLEAR ?auto_17414 ) ( not ( = ?auto_17410 ?auto_17413 ) ) ( not ( = ?auto_17410 ?auto_17414 ) ) ( not ( = ?auto_17411 ?auto_17413 ) ) ( not ( = ?auto_17411 ?auto_17414 ) ) ( not ( = ?auto_17412 ?auto_17413 ) ) ( not ( = ?auto_17412 ?auto_17414 ) ) ( not ( = ?auto_17413 ?auto_17414 ) ) ( ON ?auto_17413 ?auto_17412 ) ( CLEAR ?auto_17413 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_17410 ?auto_17411 ?auto_17412 )
      ( MAKE-2PILE ?auto_17410 ?auto_17411 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_17415 - BLOCK
      ?auto_17416 - BLOCK
    )
    :vars
    (
      ?auto_17418 - BLOCK
      ?auto_17419 - BLOCK
      ?auto_17417 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_17418 ?auto_17416 ) ( ON-TABLE ?auto_17415 ) ( ON ?auto_17416 ?auto_17415 ) ( not ( = ?auto_17415 ?auto_17416 ) ) ( not ( = ?auto_17415 ?auto_17418 ) ) ( not ( = ?auto_17416 ?auto_17418 ) ) ( not ( = ?auto_17415 ?auto_17419 ) ) ( not ( = ?auto_17415 ?auto_17417 ) ) ( not ( = ?auto_17416 ?auto_17419 ) ) ( not ( = ?auto_17416 ?auto_17417 ) ) ( not ( = ?auto_17418 ?auto_17419 ) ) ( not ( = ?auto_17418 ?auto_17417 ) ) ( not ( = ?auto_17419 ?auto_17417 ) ) ( ON ?auto_17419 ?auto_17418 ) ( CLEAR ?auto_17419 ) ( HOLDING ?auto_17417 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_17417 )
      ( MAKE-2PILE ?auto_17415 ?auto_17416 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_17420 - BLOCK
      ?auto_17421 - BLOCK
    )
    :vars
    (
      ?auto_17422 - BLOCK
      ?auto_17423 - BLOCK
      ?auto_17424 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_17422 ?auto_17421 ) ( ON-TABLE ?auto_17420 ) ( ON ?auto_17421 ?auto_17420 ) ( not ( = ?auto_17420 ?auto_17421 ) ) ( not ( = ?auto_17420 ?auto_17422 ) ) ( not ( = ?auto_17421 ?auto_17422 ) ) ( not ( = ?auto_17420 ?auto_17423 ) ) ( not ( = ?auto_17420 ?auto_17424 ) ) ( not ( = ?auto_17421 ?auto_17423 ) ) ( not ( = ?auto_17421 ?auto_17424 ) ) ( not ( = ?auto_17422 ?auto_17423 ) ) ( not ( = ?auto_17422 ?auto_17424 ) ) ( not ( = ?auto_17423 ?auto_17424 ) ) ( ON ?auto_17423 ?auto_17422 ) ( ON ?auto_17424 ?auto_17423 ) ( CLEAR ?auto_17424 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_17420 ?auto_17421 ?auto_17422 ?auto_17423 )
      ( MAKE-2PILE ?auto_17420 ?auto_17421 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_17428 - BLOCK
      ?auto_17429 - BLOCK
      ?auto_17430 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_17430 ) ( CLEAR ?auto_17429 ) ( ON-TABLE ?auto_17428 ) ( ON ?auto_17429 ?auto_17428 ) ( not ( = ?auto_17428 ?auto_17429 ) ) ( not ( = ?auto_17428 ?auto_17430 ) ) ( not ( = ?auto_17429 ?auto_17430 ) ) )
    :subtasks
    ( ( !STACK ?auto_17430 ?auto_17429 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_17431 - BLOCK
      ?auto_17432 - BLOCK
      ?auto_17433 - BLOCK
    )
    :vars
    (
      ?auto_17434 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_17432 ) ( ON-TABLE ?auto_17431 ) ( ON ?auto_17432 ?auto_17431 ) ( not ( = ?auto_17431 ?auto_17432 ) ) ( not ( = ?auto_17431 ?auto_17433 ) ) ( not ( = ?auto_17432 ?auto_17433 ) ) ( ON ?auto_17433 ?auto_17434 ) ( CLEAR ?auto_17433 ) ( HAND-EMPTY ) ( not ( = ?auto_17431 ?auto_17434 ) ) ( not ( = ?auto_17432 ?auto_17434 ) ) ( not ( = ?auto_17433 ?auto_17434 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_17433 ?auto_17434 )
      ( MAKE-3PILE ?auto_17431 ?auto_17432 ?auto_17433 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_17435 - BLOCK
      ?auto_17436 - BLOCK
      ?auto_17437 - BLOCK
    )
    :vars
    (
      ?auto_17438 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_17435 ) ( not ( = ?auto_17435 ?auto_17436 ) ) ( not ( = ?auto_17435 ?auto_17437 ) ) ( not ( = ?auto_17436 ?auto_17437 ) ) ( ON ?auto_17437 ?auto_17438 ) ( CLEAR ?auto_17437 ) ( not ( = ?auto_17435 ?auto_17438 ) ) ( not ( = ?auto_17436 ?auto_17438 ) ) ( not ( = ?auto_17437 ?auto_17438 ) ) ( HOLDING ?auto_17436 ) ( CLEAR ?auto_17435 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_17435 ?auto_17436 )
      ( MAKE-3PILE ?auto_17435 ?auto_17436 ?auto_17437 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_17439 - BLOCK
      ?auto_17440 - BLOCK
      ?auto_17441 - BLOCK
    )
    :vars
    (
      ?auto_17442 - BLOCK
      ?auto_17443 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_17439 ) ( not ( = ?auto_17439 ?auto_17440 ) ) ( not ( = ?auto_17439 ?auto_17441 ) ) ( not ( = ?auto_17440 ?auto_17441 ) ) ( ON ?auto_17441 ?auto_17442 ) ( not ( = ?auto_17439 ?auto_17442 ) ) ( not ( = ?auto_17440 ?auto_17442 ) ) ( not ( = ?auto_17441 ?auto_17442 ) ) ( CLEAR ?auto_17439 ) ( ON ?auto_17440 ?auto_17441 ) ( CLEAR ?auto_17440 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_17443 ) ( ON ?auto_17442 ?auto_17443 ) ( not ( = ?auto_17443 ?auto_17442 ) ) ( not ( = ?auto_17443 ?auto_17441 ) ) ( not ( = ?auto_17443 ?auto_17440 ) ) ( not ( = ?auto_17439 ?auto_17443 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_17443 ?auto_17442 ?auto_17441 )
      ( MAKE-3PILE ?auto_17439 ?auto_17440 ?auto_17441 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_17444 - BLOCK
      ?auto_17445 - BLOCK
      ?auto_17446 - BLOCK
    )
    :vars
    (
      ?auto_17447 - BLOCK
      ?auto_17448 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_17444 ?auto_17445 ) ) ( not ( = ?auto_17444 ?auto_17446 ) ) ( not ( = ?auto_17445 ?auto_17446 ) ) ( ON ?auto_17446 ?auto_17447 ) ( not ( = ?auto_17444 ?auto_17447 ) ) ( not ( = ?auto_17445 ?auto_17447 ) ) ( not ( = ?auto_17446 ?auto_17447 ) ) ( ON ?auto_17445 ?auto_17446 ) ( CLEAR ?auto_17445 ) ( ON-TABLE ?auto_17448 ) ( ON ?auto_17447 ?auto_17448 ) ( not ( = ?auto_17448 ?auto_17447 ) ) ( not ( = ?auto_17448 ?auto_17446 ) ) ( not ( = ?auto_17448 ?auto_17445 ) ) ( not ( = ?auto_17444 ?auto_17448 ) ) ( HOLDING ?auto_17444 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_17444 )
      ( MAKE-3PILE ?auto_17444 ?auto_17445 ?auto_17446 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_17449 - BLOCK
      ?auto_17450 - BLOCK
      ?auto_17451 - BLOCK
    )
    :vars
    (
      ?auto_17452 - BLOCK
      ?auto_17453 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_17449 ?auto_17450 ) ) ( not ( = ?auto_17449 ?auto_17451 ) ) ( not ( = ?auto_17450 ?auto_17451 ) ) ( ON ?auto_17451 ?auto_17452 ) ( not ( = ?auto_17449 ?auto_17452 ) ) ( not ( = ?auto_17450 ?auto_17452 ) ) ( not ( = ?auto_17451 ?auto_17452 ) ) ( ON ?auto_17450 ?auto_17451 ) ( ON-TABLE ?auto_17453 ) ( ON ?auto_17452 ?auto_17453 ) ( not ( = ?auto_17453 ?auto_17452 ) ) ( not ( = ?auto_17453 ?auto_17451 ) ) ( not ( = ?auto_17453 ?auto_17450 ) ) ( not ( = ?auto_17449 ?auto_17453 ) ) ( ON ?auto_17449 ?auto_17450 ) ( CLEAR ?auto_17449 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_17453 ?auto_17452 ?auto_17451 ?auto_17450 )
      ( MAKE-3PILE ?auto_17449 ?auto_17450 ?auto_17451 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_17455 - BLOCK
    )
    :vars
    (
      ?auto_17456 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_17456 ?auto_17455 ) ( CLEAR ?auto_17456 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_17455 ) ( not ( = ?auto_17455 ?auto_17456 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_17456 ?auto_17455 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_17457 - BLOCK
    )
    :vars
    (
      ?auto_17458 - BLOCK
      ?auto_17459 - BLOCK
      ?auto_17460 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_17458 ?auto_17457 ) ( CLEAR ?auto_17458 ) ( ON-TABLE ?auto_17457 ) ( not ( = ?auto_17457 ?auto_17458 ) ) ( HOLDING ?auto_17459 ) ( CLEAR ?auto_17460 ) ( not ( = ?auto_17457 ?auto_17459 ) ) ( not ( = ?auto_17457 ?auto_17460 ) ) ( not ( = ?auto_17458 ?auto_17459 ) ) ( not ( = ?auto_17458 ?auto_17460 ) ) ( not ( = ?auto_17459 ?auto_17460 ) ) )
    :subtasks
    ( ( !STACK ?auto_17459 ?auto_17460 )
      ( MAKE-1PILE ?auto_17457 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_17461 - BLOCK
    )
    :vars
    (
      ?auto_17464 - BLOCK
      ?auto_17462 - BLOCK
      ?auto_17463 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_17464 ?auto_17461 ) ( ON-TABLE ?auto_17461 ) ( not ( = ?auto_17461 ?auto_17464 ) ) ( CLEAR ?auto_17462 ) ( not ( = ?auto_17461 ?auto_17463 ) ) ( not ( = ?auto_17461 ?auto_17462 ) ) ( not ( = ?auto_17464 ?auto_17463 ) ) ( not ( = ?auto_17464 ?auto_17462 ) ) ( not ( = ?auto_17463 ?auto_17462 ) ) ( ON ?auto_17463 ?auto_17464 ) ( CLEAR ?auto_17463 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_17461 ?auto_17464 )
      ( MAKE-1PILE ?auto_17461 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_17465 - BLOCK
    )
    :vars
    (
      ?auto_17467 - BLOCK
      ?auto_17466 - BLOCK
      ?auto_17468 - BLOCK
      ?auto_17469 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_17467 ?auto_17465 ) ( ON-TABLE ?auto_17465 ) ( not ( = ?auto_17465 ?auto_17467 ) ) ( not ( = ?auto_17465 ?auto_17466 ) ) ( not ( = ?auto_17465 ?auto_17468 ) ) ( not ( = ?auto_17467 ?auto_17466 ) ) ( not ( = ?auto_17467 ?auto_17468 ) ) ( not ( = ?auto_17466 ?auto_17468 ) ) ( ON ?auto_17466 ?auto_17467 ) ( CLEAR ?auto_17466 ) ( HOLDING ?auto_17468 ) ( CLEAR ?auto_17469 ) ( ON-TABLE ?auto_17469 ) ( not ( = ?auto_17469 ?auto_17468 ) ) ( not ( = ?auto_17465 ?auto_17469 ) ) ( not ( = ?auto_17467 ?auto_17469 ) ) ( not ( = ?auto_17466 ?auto_17469 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_17469 ?auto_17468 )
      ( MAKE-1PILE ?auto_17465 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_17470 - BLOCK
    )
    :vars
    (
      ?auto_17474 - BLOCK
      ?auto_17471 - BLOCK
      ?auto_17473 - BLOCK
      ?auto_17472 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_17474 ?auto_17470 ) ( ON-TABLE ?auto_17470 ) ( not ( = ?auto_17470 ?auto_17474 ) ) ( not ( = ?auto_17470 ?auto_17471 ) ) ( not ( = ?auto_17470 ?auto_17473 ) ) ( not ( = ?auto_17474 ?auto_17471 ) ) ( not ( = ?auto_17474 ?auto_17473 ) ) ( not ( = ?auto_17471 ?auto_17473 ) ) ( ON ?auto_17471 ?auto_17474 ) ( CLEAR ?auto_17472 ) ( ON-TABLE ?auto_17472 ) ( not ( = ?auto_17472 ?auto_17473 ) ) ( not ( = ?auto_17470 ?auto_17472 ) ) ( not ( = ?auto_17474 ?auto_17472 ) ) ( not ( = ?auto_17471 ?auto_17472 ) ) ( ON ?auto_17473 ?auto_17471 ) ( CLEAR ?auto_17473 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_17470 ?auto_17474 ?auto_17471 )
      ( MAKE-1PILE ?auto_17470 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_17475 - BLOCK
    )
    :vars
    (
      ?auto_17476 - BLOCK
      ?auto_17479 - BLOCK
      ?auto_17477 - BLOCK
      ?auto_17478 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_17476 ?auto_17475 ) ( ON-TABLE ?auto_17475 ) ( not ( = ?auto_17475 ?auto_17476 ) ) ( not ( = ?auto_17475 ?auto_17479 ) ) ( not ( = ?auto_17475 ?auto_17477 ) ) ( not ( = ?auto_17476 ?auto_17479 ) ) ( not ( = ?auto_17476 ?auto_17477 ) ) ( not ( = ?auto_17479 ?auto_17477 ) ) ( ON ?auto_17479 ?auto_17476 ) ( not ( = ?auto_17478 ?auto_17477 ) ) ( not ( = ?auto_17475 ?auto_17478 ) ) ( not ( = ?auto_17476 ?auto_17478 ) ) ( not ( = ?auto_17479 ?auto_17478 ) ) ( ON ?auto_17477 ?auto_17479 ) ( CLEAR ?auto_17477 ) ( HOLDING ?auto_17478 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_17478 )
      ( MAKE-1PILE ?auto_17475 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_17480 - BLOCK
    )
    :vars
    (
      ?auto_17483 - BLOCK
      ?auto_17482 - BLOCK
      ?auto_17484 - BLOCK
      ?auto_17481 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_17483 ?auto_17480 ) ( ON-TABLE ?auto_17480 ) ( not ( = ?auto_17480 ?auto_17483 ) ) ( not ( = ?auto_17480 ?auto_17482 ) ) ( not ( = ?auto_17480 ?auto_17484 ) ) ( not ( = ?auto_17483 ?auto_17482 ) ) ( not ( = ?auto_17483 ?auto_17484 ) ) ( not ( = ?auto_17482 ?auto_17484 ) ) ( ON ?auto_17482 ?auto_17483 ) ( not ( = ?auto_17481 ?auto_17484 ) ) ( not ( = ?auto_17480 ?auto_17481 ) ) ( not ( = ?auto_17483 ?auto_17481 ) ) ( not ( = ?auto_17482 ?auto_17481 ) ) ( ON ?auto_17484 ?auto_17482 ) ( ON ?auto_17481 ?auto_17484 ) ( CLEAR ?auto_17481 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_17480 ?auto_17483 ?auto_17482 ?auto_17484 )
      ( MAKE-1PILE ?auto_17480 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_17489 - BLOCK
      ?auto_17490 - BLOCK
      ?auto_17491 - BLOCK
      ?auto_17492 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_17492 ) ( CLEAR ?auto_17491 ) ( ON-TABLE ?auto_17489 ) ( ON ?auto_17490 ?auto_17489 ) ( ON ?auto_17491 ?auto_17490 ) ( not ( = ?auto_17489 ?auto_17490 ) ) ( not ( = ?auto_17489 ?auto_17491 ) ) ( not ( = ?auto_17489 ?auto_17492 ) ) ( not ( = ?auto_17490 ?auto_17491 ) ) ( not ( = ?auto_17490 ?auto_17492 ) ) ( not ( = ?auto_17491 ?auto_17492 ) ) )
    :subtasks
    ( ( !STACK ?auto_17492 ?auto_17491 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_17493 - BLOCK
      ?auto_17494 - BLOCK
      ?auto_17495 - BLOCK
      ?auto_17496 - BLOCK
    )
    :vars
    (
      ?auto_17497 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_17495 ) ( ON-TABLE ?auto_17493 ) ( ON ?auto_17494 ?auto_17493 ) ( ON ?auto_17495 ?auto_17494 ) ( not ( = ?auto_17493 ?auto_17494 ) ) ( not ( = ?auto_17493 ?auto_17495 ) ) ( not ( = ?auto_17493 ?auto_17496 ) ) ( not ( = ?auto_17494 ?auto_17495 ) ) ( not ( = ?auto_17494 ?auto_17496 ) ) ( not ( = ?auto_17495 ?auto_17496 ) ) ( ON ?auto_17496 ?auto_17497 ) ( CLEAR ?auto_17496 ) ( HAND-EMPTY ) ( not ( = ?auto_17493 ?auto_17497 ) ) ( not ( = ?auto_17494 ?auto_17497 ) ) ( not ( = ?auto_17495 ?auto_17497 ) ) ( not ( = ?auto_17496 ?auto_17497 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_17496 ?auto_17497 )
      ( MAKE-4PILE ?auto_17493 ?auto_17494 ?auto_17495 ?auto_17496 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_17498 - BLOCK
      ?auto_17499 - BLOCK
      ?auto_17500 - BLOCK
      ?auto_17501 - BLOCK
    )
    :vars
    (
      ?auto_17502 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_17498 ) ( ON ?auto_17499 ?auto_17498 ) ( not ( = ?auto_17498 ?auto_17499 ) ) ( not ( = ?auto_17498 ?auto_17500 ) ) ( not ( = ?auto_17498 ?auto_17501 ) ) ( not ( = ?auto_17499 ?auto_17500 ) ) ( not ( = ?auto_17499 ?auto_17501 ) ) ( not ( = ?auto_17500 ?auto_17501 ) ) ( ON ?auto_17501 ?auto_17502 ) ( CLEAR ?auto_17501 ) ( not ( = ?auto_17498 ?auto_17502 ) ) ( not ( = ?auto_17499 ?auto_17502 ) ) ( not ( = ?auto_17500 ?auto_17502 ) ) ( not ( = ?auto_17501 ?auto_17502 ) ) ( HOLDING ?auto_17500 ) ( CLEAR ?auto_17499 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_17498 ?auto_17499 ?auto_17500 )
      ( MAKE-4PILE ?auto_17498 ?auto_17499 ?auto_17500 ?auto_17501 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_17503 - BLOCK
      ?auto_17504 - BLOCK
      ?auto_17505 - BLOCK
      ?auto_17506 - BLOCK
    )
    :vars
    (
      ?auto_17507 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_17503 ) ( ON ?auto_17504 ?auto_17503 ) ( not ( = ?auto_17503 ?auto_17504 ) ) ( not ( = ?auto_17503 ?auto_17505 ) ) ( not ( = ?auto_17503 ?auto_17506 ) ) ( not ( = ?auto_17504 ?auto_17505 ) ) ( not ( = ?auto_17504 ?auto_17506 ) ) ( not ( = ?auto_17505 ?auto_17506 ) ) ( ON ?auto_17506 ?auto_17507 ) ( not ( = ?auto_17503 ?auto_17507 ) ) ( not ( = ?auto_17504 ?auto_17507 ) ) ( not ( = ?auto_17505 ?auto_17507 ) ) ( not ( = ?auto_17506 ?auto_17507 ) ) ( CLEAR ?auto_17504 ) ( ON ?auto_17505 ?auto_17506 ) ( CLEAR ?auto_17505 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_17507 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_17507 ?auto_17506 )
      ( MAKE-4PILE ?auto_17503 ?auto_17504 ?auto_17505 ?auto_17506 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_17508 - BLOCK
      ?auto_17509 - BLOCK
      ?auto_17510 - BLOCK
      ?auto_17511 - BLOCK
    )
    :vars
    (
      ?auto_17512 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_17508 ) ( not ( = ?auto_17508 ?auto_17509 ) ) ( not ( = ?auto_17508 ?auto_17510 ) ) ( not ( = ?auto_17508 ?auto_17511 ) ) ( not ( = ?auto_17509 ?auto_17510 ) ) ( not ( = ?auto_17509 ?auto_17511 ) ) ( not ( = ?auto_17510 ?auto_17511 ) ) ( ON ?auto_17511 ?auto_17512 ) ( not ( = ?auto_17508 ?auto_17512 ) ) ( not ( = ?auto_17509 ?auto_17512 ) ) ( not ( = ?auto_17510 ?auto_17512 ) ) ( not ( = ?auto_17511 ?auto_17512 ) ) ( ON ?auto_17510 ?auto_17511 ) ( CLEAR ?auto_17510 ) ( ON-TABLE ?auto_17512 ) ( HOLDING ?auto_17509 ) ( CLEAR ?auto_17508 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_17508 ?auto_17509 )
      ( MAKE-4PILE ?auto_17508 ?auto_17509 ?auto_17510 ?auto_17511 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_17513 - BLOCK
      ?auto_17514 - BLOCK
      ?auto_17515 - BLOCK
      ?auto_17516 - BLOCK
    )
    :vars
    (
      ?auto_17517 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_17513 ) ( not ( = ?auto_17513 ?auto_17514 ) ) ( not ( = ?auto_17513 ?auto_17515 ) ) ( not ( = ?auto_17513 ?auto_17516 ) ) ( not ( = ?auto_17514 ?auto_17515 ) ) ( not ( = ?auto_17514 ?auto_17516 ) ) ( not ( = ?auto_17515 ?auto_17516 ) ) ( ON ?auto_17516 ?auto_17517 ) ( not ( = ?auto_17513 ?auto_17517 ) ) ( not ( = ?auto_17514 ?auto_17517 ) ) ( not ( = ?auto_17515 ?auto_17517 ) ) ( not ( = ?auto_17516 ?auto_17517 ) ) ( ON ?auto_17515 ?auto_17516 ) ( ON-TABLE ?auto_17517 ) ( CLEAR ?auto_17513 ) ( ON ?auto_17514 ?auto_17515 ) ( CLEAR ?auto_17514 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_17517 ?auto_17516 ?auto_17515 )
      ( MAKE-4PILE ?auto_17513 ?auto_17514 ?auto_17515 ?auto_17516 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_17518 - BLOCK
      ?auto_17519 - BLOCK
      ?auto_17520 - BLOCK
      ?auto_17521 - BLOCK
    )
    :vars
    (
      ?auto_17522 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_17518 ?auto_17519 ) ) ( not ( = ?auto_17518 ?auto_17520 ) ) ( not ( = ?auto_17518 ?auto_17521 ) ) ( not ( = ?auto_17519 ?auto_17520 ) ) ( not ( = ?auto_17519 ?auto_17521 ) ) ( not ( = ?auto_17520 ?auto_17521 ) ) ( ON ?auto_17521 ?auto_17522 ) ( not ( = ?auto_17518 ?auto_17522 ) ) ( not ( = ?auto_17519 ?auto_17522 ) ) ( not ( = ?auto_17520 ?auto_17522 ) ) ( not ( = ?auto_17521 ?auto_17522 ) ) ( ON ?auto_17520 ?auto_17521 ) ( ON-TABLE ?auto_17522 ) ( ON ?auto_17519 ?auto_17520 ) ( CLEAR ?auto_17519 ) ( HOLDING ?auto_17518 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_17518 )
      ( MAKE-4PILE ?auto_17518 ?auto_17519 ?auto_17520 ?auto_17521 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_17523 - BLOCK
      ?auto_17524 - BLOCK
      ?auto_17525 - BLOCK
      ?auto_17526 - BLOCK
    )
    :vars
    (
      ?auto_17527 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_17523 ?auto_17524 ) ) ( not ( = ?auto_17523 ?auto_17525 ) ) ( not ( = ?auto_17523 ?auto_17526 ) ) ( not ( = ?auto_17524 ?auto_17525 ) ) ( not ( = ?auto_17524 ?auto_17526 ) ) ( not ( = ?auto_17525 ?auto_17526 ) ) ( ON ?auto_17526 ?auto_17527 ) ( not ( = ?auto_17523 ?auto_17527 ) ) ( not ( = ?auto_17524 ?auto_17527 ) ) ( not ( = ?auto_17525 ?auto_17527 ) ) ( not ( = ?auto_17526 ?auto_17527 ) ) ( ON ?auto_17525 ?auto_17526 ) ( ON-TABLE ?auto_17527 ) ( ON ?auto_17524 ?auto_17525 ) ( ON ?auto_17523 ?auto_17524 ) ( CLEAR ?auto_17523 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_17527 ?auto_17526 ?auto_17525 ?auto_17524 )
      ( MAKE-4PILE ?auto_17523 ?auto_17524 ?auto_17525 ?auto_17526 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_17531 - BLOCK
      ?auto_17532 - BLOCK
      ?auto_17533 - BLOCK
    )
    :vars
    (
      ?auto_17534 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_17534 ?auto_17533 ) ( CLEAR ?auto_17534 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_17531 ) ( ON ?auto_17532 ?auto_17531 ) ( ON ?auto_17533 ?auto_17532 ) ( not ( = ?auto_17531 ?auto_17532 ) ) ( not ( = ?auto_17531 ?auto_17533 ) ) ( not ( = ?auto_17531 ?auto_17534 ) ) ( not ( = ?auto_17532 ?auto_17533 ) ) ( not ( = ?auto_17532 ?auto_17534 ) ) ( not ( = ?auto_17533 ?auto_17534 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_17534 ?auto_17533 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_17544 - BLOCK
      ?auto_17545 - BLOCK
      ?auto_17546 - BLOCK
    )
    :vars
    (
      ?auto_17547 - BLOCK
      ?auto_17548 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_17544 ) ( ON ?auto_17545 ?auto_17544 ) ( not ( = ?auto_17544 ?auto_17545 ) ) ( not ( = ?auto_17544 ?auto_17546 ) ) ( not ( = ?auto_17544 ?auto_17547 ) ) ( not ( = ?auto_17545 ?auto_17546 ) ) ( not ( = ?auto_17545 ?auto_17547 ) ) ( not ( = ?auto_17546 ?auto_17547 ) ) ( ON ?auto_17547 ?auto_17548 ) ( CLEAR ?auto_17547 ) ( not ( = ?auto_17544 ?auto_17548 ) ) ( not ( = ?auto_17545 ?auto_17548 ) ) ( not ( = ?auto_17546 ?auto_17548 ) ) ( not ( = ?auto_17547 ?auto_17548 ) ) ( HOLDING ?auto_17546 ) ( CLEAR ?auto_17545 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_17544 ?auto_17545 ?auto_17546 ?auto_17547 )
      ( MAKE-3PILE ?auto_17544 ?auto_17545 ?auto_17546 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_17549 - BLOCK
      ?auto_17550 - BLOCK
      ?auto_17551 - BLOCK
    )
    :vars
    (
      ?auto_17552 - BLOCK
      ?auto_17553 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_17549 ) ( ON ?auto_17550 ?auto_17549 ) ( not ( = ?auto_17549 ?auto_17550 ) ) ( not ( = ?auto_17549 ?auto_17551 ) ) ( not ( = ?auto_17549 ?auto_17552 ) ) ( not ( = ?auto_17550 ?auto_17551 ) ) ( not ( = ?auto_17550 ?auto_17552 ) ) ( not ( = ?auto_17551 ?auto_17552 ) ) ( ON ?auto_17552 ?auto_17553 ) ( not ( = ?auto_17549 ?auto_17553 ) ) ( not ( = ?auto_17550 ?auto_17553 ) ) ( not ( = ?auto_17551 ?auto_17553 ) ) ( not ( = ?auto_17552 ?auto_17553 ) ) ( CLEAR ?auto_17550 ) ( ON ?auto_17551 ?auto_17552 ) ( CLEAR ?auto_17551 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_17553 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_17553 ?auto_17552 )
      ( MAKE-3PILE ?auto_17549 ?auto_17550 ?auto_17551 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_17554 - BLOCK
      ?auto_17555 - BLOCK
      ?auto_17556 - BLOCK
    )
    :vars
    (
      ?auto_17557 - BLOCK
      ?auto_17558 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_17554 ) ( not ( = ?auto_17554 ?auto_17555 ) ) ( not ( = ?auto_17554 ?auto_17556 ) ) ( not ( = ?auto_17554 ?auto_17557 ) ) ( not ( = ?auto_17555 ?auto_17556 ) ) ( not ( = ?auto_17555 ?auto_17557 ) ) ( not ( = ?auto_17556 ?auto_17557 ) ) ( ON ?auto_17557 ?auto_17558 ) ( not ( = ?auto_17554 ?auto_17558 ) ) ( not ( = ?auto_17555 ?auto_17558 ) ) ( not ( = ?auto_17556 ?auto_17558 ) ) ( not ( = ?auto_17557 ?auto_17558 ) ) ( ON ?auto_17556 ?auto_17557 ) ( CLEAR ?auto_17556 ) ( ON-TABLE ?auto_17558 ) ( HOLDING ?auto_17555 ) ( CLEAR ?auto_17554 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_17554 ?auto_17555 )
      ( MAKE-3PILE ?auto_17554 ?auto_17555 ?auto_17556 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_17559 - BLOCK
      ?auto_17560 - BLOCK
      ?auto_17561 - BLOCK
    )
    :vars
    (
      ?auto_17562 - BLOCK
      ?auto_17563 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_17559 ) ( not ( = ?auto_17559 ?auto_17560 ) ) ( not ( = ?auto_17559 ?auto_17561 ) ) ( not ( = ?auto_17559 ?auto_17562 ) ) ( not ( = ?auto_17560 ?auto_17561 ) ) ( not ( = ?auto_17560 ?auto_17562 ) ) ( not ( = ?auto_17561 ?auto_17562 ) ) ( ON ?auto_17562 ?auto_17563 ) ( not ( = ?auto_17559 ?auto_17563 ) ) ( not ( = ?auto_17560 ?auto_17563 ) ) ( not ( = ?auto_17561 ?auto_17563 ) ) ( not ( = ?auto_17562 ?auto_17563 ) ) ( ON ?auto_17561 ?auto_17562 ) ( ON-TABLE ?auto_17563 ) ( CLEAR ?auto_17559 ) ( ON ?auto_17560 ?auto_17561 ) ( CLEAR ?auto_17560 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_17563 ?auto_17562 ?auto_17561 )
      ( MAKE-3PILE ?auto_17559 ?auto_17560 ?auto_17561 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_17564 - BLOCK
      ?auto_17565 - BLOCK
      ?auto_17566 - BLOCK
    )
    :vars
    (
      ?auto_17568 - BLOCK
      ?auto_17567 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_17564 ?auto_17565 ) ) ( not ( = ?auto_17564 ?auto_17566 ) ) ( not ( = ?auto_17564 ?auto_17568 ) ) ( not ( = ?auto_17565 ?auto_17566 ) ) ( not ( = ?auto_17565 ?auto_17568 ) ) ( not ( = ?auto_17566 ?auto_17568 ) ) ( ON ?auto_17568 ?auto_17567 ) ( not ( = ?auto_17564 ?auto_17567 ) ) ( not ( = ?auto_17565 ?auto_17567 ) ) ( not ( = ?auto_17566 ?auto_17567 ) ) ( not ( = ?auto_17568 ?auto_17567 ) ) ( ON ?auto_17566 ?auto_17568 ) ( ON-TABLE ?auto_17567 ) ( ON ?auto_17565 ?auto_17566 ) ( CLEAR ?auto_17565 ) ( HOLDING ?auto_17564 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_17564 )
      ( MAKE-3PILE ?auto_17564 ?auto_17565 ?auto_17566 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_17569 - BLOCK
      ?auto_17570 - BLOCK
      ?auto_17571 - BLOCK
    )
    :vars
    (
      ?auto_17573 - BLOCK
      ?auto_17572 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_17569 ?auto_17570 ) ) ( not ( = ?auto_17569 ?auto_17571 ) ) ( not ( = ?auto_17569 ?auto_17573 ) ) ( not ( = ?auto_17570 ?auto_17571 ) ) ( not ( = ?auto_17570 ?auto_17573 ) ) ( not ( = ?auto_17571 ?auto_17573 ) ) ( ON ?auto_17573 ?auto_17572 ) ( not ( = ?auto_17569 ?auto_17572 ) ) ( not ( = ?auto_17570 ?auto_17572 ) ) ( not ( = ?auto_17571 ?auto_17572 ) ) ( not ( = ?auto_17573 ?auto_17572 ) ) ( ON ?auto_17571 ?auto_17573 ) ( ON-TABLE ?auto_17572 ) ( ON ?auto_17570 ?auto_17571 ) ( ON ?auto_17569 ?auto_17570 ) ( CLEAR ?auto_17569 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_17572 ?auto_17573 ?auto_17571 ?auto_17570 )
      ( MAKE-3PILE ?auto_17569 ?auto_17570 ?auto_17571 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_17575 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_17575 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_17575 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_17576 - BLOCK
    )
    :vars
    (
      ?auto_17577 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_17576 ?auto_17577 ) ( CLEAR ?auto_17576 ) ( HAND-EMPTY ) ( not ( = ?auto_17576 ?auto_17577 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_17576 ?auto_17577 )
      ( MAKE-1PILE ?auto_17576 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_17578 - BLOCK
    )
    :vars
    (
      ?auto_17579 - BLOCK
      ?auto_17581 - BLOCK
      ?auto_17580 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_17578 ?auto_17579 ) ) ( HOLDING ?auto_17578 ) ( CLEAR ?auto_17579 ) ( ON-TABLE ?auto_17581 ) ( ON ?auto_17580 ?auto_17581 ) ( ON ?auto_17579 ?auto_17580 ) ( not ( = ?auto_17581 ?auto_17580 ) ) ( not ( = ?auto_17581 ?auto_17579 ) ) ( not ( = ?auto_17581 ?auto_17578 ) ) ( not ( = ?auto_17580 ?auto_17579 ) ) ( not ( = ?auto_17580 ?auto_17578 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_17581 ?auto_17580 ?auto_17579 ?auto_17578 )
      ( MAKE-1PILE ?auto_17578 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_17582 - BLOCK
    )
    :vars
    (
      ?auto_17583 - BLOCK
      ?auto_17584 - BLOCK
      ?auto_17585 - BLOCK
      ?auto_17586 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_17582 ?auto_17583 ) ) ( CLEAR ?auto_17583 ) ( ON-TABLE ?auto_17584 ) ( ON ?auto_17585 ?auto_17584 ) ( ON ?auto_17583 ?auto_17585 ) ( not ( = ?auto_17584 ?auto_17585 ) ) ( not ( = ?auto_17584 ?auto_17583 ) ) ( not ( = ?auto_17584 ?auto_17582 ) ) ( not ( = ?auto_17585 ?auto_17583 ) ) ( not ( = ?auto_17585 ?auto_17582 ) ) ( ON ?auto_17582 ?auto_17586 ) ( CLEAR ?auto_17582 ) ( HAND-EMPTY ) ( not ( = ?auto_17582 ?auto_17586 ) ) ( not ( = ?auto_17583 ?auto_17586 ) ) ( not ( = ?auto_17584 ?auto_17586 ) ) ( not ( = ?auto_17585 ?auto_17586 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_17582 ?auto_17586 )
      ( MAKE-1PILE ?auto_17582 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_17587 - BLOCK
    )
    :vars
    (
      ?auto_17590 - BLOCK
      ?auto_17589 - BLOCK
      ?auto_17588 - BLOCK
      ?auto_17591 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_17587 ?auto_17590 ) ) ( ON-TABLE ?auto_17589 ) ( ON ?auto_17588 ?auto_17589 ) ( not ( = ?auto_17589 ?auto_17588 ) ) ( not ( = ?auto_17589 ?auto_17590 ) ) ( not ( = ?auto_17589 ?auto_17587 ) ) ( not ( = ?auto_17588 ?auto_17590 ) ) ( not ( = ?auto_17588 ?auto_17587 ) ) ( ON ?auto_17587 ?auto_17591 ) ( CLEAR ?auto_17587 ) ( not ( = ?auto_17587 ?auto_17591 ) ) ( not ( = ?auto_17590 ?auto_17591 ) ) ( not ( = ?auto_17589 ?auto_17591 ) ) ( not ( = ?auto_17588 ?auto_17591 ) ) ( HOLDING ?auto_17590 ) ( CLEAR ?auto_17588 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_17589 ?auto_17588 ?auto_17590 )
      ( MAKE-1PILE ?auto_17587 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_17592 - BLOCK
    )
    :vars
    (
      ?auto_17595 - BLOCK
      ?auto_17594 - BLOCK
      ?auto_17596 - BLOCK
      ?auto_17593 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_17592 ?auto_17595 ) ) ( ON-TABLE ?auto_17594 ) ( ON ?auto_17596 ?auto_17594 ) ( not ( = ?auto_17594 ?auto_17596 ) ) ( not ( = ?auto_17594 ?auto_17595 ) ) ( not ( = ?auto_17594 ?auto_17592 ) ) ( not ( = ?auto_17596 ?auto_17595 ) ) ( not ( = ?auto_17596 ?auto_17592 ) ) ( ON ?auto_17592 ?auto_17593 ) ( not ( = ?auto_17592 ?auto_17593 ) ) ( not ( = ?auto_17595 ?auto_17593 ) ) ( not ( = ?auto_17594 ?auto_17593 ) ) ( not ( = ?auto_17596 ?auto_17593 ) ) ( CLEAR ?auto_17596 ) ( ON ?auto_17595 ?auto_17592 ) ( CLEAR ?auto_17595 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_17593 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_17593 ?auto_17592 )
      ( MAKE-1PILE ?auto_17592 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_17597 - BLOCK
    )
    :vars
    (
      ?auto_17601 - BLOCK
      ?auto_17598 - BLOCK
      ?auto_17600 - BLOCK
      ?auto_17599 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_17597 ?auto_17601 ) ) ( ON-TABLE ?auto_17598 ) ( not ( = ?auto_17598 ?auto_17600 ) ) ( not ( = ?auto_17598 ?auto_17601 ) ) ( not ( = ?auto_17598 ?auto_17597 ) ) ( not ( = ?auto_17600 ?auto_17601 ) ) ( not ( = ?auto_17600 ?auto_17597 ) ) ( ON ?auto_17597 ?auto_17599 ) ( not ( = ?auto_17597 ?auto_17599 ) ) ( not ( = ?auto_17601 ?auto_17599 ) ) ( not ( = ?auto_17598 ?auto_17599 ) ) ( not ( = ?auto_17600 ?auto_17599 ) ) ( ON ?auto_17601 ?auto_17597 ) ( CLEAR ?auto_17601 ) ( ON-TABLE ?auto_17599 ) ( HOLDING ?auto_17600 ) ( CLEAR ?auto_17598 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_17598 ?auto_17600 )
      ( MAKE-1PILE ?auto_17597 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_17602 - BLOCK
    )
    :vars
    (
      ?auto_17606 - BLOCK
      ?auto_17603 - BLOCK
      ?auto_17605 - BLOCK
      ?auto_17604 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_17602 ?auto_17606 ) ) ( ON-TABLE ?auto_17603 ) ( not ( = ?auto_17603 ?auto_17605 ) ) ( not ( = ?auto_17603 ?auto_17606 ) ) ( not ( = ?auto_17603 ?auto_17602 ) ) ( not ( = ?auto_17605 ?auto_17606 ) ) ( not ( = ?auto_17605 ?auto_17602 ) ) ( ON ?auto_17602 ?auto_17604 ) ( not ( = ?auto_17602 ?auto_17604 ) ) ( not ( = ?auto_17606 ?auto_17604 ) ) ( not ( = ?auto_17603 ?auto_17604 ) ) ( not ( = ?auto_17605 ?auto_17604 ) ) ( ON ?auto_17606 ?auto_17602 ) ( ON-TABLE ?auto_17604 ) ( CLEAR ?auto_17603 ) ( ON ?auto_17605 ?auto_17606 ) ( CLEAR ?auto_17605 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_17604 ?auto_17602 ?auto_17606 )
      ( MAKE-1PILE ?auto_17602 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_17607 - BLOCK
    )
    :vars
    (
      ?auto_17609 - BLOCK
      ?auto_17608 - BLOCK
      ?auto_17610 - BLOCK
      ?auto_17611 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_17607 ?auto_17609 ) ) ( not ( = ?auto_17608 ?auto_17610 ) ) ( not ( = ?auto_17608 ?auto_17609 ) ) ( not ( = ?auto_17608 ?auto_17607 ) ) ( not ( = ?auto_17610 ?auto_17609 ) ) ( not ( = ?auto_17610 ?auto_17607 ) ) ( ON ?auto_17607 ?auto_17611 ) ( not ( = ?auto_17607 ?auto_17611 ) ) ( not ( = ?auto_17609 ?auto_17611 ) ) ( not ( = ?auto_17608 ?auto_17611 ) ) ( not ( = ?auto_17610 ?auto_17611 ) ) ( ON ?auto_17609 ?auto_17607 ) ( ON-TABLE ?auto_17611 ) ( ON ?auto_17610 ?auto_17609 ) ( CLEAR ?auto_17610 ) ( HOLDING ?auto_17608 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_17608 )
      ( MAKE-1PILE ?auto_17607 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_17612 - BLOCK
    )
    :vars
    (
      ?auto_17615 - BLOCK
      ?auto_17616 - BLOCK
      ?auto_17613 - BLOCK
      ?auto_17614 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_17612 ?auto_17615 ) ) ( not ( = ?auto_17616 ?auto_17613 ) ) ( not ( = ?auto_17616 ?auto_17615 ) ) ( not ( = ?auto_17616 ?auto_17612 ) ) ( not ( = ?auto_17613 ?auto_17615 ) ) ( not ( = ?auto_17613 ?auto_17612 ) ) ( ON ?auto_17612 ?auto_17614 ) ( not ( = ?auto_17612 ?auto_17614 ) ) ( not ( = ?auto_17615 ?auto_17614 ) ) ( not ( = ?auto_17616 ?auto_17614 ) ) ( not ( = ?auto_17613 ?auto_17614 ) ) ( ON ?auto_17615 ?auto_17612 ) ( ON-TABLE ?auto_17614 ) ( ON ?auto_17613 ?auto_17615 ) ( ON ?auto_17616 ?auto_17613 ) ( CLEAR ?auto_17616 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_17614 ?auto_17612 ?auto_17615 ?auto_17613 )
      ( MAKE-1PILE ?auto_17612 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_17619 - BLOCK
      ?auto_17620 - BLOCK
    )
    :vars
    (
      ?auto_17621 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_17621 ?auto_17620 ) ( CLEAR ?auto_17621 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_17619 ) ( ON ?auto_17620 ?auto_17619 ) ( not ( = ?auto_17619 ?auto_17620 ) ) ( not ( = ?auto_17619 ?auto_17621 ) ) ( not ( = ?auto_17620 ?auto_17621 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_17621 ?auto_17620 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_17622 - BLOCK
      ?auto_17623 - BLOCK
    )
    :vars
    (
      ?auto_17624 - BLOCK
      ?auto_17625 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_17624 ?auto_17623 ) ( CLEAR ?auto_17624 ) ( ON-TABLE ?auto_17622 ) ( ON ?auto_17623 ?auto_17622 ) ( not ( = ?auto_17622 ?auto_17623 ) ) ( not ( = ?auto_17622 ?auto_17624 ) ) ( not ( = ?auto_17623 ?auto_17624 ) ) ( HOLDING ?auto_17625 ) ( not ( = ?auto_17622 ?auto_17625 ) ) ( not ( = ?auto_17623 ?auto_17625 ) ) ( not ( = ?auto_17624 ?auto_17625 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_17625 )
      ( MAKE-2PILE ?auto_17622 ?auto_17623 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_17626 - BLOCK
      ?auto_17627 - BLOCK
    )
    :vars
    (
      ?auto_17629 - BLOCK
      ?auto_17628 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_17629 ?auto_17627 ) ( ON-TABLE ?auto_17626 ) ( ON ?auto_17627 ?auto_17626 ) ( not ( = ?auto_17626 ?auto_17627 ) ) ( not ( = ?auto_17626 ?auto_17629 ) ) ( not ( = ?auto_17627 ?auto_17629 ) ) ( not ( = ?auto_17626 ?auto_17628 ) ) ( not ( = ?auto_17627 ?auto_17628 ) ) ( not ( = ?auto_17629 ?auto_17628 ) ) ( ON ?auto_17628 ?auto_17629 ) ( CLEAR ?auto_17628 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_17626 ?auto_17627 ?auto_17629 )
      ( MAKE-2PILE ?auto_17626 ?auto_17627 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_17630 - BLOCK
      ?auto_17631 - BLOCK
    )
    :vars
    (
      ?auto_17633 - BLOCK
      ?auto_17632 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_17633 ?auto_17631 ) ( ON-TABLE ?auto_17630 ) ( ON ?auto_17631 ?auto_17630 ) ( not ( = ?auto_17630 ?auto_17631 ) ) ( not ( = ?auto_17630 ?auto_17633 ) ) ( not ( = ?auto_17631 ?auto_17633 ) ) ( not ( = ?auto_17630 ?auto_17632 ) ) ( not ( = ?auto_17631 ?auto_17632 ) ) ( not ( = ?auto_17633 ?auto_17632 ) ) ( HOLDING ?auto_17632 ) ( CLEAR ?auto_17633 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_17630 ?auto_17631 ?auto_17633 ?auto_17632 )
      ( MAKE-2PILE ?auto_17630 ?auto_17631 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_17634 - BLOCK
      ?auto_17635 - BLOCK
    )
    :vars
    (
      ?auto_17637 - BLOCK
      ?auto_17636 - BLOCK
      ?auto_17638 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_17637 ?auto_17635 ) ( ON-TABLE ?auto_17634 ) ( ON ?auto_17635 ?auto_17634 ) ( not ( = ?auto_17634 ?auto_17635 ) ) ( not ( = ?auto_17634 ?auto_17637 ) ) ( not ( = ?auto_17635 ?auto_17637 ) ) ( not ( = ?auto_17634 ?auto_17636 ) ) ( not ( = ?auto_17635 ?auto_17636 ) ) ( not ( = ?auto_17637 ?auto_17636 ) ) ( CLEAR ?auto_17637 ) ( ON ?auto_17636 ?auto_17638 ) ( CLEAR ?auto_17636 ) ( HAND-EMPTY ) ( not ( = ?auto_17634 ?auto_17638 ) ) ( not ( = ?auto_17635 ?auto_17638 ) ) ( not ( = ?auto_17637 ?auto_17638 ) ) ( not ( = ?auto_17636 ?auto_17638 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_17636 ?auto_17638 )
      ( MAKE-2PILE ?auto_17634 ?auto_17635 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_17649 - BLOCK
      ?auto_17650 - BLOCK
    )
    :vars
    (
      ?auto_17653 - BLOCK
      ?auto_17652 - BLOCK
      ?auto_17651 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_17649 ) ( not ( = ?auto_17649 ?auto_17650 ) ) ( not ( = ?auto_17649 ?auto_17653 ) ) ( not ( = ?auto_17650 ?auto_17653 ) ) ( not ( = ?auto_17649 ?auto_17652 ) ) ( not ( = ?auto_17650 ?auto_17652 ) ) ( not ( = ?auto_17653 ?auto_17652 ) ) ( ON ?auto_17652 ?auto_17651 ) ( not ( = ?auto_17649 ?auto_17651 ) ) ( not ( = ?auto_17650 ?auto_17651 ) ) ( not ( = ?auto_17653 ?auto_17651 ) ) ( not ( = ?auto_17652 ?auto_17651 ) ) ( ON ?auto_17653 ?auto_17652 ) ( CLEAR ?auto_17653 ) ( HOLDING ?auto_17650 ) ( CLEAR ?auto_17649 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_17649 ?auto_17650 ?auto_17653 )
      ( MAKE-2PILE ?auto_17649 ?auto_17650 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_17654 - BLOCK
      ?auto_17655 - BLOCK
    )
    :vars
    (
      ?auto_17658 - BLOCK
      ?auto_17657 - BLOCK
      ?auto_17656 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_17654 ) ( not ( = ?auto_17654 ?auto_17655 ) ) ( not ( = ?auto_17654 ?auto_17658 ) ) ( not ( = ?auto_17655 ?auto_17658 ) ) ( not ( = ?auto_17654 ?auto_17657 ) ) ( not ( = ?auto_17655 ?auto_17657 ) ) ( not ( = ?auto_17658 ?auto_17657 ) ) ( ON ?auto_17657 ?auto_17656 ) ( not ( = ?auto_17654 ?auto_17656 ) ) ( not ( = ?auto_17655 ?auto_17656 ) ) ( not ( = ?auto_17658 ?auto_17656 ) ) ( not ( = ?auto_17657 ?auto_17656 ) ) ( ON ?auto_17658 ?auto_17657 ) ( CLEAR ?auto_17654 ) ( ON ?auto_17655 ?auto_17658 ) ( CLEAR ?auto_17655 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_17656 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_17656 ?auto_17657 ?auto_17658 )
      ( MAKE-2PILE ?auto_17654 ?auto_17655 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_17659 - BLOCK
      ?auto_17660 - BLOCK
    )
    :vars
    (
      ?auto_17662 - BLOCK
      ?auto_17661 - BLOCK
      ?auto_17663 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_17659 ?auto_17660 ) ) ( not ( = ?auto_17659 ?auto_17662 ) ) ( not ( = ?auto_17660 ?auto_17662 ) ) ( not ( = ?auto_17659 ?auto_17661 ) ) ( not ( = ?auto_17660 ?auto_17661 ) ) ( not ( = ?auto_17662 ?auto_17661 ) ) ( ON ?auto_17661 ?auto_17663 ) ( not ( = ?auto_17659 ?auto_17663 ) ) ( not ( = ?auto_17660 ?auto_17663 ) ) ( not ( = ?auto_17662 ?auto_17663 ) ) ( not ( = ?auto_17661 ?auto_17663 ) ) ( ON ?auto_17662 ?auto_17661 ) ( ON ?auto_17660 ?auto_17662 ) ( CLEAR ?auto_17660 ) ( ON-TABLE ?auto_17663 ) ( HOLDING ?auto_17659 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_17659 )
      ( MAKE-2PILE ?auto_17659 ?auto_17660 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_17664 - BLOCK
      ?auto_17665 - BLOCK
    )
    :vars
    (
      ?auto_17667 - BLOCK
      ?auto_17668 - BLOCK
      ?auto_17666 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_17664 ?auto_17665 ) ) ( not ( = ?auto_17664 ?auto_17667 ) ) ( not ( = ?auto_17665 ?auto_17667 ) ) ( not ( = ?auto_17664 ?auto_17668 ) ) ( not ( = ?auto_17665 ?auto_17668 ) ) ( not ( = ?auto_17667 ?auto_17668 ) ) ( ON ?auto_17668 ?auto_17666 ) ( not ( = ?auto_17664 ?auto_17666 ) ) ( not ( = ?auto_17665 ?auto_17666 ) ) ( not ( = ?auto_17667 ?auto_17666 ) ) ( not ( = ?auto_17668 ?auto_17666 ) ) ( ON ?auto_17667 ?auto_17668 ) ( ON ?auto_17665 ?auto_17667 ) ( ON-TABLE ?auto_17666 ) ( ON ?auto_17664 ?auto_17665 ) ( CLEAR ?auto_17664 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_17666 ?auto_17668 ?auto_17667 ?auto_17665 )
      ( MAKE-2PILE ?auto_17664 ?auto_17665 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_17671 - BLOCK
      ?auto_17672 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_17672 ) ( CLEAR ?auto_17671 ) ( ON-TABLE ?auto_17671 ) ( not ( = ?auto_17671 ?auto_17672 ) ) )
    :subtasks
    ( ( !STACK ?auto_17672 ?auto_17671 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_17673 - BLOCK
      ?auto_17674 - BLOCK
    )
    :vars
    (
      ?auto_17675 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_17673 ) ( ON-TABLE ?auto_17673 ) ( not ( = ?auto_17673 ?auto_17674 ) ) ( ON ?auto_17674 ?auto_17675 ) ( CLEAR ?auto_17674 ) ( HAND-EMPTY ) ( not ( = ?auto_17673 ?auto_17675 ) ) ( not ( = ?auto_17674 ?auto_17675 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_17674 ?auto_17675 )
      ( MAKE-2PILE ?auto_17673 ?auto_17674 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_17676 - BLOCK
      ?auto_17677 - BLOCK
    )
    :vars
    (
      ?auto_17678 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_17676 ?auto_17677 ) ) ( ON ?auto_17677 ?auto_17678 ) ( CLEAR ?auto_17677 ) ( not ( = ?auto_17676 ?auto_17678 ) ) ( not ( = ?auto_17677 ?auto_17678 ) ) ( HOLDING ?auto_17676 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_17676 )
      ( MAKE-2PILE ?auto_17676 ?auto_17677 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_17679 - BLOCK
      ?auto_17680 - BLOCK
    )
    :vars
    (
      ?auto_17681 - BLOCK
      ?auto_17682 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_17679 ?auto_17680 ) ) ( ON ?auto_17680 ?auto_17681 ) ( not ( = ?auto_17679 ?auto_17681 ) ) ( not ( = ?auto_17680 ?auto_17681 ) ) ( ON ?auto_17679 ?auto_17680 ) ( CLEAR ?auto_17679 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_17682 ) ( ON ?auto_17681 ?auto_17682 ) ( not ( = ?auto_17682 ?auto_17681 ) ) ( not ( = ?auto_17682 ?auto_17680 ) ) ( not ( = ?auto_17682 ?auto_17679 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_17682 ?auto_17681 ?auto_17680 )
      ( MAKE-2PILE ?auto_17679 ?auto_17680 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_17683 - BLOCK
      ?auto_17684 - BLOCK
    )
    :vars
    (
      ?auto_17686 - BLOCK
      ?auto_17685 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_17683 ?auto_17684 ) ) ( ON ?auto_17684 ?auto_17686 ) ( not ( = ?auto_17683 ?auto_17686 ) ) ( not ( = ?auto_17684 ?auto_17686 ) ) ( ON-TABLE ?auto_17685 ) ( ON ?auto_17686 ?auto_17685 ) ( not ( = ?auto_17685 ?auto_17686 ) ) ( not ( = ?auto_17685 ?auto_17684 ) ) ( not ( = ?auto_17685 ?auto_17683 ) ) ( HOLDING ?auto_17683 ) ( CLEAR ?auto_17684 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_17685 ?auto_17686 ?auto_17684 ?auto_17683 )
      ( MAKE-2PILE ?auto_17683 ?auto_17684 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_17687 - BLOCK
      ?auto_17688 - BLOCK
    )
    :vars
    (
      ?auto_17689 - BLOCK
      ?auto_17690 - BLOCK
      ?auto_17691 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_17687 ?auto_17688 ) ) ( ON ?auto_17688 ?auto_17689 ) ( not ( = ?auto_17687 ?auto_17689 ) ) ( not ( = ?auto_17688 ?auto_17689 ) ) ( ON-TABLE ?auto_17690 ) ( ON ?auto_17689 ?auto_17690 ) ( not ( = ?auto_17690 ?auto_17689 ) ) ( not ( = ?auto_17690 ?auto_17688 ) ) ( not ( = ?auto_17690 ?auto_17687 ) ) ( CLEAR ?auto_17688 ) ( ON ?auto_17687 ?auto_17691 ) ( CLEAR ?auto_17687 ) ( HAND-EMPTY ) ( not ( = ?auto_17687 ?auto_17691 ) ) ( not ( = ?auto_17688 ?auto_17691 ) ) ( not ( = ?auto_17689 ?auto_17691 ) ) ( not ( = ?auto_17690 ?auto_17691 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_17687 ?auto_17691 )
      ( MAKE-2PILE ?auto_17687 ?auto_17688 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_17692 - BLOCK
      ?auto_17693 - BLOCK
    )
    :vars
    (
      ?auto_17695 - BLOCK
      ?auto_17694 - BLOCK
      ?auto_17696 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_17692 ?auto_17693 ) ) ( not ( = ?auto_17692 ?auto_17695 ) ) ( not ( = ?auto_17693 ?auto_17695 ) ) ( ON-TABLE ?auto_17694 ) ( ON ?auto_17695 ?auto_17694 ) ( not ( = ?auto_17694 ?auto_17695 ) ) ( not ( = ?auto_17694 ?auto_17693 ) ) ( not ( = ?auto_17694 ?auto_17692 ) ) ( ON ?auto_17692 ?auto_17696 ) ( CLEAR ?auto_17692 ) ( not ( = ?auto_17692 ?auto_17696 ) ) ( not ( = ?auto_17693 ?auto_17696 ) ) ( not ( = ?auto_17695 ?auto_17696 ) ) ( not ( = ?auto_17694 ?auto_17696 ) ) ( HOLDING ?auto_17693 ) ( CLEAR ?auto_17695 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_17694 ?auto_17695 ?auto_17693 )
      ( MAKE-2PILE ?auto_17692 ?auto_17693 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_17697 - BLOCK
      ?auto_17698 - BLOCK
    )
    :vars
    (
      ?auto_17701 - BLOCK
      ?auto_17700 - BLOCK
      ?auto_17699 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_17697 ?auto_17698 ) ) ( not ( = ?auto_17697 ?auto_17701 ) ) ( not ( = ?auto_17698 ?auto_17701 ) ) ( ON-TABLE ?auto_17700 ) ( ON ?auto_17701 ?auto_17700 ) ( not ( = ?auto_17700 ?auto_17701 ) ) ( not ( = ?auto_17700 ?auto_17698 ) ) ( not ( = ?auto_17700 ?auto_17697 ) ) ( ON ?auto_17697 ?auto_17699 ) ( not ( = ?auto_17697 ?auto_17699 ) ) ( not ( = ?auto_17698 ?auto_17699 ) ) ( not ( = ?auto_17701 ?auto_17699 ) ) ( not ( = ?auto_17700 ?auto_17699 ) ) ( CLEAR ?auto_17701 ) ( ON ?auto_17698 ?auto_17697 ) ( CLEAR ?auto_17698 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_17699 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_17699 ?auto_17697 )
      ( MAKE-2PILE ?auto_17697 ?auto_17698 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_17702 - BLOCK
      ?auto_17703 - BLOCK
    )
    :vars
    (
      ?auto_17706 - BLOCK
      ?auto_17704 - BLOCK
      ?auto_17705 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_17702 ?auto_17703 ) ) ( not ( = ?auto_17702 ?auto_17706 ) ) ( not ( = ?auto_17703 ?auto_17706 ) ) ( ON-TABLE ?auto_17704 ) ( not ( = ?auto_17704 ?auto_17706 ) ) ( not ( = ?auto_17704 ?auto_17703 ) ) ( not ( = ?auto_17704 ?auto_17702 ) ) ( ON ?auto_17702 ?auto_17705 ) ( not ( = ?auto_17702 ?auto_17705 ) ) ( not ( = ?auto_17703 ?auto_17705 ) ) ( not ( = ?auto_17706 ?auto_17705 ) ) ( not ( = ?auto_17704 ?auto_17705 ) ) ( ON ?auto_17703 ?auto_17702 ) ( CLEAR ?auto_17703 ) ( ON-TABLE ?auto_17705 ) ( HOLDING ?auto_17706 ) ( CLEAR ?auto_17704 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_17704 ?auto_17706 )
      ( MAKE-2PILE ?auto_17702 ?auto_17703 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_17707 - BLOCK
      ?auto_17708 - BLOCK
    )
    :vars
    (
      ?auto_17710 - BLOCK
      ?auto_17709 - BLOCK
      ?auto_17711 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_17707 ?auto_17708 ) ) ( not ( = ?auto_17707 ?auto_17710 ) ) ( not ( = ?auto_17708 ?auto_17710 ) ) ( ON-TABLE ?auto_17709 ) ( not ( = ?auto_17709 ?auto_17710 ) ) ( not ( = ?auto_17709 ?auto_17708 ) ) ( not ( = ?auto_17709 ?auto_17707 ) ) ( ON ?auto_17707 ?auto_17711 ) ( not ( = ?auto_17707 ?auto_17711 ) ) ( not ( = ?auto_17708 ?auto_17711 ) ) ( not ( = ?auto_17710 ?auto_17711 ) ) ( not ( = ?auto_17709 ?auto_17711 ) ) ( ON ?auto_17708 ?auto_17707 ) ( ON-TABLE ?auto_17711 ) ( CLEAR ?auto_17709 ) ( ON ?auto_17710 ?auto_17708 ) ( CLEAR ?auto_17710 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_17711 ?auto_17707 ?auto_17708 )
      ( MAKE-2PILE ?auto_17707 ?auto_17708 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_17712 - BLOCK
      ?auto_17713 - BLOCK
    )
    :vars
    (
      ?auto_17715 - BLOCK
      ?auto_17714 - BLOCK
      ?auto_17716 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_17712 ?auto_17713 ) ) ( not ( = ?auto_17712 ?auto_17715 ) ) ( not ( = ?auto_17713 ?auto_17715 ) ) ( not ( = ?auto_17714 ?auto_17715 ) ) ( not ( = ?auto_17714 ?auto_17713 ) ) ( not ( = ?auto_17714 ?auto_17712 ) ) ( ON ?auto_17712 ?auto_17716 ) ( not ( = ?auto_17712 ?auto_17716 ) ) ( not ( = ?auto_17713 ?auto_17716 ) ) ( not ( = ?auto_17715 ?auto_17716 ) ) ( not ( = ?auto_17714 ?auto_17716 ) ) ( ON ?auto_17713 ?auto_17712 ) ( ON-TABLE ?auto_17716 ) ( ON ?auto_17715 ?auto_17713 ) ( CLEAR ?auto_17715 ) ( HOLDING ?auto_17714 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_17714 )
      ( MAKE-2PILE ?auto_17712 ?auto_17713 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_17717 - BLOCK
      ?auto_17718 - BLOCK
    )
    :vars
    (
      ?auto_17719 - BLOCK
      ?auto_17721 - BLOCK
      ?auto_17720 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_17717 ?auto_17718 ) ) ( not ( = ?auto_17717 ?auto_17719 ) ) ( not ( = ?auto_17718 ?auto_17719 ) ) ( not ( = ?auto_17721 ?auto_17719 ) ) ( not ( = ?auto_17721 ?auto_17718 ) ) ( not ( = ?auto_17721 ?auto_17717 ) ) ( ON ?auto_17717 ?auto_17720 ) ( not ( = ?auto_17717 ?auto_17720 ) ) ( not ( = ?auto_17718 ?auto_17720 ) ) ( not ( = ?auto_17719 ?auto_17720 ) ) ( not ( = ?auto_17721 ?auto_17720 ) ) ( ON ?auto_17718 ?auto_17717 ) ( ON-TABLE ?auto_17720 ) ( ON ?auto_17719 ?auto_17718 ) ( ON ?auto_17721 ?auto_17719 ) ( CLEAR ?auto_17721 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_17720 ?auto_17717 ?auto_17718 ?auto_17719 )
      ( MAKE-2PILE ?auto_17717 ?auto_17718 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_17723 - BLOCK
    )
    :vars
    (
      ?auto_17724 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_17724 ?auto_17723 ) ( CLEAR ?auto_17724 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_17723 ) ( not ( = ?auto_17723 ?auto_17724 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_17724 ?auto_17723 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_17725 - BLOCK
    )
    :vars
    (
      ?auto_17726 - BLOCK
      ?auto_17727 - BLOCK
      ?auto_17728 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_17726 ?auto_17725 ) ( CLEAR ?auto_17726 ) ( ON-TABLE ?auto_17725 ) ( not ( = ?auto_17725 ?auto_17726 ) ) ( HOLDING ?auto_17727 ) ( CLEAR ?auto_17728 ) ( not ( = ?auto_17725 ?auto_17727 ) ) ( not ( = ?auto_17725 ?auto_17728 ) ) ( not ( = ?auto_17726 ?auto_17727 ) ) ( not ( = ?auto_17726 ?auto_17728 ) ) ( not ( = ?auto_17727 ?auto_17728 ) ) )
    :subtasks
    ( ( !STACK ?auto_17727 ?auto_17728 )
      ( MAKE-1PILE ?auto_17725 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_17729 - BLOCK
    )
    :vars
    (
      ?auto_17731 - BLOCK
      ?auto_17730 - BLOCK
      ?auto_17732 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_17731 ?auto_17729 ) ( ON-TABLE ?auto_17729 ) ( not ( = ?auto_17729 ?auto_17731 ) ) ( CLEAR ?auto_17730 ) ( not ( = ?auto_17729 ?auto_17732 ) ) ( not ( = ?auto_17729 ?auto_17730 ) ) ( not ( = ?auto_17731 ?auto_17732 ) ) ( not ( = ?auto_17731 ?auto_17730 ) ) ( not ( = ?auto_17732 ?auto_17730 ) ) ( ON ?auto_17732 ?auto_17731 ) ( CLEAR ?auto_17732 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_17729 ?auto_17731 )
      ( MAKE-1PILE ?auto_17729 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_17733 - BLOCK
    )
    :vars
    (
      ?auto_17736 - BLOCK
      ?auto_17734 - BLOCK
      ?auto_17735 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_17736 ?auto_17733 ) ( ON-TABLE ?auto_17733 ) ( not ( = ?auto_17733 ?auto_17736 ) ) ( not ( = ?auto_17733 ?auto_17734 ) ) ( not ( = ?auto_17733 ?auto_17735 ) ) ( not ( = ?auto_17736 ?auto_17734 ) ) ( not ( = ?auto_17736 ?auto_17735 ) ) ( not ( = ?auto_17734 ?auto_17735 ) ) ( ON ?auto_17734 ?auto_17736 ) ( CLEAR ?auto_17734 ) ( HOLDING ?auto_17735 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_17735 )
      ( MAKE-1PILE ?auto_17733 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_17737 - BLOCK
    )
    :vars
    (
      ?auto_17739 - BLOCK
      ?auto_17740 - BLOCK
      ?auto_17738 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_17739 ?auto_17737 ) ( ON-TABLE ?auto_17737 ) ( not ( = ?auto_17737 ?auto_17739 ) ) ( not ( = ?auto_17737 ?auto_17740 ) ) ( not ( = ?auto_17737 ?auto_17738 ) ) ( not ( = ?auto_17739 ?auto_17740 ) ) ( not ( = ?auto_17739 ?auto_17738 ) ) ( not ( = ?auto_17740 ?auto_17738 ) ) ( ON ?auto_17740 ?auto_17739 ) ( ON ?auto_17738 ?auto_17740 ) ( CLEAR ?auto_17738 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_17737 ?auto_17739 ?auto_17740 )
      ( MAKE-1PILE ?auto_17737 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_17741 - BLOCK
    )
    :vars
    (
      ?auto_17744 - BLOCK
      ?auto_17743 - BLOCK
      ?auto_17742 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_17744 ?auto_17741 ) ( ON-TABLE ?auto_17741 ) ( not ( = ?auto_17741 ?auto_17744 ) ) ( not ( = ?auto_17741 ?auto_17743 ) ) ( not ( = ?auto_17741 ?auto_17742 ) ) ( not ( = ?auto_17744 ?auto_17743 ) ) ( not ( = ?auto_17744 ?auto_17742 ) ) ( not ( = ?auto_17743 ?auto_17742 ) ) ( ON ?auto_17743 ?auto_17744 ) ( HOLDING ?auto_17742 ) ( CLEAR ?auto_17743 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_17741 ?auto_17744 ?auto_17743 ?auto_17742 )
      ( MAKE-1PILE ?auto_17741 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_17745 - BLOCK
    )
    :vars
    (
      ?auto_17747 - BLOCK
      ?auto_17746 - BLOCK
      ?auto_17748 - BLOCK
      ?auto_17749 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_17747 ?auto_17745 ) ( ON-TABLE ?auto_17745 ) ( not ( = ?auto_17745 ?auto_17747 ) ) ( not ( = ?auto_17745 ?auto_17746 ) ) ( not ( = ?auto_17745 ?auto_17748 ) ) ( not ( = ?auto_17747 ?auto_17746 ) ) ( not ( = ?auto_17747 ?auto_17748 ) ) ( not ( = ?auto_17746 ?auto_17748 ) ) ( ON ?auto_17746 ?auto_17747 ) ( CLEAR ?auto_17746 ) ( ON ?auto_17748 ?auto_17749 ) ( CLEAR ?auto_17748 ) ( HAND-EMPTY ) ( not ( = ?auto_17745 ?auto_17749 ) ) ( not ( = ?auto_17747 ?auto_17749 ) ) ( not ( = ?auto_17746 ?auto_17749 ) ) ( not ( = ?auto_17748 ?auto_17749 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_17748 ?auto_17749 )
      ( MAKE-1PILE ?auto_17745 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_17750 - BLOCK
    )
    :vars
    (
      ?auto_17752 - BLOCK
      ?auto_17751 - BLOCK
      ?auto_17754 - BLOCK
      ?auto_17753 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_17752 ?auto_17750 ) ( ON-TABLE ?auto_17750 ) ( not ( = ?auto_17750 ?auto_17752 ) ) ( not ( = ?auto_17750 ?auto_17751 ) ) ( not ( = ?auto_17750 ?auto_17754 ) ) ( not ( = ?auto_17752 ?auto_17751 ) ) ( not ( = ?auto_17752 ?auto_17754 ) ) ( not ( = ?auto_17751 ?auto_17754 ) ) ( ON ?auto_17754 ?auto_17753 ) ( CLEAR ?auto_17754 ) ( not ( = ?auto_17750 ?auto_17753 ) ) ( not ( = ?auto_17752 ?auto_17753 ) ) ( not ( = ?auto_17751 ?auto_17753 ) ) ( not ( = ?auto_17754 ?auto_17753 ) ) ( HOLDING ?auto_17751 ) ( CLEAR ?auto_17752 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_17750 ?auto_17752 ?auto_17751 )
      ( MAKE-1PILE ?auto_17750 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_17755 - BLOCK
    )
    :vars
    (
      ?auto_17756 - BLOCK
      ?auto_17759 - BLOCK
      ?auto_17758 - BLOCK
      ?auto_17757 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_17756 ?auto_17755 ) ( ON-TABLE ?auto_17755 ) ( not ( = ?auto_17755 ?auto_17756 ) ) ( not ( = ?auto_17755 ?auto_17759 ) ) ( not ( = ?auto_17755 ?auto_17758 ) ) ( not ( = ?auto_17756 ?auto_17759 ) ) ( not ( = ?auto_17756 ?auto_17758 ) ) ( not ( = ?auto_17759 ?auto_17758 ) ) ( ON ?auto_17758 ?auto_17757 ) ( not ( = ?auto_17755 ?auto_17757 ) ) ( not ( = ?auto_17756 ?auto_17757 ) ) ( not ( = ?auto_17759 ?auto_17757 ) ) ( not ( = ?auto_17758 ?auto_17757 ) ) ( CLEAR ?auto_17756 ) ( ON ?auto_17759 ?auto_17758 ) ( CLEAR ?auto_17759 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_17757 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_17757 ?auto_17758 )
      ( MAKE-1PILE ?auto_17755 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_17770 - BLOCK
    )
    :vars
    (
      ?auto_17774 - BLOCK
      ?auto_17772 - BLOCK
      ?auto_17771 - BLOCK
      ?auto_17773 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_17770 ?auto_17774 ) ) ( not ( = ?auto_17770 ?auto_17772 ) ) ( not ( = ?auto_17770 ?auto_17771 ) ) ( not ( = ?auto_17774 ?auto_17772 ) ) ( not ( = ?auto_17774 ?auto_17771 ) ) ( not ( = ?auto_17772 ?auto_17771 ) ) ( ON ?auto_17771 ?auto_17773 ) ( not ( = ?auto_17770 ?auto_17773 ) ) ( not ( = ?auto_17774 ?auto_17773 ) ) ( not ( = ?auto_17772 ?auto_17773 ) ) ( not ( = ?auto_17771 ?auto_17773 ) ) ( ON ?auto_17772 ?auto_17771 ) ( ON-TABLE ?auto_17773 ) ( ON ?auto_17774 ?auto_17772 ) ( CLEAR ?auto_17774 ) ( HOLDING ?auto_17770 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_17770 ?auto_17774 )
      ( MAKE-1PILE ?auto_17770 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_17775 - BLOCK
    )
    :vars
    (
      ?auto_17776 - BLOCK
      ?auto_17777 - BLOCK
      ?auto_17779 - BLOCK
      ?auto_17778 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_17775 ?auto_17776 ) ) ( not ( = ?auto_17775 ?auto_17777 ) ) ( not ( = ?auto_17775 ?auto_17779 ) ) ( not ( = ?auto_17776 ?auto_17777 ) ) ( not ( = ?auto_17776 ?auto_17779 ) ) ( not ( = ?auto_17777 ?auto_17779 ) ) ( ON ?auto_17779 ?auto_17778 ) ( not ( = ?auto_17775 ?auto_17778 ) ) ( not ( = ?auto_17776 ?auto_17778 ) ) ( not ( = ?auto_17777 ?auto_17778 ) ) ( not ( = ?auto_17779 ?auto_17778 ) ) ( ON ?auto_17777 ?auto_17779 ) ( ON-TABLE ?auto_17778 ) ( ON ?auto_17776 ?auto_17777 ) ( ON ?auto_17775 ?auto_17776 ) ( CLEAR ?auto_17775 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_17778 ?auto_17779 ?auto_17777 ?auto_17776 )
      ( MAKE-1PILE ?auto_17775 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_17783 - BLOCK
      ?auto_17784 - BLOCK
      ?auto_17785 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_17785 ) ( CLEAR ?auto_17784 ) ( ON-TABLE ?auto_17783 ) ( ON ?auto_17784 ?auto_17783 ) ( not ( = ?auto_17783 ?auto_17784 ) ) ( not ( = ?auto_17783 ?auto_17785 ) ) ( not ( = ?auto_17784 ?auto_17785 ) ) )
    :subtasks
    ( ( !STACK ?auto_17785 ?auto_17784 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_17786 - BLOCK
      ?auto_17787 - BLOCK
      ?auto_17788 - BLOCK
    )
    :vars
    (
      ?auto_17789 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_17787 ) ( ON-TABLE ?auto_17786 ) ( ON ?auto_17787 ?auto_17786 ) ( not ( = ?auto_17786 ?auto_17787 ) ) ( not ( = ?auto_17786 ?auto_17788 ) ) ( not ( = ?auto_17787 ?auto_17788 ) ) ( ON ?auto_17788 ?auto_17789 ) ( CLEAR ?auto_17788 ) ( HAND-EMPTY ) ( not ( = ?auto_17786 ?auto_17789 ) ) ( not ( = ?auto_17787 ?auto_17789 ) ) ( not ( = ?auto_17788 ?auto_17789 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_17788 ?auto_17789 )
      ( MAKE-3PILE ?auto_17786 ?auto_17787 ?auto_17788 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_17790 - BLOCK
      ?auto_17791 - BLOCK
      ?auto_17792 - BLOCK
    )
    :vars
    (
      ?auto_17793 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_17790 ) ( not ( = ?auto_17790 ?auto_17791 ) ) ( not ( = ?auto_17790 ?auto_17792 ) ) ( not ( = ?auto_17791 ?auto_17792 ) ) ( ON ?auto_17792 ?auto_17793 ) ( CLEAR ?auto_17792 ) ( not ( = ?auto_17790 ?auto_17793 ) ) ( not ( = ?auto_17791 ?auto_17793 ) ) ( not ( = ?auto_17792 ?auto_17793 ) ) ( HOLDING ?auto_17791 ) ( CLEAR ?auto_17790 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_17790 ?auto_17791 )
      ( MAKE-3PILE ?auto_17790 ?auto_17791 ?auto_17792 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_17794 - BLOCK
      ?auto_17795 - BLOCK
      ?auto_17796 - BLOCK
    )
    :vars
    (
      ?auto_17797 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_17794 ) ( not ( = ?auto_17794 ?auto_17795 ) ) ( not ( = ?auto_17794 ?auto_17796 ) ) ( not ( = ?auto_17795 ?auto_17796 ) ) ( ON ?auto_17796 ?auto_17797 ) ( not ( = ?auto_17794 ?auto_17797 ) ) ( not ( = ?auto_17795 ?auto_17797 ) ) ( not ( = ?auto_17796 ?auto_17797 ) ) ( CLEAR ?auto_17794 ) ( ON ?auto_17795 ?auto_17796 ) ( CLEAR ?auto_17795 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_17797 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_17797 ?auto_17796 )
      ( MAKE-3PILE ?auto_17794 ?auto_17795 ?auto_17796 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_17798 - BLOCK
      ?auto_17799 - BLOCK
      ?auto_17800 - BLOCK
    )
    :vars
    (
      ?auto_17801 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_17798 ?auto_17799 ) ) ( not ( = ?auto_17798 ?auto_17800 ) ) ( not ( = ?auto_17799 ?auto_17800 ) ) ( ON ?auto_17800 ?auto_17801 ) ( not ( = ?auto_17798 ?auto_17801 ) ) ( not ( = ?auto_17799 ?auto_17801 ) ) ( not ( = ?auto_17800 ?auto_17801 ) ) ( ON ?auto_17799 ?auto_17800 ) ( CLEAR ?auto_17799 ) ( ON-TABLE ?auto_17801 ) ( HOLDING ?auto_17798 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_17798 )
      ( MAKE-3PILE ?auto_17798 ?auto_17799 ?auto_17800 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_17802 - BLOCK
      ?auto_17803 - BLOCK
      ?auto_17804 - BLOCK
    )
    :vars
    (
      ?auto_17805 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_17802 ?auto_17803 ) ) ( not ( = ?auto_17802 ?auto_17804 ) ) ( not ( = ?auto_17803 ?auto_17804 ) ) ( ON ?auto_17804 ?auto_17805 ) ( not ( = ?auto_17802 ?auto_17805 ) ) ( not ( = ?auto_17803 ?auto_17805 ) ) ( not ( = ?auto_17804 ?auto_17805 ) ) ( ON ?auto_17803 ?auto_17804 ) ( ON-TABLE ?auto_17805 ) ( ON ?auto_17802 ?auto_17803 ) ( CLEAR ?auto_17802 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_17805 ?auto_17804 ?auto_17803 )
      ( MAKE-3PILE ?auto_17802 ?auto_17803 ?auto_17804 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_17806 - BLOCK
      ?auto_17807 - BLOCK
      ?auto_17808 - BLOCK
    )
    :vars
    (
      ?auto_17809 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_17806 ?auto_17807 ) ) ( not ( = ?auto_17806 ?auto_17808 ) ) ( not ( = ?auto_17807 ?auto_17808 ) ) ( ON ?auto_17808 ?auto_17809 ) ( not ( = ?auto_17806 ?auto_17809 ) ) ( not ( = ?auto_17807 ?auto_17809 ) ) ( not ( = ?auto_17808 ?auto_17809 ) ) ( ON ?auto_17807 ?auto_17808 ) ( ON-TABLE ?auto_17809 ) ( HOLDING ?auto_17806 ) ( CLEAR ?auto_17807 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_17809 ?auto_17808 ?auto_17807 ?auto_17806 )
      ( MAKE-3PILE ?auto_17806 ?auto_17807 ?auto_17808 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_17810 - BLOCK
      ?auto_17811 - BLOCK
      ?auto_17812 - BLOCK
    )
    :vars
    (
      ?auto_17813 - BLOCK
      ?auto_17814 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_17810 ?auto_17811 ) ) ( not ( = ?auto_17810 ?auto_17812 ) ) ( not ( = ?auto_17811 ?auto_17812 ) ) ( ON ?auto_17812 ?auto_17813 ) ( not ( = ?auto_17810 ?auto_17813 ) ) ( not ( = ?auto_17811 ?auto_17813 ) ) ( not ( = ?auto_17812 ?auto_17813 ) ) ( ON ?auto_17811 ?auto_17812 ) ( ON-TABLE ?auto_17813 ) ( CLEAR ?auto_17811 ) ( ON ?auto_17810 ?auto_17814 ) ( CLEAR ?auto_17810 ) ( HAND-EMPTY ) ( not ( = ?auto_17810 ?auto_17814 ) ) ( not ( = ?auto_17811 ?auto_17814 ) ) ( not ( = ?auto_17812 ?auto_17814 ) ) ( not ( = ?auto_17813 ?auto_17814 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_17810 ?auto_17814 )
      ( MAKE-3PILE ?auto_17810 ?auto_17811 ?auto_17812 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_17815 - BLOCK
      ?auto_17816 - BLOCK
      ?auto_17817 - BLOCK
    )
    :vars
    (
      ?auto_17818 - BLOCK
      ?auto_17819 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_17815 ?auto_17816 ) ) ( not ( = ?auto_17815 ?auto_17817 ) ) ( not ( = ?auto_17816 ?auto_17817 ) ) ( ON ?auto_17817 ?auto_17818 ) ( not ( = ?auto_17815 ?auto_17818 ) ) ( not ( = ?auto_17816 ?auto_17818 ) ) ( not ( = ?auto_17817 ?auto_17818 ) ) ( ON-TABLE ?auto_17818 ) ( ON ?auto_17815 ?auto_17819 ) ( CLEAR ?auto_17815 ) ( not ( = ?auto_17815 ?auto_17819 ) ) ( not ( = ?auto_17816 ?auto_17819 ) ) ( not ( = ?auto_17817 ?auto_17819 ) ) ( not ( = ?auto_17818 ?auto_17819 ) ) ( HOLDING ?auto_17816 ) ( CLEAR ?auto_17817 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_17818 ?auto_17817 ?auto_17816 )
      ( MAKE-3PILE ?auto_17815 ?auto_17816 ?auto_17817 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_17820 - BLOCK
      ?auto_17821 - BLOCK
      ?auto_17822 - BLOCK
    )
    :vars
    (
      ?auto_17824 - BLOCK
      ?auto_17823 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_17820 ?auto_17821 ) ) ( not ( = ?auto_17820 ?auto_17822 ) ) ( not ( = ?auto_17821 ?auto_17822 ) ) ( ON ?auto_17822 ?auto_17824 ) ( not ( = ?auto_17820 ?auto_17824 ) ) ( not ( = ?auto_17821 ?auto_17824 ) ) ( not ( = ?auto_17822 ?auto_17824 ) ) ( ON-TABLE ?auto_17824 ) ( ON ?auto_17820 ?auto_17823 ) ( not ( = ?auto_17820 ?auto_17823 ) ) ( not ( = ?auto_17821 ?auto_17823 ) ) ( not ( = ?auto_17822 ?auto_17823 ) ) ( not ( = ?auto_17824 ?auto_17823 ) ) ( CLEAR ?auto_17822 ) ( ON ?auto_17821 ?auto_17820 ) ( CLEAR ?auto_17821 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_17823 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_17823 ?auto_17820 )
      ( MAKE-3PILE ?auto_17820 ?auto_17821 ?auto_17822 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_17825 - BLOCK
      ?auto_17826 - BLOCK
      ?auto_17827 - BLOCK
    )
    :vars
    (
      ?auto_17829 - BLOCK
      ?auto_17828 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_17825 ?auto_17826 ) ) ( not ( = ?auto_17825 ?auto_17827 ) ) ( not ( = ?auto_17826 ?auto_17827 ) ) ( not ( = ?auto_17825 ?auto_17829 ) ) ( not ( = ?auto_17826 ?auto_17829 ) ) ( not ( = ?auto_17827 ?auto_17829 ) ) ( ON-TABLE ?auto_17829 ) ( ON ?auto_17825 ?auto_17828 ) ( not ( = ?auto_17825 ?auto_17828 ) ) ( not ( = ?auto_17826 ?auto_17828 ) ) ( not ( = ?auto_17827 ?auto_17828 ) ) ( not ( = ?auto_17829 ?auto_17828 ) ) ( ON ?auto_17826 ?auto_17825 ) ( CLEAR ?auto_17826 ) ( ON-TABLE ?auto_17828 ) ( HOLDING ?auto_17827 ) ( CLEAR ?auto_17829 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_17829 ?auto_17827 )
      ( MAKE-3PILE ?auto_17825 ?auto_17826 ?auto_17827 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_17830 - BLOCK
      ?auto_17831 - BLOCK
      ?auto_17832 - BLOCK
    )
    :vars
    (
      ?auto_17834 - BLOCK
      ?auto_17833 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_17830 ?auto_17831 ) ) ( not ( = ?auto_17830 ?auto_17832 ) ) ( not ( = ?auto_17831 ?auto_17832 ) ) ( not ( = ?auto_17830 ?auto_17834 ) ) ( not ( = ?auto_17831 ?auto_17834 ) ) ( not ( = ?auto_17832 ?auto_17834 ) ) ( ON-TABLE ?auto_17834 ) ( ON ?auto_17830 ?auto_17833 ) ( not ( = ?auto_17830 ?auto_17833 ) ) ( not ( = ?auto_17831 ?auto_17833 ) ) ( not ( = ?auto_17832 ?auto_17833 ) ) ( not ( = ?auto_17834 ?auto_17833 ) ) ( ON ?auto_17831 ?auto_17830 ) ( ON-TABLE ?auto_17833 ) ( CLEAR ?auto_17834 ) ( ON ?auto_17832 ?auto_17831 ) ( CLEAR ?auto_17832 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_17833 ?auto_17830 ?auto_17831 )
      ( MAKE-3PILE ?auto_17830 ?auto_17831 ?auto_17832 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_17835 - BLOCK
      ?auto_17836 - BLOCK
      ?auto_17837 - BLOCK
    )
    :vars
    (
      ?auto_17838 - BLOCK
      ?auto_17839 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_17835 ?auto_17836 ) ) ( not ( = ?auto_17835 ?auto_17837 ) ) ( not ( = ?auto_17836 ?auto_17837 ) ) ( not ( = ?auto_17835 ?auto_17838 ) ) ( not ( = ?auto_17836 ?auto_17838 ) ) ( not ( = ?auto_17837 ?auto_17838 ) ) ( ON ?auto_17835 ?auto_17839 ) ( not ( = ?auto_17835 ?auto_17839 ) ) ( not ( = ?auto_17836 ?auto_17839 ) ) ( not ( = ?auto_17837 ?auto_17839 ) ) ( not ( = ?auto_17838 ?auto_17839 ) ) ( ON ?auto_17836 ?auto_17835 ) ( ON-TABLE ?auto_17839 ) ( ON ?auto_17837 ?auto_17836 ) ( CLEAR ?auto_17837 ) ( HOLDING ?auto_17838 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_17838 )
      ( MAKE-3PILE ?auto_17835 ?auto_17836 ?auto_17837 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_17840 - BLOCK
      ?auto_17841 - BLOCK
      ?auto_17842 - BLOCK
    )
    :vars
    (
      ?auto_17844 - BLOCK
      ?auto_17843 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_17840 ?auto_17841 ) ) ( not ( = ?auto_17840 ?auto_17842 ) ) ( not ( = ?auto_17841 ?auto_17842 ) ) ( not ( = ?auto_17840 ?auto_17844 ) ) ( not ( = ?auto_17841 ?auto_17844 ) ) ( not ( = ?auto_17842 ?auto_17844 ) ) ( ON ?auto_17840 ?auto_17843 ) ( not ( = ?auto_17840 ?auto_17843 ) ) ( not ( = ?auto_17841 ?auto_17843 ) ) ( not ( = ?auto_17842 ?auto_17843 ) ) ( not ( = ?auto_17844 ?auto_17843 ) ) ( ON ?auto_17841 ?auto_17840 ) ( ON-TABLE ?auto_17843 ) ( ON ?auto_17842 ?auto_17841 ) ( ON ?auto_17844 ?auto_17842 ) ( CLEAR ?auto_17844 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_17843 ?auto_17840 ?auto_17841 ?auto_17842 )
      ( MAKE-3PILE ?auto_17840 ?auto_17841 ?auto_17842 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_17849 - BLOCK
      ?auto_17850 - BLOCK
      ?auto_17851 - BLOCK
      ?auto_17852 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_17852 ) ( CLEAR ?auto_17851 ) ( ON-TABLE ?auto_17849 ) ( ON ?auto_17850 ?auto_17849 ) ( ON ?auto_17851 ?auto_17850 ) ( not ( = ?auto_17849 ?auto_17850 ) ) ( not ( = ?auto_17849 ?auto_17851 ) ) ( not ( = ?auto_17849 ?auto_17852 ) ) ( not ( = ?auto_17850 ?auto_17851 ) ) ( not ( = ?auto_17850 ?auto_17852 ) ) ( not ( = ?auto_17851 ?auto_17852 ) ) )
    :subtasks
    ( ( !STACK ?auto_17852 ?auto_17851 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_17853 - BLOCK
      ?auto_17854 - BLOCK
      ?auto_17855 - BLOCK
      ?auto_17856 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_17855 ) ( ON-TABLE ?auto_17853 ) ( ON ?auto_17854 ?auto_17853 ) ( ON ?auto_17855 ?auto_17854 ) ( not ( = ?auto_17853 ?auto_17854 ) ) ( not ( = ?auto_17853 ?auto_17855 ) ) ( not ( = ?auto_17853 ?auto_17856 ) ) ( not ( = ?auto_17854 ?auto_17855 ) ) ( not ( = ?auto_17854 ?auto_17856 ) ) ( not ( = ?auto_17855 ?auto_17856 ) ) ( ON-TABLE ?auto_17856 ) ( CLEAR ?auto_17856 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_17856 )
      ( MAKE-4PILE ?auto_17853 ?auto_17854 ?auto_17855 ?auto_17856 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_17857 - BLOCK
      ?auto_17858 - BLOCK
      ?auto_17859 - BLOCK
      ?auto_17860 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_17857 ) ( ON ?auto_17858 ?auto_17857 ) ( not ( = ?auto_17857 ?auto_17858 ) ) ( not ( = ?auto_17857 ?auto_17859 ) ) ( not ( = ?auto_17857 ?auto_17860 ) ) ( not ( = ?auto_17858 ?auto_17859 ) ) ( not ( = ?auto_17858 ?auto_17860 ) ) ( not ( = ?auto_17859 ?auto_17860 ) ) ( ON-TABLE ?auto_17860 ) ( CLEAR ?auto_17860 ) ( HOLDING ?auto_17859 ) ( CLEAR ?auto_17858 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_17857 ?auto_17858 ?auto_17859 )
      ( MAKE-4PILE ?auto_17857 ?auto_17858 ?auto_17859 ?auto_17860 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_17861 - BLOCK
      ?auto_17862 - BLOCK
      ?auto_17863 - BLOCK
      ?auto_17864 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_17861 ) ( ON ?auto_17862 ?auto_17861 ) ( not ( = ?auto_17861 ?auto_17862 ) ) ( not ( = ?auto_17861 ?auto_17863 ) ) ( not ( = ?auto_17861 ?auto_17864 ) ) ( not ( = ?auto_17862 ?auto_17863 ) ) ( not ( = ?auto_17862 ?auto_17864 ) ) ( not ( = ?auto_17863 ?auto_17864 ) ) ( ON-TABLE ?auto_17864 ) ( CLEAR ?auto_17862 ) ( ON ?auto_17863 ?auto_17864 ) ( CLEAR ?auto_17863 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_17864 )
      ( MAKE-4PILE ?auto_17861 ?auto_17862 ?auto_17863 ?auto_17864 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_17865 - BLOCK
      ?auto_17866 - BLOCK
      ?auto_17867 - BLOCK
      ?auto_17868 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_17865 ) ( not ( = ?auto_17865 ?auto_17866 ) ) ( not ( = ?auto_17865 ?auto_17867 ) ) ( not ( = ?auto_17865 ?auto_17868 ) ) ( not ( = ?auto_17866 ?auto_17867 ) ) ( not ( = ?auto_17866 ?auto_17868 ) ) ( not ( = ?auto_17867 ?auto_17868 ) ) ( ON-TABLE ?auto_17868 ) ( ON ?auto_17867 ?auto_17868 ) ( CLEAR ?auto_17867 ) ( HOLDING ?auto_17866 ) ( CLEAR ?auto_17865 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_17865 ?auto_17866 )
      ( MAKE-4PILE ?auto_17865 ?auto_17866 ?auto_17867 ?auto_17868 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_17869 - BLOCK
      ?auto_17870 - BLOCK
      ?auto_17871 - BLOCK
      ?auto_17872 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_17869 ) ( not ( = ?auto_17869 ?auto_17870 ) ) ( not ( = ?auto_17869 ?auto_17871 ) ) ( not ( = ?auto_17869 ?auto_17872 ) ) ( not ( = ?auto_17870 ?auto_17871 ) ) ( not ( = ?auto_17870 ?auto_17872 ) ) ( not ( = ?auto_17871 ?auto_17872 ) ) ( ON-TABLE ?auto_17872 ) ( ON ?auto_17871 ?auto_17872 ) ( CLEAR ?auto_17869 ) ( ON ?auto_17870 ?auto_17871 ) ( CLEAR ?auto_17870 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_17872 ?auto_17871 )
      ( MAKE-4PILE ?auto_17869 ?auto_17870 ?auto_17871 ?auto_17872 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_17873 - BLOCK
      ?auto_17874 - BLOCK
      ?auto_17875 - BLOCK
      ?auto_17876 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_17873 ?auto_17874 ) ) ( not ( = ?auto_17873 ?auto_17875 ) ) ( not ( = ?auto_17873 ?auto_17876 ) ) ( not ( = ?auto_17874 ?auto_17875 ) ) ( not ( = ?auto_17874 ?auto_17876 ) ) ( not ( = ?auto_17875 ?auto_17876 ) ) ( ON-TABLE ?auto_17876 ) ( ON ?auto_17875 ?auto_17876 ) ( ON ?auto_17874 ?auto_17875 ) ( CLEAR ?auto_17874 ) ( HOLDING ?auto_17873 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_17873 )
      ( MAKE-4PILE ?auto_17873 ?auto_17874 ?auto_17875 ?auto_17876 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_17877 - BLOCK
      ?auto_17878 - BLOCK
      ?auto_17879 - BLOCK
      ?auto_17880 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_17877 ?auto_17878 ) ) ( not ( = ?auto_17877 ?auto_17879 ) ) ( not ( = ?auto_17877 ?auto_17880 ) ) ( not ( = ?auto_17878 ?auto_17879 ) ) ( not ( = ?auto_17878 ?auto_17880 ) ) ( not ( = ?auto_17879 ?auto_17880 ) ) ( ON-TABLE ?auto_17880 ) ( ON ?auto_17879 ?auto_17880 ) ( ON ?auto_17878 ?auto_17879 ) ( ON ?auto_17877 ?auto_17878 ) ( CLEAR ?auto_17877 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_17880 ?auto_17879 ?auto_17878 )
      ( MAKE-4PILE ?auto_17877 ?auto_17878 ?auto_17879 ?auto_17880 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_17881 - BLOCK
      ?auto_17882 - BLOCK
      ?auto_17883 - BLOCK
      ?auto_17884 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_17881 ?auto_17882 ) ) ( not ( = ?auto_17881 ?auto_17883 ) ) ( not ( = ?auto_17881 ?auto_17884 ) ) ( not ( = ?auto_17882 ?auto_17883 ) ) ( not ( = ?auto_17882 ?auto_17884 ) ) ( not ( = ?auto_17883 ?auto_17884 ) ) ( ON-TABLE ?auto_17884 ) ( ON ?auto_17883 ?auto_17884 ) ( ON ?auto_17882 ?auto_17883 ) ( HOLDING ?auto_17881 ) ( CLEAR ?auto_17882 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_17884 ?auto_17883 ?auto_17882 ?auto_17881 )
      ( MAKE-4PILE ?auto_17881 ?auto_17882 ?auto_17883 ?auto_17884 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_17885 - BLOCK
      ?auto_17886 - BLOCK
      ?auto_17887 - BLOCK
      ?auto_17888 - BLOCK
    )
    :vars
    (
      ?auto_17889 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_17885 ?auto_17886 ) ) ( not ( = ?auto_17885 ?auto_17887 ) ) ( not ( = ?auto_17885 ?auto_17888 ) ) ( not ( = ?auto_17886 ?auto_17887 ) ) ( not ( = ?auto_17886 ?auto_17888 ) ) ( not ( = ?auto_17887 ?auto_17888 ) ) ( ON-TABLE ?auto_17888 ) ( ON ?auto_17887 ?auto_17888 ) ( ON ?auto_17886 ?auto_17887 ) ( CLEAR ?auto_17886 ) ( ON ?auto_17885 ?auto_17889 ) ( CLEAR ?auto_17885 ) ( HAND-EMPTY ) ( not ( = ?auto_17885 ?auto_17889 ) ) ( not ( = ?auto_17886 ?auto_17889 ) ) ( not ( = ?auto_17887 ?auto_17889 ) ) ( not ( = ?auto_17888 ?auto_17889 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_17885 ?auto_17889 )
      ( MAKE-4PILE ?auto_17885 ?auto_17886 ?auto_17887 ?auto_17888 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_17890 - BLOCK
      ?auto_17891 - BLOCK
      ?auto_17892 - BLOCK
      ?auto_17893 - BLOCK
    )
    :vars
    (
      ?auto_17894 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_17890 ?auto_17891 ) ) ( not ( = ?auto_17890 ?auto_17892 ) ) ( not ( = ?auto_17890 ?auto_17893 ) ) ( not ( = ?auto_17891 ?auto_17892 ) ) ( not ( = ?auto_17891 ?auto_17893 ) ) ( not ( = ?auto_17892 ?auto_17893 ) ) ( ON-TABLE ?auto_17893 ) ( ON ?auto_17892 ?auto_17893 ) ( ON ?auto_17890 ?auto_17894 ) ( CLEAR ?auto_17890 ) ( not ( = ?auto_17890 ?auto_17894 ) ) ( not ( = ?auto_17891 ?auto_17894 ) ) ( not ( = ?auto_17892 ?auto_17894 ) ) ( not ( = ?auto_17893 ?auto_17894 ) ) ( HOLDING ?auto_17891 ) ( CLEAR ?auto_17892 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_17893 ?auto_17892 ?auto_17891 )
      ( MAKE-4PILE ?auto_17890 ?auto_17891 ?auto_17892 ?auto_17893 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_17895 - BLOCK
      ?auto_17896 - BLOCK
      ?auto_17897 - BLOCK
      ?auto_17898 - BLOCK
    )
    :vars
    (
      ?auto_17899 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_17895 ?auto_17896 ) ) ( not ( = ?auto_17895 ?auto_17897 ) ) ( not ( = ?auto_17895 ?auto_17898 ) ) ( not ( = ?auto_17896 ?auto_17897 ) ) ( not ( = ?auto_17896 ?auto_17898 ) ) ( not ( = ?auto_17897 ?auto_17898 ) ) ( ON-TABLE ?auto_17898 ) ( ON ?auto_17897 ?auto_17898 ) ( ON ?auto_17895 ?auto_17899 ) ( not ( = ?auto_17895 ?auto_17899 ) ) ( not ( = ?auto_17896 ?auto_17899 ) ) ( not ( = ?auto_17897 ?auto_17899 ) ) ( not ( = ?auto_17898 ?auto_17899 ) ) ( CLEAR ?auto_17897 ) ( ON ?auto_17896 ?auto_17895 ) ( CLEAR ?auto_17896 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_17899 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_17899 ?auto_17895 )
      ( MAKE-4PILE ?auto_17895 ?auto_17896 ?auto_17897 ?auto_17898 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_17900 - BLOCK
      ?auto_17901 - BLOCK
      ?auto_17902 - BLOCK
      ?auto_17903 - BLOCK
    )
    :vars
    (
      ?auto_17904 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_17900 ?auto_17901 ) ) ( not ( = ?auto_17900 ?auto_17902 ) ) ( not ( = ?auto_17900 ?auto_17903 ) ) ( not ( = ?auto_17901 ?auto_17902 ) ) ( not ( = ?auto_17901 ?auto_17903 ) ) ( not ( = ?auto_17902 ?auto_17903 ) ) ( ON-TABLE ?auto_17903 ) ( ON ?auto_17900 ?auto_17904 ) ( not ( = ?auto_17900 ?auto_17904 ) ) ( not ( = ?auto_17901 ?auto_17904 ) ) ( not ( = ?auto_17902 ?auto_17904 ) ) ( not ( = ?auto_17903 ?auto_17904 ) ) ( ON ?auto_17901 ?auto_17900 ) ( CLEAR ?auto_17901 ) ( ON-TABLE ?auto_17904 ) ( HOLDING ?auto_17902 ) ( CLEAR ?auto_17903 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_17903 ?auto_17902 )
      ( MAKE-4PILE ?auto_17900 ?auto_17901 ?auto_17902 ?auto_17903 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_17905 - BLOCK
      ?auto_17906 - BLOCK
      ?auto_17907 - BLOCK
      ?auto_17908 - BLOCK
    )
    :vars
    (
      ?auto_17909 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_17905 ?auto_17906 ) ) ( not ( = ?auto_17905 ?auto_17907 ) ) ( not ( = ?auto_17905 ?auto_17908 ) ) ( not ( = ?auto_17906 ?auto_17907 ) ) ( not ( = ?auto_17906 ?auto_17908 ) ) ( not ( = ?auto_17907 ?auto_17908 ) ) ( ON-TABLE ?auto_17908 ) ( ON ?auto_17905 ?auto_17909 ) ( not ( = ?auto_17905 ?auto_17909 ) ) ( not ( = ?auto_17906 ?auto_17909 ) ) ( not ( = ?auto_17907 ?auto_17909 ) ) ( not ( = ?auto_17908 ?auto_17909 ) ) ( ON ?auto_17906 ?auto_17905 ) ( ON-TABLE ?auto_17909 ) ( CLEAR ?auto_17908 ) ( ON ?auto_17907 ?auto_17906 ) ( CLEAR ?auto_17907 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_17909 ?auto_17905 ?auto_17906 )
      ( MAKE-4PILE ?auto_17905 ?auto_17906 ?auto_17907 ?auto_17908 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_17910 - BLOCK
      ?auto_17911 - BLOCK
      ?auto_17912 - BLOCK
      ?auto_17913 - BLOCK
    )
    :vars
    (
      ?auto_17914 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_17910 ?auto_17911 ) ) ( not ( = ?auto_17910 ?auto_17912 ) ) ( not ( = ?auto_17910 ?auto_17913 ) ) ( not ( = ?auto_17911 ?auto_17912 ) ) ( not ( = ?auto_17911 ?auto_17913 ) ) ( not ( = ?auto_17912 ?auto_17913 ) ) ( ON ?auto_17910 ?auto_17914 ) ( not ( = ?auto_17910 ?auto_17914 ) ) ( not ( = ?auto_17911 ?auto_17914 ) ) ( not ( = ?auto_17912 ?auto_17914 ) ) ( not ( = ?auto_17913 ?auto_17914 ) ) ( ON ?auto_17911 ?auto_17910 ) ( ON-TABLE ?auto_17914 ) ( ON ?auto_17912 ?auto_17911 ) ( CLEAR ?auto_17912 ) ( HOLDING ?auto_17913 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_17913 )
      ( MAKE-4PILE ?auto_17910 ?auto_17911 ?auto_17912 ?auto_17913 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_17915 - BLOCK
      ?auto_17916 - BLOCK
      ?auto_17917 - BLOCK
      ?auto_17918 - BLOCK
    )
    :vars
    (
      ?auto_17919 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_17915 ?auto_17916 ) ) ( not ( = ?auto_17915 ?auto_17917 ) ) ( not ( = ?auto_17915 ?auto_17918 ) ) ( not ( = ?auto_17916 ?auto_17917 ) ) ( not ( = ?auto_17916 ?auto_17918 ) ) ( not ( = ?auto_17917 ?auto_17918 ) ) ( ON ?auto_17915 ?auto_17919 ) ( not ( = ?auto_17915 ?auto_17919 ) ) ( not ( = ?auto_17916 ?auto_17919 ) ) ( not ( = ?auto_17917 ?auto_17919 ) ) ( not ( = ?auto_17918 ?auto_17919 ) ) ( ON ?auto_17916 ?auto_17915 ) ( ON-TABLE ?auto_17919 ) ( ON ?auto_17917 ?auto_17916 ) ( ON ?auto_17918 ?auto_17917 ) ( CLEAR ?auto_17918 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_17919 ?auto_17915 ?auto_17916 ?auto_17917 )
      ( MAKE-4PILE ?auto_17915 ?auto_17916 ?auto_17917 ?auto_17918 ) )
  )

)

