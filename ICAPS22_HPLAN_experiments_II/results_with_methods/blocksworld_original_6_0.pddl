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

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_39366 - BLOCK
      ?auto_39367 - BLOCK
      ?auto_39368 - BLOCK
      ?auto_39369 - BLOCK
      ?auto_39370 - BLOCK
      ?auto_39371 - BLOCK
    )
    :vars
    (
      ?auto_39372 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_39372 ?auto_39371 ) ( CLEAR ?auto_39372 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_39366 ) ( ON ?auto_39367 ?auto_39366 ) ( ON ?auto_39368 ?auto_39367 ) ( ON ?auto_39369 ?auto_39368 ) ( ON ?auto_39370 ?auto_39369 ) ( ON ?auto_39371 ?auto_39370 ) ( not ( = ?auto_39366 ?auto_39367 ) ) ( not ( = ?auto_39366 ?auto_39368 ) ) ( not ( = ?auto_39366 ?auto_39369 ) ) ( not ( = ?auto_39366 ?auto_39370 ) ) ( not ( = ?auto_39366 ?auto_39371 ) ) ( not ( = ?auto_39366 ?auto_39372 ) ) ( not ( = ?auto_39367 ?auto_39368 ) ) ( not ( = ?auto_39367 ?auto_39369 ) ) ( not ( = ?auto_39367 ?auto_39370 ) ) ( not ( = ?auto_39367 ?auto_39371 ) ) ( not ( = ?auto_39367 ?auto_39372 ) ) ( not ( = ?auto_39368 ?auto_39369 ) ) ( not ( = ?auto_39368 ?auto_39370 ) ) ( not ( = ?auto_39368 ?auto_39371 ) ) ( not ( = ?auto_39368 ?auto_39372 ) ) ( not ( = ?auto_39369 ?auto_39370 ) ) ( not ( = ?auto_39369 ?auto_39371 ) ) ( not ( = ?auto_39369 ?auto_39372 ) ) ( not ( = ?auto_39370 ?auto_39371 ) ) ( not ( = ?auto_39370 ?auto_39372 ) ) ( not ( = ?auto_39371 ?auto_39372 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_39372 ?auto_39371 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_39374 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_39374 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_39374 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_39375 - BLOCK
    )
    :vars
    (
      ?auto_39376 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_39375 ?auto_39376 ) ( CLEAR ?auto_39375 ) ( HAND-EMPTY ) ( not ( = ?auto_39375 ?auto_39376 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_39375 ?auto_39376 )
      ( MAKE-1PILE ?auto_39375 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_39382 - BLOCK
      ?auto_39383 - BLOCK
      ?auto_39384 - BLOCK
      ?auto_39385 - BLOCK
      ?auto_39386 - BLOCK
    )
    :vars
    (
      ?auto_39387 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_39387 ?auto_39386 ) ( CLEAR ?auto_39387 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_39382 ) ( ON ?auto_39383 ?auto_39382 ) ( ON ?auto_39384 ?auto_39383 ) ( ON ?auto_39385 ?auto_39384 ) ( ON ?auto_39386 ?auto_39385 ) ( not ( = ?auto_39382 ?auto_39383 ) ) ( not ( = ?auto_39382 ?auto_39384 ) ) ( not ( = ?auto_39382 ?auto_39385 ) ) ( not ( = ?auto_39382 ?auto_39386 ) ) ( not ( = ?auto_39382 ?auto_39387 ) ) ( not ( = ?auto_39383 ?auto_39384 ) ) ( not ( = ?auto_39383 ?auto_39385 ) ) ( not ( = ?auto_39383 ?auto_39386 ) ) ( not ( = ?auto_39383 ?auto_39387 ) ) ( not ( = ?auto_39384 ?auto_39385 ) ) ( not ( = ?auto_39384 ?auto_39386 ) ) ( not ( = ?auto_39384 ?auto_39387 ) ) ( not ( = ?auto_39385 ?auto_39386 ) ) ( not ( = ?auto_39385 ?auto_39387 ) ) ( not ( = ?auto_39386 ?auto_39387 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_39387 ?auto_39386 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_39388 - BLOCK
      ?auto_39389 - BLOCK
      ?auto_39390 - BLOCK
      ?auto_39391 - BLOCK
      ?auto_39392 - BLOCK
    )
    :vars
    (
      ?auto_39393 - BLOCK
      ?auto_39394 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_39393 ?auto_39392 ) ( CLEAR ?auto_39393 ) ( ON-TABLE ?auto_39388 ) ( ON ?auto_39389 ?auto_39388 ) ( ON ?auto_39390 ?auto_39389 ) ( ON ?auto_39391 ?auto_39390 ) ( ON ?auto_39392 ?auto_39391 ) ( not ( = ?auto_39388 ?auto_39389 ) ) ( not ( = ?auto_39388 ?auto_39390 ) ) ( not ( = ?auto_39388 ?auto_39391 ) ) ( not ( = ?auto_39388 ?auto_39392 ) ) ( not ( = ?auto_39388 ?auto_39393 ) ) ( not ( = ?auto_39389 ?auto_39390 ) ) ( not ( = ?auto_39389 ?auto_39391 ) ) ( not ( = ?auto_39389 ?auto_39392 ) ) ( not ( = ?auto_39389 ?auto_39393 ) ) ( not ( = ?auto_39390 ?auto_39391 ) ) ( not ( = ?auto_39390 ?auto_39392 ) ) ( not ( = ?auto_39390 ?auto_39393 ) ) ( not ( = ?auto_39391 ?auto_39392 ) ) ( not ( = ?auto_39391 ?auto_39393 ) ) ( not ( = ?auto_39392 ?auto_39393 ) ) ( HOLDING ?auto_39394 ) ( not ( = ?auto_39388 ?auto_39394 ) ) ( not ( = ?auto_39389 ?auto_39394 ) ) ( not ( = ?auto_39390 ?auto_39394 ) ) ( not ( = ?auto_39391 ?auto_39394 ) ) ( not ( = ?auto_39392 ?auto_39394 ) ) ( not ( = ?auto_39393 ?auto_39394 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_39394 )
      ( MAKE-5PILE ?auto_39388 ?auto_39389 ?auto_39390 ?auto_39391 ?auto_39392 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_39395 - BLOCK
      ?auto_39396 - BLOCK
      ?auto_39397 - BLOCK
      ?auto_39398 - BLOCK
      ?auto_39399 - BLOCK
    )
    :vars
    (
      ?auto_39400 - BLOCK
      ?auto_39401 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_39400 ?auto_39399 ) ( ON-TABLE ?auto_39395 ) ( ON ?auto_39396 ?auto_39395 ) ( ON ?auto_39397 ?auto_39396 ) ( ON ?auto_39398 ?auto_39397 ) ( ON ?auto_39399 ?auto_39398 ) ( not ( = ?auto_39395 ?auto_39396 ) ) ( not ( = ?auto_39395 ?auto_39397 ) ) ( not ( = ?auto_39395 ?auto_39398 ) ) ( not ( = ?auto_39395 ?auto_39399 ) ) ( not ( = ?auto_39395 ?auto_39400 ) ) ( not ( = ?auto_39396 ?auto_39397 ) ) ( not ( = ?auto_39396 ?auto_39398 ) ) ( not ( = ?auto_39396 ?auto_39399 ) ) ( not ( = ?auto_39396 ?auto_39400 ) ) ( not ( = ?auto_39397 ?auto_39398 ) ) ( not ( = ?auto_39397 ?auto_39399 ) ) ( not ( = ?auto_39397 ?auto_39400 ) ) ( not ( = ?auto_39398 ?auto_39399 ) ) ( not ( = ?auto_39398 ?auto_39400 ) ) ( not ( = ?auto_39399 ?auto_39400 ) ) ( not ( = ?auto_39395 ?auto_39401 ) ) ( not ( = ?auto_39396 ?auto_39401 ) ) ( not ( = ?auto_39397 ?auto_39401 ) ) ( not ( = ?auto_39398 ?auto_39401 ) ) ( not ( = ?auto_39399 ?auto_39401 ) ) ( not ( = ?auto_39400 ?auto_39401 ) ) ( ON ?auto_39401 ?auto_39400 ) ( CLEAR ?auto_39401 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_39395 ?auto_39396 ?auto_39397 ?auto_39398 ?auto_39399 ?auto_39400 )
      ( MAKE-5PILE ?auto_39395 ?auto_39396 ?auto_39397 ?auto_39398 ?auto_39399 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_39404 - BLOCK
      ?auto_39405 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_39405 ) ( CLEAR ?auto_39404 ) ( ON-TABLE ?auto_39404 ) ( not ( = ?auto_39404 ?auto_39405 ) ) )
    :subtasks
    ( ( !STACK ?auto_39405 ?auto_39404 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_39406 - BLOCK
      ?auto_39407 - BLOCK
    )
    :vars
    (
      ?auto_39408 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_39406 ) ( ON-TABLE ?auto_39406 ) ( not ( = ?auto_39406 ?auto_39407 ) ) ( ON ?auto_39407 ?auto_39408 ) ( CLEAR ?auto_39407 ) ( HAND-EMPTY ) ( not ( = ?auto_39406 ?auto_39408 ) ) ( not ( = ?auto_39407 ?auto_39408 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_39407 ?auto_39408 )
      ( MAKE-2PILE ?auto_39406 ?auto_39407 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_39409 - BLOCK
      ?auto_39410 - BLOCK
    )
    :vars
    (
      ?auto_39411 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_39409 ?auto_39410 ) ) ( ON ?auto_39410 ?auto_39411 ) ( CLEAR ?auto_39410 ) ( not ( = ?auto_39409 ?auto_39411 ) ) ( not ( = ?auto_39410 ?auto_39411 ) ) ( HOLDING ?auto_39409 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_39409 )
      ( MAKE-2PILE ?auto_39409 ?auto_39410 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_39412 - BLOCK
      ?auto_39413 - BLOCK
    )
    :vars
    (
      ?auto_39414 - BLOCK
      ?auto_39415 - BLOCK
      ?auto_39416 - BLOCK
      ?auto_39418 - BLOCK
      ?auto_39417 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_39412 ?auto_39413 ) ) ( ON ?auto_39413 ?auto_39414 ) ( not ( = ?auto_39412 ?auto_39414 ) ) ( not ( = ?auto_39413 ?auto_39414 ) ) ( ON ?auto_39412 ?auto_39413 ) ( CLEAR ?auto_39412 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_39415 ) ( ON ?auto_39416 ?auto_39415 ) ( ON ?auto_39418 ?auto_39416 ) ( ON ?auto_39417 ?auto_39418 ) ( ON ?auto_39414 ?auto_39417 ) ( not ( = ?auto_39415 ?auto_39416 ) ) ( not ( = ?auto_39415 ?auto_39418 ) ) ( not ( = ?auto_39415 ?auto_39417 ) ) ( not ( = ?auto_39415 ?auto_39414 ) ) ( not ( = ?auto_39415 ?auto_39413 ) ) ( not ( = ?auto_39415 ?auto_39412 ) ) ( not ( = ?auto_39416 ?auto_39418 ) ) ( not ( = ?auto_39416 ?auto_39417 ) ) ( not ( = ?auto_39416 ?auto_39414 ) ) ( not ( = ?auto_39416 ?auto_39413 ) ) ( not ( = ?auto_39416 ?auto_39412 ) ) ( not ( = ?auto_39418 ?auto_39417 ) ) ( not ( = ?auto_39418 ?auto_39414 ) ) ( not ( = ?auto_39418 ?auto_39413 ) ) ( not ( = ?auto_39418 ?auto_39412 ) ) ( not ( = ?auto_39417 ?auto_39414 ) ) ( not ( = ?auto_39417 ?auto_39413 ) ) ( not ( = ?auto_39417 ?auto_39412 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_39415 ?auto_39416 ?auto_39418 ?auto_39417 ?auto_39414 ?auto_39413 )
      ( MAKE-2PILE ?auto_39412 ?auto_39413 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_39423 - BLOCK
      ?auto_39424 - BLOCK
      ?auto_39425 - BLOCK
      ?auto_39426 - BLOCK
    )
    :vars
    (
      ?auto_39427 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_39427 ?auto_39426 ) ( CLEAR ?auto_39427 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_39423 ) ( ON ?auto_39424 ?auto_39423 ) ( ON ?auto_39425 ?auto_39424 ) ( ON ?auto_39426 ?auto_39425 ) ( not ( = ?auto_39423 ?auto_39424 ) ) ( not ( = ?auto_39423 ?auto_39425 ) ) ( not ( = ?auto_39423 ?auto_39426 ) ) ( not ( = ?auto_39423 ?auto_39427 ) ) ( not ( = ?auto_39424 ?auto_39425 ) ) ( not ( = ?auto_39424 ?auto_39426 ) ) ( not ( = ?auto_39424 ?auto_39427 ) ) ( not ( = ?auto_39425 ?auto_39426 ) ) ( not ( = ?auto_39425 ?auto_39427 ) ) ( not ( = ?auto_39426 ?auto_39427 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_39427 ?auto_39426 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_39428 - BLOCK
      ?auto_39429 - BLOCK
      ?auto_39430 - BLOCK
      ?auto_39431 - BLOCK
    )
    :vars
    (
      ?auto_39432 - BLOCK
      ?auto_39433 - BLOCK
      ?auto_39434 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_39432 ?auto_39431 ) ( CLEAR ?auto_39432 ) ( ON-TABLE ?auto_39428 ) ( ON ?auto_39429 ?auto_39428 ) ( ON ?auto_39430 ?auto_39429 ) ( ON ?auto_39431 ?auto_39430 ) ( not ( = ?auto_39428 ?auto_39429 ) ) ( not ( = ?auto_39428 ?auto_39430 ) ) ( not ( = ?auto_39428 ?auto_39431 ) ) ( not ( = ?auto_39428 ?auto_39432 ) ) ( not ( = ?auto_39429 ?auto_39430 ) ) ( not ( = ?auto_39429 ?auto_39431 ) ) ( not ( = ?auto_39429 ?auto_39432 ) ) ( not ( = ?auto_39430 ?auto_39431 ) ) ( not ( = ?auto_39430 ?auto_39432 ) ) ( not ( = ?auto_39431 ?auto_39432 ) ) ( HOLDING ?auto_39433 ) ( CLEAR ?auto_39434 ) ( not ( = ?auto_39428 ?auto_39433 ) ) ( not ( = ?auto_39428 ?auto_39434 ) ) ( not ( = ?auto_39429 ?auto_39433 ) ) ( not ( = ?auto_39429 ?auto_39434 ) ) ( not ( = ?auto_39430 ?auto_39433 ) ) ( not ( = ?auto_39430 ?auto_39434 ) ) ( not ( = ?auto_39431 ?auto_39433 ) ) ( not ( = ?auto_39431 ?auto_39434 ) ) ( not ( = ?auto_39432 ?auto_39433 ) ) ( not ( = ?auto_39432 ?auto_39434 ) ) ( not ( = ?auto_39433 ?auto_39434 ) ) )
    :subtasks
    ( ( !STACK ?auto_39433 ?auto_39434 )
      ( MAKE-4PILE ?auto_39428 ?auto_39429 ?auto_39430 ?auto_39431 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_39435 - BLOCK
      ?auto_39436 - BLOCK
      ?auto_39437 - BLOCK
      ?auto_39438 - BLOCK
    )
    :vars
    (
      ?auto_39439 - BLOCK
      ?auto_39440 - BLOCK
      ?auto_39441 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_39439 ?auto_39438 ) ( ON-TABLE ?auto_39435 ) ( ON ?auto_39436 ?auto_39435 ) ( ON ?auto_39437 ?auto_39436 ) ( ON ?auto_39438 ?auto_39437 ) ( not ( = ?auto_39435 ?auto_39436 ) ) ( not ( = ?auto_39435 ?auto_39437 ) ) ( not ( = ?auto_39435 ?auto_39438 ) ) ( not ( = ?auto_39435 ?auto_39439 ) ) ( not ( = ?auto_39436 ?auto_39437 ) ) ( not ( = ?auto_39436 ?auto_39438 ) ) ( not ( = ?auto_39436 ?auto_39439 ) ) ( not ( = ?auto_39437 ?auto_39438 ) ) ( not ( = ?auto_39437 ?auto_39439 ) ) ( not ( = ?auto_39438 ?auto_39439 ) ) ( CLEAR ?auto_39440 ) ( not ( = ?auto_39435 ?auto_39441 ) ) ( not ( = ?auto_39435 ?auto_39440 ) ) ( not ( = ?auto_39436 ?auto_39441 ) ) ( not ( = ?auto_39436 ?auto_39440 ) ) ( not ( = ?auto_39437 ?auto_39441 ) ) ( not ( = ?auto_39437 ?auto_39440 ) ) ( not ( = ?auto_39438 ?auto_39441 ) ) ( not ( = ?auto_39438 ?auto_39440 ) ) ( not ( = ?auto_39439 ?auto_39441 ) ) ( not ( = ?auto_39439 ?auto_39440 ) ) ( not ( = ?auto_39441 ?auto_39440 ) ) ( ON ?auto_39441 ?auto_39439 ) ( CLEAR ?auto_39441 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_39435 ?auto_39436 ?auto_39437 ?auto_39438 ?auto_39439 )
      ( MAKE-4PILE ?auto_39435 ?auto_39436 ?auto_39437 ?auto_39438 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_39442 - BLOCK
      ?auto_39443 - BLOCK
      ?auto_39444 - BLOCK
      ?auto_39445 - BLOCK
    )
    :vars
    (
      ?auto_39447 - BLOCK
      ?auto_39448 - BLOCK
      ?auto_39446 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_39447 ?auto_39445 ) ( ON-TABLE ?auto_39442 ) ( ON ?auto_39443 ?auto_39442 ) ( ON ?auto_39444 ?auto_39443 ) ( ON ?auto_39445 ?auto_39444 ) ( not ( = ?auto_39442 ?auto_39443 ) ) ( not ( = ?auto_39442 ?auto_39444 ) ) ( not ( = ?auto_39442 ?auto_39445 ) ) ( not ( = ?auto_39442 ?auto_39447 ) ) ( not ( = ?auto_39443 ?auto_39444 ) ) ( not ( = ?auto_39443 ?auto_39445 ) ) ( not ( = ?auto_39443 ?auto_39447 ) ) ( not ( = ?auto_39444 ?auto_39445 ) ) ( not ( = ?auto_39444 ?auto_39447 ) ) ( not ( = ?auto_39445 ?auto_39447 ) ) ( not ( = ?auto_39442 ?auto_39448 ) ) ( not ( = ?auto_39442 ?auto_39446 ) ) ( not ( = ?auto_39443 ?auto_39448 ) ) ( not ( = ?auto_39443 ?auto_39446 ) ) ( not ( = ?auto_39444 ?auto_39448 ) ) ( not ( = ?auto_39444 ?auto_39446 ) ) ( not ( = ?auto_39445 ?auto_39448 ) ) ( not ( = ?auto_39445 ?auto_39446 ) ) ( not ( = ?auto_39447 ?auto_39448 ) ) ( not ( = ?auto_39447 ?auto_39446 ) ) ( not ( = ?auto_39448 ?auto_39446 ) ) ( ON ?auto_39448 ?auto_39447 ) ( CLEAR ?auto_39448 ) ( HOLDING ?auto_39446 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_39446 )
      ( MAKE-4PILE ?auto_39442 ?auto_39443 ?auto_39444 ?auto_39445 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_39449 - BLOCK
      ?auto_39450 - BLOCK
      ?auto_39451 - BLOCK
      ?auto_39452 - BLOCK
    )
    :vars
    (
      ?auto_39455 - BLOCK
      ?auto_39453 - BLOCK
      ?auto_39454 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_39455 ?auto_39452 ) ( ON-TABLE ?auto_39449 ) ( ON ?auto_39450 ?auto_39449 ) ( ON ?auto_39451 ?auto_39450 ) ( ON ?auto_39452 ?auto_39451 ) ( not ( = ?auto_39449 ?auto_39450 ) ) ( not ( = ?auto_39449 ?auto_39451 ) ) ( not ( = ?auto_39449 ?auto_39452 ) ) ( not ( = ?auto_39449 ?auto_39455 ) ) ( not ( = ?auto_39450 ?auto_39451 ) ) ( not ( = ?auto_39450 ?auto_39452 ) ) ( not ( = ?auto_39450 ?auto_39455 ) ) ( not ( = ?auto_39451 ?auto_39452 ) ) ( not ( = ?auto_39451 ?auto_39455 ) ) ( not ( = ?auto_39452 ?auto_39455 ) ) ( not ( = ?auto_39449 ?auto_39453 ) ) ( not ( = ?auto_39449 ?auto_39454 ) ) ( not ( = ?auto_39450 ?auto_39453 ) ) ( not ( = ?auto_39450 ?auto_39454 ) ) ( not ( = ?auto_39451 ?auto_39453 ) ) ( not ( = ?auto_39451 ?auto_39454 ) ) ( not ( = ?auto_39452 ?auto_39453 ) ) ( not ( = ?auto_39452 ?auto_39454 ) ) ( not ( = ?auto_39455 ?auto_39453 ) ) ( not ( = ?auto_39455 ?auto_39454 ) ) ( not ( = ?auto_39453 ?auto_39454 ) ) ( ON ?auto_39453 ?auto_39455 ) ( ON ?auto_39454 ?auto_39453 ) ( CLEAR ?auto_39454 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_39449 ?auto_39450 ?auto_39451 ?auto_39452 ?auto_39455 ?auto_39453 )
      ( MAKE-4PILE ?auto_39449 ?auto_39450 ?auto_39451 ?auto_39452 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_39459 - BLOCK
      ?auto_39460 - BLOCK
      ?auto_39461 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_39461 ) ( CLEAR ?auto_39460 ) ( ON-TABLE ?auto_39459 ) ( ON ?auto_39460 ?auto_39459 ) ( not ( = ?auto_39459 ?auto_39460 ) ) ( not ( = ?auto_39459 ?auto_39461 ) ) ( not ( = ?auto_39460 ?auto_39461 ) ) )
    :subtasks
    ( ( !STACK ?auto_39461 ?auto_39460 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_39462 - BLOCK
      ?auto_39463 - BLOCK
      ?auto_39464 - BLOCK
    )
    :vars
    (
      ?auto_39465 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_39463 ) ( ON-TABLE ?auto_39462 ) ( ON ?auto_39463 ?auto_39462 ) ( not ( = ?auto_39462 ?auto_39463 ) ) ( not ( = ?auto_39462 ?auto_39464 ) ) ( not ( = ?auto_39463 ?auto_39464 ) ) ( ON ?auto_39464 ?auto_39465 ) ( CLEAR ?auto_39464 ) ( HAND-EMPTY ) ( not ( = ?auto_39462 ?auto_39465 ) ) ( not ( = ?auto_39463 ?auto_39465 ) ) ( not ( = ?auto_39464 ?auto_39465 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_39464 ?auto_39465 )
      ( MAKE-3PILE ?auto_39462 ?auto_39463 ?auto_39464 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_39466 - BLOCK
      ?auto_39467 - BLOCK
      ?auto_39468 - BLOCK
    )
    :vars
    (
      ?auto_39469 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_39466 ) ( not ( = ?auto_39466 ?auto_39467 ) ) ( not ( = ?auto_39466 ?auto_39468 ) ) ( not ( = ?auto_39467 ?auto_39468 ) ) ( ON ?auto_39468 ?auto_39469 ) ( CLEAR ?auto_39468 ) ( not ( = ?auto_39466 ?auto_39469 ) ) ( not ( = ?auto_39467 ?auto_39469 ) ) ( not ( = ?auto_39468 ?auto_39469 ) ) ( HOLDING ?auto_39467 ) ( CLEAR ?auto_39466 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_39466 ?auto_39467 )
      ( MAKE-3PILE ?auto_39466 ?auto_39467 ?auto_39468 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_39470 - BLOCK
      ?auto_39471 - BLOCK
      ?auto_39472 - BLOCK
    )
    :vars
    (
      ?auto_39473 - BLOCK
      ?auto_39476 - BLOCK
      ?auto_39474 - BLOCK
      ?auto_39475 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_39470 ) ( not ( = ?auto_39470 ?auto_39471 ) ) ( not ( = ?auto_39470 ?auto_39472 ) ) ( not ( = ?auto_39471 ?auto_39472 ) ) ( ON ?auto_39472 ?auto_39473 ) ( not ( = ?auto_39470 ?auto_39473 ) ) ( not ( = ?auto_39471 ?auto_39473 ) ) ( not ( = ?auto_39472 ?auto_39473 ) ) ( CLEAR ?auto_39470 ) ( ON ?auto_39471 ?auto_39472 ) ( CLEAR ?auto_39471 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_39476 ) ( ON ?auto_39474 ?auto_39476 ) ( ON ?auto_39475 ?auto_39474 ) ( ON ?auto_39473 ?auto_39475 ) ( not ( = ?auto_39476 ?auto_39474 ) ) ( not ( = ?auto_39476 ?auto_39475 ) ) ( not ( = ?auto_39476 ?auto_39473 ) ) ( not ( = ?auto_39476 ?auto_39472 ) ) ( not ( = ?auto_39476 ?auto_39471 ) ) ( not ( = ?auto_39474 ?auto_39475 ) ) ( not ( = ?auto_39474 ?auto_39473 ) ) ( not ( = ?auto_39474 ?auto_39472 ) ) ( not ( = ?auto_39474 ?auto_39471 ) ) ( not ( = ?auto_39475 ?auto_39473 ) ) ( not ( = ?auto_39475 ?auto_39472 ) ) ( not ( = ?auto_39475 ?auto_39471 ) ) ( not ( = ?auto_39470 ?auto_39476 ) ) ( not ( = ?auto_39470 ?auto_39474 ) ) ( not ( = ?auto_39470 ?auto_39475 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_39476 ?auto_39474 ?auto_39475 ?auto_39473 ?auto_39472 )
      ( MAKE-3PILE ?auto_39470 ?auto_39471 ?auto_39472 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_39477 - BLOCK
      ?auto_39478 - BLOCK
      ?auto_39479 - BLOCK
    )
    :vars
    (
      ?auto_39480 - BLOCK
      ?auto_39482 - BLOCK
      ?auto_39481 - BLOCK
      ?auto_39483 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_39477 ?auto_39478 ) ) ( not ( = ?auto_39477 ?auto_39479 ) ) ( not ( = ?auto_39478 ?auto_39479 ) ) ( ON ?auto_39479 ?auto_39480 ) ( not ( = ?auto_39477 ?auto_39480 ) ) ( not ( = ?auto_39478 ?auto_39480 ) ) ( not ( = ?auto_39479 ?auto_39480 ) ) ( ON ?auto_39478 ?auto_39479 ) ( CLEAR ?auto_39478 ) ( ON-TABLE ?auto_39482 ) ( ON ?auto_39481 ?auto_39482 ) ( ON ?auto_39483 ?auto_39481 ) ( ON ?auto_39480 ?auto_39483 ) ( not ( = ?auto_39482 ?auto_39481 ) ) ( not ( = ?auto_39482 ?auto_39483 ) ) ( not ( = ?auto_39482 ?auto_39480 ) ) ( not ( = ?auto_39482 ?auto_39479 ) ) ( not ( = ?auto_39482 ?auto_39478 ) ) ( not ( = ?auto_39481 ?auto_39483 ) ) ( not ( = ?auto_39481 ?auto_39480 ) ) ( not ( = ?auto_39481 ?auto_39479 ) ) ( not ( = ?auto_39481 ?auto_39478 ) ) ( not ( = ?auto_39483 ?auto_39480 ) ) ( not ( = ?auto_39483 ?auto_39479 ) ) ( not ( = ?auto_39483 ?auto_39478 ) ) ( not ( = ?auto_39477 ?auto_39482 ) ) ( not ( = ?auto_39477 ?auto_39481 ) ) ( not ( = ?auto_39477 ?auto_39483 ) ) ( HOLDING ?auto_39477 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_39477 )
      ( MAKE-3PILE ?auto_39477 ?auto_39478 ?auto_39479 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_39484 - BLOCK
      ?auto_39485 - BLOCK
      ?auto_39486 - BLOCK
    )
    :vars
    (
      ?auto_39488 - BLOCK
      ?auto_39490 - BLOCK
      ?auto_39489 - BLOCK
      ?auto_39487 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_39484 ?auto_39485 ) ) ( not ( = ?auto_39484 ?auto_39486 ) ) ( not ( = ?auto_39485 ?auto_39486 ) ) ( ON ?auto_39486 ?auto_39488 ) ( not ( = ?auto_39484 ?auto_39488 ) ) ( not ( = ?auto_39485 ?auto_39488 ) ) ( not ( = ?auto_39486 ?auto_39488 ) ) ( ON ?auto_39485 ?auto_39486 ) ( ON-TABLE ?auto_39490 ) ( ON ?auto_39489 ?auto_39490 ) ( ON ?auto_39487 ?auto_39489 ) ( ON ?auto_39488 ?auto_39487 ) ( not ( = ?auto_39490 ?auto_39489 ) ) ( not ( = ?auto_39490 ?auto_39487 ) ) ( not ( = ?auto_39490 ?auto_39488 ) ) ( not ( = ?auto_39490 ?auto_39486 ) ) ( not ( = ?auto_39490 ?auto_39485 ) ) ( not ( = ?auto_39489 ?auto_39487 ) ) ( not ( = ?auto_39489 ?auto_39488 ) ) ( not ( = ?auto_39489 ?auto_39486 ) ) ( not ( = ?auto_39489 ?auto_39485 ) ) ( not ( = ?auto_39487 ?auto_39488 ) ) ( not ( = ?auto_39487 ?auto_39486 ) ) ( not ( = ?auto_39487 ?auto_39485 ) ) ( not ( = ?auto_39484 ?auto_39490 ) ) ( not ( = ?auto_39484 ?auto_39489 ) ) ( not ( = ?auto_39484 ?auto_39487 ) ) ( ON ?auto_39484 ?auto_39485 ) ( CLEAR ?auto_39484 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_39490 ?auto_39489 ?auto_39487 ?auto_39488 ?auto_39486 ?auto_39485 )
      ( MAKE-3PILE ?auto_39484 ?auto_39485 ?auto_39486 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_39494 - BLOCK
      ?auto_39495 - BLOCK
      ?auto_39496 - BLOCK
    )
    :vars
    (
      ?auto_39497 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_39497 ?auto_39496 ) ( CLEAR ?auto_39497 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_39494 ) ( ON ?auto_39495 ?auto_39494 ) ( ON ?auto_39496 ?auto_39495 ) ( not ( = ?auto_39494 ?auto_39495 ) ) ( not ( = ?auto_39494 ?auto_39496 ) ) ( not ( = ?auto_39494 ?auto_39497 ) ) ( not ( = ?auto_39495 ?auto_39496 ) ) ( not ( = ?auto_39495 ?auto_39497 ) ) ( not ( = ?auto_39496 ?auto_39497 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_39497 ?auto_39496 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_39498 - BLOCK
      ?auto_39499 - BLOCK
      ?auto_39500 - BLOCK
    )
    :vars
    (
      ?auto_39501 - BLOCK
      ?auto_39502 - BLOCK
      ?auto_39503 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_39501 ?auto_39500 ) ( CLEAR ?auto_39501 ) ( ON-TABLE ?auto_39498 ) ( ON ?auto_39499 ?auto_39498 ) ( ON ?auto_39500 ?auto_39499 ) ( not ( = ?auto_39498 ?auto_39499 ) ) ( not ( = ?auto_39498 ?auto_39500 ) ) ( not ( = ?auto_39498 ?auto_39501 ) ) ( not ( = ?auto_39499 ?auto_39500 ) ) ( not ( = ?auto_39499 ?auto_39501 ) ) ( not ( = ?auto_39500 ?auto_39501 ) ) ( HOLDING ?auto_39502 ) ( CLEAR ?auto_39503 ) ( not ( = ?auto_39498 ?auto_39502 ) ) ( not ( = ?auto_39498 ?auto_39503 ) ) ( not ( = ?auto_39499 ?auto_39502 ) ) ( not ( = ?auto_39499 ?auto_39503 ) ) ( not ( = ?auto_39500 ?auto_39502 ) ) ( not ( = ?auto_39500 ?auto_39503 ) ) ( not ( = ?auto_39501 ?auto_39502 ) ) ( not ( = ?auto_39501 ?auto_39503 ) ) ( not ( = ?auto_39502 ?auto_39503 ) ) )
    :subtasks
    ( ( !STACK ?auto_39502 ?auto_39503 )
      ( MAKE-3PILE ?auto_39498 ?auto_39499 ?auto_39500 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_39504 - BLOCK
      ?auto_39505 - BLOCK
      ?auto_39506 - BLOCK
    )
    :vars
    (
      ?auto_39507 - BLOCK
      ?auto_39508 - BLOCK
      ?auto_39509 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_39507 ?auto_39506 ) ( ON-TABLE ?auto_39504 ) ( ON ?auto_39505 ?auto_39504 ) ( ON ?auto_39506 ?auto_39505 ) ( not ( = ?auto_39504 ?auto_39505 ) ) ( not ( = ?auto_39504 ?auto_39506 ) ) ( not ( = ?auto_39504 ?auto_39507 ) ) ( not ( = ?auto_39505 ?auto_39506 ) ) ( not ( = ?auto_39505 ?auto_39507 ) ) ( not ( = ?auto_39506 ?auto_39507 ) ) ( CLEAR ?auto_39508 ) ( not ( = ?auto_39504 ?auto_39509 ) ) ( not ( = ?auto_39504 ?auto_39508 ) ) ( not ( = ?auto_39505 ?auto_39509 ) ) ( not ( = ?auto_39505 ?auto_39508 ) ) ( not ( = ?auto_39506 ?auto_39509 ) ) ( not ( = ?auto_39506 ?auto_39508 ) ) ( not ( = ?auto_39507 ?auto_39509 ) ) ( not ( = ?auto_39507 ?auto_39508 ) ) ( not ( = ?auto_39509 ?auto_39508 ) ) ( ON ?auto_39509 ?auto_39507 ) ( CLEAR ?auto_39509 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_39504 ?auto_39505 ?auto_39506 ?auto_39507 )
      ( MAKE-3PILE ?auto_39504 ?auto_39505 ?auto_39506 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_39510 - BLOCK
      ?auto_39511 - BLOCK
      ?auto_39512 - BLOCK
    )
    :vars
    (
      ?auto_39514 - BLOCK
      ?auto_39513 - BLOCK
      ?auto_39515 - BLOCK
      ?auto_39516 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_39514 ?auto_39512 ) ( ON-TABLE ?auto_39510 ) ( ON ?auto_39511 ?auto_39510 ) ( ON ?auto_39512 ?auto_39511 ) ( not ( = ?auto_39510 ?auto_39511 ) ) ( not ( = ?auto_39510 ?auto_39512 ) ) ( not ( = ?auto_39510 ?auto_39514 ) ) ( not ( = ?auto_39511 ?auto_39512 ) ) ( not ( = ?auto_39511 ?auto_39514 ) ) ( not ( = ?auto_39512 ?auto_39514 ) ) ( not ( = ?auto_39510 ?auto_39513 ) ) ( not ( = ?auto_39510 ?auto_39515 ) ) ( not ( = ?auto_39511 ?auto_39513 ) ) ( not ( = ?auto_39511 ?auto_39515 ) ) ( not ( = ?auto_39512 ?auto_39513 ) ) ( not ( = ?auto_39512 ?auto_39515 ) ) ( not ( = ?auto_39514 ?auto_39513 ) ) ( not ( = ?auto_39514 ?auto_39515 ) ) ( not ( = ?auto_39513 ?auto_39515 ) ) ( ON ?auto_39513 ?auto_39514 ) ( CLEAR ?auto_39513 ) ( HOLDING ?auto_39515 ) ( CLEAR ?auto_39516 ) ( ON-TABLE ?auto_39516 ) ( not ( = ?auto_39516 ?auto_39515 ) ) ( not ( = ?auto_39510 ?auto_39516 ) ) ( not ( = ?auto_39511 ?auto_39516 ) ) ( not ( = ?auto_39512 ?auto_39516 ) ) ( not ( = ?auto_39514 ?auto_39516 ) ) ( not ( = ?auto_39513 ?auto_39516 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_39516 ?auto_39515 )
      ( MAKE-3PILE ?auto_39510 ?auto_39511 ?auto_39512 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_39517 - BLOCK
      ?auto_39518 - BLOCK
      ?auto_39519 - BLOCK
    )
    :vars
    (
      ?auto_39520 - BLOCK
      ?auto_39522 - BLOCK
      ?auto_39521 - BLOCK
      ?auto_39523 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_39520 ?auto_39519 ) ( ON-TABLE ?auto_39517 ) ( ON ?auto_39518 ?auto_39517 ) ( ON ?auto_39519 ?auto_39518 ) ( not ( = ?auto_39517 ?auto_39518 ) ) ( not ( = ?auto_39517 ?auto_39519 ) ) ( not ( = ?auto_39517 ?auto_39520 ) ) ( not ( = ?auto_39518 ?auto_39519 ) ) ( not ( = ?auto_39518 ?auto_39520 ) ) ( not ( = ?auto_39519 ?auto_39520 ) ) ( not ( = ?auto_39517 ?auto_39522 ) ) ( not ( = ?auto_39517 ?auto_39521 ) ) ( not ( = ?auto_39518 ?auto_39522 ) ) ( not ( = ?auto_39518 ?auto_39521 ) ) ( not ( = ?auto_39519 ?auto_39522 ) ) ( not ( = ?auto_39519 ?auto_39521 ) ) ( not ( = ?auto_39520 ?auto_39522 ) ) ( not ( = ?auto_39520 ?auto_39521 ) ) ( not ( = ?auto_39522 ?auto_39521 ) ) ( ON ?auto_39522 ?auto_39520 ) ( CLEAR ?auto_39523 ) ( ON-TABLE ?auto_39523 ) ( not ( = ?auto_39523 ?auto_39521 ) ) ( not ( = ?auto_39517 ?auto_39523 ) ) ( not ( = ?auto_39518 ?auto_39523 ) ) ( not ( = ?auto_39519 ?auto_39523 ) ) ( not ( = ?auto_39520 ?auto_39523 ) ) ( not ( = ?auto_39522 ?auto_39523 ) ) ( ON ?auto_39521 ?auto_39522 ) ( CLEAR ?auto_39521 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_39517 ?auto_39518 ?auto_39519 ?auto_39520 ?auto_39522 )
      ( MAKE-3PILE ?auto_39517 ?auto_39518 ?auto_39519 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_39524 - BLOCK
      ?auto_39525 - BLOCK
      ?auto_39526 - BLOCK
    )
    :vars
    (
      ?auto_39530 - BLOCK
      ?auto_39527 - BLOCK
      ?auto_39529 - BLOCK
      ?auto_39528 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_39530 ?auto_39526 ) ( ON-TABLE ?auto_39524 ) ( ON ?auto_39525 ?auto_39524 ) ( ON ?auto_39526 ?auto_39525 ) ( not ( = ?auto_39524 ?auto_39525 ) ) ( not ( = ?auto_39524 ?auto_39526 ) ) ( not ( = ?auto_39524 ?auto_39530 ) ) ( not ( = ?auto_39525 ?auto_39526 ) ) ( not ( = ?auto_39525 ?auto_39530 ) ) ( not ( = ?auto_39526 ?auto_39530 ) ) ( not ( = ?auto_39524 ?auto_39527 ) ) ( not ( = ?auto_39524 ?auto_39529 ) ) ( not ( = ?auto_39525 ?auto_39527 ) ) ( not ( = ?auto_39525 ?auto_39529 ) ) ( not ( = ?auto_39526 ?auto_39527 ) ) ( not ( = ?auto_39526 ?auto_39529 ) ) ( not ( = ?auto_39530 ?auto_39527 ) ) ( not ( = ?auto_39530 ?auto_39529 ) ) ( not ( = ?auto_39527 ?auto_39529 ) ) ( ON ?auto_39527 ?auto_39530 ) ( not ( = ?auto_39528 ?auto_39529 ) ) ( not ( = ?auto_39524 ?auto_39528 ) ) ( not ( = ?auto_39525 ?auto_39528 ) ) ( not ( = ?auto_39526 ?auto_39528 ) ) ( not ( = ?auto_39530 ?auto_39528 ) ) ( not ( = ?auto_39527 ?auto_39528 ) ) ( ON ?auto_39529 ?auto_39527 ) ( CLEAR ?auto_39529 ) ( HOLDING ?auto_39528 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_39528 )
      ( MAKE-3PILE ?auto_39524 ?auto_39525 ?auto_39526 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_39531 - BLOCK
      ?auto_39532 - BLOCK
      ?auto_39533 - BLOCK
    )
    :vars
    (
      ?auto_39535 - BLOCK
      ?auto_39536 - BLOCK
      ?auto_39537 - BLOCK
      ?auto_39534 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_39535 ?auto_39533 ) ( ON-TABLE ?auto_39531 ) ( ON ?auto_39532 ?auto_39531 ) ( ON ?auto_39533 ?auto_39532 ) ( not ( = ?auto_39531 ?auto_39532 ) ) ( not ( = ?auto_39531 ?auto_39533 ) ) ( not ( = ?auto_39531 ?auto_39535 ) ) ( not ( = ?auto_39532 ?auto_39533 ) ) ( not ( = ?auto_39532 ?auto_39535 ) ) ( not ( = ?auto_39533 ?auto_39535 ) ) ( not ( = ?auto_39531 ?auto_39536 ) ) ( not ( = ?auto_39531 ?auto_39537 ) ) ( not ( = ?auto_39532 ?auto_39536 ) ) ( not ( = ?auto_39532 ?auto_39537 ) ) ( not ( = ?auto_39533 ?auto_39536 ) ) ( not ( = ?auto_39533 ?auto_39537 ) ) ( not ( = ?auto_39535 ?auto_39536 ) ) ( not ( = ?auto_39535 ?auto_39537 ) ) ( not ( = ?auto_39536 ?auto_39537 ) ) ( ON ?auto_39536 ?auto_39535 ) ( not ( = ?auto_39534 ?auto_39537 ) ) ( not ( = ?auto_39531 ?auto_39534 ) ) ( not ( = ?auto_39532 ?auto_39534 ) ) ( not ( = ?auto_39533 ?auto_39534 ) ) ( not ( = ?auto_39535 ?auto_39534 ) ) ( not ( = ?auto_39536 ?auto_39534 ) ) ( ON ?auto_39537 ?auto_39536 ) ( ON ?auto_39534 ?auto_39537 ) ( CLEAR ?auto_39534 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_39531 ?auto_39532 ?auto_39533 ?auto_39535 ?auto_39536 ?auto_39537 )
      ( MAKE-3PILE ?auto_39531 ?auto_39532 ?auto_39533 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_39542 - BLOCK
      ?auto_39543 - BLOCK
      ?auto_39544 - BLOCK
      ?auto_39545 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_39545 ) ( CLEAR ?auto_39544 ) ( ON-TABLE ?auto_39542 ) ( ON ?auto_39543 ?auto_39542 ) ( ON ?auto_39544 ?auto_39543 ) ( not ( = ?auto_39542 ?auto_39543 ) ) ( not ( = ?auto_39542 ?auto_39544 ) ) ( not ( = ?auto_39542 ?auto_39545 ) ) ( not ( = ?auto_39543 ?auto_39544 ) ) ( not ( = ?auto_39543 ?auto_39545 ) ) ( not ( = ?auto_39544 ?auto_39545 ) ) )
    :subtasks
    ( ( !STACK ?auto_39545 ?auto_39544 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_39546 - BLOCK
      ?auto_39547 - BLOCK
      ?auto_39548 - BLOCK
      ?auto_39549 - BLOCK
    )
    :vars
    (
      ?auto_39550 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_39548 ) ( ON-TABLE ?auto_39546 ) ( ON ?auto_39547 ?auto_39546 ) ( ON ?auto_39548 ?auto_39547 ) ( not ( = ?auto_39546 ?auto_39547 ) ) ( not ( = ?auto_39546 ?auto_39548 ) ) ( not ( = ?auto_39546 ?auto_39549 ) ) ( not ( = ?auto_39547 ?auto_39548 ) ) ( not ( = ?auto_39547 ?auto_39549 ) ) ( not ( = ?auto_39548 ?auto_39549 ) ) ( ON ?auto_39549 ?auto_39550 ) ( CLEAR ?auto_39549 ) ( HAND-EMPTY ) ( not ( = ?auto_39546 ?auto_39550 ) ) ( not ( = ?auto_39547 ?auto_39550 ) ) ( not ( = ?auto_39548 ?auto_39550 ) ) ( not ( = ?auto_39549 ?auto_39550 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_39549 ?auto_39550 )
      ( MAKE-4PILE ?auto_39546 ?auto_39547 ?auto_39548 ?auto_39549 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_39551 - BLOCK
      ?auto_39552 - BLOCK
      ?auto_39553 - BLOCK
      ?auto_39554 - BLOCK
    )
    :vars
    (
      ?auto_39555 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_39551 ) ( ON ?auto_39552 ?auto_39551 ) ( not ( = ?auto_39551 ?auto_39552 ) ) ( not ( = ?auto_39551 ?auto_39553 ) ) ( not ( = ?auto_39551 ?auto_39554 ) ) ( not ( = ?auto_39552 ?auto_39553 ) ) ( not ( = ?auto_39552 ?auto_39554 ) ) ( not ( = ?auto_39553 ?auto_39554 ) ) ( ON ?auto_39554 ?auto_39555 ) ( CLEAR ?auto_39554 ) ( not ( = ?auto_39551 ?auto_39555 ) ) ( not ( = ?auto_39552 ?auto_39555 ) ) ( not ( = ?auto_39553 ?auto_39555 ) ) ( not ( = ?auto_39554 ?auto_39555 ) ) ( HOLDING ?auto_39553 ) ( CLEAR ?auto_39552 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_39551 ?auto_39552 ?auto_39553 )
      ( MAKE-4PILE ?auto_39551 ?auto_39552 ?auto_39553 ?auto_39554 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_39556 - BLOCK
      ?auto_39557 - BLOCK
      ?auto_39558 - BLOCK
      ?auto_39559 - BLOCK
    )
    :vars
    (
      ?auto_39560 - BLOCK
      ?auto_39562 - BLOCK
      ?auto_39561 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_39556 ) ( ON ?auto_39557 ?auto_39556 ) ( not ( = ?auto_39556 ?auto_39557 ) ) ( not ( = ?auto_39556 ?auto_39558 ) ) ( not ( = ?auto_39556 ?auto_39559 ) ) ( not ( = ?auto_39557 ?auto_39558 ) ) ( not ( = ?auto_39557 ?auto_39559 ) ) ( not ( = ?auto_39558 ?auto_39559 ) ) ( ON ?auto_39559 ?auto_39560 ) ( not ( = ?auto_39556 ?auto_39560 ) ) ( not ( = ?auto_39557 ?auto_39560 ) ) ( not ( = ?auto_39558 ?auto_39560 ) ) ( not ( = ?auto_39559 ?auto_39560 ) ) ( CLEAR ?auto_39557 ) ( ON ?auto_39558 ?auto_39559 ) ( CLEAR ?auto_39558 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_39562 ) ( ON ?auto_39561 ?auto_39562 ) ( ON ?auto_39560 ?auto_39561 ) ( not ( = ?auto_39562 ?auto_39561 ) ) ( not ( = ?auto_39562 ?auto_39560 ) ) ( not ( = ?auto_39562 ?auto_39559 ) ) ( not ( = ?auto_39562 ?auto_39558 ) ) ( not ( = ?auto_39561 ?auto_39560 ) ) ( not ( = ?auto_39561 ?auto_39559 ) ) ( not ( = ?auto_39561 ?auto_39558 ) ) ( not ( = ?auto_39556 ?auto_39562 ) ) ( not ( = ?auto_39556 ?auto_39561 ) ) ( not ( = ?auto_39557 ?auto_39562 ) ) ( not ( = ?auto_39557 ?auto_39561 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_39562 ?auto_39561 ?auto_39560 ?auto_39559 )
      ( MAKE-4PILE ?auto_39556 ?auto_39557 ?auto_39558 ?auto_39559 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_39563 - BLOCK
      ?auto_39564 - BLOCK
      ?auto_39565 - BLOCK
      ?auto_39566 - BLOCK
    )
    :vars
    (
      ?auto_39567 - BLOCK
      ?auto_39569 - BLOCK
      ?auto_39568 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_39563 ) ( not ( = ?auto_39563 ?auto_39564 ) ) ( not ( = ?auto_39563 ?auto_39565 ) ) ( not ( = ?auto_39563 ?auto_39566 ) ) ( not ( = ?auto_39564 ?auto_39565 ) ) ( not ( = ?auto_39564 ?auto_39566 ) ) ( not ( = ?auto_39565 ?auto_39566 ) ) ( ON ?auto_39566 ?auto_39567 ) ( not ( = ?auto_39563 ?auto_39567 ) ) ( not ( = ?auto_39564 ?auto_39567 ) ) ( not ( = ?auto_39565 ?auto_39567 ) ) ( not ( = ?auto_39566 ?auto_39567 ) ) ( ON ?auto_39565 ?auto_39566 ) ( CLEAR ?auto_39565 ) ( ON-TABLE ?auto_39569 ) ( ON ?auto_39568 ?auto_39569 ) ( ON ?auto_39567 ?auto_39568 ) ( not ( = ?auto_39569 ?auto_39568 ) ) ( not ( = ?auto_39569 ?auto_39567 ) ) ( not ( = ?auto_39569 ?auto_39566 ) ) ( not ( = ?auto_39569 ?auto_39565 ) ) ( not ( = ?auto_39568 ?auto_39567 ) ) ( not ( = ?auto_39568 ?auto_39566 ) ) ( not ( = ?auto_39568 ?auto_39565 ) ) ( not ( = ?auto_39563 ?auto_39569 ) ) ( not ( = ?auto_39563 ?auto_39568 ) ) ( not ( = ?auto_39564 ?auto_39569 ) ) ( not ( = ?auto_39564 ?auto_39568 ) ) ( HOLDING ?auto_39564 ) ( CLEAR ?auto_39563 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_39563 ?auto_39564 )
      ( MAKE-4PILE ?auto_39563 ?auto_39564 ?auto_39565 ?auto_39566 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_39570 - BLOCK
      ?auto_39571 - BLOCK
      ?auto_39572 - BLOCK
      ?auto_39573 - BLOCK
    )
    :vars
    (
      ?auto_39576 - BLOCK
      ?auto_39574 - BLOCK
      ?auto_39575 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_39570 ) ( not ( = ?auto_39570 ?auto_39571 ) ) ( not ( = ?auto_39570 ?auto_39572 ) ) ( not ( = ?auto_39570 ?auto_39573 ) ) ( not ( = ?auto_39571 ?auto_39572 ) ) ( not ( = ?auto_39571 ?auto_39573 ) ) ( not ( = ?auto_39572 ?auto_39573 ) ) ( ON ?auto_39573 ?auto_39576 ) ( not ( = ?auto_39570 ?auto_39576 ) ) ( not ( = ?auto_39571 ?auto_39576 ) ) ( not ( = ?auto_39572 ?auto_39576 ) ) ( not ( = ?auto_39573 ?auto_39576 ) ) ( ON ?auto_39572 ?auto_39573 ) ( ON-TABLE ?auto_39574 ) ( ON ?auto_39575 ?auto_39574 ) ( ON ?auto_39576 ?auto_39575 ) ( not ( = ?auto_39574 ?auto_39575 ) ) ( not ( = ?auto_39574 ?auto_39576 ) ) ( not ( = ?auto_39574 ?auto_39573 ) ) ( not ( = ?auto_39574 ?auto_39572 ) ) ( not ( = ?auto_39575 ?auto_39576 ) ) ( not ( = ?auto_39575 ?auto_39573 ) ) ( not ( = ?auto_39575 ?auto_39572 ) ) ( not ( = ?auto_39570 ?auto_39574 ) ) ( not ( = ?auto_39570 ?auto_39575 ) ) ( not ( = ?auto_39571 ?auto_39574 ) ) ( not ( = ?auto_39571 ?auto_39575 ) ) ( CLEAR ?auto_39570 ) ( ON ?auto_39571 ?auto_39572 ) ( CLEAR ?auto_39571 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_39574 ?auto_39575 ?auto_39576 ?auto_39573 ?auto_39572 )
      ( MAKE-4PILE ?auto_39570 ?auto_39571 ?auto_39572 ?auto_39573 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_39577 - BLOCK
      ?auto_39578 - BLOCK
      ?auto_39579 - BLOCK
      ?auto_39580 - BLOCK
    )
    :vars
    (
      ?auto_39582 - BLOCK
      ?auto_39583 - BLOCK
      ?auto_39581 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_39577 ?auto_39578 ) ) ( not ( = ?auto_39577 ?auto_39579 ) ) ( not ( = ?auto_39577 ?auto_39580 ) ) ( not ( = ?auto_39578 ?auto_39579 ) ) ( not ( = ?auto_39578 ?auto_39580 ) ) ( not ( = ?auto_39579 ?auto_39580 ) ) ( ON ?auto_39580 ?auto_39582 ) ( not ( = ?auto_39577 ?auto_39582 ) ) ( not ( = ?auto_39578 ?auto_39582 ) ) ( not ( = ?auto_39579 ?auto_39582 ) ) ( not ( = ?auto_39580 ?auto_39582 ) ) ( ON ?auto_39579 ?auto_39580 ) ( ON-TABLE ?auto_39583 ) ( ON ?auto_39581 ?auto_39583 ) ( ON ?auto_39582 ?auto_39581 ) ( not ( = ?auto_39583 ?auto_39581 ) ) ( not ( = ?auto_39583 ?auto_39582 ) ) ( not ( = ?auto_39583 ?auto_39580 ) ) ( not ( = ?auto_39583 ?auto_39579 ) ) ( not ( = ?auto_39581 ?auto_39582 ) ) ( not ( = ?auto_39581 ?auto_39580 ) ) ( not ( = ?auto_39581 ?auto_39579 ) ) ( not ( = ?auto_39577 ?auto_39583 ) ) ( not ( = ?auto_39577 ?auto_39581 ) ) ( not ( = ?auto_39578 ?auto_39583 ) ) ( not ( = ?auto_39578 ?auto_39581 ) ) ( ON ?auto_39578 ?auto_39579 ) ( CLEAR ?auto_39578 ) ( HOLDING ?auto_39577 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_39577 )
      ( MAKE-4PILE ?auto_39577 ?auto_39578 ?auto_39579 ?auto_39580 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_39584 - BLOCK
      ?auto_39585 - BLOCK
      ?auto_39586 - BLOCK
      ?auto_39587 - BLOCK
    )
    :vars
    (
      ?auto_39588 - BLOCK
      ?auto_39590 - BLOCK
      ?auto_39589 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_39584 ?auto_39585 ) ) ( not ( = ?auto_39584 ?auto_39586 ) ) ( not ( = ?auto_39584 ?auto_39587 ) ) ( not ( = ?auto_39585 ?auto_39586 ) ) ( not ( = ?auto_39585 ?auto_39587 ) ) ( not ( = ?auto_39586 ?auto_39587 ) ) ( ON ?auto_39587 ?auto_39588 ) ( not ( = ?auto_39584 ?auto_39588 ) ) ( not ( = ?auto_39585 ?auto_39588 ) ) ( not ( = ?auto_39586 ?auto_39588 ) ) ( not ( = ?auto_39587 ?auto_39588 ) ) ( ON ?auto_39586 ?auto_39587 ) ( ON-TABLE ?auto_39590 ) ( ON ?auto_39589 ?auto_39590 ) ( ON ?auto_39588 ?auto_39589 ) ( not ( = ?auto_39590 ?auto_39589 ) ) ( not ( = ?auto_39590 ?auto_39588 ) ) ( not ( = ?auto_39590 ?auto_39587 ) ) ( not ( = ?auto_39590 ?auto_39586 ) ) ( not ( = ?auto_39589 ?auto_39588 ) ) ( not ( = ?auto_39589 ?auto_39587 ) ) ( not ( = ?auto_39589 ?auto_39586 ) ) ( not ( = ?auto_39584 ?auto_39590 ) ) ( not ( = ?auto_39584 ?auto_39589 ) ) ( not ( = ?auto_39585 ?auto_39590 ) ) ( not ( = ?auto_39585 ?auto_39589 ) ) ( ON ?auto_39585 ?auto_39586 ) ( ON ?auto_39584 ?auto_39585 ) ( CLEAR ?auto_39584 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_39590 ?auto_39589 ?auto_39588 ?auto_39587 ?auto_39586 ?auto_39585 )
      ( MAKE-4PILE ?auto_39584 ?auto_39585 ?auto_39586 ?auto_39587 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_39593 - BLOCK
      ?auto_39594 - BLOCK
    )
    :vars
    (
      ?auto_39595 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_39595 ?auto_39594 ) ( CLEAR ?auto_39595 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_39593 ) ( ON ?auto_39594 ?auto_39593 ) ( not ( = ?auto_39593 ?auto_39594 ) ) ( not ( = ?auto_39593 ?auto_39595 ) ) ( not ( = ?auto_39594 ?auto_39595 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_39595 ?auto_39594 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_39596 - BLOCK
      ?auto_39597 - BLOCK
    )
    :vars
    (
      ?auto_39598 - BLOCK
      ?auto_39599 - BLOCK
      ?auto_39600 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_39598 ?auto_39597 ) ( CLEAR ?auto_39598 ) ( ON-TABLE ?auto_39596 ) ( ON ?auto_39597 ?auto_39596 ) ( not ( = ?auto_39596 ?auto_39597 ) ) ( not ( = ?auto_39596 ?auto_39598 ) ) ( not ( = ?auto_39597 ?auto_39598 ) ) ( HOLDING ?auto_39599 ) ( CLEAR ?auto_39600 ) ( not ( = ?auto_39596 ?auto_39599 ) ) ( not ( = ?auto_39596 ?auto_39600 ) ) ( not ( = ?auto_39597 ?auto_39599 ) ) ( not ( = ?auto_39597 ?auto_39600 ) ) ( not ( = ?auto_39598 ?auto_39599 ) ) ( not ( = ?auto_39598 ?auto_39600 ) ) ( not ( = ?auto_39599 ?auto_39600 ) ) )
    :subtasks
    ( ( !STACK ?auto_39599 ?auto_39600 )
      ( MAKE-2PILE ?auto_39596 ?auto_39597 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_39601 - BLOCK
      ?auto_39602 - BLOCK
    )
    :vars
    (
      ?auto_39603 - BLOCK
      ?auto_39604 - BLOCK
      ?auto_39605 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_39603 ?auto_39602 ) ( ON-TABLE ?auto_39601 ) ( ON ?auto_39602 ?auto_39601 ) ( not ( = ?auto_39601 ?auto_39602 ) ) ( not ( = ?auto_39601 ?auto_39603 ) ) ( not ( = ?auto_39602 ?auto_39603 ) ) ( CLEAR ?auto_39604 ) ( not ( = ?auto_39601 ?auto_39605 ) ) ( not ( = ?auto_39601 ?auto_39604 ) ) ( not ( = ?auto_39602 ?auto_39605 ) ) ( not ( = ?auto_39602 ?auto_39604 ) ) ( not ( = ?auto_39603 ?auto_39605 ) ) ( not ( = ?auto_39603 ?auto_39604 ) ) ( not ( = ?auto_39605 ?auto_39604 ) ) ( ON ?auto_39605 ?auto_39603 ) ( CLEAR ?auto_39605 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_39601 ?auto_39602 ?auto_39603 )
      ( MAKE-2PILE ?auto_39601 ?auto_39602 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_39606 - BLOCK
      ?auto_39607 - BLOCK
    )
    :vars
    (
      ?auto_39609 - BLOCK
      ?auto_39610 - BLOCK
      ?auto_39608 - BLOCK
      ?auto_39611 - BLOCK
      ?auto_39612 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_39609 ?auto_39607 ) ( ON-TABLE ?auto_39606 ) ( ON ?auto_39607 ?auto_39606 ) ( not ( = ?auto_39606 ?auto_39607 ) ) ( not ( = ?auto_39606 ?auto_39609 ) ) ( not ( = ?auto_39607 ?auto_39609 ) ) ( not ( = ?auto_39606 ?auto_39610 ) ) ( not ( = ?auto_39606 ?auto_39608 ) ) ( not ( = ?auto_39607 ?auto_39610 ) ) ( not ( = ?auto_39607 ?auto_39608 ) ) ( not ( = ?auto_39609 ?auto_39610 ) ) ( not ( = ?auto_39609 ?auto_39608 ) ) ( not ( = ?auto_39610 ?auto_39608 ) ) ( ON ?auto_39610 ?auto_39609 ) ( CLEAR ?auto_39610 ) ( HOLDING ?auto_39608 ) ( CLEAR ?auto_39611 ) ( ON-TABLE ?auto_39612 ) ( ON ?auto_39611 ?auto_39612 ) ( not ( = ?auto_39612 ?auto_39611 ) ) ( not ( = ?auto_39612 ?auto_39608 ) ) ( not ( = ?auto_39611 ?auto_39608 ) ) ( not ( = ?auto_39606 ?auto_39611 ) ) ( not ( = ?auto_39606 ?auto_39612 ) ) ( not ( = ?auto_39607 ?auto_39611 ) ) ( not ( = ?auto_39607 ?auto_39612 ) ) ( not ( = ?auto_39609 ?auto_39611 ) ) ( not ( = ?auto_39609 ?auto_39612 ) ) ( not ( = ?auto_39610 ?auto_39611 ) ) ( not ( = ?auto_39610 ?auto_39612 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_39612 ?auto_39611 ?auto_39608 )
      ( MAKE-2PILE ?auto_39606 ?auto_39607 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_39613 - BLOCK
      ?auto_39614 - BLOCK
    )
    :vars
    (
      ?auto_39618 - BLOCK
      ?auto_39619 - BLOCK
      ?auto_39616 - BLOCK
      ?auto_39615 - BLOCK
      ?auto_39617 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_39618 ?auto_39614 ) ( ON-TABLE ?auto_39613 ) ( ON ?auto_39614 ?auto_39613 ) ( not ( = ?auto_39613 ?auto_39614 ) ) ( not ( = ?auto_39613 ?auto_39618 ) ) ( not ( = ?auto_39614 ?auto_39618 ) ) ( not ( = ?auto_39613 ?auto_39619 ) ) ( not ( = ?auto_39613 ?auto_39616 ) ) ( not ( = ?auto_39614 ?auto_39619 ) ) ( not ( = ?auto_39614 ?auto_39616 ) ) ( not ( = ?auto_39618 ?auto_39619 ) ) ( not ( = ?auto_39618 ?auto_39616 ) ) ( not ( = ?auto_39619 ?auto_39616 ) ) ( ON ?auto_39619 ?auto_39618 ) ( CLEAR ?auto_39615 ) ( ON-TABLE ?auto_39617 ) ( ON ?auto_39615 ?auto_39617 ) ( not ( = ?auto_39617 ?auto_39615 ) ) ( not ( = ?auto_39617 ?auto_39616 ) ) ( not ( = ?auto_39615 ?auto_39616 ) ) ( not ( = ?auto_39613 ?auto_39615 ) ) ( not ( = ?auto_39613 ?auto_39617 ) ) ( not ( = ?auto_39614 ?auto_39615 ) ) ( not ( = ?auto_39614 ?auto_39617 ) ) ( not ( = ?auto_39618 ?auto_39615 ) ) ( not ( = ?auto_39618 ?auto_39617 ) ) ( not ( = ?auto_39619 ?auto_39615 ) ) ( not ( = ?auto_39619 ?auto_39617 ) ) ( ON ?auto_39616 ?auto_39619 ) ( CLEAR ?auto_39616 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_39613 ?auto_39614 ?auto_39618 ?auto_39619 )
      ( MAKE-2PILE ?auto_39613 ?auto_39614 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_39620 - BLOCK
      ?auto_39621 - BLOCK
    )
    :vars
    (
      ?auto_39626 - BLOCK
      ?auto_39624 - BLOCK
      ?auto_39623 - BLOCK
      ?auto_39622 - BLOCK
      ?auto_39625 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_39626 ?auto_39621 ) ( ON-TABLE ?auto_39620 ) ( ON ?auto_39621 ?auto_39620 ) ( not ( = ?auto_39620 ?auto_39621 ) ) ( not ( = ?auto_39620 ?auto_39626 ) ) ( not ( = ?auto_39621 ?auto_39626 ) ) ( not ( = ?auto_39620 ?auto_39624 ) ) ( not ( = ?auto_39620 ?auto_39623 ) ) ( not ( = ?auto_39621 ?auto_39624 ) ) ( not ( = ?auto_39621 ?auto_39623 ) ) ( not ( = ?auto_39626 ?auto_39624 ) ) ( not ( = ?auto_39626 ?auto_39623 ) ) ( not ( = ?auto_39624 ?auto_39623 ) ) ( ON ?auto_39624 ?auto_39626 ) ( ON-TABLE ?auto_39622 ) ( not ( = ?auto_39622 ?auto_39625 ) ) ( not ( = ?auto_39622 ?auto_39623 ) ) ( not ( = ?auto_39625 ?auto_39623 ) ) ( not ( = ?auto_39620 ?auto_39625 ) ) ( not ( = ?auto_39620 ?auto_39622 ) ) ( not ( = ?auto_39621 ?auto_39625 ) ) ( not ( = ?auto_39621 ?auto_39622 ) ) ( not ( = ?auto_39626 ?auto_39625 ) ) ( not ( = ?auto_39626 ?auto_39622 ) ) ( not ( = ?auto_39624 ?auto_39625 ) ) ( not ( = ?auto_39624 ?auto_39622 ) ) ( ON ?auto_39623 ?auto_39624 ) ( CLEAR ?auto_39623 ) ( HOLDING ?auto_39625 ) ( CLEAR ?auto_39622 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_39622 ?auto_39625 )
      ( MAKE-2PILE ?auto_39620 ?auto_39621 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_39627 - BLOCK
      ?auto_39628 - BLOCK
    )
    :vars
    (
      ?auto_39631 - BLOCK
      ?auto_39630 - BLOCK
      ?auto_39632 - BLOCK
      ?auto_39633 - BLOCK
      ?auto_39629 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_39631 ?auto_39628 ) ( ON-TABLE ?auto_39627 ) ( ON ?auto_39628 ?auto_39627 ) ( not ( = ?auto_39627 ?auto_39628 ) ) ( not ( = ?auto_39627 ?auto_39631 ) ) ( not ( = ?auto_39628 ?auto_39631 ) ) ( not ( = ?auto_39627 ?auto_39630 ) ) ( not ( = ?auto_39627 ?auto_39632 ) ) ( not ( = ?auto_39628 ?auto_39630 ) ) ( not ( = ?auto_39628 ?auto_39632 ) ) ( not ( = ?auto_39631 ?auto_39630 ) ) ( not ( = ?auto_39631 ?auto_39632 ) ) ( not ( = ?auto_39630 ?auto_39632 ) ) ( ON ?auto_39630 ?auto_39631 ) ( ON-TABLE ?auto_39633 ) ( not ( = ?auto_39633 ?auto_39629 ) ) ( not ( = ?auto_39633 ?auto_39632 ) ) ( not ( = ?auto_39629 ?auto_39632 ) ) ( not ( = ?auto_39627 ?auto_39629 ) ) ( not ( = ?auto_39627 ?auto_39633 ) ) ( not ( = ?auto_39628 ?auto_39629 ) ) ( not ( = ?auto_39628 ?auto_39633 ) ) ( not ( = ?auto_39631 ?auto_39629 ) ) ( not ( = ?auto_39631 ?auto_39633 ) ) ( not ( = ?auto_39630 ?auto_39629 ) ) ( not ( = ?auto_39630 ?auto_39633 ) ) ( ON ?auto_39632 ?auto_39630 ) ( CLEAR ?auto_39633 ) ( ON ?auto_39629 ?auto_39632 ) ( CLEAR ?auto_39629 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_39627 ?auto_39628 ?auto_39631 ?auto_39630 ?auto_39632 )
      ( MAKE-2PILE ?auto_39627 ?auto_39628 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_39634 - BLOCK
      ?auto_39635 - BLOCK
    )
    :vars
    (
      ?auto_39638 - BLOCK
      ?auto_39640 - BLOCK
      ?auto_39637 - BLOCK
      ?auto_39636 - BLOCK
      ?auto_39639 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_39638 ?auto_39635 ) ( ON-TABLE ?auto_39634 ) ( ON ?auto_39635 ?auto_39634 ) ( not ( = ?auto_39634 ?auto_39635 ) ) ( not ( = ?auto_39634 ?auto_39638 ) ) ( not ( = ?auto_39635 ?auto_39638 ) ) ( not ( = ?auto_39634 ?auto_39640 ) ) ( not ( = ?auto_39634 ?auto_39637 ) ) ( not ( = ?auto_39635 ?auto_39640 ) ) ( not ( = ?auto_39635 ?auto_39637 ) ) ( not ( = ?auto_39638 ?auto_39640 ) ) ( not ( = ?auto_39638 ?auto_39637 ) ) ( not ( = ?auto_39640 ?auto_39637 ) ) ( ON ?auto_39640 ?auto_39638 ) ( not ( = ?auto_39636 ?auto_39639 ) ) ( not ( = ?auto_39636 ?auto_39637 ) ) ( not ( = ?auto_39639 ?auto_39637 ) ) ( not ( = ?auto_39634 ?auto_39639 ) ) ( not ( = ?auto_39634 ?auto_39636 ) ) ( not ( = ?auto_39635 ?auto_39639 ) ) ( not ( = ?auto_39635 ?auto_39636 ) ) ( not ( = ?auto_39638 ?auto_39639 ) ) ( not ( = ?auto_39638 ?auto_39636 ) ) ( not ( = ?auto_39640 ?auto_39639 ) ) ( not ( = ?auto_39640 ?auto_39636 ) ) ( ON ?auto_39637 ?auto_39640 ) ( ON ?auto_39639 ?auto_39637 ) ( CLEAR ?auto_39639 ) ( HOLDING ?auto_39636 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_39636 )
      ( MAKE-2PILE ?auto_39634 ?auto_39635 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_39641 - BLOCK
      ?auto_39642 - BLOCK
    )
    :vars
    (
      ?auto_39644 - BLOCK
      ?auto_39645 - BLOCK
      ?auto_39647 - BLOCK
      ?auto_39646 - BLOCK
      ?auto_39643 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_39644 ?auto_39642 ) ( ON-TABLE ?auto_39641 ) ( ON ?auto_39642 ?auto_39641 ) ( not ( = ?auto_39641 ?auto_39642 ) ) ( not ( = ?auto_39641 ?auto_39644 ) ) ( not ( = ?auto_39642 ?auto_39644 ) ) ( not ( = ?auto_39641 ?auto_39645 ) ) ( not ( = ?auto_39641 ?auto_39647 ) ) ( not ( = ?auto_39642 ?auto_39645 ) ) ( not ( = ?auto_39642 ?auto_39647 ) ) ( not ( = ?auto_39644 ?auto_39645 ) ) ( not ( = ?auto_39644 ?auto_39647 ) ) ( not ( = ?auto_39645 ?auto_39647 ) ) ( ON ?auto_39645 ?auto_39644 ) ( not ( = ?auto_39646 ?auto_39643 ) ) ( not ( = ?auto_39646 ?auto_39647 ) ) ( not ( = ?auto_39643 ?auto_39647 ) ) ( not ( = ?auto_39641 ?auto_39643 ) ) ( not ( = ?auto_39641 ?auto_39646 ) ) ( not ( = ?auto_39642 ?auto_39643 ) ) ( not ( = ?auto_39642 ?auto_39646 ) ) ( not ( = ?auto_39644 ?auto_39643 ) ) ( not ( = ?auto_39644 ?auto_39646 ) ) ( not ( = ?auto_39645 ?auto_39643 ) ) ( not ( = ?auto_39645 ?auto_39646 ) ) ( ON ?auto_39647 ?auto_39645 ) ( ON ?auto_39643 ?auto_39647 ) ( ON ?auto_39646 ?auto_39643 ) ( CLEAR ?auto_39646 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_39641 ?auto_39642 ?auto_39644 ?auto_39645 ?auto_39647 ?auto_39643 )
      ( MAKE-2PILE ?auto_39641 ?auto_39642 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_39653 - BLOCK
      ?auto_39654 - BLOCK
      ?auto_39655 - BLOCK
      ?auto_39656 - BLOCK
      ?auto_39657 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_39657 ) ( CLEAR ?auto_39656 ) ( ON-TABLE ?auto_39653 ) ( ON ?auto_39654 ?auto_39653 ) ( ON ?auto_39655 ?auto_39654 ) ( ON ?auto_39656 ?auto_39655 ) ( not ( = ?auto_39653 ?auto_39654 ) ) ( not ( = ?auto_39653 ?auto_39655 ) ) ( not ( = ?auto_39653 ?auto_39656 ) ) ( not ( = ?auto_39653 ?auto_39657 ) ) ( not ( = ?auto_39654 ?auto_39655 ) ) ( not ( = ?auto_39654 ?auto_39656 ) ) ( not ( = ?auto_39654 ?auto_39657 ) ) ( not ( = ?auto_39655 ?auto_39656 ) ) ( not ( = ?auto_39655 ?auto_39657 ) ) ( not ( = ?auto_39656 ?auto_39657 ) ) )
    :subtasks
    ( ( !STACK ?auto_39657 ?auto_39656 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_39658 - BLOCK
      ?auto_39659 - BLOCK
      ?auto_39660 - BLOCK
      ?auto_39661 - BLOCK
      ?auto_39662 - BLOCK
    )
    :vars
    (
      ?auto_39663 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_39661 ) ( ON-TABLE ?auto_39658 ) ( ON ?auto_39659 ?auto_39658 ) ( ON ?auto_39660 ?auto_39659 ) ( ON ?auto_39661 ?auto_39660 ) ( not ( = ?auto_39658 ?auto_39659 ) ) ( not ( = ?auto_39658 ?auto_39660 ) ) ( not ( = ?auto_39658 ?auto_39661 ) ) ( not ( = ?auto_39658 ?auto_39662 ) ) ( not ( = ?auto_39659 ?auto_39660 ) ) ( not ( = ?auto_39659 ?auto_39661 ) ) ( not ( = ?auto_39659 ?auto_39662 ) ) ( not ( = ?auto_39660 ?auto_39661 ) ) ( not ( = ?auto_39660 ?auto_39662 ) ) ( not ( = ?auto_39661 ?auto_39662 ) ) ( ON ?auto_39662 ?auto_39663 ) ( CLEAR ?auto_39662 ) ( HAND-EMPTY ) ( not ( = ?auto_39658 ?auto_39663 ) ) ( not ( = ?auto_39659 ?auto_39663 ) ) ( not ( = ?auto_39660 ?auto_39663 ) ) ( not ( = ?auto_39661 ?auto_39663 ) ) ( not ( = ?auto_39662 ?auto_39663 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_39662 ?auto_39663 )
      ( MAKE-5PILE ?auto_39658 ?auto_39659 ?auto_39660 ?auto_39661 ?auto_39662 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_39664 - BLOCK
      ?auto_39665 - BLOCK
      ?auto_39666 - BLOCK
      ?auto_39667 - BLOCK
      ?auto_39668 - BLOCK
    )
    :vars
    (
      ?auto_39669 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_39664 ) ( ON ?auto_39665 ?auto_39664 ) ( ON ?auto_39666 ?auto_39665 ) ( not ( = ?auto_39664 ?auto_39665 ) ) ( not ( = ?auto_39664 ?auto_39666 ) ) ( not ( = ?auto_39664 ?auto_39667 ) ) ( not ( = ?auto_39664 ?auto_39668 ) ) ( not ( = ?auto_39665 ?auto_39666 ) ) ( not ( = ?auto_39665 ?auto_39667 ) ) ( not ( = ?auto_39665 ?auto_39668 ) ) ( not ( = ?auto_39666 ?auto_39667 ) ) ( not ( = ?auto_39666 ?auto_39668 ) ) ( not ( = ?auto_39667 ?auto_39668 ) ) ( ON ?auto_39668 ?auto_39669 ) ( CLEAR ?auto_39668 ) ( not ( = ?auto_39664 ?auto_39669 ) ) ( not ( = ?auto_39665 ?auto_39669 ) ) ( not ( = ?auto_39666 ?auto_39669 ) ) ( not ( = ?auto_39667 ?auto_39669 ) ) ( not ( = ?auto_39668 ?auto_39669 ) ) ( HOLDING ?auto_39667 ) ( CLEAR ?auto_39666 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_39664 ?auto_39665 ?auto_39666 ?auto_39667 )
      ( MAKE-5PILE ?auto_39664 ?auto_39665 ?auto_39666 ?auto_39667 ?auto_39668 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_39670 - BLOCK
      ?auto_39671 - BLOCK
      ?auto_39672 - BLOCK
      ?auto_39673 - BLOCK
      ?auto_39674 - BLOCK
    )
    :vars
    (
      ?auto_39675 - BLOCK
      ?auto_39676 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_39670 ) ( ON ?auto_39671 ?auto_39670 ) ( ON ?auto_39672 ?auto_39671 ) ( not ( = ?auto_39670 ?auto_39671 ) ) ( not ( = ?auto_39670 ?auto_39672 ) ) ( not ( = ?auto_39670 ?auto_39673 ) ) ( not ( = ?auto_39670 ?auto_39674 ) ) ( not ( = ?auto_39671 ?auto_39672 ) ) ( not ( = ?auto_39671 ?auto_39673 ) ) ( not ( = ?auto_39671 ?auto_39674 ) ) ( not ( = ?auto_39672 ?auto_39673 ) ) ( not ( = ?auto_39672 ?auto_39674 ) ) ( not ( = ?auto_39673 ?auto_39674 ) ) ( ON ?auto_39674 ?auto_39675 ) ( not ( = ?auto_39670 ?auto_39675 ) ) ( not ( = ?auto_39671 ?auto_39675 ) ) ( not ( = ?auto_39672 ?auto_39675 ) ) ( not ( = ?auto_39673 ?auto_39675 ) ) ( not ( = ?auto_39674 ?auto_39675 ) ) ( CLEAR ?auto_39672 ) ( ON ?auto_39673 ?auto_39674 ) ( CLEAR ?auto_39673 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_39676 ) ( ON ?auto_39675 ?auto_39676 ) ( not ( = ?auto_39676 ?auto_39675 ) ) ( not ( = ?auto_39676 ?auto_39674 ) ) ( not ( = ?auto_39676 ?auto_39673 ) ) ( not ( = ?auto_39670 ?auto_39676 ) ) ( not ( = ?auto_39671 ?auto_39676 ) ) ( not ( = ?auto_39672 ?auto_39676 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_39676 ?auto_39675 ?auto_39674 )
      ( MAKE-5PILE ?auto_39670 ?auto_39671 ?auto_39672 ?auto_39673 ?auto_39674 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_39677 - BLOCK
      ?auto_39678 - BLOCK
      ?auto_39679 - BLOCK
      ?auto_39680 - BLOCK
      ?auto_39681 - BLOCK
    )
    :vars
    (
      ?auto_39683 - BLOCK
      ?auto_39682 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_39677 ) ( ON ?auto_39678 ?auto_39677 ) ( not ( = ?auto_39677 ?auto_39678 ) ) ( not ( = ?auto_39677 ?auto_39679 ) ) ( not ( = ?auto_39677 ?auto_39680 ) ) ( not ( = ?auto_39677 ?auto_39681 ) ) ( not ( = ?auto_39678 ?auto_39679 ) ) ( not ( = ?auto_39678 ?auto_39680 ) ) ( not ( = ?auto_39678 ?auto_39681 ) ) ( not ( = ?auto_39679 ?auto_39680 ) ) ( not ( = ?auto_39679 ?auto_39681 ) ) ( not ( = ?auto_39680 ?auto_39681 ) ) ( ON ?auto_39681 ?auto_39683 ) ( not ( = ?auto_39677 ?auto_39683 ) ) ( not ( = ?auto_39678 ?auto_39683 ) ) ( not ( = ?auto_39679 ?auto_39683 ) ) ( not ( = ?auto_39680 ?auto_39683 ) ) ( not ( = ?auto_39681 ?auto_39683 ) ) ( ON ?auto_39680 ?auto_39681 ) ( CLEAR ?auto_39680 ) ( ON-TABLE ?auto_39682 ) ( ON ?auto_39683 ?auto_39682 ) ( not ( = ?auto_39682 ?auto_39683 ) ) ( not ( = ?auto_39682 ?auto_39681 ) ) ( not ( = ?auto_39682 ?auto_39680 ) ) ( not ( = ?auto_39677 ?auto_39682 ) ) ( not ( = ?auto_39678 ?auto_39682 ) ) ( not ( = ?auto_39679 ?auto_39682 ) ) ( HOLDING ?auto_39679 ) ( CLEAR ?auto_39678 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_39677 ?auto_39678 ?auto_39679 )
      ( MAKE-5PILE ?auto_39677 ?auto_39678 ?auto_39679 ?auto_39680 ?auto_39681 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_39684 - BLOCK
      ?auto_39685 - BLOCK
      ?auto_39686 - BLOCK
      ?auto_39687 - BLOCK
      ?auto_39688 - BLOCK
    )
    :vars
    (
      ?auto_39690 - BLOCK
      ?auto_39689 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_39684 ) ( ON ?auto_39685 ?auto_39684 ) ( not ( = ?auto_39684 ?auto_39685 ) ) ( not ( = ?auto_39684 ?auto_39686 ) ) ( not ( = ?auto_39684 ?auto_39687 ) ) ( not ( = ?auto_39684 ?auto_39688 ) ) ( not ( = ?auto_39685 ?auto_39686 ) ) ( not ( = ?auto_39685 ?auto_39687 ) ) ( not ( = ?auto_39685 ?auto_39688 ) ) ( not ( = ?auto_39686 ?auto_39687 ) ) ( not ( = ?auto_39686 ?auto_39688 ) ) ( not ( = ?auto_39687 ?auto_39688 ) ) ( ON ?auto_39688 ?auto_39690 ) ( not ( = ?auto_39684 ?auto_39690 ) ) ( not ( = ?auto_39685 ?auto_39690 ) ) ( not ( = ?auto_39686 ?auto_39690 ) ) ( not ( = ?auto_39687 ?auto_39690 ) ) ( not ( = ?auto_39688 ?auto_39690 ) ) ( ON ?auto_39687 ?auto_39688 ) ( ON-TABLE ?auto_39689 ) ( ON ?auto_39690 ?auto_39689 ) ( not ( = ?auto_39689 ?auto_39690 ) ) ( not ( = ?auto_39689 ?auto_39688 ) ) ( not ( = ?auto_39689 ?auto_39687 ) ) ( not ( = ?auto_39684 ?auto_39689 ) ) ( not ( = ?auto_39685 ?auto_39689 ) ) ( not ( = ?auto_39686 ?auto_39689 ) ) ( CLEAR ?auto_39685 ) ( ON ?auto_39686 ?auto_39687 ) ( CLEAR ?auto_39686 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_39689 ?auto_39690 ?auto_39688 ?auto_39687 )
      ( MAKE-5PILE ?auto_39684 ?auto_39685 ?auto_39686 ?auto_39687 ?auto_39688 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_39691 - BLOCK
      ?auto_39692 - BLOCK
      ?auto_39693 - BLOCK
      ?auto_39694 - BLOCK
      ?auto_39695 - BLOCK
    )
    :vars
    (
      ?auto_39696 - BLOCK
      ?auto_39697 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_39691 ) ( not ( = ?auto_39691 ?auto_39692 ) ) ( not ( = ?auto_39691 ?auto_39693 ) ) ( not ( = ?auto_39691 ?auto_39694 ) ) ( not ( = ?auto_39691 ?auto_39695 ) ) ( not ( = ?auto_39692 ?auto_39693 ) ) ( not ( = ?auto_39692 ?auto_39694 ) ) ( not ( = ?auto_39692 ?auto_39695 ) ) ( not ( = ?auto_39693 ?auto_39694 ) ) ( not ( = ?auto_39693 ?auto_39695 ) ) ( not ( = ?auto_39694 ?auto_39695 ) ) ( ON ?auto_39695 ?auto_39696 ) ( not ( = ?auto_39691 ?auto_39696 ) ) ( not ( = ?auto_39692 ?auto_39696 ) ) ( not ( = ?auto_39693 ?auto_39696 ) ) ( not ( = ?auto_39694 ?auto_39696 ) ) ( not ( = ?auto_39695 ?auto_39696 ) ) ( ON ?auto_39694 ?auto_39695 ) ( ON-TABLE ?auto_39697 ) ( ON ?auto_39696 ?auto_39697 ) ( not ( = ?auto_39697 ?auto_39696 ) ) ( not ( = ?auto_39697 ?auto_39695 ) ) ( not ( = ?auto_39697 ?auto_39694 ) ) ( not ( = ?auto_39691 ?auto_39697 ) ) ( not ( = ?auto_39692 ?auto_39697 ) ) ( not ( = ?auto_39693 ?auto_39697 ) ) ( ON ?auto_39693 ?auto_39694 ) ( CLEAR ?auto_39693 ) ( HOLDING ?auto_39692 ) ( CLEAR ?auto_39691 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_39691 ?auto_39692 )
      ( MAKE-5PILE ?auto_39691 ?auto_39692 ?auto_39693 ?auto_39694 ?auto_39695 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_39698 - BLOCK
      ?auto_39699 - BLOCK
      ?auto_39700 - BLOCK
      ?auto_39701 - BLOCK
      ?auto_39702 - BLOCK
    )
    :vars
    (
      ?auto_39704 - BLOCK
      ?auto_39703 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_39698 ) ( not ( = ?auto_39698 ?auto_39699 ) ) ( not ( = ?auto_39698 ?auto_39700 ) ) ( not ( = ?auto_39698 ?auto_39701 ) ) ( not ( = ?auto_39698 ?auto_39702 ) ) ( not ( = ?auto_39699 ?auto_39700 ) ) ( not ( = ?auto_39699 ?auto_39701 ) ) ( not ( = ?auto_39699 ?auto_39702 ) ) ( not ( = ?auto_39700 ?auto_39701 ) ) ( not ( = ?auto_39700 ?auto_39702 ) ) ( not ( = ?auto_39701 ?auto_39702 ) ) ( ON ?auto_39702 ?auto_39704 ) ( not ( = ?auto_39698 ?auto_39704 ) ) ( not ( = ?auto_39699 ?auto_39704 ) ) ( not ( = ?auto_39700 ?auto_39704 ) ) ( not ( = ?auto_39701 ?auto_39704 ) ) ( not ( = ?auto_39702 ?auto_39704 ) ) ( ON ?auto_39701 ?auto_39702 ) ( ON-TABLE ?auto_39703 ) ( ON ?auto_39704 ?auto_39703 ) ( not ( = ?auto_39703 ?auto_39704 ) ) ( not ( = ?auto_39703 ?auto_39702 ) ) ( not ( = ?auto_39703 ?auto_39701 ) ) ( not ( = ?auto_39698 ?auto_39703 ) ) ( not ( = ?auto_39699 ?auto_39703 ) ) ( not ( = ?auto_39700 ?auto_39703 ) ) ( ON ?auto_39700 ?auto_39701 ) ( CLEAR ?auto_39698 ) ( ON ?auto_39699 ?auto_39700 ) ( CLEAR ?auto_39699 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_39703 ?auto_39704 ?auto_39702 ?auto_39701 ?auto_39700 )
      ( MAKE-5PILE ?auto_39698 ?auto_39699 ?auto_39700 ?auto_39701 ?auto_39702 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_39705 - BLOCK
      ?auto_39706 - BLOCK
      ?auto_39707 - BLOCK
      ?auto_39708 - BLOCK
      ?auto_39709 - BLOCK
    )
    :vars
    (
      ?auto_39710 - BLOCK
      ?auto_39711 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_39705 ?auto_39706 ) ) ( not ( = ?auto_39705 ?auto_39707 ) ) ( not ( = ?auto_39705 ?auto_39708 ) ) ( not ( = ?auto_39705 ?auto_39709 ) ) ( not ( = ?auto_39706 ?auto_39707 ) ) ( not ( = ?auto_39706 ?auto_39708 ) ) ( not ( = ?auto_39706 ?auto_39709 ) ) ( not ( = ?auto_39707 ?auto_39708 ) ) ( not ( = ?auto_39707 ?auto_39709 ) ) ( not ( = ?auto_39708 ?auto_39709 ) ) ( ON ?auto_39709 ?auto_39710 ) ( not ( = ?auto_39705 ?auto_39710 ) ) ( not ( = ?auto_39706 ?auto_39710 ) ) ( not ( = ?auto_39707 ?auto_39710 ) ) ( not ( = ?auto_39708 ?auto_39710 ) ) ( not ( = ?auto_39709 ?auto_39710 ) ) ( ON ?auto_39708 ?auto_39709 ) ( ON-TABLE ?auto_39711 ) ( ON ?auto_39710 ?auto_39711 ) ( not ( = ?auto_39711 ?auto_39710 ) ) ( not ( = ?auto_39711 ?auto_39709 ) ) ( not ( = ?auto_39711 ?auto_39708 ) ) ( not ( = ?auto_39705 ?auto_39711 ) ) ( not ( = ?auto_39706 ?auto_39711 ) ) ( not ( = ?auto_39707 ?auto_39711 ) ) ( ON ?auto_39707 ?auto_39708 ) ( ON ?auto_39706 ?auto_39707 ) ( CLEAR ?auto_39706 ) ( HOLDING ?auto_39705 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_39705 )
      ( MAKE-5PILE ?auto_39705 ?auto_39706 ?auto_39707 ?auto_39708 ?auto_39709 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_39712 - BLOCK
      ?auto_39713 - BLOCK
      ?auto_39714 - BLOCK
      ?auto_39715 - BLOCK
      ?auto_39716 - BLOCK
    )
    :vars
    (
      ?auto_39718 - BLOCK
      ?auto_39717 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_39712 ?auto_39713 ) ) ( not ( = ?auto_39712 ?auto_39714 ) ) ( not ( = ?auto_39712 ?auto_39715 ) ) ( not ( = ?auto_39712 ?auto_39716 ) ) ( not ( = ?auto_39713 ?auto_39714 ) ) ( not ( = ?auto_39713 ?auto_39715 ) ) ( not ( = ?auto_39713 ?auto_39716 ) ) ( not ( = ?auto_39714 ?auto_39715 ) ) ( not ( = ?auto_39714 ?auto_39716 ) ) ( not ( = ?auto_39715 ?auto_39716 ) ) ( ON ?auto_39716 ?auto_39718 ) ( not ( = ?auto_39712 ?auto_39718 ) ) ( not ( = ?auto_39713 ?auto_39718 ) ) ( not ( = ?auto_39714 ?auto_39718 ) ) ( not ( = ?auto_39715 ?auto_39718 ) ) ( not ( = ?auto_39716 ?auto_39718 ) ) ( ON ?auto_39715 ?auto_39716 ) ( ON-TABLE ?auto_39717 ) ( ON ?auto_39718 ?auto_39717 ) ( not ( = ?auto_39717 ?auto_39718 ) ) ( not ( = ?auto_39717 ?auto_39716 ) ) ( not ( = ?auto_39717 ?auto_39715 ) ) ( not ( = ?auto_39712 ?auto_39717 ) ) ( not ( = ?auto_39713 ?auto_39717 ) ) ( not ( = ?auto_39714 ?auto_39717 ) ) ( ON ?auto_39714 ?auto_39715 ) ( ON ?auto_39713 ?auto_39714 ) ( ON ?auto_39712 ?auto_39713 ) ( CLEAR ?auto_39712 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_39717 ?auto_39718 ?auto_39716 ?auto_39715 ?auto_39714 ?auto_39713 )
      ( MAKE-5PILE ?auto_39712 ?auto_39713 ?auto_39714 ?auto_39715 ?auto_39716 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_39720 - BLOCK
    )
    :vars
    (
      ?auto_39721 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_39721 ?auto_39720 ) ( CLEAR ?auto_39721 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_39720 ) ( not ( = ?auto_39720 ?auto_39721 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_39721 ?auto_39720 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_39722 - BLOCK
    )
    :vars
    (
      ?auto_39723 - BLOCK
      ?auto_39724 - BLOCK
      ?auto_39725 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_39723 ?auto_39722 ) ( CLEAR ?auto_39723 ) ( ON-TABLE ?auto_39722 ) ( not ( = ?auto_39722 ?auto_39723 ) ) ( HOLDING ?auto_39724 ) ( CLEAR ?auto_39725 ) ( not ( = ?auto_39722 ?auto_39724 ) ) ( not ( = ?auto_39722 ?auto_39725 ) ) ( not ( = ?auto_39723 ?auto_39724 ) ) ( not ( = ?auto_39723 ?auto_39725 ) ) ( not ( = ?auto_39724 ?auto_39725 ) ) )
    :subtasks
    ( ( !STACK ?auto_39724 ?auto_39725 )
      ( MAKE-1PILE ?auto_39722 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_39726 - BLOCK
    )
    :vars
    (
      ?auto_39729 - BLOCK
      ?auto_39728 - BLOCK
      ?auto_39727 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_39729 ?auto_39726 ) ( ON-TABLE ?auto_39726 ) ( not ( = ?auto_39726 ?auto_39729 ) ) ( CLEAR ?auto_39728 ) ( not ( = ?auto_39726 ?auto_39727 ) ) ( not ( = ?auto_39726 ?auto_39728 ) ) ( not ( = ?auto_39729 ?auto_39727 ) ) ( not ( = ?auto_39729 ?auto_39728 ) ) ( not ( = ?auto_39727 ?auto_39728 ) ) ( ON ?auto_39727 ?auto_39729 ) ( CLEAR ?auto_39727 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_39726 ?auto_39729 )
      ( MAKE-1PILE ?auto_39726 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_39730 - BLOCK
    )
    :vars
    (
      ?auto_39732 - BLOCK
      ?auto_39733 - BLOCK
      ?auto_39731 - BLOCK
      ?auto_39736 - BLOCK
      ?auto_39735 - BLOCK
      ?auto_39734 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_39732 ?auto_39730 ) ( ON-TABLE ?auto_39730 ) ( not ( = ?auto_39730 ?auto_39732 ) ) ( not ( = ?auto_39730 ?auto_39733 ) ) ( not ( = ?auto_39730 ?auto_39731 ) ) ( not ( = ?auto_39732 ?auto_39733 ) ) ( not ( = ?auto_39732 ?auto_39731 ) ) ( not ( = ?auto_39733 ?auto_39731 ) ) ( ON ?auto_39733 ?auto_39732 ) ( CLEAR ?auto_39733 ) ( HOLDING ?auto_39731 ) ( CLEAR ?auto_39736 ) ( ON-TABLE ?auto_39735 ) ( ON ?auto_39734 ?auto_39735 ) ( ON ?auto_39736 ?auto_39734 ) ( not ( = ?auto_39735 ?auto_39734 ) ) ( not ( = ?auto_39735 ?auto_39736 ) ) ( not ( = ?auto_39735 ?auto_39731 ) ) ( not ( = ?auto_39734 ?auto_39736 ) ) ( not ( = ?auto_39734 ?auto_39731 ) ) ( not ( = ?auto_39736 ?auto_39731 ) ) ( not ( = ?auto_39730 ?auto_39736 ) ) ( not ( = ?auto_39730 ?auto_39735 ) ) ( not ( = ?auto_39730 ?auto_39734 ) ) ( not ( = ?auto_39732 ?auto_39736 ) ) ( not ( = ?auto_39732 ?auto_39735 ) ) ( not ( = ?auto_39732 ?auto_39734 ) ) ( not ( = ?auto_39733 ?auto_39736 ) ) ( not ( = ?auto_39733 ?auto_39735 ) ) ( not ( = ?auto_39733 ?auto_39734 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_39735 ?auto_39734 ?auto_39736 ?auto_39731 )
      ( MAKE-1PILE ?auto_39730 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_39737 - BLOCK
    )
    :vars
    (
      ?auto_39742 - BLOCK
      ?auto_39738 - BLOCK
      ?auto_39741 - BLOCK
      ?auto_39740 - BLOCK
      ?auto_39743 - BLOCK
      ?auto_39739 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_39742 ?auto_39737 ) ( ON-TABLE ?auto_39737 ) ( not ( = ?auto_39737 ?auto_39742 ) ) ( not ( = ?auto_39737 ?auto_39738 ) ) ( not ( = ?auto_39737 ?auto_39741 ) ) ( not ( = ?auto_39742 ?auto_39738 ) ) ( not ( = ?auto_39742 ?auto_39741 ) ) ( not ( = ?auto_39738 ?auto_39741 ) ) ( ON ?auto_39738 ?auto_39742 ) ( CLEAR ?auto_39740 ) ( ON-TABLE ?auto_39743 ) ( ON ?auto_39739 ?auto_39743 ) ( ON ?auto_39740 ?auto_39739 ) ( not ( = ?auto_39743 ?auto_39739 ) ) ( not ( = ?auto_39743 ?auto_39740 ) ) ( not ( = ?auto_39743 ?auto_39741 ) ) ( not ( = ?auto_39739 ?auto_39740 ) ) ( not ( = ?auto_39739 ?auto_39741 ) ) ( not ( = ?auto_39740 ?auto_39741 ) ) ( not ( = ?auto_39737 ?auto_39740 ) ) ( not ( = ?auto_39737 ?auto_39743 ) ) ( not ( = ?auto_39737 ?auto_39739 ) ) ( not ( = ?auto_39742 ?auto_39740 ) ) ( not ( = ?auto_39742 ?auto_39743 ) ) ( not ( = ?auto_39742 ?auto_39739 ) ) ( not ( = ?auto_39738 ?auto_39740 ) ) ( not ( = ?auto_39738 ?auto_39743 ) ) ( not ( = ?auto_39738 ?auto_39739 ) ) ( ON ?auto_39741 ?auto_39738 ) ( CLEAR ?auto_39741 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_39737 ?auto_39742 ?auto_39738 )
      ( MAKE-1PILE ?auto_39737 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_39744 - BLOCK
    )
    :vars
    (
      ?auto_39748 - BLOCK
      ?auto_39747 - BLOCK
      ?auto_39750 - BLOCK
      ?auto_39745 - BLOCK
      ?auto_39746 - BLOCK
      ?auto_39749 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_39748 ?auto_39744 ) ( ON-TABLE ?auto_39744 ) ( not ( = ?auto_39744 ?auto_39748 ) ) ( not ( = ?auto_39744 ?auto_39747 ) ) ( not ( = ?auto_39744 ?auto_39750 ) ) ( not ( = ?auto_39748 ?auto_39747 ) ) ( not ( = ?auto_39748 ?auto_39750 ) ) ( not ( = ?auto_39747 ?auto_39750 ) ) ( ON ?auto_39747 ?auto_39748 ) ( ON-TABLE ?auto_39745 ) ( ON ?auto_39746 ?auto_39745 ) ( not ( = ?auto_39745 ?auto_39746 ) ) ( not ( = ?auto_39745 ?auto_39749 ) ) ( not ( = ?auto_39745 ?auto_39750 ) ) ( not ( = ?auto_39746 ?auto_39749 ) ) ( not ( = ?auto_39746 ?auto_39750 ) ) ( not ( = ?auto_39749 ?auto_39750 ) ) ( not ( = ?auto_39744 ?auto_39749 ) ) ( not ( = ?auto_39744 ?auto_39745 ) ) ( not ( = ?auto_39744 ?auto_39746 ) ) ( not ( = ?auto_39748 ?auto_39749 ) ) ( not ( = ?auto_39748 ?auto_39745 ) ) ( not ( = ?auto_39748 ?auto_39746 ) ) ( not ( = ?auto_39747 ?auto_39749 ) ) ( not ( = ?auto_39747 ?auto_39745 ) ) ( not ( = ?auto_39747 ?auto_39746 ) ) ( ON ?auto_39750 ?auto_39747 ) ( CLEAR ?auto_39750 ) ( HOLDING ?auto_39749 ) ( CLEAR ?auto_39746 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_39745 ?auto_39746 ?auto_39749 )
      ( MAKE-1PILE ?auto_39744 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_39751 - BLOCK
    )
    :vars
    (
      ?auto_39755 - BLOCK
      ?auto_39752 - BLOCK
      ?auto_39756 - BLOCK
      ?auto_39757 - BLOCK
      ?auto_39754 - BLOCK
      ?auto_39753 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_39755 ?auto_39751 ) ( ON-TABLE ?auto_39751 ) ( not ( = ?auto_39751 ?auto_39755 ) ) ( not ( = ?auto_39751 ?auto_39752 ) ) ( not ( = ?auto_39751 ?auto_39756 ) ) ( not ( = ?auto_39755 ?auto_39752 ) ) ( not ( = ?auto_39755 ?auto_39756 ) ) ( not ( = ?auto_39752 ?auto_39756 ) ) ( ON ?auto_39752 ?auto_39755 ) ( ON-TABLE ?auto_39757 ) ( ON ?auto_39754 ?auto_39757 ) ( not ( = ?auto_39757 ?auto_39754 ) ) ( not ( = ?auto_39757 ?auto_39753 ) ) ( not ( = ?auto_39757 ?auto_39756 ) ) ( not ( = ?auto_39754 ?auto_39753 ) ) ( not ( = ?auto_39754 ?auto_39756 ) ) ( not ( = ?auto_39753 ?auto_39756 ) ) ( not ( = ?auto_39751 ?auto_39753 ) ) ( not ( = ?auto_39751 ?auto_39757 ) ) ( not ( = ?auto_39751 ?auto_39754 ) ) ( not ( = ?auto_39755 ?auto_39753 ) ) ( not ( = ?auto_39755 ?auto_39757 ) ) ( not ( = ?auto_39755 ?auto_39754 ) ) ( not ( = ?auto_39752 ?auto_39753 ) ) ( not ( = ?auto_39752 ?auto_39757 ) ) ( not ( = ?auto_39752 ?auto_39754 ) ) ( ON ?auto_39756 ?auto_39752 ) ( CLEAR ?auto_39754 ) ( ON ?auto_39753 ?auto_39756 ) ( CLEAR ?auto_39753 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_39751 ?auto_39755 ?auto_39752 ?auto_39756 )
      ( MAKE-1PILE ?auto_39751 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_39758 - BLOCK
    )
    :vars
    (
      ?auto_39763 - BLOCK
      ?auto_39764 - BLOCK
      ?auto_39762 - BLOCK
      ?auto_39761 - BLOCK
      ?auto_39759 - BLOCK
      ?auto_39760 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_39763 ?auto_39758 ) ( ON-TABLE ?auto_39758 ) ( not ( = ?auto_39758 ?auto_39763 ) ) ( not ( = ?auto_39758 ?auto_39764 ) ) ( not ( = ?auto_39758 ?auto_39762 ) ) ( not ( = ?auto_39763 ?auto_39764 ) ) ( not ( = ?auto_39763 ?auto_39762 ) ) ( not ( = ?auto_39764 ?auto_39762 ) ) ( ON ?auto_39764 ?auto_39763 ) ( ON-TABLE ?auto_39761 ) ( not ( = ?auto_39761 ?auto_39759 ) ) ( not ( = ?auto_39761 ?auto_39760 ) ) ( not ( = ?auto_39761 ?auto_39762 ) ) ( not ( = ?auto_39759 ?auto_39760 ) ) ( not ( = ?auto_39759 ?auto_39762 ) ) ( not ( = ?auto_39760 ?auto_39762 ) ) ( not ( = ?auto_39758 ?auto_39760 ) ) ( not ( = ?auto_39758 ?auto_39761 ) ) ( not ( = ?auto_39758 ?auto_39759 ) ) ( not ( = ?auto_39763 ?auto_39760 ) ) ( not ( = ?auto_39763 ?auto_39761 ) ) ( not ( = ?auto_39763 ?auto_39759 ) ) ( not ( = ?auto_39764 ?auto_39760 ) ) ( not ( = ?auto_39764 ?auto_39761 ) ) ( not ( = ?auto_39764 ?auto_39759 ) ) ( ON ?auto_39762 ?auto_39764 ) ( ON ?auto_39760 ?auto_39762 ) ( CLEAR ?auto_39760 ) ( HOLDING ?auto_39759 ) ( CLEAR ?auto_39761 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_39761 ?auto_39759 )
      ( MAKE-1PILE ?auto_39758 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_39765 - BLOCK
    )
    :vars
    (
      ?auto_39767 - BLOCK
      ?auto_39770 - BLOCK
      ?auto_39769 - BLOCK
      ?auto_39768 - BLOCK
      ?auto_39771 - BLOCK
      ?auto_39766 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_39767 ?auto_39765 ) ( ON-TABLE ?auto_39765 ) ( not ( = ?auto_39765 ?auto_39767 ) ) ( not ( = ?auto_39765 ?auto_39770 ) ) ( not ( = ?auto_39765 ?auto_39769 ) ) ( not ( = ?auto_39767 ?auto_39770 ) ) ( not ( = ?auto_39767 ?auto_39769 ) ) ( not ( = ?auto_39770 ?auto_39769 ) ) ( ON ?auto_39770 ?auto_39767 ) ( ON-TABLE ?auto_39768 ) ( not ( = ?auto_39768 ?auto_39771 ) ) ( not ( = ?auto_39768 ?auto_39766 ) ) ( not ( = ?auto_39768 ?auto_39769 ) ) ( not ( = ?auto_39771 ?auto_39766 ) ) ( not ( = ?auto_39771 ?auto_39769 ) ) ( not ( = ?auto_39766 ?auto_39769 ) ) ( not ( = ?auto_39765 ?auto_39766 ) ) ( not ( = ?auto_39765 ?auto_39768 ) ) ( not ( = ?auto_39765 ?auto_39771 ) ) ( not ( = ?auto_39767 ?auto_39766 ) ) ( not ( = ?auto_39767 ?auto_39768 ) ) ( not ( = ?auto_39767 ?auto_39771 ) ) ( not ( = ?auto_39770 ?auto_39766 ) ) ( not ( = ?auto_39770 ?auto_39768 ) ) ( not ( = ?auto_39770 ?auto_39771 ) ) ( ON ?auto_39769 ?auto_39770 ) ( ON ?auto_39766 ?auto_39769 ) ( CLEAR ?auto_39768 ) ( ON ?auto_39771 ?auto_39766 ) ( CLEAR ?auto_39771 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_39765 ?auto_39767 ?auto_39770 ?auto_39769 ?auto_39766 )
      ( MAKE-1PILE ?auto_39765 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_39772 - BLOCK
    )
    :vars
    (
      ?auto_39776 - BLOCK
      ?auto_39777 - BLOCK
      ?auto_39778 - BLOCK
      ?auto_39775 - BLOCK
      ?auto_39774 - BLOCK
      ?auto_39773 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_39776 ?auto_39772 ) ( ON-TABLE ?auto_39772 ) ( not ( = ?auto_39772 ?auto_39776 ) ) ( not ( = ?auto_39772 ?auto_39777 ) ) ( not ( = ?auto_39772 ?auto_39778 ) ) ( not ( = ?auto_39776 ?auto_39777 ) ) ( not ( = ?auto_39776 ?auto_39778 ) ) ( not ( = ?auto_39777 ?auto_39778 ) ) ( ON ?auto_39777 ?auto_39776 ) ( not ( = ?auto_39775 ?auto_39774 ) ) ( not ( = ?auto_39775 ?auto_39773 ) ) ( not ( = ?auto_39775 ?auto_39778 ) ) ( not ( = ?auto_39774 ?auto_39773 ) ) ( not ( = ?auto_39774 ?auto_39778 ) ) ( not ( = ?auto_39773 ?auto_39778 ) ) ( not ( = ?auto_39772 ?auto_39773 ) ) ( not ( = ?auto_39772 ?auto_39775 ) ) ( not ( = ?auto_39772 ?auto_39774 ) ) ( not ( = ?auto_39776 ?auto_39773 ) ) ( not ( = ?auto_39776 ?auto_39775 ) ) ( not ( = ?auto_39776 ?auto_39774 ) ) ( not ( = ?auto_39777 ?auto_39773 ) ) ( not ( = ?auto_39777 ?auto_39775 ) ) ( not ( = ?auto_39777 ?auto_39774 ) ) ( ON ?auto_39778 ?auto_39777 ) ( ON ?auto_39773 ?auto_39778 ) ( ON ?auto_39774 ?auto_39773 ) ( CLEAR ?auto_39774 ) ( HOLDING ?auto_39775 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_39775 )
      ( MAKE-1PILE ?auto_39772 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_39779 - BLOCK
    )
    :vars
    (
      ?auto_39785 - BLOCK
      ?auto_39780 - BLOCK
      ?auto_39781 - BLOCK
      ?auto_39784 - BLOCK
      ?auto_39783 - BLOCK
      ?auto_39782 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_39785 ?auto_39779 ) ( ON-TABLE ?auto_39779 ) ( not ( = ?auto_39779 ?auto_39785 ) ) ( not ( = ?auto_39779 ?auto_39780 ) ) ( not ( = ?auto_39779 ?auto_39781 ) ) ( not ( = ?auto_39785 ?auto_39780 ) ) ( not ( = ?auto_39785 ?auto_39781 ) ) ( not ( = ?auto_39780 ?auto_39781 ) ) ( ON ?auto_39780 ?auto_39785 ) ( not ( = ?auto_39784 ?auto_39783 ) ) ( not ( = ?auto_39784 ?auto_39782 ) ) ( not ( = ?auto_39784 ?auto_39781 ) ) ( not ( = ?auto_39783 ?auto_39782 ) ) ( not ( = ?auto_39783 ?auto_39781 ) ) ( not ( = ?auto_39782 ?auto_39781 ) ) ( not ( = ?auto_39779 ?auto_39782 ) ) ( not ( = ?auto_39779 ?auto_39784 ) ) ( not ( = ?auto_39779 ?auto_39783 ) ) ( not ( = ?auto_39785 ?auto_39782 ) ) ( not ( = ?auto_39785 ?auto_39784 ) ) ( not ( = ?auto_39785 ?auto_39783 ) ) ( not ( = ?auto_39780 ?auto_39782 ) ) ( not ( = ?auto_39780 ?auto_39784 ) ) ( not ( = ?auto_39780 ?auto_39783 ) ) ( ON ?auto_39781 ?auto_39780 ) ( ON ?auto_39782 ?auto_39781 ) ( ON ?auto_39783 ?auto_39782 ) ( ON ?auto_39784 ?auto_39783 ) ( CLEAR ?auto_39784 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_39779 ?auto_39785 ?auto_39780 ?auto_39781 ?auto_39782 ?auto_39783 )
      ( MAKE-1PILE ?auto_39779 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_39792 - BLOCK
      ?auto_39793 - BLOCK
      ?auto_39794 - BLOCK
      ?auto_39795 - BLOCK
      ?auto_39796 - BLOCK
      ?auto_39797 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_39797 ) ( CLEAR ?auto_39796 ) ( ON-TABLE ?auto_39792 ) ( ON ?auto_39793 ?auto_39792 ) ( ON ?auto_39794 ?auto_39793 ) ( ON ?auto_39795 ?auto_39794 ) ( ON ?auto_39796 ?auto_39795 ) ( not ( = ?auto_39792 ?auto_39793 ) ) ( not ( = ?auto_39792 ?auto_39794 ) ) ( not ( = ?auto_39792 ?auto_39795 ) ) ( not ( = ?auto_39792 ?auto_39796 ) ) ( not ( = ?auto_39792 ?auto_39797 ) ) ( not ( = ?auto_39793 ?auto_39794 ) ) ( not ( = ?auto_39793 ?auto_39795 ) ) ( not ( = ?auto_39793 ?auto_39796 ) ) ( not ( = ?auto_39793 ?auto_39797 ) ) ( not ( = ?auto_39794 ?auto_39795 ) ) ( not ( = ?auto_39794 ?auto_39796 ) ) ( not ( = ?auto_39794 ?auto_39797 ) ) ( not ( = ?auto_39795 ?auto_39796 ) ) ( not ( = ?auto_39795 ?auto_39797 ) ) ( not ( = ?auto_39796 ?auto_39797 ) ) )
    :subtasks
    ( ( !STACK ?auto_39797 ?auto_39796 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_39798 - BLOCK
      ?auto_39799 - BLOCK
      ?auto_39800 - BLOCK
      ?auto_39801 - BLOCK
      ?auto_39802 - BLOCK
      ?auto_39803 - BLOCK
    )
    :vars
    (
      ?auto_39804 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_39802 ) ( ON-TABLE ?auto_39798 ) ( ON ?auto_39799 ?auto_39798 ) ( ON ?auto_39800 ?auto_39799 ) ( ON ?auto_39801 ?auto_39800 ) ( ON ?auto_39802 ?auto_39801 ) ( not ( = ?auto_39798 ?auto_39799 ) ) ( not ( = ?auto_39798 ?auto_39800 ) ) ( not ( = ?auto_39798 ?auto_39801 ) ) ( not ( = ?auto_39798 ?auto_39802 ) ) ( not ( = ?auto_39798 ?auto_39803 ) ) ( not ( = ?auto_39799 ?auto_39800 ) ) ( not ( = ?auto_39799 ?auto_39801 ) ) ( not ( = ?auto_39799 ?auto_39802 ) ) ( not ( = ?auto_39799 ?auto_39803 ) ) ( not ( = ?auto_39800 ?auto_39801 ) ) ( not ( = ?auto_39800 ?auto_39802 ) ) ( not ( = ?auto_39800 ?auto_39803 ) ) ( not ( = ?auto_39801 ?auto_39802 ) ) ( not ( = ?auto_39801 ?auto_39803 ) ) ( not ( = ?auto_39802 ?auto_39803 ) ) ( ON ?auto_39803 ?auto_39804 ) ( CLEAR ?auto_39803 ) ( HAND-EMPTY ) ( not ( = ?auto_39798 ?auto_39804 ) ) ( not ( = ?auto_39799 ?auto_39804 ) ) ( not ( = ?auto_39800 ?auto_39804 ) ) ( not ( = ?auto_39801 ?auto_39804 ) ) ( not ( = ?auto_39802 ?auto_39804 ) ) ( not ( = ?auto_39803 ?auto_39804 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_39803 ?auto_39804 )
      ( MAKE-6PILE ?auto_39798 ?auto_39799 ?auto_39800 ?auto_39801 ?auto_39802 ?auto_39803 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_39805 - BLOCK
      ?auto_39806 - BLOCK
      ?auto_39807 - BLOCK
      ?auto_39808 - BLOCK
      ?auto_39809 - BLOCK
      ?auto_39810 - BLOCK
    )
    :vars
    (
      ?auto_39811 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_39805 ) ( ON ?auto_39806 ?auto_39805 ) ( ON ?auto_39807 ?auto_39806 ) ( ON ?auto_39808 ?auto_39807 ) ( not ( = ?auto_39805 ?auto_39806 ) ) ( not ( = ?auto_39805 ?auto_39807 ) ) ( not ( = ?auto_39805 ?auto_39808 ) ) ( not ( = ?auto_39805 ?auto_39809 ) ) ( not ( = ?auto_39805 ?auto_39810 ) ) ( not ( = ?auto_39806 ?auto_39807 ) ) ( not ( = ?auto_39806 ?auto_39808 ) ) ( not ( = ?auto_39806 ?auto_39809 ) ) ( not ( = ?auto_39806 ?auto_39810 ) ) ( not ( = ?auto_39807 ?auto_39808 ) ) ( not ( = ?auto_39807 ?auto_39809 ) ) ( not ( = ?auto_39807 ?auto_39810 ) ) ( not ( = ?auto_39808 ?auto_39809 ) ) ( not ( = ?auto_39808 ?auto_39810 ) ) ( not ( = ?auto_39809 ?auto_39810 ) ) ( ON ?auto_39810 ?auto_39811 ) ( CLEAR ?auto_39810 ) ( not ( = ?auto_39805 ?auto_39811 ) ) ( not ( = ?auto_39806 ?auto_39811 ) ) ( not ( = ?auto_39807 ?auto_39811 ) ) ( not ( = ?auto_39808 ?auto_39811 ) ) ( not ( = ?auto_39809 ?auto_39811 ) ) ( not ( = ?auto_39810 ?auto_39811 ) ) ( HOLDING ?auto_39809 ) ( CLEAR ?auto_39808 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_39805 ?auto_39806 ?auto_39807 ?auto_39808 ?auto_39809 )
      ( MAKE-6PILE ?auto_39805 ?auto_39806 ?auto_39807 ?auto_39808 ?auto_39809 ?auto_39810 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_39812 - BLOCK
      ?auto_39813 - BLOCK
      ?auto_39814 - BLOCK
      ?auto_39815 - BLOCK
      ?auto_39816 - BLOCK
      ?auto_39817 - BLOCK
    )
    :vars
    (
      ?auto_39818 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_39812 ) ( ON ?auto_39813 ?auto_39812 ) ( ON ?auto_39814 ?auto_39813 ) ( ON ?auto_39815 ?auto_39814 ) ( not ( = ?auto_39812 ?auto_39813 ) ) ( not ( = ?auto_39812 ?auto_39814 ) ) ( not ( = ?auto_39812 ?auto_39815 ) ) ( not ( = ?auto_39812 ?auto_39816 ) ) ( not ( = ?auto_39812 ?auto_39817 ) ) ( not ( = ?auto_39813 ?auto_39814 ) ) ( not ( = ?auto_39813 ?auto_39815 ) ) ( not ( = ?auto_39813 ?auto_39816 ) ) ( not ( = ?auto_39813 ?auto_39817 ) ) ( not ( = ?auto_39814 ?auto_39815 ) ) ( not ( = ?auto_39814 ?auto_39816 ) ) ( not ( = ?auto_39814 ?auto_39817 ) ) ( not ( = ?auto_39815 ?auto_39816 ) ) ( not ( = ?auto_39815 ?auto_39817 ) ) ( not ( = ?auto_39816 ?auto_39817 ) ) ( ON ?auto_39817 ?auto_39818 ) ( not ( = ?auto_39812 ?auto_39818 ) ) ( not ( = ?auto_39813 ?auto_39818 ) ) ( not ( = ?auto_39814 ?auto_39818 ) ) ( not ( = ?auto_39815 ?auto_39818 ) ) ( not ( = ?auto_39816 ?auto_39818 ) ) ( not ( = ?auto_39817 ?auto_39818 ) ) ( CLEAR ?auto_39815 ) ( ON ?auto_39816 ?auto_39817 ) ( CLEAR ?auto_39816 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_39818 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_39818 ?auto_39817 )
      ( MAKE-6PILE ?auto_39812 ?auto_39813 ?auto_39814 ?auto_39815 ?auto_39816 ?auto_39817 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_39819 - BLOCK
      ?auto_39820 - BLOCK
      ?auto_39821 - BLOCK
      ?auto_39822 - BLOCK
      ?auto_39823 - BLOCK
      ?auto_39824 - BLOCK
    )
    :vars
    (
      ?auto_39825 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_39819 ) ( ON ?auto_39820 ?auto_39819 ) ( ON ?auto_39821 ?auto_39820 ) ( not ( = ?auto_39819 ?auto_39820 ) ) ( not ( = ?auto_39819 ?auto_39821 ) ) ( not ( = ?auto_39819 ?auto_39822 ) ) ( not ( = ?auto_39819 ?auto_39823 ) ) ( not ( = ?auto_39819 ?auto_39824 ) ) ( not ( = ?auto_39820 ?auto_39821 ) ) ( not ( = ?auto_39820 ?auto_39822 ) ) ( not ( = ?auto_39820 ?auto_39823 ) ) ( not ( = ?auto_39820 ?auto_39824 ) ) ( not ( = ?auto_39821 ?auto_39822 ) ) ( not ( = ?auto_39821 ?auto_39823 ) ) ( not ( = ?auto_39821 ?auto_39824 ) ) ( not ( = ?auto_39822 ?auto_39823 ) ) ( not ( = ?auto_39822 ?auto_39824 ) ) ( not ( = ?auto_39823 ?auto_39824 ) ) ( ON ?auto_39824 ?auto_39825 ) ( not ( = ?auto_39819 ?auto_39825 ) ) ( not ( = ?auto_39820 ?auto_39825 ) ) ( not ( = ?auto_39821 ?auto_39825 ) ) ( not ( = ?auto_39822 ?auto_39825 ) ) ( not ( = ?auto_39823 ?auto_39825 ) ) ( not ( = ?auto_39824 ?auto_39825 ) ) ( ON ?auto_39823 ?auto_39824 ) ( CLEAR ?auto_39823 ) ( ON-TABLE ?auto_39825 ) ( HOLDING ?auto_39822 ) ( CLEAR ?auto_39821 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_39819 ?auto_39820 ?auto_39821 ?auto_39822 )
      ( MAKE-6PILE ?auto_39819 ?auto_39820 ?auto_39821 ?auto_39822 ?auto_39823 ?auto_39824 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_39826 - BLOCK
      ?auto_39827 - BLOCK
      ?auto_39828 - BLOCK
      ?auto_39829 - BLOCK
      ?auto_39830 - BLOCK
      ?auto_39831 - BLOCK
    )
    :vars
    (
      ?auto_39832 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_39826 ) ( ON ?auto_39827 ?auto_39826 ) ( ON ?auto_39828 ?auto_39827 ) ( not ( = ?auto_39826 ?auto_39827 ) ) ( not ( = ?auto_39826 ?auto_39828 ) ) ( not ( = ?auto_39826 ?auto_39829 ) ) ( not ( = ?auto_39826 ?auto_39830 ) ) ( not ( = ?auto_39826 ?auto_39831 ) ) ( not ( = ?auto_39827 ?auto_39828 ) ) ( not ( = ?auto_39827 ?auto_39829 ) ) ( not ( = ?auto_39827 ?auto_39830 ) ) ( not ( = ?auto_39827 ?auto_39831 ) ) ( not ( = ?auto_39828 ?auto_39829 ) ) ( not ( = ?auto_39828 ?auto_39830 ) ) ( not ( = ?auto_39828 ?auto_39831 ) ) ( not ( = ?auto_39829 ?auto_39830 ) ) ( not ( = ?auto_39829 ?auto_39831 ) ) ( not ( = ?auto_39830 ?auto_39831 ) ) ( ON ?auto_39831 ?auto_39832 ) ( not ( = ?auto_39826 ?auto_39832 ) ) ( not ( = ?auto_39827 ?auto_39832 ) ) ( not ( = ?auto_39828 ?auto_39832 ) ) ( not ( = ?auto_39829 ?auto_39832 ) ) ( not ( = ?auto_39830 ?auto_39832 ) ) ( not ( = ?auto_39831 ?auto_39832 ) ) ( ON ?auto_39830 ?auto_39831 ) ( ON-TABLE ?auto_39832 ) ( CLEAR ?auto_39828 ) ( ON ?auto_39829 ?auto_39830 ) ( CLEAR ?auto_39829 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_39832 ?auto_39831 ?auto_39830 )
      ( MAKE-6PILE ?auto_39826 ?auto_39827 ?auto_39828 ?auto_39829 ?auto_39830 ?auto_39831 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_39833 - BLOCK
      ?auto_39834 - BLOCK
      ?auto_39835 - BLOCK
      ?auto_39836 - BLOCK
      ?auto_39837 - BLOCK
      ?auto_39838 - BLOCK
    )
    :vars
    (
      ?auto_39839 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_39833 ) ( ON ?auto_39834 ?auto_39833 ) ( not ( = ?auto_39833 ?auto_39834 ) ) ( not ( = ?auto_39833 ?auto_39835 ) ) ( not ( = ?auto_39833 ?auto_39836 ) ) ( not ( = ?auto_39833 ?auto_39837 ) ) ( not ( = ?auto_39833 ?auto_39838 ) ) ( not ( = ?auto_39834 ?auto_39835 ) ) ( not ( = ?auto_39834 ?auto_39836 ) ) ( not ( = ?auto_39834 ?auto_39837 ) ) ( not ( = ?auto_39834 ?auto_39838 ) ) ( not ( = ?auto_39835 ?auto_39836 ) ) ( not ( = ?auto_39835 ?auto_39837 ) ) ( not ( = ?auto_39835 ?auto_39838 ) ) ( not ( = ?auto_39836 ?auto_39837 ) ) ( not ( = ?auto_39836 ?auto_39838 ) ) ( not ( = ?auto_39837 ?auto_39838 ) ) ( ON ?auto_39838 ?auto_39839 ) ( not ( = ?auto_39833 ?auto_39839 ) ) ( not ( = ?auto_39834 ?auto_39839 ) ) ( not ( = ?auto_39835 ?auto_39839 ) ) ( not ( = ?auto_39836 ?auto_39839 ) ) ( not ( = ?auto_39837 ?auto_39839 ) ) ( not ( = ?auto_39838 ?auto_39839 ) ) ( ON ?auto_39837 ?auto_39838 ) ( ON-TABLE ?auto_39839 ) ( ON ?auto_39836 ?auto_39837 ) ( CLEAR ?auto_39836 ) ( HOLDING ?auto_39835 ) ( CLEAR ?auto_39834 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_39833 ?auto_39834 ?auto_39835 )
      ( MAKE-6PILE ?auto_39833 ?auto_39834 ?auto_39835 ?auto_39836 ?auto_39837 ?auto_39838 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_39840 - BLOCK
      ?auto_39841 - BLOCK
      ?auto_39842 - BLOCK
      ?auto_39843 - BLOCK
      ?auto_39844 - BLOCK
      ?auto_39845 - BLOCK
    )
    :vars
    (
      ?auto_39846 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_39840 ) ( ON ?auto_39841 ?auto_39840 ) ( not ( = ?auto_39840 ?auto_39841 ) ) ( not ( = ?auto_39840 ?auto_39842 ) ) ( not ( = ?auto_39840 ?auto_39843 ) ) ( not ( = ?auto_39840 ?auto_39844 ) ) ( not ( = ?auto_39840 ?auto_39845 ) ) ( not ( = ?auto_39841 ?auto_39842 ) ) ( not ( = ?auto_39841 ?auto_39843 ) ) ( not ( = ?auto_39841 ?auto_39844 ) ) ( not ( = ?auto_39841 ?auto_39845 ) ) ( not ( = ?auto_39842 ?auto_39843 ) ) ( not ( = ?auto_39842 ?auto_39844 ) ) ( not ( = ?auto_39842 ?auto_39845 ) ) ( not ( = ?auto_39843 ?auto_39844 ) ) ( not ( = ?auto_39843 ?auto_39845 ) ) ( not ( = ?auto_39844 ?auto_39845 ) ) ( ON ?auto_39845 ?auto_39846 ) ( not ( = ?auto_39840 ?auto_39846 ) ) ( not ( = ?auto_39841 ?auto_39846 ) ) ( not ( = ?auto_39842 ?auto_39846 ) ) ( not ( = ?auto_39843 ?auto_39846 ) ) ( not ( = ?auto_39844 ?auto_39846 ) ) ( not ( = ?auto_39845 ?auto_39846 ) ) ( ON ?auto_39844 ?auto_39845 ) ( ON-TABLE ?auto_39846 ) ( ON ?auto_39843 ?auto_39844 ) ( CLEAR ?auto_39841 ) ( ON ?auto_39842 ?auto_39843 ) ( CLEAR ?auto_39842 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_39846 ?auto_39845 ?auto_39844 ?auto_39843 )
      ( MAKE-6PILE ?auto_39840 ?auto_39841 ?auto_39842 ?auto_39843 ?auto_39844 ?auto_39845 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_39847 - BLOCK
      ?auto_39848 - BLOCK
      ?auto_39849 - BLOCK
      ?auto_39850 - BLOCK
      ?auto_39851 - BLOCK
      ?auto_39852 - BLOCK
    )
    :vars
    (
      ?auto_39853 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_39847 ) ( not ( = ?auto_39847 ?auto_39848 ) ) ( not ( = ?auto_39847 ?auto_39849 ) ) ( not ( = ?auto_39847 ?auto_39850 ) ) ( not ( = ?auto_39847 ?auto_39851 ) ) ( not ( = ?auto_39847 ?auto_39852 ) ) ( not ( = ?auto_39848 ?auto_39849 ) ) ( not ( = ?auto_39848 ?auto_39850 ) ) ( not ( = ?auto_39848 ?auto_39851 ) ) ( not ( = ?auto_39848 ?auto_39852 ) ) ( not ( = ?auto_39849 ?auto_39850 ) ) ( not ( = ?auto_39849 ?auto_39851 ) ) ( not ( = ?auto_39849 ?auto_39852 ) ) ( not ( = ?auto_39850 ?auto_39851 ) ) ( not ( = ?auto_39850 ?auto_39852 ) ) ( not ( = ?auto_39851 ?auto_39852 ) ) ( ON ?auto_39852 ?auto_39853 ) ( not ( = ?auto_39847 ?auto_39853 ) ) ( not ( = ?auto_39848 ?auto_39853 ) ) ( not ( = ?auto_39849 ?auto_39853 ) ) ( not ( = ?auto_39850 ?auto_39853 ) ) ( not ( = ?auto_39851 ?auto_39853 ) ) ( not ( = ?auto_39852 ?auto_39853 ) ) ( ON ?auto_39851 ?auto_39852 ) ( ON-TABLE ?auto_39853 ) ( ON ?auto_39850 ?auto_39851 ) ( ON ?auto_39849 ?auto_39850 ) ( CLEAR ?auto_39849 ) ( HOLDING ?auto_39848 ) ( CLEAR ?auto_39847 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_39847 ?auto_39848 )
      ( MAKE-6PILE ?auto_39847 ?auto_39848 ?auto_39849 ?auto_39850 ?auto_39851 ?auto_39852 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_39854 - BLOCK
      ?auto_39855 - BLOCK
      ?auto_39856 - BLOCK
      ?auto_39857 - BLOCK
      ?auto_39858 - BLOCK
      ?auto_39859 - BLOCK
    )
    :vars
    (
      ?auto_39860 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_39854 ) ( not ( = ?auto_39854 ?auto_39855 ) ) ( not ( = ?auto_39854 ?auto_39856 ) ) ( not ( = ?auto_39854 ?auto_39857 ) ) ( not ( = ?auto_39854 ?auto_39858 ) ) ( not ( = ?auto_39854 ?auto_39859 ) ) ( not ( = ?auto_39855 ?auto_39856 ) ) ( not ( = ?auto_39855 ?auto_39857 ) ) ( not ( = ?auto_39855 ?auto_39858 ) ) ( not ( = ?auto_39855 ?auto_39859 ) ) ( not ( = ?auto_39856 ?auto_39857 ) ) ( not ( = ?auto_39856 ?auto_39858 ) ) ( not ( = ?auto_39856 ?auto_39859 ) ) ( not ( = ?auto_39857 ?auto_39858 ) ) ( not ( = ?auto_39857 ?auto_39859 ) ) ( not ( = ?auto_39858 ?auto_39859 ) ) ( ON ?auto_39859 ?auto_39860 ) ( not ( = ?auto_39854 ?auto_39860 ) ) ( not ( = ?auto_39855 ?auto_39860 ) ) ( not ( = ?auto_39856 ?auto_39860 ) ) ( not ( = ?auto_39857 ?auto_39860 ) ) ( not ( = ?auto_39858 ?auto_39860 ) ) ( not ( = ?auto_39859 ?auto_39860 ) ) ( ON ?auto_39858 ?auto_39859 ) ( ON-TABLE ?auto_39860 ) ( ON ?auto_39857 ?auto_39858 ) ( ON ?auto_39856 ?auto_39857 ) ( CLEAR ?auto_39854 ) ( ON ?auto_39855 ?auto_39856 ) ( CLEAR ?auto_39855 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_39860 ?auto_39859 ?auto_39858 ?auto_39857 ?auto_39856 )
      ( MAKE-6PILE ?auto_39854 ?auto_39855 ?auto_39856 ?auto_39857 ?auto_39858 ?auto_39859 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_39861 - BLOCK
      ?auto_39862 - BLOCK
      ?auto_39863 - BLOCK
      ?auto_39864 - BLOCK
      ?auto_39865 - BLOCK
      ?auto_39866 - BLOCK
    )
    :vars
    (
      ?auto_39867 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_39861 ?auto_39862 ) ) ( not ( = ?auto_39861 ?auto_39863 ) ) ( not ( = ?auto_39861 ?auto_39864 ) ) ( not ( = ?auto_39861 ?auto_39865 ) ) ( not ( = ?auto_39861 ?auto_39866 ) ) ( not ( = ?auto_39862 ?auto_39863 ) ) ( not ( = ?auto_39862 ?auto_39864 ) ) ( not ( = ?auto_39862 ?auto_39865 ) ) ( not ( = ?auto_39862 ?auto_39866 ) ) ( not ( = ?auto_39863 ?auto_39864 ) ) ( not ( = ?auto_39863 ?auto_39865 ) ) ( not ( = ?auto_39863 ?auto_39866 ) ) ( not ( = ?auto_39864 ?auto_39865 ) ) ( not ( = ?auto_39864 ?auto_39866 ) ) ( not ( = ?auto_39865 ?auto_39866 ) ) ( ON ?auto_39866 ?auto_39867 ) ( not ( = ?auto_39861 ?auto_39867 ) ) ( not ( = ?auto_39862 ?auto_39867 ) ) ( not ( = ?auto_39863 ?auto_39867 ) ) ( not ( = ?auto_39864 ?auto_39867 ) ) ( not ( = ?auto_39865 ?auto_39867 ) ) ( not ( = ?auto_39866 ?auto_39867 ) ) ( ON ?auto_39865 ?auto_39866 ) ( ON-TABLE ?auto_39867 ) ( ON ?auto_39864 ?auto_39865 ) ( ON ?auto_39863 ?auto_39864 ) ( ON ?auto_39862 ?auto_39863 ) ( CLEAR ?auto_39862 ) ( HOLDING ?auto_39861 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_39861 )
      ( MAKE-6PILE ?auto_39861 ?auto_39862 ?auto_39863 ?auto_39864 ?auto_39865 ?auto_39866 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_39868 - BLOCK
      ?auto_39869 - BLOCK
      ?auto_39870 - BLOCK
      ?auto_39871 - BLOCK
      ?auto_39872 - BLOCK
      ?auto_39873 - BLOCK
    )
    :vars
    (
      ?auto_39874 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_39868 ?auto_39869 ) ) ( not ( = ?auto_39868 ?auto_39870 ) ) ( not ( = ?auto_39868 ?auto_39871 ) ) ( not ( = ?auto_39868 ?auto_39872 ) ) ( not ( = ?auto_39868 ?auto_39873 ) ) ( not ( = ?auto_39869 ?auto_39870 ) ) ( not ( = ?auto_39869 ?auto_39871 ) ) ( not ( = ?auto_39869 ?auto_39872 ) ) ( not ( = ?auto_39869 ?auto_39873 ) ) ( not ( = ?auto_39870 ?auto_39871 ) ) ( not ( = ?auto_39870 ?auto_39872 ) ) ( not ( = ?auto_39870 ?auto_39873 ) ) ( not ( = ?auto_39871 ?auto_39872 ) ) ( not ( = ?auto_39871 ?auto_39873 ) ) ( not ( = ?auto_39872 ?auto_39873 ) ) ( ON ?auto_39873 ?auto_39874 ) ( not ( = ?auto_39868 ?auto_39874 ) ) ( not ( = ?auto_39869 ?auto_39874 ) ) ( not ( = ?auto_39870 ?auto_39874 ) ) ( not ( = ?auto_39871 ?auto_39874 ) ) ( not ( = ?auto_39872 ?auto_39874 ) ) ( not ( = ?auto_39873 ?auto_39874 ) ) ( ON ?auto_39872 ?auto_39873 ) ( ON-TABLE ?auto_39874 ) ( ON ?auto_39871 ?auto_39872 ) ( ON ?auto_39870 ?auto_39871 ) ( ON ?auto_39869 ?auto_39870 ) ( ON ?auto_39868 ?auto_39869 ) ( CLEAR ?auto_39868 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_39874 ?auto_39873 ?auto_39872 ?auto_39871 ?auto_39870 ?auto_39869 )
      ( MAKE-6PILE ?auto_39868 ?auto_39869 ?auto_39870 ?auto_39871 ?auto_39872 ?auto_39873 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_39880 - BLOCK
      ?auto_39881 - BLOCK
      ?auto_39882 - BLOCK
      ?auto_39883 - BLOCK
      ?auto_39884 - BLOCK
    )
    :vars
    (
      ?auto_39885 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_39885 ?auto_39884 ) ( CLEAR ?auto_39885 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_39880 ) ( ON ?auto_39881 ?auto_39880 ) ( ON ?auto_39882 ?auto_39881 ) ( ON ?auto_39883 ?auto_39882 ) ( ON ?auto_39884 ?auto_39883 ) ( not ( = ?auto_39880 ?auto_39881 ) ) ( not ( = ?auto_39880 ?auto_39882 ) ) ( not ( = ?auto_39880 ?auto_39883 ) ) ( not ( = ?auto_39880 ?auto_39884 ) ) ( not ( = ?auto_39880 ?auto_39885 ) ) ( not ( = ?auto_39881 ?auto_39882 ) ) ( not ( = ?auto_39881 ?auto_39883 ) ) ( not ( = ?auto_39881 ?auto_39884 ) ) ( not ( = ?auto_39881 ?auto_39885 ) ) ( not ( = ?auto_39882 ?auto_39883 ) ) ( not ( = ?auto_39882 ?auto_39884 ) ) ( not ( = ?auto_39882 ?auto_39885 ) ) ( not ( = ?auto_39883 ?auto_39884 ) ) ( not ( = ?auto_39883 ?auto_39885 ) ) ( not ( = ?auto_39884 ?auto_39885 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_39885 ?auto_39884 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_39899 - BLOCK
      ?auto_39900 - BLOCK
      ?auto_39901 - BLOCK
      ?auto_39902 - BLOCK
      ?auto_39903 - BLOCK
    )
    :vars
    (
      ?auto_39904 - BLOCK
      ?auto_39905 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_39899 ) ( ON ?auto_39900 ?auto_39899 ) ( ON ?auto_39901 ?auto_39900 ) ( ON ?auto_39902 ?auto_39901 ) ( not ( = ?auto_39899 ?auto_39900 ) ) ( not ( = ?auto_39899 ?auto_39901 ) ) ( not ( = ?auto_39899 ?auto_39902 ) ) ( not ( = ?auto_39899 ?auto_39903 ) ) ( not ( = ?auto_39899 ?auto_39904 ) ) ( not ( = ?auto_39900 ?auto_39901 ) ) ( not ( = ?auto_39900 ?auto_39902 ) ) ( not ( = ?auto_39900 ?auto_39903 ) ) ( not ( = ?auto_39900 ?auto_39904 ) ) ( not ( = ?auto_39901 ?auto_39902 ) ) ( not ( = ?auto_39901 ?auto_39903 ) ) ( not ( = ?auto_39901 ?auto_39904 ) ) ( not ( = ?auto_39902 ?auto_39903 ) ) ( not ( = ?auto_39902 ?auto_39904 ) ) ( not ( = ?auto_39903 ?auto_39904 ) ) ( ON ?auto_39904 ?auto_39905 ) ( CLEAR ?auto_39904 ) ( not ( = ?auto_39899 ?auto_39905 ) ) ( not ( = ?auto_39900 ?auto_39905 ) ) ( not ( = ?auto_39901 ?auto_39905 ) ) ( not ( = ?auto_39902 ?auto_39905 ) ) ( not ( = ?auto_39903 ?auto_39905 ) ) ( not ( = ?auto_39904 ?auto_39905 ) ) ( HOLDING ?auto_39903 ) ( CLEAR ?auto_39902 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_39899 ?auto_39900 ?auto_39901 ?auto_39902 ?auto_39903 ?auto_39904 )
      ( MAKE-5PILE ?auto_39899 ?auto_39900 ?auto_39901 ?auto_39902 ?auto_39903 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_39906 - BLOCK
      ?auto_39907 - BLOCK
      ?auto_39908 - BLOCK
      ?auto_39909 - BLOCK
      ?auto_39910 - BLOCK
    )
    :vars
    (
      ?auto_39911 - BLOCK
      ?auto_39912 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_39906 ) ( ON ?auto_39907 ?auto_39906 ) ( ON ?auto_39908 ?auto_39907 ) ( ON ?auto_39909 ?auto_39908 ) ( not ( = ?auto_39906 ?auto_39907 ) ) ( not ( = ?auto_39906 ?auto_39908 ) ) ( not ( = ?auto_39906 ?auto_39909 ) ) ( not ( = ?auto_39906 ?auto_39910 ) ) ( not ( = ?auto_39906 ?auto_39911 ) ) ( not ( = ?auto_39907 ?auto_39908 ) ) ( not ( = ?auto_39907 ?auto_39909 ) ) ( not ( = ?auto_39907 ?auto_39910 ) ) ( not ( = ?auto_39907 ?auto_39911 ) ) ( not ( = ?auto_39908 ?auto_39909 ) ) ( not ( = ?auto_39908 ?auto_39910 ) ) ( not ( = ?auto_39908 ?auto_39911 ) ) ( not ( = ?auto_39909 ?auto_39910 ) ) ( not ( = ?auto_39909 ?auto_39911 ) ) ( not ( = ?auto_39910 ?auto_39911 ) ) ( ON ?auto_39911 ?auto_39912 ) ( not ( = ?auto_39906 ?auto_39912 ) ) ( not ( = ?auto_39907 ?auto_39912 ) ) ( not ( = ?auto_39908 ?auto_39912 ) ) ( not ( = ?auto_39909 ?auto_39912 ) ) ( not ( = ?auto_39910 ?auto_39912 ) ) ( not ( = ?auto_39911 ?auto_39912 ) ) ( CLEAR ?auto_39909 ) ( ON ?auto_39910 ?auto_39911 ) ( CLEAR ?auto_39910 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_39912 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_39912 ?auto_39911 )
      ( MAKE-5PILE ?auto_39906 ?auto_39907 ?auto_39908 ?auto_39909 ?auto_39910 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_39913 - BLOCK
      ?auto_39914 - BLOCK
      ?auto_39915 - BLOCK
      ?auto_39916 - BLOCK
      ?auto_39917 - BLOCK
    )
    :vars
    (
      ?auto_39919 - BLOCK
      ?auto_39918 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_39913 ) ( ON ?auto_39914 ?auto_39913 ) ( ON ?auto_39915 ?auto_39914 ) ( not ( = ?auto_39913 ?auto_39914 ) ) ( not ( = ?auto_39913 ?auto_39915 ) ) ( not ( = ?auto_39913 ?auto_39916 ) ) ( not ( = ?auto_39913 ?auto_39917 ) ) ( not ( = ?auto_39913 ?auto_39919 ) ) ( not ( = ?auto_39914 ?auto_39915 ) ) ( not ( = ?auto_39914 ?auto_39916 ) ) ( not ( = ?auto_39914 ?auto_39917 ) ) ( not ( = ?auto_39914 ?auto_39919 ) ) ( not ( = ?auto_39915 ?auto_39916 ) ) ( not ( = ?auto_39915 ?auto_39917 ) ) ( not ( = ?auto_39915 ?auto_39919 ) ) ( not ( = ?auto_39916 ?auto_39917 ) ) ( not ( = ?auto_39916 ?auto_39919 ) ) ( not ( = ?auto_39917 ?auto_39919 ) ) ( ON ?auto_39919 ?auto_39918 ) ( not ( = ?auto_39913 ?auto_39918 ) ) ( not ( = ?auto_39914 ?auto_39918 ) ) ( not ( = ?auto_39915 ?auto_39918 ) ) ( not ( = ?auto_39916 ?auto_39918 ) ) ( not ( = ?auto_39917 ?auto_39918 ) ) ( not ( = ?auto_39919 ?auto_39918 ) ) ( ON ?auto_39917 ?auto_39919 ) ( CLEAR ?auto_39917 ) ( ON-TABLE ?auto_39918 ) ( HOLDING ?auto_39916 ) ( CLEAR ?auto_39915 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_39913 ?auto_39914 ?auto_39915 ?auto_39916 )
      ( MAKE-5PILE ?auto_39913 ?auto_39914 ?auto_39915 ?auto_39916 ?auto_39917 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_39920 - BLOCK
      ?auto_39921 - BLOCK
      ?auto_39922 - BLOCK
      ?auto_39923 - BLOCK
      ?auto_39924 - BLOCK
    )
    :vars
    (
      ?auto_39925 - BLOCK
      ?auto_39926 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_39920 ) ( ON ?auto_39921 ?auto_39920 ) ( ON ?auto_39922 ?auto_39921 ) ( not ( = ?auto_39920 ?auto_39921 ) ) ( not ( = ?auto_39920 ?auto_39922 ) ) ( not ( = ?auto_39920 ?auto_39923 ) ) ( not ( = ?auto_39920 ?auto_39924 ) ) ( not ( = ?auto_39920 ?auto_39925 ) ) ( not ( = ?auto_39921 ?auto_39922 ) ) ( not ( = ?auto_39921 ?auto_39923 ) ) ( not ( = ?auto_39921 ?auto_39924 ) ) ( not ( = ?auto_39921 ?auto_39925 ) ) ( not ( = ?auto_39922 ?auto_39923 ) ) ( not ( = ?auto_39922 ?auto_39924 ) ) ( not ( = ?auto_39922 ?auto_39925 ) ) ( not ( = ?auto_39923 ?auto_39924 ) ) ( not ( = ?auto_39923 ?auto_39925 ) ) ( not ( = ?auto_39924 ?auto_39925 ) ) ( ON ?auto_39925 ?auto_39926 ) ( not ( = ?auto_39920 ?auto_39926 ) ) ( not ( = ?auto_39921 ?auto_39926 ) ) ( not ( = ?auto_39922 ?auto_39926 ) ) ( not ( = ?auto_39923 ?auto_39926 ) ) ( not ( = ?auto_39924 ?auto_39926 ) ) ( not ( = ?auto_39925 ?auto_39926 ) ) ( ON ?auto_39924 ?auto_39925 ) ( ON-TABLE ?auto_39926 ) ( CLEAR ?auto_39922 ) ( ON ?auto_39923 ?auto_39924 ) ( CLEAR ?auto_39923 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_39926 ?auto_39925 ?auto_39924 )
      ( MAKE-5PILE ?auto_39920 ?auto_39921 ?auto_39922 ?auto_39923 ?auto_39924 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_39927 - BLOCK
      ?auto_39928 - BLOCK
      ?auto_39929 - BLOCK
      ?auto_39930 - BLOCK
      ?auto_39931 - BLOCK
    )
    :vars
    (
      ?auto_39932 - BLOCK
      ?auto_39933 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_39927 ) ( ON ?auto_39928 ?auto_39927 ) ( not ( = ?auto_39927 ?auto_39928 ) ) ( not ( = ?auto_39927 ?auto_39929 ) ) ( not ( = ?auto_39927 ?auto_39930 ) ) ( not ( = ?auto_39927 ?auto_39931 ) ) ( not ( = ?auto_39927 ?auto_39932 ) ) ( not ( = ?auto_39928 ?auto_39929 ) ) ( not ( = ?auto_39928 ?auto_39930 ) ) ( not ( = ?auto_39928 ?auto_39931 ) ) ( not ( = ?auto_39928 ?auto_39932 ) ) ( not ( = ?auto_39929 ?auto_39930 ) ) ( not ( = ?auto_39929 ?auto_39931 ) ) ( not ( = ?auto_39929 ?auto_39932 ) ) ( not ( = ?auto_39930 ?auto_39931 ) ) ( not ( = ?auto_39930 ?auto_39932 ) ) ( not ( = ?auto_39931 ?auto_39932 ) ) ( ON ?auto_39932 ?auto_39933 ) ( not ( = ?auto_39927 ?auto_39933 ) ) ( not ( = ?auto_39928 ?auto_39933 ) ) ( not ( = ?auto_39929 ?auto_39933 ) ) ( not ( = ?auto_39930 ?auto_39933 ) ) ( not ( = ?auto_39931 ?auto_39933 ) ) ( not ( = ?auto_39932 ?auto_39933 ) ) ( ON ?auto_39931 ?auto_39932 ) ( ON-TABLE ?auto_39933 ) ( ON ?auto_39930 ?auto_39931 ) ( CLEAR ?auto_39930 ) ( HOLDING ?auto_39929 ) ( CLEAR ?auto_39928 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_39927 ?auto_39928 ?auto_39929 )
      ( MAKE-5PILE ?auto_39927 ?auto_39928 ?auto_39929 ?auto_39930 ?auto_39931 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_39934 - BLOCK
      ?auto_39935 - BLOCK
      ?auto_39936 - BLOCK
      ?auto_39937 - BLOCK
      ?auto_39938 - BLOCK
    )
    :vars
    (
      ?auto_39939 - BLOCK
      ?auto_39940 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_39934 ) ( ON ?auto_39935 ?auto_39934 ) ( not ( = ?auto_39934 ?auto_39935 ) ) ( not ( = ?auto_39934 ?auto_39936 ) ) ( not ( = ?auto_39934 ?auto_39937 ) ) ( not ( = ?auto_39934 ?auto_39938 ) ) ( not ( = ?auto_39934 ?auto_39939 ) ) ( not ( = ?auto_39935 ?auto_39936 ) ) ( not ( = ?auto_39935 ?auto_39937 ) ) ( not ( = ?auto_39935 ?auto_39938 ) ) ( not ( = ?auto_39935 ?auto_39939 ) ) ( not ( = ?auto_39936 ?auto_39937 ) ) ( not ( = ?auto_39936 ?auto_39938 ) ) ( not ( = ?auto_39936 ?auto_39939 ) ) ( not ( = ?auto_39937 ?auto_39938 ) ) ( not ( = ?auto_39937 ?auto_39939 ) ) ( not ( = ?auto_39938 ?auto_39939 ) ) ( ON ?auto_39939 ?auto_39940 ) ( not ( = ?auto_39934 ?auto_39940 ) ) ( not ( = ?auto_39935 ?auto_39940 ) ) ( not ( = ?auto_39936 ?auto_39940 ) ) ( not ( = ?auto_39937 ?auto_39940 ) ) ( not ( = ?auto_39938 ?auto_39940 ) ) ( not ( = ?auto_39939 ?auto_39940 ) ) ( ON ?auto_39938 ?auto_39939 ) ( ON-TABLE ?auto_39940 ) ( ON ?auto_39937 ?auto_39938 ) ( CLEAR ?auto_39935 ) ( ON ?auto_39936 ?auto_39937 ) ( CLEAR ?auto_39936 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_39940 ?auto_39939 ?auto_39938 ?auto_39937 )
      ( MAKE-5PILE ?auto_39934 ?auto_39935 ?auto_39936 ?auto_39937 ?auto_39938 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_39941 - BLOCK
      ?auto_39942 - BLOCK
      ?auto_39943 - BLOCK
      ?auto_39944 - BLOCK
      ?auto_39945 - BLOCK
    )
    :vars
    (
      ?auto_39946 - BLOCK
      ?auto_39947 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_39941 ) ( not ( = ?auto_39941 ?auto_39942 ) ) ( not ( = ?auto_39941 ?auto_39943 ) ) ( not ( = ?auto_39941 ?auto_39944 ) ) ( not ( = ?auto_39941 ?auto_39945 ) ) ( not ( = ?auto_39941 ?auto_39946 ) ) ( not ( = ?auto_39942 ?auto_39943 ) ) ( not ( = ?auto_39942 ?auto_39944 ) ) ( not ( = ?auto_39942 ?auto_39945 ) ) ( not ( = ?auto_39942 ?auto_39946 ) ) ( not ( = ?auto_39943 ?auto_39944 ) ) ( not ( = ?auto_39943 ?auto_39945 ) ) ( not ( = ?auto_39943 ?auto_39946 ) ) ( not ( = ?auto_39944 ?auto_39945 ) ) ( not ( = ?auto_39944 ?auto_39946 ) ) ( not ( = ?auto_39945 ?auto_39946 ) ) ( ON ?auto_39946 ?auto_39947 ) ( not ( = ?auto_39941 ?auto_39947 ) ) ( not ( = ?auto_39942 ?auto_39947 ) ) ( not ( = ?auto_39943 ?auto_39947 ) ) ( not ( = ?auto_39944 ?auto_39947 ) ) ( not ( = ?auto_39945 ?auto_39947 ) ) ( not ( = ?auto_39946 ?auto_39947 ) ) ( ON ?auto_39945 ?auto_39946 ) ( ON-TABLE ?auto_39947 ) ( ON ?auto_39944 ?auto_39945 ) ( ON ?auto_39943 ?auto_39944 ) ( CLEAR ?auto_39943 ) ( HOLDING ?auto_39942 ) ( CLEAR ?auto_39941 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_39941 ?auto_39942 )
      ( MAKE-5PILE ?auto_39941 ?auto_39942 ?auto_39943 ?auto_39944 ?auto_39945 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_39948 - BLOCK
      ?auto_39949 - BLOCK
      ?auto_39950 - BLOCK
      ?auto_39951 - BLOCK
      ?auto_39952 - BLOCK
    )
    :vars
    (
      ?auto_39953 - BLOCK
      ?auto_39954 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_39948 ) ( not ( = ?auto_39948 ?auto_39949 ) ) ( not ( = ?auto_39948 ?auto_39950 ) ) ( not ( = ?auto_39948 ?auto_39951 ) ) ( not ( = ?auto_39948 ?auto_39952 ) ) ( not ( = ?auto_39948 ?auto_39953 ) ) ( not ( = ?auto_39949 ?auto_39950 ) ) ( not ( = ?auto_39949 ?auto_39951 ) ) ( not ( = ?auto_39949 ?auto_39952 ) ) ( not ( = ?auto_39949 ?auto_39953 ) ) ( not ( = ?auto_39950 ?auto_39951 ) ) ( not ( = ?auto_39950 ?auto_39952 ) ) ( not ( = ?auto_39950 ?auto_39953 ) ) ( not ( = ?auto_39951 ?auto_39952 ) ) ( not ( = ?auto_39951 ?auto_39953 ) ) ( not ( = ?auto_39952 ?auto_39953 ) ) ( ON ?auto_39953 ?auto_39954 ) ( not ( = ?auto_39948 ?auto_39954 ) ) ( not ( = ?auto_39949 ?auto_39954 ) ) ( not ( = ?auto_39950 ?auto_39954 ) ) ( not ( = ?auto_39951 ?auto_39954 ) ) ( not ( = ?auto_39952 ?auto_39954 ) ) ( not ( = ?auto_39953 ?auto_39954 ) ) ( ON ?auto_39952 ?auto_39953 ) ( ON-TABLE ?auto_39954 ) ( ON ?auto_39951 ?auto_39952 ) ( ON ?auto_39950 ?auto_39951 ) ( CLEAR ?auto_39948 ) ( ON ?auto_39949 ?auto_39950 ) ( CLEAR ?auto_39949 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_39954 ?auto_39953 ?auto_39952 ?auto_39951 ?auto_39950 )
      ( MAKE-5PILE ?auto_39948 ?auto_39949 ?auto_39950 ?auto_39951 ?auto_39952 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_39955 - BLOCK
      ?auto_39956 - BLOCK
      ?auto_39957 - BLOCK
      ?auto_39958 - BLOCK
      ?auto_39959 - BLOCK
    )
    :vars
    (
      ?auto_39961 - BLOCK
      ?auto_39960 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_39955 ?auto_39956 ) ) ( not ( = ?auto_39955 ?auto_39957 ) ) ( not ( = ?auto_39955 ?auto_39958 ) ) ( not ( = ?auto_39955 ?auto_39959 ) ) ( not ( = ?auto_39955 ?auto_39961 ) ) ( not ( = ?auto_39956 ?auto_39957 ) ) ( not ( = ?auto_39956 ?auto_39958 ) ) ( not ( = ?auto_39956 ?auto_39959 ) ) ( not ( = ?auto_39956 ?auto_39961 ) ) ( not ( = ?auto_39957 ?auto_39958 ) ) ( not ( = ?auto_39957 ?auto_39959 ) ) ( not ( = ?auto_39957 ?auto_39961 ) ) ( not ( = ?auto_39958 ?auto_39959 ) ) ( not ( = ?auto_39958 ?auto_39961 ) ) ( not ( = ?auto_39959 ?auto_39961 ) ) ( ON ?auto_39961 ?auto_39960 ) ( not ( = ?auto_39955 ?auto_39960 ) ) ( not ( = ?auto_39956 ?auto_39960 ) ) ( not ( = ?auto_39957 ?auto_39960 ) ) ( not ( = ?auto_39958 ?auto_39960 ) ) ( not ( = ?auto_39959 ?auto_39960 ) ) ( not ( = ?auto_39961 ?auto_39960 ) ) ( ON ?auto_39959 ?auto_39961 ) ( ON-TABLE ?auto_39960 ) ( ON ?auto_39958 ?auto_39959 ) ( ON ?auto_39957 ?auto_39958 ) ( ON ?auto_39956 ?auto_39957 ) ( CLEAR ?auto_39956 ) ( HOLDING ?auto_39955 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_39955 )
      ( MAKE-5PILE ?auto_39955 ?auto_39956 ?auto_39957 ?auto_39958 ?auto_39959 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_39962 - BLOCK
      ?auto_39963 - BLOCK
      ?auto_39964 - BLOCK
      ?auto_39965 - BLOCK
      ?auto_39966 - BLOCK
    )
    :vars
    (
      ?auto_39968 - BLOCK
      ?auto_39967 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_39962 ?auto_39963 ) ) ( not ( = ?auto_39962 ?auto_39964 ) ) ( not ( = ?auto_39962 ?auto_39965 ) ) ( not ( = ?auto_39962 ?auto_39966 ) ) ( not ( = ?auto_39962 ?auto_39968 ) ) ( not ( = ?auto_39963 ?auto_39964 ) ) ( not ( = ?auto_39963 ?auto_39965 ) ) ( not ( = ?auto_39963 ?auto_39966 ) ) ( not ( = ?auto_39963 ?auto_39968 ) ) ( not ( = ?auto_39964 ?auto_39965 ) ) ( not ( = ?auto_39964 ?auto_39966 ) ) ( not ( = ?auto_39964 ?auto_39968 ) ) ( not ( = ?auto_39965 ?auto_39966 ) ) ( not ( = ?auto_39965 ?auto_39968 ) ) ( not ( = ?auto_39966 ?auto_39968 ) ) ( ON ?auto_39968 ?auto_39967 ) ( not ( = ?auto_39962 ?auto_39967 ) ) ( not ( = ?auto_39963 ?auto_39967 ) ) ( not ( = ?auto_39964 ?auto_39967 ) ) ( not ( = ?auto_39965 ?auto_39967 ) ) ( not ( = ?auto_39966 ?auto_39967 ) ) ( not ( = ?auto_39968 ?auto_39967 ) ) ( ON ?auto_39966 ?auto_39968 ) ( ON-TABLE ?auto_39967 ) ( ON ?auto_39965 ?auto_39966 ) ( ON ?auto_39964 ?auto_39965 ) ( ON ?auto_39963 ?auto_39964 ) ( ON ?auto_39962 ?auto_39963 ) ( CLEAR ?auto_39962 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_39967 ?auto_39968 ?auto_39966 ?auto_39965 ?auto_39964 ?auto_39963 )
      ( MAKE-5PILE ?auto_39962 ?auto_39963 ?auto_39964 ?auto_39965 ?auto_39966 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_39970 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_39970 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_39970 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_39971 - BLOCK
    )
    :vars
    (
      ?auto_39972 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_39971 ?auto_39972 ) ( CLEAR ?auto_39971 ) ( HAND-EMPTY ) ( not ( = ?auto_39971 ?auto_39972 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_39971 ?auto_39972 )
      ( MAKE-1PILE ?auto_39971 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_39973 - BLOCK
    )
    :vars
    (
      ?auto_39974 - BLOCK
      ?auto_39977 - BLOCK
      ?auto_39976 - BLOCK
      ?auto_39975 - BLOCK
      ?auto_39978 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_39973 ?auto_39974 ) ) ( HOLDING ?auto_39973 ) ( CLEAR ?auto_39974 ) ( ON-TABLE ?auto_39977 ) ( ON ?auto_39976 ?auto_39977 ) ( ON ?auto_39975 ?auto_39976 ) ( ON ?auto_39978 ?auto_39975 ) ( ON ?auto_39974 ?auto_39978 ) ( not ( = ?auto_39977 ?auto_39976 ) ) ( not ( = ?auto_39977 ?auto_39975 ) ) ( not ( = ?auto_39977 ?auto_39978 ) ) ( not ( = ?auto_39977 ?auto_39974 ) ) ( not ( = ?auto_39977 ?auto_39973 ) ) ( not ( = ?auto_39976 ?auto_39975 ) ) ( not ( = ?auto_39976 ?auto_39978 ) ) ( not ( = ?auto_39976 ?auto_39974 ) ) ( not ( = ?auto_39976 ?auto_39973 ) ) ( not ( = ?auto_39975 ?auto_39978 ) ) ( not ( = ?auto_39975 ?auto_39974 ) ) ( not ( = ?auto_39975 ?auto_39973 ) ) ( not ( = ?auto_39978 ?auto_39974 ) ) ( not ( = ?auto_39978 ?auto_39973 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_39977 ?auto_39976 ?auto_39975 ?auto_39978 ?auto_39974 ?auto_39973 )
      ( MAKE-1PILE ?auto_39973 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_39979 - BLOCK
    )
    :vars
    (
      ?auto_39981 - BLOCK
      ?auto_39982 - BLOCK
      ?auto_39984 - BLOCK
      ?auto_39980 - BLOCK
      ?auto_39983 - BLOCK
      ?auto_39985 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_39979 ?auto_39981 ) ) ( CLEAR ?auto_39981 ) ( ON-TABLE ?auto_39982 ) ( ON ?auto_39984 ?auto_39982 ) ( ON ?auto_39980 ?auto_39984 ) ( ON ?auto_39983 ?auto_39980 ) ( ON ?auto_39981 ?auto_39983 ) ( not ( = ?auto_39982 ?auto_39984 ) ) ( not ( = ?auto_39982 ?auto_39980 ) ) ( not ( = ?auto_39982 ?auto_39983 ) ) ( not ( = ?auto_39982 ?auto_39981 ) ) ( not ( = ?auto_39982 ?auto_39979 ) ) ( not ( = ?auto_39984 ?auto_39980 ) ) ( not ( = ?auto_39984 ?auto_39983 ) ) ( not ( = ?auto_39984 ?auto_39981 ) ) ( not ( = ?auto_39984 ?auto_39979 ) ) ( not ( = ?auto_39980 ?auto_39983 ) ) ( not ( = ?auto_39980 ?auto_39981 ) ) ( not ( = ?auto_39980 ?auto_39979 ) ) ( not ( = ?auto_39983 ?auto_39981 ) ) ( not ( = ?auto_39983 ?auto_39979 ) ) ( ON ?auto_39979 ?auto_39985 ) ( CLEAR ?auto_39979 ) ( HAND-EMPTY ) ( not ( = ?auto_39979 ?auto_39985 ) ) ( not ( = ?auto_39981 ?auto_39985 ) ) ( not ( = ?auto_39982 ?auto_39985 ) ) ( not ( = ?auto_39984 ?auto_39985 ) ) ( not ( = ?auto_39980 ?auto_39985 ) ) ( not ( = ?auto_39983 ?auto_39985 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_39979 ?auto_39985 )
      ( MAKE-1PILE ?auto_39979 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_39986 - BLOCK
    )
    :vars
    (
      ?auto_39989 - BLOCK
      ?auto_39991 - BLOCK
      ?auto_39988 - BLOCK
      ?auto_39990 - BLOCK
      ?auto_39992 - BLOCK
      ?auto_39987 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_39986 ?auto_39989 ) ) ( ON-TABLE ?auto_39991 ) ( ON ?auto_39988 ?auto_39991 ) ( ON ?auto_39990 ?auto_39988 ) ( ON ?auto_39992 ?auto_39990 ) ( not ( = ?auto_39991 ?auto_39988 ) ) ( not ( = ?auto_39991 ?auto_39990 ) ) ( not ( = ?auto_39991 ?auto_39992 ) ) ( not ( = ?auto_39991 ?auto_39989 ) ) ( not ( = ?auto_39991 ?auto_39986 ) ) ( not ( = ?auto_39988 ?auto_39990 ) ) ( not ( = ?auto_39988 ?auto_39992 ) ) ( not ( = ?auto_39988 ?auto_39989 ) ) ( not ( = ?auto_39988 ?auto_39986 ) ) ( not ( = ?auto_39990 ?auto_39992 ) ) ( not ( = ?auto_39990 ?auto_39989 ) ) ( not ( = ?auto_39990 ?auto_39986 ) ) ( not ( = ?auto_39992 ?auto_39989 ) ) ( not ( = ?auto_39992 ?auto_39986 ) ) ( ON ?auto_39986 ?auto_39987 ) ( CLEAR ?auto_39986 ) ( not ( = ?auto_39986 ?auto_39987 ) ) ( not ( = ?auto_39989 ?auto_39987 ) ) ( not ( = ?auto_39991 ?auto_39987 ) ) ( not ( = ?auto_39988 ?auto_39987 ) ) ( not ( = ?auto_39990 ?auto_39987 ) ) ( not ( = ?auto_39992 ?auto_39987 ) ) ( HOLDING ?auto_39989 ) ( CLEAR ?auto_39992 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_39991 ?auto_39988 ?auto_39990 ?auto_39992 ?auto_39989 )
      ( MAKE-1PILE ?auto_39986 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_39993 - BLOCK
    )
    :vars
    (
      ?auto_39997 - BLOCK
      ?auto_39994 - BLOCK
      ?auto_39995 - BLOCK
      ?auto_39996 - BLOCK
      ?auto_39998 - BLOCK
      ?auto_39999 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_39993 ?auto_39997 ) ) ( ON-TABLE ?auto_39994 ) ( ON ?auto_39995 ?auto_39994 ) ( ON ?auto_39996 ?auto_39995 ) ( ON ?auto_39998 ?auto_39996 ) ( not ( = ?auto_39994 ?auto_39995 ) ) ( not ( = ?auto_39994 ?auto_39996 ) ) ( not ( = ?auto_39994 ?auto_39998 ) ) ( not ( = ?auto_39994 ?auto_39997 ) ) ( not ( = ?auto_39994 ?auto_39993 ) ) ( not ( = ?auto_39995 ?auto_39996 ) ) ( not ( = ?auto_39995 ?auto_39998 ) ) ( not ( = ?auto_39995 ?auto_39997 ) ) ( not ( = ?auto_39995 ?auto_39993 ) ) ( not ( = ?auto_39996 ?auto_39998 ) ) ( not ( = ?auto_39996 ?auto_39997 ) ) ( not ( = ?auto_39996 ?auto_39993 ) ) ( not ( = ?auto_39998 ?auto_39997 ) ) ( not ( = ?auto_39998 ?auto_39993 ) ) ( ON ?auto_39993 ?auto_39999 ) ( not ( = ?auto_39993 ?auto_39999 ) ) ( not ( = ?auto_39997 ?auto_39999 ) ) ( not ( = ?auto_39994 ?auto_39999 ) ) ( not ( = ?auto_39995 ?auto_39999 ) ) ( not ( = ?auto_39996 ?auto_39999 ) ) ( not ( = ?auto_39998 ?auto_39999 ) ) ( CLEAR ?auto_39998 ) ( ON ?auto_39997 ?auto_39993 ) ( CLEAR ?auto_39997 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_39999 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_39999 ?auto_39993 )
      ( MAKE-1PILE ?auto_39993 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_40000 - BLOCK
    )
    :vars
    (
      ?auto_40002 - BLOCK
      ?auto_40005 - BLOCK
      ?auto_40006 - BLOCK
      ?auto_40001 - BLOCK
      ?auto_40004 - BLOCK
      ?auto_40003 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_40000 ?auto_40002 ) ) ( ON-TABLE ?auto_40005 ) ( ON ?auto_40006 ?auto_40005 ) ( ON ?auto_40001 ?auto_40006 ) ( not ( = ?auto_40005 ?auto_40006 ) ) ( not ( = ?auto_40005 ?auto_40001 ) ) ( not ( = ?auto_40005 ?auto_40004 ) ) ( not ( = ?auto_40005 ?auto_40002 ) ) ( not ( = ?auto_40005 ?auto_40000 ) ) ( not ( = ?auto_40006 ?auto_40001 ) ) ( not ( = ?auto_40006 ?auto_40004 ) ) ( not ( = ?auto_40006 ?auto_40002 ) ) ( not ( = ?auto_40006 ?auto_40000 ) ) ( not ( = ?auto_40001 ?auto_40004 ) ) ( not ( = ?auto_40001 ?auto_40002 ) ) ( not ( = ?auto_40001 ?auto_40000 ) ) ( not ( = ?auto_40004 ?auto_40002 ) ) ( not ( = ?auto_40004 ?auto_40000 ) ) ( ON ?auto_40000 ?auto_40003 ) ( not ( = ?auto_40000 ?auto_40003 ) ) ( not ( = ?auto_40002 ?auto_40003 ) ) ( not ( = ?auto_40005 ?auto_40003 ) ) ( not ( = ?auto_40006 ?auto_40003 ) ) ( not ( = ?auto_40001 ?auto_40003 ) ) ( not ( = ?auto_40004 ?auto_40003 ) ) ( ON ?auto_40002 ?auto_40000 ) ( CLEAR ?auto_40002 ) ( ON-TABLE ?auto_40003 ) ( HOLDING ?auto_40004 ) ( CLEAR ?auto_40001 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_40005 ?auto_40006 ?auto_40001 ?auto_40004 )
      ( MAKE-1PILE ?auto_40000 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_40007 - BLOCK
    )
    :vars
    (
      ?auto_40010 - BLOCK
      ?auto_40009 - BLOCK
      ?auto_40008 - BLOCK
      ?auto_40012 - BLOCK
      ?auto_40011 - BLOCK
      ?auto_40013 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_40007 ?auto_40010 ) ) ( ON-TABLE ?auto_40009 ) ( ON ?auto_40008 ?auto_40009 ) ( ON ?auto_40012 ?auto_40008 ) ( not ( = ?auto_40009 ?auto_40008 ) ) ( not ( = ?auto_40009 ?auto_40012 ) ) ( not ( = ?auto_40009 ?auto_40011 ) ) ( not ( = ?auto_40009 ?auto_40010 ) ) ( not ( = ?auto_40009 ?auto_40007 ) ) ( not ( = ?auto_40008 ?auto_40012 ) ) ( not ( = ?auto_40008 ?auto_40011 ) ) ( not ( = ?auto_40008 ?auto_40010 ) ) ( not ( = ?auto_40008 ?auto_40007 ) ) ( not ( = ?auto_40012 ?auto_40011 ) ) ( not ( = ?auto_40012 ?auto_40010 ) ) ( not ( = ?auto_40012 ?auto_40007 ) ) ( not ( = ?auto_40011 ?auto_40010 ) ) ( not ( = ?auto_40011 ?auto_40007 ) ) ( ON ?auto_40007 ?auto_40013 ) ( not ( = ?auto_40007 ?auto_40013 ) ) ( not ( = ?auto_40010 ?auto_40013 ) ) ( not ( = ?auto_40009 ?auto_40013 ) ) ( not ( = ?auto_40008 ?auto_40013 ) ) ( not ( = ?auto_40012 ?auto_40013 ) ) ( not ( = ?auto_40011 ?auto_40013 ) ) ( ON ?auto_40010 ?auto_40007 ) ( ON-TABLE ?auto_40013 ) ( CLEAR ?auto_40012 ) ( ON ?auto_40011 ?auto_40010 ) ( CLEAR ?auto_40011 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_40013 ?auto_40007 ?auto_40010 )
      ( MAKE-1PILE ?auto_40007 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_40014 - BLOCK
    )
    :vars
    (
      ?auto_40019 - BLOCK
      ?auto_40016 - BLOCK
      ?auto_40020 - BLOCK
      ?auto_40017 - BLOCK
      ?auto_40015 - BLOCK
      ?auto_40018 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_40014 ?auto_40019 ) ) ( ON-TABLE ?auto_40016 ) ( ON ?auto_40020 ?auto_40016 ) ( not ( = ?auto_40016 ?auto_40020 ) ) ( not ( = ?auto_40016 ?auto_40017 ) ) ( not ( = ?auto_40016 ?auto_40015 ) ) ( not ( = ?auto_40016 ?auto_40019 ) ) ( not ( = ?auto_40016 ?auto_40014 ) ) ( not ( = ?auto_40020 ?auto_40017 ) ) ( not ( = ?auto_40020 ?auto_40015 ) ) ( not ( = ?auto_40020 ?auto_40019 ) ) ( not ( = ?auto_40020 ?auto_40014 ) ) ( not ( = ?auto_40017 ?auto_40015 ) ) ( not ( = ?auto_40017 ?auto_40019 ) ) ( not ( = ?auto_40017 ?auto_40014 ) ) ( not ( = ?auto_40015 ?auto_40019 ) ) ( not ( = ?auto_40015 ?auto_40014 ) ) ( ON ?auto_40014 ?auto_40018 ) ( not ( = ?auto_40014 ?auto_40018 ) ) ( not ( = ?auto_40019 ?auto_40018 ) ) ( not ( = ?auto_40016 ?auto_40018 ) ) ( not ( = ?auto_40020 ?auto_40018 ) ) ( not ( = ?auto_40017 ?auto_40018 ) ) ( not ( = ?auto_40015 ?auto_40018 ) ) ( ON ?auto_40019 ?auto_40014 ) ( ON-TABLE ?auto_40018 ) ( ON ?auto_40015 ?auto_40019 ) ( CLEAR ?auto_40015 ) ( HOLDING ?auto_40017 ) ( CLEAR ?auto_40020 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_40016 ?auto_40020 ?auto_40017 )
      ( MAKE-1PILE ?auto_40014 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_40021 - BLOCK
    )
    :vars
    (
      ?auto_40025 - BLOCK
      ?auto_40023 - BLOCK
      ?auto_40024 - BLOCK
      ?auto_40022 - BLOCK
      ?auto_40026 - BLOCK
      ?auto_40027 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_40021 ?auto_40025 ) ) ( ON-TABLE ?auto_40023 ) ( ON ?auto_40024 ?auto_40023 ) ( not ( = ?auto_40023 ?auto_40024 ) ) ( not ( = ?auto_40023 ?auto_40022 ) ) ( not ( = ?auto_40023 ?auto_40026 ) ) ( not ( = ?auto_40023 ?auto_40025 ) ) ( not ( = ?auto_40023 ?auto_40021 ) ) ( not ( = ?auto_40024 ?auto_40022 ) ) ( not ( = ?auto_40024 ?auto_40026 ) ) ( not ( = ?auto_40024 ?auto_40025 ) ) ( not ( = ?auto_40024 ?auto_40021 ) ) ( not ( = ?auto_40022 ?auto_40026 ) ) ( not ( = ?auto_40022 ?auto_40025 ) ) ( not ( = ?auto_40022 ?auto_40021 ) ) ( not ( = ?auto_40026 ?auto_40025 ) ) ( not ( = ?auto_40026 ?auto_40021 ) ) ( ON ?auto_40021 ?auto_40027 ) ( not ( = ?auto_40021 ?auto_40027 ) ) ( not ( = ?auto_40025 ?auto_40027 ) ) ( not ( = ?auto_40023 ?auto_40027 ) ) ( not ( = ?auto_40024 ?auto_40027 ) ) ( not ( = ?auto_40022 ?auto_40027 ) ) ( not ( = ?auto_40026 ?auto_40027 ) ) ( ON ?auto_40025 ?auto_40021 ) ( ON-TABLE ?auto_40027 ) ( ON ?auto_40026 ?auto_40025 ) ( CLEAR ?auto_40024 ) ( ON ?auto_40022 ?auto_40026 ) ( CLEAR ?auto_40022 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_40027 ?auto_40021 ?auto_40025 ?auto_40026 )
      ( MAKE-1PILE ?auto_40021 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_40028 - BLOCK
    )
    :vars
    (
      ?auto_40030 - BLOCK
      ?auto_40029 - BLOCK
      ?auto_40034 - BLOCK
      ?auto_40031 - BLOCK
      ?auto_40032 - BLOCK
      ?auto_40033 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_40028 ?auto_40030 ) ) ( ON-TABLE ?auto_40029 ) ( not ( = ?auto_40029 ?auto_40034 ) ) ( not ( = ?auto_40029 ?auto_40031 ) ) ( not ( = ?auto_40029 ?auto_40032 ) ) ( not ( = ?auto_40029 ?auto_40030 ) ) ( not ( = ?auto_40029 ?auto_40028 ) ) ( not ( = ?auto_40034 ?auto_40031 ) ) ( not ( = ?auto_40034 ?auto_40032 ) ) ( not ( = ?auto_40034 ?auto_40030 ) ) ( not ( = ?auto_40034 ?auto_40028 ) ) ( not ( = ?auto_40031 ?auto_40032 ) ) ( not ( = ?auto_40031 ?auto_40030 ) ) ( not ( = ?auto_40031 ?auto_40028 ) ) ( not ( = ?auto_40032 ?auto_40030 ) ) ( not ( = ?auto_40032 ?auto_40028 ) ) ( ON ?auto_40028 ?auto_40033 ) ( not ( = ?auto_40028 ?auto_40033 ) ) ( not ( = ?auto_40030 ?auto_40033 ) ) ( not ( = ?auto_40029 ?auto_40033 ) ) ( not ( = ?auto_40034 ?auto_40033 ) ) ( not ( = ?auto_40031 ?auto_40033 ) ) ( not ( = ?auto_40032 ?auto_40033 ) ) ( ON ?auto_40030 ?auto_40028 ) ( ON-TABLE ?auto_40033 ) ( ON ?auto_40032 ?auto_40030 ) ( ON ?auto_40031 ?auto_40032 ) ( CLEAR ?auto_40031 ) ( HOLDING ?auto_40034 ) ( CLEAR ?auto_40029 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_40029 ?auto_40034 )
      ( MAKE-1PILE ?auto_40028 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_40035 - BLOCK
    )
    :vars
    (
      ?auto_40040 - BLOCK
      ?auto_40036 - BLOCK
      ?auto_40041 - BLOCK
      ?auto_40038 - BLOCK
      ?auto_40037 - BLOCK
      ?auto_40039 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_40035 ?auto_40040 ) ) ( ON-TABLE ?auto_40036 ) ( not ( = ?auto_40036 ?auto_40041 ) ) ( not ( = ?auto_40036 ?auto_40038 ) ) ( not ( = ?auto_40036 ?auto_40037 ) ) ( not ( = ?auto_40036 ?auto_40040 ) ) ( not ( = ?auto_40036 ?auto_40035 ) ) ( not ( = ?auto_40041 ?auto_40038 ) ) ( not ( = ?auto_40041 ?auto_40037 ) ) ( not ( = ?auto_40041 ?auto_40040 ) ) ( not ( = ?auto_40041 ?auto_40035 ) ) ( not ( = ?auto_40038 ?auto_40037 ) ) ( not ( = ?auto_40038 ?auto_40040 ) ) ( not ( = ?auto_40038 ?auto_40035 ) ) ( not ( = ?auto_40037 ?auto_40040 ) ) ( not ( = ?auto_40037 ?auto_40035 ) ) ( ON ?auto_40035 ?auto_40039 ) ( not ( = ?auto_40035 ?auto_40039 ) ) ( not ( = ?auto_40040 ?auto_40039 ) ) ( not ( = ?auto_40036 ?auto_40039 ) ) ( not ( = ?auto_40041 ?auto_40039 ) ) ( not ( = ?auto_40038 ?auto_40039 ) ) ( not ( = ?auto_40037 ?auto_40039 ) ) ( ON ?auto_40040 ?auto_40035 ) ( ON-TABLE ?auto_40039 ) ( ON ?auto_40037 ?auto_40040 ) ( ON ?auto_40038 ?auto_40037 ) ( CLEAR ?auto_40036 ) ( ON ?auto_40041 ?auto_40038 ) ( CLEAR ?auto_40041 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_40039 ?auto_40035 ?auto_40040 ?auto_40037 ?auto_40038 )
      ( MAKE-1PILE ?auto_40035 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_40042 - BLOCK
    )
    :vars
    (
      ?auto_40043 - BLOCK
      ?auto_40048 - BLOCK
      ?auto_40044 - BLOCK
      ?auto_40046 - BLOCK
      ?auto_40045 - BLOCK
      ?auto_40047 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_40042 ?auto_40043 ) ) ( not ( = ?auto_40048 ?auto_40044 ) ) ( not ( = ?auto_40048 ?auto_40046 ) ) ( not ( = ?auto_40048 ?auto_40045 ) ) ( not ( = ?auto_40048 ?auto_40043 ) ) ( not ( = ?auto_40048 ?auto_40042 ) ) ( not ( = ?auto_40044 ?auto_40046 ) ) ( not ( = ?auto_40044 ?auto_40045 ) ) ( not ( = ?auto_40044 ?auto_40043 ) ) ( not ( = ?auto_40044 ?auto_40042 ) ) ( not ( = ?auto_40046 ?auto_40045 ) ) ( not ( = ?auto_40046 ?auto_40043 ) ) ( not ( = ?auto_40046 ?auto_40042 ) ) ( not ( = ?auto_40045 ?auto_40043 ) ) ( not ( = ?auto_40045 ?auto_40042 ) ) ( ON ?auto_40042 ?auto_40047 ) ( not ( = ?auto_40042 ?auto_40047 ) ) ( not ( = ?auto_40043 ?auto_40047 ) ) ( not ( = ?auto_40048 ?auto_40047 ) ) ( not ( = ?auto_40044 ?auto_40047 ) ) ( not ( = ?auto_40046 ?auto_40047 ) ) ( not ( = ?auto_40045 ?auto_40047 ) ) ( ON ?auto_40043 ?auto_40042 ) ( ON-TABLE ?auto_40047 ) ( ON ?auto_40045 ?auto_40043 ) ( ON ?auto_40046 ?auto_40045 ) ( ON ?auto_40044 ?auto_40046 ) ( CLEAR ?auto_40044 ) ( HOLDING ?auto_40048 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_40048 )
      ( MAKE-1PILE ?auto_40042 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_40049 - BLOCK
    )
    :vars
    (
      ?auto_40054 - BLOCK
      ?auto_40052 - BLOCK
      ?auto_40050 - BLOCK
      ?auto_40053 - BLOCK
      ?auto_40055 - BLOCK
      ?auto_40051 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_40049 ?auto_40054 ) ) ( not ( = ?auto_40052 ?auto_40050 ) ) ( not ( = ?auto_40052 ?auto_40053 ) ) ( not ( = ?auto_40052 ?auto_40055 ) ) ( not ( = ?auto_40052 ?auto_40054 ) ) ( not ( = ?auto_40052 ?auto_40049 ) ) ( not ( = ?auto_40050 ?auto_40053 ) ) ( not ( = ?auto_40050 ?auto_40055 ) ) ( not ( = ?auto_40050 ?auto_40054 ) ) ( not ( = ?auto_40050 ?auto_40049 ) ) ( not ( = ?auto_40053 ?auto_40055 ) ) ( not ( = ?auto_40053 ?auto_40054 ) ) ( not ( = ?auto_40053 ?auto_40049 ) ) ( not ( = ?auto_40055 ?auto_40054 ) ) ( not ( = ?auto_40055 ?auto_40049 ) ) ( ON ?auto_40049 ?auto_40051 ) ( not ( = ?auto_40049 ?auto_40051 ) ) ( not ( = ?auto_40054 ?auto_40051 ) ) ( not ( = ?auto_40052 ?auto_40051 ) ) ( not ( = ?auto_40050 ?auto_40051 ) ) ( not ( = ?auto_40053 ?auto_40051 ) ) ( not ( = ?auto_40055 ?auto_40051 ) ) ( ON ?auto_40054 ?auto_40049 ) ( ON-TABLE ?auto_40051 ) ( ON ?auto_40055 ?auto_40054 ) ( ON ?auto_40053 ?auto_40055 ) ( ON ?auto_40050 ?auto_40053 ) ( ON ?auto_40052 ?auto_40050 ) ( CLEAR ?auto_40052 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_40051 ?auto_40049 ?auto_40054 ?auto_40055 ?auto_40053 ?auto_40050 )
      ( MAKE-1PILE ?auto_40049 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_40060 - BLOCK
      ?auto_40061 - BLOCK
      ?auto_40062 - BLOCK
      ?auto_40063 - BLOCK
    )
    :vars
    (
      ?auto_40064 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_40064 ?auto_40063 ) ( CLEAR ?auto_40064 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_40060 ) ( ON ?auto_40061 ?auto_40060 ) ( ON ?auto_40062 ?auto_40061 ) ( ON ?auto_40063 ?auto_40062 ) ( not ( = ?auto_40060 ?auto_40061 ) ) ( not ( = ?auto_40060 ?auto_40062 ) ) ( not ( = ?auto_40060 ?auto_40063 ) ) ( not ( = ?auto_40060 ?auto_40064 ) ) ( not ( = ?auto_40061 ?auto_40062 ) ) ( not ( = ?auto_40061 ?auto_40063 ) ) ( not ( = ?auto_40061 ?auto_40064 ) ) ( not ( = ?auto_40062 ?auto_40063 ) ) ( not ( = ?auto_40062 ?auto_40064 ) ) ( not ( = ?auto_40063 ?auto_40064 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_40064 ?auto_40063 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_40065 - BLOCK
      ?auto_40066 - BLOCK
      ?auto_40067 - BLOCK
      ?auto_40068 - BLOCK
    )
    :vars
    (
      ?auto_40069 - BLOCK
      ?auto_40070 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_40069 ?auto_40068 ) ( CLEAR ?auto_40069 ) ( ON-TABLE ?auto_40065 ) ( ON ?auto_40066 ?auto_40065 ) ( ON ?auto_40067 ?auto_40066 ) ( ON ?auto_40068 ?auto_40067 ) ( not ( = ?auto_40065 ?auto_40066 ) ) ( not ( = ?auto_40065 ?auto_40067 ) ) ( not ( = ?auto_40065 ?auto_40068 ) ) ( not ( = ?auto_40065 ?auto_40069 ) ) ( not ( = ?auto_40066 ?auto_40067 ) ) ( not ( = ?auto_40066 ?auto_40068 ) ) ( not ( = ?auto_40066 ?auto_40069 ) ) ( not ( = ?auto_40067 ?auto_40068 ) ) ( not ( = ?auto_40067 ?auto_40069 ) ) ( not ( = ?auto_40068 ?auto_40069 ) ) ( HOLDING ?auto_40070 ) ( not ( = ?auto_40065 ?auto_40070 ) ) ( not ( = ?auto_40066 ?auto_40070 ) ) ( not ( = ?auto_40067 ?auto_40070 ) ) ( not ( = ?auto_40068 ?auto_40070 ) ) ( not ( = ?auto_40069 ?auto_40070 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_40070 )
      ( MAKE-4PILE ?auto_40065 ?auto_40066 ?auto_40067 ?auto_40068 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_40071 - BLOCK
      ?auto_40072 - BLOCK
      ?auto_40073 - BLOCK
      ?auto_40074 - BLOCK
    )
    :vars
    (
      ?auto_40076 - BLOCK
      ?auto_40075 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_40076 ?auto_40074 ) ( ON-TABLE ?auto_40071 ) ( ON ?auto_40072 ?auto_40071 ) ( ON ?auto_40073 ?auto_40072 ) ( ON ?auto_40074 ?auto_40073 ) ( not ( = ?auto_40071 ?auto_40072 ) ) ( not ( = ?auto_40071 ?auto_40073 ) ) ( not ( = ?auto_40071 ?auto_40074 ) ) ( not ( = ?auto_40071 ?auto_40076 ) ) ( not ( = ?auto_40072 ?auto_40073 ) ) ( not ( = ?auto_40072 ?auto_40074 ) ) ( not ( = ?auto_40072 ?auto_40076 ) ) ( not ( = ?auto_40073 ?auto_40074 ) ) ( not ( = ?auto_40073 ?auto_40076 ) ) ( not ( = ?auto_40074 ?auto_40076 ) ) ( not ( = ?auto_40071 ?auto_40075 ) ) ( not ( = ?auto_40072 ?auto_40075 ) ) ( not ( = ?auto_40073 ?auto_40075 ) ) ( not ( = ?auto_40074 ?auto_40075 ) ) ( not ( = ?auto_40076 ?auto_40075 ) ) ( ON ?auto_40075 ?auto_40076 ) ( CLEAR ?auto_40075 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_40071 ?auto_40072 ?auto_40073 ?auto_40074 ?auto_40076 )
      ( MAKE-4PILE ?auto_40071 ?auto_40072 ?auto_40073 ?auto_40074 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_40077 - BLOCK
      ?auto_40078 - BLOCK
      ?auto_40079 - BLOCK
      ?auto_40080 - BLOCK
    )
    :vars
    (
      ?auto_40082 - BLOCK
      ?auto_40081 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_40082 ?auto_40080 ) ( ON-TABLE ?auto_40077 ) ( ON ?auto_40078 ?auto_40077 ) ( ON ?auto_40079 ?auto_40078 ) ( ON ?auto_40080 ?auto_40079 ) ( not ( = ?auto_40077 ?auto_40078 ) ) ( not ( = ?auto_40077 ?auto_40079 ) ) ( not ( = ?auto_40077 ?auto_40080 ) ) ( not ( = ?auto_40077 ?auto_40082 ) ) ( not ( = ?auto_40078 ?auto_40079 ) ) ( not ( = ?auto_40078 ?auto_40080 ) ) ( not ( = ?auto_40078 ?auto_40082 ) ) ( not ( = ?auto_40079 ?auto_40080 ) ) ( not ( = ?auto_40079 ?auto_40082 ) ) ( not ( = ?auto_40080 ?auto_40082 ) ) ( not ( = ?auto_40077 ?auto_40081 ) ) ( not ( = ?auto_40078 ?auto_40081 ) ) ( not ( = ?auto_40079 ?auto_40081 ) ) ( not ( = ?auto_40080 ?auto_40081 ) ) ( not ( = ?auto_40082 ?auto_40081 ) ) ( HOLDING ?auto_40081 ) ( CLEAR ?auto_40082 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_40077 ?auto_40078 ?auto_40079 ?auto_40080 ?auto_40082 ?auto_40081 )
      ( MAKE-4PILE ?auto_40077 ?auto_40078 ?auto_40079 ?auto_40080 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_40083 - BLOCK
      ?auto_40084 - BLOCK
      ?auto_40085 - BLOCK
      ?auto_40086 - BLOCK
    )
    :vars
    (
      ?auto_40087 - BLOCK
      ?auto_40088 - BLOCK
      ?auto_40089 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_40087 ?auto_40086 ) ( ON-TABLE ?auto_40083 ) ( ON ?auto_40084 ?auto_40083 ) ( ON ?auto_40085 ?auto_40084 ) ( ON ?auto_40086 ?auto_40085 ) ( not ( = ?auto_40083 ?auto_40084 ) ) ( not ( = ?auto_40083 ?auto_40085 ) ) ( not ( = ?auto_40083 ?auto_40086 ) ) ( not ( = ?auto_40083 ?auto_40087 ) ) ( not ( = ?auto_40084 ?auto_40085 ) ) ( not ( = ?auto_40084 ?auto_40086 ) ) ( not ( = ?auto_40084 ?auto_40087 ) ) ( not ( = ?auto_40085 ?auto_40086 ) ) ( not ( = ?auto_40085 ?auto_40087 ) ) ( not ( = ?auto_40086 ?auto_40087 ) ) ( not ( = ?auto_40083 ?auto_40088 ) ) ( not ( = ?auto_40084 ?auto_40088 ) ) ( not ( = ?auto_40085 ?auto_40088 ) ) ( not ( = ?auto_40086 ?auto_40088 ) ) ( not ( = ?auto_40087 ?auto_40088 ) ) ( CLEAR ?auto_40087 ) ( ON ?auto_40088 ?auto_40089 ) ( CLEAR ?auto_40088 ) ( HAND-EMPTY ) ( not ( = ?auto_40083 ?auto_40089 ) ) ( not ( = ?auto_40084 ?auto_40089 ) ) ( not ( = ?auto_40085 ?auto_40089 ) ) ( not ( = ?auto_40086 ?auto_40089 ) ) ( not ( = ?auto_40087 ?auto_40089 ) ) ( not ( = ?auto_40088 ?auto_40089 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_40088 ?auto_40089 )
      ( MAKE-4PILE ?auto_40083 ?auto_40084 ?auto_40085 ?auto_40086 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_40104 - BLOCK
      ?auto_40105 - BLOCK
      ?auto_40106 - BLOCK
      ?auto_40107 - BLOCK
    )
    :vars
    (
      ?auto_40109 - BLOCK
      ?auto_40108 - BLOCK
      ?auto_40110 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_40104 ) ( ON ?auto_40105 ?auto_40104 ) ( ON ?auto_40106 ?auto_40105 ) ( not ( = ?auto_40104 ?auto_40105 ) ) ( not ( = ?auto_40104 ?auto_40106 ) ) ( not ( = ?auto_40104 ?auto_40107 ) ) ( not ( = ?auto_40104 ?auto_40109 ) ) ( not ( = ?auto_40105 ?auto_40106 ) ) ( not ( = ?auto_40105 ?auto_40107 ) ) ( not ( = ?auto_40105 ?auto_40109 ) ) ( not ( = ?auto_40106 ?auto_40107 ) ) ( not ( = ?auto_40106 ?auto_40109 ) ) ( not ( = ?auto_40107 ?auto_40109 ) ) ( not ( = ?auto_40104 ?auto_40108 ) ) ( not ( = ?auto_40105 ?auto_40108 ) ) ( not ( = ?auto_40106 ?auto_40108 ) ) ( not ( = ?auto_40107 ?auto_40108 ) ) ( not ( = ?auto_40109 ?auto_40108 ) ) ( ON ?auto_40108 ?auto_40110 ) ( not ( = ?auto_40104 ?auto_40110 ) ) ( not ( = ?auto_40105 ?auto_40110 ) ) ( not ( = ?auto_40106 ?auto_40110 ) ) ( not ( = ?auto_40107 ?auto_40110 ) ) ( not ( = ?auto_40109 ?auto_40110 ) ) ( not ( = ?auto_40108 ?auto_40110 ) ) ( ON ?auto_40109 ?auto_40108 ) ( CLEAR ?auto_40109 ) ( HOLDING ?auto_40107 ) ( CLEAR ?auto_40106 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_40104 ?auto_40105 ?auto_40106 ?auto_40107 ?auto_40109 )
      ( MAKE-4PILE ?auto_40104 ?auto_40105 ?auto_40106 ?auto_40107 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_40111 - BLOCK
      ?auto_40112 - BLOCK
      ?auto_40113 - BLOCK
      ?auto_40114 - BLOCK
    )
    :vars
    (
      ?auto_40115 - BLOCK
      ?auto_40116 - BLOCK
      ?auto_40117 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_40111 ) ( ON ?auto_40112 ?auto_40111 ) ( ON ?auto_40113 ?auto_40112 ) ( not ( = ?auto_40111 ?auto_40112 ) ) ( not ( = ?auto_40111 ?auto_40113 ) ) ( not ( = ?auto_40111 ?auto_40114 ) ) ( not ( = ?auto_40111 ?auto_40115 ) ) ( not ( = ?auto_40112 ?auto_40113 ) ) ( not ( = ?auto_40112 ?auto_40114 ) ) ( not ( = ?auto_40112 ?auto_40115 ) ) ( not ( = ?auto_40113 ?auto_40114 ) ) ( not ( = ?auto_40113 ?auto_40115 ) ) ( not ( = ?auto_40114 ?auto_40115 ) ) ( not ( = ?auto_40111 ?auto_40116 ) ) ( not ( = ?auto_40112 ?auto_40116 ) ) ( not ( = ?auto_40113 ?auto_40116 ) ) ( not ( = ?auto_40114 ?auto_40116 ) ) ( not ( = ?auto_40115 ?auto_40116 ) ) ( ON ?auto_40116 ?auto_40117 ) ( not ( = ?auto_40111 ?auto_40117 ) ) ( not ( = ?auto_40112 ?auto_40117 ) ) ( not ( = ?auto_40113 ?auto_40117 ) ) ( not ( = ?auto_40114 ?auto_40117 ) ) ( not ( = ?auto_40115 ?auto_40117 ) ) ( not ( = ?auto_40116 ?auto_40117 ) ) ( ON ?auto_40115 ?auto_40116 ) ( CLEAR ?auto_40113 ) ( ON ?auto_40114 ?auto_40115 ) ( CLEAR ?auto_40114 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_40117 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_40117 ?auto_40116 ?auto_40115 )
      ( MAKE-4PILE ?auto_40111 ?auto_40112 ?auto_40113 ?auto_40114 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_40118 - BLOCK
      ?auto_40119 - BLOCK
      ?auto_40120 - BLOCK
      ?auto_40121 - BLOCK
    )
    :vars
    (
      ?auto_40123 - BLOCK
      ?auto_40122 - BLOCK
      ?auto_40124 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_40118 ) ( ON ?auto_40119 ?auto_40118 ) ( not ( = ?auto_40118 ?auto_40119 ) ) ( not ( = ?auto_40118 ?auto_40120 ) ) ( not ( = ?auto_40118 ?auto_40121 ) ) ( not ( = ?auto_40118 ?auto_40123 ) ) ( not ( = ?auto_40119 ?auto_40120 ) ) ( not ( = ?auto_40119 ?auto_40121 ) ) ( not ( = ?auto_40119 ?auto_40123 ) ) ( not ( = ?auto_40120 ?auto_40121 ) ) ( not ( = ?auto_40120 ?auto_40123 ) ) ( not ( = ?auto_40121 ?auto_40123 ) ) ( not ( = ?auto_40118 ?auto_40122 ) ) ( not ( = ?auto_40119 ?auto_40122 ) ) ( not ( = ?auto_40120 ?auto_40122 ) ) ( not ( = ?auto_40121 ?auto_40122 ) ) ( not ( = ?auto_40123 ?auto_40122 ) ) ( ON ?auto_40122 ?auto_40124 ) ( not ( = ?auto_40118 ?auto_40124 ) ) ( not ( = ?auto_40119 ?auto_40124 ) ) ( not ( = ?auto_40120 ?auto_40124 ) ) ( not ( = ?auto_40121 ?auto_40124 ) ) ( not ( = ?auto_40123 ?auto_40124 ) ) ( not ( = ?auto_40122 ?auto_40124 ) ) ( ON ?auto_40123 ?auto_40122 ) ( ON ?auto_40121 ?auto_40123 ) ( CLEAR ?auto_40121 ) ( ON-TABLE ?auto_40124 ) ( HOLDING ?auto_40120 ) ( CLEAR ?auto_40119 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_40118 ?auto_40119 ?auto_40120 )
      ( MAKE-4PILE ?auto_40118 ?auto_40119 ?auto_40120 ?auto_40121 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_40125 - BLOCK
      ?auto_40126 - BLOCK
      ?auto_40127 - BLOCK
      ?auto_40128 - BLOCK
    )
    :vars
    (
      ?auto_40131 - BLOCK
      ?auto_40129 - BLOCK
      ?auto_40130 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_40125 ) ( ON ?auto_40126 ?auto_40125 ) ( not ( = ?auto_40125 ?auto_40126 ) ) ( not ( = ?auto_40125 ?auto_40127 ) ) ( not ( = ?auto_40125 ?auto_40128 ) ) ( not ( = ?auto_40125 ?auto_40131 ) ) ( not ( = ?auto_40126 ?auto_40127 ) ) ( not ( = ?auto_40126 ?auto_40128 ) ) ( not ( = ?auto_40126 ?auto_40131 ) ) ( not ( = ?auto_40127 ?auto_40128 ) ) ( not ( = ?auto_40127 ?auto_40131 ) ) ( not ( = ?auto_40128 ?auto_40131 ) ) ( not ( = ?auto_40125 ?auto_40129 ) ) ( not ( = ?auto_40126 ?auto_40129 ) ) ( not ( = ?auto_40127 ?auto_40129 ) ) ( not ( = ?auto_40128 ?auto_40129 ) ) ( not ( = ?auto_40131 ?auto_40129 ) ) ( ON ?auto_40129 ?auto_40130 ) ( not ( = ?auto_40125 ?auto_40130 ) ) ( not ( = ?auto_40126 ?auto_40130 ) ) ( not ( = ?auto_40127 ?auto_40130 ) ) ( not ( = ?auto_40128 ?auto_40130 ) ) ( not ( = ?auto_40131 ?auto_40130 ) ) ( not ( = ?auto_40129 ?auto_40130 ) ) ( ON ?auto_40131 ?auto_40129 ) ( ON ?auto_40128 ?auto_40131 ) ( ON-TABLE ?auto_40130 ) ( CLEAR ?auto_40126 ) ( ON ?auto_40127 ?auto_40128 ) ( CLEAR ?auto_40127 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_40130 ?auto_40129 ?auto_40131 ?auto_40128 )
      ( MAKE-4PILE ?auto_40125 ?auto_40126 ?auto_40127 ?auto_40128 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_40132 - BLOCK
      ?auto_40133 - BLOCK
      ?auto_40134 - BLOCK
      ?auto_40135 - BLOCK
    )
    :vars
    (
      ?auto_40138 - BLOCK
      ?auto_40136 - BLOCK
      ?auto_40137 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_40132 ) ( not ( = ?auto_40132 ?auto_40133 ) ) ( not ( = ?auto_40132 ?auto_40134 ) ) ( not ( = ?auto_40132 ?auto_40135 ) ) ( not ( = ?auto_40132 ?auto_40138 ) ) ( not ( = ?auto_40133 ?auto_40134 ) ) ( not ( = ?auto_40133 ?auto_40135 ) ) ( not ( = ?auto_40133 ?auto_40138 ) ) ( not ( = ?auto_40134 ?auto_40135 ) ) ( not ( = ?auto_40134 ?auto_40138 ) ) ( not ( = ?auto_40135 ?auto_40138 ) ) ( not ( = ?auto_40132 ?auto_40136 ) ) ( not ( = ?auto_40133 ?auto_40136 ) ) ( not ( = ?auto_40134 ?auto_40136 ) ) ( not ( = ?auto_40135 ?auto_40136 ) ) ( not ( = ?auto_40138 ?auto_40136 ) ) ( ON ?auto_40136 ?auto_40137 ) ( not ( = ?auto_40132 ?auto_40137 ) ) ( not ( = ?auto_40133 ?auto_40137 ) ) ( not ( = ?auto_40134 ?auto_40137 ) ) ( not ( = ?auto_40135 ?auto_40137 ) ) ( not ( = ?auto_40138 ?auto_40137 ) ) ( not ( = ?auto_40136 ?auto_40137 ) ) ( ON ?auto_40138 ?auto_40136 ) ( ON ?auto_40135 ?auto_40138 ) ( ON-TABLE ?auto_40137 ) ( ON ?auto_40134 ?auto_40135 ) ( CLEAR ?auto_40134 ) ( HOLDING ?auto_40133 ) ( CLEAR ?auto_40132 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_40132 ?auto_40133 )
      ( MAKE-4PILE ?auto_40132 ?auto_40133 ?auto_40134 ?auto_40135 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_40139 - BLOCK
      ?auto_40140 - BLOCK
      ?auto_40141 - BLOCK
      ?auto_40142 - BLOCK
    )
    :vars
    (
      ?auto_40144 - BLOCK
      ?auto_40143 - BLOCK
      ?auto_40145 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_40139 ) ( not ( = ?auto_40139 ?auto_40140 ) ) ( not ( = ?auto_40139 ?auto_40141 ) ) ( not ( = ?auto_40139 ?auto_40142 ) ) ( not ( = ?auto_40139 ?auto_40144 ) ) ( not ( = ?auto_40140 ?auto_40141 ) ) ( not ( = ?auto_40140 ?auto_40142 ) ) ( not ( = ?auto_40140 ?auto_40144 ) ) ( not ( = ?auto_40141 ?auto_40142 ) ) ( not ( = ?auto_40141 ?auto_40144 ) ) ( not ( = ?auto_40142 ?auto_40144 ) ) ( not ( = ?auto_40139 ?auto_40143 ) ) ( not ( = ?auto_40140 ?auto_40143 ) ) ( not ( = ?auto_40141 ?auto_40143 ) ) ( not ( = ?auto_40142 ?auto_40143 ) ) ( not ( = ?auto_40144 ?auto_40143 ) ) ( ON ?auto_40143 ?auto_40145 ) ( not ( = ?auto_40139 ?auto_40145 ) ) ( not ( = ?auto_40140 ?auto_40145 ) ) ( not ( = ?auto_40141 ?auto_40145 ) ) ( not ( = ?auto_40142 ?auto_40145 ) ) ( not ( = ?auto_40144 ?auto_40145 ) ) ( not ( = ?auto_40143 ?auto_40145 ) ) ( ON ?auto_40144 ?auto_40143 ) ( ON ?auto_40142 ?auto_40144 ) ( ON-TABLE ?auto_40145 ) ( ON ?auto_40141 ?auto_40142 ) ( CLEAR ?auto_40139 ) ( ON ?auto_40140 ?auto_40141 ) ( CLEAR ?auto_40140 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_40145 ?auto_40143 ?auto_40144 ?auto_40142 ?auto_40141 )
      ( MAKE-4PILE ?auto_40139 ?auto_40140 ?auto_40141 ?auto_40142 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_40146 - BLOCK
      ?auto_40147 - BLOCK
      ?auto_40148 - BLOCK
      ?auto_40149 - BLOCK
    )
    :vars
    (
      ?auto_40151 - BLOCK
      ?auto_40150 - BLOCK
      ?auto_40152 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_40146 ?auto_40147 ) ) ( not ( = ?auto_40146 ?auto_40148 ) ) ( not ( = ?auto_40146 ?auto_40149 ) ) ( not ( = ?auto_40146 ?auto_40151 ) ) ( not ( = ?auto_40147 ?auto_40148 ) ) ( not ( = ?auto_40147 ?auto_40149 ) ) ( not ( = ?auto_40147 ?auto_40151 ) ) ( not ( = ?auto_40148 ?auto_40149 ) ) ( not ( = ?auto_40148 ?auto_40151 ) ) ( not ( = ?auto_40149 ?auto_40151 ) ) ( not ( = ?auto_40146 ?auto_40150 ) ) ( not ( = ?auto_40147 ?auto_40150 ) ) ( not ( = ?auto_40148 ?auto_40150 ) ) ( not ( = ?auto_40149 ?auto_40150 ) ) ( not ( = ?auto_40151 ?auto_40150 ) ) ( ON ?auto_40150 ?auto_40152 ) ( not ( = ?auto_40146 ?auto_40152 ) ) ( not ( = ?auto_40147 ?auto_40152 ) ) ( not ( = ?auto_40148 ?auto_40152 ) ) ( not ( = ?auto_40149 ?auto_40152 ) ) ( not ( = ?auto_40151 ?auto_40152 ) ) ( not ( = ?auto_40150 ?auto_40152 ) ) ( ON ?auto_40151 ?auto_40150 ) ( ON ?auto_40149 ?auto_40151 ) ( ON-TABLE ?auto_40152 ) ( ON ?auto_40148 ?auto_40149 ) ( ON ?auto_40147 ?auto_40148 ) ( CLEAR ?auto_40147 ) ( HOLDING ?auto_40146 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_40146 )
      ( MAKE-4PILE ?auto_40146 ?auto_40147 ?auto_40148 ?auto_40149 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_40153 - BLOCK
      ?auto_40154 - BLOCK
      ?auto_40155 - BLOCK
      ?auto_40156 - BLOCK
    )
    :vars
    (
      ?auto_40159 - BLOCK
      ?auto_40157 - BLOCK
      ?auto_40158 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_40153 ?auto_40154 ) ) ( not ( = ?auto_40153 ?auto_40155 ) ) ( not ( = ?auto_40153 ?auto_40156 ) ) ( not ( = ?auto_40153 ?auto_40159 ) ) ( not ( = ?auto_40154 ?auto_40155 ) ) ( not ( = ?auto_40154 ?auto_40156 ) ) ( not ( = ?auto_40154 ?auto_40159 ) ) ( not ( = ?auto_40155 ?auto_40156 ) ) ( not ( = ?auto_40155 ?auto_40159 ) ) ( not ( = ?auto_40156 ?auto_40159 ) ) ( not ( = ?auto_40153 ?auto_40157 ) ) ( not ( = ?auto_40154 ?auto_40157 ) ) ( not ( = ?auto_40155 ?auto_40157 ) ) ( not ( = ?auto_40156 ?auto_40157 ) ) ( not ( = ?auto_40159 ?auto_40157 ) ) ( ON ?auto_40157 ?auto_40158 ) ( not ( = ?auto_40153 ?auto_40158 ) ) ( not ( = ?auto_40154 ?auto_40158 ) ) ( not ( = ?auto_40155 ?auto_40158 ) ) ( not ( = ?auto_40156 ?auto_40158 ) ) ( not ( = ?auto_40159 ?auto_40158 ) ) ( not ( = ?auto_40157 ?auto_40158 ) ) ( ON ?auto_40159 ?auto_40157 ) ( ON ?auto_40156 ?auto_40159 ) ( ON-TABLE ?auto_40158 ) ( ON ?auto_40155 ?auto_40156 ) ( ON ?auto_40154 ?auto_40155 ) ( ON ?auto_40153 ?auto_40154 ) ( CLEAR ?auto_40153 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_40158 ?auto_40157 ?auto_40159 ?auto_40156 ?auto_40155 ?auto_40154 )
      ( MAKE-4PILE ?auto_40153 ?auto_40154 ?auto_40155 ?auto_40156 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_40162 - BLOCK
      ?auto_40163 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_40163 ) ( CLEAR ?auto_40162 ) ( ON-TABLE ?auto_40162 ) ( not ( = ?auto_40162 ?auto_40163 ) ) )
    :subtasks
    ( ( !STACK ?auto_40163 ?auto_40162 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_40164 - BLOCK
      ?auto_40165 - BLOCK
    )
    :vars
    (
      ?auto_40166 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_40164 ) ( ON-TABLE ?auto_40164 ) ( not ( = ?auto_40164 ?auto_40165 ) ) ( ON ?auto_40165 ?auto_40166 ) ( CLEAR ?auto_40165 ) ( HAND-EMPTY ) ( not ( = ?auto_40164 ?auto_40166 ) ) ( not ( = ?auto_40165 ?auto_40166 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_40165 ?auto_40166 )
      ( MAKE-2PILE ?auto_40164 ?auto_40165 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_40167 - BLOCK
      ?auto_40168 - BLOCK
    )
    :vars
    (
      ?auto_40169 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_40167 ?auto_40168 ) ) ( ON ?auto_40168 ?auto_40169 ) ( CLEAR ?auto_40168 ) ( not ( = ?auto_40167 ?auto_40169 ) ) ( not ( = ?auto_40168 ?auto_40169 ) ) ( HOLDING ?auto_40167 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_40167 )
      ( MAKE-2PILE ?auto_40167 ?auto_40168 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_40170 - BLOCK
      ?auto_40171 - BLOCK
    )
    :vars
    (
      ?auto_40172 - BLOCK
      ?auto_40174 - BLOCK
      ?auto_40175 - BLOCK
      ?auto_40173 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_40170 ?auto_40171 ) ) ( ON ?auto_40171 ?auto_40172 ) ( not ( = ?auto_40170 ?auto_40172 ) ) ( not ( = ?auto_40171 ?auto_40172 ) ) ( ON ?auto_40170 ?auto_40171 ) ( CLEAR ?auto_40170 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_40174 ) ( ON ?auto_40175 ?auto_40174 ) ( ON ?auto_40173 ?auto_40175 ) ( ON ?auto_40172 ?auto_40173 ) ( not ( = ?auto_40174 ?auto_40175 ) ) ( not ( = ?auto_40174 ?auto_40173 ) ) ( not ( = ?auto_40174 ?auto_40172 ) ) ( not ( = ?auto_40174 ?auto_40171 ) ) ( not ( = ?auto_40174 ?auto_40170 ) ) ( not ( = ?auto_40175 ?auto_40173 ) ) ( not ( = ?auto_40175 ?auto_40172 ) ) ( not ( = ?auto_40175 ?auto_40171 ) ) ( not ( = ?auto_40175 ?auto_40170 ) ) ( not ( = ?auto_40173 ?auto_40172 ) ) ( not ( = ?auto_40173 ?auto_40171 ) ) ( not ( = ?auto_40173 ?auto_40170 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_40174 ?auto_40175 ?auto_40173 ?auto_40172 ?auto_40171 )
      ( MAKE-2PILE ?auto_40170 ?auto_40171 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_40176 - BLOCK
      ?auto_40177 - BLOCK
    )
    :vars
    (
      ?auto_40180 - BLOCK
      ?auto_40179 - BLOCK
      ?auto_40178 - BLOCK
      ?auto_40181 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_40176 ?auto_40177 ) ) ( ON ?auto_40177 ?auto_40180 ) ( not ( = ?auto_40176 ?auto_40180 ) ) ( not ( = ?auto_40177 ?auto_40180 ) ) ( ON-TABLE ?auto_40179 ) ( ON ?auto_40178 ?auto_40179 ) ( ON ?auto_40181 ?auto_40178 ) ( ON ?auto_40180 ?auto_40181 ) ( not ( = ?auto_40179 ?auto_40178 ) ) ( not ( = ?auto_40179 ?auto_40181 ) ) ( not ( = ?auto_40179 ?auto_40180 ) ) ( not ( = ?auto_40179 ?auto_40177 ) ) ( not ( = ?auto_40179 ?auto_40176 ) ) ( not ( = ?auto_40178 ?auto_40181 ) ) ( not ( = ?auto_40178 ?auto_40180 ) ) ( not ( = ?auto_40178 ?auto_40177 ) ) ( not ( = ?auto_40178 ?auto_40176 ) ) ( not ( = ?auto_40181 ?auto_40180 ) ) ( not ( = ?auto_40181 ?auto_40177 ) ) ( not ( = ?auto_40181 ?auto_40176 ) ) ( HOLDING ?auto_40176 ) ( CLEAR ?auto_40177 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_40179 ?auto_40178 ?auto_40181 ?auto_40180 ?auto_40177 ?auto_40176 )
      ( MAKE-2PILE ?auto_40176 ?auto_40177 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_40182 - BLOCK
      ?auto_40183 - BLOCK
    )
    :vars
    (
      ?auto_40185 - BLOCK
      ?auto_40187 - BLOCK
      ?auto_40186 - BLOCK
      ?auto_40184 - BLOCK
      ?auto_40188 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_40182 ?auto_40183 ) ) ( ON ?auto_40183 ?auto_40185 ) ( not ( = ?auto_40182 ?auto_40185 ) ) ( not ( = ?auto_40183 ?auto_40185 ) ) ( ON-TABLE ?auto_40187 ) ( ON ?auto_40186 ?auto_40187 ) ( ON ?auto_40184 ?auto_40186 ) ( ON ?auto_40185 ?auto_40184 ) ( not ( = ?auto_40187 ?auto_40186 ) ) ( not ( = ?auto_40187 ?auto_40184 ) ) ( not ( = ?auto_40187 ?auto_40185 ) ) ( not ( = ?auto_40187 ?auto_40183 ) ) ( not ( = ?auto_40187 ?auto_40182 ) ) ( not ( = ?auto_40186 ?auto_40184 ) ) ( not ( = ?auto_40186 ?auto_40185 ) ) ( not ( = ?auto_40186 ?auto_40183 ) ) ( not ( = ?auto_40186 ?auto_40182 ) ) ( not ( = ?auto_40184 ?auto_40185 ) ) ( not ( = ?auto_40184 ?auto_40183 ) ) ( not ( = ?auto_40184 ?auto_40182 ) ) ( CLEAR ?auto_40183 ) ( ON ?auto_40182 ?auto_40188 ) ( CLEAR ?auto_40182 ) ( HAND-EMPTY ) ( not ( = ?auto_40182 ?auto_40188 ) ) ( not ( = ?auto_40183 ?auto_40188 ) ) ( not ( = ?auto_40185 ?auto_40188 ) ) ( not ( = ?auto_40187 ?auto_40188 ) ) ( not ( = ?auto_40186 ?auto_40188 ) ) ( not ( = ?auto_40184 ?auto_40188 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_40182 ?auto_40188 )
      ( MAKE-2PILE ?auto_40182 ?auto_40183 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_40189 - BLOCK
      ?auto_40190 - BLOCK
    )
    :vars
    (
      ?auto_40194 - BLOCK
      ?auto_40195 - BLOCK
      ?auto_40192 - BLOCK
      ?auto_40193 - BLOCK
      ?auto_40191 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_40189 ?auto_40190 ) ) ( not ( = ?auto_40189 ?auto_40194 ) ) ( not ( = ?auto_40190 ?auto_40194 ) ) ( ON-TABLE ?auto_40195 ) ( ON ?auto_40192 ?auto_40195 ) ( ON ?auto_40193 ?auto_40192 ) ( ON ?auto_40194 ?auto_40193 ) ( not ( = ?auto_40195 ?auto_40192 ) ) ( not ( = ?auto_40195 ?auto_40193 ) ) ( not ( = ?auto_40195 ?auto_40194 ) ) ( not ( = ?auto_40195 ?auto_40190 ) ) ( not ( = ?auto_40195 ?auto_40189 ) ) ( not ( = ?auto_40192 ?auto_40193 ) ) ( not ( = ?auto_40192 ?auto_40194 ) ) ( not ( = ?auto_40192 ?auto_40190 ) ) ( not ( = ?auto_40192 ?auto_40189 ) ) ( not ( = ?auto_40193 ?auto_40194 ) ) ( not ( = ?auto_40193 ?auto_40190 ) ) ( not ( = ?auto_40193 ?auto_40189 ) ) ( ON ?auto_40189 ?auto_40191 ) ( CLEAR ?auto_40189 ) ( not ( = ?auto_40189 ?auto_40191 ) ) ( not ( = ?auto_40190 ?auto_40191 ) ) ( not ( = ?auto_40194 ?auto_40191 ) ) ( not ( = ?auto_40195 ?auto_40191 ) ) ( not ( = ?auto_40192 ?auto_40191 ) ) ( not ( = ?auto_40193 ?auto_40191 ) ) ( HOLDING ?auto_40190 ) ( CLEAR ?auto_40194 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_40195 ?auto_40192 ?auto_40193 ?auto_40194 ?auto_40190 )
      ( MAKE-2PILE ?auto_40189 ?auto_40190 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_40196 - BLOCK
      ?auto_40197 - BLOCK
    )
    :vars
    (
      ?auto_40202 - BLOCK
      ?auto_40200 - BLOCK
      ?auto_40198 - BLOCK
      ?auto_40201 - BLOCK
      ?auto_40199 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_40196 ?auto_40197 ) ) ( not ( = ?auto_40196 ?auto_40202 ) ) ( not ( = ?auto_40197 ?auto_40202 ) ) ( ON-TABLE ?auto_40200 ) ( ON ?auto_40198 ?auto_40200 ) ( ON ?auto_40201 ?auto_40198 ) ( ON ?auto_40202 ?auto_40201 ) ( not ( = ?auto_40200 ?auto_40198 ) ) ( not ( = ?auto_40200 ?auto_40201 ) ) ( not ( = ?auto_40200 ?auto_40202 ) ) ( not ( = ?auto_40200 ?auto_40197 ) ) ( not ( = ?auto_40200 ?auto_40196 ) ) ( not ( = ?auto_40198 ?auto_40201 ) ) ( not ( = ?auto_40198 ?auto_40202 ) ) ( not ( = ?auto_40198 ?auto_40197 ) ) ( not ( = ?auto_40198 ?auto_40196 ) ) ( not ( = ?auto_40201 ?auto_40202 ) ) ( not ( = ?auto_40201 ?auto_40197 ) ) ( not ( = ?auto_40201 ?auto_40196 ) ) ( ON ?auto_40196 ?auto_40199 ) ( not ( = ?auto_40196 ?auto_40199 ) ) ( not ( = ?auto_40197 ?auto_40199 ) ) ( not ( = ?auto_40202 ?auto_40199 ) ) ( not ( = ?auto_40200 ?auto_40199 ) ) ( not ( = ?auto_40198 ?auto_40199 ) ) ( not ( = ?auto_40201 ?auto_40199 ) ) ( CLEAR ?auto_40202 ) ( ON ?auto_40197 ?auto_40196 ) ( CLEAR ?auto_40197 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_40199 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_40199 ?auto_40196 )
      ( MAKE-2PILE ?auto_40196 ?auto_40197 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_40203 - BLOCK
      ?auto_40204 - BLOCK
    )
    :vars
    (
      ?auto_40207 - BLOCK
      ?auto_40208 - BLOCK
      ?auto_40209 - BLOCK
      ?auto_40205 - BLOCK
      ?auto_40206 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_40203 ?auto_40204 ) ) ( not ( = ?auto_40203 ?auto_40207 ) ) ( not ( = ?auto_40204 ?auto_40207 ) ) ( ON-TABLE ?auto_40208 ) ( ON ?auto_40209 ?auto_40208 ) ( ON ?auto_40205 ?auto_40209 ) ( not ( = ?auto_40208 ?auto_40209 ) ) ( not ( = ?auto_40208 ?auto_40205 ) ) ( not ( = ?auto_40208 ?auto_40207 ) ) ( not ( = ?auto_40208 ?auto_40204 ) ) ( not ( = ?auto_40208 ?auto_40203 ) ) ( not ( = ?auto_40209 ?auto_40205 ) ) ( not ( = ?auto_40209 ?auto_40207 ) ) ( not ( = ?auto_40209 ?auto_40204 ) ) ( not ( = ?auto_40209 ?auto_40203 ) ) ( not ( = ?auto_40205 ?auto_40207 ) ) ( not ( = ?auto_40205 ?auto_40204 ) ) ( not ( = ?auto_40205 ?auto_40203 ) ) ( ON ?auto_40203 ?auto_40206 ) ( not ( = ?auto_40203 ?auto_40206 ) ) ( not ( = ?auto_40204 ?auto_40206 ) ) ( not ( = ?auto_40207 ?auto_40206 ) ) ( not ( = ?auto_40208 ?auto_40206 ) ) ( not ( = ?auto_40209 ?auto_40206 ) ) ( not ( = ?auto_40205 ?auto_40206 ) ) ( ON ?auto_40204 ?auto_40203 ) ( CLEAR ?auto_40204 ) ( ON-TABLE ?auto_40206 ) ( HOLDING ?auto_40207 ) ( CLEAR ?auto_40205 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_40208 ?auto_40209 ?auto_40205 ?auto_40207 )
      ( MAKE-2PILE ?auto_40203 ?auto_40204 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_40210 - BLOCK
      ?auto_40211 - BLOCK
    )
    :vars
    (
      ?auto_40212 - BLOCK
      ?auto_40214 - BLOCK
      ?auto_40216 - BLOCK
      ?auto_40213 - BLOCK
      ?auto_40215 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_40210 ?auto_40211 ) ) ( not ( = ?auto_40210 ?auto_40212 ) ) ( not ( = ?auto_40211 ?auto_40212 ) ) ( ON-TABLE ?auto_40214 ) ( ON ?auto_40216 ?auto_40214 ) ( ON ?auto_40213 ?auto_40216 ) ( not ( = ?auto_40214 ?auto_40216 ) ) ( not ( = ?auto_40214 ?auto_40213 ) ) ( not ( = ?auto_40214 ?auto_40212 ) ) ( not ( = ?auto_40214 ?auto_40211 ) ) ( not ( = ?auto_40214 ?auto_40210 ) ) ( not ( = ?auto_40216 ?auto_40213 ) ) ( not ( = ?auto_40216 ?auto_40212 ) ) ( not ( = ?auto_40216 ?auto_40211 ) ) ( not ( = ?auto_40216 ?auto_40210 ) ) ( not ( = ?auto_40213 ?auto_40212 ) ) ( not ( = ?auto_40213 ?auto_40211 ) ) ( not ( = ?auto_40213 ?auto_40210 ) ) ( ON ?auto_40210 ?auto_40215 ) ( not ( = ?auto_40210 ?auto_40215 ) ) ( not ( = ?auto_40211 ?auto_40215 ) ) ( not ( = ?auto_40212 ?auto_40215 ) ) ( not ( = ?auto_40214 ?auto_40215 ) ) ( not ( = ?auto_40216 ?auto_40215 ) ) ( not ( = ?auto_40213 ?auto_40215 ) ) ( ON ?auto_40211 ?auto_40210 ) ( ON-TABLE ?auto_40215 ) ( CLEAR ?auto_40213 ) ( ON ?auto_40212 ?auto_40211 ) ( CLEAR ?auto_40212 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_40215 ?auto_40210 ?auto_40211 )
      ( MAKE-2PILE ?auto_40210 ?auto_40211 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_40217 - BLOCK
      ?auto_40218 - BLOCK
    )
    :vars
    (
      ?auto_40222 - BLOCK
      ?auto_40220 - BLOCK
      ?auto_40221 - BLOCK
      ?auto_40223 - BLOCK
      ?auto_40219 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_40217 ?auto_40218 ) ) ( not ( = ?auto_40217 ?auto_40222 ) ) ( not ( = ?auto_40218 ?auto_40222 ) ) ( ON-TABLE ?auto_40220 ) ( ON ?auto_40221 ?auto_40220 ) ( not ( = ?auto_40220 ?auto_40221 ) ) ( not ( = ?auto_40220 ?auto_40223 ) ) ( not ( = ?auto_40220 ?auto_40222 ) ) ( not ( = ?auto_40220 ?auto_40218 ) ) ( not ( = ?auto_40220 ?auto_40217 ) ) ( not ( = ?auto_40221 ?auto_40223 ) ) ( not ( = ?auto_40221 ?auto_40222 ) ) ( not ( = ?auto_40221 ?auto_40218 ) ) ( not ( = ?auto_40221 ?auto_40217 ) ) ( not ( = ?auto_40223 ?auto_40222 ) ) ( not ( = ?auto_40223 ?auto_40218 ) ) ( not ( = ?auto_40223 ?auto_40217 ) ) ( ON ?auto_40217 ?auto_40219 ) ( not ( = ?auto_40217 ?auto_40219 ) ) ( not ( = ?auto_40218 ?auto_40219 ) ) ( not ( = ?auto_40222 ?auto_40219 ) ) ( not ( = ?auto_40220 ?auto_40219 ) ) ( not ( = ?auto_40221 ?auto_40219 ) ) ( not ( = ?auto_40223 ?auto_40219 ) ) ( ON ?auto_40218 ?auto_40217 ) ( ON-TABLE ?auto_40219 ) ( ON ?auto_40222 ?auto_40218 ) ( CLEAR ?auto_40222 ) ( HOLDING ?auto_40223 ) ( CLEAR ?auto_40221 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_40220 ?auto_40221 ?auto_40223 )
      ( MAKE-2PILE ?auto_40217 ?auto_40218 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_40224 - BLOCK
      ?auto_40225 - BLOCK
    )
    :vars
    (
      ?auto_40227 - BLOCK
      ?auto_40229 - BLOCK
      ?auto_40230 - BLOCK
      ?auto_40226 - BLOCK
      ?auto_40228 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_40224 ?auto_40225 ) ) ( not ( = ?auto_40224 ?auto_40227 ) ) ( not ( = ?auto_40225 ?auto_40227 ) ) ( ON-TABLE ?auto_40229 ) ( ON ?auto_40230 ?auto_40229 ) ( not ( = ?auto_40229 ?auto_40230 ) ) ( not ( = ?auto_40229 ?auto_40226 ) ) ( not ( = ?auto_40229 ?auto_40227 ) ) ( not ( = ?auto_40229 ?auto_40225 ) ) ( not ( = ?auto_40229 ?auto_40224 ) ) ( not ( = ?auto_40230 ?auto_40226 ) ) ( not ( = ?auto_40230 ?auto_40227 ) ) ( not ( = ?auto_40230 ?auto_40225 ) ) ( not ( = ?auto_40230 ?auto_40224 ) ) ( not ( = ?auto_40226 ?auto_40227 ) ) ( not ( = ?auto_40226 ?auto_40225 ) ) ( not ( = ?auto_40226 ?auto_40224 ) ) ( ON ?auto_40224 ?auto_40228 ) ( not ( = ?auto_40224 ?auto_40228 ) ) ( not ( = ?auto_40225 ?auto_40228 ) ) ( not ( = ?auto_40227 ?auto_40228 ) ) ( not ( = ?auto_40229 ?auto_40228 ) ) ( not ( = ?auto_40230 ?auto_40228 ) ) ( not ( = ?auto_40226 ?auto_40228 ) ) ( ON ?auto_40225 ?auto_40224 ) ( ON-TABLE ?auto_40228 ) ( ON ?auto_40227 ?auto_40225 ) ( CLEAR ?auto_40230 ) ( ON ?auto_40226 ?auto_40227 ) ( CLEAR ?auto_40226 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_40228 ?auto_40224 ?auto_40225 ?auto_40227 )
      ( MAKE-2PILE ?auto_40224 ?auto_40225 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_40231 - BLOCK
      ?auto_40232 - BLOCK
    )
    :vars
    (
      ?auto_40233 - BLOCK
      ?auto_40234 - BLOCK
      ?auto_40236 - BLOCK
      ?auto_40235 - BLOCK
      ?auto_40237 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_40231 ?auto_40232 ) ) ( not ( = ?auto_40231 ?auto_40233 ) ) ( not ( = ?auto_40232 ?auto_40233 ) ) ( ON-TABLE ?auto_40234 ) ( not ( = ?auto_40234 ?auto_40236 ) ) ( not ( = ?auto_40234 ?auto_40235 ) ) ( not ( = ?auto_40234 ?auto_40233 ) ) ( not ( = ?auto_40234 ?auto_40232 ) ) ( not ( = ?auto_40234 ?auto_40231 ) ) ( not ( = ?auto_40236 ?auto_40235 ) ) ( not ( = ?auto_40236 ?auto_40233 ) ) ( not ( = ?auto_40236 ?auto_40232 ) ) ( not ( = ?auto_40236 ?auto_40231 ) ) ( not ( = ?auto_40235 ?auto_40233 ) ) ( not ( = ?auto_40235 ?auto_40232 ) ) ( not ( = ?auto_40235 ?auto_40231 ) ) ( ON ?auto_40231 ?auto_40237 ) ( not ( = ?auto_40231 ?auto_40237 ) ) ( not ( = ?auto_40232 ?auto_40237 ) ) ( not ( = ?auto_40233 ?auto_40237 ) ) ( not ( = ?auto_40234 ?auto_40237 ) ) ( not ( = ?auto_40236 ?auto_40237 ) ) ( not ( = ?auto_40235 ?auto_40237 ) ) ( ON ?auto_40232 ?auto_40231 ) ( ON-TABLE ?auto_40237 ) ( ON ?auto_40233 ?auto_40232 ) ( ON ?auto_40235 ?auto_40233 ) ( CLEAR ?auto_40235 ) ( HOLDING ?auto_40236 ) ( CLEAR ?auto_40234 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_40234 ?auto_40236 )
      ( MAKE-2PILE ?auto_40231 ?auto_40232 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_40238 - BLOCK
      ?auto_40239 - BLOCK
    )
    :vars
    (
      ?auto_40241 - BLOCK
      ?auto_40244 - BLOCK
      ?auto_40242 - BLOCK
      ?auto_40240 - BLOCK
      ?auto_40243 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_40238 ?auto_40239 ) ) ( not ( = ?auto_40238 ?auto_40241 ) ) ( not ( = ?auto_40239 ?auto_40241 ) ) ( ON-TABLE ?auto_40244 ) ( not ( = ?auto_40244 ?auto_40242 ) ) ( not ( = ?auto_40244 ?auto_40240 ) ) ( not ( = ?auto_40244 ?auto_40241 ) ) ( not ( = ?auto_40244 ?auto_40239 ) ) ( not ( = ?auto_40244 ?auto_40238 ) ) ( not ( = ?auto_40242 ?auto_40240 ) ) ( not ( = ?auto_40242 ?auto_40241 ) ) ( not ( = ?auto_40242 ?auto_40239 ) ) ( not ( = ?auto_40242 ?auto_40238 ) ) ( not ( = ?auto_40240 ?auto_40241 ) ) ( not ( = ?auto_40240 ?auto_40239 ) ) ( not ( = ?auto_40240 ?auto_40238 ) ) ( ON ?auto_40238 ?auto_40243 ) ( not ( = ?auto_40238 ?auto_40243 ) ) ( not ( = ?auto_40239 ?auto_40243 ) ) ( not ( = ?auto_40241 ?auto_40243 ) ) ( not ( = ?auto_40244 ?auto_40243 ) ) ( not ( = ?auto_40242 ?auto_40243 ) ) ( not ( = ?auto_40240 ?auto_40243 ) ) ( ON ?auto_40239 ?auto_40238 ) ( ON-TABLE ?auto_40243 ) ( ON ?auto_40241 ?auto_40239 ) ( ON ?auto_40240 ?auto_40241 ) ( CLEAR ?auto_40244 ) ( ON ?auto_40242 ?auto_40240 ) ( CLEAR ?auto_40242 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_40243 ?auto_40238 ?auto_40239 ?auto_40241 ?auto_40240 )
      ( MAKE-2PILE ?auto_40238 ?auto_40239 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_40245 - BLOCK
      ?auto_40246 - BLOCK
    )
    :vars
    (
      ?auto_40248 - BLOCK
      ?auto_40249 - BLOCK
      ?auto_40251 - BLOCK
      ?auto_40247 - BLOCK
      ?auto_40250 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_40245 ?auto_40246 ) ) ( not ( = ?auto_40245 ?auto_40248 ) ) ( not ( = ?auto_40246 ?auto_40248 ) ) ( not ( = ?auto_40249 ?auto_40251 ) ) ( not ( = ?auto_40249 ?auto_40247 ) ) ( not ( = ?auto_40249 ?auto_40248 ) ) ( not ( = ?auto_40249 ?auto_40246 ) ) ( not ( = ?auto_40249 ?auto_40245 ) ) ( not ( = ?auto_40251 ?auto_40247 ) ) ( not ( = ?auto_40251 ?auto_40248 ) ) ( not ( = ?auto_40251 ?auto_40246 ) ) ( not ( = ?auto_40251 ?auto_40245 ) ) ( not ( = ?auto_40247 ?auto_40248 ) ) ( not ( = ?auto_40247 ?auto_40246 ) ) ( not ( = ?auto_40247 ?auto_40245 ) ) ( ON ?auto_40245 ?auto_40250 ) ( not ( = ?auto_40245 ?auto_40250 ) ) ( not ( = ?auto_40246 ?auto_40250 ) ) ( not ( = ?auto_40248 ?auto_40250 ) ) ( not ( = ?auto_40249 ?auto_40250 ) ) ( not ( = ?auto_40251 ?auto_40250 ) ) ( not ( = ?auto_40247 ?auto_40250 ) ) ( ON ?auto_40246 ?auto_40245 ) ( ON-TABLE ?auto_40250 ) ( ON ?auto_40248 ?auto_40246 ) ( ON ?auto_40247 ?auto_40248 ) ( ON ?auto_40251 ?auto_40247 ) ( CLEAR ?auto_40251 ) ( HOLDING ?auto_40249 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_40249 )
      ( MAKE-2PILE ?auto_40245 ?auto_40246 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_40252 - BLOCK
      ?auto_40253 - BLOCK
    )
    :vars
    (
      ?auto_40256 - BLOCK
      ?auto_40257 - BLOCK
      ?auto_40258 - BLOCK
      ?auto_40255 - BLOCK
      ?auto_40254 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_40252 ?auto_40253 ) ) ( not ( = ?auto_40252 ?auto_40256 ) ) ( not ( = ?auto_40253 ?auto_40256 ) ) ( not ( = ?auto_40257 ?auto_40258 ) ) ( not ( = ?auto_40257 ?auto_40255 ) ) ( not ( = ?auto_40257 ?auto_40256 ) ) ( not ( = ?auto_40257 ?auto_40253 ) ) ( not ( = ?auto_40257 ?auto_40252 ) ) ( not ( = ?auto_40258 ?auto_40255 ) ) ( not ( = ?auto_40258 ?auto_40256 ) ) ( not ( = ?auto_40258 ?auto_40253 ) ) ( not ( = ?auto_40258 ?auto_40252 ) ) ( not ( = ?auto_40255 ?auto_40256 ) ) ( not ( = ?auto_40255 ?auto_40253 ) ) ( not ( = ?auto_40255 ?auto_40252 ) ) ( ON ?auto_40252 ?auto_40254 ) ( not ( = ?auto_40252 ?auto_40254 ) ) ( not ( = ?auto_40253 ?auto_40254 ) ) ( not ( = ?auto_40256 ?auto_40254 ) ) ( not ( = ?auto_40257 ?auto_40254 ) ) ( not ( = ?auto_40258 ?auto_40254 ) ) ( not ( = ?auto_40255 ?auto_40254 ) ) ( ON ?auto_40253 ?auto_40252 ) ( ON-TABLE ?auto_40254 ) ( ON ?auto_40256 ?auto_40253 ) ( ON ?auto_40255 ?auto_40256 ) ( ON ?auto_40258 ?auto_40255 ) ( ON ?auto_40257 ?auto_40258 ) ( CLEAR ?auto_40257 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_40254 ?auto_40252 ?auto_40253 ?auto_40256 ?auto_40255 ?auto_40258 )
      ( MAKE-2PILE ?auto_40252 ?auto_40253 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_40262 - BLOCK
      ?auto_40263 - BLOCK
      ?auto_40264 - BLOCK
    )
    :vars
    (
      ?auto_40265 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_40265 ?auto_40264 ) ( CLEAR ?auto_40265 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_40262 ) ( ON ?auto_40263 ?auto_40262 ) ( ON ?auto_40264 ?auto_40263 ) ( not ( = ?auto_40262 ?auto_40263 ) ) ( not ( = ?auto_40262 ?auto_40264 ) ) ( not ( = ?auto_40262 ?auto_40265 ) ) ( not ( = ?auto_40263 ?auto_40264 ) ) ( not ( = ?auto_40263 ?auto_40265 ) ) ( not ( = ?auto_40264 ?auto_40265 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_40265 ?auto_40264 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_40266 - BLOCK
      ?auto_40267 - BLOCK
      ?auto_40268 - BLOCK
    )
    :vars
    (
      ?auto_40269 - BLOCK
      ?auto_40270 - BLOCK
      ?auto_40271 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_40269 ?auto_40268 ) ( CLEAR ?auto_40269 ) ( ON-TABLE ?auto_40266 ) ( ON ?auto_40267 ?auto_40266 ) ( ON ?auto_40268 ?auto_40267 ) ( not ( = ?auto_40266 ?auto_40267 ) ) ( not ( = ?auto_40266 ?auto_40268 ) ) ( not ( = ?auto_40266 ?auto_40269 ) ) ( not ( = ?auto_40267 ?auto_40268 ) ) ( not ( = ?auto_40267 ?auto_40269 ) ) ( not ( = ?auto_40268 ?auto_40269 ) ) ( HOLDING ?auto_40270 ) ( CLEAR ?auto_40271 ) ( not ( = ?auto_40266 ?auto_40270 ) ) ( not ( = ?auto_40266 ?auto_40271 ) ) ( not ( = ?auto_40267 ?auto_40270 ) ) ( not ( = ?auto_40267 ?auto_40271 ) ) ( not ( = ?auto_40268 ?auto_40270 ) ) ( not ( = ?auto_40268 ?auto_40271 ) ) ( not ( = ?auto_40269 ?auto_40270 ) ) ( not ( = ?auto_40269 ?auto_40271 ) ) ( not ( = ?auto_40270 ?auto_40271 ) ) )
    :subtasks
    ( ( !STACK ?auto_40270 ?auto_40271 )
      ( MAKE-3PILE ?auto_40266 ?auto_40267 ?auto_40268 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_40272 - BLOCK
      ?auto_40273 - BLOCK
      ?auto_40274 - BLOCK
    )
    :vars
    (
      ?auto_40275 - BLOCK
      ?auto_40276 - BLOCK
      ?auto_40277 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_40275 ?auto_40274 ) ( ON-TABLE ?auto_40272 ) ( ON ?auto_40273 ?auto_40272 ) ( ON ?auto_40274 ?auto_40273 ) ( not ( = ?auto_40272 ?auto_40273 ) ) ( not ( = ?auto_40272 ?auto_40274 ) ) ( not ( = ?auto_40272 ?auto_40275 ) ) ( not ( = ?auto_40273 ?auto_40274 ) ) ( not ( = ?auto_40273 ?auto_40275 ) ) ( not ( = ?auto_40274 ?auto_40275 ) ) ( CLEAR ?auto_40276 ) ( not ( = ?auto_40272 ?auto_40277 ) ) ( not ( = ?auto_40272 ?auto_40276 ) ) ( not ( = ?auto_40273 ?auto_40277 ) ) ( not ( = ?auto_40273 ?auto_40276 ) ) ( not ( = ?auto_40274 ?auto_40277 ) ) ( not ( = ?auto_40274 ?auto_40276 ) ) ( not ( = ?auto_40275 ?auto_40277 ) ) ( not ( = ?auto_40275 ?auto_40276 ) ) ( not ( = ?auto_40277 ?auto_40276 ) ) ( ON ?auto_40277 ?auto_40275 ) ( CLEAR ?auto_40277 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_40272 ?auto_40273 ?auto_40274 ?auto_40275 )
      ( MAKE-3PILE ?auto_40272 ?auto_40273 ?auto_40274 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_40278 - BLOCK
      ?auto_40279 - BLOCK
      ?auto_40280 - BLOCK
    )
    :vars
    (
      ?auto_40283 - BLOCK
      ?auto_40282 - BLOCK
      ?auto_40281 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_40283 ?auto_40280 ) ( ON-TABLE ?auto_40278 ) ( ON ?auto_40279 ?auto_40278 ) ( ON ?auto_40280 ?auto_40279 ) ( not ( = ?auto_40278 ?auto_40279 ) ) ( not ( = ?auto_40278 ?auto_40280 ) ) ( not ( = ?auto_40278 ?auto_40283 ) ) ( not ( = ?auto_40279 ?auto_40280 ) ) ( not ( = ?auto_40279 ?auto_40283 ) ) ( not ( = ?auto_40280 ?auto_40283 ) ) ( not ( = ?auto_40278 ?auto_40282 ) ) ( not ( = ?auto_40278 ?auto_40281 ) ) ( not ( = ?auto_40279 ?auto_40282 ) ) ( not ( = ?auto_40279 ?auto_40281 ) ) ( not ( = ?auto_40280 ?auto_40282 ) ) ( not ( = ?auto_40280 ?auto_40281 ) ) ( not ( = ?auto_40283 ?auto_40282 ) ) ( not ( = ?auto_40283 ?auto_40281 ) ) ( not ( = ?auto_40282 ?auto_40281 ) ) ( ON ?auto_40282 ?auto_40283 ) ( CLEAR ?auto_40282 ) ( HOLDING ?auto_40281 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_40281 )
      ( MAKE-3PILE ?auto_40278 ?auto_40279 ?auto_40280 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_40284 - BLOCK
      ?auto_40285 - BLOCK
      ?auto_40286 - BLOCK
    )
    :vars
    (
      ?auto_40289 - BLOCK
      ?auto_40288 - BLOCK
      ?auto_40287 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_40289 ?auto_40286 ) ( ON-TABLE ?auto_40284 ) ( ON ?auto_40285 ?auto_40284 ) ( ON ?auto_40286 ?auto_40285 ) ( not ( = ?auto_40284 ?auto_40285 ) ) ( not ( = ?auto_40284 ?auto_40286 ) ) ( not ( = ?auto_40284 ?auto_40289 ) ) ( not ( = ?auto_40285 ?auto_40286 ) ) ( not ( = ?auto_40285 ?auto_40289 ) ) ( not ( = ?auto_40286 ?auto_40289 ) ) ( not ( = ?auto_40284 ?auto_40288 ) ) ( not ( = ?auto_40284 ?auto_40287 ) ) ( not ( = ?auto_40285 ?auto_40288 ) ) ( not ( = ?auto_40285 ?auto_40287 ) ) ( not ( = ?auto_40286 ?auto_40288 ) ) ( not ( = ?auto_40286 ?auto_40287 ) ) ( not ( = ?auto_40289 ?auto_40288 ) ) ( not ( = ?auto_40289 ?auto_40287 ) ) ( not ( = ?auto_40288 ?auto_40287 ) ) ( ON ?auto_40288 ?auto_40289 ) ( ON ?auto_40287 ?auto_40288 ) ( CLEAR ?auto_40287 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_40284 ?auto_40285 ?auto_40286 ?auto_40289 ?auto_40288 )
      ( MAKE-3PILE ?auto_40284 ?auto_40285 ?auto_40286 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_40290 - BLOCK
      ?auto_40291 - BLOCK
      ?auto_40292 - BLOCK
    )
    :vars
    (
      ?auto_40295 - BLOCK
      ?auto_40293 - BLOCK
      ?auto_40294 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_40295 ?auto_40292 ) ( ON-TABLE ?auto_40290 ) ( ON ?auto_40291 ?auto_40290 ) ( ON ?auto_40292 ?auto_40291 ) ( not ( = ?auto_40290 ?auto_40291 ) ) ( not ( = ?auto_40290 ?auto_40292 ) ) ( not ( = ?auto_40290 ?auto_40295 ) ) ( not ( = ?auto_40291 ?auto_40292 ) ) ( not ( = ?auto_40291 ?auto_40295 ) ) ( not ( = ?auto_40292 ?auto_40295 ) ) ( not ( = ?auto_40290 ?auto_40293 ) ) ( not ( = ?auto_40290 ?auto_40294 ) ) ( not ( = ?auto_40291 ?auto_40293 ) ) ( not ( = ?auto_40291 ?auto_40294 ) ) ( not ( = ?auto_40292 ?auto_40293 ) ) ( not ( = ?auto_40292 ?auto_40294 ) ) ( not ( = ?auto_40295 ?auto_40293 ) ) ( not ( = ?auto_40295 ?auto_40294 ) ) ( not ( = ?auto_40293 ?auto_40294 ) ) ( ON ?auto_40293 ?auto_40295 ) ( HOLDING ?auto_40294 ) ( CLEAR ?auto_40293 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_40290 ?auto_40291 ?auto_40292 ?auto_40295 ?auto_40293 ?auto_40294 )
      ( MAKE-3PILE ?auto_40290 ?auto_40291 ?auto_40292 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_40296 - BLOCK
      ?auto_40297 - BLOCK
      ?auto_40298 - BLOCK
    )
    :vars
    (
      ?auto_40299 - BLOCK
      ?auto_40300 - BLOCK
      ?auto_40301 - BLOCK
      ?auto_40302 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_40299 ?auto_40298 ) ( ON-TABLE ?auto_40296 ) ( ON ?auto_40297 ?auto_40296 ) ( ON ?auto_40298 ?auto_40297 ) ( not ( = ?auto_40296 ?auto_40297 ) ) ( not ( = ?auto_40296 ?auto_40298 ) ) ( not ( = ?auto_40296 ?auto_40299 ) ) ( not ( = ?auto_40297 ?auto_40298 ) ) ( not ( = ?auto_40297 ?auto_40299 ) ) ( not ( = ?auto_40298 ?auto_40299 ) ) ( not ( = ?auto_40296 ?auto_40300 ) ) ( not ( = ?auto_40296 ?auto_40301 ) ) ( not ( = ?auto_40297 ?auto_40300 ) ) ( not ( = ?auto_40297 ?auto_40301 ) ) ( not ( = ?auto_40298 ?auto_40300 ) ) ( not ( = ?auto_40298 ?auto_40301 ) ) ( not ( = ?auto_40299 ?auto_40300 ) ) ( not ( = ?auto_40299 ?auto_40301 ) ) ( not ( = ?auto_40300 ?auto_40301 ) ) ( ON ?auto_40300 ?auto_40299 ) ( CLEAR ?auto_40300 ) ( ON ?auto_40301 ?auto_40302 ) ( CLEAR ?auto_40301 ) ( HAND-EMPTY ) ( not ( = ?auto_40296 ?auto_40302 ) ) ( not ( = ?auto_40297 ?auto_40302 ) ) ( not ( = ?auto_40298 ?auto_40302 ) ) ( not ( = ?auto_40299 ?auto_40302 ) ) ( not ( = ?auto_40300 ?auto_40302 ) ) ( not ( = ?auto_40301 ?auto_40302 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_40301 ?auto_40302 )
      ( MAKE-3PILE ?auto_40296 ?auto_40297 ?auto_40298 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_40303 - BLOCK
      ?auto_40304 - BLOCK
      ?auto_40305 - BLOCK
    )
    :vars
    (
      ?auto_40307 - BLOCK
      ?auto_40309 - BLOCK
      ?auto_40308 - BLOCK
      ?auto_40306 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_40307 ?auto_40305 ) ( ON-TABLE ?auto_40303 ) ( ON ?auto_40304 ?auto_40303 ) ( ON ?auto_40305 ?auto_40304 ) ( not ( = ?auto_40303 ?auto_40304 ) ) ( not ( = ?auto_40303 ?auto_40305 ) ) ( not ( = ?auto_40303 ?auto_40307 ) ) ( not ( = ?auto_40304 ?auto_40305 ) ) ( not ( = ?auto_40304 ?auto_40307 ) ) ( not ( = ?auto_40305 ?auto_40307 ) ) ( not ( = ?auto_40303 ?auto_40309 ) ) ( not ( = ?auto_40303 ?auto_40308 ) ) ( not ( = ?auto_40304 ?auto_40309 ) ) ( not ( = ?auto_40304 ?auto_40308 ) ) ( not ( = ?auto_40305 ?auto_40309 ) ) ( not ( = ?auto_40305 ?auto_40308 ) ) ( not ( = ?auto_40307 ?auto_40309 ) ) ( not ( = ?auto_40307 ?auto_40308 ) ) ( not ( = ?auto_40309 ?auto_40308 ) ) ( ON ?auto_40308 ?auto_40306 ) ( CLEAR ?auto_40308 ) ( not ( = ?auto_40303 ?auto_40306 ) ) ( not ( = ?auto_40304 ?auto_40306 ) ) ( not ( = ?auto_40305 ?auto_40306 ) ) ( not ( = ?auto_40307 ?auto_40306 ) ) ( not ( = ?auto_40309 ?auto_40306 ) ) ( not ( = ?auto_40308 ?auto_40306 ) ) ( HOLDING ?auto_40309 ) ( CLEAR ?auto_40307 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_40303 ?auto_40304 ?auto_40305 ?auto_40307 ?auto_40309 )
      ( MAKE-3PILE ?auto_40303 ?auto_40304 ?auto_40305 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_40310 - BLOCK
      ?auto_40311 - BLOCK
      ?auto_40312 - BLOCK
    )
    :vars
    (
      ?auto_40315 - BLOCK
      ?auto_40313 - BLOCK
      ?auto_40314 - BLOCK
      ?auto_40316 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_40315 ?auto_40312 ) ( ON-TABLE ?auto_40310 ) ( ON ?auto_40311 ?auto_40310 ) ( ON ?auto_40312 ?auto_40311 ) ( not ( = ?auto_40310 ?auto_40311 ) ) ( not ( = ?auto_40310 ?auto_40312 ) ) ( not ( = ?auto_40310 ?auto_40315 ) ) ( not ( = ?auto_40311 ?auto_40312 ) ) ( not ( = ?auto_40311 ?auto_40315 ) ) ( not ( = ?auto_40312 ?auto_40315 ) ) ( not ( = ?auto_40310 ?auto_40313 ) ) ( not ( = ?auto_40310 ?auto_40314 ) ) ( not ( = ?auto_40311 ?auto_40313 ) ) ( not ( = ?auto_40311 ?auto_40314 ) ) ( not ( = ?auto_40312 ?auto_40313 ) ) ( not ( = ?auto_40312 ?auto_40314 ) ) ( not ( = ?auto_40315 ?auto_40313 ) ) ( not ( = ?auto_40315 ?auto_40314 ) ) ( not ( = ?auto_40313 ?auto_40314 ) ) ( ON ?auto_40314 ?auto_40316 ) ( not ( = ?auto_40310 ?auto_40316 ) ) ( not ( = ?auto_40311 ?auto_40316 ) ) ( not ( = ?auto_40312 ?auto_40316 ) ) ( not ( = ?auto_40315 ?auto_40316 ) ) ( not ( = ?auto_40313 ?auto_40316 ) ) ( not ( = ?auto_40314 ?auto_40316 ) ) ( CLEAR ?auto_40315 ) ( ON ?auto_40313 ?auto_40314 ) ( CLEAR ?auto_40313 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_40316 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_40316 ?auto_40314 )
      ( MAKE-3PILE ?auto_40310 ?auto_40311 ?auto_40312 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_40331 - BLOCK
      ?auto_40332 - BLOCK
      ?auto_40333 - BLOCK
    )
    :vars
    (
      ?auto_40334 - BLOCK
      ?auto_40337 - BLOCK
      ?auto_40335 - BLOCK
      ?auto_40336 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_40331 ) ( ON ?auto_40332 ?auto_40331 ) ( not ( = ?auto_40331 ?auto_40332 ) ) ( not ( = ?auto_40331 ?auto_40333 ) ) ( not ( = ?auto_40331 ?auto_40334 ) ) ( not ( = ?auto_40332 ?auto_40333 ) ) ( not ( = ?auto_40332 ?auto_40334 ) ) ( not ( = ?auto_40333 ?auto_40334 ) ) ( not ( = ?auto_40331 ?auto_40337 ) ) ( not ( = ?auto_40331 ?auto_40335 ) ) ( not ( = ?auto_40332 ?auto_40337 ) ) ( not ( = ?auto_40332 ?auto_40335 ) ) ( not ( = ?auto_40333 ?auto_40337 ) ) ( not ( = ?auto_40333 ?auto_40335 ) ) ( not ( = ?auto_40334 ?auto_40337 ) ) ( not ( = ?auto_40334 ?auto_40335 ) ) ( not ( = ?auto_40337 ?auto_40335 ) ) ( ON ?auto_40335 ?auto_40336 ) ( not ( = ?auto_40331 ?auto_40336 ) ) ( not ( = ?auto_40332 ?auto_40336 ) ) ( not ( = ?auto_40333 ?auto_40336 ) ) ( not ( = ?auto_40334 ?auto_40336 ) ) ( not ( = ?auto_40337 ?auto_40336 ) ) ( not ( = ?auto_40335 ?auto_40336 ) ) ( ON ?auto_40337 ?auto_40335 ) ( ON-TABLE ?auto_40336 ) ( ON ?auto_40334 ?auto_40337 ) ( CLEAR ?auto_40334 ) ( HOLDING ?auto_40333 ) ( CLEAR ?auto_40332 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_40331 ?auto_40332 ?auto_40333 ?auto_40334 )
      ( MAKE-3PILE ?auto_40331 ?auto_40332 ?auto_40333 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_40338 - BLOCK
      ?auto_40339 - BLOCK
      ?auto_40340 - BLOCK
    )
    :vars
    (
      ?auto_40343 - BLOCK
      ?auto_40342 - BLOCK
      ?auto_40341 - BLOCK
      ?auto_40344 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_40338 ) ( ON ?auto_40339 ?auto_40338 ) ( not ( = ?auto_40338 ?auto_40339 ) ) ( not ( = ?auto_40338 ?auto_40340 ) ) ( not ( = ?auto_40338 ?auto_40343 ) ) ( not ( = ?auto_40339 ?auto_40340 ) ) ( not ( = ?auto_40339 ?auto_40343 ) ) ( not ( = ?auto_40340 ?auto_40343 ) ) ( not ( = ?auto_40338 ?auto_40342 ) ) ( not ( = ?auto_40338 ?auto_40341 ) ) ( not ( = ?auto_40339 ?auto_40342 ) ) ( not ( = ?auto_40339 ?auto_40341 ) ) ( not ( = ?auto_40340 ?auto_40342 ) ) ( not ( = ?auto_40340 ?auto_40341 ) ) ( not ( = ?auto_40343 ?auto_40342 ) ) ( not ( = ?auto_40343 ?auto_40341 ) ) ( not ( = ?auto_40342 ?auto_40341 ) ) ( ON ?auto_40341 ?auto_40344 ) ( not ( = ?auto_40338 ?auto_40344 ) ) ( not ( = ?auto_40339 ?auto_40344 ) ) ( not ( = ?auto_40340 ?auto_40344 ) ) ( not ( = ?auto_40343 ?auto_40344 ) ) ( not ( = ?auto_40342 ?auto_40344 ) ) ( not ( = ?auto_40341 ?auto_40344 ) ) ( ON ?auto_40342 ?auto_40341 ) ( ON-TABLE ?auto_40344 ) ( ON ?auto_40343 ?auto_40342 ) ( CLEAR ?auto_40339 ) ( ON ?auto_40340 ?auto_40343 ) ( CLEAR ?auto_40340 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_40344 ?auto_40341 ?auto_40342 ?auto_40343 )
      ( MAKE-3PILE ?auto_40338 ?auto_40339 ?auto_40340 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_40345 - BLOCK
      ?auto_40346 - BLOCK
      ?auto_40347 - BLOCK
    )
    :vars
    (
      ?auto_40348 - BLOCK
      ?auto_40351 - BLOCK
      ?auto_40350 - BLOCK
      ?auto_40349 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_40345 ) ( not ( = ?auto_40345 ?auto_40346 ) ) ( not ( = ?auto_40345 ?auto_40347 ) ) ( not ( = ?auto_40345 ?auto_40348 ) ) ( not ( = ?auto_40346 ?auto_40347 ) ) ( not ( = ?auto_40346 ?auto_40348 ) ) ( not ( = ?auto_40347 ?auto_40348 ) ) ( not ( = ?auto_40345 ?auto_40351 ) ) ( not ( = ?auto_40345 ?auto_40350 ) ) ( not ( = ?auto_40346 ?auto_40351 ) ) ( not ( = ?auto_40346 ?auto_40350 ) ) ( not ( = ?auto_40347 ?auto_40351 ) ) ( not ( = ?auto_40347 ?auto_40350 ) ) ( not ( = ?auto_40348 ?auto_40351 ) ) ( not ( = ?auto_40348 ?auto_40350 ) ) ( not ( = ?auto_40351 ?auto_40350 ) ) ( ON ?auto_40350 ?auto_40349 ) ( not ( = ?auto_40345 ?auto_40349 ) ) ( not ( = ?auto_40346 ?auto_40349 ) ) ( not ( = ?auto_40347 ?auto_40349 ) ) ( not ( = ?auto_40348 ?auto_40349 ) ) ( not ( = ?auto_40351 ?auto_40349 ) ) ( not ( = ?auto_40350 ?auto_40349 ) ) ( ON ?auto_40351 ?auto_40350 ) ( ON-TABLE ?auto_40349 ) ( ON ?auto_40348 ?auto_40351 ) ( ON ?auto_40347 ?auto_40348 ) ( CLEAR ?auto_40347 ) ( HOLDING ?auto_40346 ) ( CLEAR ?auto_40345 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_40345 ?auto_40346 )
      ( MAKE-3PILE ?auto_40345 ?auto_40346 ?auto_40347 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_40352 - BLOCK
      ?auto_40353 - BLOCK
      ?auto_40354 - BLOCK
    )
    :vars
    (
      ?auto_40357 - BLOCK
      ?auto_40355 - BLOCK
      ?auto_40356 - BLOCK
      ?auto_40358 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_40352 ) ( not ( = ?auto_40352 ?auto_40353 ) ) ( not ( = ?auto_40352 ?auto_40354 ) ) ( not ( = ?auto_40352 ?auto_40357 ) ) ( not ( = ?auto_40353 ?auto_40354 ) ) ( not ( = ?auto_40353 ?auto_40357 ) ) ( not ( = ?auto_40354 ?auto_40357 ) ) ( not ( = ?auto_40352 ?auto_40355 ) ) ( not ( = ?auto_40352 ?auto_40356 ) ) ( not ( = ?auto_40353 ?auto_40355 ) ) ( not ( = ?auto_40353 ?auto_40356 ) ) ( not ( = ?auto_40354 ?auto_40355 ) ) ( not ( = ?auto_40354 ?auto_40356 ) ) ( not ( = ?auto_40357 ?auto_40355 ) ) ( not ( = ?auto_40357 ?auto_40356 ) ) ( not ( = ?auto_40355 ?auto_40356 ) ) ( ON ?auto_40356 ?auto_40358 ) ( not ( = ?auto_40352 ?auto_40358 ) ) ( not ( = ?auto_40353 ?auto_40358 ) ) ( not ( = ?auto_40354 ?auto_40358 ) ) ( not ( = ?auto_40357 ?auto_40358 ) ) ( not ( = ?auto_40355 ?auto_40358 ) ) ( not ( = ?auto_40356 ?auto_40358 ) ) ( ON ?auto_40355 ?auto_40356 ) ( ON-TABLE ?auto_40358 ) ( ON ?auto_40357 ?auto_40355 ) ( ON ?auto_40354 ?auto_40357 ) ( CLEAR ?auto_40352 ) ( ON ?auto_40353 ?auto_40354 ) ( CLEAR ?auto_40353 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_40358 ?auto_40356 ?auto_40355 ?auto_40357 ?auto_40354 )
      ( MAKE-3PILE ?auto_40352 ?auto_40353 ?auto_40354 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_40359 - BLOCK
      ?auto_40360 - BLOCK
      ?auto_40361 - BLOCK
    )
    :vars
    (
      ?auto_40365 - BLOCK
      ?auto_40363 - BLOCK
      ?auto_40362 - BLOCK
      ?auto_40364 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_40359 ?auto_40360 ) ) ( not ( = ?auto_40359 ?auto_40361 ) ) ( not ( = ?auto_40359 ?auto_40365 ) ) ( not ( = ?auto_40360 ?auto_40361 ) ) ( not ( = ?auto_40360 ?auto_40365 ) ) ( not ( = ?auto_40361 ?auto_40365 ) ) ( not ( = ?auto_40359 ?auto_40363 ) ) ( not ( = ?auto_40359 ?auto_40362 ) ) ( not ( = ?auto_40360 ?auto_40363 ) ) ( not ( = ?auto_40360 ?auto_40362 ) ) ( not ( = ?auto_40361 ?auto_40363 ) ) ( not ( = ?auto_40361 ?auto_40362 ) ) ( not ( = ?auto_40365 ?auto_40363 ) ) ( not ( = ?auto_40365 ?auto_40362 ) ) ( not ( = ?auto_40363 ?auto_40362 ) ) ( ON ?auto_40362 ?auto_40364 ) ( not ( = ?auto_40359 ?auto_40364 ) ) ( not ( = ?auto_40360 ?auto_40364 ) ) ( not ( = ?auto_40361 ?auto_40364 ) ) ( not ( = ?auto_40365 ?auto_40364 ) ) ( not ( = ?auto_40363 ?auto_40364 ) ) ( not ( = ?auto_40362 ?auto_40364 ) ) ( ON ?auto_40363 ?auto_40362 ) ( ON-TABLE ?auto_40364 ) ( ON ?auto_40365 ?auto_40363 ) ( ON ?auto_40361 ?auto_40365 ) ( ON ?auto_40360 ?auto_40361 ) ( CLEAR ?auto_40360 ) ( HOLDING ?auto_40359 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_40359 )
      ( MAKE-3PILE ?auto_40359 ?auto_40360 ?auto_40361 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_40366 - BLOCK
      ?auto_40367 - BLOCK
      ?auto_40368 - BLOCK
    )
    :vars
    (
      ?auto_40370 - BLOCK
      ?auto_40369 - BLOCK
      ?auto_40372 - BLOCK
      ?auto_40371 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_40366 ?auto_40367 ) ) ( not ( = ?auto_40366 ?auto_40368 ) ) ( not ( = ?auto_40366 ?auto_40370 ) ) ( not ( = ?auto_40367 ?auto_40368 ) ) ( not ( = ?auto_40367 ?auto_40370 ) ) ( not ( = ?auto_40368 ?auto_40370 ) ) ( not ( = ?auto_40366 ?auto_40369 ) ) ( not ( = ?auto_40366 ?auto_40372 ) ) ( not ( = ?auto_40367 ?auto_40369 ) ) ( not ( = ?auto_40367 ?auto_40372 ) ) ( not ( = ?auto_40368 ?auto_40369 ) ) ( not ( = ?auto_40368 ?auto_40372 ) ) ( not ( = ?auto_40370 ?auto_40369 ) ) ( not ( = ?auto_40370 ?auto_40372 ) ) ( not ( = ?auto_40369 ?auto_40372 ) ) ( ON ?auto_40372 ?auto_40371 ) ( not ( = ?auto_40366 ?auto_40371 ) ) ( not ( = ?auto_40367 ?auto_40371 ) ) ( not ( = ?auto_40368 ?auto_40371 ) ) ( not ( = ?auto_40370 ?auto_40371 ) ) ( not ( = ?auto_40369 ?auto_40371 ) ) ( not ( = ?auto_40372 ?auto_40371 ) ) ( ON ?auto_40369 ?auto_40372 ) ( ON-TABLE ?auto_40371 ) ( ON ?auto_40370 ?auto_40369 ) ( ON ?auto_40368 ?auto_40370 ) ( ON ?auto_40367 ?auto_40368 ) ( ON ?auto_40366 ?auto_40367 ) ( CLEAR ?auto_40366 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_40371 ?auto_40372 ?auto_40369 ?auto_40370 ?auto_40368 ?auto_40367 )
      ( MAKE-3PILE ?auto_40366 ?auto_40367 ?auto_40368 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_40376 - BLOCK
      ?auto_40377 - BLOCK
      ?auto_40378 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_40378 ) ( CLEAR ?auto_40377 ) ( ON-TABLE ?auto_40376 ) ( ON ?auto_40377 ?auto_40376 ) ( not ( = ?auto_40376 ?auto_40377 ) ) ( not ( = ?auto_40376 ?auto_40378 ) ) ( not ( = ?auto_40377 ?auto_40378 ) ) )
    :subtasks
    ( ( !STACK ?auto_40378 ?auto_40377 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_40379 - BLOCK
      ?auto_40380 - BLOCK
      ?auto_40381 - BLOCK
    )
    :vars
    (
      ?auto_40382 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_40380 ) ( ON-TABLE ?auto_40379 ) ( ON ?auto_40380 ?auto_40379 ) ( not ( = ?auto_40379 ?auto_40380 ) ) ( not ( = ?auto_40379 ?auto_40381 ) ) ( not ( = ?auto_40380 ?auto_40381 ) ) ( ON ?auto_40381 ?auto_40382 ) ( CLEAR ?auto_40381 ) ( HAND-EMPTY ) ( not ( = ?auto_40379 ?auto_40382 ) ) ( not ( = ?auto_40380 ?auto_40382 ) ) ( not ( = ?auto_40381 ?auto_40382 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_40381 ?auto_40382 )
      ( MAKE-3PILE ?auto_40379 ?auto_40380 ?auto_40381 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_40383 - BLOCK
      ?auto_40384 - BLOCK
      ?auto_40385 - BLOCK
    )
    :vars
    (
      ?auto_40386 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_40383 ) ( not ( = ?auto_40383 ?auto_40384 ) ) ( not ( = ?auto_40383 ?auto_40385 ) ) ( not ( = ?auto_40384 ?auto_40385 ) ) ( ON ?auto_40385 ?auto_40386 ) ( CLEAR ?auto_40385 ) ( not ( = ?auto_40383 ?auto_40386 ) ) ( not ( = ?auto_40384 ?auto_40386 ) ) ( not ( = ?auto_40385 ?auto_40386 ) ) ( HOLDING ?auto_40384 ) ( CLEAR ?auto_40383 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_40383 ?auto_40384 )
      ( MAKE-3PILE ?auto_40383 ?auto_40384 ?auto_40385 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_40387 - BLOCK
      ?auto_40388 - BLOCK
      ?auto_40389 - BLOCK
    )
    :vars
    (
      ?auto_40390 - BLOCK
      ?auto_40392 - BLOCK
      ?auto_40391 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_40387 ) ( not ( = ?auto_40387 ?auto_40388 ) ) ( not ( = ?auto_40387 ?auto_40389 ) ) ( not ( = ?auto_40388 ?auto_40389 ) ) ( ON ?auto_40389 ?auto_40390 ) ( not ( = ?auto_40387 ?auto_40390 ) ) ( not ( = ?auto_40388 ?auto_40390 ) ) ( not ( = ?auto_40389 ?auto_40390 ) ) ( CLEAR ?auto_40387 ) ( ON ?auto_40388 ?auto_40389 ) ( CLEAR ?auto_40388 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_40392 ) ( ON ?auto_40391 ?auto_40392 ) ( ON ?auto_40390 ?auto_40391 ) ( not ( = ?auto_40392 ?auto_40391 ) ) ( not ( = ?auto_40392 ?auto_40390 ) ) ( not ( = ?auto_40392 ?auto_40389 ) ) ( not ( = ?auto_40392 ?auto_40388 ) ) ( not ( = ?auto_40391 ?auto_40390 ) ) ( not ( = ?auto_40391 ?auto_40389 ) ) ( not ( = ?auto_40391 ?auto_40388 ) ) ( not ( = ?auto_40387 ?auto_40392 ) ) ( not ( = ?auto_40387 ?auto_40391 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_40392 ?auto_40391 ?auto_40390 ?auto_40389 )
      ( MAKE-3PILE ?auto_40387 ?auto_40388 ?auto_40389 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_40393 - BLOCK
      ?auto_40394 - BLOCK
      ?auto_40395 - BLOCK
    )
    :vars
    (
      ?auto_40398 - BLOCK
      ?auto_40397 - BLOCK
      ?auto_40396 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_40393 ?auto_40394 ) ) ( not ( = ?auto_40393 ?auto_40395 ) ) ( not ( = ?auto_40394 ?auto_40395 ) ) ( ON ?auto_40395 ?auto_40398 ) ( not ( = ?auto_40393 ?auto_40398 ) ) ( not ( = ?auto_40394 ?auto_40398 ) ) ( not ( = ?auto_40395 ?auto_40398 ) ) ( ON ?auto_40394 ?auto_40395 ) ( CLEAR ?auto_40394 ) ( ON-TABLE ?auto_40397 ) ( ON ?auto_40396 ?auto_40397 ) ( ON ?auto_40398 ?auto_40396 ) ( not ( = ?auto_40397 ?auto_40396 ) ) ( not ( = ?auto_40397 ?auto_40398 ) ) ( not ( = ?auto_40397 ?auto_40395 ) ) ( not ( = ?auto_40397 ?auto_40394 ) ) ( not ( = ?auto_40396 ?auto_40398 ) ) ( not ( = ?auto_40396 ?auto_40395 ) ) ( not ( = ?auto_40396 ?auto_40394 ) ) ( not ( = ?auto_40393 ?auto_40397 ) ) ( not ( = ?auto_40393 ?auto_40396 ) ) ( HOLDING ?auto_40393 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_40393 )
      ( MAKE-3PILE ?auto_40393 ?auto_40394 ?auto_40395 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_40399 - BLOCK
      ?auto_40400 - BLOCK
      ?auto_40401 - BLOCK
    )
    :vars
    (
      ?auto_40403 - BLOCK
      ?auto_40402 - BLOCK
      ?auto_40404 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_40399 ?auto_40400 ) ) ( not ( = ?auto_40399 ?auto_40401 ) ) ( not ( = ?auto_40400 ?auto_40401 ) ) ( ON ?auto_40401 ?auto_40403 ) ( not ( = ?auto_40399 ?auto_40403 ) ) ( not ( = ?auto_40400 ?auto_40403 ) ) ( not ( = ?auto_40401 ?auto_40403 ) ) ( ON ?auto_40400 ?auto_40401 ) ( ON-TABLE ?auto_40402 ) ( ON ?auto_40404 ?auto_40402 ) ( ON ?auto_40403 ?auto_40404 ) ( not ( = ?auto_40402 ?auto_40404 ) ) ( not ( = ?auto_40402 ?auto_40403 ) ) ( not ( = ?auto_40402 ?auto_40401 ) ) ( not ( = ?auto_40402 ?auto_40400 ) ) ( not ( = ?auto_40404 ?auto_40403 ) ) ( not ( = ?auto_40404 ?auto_40401 ) ) ( not ( = ?auto_40404 ?auto_40400 ) ) ( not ( = ?auto_40399 ?auto_40402 ) ) ( not ( = ?auto_40399 ?auto_40404 ) ) ( ON ?auto_40399 ?auto_40400 ) ( CLEAR ?auto_40399 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_40402 ?auto_40404 ?auto_40403 ?auto_40401 ?auto_40400 )
      ( MAKE-3PILE ?auto_40399 ?auto_40400 ?auto_40401 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_40405 - BLOCK
      ?auto_40406 - BLOCK
      ?auto_40407 - BLOCK
    )
    :vars
    (
      ?auto_40410 - BLOCK
      ?auto_40408 - BLOCK
      ?auto_40409 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_40405 ?auto_40406 ) ) ( not ( = ?auto_40405 ?auto_40407 ) ) ( not ( = ?auto_40406 ?auto_40407 ) ) ( ON ?auto_40407 ?auto_40410 ) ( not ( = ?auto_40405 ?auto_40410 ) ) ( not ( = ?auto_40406 ?auto_40410 ) ) ( not ( = ?auto_40407 ?auto_40410 ) ) ( ON ?auto_40406 ?auto_40407 ) ( ON-TABLE ?auto_40408 ) ( ON ?auto_40409 ?auto_40408 ) ( ON ?auto_40410 ?auto_40409 ) ( not ( = ?auto_40408 ?auto_40409 ) ) ( not ( = ?auto_40408 ?auto_40410 ) ) ( not ( = ?auto_40408 ?auto_40407 ) ) ( not ( = ?auto_40408 ?auto_40406 ) ) ( not ( = ?auto_40409 ?auto_40410 ) ) ( not ( = ?auto_40409 ?auto_40407 ) ) ( not ( = ?auto_40409 ?auto_40406 ) ) ( not ( = ?auto_40405 ?auto_40408 ) ) ( not ( = ?auto_40405 ?auto_40409 ) ) ( HOLDING ?auto_40405 ) ( CLEAR ?auto_40406 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_40408 ?auto_40409 ?auto_40410 ?auto_40407 ?auto_40406 ?auto_40405 )
      ( MAKE-3PILE ?auto_40405 ?auto_40406 ?auto_40407 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_40411 - BLOCK
      ?auto_40412 - BLOCK
      ?auto_40413 - BLOCK
    )
    :vars
    (
      ?auto_40414 - BLOCK
      ?auto_40415 - BLOCK
      ?auto_40416 - BLOCK
      ?auto_40417 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_40411 ?auto_40412 ) ) ( not ( = ?auto_40411 ?auto_40413 ) ) ( not ( = ?auto_40412 ?auto_40413 ) ) ( ON ?auto_40413 ?auto_40414 ) ( not ( = ?auto_40411 ?auto_40414 ) ) ( not ( = ?auto_40412 ?auto_40414 ) ) ( not ( = ?auto_40413 ?auto_40414 ) ) ( ON ?auto_40412 ?auto_40413 ) ( ON-TABLE ?auto_40415 ) ( ON ?auto_40416 ?auto_40415 ) ( ON ?auto_40414 ?auto_40416 ) ( not ( = ?auto_40415 ?auto_40416 ) ) ( not ( = ?auto_40415 ?auto_40414 ) ) ( not ( = ?auto_40415 ?auto_40413 ) ) ( not ( = ?auto_40415 ?auto_40412 ) ) ( not ( = ?auto_40416 ?auto_40414 ) ) ( not ( = ?auto_40416 ?auto_40413 ) ) ( not ( = ?auto_40416 ?auto_40412 ) ) ( not ( = ?auto_40411 ?auto_40415 ) ) ( not ( = ?auto_40411 ?auto_40416 ) ) ( CLEAR ?auto_40412 ) ( ON ?auto_40411 ?auto_40417 ) ( CLEAR ?auto_40411 ) ( HAND-EMPTY ) ( not ( = ?auto_40411 ?auto_40417 ) ) ( not ( = ?auto_40412 ?auto_40417 ) ) ( not ( = ?auto_40413 ?auto_40417 ) ) ( not ( = ?auto_40414 ?auto_40417 ) ) ( not ( = ?auto_40415 ?auto_40417 ) ) ( not ( = ?auto_40416 ?auto_40417 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_40411 ?auto_40417 )
      ( MAKE-3PILE ?auto_40411 ?auto_40412 ?auto_40413 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_40418 - BLOCK
      ?auto_40419 - BLOCK
      ?auto_40420 - BLOCK
    )
    :vars
    (
      ?auto_40423 - BLOCK
      ?auto_40424 - BLOCK
      ?auto_40422 - BLOCK
      ?auto_40421 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_40418 ?auto_40419 ) ) ( not ( = ?auto_40418 ?auto_40420 ) ) ( not ( = ?auto_40419 ?auto_40420 ) ) ( ON ?auto_40420 ?auto_40423 ) ( not ( = ?auto_40418 ?auto_40423 ) ) ( not ( = ?auto_40419 ?auto_40423 ) ) ( not ( = ?auto_40420 ?auto_40423 ) ) ( ON-TABLE ?auto_40424 ) ( ON ?auto_40422 ?auto_40424 ) ( ON ?auto_40423 ?auto_40422 ) ( not ( = ?auto_40424 ?auto_40422 ) ) ( not ( = ?auto_40424 ?auto_40423 ) ) ( not ( = ?auto_40424 ?auto_40420 ) ) ( not ( = ?auto_40424 ?auto_40419 ) ) ( not ( = ?auto_40422 ?auto_40423 ) ) ( not ( = ?auto_40422 ?auto_40420 ) ) ( not ( = ?auto_40422 ?auto_40419 ) ) ( not ( = ?auto_40418 ?auto_40424 ) ) ( not ( = ?auto_40418 ?auto_40422 ) ) ( ON ?auto_40418 ?auto_40421 ) ( CLEAR ?auto_40418 ) ( not ( = ?auto_40418 ?auto_40421 ) ) ( not ( = ?auto_40419 ?auto_40421 ) ) ( not ( = ?auto_40420 ?auto_40421 ) ) ( not ( = ?auto_40423 ?auto_40421 ) ) ( not ( = ?auto_40424 ?auto_40421 ) ) ( not ( = ?auto_40422 ?auto_40421 ) ) ( HOLDING ?auto_40419 ) ( CLEAR ?auto_40420 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_40424 ?auto_40422 ?auto_40423 ?auto_40420 ?auto_40419 )
      ( MAKE-3PILE ?auto_40418 ?auto_40419 ?auto_40420 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_40425 - BLOCK
      ?auto_40426 - BLOCK
      ?auto_40427 - BLOCK
    )
    :vars
    (
      ?auto_40431 - BLOCK
      ?auto_40428 - BLOCK
      ?auto_40430 - BLOCK
      ?auto_40429 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_40425 ?auto_40426 ) ) ( not ( = ?auto_40425 ?auto_40427 ) ) ( not ( = ?auto_40426 ?auto_40427 ) ) ( ON ?auto_40427 ?auto_40431 ) ( not ( = ?auto_40425 ?auto_40431 ) ) ( not ( = ?auto_40426 ?auto_40431 ) ) ( not ( = ?auto_40427 ?auto_40431 ) ) ( ON-TABLE ?auto_40428 ) ( ON ?auto_40430 ?auto_40428 ) ( ON ?auto_40431 ?auto_40430 ) ( not ( = ?auto_40428 ?auto_40430 ) ) ( not ( = ?auto_40428 ?auto_40431 ) ) ( not ( = ?auto_40428 ?auto_40427 ) ) ( not ( = ?auto_40428 ?auto_40426 ) ) ( not ( = ?auto_40430 ?auto_40431 ) ) ( not ( = ?auto_40430 ?auto_40427 ) ) ( not ( = ?auto_40430 ?auto_40426 ) ) ( not ( = ?auto_40425 ?auto_40428 ) ) ( not ( = ?auto_40425 ?auto_40430 ) ) ( ON ?auto_40425 ?auto_40429 ) ( not ( = ?auto_40425 ?auto_40429 ) ) ( not ( = ?auto_40426 ?auto_40429 ) ) ( not ( = ?auto_40427 ?auto_40429 ) ) ( not ( = ?auto_40431 ?auto_40429 ) ) ( not ( = ?auto_40428 ?auto_40429 ) ) ( not ( = ?auto_40430 ?auto_40429 ) ) ( CLEAR ?auto_40427 ) ( ON ?auto_40426 ?auto_40425 ) ( CLEAR ?auto_40426 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_40429 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_40429 ?auto_40425 )
      ( MAKE-3PILE ?auto_40425 ?auto_40426 ?auto_40427 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_40432 - BLOCK
      ?auto_40433 - BLOCK
      ?auto_40434 - BLOCK
    )
    :vars
    (
      ?auto_40436 - BLOCK
      ?auto_40437 - BLOCK
      ?auto_40438 - BLOCK
      ?auto_40435 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_40432 ?auto_40433 ) ) ( not ( = ?auto_40432 ?auto_40434 ) ) ( not ( = ?auto_40433 ?auto_40434 ) ) ( not ( = ?auto_40432 ?auto_40436 ) ) ( not ( = ?auto_40433 ?auto_40436 ) ) ( not ( = ?auto_40434 ?auto_40436 ) ) ( ON-TABLE ?auto_40437 ) ( ON ?auto_40438 ?auto_40437 ) ( ON ?auto_40436 ?auto_40438 ) ( not ( = ?auto_40437 ?auto_40438 ) ) ( not ( = ?auto_40437 ?auto_40436 ) ) ( not ( = ?auto_40437 ?auto_40434 ) ) ( not ( = ?auto_40437 ?auto_40433 ) ) ( not ( = ?auto_40438 ?auto_40436 ) ) ( not ( = ?auto_40438 ?auto_40434 ) ) ( not ( = ?auto_40438 ?auto_40433 ) ) ( not ( = ?auto_40432 ?auto_40437 ) ) ( not ( = ?auto_40432 ?auto_40438 ) ) ( ON ?auto_40432 ?auto_40435 ) ( not ( = ?auto_40432 ?auto_40435 ) ) ( not ( = ?auto_40433 ?auto_40435 ) ) ( not ( = ?auto_40434 ?auto_40435 ) ) ( not ( = ?auto_40436 ?auto_40435 ) ) ( not ( = ?auto_40437 ?auto_40435 ) ) ( not ( = ?auto_40438 ?auto_40435 ) ) ( ON ?auto_40433 ?auto_40432 ) ( CLEAR ?auto_40433 ) ( ON-TABLE ?auto_40435 ) ( HOLDING ?auto_40434 ) ( CLEAR ?auto_40436 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_40437 ?auto_40438 ?auto_40436 ?auto_40434 )
      ( MAKE-3PILE ?auto_40432 ?auto_40433 ?auto_40434 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_40439 - BLOCK
      ?auto_40440 - BLOCK
      ?auto_40441 - BLOCK
    )
    :vars
    (
      ?auto_40443 - BLOCK
      ?auto_40445 - BLOCK
      ?auto_40444 - BLOCK
      ?auto_40442 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_40439 ?auto_40440 ) ) ( not ( = ?auto_40439 ?auto_40441 ) ) ( not ( = ?auto_40440 ?auto_40441 ) ) ( not ( = ?auto_40439 ?auto_40443 ) ) ( not ( = ?auto_40440 ?auto_40443 ) ) ( not ( = ?auto_40441 ?auto_40443 ) ) ( ON-TABLE ?auto_40445 ) ( ON ?auto_40444 ?auto_40445 ) ( ON ?auto_40443 ?auto_40444 ) ( not ( = ?auto_40445 ?auto_40444 ) ) ( not ( = ?auto_40445 ?auto_40443 ) ) ( not ( = ?auto_40445 ?auto_40441 ) ) ( not ( = ?auto_40445 ?auto_40440 ) ) ( not ( = ?auto_40444 ?auto_40443 ) ) ( not ( = ?auto_40444 ?auto_40441 ) ) ( not ( = ?auto_40444 ?auto_40440 ) ) ( not ( = ?auto_40439 ?auto_40445 ) ) ( not ( = ?auto_40439 ?auto_40444 ) ) ( ON ?auto_40439 ?auto_40442 ) ( not ( = ?auto_40439 ?auto_40442 ) ) ( not ( = ?auto_40440 ?auto_40442 ) ) ( not ( = ?auto_40441 ?auto_40442 ) ) ( not ( = ?auto_40443 ?auto_40442 ) ) ( not ( = ?auto_40445 ?auto_40442 ) ) ( not ( = ?auto_40444 ?auto_40442 ) ) ( ON ?auto_40440 ?auto_40439 ) ( ON-TABLE ?auto_40442 ) ( CLEAR ?auto_40443 ) ( ON ?auto_40441 ?auto_40440 ) ( CLEAR ?auto_40441 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_40442 ?auto_40439 ?auto_40440 )
      ( MAKE-3PILE ?auto_40439 ?auto_40440 ?auto_40441 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_40446 - BLOCK
      ?auto_40447 - BLOCK
      ?auto_40448 - BLOCK
    )
    :vars
    (
      ?auto_40450 - BLOCK
      ?auto_40451 - BLOCK
      ?auto_40452 - BLOCK
      ?auto_40449 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_40446 ?auto_40447 ) ) ( not ( = ?auto_40446 ?auto_40448 ) ) ( not ( = ?auto_40447 ?auto_40448 ) ) ( not ( = ?auto_40446 ?auto_40450 ) ) ( not ( = ?auto_40447 ?auto_40450 ) ) ( not ( = ?auto_40448 ?auto_40450 ) ) ( ON-TABLE ?auto_40451 ) ( ON ?auto_40452 ?auto_40451 ) ( not ( = ?auto_40451 ?auto_40452 ) ) ( not ( = ?auto_40451 ?auto_40450 ) ) ( not ( = ?auto_40451 ?auto_40448 ) ) ( not ( = ?auto_40451 ?auto_40447 ) ) ( not ( = ?auto_40452 ?auto_40450 ) ) ( not ( = ?auto_40452 ?auto_40448 ) ) ( not ( = ?auto_40452 ?auto_40447 ) ) ( not ( = ?auto_40446 ?auto_40451 ) ) ( not ( = ?auto_40446 ?auto_40452 ) ) ( ON ?auto_40446 ?auto_40449 ) ( not ( = ?auto_40446 ?auto_40449 ) ) ( not ( = ?auto_40447 ?auto_40449 ) ) ( not ( = ?auto_40448 ?auto_40449 ) ) ( not ( = ?auto_40450 ?auto_40449 ) ) ( not ( = ?auto_40451 ?auto_40449 ) ) ( not ( = ?auto_40452 ?auto_40449 ) ) ( ON ?auto_40447 ?auto_40446 ) ( ON-TABLE ?auto_40449 ) ( ON ?auto_40448 ?auto_40447 ) ( CLEAR ?auto_40448 ) ( HOLDING ?auto_40450 ) ( CLEAR ?auto_40452 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_40451 ?auto_40452 ?auto_40450 )
      ( MAKE-3PILE ?auto_40446 ?auto_40447 ?auto_40448 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_40453 - BLOCK
      ?auto_40454 - BLOCK
      ?auto_40455 - BLOCK
    )
    :vars
    (
      ?auto_40456 - BLOCK
      ?auto_40458 - BLOCK
      ?auto_40457 - BLOCK
      ?auto_40459 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_40453 ?auto_40454 ) ) ( not ( = ?auto_40453 ?auto_40455 ) ) ( not ( = ?auto_40454 ?auto_40455 ) ) ( not ( = ?auto_40453 ?auto_40456 ) ) ( not ( = ?auto_40454 ?auto_40456 ) ) ( not ( = ?auto_40455 ?auto_40456 ) ) ( ON-TABLE ?auto_40458 ) ( ON ?auto_40457 ?auto_40458 ) ( not ( = ?auto_40458 ?auto_40457 ) ) ( not ( = ?auto_40458 ?auto_40456 ) ) ( not ( = ?auto_40458 ?auto_40455 ) ) ( not ( = ?auto_40458 ?auto_40454 ) ) ( not ( = ?auto_40457 ?auto_40456 ) ) ( not ( = ?auto_40457 ?auto_40455 ) ) ( not ( = ?auto_40457 ?auto_40454 ) ) ( not ( = ?auto_40453 ?auto_40458 ) ) ( not ( = ?auto_40453 ?auto_40457 ) ) ( ON ?auto_40453 ?auto_40459 ) ( not ( = ?auto_40453 ?auto_40459 ) ) ( not ( = ?auto_40454 ?auto_40459 ) ) ( not ( = ?auto_40455 ?auto_40459 ) ) ( not ( = ?auto_40456 ?auto_40459 ) ) ( not ( = ?auto_40458 ?auto_40459 ) ) ( not ( = ?auto_40457 ?auto_40459 ) ) ( ON ?auto_40454 ?auto_40453 ) ( ON-TABLE ?auto_40459 ) ( ON ?auto_40455 ?auto_40454 ) ( CLEAR ?auto_40457 ) ( ON ?auto_40456 ?auto_40455 ) ( CLEAR ?auto_40456 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_40459 ?auto_40453 ?auto_40454 ?auto_40455 )
      ( MAKE-3PILE ?auto_40453 ?auto_40454 ?auto_40455 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_40460 - BLOCK
      ?auto_40461 - BLOCK
      ?auto_40462 - BLOCK
    )
    :vars
    (
      ?auto_40466 - BLOCK
      ?auto_40464 - BLOCK
      ?auto_40465 - BLOCK
      ?auto_40463 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_40460 ?auto_40461 ) ) ( not ( = ?auto_40460 ?auto_40462 ) ) ( not ( = ?auto_40461 ?auto_40462 ) ) ( not ( = ?auto_40460 ?auto_40466 ) ) ( not ( = ?auto_40461 ?auto_40466 ) ) ( not ( = ?auto_40462 ?auto_40466 ) ) ( ON-TABLE ?auto_40464 ) ( not ( = ?auto_40464 ?auto_40465 ) ) ( not ( = ?auto_40464 ?auto_40466 ) ) ( not ( = ?auto_40464 ?auto_40462 ) ) ( not ( = ?auto_40464 ?auto_40461 ) ) ( not ( = ?auto_40465 ?auto_40466 ) ) ( not ( = ?auto_40465 ?auto_40462 ) ) ( not ( = ?auto_40465 ?auto_40461 ) ) ( not ( = ?auto_40460 ?auto_40464 ) ) ( not ( = ?auto_40460 ?auto_40465 ) ) ( ON ?auto_40460 ?auto_40463 ) ( not ( = ?auto_40460 ?auto_40463 ) ) ( not ( = ?auto_40461 ?auto_40463 ) ) ( not ( = ?auto_40462 ?auto_40463 ) ) ( not ( = ?auto_40466 ?auto_40463 ) ) ( not ( = ?auto_40464 ?auto_40463 ) ) ( not ( = ?auto_40465 ?auto_40463 ) ) ( ON ?auto_40461 ?auto_40460 ) ( ON-TABLE ?auto_40463 ) ( ON ?auto_40462 ?auto_40461 ) ( ON ?auto_40466 ?auto_40462 ) ( CLEAR ?auto_40466 ) ( HOLDING ?auto_40465 ) ( CLEAR ?auto_40464 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_40464 ?auto_40465 )
      ( MAKE-3PILE ?auto_40460 ?auto_40461 ?auto_40462 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_40467 - BLOCK
      ?auto_40468 - BLOCK
      ?auto_40469 - BLOCK
    )
    :vars
    (
      ?auto_40471 - BLOCK
      ?auto_40472 - BLOCK
      ?auto_40473 - BLOCK
      ?auto_40470 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_40467 ?auto_40468 ) ) ( not ( = ?auto_40467 ?auto_40469 ) ) ( not ( = ?auto_40468 ?auto_40469 ) ) ( not ( = ?auto_40467 ?auto_40471 ) ) ( not ( = ?auto_40468 ?auto_40471 ) ) ( not ( = ?auto_40469 ?auto_40471 ) ) ( ON-TABLE ?auto_40472 ) ( not ( = ?auto_40472 ?auto_40473 ) ) ( not ( = ?auto_40472 ?auto_40471 ) ) ( not ( = ?auto_40472 ?auto_40469 ) ) ( not ( = ?auto_40472 ?auto_40468 ) ) ( not ( = ?auto_40473 ?auto_40471 ) ) ( not ( = ?auto_40473 ?auto_40469 ) ) ( not ( = ?auto_40473 ?auto_40468 ) ) ( not ( = ?auto_40467 ?auto_40472 ) ) ( not ( = ?auto_40467 ?auto_40473 ) ) ( ON ?auto_40467 ?auto_40470 ) ( not ( = ?auto_40467 ?auto_40470 ) ) ( not ( = ?auto_40468 ?auto_40470 ) ) ( not ( = ?auto_40469 ?auto_40470 ) ) ( not ( = ?auto_40471 ?auto_40470 ) ) ( not ( = ?auto_40472 ?auto_40470 ) ) ( not ( = ?auto_40473 ?auto_40470 ) ) ( ON ?auto_40468 ?auto_40467 ) ( ON-TABLE ?auto_40470 ) ( ON ?auto_40469 ?auto_40468 ) ( ON ?auto_40471 ?auto_40469 ) ( CLEAR ?auto_40472 ) ( ON ?auto_40473 ?auto_40471 ) ( CLEAR ?auto_40473 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_40470 ?auto_40467 ?auto_40468 ?auto_40469 ?auto_40471 )
      ( MAKE-3PILE ?auto_40467 ?auto_40468 ?auto_40469 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_40474 - BLOCK
      ?auto_40475 - BLOCK
      ?auto_40476 - BLOCK
    )
    :vars
    (
      ?auto_40479 - BLOCK
      ?auto_40480 - BLOCK
      ?auto_40478 - BLOCK
      ?auto_40477 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_40474 ?auto_40475 ) ) ( not ( = ?auto_40474 ?auto_40476 ) ) ( not ( = ?auto_40475 ?auto_40476 ) ) ( not ( = ?auto_40474 ?auto_40479 ) ) ( not ( = ?auto_40475 ?auto_40479 ) ) ( not ( = ?auto_40476 ?auto_40479 ) ) ( not ( = ?auto_40480 ?auto_40478 ) ) ( not ( = ?auto_40480 ?auto_40479 ) ) ( not ( = ?auto_40480 ?auto_40476 ) ) ( not ( = ?auto_40480 ?auto_40475 ) ) ( not ( = ?auto_40478 ?auto_40479 ) ) ( not ( = ?auto_40478 ?auto_40476 ) ) ( not ( = ?auto_40478 ?auto_40475 ) ) ( not ( = ?auto_40474 ?auto_40480 ) ) ( not ( = ?auto_40474 ?auto_40478 ) ) ( ON ?auto_40474 ?auto_40477 ) ( not ( = ?auto_40474 ?auto_40477 ) ) ( not ( = ?auto_40475 ?auto_40477 ) ) ( not ( = ?auto_40476 ?auto_40477 ) ) ( not ( = ?auto_40479 ?auto_40477 ) ) ( not ( = ?auto_40480 ?auto_40477 ) ) ( not ( = ?auto_40478 ?auto_40477 ) ) ( ON ?auto_40475 ?auto_40474 ) ( ON-TABLE ?auto_40477 ) ( ON ?auto_40476 ?auto_40475 ) ( ON ?auto_40479 ?auto_40476 ) ( ON ?auto_40478 ?auto_40479 ) ( CLEAR ?auto_40478 ) ( HOLDING ?auto_40480 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_40480 )
      ( MAKE-3PILE ?auto_40474 ?auto_40475 ?auto_40476 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_40481 - BLOCK
      ?auto_40482 - BLOCK
      ?auto_40483 - BLOCK
    )
    :vars
    (
      ?auto_40486 - BLOCK
      ?auto_40487 - BLOCK
      ?auto_40484 - BLOCK
      ?auto_40485 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_40481 ?auto_40482 ) ) ( not ( = ?auto_40481 ?auto_40483 ) ) ( not ( = ?auto_40482 ?auto_40483 ) ) ( not ( = ?auto_40481 ?auto_40486 ) ) ( not ( = ?auto_40482 ?auto_40486 ) ) ( not ( = ?auto_40483 ?auto_40486 ) ) ( not ( = ?auto_40487 ?auto_40484 ) ) ( not ( = ?auto_40487 ?auto_40486 ) ) ( not ( = ?auto_40487 ?auto_40483 ) ) ( not ( = ?auto_40487 ?auto_40482 ) ) ( not ( = ?auto_40484 ?auto_40486 ) ) ( not ( = ?auto_40484 ?auto_40483 ) ) ( not ( = ?auto_40484 ?auto_40482 ) ) ( not ( = ?auto_40481 ?auto_40487 ) ) ( not ( = ?auto_40481 ?auto_40484 ) ) ( ON ?auto_40481 ?auto_40485 ) ( not ( = ?auto_40481 ?auto_40485 ) ) ( not ( = ?auto_40482 ?auto_40485 ) ) ( not ( = ?auto_40483 ?auto_40485 ) ) ( not ( = ?auto_40486 ?auto_40485 ) ) ( not ( = ?auto_40487 ?auto_40485 ) ) ( not ( = ?auto_40484 ?auto_40485 ) ) ( ON ?auto_40482 ?auto_40481 ) ( ON-TABLE ?auto_40485 ) ( ON ?auto_40483 ?auto_40482 ) ( ON ?auto_40486 ?auto_40483 ) ( ON ?auto_40484 ?auto_40486 ) ( ON ?auto_40487 ?auto_40484 ) ( CLEAR ?auto_40487 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_40485 ?auto_40481 ?auto_40482 ?auto_40483 ?auto_40486 ?auto_40484 )
      ( MAKE-3PILE ?auto_40481 ?auto_40482 ?auto_40483 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_40490 - BLOCK
      ?auto_40491 - BLOCK
    )
    :vars
    (
      ?auto_40492 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_40492 ?auto_40491 ) ( CLEAR ?auto_40492 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_40490 ) ( ON ?auto_40491 ?auto_40490 ) ( not ( = ?auto_40490 ?auto_40491 ) ) ( not ( = ?auto_40490 ?auto_40492 ) ) ( not ( = ?auto_40491 ?auto_40492 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_40492 ?auto_40491 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_40493 - BLOCK
      ?auto_40494 - BLOCK
    )
    :vars
    (
      ?auto_40495 - BLOCK
      ?auto_40496 - BLOCK
      ?auto_40497 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_40495 ?auto_40494 ) ( CLEAR ?auto_40495 ) ( ON-TABLE ?auto_40493 ) ( ON ?auto_40494 ?auto_40493 ) ( not ( = ?auto_40493 ?auto_40494 ) ) ( not ( = ?auto_40493 ?auto_40495 ) ) ( not ( = ?auto_40494 ?auto_40495 ) ) ( HOLDING ?auto_40496 ) ( CLEAR ?auto_40497 ) ( not ( = ?auto_40493 ?auto_40496 ) ) ( not ( = ?auto_40493 ?auto_40497 ) ) ( not ( = ?auto_40494 ?auto_40496 ) ) ( not ( = ?auto_40494 ?auto_40497 ) ) ( not ( = ?auto_40495 ?auto_40496 ) ) ( not ( = ?auto_40495 ?auto_40497 ) ) ( not ( = ?auto_40496 ?auto_40497 ) ) )
    :subtasks
    ( ( !STACK ?auto_40496 ?auto_40497 )
      ( MAKE-2PILE ?auto_40493 ?auto_40494 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_40498 - BLOCK
      ?auto_40499 - BLOCK
    )
    :vars
    (
      ?auto_40501 - BLOCK
      ?auto_40502 - BLOCK
      ?auto_40500 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_40501 ?auto_40499 ) ( ON-TABLE ?auto_40498 ) ( ON ?auto_40499 ?auto_40498 ) ( not ( = ?auto_40498 ?auto_40499 ) ) ( not ( = ?auto_40498 ?auto_40501 ) ) ( not ( = ?auto_40499 ?auto_40501 ) ) ( CLEAR ?auto_40502 ) ( not ( = ?auto_40498 ?auto_40500 ) ) ( not ( = ?auto_40498 ?auto_40502 ) ) ( not ( = ?auto_40499 ?auto_40500 ) ) ( not ( = ?auto_40499 ?auto_40502 ) ) ( not ( = ?auto_40501 ?auto_40500 ) ) ( not ( = ?auto_40501 ?auto_40502 ) ) ( not ( = ?auto_40500 ?auto_40502 ) ) ( ON ?auto_40500 ?auto_40501 ) ( CLEAR ?auto_40500 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_40498 ?auto_40499 ?auto_40501 )
      ( MAKE-2PILE ?auto_40498 ?auto_40499 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_40503 - BLOCK
      ?auto_40504 - BLOCK
    )
    :vars
    (
      ?auto_40505 - BLOCK
      ?auto_40507 - BLOCK
      ?auto_40506 - BLOCK
      ?auto_40508 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_40505 ?auto_40504 ) ( ON-TABLE ?auto_40503 ) ( ON ?auto_40504 ?auto_40503 ) ( not ( = ?auto_40503 ?auto_40504 ) ) ( not ( = ?auto_40503 ?auto_40505 ) ) ( not ( = ?auto_40504 ?auto_40505 ) ) ( not ( = ?auto_40503 ?auto_40507 ) ) ( not ( = ?auto_40503 ?auto_40506 ) ) ( not ( = ?auto_40504 ?auto_40507 ) ) ( not ( = ?auto_40504 ?auto_40506 ) ) ( not ( = ?auto_40505 ?auto_40507 ) ) ( not ( = ?auto_40505 ?auto_40506 ) ) ( not ( = ?auto_40507 ?auto_40506 ) ) ( ON ?auto_40507 ?auto_40505 ) ( CLEAR ?auto_40507 ) ( HOLDING ?auto_40506 ) ( CLEAR ?auto_40508 ) ( ON-TABLE ?auto_40508 ) ( not ( = ?auto_40508 ?auto_40506 ) ) ( not ( = ?auto_40503 ?auto_40508 ) ) ( not ( = ?auto_40504 ?auto_40508 ) ) ( not ( = ?auto_40505 ?auto_40508 ) ) ( not ( = ?auto_40507 ?auto_40508 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_40508 ?auto_40506 )
      ( MAKE-2PILE ?auto_40503 ?auto_40504 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_40509 - BLOCK
      ?auto_40510 - BLOCK
    )
    :vars
    (
      ?auto_40511 - BLOCK
      ?auto_40514 - BLOCK
      ?auto_40512 - BLOCK
      ?auto_40513 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_40511 ?auto_40510 ) ( ON-TABLE ?auto_40509 ) ( ON ?auto_40510 ?auto_40509 ) ( not ( = ?auto_40509 ?auto_40510 ) ) ( not ( = ?auto_40509 ?auto_40511 ) ) ( not ( = ?auto_40510 ?auto_40511 ) ) ( not ( = ?auto_40509 ?auto_40514 ) ) ( not ( = ?auto_40509 ?auto_40512 ) ) ( not ( = ?auto_40510 ?auto_40514 ) ) ( not ( = ?auto_40510 ?auto_40512 ) ) ( not ( = ?auto_40511 ?auto_40514 ) ) ( not ( = ?auto_40511 ?auto_40512 ) ) ( not ( = ?auto_40514 ?auto_40512 ) ) ( ON ?auto_40514 ?auto_40511 ) ( CLEAR ?auto_40513 ) ( ON-TABLE ?auto_40513 ) ( not ( = ?auto_40513 ?auto_40512 ) ) ( not ( = ?auto_40509 ?auto_40513 ) ) ( not ( = ?auto_40510 ?auto_40513 ) ) ( not ( = ?auto_40511 ?auto_40513 ) ) ( not ( = ?auto_40514 ?auto_40513 ) ) ( ON ?auto_40512 ?auto_40514 ) ( CLEAR ?auto_40512 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_40509 ?auto_40510 ?auto_40511 ?auto_40514 )
      ( MAKE-2PILE ?auto_40509 ?auto_40510 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_40515 - BLOCK
      ?auto_40516 - BLOCK
    )
    :vars
    (
      ?auto_40518 - BLOCK
      ?auto_40520 - BLOCK
      ?auto_40517 - BLOCK
      ?auto_40519 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_40518 ?auto_40516 ) ( ON-TABLE ?auto_40515 ) ( ON ?auto_40516 ?auto_40515 ) ( not ( = ?auto_40515 ?auto_40516 ) ) ( not ( = ?auto_40515 ?auto_40518 ) ) ( not ( = ?auto_40516 ?auto_40518 ) ) ( not ( = ?auto_40515 ?auto_40520 ) ) ( not ( = ?auto_40515 ?auto_40517 ) ) ( not ( = ?auto_40516 ?auto_40520 ) ) ( not ( = ?auto_40516 ?auto_40517 ) ) ( not ( = ?auto_40518 ?auto_40520 ) ) ( not ( = ?auto_40518 ?auto_40517 ) ) ( not ( = ?auto_40520 ?auto_40517 ) ) ( ON ?auto_40520 ?auto_40518 ) ( not ( = ?auto_40519 ?auto_40517 ) ) ( not ( = ?auto_40515 ?auto_40519 ) ) ( not ( = ?auto_40516 ?auto_40519 ) ) ( not ( = ?auto_40518 ?auto_40519 ) ) ( not ( = ?auto_40520 ?auto_40519 ) ) ( ON ?auto_40517 ?auto_40520 ) ( CLEAR ?auto_40517 ) ( HOLDING ?auto_40519 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_40519 )
      ( MAKE-2PILE ?auto_40515 ?auto_40516 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_40521 - BLOCK
      ?auto_40522 - BLOCK
    )
    :vars
    (
      ?auto_40526 - BLOCK
      ?auto_40525 - BLOCK
      ?auto_40524 - BLOCK
      ?auto_40523 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_40526 ?auto_40522 ) ( ON-TABLE ?auto_40521 ) ( ON ?auto_40522 ?auto_40521 ) ( not ( = ?auto_40521 ?auto_40522 ) ) ( not ( = ?auto_40521 ?auto_40526 ) ) ( not ( = ?auto_40522 ?auto_40526 ) ) ( not ( = ?auto_40521 ?auto_40525 ) ) ( not ( = ?auto_40521 ?auto_40524 ) ) ( not ( = ?auto_40522 ?auto_40525 ) ) ( not ( = ?auto_40522 ?auto_40524 ) ) ( not ( = ?auto_40526 ?auto_40525 ) ) ( not ( = ?auto_40526 ?auto_40524 ) ) ( not ( = ?auto_40525 ?auto_40524 ) ) ( ON ?auto_40525 ?auto_40526 ) ( not ( = ?auto_40523 ?auto_40524 ) ) ( not ( = ?auto_40521 ?auto_40523 ) ) ( not ( = ?auto_40522 ?auto_40523 ) ) ( not ( = ?auto_40526 ?auto_40523 ) ) ( not ( = ?auto_40525 ?auto_40523 ) ) ( ON ?auto_40524 ?auto_40525 ) ( ON ?auto_40523 ?auto_40524 ) ( CLEAR ?auto_40523 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_40521 ?auto_40522 ?auto_40526 ?auto_40525 ?auto_40524 )
      ( MAKE-2PILE ?auto_40521 ?auto_40522 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_40527 - BLOCK
      ?auto_40528 - BLOCK
    )
    :vars
    (
      ?auto_40530 - BLOCK
      ?auto_40531 - BLOCK
      ?auto_40529 - BLOCK
      ?auto_40532 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_40530 ?auto_40528 ) ( ON-TABLE ?auto_40527 ) ( ON ?auto_40528 ?auto_40527 ) ( not ( = ?auto_40527 ?auto_40528 ) ) ( not ( = ?auto_40527 ?auto_40530 ) ) ( not ( = ?auto_40528 ?auto_40530 ) ) ( not ( = ?auto_40527 ?auto_40531 ) ) ( not ( = ?auto_40527 ?auto_40529 ) ) ( not ( = ?auto_40528 ?auto_40531 ) ) ( not ( = ?auto_40528 ?auto_40529 ) ) ( not ( = ?auto_40530 ?auto_40531 ) ) ( not ( = ?auto_40530 ?auto_40529 ) ) ( not ( = ?auto_40531 ?auto_40529 ) ) ( ON ?auto_40531 ?auto_40530 ) ( not ( = ?auto_40532 ?auto_40529 ) ) ( not ( = ?auto_40527 ?auto_40532 ) ) ( not ( = ?auto_40528 ?auto_40532 ) ) ( not ( = ?auto_40530 ?auto_40532 ) ) ( not ( = ?auto_40531 ?auto_40532 ) ) ( ON ?auto_40529 ?auto_40531 ) ( HOLDING ?auto_40532 ) ( CLEAR ?auto_40529 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_40527 ?auto_40528 ?auto_40530 ?auto_40531 ?auto_40529 ?auto_40532 )
      ( MAKE-2PILE ?auto_40527 ?auto_40528 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_40533 - BLOCK
      ?auto_40534 - BLOCK
    )
    :vars
    (
      ?auto_40536 - BLOCK
      ?auto_40535 - BLOCK
      ?auto_40538 - BLOCK
      ?auto_40537 - BLOCK
      ?auto_40539 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_40536 ?auto_40534 ) ( ON-TABLE ?auto_40533 ) ( ON ?auto_40534 ?auto_40533 ) ( not ( = ?auto_40533 ?auto_40534 ) ) ( not ( = ?auto_40533 ?auto_40536 ) ) ( not ( = ?auto_40534 ?auto_40536 ) ) ( not ( = ?auto_40533 ?auto_40535 ) ) ( not ( = ?auto_40533 ?auto_40538 ) ) ( not ( = ?auto_40534 ?auto_40535 ) ) ( not ( = ?auto_40534 ?auto_40538 ) ) ( not ( = ?auto_40536 ?auto_40535 ) ) ( not ( = ?auto_40536 ?auto_40538 ) ) ( not ( = ?auto_40535 ?auto_40538 ) ) ( ON ?auto_40535 ?auto_40536 ) ( not ( = ?auto_40537 ?auto_40538 ) ) ( not ( = ?auto_40533 ?auto_40537 ) ) ( not ( = ?auto_40534 ?auto_40537 ) ) ( not ( = ?auto_40536 ?auto_40537 ) ) ( not ( = ?auto_40535 ?auto_40537 ) ) ( ON ?auto_40538 ?auto_40535 ) ( CLEAR ?auto_40538 ) ( ON ?auto_40537 ?auto_40539 ) ( CLEAR ?auto_40537 ) ( HAND-EMPTY ) ( not ( = ?auto_40533 ?auto_40539 ) ) ( not ( = ?auto_40534 ?auto_40539 ) ) ( not ( = ?auto_40536 ?auto_40539 ) ) ( not ( = ?auto_40535 ?auto_40539 ) ) ( not ( = ?auto_40538 ?auto_40539 ) ) ( not ( = ?auto_40537 ?auto_40539 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_40537 ?auto_40539 )
      ( MAKE-2PILE ?auto_40533 ?auto_40534 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_40540 - BLOCK
      ?auto_40541 - BLOCK
    )
    :vars
    (
      ?auto_40545 - BLOCK
      ?auto_40546 - BLOCK
      ?auto_40544 - BLOCK
      ?auto_40543 - BLOCK
      ?auto_40542 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_40545 ?auto_40541 ) ( ON-TABLE ?auto_40540 ) ( ON ?auto_40541 ?auto_40540 ) ( not ( = ?auto_40540 ?auto_40541 ) ) ( not ( = ?auto_40540 ?auto_40545 ) ) ( not ( = ?auto_40541 ?auto_40545 ) ) ( not ( = ?auto_40540 ?auto_40546 ) ) ( not ( = ?auto_40540 ?auto_40544 ) ) ( not ( = ?auto_40541 ?auto_40546 ) ) ( not ( = ?auto_40541 ?auto_40544 ) ) ( not ( = ?auto_40545 ?auto_40546 ) ) ( not ( = ?auto_40545 ?auto_40544 ) ) ( not ( = ?auto_40546 ?auto_40544 ) ) ( ON ?auto_40546 ?auto_40545 ) ( not ( = ?auto_40543 ?auto_40544 ) ) ( not ( = ?auto_40540 ?auto_40543 ) ) ( not ( = ?auto_40541 ?auto_40543 ) ) ( not ( = ?auto_40545 ?auto_40543 ) ) ( not ( = ?auto_40546 ?auto_40543 ) ) ( ON ?auto_40543 ?auto_40542 ) ( CLEAR ?auto_40543 ) ( not ( = ?auto_40540 ?auto_40542 ) ) ( not ( = ?auto_40541 ?auto_40542 ) ) ( not ( = ?auto_40545 ?auto_40542 ) ) ( not ( = ?auto_40546 ?auto_40542 ) ) ( not ( = ?auto_40544 ?auto_40542 ) ) ( not ( = ?auto_40543 ?auto_40542 ) ) ( HOLDING ?auto_40544 ) ( CLEAR ?auto_40546 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_40540 ?auto_40541 ?auto_40545 ?auto_40546 ?auto_40544 )
      ( MAKE-2PILE ?auto_40540 ?auto_40541 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_40547 - BLOCK
      ?auto_40548 - BLOCK
    )
    :vars
    (
      ?auto_40551 - BLOCK
      ?auto_40553 - BLOCK
      ?auto_40550 - BLOCK
      ?auto_40549 - BLOCK
      ?auto_40552 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_40551 ?auto_40548 ) ( ON-TABLE ?auto_40547 ) ( ON ?auto_40548 ?auto_40547 ) ( not ( = ?auto_40547 ?auto_40548 ) ) ( not ( = ?auto_40547 ?auto_40551 ) ) ( not ( = ?auto_40548 ?auto_40551 ) ) ( not ( = ?auto_40547 ?auto_40553 ) ) ( not ( = ?auto_40547 ?auto_40550 ) ) ( not ( = ?auto_40548 ?auto_40553 ) ) ( not ( = ?auto_40548 ?auto_40550 ) ) ( not ( = ?auto_40551 ?auto_40553 ) ) ( not ( = ?auto_40551 ?auto_40550 ) ) ( not ( = ?auto_40553 ?auto_40550 ) ) ( ON ?auto_40553 ?auto_40551 ) ( not ( = ?auto_40549 ?auto_40550 ) ) ( not ( = ?auto_40547 ?auto_40549 ) ) ( not ( = ?auto_40548 ?auto_40549 ) ) ( not ( = ?auto_40551 ?auto_40549 ) ) ( not ( = ?auto_40553 ?auto_40549 ) ) ( ON ?auto_40549 ?auto_40552 ) ( not ( = ?auto_40547 ?auto_40552 ) ) ( not ( = ?auto_40548 ?auto_40552 ) ) ( not ( = ?auto_40551 ?auto_40552 ) ) ( not ( = ?auto_40553 ?auto_40552 ) ) ( not ( = ?auto_40550 ?auto_40552 ) ) ( not ( = ?auto_40549 ?auto_40552 ) ) ( CLEAR ?auto_40553 ) ( ON ?auto_40550 ?auto_40549 ) ( CLEAR ?auto_40550 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_40552 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_40552 ?auto_40549 )
      ( MAKE-2PILE ?auto_40547 ?auto_40548 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_40554 - BLOCK
      ?auto_40555 - BLOCK
    )
    :vars
    (
      ?auto_40556 - BLOCK
      ?auto_40557 - BLOCK
      ?auto_40560 - BLOCK
      ?auto_40558 - BLOCK
      ?auto_40559 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_40556 ?auto_40555 ) ( ON-TABLE ?auto_40554 ) ( ON ?auto_40555 ?auto_40554 ) ( not ( = ?auto_40554 ?auto_40555 ) ) ( not ( = ?auto_40554 ?auto_40556 ) ) ( not ( = ?auto_40555 ?auto_40556 ) ) ( not ( = ?auto_40554 ?auto_40557 ) ) ( not ( = ?auto_40554 ?auto_40560 ) ) ( not ( = ?auto_40555 ?auto_40557 ) ) ( not ( = ?auto_40555 ?auto_40560 ) ) ( not ( = ?auto_40556 ?auto_40557 ) ) ( not ( = ?auto_40556 ?auto_40560 ) ) ( not ( = ?auto_40557 ?auto_40560 ) ) ( not ( = ?auto_40558 ?auto_40560 ) ) ( not ( = ?auto_40554 ?auto_40558 ) ) ( not ( = ?auto_40555 ?auto_40558 ) ) ( not ( = ?auto_40556 ?auto_40558 ) ) ( not ( = ?auto_40557 ?auto_40558 ) ) ( ON ?auto_40558 ?auto_40559 ) ( not ( = ?auto_40554 ?auto_40559 ) ) ( not ( = ?auto_40555 ?auto_40559 ) ) ( not ( = ?auto_40556 ?auto_40559 ) ) ( not ( = ?auto_40557 ?auto_40559 ) ) ( not ( = ?auto_40560 ?auto_40559 ) ) ( not ( = ?auto_40558 ?auto_40559 ) ) ( ON ?auto_40560 ?auto_40558 ) ( CLEAR ?auto_40560 ) ( ON-TABLE ?auto_40559 ) ( HOLDING ?auto_40557 ) ( CLEAR ?auto_40556 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_40554 ?auto_40555 ?auto_40556 ?auto_40557 )
      ( MAKE-2PILE ?auto_40554 ?auto_40555 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_40561 - BLOCK
      ?auto_40562 - BLOCK
    )
    :vars
    (
      ?auto_40564 - BLOCK
      ?auto_40565 - BLOCK
      ?auto_40563 - BLOCK
      ?auto_40567 - BLOCK
      ?auto_40566 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_40564 ?auto_40562 ) ( ON-TABLE ?auto_40561 ) ( ON ?auto_40562 ?auto_40561 ) ( not ( = ?auto_40561 ?auto_40562 ) ) ( not ( = ?auto_40561 ?auto_40564 ) ) ( not ( = ?auto_40562 ?auto_40564 ) ) ( not ( = ?auto_40561 ?auto_40565 ) ) ( not ( = ?auto_40561 ?auto_40563 ) ) ( not ( = ?auto_40562 ?auto_40565 ) ) ( not ( = ?auto_40562 ?auto_40563 ) ) ( not ( = ?auto_40564 ?auto_40565 ) ) ( not ( = ?auto_40564 ?auto_40563 ) ) ( not ( = ?auto_40565 ?auto_40563 ) ) ( not ( = ?auto_40567 ?auto_40563 ) ) ( not ( = ?auto_40561 ?auto_40567 ) ) ( not ( = ?auto_40562 ?auto_40567 ) ) ( not ( = ?auto_40564 ?auto_40567 ) ) ( not ( = ?auto_40565 ?auto_40567 ) ) ( ON ?auto_40567 ?auto_40566 ) ( not ( = ?auto_40561 ?auto_40566 ) ) ( not ( = ?auto_40562 ?auto_40566 ) ) ( not ( = ?auto_40564 ?auto_40566 ) ) ( not ( = ?auto_40565 ?auto_40566 ) ) ( not ( = ?auto_40563 ?auto_40566 ) ) ( not ( = ?auto_40567 ?auto_40566 ) ) ( ON ?auto_40563 ?auto_40567 ) ( ON-TABLE ?auto_40566 ) ( CLEAR ?auto_40564 ) ( ON ?auto_40565 ?auto_40563 ) ( CLEAR ?auto_40565 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_40566 ?auto_40567 ?auto_40563 )
      ( MAKE-2PILE ?auto_40561 ?auto_40562 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_40582 - BLOCK
      ?auto_40583 - BLOCK
    )
    :vars
    (
      ?auto_40585 - BLOCK
      ?auto_40586 - BLOCK
      ?auto_40584 - BLOCK
      ?auto_40587 - BLOCK
      ?auto_40588 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_40582 ) ( not ( = ?auto_40582 ?auto_40583 ) ) ( not ( = ?auto_40582 ?auto_40585 ) ) ( not ( = ?auto_40583 ?auto_40585 ) ) ( not ( = ?auto_40582 ?auto_40586 ) ) ( not ( = ?auto_40582 ?auto_40584 ) ) ( not ( = ?auto_40583 ?auto_40586 ) ) ( not ( = ?auto_40583 ?auto_40584 ) ) ( not ( = ?auto_40585 ?auto_40586 ) ) ( not ( = ?auto_40585 ?auto_40584 ) ) ( not ( = ?auto_40586 ?auto_40584 ) ) ( not ( = ?auto_40587 ?auto_40584 ) ) ( not ( = ?auto_40582 ?auto_40587 ) ) ( not ( = ?auto_40583 ?auto_40587 ) ) ( not ( = ?auto_40585 ?auto_40587 ) ) ( not ( = ?auto_40586 ?auto_40587 ) ) ( ON ?auto_40587 ?auto_40588 ) ( not ( = ?auto_40582 ?auto_40588 ) ) ( not ( = ?auto_40583 ?auto_40588 ) ) ( not ( = ?auto_40585 ?auto_40588 ) ) ( not ( = ?auto_40586 ?auto_40588 ) ) ( not ( = ?auto_40584 ?auto_40588 ) ) ( not ( = ?auto_40587 ?auto_40588 ) ) ( ON ?auto_40584 ?auto_40587 ) ( ON-TABLE ?auto_40588 ) ( ON ?auto_40586 ?auto_40584 ) ( ON ?auto_40585 ?auto_40586 ) ( CLEAR ?auto_40585 ) ( HOLDING ?auto_40583 ) ( CLEAR ?auto_40582 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_40582 ?auto_40583 ?auto_40585 )
      ( MAKE-2PILE ?auto_40582 ?auto_40583 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_40589 - BLOCK
      ?auto_40590 - BLOCK
    )
    :vars
    (
      ?auto_40594 - BLOCK
      ?auto_40592 - BLOCK
      ?auto_40593 - BLOCK
      ?auto_40591 - BLOCK
      ?auto_40595 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_40589 ) ( not ( = ?auto_40589 ?auto_40590 ) ) ( not ( = ?auto_40589 ?auto_40594 ) ) ( not ( = ?auto_40590 ?auto_40594 ) ) ( not ( = ?auto_40589 ?auto_40592 ) ) ( not ( = ?auto_40589 ?auto_40593 ) ) ( not ( = ?auto_40590 ?auto_40592 ) ) ( not ( = ?auto_40590 ?auto_40593 ) ) ( not ( = ?auto_40594 ?auto_40592 ) ) ( not ( = ?auto_40594 ?auto_40593 ) ) ( not ( = ?auto_40592 ?auto_40593 ) ) ( not ( = ?auto_40591 ?auto_40593 ) ) ( not ( = ?auto_40589 ?auto_40591 ) ) ( not ( = ?auto_40590 ?auto_40591 ) ) ( not ( = ?auto_40594 ?auto_40591 ) ) ( not ( = ?auto_40592 ?auto_40591 ) ) ( ON ?auto_40591 ?auto_40595 ) ( not ( = ?auto_40589 ?auto_40595 ) ) ( not ( = ?auto_40590 ?auto_40595 ) ) ( not ( = ?auto_40594 ?auto_40595 ) ) ( not ( = ?auto_40592 ?auto_40595 ) ) ( not ( = ?auto_40593 ?auto_40595 ) ) ( not ( = ?auto_40591 ?auto_40595 ) ) ( ON ?auto_40593 ?auto_40591 ) ( ON-TABLE ?auto_40595 ) ( ON ?auto_40592 ?auto_40593 ) ( ON ?auto_40594 ?auto_40592 ) ( CLEAR ?auto_40589 ) ( ON ?auto_40590 ?auto_40594 ) ( CLEAR ?auto_40590 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_40595 ?auto_40591 ?auto_40593 ?auto_40592 ?auto_40594 )
      ( MAKE-2PILE ?auto_40589 ?auto_40590 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_40596 - BLOCK
      ?auto_40597 - BLOCK
    )
    :vars
    (
      ?auto_40600 - BLOCK
      ?auto_40602 - BLOCK
      ?auto_40598 - BLOCK
      ?auto_40601 - BLOCK
      ?auto_40599 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_40596 ?auto_40597 ) ) ( not ( = ?auto_40596 ?auto_40600 ) ) ( not ( = ?auto_40597 ?auto_40600 ) ) ( not ( = ?auto_40596 ?auto_40602 ) ) ( not ( = ?auto_40596 ?auto_40598 ) ) ( not ( = ?auto_40597 ?auto_40602 ) ) ( not ( = ?auto_40597 ?auto_40598 ) ) ( not ( = ?auto_40600 ?auto_40602 ) ) ( not ( = ?auto_40600 ?auto_40598 ) ) ( not ( = ?auto_40602 ?auto_40598 ) ) ( not ( = ?auto_40601 ?auto_40598 ) ) ( not ( = ?auto_40596 ?auto_40601 ) ) ( not ( = ?auto_40597 ?auto_40601 ) ) ( not ( = ?auto_40600 ?auto_40601 ) ) ( not ( = ?auto_40602 ?auto_40601 ) ) ( ON ?auto_40601 ?auto_40599 ) ( not ( = ?auto_40596 ?auto_40599 ) ) ( not ( = ?auto_40597 ?auto_40599 ) ) ( not ( = ?auto_40600 ?auto_40599 ) ) ( not ( = ?auto_40602 ?auto_40599 ) ) ( not ( = ?auto_40598 ?auto_40599 ) ) ( not ( = ?auto_40601 ?auto_40599 ) ) ( ON ?auto_40598 ?auto_40601 ) ( ON-TABLE ?auto_40599 ) ( ON ?auto_40602 ?auto_40598 ) ( ON ?auto_40600 ?auto_40602 ) ( ON ?auto_40597 ?auto_40600 ) ( CLEAR ?auto_40597 ) ( HOLDING ?auto_40596 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_40596 )
      ( MAKE-2PILE ?auto_40596 ?auto_40597 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_40603 - BLOCK
      ?auto_40604 - BLOCK
    )
    :vars
    (
      ?auto_40608 - BLOCK
      ?auto_40606 - BLOCK
      ?auto_40609 - BLOCK
      ?auto_40605 - BLOCK
      ?auto_40607 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_40603 ?auto_40604 ) ) ( not ( = ?auto_40603 ?auto_40608 ) ) ( not ( = ?auto_40604 ?auto_40608 ) ) ( not ( = ?auto_40603 ?auto_40606 ) ) ( not ( = ?auto_40603 ?auto_40609 ) ) ( not ( = ?auto_40604 ?auto_40606 ) ) ( not ( = ?auto_40604 ?auto_40609 ) ) ( not ( = ?auto_40608 ?auto_40606 ) ) ( not ( = ?auto_40608 ?auto_40609 ) ) ( not ( = ?auto_40606 ?auto_40609 ) ) ( not ( = ?auto_40605 ?auto_40609 ) ) ( not ( = ?auto_40603 ?auto_40605 ) ) ( not ( = ?auto_40604 ?auto_40605 ) ) ( not ( = ?auto_40608 ?auto_40605 ) ) ( not ( = ?auto_40606 ?auto_40605 ) ) ( ON ?auto_40605 ?auto_40607 ) ( not ( = ?auto_40603 ?auto_40607 ) ) ( not ( = ?auto_40604 ?auto_40607 ) ) ( not ( = ?auto_40608 ?auto_40607 ) ) ( not ( = ?auto_40606 ?auto_40607 ) ) ( not ( = ?auto_40609 ?auto_40607 ) ) ( not ( = ?auto_40605 ?auto_40607 ) ) ( ON ?auto_40609 ?auto_40605 ) ( ON-TABLE ?auto_40607 ) ( ON ?auto_40606 ?auto_40609 ) ( ON ?auto_40608 ?auto_40606 ) ( ON ?auto_40604 ?auto_40608 ) ( ON ?auto_40603 ?auto_40604 ) ( CLEAR ?auto_40603 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_40607 ?auto_40605 ?auto_40609 ?auto_40606 ?auto_40608 ?auto_40604 )
      ( MAKE-2PILE ?auto_40603 ?auto_40604 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_40614 - BLOCK
      ?auto_40615 - BLOCK
      ?auto_40616 - BLOCK
      ?auto_40617 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_40617 ) ( CLEAR ?auto_40616 ) ( ON-TABLE ?auto_40614 ) ( ON ?auto_40615 ?auto_40614 ) ( ON ?auto_40616 ?auto_40615 ) ( not ( = ?auto_40614 ?auto_40615 ) ) ( not ( = ?auto_40614 ?auto_40616 ) ) ( not ( = ?auto_40614 ?auto_40617 ) ) ( not ( = ?auto_40615 ?auto_40616 ) ) ( not ( = ?auto_40615 ?auto_40617 ) ) ( not ( = ?auto_40616 ?auto_40617 ) ) )
    :subtasks
    ( ( !STACK ?auto_40617 ?auto_40616 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_40618 - BLOCK
      ?auto_40619 - BLOCK
      ?auto_40620 - BLOCK
      ?auto_40621 - BLOCK
    )
    :vars
    (
      ?auto_40622 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_40620 ) ( ON-TABLE ?auto_40618 ) ( ON ?auto_40619 ?auto_40618 ) ( ON ?auto_40620 ?auto_40619 ) ( not ( = ?auto_40618 ?auto_40619 ) ) ( not ( = ?auto_40618 ?auto_40620 ) ) ( not ( = ?auto_40618 ?auto_40621 ) ) ( not ( = ?auto_40619 ?auto_40620 ) ) ( not ( = ?auto_40619 ?auto_40621 ) ) ( not ( = ?auto_40620 ?auto_40621 ) ) ( ON ?auto_40621 ?auto_40622 ) ( CLEAR ?auto_40621 ) ( HAND-EMPTY ) ( not ( = ?auto_40618 ?auto_40622 ) ) ( not ( = ?auto_40619 ?auto_40622 ) ) ( not ( = ?auto_40620 ?auto_40622 ) ) ( not ( = ?auto_40621 ?auto_40622 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_40621 ?auto_40622 )
      ( MAKE-4PILE ?auto_40618 ?auto_40619 ?auto_40620 ?auto_40621 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_40623 - BLOCK
      ?auto_40624 - BLOCK
      ?auto_40625 - BLOCK
      ?auto_40626 - BLOCK
    )
    :vars
    (
      ?auto_40627 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_40623 ) ( ON ?auto_40624 ?auto_40623 ) ( not ( = ?auto_40623 ?auto_40624 ) ) ( not ( = ?auto_40623 ?auto_40625 ) ) ( not ( = ?auto_40623 ?auto_40626 ) ) ( not ( = ?auto_40624 ?auto_40625 ) ) ( not ( = ?auto_40624 ?auto_40626 ) ) ( not ( = ?auto_40625 ?auto_40626 ) ) ( ON ?auto_40626 ?auto_40627 ) ( CLEAR ?auto_40626 ) ( not ( = ?auto_40623 ?auto_40627 ) ) ( not ( = ?auto_40624 ?auto_40627 ) ) ( not ( = ?auto_40625 ?auto_40627 ) ) ( not ( = ?auto_40626 ?auto_40627 ) ) ( HOLDING ?auto_40625 ) ( CLEAR ?auto_40624 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_40623 ?auto_40624 ?auto_40625 )
      ( MAKE-4PILE ?auto_40623 ?auto_40624 ?auto_40625 ?auto_40626 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_40628 - BLOCK
      ?auto_40629 - BLOCK
      ?auto_40630 - BLOCK
      ?auto_40631 - BLOCK
    )
    :vars
    (
      ?auto_40632 - BLOCK
      ?auto_40633 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_40628 ) ( ON ?auto_40629 ?auto_40628 ) ( not ( = ?auto_40628 ?auto_40629 ) ) ( not ( = ?auto_40628 ?auto_40630 ) ) ( not ( = ?auto_40628 ?auto_40631 ) ) ( not ( = ?auto_40629 ?auto_40630 ) ) ( not ( = ?auto_40629 ?auto_40631 ) ) ( not ( = ?auto_40630 ?auto_40631 ) ) ( ON ?auto_40631 ?auto_40632 ) ( not ( = ?auto_40628 ?auto_40632 ) ) ( not ( = ?auto_40629 ?auto_40632 ) ) ( not ( = ?auto_40630 ?auto_40632 ) ) ( not ( = ?auto_40631 ?auto_40632 ) ) ( CLEAR ?auto_40629 ) ( ON ?auto_40630 ?auto_40631 ) ( CLEAR ?auto_40630 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_40633 ) ( ON ?auto_40632 ?auto_40633 ) ( not ( = ?auto_40633 ?auto_40632 ) ) ( not ( = ?auto_40633 ?auto_40631 ) ) ( not ( = ?auto_40633 ?auto_40630 ) ) ( not ( = ?auto_40628 ?auto_40633 ) ) ( not ( = ?auto_40629 ?auto_40633 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_40633 ?auto_40632 ?auto_40631 )
      ( MAKE-4PILE ?auto_40628 ?auto_40629 ?auto_40630 ?auto_40631 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_40634 - BLOCK
      ?auto_40635 - BLOCK
      ?auto_40636 - BLOCK
      ?auto_40637 - BLOCK
    )
    :vars
    (
      ?auto_40638 - BLOCK
      ?auto_40639 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_40634 ) ( not ( = ?auto_40634 ?auto_40635 ) ) ( not ( = ?auto_40634 ?auto_40636 ) ) ( not ( = ?auto_40634 ?auto_40637 ) ) ( not ( = ?auto_40635 ?auto_40636 ) ) ( not ( = ?auto_40635 ?auto_40637 ) ) ( not ( = ?auto_40636 ?auto_40637 ) ) ( ON ?auto_40637 ?auto_40638 ) ( not ( = ?auto_40634 ?auto_40638 ) ) ( not ( = ?auto_40635 ?auto_40638 ) ) ( not ( = ?auto_40636 ?auto_40638 ) ) ( not ( = ?auto_40637 ?auto_40638 ) ) ( ON ?auto_40636 ?auto_40637 ) ( CLEAR ?auto_40636 ) ( ON-TABLE ?auto_40639 ) ( ON ?auto_40638 ?auto_40639 ) ( not ( = ?auto_40639 ?auto_40638 ) ) ( not ( = ?auto_40639 ?auto_40637 ) ) ( not ( = ?auto_40639 ?auto_40636 ) ) ( not ( = ?auto_40634 ?auto_40639 ) ) ( not ( = ?auto_40635 ?auto_40639 ) ) ( HOLDING ?auto_40635 ) ( CLEAR ?auto_40634 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_40634 ?auto_40635 )
      ( MAKE-4PILE ?auto_40634 ?auto_40635 ?auto_40636 ?auto_40637 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_40640 - BLOCK
      ?auto_40641 - BLOCK
      ?auto_40642 - BLOCK
      ?auto_40643 - BLOCK
    )
    :vars
    (
      ?auto_40645 - BLOCK
      ?auto_40644 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_40640 ) ( not ( = ?auto_40640 ?auto_40641 ) ) ( not ( = ?auto_40640 ?auto_40642 ) ) ( not ( = ?auto_40640 ?auto_40643 ) ) ( not ( = ?auto_40641 ?auto_40642 ) ) ( not ( = ?auto_40641 ?auto_40643 ) ) ( not ( = ?auto_40642 ?auto_40643 ) ) ( ON ?auto_40643 ?auto_40645 ) ( not ( = ?auto_40640 ?auto_40645 ) ) ( not ( = ?auto_40641 ?auto_40645 ) ) ( not ( = ?auto_40642 ?auto_40645 ) ) ( not ( = ?auto_40643 ?auto_40645 ) ) ( ON ?auto_40642 ?auto_40643 ) ( ON-TABLE ?auto_40644 ) ( ON ?auto_40645 ?auto_40644 ) ( not ( = ?auto_40644 ?auto_40645 ) ) ( not ( = ?auto_40644 ?auto_40643 ) ) ( not ( = ?auto_40644 ?auto_40642 ) ) ( not ( = ?auto_40640 ?auto_40644 ) ) ( not ( = ?auto_40641 ?auto_40644 ) ) ( CLEAR ?auto_40640 ) ( ON ?auto_40641 ?auto_40642 ) ( CLEAR ?auto_40641 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_40644 ?auto_40645 ?auto_40643 ?auto_40642 )
      ( MAKE-4PILE ?auto_40640 ?auto_40641 ?auto_40642 ?auto_40643 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_40646 - BLOCK
      ?auto_40647 - BLOCK
      ?auto_40648 - BLOCK
      ?auto_40649 - BLOCK
    )
    :vars
    (
      ?auto_40651 - BLOCK
      ?auto_40650 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_40646 ?auto_40647 ) ) ( not ( = ?auto_40646 ?auto_40648 ) ) ( not ( = ?auto_40646 ?auto_40649 ) ) ( not ( = ?auto_40647 ?auto_40648 ) ) ( not ( = ?auto_40647 ?auto_40649 ) ) ( not ( = ?auto_40648 ?auto_40649 ) ) ( ON ?auto_40649 ?auto_40651 ) ( not ( = ?auto_40646 ?auto_40651 ) ) ( not ( = ?auto_40647 ?auto_40651 ) ) ( not ( = ?auto_40648 ?auto_40651 ) ) ( not ( = ?auto_40649 ?auto_40651 ) ) ( ON ?auto_40648 ?auto_40649 ) ( ON-TABLE ?auto_40650 ) ( ON ?auto_40651 ?auto_40650 ) ( not ( = ?auto_40650 ?auto_40651 ) ) ( not ( = ?auto_40650 ?auto_40649 ) ) ( not ( = ?auto_40650 ?auto_40648 ) ) ( not ( = ?auto_40646 ?auto_40650 ) ) ( not ( = ?auto_40647 ?auto_40650 ) ) ( ON ?auto_40647 ?auto_40648 ) ( CLEAR ?auto_40647 ) ( HOLDING ?auto_40646 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_40646 )
      ( MAKE-4PILE ?auto_40646 ?auto_40647 ?auto_40648 ?auto_40649 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_40652 - BLOCK
      ?auto_40653 - BLOCK
      ?auto_40654 - BLOCK
      ?auto_40655 - BLOCK
    )
    :vars
    (
      ?auto_40656 - BLOCK
      ?auto_40657 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_40652 ?auto_40653 ) ) ( not ( = ?auto_40652 ?auto_40654 ) ) ( not ( = ?auto_40652 ?auto_40655 ) ) ( not ( = ?auto_40653 ?auto_40654 ) ) ( not ( = ?auto_40653 ?auto_40655 ) ) ( not ( = ?auto_40654 ?auto_40655 ) ) ( ON ?auto_40655 ?auto_40656 ) ( not ( = ?auto_40652 ?auto_40656 ) ) ( not ( = ?auto_40653 ?auto_40656 ) ) ( not ( = ?auto_40654 ?auto_40656 ) ) ( not ( = ?auto_40655 ?auto_40656 ) ) ( ON ?auto_40654 ?auto_40655 ) ( ON-TABLE ?auto_40657 ) ( ON ?auto_40656 ?auto_40657 ) ( not ( = ?auto_40657 ?auto_40656 ) ) ( not ( = ?auto_40657 ?auto_40655 ) ) ( not ( = ?auto_40657 ?auto_40654 ) ) ( not ( = ?auto_40652 ?auto_40657 ) ) ( not ( = ?auto_40653 ?auto_40657 ) ) ( ON ?auto_40653 ?auto_40654 ) ( ON ?auto_40652 ?auto_40653 ) ( CLEAR ?auto_40652 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_40657 ?auto_40656 ?auto_40655 ?auto_40654 ?auto_40653 )
      ( MAKE-4PILE ?auto_40652 ?auto_40653 ?auto_40654 ?auto_40655 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_40658 - BLOCK
      ?auto_40659 - BLOCK
      ?auto_40660 - BLOCK
      ?auto_40661 - BLOCK
    )
    :vars
    (
      ?auto_40662 - BLOCK
      ?auto_40663 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_40658 ?auto_40659 ) ) ( not ( = ?auto_40658 ?auto_40660 ) ) ( not ( = ?auto_40658 ?auto_40661 ) ) ( not ( = ?auto_40659 ?auto_40660 ) ) ( not ( = ?auto_40659 ?auto_40661 ) ) ( not ( = ?auto_40660 ?auto_40661 ) ) ( ON ?auto_40661 ?auto_40662 ) ( not ( = ?auto_40658 ?auto_40662 ) ) ( not ( = ?auto_40659 ?auto_40662 ) ) ( not ( = ?auto_40660 ?auto_40662 ) ) ( not ( = ?auto_40661 ?auto_40662 ) ) ( ON ?auto_40660 ?auto_40661 ) ( ON-TABLE ?auto_40663 ) ( ON ?auto_40662 ?auto_40663 ) ( not ( = ?auto_40663 ?auto_40662 ) ) ( not ( = ?auto_40663 ?auto_40661 ) ) ( not ( = ?auto_40663 ?auto_40660 ) ) ( not ( = ?auto_40658 ?auto_40663 ) ) ( not ( = ?auto_40659 ?auto_40663 ) ) ( ON ?auto_40659 ?auto_40660 ) ( HOLDING ?auto_40658 ) ( CLEAR ?auto_40659 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_40663 ?auto_40662 ?auto_40661 ?auto_40660 ?auto_40659 ?auto_40658 )
      ( MAKE-4PILE ?auto_40658 ?auto_40659 ?auto_40660 ?auto_40661 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_40664 - BLOCK
      ?auto_40665 - BLOCK
      ?auto_40666 - BLOCK
      ?auto_40667 - BLOCK
    )
    :vars
    (
      ?auto_40668 - BLOCK
      ?auto_40669 - BLOCK
      ?auto_40670 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_40664 ?auto_40665 ) ) ( not ( = ?auto_40664 ?auto_40666 ) ) ( not ( = ?auto_40664 ?auto_40667 ) ) ( not ( = ?auto_40665 ?auto_40666 ) ) ( not ( = ?auto_40665 ?auto_40667 ) ) ( not ( = ?auto_40666 ?auto_40667 ) ) ( ON ?auto_40667 ?auto_40668 ) ( not ( = ?auto_40664 ?auto_40668 ) ) ( not ( = ?auto_40665 ?auto_40668 ) ) ( not ( = ?auto_40666 ?auto_40668 ) ) ( not ( = ?auto_40667 ?auto_40668 ) ) ( ON ?auto_40666 ?auto_40667 ) ( ON-TABLE ?auto_40669 ) ( ON ?auto_40668 ?auto_40669 ) ( not ( = ?auto_40669 ?auto_40668 ) ) ( not ( = ?auto_40669 ?auto_40667 ) ) ( not ( = ?auto_40669 ?auto_40666 ) ) ( not ( = ?auto_40664 ?auto_40669 ) ) ( not ( = ?auto_40665 ?auto_40669 ) ) ( ON ?auto_40665 ?auto_40666 ) ( CLEAR ?auto_40665 ) ( ON ?auto_40664 ?auto_40670 ) ( CLEAR ?auto_40664 ) ( HAND-EMPTY ) ( not ( = ?auto_40664 ?auto_40670 ) ) ( not ( = ?auto_40665 ?auto_40670 ) ) ( not ( = ?auto_40666 ?auto_40670 ) ) ( not ( = ?auto_40667 ?auto_40670 ) ) ( not ( = ?auto_40668 ?auto_40670 ) ) ( not ( = ?auto_40669 ?auto_40670 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_40664 ?auto_40670 )
      ( MAKE-4PILE ?auto_40664 ?auto_40665 ?auto_40666 ?auto_40667 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_40671 - BLOCK
      ?auto_40672 - BLOCK
      ?auto_40673 - BLOCK
      ?auto_40674 - BLOCK
    )
    :vars
    (
      ?auto_40677 - BLOCK
      ?auto_40676 - BLOCK
      ?auto_40675 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_40671 ?auto_40672 ) ) ( not ( = ?auto_40671 ?auto_40673 ) ) ( not ( = ?auto_40671 ?auto_40674 ) ) ( not ( = ?auto_40672 ?auto_40673 ) ) ( not ( = ?auto_40672 ?auto_40674 ) ) ( not ( = ?auto_40673 ?auto_40674 ) ) ( ON ?auto_40674 ?auto_40677 ) ( not ( = ?auto_40671 ?auto_40677 ) ) ( not ( = ?auto_40672 ?auto_40677 ) ) ( not ( = ?auto_40673 ?auto_40677 ) ) ( not ( = ?auto_40674 ?auto_40677 ) ) ( ON ?auto_40673 ?auto_40674 ) ( ON-TABLE ?auto_40676 ) ( ON ?auto_40677 ?auto_40676 ) ( not ( = ?auto_40676 ?auto_40677 ) ) ( not ( = ?auto_40676 ?auto_40674 ) ) ( not ( = ?auto_40676 ?auto_40673 ) ) ( not ( = ?auto_40671 ?auto_40676 ) ) ( not ( = ?auto_40672 ?auto_40676 ) ) ( ON ?auto_40671 ?auto_40675 ) ( CLEAR ?auto_40671 ) ( not ( = ?auto_40671 ?auto_40675 ) ) ( not ( = ?auto_40672 ?auto_40675 ) ) ( not ( = ?auto_40673 ?auto_40675 ) ) ( not ( = ?auto_40674 ?auto_40675 ) ) ( not ( = ?auto_40677 ?auto_40675 ) ) ( not ( = ?auto_40676 ?auto_40675 ) ) ( HOLDING ?auto_40672 ) ( CLEAR ?auto_40673 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_40676 ?auto_40677 ?auto_40674 ?auto_40673 ?auto_40672 )
      ( MAKE-4PILE ?auto_40671 ?auto_40672 ?auto_40673 ?auto_40674 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_40678 - BLOCK
      ?auto_40679 - BLOCK
      ?auto_40680 - BLOCK
      ?auto_40681 - BLOCK
    )
    :vars
    (
      ?auto_40683 - BLOCK
      ?auto_40684 - BLOCK
      ?auto_40682 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_40678 ?auto_40679 ) ) ( not ( = ?auto_40678 ?auto_40680 ) ) ( not ( = ?auto_40678 ?auto_40681 ) ) ( not ( = ?auto_40679 ?auto_40680 ) ) ( not ( = ?auto_40679 ?auto_40681 ) ) ( not ( = ?auto_40680 ?auto_40681 ) ) ( ON ?auto_40681 ?auto_40683 ) ( not ( = ?auto_40678 ?auto_40683 ) ) ( not ( = ?auto_40679 ?auto_40683 ) ) ( not ( = ?auto_40680 ?auto_40683 ) ) ( not ( = ?auto_40681 ?auto_40683 ) ) ( ON ?auto_40680 ?auto_40681 ) ( ON-TABLE ?auto_40684 ) ( ON ?auto_40683 ?auto_40684 ) ( not ( = ?auto_40684 ?auto_40683 ) ) ( not ( = ?auto_40684 ?auto_40681 ) ) ( not ( = ?auto_40684 ?auto_40680 ) ) ( not ( = ?auto_40678 ?auto_40684 ) ) ( not ( = ?auto_40679 ?auto_40684 ) ) ( ON ?auto_40678 ?auto_40682 ) ( not ( = ?auto_40678 ?auto_40682 ) ) ( not ( = ?auto_40679 ?auto_40682 ) ) ( not ( = ?auto_40680 ?auto_40682 ) ) ( not ( = ?auto_40681 ?auto_40682 ) ) ( not ( = ?auto_40683 ?auto_40682 ) ) ( not ( = ?auto_40684 ?auto_40682 ) ) ( CLEAR ?auto_40680 ) ( ON ?auto_40679 ?auto_40678 ) ( CLEAR ?auto_40679 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_40682 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_40682 ?auto_40678 )
      ( MAKE-4PILE ?auto_40678 ?auto_40679 ?auto_40680 ?auto_40681 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_40685 - BLOCK
      ?auto_40686 - BLOCK
      ?auto_40687 - BLOCK
      ?auto_40688 - BLOCK
    )
    :vars
    (
      ?auto_40690 - BLOCK
      ?auto_40689 - BLOCK
      ?auto_40691 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_40685 ?auto_40686 ) ) ( not ( = ?auto_40685 ?auto_40687 ) ) ( not ( = ?auto_40685 ?auto_40688 ) ) ( not ( = ?auto_40686 ?auto_40687 ) ) ( not ( = ?auto_40686 ?auto_40688 ) ) ( not ( = ?auto_40687 ?auto_40688 ) ) ( ON ?auto_40688 ?auto_40690 ) ( not ( = ?auto_40685 ?auto_40690 ) ) ( not ( = ?auto_40686 ?auto_40690 ) ) ( not ( = ?auto_40687 ?auto_40690 ) ) ( not ( = ?auto_40688 ?auto_40690 ) ) ( ON-TABLE ?auto_40689 ) ( ON ?auto_40690 ?auto_40689 ) ( not ( = ?auto_40689 ?auto_40690 ) ) ( not ( = ?auto_40689 ?auto_40688 ) ) ( not ( = ?auto_40689 ?auto_40687 ) ) ( not ( = ?auto_40685 ?auto_40689 ) ) ( not ( = ?auto_40686 ?auto_40689 ) ) ( ON ?auto_40685 ?auto_40691 ) ( not ( = ?auto_40685 ?auto_40691 ) ) ( not ( = ?auto_40686 ?auto_40691 ) ) ( not ( = ?auto_40687 ?auto_40691 ) ) ( not ( = ?auto_40688 ?auto_40691 ) ) ( not ( = ?auto_40690 ?auto_40691 ) ) ( not ( = ?auto_40689 ?auto_40691 ) ) ( ON ?auto_40686 ?auto_40685 ) ( CLEAR ?auto_40686 ) ( ON-TABLE ?auto_40691 ) ( HOLDING ?auto_40687 ) ( CLEAR ?auto_40688 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_40689 ?auto_40690 ?auto_40688 ?auto_40687 )
      ( MAKE-4PILE ?auto_40685 ?auto_40686 ?auto_40687 ?auto_40688 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_40692 - BLOCK
      ?auto_40693 - BLOCK
      ?auto_40694 - BLOCK
      ?auto_40695 - BLOCK
    )
    :vars
    (
      ?auto_40697 - BLOCK
      ?auto_40698 - BLOCK
      ?auto_40696 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_40692 ?auto_40693 ) ) ( not ( = ?auto_40692 ?auto_40694 ) ) ( not ( = ?auto_40692 ?auto_40695 ) ) ( not ( = ?auto_40693 ?auto_40694 ) ) ( not ( = ?auto_40693 ?auto_40695 ) ) ( not ( = ?auto_40694 ?auto_40695 ) ) ( ON ?auto_40695 ?auto_40697 ) ( not ( = ?auto_40692 ?auto_40697 ) ) ( not ( = ?auto_40693 ?auto_40697 ) ) ( not ( = ?auto_40694 ?auto_40697 ) ) ( not ( = ?auto_40695 ?auto_40697 ) ) ( ON-TABLE ?auto_40698 ) ( ON ?auto_40697 ?auto_40698 ) ( not ( = ?auto_40698 ?auto_40697 ) ) ( not ( = ?auto_40698 ?auto_40695 ) ) ( not ( = ?auto_40698 ?auto_40694 ) ) ( not ( = ?auto_40692 ?auto_40698 ) ) ( not ( = ?auto_40693 ?auto_40698 ) ) ( ON ?auto_40692 ?auto_40696 ) ( not ( = ?auto_40692 ?auto_40696 ) ) ( not ( = ?auto_40693 ?auto_40696 ) ) ( not ( = ?auto_40694 ?auto_40696 ) ) ( not ( = ?auto_40695 ?auto_40696 ) ) ( not ( = ?auto_40697 ?auto_40696 ) ) ( not ( = ?auto_40698 ?auto_40696 ) ) ( ON ?auto_40693 ?auto_40692 ) ( ON-TABLE ?auto_40696 ) ( CLEAR ?auto_40695 ) ( ON ?auto_40694 ?auto_40693 ) ( CLEAR ?auto_40694 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_40696 ?auto_40692 ?auto_40693 )
      ( MAKE-4PILE ?auto_40692 ?auto_40693 ?auto_40694 ?auto_40695 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_40699 - BLOCK
      ?auto_40700 - BLOCK
      ?auto_40701 - BLOCK
      ?auto_40702 - BLOCK
    )
    :vars
    (
      ?auto_40704 - BLOCK
      ?auto_40703 - BLOCK
      ?auto_40705 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_40699 ?auto_40700 ) ) ( not ( = ?auto_40699 ?auto_40701 ) ) ( not ( = ?auto_40699 ?auto_40702 ) ) ( not ( = ?auto_40700 ?auto_40701 ) ) ( not ( = ?auto_40700 ?auto_40702 ) ) ( not ( = ?auto_40701 ?auto_40702 ) ) ( not ( = ?auto_40699 ?auto_40704 ) ) ( not ( = ?auto_40700 ?auto_40704 ) ) ( not ( = ?auto_40701 ?auto_40704 ) ) ( not ( = ?auto_40702 ?auto_40704 ) ) ( ON-TABLE ?auto_40703 ) ( ON ?auto_40704 ?auto_40703 ) ( not ( = ?auto_40703 ?auto_40704 ) ) ( not ( = ?auto_40703 ?auto_40702 ) ) ( not ( = ?auto_40703 ?auto_40701 ) ) ( not ( = ?auto_40699 ?auto_40703 ) ) ( not ( = ?auto_40700 ?auto_40703 ) ) ( ON ?auto_40699 ?auto_40705 ) ( not ( = ?auto_40699 ?auto_40705 ) ) ( not ( = ?auto_40700 ?auto_40705 ) ) ( not ( = ?auto_40701 ?auto_40705 ) ) ( not ( = ?auto_40702 ?auto_40705 ) ) ( not ( = ?auto_40704 ?auto_40705 ) ) ( not ( = ?auto_40703 ?auto_40705 ) ) ( ON ?auto_40700 ?auto_40699 ) ( ON-TABLE ?auto_40705 ) ( ON ?auto_40701 ?auto_40700 ) ( CLEAR ?auto_40701 ) ( HOLDING ?auto_40702 ) ( CLEAR ?auto_40704 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_40703 ?auto_40704 ?auto_40702 )
      ( MAKE-4PILE ?auto_40699 ?auto_40700 ?auto_40701 ?auto_40702 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_40706 - BLOCK
      ?auto_40707 - BLOCK
      ?auto_40708 - BLOCK
      ?auto_40709 - BLOCK
    )
    :vars
    (
      ?auto_40712 - BLOCK
      ?auto_40711 - BLOCK
      ?auto_40710 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_40706 ?auto_40707 ) ) ( not ( = ?auto_40706 ?auto_40708 ) ) ( not ( = ?auto_40706 ?auto_40709 ) ) ( not ( = ?auto_40707 ?auto_40708 ) ) ( not ( = ?auto_40707 ?auto_40709 ) ) ( not ( = ?auto_40708 ?auto_40709 ) ) ( not ( = ?auto_40706 ?auto_40712 ) ) ( not ( = ?auto_40707 ?auto_40712 ) ) ( not ( = ?auto_40708 ?auto_40712 ) ) ( not ( = ?auto_40709 ?auto_40712 ) ) ( ON-TABLE ?auto_40711 ) ( ON ?auto_40712 ?auto_40711 ) ( not ( = ?auto_40711 ?auto_40712 ) ) ( not ( = ?auto_40711 ?auto_40709 ) ) ( not ( = ?auto_40711 ?auto_40708 ) ) ( not ( = ?auto_40706 ?auto_40711 ) ) ( not ( = ?auto_40707 ?auto_40711 ) ) ( ON ?auto_40706 ?auto_40710 ) ( not ( = ?auto_40706 ?auto_40710 ) ) ( not ( = ?auto_40707 ?auto_40710 ) ) ( not ( = ?auto_40708 ?auto_40710 ) ) ( not ( = ?auto_40709 ?auto_40710 ) ) ( not ( = ?auto_40712 ?auto_40710 ) ) ( not ( = ?auto_40711 ?auto_40710 ) ) ( ON ?auto_40707 ?auto_40706 ) ( ON-TABLE ?auto_40710 ) ( ON ?auto_40708 ?auto_40707 ) ( CLEAR ?auto_40712 ) ( ON ?auto_40709 ?auto_40708 ) ( CLEAR ?auto_40709 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_40710 ?auto_40706 ?auto_40707 ?auto_40708 )
      ( MAKE-4PILE ?auto_40706 ?auto_40707 ?auto_40708 ?auto_40709 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_40713 - BLOCK
      ?auto_40714 - BLOCK
      ?auto_40715 - BLOCK
      ?auto_40716 - BLOCK
    )
    :vars
    (
      ?auto_40719 - BLOCK
      ?auto_40717 - BLOCK
      ?auto_40718 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_40713 ?auto_40714 ) ) ( not ( = ?auto_40713 ?auto_40715 ) ) ( not ( = ?auto_40713 ?auto_40716 ) ) ( not ( = ?auto_40714 ?auto_40715 ) ) ( not ( = ?auto_40714 ?auto_40716 ) ) ( not ( = ?auto_40715 ?auto_40716 ) ) ( not ( = ?auto_40713 ?auto_40719 ) ) ( not ( = ?auto_40714 ?auto_40719 ) ) ( not ( = ?auto_40715 ?auto_40719 ) ) ( not ( = ?auto_40716 ?auto_40719 ) ) ( ON-TABLE ?auto_40717 ) ( not ( = ?auto_40717 ?auto_40719 ) ) ( not ( = ?auto_40717 ?auto_40716 ) ) ( not ( = ?auto_40717 ?auto_40715 ) ) ( not ( = ?auto_40713 ?auto_40717 ) ) ( not ( = ?auto_40714 ?auto_40717 ) ) ( ON ?auto_40713 ?auto_40718 ) ( not ( = ?auto_40713 ?auto_40718 ) ) ( not ( = ?auto_40714 ?auto_40718 ) ) ( not ( = ?auto_40715 ?auto_40718 ) ) ( not ( = ?auto_40716 ?auto_40718 ) ) ( not ( = ?auto_40719 ?auto_40718 ) ) ( not ( = ?auto_40717 ?auto_40718 ) ) ( ON ?auto_40714 ?auto_40713 ) ( ON-TABLE ?auto_40718 ) ( ON ?auto_40715 ?auto_40714 ) ( ON ?auto_40716 ?auto_40715 ) ( CLEAR ?auto_40716 ) ( HOLDING ?auto_40719 ) ( CLEAR ?auto_40717 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_40717 ?auto_40719 )
      ( MAKE-4PILE ?auto_40713 ?auto_40714 ?auto_40715 ?auto_40716 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_40720 - BLOCK
      ?auto_40721 - BLOCK
      ?auto_40722 - BLOCK
      ?auto_40723 - BLOCK
    )
    :vars
    (
      ?auto_40726 - BLOCK
      ?auto_40725 - BLOCK
      ?auto_40724 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_40720 ?auto_40721 ) ) ( not ( = ?auto_40720 ?auto_40722 ) ) ( not ( = ?auto_40720 ?auto_40723 ) ) ( not ( = ?auto_40721 ?auto_40722 ) ) ( not ( = ?auto_40721 ?auto_40723 ) ) ( not ( = ?auto_40722 ?auto_40723 ) ) ( not ( = ?auto_40720 ?auto_40726 ) ) ( not ( = ?auto_40721 ?auto_40726 ) ) ( not ( = ?auto_40722 ?auto_40726 ) ) ( not ( = ?auto_40723 ?auto_40726 ) ) ( ON-TABLE ?auto_40725 ) ( not ( = ?auto_40725 ?auto_40726 ) ) ( not ( = ?auto_40725 ?auto_40723 ) ) ( not ( = ?auto_40725 ?auto_40722 ) ) ( not ( = ?auto_40720 ?auto_40725 ) ) ( not ( = ?auto_40721 ?auto_40725 ) ) ( ON ?auto_40720 ?auto_40724 ) ( not ( = ?auto_40720 ?auto_40724 ) ) ( not ( = ?auto_40721 ?auto_40724 ) ) ( not ( = ?auto_40722 ?auto_40724 ) ) ( not ( = ?auto_40723 ?auto_40724 ) ) ( not ( = ?auto_40726 ?auto_40724 ) ) ( not ( = ?auto_40725 ?auto_40724 ) ) ( ON ?auto_40721 ?auto_40720 ) ( ON-TABLE ?auto_40724 ) ( ON ?auto_40722 ?auto_40721 ) ( ON ?auto_40723 ?auto_40722 ) ( CLEAR ?auto_40725 ) ( ON ?auto_40726 ?auto_40723 ) ( CLEAR ?auto_40726 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_40724 ?auto_40720 ?auto_40721 ?auto_40722 ?auto_40723 )
      ( MAKE-4PILE ?auto_40720 ?auto_40721 ?auto_40722 ?auto_40723 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_40727 - BLOCK
      ?auto_40728 - BLOCK
      ?auto_40729 - BLOCK
      ?auto_40730 - BLOCK
    )
    :vars
    (
      ?auto_40731 - BLOCK
      ?auto_40732 - BLOCK
      ?auto_40733 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_40727 ?auto_40728 ) ) ( not ( = ?auto_40727 ?auto_40729 ) ) ( not ( = ?auto_40727 ?auto_40730 ) ) ( not ( = ?auto_40728 ?auto_40729 ) ) ( not ( = ?auto_40728 ?auto_40730 ) ) ( not ( = ?auto_40729 ?auto_40730 ) ) ( not ( = ?auto_40727 ?auto_40731 ) ) ( not ( = ?auto_40728 ?auto_40731 ) ) ( not ( = ?auto_40729 ?auto_40731 ) ) ( not ( = ?auto_40730 ?auto_40731 ) ) ( not ( = ?auto_40732 ?auto_40731 ) ) ( not ( = ?auto_40732 ?auto_40730 ) ) ( not ( = ?auto_40732 ?auto_40729 ) ) ( not ( = ?auto_40727 ?auto_40732 ) ) ( not ( = ?auto_40728 ?auto_40732 ) ) ( ON ?auto_40727 ?auto_40733 ) ( not ( = ?auto_40727 ?auto_40733 ) ) ( not ( = ?auto_40728 ?auto_40733 ) ) ( not ( = ?auto_40729 ?auto_40733 ) ) ( not ( = ?auto_40730 ?auto_40733 ) ) ( not ( = ?auto_40731 ?auto_40733 ) ) ( not ( = ?auto_40732 ?auto_40733 ) ) ( ON ?auto_40728 ?auto_40727 ) ( ON-TABLE ?auto_40733 ) ( ON ?auto_40729 ?auto_40728 ) ( ON ?auto_40730 ?auto_40729 ) ( ON ?auto_40731 ?auto_40730 ) ( CLEAR ?auto_40731 ) ( HOLDING ?auto_40732 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_40732 )
      ( MAKE-4PILE ?auto_40727 ?auto_40728 ?auto_40729 ?auto_40730 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_40734 - BLOCK
      ?auto_40735 - BLOCK
      ?auto_40736 - BLOCK
      ?auto_40737 - BLOCK
    )
    :vars
    (
      ?auto_40738 - BLOCK
      ?auto_40739 - BLOCK
      ?auto_40740 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_40734 ?auto_40735 ) ) ( not ( = ?auto_40734 ?auto_40736 ) ) ( not ( = ?auto_40734 ?auto_40737 ) ) ( not ( = ?auto_40735 ?auto_40736 ) ) ( not ( = ?auto_40735 ?auto_40737 ) ) ( not ( = ?auto_40736 ?auto_40737 ) ) ( not ( = ?auto_40734 ?auto_40738 ) ) ( not ( = ?auto_40735 ?auto_40738 ) ) ( not ( = ?auto_40736 ?auto_40738 ) ) ( not ( = ?auto_40737 ?auto_40738 ) ) ( not ( = ?auto_40739 ?auto_40738 ) ) ( not ( = ?auto_40739 ?auto_40737 ) ) ( not ( = ?auto_40739 ?auto_40736 ) ) ( not ( = ?auto_40734 ?auto_40739 ) ) ( not ( = ?auto_40735 ?auto_40739 ) ) ( ON ?auto_40734 ?auto_40740 ) ( not ( = ?auto_40734 ?auto_40740 ) ) ( not ( = ?auto_40735 ?auto_40740 ) ) ( not ( = ?auto_40736 ?auto_40740 ) ) ( not ( = ?auto_40737 ?auto_40740 ) ) ( not ( = ?auto_40738 ?auto_40740 ) ) ( not ( = ?auto_40739 ?auto_40740 ) ) ( ON ?auto_40735 ?auto_40734 ) ( ON-TABLE ?auto_40740 ) ( ON ?auto_40736 ?auto_40735 ) ( ON ?auto_40737 ?auto_40736 ) ( ON ?auto_40738 ?auto_40737 ) ( ON ?auto_40739 ?auto_40738 ) ( CLEAR ?auto_40739 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_40740 ?auto_40734 ?auto_40735 ?auto_40736 ?auto_40737 ?auto_40738 )
      ( MAKE-4PILE ?auto_40734 ?auto_40735 ?auto_40736 ?auto_40737 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_40742 - BLOCK
    )
    :vars
    (
      ?auto_40743 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_40743 ?auto_40742 ) ( CLEAR ?auto_40743 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_40742 ) ( not ( = ?auto_40742 ?auto_40743 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_40743 ?auto_40742 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_40744 - BLOCK
    )
    :vars
    (
      ?auto_40745 - BLOCK
      ?auto_40746 - BLOCK
      ?auto_40747 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_40745 ?auto_40744 ) ( CLEAR ?auto_40745 ) ( ON-TABLE ?auto_40744 ) ( not ( = ?auto_40744 ?auto_40745 ) ) ( HOLDING ?auto_40746 ) ( CLEAR ?auto_40747 ) ( not ( = ?auto_40744 ?auto_40746 ) ) ( not ( = ?auto_40744 ?auto_40747 ) ) ( not ( = ?auto_40745 ?auto_40746 ) ) ( not ( = ?auto_40745 ?auto_40747 ) ) ( not ( = ?auto_40746 ?auto_40747 ) ) )
    :subtasks
    ( ( !STACK ?auto_40746 ?auto_40747 )
      ( MAKE-1PILE ?auto_40744 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_40748 - BLOCK
    )
    :vars
    (
      ?auto_40751 - BLOCK
      ?auto_40749 - BLOCK
      ?auto_40750 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_40751 ?auto_40748 ) ( ON-TABLE ?auto_40748 ) ( not ( = ?auto_40748 ?auto_40751 ) ) ( CLEAR ?auto_40749 ) ( not ( = ?auto_40748 ?auto_40750 ) ) ( not ( = ?auto_40748 ?auto_40749 ) ) ( not ( = ?auto_40751 ?auto_40750 ) ) ( not ( = ?auto_40751 ?auto_40749 ) ) ( not ( = ?auto_40750 ?auto_40749 ) ) ( ON ?auto_40750 ?auto_40751 ) ( CLEAR ?auto_40750 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_40748 ?auto_40751 )
      ( MAKE-1PILE ?auto_40748 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_40752 - BLOCK
    )
    :vars
    (
      ?auto_40755 - BLOCK
      ?auto_40753 - BLOCK
      ?auto_40754 - BLOCK
      ?auto_40756 - BLOCK
      ?auto_40757 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_40755 ?auto_40752 ) ( ON-TABLE ?auto_40752 ) ( not ( = ?auto_40752 ?auto_40755 ) ) ( not ( = ?auto_40752 ?auto_40753 ) ) ( not ( = ?auto_40752 ?auto_40754 ) ) ( not ( = ?auto_40755 ?auto_40753 ) ) ( not ( = ?auto_40755 ?auto_40754 ) ) ( not ( = ?auto_40753 ?auto_40754 ) ) ( ON ?auto_40753 ?auto_40755 ) ( CLEAR ?auto_40753 ) ( HOLDING ?auto_40754 ) ( CLEAR ?auto_40756 ) ( ON-TABLE ?auto_40757 ) ( ON ?auto_40756 ?auto_40757 ) ( not ( = ?auto_40757 ?auto_40756 ) ) ( not ( = ?auto_40757 ?auto_40754 ) ) ( not ( = ?auto_40756 ?auto_40754 ) ) ( not ( = ?auto_40752 ?auto_40756 ) ) ( not ( = ?auto_40752 ?auto_40757 ) ) ( not ( = ?auto_40755 ?auto_40756 ) ) ( not ( = ?auto_40755 ?auto_40757 ) ) ( not ( = ?auto_40753 ?auto_40756 ) ) ( not ( = ?auto_40753 ?auto_40757 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_40757 ?auto_40756 ?auto_40754 )
      ( MAKE-1PILE ?auto_40752 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_40758 - BLOCK
    )
    :vars
    (
      ?auto_40761 - BLOCK
      ?auto_40762 - BLOCK
      ?auto_40760 - BLOCK
      ?auto_40763 - BLOCK
      ?auto_40759 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_40761 ?auto_40758 ) ( ON-TABLE ?auto_40758 ) ( not ( = ?auto_40758 ?auto_40761 ) ) ( not ( = ?auto_40758 ?auto_40762 ) ) ( not ( = ?auto_40758 ?auto_40760 ) ) ( not ( = ?auto_40761 ?auto_40762 ) ) ( not ( = ?auto_40761 ?auto_40760 ) ) ( not ( = ?auto_40762 ?auto_40760 ) ) ( ON ?auto_40762 ?auto_40761 ) ( CLEAR ?auto_40763 ) ( ON-TABLE ?auto_40759 ) ( ON ?auto_40763 ?auto_40759 ) ( not ( = ?auto_40759 ?auto_40763 ) ) ( not ( = ?auto_40759 ?auto_40760 ) ) ( not ( = ?auto_40763 ?auto_40760 ) ) ( not ( = ?auto_40758 ?auto_40763 ) ) ( not ( = ?auto_40758 ?auto_40759 ) ) ( not ( = ?auto_40761 ?auto_40763 ) ) ( not ( = ?auto_40761 ?auto_40759 ) ) ( not ( = ?auto_40762 ?auto_40763 ) ) ( not ( = ?auto_40762 ?auto_40759 ) ) ( ON ?auto_40760 ?auto_40762 ) ( CLEAR ?auto_40760 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_40758 ?auto_40761 ?auto_40762 )
      ( MAKE-1PILE ?auto_40758 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_40764 - BLOCK
    )
    :vars
    (
      ?auto_40769 - BLOCK
      ?auto_40768 - BLOCK
      ?auto_40767 - BLOCK
      ?auto_40765 - BLOCK
      ?auto_40766 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_40769 ?auto_40764 ) ( ON-TABLE ?auto_40764 ) ( not ( = ?auto_40764 ?auto_40769 ) ) ( not ( = ?auto_40764 ?auto_40768 ) ) ( not ( = ?auto_40764 ?auto_40767 ) ) ( not ( = ?auto_40769 ?auto_40768 ) ) ( not ( = ?auto_40769 ?auto_40767 ) ) ( not ( = ?auto_40768 ?auto_40767 ) ) ( ON ?auto_40768 ?auto_40769 ) ( ON-TABLE ?auto_40765 ) ( not ( = ?auto_40765 ?auto_40766 ) ) ( not ( = ?auto_40765 ?auto_40767 ) ) ( not ( = ?auto_40766 ?auto_40767 ) ) ( not ( = ?auto_40764 ?auto_40766 ) ) ( not ( = ?auto_40764 ?auto_40765 ) ) ( not ( = ?auto_40769 ?auto_40766 ) ) ( not ( = ?auto_40769 ?auto_40765 ) ) ( not ( = ?auto_40768 ?auto_40766 ) ) ( not ( = ?auto_40768 ?auto_40765 ) ) ( ON ?auto_40767 ?auto_40768 ) ( CLEAR ?auto_40767 ) ( HOLDING ?auto_40766 ) ( CLEAR ?auto_40765 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_40765 ?auto_40766 )
      ( MAKE-1PILE ?auto_40764 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_40770 - BLOCK
    )
    :vars
    (
      ?auto_40774 - BLOCK
      ?auto_40773 - BLOCK
      ?auto_40772 - BLOCK
      ?auto_40775 - BLOCK
      ?auto_40771 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_40774 ?auto_40770 ) ( ON-TABLE ?auto_40770 ) ( not ( = ?auto_40770 ?auto_40774 ) ) ( not ( = ?auto_40770 ?auto_40773 ) ) ( not ( = ?auto_40770 ?auto_40772 ) ) ( not ( = ?auto_40774 ?auto_40773 ) ) ( not ( = ?auto_40774 ?auto_40772 ) ) ( not ( = ?auto_40773 ?auto_40772 ) ) ( ON ?auto_40773 ?auto_40774 ) ( ON-TABLE ?auto_40775 ) ( not ( = ?auto_40775 ?auto_40771 ) ) ( not ( = ?auto_40775 ?auto_40772 ) ) ( not ( = ?auto_40771 ?auto_40772 ) ) ( not ( = ?auto_40770 ?auto_40771 ) ) ( not ( = ?auto_40770 ?auto_40775 ) ) ( not ( = ?auto_40774 ?auto_40771 ) ) ( not ( = ?auto_40774 ?auto_40775 ) ) ( not ( = ?auto_40773 ?auto_40771 ) ) ( not ( = ?auto_40773 ?auto_40775 ) ) ( ON ?auto_40772 ?auto_40773 ) ( CLEAR ?auto_40775 ) ( ON ?auto_40771 ?auto_40772 ) ( CLEAR ?auto_40771 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_40770 ?auto_40774 ?auto_40773 ?auto_40772 )
      ( MAKE-1PILE ?auto_40770 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_40776 - BLOCK
    )
    :vars
    (
      ?auto_40780 - BLOCK
      ?auto_40779 - BLOCK
      ?auto_40781 - BLOCK
      ?auto_40778 - BLOCK
      ?auto_40777 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_40780 ?auto_40776 ) ( ON-TABLE ?auto_40776 ) ( not ( = ?auto_40776 ?auto_40780 ) ) ( not ( = ?auto_40776 ?auto_40779 ) ) ( not ( = ?auto_40776 ?auto_40781 ) ) ( not ( = ?auto_40780 ?auto_40779 ) ) ( not ( = ?auto_40780 ?auto_40781 ) ) ( not ( = ?auto_40779 ?auto_40781 ) ) ( ON ?auto_40779 ?auto_40780 ) ( not ( = ?auto_40778 ?auto_40777 ) ) ( not ( = ?auto_40778 ?auto_40781 ) ) ( not ( = ?auto_40777 ?auto_40781 ) ) ( not ( = ?auto_40776 ?auto_40777 ) ) ( not ( = ?auto_40776 ?auto_40778 ) ) ( not ( = ?auto_40780 ?auto_40777 ) ) ( not ( = ?auto_40780 ?auto_40778 ) ) ( not ( = ?auto_40779 ?auto_40777 ) ) ( not ( = ?auto_40779 ?auto_40778 ) ) ( ON ?auto_40781 ?auto_40779 ) ( ON ?auto_40777 ?auto_40781 ) ( CLEAR ?auto_40777 ) ( HOLDING ?auto_40778 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_40778 )
      ( MAKE-1PILE ?auto_40776 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_40782 - BLOCK
    )
    :vars
    (
      ?auto_40786 - BLOCK
      ?auto_40784 - BLOCK
      ?auto_40787 - BLOCK
      ?auto_40785 - BLOCK
      ?auto_40783 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_40786 ?auto_40782 ) ( ON-TABLE ?auto_40782 ) ( not ( = ?auto_40782 ?auto_40786 ) ) ( not ( = ?auto_40782 ?auto_40784 ) ) ( not ( = ?auto_40782 ?auto_40787 ) ) ( not ( = ?auto_40786 ?auto_40784 ) ) ( not ( = ?auto_40786 ?auto_40787 ) ) ( not ( = ?auto_40784 ?auto_40787 ) ) ( ON ?auto_40784 ?auto_40786 ) ( not ( = ?auto_40785 ?auto_40783 ) ) ( not ( = ?auto_40785 ?auto_40787 ) ) ( not ( = ?auto_40783 ?auto_40787 ) ) ( not ( = ?auto_40782 ?auto_40783 ) ) ( not ( = ?auto_40782 ?auto_40785 ) ) ( not ( = ?auto_40786 ?auto_40783 ) ) ( not ( = ?auto_40786 ?auto_40785 ) ) ( not ( = ?auto_40784 ?auto_40783 ) ) ( not ( = ?auto_40784 ?auto_40785 ) ) ( ON ?auto_40787 ?auto_40784 ) ( ON ?auto_40783 ?auto_40787 ) ( ON ?auto_40785 ?auto_40783 ) ( CLEAR ?auto_40785 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_40782 ?auto_40786 ?auto_40784 ?auto_40787 ?auto_40783 )
      ( MAKE-1PILE ?auto_40782 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_40788 - BLOCK
    )
    :vars
    (
      ?auto_40791 - BLOCK
      ?auto_40792 - BLOCK
      ?auto_40789 - BLOCK
      ?auto_40790 - BLOCK
      ?auto_40793 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_40791 ?auto_40788 ) ( ON-TABLE ?auto_40788 ) ( not ( = ?auto_40788 ?auto_40791 ) ) ( not ( = ?auto_40788 ?auto_40792 ) ) ( not ( = ?auto_40788 ?auto_40789 ) ) ( not ( = ?auto_40791 ?auto_40792 ) ) ( not ( = ?auto_40791 ?auto_40789 ) ) ( not ( = ?auto_40792 ?auto_40789 ) ) ( ON ?auto_40792 ?auto_40791 ) ( not ( = ?auto_40790 ?auto_40793 ) ) ( not ( = ?auto_40790 ?auto_40789 ) ) ( not ( = ?auto_40793 ?auto_40789 ) ) ( not ( = ?auto_40788 ?auto_40793 ) ) ( not ( = ?auto_40788 ?auto_40790 ) ) ( not ( = ?auto_40791 ?auto_40793 ) ) ( not ( = ?auto_40791 ?auto_40790 ) ) ( not ( = ?auto_40792 ?auto_40793 ) ) ( not ( = ?auto_40792 ?auto_40790 ) ) ( ON ?auto_40789 ?auto_40792 ) ( ON ?auto_40793 ?auto_40789 ) ( HOLDING ?auto_40790 ) ( CLEAR ?auto_40793 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_40788 ?auto_40791 ?auto_40792 ?auto_40789 ?auto_40793 ?auto_40790 )
      ( MAKE-1PILE ?auto_40788 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_40794 - BLOCK
    )
    :vars
    (
      ?auto_40795 - BLOCK
      ?auto_40796 - BLOCK
      ?auto_40799 - BLOCK
      ?auto_40798 - BLOCK
      ?auto_40797 - BLOCK
      ?auto_40800 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_40795 ?auto_40794 ) ( ON-TABLE ?auto_40794 ) ( not ( = ?auto_40794 ?auto_40795 ) ) ( not ( = ?auto_40794 ?auto_40796 ) ) ( not ( = ?auto_40794 ?auto_40799 ) ) ( not ( = ?auto_40795 ?auto_40796 ) ) ( not ( = ?auto_40795 ?auto_40799 ) ) ( not ( = ?auto_40796 ?auto_40799 ) ) ( ON ?auto_40796 ?auto_40795 ) ( not ( = ?auto_40798 ?auto_40797 ) ) ( not ( = ?auto_40798 ?auto_40799 ) ) ( not ( = ?auto_40797 ?auto_40799 ) ) ( not ( = ?auto_40794 ?auto_40797 ) ) ( not ( = ?auto_40794 ?auto_40798 ) ) ( not ( = ?auto_40795 ?auto_40797 ) ) ( not ( = ?auto_40795 ?auto_40798 ) ) ( not ( = ?auto_40796 ?auto_40797 ) ) ( not ( = ?auto_40796 ?auto_40798 ) ) ( ON ?auto_40799 ?auto_40796 ) ( ON ?auto_40797 ?auto_40799 ) ( CLEAR ?auto_40797 ) ( ON ?auto_40798 ?auto_40800 ) ( CLEAR ?auto_40798 ) ( HAND-EMPTY ) ( not ( = ?auto_40794 ?auto_40800 ) ) ( not ( = ?auto_40795 ?auto_40800 ) ) ( not ( = ?auto_40796 ?auto_40800 ) ) ( not ( = ?auto_40799 ?auto_40800 ) ) ( not ( = ?auto_40798 ?auto_40800 ) ) ( not ( = ?auto_40797 ?auto_40800 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_40798 ?auto_40800 )
      ( MAKE-1PILE ?auto_40794 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_40801 - BLOCK
    )
    :vars
    (
      ?auto_40806 - BLOCK
      ?auto_40805 - BLOCK
      ?auto_40803 - BLOCK
      ?auto_40802 - BLOCK
      ?auto_40804 - BLOCK
      ?auto_40807 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_40806 ?auto_40801 ) ( ON-TABLE ?auto_40801 ) ( not ( = ?auto_40801 ?auto_40806 ) ) ( not ( = ?auto_40801 ?auto_40805 ) ) ( not ( = ?auto_40801 ?auto_40803 ) ) ( not ( = ?auto_40806 ?auto_40805 ) ) ( not ( = ?auto_40806 ?auto_40803 ) ) ( not ( = ?auto_40805 ?auto_40803 ) ) ( ON ?auto_40805 ?auto_40806 ) ( not ( = ?auto_40802 ?auto_40804 ) ) ( not ( = ?auto_40802 ?auto_40803 ) ) ( not ( = ?auto_40804 ?auto_40803 ) ) ( not ( = ?auto_40801 ?auto_40804 ) ) ( not ( = ?auto_40801 ?auto_40802 ) ) ( not ( = ?auto_40806 ?auto_40804 ) ) ( not ( = ?auto_40806 ?auto_40802 ) ) ( not ( = ?auto_40805 ?auto_40804 ) ) ( not ( = ?auto_40805 ?auto_40802 ) ) ( ON ?auto_40803 ?auto_40805 ) ( ON ?auto_40802 ?auto_40807 ) ( CLEAR ?auto_40802 ) ( not ( = ?auto_40801 ?auto_40807 ) ) ( not ( = ?auto_40806 ?auto_40807 ) ) ( not ( = ?auto_40805 ?auto_40807 ) ) ( not ( = ?auto_40803 ?auto_40807 ) ) ( not ( = ?auto_40802 ?auto_40807 ) ) ( not ( = ?auto_40804 ?auto_40807 ) ) ( HOLDING ?auto_40804 ) ( CLEAR ?auto_40803 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_40801 ?auto_40806 ?auto_40805 ?auto_40803 ?auto_40804 )
      ( MAKE-1PILE ?auto_40801 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_40808 - BLOCK
    )
    :vars
    (
      ?auto_40814 - BLOCK
      ?auto_40813 - BLOCK
      ?auto_40812 - BLOCK
      ?auto_40809 - BLOCK
      ?auto_40811 - BLOCK
      ?auto_40810 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_40814 ?auto_40808 ) ( ON-TABLE ?auto_40808 ) ( not ( = ?auto_40808 ?auto_40814 ) ) ( not ( = ?auto_40808 ?auto_40813 ) ) ( not ( = ?auto_40808 ?auto_40812 ) ) ( not ( = ?auto_40814 ?auto_40813 ) ) ( not ( = ?auto_40814 ?auto_40812 ) ) ( not ( = ?auto_40813 ?auto_40812 ) ) ( ON ?auto_40813 ?auto_40814 ) ( not ( = ?auto_40809 ?auto_40811 ) ) ( not ( = ?auto_40809 ?auto_40812 ) ) ( not ( = ?auto_40811 ?auto_40812 ) ) ( not ( = ?auto_40808 ?auto_40811 ) ) ( not ( = ?auto_40808 ?auto_40809 ) ) ( not ( = ?auto_40814 ?auto_40811 ) ) ( not ( = ?auto_40814 ?auto_40809 ) ) ( not ( = ?auto_40813 ?auto_40811 ) ) ( not ( = ?auto_40813 ?auto_40809 ) ) ( ON ?auto_40812 ?auto_40813 ) ( ON ?auto_40809 ?auto_40810 ) ( not ( = ?auto_40808 ?auto_40810 ) ) ( not ( = ?auto_40814 ?auto_40810 ) ) ( not ( = ?auto_40813 ?auto_40810 ) ) ( not ( = ?auto_40812 ?auto_40810 ) ) ( not ( = ?auto_40809 ?auto_40810 ) ) ( not ( = ?auto_40811 ?auto_40810 ) ) ( CLEAR ?auto_40812 ) ( ON ?auto_40811 ?auto_40809 ) ( CLEAR ?auto_40811 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_40810 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_40810 ?auto_40809 )
      ( MAKE-1PILE ?auto_40808 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_40815 - BLOCK
    )
    :vars
    (
      ?auto_40821 - BLOCK
      ?auto_40816 - BLOCK
      ?auto_40819 - BLOCK
      ?auto_40820 - BLOCK
      ?auto_40817 - BLOCK
      ?auto_40818 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_40821 ?auto_40815 ) ( ON-TABLE ?auto_40815 ) ( not ( = ?auto_40815 ?auto_40821 ) ) ( not ( = ?auto_40815 ?auto_40816 ) ) ( not ( = ?auto_40815 ?auto_40819 ) ) ( not ( = ?auto_40821 ?auto_40816 ) ) ( not ( = ?auto_40821 ?auto_40819 ) ) ( not ( = ?auto_40816 ?auto_40819 ) ) ( ON ?auto_40816 ?auto_40821 ) ( not ( = ?auto_40820 ?auto_40817 ) ) ( not ( = ?auto_40820 ?auto_40819 ) ) ( not ( = ?auto_40817 ?auto_40819 ) ) ( not ( = ?auto_40815 ?auto_40817 ) ) ( not ( = ?auto_40815 ?auto_40820 ) ) ( not ( = ?auto_40821 ?auto_40817 ) ) ( not ( = ?auto_40821 ?auto_40820 ) ) ( not ( = ?auto_40816 ?auto_40817 ) ) ( not ( = ?auto_40816 ?auto_40820 ) ) ( ON ?auto_40820 ?auto_40818 ) ( not ( = ?auto_40815 ?auto_40818 ) ) ( not ( = ?auto_40821 ?auto_40818 ) ) ( not ( = ?auto_40816 ?auto_40818 ) ) ( not ( = ?auto_40819 ?auto_40818 ) ) ( not ( = ?auto_40820 ?auto_40818 ) ) ( not ( = ?auto_40817 ?auto_40818 ) ) ( ON ?auto_40817 ?auto_40820 ) ( CLEAR ?auto_40817 ) ( ON-TABLE ?auto_40818 ) ( HOLDING ?auto_40819 ) ( CLEAR ?auto_40816 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_40815 ?auto_40821 ?auto_40816 ?auto_40819 )
      ( MAKE-1PILE ?auto_40815 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_40822 - BLOCK
    )
    :vars
    (
      ?auto_40823 - BLOCK
      ?auto_40827 - BLOCK
      ?auto_40826 - BLOCK
      ?auto_40828 - BLOCK
      ?auto_40824 - BLOCK
      ?auto_40825 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_40823 ?auto_40822 ) ( ON-TABLE ?auto_40822 ) ( not ( = ?auto_40822 ?auto_40823 ) ) ( not ( = ?auto_40822 ?auto_40827 ) ) ( not ( = ?auto_40822 ?auto_40826 ) ) ( not ( = ?auto_40823 ?auto_40827 ) ) ( not ( = ?auto_40823 ?auto_40826 ) ) ( not ( = ?auto_40827 ?auto_40826 ) ) ( ON ?auto_40827 ?auto_40823 ) ( not ( = ?auto_40828 ?auto_40824 ) ) ( not ( = ?auto_40828 ?auto_40826 ) ) ( not ( = ?auto_40824 ?auto_40826 ) ) ( not ( = ?auto_40822 ?auto_40824 ) ) ( not ( = ?auto_40822 ?auto_40828 ) ) ( not ( = ?auto_40823 ?auto_40824 ) ) ( not ( = ?auto_40823 ?auto_40828 ) ) ( not ( = ?auto_40827 ?auto_40824 ) ) ( not ( = ?auto_40827 ?auto_40828 ) ) ( ON ?auto_40828 ?auto_40825 ) ( not ( = ?auto_40822 ?auto_40825 ) ) ( not ( = ?auto_40823 ?auto_40825 ) ) ( not ( = ?auto_40827 ?auto_40825 ) ) ( not ( = ?auto_40826 ?auto_40825 ) ) ( not ( = ?auto_40828 ?auto_40825 ) ) ( not ( = ?auto_40824 ?auto_40825 ) ) ( ON ?auto_40824 ?auto_40828 ) ( ON-TABLE ?auto_40825 ) ( CLEAR ?auto_40827 ) ( ON ?auto_40826 ?auto_40824 ) ( CLEAR ?auto_40826 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_40825 ?auto_40828 ?auto_40824 )
      ( MAKE-1PILE ?auto_40822 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_40829 - BLOCK
    )
    :vars
    (
      ?auto_40835 - BLOCK
      ?auto_40830 - BLOCK
      ?auto_40832 - BLOCK
      ?auto_40833 - BLOCK
      ?auto_40831 - BLOCK
      ?auto_40834 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_40835 ?auto_40829 ) ( ON-TABLE ?auto_40829 ) ( not ( = ?auto_40829 ?auto_40835 ) ) ( not ( = ?auto_40829 ?auto_40830 ) ) ( not ( = ?auto_40829 ?auto_40832 ) ) ( not ( = ?auto_40835 ?auto_40830 ) ) ( not ( = ?auto_40835 ?auto_40832 ) ) ( not ( = ?auto_40830 ?auto_40832 ) ) ( not ( = ?auto_40833 ?auto_40831 ) ) ( not ( = ?auto_40833 ?auto_40832 ) ) ( not ( = ?auto_40831 ?auto_40832 ) ) ( not ( = ?auto_40829 ?auto_40831 ) ) ( not ( = ?auto_40829 ?auto_40833 ) ) ( not ( = ?auto_40835 ?auto_40831 ) ) ( not ( = ?auto_40835 ?auto_40833 ) ) ( not ( = ?auto_40830 ?auto_40831 ) ) ( not ( = ?auto_40830 ?auto_40833 ) ) ( ON ?auto_40833 ?auto_40834 ) ( not ( = ?auto_40829 ?auto_40834 ) ) ( not ( = ?auto_40835 ?auto_40834 ) ) ( not ( = ?auto_40830 ?auto_40834 ) ) ( not ( = ?auto_40832 ?auto_40834 ) ) ( not ( = ?auto_40833 ?auto_40834 ) ) ( not ( = ?auto_40831 ?auto_40834 ) ) ( ON ?auto_40831 ?auto_40833 ) ( ON-TABLE ?auto_40834 ) ( ON ?auto_40832 ?auto_40831 ) ( CLEAR ?auto_40832 ) ( HOLDING ?auto_40830 ) ( CLEAR ?auto_40835 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_40829 ?auto_40835 ?auto_40830 )
      ( MAKE-1PILE ?auto_40829 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_40836 - BLOCK
    )
    :vars
    (
      ?auto_40838 - BLOCK
      ?auto_40837 - BLOCK
      ?auto_40839 - BLOCK
      ?auto_40841 - BLOCK
      ?auto_40840 - BLOCK
      ?auto_40842 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_40838 ?auto_40836 ) ( ON-TABLE ?auto_40836 ) ( not ( = ?auto_40836 ?auto_40838 ) ) ( not ( = ?auto_40836 ?auto_40837 ) ) ( not ( = ?auto_40836 ?auto_40839 ) ) ( not ( = ?auto_40838 ?auto_40837 ) ) ( not ( = ?auto_40838 ?auto_40839 ) ) ( not ( = ?auto_40837 ?auto_40839 ) ) ( not ( = ?auto_40841 ?auto_40840 ) ) ( not ( = ?auto_40841 ?auto_40839 ) ) ( not ( = ?auto_40840 ?auto_40839 ) ) ( not ( = ?auto_40836 ?auto_40840 ) ) ( not ( = ?auto_40836 ?auto_40841 ) ) ( not ( = ?auto_40838 ?auto_40840 ) ) ( not ( = ?auto_40838 ?auto_40841 ) ) ( not ( = ?auto_40837 ?auto_40840 ) ) ( not ( = ?auto_40837 ?auto_40841 ) ) ( ON ?auto_40841 ?auto_40842 ) ( not ( = ?auto_40836 ?auto_40842 ) ) ( not ( = ?auto_40838 ?auto_40842 ) ) ( not ( = ?auto_40837 ?auto_40842 ) ) ( not ( = ?auto_40839 ?auto_40842 ) ) ( not ( = ?auto_40841 ?auto_40842 ) ) ( not ( = ?auto_40840 ?auto_40842 ) ) ( ON ?auto_40840 ?auto_40841 ) ( ON-TABLE ?auto_40842 ) ( ON ?auto_40839 ?auto_40840 ) ( CLEAR ?auto_40838 ) ( ON ?auto_40837 ?auto_40839 ) ( CLEAR ?auto_40837 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_40842 ?auto_40841 ?auto_40840 ?auto_40839 )
      ( MAKE-1PILE ?auto_40836 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_40857 - BLOCK
    )
    :vars
    (
      ?auto_40861 - BLOCK
      ?auto_40862 - BLOCK
      ?auto_40860 - BLOCK
      ?auto_40858 - BLOCK
      ?auto_40859 - BLOCK
      ?auto_40863 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_40857 ?auto_40861 ) ) ( not ( = ?auto_40857 ?auto_40862 ) ) ( not ( = ?auto_40857 ?auto_40860 ) ) ( not ( = ?auto_40861 ?auto_40862 ) ) ( not ( = ?auto_40861 ?auto_40860 ) ) ( not ( = ?auto_40862 ?auto_40860 ) ) ( not ( = ?auto_40858 ?auto_40859 ) ) ( not ( = ?auto_40858 ?auto_40860 ) ) ( not ( = ?auto_40859 ?auto_40860 ) ) ( not ( = ?auto_40857 ?auto_40859 ) ) ( not ( = ?auto_40857 ?auto_40858 ) ) ( not ( = ?auto_40861 ?auto_40859 ) ) ( not ( = ?auto_40861 ?auto_40858 ) ) ( not ( = ?auto_40862 ?auto_40859 ) ) ( not ( = ?auto_40862 ?auto_40858 ) ) ( ON ?auto_40858 ?auto_40863 ) ( not ( = ?auto_40857 ?auto_40863 ) ) ( not ( = ?auto_40861 ?auto_40863 ) ) ( not ( = ?auto_40862 ?auto_40863 ) ) ( not ( = ?auto_40860 ?auto_40863 ) ) ( not ( = ?auto_40858 ?auto_40863 ) ) ( not ( = ?auto_40859 ?auto_40863 ) ) ( ON ?auto_40859 ?auto_40858 ) ( ON-TABLE ?auto_40863 ) ( ON ?auto_40860 ?auto_40859 ) ( ON ?auto_40862 ?auto_40860 ) ( ON ?auto_40861 ?auto_40862 ) ( CLEAR ?auto_40861 ) ( HOLDING ?auto_40857 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_40857 ?auto_40861 )
      ( MAKE-1PILE ?auto_40857 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_40864 - BLOCK
    )
    :vars
    (
      ?auto_40866 - BLOCK
      ?auto_40868 - BLOCK
      ?auto_40865 - BLOCK
      ?auto_40867 - BLOCK
      ?auto_40869 - BLOCK
      ?auto_40870 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_40864 ?auto_40866 ) ) ( not ( = ?auto_40864 ?auto_40868 ) ) ( not ( = ?auto_40864 ?auto_40865 ) ) ( not ( = ?auto_40866 ?auto_40868 ) ) ( not ( = ?auto_40866 ?auto_40865 ) ) ( not ( = ?auto_40868 ?auto_40865 ) ) ( not ( = ?auto_40867 ?auto_40869 ) ) ( not ( = ?auto_40867 ?auto_40865 ) ) ( not ( = ?auto_40869 ?auto_40865 ) ) ( not ( = ?auto_40864 ?auto_40869 ) ) ( not ( = ?auto_40864 ?auto_40867 ) ) ( not ( = ?auto_40866 ?auto_40869 ) ) ( not ( = ?auto_40866 ?auto_40867 ) ) ( not ( = ?auto_40868 ?auto_40869 ) ) ( not ( = ?auto_40868 ?auto_40867 ) ) ( ON ?auto_40867 ?auto_40870 ) ( not ( = ?auto_40864 ?auto_40870 ) ) ( not ( = ?auto_40866 ?auto_40870 ) ) ( not ( = ?auto_40868 ?auto_40870 ) ) ( not ( = ?auto_40865 ?auto_40870 ) ) ( not ( = ?auto_40867 ?auto_40870 ) ) ( not ( = ?auto_40869 ?auto_40870 ) ) ( ON ?auto_40869 ?auto_40867 ) ( ON-TABLE ?auto_40870 ) ( ON ?auto_40865 ?auto_40869 ) ( ON ?auto_40868 ?auto_40865 ) ( ON ?auto_40866 ?auto_40868 ) ( ON ?auto_40864 ?auto_40866 ) ( CLEAR ?auto_40864 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_40870 ?auto_40867 ?auto_40869 ?auto_40865 ?auto_40868 ?auto_40866 )
      ( MAKE-1PILE ?auto_40864 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_40876 - BLOCK
      ?auto_40877 - BLOCK
      ?auto_40878 - BLOCK
      ?auto_40879 - BLOCK
      ?auto_40880 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_40880 ) ( CLEAR ?auto_40879 ) ( ON-TABLE ?auto_40876 ) ( ON ?auto_40877 ?auto_40876 ) ( ON ?auto_40878 ?auto_40877 ) ( ON ?auto_40879 ?auto_40878 ) ( not ( = ?auto_40876 ?auto_40877 ) ) ( not ( = ?auto_40876 ?auto_40878 ) ) ( not ( = ?auto_40876 ?auto_40879 ) ) ( not ( = ?auto_40876 ?auto_40880 ) ) ( not ( = ?auto_40877 ?auto_40878 ) ) ( not ( = ?auto_40877 ?auto_40879 ) ) ( not ( = ?auto_40877 ?auto_40880 ) ) ( not ( = ?auto_40878 ?auto_40879 ) ) ( not ( = ?auto_40878 ?auto_40880 ) ) ( not ( = ?auto_40879 ?auto_40880 ) ) )
    :subtasks
    ( ( !STACK ?auto_40880 ?auto_40879 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_40881 - BLOCK
      ?auto_40882 - BLOCK
      ?auto_40883 - BLOCK
      ?auto_40884 - BLOCK
      ?auto_40885 - BLOCK
    )
    :vars
    (
      ?auto_40886 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_40884 ) ( ON-TABLE ?auto_40881 ) ( ON ?auto_40882 ?auto_40881 ) ( ON ?auto_40883 ?auto_40882 ) ( ON ?auto_40884 ?auto_40883 ) ( not ( = ?auto_40881 ?auto_40882 ) ) ( not ( = ?auto_40881 ?auto_40883 ) ) ( not ( = ?auto_40881 ?auto_40884 ) ) ( not ( = ?auto_40881 ?auto_40885 ) ) ( not ( = ?auto_40882 ?auto_40883 ) ) ( not ( = ?auto_40882 ?auto_40884 ) ) ( not ( = ?auto_40882 ?auto_40885 ) ) ( not ( = ?auto_40883 ?auto_40884 ) ) ( not ( = ?auto_40883 ?auto_40885 ) ) ( not ( = ?auto_40884 ?auto_40885 ) ) ( ON ?auto_40885 ?auto_40886 ) ( CLEAR ?auto_40885 ) ( HAND-EMPTY ) ( not ( = ?auto_40881 ?auto_40886 ) ) ( not ( = ?auto_40882 ?auto_40886 ) ) ( not ( = ?auto_40883 ?auto_40886 ) ) ( not ( = ?auto_40884 ?auto_40886 ) ) ( not ( = ?auto_40885 ?auto_40886 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_40885 ?auto_40886 )
      ( MAKE-5PILE ?auto_40881 ?auto_40882 ?auto_40883 ?auto_40884 ?auto_40885 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_40887 - BLOCK
      ?auto_40888 - BLOCK
      ?auto_40889 - BLOCK
      ?auto_40890 - BLOCK
      ?auto_40891 - BLOCK
    )
    :vars
    (
      ?auto_40892 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_40887 ) ( ON ?auto_40888 ?auto_40887 ) ( ON ?auto_40889 ?auto_40888 ) ( not ( = ?auto_40887 ?auto_40888 ) ) ( not ( = ?auto_40887 ?auto_40889 ) ) ( not ( = ?auto_40887 ?auto_40890 ) ) ( not ( = ?auto_40887 ?auto_40891 ) ) ( not ( = ?auto_40888 ?auto_40889 ) ) ( not ( = ?auto_40888 ?auto_40890 ) ) ( not ( = ?auto_40888 ?auto_40891 ) ) ( not ( = ?auto_40889 ?auto_40890 ) ) ( not ( = ?auto_40889 ?auto_40891 ) ) ( not ( = ?auto_40890 ?auto_40891 ) ) ( ON ?auto_40891 ?auto_40892 ) ( CLEAR ?auto_40891 ) ( not ( = ?auto_40887 ?auto_40892 ) ) ( not ( = ?auto_40888 ?auto_40892 ) ) ( not ( = ?auto_40889 ?auto_40892 ) ) ( not ( = ?auto_40890 ?auto_40892 ) ) ( not ( = ?auto_40891 ?auto_40892 ) ) ( HOLDING ?auto_40890 ) ( CLEAR ?auto_40889 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_40887 ?auto_40888 ?auto_40889 ?auto_40890 )
      ( MAKE-5PILE ?auto_40887 ?auto_40888 ?auto_40889 ?auto_40890 ?auto_40891 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_40893 - BLOCK
      ?auto_40894 - BLOCK
      ?auto_40895 - BLOCK
      ?auto_40896 - BLOCK
      ?auto_40897 - BLOCK
    )
    :vars
    (
      ?auto_40898 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_40893 ) ( ON ?auto_40894 ?auto_40893 ) ( ON ?auto_40895 ?auto_40894 ) ( not ( = ?auto_40893 ?auto_40894 ) ) ( not ( = ?auto_40893 ?auto_40895 ) ) ( not ( = ?auto_40893 ?auto_40896 ) ) ( not ( = ?auto_40893 ?auto_40897 ) ) ( not ( = ?auto_40894 ?auto_40895 ) ) ( not ( = ?auto_40894 ?auto_40896 ) ) ( not ( = ?auto_40894 ?auto_40897 ) ) ( not ( = ?auto_40895 ?auto_40896 ) ) ( not ( = ?auto_40895 ?auto_40897 ) ) ( not ( = ?auto_40896 ?auto_40897 ) ) ( ON ?auto_40897 ?auto_40898 ) ( not ( = ?auto_40893 ?auto_40898 ) ) ( not ( = ?auto_40894 ?auto_40898 ) ) ( not ( = ?auto_40895 ?auto_40898 ) ) ( not ( = ?auto_40896 ?auto_40898 ) ) ( not ( = ?auto_40897 ?auto_40898 ) ) ( CLEAR ?auto_40895 ) ( ON ?auto_40896 ?auto_40897 ) ( CLEAR ?auto_40896 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_40898 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_40898 ?auto_40897 )
      ( MAKE-5PILE ?auto_40893 ?auto_40894 ?auto_40895 ?auto_40896 ?auto_40897 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_40899 - BLOCK
      ?auto_40900 - BLOCK
      ?auto_40901 - BLOCK
      ?auto_40902 - BLOCK
      ?auto_40903 - BLOCK
    )
    :vars
    (
      ?auto_40904 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_40899 ) ( ON ?auto_40900 ?auto_40899 ) ( not ( = ?auto_40899 ?auto_40900 ) ) ( not ( = ?auto_40899 ?auto_40901 ) ) ( not ( = ?auto_40899 ?auto_40902 ) ) ( not ( = ?auto_40899 ?auto_40903 ) ) ( not ( = ?auto_40900 ?auto_40901 ) ) ( not ( = ?auto_40900 ?auto_40902 ) ) ( not ( = ?auto_40900 ?auto_40903 ) ) ( not ( = ?auto_40901 ?auto_40902 ) ) ( not ( = ?auto_40901 ?auto_40903 ) ) ( not ( = ?auto_40902 ?auto_40903 ) ) ( ON ?auto_40903 ?auto_40904 ) ( not ( = ?auto_40899 ?auto_40904 ) ) ( not ( = ?auto_40900 ?auto_40904 ) ) ( not ( = ?auto_40901 ?auto_40904 ) ) ( not ( = ?auto_40902 ?auto_40904 ) ) ( not ( = ?auto_40903 ?auto_40904 ) ) ( ON ?auto_40902 ?auto_40903 ) ( CLEAR ?auto_40902 ) ( ON-TABLE ?auto_40904 ) ( HOLDING ?auto_40901 ) ( CLEAR ?auto_40900 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_40899 ?auto_40900 ?auto_40901 )
      ( MAKE-5PILE ?auto_40899 ?auto_40900 ?auto_40901 ?auto_40902 ?auto_40903 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_40905 - BLOCK
      ?auto_40906 - BLOCK
      ?auto_40907 - BLOCK
      ?auto_40908 - BLOCK
      ?auto_40909 - BLOCK
    )
    :vars
    (
      ?auto_40910 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_40905 ) ( ON ?auto_40906 ?auto_40905 ) ( not ( = ?auto_40905 ?auto_40906 ) ) ( not ( = ?auto_40905 ?auto_40907 ) ) ( not ( = ?auto_40905 ?auto_40908 ) ) ( not ( = ?auto_40905 ?auto_40909 ) ) ( not ( = ?auto_40906 ?auto_40907 ) ) ( not ( = ?auto_40906 ?auto_40908 ) ) ( not ( = ?auto_40906 ?auto_40909 ) ) ( not ( = ?auto_40907 ?auto_40908 ) ) ( not ( = ?auto_40907 ?auto_40909 ) ) ( not ( = ?auto_40908 ?auto_40909 ) ) ( ON ?auto_40909 ?auto_40910 ) ( not ( = ?auto_40905 ?auto_40910 ) ) ( not ( = ?auto_40906 ?auto_40910 ) ) ( not ( = ?auto_40907 ?auto_40910 ) ) ( not ( = ?auto_40908 ?auto_40910 ) ) ( not ( = ?auto_40909 ?auto_40910 ) ) ( ON ?auto_40908 ?auto_40909 ) ( ON-TABLE ?auto_40910 ) ( CLEAR ?auto_40906 ) ( ON ?auto_40907 ?auto_40908 ) ( CLEAR ?auto_40907 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_40910 ?auto_40909 ?auto_40908 )
      ( MAKE-5PILE ?auto_40905 ?auto_40906 ?auto_40907 ?auto_40908 ?auto_40909 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_40911 - BLOCK
      ?auto_40912 - BLOCK
      ?auto_40913 - BLOCK
      ?auto_40914 - BLOCK
      ?auto_40915 - BLOCK
    )
    :vars
    (
      ?auto_40916 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_40911 ) ( not ( = ?auto_40911 ?auto_40912 ) ) ( not ( = ?auto_40911 ?auto_40913 ) ) ( not ( = ?auto_40911 ?auto_40914 ) ) ( not ( = ?auto_40911 ?auto_40915 ) ) ( not ( = ?auto_40912 ?auto_40913 ) ) ( not ( = ?auto_40912 ?auto_40914 ) ) ( not ( = ?auto_40912 ?auto_40915 ) ) ( not ( = ?auto_40913 ?auto_40914 ) ) ( not ( = ?auto_40913 ?auto_40915 ) ) ( not ( = ?auto_40914 ?auto_40915 ) ) ( ON ?auto_40915 ?auto_40916 ) ( not ( = ?auto_40911 ?auto_40916 ) ) ( not ( = ?auto_40912 ?auto_40916 ) ) ( not ( = ?auto_40913 ?auto_40916 ) ) ( not ( = ?auto_40914 ?auto_40916 ) ) ( not ( = ?auto_40915 ?auto_40916 ) ) ( ON ?auto_40914 ?auto_40915 ) ( ON-TABLE ?auto_40916 ) ( ON ?auto_40913 ?auto_40914 ) ( CLEAR ?auto_40913 ) ( HOLDING ?auto_40912 ) ( CLEAR ?auto_40911 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_40911 ?auto_40912 )
      ( MAKE-5PILE ?auto_40911 ?auto_40912 ?auto_40913 ?auto_40914 ?auto_40915 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_40917 - BLOCK
      ?auto_40918 - BLOCK
      ?auto_40919 - BLOCK
      ?auto_40920 - BLOCK
      ?auto_40921 - BLOCK
    )
    :vars
    (
      ?auto_40922 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_40917 ) ( not ( = ?auto_40917 ?auto_40918 ) ) ( not ( = ?auto_40917 ?auto_40919 ) ) ( not ( = ?auto_40917 ?auto_40920 ) ) ( not ( = ?auto_40917 ?auto_40921 ) ) ( not ( = ?auto_40918 ?auto_40919 ) ) ( not ( = ?auto_40918 ?auto_40920 ) ) ( not ( = ?auto_40918 ?auto_40921 ) ) ( not ( = ?auto_40919 ?auto_40920 ) ) ( not ( = ?auto_40919 ?auto_40921 ) ) ( not ( = ?auto_40920 ?auto_40921 ) ) ( ON ?auto_40921 ?auto_40922 ) ( not ( = ?auto_40917 ?auto_40922 ) ) ( not ( = ?auto_40918 ?auto_40922 ) ) ( not ( = ?auto_40919 ?auto_40922 ) ) ( not ( = ?auto_40920 ?auto_40922 ) ) ( not ( = ?auto_40921 ?auto_40922 ) ) ( ON ?auto_40920 ?auto_40921 ) ( ON-TABLE ?auto_40922 ) ( ON ?auto_40919 ?auto_40920 ) ( CLEAR ?auto_40917 ) ( ON ?auto_40918 ?auto_40919 ) ( CLEAR ?auto_40918 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_40922 ?auto_40921 ?auto_40920 ?auto_40919 )
      ( MAKE-5PILE ?auto_40917 ?auto_40918 ?auto_40919 ?auto_40920 ?auto_40921 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_40923 - BLOCK
      ?auto_40924 - BLOCK
      ?auto_40925 - BLOCK
      ?auto_40926 - BLOCK
      ?auto_40927 - BLOCK
    )
    :vars
    (
      ?auto_40928 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_40923 ?auto_40924 ) ) ( not ( = ?auto_40923 ?auto_40925 ) ) ( not ( = ?auto_40923 ?auto_40926 ) ) ( not ( = ?auto_40923 ?auto_40927 ) ) ( not ( = ?auto_40924 ?auto_40925 ) ) ( not ( = ?auto_40924 ?auto_40926 ) ) ( not ( = ?auto_40924 ?auto_40927 ) ) ( not ( = ?auto_40925 ?auto_40926 ) ) ( not ( = ?auto_40925 ?auto_40927 ) ) ( not ( = ?auto_40926 ?auto_40927 ) ) ( ON ?auto_40927 ?auto_40928 ) ( not ( = ?auto_40923 ?auto_40928 ) ) ( not ( = ?auto_40924 ?auto_40928 ) ) ( not ( = ?auto_40925 ?auto_40928 ) ) ( not ( = ?auto_40926 ?auto_40928 ) ) ( not ( = ?auto_40927 ?auto_40928 ) ) ( ON ?auto_40926 ?auto_40927 ) ( ON-TABLE ?auto_40928 ) ( ON ?auto_40925 ?auto_40926 ) ( ON ?auto_40924 ?auto_40925 ) ( CLEAR ?auto_40924 ) ( HOLDING ?auto_40923 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_40923 )
      ( MAKE-5PILE ?auto_40923 ?auto_40924 ?auto_40925 ?auto_40926 ?auto_40927 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_40929 - BLOCK
      ?auto_40930 - BLOCK
      ?auto_40931 - BLOCK
      ?auto_40932 - BLOCK
      ?auto_40933 - BLOCK
    )
    :vars
    (
      ?auto_40934 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_40929 ?auto_40930 ) ) ( not ( = ?auto_40929 ?auto_40931 ) ) ( not ( = ?auto_40929 ?auto_40932 ) ) ( not ( = ?auto_40929 ?auto_40933 ) ) ( not ( = ?auto_40930 ?auto_40931 ) ) ( not ( = ?auto_40930 ?auto_40932 ) ) ( not ( = ?auto_40930 ?auto_40933 ) ) ( not ( = ?auto_40931 ?auto_40932 ) ) ( not ( = ?auto_40931 ?auto_40933 ) ) ( not ( = ?auto_40932 ?auto_40933 ) ) ( ON ?auto_40933 ?auto_40934 ) ( not ( = ?auto_40929 ?auto_40934 ) ) ( not ( = ?auto_40930 ?auto_40934 ) ) ( not ( = ?auto_40931 ?auto_40934 ) ) ( not ( = ?auto_40932 ?auto_40934 ) ) ( not ( = ?auto_40933 ?auto_40934 ) ) ( ON ?auto_40932 ?auto_40933 ) ( ON-TABLE ?auto_40934 ) ( ON ?auto_40931 ?auto_40932 ) ( ON ?auto_40930 ?auto_40931 ) ( ON ?auto_40929 ?auto_40930 ) ( CLEAR ?auto_40929 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_40934 ?auto_40933 ?auto_40932 ?auto_40931 ?auto_40930 )
      ( MAKE-5PILE ?auto_40929 ?auto_40930 ?auto_40931 ?auto_40932 ?auto_40933 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_40935 - BLOCK
      ?auto_40936 - BLOCK
      ?auto_40937 - BLOCK
      ?auto_40938 - BLOCK
      ?auto_40939 - BLOCK
    )
    :vars
    (
      ?auto_40940 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_40935 ?auto_40936 ) ) ( not ( = ?auto_40935 ?auto_40937 ) ) ( not ( = ?auto_40935 ?auto_40938 ) ) ( not ( = ?auto_40935 ?auto_40939 ) ) ( not ( = ?auto_40936 ?auto_40937 ) ) ( not ( = ?auto_40936 ?auto_40938 ) ) ( not ( = ?auto_40936 ?auto_40939 ) ) ( not ( = ?auto_40937 ?auto_40938 ) ) ( not ( = ?auto_40937 ?auto_40939 ) ) ( not ( = ?auto_40938 ?auto_40939 ) ) ( ON ?auto_40939 ?auto_40940 ) ( not ( = ?auto_40935 ?auto_40940 ) ) ( not ( = ?auto_40936 ?auto_40940 ) ) ( not ( = ?auto_40937 ?auto_40940 ) ) ( not ( = ?auto_40938 ?auto_40940 ) ) ( not ( = ?auto_40939 ?auto_40940 ) ) ( ON ?auto_40938 ?auto_40939 ) ( ON-TABLE ?auto_40940 ) ( ON ?auto_40937 ?auto_40938 ) ( ON ?auto_40936 ?auto_40937 ) ( HOLDING ?auto_40935 ) ( CLEAR ?auto_40936 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_40940 ?auto_40939 ?auto_40938 ?auto_40937 ?auto_40936 ?auto_40935 )
      ( MAKE-5PILE ?auto_40935 ?auto_40936 ?auto_40937 ?auto_40938 ?auto_40939 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_40941 - BLOCK
      ?auto_40942 - BLOCK
      ?auto_40943 - BLOCK
      ?auto_40944 - BLOCK
      ?auto_40945 - BLOCK
    )
    :vars
    (
      ?auto_40946 - BLOCK
      ?auto_40947 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_40941 ?auto_40942 ) ) ( not ( = ?auto_40941 ?auto_40943 ) ) ( not ( = ?auto_40941 ?auto_40944 ) ) ( not ( = ?auto_40941 ?auto_40945 ) ) ( not ( = ?auto_40942 ?auto_40943 ) ) ( not ( = ?auto_40942 ?auto_40944 ) ) ( not ( = ?auto_40942 ?auto_40945 ) ) ( not ( = ?auto_40943 ?auto_40944 ) ) ( not ( = ?auto_40943 ?auto_40945 ) ) ( not ( = ?auto_40944 ?auto_40945 ) ) ( ON ?auto_40945 ?auto_40946 ) ( not ( = ?auto_40941 ?auto_40946 ) ) ( not ( = ?auto_40942 ?auto_40946 ) ) ( not ( = ?auto_40943 ?auto_40946 ) ) ( not ( = ?auto_40944 ?auto_40946 ) ) ( not ( = ?auto_40945 ?auto_40946 ) ) ( ON ?auto_40944 ?auto_40945 ) ( ON-TABLE ?auto_40946 ) ( ON ?auto_40943 ?auto_40944 ) ( ON ?auto_40942 ?auto_40943 ) ( CLEAR ?auto_40942 ) ( ON ?auto_40941 ?auto_40947 ) ( CLEAR ?auto_40941 ) ( HAND-EMPTY ) ( not ( = ?auto_40941 ?auto_40947 ) ) ( not ( = ?auto_40942 ?auto_40947 ) ) ( not ( = ?auto_40943 ?auto_40947 ) ) ( not ( = ?auto_40944 ?auto_40947 ) ) ( not ( = ?auto_40945 ?auto_40947 ) ) ( not ( = ?auto_40946 ?auto_40947 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_40941 ?auto_40947 )
      ( MAKE-5PILE ?auto_40941 ?auto_40942 ?auto_40943 ?auto_40944 ?auto_40945 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_40948 - BLOCK
      ?auto_40949 - BLOCK
      ?auto_40950 - BLOCK
      ?auto_40951 - BLOCK
      ?auto_40952 - BLOCK
    )
    :vars
    (
      ?auto_40954 - BLOCK
      ?auto_40953 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_40948 ?auto_40949 ) ) ( not ( = ?auto_40948 ?auto_40950 ) ) ( not ( = ?auto_40948 ?auto_40951 ) ) ( not ( = ?auto_40948 ?auto_40952 ) ) ( not ( = ?auto_40949 ?auto_40950 ) ) ( not ( = ?auto_40949 ?auto_40951 ) ) ( not ( = ?auto_40949 ?auto_40952 ) ) ( not ( = ?auto_40950 ?auto_40951 ) ) ( not ( = ?auto_40950 ?auto_40952 ) ) ( not ( = ?auto_40951 ?auto_40952 ) ) ( ON ?auto_40952 ?auto_40954 ) ( not ( = ?auto_40948 ?auto_40954 ) ) ( not ( = ?auto_40949 ?auto_40954 ) ) ( not ( = ?auto_40950 ?auto_40954 ) ) ( not ( = ?auto_40951 ?auto_40954 ) ) ( not ( = ?auto_40952 ?auto_40954 ) ) ( ON ?auto_40951 ?auto_40952 ) ( ON-TABLE ?auto_40954 ) ( ON ?auto_40950 ?auto_40951 ) ( ON ?auto_40948 ?auto_40953 ) ( CLEAR ?auto_40948 ) ( not ( = ?auto_40948 ?auto_40953 ) ) ( not ( = ?auto_40949 ?auto_40953 ) ) ( not ( = ?auto_40950 ?auto_40953 ) ) ( not ( = ?auto_40951 ?auto_40953 ) ) ( not ( = ?auto_40952 ?auto_40953 ) ) ( not ( = ?auto_40954 ?auto_40953 ) ) ( HOLDING ?auto_40949 ) ( CLEAR ?auto_40950 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_40954 ?auto_40952 ?auto_40951 ?auto_40950 ?auto_40949 )
      ( MAKE-5PILE ?auto_40948 ?auto_40949 ?auto_40950 ?auto_40951 ?auto_40952 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_40955 - BLOCK
      ?auto_40956 - BLOCK
      ?auto_40957 - BLOCK
      ?auto_40958 - BLOCK
      ?auto_40959 - BLOCK
    )
    :vars
    (
      ?auto_40961 - BLOCK
      ?auto_40960 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_40955 ?auto_40956 ) ) ( not ( = ?auto_40955 ?auto_40957 ) ) ( not ( = ?auto_40955 ?auto_40958 ) ) ( not ( = ?auto_40955 ?auto_40959 ) ) ( not ( = ?auto_40956 ?auto_40957 ) ) ( not ( = ?auto_40956 ?auto_40958 ) ) ( not ( = ?auto_40956 ?auto_40959 ) ) ( not ( = ?auto_40957 ?auto_40958 ) ) ( not ( = ?auto_40957 ?auto_40959 ) ) ( not ( = ?auto_40958 ?auto_40959 ) ) ( ON ?auto_40959 ?auto_40961 ) ( not ( = ?auto_40955 ?auto_40961 ) ) ( not ( = ?auto_40956 ?auto_40961 ) ) ( not ( = ?auto_40957 ?auto_40961 ) ) ( not ( = ?auto_40958 ?auto_40961 ) ) ( not ( = ?auto_40959 ?auto_40961 ) ) ( ON ?auto_40958 ?auto_40959 ) ( ON-TABLE ?auto_40961 ) ( ON ?auto_40957 ?auto_40958 ) ( ON ?auto_40955 ?auto_40960 ) ( not ( = ?auto_40955 ?auto_40960 ) ) ( not ( = ?auto_40956 ?auto_40960 ) ) ( not ( = ?auto_40957 ?auto_40960 ) ) ( not ( = ?auto_40958 ?auto_40960 ) ) ( not ( = ?auto_40959 ?auto_40960 ) ) ( not ( = ?auto_40961 ?auto_40960 ) ) ( CLEAR ?auto_40957 ) ( ON ?auto_40956 ?auto_40955 ) ( CLEAR ?auto_40956 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_40960 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_40960 ?auto_40955 )
      ( MAKE-5PILE ?auto_40955 ?auto_40956 ?auto_40957 ?auto_40958 ?auto_40959 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_40962 - BLOCK
      ?auto_40963 - BLOCK
      ?auto_40964 - BLOCK
      ?auto_40965 - BLOCK
      ?auto_40966 - BLOCK
    )
    :vars
    (
      ?auto_40968 - BLOCK
      ?auto_40967 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_40962 ?auto_40963 ) ) ( not ( = ?auto_40962 ?auto_40964 ) ) ( not ( = ?auto_40962 ?auto_40965 ) ) ( not ( = ?auto_40962 ?auto_40966 ) ) ( not ( = ?auto_40963 ?auto_40964 ) ) ( not ( = ?auto_40963 ?auto_40965 ) ) ( not ( = ?auto_40963 ?auto_40966 ) ) ( not ( = ?auto_40964 ?auto_40965 ) ) ( not ( = ?auto_40964 ?auto_40966 ) ) ( not ( = ?auto_40965 ?auto_40966 ) ) ( ON ?auto_40966 ?auto_40968 ) ( not ( = ?auto_40962 ?auto_40968 ) ) ( not ( = ?auto_40963 ?auto_40968 ) ) ( not ( = ?auto_40964 ?auto_40968 ) ) ( not ( = ?auto_40965 ?auto_40968 ) ) ( not ( = ?auto_40966 ?auto_40968 ) ) ( ON ?auto_40965 ?auto_40966 ) ( ON-TABLE ?auto_40968 ) ( ON ?auto_40962 ?auto_40967 ) ( not ( = ?auto_40962 ?auto_40967 ) ) ( not ( = ?auto_40963 ?auto_40967 ) ) ( not ( = ?auto_40964 ?auto_40967 ) ) ( not ( = ?auto_40965 ?auto_40967 ) ) ( not ( = ?auto_40966 ?auto_40967 ) ) ( not ( = ?auto_40968 ?auto_40967 ) ) ( ON ?auto_40963 ?auto_40962 ) ( CLEAR ?auto_40963 ) ( ON-TABLE ?auto_40967 ) ( HOLDING ?auto_40964 ) ( CLEAR ?auto_40965 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_40968 ?auto_40966 ?auto_40965 ?auto_40964 )
      ( MAKE-5PILE ?auto_40962 ?auto_40963 ?auto_40964 ?auto_40965 ?auto_40966 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_40969 - BLOCK
      ?auto_40970 - BLOCK
      ?auto_40971 - BLOCK
      ?auto_40972 - BLOCK
      ?auto_40973 - BLOCK
    )
    :vars
    (
      ?auto_40975 - BLOCK
      ?auto_40974 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_40969 ?auto_40970 ) ) ( not ( = ?auto_40969 ?auto_40971 ) ) ( not ( = ?auto_40969 ?auto_40972 ) ) ( not ( = ?auto_40969 ?auto_40973 ) ) ( not ( = ?auto_40970 ?auto_40971 ) ) ( not ( = ?auto_40970 ?auto_40972 ) ) ( not ( = ?auto_40970 ?auto_40973 ) ) ( not ( = ?auto_40971 ?auto_40972 ) ) ( not ( = ?auto_40971 ?auto_40973 ) ) ( not ( = ?auto_40972 ?auto_40973 ) ) ( ON ?auto_40973 ?auto_40975 ) ( not ( = ?auto_40969 ?auto_40975 ) ) ( not ( = ?auto_40970 ?auto_40975 ) ) ( not ( = ?auto_40971 ?auto_40975 ) ) ( not ( = ?auto_40972 ?auto_40975 ) ) ( not ( = ?auto_40973 ?auto_40975 ) ) ( ON ?auto_40972 ?auto_40973 ) ( ON-TABLE ?auto_40975 ) ( ON ?auto_40969 ?auto_40974 ) ( not ( = ?auto_40969 ?auto_40974 ) ) ( not ( = ?auto_40970 ?auto_40974 ) ) ( not ( = ?auto_40971 ?auto_40974 ) ) ( not ( = ?auto_40972 ?auto_40974 ) ) ( not ( = ?auto_40973 ?auto_40974 ) ) ( not ( = ?auto_40975 ?auto_40974 ) ) ( ON ?auto_40970 ?auto_40969 ) ( ON-TABLE ?auto_40974 ) ( CLEAR ?auto_40972 ) ( ON ?auto_40971 ?auto_40970 ) ( CLEAR ?auto_40971 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_40974 ?auto_40969 ?auto_40970 )
      ( MAKE-5PILE ?auto_40969 ?auto_40970 ?auto_40971 ?auto_40972 ?auto_40973 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_40976 - BLOCK
      ?auto_40977 - BLOCK
      ?auto_40978 - BLOCK
      ?auto_40979 - BLOCK
      ?auto_40980 - BLOCK
    )
    :vars
    (
      ?auto_40982 - BLOCK
      ?auto_40981 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_40976 ?auto_40977 ) ) ( not ( = ?auto_40976 ?auto_40978 ) ) ( not ( = ?auto_40976 ?auto_40979 ) ) ( not ( = ?auto_40976 ?auto_40980 ) ) ( not ( = ?auto_40977 ?auto_40978 ) ) ( not ( = ?auto_40977 ?auto_40979 ) ) ( not ( = ?auto_40977 ?auto_40980 ) ) ( not ( = ?auto_40978 ?auto_40979 ) ) ( not ( = ?auto_40978 ?auto_40980 ) ) ( not ( = ?auto_40979 ?auto_40980 ) ) ( ON ?auto_40980 ?auto_40982 ) ( not ( = ?auto_40976 ?auto_40982 ) ) ( not ( = ?auto_40977 ?auto_40982 ) ) ( not ( = ?auto_40978 ?auto_40982 ) ) ( not ( = ?auto_40979 ?auto_40982 ) ) ( not ( = ?auto_40980 ?auto_40982 ) ) ( ON-TABLE ?auto_40982 ) ( ON ?auto_40976 ?auto_40981 ) ( not ( = ?auto_40976 ?auto_40981 ) ) ( not ( = ?auto_40977 ?auto_40981 ) ) ( not ( = ?auto_40978 ?auto_40981 ) ) ( not ( = ?auto_40979 ?auto_40981 ) ) ( not ( = ?auto_40980 ?auto_40981 ) ) ( not ( = ?auto_40982 ?auto_40981 ) ) ( ON ?auto_40977 ?auto_40976 ) ( ON-TABLE ?auto_40981 ) ( ON ?auto_40978 ?auto_40977 ) ( CLEAR ?auto_40978 ) ( HOLDING ?auto_40979 ) ( CLEAR ?auto_40980 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_40982 ?auto_40980 ?auto_40979 )
      ( MAKE-5PILE ?auto_40976 ?auto_40977 ?auto_40978 ?auto_40979 ?auto_40980 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_40983 - BLOCK
      ?auto_40984 - BLOCK
      ?auto_40985 - BLOCK
      ?auto_40986 - BLOCK
      ?auto_40987 - BLOCK
    )
    :vars
    (
      ?auto_40989 - BLOCK
      ?auto_40988 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_40983 ?auto_40984 ) ) ( not ( = ?auto_40983 ?auto_40985 ) ) ( not ( = ?auto_40983 ?auto_40986 ) ) ( not ( = ?auto_40983 ?auto_40987 ) ) ( not ( = ?auto_40984 ?auto_40985 ) ) ( not ( = ?auto_40984 ?auto_40986 ) ) ( not ( = ?auto_40984 ?auto_40987 ) ) ( not ( = ?auto_40985 ?auto_40986 ) ) ( not ( = ?auto_40985 ?auto_40987 ) ) ( not ( = ?auto_40986 ?auto_40987 ) ) ( ON ?auto_40987 ?auto_40989 ) ( not ( = ?auto_40983 ?auto_40989 ) ) ( not ( = ?auto_40984 ?auto_40989 ) ) ( not ( = ?auto_40985 ?auto_40989 ) ) ( not ( = ?auto_40986 ?auto_40989 ) ) ( not ( = ?auto_40987 ?auto_40989 ) ) ( ON-TABLE ?auto_40989 ) ( ON ?auto_40983 ?auto_40988 ) ( not ( = ?auto_40983 ?auto_40988 ) ) ( not ( = ?auto_40984 ?auto_40988 ) ) ( not ( = ?auto_40985 ?auto_40988 ) ) ( not ( = ?auto_40986 ?auto_40988 ) ) ( not ( = ?auto_40987 ?auto_40988 ) ) ( not ( = ?auto_40989 ?auto_40988 ) ) ( ON ?auto_40984 ?auto_40983 ) ( ON-TABLE ?auto_40988 ) ( ON ?auto_40985 ?auto_40984 ) ( CLEAR ?auto_40987 ) ( ON ?auto_40986 ?auto_40985 ) ( CLEAR ?auto_40986 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_40988 ?auto_40983 ?auto_40984 ?auto_40985 )
      ( MAKE-5PILE ?auto_40983 ?auto_40984 ?auto_40985 ?auto_40986 ?auto_40987 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_40990 - BLOCK
      ?auto_40991 - BLOCK
      ?auto_40992 - BLOCK
      ?auto_40993 - BLOCK
      ?auto_40994 - BLOCK
    )
    :vars
    (
      ?auto_40995 - BLOCK
      ?auto_40996 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_40990 ?auto_40991 ) ) ( not ( = ?auto_40990 ?auto_40992 ) ) ( not ( = ?auto_40990 ?auto_40993 ) ) ( not ( = ?auto_40990 ?auto_40994 ) ) ( not ( = ?auto_40991 ?auto_40992 ) ) ( not ( = ?auto_40991 ?auto_40993 ) ) ( not ( = ?auto_40991 ?auto_40994 ) ) ( not ( = ?auto_40992 ?auto_40993 ) ) ( not ( = ?auto_40992 ?auto_40994 ) ) ( not ( = ?auto_40993 ?auto_40994 ) ) ( not ( = ?auto_40990 ?auto_40995 ) ) ( not ( = ?auto_40991 ?auto_40995 ) ) ( not ( = ?auto_40992 ?auto_40995 ) ) ( not ( = ?auto_40993 ?auto_40995 ) ) ( not ( = ?auto_40994 ?auto_40995 ) ) ( ON-TABLE ?auto_40995 ) ( ON ?auto_40990 ?auto_40996 ) ( not ( = ?auto_40990 ?auto_40996 ) ) ( not ( = ?auto_40991 ?auto_40996 ) ) ( not ( = ?auto_40992 ?auto_40996 ) ) ( not ( = ?auto_40993 ?auto_40996 ) ) ( not ( = ?auto_40994 ?auto_40996 ) ) ( not ( = ?auto_40995 ?auto_40996 ) ) ( ON ?auto_40991 ?auto_40990 ) ( ON-TABLE ?auto_40996 ) ( ON ?auto_40992 ?auto_40991 ) ( ON ?auto_40993 ?auto_40992 ) ( CLEAR ?auto_40993 ) ( HOLDING ?auto_40994 ) ( CLEAR ?auto_40995 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_40995 ?auto_40994 )
      ( MAKE-5PILE ?auto_40990 ?auto_40991 ?auto_40992 ?auto_40993 ?auto_40994 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_40997 - BLOCK
      ?auto_40998 - BLOCK
      ?auto_40999 - BLOCK
      ?auto_41000 - BLOCK
      ?auto_41001 - BLOCK
    )
    :vars
    (
      ?auto_41002 - BLOCK
      ?auto_41003 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_40997 ?auto_40998 ) ) ( not ( = ?auto_40997 ?auto_40999 ) ) ( not ( = ?auto_40997 ?auto_41000 ) ) ( not ( = ?auto_40997 ?auto_41001 ) ) ( not ( = ?auto_40998 ?auto_40999 ) ) ( not ( = ?auto_40998 ?auto_41000 ) ) ( not ( = ?auto_40998 ?auto_41001 ) ) ( not ( = ?auto_40999 ?auto_41000 ) ) ( not ( = ?auto_40999 ?auto_41001 ) ) ( not ( = ?auto_41000 ?auto_41001 ) ) ( not ( = ?auto_40997 ?auto_41002 ) ) ( not ( = ?auto_40998 ?auto_41002 ) ) ( not ( = ?auto_40999 ?auto_41002 ) ) ( not ( = ?auto_41000 ?auto_41002 ) ) ( not ( = ?auto_41001 ?auto_41002 ) ) ( ON-TABLE ?auto_41002 ) ( ON ?auto_40997 ?auto_41003 ) ( not ( = ?auto_40997 ?auto_41003 ) ) ( not ( = ?auto_40998 ?auto_41003 ) ) ( not ( = ?auto_40999 ?auto_41003 ) ) ( not ( = ?auto_41000 ?auto_41003 ) ) ( not ( = ?auto_41001 ?auto_41003 ) ) ( not ( = ?auto_41002 ?auto_41003 ) ) ( ON ?auto_40998 ?auto_40997 ) ( ON-TABLE ?auto_41003 ) ( ON ?auto_40999 ?auto_40998 ) ( ON ?auto_41000 ?auto_40999 ) ( CLEAR ?auto_41002 ) ( ON ?auto_41001 ?auto_41000 ) ( CLEAR ?auto_41001 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_41003 ?auto_40997 ?auto_40998 ?auto_40999 ?auto_41000 )
      ( MAKE-5PILE ?auto_40997 ?auto_40998 ?auto_40999 ?auto_41000 ?auto_41001 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_41004 - BLOCK
      ?auto_41005 - BLOCK
      ?auto_41006 - BLOCK
      ?auto_41007 - BLOCK
      ?auto_41008 - BLOCK
    )
    :vars
    (
      ?auto_41009 - BLOCK
      ?auto_41010 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_41004 ?auto_41005 ) ) ( not ( = ?auto_41004 ?auto_41006 ) ) ( not ( = ?auto_41004 ?auto_41007 ) ) ( not ( = ?auto_41004 ?auto_41008 ) ) ( not ( = ?auto_41005 ?auto_41006 ) ) ( not ( = ?auto_41005 ?auto_41007 ) ) ( not ( = ?auto_41005 ?auto_41008 ) ) ( not ( = ?auto_41006 ?auto_41007 ) ) ( not ( = ?auto_41006 ?auto_41008 ) ) ( not ( = ?auto_41007 ?auto_41008 ) ) ( not ( = ?auto_41004 ?auto_41009 ) ) ( not ( = ?auto_41005 ?auto_41009 ) ) ( not ( = ?auto_41006 ?auto_41009 ) ) ( not ( = ?auto_41007 ?auto_41009 ) ) ( not ( = ?auto_41008 ?auto_41009 ) ) ( ON ?auto_41004 ?auto_41010 ) ( not ( = ?auto_41004 ?auto_41010 ) ) ( not ( = ?auto_41005 ?auto_41010 ) ) ( not ( = ?auto_41006 ?auto_41010 ) ) ( not ( = ?auto_41007 ?auto_41010 ) ) ( not ( = ?auto_41008 ?auto_41010 ) ) ( not ( = ?auto_41009 ?auto_41010 ) ) ( ON ?auto_41005 ?auto_41004 ) ( ON-TABLE ?auto_41010 ) ( ON ?auto_41006 ?auto_41005 ) ( ON ?auto_41007 ?auto_41006 ) ( ON ?auto_41008 ?auto_41007 ) ( CLEAR ?auto_41008 ) ( HOLDING ?auto_41009 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_41009 )
      ( MAKE-5PILE ?auto_41004 ?auto_41005 ?auto_41006 ?auto_41007 ?auto_41008 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_41011 - BLOCK
      ?auto_41012 - BLOCK
      ?auto_41013 - BLOCK
      ?auto_41014 - BLOCK
      ?auto_41015 - BLOCK
    )
    :vars
    (
      ?auto_41016 - BLOCK
      ?auto_41017 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_41011 ?auto_41012 ) ) ( not ( = ?auto_41011 ?auto_41013 ) ) ( not ( = ?auto_41011 ?auto_41014 ) ) ( not ( = ?auto_41011 ?auto_41015 ) ) ( not ( = ?auto_41012 ?auto_41013 ) ) ( not ( = ?auto_41012 ?auto_41014 ) ) ( not ( = ?auto_41012 ?auto_41015 ) ) ( not ( = ?auto_41013 ?auto_41014 ) ) ( not ( = ?auto_41013 ?auto_41015 ) ) ( not ( = ?auto_41014 ?auto_41015 ) ) ( not ( = ?auto_41011 ?auto_41016 ) ) ( not ( = ?auto_41012 ?auto_41016 ) ) ( not ( = ?auto_41013 ?auto_41016 ) ) ( not ( = ?auto_41014 ?auto_41016 ) ) ( not ( = ?auto_41015 ?auto_41016 ) ) ( ON ?auto_41011 ?auto_41017 ) ( not ( = ?auto_41011 ?auto_41017 ) ) ( not ( = ?auto_41012 ?auto_41017 ) ) ( not ( = ?auto_41013 ?auto_41017 ) ) ( not ( = ?auto_41014 ?auto_41017 ) ) ( not ( = ?auto_41015 ?auto_41017 ) ) ( not ( = ?auto_41016 ?auto_41017 ) ) ( ON ?auto_41012 ?auto_41011 ) ( ON-TABLE ?auto_41017 ) ( ON ?auto_41013 ?auto_41012 ) ( ON ?auto_41014 ?auto_41013 ) ( ON ?auto_41015 ?auto_41014 ) ( ON ?auto_41016 ?auto_41015 ) ( CLEAR ?auto_41016 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_41017 ?auto_41011 ?auto_41012 ?auto_41013 ?auto_41014 ?auto_41015 )
      ( MAKE-5PILE ?auto_41011 ?auto_41012 ?auto_41013 ?auto_41014 ?auto_41015 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_41024 - BLOCK
      ?auto_41025 - BLOCK
      ?auto_41026 - BLOCK
      ?auto_41027 - BLOCK
      ?auto_41028 - BLOCK
      ?auto_41029 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_41029 ) ( CLEAR ?auto_41028 ) ( ON-TABLE ?auto_41024 ) ( ON ?auto_41025 ?auto_41024 ) ( ON ?auto_41026 ?auto_41025 ) ( ON ?auto_41027 ?auto_41026 ) ( ON ?auto_41028 ?auto_41027 ) ( not ( = ?auto_41024 ?auto_41025 ) ) ( not ( = ?auto_41024 ?auto_41026 ) ) ( not ( = ?auto_41024 ?auto_41027 ) ) ( not ( = ?auto_41024 ?auto_41028 ) ) ( not ( = ?auto_41024 ?auto_41029 ) ) ( not ( = ?auto_41025 ?auto_41026 ) ) ( not ( = ?auto_41025 ?auto_41027 ) ) ( not ( = ?auto_41025 ?auto_41028 ) ) ( not ( = ?auto_41025 ?auto_41029 ) ) ( not ( = ?auto_41026 ?auto_41027 ) ) ( not ( = ?auto_41026 ?auto_41028 ) ) ( not ( = ?auto_41026 ?auto_41029 ) ) ( not ( = ?auto_41027 ?auto_41028 ) ) ( not ( = ?auto_41027 ?auto_41029 ) ) ( not ( = ?auto_41028 ?auto_41029 ) ) )
    :subtasks
    ( ( !STACK ?auto_41029 ?auto_41028 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_41030 - BLOCK
      ?auto_41031 - BLOCK
      ?auto_41032 - BLOCK
      ?auto_41033 - BLOCK
      ?auto_41034 - BLOCK
      ?auto_41035 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_41034 ) ( ON-TABLE ?auto_41030 ) ( ON ?auto_41031 ?auto_41030 ) ( ON ?auto_41032 ?auto_41031 ) ( ON ?auto_41033 ?auto_41032 ) ( ON ?auto_41034 ?auto_41033 ) ( not ( = ?auto_41030 ?auto_41031 ) ) ( not ( = ?auto_41030 ?auto_41032 ) ) ( not ( = ?auto_41030 ?auto_41033 ) ) ( not ( = ?auto_41030 ?auto_41034 ) ) ( not ( = ?auto_41030 ?auto_41035 ) ) ( not ( = ?auto_41031 ?auto_41032 ) ) ( not ( = ?auto_41031 ?auto_41033 ) ) ( not ( = ?auto_41031 ?auto_41034 ) ) ( not ( = ?auto_41031 ?auto_41035 ) ) ( not ( = ?auto_41032 ?auto_41033 ) ) ( not ( = ?auto_41032 ?auto_41034 ) ) ( not ( = ?auto_41032 ?auto_41035 ) ) ( not ( = ?auto_41033 ?auto_41034 ) ) ( not ( = ?auto_41033 ?auto_41035 ) ) ( not ( = ?auto_41034 ?auto_41035 ) ) ( ON-TABLE ?auto_41035 ) ( CLEAR ?auto_41035 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_41035 )
      ( MAKE-6PILE ?auto_41030 ?auto_41031 ?auto_41032 ?auto_41033 ?auto_41034 ?auto_41035 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_41036 - BLOCK
      ?auto_41037 - BLOCK
      ?auto_41038 - BLOCK
      ?auto_41039 - BLOCK
      ?auto_41040 - BLOCK
      ?auto_41041 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_41036 ) ( ON ?auto_41037 ?auto_41036 ) ( ON ?auto_41038 ?auto_41037 ) ( ON ?auto_41039 ?auto_41038 ) ( not ( = ?auto_41036 ?auto_41037 ) ) ( not ( = ?auto_41036 ?auto_41038 ) ) ( not ( = ?auto_41036 ?auto_41039 ) ) ( not ( = ?auto_41036 ?auto_41040 ) ) ( not ( = ?auto_41036 ?auto_41041 ) ) ( not ( = ?auto_41037 ?auto_41038 ) ) ( not ( = ?auto_41037 ?auto_41039 ) ) ( not ( = ?auto_41037 ?auto_41040 ) ) ( not ( = ?auto_41037 ?auto_41041 ) ) ( not ( = ?auto_41038 ?auto_41039 ) ) ( not ( = ?auto_41038 ?auto_41040 ) ) ( not ( = ?auto_41038 ?auto_41041 ) ) ( not ( = ?auto_41039 ?auto_41040 ) ) ( not ( = ?auto_41039 ?auto_41041 ) ) ( not ( = ?auto_41040 ?auto_41041 ) ) ( ON-TABLE ?auto_41041 ) ( CLEAR ?auto_41041 ) ( HOLDING ?auto_41040 ) ( CLEAR ?auto_41039 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_41036 ?auto_41037 ?auto_41038 ?auto_41039 ?auto_41040 )
      ( MAKE-6PILE ?auto_41036 ?auto_41037 ?auto_41038 ?auto_41039 ?auto_41040 ?auto_41041 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_41042 - BLOCK
      ?auto_41043 - BLOCK
      ?auto_41044 - BLOCK
      ?auto_41045 - BLOCK
      ?auto_41046 - BLOCK
      ?auto_41047 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_41042 ) ( ON ?auto_41043 ?auto_41042 ) ( ON ?auto_41044 ?auto_41043 ) ( ON ?auto_41045 ?auto_41044 ) ( not ( = ?auto_41042 ?auto_41043 ) ) ( not ( = ?auto_41042 ?auto_41044 ) ) ( not ( = ?auto_41042 ?auto_41045 ) ) ( not ( = ?auto_41042 ?auto_41046 ) ) ( not ( = ?auto_41042 ?auto_41047 ) ) ( not ( = ?auto_41043 ?auto_41044 ) ) ( not ( = ?auto_41043 ?auto_41045 ) ) ( not ( = ?auto_41043 ?auto_41046 ) ) ( not ( = ?auto_41043 ?auto_41047 ) ) ( not ( = ?auto_41044 ?auto_41045 ) ) ( not ( = ?auto_41044 ?auto_41046 ) ) ( not ( = ?auto_41044 ?auto_41047 ) ) ( not ( = ?auto_41045 ?auto_41046 ) ) ( not ( = ?auto_41045 ?auto_41047 ) ) ( not ( = ?auto_41046 ?auto_41047 ) ) ( ON-TABLE ?auto_41047 ) ( CLEAR ?auto_41045 ) ( ON ?auto_41046 ?auto_41047 ) ( CLEAR ?auto_41046 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_41047 )
      ( MAKE-6PILE ?auto_41042 ?auto_41043 ?auto_41044 ?auto_41045 ?auto_41046 ?auto_41047 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_41048 - BLOCK
      ?auto_41049 - BLOCK
      ?auto_41050 - BLOCK
      ?auto_41051 - BLOCK
      ?auto_41052 - BLOCK
      ?auto_41053 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_41048 ) ( ON ?auto_41049 ?auto_41048 ) ( ON ?auto_41050 ?auto_41049 ) ( not ( = ?auto_41048 ?auto_41049 ) ) ( not ( = ?auto_41048 ?auto_41050 ) ) ( not ( = ?auto_41048 ?auto_41051 ) ) ( not ( = ?auto_41048 ?auto_41052 ) ) ( not ( = ?auto_41048 ?auto_41053 ) ) ( not ( = ?auto_41049 ?auto_41050 ) ) ( not ( = ?auto_41049 ?auto_41051 ) ) ( not ( = ?auto_41049 ?auto_41052 ) ) ( not ( = ?auto_41049 ?auto_41053 ) ) ( not ( = ?auto_41050 ?auto_41051 ) ) ( not ( = ?auto_41050 ?auto_41052 ) ) ( not ( = ?auto_41050 ?auto_41053 ) ) ( not ( = ?auto_41051 ?auto_41052 ) ) ( not ( = ?auto_41051 ?auto_41053 ) ) ( not ( = ?auto_41052 ?auto_41053 ) ) ( ON-TABLE ?auto_41053 ) ( ON ?auto_41052 ?auto_41053 ) ( CLEAR ?auto_41052 ) ( HOLDING ?auto_41051 ) ( CLEAR ?auto_41050 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_41048 ?auto_41049 ?auto_41050 ?auto_41051 )
      ( MAKE-6PILE ?auto_41048 ?auto_41049 ?auto_41050 ?auto_41051 ?auto_41052 ?auto_41053 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_41054 - BLOCK
      ?auto_41055 - BLOCK
      ?auto_41056 - BLOCK
      ?auto_41057 - BLOCK
      ?auto_41058 - BLOCK
      ?auto_41059 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_41054 ) ( ON ?auto_41055 ?auto_41054 ) ( ON ?auto_41056 ?auto_41055 ) ( not ( = ?auto_41054 ?auto_41055 ) ) ( not ( = ?auto_41054 ?auto_41056 ) ) ( not ( = ?auto_41054 ?auto_41057 ) ) ( not ( = ?auto_41054 ?auto_41058 ) ) ( not ( = ?auto_41054 ?auto_41059 ) ) ( not ( = ?auto_41055 ?auto_41056 ) ) ( not ( = ?auto_41055 ?auto_41057 ) ) ( not ( = ?auto_41055 ?auto_41058 ) ) ( not ( = ?auto_41055 ?auto_41059 ) ) ( not ( = ?auto_41056 ?auto_41057 ) ) ( not ( = ?auto_41056 ?auto_41058 ) ) ( not ( = ?auto_41056 ?auto_41059 ) ) ( not ( = ?auto_41057 ?auto_41058 ) ) ( not ( = ?auto_41057 ?auto_41059 ) ) ( not ( = ?auto_41058 ?auto_41059 ) ) ( ON-TABLE ?auto_41059 ) ( ON ?auto_41058 ?auto_41059 ) ( CLEAR ?auto_41056 ) ( ON ?auto_41057 ?auto_41058 ) ( CLEAR ?auto_41057 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_41059 ?auto_41058 )
      ( MAKE-6PILE ?auto_41054 ?auto_41055 ?auto_41056 ?auto_41057 ?auto_41058 ?auto_41059 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_41060 - BLOCK
      ?auto_41061 - BLOCK
      ?auto_41062 - BLOCK
      ?auto_41063 - BLOCK
      ?auto_41064 - BLOCK
      ?auto_41065 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_41060 ) ( ON ?auto_41061 ?auto_41060 ) ( not ( = ?auto_41060 ?auto_41061 ) ) ( not ( = ?auto_41060 ?auto_41062 ) ) ( not ( = ?auto_41060 ?auto_41063 ) ) ( not ( = ?auto_41060 ?auto_41064 ) ) ( not ( = ?auto_41060 ?auto_41065 ) ) ( not ( = ?auto_41061 ?auto_41062 ) ) ( not ( = ?auto_41061 ?auto_41063 ) ) ( not ( = ?auto_41061 ?auto_41064 ) ) ( not ( = ?auto_41061 ?auto_41065 ) ) ( not ( = ?auto_41062 ?auto_41063 ) ) ( not ( = ?auto_41062 ?auto_41064 ) ) ( not ( = ?auto_41062 ?auto_41065 ) ) ( not ( = ?auto_41063 ?auto_41064 ) ) ( not ( = ?auto_41063 ?auto_41065 ) ) ( not ( = ?auto_41064 ?auto_41065 ) ) ( ON-TABLE ?auto_41065 ) ( ON ?auto_41064 ?auto_41065 ) ( ON ?auto_41063 ?auto_41064 ) ( CLEAR ?auto_41063 ) ( HOLDING ?auto_41062 ) ( CLEAR ?auto_41061 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_41060 ?auto_41061 ?auto_41062 )
      ( MAKE-6PILE ?auto_41060 ?auto_41061 ?auto_41062 ?auto_41063 ?auto_41064 ?auto_41065 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_41066 - BLOCK
      ?auto_41067 - BLOCK
      ?auto_41068 - BLOCK
      ?auto_41069 - BLOCK
      ?auto_41070 - BLOCK
      ?auto_41071 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_41066 ) ( ON ?auto_41067 ?auto_41066 ) ( not ( = ?auto_41066 ?auto_41067 ) ) ( not ( = ?auto_41066 ?auto_41068 ) ) ( not ( = ?auto_41066 ?auto_41069 ) ) ( not ( = ?auto_41066 ?auto_41070 ) ) ( not ( = ?auto_41066 ?auto_41071 ) ) ( not ( = ?auto_41067 ?auto_41068 ) ) ( not ( = ?auto_41067 ?auto_41069 ) ) ( not ( = ?auto_41067 ?auto_41070 ) ) ( not ( = ?auto_41067 ?auto_41071 ) ) ( not ( = ?auto_41068 ?auto_41069 ) ) ( not ( = ?auto_41068 ?auto_41070 ) ) ( not ( = ?auto_41068 ?auto_41071 ) ) ( not ( = ?auto_41069 ?auto_41070 ) ) ( not ( = ?auto_41069 ?auto_41071 ) ) ( not ( = ?auto_41070 ?auto_41071 ) ) ( ON-TABLE ?auto_41071 ) ( ON ?auto_41070 ?auto_41071 ) ( ON ?auto_41069 ?auto_41070 ) ( CLEAR ?auto_41067 ) ( ON ?auto_41068 ?auto_41069 ) ( CLEAR ?auto_41068 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_41071 ?auto_41070 ?auto_41069 )
      ( MAKE-6PILE ?auto_41066 ?auto_41067 ?auto_41068 ?auto_41069 ?auto_41070 ?auto_41071 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_41072 - BLOCK
      ?auto_41073 - BLOCK
      ?auto_41074 - BLOCK
      ?auto_41075 - BLOCK
      ?auto_41076 - BLOCK
      ?auto_41077 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_41072 ) ( not ( = ?auto_41072 ?auto_41073 ) ) ( not ( = ?auto_41072 ?auto_41074 ) ) ( not ( = ?auto_41072 ?auto_41075 ) ) ( not ( = ?auto_41072 ?auto_41076 ) ) ( not ( = ?auto_41072 ?auto_41077 ) ) ( not ( = ?auto_41073 ?auto_41074 ) ) ( not ( = ?auto_41073 ?auto_41075 ) ) ( not ( = ?auto_41073 ?auto_41076 ) ) ( not ( = ?auto_41073 ?auto_41077 ) ) ( not ( = ?auto_41074 ?auto_41075 ) ) ( not ( = ?auto_41074 ?auto_41076 ) ) ( not ( = ?auto_41074 ?auto_41077 ) ) ( not ( = ?auto_41075 ?auto_41076 ) ) ( not ( = ?auto_41075 ?auto_41077 ) ) ( not ( = ?auto_41076 ?auto_41077 ) ) ( ON-TABLE ?auto_41077 ) ( ON ?auto_41076 ?auto_41077 ) ( ON ?auto_41075 ?auto_41076 ) ( ON ?auto_41074 ?auto_41075 ) ( CLEAR ?auto_41074 ) ( HOLDING ?auto_41073 ) ( CLEAR ?auto_41072 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_41072 ?auto_41073 )
      ( MAKE-6PILE ?auto_41072 ?auto_41073 ?auto_41074 ?auto_41075 ?auto_41076 ?auto_41077 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_41078 - BLOCK
      ?auto_41079 - BLOCK
      ?auto_41080 - BLOCK
      ?auto_41081 - BLOCK
      ?auto_41082 - BLOCK
      ?auto_41083 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_41078 ) ( not ( = ?auto_41078 ?auto_41079 ) ) ( not ( = ?auto_41078 ?auto_41080 ) ) ( not ( = ?auto_41078 ?auto_41081 ) ) ( not ( = ?auto_41078 ?auto_41082 ) ) ( not ( = ?auto_41078 ?auto_41083 ) ) ( not ( = ?auto_41079 ?auto_41080 ) ) ( not ( = ?auto_41079 ?auto_41081 ) ) ( not ( = ?auto_41079 ?auto_41082 ) ) ( not ( = ?auto_41079 ?auto_41083 ) ) ( not ( = ?auto_41080 ?auto_41081 ) ) ( not ( = ?auto_41080 ?auto_41082 ) ) ( not ( = ?auto_41080 ?auto_41083 ) ) ( not ( = ?auto_41081 ?auto_41082 ) ) ( not ( = ?auto_41081 ?auto_41083 ) ) ( not ( = ?auto_41082 ?auto_41083 ) ) ( ON-TABLE ?auto_41083 ) ( ON ?auto_41082 ?auto_41083 ) ( ON ?auto_41081 ?auto_41082 ) ( ON ?auto_41080 ?auto_41081 ) ( CLEAR ?auto_41078 ) ( ON ?auto_41079 ?auto_41080 ) ( CLEAR ?auto_41079 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_41083 ?auto_41082 ?auto_41081 ?auto_41080 )
      ( MAKE-6PILE ?auto_41078 ?auto_41079 ?auto_41080 ?auto_41081 ?auto_41082 ?auto_41083 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_41084 - BLOCK
      ?auto_41085 - BLOCK
      ?auto_41086 - BLOCK
      ?auto_41087 - BLOCK
      ?auto_41088 - BLOCK
      ?auto_41089 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_41084 ?auto_41085 ) ) ( not ( = ?auto_41084 ?auto_41086 ) ) ( not ( = ?auto_41084 ?auto_41087 ) ) ( not ( = ?auto_41084 ?auto_41088 ) ) ( not ( = ?auto_41084 ?auto_41089 ) ) ( not ( = ?auto_41085 ?auto_41086 ) ) ( not ( = ?auto_41085 ?auto_41087 ) ) ( not ( = ?auto_41085 ?auto_41088 ) ) ( not ( = ?auto_41085 ?auto_41089 ) ) ( not ( = ?auto_41086 ?auto_41087 ) ) ( not ( = ?auto_41086 ?auto_41088 ) ) ( not ( = ?auto_41086 ?auto_41089 ) ) ( not ( = ?auto_41087 ?auto_41088 ) ) ( not ( = ?auto_41087 ?auto_41089 ) ) ( not ( = ?auto_41088 ?auto_41089 ) ) ( ON-TABLE ?auto_41089 ) ( ON ?auto_41088 ?auto_41089 ) ( ON ?auto_41087 ?auto_41088 ) ( ON ?auto_41086 ?auto_41087 ) ( ON ?auto_41085 ?auto_41086 ) ( CLEAR ?auto_41085 ) ( HOLDING ?auto_41084 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_41084 )
      ( MAKE-6PILE ?auto_41084 ?auto_41085 ?auto_41086 ?auto_41087 ?auto_41088 ?auto_41089 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_41090 - BLOCK
      ?auto_41091 - BLOCK
      ?auto_41092 - BLOCK
      ?auto_41093 - BLOCK
      ?auto_41094 - BLOCK
      ?auto_41095 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_41090 ?auto_41091 ) ) ( not ( = ?auto_41090 ?auto_41092 ) ) ( not ( = ?auto_41090 ?auto_41093 ) ) ( not ( = ?auto_41090 ?auto_41094 ) ) ( not ( = ?auto_41090 ?auto_41095 ) ) ( not ( = ?auto_41091 ?auto_41092 ) ) ( not ( = ?auto_41091 ?auto_41093 ) ) ( not ( = ?auto_41091 ?auto_41094 ) ) ( not ( = ?auto_41091 ?auto_41095 ) ) ( not ( = ?auto_41092 ?auto_41093 ) ) ( not ( = ?auto_41092 ?auto_41094 ) ) ( not ( = ?auto_41092 ?auto_41095 ) ) ( not ( = ?auto_41093 ?auto_41094 ) ) ( not ( = ?auto_41093 ?auto_41095 ) ) ( not ( = ?auto_41094 ?auto_41095 ) ) ( ON-TABLE ?auto_41095 ) ( ON ?auto_41094 ?auto_41095 ) ( ON ?auto_41093 ?auto_41094 ) ( ON ?auto_41092 ?auto_41093 ) ( ON ?auto_41091 ?auto_41092 ) ( ON ?auto_41090 ?auto_41091 ) ( CLEAR ?auto_41090 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_41095 ?auto_41094 ?auto_41093 ?auto_41092 ?auto_41091 )
      ( MAKE-6PILE ?auto_41090 ?auto_41091 ?auto_41092 ?auto_41093 ?auto_41094 ?auto_41095 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_41096 - BLOCK
      ?auto_41097 - BLOCK
      ?auto_41098 - BLOCK
      ?auto_41099 - BLOCK
      ?auto_41100 - BLOCK
      ?auto_41101 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_41096 ?auto_41097 ) ) ( not ( = ?auto_41096 ?auto_41098 ) ) ( not ( = ?auto_41096 ?auto_41099 ) ) ( not ( = ?auto_41096 ?auto_41100 ) ) ( not ( = ?auto_41096 ?auto_41101 ) ) ( not ( = ?auto_41097 ?auto_41098 ) ) ( not ( = ?auto_41097 ?auto_41099 ) ) ( not ( = ?auto_41097 ?auto_41100 ) ) ( not ( = ?auto_41097 ?auto_41101 ) ) ( not ( = ?auto_41098 ?auto_41099 ) ) ( not ( = ?auto_41098 ?auto_41100 ) ) ( not ( = ?auto_41098 ?auto_41101 ) ) ( not ( = ?auto_41099 ?auto_41100 ) ) ( not ( = ?auto_41099 ?auto_41101 ) ) ( not ( = ?auto_41100 ?auto_41101 ) ) ( ON-TABLE ?auto_41101 ) ( ON ?auto_41100 ?auto_41101 ) ( ON ?auto_41099 ?auto_41100 ) ( ON ?auto_41098 ?auto_41099 ) ( ON ?auto_41097 ?auto_41098 ) ( HOLDING ?auto_41096 ) ( CLEAR ?auto_41097 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_41101 ?auto_41100 ?auto_41099 ?auto_41098 ?auto_41097 ?auto_41096 )
      ( MAKE-6PILE ?auto_41096 ?auto_41097 ?auto_41098 ?auto_41099 ?auto_41100 ?auto_41101 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_41102 - BLOCK
      ?auto_41103 - BLOCK
      ?auto_41104 - BLOCK
      ?auto_41105 - BLOCK
      ?auto_41106 - BLOCK
      ?auto_41107 - BLOCK
    )
    :vars
    (
      ?auto_41108 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_41102 ?auto_41103 ) ) ( not ( = ?auto_41102 ?auto_41104 ) ) ( not ( = ?auto_41102 ?auto_41105 ) ) ( not ( = ?auto_41102 ?auto_41106 ) ) ( not ( = ?auto_41102 ?auto_41107 ) ) ( not ( = ?auto_41103 ?auto_41104 ) ) ( not ( = ?auto_41103 ?auto_41105 ) ) ( not ( = ?auto_41103 ?auto_41106 ) ) ( not ( = ?auto_41103 ?auto_41107 ) ) ( not ( = ?auto_41104 ?auto_41105 ) ) ( not ( = ?auto_41104 ?auto_41106 ) ) ( not ( = ?auto_41104 ?auto_41107 ) ) ( not ( = ?auto_41105 ?auto_41106 ) ) ( not ( = ?auto_41105 ?auto_41107 ) ) ( not ( = ?auto_41106 ?auto_41107 ) ) ( ON-TABLE ?auto_41107 ) ( ON ?auto_41106 ?auto_41107 ) ( ON ?auto_41105 ?auto_41106 ) ( ON ?auto_41104 ?auto_41105 ) ( ON ?auto_41103 ?auto_41104 ) ( CLEAR ?auto_41103 ) ( ON ?auto_41102 ?auto_41108 ) ( CLEAR ?auto_41102 ) ( HAND-EMPTY ) ( not ( = ?auto_41102 ?auto_41108 ) ) ( not ( = ?auto_41103 ?auto_41108 ) ) ( not ( = ?auto_41104 ?auto_41108 ) ) ( not ( = ?auto_41105 ?auto_41108 ) ) ( not ( = ?auto_41106 ?auto_41108 ) ) ( not ( = ?auto_41107 ?auto_41108 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_41102 ?auto_41108 )
      ( MAKE-6PILE ?auto_41102 ?auto_41103 ?auto_41104 ?auto_41105 ?auto_41106 ?auto_41107 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_41109 - BLOCK
      ?auto_41110 - BLOCK
      ?auto_41111 - BLOCK
      ?auto_41112 - BLOCK
      ?auto_41113 - BLOCK
      ?auto_41114 - BLOCK
    )
    :vars
    (
      ?auto_41115 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_41109 ?auto_41110 ) ) ( not ( = ?auto_41109 ?auto_41111 ) ) ( not ( = ?auto_41109 ?auto_41112 ) ) ( not ( = ?auto_41109 ?auto_41113 ) ) ( not ( = ?auto_41109 ?auto_41114 ) ) ( not ( = ?auto_41110 ?auto_41111 ) ) ( not ( = ?auto_41110 ?auto_41112 ) ) ( not ( = ?auto_41110 ?auto_41113 ) ) ( not ( = ?auto_41110 ?auto_41114 ) ) ( not ( = ?auto_41111 ?auto_41112 ) ) ( not ( = ?auto_41111 ?auto_41113 ) ) ( not ( = ?auto_41111 ?auto_41114 ) ) ( not ( = ?auto_41112 ?auto_41113 ) ) ( not ( = ?auto_41112 ?auto_41114 ) ) ( not ( = ?auto_41113 ?auto_41114 ) ) ( ON-TABLE ?auto_41114 ) ( ON ?auto_41113 ?auto_41114 ) ( ON ?auto_41112 ?auto_41113 ) ( ON ?auto_41111 ?auto_41112 ) ( ON ?auto_41109 ?auto_41115 ) ( CLEAR ?auto_41109 ) ( not ( = ?auto_41109 ?auto_41115 ) ) ( not ( = ?auto_41110 ?auto_41115 ) ) ( not ( = ?auto_41111 ?auto_41115 ) ) ( not ( = ?auto_41112 ?auto_41115 ) ) ( not ( = ?auto_41113 ?auto_41115 ) ) ( not ( = ?auto_41114 ?auto_41115 ) ) ( HOLDING ?auto_41110 ) ( CLEAR ?auto_41111 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_41114 ?auto_41113 ?auto_41112 ?auto_41111 ?auto_41110 )
      ( MAKE-6PILE ?auto_41109 ?auto_41110 ?auto_41111 ?auto_41112 ?auto_41113 ?auto_41114 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_41116 - BLOCK
      ?auto_41117 - BLOCK
      ?auto_41118 - BLOCK
      ?auto_41119 - BLOCK
      ?auto_41120 - BLOCK
      ?auto_41121 - BLOCK
    )
    :vars
    (
      ?auto_41122 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_41116 ?auto_41117 ) ) ( not ( = ?auto_41116 ?auto_41118 ) ) ( not ( = ?auto_41116 ?auto_41119 ) ) ( not ( = ?auto_41116 ?auto_41120 ) ) ( not ( = ?auto_41116 ?auto_41121 ) ) ( not ( = ?auto_41117 ?auto_41118 ) ) ( not ( = ?auto_41117 ?auto_41119 ) ) ( not ( = ?auto_41117 ?auto_41120 ) ) ( not ( = ?auto_41117 ?auto_41121 ) ) ( not ( = ?auto_41118 ?auto_41119 ) ) ( not ( = ?auto_41118 ?auto_41120 ) ) ( not ( = ?auto_41118 ?auto_41121 ) ) ( not ( = ?auto_41119 ?auto_41120 ) ) ( not ( = ?auto_41119 ?auto_41121 ) ) ( not ( = ?auto_41120 ?auto_41121 ) ) ( ON-TABLE ?auto_41121 ) ( ON ?auto_41120 ?auto_41121 ) ( ON ?auto_41119 ?auto_41120 ) ( ON ?auto_41118 ?auto_41119 ) ( ON ?auto_41116 ?auto_41122 ) ( not ( = ?auto_41116 ?auto_41122 ) ) ( not ( = ?auto_41117 ?auto_41122 ) ) ( not ( = ?auto_41118 ?auto_41122 ) ) ( not ( = ?auto_41119 ?auto_41122 ) ) ( not ( = ?auto_41120 ?auto_41122 ) ) ( not ( = ?auto_41121 ?auto_41122 ) ) ( CLEAR ?auto_41118 ) ( ON ?auto_41117 ?auto_41116 ) ( CLEAR ?auto_41117 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_41122 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_41122 ?auto_41116 )
      ( MAKE-6PILE ?auto_41116 ?auto_41117 ?auto_41118 ?auto_41119 ?auto_41120 ?auto_41121 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_41123 - BLOCK
      ?auto_41124 - BLOCK
      ?auto_41125 - BLOCK
      ?auto_41126 - BLOCK
      ?auto_41127 - BLOCK
      ?auto_41128 - BLOCK
    )
    :vars
    (
      ?auto_41129 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_41123 ?auto_41124 ) ) ( not ( = ?auto_41123 ?auto_41125 ) ) ( not ( = ?auto_41123 ?auto_41126 ) ) ( not ( = ?auto_41123 ?auto_41127 ) ) ( not ( = ?auto_41123 ?auto_41128 ) ) ( not ( = ?auto_41124 ?auto_41125 ) ) ( not ( = ?auto_41124 ?auto_41126 ) ) ( not ( = ?auto_41124 ?auto_41127 ) ) ( not ( = ?auto_41124 ?auto_41128 ) ) ( not ( = ?auto_41125 ?auto_41126 ) ) ( not ( = ?auto_41125 ?auto_41127 ) ) ( not ( = ?auto_41125 ?auto_41128 ) ) ( not ( = ?auto_41126 ?auto_41127 ) ) ( not ( = ?auto_41126 ?auto_41128 ) ) ( not ( = ?auto_41127 ?auto_41128 ) ) ( ON-TABLE ?auto_41128 ) ( ON ?auto_41127 ?auto_41128 ) ( ON ?auto_41126 ?auto_41127 ) ( ON ?auto_41123 ?auto_41129 ) ( not ( = ?auto_41123 ?auto_41129 ) ) ( not ( = ?auto_41124 ?auto_41129 ) ) ( not ( = ?auto_41125 ?auto_41129 ) ) ( not ( = ?auto_41126 ?auto_41129 ) ) ( not ( = ?auto_41127 ?auto_41129 ) ) ( not ( = ?auto_41128 ?auto_41129 ) ) ( ON ?auto_41124 ?auto_41123 ) ( CLEAR ?auto_41124 ) ( ON-TABLE ?auto_41129 ) ( HOLDING ?auto_41125 ) ( CLEAR ?auto_41126 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_41128 ?auto_41127 ?auto_41126 ?auto_41125 )
      ( MAKE-6PILE ?auto_41123 ?auto_41124 ?auto_41125 ?auto_41126 ?auto_41127 ?auto_41128 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_41130 - BLOCK
      ?auto_41131 - BLOCK
      ?auto_41132 - BLOCK
      ?auto_41133 - BLOCK
      ?auto_41134 - BLOCK
      ?auto_41135 - BLOCK
    )
    :vars
    (
      ?auto_41136 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_41130 ?auto_41131 ) ) ( not ( = ?auto_41130 ?auto_41132 ) ) ( not ( = ?auto_41130 ?auto_41133 ) ) ( not ( = ?auto_41130 ?auto_41134 ) ) ( not ( = ?auto_41130 ?auto_41135 ) ) ( not ( = ?auto_41131 ?auto_41132 ) ) ( not ( = ?auto_41131 ?auto_41133 ) ) ( not ( = ?auto_41131 ?auto_41134 ) ) ( not ( = ?auto_41131 ?auto_41135 ) ) ( not ( = ?auto_41132 ?auto_41133 ) ) ( not ( = ?auto_41132 ?auto_41134 ) ) ( not ( = ?auto_41132 ?auto_41135 ) ) ( not ( = ?auto_41133 ?auto_41134 ) ) ( not ( = ?auto_41133 ?auto_41135 ) ) ( not ( = ?auto_41134 ?auto_41135 ) ) ( ON-TABLE ?auto_41135 ) ( ON ?auto_41134 ?auto_41135 ) ( ON ?auto_41133 ?auto_41134 ) ( ON ?auto_41130 ?auto_41136 ) ( not ( = ?auto_41130 ?auto_41136 ) ) ( not ( = ?auto_41131 ?auto_41136 ) ) ( not ( = ?auto_41132 ?auto_41136 ) ) ( not ( = ?auto_41133 ?auto_41136 ) ) ( not ( = ?auto_41134 ?auto_41136 ) ) ( not ( = ?auto_41135 ?auto_41136 ) ) ( ON ?auto_41131 ?auto_41130 ) ( ON-TABLE ?auto_41136 ) ( CLEAR ?auto_41133 ) ( ON ?auto_41132 ?auto_41131 ) ( CLEAR ?auto_41132 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_41136 ?auto_41130 ?auto_41131 )
      ( MAKE-6PILE ?auto_41130 ?auto_41131 ?auto_41132 ?auto_41133 ?auto_41134 ?auto_41135 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_41137 - BLOCK
      ?auto_41138 - BLOCK
      ?auto_41139 - BLOCK
      ?auto_41140 - BLOCK
      ?auto_41141 - BLOCK
      ?auto_41142 - BLOCK
    )
    :vars
    (
      ?auto_41143 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_41137 ?auto_41138 ) ) ( not ( = ?auto_41137 ?auto_41139 ) ) ( not ( = ?auto_41137 ?auto_41140 ) ) ( not ( = ?auto_41137 ?auto_41141 ) ) ( not ( = ?auto_41137 ?auto_41142 ) ) ( not ( = ?auto_41138 ?auto_41139 ) ) ( not ( = ?auto_41138 ?auto_41140 ) ) ( not ( = ?auto_41138 ?auto_41141 ) ) ( not ( = ?auto_41138 ?auto_41142 ) ) ( not ( = ?auto_41139 ?auto_41140 ) ) ( not ( = ?auto_41139 ?auto_41141 ) ) ( not ( = ?auto_41139 ?auto_41142 ) ) ( not ( = ?auto_41140 ?auto_41141 ) ) ( not ( = ?auto_41140 ?auto_41142 ) ) ( not ( = ?auto_41141 ?auto_41142 ) ) ( ON-TABLE ?auto_41142 ) ( ON ?auto_41141 ?auto_41142 ) ( ON ?auto_41137 ?auto_41143 ) ( not ( = ?auto_41137 ?auto_41143 ) ) ( not ( = ?auto_41138 ?auto_41143 ) ) ( not ( = ?auto_41139 ?auto_41143 ) ) ( not ( = ?auto_41140 ?auto_41143 ) ) ( not ( = ?auto_41141 ?auto_41143 ) ) ( not ( = ?auto_41142 ?auto_41143 ) ) ( ON ?auto_41138 ?auto_41137 ) ( ON-TABLE ?auto_41143 ) ( ON ?auto_41139 ?auto_41138 ) ( CLEAR ?auto_41139 ) ( HOLDING ?auto_41140 ) ( CLEAR ?auto_41141 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_41142 ?auto_41141 ?auto_41140 )
      ( MAKE-6PILE ?auto_41137 ?auto_41138 ?auto_41139 ?auto_41140 ?auto_41141 ?auto_41142 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_41144 - BLOCK
      ?auto_41145 - BLOCK
      ?auto_41146 - BLOCK
      ?auto_41147 - BLOCK
      ?auto_41148 - BLOCK
      ?auto_41149 - BLOCK
    )
    :vars
    (
      ?auto_41150 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_41144 ?auto_41145 ) ) ( not ( = ?auto_41144 ?auto_41146 ) ) ( not ( = ?auto_41144 ?auto_41147 ) ) ( not ( = ?auto_41144 ?auto_41148 ) ) ( not ( = ?auto_41144 ?auto_41149 ) ) ( not ( = ?auto_41145 ?auto_41146 ) ) ( not ( = ?auto_41145 ?auto_41147 ) ) ( not ( = ?auto_41145 ?auto_41148 ) ) ( not ( = ?auto_41145 ?auto_41149 ) ) ( not ( = ?auto_41146 ?auto_41147 ) ) ( not ( = ?auto_41146 ?auto_41148 ) ) ( not ( = ?auto_41146 ?auto_41149 ) ) ( not ( = ?auto_41147 ?auto_41148 ) ) ( not ( = ?auto_41147 ?auto_41149 ) ) ( not ( = ?auto_41148 ?auto_41149 ) ) ( ON-TABLE ?auto_41149 ) ( ON ?auto_41148 ?auto_41149 ) ( ON ?auto_41144 ?auto_41150 ) ( not ( = ?auto_41144 ?auto_41150 ) ) ( not ( = ?auto_41145 ?auto_41150 ) ) ( not ( = ?auto_41146 ?auto_41150 ) ) ( not ( = ?auto_41147 ?auto_41150 ) ) ( not ( = ?auto_41148 ?auto_41150 ) ) ( not ( = ?auto_41149 ?auto_41150 ) ) ( ON ?auto_41145 ?auto_41144 ) ( ON-TABLE ?auto_41150 ) ( ON ?auto_41146 ?auto_41145 ) ( CLEAR ?auto_41148 ) ( ON ?auto_41147 ?auto_41146 ) ( CLEAR ?auto_41147 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_41150 ?auto_41144 ?auto_41145 ?auto_41146 )
      ( MAKE-6PILE ?auto_41144 ?auto_41145 ?auto_41146 ?auto_41147 ?auto_41148 ?auto_41149 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_41151 - BLOCK
      ?auto_41152 - BLOCK
      ?auto_41153 - BLOCK
      ?auto_41154 - BLOCK
      ?auto_41155 - BLOCK
      ?auto_41156 - BLOCK
    )
    :vars
    (
      ?auto_41157 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_41151 ?auto_41152 ) ) ( not ( = ?auto_41151 ?auto_41153 ) ) ( not ( = ?auto_41151 ?auto_41154 ) ) ( not ( = ?auto_41151 ?auto_41155 ) ) ( not ( = ?auto_41151 ?auto_41156 ) ) ( not ( = ?auto_41152 ?auto_41153 ) ) ( not ( = ?auto_41152 ?auto_41154 ) ) ( not ( = ?auto_41152 ?auto_41155 ) ) ( not ( = ?auto_41152 ?auto_41156 ) ) ( not ( = ?auto_41153 ?auto_41154 ) ) ( not ( = ?auto_41153 ?auto_41155 ) ) ( not ( = ?auto_41153 ?auto_41156 ) ) ( not ( = ?auto_41154 ?auto_41155 ) ) ( not ( = ?auto_41154 ?auto_41156 ) ) ( not ( = ?auto_41155 ?auto_41156 ) ) ( ON-TABLE ?auto_41156 ) ( ON ?auto_41151 ?auto_41157 ) ( not ( = ?auto_41151 ?auto_41157 ) ) ( not ( = ?auto_41152 ?auto_41157 ) ) ( not ( = ?auto_41153 ?auto_41157 ) ) ( not ( = ?auto_41154 ?auto_41157 ) ) ( not ( = ?auto_41155 ?auto_41157 ) ) ( not ( = ?auto_41156 ?auto_41157 ) ) ( ON ?auto_41152 ?auto_41151 ) ( ON-TABLE ?auto_41157 ) ( ON ?auto_41153 ?auto_41152 ) ( ON ?auto_41154 ?auto_41153 ) ( CLEAR ?auto_41154 ) ( HOLDING ?auto_41155 ) ( CLEAR ?auto_41156 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_41156 ?auto_41155 )
      ( MAKE-6PILE ?auto_41151 ?auto_41152 ?auto_41153 ?auto_41154 ?auto_41155 ?auto_41156 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_41158 - BLOCK
      ?auto_41159 - BLOCK
      ?auto_41160 - BLOCK
      ?auto_41161 - BLOCK
      ?auto_41162 - BLOCK
      ?auto_41163 - BLOCK
    )
    :vars
    (
      ?auto_41164 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_41158 ?auto_41159 ) ) ( not ( = ?auto_41158 ?auto_41160 ) ) ( not ( = ?auto_41158 ?auto_41161 ) ) ( not ( = ?auto_41158 ?auto_41162 ) ) ( not ( = ?auto_41158 ?auto_41163 ) ) ( not ( = ?auto_41159 ?auto_41160 ) ) ( not ( = ?auto_41159 ?auto_41161 ) ) ( not ( = ?auto_41159 ?auto_41162 ) ) ( not ( = ?auto_41159 ?auto_41163 ) ) ( not ( = ?auto_41160 ?auto_41161 ) ) ( not ( = ?auto_41160 ?auto_41162 ) ) ( not ( = ?auto_41160 ?auto_41163 ) ) ( not ( = ?auto_41161 ?auto_41162 ) ) ( not ( = ?auto_41161 ?auto_41163 ) ) ( not ( = ?auto_41162 ?auto_41163 ) ) ( ON-TABLE ?auto_41163 ) ( ON ?auto_41158 ?auto_41164 ) ( not ( = ?auto_41158 ?auto_41164 ) ) ( not ( = ?auto_41159 ?auto_41164 ) ) ( not ( = ?auto_41160 ?auto_41164 ) ) ( not ( = ?auto_41161 ?auto_41164 ) ) ( not ( = ?auto_41162 ?auto_41164 ) ) ( not ( = ?auto_41163 ?auto_41164 ) ) ( ON ?auto_41159 ?auto_41158 ) ( ON-TABLE ?auto_41164 ) ( ON ?auto_41160 ?auto_41159 ) ( ON ?auto_41161 ?auto_41160 ) ( CLEAR ?auto_41163 ) ( ON ?auto_41162 ?auto_41161 ) ( CLEAR ?auto_41162 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_41164 ?auto_41158 ?auto_41159 ?auto_41160 ?auto_41161 )
      ( MAKE-6PILE ?auto_41158 ?auto_41159 ?auto_41160 ?auto_41161 ?auto_41162 ?auto_41163 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_41165 - BLOCK
      ?auto_41166 - BLOCK
      ?auto_41167 - BLOCK
      ?auto_41168 - BLOCK
      ?auto_41169 - BLOCK
      ?auto_41170 - BLOCK
    )
    :vars
    (
      ?auto_41171 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_41165 ?auto_41166 ) ) ( not ( = ?auto_41165 ?auto_41167 ) ) ( not ( = ?auto_41165 ?auto_41168 ) ) ( not ( = ?auto_41165 ?auto_41169 ) ) ( not ( = ?auto_41165 ?auto_41170 ) ) ( not ( = ?auto_41166 ?auto_41167 ) ) ( not ( = ?auto_41166 ?auto_41168 ) ) ( not ( = ?auto_41166 ?auto_41169 ) ) ( not ( = ?auto_41166 ?auto_41170 ) ) ( not ( = ?auto_41167 ?auto_41168 ) ) ( not ( = ?auto_41167 ?auto_41169 ) ) ( not ( = ?auto_41167 ?auto_41170 ) ) ( not ( = ?auto_41168 ?auto_41169 ) ) ( not ( = ?auto_41168 ?auto_41170 ) ) ( not ( = ?auto_41169 ?auto_41170 ) ) ( ON ?auto_41165 ?auto_41171 ) ( not ( = ?auto_41165 ?auto_41171 ) ) ( not ( = ?auto_41166 ?auto_41171 ) ) ( not ( = ?auto_41167 ?auto_41171 ) ) ( not ( = ?auto_41168 ?auto_41171 ) ) ( not ( = ?auto_41169 ?auto_41171 ) ) ( not ( = ?auto_41170 ?auto_41171 ) ) ( ON ?auto_41166 ?auto_41165 ) ( ON-TABLE ?auto_41171 ) ( ON ?auto_41167 ?auto_41166 ) ( ON ?auto_41168 ?auto_41167 ) ( ON ?auto_41169 ?auto_41168 ) ( CLEAR ?auto_41169 ) ( HOLDING ?auto_41170 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_41170 )
      ( MAKE-6PILE ?auto_41165 ?auto_41166 ?auto_41167 ?auto_41168 ?auto_41169 ?auto_41170 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_41172 - BLOCK
      ?auto_41173 - BLOCK
      ?auto_41174 - BLOCK
      ?auto_41175 - BLOCK
      ?auto_41176 - BLOCK
      ?auto_41177 - BLOCK
    )
    :vars
    (
      ?auto_41178 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_41172 ?auto_41173 ) ) ( not ( = ?auto_41172 ?auto_41174 ) ) ( not ( = ?auto_41172 ?auto_41175 ) ) ( not ( = ?auto_41172 ?auto_41176 ) ) ( not ( = ?auto_41172 ?auto_41177 ) ) ( not ( = ?auto_41173 ?auto_41174 ) ) ( not ( = ?auto_41173 ?auto_41175 ) ) ( not ( = ?auto_41173 ?auto_41176 ) ) ( not ( = ?auto_41173 ?auto_41177 ) ) ( not ( = ?auto_41174 ?auto_41175 ) ) ( not ( = ?auto_41174 ?auto_41176 ) ) ( not ( = ?auto_41174 ?auto_41177 ) ) ( not ( = ?auto_41175 ?auto_41176 ) ) ( not ( = ?auto_41175 ?auto_41177 ) ) ( not ( = ?auto_41176 ?auto_41177 ) ) ( ON ?auto_41172 ?auto_41178 ) ( not ( = ?auto_41172 ?auto_41178 ) ) ( not ( = ?auto_41173 ?auto_41178 ) ) ( not ( = ?auto_41174 ?auto_41178 ) ) ( not ( = ?auto_41175 ?auto_41178 ) ) ( not ( = ?auto_41176 ?auto_41178 ) ) ( not ( = ?auto_41177 ?auto_41178 ) ) ( ON ?auto_41173 ?auto_41172 ) ( ON-TABLE ?auto_41178 ) ( ON ?auto_41174 ?auto_41173 ) ( ON ?auto_41175 ?auto_41174 ) ( ON ?auto_41176 ?auto_41175 ) ( ON ?auto_41177 ?auto_41176 ) ( CLEAR ?auto_41177 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_41178 ?auto_41172 ?auto_41173 ?auto_41174 ?auto_41175 ?auto_41176 )
      ( MAKE-6PILE ?auto_41172 ?auto_41173 ?auto_41174 ?auto_41175 ?auto_41176 ?auto_41177 ) )
  )

)

