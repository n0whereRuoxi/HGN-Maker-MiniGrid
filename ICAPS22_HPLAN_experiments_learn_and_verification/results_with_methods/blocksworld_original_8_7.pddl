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

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_162403 - BLOCK
      ?auto_162404 - BLOCK
      ?auto_162405 - BLOCK
      ?auto_162406 - BLOCK
      ?auto_162407 - BLOCK
      ?auto_162408 - BLOCK
      ?auto_162409 - BLOCK
      ?auto_162410 - BLOCK
    )
    :vars
    (
      ?auto_162411 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_162411 ?auto_162410 ) ( CLEAR ?auto_162411 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_162403 ) ( ON ?auto_162404 ?auto_162403 ) ( ON ?auto_162405 ?auto_162404 ) ( ON ?auto_162406 ?auto_162405 ) ( ON ?auto_162407 ?auto_162406 ) ( ON ?auto_162408 ?auto_162407 ) ( ON ?auto_162409 ?auto_162408 ) ( ON ?auto_162410 ?auto_162409 ) ( not ( = ?auto_162403 ?auto_162404 ) ) ( not ( = ?auto_162403 ?auto_162405 ) ) ( not ( = ?auto_162403 ?auto_162406 ) ) ( not ( = ?auto_162403 ?auto_162407 ) ) ( not ( = ?auto_162403 ?auto_162408 ) ) ( not ( = ?auto_162403 ?auto_162409 ) ) ( not ( = ?auto_162403 ?auto_162410 ) ) ( not ( = ?auto_162403 ?auto_162411 ) ) ( not ( = ?auto_162404 ?auto_162405 ) ) ( not ( = ?auto_162404 ?auto_162406 ) ) ( not ( = ?auto_162404 ?auto_162407 ) ) ( not ( = ?auto_162404 ?auto_162408 ) ) ( not ( = ?auto_162404 ?auto_162409 ) ) ( not ( = ?auto_162404 ?auto_162410 ) ) ( not ( = ?auto_162404 ?auto_162411 ) ) ( not ( = ?auto_162405 ?auto_162406 ) ) ( not ( = ?auto_162405 ?auto_162407 ) ) ( not ( = ?auto_162405 ?auto_162408 ) ) ( not ( = ?auto_162405 ?auto_162409 ) ) ( not ( = ?auto_162405 ?auto_162410 ) ) ( not ( = ?auto_162405 ?auto_162411 ) ) ( not ( = ?auto_162406 ?auto_162407 ) ) ( not ( = ?auto_162406 ?auto_162408 ) ) ( not ( = ?auto_162406 ?auto_162409 ) ) ( not ( = ?auto_162406 ?auto_162410 ) ) ( not ( = ?auto_162406 ?auto_162411 ) ) ( not ( = ?auto_162407 ?auto_162408 ) ) ( not ( = ?auto_162407 ?auto_162409 ) ) ( not ( = ?auto_162407 ?auto_162410 ) ) ( not ( = ?auto_162407 ?auto_162411 ) ) ( not ( = ?auto_162408 ?auto_162409 ) ) ( not ( = ?auto_162408 ?auto_162410 ) ) ( not ( = ?auto_162408 ?auto_162411 ) ) ( not ( = ?auto_162409 ?auto_162410 ) ) ( not ( = ?auto_162409 ?auto_162411 ) ) ( not ( = ?auto_162410 ?auto_162411 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_162411 ?auto_162410 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_162413 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_162413 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_162413 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_162414 - BLOCK
    )
    :vars
    (
      ?auto_162415 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_162414 ?auto_162415 ) ( CLEAR ?auto_162414 ) ( HAND-EMPTY ) ( not ( = ?auto_162414 ?auto_162415 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_162414 ?auto_162415 )
      ( MAKE-1PILE ?auto_162414 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_162423 - BLOCK
      ?auto_162424 - BLOCK
      ?auto_162425 - BLOCK
      ?auto_162426 - BLOCK
      ?auto_162427 - BLOCK
      ?auto_162428 - BLOCK
      ?auto_162429 - BLOCK
    )
    :vars
    (
      ?auto_162430 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_162430 ?auto_162429 ) ( CLEAR ?auto_162430 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_162423 ) ( ON ?auto_162424 ?auto_162423 ) ( ON ?auto_162425 ?auto_162424 ) ( ON ?auto_162426 ?auto_162425 ) ( ON ?auto_162427 ?auto_162426 ) ( ON ?auto_162428 ?auto_162427 ) ( ON ?auto_162429 ?auto_162428 ) ( not ( = ?auto_162423 ?auto_162424 ) ) ( not ( = ?auto_162423 ?auto_162425 ) ) ( not ( = ?auto_162423 ?auto_162426 ) ) ( not ( = ?auto_162423 ?auto_162427 ) ) ( not ( = ?auto_162423 ?auto_162428 ) ) ( not ( = ?auto_162423 ?auto_162429 ) ) ( not ( = ?auto_162423 ?auto_162430 ) ) ( not ( = ?auto_162424 ?auto_162425 ) ) ( not ( = ?auto_162424 ?auto_162426 ) ) ( not ( = ?auto_162424 ?auto_162427 ) ) ( not ( = ?auto_162424 ?auto_162428 ) ) ( not ( = ?auto_162424 ?auto_162429 ) ) ( not ( = ?auto_162424 ?auto_162430 ) ) ( not ( = ?auto_162425 ?auto_162426 ) ) ( not ( = ?auto_162425 ?auto_162427 ) ) ( not ( = ?auto_162425 ?auto_162428 ) ) ( not ( = ?auto_162425 ?auto_162429 ) ) ( not ( = ?auto_162425 ?auto_162430 ) ) ( not ( = ?auto_162426 ?auto_162427 ) ) ( not ( = ?auto_162426 ?auto_162428 ) ) ( not ( = ?auto_162426 ?auto_162429 ) ) ( not ( = ?auto_162426 ?auto_162430 ) ) ( not ( = ?auto_162427 ?auto_162428 ) ) ( not ( = ?auto_162427 ?auto_162429 ) ) ( not ( = ?auto_162427 ?auto_162430 ) ) ( not ( = ?auto_162428 ?auto_162429 ) ) ( not ( = ?auto_162428 ?auto_162430 ) ) ( not ( = ?auto_162429 ?auto_162430 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_162430 ?auto_162429 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_162431 - BLOCK
      ?auto_162432 - BLOCK
      ?auto_162433 - BLOCK
      ?auto_162434 - BLOCK
      ?auto_162435 - BLOCK
      ?auto_162436 - BLOCK
      ?auto_162437 - BLOCK
    )
    :vars
    (
      ?auto_162438 - BLOCK
      ?auto_162439 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_162438 ?auto_162437 ) ( CLEAR ?auto_162438 ) ( ON-TABLE ?auto_162431 ) ( ON ?auto_162432 ?auto_162431 ) ( ON ?auto_162433 ?auto_162432 ) ( ON ?auto_162434 ?auto_162433 ) ( ON ?auto_162435 ?auto_162434 ) ( ON ?auto_162436 ?auto_162435 ) ( ON ?auto_162437 ?auto_162436 ) ( not ( = ?auto_162431 ?auto_162432 ) ) ( not ( = ?auto_162431 ?auto_162433 ) ) ( not ( = ?auto_162431 ?auto_162434 ) ) ( not ( = ?auto_162431 ?auto_162435 ) ) ( not ( = ?auto_162431 ?auto_162436 ) ) ( not ( = ?auto_162431 ?auto_162437 ) ) ( not ( = ?auto_162431 ?auto_162438 ) ) ( not ( = ?auto_162432 ?auto_162433 ) ) ( not ( = ?auto_162432 ?auto_162434 ) ) ( not ( = ?auto_162432 ?auto_162435 ) ) ( not ( = ?auto_162432 ?auto_162436 ) ) ( not ( = ?auto_162432 ?auto_162437 ) ) ( not ( = ?auto_162432 ?auto_162438 ) ) ( not ( = ?auto_162433 ?auto_162434 ) ) ( not ( = ?auto_162433 ?auto_162435 ) ) ( not ( = ?auto_162433 ?auto_162436 ) ) ( not ( = ?auto_162433 ?auto_162437 ) ) ( not ( = ?auto_162433 ?auto_162438 ) ) ( not ( = ?auto_162434 ?auto_162435 ) ) ( not ( = ?auto_162434 ?auto_162436 ) ) ( not ( = ?auto_162434 ?auto_162437 ) ) ( not ( = ?auto_162434 ?auto_162438 ) ) ( not ( = ?auto_162435 ?auto_162436 ) ) ( not ( = ?auto_162435 ?auto_162437 ) ) ( not ( = ?auto_162435 ?auto_162438 ) ) ( not ( = ?auto_162436 ?auto_162437 ) ) ( not ( = ?auto_162436 ?auto_162438 ) ) ( not ( = ?auto_162437 ?auto_162438 ) ) ( HOLDING ?auto_162439 ) ( not ( = ?auto_162431 ?auto_162439 ) ) ( not ( = ?auto_162432 ?auto_162439 ) ) ( not ( = ?auto_162433 ?auto_162439 ) ) ( not ( = ?auto_162434 ?auto_162439 ) ) ( not ( = ?auto_162435 ?auto_162439 ) ) ( not ( = ?auto_162436 ?auto_162439 ) ) ( not ( = ?auto_162437 ?auto_162439 ) ) ( not ( = ?auto_162438 ?auto_162439 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_162439 )
      ( MAKE-7PILE ?auto_162431 ?auto_162432 ?auto_162433 ?auto_162434 ?auto_162435 ?auto_162436 ?auto_162437 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_162440 - BLOCK
      ?auto_162441 - BLOCK
      ?auto_162442 - BLOCK
      ?auto_162443 - BLOCK
      ?auto_162444 - BLOCK
      ?auto_162445 - BLOCK
      ?auto_162446 - BLOCK
    )
    :vars
    (
      ?auto_162447 - BLOCK
      ?auto_162448 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_162447 ?auto_162446 ) ( ON-TABLE ?auto_162440 ) ( ON ?auto_162441 ?auto_162440 ) ( ON ?auto_162442 ?auto_162441 ) ( ON ?auto_162443 ?auto_162442 ) ( ON ?auto_162444 ?auto_162443 ) ( ON ?auto_162445 ?auto_162444 ) ( ON ?auto_162446 ?auto_162445 ) ( not ( = ?auto_162440 ?auto_162441 ) ) ( not ( = ?auto_162440 ?auto_162442 ) ) ( not ( = ?auto_162440 ?auto_162443 ) ) ( not ( = ?auto_162440 ?auto_162444 ) ) ( not ( = ?auto_162440 ?auto_162445 ) ) ( not ( = ?auto_162440 ?auto_162446 ) ) ( not ( = ?auto_162440 ?auto_162447 ) ) ( not ( = ?auto_162441 ?auto_162442 ) ) ( not ( = ?auto_162441 ?auto_162443 ) ) ( not ( = ?auto_162441 ?auto_162444 ) ) ( not ( = ?auto_162441 ?auto_162445 ) ) ( not ( = ?auto_162441 ?auto_162446 ) ) ( not ( = ?auto_162441 ?auto_162447 ) ) ( not ( = ?auto_162442 ?auto_162443 ) ) ( not ( = ?auto_162442 ?auto_162444 ) ) ( not ( = ?auto_162442 ?auto_162445 ) ) ( not ( = ?auto_162442 ?auto_162446 ) ) ( not ( = ?auto_162442 ?auto_162447 ) ) ( not ( = ?auto_162443 ?auto_162444 ) ) ( not ( = ?auto_162443 ?auto_162445 ) ) ( not ( = ?auto_162443 ?auto_162446 ) ) ( not ( = ?auto_162443 ?auto_162447 ) ) ( not ( = ?auto_162444 ?auto_162445 ) ) ( not ( = ?auto_162444 ?auto_162446 ) ) ( not ( = ?auto_162444 ?auto_162447 ) ) ( not ( = ?auto_162445 ?auto_162446 ) ) ( not ( = ?auto_162445 ?auto_162447 ) ) ( not ( = ?auto_162446 ?auto_162447 ) ) ( not ( = ?auto_162440 ?auto_162448 ) ) ( not ( = ?auto_162441 ?auto_162448 ) ) ( not ( = ?auto_162442 ?auto_162448 ) ) ( not ( = ?auto_162443 ?auto_162448 ) ) ( not ( = ?auto_162444 ?auto_162448 ) ) ( not ( = ?auto_162445 ?auto_162448 ) ) ( not ( = ?auto_162446 ?auto_162448 ) ) ( not ( = ?auto_162447 ?auto_162448 ) ) ( ON ?auto_162448 ?auto_162447 ) ( CLEAR ?auto_162448 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_162440 ?auto_162441 ?auto_162442 ?auto_162443 ?auto_162444 ?auto_162445 ?auto_162446 ?auto_162447 )
      ( MAKE-7PILE ?auto_162440 ?auto_162441 ?auto_162442 ?auto_162443 ?auto_162444 ?auto_162445 ?auto_162446 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_162451 - BLOCK
      ?auto_162452 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_162452 ) ( CLEAR ?auto_162451 ) ( ON-TABLE ?auto_162451 ) ( not ( = ?auto_162451 ?auto_162452 ) ) )
    :subtasks
    ( ( !STACK ?auto_162452 ?auto_162451 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_162453 - BLOCK
      ?auto_162454 - BLOCK
    )
    :vars
    (
      ?auto_162455 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_162453 ) ( ON-TABLE ?auto_162453 ) ( not ( = ?auto_162453 ?auto_162454 ) ) ( ON ?auto_162454 ?auto_162455 ) ( CLEAR ?auto_162454 ) ( HAND-EMPTY ) ( not ( = ?auto_162453 ?auto_162455 ) ) ( not ( = ?auto_162454 ?auto_162455 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_162454 ?auto_162455 )
      ( MAKE-2PILE ?auto_162453 ?auto_162454 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_162456 - BLOCK
      ?auto_162457 - BLOCK
    )
    :vars
    (
      ?auto_162458 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_162456 ?auto_162457 ) ) ( ON ?auto_162457 ?auto_162458 ) ( CLEAR ?auto_162457 ) ( not ( = ?auto_162456 ?auto_162458 ) ) ( not ( = ?auto_162457 ?auto_162458 ) ) ( HOLDING ?auto_162456 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_162456 )
      ( MAKE-2PILE ?auto_162456 ?auto_162457 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_162459 - BLOCK
      ?auto_162460 - BLOCK
    )
    :vars
    (
      ?auto_162461 - BLOCK
      ?auto_162467 - BLOCK
      ?auto_162466 - BLOCK
      ?auto_162464 - BLOCK
      ?auto_162462 - BLOCK
      ?auto_162465 - BLOCK
      ?auto_162463 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_162459 ?auto_162460 ) ) ( ON ?auto_162460 ?auto_162461 ) ( not ( = ?auto_162459 ?auto_162461 ) ) ( not ( = ?auto_162460 ?auto_162461 ) ) ( ON ?auto_162459 ?auto_162460 ) ( CLEAR ?auto_162459 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_162467 ) ( ON ?auto_162466 ?auto_162467 ) ( ON ?auto_162464 ?auto_162466 ) ( ON ?auto_162462 ?auto_162464 ) ( ON ?auto_162465 ?auto_162462 ) ( ON ?auto_162463 ?auto_162465 ) ( ON ?auto_162461 ?auto_162463 ) ( not ( = ?auto_162467 ?auto_162466 ) ) ( not ( = ?auto_162467 ?auto_162464 ) ) ( not ( = ?auto_162467 ?auto_162462 ) ) ( not ( = ?auto_162467 ?auto_162465 ) ) ( not ( = ?auto_162467 ?auto_162463 ) ) ( not ( = ?auto_162467 ?auto_162461 ) ) ( not ( = ?auto_162467 ?auto_162460 ) ) ( not ( = ?auto_162467 ?auto_162459 ) ) ( not ( = ?auto_162466 ?auto_162464 ) ) ( not ( = ?auto_162466 ?auto_162462 ) ) ( not ( = ?auto_162466 ?auto_162465 ) ) ( not ( = ?auto_162466 ?auto_162463 ) ) ( not ( = ?auto_162466 ?auto_162461 ) ) ( not ( = ?auto_162466 ?auto_162460 ) ) ( not ( = ?auto_162466 ?auto_162459 ) ) ( not ( = ?auto_162464 ?auto_162462 ) ) ( not ( = ?auto_162464 ?auto_162465 ) ) ( not ( = ?auto_162464 ?auto_162463 ) ) ( not ( = ?auto_162464 ?auto_162461 ) ) ( not ( = ?auto_162464 ?auto_162460 ) ) ( not ( = ?auto_162464 ?auto_162459 ) ) ( not ( = ?auto_162462 ?auto_162465 ) ) ( not ( = ?auto_162462 ?auto_162463 ) ) ( not ( = ?auto_162462 ?auto_162461 ) ) ( not ( = ?auto_162462 ?auto_162460 ) ) ( not ( = ?auto_162462 ?auto_162459 ) ) ( not ( = ?auto_162465 ?auto_162463 ) ) ( not ( = ?auto_162465 ?auto_162461 ) ) ( not ( = ?auto_162465 ?auto_162460 ) ) ( not ( = ?auto_162465 ?auto_162459 ) ) ( not ( = ?auto_162463 ?auto_162461 ) ) ( not ( = ?auto_162463 ?auto_162460 ) ) ( not ( = ?auto_162463 ?auto_162459 ) ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_162467 ?auto_162466 ?auto_162464 ?auto_162462 ?auto_162465 ?auto_162463 ?auto_162461 ?auto_162460 )
      ( MAKE-2PILE ?auto_162459 ?auto_162460 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_162474 - BLOCK
      ?auto_162475 - BLOCK
      ?auto_162476 - BLOCK
      ?auto_162477 - BLOCK
      ?auto_162478 - BLOCK
      ?auto_162479 - BLOCK
    )
    :vars
    (
      ?auto_162480 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_162480 ?auto_162479 ) ( CLEAR ?auto_162480 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_162474 ) ( ON ?auto_162475 ?auto_162474 ) ( ON ?auto_162476 ?auto_162475 ) ( ON ?auto_162477 ?auto_162476 ) ( ON ?auto_162478 ?auto_162477 ) ( ON ?auto_162479 ?auto_162478 ) ( not ( = ?auto_162474 ?auto_162475 ) ) ( not ( = ?auto_162474 ?auto_162476 ) ) ( not ( = ?auto_162474 ?auto_162477 ) ) ( not ( = ?auto_162474 ?auto_162478 ) ) ( not ( = ?auto_162474 ?auto_162479 ) ) ( not ( = ?auto_162474 ?auto_162480 ) ) ( not ( = ?auto_162475 ?auto_162476 ) ) ( not ( = ?auto_162475 ?auto_162477 ) ) ( not ( = ?auto_162475 ?auto_162478 ) ) ( not ( = ?auto_162475 ?auto_162479 ) ) ( not ( = ?auto_162475 ?auto_162480 ) ) ( not ( = ?auto_162476 ?auto_162477 ) ) ( not ( = ?auto_162476 ?auto_162478 ) ) ( not ( = ?auto_162476 ?auto_162479 ) ) ( not ( = ?auto_162476 ?auto_162480 ) ) ( not ( = ?auto_162477 ?auto_162478 ) ) ( not ( = ?auto_162477 ?auto_162479 ) ) ( not ( = ?auto_162477 ?auto_162480 ) ) ( not ( = ?auto_162478 ?auto_162479 ) ) ( not ( = ?auto_162478 ?auto_162480 ) ) ( not ( = ?auto_162479 ?auto_162480 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_162480 ?auto_162479 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_162481 - BLOCK
      ?auto_162482 - BLOCK
      ?auto_162483 - BLOCK
      ?auto_162484 - BLOCK
      ?auto_162485 - BLOCK
      ?auto_162486 - BLOCK
    )
    :vars
    (
      ?auto_162487 - BLOCK
      ?auto_162488 - BLOCK
      ?auto_162489 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_162487 ?auto_162486 ) ( CLEAR ?auto_162487 ) ( ON-TABLE ?auto_162481 ) ( ON ?auto_162482 ?auto_162481 ) ( ON ?auto_162483 ?auto_162482 ) ( ON ?auto_162484 ?auto_162483 ) ( ON ?auto_162485 ?auto_162484 ) ( ON ?auto_162486 ?auto_162485 ) ( not ( = ?auto_162481 ?auto_162482 ) ) ( not ( = ?auto_162481 ?auto_162483 ) ) ( not ( = ?auto_162481 ?auto_162484 ) ) ( not ( = ?auto_162481 ?auto_162485 ) ) ( not ( = ?auto_162481 ?auto_162486 ) ) ( not ( = ?auto_162481 ?auto_162487 ) ) ( not ( = ?auto_162482 ?auto_162483 ) ) ( not ( = ?auto_162482 ?auto_162484 ) ) ( not ( = ?auto_162482 ?auto_162485 ) ) ( not ( = ?auto_162482 ?auto_162486 ) ) ( not ( = ?auto_162482 ?auto_162487 ) ) ( not ( = ?auto_162483 ?auto_162484 ) ) ( not ( = ?auto_162483 ?auto_162485 ) ) ( not ( = ?auto_162483 ?auto_162486 ) ) ( not ( = ?auto_162483 ?auto_162487 ) ) ( not ( = ?auto_162484 ?auto_162485 ) ) ( not ( = ?auto_162484 ?auto_162486 ) ) ( not ( = ?auto_162484 ?auto_162487 ) ) ( not ( = ?auto_162485 ?auto_162486 ) ) ( not ( = ?auto_162485 ?auto_162487 ) ) ( not ( = ?auto_162486 ?auto_162487 ) ) ( HOLDING ?auto_162488 ) ( CLEAR ?auto_162489 ) ( not ( = ?auto_162481 ?auto_162488 ) ) ( not ( = ?auto_162481 ?auto_162489 ) ) ( not ( = ?auto_162482 ?auto_162488 ) ) ( not ( = ?auto_162482 ?auto_162489 ) ) ( not ( = ?auto_162483 ?auto_162488 ) ) ( not ( = ?auto_162483 ?auto_162489 ) ) ( not ( = ?auto_162484 ?auto_162488 ) ) ( not ( = ?auto_162484 ?auto_162489 ) ) ( not ( = ?auto_162485 ?auto_162488 ) ) ( not ( = ?auto_162485 ?auto_162489 ) ) ( not ( = ?auto_162486 ?auto_162488 ) ) ( not ( = ?auto_162486 ?auto_162489 ) ) ( not ( = ?auto_162487 ?auto_162488 ) ) ( not ( = ?auto_162487 ?auto_162489 ) ) ( not ( = ?auto_162488 ?auto_162489 ) ) )
    :subtasks
    ( ( !STACK ?auto_162488 ?auto_162489 )
      ( MAKE-6PILE ?auto_162481 ?auto_162482 ?auto_162483 ?auto_162484 ?auto_162485 ?auto_162486 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_162490 - BLOCK
      ?auto_162491 - BLOCK
      ?auto_162492 - BLOCK
      ?auto_162493 - BLOCK
      ?auto_162494 - BLOCK
      ?auto_162495 - BLOCK
    )
    :vars
    (
      ?auto_162498 - BLOCK
      ?auto_162496 - BLOCK
      ?auto_162497 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_162498 ?auto_162495 ) ( ON-TABLE ?auto_162490 ) ( ON ?auto_162491 ?auto_162490 ) ( ON ?auto_162492 ?auto_162491 ) ( ON ?auto_162493 ?auto_162492 ) ( ON ?auto_162494 ?auto_162493 ) ( ON ?auto_162495 ?auto_162494 ) ( not ( = ?auto_162490 ?auto_162491 ) ) ( not ( = ?auto_162490 ?auto_162492 ) ) ( not ( = ?auto_162490 ?auto_162493 ) ) ( not ( = ?auto_162490 ?auto_162494 ) ) ( not ( = ?auto_162490 ?auto_162495 ) ) ( not ( = ?auto_162490 ?auto_162498 ) ) ( not ( = ?auto_162491 ?auto_162492 ) ) ( not ( = ?auto_162491 ?auto_162493 ) ) ( not ( = ?auto_162491 ?auto_162494 ) ) ( not ( = ?auto_162491 ?auto_162495 ) ) ( not ( = ?auto_162491 ?auto_162498 ) ) ( not ( = ?auto_162492 ?auto_162493 ) ) ( not ( = ?auto_162492 ?auto_162494 ) ) ( not ( = ?auto_162492 ?auto_162495 ) ) ( not ( = ?auto_162492 ?auto_162498 ) ) ( not ( = ?auto_162493 ?auto_162494 ) ) ( not ( = ?auto_162493 ?auto_162495 ) ) ( not ( = ?auto_162493 ?auto_162498 ) ) ( not ( = ?auto_162494 ?auto_162495 ) ) ( not ( = ?auto_162494 ?auto_162498 ) ) ( not ( = ?auto_162495 ?auto_162498 ) ) ( CLEAR ?auto_162496 ) ( not ( = ?auto_162490 ?auto_162497 ) ) ( not ( = ?auto_162490 ?auto_162496 ) ) ( not ( = ?auto_162491 ?auto_162497 ) ) ( not ( = ?auto_162491 ?auto_162496 ) ) ( not ( = ?auto_162492 ?auto_162497 ) ) ( not ( = ?auto_162492 ?auto_162496 ) ) ( not ( = ?auto_162493 ?auto_162497 ) ) ( not ( = ?auto_162493 ?auto_162496 ) ) ( not ( = ?auto_162494 ?auto_162497 ) ) ( not ( = ?auto_162494 ?auto_162496 ) ) ( not ( = ?auto_162495 ?auto_162497 ) ) ( not ( = ?auto_162495 ?auto_162496 ) ) ( not ( = ?auto_162498 ?auto_162497 ) ) ( not ( = ?auto_162498 ?auto_162496 ) ) ( not ( = ?auto_162497 ?auto_162496 ) ) ( ON ?auto_162497 ?auto_162498 ) ( CLEAR ?auto_162497 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_162490 ?auto_162491 ?auto_162492 ?auto_162493 ?auto_162494 ?auto_162495 ?auto_162498 )
      ( MAKE-6PILE ?auto_162490 ?auto_162491 ?auto_162492 ?auto_162493 ?auto_162494 ?auto_162495 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_162499 - BLOCK
      ?auto_162500 - BLOCK
      ?auto_162501 - BLOCK
      ?auto_162502 - BLOCK
      ?auto_162503 - BLOCK
      ?auto_162504 - BLOCK
    )
    :vars
    (
      ?auto_162505 - BLOCK
      ?auto_162506 - BLOCK
      ?auto_162507 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_162505 ?auto_162504 ) ( ON-TABLE ?auto_162499 ) ( ON ?auto_162500 ?auto_162499 ) ( ON ?auto_162501 ?auto_162500 ) ( ON ?auto_162502 ?auto_162501 ) ( ON ?auto_162503 ?auto_162502 ) ( ON ?auto_162504 ?auto_162503 ) ( not ( = ?auto_162499 ?auto_162500 ) ) ( not ( = ?auto_162499 ?auto_162501 ) ) ( not ( = ?auto_162499 ?auto_162502 ) ) ( not ( = ?auto_162499 ?auto_162503 ) ) ( not ( = ?auto_162499 ?auto_162504 ) ) ( not ( = ?auto_162499 ?auto_162505 ) ) ( not ( = ?auto_162500 ?auto_162501 ) ) ( not ( = ?auto_162500 ?auto_162502 ) ) ( not ( = ?auto_162500 ?auto_162503 ) ) ( not ( = ?auto_162500 ?auto_162504 ) ) ( not ( = ?auto_162500 ?auto_162505 ) ) ( not ( = ?auto_162501 ?auto_162502 ) ) ( not ( = ?auto_162501 ?auto_162503 ) ) ( not ( = ?auto_162501 ?auto_162504 ) ) ( not ( = ?auto_162501 ?auto_162505 ) ) ( not ( = ?auto_162502 ?auto_162503 ) ) ( not ( = ?auto_162502 ?auto_162504 ) ) ( not ( = ?auto_162502 ?auto_162505 ) ) ( not ( = ?auto_162503 ?auto_162504 ) ) ( not ( = ?auto_162503 ?auto_162505 ) ) ( not ( = ?auto_162504 ?auto_162505 ) ) ( not ( = ?auto_162499 ?auto_162506 ) ) ( not ( = ?auto_162499 ?auto_162507 ) ) ( not ( = ?auto_162500 ?auto_162506 ) ) ( not ( = ?auto_162500 ?auto_162507 ) ) ( not ( = ?auto_162501 ?auto_162506 ) ) ( not ( = ?auto_162501 ?auto_162507 ) ) ( not ( = ?auto_162502 ?auto_162506 ) ) ( not ( = ?auto_162502 ?auto_162507 ) ) ( not ( = ?auto_162503 ?auto_162506 ) ) ( not ( = ?auto_162503 ?auto_162507 ) ) ( not ( = ?auto_162504 ?auto_162506 ) ) ( not ( = ?auto_162504 ?auto_162507 ) ) ( not ( = ?auto_162505 ?auto_162506 ) ) ( not ( = ?auto_162505 ?auto_162507 ) ) ( not ( = ?auto_162506 ?auto_162507 ) ) ( ON ?auto_162506 ?auto_162505 ) ( CLEAR ?auto_162506 ) ( HOLDING ?auto_162507 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_162507 )
      ( MAKE-6PILE ?auto_162499 ?auto_162500 ?auto_162501 ?auto_162502 ?auto_162503 ?auto_162504 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_162508 - BLOCK
      ?auto_162509 - BLOCK
      ?auto_162510 - BLOCK
      ?auto_162511 - BLOCK
      ?auto_162512 - BLOCK
      ?auto_162513 - BLOCK
    )
    :vars
    (
      ?auto_162514 - BLOCK
      ?auto_162515 - BLOCK
      ?auto_162516 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_162514 ?auto_162513 ) ( ON-TABLE ?auto_162508 ) ( ON ?auto_162509 ?auto_162508 ) ( ON ?auto_162510 ?auto_162509 ) ( ON ?auto_162511 ?auto_162510 ) ( ON ?auto_162512 ?auto_162511 ) ( ON ?auto_162513 ?auto_162512 ) ( not ( = ?auto_162508 ?auto_162509 ) ) ( not ( = ?auto_162508 ?auto_162510 ) ) ( not ( = ?auto_162508 ?auto_162511 ) ) ( not ( = ?auto_162508 ?auto_162512 ) ) ( not ( = ?auto_162508 ?auto_162513 ) ) ( not ( = ?auto_162508 ?auto_162514 ) ) ( not ( = ?auto_162509 ?auto_162510 ) ) ( not ( = ?auto_162509 ?auto_162511 ) ) ( not ( = ?auto_162509 ?auto_162512 ) ) ( not ( = ?auto_162509 ?auto_162513 ) ) ( not ( = ?auto_162509 ?auto_162514 ) ) ( not ( = ?auto_162510 ?auto_162511 ) ) ( not ( = ?auto_162510 ?auto_162512 ) ) ( not ( = ?auto_162510 ?auto_162513 ) ) ( not ( = ?auto_162510 ?auto_162514 ) ) ( not ( = ?auto_162511 ?auto_162512 ) ) ( not ( = ?auto_162511 ?auto_162513 ) ) ( not ( = ?auto_162511 ?auto_162514 ) ) ( not ( = ?auto_162512 ?auto_162513 ) ) ( not ( = ?auto_162512 ?auto_162514 ) ) ( not ( = ?auto_162513 ?auto_162514 ) ) ( not ( = ?auto_162508 ?auto_162515 ) ) ( not ( = ?auto_162508 ?auto_162516 ) ) ( not ( = ?auto_162509 ?auto_162515 ) ) ( not ( = ?auto_162509 ?auto_162516 ) ) ( not ( = ?auto_162510 ?auto_162515 ) ) ( not ( = ?auto_162510 ?auto_162516 ) ) ( not ( = ?auto_162511 ?auto_162515 ) ) ( not ( = ?auto_162511 ?auto_162516 ) ) ( not ( = ?auto_162512 ?auto_162515 ) ) ( not ( = ?auto_162512 ?auto_162516 ) ) ( not ( = ?auto_162513 ?auto_162515 ) ) ( not ( = ?auto_162513 ?auto_162516 ) ) ( not ( = ?auto_162514 ?auto_162515 ) ) ( not ( = ?auto_162514 ?auto_162516 ) ) ( not ( = ?auto_162515 ?auto_162516 ) ) ( ON ?auto_162515 ?auto_162514 ) ( ON ?auto_162516 ?auto_162515 ) ( CLEAR ?auto_162516 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_162508 ?auto_162509 ?auto_162510 ?auto_162511 ?auto_162512 ?auto_162513 ?auto_162514 ?auto_162515 )
      ( MAKE-6PILE ?auto_162508 ?auto_162509 ?auto_162510 ?auto_162511 ?auto_162512 ?auto_162513 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_162520 - BLOCK
      ?auto_162521 - BLOCK
      ?auto_162522 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_162522 ) ( CLEAR ?auto_162521 ) ( ON-TABLE ?auto_162520 ) ( ON ?auto_162521 ?auto_162520 ) ( not ( = ?auto_162520 ?auto_162521 ) ) ( not ( = ?auto_162520 ?auto_162522 ) ) ( not ( = ?auto_162521 ?auto_162522 ) ) )
    :subtasks
    ( ( !STACK ?auto_162522 ?auto_162521 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_162523 - BLOCK
      ?auto_162524 - BLOCK
      ?auto_162525 - BLOCK
    )
    :vars
    (
      ?auto_162526 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_162524 ) ( ON-TABLE ?auto_162523 ) ( ON ?auto_162524 ?auto_162523 ) ( not ( = ?auto_162523 ?auto_162524 ) ) ( not ( = ?auto_162523 ?auto_162525 ) ) ( not ( = ?auto_162524 ?auto_162525 ) ) ( ON ?auto_162525 ?auto_162526 ) ( CLEAR ?auto_162525 ) ( HAND-EMPTY ) ( not ( = ?auto_162523 ?auto_162526 ) ) ( not ( = ?auto_162524 ?auto_162526 ) ) ( not ( = ?auto_162525 ?auto_162526 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_162525 ?auto_162526 )
      ( MAKE-3PILE ?auto_162523 ?auto_162524 ?auto_162525 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_162527 - BLOCK
      ?auto_162528 - BLOCK
      ?auto_162529 - BLOCK
    )
    :vars
    (
      ?auto_162530 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_162527 ) ( not ( = ?auto_162527 ?auto_162528 ) ) ( not ( = ?auto_162527 ?auto_162529 ) ) ( not ( = ?auto_162528 ?auto_162529 ) ) ( ON ?auto_162529 ?auto_162530 ) ( CLEAR ?auto_162529 ) ( not ( = ?auto_162527 ?auto_162530 ) ) ( not ( = ?auto_162528 ?auto_162530 ) ) ( not ( = ?auto_162529 ?auto_162530 ) ) ( HOLDING ?auto_162528 ) ( CLEAR ?auto_162527 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_162527 ?auto_162528 )
      ( MAKE-3PILE ?auto_162527 ?auto_162528 ?auto_162529 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_162531 - BLOCK
      ?auto_162532 - BLOCK
      ?auto_162533 - BLOCK
    )
    :vars
    (
      ?auto_162534 - BLOCK
      ?auto_162536 - BLOCK
      ?auto_162537 - BLOCK
      ?auto_162538 - BLOCK
      ?auto_162539 - BLOCK
      ?auto_162535 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_162531 ) ( not ( = ?auto_162531 ?auto_162532 ) ) ( not ( = ?auto_162531 ?auto_162533 ) ) ( not ( = ?auto_162532 ?auto_162533 ) ) ( ON ?auto_162533 ?auto_162534 ) ( not ( = ?auto_162531 ?auto_162534 ) ) ( not ( = ?auto_162532 ?auto_162534 ) ) ( not ( = ?auto_162533 ?auto_162534 ) ) ( CLEAR ?auto_162531 ) ( ON ?auto_162532 ?auto_162533 ) ( CLEAR ?auto_162532 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_162536 ) ( ON ?auto_162537 ?auto_162536 ) ( ON ?auto_162538 ?auto_162537 ) ( ON ?auto_162539 ?auto_162538 ) ( ON ?auto_162535 ?auto_162539 ) ( ON ?auto_162534 ?auto_162535 ) ( not ( = ?auto_162536 ?auto_162537 ) ) ( not ( = ?auto_162536 ?auto_162538 ) ) ( not ( = ?auto_162536 ?auto_162539 ) ) ( not ( = ?auto_162536 ?auto_162535 ) ) ( not ( = ?auto_162536 ?auto_162534 ) ) ( not ( = ?auto_162536 ?auto_162533 ) ) ( not ( = ?auto_162536 ?auto_162532 ) ) ( not ( = ?auto_162537 ?auto_162538 ) ) ( not ( = ?auto_162537 ?auto_162539 ) ) ( not ( = ?auto_162537 ?auto_162535 ) ) ( not ( = ?auto_162537 ?auto_162534 ) ) ( not ( = ?auto_162537 ?auto_162533 ) ) ( not ( = ?auto_162537 ?auto_162532 ) ) ( not ( = ?auto_162538 ?auto_162539 ) ) ( not ( = ?auto_162538 ?auto_162535 ) ) ( not ( = ?auto_162538 ?auto_162534 ) ) ( not ( = ?auto_162538 ?auto_162533 ) ) ( not ( = ?auto_162538 ?auto_162532 ) ) ( not ( = ?auto_162539 ?auto_162535 ) ) ( not ( = ?auto_162539 ?auto_162534 ) ) ( not ( = ?auto_162539 ?auto_162533 ) ) ( not ( = ?auto_162539 ?auto_162532 ) ) ( not ( = ?auto_162535 ?auto_162534 ) ) ( not ( = ?auto_162535 ?auto_162533 ) ) ( not ( = ?auto_162535 ?auto_162532 ) ) ( not ( = ?auto_162531 ?auto_162536 ) ) ( not ( = ?auto_162531 ?auto_162537 ) ) ( not ( = ?auto_162531 ?auto_162538 ) ) ( not ( = ?auto_162531 ?auto_162539 ) ) ( not ( = ?auto_162531 ?auto_162535 ) ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_162536 ?auto_162537 ?auto_162538 ?auto_162539 ?auto_162535 ?auto_162534 ?auto_162533 )
      ( MAKE-3PILE ?auto_162531 ?auto_162532 ?auto_162533 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_162540 - BLOCK
      ?auto_162541 - BLOCK
      ?auto_162542 - BLOCK
    )
    :vars
    (
      ?auto_162545 - BLOCK
      ?auto_162544 - BLOCK
      ?auto_162543 - BLOCK
      ?auto_162547 - BLOCK
      ?auto_162548 - BLOCK
      ?auto_162546 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_162540 ?auto_162541 ) ) ( not ( = ?auto_162540 ?auto_162542 ) ) ( not ( = ?auto_162541 ?auto_162542 ) ) ( ON ?auto_162542 ?auto_162545 ) ( not ( = ?auto_162540 ?auto_162545 ) ) ( not ( = ?auto_162541 ?auto_162545 ) ) ( not ( = ?auto_162542 ?auto_162545 ) ) ( ON ?auto_162541 ?auto_162542 ) ( CLEAR ?auto_162541 ) ( ON-TABLE ?auto_162544 ) ( ON ?auto_162543 ?auto_162544 ) ( ON ?auto_162547 ?auto_162543 ) ( ON ?auto_162548 ?auto_162547 ) ( ON ?auto_162546 ?auto_162548 ) ( ON ?auto_162545 ?auto_162546 ) ( not ( = ?auto_162544 ?auto_162543 ) ) ( not ( = ?auto_162544 ?auto_162547 ) ) ( not ( = ?auto_162544 ?auto_162548 ) ) ( not ( = ?auto_162544 ?auto_162546 ) ) ( not ( = ?auto_162544 ?auto_162545 ) ) ( not ( = ?auto_162544 ?auto_162542 ) ) ( not ( = ?auto_162544 ?auto_162541 ) ) ( not ( = ?auto_162543 ?auto_162547 ) ) ( not ( = ?auto_162543 ?auto_162548 ) ) ( not ( = ?auto_162543 ?auto_162546 ) ) ( not ( = ?auto_162543 ?auto_162545 ) ) ( not ( = ?auto_162543 ?auto_162542 ) ) ( not ( = ?auto_162543 ?auto_162541 ) ) ( not ( = ?auto_162547 ?auto_162548 ) ) ( not ( = ?auto_162547 ?auto_162546 ) ) ( not ( = ?auto_162547 ?auto_162545 ) ) ( not ( = ?auto_162547 ?auto_162542 ) ) ( not ( = ?auto_162547 ?auto_162541 ) ) ( not ( = ?auto_162548 ?auto_162546 ) ) ( not ( = ?auto_162548 ?auto_162545 ) ) ( not ( = ?auto_162548 ?auto_162542 ) ) ( not ( = ?auto_162548 ?auto_162541 ) ) ( not ( = ?auto_162546 ?auto_162545 ) ) ( not ( = ?auto_162546 ?auto_162542 ) ) ( not ( = ?auto_162546 ?auto_162541 ) ) ( not ( = ?auto_162540 ?auto_162544 ) ) ( not ( = ?auto_162540 ?auto_162543 ) ) ( not ( = ?auto_162540 ?auto_162547 ) ) ( not ( = ?auto_162540 ?auto_162548 ) ) ( not ( = ?auto_162540 ?auto_162546 ) ) ( HOLDING ?auto_162540 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_162540 )
      ( MAKE-3PILE ?auto_162540 ?auto_162541 ?auto_162542 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_162549 - BLOCK
      ?auto_162550 - BLOCK
      ?auto_162551 - BLOCK
    )
    :vars
    (
      ?auto_162552 - BLOCK
      ?auto_162553 - BLOCK
      ?auto_162555 - BLOCK
      ?auto_162554 - BLOCK
      ?auto_162556 - BLOCK
      ?auto_162557 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_162549 ?auto_162550 ) ) ( not ( = ?auto_162549 ?auto_162551 ) ) ( not ( = ?auto_162550 ?auto_162551 ) ) ( ON ?auto_162551 ?auto_162552 ) ( not ( = ?auto_162549 ?auto_162552 ) ) ( not ( = ?auto_162550 ?auto_162552 ) ) ( not ( = ?auto_162551 ?auto_162552 ) ) ( ON ?auto_162550 ?auto_162551 ) ( ON-TABLE ?auto_162553 ) ( ON ?auto_162555 ?auto_162553 ) ( ON ?auto_162554 ?auto_162555 ) ( ON ?auto_162556 ?auto_162554 ) ( ON ?auto_162557 ?auto_162556 ) ( ON ?auto_162552 ?auto_162557 ) ( not ( = ?auto_162553 ?auto_162555 ) ) ( not ( = ?auto_162553 ?auto_162554 ) ) ( not ( = ?auto_162553 ?auto_162556 ) ) ( not ( = ?auto_162553 ?auto_162557 ) ) ( not ( = ?auto_162553 ?auto_162552 ) ) ( not ( = ?auto_162553 ?auto_162551 ) ) ( not ( = ?auto_162553 ?auto_162550 ) ) ( not ( = ?auto_162555 ?auto_162554 ) ) ( not ( = ?auto_162555 ?auto_162556 ) ) ( not ( = ?auto_162555 ?auto_162557 ) ) ( not ( = ?auto_162555 ?auto_162552 ) ) ( not ( = ?auto_162555 ?auto_162551 ) ) ( not ( = ?auto_162555 ?auto_162550 ) ) ( not ( = ?auto_162554 ?auto_162556 ) ) ( not ( = ?auto_162554 ?auto_162557 ) ) ( not ( = ?auto_162554 ?auto_162552 ) ) ( not ( = ?auto_162554 ?auto_162551 ) ) ( not ( = ?auto_162554 ?auto_162550 ) ) ( not ( = ?auto_162556 ?auto_162557 ) ) ( not ( = ?auto_162556 ?auto_162552 ) ) ( not ( = ?auto_162556 ?auto_162551 ) ) ( not ( = ?auto_162556 ?auto_162550 ) ) ( not ( = ?auto_162557 ?auto_162552 ) ) ( not ( = ?auto_162557 ?auto_162551 ) ) ( not ( = ?auto_162557 ?auto_162550 ) ) ( not ( = ?auto_162549 ?auto_162553 ) ) ( not ( = ?auto_162549 ?auto_162555 ) ) ( not ( = ?auto_162549 ?auto_162554 ) ) ( not ( = ?auto_162549 ?auto_162556 ) ) ( not ( = ?auto_162549 ?auto_162557 ) ) ( ON ?auto_162549 ?auto_162550 ) ( CLEAR ?auto_162549 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_162553 ?auto_162555 ?auto_162554 ?auto_162556 ?auto_162557 ?auto_162552 ?auto_162551 ?auto_162550 )
      ( MAKE-3PILE ?auto_162549 ?auto_162550 ?auto_162551 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_162563 - BLOCK
      ?auto_162564 - BLOCK
      ?auto_162565 - BLOCK
      ?auto_162566 - BLOCK
      ?auto_162567 - BLOCK
    )
    :vars
    (
      ?auto_162568 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_162568 ?auto_162567 ) ( CLEAR ?auto_162568 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_162563 ) ( ON ?auto_162564 ?auto_162563 ) ( ON ?auto_162565 ?auto_162564 ) ( ON ?auto_162566 ?auto_162565 ) ( ON ?auto_162567 ?auto_162566 ) ( not ( = ?auto_162563 ?auto_162564 ) ) ( not ( = ?auto_162563 ?auto_162565 ) ) ( not ( = ?auto_162563 ?auto_162566 ) ) ( not ( = ?auto_162563 ?auto_162567 ) ) ( not ( = ?auto_162563 ?auto_162568 ) ) ( not ( = ?auto_162564 ?auto_162565 ) ) ( not ( = ?auto_162564 ?auto_162566 ) ) ( not ( = ?auto_162564 ?auto_162567 ) ) ( not ( = ?auto_162564 ?auto_162568 ) ) ( not ( = ?auto_162565 ?auto_162566 ) ) ( not ( = ?auto_162565 ?auto_162567 ) ) ( not ( = ?auto_162565 ?auto_162568 ) ) ( not ( = ?auto_162566 ?auto_162567 ) ) ( not ( = ?auto_162566 ?auto_162568 ) ) ( not ( = ?auto_162567 ?auto_162568 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_162568 ?auto_162567 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_162569 - BLOCK
      ?auto_162570 - BLOCK
      ?auto_162571 - BLOCK
      ?auto_162572 - BLOCK
      ?auto_162573 - BLOCK
    )
    :vars
    (
      ?auto_162574 - BLOCK
      ?auto_162575 - BLOCK
      ?auto_162576 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_162574 ?auto_162573 ) ( CLEAR ?auto_162574 ) ( ON-TABLE ?auto_162569 ) ( ON ?auto_162570 ?auto_162569 ) ( ON ?auto_162571 ?auto_162570 ) ( ON ?auto_162572 ?auto_162571 ) ( ON ?auto_162573 ?auto_162572 ) ( not ( = ?auto_162569 ?auto_162570 ) ) ( not ( = ?auto_162569 ?auto_162571 ) ) ( not ( = ?auto_162569 ?auto_162572 ) ) ( not ( = ?auto_162569 ?auto_162573 ) ) ( not ( = ?auto_162569 ?auto_162574 ) ) ( not ( = ?auto_162570 ?auto_162571 ) ) ( not ( = ?auto_162570 ?auto_162572 ) ) ( not ( = ?auto_162570 ?auto_162573 ) ) ( not ( = ?auto_162570 ?auto_162574 ) ) ( not ( = ?auto_162571 ?auto_162572 ) ) ( not ( = ?auto_162571 ?auto_162573 ) ) ( not ( = ?auto_162571 ?auto_162574 ) ) ( not ( = ?auto_162572 ?auto_162573 ) ) ( not ( = ?auto_162572 ?auto_162574 ) ) ( not ( = ?auto_162573 ?auto_162574 ) ) ( HOLDING ?auto_162575 ) ( CLEAR ?auto_162576 ) ( not ( = ?auto_162569 ?auto_162575 ) ) ( not ( = ?auto_162569 ?auto_162576 ) ) ( not ( = ?auto_162570 ?auto_162575 ) ) ( not ( = ?auto_162570 ?auto_162576 ) ) ( not ( = ?auto_162571 ?auto_162575 ) ) ( not ( = ?auto_162571 ?auto_162576 ) ) ( not ( = ?auto_162572 ?auto_162575 ) ) ( not ( = ?auto_162572 ?auto_162576 ) ) ( not ( = ?auto_162573 ?auto_162575 ) ) ( not ( = ?auto_162573 ?auto_162576 ) ) ( not ( = ?auto_162574 ?auto_162575 ) ) ( not ( = ?auto_162574 ?auto_162576 ) ) ( not ( = ?auto_162575 ?auto_162576 ) ) )
    :subtasks
    ( ( !STACK ?auto_162575 ?auto_162576 )
      ( MAKE-5PILE ?auto_162569 ?auto_162570 ?auto_162571 ?auto_162572 ?auto_162573 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_162577 - BLOCK
      ?auto_162578 - BLOCK
      ?auto_162579 - BLOCK
      ?auto_162580 - BLOCK
      ?auto_162581 - BLOCK
    )
    :vars
    (
      ?auto_162583 - BLOCK
      ?auto_162584 - BLOCK
      ?auto_162582 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_162583 ?auto_162581 ) ( ON-TABLE ?auto_162577 ) ( ON ?auto_162578 ?auto_162577 ) ( ON ?auto_162579 ?auto_162578 ) ( ON ?auto_162580 ?auto_162579 ) ( ON ?auto_162581 ?auto_162580 ) ( not ( = ?auto_162577 ?auto_162578 ) ) ( not ( = ?auto_162577 ?auto_162579 ) ) ( not ( = ?auto_162577 ?auto_162580 ) ) ( not ( = ?auto_162577 ?auto_162581 ) ) ( not ( = ?auto_162577 ?auto_162583 ) ) ( not ( = ?auto_162578 ?auto_162579 ) ) ( not ( = ?auto_162578 ?auto_162580 ) ) ( not ( = ?auto_162578 ?auto_162581 ) ) ( not ( = ?auto_162578 ?auto_162583 ) ) ( not ( = ?auto_162579 ?auto_162580 ) ) ( not ( = ?auto_162579 ?auto_162581 ) ) ( not ( = ?auto_162579 ?auto_162583 ) ) ( not ( = ?auto_162580 ?auto_162581 ) ) ( not ( = ?auto_162580 ?auto_162583 ) ) ( not ( = ?auto_162581 ?auto_162583 ) ) ( CLEAR ?auto_162584 ) ( not ( = ?auto_162577 ?auto_162582 ) ) ( not ( = ?auto_162577 ?auto_162584 ) ) ( not ( = ?auto_162578 ?auto_162582 ) ) ( not ( = ?auto_162578 ?auto_162584 ) ) ( not ( = ?auto_162579 ?auto_162582 ) ) ( not ( = ?auto_162579 ?auto_162584 ) ) ( not ( = ?auto_162580 ?auto_162582 ) ) ( not ( = ?auto_162580 ?auto_162584 ) ) ( not ( = ?auto_162581 ?auto_162582 ) ) ( not ( = ?auto_162581 ?auto_162584 ) ) ( not ( = ?auto_162583 ?auto_162582 ) ) ( not ( = ?auto_162583 ?auto_162584 ) ) ( not ( = ?auto_162582 ?auto_162584 ) ) ( ON ?auto_162582 ?auto_162583 ) ( CLEAR ?auto_162582 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_162577 ?auto_162578 ?auto_162579 ?auto_162580 ?auto_162581 ?auto_162583 )
      ( MAKE-5PILE ?auto_162577 ?auto_162578 ?auto_162579 ?auto_162580 ?auto_162581 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_162585 - BLOCK
      ?auto_162586 - BLOCK
      ?auto_162587 - BLOCK
      ?auto_162588 - BLOCK
      ?auto_162589 - BLOCK
    )
    :vars
    (
      ?auto_162590 - BLOCK
      ?auto_162592 - BLOCK
      ?auto_162591 - BLOCK
      ?auto_162593 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_162590 ?auto_162589 ) ( ON-TABLE ?auto_162585 ) ( ON ?auto_162586 ?auto_162585 ) ( ON ?auto_162587 ?auto_162586 ) ( ON ?auto_162588 ?auto_162587 ) ( ON ?auto_162589 ?auto_162588 ) ( not ( = ?auto_162585 ?auto_162586 ) ) ( not ( = ?auto_162585 ?auto_162587 ) ) ( not ( = ?auto_162585 ?auto_162588 ) ) ( not ( = ?auto_162585 ?auto_162589 ) ) ( not ( = ?auto_162585 ?auto_162590 ) ) ( not ( = ?auto_162586 ?auto_162587 ) ) ( not ( = ?auto_162586 ?auto_162588 ) ) ( not ( = ?auto_162586 ?auto_162589 ) ) ( not ( = ?auto_162586 ?auto_162590 ) ) ( not ( = ?auto_162587 ?auto_162588 ) ) ( not ( = ?auto_162587 ?auto_162589 ) ) ( not ( = ?auto_162587 ?auto_162590 ) ) ( not ( = ?auto_162588 ?auto_162589 ) ) ( not ( = ?auto_162588 ?auto_162590 ) ) ( not ( = ?auto_162589 ?auto_162590 ) ) ( not ( = ?auto_162585 ?auto_162592 ) ) ( not ( = ?auto_162585 ?auto_162591 ) ) ( not ( = ?auto_162586 ?auto_162592 ) ) ( not ( = ?auto_162586 ?auto_162591 ) ) ( not ( = ?auto_162587 ?auto_162592 ) ) ( not ( = ?auto_162587 ?auto_162591 ) ) ( not ( = ?auto_162588 ?auto_162592 ) ) ( not ( = ?auto_162588 ?auto_162591 ) ) ( not ( = ?auto_162589 ?auto_162592 ) ) ( not ( = ?auto_162589 ?auto_162591 ) ) ( not ( = ?auto_162590 ?auto_162592 ) ) ( not ( = ?auto_162590 ?auto_162591 ) ) ( not ( = ?auto_162592 ?auto_162591 ) ) ( ON ?auto_162592 ?auto_162590 ) ( CLEAR ?auto_162592 ) ( HOLDING ?auto_162591 ) ( CLEAR ?auto_162593 ) ( ON-TABLE ?auto_162593 ) ( not ( = ?auto_162593 ?auto_162591 ) ) ( not ( = ?auto_162585 ?auto_162593 ) ) ( not ( = ?auto_162586 ?auto_162593 ) ) ( not ( = ?auto_162587 ?auto_162593 ) ) ( not ( = ?auto_162588 ?auto_162593 ) ) ( not ( = ?auto_162589 ?auto_162593 ) ) ( not ( = ?auto_162590 ?auto_162593 ) ) ( not ( = ?auto_162592 ?auto_162593 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_162593 ?auto_162591 )
      ( MAKE-5PILE ?auto_162585 ?auto_162586 ?auto_162587 ?auto_162588 ?auto_162589 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_162594 - BLOCK
      ?auto_162595 - BLOCK
      ?auto_162596 - BLOCK
      ?auto_162597 - BLOCK
      ?auto_162598 - BLOCK
    )
    :vars
    (
      ?auto_162599 - BLOCK
      ?auto_162602 - BLOCK
      ?auto_162601 - BLOCK
      ?auto_162600 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_162599 ?auto_162598 ) ( ON-TABLE ?auto_162594 ) ( ON ?auto_162595 ?auto_162594 ) ( ON ?auto_162596 ?auto_162595 ) ( ON ?auto_162597 ?auto_162596 ) ( ON ?auto_162598 ?auto_162597 ) ( not ( = ?auto_162594 ?auto_162595 ) ) ( not ( = ?auto_162594 ?auto_162596 ) ) ( not ( = ?auto_162594 ?auto_162597 ) ) ( not ( = ?auto_162594 ?auto_162598 ) ) ( not ( = ?auto_162594 ?auto_162599 ) ) ( not ( = ?auto_162595 ?auto_162596 ) ) ( not ( = ?auto_162595 ?auto_162597 ) ) ( not ( = ?auto_162595 ?auto_162598 ) ) ( not ( = ?auto_162595 ?auto_162599 ) ) ( not ( = ?auto_162596 ?auto_162597 ) ) ( not ( = ?auto_162596 ?auto_162598 ) ) ( not ( = ?auto_162596 ?auto_162599 ) ) ( not ( = ?auto_162597 ?auto_162598 ) ) ( not ( = ?auto_162597 ?auto_162599 ) ) ( not ( = ?auto_162598 ?auto_162599 ) ) ( not ( = ?auto_162594 ?auto_162602 ) ) ( not ( = ?auto_162594 ?auto_162601 ) ) ( not ( = ?auto_162595 ?auto_162602 ) ) ( not ( = ?auto_162595 ?auto_162601 ) ) ( not ( = ?auto_162596 ?auto_162602 ) ) ( not ( = ?auto_162596 ?auto_162601 ) ) ( not ( = ?auto_162597 ?auto_162602 ) ) ( not ( = ?auto_162597 ?auto_162601 ) ) ( not ( = ?auto_162598 ?auto_162602 ) ) ( not ( = ?auto_162598 ?auto_162601 ) ) ( not ( = ?auto_162599 ?auto_162602 ) ) ( not ( = ?auto_162599 ?auto_162601 ) ) ( not ( = ?auto_162602 ?auto_162601 ) ) ( ON ?auto_162602 ?auto_162599 ) ( CLEAR ?auto_162600 ) ( ON-TABLE ?auto_162600 ) ( not ( = ?auto_162600 ?auto_162601 ) ) ( not ( = ?auto_162594 ?auto_162600 ) ) ( not ( = ?auto_162595 ?auto_162600 ) ) ( not ( = ?auto_162596 ?auto_162600 ) ) ( not ( = ?auto_162597 ?auto_162600 ) ) ( not ( = ?auto_162598 ?auto_162600 ) ) ( not ( = ?auto_162599 ?auto_162600 ) ) ( not ( = ?auto_162602 ?auto_162600 ) ) ( ON ?auto_162601 ?auto_162602 ) ( CLEAR ?auto_162601 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_162594 ?auto_162595 ?auto_162596 ?auto_162597 ?auto_162598 ?auto_162599 ?auto_162602 )
      ( MAKE-5PILE ?auto_162594 ?auto_162595 ?auto_162596 ?auto_162597 ?auto_162598 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_162603 - BLOCK
      ?auto_162604 - BLOCK
      ?auto_162605 - BLOCK
      ?auto_162606 - BLOCK
      ?auto_162607 - BLOCK
    )
    :vars
    (
      ?auto_162610 - BLOCK
      ?auto_162609 - BLOCK
      ?auto_162608 - BLOCK
      ?auto_162611 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_162610 ?auto_162607 ) ( ON-TABLE ?auto_162603 ) ( ON ?auto_162604 ?auto_162603 ) ( ON ?auto_162605 ?auto_162604 ) ( ON ?auto_162606 ?auto_162605 ) ( ON ?auto_162607 ?auto_162606 ) ( not ( = ?auto_162603 ?auto_162604 ) ) ( not ( = ?auto_162603 ?auto_162605 ) ) ( not ( = ?auto_162603 ?auto_162606 ) ) ( not ( = ?auto_162603 ?auto_162607 ) ) ( not ( = ?auto_162603 ?auto_162610 ) ) ( not ( = ?auto_162604 ?auto_162605 ) ) ( not ( = ?auto_162604 ?auto_162606 ) ) ( not ( = ?auto_162604 ?auto_162607 ) ) ( not ( = ?auto_162604 ?auto_162610 ) ) ( not ( = ?auto_162605 ?auto_162606 ) ) ( not ( = ?auto_162605 ?auto_162607 ) ) ( not ( = ?auto_162605 ?auto_162610 ) ) ( not ( = ?auto_162606 ?auto_162607 ) ) ( not ( = ?auto_162606 ?auto_162610 ) ) ( not ( = ?auto_162607 ?auto_162610 ) ) ( not ( = ?auto_162603 ?auto_162609 ) ) ( not ( = ?auto_162603 ?auto_162608 ) ) ( not ( = ?auto_162604 ?auto_162609 ) ) ( not ( = ?auto_162604 ?auto_162608 ) ) ( not ( = ?auto_162605 ?auto_162609 ) ) ( not ( = ?auto_162605 ?auto_162608 ) ) ( not ( = ?auto_162606 ?auto_162609 ) ) ( not ( = ?auto_162606 ?auto_162608 ) ) ( not ( = ?auto_162607 ?auto_162609 ) ) ( not ( = ?auto_162607 ?auto_162608 ) ) ( not ( = ?auto_162610 ?auto_162609 ) ) ( not ( = ?auto_162610 ?auto_162608 ) ) ( not ( = ?auto_162609 ?auto_162608 ) ) ( ON ?auto_162609 ?auto_162610 ) ( not ( = ?auto_162611 ?auto_162608 ) ) ( not ( = ?auto_162603 ?auto_162611 ) ) ( not ( = ?auto_162604 ?auto_162611 ) ) ( not ( = ?auto_162605 ?auto_162611 ) ) ( not ( = ?auto_162606 ?auto_162611 ) ) ( not ( = ?auto_162607 ?auto_162611 ) ) ( not ( = ?auto_162610 ?auto_162611 ) ) ( not ( = ?auto_162609 ?auto_162611 ) ) ( ON ?auto_162608 ?auto_162609 ) ( CLEAR ?auto_162608 ) ( HOLDING ?auto_162611 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_162611 )
      ( MAKE-5PILE ?auto_162603 ?auto_162604 ?auto_162605 ?auto_162606 ?auto_162607 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_162612 - BLOCK
      ?auto_162613 - BLOCK
      ?auto_162614 - BLOCK
      ?auto_162615 - BLOCK
      ?auto_162616 - BLOCK
    )
    :vars
    (
      ?auto_162619 - BLOCK
      ?auto_162617 - BLOCK
      ?auto_162618 - BLOCK
      ?auto_162620 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_162619 ?auto_162616 ) ( ON-TABLE ?auto_162612 ) ( ON ?auto_162613 ?auto_162612 ) ( ON ?auto_162614 ?auto_162613 ) ( ON ?auto_162615 ?auto_162614 ) ( ON ?auto_162616 ?auto_162615 ) ( not ( = ?auto_162612 ?auto_162613 ) ) ( not ( = ?auto_162612 ?auto_162614 ) ) ( not ( = ?auto_162612 ?auto_162615 ) ) ( not ( = ?auto_162612 ?auto_162616 ) ) ( not ( = ?auto_162612 ?auto_162619 ) ) ( not ( = ?auto_162613 ?auto_162614 ) ) ( not ( = ?auto_162613 ?auto_162615 ) ) ( not ( = ?auto_162613 ?auto_162616 ) ) ( not ( = ?auto_162613 ?auto_162619 ) ) ( not ( = ?auto_162614 ?auto_162615 ) ) ( not ( = ?auto_162614 ?auto_162616 ) ) ( not ( = ?auto_162614 ?auto_162619 ) ) ( not ( = ?auto_162615 ?auto_162616 ) ) ( not ( = ?auto_162615 ?auto_162619 ) ) ( not ( = ?auto_162616 ?auto_162619 ) ) ( not ( = ?auto_162612 ?auto_162617 ) ) ( not ( = ?auto_162612 ?auto_162618 ) ) ( not ( = ?auto_162613 ?auto_162617 ) ) ( not ( = ?auto_162613 ?auto_162618 ) ) ( not ( = ?auto_162614 ?auto_162617 ) ) ( not ( = ?auto_162614 ?auto_162618 ) ) ( not ( = ?auto_162615 ?auto_162617 ) ) ( not ( = ?auto_162615 ?auto_162618 ) ) ( not ( = ?auto_162616 ?auto_162617 ) ) ( not ( = ?auto_162616 ?auto_162618 ) ) ( not ( = ?auto_162619 ?auto_162617 ) ) ( not ( = ?auto_162619 ?auto_162618 ) ) ( not ( = ?auto_162617 ?auto_162618 ) ) ( ON ?auto_162617 ?auto_162619 ) ( not ( = ?auto_162620 ?auto_162618 ) ) ( not ( = ?auto_162612 ?auto_162620 ) ) ( not ( = ?auto_162613 ?auto_162620 ) ) ( not ( = ?auto_162614 ?auto_162620 ) ) ( not ( = ?auto_162615 ?auto_162620 ) ) ( not ( = ?auto_162616 ?auto_162620 ) ) ( not ( = ?auto_162619 ?auto_162620 ) ) ( not ( = ?auto_162617 ?auto_162620 ) ) ( ON ?auto_162618 ?auto_162617 ) ( ON ?auto_162620 ?auto_162618 ) ( CLEAR ?auto_162620 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_162612 ?auto_162613 ?auto_162614 ?auto_162615 ?auto_162616 ?auto_162619 ?auto_162617 ?auto_162618 )
      ( MAKE-5PILE ?auto_162612 ?auto_162613 ?auto_162614 ?auto_162615 ?auto_162616 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_162625 - BLOCK
      ?auto_162626 - BLOCK
      ?auto_162627 - BLOCK
      ?auto_162628 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_162628 ) ( CLEAR ?auto_162627 ) ( ON-TABLE ?auto_162625 ) ( ON ?auto_162626 ?auto_162625 ) ( ON ?auto_162627 ?auto_162626 ) ( not ( = ?auto_162625 ?auto_162626 ) ) ( not ( = ?auto_162625 ?auto_162627 ) ) ( not ( = ?auto_162625 ?auto_162628 ) ) ( not ( = ?auto_162626 ?auto_162627 ) ) ( not ( = ?auto_162626 ?auto_162628 ) ) ( not ( = ?auto_162627 ?auto_162628 ) ) )
    :subtasks
    ( ( !STACK ?auto_162628 ?auto_162627 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_162629 - BLOCK
      ?auto_162630 - BLOCK
      ?auto_162631 - BLOCK
      ?auto_162632 - BLOCK
    )
    :vars
    (
      ?auto_162633 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_162631 ) ( ON-TABLE ?auto_162629 ) ( ON ?auto_162630 ?auto_162629 ) ( ON ?auto_162631 ?auto_162630 ) ( not ( = ?auto_162629 ?auto_162630 ) ) ( not ( = ?auto_162629 ?auto_162631 ) ) ( not ( = ?auto_162629 ?auto_162632 ) ) ( not ( = ?auto_162630 ?auto_162631 ) ) ( not ( = ?auto_162630 ?auto_162632 ) ) ( not ( = ?auto_162631 ?auto_162632 ) ) ( ON ?auto_162632 ?auto_162633 ) ( CLEAR ?auto_162632 ) ( HAND-EMPTY ) ( not ( = ?auto_162629 ?auto_162633 ) ) ( not ( = ?auto_162630 ?auto_162633 ) ) ( not ( = ?auto_162631 ?auto_162633 ) ) ( not ( = ?auto_162632 ?auto_162633 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_162632 ?auto_162633 )
      ( MAKE-4PILE ?auto_162629 ?auto_162630 ?auto_162631 ?auto_162632 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_162634 - BLOCK
      ?auto_162635 - BLOCK
      ?auto_162636 - BLOCK
      ?auto_162637 - BLOCK
    )
    :vars
    (
      ?auto_162638 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_162634 ) ( ON ?auto_162635 ?auto_162634 ) ( not ( = ?auto_162634 ?auto_162635 ) ) ( not ( = ?auto_162634 ?auto_162636 ) ) ( not ( = ?auto_162634 ?auto_162637 ) ) ( not ( = ?auto_162635 ?auto_162636 ) ) ( not ( = ?auto_162635 ?auto_162637 ) ) ( not ( = ?auto_162636 ?auto_162637 ) ) ( ON ?auto_162637 ?auto_162638 ) ( CLEAR ?auto_162637 ) ( not ( = ?auto_162634 ?auto_162638 ) ) ( not ( = ?auto_162635 ?auto_162638 ) ) ( not ( = ?auto_162636 ?auto_162638 ) ) ( not ( = ?auto_162637 ?auto_162638 ) ) ( HOLDING ?auto_162636 ) ( CLEAR ?auto_162635 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_162634 ?auto_162635 ?auto_162636 )
      ( MAKE-4PILE ?auto_162634 ?auto_162635 ?auto_162636 ?auto_162637 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_162639 - BLOCK
      ?auto_162640 - BLOCK
      ?auto_162641 - BLOCK
      ?auto_162642 - BLOCK
    )
    :vars
    (
      ?auto_162643 - BLOCK
      ?auto_162645 - BLOCK
      ?auto_162646 - BLOCK
      ?auto_162644 - BLOCK
      ?auto_162647 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_162639 ) ( ON ?auto_162640 ?auto_162639 ) ( not ( = ?auto_162639 ?auto_162640 ) ) ( not ( = ?auto_162639 ?auto_162641 ) ) ( not ( = ?auto_162639 ?auto_162642 ) ) ( not ( = ?auto_162640 ?auto_162641 ) ) ( not ( = ?auto_162640 ?auto_162642 ) ) ( not ( = ?auto_162641 ?auto_162642 ) ) ( ON ?auto_162642 ?auto_162643 ) ( not ( = ?auto_162639 ?auto_162643 ) ) ( not ( = ?auto_162640 ?auto_162643 ) ) ( not ( = ?auto_162641 ?auto_162643 ) ) ( not ( = ?auto_162642 ?auto_162643 ) ) ( CLEAR ?auto_162640 ) ( ON ?auto_162641 ?auto_162642 ) ( CLEAR ?auto_162641 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_162645 ) ( ON ?auto_162646 ?auto_162645 ) ( ON ?auto_162644 ?auto_162646 ) ( ON ?auto_162647 ?auto_162644 ) ( ON ?auto_162643 ?auto_162647 ) ( not ( = ?auto_162645 ?auto_162646 ) ) ( not ( = ?auto_162645 ?auto_162644 ) ) ( not ( = ?auto_162645 ?auto_162647 ) ) ( not ( = ?auto_162645 ?auto_162643 ) ) ( not ( = ?auto_162645 ?auto_162642 ) ) ( not ( = ?auto_162645 ?auto_162641 ) ) ( not ( = ?auto_162646 ?auto_162644 ) ) ( not ( = ?auto_162646 ?auto_162647 ) ) ( not ( = ?auto_162646 ?auto_162643 ) ) ( not ( = ?auto_162646 ?auto_162642 ) ) ( not ( = ?auto_162646 ?auto_162641 ) ) ( not ( = ?auto_162644 ?auto_162647 ) ) ( not ( = ?auto_162644 ?auto_162643 ) ) ( not ( = ?auto_162644 ?auto_162642 ) ) ( not ( = ?auto_162644 ?auto_162641 ) ) ( not ( = ?auto_162647 ?auto_162643 ) ) ( not ( = ?auto_162647 ?auto_162642 ) ) ( not ( = ?auto_162647 ?auto_162641 ) ) ( not ( = ?auto_162639 ?auto_162645 ) ) ( not ( = ?auto_162639 ?auto_162646 ) ) ( not ( = ?auto_162639 ?auto_162644 ) ) ( not ( = ?auto_162639 ?auto_162647 ) ) ( not ( = ?auto_162640 ?auto_162645 ) ) ( not ( = ?auto_162640 ?auto_162646 ) ) ( not ( = ?auto_162640 ?auto_162644 ) ) ( not ( = ?auto_162640 ?auto_162647 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_162645 ?auto_162646 ?auto_162644 ?auto_162647 ?auto_162643 ?auto_162642 )
      ( MAKE-4PILE ?auto_162639 ?auto_162640 ?auto_162641 ?auto_162642 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_162648 - BLOCK
      ?auto_162649 - BLOCK
      ?auto_162650 - BLOCK
      ?auto_162651 - BLOCK
    )
    :vars
    (
      ?auto_162653 - BLOCK
      ?auto_162656 - BLOCK
      ?auto_162652 - BLOCK
      ?auto_162655 - BLOCK
      ?auto_162654 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_162648 ) ( not ( = ?auto_162648 ?auto_162649 ) ) ( not ( = ?auto_162648 ?auto_162650 ) ) ( not ( = ?auto_162648 ?auto_162651 ) ) ( not ( = ?auto_162649 ?auto_162650 ) ) ( not ( = ?auto_162649 ?auto_162651 ) ) ( not ( = ?auto_162650 ?auto_162651 ) ) ( ON ?auto_162651 ?auto_162653 ) ( not ( = ?auto_162648 ?auto_162653 ) ) ( not ( = ?auto_162649 ?auto_162653 ) ) ( not ( = ?auto_162650 ?auto_162653 ) ) ( not ( = ?auto_162651 ?auto_162653 ) ) ( ON ?auto_162650 ?auto_162651 ) ( CLEAR ?auto_162650 ) ( ON-TABLE ?auto_162656 ) ( ON ?auto_162652 ?auto_162656 ) ( ON ?auto_162655 ?auto_162652 ) ( ON ?auto_162654 ?auto_162655 ) ( ON ?auto_162653 ?auto_162654 ) ( not ( = ?auto_162656 ?auto_162652 ) ) ( not ( = ?auto_162656 ?auto_162655 ) ) ( not ( = ?auto_162656 ?auto_162654 ) ) ( not ( = ?auto_162656 ?auto_162653 ) ) ( not ( = ?auto_162656 ?auto_162651 ) ) ( not ( = ?auto_162656 ?auto_162650 ) ) ( not ( = ?auto_162652 ?auto_162655 ) ) ( not ( = ?auto_162652 ?auto_162654 ) ) ( not ( = ?auto_162652 ?auto_162653 ) ) ( not ( = ?auto_162652 ?auto_162651 ) ) ( not ( = ?auto_162652 ?auto_162650 ) ) ( not ( = ?auto_162655 ?auto_162654 ) ) ( not ( = ?auto_162655 ?auto_162653 ) ) ( not ( = ?auto_162655 ?auto_162651 ) ) ( not ( = ?auto_162655 ?auto_162650 ) ) ( not ( = ?auto_162654 ?auto_162653 ) ) ( not ( = ?auto_162654 ?auto_162651 ) ) ( not ( = ?auto_162654 ?auto_162650 ) ) ( not ( = ?auto_162648 ?auto_162656 ) ) ( not ( = ?auto_162648 ?auto_162652 ) ) ( not ( = ?auto_162648 ?auto_162655 ) ) ( not ( = ?auto_162648 ?auto_162654 ) ) ( not ( = ?auto_162649 ?auto_162656 ) ) ( not ( = ?auto_162649 ?auto_162652 ) ) ( not ( = ?auto_162649 ?auto_162655 ) ) ( not ( = ?auto_162649 ?auto_162654 ) ) ( HOLDING ?auto_162649 ) ( CLEAR ?auto_162648 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_162648 ?auto_162649 )
      ( MAKE-4PILE ?auto_162648 ?auto_162649 ?auto_162650 ?auto_162651 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_162657 - BLOCK
      ?auto_162658 - BLOCK
      ?auto_162659 - BLOCK
      ?auto_162660 - BLOCK
    )
    :vars
    (
      ?auto_162665 - BLOCK
      ?auto_162663 - BLOCK
      ?auto_162664 - BLOCK
      ?auto_162662 - BLOCK
      ?auto_162661 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_162657 ) ( not ( = ?auto_162657 ?auto_162658 ) ) ( not ( = ?auto_162657 ?auto_162659 ) ) ( not ( = ?auto_162657 ?auto_162660 ) ) ( not ( = ?auto_162658 ?auto_162659 ) ) ( not ( = ?auto_162658 ?auto_162660 ) ) ( not ( = ?auto_162659 ?auto_162660 ) ) ( ON ?auto_162660 ?auto_162665 ) ( not ( = ?auto_162657 ?auto_162665 ) ) ( not ( = ?auto_162658 ?auto_162665 ) ) ( not ( = ?auto_162659 ?auto_162665 ) ) ( not ( = ?auto_162660 ?auto_162665 ) ) ( ON ?auto_162659 ?auto_162660 ) ( ON-TABLE ?auto_162663 ) ( ON ?auto_162664 ?auto_162663 ) ( ON ?auto_162662 ?auto_162664 ) ( ON ?auto_162661 ?auto_162662 ) ( ON ?auto_162665 ?auto_162661 ) ( not ( = ?auto_162663 ?auto_162664 ) ) ( not ( = ?auto_162663 ?auto_162662 ) ) ( not ( = ?auto_162663 ?auto_162661 ) ) ( not ( = ?auto_162663 ?auto_162665 ) ) ( not ( = ?auto_162663 ?auto_162660 ) ) ( not ( = ?auto_162663 ?auto_162659 ) ) ( not ( = ?auto_162664 ?auto_162662 ) ) ( not ( = ?auto_162664 ?auto_162661 ) ) ( not ( = ?auto_162664 ?auto_162665 ) ) ( not ( = ?auto_162664 ?auto_162660 ) ) ( not ( = ?auto_162664 ?auto_162659 ) ) ( not ( = ?auto_162662 ?auto_162661 ) ) ( not ( = ?auto_162662 ?auto_162665 ) ) ( not ( = ?auto_162662 ?auto_162660 ) ) ( not ( = ?auto_162662 ?auto_162659 ) ) ( not ( = ?auto_162661 ?auto_162665 ) ) ( not ( = ?auto_162661 ?auto_162660 ) ) ( not ( = ?auto_162661 ?auto_162659 ) ) ( not ( = ?auto_162657 ?auto_162663 ) ) ( not ( = ?auto_162657 ?auto_162664 ) ) ( not ( = ?auto_162657 ?auto_162662 ) ) ( not ( = ?auto_162657 ?auto_162661 ) ) ( not ( = ?auto_162658 ?auto_162663 ) ) ( not ( = ?auto_162658 ?auto_162664 ) ) ( not ( = ?auto_162658 ?auto_162662 ) ) ( not ( = ?auto_162658 ?auto_162661 ) ) ( CLEAR ?auto_162657 ) ( ON ?auto_162658 ?auto_162659 ) ( CLEAR ?auto_162658 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_162663 ?auto_162664 ?auto_162662 ?auto_162661 ?auto_162665 ?auto_162660 ?auto_162659 )
      ( MAKE-4PILE ?auto_162657 ?auto_162658 ?auto_162659 ?auto_162660 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_162666 - BLOCK
      ?auto_162667 - BLOCK
      ?auto_162668 - BLOCK
      ?auto_162669 - BLOCK
    )
    :vars
    (
      ?auto_162674 - BLOCK
      ?auto_162673 - BLOCK
      ?auto_162671 - BLOCK
      ?auto_162672 - BLOCK
      ?auto_162670 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_162666 ?auto_162667 ) ) ( not ( = ?auto_162666 ?auto_162668 ) ) ( not ( = ?auto_162666 ?auto_162669 ) ) ( not ( = ?auto_162667 ?auto_162668 ) ) ( not ( = ?auto_162667 ?auto_162669 ) ) ( not ( = ?auto_162668 ?auto_162669 ) ) ( ON ?auto_162669 ?auto_162674 ) ( not ( = ?auto_162666 ?auto_162674 ) ) ( not ( = ?auto_162667 ?auto_162674 ) ) ( not ( = ?auto_162668 ?auto_162674 ) ) ( not ( = ?auto_162669 ?auto_162674 ) ) ( ON ?auto_162668 ?auto_162669 ) ( ON-TABLE ?auto_162673 ) ( ON ?auto_162671 ?auto_162673 ) ( ON ?auto_162672 ?auto_162671 ) ( ON ?auto_162670 ?auto_162672 ) ( ON ?auto_162674 ?auto_162670 ) ( not ( = ?auto_162673 ?auto_162671 ) ) ( not ( = ?auto_162673 ?auto_162672 ) ) ( not ( = ?auto_162673 ?auto_162670 ) ) ( not ( = ?auto_162673 ?auto_162674 ) ) ( not ( = ?auto_162673 ?auto_162669 ) ) ( not ( = ?auto_162673 ?auto_162668 ) ) ( not ( = ?auto_162671 ?auto_162672 ) ) ( not ( = ?auto_162671 ?auto_162670 ) ) ( not ( = ?auto_162671 ?auto_162674 ) ) ( not ( = ?auto_162671 ?auto_162669 ) ) ( not ( = ?auto_162671 ?auto_162668 ) ) ( not ( = ?auto_162672 ?auto_162670 ) ) ( not ( = ?auto_162672 ?auto_162674 ) ) ( not ( = ?auto_162672 ?auto_162669 ) ) ( not ( = ?auto_162672 ?auto_162668 ) ) ( not ( = ?auto_162670 ?auto_162674 ) ) ( not ( = ?auto_162670 ?auto_162669 ) ) ( not ( = ?auto_162670 ?auto_162668 ) ) ( not ( = ?auto_162666 ?auto_162673 ) ) ( not ( = ?auto_162666 ?auto_162671 ) ) ( not ( = ?auto_162666 ?auto_162672 ) ) ( not ( = ?auto_162666 ?auto_162670 ) ) ( not ( = ?auto_162667 ?auto_162673 ) ) ( not ( = ?auto_162667 ?auto_162671 ) ) ( not ( = ?auto_162667 ?auto_162672 ) ) ( not ( = ?auto_162667 ?auto_162670 ) ) ( ON ?auto_162667 ?auto_162668 ) ( CLEAR ?auto_162667 ) ( HOLDING ?auto_162666 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_162666 )
      ( MAKE-4PILE ?auto_162666 ?auto_162667 ?auto_162668 ?auto_162669 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_162675 - BLOCK
      ?auto_162676 - BLOCK
      ?auto_162677 - BLOCK
      ?auto_162678 - BLOCK
    )
    :vars
    (
      ?auto_162682 - BLOCK
      ?auto_162679 - BLOCK
      ?auto_162683 - BLOCK
      ?auto_162681 - BLOCK
      ?auto_162680 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_162675 ?auto_162676 ) ) ( not ( = ?auto_162675 ?auto_162677 ) ) ( not ( = ?auto_162675 ?auto_162678 ) ) ( not ( = ?auto_162676 ?auto_162677 ) ) ( not ( = ?auto_162676 ?auto_162678 ) ) ( not ( = ?auto_162677 ?auto_162678 ) ) ( ON ?auto_162678 ?auto_162682 ) ( not ( = ?auto_162675 ?auto_162682 ) ) ( not ( = ?auto_162676 ?auto_162682 ) ) ( not ( = ?auto_162677 ?auto_162682 ) ) ( not ( = ?auto_162678 ?auto_162682 ) ) ( ON ?auto_162677 ?auto_162678 ) ( ON-TABLE ?auto_162679 ) ( ON ?auto_162683 ?auto_162679 ) ( ON ?auto_162681 ?auto_162683 ) ( ON ?auto_162680 ?auto_162681 ) ( ON ?auto_162682 ?auto_162680 ) ( not ( = ?auto_162679 ?auto_162683 ) ) ( not ( = ?auto_162679 ?auto_162681 ) ) ( not ( = ?auto_162679 ?auto_162680 ) ) ( not ( = ?auto_162679 ?auto_162682 ) ) ( not ( = ?auto_162679 ?auto_162678 ) ) ( not ( = ?auto_162679 ?auto_162677 ) ) ( not ( = ?auto_162683 ?auto_162681 ) ) ( not ( = ?auto_162683 ?auto_162680 ) ) ( not ( = ?auto_162683 ?auto_162682 ) ) ( not ( = ?auto_162683 ?auto_162678 ) ) ( not ( = ?auto_162683 ?auto_162677 ) ) ( not ( = ?auto_162681 ?auto_162680 ) ) ( not ( = ?auto_162681 ?auto_162682 ) ) ( not ( = ?auto_162681 ?auto_162678 ) ) ( not ( = ?auto_162681 ?auto_162677 ) ) ( not ( = ?auto_162680 ?auto_162682 ) ) ( not ( = ?auto_162680 ?auto_162678 ) ) ( not ( = ?auto_162680 ?auto_162677 ) ) ( not ( = ?auto_162675 ?auto_162679 ) ) ( not ( = ?auto_162675 ?auto_162683 ) ) ( not ( = ?auto_162675 ?auto_162681 ) ) ( not ( = ?auto_162675 ?auto_162680 ) ) ( not ( = ?auto_162676 ?auto_162679 ) ) ( not ( = ?auto_162676 ?auto_162683 ) ) ( not ( = ?auto_162676 ?auto_162681 ) ) ( not ( = ?auto_162676 ?auto_162680 ) ) ( ON ?auto_162676 ?auto_162677 ) ( ON ?auto_162675 ?auto_162676 ) ( CLEAR ?auto_162675 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_162679 ?auto_162683 ?auto_162681 ?auto_162680 ?auto_162682 ?auto_162678 ?auto_162677 ?auto_162676 )
      ( MAKE-4PILE ?auto_162675 ?auto_162676 ?auto_162677 ?auto_162678 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_162688 - BLOCK
      ?auto_162689 - BLOCK
      ?auto_162690 - BLOCK
      ?auto_162691 - BLOCK
    )
    :vars
    (
      ?auto_162692 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_162692 ?auto_162691 ) ( CLEAR ?auto_162692 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_162688 ) ( ON ?auto_162689 ?auto_162688 ) ( ON ?auto_162690 ?auto_162689 ) ( ON ?auto_162691 ?auto_162690 ) ( not ( = ?auto_162688 ?auto_162689 ) ) ( not ( = ?auto_162688 ?auto_162690 ) ) ( not ( = ?auto_162688 ?auto_162691 ) ) ( not ( = ?auto_162688 ?auto_162692 ) ) ( not ( = ?auto_162689 ?auto_162690 ) ) ( not ( = ?auto_162689 ?auto_162691 ) ) ( not ( = ?auto_162689 ?auto_162692 ) ) ( not ( = ?auto_162690 ?auto_162691 ) ) ( not ( = ?auto_162690 ?auto_162692 ) ) ( not ( = ?auto_162691 ?auto_162692 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_162692 ?auto_162691 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_162693 - BLOCK
      ?auto_162694 - BLOCK
      ?auto_162695 - BLOCK
      ?auto_162696 - BLOCK
    )
    :vars
    (
      ?auto_162697 - BLOCK
      ?auto_162698 - BLOCK
      ?auto_162699 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_162697 ?auto_162696 ) ( CLEAR ?auto_162697 ) ( ON-TABLE ?auto_162693 ) ( ON ?auto_162694 ?auto_162693 ) ( ON ?auto_162695 ?auto_162694 ) ( ON ?auto_162696 ?auto_162695 ) ( not ( = ?auto_162693 ?auto_162694 ) ) ( not ( = ?auto_162693 ?auto_162695 ) ) ( not ( = ?auto_162693 ?auto_162696 ) ) ( not ( = ?auto_162693 ?auto_162697 ) ) ( not ( = ?auto_162694 ?auto_162695 ) ) ( not ( = ?auto_162694 ?auto_162696 ) ) ( not ( = ?auto_162694 ?auto_162697 ) ) ( not ( = ?auto_162695 ?auto_162696 ) ) ( not ( = ?auto_162695 ?auto_162697 ) ) ( not ( = ?auto_162696 ?auto_162697 ) ) ( HOLDING ?auto_162698 ) ( CLEAR ?auto_162699 ) ( not ( = ?auto_162693 ?auto_162698 ) ) ( not ( = ?auto_162693 ?auto_162699 ) ) ( not ( = ?auto_162694 ?auto_162698 ) ) ( not ( = ?auto_162694 ?auto_162699 ) ) ( not ( = ?auto_162695 ?auto_162698 ) ) ( not ( = ?auto_162695 ?auto_162699 ) ) ( not ( = ?auto_162696 ?auto_162698 ) ) ( not ( = ?auto_162696 ?auto_162699 ) ) ( not ( = ?auto_162697 ?auto_162698 ) ) ( not ( = ?auto_162697 ?auto_162699 ) ) ( not ( = ?auto_162698 ?auto_162699 ) ) )
    :subtasks
    ( ( !STACK ?auto_162698 ?auto_162699 )
      ( MAKE-4PILE ?auto_162693 ?auto_162694 ?auto_162695 ?auto_162696 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_162700 - BLOCK
      ?auto_162701 - BLOCK
      ?auto_162702 - BLOCK
      ?auto_162703 - BLOCK
    )
    :vars
    (
      ?auto_162706 - BLOCK
      ?auto_162705 - BLOCK
      ?auto_162704 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_162706 ?auto_162703 ) ( ON-TABLE ?auto_162700 ) ( ON ?auto_162701 ?auto_162700 ) ( ON ?auto_162702 ?auto_162701 ) ( ON ?auto_162703 ?auto_162702 ) ( not ( = ?auto_162700 ?auto_162701 ) ) ( not ( = ?auto_162700 ?auto_162702 ) ) ( not ( = ?auto_162700 ?auto_162703 ) ) ( not ( = ?auto_162700 ?auto_162706 ) ) ( not ( = ?auto_162701 ?auto_162702 ) ) ( not ( = ?auto_162701 ?auto_162703 ) ) ( not ( = ?auto_162701 ?auto_162706 ) ) ( not ( = ?auto_162702 ?auto_162703 ) ) ( not ( = ?auto_162702 ?auto_162706 ) ) ( not ( = ?auto_162703 ?auto_162706 ) ) ( CLEAR ?auto_162705 ) ( not ( = ?auto_162700 ?auto_162704 ) ) ( not ( = ?auto_162700 ?auto_162705 ) ) ( not ( = ?auto_162701 ?auto_162704 ) ) ( not ( = ?auto_162701 ?auto_162705 ) ) ( not ( = ?auto_162702 ?auto_162704 ) ) ( not ( = ?auto_162702 ?auto_162705 ) ) ( not ( = ?auto_162703 ?auto_162704 ) ) ( not ( = ?auto_162703 ?auto_162705 ) ) ( not ( = ?auto_162706 ?auto_162704 ) ) ( not ( = ?auto_162706 ?auto_162705 ) ) ( not ( = ?auto_162704 ?auto_162705 ) ) ( ON ?auto_162704 ?auto_162706 ) ( CLEAR ?auto_162704 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_162700 ?auto_162701 ?auto_162702 ?auto_162703 ?auto_162706 )
      ( MAKE-4PILE ?auto_162700 ?auto_162701 ?auto_162702 ?auto_162703 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_162707 - BLOCK
      ?auto_162708 - BLOCK
      ?auto_162709 - BLOCK
      ?auto_162710 - BLOCK
    )
    :vars
    (
      ?auto_162712 - BLOCK
      ?auto_162713 - BLOCK
      ?auto_162711 - BLOCK
      ?auto_162715 - BLOCK
      ?auto_162714 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_162712 ?auto_162710 ) ( ON-TABLE ?auto_162707 ) ( ON ?auto_162708 ?auto_162707 ) ( ON ?auto_162709 ?auto_162708 ) ( ON ?auto_162710 ?auto_162709 ) ( not ( = ?auto_162707 ?auto_162708 ) ) ( not ( = ?auto_162707 ?auto_162709 ) ) ( not ( = ?auto_162707 ?auto_162710 ) ) ( not ( = ?auto_162707 ?auto_162712 ) ) ( not ( = ?auto_162708 ?auto_162709 ) ) ( not ( = ?auto_162708 ?auto_162710 ) ) ( not ( = ?auto_162708 ?auto_162712 ) ) ( not ( = ?auto_162709 ?auto_162710 ) ) ( not ( = ?auto_162709 ?auto_162712 ) ) ( not ( = ?auto_162710 ?auto_162712 ) ) ( not ( = ?auto_162707 ?auto_162713 ) ) ( not ( = ?auto_162707 ?auto_162711 ) ) ( not ( = ?auto_162708 ?auto_162713 ) ) ( not ( = ?auto_162708 ?auto_162711 ) ) ( not ( = ?auto_162709 ?auto_162713 ) ) ( not ( = ?auto_162709 ?auto_162711 ) ) ( not ( = ?auto_162710 ?auto_162713 ) ) ( not ( = ?auto_162710 ?auto_162711 ) ) ( not ( = ?auto_162712 ?auto_162713 ) ) ( not ( = ?auto_162712 ?auto_162711 ) ) ( not ( = ?auto_162713 ?auto_162711 ) ) ( ON ?auto_162713 ?auto_162712 ) ( CLEAR ?auto_162713 ) ( HOLDING ?auto_162711 ) ( CLEAR ?auto_162715 ) ( ON-TABLE ?auto_162714 ) ( ON ?auto_162715 ?auto_162714 ) ( not ( = ?auto_162714 ?auto_162715 ) ) ( not ( = ?auto_162714 ?auto_162711 ) ) ( not ( = ?auto_162715 ?auto_162711 ) ) ( not ( = ?auto_162707 ?auto_162715 ) ) ( not ( = ?auto_162707 ?auto_162714 ) ) ( not ( = ?auto_162708 ?auto_162715 ) ) ( not ( = ?auto_162708 ?auto_162714 ) ) ( not ( = ?auto_162709 ?auto_162715 ) ) ( not ( = ?auto_162709 ?auto_162714 ) ) ( not ( = ?auto_162710 ?auto_162715 ) ) ( not ( = ?auto_162710 ?auto_162714 ) ) ( not ( = ?auto_162712 ?auto_162715 ) ) ( not ( = ?auto_162712 ?auto_162714 ) ) ( not ( = ?auto_162713 ?auto_162715 ) ) ( not ( = ?auto_162713 ?auto_162714 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_162714 ?auto_162715 ?auto_162711 )
      ( MAKE-4PILE ?auto_162707 ?auto_162708 ?auto_162709 ?auto_162710 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_162716 - BLOCK
      ?auto_162717 - BLOCK
      ?auto_162718 - BLOCK
      ?auto_162719 - BLOCK
    )
    :vars
    (
      ?auto_162722 - BLOCK
      ?auto_162721 - BLOCK
      ?auto_162723 - BLOCK
      ?auto_162720 - BLOCK
      ?auto_162724 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_162722 ?auto_162719 ) ( ON-TABLE ?auto_162716 ) ( ON ?auto_162717 ?auto_162716 ) ( ON ?auto_162718 ?auto_162717 ) ( ON ?auto_162719 ?auto_162718 ) ( not ( = ?auto_162716 ?auto_162717 ) ) ( not ( = ?auto_162716 ?auto_162718 ) ) ( not ( = ?auto_162716 ?auto_162719 ) ) ( not ( = ?auto_162716 ?auto_162722 ) ) ( not ( = ?auto_162717 ?auto_162718 ) ) ( not ( = ?auto_162717 ?auto_162719 ) ) ( not ( = ?auto_162717 ?auto_162722 ) ) ( not ( = ?auto_162718 ?auto_162719 ) ) ( not ( = ?auto_162718 ?auto_162722 ) ) ( not ( = ?auto_162719 ?auto_162722 ) ) ( not ( = ?auto_162716 ?auto_162721 ) ) ( not ( = ?auto_162716 ?auto_162723 ) ) ( not ( = ?auto_162717 ?auto_162721 ) ) ( not ( = ?auto_162717 ?auto_162723 ) ) ( not ( = ?auto_162718 ?auto_162721 ) ) ( not ( = ?auto_162718 ?auto_162723 ) ) ( not ( = ?auto_162719 ?auto_162721 ) ) ( not ( = ?auto_162719 ?auto_162723 ) ) ( not ( = ?auto_162722 ?auto_162721 ) ) ( not ( = ?auto_162722 ?auto_162723 ) ) ( not ( = ?auto_162721 ?auto_162723 ) ) ( ON ?auto_162721 ?auto_162722 ) ( CLEAR ?auto_162720 ) ( ON-TABLE ?auto_162724 ) ( ON ?auto_162720 ?auto_162724 ) ( not ( = ?auto_162724 ?auto_162720 ) ) ( not ( = ?auto_162724 ?auto_162723 ) ) ( not ( = ?auto_162720 ?auto_162723 ) ) ( not ( = ?auto_162716 ?auto_162720 ) ) ( not ( = ?auto_162716 ?auto_162724 ) ) ( not ( = ?auto_162717 ?auto_162720 ) ) ( not ( = ?auto_162717 ?auto_162724 ) ) ( not ( = ?auto_162718 ?auto_162720 ) ) ( not ( = ?auto_162718 ?auto_162724 ) ) ( not ( = ?auto_162719 ?auto_162720 ) ) ( not ( = ?auto_162719 ?auto_162724 ) ) ( not ( = ?auto_162722 ?auto_162720 ) ) ( not ( = ?auto_162722 ?auto_162724 ) ) ( not ( = ?auto_162721 ?auto_162720 ) ) ( not ( = ?auto_162721 ?auto_162724 ) ) ( ON ?auto_162723 ?auto_162721 ) ( CLEAR ?auto_162723 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_162716 ?auto_162717 ?auto_162718 ?auto_162719 ?auto_162722 ?auto_162721 )
      ( MAKE-4PILE ?auto_162716 ?auto_162717 ?auto_162718 ?auto_162719 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_162725 - BLOCK
      ?auto_162726 - BLOCK
      ?auto_162727 - BLOCK
      ?auto_162728 - BLOCK
    )
    :vars
    (
      ?auto_162733 - BLOCK
      ?auto_162732 - BLOCK
      ?auto_162730 - BLOCK
      ?auto_162731 - BLOCK
      ?auto_162729 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_162733 ?auto_162728 ) ( ON-TABLE ?auto_162725 ) ( ON ?auto_162726 ?auto_162725 ) ( ON ?auto_162727 ?auto_162726 ) ( ON ?auto_162728 ?auto_162727 ) ( not ( = ?auto_162725 ?auto_162726 ) ) ( not ( = ?auto_162725 ?auto_162727 ) ) ( not ( = ?auto_162725 ?auto_162728 ) ) ( not ( = ?auto_162725 ?auto_162733 ) ) ( not ( = ?auto_162726 ?auto_162727 ) ) ( not ( = ?auto_162726 ?auto_162728 ) ) ( not ( = ?auto_162726 ?auto_162733 ) ) ( not ( = ?auto_162727 ?auto_162728 ) ) ( not ( = ?auto_162727 ?auto_162733 ) ) ( not ( = ?auto_162728 ?auto_162733 ) ) ( not ( = ?auto_162725 ?auto_162732 ) ) ( not ( = ?auto_162725 ?auto_162730 ) ) ( not ( = ?auto_162726 ?auto_162732 ) ) ( not ( = ?auto_162726 ?auto_162730 ) ) ( not ( = ?auto_162727 ?auto_162732 ) ) ( not ( = ?auto_162727 ?auto_162730 ) ) ( not ( = ?auto_162728 ?auto_162732 ) ) ( not ( = ?auto_162728 ?auto_162730 ) ) ( not ( = ?auto_162733 ?auto_162732 ) ) ( not ( = ?auto_162733 ?auto_162730 ) ) ( not ( = ?auto_162732 ?auto_162730 ) ) ( ON ?auto_162732 ?auto_162733 ) ( ON-TABLE ?auto_162731 ) ( not ( = ?auto_162731 ?auto_162729 ) ) ( not ( = ?auto_162731 ?auto_162730 ) ) ( not ( = ?auto_162729 ?auto_162730 ) ) ( not ( = ?auto_162725 ?auto_162729 ) ) ( not ( = ?auto_162725 ?auto_162731 ) ) ( not ( = ?auto_162726 ?auto_162729 ) ) ( not ( = ?auto_162726 ?auto_162731 ) ) ( not ( = ?auto_162727 ?auto_162729 ) ) ( not ( = ?auto_162727 ?auto_162731 ) ) ( not ( = ?auto_162728 ?auto_162729 ) ) ( not ( = ?auto_162728 ?auto_162731 ) ) ( not ( = ?auto_162733 ?auto_162729 ) ) ( not ( = ?auto_162733 ?auto_162731 ) ) ( not ( = ?auto_162732 ?auto_162729 ) ) ( not ( = ?auto_162732 ?auto_162731 ) ) ( ON ?auto_162730 ?auto_162732 ) ( CLEAR ?auto_162730 ) ( HOLDING ?auto_162729 ) ( CLEAR ?auto_162731 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_162731 ?auto_162729 )
      ( MAKE-4PILE ?auto_162725 ?auto_162726 ?auto_162727 ?auto_162728 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_162734 - BLOCK
      ?auto_162735 - BLOCK
      ?auto_162736 - BLOCK
      ?auto_162737 - BLOCK
    )
    :vars
    (
      ?auto_162739 - BLOCK
      ?auto_162741 - BLOCK
      ?auto_162742 - BLOCK
      ?auto_162738 - BLOCK
      ?auto_162740 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_162739 ?auto_162737 ) ( ON-TABLE ?auto_162734 ) ( ON ?auto_162735 ?auto_162734 ) ( ON ?auto_162736 ?auto_162735 ) ( ON ?auto_162737 ?auto_162736 ) ( not ( = ?auto_162734 ?auto_162735 ) ) ( not ( = ?auto_162734 ?auto_162736 ) ) ( not ( = ?auto_162734 ?auto_162737 ) ) ( not ( = ?auto_162734 ?auto_162739 ) ) ( not ( = ?auto_162735 ?auto_162736 ) ) ( not ( = ?auto_162735 ?auto_162737 ) ) ( not ( = ?auto_162735 ?auto_162739 ) ) ( not ( = ?auto_162736 ?auto_162737 ) ) ( not ( = ?auto_162736 ?auto_162739 ) ) ( not ( = ?auto_162737 ?auto_162739 ) ) ( not ( = ?auto_162734 ?auto_162741 ) ) ( not ( = ?auto_162734 ?auto_162742 ) ) ( not ( = ?auto_162735 ?auto_162741 ) ) ( not ( = ?auto_162735 ?auto_162742 ) ) ( not ( = ?auto_162736 ?auto_162741 ) ) ( not ( = ?auto_162736 ?auto_162742 ) ) ( not ( = ?auto_162737 ?auto_162741 ) ) ( not ( = ?auto_162737 ?auto_162742 ) ) ( not ( = ?auto_162739 ?auto_162741 ) ) ( not ( = ?auto_162739 ?auto_162742 ) ) ( not ( = ?auto_162741 ?auto_162742 ) ) ( ON ?auto_162741 ?auto_162739 ) ( ON-TABLE ?auto_162738 ) ( not ( = ?auto_162738 ?auto_162740 ) ) ( not ( = ?auto_162738 ?auto_162742 ) ) ( not ( = ?auto_162740 ?auto_162742 ) ) ( not ( = ?auto_162734 ?auto_162740 ) ) ( not ( = ?auto_162734 ?auto_162738 ) ) ( not ( = ?auto_162735 ?auto_162740 ) ) ( not ( = ?auto_162735 ?auto_162738 ) ) ( not ( = ?auto_162736 ?auto_162740 ) ) ( not ( = ?auto_162736 ?auto_162738 ) ) ( not ( = ?auto_162737 ?auto_162740 ) ) ( not ( = ?auto_162737 ?auto_162738 ) ) ( not ( = ?auto_162739 ?auto_162740 ) ) ( not ( = ?auto_162739 ?auto_162738 ) ) ( not ( = ?auto_162741 ?auto_162740 ) ) ( not ( = ?auto_162741 ?auto_162738 ) ) ( ON ?auto_162742 ?auto_162741 ) ( CLEAR ?auto_162738 ) ( ON ?auto_162740 ?auto_162742 ) ( CLEAR ?auto_162740 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_162734 ?auto_162735 ?auto_162736 ?auto_162737 ?auto_162739 ?auto_162741 ?auto_162742 )
      ( MAKE-4PILE ?auto_162734 ?auto_162735 ?auto_162736 ?auto_162737 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_162743 - BLOCK
      ?auto_162744 - BLOCK
      ?auto_162745 - BLOCK
      ?auto_162746 - BLOCK
    )
    :vars
    (
      ?auto_162748 - BLOCK
      ?auto_162747 - BLOCK
      ?auto_162750 - BLOCK
      ?auto_162749 - BLOCK
      ?auto_162751 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_162748 ?auto_162746 ) ( ON-TABLE ?auto_162743 ) ( ON ?auto_162744 ?auto_162743 ) ( ON ?auto_162745 ?auto_162744 ) ( ON ?auto_162746 ?auto_162745 ) ( not ( = ?auto_162743 ?auto_162744 ) ) ( not ( = ?auto_162743 ?auto_162745 ) ) ( not ( = ?auto_162743 ?auto_162746 ) ) ( not ( = ?auto_162743 ?auto_162748 ) ) ( not ( = ?auto_162744 ?auto_162745 ) ) ( not ( = ?auto_162744 ?auto_162746 ) ) ( not ( = ?auto_162744 ?auto_162748 ) ) ( not ( = ?auto_162745 ?auto_162746 ) ) ( not ( = ?auto_162745 ?auto_162748 ) ) ( not ( = ?auto_162746 ?auto_162748 ) ) ( not ( = ?auto_162743 ?auto_162747 ) ) ( not ( = ?auto_162743 ?auto_162750 ) ) ( not ( = ?auto_162744 ?auto_162747 ) ) ( not ( = ?auto_162744 ?auto_162750 ) ) ( not ( = ?auto_162745 ?auto_162747 ) ) ( not ( = ?auto_162745 ?auto_162750 ) ) ( not ( = ?auto_162746 ?auto_162747 ) ) ( not ( = ?auto_162746 ?auto_162750 ) ) ( not ( = ?auto_162748 ?auto_162747 ) ) ( not ( = ?auto_162748 ?auto_162750 ) ) ( not ( = ?auto_162747 ?auto_162750 ) ) ( ON ?auto_162747 ?auto_162748 ) ( not ( = ?auto_162749 ?auto_162751 ) ) ( not ( = ?auto_162749 ?auto_162750 ) ) ( not ( = ?auto_162751 ?auto_162750 ) ) ( not ( = ?auto_162743 ?auto_162751 ) ) ( not ( = ?auto_162743 ?auto_162749 ) ) ( not ( = ?auto_162744 ?auto_162751 ) ) ( not ( = ?auto_162744 ?auto_162749 ) ) ( not ( = ?auto_162745 ?auto_162751 ) ) ( not ( = ?auto_162745 ?auto_162749 ) ) ( not ( = ?auto_162746 ?auto_162751 ) ) ( not ( = ?auto_162746 ?auto_162749 ) ) ( not ( = ?auto_162748 ?auto_162751 ) ) ( not ( = ?auto_162748 ?auto_162749 ) ) ( not ( = ?auto_162747 ?auto_162751 ) ) ( not ( = ?auto_162747 ?auto_162749 ) ) ( ON ?auto_162750 ?auto_162747 ) ( ON ?auto_162751 ?auto_162750 ) ( CLEAR ?auto_162751 ) ( HOLDING ?auto_162749 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_162749 )
      ( MAKE-4PILE ?auto_162743 ?auto_162744 ?auto_162745 ?auto_162746 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_162752 - BLOCK
      ?auto_162753 - BLOCK
      ?auto_162754 - BLOCK
      ?auto_162755 - BLOCK
    )
    :vars
    (
      ?auto_162757 - BLOCK
      ?auto_162756 - BLOCK
      ?auto_162760 - BLOCK
      ?auto_162759 - BLOCK
      ?auto_162758 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_162757 ?auto_162755 ) ( ON-TABLE ?auto_162752 ) ( ON ?auto_162753 ?auto_162752 ) ( ON ?auto_162754 ?auto_162753 ) ( ON ?auto_162755 ?auto_162754 ) ( not ( = ?auto_162752 ?auto_162753 ) ) ( not ( = ?auto_162752 ?auto_162754 ) ) ( not ( = ?auto_162752 ?auto_162755 ) ) ( not ( = ?auto_162752 ?auto_162757 ) ) ( not ( = ?auto_162753 ?auto_162754 ) ) ( not ( = ?auto_162753 ?auto_162755 ) ) ( not ( = ?auto_162753 ?auto_162757 ) ) ( not ( = ?auto_162754 ?auto_162755 ) ) ( not ( = ?auto_162754 ?auto_162757 ) ) ( not ( = ?auto_162755 ?auto_162757 ) ) ( not ( = ?auto_162752 ?auto_162756 ) ) ( not ( = ?auto_162752 ?auto_162760 ) ) ( not ( = ?auto_162753 ?auto_162756 ) ) ( not ( = ?auto_162753 ?auto_162760 ) ) ( not ( = ?auto_162754 ?auto_162756 ) ) ( not ( = ?auto_162754 ?auto_162760 ) ) ( not ( = ?auto_162755 ?auto_162756 ) ) ( not ( = ?auto_162755 ?auto_162760 ) ) ( not ( = ?auto_162757 ?auto_162756 ) ) ( not ( = ?auto_162757 ?auto_162760 ) ) ( not ( = ?auto_162756 ?auto_162760 ) ) ( ON ?auto_162756 ?auto_162757 ) ( not ( = ?auto_162759 ?auto_162758 ) ) ( not ( = ?auto_162759 ?auto_162760 ) ) ( not ( = ?auto_162758 ?auto_162760 ) ) ( not ( = ?auto_162752 ?auto_162758 ) ) ( not ( = ?auto_162752 ?auto_162759 ) ) ( not ( = ?auto_162753 ?auto_162758 ) ) ( not ( = ?auto_162753 ?auto_162759 ) ) ( not ( = ?auto_162754 ?auto_162758 ) ) ( not ( = ?auto_162754 ?auto_162759 ) ) ( not ( = ?auto_162755 ?auto_162758 ) ) ( not ( = ?auto_162755 ?auto_162759 ) ) ( not ( = ?auto_162757 ?auto_162758 ) ) ( not ( = ?auto_162757 ?auto_162759 ) ) ( not ( = ?auto_162756 ?auto_162758 ) ) ( not ( = ?auto_162756 ?auto_162759 ) ) ( ON ?auto_162760 ?auto_162756 ) ( ON ?auto_162758 ?auto_162760 ) ( ON ?auto_162759 ?auto_162758 ) ( CLEAR ?auto_162759 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_162752 ?auto_162753 ?auto_162754 ?auto_162755 ?auto_162757 ?auto_162756 ?auto_162760 ?auto_162758 )
      ( MAKE-4PILE ?auto_162752 ?auto_162753 ?auto_162754 ?auto_162755 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_162766 - BLOCK
      ?auto_162767 - BLOCK
      ?auto_162768 - BLOCK
      ?auto_162769 - BLOCK
      ?auto_162770 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_162770 ) ( CLEAR ?auto_162769 ) ( ON-TABLE ?auto_162766 ) ( ON ?auto_162767 ?auto_162766 ) ( ON ?auto_162768 ?auto_162767 ) ( ON ?auto_162769 ?auto_162768 ) ( not ( = ?auto_162766 ?auto_162767 ) ) ( not ( = ?auto_162766 ?auto_162768 ) ) ( not ( = ?auto_162766 ?auto_162769 ) ) ( not ( = ?auto_162766 ?auto_162770 ) ) ( not ( = ?auto_162767 ?auto_162768 ) ) ( not ( = ?auto_162767 ?auto_162769 ) ) ( not ( = ?auto_162767 ?auto_162770 ) ) ( not ( = ?auto_162768 ?auto_162769 ) ) ( not ( = ?auto_162768 ?auto_162770 ) ) ( not ( = ?auto_162769 ?auto_162770 ) ) )
    :subtasks
    ( ( !STACK ?auto_162770 ?auto_162769 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_162771 - BLOCK
      ?auto_162772 - BLOCK
      ?auto_162773 - BLOCK
      ?auto_162774 - BLOCK
      ?auto_162775 - BLOCK
    )
    :vars
    (
      ?auto_162776 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_162774 ) ( ON-TABLE ?auto_162771 ) ( ON ?auto_162772 ?auto_162771 ) ( ON ?auto_162773 ?auto_162772 ) ( ON ?auto_162774 ?auto_162773 ) ( not ( = ?auto_162771 ?auto_162772 ) ) ( not ( = ?auto_162771 ?auto_162773 ) ) ( not ( = ?auto_162771 ?auto_162774 ) ) ( not ( = ?auto_162771 ?auto_162775 ) ) ( not ( = ?auto_162772 ?auto_162773 ) ) ( not ( = ?auto_162772 ?auto_162774 ) ) ( not ( = ?auto_162772 ?auto_162775 ) ) ( not ( = ?auto_162773 ?auto_162774 ) ) ( not ( = ?auto_162773 ?auto_162775 ) ) ( not ( = ?auto_162774 ?auto_162775 ) ) ( ON ?auto_162775 ?auto_162776 ) ( CLEAR ?auto_162775 ) ( HAND-EMPTY ) ( not ( = ?auto_162771 ?auto_162776 ) ) ( not ( = ?auto_162772 ?auto_162776 ) ) ( not ( = ?auto_162773 ?auto_162776 ) ) ( not ( = ?auto_162774 ?auto_162776 ) ) ( not ( = ?auto_162775 ?auto_162776 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_162775 ?auto_162776 )
      ( MAKE-5PILE ?auto_162771 ?auto_162772 ?auto_162773 ?auto_162774 ?auto_162775 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_162777 - BLOCK
      ?auto_162778 - BLOCK
      ?auto_162779 - BLOCK
      ?auto_162780 - BLOCK
      ?auto_162781 - BLOCK
    )
    :vars
    (
      ?auto_162782 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_162777 ) ( ON ?auto_162778 ?auto_162777 ) ( ON ?auto_162779 ?auto_162778 ) ( not ( = ?auto_162777 ?auto_162778 ) ) ( not ( = ?auto_162777 ?auto_162779 ) ) ( not ( = ?auto_162777 ?auto_162780 ) ) ( not ( = ?auto_162777 ?auto_162781 ) ) ( not ( = ?auto_162778 ?auto_162779 ) ) ( not ( = ?auto_162778 ?auto_162780 ) ) ( not ( = ?auto_162778 ?auto_162781 ) ) ( not ( = ?auto_162779 ?auto_162780 ) ) ( not ( = ?auto_162779 ?auto_162781 ) ) ( not ( = ?auto_162780 ?auto_162781 ) ) ( ON ?auto_162781 ?auto_162782 ) ( CLEAR ?auto_162781 ) ( not ( = ?auto_162777 ?auto_162782 ) ) ( not ( = ?auto_162778 ?auto_162782 ) ) ( not ( = ?auto_162779 ?auto_162782 ) ) ( not ( = ?auto_162780 ?auto_162782 ) ) ( not ( = ?auto_162781 ?auto_162782 ) ) ( HOLDING ?auto_162780 ) ( CLEAR ?auto_162779 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_162777 ?auto_162778 ?auto_162779 ?auto_162780 )
      ( MAKE-5PILE ?auto_162777 ?auto_162778 ?auto_162779 ?auto_162780 ?auto_162781 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_162783 - BLOCK
      ?auto_162784 - BLOCK
      ?auto_162785 - BLOCK
      ?auto_162786 - BLOCK
      ?auto_162787 - BLOCK
    )
    :vars
    (
      ?auto_162788 - BLOCK
      ?auto_162791 - BLOCK
      ?auto_162790 - BLOCK
      ?auto_162789 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_162783 ) ( ON ?auto_162784 ?auto_162783 ) ( ON ?auto_162785 ?auto_162784 ) ( not ( = ?auto_162783 ?auto_162784 ) ) ( not ( = ?auto_162783 ?auto_162785 ) ) ( not ( = ?auto_162783 ?auto_162786 ) ) ( not ( = ?auto_162783 ?auto_162787 ) ) ( not ( = ?auto_162784 ?auto_162785 ) ) ( not ( = ?auto_162784 ?auto_162786 ) ) ( not ( = ?auto_162784 ?auto_162787 ) ) ( not ( = ?auto_162785 ?auto_162786 ) ) ( not ( = ?auto_162785 ?auto_162787 ) ) ( not ( = ?auto_162786 ?auto_162787 ) ) ( ON ?auto_162787 ?auto_162788 ) ( not ( = ?auto_162783 ?auto_162788 ) ) ( not ( = ?auto_162784 ?auto_162788 ) ) ( not ( = ?auto_162785 ?auto_162788 ) ) ( not ( = ?auto_162786 ?auto_162788 ) ) ( not ( = ?auto_162787 ?auto_162788 ) ) ( CLEAR ?auto_162785 ) ( ON ?auto_162786 ?auto_162787 ) ( CLEAR ?auto_162786 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_162791 ) ( ON ?auto_162790 ?auto_162791 ) ( ON ?auto_162789 ?auto_162790 ) ( ON ?auto_162788 ?auto_162789 ) ( not ( = ?auto_162791 ?auto_162790 ) ) ( not ( = ?auto_162791 ?auto_162789 ) ) ( not ( = ?auto_162791 ?auto_162788 ) ) ( not ( = ?auto_162791 ?auto_162787 ) ) ( not ( = ?auto_162791 ?auto_162786 ) ) ( not ( = ?auto_162790 ?auto_162789 ) ) ( not ( = ?auto_162790 ?auto_162788 ) ) ( not ( = ?auto_162790 ?auto_162787 ) ) ( not ( = ?auto_162790 ?auto_162786 ) ) ( not ( = ?auto_162789 ?auto_162788 ) ) ( not ( = ?auto_162789 ?auto_162787 ) ) ( not ( = ?auto_162789 ?auto_162786 ) ) ( not ( = ?auto_162783 ?auto_162791 ) ) ( not ( = ?auto_162783 ?auto_162790 ) ) ( not ( = ?auto_162783 ?auto_162789 ) ) ( not ( = ?auto_162784 ?auto_162791 ) ) ( not ( = ?auto_162784 ?auto_162790 ) ) ( not ( = ?auto_162784 ?auto_162789 ) ) ( not ( = ?auto_162785 ?auto_162791 ) ) ( not ( = ?auto_162785 ?auto_162790 ) ) ( not ( = ?auto_162785 ?auto_162789 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_162791 ?auto_162790 ?auto_162789 ?auto_162788 ?auto_162787 )
      ( MAKE-5PILE ?auto_162783 ?auto_162784 ?auto_162785 ?auto_162786 ?auto_162787 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_162792 - BLOCK
      ?auto_162793 - BLOCK
      ?auto_162794 - BLOCK
      ?auto_162795 - BLOCK
      ?auto_162796 - BLOCK
    )
    :vars
    (
      ?auto_162800 - BLOCK
      ?auto_162797 - BLOCK
      ?auto_162798 - BLOCK
      ?auto_162799 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_162792 ) ( ON ?auto_162793 ?auto_162792 ) ( not ( = ?auto_162792 ?auto_162793 ) ) ( not ( = ?auto_162792 ?auto_162794 ) ) ( not ( = ?auto_162792 ?auto_162795 ) ) ( not ( = ?auto_162792 ?auto_162796 ) ) ( not ( = ?auto_162793 ?auto_162794 ) ) ( not ( = ?auto_162793 ?auto_162795 ) ) ( not ( = ?auto_162793 ?auto_162796 ) ) ( not ( = ?auto_162794 ?auto_162795 ) ) ( not ( = ?auto_162794 ?auto_162796 ) ) ( not ( = ?auto_162795 ?auto_162796 ) ) ( ON ?auto_162796 ?auto_162800 ) ( not ( = ?auto_162792 ?auto_162800 ) ) ( not ( = ?auto_162793 ?auto_162800 ) ) ( not ( = ?auto_162794 ?auto_162800 ) ) ( not ( = ?auto_162795 ?auto_162800 ) ) ( not ( = ?auto_162796 ?auto_162800 ) ) ( ON ?auto_162795 ?auto_162796 ) ( CLEAR ?auto_162795 ) ( ON-TABLE ?auto_162797 ) ( ON ?auto_162798 ?auto_162797 ) ( ON ?auto_162799 ?auto_162798 ) ( ON ?auto_162800 ?auto_162799 ) ( not ( = ?auto_162797 ?auto_162798 ) ) ( not ( = ?auto_162797 ?auto_162799 ) ) ( not ( = ?auto_162797 ?auto_162800 ) ) ( not ( = ?auto_162797 ?auto_162796 ) ) ( not ( = ?auto_162797 ?auto_162795 ) ) ( not ( = ?auto_162798 ?auto_162799 ) ) ( not ( = ?auto_162798 ?auto_162800 ) ) ( not ( = ?auto_162798 ?auto_162796 ) ) ( not ( = ?auto_162798 ?auto_162795 ) ) ( not ( = ?auto_162799 ?auto_162800 ) ) ( not ( = ?auto_162799 ?auto_162796 ) ) ( not ( = ?auto_162799 ?auto_162795 ) ) ( not ( = ?auto_162792 ?auto_162797 ) ) ( not ( = ?auto_162792 ?auto_162798 ) ) ( not ( = ?auto_162792 ?auto_162799 ) ) ( not ( = ?auto_162793 ?auto_162797 ) ) ( not ( = ?auto_162793 ?auto_162798 ) ) ( not ( = ?auto_162793 ?auto_162799 ) ) ( not ( = ?auto_162794 ?auto_162797 ) ) ( not ( = ?auto_162794 ?auto_162798 ) ) ( not ( = ?auto_162794 ?auto_162799 ) ) ( HOLDING ?auto_162794 ) ( CLEAR ?auto_162793 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_162792 ?auto_162793 ?auto_162794 )
      ( MAKE-5PILE ?auto_162792 ?auto_162793 ?auto_162794 ?auto_162795 ?auto_162796 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_162801 - BLOCK
      ?auto_162802 - BLOCK
      ?auto_162803 - BLOCK
      ?auto_162804 - BLOCK
      ?auto_162805 - BLOCK
    )
    :vars
    (
      ?auto_162806 - BLOCK
      ?auto_162808 - BLOCK
      ?auto_162807 - BLOCK
      ?auto_162809 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_162801 ) ( ON ?auto_162802 ?auto_162801 ) ( not ( = ?auto_162801 ?auto_162802 ) ) ( not ( = ?auto_162801 ?auto_162803 ) ) ( not ( = ?auto_162801 ?auto_162804 ) ) ( not ( = ?auto_162801 ?auto_162805 ) ) ( not ( = ?auto_162802 ?auto_162803 ) ) ( not ( = ?auto_162802 ?auto_162804 ) ) ( not ( = ?auto_162802 ?auto_162805 ) ) ( not ( = ?auto_162803 ?auto_162804 ) ) ( not ( = ?auto_162803 ?auto_162805 ) ) ( not ( = ?auto_162804 ?auto_162805 ) ) ( ON ?auto_162805 ?auto_162806 ) ( not ( = ?auto_162801 ?auto_162806 ) ) ( not ( = ?auto_162802 ?auto_162806 ) ) ( not ( = ?auto_162803 ?auto_162806 ) ) ( not ( = ?auto_162804 ?auto_162806 ) ) ( not ( = ?auto_162805 ?auto_162806 ) ) ( ON ?auto_162804 ?auto_162805 ) ( ON-TABLE ?auto_162808 ) ( ON ?auto_162807 ?auto_162808 ) ( ON ?auto_162809 ?auto_162807 ) ( ON ?auto_162806 ?auto_162809 ) ( not ( = ?auto_162808 ?auto_162807 ) ) ( not ( = ?auto_162808 ?auto_162809 ) ) ( not ( = ?auto_162808 ?auto_162806 ) ) ( not ( = ?auto_162808 ?auto_162805 ) ) ( not ( = ?auto_162808 ?auto_162804 ) ) ( not ( = ?auto_162807 ?auto_162809 ) ) ( not ( = ?auto_162807 ?auto_162806 ) ) ( not ( = ?auto_162807 ?auto_162805 ) ) ( not ( = ?auto_162807 ?auto_162804 ) ) ( not ( = ?auto_162809 ?auto_162806 ) ) ( not ( = ?auto_162809 ?auto_162805 ) ) ( not ( = ?auto_162809 ?auto_162804 ) ) ( not ( = ?auto_162801 ?auto_162808 ) ) ( not ( = ?auto_162801 ?auto_162807 ) ) ( not ( = ?auto_162801 ?auto_162809 ) ) ( not ( = ?auto_162802 ?auto_162808 ) ) ( not ( = ?auto_162802 ?auto_162807 ) ) ( not ( = ?auto_162802 ?auto_162809 ) ) ( not ( = ?auto_162803 ?auto_162808 ) ) ( not ( = ?auto_162803 ?auto_162807 ) ) ( not ( = ?auto_162803 ?auto_162809 ) ) ( CLEAR ?auto_162802 ) ( ON ?auto_162803 ?auto_162804 ) ( CLEAR ?auto_162803 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_162808 ?auto_162807 ?auto_162809 ?auto_162806 ?auto_162805 ?auto_162804 )
      ( MAKE-5PILE ?auto_162801 ?auto_162802 ?auto_162803 ?auto_162804 ?auto_162805 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_162810 - BLOCK
      ?auto_162811 - BLOCK
      ?auto_162812 - BLOCK
      ?auto_162813 - BLOCK
      ?auto_162814 - BLOCK
    )
    :vars
    (
      ?auto_162816 - BLOCK
      ?auto_162815 - BLOCK
      ?auto_162818 - BLOCK
      ?auto_162817 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_162810 ) ( not ( = ?auto_162810 ?auto_162811 ) ) ( not ( = ?auto_162810 ?auto_162812 ) ) ( not ( = ?auto_162810 ?auto_162813 ) ) ( not ( = ?auto_162810 ?auto_162814 ) ) ( not ( = ?auto_162811 ?auto_162812 ) ) ( not ( = ?auto_162811 ?auto_162813 ) ) ( not ( = ?auto_162811 ?auto_162814 ) ) ( not ( = ?auto_162812 ?auto_162813 ) ) ( not ( = ?auto_162812 ?auto_162814 ) ) ( not ( = ?auto_162813 ?auto_162814 ) ) ( ON ?auto_162814 ?auto_162816 ) ( not ( = ?auto_162810 ?auto_162816 ) ) ( not ( = ?auto_162811 ?auto_162816 ) ) ( not ( = ?auto_162812 ?auto_162816 ) ) ( not ( = ?auto_162813 ?auto_162816 ) ) ( not ( = ?auto_162814 ?auto_162816 ) ) ( ON ?auto_162813 ?auto_162814 ) ( ON-TABLE ?auto_162815 ) ( ON ?auto_162818 ?auto_162815 ) ( ON ?auto_162817 ?auto_162818 ) ( ON ?auto_162816 ?auto_162817 ) ( not ( = ?auto_162815 ?auto_162818 ) ) ( not ( = ?auto_162815 ?auto_162817 ) ) ( not ( = ?auto_162815 ?auto_162816 ) ) ( not ( = ?auto_162815 ?auto_162814 ) ) ( not ( = ?auto_162815 ?auto_162813 ) ) ( not ( = ?auto_162818 ?auto_162817 ) ) ( not ( = ?auto_162818 ?auto_162816 ) ) ( not ( = ?auto_162818 ?auto_162814 ) ) ( not ( = ?auto_162818 ?auto_162813 ) ) ( not ( = ?auto_162817 ?auto_162816 ) ) ( not ( = ?auto_162817 ?auto_162814 ) ) ( not ( = ?auto_162817 ?auto_162813 ) ) ( not ( = ?auto_162810 ?auto_162815 ) ) ( not ( = ?auto_162810 ?auto_162818 ) ) ( not ( = ?auto_162810 ?auto_162817 ) ) ( not ( = ?auto_162811 ?auto_162815 ) ) ( not ( = ?auto_162811 ?auto_162818 ) ) ( not ( = ?auto_162811 ?auto_162817 ) ) ( not ( = ?auto_162812 ?auto_162815 ) ) ( not ( = ?auto_162812 ?auto_162818 ) ) ( not ( = ?auto_162812 ?auto_162817 ) ) ( ON ?auto_162812 ?auto_162813 ) ( CLEAR ?auto_162812 ) ( HOLDING ?auto_162811 ) ( CLEAR ?auto_162810 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_162810 ?auto_162811 )
      ( MAKE-5PILE ?auto_162810 ?auto_162811 ?auto_162812 ?auto_162813 ?auto_162814 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_162819 - BLOCK
      ?auto_162820 - BLOCK
      ?auto_162821 - BLOCK
      ?auto_162822 - BLOCK
      ?auto_162823 - BLOCK
    )
    :vars
    (
      ?auto_162826 - BLOCK
      ?auto_162825 - BLOCK
      ?auto_162827 - BLOCK
      ?auto_162824 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_162819 ) ( not ( = ?auto_162819 ?auto_162820 ) ) ( not ( = ?auto_162819 ?auto_162821 ) ) ( not ( = ?auto_162819 ?auto_162822 ) ) ( not ( = ?auto_162819 ?auto_162823 ) ) ( not ( = ?auto_162820 ?auto_162821 ) ) ( not ( = ?auto_162820 ?auto_162822 ) ) ( not ( = ?auto_162820 ?auto_162823 ) ) ( not ( = ?auto_162821 ?auto_162822 ) ) ( not ( = ?auto_162821 ?auto_162823 ) ) ( not ( = ?auto_162822 ?auto_162823 ) ) ( ON ?auto_162823 ?auto_162826 ) ( not ( = ?auto_162819 ?auto_162826 ) ) ( not ( = ?auto_162820 ?auto_162826 ) ) ( not ( = ?auto_162821 ?auto_162826 ) ) ( not ( = ?auto_162822 ?auto_162826 ) ) ( not ( = ?auto_162823 ?auto_162826 ) ) ( ON ?auto_162822 ?auto_162823 ) ( ON-TABLE ?auto_162825 ) ( ON ?auto_162827 ?auto_162825 ) ( ON ?auto_162824 ?auto_162827 ) ( ON ?auto_162826 ?auto_162824 ) ( not ( = ?auto_162825 ?auto_162827 ) ) ( not ( = ?auto_162825 ?auto_162824 ) ) ( not ( = ?auto_162825 ?auto_162826 ) ) ( not ( = ?auto_162825 ?auto_162823 ) ) ( not ( = ?auto_162825 ?auto_162822 ) ) ( not ( = ?auto_162827 ?auto_162824 ) ) ( not ( = ?auto_162827 ?auto_162826 ) ) ( not ( = ?auto_162827 ?auto_162823 ) ) ( not ( = ?auto_162827 ?auto_162822 ) ) ( not ( = ?auto_162824 ?auto_162826 ) ) ( not ( = ?auto_162824 ?auto_162823 ) ) ( not ( = ?auto_162824 ?auto_162822 ) ) ( not ( = ?auto_162819 ?auto_162825 ) ) ( not ( = ?auto_162819 ?auto_162827 ) ) ( not ( = ?auto_162819 ?auto_162824 ) ) ( not ( = ?auto_162820 ?auto_162825 ) ) ( not ( = ?auto_162820 ?auto_162827 ) ) ( not ( = ?auto_162820 ?auto_162824 ) ) ( not ( = ?auto_162821 ?auto_162825 ) ) ( not ( = ?auto_162821 ?auto_162827 ) ) ( not ( = ?auto_162821 ?auto_162824 ) ) ( ON ?auto_162821 ?auto_162822 ) ( CLEAR ?auto_162819 ) ( ON ?auto_162820 ?auto_162821 ) ( CLEAR ?auto_162820 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_162825 ?auto_162827 ?auto_162824 ?auto_162826 ?auto_162823 ?auto_162822 ?auto_162821 )
      ( MAKE-5PILE ?auto_162819 ?auto_162820 ?auto_162821 ?auto_162822 ?auto_162823 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_162828 - BLOCK
      ?auto_162829 - BLOCK
      ?auto_162830 - BLOCK
      ?auto_162831 - BLOCK
      ?auto_162832 - BLOCK
    )
    :vars
    (
      ?auto_162834 - BLOCK
      ?auto_162835 - BLOCK
      ?auto_162833 - BLOCK
      ?auto_162836 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_162828 ?auto_162829 ) ) ( not ( = ?auto_162828 ?auto_162830 ) ) ( not ( = ?auto_162828 ?auto_162831 ) ) ( not ( = ?auto_162828 ?auto_162832 ) ) ( not ( = ?auto_162829 ?auto_162830 ) ) ( not ( = ?auto_162829 ?auto_162831 ) ) ( not ( = ?auto_162829 ?auto_162832 ) ) ( not ( = ?auto_162830 ?auto_162831 ) ) ( not ( = ?auto_162830 ?auto_162832 ) ) ( not ( = ?auto_162831 ?auto_162832 ) ) ( ON ?auto_162832 ?auto_162834 ) ( not ( = ?auto_162828 ?auto_162834 ) ) ( not ( = ?auto_162829 ?auto_162834 ) ) ( not ( = ?auto_162830 ?auto_162834 ) ) ( not ( = ?auto_162831 ?auto_162834 ) ) ( not ( = ?auto_162832 ?auto_162834 ) ) ( ON ?auto_162831 ?auto_162832 ) ( ON-TABLE ?auto_162835 ) ( ON ?auto_162833 ?auto_162835 ) ( ON ?auto_162836 ?auto_162833 ) ( ON ?auto_162834 ?auto_162836 ) ( not ( = ?auto_162835 ?auto_162833 ) ) ( not ( = ?auto_162835 ?auto_162836 ) ) ( not ( = ?auto_162835 ?auto_162834 ) ) ( not ( = ?auto_162835 ?auto_162832 ) ) ( not ( = ?auto_162835 ?auto_162831 ) ) ( not ( = ?auto_162833 ?auto_162836 ) ) ( not ( = ?auto_162833 ?auto_162834 ) ) ( not ( = ?auto_162833 ?auto_162832 ) ) ( not ( = ?auto_162833 ?auto_162831 ) ) ( not ( = ?auto_162836 ?auto_162834 ) ) ( not ( = ?auto_162836 ?auto_162832 ) ) ( not ( = ?auto_162836 ?auto_162831 ) ) ( not ( = ?auto_162828 ?auto_162835 ) ) ( not ( = ?auto_162828 ?auto_162833 ) ) ( not ( = ?auto_162828 ?auto_162836 ) ) ( not ( = ?auto_162829 ?auto_162835 ) ) ( not ( = ?auto_162829 ?auto_162833 ) ) ( not ( = ?auto_162829 ?auto_162836 ) ) ( not ( = ?auto_162830 ?auto_162835 ) ) ( not ( = ?auto_162830 ?auto_162833 ) ) ( not ( = ?auto_162830 ?auto_162836 ) ) ( ON ?auto_162830 ?auto_162831 ) ( ON ?auto_162829 ?auto_162830 ) ( CLEAR ?auto_162829 ) ( HOLDING ?auto_162828 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_162828 )
      ( MAKE-5PILE ?auto_162828 ?auto_162829 ?auto_162830 ?auto_162831 ?auto_162832 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_162837 - BLOCK
      ?auto_162838 - BLOCK
      ?auto_162839 - BLOCK
      ?auto_162840 - BLOCK
      ?auto_162841 - BLOCK
    )
    :vars
    (
      ?auto_162844 - BLOCK
      ?auto_162842 - BLOCK
      ?auto_162845 - BLOCK
      ?auto_162843 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_162837 ?auto_162838 ) ) ( not ( = ?auto_162837 ?auto_162839 ) ) ( not ( = ?auto_162837 ?auto_162840 ) ) ( not ( = ?auto_162837 ?auto_162841 ) ) ( not ( = ?auto_162838 ?auto_162839 ) ) ( not ( = ?auto_162838 ?auto_162840 ) ) ( not ( = ?auto_162838 ?auto_162841 ) ) ( not ( = ?auto_162839 ?auto_162840 ) ) ( not ( = ?auto_162839 ?auto_162841 ) ) ( not ( = ?auto_162840 ?auto_162841 ) ) ( ON ?auto_162841 ?auto_162844 ) ( not ( = ?auto_162837 ?auto_162844 ) ) ( not ( = ?auto_162838 ?auto_162844 ) ) ( not ( = ?auto_162839 ?auto_162844 ) ) ( not ( = ?auto_162840 ?auto_162844 ) ) ( not ( = ?auto_162841 ?auto_162844 ) ) ( ON ?auto_162840 ?auto_162841 ) ( ON-TABLE ?auto_162842 ) ( ON ?auto_162845 ?auto_162842 ) ( ON ?auto_162843 ?auto_162845 ) ( ON ?auto_162844 ?auto_162843 ) ( not ( = ?auto_162842 ?auto_162845 ) ) ( not ( = ?auto_162842 ?auto_162843 ) ) ( not ( = ?auto_162842 ?auto_162844 ) ) ( not ( = ?auto_162842 ?auto_162841 ) ) ( not ( = ?auto_162842 ?auto_162840 ) ) ( not ( = ?auto_162845 ?auto_162843 ) ) ( not ( = ?auto_162845 ?auto_162844 ) ) ( not ( = ?auto_162845 ?auto_162841 ) ) ( not ( = ?auto_162845 ?auto_162840 ) ) ( not ( = ?auto_162843 ?auto_162844 ) ) ( not ( = ?auto_162843 ?auto_162841 ) ) ( not ( = ?auto_162843 ?auto_162840 ) ) ( not ( = ?auto_162837 ?auto_162842 ) ) ( not ( = ?auto_162837 ?auto_162845 ) ) ( not ( = ?auto_162837 ?auto_162843 ) ) ( not ( = ?auto_162838 ?auto_162842 ) ) ( not ( = ?auto_162838 ?auto_162845 ) ) ( not ( = ?auto_162838 ?auto_162843 ) ) ( not ( = ?auto_162839 ?auto_162842 ) ) ( not ( = ?auto_162839 ?auto_162845 ) ) ( not ( = ?auto_162839 ?auto_162843 ) ) ( ON ?auto_162839 ?auto_162840 ) ( ON ?auto_162838 ?auto_162839 ) ( ON ?auto_162837 ?auto_162838 ) ( CLEAR ?auto_162837 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_162842 ?auto_162845 ?auto_162843 ?auto_162844 ?auto_162841 ?auto_162840 ?auto_162839 ?auto_162838 )
      ( MAKE-5PILE ?auto_162837 ?auto_162838 ?auto_162839 ?auto_162840 ?auto_162841 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_162849 - BLOCK
      ?auto_162850 - BLOCK
      ?auto_162851 - BLOCK
    )
    :vars
    (
      ?auto_162852 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_162852 ?auto_162851 ) ( CLEAR ?auto_162852 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_162849 ) ( ON ?auto_162850 ?auto_162849 ) ( ON ?auto_162851 ?auto_162850 ) ( not ( = ?auto_162849 ?auto_162850 ) ) ( not ( = ?auto_162849 ?auto_162851 ) ) ( not ( = ?auto_162849 ?auto_162852 ) ) ( not ( = ?auto_162850 ?auto_162851 ) ) ( not ( = ?auto_162850 ?auto_162852 ) ) ( not ( = ?auto_162851 ?auto_162852 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_162852 ?auto_162851 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_162853 - BLOCK
      ?auto_162854 - BLOCK
      ?auto_162855 - BLOCK
    )
    :vars
    (
      ?auto_162856 - BLOCK
      ?auto_162857 - BLOCK
      ?auto_162858 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_162856 ?auto_162855 ) ( CLEAR ?auto_162856 ) ( ON-TABLE ?auto_162853 ) ( ON ?auto_162854 ?auto_162853 ) ( ON ?auto_162855 ?auto_162854 ) ( not ( = ?auto_162853 ?auto_162854 ) ) ( not ( = ?auto_162853 ?auto_162855 ) ) ( not ( = ?auto_162853 ?auto_162856 ) ) ( not ( = ?auto_162854 ?auto_162855 ) ) ( not ( = ?auto_162854 ?auto_162856 ) ) ( not ( = ?auto_162855 ?auto_162856 ) ) ( HOLDING ?auto_162857 ) ( CLEAR ?auto_162858 ) ( not ( = ?auto_162853 ?auto_162857 ) ) ( not ( = ?auto_162853 ?auto_162858 ) ) ( not ( = ?auto_162854 ?auto_162857 ) ) ( not ( = ?auto_162854 ?auto_162858 ) ) ( not ( = ?auto_162855 ?auto_162857 ) ) ( not ( = ?auto_162855 ?auto_162858 ) ) ( not ( = ?auto_162856 ?auto_162857 ) ) ( not ( = ?auto_162856 ?auto_162858 ) ) ( not ( = ?auto_162857 ?auto_162858 ) ) )
    :subtasks
    ( ( !STACK ?auto_162857 ?auto_162858 )
      ( MAKE-3PILE ?auto_162853 ?auto_162854 ?auto_162855 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_162859 - BLOCK
      ?auto_162860 - BLOCK
      ?auto_162861 - BLOCK
    )
    :vars
    (
      ?auto_162862 - BLOCK
      ?auto_162864 - BLOCK
      ?auto_162863 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_162862 ?auto_162861 ) ( ON-TABLE ?auto_162859 ) ( ON ?auto_162860 ?auto_162859 ) ( ON ?auto_162861 ?auto_162860 ) ( not ( = ?auto_162859 ?auto_162860 ) ) ( not ( = ?auto_162859 ?auto_162861 ) ) ( not ( = ?auto_162859 ?auto_162862 ) ) ( not ( = ?auto_162860 ?auto_162861 ) ) ( not ( = ?auto_162860 ?auto_162862 ) ) ( not ( = ?auto_162861 ?auto_162862 ) ) ( CLEAR ?auto_162864 ) ( not ( = ?auto_162859 ?auto_162863 ) ) ( not ( = ?auto_162859 ?auto_162864 ) ) ( not ( = ?auto_162860 ?auto_162863 ) ) ( not ( = ?auto_162860 ?auto_162864 ) ) ( not ( = ?auto_162861 ?auto_162863 ) ) ( not ( = ?auto_162861 ?auto_162864 ) ) ( not ( = ?auto_162862 ?auto_162863 ) ) ( not ( = ?auto_162862 ?auto_162864 ) ) ( not ( = ?auto_162863 ?auto_162864 ) ) ( ON ?auto_162863 ?auto_162862 ) ( CLEAR ?auto_162863 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_162859 ?auto_162860 ?auto_162861 ?auto_162862 )
      ( MAKE-3PILE ?auto_162859 ?auto_162860 ?auto_162861 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_162865 - BLOCK
      ?auto_162866 - BLOCK
      ?auto_162867 - BLOCK
    )
    :vars
    (
      ?auto_162869 - BLOCK
      ?auto_162868 - BLOCK
      ?auto_162870 - BLOCK
      ?auto_162872 - BLOCK
      ?auto_162873 - BLOCK
      ?auto_162871 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_162869 ?auto_162867 ) ( ON-TABLE ?auto_162865 ) ( ON ?auto_162866 ?auto_162865 ) ( ON ?auto_162867 ?auto_162866 ) ( not ( = ?auto_162865 ?auto_162866 ) ) ( not ( = ?auto_162865 ?auto_162867 ) ) ( not ( = ?auto_162865 ?auto_162869 ) ) ( not ( = ?auto_162866 ?auto_162867 ) ) ( not ( = ?auto_162866 ?auto_162869 ) ) ( not ( = ?auto_162867 ?auto_162869 ) ) ( not ( = ?auto_162865 ?auto_162868 ) ) ( not ( = ?auto_162865 ?auto_162870 ) ) ( not ( = ?auto_162866 ?auto_162868 ) ) ( not ( = ?auto_162866 ?auto_162870 ) ) ( not ( = ?auto_162867 ?auto_162868 ) ) ( not ( = ?auto_162867 ?auto_162870 ) ) ( not ( = ?auto_162869 ?auto_162868 ) ) ( not ( = ?auto_162869 ?auto_162870 ) ) ( not ( = ?auto_162868 ?auto_162870 ) ) ( ON ?auto_162868 ?auto_162869 ) ( CLEAR ?auto_162868 ) ( HOLDING ?auto_162870 ) ( CLEAR ?auto_162872 ) ( ON-TABLE ?auto_162873 ) ( ON ?auto_162871 ?auto_162873 ) ( ON ?auto_162872 ?auto_162871 ) ( not ( = ?auto_162873 ?auto_162871 ) ) ( not ( = ?auto_162873 ?auto_162872 ) ) ( not ( = ?auto_162873 ?auto_162870 ) ) ( not ( = ?auto_162871 ?auto_162872 ) ) ( not ( = ?auto_162871 ?auto_162870 ) ) ( not ( = ?auto_162872 ?auto_162870 ) ) ( not ( = ?auto_162865 ?auto_162872 ) ) ( not ( = ?auto_162865 ?auto_162873 ) ) ( not ( = ?auto_162865 ?auto_162871 ) ) ( not ( = ?auto_162866 ?auto_162872 ) ) ( not ( = ?auto_162866 ?auto_162873 ) ) ( not ( = ?auto_162866 ?auto_162871 ) ) ( not ( = ?auto_162867 ?auto_162872 ) ) ( not ( = ?auto_162867 ?auto_162873 ) ) ( not ( = ?auto_162867 ?auto_162871 ) ) ( not ( = ?auto_162869 ?auto_162872 ) ) ( not ( = ?auto_162869 ?auto_162873 ) ) ( not ( = ?auto_162869 ?auto_162871 ) ) ( not ( = ?auto_162868 ?auto_162872 ) ) ( not ( = ?auto_162868 ?auto_162873 ) ) ( not ( = ?auto_162868 ?auto_162871 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_162873 ?auto_162871 ?auto_162872 ?auto_162870 )
      ( MAKE-3PILE ?auto_162865 ?auto_162866 ?auto_162867 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_162874 - BLOCK
      ?auto_162875 - BLOCK
      ?auto_162876 - BLOCK
    )
    :vars
    (
      ?auto_162882 - BLOCK
      ?auto_162881 - BLOCK
      ?auto_162879 - BLOCK
      ?auto_162877 - BLOCK
      ?auto_162878 - BLOCK
      ?auto_162880 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_162882 ?auto_162876 ) ( ON-TABLE ?auto_162874 ) ( ON ?auto_162875 ?auto_162874 ) ( ON ?auto_162876 ?auto_162875 ) ( not ( = ?auto_162874 ?auto_162875 ) ) ( not ( = ?auto_162874 ?auto_162876 ) ) ( not ( = ?auto_162874 ?auto_162882 ) ) ( not ( = ?auto_162875 ?auto_162876 ) ) ( not ( = ?auto_162875 ?auto_162882 ) ) ( not ( = ?auto_162876 ?auto_162882 ) ) ( not ( = ?auto_162874 ?auto_162881 ) ) ( not ( = ?auto_162874 ?auto_162879 ) ) ( not ( = ?auto_162875 ?auto_162881 ) ) ( not ( = ?auto_162875 ?auto_162879 ) ) ( not ( = ?auto_162876 ?auto_162881 ) ) ( not ( = ?auto_162876 ?auto_162879 ) ) ( not ( = ?auto_162882 ?auto_162881 ) ) ( not ( = ?auto_162882 ?auto_162879 ) ) ( not ( = ?auto_162881 ?auto_162879 ) ) ( ON ?auto_162881 ?auto_162882 ) ( CLEAR ?auto_162877 ) ( ON-TABLE ?auto_162878 ) ( ON ?auto_162880 ?auto_162878 ) ( ON ?auto_162877 ?auto_162880 ) ( not ( = ?auto_162878 ?auto_162880 ) ) ( not ( = ?auto_162878 ?auto_162877 ) ) ( not ( = ?auto_162878 ?auto_162879 ) ) ( not ( = ?auto_162880 ?auto_162877 ) ) ( not ( = ?auto_162880 ?auto_162879 ) ) ( not ( = ?auto_162877 ?auto_162879 ) ) ( not ( = ?auto_162874 ?auto_162877 ) ) ( not ( = ?auto_162874 ?auto_162878 ) ) ( not ( = ?auto_162874 ?auto_162880 ) ) ( not ( = ?auto_162875 ?auto_162877 ) ) ( not ( = ?auto_162875 ?auto_162878 ) ) ( not ( = ?auto_162875 ?auto_162880 ) ) ( not ( = ?auto_162876 ?auto_162877 ) ) ( not ( = ?auto_162876 ?auto_162878 ) ) ( not ( = ?auto_162876 ?auto_162880 ) ) ( not ( = ?auto_162882 ?auto_162877 ) ) ( not ( = ?auto_162882 ?auto_162878 ) ) ( not ( = ?auto_162882 ?auto_162880 ) ) ( not ( = ?auto_162881 ?auto_162877 ) ) ( not ( = ?auto_162881 ?auto_162878 ) ) ( not ( = ?auto_162881 ?auto_162880 ) ) ( ON ?auto_162879 ?auto_162881 ) ( CLEAR ?auto_162879 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_162874 ?auto_162875 ?auto_162876 ?auto_162882 ?auto_162881 )
      ( MAKE-3PILE ?auto_162874 ?auto_162875 ?auto_162876 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_162883 - BLOCK
      ?auto_162884 - BLOCK
      ?auto_162885 - BLOCK
    )
    :vars
    (
      ?auto_162887 - BLOCK
      ?auto_162891 - BLOCK
      ?auto_162888 - BLOCK
      ?auto_162890 - BLOCK
      ?auto_162886 - BLOCK
      ?auto_162889 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_162887 ?auto_162885 ) ( ON-TABLE ?auto_162883 ) ( ON ?auto_162884 ?auto_162883 ) ( ON ?auto_162885 ?auto_162884 ) ( not ( = ?auto_162883 ?auto_162884 ) ) ( not ( = ?auto_162883 ?auto_162885 ) ) ( not ( = ?auto_162883 ?auto_162887 ) ) ( not ( = ?auto_162884 ?auto_162885 ) ) ( not ( = ?auto_162884 ?auto_162887 ) ) ( not ( = ?auto_162885 ?auto_162887 ) ) ( not ( = ?auto_162883 ?auto_162891 ) ) ( not ( = ?auto_162883 ?auto_162888 ) ) ( not ( = ?auto_162884 ?auto_162891 ) ) ( not ( = ?auto_162884 ?auto_162888 ) ) ( not ( = ?auto_162885 ?auto_162891 ) ) ( not ( = ?auto_162885 ?auto_162888 ) ) ( not ( = ?auto_162887 ?auto_162891 ) ) ( not ( = ?auto_162887 ?auto_162888 ) ) ( not ( = ?auto_162891 ?auto_162888 ) ) ( ON ?auto_162891 ?auto_162887 ) ( ON-TABLE ?auto_162890 ) ( ON ?auto_162886 ?auto_162890 ) ( not ( = ?auto_162890 ?auto_162886 ) ) ( not ( = ?auto_162890 ?auto_162889 ) ) ( not ( = ?auto_162890 ?auto_162888 ) ) ( not ( = ?auto_162886 ?auto_162889 ) ) ( not ( = ?auto_162886 ?auto_162888 ) ) ( not ( = ?auto_162889 ?auto_162888 ) ) ( not ( = ?auto_162883 ?auto_162889 ) ) ( not ( = ?auto_162883 ?auto_162890 ) ) ( not ( = ?auto_162883 ?auto_162886 ) ) ( not ( = ?auto_162884 ?auto_162889 ) ) ( not ( = ?auto_162884 ?auto_162890 ) ) ( not ( = ?auto_162884 ?auto_162886 ) ) ( not ( = ?auto_162885 ?auto_162889 ) ) ( not ( = ?auto_162885 ?auto_162890 ) ) ( not ( = ?auto_162885 ?auto_162886 ) ) ( not ( = ?auto_162887 ?auto_162889 ) ) ( not ( = ?auto_162887 ?auto_162890 ) ) ( not ( = ?auto_162887 ?auto_162886 ) ) ( not ( = ?auto_162891 ?auto_162889 ) ) ( not ( = ?auto_162891 ?auto_162890 ) ) ( not ( = ?auto_162891 ?auto_162886 ) ) ( ON ?auto_162888 ?auto_162891 ) ( CLEAR ?auto_162888 ) ( HOLDING ?auto_162889 ) ( CLEAR ?auto_162886 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_162890 ?auto_162886 ?auto_162889 )
      ( MAKE-3PILE ?auto_162883 ?auto_162884 ?auto_162885 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_162892 - BLOCK
      ?auto_162893 - BLOCK
      ?auto_162894 - BLOCK
    )
    :vars
    (
      ?auto_162896 - BLOCK
      ?auto_162900 - BLOCK
      ?auto_162898 - BLOCK
      ?auto_162899 - BLOCK
      ?auto_162895 - BLOCK
      ?auto_162897 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_162896 ?auto_162894 ) ( ON-TABLE ?auto_162892 ) ( ON ?auto_162893 ?auto_162892 ) ( ON ?auto_162894 ?auto_162893 ) ( not ( = ?auto_162892 ?auto_162893 ) ) ( not ( = ?auto_162892 ?auto_162894 ) ) ( not ( = ?auto_162892 ?auto_162896 ) ) ( not ( = ?auto_162893 ?auto_162894 ) ) ( not ( = ?auto_162893 ?auto_162896 ) ) ( not ( = ?auto_162894 ?auto_162896 ) ) ( not ( = ?auto_162892 ?auto_162900 ) ) ( not ( = ?auto_162892 ?auto_162898 ) ) ( not ( = ?auto_162893 ?auto_162900 ) ) ( not ( = ?auto_162893 ?auto_162898 ) ) ( not ( = ?auto_162894 ?auto_162900 ) ) ( not ( = ?auto_162894 ?auto_162898 ) ) ( not ( = ?auto_162896 ?auto_162900 ) ) ( not ( = ?auto_162896 ?auto_162898 ) ) ( not ( = ?auto_162900 ?auto_162898 ) ) ( ON ?auto_162900 ?auto_162896 ) ( ON-TABLE ?auto_162899 ) ( ON ?auto_162895 ?auto_162899 ) ( not ( = ?auto_162899 ?auto_162895 ) ) ( not ( = ?auto_162899 ?auto_162897 ) ) ( not ( = ?auto_162899 ?auto_162898 ) ) ( not ( = ?auto_162895 ?auto_162897 ) ) ( not ( = ?auto_162895 ?auto_162898 ) ) ( not ( = ?auto_162897 ?auto_162898 ) ) ( not ( = ?auto_162892 ?auto_162897 ) ) ( not ( = ?auto_162892 ?auto_162899 ) ) ( not ( = ?auto_162892 ?auto_162895 ) ) ( not ( = ?auto_162893 ?auto_162897 ) ) ( not ( = ?auto_162893 ?auto_162899 ) ) ( not ( = ?auto_162893 ?auto_162895 ) ) ( not ( = ?auto_162894 ?auto_162897 ) ) ( not ( = ?auto_162894 ?auto_162899 ) ) ( not ( = ?auto_162894 ?auto_162895 ) ) ( not ( = ?auto_162896 ?auto_162897 ) ) ( not ( = ?auto_162896 ?auto_162899 ) ) ( not ( = ?auto_162896 ?auto_162895 ) ) ( not ( = ?auto_162900 ?auto_162897 ) ) ( not ( = ?auto_162900 ?auto_162899 ) ) ( not ( = ?auto_162900 ?auto_162895 ) ) ( ON ?auto_162898 ?auto_162900 ) ( CLEAR ?auto_162895 ) ( ON ?auto_162897 ?auto_162898 ) ( CLEAR ?auto_162897 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_162892 ?auto_162893 ?auto_162894 ?auto_162896 ?auto_162900 ?auto_162898 )
      ( MAKE-3PILE ?auto_162892 ?auto_162893 ?auto_162894 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_162901 - BLOCK
      ?auto_162902 - BLOCK
      ?auto_162903 - BLOCK
    )
    :vars
    (
      ?auto_162905 - BLOCK
      ?auto_162909 - BLOCK
      ?auto_162906 - BLOCK
      ?auto_162904 - BLOCK
      ?auto_162907 - BLOCK
      ?auto_162908 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_162905 ?auto_162903 ) ( ON-TABLE ?auto_162901 ) ( ON ?auto_162902 ?auto_162901 ) ( ON ?auto_162903 ?auto_162902 ) ( not ( = ?auto_162901 ?auto_162902 ) ) ( not ( = ?auto_162901 ?auto_162903 ) ) ( not ( = ?auto_162901 ?auto_162905 ) ) ( not ( = ?auto_162902 ?auto_162903 ) ) ( not ( = ?auto_162902 ?auto_162905 ) ) ( not ( = ?auto_162903 ?auto_162905 ) ) ( not ( = ?auto_162901 ?auto_162909 ) ) ( not ( = ?auto_162901 ?auto_162906 ) ) ( not ( = ?auto_162902 ?auto_162909 ) ) ( not ( = ?auto_162902 ?auto_162906 ) ) ( not ( = ?auto_162903 ?auto_162909 ) ) ( not ( = ?auto_162903 ?auto_162906 ) ) ( not ( = ?auto_162905 ?auto_162909 ) ) ( not ( = ?auto_162905 ?auto_162906 ) ) ( not ( = ?auto_162909 ?auto_162906 ) ) ( ON ?auto_162909 ?auto_162905 ) ( ON-TABLE ?auto_162904 ) ( not ( = ?auto_162904 ?auto_162907 ) ) ( not ( = ?auto_162904 ?auto_162908 ) ) ( not ( = ?auto_162904 ?auto_162906 ) ) ( not ( = ?auto_162907 ?auto_162908 ) ) ( not ( = ?auto_162907 ?auto_162906 ) ) ( not ( = ?auto_162908 ?auto_162906 ) ) ( not ( = ?auto_162901 ?auto_162908 ) ) ( not ( = ?auto_162901 ?auto_162904 ) ) ( not ( = ?auto_162901 ?auto_162907 ) ) ( not ( = ?auto_162902 ?auto_162908 ) ) ( not ( = ?auto_162902 ?auto_162904 ) ) ( not ( = ?auto_162902 ?auto_162907 ) ) ( not ( = ?auto_162903 ?auto_162908 ) ) ( not ( = ?auto_162903 ?auto_162904 ) ) ( not ( = ?auto_162903 ?auto_162907 ) ) ( not ( = ?auto_162905 ?auto_162908 ) ) ( not ( = ?auto_162905 ?auto_162904 ) ) ( not ( = ?auto_162905 ?auto_162907 ) ) ( not ( = ?auto_162909 ?auto_162908 ) ) ( not ( = ?auto_162909 ?auto_162904 ) ) ( not ( = ?auto_162909 ?auto_162907 ) ) ( ON ?auto_162906 ?auto_162909 ) ( ON ?auto_162908 ?auto_162906 ) ( CLEAR ?auto_162908 ) ( HOLDING ?auto_162907 ) ( CLEAR ?auto_162904 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_162904 ?auto_162907 )
      ( MAKE-3PILE ?auto_162901 ?auto_162902 ?auto_162903 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_162910 - BLOCK
      ?auto_162911 - BLOCK
      ?auto_162912 - BLOCK
    )
    :vars
    (
      ?auto_162917 - BLOCK
      ?auto_162918 - BLOCK
      ?auto_162914 - BLOCK
      ?auto_162916 - BLOCK
      ?auto_162915 - BLOCK
      ?auto_162913 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_162917 ?auto_162912 ) ( ON-TABLE ?auto_162910 ) ( ON ?auto_162911 ?auto_162910 ) ( ON ?auto_162912 ?auto_162911 ) ( not ( = ?auto_162910 ?auto_162911 ) ) ( not ( = ?auto_162910 ?auto_162912 ) ) ( not ( = ?auto_162910 ?auto_162917 ) ) ( not ( = ?auto_162911 ?auto_162912 ) ) ( not ( = ?auto_162911 ?auto_162917 ) ) ( not ( = ?auto_162912 ?auto_162917 ) ) ( not ( = ?auto_162910 ?auto_162918 ) ) ( not ( = ?auto_162910 ?auto_162914 ) ) ( not ( = ?auto_162911 ?auto_162918 ) ) ( not ( = ?auto_162911 ?auto_162914 ) ) ( not ( = ?auto_162912 ?auto_162918 ) ) ( not ( = ?auto_162912 ?auto_162914 ) ) ( not ( = ?auto_162917 ?auto_162918 ) ) ( not ( = ?auto_162917 ?auto_162914 ) ) ( not ( = ?auto_162918 ?auto_162914 ) ) ( ON ?auto_162918 ?auto_162917 ) ( ON-TABLE ?auto_162916 ) ( not ( = ?auto_162916 ?auto_162915 ) ) ( not ( = ?auto_162916 ?auto_162913 ) ) ( not ( = ?auto_162916 ?auto_162914 ) ) ( not ( = ?auto_162915 ?auto_162913 ) ) ( not ( = ?auto_162915 ?auto_162914 ) ) ( not ( = ?auto_162913 ?auto_162914 ) ) ( not ( = ?auto_162910 ?auto_162913 ) ) ( not ( = ?auto_162910 ?auto_162916 ) ) ( not ( = ?auto_162910 ?auto_162915 ) ) ( not ( = ?auto_162911 ?auto_162913 ) ) ( not ( = ?auto_162911 ?auto_162916 ) ) ( not ( = ?auto_162911 ?auto_162915 ) ) ( not ( = ?auto_162912 ?auto_162913 ) ) ( not ( = ?auto_162912 ?auto_162916 ) ) ( not ( = ?auto_162912 ?auto_162915 ) ) ( not ( = ?auto_162917 ?auto_162913 ) ) ( not ( = ?auto_162917 ?auto_162916 ) ) ( not ( = ?auto_162917 ?auto_162915 ) ) ( not ( = ?auto_162918 ?auto_162913 ) ) ( not ( = ?auto_162918 ?auto_162916 ) ) ( not ( = ?auto_162918 ?auto_162915 ) ) ( ON ?auto_162914 ?auto_162918 ) ( ON ?auto_162913 ?auto_162914 ) ( CLEAR ?auto_162916 ) ( ON ?auto_162915 ?auto_162913 ) ( CLEAR ?auto_162915 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_162910 ?auto_162911 ?auto_162912 ?auto_162917 ?auto_162918 ?auto_162914 ?auto_162913 )
      ( MAKE-3PILE ?auto_162910 ?auto_162911 ?auto_162912 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_162919 - BLOCK
      ?auto_162920 - BLOCK
      ?auto_162921 - BLOCK
    )
    :vars
    (
      ?auto_162927 - BLOCK
      ?auto_162925 - BLOCK
      ?auto_162924 - BLOCK
      ?auto_162923 - BLOCK
      ?auto_162926 - BLOCK
      ?auto_162922 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_162927 ?auto_162921 ) ( ON-TABLE ?auto_162919 ) ( ON ?auto_162920 ?auto_162919 ) ( ON ?auto_162921 ?auto_162920 ) ( not ( = ?auto_162919 ?auto_162920 ) ) ( not ( = ?auto_162919 ?auto_162921 ) ) ( not ( = ?auto_162919 ?auto_162927 ) ) ( not ( = ?auto_162920 ?auto_162921 ) ) ( not ( = ?auto_162920 ?auto_162927 ) ) ( not ( = ?auto_162921 ?auto_162927 ) ) ( not ( = ?auto_162919 ?auto_162925 ) ) ( not ( = ?auto_162919 ?auto_162924 ) ) ( not ( = ?auto_162920 ?auto_162925 ) ) ( not ( = ?auto_162920 ?auto_162924 ) ) ( not ( = ?auto_162921 ?auto_162925 ) ) ( not ( = ?auto_162921 ?auto_162924 ) ) ( not ( = ?auto_162927 ?auto_162925 ) ) ( not ( = ?auto_162927 ?auto_162924 ) ) ( not ( = ?auto_162925 ?auto_162924 ) ) ( ON ?auto_162925 ?auto_162927 ) ( not ( = ?auto_162923 ?auto_162926 ) ) ( not ( = ?auto_162923 ?auto_162922 ) ) ( not ( = ?auto_162923 ?auto_162924 ) ) ( not ( = ?auto_162926 ?auto_162922 ) ) ( not ( = ?auto_162926 ?auto_162924 ) ) ( not ( = ?auto_162922 ?auto_162924 ) ) ( not ( = ?auto_162919 ?auto_162922 ) ) ( not ( = ?auto_162919 ?auto_162923 ) ) ( not ( = ?auto_162919 ?auto_162926 ) ) ( not ( = ?auto_162920 ?auto_162922 ) ) ( not ( = ?auto_162920 ?auto_162923 ) ) ( not ( = ?auto_162920 ?auto_162926 ) ) ( not ( = ?auto_162921 ?auto_162922 ) ) ( not ( = ?auto_162921 ?auto_162923 ) ) ( not ( = ?auto_162921 ?auto_162926 ) ) ( not ( = ?auto_162927 ?auto_162922 ) ) ( not ( = ?auto_162927 ?auto_162923 ) ) ( not ( = ?auto_162927 ?auto_162926 ) ) ( not ( = ?auto_162925 ?auto_162922 ) ) ( not ( = ?auto_162925 ?auto_162923 ) ) ( not ( = ?auto_162925 ?auto_162926 ) ) ( ON ?auto_162924 ?auto_162925 ) ( ON ?auto_162922 ?auto_162924 ) ( ON ?auto_162926 ?auto_162922 ) ( CLEAR ?auto_162926 ) ( HOLDING ?auto_162923 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_162923 )
      ( MAKE-3PILE ?auto_162919 ?auto_162920 ?auto_162921 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_162928 - BLOCK
      ?auto_162929 - BLOCK
      ?auto_162930 - BLOCK
    )
    :vars
    (
      ?auto_162936 - BLOCK
      ?auto_162933 - BLOCK
      ?auto_162934 - BLOCK
      ?auto_162935 - BLOCK
      ?auto_162931 - BLOCK
      ?auto_162932 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_162936 ?auto_162930 ) ( ON-TABLE ?auto_162928 ) ( ON ?auto_162929 ?auto_162928 ) ( ON ?auto_162930 ?auto_162929 ) ( not ( = ?auto_162928 ?auto_162929 ) ) ( not ( = ?auto_162928 ?auto_162930 ) ) ( not ( = ?auto_162928 ?auto_162936 ) ) ( not ( = ?auto_162929 ?auto_162930 ) ) ( not ( = ?auto_162929 ?auto_162936 ) ) ( not ( = ?auto_162930 ?auto_162936 ) ) ( not ( = ?auto_162928 ?auto_162933 ) ) ( not ( = ?auto_162928 ?auto_162934 ) ) ( not ( = ?auto_162929 ?auto_162933 ) ) ( not ( = ?auto_162929 ?auto_162934 ) ) ( not ( = ?auto_162930 ?auto_162933 ) ) ( not ( = ?auto_162930 ?auto_162934 ) ) ( not ( = ?auto_162936 ?auto_162933 ) ) ( not ( = ?auto_162936 ?auto_162934 ) ) ( not ( = ?auto_162933 ?auto_162934 ) ) ( ON ?auto_162933 ?auto_162936 ) ( not ( = ?auto_162935 ?auto_162931 ) ) ( not ( = ?auto_162935 ?auto_162932 ) ) ( not ( = ?auto_162935 ?auto_162934 ) ) ( not ( = ?auto_162931 ?auto_162932 ) ) ( not ( = ?auto_162931 ?auto_162934 ) ) ( not ( = ?auto_162932 ?auto_162934 ) ) ( not ( = ?auto_162928 ?auto_162932 ) ) ( not ( = ?auto_162928 ?auto_162935 ) ) ( not ( = ?auto_162928 ?auto_162931 ) ) ( not ( = ?auto_162929 ?auto_162932 ) ) ( not ( = ?auto_162929 ?auto_162935 ) ) ( not ( = ?auto_162929 ?auto_162931 ) ) ( not ( = ?auto_162930 ?auto_162932 ) ) ( not ( = ?auto_162930 ?auto_162935 ) ) ( not ( = ?auto_162930 ?auto_162931 ) ) ( not ( = ?auto_162936 ?auto_162932 ) ) ( not ( = ?auto_162936 ?auto_162935 ) ) ( not ( = ?auto_162936 ?auto_162931 ) ) ( not ( = ?auto_162933 ?auto_162932 ) ) ( not ( = ?auto_162933 ?auto_162935 ) ) ( not ( = ?auto_162933 ?auto_162931 ) ) ( ON ?auto_162934 ?auto_162933 ) ( ON ?auto_162932 ?auto_162934 ) ( ON ?auto_162931 ?auto_162932 ) ( ON ?auto_162935 ?auto_162931 ) ( CLEAR ?auto_162935 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_162928 ?auto_162929 ?auto_162930 ?auto_162936 ?auto_162933 ?auto_162934 ?auto_162932 ?auto_162931 )
      ( MAKE-3PILE ?auto_162928 ?auto_162929 ?auto_162930 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_162943 - BLOCK
      ?auto_162944 - BLOCK
      ?auto_162945 - BLOCK
      ?auto_162946 - BLOCK
      ?auto_162947 - BLOCK
      ?auto_162948 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_162948 ) ( CLEAR ?auto_162947 ) ( ON-TABLE ?auto_162943 ) ( ON ?auto_162944 ?auto_162943 ) ( ON ?auto_162945 ?auto_162944 ) ( ON ?auto_162946 ?auto_162945 ) ( ON ?auto_162947 ?auto_162946 ) ( not ( = ?auto_162943 ?auto_162944 ) ) ( not ( = ?auto_162943 ?auto_162945 ) ) ( not ( = ?auto_162943 ?auto_162946 ) ) ( not ( = ?auto_162943 ?auto_162947 ) ) ( not ( = ?auto_162943 ?auto_162948 ) ) ( not ( = ?auto_162944 ?auto_162945 ) ) ( not ( = ?auto_162944 ?auto_162946 ) ) ( not ( = ?auto_162944 ?auto_162947 ) ) ( not ( = ?auto_162944 ?auto_162948 ) ) ( not ( = ?auto_162945 ?auto_162946 ) ) ( not ( = ?auto_162945 ?auto_162947 ) ) ( not ( = ?auto_162945 ?auto_162948 ) ) ( not ( = ?auto_162946 ?auto_162947 ) ) ( not ( = ?auto_162946 ?auto_162948 ) ) ( not ( = ?auto_162947 ?auto_162948 ) ) )
    :subtasks
    ( ( !STACK ?auto_162948 ?auto_162947 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_162949 - BLOCK
      ?auto_162950 - BLOCK
      ?auto_162951 - BLOCK
      ?auto_162952 - BLOCK
      ?auto_162953 - BLOCK
      ?auto_162954 - BLOCK
    )
    :vars
    (
      ?auto_162955 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_162953 ) ( ON-TABLE ?auto_162949 ) ( ON ?auto_162950 ?auto_162949 ) ( ON ?auto_162951 ?auto_162950 ) ( ON ?auto_162952 ?auto_162951 ) ( ON ?auto_162953 ?auto_162952 ) ( not ( = ?auto_162949 ?auto_162950 ) ) ( not ( = ?auto_162949 ?auto_162951 ) ) ( not ( = ?auto_162949 ?auto_162952 ) ) ( not ( = ?auto_162949 ?auto_162953 ) ) ( not ( = ?auto_162949 ?auto_162954 ) ) ( not ( = ?auto_162950 ?auto_162951 ) ) ( not ( = ?auto_162950 ?auto_162952 ) ) ( not ( = ?auto_162950 ?auto_162953 ) ) ( not ( = ?auto_162950 ?auto_162954 ) ) ( not ( = ?auto_162951 ?auto_162952 ) ) ( not ( = ?auto_162951 ?auto_162953 ) ) ( not ( = ?auto_162951 ?auto_162954 ) ) ( not ( = ?auto_162952 ?auto_162953 ) ) ( not ( = ?auto_162952 ?auto_162954 ) ) ( not ( = ?auto_162953 ?auto_162954 ) ) ( ON ?auto_162954 ?auto_162955 ) ( CLEAR ?auto_162954 ) ( HAND-EMPTY ) ( not ( = ?auto_162949 ?auto_162955 ) ) ( not ( = ?auto_162950 ?auto_162955 ) ) ( not ( = ?auto_162951 ?auto_162955 ) ) ( not ( = ?auto_162952 ?auto_162955 ) ) ( not ( = ?auto_162953 ?auto_162955 ) ) ( not ( = ?auto_162954 ?auto_162955 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_162954 ?auto_162955 )
      ( MAKE-6PILE ?auto_162949 ?auto_162950 ?auto_162951 ?auto_162952 ?auto_162953 ?auto_162954 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_162956 - BLOCK
      ?auto_162957 - BLOCK
      ?auto_162958 - BLOCK
      ?auto_162959 - BLOCK
      ?auto_162960 - BLOCK
      ?auto_162961 - BLOCK
    )
    :vars
    (
      ?auto_162962 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_162956 ) ( ON ?auto_162957 ?auto_162956 ) ( ON ?auto_162958 ?auto_162957 ) ( ON ?auto_162959 ?auto_162958 ) ( not ( = ?auto_162956 ?auto_162957 ) ) ( not ( = ?auto_162956 ?auto_162958 ) ) ( not ( = ?auto_162956 ?auto_162959 ) ) ( not ( = ?auto_162956 ?auto_162960 ) ) ( not ( = ?auto_162956 ?auto_162961 ) ) ( not ( = ?auto_162957 ?auto_162958 ) ) ( not ( = ?auto_162957 ?auto_162959 ) ) ( not ( = ?auto_162957 ?auto_162960 ) ) ( not ( = ?auto_162957 ?auto_162961 ) ) ( not ( = ?auto_162958 ?auto_162959 ) ) ( not ( = ?auto_162958 ?auto_162960 ) ) ( not ( = ?auto_162958 ?auto_162961 ) ) ( not ( = ?auto_162959 ?auto_162960 ) ) ( not ( = ?auto_162959 ?auto_162961 ) ) ( not ( = ?auto_162960 ?auto_162961 ) ) ( ON ?auto_162961 ?auto_162962 ) ( CLEAR ?auto_162961 ) ( not ( = ?auto_162956 ?auto_162962 ) ) ( not ( = ?auto_162957 ?auto_162962 ) ) ( not ( = ?auto_162958 ?auto_162962 ) ) ( not ( = ?auto_162959 ?auto_162962 ) ) ( not ( = ?auto_162960 ?auto_162962 ) ) ( not ( = ?auto_162961 ?auto_162962 ) ) ( HOLDING ?auto_162960 ) ( CLEAR ?auto_162959 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_162956 ?auto_162957 ?auto_162958 ?auto_162959 ?auto_162960 )
      ( MAKE-6PILE ?auto_162956 ?auto_162957 ?auto_162958 ?auto_162959 ?auto_162960 ?auto_162961 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_162963 - BLOCK
      ?auto_162964 - BLOCK
      ?auto_162965 - BLOCK
      ?auto_162966 - BLOCK
      ?auto_162967 - BLOCK
      ?auto_162968 - BLOCK
    )
    :vars
    (
      ?auto_162969 - BLOCK
      ?auto_162970 - BLOCK
      ?auto_162971 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_162963 ) ( ON ?auto_162964 ?auto_162963 ) ( ON ?auto_162965 ?auto_162964 ) ( ON ?auto_162966 ?auto_162965 ) ( not ( = ?auto_162963 ?auto_162964 ) ) ( not ( = ?auto_162963 ?auto_162965 ) ) ( not ( = ?auto_162963 ?auto_162966 ) ) ( not ( = ?auto_162963 ?auto_162967 ) ) ( not ( = ?auto_162963 ?auto_162968 ) ) ( not ( = ?auto_162964 ?auto_162965 ) ) ( not ( = ?auto_162964 ?auto_162966 ) ) ( not ( = ?auto_162964 ?auto_162967 ) ) ( not ( = ?auto_162964 ?auto_162968 ) ) ( not ( = ?auto_162965 ?auto_162966 ) ) ( not ( = ?auto_162965 ?auto_162967 ) ) ( not ( = ?auto_162965 ?auto_162968 ) ) ( not ( = ?auto_162966 ?auto_162967 ) ) ( not ( = ?auto_162966 ?auto_162968 ) ) ( not ( = ?auto_162967 ?auto_162968 ) ) ( ON ?auto_162968 ?auto_162969 ) ( not ( = ?auto_162963 ?auto_162969 ) ) ( not ( = ?auto_162964 ?auto_162969 ) ) ( not ( = ?auto_162965 ?auto_162969 ) ) ( not ( = ?auto_162966 ?auto_162969 ) ) ( not ( = ?auto_162967 ?auto_162969 ) ) ( not ( = ?auto_162968 ?auto_162969 ) ) ( CLEAR ?auto_162966 ) ( ON ?auto_162967 ?auto_162968 ) ( CLEAR ?auto_162967 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_162970 ) ( ON ?auto_162971 ?auto_162970 ) ( ON ?auto_162969 ?auto_162971 ) ( not ( = ?auto_162970 ?auto_162971 ) ) ( not ( = ?auto_162970 ?auto_162969 ) ) ( not ( = ?auto_162970 ?auto_162968 ) ) ( not ( = ?auto_162970 ?auto_162967 ) ) ( not ( = ?auto_162971 ?auto_162969 ) ) ( not ( = ?auto_162971 ?auto_162968 ) ) ( not ( = ?auto_162971 ?auto_162967 ) ) ( not ( = ?auto_162963 ?auto_162970 ) ) ( not ( = ?auto_162963 ?auto_162971 ) ) ( not ( = ?auto_162964 ?auto_162970 ) ) ( not ( = ?auto_162964 ?auto_162971 ) ) ( not ( = ?auto_162965 ?auto_162970 ) ) ( not ( = ?auto_162965 ?auto_162971 ) ) ( not ( = ?auto_162966 ?auto_162970 ) ) ( not ( = ?auto_162966 ?auto_162971 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_162970 ?auto_162971 ?auto_162969 ?auto_162968 )
      ( MAKE-6PILE ?auto_162963 ?auto_162964 ?auto_162965 ?auto_162966 ?auto_162967 ?auto_162968 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_162972 - BLOCK
      ?auto_162973 - BLOCK
      ?auto_162974 - BLOCK
      ?auto_162975 - BLOCK
      ?auto_162976 - BLOCK
      ?auto_162977 - BLOCK
    )
    :vars
    (
      ?auto_162980 - BLOCK
      ?auto_162979 - BLOCK
      ?auto_162978 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_162972 ) ( ON ?auto_162973 ?auto_162972 ) ( ON ?auto_162974 ?auto_162973 ) ( not ( = ?auto_162972 ?auto_162973 ) ) ( not ( = ?auto_162972 ?auto_162974 ) ) ( not ( = ?auto_162972 ?auto_162975 ) ) ( not ( = ?auto_162972 ?auto_162976 ) ) ( not ( = ?auto_162972 ?auto_162977 ) ) ( not ( = ?auto_162973 ?auto_162974 ) ) ( not ( = ?auto_162973 ?auto_162975 ) ) ( not ( = ?auto_162973 ?auto_162976 ) ) ( not ( = ?auto_162973 ?auto_162977 ) ) ( not ( = ?auto_162974 ?auto_162975 ) ) ( not ( = ?auto_162974 ?auto_162976 ) ) ( not ( = ?auto_162974 ?auto_162977 ) ) ( not ( = ?auto_162975 ?auto_162976 ) ) ( not ( = ?auto_162975 ?auto_162977 ) ) ( not ( = ?auto_162976 ?auto_162977 ) ) ( ON ?auto_162977 ?auto_162980 ) ( not ( = ?auto_162972 ?auto_162980 ) ) ( not ( = ?auto_162973 ?auto_162980 ) ) ( not ( = ?auto_162974 ?auto_162980 ) ) ( not ( = ?auto_162975 ?auto_162980 ) ) ( not ( = ?auto_162976 ?auto_162980 ) ) ( not ( = ?auto_162977 ?auto_162980 ) ) ( ON ?auto_162976 ?auto_162977 ) ( CLEAR ?auto_162976 ) ( ON-TABLE ?auto_162979 ) ( ON ?auto_162978 ?auto_162979 ) ( ON ?auto_162980 ?auto_162978 ) ( not ( = ?auto_162979 ?auto_162978 ) ) ( not ( = ?auto_162979 ?auto_162980 ) ) ( not ( = ?auto_162979 ?auto_162977 ) ) ( not ( = ?auto_162979 ?auto_162976 ) ) ( not ( = ?auto_162978 ?auto_162980 ) ) ( not ( = ?auto_162978 ?auto_162977 ) ) ( not ( = ?auto_162978 ?auto_162976 ) ) ( not ( = ?auto_162972 ?auto_162979 ) ) ( not ( = ?auto_162972 ?auto_162978 ) ) ( not ( = ?auto_162973 ?auto_162979 ) ) ( not ( = ?auto_162973 ?auto_162978 ) ) ( not ( = ?auto_162974 ?auto_162979 ) ) ( not ( = ?auto_162974 ?auto_162978 ) ) ( not ( = ?auto_162975 ?auto_162979 ) ) ( not ( = ?auto_162975 ?auto_162978 ) ) ( HOLDING ?auto_162975 ) ( CLEAR ?auto_162974 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_162972 ?auto_162973 ?auto_162974 ?auto_162975 )
      ( MAKE-6PILE ?auto_162972 ?auto_162973 ?auto_162974 ?auto_162975 ?auto_162976 ?auto_162977 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_162981 - BLOCK
      ?auto_162982 - BLOCK
      ?auto_162983 - BLOCK
      ?auto_162984 - BLOCK
      ?auto_162985 - BLOCK
      ?auto_162986 - BLOCK
    )
    :vars
    (
      ?auto_162988 - BLOCK
      ?auto_162989 - BLOCK
      ?auto_162987 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_162981 ) ( ON ?auto_162982 ?auto_162981 ) ( ON ?auto_162983 ?auto_162982 ) ( not ( = ?auto_162981 ?auto_162982 ) ) ( not ( = ?auto_162981 ?auto_162983 ) ) ( not ( = ?auto_162981 ?auto_162984 ) ) ( not ( = ?auto_162981 ?auto_162985 ) ) ( not ( = ?auto_162981 ?auto_162986 ) ) ( not ( = ?auto_162982 ?auto_162983 ) ) ( not ( = ?auto_162982 ?auto_162984 ) ) ( not ( = ?auto_162982 ?auto_162985 ) ) ( not ( = ?auto_162982 ?auto_162986 ) ) ( not ( = ?auto_162983 ?auto_162984 ) ) ( not ( = ?auto_162983 ?auto_162985 ) ) ( not ( = ?auto_162983 ?auto_162986 ) ) ( not ( = ?auto_162984 ?auto_162985 ) ) ( not ( = ?auto_162984 ?auto_162986 ) ) ( not ( = ?auto_162985 ?auto_162986 ) ) ( ON ?auto_162986 ?auto_162988 ) ( not ( = ?auto_162981 ?auto_162988 ) ) ( not ( = ?auto_162982 ?auto_162988 ) ) ( not ( = ?auto_162983 ?auto_162988 ) ) ( not ( = ?auto_162984 ?auto_162988 ) ) ( not ( = ?auto_162985 ?auto_162988 ) ) ( not ( = ?auto_162986 ?auto_162988 ) ) ( ON ?auto_162985 ?auto_162986 ) ( ON-TABLE ?auto_162989 ) ( ON ?auto_162987 ?auto_162989 ) ( ON ?auto_162988 ?auto_162987 ) ( not ( = ?auto_162989 ?auto_162987 ) ) ( not ( = ?auto_162989 ?auto_162988 ) ) ( not ( = ?auto_162989 ?auto_162986 ) ) ( not ( = ?auto_162989 ?auto_162985 ) ) ( not ( = ?auto_162987 ?auto_162988 ) ) ( not ( = ?auto_162987 ?auto_162986 ) ) ( not ( = ?auto_162987 ?auto_162985 ) ) ( not ( = ?auto_162981 ?auto_162989 ) ) ( not ( = ?auto_162981 ?auto_162987 ) ) ( not ( = ?auto_162982 ?auto_162989 ) ) ( not ( = ?auto_162982 ?auto_162987 ) ) ( not ( = ?auto_162983 ?auto_162989 ) ) ( not ( = ?auto_162983 ?auto_162987 ) ) ( not ( = ?auto_162984 ?auto_162989 ) ) ( not ( = ?auto_162984 ?auto_162987 ) ) ( CLEAR ?auto_162983 ) ( ON ?auto_162984 ?auto_162985 ) ( CLEAR ?auto_162984 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_162989 ?auto_162987 ?auto_162988 ?auto_162986 ?auto_162985 )
      ( MAKE-6PILE ?auto_162981 ?auto_162982 ?auto_162983 ?auto_162984 ?auto_162985 ?auto_162986 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_162990 - BLOCK
      ?auto_162991 - BLOCK
      ?auto_162992 - BLOCK
      ?auto_162993 - BLOCK
      ?auto_162994 - BLOCK
      ?auto_162995 - BLOCK
    )
    :vars
    (
      ?auto_162998 - BLOCK
      ?auto_162996 - BLOCK
      ?auto_162997 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_162990 ) ( ON ?auto_162991 ?auto_162990 ) ( not ( = ?auto_162990 ?auto_162991 ) ) ( not ( = ?auto_162990 ?auto_162992 ) ) ( not ( = ?auto_162990 ?auto_162993 ) ) ( not ( = ?auto_162990 ?auto_162994 ) ) ( not ( = ?auto_162990 ?auto_162995 ) ) ( not ( = ?auto_162991 ?auto_162992 ) ) ( not ( = ?auto_162991 ?auto_162993 ) ) ( not ( = ?auto_162991 ?auto_162994 ) ) ( not ( = ?auto_162991 ?auto_162995 ) ) ( not ( = ?auto_162992 ?auto_162993 ) ) ( not ( = ?auto_162992 ?auto_162994 ) ) ( not ( = ?auto_162992 ?auto_162995 ) ) ( not ( = ?auto_162993 ?auto_162994 ) ) ( not ( = ?auto_162993 ?auto_162995 ) ) ( not ( = ?auto_162994 ?auto_162995 ) ) ( ON ?auto_162995 ?auto_162998 ) ( not ( = ?auto_162990 ?auto_162998 ) ) ( not ( = ?auto_162991 ?auto_162998 ) ) ( not ( = ?auto_162992 ?auto_162998 ) ) ( not ( = ?auto_162993 ?auto_162998 ) ) ( not ( = ?auto_162994 ?auto_162998 ) ) ( not ( = ?auto_162995 ?auto_162998 ) ) ( ON ?auto_162994 ?auto_162995 ) ( ON-TABLE ?auto_162996 ) ( ON ?auto_162997 ?auto_162996 ) ( ON ?auto_162998 ?auto_162997 ) ( not ( = ?auto_162996 ?auto_162997 ) ) ( not ( = ?auto_162996 ?auto_162998 ) ) ( not ( = ?auto_162996 ?auto_162995 ) ) ( not ( = ?auto_162996 ?auto_162994 ) ) ( not ( = ?auto_162997 ?auto_162998 ) ) ( not ( = ?auto_162997 ?auto_162995 ) ) ( not ( = ?auto_162997 ?auto_162994 ) ) ( not ( = ?auto_162990 ?auto_162996 ) ) ( not ( = ?auto_162990 ?auto_162997 ) ) ( not ( = ?auto_162991 ?auto_162996 ) ) ( not ( = ?auto_162991 ?auto_162997 ) ) ( not ( = ?auto_162992 ?auto_162996 ) ) ( not ( = ?auto_162992 ?auto_162997 ) ) ( not ( = ?auto_162993 ?auto_162996 ) ) ( not ( = ?auto_162993 ?auto_162997 ) ) ( ON ?auto_162993 ?auto_162994 ) ( CLEAR ?auto_162993 ) ( HOLDING ?auto_162992 ) ( CLEAR ?auto_162991 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_162990 ?auto_162991 ?auto_162992 )
      ( MAKE-6PILE ?auto_162990 ?auto_162991 ?auto_162992 ?auto_162993 ?auto_162994 ?auto_162995 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_162999 - BLOCK
      ?auto_163000 - BLOCK
      ?auto_163001 - BLOCK
      ?auto_163002 - BLOCK
      ?auto_163003 - BLOCK
      ?auto_163004 - BLOCK
    )
    :vars
    (
      ?auto_163006 - BLOCK
      ?auto_163005 - BLOCK
      ?auto_163007 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_162999 ) ( ON ?auto_163000 ?auto_162999 ) ( not ( = ?auto_162999 ?auto_163000 ) ) ( not ( = ?auto_162999 ?auto_163001 ) ) ( not ( = ?auto_162999 ?auto_163002 ) ) ( not ( = ?auto_162999 ?auto_163003 ) ) ( not ( = ?auto_162999 ?auto_163004 ) ) ( not ( = ?auto_163000 ?auto_163001 ) ) ( not ( = ?auto_163000 ?auto_163002 ) ) ( not ( = ?auto_163000 ?auto_163003 ) ) ( not ( = ?auto_163000 ?auto_163004 ) ) ( not ( = ?auto_163001 ?auto_163002 ) ) ( not ( = ?auto_163001 ?auto_163003 ) ) ( not ( = ?auto_163001 ?auto_163004 ) ) ( not ( = ?auto_163002 ?auto_163003 ) ) ( not ( = ?auto_163002 ?auto_163004 ) ) ( not ( = ?auto_163003 ?auto_163004 ) ) ( ON ?auto_163004 ?auto_163006 ) ( not ( = ?auto_162999 ?auto_163006 ) ) ( not ( = ?auto_163000 ?auto_163006 ) ) ( not ( = ?auto_163001 ?auto_163006 ) ) ( not ( = ?auto_163002 ?auto_163006 ) ) ( not ( = ?auto_163003 ?auto_163006 ) ) ( not ( = ?auto_163004 ?auto_163006 ) ) ( ON ?auto_163003 ?auto_163004 ) ( ON-TABLE ?auto_163005 ) ( ON ?auto_163007 ?auto_163005 ) ( ON ?auto_163006 ?auto_163007 ) ( not ( = ?auto_163005 ?auto_163007 ) ) ( not ( = ?auto_163005 ?auto_163006 ) ) ( not ( = ?auto_163005 ?auto_163004 ) ) ( not ( = ?auto_163005 ?auto_163003 ) ) ( not ( = ?auto_163007 ?auto_163006 ) ) ( not ( = ?auto_163007 ?auto_163004 ) ) ( not ( = ?auto_163007 ?auto_163003 ) ) ( not ( = ?auto_162999 ?auto_163005 ) ) ( not ( = ?auto_162999 ?auto_163007 ) ) ( not ( = ?auto_163000 ?auto_163005 ) ) ( not ( = ?auto_163000 ?auto_163007 ) ) ( not ( = ?auto_163001 ?auto_163005 ) ) ( not ( = ?auto_163001 ?auto_163007 ) ) ( not ( = ?auto_163002 ?auto_163005 ) ) ( not ( = ?auto_163002 ?auto_163007 ) ) ( ON ?auto_163002 ?auto_163003 ) ( CLEAR ?auto_163000 ) ( ON ?auto_163001 ?auto_163002 ) ( CLEAR ?auto_163001 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_163005 ?auto_163007 ?auto_163006 ?auto_163004 ?auto_163003 ?auto_163002 )
      ( MAKE-6PILE ?auto_162999 ?auto_163000 ?auto_163001 ?auto_163002 ?auto_163003 ?auto_163004 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_163008 - BLOCK
      ?auto_163009 - BLOCK
      ?auto_163010 - BLOCK
      ?auto_163011 - BLOCK
      ?auto_163012 - BLOCK
      ?auto_163013 - BLOCK
    )
    :vars
    (
      ?auto_163015 - BLOCK
      ?auto_163014 - BLOCK
      ?auto_163016 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_163008 ) ( not ( = ?auto_163008 ?auto_163009 ) ) ( not ( = ?auto_163008 ?auto_163010 ) ) ( not ( = ?auto_163008 ?auto_163011 ) ) ( not ( = ?auto_163008 ?auto_163012 ) ) ( not ( = ?auto_163008 ?auto_163013 ) ) ( not ( = ?auto_163009 ?auto_163010 ) ) ( not ( = ?auto_163009 ?auto_163011 ) ) ( not ( = ?auto_163009 ?auto_163012 ) ) ( not ( = ?auto_163009 ?auto_163013 ) ) ( not ( = ?auto_163010 ?auto_163011 ) ) ( not ( = ?auto_163010 ?auto_163012 ) ) ( not ( = ?auto_163010 ?auto_163013 ) ) ( not ( = ?auto_163011 ?auto_163012 ) ) ( not ( = ?auto_163011 ?auto_163013 ) ) ( not ( = ?auto_163012 ?auto_163013 ) ) ( ON ?auto_163013 ?auto_163015 ) ( not ( = ?auto_163008 ?auto_163015 ) ) ( not ( = ?auto_163009 ?auto_163015 ) ) ( not ( = ?auto_163010 ?auto_163015 ) ) ( not ( = ?auto_163011 ?auto_163015 ) ) ( not ( = ?auto_163012 ?auto_163015 ) ) ( not ( = ?auto_163013 ?auto_163015 ) ) ( ON ?auto_163012 ?auto_163013 ) ( ON-TABLE ?auto_163014 ) ( ON ?auto_163016 ?auto_163014 ) ( ON ?auto_163015 ?auto_163016 ) ( not ( = ?auto_163014 ?auto_163016 ) ) ( not ( = ?auto_163014 ?auto_163015 ) ) ( not ( = ?auto_163014 ?auto_163013 ) ) ( not ( = ?auto_163014 ?auto_163012 ) ) ( not ( = ?auto_163016 ?auto_163015 ) ) ( not ( = ?auto_163016 ?auto_163013 ) ) ( not ( = ?auto_163016 ?auto_163012 ) ) ( not ( = ?auto_163008 ?auto_163014 ) ) ( not ( = ?auto_163008 ?auto_163016 ) ) ( not ( = ?auto_163009 ?auto_163014 ) ) ( not ( = ?auto_163009 ?auto_163016 ) ) ( not ( = ?auto_163010 ?auto_163014 ) ) ( not ( = ?auto_163010 ?auto_163016 ) ) ( not ( = ?auto_163011 ?auto_163014 ) ) ( not ( = ?auto_163011 ?auto_163016 ) ) ( ON ?auto_163011 ?auto_163012 ) ( ON ?auto_163010 ?auto_163011 ) ( CLEAR ?auto_163010 ) ( HOLDING ?auto_163009 ) ( CLEAR ?auto_163008 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_163008 ?auto_163009 )
      ( MAKE-6PILE ?auto_163008 ?auto_163009 ?auto_163010 ?auto_163011 ?auto_163012 ?auto_163013 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_163017 - BLOCK
      ?auto_163018 - BLOCK
      ?auto_163019 - BLOCK
      ?auto_163020 - BLOCK
      ?auto_163021 - BLOCK
      ?auto_163022 - BLOCK
    )
    :vars
    (
      ?auto_163025 - BLOCK
      ?auto_163023 - BLOCK
      ?auto_163024 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_163017 ) ( not ( = ?auto_163017 ?auto_163018 ) ) ( not ( = ?auto_163017 ?auto_163019 ) ) ( not ( = ?auto_163017 ?auto_163020 ) ) ( not ( = ?auto_163017 ?auto_163021 ) ) ( not ( = ?auto_163017 ?auto_163022 ) ) ( not ( = ?auto_163018 ?auto_163019 ) ) ( not ( = ?auto_163018 ?auto_163020 ) ) ( not ( = ?auto_163018 ?auto_163021 ) ) ( not ( = ?auto_163018 ?auto_163022 ) ) ( not ( = ?auto_163019 ?auto_163020 ) ) ( not ( = ?auto_163019 ?auto_163021 ) ) ( not ( = ?auto_163019 ?auto_163022 ) ) ( not ( = ?auto_163020 ?auto_163021 ) ) ( not ( = ?auto_163020 ?auto_163022 ) ) ( not ( = ?auto_163021 ?auto_163022 ) ) ( ON ?auto_163022 ?auto_163025 ) ( not ( = ?auto_163017 ?auto_163025 ) ) ( not ( = ?auto_163018 ?auto_163025 ) ) ( not ( = ?auto_163019 ?auto_163025 ) ) ( not ( = ?auto_163020 ?auto_163025 ) ) ( not ( = ?auto_163021 ?auto_163025 ) ) ( not ( = ?auto_163022 ?auto_163025 ) ) ( ON ?auto_163021 ?auto_163022 ) ( ON-TABLE ?auto_163023 ) ( ON ?auto_163024 ?auto_163023 ) ( ON ?auto_163025 ?auto_163024 ) ( not ( = ?auto_163023 ?auto_163024 ) ) ( not ( = ?auto_163023 ?auto_163025 ) ) ( not ( = ?auto_163023 ?auto_163022 ) ) ( not ( = ?auto_163023 ?auto_163021 ) ) ( not ( = ?auto_163024 ?auto_163025 ) ) ( not ( = ?auto_163024 ?auto_163022 ) ) ( not ( = ?auto_163024 ?auto_163021 ) ) ( not ( = ?auto_163017 ?auto_163023 ) ) ( not ( = ?auto_163017 ?auto_163024 ) ) ( not ( = ?auto_163018 ?auto_163023 ) ) ( not ( = ?auto_163018 ?auto_163024 ) ) ( not ( = ?auto_163019 ?auto_163023 ) ) ( not ( = ?auto_163019 ?auto_163024 ) ) ( not ( = ?auto_163020 ?auto_163023 ) ) ( not ( = ?auto_163020 ?auto_163024 ) ) ( ON ?auto_163020 ?auto_163021 ) ( ON ?auto_163019 ?auto_163020 ) ( CLEAR ?auto_163017 ) ( ON ?auto_163018 ?auto_163019 ) ( CLEAR ?auto_163018 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_163023 ?auto_163024 ?auto_163025 ?auto_163022 ?auto_163021 ?auto_163020 ?auto_163019 )
      ( MAKE-6PILE ?auto_163017 ?auto_163018 ?auto_163019 ?auto_163020 ?auto_163021 ?auto_163022 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_163026 - BLOCK
      ?auto_163027 - BLOCK
      ?auto_163028 - BLOCK
      ?auto_163029 - BLOCK
      ?auto_163030 - BLOCK
      ?auto_163031 - BLOCK
    )
    :vars
    (
      ?auto_163033 - BLOCK
      ?auto_163034 - BLOCK
      ?auto_163032 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_163026 ?auto_163027 ) ) ( not ( = ?auto_163026 ?auto_163028 ) ) ( not ( = ?auto_163026 ?auto_163029 ) ) ( not ( = ?auto_163026 ?auto_163030 ) ) ( not ( = ?auto_163026 ?auto_163031 ) ) ( not ( = ?auto_163027 ?auto_163028 ) ) ( not ( = ?auto_163027 ?auto_163029 ) ) ( not ( = ?auto_163027 ?auto_163030 ) ) ( not ( = ?auto_163027 ?auto_163031 ) ) ( not ( = ?auto_163028 ?auto_163029 ) ) ( not ( = ?auto_163028 ?auto_163030 ) ) ( not ( = ?auto_163028 ?auto_163031 ) ) ( not ( = ?auto_163029 ?auto_163030 ) ) ( not ( = ?auto_163029 ?auto_163031 ) ) ( not ( = ?auto_163030 ?auto_163031 ) ) ( ON ?auto_163031 ?auto_163033 ) ( not ( = ?auto_163026 ?auto_163033 ) ) ( not ( = ?auto_163027 ?auto_163033 ) ) ( not ( = ?auto_163028 ?auto_163033 ) ) ( not ( = ?auto_163029 ?auto_163033 ) ) ( not ( = ?auto_163030 ?auto_163033 ) ) ( not ( = ?auto_163031 ?auto_163033 ) ) ( ON ?auto_163030 ?auto_163031 ) ( ON-TABLE ?auto_163034 ) ( ON ?auto_163032 ?auto_163034 ) ( ON ?auto_163033 ?auto_163032 ) ( not ( = ?auto_163034 ?auto_163032 ) ) ( not ( = ?auto_163034 ?auto_163033 ) ) ( not ( = ?auto_163034 ?auto_163031 ) ) ( not ( = ?auto_163034 ?auto_163030 ) ) ( not ( = ?auto_163032 ?auto_163033 ) ) ( not ( = ?auto_163032 ?auto_163031 ) ) ( not ( = ?auto_163032 ?auto_163030 ) ) ( not ( = ?auto_163026 ?auto_163034 ) ) ( not ( = ?auto_163026 ?auto_163032 ) ) ( not ( = ?auto_163027 ?auto_163034 ) ) ( not ( = ?auto_163027 ?auto_163032 ) ) ( not ( = ?auto_163028 ?auto_163034 ) ) ( not ( = ?auto_163028 ?auto_163032 ) ) ( not ( = ?auto_163029 ?auto_163034 ) ) ( not ( = ?auto_163029 ?auto_163032 ) ) ( ON ?auto_163029 ?auto_163030 ) ( ON ?auto_163028 ?auto_163029 ) ( ON ?auto_163027 ?auto_163028 ) ( CLEAR ?auto_163027 ) ( HOLDING ?auto_163026 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_163026 )
      ( MAKE-6PILE ?auto_163026 ?auto_163027 ?auto_163028 ?auto_163029 ?auto_163030 ?auto_163031 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_163035 - BLOCK
      ?auto_163036 - BLOCK
      ?auto_163037 - BLOCK
      ?auto_163038 - BLOCK
      ?auto_163039 - BLOCK
      ?auto_163040 - BLOCK
    )
    :vars
    (
      ?auto_163041 - BLOCK
      ?auto_163042 - BLOCK
      ?auto_163043 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_163035 ?auto_163036 ) ) ( not ( = ?auto_163035 ?auto_163037 ) ) ( not ( = ?auto_163035 ?auto_163038 ) ) ( not ( = ?auto_163035 ?auto_163039 ) ) ( not ( = ?auto_163035 ?auto_163040 ) ) ( not ( = ?auto_163036 ?auto_163037 ) ) ( not ( = ?auto_163036 ?auto_163038 ) ) ( not ( = ?auto_163036 ?auto_163039 ) ) ( not ( = ?auto_163036 ?auto_163040 ) ) ( not ( = ?auto_163037 ?auto_163038 ) ) ( not ( = ?auto_163037 ?auto_163039 ) ) ( not ( = ?auto_163037 ?auto_163040 ) ) ( not ( = ?auto_163038 ?auto_163039 ) ) ( not ( = ?auto_163038 ?auto_163040 ) ) ( not ( = ?auto_163039 ?auto_163040 ) ) ( ON ?auto_163040 ?auto_163041 ) ( not ( = ?auto_163035 ?auto_163041 ) ) ( not ( = ?auto_163036 ?auto_163041 ) ) ( not ( = ?auto_163037 ?auto_163041 ) ) ( not ( = ?auto_163038 ?auto_163041 ) ) ( not ( = ?auto_163039 ?auto_163041 ) ) ( not ( = ?auto_163040 ?auto_163041 ) ) ( ON ?auto_163039 ?auto_163040 ) ( ON-TABLE ?auto_163042 ) ( ON ?auto_163043 ?auto_163042 ) ( ON ?auto_163041 ?auto_163043 ) ( not ( = ?auto_163042 ?auto_163043 ) ) ( not ( = ?auto_163042 ?auto_163041 ) ) ( not ( = ?auto_163042 ?auto_163040 ) ) ( not ( = ?auto_163042 ?auto_163039 ) ) ( not ( = ?auto_163043 ?auto_163041 ) ) ( not ( = ?auto_163043 ?auto_163040 ) ) ( not ( = ?auto_163043 ?auto_163039 ) ) ( not ( = ?auto_163035 ?auto_163042 ) ) ( not ( = ?auto_163035 ?auto_163043 ) ) ( not ( = ?auto_163036 ?auto_163042 ) ) ( not ( = ?auto_163036 ?auto_163043 ) ) ( not ( = ?auto_163037 ?auto_163042 ) ) ( not ( = ?auto_163037 ?auto_163043 ) ) ( not ( = ?auto_163038 ?auto_163042 ) ) ( not ( = ?auto_163038 ?auto_163043 ) ) ( ON ?auto_163038 ?auto_163039 ) ( ON ?auto_163037 ?auto_163038 ) ( ON ?auto_163036 ?auto_163037 ) ( ON ?auto_163035 ?auto_163036 ) ( CLEAR ?auto_163035 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_163042 ?auto_163043 ?auto_163041 ?auto_163040 ?auto_163039 ?auto_163038 ?auto_163037 ?auto_163036 )
      ( MAKE-6PILE ?auto_163035 ?auto_163036 ?auto_163037 ?auto_163038 ?auto_163039 ?auto_163040 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_163046 - BLOCK
      ?auto_163047 - BLOCK
    )
    :vars
    (
      ?auto_163048 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_163048 ?auto_163047 ) ( CLEAR ?auto_163048 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_163046 ) ( ON ?auto_163047 ?auto_163046 ) ( not ( = ?auto_163046 ?auto_163047 ) ) ( not ( = ?auto_163046 ?auto_163048 ) ) ( not ( = ?auto_163047 ?auto_163048 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_163048 ?auto_163047 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_163049 - BLOCK
      ?auto_163050 - BLOCK
    )
    :vars
    (
      ?auto_163051 - BLOCK
      ?auto_163052 - BLOCK
      ?auto_163053 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_163051 ?auto_163050 ) ( CLEAR ?auto_163051 ) ( ON-TABLE ?auto_163049 ) ( ON ?auto_163050 ?auto_163049 ) ( not ( = ?auto_163049 ?auto_163050 ) ) ( not ( = ?auto_163049 ?auto_163051 ) ) ( not ( = ?auto_163050 ?auto_163051 ) ) ( HOLDING ?auto_163052 ) ( CLEAR ?auto_163053 ) ( not ( = ?auto_163049 ?auto_163052 ) ) ( not ( = ?auto_163049 ?auto_163053 ) ) ( not ( = ?auto_163050 ?auto_163052 ) ) ( not ( = ?auto_163050 ?auto_163053 ) ) ( not ( = ?auto_163051 ?auto_163052 ) ) ( not ( = ?auto_163051 ?auto_163053 ) ) ( not ( = ?auto_163052 ?auto_163053 ) ) )
    :subtasks
    ( ( !STACK ?auto_163052 ?auto_163053 )
      ( MAKE-2PILE ?auto_163049 ?auto_163050 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_163054 - BLOCK
      ?auto_163055 - BLOCK
    )
    :vars
    (
      ?auto_163056 - BLOCK
      ?auto_163057 - BLOCK
      ?auto_163058 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_163056 ?auto_163055 ) ( ON-TABLE ?auto_163054 ) ( ON ?auto_163055 ?auto_163054 ) ( not ( = ?auto_163054 ?auto_163055 ) ) ( not ( = ?auto_163054 ?auto_163056 ) ) ( not ( = ?auto_163055 ?auto_163056 ) ) ( CLEAR ?auto_163057 ) ( not ( = ?auto_163054 ?auto_163058 ) ) ( not ( = ?auto_163054 ?auto_163057 ) ) ( not ( = ?auto_163055 ?auto_163058 ) ) ( not ( = ?auto_163055 ?auto_163057 ) ) ( not ( = ?auto_163056 ?auto_163058 ) ) ( not ( = ?auto_163056 ?auto_163057 ) ) ( not ( = ?auto_163058 ?auto_163057 ) ) ( ON ?auto_163058 ?auto_163056 ) ( CLEAR ?auto_163058 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_163054 ?auto_163055 ?auto_163056 )
      ( MAKE-2PILE ?auto_163054 ?auto_163055 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_163059 - BLOCK
      ?auto_163060 - BLOCK
    )
    :vars
    (
      ?auto_163063 - BLOCK
      ?auto_163062 - BLOCK
      ?auto_163061 - BLOCK
      ?auto_163067 - BLOCK
      ?auto_163065 - BLOCK
      ?auto_163064 - BLOCK
      ?auto_163066 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_163063 ?auto_163060 ) ( ON-TABLE ?auto_163059 ) ( ON ?auto_163060 ?auto_163059 ) ( not ( = ?auto_163059 ?auto_163060 ) ) ( not ( = ?auto_163059 ?auto_163063 ) ) ( not ( = ?auto_163060 ?auto_163063 ) ) ( not ( = ?auto_163059 ?auto_163062 ) ) ( not ( = ?auto_163059 ?auto_163061 ) ) ( not ( = ?auto_163060 ?auto_163062 ) ) ( not ( = ?auto_163060 ?auto_163061 ) ) ( not ( = ?auto_163063 ?auto_163062 ) ) ( not ( = ?auto_163063 ?auto_163061 ) ) ( not ( = ?auto_163062 ?auto_163061 ) ) ( ON ?auto_163062 ?auto_163063 ) ( CLEAR ?auto_163062 ) ( HOLDING ?auto_163061 ) ( CLEAR ?auto_163067 ) ( ON-TABLE ?auto_163065 ) ( ON ?auto_163064 ?auto_163065 ) ( ON ?auto_163066 ?auto_163064 ) ( ON ?auto_163067 ?auto_163066 ) ( not ( = ?auto_163065 ?auto_163064 ) ) ( not ( = ?auto_163065 ?auto_163066 ) ) ( not ( = ?auto_163065 ?auto_163067 ) ) ( not ( = ?auto_163065 ?auto_163061 ) ) ( not ( = ?auto_163064 ?auto_163066 ) ) ( not ( = ?auto_163064 ?auto_163067 ) ) ( not ( = ?auto_163064 ?auto_163061 ) ) ( not ( = ?auto_163066 ?auto_163067 ) ) ( not ( = ?auto_163066 ?auto_163061 ) ) ( not ( = ?auto_163067 ?auto_163061 ) ) ( not ( = ?auto_163059 ?auto_163067 ) ) ( not ( = ?auto_163059 ?auto_163065 ) ) ( not ( = ?auto_163059 ?auto_163064 ) ) ( not ( = ?auto_163059 ?auto_163066 ) ) ( not ( = ?auto_163060 ?auto_163067 ) ) ( not ( = ?auto_163060 ?auto_163065 ) ) ( not ( = ?auto_163060 ?auto_163064 ) ) ( not ( = ?auto_163060 ?auto_163066 ) ) ( not ( = ?auto_163063 ?auto_163067 ) ) ( not ( = ?auto_163063 ?auto_163065 ) ) ( not ( = ?auto_163063 ?auto_163064 ) ) ( not ( = ?auto_163063 ?auto_163066 ) ) ( not ( = ?auto_163062 ?auto_163067 ) ) ( not ( = ?auto_163062 ?auto_163065 ) ) ( not ( = ?auto_163062 ?auto_163064 ) ) ( not ( = ?auto_163062 ?auto_163066 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_163065 ?auto_163064 ?auto_163066 ?auto_163067 ?auto_163061 )
      ( MAKE-2PILE ?auto_163059 ?auto_163060 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_163068 - BLOCK
      ?auto_163069 - BLOCK
    )
    :vars
    (
      ?auto_163072 - BLOCK
      ?auto_163074 - BLOCK
      ?auto_163071 - BLOCK
      ?auto_163070 - BLOCK
      ?auto_163075 - BLOCK
      ?auto_163073 - BLOCK
      ?auto_163076 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_163072 ?auto_163069 ) ( ON-TABLE ?auto_163068 ) ( ON ?auto_163069 ?auto_163068 ) ( not ( = ?auto_163068 ?auto_163069 ) ) ( not ( = ?auto_163068 ?auto_163072 ) ) ( not ( = ?auto_163069 ?auto_163072 ) ) ( not ( = ?auto_163068 ?auto_163074 ) ) ( not ( = ?auto_163068 ?auto_163071 ) ) ( not ( = ?auto_163069 ?auto_163074 ) ) ( not ( = ?auto_163069 ?auto_163071 ) ) ( not ( = ?auto_163072 ?auto_163074 ) ) ( not ( = ?auto_163072 ?auto_163071 ) ) ( not ( = ?auto_163074 ?auto_163071 ) ) ( ON ?auto_163074 ?auto_163072 ) ( CLEAR ?auto_163070 ) ( ON-TABLE ?auto_163075 ) ( ON ?auto_163073 ?auto_163075 ) ( ON ?auto_163076 ?auto_163073 ) ( ON ?auto_163070 ?auto_163076 ) ( not ( = ?auto_163075 ?auto_163073 ) ) ( not ( = ?auto_163075 ?auto_163076 ) ) ( not ( = ?auto_163075 ?auto_163070 ) ) ( not ( = ?auto_163075 ?auto_163071 ) ) ( not ( = ?auto_163073 ?auto_163076 ) ) ( not ( = ?auto_163073 ?auto_163070 ) ) ( not ( = ?auto_163073 ?auto_163071 ) ) ( not ( = ?auto_163076 ?auto_163070 ) ) ( not ( = ?auto_163076 ?auto_163071 ) ) ( not ( = ?auto_163070 ?auto_163071 ) ) ( not ( = ?auto_163068 ?auto_163070 ) ) ( not ( = ?auto_163068 ?auto_163075 ) ) ( not ( = ?auto_163068 ?auto_163073 ) ) ( not ( = ?auto_163068 ?auto_163076 ) ) ( not ( = ?auto_163069 ?auto_163070 ) ) ( not ( = ?auto_163069 ?auto_163075 ) ) ( not ( = ?auto_163069 ?auto_163073 ) ) ( not ( = ?auto_163069 ?auto_163076 ) ) ( not ( = ?auto_163072 ?auto_163070 ) ) ( not ( = ?auto_163072 ?auto_163075 ) ) ( not ( = ?auto_163072 ?auto_163073 ) ) ( not ( = ?auto_163072 ?auto_163076 ) ) ( not ( = ?auto_163074 ?auto_163070 ) ) ( not ( = ?auto_163074 ?auto_163075 ) ) ( not ( = ?auto_163074 ?auto_163073 ) ) ( not ( = ?auto_163074 ?auto_163076 ) ) ( ON ?auto_163071 ?auto_163074 ) ( CLEAR ?auto_163071 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_163068 ?auto_163069 ?auto_163072 ?auto_163074 )
      ( MAKE-2PILE ?auto_163068 ?auto_163069 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_163077 - BLOCK
      ?auto_163078 - BLOCK
    )
    :vars
    (
      ?auto_163084 - BLOCK
      ?auto_163083 - BLOCK
      ?auto_163079 - BLOCK
      ?auto_163082 - BLOCK
      ?auto_163081 - BLOCK
      ?auto_163085 - BLOCK
      ?auto_163080 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_163084 ?auto_163078 ) ( ON-TABLE ?auto_163077 ) ( ON ?auto_163078 ?auto_163077 ) ( not ( = ?auto_163077 ?auto_163078 ) ) ( not ( = ?auto_163077 ?auto_163084 ) ) ( not ( = ?auto_163078 ?auto_163084 ) ) ( not ( = ?auto_163077 ?auto_163083 ) ) ( not ( = ?auto_163077 ?auto_163079 ) ) ( not ( = ?auto_163078 ?auto_163083 ) ) ( not ( = ?auto_163078 ?auto_163079 ) ) ( not ( = ?auto_163084 ?auto_163083 ) ) ( not ( = ?auto_163084 ?auto_163079 ) ) ( not ( = ?auto_163083 ?auto_163079 ) ) ( ON ?auto_163083 ?auto_163084 ) ( ON-TABLE ?auto_163082 ) ( ON ?auto_163081 ?auto_163082 ) ( ON ?auto_163085 ?auto_163081 ) ( not ( = ?auto_163082 ?auto_163081 ) ) ( not ( = ?auto_163082 ?auto_163085 ) ) ( not ( = ?auto_163082 ?auto_163080 ) ) ( not ( = ?auto_163082 ?auto_163079 ) ) ( not ( = ?auto_163081 ?auto_163085 ) ) ( not ( = ?auto_163081 ?auto_163080 ) ) ( not ( = ?auto_163081 ?auto_163079 ) ) ( not ( = ?auto_163085 ?auto_163080 ) ) ( not ( = ?auto_163085 ?auto_163079 ) ) ( not ( = ?auto_163080 ?auto_163079 ) ) ( not ( = ?auto_163077 ?auto_163080 ) ) ( not ( = ?auto_163077 ?auto_163082 ) ) ( not ( = ?auto_163077 ?auto_163081 ) ) ( not ( = ?auto_163077 ?auto_163085 ) ) ( not ( = ?auto_163078 ?auto_163080 ) ) ( not ( = ?auto_163078 ?auto_163082 ) ) ( not ( = ?auto_163078 ?auto_163081 ) ) ( not ( = ?auto_163078 ?auto_163085 ) ) ( not ( = ?auto_163084 ?auto_163080 ) ) ( not ( = ?auto_163084 ?auto_163082 ) ) ( not ( = ?auto_163084 ?auto_163081 ) ) ( not ( = ?auto_163084 ?auto_163085 ) ) ( not ( = ?auto_163083 ?auto_163080 ) ) ( not ( = ?auto_163083 ?auto_163082 ) ) ( not ( = ?auto_163083 ?auto_163081 ) ) ( not ( = ?auto_163083 ?auto_163085 ) ) ( ON ?auto_163079 ?auto_163083 ) ( CLEAR ?auto_163079 ) ( HOLDING ?auto_163080 ) ( CLEAR ?auto_163085 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_163082 ?auto_163081 ?auto_163085 ?auto_163080 )
      ( MAKE-2PILE ?auto_163077 ?auto_163078 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_163086 - BLOCK
      ?auto_163087 - BLOCK
    )
    :vars
    (
      ?auto_163094 - BLOCK
      ?auto_163089 - BLOCK
      ?auto_163092 - BLOCK
      ?auto_163088 - BLOCK
      ?auto_163090 - BLOCK
      ?auto_163091 - BLOCK
      ?auto_163093 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_163094 ?auto_163087 ) ( ON-TABLE ?auto_163086 ) ( ON ?auto_163087 ?auto_163086 ) ( not ( = ?auto_163086 ?auto_163087 ) ) ( not ( = ?auto_163086 ?auto_163094 ) ) ( not ( = ?auto_163087 ?auto_163094 ) ) ( not ( = ?auto_163086 ?auto_163089 ) ) ( not ( = ?auto_163086 ?auto_163092 ) ) ( not ( = ?auto_163087 ?auto_163089 ) ) ( not ( = ?auto_163087 ?auto_163092 ) ) ( not ( = ?auto_163094 ?auto_163089 ) ) ( not ( = ?auto_163094 ?auto_163092 ) ) ( not ( = ?auto_163089 ?auto_163092 ) ) ( ON ?auto_163089 ?auto_163094 ) ( ON-TABLE ?auto_163088 ) ( ON ?auto_163090 ?auto_163088 ) ( ON ?auto_163091 ?auto_163090 ) ( not ( = ?auto_163088 ?auto_163090 ) ) ( not ( = ?auto_163088 ?auto_163091 ) ) ( not ( = ?auto_163088 ?auto_163093 ) ) ( not ( = ?auto_163088 ?auto_163092 ) ) ( not ( = ?auto_163090 ?auto_163091 ) ) ( not ( = ?auto_163090 ?auto_163093 ) ) ( not ( = ?auto_163090 ?auto_163092 ) ) ( not ( = ?auto_163091 ?auto_163093 ) ) ( not ( = ?auto_163091 ?auto_163092 ) ) ( not ( = ?auto_163093 ?auto_163092 ) ) ( not ( = ?auto_163086 ?auto_163093 ) ) ( not ( = ?auto_163086 ?auto_163088 ) ) ( not ( = ?auto_163086 ?auto_163090 ) ) ( not ( = ?auto_163086 ?auto_163091 ) ) ( not ( = ?auto_163087 ?auto_163093 ) ) ( not ( = ?auto_163087 ?auto_163088 ) ) ( not ( = ?auto_163087 ?auto_163090 ) ) ( not ( = ?auto_163087 ?auto_163091 ) ) ( not ( = ?auto_163094 ?auto_163093 ) ) ( not ( = ?auto_163094 ?auto_163088 ) ) ( not ( = ?auto_163094 ?auto_163090 ) ) ( not ( = ?auto_163094 ?auto_163091 ) ) ( not ( = ?auto_163089 ?auto_163093 ) ) ( not ( = ?auto_163089 ?auto_163088 ) ) ( not ( = ?auto_163089 ?auto_163090 ) ) ( not ( = ?auto_163089 ?auto_163091 ) ) ( ON ?auto_163092 ?auto_163089 ) ( CLEAR ?auto_163091 ) ( ON ?auto_163093 ?auto_163092 ) ( CLEAR ?auto_163093 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_163086 ?auto_163087 ?auto_163094 ?auto_163089 ?auto_163092 )
      ( MAKE-2PILE ?auto_163086 ?auto_163087 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_163095 - BLOCK
      ?auto_163096 - BLOCK
    )
    :vars
    (
      ?auto_163100 - BLOCK
      ?auto_163099 - BLOCK
      ?auto_163098 - BLOCK
      ?auto_163102 - BLOCK
      ?auto_163101 - BLOCK
      ?auto_163103 - BLOCK
      ?auto_163097 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_163100 ?auto_163096 ) ( ON-TABLE ?auto_163095 ) ( ON ?auto_163096 ?auto_163095 ) ( not ( = ?auto_163095 ?auto_163096 ) ) ( not ( = ?auto_163095 ?auto_163100 ) ) ( not ( = ?auto_163096 ?auto_163100 ) ) ( not ( = ?auto_163095 ?auto_163099 ) ) ( not ( = ?auto_163095 ?auto_163098 ) ) ( not ( = ?auto_163096 ?auto_163099 ) ) ( not ( = ?auto_163096 ?auto_163098 ) ) ( not ( = ?auto_163100 ?auto_163099 ) ) ( not ( = ?auto_163100 ?auto_163098 ) ) ( not ( = ?auto_163099 ?auto_163098 ) ) ( ON ?auto_163099 ?auto_163100 ) ( ON-TABLE ?auto_163102 ) ( ON ?auto_163101 ?auto_163102 ) ( not ( = ?auto_163102 ?auto_163101 ) ) ( not ( = ?auto_163102 ?auto_163103 ) ) ( not ( = ?auto_163102 ?auto_163097 ) ) ( not ( = ?auto_163102 ?auto_163098 ) ) ( not ( = ?auto_163101 ?auto_163103 ) ) ( not ( = ?auto_163101 ?auto_163097 ) ) ( not ( = ?auto_163101 ?auto_163098 ) ) ( not ( = ?auto_163103 ?auto_163097 ) ) ( not ( = ?auto_163103 ?auto_163098 ) ) ( not ( = ?auto_163097 ?auto_163098 ) ) ( not ( = ?auto_163095 ?auto_163097 ) ) ( not ( = ?auto_163095 ?auto_163102 ) ) ( not ( = ?auto_163095 ?auto_163101 ) ) ( not ( = ?auto_163095 ?auto_163103 ) ) ( not ( = ?auto_163096 ?auto_163097 ) ) ( not ( = ?auto_163096 ?auto_163102 ) ) ( not ( = ?auto_163096 ?auto_163101 ) ) ( not ( = ?auto_163096 ?auto_163103 ) ) ( not ( = ?auto_163100 ?auto_163097 ) ) ( not ( = ?auto_163100 ?auto_163102 ) ) ( not ( = ?auto_163100 ?auto_163101 ) ) ( not ( = ?auto_163100 ?auto_163103 ) ) ( not ( = ?auto_163099 ?auto_163097 ) ) ( not ( = ?auto_163099 ?auto_163102 ) ) ( not ( = ?auto_163099 ?auto_163101 ) ) ( not ( = ?auto_163099 ?auto_163103 ) ) ( ON ?auto_163098 ?auto_163099 ) ( ON ?auto_163097 ?auto_163098 ) ( CLEAR ?auto_163097 ) ( HOLDING ?auto_163103 ) ( CLEAR ?auto_163101 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_163102 ?auto_163101 ?auto_163103 )
      ( MAKE-2PILE ?auto_163095 ?auto_163096 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_163104 - BLOCK
      ?auto_163105 - BLOCK
    )
    :vars
    (
      ?auto_163110 - BLOCK
      ?auto_163111 - BLOCK
      ?auto_163112 - BLOCK
      ?auto_163109 - BLOCK
      ?auto_163107 - BLOCK
      ?auto_163106 - BLOCK
      ?auto_163108 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_163110 ?auto_163105 ) ( ON-TABLE ?auto_163104 ) ( ON ?auto_163105 ?auto_163104 ) ( not ( = ?auto_163104 ?auto_163105 ) ) ( not ( = ?auto_163104 ?auto_163110 ) ) ( not ( = ?auto_163105 ?auto_163110 ) ) ( not ( = ?auto_163104 ?auto_163111 ) ) ( not ( = ?auto_163104 ?auto_163112 ) ) ( not ( = ?auto_163105 ?auto_163111 ) ) ( not ( = ?auto_163105 ?auto_163112 ) ) ( not ( = ?auto_163110 ?auto_163111 ) ) ( not ( = ?auto_163110 ?auto_163112 ) ) ( not ( = ?auto_163111 ?auto_163112 ) ) ( ON ?auto_163111 ?auto_163110 ) ( ON-TABLE ?auto_163109 ) ( ON ?auto_163107 ?auto_163109 ) ( not ( = ?auto_163109 ?auto_163107 ) ) ( not ( = ?auto_163109 ?auto_163106 ) ) ( not ( = ?auto_163109 ?auto_163108 ) ) ( not ( = ?auto_163109 ?auto_163112 ) ) ( not ( = ?auto_163107 ?auto_163106 ) ) ( not ( = ?auto_163107 ?auto_163108 ) ) ( not ( = ?auto_163107 ?auto_163112 ) ) ( not ( = ?auto_163106 ?auto_163108 ) ) ( not ( = ?auto_163106 ?auto_163112 ) ) ( not ( = ?auto_163108 ?auto_163112 ) ) ( not ( = ?auto_163104 ?auto_163108 ) ) ( not ( = ?auto_163104 ?auto_163109 ) ) ( not ( = ?auto_163104 ?auto_163107 ) ) ( not ( = ?auto_163104 ?auto_163106 ) ) ( not ( = ?auto_163105 ?auto_163108 ) ) ( not ( = ?auto_163105 ?auto_163109 ) ) ( not ( = ?auto_163105 ?auto_163107 ) ) ( not ( = ?auto_163105 ?auto_163106 ) ) ( not ( = ?auto_163110 ?auto_163108 ) ) ( not ( = ?auto_163110 ?auto_163109 ) ) ( not ( = ?auto_163110 ?auto_163107 ) ) ( not ( = ?auto_163110 ?auto_163106 ) ) ( not ( = ?auto_163111 ?auto_163108 ) ) ( not ( = ?auto_163111 ?auto_163109 ) ) ( not ( = ?auto_163111 ?auto_163107 ) ) ( not ( = ?auto_163111 ?auto_163106 ) ) ( ON ?auto_163112 ?auto_163111 ) ( ON ?auto_163108 ?auto_163112 ) ( CLEAR ?auto_163107 ) ( ON ?auto_163106 ?auto_163108 ) ( CLEAR ?auto_163106 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_163104 ?auto_163105 ?auto_163110 ?auto_163111 ?auto_163112 ?auto_163108 )
      ( MAKE-2PILE ?auto_163104 ?auto_163105 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_163113 - BLOCK
      ?auto_163114 - BLOCK
    )
    :vars
    (
      ?auto_163118 - BLOCK
      ?auto_163116 - BLOCK
      ?auto_163115 - BLOCK
      ?auto_163121 - BLOCK
      ?auto_163120 - BLOCK
      ?auto_163119 - BLOCK
      ?auto_163117 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_163118 ?auto_163114 ) ( ON-TABLE ?auto_163113 ) ( ON ?auto_163114 ?auto_163113 ) ( not ( = ?auto_163113 ?auto_163114 ) ) ( not ( = ?auto_163113 ?auto_163118 ) ) ( not ( = ?auto_163114 ?auto_163118 ) ) ( not ( = ?auto_163113 ?auto_163116 ) ) ( not ( = ?auto_163113 ?auto_163115 ) ) ( not ( = ?auto_163114 ?auto_163116 ) ) ( not ( = ?auto_163114 ?auto_163115 ) ) ( not ( = ?auto_163118 ?auto_163116 ) ) ( not ( = ?auto_163118 ?auto_163115 ) ) ( not ( = ?auto_163116 ?auto_163115 ) ) ( ON ?auto_163116 ?auto_163118 ) ( ON-TABLE ?auto_163121 ) ( not ( = ?auto_163121 ?auto_163120 ) ) ( not ( = ?auto_163121 ?auto_163119 ) ) ( not ( = ?auto_163121 ?auto_163117 ) ) ( not ( = ?auto_163121 ?auto_163115 ) ) ( not ( = ?auto_163120 ?auto_163119 ) ) ( not ( = ?auto_163120 ?auto_163117 ) ) ( not ( = ?auto_163120 ?auto_163115 ) ) ( not ( = ?auto_163119 ?auto_163117 ) ) ( not ( = ?auto_163119 ?auto_163115 ) ) ( not ( = ?auto_163117 ?auto_163115 ) ) ( not ( = ?auto_163113 ?auto_163117 ) ) ( not ( = ?auto_163113 ?auto_163121 ) ) ( not ( = ?auto_163113 ?auto_163120 ) ) ( not ( = ?auto_163113 ?auto_163119 ) ) ( not ( = ?auto_163114 ?auto_163117 ) ) ( not ( = ?auto_163114 ?auto_163121 ) ) ( not ( = ?auto_163114 ?auto_163120 ) ) ( not ( = ?auto_163114 ?auto_163119 ) ) ( not ( = ?auto_163118 ?auto_163117 ) ) ( not ( = ?auto_163118 ?auto_163121 ) ) ( not ( = ?auto_163118 ?auto_163120 ) ) ( not ( = ?auto_163118 ?auto_163119 ) ) ( not ( = ?auto_163116 ?auto_163117 ) ) ( not ( = ?auto_163116 ?auto_163121 ) ) ( not ( = ?auto_163116 ?auto_163120 ) ) ( not ( = ?auto_163116 ?auto_163119 ) ) ( ON ?auto_163115 ?auto_163116 ) ( ON ?auto_163117 ?auto_163115 ) ( ON ?auto_163119 ?auto_163117 ) ( CLEAR ?auto_163119 ) ( HOLDING ?auto_163120 ) ( CLEAR ?auto_163121 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_163121 ?auto_163120 )
      ( MAKE-2PILE ?auto_163113 ?auto_163114 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_163122 - BLOCK
      ?auto_163123 - BLOCK
    )
    :vars
    (
      ?auto_163126 - BLOCK
      ?auto_163130 - BLOCK
      ?auto_163124 - BLOCK
      ?auto_163129 - BLOCK
      ?auto_163125 - BLOCK
      ?auto_163127 - BLOCK
      ?auto_163128 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_163126 ?auto_163123 ) ( ON-TABLE ?auto_163122 ) ( ON ?auto_163123 ?auto_163122 ) ( not ( = ?auto_163122 ?auto_163123 ) ) ( not ( = ?auto_163122 ?auto_163126 ) ) ( not ( = ?auto_163123 ?auto_163126 ) ) ( not ( = ?auto_163122 ?auto_163130 ) ) ( not ( = ?auto_163122 ?auto_163124 ) ) ( not ( = ?auto_163123 ?auto_163130 ) ) ( not ( = ?auto_163123 ?auto_163124 ) ) ( not ( = ?auto_163126 ?auto_163130 ) ) ( not ( = ?auto_163126 ?auto_163124 ) ) ( not ( = ?auto_163130 ?auto_163124 ) ) ( ON ?auto_163130 ?auto_163126 ) ( ON-TABLE ?auto_163129 ) ( not ( = ?auto_163129 ?auto_163125 ) ) ( not ( = ?auto_163129 ?auto_163127 ) ) ( not ( = ?auto_163129 ?auto_163128 ) ) ( not ( = ?auto_163129 ?auto_163124 ) ) ( not ( = ?auto_163125 ?auto_163127 ) ) ( not ( = ?auto_163125 ?auto_163128 ) ) ( not ( = ?auto_163125 ?auto_163124 ) ) ( not ( = ?auto_163127 ?auto_163128 ) ) ( not ( = ?auto_163127 ?auto_163124 ) ) ( not ( = ?auto_163128 ?auto_163124 ) ) ( not ( = ?auto_163122 ?auto_163128 ) ) ( not ( = ?auto_163122 ?auto_163129 ) ) ( not ( = ?auto_163122 ?auto_163125 ) ) ( not ( = ?auto_163122 ?auto_163127 ) ) ( not ( = ?auto_163123 ?auto_163128 ) ) ( not ( = ?auto_163123 ?auto_163129 ) ) ( not ( = ?auto_163123 ?auto_163125 ) ) ( not ( = ?auto_163123 ?auto_163127 ) ) ( not ( = ?auto_163126 ?auto_163128 ) ) ( not ( = ?auto_163126 ?auto_163129 ) ) ( not ( = ?auto_163126 ?auto_163125 ) ) ( not ( = ?auto_163126 ?auto_163127 ) ) ( not ( = ?auto_163130 ?auto_163128 ) ) ( not ( = ?auto_163130 ?auto_163129 ) ) ( not ( = ?auto_163130 ?auto_163125 ) ) ( not ( = ?auto_163130 ?auto_163127 ) ) ( ON ?auto_163124 ?auto_163130 ) ( ON ?auto_163128 ?auto_163124 ) ( ON ?auto_163127 ?auto_163128 ) ( CLEAR ?auto_163129 ) ( ON ?auto_163125 ?auto_163127 ) ( CLEAR ?auto_163125 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_163122 ?auto_163123 ?auto_163126 ?auto_163130 ?auto_163124 ?auto_163128 ?auto_163127 )
      ( MAKE-2PILE ?auto_163122 ?auto_163123 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_163131 - BLOCK
      ?auto_163132 - BLOCK
    )
    :vars
    (
      ?auto_163137 - BLOCK
      ?auto_163135 - BLOCK
      ?auto_163138 - BLOCK
      ?auto_163139 - BLOCK
      ?auto_163136 - BLOCK
      ?auto_163133 - BLOCK
      ?auto_163134 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_163137 ?auto_163132 ) ( ON-TABLE ?auto_163131 ) ( ON ?auto_163132 ?auto_163131 ) ( not ( = ?auto_163131 ?auto_163132 ) ) ( not ( = ?auto_163131 ?auto_163137 ) ) ( not ( = ?auto_163132 ?auto_163137 ) ) ( not ( = ?auto_163131 ?auto_163135 ) ) ( not ( = ?auto_163131 ?auto_163138 ) ) ( not ( = ?auto_163132 ?auto_163135 ) ) ( not ( = ?auto_163132 ?auto_163138 ) ) ( not ( = ?auto_163137 ?auto_163135 ) ) ( not ( = ?auto_163137 ?auto_163138 ) ) ( not ( = ?auto_163135 ?auto_163138 ) ) ( ON ?auto_163135 ?auto_163137 ) ( not ( = ?auto_163139 ?auto_163136 ) ) ( not ( = ?auto_163139 ?auto_163133 ) ) ( not ( = ?auto_163139 ?auto_163134 ) ) ( not ( = ?auto_163139 ?auto_163138 ) ) ( not ( = ?auto_163136 ?auto_163133 ) ) ( not ( = ?auto_163136 ?auto_163134 ) ) ( not ( = ?auto_163136 ?auto_163138 ) ) ( not ( = ?auto_163133 ?auto_163134 ) ) ( not ( = ?auto_163133 ?auto_163138 ) ) ( not ( = ?auto_163134 ?auto_163138 ) ) ( not ( = ?auto_163131 ?auto_163134 ) ) ( not ( = ?auto_163131 ?auto_163139 ) ) ( not ( = ?auto_163131 ?auto_163136 ) ) ( not ( = ?auto_163131 ?auto_163133 ) ) ( not ( = ?auto_163132 ?auto_163134 ) ) ( not ( = ?auto_163132 ?auto_163139 ) ) ( not ( = ?auto_163132 ?auto_163136 ) ) ( not ( = ?auto_163132 ?auto_163133 ) ) ( not ( = ?auto_163137 ?auto_163134 ) ) ( not ( = ?auto_163137 ?auto_163139 ) ) ( not ( = ?auto_163137 ?auto_163136 ) ) ( not ( = ?auto_163137 ?auto_163133 ) ) ( not ( = ?auto_163135 ?auto_163134 ) ) ( not ( = ?auto_163135 ?auto_163139 ) ) ( not ( = ?auto_163135 ?auto_163136 ) ) ( not ( = ?auto_163135 ?auto_163133 ) ) ( ON ?auto_163138 ?auto_163135 ) ( ON ?auto_163134 ?auto_163138 ) ( ON ?auto_163133 ?auto_163134 ) ( ON ?auto_163136 ?auto_163133 ) ( CLEAR ?auto_163136 ) ( HOLDING ?auto_163139 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_163139 )
      ( MAKE-2PILE ?auto_163131 ?auto_163132 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_163140 - BLOCK
      ?auto_163141 - BLOCK
    )
    :vars
    (
      ?auto_163144 - BLOCK
      ?auto_163148 - BLOCK
      ?auto_163146 - BLOCK
      ?auto_163145 - BLOCK
      ?auto_163147 - BLOCK
      ?auto_163143 - BLOCK
      ?auto_163142 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_163144 ?auto_163141 ) ( ON-TABLE ?auto_163140 ) ( ON ?auto_163141 ?auto_163140 ) ( not ( = ?auto_163140 ?auto_163141 ) ) ( not ( = ?auto_163140 ?auto_163144 ) ) ( not ( = ?auto_163141 ?auto_163144 ) ) ( not ( = ?auto_163140 ?auto_163148 ) ) ( not ( = ?auto_163140 ?auto_163146 ) ) ( not ( = ?auto_163141 ?auto_163148 ) ) ( not ( = ?auto_163141 ?auto_163146 ) ) ( not ( = ?auto_163144 ?auto_163148 ) ) ( not ( = ?auto_163144 ?auto_163146 ) ) ( not ( = ?auto_163148 ?auto_163146 ) ) ( ON ?auto_163148 ?auto_163144 ) ( not ( = ?auto_163145 ?auto_163147 ) ) ( not ( = ?auto_163145 ?auto_163143 ) ) ( not ( = ?auto_163145 ?auto_163142 ) ) ( not ( = ?auto_163145 ?auto_163146 ) ) ( not ( = ?auto_163147 ?auto_163143 ) ) ( not ( = ?auto_163147 ?auto_163142 ) ) ( not ( = ?auto_163147 ?auto_163146 ) ) ( not ( = ?auto_163143 ?auto_163142 ) ) ( not ( = ?auto_163143 ?auto_163146 ) ) ( not ( = ?auto_163142 ?auto_163146 ) ) ( not ( = ?auto_163140 ?auto_163142 ) ) ( not ( = ?auto_163140 ?auto_163145 ) ) ( not ( = ?auto_163140 ?auto_163147 ) ) ( not ( = ?auto_163140 ?auto_163143 ) ) ( not ( = ?auto_163141 ?auto_163142 ) ) ( not ( = ?auto_163141 ?auto_163145 ) ) ( not ( = ?auto_163141 ?auto_163147 ) ) ( not ( = ?auto_163141 ?auto_163143 ) ) ( not ( = ?auto_163144 ?auto_163142 ) ) ( not ( = ?auto_163144 ?auto_163145 ) ) ( not ( = ?auto_163144 ?auto_163147 ) ) ( not ( = ?auto_163144 ?auto_163143 ) ) ( not ( = ?auto_163148 ?auto_163142 ) ) ( not ( = ?auto_163148 ?auto_163145 ) ) ( not ( = ?auto_163148 ?auto_163147 ) ) ( not ( = ?auto_163148 ?auto_163143 ) ) ( ON ?auto_163146 ?auto_163148 ) ( ON ?auto_163142 ?auto_163146 ) ( ON ?auto_163143 ?auto_163142 ) ( ON ?auto_163147 ?auto_163143 ) ( ON ?auto_163145 ?auto_163147 ) ( CLEAR ?auto_163145 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_163140 ?auto_163141 ?auto_163144 ?auto_163148 ?auto_163146 ?auto_163142 ?auto_163143 ?auto_163147 )
      ( MAKE-2PILE ?auto_163140 ?auto_163141 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_163156 - BLOCK
      ?auto_163157 - BLOCK
      ?auto_163158 - BLOCK
      ?auto_163159 - BLOCK
      ?auto_163160 - BLOCK
      ?auto_163161 - BLOCK
      ?auto_163162 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_163162 ) ( CLEAR ?auto_163161 ) ( ON-TABLE ?auto_163156 ) ( ON ?auto_163157 ?auto_163156 ) ( ON ?auto_163158 ?auto_163157 ) ( ON ?auto_163159 ?auto_163158 ) ( ON ?auto_163160 ?auto_163159 ) ( ON ?auto_163161 ?auto_163160 ) ( not ( = ?auto_163156 ?auto_163157 ) ) ( not ( = ?auto_163156 ?auto_163158 ) ) ( not ( = ?auto_163156 ?auto_163159 ) ) ( not ( = ?auto_163156 ?auto_163160 ) ) ( not ( = ?auto_163156 ?auto_163161 ) ) ( not ( = ?auto_163156 ?auto_163162 ) ) ( not ( = ?auto_163157 ?auto_163158 ) ) ( not ( = ?auto_163157 ?auto_163159 ) ) ( not ( = ?auto_163157 ?auto_163160 ) ) ( not ( = ?auto_163157 ?auto_163161 ) ) ( not ( = ?auto_163157 ?auto_163162 ) ) ( not ( = ?auto_163158 ?auto_163159 ) ) ( not ( = ?auto_163158 ?auto_163160 ) ) ( not ( = ?auto_163158 ?auto_163161 ) ) ( not ( = ?auto_163158 ?auto_163162 ) ) ( not ( = ?auto_163159 ?auto_163160 ) ) ( not ( = ?auto_163159 ?auto_163161 ) ) ( not ( = ?auto_163159 ?auto_163162 ) ) ( not ( = ?auto_163160 ?auto_163161 ) ) ( not ( = ?auto_163160 ?auto_163162 ) ) ( not ( = ?auto_163161 ?auto_163162 ) ) )
    :subtasks
    ( ( !STACK ?auto_163162 ?auto_163161 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_163163 - BLOCK
      ?auto_163164 - BLOCK
      ?auto_163165 - BLOCK
      ?auto_163166 - BLOCK
      ?auto_163167 - BLOCK
      ?auto_163168 - BLOCK
      ?auto_163169 - BLOCK
    )
    :vars
    (
      ?auto_163170 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_163168 ) ( ON-TABLE ?auto_163163 ) ( ON ?auto_163164 ?auto_163163 ) ( ON ?auto_163165 ?auto_163164 ) ( ON ?auto_163166 ?auto_163165 ) ( ON ?auto_163167 ?auto_163166 ) ( ON ?auto_163168 ?auto_163167 ) ( not ( = ?auto_163163 ?auto_163164 ) ) ( not ( = ?auto_163163 ?auto_163165 ) ) ( not ( = ?auto_163163 ?auto_163166 ) ) ( not ( = ?auto_163163 ?auto_163167 ) ) ( not ( = ?auto_163163 ?auto_163168 ) ) ( not ( = ?auto_163163 ?auto_163169 ) ) ( not ( = ?auto_163164 ?auto_163165 ) ) ( not ( = ?auto_163164 ?auto_163166 ) ) ( not ( = ?auto_163164 ?auto_163167 ) ) ( not ( = ?auto_163164 ?auto_163168 ) ) ( not ( = ?auto_163164 ?auto_163169 ) ) ( not ( = ?auto_163165 ?auto_163166 ) ) ( not ( = ?auto_163165 ?auto_163167 ) ) ( not ( = ?auto_163165 ?auto_163168 ) ) ( not ( = ?auto_163165 ?auto_163169 ) ) ( not ( = ?auto_163166 ?auto_163167 ) ) ( not ( = ?auto_163166 ?auto_163168 ) ) ( not ( = ?auto_163166 ?auto_163169 ) ) ( not ( = ?auto_163167 ?auto_163168 ) ) ( not ( = ?auto_163167 ?auto_163169 ) ) ( not ( = ?auto_163168 ?auto_163169 ) ) ( ON ?auto_163169 ?auto_163170 ) ( CLEAR ?auto_163169 ) ( HAND-EMPTY ) ( not ( = ?auto_163163 ?auto_163170 ) ) ( not ( = ?auto_163164 ?auto_163170 ) ) ( not ( = ?auto_163165 ?auto_163170 ) ) ( not ( = ?auto_163166 ?auto_163170 ) ) ( not ( = ?auto_163167 ?auto_163170 ) ) ( not ( = ?auto_163168 ?auto_163170 ) ) ( not ( = ?auto_163169 ?auto_163170 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_163169 ?auto_163170 )
      ( MAKE-7PILE ?auto_163163 ?auto_163164 ?auto_163165 ?auto_163166 ?auto_163167 ?auto_163168 ?auto_163169 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_163171 - BLOCK
      ?auto_163172 - BLOCK
      ?auto_163173 - BLOCK
      ?auto_163174 - BLOCK
      ?auto_163175 - BLOCK
      ?auto_163176 - BLOCK
      ?auto_163177 - BLOCK
    )
    :vars
    (
      ?auto_163178 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_163171 ) ( ON ?auto_163172 ?auto_163171 ) ( ON ?auto_163173 ?auto_163172 ) ( ON ?auto_163174 ?auto_163173 ) ( ON ?auto_163175 ?auto_163174 ) ( not ( = ?auto_163171 ?auto_163172 ) ) ( not ( = ?auto_163171 ?auto_163173 ) ) ( not ( = ?auto_163171 ?auto_163174 ) ) ( not ( = ?auto_163171 ?auto_163175 ) ) ( not ( = ?auto_163171 ?auto_163176 ) ) ( not ( = ?auto_163171 ?auto_163177 ) ) ( not ( = ?auto_163172 ?auto_163173 ) ) ( not ( = ?auto_163172 ?auto_163174 ) ) ( not ( = ?auto_163172 ?auto_163175 ) ) ( not ( = ?auto_163172 ?auto_163176 ) ) ( not ( = ?auto_163172 ?auto_163177 ) ) ( not ( = ?auto_163173 ?auto_163174 ) ) ( not ( = ?auto_163173 ?auto_163175 ) ) ( not ( = ?auto_163173 ?auto_163176 ) ) ( not ( = ?auto_163173 ?auto_163177 ) ) ( not ( = ?auto_163174 ?auto_163175 ) ) ( not ( = ?auto_163174 ?auto_163176 ) ) ( not ( = ?auto_163174 ?auto_163177 ) ) ( not ( = ?auto_163175 ?auto_163176 ) ) ( not ( = ?auto_163175 ?auto_163177 ) ) ( not ( = ?auto_163176 ?auto_163177 ) ) ( ON ?auto_163177 ?auto_163178 ) ( CLEAR ?auto_163177 ) ( not ( = ?auto_163171 ?auto_163178 ) ) ( not ( = ?auto_163172 ?auto_163178 ) ) ( not ( = ?auto_163173 ?auto_163178 ) ) ( not ( = ?auto_163174 ?auto_163178 ) ) ( not ( = ?auto_163175 ?auto_163178 ) ) ( not ( = ?auto_163176 ?auto_163178 ) ) ( not ( = ?auto_163177 ?auto_163178 ) ) ( HOLDING ?auto_163176 ) ( CLEAR ?auto_163175 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_163171 ?auto_163172 ?auto_163173 ?auto_163174 ?auto_163175 ?auto_163176 )
      ( MAKE-7PILE ?auto_163171 ?auto_163172 ?auto_163173 ?auto_163174 ?auto_163175 ?auto_163176 ?auto_163177 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_163179 - BLOCK
      ?auto_163180 - BLOCK
      ?auto_163181 - BLOCK
      ?auto_163182 - BLOCK
      ?auto_163183 - BLOCK
      ?auto_163184 - BLOCK
      ?auto_163185 - BLOCK
    )
    :vars
    (
      ?auto_163186 - BLOCK
      ?auto_163187 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_163179 ) ( ON ?auto_163180 ?auto_163179 ) ( ON ?auto_163181 ?auto_163180 ) ( ON ?auto_163182 ?auto_163181 ) ( ON ?auto_163183 ?auto_163182 ) ( not ( = ?auto_163179 ?auto_163180 ) ) ( not ( = ?auto_163179 ?auto_163181 ) ) ( not ( = ?auto_163179 ?auto_163182 ) ) ( not ( = ?auto_163179 ?auto_163183 ) ) ( not ( = ?auto_163179 ?auto_163184 ) ) ( not ( = ?auto_163179 ?auto_163185 ) ) ( not ( = ?auto_163180 ?auto_163181 ) ) ( not ( = ?auto_163180 ?auto_163182 ) ) ( not ( = ?auto_163180 ?auto_163183 ) ) ( not ( = ?auto_163180 ?auto_163184 ) ) ( not ( = ?auto_163180 ?auto_163185 ) ) ( not ( = ?auto_163181 ?auto_163182 ) ) ( not ( = ?auto_163181 ?auto_163183 ) ) ( not ( = ?auto_163181 ?auto_163184 ) ) ( not ( = ?auto_163181 ?auto_163185 ) ) ( not ( = ?auto_163182 ?auto_163183 ) ) ( not ( = ?auto_163182 ?auto_163184 ) ) ( not ( = ?auto_163182 ?auto_163185 ) ) ( not ( = ?auto_163183 ?auto_163184 ) ) ( not ( = ?auto_163183 ?auto_163185 ) ) ( not ( = ?auto_163184 ?auto_163185 ) ) ( ON ?auto_163185 ?auto_163186 ) ( not ( = ?auto_163179 ?auto_163186 ) ) ( not ( = ?auto_163180 ?auto_163186 ) ) ( not ( = ?auto_163181 ?auto_163186 ) ) ( not ( = ?auto_163182 ?auto_163186 ) ) ( not ( = ?auto_163183 ?auto_163186 ) ) ( not ( = ?auto_163184 ?auto_163186 ) ) ( not ( = ?auto_163185 ?auto_163186 ) ) ( CLEAR ?auto_163183 ) ( ON ?auto_163184 ?auto_163185 ) ( CLEAR ?auto_163184 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_163187 ) ( ON ?auto_163186 ?auto_163187 ) ( not ( = ?auto_163187 ?auto_163186 ) ) ( not ( = ?auto_163187 ?auto_163185 ) ) ( not ( = ?auto_163187 ?auto_163184 ) ) ( not ( = ?auto_163179 ?auto_163187 ) ) ( not ( = ?auto_163180 ?auto_163187 ) ) ( not ( = ?auto_163181 ?auto_163187 ) ) ( not ( = ?auto_163182 ?auto_163187 ) ) ( not ( = ?auto_163183 ?auto_163187 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_163187 ?auto_163186 ?auto_163185 )
      ( MAKE-7PILE ?auto_163179 ?auto_163180 ?auto_163181 ?auto_163182 ?auto_163183 ?auto_163184 ?auto_163185 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_163188 - BLOCK
      ?auto_163189 - BLOCK
      ?auto_163190 - BLOCK
      ?auto_163191 - BLOCK
      ?auto_163192 - BLOCK
      ?auto_163193 - BLOCK
      ?auto_163194 - BLOCK
    )
    :vars
    (
      ?auto_163196 - BLOCK
      ?auto_163195 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_163188 ) ( ON ?auto_163189 ?auto_163188 ) ( ON ?auto_163190 ?auto_163189 ) ( ON ?auto_163191 ?auto_163190 ) ( not ( = ?auto_163188 ?auto_163189 ) ) ( not ( = ?auto_163188 ?auto_163190 ) ) ( not ( = ?auto_163188 ?auto_163191 ) ) ( not ( = ?auto_163188 ?auto_163192 ) ) ( not ( = ?auto_163188 ?auto_163193 ) ) ( not ( = ?auto_163188 ?auto_163194 ) ) ( not ( = ?auto_163189 ?auto_163190 ) ) ( not ( = ?auto_163189 ?auto_163191 ) ) ( not ( = ?auto_163189 ?auto_163192 ) ) ( not ( = ?auto_163189 ?auto_163193 ) ) ( not ( = ?auto_163189 ?auto_163194 ) ) ( not ( = ?auto_163190 ?auto_163191 ) ) ( not ( = ?auto_163190 ?auto_163192 ) ) ( not ( = ?auto_163190 ?auto_163193 ) ) ( not ( = ?auto_163190 ?auto_163194 ) ) ( not ( = ?auto_163191 ?auto_163192 ) ) ( not ( = ?auto_163191 ?auto_163193 ) ) ( not ( = ?auto_163191 ?auto_163194 ) ) ( not ( = ?auto_163192 ?auto_163193 ) ) ( not ( = ?auto_163192 ?auto_163194 ) ) ( not ( = ?auto_163193 ?auto_163194 ) ) ( ON ?auto_163194 ?auto_163196 ) ( not ( = ?auto_163188 ?auto_163196 ) ) ( not ( = ?auto_163189 ?auto_163196 ) ) ( not ( = ?auto_163190 ?auto_163196 ) ) ( not ( = ?auto_163191 ?auto_163196 ) ) ( not ( = ?auto_163192 ?auto_163196 ) ) ( not ( = ?auto_163193 ?auto_163196 ) ) ( not ( = ?auto_163194 ?auto_163196 ) ) ( ON ?auto_163193 ?auto_163194 ) ( CLEAR ?auto_163193 ) ( ON-TABLE ?auto_163195 ) ( ON ?auto_163196 ?auto_163195 ) ( not ( = ?auto_163195 ?auto_163196 ) ) ( not ( = ?auto_163195 ?auto_163194 ) ) ( not ( = ?auto_163195 ?auto_163193 ) ) ( not ( = ?auto_163188 ?auto_163195 ) ) ( not ( = ?auto_163189 ?auto_163195 ) ) ( not ( = ?auto_163190 ?auto_163195 ) ) ( not ( = ?auto_163191 ?auto_163195 ) ) ( not ( = ?auto_163192 ?auto_163195 ) ) ( HOLDING ?auto_163192 ) ( CLEAR ?auto_163191 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_163188 ?auto_163189 ?auto_163190 ?auto_163191 ?auto_163192 )
      ( MAKE-7PILE ?auto_163188 ?auto_163189 ?auto_163190 ?auto_163191 ?auto_163192 ?auto_163193 ?auto_163194 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_163197 - BLOCK
      ?auto_163198 - BLOCK
      ?auto_163199 - BLOCK
      ?auto_163200 - BLOCK
      ?auto_163201 - BLOCK
      ?auto_163202 - BLOCK
      ?auto_163203 - BLOCK
    )
    :vars
    (
      ?auto_163205 - BLOCK
      ?auto_163204 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_163197 ) ( ON ?auto_163198 ?auto_163197 ) ( ON ?auto_163199 ?auto_163198 ) ( ON ?auto_163200 ?auto_163199 ) ( not ( = ?auto_163197 ?auto_163198 ) ) ( not ( = ?auto_163197 ?auto_163199 ) ) ( not ( = ?auto_163197 ?auto_163200 ) ) ( not ( = ?auto_163197 ?auto_163201 ) ) ( not ( = ?auto_163197 ?auto_163202 ) ) ( not ( = ?auto_163197 ?auto_163203 ) ) ( not ( = ?auto_163198 ?auto_163199 ) ) ( not ( = ?auto_163198 ?auto_163200 ) ) ( not ( = ?auto_163198 ?auto_163201 ) ) ( not ( = ?auto_163198 ?auto_163202 ) ) ( not ( = ?auto_163198 ?auto_163203 ) ) ( not ( = ?auto_163199 ?auto_163200 ) ) ( not ( = ?auto_163199 ?auto_163201 ) ) ( not ( = ?auto_163199 ?auto_163202 ) ) ( not ( = ?auto_163199 ?auto_163203 ) ) ( not ( = ?auto_163200 ?auto_163201 ) ) ( not ( = ?auto_163200 ?auto_163202 ) ) ( not ( = ?auto_163200 ?auto_163203 ) ) ( not ( = ?auto_163201 ?auto_163202 ) ) ( not ( = ?auto_163201 ?auto_163203 ) ) ( not ( = ?auto_163202 ?auto_163203 ) ) ( ON ?auto_163203 ?auto_163205 ) ( not ( = ?auto_163197 ?auto_163205 ) ) ( not ( = ?auto_163198 ?auto_163205 ) ) ( not ( = ?auto_163199 ?auto_163205 ) ) ( not ( = ?auto_163200 ?auto_163205 ) ) ( not ( = ?auto_163201 ?auto_163205 ) ) ( not ( = ?auto_163202 ?auto_163205 ) ) ( not ( = ?auto_163203 ?auto_163205 ) ) ( ON ?auto_163202 ?auto_163203 ) ( ON-TABLE ?auto_163204 ) ( ON ?auto_163205 ?auto_163204 ) ( not ( = ?auto_163204 ?auto_163205 ) ) ( not ( = ?auto_163204 ?auto_163203 ) ) ( not ( = ?auto_163204 ?auto_163202 ) ) ( not ( = ?auto_163197 ?auto_163204 ) ) ( not ( = ?auto_163198 ?auto_163204 ) ) ( not ( = ?auto_163199 ?auto_163204 ) ) ( not ( = ?auto_163200 ?auto_163204 ) ) ( not ( = ?auto_163201 ?auto_163204 ) ) ( CLEAR ?auto_163200 ) ( ON ?auto_163201 ?auto_163202 ) ( CLEAR ?auto_163201 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_163204 ?auto_163205 ?auto_163203 ?auto_163202 )
      ( MAKE-7PILE ?auto_163197 ?auto_163198 ?auto_163199 ?auto_163200 ?auto_163201 ?auto_163202 ?auto_163203 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_163206 - BLOCK
      ?auto_163207 - BLOCK
      ?auto_163208 - BLOCK
      ?auto_163209 - BLOCK
      ?auto_163210 - BLOCK
      ?auto_163211 - BLOCK
      ?auto_163212 - BLOCK
    )
    :vars
    (
      ?auto_163214 - BLOCK
      ?auto_163213 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_163206 ) ( ON ?auto_163207 ?auto_163206 ) ( ON ?auto_163208 ?auto_163207 ) ( not ( = ?auto_163206 ?auto_163207 ) ) ( not ( = ?auto_163206 ?auto_163208 ) ) ( not ( = ?auto_163206 ?auto_163209 ) ) ( not ( = ?auto_163206 ?auto_163210 ) ) ( not ( = ?auto_163206 ?auto_163211 ) ) ( not ( = ?auto_163206 ?auto_163212 ) ) ( not ( = ?auto_163207 ?auto_163208 ) ) ( not ( = ?auto_163207 ?auto_163209 ) ) ( not ( = ?auto_163207 ?auto_163210 ) ) ( not ( = ?auto_163207 ?auto_163211 ) ) ( not ( = ?auto_163207 ?auto_163212 ) ) ( not ( = ?auto_163208 ?auto_163209 ) ) ( not ( = ?auto_163208 ?auto_163210 ) ) ( not ( = ?auto_163208 ?auto_163211 ) ) ( not ( = ?auto_163208 ?auto_163212 ) ) ( not ( = ?auto_163209 ?auto_163210 ) ) ( not ( = ?auto_163209 ?auto_163211 ) ) ( not ( = ?auto_163209 ?auto_163212 ) ) ( not ( = ?auto_163210 ?auto_163211 ) ) ( not ( = ?auto_163210 ?auto_163212 ) ) ( not ( = ?auto_163211 ?auto_163212 ) ) ( ON ?auto_163212 ?auto_163214 ) ( not ( = ?auto_163206 ?auto_163214 ) ) ( not ( = ?auto_163207 ?auto_163214 ) ) ( not ( = ?auto_163208 ?auto_163214 ) ) ( not ( = ?auto_163209 ?auto_163214 ) ) ( not ( = ?auto_163210 ?auto_163214 ) ) ( not ( = ?auto_163211 ?auto_163214 ) ) ( not ( = ?auto_163212 ?auto_163214 ) ) ( ON ?auto_163211 ?auto_163212 ) ( ON-TABLE ?auto_163213 ) ( ON ?auto_163214 ?auto_163213 ) ( not ( = ?auto_163213 ?auto_163214 ) ) ( not ( = ?auto_163213 ?auto_163212 ) ) ( not ( = ?auto_163213 ?auto_163211 ) ) ( not ( = ?auto_163206 ?auto_163213 ) ) ( not ( = ?auto_163207 ?auto_163213 ) ) ( not ( = ?auto_163208 ?auto_163213 ) ) ( not ( = ?auto_163209 ?auto_163213 ) ) ( not ( = ?auto_163210 ?auto_163213 ) ) ( ON ?auto_163210 ?auto_163211 ) ( CLEAR ?auto_163210 ) ( HOLDING ?auto_163209 ) ( CLEAR ?auto_163208 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_163206 ?auto_163207 ?auto_163208 ?auto_163209 )
      ( MAKE-7PILE ?auto_163206 ?auto_163207 ?auto_163208 ?auto_163209 ?auto_163210 ?auto_163211 ?auto_163212 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_163215 - BLOCK
      ?auto_163216 - BLOCK
      ?auto_163217 - BLOCK
      ?auto_163218 - BLOCK
      ?auto_163219 - BLOCK
      ?auto_163220 - BLOCK
      ?auto_163221 - BLOCK
    )
    :vars
    (
      ?auto_163222 - BLOCK
      ?auto_163223 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_163215 ) ( ON ?auto_163216 ?auto_163215 ) ( ON ?auto_163217 ?auto_163216 ) ( not ( = ?auto_163215 ?auto_163216 ) ) ( not ( = ?auto_163215 ?auto_163217 ) ) ( not ( = ?auto_163215 ?auto_163218 ) ) ( not ( = ?auto_163215 ?auto_163219 ) ) ( not ( = ?auto_163215 ?auto_163220 ) ) ( not ( = ?auto_163215 ?auto_163221 ) ) ( not ( = ?auto_163216 ?auto_163217 ) ) ( not ( = ?auto_163216 ?auto_163218 ) ) ( not ( = ?auto_163216 ?auto_163219 ) ) ( not ( = ?auto_163216 ?auto_163220 ) ) ( not ( = ?auto_163216 ?auto_163221 ) ) ( not ( = ?auto_163217 ?auto_163218 ) ) ( not ( = ?auto_163217 ?auto_163219 ) ) ( not ( = ?auto_163217 ?auto_163220 ) ) ( not ( = ?auto_163217 ?auto_163221 ) ) ( not ( = ?auto_163218 ?auto_163219 ) ) ( not ( = ?auto_163218 ?auto_163220 ) ) ( not ( = ?auto_163218 ?auto_163221 ) ) ( not ( = ?auto_163219 ?auto_163220 ) ) ( not ( = ?auto_163219 ?auto_163221 ) ) ( not ( = ?auto_163220 ?auto_163221 ) ) ( ON ?auto_163221 ?auto_163222 ) ( not ( = ?auto_163215 ?auto_163222 ) ) ( not ( = ?auto_163216 ?auto_163222 ) ) ( not ( = ?auto_163217 ?auto_163222 ) ) ( not ( = ?auto_163218 ?auto_163222 ) ) ( not ( = ?auto_163219 ?auto_163222 ) ) ( not ( = ?auto_163220 ?auto_163222 ) ) ( not ( = ?auto_163221 ?auto_163222 ) ) ( ON ?auto_163220 ?auto_163221 ) ( ON-TABLE ?auto_163223 ) ( ON ?auto_163222 ?auto_163223 ) ( not ( = ?auto_163223 ?auto_163222 ) ) ( not ( = ?auto_163223 ?auto_163221 ) ) ( not ( = ?auto_163223 ?auto_163220 ) ) ( not ( = ?auto_163215 ?auto_163223 ) ) ( not ( = ?auto_163216 ?auto_163223 ) ) ( not ( = ?auto_163217 ?auto_163223 ) ) ( not ( = ?auto_163218 ?auto_163223 ) ) ( not ( = ?auto_163219 ?auto_163223 ) ) ( ON ?auto_163219 ?auto_163220 ) ( CLEAR ?auto_163217 ) ( ON ?auto_163218 ?auto_163219 ) ( CLEAR ?auto_163218 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_163223 ?auto_163222 ?auto_163221 ?auto_163220 ?auto_163219 )
      ( MAKE-7PILE ?auto_163215 ?auto_163216 ?auto_163217 ?auto_163218 ?auto_163219 ?auto_163220 ?auto_163221 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_163224 - BLOCK
      ?auto_163225 - BLOCK
      ?auto_163226 - BLOCK
      ?auto_163227 - BLOCK
      ?auto_163228 - BLOCK
      ?auto_163229 - BLOCK
      ?auto_163230 - BLOCK
    )
    :vars
    (
      ?auto_163231 - BLOCK
      ?auto_163232 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_163224 ) ( ON ?auto_163225 ?auto_163224 ) ( not ( = ?auto_163224 ?auto_163225 ) ) ( not ( = ?auto_163224 ?auto_163226 ) ) ( not ( = ?auto_163224 ?auto_163227 ) ) ( not ( = ?auto_163224 ?auto_163228 ) ) ( not ( = ?auto_163224 ?auto_163229 ) ) ( not ( = ?auto_163224 ?auto_163230 ) ) ( not ( = ?auto_163225 ?auto_163226 ) ) ( not ( = ?auto_163225 ?auto_163227 ) ) ( not ( = ?auto_163225 ?auto_163228 ) ) ( not ( = ?auto_163225 ?auto_163229 ) ) ( not ( = ?auto_163225 ?auto_163230 ) ) ( not ( = ?auto_163226 ?auto_163227 ) ) ( not ( = ?auto_163226 ?auto_163228 ) ) ( not ( = ?auto_163226 ?auto_163229 ) ) ( not ( = ?auto_163226 ?auto_163230 ) ) ( not ( = ?auto_163227 ?auto_163228 ) ) ( not ( = ?auto_163227 ?auto_163229 ) ) ( not ( = ?auto_163227 ?auto_163230 ) ) ( not ( = ?auto_163228 ?auto_163229 ) ) ( not ( = ?auto_163228 ?auto_163230 ) ) ( not ( = ?auto_163229 ?auto_163230 ) ) ( ON ?auto_163230 ?auto_163231 ) ( not ( = ?auto_163224 ?auto_163231 ) ) ( not ( = ?auto_163225 ?auto_163231 ) ) ( not ( = ?auto_163226 ?auto_163231 ) ) ( not ( = ?auto_163227 ?auto_163231 ) ) ( not ( = ?auto_163228 ?auto_163231 ) ) ( not ( = ?auto_163229 ?auto_163231 ) ) ( not ( = ?auto_163230 ?auto_163231 ) ) ( ON ?auto_163229 ?auto_163230 ) ( ON-TABLE ?auto_163232 ) ( ON ?auto_163231 ?auto_163232 ) ( not ( = ?auto_163232 ?auto_163231 ) ) ( not ( = ?auto_163232 ?auto_163230 ) ) ( not ( = ?auto_163232 ?auto_163229 ) ) ( not ( = ?auto_163224 ?auto_163232 ) ) ( not ( = ?auto_163225 ?auto_163232 ) ) ( not ( = ?auto_163226 ?auto_163232 ) ) ( not ( = ?auto_163227 ?auto_163232 ) ) ( not ( = ?auto_163228 ?auto_163232 ) ) ( ON ?auto_163228 ?auto_163229 ) ( ON ?auto_163227 ?auto_163228 ) ( CLEAR ?auto_163227 ) ( HOLDING ?auto_163226 ) ( CLEAR ?auto_163225 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_163224 ?auto_163225 ?auto_163226 )
      ( MAKE-7PILE ?auto_163224 ?auto_163225 ?auto_163226 ?auto_163227 ?auto_163228 ?auto_163229 ?auto_163230 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_163233 - BLOCK
      ?auto_163234 - BLOCK
      ?auto_163235 - BLOCK
      ?auto_163236 - BLOCK
      ?auto_163237 - BLOCK
      ?auto_163238 - BLOCK
      ?auto_163239 - BLOCK
    )
    :vars
    (
      ?auto_163241 - BLOCK
      ?auto_163240 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_163233 ) ( ON ?auto_163234 ?auto_163233 ) ( not ( = ?auto_163233 ?auto_163234 ) ) ( not ( = ?auto_163233 ?auto_163235 ) ) ( not ( = ?auto_163233 ?auto_163236 ) ) ( not ( = ?auto_163233 ?auto_163237 ) ) ( not ( = ?auto_163233 ?auto_163238 ) ) ( not ( = ?auto_163233 ?auto_163239 ) ) ( not ( = ?auto_163234 ?auto_163235 ) ) ( not ( = ?auto_163234 ?auto_163236 ) ) ( not ( = ?auto_163234 ?auto_163237 ) ) ( not ( = ?auto_163234 ?auto_163238 ) ) ( not ( = ?auto_163234 ?auto_163239 ) ) ( not ( = ?auto_163235 ?auto_163236 ) ) ( not ( = ?auto_163235 ?auto_163237 ) ) ( not ( = ?auto_163235 ?auto_163238 ) ) ( not ( = ?auto_163235 ?auto_163239 ) ) ( not ( = ?auto_163236 ?auto_163237 ) ) ( not ( = ?auto_163236 ?auto_163238 ) ) ( not ( = ?auto_163236 ?auto_163239 ) ) ( not ( = ?auto_163237 ?auto_163238 ) ) ( not ( = ?auto_163237 ?auto_163239 ) ) ( not ( = ?auto_163238 ?auto_163239 ) ) ( ON ?auto_163239 ?auto_163241 ) ( not ( = ?auto_163233 ?auto_163241 ) ) ( not ( = ?auto_163234 ?auto_163241 ) ) ( not ( = ?auto_163235 ?auto_163241 ) ) ( not ( = ?auto_163236 ?auto_163241 ) ) ( not ( = ?auto_163237 ?auto_163241 ) ) ( not ( = ?auto_163238 ?auto_163241 ) ) ( not ( = ?auto_163239 ?auto_163241 ) ) ( ON ?auto_163238 ?auto_163239 ) ( ON-TABLE ?auto_163240 ) ( ON ?auto_163241 ?auto_163240 ) ( not ( = ?auto_163240 ?auto_163241 ) ) ( not ( = ?auto_163240 ?auto_163239 ) ) ( not ( = ?auto_163240 ?auto_163238 ) ) ( not ( = ?auto_163233 ?auto_163240 ) ) ( not ( = ?auto_163234 ?auto_163240 ) ) ( not ( = ?auto_163235 ?auto_163240 ) ) ( not ( = ?auto_163236 ?auto_163240 ) ) ( not ( = ?auto_163237 ?auto_163240 ) ) ( ON ?auto_163237 ?auto_163238 ) ( ON ?auto_163236 ?auto_163237 ) ( CLEAR ?auto_163234 ) ( ON ?auto_163235 ?auto_163236 ) ( CLEAR ?auto_163235 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_163240 ?auto_163241 ?auto_163239 ?auto_163238 ?auto_163237 ?auto_163236 )
      ( MAKE-7PILE ?auto_163233 ?auto_163234 ?auto_163235 ?auto_163236 ?auto_163237 ?auto_163238 ?auto_163239 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_163242 - BLOCK
      ?auto_163243 - BLOCK
      ?auto_163244 - BLOCK
      ?auto_163245 - BLOCK
      ?auto_163246 - BLOCK
      ?auto_163247 - BLOCK
      ?auto_163248 - BLOCK
    )
    :vars
    (
      ?auto_163249 - BLOCK
      ?auto_163250 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_163242 ) ( not ( = ?auto_163242 ?auto_163243 ) ) ( not ( = ?auto_163242 ?auto_163244 ) ) ( not ( = ?auto_163242 ?auto_163245 ) ) ( not ( = ?auto_163242 ?auto_163246 ) ) ( not ( = ?auto_163242 ?auto_163247 ) ) ( not ( = ?auto_163242 ?auto_163248 ) ) ( not ( = ?auto_163243 ?auto_163244 ) ) ( not ( = ?auto_163243 ?auto_163245 ) ) ( not ( = ?auto_163243 ?auto_163246 ) ) ( not ( = ?auto_163243 ?auto_163247 ) ) ( not ( = ?auto_163243 ?auto_163248 ) ) ( not ( = ?auto_163244 ?auto_163245 ) ) ( not ( = ?auto_163244 ?auto_163246 ) ) ( not ( = ?auto_163244 ?auto_163247 ) ) ( not ( = ?auto_163244 ?auto_163248 ) ) ( not ( = ?auto_163245 ?auto_163246 ) ) ( not ( = ?auto_163245 ?auto_163247 ) ) ( not ( = ?auto_163245 ?auto_163248 ) ) ( not ( = ?auto_163246 ?auto_163247 ) ) ( not ( = ?auto_163246 ?auto_163248 ) ) ( not ( = ?auto_163247 ?auto_163248 ) ) ( ON ?auto_163248 ?auto_163249 ) ( not ( = ?auto_163242 ?auto_163249 ) ) ( not ( = ?auto_163243 ?auto_163249 ) ) ( not ( = ?auto_163244 ?auto_163249 ) ) ( not ( = ?auto_163245 ?auto_163249 ) ) ( not ( = ?auto_163246 ?auto_163249 ) ) ( not ( = ?auto_163247 ?auto_163249 ) ) ( not ( = ?auto_163248 ?auto_163249 ) ) ( ON ?auto_163247 ?auto_163248 ) ( ON-TABLE ?auto_163250 ) ( ON ?auto_163249 ?auto_163250 ) ( not ( = ?auto_163250 ?auto_163249 ) ) ( not ( = ?auto_163250 ?auto_163248 ) ) ( not ( = ?auto_163250 ?auto_163247 ) ) ( not ( = ?auto_163242 ?auto_163250 ) ) ( not ( = ?auto_163243 ?auto_163250 ) ) ( not ( = ?auto_163244 ?auto_163250 ) ) ( not ( = ?auto_163245 ?auto_163250 ) ) ( not ( = ?auto_163246 ?auto_163250 ) ) ( ON ?auto_163246 ?auto_163247 ) ( ON ?auto_163245 ?auto_163246 ) ( ON ?auto_163244 ?auto_163245 ) ( CLEAR ?auto_163244 ) ( HOLDING ?auto_163243 ) ( CLEAR ?auto_163242 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_163242 ?auto_163243 )
      ( MAKE-7PILE ?auto_163242 ?auto_163243 ?auto_163244 ?auto_163245 ?auto_163246 ?auto_163247 ?auto_163248 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_163251 - BLOCK
      ?auto_163252 - BLOCK
      ?auto_163253 - BLOCK
      ?auto_163254 - BLOCK
      ?auto_163255 - BLOCK
      ?auto_163256 - BLOCK
      ?auto_163257 - BLOCK
    )
    :vars
    (
      ?auto_163258 - BLOCK
      ?auto_163259 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_163251 ) ( not ( = ?auto_163251 ?auto_163252 ) ) ( not ( = ?auto_163251 ?auto_163253 ) ) ( not ( = ?auto_163251 ?auto_163254 ) ) ( not ( = ?auto_163251 ?auto_163255 ) ) ( not ( = ?auto_163251 ?auto_163256 ) ) ( not ( = ?auto_163251 ?auto_163257 ) ) ( not ( = ?auto_163252 ?auto_163253 ) ) ( not ( = ?auto_163252 ?auto_163254 ) ) ( not ( = ?auto_163252 ?auto_163255 ) ) ( not ( = ?auto_163252 ?auto_163256 ) ) ( not ( = ?auto_163252 ?auto_163257 ) ) ( not ( = ?auto_163253 ?auto_163254 ) ) ( not ( = ?auto_163253 ?auto_163255 ) ) ( not ( = ?auto_163253 ?auto_163256 ) ) ( not ( = ?auto_163253 ?auto_163257 ) ) ( not ( = ?auto_163254 ?auto_163255 ) ) ( not ( = ?auto_163254 ?auto_163256 ) ) ( not ( = ?auto_163254 ?auto_163257 ) ) ( not ( = ?auto_163255 ?auto_163256 ) ) ( not ( = ?auto_163255 ?auto_163257 ) ) ( not ( = ?auto_163256 ?auto_163257 ) ) ( ON ?auto_163257 ?auto_163258 ) ( not ( = ?auto_163251 ?auto_163258 ) ) ( not ( = ?auto_163252 ?auto_163258 ) ) ( not ( = ?auto_163253 ?auto_163258 ) ) ( not ( = ?auto_163254 ?auto_163258 ) ) ( not ( = ?auto_163255 ?auto_163258 ) ) ( not ( = ?auto_163256 ?auto_163258 ) ) ( not ( = ?auto_163257 ?auto_163258 ) ) ( ON ?auto_163256 ?auto_163257 ) ( ON-TABLE ?auto_163259 ) ( ON ?auto_163258 ?auto_163259 ) ( not ( = ?auto_163259 ?auto_163258 ) ) ( not ( = ?auto_163259 ?auto_163257 ) ) ( not ( = ?auto_163259 ?auto_163256 ) ) ( not ( = ?auto_163251 ?auto_163259 ) ) ( not ( = ?auto_163252 ?auto_163259 ) ) ( not ( = ?auto_163253 ?auto_163259 ) ) ( not ( = ?auto_163254 ?auto_163259 ) ) ( not ( = ?auto_163255 ?auto_163259 ) ) ( ON ?auto_163255 ?auto_163256 ) ( ON ?auto_163254 ?auto_163255 ) ( ON ?auto_163253 ?auto_163254 ) ( CLEAR ?auto_163251 ) ( ON ?auto_163252 ?auto_163253 ) ( CLEAR ?auto_163252 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_163259 ?auto_163258 ?auto_163257 ?auto_163256 ?auto_163255 ?auto_163254 ?auto_163253 )
      ( MAKE-7PILE ?auto_163251 ?auto_163252 ?auto_163253 ?auto_163254 ?auto_163255 ?auto_163256 ?auto_163257 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_163260 - BLOCK
      ?auto_163261 - BLOCK
      ?auto_163262 - BLOCK
      ?auto_163263 - BLOCK
      ?auto_163264 - BLOCK
      ?auto_163265 - BLOCK
      ?auto_163266 - BLOCK
    )
    :vars
    (
      ?auto_163268 - BLOCK
      ?auto_163267 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_163260 ?auto_163261 ) ) ( not ( = ?auto_163260 ?auto_163262 ) ) ( not ( = ?auto_163260 ?auto_163263 ) ) ( not ( = ?auto_163260 ?auto_163264 ) ) ( not ( = ?auto_163260 ?auto_163265 ) ) ( not ( = ?auto_163260 ?auto_163266 ) ) ( not ( = ?auto_163261 ?auto_163262 ) ) ( not ( = ?auto_163261 ?auto_163263 ) ) ( not ( = ?auto_163261 ?auto_163264 ) ) ( not ( = ?auto_163261 ?auto_163265 ) ) ( not ( = ?auto_163261 ?auto_163266 ) ) ( not ( = ?auto_163262 ?auto_163263 ) ) ( not ( = ?auto_163262 ?auto_163264 ) ) ( not ( = ?auto_163262 ?auto_163265 ) ) ( not ( = ?auto_163262 ?auto_163266 ) ) ( not ( = ?auto_163263 ?auto_163264 ) ) ( not ( = ?auto_163263 ?auto_163265 ) ) ( not ( = ?auto_163263 ?auto_163266 ) ) ( not ( = ?auto_163264 ?auto_163265 ) ) ( not ( = ?auto_163264 ?auto_163266 ) ) ( not ( = ?auto_163265 ?auto_163266 ) ) ( ON ?auto_163266 ?auto_163268 ) ( not ( = ?auto_163260 ?auto_163268 ) ) ( not ( = ?auto_163261 ?auto_163268 ) ) ( not ( = ?auto_163262 ?auto_163268 ) ) ( not ( = ?auto_163263 ?auto_163268 ) ) ( not ( = ?auto_163264 ?auto_163268 ) ) ( not ( = ?auto_163265 ?auto_163268 ) ) ( not ( = ?auto_163266 ?auto_163268 ) ) ( ON ?auto_163265 ?auto_163266 ) ( ON-TABLE ?auto_163267 ) ( ON ?auto_163268 ?auto_163267 ) ( not ( = ?auto_163267 ?auto_163268 ) ) ( not ( = ?auto_163267 ?auto_163266 ) ) ( not ( = ?auto_163267 ?auto_163265 ) ) ( not ( = ?auto_163260 ?auto_163267 ) ) ( not ( = ?auto_163261 ?auto_163267 ) ) ( not ( = ?auto_163262 ?auto_163267 ) ) ( not ( = ?auto_163263 ?auto_163267 ) ) ( not ( = ?auto_163264 ?auto_163267 ) ) ( ON ?auto_163264 ?auto_163265 ) ( ON ?auto_163263 ?auto_163264 ) ( ON ?auto_163262 ?auto_163263 ) ( ON ?auto_163261 ?auto_163262 ) ( CLEAR ?auto_163261 ) ( HOLDING ?auto_163260 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_163260 )
      ( MAKE-7PILE ?auto_163260 ?auto_163261 ?auto_163262 ?auto_163263 ?auto_163264 ?auto_163265 ?auto_163266 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_163269 - BLOCK
      ?auto_163270 - BLOCK
      ?auto_163271 - BLOCK
      ?auto_163272 - BLOCK
      ?auto_163273 - BLOCK
      ?auto_163274 - BLOCK
      ?auto_163275 - BLOCK
    )
    :vars
    (
      ?auto_163277 - BLOCK
      ?auto_163276 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_163269 ?auto_163270 ) ) ( not ( = ?auto_163269 ?auto_163271 ) ) ( not ( = ?auto_163269 ?auto_163272 ) ) ( not ( = ?auto_163269 ?auto_163273 ) ) ( not ( = ?auto_163269 ?auto_163274 ) ) ( not ( = ?auto_163269 ?auto_163275 ) ) ( not ( = ?auto_163270 ?auto_163271 ) ) ( not ( = ?auto_163270 ?auto_163272 ) ) ( not ( = ?auto_163270 ?auto_163273 ) ) ( not ( = ?auto_163270 ?auto_163274 ) ) ( not ( = ?auto_163270 ?auto_163275 ) ) ( not ( = ?auto_163271 ?auto_163272 ) ) ( not ( = ?auto_163271 ?auto_163273 ) ) ( not ( = ?auto_163271 ?auto_163274 ) ) ( not ( = ?auto_163271 ?auto_163275 ) ) ( not ( = ?auto_163272 ?auto_163273 ) ) ( not ( = ?auto_163272 ?auto_163274 ) ) ( not ( = ?auto_163272 ?auto_163275 ) ) ( not ( = ?auto_163273 ?auto_163274 ) ) ( not ( = ?auto_163273 ?auto_163275 ) ) ( not ( = ?auto_163274 ?auto_163275 ) ) ( ON ?auto_163275 ?auto_163277 ) ( not ( = ?auto_163269 ?auto_163277 ) ) ( not ( = ?auto_163270 ?auto_163277 ) ) ( not ( = ?auto_163271 ?auto_163277 ) ) ( not ( = ?auto_163272 ?auto_163277 ) ) ( not ( = ?auto_163273 ?auto_163277 ) ) ( not ( = ?auto_163274 ?auto_163277 ) ) ( not ( = ?auto_163275 ?auto_163277 ) ) ( ON ?auto_163274 ?auto_163275 ) ( ON-TABLE ?auto_163276 ) ( ON ?auto_163277 ?auto_163276 ) ( not ( = ?auto_163276 ?auto_163277 ) ) ( not ( = ?auto_163276 ?auto_163275 ) ) ( not ( = ?auto_163276 ?auto_163274 ) ) ( not ( = ?auto_163269 ?auto_163276 ) ) ( not ( = ?auto_163270 ?auto_163276 ) ) ( not ( = ?auto_163271 ?auto_163276 ) ) ( not ( = ?auto_163272 ?auto_163276 ) ) ( not ( = ?auto_163273 ?auto_163276 ) ) ( ON ?auto_163273 ?auto_163274 ) ( ON ?auto_163272 ?auto_163273 ) ( ON ?auto_163271 ?auto_163272 ) ( ON ?auto_163270 ?auto_163271 ) ( ON ?auto_163269 ?auto_163270 ) ( CLEAR ?auto_163269 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_163276 ?auto_163277 ?auto_163275 ?auto_163274 ?auto_163273 ?auto_163272 ?auto_163271 ?auto_163270 )
      ( MAKE-7PILE ?auto_163269 ?auto_163270 ?auto_163271 ?auto_163272 ?auto_163273 ?auto_163274 ?auto_163275 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_163279 - BLOCK
    )
    :vars
    (
      ?auto_163280 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_163280 ?auto_163279 ) ( CLEAR ?auto_163280 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_163279 ) ( not ( = ?auto_163279 ?auto_163280 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_163280 ?auto_163279 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_163281 - BLOCK
    )
    :vars
    (
      ?auto_163282 - BLOCK
      ?auto_163283 - BLOCK
      ?auto_163284 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_163282 ?auto_163281 ) ( CLEAR ?auto_163282 ) ( ON-TABLE ?auto_163281 ) ( not ( = ?auto_163281 ?auto_163282 ) ) ( HOLDING ?auto_163283 ) ( CLEAR ?auto_163284 ) ( not ( = ?auto_163281 ?auto_163283 ) ) ( not ( = ?auto_163281 ?auto_163284 ) ) ( not ( = ?auto_163282 ?auto_163283 ) ) ( not ( = ?auto_163282 ?auto_163284 ) ) ( not ( = ?auto_163283 ?auto_163284 ) ) )
    :subtasks
    ( ( !STACK ?auto_163283 ?auto_163284 )
      ( MAKE-1PILE ?auto_163281 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_163285 - BLOCK
    )
    :vars
    (
      ?auto_163286 - BLOCK
      ?auto_163287 - BLOCK
      ?auto_163288 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_163286 ?auto_163285 ) ( ON-TABLE ?auto_163285 ) ( not ( = ?auto_163285 ?auto_163286 ) ) ( CLEAR ?auto_163287 ) ( not ( = ?auto_163285 ?auto_163288 ) ) ( not ( = ?auto_163285 ?auto_163287 ) ) ( not ( = ?auto_163286 ?auto_163288 ) ) ( not ( = ?auto_163286 ?auto_163287 ) ) ( not ( = ?auto_163288 ?auto_163287 ) ) ( ON ?auto_163288 ?auto_163286 ) ( CLEAR ?auto_163288 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_163285 ?auto_163286 )
      ( MAKE-1PILE ?auto_163285 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_163289 - BLOCK
    )
    :vars
    (
      ?auto_163291 - BLOCK
      ?auto_163292 - BLOCK
      ?auto_163290 - BLOCK
      ?auto_163293 - BLOCK
      ?auto_163295 - BLOCK
      ?auto_163297 - BLOCK
      ?auto_163294 - BLOCK
      ?auto_163296 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_163291 ?auto_163289 ) ( ON-TABLE ?auto_163289 ) ( not ( = ?auto_163289 ?auto_163291 ) ) ( not ( = ?auto_163289 ?auto_163292 ) ) ( not ( = ?auto_163289 ?auto_163290 ) ) ( not ( = ?auto_163291 ?auto_163292 ) ) ( not ( = ?auto_163291 ?auto_163290 ) ) ( not ( = ?auto_163292 ?auto_163290 ) ) ( ON ?auto_163292 ?auto_163291 ) ( CLEAR ?auto_163292 ) ( HOLDING ?auto_163290 ) ( CLEAR ?auto_163293 ) ( ON-TABLE ?auto_163295 ) ( ON ?auto_163297 ?auto_163295 ) ( ON ?auto_163294 ?auto_163297 ) ( ON ?auto_163296 ?auto_163294 ) ( ON ?auto_163293 ?auto_163296 ) ( not ( = ?auto_163295 ?auto_163297 ) ) ( not ( = ?auto_163295 ?auto_163294 ) ) ( not ( = ?auto_163295 ?auto_163296 ) ) ( not ( = ?auto_163295 ?auto_163293 ) ) ( not ( = ?auto_163295 ?auto_163290 ) ) ( not ( = ?auto_163297 ?auto_163294 ) ) ( not ( = ?auto_163297 ?auto_163296 ) ) ( not ( = ?auto_163297 ?auto_163293 ) ) ( not ( = ?auto_163297 ?auto_163290 ) ) ( not ( = ?auto_163294 ?auto_163296 ) ) ( not ( = ?auto_163294 ?auto_163293 ) ) ( not ( = ?auto_163294 ?auto_163290 ) ) ( not ( = ?auto_163296 ?auto_163293 ) ) ( not ( = ?auto_163296 ?auto_163290 ) ) ( not ( = ?auto_163293 ?auto_163290 ) ) ( not ( = ?auto_163289 ?auto_163293 ) ) ( not ( = ?auto_163289 ?auto_163295 ) ) ( not ( = ?auto_163289 ?auto_163297 ) ) ( not ( = ?auto_163289 ?auto_163294 ) ) ( not ( = ?auto_163289 ?auto_163296 ) ) ( not ( = ?auto_163291 ?auto_163293 ) ) ( not ( = ?auto_163291 ?auto_163295 ) ) ( not ( = ?auto_163291 ?auto_163297 ) ) ( not ( = ?auto_163291 ?auto_163294 ) ) ( not ( = ?auto_163291 ?auto_163296 ) ) ( not ( = ?auto_163292 ?auto_163293 ) ) ( not ( = ?auto_163292 ?auto_163295 ) ) ( not ( = ?auto_163292 ?auto_163297 ) ) ( not ( = ?auto_163292 ?auto_163294 ) ) ( not ( = ?auto_163292 ?auto_163296 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_163295 ?auto_163297 ?auto_163294 ?auto_163296 ?auto_163293 ?auto_163290 )
      ( MAKE-1PILE ?auto_163289 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_163298 - BLOCK
    )
    :vars
    (
      ?auto_163305 - BLOCK
      ?auto_163302 - BLOCK
      ?auto_163300 - BLOCK
      ?auto_163306 - BLOCK
      ?auto_163304 - BLOCK
      ?auto_163303 - BLOCK
      ?auto_163301 - BLOCK
      ?auto_163299 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_163305 ?auto_163298 ) ( ON-TABLE ?auto_163298 ) ( not ( = ?auto_163298 ?auto_163305 ) ) ( not ( = ?auto_163298 ?auto_163302 ) ) ( not ( = ?auto_163298 ?auto_163300 ) ) ( not ( = ?auto_163305 ?auto_163302 ) ) ( not ( = ?auto_163305 ?auto_163300 ) ) ( not ( = ?auto_163302 ?auto_163300 ) ) ( ON ?auto_163302 ?auto_163305 ) ( CLEAR ?auto_163306 ) ( ON-TABLE ?auto_163304 ) ( ON ?auto_163303 ?auto_163304 ) ( ON ?auto_163301 ?auto_163303 ) ( ON ?auto_163299 ?auto_163301 ) ( ON ?auto_163306 ?auto_163299 ) ( not ( = ?auto_163304 ?auto_163303 ) ) ( not ( = ?auto_163304 ?auto_163301 ) ) ( not ( = ?auto_163304 ?auto_163299 ) ) ( not ( = ?auto_163304 ?auto_163306 ) ) ( not ( = ?auto_163304 ?auto_163300 ) ) ( not ( = ?auto_163303 ?auto_163301 ) ) ( not ( = ?auto_163303 ?auto_163299 ) ) ( not ( = ?auto_163303 ?auto_163306 ) ) ( not ( = ?auto_163303 ?auto_163300 ) ) ( not ( = ?auto_163301 ?auto_163299 ) ) ( not ( = ?auto_163301 ?auto_163306 ) ) ( not ( = ?auto_163301 ?auto_163300 ) ) ( not ( = ?auto_163299 ?auto_163306 ) ) ( not ( = ?auto_163299 ?auto_163300 ) ) ( not ( = ?auto_163306 ?auto_163300 ) ) ( not ( = ?auto_163298 ?auto_163306 ) ) ( not ( = ?auto_163298 ?auto_163304 ) ) ( not ( = ?auto_163298 ?auto_163303 ) ) ( not ( = ?auto_163298 ?auto_163301 ) ) ( not ( = ?auto_163298 ?auto_163299 ) ) ( not ( = ?auto_163305 ?auto_163306 ) ) ( not ( = ?auto_163305 ?auto_163304 ) ) ( not ( = ?auto_163305 ?auto_163303 ) ) ( not ( = ?auto_163305 ?auto_163301 ) ) ( not ( = ?auto_163305 ?auto_163299 ) ) ( not ( = ?auto_163302 ?auto_163306 ) ) ( not ( = ?auto_163302 ?auto_163304 ) ) ( not ( = ?auto_163302 ?auto_163303 ) ) ( not ( = ?auto_163302 ?auto_163301 ) ) ( not ( = ?auto_163302 ?auto_163299 ) ) ( ON ?auto_163300 ?auto_163302 ) ( CLEAR ?auto_163300 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_163298 ?auto_163305 ?auto_163302 )
      ( MAKE-1PILE ?auto_163298 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_163307 - BLOCK
    )
    :vars
    (
      ?auto_163315 - BLOCK
      ?auto_163308 - BLOCK
      ?auto_163311 - BLOCK
      ?auto_163310 - BLOCK
      ?auto_163312 - BLOCK
      ?auto_163313 - BLOCK
      ?auto_163309 - BLOCK
      ?auto_163314 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_163315 ?auto_163307 ) ( ON-TABLE ?auto_163307 ) ( not ( = ?auto_163307 ?auto_163315 ) ) ( not ( = ?auto_163307 ?auto_163308 ) ) ( not ( = ?auto_163307 ?auto_163311 ) ) ( not ( = ?auto_163315 ?auto_163308 ) ) ( not ( = ?auto_163315 ?auto_163311 ) ) ( not ( = ?auto_163308 ?auto_163311 ) ) ( ON ?auto_163308 ?auto_163315 ) ( ON-TABLE ?auto_163310 ) ( ON ?auto_163312 ?auto_163310 ) ( ON ?auto_163313 ?auto_163312 ) ( ON ?auto_163309 ?auto_163313 ) ( not ( = ?auto_163310 ?auto_163312 ) ) ( not ( = ?auto_163310 ?auto_163313 ) ) ( not ( = ?auto_163310 ?auto_163309 ) ) ( not ( = ?auto_163310 ?auto_163314 ) ) ( not ( = ?auto_163310 ?auto_163311 ) ) ( not ( = ?auto_163312 ?auto_163313 ) ) ( not ( = ?auto_163312 ?auto_163309 ) ) ( not ( = ?auto_163312 ?auto_163314 ) ) ( not ( = ?auto_163312 ?auto_163311 ) ) ( not ( = ?auto_163313 ?auto_163309 ) ) ( not ( = ?auto_163313 ?auto_163314 ) ) ( not ( = ?auto_163313 ?auto_163311 ) ) ( not ( = ?auto_163309 ?auto_163314 ) ) ( not ( = ?auto_163309 ?auto_163311 ) ) ( not ( = ?auto_163314 ?auto_163311 ) ) ( not ( = ?auto_163307 ?auto_163314 ) ) ( not ( = ?auto_163307 ?auto_163310 ) ) ( not ( = ?auto_163307 ?auto_163312 ) ) ( not ( = ?auto_163307 ?auto_163313 ) ) ( not ( = ?auto_163307 ?auto_163309 ) ) ( not ( = ?auto_163315 ?auto_163314 ) ) ( not ( = ?auto_163315 ?auto_163310 ) ) ( not ( = ?auto_163315 ?auto_163312 ) ) ( not ( = ?auto_163315 ?auto_163313 ) ) ( not ( = ?auto_163315 ?auto_163309 ) ) ( not ( = ?auto_163308 ?auto_163314 ) ) ( not ( = ?auto_163308 ?auto_163310 ) ) ( not ( = ?auto_163308 ?auto_163312 ) ) ( not ( = ?auto_163308 ?auto_163313 ) ) ( not ( = ?auto_163308 ?auto_163309 ) ) ( ON ?auto_163311 ?auto_163308 ) ( CLEAR ?auto_163311 ) ( HOLDING ?auto_163314 ) ( CLEAR ?auto_163309 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_163310 ?auto_163312 ?auto_163313 ?auto_163309 ?auto_163314 )
      ( MAKE-1PILE ?auto_163307 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_163316 - BLOCK
    )
    :vars
    (
      ?auto_163321 - BLOCK
      ?auto_163320 - BLOCK
      ?auto_163317 - BLOCK
      ?auto_163323 - BLOCK
      ?auto_163319 - BLOCK
      ?auto_163324 - BLOCK
      ?auto_163318 - BLOCK
      ?auto_163322 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_163321 ?auto_163316 ) ( ON-TABLE ?auto_163316 ) ( not ( = ?auto_163316 ?auto_163321 ) ) ( not ( = ?auto_163316 ?auto_163320 ) ) ( not ( = ?auto_163316 ?auto_163317 ) ) ( not ( = ?auto_163321 ?auto_163320 ) ) ( not ( = ?auto_163321 ?auto_163317 ) ) ( not ( = ?auto_163320 ?auto_163317 ) ) ( ON ?auto_163320 ?auto_163321 ) ( ON-TABLE ?auto_163323 ) ( ON ?auto_163319 ?auto_163323 ) ( ON ?auto_163324 ?auto_163319 ) ( ON ?auto_163318 ?auto_163324 ) ( not ( = ?auto_163323 ?auto_163319 ) ) ( not ( = ?auto_163323 ?auto_163324 ) ) ( not ( = ?auto_163323 ?auto_163318 ) ) ( not ( = ?auto_163323 ?auto_163322 ) ) ( not ( = ?auto_163323 ?auto_163317 ) ) ( not ( = ?auto_163319 ?auto_163324 ) ) ( not ( = ?auto_163319 ?auto_163318 ) ) ( not ( = ?auto_163319 ?auto_163322 ) ) ( not ( = ?auto_163319 ?auto_163317 ) ) ( not ( = ?auto_163324 ?auto_163318 ) ) ( not ( = ?auto_163324 ?auto_163322 ) ) ( not ( = ?auto_163324 ?auto_163317 ) ) ( not ( = ?auto_163318 ?auto_163322 ) ) ( not ( = ?auto_163318 ?auto_163317 ) ) ( not ( = ?auto_163322 ?auto_163317 ) ) ( not ( = ?auto_163316 ?auto_163322 ) ) ( not ( = ?auto_163316 ?auto_163323 ) ) ( not ( = ?auto_163316 ?auto_163319 ) ) ( not ( = ?auto_163316 ?auto_163324 ) ) ( not ( = ?auto_163316 ?auto_163318 ) ) ( not ( = ?auto_163321 ?auto_163322 ) ) ( not ( = ?auto_163321 ?auto_163323 ) ) ( not ( = ?auto_163321 ?auto_163319 ) ) ( not ( = ?auto_163321 ?auto_163324 ) ) ( not ( = ?auto_163321 ?auto_163318 ) ) ( not ( = ?auto_163320 ?auto_163322 ) ) ( not ( = ?auto_163320 ?auto_163323 ) ) ( not ( = ?auto_163320 ?auto_163319 ) ) ( not ( = ?auto_163320 ?auto_163324 ) ) ( not ( = ?auto_163320 ?auto_163318 ) ) ( ON ?auto_163317 ?auto_163320 ) ( CLEAR ?auto_163318 ) ( ON ?auto_163322 ?auto_163317 ) ( CLEAR ?auto_163322 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_163316 ?auto_163321 ?auto_163320 ?auto_163317 )
      ( MAKE-1PILE ?auto_163316 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_163325 - BLOCK
    )
    :vars
    (
      ?auto_163331 - BLOCK
      ?auto_163333 - BLOCK
      ?auto_163332 - BLOCK
      ?auto_163330 - BLOCK
      ?auto_163327 - BLOCK
      ?auto_163328 - BLOCK
      ?auto_163326 - BLOCK
      ?auto_163329 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_163331 ?auto_163325 ) ( ON-TABLE ?auto_163325 ) ( not ( = ?auto_163325 ?auto_163331 ) ) ( not ( = ?auto_163325 ?auto_163333 ) ) ( not ( = ?auto_163325 ?auto_163332 ) ) ( not ( = ?auto_163331 ?auto_163333 ) ) ( not ( = ?auto_163331 ?auto_163332 ) ) ( not ( = ?auto_163333 ?auto_163332 ) ) ( ON ?auto_163333 ?auto_163331 ) ( ON-TABLE ?auto_163330 ) ( ON ?auto_163327 ?auto_163330 ) ( ON ?auto_163328 ?auto_163327 ) ( not ( = ?auto_163330 ?auto_163327 ) ) ( not ( = ?auto_163330 ?auto_163328 ) ) ( not ( = ?auto_163330 ?auto_163326 ) ) ( not ( = ?auto_163330 ?auto_163329 ) ) ( not ( = ?auto_163330 ?auto_163332 ) ) ( not ( = ?auto_163327 ?auto_163328 ) ) ( not ( = ?auto_163327 ?auto_163326 ) ) ( not ( = ?auto_163327 ?auto_163329 ) ) ( not ( = ?auto_163327 ?auto_163332 ) ) ( not ( = ?auto_163328 ?auto_163326 ) ) ( not ( = ?auto_163328 ?auto_163329 ) ) ( not ( = ?auto_163328 ?auto_163332 ) ) ( not ( = ?auto_163326 ?auto_163329 ) ) ( not ( = ?auto_163326 ?auto_163332 ) ) ( not ( = ?auto_163329 ?auto_163332 ) ) ( not ( = ?auto_163325 ?auto_163329 ) ) ( not ( = ?auto_163325 ?auto_163330 ) ) ( not ( = ?auto_163325 ?auto_163327 ) ) ( not ( = ?auto_163325 ?auto_163328 ) ) ( not ( = ?auto_163325 ?auto_163326 ) ) ( not ( = ?auto_163331 ?auto_163329 ) ) ( not ( = ?auto_163331 ?auto_163330 ) ) ( not ( = ?auto_163331 ?auto_163327 ) ) ( not ( = ?auto_163331 ?auto_163328 ) ) ( not ( = ?auto_163331 ?auto_163326 ) ) ( not ( = ?auto_163333 ?auto_163329 ) ) ( not ( = ?auto_163333 ?auto_163330 ) ) ( not ( = ?auto_163333 ?auto_163327 ) ) ( not ( = ?auto_163333 ?auto_163328 ) ) ( not ( = ?auto_163333 ?auto_163326 ) ) ( ON ?auto_163332 ?auto_163333 ) ( ON ?auto_163329 ?auto_163332 ) ( CLEAR ?auto_163329 ) ( HOLDING ?auto_163326 ) ( CLEAR ?auto_163328 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_163330 ?auto_163327 ?auto_163328 ?auto_163326 )
      ( MAKE-1PILE ?auto_163325 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_163334 - BLOCK
    )
    :vars
    (
      ?auto_163340 - BLOCK
      ?auto_163342 - BLOCK
      ?auto_163336 - BLOCK
      ?auto_163335 - BLOCK
      ?auto_163339 - BLOCK
      ?auto_163338 - BLOCK
      ?auto_163341 - BLOCK
      ?auto_163337 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_163340 ?auto_163334 ) ( ON-TABLE ?auto_163334 ) ( not ( = ?auto_163334 ?auto_163340 ) ) ( not ( = ?auto_163334 ?auto_163342 ) ) ( not ( = ?auto_163334 ?auto_163336 ) ) ( not ( = ?auto_163340 ?auto_163342 ) ) ( not ( = ?auto_163340 ?auto_163336 ) ) ( not ( = ?auto_163342 ?auto_163336 ) ) ( ON ?auto_163342 ?auto_163340 ) ( ON-TABLE ?auto_163335 ) ( ON ?auto_163339 ?auto_163335 ) ( ON ?auto_163338 ?auto_163339 ) ( not ( = ?auto_163335 ?auto_163339 ) ) ( not ( = ?auto_163335 ?auto_163338 ) ) ( not ( = ?auto_163335 ?auto_163341 ) ) ( not ( = ?auto_163335 ?auto_163337 ) ) ( not ( = ?auto_163335 ?auto_163336 ) ) ( not ( = ?auto_163339 ?auto_163338 ) ) ( not ( = ?auto_163339 ?auto_163341 ) ) ( not ( = ?auto_163339 ?auto_163337 ) ) ( not ( = ?auto_163339 ?auto_163336 ) ) ( not ( = ?auto_163338 ?auto_163341 ) ) ( not ( = ?auto_163338 ?auto_163337 ) ) ( not ( = ?auto_163338 ?auto_163336 ) ) ( not ( = ?auto_163341 ?auto_163337 ) ) ( not ( = ?auto_163341 ?auto_163336 ) ) ( not ( = ?auto_163337 ?auto_163336 ) ) ( not ( = ?auto_163334 ?auto_163337 ) ) ( not ( = ?auto_163334 ?auto_163335 ) ) ( not ( = ?auto_163334 ?auto_163339 ) ) ( not ( = ?auto_163334 ?auto_163338 ) ) ( not ( = ?auto_163334 ?auto_163341 ) ) ( not ( = ?auto_163340 ?auto_163337 ) ) ( not ( = ?auto_163340 ?auto_163335 ) ) ( not ( = ?auto_163340 ?auto_163339 ) ) ( not ( = ?auto_163340 ?auto_163338 ) ) ( not ( = ?auto_163340 ?auto_163341 ) ) ( not ( = ?auto_163342 ?auto_163337 ) ) ( not ( = ?auto_163342 ?auto_163335 ) ) ( not ( = ?auto_163342 ?auto_163339 ) ) ( not ( = ?auto_163342 ?auto_163338 ) ) ( not ( = ?auto_163342 ?auto_163341 ) ) ( ON ?auto_163336 ?auto_163342 ) ( ON ?auto_163337 ?auto_163336 ) ( CLEAR ?auto_163338 ) ( ON ?auto_163341 ?auto_163337 ) ( CLEAR ?auto_163341 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_163334 ?auto_163340 ?auto_163342 ?auto_163336 ?auto_163337 )
      ( MAKE-1PILE ?auto_163334 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_163343 - BLOCK
    )
    :vars
    (
      ?auto_163346 - BLOCK
      ?auto_163345 - BLOCK
      ?auto_163349 - BLOCK
      ?auto_163351 - BLOCK
      ?auto_163344 - BLOCK
      ?auto_163347 - BLOCK
      ?auto_163348 - BLOCK
      ?auto_163350 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_163346 ?auto_163343 ) ( ON-TABLE ?auto_163343 ) ( not ( = ?auto_163343 ?auto_163346 ) ) ( not ( = ?auto_163343 ?auto_163345 ) ) ( not ( = ?auto_163343 ?auto_163349 ) ) ( not ( = ?auto_163346 ?auto_163345 ) ) ( not ( = ?auto_163346 ?auto_163349 ) ) ( not ( = ?auto_163345 ?auto_163349 ) ) ( ON ?auto_163345 ?auto_163346 ) ( ON-TABLE ?auto_163351 ) ( ON ?auto_163344 ?auto_163351 ) ( not ( = ?auto_163351 ?auto_163344 ) ) ( not ( = ?auto_163351 ?auto_163347 ) ) ( not ( = ?auto_163351 ?auto_163348 ) ) ( not ( = ?auto_163351 ?auto_163350 ) ) ( not ( = ?auto_163351 ?auto_163349 ) ) ( not ( = ?auto_163344 ?auto_163347 ) ) ( not ( = ?auto_163344 ?auto_163348 ) ) ( not ( = ?auto_163344 ?auto_163350 ) ) ( not ( = ?auto_163344 ?auto_163349 ) ) ( not ( = ?auto_163347 ?auto_163348 ) ) ( not ( = ?auto_163347 ?auto_163350 ) ) ( not ( = ?auto_163347 ?auto_163349 ) ) ( not ( = ?auto_163348 ?auto_163350 ) ) ( not ( = ?auto_163348 ?auto_163349 ) ) ( not ( = ?auto_163350 ?auto_163349 ) ) ( not ( = ?auto_163343 ?auto_163350 ) ) ( not ( = ?auto_163343 ?auto_163351 ) ) ( not ( = ?auto_163343 ?auto_163344 ) ) ( not ( = ?auto_163343 ?auto_163347 ) ) ( not ( = ?auto_163343 ?auto_163348 ) ) ( not ( = ?auto_163346 ?auto_163350 ) ) ( not ( = ?auto_163346 ?auto_163351 ) ) ( not ( = ?auto_163346 ?auto_163344 ) ) ( not ( = ?auto_163346 ?auto_163347 ) ) ( not ( = ?auto_163346 ?auto_163348 ) ) ( not ( = ?auto_163345 ?auto_163350 ) ) ( not ( = ?auto_163345 ?auto_163351 ) ) ( not ( = ?auto_163345 ?auto_163344 ) ) ( not ( = ?auto_163345 ?auto_163347 ) ) ( not ( = ?auto_163345 ?auto_163348 ) ) ( ON ?auto_163349 ?auto_163345 ) ( ON ?auto_163350 ?auto_163349 ) ( ON ?auto_163348 ?auto_163350 ) ( CLEAR ?auto_163348 ) ( HOLDING ?auto_163347 ) ( CLEAR ?auto_163344 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_163351 ?auto_163344 ?auto_163347 )
      ( MAKE-1PILE ?auto_163343 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_163352 - BLOCK
    )
    :vars
    (
      ?auto_163355 - BLOCK
      ?auto_163357 - BLOCK
      ?auto_163354 - BLOCK
      ?auto_163360 - BLOCK
      ?auto_163358 - BLOCK
      ?auto_163353 - BLOCK
      ?auto_163359 - BLOCK
      ?auto_163356 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_163355 ?auto_163352 ) ( ON-TABLE ?auto_163352 ) ( not ( = ?auto_163352 ?auto_163355 ) ) ( not ( = ?auto_163352 ?auto_163357 ) ) ( not ( = ?auto_163352 ?auto_163354 ) ) ( not ( = ?auto_163355 ?auto_163357 ) ) ( not ( = ?auto_163355 ?auto_163354 ) ) ( not ( = ?auto_163357 ?auto_163354 ) ) ( ON ?auto_163357 ?auto_163355 ) ( ON-TABLE ?auto_163360 ) ( ON ?auto_163358 ?auto_163360 ) ( not ( = ?auto_163360 ?auto_163358 ) ) ( not ( = ?auto_163360 ?auto_163353 ) ) ( not ( = ?auto_163360 ?auto_163359 ) ) ( not ( = ?auto_163360 ?auto_163356 ) ) ( not ( = ?auto_163360 ?auto_163354 ) ) ( not ( = ?auto_163358 ?auto_163353 ) ) ( not ( = ?auto_163358 ?auto_163359 ) ) ( not ( = ?auto_163358 ?auto_163356 ) ) ( not ( = ?auto_163358 ?auto_163354 ) ) ( not ( = ?auto_163353 ?auto_163359 ) ) ( not ( = ?auto_163353 ?auto_163356 ) ) ( not ( = ?auto_163353 ?auto_163354 ) ) ( not ( = ?auto_163359 ?auto_163356 ) ) ( not ( = ?auto_163359 ?auto_163354 ) ) ( not ( = ?auto_163356 ?auto_163354 ) ) ( not ( = ?auto_163352 ?auto_163356 ) ) ( not ( = ?auto_163352 ?auto_163360 ) ) ( not ( = ?auto_163352 ?auto_163358 ) ) ( not ( = ?auto_163352 ?auto_163353 ) ) ( not ( = ?auto_163352 ?auto_163359 ) ) ( not ( = ?auto_163355 ?auto_163356 ) ) ( not ( = ?auto_163355 ?auto_163360 ) ) ( not ( = ?auto_163355 ?auto_163358 ) ) ( not ( = ?auto_163355 ?auto_163353 ) ) ( not ( = ?auto_163355 ?auto_163359 ) ) ( not ( = ?auto_163357 ?auto_163356 ) ) ( not ( = ?auto_163357 ?auto_163360 ) ) ( not ( = ?auto_163357 ?auto_163358 ) ) ( not ( = ?auto_163357 ?auto_163353 ) ) ( not ( = ?auto_163357 ?auto_163359 ) ) ( ON ?auto_163354 ?auto_163357 ) ( ON ?auto_163356 ?auto_163354 ) ( ON ?auto_163359 ?auto_163356 ) ( CLEAR ?auto_163358 ) ( ON ?auto_163353 ?auto_163359 ) ( CLEAR ?auto_163353 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_163352 ?auto_163355 ?auto_163357 ?auto_163354 ?auto_163356 ?auto_163359 )
      ( MAKE-1PILE ?auto_163352 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_163361 - BLOCK
    )
    :vars
    (
      ?auto_163364 - BLOCK
      ?auto_163369 - BLOCK
      ?auto_163363 - BLOCK
      ?auto_163367 - BLOCK
      ?auto_163365 - BLOCK
      ?auto_163362 - BLOCK
      ?auto_163368 - BLOCK
      ?auto_163366 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_163364 ?auto_163361 ) ( ON-TABLE ?auto_163361 ) ( not ( = ?auto_163361 ?auto_163364 ) ) ( not ( = ?auto_163361 ?auto_163369 ) ) ( not ( = ?auto_163361 ?auto_163363 ) ) ( not ( = ?auto_163364 ?auto_163369 ) ) ( not ( = ?auto_163364 ?auto_163363 ) ) ( not ( = ?auto_163369 ?auto_163363 ) ) ( ON ?auto_163369 ?auto_163364 ) ( ON-TABLE ?auto_163367 ) ( not ( = ?auto_163367 ?auto_163365 ) ) ( not ( = ?auto_163367 ?auto_163362 ) ) ( not ( = ?auto_163367 ?auto_163368 ) ) ( not ( = ?auto_163367 ?auto_163366 ) ) ( not ( = ?auto_163367 ?auto_163363 ) ) ( not ( = ?auto_163365 ?auto_163362 ) ) ( not ( = ?auto_163365 ?auto_163368 ) ) ( not ( = ?auto_163365 ?auto_163366 ) ) ( not ( = ?auto_163365 ?auto_163363 ) ) ( not ( = ?auto_163362 ?auto_163368 ) ) ( not ( = ?auto_163362 ?auto_163366 ) ) ( not ( = ?auto_163362 ?auto_163363 ) ) ( not ( = ?auto_163368 ?auto_163366 ) ) ( not ( = ?auto_163368 ?auto_163363 ) ) ( not ( = ?auto_163366 ?auto_163363 ) ) ( not ( = ?auto_163361 ?auto_163366 ) ) ( not ( = ?auto_163361 ?auto_163367 ) ) ( not ( = ?auto_163361 ?auto_163365 ) ) ( not ( = ?auto_163361 ?auto_163362 ) ) ( not ( = ?auto_163361 ?auto_163368 ) ) ( not ( = ?auto_163364 ?auto_163366 ) ) ( not ( = ?auto_163364 ?auto_163367 ) ) ( not ( = ?auto_163364 ?auto_163365 ) ) ( not ( = ?auto_163364 ?auto_163362 ) ) ( not ( = ?auto_163364 ?auto_163368 ) ) ( not ( = ?auto_163369 ?auto_163366 ) ) ( not ( = ?auto_163369 ?auto_163367 ) ) ( not ( = ?auto_163369 ?auto_163365 ) ) ( not ( = ?auto_163369 ?auto_163362 ) ) ( not ( = ?auto_163369 ?auto_163368 ) ) ( ON ?auto_163363 ?auto_163369 ) ( ON ?auto_163366 ?auto_163363 ) ( ON ?auto_163368 ?auto_163366 ) ( ON ?auto_163362 ?auto_163368 ) ( CLEAR ?auto_163362 ) ( HOLDING ?auto_163365 ) ( CLEAR ?auto_163367 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_163367 ?auto_163365 )
      ( MAKE-1PILE ?auto_163361 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_163370 - BLOCK
    )
    :vars
    (
      ?auto_163371 - BLOCK
      ?auto_163375 - BLOCK
      ?auto_163374 - BLOCK
      ?auto_163377 - BLOCK
      ?auto_163373 - BLOCK
      ?auto_163378 - BLOCK
      ?auto_163372 - BLOCK
      ?auto_163376 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_163371 ?auto_163370 ) ( ON-TABLE ?auto_163370 ) ( not ( = ?auto_163370 ?auto_163371 ) ) ( not ( = ?auto_163370 ?auto_163375 ) ) ( not ( = ?auto_163370 ?auto_163374 ) ) ( not ( = ?auto_163371 ?auto_163375 ) ) ( not ( = ?auto_163371 ?auto_163374 ) ) ( not ( = ?auto_163375 ?auto_163374 ) ) ( ON ?auto_163375 ?auto_163371 ) ( ON-TABLE ?auto_163377 ) ( not ( = ?auto_163377 ?auto_163373 ) ) ( not ( = ?auto_163377 ?auto_163378 ) ) ( not ( = ?auto_163377 ?auto_163372 ) ) ( not ( = ?auto_163377 ?auto_163376 ) ) ( not ( = ?auto_163377 ?auto_163374 ) ) ( not ( = ?auto_163373 ?auto_163378 ) ) ( not ( = ?auto_163373 ?auto_163372 ) ) ( not ( = ?auto_163373 ?auto_163376 ) ) ( not ( = ?auto_163373 ?auto_163374 ) ) ( not ( = ?auto_163378 ?auto_163372 ) ) ( not ( = ?auto_163378 ?auto_163376 ) ) ( not ( = ?auto_163378 ?auto_163374 ) ) ( not ( = ?auto_163372 ?auto_163376 ) ) ( not ( = ?auto_163372 ?auto_163374 ) ) ( not ( = ?auto_163376 ?auto_163374 ) ) ( not ( = ?auto_163370 ?auto_163376 ) ) ( not ( = ?auto_163370 ?auto_163377 ) ) ( not ( = ?auto_163370 ?auto_163373 ) ) ( not ( = ?auto_163370 ?auto_163378 ) ) ( not ( = ?auto_163370 ?auto_163372 ) ) ( not ( = ?auto_163371 ?auto_163376 ) ) ( not ( = ?auto_163371 ?auto_163377 ) ) ( not ( = ?auto_163371 ?auto_163373 ) ) ( not ( = ?auto_163371 ?auto_163378 ) ) ( not ( = ?auto_163371 ?auto_163372 ) ) ( not ( = ?auto_163375 ?auto_163376 ) ) ( not ( = ?auto_163375 ?auto_163377 ) ) ( not ( = ?auto_163375 ?auto_163373 ) ) ( not ( = ?auto_163375 ?auto_163378 ) ) ( not ( = ?auto_163375 ?auto_163372 ) ) ( ON ?auto_163374 ?auto_163375 ) ( ON ?auto_163376 ?auto_163374 ) ( ON ?auto_163372 ?auto_163376 ) ( ON ?auto_163378 ?auto_163372 ) ( CLEAR ?auto_163377 ) ( ON ?auto_163373 ?auto_163378 ) ( CLEAR ?auto_163373 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_163370 ?auto_163371 ?auto_163375 ?auto_163374 ?auto_163376 ?auto_163372 ?auto_163378 )
      ( MAKE-1PILE ?auto_163370 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_163379 - BLOCK
    )
    :vars
    (
      ?auto_163382 - BLOCK
      ?auto_163380 - BLOCK
      ?auto_163383 - BLOCK
      ?auto_163384 - BLOCK
      ?auto_163385 - BLOCK
      ?auto_163386 - BLOCK
      ?auto_163381 - BLOCK
      ?auto_163387 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_163382 ?auto_163379 ) ( ON-TABLE ?auto_163379 ) ( not ( = ?auto_163379 ?auto_163382 ) ) ( not ( = ?auto_163379 ?auto_163380 ) ) ( not ( = ?auto_163379 ?auto_163383 ) ) ( not ( = ?auto_163382 ?auto_163380 ) ) ( not ( = ?auto_163382 ?auto_163383 ) ) ( not ( = ?auto_163380 ?auto_163383 ) ) ( ON ?auto_163380 ?auto_163382 ) ( not ( = ?auto_163384 ?auto_163385 ) ) ( not ( = ?auto_163384 ?auto_163386 ) ) ( not ( = ?auto_163384 ?auto_163381 ) ) ( not ( = ?auto_163384 ?auto_163387 ) ) ( not ( = ?auto_163384 ?auto_163383 ) ) ( not ( = ?auto_163385 ?auto_163386 ) ) ( not ( = ?auto_163385 ?auto_163381 ) ) ( not ( = ?auto_163385 ?auto_163387 ) ) ( not ( = ?auto_163385 ?auto_163383 ) ) ( not ( = ?auto_163386 ?auto_163381 ) ) ( not ( = ?auto_163386 ?auto_163387 ) ) ( not ( = ?auto_163386 ?auto_163383 ) ) ( not ( = ?auto_163381 ?auto_163387 ) ) ( not ( = ?auto_163381 ?auto_163383 ) ) ( not ( = ?auto_163387 ?auto_163383 ) ) ( not ( = ?auto_163379 ?auto_163387 ) ) ( not ( = ?auto_163379 ?auto_163384 ) ) ( not ( = ?auto_163379 ?auto_163385 ) ) ( not ( = ?auto_163379 ?auto_163386 ) ) ( not ( = ?auto_163379 ?auto_163381 ) ) ( not ( = ?auto_163382 ?auto_163387 ) ) ( not ( = ?auto_163382 ?auto_163384 ) ) ( not ( = ?auto_163382 ?auto_163385 ) ) ( not ( = ?auto_163382 ?auto_163386 ) ) ( not ( = ?auto_163382 ?auto_163381 ) ) ( not ( = ?auto_163380 ?auto_163387 ) ) ( not ( = ?auto_163380 ?auto_163384 ) ) ( not ( = ?auto_163380 ?auto_163385 ) ) ( not ( = ?auto_163380 ?auto_163386 ) ) ( not ( = ?auto_163380 ?auto_163381 ) ) ( ON ?auto_163383 ?auto_163380 ) ( ON ?auto_163387 ?auto_163383 ) ( ON ?auto_163381 ?auto_163387 ) ( ON ?auto_163386 ?auto_163381 ) ( ON ?auto_163385 ?auto_163386 ) ( CLEAR ?auto_163385 ) ( HOLDING ?auto_163384 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_163384 )
      ( MAKE-1PILE ?auto_163379 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_163388 - BLOCK
    )
    :vars
    (
      ?auto_163396 - BLOCK
      ?auto_163395 - BLOCK
      ?auto_163391 - BLOCK
      ?auto_163393 - BLOCK
      ?auto_163389 - BLOCK
      ?auto_163390 - BLOCK
      ?auto_163392 - BLOCK
      ?auto_163394 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_163396 ?auto_163388 ) ( ON-TABLE ?auto_163388 ) ( not ( = ?auto_163388 ?auto_163396 ) ) ( not ( = ?auto_163388 ?auto_163395 ) ) ( not ( = ?auto_163388 ?auto_163391 ) ) ( not ( = ?auto_163396 ?auto_163395 ) ) ( not ( = ?auto_163396 ?auto_163391 ) ) ( not ( = ?auto_163395 ?auto_163391 ) ) ( ON ?auto_163395 ?auto_163396 ) ( not ( = ?auto_163393 ?auto_163389 ) ) ( not ( = ?auto_163393 ?auto_163390 ) ) ( not ( = ?auto_163393 ?auto_163392 ) ) ( not ( = ?auto_163393 ?auto_163394 ) ) ( not ( = ?auto_163393 ?auto_163391 ) ) ( not ( = ?auto_163389 ?auto_163390 ) ) ( not ( = ?auto_163389 ?auto_163392 ) ) ( not ( = ?auto_163389 ?auto_163394 ) ) ( not ( = ?auto_163389 ?auto_163391 ) ) ( not ( = ?auto_163390 ?auto_163392 ) ) ( not ( = ?auto_163390 ?auto_163394 ) ) ( not ( = ?auto_163390 ?auto_163391 ) ) ( not ( = ?auto_163392 ?auto_163394 ) ) ( not ( = ?auto_163392 ?auto_163391 ) ) ( not ( = ?auto_163394 ?auto_163391 ) ) ( not ( = ?auto_163388 ?auto_163394 ) ) ( not ( = ?auto_163388 ?auto_163393 ) ) ( not ( = ?auto_163388 ?auto_163389 ) ) ( not ( = ?auto_163388 ?auto_163390 ) ) ( not ( = ?auto_163388 ?auto_163392 ) ) ( not ( = ?auto_163396 ?auto_163394 ) ) ( not ( = ?auto_163396 ?auto_163393 ) ) ( not ( = ?auto_163396 ?auto_163389 ) ) ( not ( = ?auto_163396 ?auto_163390 ) ) ( not ( = ?auto_163396 ?auto_163392 ) ) ( not ( = ?auto_163395 ?auto_163394 ) ) ( not ( = ?auto_163395 ?auto_163393 ) ) ( not ( = ?auto_163395 ?auto_163389 ) ) ( not ( = ?auto_163395 ?auto_163390 ) ) ( not ( = ?auto_163395 ?auto_163392 ) ) ( ON ?auto_163391 ?auto_163395 ) ( ON ?auto_163394 ?auto_163391 ) ( ON ?auto_163392 ?auto_163394 ) ( ON ?auto_163390 ?auto_163392 ) ( ON ?auto_163389 ?auto_163390 ) ( ON ?auto_163393 ?auto_163389 ) ( CLEAR ?auto_163393 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_163388 ?auto_163396 ?auto_163395 ?auto_163391 ?auto_163394 ?auto_163392 ?auto_163390 ?auto_163389 )
      ( MAKE-1PILE ?auto_163388 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_163405 - BLOCK
      ?auto_163406 - BLOCK
      ?auto_163407 - BLOCK
      ?auto_163408 - BLOCK
      ?auto_163409 - BLOCK
      ?auto_163410 - BLOCK
      ?auto_163411 - BLOCK
      ?auto_163412 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_163412 ) ( CLEAR ?auto_163411 ) ( ON-TABLE ?auto_163405 ) ( ON ?auto_163406 ?auto_163405 ) ( ON ?auto_163407 ?auto_163406 ) ( ON ?auto_163408 ?auto_163407 ) ( ON ?auto_163409 ?auto_163408 ) ( ON ?auto_163410 ?auto_163409 ) ( ON ?auto_163411 ?auto_163410 ) ( not ( = ?auto_163405 ?auto_163406 ) ) ( not ( = ?auto_163405 ?auto_163407 ) ) ( not ( = ?auto_163405 ?auto_163408 ) ) ( not ( = ?auto_163405 ?auto_163409 ) ) ( not ( = ?auto_163405 ?auto_163410 ) ) ( not ( = ?auto_163405 ?auto_163411 ) ) ( not ( = ?auto_163405 ?auto_163412 ) ) ( not ( = ?auto_163406 ?auto_163407 ) ) ( not ( = ?auto_163406 ?auto_163408 ) ) ( not ( = ?auto_163406 ?auto_163409 ) ) ( not ( = ?auto_163406 ?auto_163410 ) ) ( not ( = ?auto_163406 ?auto_163411 ) ) ( not ( = ?auto_163406 ?auto_163412 ) ) ( not ( = ?auto_163407 ?auto_163408 ) ) ( not ( = ?auto_163407 ?auto_163409 ) ) ( not ( = ?auto_163407 ?auto_163410 ) ) ( not ( = ?auto_163407 ?auto_163411 ) ) ( not ( = ?auto_163407 ?auto_163412 ) ) ( not ( = ?auto_163408 ?auto_163409 ) ) ( not ( = ?auto_163408 ?auto_163410 ) ) ( not ( = ?auto_163408 ?auto_163411 ) ) ( not ( = ?auto_163408 ?auto_163412 ) ) ( not ( = ?auto_163409 ?auto_163410 ) ) ( not ( = ?auto_163409 ?auto_163411 ) ) ( not ( = ?auto_163409 ?auto_163412 ) ) ( not ( = ?auto_163410 ?auto_163411 ) ) ( not ( = ?auto_163410 ?auto_163412 ) ) ( not ( = ?auto_163411 ?auto_163412 ) ) )
    :subtasks
    ( ( !STACK ?auto_163412 ?auto_163411 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_163413 - BLOCK
      ?auto_163414 - BLOCK
      ?auto_163415 - BLOCK
      ?auto_163416 - BLOCK
      ?auto_163417 - BLOCK
      ?auto_163418 - BLOCK
      ?auto_163419 - BLOCK
      ?auto_163420 - BLOCK
    )
    :vars
    (
      ?auto_163421 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_163419 ) ( ON-TABLE ?auto_163413 ) ( ON ?auto_163414 ?auto_163413 ) ( ON ?auto_163415 ?auto_163414 ) ( ON ?auto_163416 ?auto_163415 ) ( ON ?auto_163417 ?auto_163416 ) ( ON ?auto_163418 ?auto_163417 ) ( ON ?auto_163419 ?auto_163418 ) ( not ( = ?auto_163413 ?auto_163414 ) ) ( not ( = ?auto_163413 ?auto_163415 ) ) ( not ( = ?auto_163413 ?auto_163416 ) ) ( not ( = ?auto_163413 ?auto_163417 ) ) ( not ( = ?auto_163413 ?auto_163418 ) ) ( not ( = ?auto_163413 ?auto_163419 ) ) ( not ( = ?auto_163413 ?auto_163420 ) ) ( not ( = ?auto_163414 ?auto_163415 ) ) ( not ( = ?auto_163414 ?auto_163416 ) ) ( not ( = ?auto_163414 ?auto_163417 ) ) ( not ( = ?auto_163414 ?auto_163418 ) ) ( not ( = ?auto_163414 ?auto_163419 ) ) ( not ( = ?auto_163414 ?auto_163420 ) ) ( not ( = ?auto_163415 ?auto_163416 ) ) ( not ( = ?auto_163415 ?auto_163417 ) ) ( not ( = ?auto_163415 ?auto_163418 ) ) ( not ( = ?auto_163415 ?auto_163419 ) ) ( not ( = ?auto_163415 ?auto_163420 ) ) ( not ( = ?auto_163416 ?auto_163417 ) ) ( not ( = ?auto_163416 ?auto_163418 ) ) ( not ( = ?auto_163416 ?auto_163419 ) ) ( not ( = ?auto_163416 ?auto_163420 ) ) ( not ( = ?auto_163417 ?auto_163418 ) ) ( not ( = ?auto_163417 ?auto_163419 ) ) ( not ( = ?auto_163417 ?auto_163420 ) ) ( not ( = ?auto_163418 ?auto_163419 ) ) ( not ( = ?auto_163418 ?auto_163420 ) ) ( not ( = ?auto_163419 ?auto_163420 ) ) ( ON ?auto_163420 ?auto_163421 ) ( CLEAR ?auto_163420 ) ( HAND-EMPTY ) ( not ( = ?auto_163413 ?auto_163421 ) ) ( not ( = ?auto_163414 ?auto_163421 ) ) ( not ( = ?auto_163415 ?auto_163421 ) ) ( not ( = ?auto_163416 ?auto_163421 ) ) ( not ( = ?auto_163417 ?auto_163421 ) ) ( not ( = ?auto_163418 ?auto_163421 ) ) ( not ( = ?auto_163419 ?auto_163421 ) ) ( not ( = ?auto_163420 ?auto_163421 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_163420 ?auto_163421 )
      ( MAKE-8PILE ?auto_163413 ?auto_163414 ?auto_163415 ?auto_163416 ?auto_163417 ?auto_163418 ?auto_163419 ?auto_163420 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_163422 - BLOCK
      ?auto_163423 - BLOCK
      ?auto_163424 - BLOCK
      ?auto_163425 - BLOCK
      ?auto_163426 - BLOCK
      ?auto_163427 - BLOCK
      ?auto_163428 - BLOCK
      ?auto_163429 - BLOCK
    )
    :vars
    (
      ?auto_163430 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_163422 ) ( ON ?auto_163423 ?auto_163422 ) ( ON ?auto_163424 ?auto_163423 ) ( ON ?auto_163425 ?auto_163424 ) ( ON ?auto_163426 ?auto_163425 ) ( ON ?auto_163427 ?auto_163426 ) ( not ( = ?auto_163422 ?auto_163423 ) ) ( not ( = ?auto_163422 ?auto_163424 ) ) ( not ( = ?auto_163422 ?auto_163425 ) ) ( not ( = ?auto_163422 ?auto_163426 ) ) ( not ( = ?auto_163422 ?auto_163427 ) ) ( not ( = ?auto_163422 ?auto_163428 ) ) ( not ( = ?auto_163422 ?auto_163429 ) ) ( not ( = ?auto_163423 ?auto_163424 ) ) ( not ( = ?auto_163423 ?auto_163425 ) ) ( not ( = ?auto_163423 ?auto_163426 ) ) ( not ( = ?auto_163423 ?auto_163427 ) ) ( not ( = ?auto_163423 ?auto_163428 ) ) ( not ( = ?auto_163423 ?auto_163429 ) ) ( not ( = ?auto_163424 ?auto_163425 ) ) ( not ( = ?auto_163424 ?auto_163426 ) ) ( not ( = ?auto_163424 ?auto_163427 ) ) ( not ( = ?auto_163424 ?auto_163428 ) ) ( not ( = ?auto_163424 ?auto_163429 ) ) ( not ( = ?auto_163425 ?auto_163426 ) ) ( not ( = ?auto_163425 ?auto_163427 ) ) ( not ( = ?auto_163425 ?auto_163428 ) ) ( not ( = ?auto_163425 ?auto_163429 ) ) ( not ( = ?auto_163426 ?auto_163427 ) ) ( not ( = ?auto_163426 ?auto_163428 ) ) ( not ( = ?auto_163426 ?auto_163429 ) ) ( not ( = ?auto_163427 ?auto_163428 ) ) ( not ( = ?auto_163427 ?auto_163429 ) ) ( not ( = ?auto_163428 ?auto_163429 ) ) ( ON ?auto_163429 ?auto_163430 ) ( CLEAR ?auto_163429 ) ( not ( = ?auto_163422 ?auto_163430 ) ) ( not ( = ?auto_163423 ?auto_163430 ) ) ( not ( = ?auto_163424 ?auto_163430 ) ) ( not ( = ?auto_163425 ?auto_163430 ) ) ( not ( = ?auto_163426 ?auto_163430 ) ) ( not ( = ?auto_163427 ?auto_163430 ) ) ( not ( = ?auto_163428 ?auto_163430 ) ) ( not ( = ?auto_163429 ?auto_163430 ) ) ( HOLDING ?auto_163428 ) ( CLEAR ?auto_163427 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_163422 ?auto_163423 ?auto_163424 ?auto_163425 ?auto_163426 ?auto_163427 ?auto_163428 )
      ( MAKE-8PILE ?auto_163422 ?auto_163423 ?auto_163424 ?auto_163425 ?auto_163426 ?auto_163427 ?auto_163428 ?auto_163429 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_163431 - BLOCK
      ?auto_163432 - BLOCK
      ?auto_163433 - BLOCK
      ?auto_163434 - BLOCK
      ?auto_163435 - BLOCK
      ?auto_163436 - BLOCK
      ?auto_163437 - BLOCK
      ?auto_163438 - BLOCK
    )
    :vars
    (
      ?auto_163439 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_163431 ) ( ON ?auto_163432 ?auto_163431 ) ( ON ?auto_163433 ?auto_163432 ) ( ON ?auto_163434 ?auto_163433 ) ( ON ?auto_163435 ?auto_163434 ) ( ON ?auto_163436 ?auto_163435 ) ( not ( = ?auto_163431 ?auto_163432 ) ) ( not ( = ?auto_163431 ?auto_163433 ) ) ( not ( = ?auto_163431 ?auto_163434 ) ) ( not ( = ?auto_163431 ?auto_163435 ) ) ( not ( = ?auto_163431 ?auto_163436 ) ) ( not ( = ?auto_163431 ?auto_163437 ) ) ( not ( = ?auto_163431 ?auto_163438 ) ) ( not ( = ?auto_163432 ?auto_163433 ) ) ( not ( = ?auto_163432 ?auto_163434 ) ) ( not ( = ?auto_163432 ?auto_163435 ) ) ( not ( = ?auto_163432 ?auto_163436 ) ) ( not ( = ?auto_163432 ?auto_163437 ) ) ( not ( = ?auto_163432 ?auto_163438 ) ) ( not ( = ?auto_163433 ?auto_163434 ) ) ( not ( = ?auto_163433 ?auto_163435 ) ) ( not ( = ?auto_163433 ?auto_163436 ) ) ( not ( = ?auto_163433 ?auto_163437 ) ) ( not ( = ?auto_163433 ?auto_163438 ) ) ( not ( = ?auto_163434 ?auto_163435 ) ) ( not ( = ?auto_163434 ?auto_163436 ) ) ( not ( = ?auto_163434 ?auto_163437 ) ) ( not ( = ?auto_163434 ?auto_163438 ) ) ( not ( = ?auto_163435 ?auto_163436 ) ) ( not ( = ?auto_163435 ?auto_163437 ) ) ( not ( = ?auto_163435 ?auto_163438 ) ) ( not ( = ?auto_163436 ?auto_163437 ) ) ( not ( = ?auto_163436 ?auto_163438 ) ) ( not ( = ?auto_163437 ?auto_163438 ) ) ( ON ?auto_163438 ?auto_163439 ) ( not ( = ?auto_163431 ?auto_163439 ) ) ( not ( = ?auto_163432 ?auto_163439 ) ) ( not ( = ?auto_163433 ?auto_163439 ) ) ( not ( = ?auto_163434 ?auto_163439 ) ) ( not ( = ?auto_163435 ?auto_163439 ) ) ( not ( = ?auto_163436 ?auto_163439 ) ) ( not ( = ?auto_163437 ?auto_163439 ) ) ( not ( = ?auto_163438 ?auto_163439 ) ) ( CLEAR ?auto_163436 ) ( ON ?auto_163437 ?auto_163438 ) ( CLEAR ?auto_163437 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_163439 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_163439 ?auto_163438 )
      ( MAKE-8PILE ?auto_163431 ?auto_163432 ?auto_163433 ?auto_163434 ?auto_163435 ?auto_163436 ?auto_163437 ?auto_163438 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_163440 - BLOCK
      ?auto_163441 - BLOCK
      ?auto_163442 - BLOCK
      ?auto_163443 - BLOCK
      ?auto_163444 - BLOCK
      ?auto_163445 - BLOCK
      ?auto_163446 - BLOCK
      ?auto_163447 - BLOCK
    )
    :vars
    (
      ?auto_163448 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_163440 ) ( ON ?auto_163441 ?auto_163440 ) ( ON ?auto_163442 ?auto_163441 ) ( ON ?auto_163443 ?auto_163442 ) ( ON ?auto_163444 ?auto_163443 ) ( not ( = ?auto_163440 ?auto_163441 ) ) ( not ( = ?auto_163440 ?auto_163442 ) ) ( not ( = ?auto_163440 ?auto_163443 ) ) ( not ( = ?auto_163440 ?auto_163444 ) ) ( not ( = ?auto_163440 ?auto_163445 ) ) ( not ( = ?auto_163440 ?auto_163446 ) ) ( not ( = ?auto_163440 ?auto_163447 ) ) ( not ( = ?auto_163441 ?auto_163442 ) ) ( not ( = ?auto_163441 ?auto_163443 ) ) ( not ( = ?auto_163441 ?auto_163444 ) ) ( not ( = ?auto_163441 ?auto_163445 ) ) ( not ( = ?auto_163441 ?auto_163446 ) ) ( not ( = ?auto_163441 ?auto_163447 ) ) ( not ( = ?auto_163442 ?auto_163443 ) ) ( not ( = ?auto_163442 ?auto_163444 ) ) ( not ( = ?auto_163442 ?auto_163445 ) ) ( not ( = ?auto_163442 ?auto_163446 ) ) ( not ( = ?auto_163442 ?auto_163447 ) ) ( not ( = ?auto_163443 ?auto_163444 ) ) ( not ( = ?auto_163443 ?auto_163445 ) ) ( not ( = ?auto_163443 ?auto_163446 ) ) ( not ( = ?auto_163443 ?auto_163447 ) ) ( not ( = ?auto_163444 ?auto_163445 ) ) ( not ( = ?auto_163444 ?auto_163446 ) ) ( not ( = ?auto_163444 ?auto_163447 ) ) ( not ( = ?auto_163445 ?auto_163446 ) ) ( not ( = ?auto_163445 ?auto_163447 ) ) ( not ( = ?auto_163446 ?auto_163447 ) ) ( ON ?auto_163447 ?auto_163448 ) ( not ( = ?auto_163440 ?auto_163448 ) ) ( not ( = ?auto_163441 ?auto_163448 ) ) ( not ( = ?auto_163442 ?auto_163448 ) ) ( not ( = ?auto_163443 ?auto_163448 ) ) ( not ( = ?auto_163444 ?auto_163448 ) ) ( not ( = ?auto_163445 ?auto_163448 ) ) ( not ( = ?auto_163446 ?auto_163448 ) ) ( not ( = ?auto_163447 ?auto_163448 ) ) ( ON ?auto_163446 ?auto_163447 ) ( CLEAR ?auto_163446 ) ( ON-TABLE ?auto_163448 ) ( HOLDING ?auto_163445 ) ( CLEAR ?auto_163444 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_163440 ?auto_163441 ?auto_163442 ?auto_163443 ?auto_163444 ?auto_163445 )
      ( MAKE-8PILE ?auto_163440 ?auto_163441 ?auto_163442 ?auto_163443 ?auto_163444 ?auto_163445 ?auto_163446 ?auto_163447 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_163449 - BLOCK
      ?auto_163450 - BLOCK
      ?auto_163451 - BLOCK
      ?auto_163452 - BLOCK
      ?auto_163453 - BLOCK
      ?auto_163454 - BLOCK
      ?auto_163455 - BLOCK
      ?auto_163456 - BLOCK
    )
    :vars
    (
      ?auto_163457 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_163449 ) ( ON ?auto_163450 ?auto_163449 ) ( ON ?auto_163451 ?auto_163450 ) ( ON ?auto_163452 ?auto_163451 ) ( ON ?auto_163453 ?auto_163452 ) ( not ( = ?auto_163449 ?auto_163450 ) ) ( not ( = ?auto_163449 ?auto_163451 ) ) ( not ( = ?auto_163449 ?auto_163452 ) ) ( not ( = ?auto_163449 ?auto_163453 ) ) ( not ( = ?auto_163449 ?auto_163454 ) ) ( not ( = ?auto_163449 ?auto_163455 ) ) ( not ( = ?auto_163449 ?auto_163456 ) ) ( not ( = ?auto_163450 ?auto_163451 ) ) ( not ( = ?auto_163450 ?auto_163452 ) ) ( not ( = ?auto_163450 ?auto_163453 ) ) ( not ( = ?auto_163450 ?auto_163454 ) ) ( not ( = ?auto_163450 ?auto_163455 ) ) ( not ( = ?auto_163450 ?auto_163456 ) ) ( not ( = ?auto_163451 ?auto_163452 ) ) ( not ( = ?auto_163451 ?auto_163453 ) ) ( not ( = ?auto_163451 ?auto_163454 ) ) ( not ( = ?auto_163451 ?auto_163455 ) ) ( not ( = ?auto_163451 ?auto_163456 ) ) ( not ( = ?auto_163452 ?auto_163453 ) ) ( not ( = ?auto_163452 ?auto_163454 ) ) ( not ( = ?auto_163452 ?auto_163455 ) ) ( not ( = ?auto_163452 ?auto_163456 ) ) ( not ( = ?auto_163453 ?auto_163454 ) ) ( not ( = ?auto_163453 ?auto_163455 ) ) ( not ( = ?auto_163453 ?auto_163456 ) ) ( not ( = ?auto_163454 ?auto_163455 ) ) ( not ( = ?auto_163454 ?auto_163456 ) ) ( not ( = ?auto_163455 ?auto_163456 ) ) ( ON ?auto_163456 ?auto_163457 ) ( not ( = ?auto_163449 ?auto_163457 ) ) ( not ( = ?auto_163450 ?auto_163457 ) ) ( not ( = ?auto_163451 ?auto_163457 ) ) ( not ( = ?auto_163452 ?auto_163457 ) ) ( not ( = ?auto_163453 ?auto_163457 ) ) ( not ( = ?auto_163454 ?auto_163457 ) ) ( not ( = ?auto_163455 ?auto_163457 ) ) ( not ( = ?auto_163456 ?auto_163457 ) ) ( ON ?auto_163455 ?auto_163456 ) ( ON-TABLE ?auto_163457 ) ( CLEAR ?auto_163453 ) ( ON ?auto_163454 ?auto_163455 ) ( CLEAR ?auto_163454 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_163457 ?auto_163456 ?auto_163455 )
      ( MAKE-8PILE ?auto_163449 ?auto_163450 ?auto_163451 ?auto_163452 ?auto_163453 ?auto_163454 ?auto_163455 ?auto_163456 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_163458 - BLOCK
      ?auto_163459 - BLOCK
      ?auto_163460 - BLOCK
      ?auto_163461 - BLOCK
      ?auto_163462 - BLOCK
      ?auto_163463 - BLOCK
      ?auto_163464 - BLOCK
      ?auto_163465 - BLOCK
    )
    :vars
    (
      ?auto_163466 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_163458 ) ( ON ?auto_163459 ?auto_163458 ) ( ON ?auto_163460 ?auto_163459 ) ( ON ?auto_163461 ?auto_163460 ) ( not ( = ?auto_163458 ?auto_163459 ) ) ( not ( = ?auto_163458 ?auto_163460 ) ) ( not ( = ?auto_163458 ?auto_163461 ) ) ( not ( = ?auto_163458 ?auto_163462 ) ) ( not ( = ?auto_163458 ?auto_163463 ) ) ( not ( = ?auto_163458 ?auto_163464 ) ) ( not ( = ?auto_163458 ?auto_163465 ) ) ( not ( = ?auto_163459 ?auto_163460 ) ) ( not ( = ?auto_163459 ?auto_163461 ) ) ( not ( = ?auto_163459 ?auto_163462 ) ) ( not ( = ?auto_163459 ?auto_163463 ) ) ( not ( = ?auto_163459 ?auto_163464 ) ) ( not ( = ?auto_163459 ?auto_163465 ) ) ( not ( = ?auto_163460 ?auto_163461 ) ) ( not ( = ?auto_163460 ?auto_163462 ) ) ( not ( = ?auto_163460 ?auto_163463 ) ) ( not ( = ?auto_163460 ?auto_163464 ) ) ( not ( = ?auto_163460 ?auto_163465 ) ) ( not ( = ?auto_163461 ?auto_163462 ) ) ( not ( = ?auto_163461 ?auto_163463 ) ) ( not ( = ?auto_163461 ?auto_163464 ) ) ( not ( = ?auto_163461 ?auto_163465 ) ) ( not ( = ?auto_163462 ?auto_163463 ) ) ( not ( = ?auto_163462 ?auto_163464 ) ) ( not ( = ?auto_163462 ?auto_163465 ) ) ( not ( = ?auto_163463 ?auto_163464 ) ) ( not ( = ?auto_163463 ?auto_163465 ) ) ( not ( = ?auto_163464 ?auto_163465 ) ) ( ON ?auto_163465 ?auto_163466 ) ( not ( = ?auto_163458 ?auto_163466 ) ) ( not ( = ?auto_163459 ?auto_163466 ) ) ( not ( = ?auto_163460 ?auto_163466 ) ) ( not ( = ?auto_163461 ?auto_163466 ) ) ( not ( = ?auto_163462 ?auto_163466 ) ) ( not ( = ?auto_163463 ?auto_163466 ) ) ( not ( = ?auto_163464 ?auto_163466 ) ) ( not ( = ?auto_163465 ?auto_163466 ) ) ( ON ?auto_163464 ?auto_163465 ) ( ON-TABLE ?auto_163466 ) ( ON ?auto_163463 ?auto_163464 ) ( CLEAR ?auto_163463 ) ( HOLDING ?auto_163462 ) ( CLEAR ?auto_163461 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_163458 ?auto_163459 ?auto_163460 ?auto_163461 ?auto_163462 )
      ( MAKE-8PILE ?auto_163458 ?auto_163459 ?auto_163460 ?auto_163461 ?auto_163462 ?auto_163463 ?auto_163464 ?auto_163465 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_163467 - BLOCK
      ?auto_163468 - BLOCK
      ?auto_163469 - BLOCK
      ?auto_163470 - BLOCK
      ?auto_163471 - BLOCK
      ?auto_163472 - BLOCK
      ?auto_163473 - BLOCK
      ?auto_163474 - BLOCK
    )
    :vars
    (
      ?auto_163475 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_163467 ) ( ON ?auto_163468 ?auto_163467 ) ( ON ?auto_163469 ?auto_163468 ) ( ON ?auto_163470 ?auto_163469 ) ( not ( = ?auto_163467 ?auto_163468 ) ) ( not ( = ?auto_163467 ?auto_163469 ) ) ( not ( = ?auto_163467 ?auto_163470 ) ) ( not ( = ?auto_163467 ?auto_163471 ) ) ( not ( = ?auto_163467 ?auto_163472 ) ) ( not ( = ?auto_163467 ?auto_163473 ) ) ( not ( = ?auto_163467 ?auto_163474 ) ) ( not ( = ?auto_163468 ?auto_163469 ) ) ( not ( = ?auto_163468 ?auto_163470 ) ) ( not ( = ?auto_163468 ?auto_163471 ) ) ( not ( = ?auto_163468 ?auto_163472 ) ) ( not ( = ?auto_163468 ?auto_163473 ) ) ( not ( = ?auto_163468 ?auto_163474 ) ) ( not ( = ?auto_163469 ?auto_163470 ) ) ( not ( = ?auto_163469 ?auto_163471 ) ) ( not ( = ?auto_163469 ?auto_163472 ) ) ( not ( = ?auto_163469 ?auto_163473 ) ) ( not ( = ?auto_163469 ?auto_163474 ) ) ( not ( = ?auto_163470 ?auto_163471 ) ) ( not ( = ?auto_163470 ?auto_163472 ) ) ( not ( = ?auto_163470 ?auto_163473 ) ) ( not ( = ?auto_163470 ?auto_163474 ) ) ( not ( = ?auto_163471 ?auto_163472 ) ) ( not ( = ?auto_163471 ?auto_163473 ) ) ( not ( = ?auto_163471 ?auto_163474 ) ) ( not ( = ?auto_163472 ?auto_163473 ) ) ( not ( = ?auto_163472 ?auto_163474 ) ) ( not ( = ?auto_163473 ?auto_163474 ) ) ( ON ?auto_163474 ?auto_163475 ) ( not ( = ?auto_163467 ?auto_163475 ) ) ( not ( = ?auto_163468 ?auto_163475 ) ) ( not ( = ?auto_163469 ?auto_163475 ) ) ( not ( = ?auto_163470 ?auto_163475 ) ) ( not ( = ?auto_163471 ?auto_163475 ) ) ( not ( = ?auto_163472 ?auto_163475 ) ) ( not ( = ?auto_163473 ?auto_163475 ) ) ( not ( = ?auto_163474 ?auto_163475 ) ) ( ON ?auto_163473 ?auto_163474 ) ( ON-TABLE ?auto_163475 ) ( ON ?auto_163472 ?auto_163473 ) ( CLEAR ?auto_163470 ) ( ON ?auto_163471 ?auto_163472 ) ( CLEAR ?auto_163471 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_163475 ?auto_163474 ?auto_163473 ?auto_163472 )
      ( MAKE-8PILE ?auto_163467 ?auto_163468 ?auto_163469 ?auto_163470 ?auto_163471 ?auto_163472 ?auto_163473 ?auto_163474 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_163476 - BLOCK
      ?auto_163477 - BLOCK
      ?auto_163478 - BLOCK
      ?auto_163479 - BLOCK
      ?auto_163480 - BLOCK
      ?auto_163481 - BLOCK
      ?auto_163482 - BLOCK
      ?auto_163483 - BLOCK
    )
    :vars
    (
      ?auto_163484 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_163476 ) ( ON ?auto_163477 ?auto_163476 ) ( ON ?auto_163478 ?auto_163477 ) ( not ( = ?auto_163476 ?auto_163477 ) ) ( not ( = ?auto_163476 ?auto_163478 ) ) ( not ( = ?auto_163476 ?auto_163479 ) ) ( not ( = ?auto_163476 ?auto_163480 ) ) ( not ( = ?auto_163476 ?auto_163481 ) ) ( not ( = ?auto_163476 ?auto_163482 ) ) ( not ( = ?auto_163476 ?auto_163483 ) ) ( not ( = ?auto_163477 ?auto_163478 ) ) ( not ( = ?auto_163477 ?auto_163479 ) ) ( not ( = ?auto_163477 ?auto_163480 ) ) ( not ( = ?auto_163477 ?auto_163481 ) ) ( not ( = ?auto_163477 ?auto_163482 ) ) ( not ( = ?auto_163477 ?auto_163483 ) ) ( not ( = ?auto_163478 ?auto_163479 ) ) ( not ( = ?auto_163478 ?auto_163480 ) ) ( not ( = ?auto_163478 ?auto_163481 ) ) ( not ( = ?auto_163478 ?auto_163482 ) ) ( not ( = ?auto_163478 ?auto_163483 ) ) ( not ( = ?auto_163479 ?auto_163480 ) ) ( not ( = ?auto_163479 ?auto_163481 ) ) ( not ( = ?auto_163479 ?auto_163482 ) ) ( not ( = ?auto_163479 ?auto_163483 ) ) ( not ( = ?auto_163480 ?auto_163481 ) ) ( not ( = ?auto_163480 ?auto_163482 ) ) ( not ( = ?auto_163480 ?auto_163483 ) ) ( not ( = ?auto_163481 ?auto_163482 ) ) ( not ( = ?auto_163481 ?auto_163483 ) ) ( not ( = ?auto_163482 ?auto_163483 ) ) ( ON ?auto_163483 ?auto_163484 ) ( not ( = ?auto_163476 ?auto_163484 ) ) ( not ( = ?auto_163477 ?auto_163484 ) ) ( not ( = ?auto_163478 ?auto_163484 ) ) ( not ( = ?auto_163479 ?auto_163484 ) ) ( not ( = ?auto_163480 ?auto_163484 ) ) ( not ( = ?auto_163481 ?auto_163484 ) ) ( not ( = ?auto_163482 ?auto_163484 ) ) ( not ( = ?auto_163483 ?auto_163484 ) ) ( ON ?auto_163482 ?auto_163483 ) ( ON-TABLE ?auto_163484 ) ( ON ?auto_163481 ?auto_163482 ) ( ON ?auto_163480 ?auto_163481 ) ( CLEAR ?auto_163480 ) ( HOLDING ?auto_163479 ) ( CLEAR ?auto_163478 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_163476 ?auto_163477 ?auto_163478 ?auto_163479 )
      ( MAKE-8PILE ?auto_163476 ?auto_163477 ?auto_163478 ?auto_163479 ?auto_163480 ?auto_163481 ?auto_163482 ?auto_163483 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_163485 - BLOCK
      ?auto_163486 - BLOCK
      ?auto_163487 - BLOCK
      ?auto_163488 - BLOCK
      ?auto_163489 - BLOCK
      ?auto_163490 - BLOCK
      ?auto_163491 - BLOCK
      ?auto_163492 - BLOCK
    )
    :vars
    (
      ?auto_163493 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_163485 ) ( ON ?auto_163486 ?auto_163485 ) ( ON ?auto_163487 ?auto_163486 ) ( not ( = ?auto_163485 ?auto_163486 ) ) ( not ( = ?auto_163485 ?auto_163487 ) ) ( not ( = ?auto_163485 ?auto_163488 ) ) ( not ( = ?auto_163485 ?auto_163489 ) ) ( not ( = ?auto_163485 ?auto_163490 ) ) ( not ( = ?auto_163485 ?auto_163491 ) ) ( not ( = ?auto_163485 ?auto_163492 ) ) ( not ( = ?auto_163486 ?auto_163487 ) ) ( not ( = ?auto_163486 ?auto_163488 ) ) ( not ( = ?auto_163486 ?auto_163489 ) ) ( not ( = ?auto_163486 ?auto_163490 ) ) ( not ( = ?auto_163486 ?auto_163491 ) ) ( not ( = ?auto_163486 ?auto_163492 ) ) ( not ( = ?auto_163487 ?auto_163488 ) ) ( not ( = ?auto_163487 ?auto_163489 ) ) ( not ( = ?auto_163487 ?auto_163490 ) ) ( not ( = ?auto_163487 ?auto_163491 ) ) ( not ( = ?auto_163487 ?auto_163492 ) ) ( not ( = ?auto_163488 ?auto_163489 ) ) ( not ( = ?auto_163488 ?auto_163490 ) ) ( not ( = ?auto_163488 ?auto_163491 ) ) ( not ( = ?auto_163488 ?auto_163492 ) ) ( not ( = ?auto_163489 ?auto_163490 ) ) ( not ( = ?auto_163489 ?auto_163491 ) ) ( not ( = ?auto_163489 ?auto_163492 ) ) ( not ( = ?auto_163490 ?auto_163491 ) ) ( not ( = ?auto_163490 ?auto_163492 ) ) ( not ( = ?auto_163491 ?auto_163492 ) ) ( ON ?auto_163492 ?auto_163493 ) ( not ( = ?auto_163485 ?auto_163493 ) ) ( not ( = ?auto_163486 ?auto_163493 ) ) ( not ( = ?auto_163487 ?auto_163493 ) ) ( not ( = ?auto_163488 ?auto_163493 ) ) ( not ( = ?auto_163489 ?auto_163493 ) ) ( not ( = ?auto_163490 ?auto_163493 ) ) ( not ( = ?auto_163491 ?auto_163493 ) ) ( not ( = ?auto_163492 ?auto_163493 ) ) ( ON ?auto_163491 ?auto_163492 ) ( ON-TABLE ?auto_163493 ) ( ON ?auto_163490 ?auto_163491 ) ( ON ?auto_163489 ?auto_163490 ) ( CLEAR ?auto_163487 ) ( ON ?auto_163488 ?auto_163489 ) ( CLEAR ?auto_163488 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_163493 ?auto_163492 ?auto_163491 ?auto_163490 ?auto_163489 )
      ( MAKE-8PILE ?auto_163485 ?auto_163486 ?auto_163487 ?auto_163488 ?auto_163489 ?auto_163490 ?auto_163491 ?auto_163492 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_163494 - BLOCK
      ?auto_163495 - BLOCK
      ?auto_163496 - BLOCK
      ?auto_163497 - BLOCK
      ?auto_163498 - BLOCK
      ?auto_163499 - BLOCK
      ?auto_163500 - BLOCK
      ?auto_163501 - BLOCK
    )
    :vars
    (
      ?auto_163502 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_163494 ) ( ON ?auto_163495 ?auto_163494 ) ( not ( = ?auto_163494 ?auto_163495 ) ) ( not ( = ?auto_163494 ?auto_163496 ) ) ( not ( = ?auto_163494 ?auto_163497 ) ) ( not ( = ?auto_163494 ?auto_163498 ) ) ( not ( = ?auto_163494 ?auto_163499 ) ) ( not ( = ?auto_163494 ?auto_163500 ) ) ( not ( = ?auto_163494 ?auto_163501 ) ) ( not ( = ?auto_163495 ?auto_163496 ) ) ( not ( = ?auto_163495 ?auto_163497 ) ) ( not ( = ?auto_163495 ?auto_163498 ) ) ( not ( = ?auto_163495 ?auto_163499 ) ) ( not ( = ?auto_163495 ?auto_163500 ) ) ( not ( = ?auto_163495 ?auto_163501 ) ) ( not ( = ?auto_163496 ?auto_163497 ) ) ( not ( = ?auto_163496 ?auto_163498 ) ) ( not ( = ?auto_163496 ?auto_163499 ) ) ( not ( = ?auto_163496 ?auto_163500 ) ) ( not ( = ?auto_163496 ?auto_163501 ) ) ( not ( = ?auto_163497 ?auto_163498 ) ) ( not ( = ?auto_163497 ?auto_163499 ) ) ( not ( = ?auto_163497 ?auto_163500 ) ) ( not ( = ?auto_163497 ?auto_163501 ) ) ( not ( = ?auto_163498 ?auto_163499 ) ) ( not ( = ?auto_163498 ?auto_163500 ) ) ( not ( = ?auto_163498 ?auto_163501 ) ) ( not ( = ?auto_163499 ?auto_163500 ) ) ( not ( = ?auto_163499 ?auto_163501 ) ) ( not ( = ?auto_163500 ?auto_163501 ) ) ( ON ?auto_163501 ?auto_163502 ) ( not ( = ?auto_163494 ?auto_163502 ) ) ( not ( = ?auto_163495 ?auto_163502 ) ) ( not ( = ?auto_163496 ?auto_163502 ) ) ( not ( = ?auto_163497 ?auto_163502 ) ) ( not ( = ?auto_163498 ?auto_163502 ) ) ( not ( = ?auto_163499 ?auto_163502 ) ) ( not ( = ?auto_163500 ?auto_163502 ) ) ( not ( = ?auto_163501 ?auto_163502 ) ) ( ON ?auto_163500 ?auto_163501 ) ( ON-TABLE ?auto_163502 ) ( ON ?auto_163499 ?auto_163500 ) ( ON ?auto_163498 ?auto_163499 ) ( ON ?auto_163497 ?auto_163498 ) ( CLEAR ?auto_163497 ) ( HOLDING ?auto_163496 ) ( CLEAR ?auto_163495 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_163494 ?auto_163495 ?auto_163496 )
      ( MAKE-8PILE ?auto_163494 ?auto_163495 ?auto_163496 ?auto_163497 ?auto_163498 ?auto_163499 ?auto_163500 ?auto_163501 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_163503 - BLOCK
      ?auto_163504 - BLOCK
      ?auto_163505 - BLOCK
      ?auto_163506 - BLOCK
      ?auto_163507 - BLOCK
      ?auto_163508 - BLOCK
      ?auto_163509 - BLOCK
      ?auto_163510 - BLOCK
    )
    :vars
    (
      ?auto_163511 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_163503 ) ( ON ?auto_163504 ?auto_163503 ) ( not ( = ?auto_163503 ?auto_163504 ) ) ( not ( = ?auto_163503 ?auto_163505 ) ) ( not ( = ?auto_163503 ?auto_163506 ) ) ( not ( = ?auto_163503 ?auto_163507 ) ) ( not ( = ?auto_163503 ?auto_163508 ) ) ( not ( = ?auto_163503 ?auto_163509 ) ) ( not ( = ?auto_163503 ?auto_163510 ) ) ( not ( = ?auto_163504 ?auto_163505 ) ) ( not ( = ?auto_163504 ?auto_163506 ) ) ( not ( = ?auto_163504 ?auto_163507 ) ) ( not ( = ?auto_163504 ?auto_163508 ) ) ( not ( = ?auto_163504 ?auto_163509 ) ) ( not ( = ?auto_163504 ?auto_163510 ) ) ( not ( = ?auto_163505 ?auto_163506 ) ) ( not ( = ?auto_163505 ?auto_163507 ) ) ( not ( = ?auto_163505 ?auto_163508 ) ) ( not ( = ?auto_163505 ?auto_163509 ) ) ( not ( = ?auto_163505 ?auto_163510 ) ) ( not ( = ?auto_163506 ?auto_163507 ) ) ( not ( = ?auto_163506 ?auto_163508 ) ) ( not ( = ?auto_163506 ?auto_163509 ) ) ( not ( = ?auto_163506 ?auto_163510 ) ) ( not ( = ?auto_163507 ?auto_163508 ) ) ( not ( = ?auto_163507 ?auto_163509 ) ) ( not ( = ?auto_163507 ?auto_163510 ) ) ( not ( = ?auto_163508 ?auto_163509 ) ) ( not ( = ?auto_163508 ?auto_163510 ) ) ( not ( = ?auto_163509 ?auto_163510 ) ) ( ON ?auto_163510 ?auto_163511 ) ( not ( = ?auto_163503 ?auto_163511 ) ) ( not ( = ?auto_163504 ?auto_163511 ) ) ( not ( = ?auto_163505 ?auto_163511 ) ) ( not ( = ?auto_163506 ?auto_163511 ) ) ( not ( = ?auto_163507 ?auto_163511 ) ) ( not ( = ?auto_163508 ?auto_163511 ) ) ( not ( = ?auto_163509 ?auto_163511 ) ) ( not ( = ?auto_163510 ?auto_163511 ) ) ( ON ?auto_163509 ?auto_163510 ) ( ON-TABLE ?auto_163511 ) ( ON ?auto_163508 ?auto_163509 ) ( ON ?auto_163507 ?auto_163508 ) ( ON ?auto_163506 ?auto_163507 ) ( CLEAR ?auto_163504 ) ( ON ?auto_163505 ?auto_163506 ) ( CLEAR ?auto_163505 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_163511 ?auto_163510 ?auto_163509 ?auto_163508 ?auto_163507 ?auto_163506 )
      ( MAKE-8PILE ?auto_163503 ?auto_163504 ?auto_163505 ?auto_163506 ?auto_163507 ?auto_163508 ?auto_163509 ?auto_163510 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_163512 - BLOCK
      ?auto_163513 - BLOCK
      ?auto_163514 - BLOCK
      ?auto_163515 - BLOCK
      ?auto_163516 - BLOCK
      ?auto_163517 - BLOCK
      ?auto_163518 - BLOCK
      ?auto_163519 - BLOCK
    )
    :vars
    (
      ?auto_163520 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_163512 ) ( not ( = ?auto_163512 ?auto_163513 ) ) ( not ( = ?auto_163512 ?auto_163514 ) ) ( not ( = ?auto_163512 ?auto_163515 ) ) ( not ( = ?auto_163512 ?auto_163516 ) ) ( not ( = ?auto_163512 ?auto_163517 ) ) ( not ( = ?auto_163512 ?auto_163518 ) ) ( not ( = ?auto_163512 ?auto_163519 ) ) ( not ( = ?auto_163513 ?auto_163514 ) ) ( not ( = ?auto_163513 ?auto_163515 ) ) ( not ( = ?auto_163513 ?auto_163516 ) ) ( not ( = ?auto_163513 ?auto_163517 ) ) ( not ( = ?auto_163513 ?auto_163518 ) ) ( not ( = ?auto_163513 ?auto_163519 ) ) ( not ( = ?auto_163514 ?auto_163515 ) ) ( not ( = ?auto_163514 ?auto_163516 ) ) ( not ( = ?auto_163514 ?auto_163517 ) ) ( not ( = ?auto_163514 ?auto_163518 ) ) ( not ( = ?auto_163514 ?auto_163519 ) ) ( not ( = ?auto_163515 ?auto_163516 ) ) ( not ( = ?auto_163515 ?auto_163517 ) ) ( not ( = ?auto_163515 ?auto_163518 ) ) ( not ( = ?auto_163515 ?auto_163519 ) ) ( not ( = ?auto_163516 ?auto_163517 ) ) ( not ( = ?auto_163516 ?auto_163518 ) ) ( not ( = ?auto_163516 ?auto_163519 ) ) ( not ( = ?auto_163517 ?auto_163518 ) ) ( not ( = ?auto_163517 ?auto_163519 ) ) ( not ( = ?auto_163518 ?auto_163519 ) ) ( ON ?auto_163519 ?auto_163520 ) ( not ( = ?auto_163512 ?auto_163520 ) ) ( not ( = ?auto_163513 ?auto_163520 ) ) ( not ( = ?auto_163514 ?auto_163520 ) ) ( not ( = ?auto_163515 ?auto_163520 ) ) ( not ( = ?auto_163516 ?auto_163520 ) ) ( not ( = ?auto_163517 ?auto_163520 ) ) ( not ( = ?auto_163518 ?auto_163520 ) ) ( not ( = ?auto_163519 ?auto_163520 ) ) ( ON ?auto_163518 ?auto_163519 ) ( ON-TABLE ?auto_163520 ) ( ON ?auto_163517 ?auto_163518 ) ( ON ?auto_163516 ?auto_163517 ) ( ON ?auto_163515 ?auto_163516 ) ( ON ?auto_163514 ?auto_163515 ) ( CLEAR ?auto_163514 ) ( HOLDING ?auto_163513 ) ( CLEAR ?auto_163512 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_163512 ?auto_163513 )
      ( MAKE-8PILE ?auto_163512 ?auto_163513 ?auto_163514 ?auto_163515 ?auto_163516 ?auto_163517 ?auto_163518 ?auto_163519 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_163521 - BLOCK
      ?auto_163522 - BLOCK
      ?auto_163523 - BLOCK
      ?auto_163524 - BLOCK
      ?auto_163525 - BLOCK
      ?auto_163526 - BLOCK
      ?auto_163527 - BLOCK
      ?auto_163528 - BLOCK
    )
    :vars
    (
      ?auto_163529 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_163521 ) ( not ( = ?auto_163521 ?auto_163522 ) ) ( not ( = ?auto_163521 ?auto_163523 ) ) ( not ( = ?auto_163521 ?auto_163524 ) ) ( not ( = ?auto_163521 ?auto_163525 ) ) ( not ( = ?auto_163521 ?auto_163526 ) ) ( not ( = ?auto_163521 ?auto_163527 ) ) ( not ( = ?auto_163521 ?auto_163528 ) ) ( not ( = ?auto_163522 ?auto_163523 ) ) ( not ( = ?auto_163522 ?auto_163524 ) ) ( not ( = ?auto_163522 ?auto_163525 ) ) ( not ( = ?auto_163522 ?auto_163526 ) ) ( not ( = ?auto_163522 ?auto_163527 ) ) ( not ( = ?auto_163522 ?auto_163528 ) ) ( not ( = ?auto_163523 ?auto_163524 ) ) ( not ( = ?auto_163523 ?auto_163525 ) ) ( not ( = ?auto_163523 ?auto_163526 ) ) ( not ( = ?auto_163523 ?auto_163527 ) ) ( not ( = ?auto_163523 ?auto_163528 ) ) ( not ( = ?auto_163524 ?auto_163525 ) ) ( not ( = ?auto_163524 ?auto_163526 ) ) ( not ( = ?auto_163524 ?auto_163527 ) ) ( not ( = ?auto_163524 ?auto_163528 ) ) ( not ( = ?auto_163525 ?auto_163526 ) ) ( not ( = ?auto_163525 ?auto_163527 ) ) ( not ( = ?auto_163525 ?auto_163528 ) ) ( not ( = ?auto_163526 ?auto_163527 ) ) ( not ( = ?auto_163526 ?auto_163528 ) ) ( not ( = ?auto_163527 ?auto_163528 ) ) ( ON ?auto_163528 ?auto_163529 ) ( not ( = ?auto_163521 ?auto_163529 ) ) ( not ( = ?auto_163522 ?auto_163529 ) ) ( not ( = ?auto_163523 ?auto_163529 ) ) ( not ( = ?auto_163524 ?auto_163529 ) ) ( not ( = ?auto_163525 ?auto_163529 ) ) ( not ( = ?auto_163526 ?auto_163529 ) ) ( not ( = ?auto_163527 ?auto_163529 ) ) ( not ( = ?auto_163528 ?auto_163529 ) ) ( ON ?auto_163527 ?auto_163528 ) ( ON-TABLE ?auto_163529 ) ( ON ?auto_163526 ?auto_163527 ) ( ON ?auto_163525 ?auto_163526 ) ( ON ?auto_163524 ?auto_163525 ) ( ON ?auto_163523 ?auto_163524 ) ( CLEAR ?auto_163521 ) ( ON ?auto_163522 ?auto_163523 ) ( CLEAR ?auto_163522 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_163529 ?auto_163528 ?auto_163527 ?auto_163526 ?auto_163525 ?auto_163524 ?auto_163523 )
      ( MAKE-8PILE ?auto_163521 ?auto_163522 ?auto_163523 ?auto_163524 ?auto_163525 ?auto_163526 ?auto_163527 ?auto_163528 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_163530 - BLOCK
      ?auto_163531 - BLOCK
      ?auto_163532 - BLOCK
      ?auto_163533 - BLOCK
      ?auto_163534 - BLOCK
      ?auto_163535 - BLOCK
      ?auto_163536 - BLOCK
      ?auto_163537 - BLOCK
    )
    :vars
    (
      ?auto_163538 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_163530 ?auto_163531 ) ) ( not ( = ?auto_163530 ?auto_163532 ) ) ( not ( = ?auto_163530 ?auto_163533 ) ) ( not ( = ?auto_163530 ?auto_163534 ) ) ( not ( = ?auto_163530 ?auto_163535 ) ) ( not ( = ?auto_163530 ?auto_163536 ) ) ( not ( = ?auto_163530 ?auto_163537 ) ) ( not ( = ?auto_163531 ?auto_163532 ) ) ( not ( = ?auto_163531 ?auto_163533 ) ) ( not ( = ?auto_163531 ?auto_163534 ) ) ( not ( = ?auto_163531 ?auto_163535 ) ) ( not ( = ?auto_163531 ?auto_163536 ) ) ( not ( = ?auto_163531 ?auto_163537 ) ) ( not ( = ?auto_163532 ?auto_163533 ) ) ( not ( = ?auto_163532 ?auto_163534 ) ) ( not ( = ?auto_163532 ?auto_163535 ) ) ( not ( = ?auto_163532 ?auto_163536 ) ) ( not ( = ?auto_163532 ?auto_163537 ) ) ( not ( = ?auto_163533 ?auto_163534 ) ) ( not ( = ?auto_163533 ?auto_163535 ) ) ( not ( = ?auto_163533 ?auto_163536 ) ) ( not ( = ?auto_163533 ?auto_163537 ) ) ( not ( = ?auto_163534 ?auto_163535 ) ) ( not ( = ?auto_163534 ?auto_163536 ) ) ( not ( = ?auto_163534 ?auto_163537 ) ) ( not ( = ?auto_163535 ?auto_163536 ) ) ( not ( = ?auto_163535 ?auto_163537 ) ) ( not ( = ?auto_163536 ?auto_163537 ) ) ( ON ?auto_163537 ?auto_163538 ) ( not ( = ?auto_163530 ?auto_163538 ) ) ( not ( = ?auto_163531 ?auto_163538 ) ) ( not ( = ?auto_163532 ?auto_163538 ) ) ( not ( = ?auto_163533 ?auto_163538 ) ) ( not ( = ?auto_163534 ?auto_163538 ) ) ( not ( = ?auto_163535 ?auto_163538 ) ) ( not ( = ?auto_163536 ?auto_163538 ) ) ( not ( = ?auto_163537 ?auto_163538 ) ) ( ON ?auto_163536 ?auto_163537 ) ( ON-TABLE ?auto_163538 ) ( ON ?auto_163535 ?auto_163536 ) ( ON ?auto_163534 ?auto_163535 ) ( ON ?auto_163533 ?auto_163534 ) ( ON ?auto_163532 ?auto_163533 ) ( ON ?auto_163531 ?auto_163532 ) ( CLEAR ?auto_163531 ) ( HOLDING ?auto_163530 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_163530 )
      ( MAKE-8PILE ?auto_163530 ?auto_163531 ?auto_163532 ?auto_163533 ?auto_163534 ?auto_163535 ?auto_163536 ?auto_163537 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_163539 - BLOCK
      ?auto_163540 - BLOCK
      ?auto_163541 - BLOCK
      ?auto_163542 - BLOCK
      ?auto_163543 - BLOCK
      ?auto_163544 - BLOCK
      ?auto_163545 - BLOCK
      ?auto_163546 - BLOCK
    )
    :vars
    (
      ?auto_163547 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_163539 ?auto_163540 ) ) ( not ( = ?auto_163539 ?auto_163541 ) ) ( not ( = ?auto_163539 ?auto_163542 ) ) ( not ( = ?auto_163539 ?auto_163543 ) ) ( not ( = ?auto_163539 ?auto_163544 ) ) ( not ( = ?auto_163539 ?auto_163545 ) ) ( not ( = ?auto_163539 ?auto_163546 ) ) ( not ( = ?auto_163540 ?auto_163541 ) ) ( not ( = ?auto_163540 ?auto_163542 ) ) ( not ( = ?auto_163540 ?auto_163543 ) ) ( not ( = ?auto_163540 ?auto_163544 ) ) ( not ( = ?auto_163540 ?auto_163545 ) ) ( not ( = ?auto_163540 ?auto_163546 ) ) ( not ( = ?auto_163541 ?auto_163542 ) ) ( not ( = ?auto_163541 ?auto_163543 ) ) ( not ( = ?auto_163541 ?auto_163544 ) ) ( not ( = ?auto_163541 ?auto_163545 ) ) ( not ( = ?auto_163541 ?auto_163546 ) ) ( not ( = ?auto_163542 ?auto_163543 ) ) ( not ( = ?auto_163542 ?auto_163544 ) ) ( not ( = ?auto_163542 ?auto_163545 ) ) ( not ( = ?auto_163542 ?auto_163546 ) ) ( not ( = ?auto_163543 ?auto_163544 ) ) ( not ( = ?auto_163543 ?auto_163545 ) ) ( not ( = ?auto_163543 ?auto_163546 ) ) ( not ( = ?auto_163544 ?auto_163545 ) ) ( not ( = ?auto_163544 ?auto_163546 ) ) ( not ( = ?auto_163545 ?auto_163546 ) ) ( ON ?auto_163546 ?auto_163547 ) ( not ( = ?auto_163539 ?auto_163547 ) ) ( not ( = ?auto_163540 ?auto_163547 ) ) ( not ( = ?auto_163541 ?auto_163547 ) ) ( not ( = ?auto_163542 ?auto_163547 ) ) ( not ( = ?auto_163543 ?auto_163547 ) ) ( not ( = ?auto_163544 ?auto_163547 ) ) ( not ( = ?auto_163545 ?auto_163547 ) ) ( not ( = ?auto_163546 ?auto_163547 ) ) ( ON ?auto_163545 ?auto_163546 ) ( ON-TABLE ?auto_163547 ) ( ON ?auto_163544 ?auto_163545 ) ( ON ?auto_163543 ?auto_163544 ) ( ON ?auto_163542 ?auto_163543 ) ( ON ?auto_163541 ?auto_163542 ) ( ON ?auto_163540 ?auto_163541 ) ( ON ?auto_163539 ?auto_163540 ) ( CLEAR ?auto_163539 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_163547 ?auto_163546 ?auto_163545 ?auto_163544 ?auto_163543 ?auto_163542 ?auto_163541 ?auto_163540 )
      ( MAKE-8PILE ?auto_163539 ?auto_163540 ?auto_163541 ?auto_163542 ?auto_163543 ?auto_163544 ?auto_163545 ?auto_163546 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_163555 - BLOCK
      ?auto_163556 - BLOCK
      ?auto_163557 - BLOCK
      ?auto_163558 - BLOCK
      ?auto_163559 - BLOCK
      ?auto_163560 - BLOCK
      ?auto_163561 - BLOCK
    )
    :vars
    (
      ?auto_163562 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_163562 ?auto_163561 ) ( CLEAR ?auto_163562 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_163555 ) ( ON ?auto_163556 ?auto_163555 ) ( ON ?auto_163557 ?auto_163556 ) ( ON ?auto_163558 ?auto_163557 ) ( ON ?auto_163559 ?auto_163558 ) ( ON ?auto_163560 ?auto_163559 ) ( ON ?auto_163561 ?auto_163560 ) ( not ( = ?auto_163555 ?auto_163556 ) ) ( not ( = ?auto_163555 ?auto_163557 ) ) ( not ( = ?auto_163555 ?auto_163558 ) ) ( not ( = ?auto_163555 ?auto_163559 ) ) ( not ( = ?auto_163555 ?auto_163560 ) ) ( not ( = ?auto_163555 ?auto_163561 ) ) ( not ( = ?auto_163555 ?auto_163562 ) ) ( not ( = ?auto_163556 ?auto_163557 ) ) ( not ( = ?auto_163556 ?auto_163558 ) ) ( not ( = ?auto_163556 ?auto_163559 ) ) ( not ( = ?auto_163556 ?auto_163560 ) ) ( not ( = ?auto_163556 ?auto_163561 ) ) ( not ( = ?auto_163556 ?auto_163562 ) ) ( not ( = ?auto_163557 ?auto_163558 ) ) ( not ( = ?auto_163557 ?auto_163559 ) ) ( not ( = ?auto_163557 ?auto_163560 ) ) ( not ( = ?auto_163557 ?auto_163561 ) ) ( not ( = ?auto_163557 ?auto_163562 ) ) ( not ( = ?auto_163558 ?auto_163559 ) ) ( not ( = ?auto_163558 ?auto_163560 ) ) ( not ( = ?auto_163558 ?auto_163561 ) ) ( not ( = ?auto_163558 ?auto_163562 ) ) ( not ( = ?auto_163559 ?auto_163560 ) ) ( not ( = ?auto_163559 ?auto_163561 ) ) ( not ( = ?auto_163559 ?auto_163562 ) ) ( not ( = ?auto_163560 ?auto_163561 ) ) ( not ( = ?auto_163560 ?auto_163562 ) ) ( not ( = ?auto_163561 ?auto_163562 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_163562 ?auto_163561 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_163580 - BLOCK
      ?auto_163581 - BLOCK
      ?auto_163582 - BLOCK
      ?auto_163583 - BLOCK
      ?auto_163584 - BLOCK
      ?auto_163585 - BLOCK
      ?auto_163586 - BLOCK
    )
    :vars
    (
      ?auto_163587 - BLOCK
      ?auto_163588 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_163580 ) ( ON ?auto_163581 ?auto_163580 ) ( ON ?auto_163582 ?auto_163581 ) ( ON ?auto_163583 ?auto_163582 ) ( ON ?auto_163584 ?auto_163583 ) ( ON ?auto_163585 ?auto_163584 ) ( not ( = ?auto_163580 ?auto_163581 ) ) ( not ( = ?auto_163580 ?auto_163582 ) ) ( not ( = ?auto_163580 ?auto_163583 ) ) ( not ( = ?auto_163580 ?auto_163584 ) ) ( not ( = ?auto_163580 ?auto_163585 ) ) ( not ( = ?auto_163580 ?auto_163586 ) ) ( not ( = ?auto_163580 ?auto_163587 ) ) ( not ( = ?auto_163581 ?auto_163582 ) ) ( not ( = ?auto_163581 ?auto_163583 ) ) ( not ( = ?auto_163581 ?auto_163584 ) ) ( not ( = ?auto_163581 ?auto_163585 ) ) ( not ( = ?auto_163581 ?auto_163586 ) ) ( not ( = ?auto_163581 ?auto_163587 ) ) ( not ( = ?auto_163582 ?auto_163583 ) ) ( not ( = ?auto_163582 ?auto_163584 ) ) ( not ( = ?auto_163582 ?auto_163585 ) ) ( not ( = ?auto_163582 ?auto_163586 ) ) ( not ( = ?auto_163582 ?auto_163587 ) ) ( not ( = ?auto_163583 ?auto_163584 ) ) ( not ( = ?auto_163583 ?auto_163585 ) ) ( not ( = ?auto_163583 ?auto_163586 ) ) ( not ( = ?auto_163583 ?auto_163587 ) ) ( not ( = ?auto_163584 ?auto_163585 ) ) ( not ( = ?auto_163584 ?auto_163586 ) ) ( not ( = ?auto_163584 ?auto_163587 ) ) ( not ( = ?auto_163585 ?auto_163586 ) ) ( not ( = ?auto_163585 ?auto_163587 ) ) ( not ( = ?auto_163586 ?auto_163587 ) ) ( ON ?auto_163587 ?auto_163588 ) ( CLEAR ?auto_163587 ) ( not ( = ?auto_163580 ?auto_163588 ) ) ( not ( = ?auto_163581 ?auto_163588 ) ) ( not ( = ?auto_163582 ?auto_163588 ) ) ( not ( = ?auto_163583 ?auto_163588 ) ) ( not ( = ?auto_163584 ?auto_163588 ) ) ( not ( = ?auto_163585 ?auto_163588 ) ) ( not ( = ?auto_163586 ?auto_163588 ) ) ( not ( = ?auto_163587 ?auto_163588 ) ) ( HOLDING ?auto_163586 ) ( CLEAR ?auto_163585 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_163580 ?auto_163581 ?auto_163582 ?auto_163583 ?auto_163584 ?auto_163585 ?auto_163586 ?auto_163587 )
      ( MAKE-7PILE ?auto_163580 ?auto_163581 ?auto_163582 ?auto_163583 ?auto_163584 ?auto_163585 ?auto_163586 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_163589 - BLOCK
      ?auto_163590 - BLOCK
      ?auto_163591 - BLOCK
      ?auto_163592 - BLOCK
      ?auto_163593 - BLOCK
      ?auto_163594 - BLOCK
      ?auto_163595 - BLOCK
    )
    :vars
    (
      ?auto_163596 - BLOCK
      ?auto_163597 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_163589 ) ( ON ?auto_163590 ?auto_163589 ) ( ON ?auto_163591 ?auto_163590 ) ( ON ?auto_163592 ?auto_163591 ) ( ON ?auto_163593 ?auto_163592 ) ( ON ?auto_163594 ?auto_163593 ) ( not ( = ?auto_163589 ?auto_163590 ) ) ( not ( = ?auto_163589 ?auto_163591 ) ) ( not ( = ?auto_163589 ?auto_163592 ) ) ( not ( = ?auto_163589 ?auto_163593 ) ) ( not ( = ?auto_163589 ?auto_163594 ) ) ( not ( = ?auto_163589 ?auto_163595 ) ) ( not ( = ?auto_163589 ?auto_163596 ) ) ( not ( = ?auto_163590 ?auto_163591 ) ) ( not ( = ?auto_163590 ?auto_163592 ) ) ( not ( = ?auto_163590 ?auto_163593 ) ) ( not ( = ?auto_163590 ?auto_163594 ) ) ( not ( = ?auto_163590 ?auto_163595 ) ) ( not ( = ?auto_163590 ?auto_163596 ) ) ( not ( = ?auto_163591 ?auto_163592 ) ) ( not ( = ?auto_163591 ?auto_163593 ) ) ( not ( = ?auto_163591 ?auto_163594 ) ) ( not ( = ?auto_163591 ?auto_163595 ) ) ( not ( = ?auto_163591 ?auto_163596 ) ) ( not ( = ?auto_163592 ?auto_163593 ) ) ( not ( = ?auto_163592 ?auto_163594 ) ) ( not ( = ?auto_163592 ?auto_163595 ) ) ( not ( = ?auto_163592 ?auto_163596 ) ) ( not ( = ?auto_163593 ?auto_163594 ) ) ( not ( = ?auto_163593 ?auto_163595 ) ) ( not ( = ?auto_163593 ?auto_163596 ) ) ( not ( = ?auto_163594 ?auto_163595 ) ) ( not ( = ?auto_163594 ?auto_163596 ) ) ( not ( = ?auto_163595 ?auto_163596 ) ) ( ON ?auto_163596 ?auto_163597 ) ( not ( = ?auto_163589 ?auto_163597 ) ) ( not ( = ?auto_163590 ?auto_163597 ) ) ( not ( = ?auto_163591 ?auto_163597 ) ) ( not ( = ?auto_163592 ?auto_163597 ) ) ( not ( = ?auto_163593 ?auto_163597 ) ) ( not ( = ?auto_163594 ?auto_163597 ) ) ( not ( = ?auto_163595 ?auto_163597 ) ) ( not ( = ?auto_163596 ?auto_163597 ) ) ( CLEAR ?auto_163594 ) ( ON ?auto_163595 ?auto_163596 ) ( CLEAR ?auto_163595 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_163597 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_163597 ?auto_163596 )
      ( MAKE-7PILE ?auto_163589 ?auto_163590 ?auto_163591 ?auto_163592 ?auto_163593 ?auto_163594 ?auto_163595 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_163598 - BLOCK
      ?auto_163599 - BLOCK
      ?auto_163600 - BLOCK
      ?auto_163601 - BLOCK
      ?auto_163602 - BLOCK
      ?auto_163603 - BLOCK
      ?auto_163604 - BLOCK
    )
    :vars
    (
      ?auto_163605 - BLOCK
      ?auto_163606 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_163598 ) ( ON ?auto_163599 ?auto_163598 ) ( ON ?auto_163600 ?auto_163599 ) ( ON ?auto_163601 ?auto_163600 ) ( ON ?auto_163602 ?auto_163601 ) ( not ( = ?auto_163598 ?auto_163599 ) ) ( not ( = ?auto_163598 ?auto_163600 ) ) ( not ( = ?auto_163598 ?auto_163601 ) ) ( not ( = ?auto_163598 ?auto_163602 ) ) ( not ( = ?auto_163598 ?auto_163603 ) ) ( not ( = ?auto_163598 ?auto_163604 ) ) ( not ( = ?auto_163598 ?auto_163605 ) ) ( not ( = ?auto_163599 ?auto_163600 ) ) ( not ( = ?auto_163599 ?auto_163601 ) ) ( not ( = ?auto_163599 ?auto_163602 ) ) ( not ( = ?auto_163599 ?auto_163603 ) ) ( not ( = ?auto_163599 ?auto_163604 ) ) ( not ( = ?auto_163599 ?auto_163605 ) ) ( not ( = ?auto_163600 ?auto_163601 ) ) ( not ( = ?auto_163600 ?auto_163602 ) ) ( not ( = ?auto_163600 ?auto_163603 ) ) ( not ( = ?auto_163600 ?auto_163604 ) ) ( not ( = ?auto_163600 ?auto_163605 ) ) ( not ( = ?auto_163601 ?auto_163602 ) ) ( not ( = ?auto_163601 ?auto_163603 ) ) ( not ( = ?auto_163601 ?auto_163604 ) ) ( not ( = ?auto_163601 ?auto_163605 ) ) ( not ( = ?auto_163602 ?auto_163603 ) ) ( not ( = ?auto_163602 ?auto_163604 ) ) ( not ( = ?auto_163602 ?auto_163605 ) ) ( not ( = ?auto_163603 ?auto_163604 ) ) ( not ( = ?auto_163603 ?auto_163605 ) ) ( not ( = ?auto_163604 ?auto_163605 ) ) ( ON ?auto_163605 ?auto_163606 ) ( not ( = ?auto_163598 ?auto_163606 ) ) ( not ( = ?auto_163599 ?auto_163606 ) ) ( not ( = ?auto_163600 ?auto_163606 ) ) ( not ( = ?auto_163601 ?auto_163606 ) ) ( not ( = ?auto_163602 ?auto_163606 ) ) ( not ( = ?auto_163603 ?auto_163606 ) ) ( not ( = ?auto_163604 ?auto_163606 ) ) ( not ( = ?auto_163605 ?auto_163606 ) ) ( ON ?auto_163604 ?auto_163605 ) ( CLEAR ?auto_163604 ) ( ON-TABLE ?auto_163606 ) ( HOLDING ?auto_163603 ) ( CLEAR ?auto_163602 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_163598 ?auto_163599 ?auto_163600 ?auto_163601 ?auto_163602 ?auto_163603 )
      ( MAKE-7PILE ?auto_163598 ?auto_163599 ?auto_163600 ?auto_163601 ?auto_163602 ?auto_163603 ?auto_163604 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_163607 - BLOCK
      ?auto_163608 - BLOCK
      ?auto_163609 - BLOCK
      ?auto_163610 - BLOCK
      ?auto_163611 - BLOCK
      ?auto_163612 - BLOCK
      ?auto_163613 - BLOCK
    )
    :vars
    (
      ?auto_163615 - BLOCK
      ?auto_163614 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_163607 ) ( ON ?auto_163608 ?auto_163607 ) ( ON ?auto_163609 ?auto_163608 ) ( ON ?auto_163610 ?auto_163609 ) ( ON ?auto_163611 ?auto_163610 ) ( not ( = ?auto_163607 ?auto_163608 ) ) ( not ( = ?auto_163607 ?auto_163609 ) ) ( not ( = ?auto_163607 ?auto_163610 ) ) ( not ( = ?auto_163607 ?auto_163611 ) ) ( not ( = ?auto_163607 ?auto_163612 ) ) ( not ( = ?auto_163607 ?auto_163613 ) ) ( not ( = ?auto_163607 ?auto_163615 ) ) ( not ( = ?auto_163608 ?auto_163609 ) ) ( not ( = ?auto_163608 ?auto_163610 ) ) ( not ( = ?auto_163608 ?auto_163611 ) ) ( not ( = ?auto_163608 ?auto_163612 ) ) ( not ( = ?auto_163608 ?auto_163613 ) ) ( not ( = ?auto_163608 ?auto_163615 ) ) ( not ( = ?auto_163609 ?auto_163610 ) ) ( not ( = ?auto_163609 ?auto_163611 ) ) ( not ( = ?auto_163609 ?auto_163612 ) ) ( not ( = ?auto_163609 ?auto_163613 ) ) ( not ( = ?auto_163609 ?auto_163615 ) ) ( not ( = ?auto_163610 ?auto_163611 ) ) ( not ( = ?auto_163610 ?auto_163612 ) ) ( not ( = ?auto_163610 ?auto_163613 ) ) ( not ( = ?auto_163610 ?auto_163615 ) ) ( not ( = ?auto_163611 ?auto_163612 ) ) ( not ( = ?auto_163611 ?auto_163613 ) ) ( not ( = ?auto_163611 ?auto_163615 ) ) ( not ( = ?auto_163612 ?auto_163613 ) ) ( not ( = ?auto_163612 ?auto_163615 ) ) ( not ( = ?auto_163613 ?auto_163615 ) ) ( ON ?auto_163615 ?auto_163614 ) ( not ( = ?auto_163607 ?auto_163614 ) ) ( not ( = ?auto_163608 ?auto_163614 ) ) ( not ( = ?auto_163609 ?auto_163614 ) ) ( not ( = ?auto_163610 ?auto_163614 ) ) ( not ( = ?auto_163611 ?auto_163614 ) ) ( not ( = ?auto_163612 ?auto_163614 ) ) ( not ( = ?auto_163613 ?auto_163614 ) ) ( not ( = ?auto_163615 ?auto_163614 ) ) ( ON ?auto_163613 ?auto_163615 ) ( ON-TABLE ?auto_163614 ) ( CLEAR ?auto_163611 ) ( ON ?auto_163612 ?auto_163613 ) ( CLEAR ?auto_163612 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_163614 ?auto_163615 ?auto_163613 )
      ( MAKE-7PILE ?auto_163607 ?auto_163608 ?auto_163609 ?auto_163610 ?auto_163611 ?auto_163612 ?auto_163613 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_163616 - BLOCK
      ?auto_163617 - BLOCK
      ?auto_163618 - BLOCK
      ?auto_163619 - BLOCK
      ?auto_163620 - BLOCK
      ?auto_163621 - BLOCK
      ?auto_163622 - BLOCK
    )
    :vars
    (
      ?auto_163623 - BLOCK
      ?auto_163624 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_163616 ) ( ON ?auto_163617 ?auto_163616 ) ( ON ?auto_163618 ?auto_163617 ) ( ON ?auto_163619 ?auto_163618 ) ( not ( = ?auto_163616 ?auto_163617 ) ) ( not ( = ?auto_163616 ?auto_163618 ) ) ( not ( = ?auto_163616 ?auto_163619 ) ) ( not ( = ?auto_163616 ?auto_163620 ) ) ( not ( = ?auto_163616 ?auto_163621 ) ) ( not ( = ?auto_163616 ?auto_163622 ) ) ( not ( = ?auto_163616 ?auto_163623 ) ) ( not ( = ?auto_163617 ?auto_163618 ) ) ( not ( = ?auto_163617 ?auto_163619 ) ) ( not ( = ?auto_163617 ?auto_163620 ) ) ( not ( = ?auto_163617 ?auto_163621 ) ) ( not ( = ?auto_163617 ?auto_163622 ) ) ( not ( = ?auto_163617 ?auto_163623 ) ) ( not ( = ?auto_163618 ?auto_163619 ) ) ( not ( = ?auto_163618 ?auto_163620 ) ) ( not ( = ?auto_163618 ?auto_163621 ) ) ( not ( = ?auto_163618 ?auto_163622 ) ) ( not ( = ?auto_163618 ?auto_163623 ) ) ( not ( = ?auto_163619 ?auto_163620 ) ) ( not ( = ?auto_163619 ?auto_163621 ) ) ( not ( = ?auto_163619 ?auto_163622 ) ) ( not ( = ?auto_163619 ?auto_163623 ) ) ( not ( = ?auto_163620 ?auto_163621 ) ) ( not ( = ?auto_163620 ?auto_163622 ) ) ( not ( = ?auto_163620 ?auto_163623 ) ) ( not ( = ?auto_163621 ?auto_163622 ) ) ( not ( = ?auto_163621 ?auto_163623 ) ) ( not ( = ?auto_163622 ?auto_163623 ) ) ( ON ?auto_163623 ?auto_163624 ) ( not ( = ?auto_163616 ?auto_163624 ) ) ( not ( = ?auto_163617 ?auto_163624 ) ) ( not ( = ?auto_163618 ?auto_163624 ) ) ( not ( = ?auto_163619 ?auto_163624 ) ) ( not ( = ?auto_163620 ?auto_163624 ) ) ( not ( = ?auto_163621 ?auto_163624 ) ) ( not ( = ?auto_163622 ?auto_163624 ) ) ( not ( = ?auto_163623 ?auto_163624 ) ) ( ON ?auto_163622 ?auto_163623 ) ( ON-TABLE ?auto_163624 ) ( ON ?auto_163621 ?auto_163622 ) ( CLEAR ?auto_163621 ) ( HOLDING ?auto_163620 ) ( CLEAR ?auto_163619 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_163616 ?auto_163617 ?auto_163618 ?auto_163619 ?auto_163620 )
      ( MAKE-7PILE ?auto_163616 ?auto_163617 ?auto_163618 ?auto_163619 ?auto_163620 ?auto_163621 ?auto_163622 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_163625 - BLOCK
      ?auto_163626 - BLOCK
      ?auto_163627 - BLOCK
      ?auto_163628 - BLOCK
      ?auto_163629 - BLOCK
      ?auto_163630 - BLOCK
      ?auto_163631 - BLOCK
    )
    :vars
    (
      ?auto_163632 - BLOCK
      ?auto_163633 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_163625 ) ( ON ?auto_163626 ?auto_163625 ) ( ON ?auto_163627 ?auto_163626 ) ( ON ?auto_163628 ?auto_163627 ) ( not ( = ?auto_163625 ?auto_163626 ) ) ( not ( = ?auto_163625 ?auto_163627 ) ) ( not ( = ?auto_163625 ?auto_163628 ) ) ( not ( = ?auto_163625 ?auto_163629 ) ) ( not ( = ?auto_163625 ?auto_163630 ) ) ( not ( = ?auto_163625 ?auto_163631 ) ) ( not ( = ?auto_163625 ?auto_163632 ) ) ( not ( = ?auto_163626 ?auto_163627 ) ) ( not ( = ?auto_163626 ?auto_163628 ) ) ( not ( = ?auto_163626 ?auto_163629 ) ) ( not ( = ?auto_163626 ?auto_163630 ) ) ( not ( = ?auto_163626 ?auto_163631 ) ) ( not ( = ?auto_163626 ?auto_163632 ) ) ( not ( = ?auto_163627 ?auto_163628 ) ) ( not ( = ?auto_163627 ?auto_163629 ) ) ( not ( = ?auto_163627 ?auto_163630 ) ) ( not ( = ?auto_163627 ?auto_163631 ) ) ( not ( = ?auto_163627 ?auto_163632 ) ) ( not ( = ?auto_163628 ?auto_163629 ) ) ( not ( = ?auto_163628 ?auto_163630 ) ) ( not ( = ?auto_163628 ?auto_163631 ) ) ( not ( = ?auto_163628 ?auto_163632 ) ) ( not ( = ?auto_163629 ?auto_163630 ) ) ( not ( = ?auto_163629 ?auto_163631 ) ) ( not ( = ?auto_163629 ?auto_163632 ) ) ( not ( = ?auto_163630 ?auto_163631 ) ) ( not ( = ?auto_163630 ?auto_163632 ) ) ( not ( = ?auto_163631 ?auto_163632 ) ) ( ON ?auto_163632 ?auto_163633 ) ( not ( = ?auto_163625 ?auto_163633 ) ) ( not ( = ?auto_163626 ?auto_163633 ) ) ( not ( = ?auto_163627 ?auto_163633 ) ) ( not ( = ?auto_163628 ?auto_163633 ) ) ( not ( = ?auto_163629 ?auto_163633 ) ) ( not ( = ?auto_163630 ?auto_163633 ) ) ( not ( = ?auto_163631 ?auto_163633 ) ) ( not ( = ?auto_163632 ?auto_163633 ) ) ( ON ?auto_163631 ?auto_163632 ) ( ON-TABLE ?auto_163633 ) ( ON ?auto_163630 ?auto_163631 ) ( CLEAR ?auto_163628 ) ( ON ?auto_163629 ?auto_163630 ) ( CLEAR ?auto_163629 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_163633 ?auto_163632 ?auto_163631 ?auto_163630 )
      ( MAKE-7PILE ?auto_163625 ?auto_163626 ?auto_163627 ?auto_163628 ?auto_163629 ?auto_163630 ?auto_163631 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_163634 - BLOCK
      ?auto_163635 - BLOCK
      ?auto_163636 - BLOCK
      ?auto_163637 - BLOCK
      ?auto_163638 - BLOCK
      ?auto_163639 - BLOCK
      ?auto_163640 - BLOCK
    )
    :vars
    (
      ?auto_163642 - BLOCK
      ?auto_163641 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_163634 ) ( ON ?auto_163635 ?auto_163634 ) ( ON ?auto_163636 ?auto_163635 ) ( not ( = ?auto_163634 ?auto_163635 ) ) ( not ( = ?auto_163634 ?auto_163636 ) ) ( not ( = ?auto_163634 ?auto_163637 ) ) ( not ( = ?auto_163634 ?auto_163638 ) ) ( not ( = ?auto_163634 ?auto_163639 ) ) ( not ( = ?auto_163634 ?auto_163640 ) ) ( not ( = ?auto_163634 ?auto_163642 ) ) ( not ( = ?auto_163635 ?auto_163636 ) ) ( not ( = ?auto_163635 ?auto_163637 ) ) ( not ( = ?auto_163635 ?auto_163638 ) ) ( not ( = ?auto_163635 ?auto_163639 ) ) ( not ( = ?auto_163635 ?auto_163640 ) ) ( not ( = ?auto_163635 ?auto_163642 ) ) ( not ( = ?auto_163636 ?auto_163637 ) ) ( not ( = ?auto_163636 ?auto_163638 ) ) ( not ( = ?auto_163636 ?auto_163639 ) ) ( not ( = ?auto_163636 ?auto_163640 ) ) ( not ( = ?auto_163636 ?auto_163642 ) ) ( not ( = ?auto_163637 ?auto_163638 ) ) ( not ( = ?auto_163637 ?auto_163639 ) ) ( not ( = ?auto_163637 ?auto_163640 ) ) ( not ( = ?auto_163637 ?auto_163642 ) ) ( not ( = ?auto_163638 ?auto_163639 ) ) ( not ( = ?auto_163638 ?auto_163640 ) ) ( not ( = ?auto_163638 ?auto_163642 ) ) ( not ( = ?auto_163639 ?auto_163640 ) ) ( not ( = ?auto_163639 ?auto_163642 ) ) ( not ( = ?auto_163640 ?auto_163642 ) ) ( ON ?auto_163642 ?auto_163641 ) ( not ( = ?auto_163634 ?auto_163641 ) ) ( not ( = ?auto_163635 ?auto_163641 ) ) ( not ( = ?auto_163636 ?auto_163641 ) ) ( not ( = ?auto_163637 ?auto_163641 ) ) ( not ( = ?auto_163638 ?auto_163641 ) ) ( not ( = ?auto_163639 ?auto_163641 ) ) ( not ( = ?auto_163640 ?auto_163641 ) ) ( not ( = ?auto_163642 ?auto_163641 ) ) ( ON ?auto_163640 ?auto_163642 ) ( ON-TABLE ?auto_163641 ) ( ON ?auto_163639 ?auto_163640 ) ( ON ?auto_163638 ?auto_163639 ) ( CLEAR ?auto_163638 ) ( HOLDING ?auto_163637 ) ( CLEAR ?auto_163636 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_163634 ?auto_163635 ?auto_163636 ?auto_163637 )
      ( MAKE-7PILE ?auto_163634 ?auto_163635 ?auto_163636 ?auto_163637 ?auto_163638 ?auto_163639 ?auto_163640 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_163643 - BLOCK
      ?auto_163644 - BLOCK
      ?auto_163645 - BLOCK
      ?auto_163646 - BLOCK
      ?auto_163647 - BLOCK
      ?auto_163648 - BLOCK
      ?auto_163649 - BLOCK
    )
    :vars
    (
      ?auto_163651 - BLOCK
      ?auto_163650 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_163643 ) ( ON ?auto_163644 ?auto_163643 ) ( ON ?auto_163645 ?auto_163644 ) ( not ( = ?auto_163643 ?auto_163644 ) ) ( not ( = ?auto_163643 ?auto_163645 ) ) ( not ( = ?auto_163643 ?auto_163646 ) ) ( not ( = ?auto_163643 ?auto_163647 ) ) ( not ( = ?auto_163643 ?auto_163648 ) ) ( not ( = ?auto_163643 ?auto_163649 ) ) ( not ( = ?auto_163643 ?auto_163651 ) ) ( not ( = ?auto_163644 ?auto_163645 ) ) ( not ( = ?auto_163644 ?auto_163646 ) ) ( not ( = ?auto_163644 ?auto_163647 ) ) ( not ( = ?auto_163644 ?auto_163648 ) ) ( not ( = ?auto_163644 ?auto_163649 ) ) ( not ( = ?auto_163644 ?auto_163651 ) ) ( not ( = ?auto_163645 ?auto_163646 ) ) ( not ( = ?auto_163645 ?auto_163647 ) ) ( not ( = ?auto_163645 ?auto_163648 ) ) ( not ( = ?auto_163645 ?auto_163649 ) ) ( not ( = ?auto_163645 ?auto_163651 ) ) ( not ( = ?auto_163646 ?auto_163647 ) ) ( not ( = ?auto_163646 ?auto_163648 ) ) ( not ( = ?auto_163646 ?auto_163649 ) ) ( not ( = ?auto_163646 ?auto_163651 ) ) ( not ( = ?auto_163647 ?auto_163648 ) ) ( not ( = ?auto_163647 ?auto_163649 ) ) ( not ( = ?auto_163647 ?auto_163651 ) ) ( not ( = ?auto_163648 ?auto_163649 ) ) ( not ( = ?auto_163648 ?auto_163651 ) ) ( not ( = ?auto_163649 ?auto_163651 ) ) ( ON ?auto_163651 ?auto_163650 ) ( not ( = ?auto_163643 ?auto_163650 ) ) ( not ( = ?auto_163644 ?auto_163650 ) ) ( not ( = ?auto_163645 ?auto_163650 ) ) ( not ( = ?auto_163646 ?auto_163650 ) ) ( not ( = ?auto_163647 ?auto_163650 ) ) ( not ( = ?auto_163648 ?auto_163650 ) ) ( not ( = ?auto_163649 ?auto_163650 ) ) ( not ( = ?auto_163651 ?auto_163650 ) ) ( ON ?auto_163649 ?auto_163651 ) ( ON-TABLE ?auto_163650 ) ( ON ?auto_163648 ?auto_163649 ) ( ON ?auto_163647 ?auto_163648 ) ( CLEAR ?auto_163645 ) ( ON ?auto_163646 ?auto_163647 ) ( CLEAR ?auto_163646 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_163650 ?auto_163651 ?auto_163649 ?auto_163648 ?auto_163647 )
      ( MAKE-7PILE ?auto_163643 ?auto_163644 ?auto_163645 ?auto_163646 ?auto_163647 ?auto_163648 ?auto_163649 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_163652 - BLOCK
      ?auto_163653 - BLOCK
      ?auto_163654 - BLOCK
      ?auto_163655 - BLOCK
      ?auto_163656 - BLOCK
      ?auto_163657 - BLOCK
      ?auto_163658 - BLOCK
    )
    :vars
    (
      ?auto_163659 - BLOCK
      ?auto_163660 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_163652 ) ( ON ?auto_163653 ?auto_163652 ) ( not ( = ?auto_163652 ?auto_163653 ) ) ( not ( = ?auto_163652 ?auto_163654 ) ) ( not ( = ?auto_163652 ?auto_163655 ) ) ( not ( = ?auto_163652 ?auto_163656 ) ) ( not ( = ?auto_163652 ?auto_163657 ) ) ( not ( = ?auto_163652 ?auto_163658 ) ) ( not ( = ?auto_163652 ?auto_163659 ) ) ( not ( = ?auto_163653 ?auto_163654 ) ) ( not ( = ?auto_163653 ?auto_163655 ) ) ( not ( = ?auto_163653 ?auto_163656 ) ) ( not ( = ?auto_163653 ?auto_163657 ) ) ( not ( = ?auto_163653 ?auto_163658 ) ) ( not ( = ?auto_163653 ?auto_163659 ) ) ( not ( = ?auto_163654 ?auto_163655 ) ) ( not ( = ?auto_163654 ?auto_163656 ) ) ( not ( = ?auto_163654 ?auto_163657 ) ) ( not ( = ?auto_163654 ?auto_163658 ) ) ( not ( = ?auto_163654 ?auto_163659 ) ) ( not ( = ?auto_163655 ?auto_163656 ) ) ( not ( = ?auto_163655 ?auto_163657 ) ) ( not ( = ?auto_163655 ?auto_163658 ) ) ( not ( = ?auto_163655 ?auto_163659 ) ) ( not ( = ?auto_163656 ?auto_163657 ) ) ( not ( = ?auto_163656 ?auto_163658 ) ) ( not ( = ?auto_163656 ?auto_163659 ) ) ( not ( = ?auto_163657 ?auto_163658 ) ) ( not ( = ?auto_163657 ?auto_163659 ) ) ( not ( = ?auto_163658 ?auto_163659 ) ) ( ON ?auto_163659 ?auto_163660 ) ( not ( = ?auto_163652 ?auto_163660 ) ) ( not ( = ?auto_163653 ?auto_163660 ) ) ( not ( = ?auto_163654 ?auto_163660 ) ) ( not ( = ?auto_163655 ?auto_163660 ) ) ( not ( = ?auto_163656 ?auto_163660 ) ) ( not ( = ?auto_163657 ?auto_163660 ) ) ( not ( = ?auto_163658 ?auto_163660 ) ) ( not ( = ?auto_163659 ?auto_163660 ) ) ( ON ?auto_163658 ?auto_163659 ) ( ON-TABLE ?auto_163660 ) ( ON ?auto_163657 ?auto_163658 ) ( ON ?auto_163656 ?auto_163657 ) ( ON ?auto_163655 ?auto_163656 ) ( CLEAR ?auto_163655 ) ( HOLDING ?auto_163654 ) ( CLEAR ?auto_163653 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_163652 ?auto_163653 ?auto_163654 )
      ( MAKE-7PILE ?auto_163652 ?auto_163653 ?auto_163654 ?auto_163655 ?auto_163656 ?auto_163657 ?auto_163658 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_163661 - BLOCK
      ?auto_163662 - BLOCK
      ?auto_163663 - BLOCK
      ?auto_163664 - BLOCK
      ?auto_163665 - BLOCK
      ?auto_163666 - BLOCK
      ?auto_163667 - BLOCK
    )
    :vars
    (
      ?auto_163669 - BLOCK
      ?auto_163668 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_163661 ) ( ON ?auto_163662 ?auto_163661 ) ( not ( = ?auto_163661 ?auto_163662 ) ) ( not ( = ?auto_163661 ?auto_163663 ) ) ( not ( = ?auto_163661 ?auto_163664 ) ) ( not ( = ?auto_163661 ?auto_163665 ) ) ( not ( = ?auto_163661 ?auto_163666 ) ) ( not ( = ?auto_163661 ?auto_163667 ) ) ( not ( = ?auto_163661 ?auto_163669 ) ) ( not ( = ?auto_163662 ?auto_163663 ) ) ( not ( = ?auto_163662 ?auto_163664 ) ) ( not ( = ?auto_163662 ?auto_163665 ) ) ( not ( = ?auto_163662 ?auto_163666 ) ) ( not ( = ?auto_163662 ?auto_163667 ) ) ( not ( = ?auto_163662 ?auto_163669 ) ) ( not ( = ?auto_163663 ?auto_163664 ) ) ( not ( = ?auto_163663 ?auto_163665 ) ) ( not ( = ?auto_163663 ?auto_163666 ) ) ( not ( = ?auto_163663 ?auto_163667 ) ) ( not ( = ?auto_163663 ?auto_163669 ) ) ( not ( = ?auto_163664 ?auto_163665 ) ) ( not ( = ?auto_163664 ?auto_163666 ) ) ( not ( = ?auto_163664 ?auto_163667 ) ) ( not ( = ?auto_163664 ?auto_163669 ) ) ( not ( = ?auto_163665 ?auto_163666 ) ) ( not ( = ?auto_163665 ?auto_163667 ) ) ( not ( = ?auto_163665 ?auto_163669 ) ) ( not ( = ?auto_163666 ?auto_163667 ) ) ( not ( = ?auto_163666 ?auto_163669 ) ) ( not ( = ?auto_163667 ?auto_163669 ) ) ( ON ?auto_163669 ?auto_163668 ) ( not ( = ?auto_163661 ?auto_163668 ) ) ( not ( = ?auto_163662 ?auto_163668 ) ) ( not ( = ?auto_163663 ?auto_163668 ) ) ( not ( = ?auto_163664 ?auto_163668 ) ) ( not ( = ?auto_163665 ?auto_163668 ) ) ( not ( = ?auto_163666 ?auto_163668 ) ) ( not ( = ?auto_163667 ?auto_163668 ) ) ( not ( = ?auto_163669 ?auto_163668 ) ) ( ON ?auto_163667 ?auto_163669 ) ( ON-TABLE ?auto_163668 ) ( ON ?auto_163666 ?auto_163667 ) ( ON ?auto_163665 ?auto_163666 ) ( ON ?auto_163664 ?auto_163665 ) ( CLEAR ?auto_163662 ) ( ON ?auto_163663 ?auto_163664 ) ( CLEAR ?auto_163663 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_163668 ?auto_163669 ?auto_163667 ?auto_163666 ?auto_163665 ?auto_163664 )
      ( MAKE-7PILE ?auto_163661 ?auto_163662 ?auto_163663 ?auto_163664 ?auto_163665 ?auto_163666 ?auto_163667 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_163670 - BLOCK
      ?auto_163671 - BLOCK
      ?auto_163672 - BLOCK
      ?auto_163673 - BLOCK
      ?auto_163674 - BLOCK
      ?auto_163675 - BLOCK
      ?auto_163676 - BLOCK
    )
    :vars
    (
      ?auto_163677 - BLOCK
      ?auto_163678 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_163670 ) ( not ( = ?auto_163670 ?auto_163671 ) ) ( not ( = ?auto_163670 ?auto_163672 ) ) ( not ( = ?auto_163670 ?auto_163673 ) ) ( not ( = ?auto_163670 ?auto_163674 ) ) ( not ( = ?auto_163670 ?auto_163675 ) ) ( not ( = ?auto_163670 ?auto_163676 ) ) ( not ( = ?auto_163670 ?auto_163677 ) ) ( not ( = ?auto_163671 ?auto_163672 ) ) ( not ( = ?auto_163671 ?auto_163673 ) ) ( not ( = ?auto_163671 ?auto_163674 ) ) ( not ( = ?auto_163671 ?auto_163675 ) ) ( not ( = ?auto_163671 ?auto_163676 ) ) ( not ( = ?auto_163671 ?auto_163677 ) ) ( not ( = ?auto_163672 ?auto_163673 ) ) ( not ( = ?auto_163672 ?auto_163674 ) ) ( not ( = ?auto_163672 ?auto_163675 ) ) ( not ( = ?auto_163672 ?auto_163676 ) ) ( not ( = ?auto_163672 ?auto_163677 ) ) ( not ( = ?auto_163673 ?auto_163674 ) ) ( not ( = ?auto_163673 ?auto_163675 ) ) ( not ( = ?auto_163673 ?auto_163676 ) ) ( not ( = ?auto_163673 ?auto_163677 ) ) ( not ( = ?auto_163674 ?auto_163675 ) ) ( not ( = ?auto_163674 ?auto_163676 ) ) ( not ( = ?auto_163674 ?auto_163677 ) ) ( not ( = ?auto_163675 ?auto_163676 ) ) ( not ( = ?auto_163675 ?auto_163677 ) ) ( not ( = ?auto_163676 ?auto_163677 ) ) ( ON ?auto_163677 ?auto_163678 ) ( not ( = ?auto_163670 ?auto_163678 ) ) ( not ( = ?auto_163671 ?auto_163678 ) ) ( not ( = ?auto_163672 ?auto_163678 ) ) ( not ( = ?auto_163673 ?auto_163678 ) ) ( not ( = ?auto_163674 ?auto_163678 ) ) ( not ( = ?auto_163675 ?auto_163678 ) ) ( not ( = ?auto_163676 ?auto_163678 ) ) ( not ( = ?auto_163677 ?auto_163678 ) ) ( ON ?auto_163676 ?auto_163677 ) ( ON-TABLE ?auto_163678 ) ( ON ?auto_163675 ?auto_163676 ) ( ON ?auto_163674 ?auto_163675 ) ( ON ?auto_163673 ?auto_163674 ) ( ON ?auto_163672 ?auto_163673 ) ( CLEAR ?auto_163672 ) ( HOLDING ?auto_163671 ) ( CLEAR ?auto_163670 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_163670 ?auto_163671 )
      ( MAKE-7PILE ?auto_163670 ?auto_163671 ?auto_163672 ?auto_163673 ?auto_163674 ?auto_163675 ?auto_163676 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_163679 - BLOCK
      ?auto_163680 - BLOCK
      ?auto_163681 - BLOCK
      ?auto_163682 - BLOCK
      ?auto_163683 - BLOCK
      ?auto_163684 - BLOCK
      ?auto_163685 - BLOCK
    )
    :vars
    (
      ?auto_163687 - BLOCK
      ?auto_163686 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_163679 ) ( not ( = ?auto_163679 ?auto_163680 ) ) ( not ( = ?auto_163679 ?auto_163681 ) ) ( not ( = ?auto_163679 ?auto_163682 ) ) ( not ( = ?auto_163679 ?auto_163683 ) ) ( not ( = ?auto_163679 ?auto_163684 ) ) ( not ( = ?auto_163679 ?auto_163685 ) ) ( not ( = ?auto_163679 ?auto_163687 ) ) ( not ( = ?auto_163680 ?auto_163681 ) ) ( not ( = ?auto_163680 ?auto_163682 ) ) ( not ( = ?auto_163680 ?auto_163683 ) ) ( not ( = ?auto_163680 ?auto_163684 ) ) ( not ( = ?auto_163680 ?auto_163685 ) ) ( not ( = ?auto_163680 ?auto_163687 ) ) ( not ( = ?auto_163681 ?auto_163682 ) ) ( not ( = ?auto_163681 ?auto_163683 ) ) ( not ( = ?auto_163681 ?auto_163684 ) ) ( not ( = ?auto_163681 ?auto_163685 ) ) ( not ( = ?auto_163681 ?auto_163687 ) ) ( not ( = ?auto_163682 ?auto_163683 ) ) ( not ( = ?auto_163682 ?auto_163684 ) ) ( not ( = ?auto_163682 ?auto_163685 ) ) ( not ( = ?auto_163682 ?auto_163687 ) ) ( not ( = ?auto_163683 ?auto_163684 ) ) ( not ( = ?auto_163683 ?auto_163685 ) ) ( not ( = ?auto_163683 ?auto_163687 ) ) ( not ( = ?auto_163684 ?auto_163685 ) ) ( not ( = ?auto_163684 ?auto_163687 ) ) ( not ( = ?auto_163685 ?auto_163687 ) ) ( ON ?auto_163687 ?auto_163686 ) ( not ( = ?auto_163679 ?auto_163686 ) ) ( not ( = ?auto_163680 ?auto_163686 ) ) ( not ( = ?auto_163681 ?auto_163686 ) ) ( not ( = ?auto_163682 ?auto_163686 ) ) ( not ( = ?auto_163683 ?auto_163686 ) ) ( not ( = ?auto_163684 ?auto_163686 ) ) ( not ( = ?auto_163685 ?auto_163686 ) ) ( not ( = ?auto_163687 ?auto_163686 ) ) ( ON ?auto_163685 ?auto_163687 ) ( ON-TABLE ?auto_163686 ) ( ON ?auto_163684 ?auto_163685 ) ( ON ?auto_163683 ?auto_163684 ) ( ON ?auto_163682 ?auto_163683 ) ( ON ?auto_163681 ?auto_163682 ) ( CLEAR ?auto_163679 ) ( ON ?auto_163680 ?auto_163681 ) ( CLEAR ?auto_163680 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_163686 ?auto_163687 ?auto_163685 ?auto_163684 ?auto_163683 ?auto_163682 ?auto_163681 )
      ( MAKE-7PILE ?auto_163679 ?auto_163680 ?auto_163681 ?auto_163682 ?auto_163683 ?auto_163684 ?auto_163685 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_163688 - BLOCK
      ?auto_163689 - BLOCK
      ?auto_163690 - BLOCK
      ?auto_163691 - BLOCK
      ?auto_163692 - BLOCK
      ?auto_163693 - BLOCK
      ?auto_163694 - BLOCK
    )
    :vars
    (
      ?auto_163696 - BLOCK
      ?auto_163695 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_163688 ?auto_163689 ) ) ( not ( = ?auto_163688 ?auto_163690 ) ) ( not ( = ?auto_163688 ?auto_163691 ) ) ( not ( = ?auto_163688 ?auto_163692 ) ) ( not ( = ?auto_163688 ?auto_163693 ) ) ( not ( = ?auto_163688 ?auto_163694 ) ) ( not ( = ?auto_163688 ?auto_163696 ) ) ( not ( = ?auto_163689 ?auto_163690 ) ) ( not ( = ?auto_163689 ?auto_163691 ) ) ( not ( = ?auto_163689 ?auto_163692 ) ) ( not ( = ?auto_163689 ?auto_163693 ) ) ( not ( = ?auto_163689 ?auto_163694 ) ) ( not ( = ?auto_163689 ?auto_163696 ) ) ( not ( = ?auto_163690 ?auto_163691 ) ) ( not ( = ?auto_163690 ?auto_163692 ) ) ( not ( = ?auto_163690 ?auto_163693 ) ) ( not ( = ?auto_163690 ?auto_163694 ) ) ( not ( = ?auto_163690 ?auto_163696 ) ) ( not ( = ?auto_163691 ?auto_163692 ) ) ( not ( = ?auto_163691 ?auto_163693 ) ) ( not ( = ?auto_163691 ?auto_163694 ) ) ( not ( = ?auto_163691 ?auto_163696 ) ) ( not ( = ?auto_163692 ?auto_163693 ) ) ( not ( = ?auto_163692 ?auto_163694 ) ) ( not ( = ?auto_163692 ?auto_163696 ) ) ( not ( = ?auto_163693 ?auto_163694 ) ) ( not ( = ?auto_163693 ?auto_163696 ) ) ( not ( = ?auto_163694 ?auto_163696 ) ) ( ON ?auto_163696 ?auto_163695 ) ( not ( = ?auto_163688 ?auto_163695 ) ) ( not ( = ?auto_163689 ?auto_163695 ) ) ( not ( = ?auto_163690 ?auto_163695 ) ) ( not ( = ?auto_163691 ?auto_163695 ) ) ( not ( = ?auto_163692 ?auto_163695 ) ) ( not ( = ?auto_163693 ?auto_163695 ) ) ( not ( = ?auto_163694 ?auto_163695 ) ) ( not ( = ?auto_163696 ?auto_163695 ) ) ( ON ?auto_163694 ?auto_163696 ) ( ON-TABLE ?auto_163695 ) ( ON ?auto_163693 ?auto_163694 ) ( ON ?auto_163692 ?auto_163693 ) ( ON ?auto_163691 ?auto_163692 ) ( ON ?auto_163690 ?auto_163691 ) ( ON ?auto_163689 ?auto_163690 ) ( CLEAR ?auto_163689 ) ( HOLDING ?auto_163688 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_163688 )
      ( MAKE-7PILE ?auto_163688 ?auto_163689 ?auto_163690 ?auto_163691 ?auto_163692 ?auto_163693 ?auto_163694 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_163697 - BLOCK
      ?auto_163698 - BLOCK
      ?auto_163699 - BLOCK
      ?auto_163700 - BLOCK
      ?auto_163701 - BLOCK
      ?auto_163702 - BLOCK
      ?auto_163703 - BLOCK
    )
    :vars
    (
      ?auto_163704 - BLOCK
      ?auto_163705 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_163697 ?auto_163698 ) ) ( not ( = ?auto_163697 ?auto_163699 ) ) ( not ( = ?auto_163697 ?auto_163700 ) ) ( not ( = ?auto_163697 ?auto_163701 ) ) ( not ( = ?auto_163697 ?auto_163702 ) ) ( not ( = ?auto_163697 ?auto_163703 ) ) ( not ( = ?auto_163697 ?auto_163704 ) ) ( not ( = ?auto_163698 ?auto_163699 ) ) ( not ( = ?auto_163698 ?auto_163700 ) ) ( not ( = ?auto_163698 ?auto_163701 ) ) ( not ( = ?auto_163698 ?auto_163702 ) ) ( not ( = ?auto_163698 ?auto_163703 ) ) ( not ( = ?auto_163698 ?auto_163704 ) ) ( not ( = ?auto_163699 ?auto_163700 ) ) ( not ( = ?auto_163699 ?auto_163701 ) ) ( not ( = ?auto_163699 ?auto_163702 ) ) ( not ( = ?auto_163699 ?auto_163703 ) ) ( not ( = ?auto_163699 ?auto_163704 ) ) ( not ( = ?auto_163700 ?auto_163701 ) ) ( not ( = ?auto_163700 ?auto_163702 ) ) ( not ( = ?auto_163700 ?auto_163703 ) ) ( not ( = ?auto_163700 ?auto_163704 ) ) ( not ( = ?auto_163701 ?auto_163702 ) ) ( not ( = ?auto_163701 ?auto_163703 ) ) ( not ( = ?auto_163701 ?auto_163704 ) ) ( not ( = ?auto_163702 ?auto_163703 ) ) ( not ( = ?auto_163702 ?auto_163704 ) ) ( not ( = ?auto_163703 ?auto_163704 ) ) ( ON ?auto_163704 ?auto_163705 ) ( not ( = ?auto_163697 ?auto_163705 ) ) ( not ( = ?auto_163698 ?auto_163705 ) ) ( not ( = ?auto_163699 ?auto_163705 ) ) ( not ( = ?auto_163700 ?auto_163705 ) ) ( not ( = ?auto_163701 ?auto_163705 ) ) ( not ( = ?auto_163702 ?auto_163705 ) ) ( not ( = ?auto_163703 ?auto_163705 ) ) ( not ( = ?auto_163704 ?auto_163705 ) ) ( ON ?auto_163703 ?auto_163704 ) ( ON-TABLE ?auto_163705 ) ( ON ?auto_163702 ?auto_163703 ) ( ON ?auto_163701 ?auto_163702 ) ( ON ?auto_163700 ?auto_163701 ) ( ON ?auto_163699 ?auto_163700 ) ( ON ?auto_163698 ?auto_163699 ) ( ON ?auto_163697 ?auto_163698 ) ( CLEAR ?auto_163697 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_163705 ?auto_163704 ?auto_163703 ?auto_163702 ?auto_163701 ?auto_163700 ?auto_163699 ?auto_163698 )
      ( MAKE-7PILE ?auto_163697 ?auto_163698 ?auto_163699 ?auto_163700 ?auto_163701 ?auto_163702 ?auto_163703 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_163707 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_163707 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_163707 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_163708 - BLOCK
    )
    :vars
    (
      ?auto_163709 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_163708 ?auto_163709 ) ( CLEAR ?auto_163708 ) ( HAND-EMPTY ) ( not ( = ?auto_163708 ?auto_163709 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_163708 ?auto_163709 )
      ( MAKE-1PILE ?auto_163708 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_163710 - BLOCK
    )
    :vars
    (
      ?auto_163711 - BLOCK
      ?auto_163712 - BLOCK
      ?auto_163715 - BLOCK
      ?auto_163716 - BLOCK
      ?auto_163714 - BLOCK
      ?auto_163717 - BLOCK
      ?auto_163713 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_163710 ?auto_163711 ) ) ( HOLDING ?auto_163710 ) ( CLEAR ?auto_163711 ) ( ON-TABLE ?auto_163712 ) ( ON ?auto_163715 ?auto_163712 ) ( ON ?auto_163716 ?auto_163715 ) ( ON ?auto_163714 ?auto_163716 ) ( ON ?auto_163717 ?auto_163714 ) ( ON ?auto_163713 ?auto_163717 ) ( ON ?auto_163711 ?auto_163713 ) ( not ( = ?auto_163712 ?auto_163715 ) ) ( not ( = ?auto_163712 ?auto_163716 ) ) ( not ( = ?auto_163712 ?auto_163714 ) ) ( not ( = ?auto_163712 ?auto_163717 ) ) ( not ( = ?auto_163712 ?auto_163713 ) ) ( not ( = ?auto_163712 ?auto_163711 ) ) ( not ( = ?auto_163712 ?auto_163710 ) ) ( not ( = ?auto_163715 ?auto_163716 ) ) ( not ( = ?auto_163715 ?auto_163714 ) ) ( not ( = ?auto_163715 ?auto_163717 ) ) ( not ( = ?auto_163715 ?auto_163713 ) ) ( not ( = ?auto_163715 ?auto_163711 ) ) ( not ( = ?auto_163715 ?auto_163710 ) ) ( not ( = ?auto_163716 ?auto_163714 ) ) ( not ( = ?auto_163716 ?auto_163717 ) ) ( not ( = ?auto_163716 ?auto_163713 ) ) ( not ( = ?auto_163716 ?auto_163711 ) ) ( not ( = ?auto_163716 ?auto_163710 ) ) ( not ( = ?auto_163714 ?auto_163717 ) ) ( not ( = ?auto_163714 ?auto_163713 ) ) ( not ( = ?auto_163714 ?auto_163711 ) ) ( not ( = ?auto_163714 ?auto_163710 ) ) ( not ( = ?auto_163717 ?auto_163713 ) ) ( not ( = ?auto_163717 ?auto_163711 ) ) ( not ( = ?auto_163717 ?auto_163710 ) ) ( not ( = ?auto_163713 ?auto_163711 ) ) ( not ( = ?auto_163713 ?auto_163710 ) ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_163712 ?auto_163715 ?auto_163716 ?auto_163714 ?auto_163717 ?auto_163713 ?auto_163711 ?auto_163710 )
      ( MAKE-1PILE ?auto_163710 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_163718 - BLOCK
    )
    :vars
    (
      ?auto_163720 - BLOCK
      ?auto_163722 - BLOCK
      ?auto_163725 - BLOCK
      ?auto_163719 - BLOCK
      ?auto_163723 - BLOCK
      ?auto_163721 - BLOCK
      ?auto_163724 - BLOCK
      ?auto_163726 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_163718 ?auto_163720 ) ) ( CLEAR ?auto_163720 ) ( ON-TABLE ?auto_163722 ) ( ON ?auto_163725 ?auto_163722 ) ( ON ?auto_163719 ?auto_163725 ) ( ON ?auto_163723 ?auto_163719 ) ( ON ?auto_163721 ?auto_163723 ) ( ON ?auto_163724 ?auto_163721 ) ( ON ?auto_163720 ?auto_163724 ) ( not ( = ?auto_163722 ?auto_163725 ) ) ( not ( = ?auto_163722 ?auto_163719 ) ) ( not ( = ?auto_163722 ?auto_163723 ) ) ( not ( = ?auto_163722 ?auto_163721 ) ) ( not ( = ?auto_163722 ?auto_163724 ) ) ( not ( = ?auto_163722 ?auto_163720 ) ) ( not ( = ?auto_163722 ?auto_163718 ) ) ( not ( = ?auto_163725 ?auto_163719 ) ) ( not ( = ?auto_163725 ?auto_163723 ) ) ( not ( = ?auto_163725 ?auto_163721 ) ) ( not ( = ?auto_163725 ?auto_163724 ) ) ( not ( = ?auto_163725 ?auto_163720 ) ) ( not ( = ?auto_163725 ?auto_163718 ) ) ( not ( = ?auto_163719 ?auto_163723 ) ) ( not ( = ?auto_163719 ?auto_163721 ) ) ( not ( = ?auto_163719 ?auto_163724 ) ) ( not ( = ?auto_163719 ?auto_163720 ) ) ( not ( = ?auto_163719 ?auto_163718 ) ) ( not ( = ?auto_163723 ?auto_163721 ) ) ( not ( = ?auto_163723 ?auto_163724 ) ) ( not ( = ?auto_163723 ?auto_163720 ) ) ( not ( = ?auto_163723 ?auto_163718 ) ) ( not ( = ?auto_163721 ?auto_163724 ) ) ( not ( = ?auto_163721 ?auto_163720 ) ) ( not ( = ?auto_163721 ?auto_163718 ) ) ( not ( = ?auto_163724 ?auto_163720 ) ) ( not ( = ?auto_163724 ?auto_163718 ) ) ( ON ?auto_163718 ?auto_163726 ) ( CLEAR ?auto_163718 ) ( HAND-EMPTY ) ( not ( = ?auto_163718 ?auto_163726 ) ) ( not ( = ?auto_163720 ?auto_163726 ) ) ( not ( = ?auto_163722 ?auto_163726 ) ) ( not ( = ?auto_163725 ?auto_163726 ) ) ( not ( = ?auto_163719 ?auto_163726 ) ) ( not ( = ?auto_163723 ?auto_163726 ) ) ( not ( = ?auto_163721 ?auto_163726 ) ) ( not ( = ?auto_163724 ?auto_163726 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_163718 ?auto_163726 )
      ( MAKE-1PILE ?auto_163718 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_163727 - BLOCK
    )
    :vars
    (
      ?auto_163730 - BLOCK
      ?auto_163734 - BLOCK
      ?auto_163729 - BLOCK
      ?auto_163728 - BLOCK
      ?auto_163731 - BLOCK
      ?auto_163733 - BLOCK
      ?auto_163732 - BLOCK
      ?auto_163735 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_163727 ?auto_163730 ) ) ( ON-TABLE ?auto_163734 ) ( ON ?auto_163729 ?auto_163734 ) ( ON ?auto_163728 ?auto_163729 ) ( ON ?auto_163731 ?auto_163728 ) ( ON ?auto_163733 ?auto_163731 ) ( ON ?auto_163732 ?auto_163733 ) ( not ( = ?auto_163734 ?auto_163729 ) ) ( not ( = ?auto_163734 ?auto_163728 ) ) ( not ( = ?auto_163734 ?auto_163731 ) ) ( not ( = ?auto_163734 ?auto_163733 ) ) ( not ( = ?auto_163734 ?auto_163732 ) ) ( not ( = ?auto_163734 ?auto_163730 ) ) ( not ( = ?auto_163734 ?auto_163727 ) ) ( not ( = ?auto_163729 ?auto_163728 ) ) ( not ( = ?auto_163729 ?auto_163731 ) ) ( not ( = ?auto_163729 ?auto_163733 ) ) ( not ( = ?auto_163729 ?auto_163732 ) ) ( not ( = ?auto_163729 ?auto_163730 ) ) ( not ( = ?auto_163729 ?auto_163727 ) ) ( not ( = ?auto_163728 ?auto_163731 ) ) ( not ( = ?auto_163728 ?auto_163733 ) ) ( not ( = ?auto_163728 ?auto_163732 ) ) ( not ( = ?auto_163728 ?auto_163730 ) ) ( not ( = ?auto_163728 ?auto_163727 ) ) ( not ( = ?auto_163731 ?auto_163733 ) ) ( not ( = ?auto_163731 ?auto_163732 ) ) ( not ( = ?auto_163731 ?auto_163730 ) ) ( not ( = ?auto_163731 ?auto_163727 ) ) ( not ( = ?auto_163733 ?auto_163732 ) ) ( not ( = ?auto_163733 ?auto_163730 ) ) ( not ( = ?auto_163733 ?auto_163727 ) ) ( not ( = ?auto_163732 ?auto_163730 ) ) ( not ( = ?auto_163732 ?auto_163727 ) ) ( ON ?auto_163727 ?auto_163735 ) ( CLEAR ?auto_163727 ) ( not ( = ?auto_163727 ?auto_163735 ) ) ( not ( = ?auto_163730 ?auto_163735 ) ) ( not ( = ?auto_163734 ?auto_163735 ) ) ( not ( = ?auto_163729 ?auto_163735 ) ) ( not ( = ?auto_163728 ?auto_163735 ) ) ( not ( = ?auto_163731 ?auto_163735 ) ) ( not ( = ?auto_163733 ?auto_163735 ) ) ( not ( = ?auto_163732 ?auto_163735 ) ) ( HOLDING ?auto_163730 ) ( CLEAR ?auto_163732 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_163734 ?auto_163729 ?auto_163728 ?auto_163731 ?auto_163733 ?auto_163732 ?auto_163730 )
      ( MAKE-1PILE ?auto_163727 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_163736 - BLOCK
    )
    :vars
    (
      ?auto_163738 - BLOCK
      ?auto_163743 - BLOCK
      ?auto_163740 - BLOCK
      ?auto_163744 - BLOCK
      ?auto_163739 - BLOCK
      ?auto_163742 - BLOCK
      ?auto_163737 - BLOCK
      ?auto_163741 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_163736 ?auto_163738 ) ) ( ON-TABLE ?auto_163743 ) ( ON ?auto_163740 ?auto_163743 ) ( ON ?auto_163744 ?auto_163740 ) ( ON ?auto_163739 ?auto_163744 ) ( ON ?auto_163742 ?auto_163739 ) ( ON ?auto_163737 ?auto_163742 ) ( not ( = ?auto_163743 ?auto_163740 ) ) ( not ( = ?auto_163743 ?auto_163744 ) ) ( not ( = ?auto_163743 ?auto_163739 ) ) ( not ( = ?auto_163743 ?auto_163742 ) ) ( not ( = ?auto_163743 ?auto_163737 ) ) ( not ( = ?auto_163743 ?auto_163738 ) ) ( not ( = ?auto_163743 ?auto_163736 ) ) ( not ( = ?auto_163740 ?auto_163744 ) ) ( not ( = ?auto_163740 ?auto_163739 ) ) ( not ( = ?auto_163740 ?auto_163742 ) ) ( not ( = ?auto_163740 ?auto_163737 ) ) ( not ( = ?auto_163740 ?auto_163738 ) ) ( not ( = ?auto_163740 ?auto_163736 ) ) ( not ( = ?auto_163744 ?auto_163739 ) ) ( not ( = ?auto_163744 ?auto_163742 ) ) ( not ( = ?auto_163744 ?auto_163737 ) ) ( not ( = ?auto_163744 ?auto_163738 ) ) ( not ( = ?auto_163744 ?auto_163736 ) ) ( not ( = ?auto_163739 ?auto_163742 ) ) ( not ( = ?auto_163739 ?auto_163737 ) ) ( not ( = ?auto_163739 ?auto_163738 ) ) ( not ( = ?auto_163739 ?auto_163736 ) ) ( not ( = ?auto_163742 ?auto_163737 ) ) ( not ( = ?auto_163742 ?auto_163738 ) ) ( not ( = ?auto_163742 ?auto_163736 ) ) ( not ( = ?auto_163737 ?auto_163738 ) ) ( not ( = ?auto_163737 ?auto_163736 ) ) ( ON ?auto_163736 ?auto_163741 ) ( not ( = ?auto_163736 ?auto_163741 ) ) ( not ( = ?auto_163738 ?auto_163741 ) ) ( not ( = ?auto_163743 ?auto_163741 ) ) ( not ( = ?auto_163740 ?auto_163741 ) ) ( not ( = ?auto_163744 ?auto_163741 ) ) ( not ( = ?auto_163739 ?auto_163741 ) ) ( not ( = ?auto_163742 ?auto_163741 ) ) ( not ( = ?auto_163737 ?auto_163741 ) ) ( CLEAR ?auto_163737 ) ( ON ?auto_163738 ?auto_163736 ) ( CLEAR ?auto_163738 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_163741 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_163741 ?auto_163736 )
      ( MAKE-1PILE ?auto_163736 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_163745 - BLOCK
    )
    :vars
    (
      ?auto_163748 - BLOCK
      ?auto_163751 - BLOCK
      ?auto_163752 - BLOCK
      ?auto_163753 - BLOCK
      ?auto_163746 - BLOCK
      ?auto_163750 - BLOCK
      ?auto_163749 - BLOCK
      ?auto_163747 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_163745 ?auto_163748 ) ) ( ON-TABLE ?auto_163751 ) ( ON ?auto_163752 ?auto_163751 ) ( ON ?auto_163753 ?auto_163752 ) ( ON ?auto_163746 ?auto_163753 ) ( ON ?auto_163750 ?auto_163746 ) ( not ( = ?auto_163751 ?auto_163752 ) ) ( not ( = ?auto_163751 ?auto_163753 ) ) ( not ( = ?auto_163751 ?auto_163746 ) ) ( not ( = ?auto_163751 ?auto_163750 ) ) ( not ( = ?auto_163751 ?auto_163749 ) ) ( not ( = ?auto_163751 ?auto_163748 ) ) ( not ( = ?auto_163751 ?auto_163745 ) ) ( not ( = ?auto_163752 ?auto_163753 ) ) ( not ( = ?auto_163752 ?auto_163746 ) ) ( not ( = ?auto_163752 ?auto_163750 ) ) ( not ( = ?auto_163752 ?auto_163749 ) ) ( not ( = ?auto_163752 ?auto_163748 ) ) ( not ( = ?auto_163752 ?auto_163745 ) ) ( not ( = ?auto_163753 ?auto_163746 ) ) ( not ( = ?auto_163753 ?auto_163750 ) ) ( not ( = ?auto_163753 ?auto_163749 ) ) ( not ( = ?auto_163753 ?auto_163748 ) ) ( not ( = ?auto_163753 ?auto_163745 ) ) ( not ( = ?auto_163746 ?auto_163750 ) ) ( not ( = ?auto_163746 ?auto_163749 ) ) ( not ( = ?auto_163746 ?auto_163748 ) ) ( not ( = ?auto_163746 ?auto_163745 ) ) ( not ( = ?auto_163750 ?auto_163749 ) ) ( not ( = ?auto_163750 ?auto_163748 ) ) ( not ( = ?auto_163750 ?auto_163745 ) ) ( not ( = ?auto_163749 ?auto_163748 ) ) ( not ( = ?auto_163749 ?auto_163745 ) ) ( ON ?auto_163745 ?auto_163747 ) ( not ( = ?auto_163745 ?auto_163747 ) ) ( not ( = ?auto_163748 ?auto_163747 ) ) ( not ( = ?auto_163751 ?auto_163747 ) ) ( not ( = ?auto_163752 ?auto_163747 ) ) ( not ( = ?auto_163753 ?auto_163747 ) ) ( not ( = ?auto_163746 ?auto_163747 ) ) ( not ( = ?auto_163750 ?auto_163747 ) ) ( not ( = ?auto_163749 ?auto_163747 ) ) ( ON ?auto_163748 ?auto_163745 ) ( CLEAR ?auto_163748 ) ( ON-TABLE ?auto_163747 ) ( HOLDING ?auto_163749 ) ( CLEAR ?auto_163750 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_163751 ?auto_163752 ?auto_163753 ?auto_163746 ?auto_163750 ?auto_163749 )
      ( MAKE-1PILE ?auto_163745 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_163754 - BLOCK
    )
    :vars
    (
      ?auto_163759 - BLOCK
      ?auto_163757 - BLOCK
      ?auto_163758 - BLOCK
      ?auto_163760 - BLOCK
      ?auto_163761 - BLOCK
      ?auto_163762 - BLOCK
      ?auto_163755 - BLOCK
      ?auto_163756 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_163754 ?auto_163759 ) ) ( ON-TABLE ?auto_163757 ) ( ON ?auto_163758 ?auto_163757 ) ( ON ?auto_163760 ?auto_163758 ) ( ON ?auto_163761 ?auto_163760 ) ( ON ?auto_163762 ?auto_163761 ) ( not ( = ?auto_163757 ?auto_163758 ) ) ( not ( = ?auto_163757 ?auto_163760 ) ) ( not ( = ?auto_163757 ?auto_163761 ) ) ( not ( = ?auto_163757 ?auto_163762 ) ) ( not ( = ?auto_163757 ?auto_163755 ) ) ( not ( = ?auto_163757 ?auto_163759 ) ) ( not ( = ?auto_163757 ?auto_163754 ) ) ( not ( = ?auto_163758 ?auto_163760 ) ) ( not ( = ?auto_163758 ?auto_163761 ) ) ( not ( = ?auto_163758 ?auto_163762 ) ) ( not ( = ?auto_163758 ?auto_163755 ) ) ( not ( = ?auto_163758 ?auto_163759 ) ) ( not ( = ?auto_163758 ?auto_163754 ) ) ( not ( = ?auto_163760 ?auto_163761 ) ) ( not ( = ?auto_163760 ?auto_163762 ) ) ( not ( = ?auto_163760 ?auto_163755 ) ) ( not ( = ?auto_163760 ?auto_163759 ) ) ( not ( = ?auto_163760 ?auto_163754 ) ) ( not ( = ?auto_163761 ?auto_163762 ) ) ( not ( = ?auto_163761 ?auto_163755 ) ) ( not ( = ?auto_163761 ?auto_163759 ) ) ( not ( = ?auto_163761 ?auto_163754 ) ) ( not ( = ?auto_163762 ?auto_163755 ) ) ( not ( = ?auto_163762 ?auto_163759 ) ) ( not ( = ?auto_163762 ?auto_163754 ) ) ( not ( = ?auto_163755 ?auto_163759 ) ) ( not ( = ?auto_163755 ?auto_163754 ) ) ( ON ?auto_163754 ?auto_163756 ) ( not ( = ?auto_163754 ?auto_163756 ) ) ( not ( = ?auto_163759 ?auto_163756 ) ) ( not ( = ?auto_163757 ?auto_163756 ) ) ( not ( = ?auto_163758 ?auto_163756 ) ) ( not ( = ?auto_163760 ?auto_163756 ) ) ( not ( = ?auto_163761 ?auto_163756 ) ) ( not ( = ?auto_163762 ?auto_163756 ) ) ( not ( = ?auto_163755 ?auto_163756 ) ) ( ON ?auto_163759 ?auto_163754 ) ( ON-TABLE ?auto_163756 ) ( CLEAR ?auto_163762 ) ( ON ?auto_163755 ?auto_163759 ) ( CLEAR ?auto_163755 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_163756 ?auto_163754 ?auto_163759 )
      ( MAKE-1PILE ?auto_163754 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_163763 - BLOCK
    )
    :vars
    (
      ?auto_163769 - BLOCK
      ?auto_163765 - BLOCK
      ?auto_163766 - BLOCK
      ?auto_163771 - BLOCK
      ?auto_163768 - BLOCK
      ?auto_163767 - BLOCK
      ?auto_163770 - BLOCK
      ?auto_163764 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_163763 ?auto_163769 ) ) ( ON-TABLE ?auto_163765 ) ( ON ?auto_163766 ?auto_163765 ) ( ON ?auto_163771 ?auto_163766 ) ( ON ?auto_163768 ?auto_163771 ) ( not ( = ?auto_163765 ?auto_163766 ) ) ( not ( = ?auto_163765 ?auto_163771 ) ) ( not ( = ?auto_163765 ?auto_163768 ) ) ( not ( = ?auto_163765 ?auto_163767 ) ) ( not ( = ?auto_163765 ?auto_163770 ) ) ( not ( = ?auto_163765 ?auto_163769 ) ) ( not ( = ?auto_163765 ?auto_163763 ) ) ( not ( = ?auto_163766 ?auto_163771 ) ) ( not ( = ?auto_163766 ?auto_163768 ) ) ( not ( = ?auto_163766 ?auto_163767 ) ) ( not ( = ?auto_163766 ?auto_163770 ) ) ( not ( = ?auto_163766 ?auto_163769 ) ) ( not ( = ?auto_163766 ?auto_163763 ) ) ( not ( = ?auto_163771 ?auto_163768 ) ) ( not ( = ?auto_163771 ?auto_163767 ) ) ( not ( = ?auto_163771 ?auto_163770 ) ) ( not ( = ?auto_163771 ?auto_163769 ) ) ( not ( = ?auto_163771 ?auto_163763 ) ) ( not ( = ?auto_163768 ?auto_163767 ) ) ( not ( = ?auto_163768 ?auto_163770 ) ) ( not ( = ?auto_163768 ?auto_163769 ) ) ( not ( = ?auto_163768 ?auto_163763 ) ) ( not ( = ?auto_163767 ?auto_163770 ) ) ( not ( = ?auto_163767 ?auto_163769 ) ) ( not ( = ?auto_163767 ?auto_163763 ) ) ( not ( = ?auto_163770 ?auto_163769 ) ) ( not ( = ?auto_163770 ?auto_163763 ) ) ( ON ?auto_163763 ?auto_163764 ) ( not ( = ?auto_163763 ?auto_163764 ) ) ( not ( = ?auto_163769 ?auto_163764 ) ) ( not ( = ?auto_163765 ?auto_163764 ) ) ( not ( = ?auto_163766 ?auto_163764 ) ) ( not ( = ?auto_163771 ?auto_163764 ) ) ( not ( = ?auto_163768 ?auto_163764 ) ) ( not ( = ?auto_163767 ?auto_163764 ) ) ( not ( = ?auto_163770 ?auto_163764 ) ) ( ON ?auto_163769 ?auto_163763 ) ( ON-TABLE ?auto_163764 ) ( ON ?auto_163770 ?auto_163769 ) ( CLEAR ?auto_163770 ) ( HOLDING ?auto_163767 ) ( CLEAR ?auto_163768 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_163765 ?auto_163766 ?auto_163771 ?auto_163768 ?auto_163767 )
      ( MAKE-1PILE ?auto_163763 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_163772 - BLOCK
    )
    :vars
    (
      ?auto_163777 - BLOCK
      ?auto_163780 - BLOCK
      ?auto_163773 - BLOCK
      ?auto_163775 - BLOCK
      ?auto_163779 - BLOCK
      ?auto_163774 - BLOCK
      ?auto_163778 - BLOCK
      ?auto_163776 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_163772 ?auto_163777 ) ) ( ON-TABLE ?auto_163780 ) ( ON ?auto_163773 ?auto_163780 ) ( ON ?auto_163775 ?auto_163773 ) ( ON ?auto_163779 ?auto_163775 ) ( not ( = ?auto_163780 ?auto_163773 ) ) ( not ( = ?auto_163780 ?auto_163775 ) ) ( not ( = ?auto_163780 ?auto_163779 ) ) ( not ( = ?auto_163780 ?auto_163774 ) ) ( not ( = ?auto_163780 ?auto_163778 ) ) ( not ( = ?auto_163780 ?auto_163777 ) ) ( not ( = ?auto_163780 ?auto_163772 ) ) ( not ( = ?auto_163773 ?auto_163775 ) ) ( not ( = ?auto_163773 ?auto_163779 ) ) ( not ( = ?auto_163773 ?auto_163774 ) ) ( not ( = ?auto_163773 ?auto_163778 ) ) ( not ( = ?auto_163773 ?auto_163777 ) ) ( not ( = ?auto_163773 ?auto_163772 ) ) ( not ( = ?auto_163775 ?auto_163779 ) ) ( not ( = ?auto_163775 ?auto_163774 ) ) ( not ( = ?auto_163775 ?auto_163778 ) ) ( not ( = ?auto_163775 ?auto_163777 ) ) ( not ( = ?auto_163775 ?auto_163772 ) ) ( not ( = ?auto_163779 ?auto_163774 ) ) ( not ( = ?auto_163779 ?auto_163778 ) ) ( not ( = ?auto_163779 ?auto_163777 ) ) ( not ( = ?auto_163779 ?auto_163772 ) ) ( not ( = ?auto_163774 ?auto_163778 ) ) ( not ( = ?auto_163774 ?auto_163777 ) ) ( not ( = ?auto_163774 ?auto_163772 ) ) ( not ( = ?auto_163778 ?auto_163777 ) ) ( not ( = ?auto_163778 ?auto_163772 ) ) ( ON ?auto_163772 ?auto_163776 ) ( not ( = ?auto_163772 ?auto_163776 ) ) ( not ( = ?auto_163777 ?auto_163776 ) ) ( not ( = ?auto_163780 ?auto_163776 ) ) ( not ( = ?auto_163773 ?auto_163776 ) ) ( not ( = ?auto_163775 ?auto_163776 ) ) ( not ( = ?auto_163779 ?auto_163776 ) ) ( not ( = ?auto_163774 ?auto_163776 ) ) ( not ( = ?auto_163778 ?auto_163776 ) ) ( ON ?auto_163777 ?auto_163772 ) ( ON-TABLE ?auto_163776 ) ( ON ?auto_163778 ?auto_163777 ) ( CLEAR ?auto_163779 ) ( ON ?auto_163774 ?auto_163778 ) ( CLEAR ?auto_163774 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_163776 ?auto_163772 ?auto_163777 ?auto_163778 )
      ( MAKE-1PILE ?auto_163772 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_163781 - BLOCK
    )
    :vars
    (
      ?auto_163786 - BLOCK
      ?auto_163785 - BLOCK
      ?auto_163789 - BLOCK
      ?auto_163782 - BLOCK
      ?auto_163783 - BLOCK
      ?auto_163787 - BLOCK
      ?auto_163788 - BLOCK
      ?auto_163784 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_163781 ?auto_163786 ) ) ( ON-TABLE ?auto_163785 ) ( ON ?auto_163789 ?auto_163785 ) ( ON ?auto_163782 ?auto_163789 ) ( not ( = ?auto_163785 ?auto_163789 ) ) ( not ( = ?auto_163785 ?auto_163782 ) ) ( not ( = ?auto_163785 ?auto_163783 ) ) ( not ( = ?auto_163785 ?auto_163787 ) ) ( not ( = ?auto_163785 ?auto_163788 ) ) ( not ( = ?auto_163785 ?auto_163786 ) ) ( not ( = ?auto_163785 ?auto_163781 ) ) ( not ( = ?auto_163789 ?auto_163782 ) ) ( not ( = ?auto_163789 ?auto_163783 ) ) ( not ( = ?auto_163789 ?auto_163787 ) ) ( not ( = ?auto_163789 ?auto_163788 ) ) ( not ( = ?auto_163789 ?auto_163786 ) ) ( not ( = ?auto_163789 ?auto_163781 ) ) ( not ( = ?auto_163782 ?auto_163783 ) ) ( not ( = ?auto_163782 ?auto_163787 ) ) ( not ( = ?auto_163782 ?auto_163788 ) ) ( not ( = ?auto_163782 ?auto_163786 ) ) ( not ( = ?auto_163782 ?auto_163781 ) ) ( not ( = ?auto_163783 ?auto_163787 ) ) ( not ( = ?auto_163783 ?auto_163788 ) ) ( not ( = ?auto_163783 ?auto_163786 ) ) ( not ( = ?auto_163783 ?auto_163781 ) ) ( not ( = ?auto_163787 ?auto_163788 ) ) ( not ( = ?auto_163787 ?auto_163786 ) ) ( not ( = ?auto_163787 ?auto_163781 ) ) ( not ( = ?auto_163788 ?auto_163786 ) ) ( not ( = ?auto_163788 ?auto_163781 ) ) ( ON ?auto_163781 ?auto_163784 ) ( not ( = ?auto_163781 ?auto_163784 ) ) ( not ( = ?auto_163786 ?auto_163784 ) ) ( not ( = ?auto_163785 ?auto_163784 ) ) ( not ( = ?auto_163789 ?auto_163784 ) ) ( not ( = ?auto_163782 ?auto_163784 ) ) ( not ( = ?auto_163783 ?auto_163784 ) ) ( not ( = ?auto_163787 ?auto_163784 ) ) ( not ( = ?auto_163788 ?auto_163784 ) ) ( ON ?auto_163786 ?auto_163781 ) ( ON-TABLE ?auto_163784 ) ( ON ?auto_163788 ?auto_163786 ) ( ON ?auto_163787 ?auto_163788 ) ( CLEAR ?auto_163787 ) ( HOLDING ?auto_163783 ) ( CLEAR ?auto_163782 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_163785 ?auto_163789 ?auto_163782 ?auto_163783 )
      ( MAKE-1PILE ?auto_163781 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_163790 - BLOCK
    )
    :vars
    (
      ?auto_163796 - BLOCK
      ?auto_163791 - BLOCK
      ?auto_163792 - BLOCK
      ?auto_163798 - BLOCK
      ?auto_163793 - BLOCK
      ?auto_163797 - BLOCK
      ?auto_163794 - BLOCK
      ?auto_163795 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_163790 ?auto_163796 ) ) ( ON-TABLE ?auto_163791 ) ( ON ?auto_163792 ?auto_163791 ) ( ON ?auto_163798 ?auto_163792 ) ( not ( = ?auto_163791 ?auto_163792 ) ) ( not ( = ?auto_163791 ?auto_163798 ) ) ( not ( = ?auto_163791 ?auto_163793 ) ) ( not ( = ?auto_163791 ?auto_163797 ) ) ( not ( = ?auto_163791 ?auto_163794 ) ) ( not ( = ?auto_163791 ?auto_163796 ) ) ( not ( = ?auto_163791 ?auto_163790 ) ) ( not ( = ?auto_163792 ?auto_163798 ) ) ( not ( = ?auto_163792 ?auto_163793 ) ) ( not ( = ?auto_163792 ?auto_163797 ) ) ( not ( = ?auto_163792 ?auto_163794 ) ) ( not ( = ?auto_163792 ?auto_163796 ) ) ( not ( = ?auto_163792 ?auto_163790 ) ) ( not ( = ?auto_163798 ?auto_163793 ) ) ( not ( = ?auto_163798 ?auto_163797 ) ) ( not ( = ?auto_163798 ?auto_163794 ) ) ( not ( = ?auto_163798 ?auto_163796 ) ) ( not ( = ?auto_163798 ?auto_163790 ) ) ( not ( = ?auto_163793 ?auto_163797 ) ) ( not ( = ?auto_163793 ?auto_163794 ) ) ( not ( = ?auto_163793 ?auto_163796 ) ) ( not ( = ?auto_163793 ?auto_163790 ) ) ( not ( = ?auto_163797 ?auto_163794 ) ) ( not ( = ?auto_163797 ?auto_163796 ) ) ( not ( = ?auto_163797 ?auto_163790 ) ) ( not ( = ?auto_163794 ?auto_163796 ) ) ( not ( = ?auto_163794 ?auto_163790 ) ) ( ON ?auto_163790 ?auto_163795 ) ( not ( = ?auto_163790 ?auto_163795 ) ) ( not ( = ?auto_163796 ?auto_163795 ) ) ( not ( = ?auto_163791 ?auto_163795 ) ) ( not ( = ?auto_163792 ?auto_163795 ) ) ( not ( = ?auto_163798 ?auto_163795 ) ) ( not ( = ?auto_163793 ?auto_163795 ) ) ( not ( = ?auto_163797 ?auto_163795 ) ) ( not ( = ?auto_163794 ?auto_163795 ) ) ( ON ?auto_163796 ?auto_163790 ) ( ON-TABLE ?auto_163795 ) ( ON ?auto_163794 ?auto_163796 ) ( ON ?auto_163797 ?auto_163794 ) ( CLEAR ?auto_163798 ) ( ON ?auto_163793 ?auto_163797 ) ( CLEAR ?auto_163793 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_163795 ?auto_163790 ?auto_163796 ?auto_163794 ?auto_163797 )
      ( MAKE-1PILE ?auto_163790 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_163799 - BLOCK
    )
    :vars
    (
      ?auto_163805 - BLOCK
      ?auto_163802 - BLOCK
      ?auto_163803 - BLOCK
      ?auto_163806 - BLOCK
      ?auto_163800 - BLOCK
      ?auto_163801 - BLOCK
      ?auto_163804 - BLOCK
      ?auto_163807 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_163799 ?auto_163805 ) ) ( ON-TABLE ?auto_163802 ) ( ON ?auto_163803 ?auto_163802 ) ( not ( = ?auto_163802 ?auto_163803 ) ) ( not ( = ?auto_163802 ?auto_163806 ) ) ( not ( = ?auto_163802 ?auto_163800 ) ) ( not ( = ?auto_163802 ?auto_163801 ) ) ( not ( = ?auto_163802 ?auto_163804 ) ) ( not ( = ?auto_163802 ?auto_163805 ) ) ( not ( = ?auto_163802 ?auto_163799 ) ) ( not ( = ?auto_163803 ?auto_163806 ) ) ( not ( = ?auto_163803 ?auto_163800 ) ) ( not ( = ?auto_163803 ?auto_163801 ) ) ( not ( = ?auto_163803 ?auto_163804 ) ) ( not ( = ?auto_163803 ?auto_163805 ) ) ( not ( = ?auto_163803 ?auto_163799 ) ) ( not ( = ?auto_163806 ?auto_163800 ) ) ( not ( = ?auto_163806 ?auto_163801 ) ) ( not ( = ?auto_163806 ?auto_163804 ) ) ( not ( = ?auto_163806 ?auto_163805 ) ) ( not ( = ?auto_163806 ?auto_163799 ) ) ( not ( = ?auto_163800 ?auto_163801 ) ) ( not ( = ?auto_163800 ?auto_163804 ) ) ( not ( = ?auto_163800 ?auto_163805 ) ) ( not ( = ?auto_163800 ?auto_163799 ) ) ( not ( = ?auto_163801 ?auto_163804 ) ) ( not ( = ?auto_163801 ?auto_163805 ) ) ( not ( = ?auto_163801 ?auto_163799 ) ) ( not ( = ?auto_163804 ?auto_163805 ) ) ( not ( = ?auto_163804 ?auto_163799 ) ) ( ON ?auto_163799 ?auto_163807 ) ( not ( = ?auto_163799 ?auto_163807 ) ) ( not ( = ?auto_163805 ?auto_163807 ) ) ( not ( = ?auto_163802 ?auto_163807 ) ) ( not ( = ?auto_163803 ?auto_163807 ) ) ( not ( = ?auto_163806 ?auto_163807 ) ) ( not ( = ?auto_163800 ?auto_163807 ) ) ( not ( = ?auto_163801 ?auto_163807 ) ) ( not ( = ?auto_163804 ?auto_163807 ) ) ( ON ?auto_163805 ?auto_163799 ) ( ON-TABLE ?auto_163807 ) ( ON ?auto_163804 ?auto_163805 ) ( ON ?auto_163801 ?auto_163804 ) ( ON ?auto_163800 ?auto_163801 ) ( CLEAR ?auto_163800 ) ( HOLDING ?auto_163806 ) ( CLEAR ?auto_163803 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_163802 ?auto_163803 ?auto_163806 )
      ( MAKE-1PILE ?auto_163799 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_163808 - BLOCK
    )
    :vars
    (
      ?auto_163813 - BLOCK
      ?auto_163814 - BLOCK
      ?auto_163809 - BLOCK
      ?auto_163812 - BLOCK
      ?auto_163811 - BLOCK
      ?auto_163810 - BLOCK
      ?auto_163816 - BLOCK
      ?auto_163815 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_163808 ?auto_163813 ) ) ( ON-TABLE ?auto_163814 ) ( ON ?auto_163809 ?auto_163814 ) ( not ( = ?auto_163814 ?auto_163809 ) ) ( not ( = ?auto_163814 ?auto_163812 ) ) ( not ( = ?auto_163814 ?auto_163811 ) ) ( not ( = ?auto_163814 ?auto_163810 ) ) ( not ( = ?auto_163814 ?auto_163816 ) ) ( not ( = ?auto_163814 ?auto_163813 ) ) ( not ( = ?auto_163814 ?auto_163808 ) ) ( not ( = ?auto_163809 ?auto_163812 ) ) ( not ( = ?auto_163809 ?auto_163811 ) ) ( not ( = ?auto_163809 ?auto_163810 ) ) ( not ( = ?auto_163809 ?auto_163816 ) ) ( not ( = ?auto_163809 ?auto_163813 ) ) ( not ( = ?auto_163809 ?auto_163808 ) ) ( not ( = ?auto_163812 ?auto_163811 ) ) ( not ( = ?auto_163812 ?auto_163810 ) ) ( not ( = ?auto_163812 ?auto_163816 ) ) ( not ( = ?auto_163812 ?auto_163813 ) ) ( not ( = ?auto_163812 ?auto_163808 ) ) ( not ( = ?auto_163811 ?auto_163810 ) ) ( not ( = ?auto_163811 ?auto_163816 ) ) ( not ( = ?auto_163811 ?auto_163813 ) ) ( not ( = ?auto_163811 ?auto_163808 ) ) ( not ( = ?auto_163810 ?auto_163816 ) ) ( not ( = ?auto_163810 ?auto_163813 ) ) ( not ( = ?auto_163810 ?auto_163808 ) ) ( not ( = ?auto_163816 ?auto_163813 ) ) ( not ( = ?auto_163816 ?auto_163808 ) ) ( ON ?auto_163808 ?auto_163815 ) ( not ( = ?auto_163808 ?auto_163815 ) ) ( not ( = ?auto_163813 ?auto_163815 ) ) ( not ( = ?auto_163814 ?auto_163815 ) ) ( not ( = ?auto_163809 ?auto_163815 ) ) ( not ( = ?auto_163812 ?auto_163815 ) ) ( not ( = ?auto_163811 ?auto_163815 ) ) ( not ( = ?auto_163810 ?auto_163815 ) ) ( not ( = ?auto_163816 ?auto_163815 ) ) ( ON ?auto_163813 ?auto_163808 ) ( ON-TABLE ?auto_163815 ) ( ON ?auto_163816 ?auto_163813 ) ( ON ?auto_163810 ?auto_163816 ) ( ON ?auto_163811 ?auto_163810 ) ( CLEAR ?auto_163809 ) ( ON ?auto_163812 ?auto_163811 ) ( CLEAR ?auto_163812 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_163815 ?auto_163808 ?auto_163813 ?auto_163816 ?auto_163810 ?auto_163811 )
      ( MAKE-1PILE ?auto_163808 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_163817 - BLOCK
    )
    :vars
    (
      ?auto_163820 - BLOCK
      ?auto_163822 - BLOCK
      ?auto_163824 - BLOCK
      ?auto_163819 - BLOCK
      ?auto_163825 - BLOCK
      ?auto_163823 - BLOCK
      ?auto_163818 - BLOCK
      ?auto_163821 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_163817 ?auto_163820 ) ) ( ON-TABLE ?auto_163822 ) ( not ( = ?auto_163822 ?auto_163824 ) ) ( not ( = ?auto_163822 ?auto_163819 ) ) ( not ( = ?auto_163822 ?auto_163825 ) ) ( not ( = ?auto_163822 ?auto_163823 ) ) ( not ( = ?auto_163822 ?auto_163818 ) ) ( not ( = ?auto_163822 ?auto_163820 ) ) ( not ( = ?auto_163822 ?auto_163817 ) ) ( not ( = ?auto_163824 ?auto_163819 ) ) ( not ( = ?auto_163824 ?auto_163825 ) ) ( not ( = ?auto_163824 ?auto_163823 ) ) ( not ( = ?auto_163824 ?auto_163818 ) ) ( not ( = ?auto_163824 ?auto_163820 ) ) ( not ( = ?auto_163824 ?auto_163817 ) ) ( not ( = ?auto_163819 ?auto_163825 ) ) ( not ( = ?auto_163819 ?auto_163823 ) ) ( not ( = ?auto_163819 ?auto_163818 ) ) ( not ( = ?auto_163819 ?auto_163820 ) ) ( not ( = ?auto_163819 ?auto_163817 ) ) ( not ( = ?auto_163825 ?auto_163823 ) ) ( not ( = ?auto_163825 ?auto_163818 ) ) ( not ( = ?auto_163825 ?auto_163820 ) ) ( not ( = ?auto_163825 ?auto_163817 ) ) ( not ( = ?auto_163823 ?auto_163818 ) ) ( not ( = ?auto_163823 ?auto_163820 ) ) ( not ( = ?auto_163823 ?auto_163817 ) ) ( not ( = ?auto_163818 ?auto_163820 ) ) ( not ( = ?auto_163818 ?auto_163817 ) ) ( ON ?auto_163817 ?auto_163821 ) ( not ( = ?auto_163817 ?auto_163821 ) ) ( not ( = ?auto_163820 ?auto_163821 ) ) ( not ( = ?auto_163822 ?auto_163821 ) ) ( not ( = ?auto_163824 ?auto_163821 ) ) ( not ( = ?auto_163819 ?auto_163821 ) ) ( not ( = ?auto_163825 ?auto_163821 ) ) ( not ( = ?auto_163823 ?auto_163821 ) ) ( not ( = ?auto_163818 ?auto_163821 ) ) ( ON ?auto_163820 ?auto_163817 ) ( ON-TABLE ?auto_163821 ) ( ON ?auto_163818 ?auto_163820 ) ( ON ?auto_163823 ?auto_163818 ) ( ON ?auto_163825 ?auto_163823 ) ( ON ?auto_163819 ?auto_163825 ) ( CLEAR ?auto_163819 ) ( HOLDING ?auto_163824 ) ( CLEAR ?auto_163822 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_163822 ?auto_163824 )
      ( MAKE-1PILE ?auto_163817 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_163826 - BLOCK
    )
    :vars
    (
      ?auto_163828 - BLOCK
      ?auto_163827 - BLOCK
      ?auto_163834 - BLOCK
      ?auto_163833 - BLOCK
      ?auto_163832 - BLOCK
      ?auto_163831 - BLOCK
      ?auto_163830 - BLOCK
      ?auto_163829 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_163826 ?auto_163828 ) ) ( ON-TABLE ?auto_163827 ) ( not ( = ?auto_163827 ?auto_163834 ) ) ( not ( = ?auto_163827 ?auto_163833 ) ) ( not ( = ?auto_163827 ?auto_163832 ) ) ( not ( = ?auto_163827 ?auto_163831 ) ) ( not ( = ?auto_163827 ?auto_163830 ) ) ( not ( = ?auto_163827 ?auto_163828 ) ) ( not ( = ?auto_163827 ?auto_163826 ) ) ( not ( = ?auto_163834 ?auto_163833 ) ) ( not ( = ?auto_163834 ?auto_163832 ) ) ( not ( = ?auto_163834 ?auto_163831 ) ) ( not ( = ?auto_163834 ?auto_163830 ) ) ( not ( = ?auto_163834 ?auto_163828 ) ) ( not ( = ?auto_163834 ?auto_163826 ) ) ( not ( = ?auto_163833 ?auto_163832 ) ) ( not ( = ?auto_163833 ?auto_163831 ) ) ( not ( = ?auto_163833 ?auto_163830 ) ) ( not ( = ?auto_163833 ?auto_163828 ) ) ( not ( = ?auto_163833 ?auto_163826 ) ) ( not ( = ?auto_163832 ?auto_163831 ) ) ( not ( = ?auto_163832 ?auto_163830 ) ) ( not ( = ?auto_163832 ?auto_163828 ) ) ( not ( = ?auto_163832 ?auto_163826 ) ) ( not ( = ?auto_163831 ?auto_163830 ) ) ( not ( = ?auto_163831 ?auto_163828 ) ) ( not ( = ?auto_163831 ?auto_163826 ) ) ( not ( = ?auto_163830 ?auto_163828 ) ) ( not ( = ?auto_163830 ?auto_163826 ) ) ( ON ?auto_163826 ?auto_163829 ) ( not ( = ?auto_163826 ?auto_163829 ) ) ( not ( = ?auto_163828 ?auto_163829 ) ) ( not ( = ?auto_163827 ?auto_163829 ) ) ( not ( = ?auto_163834 ?auto_163829 ) ) ( not ( = ?auto_163833 ?auto_163829 ) ) ( not ( = ?auto_163832 ?auto_163829 ) ) ( not ( = ?auto_163831 ?auto_163829 ) ) ( not ( = ?auto_163830 ?auto_163829 ) ) ( ON ?auto_163828 ?auto_163826 ) ( ON-TABLE ?auto_163829 ) ( ON ?auto_163830 ?auto_163828 ) ( ON ?auto_163831 ?auto_163830 ) ( ON ?auto_163832 ?auto_163831 ) ( ON ?auto_163833 ?auto_163832 ) ( CLEAR ?auto_163827 ) ( ON ?auto_163834 ?auto_163833 ) ( CLEAR ?auto_163834 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_163829 ?auto_163826 ?auto_163828 ?auto_163830 ?auto_163831 ?auto_163832 ?auto_163833 )
      ( MAKE-1PILE ?auto_163826 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_163835 - BLOCK
    )
    :vars
    (
      ?auto_163842 - BLOCK
      ?auto_163839 - BLOCK
      ?auto_163843 - BLOCK
      ?auto_163840 - BLOCK
      ?auto_163837 - BLOCK
      ?auto_163836 - BLOCK
      ?auto_163838 - BLOCK
      ?auto_163841 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_163835 ?auto_163842 ) ) ( not ( = ?auto_163839 ?auto_163843 ) ) ( not ( = ?auto_163839 ?auto_163840 ) ) ( not ( = ?auto_163839 ?auto_163837 ) ) ( not ( = ?auto_163839 ?auto_163836 ) ) ( not ( = ?auto_163839 ?auto_163838 ) ) ( not ( = ?auto_163839 ?auto_163842 ) ) ( not ( = ?auto_163839 ?auto_163835 ) ) ( not ( = ?auto_163843 ?auto_163840 ) ) ( not ( = ?auto_163843 ?auto_163837 ) ) ( not ( = ?auto_163843 ?auto_163836 ) ) ( not ( = ?auto_163843 ?auto_163838 ) ) ( not ( = ?auto_163843 ?auto_163842 ) ) ( not ( = ?auto_163843 ?auto_163835 ) ) ( not ( = ?auto_163840 ?auto_163837 ) ) ( not ( = ?auto_163840 ?auto_163836 ) ) ( not ( = ?auto_163840 ?auto_163838 ) ) ( not ( = ?auto_163840 ?auto_163842 ) ) ( not ( = ?auto_163840 ?auto_163835 ) ) ( not ( = ?auto_163837 ?auto_163836 ) ) ( not ( = ?auto_163837 ?auto_163838 ) ) ( not ( = ?auto_163837 ?auto_163842 ) ) ( not ( = ?auto_163837 ?auto_163835 ) ) ( not ( = ?auto_163836 ?auto_163838 ) ) ( not ( = ?auto_163836 ?auto_163842 ) ) ( not ( = ?auto_163836 ?auto_163835 ) ) ( not ( = ?auto_163838 ?auto_163842 ) ) ( not ( = ?auto_163838 ?auto_163835 ) ) ( ON ?auto_163835 ?auto_163841 ) ( not ( = ?auto_163835 ?auto_163841 ) ) ( not ( = ?auto_163842 ?auto_163841 ) ) ( not ( = ?auto_163839 ?auto_163841 ) ) ( not ( = ?auto_163843 ?auto_163841 ) ) ( not ( = ?auto_163840 ?auto_163841 ) ) ( not ( = ?auto_163837 ?auto_163841 ) ) ( not ( = ?auto_163836 ?auto_163841 ) ) ( not ( = ?auto_163838 ?auto_163841 ) ) ( ON ?auto_163842 ?auto_163835 ) ( ON-TABLE ?auto_163841 ) ( ON ?auto_163838 ?auto_163842 ) ( ON ?auto_163836 ?auto_163838 ) ( ON ?auto_163837 ?auto_163836 ) ( ON ?auto_163840 ?auto_163837 ) ( ON ?auto_163843 ?auto_163840 ) ( CLEAR ?auto_163843 ) ( HOLDING ?auto_163839 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_163839 )
      ( MAKE-1PILE ?auto_163835 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_163844 - BLOCK
    )
    :vars
    (
      ?auto_163851 - BLOCK
      ?auto_163849 - BLOCK
      ?auto_163847 - BLOCK
      ?auto_163845 - BLOCK
      ?auto_163852 - BLOCK
      ?auto_163848 - BLOCK
      ?auto_163846 - BLOCK
      ?auto_163850 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_163844 ?auto_163851 ) ) ( not ( = ?auto_163849 ?auto_163847 ) ) ( not ( = ?auto_163849 ?auto_163845 ) ) ( not ( = ?auto_163849 ?auto_163852 ) ) ( not ( = ?auto_163849 ?auto_163848 ) ) ( not ( = ?auto_163849 ?auto_163846 ) ) ( not ( = ?auto_163849 ?auto_163851 ) ) ( not ( = ?auto_163849 ?auto_163844 ) ) ( not ( = ?auto_163847 ?auto_163845 ) ) ( not ( = ?auto_163847 ?auto_163852 ) ) ( not ( = ?auto_163847 ?auto_163848 ) ) ( not ( = ?auto_163847 ?auto_163846 ) ) ( not ( = ?auto_163847 ?auto_163851 ) ) ( not ( = ?auto_163847 ?auto_163844 ) ) ( not ( = ?auto_163845 ?auto_163852 ) ) ( not ( = ?auto_163845 ?auto_163848 ) ) ( not ( = ?auto_163845 ?auto_163846 ) ) ( not ( = ?auto_163845 ?auto_163851 ) ) ( not ( = ?auto_163845 ?auto_163844 ) ) ( not ( = ?auto_163852 ?auto_163848 ) ) ( not ( = ?auto_163852 ?auto_163846 ) ) ( not ( = ?auto_163852 ?auto_163851 ) ) ( not ( = ?auto_163852 ?auto_163844 ) ) ( not ( = ?auto_163848 ?auto_163846 ) ) ( not ( = ?auto_163848 ?auto_163851 ) ) ( not ( = ?auto_163848 ?auto_163844 ) ) ( not ( = ?auto_163846 ?auto_163851 ) ) ( not ( = ?auto_163846 ?auto_163844 ) ) ( ON ?auto_163844 ?auto_163850 ) ( not ( = ?auto_163844 ?auto_163850 ) ) ( not ( = ?auto_163851 ?auto_163850 ) ) ( not ( = ?auto_163849 ?auto_163850 ) ) ( not ( = ?auto_163847 ?auto_163850 ) ) ( not ( = ?auto_163845 ?auto_163850 ) ) ( not ( = ?auto_163852 ?auto_163850 ) ) ( not ( = ?auto_163848 ?auto_163850 ) ) ( not ( = ?auto_163846 ?auto_163850 ) ) ( ON ?auto_163851 ?auto_163844 ) ( ON-TABLE ?auto_163850 ) ( ON ?auto_163846 ?auto_163851 ) ( ON ?auto_163848 ?auto_163846 ) ( ON ?auto_163852 ?auto_163848 ) ( ON ?auto_163845 ?auto_163852 ) ( ON ?auto_163847 ?auto_163845 ) ( ON ?auto_163849 ?auto_163847 ) ( CLEAR ?auto_163849 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_163850 ?auto_163844 ?auto_163851 ?auto_163846 ?auto_163848 ?auto_163852 ?auto_163845 ?auto_163847 )
      ( MAKE-1PILE ?auto_163844 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_163859 - BLOCK
      ?auto_163860 - BLOCK
      ?auto_163861 - BLOCK
      ?auto_163862 - BLOCK
      ?auto_163863 - BLOCK
      ?auto_163864 - BLOCK
    )
    :vars
    (
      ?auto_163865 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_163865 ?auto_163864 ) ( CLEAR ?auto_163865 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_163859 ) ( ON ?auto_163860 ?auto_163859 ) ( ON ?auto_163861 ?auto_163860 ) ( ON ?auto_163862 ?auto_163861 ) ( ON ?auto_163863 ?auto_163862 ) ( ON ?auto_163864 ?auto_163863 ) ( not ( = ?auto_163859 ?auto_163860 ) ) ( not ( = ?auto_163859 ?auto_163861 ) ) ( not ( = ?auto_163859 ?auto_163862 ) ) ( not ( = ?auto_163859 ?auto_163863 ) ) ( not ( = ?auto_163859 ?auto_163864 ) ) ( not ( = ?auto_163859 ?auto_163865 ) ) ( not ( = ?auto_163860 ?auto_163861 ) ) ( not ( = ?auto_163860 ?auto_163862 ) ) ( not ( = ?auto_163860 ?auto_163863 ) ) ( not ( = ?auto_163860 ?auto_163864 ) ) ( not ( = ?auto_163860 ?auto_163865 ) ) ( not ( = ?auto_163861 ?auto_163862 ) ) ( not ( = ?auto_163861 ?auto_163863 ) ) ( not ( = ?auto_163861 ?auto_163864 ) ) ( not ( = ?auto_163861 ?auto_163865 ) ) ( not ( = ?auto_163862 ?auto_163863 ) ) ( not ( = ?auto_163862 ?auto_163864 ) ) ( not ( = ?auto_163862 ?auto_163865 ) ) ( not ( = ?auto_163863 ?auto_163864 ) ) ( not ( = ?auto_163863 ?auto_163865 ) ) ( not ( = ?auto_163864 ?auto_163865 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_163865 ?auto_163864 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_163866 - BLOCK
      ?auto_163867 - BLOCK
      ?auto_163868 - BLOCK
      ?auto_163869 - BLOCK
      ?auto_163870 - BLOCK
      ?auto_163871 - BLOCK
    )
    :vars
    (
      ?auto_163872 - BLOCK
      ?auto_163873 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_163872 ?auto_163871 ) ( CLEAR ?auto_163872 ) ( ON-TABLE ?auto_163866 ) ( ON ?auto_163867 ?auto_163866 ) ( ON ?auto_163868 ?auto_163867 ) ( ON ?auto_163869 ?auto_163868 ) ( ON ?auto_163870 ?auto_163869 ) ( ON ?auto_163871 ?auto_163870 ) ( not ( = ?auto_163866 ?auto_163867 ) ) ( not ( = ?auto_163866 ?auto_163868 ) ) ( not ( = ?auto_163866 ?auto_163869 ) ) ( not ( = ?auto_163866 ?auto_163870 ) ) ( not ( = ?auto_163866 ?auto_163871 ) ) ( not ( = ?auto_163866 ?auto_163872 ) ) ( not ( = ?auto_163867 ?auto_163868 ) ) ( not ( = ?auto_163867 ?auto_163869 ) ) ( not ( = ?auto_163867 ?auto_163870 ) ) ( not ( = ?auto_163867 ?auto_163871 ) ) ( not ( = ?auto_163867 ?auto_163872 ) ) ( not ( = ?auto_163868 ?auto_163869 ) ) ( not ( = ?auto_163868 ?auto_163870 ) ) ( not ( = ?auto_163868 ?auto_163871 ) ) ( not ( = ?auto_163868 ?auto_163872 ) ) ( not ( = ?auto_163869 ?auto_163870 ) ) ( not ( = ?auto_163869 ?auto_163871 ) ) ( not ( = ?auto_163869 ?auto_163872 ) ) ( not ( = ?auto_163870 ?auto_163871 ) ) ( not ( = ?auto_163870 ?auto_163872 ) ) ( not ( = ?auto_163871 ?auto_163872 ) ) ( HOLDING ?auto_163873 ) ( not ( = ?auto_163866 ?auto_163873 ) ) ( not ( = ?auto_163867 ?auto_163873 ) ) ( not ( = ?auto_163868 ?auto_163873 ) ) ( not ( = ?auto_163869 ?auto_163873 ) ) ( not ( = ?auto_163870 ?auto_163873 ) ) ( not ( = ?auto_163871 ?auto_163873 ) ) ( not ( = ?auto_163872 ?auto_163873 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_163873 )
      ( MAKE-6PILE ?auto_163866 ?auto_163867 ?auto_163868 ?auto_163869 ?auto_163870 ?auto_163871 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_163874 - BLOCK
      ?auto_163875 - BLOCK
      ?auto_163876 - BLOCK
      ?auto_163877 - BLOCK
      ?auto_163878 - BLOCK
      ?auto_163879 - BLOCK
    )
    :vars
    (
      ?auto_163881 - BLOCK
      ?auto_163880 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_163881 ?auto_163879 ) ( ON-TABLE ?auto_163874 ) ( ON ?auto_163875 ?auto_163874 ) ( ON ?auto_163876 ?auto_163875 ) ( ON ?auto_163877 ?auto_163876 ) ( ON ?auto_163878 ?auto_163877 ) ( ON ?auto_163879 ?auto_163878 ) ( not ( = ?auto_163874 ?auto_163875 ) ) ( not ( = ?auto_163874 ?auto_163876 ) ) ( not ( = ?auto_163874 ?auto_163877 ) ) ( not ( = ?auto_163874 ?auto_163878 ) ) ( not ( = ?auto_163874 ?auto_163879 ) ) ( not ( = ?auto_163874 ?auto_163881 ) ) ( not ( = ?auto_163875 ?auto_163876 ) ) ( not ( = ?auto_163875 ?auto_163877 ) ) ( not ( = ?auto_163875 ?auto_163878 ) ) ( not ( = ?auto_163875 ?auto_163879 ) ) ( not ( = ?auto_163875 ?auto_163881 ) ) ( not ( = ?auto_163876 ?auto_163877 ) ) ( not ( = ?auto_163876 ?auto_163878 ) ) ( not ( = ?auto_163876 ?auto_163879 ) ) ( not ( = ?auto_163876 ?auto_163881 ) ) ( not ( = ?auto_163877 ?auto_163878 ) ) ( not ( = ?auto_163877 ?auto_163879 ) ) ( not ( = ?auto_163877 ?auto_163881 ) ) ( not ( = ?auto_163878 ?auto_163879 ) ) ( not ( = ?auto_163878 ?auto_163881 ) ) ( not ( = ?auto_163879 ?auto_163881 ) ) ( not ( = ?auto_163874 ?auto_163880 ) ) ( not ( = ?auto_163875 ?auto_163880 ) ) ( not ( = ?auto_163876 ?auto_163880 ) ) ( not ( = ?auto_163877 ?auto_163880 ) ) ( not ( = ?auto_163878 ?auto_163880 ) ) ( not ( = ?auto_163879 ?auto_163880 ) ) ( not ( = ?auto_163881 ?auto_163880 ) ) ( ON ?auto_163880 ?auto_163881 ) ( CLEAR ?auto_163880 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_163874 ?auto_163875 ?auto_163876 ?auto_163877 ?auto_163878 ?auto_163879 ?auto_163881 )
      ( MAKE-6PILE ?auto_163874 ?auto_163875 ?auto_163876 ?auto_163877 ?auto_163878 ?auto_163879 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_163882 - BLOCK
      ?auto_163883 - BLOCK
      ?auto_163884 - BLOCK
      ?auto_163885 - BLOCK
      ?auto_163886 - BLOCK
      ?auto_163887 - BLOCK
    )
    :vars
    (
      ?auto_163888 - BLOCK
      ?auto_163889 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_163888 ?auto_163887 ) ( ON-TABLE ?auto_163882 ) ( ON ?auto_163883 ?auto_163882 ) ( ON ?auto_163884 ?auto_163883 ) ( ON ?auto_163885 ?auto_163884 ) ( ON ?auto_163886 ?auto_163885 ) ( ON ?auto_163887 ?auto_163886 ) ( not ( = ?auto_163882 ?auto_163883 ) ) ( not ( = ?auto_163882 ?auto_163884 ) ) ( not ( = ?auto_163882 ?auto_163885 ) ) ( not ( = ?auto_163882 ?auto_163886 ) ) ( not ( = ?auto_163882 ?auto_163887 ) ) ( not ( = ?auto_163882 ?auto_163888 ) ) ( not ( = ?auto_163883 ?auto_163884 ) ) ( not ( = ?auto_163883 ?auto_163885 ) ) ( not ( = ?auto_163883 ?auto_163886 ) ) ( not ( = ?auto_163883 ?auto_163887 ) ) ( not ( = ?auto_163883 ?auto_163888 ) ) ( not ( = ?auto_163884 ?auto_163885 ) ) ( not ( = ?auto_163884 ?auto_163886 ) ) ( not ( = ?auto_163884 ?auto_163887 ) ) ( not ( = ?auto_163884 ?auto_163888 ) ) ( not ( = ?auto_163885 ?auto_163886 ) ) ( not ( = ?auto_163885 ?auto_163887 ) ) ( not ( = ?auto_163885 ?auto_163888 ) ) ( not ( = ?auto_163886 ?auto_163887 ) ) ( not ( = ?auto_163886 ?auto_163888 ) ) ( not ( = ?auto_163887 ?auto_163888 ) ) ( not ( = ?auto_163882 ?auto_163889 ) ) ( not ( = ?auto_163883 ?auto_163889 ) ) ( not ( = ?auto_163884 ?auto_163889 ) ) ( not ( = ?auto_163885 ?auto_163889 ) ) ( not ( = ?auto_163886 ?auto_163889 ) ) ( not ( = ?auto_163887 ?auto_163889 ) ) ( not ( = ?auto_163888 ?auto_163889 ) ) ( HOLDING ?auto_163889 ) ( CLEAR ?auto_163888 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_163882 ?auto_163883 ?auto_163884 ?auto_163885 ?auto_163886 ?auto_163887 ?auto_163888 ?auto_163889 )
      ( MAKE-6PILE ?auto_163882 ?auto_163883 ?auto_163884 ?auto_163885 ?auto_163886 ?auto_163887 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_163890 - BLOCK
      ?auto_163891 - BLOCK
      ?auto_163892 - BLOCK
      ?auto_163893 - BLOCK
      ?auto_163894 - BLOCK
      ?auto_163895 - BLOCK
    )
    :vars
    (
      ?auto_163896 - BLOCK
      ?auto_163897 - BLOCK
      ?auto_163898 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_163896 ?auto_163895 ) ( ON-TABLE ?auto_163890 ) ( ON ?auto_163891 ?auto_163890 ) ( ON ?auto_163892 ?auto_163891 ) ( ON ?auto_163893 ?auto_163892 ) ( ON ?auto_163894 ?auto_163893 ) ( ON ?auto_163895 ?auto_163894 ) ( not ( = ?auto_163890 ?auto_163891 ) ) ( not ( = ?auto_163890 ?auto_163892 ) ) ( not ( = ?auto_163890 ?auto_163893 ) ) ( not ( = ?auto_163890 ?auto_163894 ) ) ( not ( = ?auto_163890 ?auto_163895 ) ) ( not ( = ?auto_163890 ?auto_163896 ) ) ( not ( = ?auto_163891 ?auto_163892 ) ) ( not ( = ?auto_163891 ?auto_163893 ) ) ( not ( = ?auto_163891 ?auto_163894 ) ) ( not ( = ?auto_163891 ?auto_163895 ) ) ( not ( = ?auto_163891 ?auto_163896 ) ) ( not ( = ?auto_163892 ?auto_163893 ) ) ( not ( = ?auto_163892 ?auto_163894 ) ) ( not ( = ?auto_163892 ?auto_163895 ) ) ( not ( = ?auto_163892 ?auto_163896 ) ) ( not ( = ?auto_163893 ?auto_163894 ) ) ( not ( = ?auto_163893 ?auto_163895 ) ) ( not ( = ?auto_163893 ?auto_163896 ) ) ( not ( = ?auto_163894 ?auto_163895 ) ) ( not ( = ?auto_163894 ?auto_163896 ) ) ( not ( = ?auto_163895 ?auto_163896 ) ) ( not ( = ?auto_163890 ?auto_163897 ) ) ( not ( = ?auto_163891 ?auto_163897 ) ) ( not ( = ?auto_163892 ?auto_163897 ) ) ( not ( = ?auto_163893 ?auto_163897 ) ) ( not ( = ?auto_163894 ?auto_163897 ) ) ( not ( = ?auto_163895 ?auto_163897 ) ) ( not ( = ?auto_163896 ?auto_163897 ) ) ( CLEAR ?auto_163896 ) ( ON ?auto_163897 ?auto_163898 ) ( CLEAR ?auto_163897 ) ( HAND-EMPTY ) ( not ( = ?auto_163890 ?auto_163898 ) ) ( not ( = ?auto_163891 ?auto_163898 ) ) ( not ( = ?auto_163892 ?auto_163898 ) ) ( not ( = ?auto_163893 ?auto_163898 ) ) ( not ( = ?auto_163894 ?auto_163898 ) ) ( not ( = ?auto_163895 ?auto_163898 ) ) ( not ( = ?auto_163896 ?auto_163898 ) ) ( not ( = ?auto_163897 ?auto_163898 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_163897 ?auto_163898 )
      ( MAKE-6PILE ?auto_163890 ?auto_163891 ?auto_163892 ?auto_163893 ?auto_163894 ?auto_163895 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_163917 - BLOCK
      ?auto_163918 - BLOCK
      ?auto_163919 - BLOCK
      ?auto_163920 - BLOCK
      ?auto_163921 - BLOCK
      ?auto_163922 - BLOCK
    )
    :vars
    (
      ?auto_163925 - BLOCK
      ?auto_163924 - BLOCK
      ?auto_163923 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_163917 ) ( ON ?auto_163918 ?auto_163917 ) ( ON ?auto_163919 ?auto_163918 ) ( ON ?auto_163920 ?auto_163919 ) ( ON ?auto_163921 ?auto_163920 ) ( not ( = ?auto_163917 ?auto_163918 ) ) ( not ( = ?auto_163917 ?auto_163919 ) ) ( not ( = ?auto_163917 ?auto_163920 ) ) ( not ( = ?auto_163917 ?auto_163921 ) ) ( not ( = ?auto_163917 ?auto_163922 ) ) ( not ( = ?auto_163917 ?auto_163925 ) ) ( not ( = ?auto_163918 ?auto_163919 ) ) ( not ( = ?auto_163918 ?auto_163920 ) ) ( not ( = ?auto_163918 ?auto_163921 ) ) ( not ( = ?auto_163918 ?auto_163922 ) ) ( not ( = ?auto_163918 ?auto_163925 ) ) ( not ( = ?auto_163919 ?auto_163920 ) ) ( not ( = ?auto_163919 ?auto_163921 ) ) ( not ( = ?auto_163919 ?auto_163922 ) ) ( not ( = ?auto_163919 ?auto_163925 ) ) ( not ( = ?auto_163920 ?auto_163921 ) ) ( not ( = ?auto_163920 ?auto_163922 ) ) ( not ( = ?auto_163920 ?auto_163925 ) ) ( not ( = ?auto_163921 ?auto_163922 ) ) ( not ( = ?auto_163921 ?auto_163925 ) ) ( not ( = ?auto_163922 ?auto_163925 ) ) ( not ( = ?auto_163917 ?auto_163924 ) ) ( not ( = ?auto_163918 ?auto_163924 ) ) ( not ( = ?auto_163919 ?auto_163924 ) ) ( not ( = ?auto_163920 ?auto_163924 ) ) ( not ( = ?auto_163921 ?auto_163924 ) ) ( not ( = ?auto_163922 ?auto_163924 ) ) ( not ( = ?auto_163925 ?auto_163924 ) ) ( ON ?auto_163924 ?auto_163923 ) ( not ( = ?auto_163917 ?auto_163923 ) ) ( not ( = ?auto_163918 ?auto_163923 ) ) ( not ( = ?auto_163919 ?auto_163923 ) ) ( not ( = ?auto_163920 ?auto_163923 ) ) ( not ( = ?auto_163921 ?auto_163923 ) ) ( not ( = ?auto_163922 ?auto_163923 ) ) ( not ( = ?auto_163925 ?auto_163923 ) ) ( not ( = ?auto_163924 ?auto_163923 ) ) ( ON ?auto_163925 ?auto_163924 ) ( CLEAR ?auto_163925 ) ( HOLDING ?auto_163922 ) ( CLEAR ?auto_163921 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_163917 ?auto_163918 ?auto_163919 ?auto_163920 ?auto_163921 ?auto_163922 ?auto_163925 )
      ( MAKE-6PILE ?auto_163917 ?auto_163918 ?auto_163919 ?auto_163920 ?auto_163921 ?auto_163922 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_163926 - BLOCK
      ?auto_163927 - BLOCK
      ?auto_163928 - BLOCK
      ?auto_163929 - BLOCK
      ?auto_163930 - BLOCK
      ?auto_163931 - BLOCK
    )
    :vars
    (
      ?auto_163932 - BLOCK
      ?auto_163933 - BLOCK
      ?auto_163934 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_163926 ) ( ON ?auto_163927 ?auto_163926 ) ( ON ?auto_163928 ?auto_163927 ) ( ON ?auto_163929 ?auto_163928 ) ( ON ?auto_163930 ?auto_163929 ) ( not ( = ?auto_163926 ?auto_163927 ) ) ( not ( = ?auto_163926 ?auto_163928 ) ) ( not ( = ?auto_163926 ?auto_163929 ) ) ( not ( = ?auto_163926 ?auto_163930 ) ) ( not ( = ?auto_163926 ?auto_163931 ) ) ( not ( = ?auto_163926 ?auto_163932 ) ) ( not ( = ?auto_163927 ?auto_163928 ) ) ( not ( = ?auto_163927 ?auto_163929 ) ) ( not ( = ?auto_163927 ?auto_163930 ) ) ( not ( = ?auto_163927 ?auto_163931 ) ) ( not ( = ?auto_163927 ?auto_163932 ) ) ( not ( = ?auto_163928 ?auto_163929 ) ) ( not ( = ?auto_163928 ?auto_163930 ) ) ( not ( = ?auto_163928 ?auto_163931 ) ) ( not ( = ?auto_163928 ?auto_163932 ) ) ( not ( = ?auto_163929 ?auto_163930 ) ) ( not ( = ?auto_163929 ?auto_163931 ) ) ( not ( = ?auto_163929 ?auto_163932 ) ) ( not ( = ?auto_163930 ?auto_163931 ) ) ( not ( = ?auto_163930 ?auto_163932 ) ) ( not ( = ?auto_163931 ?auto_163932 ) ) ( not ( = ?auto_163926 ?auto_163933 ) ) ( not ( = ?auto_163927 ?auto_163933 ) ) ( not ( = ?auto_163928 ?auto_163933 ) ) ( not ( = ?auto_163929 ?auto_163933 ) ) ( not ( = ?auto_163930 ?auto_163933 ) ) ( not ( = ?auto_163931 ?auto_163933 ) ) ( not ( = ?auto_163932 ?auto_163933 ) ) ( ON ?auto_163933 ?auto_163934 ) ( not ( = ?auto_163926 ?auto_163934 ) ) ( not ( = ?auto_163927 ?auto_163934 ) ) ( not ( = ?auto_163928 ?auto_163934 ) ) ( not ( = ?auto_163929 ?auto_163934 ) ) ( not ( = ?auto_163930 ?auto_163934 ) ) ( not ( = ?auto_163931 ?auto_163934 ) ) ( not ( = ?auto_163932 ?auto_163934 ) ) ( not ( = ?auto_163933 ?auto_163934 ) ) ( ON ?auto_163932 ?auto_163933 ) ( CLEAR ?auto_163930 ) ( ON ?auto_163931 ?auto_163932 ) ( CLEAR ?auto_163931 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_163934 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_163934 ?auto_163933 ?auto_163932 )
      ( MAKE-6PILE ?auto_163926 ?auto_163927 ?auto_163928 ?auto_163929 ?auto_163930 ?auto_163931 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_163935 - BLOCK
      ?auto_163936 - BLOCK
      ?auto_163937 - BLOCK
      ?auto_163938 - BLOCK
      ?auto_163939 - BLOCK
      ?auto_163940 - BLOCK
    )
    :vars
    (
      ?auto_163941 - BLOCK
      ?auto_163943 - BLOCK
      ?auto_163942 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_163935 ) ( ON ?auto_163936 ?auto_163935 ) ( ON ?auto_163937 ?auto_163936 ) ( ON ?auto_163938 ?auto_163937 ) ( not ( = ?auto_163935 ?auto_163936 ) ) ( not ( = ?auto_163935 ?auto_163937 ) ) ( not ( = ?auto_163935 ?auto_163938 ) ) ( not ( = ?auto_163935 ?auto_163939 ) ) ( not ( = ?auto_163935 ?auto_163940 ) ) ( not ( = ?auto_163935 ?auto_163941 ) ) ( not ( = ?auto_163936 ?auto_163937 ) ) ( not ( = ?auto_163936 ?auto_163938 ) ) ( not ( = ?auto_163936 ?auto_163939 ) ) ( not ( = ?auto_163936 ?auto_163940 ) ) ( not ( = ?auto_163936 ?auto_163941 ) ) ( not ( = ?auto_163937 ?auto_163938 ) ) ( not ( = ?auto_163937 ?auto_163939 ) ) ( not ( = ?auto_163937 ?auto_163940 ) ) ( not ( = ?auto_163937 ?auto_163941 ) ) ( not ( = ?auto_163938 ?auto_163939 ) ) ( not ( = ?auto_163938 ?auto_163940 ) ) ( not ( = ?auto_163938 ?auto_163941 ) ) ( not ( = ?auto_163939 ?auto_163940 ) ) ( not ( = ?auto_163939 ?auto_163941 ) ) ( not ( = ?auto_163940 ?auto_163941 ) ) ( not ( = ?auto_163935 ?auto_163943 ) ) ( not ( = ?auto_163936 ?auto_163943 ) ) ( not ( = ?auto_163937 ?auto_163943 ) ) ( not ( = ?auto_163938 ?auto_163943 ) ) ( not ( = ?auto_163939 ?auto_163943 ) ) ( not ( = ?auto_163940 ?auto_163943 ) ) ( not ( = ?auto_163941 ?auto_163943 ) ) ( ON ?auto_163943 ?auto_163942 ) ( not ( = ?auto_163935 ?auto_163942 ) ) ( not ( = ?auto_163936 ?auto_163942 ) ) ( not ( = ?auto_163937 ?auto_163942 ) ) ( not ( = ?auto_163938 ?auto_163942 ) ) ( not ( = ?auto_163939 ?auto_163942 ) ) ( not ( = ?auto_163940 ?auto_163942 ) ) ( not ( = ?auto_163941 ?auto_163942 ) ) ( not ( = ?auto_163943 ?auto_163942 ) ) ( ON ?auto_163941 ?auto_163943 ) ( ON ?auto_163940 ?auto_163941 ) ( CLEAR ?auto_163940 ) ( ON-TABLE ?auto_163942 ) ( HOLDING ?auto_163939 ) ( CLEAR ?auto_163938 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_163935 ?auto_163936 ?auto_163937 ?auto_163938 ?auto_163939 )
      ( MAKE-6PILE ?auto_163935 ?auto_163936 ?auto_163937 ?auto_163938 ?auto_163939 ?auto_163940 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_163944 - BLOCK
      ?auto_163945 - BLOCK
      ?auto_163946 - BLOCK
      ?auto_163947 - BLOCK
      ?auto_163948 - BLOCK
      ?auto_163949 - BLOCK
    )
    :vars
    (
      ?auto_163950 - BLOCK
      ?auto_163951 - BLOCK
      ?auto_163952 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_163944 ) ( ON ?auto_163945 ?auto_163944 ) ( ON ?auto_163946 ?auto_163945 ) ( ON ?auto_163947 ?auto_163946 ) ( not ( = ?auto_163944 ?auto_163945 ) ) ( not ( = ?auto_163944 ?auto_163946 ) ) ( not ( = ?auto_163944 ?auto_163947 ) ) ( not ( = ?auto_163944 ?auto_163948 ) ) ( not ( = ?auto_163944 ?auto_163949 ) ) ( not ( = ?auto_163944 ?auto_163950 ) ) ( not ( = ?auto_163945 ?auto_163946 ) ) ( not ( = ?auto_163945 ?auto_163947 ) ) ( not ( = ?auto_163945 ?auto_163948 ) ) ( not ( = ?auto_163945 ?auto_163949 ) ) ( not ( = ?auto_163945 ?auto_163950 ) ) ( not ( = ?auto_163946 ?auto_163947 ) ) ( not ( = ?auto_163946 ?auto_163948 ) ) ( not ( = ?auto_163946 ?auto_163949 ) ) ( not ( = ?auto_163946 ?auto_163950 ) ) ( not ( = ?auto_163947 ?auto_163948 ) ) ( not ( = ?auto_163947 ?auto_163949 ) ) ( not ( = ?auto_163947 ?auto_163950 ) ) ( not ( = ?auto_163948 ?auto_163949 ) ) ( not ( = ?auto_163948 ?auto_163950 ) ) ( not ( = ?auto_163949 ?auto_163950 ) ) ( not ( = ?auto_163944 ?auto_163951 ) ) ( not ( = ?auto_163945 ?auto_163951 ) ) ( not ( = ?auto_163946 ?auto_163951 ) ) ( not ( = ?auto_163947 ?auto_163951 ) ) ( not ( = ?auto_163948 ?auto_163951 ) ) ( not ( = ?auto_163949 ?auto_163951 ) ) ( not ( = ?auto_163950 ?auto_163951 ) ) ( ON ?auto_163951 ?auto_163952 ) ( not ( = ?auto_163944 ?auto_163952 ) ) ( not ( = ?auto_163945 ?auto_163952 ) ) ( not ( = ?auto_163946 ?auto_163952 ) ) ( not ( = ?auto_163947 ?auto_163952 ) ) ( not ( = ?auto_163948 ?auto_163952 ) ) ( not ( = ?auto_163949 ?auto_163952 ) ) ( not ( = ?auto_163950 ?auto_163952 ) ) ( not ( = ?auto_163951 ?auto_163952 ) ) ( ON ?auto_163950 ?auto_163951 ) ( ON ?auto_163949 ?auto_163950 ) ( ON-TABLE ?auto_163952 ) ( CLEAR ?auto_163947 ) ( ON ?auto_163948 ?auto_163949 ) ( CLEAR ?auto_163948 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_163952 ?auto_163951 ?auto_163950 ?auto_163949 )
      ( MAKE-6PILE ?auto_163944 ?auto_163945 ?auto_163946 ?auto_163947 ?auto_163948 ?auto_163949 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_163953 - BLOCK
      ?auto_163954 - BLOCK
      ?auto_163955 - BLOCK
      ?auto_163956 - BLOCK
      ?auto_163957 - BLOCK
      ?auto_163958 - BLOCK
    )
    :vars
    (
      ?auto_163959 - BLOCK
      ?auto_163961 - BLOCK
      ?auto_163960 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_163953 ) ( ON ?auto_163954 ?auto_163953 ) ( ON ?auto_163955 ?auto_163954 ) ( not ( = ?auto_163953 ?auto_163954 ) ) ( not ( = ?auto_163953 ?auto_163955 ) ) ( not ( = ?auto_163953 ?auto_163956 ) ) ( not ( = ?auto_163953 ?auto_163957 ) ) ( not ( = ?auto_163953 ?auto_163958 ) ) ( not ( = ?auto_163953 ?auto_163959 ) ) ( not ( = ?auto_163954 ?auto_163955 ) ) ( not ( = ?auto_163954 ?auto_163956 ) ) ( not ( = ?auto_163954 ?auto_163957 ) ) ( not ( = ?auto_163954 ?auto_163958 ) ) ( not ( = ?auto_163954 ?auto_163959 ) ) ( not ( = ?auto_163955 ?auto_163956 ) ) ( not ( = ?auto_163955 ?auto_163957 ) ) ( not ( = ?auto_163955 ?auto_163958 ) ) ( not ( = ?auto_163955 ?auto_163959 ) ) ( not ( = ?auto_163956 ?auto_163957 ) ) ( not ( = ?auto_163956 ?auto_163958 ) ) ( not ( = ?auto_163956 ?auto_163959 ) ) ( not ( = ?auto_163957 ?auto_163958 ) ) ( not ( = ?auto_163957 ?auto_163959 ) ) ( not ( = ?auto_163958 ?auto_163959 ) ) ( not ( = ?auto_163953 ?auto_163961 ) ) ( not ( = ?auto_163954 ?auto_163961 ) ) ( not ( = ?auto_163955 ?auto_163961 ) ) ( not ( = ?auto_163956 ?auto_163961 ) ) ( not ( = ?auto_163957 ?auto_163961 ) ) ( not ( = ?auto_163958 ?auto_163961 ) ) ( not ( = ?auto_163959 ?auto_163961 ) ) ( ON ?auto_163961 ?auto_163960 ) ( not ( = ?auto_163953 ?auto_163960 ) ) ( not ( = ?auto_163954 ?auto_163960 ) ) ( not ( = ?auto_163955 ?auto_163960 ) ) ( not ( = ?auto_163956 ?auto_163960 ) ) ( not ( = ?auto_163957 ?auto_163960 ) ) ( not ( = ?auto_163958 ?auto_163960 ) ) ( not ( = ?auto_163959 ?auto_163960 ) ) ( not ( = ?auto_163961 ?auto_163960 ) ) ( ON ?auto_163959 ?auto_163961 ) ( ON ?auto_163958 ?auto_163959 ) ( ON-TABLE ?auto_163960 ) ( ON ?auto_163957 ?auto_163958 ) ( CLEAR ?auto_163957 ) ( HOLDING ?auto_163956 ) ( CLEAR ?auto_163955 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_163953 ?auto_163954 ?auto_163955 ?auto_163956 )
      ( MAKE-6PILE ?auto_163953 ?auto_163954 ?auto_163955 ?auto_163956 ?auto_163957 ?auto_163958 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_163962 - BLOCK
      ?auto_163963 - BLOCK
      ?auto_163964 - BLOCK
      ?auto_163965 - BLOCK
      ?auto_163966 - BLOCK
      ?auto_163967 - BLOCK
    )
    :vars
    (
      ?auto_163968 - BLOCK
      ?auto_163969 - BLOCK
      ?auto_163970 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_163962 ) ( ON ?auto_163963 ?auto_163962 ) ( ON ?auto_163964 ?auto_163963 ) ( not ( = ?auto_163962 ?auto_163963 ) ) ( not ( = ?auto_163962 ?auto_163964 ) ) ( not ( = ?auto_163962 ?auto_163965 ) ) ( not ( = ?auto_163962 ?auto_163966 ) ) ( not ( = ?auto_163962 ?auto_163967 ) ) ( not ( = ?auto_163962 ?auto_163968 ) ) ( not ( = ?auto_163963 ?auto_163964 ) ) ( not ( = ?auto_163963 ?auto_163965 ) ) ( not ( = ?auto_163963 ?auto_163966 ) ) ( not ( = ?auto_163963 ?auto_163967 ) ) ( not ( = ?auto_163963 ?auto_163968 ) ) ( not ( = ?auto_163964 ?auto_163965 ) ) ( not ( = ?auto_163964 ?auto_163966 ) ) ( not ( = ?auto_163964 ?auto_163967 ) ) ( not ( = ?auto_163964 ?auto_163968 ) ) ( not ( = ?auto_163965 ?auto_163966 ) ) ( not ( = ?auto_163965 ?auto_163967 ) ) ( not ( = ?auto_163965 ?auto_163968 ) ) ( not ( = ?auto_163966 ?auto_163967 ) ) ( not ( = ?auto_163966 ?auto_163968 ) ) ( not ( = ?auto_163967 ?auto_163968 ) ) ( not ( = ?auto_163962 ?auto_163969 ) ) ( not ( = ?auto_163963 ?auto_163969 ) ) ( not ( = ?auto_163964 ?auto_163969 ) ) ( not ( = ?auto_163965 ?auto_163969 ) ) ( not ( = ?auto_163966 ?auto_163969 ) ) ( not ( = ?auto_163967 ?auto_163969 ) ) ( not ( = ?auto_163968 ?auto_163969 ) ) ( ON ?auto_163969 ?auto_163970 ) ( not ( = ?auto_163962 ?auto_163970 ) ) ( not ( = ?auto_163963 ?auto_163970 ) ) ( not ( = ?auto_163964 ?auto_163970 ) ) ( not ( = ?auto_163965 ?auto_163970 ) ) ( not ( = ?auto_163966 ?auto_163970 ) ) ( not ( = ?auto_163967 ?auto_163970 ) ) ( not ( = ?auto_163968 ?auto_163970 ) ) ( not ( = ?auto_163969 ?auto_163970 ) ) ( ON ?auto_163968 ?auto_163969 ) ( ON ?auto_163967 ?auto_163968 ) ( ON-TABLE ?auto_163970 ) ( ON ?auto_163966 ?auto_163967 ) ( CLEAR ?auto_163964 ) ( ON ?auto_163965 ?auto_163966 ) ( CLEAR ?auto_163965 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_163970 ?auto_163969 ?auto_163968 ?auto_163967 ?auto_163966 )
      ( MAKE-6PILE ?auto_163962 ?auto_163963 ?auto_163964 ?auto_163965 ?auto_163966 ?auto_163967 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_163971 - BLOCK
      ?auto_163972 - BLOCK
      ?auto_163973 - BLOCK
      ?auto_163974 - BLOCK
      ?auto_163975 - BLOCK
      ?auto_163976 - BLOCK
    )
    :vars
    (
      ?auto_163978 - BLOCK
      ?auto_163979 - BLOCK
      ?auto_163977 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_163971 ) ( ON ?auto_163972 ?auto_163971 ) ( not ( = ?auto_163971 ?auto_163972 ) ) ( not ( = ?auto_163971 ?auto_163973 ) ) ( not ( = ?auto_163971 ?auto_163974 ) ) ( not ( = ?auto_163971 ?auto_163975 ) ) ( not ( = ?auto_163971 ?auto_163976 ) ) ( not ( = ?auto_163971 ?auto_163978 ) ) ( not ( = ?auto_163972 ?auto_163973 ) ) ( not ( = ?auto_163972 ?auto_163974 ) ) ( not ( = ?auto_163972 ?auto_163975 ) ) ( not ( = ?auto_163972 ?auto_163976 ) ) ( not ( = ?auto_163972 ?auto_163978 ) ) ( not ( = ?auto_163973 ?auto_163974 ) ) ( not ( = ?auto_163973 ?auto_163975 ) ) ( not ( = ?auto_163973 ?auto_163976 ) ) ( not ( = ?auto_163973 ?auto_163978 ) ) ( not ( = ?auto_163974 ?auto_163975 ) ) ( not ( = ?auto_163974 ?auto_163976 ) ) ( not ( = ?auto_163974 ?auto_163978 ) ) ( not ( = ?auto_163975 ?auto_163976 ) ) ( not ( = ?auto_163975 ?auto_163978 ) ) ( not ( = ?auto_163976 ?auto_163978 ) ) ( not ( = ?auto_163971 ?auto_163979 ) ) ( not ( = ?auto_163972 ?auto_163979 ) ) ( not ( = ?auto_163973 ?auto_163979 ) ) ( not ( = ?auto_163974 ?auto_163979 ) ) ( not ( = ?auto_163975 ?auto_163979 ) ) ( not ( = ?auto_163976 ?auto_163979 ) ) ( not ( = ?auto_163978 ?auto_163979 ) ) ( ON ?auto_163979 ?auto_163977 ) ( not ( = ?auto_163971 ?auto_163977 ) ) ( not ( = ?auto_163972 ?auto_163977 ) ) ( not ( = ?auto_163973 ?auto_163977 ) ) ( not ( = ?auto_163974 ?auto_163977 ) ) ( not ( = ?auto_163975 ?auto_163977 ) ) ( not ( = ?auto_163976 ?auto_163977 ) ) ( not ( = ?auto_163978 ?auto_163977 ) ) ( not ( = ?auto_163979 ?auto_163977 ) ) ( ON ?auto_163978 ?auto_163979 ) ( ON ?auto_163976 ?auto_163978 ) ( ON-TABLE ?auto_163977 ) ( ON ?auto_163975 ?auto_163976 ) ( ON ?auto_163974 ?auto_163975 ) ( CLEAR ?auto_163974 ) ( HOLDING ?auto_163973 ) ( CLEAR ?auto_163972 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_163971 ?auto_163972 ?auto_163973 )
      ( MAKE-6PILE ?auto_163971 ?auto_163972 ?auto_163973 ?auto_163974 ?auto_163975 ?auto_163976 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_163980 - BLOCK
      ?auto_163981 - BLOCK
      ?auto_163982 - BLOCK
      ?auto_163983 - BLOCK
      ?auto_163984 - BLOCK
      ?auto_163985 - BLOCK
    )
    :vars
    (
      ?auto_163986 - BLOCK
      ?auto_163987 - BLOCK
      ?auto_163988 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_163980 ) ( ON ?auto_163981 ?auto_163980 ) ( not ( = ?auto_163980 ?auto_163981 ) ) ( not ( = ?auto_163980 ?auto_163982 ) ) ( not ( = ?auto_163980 ?auto_163983 ) ) ( not ( = ?auto_163980 ?auto_163984 ) ) ( not ( = ?auto_163980 ?auto_163985 ) ) ( not ( = ?auto_163980 ?auto_163986 ) ) ( not ( = ?auto_163981 ?auto_163982 ) ) ( not ( = ?auto_163981 ?auto_163983 ) ) ( not ( = ?auto_163981 ?auto_163984 ) ) ( not ( = ?auto_163981 ?auto_163985 ) ) ( not ( = ?auto_163981 ?auto_163986 ) ) ( not ( = ?auto_163982 ?auto_163983 ) ) ( not ( = ?auto_163982 ?auto_163984 ) ) ( not ( = ?auto_163982 ?auto_163985 ) ) ( not ( = ?auto_163982 ?auto_163986 ) ) ( not ( = ?auto_163983 ?auto_163984 ) ) ( not ( = ?auto_163983 ?auto_163985 ) ) ( not ( = ?auto_163983 ?auto_163986 ) ) ( not ( = ?auto_163984 ?auto_163985 ) ) ( not ( = ?auto_163984 ?auto_163986 ) ) ( not ( = ?auto_163985 ?auto_163986 ) ) ( not ( = ?auto_163980 ?auto_163987 ) ) ( not ( = ?auto_163981 ?auto_163987 ) ) ( not ( = ?auto_163982 ?auto_163987 ) ) ( not ( = ?auto_163983 ?auto_163987 ) ) ( not ( = ?auto_163984 ?auto_163987 ) ) ( not ( = ?auto_163985 ?auto_163987 ) ) ( not ( = ?auto_163986 ?auto_163987 ) ) ( ON ?auto_163987 ?auto_163988 ) ( not ( = ?auto_163980 ?auto_163988 ) ) ( not ( = ?auto_163981 ?auto_163988 ) ) ( not ( = ?auto_163982 ?auto_163988 ) ) ( not ( = ?auto_163983 ?auto_163988 ) ) ( not ( = ?auto_163984 ?auto_163988 ) ) ( not ( = ?auto_163985 ?auto_163988 ) ) ( not ( = ?auto_163986 ?auto_163988 ) ) ( not ( = ?auto_163987 ?auto_163988 ) ) ( ON ?auto_163986 ?auto_163987 ) ( ON ?auto_163985 ?auto_163986 ) ( ON-TABLE ?auto_163988 ) ( ON ?auto_163984 ?auto_163985 ) ( ON ?auto_163983 ?auto_163984 ) ( CLEAR ?auto_163981 ) ( ON ?auto_163982 ?auto_163983 ) ( CLEAR ?auto_163982 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_163988 ?auto_163987 ?auto_163986 ?auto_163985 ?auto_163984 ?auto_163983 )
      ( MAKE-6PILE ?auto_163980 ?auto_163981 ?auto_163982 ?auto_163983 ?auto_163984 ?auto_163985 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_163989 - BLOCK
      ?auto_163990 - BLOCK
      ?auto_163991 - BLOCK
      ?auto_163992 - BLOCK
      ?auto_163993 - BLOCK
      ?auto_163994 - BLOCK
    )
    :vars
    (
      ?auto_163996 - BLOCK
      ?auto_163997 - BLOCK
      ?auto_163995 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_163989 ) ( not ( = ?auto_163989 ?auto_163990 ) ) ( not ( = ?auto_163989 ?auto_163991 ) ) ( not ( = ?auto_163989 ?auto_163992 ) ) ( not ( = ?auto_163989 ?auto_163993 ) ) ( not ( = ?auto_163989 ?auto_163994 ) ) ( not ( = ?auto_163989 ?auto_163996 ) ) ( not ( = ?auto_163990 ?auto_163991 ) ) ( not ( = ?auto_163990 ?auto_163992 ) ) ( not ( = ?auto_163990 ?auto_163993 ) ) ( not ( = ?auto_163990 ?auto_163994 ) ) ( not ( = ?auto_163990 ?auto_163996 ) ) ( not ( = ?auto_163991 ?auto_163992 ) ) ( not ( = ?auto_163991 ?auto_163993 ) ) ( not ( = ?auto_163991 ?auto_163994 ) ) ( not ( = ?auto_163991 ?auto_163996 ) ) ( not ( = ?auto_163992 ?auto_163993 ) ) ( not ( = ?auto_163992 ?auto_163994 ) ) ( not ( = ?auto_163992 ?auto_163996 ) ) ( not ( = ?auto_163993 ?auto_163994 ) ) ( not ( = ?auto_163993 ?auto_163996 ) ) ( not ( = ?auto_163994 ?auto_163996 ) ) ( not ( = ?auto_163989 ?auto_163997 ) ) ( not ( = ?auto_163990 ?auto_163997 ) ) ( not ( = ?auto_163991 ?auto_163997 ) ) ( not ( = ?auto_163992 ?auto_163997 ) ) ( not ( = ?auto_163993 ?auto_163997 ) ) ( not ( = ?auto_163994 ?auto_163997 ) ) ( not ( = ?auto_163996 ?auto_163997 ) ) ( ON ?auto_163997 ?auto_163995 ) ( not ( = ?auto_163989 ?auto_163995 ) ) ( not ( = ?auto_163990 ?auto_163995 ) ) ( not ( = ?auto_163991 ?auto_163995 ) ) ( not ( = ?auto_163992 ?auto_163995 ) ) ( not ( = ?auto_163993 ?auto_163995 ) ) ( not ( = ?auto_163994 ?auto_163995 ) ) ( not ( = ?auto_163996 ?auto_163995 ) ) ( not ( = ?auto_163997 ?auto_163995 ) ) ( ON ?auto_163996 ?auto_163997 ) ( ON ?auto_163994 ?auto_163996 ) ( ON-TABLE ?auto_163995 ) ( ON ?auto_163993 ?auto_163994 ) ( ON ?auto_163992 ?auto_163993 ) ( ON ?auto_163991 ?auto_163992 ) ( CLEAR ?auto_163991 ) ( HOLDING ?auto_163990 ) ( CLEAR ?auto_163989 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_163989 ?auto_163990 )
      ( MAKE-6PILE ?auto_163989 ?auto_163990 ?auto_163991 ?auto_163992 ?auto_163993 ?auto_163994 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_163998 - BLOCK
      ?auto_163999 - BLOCK
      ?auto_164000 - BLOCK
      ?auto_164001 - BLOCK
      ?auto_164002 - BLOCK
      ?auto_164003 - BLOCK
    )
    :vars
    (
      ?auto_164004 - BLOCK
      ?auto_164005 - BLOCK
      ?auto_164006 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_163998 ) ( not ( = ?auto_163998 ?auto_163999 ) ) ( not ( = ?auto_163998 ?auto_164000 ) ) ( not ( = ?auto_163998 ?auto_164001 ) ) ( not ( = ?auto_163998 ?auto_164002 ) ) ( not ( = ?auto_163998 ?auto_164003 ) ) ( not ( = ?auto_163998 ?auto_164004 ) ) ( not ( = ?auto_163999 ?auto_164000 ) ) ( not ( = ?auto_163999 ?auto_164001 ) ) ( not ( = ?auto_163999 ?auto_164002 ) ) ( not ( = ?auto_163999 ?auto_164003 ) ) ( not ( = ?auto_163999 ?auto_164004 ) ) ( not ( = ?auto_164000 ?auto_164001 ) ) ( not ( = ?auto_164000 ?auto_164002 ) ) ( not ( = ?auto_164000 ?auto_164003 ) ) ( not ( = ?auto_164000 ?auto_164004 ) ) ( not ( = ?auto_164001 ?auto_164002 ) ) ( not ( = ?auto_164001 ?auto_164003 ) ) ( not ( = ?auto_164001 ?auto_164004 ) ) ( not ( = ?auto_164002 ?auto_164003 ) ) ( not ( = ?auto_164002 ?auto_164004 ) ) ( not ( = ?auto_164003 ?auto_164004 ) ) ( not ( = ?auto_163998 ?auto_164005 ) ) ( not ( = ?auto_163999 ?auto_164005 ) ) ( not ( = ?auto_164000 ?auto_164005 ) ) ( not ( = ?auto_164001 ?auto_164005 ) ) ( not ( = ?auto_164002 ?auto_164005 ) ) ( not ( = ?auto_164003 ?auto_164005 ) ) ( not ( = ?auto_164004 ?auto_164005 ) ) ( ON ?auto_164005 ?auto_164006 ) ( not ( = ?auto_163998 ?auto_164006 ) ) ( not ( = ?auto_163999 ?auto_164006 ) ) ( not ( = ?auto_164000 ?auto_164006 ) ) ( not ( = ?auto_164001 ?auto_164006 ) ) ( not ( = ?auto_164002 ?auto_164006 ) ) ( not ( = ?auto_164003 ?auto_164006 ) ) ( not ( = ?auto_164004 ?auto_164006 ) ) ( not ( = ?auto_164005 ?auto_164006 ) ) ( ON ?auto_164004 ?auto_164005 ) ( ON ?auto_164003 ?auto_164004 ) ( ON-TABLE ?auto_164006 ) ( ON ?auto_164002 ?auto_164003 ) ( ON ?auto_164001 ?auto_164002 ) ( ON ?auto_164000 ?auto_164001 ) ( CLEAR ?auto_163998 ) ( ON ?auto_163999 ?auto_164000 ) ( CLEAR ?auto_163999 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_164006 ?auto_164005 ?auto_164004 ?auto_164003 ?auto_164002 ?auto_164001 ?auto_164000 )
      ( MAKE-6PILE ?auto_163998 ?auto_163999 ?auto_164000 ?auto_164001 ?auto_164002 ?auto_164003 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_164007 - BLOCK
      ?auto_164008 - BLOCK
      ?auto_164009 - BLOCK
      ?auto_164010 - BLOCK
      ?auto_164011 - BLOCK
      ?auto_164012 - BLOCK
    )
    :vars
    (
      ?auto_164015 - BLOCK
      ?auto_164013 - BLOCK
      ?auto_164014 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_164007 ?auto_164008 ) ) ( not ( = ?auto_164007 ?auto_164009 ) ) ( not ( = ?auto_164007 ?auto_164010 ) ) ( not ( = ?auto_164007 ?auto_164011 ) ) ( not ( = ?auto_164007 ?auto_164012 ) ) ( not ( = ?auto_164007 ?auto_164015 ) ) ( not ( = ?auto_164008 ?auto_164009 ) ) ( not ( = ?auto_164008 ?auto_164010 ) ) ( not ( = ?auto_164008 ?auto_164011 ) ) ( not ( = ?auto_164008 ?auto_164012 ) ) ( not ( = ?auto_164008 ?auto_164015 ) ) ( not ( = ?auto_164009 ?auto_164010 ) ) ( not ( = ?auto_164009 ?auto_164011 ) ) ( not ( = ?auto_164009 ?auto_164012 ) ) ( not ( = ?auto_164009 ?auto_164015 ) ) ( not ( = ?auto_164010 ?auto_164011 ) ) ( not ( = ?auto_164010 ?auto_164012 ) ) ( not ( = ?auto_164010 ?auto_164015 ) ) ( not ( = ?auto_164011 ?auto_164012 ) ) ( not ( = ?auto_164011 ?auto_164015 ) ) ( not ( = ?auto_164012 ?auto_164015 ) ) ( not ( = ?auto_164007 ?auto_164013 ) ) ( not ( = ?auto_164008 ?auto_164013 ) ) ( not ( = ?auto_164009 ?auto_164013 ) ) ( not ( = ?auto_164010 ?auto_164013 ) ) ( not ( = ?auto_164011 ?auto_164013 ) ) ( not ( = ?auto_164012 ?auto_164013 ) ) ( not ( = ?auto_164015 ?auto_164013 ) ) ( ON ?auto_164013 ?auto_164014 ) ( not ( = ?auto_164007 ?auto_164014 ) ) ( not ( = ?auto_164008 ?auto_164014 ) ) ( not ( = ?auto_164009 ?auto_164014 ) ) ( not ( = ?auto_164010 ?auto_164014 ) ) ( not ( = ?auto_164011 ?auto_164014 ) ) ( not ( = ?auto_164012 ?auto_164014 ) ) ( not ( = ?auto_164015 ?auto_164014 ) ) ( not ( = ?auto_164013 ?auto_164014 ) ) ( ON ?auto_164015 ?auto_164013 ) ( ON ?auto_164012 ?auto_164015 ) ( ON-TABLE ?auto_164014 ) ( ON ?auto_164011 ?auto_164012 ) ( ON ?auto_164010 ?auto_164011 ) ( ON ?auto_164009 ?auto_164010 ) ( ON ?auto_164008 ?auto_164009 ) ( CLEAR ?auto_164008 ) ( HOLDING ?auto_164007 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_164007 )
      ( MAKE-6PILE ?auto_164007 ?auto_164008 ?auto_164009 ?auto_164010 ?auto_164011 ?auto_164012 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_164016 - BLOCK
      ?auto_164017 - BLOCK
      ?auto_164018 - BLOCK
      ?auto_164019 - BLOCK
      ?auto_164020 - BLOCK
      ?auto_164021 - BLOCK
    )
    :vars
    (
      ?auto_164022 - BLOCK
      ?auto_164023 - BLOCK
      ?auto_164024 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_164016 ?auto_164017 ) ) ( not ( = ?auto_164016 ?auto_164018 ) ) ( not ( = ?auto_164016 ?auto_164019 ) ) ( not ( = ?auto_164016 ?auto_164020 ) ) ( not ( = ?auto_164016 ?auto_164021 ) ) ( not ( = ?auto_164016 ?auto_164022 ) ) ( not ( = ?auto_164017 ?auto_164018 ) ) ( not ( = ?auto_164017 ?auto_164019 ) ) ( not ( = ?auto_164017 ?auto_164020 ) ) ( not ( = ?auto_164017 ?auto_164021 ) ) ( not ( = ?auto_164017 ?auto_164022 ) ) ( not ( = ?auto_164018 ?auto_164019 ) ) ( not ( = ?auto_164018 ?auto_164020 ) ) ( not ( = ?auto_164018 ?auto_164021 ) ) ( not ( = ?auto_164018 ?auto_164022 ) ) ( not ( = ?auto_164019 ?auto_164020 ) ) ( not ( = ?auto_164019 ?auto_164021 ) ) ( not ( = ?auto_164019 ?auto_164022 ) ) ( not ( = ?auto_164020 ?auto_164021 ) ) ( not ( = ?auto_164020 ?auto_164022 ) ) ( not ( = ?auto_164021 ?auto_164022 ) ) ( not ( = ?auto_164016 ?auto_164023 ) ) ( not ( = ?auto_164017 ?auto_164023 ) ) ( not ( = ?auto_164018 ?auto_164023 ) ) ( not ( = ?auto_164019 ?auto_164023 ) ) ( not ( = ?auto_164020 ?auto_164023 ) ) ( not ( = ?auto_164021 ?auto_164023 ) ) ( not ( = ?auto_164022 ?auto_164023 ) ) ( ON ?auto_164023 ?auto_164024 ) ( not ( = ?auto_164016 ?auto_164024 ) ) ( not ( = ?auto_164017 ?auto_164024 ) ) ( not ( = ?auto_164018 ?auto_164024 ) ) ( not ( = ?auto_164019 ?auto_164024 ) ) ( not ( = ?auto_164020 ?auto_164024 ) ) ( not ( = ?auto_164021 ?auto_164024 ) ) ( not ( = ?auto_164022 ?auto_164024 ) ) ( not ( = ?auto_164023 ?auto_164024 ) ) ( ON ?auto_164022 ?auto_164023 ) ( ON ?auto_164021 ?auto_164022 ) ( ON-TABLE ?auto_164024 ) ( ON ?auto_164020 ?auto_164021 ) ( ON ?auto_164019 ?auto_164020 ) ( ON ?auto_164018 ?auto_164019 ) ( ON ?auto_164017 ?auto_164018 ) ( ON ?auto_164016 ?auto_164017 ) ( CLEAR ?auto_164016 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_164024 ?auto_164023 ?auto_164022 ?auto_164021 ?auto_164020 ?auto_164019 ?auto_164018 ?auto_164017 )
      ( MAKE-6PILE ?auto_164016 ?auto_164017 ?auto_164018 ?auto_164019 ?auto_164020 ?auto_164021 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_164027 - BLOCK
      ?auto_164028 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_164028 ) ( CLEAR ?auto_164027 ) ( ON-TABLE ?auto_164027 ) ( not ( = ?auto_164027 ?auto_164028 ) ) )
    :subtasks
    ( ( !STACK ?auto_164028 ?auto_164027 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_164029 - BLOCK
      ?auto_164030 - BLOCK
    )
    :vars
    (
      ?auto_164031 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_164029 ) ( ON-TABLE ?auto_164029 ) ( not ( = ?auto_164029 ?auto_164030 ) ) ( ON ?auto_164030 ?auto_164031 ) ( CLEAR ?auto_164030 ) ( HAND-EMPTY ) ( not ( = ?auto_164029 ?auto_164031 ) ) ( not ( = ?auto_164030 ?auto_164031 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_164030 ?auto_164031 )
      ( MAKE-2PILE ?auto_164029 ?auto_164030 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_164032 - BLOCK
      ?auto_164033 - BLOCK
    )
    :vars
    (
      ?auto_164034 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_164032 ?auto_164033 ) ) ( ON ?auto_164033 ?auto_164034 ) ( CLEAR ?auto_164033 ) ( not ( = ?auto_164032 ?auto_164034 ) ) ( not ( = ?auto_164033 ?auto_164034 ) ) ( HOLDING ?auto_164032 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_164032 )
      ( MAKE-2PILE ?auto_164032 ?auto_164033 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_164035 - BLOCK
      ?auto_164036 - BLOCK
    )
    :vars
    (
      ?auto_164037 - BLOCK
      ?auto_164042 - BLOCK
      ?auto_164038 - BLOCK
      ?auto_164041 - BLOCK
      ?auto_164040 - BLOCK
      ?auto_164039 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_164035 ?auto_164036 ) ) ( ON ?auto_164036 ?auto_164037 ) ( not ( = ?auto_164035 ?auto_164037 ) ) ( not ( = ?auto_164036 ?auto_164037 ) ) ( ON ?auto_164035 ?auto_164036 ) ( CLEAR ?auto_164035 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_164042 ) ( ON ?auto_164038 ?auto_164042 ) ( ON ?auto_164041 ?auto_164038 ) ( ON ?auto_164040 ?auto_164041 ) ( ON ?auto_164039 ?auto_164040 ) ( ON ?auto_164037 ?auto_164039 ) ( not ( = ?auto_164042 ?auto_164038 ) ) ( not ( = ?auto_164042 ?auto_164041 ) ) ( not ( = ?auto_164042 ?auto_164040 ) ) ( not ( = ?auto_164042 ?auto_164039 ) ) ( not ( = ?auto_164042 ?auto_164037 ) ) ( not ( = ?auto_164042 ?auto_164036 ) ) ( not ( = ?auto_164042 ?auto_164035 ) ) ( not ( = ?auto_164038 ?auto_164041 ) ) ( not ( = ?auto_164038 ?auto_164040 ) ) ( not ( = ?auto_164038 ?auto_164039 ) ) ( not ( = ?auto_164038 ?auto_164037 ) ) ( not ( = ?auto_164038 ?auto_164036 ) ) ( not ( = ?auto_164038 ?auto_164035 ) ) ( not ( = ?auto_164041 ?auto_164040 ) ) ( not ( = ?auto_164041 ?auto_164039 ) ) ( not ( = ?auto_164041 ?auto_164037 ) ) ( not ( = ?auto_164041 ?auto_164036 ) ) ( not ( = ?auto_164041 ?auto_164035 ) ) ( not ( = ?auto_164040 ?auto_164039 ) ) ( not ( = ?auto_164040 ?auto_164037 ) ) ( not ( = ?auto_164040 ?auto_164036 ) ) ( not ( = ?auto_164040 ?auto_164035 ) ) ( not ( = ?auto_164039 ?auto_164037 ) ) ( not ( = ?auto_164039 ?auto_164036 ) ) ( not ( = ?auto_164039 ?auto_164035 ) ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_164042 ?auto_164038 ?auto_164041 ?auto_164040 ?auto_164039 ?auto_164037 ?auto_164036 )
      ( MAKE-2PILE ?auto_164035 ?auto_164036 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_164043 - BLOCK
      ?auto_164044 - BLOCK
    )
    :vars
    (
      ?auto_164045 - BLOCK
      ?auto_164046 - BLOCK
      ?auto_164049 - BLOCK
      ?auto_164050 - BLOCK
      ?auto_164047 - BLOCK
      ?auto_164048 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_164043 ?auto_164044 ) ) ( ON ?auto_164044 ?auto_164045 ) ( not ( = ?auto_164043 ?auto_164045 ) ) ( not ( = ?auto_164044 ?auto_164045 ) ) ( ON-TABLE ?auto_164046 ) ( ON ?auto_164049 ?auto_164046 ) ( ON ?auto_164050 ?auto_164049 ) ( ON ?auto_164047 ?auto_164050 ) ( ON ?auto_164048 ?auto_164047 ) ( ON ?auto_164045 ?auto_164048 ) ( not ( = ?auto_164046 ?auto_164049 ) ) ( not ( = ?auto_164046 ?auto_164050 ) ) ( not ( = ?auto_164046 ?auto_164047 ) ) ( not ( = ?auto_164046 ?auto_164048 ) ) ( not ( = ?auto_164046 ?auto_164045 ) ) ( not ( = ?auto_164046 ?auto_164044 ) ) ( not ( = ?auto_164046 ?auto_164043 ) ) ( not ( = ?auto_164049 ?auto_164050 ) ) ( not ( = ?auto_164049 ?auto_164047 ) ) ( not ( = ?auto_164049 ?auto_164048 ) ) ( not ( = ?auto_164049 ?auto_164045 ) ) ( not ( = ?auto_164049 ?auto_164044 ) ) ( not ( = ?auto_164049 ?auto_164043 ) ) ( not ( = ?auto_164050 ?auto_164047 ) ) ( not ( = ?auto_164050 ?auto_164048 ) ) ( not ( = ?auto_164050 ?auto_164045 ) ) ( not ( = ?auto_164050 ?auto_164044 ) ) ( not ( = ?auto_164050 ?auto_164043 ) ) ( not ( = ?auto_164047 ?auto_164048 ) ) ( not ( = ?auto_164047 ?auto_164045 ) ) ( not ( = ?auto_164047 ?auto_164044 ) ) ( not ( = ?auto_164047 ?auto_164043 ) ) ( not ( = ?auto_164048 ?auto_164045 ) ) ( not ( = ?auto_164048 ?auto_164044 ) ) ( not ( = ?auto_164048 ?auto_164043 ) ) ( HOLDING ?auto_164043 ) ( CLEAR ?auto_164044 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_164046 ?auto_164049 ?auto_164050 ?auto_164047 ?auto_164048 ?auto_164045 ?auto_164044 ?auto_164043 )
      ( MAKE-2PILE ?auto_164043 ?auto_164044 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_164051 - BLOCK
      ?auto_164052 - BLOCK
    )
    :vars
    (
      ?auto_164057 - BLOCK
      ?auto_164053 - BLOCK
      ?auto_164054 - BLOCK
      ?auto_164055 - BLOCK
      ?auto_164058 - BLOCK
      ?auto_164056 - BLOCK
      ?auto_164059 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_164051 ?auto_164052 ) ) ( ON ?auto_164052 ?auto_164057 ) ( not ( = ?auto_164051 ?auto_164057 ) ) ( not ( = ?auto_164052 ?auto_164057 ) ) ( ON-TABLE ?auto_164053 ) ( ON ?auto_164054 ?auto_164053 ) ( ON ?auto_164055 ?auto_164054 ) ( ON ?auto_164058 ?auto_164055 ) ( ON ?auto_164056 ?auto_164058 ) ( ON ?auto_164057 ?auto_164056 ) ( not ( = ?auto_164053 ?auto_164054 ) ) ( not ( = ?auto_164053 ?auto_164055 ) ) ( not ( = ?auto_164053 ?auto_164058 ) ) ( not ( = ?auto_164053 ?auto_164056 ) ) ( not ( = ?auto_164053 ?auto_164057 ) ) ( not ( = ?auto_164053 ?auto_164052 ) ) ( not ( = ?auto_164053 ?auto_164051 ) ) ( not ( = ?auto_164054 ?auto_164055 ) ) ( not ( = ?auto_164054 ?auto_164058 ) ) ( not ( = ?auto_164054 ?auto_164056 ) ) ( not ( = ?auto_164054 ?auto_164057 ) ) ( not ( = ?auto_164054 ?auto_164052 ) ) ( not ( = ?auto_164054 ?auto_164051 ) ) ( not ( = ?auto_164055 ?auto_164058 ) ) ( not ( = ?auto_164055 ?auto_164056 ) ) ( not ( = ?auto_164055 ?auto_164057 ) ) ( not ( = ?auto_164055 ?auto_164052 ) ) ( not ( = ?auto_164055 ?auto_164051 ) ) ( not ( = ?auto_164058 ?auto_164056 ) ) ( not ( = ?auto_164058 ?auto_164057 ) ) ( not ( = ?auto_164058 ?auto_164052 ) ) ( not ( = ?auto_164058 ?auto_164051 ) ) ( not ( = ?auto_164056 ?auto_164057 ) ) ( not ( = ?auto_164056 ?auto_164052 ) ) ( not ( = ?auto_164056 ?auto_164051 ) ) ( CLEAR ?auto_164052 ) ( ON ?auto_164051 ?auto_164059 ) ( CLEAR ?auto_164051 ) ( HAND-EMPTY ) ( not ( = ?auto_164051 ?auto_164059 ) ) ( not ( = ?auto_164052 ?auto_164059 ) ) ( not ( = ?auto_164057 ?auto_164059 ) ) ( not ( = ?auto_164053 ?auto_164059 ) ) ( not ( = ?auto_164054 ?auto_164059 ) ) ( not ( = ?auto_164055 ?auto_164059 ) ) ( not ( = ?auto_164058 ?auto_164059 ) ) ( not ( = ?auto_164056 ?auto_164059 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_164051 ?auto_164059 )
      ( MAKE-2PILE ?auto_164051 ?auto_164052 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_164060 - BLOCK
      ?auto_164061 - BLOCK
    )
    :vars
    (
      ?auto_164066 - BLOCK
      ?auto_164062 - BLOCK
      ?auto_164068 - BLOCK
      ?auto_164063 - BLOCK
      ?auto_164067 - BLOCK
      ?auto_164065 - BLOCK
      ?auto_164064 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_164060 ?auto_164061 ) ) ( not ( = ?auto_164060 ?auto_164066 ) ) ( not ( = ?auto_164061 ?auto_164066 ) ) ( ON-TABLE ?auto_164062 ) ( ON ?auto_164068 ?auto_164062 ) ( ON ?auto_164063 ?auto_164068 ) ( ON ?auto_164067 ?auto_164063 ) ( ON ?auto_164065 ?auto_164067 ) ( ON ?auto_164066 ?auto_164065 ) ( not ( = ?auto_164062 ?auto_164068 ) ) ( not ( = ?auto_164062 ?auto_164063 ) ) ( not ( = ?auto_164062 ?auto_164067 ) ) ( not ( = ?auto_164062 ?auto_164065 ) ) ( not ( = ?auto_164062 ?auto_164066 ) ) ( not ( = ?auto_164062 ?auto_164061 ) ) ( not ( = ?auto_164062 ?auto_164060 ) ) ( not ( = ?auto_164068 ?auto_164063 ) ) ( not ( = ?auto_164068 ?auto_164067 ) ) ( not ( = ?auto_164068 ?auto_164065 ) ) ( not ( = ?auto_164068 ?auto_164066 ) ) ( not ( = ?auto_164068 ?auto_164061 ) ) ( not ( = ?auto_164068 ?auto_164060 ) ) ( not ( = ?auto_164063 ?auto_164067 ) ) ( not ( = ?auto_164063 ?auto_164065 ) ) ( not ( = ?auto_164063 ?auto_164066 ) ) ( not ( = ?auto_164063 ?auto_164061 ) ) ( not ( = ?auto_164063 ?auto_164060 ) ) ( not ( = ?auto_164067 ?auto_164065 ) ) ( not ( = ?auto_164067 ?auto_164066 ) ) ( not ( = ?auto_164067 ?auto_164061 ) ) ( not ( = ?auto_164067 ?auto_164060 ) ) ( not ( = ?auto_164065 ?auto_164066 ) ) ( not ( = ?auto_164065 ?auto_164061 ) ) ( not ( = ?auto_164065 ?auto_164060 ) ) ( ON ?auto_164060 ?auto_164064 ) ( CLEAR ?auto_164060 ) ( not ( = ?auto_164060 ?auto_164064 ) ) ( not ( = ?auto_164061 ?auto_164064 ) ) ( not ( = ?auto_164066 ?auto_164064 ) ) ( not ( = ?auto_164062 ?auto_164064 ) ) ( not ( = ?auto_164068 ?auto_164064 ) ) ( not ( = ?auto_164063 ?auto_164064 ) ) ( not ( = ?auto_164067 ?auto_164064 ) ) ( not ( = ?auto_164065 ?auto_164064 ) ) ( HOLDING ?auto_164061 ) ( CLEAR ?auto_164066 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_164062 ?auto_164068 ?auto_164063 ?auto_164067 ?auto_164065 ?auto_164066 ?auto_164061 )
      ( MAKE-2PILE ?auto_164060 ?auto_164061 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_164069 - BLOCK
      ?auto_164070 - BLOCK
    )
    :vars
    (
      ?auto_164075 - BLOCK
      ?auto_164074 - BLOCK
      ?auto_164071 - BLOCK
      ?auto_164073 - BLOCK
      ?auto_164077 - BLOCK
      ?auto_164072 - BLOCK
      ?auto_164076 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_164069 ?auto_164070 ) ) ( not ( = ?auto_164069 ?auto_164075 ) ) ( not ( = ?auto_164070 ?auto_164075 ) ) ( ON-TABLE ?auto_164074 ) ( ON ?auto_164071 ?auto_164074 ) ( ON ?auto_164073 ?auto_164071 ) ( ON ?auto_164077 ?auto_164073 ) ( ON ?auto_164072 ?auto_164077 ) ( ON ?auto_164075 ?auto_164072 ) ( not ( = ?auto_164074 ?auto_164071 ) ) ( not ( = ?auto_164074 ?auto_164073 ) ) ( not ( = ?auto_164074 ?auto_164077 ) ) ( not ( = ?auto_164074 ?auto_164072 ) ) ( not ( = ?auto_164074 ?auto_164075 ) ) ( not ( = ?auto_164074 ?auto_164070 ) ) ( not ( = ?auto_164074 ?auto_164069 ) ) ( not ( = ?auto_164071 ?auto_164073 ) ) ( not ( = ?auto_164071 ?auto_164077 ) ) ( not ( = ?auto_164071 ?auto_164072 ) ) ( not ( = ?auto_164071 ?auto_164075 ) ) ( not ( = ?auto_164071 ?auto_164070 ) ) ( not ( = ?auto_164071 ?auto_164069 ) ) ( not ( = ?auto_164073 ?auto_164077 ) ) ( not ( = ?auto_164073 ?auto_164072 ) ) ( not ( = ?auto_164073 ?auto_164075 ) ) ( not ( = ?auto_164073 ?auto_164070 ) ) ( not ( = ?auto_164073 ?auto_164069 ) ) ( not ( = ?auto_164077 ?auto_164072 ) ) ( not ( = ?auto_164077 ?auto_164075 ) ) ( not ( = ?auto_164077 ?auto_164070 ) ) ( not ( = ?auto_164077 ?auto_164069 ) ) ( not ( = ?auto_164072 ?auto_164075 ) ) ( not ( = ?auto_164072 ?auto_164070 ) ) ( not ( = ?auto_164072 ?auto_164069 ) ) ( ON ?auto_164069 ?auto_164076 ) ( not ( = ?auto_164069 ?auto_164076 ) ) ( not ( = ?auto_164070 ?auto_164076 ) ) ( not ( = ?auto_164075 ?auto_164076 ) ) ( not ( = ?auto_164074 ?auto_164076 ) ) ( not ( = ?auto_164071 ?auto_164076 ) ) ( not ( = ?auto_164073 ?auto_164076 ) ) ( not ( = ?auto_164077 ?auto_164076 ) ) ( not ( = ?auto_164072 ?auto_164076 ) ) ( CLEAR ?auto_164075 ) ( ON ?auto_164070 ?auto_164069 ) ( CLEAR ?auto_164070 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_164076 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_164076 ?auto_164069 )
      ( MAKE-2PILE ?auto_164069 ?auto_164070 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_164078 - BLOCK
      ?auto_164079 - BLOCK
    )
    :vars
    (
      ?auto_164082 - BLOCK
      ?auto_164080 - BLOCK
      ?auto_164083 - BLOCK
      ?auto_164086 - BLOCK
      ?auto_164084 - BLOCK
      ?auto_164085 - BLOCK
      ?auto_164081 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_164078 ?auto_164079 ) ) ( not ( = ?auto_164078 ?auto_164082 ) ) ( not ( = ?auto_164079 ?auto_164082 ) ) ( ON-TABLE ?auto_164080 ) ( ON ?auto_164083 ?auto_164080 ) ( ON ?auto_164086 ?auto_164083 ) ( ON ?auto_164084 ?auto_164086 ) ( ON ?auto_164085 ?auto_164084 ) ( not ( = ?auto_164080 ?auto_164083 ) ) ( not ( = ?auto_164080 ?auto_164086 ) ) ( not ( = ?auto_164080 ?auto_164084 ) ) ( not ( = ?auto_164080 ?auto_164085 ) ) ( not ( = ?auto_164080 ?auto_164082 ) ) ( not ( = ?auto_164080 ?auto_164079 ) ) ( not ( = ?auto_164080 ?auto_164078 ) ) ( not ( = ?auto_164083 ?auto_164086 ) ) ( not ( = ?auto_164083 ?auto_164084 ) ) ( not ( = ?auto_164083 ?auto_164085 ) ) ( not ( = ?auto_164083 ?auto_164082 ) ) ( not ( = ?auto_164083 ?auto_164079 ) ) ( not ( = ?auto_164083 ?auto_164078 ) ) ( not ( = ?auto_164086 ?auto_164084 ) ) ( not ( = ?auto_164086 ?auto_164085 ) ) ( not ( = ?auto_164086 ?auto_164082 ) ) ( not ( = ?auto_164086 ?auto_164079 ) ) ( not ( = ?auto_164086 ?auto_164078 ) ) ( not ( = ?auto_164084 ?auto_164085 ) ) ( not ( = ?auto_164084 ?auto_164082 ) ) ( not ( = ?auto_164084 ?auto_164079 ) ) ( not ( = ?auto_164084 ?auto_164078 ) ) ( not ( = ?auto_164085 ?auto_164082 ) ) ( not ( = ?auto_164085 ?auto_164079 ) ) ( not ( = ?auto_164085 ?auto_164078 ) ) ( ON ?auto_164078 ?auto_164081 ) ( not ( = ?auto_164078 ?auto_164081 ) ) ( not ( = ?auto_164079 ?auto_164081 ) ) ( not ( = ?auto_164082 ?auto_164081 ) ) ( not ( = ?auto_164080 ?auto_164081 ) ) ( not ( = ?auto_164083 ?auto_164081 ) ) ( not ( = ?auto_164086 ?auto_164081 ) ) ( not ( = ?auto_164084 ?auto_164081 ) ) ( not ( = ?auto_164085 ?auto_164081 ) ) ( ON ?auto_164079 ?auto_164078 ) ( CLEAR ?auto_164079 ) ( ON-TABLE ?auto_164081 ) ( HOLDING ?auto_164082 ) ( CLEAR ?auto_164085 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_164080 ?auto_164083 ?auto_164086 ?auto_164084 ?auto_164085 ?auto_164082 )
      ( MAKE-2PILE ?auto_164078 ?auto_164079 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_164087 - BLOCK
      ?auto_164088 - BLOCK
    )
    :vars
    (
      ?auto_164089 - BLOCK
      ?auto_164095 - BLOCK
      ?auto_164094 - BLOCK
      ?auto_164090 - BLOCK
      ?auto_164093 - BLOCK
      ?auto_164091 - BLOCK
      ?auto_164092 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_164087 ?auto_164088 ) ) ( not ( = ?auto_164087 ?auto_164089 ) ) ( not ( = ?auto_164088 ?auto_164089 ) ) ( ON-TABLE ?auto_164095 ) ( ON ?auto_164094 ?auto_164095 ) ( ON ?auto_164090 ?auto_164094 ) ( ON ?auto_164093 ?auto_164090 ) ( ON ?auto_164091 ?auto_164093 ) ( not ( = ?auto_164095 ?auto_164094 ) ) ( not ( = ?auto_164095 ?auto_164090 ) ) ( not ( = ?auto_164095 ?auto_164093 ) ) ( not ( = ?auto_164095 ?auto_164091 ) ) ( not ( = ?auto_164095 ?auto_164089 ) ) ( not ( = ?auto_164095 ?auto_164088 ) ) ( not ( = ?auto_164095 ?auto_164087 ) ) ( not ( = ?auto_164094 ?auto_164090 ) ) ( not ( = ?auto_164094 ?auto_164093 ) ) ( not ( = ?auto_164094 ?auto_164091 ) ) ( not ( = ?auto_164094 ?auto_164089 ) ) ( not ( = ?auto_164094 ?auto_164088 ) ) ( not ( = ?auto_164094 ?auto_164087 ) ) ( not ( = ?auto_164090 ?auto_164093 ) ) ( not ( = ?auto_164090 ?auto_164091 ) ) ( not ( = ?auto_164090 ?auto_164089 ) ) ( not ( = ?auto_164090 ?auto_164088 ) ) ( not ( = ?auto_164090 ?auto_164087 ) ) ( not ( = ?auto_164093 ?auto_164091 ) ) ( not ( = ?auto_164093 ?auto_164089 ) ) ( not ( = ?auto_164093 ?auto_164088 ) ) ( not ( = ?auto_164093 ?auto_164087 ) ) ( not ( = ?auto_164091 ?auto_164089 ) ) ( not ( = ?auto_164091 ?auto_164088 ) ) ( not ( = ?auto_164091 ?auto_164087 ) ) ( ON ?auto_164087 ?auto_164092 ) ( not ( = ?auto_164087 ?auto_164092 ) ) ( not ( = ?auto_164088 ?auto_164092 ) ) ( not ( = ?auto_164089 ?auto_164092 ) ) ( not ( = ?auto_164095 ?auto_164092 ) ) ( not ( = ?auto_164094 ?auto_164092 ) ) ( not ( = ?auto_164090 ?auto_164092 ) ) ( not ( = ?auto_164093 ?auto_164092 ) ) ( not ( = ?auto_164091 ?auto_164092 ) ) ( ON ?auto_164088 ?auto_164087 ) ( ON-TABLE ?auto_164092 ) ( CLEAR ?auto_164091 ) ( ON ?auto_164089 ?auto_164088 ) ( CLEAR ?auto_164089 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_164092 ?auto_164087 ?auto_164088 )
      ( MAKE-2PILE ?auto_164087 ?auto_164088 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_164096 - BLOCK
      ?auto_164097 - BLOCK
    )
    :vars
    (
      ?auto_164102 - BLOCK
      ?auto_164104 - BLOCK
      ?auto_164101 - BLOCK
      ?auto_164100 - BLOCK
      ?auto_164098 - BLOCK
      ?auto_164103 - BLOCK
      ?auto_164099 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_164096 ?auto_164097 ) ) ( not ( = ?auto_164096 ?auto_164102 ) ) ( not ( = ?auto_164097 ?auto_164102 ) ) ( ON-TABLE ?auto_164104 ) ( ON ?auto_164101 ?auto_164104 ) ( ON ?auto_164100 ?auto_164101 ) ( ON ?auto_164098 ?auto_164100 ) ( not ( = ?auto_164104 ?auto_164101 ) ) ( not ( = ?auto_164104 ?auto_164100 ) ) ( not ( = ?auto_164104 ?auto_164098 ) ) ( not ( = ?auto_164104 ?auto_164103 ) ) ( not ( = ?auto_164104 ?auto_164102 ) ) ( not ( = ?auto_164104 ?auto_164097 ) ) ( not ( = ?auto_164104 ?auto_164096 ) ) ( not ( = ?auto_164101 ?auto_164100 ) ) ( not ( = ?auto_164101 ?auto_164098 ) ) ( not ( = ?auto_164101 ?auto_164103 ) ) ( not ( = ?auto_164101 ?auto_164102 ) ) ( not ( = ?auto_164101 ?auto_164097 ) ) ( not ( = ?auto_164101 ?auto_164096 ) ) ( not ( = ?auto_164100 ?auto_164098 ) ) ( not ( = ?auto_164100 ?auto_164103 ) ) ( not ( = ?auto_164100 ?auto_164102 ) ) ( not ( = ?auto_164100 ?auto_164097 ) ) ( not ( = ?auto_164100 ?auto_164096 ) ) ( not ( = ?auto_164098 ?auto_164103 ) ) ( not ( = ?auto_164098 ?auto_164102 ) ) ( not ( = ?auto_164098 ?auto_164097 ) ) ( not ( = ?auto_164098 ?auto_164096 ) ) ( not ( = ?auto_164103 ?auto_164102 ) ) ( not ( = ?auto_164103 ?auto_164097 ) ) ( not ( = ?auto_164103 ?auto_164096 ) ) ( ON ?auto_164096 ?auto_164099 ) ( not ( = ?auto_164096 ?auto_164099 ) ) ( not ( = ?auto_164097 ?auto_164099 ) ) ( not ( = ?auto_164102 ?auto_164099 ) ) ( not ( = ?auto_164104 ?auto_164099 ) ) ( not ( = ?auto_164101 ?auto_164099 ) ) ( not ( = ?auto_164100 ?auto_164099 ) ) ( not ( = ?auto_164098 ?auto_164099 ) ) ( not ( = ?auto_164103 ?auto_164099 ) ) ( ON ?auto_164097 ?auto_164096 ) ( ON-TABLE ?auto_164099 ) ( ON ?auto_164102 ?auto_164097 ) ( CLEAR ?auto_164102 ) ( HOLDING ?auto_164103 ) ( CLEAR ?auto_164098 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_164104 ?auto_164101 ?auto_164100 ?auto_164098 ?auto_164103 )
      ( MAKE-2PILE ?auto_164096 ?auto_164097 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_164105 - BLOCK
      ?auto_164106 - BLOCK
    )
    :vars
    (
      ?auto_164110 - BLOCK
      ?auto_164107 - BLOCK
      ?auto_164108 - BLOCK
      ?auto_164111 - BLOCK
      ?auto_164112 - BLOCK
      ?auto_164113 - BLOCK
      ?auto_164109 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_164105 ?auto_164106 ) ) ( not ( = ?auto_164105 ?auto_164110 ) ) ( not ( = ?auto_164106 ?auto_164110 ) ) ( ON-TABLE ?auto_164107 ) ( ON ?auto_164108 ?auto_164107 ) ( ON ?auto_164111 ?auto_164108 ) ( ON ?auto_164112 ?auto_164111 ) ( not ( = ?auto_164107 ?auto_164108 ) ) ( not ( = ?auto_164107 ?auto_164111 ) ) ( not ( = ?auto_164107 ?auto_164112 ) ) ( not ( = ?auto_164107 ?auto_164113 ) ) ( not ( = ?auto_164107 ?auto_164110 ) ) ( not ( = ?auto_164107 ?auto_164106 ) ) ( not ( = ?auto_164107 ?auto_164105 ) ) ( not ( = ?auto_164108 ?auto_164111 ) ) ( not ( = ?auto_164108 ?auto_164112 ) ) ( not ( = ?auto_164108 ?auto_164113 ) ) ( not ( = ?auto_164108 ?auto_164110 ) ) ( not ( = ?auto_164108 ?auto_164106 ) ) ( not ( = ?auto_164108 ?auto_164105 ) ) ( not ( = ?auto_164111 ?auto_164112 ) ) ( not ( = ?auto_164111 ?auto_164113 ) ) ( not ( = ?auto_164111 ?auto_164110 ) ) ( not ( = ?auto_164111 ?auto_164106 ) ) ( not ( = ?auto_164111 ?auto_164105 ) ) ( not ( = ?auto_164112 ?auto_164113 ) ) ( not ( = ?auto_164112 ?auto_164110 ) ) ( not ( = ?auto_164112 ?auto_164106 ) ) ( not ( = ?auto_164112 ?auto_164105 ) ) ( not ( = ?auto_164113 ?auto_164110 ) ) ( not ( = ?auto_164113 ?auto_164106 ) ) ( not ( = ?auto_164113 ?auto_164105 ) ) ( ON ?auto_164105 ?auto_164109 ) ( not ( = ?auto_164105 ?auto_164109 ) ) ( not ( = ?auto_164106 ?auto_164109 ) ) ( not ( = ?auto_164110 ?auto_164109 ) ) ( not ( = ?auto_164107 ?auto_164109 ) ) ( not ( = ?auto_164108 ?auto_164109 ) ) ( not ( = ?auto_164111 ?auto_164109 ) ) ( not ( = ?auto_164112 ?auto_164109 ) ) ( not ( = ?auto_164113 ?auto_164109 ) ) ( ON ?auto_164106 ?auto_164105 ) ( ON-TABLE ?auto_164109 ) ( ON ?auto_164110 ?auto_164106 ) ( CLEAR ?auto_164112 ) ( ON ?auto_164113 ?auto_164110 ) ( CLEAR ?auto_164113 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_164109 ?auto_164105 ?auto_164106 ?auto_164110 )
      ( MAKE-2PILE ?auto_164105 ?auto_164106 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_164114 - BLOCK
      ?auto_164115 - BLOCK
    )
    :vars
    (
      ?auto_164118 - BLOCK
      ?auto_164122 - BLOCK
      ?auto_164120 - BLOCK
      ?auto_164121 - BLOCK
      ?auto_164116 - BLOCK
      ?auto_164119 - BLOCK
      ?auto_164117 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_164114 ?auto_164115 ) ) ( not ( = ?auto_164114 ?auto_164118 ) ) ( not ( = ?auto_164115 ?auto_164118 ) ) ( ON-TABLE ?auto_164122 ) ( ON ?auto_164120 ?auto_164122 ) ( ON ?auto_164121 ?auto_164120 ) ( not ( = ?auto_164122 ?auto_164120 ) ) ( not ( = ?auto_164122 ?auto_164121 ) ) ( not ( = ?auto_164122 ?auto_164116 ) ) ( not ( = ?auto_164122 ?auto_164119 ) ) ( not ( = ?auto_164122 ?auto_164118 ) ) ( not ( = ?auto_164122 ?auto_164115 ) ) ( not ( = ?auto_164122 ?auto_164114 ) ) ( not ( = ?auto_164120 ?auto_164121 ) ) ( not ( = ?auto_164120 ?auto_164116 ) ) ( not ( = ?auto_164120 ?auto_164119 ) ) ( not ( = ?auto_164120 ?auto_164118 ) ) ( not ( = ?auto_164120 ?auto_164115 ) ) ( not ( = ?auto_164120 ?auto_164114 ) ) ( not ( = ?auto_164121 ?auto_164116 ) ) ( not ( = ?auto_164121 ?auto_164119 ) ) ( not ( = ?auto_164121 ?auto_164118 ) ) ( not ( = ?auto_164121 ?auto_164115 ) ) ( not ( = ?auto_164121 ?auto_164114 ) ) ( not ( = ?auto_164116 ?auto_164119 ) ) ( not ( = ?auto_164116 ?auto_164118 ) ) ( not ( = ?auto_164116 ?auto_164115 ) ) ( not ( = ?auto_164116 ?auto_164114 ) ) ( not ( = ?auto_164119 ?auto_164118 ) ) ( not ( = ?auto_164119 ?auto_164115 ) ) ( not ( = ?auto_164119 ?auto_164114 ) ) ( ON ?auto_164114 ?auto_164117 ) ( not ( = ?auto_164114 ?auto_164117 ) ) ( not ( = ?auto_164115 ?auto_164117 ) ) ( not ( = ?auto_164118 ?auto_164117 ) ) ( not ( = ?auto_164122 ?auto_164117 ) ) ( not ( = ?auto_164120 ?auto_164117 ) ) ( not ( = ?auto_164121 ?auto_164117 ) ) ( not ( = ?auto_164116 ?auto_164117 ) ) ( not ( = ?auto_164119 ?auto_164117 ) ) ( ON ?auto_164115 ?auto_164114 ) ( ON-TABLE ?auto_164117 ) ( ON ?auto_164118 ?auto_164115 ) ( ON ?auto_164119 ?auto_164118 ) ( CLEAR ?auto_164119 ) ( HOLDING ?auto_164116 ) ( CLEAR ?auto_164121 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_164122 ?auto_164120 ?auto_164121 ?auto_164116 )
      ( MAKE-2PILE ?auto_164114 ?auto_164115 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_164123 - BLOCK
      ?auto_164124 - BLOCK
    )
    :vars
    (
      ?auto_164129 - BLOCK
      ?auto_164130 - BLOCK
      ?auto_164127 - BLOCK
      ?auto_164131 - BLOCK
      ?auto_164125 - BLOCK
      ?auto_164128 - BLOCK
      ?auto_164126 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_164123 ?auto_164124 ) ) ( not ( = ?auto_164123 ?auto_164129 ) ) ( not ( = ?auto_164124 ?auto_164129 ) ) ( ON-TABLE ?auto_164130 ) ( ON ?auto_164127 ?auto_164130 ) ( ON ?auto_164131 ?auto_164127 ) ( not ( = ?auto_164130 ?auto_164127 ) ) ( not ( = ?auto_164130 ?auto_164131 ) ) ( not ( = ?auto_164130 ?auto_164125 ) ) ( not ( = ?auto_164130 ?auto_164128 ) ) ( not ( = ?auto_164130 ?auto_164129 ) ) ( not ( = ?auto_164130 ?auto_164124 ) ) ( not ( = ?auto_164130 ?auto_164123 ) ) ( not ( = ?auto_164127 ?auto_164131 ) ) ( not ( = ?auto_164127 ?auto_164125 ) ) ( not ( = ?auto_164127 ?auto_164128 ) ) ( not ( = ?auto_164127 ?auto_164129 ) ) ( not ( = ?auto_164127 ?auto_164124 ) ) ( not ( = ?auto_164127 ?auto_164123 ) ) ( not ( = ?auto_164131 ?auto_164125 ) ) ( not ( = ?auto_164131 ?auto_164128 ) ) ( not ( = ?auto_164131 ?auto_164129 ) ) ( not ( = ?auto_164131 ?auto_164124 ) ) ( not ( = ?auto_164131 ?auto_164123 ) ) ( not ( = ?auto_164125 ?auto_164128 ) ) ( not ( = ?auto_164125 ?auto_164129 ) ) ( not ( = ?auto_164125 ?auto_164124 ) ) ( not ( = ?auto_164125 ?auto_164123 ) ) ( not ( = ?auto_164128 ?auto_164129 ) ) ( not ( = ?auto_164128 ?auto_164124 ) ) ( not ( = ?auto_164128 ?auto_164123 ) ) ( ON ?auto_164123 ?auto_164126 ) ( not ( = ?auto_164123 ?auto_164126 ) ) ( not ( = ?auto_164124 ?auto_164126 ) ) ( not ( = ?auto_164129 ?auto_164126 ) ) ( not ( = ?auto_164130 ?auto_164126 ) ) ( not ( = ?auto_164127 ?auto_164126 ) ) ( not ( = ?auto_164131 ?auto_164126 ) ) ( not ( = ?auto_164125 ?auto_164126 ) ) ( not ( = ?auto_164128 ?auto_164126 ) ) ( ON ?auto_164124 ?auto_164123 ) ( ON-TABLE ?auto_164126 ) ( ON ?auto_164129 ?auto_164124 ) ( ON ?auto_164128 ?auto_164129 ) ( CLEAR ?auto_164131 ) ( ON ?auto_164125 ?auto_164128 ) ( CLEAR ?auto_164125 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_164126 ?auto_164123 ?auto_164124 ?auto_164129 ?auto_164128 )
      ( MAKE-2PILE ?auto_164123 ?auto_164124 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_164132 - BLOCK
      ?auto_164133 - BLOCK
    )
    :vars
    (
      ?auto_164140 - BLOCK
      ?auto_164137 - BLOCK
      ?auto_164134 - BLOCK
      ?auto_164139 - BLOCK
      ?auto_164138 - BLOCK
      ?auto_164135 - BLOCK
      ?auto_164136 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_164132 ?auto_164133 ) ) ( not ( = ?auto_164132 ?auto_164140 ) ) ( not ( = ?auto_164133 ?auto_164140 ) ) ( ON-TABLE ?auto_164137 ) ( ON ?auto_164134 ?auto_164137 ) ( not ( = ?auto_164137 ?auto_164134 ) ) ( not ( = ?auto_164137 ?auto_164139 ) ) ( not ( = ?auto_164137 ?auto_164138 ) ) ( not ( = ?auto_164137 ?auto_164135 ) ) ( not ( = ?auto_164137 ?auto_164140 ) ) ( not ( = ?auto_164137 ?auto_164133 ) ) ( not ( = ?auto_164137 ?auto_164132 ) ) ( not ( = ?auto_164134 ?auto_164139 ) ) ( not ( = ?auto_164134 ?auto_164138 ) ) ( not ( = ?auto_164134 ?auto_164135 ) ) ( not ( = ?auto_164134 ?auto_164140 ) ) ( not ( = ?auto_164134 ?auto_164133 ) ) ( not ( = ?auto_164134 ?auto_164132 ) ) ( not ( = ?auto_164139 ?auto_164138 ) ) ( not ( = ?auto_164139 ?auto_164135 ) ) ( not ( = ?auto_164139 ?auto_164140 ) ) ( not ( = ?auto_164139 ?auto_164133 ) ) ( not ( = ?auto_164139 ?auto_164132 ) ) ( not ( = ?auto_164138 ?auto_164135 ) ) ( not ( = ?auto_164138 ?auto_164140 ) ) ( not ( = ?auto_164138 ?auto_164133 ) ) ( not ( = ?auto_164138 ?auto_164132 ) ) ( not ( = ?auto_164135 ?auto_164140 ) ) ( not ( = ?auto_164135 ?auto_164133 ) ) ( not ( = ?auto_164135 ?auto_164132 ) ) ( ON ?auto_164132 ?auto_164136 ) ( not ( = ?auto_164132 ?auto_164136 ) ) ( not ( = ?auto_164133 ?auto_164136 ) ) ( not ( = ?auto_164140 ?auto_164136 ) ) ( not ( = ?auto_164137 ?auto_164136 ) ) ( not ( = ?auto_164134 ?auto_164136 ) ) ( not ( = ?auto_164139 ?auto_164136 ) ) ( not ( = ?auto_164138 ?auto_164136 ) ) ( not ( = ?auto_164135 ?auto_164136 ) ) ( ON ?auto_164133 ?auto_164132 ) ( ON-TABLE ?auto_164136 ) ( ON ?auto_164140 ?auto_164133 ) ( ON ?auto_164135 ?auto_164140 ) ( ON ?auto_164138 ?auto_164135 ) ( CLEAR ?auto_164138 ) ( HOLDING ?auto_164139 ) ( CLEAR ?auto_164134 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_164137 ?auto_164134 ?auto_164139 )
      ( MAKE-2PILE ?auto_164132 ?auto_164133 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_164141 - BLOCK
      ?auto_164142 - BLOCK
    )
    :vars
    (
      ?auto_164149 - BLOCK
      ?auto_164144 - BLOCK
      ?auto_164148 - BLOCK
      ?auto_164146 - BLOCK
      ?auto_164147 - BLOCK
      ?auto_164143 - BLOCK
      ?auto_164145 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_164141 ?auto_164142 ) ) ( not ( = ?auto_164141 ?auto_164149 ) ) ( not ( = ?auto_164142 ?auto_164149 ) ) ( ON-TABLE ?auto_164144 ) ( ON ?auto_164148 ?auto_164144 ) ( not ( = ?auto_164144 ?auto_164148 ) ) ( not ( = ?auto_164144 ?auto_164146 ) ) ( not ( = ?auto_164144 ?auto_164147 ) ) ( not ( = ?auto_164144 ?auto_164143 ) ) ( not ( = ?auto_164144 ?auto_164149 ) ) ( not ( = ?auto_164144 ?auto_164142 ) ) ( not ( = ?auto_164144 ?auto_164141 ) ) ( not ( = ?auto_164148 ?auto_164146 ) ) ( not ( = ?auto_164148 ?auto_164147 ) ) ( not ( = ?auto_164148 ?auto_164143 ) ) ( not ( = ?auto_164148 ?auto_164149 ) ) ( not ( = ?auto_164148 ?auto_164142 ) ) ( not ( = ?auto_164148 ?auto_164141 ) ) ( not ( = ?auto_164146 ?auto_164147 ) ) ( not ( = ?auto_164146 ?auto_164143 ) ) ( not ( = ?auto_164146 ?auto_164149 ) ) ( not ( = ?auto_164146 ?auto_164142 ) ) ( not ( = ?auto_164146 ?auto_164141 ) ) ( not ( = ?auto_164147 ?auto_164143 ) ) ( not ( = ?auto_164147 ?auto_164149 ) ) ( not ( = ?auto_164147 ?auto_164142 ) ) ( not ( = ?auto_164147 ?auto_164141 ) ) ( not ( = ?auto_164143 ?auto_164149 ) ) ( not ( = ?auto_164143 ?auto_164142 ) ) ( not ( = ?auto_164143 ?auto_164141 ) ) ( ON ?auto_164141 ?auto_164145 ) ( not ( = ?auto_164141 ?auto_164145 ) ) ( not ( = ?auto_164142 ?auto_164145 ) ) ( not ( = ?auto_164149 ?auto_164145 ) ) ( not ( = ?auto_164144 ?auto_164145 ) ) ( not ( = ?auto_164148 ?auto_164145 ) ) ( not ( = ?auto_164146 ?auto_164145 ) ) ( not ( = ?auto_164147 ?auto_164145 ) ) ( not ( = ?auto_164143 ?auto_164145 ) ) ( ON ?auto_164142 ?auto_164141 ) ( ON-TABLE ?auto_164145 ) ( ON ?auto_164149 ?auto_164142 ) ( ON ?auto_164143 ?auto_164149 ) ( ON ?auto_164147 ?auto_164143 ) ( CLEAR ?auto_164148 ) ( ON ?auto_164146 ?auto_164147 ) ( CLEAR ?auto_164146 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_164145 ?auto_164141 ?auto_164142 ?auto_164149 ?auto_164143 ?auto_164147 )
      ( MAKE-2PILE ?auto_164141 ?auto_164142 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_164150 - BLOCK
      ?auto_164151 - BLOCK
    )
    :vars
    (
      ?auto_164153 - BLOCK
      ?auto_164154 - BLOCK
      ?auto_164158 - BLOCK
      ?auto_164152 - BLOCK
      ?auto_164155 - BLOCK
      ?auto_164156 - BLOCK
      ?auto_164157 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_164150 ?auto_164151 ) ) ( not ( = ?auto_164150 ?auto_164153 ) ) ( not ( = ?auto_164151 ?auto_164153 ) ) ( ON-TABLE ?auto_164154 ) ( not ( = ?auto_164154 ?auto_164158 ) ) ( not ( = ?auto_164154 ?auto_164152 ) ) ( not ( = ?auto_164154 ?auto_164155 ) ) ( not ( = ?auto_164154 ?auto_164156 ) ) ( not ( = ?auto_164154 ?auto_164153 ) ) ( not ( = ?auto_164154 ?auto_164151 ) ) ( not ( = ?auto_164154 ?auto_164150 ) ) ( not ( = ?auto_164158 ?auto_164152 ) ) ( not ( = ?auto_164158 ?auto_164155 ) ) ( not ( = ?auto_164158 ?auto_164156 ) ) ( not ( = ?auto_164158 ?auto_164153 ) ) ( not ( = ?auto_164158 ?auto_164151 ) ) ( not ( = ?auto_164158 ?auto_164150 ) ) ( not ( = ?auto_164152 ?auto_164155 ) ) ( not ( = ?auto_164152 ?auto_164156 ) ) ( not ( = ?auto_164152 ?auto_164153 ) ) ( not ( = ?auto_164152 ?auto_164151 ) ) ( not ( = ?auto_164152 ?auto_164150 ) ) ( not ( = ?auto_164155 ?auto_164156 ) ) ( not ( = ?auto_164155 ?auto_164153 ) ) ( not ( = ?auto_164155 ?auto_164151 ) ) ( not ( = ?auto_164155 ?auto_164150 ) ) ( not ( = ?auto_164156 ?auto_164153 ) ) ( not ( = ?auto_164156 ?auto_164151 ) ) ( not ( = ?auto_164156 ?auto_164150 ) ) ( ON ?auto_164150 ?auto_164157 ) ( not ( = ?auto_164150 ?auto_164157 ) ) ( not ( = ?auto_164151 ?auto_164157 ) ) ( not ( = ?auto_164153 ?auto_164157 ) ) ( not ( = ?auto_164154 ?auto_164157 ) ) ( not ( = ?auto_164158 ?auto_164157 ) ) ( not ( = ?auto_164152 ?auto_164157 ) ) ( not ( = ?auto_164155 ?auto_164157 ) ) ( not ( = ?auto_164156 ?auto_164157 ) ) ( ON ?auto_164151 ?auto_164150 ) ( ON-TABLE ?auto_164157 ) ( ON ?auto_164153 ?auto_164151 ) ( ON ?auto_164156 ?auto_164153 ) ( ON ?auto_164155 ?auto_164156 ) ( ON ?auto_164152 ?auto_164155 ) ( CLEAR ?auto_164152 ) ( HOLDING ?auto_164158 ) ( CLEAR ?auto_164154 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_164154 ?auto_164158 )
      ( MAKE-2PILE ?auto_164150 ?auto_164151 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_164159 - BLOCK
      ?auto_164160 - BLOCK
    )
    :vars
    (
      ?auto_164165 - BLOCK
      ?auto_164162 - BLOCK
      ?auto_164163 - BLOCK
      ?auto_164161 - BLOCK
      ?auto_164166 - BLOCK
      ?auto_164167 - BLOCK
      ?auto_164164 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_164159 ?auto_164160 ) ) ( not ( = ?auto_164159 ?auto_164165 ) ) ( not ( = ?auto_164160 ?auto_164165 ) ) ( ON-TABLE ?auto_164162 ) ( not ( = ?auto_164162 ?auto_164163 ) ) ( not ( = ?auto_164162 ?auto_164161 ) ) ( not ( = ?auto_164162 ?auto_164166 ) ) ( not ( = ?auto_164162 ?auto_164167 ) ) ( not ( = ?auto_164162 ?auto_164165 ) ) ( not ( = ?auto_164162 ?auto_164160 ) ) ( not ( = ?auto_164162 ?auto_164159 ) ) ( not ( = ?auto_164163 ?auto_164161 ) ) ( not ( = ?auto_164163 ?auto_164166 ) ) ( not ( = ?auto_164163 ?auto_164167 ) ) ( not ( = ?auto_164163 ?auto_164165 ) ) ( not ( = ?auto_164163 ?auto_164160 ) ) ( not ( = ?auto_164163 ?auto_164159 ) ) ( not ( = ?auto_164161 ?auto_164166 ) ) ( not ( = ?auto_164161 ?auto_164167 ) ) ( not ( = ?auto_164161 ?auto_164165 ) ) ( not ( = ?auto_164161 ?auto_164160 ) ) ( not ( = ?auto_164161 ?auto_164159 ) ) ( not ( = ?auto_164166 ?auto_164167 ) ) ( not ( = ?auto_164166 ?auto_164165 ) ) ( not ( = ?auto_164166 ?auto_164160 ) ) ( not ( = ?auto_164166 ?auto_164159 ) ) ( not ( = ?auto_164167 ?auto_164165 ) ) ( not ( = ?auto_164167 ?auto_164160 ) ) ( not ( = ?auto_164167 ?auto_164159 ) ) ( ON ?auto_164159 ?auto_164164 ) ( not ( = ?auto_164159 ?auto_164164 ) ) ( not ( = ?auto_164160 ?auto_164164 ) ) ( not ( = ?auto_164165 ?auto_164164 ) ) ( not ( = ?auto_164162 ?auto_164164 ) ) ( not ( = ?auto_164163 ?auto_164164 ) ) ( not ( = ?auto_164161 ?auto_164164 ) ) ( not ( = ?auto_164166 ?auto_164164 ) ) ( not ( = ?auto_164167 ?auto_164164 ) ) ( ON ?auto_164160 ?auto_164159 ) ( ON-TABLE ?auto_164164 ) ( ON ?auto_164165 ?auto_164160 ) ( ON ?auto_164167 ?auto_164165 ) ( ON ?auto_164166 ?auto_164167 ) ( ON ?auto_164161 ?auto_164166 ) ( CLEAR ?auto_164162 ) ( ON ?auto_164163 ?auto_164161 ) ( CLEAR ?auto_164163 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_164164 ?auto_164159 ?auto_164160 ?auto_164165 ?auto_164167 ?auto_164166 ?auto_164161 )
      ( MAKE-2PILE ?auto_164159 ?auto_164160 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_164168 - BLOCK
      ?auto_164169 - BLOCK
    )
    :vars
    (
      ?auto_164174 - BLOCK
      ?auto_164171 - BLOCK
      ?auto_164176 - BLOCK
      ?auto_164173 - BLOCK
      ?auto_164175 - BLOCK
      ?auto_164170 - BLOCK
      ?auto_164172 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_164168 ?auto_164169 ) ) ( not ( = ?auto_164168 ?auto_164174 ) ) ( not ( = ?auto_164169 ?auto_164174 ) ) ( not ( = ?auto_164171 ?auto_164176 ) ) ( not ( = ?auto_164171 ?auto_164173 ) ) ( not ( = ?auto_164171 ?auto_164175 ) ) ( not ( = ?auto_164171 ?auto_164170 ) ) ( not ( = ?auto_164171 ?auto_164174 ) ) ( not ( = ?auto_164171 ?auto_164169 ) ) ( not ( = ?auto_164171 ?auto_164168 ) ) ( not ( = ?auto_164176 ?auto_164173 ) ) ( not ( = ?auto_164176 ?auto_164175 ) ) ( not ( = ?auto_164176 ?auto_164170 ) ) ( not ( = ?auto_164176 ?auto_164174 ) ) ( not ( = ?auto_164176 ?auto_164169 ) ) ( not ( = ?auto_164176 ?auto_164168 ) ) ( not ( = ?auto_164173 ?auto_164175 ) ) ( not ( = ?auto_164173 ?auto_164170 ) ) ( not ( = ?auto_164173 ?auto_164174 ) ) ( not ( = ?auto_164173 ?auto_164169 ) ) ( not ( = ?auto_164173 ?auto_164168 ) ) ( not ( = ?auto_164175 ?auto_164170 ) ) ( not ( = ?auto_164175 ?auto_164174 ) ) ( not ( = ?auto_164175 ?auto_164169 ) ) ( not ( = ?auto_164175 ?auto_164168 ) ) ( not ( = ?auto_164170 ?auto_164174 ) ) ( not ( = ?auto_164170 ?auto_164169 ) ) ( not ( = ?auto_164170 ?auto_164168 ) ) ( ON ?auto_164168 ?auto_164172 ) ( not ( = ?auto_164168 ?auto_164172 ) ) ( not ( = ?auto_164169 ?auto_164172 ) ) ( not ( = ?auto_164174 ?auto_164172 ) ) ( not ( = ?auto_164171 ?auto_164172 ) ) ( not ( = ?auto_164176 ?auto_164172 ) ) ( not ( = ?auto_164173 ?auto_164172 ) ) ( not ( = ?auto_164175 ?auto_164172 ) ) ( not ( = ?auto_164170 ?auto_164172 ) ) ( ON ?auto_164169 ?auto_164168 ) ( ON-TABLE ?auto_164172 ) ( ON ?auto_164174 ?auto_164169 ) ( ON ?auto_164170 ?auto_164174 ) ( ON ?auto_164175 ?auto_164170 ) ( ON ?auto_164173 ?auto_164175 ) ( ON ?auto_164176 ?auto_164173 ) ( CLEAR ?auto_164176 ) ( HOLDING ?auto_164171 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_164171 )
      ( MAKE-2PILE ?auto_164168 ?auto_164169 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_164177 - BLOCK
      ?auto_164178 - BLOCK
    )
    :vars
    (
      ?auto_164183 - BLOCK
      ?auto_164185 - BLOCK
      ?auto_164182 - BLOCK
      ?auto_164184 - BLOCK
      ?auto_164180 - BLOCK
      ?auto_164181 - BLOCK
      ?auto_164179 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_164177 ?auto_164178 ) ) ( not ( = ?auto_164177 ?auto_164183 ) ) ( not ( = ?auto_164178 ?auto_164183 ) ) ( not ( = ?auto_164185 ?auto_164182 ) ) ( not ( = ?auto_164185 ?auto_164184 ) ) ( not ( = ?auto_164185 ?auto_164180 ) ) ( not ( = ?auto_164185 ?auto_164181 ) ) ( not ( = ?auto_164185 ?auto_164183 ) ) ( not ( = ?auto_164185 ?auto_164178 ) ) ( not ( = ?auto_164185 ?auto_164177 ) ) ( not ( = ?auto_164182 ?auto_164184 ) ) ( not ( = ?auto_164182 ?auto_164180 ) ) ( not ( = ?auto_164182 ?auto_164181 ) ) ( not ( = ?auto_164182 ?auto_164183 ) ) ( not ( = ?auto_164182 ?auto_164178 ) ) ( not ( = ?auto_164182 ?auto_164177 ) ) ( not ( = ?auto_164184 ?auto_164180 ) ) ( not ( = ?auto_164184 ?auto_164181 ) ) ( not ( = ?auto_164184 ?auto_164183 ) ) ( not ( = ?auto_164184 ?auto_164178 ) ) ( not ( = ?auto_164184 ?auto_164177 ) ) ( not ( = ?auto_164180 ?auto_164181 ) ) ( not ( = ?auto_164180 ?auto_164183 ) ) ( not ( = ?auto_164180 ?auto_164178 ) ) ( not ( = ?auto_164180 ?auto_164177 ) ) ( not ( = ?auto_164181 ?auto_164183 ) ) ( not ( = ?auto_164181 ?auto_164178 ) ) ( not ( = ?auto_164181 ?auto_164177 ) ) ( ON ?auto_164177 ?auto_164179 ) ( not ( = ?auto_164177 ?auto_164179 ) ) ( not ( = ?auto_164178 ?auto_164179 ) ) ( not ( = ?auto_164183 ?auto_164179 ) ) ( not ( = ?auto_164185 ?auto_164179 ) ) ( not ( = ?auto_164182 ?auto_164179 ) ) ( not ( = ?auto_164184 ?auto_164179 ) ) ( not ( = ?auto_164180 ?auto_164179 ) ) ( not ( = ?auto_164181 ?auto_164179 ) ) ( ON ?auto_164178 ?auto_164177 ) ( ON-TABLE ?auto_164179 ) ( ON ?auto_164183 ?auto_164178 ) ( ON ?auto_164181 ?auto_164183 ) ( ON ?auto_164180 ?auto_164181 ) ( ON ?auto_164184 ?auto_164180 ) ( ON ?auto_164182 ?auto_164184 ) ( ON ?auto_164185 ?auto_164182 ) ( CLEAR ?auto_164185 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_164179 ?auto_164177 ?auto_164178 ?auto_164183 ?auto_164181 ?auto_164180 ?auto_164184 ?auto_164182 )
      ( MAKE-2PILE ?auto_164177 ?auto_164178 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_164191 - BLOCK
      ?auto_164192 - BLOCK
      ?auto_164193 - BLOCK
      ?auto_164194 - BLOCK
      ?auto_164195 - BLOCK
    )
    :vars
    (
      ?auto_164196 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_164196 ?auto_164195 ) ( CLEAR ?auto_164196 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_164191 ) ( ON ?auto_164192 ?auto_164191 ) ( ON ?auto_164193 ?auto_164192 ) ( ON ?auto_164194 ?auto_164193 ) ( ON ?auto_164195 ?auto_164194 ) ( not ( = ?auto_164191 ?auto_164192 ) ) ( not ( = ?auto_164191 ?auto_164193 ) ) ( not ( = ?auto_164191 ?auto_164194 ) ) ( not ( = ?auto_164191 ?auto_164195 ) ) ( not ( = ?auto_164191 ?auto_164196 ) ) ( not ( = ?auto_164192 ?auto_164193 ) ) ( not ( = ?auto_164192 ?auto_164194 ) ) ( not ( = ?auto_164192 ?auto_164195 ) ) ( not ( = ?auto_164192 ?auto_164196 ) ) ( not ( = ?auto_164193 ?auto_164194 ) ) ( not ( = ?auto_164193 ?auto_164195 ) ) ( not ( = ?auto_164193 ?auto_164196 ) ) ( not ( = ?auto_164194 ?auto_164195 ) ) ( not ( = ?auto_164194 ?auto_164196 ) ) ( not ( = ?auto_164195 ?auto_164196 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_164196 ?auto_164195 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_164197 - BLOCK
      ?auto_164198 - BLOCK
      ?auto_164199 - BLOCK
      ?auto_164200 - BLOCK
      ?auto_164201 - BLOCK
    )
    :vars
    (
      ?auto_164202 - BLOCK
      ?auto_164203 - BLOCK
      ?auto_164204 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_164202 ?auto_164201 ) ( CLEAR ?auto_164202 ) ( ON-TABLE ?auto_164197 ) ( ON ?auto_164198 ?auto_164197 ) ( ON ?auto_164199 ?auto_164198 ) ( ON ?auto_164200 ?auto_164199 ) ( ON ?auto_164201 ?auto_164200 ) ( not ( = ?auto_164197 ?auto_164198 ) ) ( not ( = ?auto_164197 ?auto_164199 ) ) ( not ( = ?auto_164197 ?auto_164200 ) ) ( not ( = ?auto_164197 ?auto_164201 ) ) ( not ( = ?auto_164197 ?auto_164202 ) ) ( not ( = ?auto_164198 ?auto_164199 ) ) ( not ( = ?auto_164198 ?auto_164200 ) ) ( not ( = ?auto_164198 ?auto_164201 ) ) ( not ( = ?auto_164198 ?auto_164202 ) ) ( not ( = ?auto_164199 ?auto_164200 ) ) ( not ( = ?auto_164199 ?auto_164201 ) ) ( not ( = ?auto_164199 ?auto_164202 ) ) ( not ( = ?auto_164200 ?auto_164201 ) ) ( not ( = ?auto_164200 ?auto_164202 ) ) ( not ( = ?auto_164201 ?auto_164202 ) ) ( HOLDING ?auto_164203 ) ( CLEAR ?auto_164204 ) ( not ( = ?auto_164197 ?auto_164203 ) ) ( not ( = ?auto_164197 ?auto_164204 ) ) ( not ( = ?auto_164198 ?auto_164203 ) ) ( not ( = ?auto_164198 ?auto_164204 ) ) ( not ( = ?auto_164199 ?auto_164203 ) ) ( not ( = ?auto_164199 ?auto_164204 ) ) ( not ( = ?auto_164200 ?auto_164203 ) ) ( not ( = ?auto_164200 ?auto_164204 ) ) ( not ( = ?auto_164201 ?auto_164203 ) ) ( not ( = ?auto_164201 ?auto_164204 ) ) ( not ( = ?auto_164202 ?auto_164203 ) ) ( not ( = ?auto_164202 ?auto_164204 ) ) ( not ( = ?auto_164203 ?auto_164204 ) ) )
    :subtasks
    ( ( !STACK ?auto_164203 ?auto_164204 )
      ( MAKE-5PILE ?auto_164197 ?auto_164198 ?auto_164199 ?auto_164200 ?auto_164201 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_164205 - BLOCK
      ?auto_164206 - BLOCK
      ?auto_164207 - BLOCK
      ?auto_164208 - BLOCK
      ?auto_164209 - BLOCK
    )
    :vars
    (
      ?auto_164210 - BLOCK
      ?auto_164212 - BLOCK
      ?auto_164211 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_164210 ?auto_164209 ) ( ON-TABLE ?auto_164205 ) ( ON ?auto_164206 ?auto_164205 ) ( ON ?auto_164207 ?auto_164206 ) ( ON ?auto_164208 ?auto_164207 ) ( ON ?auto_164209 ?auto_164208 ) ( not ( = ?auto_164205 ?auto_164206 ) ) ( not ( = ?auto_164205 ?auto_164207 ) ) ( not ( = ?auto_164205 ?auto_164208 ) ) ( not ( = ?auto_164205 ?auto_164209 ) ) ( not ( = ?auto_164205 ?auto_164210 ) ) ( not ( = ?auto_164206 ?auto_164207 ) ) ( not ( = ?auto_164206 ?auto_164208 ) ) ( not ( = ?auto_164206 ?auto_164209 ) ) ( not ( = ?auto_164206 ?auto_164210 ) ) ( not ( = ?auto_164207 ?auto_164208 ) ) ( not ( = ?auto_164207 ?auto_164209 ) ) ( not ( = ?auto_164207 ?auto_164210 ) ) ( not ( = ?auto_164208 ?auto_164209 ) ) ( not ( = ?auto_164208 ?auto_164210 ) ) ( not ( = ?auto_164209 ?auto_164210 ) ) ( CLEAR ?auto_164212 ) ( not ( = ?auto_164205 ?auto_164211 ) ) ( not ( = ?auto_164205 ?auto_164212 ) ) ( not ( = ?auto_164206 ?auto_164211 ) ) ( not ( = ?auto_164206 ?auto_164212 ) ) ( not ( = ?auto_164207 ?auto_164211 ) ) ( not ( = ?auto_164207 ?auto_164212 ) ) ( not ( = ?auto_164208 ?auto_164211 ) ) ( not ( = ?auto_164208 ?auto_164212 ) ) ( not ( = ?auto_164209 ?auto_164211 ) ) ( not ( = ?auto_164209 ?auto_164212 ) ) ( not ( = ?auto_164210 ?auto_164211 ) ) ( not ( = ?auto_164210 ?auto_164212 ) ) ( not ( = ?auto_164211 ?auto_164212 ) ) ( ON ?auto_164211 ?auto_164210 ) ( CLEAR ?auto_164211 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_164205 ?auto_164206 ?auto_164207 ?auto_164208 ?auto_164209 ?auto_164210 )
      ( MAKE-5PILE ?auto_164205 ?auto_164206 ?auto_164207 ?auto_164208 ?auto_164209 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_164213 - BLOCK
      ?auto_164214 - BLOCK
      ?auto_164215 - BLOCK
      ?auto_164216 - BLOCK
      ?auto_164217 - BLOCK
    )
    :vars
    (
      ?auto_164219 - BLOCK
      ?auto_164220 - BLOCK
      ?auto_164218 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_164219 ?auto_164217 ) ( ON-TABLE ?auto_164213 ) ( ON ?auto_164214 ?auto_164213 ) ( ON ?auto_164215 ?auto_164214 ) ( ON ?auto_164216 ?auto_164215 ) ( ON ?auto_164217 ?auto_164216 ) ( not ( = ?auto_164213 ?auto_164214 ) ) ( not ( = ?auto_164213 ?auto_164215 ) ) ( not ( = ?auto_164213 ?auto_164216 ) ) ( not ( = ?auto_164213 ?auto_164217 ) ) ( not ( = ?auto_164213 ?auto_164219 ) ) ( not ( = ?auto_164214 ?auto_164215 ) ) ( not ( = ?auto_164214 ?auto_164216 ) ) ( not ( = ?auto_164214 ?auto_164217 ) ) ( not ( = ?auto_164214 ?auto_164219 ) ) ( not ( = ?auto_164215 ?auto_164216 ) ) ( not ( = ?auto_164215 ?auto_164217 ) ) ( not ( = ?auto_164215 ?auto_164219 ) ) ( not ( = ?auto_164216 ?auto_164217 ) ) ( not ( = ?auto_164216 ?auto_164219 ) ) ( not ( = ?auto_164217 ?auto_164219 ) ) ( not ( = ?auto_164213 ?auto_164220 ) ) ( not ( = ?auto_164213 ?auto_164218 ) ) ( not ( = ?auto_164214 ?auto_164220 ) ) ( not ( = ?auto_164214 ?auto_164218 ) ) ( not ( = ?auto_164215 ?auto_164220 ) ) ( not ( = ?auto_164215 ?auto_164218 ) ) ( not ( = ?auto_164216 ?auto_164220 ) ) ( not ( = ?auto_164216 ?auto_164218 ) ) ( not ( = ?auto_164217 ?auto_164220 ) ) ( not ( = ?auto_164217 ?auto_164218 ) ) ( not ( = ?auto_164219 ?auto_164220 ) ) ( not ( = ?auto_164219 ?auto_164218 ) ) ( not ( = ?auto_164220 ?auto_164218 ) ) ( ON ?auto_164220 ?auto_164219 ) ( CLEAR ?auto_164220 ) ( HOLDING ?auto_164218 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_164218 )
      ( MAKE-5PILE ?auto_164213 ?auto_164214 ?auto_164215 ?auto_164216 ?auto_164217 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_164221 - BLOCK
      ?auto_164222 - BLOCK
      ?auto_164223 - BLOCK
      ?auto_164224 - BLOCK
      ?auto_164225 - BLOCK
    )
    :vars
    (
      ?auto_164227 - BLOCK
      ?auto_164228 - BLOCK
      ?auto_164226 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_164227 ?auto_164225 ) ( ON-TABLE ?auto_164221 ) ( ON ?auto_164222 ?auto_164221 ) ( ON ?auto_164223 ?auto_164222 ) ( ON ?auto_164224 ?auto_164223 ) ( ON ?auto_164225 ?auto_164224 ) ( not ( = ?auto_164221 ?auto_164222 ) ) ( not ( = ?auto_164221 ?auto_164223 ) ) ( not ( = ?auto_164221 ?auto_164224 ) ) ( not ( = ?auto_164221 ?auto_164225 ) ) ( not ( = ?auto_164221 ?auto_164227 ) ) ( not ( = ?auto_164222 ?auto_164223 ) ) ( not ( = ?auto_164222 ?auto_164224 ) ) ( not ( = ?auto_164222 ?auto_164225 ) ) ( not ( = ?auto_164222 ?auto_164227 ) ) ( not ( = ?auto_164223 ?auto_164224 ) ) ( not ( = ?auto_164223 ?auto_164225 ) ) ( not ( = ?auto_164223 ?auto_164227 ) ) ( not ( = ?auto_164224 ?auto_164225 ) ) ( not ( = ?auto_164224 ?auto_164227 ) ) ( not ( = ?auto_164225 ?auto_164227 ) ) ( not ( = ?auto_164221 ?auto_164228 ) ) ( not ( = ?auto_164221 ?auto_164226 ) ) ( not ( = ?auto_164222 ?auto_164228 ) ) ( not ( = ?auto_164222 ?auto_164226 ) ) ( not ( = ?auto_164223 ?auto_164228 ) ) ( not ( = ?auto_164223 ?auto_164226 ) ) ( not ( = ?auto_164224 ?auto_164228 ) ) ( not ( = ?auto_164224 ?auto_164226 ) ) ( not ( = ?auto_164225 ?auto_164228 ) ) ( not ( = ?auto_164225 ?auto_164226 ) ) ( not ( = ?auto_164227 ?auto_164228 ) ) ( not ( = ?auto_164227 ?auto_164226 ) ) ( not ( = ?auto_164228 ?auto_164226 ) ) ( ON ?auto_164228 ?auto_164227 ) ( ON ?auto_164226 ?auto_164228 ) ( CLEAR ?auto_164226 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_164221 ?auto_164222 ?auto_164223 ?auto_164224 ?auto_164225 ?auto_164227 ?auto_164228 )
      ( MAKE-5PILE ?auto_164221 ?auto_164222 ?auto_164223 ?auto_164224 ?auto_164225 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_164229 - BLOCK
      ?auto_164230 - BLOCK
      ?auto_164231 - BLOCK
      ?auto_164232 - BLOCK
      ?auto_164233 - BLOCK
    )
    :vars
    (
      ?auto_164235 - BLOCK
      ?auto_164236 - BLOCK
      ?auto_164234 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_164235 ?auto_164233 ) ( ON-TABLE ?auto_164229 ) ( ON ?auto_164230 ?auto_164229 ) ( ON ?auto_164231 ?auto_164230 ) ( ON ?auto_164232 ?auto_164231 ) ( ON ?auto_164233 ?auto_164232 ) ( not ( = ?auto_164229 ?auto_164230 ) ) ( not ( = ?auto_164229 ?auto_164231 ) ) ( not ( = ?auto_164229 ?auto_164232 ) ) ( not ( = ?auto_164229 ?auto_164233 ) ) ( not ( = ?auto_164229 ?auto_164235 ) ) ( not ( = ?auto_164230 ?auto_164231 ) ) ( not ( = ?auto_164230 ?auto_164232 ) ) ( not ( = ?auto_164230 ?auto_164233 ) ) ( not ( = ?auto_164230 ?auto_164235 ) ) ( not ( = ?auto_164231 ?auto_164232 ) ) ( not ( = ?auto_164231 ?auto_164233 ) ) ( not ( = ?auto_164231 ?auto_164235 ) ) ( not ( = ?auto_164232 ?auto_164233 ) ) ( not ( = ?auto_164232 ?auto_164235 ) ) ( not ( = ?auto_164233 ?auto_164235 ) ) ( not ( = ?auto_164229 ?auto_164236 ) ) ( not ( = ?auto_164229 ?auto_164234 ) ) ( not ( = ?auto_164230 ?auto_164236 ) ) ( not ( = ?auto_164230 ?auto_164234 ) ) ( not ( = ?auto_164231 ?auto_164236 ) ) ( not ( = ?auto_164231 ?auto_164234 ) ) ( not ( = ?auto_164232 ?auto_164236 ) ) ( not ( = ?auto_164232 ?auto_164234 ) ) ( not ( = ?auto_164233 ?auto_164236 ) ) ( not ( = ?auto_164233 ?auto_164234 ) ) ( not ( = ?auto_164235 ?auto_164236 ) ) ( not ( = ?auto_164235 ?auto_164234 ) ) ( not ( = ?auto_164236 ?auto_164234 ) ) ( ON ?auto_164236 ?auto_164235 ) ( HOLDING ?auto_164234 ) ( CLEAR ?auto_164236 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_164229 ?auto_164230 ?auto_164231 ?auto_164232 ?auto_164233 ?auto_164235 ?auto_164236 ?auto_164234 )
      ( MAKE-5PILE ?auto_164229 ?auto_164230 ?auto_164231 ?auto_164232 ?auto_164233 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_164237 - BLOCK
      ?auto_164238 - BLOCK
      ?auto_164239 - BLOCK
      ?auto_164240 - BLOCK
      ?auto_164241 - BLOCK
    )
    :vars
    (
      ?auto_164242 - BLOCK
      ?auto_164244 - BLOCK
      ?auto_164243 - BLOCK
      ?auto_164245 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_164242 ?auto_164241 ) ( ON-TABLE ?auto_164237 ) ( ON ?auto_164238 ?auto_164237 ) ( ON ?auto_164239 ?auto_164238 ) ( ON ?auto_164240 ?auto_164239 ) ( ON ?auto_164241 ?auto_164240 ) ( not ( = ?auto_164237 ?auto_164238 ) ) ( not ( = ?auto_164237 ?auto_164239 ) ) ( not ( = ?auto_164237 ?auto_164240 ) ) ( not ( = ?auto_164237 ?auto_164241 ) ) ( not ( = ?auto_164237 ?auto_164242 ) ) ( not ( = ?auto_164238 ?auto_164239 ) ) ( not ( = ?auto_164238 ?auto_164240 ) ) ( not ( = ?auto_164238 ?auto_164241 ) ) ( not ( = ?auto_164238 ?auto_164242 ) ) ( not ( = ?auto_164239 ?auto_164240 ) ) ( not ( = ?auto_164239 ?auto_164241 ) ) ( not ( = ?auto_164239 ?auto_164242 ) ) ( not ( = ?auto_164240 ?auto_164241 ) ) ( not ( = ?auto_164240 ?auto_164242 ) ) ( not ( = ?auto_164241 ?auto_164242 ) ) ( not ( = ?auto_164237 ?auto_164244 ) ) ( not ( = ?auto_164237 ?auto_164243 ) ) ( not ( = ?auto_164238 ?auto_164244 ) ) ( not ( = ?auto_164238 ?auto_164243 ) ) ( not ( = ?auto_164239 ?auto_164244 ) ) ( not ( = ?auto_164239 ?auto_164243 ) ) ( not ( = ?auto_164240 ?auto_164244 ) ) ( not ( = ?auto_164240 ?auto_164243 ) ) ( not ( = ?auto_164241 ?auto_164244 ) ) ( not ( = ?auto_164241 ?auto_164243 ) ) ( not ( = ?auto_164242 ?auto_164244 ) ) ( not ( = ?auto_164242 ?auto_164243 ) ) ( not ( = ?auto_164244 ?auto_164243 ) ) ( ON ?auto_164244 ?auto_164242 ) ( CLEAR ?auto_164244 ) ( ON ?auto_164243 ?auto_164245 ) ( CLEAR ?auto_164243 ) ( HAND-EMPTY ) ( not ( = ?auto_164237 ?auto_164245 ) ) ( not ( = ?auto_164238 ?auto_164245 ) ) ( not ( = ?auto_164239 ?auto_164245 ) ) ( not ( = ?auto_164240 ?auto_164245 ) ) ( not ( = ?auto_164241 ?auto_164245 ) ) ( not ( = ?auto_164242 ?auto_164245 ) ) ( not ( = ?auto_164244 ?auto_164245 ) ) ( not ( = ?auto_164243 ?auto_164245 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_164243 ?auto_164245 )
      ( MAKE-5PILE ?auto_164237 ?auto_164238 ?auto_164239 ?auto_164240 ?auto_164241 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_164246 - BLOCK
      ?auto_164247 - BLOCK
      ?auto_164248 - BLOCK
      ?auto_164249 - BLOCK
      ?auto_164250 - BLOCK
    )
    :vars
    (
      ?auto_164253 - BLOCK
      ?auto_164252 - BLOCK
      ?auto_164254 - BLOCK
      ?auto_164251 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_164253 ?auto_164250 ) ( ON-TABLE ?auto_164246 ) ( ON ?auto_164247 ?auto_164246 ) ( ON ?auto_164248 ?auto_164247 ) ( ON ?auto_164249 ?auto_164248 ) ( ON ?auto_164250 ?auto_164249 ) ( not ( = ?auto_164246 ?auto_164247 ) ) ( not ( = ?auto_164246 ?auto_164248 ) ) ( not ( = ?auto_164246 ?auto_164249 ) ) ( not ( = ?auto_164246 ?auto_164250 ) ) ( not ( = ?auto_164246 ?auto_164253 ) ) ( not ( = ?auto_164247 ?auto_164248 ) ) ( not ( = ?auto_164247 ?auto_164249 ) ) ( not ( = ?auto_164247 ?auto_164250 ) ) ( not ( = ?auto_164247 ?auto_164253 ) ) ( not ( = ?auto_164248 ?auto_164249 ) ) ( not ( = ?auto_164248 ?auto_164250 ) ) ( not ( = ?auto_164248 ?auto_164253 ) ) ( not ( = ?auto_164249 ?auto_164250 ) ) ( not ( = ?auto_164249 ?auto_164253 ) ) ( not ( = ?auto_164250 ?auto_164253 ) ) ( not ( = ?auto_164246 ?auto_164252 ) ) ( not ( = ?auto_164246 ?auto_164254 ) ) ( not ( = ?auto_164247 ?auto_164252 ) ) ( not ( = ?auto_164247 ?auto_164254 ) ) ( not ( = ?auto_164248 ?auto_164252 ) ) ( not ( = ?auto_164248 ?auto_164254 ) ) ( not ( = ?auto_164249 ?auto_164252 ) ) ( not ( = ?auto_164249 ?auto_164254 ) ) ( not ( = ?auto_164250 ?auto_164252 ) ) ( not ( = ?auto_164250 ?auto_164254 ) ) ( not ( = ?auto_164253 ?auto_164252 ) ) ( not ( = ?auto_164253 ?auto_164254 ) ) ( not ( = ?auto_164252 ?auto_164254 ) ) ( ON ?auto_164254 ?auto_164251 ) ( CLEAR ?auto_164254 ) ( not ( = ?auto_164246 ?auto_164251 ) ) ( not ( = ?auto_164247 ?auto_164251 ) ) ( not ( = ?auto_164248 ?auto_164251 ) ) ( not ( = ?auto_164249 ?auto_164251 ) ) ( not ( = ?auto_164250 ?auto_164251 ) ) ( not ( = ?auto_164253 ?auto_164251 ) ) ( not ( = ?auto_164252 ?auto_164251 ) ) ( not ( = ?auto_164254 ?auto_164251 ) ) ( HOLDING ?auto_164252 ) ( CLEAR ?auto_164253 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_164246 ?auto_164247 ?auto_164248 ?auto_164249 ?auto_164250 ?auto_164253 ?auto_164252 )
      ( MAKE-5PILE ?auto_164246 ?auto_164247 ?auto_164248 ?auto_164249 ?auto_164250 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_164255 - BLOCK
      ?auto_164256 - BLOCK
      ?auto_164257 - BLOCK
      ?auto_164258 - BLOCK
      ?auto_164259 - BLOCK
    )
    :vars
    (
      ?auto_164262 - BLOCK
      ?auto_164263 - BLOCK
      ?auto_164260 - BLOCK
      ?auto_164261 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_164262 ?auto_164259 ) ( ON-TABLE ?auto_164255 ) ( ON ?auto_164256 ?auto_164255 ) ( ON ?auto_164257 ?auto_164256 ) ( ON ?auto_164258 ?auto_164257 ) ( ON ?auto_164259 ?auto_164258 ) ( not ( = ?auto_164255 ?auto_164256 ) ) ( not ( = ?auto_164255 ?auto_164257 ) ) ( not ( = ?auto_164255 ?auto_164258 ) ) ( not ( = ?auto_164255 ?auto_164259 ) ) ( not ( = ?auto_164255 ?auto_164262 ) ) ( not ( = ?auto_164256 ?auto_164257 ) ) ( not ( = ?auto_164256 ?auto_164258 ) ) ( not ( = ?auto_164256 ?auto_164259 ) ) ( not ( = ?auto_164256 ?auto_164262 ) ) ( not ( = ?auto_164257 ?auto_164258 ) ) ( not ( = ?auto_164257 ?auto_164259 ) ) ( not ( = ?auto_164257 ?auto_164262 ) ) ( not ( = ?auto_164258 ?auto_164259 ) ) ( not ( = ?auto_164258 ?auto_164262 ) ) ( not ( = ?auto_164259 ?auto_164262 ) ) ( not ( = ?auto_164255 ?auto_164263 ) ) ( not ( = ?auto_164255 ?auto_164260 ) ) ( not ( = ?auto_164256 ?auto_164263 ) ) ( not ( = ?auto_164256 ?auto_164260 ) ) ( not ( = ?auto_164257 ?auto_164263 ) ) ( not ( = ?auto_164257 ?auto_164260 ) ) ( not ( = ?auto_164258 ?auto_164263 ) ) ( not ( = ?auto_164258 ?auto_164260 ) ) ( not ( = ?auto_164259 ?auto_164263 ) ) ( not ( = ?auto_164259 ?auto_164260 ) ) ( not ( = ?auto_164262 ?auto_164263 ) ) ( not ( = ?auto_164262 ?auto_164260 ) ) ( not ( = ?auto_164263 ?auto_164260 ) ) ( ON ?auto_164260 ?auto_164261 ) ( not ( = ?auto_164255 ?auto_164261 ) ) ( not ( = ?auto_164256 ?auto_164261 ) ) ( not ( = ?auto_164257 ?auto_164261 ) ) ( not ( = ?auto_164258 ?auto_164261 ) ) ( not ( = ?auto_164259 ?auto_164261 ) ) ( not ( = ?auto_164262 ?auto_164261 ) ) ( not ( = ?auto_164263 ?auto_164261 ) ) ( not ( = ?auto_164260 ?auto_164261 ) ) ( CLEAR ?auto_164262 ) ( ON ?auto_164263 ?auto_164260 ) ( CLEAR ?auto_164263 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_164261 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_164261 ?auto_164260 )
      ( MAKE-5PILE ?auto_164255 ?auto_164256 ?auto_164257 ?auto_164258 ?auto_164259 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_164282 - BLOCK
      ?auto_164283 - BLOCK
      ?auto_164284 - BLOCK
      ?auto_164285 - BLOCK
      ?auto_164286 - BLOCK
    )
    :vars
    (
      ?auto_164290 - BLOCK
      ?auto_164289 - BLOCK
      ?auto_164287 - BLOCK
      ?auto_164288 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_164282 ) ( ON ?auto_164283 ?auto_164282 ) ( ON ?auto_164284 ?auto_164283 ) ( ON ?auto_164285 ?auto_164284 ) ( not ( = ?auto_164282 ?auto_164283 ) ) ( not ( = ?auto_164282 ?auto_164284 ) ) ( not ( = ?auto_164282 ?auto_164285 ) ) ( not ( = ?auto_164282 ?auto_164286 ) ) ( not ( = ?auto_164282 ?auto_164290 ) ) ( not ( = ?auto_164283 ?auto_164284 ) ) ( not ( = ?auto_164283 ?auto_164285 ) ) ( not ( = ?auto_164283 ?auto_164286 ) ) ( not ( = ?auto_164283 ?auto_164290 ) ) ( not ( = ?auto_164284 ?auto_164285 ) ) ( not ( = ?auto_164284 ?auto_164286 ) ) ( not ( = ?auto_164284 ?auto_164290 ) ) ( not ( = ?auto_164285 ?auto_164286 ) ) ( not ( = ?auto_164285 ?auto_164290 ) ) ( not ( = ?auto_164286 ?auto_164290 ) ) ( not ( = ?auto_164282 ?auto_164289 ) ) ( not ( = ?auto_164282 ?auto_164287 ) ) ( not ( = ?auto_164283 ?auto_164289 ) ) ( not ( = ?auto_164283 ?auto_164287 ) ) ( not ( = ?auto_164284 ?auto_164289 ) ) ( not ( = ?auto_164284 ?auto_164287 ) ) ( not ( = ?auto_164285 ?auto_164289 ) ) ( not ( = ?auto_164285 ?auto_164287 ) ) ( not ( = ?auto_164286 ?auto_164289 ) ) ( not ( = ?auto_164286 ?auto_164287 ) ) ( not ( = ?auto_164290 ?auto_164289 ) ) ( not ( = ?auto_164290 ?auto_164287 ) ) ( not ( = ?auto_164289 ?auto_164287 ) ) ( ON ?auto_164287 ?auto_164288 ) ( not ( = ?auto_164282 ?auto_164288 ) ) ( not ( = ?auto_164283 ?auto_164288 ) ) ( not ( = ?auto_164284 ?auto_164288 ) ) ( not ( = ?auto_164285 ?auto_164288 ) ) ( not ( = ?auto_164286 ?auto_164288 ) ) ( not ( = ?auto_164290 ?auto_164288 ) ) ( not ( = ?auto_164289 ?auto_164288 ) ) ( not ( = ?auto_164287 ?auto_164288 ) ) ( ON ?auto_164289 ?auto_164287 ) ( ON-TABLE ?auto_164288 ) ( ON ?auto_164290 ?auto_164289 ) ( CLEAR ?auto_164290 ) ( HOLDING ?auto_164286 ) ( CLEAR ?auto_164285 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_164282 ?auto_164283 ?auto_164284 ?auto_164285 ?auto_164286 ?auto_164290 )
      ( MAKE-5PILE ?auto_164282 ?auto_164283 ?auto_164284 ?auto_164285 ?auto_164286 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_164291 - BLOCK
      ?auto_164292 - BLOCK
      ?auto_164293 - BLOCK
      ?auto_164294 - BLOCK
      ?auto_164295 - BLOCK
    )
    :vars
    (
      ?auto_164296 - BLOCK
      ?auto_164298 - BLOCK
      ?auto_164299 - BLOCK
      ?auto_164297 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_164291 ) ( ON ?auto_164292 ?auto_164291 ) ( ON ?auto_164293 ?auto_164292 ) ( ON ?auto_164294 ?auto_164293 ) ( not ( = ?auto_164291 ?auto_164292 ) ) ( not ( = ?auto_164291 ?auto_164293 ) ) ( not ( = ?auto_164291 ?auto_164294 ) ) ( not ( = ?auto_164291 ?auto_164295 ) ) ( not ( = ?auto_164291 ?auto_164296 ) ) ( not ( = ?auto_164292 ?auto_164293 ) ) ( not ( = ?auto_164292 ?auto_164294 ) ) ( not ( = ?auto_164292 ?auto_164295 ) ) ( not ( = ?auto_164292 ?auto_164296 ) ) ( not ( = ?auto_164293 ?auto_164294 ) ) ( not ( = ?auto_164293 ?auto_164295 ) ) ( not ( = ?auto_164293 ?auto_164296 ) ) ( not ( = ?auto_164294 ?auto_164295 ) ) ( not ( = ?auto_164294 ?auto_164296 ) ) ( not ( = ?auto_164295 ?auto_164296 ) ) ( not ( = ?auto_164291 ?auto_164298 ) ) ( not ( = ?auto_164291 ?auto_164299 ) ) ( not ( = ?auto_164292 ?auto_164298 ) ) ( not ( = ?auto_164292 ?auto_164299 ) ) ( not ( = ?auto_164293 ?auto_164298 ) ) ( not ( = ?auto_164293 ?auto_164299 ) ) ( not ( = ?auto_164294 ?auto_164298 ) ) ( not ( = ?auto_164294 ?auto_164299 ) ) ( not ( = ?auto_164295 ?auto_164298 ) ) ( not ( = ?auto_164295 ?auto_164299 ) ) ( not ( = ?auto_164296 ?auto_164298 ) ) ( not ( = ?auto_164296 ?auto_164299 ) ) ( not ( = ?auto_164298 ?auto_164299 ) ) ( ON ?auto_164299 ?auto_164297 ) ( not ( = ?auto_164291 ?auto_164297 ) ) ( not ( = ?auto_164292 ?auto_164297 ) ) ( not ( = ?auto_164293 ?auto_164297 ) ) ( not ( = ?auto_164294 ?auto_164297 ) ) ( not ( = ?auto_164295 ?auto_164297 ) ) ( not ( = ?auto_164296 ?auto_164297 ) ) ( not ( = ?auto_164298 ?auto_164297 ) ) ( not ( = ?auto_164299 ?auto_164297 ) ) ( ON ?auto_164298 ?auto_164299 ) ( ON-TABLE ?auto_164297 ) ( ON ?auto_164296 ?auto_164298 ) ( CLEAR ?auto_164294 ) ( ON ?auto_164295 ?auto_164296 ) ( CLEAR ?auto_164295 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_164297 ?auto_164299 ?auto_164298 ?auto_164296 )
      ( MAKE-5PILE ?auto_164291 ?auto_164292 ?auto_164293 ?auto_164294 ?auto_164295 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_164300 - BLOCK
      ?auto_164301 - BLOCK
      ?auto_164302 - BLOCK
      ?auto_164303 - BLOCK
      ?auto_164304 - BLOCK
    )
    :vars
    (
      ?auto_164307 - BLOCK
      ?auto_164308 - BLOCK
      ?auto_164305 - BLOCK
      ?auto_164306 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_164300 ) ( ON ?auto_164301 ?auto_164300 ) ( ON ?auto_164302 ?auto_164301 ) ( not ( = ?auto_164300 ?auto_164301 ) ) ( not ( = ?auto_164300 ?auto_164302 ) ) ( not ( = ?auto_164300 ?auto_164303 ) ) ( not ( = ?auto_164300 ?auto_164304 ) ) ( not ( = ?auto_164300 ?auto_164307 ) ) ( not ( = ?auto_164301 ?auto_164302 ) ) ( not ( = ?auto_164301 ?auto_164303 ) ) ( not ( = ?auto_164301 ?auto_164304 ) ) ( not ( = ?auto_164301 ?auto_164307 ) ) ( not ( = ?auto_164302 ?auto_164303 ) ) ( not ( = ?auto_164302 ?auto_164304 ) ) ( not ( = ?auto_164302 ?auto_164307 ) ) ( not ( = ?auto_164303 ?auto_164304 ) ) ( not ( = ?auto_164303 ?auto_164307 ) ) ( not ( = ?auto_164304 ?auto_164307 ) ) ( not ( = ?auto_164300 ?auto_164308 ) ) ( not ( = ?auto_164300 ?auto_164305 ) ) ( not ( = ?auto_164301 ?auto_164308 ) ) ( not ( = ?auto_164301 ?auto_164305 ) ) ( not ( = ?auto_164302 ?auto_164308 ) ) ( not ( = ?auto_164302 ?auto_164305 ) ) ( not ( = ?auto_164303 ?auto_164308 ) ) ( not ( = ?auto_164303 ?auto_164305 ) ) ( not ( = ?auto_164304 ?auto_164308 ) ) ( not ( = ?auto_164304 ?auto_164305 ) ) ( not ( = ?auto_164307 ?auto_164308 ) ) ( not ( = ?auto_164307 ?auto_164305 ) ) ( not ( = ?auto_164308 ?auto_164305 ) ) ( ON ?auto_164305 ?auto_164306 ) ( not ( = ?auto_164300 ?auto_164306 ) ) ( not ( = ?auto_164301 ?auto_164306 ) ) ( not ( = ?auto_164302 ?auto_164306 ) ) ( not ( = ?auto_164303 ?auto_164306 ) ) ( not ( = ?auto_164304 ?auto_164306 ) ) ( not ( = ?auto_164307 ?auto_164306 ) ) ( not ( = ?auto_164308 ?auto_164306 ) ) ( not ( = ?auto_164305 ?auto_164306 ) ) ( ON ?auto_164308 ?auto_164305 ) ( ON-TABLE ?auto_164306 ) ( ON ?auto_164307 ?auto_164308 ) ( ON ?auto_164304 ?auto_164307 ) ( CLEAR ?auto_164304 ) ( HOLDING ?auto_164303 ) ( CLEAR ?auto_164302 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_164300 ?auto_164301 ?auto_164302 ?auto_164303 )
      ( MAKE-5PILE ?auto_164300 ?auto_164301 ?auto_164302 ?auto_164303 ?auto_164304 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_164309 - BLOCK
      ?auto_164310 - BLOCK
      ?auto_164311 - BLOCK
      ?auto_164312 - BLOCK
      ?auto_164313 - BLOCK
    )
    :vars
    (
      ?auto_164314 - BLOCK
      ?auto_164315 - BLOCK
      ?auto_164316 - BLOCK
      ?auto_164317 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_164309 ) ( ON ?auto_164310 ?auto_164309 ) ( ON ?auto_164311 ?auto_164310 ) ( not ( = ?auto_164309 ?auto_164310 ) ) ( not ( = ?auto_164309 ?auto_164311 ) ) ( not ( = ?auto_164309 ?auto_164312 ) ) ( not ( = ?auto_164309 ?auto_164313 ) ) ( not ( = ?auto_164309 ?auto_164314 ) ) ( not ( = ?auto_164310 ?auto_164311 ) ) ( not ( = ?auto_164310 ?auto_164312 ) ) ( not ( = ?auto_164310 ?auto_164313 ) ) ( not ( = ?auto_164310 ?auto_164314 ) ) ( not ( = ?auto_164311 ?auto_164312 ) ) ( not ( = ?auto_164311 ?auto_164313 ) ) ( not ( = ?auto_164311 ?auto_164314 ) ) ( not ( = ?auto_164312 ?auto_164313 ) ) ( not ( = ?auto_164312 ?auto_164314 ) ) ( not ( = ?auto_164313 ?auto_164314 ) ) ( not ( = ?auto_164309 ?auto_164315 ) ) ( not ( = ?auto_164309 ?auto_164316 ) ) ( not ( = ?auto_164310 ?auto_164315 ) ) ( not ( = ?auto_164310 ?auto_164316 ) ) ( not ( = ?auto_164311 ?auto_164315 ) ) ( not ( = ?auto_164311 ?auto_164316 ) ) ( not ( = ?auto_164312 ?auto_164315 ) ) ( not ( = ?auto_164312 ?auto_164316 ) ) ( not ( = ?auto_164313 ?auto_164315 ) ) ( not ( = ?auto_164313 ?auto_164316 ) ) ( not ( = ?auto_164314 ?auto_164315 ) ) ( not ( = ?auto_164314 ?auto_164316 ) ) ( not ( = ?auto_164315 ?auto_164316 ) ) ( ON ?auto_164316 ?auto_164317 ) ( not ( = ?auto_164309 ?auto_164317 ) ) ( not ( = ?auto_164310 ?auto_164317 ) ) ( not ( = ?auto_164311 ?auto_164317 ) ) ( not ( = ?auto_164312 ?auto_164317 ) ) ( not ( = ?auto_164313 ?auto_164317 ) ) ( not ( = ?auto_164314 ?auto_164317 ) ) ( not ( = ?auto_164315 ?auto_164317 ) ) ( not ( = ?auto_164316 ?auto_164317 ) ) ( ON ?auto_164315 ?auto_164316 ) ( ON-TABLE ?auto_164317 ) ( ON ?auto_164314 ?auto_164315 ) ( ON ?auto_164313 ?auto_164314 ) ( CLEAR ?auto_164311 ) ( ON ?auto_164312 ?auto_164313 ) ( CLEAR ?auto_164312 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_164317 ?auto_164316 ?auto_164315 ?auto_164314 ?auto_164313 )
      ( MAKE-5PILE ?auto_164309 ?auto_164310 ?auto_164311 ?auto_164312 ?auto_164313 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_164318 - BLOCK
      ?auto_164319 - BLOCK
      ?auto_164320 - BLOCK
      ?auto_164321 - BLOCK
      ?auto_164322 - BLOCK
    )
    :vars
    (
      ?auto_164326 - BLOCK
      ?auto_164325 - BLOCK
      ?auto_164324 - BLOCK
      ?auto_164323 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_164318 ) ( ON ?auto_164319 ?auto_164318 ) ( not ( = ?auto_164318 ?auto_164319 ) ) ( not ( = ?auto_164318 ?auto_164320 ) ) ( not ( = ?auto_164318 ?auto_164321 ) ) ( not ( = ?auto_164318 ?auto_164322 ) ) ( not ( = ?auto_164318 ?auto_164326 ) ) ( not ( = ?auto_164319 ?auto_164320 ) ) ( not ( = ?auto_164319 ?auto_164321 ) ) ( not ( = ?auto_164319 ?auto_164322 ) ) ( not ( = ?auto_164319 ?auto_164326 ) ) ( not ( = ?auto_164320 ?auto_164321 ) ) ( not ( = ?auto_164320 ?auto_164322 ) ) ( not ( = ?auto_164320 ?auto_164326 ) ) ( not ( = ?auto_164321 ?auto_164322 ) ) ( not ( = ?auto_164321 ?auto_164326 ) ) ( not ( = ?auto_164322 ?auto_164326 ) ) ( not ( = ?auto_164318 ?auto_164325 ) ) ( not ( = ?auto_164318 ?auto_164324 ) ) ( not ( = ?auto_164319 ?auto_164325 ) ) ( not ( = ?auto_164319 ?auto_164324 ) ) ( not ( = ?auto_164320 ?auto_164325 ) ) ( not ( = ?auto_164320 ?auto_164324 ) ) ( not ( = ?auto_164321 ?auto_164325 ) ) ( not ( = ?auto_164321 ?auto_164324 ) ) ( not ( = ?auto_164322 ?auto_164325 ) ) ( not ( = ?auto_164322 ?auto_164324 ) ) ( not ( = ?auto_164326 ?auto_164325 ) ) ( not ( = ?auto_164326 ?auto_164324 ) ) ( not ( = ?auto_164325 ?auto_164324 ) ) ( ON ?auto_164324 ?auto_164323 ) ( not ( = ?auto_164318 ?auto_164323 ) ) ( not ( = ?auto_164319 ?auto_164323 ) ) ( not ( = ?auto_164320 ?auto_164323 ) ) ( not ( = ?auto_164321 ?auto_164323 ) ) ( not ( = ?auto_164322 ?auto_164323 ) ) ( not ( = ?auto_164326 ?auto_164323 ) ) ( not ( = ?auto_164325 ?auto_164323 ) ) ( not ( = ?auto_164324 ?auto_164323 ) ) ( ON ?auto_164325 ?auto_164324 ) ( ON-TABLE ?auto_164323 ) ( ON ?auto_164326 ?auto_164325 ) ( ON ?auto_164322 ?auto_164326 ) ( ON ?auto_164321 ?auto_164322 ) ( CLEAR ?auto_164321 ) ( HOLDING ?auto_164320 ) ( CLEAR ?auto_164319 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_164318 ?auto_164319 ?auto_164320 )
      ( MAKE-5PILE ?auto_164318 ?auto_164319 ?auto_164320 ?auto_164321 ?auto_164322 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_164327 - BLOCK
      ?auto_164328 - BLOCK
      ?auto_164329 - BLOCK
      ?auto_164330 - BLOCK
      ?auto_164331 - BLOCK
    )
    :vars
    (
      ?auto_164332 - BLOCK
      ?auto_164333 - BLOCK
      ?auto_164334 - BLOCK
      ?auto_164335 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_164327 ) ( ON ?auto_164328 ?auto_164327 ) ( not ( = ?auto_164327 ?auto_164328 ) ) ( not ( = ?auto_164327 ?auto_164329 ) ) ( not ( = ?auto_164327 ?auto_164330 ) ) ( not ( = ?auto_164327 ?auto_164331 ) ) ( not ( = ?auto_164327 ?auto_164332 ) ) ( not ( = ?auto_164328 ?auto_164329 ) ) ( not ( = ?auto_164328 ?auto_164330 ) ) ( not ( = ?auto_164328 ?auto_164331 ) ) ( not ( = ?auto_164328 ?auto_164332 ) ) ( not ( = ?auto_164329 ?auto_164330 ) ) ( not ( = ?auto_164329 ?auto_164331 ) ) ( not ( = ?auto_164329 ?auto_164332 ) ) ( not ( = ?auto_164330 ?auto_164331 ) ) ( not ( = ?auto_164330 ?auto_164332 ) ) ( not ( = ?auto_164331 ?auto_164332 ) ) ( not ( = ?auto_164327 ?auto_164333 ) ) ( not ( = ?auto_164327 ?auto_164334 ) ) ( not ( = ?auto_164328 ?auto_164333 ) ) ( not ( = ?auto_164328 ?auto_164334 ) ) ( not ( = ?auto_164329 ?auto_164333 ) ) ( not ( = ?auto_164329 ?auto_164334 ) ) ( not ( = ?auto_164330 ?auto_164333 ) ) ( not ( = ?auto_164330 ?auto_164334 ) ) ( not ( = ?auto_164331 ?auto_164333 ) ) ( not ( = ?auto_164331 ?auto_164334 ) ) ( not ( = ?auto_164332 ?auto_164333 ) ) ( not ( = ?auto_164332 ?auto_164334 ) ) ( not ( = ?auto_164333 ?auto_164334 ) ) ( ON ?auto_164334 ?auto_164335 ) ( not ( = ?auto_164327 ?auto_164335 ) ) ( not ( = ?auto_164328 ?auto_164335 ) ) ( not ( = ?auto_164329 ?auto_164335 ) ) ( not ( = ?auto_164330 ?auto_164335 ) ) ( not ( = ?auto_164331 ?auto_164335 ) ) ( not ( = ?auto_164332 ?auto_164335 ) ) ( not ( = ?auto_164333 ?auto_164335 ) ) ( not ( = ?auto_164334 ?auto_164335 ) ) ( ON ?auto_164333 ?auto_164334 ) ( ON-TABLE ?auto_164335 ) ( ON ?auto_164332 ?auto_164333 ) ( ON ?auto_164331 ?auto_164332 ) ( ON ?auto_164330 ?auto_164331 ) ( CLEAR ?auto_164328 ) ( ON ?auto_164329 ?auto_164330 ) ( CLEAR ?auto_164329 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_164335 ?auto_164334 ?auto_164333 ?auto_164332 ?auto_164331 ?auto_164330 )
      ( MAKE-5PILE ?auto_164327 ?auto_164328 ?auto_164329 ?auto_164330 ?auto_164331 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_164336 - BLOCK
      ?auto_164337 - BLOCK
      ?auto_164338 - BLOCK
      ?auto_164339 - BLOCK
      ?auto_164340 - BLOCK
    )
    :vars
    (
      ?auto_164341 - BLOCK
      ?auto_164342 - BLOCK
      ?auto_164343 - BLOCK
      ?auto_164344 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_164336 ) ( not ( = ?auto_164336 ?auto_164337 ) ) ( not ( = ?auto_164336 ?auto_164338 ) ) ( not ( = ?auto_164336 ?auto_164339 ) ) ( not ( = ?auto_164336 ?auto_164340 ) ) ( not ( = ?auto_164336 ?auto_164341 ) ) ( not ( = ?auto_164337 ?auto_164338 ) ) ( not ( = ?auto_164337 ?auto_164339 ) ) ( not ( = ?auto_164337 ?auto_164340 ) ) ( not ( = ?auto_164337 ?auto_164341 ) ) ( not ( = ?auto_164338 ?auto_164339 ) ) ( not ( = ?auto_164338 ?auto_164340 ) ) ( not ( = ?auto_164338 ?auto_164341 ) ) ( not ( = ?auto_164339 ?auto_164340 ) ) ( not ( = ?auto_164339 ?auto_164341 ) ) ( not ( = ?auto_164340 ?auto_164341 ) ) ( not ( = ?auto_164336 ?auto_164342 ) ) ( not ( = ?auto_164336 ?auto_164343 ) ) ( not ( = ?auto_164337 ?auto_164342 ) ) ( not ( = ?auto_164337 ?auto_164343 ) ) ( not ( = ?auto_164338 ?auto_164342 ) ) ( not ( = ?auto_164338 ?auto_164343 ) ) ( not ( = ?auto_164339 ?auto_164342 ) ) ( not ( = ?auto_164339 ?auto_164343 ) ) ( not ( = ?auto_164340 ?auto_164342 ) ) ( not ( = ?auto_164340 ?auto_164343 ) ) ( not ( = ?auto_164341 ?auto_164342 ) ) ( not ( = ?auto_164341 ?auto_164343 ) ) ( not ( = ?auto_164342 ?auto_164343 ) ) ( ON ?auto_164343 ?auto_164344 ) ( not ( = ?auto_164336 ?auto_164344 ) ) ( not ( = ?auto_164337 ?auto_164344 ) ) ( not ( = ?auto_164338 ?auto_164344 ) ) ( not ( = ?auto_164339 ?auto_164344 ) ) ( not ( = ?auto_164340 ?auto_164344 ) ) ( not ( = ?auto_164341 ?auto_164344 ) ) ( not ( = ?auto_164342 ?auto_164344 ) ) ( not ( = ?auto_164343 ?auto_164344 ) ) ( ON ?auto_164342 ?auto_164343 ) ( ON-TABLE ?auto_164344 ) ( ON ?auto_164341 ?auto_164342 ) ( ON ?auto_164340 ?auto_164341 ) ( ON ?auto_164339 ?auto_164340 ) ( ON ?auto_164338 ?auto_164339 ) ( CLEAR ?auto_164338 ) ( HOLDING ?auto_164337 ) ( CLEAR ?auto_164336 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_164336 ?auto_164337 )
      ( MAKE-5PILE ?auto_164336 ?auto_164337 ?auto_164338 ?auto_164339 ?auto_164340 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_164345 - BLOCK
      ?auto_164346 - BLOCK
      ?auto_164347 - BLOCK
      ?auto_164348 - BLOCK
      ?auto_164349 - BLOCK
    )
    :vars
    (
      ?auto_164350 - BLOCK
      ?auto_164352 - BLOCK
      ?auto_164351 - BLOCK
      ?auto_164353 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_164345 ) ( not ( = ?auto_164345 ?auto_164346 ) ) ( not ( = ?auto_164345 ?auto_164347 ) ) ( not ( = ?auto_164345 ?auto_164348 ) ) ( not ( = ?auto_164345 ?auto_164349 ) ) ( not ( = ?auto_164345 ?auto_164350 ) ) ( not ( = ?auto_164346 ?auto_164347 ) ) ( not ( = ?auto_164346 ?auto_164348 ) ) ( not ( = ?auto_164346 ?auto_164349 ) ) ( not ( = ?auto_164346 ?auto_164350 ) ) ( not ( = ?auto_164347 ?auto_164348 ) ) ( not ( = ?auto_164347 ?auto_164349 ) ) ( not ( = ?auto_164347 ?auto_164350 ) ) ( not ( = ?auto_164348 ?auto_164349 ) ) ( not ( = ?auto_164348 ?auto_164350 ) ) ( not ( = ?auto_164349 ?auto_164350 ) ) ( not ( = ?auto_164345 ?auto_164352 ) ) ( not ( = ?auto_164345 ?auto_164351 ) ) ( not ( = ?auto_164346 ?auto_164352 ) ) ( not ( = ?auto_164346 ?auto_164351 ) ) ( not ( = ?auto_164347 ?auto_164352 ) ) ( not ( = ?auto_164347 ?auto_164351 ) ) ( not ( = ?auto_164348 ?auto_164352 ) ) ( not ( = ?auto_164348 ?auto_164351 ) ) ( not ( = ?auto_164349 ?auto_164352 ) ) ( not ( = ?auto_164349 ?auto_164351 ) ) ( not ( = ?auto_164350 ?auto_164352 ) ) ( not ( = ?auto_164350 ?auto_164351 ) ) ( not ( = ?auto_164352 ?auto_164351 ) ) ( ON ?auto_164351 ?auto_164353 ) ( not ( = ?auto_164345 ?auto_164353 ) ) ( not ( = ?auto_164346 ?auto_164353 ) ) ( not ( = ?auto_164347 ?auto_164353 ) ) ( not ( = ?auto_164348 ?auto_164353 ) ) ( not ( = ?auto_164349 ?auto_164353 ) ) ( not ( = ?auto_164350 ?auto_164353 ) ) ( not ( = ?auto_164352 ?auto_164353 ) ) ( not ( = ?auto_164351 ?auto_164353 ) ) ( ON ?auto_164352 ?auto_164351 ) ( ON-TABLE ?auto_164353 ) ( ON ?auto_164350 ?auto_164352 ) ( ON ?auto_164349 ?auto_164350 ) ( ON ?auto_164348 ?auto_164349 ) ( ON ?auto_164347 ?auto_164348 ) ( CLEAR ?auto_164345 ) ( ON ?auto_164346 ?auto_164347 ) ( CLEAR ?auto_164346 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_164353 ?auto_164351 ?auto_164352 ?auto_164350 ?auto_164349 ?auto_164348 ?auto_164347 )
      ( MAKE-5PILE ?auto_164345 ?auto_164346 ?auto_164347 ?auto_164348 ?auto_164349 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_164354 - BLOCK
      ?auto_164355 - BLOCK
      ?auto_164356 - BLOCK
      ?auto_164357 - BLOCK
      ?auto_164358 - BLOCK
    )
    :vars
    (
      ?auto_164360 - BLOCK
      ?auto_164362 - BLOCK
      ?auto_164361 - BLOCK
      ?auto_164359 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_164354 ?auto_164355 ) ) ( not ( = ?auto_164354 ?auto_164356 ) ) ( not ( = ?auto_164354 ?auto_164357 ) ) ( not ( = ?auto_164354 ?auto_164358 ) ) ( not ( = ?auto_164354 ?auto_164360 ) ) ( not ( = ?auto_164355 ?auto_164356 ) ) ( not ( = ?auto_164355 ?auto_164357 ) ) ( not ( = ?auto_164355 ?auto_164358 ) ) ( not ( = ?auto_164355 ?auto_164360 ) ) ( not ( = ?auto_164356 ?auto_164357 ) ) ( not ( = ?auto_164356 ?auto_164358 ) ) ( not ( = ?auto_164356 ?auto_164360 ) ) ( not ( = ?auto_164357 ?auto_164358 ) ) ( not ( = ?auto_164357 ?auto_164360 ) ) ( not ( = ?auto_164358 ?auto_164360 ) ) ( not ( = ?auto_164354 ?auto_164362 ) ) ( not ( = ?auto_164354 ?auto_164361 ) ) ( not ( = ?auto_164355 ?auto_164362 ) ) ( not ( = ?auto_164355 ?auto_164361 ) ) ( not ( = ?auto_164356 ?auto_164362 ) ) ( not ( = ?auto_164356 ?auto_164361 ) ) ( not ( = ?auto_164357 ?auto_164362 ) ) ( not ( = ?auto_164357 ?auto_164361 ) ) ( not ( = ?auto_164358 ?auto_164362 ) ) ( not ( = ?auto_164358 ?auto_164361 ) ) ( not ( = ?auto_164360 ?auto_164362 ) ) ( not ( = ?auto_164360 ?auto_164361 ) ) ( not ( = ?auto_164362 ?auto_164361 ) ) ( ON ?auto_164361 ?auto_164359 ) ( not ( = ?auto_164354 ?auto_164359 ) ) ( not ( = ?auto_164355 ?auto_164359 ) ) ( not ( = ?auto_164356 ?auto_164359 ) ) ( not ( = ?auto_164357 ?auto_164359 ) ) ( not ( = ?auto_164358 ?auto_164359 ) ) ( not ( = ?auto_164360 ?auto_164359 ) ) ( not ( = ?auto_164362 ?auto_164359 ) ) ( not ( = ?auto_164361 ?auto_164359 ) ) ( ON ?auto_164362 ?auto_164361 ) ( ON-TABLE ?auto_164359 ) ( ON ?auto_164360 ?auto_164362 ) ( ON ?auto_164358 ?auto_164360 ) ( ON ?auto_164357 ?auto_164358 ) ( ON ?auto_164356 ?auto_164357 ) ( ON ?auto_164355 ?auto_164356 ) ( CLEAR ?auto_164355 ) ( HOLDING ?auto_164354 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_164354 )
      ( MAKE-5PILE ?auto_164354 ?auto_164355 ?auto_164356 ?auto_164357 ?auto_164358 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_164363 - BLOCK
      ?auto_164364 - BLOCK
      ?auto_164365 - BLOCK
      ?auto_164366 - BLOCK
      ?auto_164367 - BLOCK
    )
    :vars
    (
      ?auto_164371 - BLOCK
      ?auto_164368 - BLOCK
      ?auto_164370 - BLOCK
      ?auto_164369 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_164363 ?auto_164364 ) ) ( not ( = ?auto_164363 ?auto_164365 ) ) ( not ( = ?auto_164363 ?auto_164366 ) ) ( not ( = ?auto_164363 ?auto_164367 ) ) ( not ( = ?auto_164363 ?auto_164371 ) ) ( not ( = ?auto_164364 ?auto_164365 ) ) ( not ( = ?auto_164364 ?auto_164366 ) ) ( not ( = ?auto_164364 ?auto_164367 ) ) ( not ( = ?auto_164364 ?auto_164371 ) ) ( not ( = ?auto_164365 ?auto_164366 ) ) ( not ( = ?auto_164365 ?auto_164367 ) ) ( not ( = ?auto_164365 ?auto_164371 ) ) ( not ( = ?auto_164366 ?auto_164367 ) ) ( not ( = ?auto_164366 ?auto_164371 ) ) ( not ( = ?auto_164367 ?auto_164371 ) ) ( not ( = ?auto_164363 ?auto_164368 ) ) ( not ( = ?auto_164363 ?auto_164370 ) ) ( not ( = ?auto_164364 ?auto_164368 ) ) ( not ( = ?auto_164364 ?auto_164370 ) ) ( not ( = ?auto_164365 ?auto_164368 ) ) ( not ( = ?auto_164365 ?auto_164370 ) ) ( not ( = ?auto_164366 ?auto_164368 ) ) ( not ( = ?auto_164366 ?auto_164370 ) ) ( not ( = ?auto_164367 ?auto_164368 ) ) ( not ( = ?auto_164367 ?auto_164370 ) ) ( not ( = ?auto_164371 ?auto_164368 ) ) ( not ( = ?auto_164371 ?auto_164370 ) ) ( not ( = ?auto_164368 ?auto_164370 ) ) ( ON ?auto_164370 ?auto_164369 ) ( not ( = ?auto_164363 ?auto_164369 ) ) ( not ( = ?auto_164364 ?auto_164369 ) ) ( not ( = ?auto_164365 ?auto_164369 ) ) ( not ( = ?auto_164366 ?auto_164369 ) ) ( not ( = ?auto_164367 ?auto_164369 ) ) ( not ( = ?auto_164371 ?auto_164369 ) ) ( not ( = ?auto_164368 ?auto_164369 ) ) ( not ( = ?auto_164370 ?auto_164369 ) ) ( ON ?auto_164368 ?auto_164370 ) ( ON-TABLE ?auto_164369 ) ( ON ?auto_164371 ?auto_164368 ) ( ON ?auto_164367 ?auto_164371 ) ( ON ?auto_164366 ?auto_164367 ) ( ON ?auto_164365 ?auto_164366 ) ( ON ?auto_164364 ?auto_164365 ) ( ON ?auto_164363 ?auto_164364 ) ( CLEAR ?auto_164363 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_164369 ?auto_164370 ?auto_164368 ?auto_164371 ?auto_164367 ?auto_164366 ?auto_164365 ?auto_164364 )
      ( MAKE-5PILE ?auto_164363 ?auto_164364 ?auto_164365 ?auto_164366 ?auto_164367 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_164375 - BLOCK
      ?auto_164376 - BLOCK
      ?auto_164377 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_164377 ) ( CLEAR ?auto_164376 ) ( ON-TABLE ?auto_164375 ) ( ON ?auto_164376 ?auto_164375 ) ( not ( = ?auto_164375 ?auto_164376 ) ) ( not ( = ?auto_164375 ?auto_164377 ) ) ( not ( = ?auto_164376 ?auto_164377 ) ) )
    :subtasks
    ( ( !STACK ?auto_164377 ?auto_164376 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_164378 - BLOCK
      ?auto_164379 - BLOCK
      ?auto_164380 - BLOCK
    )
    :vars
    (
      ?auto_164381 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_164379 ) ( ON-TABLE ?auto_164378 ) ( ON ?auto_164379 ?auto_164378 ) ( not ( = ?auto_164378 ?auto_164379 ) ) ( not ( = ?auto_164378 ?auto_164380 ) ) ( not ( = ?auto_164379 ?auto_164380 ) ) ( ON ?auto_164380 ?auto_164381 ) ( CLEAR ?auto_164380 ) ( HAND-EMPTY ) ( not ( = ?auto_164378 ?auto_164381 ) ) ( not ( = ?auto_164379 ?auto_164381 ) ) ( not ( = ?auto_164380 ?auto_164381 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_164380 ?auto_164381 )
      ( MAKE-3PILE ?auto_164378 ?auto_164379 ?auto_164380 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_164382 - BLOCK
      ?auto_164383 - BLOCK
      ?auto_164384 - BLOCK
    )
    :vars
    (
      ?auto_164385 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_164382 ) ( not ( = ?auto_164382 ?auto_164383 ) ) ( not ( = ?auto_164382 ?auto_164384 ) ) ( not ( = ?auto_164383 ?auto_164384 ) ) ( ON ?auto_164384 ?auto_164385 ) ( CLEAR ?auto_164384 ) ( not ( = ?auto_164382 ?auto_164385 ) ) ( not ( = ?auto_164383 ?auto_164385 ) ) ( not ( = ?auto_164384 ?auto_164385 ) ) ( HOLDING ?auto_164383 ) ( CLEAR ?auto_164382 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_164382 ?auto_164383 )
      ( MAKE-3PILE ?auto_164382 ?auto_164383 ?auto_164384 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_164386 - BLOCK
      ?auto_164387 - BLOCK
      ?auto_164388 - BLOCK
    )
    :vars
    (
      ?auto_164389 - BLOCK
      ?auto_164391 - BLOCK
      ?auto_164390 - BLOCK
      ?auto_164392 - BLOCK
      ?auto_164393 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_164386 ) ( not ( = ?auto_164386 ?auto_164387 ) ) ( not ( = ?auto_164386 ?auto_164388 ) ) ( not ( = ?auto_164387 ?auto_164388 ) ) ( ON ?auto_164388 ?auto_164389 ) ( not ( = ?auto_164386 ?auto_164389 ) ) ( not ( = ?auto_164387 ?auto_164389 ) ) ( not ( = ?auto_164388 ?auto_164389 ) ) ( CLEAR ?auto_164386 ) ( ON ?auto_164387 ?auto_164388 ) ( CLEAR ?auto_164387 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_164391 ) ( ON ?auto_164390 ?auto_164391 ) ( ON ?auto_164392 ?auto_164390 ) ( ON ?auto_164393 ?auto_164392 ) ( ON ?auto_164389 ?auto_164393 ) ( not ( = ?auto_164391 ?auto_164390 ) ) ( not ( = ?auto_164391 ?auto_164392 ) ) ( not ( = ?auto_164391 ?auto_164393 ) ) ( not ( = ?auto_164391 ?auto_164389 ) ) ( not ( = ?auto_164391 ?auto_164388 ) ) ( not ( = ?auto_164391 ?auto_164387 ) ) ( not ( = ?auto_164390 ?auto_164392 ) ) ( not ( = ?auto_164390 ?auto_164393 ) ) ( not ( = ?auto_164390 ?auto_164389 ) ) ( not ( = ?auto_164390 ?auto_164388 ) ) ( not ( = ?auto_164390 ?auto_164387 ) ) ( not ( = ?auto_164392 ?auto_164393 ) ) ( not ( = ?auto_164392 ?auto_164389 ) ) ( not ( = ?auto_164392 ?auto_164388 ) ) ( not ( = ?auto_164392 ?auto_164387 ) ) ( not ( = ?auto_164393 ?auto_164389 ) ) ( not ( = ?auto_164393 ?auto_164388 ) ) ( not ( = ?auto_164393 ?auto_164387 ) ) ( not ( = ?auto_164386 ?auto_164391 ) ) ( not ( = ?auto_164386 ?auto_164390 ) ) ( not ( = ?auto_164386 ?auto_164392 ) ) ( not ( = ?auto_164386 ?auto_164393 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_164391 ?auto_164390 ?auto_164392 ?auto_164393 ?auto_164389 ?auto_164388 )
      ( MAKE-3PILE ?auto_164386 ?auto_164387 ?auto_164388 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_164394 - BLOCK
      ?auto_164395 - BLOCK
      ?auto_164396 - BLOCK
    )
    :vars
    (
      ?auto_164397 - BLOCK
      ?auto_164399 - BLOCK
      ?auto_164398 - BLOCK
      ?auto_164400 - BLOCK
      ?auto_164401 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_164394 ?auto_164395 ) ) ( not ( = ?auto_164394 ?auto_164396 ) ) ( not ( = ?auto_164395 ?auto_164396 ) ) ( ON ?auto_164396 ?auto_164397 ) ( not ( = ?auto_164394 ?auto_164397 ) ) ( not ( = ?auto_164395 ?auto_164397 ) ) ( not ( = ?auto_164396 ?auto_164397 ) ) ( ON ?auto_164395 ?auto_164396 ) ( CLEAR ?auto_164395 ) ( ON-TABLE ?auto_164399 ) ( ON ?auto_164398 ?auto_164399 ) ( ON ?auto_164400 ?auto_164398 ) ( ON ?auto_164401 ?auto_164400 ) ( ON ?auto_164397 ?auto_164401 ) ( not ( = ?auto_164399 ?auto_164398 ) ) ( not ( = ?auto_164399 ?auto_164400 ) ) ( not ( = ?auto_164399 ?auto_164401 ) ) ( not ( = ?auto_164399 ?auto_164397 ) ) ( not ( = ?auto_164399 ?auto_164396 ) ) ( not ( = ?auto_164399 ?auto_164395 ) ) ( not ( = ?auto_164398 ?auto_164400 ) ) ( not ( = ?auto_164398 ?auto_164401 ) ) ( not ( = ?auto_164398 ?auto_164397 ) ) ( not ( = ?auto_164398 ?auto_164396 ) ) ( not ( = ?auto_164398 ?auto_164395 ) ) ( not ( = ?auto_164400 ?auto_164401 ) ) ( not ( = ?auto_164400 ?auto_164397 ) ) ( not ( = ?auto_164400 ?auto_164396 ) ) ( not ( = ?auto_164400 ?auto_164395 ) ) ( not ( = ?auto_164401 ?auto_164397 ) ) ( not ( = ?auto_164401 ?auto_164396 ) ) ( not ( = ?auto_164401 ?auto_164395 ) ) ( not ( = ?auto_164394 ?auto_164399 ) ) ( not ( = ?auto_164394 ?auto_164398 ) ) ( not ( = ?auto_164394 ?auto_164400 ) ) ( not ( = ?auto_164394 ?auto_164401 ) ) ( HOLDING ?auto_164394 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_164394 )
      ( MAKE-3PILE ?auto_164394 ?auto_164395 ?auto_164396 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_164402 - BLOCK
      ?auto_164403 - BLOCK
      ?auto_164404 - BLOCK
    )
    :vars
    (
      ?auto_164406 - BLOCK
      ?auto_164407 - BLOCK
      ?auto_164409 - BLOCK
      ?auto_164408 - BLOCK
      ?auto_164405 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_164402 ?auto_164403 ) ) ( not ( = ?auto_164402 ?auto_164404 ) ) ( not ( = ?auto_164403 ?auto_164404 ) ) ( ON ?auto_164404 ?auto_164406 ) ( not ( = ?auto_164402 ?auto_164406 ) ) ( not ( = ?auto_164403 ?auto_164406 ) ) ( not ( = ?auto_164404 ?auto_164406 ) ) ( ON ?auto_164403 ?auto_164404 ) ( ON-TABLE ?auto_164407 ) ( ON ?auto_164409 ?auto_164407 ) ( ON ?auto_164408 ?auto_164409 ) ( ON ?auto_164405 ?auto_164408 ) ( ON ?auto_164406 ?auto_164405 ) ( not ( = ?auto_164407 ?auto_164409 ) ) ( not ( = ?auto_164407 ?auto_164408 ) ) ( not ( = ?auto_164407 ?auto_164405 ) ) ( not ( = ?auto_164407 ?auto_164406 ) ) ( not ( = ?auto_164407 ?auto_164404 ) ) ( not ( = ?auto_164407 ?auto_164403 ) ) ( not ( = ?auto_164409 ?auto_164408 ) ) ( not ( = ?auto_164409 ?auto_164405 ) ) ( not ( = ?auto_164409 ?auto_164406 ) ) ( not ( = ?auto_164409 ?auto_164404 ) ) ( not ( = ?auto_164409 ?auto_164403 ) ) ( not ( = ?auto_164408 ?auto_164405 ) ) ( not ( = ?auto_164408 ?auto_164406 ) ) ( not ( = ?auto_164408 ?auto_164404 ) ) ( not ( = ?auto_164408 ?auto_164403 ) ) ( not ( = ?auto_164405 ?auto_164406 ) ) ( not ( = ?auto_164405 ?auto_164404 ) ) ( not ( = ?auto_164405 ?auto_164403 ) ) ( not ( = ?auto_164402 ?auto_164407 ) ) ( not ( = ?auto_164402 ?auto_164409 ) ) ( not ( = ?auto_164402 ?auto_164408 ) ) ( not ( = ?auto_164402 ?auto_164405 ) ) ( ON ?auto_164402 ?auto_164403 ) ( CLEAR ?auto_164402 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_164407 ?auto_164409 ?auto_164408 ?auto_164405 ?auto_164406 ?auto_164404 ?auto_164403 )
      ( MAKE-3PILE ?auto_164402 ?auto_164403 ?auto_164404 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_164410 - BLOCK
      ?auto_164411 - BLOCK
      ?auto_164412 - BLOCK
    )
    :vars
    (
      ?auto_164416 - BLOCK
      ?auto_164417 - BLOCK
      ?auto_164415 - BLOCK
      ?auto_164413 - BLOCK
      ?auto_164414 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_164410 ?auto_164411 ) ) ( not ( = ?auto_164410 ?auto_164412 ) ) ( not ( = ?auto_164411 ?auto_164412 ) ) ( ON ?auto_164412 ?auto_164416 ) ( not ( = ?auto_164410 ?auto_164416 ) ) ( not ( = ?auto_164411 ?auto_164416 ) ) ( not ( = ?auto_164412 ?auto_164416 ) ) ( ON ?auto_164411 ?auto_164412 ) ( ON-TABLE ?auto_164417 ) ( ON ?auto_164415 ?auto_164417 ) ( ON ?auto_164413 ?auto_164415 ) ( ON ?auto_164414 ?auto_164413 ) ( ON ?auto_164416 ?auto_164414 ) ( not ( = ?auto_164417 ?auto_164415 ) ) ( not ( = ?auto_164417 ?auto_164413 ) ) ( not ( = ?auto_164417 ?auto_164414 ) ) ( not ( = ?auto_164417 ?auto_164416 ) ) ( not ( = ?auto_164417 ?auto_164412 ) ) ( not ( = ?auto_164417 ?auto_164411 ) ) ( not ( = ?auto_164415 ?auto_164413 ) ) ( not ( = ?auto_164415 ?auto_164414 ) ) ( not ( = ?auto_164415 ?auto_164416 ) ) ( not ( = ?auto_164415 ?auto_164412 ) ) ( not ( = ?auto_164415 ?auto_164411 ) ) ( not ( = ?auto_164413 ?auto_164414 ) ) ( not ( = ?auto_164413 ?auto_164416 ) ) ( not ( = ?auto_164413 ?auto_164412 ) ) ( not ( = ?auto_164413 ?auto_164411 ) ) ( not ( = ?auto_164414 ?auto_164416 ) ) ( not ( = ?auto_164414 ?auto_164412 ) ) ( not ( = ?auto_164414 ?auto_164411 ) ) ( not ( = ?auto_164410 ?auto_164417 ) ) ( not ( = ?auto_164410 ?auto_164415 ) ) ( not ( = ?auto_164410 ?auto_164413 ) ) ( not ( = ?auto_164410 ?auto_164414 ) ) ( HOLDING ?auto_164410 ) ( CLEAR ?auto_164411 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_164417 ?auto_164415 ?auto_164413 ?auto_164414 ?auto_164416 ?auto_164412 ?auto_164411 ?auto_164410 )
      ( MAKE-3PILE ?auto_164410 ?auto_164411 ?auto_164412 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_164418 - BLOCK
      ?auto_164419 - BLOCK
      ?auto_164420 - BLOCK
    )
    :vars
    (
      ?auto_164422 - BLOCK
      ?auto_164421 - BLOCK
      ?auto_164423 - BLOCK
      ?auto_164425 - BLOCK
      ?auto_164424 - BLOCK
      ?auto_164426 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_164418 ?auto_164419 ) ) ( not ( = ?auto_164418 ?auto_164420 ) ) ( not ( = ?auto_164419 ?auto_164420 ) ) ( ON ?auto_164420 ?auto_164422 ) ( not ( = ?auto_164418 ?auto_164422 ) ) ( not ( = ?auto_164419 ?auto_164422 ) ) ( not ( = ?auto_164420 ?auto_164422 ) ) ( ON ?auto_164419 ?auto_164420 ) ( ON-TABLE ?auto_164421 ) ( ON ?auto_164423 ?auto_164421 ) ( ON ?auto_164425 ?auto_164423 ) ( ON ?auto_164424 ?auto_164425 ) ( ON ?auto_164422 ?auto_164424 ) ( not ( = ?auto_164421 ?auto_164423 ) ) ( not ( = ?auto_164421 ?auto_164425 ) ) ( not ( = ?auto_164421 ?auto_164424 ) ) ( not ( = ?auto_164421 ?auto_164422 ) ) ( not ( = ?auto_164421 ?auto_164420 ) ) ( not ( = ?auto_164421 ?auto_164419 ) ) ( not ( = ?auto_164423 ?auto_164425 ) ) ( not ( = ?auto_164423 ?auto_164424 ) ) ( not ( = ?auto_164423 ?auto_164422 ) ) ( not ( = ?auto_164423 ?auto_164420 ) ) ( not ( = ?auto_164423 ?auto_164419 ) ) ( not ( = ?auto_164425 ?auto_164424 ) ) ( not ( = ?auto_164425 ?auto_164422 ) ) ( not ( = ?auto_164425 ?auto_164420 ) ) ( not ( = ?auto_164425 ?auto_164419 ) ) ( not ( = ?auto_164424 ?auto_164422 ) ) ( not ( = ?auto_164424 ?auto_164420 ) ) ( not ( = ?auto_164424 ?auto_164419 ) ) ( not ( = ?auto_164418 ?auto_164421 ) ) ( not ( = ?auto_164418 ?auto_164423 ) ) ( not ( = ?auto_164418 ?auto_164425 ) ) ( not ( = ?auto_164418 ?auto_164424 ) ) ( CLEAR ?auto_164419 ) ( ON ?auto_164418 ?auto_164426 ) ( CLEAR ?auto_164418 ) ( HAND-EMPTY ) ( not ( = ?auto_164418 ?auto_164426 ) ) ( not ( = ?auto_164419 ?auto_164426 ) ) ( not ( = ?auto_164420 ?auto_164426 ) ) ( not ( = ?auto_164422 ?auto_164426 ) ) ( not ( = ?auto_164421 ?auto_164426 ) ) ( not ( = ?auto_164423 ?auto_164426 ) ) ( not ( = ?auto_164425 ?auto_164426 ) ) ( not ( = ?auto_164424 ?auto_164426 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_164418 ?auto_164426 )
      ( MAKE-3PILE ?auto_164418 ?auto_164419 ?auto_164420 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_164427 - BLOCK
      ?auto_164428 - BLOCK
      ?auto_164429 - BLOCK
    )
    :vars
    (
      ?auto_164435 - BLOCK
      ?auto_164431 - BLOCK
      ?auto_164433 - BLOCK
      ?auto_164430 - BLOCK
      ?auto_164434 - BLOCK
      ?auto_164432 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_164427 ?auto_164428 ) ) ( not ( = ?auto_164427 ?auto_164429 ) ) ( not ( = ?auto_164428 ?auto_164429 ) ) ( ON ?auto_164429 ?auto_164435 ) ( not ( = ?auto_164427 ?auto_164435 ) ) ( not ( = ?auto_164428 ?auto_164435 ) ) ( not ( = ?auto_164429 ?auto_164435 ) ) ( ON-TABLE ?auto_164431 ) ( ON ?auto_164433 ?auto_164431 ) ( ON ?auto_164430 ?auto_164433 ) ( ON ?auto_164434 ?auto_164430 ) ( ON ?auto_164435 ?auto_164434 ) ( not ( = ?auto_164431 ?auto_164433 ) ) ( not ( = ?auto_164431 ?auto_164430 ) ) ( not ( = ?auto_164431 ?auto_164434 ) ) ( not ( = ?auto_164431 ?auto_164435 ) ) ( not ( = ?auto_164431 ?auto_164429 ) ) ( not ( = ?auto_164431 ?auto_164428 ) ) ( not ( = ?auto_164433 ?auto_164430 ) ) ( not ( = ?auto_164433 ?auto_164434 ) ) ( not ( = ?auto_164433 ?auto_164435 ) ) ( not ( = ?auto_164433 ?auto_164429 ) ) ( not ( = ?auto_164433 ?auto_164428 ) ) ( not ( = ?auto_164430 ?auto_164434 ) ) ( not ( = ?auto_164430 ?auto_164435 ) ) ( not ( = ?auto_164430 ?auto_164429 ) ) ( not ( = ?auto_164430 ?auto_164428 ) ) ( not ( = ?auto_164434 ?auto_164435 ) ) ( not ( = ?auto_164434 ?auto_164429 ) ) ( not ( = ?auto_164434 ?auto_164428 ) ) ( not ( = ?auto_164427 ?auto_164431 ) ) ( not ( = ?auto_164427 ?auto_164433 ) ) ( not ( = ?auto_164427 ?auto_164430 ) ) ( not ( = ?auto_164427 ?auto_164434 ) ) ( ON ?auto_164427 ?auto_164432 ) ( CLEAR ?auto_164427 ) ( not ( = ?auto_164427 ?auto_164432 ) ) ( not ( = ?auto_164428 ?auto_164432 ) ) ( not ( = ?auto_164429 ?auto_164432 ) ) ( not ( = ?auto_164435 ?auto_164432 ) ) ( not ( = ?auto_164431 ?auto_164432 ) ) ( not ( = ?auto_164433 ?auto_164432 ) ) ( not ( = ?auto_164430 ?auto_164432 ) ) ( not ( = ?auto_164434 ?auto_164432 ) ) ( HOLDING ?auto_164428 ) ( CLEAR ?auto_164429 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_164431 ?auto_164433 ?auto_164430 ?auto_164434 ?auto_164435 ?auto_164429 ?auto_164428 )
      ( MAKE-3PILE ?auto_164427 ?auto_164428 ?auto_164429 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_164436 - BLOCK
      ?auto_164437 - BLOCK
      ?auto_164438 - BLOCK
    )
    :vars
    (
      ?auto_164440 - BLOCK
      ?auto_164443 - BLOCK
      ?auto_164442 - BLOCK
      ?auto_164441 - BLOCK
      ?auto_164439 - BLOCK
      ?auto_164444 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_164436 ?auto_164437 ) ) ( not ( = ?auto_164436 ?auto_164438 ) ) ( not ( = ?auto_164437 ?auto_164438 ) ) ( ON ?auto_164438 ?auto_164440 ) ( not ( = ?auto_164436 ?auto_164440 ) ) ( not ( = ?auto_164437 ?auto_164440 ) ) ( not ( = ?auto_164438 ?auto_164440 ) ) ( ON-TABLE ?auto_164443 ) ( ON ?auto_164442 ?auto_164443 ) ( ON ?auto_164441 ?auto_164442 ) ( ON ?auto_164439 ?auto_164441 ) ( ON ?auto_164440 ?auto_164439 ) ( not ( = ?auto_164443 ?auto_164442 ) ) ( not ( = ?auto_164443 ?auto_164441 ) ) ( not ( = ?auto_164443 ?auto_164439 ) ) ( not ( = ?auto_164443 ?auto_164440 ) ) ( not ( = ?auto_164443 ?auto_164438 ) ) ( not ( = ?auto_164443 ?auto_164437 ) ) ( not ( = ?auto_164442 ?auto_164441 ) ) ( not ( = ?auto_164442 ?auto_164439 ) ) ( not ( = ?auto_164442 ?auto_164440 ) ) ( not ( = ?auto_164442 ?auto_164438 ) ) ( not ( = ?auto_164442 ?auto_164437 ) ) ( not ( = ?auto_164441 ?auto_164439 ) ) ( not ( = ?auto_164441 ?auto_164440 ) ) ( not ( = ?auto_164441 ?auto_164438 ) ) ( not ( = ?auto_164441 ?auto_164437 ) ) ( not ( = ?auto_164439 ?auto_164440 ) ) ( not ( = ?auto_164439 ?auto_164438 ) ) ( not ( = ?auto_164439 ?auto_164437 ) ) ( not ( = ?auto_164436 ?auto_164443 ) ) ( not ( = ?auto_164436 ?auto_164442 ) ) ( not ( = ?auto_164436 ?auto_164441 ) ) ( not ( = ?auto_164436 ?auto_164439 ) ) ( ON ?auto_164436 ?auto_164444 ) ( not ( = ?auto_164436 ?auto_164444 ) ) ( not ( = ?auto_164437 ?auto_164444 ) ) ( not ( = ?auto_164438 ?auto_164444 ) ) ( not ( = ?auto_164440 ?auto_164444 ) ) ( not ( = ?auto_164443 ?auto_164444 ) ) ( not ( = ?auto_164442 ?auto_164444 ) ) ( not ( = ?auto_164441 ?auto_164444 ) ) ( not ( = ?auto_164439 ?auto_164444 ) ) ( CLEAR ?auto_164438 ) ( ON ?auto_164437 ?auto_164436 ) ( CLEAR ?auto_164437 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_164444 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_164444 ?auto_164436 )
      ( MAKE-3PILE ?auto_164436 ?auto_164437 ?auto_164438 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_164445 - BLOCK
      ?auto_164446 - BLOCK
      ?auto_164447 - BLOCK
    )
    :vars
    (
      ?auto_164452 - BLOCK
      ?auto_164451 - BLOCK
      ?auto_164453 - BLOCK
      ?auto_164449 - BLOCK
      ?auto_164448 - BLOCK
      ?auto_164450 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_164445 ?auto_164446 ) ) ( not ( = ?auto_164445 ?auto_164447 ) ) ( not ( = ?auto_164446 ?auto_164447 ) ) ( not ( = ?auto_164445 ?auto_164452 ) ) ( not ( = ?auto_164446 ?auto_164452 ) ) ( not ( = ?auto_164447 ?auto_164452 ) ) ( ON-TABLE ?auto_164451 ) ( ON ?auto_164453 ?auto_164451 ) ( ON ?auto_164449 ?auto_164453 ) ( ON ?auto_164448 ?auto_164449 ) ( ON ?auto_164452 ?auto_164448 ) ( not ( = ?auto_164451 ?auto_164453 ) ) ( not ( = ?auto_164451 ?auto_164449 ) ) ( not ( = ?auto_164451 ?auto_164448 ) ) ( not ( = ?auto_164451 ?auto_164452 ) ) ( not ( = ?auto_164451 ?auto_164447 ) ) ( not ( = ?auto_164451 ?auto_164446 ) ) ( not ( = ?auto_164453 ?auto_164449 ) ) ( not ( = ?auto_164453 ?auto_164448 ) ) ( not ( = ?auto_164453 ?auto_164452 ) ) ( not ( = ?auto_164453 ?auto_164447 ) ) ( not ( = ?auto_164453 ?auto_164446 ) ) ( not ( = ?auto_164449 ?auto_164448 ) ) ( not ( = ?auto_164449 ?auto_164452 ) ) ( not ( = ?auto_164449 ?auto_164447 ) ) ( not ( = ?auto_164449 ?auto_164446 ) ) ( not ( = ?auto_164448 ?auto_164452 ) ) ( not ( = ?auto_164448 ?auto_164447 ) ) ( not ( = ?auto_164448 ?auto_164446 ) ) ( not ( = ?auto_164445 ?auto_164451 ) ) ( not ( = ?auto_164445 ?auto_164453 ) ) ( not ( = ?auto_164445 ?auto_164449 ) ) ( not ( = ?auto_164445 ?auto_164448 ) ) ( ON ?auto_164445 ?auto_164450 ) ( not ( = ?auto_164445 ?auto_164450 ) ) ( not ( = ?auto_164446 ?auto_164450 ) ) ( not ( = ?auto_164447 ?auto_164450 ) ) ( not ( = ?auto_164452 ?auto_164450 ) ) ( not ( = ?auto_164451 ?auto_164450 ) ) ( not ( = ?auto_164453 ?auto_164450 ) ) ( not ( = ?auto_164449 ?auto_164450 ) ) ( not ( = ?auto_164448 ?auto_164450 ) ) ( ON ?auto_164446 ?auto_164445 ) ( CLEAR ?auto_164446 ) ( ON-TABLE ?auto_164450 ) ( HOLDING ?auto_164447 ) ( CLEAR ?auto_164452 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_164451 ?auto_164453 ?auto_164449 ?auto_164448 ?auto_164452 ?auto_164447 )
      ( MAKE-3PILE ?auto_164445 ?auto_164446 ?auto_164447 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_164454 - BLOCK
      ?auto_164455 - BLOCK
      ?auto_164456 - BLOCK
    )
    :vars
    (
      ?auto_164461 - BLOCK
      ?auto_164459 - BLOCK
      ?auto_164462 - BLOCK
      ?auto_164460 - BLOCK
      ?auto_164457 - BLOCK
      ?auto_164458 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_164454 ?auto_164455 ) ) ( not ( = ?auto_164454 ?auto_164456 ) ) ( not ( = ?auto_164455 ?auto_164456 ) ) ( not ( = ?auto_164454 ?auto_164461 ) ) ( not ( = ?auto_164455 ?auto_164461 ) ) ( not ( = ?auto_164456 ?auto_164461 ) ) ( ON-TABLE ?auto_164459 ) ( ON ?auto_164462 ?auto_164459 ) ( ON ?auto_164460 ?auto_164462 ) ( ON ?auto_164457 ?auto_164460 ) ( ON ?auto_164461 ?auto_164457 ) ( not ( = ?auto_164459 ?auto_164462 ) ) ( not ( = ?auto_164459 ?auto_164460 ) ) ( not ( = ?auto_164459 ?auto_164457 ) ) ( not ( = ?auto_164459 ?auto_164461 ) ) ( not ( = ?auto_164459 ?auto_164456 ) ) ( not ( = ?auto_164459 ?auto_164455 ) ) ( not ( = ?auto_164462 ?auto_164460 ) ) ( not ( = ?auto_164462 ?auto_164457 ) ) ( not ( = ?auto_164462 ?auto_164461 ) ) ( not ( = ?auto_164462 ?auto_164456 ) ) ( not ( = ?auto_164462 ?auto_164455 ) ) ( not ( = ?auto_164460 ?auto_164457 ) ) ( not ( = ?auto_164460 ?auto_164461 ) ) ( not ( = ?auto_164460 ?auto_164456 ) ) ( not ( = ?auto_164460 ?auto_164455 ) ) ( not ( = ?auto_164457 ?auto_164461 ) ) ( not ( = ?auto_164457 ?auto_164456 ) ) ( not ( = ?auto_164457 ?auto_164455 ) ) ( not ( = ?auto_164454 ?auto_164459 ) ) ( not ( = ?auto_164454 ?auto_164462 ) ) ( not ( = ?auto_164454 ?auto_164460 ) ) ( not ( = ?auto_164454 ?auto_164457 ) ) ( ON ?auto_164454 ?auto_164458 ) ( not ( = ?auto_164454 ?auto_164458 ) ) ( not ( = ?auto_164455 ?auto_164458 ) ) ( not ( = ?auto_164456 ?auto_164458 ) ) ( not ( = ?auto_164461 ?auto_164458 ) ) ( not ( = ?auto_164459 ?auto_164458 ) ) ( not ( = ?auto_164462 ?auto_164458 ) ) ( not ( = ?auto_164460 ?auto_164458 ) ) ( not ( = ?auto_164457 ?auto_164458 ) ) ( ON ?auto_164455 ?auto_164454 ) ( ON-TABLE ?auto_164458 ) ( CLEAR ?auto_164461 ) ( ON ?auto_164456 ?auto_164455 ) ( CLEAR ?auto_164456 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_164458 ?auto_164454 ?auto_164455 )
      ( MAKE-3PILE ?auto_164454 ?auto_164455 ?auto_164456 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_164463 - BLOCK
      ?auto_164464 - BLOCK
      ?auto_164465 - BLOCK
    )
    :vars
    (
      ?auto_164471 - BLOCK
      ?auto_164469 - BLOCK
      ?auto_164467 - BLOCK
      ?auto_164466 - BLOCK
      ?auto_164468 - BLOCK
      ?auto_164470 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_164463 ?auto_164464 ) ) ( not ( = ?auto_164463 ?auto_164465 ) ) ( not ( = ?auto_164464 ?auto_164465 ) ) ( not ( = ?auto_164463 ?auto_164471 ) ) ( not ( = ?auto_164464 ?auto_164471 ) ) ( not ( = ?auto_164465 ?auto_164471 ) ) ( ON-TABLE ?auto_164469 ) ( ON ?auto_164467 ?auto_164469 ) ( ON ?auto_164466 ?auto_164467 ) ( ON ?auto_164468 ?auto_164466 ) ( not ( = ?auto_164469 ?auto_164467 ) ) ( not ( = ?auto_164469 ?auto_164466 ) ) ( not ( = ?auto_164469 ?auto_164468 ) ) ( not ( = ?auto_164469 ?auto_164471 ) ) ( not ( = ?auto_164469 ?auto_164465 ) ) ( not ( = ?auto_164469 ?auto_164464 ) ) ( not ( = ?auto_164467 ?auto_164466 ) ) ( not ( = ?auto_164467 ?auto_164468 ) ) ( not ( = ?auto_164467 ?auto_164471 ) ) ( not ( = ?auto_164467 ?auto_164465 ) ) ( not ( = ?auto_164467 ?auto_164464 ) ) ( not ( = ?auto_164466 ?auto_164468 ) ) ( not ( = ?auto_164466 ?auto_164471 ) ) ( not ( = ?auto_164466 ?auto_164465 ) ) ( not ( = ?auto_164466 ?auto_164464 ) ) ( not ( = ?auto_164468 ?auto_164471 ) ) ( not ( = ?auto_164468 ?auto_164465 ) ) ( not ( = ?auto_164468 ?auto_164464 ) ) ( not ( = ?auto_164463 ?auto_164469 ) ) ( not ( = ?auto_164463 ?auto_164467 ) ) ( not ( = ?auto_164463 ?auto_164466 ) ) ( not ( = ?auto_164463 ?auto_164468 ) ) ( ON ?auto_164463 ?auto_164470 ) ( not ( = ?auto_164463 ?auto_164470 ) ) ( not ( = ?auto_164464 ?auto_164470 ) ) ( not ( = ?auto_164465 ?auto_164470 ) ) ( not ( = ?auto_164471 ?auto_164470 ) ) ( not ( = ?auto_164469 ?auto_164470 ) ) ( not ( = ?auto_164467 ?auto_164470 ) ) ( not ( = ?auto_164466 ?auto_164470 ) ) ( not ( = ?auto_164468 ?auto_164470 ) ) ( ON ?auto_164464 ?auto_164463 ) ( ON-TABLE ?auto_164470 ) ( ON ?auto_164465 ?auto_164464 ) ( CLEAR ?auto_164465 ) ( HOLDING ?auto_164471 ) ( CLEAR ?auto_164468 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_164469 ?auto_164467 ?auto_164466 ?auto_164468 ?auto_164471 )
      ( MAKE-3PILE ?auto_164463 ?auto_164464 ?auto_164465 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_164472 - BLOCK
      ?auto_164473 - BLOCK
      ?auto_164474 - BLOCK
    )
    :vars
    (
      ?auto_164477 - BLOCK
      ?auto_164476 - BLOCK
      ?auto_164475 - BLOCK
      ?auto_164478 - BLOCK
      ?auto_164480 - BLOCK
      ?auto_164479 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_164472 ?auto_164473 ) ) ( not ( = ?auto_164472 ?auto_164474 ) ) ( not ( = ?auto_164473 ?auto_164474 ) ) ( not ( = ?auto_164472 ?auto_164477 ) ) ( not ( = ?auto_164473 ?auto_164477 ) ) ( not ( = ?auto_164474 ?auto_164477 ) ) ( ON-TABLE ?auto_164476 ) ( ON ?auto_164475 ?auto_164476 ) ( ON ?auto_164478 ?auto_164475 ) ( ON ?auto_164480 ?auto_164478 ) ( not ( = ?auto_164476 ?auto_164475 ) ) ( not ( = ?auto_164476 ?auto_164478 ) ) ( not ( = ?auto_164476 ?auto_164480 ) ) ( not ( = ?auto_164476 ?auto_164477 ) ) ( not ( = ?auto_164476 ?auto_164474 ) ) ( not ( = ?auto_164476 ?auto_164473 ) ) ( not ( = ?auto_164475 ?auto_164478 ) ) ( not ( = ?auto_164475 ?auto_164480 ) ) ( not ( = ?auto_164475 ?auto_164477 ) ) ( not ( = ?auto_164475 ?auto_164474 ) ) ( not ( = ?auto_164475 ?auto_164473 ) ) ( not ( = ?auto_164478 ?auto_164480 ) ) ( not ( = ?auto_164478 ?auto_164477 ) ) ( not ( = ?auto_164478 ?auto_164474 ) ) ( not ( = ?auto_164478 ?auto_164473 ) ) ( not ( = ?auto_164480 ?auto_164477 ) ) ( not ( = ?auto_164480 ?auto_164474 ) ) ( not ( = ?auto_164480 ?auto_164473 ) ) ( not ( = ?auto_164472 ?auto_164476 ) ) ( not ( = ?auto_164472 ?auto_164475 ) ) ( not ( = ?auto_164472 ?auto_164478 ) ) ( not ( = ?auto_164472 ?auto_164480 ) ) ( ON ?auto_164472 ?auto_164479 ) ( not ( = ?auto_164472 ?auto_164479 ) ) ( not ( = ?auto_164473 ?auto_164479 ) ) ( not ( = ?auto_164474 ?auto_164479 ) ) ( not ( = ?auto_164477 ?auto_164479 ) ) ( not ( = ?auto_164476 ?auto_164479 ) ) ( not ( = ?auto_164475 ?auto_164479 ) ) ( not ( = ?auto_164478 ?auto_164479 ) ) ( not ( = ?auto_164480 ?auto_164479 ) ) ( ON ?auto_164473 ?auto_164472 ) ( ON-TABLE ?auto_164479 ) ( ON ?auto_164474 ?auto_164473 ) ( CLEAR ?auto_164480 ) ( ON ?auto_164477 ?auto_164474 ) ( CLEAR ?auto_164477 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_164479 ?auto_164472 ?auto_164473 ?auto_164474 )
      ( MAKE-3PILE ?auto_164472 ?auto_164473 ?auto_164474 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_164481 - BLOCK
      ?auto_164482 - BLOCK
      ?auto_164483 - BLOCK
    )
    :vars
    (
      ?auto_164487 - BLOCK
      ?auto_164486 - BLOCK
      ?auto_164489 - BLOCK
      ?auto_164485 - BLOCK
      ?auto_164484 - BLOCK
      ?auto_164488 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_164481 ?auto_164482 ) ) ( not ( = ?auto_164481 ?auto_164483 ) ) ( not ( = ?auto_164482 ?auto_164483 ) ) ( not ( = ?auto_164481 ?auto_164487 ) ) ( not ( = ?auto_164482 ?auto_164487 ) ) ( not ( = ?auto_164483 ?auto_164487 ) ) ( ON-TABLE ?auto_164486 ) ( ON ?auto_164489 ?auto_164486 ) ( ON ?auto_164485 ?auto_164489 ) ( not ( = ?auto_164486 ?auto_164489 ) ) ( not ( = ?auto_164486 ?auto_164485 ) ) ( not ( = ?auto_164486 ?auto_164484 ) ) ( not ( = ?auto_164486 ?auto_164487 ) ) ( not ( = ?auto_164486 ?auto_164483 ) ) ( not ( = ?auto_164486 ?auto_164482 ) ) ( not ( = ?auto_164489 ?auto_164485 ) ) ( not ( = ?auto_164489 ?auto_164484 ) ) ( not ( = ?auto_164489 ?auto_164487 ) ) ( not ( = ?auto_164489 ?auto_164483 ) ) ( not ( = ?auto_164489 ?auto_164482 ) ) ( not ( = ?auto_164485 ?auto_164484 ) ) ( not ( = ?auto_164485 ?auto_164487 ) ) ( not ( = ?auto_164485 ?auto_164483 ) ) ( not ( = ?auto_164485 ?auto_164482 ) ) ( not ( = ?auto_164484 ?auto_164487 ) ) ( not ( = ?auto_164484 ?auto_164483 ) ) ( not ( = ?auto_164484 ?auto_164482 ) ) ( not ( = ?auto_164481 ?auto_164486 ) ) ( not ( = ?auto_164481 ?auto_164489 ) ) ( not ( = ?auto_164481 ?auto_164485 ) ) ( not ( = ?auto_164481 ?auto_164484 ) ) ( ON ?auto_164481 ?auto_164488 ) ( not ( = ?auto_164481 ?auto_164488 ) ) ( not ( = ?auto_164482 ?auto_164488 ) ) ( not ( = ?auto_164483 ?auto_164488 ) ) ( not ( = ?auto_164487 ?auto_164488 ) ) ( not ( = ?auto_164486 ?auto_164488 ) ) ( not ( = ?auto_164489 ?auto_164488 ) ) ( not ( = ?auto_164485 ?auto_164488 ) ) ( not ( = ?auto_164484 ?auto_164488 ) ) ( ON ?auto_164482 ?auto_164481 ) ( ON-TABLE ?auto_164488 ) ( ON ?auto_164483 ?auto_164482 ) ( ON ?auto_164487 ?auto_164483 ) ( CLEAR ?auto_164487 ) ( HOLDING ?auto_164484 ) ( CLEAR ?auto_164485 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_164486 ?auto_164489 ?auto_164485 ?auto_164484 )
      ( MAKE-3PILE ?auto_164481 ?auto_164482 ?auto_164483 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_164490 - BLOCK
      ?auto_164491 - BLOCK
      ?auto_164492 - BLOCK
    )
    :vars
    (
      ?auto_164497 - BLOCK
      ?auto_164493 - BLOCK
      ?auto_164494 - BLOCK
      ?auto_164496 - BLOCK
      ?auto_164498 - BLOCK
      ?auto_164495 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_164490 ?auto_164491 ) ) ( not ( = ?auto_164490 ?auto_164492 ) ) ( not ( = ?auto_164491 ?auto_164492 ) ) ( not ( = ?auto_164490 ?auto_164497 ) ) ( not ( = ?auto_164491 ?auto_164497 ) ) ( not ( = ?auto_164492 ?auto_164497 ) ) ( ON-TABLE ?auto_164493 ) ( ON ?auto_164494 ?auto_164493 ) ( ON ?auto_164496 ?auto_164494 ) ( not ( = ?auto_164493 ?auto_164494 ) ) ( not ( = ?auto_164493 ?auto_164496 ) ) ( not ( = ?auto_164493 ?auto_164498 ) ) ( not ( = ?auto_164493 ?auto_164497 ) ) ( not ( = ?auto_164493 ?auto_164492 ) ) ( not ( = ?auto_164493 ?auto_164491 ) ) ( not ( = ?auto_164494 ?auto_164496 ) ) ( not ( = ?auto_164494 ?auto_164498 ) ) ( not ( = ?auto_164494 ?auto_164497 ) ) ( not ( = ?auto_164494 ?auto_164492 ) ) ( not ( = ?auto_164494 ?auto_164491 ) ) ( not ( = ?auto_164496 ?auto_164498 ) ) ( not ( = ?auto_164496 ?auto_164497 ) ) ( not ( = ?auto_164496 ?auto_164492 ) ) ( not ( = ?auto_164496 ?auto_164491 ) ) ( not ( = ?auto_164498 ?auto_164497 ) ) ( not ( = ?auto_164498 ?auto_164492 ) ) ( not ( = ?auto_164498 ?auto_164491 ) ) ( not ( = ?auto_164490 ?auto_164493 ) ) ( not ( = ?auto_164490 ?auto_164494 ) ) ( not ( = ?auto_164490 ?auto_164496 ) ) ( not ( = ?auto_164490 ?auto_164498 ) ) ( ON ?auto_164490 ?auto_164495 ) ( not ( = ?auto_164490 ?auto_164495 ) ) ( not ( = ?auto_164491 ?auto_164495 ) ) ( not ( = ?auto_164492 ?auto_164495 ) ) ( not ( = ?auto_164497 ?auto_164495 ) ) ( not ( = ?auto_164493 ?auto_164495 ) ) ( not ( = ?auto_164494 ?auto_164495 ) ) ( not ( = ?auto_164496 ?auto_164495 ) ) ( not ( = ?auto_164498 ?auto_164495 ) ) ( ON ?auto_164491 ?auto_164490 ) ( ON-TABLE ?auto_164495 ) ( ON ?auto_164492 ?auto_164491 ) ( ON ?auto_164497 ?auto_164492 ) ( CLEAR ?auto_164496 ) ( ON ?auto_164498 ?auto_164497 ) ( CLEAR ?auto_164498 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_164495 ?auto_164490 ?auto_164491 ?auto_164492 ?auto_164497 )
      ( MAKE-3PILE ?auto_164490 ?auto_164491 ?auto_164492 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_164499 - BLOCK
      ?auto_164500 - BLOCK
      ?auto_164501 - BLOCK
    )
    :vars
    (
      ?auto_164503 - BLOCK
      ?auto_164502 - BLOCK
      ?auto_164507 - BLOCK
      ?auto_164506 - BLOCK
      ?auto_164505 - BLOCK
      ?auto_164504 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_164499 ?auto_164500 ) ) ( not ( = ?auto_164499 ?auto_164501 ) ) ( not ( = ?auto_164500 ?auto_164501 ) ) ( not ( = ?auto_164499 ?auto_164503 ) ) ( not ( = ?auto_164500 ?auto_164503 ) ) ( not ( = ?auto_164501 ?auto_164503 ) ) ( ON-TABLE ?auto_164502 ) ( ON ?auto_164507 ?auto_164502 ) ( not ( = ?auto_164502 ?auto_164507 ) ) ( not ( = ?auto_164502 ?auto_164506 ) ) ( not ( = ?auto_164502 ?auto_164505 ) ) ( not ( = ?auto_164502 ?auto_164503 ) ) ( not ( = ?auto_164502 ?auto_164501 ) ) ( not ( = ?auto_164502 ?auto_164500 ) ) ( not ( = ?auto_164507 ?auto_164506 ) ) ( not ( = ?auto_164507 ?auto_164505 ) ) ( not ( = ?auto_164507 ?auto_164503 ) ) ( not ( = ?auto_164507 ?auto_164501 ) ) ( not ( = ?auto_164507 ?auto_164500 ) ) ( not ( = ?auto_164506 ?auto_164505 ) ) ( not ( = ?auto_164506 ?auto_164503 ) ) ( not ( = ?auto_164506 ?auto_164501 ) ) ( not ( = ?auto_164506 ?auto_164500 ) ) ( not ( = ?auto_164505 ?auto_164503 ) ) ( not ( = ?auto_164505 ?auto_164501 ) ) ( not ( = ?auto_164505 ?auto_164500 ) ) ( not ( = ?auto_164499 ?auto_164502 ) ) ( not ( = ?auto_164499 ?auto_164507 ) ) ( not ( = ?auto_164499 ?auto_164506 ) ) ( not ( = ?auto_164499 ?auto_164505 ) ) ( ON ?auto_164499 ?auto_164504 ) ( not ( = ?auto_164499 ?auto_164504 ) ) ( not ( = ?auto_164500 ?auto_164504 ) ) ( not ( = ?auto_164501 ?auto_164504 ) ) ( not ( = ?auto_164503 ?auto_164504 ) ) ( not ( = ?auto_164502 ?auto_164504 ) ) ( not ( = ?auto_164507 ?auto_164504 ) ) ( not ( = ?auto_164506 ?auto_164504 ) ) ( not ( = ?auto_164505 ?auto_164504 ) ) ( ON ?auto_164500 ?auto_164499 ) ( ON-TABLE ?auto_164504 ) ( ON ?auto_164501 ?auto_164500 ) ( ON ?auto_164503 ?auto_164501 ) ( ON ?auto_164505 ?auto_164503 ) ( CLEAR ?auto_164505 ) ( HOLDING ?auto_164506 ) ( CLEAR ?auto_164507 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_164502 ?auto_164507 ?auto_164506 )
      ( MAKE-3PILE ?auto_164499 ?auto_164500 ?auto_164501 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_164508 - BLOCK
      ?auto_164509 - BLOCK
      ?auto_164510 - BLOCK
    )
    :vars
    (
      ?auto_164511 - BLOCK
      ?auto_164514 - BLOCK
      ?auto_164512 - BLOCK
      ?auto_164515 - BLOCK
      ?auto_164516 - BLOCK
      ?auto_164513 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_164508 ?auto_164509 ) ) ( not ( = ?auto_164508 ?auto_164510 ) ) ( not ( = ?auto_164509 ?auto_164510 ) ) ( not ( = ?auto_164508 ?auto_164511 ) ) ( not ( = ?auto_164509 ?auto_164511 ) ) ( not ( = ?auto_164510 ?auto_164511 ) ) ( ON-TABLE ?auto_164514 ) ( ON ?auto_164512 ?auto_164514 ) ( not ( = ?auto_164514 ?auto_164512 ) ) ( not ( = ?auto_164514 ?auto_164515 ) ) ( not ( = ?auto_164514 ?auto_164516 ) ) ( not ( = ?auto_164514 ?auto_164511 ) ) ( not ( = ?auto_164514 ?auto_164510 ) ) ( not ( = ?auto_164514 ?auto_164509 ) ) ( not ( = ?auto_164512 ?auto_164515 ) ) ( not ( = ?auto_164512 ?auto_164516 ) ) ( not ( = ?auto_164512 ?auto_164511 ) ) ( not ( = ?auto_164512 ?auto_164510 ) ) ( not ( = ?auto_164512 ?auto_164509 ) ) ( not ( = ?auto_164515 ?auto_164516 ) ) ( not ( = ?auto_164515 ?auto_164511 ) ) ( not ( = ?auto_164515 ?auto_164510 ) ) ( not ( = ?auto_164515 ?auto_164509 ) ) ( not ( = ?auto_164516 ?auto_164511 ) ) ( not ( = ?auto_164516 ?auto_164510 ) ) ( not ( = ?auto_164516 ?auto_164509 ) ) ( not ( = ?auto_164508 ?auto_164514 ) ) ( not ( = ?auto_164508 ?auto_164512 ) ) ( not ( = ?auto_164508 ?auto_164515 ) ) ( not ( = ?auto_164508 ?auto_164516 ) ) ( ON ?auto_164508 ?auto_164513 ) ( not ( = ?auto_164508 ?auto_164513 ) ) ( not ( = ?auto_164509 ?auto_164513 ) ) ( not ( = ?auto_164510 ?auto_164513 ) ) ( not ( = ?auto_164511 ?auto_164513 ) ) ( not ( = ?auto_164514 ?auto_164513 ) ) ( not ( = ?auto_164512 ?auto_164513 ) ) ( not ( = ?auto_164515 ?auto_164513 ) ) ( not ( = ?auto_164516 ?auto_164513 ) ) ( ON ?auto_164509 ?auto_164508 ) ( ON-TABLE ?auto_164513 ) ( ON ?auto_164510 ?auto_164509 ) ( ON ?auto_164511 ?auto_164510 ) ( ON ?auto_164516 ?auto_164511 ) ( CLEAR ?auto_164512 ) ( ON ?auto_164515 ?auto_164516 ) ( CLEAR ?auto_164515 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_164513 ?auto_164508 ?auto_164509 ?auto_164510 ?auto_164511 ?auto_164516 )
      ( MAKE-3PILE ?auto_164508 ?auto_164509 ?auto_164510 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_164517 - BLOCK
      ?auto_164518 - BLOCK
      ?auto_164519 - BLOCK
    )
    :vars
    (
      ?auto_164523 - BLOCK
      ?auto_164521 - BLOCK
      ?auto_164520 - BLOCK
      ?auto_164525 - BLOCK
      ?auto_164524 - BLOCK
      ?auto_164522 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_164517 ?auto_164518 ) ) ( not ( = ?auto_164517 ?auto_164519 ) ) ( not ( = ?auto_164518 ?auto_164519 ) ) ( not ( = ?auto_164517 ?auto_164523 ) ) ( not ( = ?auto_164518 ?auto_164523 ) ) ( not ( = ?auto_164519 ?auto_164523 ) ) ( ON-TABLE ?auto_164521 ) ( not ( = ?auto_164521 ?auto_164520 ) ) ( not ( = ?auto_164521 ?auto_164525 ) ) ( not ( = ?auto_164521 ?auto_164524 ) ) ( not ( = ?auto_164521 ?auto_164523 ) ) ( not ( = ?auto_164521 ?auto_164519 ) ) ( not ( = ?auto_164521 ?auto_164518 ) ) ( not ( = ?auto_164520 ?auto_164525 ) ) ( not ( = ?auto_164520 ?auto_164524 ) ) ( not ( = ?auto_164520 ?auto_164523 ) ) ( not ( = ?auto_164520 ?auto_164519 ) ) ( not ( = ?auto_164520 ?auto_164518 ) ) ( not ( = ?auto_164525 ?auto_164524 ) ) ( not ( = ?auto_164525 ?auto_164523 ) ) ( not ( = ?auto_164525 ?auto_164519 ) ) ( not ( = ?auto_164525 ?auto_164518 ) ) ( not ( = ?auto_164524 ?auto_164523 ) ) ( not ( = ?auto_164524 ?auto_164519 ) ) ( not ( = ?auto_164524 ?auto_164518 ) ) ( not ( = ?auto_164517 ?auto_164521 ) ) ( not ( = ?auto_164517 ?auto_164520 ) ) ( not ( = ?auto_164517 ?auto_164525 ) ) ( not ( = ?auto_164517 ?auto_164524 ) ) ( ON ?auto_164517 ?auto_164522 ) ( not ( = ?auto_164517 ?auto_164522 ) ) ( not ( = ?auto_164518 ?auto_164522 ) ) ( not ( = ?auto_164519 ?auto_164522 ) ) ( not ( = ?auto_164523 ?auto_164522 ) ) ( not ( = ?auto_164521 ?auto_164522 ) ) ( not ( = ?auto_164520 ?auto_164522 ) ) ( not ( = ?auto_164525 ?auto_164522 ) ) ( not ( = ?auto_164524 ?auto_164522 ) ) ( ON ?auto_164518 ?auto_164517 ) ( ON-TABLE ?auto_164522 ) ( ON ?auto_164519 ?auto_164518 ) ( ON ?auto_164523 ?auto_164519 ) ( ON ?auto_164524 ?auto_164523 ) ( ON ?auto_164525 ?auto_164524 ) ( CLEAR ?auto_164525 ) ( HOLDING ?auto_164520 ) ( CLEAR ?auto_164521 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_164521 ?auto_164520 )
      ( MAKE-3PILE ?auto_164517 ?auto_164518 ?auto_164519 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_164526 - BLOCK
      ?auto_164527 - BLOCK
      ?auto_164528 - BLOCK
    )
    :vars
    (
      ?auto_164531 - BLOCK
      ?auto_164533 - BLOCK
      ?auto_164532 - BLOCK
      ?auto_164530 - BLOCK
      ?auto_164534 - BLOCK
      ?auto_164529 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_164526 ?auto_164527 ) ) ( not ( = ?auto_164526 ?auto_164528 ) ) ( not ( = ?auto_164527 ?auto_164528 ) ) ( not ( = ?auto_164526 ?auto_164531 ) ) ( not ( = ?auto_164527 ?auto_164531 ) ) ( not ( = ?auto_164528 ?auto_164531 ) ) ( ON-TABLE ?auto_164533 ) ( not ( = ?auto_164533 ?auto_164532 ) ) ( not ( = ?auto_164533 ?auto_164530 ) ) ( not ( = ?auto_164533 ?auto_164534 ) ) ( not ( = ?auto_164533 ?auto_164531 ) ) ( not ( = ?auto_164533 ?auto_164528 ) ) ( not ( = ?auto_164533 ?auto_164527 ) ) ( not ( = ?auto_164532 ?auto_164530 ) ) ( not ( = ?auto_164532 ?auto_164534 ) ) ( not ( = ?auto_164532 ?auto_164531 ) ) ( not ( = ?auto_164532 ?auto_164528 ) ) ( not ( = ?auto_164532 ?auto_164527 ) ) ( not ( = ?auto_164530 ?auto_164534 ) ) ( not ( = ?auto_164530 ?auto_164531 ) ) ( not ( = ?auto_164530 ?auto_164528 ) ) ( not ( = ?auto_164530 ?auto_164527 ) ) ( not ( = ?auto_164534 ?auto_164531 ) ) ( not ( = ?auto_164534 ?auto_164528 ) ) ( not ( = ?auto_164534 ?auto_164527 ) ) ( not ( = ?auto_164526 ?auto_164533 ) ) ( not ( = ?auto_164526 ?auto_164532 ) ) ( not ( = ?auto_164526 ?auto_164530 ) ) ( not ( = ?auto_164526 ?auto_164534 ) ) ( ON ?auto_164526 ?auto_164529 ) ( not ( = ?auto_164526 ?auto_164529 ) ) ( not ( = ?auto_164527 ?auto_164529 ) ) ( not ( = ?auto_164528 ?auto_164529 ) ) ( not ( = ?auto_164531 ?auto_164529 ) ) ( not ( = ?auto_164533 ?auto_164529 ) ) ( not ( = ?auto_164532 ?auto_164529 ) ) ( not ( = ?auto_164530 ?auto_164529 ) ) ( not ( = ?auto_164534 ?auto_164529 ) ) ( ON ?auto_164527 ?auto_164526 ) ( ON-TABLE ?auto_164529 ) ( ON ?auto_164528 ?auto_164527 ) ( ON ?auto_164531 ?auto_164528 ) ( ON ?auto_164534 ?auto_164531 ) ( ON ?auto_164530 ?auto_164534 ) ( CLEAR ?auto_164533 ) ( ON ?auto_164532 ?auto_164530 ) ( CLEAR ?auto_164532 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_164529 ?auto_164526 ?auto_164527 ?auto_164528 ?auto_164531 ?auto_164534 ?auto_164530 )
      ( MAKE-3PILE ?auto_164526 ?auto_164527 ?auto_164528 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_164535 - BLOCK
      ?auto_164536 - BLOCK
      ?auto_164537 - BLOCK
    )
    :vars
    (
      ?auto_164539 - BLOCK
      ?auto_164542 - BLOCK
      ?auto_164538 - BLOCK
      ?auto_164541 - BLOCK
      ?auto_164543 - BLOCK
      ?auto_164540 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_164535 ?auto_164536 ) ) ( not ( = ?auto_164535 ?auto_164537 ) ) ( not ( = ?auto_164536 ?auto_164537 ) ) ( not ( = ?auto_164535 ?auto_164539 ) ) ( not ( = ?auto_164536 ?auto_164539 ) ) ( not ( = ?auto_164537 ?auto_164539 ) ) ( not ( = ?auto_164542 ?auto_164538 ) ) ( not ( = ?auto_164542 ?auto_164541 ) ) ( not ( = ?auto_164542 ?auto_164543 ) ) ( not ( = ?auto_164542 ?auto_164539 ) ) ( not ( = ?auto_164542 ?auto_164537 ) ) ( not ( = ?auto_164542 ?auto_164536 ) ) ( not ( = ?auto_164538 ?auto_164541 ) ) ( not ( = ?auto_164538 ?auto_164543 ) ) ( not ( = ?auto_164538 ?auto_164539 ) ) ( not ( = ?auto_164538 ?auto_164537 ) ) ( not ( = ?auto_164538 ?auto_164536 ) ) ( not ( = ?auto_164541 ?auto_164543 ) ) ( not ( = ?auto_164541 ?auto_164539 ) ) ( not ( = ?auto_164541 ?auto_164537 ) ) ( not ( = ?auto_164541 ?auto_164536 ) ) ( not ( = ?auto_164543 ?auto_164539 ) ) ( not ( = ?auto_164543 ?auto_164537 ) ) ( not ( = ?auto_164543 ?auto_164536 ) ) ( not ( = ?auto_164535 ?auto_164542 ) ) ( not ( = ?auto_164535 ?auto_164538 ) ) ( not ( = ?auto_164535 ?auto_164541 ) ) ( not ( = ?auto_164535 ?auto_164543 ) ) ( ON ?auto_164535 ?auto_164540 ) ( not ( = ?auto_164535 ?auto_164540 ) ) ( not ( = ?auto_164536 ?auto_164540 ) ) ( not ( = ?auto_164537 ?auto_164540 ) ) ( not ( = ?auto_164539 ?auto_164540 ) ) ( not ( = ?auto_164542 ?auto_164540 ) ) ( not ( = ?auto_164538 ?auto_164540 ) ) ( not ( = ?auto_164541 ?auto_164540 ) ) ( not ( = ?auto_164543 ?auto_164540 ) ) ( ON ?auto_164536 ?auto_164535 ) ( ON-TABLE ?auto_164540 ) ( ON ?auto_164537 ?auto_164536 ) ( ON ?auto_164539 ?auto_164537 ) ( ON ?auto_164543 ?auto_164539 ) ( ON ?auto_164541 ?auto_164543 ) ( ON ?auto_164538 ?auto_164541 ) ( CLEAR ?auto_164538 ) ( HOLDING ?auto_164542 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_164542 )
      ( MAKE-3PILE ?auto_164535 ?auto_164536 ?auto_164537 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_164544 - BLOCK
      ?auto_164545 - BLOCK
      ?auto_164546 - BLOCK
    )
    :vars
    (
      ?auto_164552 - BLOCK
      ?auto_164551 - BLOCK
      ?auto_164549 - BLOCK
      ?auto_164548 - BLOCK
      ?auto_164550 - BLOCK
      ?auto_164547 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_164544 ?auto_164545 ) ) ( not ( = ?auto_164544 ?auto_164546 ) ) ( not ( = ?auto_164545 ?auto_164546 ) ) ( not ( = ?auto_164544 ?auto_164552 ) ) ( not ( = ?auto_164545 ?auto_164552 ) ) ( not ( = ?auto_164546 ?auto_164552 ) ) ( not ( = ?auto_164551 ?auto_164549 ) ) ( not ( = ?auto_164551 ?auto_164548 ) ) ( not ( = ?auto_164551 ?auto_164550 ) ) ( not ( = ?auto_164551 ?auto_164552 ) ) ( not ( = ?auto_164551 ?auto_164546 ) ) ( not ( = ?auto_164551 ?auto_164545 ) ) ( not ( = ?auto_164549 ?auto_164548 ) ) ( not ( = ?auto_164549 ?auto_164550 ) ) ( not ( = ?auto_164549 ?auto_164552 ) ) ( not ( = ?auto_164549 ?auto_164546 ) ) ( not ( = ?auto_164549 ?auto_164545 ) ) ( not ( = ?auto_164548 ?auto_164550 ) ) ( not ( = ?auto_164548 ?auto_164552 ) ) ( not ( = ?auto_164548 ?auto_164546 ) ) ( not ( = ?auto_164548 ?auto_164545 ) ) ( not ( = ?auto_164550 ?auto_164552 ) ) ( not ( = ?auto_164550 ?auto_164546 ) ) ( not ( = ?auto_164550 ?auto_164545 ) ) ( not ( = ?auto_164544 ?auto_164551 ) ) ( not ( = ?auto_164544 ?auto_164549 ) ) ( not ( = ?auto_164544 ?auto_164548 ) ) ( not ( = ?auto_164544 ?auto_164550 ) ) ( ON ?auto_164544 ?auto_164547 ) ( not ( = ?auto_164544 ?auto_164547 ) ) ( not ( = ?auto_164545 ?auto_164547 ) ) ( not ( = ?auto_164546 ?auto_164547 ) ) ( not ( = ?auto_164552 ?auto_164547 ) ) ( not ( = ?auto_164551 ?auto_164547 ) ) ( not ( = ?auto_164549 ?auto_164547 ) ) ( not ( = ?auto_164548 ?auto_164547 ) ) ( not ( = ?auto_164550 ?auto_164547 ) ) ( ON ?auto_164545 ?auto_164544 ) ( ON-TABLE ?auto_164547 ) ( ON ?auto_164546 ?auto_164545 ) ( ON ?auto_164552 ?auto_164546 ) ( ON ?auto_164550 ?auto_164552 ) ( ON ?auto_164548 ?auto_164550 ) ( ON ?auto_164549 ?auto_164548 ) ( ON ?auto_164551 ?auto_164549 ) ( CLEAR ?auto_164551 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_164547 ?auto_164544 ?auto_164545 ?auto_164546 ?auto_164552 ?auto_164550 ?auto_164548 ?auto_164549 )
      ( MAKE-3PILE ?auto_164544 ?auto_164545 ?auto_164546 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_164557 - BLOCK
      ?auto_164558 - BLOCK
      ?auto_164559 - BLOCK
      ?auto_164560 - BLOCK
    )
    :vars
    (
      ?auto_164561 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_164561 ?auto_164560 ) ( CLEAR ?auto_164561 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_164557 ) ( ON ?auto_164558 ?auto_164557 ) ( ON ?auto_164559 ?auto_164558 ) ( ON ?auto_164560 ?auto_164559 ) ( not ( = ?auto_164557 ?auto_164558 ) ) ( not ( = ?auto_164557 ?auto_164559 ) ) ( not ( = ?auto_164557 ?auto_164560 ) ) ( not ( = ?auto_164557 ?auto_164561 ) ) ( not ( = ?auto_164558 ?auto_164559 ) ) ( not ( = ?auto_164558 ?auto_164560 ) ) ( not ( = ?auto_164558 ?auto_164561 ) ) ( not ( = ?auto_164559 ?auto_164560 ) ) ( not ( = ?auto_164559 ?auto_164561 ) ) ( not ( = ?auto_164560 ?auto_164561 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_164561 ?auto_164560 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_164562 - BLOCK
      ?auto_164563 - BLOCK
      ?auto_164564 - BLOCK
      ?auto_164565 - BLOCK
    )
    :vars
    (
      ?auto_164566 - BLOCK
      ?auto_164567 - BLOCK
      ?auto_164568 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_164566 ?auto_164565 ) ( CLEAR ?auto_164566 ) ( ON-TABLE ?auto_164562 ) ( ON ?auto_164563 ?auto_164562 ) ( ON ?auto_164564 ?auto_164563 ) ( ON ?auto_164565 ?auto_164564 ) ( not ( = ?auto_164562 ?auto_164563 ) ) ( not ( = ?auto_164562 ?auto_164564 ) ) ( not ( = ?auto_164562 ?auto_164565 ) ) ( not ( = ?auto_164562 ?auto_164566 ) ) ( not ( = ?auto_164563 ?auto_164564 ) ) ( not ( = ?auto_164563 ?auto_164565 ) ) ( not ( = ?auto_164563 ?auto_164566 ) ) ( not ( = ?auto_164564 ?auto_164565 ) ) ( not ( = ?auto_164564 ?auto_164566 ) ) ( not ( = ?auto_164565 ?auto_164566 ) ) ( HOLDING ?auto_164567 ) ( CLEAR ?auto_164568 ) ( not ( = ?auto_164562 ?auto_164567 ) ) ( not ( = ?auto_164562 ?auto_164568 ) ) ( not ( = ?auto_164563 ?auto_164567 ) ) ( not ( = ?auto_164563 ?auto_164568 ) ) ( not ( = ?auto_164564 ?auto_164567 ) ) ( not ( = ?auto_164564 ?auto_164568 ) ) ( not ( = ?auto_164565 ?auto_164567 ) ) ( not ( = ?auto_164565 ?auto_164568 ) ) ( not ( = ?auto_164566 ?auto_164567 ) ) ( not ( = ?auto_164566 ?auto_164568 ) ) ( not ( = ?auto_164567 ?auto_164568 ) ) )
    :subtasks
    ( ( !STACK ?auto_164567 ?auto_164568 )
      ( MAKE-4PILE ?auto_164562 ?auto_164563 ?auto_164564 ?auto_164565 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_164569 - BLOCK
      ?auto_164570 - BLOCK
      ?auto_164571 - BLOCK
      ?auto_164572 - BLOCK
    )
    :vars
    (
      ?auto_164575 - BLOCK
      ?auto_164573 - BLOCK
      ?auto_164574 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_164575 ?auto_164572 ) ( ON-TABLE ?auto_164569 ) ( ON ?auto_164570 ?auto_164569 ) ( ON ?auto_164571 ?auto_164570 ) ( ON ?auto_164572 ?auto_164571 ) ( not ( = ?auto_164569 ?auto_164570 ) ) ( not ( = ?auto_164569 ?auto_164571 ) ) ( not ( = ?auto_164569 ?auto_164572 ) ) ( not ( = ?auto_164569 ?auto_164575 ) ) ( not ( = ?auto_164570 ?auto_164571 ) ) ( not ( = ?auto_164570 ?auto_164572 ) ) ( not ( = ?auto_164570 ?auto_164575 ) ) ( not ( = ?auto_164571 ?auto_164572 ) ) ( not ( = ?auto_164571 ?auto_164575 ) ) ( not ( = ?auto_164572 ?auto_164575 ) ) ( CLEAR ?auto_164573 ) ( not ( = ?auto_164569 ?auto_164574 ) ) ( not ( = ?auto_164569 ?auto_164573 ) ) ( not ( = ?auto_164570 ?auto_164574 ) ) ( not ( = ?auto_164570 ?auto_164573 ) ) ( not ( = ?auto_164571 ?auto_164574 ) ) ( not ( = ?auto_164571 ?auto_164573 ) ) ( not ( = ?auto_164572 ?auto_164574 ) ) ( not ( = ?auto_164572 ?auto_164573 ) ) ( not ( = ?auto_164575 ?auto_164574 ) ) ( not ( = ?auto_164575 ?auto_164573 ) ) ( not ( = ?auto_164574 ?auto_164573 ) ) ( ON ?auto_164574 ?auto_164575 ) ( CLEAR ?auto_164574 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_164569 ?auto_164570 ?auto_164571 ?auto_164572 ?auto_164575 )
      ( MAKE-4PILE ?auto_164569 ?auto_164570 ?auto_164571 ?auto_164572 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_164576 - BLOCK
      ?auto_164577 - BLOCK
      ?auto_164578 - BLOCK
      ?auto_164579 - BLOCK
    )
    :vars
    (
      ?auto_164582 - BLOCK
      ?auto_164581 - BLOCK
      ?auto_164580 - BLOCK
      ?auto_164583 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_164582 ?auto_164579 ) ( ON-TABLE ?auto_164576 ) ( ON ?auto_164577 ?auto_164576 ) ( ON ?auto_164578 ?auto_164577 ) ( ON ?auto_164579 ?auto_164578 ) ( not ( = ?auto_164576 ?auto_164577 ) ) ( not ( = ?auto_164576 ?auto_164578 ) ) ( not ( = ?auto_164576 ?auto_164579 ) ) ( not ( = ?auto_164576 ?auto_164582 ) ) ( not ( = ?auto_164577 ?auto_164578 ) ) ( not ( = ?auto_164577 ?auto_164579 ) ) ( not ( = ?auto_164577 ?auto_164582 ) ) ( not ( = ?auto_164578 ?auto_164579 ) ) ( not ( = ?auto_164578 ?auto_164582 ) ) ( not ( = ?auto_164579 ?auto_164582 ) ) ( not ( = ?auto_164576 ?auto_164581 ) ) ( not ( = ?auto_164576 ?auto_164580 ) ) ( not ( = ?auto_164577 ?auto_164581 ) ) ( not ( = ?auto_164577 ?auto_164580 ) ) ( not ( = ?auto_164578 ?auto_164581 ) ) ( not ( = ?auto_164578 ?auto_164580 ) ) ( not ( = ?auto_164579 ?auto_164581 ) ) ( not ( = ?auto_164579 ?auto_164580 ) ) ( not ( = ?auto_164582 ?auto_164581 ) ) ( not ( = ?auto_164582 ?auto_164580 ) ) ( not ( = ?auto_164581 ?auto_164580 ) ) ( ON ?auto_164581 ?auto_164582 ) ( CLEAR ?auto_164581 ) ( HOLDING ?auto_164580 ) ( CLEAR ?auto_164583 ) ( ON-TABLE ?auto_164583 ) ( not ( = ?auto_164583 ?auto_164580 ) ) ( not ( = ?auto_164576 ?auto_164583 ) ) ( not ( = ?auto_164577 ?auto_164583 ) ) ( not ( = ?auto_164578 ?auto_164583 ) ) ( not ( = ?auto_164579 ?auto_164583 ) ) ( not ( = ?auto_164582 ?auto_164583 ) ) ( not ( = ?auto_164581 ?auto_164583 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_164583 ?auto_164580 )
      ( MAKE-4PILE ?auto_164576 ?auto_164577 ?auto_164578 ?auto_164579 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_164584 - BLOCK
      ?auto_164585 - BLOCK
      ?auto_164586 - BLOCK
      ?auto_164587 - BLOCK
    )
    :vars
    (
      ?auto_164591 - BLOCK
      ?auto_164588 - BLOCK
      ?auto_164589 - BLOCK
      ?auto_164590 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_164591 ?auto_164587 ) ( ON-TABLE ?auto_164584 ) ( ON ?auto_164585 ?auto_164584 ) ( ON ?auto_164586 ?auto_164585 ) ( ON ?auto_164587 ?auto_164586 ) ( not ( = ?auto_164584 ?auto_164585 ) ) ( not ( = ?auto_164584 ?auto_164586 ) ) ( not ( = ?auto_164584 ?auto_164587 ) ) ( not ( = ?auto_164584 ?auto_164591 ) ) ( not ( = ?auto_164585 ?auto_164586 ) ) ( not ( = ?auto_164585 ?auto_164587 ) ) ( not ( = ?auto_164585 ?auto_164591 ) ) ( not ( = ?auto_164586 ?auto_164587 ) ) ( not ( = ?auto_164586 ?auto_164591 ) ) ( not ( = ?auto_164587 ?auto_164591 ) ) ( not ( = ?auto_164584 ?auto_164588 ) ) ( not ( = ?auto_164584 ?auto_164589 ) ) ( not ( = ?auto_164585 ?auto_164588 ) ) ( not ( = ?auto_164585 ?auto_164589 ) ) ( not ( = ?auto_164586 ?auto_164588 ) ) ( not ( = ?auto_164586 ?auto_164589 ) ) ( not ( = ?auto_164587 ?auto_164588 ) ) ( not ( = ?auto_164587 ?auto_164589 ) ) ( not ( = ?auto_164591 ?auto_164588 ) ) ( not ( = ?auto_164591 ?auto_164589 ) ) ( not ( = ?auto_164588 ?auto_164589 ) ) ( ON ?auto_164588 ?auto_164591 ) ( CLEAR ?auto_164590 ) ( ON-TABLE ?auto_164590 ) ( not ( = ?auto_164590 ?auto_164589 ) ) ( not ( = ?auto_164584 ?auto_164590 ) ) ( not ( = ?auto_164585 ?auto_164590 ) ) ( not ( = ?auto_164586 ?auto_164590 ) ) ( not ( = ?auto_164587 ?auto_164590 ) ) ( not ( = ?auto_164591 ?auto_164590 ) ) ( not ( = ?auto_164588 ?auto_164590 ) ) ( ON ?auto_164589 ?auto_164588 ) ( CLEAR ?auto_164589 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_164584 ?auto_164585 ?auto_164586 ?auto_164587 ?auto_164591 ?auto_164588 )
      ( MAKE-4PILE ?auto_164584 ?auto_164585 ?auto_164586 ?auto_164587 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_164592 - BLOCK
      ?auto_164593 - BLOCK
      ?auto_164594 - BLOCK
      ?auto_164595 - BLOCK
    )
    :vars
    (
      ?auto_164596 - BLOCK
      ?auto_164597 - BLOCK
      ?auto_164598 - BLOCK
      ?auto_164599 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_164596 ?auto_164595 ) ( ON-TABLE ?auto_164592 ) ( ON ?auto_164593 ?auto_164592 ) ( ON ?auto_164594 ?auto_164593 ) ( ON ?auto_164595 ?auto_164594 ) ( not ( = ?auto_164592 ?auto_164593 ) ) ( not ( = ?auto_164592 ?auto_164594 ) ) ( not ( = ?auto_164592 ?auto_164595 ) ) ( not ( = ?auto_164592 ?auto_164596 ) ) ( not ( = ?auto_164593 ?auto_164594 ) ) ( not ( = ?auto_164593 ?auto_164595 ) ) ( not ( = ?auto_164593 ?auto_164596 ) ) ( not ( = ?auto_164594 ?auto_164595 ) ) ( not ( = ?auto_164594 ?auto_164596 ) ) ( not ( = ?auto_164595 ?auto_164596 ) ) ( not ( = ?auto_164592 ?auto_164597 ) ) ( not ( = ?auto_164592 ?auto_164598 ) ) ( not ( = ?auto_164593 ?auto_164597 ) ) ( not ( = ?auto_164593 ?auto_164598 ) ) ( not ( = ?auto_164594 ?auto_164597 ) ) ( not ( = ?auto_164594 ?auto_164598 ) ) ( not ( = ?auto_164595 ?auto_164597 ) ) ( not ( = ?auto_164595 ?auto_164598 ) ) ( not ( = ?auto_164596 ?auto_164597 ) ) ( not ( = ?auto_164596 ?auto_164598 ) ) ( not ( = ?auto_164597 ?auto_164598 ) ) ( ON ?auto_164597 ?auto_164596 ) ( not ( = ?auto_164599 ?auto_164598 ) ) ( not ( = ?auto_164592 ?auto_164599 ) ) ( not ( = ?auto_164593 ?auto_164599 ) ) ( not ( = ?auto_164594 ?auto_164599 ) ) ( not ( = ?auto_164595 ?auto_164599 ) ) ( not ( = ?auto_164596 ?auto_164599 ) ) ( not ( = ?auto_164597 ?auto_164599 ) ) ( ON ?auto_164598 ?auto_164597 ) ( CLEAR ?auto_164598 ) ( HOLDING ?auto_164599 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_164599 )
      ( MAKE-4PILE ?auto_164592 ?auto_164593 ?auto_164594 ?auto_164595 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_164600 - BLOCK
      ?auto_164601 - BLOCK
      ?auto_164602 - BLOCK
      ?auto_164603 - BLOCK
    )
    :vars
    (
      ?auto_164606 - BLOCK
      ?auto_164607 - BLOCK
      ?auto_164605 - BLOCK
      ?auto_164604 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_164606 ?auto_164603 ) ( ON-TABLE ?auto_164600 ) ( ON ?auto_164601 ?auto_164600 ) ( ON ?auto_164602 ?auto_164601 ) ( ON ?auto_164603 ?auto_164602 ) ( not ( = ?auto_164600 ?auto_164601 ) ) ( not ( = ?auto_164600 ?auto_164602 ) ) ( not ( = ?auto_164600 ?auto_164603 ) ) ( not ( = ?auto_164600 ?auto_164606 ) ) ( not ( = ?auto_164601 ?auto_164602 ) ) ( not ( = ?auto_164601 ?auto_164603 ) ) ( not ( = ?auto_164601 ?auto_164606 ) ) ( not ( = ?auto_164602 ?auto_164603 ) ) ( not ( = ?auto_164602 ?auto_164606 ) ) ( not ( = ?auto_164603 ?auto_164606 ) ) ( not ( = ?auto_164600 ?auto_164607 ) ) ( not ( = ?auto_164600 ?auto_164605 ) ) ( not ( = ?auto_164601 ?auto_164607 ) ) ( not ( = ?auto_164601 ?auto_164605 ) ) ( not ( = ?auto_164602 ?auto_164607 ) ) ( not ( = ?auto_164602 ?auto_164605 ) ) ( not ( = ?auto_164603 ?auto_164607 ) ) ( not ( = ?auto_164603 ?auto_164605 ) ) ( not ( = ?auto_164606 ?auto_164607 ) ) ( not ( = ?auto_164606 ?auto_164605 ) ) ( not ( = ?auto_164607 ?auto_164605 ) ) ( ON ?auto_164607 ?auto_164606 ) ( not ( = ?auto_164604 ?auto_164605 ) ) ( not ( = ?auto_164600 ?auto_164604 ) ) ( not ( = ?auto_164601 ?auto_164604 ) ) ( not ( = ?auto_164602 ?auto_164604 ) ) ( not ( = ?auto_164603 ?auto_164604 ) ) ( not ( = ?auto_164606 ?auto_164604 ) ) ( not ( = ?auto_164607 ?auto_164604 ) ) ( ON ?auto_164605 ?auto_164607 ) ( ON ?auto_164604 ?auto_164605 ) ( CLEAR ?auto_164604 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_164600 ?auto_164601 ?auto_164602 ?auto_164603 ?auto_164606 ?auto_164607 ?auto_164605 )
      ( MAKE-4PILE ?auto_164600 ?auto_164601 ?auto_164602 ?auto_164603 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_164608 - BLOCK
      ?auto_164609 - BLOCK
      ?auto_164610 - BLOCK
      ?auto_164611 - BLOCK
    )
    :vars
    (
      ?auto_164615 - BLOCK
      ?auto_164613 - BLOCK
      ?auto_164614 - BLOCK
      ?auto_164612 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_164615 ?auto_164611 ) ( ON-TABLE ?auto_164608 ) ( ON ?auto_164609 ?auto_164608 ) ( ON ?auto_164610 ?auto_164609 ) ( ON ?auto_164611 ?auto_164610 ) ( not ( = ?auto_164608 ?auto_164609 ) ) ( not ( = ?auto_164608 ?auto_164610 ) ) ( not ( = ?auto_164608 ?auto_164611 ) ) ( not ( = ?auto_164608 ?auto_164615 ) ) ( not ( = ?auto_164609 ?auto_164610 ) ) ( not ( = ?auto_164609 ?auto_164611 ) ) ( not ( = ?auto_164609 ?auto_164615 ) ) ( not ( = ?auto_164610 ?auto_164611 ) ) ( not ( = ?auto_164610 ?auto_164615 ) ) ( not ( = ?auto_164611 ?auto_164615 ) ) ( not ( = ?auto_164608 ?auto_164613 ) ) ( not ( = ?auto_164608 ?auto_164614 ) ) ( not ( = ?auto_164609 ?auto_164613 ) ) ( not ( = ?auto_164609 ?auto_164614 ) ) ( not ( = ?auto_164610 ?auto_164613 ) ) ( not ( = ?auto_164610 ?auto_164614 ) ) ( not ( = ?auto_164611 ?auto_164613 ) ) ( not ( = ?auto_164611 ?auto_164614 ) ) ( not ( = ?auto_164615 ?auto_164613 ) ) ( not ( = ?auto_164615 ?auto_164614 ) ) ( not ( = ?auto_164613 ?auto_164614 ) ) ( ON ?auto_164613 ?auto_164615 ) ( not ( = ?auto_164612 ?auto_164614 ) ) ( not ( = ?auto_164608 ?auto_164612 ) ) ( not ( = ?auto_164609 ?auto_164612 ) ) ( not ( = ?auto_164610 ?auto_164612 ) ) ( not ( = ?auto_164611 ?auto_164612 ) ) ( not ( = ?auto_164615 ?auto_164612 ) ) ( not ( = ?auto_164613 ?auto_164612 ) ) ( ON ?auto_164614 ?auto_164613 ) ( HOLDING ?auto_164612 ) ( CLEAR ?auto_164614 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_164608 ?auto_164609 ?auto_164610 ?auto_164611 ?auto_164615 ?auto_164613 ?auto_164614 ?auto_164612 )
      ( MAKE-4PILE ?auto_164608 ?auto_164609 ?auto_164610 ?auto_164611 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_164616 - BLOCK
      ?auto_164617 - BLOCK
      ?auto_164618 - BLOCK
      ?auto_164619 - BLOCK
    )
    :vars
    (
      ?auto_164620 - BLOCK
      ?auto_164623 - BLOCK
      ?auto_164621 - BLOCK
      ?auto_164622 - BLOCK
      ?auto_164624 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_164620 ?auto_164619 ) ( ON-TABLE ?auto_164616 ) ( ON ?auto_164617 ?auto_164616 ) ( ON ?auto_164618 ?auto_164617 ) ( ON ?auto_164619 ?auto_164618 ) ( not ( = ?auto_164616 ?auto_164617 ) ) ( not ( = ?auto_164616 ?auto_164618 ) ) ( not ( = ?auto_164616 ?auto_164619 ) ) ( not ( = ?auto_164616 ?auto_164620 ) ) ( not ( = ?auto_164617 ?auto_164618 ) ) ( not ( = ?auto_164617 ?auto_164619 ) ) ( not ( = ?auto_164617 ?auto_164620 ) ) ( not ( = ?auto_164618 ?auto_164619 ) ) ( not ( = ?auto_164618 ?auto_164620 ) ) ( not ( = ?auto_164619 ?auto_164620 ) ) ( not ( = ?auto_164616 ?auto_164623 ) ) ( not ( = ?auto_164616 ?auto_164621 ) ) ( not ( = ?auto_164617 ?auto_164623 ) ) ( not ( = ?auto_164617 ?auto_164621 ) ) ( not ( = ?auto_164618 ?auto_164623 ) ) ( not ( = ?auto_164618 ?auto_164621 ) ) ( not ( = ?auto_164619 ?auto_164623 ) ) ( not ( = ?auto_164619 ?auto_164621 ) ) ( not ( = ?auto_164620 ?auto_164623 ) ) ( not ( = ?auto_164620 ?auto_164621 ) ) ( not ( = ?auto_164623 ?auto_164621 ) ) ( ON ?auto_164623 ?auto_164620 ) ( not ( = ?auto_164622 ?auto_164621 ) ) ( not ( = ?auto_164616 ?auto_164622 ) ) ( not ( = ?auto_164617 ?auto_164622 ) ) ( not ( = ?auto_164618 ?auto_164622 ) ) ( not ( = ?auto_164619 ?auto_164622 ) ) ( not ( = ?auto_164620 ?auto_164622 ) ) ( not ( = ?auto_164623 ?auto_164622 ) ) ( ON ?auto_164621 ?auto_164623 ) ( CLEAR ?auto_164621 ) ( ON ?auto_164622 ?auto_164624 ) ( CLEAR ?auto_164622 ) ( HAND-EMPTY ) ( not ( = ?auto_164616 ?auto_164624 ) ) ( not ( = ?auto_164617 ?auto_164624 ) ) ( not ( = ?auto_164618 ?auto_164624 ) ) ( not ( = ?auto_164619 ?auto_164624 ) ) ( not ( = ?auto_164620 ?auto_164624 ) ) ( not ( = ?auto_164623 ?auto_164624 ) ) ( not ( = ?auto_164621 ?auto_164624 ) ) ( not ( = ?auto_164622 ?auto_164624 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_164622 ?auto_164624 )
      ( MAKE-4PILE ?auto_164616 ?auto_164617 ?auto_164618 ?auto_164619 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_164625 - BLOCK
      ?auto_164626 - BLOCK
      ?auto_164627 - BLOCK
      ?auto_164628 - BLOCK
    )
    :vars
    (
      ?auto_164631 - BLOCK
      ?auto_164633 - BLOCK
      ?auto_164629 - BLOCK
      ?auto_164632 - BLOCK
      ?auto_164630 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_164631 ?auto_164628 ) ( ON-TABLE ?auto_164625 ) ( ON ?auto_164626 ?auto_164625 ) ( ON ?auto_164627 ?auto_164626 ) ( ON ?auto_164628 ?auto_164627 ) ( not ( = ?auto_164625 ?auto_164626 ) ) ( not ( = ?auto_164625 ?auto_164627 ) ) ( not ( = ?auto_164625 ?auto_164628 ) ) ( not ( = ?auto_164625 ?auto_164631 ) ) ( not ( = ?auto_164626 ?auto_164627 ) ) ( not ( = ?auto_164626 ?auto_164628 ) ) ( not ( = ?auto_164626 ?auto_164631 ) ) ( not ( = ?auto_164627 ?auto_164628 ) ) ( not ( = ?auto_164627 ?auto_164631 ) ) ( not ( = ?auto_164628 ?auto_164631 ) ) ( not ( = ?auto_164625 ?auto_164633 ) ) ( not ( = ?auto_164625 ?auto_164629 ) ) ( not ( = ?auto_164626 ?auto_164633 ) ) ( not ( = ?auto_164626 ?auto_164629 ) ) ( not ( = ?auto_164627 ?auto_164633 ) ) ( not ( = ?auto_164627 ?auto_164629 ) ) ( not ( = ?auto_164628 ?auto_164633 ) ) ( not ( = ?auto_164628 ?auto_164629 ) ) ( not ( = ?auto_164631 ?auto_164633 ) ) ( not ( = ?auto_164631 ?auto_164629 ) ) ( not ( = ?auto_164633 ?auto_164629 ) ) ( ON ?auto_164633 ?auto_164631 ) ( not ( = ?auto_164632 ?auto_164629 ) ) ( not ( = ?auto_164625 ?auto_164632 ) ) ( not ( = ?auto_164626 ?auto_164632 ) ) ( not ( = ?auto_164627 ?auto_164632 ) ) ( not ( = ?auto_164628 ?auto_164632 ) ) ( not ( = ?auto_164631 ?auto_164632 ) ) ( not ( = ?auto_164633 ?auto_164632 ) ) ( ON ?auto_164632 ?auto_164630 ) ( CLEAR ?auto_164632 ) ( not ( = ?auto_164625 ?auto_164630 ) ) ( not ( = ?auto_164626 ?auto_164630 ) ) ( not ( = ?auto_164627 ?auto_164630 ) ) ( not ( = ?auto_164628 ?auto_164630 ) ) ( not ( = ?auto_164631 ?auto_164630 ) ) ( not ( = ?auto_164633 ?auto_164630 ) ) ( not ( = ?auto_164629 ?auto_164630 ) ) ( not ( = ?auto_164632 ?auto_164630 ) ) ( HOLDING ?auto_164629 ) ( CLEAR ?auto_164633 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_164625 ?auto_164626 ?auto_164627 ?auto_164628 ?auto_164631 ?auto_164633 ?auto_164629 )
      ( MAKE-4PILE ?auto_164625 ?auto_164626 ?auto_164627 ?auto_164628 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_164634 - BLOCK
      ?auto_164635 - BLOCK
      ?auto_164636 - BLOCK
      ?auto_164637 - BLOCK
    )
    :vars
    (
      ?auto_164638 - BLOCK
      ?auto_164639 - BLOCK
      ?auto_164642 - BLOCK
      ?auto_164641 - BLOCK
      ?auto_164640 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_164638 ?auto_164637 ) ( ON-TABLE ?auto_164634 ) ( ON ?auto_164635 ?auto_164634 ) ( ON ?auto_164636 ?auto_164635 ) ( ON ?auto_164637 ?auto_164636 ) ( not ( = ?auto_164634 ?auto_164635 ) ) ( not ( = ?auto_164634 ?auto_164636 ) ) ( not ( = ?auto_164634 ?auto_164637 ) ) ( not ( = ?auto_164634 ?auto_164638 ) ) ( not ( = ?auto_164635 ?auto_164636 ) ) ( not ( = ?auto_164635 ?auto_164637 ) ) ( not ( = ?auto_164635 ?auto_164638 ) ) ( not ( = ?auto_164636 ?auto_164637 ) ) ( not ( = ?auto_164636 ?auto_164638 ) ) ( not ( = ?auto_164637 ?auto_164638 ) ) ( not ( = ?auto_164634 ?auto_164639 ) ) ( not ( = ?auto_164634 ?auto_164642 ) ) ( not ( = ?auto_164635 ?auto_164639 ) ) ( not ( = ?auto_164635 ?auto_164642 ) ) ( not ( = ?auto_164636 ?auto_164639 ) ) ( not ( = ?auto_164636 ?auto_164642 ) ) ( not ( = ?auto_164637 ?auto_164639 ) ) ( not ( = ?auto_164637 ?auto_164642 ) ) ( not ( = ?auto_164638 ?auto_164639 ) ) ( not ( = ?auto_164638 ?auto_164642 ) ) ( not ( = ?auto_164639 ?auto_164642 ) ) ( ON ?auto_164639 ?auto_164638 ) ( not ( = ?auto_164641 ?auto_164642 ) ) ( not ( = ?auto_164634 ?auto_164641 ) ) ( not ( = ?auto_164635 ?auto_164641 ) ) ( not ( = ?auto_164636 ?auto_164641 ) ) ( not ( = ?auto_164637 ?auto_164641 ) ) ( not ( = ?auto_164638 ?auto_164641 ) ) ( not ( = ?auto_164639 ?auto_164641 ) ) ( ON ?auto_164641 ?auto_164640 ) ( not ( = ?auto_164634 ?auto_164640 ) ) ( not ( = ?auto_164635 ?auto_164640 ) ) ( not ( = ?auto_164636 ?auto_164640 ) ) ( not ( = ?auto_164637 ?auto_164640 ) ) ( not ( = ?auto_164638 ?auto_164640 ) ) ( not ( = ?auto_164639 ?auto_164640 ) ) ( not ( = ?auto_164642 ?auto_164640 ) ) ( not ( = ?auto_164641 ?auto_164640 ) ) ( CLEAR ?auto_164639 ) ( ON ?auto_164642 ?auto_164641 ) ( CLEAR ?auto_164642 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_164640 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_164640 ?auto_164641 )
      ( MAKE-4PILE ?auto_164634 ?auto_164635 ?auto_164636 ?auto_164637 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_164643 - BLOCK
      ?auto_164644 - BLOCK
      ?auto_164645 - BLOCK
      ?auto_164646 - BLOCK
    )
    :vars
    (
      ?auto_164648 - BLOCK
      ?auto_164650 - BLOCK
      ?auto_164649 - BLOCK
      ?auto_164647 - BLOCK
      ?auto_164651 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_164648 ?auto_164646 ) ( ON-TABLE ?auto_164643 ) ( ON ?auto_164644 ?auto_164643 ) ( ON ?auto_164645 ?auto_164644 ) ( ON ?auto_164646 ?auto_164645 ) ( not ( = ?auto_164643 ?auto_164644 ) ) ( not ( = ?auto_164643 ?auto_164645 ) ) ( not ( = ?auto_164643 ?auto_164646 ) ) ( not ( = ?auto_164643 ?auto_164648 ) ) ( not ( = ?auto_164644 ?auto_164645 ) ) ( not ( = ?auto_164644 ?auto_164646 ) ) ( not ( = ?auto_164644 ?auto_164648 ) ) ( not ( = ?auto_164645 ?auto_164646 ) ) ( not ( = ?auto_164645 ?auto_164648 ) ) ( not ( = ?auto_164646 ?auto_164648 ) ) ( not ( = ?auto_164643 ?auto_164650 ) ) ( not ( = ?auto_164643 ?auto_164649 ) ) ( not ( = ?auto_164644 ?auto_164650 ) ) ( not ( = ?auto_164644 ?auto_164649 ) ) ( not ( = ?auto_164645 ?auto_164650 ) ) ( not ( = ?auto_164645 ?auto_164649 ) ) ( not ( = ?auto_164646 ?auto_164650 ) ) ( not ( = ?auto_164646 ?auto_164649 ) ) ( not ( = ?auto_164648 ?auto_164650 ) ) ( not ( = ?auto_164648 ?auto_164649 ) ) ( not ( = ?auto_164650 ?auto_164649 ) ) ( not ( = ?auto_164647 ?auto_164649 ) ) ( not ( = ?auto_164643 ?auto_164647 ) ) ( not ( = ?auto_164644 ?auto_164647 ) ) ( not ( = ?auto_164645 ?auto_164647 ) ) ( not ( = ?auto_164646 ?auto_164647 ) ) ( not ( = ?auto_164648 ?auto_164647 ) ) ( not ( = ?auto_164650 ?auto_164647 ) ) ( ON ?auto_164647 ?auto_164651 ) ( not ( = ?auto_164643 ?auto_164651 ) ) ( not ( = ?auto_164644 ?auto_164651 ) ) ( not ( = ?auto_164645 ?auto_164651 ) ) ( not ( = ?auto_164646 ?auto_164651 ) ) ( not ( = ?auto_164648 ?auto_164651 ) ) ( not ( = ?auto_164650 ?auto_164651 ) ) ( not ( = ?auto_164649 ?auto_164651 ) ) ( not ( = ?auto_164647 ?auto_164651 ) ) ( ON ?auto_164649 ?auto_164647 ) ( CLEAR ?auto_164649 ) ( ON-TABLE ?auto_164651 ) ( HOLDING ?auto_164650 ) ( CLEAR ?auto_164648 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_164643 ?auto_164644 ?auto_164645 ?auto_164646 ?auto_164648 ?auto_164650 )
      ( MAKE-4PILE ?auto_164643 ?auto_164644 ?auto_164645 ?auto_164646 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_164652 - BLOCK
      ?auto_164653 - BLOCK
      ?auto_164654 - BLOCK
      ?auto_164655 - BLOCK
    )
    :vars
    (
      ?auto_164656 - BLOCK
      ?auto_164658 - BLOCK
      ?auto_164657 - BLOCK
      ?auto_164660 - BLOCK
      ?auto_164659 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_164656 ?auto_164655 ) ( ON-TABLE ?auto_164652 ) ( ON ?auto_164653 ?auto_164652 ) ( ON ?auto_164654 ?auto_164653 ) ( ON ?auto_164655 ?auto_164654 ) ( not ( = ?auto_164652 ?auto_164653 ) ) ( not ( = ?auto_164652 ?auto_164654 ) ) ( not ( = ?auto_164652 ?auto_164655 ) ) ( not ( = ?auto_164652 ?auto_164656 ) ) ( not ( = ?auto_164653 ?auto_164654 ) ) ( not ( = ?auto_164653 ?auto_164655 ) ) ( not ( = ?auto_164653 ?auto_164656 ) ) ( not ( = ?auto_164654 ?auto_164655 ) ) ( not ( = ?auto_164654 ?auto_164656 ) ) ( not ( = ?auto_164655 ?auto_164656 ) ) ( not ( = ?auto_164652 ?auto_164658 ) ) ( not ( = ?auto_164652 ?auto_164657 ) ) ( not ( = ?auto_164653 ?auto_164658 ) ) ( not ( = ?auto_164653 ?auto_164657 ) ) ( not ( = ?auto_164654 ?auto_164658 ) ) ( not ( = ?auto_164654 ?auto_164657 ) ) ( not ( = ?auto_164655 ?auto_164658 ) ) ( not ( = ?auto_164655 ?auto_164657 ) ) ( not ( = ?auto_164656 ?auto_164658 ) ) ( not ( = ?auto_164656 ?auto_164657 ) ) ( not ( = ?auto_164658 ?auto_164657 ) ) ( not ( = ?auto_164660 ?auto_164657 ) ) ( not ( = ?auto_164652 ?auto_164660 ) ) ( not ( = ?auto_164653 ?auto_164660 ) ) ( not ( = ?auto_164654 ?auto_164660 ) ) ( not ( = ?auto_164655 ?auto_164660 ) ) ( not ( = ?auto_164656 ?auto_164660 ) ) ( not ( = ?auto_164658 ?auto_164660 ) ) ( ON ?auto_164660 ?auto_164659 ) ( not ( = ?auto_164652 ?auto_164659 ) ) ( not ( = ?auto_164653 ?auto_164659 ) ) ( not ( = ?auto_164654 ?auto_164659 ) ) ( not ( = ?auto_164655 ?auto_164659 ) ) ( not ( = ?auto_164656 ?auto_164659 ) ) ( not ( = ?auto_164658 ?auto_164659 ) ) ( not ( = ?auto_164657 ?auto_164659 ) ) ( not ( = ?auto_164660 ?auto_164659 ) ) ( ON ?auto_164657 ?auto_164660 ) ( ON-TABLE ?auto_164659 ) ( CLEAR ?auto_164656 ) ( ON ?auto_164658 ?auto_164657 ) ( CLEAR ?auto_164658 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_164659 ?auto_164660 ?auto_164657 )
      ( MAKE-4PILE ?auto_164652 ?auto_164653 ?auto_164654 ?auto_164655 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_164679 - BLOCK
      ?auto_164680 - BLOCK
      ?auto_164681 - BLOCK
      ?auto_164682 - BLOCK
    )
    :vars
    (
      ?auto_164683 - BLOCK
      ?auto_164685 - BLOCK
      ?auto_164684 - BLOCK
      ?auto_164686 - BLOCK
      ?auto_164687 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_164679 ) ( ON ?auto_164680 ?auto_164679 ) ( ON ?auto_164681 ?auto_164680 ) ( not ( = ?auto_164679 ?auto_164680 ) ) ( not ( = ?auto_164679 ?auto_164681 ) ) ( not ( = ?auto_164679 ?auto_164682 ) ) ( not ( = ?auto_164679 ?auto_164683 ) ) ( not ( = ?auto_164680 ?auto_164681 ) ) ( not ( = ?auto_164680 ?auto_164682 ) ) ( not ( = ?auto_164680 ?auto_164683 ) ) ( not ( = ?auto_164681 ?auto_164682 ) ) ( not ( = ?auto_164681 ?auto_164683 ) ) ( not ( = ?auto_164682 ?auto_164683 ) ) ( not ( = ?auto_164679 ?auto_164685 ) ) ( not ( = ?auto_164679 ?auto_164684 ) ) ( not ( = ?auto_164680 ?auto_164685 ) ) ( not ( = ?auto_164680 ?auto_164684 ) ) ( not ( = ?auto_164681 ?auto_164685 ) ) ( not ( = ?auto_164681 ?auto_164684 ) ) ( not ( = ?auto_164682 ?auto_164685 ) ) ( not ( = ?auto_164682 ?auto_164684 ) ) ( not ( = ?auto_164683 ?auto_164685 ) ) ( not ( = ?auto_164683 ?auto_164684 ) ) ( not ( = ?auto_164685 ?auto_164684 ) ) ( not ( = ?auto_164686 ?auto_164684 ) ) ( not ( = ?auto_164679 ?auto_164686 ) ) ( not ( = ?auto_164680 ?auto_164686 ) ) ( not ( = ?auto_164681 ?auto_164686 ) ) ( not ( = ?auto_164682 ?auto_164686 ) ) ( not ( = ?auto_164683 ?auto_164686 ) ) ( not ( = ?auto_164685 ?auto_164686 ) ) ( ON ?auto_164686 ?auto_164687 ) ( not ( = ?auto_164679 ?auto_164687 ) ) ( not ( = ?auto_164680 ?auto_164687 ) ) ( not ( = ?auto_164681 ?auto_164687 ) ) ( not ( = ?auto_164682 ?auto_164687 ) ) ( not ( = ?auto_164683 ?auto_164687 ) ) ( not ( = ?auto_164685 ?auto_164687 ) ) ( not ( = ?auto_164684 ?auto_164687 ) ) ( not ( = ?auto_164686 ?auto_164687 ) ) ( ON ?auto_164684 ?auto_164686 ) ( ON-TABLE ?auto_164687 ) ( ON ?auto_164685 ?auto_164684 ) ( ON ?auto_164683 ?auto_164685 ) ( CLEAR ?auto_164683 ) ( HOLDING ?auto_164682 ) ( CLEAR ?auto_164681 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_164679 ?auto_164680 ?auto_164681 ?auto_164682 ?auto_164683 )
      ( MAKE-4PILE ?auto_164679 ?auto_164680 ?auto_164681 ?auto_164682 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_164688 - BLOCK
      ?auto_164689 - BLOCK
      ?auto_164690 - BLOCK
      ?auto_164691 - BLOCK
    )
    :vars
    (
      ?auto_164695 - BLOCK
      ?auto_164696 - BLOCK
      ?auto_164692 - BLOCK
      ?auto_164694 - BLOCK
      ?auto_164693 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_164688 ) ( ON ?auto_164689 ?auto_164688 ) ( ON ?auto_164690 ?auto_164689 ) ( not ( = ?auto_164688 ?auto_164689 ) ) ( not ( = ?auto_164688 ?auto_164690 ) ) ( not ( = ?auto_164688 ?auto_164691 ) ) ( not ( = ?auto_164688 ?auto_164695 ) ) ( not ( = ?auto_164689 ?auto_164690 ) ) ( not ( = ?auto_164689 ?auto_164691 ) ) ( not ( = ?auto_164689 ?auto_164695 ) ) ( not ( = ?auto_164690 ?auto_164691 ) ) ( not ( = ?auto_164690 ?auto_164695 ) ) ( not ( = ?auto_164691 ?auto_164695 ) ) ( not ( = ?auto_164688 ?auto_164696 ) ) ( not ( = ?auto_164688 ?auto_164692 ) ) ( not ( = ?auto_164689 ?auto_164696 ) ) ( not ( = ?auto_164689 ?auto_164692 ) ) ( not ( = ?auto_164690 ?auto_164696 ) ) ( not ( = ?auto_164690 ?auto_164692 ) ) ( not ( = ?auto_164691 ?auto_164696 ) ) ( not ( = ?auto_164691 ?auto_164692 ) ) ( not ( = ?auto_164695 ?auto_164696 ) ) ( not ( = ?auto_164695 ?auto_164692 ) ) ( not ( = ?auto_164696 ?auto_164692 ) ) ( not ( = ?auto_164694 ?auto_164692 ) ) ( not ( = ?auto_164688 ?auto_164694 ) ) ( not ( = ?auto_164689 ?auto_164694 ) ) ( not ( = ?auto_164690 ?auto_164694 ) ) ( not ( = ?auto_164691 ?auto_164694 ) ) ( not ( = ?auto_164695 ?auto_164694 ) ) ( not ( = ?auto_164696 ?auto_164694 ) ) ( ON ?auto_164694 ?auto_164693 ) ( not ( = ?auto_164688 ?auto_164693 ) ) ( not ( = ?auto_164689 ?auto_164693 ) ) ( not ( = ?auto_164690 ?auto_164693 ) ) ( not ( = ?auto_164691 ?auto_164693 ) ) ( not ( = ?auto_164695 ?auto_164693 ) ) ( not ( = ?auto_164696 ?auto_164693 ) ) ( not ( = ?auto_164692 ?auto_164693 ) ) ( not ( = ?auto_164694 ?auto_164693 ) ) ( ON ?auto_164692 ?auto_164694 ) ( ON-TABLE ?auto_164693 ) ( ON ?auto_164696 ?auto_164692 ) ( ON ?auto_164695 ?auto_164696 ) ( CLEAR ?auto_164690 ) ( ON ?auto_164691 ?auto_164695 ) ( CLEAR ?auto_164691 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_164693 ?auto_164694 ?auto_164692 ?auto_164696 ?auto_164695 )
      ( MAKE-4PILE ?auto_164688 ?auto_164689 ?auto_164690 ?auto_164691 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_164697 - BLOCK
      ?auto_164698 - BLOCK
      ?auto_164699 - BLOCK
      ?auto_164700 - BLOCK
    )
    :vars
    (
      ?auto_164701 - BLOCK
      ?auto_164705 - BLOCK
      ?auto_164702 - BLOCK
      ?auto_164703 - BLOCK
      ?auto_164704 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_164697 ) ( ON ?auto_164698 ?auto_164697 ) ( not ( = ?auto_164697 ?auto_164698 ) ) ( not ( = ?auto_164697 ?auto_164699 ) ) ( not ( = ?auto_164697 ?auto_164700 ) ) ( not ( = ?auto_164697 ?auto_164701 ) ) ( not ( = ?auto_164698 ?auto_164699 ) ) ( not ( = ?auto_164698 ?auto_164700 ) ) ( not ( = ?auto_164698 ?auto_164701 ) ) ( not ( = ?auto_164699 ?auto_164700 ) ) ( not ( = ?auto_164699 ?auto_164701 ) ) ( not ( = ?auto_164700 ?auto_164701 ) ) ( not ( = ?auto_164697 ?auto_164705 ) ) ( not ( = ?auto_164697 ?auto_164702 ) ) ( not ( = ?auto_164698 ?auto_164705 ) ) ( not ( = ?auto_164698 ?auto_164702 ) ) ( not ( = ?auto_164699 ?auto_164705 ) ) ( not ( = ?auto_164699 ?auto_164702 ) ) ( not ( = ?auto_164700 ?auto_164705 ) ) ( not ( = ?auto_164700 ?auto_164702 ) ) ( not ( = ?auto_164701 ?auto_164705 ) ) ( not ( = ?auto_164701 ?auto_164702 ) ) ( not ( = ?auto_164705 ?auto_164702 ) ) ( not ( = ?auto_164703 ?auto_164702 ) ) ( not ( = ?auto_164697 ?auto_164703 ) ) ( not ( = ?auto_164698 ?auto_164703 ) ) ( not ( = ?auto_164699 ?auto_164703 ) ) ( not ( = ?auto_164700 ?auto_164703 ) ) ( not ( = ?auto_164701 ?auto_164703 ) ) ( not ( = ?auto_164705 ?auto_164703 ) ) ( ON ?auto_164703 ?auto_164704 ) ( not ( = ?auto_164697 ?auto_164704 ) ) ( not ( = ?auto_164698 ?auto_164704 ) ) ( not ( = ?auto_164699 ?auto_164704 ) ) ( not ( = ?auto_164700 ?auto_164704 ) ) ( not ( = ?auto_164701 ?auto_164704 ) ) ( not ( = ?auto_164705 ?auto_164704 ) ) ( not ( = ?auto_164702 ?auto_164704 ) ) ( not ( = ?auto_164703 ?auto_164704 ) ) ( ON ?auto_164702 ?auto_164703 ) ( ON-TABLE ?auto_164704 ) ( ON ?auto_164705 ?auto_164702 ) ( ON ?auto_164701 ?auto_164705 ) ( ON ?auto_164700 ?auto_164701 ) ( CLEAR ?auto_164700 ) ( HOLDING ?auto_164699 ) ( CLEAR ?auto_164698 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_164697 ?auto_164698 ?auto_164699 )
      ( MAKE-4PILE ?auto_164697 ?auto_164698 ?auto_164699 ?auto_164700 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_164706 - BLOCK
      ?auto_164707 - BLOCK
      ?auto_164708 - BLOCK
      ?auto_164709 - BLOCK
    )
    :vars
    (
      ?auto_164710 - BLOCK
      ?auto_164714 - BLOCK
      ?auto_164713 - BLOCK
      ?auto_164712 - BLOCK
      ?auto_164711 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_164706 ) ( ON ?auto_164707 ?auto_164706 ) ( not ( = ?auto_164706 ?auto_164707 ) ) ( not ( = ?auto_164706 ?auto_164708 ) ) ( not ( = ?auto_164706 ?auto_164709 ) ) ( not ( = ?auto_164706 ?auto_164710 ) ) ( not ( = ?auto_164707 ?auto_164708 ) ) ( not ( = ?auto_164707 ?auto_164709 ) ) ( not ( = ?auto_164707 ?auto_164710 ) ) ( not ( = ?auto_164708 ?auto_164709 ) ) ( not ( = ?auto_164708 ?auto_164710 ) ) ( not ( = ?auto_164709 ?auto_164710 ) ) ( not ( = ?auto_164706 ?auto_164714 ) ) ( not ( = ?auto_164706 ?auto_164713 ) ) ( not ( = ?auto_164707 ?auto_164714 ) ) ( not ( = ?auto_164707 ?auto_164713 ) ) ( not ( = ?auto_164708 ?auto_164714 ) ) ( not ( = ?auto_164708 ?auto_164713 ) ) ( not ( = ?auto_164709 ?auto_164714 ) ) ( not ( = ?auto_164709 ?auto_164713 ) ) ( not ( = ?auto_164710 ?auto_164714 ) ) ( not ( = ?auto_164710 ?auto_164713 ) ) ( not ( = ?auto_164714 ?auto_164713 ) ) ( not ( = ?auto_164712 ?auto_164713 ) ) ( not ( = ?auto_164706 ?auto_164712 ) ) ( not ( = ?auto_164707 ?auto_164712 ) ) ( not ( = ?auto_164708 ?auto_164712 ) ) ( not ( = ?auto_164709 ?auto_164712 ) ) ( not ( = ?auto_164710 ?auto_164712 ) ) ( not ( = ?auto_164714 ?auto_164712 ) ) ( ON ?auto_164712 ?auto_164711 ) ( not ( = ?auto_164706 ?auto_164711 ) ) ( not ( = ?auto_164707 ?auto_164711 ) ) ( not ( = ?auto_164708 ?auto_164711 ) ) ( not ( = ?auto_164709 ?auto_164711 ) ) ( not ( = ?auto_164710 ?auto_164711 ) ) ( not ( = ?auto_164714 ?auto_164711 ) ) ( not ( = ?auto_164713 ?auto_164711 ) ) ( not ( = ?auto_164712 ?auto_164711 ) ) ( ON ?auto_164713 ?auto_164712 ) ( ON-TABLE ?auto_164711 ) ( ON ?auto_164714 ?auto_164713 ) ( ON ?auto_164710 ?auto_164714 ) ( ON ?auto_164709 ?auto_164710 ) ( CLEAR ?auto_164707 ) ( ON ?auto_164708 ?auto_164709 ) ( CLEAR ?auto_164708 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_164711 ?auto_164712 ?auto_164713 ?auto_164714 ?auto_164710 ?auto_164709 )
      ( MAKE-4PILE ?auto_164706 ?auto_164707 ?auto_164708 ?auto_164709 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_164715 - BLOCK
      ?auto_164716 - BLOCK
      ?auto_164717 - BLOCK
      ?auto_164718 - BLOCK
    )
    :vars
    (
      ?auto_164720 - BLOCK
      ?auto_164723 - BLOCK
      ?auto_164719 - BLOCK
      ?auto_164721 - BLOCK
      ?auto_164722 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_164715 ) ( not ( = ?auto_164715 ?auto_164716 ) ) ( not ( = ?auto_164715 ?auto_164717 ) ) ( not ( = ?auto_164715 ?auto_164718 ) ) ( not ( = ?auto_164715 ?auto_164720 ) ) ( not ( = ?auto_164716 ?auto_164717 ) ) ( not ( = ?auto_164716 ?auto_164718 ) ) ( not ( = ?auto_164716 ?auto_164720 ) ) ( not ( = ?auto_164717 ?auto_164718 ) ) ( not ( = ?auto_164717 ?auto_164720 ) ) ( not ( = ?auto_164718 ?auto_164720 ) ) ( not ( = ?auto_164715 ?auto_164723 ) ) ( not ( = ?auto_164715 ?auto_164719 ) ) ( not ( = ?auto_164716 ?auto_164723 ) ) ( not ( = ?auto_164716 ?auto_164719 ) ) ( not ( = ?auto_164717 ?auto_164723 ) ) ( not ( = ?auto_164717 ?auto_164719 ) ) ( not ( = ?auto_164718 ?auto_164723 ) ) ( not ( = ?auto_164718 ?auto_164719 ) ) ( not ( = ?auto_164720 ?auto_164723 ) ) ( not ( = ?auto_164720 ?auto_164719 ) ) ( not ( = ?auto_164723 ?auto_164719 ) ) ( not ( = ?auto_164721 ?auto_164719 ) ) ( not ( = ?auto_164715 ?auto_164721 ) ) ( not ( = ?auto_164716 ?auto_164721 ) ) ( not ( = ?auto_164717 ?auto_164721 ) ) ( not ( = ?auto_164718 ?auto_164721 ) ) ( not ( = ?auto_164720 ?auto_164721 ) ) ( not ( = ?auto_164723 ?auto_164721 ) ) ( ON ?auto_164721 ?auto_164722 ) ( not ( = ?auto_164715 ?auto_164722 ) ) ( not ( = ?auto_164716 ?auto_164722 ) ) ( not ( = ?auto_164717 ?auto_164722 ) ) ( not ( = ?auto_164718 ?auto_164722 ) ) ( not ( = ?auto_164720 ?auto_164722 ) ) ( not ( = ?auto_164723 ?auto_164722 ) ) ( not ( = ?auto_164719 ?auto_164722 ) ) ( not ( = ?auto_164721 ?auto_164722 ) ) ( ON ?auto_164719 ?auto_164721 ) ( ON-TABLE ?auto_164722 ) ( ON ?auto_164723 ?auto_164719 ) ( ON ?auto_164720 ?auto_164723 ) ( ON ?auto_164718 ?auto_164720 ) ( ON ?auto_164717 ?auto_164718 ) ( CLEAR ?auto_164717 ) ( HOLDING ?auto_164716 ) ( CLEAR ?auto_164715 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_164715 ?auto_164716 )
      ( MAKE-4PILE ?auto_164715 ?auto_164716 ?auto_164717 ?auto_164718 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_164724 - BLOCK
      ?auto_164725 - BLOCK
      ?auto_164726 - BLOCK
      ?auto_164727 - BLOCK
    )
    :vars
    (
      ?auto_164732 - BLOCK
      ?auto_164728 - BLOCK
      ?auto_164730 - BLOCK
      ?auto_164731 - BLOCK
      ?auto_164729 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_164724 ) ( not ( = ?auto_164724 ?auto_164725 ) ) ( not ( = ?auto_164724 ?auto_164726 ) ) ( not ( = ?auto_164724 ?auto_164727 ) ) ( not ( = ?auto_164724 ?auto_164732 ) ) ( not ( = ?auto_164725 ?auto_164726 ) ) ( not ( = ?auto_164725 ?auto_164727 ) ) ( not ( = ?auto_164725 ?auto_164732 ) ) ( not ( = ?auto_164726 ?auto_164727 ) ) ( not ( = ?auto_164726 ?auto_164732 ) ) ( not ( = ?auto_164727 ?auto_164732 ) ) ( not ( = ?auto_164724 ?auto_164728 ) ) ( not ( = ?auto_164724 ?auto_164730 ) ) ( not ( = ?auto_164725 ?auto_164728 ) ) ( not ( = ?auto_164725 ?auto_164730 ) ) ( not ( = ?auto_164726 ?auto_164728 ) ) ( not ( = ?auto_164726 ?auto_164730 ) ) ( not ( = ?auto_164727 ?auto_164728 ) ) ( not ( = ?auto_164727 ?auto_164730 ) ) ( not ( = ?auto_164732 ?auto_164728 ) ) ( not ( = ?auto_164732 ?auto_164730 ) ) ( not ( = ?auto_164728 ?auto_164730 ) ) ( not ( = ?auto_164731 ?auto_164730 ) ) ( not ( = ?auto_164724 ?auto_164731 ) ) ( not ( = ?auto_164725 ?auto_164731 ) ) ( not ( = ?auto_164726 ?auto_164731 ) ) ( not ( = ?auto_164727 ?auto_164731 ) ) ( not ( = ?auto_164732 ?auto_164731 ) ) ( not ( = ?auto_164728 ?auto_164731 ) ) ( ON ?auto_164731 ?auto_164729 ) ( not ( = ?auto_164724 ?auto_164729 ) ) ( not ( = ?auto_164725 ?auto_164729 ) ) ( not ( = ?auto_164726 ?auto_164729 ) ) ( not ( = ?auto_164727 ?auto_164729 ) ) ( not ( = ?auto_164732 ?auto_164729 ) ) ( not ( = ?auto_164728 ?auto_164729 ) ) ( not ( = ?auto_164730 ?auto_164729 ) ) ( not ( = ?auto_164731 ?auto_164729 ) ) ( ON ?auto_164730 ?auto_164731 ) ( ON-TABLE ?auto_164729 ) ( ON ?auto_164728 ?auto_164730 ) ( ON ?auto_164732 ?auto_164728 ) ( ON ?auto_164727 ?auto_164732 ) ( ON ?auto_164726 ?auto_164727 ) ( CLEAR ?auto_164724 ) ( ON ?auto_164725 ?auto_164726 ) ( CLEAR ?auto_164725 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_164729 ?auto_164731 ?auto_164730 ?auto_164728 ?auto_164732 ?auto_164727 ?auto_164726 )
      ( MAKE-4PILE ?auto_164724 ?auto_164725 ?auto_164726 ?auto_164727 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_164733 - BLOCK
      ?auto_164734 - BLOCK
      ?auto_164735 - BLOCK
      ?auto_164736 - BLOCK
    )
    :vars
    (
      ?auto_164739 - BLOCK
      ?auto_164741 - BLOCK
      ?auto_164737 - BLOCK
      ?auto_164740 - BLOCK
      ?auto_164738 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_164733 ?auto_164734 ) ) ( not ( = ?auto_164733 ?auto_164735 ) ) ( not ( = ?auto_164733 ?auto_164736 ) ) ( not ( = ?auto_164733 ?auto_164739 ) ) ( not ( = ?auto_164734 ?auto_164735 ) ) ( not ( = ?auto_164734 ?auto_164736 ) ) ( not ( = ?auto_164734 ?auto_164739 ) ) ( not ( = ?auto_164735 ?auto_164736 ) ) ( not ( = ?auto_164735 ?auto_164739 ) ) ( not ( = ?auto_164736 ?auto_164739 ) ) ( not ( = ?auto_164733 ?auto_164741 ) ) ( not ( = ?auto_164733 ?auto_164737 ) ) ( not ( = ?auto_164734 ?auto_164741 ) ) ( not ( = ?auto_164734 ?auto_164737 ) ) ( not ( = ?auto_164735 ?auto_164741 ) ) ( not ( = ?auto_164735 ?auto_164737 ) ) ( not ( = ?auto_164736 ?auto_164741 ) ) ( not ( = ?auto_164736 ?auto_164737 ) ) ( not ( = ?auto_164739 ?auto_164741 ) ) ( not ( = ?auto_164739 ?auto_164737 ) ) ( not ( = ?auto_164741 ?auto_164737 ) ) ( not ( = ?auto_164740 ?auto_164737 ) ) ( not ( = ?auto_164733 ?auto_164740 ) ) ( not ( = ?auto_164734 ?auto_164740 ) ) ( not ( = ?auto_164735 ?auto_164740 ) ) ( not ( = ?auto_164736 ?auto_164740 ) ) ( not ( = ?auto_164739 ?auto_164740 ) ) ( not ( = ?auto_164741 ?auto_164740 ) ) ( ON ?auto_164740 ?auto_164738 ) ( not ( = ?auto_164733 ?auto_164738 ) ) ( not ( = ?auto_164734 ?auto_164738 ) ) ( not ( = ?auto_164735 ?auto_164738 ) ) ( not ( = ?auto_164736 ?auto_164738 ) ) ( not ( = ?auto_164739 ?auto_164738 ) ) ( not ( = ?auto_164741 ?auto_164738 ) ) ( not ( = ?auto_164737 ?auto_164738 ) ) ( not ( = ?auto_164740 ?auto_164738 ) ) ( ON ?auto_164737 ?auto_164740 ) ( ON-TABLE ?auto_164738 ) ( ON ?auto_164741 ?auto_164737 ) ( ON ?auto_164739 ?auto_164741 ) ( ON ?auto_164736 ?auto_164739 ) ( ON ?auto_164735 ?auto_164736 ) ( ON ?auto_164734 ?auto_164735 ) ( CLEAR ?auto_164734 ) ( HOLDING ?auto_164733 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_164733 )
      ( MAKE-4PILE ?auto_164733 ?auto_164734 ?auto_164735 ?auto_164736 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_164742 - BLOCK
      ?auto_164743 - BLOCK
      ?auto_164744 - BLOCK
      ?auto_164745 - BLOCK
    )
    :vars
    (
      ?auto_164746 - BLOCK
      ?auto_164747 - BLOCK
      ?auto_164748 - BLOCK
      ?auto_164750 - BLOCK
      ?auto_164749 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_164742 ?auto_164743 ) ) ( not ( = ?auto_164742 ?auto_164744 ) ) ( not ( = ?auto_164742 ?auto_164745 ) ) ( not ( = ?auto_164742 ?auto_164746 ) ) ( not ( = ?auto_164743 ?auto_164744 ) ) ( not ( = ?auto_164743 ?auto_164745 ) ) ( not ( = ?auto_164743 ?auto_164746 ) ) ( not ( = ?auto_164744 ?auto_164745 ) ) ( not ( = ?auto_164744 ?auto_164746 ) ) ( not ( = ?auto_164745 ?auto_164746 ) ) ( not ( = ?auto_164742 ?auto_164747 ) ) ( not ( = ?auto_164742 ?auto_164748 ) ) ( not ( = ?auto_164743 ?auto_164747 ) ) ( not ( = ?auto_164743 ?auto_164748 ) ) ( not ( = ?auto_164744 ?auto_164747 ) ) ( not ( = ?auto_164744 ?auto_164748 ) ) ( not ( = ?auto_164745 ?auto_164747 ) ) ( not ( = ?auto_164745 ?auto_164748 ) ) ( not ( = ?auto_164746 ?auto_164747 ) ) ( not ( = ?auto_164746 ?auto_164748 ) ) ( not ( = ?auto_164747 ?auto_164748 ) ) ( not ( = ?auto_164750 ?auto_164748 ) ) ( not ( = ?auto_164742 ?auto_164750 ) ) ( not ( = ?auto_164743 ?auto_164750 ) ) ( not ( = ?auto_164744 ?auto_164750 ) ) ( not ( = ?auto_164745 ?auto_164750 ) ) ( not ( = ?auto_164746 ?auto_164750 ) ) ( not ( = ?auto_164747 ?auto_164750 ) ) ( ON ?auto_164750 ?auto_164749 ) ( not ( = ?auto_164742 ?auto_164749 ) ) ( not ( = ?auto_164743 ?auto_164749 ) ) ( not ( = ?auto_164744 ?auto_164749 ) ) ( not ( = ?auto_164745 ?auto_164749 ) ) ( not ( = ?auto_164746 ?auto_164749 ) ) ( not ( = ?auto_164747 ?auto_164749 ) ) ( not ( = ?auto_164748 ?auto_164749 ) ) ( not ( = ?auto_164750 ?auto_164749 ) ) ( ON ?auto_164748 ?auto_164750 ) ( ON-TABLE ?auto_164749 ) ( ON ?auto_164747 ?auto_164748 ) ( ON ?auto_164746 ?auto_164747 ) ( ON ?auto_164745 ?auto_164746 ) ( ON ?auto_164744 ?auto_164745 ) ( ON ?auto_164743 ?auto_164744 ) ( ON ?auto_164742 ?auto_164743 ) ( CLEAR ?auto_164742 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_164749 ?auto_164750 ?auto_164748 ?auto_164747 ?auto_164746 ?auto_164745 ?auto_164744 ?auto_164743 )
      ( MAKE-4PILE ?auto_164742 ?auto_164743 ?auto_164744 ?auto_164745 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_164755 - BLOCK
      ?auto_164756 - BLOCK
      ?auto_164757 - BLOCK
      ?auto_164758 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_164758 ) ( CLEAR ?auto_164757 ) ( ON-TABLE ?auto_164755 ) ( ON ?auto_164756 ?auto_164755 ) ( ON ?auto_164757 ?auto_164756 ) ( not ( = ?auto_164755 ?auto_164756 ) ) ( not ( = ?auto_164755 ?auto_164757 ) ) ( not ( = ?auto_164755 ?auto_164758 ) ) ( not ( = ?auto_164756 ?auto_164757 ) ) ( not ( = ?auto_164756 ?auto_164758 ) ) ( not ( = ?auto_164757 ?auto_164758 ) ) )
    :subtasks
    ( ( !STACK ?auto_164758 ?auto_164757 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_164759 - BLOCK
      ?auto_164760 - BLOCK
      ?auto_164761 - BLOCK
      ?auto_164762 - BLOCK
    )
    :vars
    (
      ?auto_164763 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_164761 ) ( ON-TABLE ?auto_164759 ) ( ON ?auto_164760 ?auto_164759 ) ( ON ?auto_164761 ?auto_164760 ) ( not ( = ?auto_164759 ?auto_164760 ) ) ( not ( = ?auto_164759 ?auto_164761 ) ) ( not ( = ?auto_164759 ?auto_164762 ) ) ( not ( = ?auto_164760 ?auto_164761 ) ) ( not ( = ?auto_164760 ?auto_164762 ) ) ( not ( = ?auto_164761 ?auto_164762 ) ) ( ON ?auto_164762 ?auto_164763 ) ( CLEAR ?auto_164762 ) ( HAND-EMPTY ) ( not ( = ?auto_164759 ?auto_164763 ) ) ( not ( = ?auto_164760 ?auto_164763 ) ) ( not ( = ?auto_164761 ?auto_164763 ) ) ( not ( = ?auto_164762 ?auto_164763 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_164762 ?auto_164763 )
      ( MAKE-4PILE ?auto_164759 ?auto_164760 ?auto_164761 ?auto_164762 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_164764 - BLOCK
      ?auto_164765 - BLOCK
      ?auto_164766 - BLOCK
      ?auto_164767 - BLOCK
    )
    :vars
    (
      ?auto_164768 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_164764 ) ( ON ?auto_164765 ?auto_164764 ) ( not ( = ?auto_164764 ?auto_164765 ) ) ( not ( = ?auto_164764 ?auto_164766 ) ) ( not ( = ?auto_164764 ?auto_164767 ) ) ( not ( = ?auto_164765 ?auto_164766 ) ) ( not ( = ?auto_164765 ?auto_164767 ) ) ( not ( = ?auto_164766 ?auto_164767 ) ) ( ON ?auto_164767 ?auto_164768 ) ( CLEAR ?auto_164767 ) ( not ( = ?auto_164764 ?auto_164768 ) ) ( not ( = ?auto_164765 ?auto_164768 ) ) ( not ( = ?auto_164766 ?auto_164768 ) ) ( not ( = ?auto_164767 ?auto_164768 ) ) ( HOLDING ?auto_164766 ) ( CLEAR ?auto_164765 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_164764 ?auto_164765 ?auto_164766 )
      ( MAKE-4PILE ?auto_164764 ?auto_164765 ?auto_164766 ?auto_164767 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_164769 - BLOCK
      ?auto_164770 - BLOCK
      ?auto_164771 - BLOCK
      ?auto_164772 - BLOCK
    )
    :vars
    (
      ?auto_164773 - BLOCK
      ?auto_164776 - BLOCK
      ?auto_164774 - BLOCK
      ?auto_164775 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_164769 ) ( ON ?auto_164770 ?auto_164769 ) ( not ( = ?auto_164769 ?auto_164770 ) ) ( not ( = ?auto_164769 ?auto_164771 ) ) ( not ( = ?auto_164769 ?auto_164772 ) ) ( not ( = ?auto_164770 ?auto_164771 ) ) ( not ( = ?auto_164770 ?auto_164772 ) ) ( not ( = ?auto_164771 ?auto_164772 ) ) ( ON ?auto_164772 ?auto_164773 ) ( not ( = ?auto_164769 ?auto_164773 ) ) ( not ( = ?auto_164770 ?auto_164773 ) ) ( not ( = ?auto_164771 ?auto_164773 ) ) ( not ( = ?auto_164772 ?auto_164773 ) ) ( CLEAR ?auto_164770 ) ( ON ?auto_164771 ?auto_164772 ) ( CLEAR ?auto_164771 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_164776 ) ( ON ?auto_164774 ?auto_164776 ) ( ON ?auto_164775 ?auto_164774 ) ( ON ?auto_164773 ?auto_164775 ) ( not ( = ?auto_164776 ?auto_164774 ) ) ( not ( = ?auto_164776 ?auto_164775 ) ) ( not ( = ?auto_164776 ?auto_164773 ) ) ( not ( = ?auto_164776 ?auto_164772 ) ) ( not ( = ?auto_164776 ?auto_164771 ) ) ( not ( = ?auto_164774 ?auto_164775 ) ) ( not ( = ?auto_164774 ?auto_164773 ) ) ( not ( = ?auto_164774 ?auto_164772 ) ) ( not ( = ?auto_164774 ?auto_164771 ) ) ( not ( = ?auto_164775 ?auto_164773 ) ) ( not ( = ?auto_164775 ?auto_164772 ) ) ( not ( = ?auto_164775 ?auto_164771 ) ) ( not ( = ?auto_164769 ?auto_164776 ) ) ( not ( = ?auto_164769 ?auto_164774 ) ) ( not ( = ?auto_164769 ?auto_164775 ) ) ( not ( = ?auto_164770 ?auto_164776 ) ) ( not ( = ?auto_164770 ?auto_164774 ) ) ( not ( = ?auto_164770 ?auto_164775 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_164776 ?auto_164774 ?auto_164775 ?auto_164773 ?auto_164772 )
      ( MAKE-4PILE ?auto_164769 ?auto_164770 ?auto_164771 ?auto_164772 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_164777 - BLOCK
      ?auto_164778 - BLOCK
      ?auto_164779 - BLOCK
      ?auto_164780 - BLOCK
    )
    :vars
    (
      ?auto_164783 - BLOCK
      ?auto_164781 - BLOCK
      ?auto_164782 - BLOCK
      ?auto_164784 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_164777 ) ( not ( = ?auto_164777 ?auto_164778 ) ) ( not ( = ?auto_164777 ?auto_164779 ) ) ( not ( = ?auto_164777 ?auto_164780 ) ) ( not ( = ?auto_164778 ?auto_164779 ) ) ( not ( = ?auto_164778 ?auto_164780 ) ) ( not ( = ?auto_164779 ?auto_164780 ) ) ( ON ?auto_164780 ?auto_164783 ) ( not ( = ?auto_164777 ?auto_164783 ) ) ( not ( = ?auto_164778 ?auto_164783 ) ) ( not ( = ?auto_164779 ?auto_164783 ) ) ( not ( = ?auto_164780 ?auto_164783 ) ) ( ON ?auto_164779 ?auto_164780 ) ( CLEAR ?auto_164779 ) ( ON-TABLE ?auto_164781 ) ( ON ?auto_164782 ?auto_164781 ) ( ON ?auto_164784 ?auto_164782 ) ( ON ?auto_164783 ?auto_164784 ) ( not ( = ?auto_164781 ?auto_164782 ) ) ( not ( = ?auto_164781 ?auto_164784 ) ) ( not ( = ?auto_164781 ?auto_164783 ) ) ( not ( = ?auto_164781 ?auto_164780 ) ) ( not ( = ?auto_164781 ?auto_164779 ) ) ( not ( = ?auto_164782 ?auto_164784 ) ) ( not ( = ?auto_164782 ?auto_164783 ) ) ( not ( = ?auto_164782 ?auto_164780 ) ) ( not ( = ?auto_164782 ?auto_164779 ) ) ( not ( = ?auto_164784 ?auto_164783 ) ) ( not ( = ?auto_164784 ?auto_164780 ) ) ( not ( = ?auto_164784 ?auto_164779 ) ) ( not ( = ?auto_164777 ?auto_164781 ) ) ( not ( = ?auto_164777 ?auto_164782 ) ) ( not ( = ?auto_164777 ?auto_164784 ) ) ( not ( = ?auto_164778 ?auto_164781 ) ) ( not ( = ?auto_164778 ?auto_164782 ) ) ( not ( = ?auto_164778 ?auto_164784 ) ) ( HOLDING ?auto_164778 ) ( CLEAR ?auto_164777 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_164777 ?auto_164778 )
      ( MAKE-4PILE ?auto_164777 ?auto_164778 ?auto_164779 ?auto_164780 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_164785 - BLOCK
      ?auto_164786 - BLOCK
      ?auto_164787 - BLOCK
      ?auto_164788 - BLOCK
    )
    :vars
    (
      ?auto_164791 - BLOCK
      ?auto_164792 - BLOCK
      ?auto_164790 - BLOCK
      ?auto_164789 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_164785 ) ( not ( = ?auto_164785 ?auto_164786 ) ) ( not ( = ?auto_164785 ?auto_164787 ) ) ( not ( = ?auto_164785 ?auto_164788 ) ) ( not ( = ?auto_164786 ?auto_164787 ) ) ( not ( = ?auto_164786 ?auto_164788 ) ) ( not ( = ?auto_164787 ?auto_164788 ) ) ( ON ?auto_164788 ?auto_164791 ) ( not ( = ?auto_164785 ?auto_164791 ) ) ( not ( = ?auto_164786 ?auto_164791 ) ) ( not ( = ?auto_164787 ?auto_164791 ) ) ( not ( = ?auto_164788 ?auto_164791 ) ) ( ON ?auto_164787 ?auto_164788 ) ( ON-TABLE ?auto_164792 ) ( ON ?auto_164790 ?auto_164792 ) ( ON ?auto_164789 ?auto_164790 ) ( ON ?auto_164791 ?auto_164789 ) ( not ( = ?auto_164792 ?auto_164790 ) ) ( not ( = ?auto_164792 ?auto_164789 ) ) ( not ( = ?auto_164792 ?auto_164791 ) ) ( not ( = ?auto_164792 ?auto_164788 ) ) ( not ( = ?auto_164792 ?auto_164787 ) ) ( not ( = ?auto_164790 ?auto_164789 ) ) ( not ( = ?auto_164790 ?auto_164791 ) ) ( not ( = ?auto_164790 ?auto_164788 ) ) ( not ( = ?auto_164790 ?auto_164787 ) ) ( not ( = ?auto_164789 ?auto_164791 ) ) ( not ( = ?auto_164789 ?auto_164788 ) ) ( not ( = ?auto_164789 ?auto_164787 ) ) ( not ( = ?auto_164785 ?auto_164792 ) ) ( not ( = ?auto_164785 ?auto_164790 ) ) ( not ( = ?auto_164785 ?auto_164789 ) ) ( not ( = ?auto_164786 ?auto_164792 ) ) ( not ( = ?auto_164786 ?auto_164790 ) ) ( not ( = ?auto_164786 ?auto_164789 ) ) ( CLEAR ?auto_164785 ) ( ON ?auto_164786 ?auto_164787 ) ( CLEAR ?auto_164786 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_164792 ?auto_164790 ?auto_164789 ?auto_164791 ?auto_164788 ?auto_164787 )
      ( MAKE-4PILE ?auto_164785 ?auto_164786 ?auto_164787 ?auto_164788 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_164793 - BLOCK
      ?auto_164794 - BLOCK
      ?auto_164795 - BLOCK
      ?auto_164796 - BLOCK
    )
    :vars
    (
      ?auto_164798 - BLOCK
      ?auto_164800 - BLOCK
      ?auto_164797 - BLOCK
      ?auto_164799 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_164793 ?auto_164794 ) ) ( not ( = ?auto_164793 ?auto_164795 ) ) ( not ( = ?auto_164793 ?auto_164796 ) ) ( not ( = ?auto_164794 ?auto_164795 ) ) ( not ( = ?auto_164794 ?auto_164796 ) ) ( not ( = ?auto_164795 ?auto_164796 ) ) ( ON ?auto_164796 ?auto_164798 ) ( not ( = ?auto_164793 ?auto_164798 ) ) ( not ( = ?auto_164794 ?auto_164798 ) ) ( not ( = ?auto_164795 ?auto_164798 ) ) ( not ( = ?auto_164796 ?auto_164798 ) ) ( ON ?auto_164795 ?auto_164796 ) ( ON-TABLE ?auto_164800 ) ( ON ?auto_164797 ?auto_164800 ) ( ON ?auto_164799 ?auto_164797 ) ( ON ?auto_164798 ?auto_164799 ) ( not ( = ?auto_164800 ?auto_164797 ) ) ( not ( = ?auto_164800 ?auto_164799 ) ) ( not ( = ?auto_164800 ?auto_164798 ) ) ( not ( = ?auto_164800 ?auto_164796 ) ) ( not ( = ?auto_164800 ?auto_164795 ) ) ( not ( = ?auto_164797 ?auto_164799 ) ) ( not ( = ?auto_164797 ?auto_164798 ) ) ( not ( = ?auto_164797 ?auto_164796 ) ) ( not ( = ?auto_164797 ?auto_164795 ) ) ( not ( = ?auto_164799 ?auto_164798 ) ) ( not ( = ?auto_164799 ?auto_164796 ) ) ( not ( = ?auto_164799 ?auto_164795 ) ) ( not ( = ?auto_164793 ?auto_164800 ) ) ( not ( = ?auto_164793 ?auto_164797 ) ) ( not ( = ?auto_164793 ?auto_164799 ) ) ( not ( = ?auto_164794 ?auto_164800 ) ) ( not ( = ?auto_164794 ?auto_164797 ) ) ( not ( = ?auto_164794 ?auto_164799 ) ) ( ON ?auto_164794 ?auto_164795 ) ( CLEAR ?auto_164794 ) ( HOLDING ?auto_164793 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_164793 )
      ( MAKE-4PILE ?auto_164793 ?auto_164794 ?auto_164795 ?auto_164796 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_164801 - BLOCK
      ?auto_164802 - BLOCK
      ?auto_164803 - BLOCK
      ?auto_164804 - BLOCK
    )
    :vars
    (
      ?auto_164805 - BLOCK
      ?auto_164807 - BLOCK
      ?auto_164808 - BLOCK
      ?auto_164806 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_164801 ?auto_164802 ) ) ( not ( = ?auto_164801 ?auto_164803 ) ) ( not ( = ?auto_164801 ?auto_164804 ) ) ( not ( = ?auto_164802 ?auto_164803 ) ) ( not ( = ?auto_164802 ?auto_164804 ) ) ( not ( = ?auto_164803 ?auto_164804 ) ) ( ON ?auto_164804 ?auto_164805 ) ( not ( = ?auto_164801 ?auto_164805 ) ) ( not ( = ?auto_164802 ?auto_164805 ) ) ( not ( = ?auto_164803 ?auto_164805 ) ) ( not ( = ?auto_164804 ?auto_164805 ) ) ( ON ?auto_164803 ?auto_164804 ) ( ON-TABLE ?auto_164807 ) ( ON ?auto_164808 ?auto_164807 ) ( ON ?auto_164806 ?auto_164808 ) ( ON ?auto_164805 ?auto_164806 ) ( not ( = ?auto_164807 ?auto_164808 ) ) ( not ( = ?auto_164807 ?auto_164806 ) ) ( not ( = ?auto_164807 ?auto_164805 ) ) ( not ( = ?auto_164807 ?auto_164804 ) ) ( not ( = ?auto_164807 ?auto_164803 ) ) ( not ( = ?auto_164808 ?auto_164806 ) ) ( not ( = ?auto_164808 ?auto_164805 ) ) ( not ( = ?auto_164808 ?auto_164804 ) ) ( not ( = ?auto_164808 ?auto_164803 ) ) ( not ( = ?auto_164806 ?auto_164805 ) ) ( not ( = ?auto_164806 ?auto_164804 ) ) ( not ( = ?auto_164806 ?auto_164803 ) ) ( not ( = ?auto_164801 ?auto_164807 ) ) ( not ( = ?auto_164801 ?auto_164808 ) ) ( not ( = ?auto_164801 ?auto_164806 ) ) ( not ( = ?auto_164802 ?auto_164807 ) ) ( not ( = ?auto_164802 ?auto_164808 ) ) ( not ( = ?auto_164802 ?auto_164806 ) ) ( ON ?auto_164802 ?auto_164803 ) ( ON ?auto_164801 ?auto_164802 ) ( CLEAR ?auto_164801 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_164807 ?auto_164808 ?auto_164806 ?auto_164805 ?auto_164804 ?auto_164803 ?auto_164802 )
      ( MAKE-4PILE ?auto_164801 ?auto_164802 ?auto_164803 ?auto_164804 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_164809 - BLOCK
      ?auto_164810 - BLOCK
      ?auto_164811 - BLOCK
      ?auto_164812 - BLOCK
    )
    :vars
    (
      ?auto_164815 - BLOCK
      ?auto_164816 - BLOCK
      ?auto_164814 - BLOCK
      ?auto_164813 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_164809 ?auto_164810 ) ) ( not ( = ?auto_164809 ?auto_164811 ) ) ( not ( = ?auto_164809 ?auto_164812 ) ) ( not ( = ?auto_164810 ?auto_164811 ) ) ( not ( = ?auto_164810 ?auto_164812 ) ) ( not ( = ?auto_164811 ?auto_164812 ) ) ( ON ?auto_164812 ?auto_164815 ) ( not ( = ?auto_164809 ?auto_164815 ) ) ( not ( = ?auto_164810 ?auto_164815 ) ) ( not ( = ?auto_164811 ?auto_164815 ) ) ( not ( = ?auto_164812 ?auto_164815 ) ) ( ON ?auto_164811 ?auto_164812 ) ( ON-TABLE ?auto_164816 ) ( ON ?auto_164814 ?auto_164816 ) ( ON ?auto_164813 ?auto_164814 ) ( ON ?auto_164815 ?auto_164813 ) ( not ( = ?auto_164816 ?auto_164814 ) ) ( not ( = ?auto_164816 ?auto_164813 ) ) ( not ( = ?auto_164816 ?auto_164815 ) ) ( not ( = ?auto_164816 ?auto_164812 ) ) ( not ( = ?auto_164816 ?auto_164811 ) ) ( not ( = ?auto_164814 ?auto_164813 ) ) ( not ( = ?auto_164814 ?auto_164815 ) ) ( not ( = ?auto_164814 ?auto_164812 ) ) ( not ( = ?auto_164814 ?auto_164811 ) ) ( not ( = ?auto_164813 ?auto_164815 ) ) ( not ( = ?auto_164813 ?auto_164812 ) ) ( not ( = ?auto_164813 ?auto_164811 ) ) ( not ( = ?auto_164809 ?auto_164816 ) ) ( not ( = ?auto_164809 ?auto_164814 ) ) ( not ( = ?auto_164809 ?auto_164813 ) ) ( not ( = ?auto_164810 ?auto_164816 ) ) ( not ( = ?auto_164810 ?auto_164814 ) ) ( not ( = ?auto_164810 ?auto_164813 ) ) ( ON ?auto_164810 ?auto_164811 ) ( HOLDING ?auto_164809 ) ( CLEAR ?auto_164810 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_164816 ?auto_164814 ?auto_164813 ?auto_164815 ?auto_164812 ?auto_164811 ?auto_164810 ?auto_164809 )
      ( MAKE-4PILE ?auto_164809 ?auto_164810 ?auto_164811 ?auto_164812 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_164817 - BLOCK
      ?auto_164818 - BLOCK
      ?auto_164819 - BLOCK
      ?auto_164820 - BLOCK
    )
    :vars
    (
      ?auto_164822 - BLOCK
      ?auto_164821 - BLOCK
      ?auto_164823 - BLOCK
      ?auto_164824 - BLOCK
      ?auto_164825 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_164817 ?auto_164818 ) ) ( not ( = ?auto_164817 ?auto_164819 ) ) ( not ( = ?auto_164817 ?auto_164820 ) ) ( not ( = ?auto_164818 ?auto_164819 ) ) ( not ( = ?auto_164818 ?auto_164820 ) ) ( not ( = ?auto_164819 ?auto_164820 ) ) ( ON ?auto_164820 ?auto_164822 ) ( not ( = ?auto_164817 ?auto_164822 ) ) ( not ( = ?auto_164818 ?auto_164822 ) ) ( not ( = ?auto_164819 ?auto_164822 ) ) ( not ( = ?auto_164820 ?auto_164822 ) ) ( ON ?auto_164819 ?auto_164820 ) ( ON-TABLE ?auto_164821 ) ( ON ?auto_164823 ?auto_164821 ) ( ON ?auto_164824 ?auto_164823 ) ( ON ?auto_164822 ?auto_164824 ) ( not ( = ?auto_164821 ?auto_164823 ) ) ( not ( = ?auto_164821 ?auto_164824 ) ) ( not ( = ?auto_164821 ?auto_164822 ) ) ( not ( = ?auto_164821 ?auto_164820 ) ) ( not ( = ?auto_164821 ?auto_164819 ) ) ( not ( = ?auto_164823 ?auto_164824 ) ) ( not ( = ?auto_164823 ?auto_164822 ) ) ( not ( = ?auto_164823 ?auto_164820 ) ) ( not ( = ?auto_164823 ?auto_164819 ) ) ( not ( = ?auto_164824 ?auto_164822 ) ) ( not ( = ?auto_164824 ?auto_164820 ) ) ( not ( = ?auto_164824 ?auto_164819 ) ) ( not ( = ?auto_164817 ?auto_164821 ) ) ( not ( = ?auto_164817 ?auto_164823 ) ) ( not ( = ?auto_164817 ?auto_164824 ) ) ( not ( = ?auto_164818 ?auto_164821 ) ) ( not ( = ?auto_164818 ?auto_164823 ) ) ( not ( = ?auto_164818 ?auto_164824 ) ) ( ON ?auto_164818 ?auto_164819 ) ( CLEAR ?auto_164818 ) ( ON ?auto_164817 ?auto_164825 ) ( CLEAR ?auto_164817 ) ( HAND-EMPTY ) ( not ( = ?auto_164817 ?auto_164825 ) ) ( not ( = ?auto_164818 ?auto_164825 ) ) ( not ( = ?auto_164819 ?auto_164825 ) ) ( not ( = ?auto_164820 ?auto_164825 ) ) ( not ( = ?auto_164822 ?auto_164825 ) ) ( not ( = ?auto_164821 ?auto_164825 ) ) ( not ( = ?auto_164823 ?auto_164825 ) ) ( not ( = ?auto_164824 ?auto_164825 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_164817 ?auto_164825 )
      ( MAKE-4PILE ?auto_164817 ?auto_164818 ?auto_164819 ?auto_164820 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_164826 - BLOCK
      ?auto_164827 - BLOCK
      ?auto_164828 - BLOCK
      ?auto_164829 - BLOCK
    )
    :vars
    (
      ?auto_164833 - BLOCK
      ?auto_164831 - BLOCK
      ?auto_164832 - BLOCK
      ?auto_164830 - BLOCK
      ?auto_164834 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_164826 ?auto_164827 ) ) ( not ( = ?auto_164826 ?auto_164828 ) ) ( not ( = ?auto_164826 ?auto_164829 ) ) ( not ( = ?auto_164827 ?auto_164828 ) ) ( not ( = ?auto_164827 ?auto_164829 ) ) ( not ( = ?auto_164828 ?auto_164829 ) ) ( ON ?auto_164829 ?auto_164833 ) ( not ( = ?auto_164826 ?auto_164833 ) ) ( not ( = ?auto_164827 ?auto_164833 ) ) ( not ( = ?auto_164828 ?auto_164833 ) ) ( not ( = ?auto_164829 ?auto_164833 ) ) ( ON ?auto_164828 ?auto_164829 ) ( ON-TABLE ?auto_164831 ) ( ON ?auto_164832 ?auto_164831 ) ( ON ?auto_164830 ?auto_164832 ) ( ON ?auto_164833 ?auto_164830 ) ( not ( = ?auto_164831 ?auto_164832 ) ) ( not ( = ?auto_164831 ?auto_164830 ) ) ( not ( = ?auto_164831 ?auto_164833 ) ) ( not ( = ?auto_164831 ?auto_164829 ) ) ( not ( = ?auto_164831 ?auto_164828 ) ) ( not ( = ?auto_164832 ?auto_164830 ) ) ( not ( = ?auto_164832 ?auto_164833 ) ) ( not ( = ?auto_164832 ?auto_164829 ) ) ( not ( = ?auto_164832 ?auto_164828 ) ) ( not ( = ?auto_164830 ?auto_164833 ) ) ( not ( = ?auto_164830 ?auto_164829 ) ) ( not ( = ?auto_164830 ?auto_164828 ) ) ( not ( = ?auto_164826 ?auto_164831 ) ) ( not ( = ?auto_164826 ?auto_164832 ) ) ( not ( = ?auto_164826 ?auto_164830 ) ) ( not ( = ?auto_164827 ?auto_164831 ) ) ( not ( = ?auto_164827 ?auto_164832 ) ) ( not ( = ?auto_164827 ?auto_164830 ) ) ( ON ?auto_164826 ?auto_164834 ) ( CLEAR ?auto_164826 ) ( not ( = ?auto_164826 ?auto_164834 ) ) ( not ( = ?auto_164827 ?auto_164834 ) ) ( not ( = ?auto_164828 ?auto_164834 ) ) ( not ( = ?auto_164829 ?auto_164834 ) ) ( not ( = ?auto_164833 ?auto_164834 ) ) ( not ( = ?auto_164831 ?auto_164834 ) ) ( not ( = ?auto_164832 ?auto_164834 ) ) ( not ( = ?auto_164830 ?auto_164834 ) ) ( HOLDING ?auto_164827 ) ( CLEAR ?auto_164828 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_164831 ?auto_164832 ?auto_164830 ?auto_164833 ?auto_164829 ?auto_164828 ?auto_164827 )
      ( MAKE-4PILE ?auto_164826 ?auto_164827 ?auto_164828 ?auto_164829 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_164835 - BLOCK
      ?auto_164836 - BLOCK
      ?auto_164837 - BLOCK
      ?auto_164838 - BLOCK
    )
    :vars
    (
      ?auto_164840 - BLOCK
      ?auto_164839 - BLOCK
      ?auto_164841 - BLOCK
      ?auto_164842 - BLOCK
      ?auto_164843 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_164835 ?auto_164836 ) ) ( not ( = ?auto_164835 ?auto_164837 ) ) ( not ( = ?auto_164835 ?auto_164838 ) ) ( not ( = ?auto_164836 ?auto_164837 ) ) ( not ( = ?auto_164836 ?auto_164838 ) ) ( not ( = ?auto_164837 ?auto_164838 ) ) ( ON ?auto_164838 ?auto_164840 ) ( not ( = ?auto_164835 ?auto_164840 ) ) ( not ( = ?auto_164836 ?auto_164840 ) ) ( not ( = ?auto_164837 ?auto_164840 ) ) ( not ( = ?auto_164838 ?auto_164840 ) ) ( ON ?auto_164837 ?auto_164838 ) ( ON-TABLE ?auto_164839 ) ( ON ?auto_164841 ?auto_164839 ) ( ON ?auto_164842 ?auto_164841 ) ( ON ?auto_164840 ?auto_164842 ) ( not ( = ?auto_164839 ?auto_164841 ) ) ( not ( = ?auto_164839 ?auto_164842 ) ) ( not ( = ?auto_164839 ?auto_164840 ) ) ( not ( = ?auto_164839 ?auto_164838 ) ) ( not ( = ?auto_164839 ?auto_164837 ) ) ( not ( = ?auto_164841 ?auto_164842 ) ) ( not ( = ?auto_164841 ?auto_164840 ) ) ( not ( = ?auto_164841 ?auto_164838 ) ) ( not ( = ?auto_164841 ?auto_164837 ) ) ( not ( = ?auto_164842 ?auto_164840 ) ) ( not ( = ?auto_164842 ?auto_164838 ) ) ( not ( = ?auto_164842 ?auto_164837 ) ) ( not ( = ?auto_164835 ?auto_164839 ) ) ( not ( = ?auto_164835 ?auto_164841 ) ) ( not ( = ?auto_164835 ?auto_164842 ) ) ( not ( = ?auto_164836 ?auto_164839 ) ) ( not ( = ?auto_164836 ?auto_164841 ) ) ( not ( = ?auto_164836 ?auto_164842 ) ) ( ON ?auto_164835 ?auto_164843 ) ( not ( = ?auto_164835 ?auto_164843 ) ) ( not ( = ?auto_164836 ?auto_164843 ) ) ( not ( = ?auto_164837 ?auto_164843 ) ) ( not ( = ?auto_164838 ?auto_164843 ) ) ( not ( = ?auto_164840 ?auto_164843 ) ) ( not ( = ?auto_164839 ?auto_164843 ) ) ( not ( = ?auto_164841 ?auto_164843 ) ) ( not ( = ?auto_164842 ?auto_164843 ) ) ( CLEAR ?auto_164837 ) ( ON ?auto_164836 ?auto_164835 ) ( CLEAR ?auto_164836 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_164843 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_164843 ?auto_164835 )
      ( MAKE-4PILE ?auto_164835 ?auto_164836 ?auto_164837 ?auto_164838 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_164844 - BLOCK
      ?auto_164845 - BLOCK
      ?auto_164846 - BLOCK
      ?auto_164847 - BLOCK
    )
    :vars
    (
      ?auto_164848 - BLOCK
      ?auto_164850 - BLOCK
      ?auto_164851 - BLOCK
      ?auto_164849 - BLOCK
      ?auto_164852 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_164844 ?auto_164845 ) ) ( not ( = ?auto_164844 ?auto_164846 ) ) ( not ( = ?auto_164844 ?auto_164847 ) ) ( not ( = ?auto_164845 ?auto_164846 ) ) ( not ( = ?auto_164845 ?auto_164847 ) ) ( not ( = ?auto_164846 ?auto_164847 ) ) ( ON ?auto_164847 ?auto_164848 ) ( not ( = ?auto_164844 ?auto_164848 ) ) ( not ( = ?auto_164845 ?auto_164848 ) ) ( not ( = ?auto_164846 ?auto_164848 ) ) ( not ( = ?auto_164847 ?auto_164848 ) ) ( ON-TABLE ?auto_164850 ) ( ON ?auto_164851 ?auto_164850 ) ( ON ?auto_164849 ?auto_164851 ) ( ON ?auto_164848 ?auto_164849 ) ( not ( = ?auto_164850 ?auto_164851 ) ) ( not ( = ?auto_164850 ?auto_164849 ) ) ( not ( = ?auto_164850 ?auto_164848 ) ) ( not ( = ?auto_164850 ?auto_164847 ) ) ( not ( = ?auto_164850 ?auto_164846 ) ) ( not ( = ?auto_164851 ?auto_164849 ) ) ( not ( = ?auto_164851 ?auto_164848 ) ) ( not ( = ?auto_164851 ?auto_164847 ) ) ( not ( = ?auto_164851 ?auto_164846 ) ) ( not ( = ?auto_164849 ?auto_164848 ) ) ( not ( = ?auto_164849 ?auto_164847 ) ) ( not ( = ?auto_164849 ?auto_164846 ) ) ( not ( = ?auto_164844 ?auto_164850 ) ) ( not ( = ?auto_164844 ?auto_164851 ) ) ( not ( = ?auto_164844 ?auto_164849 ) ) ( not ( = ?auto_164845 ?auto_164850 ) ) ( not ( = ?auto_164845 ?auto_164851 ) ) ( not ( = ?auto_164845 ?auto_164849 ) ) ( ON ?auto_164844 ?auto_164852 ) ( not ( = ?auto_164844 ?auto_164852 ) ) ( not ( = ?auto_164845 ?auto_164852 ) ) ( not ( = ?auto_164846 ?auto_164852 ) ) ( not ( = ?auto_164847 ?auto_164852 ) ) ( not ( = ?auto_164848 ?auto_164852 ) ) ( not ( = ?auto_164850 ?auto_164852 ) ) ( not ( = ?auto_164851 ?auto_164852 ) ) ( not ( = ?auto_164849 ?auto_164852 ) ) ( ON ?auto_164845 ?auto_164844 ) ( CLEAR ?auto_164845 ) ( ON-TABLE ?auto_164852 ) ( HOLDING ?auto_164846 ) ( CLEAR ?auto_164847 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_164850 ?auto_164851 ?auto_164849 ?auto_164848 ?auto_164847 ?auto_164846 )
      ( MAKE-4PILE ?auto_164844 ?auto_164845 ?auto_164846 ?auto_164847 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_164853 - BLOCK
      ?auto_164854 - BLOCK
      ?auto_164855 - BLOCK
      ?auto_164856 - BLOCK
    )
    :vars
    (
      ?auto_164861 - BLOCK
      ?auto_164860 - BLOCK
      ?auto_164858 - BLOCK
      ?auto_164857 - BLOCK
      ?auto_164859 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_164853 ?auto_164854 ) ) ( not ( = ?auto_164853 ?auto_164855 ) ) ( not ( = ?auto_164853 ?auto_164856 ) ) ( not ( = ?auto_164854 ?auto_164855 ) ) ( not ( = ?auto_164854 ?auto_164856 ) ) ( not ( = ?auto_164855 ?auto_164856 ) ) ( ON ?auto_164856 ?auto_164861 ) ( not ( = ?auto_164853 ?auto_164861 ) ) ( not ( = ?auto_164854 ?auto_164861 ) ) ( not ( = ?auto_164855 ?auto_164861 ) ) ( not ( = ?auto_164856 ?auto_164861 ) ) ( ON-TABLE ?auto_164860 ) ( ON ?auto_164858 ?auto_164860 ) ( ON ?auto_164857 ?auto_164858 ) ( ON ?auto_164861 ?auto_164857 ) ( not ( = ?auto_164860 ?auto_164858 ) ) ( not ( = ?auto_164860 ?auto_164857 ) ) ( not ( = ?auto_164860 ?auto_164861 ) ) ( not ( = ?auto_164860 ?auto_164856 ) ) ( not ( = ?auto_164860 ?auto_164855 ) ) ( not ( = ?auto_164858 ?auto_164857 ) ) ( not ( = ?auto_164858 ?auto_164861 ) ) ( not ( = ?auto_164858 ?auto_164856 ) ) ( not ( = ?auto_164858 ?auto_164855 ) ) ( not ( = ?auto_164857 ?auto_164861 ) ) ( not ( = ?auto_164857 ?auto_164856 ) ) ( not ( = ?auto_164857 ?auto_164855 ) ) ( not ( = ?auto_164853 ?auto_164860 ) ) ( not ( = ?auto_164853 ?auto_164858 ) ) ( not ( = ?auto_164853 ?auto_164857 ) ) ( not ( = ?auto_164854 ?auto_164860 ) ) ( not ( = ?auto_164854 ?auto_164858 ) ) ( not ( = ?auto_164854 ?auto_164857 ) ) ( ON ?auto_164853 ?auto_164859 ) ( not ( = ?auto_164853 ?auto_164859 ) ) ( not ( = ?auto_164854 ?auto_164859 ) ) ( not ( = ?auto_164855 ?auto_164859 ) ) ( not ( = ?auto_164856 ?auto_164859 ) ) ( not ( = ?auto_164861 ?auto_164859 ) ) ( not ( = ?auto_164860 ?auto_164859 ) ) ( not ( = ?auto_164858 ?auto_164859 ) ) ( not ( = ?auto_164857 ?auto_164859 ) ) ( ON ?auto_164854 ?auto_164853 ) ( ON-TABLE ?auto_164859 ) ( CLEAR ?auto_164856 ) ( ON ?auto_164855 ?auto_164854 ) ( CLEAR ?auto_164855 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_164859 ?auto_164853 ?auto_164854 )
      ( MAKE-4PILE ?auto_164853 ?auto_164854 ?auto_164855 ?auto_164856 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_164862 - BLOCK
      ?auto_164863 - BLOCK
      ?auto_164864 - BLOCK
      ?auto_164865 - BLOCK
    )
    :vars
    (
      ?auto_164867 - BLOCK
      ?auto_164866 - BLOCK
      ?auto_164868 - BLOCK
      ?auto_164870 - BLOCK
      ?auto_164869 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_164862 ?auto_164863 ) ) ( not ( = ?auto_164862 ?auto_164864 ) ) ( not ( = ?auto_164862 ?auto_164865 ) ) ( not ( = ?auto_164863 ?auto_164864 ) ) ( not ( = ?auto_164863 ?auto_164865 ) ) ( not ( = ?auto_164864 ?auto_164865 ) ) ( not ( = ?auto_164862 ?auto_164867 ) ) ( not ( = ?auto_164863 ?auto_164867 ) ) ( not ( = ?auto_164864 ?auto_164867 ) ) ( not ( = ?auto_164865 ?auto_164867 ) ) ( ON-TABLE ?auto_164866 ) ( ON ?auto_164868 ?auto_164866 ) ( ON ?auto_164870 ?auto_164868 ) ( ON ?auto_164867 ?auto_164870 ) ( not ( = ?auto_164866 ?auto_164868 ) ) ( not ( = ?auto_164866 ?auto_164870 ) ) ( not ( = ?auto_164866 ?auto_164867 ) ) ( not ( = ?auto_164866 ?auto_164865 ) ) ( not ( = ?auto_164866 ?auto_164864 ) ) ( not ( = ?auto_164868 ?auto_164870 ) ) ( not ( = ?auto_164868 ?auto_164867 ) ) ( not ( = ?auto_164868 ?auto_164865 ) ) ( not ( = ?auto_164868 ?auto_164864 ) ) ( not ( = ?auto_164870 ?auto_164867 ) ) ( not ( = ?auto_164870 ?auto_164865 ) ) ( not ( = ?auto_164870 ?auto_164864 ) ) ( not ( = ?auto_164862 ?auto_164866 ) ) ( not ( = ?auto_164862 ?auto_164868 ) ) ( not ( = ?auto_164862 ?auto_164870 ) ) ( not ( = ?auto_164863 ?auto_164866 ) ) ( not ( = ?auto_164863 ?auto_164868 ) ) ( not ( = ?auto_164863 ?auto_164870 ) ) ( ON ?auto_164862 ?auto_164869 ) ( not ( = ?auto_164862 ?auto_164869 ) ) ( not ( = ?auto_164863 ?auto_164869 ) ) ( not ( = ?auto_164864 ?auto_164869 ) ) ( not ( = ?auto_164865 ?auto_164869 ) ) ( not ( = ?auto_164867 ?auto_164869 ) ) ( not ( = ?auto_164866 ?auto_164869 ) ) ( not ( = ?auto_164868 ?auto_164869 ) ) ( not ( = ?auto_164870 ?auto_164869 ) ) ( ON ?auto_164863 ?auto_164862 ) ( ON-TABLE ?auto_164869 ) ( ON ?auto_164864 ?auto_164863 ) ( CLEAR ?auto_164864 ) ( HOLDING ?auto_164865 ) ( CLEAR ?auto_164867 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_164866 ?auto_164868 ?auto_164870 ?auto_164867 ?auto_164865 )
      ( MAKE-4PILE ?auto_164862 ?auto_164863 ?auto_164864 ?auto_164865 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_164871 - BLOCK
      ?auto_164872 - BLOCK
      ?auto_164873 - BLOCK
      ?auto_164874 - BLOCK
    )
    :vars
    (
      ?auto_164879 - BLOCK
      ?auto_164875 - BLOCK
      ?auto_164878 - BLOCK
      ?auto_164876 - BLOCK
      ?auto_164877 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_164871 ?auto_164872 ) ) ( not ( = ?auto_164871 ?auto_164873 ) ) ( not ( = ?auto_164871 ?auto_164874 ) ) ( not ( = ?auto_164872 ?auto_164873 ) ) ( not ( = ?auto_164872 ?auto_164874 ) ) ( not ( = ?auto_164873 ?auto_164874 ) ) ( not ( = ?auto_164871 ?auto_164879 ) ) ( not ( = ?auto_164872 ?auto_164879 ) ) ( not ( = ?auto_164873 ?auto_164879 ) ) ( not ( = ?auto_164874 ?auto_164879 ) ) ( ON-TABLE ?auto_164875 ) ( ON ?auto_164878 ?auto_164875 ) ( ON ?auto_164876 ?auto_164878 ) ( ON ?auto_164879 ?auto_164876 ) ( not ( = ?auto_164875 ?auto_164878 ) ) ( not ( = ?auto_164875 ?auto_164876 ) ) ( not ( = ?auto_164875 ?auto_164879 ) ) ( not ( = ?auto_164875 ?auto_164874 ) ) ( not ( = ?auto_164875 ?auto_164873 ) ) ( not ( = ?auto_164878 ?auto_164876 ) ) ( not ( = ?auto_164878 ?auto_164879 ) ) ( not ( = ?auto_164878 ?auto_164874 ) ) ( not ( = ?auto_164878 ?auto_164873 ) ) ( not ( = ?auto_164876 ?auto_164879 ) ) ( not ( = ?auto_164876 ?auto_164874 ) ) ( not ( = ?auto_164876 ?auto_164873 ) ) ( not ( = ?auto_164871 ?auto_164875 ) ) ( not ( = ?auto_164871 ?auto_164878 ) ) ( not ( = ?auto_164871 ?auto_164876 ) ) ( not ( = ?auto_164872 ?auto_164875 ) ) ( not ( = ?auto_164872 ?auto_164878 ) ) ( not ( = ?auto_164872 ?auto_164876 ) ) ( ON ?auto_164871 ?auto_164877 ) ( not ( = ?auto_164871 ?auto_164877 ) ) ( not ( = ?auto_164872 ?auto_164877 ) ) ( not ( = ?auto_164873 ?auto_164877 ) ) ( not ( = ?auto_164874 ?auto_164877 ) ) ( not ( = ?auto_164879 ?auto_164877 ) ) ( not ( = ?auto_164875 ?auto_164877 ) ) ( not ( = ?auto_164878 ?auto_164877 ) ) ( not ( = ?auto_164876 ?auto_164877 ) ) ( ON ?auto_164872 ?auto_164871 ) ( ON-TABLE ?auto_164877 ) ( ON ?auto_164873 ?auto_164872 ) ( CLEAR ?auto_164879 ) ( ON ?auto_164874 ?auto_164873 ) ( CLEAR ?auto_164874 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_164877 ?auto_164871 ?auto_164872 ?auto_164873 )
      ( MAKE-4PILE ?auto_164871 ?auto_164872 ?auto_164873 ?auto_164874 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_164880 - BLOCK
      ?auto_164881 - BLOCK
      ?auto_164882 - BLOCK
      ?auto_164883 - BLOCK
    )
    :vars
    (
      ?auto_164887 - BLOCK
      ?auto_164884 - BLOCK
      ?auto_164888 - BLOCK
      ?auto_164885 - BLOCK
      ?auto_164886 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_164880 ?auto_164881 ) ) ( not ( = ?auto_164880 ?auto_164882 ) ) ( not ( = ?auto_164880 ?auto_164883 ) ) ( not ( = ?auto_164881 ?auto_164882 ) ) ( not ( = ?auto_164881 ?auto_164883 ) ) ( not ( = ?auto_164882 ?auto_164883 ) ) ( not ( = ?auto_164880 ?auto_164887 ) ) ( not ( = ?auto_164881 ?auto_164887 ) ) ( not ( = ?auto_164882 ?auto_164887 ) ) ( not ( = ?auto_164883 ?auto_164887 ) ) ( ON-TABLE ?auto_164884 ) ( ON ?auto_164888 ?auto_164884 ) ( ON ?auto_164885 ?auto_164888 ) ( not ( = ?auto_164884 ?auto_164888 ) ) ( not ( = ?auto_164884 ?auto_164885 ) ) ( not ( = ?auto_164884 ?auto_164887 ) ) ( not ( = ?auto_164884 ?auto_164883 ) ) ( not ( = ?auto_164884 ?auto_164882 ) ) ( not ( = ?auto_164888 ?auto_164885 ) ) ( not ( = ?auto_164888 ?auto_164887 ) ) ( not ( = ?auto_164888 ?auto_164883 ) ) ( not ( = ?auto_164888 ?auto_164882 ) ) ( not ( = ?auto_164885 ?auto_164887 ) ) ( not ( = ?auto_164885 ?auto_164883 ) ) ( not ( = ?auto_164885 ?auto_164882 ) ) ( not ( = ?auto_164880 ?auto_164884 ) ) ( not ( = ?auto_164880 ?auto_164888 ) ) ( not ( = ?auto_164880 ?auto_164885 ) ) ( not ( = ?auto_164881 ?auto_164884 ) ) ( not ( = ?auto_164881 ?auto_164888 ) ) ( not ( = ?auto_164881 ?auto_164885 ) ) ( ON ?auto_164880 ?auto_164886 ) ( not ( = ?auto_164880 ?auto_164886 ) ) ( not ( = ?auto_164881 ?auto_164886 ) ) ( not ( = ?auto_164882 ?auto_164886 ) ) ( not ( = ?auto_164883 ?auto_164886 ) ) ( not ( = ?auto_164887 ?auto_164886 ) ) ( not ( = ?auto_164884 ?auto_164886 ) ) ( not ( = ?auto_164888 ?auto_164886 ) ) ( not ( = ?auto_164885 ?auto_164886 ) ) ( ON ?auto_164881 ?auto_164880 ) ( ON-TABLE ?auto_164886 ) ( ON ?auto_164882 ?auto_164881 ) ( ON ?auto_164883 ?auto_164882 ) ( CLEAR ?auto_164883 ) ( HOLDING ?auto_164887 ) ( CLEAR ?auto_164885 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_164884 ?auto_164888 ?auto_164885 ?auto_164887 )
      ( MAKE-4PILE ?auto_164880 ?auto_164881 ?auto_164882 ?auto_164883 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_164889 - BLOCK
      ?auto_164890 - BLOCK
      ?auto_164891 - BLOCK
      ?auto_164892 - BLOCK
    )
    :vars
    (
      ?auto_164894 - BLOCK
      ?auto_164897 - BLOCK
      ?auto_164893 - BLOCK
      ?auto_164896 - BLOCK
      ?auto_164895 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_164889 ?auto_164890 ) ) ( not ( = ?auto_164889 ?auto_164891 ) ) ( not ( = ?auto_164889 ?auto_164892 ) ) ( not ( = ?auto_164890 ?auto_164891 ) ) ( not ( = ?auto_164890 ?auto_164892 ) ) ( not ( = ?auto_164891 ?auto_164892 ) ) ( not ( = ?auto_164889 ?auto_164894 ) ) ( not ( = ?auto_164890 ?auto_164894 ) ) ( not ( = ?auto_164891 ?auto_164894 ) ) ( not ( = ?auto_164892 ?auto_164894 ) ) ( ON-TABLE ?auto_164897 ) ( ON ?auto_164893 ?auto_164897 ) ( ON ?auto_164896 ?auto_164893 ) ( not ( = ?auto_164897 ?auto_164893 ) ) ( not ( = ?auto_164897 ?auto_164896 ) ) ( not ( = ?auto_164897 ?auto_164894 ) ) ( not ( = ?auto_164897 ?auto_164892 ) ) ( not ( = ?auto_164897 ?auto_164891 ) ) ( not ( = ?auto_164893 ?auto_164896 ) ) ( not ( = ?auto_164893 ?auto_164894 ) ) ( not ( = ?auto_164893 ?auto_164892 ) ) ( not ( = ?auto_164893 ?auto_164891 ) ) ( not ( = ?auto_164896 ?auto_164894 ) ) ( not ( = ?auto_164896 ?auto_164892 ) ) ( not ( = ?auto_164896 ?auto_164891 ) ) ( not ( = ?auto_164889 ?auto_164897 ) ) ( not ( = ?auto_164889 ?auto_164893 ) ) ( not ( = ?auto_164889 ?auto_164896 ) ) ( not ( = ?auto_164890 ?auto_164897 ) ) ( not ( = ?auto_164890 ?auto_164893 ) ) ( not ( = ?auto_164890 ?auto_164896 ) ) ( ON ?auto_164889 ?auto_164895 ) ( not ( = ?auto_164889 ?auto_164895 ) ) ( not ( = ?auto_164890 ?auto_164895 ) ) ( not ( = ?auto_164891 ?auto_164895 ) ) ( not ( = ?auto_164892 ?auto_164895 ) ) ( not ( = ?auto_164894 ?auto_164895 ) ) ( not ( = ?auto_164897 ?auto_164895 ) ) ( not ( = ?auto_164893 ?auto_164895 ) ) ( not ( = ?auto_164896 ?auto_164895 ) ) ( ON ?auto_164890 ?auto_164889 ) ( ON-TABLE ?auto_164895 ) ( ON ?auto_164891 ?auto_164890 ) ( ON ?auto_164892 ?auto_164891 ) ( CLEAR ?auto_164896 ) ( ON ?auto_164894 ?auto_164892 ) ( CLEAR ?auto_164894 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_164895 ?auto_164889 ?auto_164890 ?auto_164891 ?auto_164892 )
      ( MAKE-4PILE ?auto_164889 ?auto_164890 ?auto_164891 ?auto_164892 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_164898 - BLOCK
      ?auto_164899 - BLOCK
      ?auto_164900 - BLOCK
      ?auto_164901 - BLOCK
    )
    :vars
    (
      ?auto_164906 - BLOCK
      ?auto_164905 - BLOCK
      ?auto_164903 - BLOCK
      ?auto_164902 - BLOCK
      ?auto_164904 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_164898 ?auto_164899 ) ) ( not ( = ?auto_164898 ?auto_164900 ) ) ( not ( = ?auto_164898 ?auto_164901 ) ) ( not ( = ?auto_164899 ?auto_164900 ) ) ( not ( = ?auto_164899 ?auto_164901 ) ) ( not ( = ?auto_164900 ?auto_164901 ) ) ( not ( = ?auto_164898 ?auto_164906 ) ) ( not ( = ?auto_164899 ?auto_164906 ) ) ( not ( = ?auto_164900 ?auto_164906 ) ) ( not ( = ?auto_164901 ?auto_164906 ) ) ( ON-TABLE ?auto_164905 ) ( ON ?auto_164903 ?auto_164905 ) ( not ( = ?auto_164905 ?auto_164903 ) ) ( not ( = ?auto_164905 ?auto_164902 ) ) ( not ( = ?auto_164905 ?auto_164906 ) ) ( not ( = ?auto_164905 ?auto_164901 ) ) ( not ( = ?auto_164905 ?auto_164900 ) ) ( not ( = ?auto_164903 ?auto_164902 ) ) ( not ( = ?auto_164903 ?auto_164906 ) ) ( not ( = ?auto_164903 ?auto_164901 ) ) ( not ( = ?auto_164903 ?auto_164900 ) ) ( not ( = ?auto_164902 ?auto_164906 ) ) ( not ( = ?auto_164902 ?auto_164901 ) ) ( not ( = ?auto_164902 ?auto_164900 ) ) ( not ( = ?auto_164898 ?auto_164905 ) ) ( not ( = ?auto_164898 ?auto_164903 ) ) ( not ( = ?auto_164898 ?auto_164902 ) ) ( not ( = ?auto_164899 ?auto_164905 ) ) ( not ( = ?auto_164899 ?auto_164903 ) ) ( not ( = ?auto_164899 ?auto_164902 ) ) ( ON ?auto_164898 ?auto_164904 ) ( not ( = ?auto_164898 ?auto_164904 ) ) ( not ( = ?auto_164899 ?auto_164904 ) ) ( not ( = ?auto_164900 ?auto_164904 ) ) ( not ( = ?auto_164901 ?auto_164904 ) ) ( not ( = ?auto_164906 ?auto_164904 ) ) ( not ( = ?auto_164905 ?auto_164904 ) ) ( not ( = ?auto_164903 ?auto_164904 ) ) ( not ( = ?auto_164902 ?auto_164904 ) ) ( ON ?auto_164899 ?auto_164898 ) ( ON-TABLE ?auto_164904 ) ( ON ?auto_164900 ?auto_164899 ) ( ON ?auto_164901 ?auto_164900 ) ( ON ?auto_164906 ?auto_164901 ) ( CLEAR ?auto_164906 ) ( HOLDING ?auto_164902 ) ( CLEAR ?auto_164903 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_164905 ?auto_164903 ?auto_164902 )
      ( MAKE-4PILE ?auto_164898 ?auto_164899 ?auto_164900 ?auto_164901 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_164907 - BLOCK
      ?auto_164908 - BLOCK
      ?auto_164909 - BLOCK
      ?auto_164910 - BLOCK
    )
    :vars
    (
      ?auto_164914 - BLOCK
      ?auto_164913 - BLOCK
      ?auto_164911 - BLOCK
      ?auto_164912 - BLOCK
      ?auto_164915 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_164907 ?auto_164908 ) ) ( not ( = ?auto_164907 ?auto_164909 ) ) ( not ( = ?auto_164907 ?auto_164910 ) ) ( not ( = ?auto_164908 ?auto_164909 ) ) ( not ( = ?auto_164908 ?auto_164910 ) ) ( not ( = ?auto_164909 ?auto_164910 ) ) ( not ( = ?auto_164907 ?auto_164914 ) ) ( not ( = ?auto_164908 ?auto_164914 ) ) ( not ( = ?auto_164909 ?auto_164914 ) ) ( not ( = ?auto_164910 ?auto_164914 ) ) ( ON-TABLE ?auto_164913 ) ( ON ?auto_164911 ?auto_164913 ) ( not ( = ?auto_164913 ?auto_164911 ) ) ( not ( = ?auto_164913 ?auto_164912 ) ) ( not ( = ?auto_164913 ?auto_164914 ) ) ( not ( = ?auto_164913 ?auto_164910 ) ) ( not ( = ?auto_164913 ?auto_164909 ) ) ( not ( = ?auto_164911 ?auto_164912 ) ) ( not ( = ?auto_164911 ?auto_164914 ) ) ( not ( = ?auto_164911 ?auto_164910 ) ) ( not ( = ?auto_164911 ?auto_164909 ) ) ( not ( = ?auto_164912 ?auto_164914 ) ) ( not ( = ?auto_164912 ?auto_164910 ) ) ( not ( = ?auto_164912 ?auto_164909 ) ) ( not ( = ?auto_164907 ?auto_164913 ) ) ( not ( = ?auto_164907 ?auto_164911 ) ) ( not ( = ?auto_164907 ?auto_164912 ) ) ( not ( = ?auto_164908 ?auto_164913 ) ) ( not ( = ?auto_164908 ?auto_164911 ) ) ( not ( = ?auto_164908 ?auto_164912 ) ) ( ON ?auto_164907 ?auto_164915 ) ( not ( = ?auto_164907 ?auto_164915 ) ) ( not ( = ?auto_164908 ?auto_164915 ) ) ( not ( = ?auto_164909 ?auto_164915 ) ) ( not ( = ?auto_164910 ?auto_164915 ) ) ( not ( = ?auto_164914 ?auto_164915 ) ) ( not ( = ?auto_164913 ?auto_164915 ) ) ( not ( = ?auto_164911 ?auto_164915 ) ) ( not ( = ?auto_164912 ?auto_164915 ) ) ( ON ?auto_164908 ?auto_164907 ) ( ON-TABLE ?auto_164915 ) ( ON ?auto_164909 ?auto_164908 ) ( ON ?auto_164910 ?auto_164909 ) ( ON ?auto_164914 ?auto_164910 ) ( CLEAR ?auto_164911 ) ( ON ?auto_164912 ?auto_164914 ) ( CLEAR ?auto_164912 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_164915 ?auto_164907 ?auto_164908 ?auto_164909 ?auto_164910 ?auto_164914 )
      ( MAKE-4PILE ?auto_164907 ?auto_164908 ?auto_164909 ?auto_164910 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_164916 - BLOCK
      ?auto_164917 - BLOCK
      ?auto_164918 - BLOCK
      ?auto_164919 - BLOCK
    )
    :vars
    (
      ?auto_164923 - BLOCK
      ?auto_164922 - BLOCK
      ?auto_164921 - BLOCK
      ?auto_164920 - BLOCK
      ?auto_164924 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_164916 ?auto_164917 ) ) ( not ( = ?auto_164916 ?auto_164918 ) ) ( not ( = ?auto_164916 ?auto_164919 ) ) ( not ( = ?auto_164917 ?auto_164918 ) ) ( not ( = ?auto_164917 ?auto_164919 ) ) ( not ( = ?auto_164918 ?auto_164919 ) ) ( not ( = ?auto_164916 ?auto_164923 ) ) ( not ( = ?auto_164917 ?auto_164923 ) ) ( not ( = ?auto_164918 ?auto_164923 ) ) ( not ( = ?auto_164919 ?auto_164923 ) ) ( ON-TABLE ?auto_164922 ) ( not ( = ?auto_164922 ?auto_164921 ) ) ( not ( = ?auto_164922 ?auto_164920 ) ) ( not ( = ?auto_164922 ?auto_164923 ) ) ( not ( = ?auto_164922 ?auto_164919 ) ) ( not ( = ?auto_164922 ?auto_164918 ) ) ( not ( = ?auto_164921 ?auto_164920 ) ) ( not ( = ?auto_164921 ?auto_164923 ) ) ( not ( = ?auto_164921 ?auto_164919 ) ) ( not ( = ?auto_164921 ?auto_164918 ) ) ( not ( = ?auto_164920 ?auto_164923 ) ) ( not ( = ?auto_164920 ?auto_164919 ) ) ( not ( = ?auto_164920 ?auto_164918 ) ) ( not ( = ?auto_164916 ?auto_164922 ) ) ( not ( = ?auto_164916 ?auto_164921 ) ) ( not ( = ?auto_164916 ?auto_164920 ) ) ( not ( = ?auto_164917 ?auto_164922 ) ) ( not ( = ?auto_164917 ?auto_164921 ) ) ( not ( = ?auto_164917 ?auto_164920 ) ) ( ON ?auto_164916 ?auto_164924 ) ( not ( = ?auto_164916 ?auto_164924 ) ) ( not ( = ?auto_164917 ?auto_164924 ) ) ( not ( = ?auto_164918 ?auto_164924 ) ) ( not ( = ?auto_164919 ?auto_164924 ) ) ( not ( = ?auto_164923 ?auto_164924 ) ) ( not ( = ?auto_164922 ?auto_164924 ) ) ( not ( = ?auto_164921 ?auto_164924 ) ) ( not ( = ?auto_164920 ?auto_164924 ) ) ( ON ?auto_164917 ?auto_164916 ) ( ON-TABLE ?auto_164924 ) ( ON ?auto_164918 ?auto_164917 ) ( ON ?auto_164919 ?auto_164918 ) ( ON ?auto_164923 ?auto_164919 ) ( ON ?auto_164920 ?auto_164923 ) ( CLEAR ?auto_164920 ) ( HOLDING ?auto_164921 ) ( CLEAR ?auto_164922 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_164922 ?auto_164921 )
      ( MAKE-4PILE ?auto_164916 ?auto_164917 ?auto_164918 ?auto_164919 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_164925 - BLOCK
      ?auto_164926 - BLOCK
      ?auto_164927 - BLOCK
      ?auto_164928 - BLOCK
    )
    :vars
    (
      ?auto_164932 - BLOCK
      ?auto_164933 - BLOCK
      ?auto_164930 - BLOCK
      ?auto_164931 - BLOCK
      ?auto_164929 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_164925 ?auto_164926 ) ) ( not ( = ?auto_164925 ?auto_164927 ) ) ( not ( = ?auto_164925 ?auto_164928 ) ) ( not ( = ?auto_164926 ?auto_164927 ) ) ( not ( = ?auto_164926 ?auto_164928 ) ) ( not ( = ?auto_164927 ?auto_164928 ) ) ( not ( = ?auto_164925 ?auto_164932 ) ) ( not ( = ?auto_164926 ?auto_164932 ) ) ( not ( = ?auto_164927 ?auto_164932 ) ) ( not ( = ?auto_164928 ?auto_164932 ) ) ( ON-TABLE ?auto_164933 ) ( not ( = ?auto_164933 ?auto_164930 ) ) ( not ( = ?auto_164933 ?auto_164931 ) ) ( not ( = ?auto_164933 ?auto_164932 ) ) ( not ( = ?auto_164933 ?auto_164928 ) ) ( not ( = ?auto_164933 ?auto_164927 ) ) ( not ( = ?auto_164930 ?auto_164931 ) ) ( not ( = ?auto_164930 ?auto_164932 ) ) ( not ( = ?auto_164930 ?auto_164928 ) ) ( not ( = ?auto_164930 ?auto_164927 ) ) ( not ( = ?auto_164931 ?auto_164932 ) ) ( not ( = ?auto_164931 ?auto_164928 ) ) ( not ( = ?auto_164931 ?auto_164927 ) ) ( not ( = ?auto_164925 ?auto_164933 ) ) ( not ( = ?auto_164925 ?auto_164930 ) ) ( not ( = ?auto_164925 ?auto_164931 ) ) ( not ( = ?auto_164926 ?auto_164933 ) ) ( not ( = ?auto_164926 ?auto_164930 ) ) ( not ( = ?auto_164926 ?auto_164931 ) ) ( ON ?auto_164925 ?auto_164929 ) ( not ( = ?auto_164925 ?auto_164929 ) ) ( not ( = ?auto_164926 ?auto_164929 ) ) ( not ( = ?auto_164927 ?auto_164929 ) ) ( not ( = ?auto_164928 ?auto_164929 ) ) ( not ( = ?auto_164932 ?auto_164929 ) ) ( not ( = ?auto_164933 ?auto_164929 ) ) ( not ( = ?auto_164930 ?auto_164929 ) ) ( not ( = ?auto_164931 ?auto_164929 ) ) ( ON ?auto_164926 ?auto_164925 ) ( ON-TABLE ?auto_164929 ) ( ON ?auto_164927 ?auto_164926 ) ( ON ?auto_164928 ?auto_164927 ) ( ON ?auto_164932 ?auto_164928 ) ( ON ?auto_164931 ?auto_164932 ) ( CLEAR ?auto_164933 ) ( ON ?auto_164930 ?auto_164931 ) ( CLEAR ?auto_164930 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_164929 ?auto_164925 ?auto_164926 ?auto_164927 ?auto_164928 ?auto_164932 ?auto_164931 )
      ( MAKE-4PILE ?auto_164925 ?auto_164926 ?auto_164927 ?auto_164928 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_164934 - BLOCK
      ?auto_164935 - BLOCK
      ?auto_164936 - BLOCK
      ?auto_164937 - BLOCK
    )
    :vars
    (
      ?auto_164939 - BLOCK
      ?auto_164942 - BLOCK
      ?auto_164938 - BLOCK
      ?auto_164941 - BLOCK
      ?auto_164940 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_164934 ?auto_164935 ) ) ( not ( = ?auto_164934 ?auto_164936 ) ) ( not ( = ?auto_164934 ?auto_164937 ) ) ( not ( = ?auto_164935 ?auto_164936 ) ) ( not ( = ?auto_164935 ?auto_164937 ) ) ( not ( = ?auto_164936 ?auto_164937 ) ) ( not ( = ?auto_164934 ?auto_164939 ) ) ( not ( = ?auto_164935 ?auto_164939 ) ) ( not ( = ?auto_164936 ?auto_164939 ) ) ( not ( = ?auto_164937 ?auto_164939 ) ) ( not ( = ?auto_164942 ?auto_164938 ) ) ( not ( = ?auto_164942 ?auto_164941 ) ) ( not ( = ?auto_164942 ?auto_164939 ) ) ( not ( = ?auto_164942 ?auto_164937 ) ) ( not ( = ?auto_164942 ?auto_164936 ) ) ( not ( = ?auto_164938 ?auto_164941 ) ) ( not ( = ?auto_164938 ?auto_164939 ) ) ( not ( = ?auto_164938 ?auto_164937 ) ) ( not ( = ?auto_164938 ?auto_164936 ) ) ( not ( = ?auto_164941 ?auto_164939 ) ) ( not ( = ?auto_164941 ?auto_164937 ) ) ( not ( = ?auto_164941 ?auto_164936 ) ) ( not ( = ?auto_164934 ?auto_164942 ) ) ( not ( = ?auto_164934 ?auto_164938 ) ) ( not ( = ?auto_164934 ?auto_164941 ) ) ( not ( = ?auto_164935 ?auto_164942 ) ) ( not ( = ?auto_164935 ?auto_164938 ) ) ( not ( = ?auto_164935 ?auto_164941 ) ) ( ON ?auto_164934 ?auto_164940 ) ( not ( = ?auto_164934 ?auto_164940 ) ) ( not ( = ?auto_164935 ?auto_164940 ) ) ( not ( = ?auto_164936 ?auto_164940 ) ) ( not ( = ?auto_164937 ?auto_164940 ) ) ( not ( = ?auto_164939 ?auto_164940 ) ) ( not ( = ?auto_164942 ?auto_164940 ) ) ( not ( = ?auto_164938 ?auto_164940 ) ) ( not ( = ?auto_164941 ?auto_164940 ) ) ( ON ?auto_164935 ?auto_164934 ) ( ON-TABLE ?auto_164940 ) ( ON ?auto_164936 ?auto_164935 ) ( ON ?auto_164937 ?auto_164936 ) ( ON ?auto_164939 ?auto_164937 ) ( ON ?auto_164941 ?auto_164939 ) ( ON ?auto_164938 ?auto_164941 ) ( CLEAR ?auto_164938 ) ( HOLDING ?auto_164942 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_164942 )
      ( MAKE-4PILE ?auto_164934 ?auto_164935 ?auto_164936 ?auto_164937 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_164943 - BLOCK
      ?auto_164944 - BLOCK
      ?auto_164945 - BLOCK
      ?auto_164946 - BLOCK
    )
    :vars
    (
      ?auto_164951 - BLOCK
      ?auto_164947 - BLOCK
      ?auto_164950 - BLOCK
      ?auto_164949 - BLOCK
      ?auto_164948 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_164943 ?auto_164944 ) ) ( not ( = ?auto_164943 ?auto_164945 ) ) ( not ( = ?auto_164943 ?auto_164946 ) ) ( not ( = ?auto_164944 ?auto_164945 ) ) ( not ( = ?auto_164944 ?auto_164946 ) ) ( not ( = ?auto_164945 ?auto_164946 ) ) ( not ( = ?auto_164943 ?auto_164951 ) ) ( not ( = ?auto_164944 ?auto_164951 ) ) ( not ( = ?auto_164945 ?auto_164951 ) ) ( not ( = ?auto_164946 ?auto_164951 ) ) ( not ( = ?auto_164947 ?auto_164950 ) ) ( not ( = ?auto_164947 ?auto_164949 ) ) ( not ( = ?auto_164947 ?auto_164951 ) ) ( not ( = ?auto_164947 ?auto_164946 ) ) ( not ( = ?auto_164947 ?auto_164945 ) ) ( not ( = ?auto_164950 ?auto_164949 ) ) ( not ( = ?auto_164950 ?auto_164951 ) ) ( not ( = ?auto_164950 ?auto_164946 ) ) ( not ( = ?auto_164950 ?auto_164945 ) ) ( not ( = ?auto_164949 ?auto_164951 ) ) ( not ( = ?auto_164949 ?auto_164946 ) ) ( not ( = ?auto_164949 ?auto_164945 ) ) ( not ( = ?auto_164943 ?auto_164947 ) ) ( not ( = ?auto_164943 ?auto_164950 ) ) ( not ( = ?auto_164943 ?auto_164949 ) ) ( not ( = ?auto_164944 ?auto_164947 ) ) ( not ( = ?auto_164944 ?auto_164950 ) ) ( not ( = ?auto_164944 ?auto_164949 ) ) ( ON ?auto_164943 ?auto_164948 ) ( not ( = ?auto_164943 ?auto_164948 ) ) ( not ( = ?auto_164944 ?auto_164948 ) ) ( not ( = ?auto_164945 ?auto_164948 ) ) ( not ( = ?auto_164946 ?auto_164948 ) ) ( not ( = ?auto_164951 ?auto_164948 ) ) ( not ( = ?auto_164947 ?auto_164948 ) ) ( not ( = ?auto_164950 ?auto_164948 ) ) ( not ( = ?auto_164949 ?auto_164948 ) ) ( ON ?auto_164944 ?auto_164943 ) ( ON-TABLE ?auto_164948 ) ( ON ?auto_164945 ?auto_164944 ) ( ON ?auto_164946 ?auto_164945 ) ( ON ?auto_164951 ?auto_164946 ) ( ON ?auto_164949 ?auto_164951 ) ( ON ?auto_164950 ?auto_164949 ) ( ON ?auto_164947 ?auto_164950 ) ( CLEAR ?auto_164947 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_164948 ?auto_164943 ?auto_164944 ?auto_164945 ?auto_164946 ?auto_164951 ?auto_164949 ?auto_164950 )
      ( MAKE-4PILE ?auto_164943 ?auto_164944 ?auto_164945 ?auto_164946 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_164955 - BLOCK
      ?auto_164956 - BLOCK
      ?auto_164957 - BLOCK
    )
    :vars
    (
      ?auto_164958 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_164958 ?auto_164957 ) ( CLEAR ?auto_164958 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_164955 ) ( ON ?auto_164956 ?auto_164955 ) ( ON ?auto_164957 ?auto_164956 ) ( not ( = ?auto_164955 ?auto_164956 ) ) ( not ( = ?auto_164955 ?auto_164957 ) ) ( not ( = ?auto_164955 ?auto_164958 ) ) ( not ( = ?auto_164956 ?auto_164957 ) ) ( not ( = ?auto_164956 ?auto_164958 ) ) ( not ( = ?auto_164957 ?auto_164958 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_164958 ?auto_164957 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_164959 - BLOCK
      ?auto_164960 - BLOCK
      ?auto_164961 - BLOCK
    )
    :vars
    (
      ?auto_164962 - BLOCK
      ?auto_164963 - BLOCK
      ?auto_164964 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_164962 ?auto_164961 ) ( CLEAR ?auto_164962 ) ( ON-TABLE ?auto_164959 ) ( ON ?auto_164960 ?auto_164959 ) ( ON ?auto_164961 ?auto_164960 ) ( not ( = ?auto_164959 ?auto_164960 ) ) ( not ( = ?auto_164959 ?auto_164961 ) ) ( not ( = ?auto_164959 ?auto_164962 ) ) ( not ( = ?auto_164960 ?auto_164961 ) ) ( not ( = ?auto_164960 ?auto_164962 ) ) ( not ( = ?auto_164961 ?auto_164962 ) ) ( HOLDING ?auto_164963 ) ( CLEAR ?auto_164964 ) ( not ( = ?auto_164959 ?auto_164963 ) ) ( not ( = ?auto_164959 ?auto_164964 ) ) ( not ( = ?auto_164960 ?auto_164963 ) ) ( not ( = ?auto_164960 ?auto_164964 ) ) ( not ( = ?auto_164961 ?auto_164963 ) ) ( not ( = ?auto_164961 ?auto_164964 ) ) ( not ( = ?auto_164962 ?auto_164963 ) ) ( not ( = ?auto_164962 ?auto_164964 ) ) ( not ( = ?auto_164963 ?auto_164964 ) ) )
    :subtasks
    ( ( !STACK ?auto_164963 ?auto_164964 )
      ( MAKE-3PILE ?auto_164959 ?auto_164960 ?auto_164961 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_164965 - BLOCK
      ?auto_164966 - BLOCK
      ?auto_164967 - BLOCK
    )
    :vars
    (
      ?auto_164970 - BLOCK
      ?auto_164969 - BLOCK
      ?auto_164968 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_164970 ?auto_164967 ) ( ON-TABLE ?auto_164965 ) ( ON ?auto_164966 ?auto_164965 ) ( ON ?auto_164967 ?auto_164966 ) ( not ( = ?auto_164965 ?auto_164966 ) ) ( not ( = ?auto_164965 ?auto_164967 ) ) ( not ( = ?auto_164965 ?auto_164970 ) ) ( not ( = ?auto_164966 ?auto_164967 ) ) ( not ( = ?auto_164966 ?auto_164970 ) ) ( not ( = ?auto_164967 ?auto_164970 ) ) ( CLEAR ?auto_164969 ) ( not ( = ?auto_164965 ?auto_164968 ) ) ( not ( = ?auto_164965 ?auto_164969 ) ) ( not ( = ?auto_164966 ?auto_164968 ) ) ( not ( = ?auto_164966 ?auto_164969 ) ) ( not ( = ?auto_164967 ?auto_164968 ) ) ( not ( = ?auto_164967 ?auto_164969 ) ) ( not ( = ?auto_164970 ?auto_164968 ) ) ( not ( = ?auto_164970 ?auto_164969 ) ) ( not ( = ?auto_164968 ?auto_164969 ) ) ( ON ?auto_164968 ?auto_164970 ) ( CLEAR ?auto_164968 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_164965 ?auto_164966 ?auto_164967 ?auto_164970 )
      ( MAKE-3PILE ?auto_164965 ?auto_164966 ?auto_164967 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_164971 - BLOCK
      ?auto_164972 - BLOCK
      ?auto_164973 - BLOCK
    )
    :vars
    (
      ?auto_164976 - BLOCK
      ?auto_164974 - BLOCK
      ?auto_164975 - BLOCK
      ?auto_164977 - BLOCK
      ?auto_164978 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_164976 ?auto_164973 ) ( ON-TABLE ?auto_164971 ) ( ON ?auto_164972 ?auto_164971 ) ( ON ?auto_164973 ?auto_164972 ) ( not ( = ?auto_164971 ?auto_164972 ) ) ( not ( = ?auto_164971 ?auto_164973 ) ) ( not ( = ?auto_164971 ?auto_164976 ) ) ( not ( = ?auto_164972 ?auto_164973 ) ) ( not ( = ?auto_164972 ?auto_164976 ) ) ( not ( = ?auto_164973 ?auto_164976 ) ) ( not ( = ?auto_164971 ?auto_164974 ) ) ( not ( = ?auto_164971 ?auto_164975 ) ) ( not ( = ?auto_164972 ?auto_164974 ) ) ( not ( = ?auto_164972 ?auto_164975 ) ) ( not ( = ?auto_164973 ?auto_164974 ) ) ( not ( = ?auto_164973 ?auto_164975 ) ) ( not ( = ?auto_164976 ?auto_164974 ) ) ( not ( = ?auto_164976 ?auto_164975 ) ) ( not ( = ?auto_164974 ?auto_164975 ) ) ( ON ?auto_164974 ?auto_164976 ) ( CLEAR ?auto_164974 ) ( HOLDING ?auto_164975 ) ( CLEAR ?auto_164977 ) ( ON-TABLE ?auto_164978 ) ( ON ?auto_164977 ?auto_164978 ) ( not ( = ?auto_164978 ?auto_164977 ) ) ( not ( = ?auto_164978 ?auto_164975 ) ) ( not ( = ?auto_164977 ?auto_164975 ) ) ( not ( = ?auto_164971 ?auto_164977 ) ) ( not ( = ?auto_164971 ?auto_164978 ) ) ( not ( = ?auto_164972 ?auto_164977 ) ) ( not ( = ?auto_164972 ?auto_164978 ) ) ( not ( = ?auto_164973 ?auto_164977 ) ) ( not ( = ?auto_164973 ?auto_164978 ) ) ( not ( = ?auto_164976 ?auto_164977 ) ) ( not ( = ?auto_164976 ?auto_164978 ) ) ( not ( = ?auto_164974 ?auto_164977 ) ) ( not ( = ?auto_164974 ?auto_164978 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_164978 ?auto_164977 ?auto_164975 )
      ( MAKE-3PILE ?auto_164971 ?auto_164972 ?auto_164973 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_164979 - BLOCK
      ?auto_164980 - BLOCK
      ?auto_164981 - BLOCK
    )
    :vars
    (
      ?auto_164986 - BLOCK
      ?auto_164983 - BLOCK
      ?auto_164982 - BLOCK
      ?auto_164984 - BLOCK
      ?auto_164985 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_164986 ?auto_164981 ) ( ON-TABLE ?auto_164979 ) ( ON ?auto_164980 ?auto_164979 ) ( ON ?auto_164981 ?auto_164980 ) ( not ( = ?auto_164979 ?auto_164980 ) ) ( not ( = ?auto_164979 ?auto_164981 ) ) ( not ( = ?auto_164979 ?auto_164986 ) ) ( not ( = ?auto_164980 ?auto_164981 ) ) ( not ( = ?auto_164980 ?auto_164986 ) ) ( not ( = ?auto_164981 ?auto_164986 ) ) ( not ( = ?auto_164979 ?auto_164983 ) ) ( not ( = ?auto_164979 ?auto_164982 ) ) ( not ( = ?auto_164980 ?auto_164983 ) ) ( not ( = ?auto_164980 ?auto_164982 ) ) ( not ( = ?auto_164981 ?auto_164983 ) ) ( not ( = ?auto_164981 ?auto_164982 ) ) ( not ( = ?auto_164986 ?auto_164983 ) ) ( not ( = ?auto_164986 ?auto_164982 ) ) ( not ( = ?auto_164983 ?auto_164982 ) ) ( ON ?auto_164983 ?auto_164986 ) ( CLEAR ?auto_164984 ) ( ON-TABLE ?auto_164985 ) ( ON ?auto_164984 ?auto_164985 ) ( not ( = ?auto_164985 ?auto_164984 ) ) ( not ( = ?auto_164985 ?auto_164982 ) ) ( not ( = ?auto_164984 ?auto_164982 ) ) ( not ( = ?auto_164979 ?auto_164984 ) ) ( not ( = ?auto_164979 ?auto_164985 ) ) ( not ( = ?auto_164980 ?auto_164984 ) ) ( not ( = ?auto_164980 ?auto_164985 ) ) ( not ( = ?auto_164981 ?auto_164984 ) ) ( not ( = ?auto_164981 ?auto_164985 ) ) ( not ( = ?auto_164986 ?auto_164984 ) ) ( not ( = ?auto_164986 ?auto_164985 ) ) ( not ( = ?auto_164983 ?auto_164984 ) ) ( not ( = ?auto_164983 ?auto_164985 ) ) ( ON ?auto_164982 ?auto_164983 ) ( CLEAR ?auto_164982 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_164979 ?auto_164980 ?auto_164981 ?auto_164986 ?auto_164983 )
      ( MAKE-3PILE ?auto_164979 ?auto_164980 ?auto_164981 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_164987 - BLOCK
      ?auto_164988 - BLOCK
      ?auto_164989 - BLOCK
    )
    :vars
    (
      ?auto_164990 - BLOCK
      ?auto_164992 - BLOCK
      ?auto_164993 - BLOCK
      ?auto_164991 - BLOCK
      ?auto_164994 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_164990 ?auto_164989 ) ( ON-TABLE ?auto_164987 ) ( ON ?auto_164988 ?auto_164987 ) ( ON ?auto_164989 ?auto_164988 ) ( not ( = ?auto_164987 ?auto_164988 ) ) ( not ( = ?auto_164987 ?auto_164989 ) ) ( not ( = ?auto_164987 ?auto_164990 ) ) ( not ( = ?auto_164988 ?auto_164989 ) ) ( not ( = ?auto_164988 ?auto_164990 ) ) ( not ( = ?auto_164989 ?auto_164990 ) ) ( not ( = ?auto_164987 ?auto_164992 ) ) ( not ( = ?auto_164987 ?auto_164993 ) ) ( not ( = ?auto_164988 ?auto_164992 ) ) ( not ( = ?auto_164988 ?auto_164993 ) ) ( not ( = ?auto_164989 ?auto_164992 ) ) ( not ( = ?auto_164989 ?auto_164993 ) ) ( not ( = ?auto_164990 ?auto_164992 ) ) ( not ( = ?auto_164990 ?auto_164993 ) ) ( not ( = ?auto_164992 ?auto_164993 ) ) ( ON ?auto_164992 ?auto_164990 ) ( ON-TABLE ?auto_164991 ) ( not ( = ?auto_164991 ?auto_164994 ) ) ( not ( = ?auto_164991 ?auto_164993 ) ) ( not ( = ?auto_164994 ?auto_164993 ) ) ( not ( = ?auto_164987 ?auto_164994 ) ) ( not ( = ?auto_164987 ?auto_164991 ) ) ( not ( = ?auto_164988 ?auto_164994 ) ) ( not ( = ?auto_164988 ?auto_164991 ) ) ( not ( = ?auto_164989 ?auto_164994 ) ) ( not ( = ?auto_164989 ?auto_164991 ) ) ( not ( = ?auto_164990 ?auto_164994 ) ) ( not ( = ?auto_164990 ?auto_164991 ) ) ( not ( = ?auto_164992 ?auto_164994 ) ) ( not ( = ?auto_164992 ?auto_164991 ) ) ( ON ?auto_164993 ?auto_164992 ) ( CLEAR ?auto_164993 ) ( HOLDING ?auto_164994 ) ( CLEAR ?auto_164991 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_164991 ?auto_164994 )
      ( MAKE-3PILE ?auto_164987 ?auto_164988 ?auto_164989 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_164995 - BLOCK
      ?auto_164996 - BLOCK
      ?auto_164997 - BLOCK
    )
    :vars
    (
      ?auto_164999 - BLOCK
      ?auto_165000 - BLOCK
      ?auto_165002 - BLOCK
      ?auto_165001 - BLOCK
      ?auto_164998 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_164999 ?auto_164997 ) ( ON-TABLE ?auto_164995 ) ( ON ?auto_164996 ?auto_164995 ) ( ON ?auto_164997 ?auto_164996 ) ( not ( = ?auto_164995 ?auto_164996 ) ) ( not ( = ?auto_164995 ?auto_164997 ) ) ( not ( = ?auto_164995 ?auto_164999 ) ) ( not ( = ?auto_164996 ?auto_164997 ) ) ( not ( = ?auto_164996 ?auto_164999 ) ) ( not ( = ?auto_164997 ?auto_164999 ) ) ( not ( = ?auto_164995 ?auto_165000 ) ) ( not ( = ?auto_164995 ?auto_165002 ) ) ( not ( = ?auto_164996 ?auto_165000 ) ) ( not ( = ?auto_164996 ?auto_165002 ) ) ( not ( = ?auto_164997 ?auto_165000 ) ) ( not ( = ?auto_164997 ?auto_165002 ) ) ( not ( = ?auto_164999 ?auto_165000 ) ) ( not ( = ?auto_164999 ?auto_165002 ) ) ( not ( = ?auto_165000 ?auto_165002 ) ) ( ON ?auto_165000 ?auto_164999 ) ( ON-TABLE ?auto_165001 ) ( not ( = ?auto_165001 ?auto_164998 ) ) ( not ( = ?auto_165001 ?auto_165002 ) ) ( not ( = ?auto_164998 ?auto_165002 ) ) ( not ( = ?auto_164995 ?auto_164998 ) ) ( not ( = ?auto_164995 ?auto_165001 ) ) ( not ( = ?auto_164996 ?auto_164998 ) ) ( not ( = ?auto_164996 ?auto_165001 ) ) ( not ( = ?auto_164997 ?auto_164998 ) ) ( not ( = ?auto_164997 ?auto_165001 ) ) ( not ( = ?auto_164999 ?auto_164998 ) ) ( not ( = ?auto_164999 ?auto_165001 ) ) ( not ( = ?auto_165000 ?auto_164998 ) ) ( not ( = ?auto_165000 ?auto_165001 ) ) ( ON ?auto_165002 ?auto_165000 ) ( CLEAR ?auto_165001 ) ( ON ?auto_164998 ?auto_165002 ) ( CLEAR ?auto_164998 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_164995 ?auto_164996 ?auto_164997 ?auto_164999 ?auto_165000 ?auto_165002 )
      ( MAKE-3PILE ?auto_164995 ?auto_164996 ?auto_164997 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_165003 - BLOCK
      ?auto_165004 - BLOCK
      ?auto_165005 - BLOCK
    )
    :vars
    (
      ?auto_165009 - BLOCK
      ?auto_165010 - BLOCK
      ?auto_165006 - BLOCK
      ?auto_165008 - BLOCK
      ?auto_165007 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_165009 ?auto_165005 ) ( ON-TABLE ?auto_165003 ) ( ON ?auto_165004 ?auto_165003 ) ( ON ?auto_165005 ?auto_165004 ) ( not ( = ?auto_165003 ?auto_165004 ) ) ( not ( = ?auto_165003 ?auto_165005 ) ) ( not ( = ?auto_165003 ?auto_165009 ) ) ( not ( = ?auto_165004 ?auto_165005 ) ) ( not ( = ?auto_165004 ?auto_165009 ) ) ( not ( = ?auto_165005 ?auto_165009 ) ) ( not ( = ?auto_165003 ?auto_165010 ) ) ( not ( = ?auto_165003 ?auto_165006 ) ) ( not ( = ?auto_165004 ?auto_165010 ) ) ( not ( = ?auto_165004 ?auto_165006 ) ) ( not ( = ?auto_165005 ?auto_165010 ) ) ( not ( = ?auto_165005 ?auto_165006 ) ) ( not ( = ?auto_165009 ?auto_165010 ) ) ( not ( = ?auto_165009 ?auto_165006 ) ) ( not ( = ?auto_165010 ?auto_165006 ) ) ( ON ?auto_165010 ?auto_165009 ) ( not ( = ?auto_165008 ?auto_165007 ) ) ( not ( = ?auto_165008 ?auto_165006 ) ) ( not ( = ?auto_165007 ?auto_165006 ) ) ( not ( = ?auto_165003 ?auto_165007 ) ) ( not ( = ?auto_165003 ?auto_165008 ) ) ( not ( = ?auto_165004 ?auto_165007 ) ) ( not ( = ?auto_165004 ?auto_165008 ) ) ( not ( = ?auto_165005 ?auto_165007 ) ) ( not ( = ?auto_165005 ?auto_165008 ) ) ( not ( = ?auto_165009 ?auto_165007 ) ) ( not ( = ?auto_165009 ?auto_165008 ) ) ( not ( = ?auto_165010 ?auto_165007 ) ) ( not ( = ?auto_165010 ?auto_165008 ) ) ( ON ?auto_165006 ?auto_165010 ) ( ON ?auto_165007 ?auto_165006 ) ( CLEAR ?auto_165007 ) ( HOLDING ?auto_165008 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_165008 )
      ( MAKE-3PILE ?auto_165003 ?auto_165004 ?auto_165005 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_165011 - BLOCK
      ?auto_165012 - BLOCK
      ?auto_165013 - BLOCK
    )
    :vars
    (
      ?auto_165016 - BLOCK
      ?auto_165015 - BLOCK
      ?auto_165018 - BLOCK
      ?auto_165014 - BLOCK
      ?auto_165017 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_165016 ?auto_165013 ) ( ON-TABLE ?auto_165011 ) ( ON ?auto_165012 ?auto_165011 ) ( ON ?auto_165013 ?auto_165012 ) ( not ( = ?auto_165011 ?auto_165012 ) ) ( not ( = ?auto_165011 ?auto_165013 ) ) ( not ( = ?auto_165011 ?auto_165016 ) ) ( not ( = ?auto_165012 ?auto_165013 ) ) ( not ( = ?auto_165012 ?auto_165016 ) ) ( not ( = ?auto_165013 ?auto_165016 ) ) ( not ( = ?auto_165011 ?auto_165015 ) ) ( not ( = ?auto_165011 ?auto_165018 ) ) ( not ( = ?auto_165012 ?auto_165015 ) ) ( not ( = ?auto_165012 ?auto_165018 ) ) ( not ( = ?auto_165013 ?auto_165015 ) ) ( not ( = ?auto_165013 ?auto_165018 ) ) ( not ( = ?auto_165016 ?auto_165015 ) ) ( not ( = ?auto_165016 ?auto_165018 ) ) ( not ( = ?auto_165015 ?auto_165018 ) ) ( ON ?auto_165015 ?auto_165016 ) ( not ( = ?auto_165014 ?auto_165017 ) ) ( not ( = ?auto_165014 ?auto_165018 ) ) ( not ( = ?auto_165017 ?auto_165018 ) ) ( not ( = ?auto_165011 ?auto_165017 ) ) ( not ( = ?auto_165011 ?auto_165014 ) ) ( not ( = ?auto_165012 ?auto_165017 ) ) ( not ( = ?auto_165012 ?auto_165014 ) ) ( not ( = ?auto_165013 ?auto_165017 ) ) ( not ( = ?auto_165013 ?auto_165014 ) ) ( not ( = ?auto_165016 ?auto_165017 ) ) ( not ( = ?auto_165016 ?auto_165014 ) ) ( not ( = ?auto_165015 ?auto_165017 ) ) ( not ( = ?auto_165015 ?auto_165014 ) ) ( ON ?auto_165018 ?auto_165015 ) ( ON ?auto_165017 ?auto_165018 ) ( ON ?auto_165014 ?auto_165017 ) ( CLEAR ?auto_165014 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_165011 ?auto_165012 ?auto_165013 ?auto_165016 ?auto_165015 ?auto_165018 ?auto_165017 )
      ( MAKE-3PILE ?auto_165011 ?auto_165012 ?auto_165013 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_165019 - BLOCK
      ?auto_165020 - BLOCK
      ?auto_165021 - BLOCK
    )
    :vars
    (
      ?auto_165025 - BLOCK
      ?auto_165022 - BLOCK
      ?auto_165023 - BLOCK
      ?auto_165026 - BLOCK
      ?auto_165024 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_165025 ?auto_165021 ) ( ON-TABLE ?auto_165019 ) ( ON ?auto_165020 ?auto_165019 ) ( ON ?auto_165021 ?auto_165020 ) ( not ( = ?auto_165019 ?auto_165020 ) ) ( not ( = ?auto_165019 ?auto_165021 ) ) ( not ( = ?auto_165019 ?auto_165025 ) ) ( not ( = ?auto_165020 ?auto_165021 ) ) ( not ( = ?auto_165020 ?auto_165025 ) ) ( not ( = ?auto_165021 ?auto_165025 ) ) ( not ( = ?auto_165019 ?auto_165022 ) ) ( not ( = ?auto_165019 ?auto_165023 ) ) ( not ( = ?auto_165020 ?auto_165022 ) ) ( not ( = ?auto_165020 ?auto_165023 ) ) ( not ( = ?auto_165021 ?auto_165022 ) ) ( not ( = ?auto_165021 ?auto_165023 ) ) ( not ( = ?auto_165025 ?auto_165022 ) ) ( not ( = ?auto_165025 ?auto_165023 ) ) ( not ( = ?auto_165022 ?auto_165023 ) ) ( ON ?auto_165022 ?auto_165025 ) ( not ( = ?auto_165026 ?auto_165024 ) ) ( not ( = ?auto_165026 ?auto_165023 ) ) ( not ( = ?auto_165024 ?auto_165023 ) ) ( not ( = ?auto_165019 ?auto_165024 ) ) ( not ( = ?auto_165019 ?auto_165026 ) ) ( not ( = ?auto_165020 ?auto_165024 ) ) ( not ( = ?auto_165020 ?auto_165026 ) ) ( not ( = ?auto_165021 ?auto_165024 ) ) ( not ( = ?auto_165021 ?auto_165026 ) ) ( not ( = ?auto_165025 ?auto_165024 ) ) ( not ( = ?auto_165025 ?auto_165026 ) ) ( not ( = ?auto_165022 ?auto_165024 ) ) ( not ( = ?auto_165022 ?auto_165026 ) ) ( ON ?auto_165023 ?auto_165022 ) ( ON ?auto_165024 ?auto_165023 ) ( HOLDING ?auto_165026 ) ( CLEAR ?auto_165024 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_165019 ?auto_165020 ?auto_165021 ?auto_165025 ?auto_165022 ?auto_165023 ?auto_165024 ?auto_165026 )
      ( MAKE-3PILE ?auto_165019 ?auto_165020 ?auto_165021 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_165027 - BLOCK
      ?auto_165028 - BLOCK
      ?auto_165029 - BLOCK
    )
    :vars
    (
      ?auto_165030 - BLOCK
      ?auto_165031 - BLOCK
      ?auto_165032 - BLOCK
      ?auto_165033 - BLOCK
      ?auto_165034 - BLOCK
      ?auto_165035 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_165030 ?auto_165029 ) ( ON-TABLE ?auto_165027 ) ( ON ?auto_165028 ?auto_165027 ) ( ON ?auto_165029 ?auto_165028 ) ( not ( = ?auto_165027 ?auto_165028 ) ) ( not ( = ?auto_165027 ?auto_165029 ) ) ( not ( = ?auto_165027 ?auto_165030 ) ) ( not ( = ?auto_165028 ?auto_165029 ) ) ( not ( = ?auto_165028 ?auto_165030 ) ) ( not ( = ?auto_165029 ?auto_165030 ) ) ( not ( = ?auto_165027 ?auto_165031 ) ) ( not ( = ?auto_165027 ?auto_165032 ) ) ( not ( = ?auto_165028 ?auto_165031 ) ) ( not ( = ?auto_165028 ?auto_165032 ) ) ( not ( = ?auto_165029 ?auto_165031 ) ) ( not ( = ?auto_165029 ?auto_165032 ) ) ( not ( = ?auto_165030 ?auto_165031 ) ) ( not ( = ?auto_165030 ?auto_165032 ) ) ( not ( = ?auto_165031 ?auto_165032 ) ) ( ON ?auto_165031 ?auto_165030 ) ( not ( = ?auto_165033 ?auto_165034 ) ) ( not ( = ?auto_165033 ?auto_165032 ) ) ( not ( = ?auto_165034 ?auto_165032 ) ) ( not ( = ?auto_165027 ?auto_165034 ) ) ( not ( = ?auto_165027 ?auto_165033 ) ) ( not ( = ?auto_165028 ?auto_165034 ) ) ( not ( = ?auto_165028 ?auto_165033 ) ) ( not ( = ?auto_165029 ?auto_165034 ) ) ( not ( = ?auto_165029 ?auto_165033 ) ) ( not ( = ?auto_165030 ?auto_165034 ) ) ( not ( = ?auto_165030 ?auto_165033 ) ) ( not ( = ?auto_165031 ?auto_165034 ) ) ( not ( = ?auto_165031 ?auto_165033 ) ) ( ON ?auto_165032 ?auto_165031 ) ( ON ?auto_165034 ?auto_165032 ) ( CLEAR ?auto_165034 ) ( ON ?auto_165033 ?auto_165035 ) ( CLEAR ?auto_165033 ) ( HAND-EMPTY ) ( not ( = ?auto_165027 ?auto_165035 ) ) ( not ( = ?auto_165028 ?auto_165035 ) ) ( not ( = ?auto_165029 ?auto_165035 ) ) ( not ( = ?auto_165030 ?auto_165035 ) ) ( not ( = ?auto_165031 ?auto_165035 ) ) ( not ( = ?auto_165032 ?auto_165035 ) ) ( not ( = ?auto_165033 ?auto_165035 ) ) ( not ( = ?auto_165034 ?auto_165035 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_165033 ?auto_165035 )
      ( MAKE-3PILE ?auto_165027 ?auto_165028 ?auto_165029 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_165036 - BLOCK
      ?auto_165037 - BLOCK
      ?auto_165038 - BLOCK
    )
    :vars
    (
      ?auto_165040 - BLOCK
      ?auto_165041 - BLOCK
      ?auto_165043 - BLOCK
      ?auto_165042 - BLOCK
      ?auto_165039 - BLOCK
      ?auto_165044 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_165040 ?auto_165038 ) ( ON-TABLE ?auto_165036 ) ( ON ?auto_165037 ?auto_165036 ) ( ON ?auto_165038 ?auto_165037 ) ( not ( = ?auto_165036 ?auto_165037 ) ) ( not ( = ?auto_165036 ?auto_165038 ) ) ( not ( = ?auto_165036 ?auto_165040 ) ) ( not ( = ?auto_165037 ?auto_165038 ) ) ( not ( = ?auto_165037 ?auto_165040 ) ) ( not ( = ?auto_165038 ?auto_165040 ) ) ( not ( = ?auto_165036 ?auto_165041 ) ) ( not ( = ?auto_165036 ?auto_165043 ) ) ( not ( = ?auto_165037 ?auto_165041 ) ) ( not ( = ?auto_165037 ?auto_165043 ) ) ( not ( = ?auto_165038 ?auto_165041 ) ) ( not ( = ?auto_165038 ?auto_165043 ) ) ( not ( = ?auto_165040 ?auto_165041 ) ) ( not ( = ?auto_165040 ?auto_165043 ) ) ( not ( = ?auto_165041 ?auto_165043 ) ) ( ON ?auto_165041 ?auto_165040 ) ( not ( = ?auto_165042 ?auto_165039 ) ) ( not ( = ?auto_165042 ?auto_165043 ) ) ( not ( = ?auto_165039 ?auto_165043 ) ) ( not ( = ?auto_165036 ?auto_165039 ) ) ( not ( = ?auto_165036 ?auto_165042 ) ) ( not ( = ?auto_165037 ?auto_165039 ) ) ( not ( = ?auto_165037 ?auto_165042 ) ) ( not ( = ?auto_165038 ?auto_165039 ) ) ( not ( = ?auto_165038 ?auto_165042 ) ) ( not ( = ?auto_165040 ?auto_165039 ) ) ( not ( = ?auto_165040 ?auto_165042 ) ) ( not ( = ?auto_165041 ?auto_165039 ) ) ( not ( = ?auto_165041 ?auto_165042 ) ) ( ON ?auto_165043 ?auto_165041 ) ( ON ?auto_165042 ?auto_165044 ) ( CLEAR ?auto_165042 ) ( not ( = ?auto_165036 ?auto_165044 ) ) ( not ( = ?auto_165037 ?auto_165044 ) ) ( not ( = ?auto_165038 ?auto_165044 ) ) ( not ( = ?auto_165040 ?auto_165044 ) ) ( not ( = ?auto_165041 ?auto_165044 ) ) ( not ( = ?auto_165043 ?auto_165044 ) ) ( not ( = ?auto_165042 ?auto_165044 ) ) ( not ( = ?auto_165039 ?auto_165044 ) ) ( HOLDING ?auto_165039 ) ( CLEAR ?auto_165043 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_165036 ?auto_165037 ?auto_165038 ?auto_165040 ?auto_165041 ?auto_165043 ?auto_165039 )
      ( MAKE-3PILE ?auto_165036 ?auto_165037 ?auto_165038 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_165045 - BLOCK
      ?auto_165046 - BLOCK
      ?auto_165047 - BLOCK
    )
    :vars
    (
      ?auto_165050 - BLOCK
      ?auto_165053 - BLOCK
      ?auto_165051 - BLOCK
      ?auto_165052 - BLOCK
      ?auto_165048 - BLOCK
      ?auto_165049 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_165050 ?auto_165047 ) ( ON-TABLE ?auto_165045 ) ( ON ?auto_165046 ?auto_165045 ) ( ON ?auto_165047 ?auto_165046 ) ( not ( = ?auto_165045 ?auto_165046 ) ) ( not ( = ?auto_165045 ?auto_165047 ) ) ( not ( = ?auto_165045 ?auto_165050 ) ) ( not ( = ?auto_165046 ?auto_165047 ) ) ( not ( = ?auto_165046 ?auto_165050 ) ) ( not ( = ?auto_165047 ?auto_165050 ) ) ( not ( = ?auto_165045 ?auto_165053 ) ) ( not ( = ?auto_165045 ?auto_165051 ) ) ( not ( = ?auto_165046 ?auto_165053 ) ) ( not ( = ?auto_165046 ?auto_165051 ) ) ( not ( = ?auto_165047 ?auto_165053 ) ) ( not ( = ?auto_165047 ?auto_165051 ) ) ( not ( = ?auto_165050 ?auto_165053 ) ) ( not ( = ?auto_165050 ?auto_165051 ) ) ( not ( = ?auto_165053 ?auto_165051 ) ) ( ON ?auto_165053 ?auto_165050 ) ( not ( = ?auto_165052 ?auto_165048 ) ) ( not ( = ?auto_165052 ?auto_165051 ) ) ( not ( = ?auto_165048 ?auto_165051 ) ) ( not ( = ?auto_165045 ?auto_165048 ) ) ( not ( = ?auto_165045 ?auto_165052 ) ) ( not ( = ?auto_165046 ?auto_165048 ) ) ( not ( = ?auto_165046 ?auto_165052 ) ) ( not ( = ?auto_165047 ?auto_165048 ) ) ( not ( = ?auto_165047 ?auto_165052 ) ) ( not ( = ?auto_165050 ?auto_165048 ) ) ( not ( = ?auto_165050 ?auto_165052 ) ) ( not ( = ?auto_165053 ?auto_165048 ) ) ( not ( = ?auto_165053 ?auto_165052 ) ) ( ON ?auto_165051 ?auto_165053 ) ( ON ?auto_165052 ?auto_165049 ) ( not ( = ?auto_165045 ?auto_165049 ) ) ( not ( = ?auto_165046 ?auto_165049 ) ) ( not ( = ?auto_165047 ?auto_165049 ) ) ( not ( = ?auto_165050 ?auto_165049 ) ) ( not ( = ?auto_165053 ?auto_165049 ) ) ( not ( = ?auto_165051 ?auto_165049 ) ) ( not ( = ?auto_165052 ?auto_165049 ) ) ( not ( = ?auto_165048 ?auto_165049 ) ) ( CLEAR ?auto_165051 ) ( ON ?auto_165048 ?auto_165052 ) ( CLEAR ?auto_165048 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_165049 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_165049 ?auto_165052 )
      ( MAKE-3PILE ?auto_165045 ?auto_165046 ?auto_165047 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_165054 - BLOCK
      ?auto_165055 - BLOCK
      ?auto_165056 - BLOCK
    )
    :vars
    (
      ?auto_165058 - BLOCK
      ?auto_165059 - BLOCK
      ?auto_165062 - BLOCK
      ?auto_165061 - BLOCK
      ?auto_165057 - BLOCK
      ?auto_165060 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_165058 ?auto_165056 ) ( ON-TABLE ?auto_165054 ) ( ON ?auto_165055 ?auto_165054 ) ( ON ?auto_165056 ?auto_165055 ) ( not ( = ?auto_165054 ?auto_165055 ) ) ( not ( = ?auto_165054 ?auto_165056 ) ) ( not ( = ?auto_165054 ?auto_165058 ) ) ( not ( = ?auto_165055 ?auto_165056 ) ) ( not ( = ?auto_165055 ?auto_165058 ) ) ( not ( = ?auto_165056 ?auto_165058 ) ) ( not ( = ?auto_165054 ?auto_165059 ) ) ( not ( = ?auto_165054 ?auto_165062 ) ) ( not ( = ?auto_165055 ?auto_165059 ) ) ( not ( = ?auto_165055 ?auto_165062 ) ) ( not ( = ?auto_165056 ?auto_165059 ) ) ( not ( = ?auto_165056 ?auto_165062 ) ) ( not ( = ?auto_165058 ?auto_165059 ) ) ( not ( = ?auto_165058 ?auto_165062 ) ) ( not ( = ?auto_165059 ?auto_165062 ) ) ( ON ?auto_165059 ?auto_165058 ) ( not ( = ?auto_165061 ?auto_165057 ) ) ( not ( = ?auto_165061 ?auto_165062 ) ) ( not ( = ?auto_165057 ?auto_165062 ) ) ( not ( = ?auto_165054 ?auto_165057 ) ) ( not ( = ?auto_165054 ?auto_165061 ) ) ( not ( = ?auto_165055 ?auto_165057 ) ) ( not ( = ?auto_165055 ?auto_165061 ) ) ( not ( = ?auto_165056 ?auto_165057 ) ) ( not ( = ?auto_165056 ?auto_165061 ) ) ( not ( = ?auto_165058 ?auto_165057 ) ) ( not ( = ?auto_165058 ?auto_165061 ) ) ( not ( = ?auto_165059 ?auto_165057 ) ) ( not ( = ?auto_165059 ?auto_165061 ) ) ( ON ?auto_165061 ?auto_165060 ) ( not ( = ?auto_165054 ?auto_165060 ) ) ( not ( = ?auto_165055 ?auto_165060 ) ) ( not ( = ?auto_165056 ?auto_165060 ) ) ( not ( = ?auto_165058 ?auto_165060 ) ) ( not ( = ?auto_165059 ?auto_165060 ) ) ( not ( = ?auto_165062 ?auto_165060 ) ) ( not ( = ?auto_165061 ?auto_165060 ) ) ( not ( = ?auto_165057 ?auto_165060 ) ) ( ON ?auto_165057 ?auto_165061 ) ( CLEAR ?auto_165057 ) ( ON-TABLE ?auto_165060 ) ( HOLDING ?auto_165062 ) ( CLEAR ?auto_165059 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_165054 ?auto_165055 ?auto_165056 ?auto_165058 ?auto_165059 ?auto_165062 )
      ( MAKE-3PILE ?auto_165054 ?auto_165055 ?auto_165056 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_165063 - BLOCK
      ?auto_165064 - BLOCK
      ?auto_165065 - BLOCK
    )
    :vars
    (
      ?auto_165068 - BLOCK
      ?auto_165067 - BLOCK
      ?auto_165070 - BLOCK
      ?auto_165069 - BLOCK
      ?auto_165066 - BLOCK
      ?auto_165071 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_165068 ?auto_165065 ) ( ON-TABLE ?auto_165063 ) ( ON ?auto_165064 ?auto_165063 ) ( ON ?auto_165065 ?auto_165064 ) ( not ( = ?auto_165063 ?auto_165064 ) ) ( not ( = ?auto_165063 ?auto_165065 ) ) ( not ( = ?auto_165063 ?auto_165068 ) ) ( not ( = ?auto_165064 ?auto_165065 ) ) ( not ( = ?auto_165064 ?auto_165068 ) ) ( not ( = ?auto_165065 ?auto_165068 ) ) ( not ( = ?auto_165063 ?auto_165067 ) ) ( not ( = ?auto_165063 ?auto_165070 ) ) ( not ( = ?auto_165064 ?auto_165067 ) ) ( not ( = ?auto_165064 ?auto_165070 ) ) ( not ( = ?auto_165065 ?auto_165067 ) ) ( not ( = ?auto_165065 ?auto_165070 ) ) ( not ( = ?auto_165068 ?auto_165067 ) ) ( not ( = ?auto_165068 ?auto_165070 ) ) ( not ( = ?auto_165067 ?auto_165070 ) ) ( ON ?auto_165067 ?auto_165068 ) ( not ( = ?auto_165069 ?auto_165066 ) ) ( not ( = ?auto_165069 ?auto_165070 ) ) ( not ( = ?auto_165066 ?auto_165070 ) ) ( not ( = ?auto_165063 ?auto_165066 ) ) ( not ( = ?auto_165063 ?auto_165069 ) ) ( not ( = ?auto_165064 ?auto_165066 ) ) ( not ( = ?auto_165064 ?auto_165069 ) ) ( not ( = ?auto_165065 ?auto_165066 ) ) ( not ( = ?auto_165065 ?auto_165069 ) ) ( not ( = ?auto_165068 ?auto_165066 ) ) ( not ( = ?auto_165068 ?auto_165069 ) ) ( not ( = ?auto_165067 ?auto_165066 ) ) ( not ( = ?auto_165067 ?auto_165069 ) ) ( ON ?auto_165069 ?auto_165071 ) ( not ( = ?auto_165063 ?auto_165071 ) ) ( not ( = ?auto_165064 ?auto_165071 ) ) ( not ( = ?auto_165065 ?auto_165071 ) ) ( not ( = ?auto_165068 ?auto_165071 ) ) ( not ( = ?auto_165067 ?auto_165071 ) ) ( not ( = ?auto_165070 ?auto_165071 ) ) ( not ( = ?auto_165069 ?auto_165071 ) ) ( not ( = ?auto_165066 ?auto_165071 ) ) ( ON ?auto_165066 ?auto_165069 ) ( ON-TABLE ?auto_165071 ) ( CLEAR ?auto_165067 ) ( ON ?auto_165070 ?auto_165066 ) ( CLEAR ?auto_165070 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_165071 ?auto_165069 ?auto_165066 )
      ( MAKE-3PILE ?auto_165063 ?auto_165064 ?auto_165065 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_165072 - BLOCK
      ?auto_165073 - BLOCK
      ?auto_165074 - BLOCK
    )
    :vars
    (
      ?auto_165079 - BLOCK
      ?auto_165080 - BLOCK
      ?auto_165075 - BLOCK
      ?auto_165077 - BLOCK
      ?auto_165078 - BLOCK
      ?auto_165076 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_165079 ?auto_165074 ) ( ON-TABLE ?auto_165072 ) ( ON ?auto_165073 ?auto_165072 ) ( ON ?auto_165074 ?auto_165073 ) ( not ( = ?auto_165072 ?auto_165073 ) ) ( not ( = ?auto_165072 ?auto_165074 ) ) ( not ( = ?auto_165072 ?auto_165079 ) ) ( not ( = ?auto_165073 ?auto_165074 ) ) ( not ( = ?auto_165073 ?auto_165079 ) ) ( not ( = ?auto_165074 ?auto_165079 ) ) ( not ( = ?auto_165072 ?auto_165080 ) ) ( not ( = ?auto_165072 ?auto_165075 ) ) ( not ( = ?auto_165073 ?auto_165080 ) ) ( not ( = ?auto_165073 ?auto_165075 ) ) ( not ( = ?auto_165074 ?auto_165080 ) ) ( not ( = ?auto_165074 ?auto_165075 ) ) ( not ( = ?auto_165079 ?auto_165080 ) ) ( not ( = ?auto_165079 ?auto_165075 ) ) ( not ( = ?auto_165080 ?auto_165075 ) ) ( not ( = ?auto_165077 ?auto_165078 ) ) ( not ( = ?auto_165077 ?auto_165075 ) ) ( not ( = ?auto_165078 ?auto_165075 ) ) ( not ( = ?auto_165072 ?auto_165078 ) ) ( not ( = ?auto_165072 ?auto_165077 ) ) ( not ( = ?auto_165073 ?auto_165078 ) ) ( not ( = ?auto_165073 ?auto_165077 ) ) ( not ( = ?auto_165074 ?auto_165078 ) ) ( not ( = ?auto_165074 ?auto_165077 ) ) ( not ( = ?auto_165079 ?auto_165078 ) ) ( not ( = ?auto_165079 ?auto_165077 ) ) ( not ( = ?auto_165080 ?auto_165078 ) ) ( not ( = ?auto_165080 ?auto_165077 ) ) ( ON ?auto_165077 ?auto_165076 ) ( not ( = ?auto_165072 ?auto_165076 ) ) ( not ( = ?auto_165073 ?auto_165076 ) ) ( not ( = ?auto_165074 ?auto_165076 ) ) ( not ( = ?auto_165079 ?auto_165076 ) ) ( not ( = ?auto_165080 ?auto_165076 ) ) ( not ( = ?auto_165075 ?auto_165076 ) ) ( not ( = ?auto_165077 ?auto_165076 ) ) ( not ( = ?auto_165078 ?auto_165076 ) ) ( ON ?auto_165078 ?auto_165077 ) ( ON-TABLE ?auto_165076 ) ( ON ?auto_165075 ?auto_165078 ) ( CLEAR ?auto_165075 ) ( HOLDING ?auto_165080 ) ( CLEAR ?auto_165079 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_165072 ?auto_165073 ?auto_165074 ?auto_165079 ?auto_165080 )
      ( MAKE-3PILE ?auto_165072 ?auto_165073 ?auto_165074 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_165081 - BLOCK
      ?auto_165082 - BLOCK
      ?auto_165083 - BLOCK
    )
    :vars
    (
      ?auto_165087 - BLOCK
      ?auto_165085 - BLOCK
      ?auto_165084 - BLOCK
      ?auto_165088 - BLOCK
      ?auto_165086 - BLOCK
      ?auto_165089 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_165087 ?auto_165083 ) ( ON-TABLE ?auto_165081 ) ( ON ?auto_165082 ?auto_165081 ) ( ON ?auto_165083 ?auto_165082 ) ( not ( = ?auto_165081 ?auto_165082 ) ) ( not ( = ?auto_165081 ?auto_165083 ) ) ( not ( = ?auto_165081 ?auto_165087 ) ) ( not ( = ?auto_165082 ?auto_165083 ) ) ( not ( = ?auto_165082 ?auto_165087 ) ) ( not ( = ?auto_165083 ?auto_165087 ) ) ( not ( = ?auto_165081 ?auto_165085 ) ) ( not ( = ?auto_165081 ?auto_165084 ) ) ( not ( = ?auto_165082 ?auto_165085 ) ) ( not ( = ?auto_165082 ?auto_165084 ) ) ( not ( = ?auto_165083 ?auto_165085 ) ) ( not ( = ?auto_165083 ?auto_165084 ) ) ( not ( = ?auto_165087 ?auto_165085 ) ) ( not ( = ?auto_165087 ?auto_165084 ) ) ( not ( = ?auto_165085 ?auto_165084 ) ) ( not ( = ?auto_165088 ?auto_165086 ) ) ( not ( = ?auto_165088 ?auto_165084 ) ) ( not ( = ?auto_165086 ?auto_165084 ) ) ( not ( = ?auto_165081 ?auto_165086 ) ) ( not ( = ?auto_165081 ?auto_165088 ) ) ( not ( = ?auto_165082 ?auto_165086 ) ) ( not ( = ?auto_165082 ?auto_165088 ) ) ( not ( = ?auto_165083 ?auto_165086 ) ) ( not ( = ?auto_165083 ?auto_165088 ) ) ( not ( = ?auto_165087 ?auto_165086 ) ) ( not ( = ?auto_165087 ?auto_165088 ) ) ( not ( = ?auto_165085 ?auto_165086 ) ) ( not ( = ?auto_165085 ?auto_165088 ) ) ( ON ?auto_165088 ?auto_165089 ) ( not ( = ?auto_165081 ?auto_165089 ) ) ( not ( = ?auto_165082 ?auto_165089 ) ) ( not ( = ?auto_165083 ?auto_165089 ) ) ( not ( = ?auto_165087 ?auto_165089 ) ) ( not ( = ?auto_165085 ?auto_165089 ) ) ( not ( = ?auto_165084 ?auto_165089 ) ) ( not ( = ?auto_165088 ?auto_165089 ) ) ( not ( = ?auto_165086 ?auto_165089 ) ) ( ON ?auto_165086 ?auto_165088 ) ( ON-TABLE ?auto_165089 ) ( ON ?auto_165084 ?auto_165086 ) ( CLEAR ?auto_165087 ) ( ON ?auto_165085 ?auto_165084 ) ( CLEAR ?auto_165085 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_165089 ?auto_165088 ?auto_165086 ?auto_165084 )
      ( MAKE-3PILE ?auto_165081 ?auto_165082 ?auto_165083 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_165108 - BLOCK
      ?auto_165109 - BLOCK
      ?auto_165110 - BLOCK
    )
    :vars
    (
      ?auto_165113 - BLOCK
      ?auto_165114 - BLOCK
      ?auto_165115 - BLOCK
      ?auto_165111 - BLOCK
      ?auto_165116 - BLOCK
      ?auto_165112 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_165108 ) ( ON ?auto_165109 ?auto_165108 ) ( not ( = ?auto_165108 ?auto_165109 ) ) ( not ( = ?auto_165108 ?auto_165110 ) ) ( not ( = ?auto_165108 ?auto_165113 ) ) ( not ( = ?auto_165109 ?auto_165110 ) ) ( not ( = ?auto_165109 ?auto_165113 ) ) ( not ( = ?auto_165110 ?auto_165113 ) ) ( not ( = ?auto_165108 ?auto_165114 ) ) ( not ( = ?auto_165108 ?auto_165115 ) ) ( not ( = ?auto_165109 ?auto_165114 ) ) ( not ( = ?auto_165109 ?auto_165115 ) ) ( not ( = ?auto_165110 ?auto_165114 ) ) ( not ( = ?auto_165110 ?auto_165115 ) ) ( not ( = ?auto_165113 ?auto_165114 ) ) ( not ( = ?auto_165113 ?auto_165115 ) ) ( not ( = ?auto_165114 ?auto_165115 ) ) ( not ( = ?auto_165111 ?auto_165116 ) ) ( not ( = ?auto_165111 ?auto_165115 ) ) ( not ( = ?auto_165116 ?auto_165115 ) ) ( not ( = ?auto_165108 ?auto_165116 ) ) ( not ( = ?auto_165108 ?auto_165111 ) ) ( not ( = ?auto_165109 ?auto_165116 ) ) ( not ( = ?auto_165109 ?auto_165111 ) ) ( not ( = ?auto_165110 ?auto_165116 ) ) ( not ( = ?auto_165110 ?auto_165111 ) ) ( not ( = ?auto_165113 ?auto_165116 ) ) ( not ( = ?auto_165113 ?auto_165111 ) ) ( not ( = ?auto_165114 ?auto_165116 ) ) ( not ( = ?auto_165114 ?auto_165111 ) ) ( ON ?auto_165111 ?auto_165112 ) ( not ( = ?auto_165108 ?auto_165112 ) ) ( not ( = ?auto_165109 ?auto_165112 ) ) ( not ( = ?auto_165110 ?auto_165112 ) ) ( not ( = ?auto_165113 ?auto_165112 ) ) ( not ( = ?auto_165114 ?auto_165112 ) ) ( not ( = ?auto_165115 ?auto_165112 ) ) ( not ( = ?auto_165111 ?auto_165112 ) ) ( not ( = ?auto_165116 ?auto_165112 ) ) ( ON ?auto_165116 ?auto_165111 ) ( ON-TABLE ?auto_165112 ) ( ON ?auto_165115 ?auto_165116 ) ( ON ?auto_165114 ?auto_165115 ) ( ON ?auto_165113 ?auto_165114 ) ( CLEAR ?auto_165113 ) ( HOLDING ?auto_165110 ) ( CLEAR ?auto_165109 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_165108 ?auto_165109 ?auto_165110 ?auto_165113 )
      ( MAKE-3PILE ?auto_165108 ?auto_165109 ?auto_165110 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_165117 - BLOCK
      ?auto_165118 - BLOCK
      ?auto_165119 - BLOCK
    )
    :vars
    (
      ?auto_165122 - BLOCK
      ?auto_165120 - BLOCK
      ?auto_165124 - BLOCK
      ?auto_165123 - BLOCK
      ?auto_165121 - BLOCK
      ?auto_165125 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_165117 ) ( ON ?auto_165118 ?auto_165117 ) ( not ( = ?auto_165117 ?auto_165118 ) ) ( not ( = ?auto_165117 ?auto_165119 ) ) ( not ( = ?auto_165117 ?auto_165122 ) ) ( not ( = ?auto_165118 ?auto_165119 ) ) ( not ( = ?auto_165118 ?auto_165122 ) ) ( not ( = ?auto_165119 ?auto_165122 ) ) ( not ( = ?auto_165117 ?auto_165120 ) ) ( not ( = ?auto_165117 ?auto_165124 ) ) ( not ( = ?auto_165118 ?auto_165120 ) ) ( not ( = ?auto_165118 ?auto_165124 ) ) ( not ( = ?auto_165119 ?auto_165120 ) ) ( not ( = ?auto_165119 ?auto_165124 ) ) ( not ( = ?auto_165122 ?auto_165120 ) ) ( not ( = ?auto_165122 ?auto_165124 ) ) ( not ( = ?auto_165120 ?auto_165124 ) ) ( not ( = ?auto_165123 ?auto_165121 ) ) ( not ( = ?auto_165123 ?auto_165124 ) ) ( not ( = ?auto_165121 ?auto_165124 ) ) ( not ( = ?auto_165117 ?auto_165121 ) ) ( not ( = ?auto_165117 ?auto_165123 ) ) ( not ( = ?auto_165118 ?auto_165121 ) ) ( not ( = ?auto_165118 ?auto_165123 ) ) ( not ( = ?auto_165119 ?auto_165121 ) ) ( not ( = ?auto_165119 ?auto_165123 ) ) ( not ( = ?auto_165122 ?auto_165121 ) ) ( not ( = ?auto_165122 ?auto_165123 ) ) ( not ( = ?auto_165120 ?auto_165121 ) ) ( not ( = ?auto_165120 ?auto_165123 ) ) ( ON ?auto_165123 ?auto_165125 ) ( not ( = ?auto_165117 ?auto_165125 ) ) ( not ( = ?auto_165118 ?auto_165125 ) ) ( not ( = ?auto_165119 ?auto_165125 ) ) ( not ( = ?auto_165122 ?auto_165125 ) ) ( not ( = ?auto_165120 ?auto_165125 ) ) ( not ( = ?auto_165124 ?auto_165125 ) ) ( not ( = ?auto_165123 ?auto_165125 ) ) ( not ( = ?auto_165121 ?auto_165125 ) ) ( ON ?auto_165121 ?auto_165123 ) ( ON-TABLE ?auto_165125 ) ( ON ?auto_165124 ?auto_165121 ) ( ON ?auto_165120 ?auto_165124 ) ( ON ?auto_165122 ?auto_165120 ) ( CLEAR ?auto_165118 ) ( ON ?auto_165119 ?auto_165122 ) ( CLEAR ?auto_165119 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_165125 ?auto_165123 ?auto_165121 ?auto_165124 ?auto_165120 ?auto_165122 )
      ( MAKE-3PILE ?auto_165117 ?auto_165118 ?auto_165119 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_165126 - BLOCK
      ?auto_165127 - BLOCK
      ?auto_165128 - BLOCK
    )
    :vars
    (
      ?auto_165134 - BLOCK
      ?auto_165129 - BLOCK
      ?auto_165130 - BLOCK
      ?auto_165131 - BLOCK
      ?auto_165133 - BLOCK
      ?auto_165132 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_165126 ) ( not ( = ?auto_165126 ?auto_165127 ) ) ( not ( = ?auto_165126 ?auto_165128 ) ) ( not ( = ?auto_165126 ?auto_165134 ) ) ( not ( = ?auto_165127 ?auto_165128 ) ) ( not ( = ?auto_165127 ?auto_165134 ) ) ( not ( = ?auto_165128 ?auto_165134 ) ) ( not ( = ?auto_165126 ?auto_165129 ) ) ( not ( = ?auto_165126 ?auto_165130 ) ) ( not ( = ?auto_165127 ?auto_165129 ) ) ( not ( = ?auto_165127 ?auto_165130 ) ) ( not ( = ?auto_165128 ?auto_165129 ) ) ( not ( = ?auto_165128 ?auto_165130 ) ) ( not ( = ?auto_165134 ?auto_165129 ) ) ( not ( = ?auto_165134 ?auto_165130 ) ) ( not ( = ?auto_165129 ?auto_165130 ) ) ( not ( = ?auto_165131 ?auto_165133 ) ) ( not ( = ?auto_165131 ?auto_165130 ) ) ( not ( = ?auto_165133 ?auto_165130 ) ) ( not ( = ?auto_165126 ?auto_165133 ) ) ( not ( = ?auto_165126 ?auto_165131 ) ) ( not ( = ?auto_165127 ?auto_165133 ) ) ( not ( = ?auto_165127 ?auto_165131 ) ) ( not ( = ?auto_165128 ?auto_165133 ) ) ( not ( = ?auto_165128 ?auto_165131 ) ) ( not ( = ?auto_165134 ?auto_165133 ) ) ( not ( = ?auto_165134 ?auto_165131 ) ) ( not ( = ?auto_165129 ?auto_165133 ) ) ( not ( = ?auto_165129 ?auto_165131 ) ) ( ON ?auto_165131 ?auto_165132 ) ( not ( = ?auto_165126 ?auto_165132 ) ) ( not ( = ?auto_165127 ?auto_165132 ) ) ( not ( = ?auto_165128 ?auto_165132 ) ) ( not ( = ?auto_165134 ?auto_165132 ) ) ( not ( = ?auto_165129 ?auto_165132 ) ) ( not ( = ?auto_165130 ?auto_165132 ) ) ( not ( = ?auto_165131 ?auto_165132 ) ) ( not ( = ?auto_165133 ?auto_165132 ) ) ( ON ?auto_165133 ?auto_165131 ) ( ON-TABLE ?auto_165132 ) ( ON ?auto_165130 ?auto_165133 ) ( ON ?auto_165129 ?auto_165130 ) ( ON ?auto_165134 ?auto_165129 ) ( ON ?auto_165128 ?auto_165134 ) ( CLEAR ?auto_165128 ) ( HOLDING ?auto_165127 ) ( CLEAR ?auto_165126 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_165126 ?auto_165127 )
      ( MAKE-3PILE ?auto_165126 ?auto_165127 ?auto_165128 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_165135 - BLOCK
      ?auto_165136 - BLOCK
      ?auto_165137 - BLOCK
    )
    :vars
    (
      ?auto_165139 - BLOCK
      ?auto_165143 - BLOCK
      ?auto_165142 - BLOCK
      ?auto_165140 - BLOCK
      ?auto_165138 - BLOCK
      ?auto_165141 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_165135 ) ( not ( = ?auto_165135 ?auto_165136 ) ) ( not ( = ?auto_165135 ?auto_165137 ) ) ( not ( = ?auto_165135 ?auto_165139 ) ) ( not ( = ?auto_165136 ?auto_165137 ) ) ( not ( = ?auto_165136 ?auto_165139 ) ) ( not ( = ?auto_165137 ?auto_165139 ) ) ( not ( = ?auto_165135 ?auto_165143 ) ) ( not ( = ?auto_165135 ?auto_165142 ) ) ( not ( = ?auto_165136 ?auto_165143 ) ) ( not ( = ?auto_165136 ?auto_165142 ) ) ( not ( = ?auto_165137 ?auto_165143 ) ) ( not ( = ?auto_165137 ?auto_165142 ) ) ( not ( = ?auto_165139 ?auto_165143 ) ) ( not ( = ?auto_165139 ?auto_165142 ) ) ( not ( = ?auto_165143 ?auto_165142 ) ) ( not ( = ?auto_165140 ?auto_165138 ) ) ( not ( = ?auto_165140 ?auto_165142 ) ) ( not ( = ?auto_165138 ?auto_165142 ) ) ( not ( = ?auto_165135 ?auto_165138 ) ) ( not ( = ?auto_165135 ?auto_165140 ) ) ( not ( = ?auto_165136 ?auto_165138 ) ) ( not ( = ?auto_165136 ?auto_165140 ) ) ( not ( = ?auto_165137 ?auto_165138 ) ) ( not ( = ?auto_165137 ?auto_165140 ) ) ( not ( = ?auto_165139 ?auto_165138 ) ) ( not ( = ?auto_165139 ?auto_165140 ) ) ( not ( = ?auto_165143 ?auto_165138 ) ) ( not ( = ?auto_165143 ?auto_165140 ) ) ( ON ?auto_165140 ?auto_165141 ) ( not ( = ?auto_165135 ?auto_165141 ) ) ( not ( = ?auto_165136 ?auto_165141 ) ) ( not ( = ?auto_165137 ?auto_165141 ) ) ( not ( = ?auto_165139 ?auto_165141 ) ) ( not ( = ?auto_165143 ?auto_165141 ) ) ( not ( = ?auto_165142 ?auto_165141 ) ) ( not ( = ?auto_165140 ?auto_165141 ) ) ( not ( = ?auto_165138 ?auto_165141 ) ) ( ON ?auto_165138 ?auto_165140 ) ( ON-TABLE ?auto_165141 ) ( ON ?auto_165142 ?auto_165138 ) ( ON ?auto_165143 ?auto_165142 ) ( ON ?auto_165139 ?auto_165143 ) ( ON ?auto_165137 ?auto_165139 ) ( CLEAR ?auto_165135 ) ( ON ?auto_165136 ?auto_165137 ) ( CLEAR ?auto_165136 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_165141 ?auto_165140 ?auto_165138 ?auto_165142 ?auto_165143 ?auto_165139 ?auto_165137 )
      ( MAKE-3PILE ?auto_165135 ?auto_165136 ?auto_165137 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_165144 - BLOCK
      ?auto_165145 - BLOCK
      ?auto_165146 - BLOCK
    )
    :vars
    (
      ?auto_165150 - BLOCK
      ?auto_165148 - BLOCK
      ?auto_165151 - BLOCK
      ?auto_165152 - BLOCK
      ?auto_165147 - BLOCK
      ?auto_165149 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_165144 ?auto_165145 ) ) ( not ( = ?auto_165144 ?auto_165146 ) ) ( not ( = ?auto_165144 ?auto_165150 ) ) ( not ( = ?auto_165145 ?auto_165146 ) ) ( not ( = ?auto_165145 ?auto_165150 ) ) ( not ( = ?auto_165146 ?auto_165150 ) ) ( not ( = ?auto_165144 ?auto_165148 ) ) ( not ( = ?auto_165144 ?auto_165151 ) ) ( not ( = ?auto_165145 ?auto_165148 ) ) ( not ( = ?auto_165145 ?auto_165151 ) ) ( not ( = ?auto_165146 ?auto_165148 ) ) ( not ( = ?auto_165146 ?auto_165151 ) ) ( not ( = ?auto_165150 ?auto_165148 ) ) ( not ( = ?auto_165150 ?auto_165151 ) ) ( not ( = ?auto_165148 ?auto_165151 ) ) ( not ( = ?auto_165152 ?auto_165147 ) ) ( not ( = ?auto_165152 ?auto_165151 ) ) ( not ( = ?auto_165147 ?auto_165151 ) ) ( not ( = ?auto_165144 ?auto_165147 ) ) ( not ( = ?auto_165144 ?auto_165152 ) ) ( not ( = ?auto_165145 ?auto_165147 ) ) ( not ( = ?auto_165145 ?auto_165152 ) ) ( not ( = ?auto_165146 ?auto_165147 ) ) ( not ( = ?auto_165146 ?auto_165152 ) ) ( not ( = ?auto_165150 ?auto_165147 ) ) ( not ( = ?auto_165150 ?auto_165152 ) ) ( not ( = ?auto_165148 ?auto_165147 ) ) ( not ( = ?auto_165148 ?auto_165152 ) ) ( ON ?auto_165152 ?auto_165149 ) ( not ( = ?auto_165144 ?auto_165149 ) ) ( not ( = ?auto_165145 ?auto_165149 ) ) ( not ( = ?auto_165146 ?auto_165149 ) ) ( not ( = ?auto_165150 ?auto_165149 ) ) ( not ( = ?auto_165148 ?auto_165149 ) ) ( not ( = ?auto_165151 ?auto_165149 ) ) ( not ( = ?auto_165152 ?auto_165149 ) ) ( not ( = ?auto_165147 ?auto_165149 ) ) ( ON ?auto_165147 ?auto_165152 ) ( ON-TABLE ?auto_165149 ) ( ON ?auto_165151 ?auto_165147 ) ( ON ?auto_165148 ?auto_165151 ) ( ON ?auto_165150 ?auto_165148 ) ( ON ?auto_165146 ?auto_165150 ) ( ON ?auto_165145 ?auto_165146 ) ( CLEAR ?auto_165145 ) ( HOLDING ?auto_165144 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_165144 )
      ( MAKE-3PILE ?auto_165144 ?auto_165145 ?auto_165146 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_165153 - BLOCK
      ?auto_165154 - BLOCK
      ?auto_165155 - BLOCK
    )
    :vars
    (
      ?auto_165161 - BLOCK
      ?auto_165159 - BLOCK
      ?auto_165158 - BLOCK
      ?auto_165157 - BLOCK
      ?auto_165160 - BLOCK
      ?auto_165156 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_165153 ?auto_165154 ) ) ( not ( = ?auto_165153 ?auto_165155 ) ) ( not ( = ?auto_165153 ?auto_165161 ) ) ( not ( = ?auto_165154 ?auto_165155 ) ) ( not ( = ?auto_165154 ?auto_165161 ) ) ( not ( = ?auto_165155 ?auto_165161 ) ) ( not ( = ?auto_165153 ?auto_165159 ) ) ( not ( = ?auto_165153 ?auto_165158 ) ) ( not ( = ?auto_165154 ?auto_165159 ) ) ( not ( = ?auto_165154 ?auto_165158 ) ) ( not ( = ?auto_165155 ?auto_165159 ) ) ( not ( = ?auto_165155 ?auto_165158 ) ) ( not ( = ?auto_165161 ?auto_165159 ) ) ( not ( = ?auto_165161 ?auto_165158 ) ) ( not ( = ?auto_165159 ?auto_165158 ) ) ( not ( = ?auto_165157 ?auto_165160 ) ) ( not ( = ?auto_165157 ?auto_165158 ) ) ( not ( = ?auto_165160 ?auto_165158 ) ) ( not ( = ?auto_165153 ?auto_165160 ) ) ( not ( = ?auto_165153 ?auto_165157 ) ) ( not ( = ?auto_165154 ?auto_165160 ) ) ( not ( = ?auto_165154 ?auto_165157 ) ) ( not ( = ?auto_165155 ?auto_165160 ) ) ( not ( = ?auto_165155 ?auto_165157 ) ) ( not ( = ?auto_165161 ?auto_165160 ) ) ( not ( = ?auto_165161 ?auto_165157 ) ) ( not ( = ?auto_165159 ?auto_165160 ) ) ( not ( = ?auto_165159 ?auto_165157 ) ) ( ON ?auto_165157 ?auto_165156 ) ( not ( = ?auto_165153 ?auto_165156 ) ) ( not ( = ?auto_165154 ?auto_165156 ) ) ( not ( = ?auto_165155 ?auto_165156 ) ) ( not ( = ?auto_165161 ?auto_165156 ) ) ( not ( = ?auto_165159 ?auto_165156 ) ) ( not ( = ?auto_165158 ?auto_165156 ) ) ( not ( = ?auto_165157 ?auto_165156 ) ) ( not ( = ?auto_165160 ?auto_165156 ) ) ( ON ?auto_165160 ?auto_165157 ) ( ON-TABLE ?auto_165156 ) ( ON ?auto_165158 ?auto_165160 ) ( ON ?auto_165159 ?auto_165158 ) ( ON ?auto_165161 ?auto_165159 ) ( ON ?auto_165155 ?auto_165161 ) ( ON ?auto_165154 ?auto_165155 ) ( ON ?auto_165153 ?auto_165154 ) ( CLEAR ?auto_165153 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_165156 ?auto_165157 ?auto_165160 ?auto_165158 ?auto_165159 ?auto_165161 ?auto_165155 ?auto_165154 )
      ( MAKE-3PILE ?auto_165153 ?auto_165154 ?auto_165155 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_165167 - BLOCK
      ?auto_165168 - BLOCK
      ?auto_165169 - BLOCK
      ?auto_165170 - BLOCK
      ?auto_165171 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_165171 ) ( CLEAR ?auto_165170 ) ( ON-TABLE ?auto_165167 ) ( ON ?auto_165168 ?auto_165167 ) ( ON ?auto_165169 ?auto_165168 ) ( ON ?auto_165170 ?auto_165169 ) ( not ( = ?auto_165167 ?auto_165168 ) ) ( not ( = ?auto_165167 ?auto_165169 ) ) ( not ( = ?auto_165167 ?auto_165170 ) ) ( not ( = ?auto_165167 ?auto_165171 ) ) ( not ( = ?auto_165168 ?auto_165169 ) ) ( not ( = ?auto_165168 ?auto_165170 ) ) ( not ( = ?auto_165168 ?auto_165171 ) ) ( not ( = ?auto_165169 ?auto_165170 ) ) ( not ( = ?auto_165169 ?auto_165171 ) ) ( not ( = ?auto_165170 ?auto_165171 ) ) )
    :subtasks
    ( ( !STACK ?auto_165171 ?auto_165170 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_165172 - BLOCK
      ?auto_165173 - BLOCK
      ?auto_165174 - BLOCK
      ?auto_165175 - BLOCK
      ?auto_165176 - BLOCK
    )
    :vars
    (
      ?auto_165177 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_165175 ) ( ON-TABLE ?auto_165172 ) ( ON ?auto_165173 ?auto_165172 ) ( ON ?auto_165174 ?auto_165173 ) ( ON ?auto_165175 ?auto_165174 ) ( not ( = ?auto_165172 ?auto_165173 ) ) ( not ( = ?auto_165172 ?auto_165174 ) ) ( not ( = ?auto_165172 ?auto_165175 ) ) ( not ( = ?auto_165172 ?auto_165176 ) ) ( not ( = ?auto_165173 ?auto_165174 ) ) ( not ( = ?auto_165173 ?auto_165175 ) ) ( not ( = ?auto_165173 ?auto_165176 ) ) ( not ( = ?auto_165174 ?auto_165175 ) ) ( not ( = ?auto_165174 ?auto_165176 ) ) ( not ( = ?auto_165175 ?auto_165176 ) ) ( ON ?auto_165176 ?auto_165177 ) ( CLEAR ?auto_165176 ) ( HAND-EMPTY ) ( not ( = ?auto_165172 ?auto_165177 ) ) ( not ( = ?auto_165173 ?auto_165177 ) ) ( not ( = ?auto_165174 ?auto_165177 ) ) ( not ( = ?auto_165175 ?auto_165177 ) ) ( not ( = ?auto_165176 ?auto_165177 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_165176 ?auto_165177 )
      ( MAKE-5PILE ?auto_165172 ?auto_165173 ?auto_165174 ?auto_165175 ?auto_165176 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_165178 - BLOCK
      ?auto_165179 - BLOCK
      ?auto_165180 - BLOCK
      ?auto_165181 - BLOCK
      ?auto_165182 - BLOCK
    )
    :vars
    (
      ?auto_165183 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_165178 ) ( ON ?auto_165179 ?auto_165178 ) ( ON ?auto_165180 ?auto_165179 ) ( not ( = ?auto_165178 ?auto_165179 ) ) ( not ( = ?auto_165178 ?auto_165180 ) ) ( not ( = ?auto_165178 ?auto_165181 ) ) ( not ( = ?auto_165178 ?auto_165182 ) ) ( not ( = ?auto_165179 ?auto_165180 ) ) ( not ( = ?auto_165179 ?auto_165181 ) ) ( not ( = ?auto_165179 ?auto_165182 ) ) ( not ( = ?auto_165180 ?auto_165181 ) ) ( not ( = ?auto_165180 ?auto_165182 ) ) ( not ( = ?auto_165181 ?auto_165182 ) ) ( ON ?auto_165182 ?auto_165183 ) ( CLEAR ?auto_165182 ) ( not ( = ?auto_165178 ?auto_165183 ) ) ( not ( = ?auto_165179 ?auto_165183 ) ) ( not ( = ?auto_165180 ?auto_165183 ) ) ( not ( = ?auto_165181 ?auto_165183 ) ) ( not ( = ?auto_165182 ?auto_165183 ) ) ( HOLDING ?auto_165181 ) ( CLEAR ?auto_165180 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_165178 ?auto_165179 ?auto_165180 ?auto_165181 )
      ( MAKE-5PILE ?auto_165178 ?auto_165179 ?auto_165180 ?auto_165181 ?auto_165182 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_165184 - BLOCK
      ?auto_165185 - BLOCK
      ?auto_165186 - BLOCK
      ?auto_165187 - BLOCK
      ?auto_165188 - BLOCK
    )
    :vars
    (
      ?auto_165189 - BLOCK
      ?auto_165190 - BLOCK
      ?auto_165191 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_165184 ) ( ON ?auto_165185 ?auto_165184 ) ( ON ?auto_165186 ?auto_165185 ) ( not ( = ?auto_165184 ?auto_165185 ) ) ( not ( = ?auto_165184 ?auto_165186 ) ) ( not ( = ?auto_165184 ?auto_165187 ) ) ( not ( = ?auto_165184 ?auto_165188 ) ) ( not ( = ?auto_165185 ?auto_165186 ) ) ( not ( = ?auto_165185 ?auto_165187 ) ) ( not ( = ?auto_165185 ?auto_165188 ) ) ( not ( = ?auto_165186 ?auto_165187 ) ) ( not ( = ?auto_165186 ?auto_165188 ) ) ( not ( = ?auto_165187 ?auto_165188 ) ) ( ON ?auto_165188 ?auto_165189 ) ( not ( = ?auto_165184 ?auto_165189 ) ) ( not ( = ?auto_165185 ?auto_165189 ) ) ( not ( = ?auto_165186 ?auto_165189 ) ) ( not ( = ?auto_165187 ?auto_165189 ) ) ( not ( = ?auto_165188 ?auto_165189 ) ) ( CLEAR ?auto_165186 ) ( ON ?auto_165187 ?auto_165188 ) ( CLEAR ?auto_165187 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_165190 ) ( ON ?auto_165191 ?auto_165190 ) ( ON ?auto_165189 ?auto_165191 ) ( not ( = ?auto_165190 ?auto_165191 ) ) ( not ( = ?auto_165190 ?auto_165189 ) ) ( not ( = ?auto_165190 ?auto_165188 ) ) ( not ( = ?auto_165190 ?auto_165187 ) ) ( not ( = ?auto_165191 ?auto_165189 ) ) ( not ( = ?auto_165191 ?auto_165188 ) ) ( not ( = ?auto_165191 ?auto_165187 ) ) ( not ( = ?auto_165184 ?auto_165190 ) ) ( not ( = ?auto_165184 ?auto_165191 ) ) ( not ( = ?auto_165185 ?auto_165190 ) ) ( not ( = ?auto_165185 ?auto_165191 ) ) ( not ( = ?auto_165186 ?auto_165190 ) ) ( not ( = ?auto_165186 ?auto_165191 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_165190 ?auto_165191 ?auto_165189 ?auto_165188 )
      ( MAKE-5PILE ?auto_165184 ?auto_165185 ?auto_165186 ?auto_165187 ?auto_165188 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_165192 - BLOCK
      ?auto_165193 - BLOCK
      ?auto_165194 - BLOCK
      ?auto_165195 - BLOCK
      ?auto_165196 - BLOCK
    )
    :vars
    (
      ?auto_165199 - BLOCK
      ?auto_165198 - BLOCK
      ?auto_165197 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_165192 ) ( ON ?auto_165193 ?auto_165192 ) ( not ( = ?auto_165192 ?auto_165193 ) ) ( not ( = ?auto_165192 ?auto_165194 ) ) ( not ( = ?auto_165192 ?auto_165195 ) ) ( not ( = ?auto_165192 ?auto_165196 ) ) ( not ( = ?auto_165193 ?auto_165194 ) ) ( not ( = ?auto_165193 ?auto_165195 ) ) ( not ( = ?auto_165193 ?auto_165196 ) ) ( not ( = ?auto_165194 ?auto_165195 ) ) ( not ( = ?auto_165194 ?auto_165196 ) ) ( not ( = ?auto_165195 ?auto_165196 ) ) ( ON ?auto_165196 ?auto_165199 ) ( not ( = ?auto_165192 ?auto_165199 ) ) ( not ( = ?auto_165193 ?auto_165199 ) ) ( not ( = ?auto_165194 ?auto_165199 ) ) ( not ( = ?auto_165195 ?auto_165199 ) ) ( not ( = ?auto_165196 ?auto_165199 ) ) ( ON ?auto_165195 ?auto_165196 ) ( CLEAR ?auto_165195 ) ( ON-TABLE ?auto_165198 ) ( ON ?auto_165197 ?auto_165198 ) ( ON ?auto_165199 ?auto_165197 ) ( not ( = ?auto_165198 ?auto_165197 ) ) ( not ( = ?auto_165198 ?auto_165199 ) ) ( not ( = ?auto_165198 ?auto_165196 ) ) ( not ( = ?auto_165198 ?auto_165195 ) ) ( not ( = ?auto_165197 ?auto_165199 ) ) ( not ( = ?auto_165197 ?auto_165196 ) ) ( not ( = ?auto_165197 ?auto_165195 ) ) ( not ( = ?auto_165192 ?auto_165198 ) ) ( not ( = ?auto_165192 ?auto_165197 ) ) ( not ( = ?auto_165193 ?auto_165198 ) ) ( not ( = ?auto_165193 ?auto_165197 ) ) ( not ( = ?auto_165194 ?auto_165198 ) ) ( not ( = ?auto_165194 ?auto_165197 ) ) ( HOLDING ?auto_165194 ) ( CLEAR ?auto_165193 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_165192 ?auto_165193 ?auto_165194 )
      ( MAKE-5PILE ?auto_165192 ?auto_165193 ?auto_165194 ?auto_165195 ?auto_165196 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_165200 - BLOCK
      ?auto_165201 - BLOCK
      ?auto_165202 - BLOCK
      ?auto_165203 - BLOCK
      ?auto_165204 - BLOCK
    )
    :vars
    (
      ?auto_165206 - BLOCK
      ?auto_165207 - BLOCK
      ?auto_165205 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_165200 ) ( ON ?auto_165201 ?auto_165200 ) ( not ( = ?auto_165200 ?auto_165201 ) ) ( not ( = ?auto_165200 ?auto_165202 ) ) ( not ( = ?auto_165200 ?auto_165203 ) ) ( not ( = ?auto_165200 ?auto_165204 ) ) ( not ( = ?auto_165201 ?auto_165202 ) ) ( not ( = ?auto_165201 ?auto_165203 ) ) ( not ( = ?auto_165201 ?auto_165204 ) ) ( not ( = ?auto_165202 ?auto_165203 ) ) ( not ( = ?auto_165202 ?auto_165204 ) ) ( not ( = ?auto_165203 ?auto_165204 ) ) ( ON ?auto_165204 ?auto_165206 ) ( not ( = ?auto_165200 ?auto_165206 ) ) ( not ( = ?auto_165201 ?auto_165206 ) ) ( not ( = ?auto_165202 ?auto_165206 ) ) ( not ( = ?auto_165203 ?auto_165206 ) ) ( not ( = ?auto_165204 ?auto_165206 ) ) ( ON ?auto_165203 ?auto_165204 ) ( ON-TABLE ?auto_165207 ) ( ON ?auto_165205 ?auto_165207 ) ( ON ?auto_165206 ?auto_165205 ) ( not ( = ?auto_165207 ?auto_165205 ) ) ( not ( = ?auto_165207 ?auto_165206 ) ) ( not ( = ?auto_165207 ?auto_165204 ) ) ( not ( = ?auto_165207 ?auto_165203 ) ) ( not ( = ?auto_165205 ?auto_165206 ) ) ( not ( = ?auto_165205 ?auto_165204 ) ) ( not ( = ?auto_165205 ?auto_165203 ) ) ( not ( = ?auto_165200 ?auto_165207 ) ) ( not ( = ?auto_165200 ?auto_165205 ) ) ( not ( = ?auto_165201 ?auto_165207 ) ) ( not ( = ?auto_165201 ?auto_165205 ) ) ( not ( = ?auto_165202 ?auto_165207 ) ) ( not ( = ?auto_165202 ?auto_165205 ) ) ( CLEAR ?auto_165201 ) ( ON ?auto_165202 ?auto_165203 ) ( CLEAR ?auto_165202 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_165207 ?auto_165205 ?auto_165206 ?auto_165204 ?auto_165203 )
      ( MAKE-5PILE ?auto_165200 ?auto_165201 ?auto_165202 ?auto_165203 ?auto_165204 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_165208 - BLOCK
      ?auto_165209 - BLOCK
      ?auto_165210 - BLOCK
      ?auto_165211 - BLOCK
      ?auto_165212 - BLOCK
    )
    :vars
    (
      ?auto_165214 - BLOCK
      ?auto_165215 - BLOCK
      ?auto_165213 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_165208 ) ( not ( = ?auto_165208 ?auto_165209 ) ) ( not ( = ?auto_165208 ?auto_165210 ) ) ( not ( = ?auto_165208 ?auto_165211 ) ) ( not ( = ?auto_165208 ?auto_165212 ) ) ( not ( = ?auto_165209 ?auto_165210 ) ) ( not ( = ?auto_165209 ?auto_165211 ) ) ( not ( = ?auto_165209 ?auto_165212 ) ) ( not ( = ?auto_165210 ?auto_165211 ) ) ( not ( = ?auto_165210 ?auto_165212 ) ) ( not ( = ?auto_165211 ?auto_165212 ) ) ( ON ?auto_165212 ?auto_165214 ) ( not ( = ?auto_165208 ?auto_165214 ) ) ( not ( = ?auto_165209 ?auto_165214 ) ) ( not ( = ?auto_165210 ?auto_165214 ) ) ( not ( = ?auto_165211 ?auto_165214 ) ) ( not ( = ?auto_165212 ?auto_165214 ) ) ( ON ?auto_165211 ?auto_165212 ) ( ON-TABLE ?auto_165215 ) ( ON ?auto_165213 ?auto_165215 ) ( ON ?auto_165214 ?auto_165213 ) ( not ( = ?auto_165215 ?auto_165213 ) ) ( not ( = ?auto_165215 ?auto_165214 ) ) ( not ( = ?auto_165215 ?auto_165212 ) ) ( not ( = ?auto_165215 ?auto_165211 ) ) ( not ( = ?auto_165213 ?auto_165214 ) ) ( not ( = ?auto_165213 ?auto_165212 ) ) ( not ( = ?auto_165213 ?auto_165211 ) ) ( not ( = ?auto_165208 ?auto_165215 ) ) ( not ( = ?auto_165208 ?auto_165213 ) ) ( not ( = ?auto_165209 ?auto_165215 ) ) ( not ( = ?auto_165209 ?auto_165213 ) ) ( not ( = ?auto_165210 ?auto_165215 ) ) ( not ( = ?auto_165210 ?auto_165213 ) ) ( ON ?auto_165210 ?auto_165211 ) ( CLEAR ?auto_165210 ) ( HOLDING ?auto_165209 ) ( CLEAR ?auto_165208 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_165208 ?auto_165209 )
      ( MAKE-5PILE ?auto_165208 ?auto_165209 ?auto_165210 ?auto_165211 ?auto_165212 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_165216 - BLOCK
      ?auto_165217 - BLOCK
      ?auto_165218 - BLOCK
      ?auto_165219 - BLOCK
      ?auto_165220 - BLOCK
    )
    :vars
    (
      ?auto_165223 - BLOCK
      ?auto_165222 - BLOCK
      ?auto_165221 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_165216 ) ( not ( = ?auto_165216 ?auto_165217 ) ) ( not ( = ?auto_165216 ?auto_165218 ) ) ( not ( = ?auto_165216 ?auto_165219 ) ) ( not ( = ?auto_165216 ?auto_165220 ) ) ( not ( = ?auto_165217 ?auto_165218 ) ) ( not ( = ?auto_165217 ?auto_165219 ) ) ( not ( = ?auto_165217 ?auto_165220 ) ) ( not ( = ?auto_165218 ?auto_165219 ) ) ( not ( = ?auto_165218 ?auto_165220 ) ) ( not ( = ?auto_165219 ?auto_165220 ) ) ( ON ?auto_165220 ?auto_165223 ) ( not ( = ?auto_165216 ?auto_165223 ) ) ( not ( = ?auto_165217 ?auto_165223 ) ) ( not ( = ?auto_165218 ?auto_165223 ) ) ( not ( = ?auto_165219 ?auto_165223 ) ) ( not ( = ?auto_165220 ?auto_165223 ) ) ( ON ?auto_165219 ?auto_165220 ) ( ON-TABLE ?auto_165222 ) ( ON ?auto_165221 ?auto_165222 ) ( ON ?auto_165223 ?auto_165221 ) ( not ( = ?auto_165222 ?auto_165221 ) ) ( not ( = ?auto_165222 ?auto_165223 ) ) ( not ( = ?auto_165222 ?auto_165220 ) ) ( not ( = ?auto_165222 ?auto_165219 ) ) ( not ( = ?auto_165221 ?auto_165223 ) ) ( not ( = ?auto_165221 ?auto_165220 ) ) ( not ( = ?auto_165221 ?auto_165219 ) ) ( not ( = ?auto_165216 ?auto_165222 ) ) ( not ( = ?auto_165216 ?auto_165221 ) ) ( not ( = ?auto_165217 ?auto_165222 ) ) ( not ( = ?auto_165217 ?auto_165221 ) ) ( not ( = ?auto_165218 ?auto_165222 ) ) ( not ( = ?auto_165218 ?auto_165221 ) ) ( ON ?auto_165218 ?auto_165219 ) ( CLEAR ?auto_165216 ) ( ON ?auto_165217 ?auto_165218 ) ( CLEAR ?auto_165217 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_165222 ?auto_165221 ?auto_165223 ?auto_165220 ?auto_165219 ?auto_165218 )
      ( MAKE-5PILE ?auto_165216 ?auto_165217 ?auto_165218 ?auto_165219 ?auto_165220 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_165224 - BLOCK
      ?auto_165225 - BLOCK
      ?auto_165226 - BLOCK
      ?auto_165227 - BLOCK
      ?auto_165228 - BLOCK
    )
    :vars
    (
      ?auto_165230 - BLOCK
      ?auto_165231 - BLOCK
      ?auto_165229 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_165224 ?auto_165225 ) ) ( not ( = ?auto_165224 ?auto_165226 ) ) ( not ( = ?auto_165224 ?auto_165227 ) ) ( not ( = ?auto_165224 ?auto_165228 ) ) ( not ( = ?auto_165225 ?auto_165226 ) ) ( not ( = ?auto_165225 ?auto_165227 ) ) ( not ( = ?auto_165225 ?auto_165228 ) ) ( not ( = ?auto_165226 ?auto_165227 ) ) ( not ( = ?auto_165226 ?auto_165228 ) ) ( not ( = ?auto_165227 ?auto_165228 ) ) ( ON ?auto_165228 ?auto_165230 ) ( not ( = ?auto_165224 ?auto_165230 ) ) ( not ( = ?auto_165225 ?auto_165230 ) ) ( not ( = ?auto_165226 ?auto_165230 ) ) ( not ( = ?auto_165227 ?auto_165230 ) ) ( not ( = ?auto_165228 ?auto_165230 ) ) ( ON ?auto_165227 ?auto_165228 ) ( ON-TABLE ?auto_165231 ) ( ON ?auto_165229 ?auto_165231 ) ( ON ?auto_165230 ?auto_165229 ) ( not ( = ?auto_165231 ?auto_165229 ) ) ( not ( = ?auto_165231 ?auto_165230 ) ) ( not ( = ?auto_165231 ?auto_165228 ) ) ( not ( = ?auto_165231 ?auto_165227 ) ) ( not ( = ?auto_165229 ?auto_165230 ) ) ( not ( = ?auto_165229 ?auto_165228 ) ) ( not ( = ?auto_165229 ?auto_165227 ) ) ( not ( = ?auto_165224 ?auto_165231 ) ) ( not ( = ?auto_165224 ?auto_165229 ) ) ( not ( = ?auto_165225 ?auto_165231 ) ) ( not ( = ?auto_165225 ?auto_165229 ) ) ( not ( = ?auto_165226 ?auto_165231 ) ) ( not ( = ?auto_165226 ?auto_165229 ) ) ( ON ?auto_165226 ?auto_165227 ) ( ON ?auto_165225 ?auto_165226 ) ( CLEAR ?auto_165225 ) ( HOLDING ?auto_165224 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_165224 )
      ( MAKE-5PILE ?auto_165224 ?auto_165225 ?auto_165226 ?auto_165227 ?auto_165228 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_165232 - BLOCK
      ?auto_165233 - BLOCK
      ?auto_165234 - BLOCK
      ?auto_165235 - BLOCK
      ?auto_165236 - BLOCK
    )
    :vars
    (
      ?auto_165237 - BLOCK
      ?auto_165238 - BLOCK
      ?auto_165239 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_165232 ?auto_165233 ) ) ( not ( = ?auto_165232 ?auto_165234 ) ) ( not ( = ?auto_165232 ?auto_165235 ) ) ( not ( = ?auto_165232 ?auto_165236 ) ) ( not ( = ?auto_165233 ?auto_165234 ) ) ( not ( = ?auto_165233 ?auto_165235 ) ) ( not ( = ?auto_165233 ?auto_165236 ) ) ( not ( = ?auto_165234 ?auto_165235 ) ) ( not ( = ?auto_165234 ?auto_165236 ) ) ( not ( = ?auto_165235 ?auto_165236 ) ) ( ON ?auto_165236 ?auto_165237 ) ( not ( = ?auto_165232 ?auto_165237 ) ) ( not ( = ?auto_165233 ?auto_165237 ) ) ( not ( = ?auto_165234 ?auto_165237 ) ) ( not ( = ?auto_165235 ?auto_165237 ) ) ( not ( = ?auto_165236 ?auto_165237 ) ) ( ON ?auto_165235 ?auto_165236 ) ( ON-TABLE ?auto_165238 ) ( ON ?auto_165239 ?auto_165238 ) ( ON ?auto_165237 ?auto_165239 ) ( not ( = ?auto_165238 ?auto_165239 ) ) ( not ( = ?auto_165238 ?auto_165237 ) ) ( not ( = ?auto_165238 ?auto_165236 ) ) ( not ( = ?auto_165238 ?auto_165235 ) ) ( not ( = ?auto_165239 ?auto_165237 ) ) ( not ( = ?auto_165239 ?auto_165236 ) ) ( not ( = ?auto_165239 ?auto_165235 ) ) ( not ( = ?auto_165232 ?auto_165238 ) ) ( not ( = ?auto_165232 ?auto_165239 ) ) ( not ( = ?auto_165233 ?auto_165238 ) ) ( not ( = ?auto_165233 ?auto_165239 ) ) ( not ( = ?auto_165234 ?auto_165238 ) ) ( not ( = ?auto_165234 ?auto_165239 ) ) ( ON ?auto_165234 ?auto_165235 ) ( ON ?auto_165233 ?auto_165234 ) ( ON ?auto_165232 ?auto_165233 ) ( CLEAR ?auto_165232 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_165238 ?auto_165239 ?auto_165237 ?auto_165236 ?auto_165235 ?auto_165234 ?auto_165233 )
      ( MAKE-5PILE ?auto_165232 ?auto_165233 ?auto_165234 ?auto_165235 ?auto_165236 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_165240 - BLOCK
      ?auto_165241 - BLOCK
      ?auto_165242 - BLOCK
      ?auto_165243 - BLOCK
      ?auto_165244 - BLOCK
    )
    :vars
    (
      ?auto_165246 - BLOCK
      ?auto_165247 - BLOCK
      ?auto_165245 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_165240 ?auto_165241 ) ) ( not ( = ?auto_165240 ?auto_165242 ) ) ( not ( = ?auto_165240 ?auto_165243 ) ) ( not ( = ?auto_165240 ?auto_165244 ) ) ( not ( = ?auto_165241 ?auto_165242 ) ) ( not ( = ?auto_165241 ?auto_165243 ) ) ( not ( = ?auto_165241 ?auto_165244 ) ) ( not ( = ?auto_165242 ?auto_165243 ) ) ( not ( = ?auto_165242 ?auto_165244 ) ) ( not ( = ?auto_165243 ?auto_165244 ) ) ( ON ?auto_165244 ?auto_165246 ) ( not ( = ?auto_165240 ?auto_165246 ) ) ( not ( = ?auto_165241 ?auto_165246 ) ) ( not ( = ?auto_165242 ?auto_165246 ) ) ( not ( = ?auto_165243 ?auto_165246 ) ) ( not ( = ?auto_165244 ?auto_165246 ) ) ( ON ?auto_165243 ?auto_165244 ) ( ON-TABLE ?auto_165247 ) ( ON ?auto_165245 ?auto_165247 ) ( ON ?auto_165246 ?auto_165245 ) ( not ( = ?auto_165247 ?auto_165245 ) ) ( not ( = ?auto_165247 ?auto_165246 ) ) ( not ( = ?auto_165247 ?auto_165244 ) ) ( not ( = ?auto_165247 ?auto_165243 ) ) ( not ( = ?auto_165245 ?auto_165246 ) ) ( not ( = ?auto_165245 ?auto_165244 ) ) ( not ( = ?auto_165245 ?auto_165243 ) ) ( not ( = ?auto_165240 ?auto_165247 ) ) ( not ( = ?auto_165240 ?auto_165245 ) ) ( not ( = ?auto_165241 ?auto_165247 ) ) ( not ( = ?auto_165241 ?auto_165245 ) ) ( not ( = ?auto_165242 ?auto_165247 ) ) ( not ( = ?auto_165242 ?auto_165245 ) ) ( ON ?auto_165242 ?auto_165243 ) ( ON ?auto_165241 ?auto_165242 ) ( HOLDING ?auto_165240 ) ( CLEAR ?auto_165241 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_165247 ?auto_165245 ?auto_165246 ?auto_165244 ?auto_165243 ?auto_165242 ?auto_165241 ?auto_165240 )
      ( MAKE-5PILE ?auto_165240 ?auto_165241 ?auto_165242 ?auto_165243 ?auto_165244 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_165248 - BLOCK
      ?auto_165249 - BLOCK
      ?auto_165250 - BLOCK
      ?auto_165251 - BLOCK
      ?auto_165252 - BLOCK
    )
    :vars
    (
      ?auto_165253 - BLOCK
      ?auto_165254 - BLOCK
      ?auto_165255 - BLOCK
      ?auto_165256 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_165248 ?auto_165249 ) ) ( not ( = ?auto_165248 ?auto_165250 ) ) ( not ( = ?auto_165248 ?auto_165251 ) ) ( not ( = ?auto_165248 ?auto_165252 ) ) ( not ( = ?auto_165249 ?auto_165250 ) ) ( not ( = ?auto_165249 ?auto_165251 ) ) ( not ( = ?auto_165249 ?auto_165252 ) ) ( not ( = ?auto_165250 ?auto_165251 ) ) ( not ( = ?auto_165250 ?auto_165252 ) ) ( not ( = ?auto_165251 ?auto_165252 ) ) ( ON ?auto_165252 ?auto_165253 ) ( not ( = ?auto_165248 ?auto_165253 ) ) ( not ( = ?auto_165249 ?auto_165253 ) ) ( not ( = ?auto_165250 ?auto_165253 ) ) ( not ( = ?auto_165251 ?auto_165253 ) ) ( not ( = ?auto_165252 ?auto_165253 ) ) ( ON ?auto_165251 ?auto_165252 ) ( ON-TABLE ?auto_165254 ) ( ON ?auto_165255 ?auto_165254 ) ( ON ?auto_165253 ?auto_165255 ) ( not ( = ?auto_165254 ?auto_165255 ) ) ( not ( = ?auto_165254 ?auto_165253 ) ) ( not ( = ?auto_165254 ?auto_165252 ) ) ( not ( = ?auto_165254 ?auto_165251 ) ) ( not ( = ?auto_165255 ?auto_165253 ) ) ( not ( = ?auto_165255 ?auto_165252 ) ) ( not ( = ?auto_165255 ?auto_165251 ) ) ( not ( = ?auto_165248 ?auto_165254 ) ) ( not ( = ?auto_165248 ?auto_165255 ) ) ( not ( = ?auto_165249 ?auto_165254 ) ) ( not ( = ?auto_165249 ?auto_165255 ) ) ( not ( = ?auto_165250 ?auto_165254 ) ) ( not ( = ?auto_165250 ?auto_165255 ) ) ( ON ?auto_165250 ?auto_165251 ) ( ON ?auto_165249 ?auto_165250 ) ( CLEAR ?auto_165249 ) ( ON ?auto_165248 ?auto_165256 ) ( CLEAR ?auto_165248 ) ( HAND-EMPTY ) ( not ( = ?auto_165248 ?auto_165256 ) ) ( not ( = ?auto_165249 ?auto_165256 ) ) ( not ( = ?auto_165250 ?auto_165256 ) ) ( not ( = ?auto_165251 ?auto_165256 ) ) ( not ( = ?auto_165252 ?auto_165256 ) ) ( not ( = ?auto_165253 ?auto_165256 ) ) ( not ( = ?auto_165254 ?auto_165256 ) ) ( not ( = ?auto_165255 ?auto_165256 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_165248 ?auto_165256 )
      ( MAKE-5PILE ?auto_165248 ?auto_165249 ?auto_165250 ?auto_165251 ?auto_165252 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_165257 - BLOCK
      ?auto_165258 - BLOCK
      ?auto_165259 - BLOCK
      ?auto_165260 - BLOCK
      ?auto_165261 - BLOCK
    )
    :vars
    (
      ?auto_165263 - BLOCK
      ?auto_165264 - BLOCK
      ?auto_165265 - BLOCK
      ?auto_165262 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_165257 ?auto_165258 ) ) ( not ( = ?auto_165257 ?auto_165259 ) ) ( not ( = ?auto_165257 ?auto_165260 ) ) ( not ( = ?auto_165257 ?auto_165261 ) ) ( not ( = ?auto_165258 ?auto_165259 ) ) ( not ( = ?auto_165258 ?auto_165260 ) ) ( not ( = ?auto_165258 ?auto_165261 ) ) ( not ( = ?auto_165259 ?auto_165260 ) ) ( not ( = ?auto_165259 ?auto_165261 ) ) ( not ( = ?auto_165260 ?auto_165261 ) ) ( ON ?auto_165261 ?auto_165263 ) ( not ( = ?auto_165257 ?auto_165263 ) ) ( not ( = ?auto_165258 ?auto_165263 ) ) ( not ( = ?auto_165259 ?auto_165263 ) ) ( not ( = ?auto_165260 ?auto_165263 ) ) ( not ( = ?auto_165261 ?auto_165263 ) ) ( ON ?auto_165260 ?auto_165261 ) ( ON-TABLE ?auto_165264 ) ( ON ?auto_165265 ?auto_165264 ) ( ON ?auto_165263 ?auto_165265 ) ( not ( = ?auto_165264 ?auto_165265 ) ) ( not ( = ?auto_165264 ?auto_165263 ) ) ( not ( = ?auto_165264 ?auto_165261 ) ) ( not ( = ?auto_165264 ?auto_165260 ) ) ( not ( = ?auto_165265 ?auto_165263 ) ) ( not ( = ?auto_165265 ?auto_165261 ) ) ( not ( = ?auto_165265 ?auto_165260 ) ) ( not ( = ?auto_165257 ?auto_165264 ) ) ( not ( = ?auto_165257 ?auto_165265 ) ) ( not ( = ?auto_165258 ?auto_165264 ) ) ( not ( = ?auto_165258 ?auto_165265 ) ) ( not ( = ?auto_165259 ?auto_165264 ) ) ( not ( = ?auto_165259 ?auto_165265 ) ) ( ON ?auto_165259 ?auto_165260 ) ( ON ?auto_165257 ?auto_165262 ) ( CLEAR ?auto_165257 ) ( not ( = ?auto_165257 ?auto_165262 ) ) ( not ( = ?auto_165258 ?auto_165262 ) ) ( not ( = ?auto_165259 ?auto_165262 ) ) ( not ( = ?auto_165260 ?auto_165262 ) ) ( not ( = ?auto_165261 ?auto_165262 ) ) ( not ( = ?auto_165263 ?auto_165262 ) ) ( not ( = ?auto_165264 ?auto_165262 ) ) ( not ( = ?auto_165265 ?auto_165262 ) ) ( HOLDING ?auto_165258 ) ( CLEAR ?auto_165259 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_165264 ?auto_165265 ?auto_165263 ?auto_165261 ?auto_165260 ?auto_165259 ?auto_165258 )
      ( MAKE-5PILE ?auto_165257 ?auto_165258 ?auto_165259 ?auto_165260 ?auto_165261 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_165266 - BLOCK
      ?auto_165267 - BLOCK
      ?auto_165268 - BLOCK
      ?auto_165269 - BLOCK
      ?auto_165270 - BLOCK
    )
    :vars
    (
      ?auto_165274 - BLOCK
      ?auto_165273 - BLOCK
      ?auto_165271 - BLOCK
      ?auto_165272 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_165266 ?auto_165267 ) ) ( not ( = ?auto_165266 ?auto_165268 ) ) ( not ( = ?auto_165266 ?auto_165269 ) ) ( not ( = ?auto_165266 ?auto_165270 ) ) ( not ( = ?auto_165267 ?auto_165268 ) ) ( not ( = ?auto_165267 ?auto_165269 ) ) ( not ( = ?auto_165267 ?auto_165270 ) ) ( not ( = ?auto_165268 ?auto_165269 ) ) ( not ( = ?auto_165268 ?auto_165270 ) ) ( not ( = ?auto_165269 ?auto_165270 ) ) ( ON ?auto_165270 ?auto_165274 ) ( not ( = ?auto_165266 ?auto_165274 ) ) ( not ( = ?auto_165267 ?auto_165274 ) ) ( not ( = ?auto_165268 ?auto_165274 ) ) ( not ( = ?auto_165269 ?auto_165274 ) ) ( not ( = ?auto_165270 ?auto_165274 ) ) ( ON ?auto_165269 ?auto_165270 ) ( ON-TABLE ?auto_165273 ) ( ON ?auto_165271 ?auto_165273 ) ( ON ?auto_165274 ?auto_165271 ) ( not ( = ?auto_165273 ?auto_165271 ) ) ( not ( = ?auto_165273 ?auto_165274 ) ) ( not ( = ?auto_165273 ?auto_165270 ) ) ( not ( = ?auto_165273 ?auto_165269 ) ) ( not ( = ?auto_165271 ?auto_165274 ) ) ( not ( = ?auto_165271 ?auto_165270 ) ) ( not ( = ?auto_165271 ?auto_165269 ) ) ( not ( = ?auto_165266 ?auto_165273 ) ) ( not ( = ?auto_165266 ?auto_165271 ) ) ( not ( = ?auto_165267 ?auto_165273 ) ) ( not ( = ?auto_165267 ?auto_165271 ) ) ( not ( = ?auto_165268 ?auto_165273 ) ) ( not ( = ?auto_165268 ?auto_165271 ) ) ( ON ?auto_165268 ?auto_165269 ) ( ON ?auto_165266 ?auto_165272 ) ( not ( = ?auto_165266 ?auto_165272 ) ) ( not ( = ?auto_165267 ?auto_165272 ) ) ( not ( = ?auto_165268 ?auto_165272 ) ) ( not ( = ?auto_165269 ?auto_165272 ) ) ( not ( = ?auto_165270 ?auto_165272 ) ) ( not ( = ?auto_165274 ?auto_165272 ) ) ( not ( = ?auto_165273 ?auto_165272 ) ) ( not ( = ?auto_165271 ?auto_165272 ) ) ( CLEAR ?auto_165268 ) ( ON ?auto_165267 ?auto_165266 ) ( CLEAR ?auto_165267 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_165272 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_165272 ?auto_165266 )
      ( MAKE-5PILE ?auto_165266 ?auto_165267 ?auto_165268 ?auto_165269 ?auto_165270 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_165275 - BLOCK
      ?auto_165276 - BLOCK
      ?auto_165277 - BLOCK
      ?auto_165278 - BLOCK
      ?auto_165279 - BLOCK
    )
    :vars
    (
      ?auto_165281 - BLOCK
      ?auto_165280 - BLOCK
      ?auto_165283 - BLOCK
      ?auto_165282 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_165275 ?auto_165276 ) ) ( not ( = ?auto_165275 ?auto_165277 ) ) ( not ( = ?auto_165275 ?auto_165278 ) ) ( not ( = ?auto_165275 ?auto_165279 ) ) ( not ( = ?auto_165276 ?auto_165277 ) ) ( not ( = ?auto_165276 ?auto_165278 ) ) ( not ( = ?auto_165276 ?auto_165279 ) ) ( not ( = ?auto_165277 ?auto_165278 ) ) ( not ( = ?auto_165277 ?auto_165279 ) ) ( not ( = ?auto_165278 ?auto_165279 ) ) ( ON ?auto_165279 ?auto_165281 ) ( not ( = ?auto_165275 ?auto_165281 ) ) ( not ( = ?auto_165276 ?auto_165281 ) ) ( not ( = ?auto_165277 ?auto_165281 ) ) ( not ( = ?auto_165278 ?auto_165281 ) ) ( not ( = ?auto_165279 ?auto_165281 ) ) ( ON ?auto_165278 ?auto_165279 ) ( ON-TABLE ?auto_165280 ) ( ON ?auto_165283 ?auto_165280 ) ( ON ?auto_165281 ?auto_165283 ) ( not ( = ?auto_165280 ?auto_165283 ) ) ( not ( = ?auto_165280 ?auto_165281 ) ) ( not ( = ?auto_165280 ?auto_165279 ) ) ( not ( = ?auto_165280 ?auto_165278 ) ) ( not ( = ?auto_165283 ?auto_165281 ) ) ( not ( = ?auto_165283 ?auto_165279 ) ) ( not ( = ?auto_165283 ?auto_165278 ) ) ( not ( = ?auto_165275 ?auto_165280 ) ) ( not ( = ?auto_165275 ?auto_165283 ) ) ( not ( = ?auto_165276 ?auto_165280 ) ) ( not ( = ?auto_165276 ?auto_165283 ) ) ( not ( = ?auto_165277 ?auto_165280 ) ) ( not ( = ?auto_165277 ?auto_165283 ) ) ( ON ?auto_165275 ?auto_165282 ) ( not ( = ?auto_165275 ?auto_165282 ) ) ( not ( = ?auto_165276 ?auto_165282 ) ) ( not ( = ?auto_165277 ?auto_165282 ) ) ( not ( = ?auto_165278 ?auto_165282 ) ) ( not ( = ?auto_165279 ?auto_165282 ) ) ( not ( = ?auto_165281 ?auto_165282 ) ) ( not ( = ?auto_165280 ?auto_165282 ) ) ( not ( = ?auto_165283 ?auto_165282 ) ) ( ON ?auto_165276 ?auto_165275 ) ( CLEAR ?auto_165276 ) ( ON-TABLE ?auto_165282 ) ( HOLDING ?auto_165277 ) ( CLEAR ?auto_165278 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_165280 ?auto_165283 ?auto_165281 ?auto_165279 ?auto_165278 ?auto_165277 )
      ( MAKE-5PILE ?auto_165275 ?auto_165276 ?auto_165277 ?auto_165278 ?auto_165279 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_165284 - BLOCK
      ?auto_165285 - BLOCK
      ?auto_165286 - BLOCK
      ?auto_165287 - BLOCK
      ?auto_165288 - BLOCK
    )
    :vars
    (
      ?auto_165292 - BLOCK
      ?auto_165290 - BLOCK
      ?auto_165289 - BLOCK
      ?auto_165291 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_165284 ?auto_165285 ) ) ( not ( = ?auto_165284 ?auto_165286 ) ) ( not ( = ?auto_165284 ?auto_165287 ) ) ( not ( = ?auto_165284 ?auto_165288 ) ) ( not ( = ?auto_165285 ?auto_165286 ) ) ( not ( = ?auto_165285 ?auto_165287 ) ) ( not ( = ?auto_165285 ?auto_165288 ) ) ( not ( = ?auto_165286 ?auto_165287 ) ) ( not ( = ?auto_165286 ?auto_165288 ) ) ( not ( = ?auto_165287 ?auto_165288 ) ) ( ON ?auto_165288 ?auto_165292 ) ( not ( = ?auto_165284 ?auto_165292 ) ) ( not ( = ?auto_165285 ?auto_165292 ) ) ( not ( = ?auto_165286 ?auto_165292 ) ) ( not ( = ?auto_165287 ?auto_165292 ) ) ( not ( = ?auto_165288 ?auto_165292 ) ) ( ON ?auto_165287 ?auto_165288 ) ( ON-TABLE ?auto_165290 ) ( ON ?auto_165289 ?auto_165290 ) ( ON ?auto_165292 ?auto_165289 ) ( not ( = ?auto_165290 ?auto_165289 ) ) ( not ( = ?auto_165290 ?auto_165292 ) ) ( not ( = ?auto_165290 ?auto_165288 ) ) ( not ( = ?auto_165290 ?auto_165287 ) ) ( not ( = ?auto_165289 ?auto_165292 ) ) ( not ( = ?auto_165289 ?auto_165288 ) ) ( not ( = ?auto_165289 ?auto_165287 ) ) ( not ( = ?auto_165284 ?auto_165290 ) ) ( not ( = ?auto_165284 ?auto_165289 ) ) ( not ( = ?auto_165285 ?auto_165290 ) ) ( not ( = ?auto_165285 ?auto_165289 ) ) ( not ( = ?auto_165286 ?auto_165290 ) ) ( not ( = ?auto_165286 ?auto_165289 ) ) ( ON ?auto_165284 ?auto_165291 ) ( not ( = ?auto_165284 ?auto_165291 ) ) ( not ( = ?auto_165285 ?auto_165291 ) ) ( not ( = ?auto_165286 ?auto_165291 ) ) ( not ( = ?auto_165287 ?auto_165291 ) ) ( not ( = ?auto_165288 ?auto_165291 ) ) ( not ( = ?auto_165292 ?auto_165291 ) ) ( not ( = ?auto_165290 ?auto_165291 ) ) ( not ( = ?auto_165289 ?auto_165291 ) ) ( ON ?auto_165285 ?auto_165284 ) ( ON-TABLE ?auto_165291 ) ( CLEAR ?auto_165287 ) ( ON ?auto_165286 ?auto_165285 ) ( CLEAR ?auto_165286 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_165291 ?auto_165284 ?auto_165285 )
      ( MAKE-5PILE ?auto_165284 ?auto_165285 ?auto_165286 ?auto_165287 ?auto_165288 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_165293 - BLOCK
      ?auto_165294 - BLOCK
      ?auto_165295 - BLOCK
      ?auto_165296 - BLOCK
      ?auto_165297 - BLOCK
    )
    :vars
    (
      ?auto_165298 - BLOCK
      ?auto_165300 - BLOCK
      ?auto_165299 - BLOCK
      ?auto_165301 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_165293 ?auto_165294 ) ) ( not ( = ?auto_165293 ?auto_165295 ) ) ( not ( = ?auto_165293 ?auto_165296 ) ) ( not ( = ?auto_165293 ?auto_165297 ) ) ( not ( = ?auto_165294 ?auto_165295 ) ) ( not ( = ?auto_165294 ?auto_165296 ) ) ( not ( = ?auto_165294 ?auto_165297 ) ) ( not ( = ?auto_165295 ?auto_165296 ) ) ( not ( = ?auto_165295 ?auto_165297 ) ) ( not ( = ?auto_165296 ?auto_165297 ) ) ( ON ?auto_165297 ?auto_165298 ) ( not ( = ?auto_165293 ?auto_165298 ) ) ( not ( = ?auto_165294 ?auto_165298 ) ) ( not ( = ?auto_165295 ?auto_165298 ) ) ( not ( = ?auto_165296 ?auto_165298 ) ) ( not ( = ?auto_165297 ?auto_165298 ) ) ( ON-TABLE ?auto_165300 ) ( ON ?auto_165299 ?auto_165300 ) ( ON ?auto_165298 ?auto_165299 ) ( not ( = ?auto_165300 ?auto_165299 ) ) ( not ( = ?auto_165300 ?auto_165298 ) ) ( not ( = ?auto_165300 ?auto_165297 ) ) ( not ( = ?auto_165300 ?auto_165296 ) ) ( not ( = ?auto_165299 ?auto_165298 ) ) ( not ( = ?auto_165299 ?auto_165297 ) ) ( not ( = ?auto_165299 ?auto_165296 ) ) ( not ( = ?auto_165293 ?auto_165300 ) ) ( not ( = ?auto_165293 ?auto_165299 ) ) ( not ( = ?auto_165294 ?auto_165300 ) ) ( not ( = ?auto_165294 ?auto_165299 ) ) ( not ( = ?auto_165295 ?auto_165300 ) ) ( not ( = ?auto_165295 ?auto_165299 ) ) ( ON ?auto_165293 ?auto_165301 ) ( not ( = ?auto_165293 ?auto_165301 ) ) ( not ( = ?auto_165294 ?auto_165301 ) ) ( not ( = ?auto_165295 ?auto_165301 ) ) ( not ( = ?auto_165296 ?auto_165301 ) ) ( not ( = ?auto_165297 ?auto_165301 ) ) ( not ( = ?auto_165298 ?auto_165301 ) ) ( not ( = ?auto_165300 ?auto_165301 ) ) ( not ( = ?auto_165299 ?auto_165301 ) ) ( ON ?auto_165294 ?auto_165293 ) ( ON-TABLE ?auto_165301 ) ( ON ?auto_165295 ?auto_165294 ) ( CLEAR ?auto_165295 ) ( HOLDING ?auto_165296 ) ( CLEAR ?auto_165297 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_165300 ?auto_165299 ?auto_165298 ?auto_165297 ?auto_165296 )
      ( MAKE-5PILE ?auto_165293 ?auto_165294 ?auto_165295 ?auto_165296 ?auto_165297 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_165302 - BLOCK
      ?auto_165303 - BLOCK
      ?auto_165304 - BLOCK
      ?auto_165305 - BLOCK
      ?auto_165306 - BLOCK
    )
    :vars
    (
      ?auto_165308 - BLOCK
      ?auto_165310 - BLOCK
      ?auto_165309 - BLOCK
      ?auto_165307 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_165302 ?auto_165303 ) ) ( not ( = ?auto_165302 ?auto_165304 ) ) ( not ( = ?auto_165302 ?auto_165305 ) ) ( not ( = ?auto_165302 ?auto_165306 ) ) ( not ( = ?auto_165303 ?auto_165304 ) ) ( not ( = ?auto_165303 ?auto_165305 ) ) ( not ( = ?auto_165303 ?auto_165306 ) ) ( not ( = ?auto_165304 ?auto_165305 ) ) ( not ( = ?auto_165304 ?auto_165306 ) ) ( not ( = ?auto_165305 ?auto_165306 ) ) ( ON ?auto_165306 ?auto_165308 ) ( not ( = ?auto_165302 ?auto_165308 ) ) ( not ( = ?auto_165303 ?auto_165308 ) ) ( not ( = ?auto_165304 ?auto_165308 ) ) ( not ( = ?auto_165305 ?auto_165308 ) ) ( not ( = ?auto_165306 ?auto_165308 ) ) ( ON-TABLE ?auto_165310 ) ( ON ?auto_165309 ?auto_165310 ) ( ON ?auto_165308 ?auto_165309 ) ( not ( = ?auto_165310 ?auto_165309 ) ) ( not ( = ?auto_165310 ?auto_165308 ) ) ( not ( = ?auto_165310 ?auto_165306 ) ) ( not ( = ?auto_165310 ?auto_165305 ) ) ( not ( = ?auto_165309 ?auto_165308 ) ) ( not ( = ?auto_165309 ?auto_165306 ) ) ( not ( = ?auto_165309 ?auto_165305 ) ) ( not ( = ?auto_165302 ?auto_165310 ) ) ( not ( = ?auto_165302 ?auto_165309 ) ) ( not ( = ?auto_165303 ?auto_165310 ) ) ( not ( = ?auto_165303 ?auto_165309 ) ) ( not ( = ?auto_165304 ?auto_165310 ) ) ( not ( = ?auto_165304 ?auto_165309 ) ) ( ON ?auto_165302 ?auto_165307 ) ( not ( = ?auto_165302 ?auto_165307 ) ) ( not ( = ?auto_165303 ?auto_165307 ) ) ( not ( = ?auto_165304 ?auto_165307 ) ) ( not ( = ?auto_165305 ?auto_165307 ) ) ( not ( = ?auto_165306 ?auto_165307 ) ) ( not ( = ?auto_165308 ?auto_165307 ) ) ( not ( = ?auto_165310 ?auto_165307 ) ) ( not ( = ?auto_165309 ?auto_165307 ) ) ( ON ?auto_165303 ?auto_165302 ) ( ON-TABLE ?auto_165307 ) ( ON ?auto_165304 ?auto_165303 ) ( CLEAR ?auto_165306 ) ( ON ?auto_165305 ?auto_165304 ) ( CLEAR ?auto_165305 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_165307 ?auto_165302 ?auto_165303 ?auto_165304 )
      ( MAKE-5PILE ?auto_165302 ?auto_165303 ?auto_165304 ?auto_165305 ?auto_165306 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_165311 - BLOCK
      ?auto_165312 - BLOCK
      ?auto_165313 - BLOCK
      ?auto_165314 - BLOCK
      ?auto_165315 - BLOCK
    )
    :vars
    (
      ?auto_165318 - BLOCK
      ?auto_165316 - BLOCK
      ?auto_165317 - BLOCK
      ?auto_165319 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_165311 ?auto_165312 ) ) ( not ( = ?auto_165311 ?auto_165313 ) ) ( not ( = ?auto_165311 ?auto_165314 ) ) ( not ( = ?auto_165311 ?auto_165315 ) ) ( not ( = ?auto_165312 ?auto_165313 ) ) ( not ( = ?auto_165312 ?auto_165314 ) ) ( not ( = ?auto_165312 ?auto_165315 ) ) ( not ( = ?auto_165313 ?auto_165314 ) ) ( not ( = ?auto_165313 ?auto_165315 ) ) ( not ( = ?auto_165314 ?auto_165315 ) ) ( not ( = ?auto_165311 ?auto_165318 ) ) ( not ( = ?auto_165312 ?auto_165318 ) ) ( not ( = ?auto_165313 ?auto_165318 ) ) ( not ( = ?auto_165314 ?auto_165318 ) ) ( not ( = ?auto_165315 ?auto_165318 ) ) ( ON-TABLE ?auto_165316 ) ( ON ?auto_165317 ?auto_165316 ) ( ON ?auto_165318 ?auto_165317 ) ( not ( = ?auto_165316 ?auto_165317 ) ) ( not ( = ?auto_165316 ?auto_165318 ) ) ( not ( = ?auto_165316 ?auto_165315 ) ) ( not ( = ?auto_165316 ?auto_165314 ) ) ( not ( = ?auto_165317 ?auto_165318 ) ) ( not ( = ?auto_165317 ?auto_165315 ) ) ( not ( = ?auto_165317 ?auto_165314 ) ) ( not ( = ?auto_165311 ?auto_165316 ) ) ( not ( = ?auto_165311 ?auto_165317 ) ) ( not ( = ?auto_165312 ?auto_165316 ) ) ( not ( = ?auto_165312 ?auto_165317 ) ) ( not ( = ?auto_165313 ?auto_165316 ) ) ( not ( = ?auto_165313 ?auto_165317 ) ) ( ON ?auto_165311 ?auto_165319 ) ( not ( = ?auto_165311 ?auto_165319 ) ) ( not ( = ?auto_165312 ?auto_165319 ) ) ( not ( = ?auto_165313 ?auto_165319 ) ) ( not ( = ?auto_165314 ?auto_165319 ) ) ( not ( = ?auto_165315 ?auto_165319 ) ) ( not ( = ?auto_165318 ?auto_165319 ) ) ( not ( = ?auto_165316 ?auto_165319 ) ) ( not ( = ?auto_165317 ?auto_165319 ) ) ( ON ?auto_165312 ?auto_165311 ) ( ON-TABLE ?auto_165319 ) ( ON ?auto_165313 ?auto_165312 ) ( ON ?auto_165314 ?auto_165313 ) ( CLEAR ?auto_165314 ) ( HOLDING ?auto_165315 ) ( CLEAR ?auto_165318 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_165316 ?auto_165317 ?auto_165318 ?auto_165315 )
      ( MAKE-5PILE ?auto_165311 ?auto_165312 ?auto_165313 ?auto_165314 ?auto_165315 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_165320 - BLOCK
      ?auto_165321 - BLOCK
      ?auto_165322 - BLOCK
      ?auto_165323 - BLOCK
      ?auto_165324 - BLOCK
    )
    :vars
    (
      ?auto_165326 - BLOCK
      ?auto_165325 - BLOCK
      ?auto_165328 - BLOCK
      ?auto_165327 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_165320 ?auto_165321 ) ) ( not ( = ?auto_165320 ?auto_165322 ) ) ( not ( = ?auto_165320 ?auto_165323 ) ) ( not ( = ?auto_165320 ?auto_165324 ) ) ( not ( = ?auto_165321 ?auto_165322 ) ) ( not ( = ?auto_165321 ?auto_165323 ) ) ( not ( = ?auto_165321 ?auto_165324 ) ) ( not ( = ?auto_165322 ?auto_165323 ) ) ( not ( = ?auto_165322 ?auto_165324 ) ) ( not ( = ?auto_165323 ?auto_165324 ) ) ( not ( = ?auto_165320 ?auto_165326 ) ) ( not ( = ?auto_165321 ?auto_165326 ) ) ( not ( = ?auto_165322 ?auto_165326 ) ) ( not ( = ?auto_165323 ?auto_165326 ) ) ( not ( = ?auto_165324 ?auto_165326 ) ) ( ON-TABLE ?auto_165325 ) ( ON ?auto_165328 ?auto_165325 ) ( ON ?auto_165326 ?auto_165328 ) ( not ( = ?auto_165325 ?auto_165328 ) ) ( not ( = ?auto_165325 ?auto_165326 ) ) ( not ( = ?auto_165325 ?auto_165324 ) ) ( not ( = ?auto_165325 ?auto_165323 ) ) ( not ( = ?auto_165328 ?auto_165326 ) ) ( not ( = ?auto_165328 ?auto_165324 ) ) ( not ( = ?auto_165328 ?auto_165323 ) ) ( not ( = ?auto_165320 ?auto_165325 ) ) ( not ( = ?auto_165320 ?auto_165328 ) ) ( not ( = ?auto_165321 ?auto_165325 ) ) ( not ( = ?auto_165321 ?auto_165328 ) ) ( not ( = ?auto_165322 ?auto_165325 ) ) ( not ( = ?auto_165322 ?auto_165328 ) ) ( ON ?auto_165320 ?auto_165327 ) ( not ( = ?auto_165320 ?auto_165327 ) ) ( not ( = ?auto_165321 ?auto_165327 ) ) ( not ( = ?auto_165322 ?auto_165327 ) ) ( not ( = ?auto_165323 ?auto_165327 ) ) ( not ( = ?auto_165324 ?auto_165327 ) ) ( not ( = ?auto_165326 ?auto_165327 ) ) ( not ( = ?auto_165325 ?auto_165327 ) ) ( not ( = ?auto_165328 ?auto_165327 ) ) ( ON ?auto_165321 ?auto_165320 ) ( ON-TABLE ?auto_165327 ) ( ON ?auto_165322 ?auto_165321 ) ( ON ?auto_165323 ?auto_165322 ) ( CLEAR ?auto_165326 ) ( ON ?auto_165324 ?auto_165323 ) ( CLEAR ?auto_165324 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_165327 ?auto_165320 ?auto_165321 ?auto_165322 ?auto_165323 )
      ( MAKE-5PILE ?auto_165320 ?auto_165321 ?auto_165322 ?auto_165323 ?auto_165324 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_165329 - BLOCK
      ?auto_165330 - BLOCK
      ?auto_165331 - BLOCK
      ?auto_165332 - BLOCK
      ?auto_165333 - BLOCK
    )
    :vars
    (
      ?auto_165335 - BLOCK
      ?auto_165337 - BLOCK
      ?auto_165336 - BLOCK
      ?auto_165334 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_165329 ?auto_165330 ) ) ( not ( = ?auto_165329 ?auto_165331 ) ) ( not ( = ?auto_165329 ?auto_165332 ) ) ( not ( = ?auto_165329 ?auto_165333 ) ) ( not ( = ?auto_165330 ?auto_165331 ) ) ( not ( = ?auto_165330 ?auto_165332 ) ) ( not ( = ?auto_165330 ?auto_165333 ) ) ( not ( = ?auto_165331 ?auto_165332 ) ) ( not ( = ?auto_165331 ?auto_165333 ) ) ( not ( = ?auto_165332 ?auto_165333 ) ) ( not ( = ?auto_165329 ?auto_165335 ) ) ( not ( = ?auto_165330 ?auto_165335 ) ) ( not ( = ?auto_165331 ?auto_165335 ) ) ( not ( = ?auto_165332 ?auto_165335 ) ) ( not ( = ?auto_165333 ?auto_165335 ) ) ( ON-TABLE ?auto_165337 ) ( ON ?auto_165336 ?auto_165337 ) ( not ( = ?auto_165337 ?auto_165336 ) ) ( not ( = ?auto_165337 ?auto_165335 ) ) ( not ( = ?auto_165337 ?auto_165333 ) ) ( not ( = ?auto_165337 ?auto_165332 ) ) ( not ( = ?auto_165336 ?auto_165335 ) ) ( not ( = ?auto_165336 ?auto_165333 ) ) ( not ( = ?auto_165336 ?auto_165332 ) ) ( not ( = ?auto_165329 ?auto_165337 ) ) ( not ( = ?auto_165329 ?auto_165336 ) ) ( not ( = ?auto_165330 ?auto_165337 ) ) ( not ( = ?auto_165330 ?auto_165336 ) ) ( not ( = ?auto_165331 ?auto_165337 ) ) ( not ( = ?auto_165331 ?auto_165336 ) ) ( ON ?auto_165329 ?auto_165334 ) ( not ( = ?auto_165329 ?auto_165334 ) ) ( not ( = ?auto_165330 ?auto_165334 ) ) ( not ( = ?auto_165331 ?auto_165334 ) ) ( not ( = ?auto_165332 ?auto_165334 ) ) ( not ( = ?auto_165333 ?auto_165334 ) ) ( not ( = ?auto_165335 ?auto_165334 ) ) ( not ( = ?auto_165337 ?auto_165334 ) ) ( not ( = ?auto_165336 ?auto_165334 ) ) ( ON ?auto_165330 ?auto_165329 ) ( ON-TABLE ?auto_165334 ) ( ON ?auto_165331 ?auto_165330 ) ( ON ?auto_165332 ?auto_165331 ) ( ON ?auto_165333 ?auto_165332 ) ( CLEAR ?auto_165333 ) ( HOLDING ?auto_165335 ) ( CLEAR ?auto_165336 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_165337 ?auto_165336 ?auto_165335 )
      ( MAKE-5PILE ?auto_165329 ?auto_165330 ?auto_165331 ?auto_165332 ?auto_165333 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_165338 - BLOCK
      ?auto_165339 - BLOCK
      ?auto_165340 - BLOCK
      ?auto_165341 - BLOCK
      ?auto_165342 - BLOCK
    )
    :vars
    (
      ?auto_165344 - BLOCK
      ?auto_165345 - BLOCK
      ?auto_165346 - BLOCK
      ?auto_165343 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_165338 ?auto_165339 ) ) ( not ( = ?auto_165338 ?auto_165340 ) ) ( not ( = ?auto_165338 ?auto_165341 ) ) ( not ( = ?auto_165338 ?auto_165342 ) ) ( not ( = ?auto_165339 ?auto_165340 ) ) ( not ( = ?auto_165339 ?auto_165341 ) ) ( not ( = ?auto_165339 ?auto_165342 ) ) ( not ( = ?auto_165340 ?auto_165341 ) ) ( not ( = ?auto_165340 ?auto_165342 ) ) ( not ( = ?auto_165341 ?auto_165342 ) ) ( not ( = ?auto_165338 ?auto_165344 ) ) ( not ( = ?auto_165339 ?auto_165344 ) ) ( not ( = ?auto_165340 ?auto_165344 ) ) ( not ( = ?auto_165341 ?auto_165344 ) ) ( not ( = ?auto_165342 ?auto_165344 ) ) ( ON-TABLE ?auto_165345 ) ( ON ?auto_165346 ?auto_165345 ) ( not ( = ?auto_165345 ?auto_165346 ) ) ( not ( = ?auto_165345 ?auto_165344 ) ) ( not ( = ?auto_165345 ?auto_165342 ) ) ( not ( = ?auto_165345 ?auto_165341 ) ) ( not ( = ?auto_165346 ?auto_165344 ) ) ( not ( = ?auto_165346 ?auto_165342 ) ) ( not ( = ?auto_165346 ?auto_165341 ) ) ( not ( = ?auto_165338 ?auto_165345 ) ) ( not ( = ?auto_165338 ?auto_165346 ) ) ( not ( = ?auto_165339 ?auto_165345 ) ) ( not ( = ?auto_165339 ?auto_165346 ) ) ( not ( = ?auto_165340 ?auto_165345 ) ) ( not ( = ?auto_165340 ?auto_165346 ) ) ( ON ?auto_165338 ?auto_165343 ) ( not ( = ?auto_165338 ?auto_165343 ) ) ( not ( = ?auto_165339 ?auto_165343 ) ) ( not ( = ?auto_165340 ?auto_165343 ) ) ( not ( = ?auto_165341 ?auto_165343 ) ) ( not ( = ?auto_165342 ?auto_165343 ) ) ( not ( = ?auto_165344 ?auto_165343 ) ) ( not ( = ?auto_165345 ?auto_165343 ) ) ( not ( = ?auto_165346 ?auto_165343 ) ) ( ON ?auto_165339 ?auto_165338 ) ( ON-TABLE ?auto_165343 ) ( ON ?auto_165340 ?auto_165339 ) ( ON ?auto_165341 ?auto_165340 ) ( ON ?auto_165342 ?auto_165341 ) ( CLEAR ?auto_165346 ) ( ON ?auto_165344 ?auto_165342 ) ( CLEAR ?auto_165344 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_165343 ?auto_165338 ?auto_165339 ?auto_165340 ?auto_165341 ?auto_165342 )
      ( MAKE-5PILE ?auto_165338 ?auto_165339 ?auto_165340 ?auto_165341 ?auto_165342 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_165347 - BLOCK
      ?auto_165348 - BLOCK
      ?auto_165349 - BLOCK
      ?auto_165350 - BLOCK
      ?auto_165351 - BLOCK
    )
    :vars
    (
      ?auto_165352 - BLOCK
      ?auto_165354 - BLOCK
      ?auto_165353 - BLOCK
      ?auto_165355 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_165347 ?auto_165348 ) ) ( not ( = ?auto_165347 ?auto_165349 ) ) ( not ( = ?auto_165347 ?auto_165350 ) ) ( not ( = ?auto_165347 ?auto_165351 ) ) ( not ( = ?auto_165348 ?auto_165349 ) ) ( not ( = ?auto_165348 ?auto_165350 ) ) ( not ( = ?auto_165348 ?auto_165351 ) ) ( not ( = ?auto_165349 ?auto_165350 ) ) ( not ( = ?auto_165349 ?auto_165351 ) ) ( not ( = ?auto_165350 ?auto_165351 ) ) ( not ( = ?auto_165347 ?auto_165352 ) ) ( not ( = ?auto_165348 ?auto_165352 ) ) ( not ( = ?auto_165349 ?auto_165352 ) ) ( not ( = ?auto_165350 ?auto_165352 ) ) ( not ( = ?auto_165351 ?auto_165352 ) ) ( ON-TABLE ?auto_165354 ) ( not ( = ?auto_165354 ?auto_165353 ) ) ( not ( = ?auto_165354 ?auto_165352 ) ) ( not ( = ?auto_165354 ?auto_165351 ) ) ( not ( = ?auto_165354 ?auto_165350 ) ) ( not ( = ?auto_165353 ?auto_165352 ) ) ( not ( = ?auto_165353 ?auto_165351 ) ) ( not ( = ?auto_165353 ?auto_165350 ) ) ( not ( = ?auto_165347 ?auto_165354 ) ) ( not ( = ?auto_165347 ?auto_165353 ) ) ( not ( = ?auto_165348 ?auto_165354 ) ) ( not ( = ?auto_165348 ?auto_165353 ) ) ( not ( = ?auto_165349 ?auto_165354 ) ) ( not ( = ?auto_165349 ?auto_165353 ) ) ( ON ?auto_165347 ?auto_165355 ) ( not ( = ?auto_165347 ?auto_165355 ) ) ( not ( = ?auto_165348 ?auto_165355 ) ) ( not ( = ?auto_165349 ?auto_165355 ) ) ( not ( = ?auto_165350 ?auto_165355 ) ) ( not ( = ?auto_165351 ?auto_165355 ) ) ( not ( = ?auto_165352 ?auto_165355 ) ) ( not ( = ?auto_165354 ?auto_165355 ) ) ( not ( = ?auto_165353 ?auto_165355 ) ) ( ON ?auto_165348 ?auto_165347 ) ( ON-TABLE ?auto_165355 ) ( ON ?auto_165349 ?auto_165348 ) ( ON ?auto_165350 ?auto_165349 ) ( ON ?auto_165351 ?auto_165350 ) ( ON ?auto_165352 ?auto_165351 ) ( CLEAR ?auto_165352 ) ( HOLDING ?auto_165353 ) ( CLEAR ?auto_165354 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_165354 ?auto_165353 )
      ( MAKE-5PILE ?auto_165347 ?auto_165348 ?auto_165349 ?auto_165350 ?auto_165351 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_165356 - BLOCK
      ?auto_165357 - BLOCK
      ?auto_165358 - BLOCK
      ?auto_165359 - BLOCK
      ?auto_165360 - BLOCK
    )
    :vars
    (
      ?auto_165362 - BLOCK
      ?auto_165364 - BLOCK
      ?auto_165363 - BLOCK
      ?auto_165361 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_165356 ?auto_165357 ) ) ( not ( = ?auto_165356 ?auto_165358 ) ) ( not ( = ?auto_165356 ?auto_165359 ) ) ( not ( = ?auto_165356 ?auto_165360 ) ) ( not ( = ?auto_165357 ?auto_165358 ) ) ( not ( = ?auto_165357 ?auto_165359 ) ) ( not ( = ?auto_165357 ?auto_165360 ) ) ( not ( = ?auto_165358 ?auto_165359 ) ) ( not ( = ?auto_165358 ?auto_165360 ) ) ( not ( = ?auto_165359 ?auto_165360 ) ) ( not ( = ?auto_165356 ?auto_165362 ) ) ( not ( = ?auto_165357 ?auto_165362 ) ) ( not ( = ?auto_165358 ?auto_165362 ) ) ( not ( = ?auto_165359 ?auto_165362 ) ) ( not ( = ?auto_165360 ?auto_165362 ) ) ( ON-TABLE ?auto_165364 ) ( not ( = ?auto_165364 ?auto_165363 ) ) ( not ( = ?auto_165364 ?auto_165362 ) ) ( not ( = ?auto_165364 ?auto_165360 ) ) ( not ( = ?auto_165364 ?auto_165359 ) ) ( not ( = ?auto_165363 ?auto_165362 ) ) ( not ( = ?auto_165363 ?auto_165360 ) ) ( not ( = ?auto_165363 ?auto_165359 ) ) ( not ( = ?auto_165356 ?auto_165364 ) ) ( not ( = ?auto_165356 ?auto_165363 ) ) ( not ( = ?auto_165357 ?auto_165364 ) ) ( not ( = ?auto_165357 ?auto_165363 ) ) ( not ( = ?auto_165358 ?auto_165364 ) ) ( not ( = ?auto_165358 ?auto_165363 ) ) ( ON ?auto_165356 ?auto_165361 ) ( not ( = ?auto_165356 ?auto_165361 ) ) ( not ( = ?auto_165357 ?auto_165361 ) ) ( not ( = ?auto_165358 ?auto_165361 ) ) ( not ( = ?auto_165359 ?auto_165361 ) ) ( not ( = ?auto_165360 ?auto_165361 ) ) ( not ( = ?auto_165362 ?auto_165361 ) ) ( not ( = ?auto_165364 ?auto_165361 ) ) ( not ( = ?auto_165363 ?auto_165361 ) ) ( ON ?auto_165357 ?auto_165356 ) ( ON-TABLE ?auto_165361 ) ( ON ?auto_165358 ?auto_165357 ) ( ON ?auto_165359 ?auto_165358 ) ( ON ?auto_165360 ?auto_165359 ) ( ON ?auto_165362 ?auto_165360 ) ( CLEAR ?auto_165364 ) ( ON ?auto_165363 ?auto_165362 ) ( CLEAR ?auto_165363 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_165361 ?auto_165356 ?auto_165357 ?auto_165358 ?auto_165359 ?auto_165360 ?auto_165362 )
      ( MAKE-5PILE ?auto_165356 ?auto_165357 ?auto_165358 ?auto_165359 ?auto_165360 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_165365 - BLOCK
      ?auto_165366 - BLOCK
      ?auto_165367 - BLOCK
      ?auto_165368 - BLOCK
      ?auto_165369 - BLOCK
    )
    :vars
    (
      ?auto_165371 - BLOCK
      ?auto_165370 - BLOCK
      ?auto_165372 - BLOCK
      ?auto_165373 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_165365 ?auto_165366 ) ) ( not ( = ?auto_165365 ?auto_165367 ) ) ( not ( = ?auto_165365 ?auto_165368 ) ) ( not ( = ?auto_165365 ?auto_165369 ) ) ( not ( = ?auto_165366 ?auto_165367 ) ) ( not ( = ?auto_165366 ?auto_165368 ) ) ( not ( = ?auto_165366 ?auto_165369 ) ) ( not ( = ?auto_165367 ?auto_165368 ) ) ( not ( = ?auto_165367 ?auto_165369 ) ) ( not ( = ?auto_165368 ?auto_165369 ) ) ( not ( = ?auto_165365 ?auto_165371 ) ) ( not ( = ?auto_165366 ?auto_165371 ) ) ( not ( = ?auto_165367 ?auto_165371 ) ) ( not ( = ?auto_165368 ?auto_165371 ) ) ( not ( = ?auto_165369 ?auto_165371 ) ) ( not ( = ?auto_165370 ?auto_165372 ) ) ( not ( = ?auto_165370 ?auto_165371 ) ) ( not ( = ?auto_165370 ?auto_165369 ) ) ( not ( = ?auto_165370 ?auto_165368 ) ) ( not ( = ?auto_165372 ?auto_165371 ) ) ( not ( = ?auto_165372 ?auto_165369 ) ) ( not ( = ?auto_165372 ?auto_165368 ) ) ( not ( = ?auto_165365 ?auto_165370 ) ) ( not ( = ?auto_165365 ?auto_165372 ) ) ( not ( = ?auto_165366 ?auto_165370 ) ) ( not ( = ?auto_165366 ?auto_165372 ) ) ( not ( = ?auto_165367 ?auto_165370 ) ) ( not ( = ?auto_165367 ?auto_165372 ) ) ( ON ?auto_165365 ?auto_165373 ) ( not ( = ?auto_165365 ?auto_165373 ) ) ( not ( = ?auto_165366 ?auto_165373 ) ) ( not ( = ?auto_165367 ?auto_165373 ) ) ( not ( = ?auto_165368 ?auto_165373 ) ) ( not ( = ?auto_165369 ?auto_165373 ) ) ( not ( = ?auto_165371 ?auto_165373 ) ) ( not ( = ?auto_165370 ?auto_165373 ) ) ( not ( = ?auto_165372 ?auto_165373 ) ) ( ON ?auto_165366 ?auto_165365 ) ( ON-TABLE ?auto_165373 ) ( ON ?auto_165367 ?auto_165366 ) ( ON ?auto_165368 ?auto_165367 ) ( ON ?auto_165369 ?auto_165368 ) ( ON ?auto_165371 ?auto_165369 ) ( ON ?auto_165372 ?auto_165371 ) ( CLEAR ?auto_165372 ) ( HOLDING ?auto_165370 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_165370 )
      ( MAKE-5PILE ?auto_165365 ?auto_165366 ?auto_165367 ?auto_165368 ?auto_165369 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_165374 - BLOCK
      ?auto_165375 - BLOCK
      ?auto_165376 - BLOCK
      ?auto_165377 - BLOCK
      ?auto_165378 - BLOCK
    )
    :vars
    (
      ?auto_165379 - BLOCK
      ?auto_165382 - BLOCK
      ?auto_165381 - BLOCK
      ?auto_165380 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_165374 ?auto_165375 ) ) ( not ( = ?auto_165374 ?auto_165376 ) ) ( not ( = ?auto_165374 ?auto_165377 ) ) ( not ( = ?auto_165374 ?auto_165378 ) ) ( not ( = ?auto_165375 ?auto_165376 ) ) ( not ( = ?auto_165375 ?auto_165377 ) ) ( not ( = ?auto_165375 ?auto_165378 ) ) ( not ( = ?auto_165376 ?auto_165377 ) ) ( not ( = ?auto_165376 ?auto_165378 ) ) ( not ( = ?auto_165377 ?auto_165378 ) ) ( not ( = ?auto_165374 ?auto_165379 ) ) ( not ( = ?auto_165375 ?auto_165379 ) ) ( not ( = ?auto_165376 ?auto_165379 ) ) ( not ( = ?auto_165377 ?auto_165379 ) ) ( not ( = ?auto_165378 ?auto_165379 ) ) ( not ( = ?auto_165382 ?auto_165381 ) ) ( not ( = ?auto_165382 ?auto_165379 ) ) ( not ( = ?auto_165382 ?auto_165378 ) ) ( not ( = ?auto_165382 ?auto_165377 ) ) ( not ( = ?auto_165381 ?auto_165379 ) ) ( not ( = ?auto_165381 ?auto_165378 ) ) ( not ( = ?auto_165381 ?auto_165377 ) ) ( not ( = ?auto_165374 ?auto_165382 ) ) ( not ( = ?auto_165374 ?auto_165381 ) ) ( not ( = ?auto_165375 ?auto_165382 ) ) ( not ( = ?auto_165375 ?auto_165381 ) ) ( not ( = ?auto_165376 ?auto_165382 ) ) ( not ( = ?auto_165376 ?auto_165381 ) ) ( ON ?auto_165374 ?auto_165380 ) ( not ( = ?auto_165374 ?auto_165380 ) ) ( not ( = ?auto_165375 ?auto_165380 ) ) ( not ( = ?auto_165376 ?auto_165380 ) ) ( not ( = ?auto_165377 ?auto_165380 ) ) ( not ( = ?auto_165378 ?auto_165380 ) ) ( not ( = ?auto_165379 ?auto_165380 ) ) ( not ( = ?auto_165382 ?auto_165380 ) ) ( not ( = ?auto_165381 ?auto_165380 ) ) ( ON ?auto_165375 ?auto_165374 ) ( ON-TABLE ?auto_165380 ) ( ON ?auto_165376 ?auto_165375 ) ( ON ?auto_165377 ?auto_165376 ) ( ON ?auto_165378 ?auto_165377 ) ( ON ?auto_165379 ?auto_165378 ) ( ON ?auto_165381 ?auto_165379 ) ( ON ?auto_165382 ?auto_165381 ) ( CLEAR ?auto_165382 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_165380 ?auto_165374 ?auto_165375 ?auto_165376 ?auto_165377 ?auto_165378 ?auto_165379 ?auto_165381 )
      ( MAKE-5PILE ?auto_165374 ?auto_165375 ?auto_165376 ?auto_165377 ?auto_165378 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_165385 - BLOCK
      ?auto_165386 - BLOCK
    )
    :vars
    (
      ?auto_165387 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_165387 ?auto_165386 ) ( CLEAR ?auto_165387 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_165385 ) ( ON ?auto_165386 ?auto_165385 ) ( not ( = ?auto_165385 ?auto_165386 ) ) ( not ( = ?auto_165385 ?auto_165387 ) ) ( not ( = ?auto_165386 ?auto_165387 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_165387 ?auto_165386 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_165388 - BLOCK
      ?auto_165389 - BLOCK
    )
    :vars
    (
      ?auto_165390 - BLOCK
      ?auto_165391 - BLOCK
      ?auto_165392 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_165390 ?auto_165389 ) ( CLEAR ?auto_165390 ) ( ON-TABLE ?auto_165388 ) ( ON ?auto_165389 ?auto_165388 ) ( not ( = ?auto_165388 ?auto_165389 ) ) ( not ( = ?auto_165388 ?auto_165390 ) ) ( not ( = ?auto_165389 ?auto_165390 ) ) ( HOLDING ?auto_165391 ) ( CLEAR ?auto_165392 ) ( not ( = ?auto_165388 ?auto_165391 ) ) ( not ( = ?auto_165388 ?auto_165392 ) ) ( not ( = ?auto_165389 ?auto_165391 ) ) ( not ( = ?auto_165389 ?auto_165392 ) ) ( not ( = ?auto_165390 ?auto_165391 ) ) ( not ( = ?auto_165390 ?auto_165392 ) ) ( not ( = ?auto_165391 ?auto_165392 ) ) )
    :subtasks
    ( ( !STACK ?auto_165391 ?auto_165392 )
      ( MAKE-2PILE ?auto_165388 ?auto_165389 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_165393 - BLOCK
      ?auto_165394 - BLOCK
    )
    :vars
    (
      ?auto_165396 - BLOCK
      ?auto_165395 - BLOCK
      ?auto_165397 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_165396 ?auto_165394 ) ( ON-TABLE ?auto_165393 ) ( ON ?auto_165394 ?auto_165393 ) ( not ( = ?auto_165393 ?auto_165394 ) ) ( not ( = ?auto_165393 ?auto_165396 ) ) ( not ( = ?auto_165394 ?auto_165396 ) ) ( CLEAR ?auto_165395 ) ( not ( = ?auto_165393 ?auto_165397 ) ) ( not ( = ?auto_165393 ?auto_165395 ) ) ( not ( = ?auto_165394 ?auto_165397 ) ) ( not ( = ?auto_165394 ?auto_165395 ) ) ( not ( = ?auto_165396 ?auto_165397 ) ) ( not ( = ?auto_165396 ?auto_165395 ) ) ( not ( = ?auto_165397 ?auto_165395 ) ) ( ON ?auto_165397 ?auto_165396 ) ( CLEAR ?auto_165397 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_165393 ?auto_165394 ?auto_165396 )
      ( MAKE-2PILE ?auto_165393 ?auto_165394 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_165398 - BLOCK
      ?auto_165399 - BLOCK
    )
    :vars
    (
      ?auto_165402 - BLOCK
      ?auto_165400 - BLOCK
      ?auto_165401 - BLOCK
      ?auto_165403 - BLOCK
      ?auto_165405 - BLOCK
      ?auto_165404 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_165402 ?auto_165399 ) ( ON-TABLE ?auto_165398 ) ( ON ?auto_165399 ?auto_165398 ) ( not ( = ?auto_165398 ?auto_165399 ) ) ( not ( = ?auto_165398 ?auto_165402 ) ) ( not ( = ?auto_165399 ?auto_165402 ) ) ( not ( = ?auto_165398 ?auto_165400 ) ) ( not ( = ?auto_165398 ?auto_165401 ) ) ( not ( = ?auto_165399 ?auto_165400 ) ) ( not ( = ?auto_165399 ?auto_165401 ) ) ( not ( = ?auto_165402 ?auto_165400 ) ) ( not ( = ?auto_165402 ?auto_165401 ) ) ( not ( = ?auto_165400 ?auto_165401 ) ) ( ON ?auto_165400 ?auto_165402 ) ( CLEAR ?auto_165400 ) ( HOLDING ?auto_165401 ) ( CLEAR ?auto_165403 ) ( ON-TABLE ?auto_165405 ) ( ON ?auto_165404 ?auto_165405 ) ( ON ?auto_165403 ?auto_165404 ) ( not ( = ?auto_165405 ?auto_165404 ) ) ( not ( = ?auto_165405 ?auto_165403 ) ) ( not ( = ?auto_165405 ?auto_165401 ) ) ( not ( = ?auto_165404 ?auto_165403 ) ) ( not ( = ?auto_165404 ?auto_165401 ) ) ( not ( = ?auto_165403 ?auto_165401 ) ) ( not ( = ?auto_165398 ?auto_165403 ) ) ( not ( = ?auto_165398 ?auto_165405 ) ) ( not ( = ?auto_165398 ?auto_165404 ) ) ( not ( = ?auto_165399 ?auto_165403 ) ) ( not ( = ?auto_165399 ?auto_165405 ) ) ( not ( = ?auto_165399 ?auto_165404 ) ) ( not ( = ?auto_165402 ?auto_165403 ) ) ( not ( = ?auto_165402 ?auto_165405 ) ) ( not ( = ?auto_165402 ?auto_165404 ) ) ( not ( = ?auto_165400 ?auto_165403 ) ) ( not ( = ?auto_165400 ?auto_165405 ) ) ( not ( = ?auto_165400 ?auto_165404 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_165405 ?auto_165404 ?auto_165403 ?auto_165401 )
      ( MAKE-2PILE ?auto_165398 ?auto_165399 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_165406 - BLOCK
      ?auto_165407 - BLOCK
    )
    :vars
    (
      ?auto_165408 - BLOCK
      ?auto_165410 - BLOCK
      ?auto_165409 - BLOCK
      ?auto_165411 - BLOCK
      ?auto_165413 - BLOCK
      ?auto_165412 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_165408 ?auto_165407 ) ( ON-TABLE ?auto_165406 ) ( ON ?auto_165407 ?auto_165406 ) ( not ( = ?auto_165406 ?auto_165407 ) ) ( not ( = ?auto_165406 ?auto_165408 ) ) ( not ( = ?auto_165407 ?auto_165408 ) ) ( not ( = ?auto_165406 ?auto_165410 ) ) ( not ( = ?auto_165406 ?auto_165409 ) ) ( not ( = ?auto_165407 ?auto_165410 ) ) ( not ( = ?auto_165407 ?auto_165409 ) ) ( not ( = ?auto_165408 ?auto_165410 ) ) ( not ( = ?auto_165408 ?auto_165409 ) ) ( not ( = ?auto_165410 ?auto_165409 ) ) ( ON ?auto_165410 ?auto_165408 ) ( CLEAR ?auto_165411 ) ( ON-TABLE ?auto_165413 ) ( ON ?auto_165412 ?auto_165413 ) ( ON ?auto_165411 ?auto_165412 ) ( not ( = ?auto_165413 ?auto_165412 ) ) ( not ( = ?auto_165413 ?auto_165411 ) ) ( not ( = ?auto_165413 ?auto_165409 ) ) ( not ( = ?auto_165412 ?auto_165411 ) ) ( not ( = ?auto_165412 ?auto_165409 ) ) ( not ( = ?auto_165411 ?auto_165409 ) ) ( not ( = ?auto_165406 ?auto_165411 ) ) ( not ( = ?auto_165406 ?auto_165413 ) ) ( not ( = ?auto_165406 ?auto_165412 ) ) ( not ( = ?auto_165407 ?auto_165411 ) ) ( not ( = ?auto_165407 ?auto_165413 ) ) ( not ( = ?auto_165407 ?auto_165412 ) ) ( not ( = ?auto_165408 ?auto_165411 ) ) ( not ( = ?auto_165408 ?auto_165413 ) ) ( not ( = ?auto_165408 ?auto_165412 ) ) ( not ( = ?auto_165410 ?auto_165411 ) ) ( not ( = ?auto_165410 ?auto_165413 ) ) ( not ( = ?auto_165410 ?auto_165412 ) ) ( ON ?auto_165409 ?auto_165410 ) ( CLEAR ?auto_165409 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_165406 ?auto_165407 ?auto_165408 ?auto_165410 )
      ( MAKE-2PILE ?auto_165406 ?auto_165407 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_165414 - BLOCK
      ?auto_165415 - BLOCK
    )
    :vars
    (
      ?auto_165420 - BLOCK
      ?auto_165416 - BLOCK
      ?auto_165417 - BLOCK
      ?auto_165421 - BLOCK
      ?auto_165419 - BLOCK
      ?auto_165418 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_165420 ?auto_165415 ) ( ON-TABLE ?auto_165414 ) ( ON ?auto_165415 ?auto_165414 ) ( not ( = ?auto_165414 ?auto_165415 ) ) ( not ( = ?auto_165414 ?auto_165420 ) ) ( not ( = ?auto_165415 ?auto_165420 ) ) ( not ( = ?auto_165414 ?auto_165416 ) ) ( not ( = ?auto_165414 ?auto_165417 ) ) ( not ( = ?auto_165415 ?auto_165416 ) ) ( not ( = ?auto_165415 ?auto_165417 ) ) ( not ( = ?auto_165420 ?auto_165416 ) ) ( not ( = ?auto_165420 ?auto_165417 ) ) ( not ( = ?auto_165416 ?auto_165417 ) ) ( ON ?auto_165416 ?auto_165420 ) ( ON-TABLE ?auto_165421 ) ( ON ?auto_165419 ?auto_165421 ) ( not ( = ?auto_165421 ?auto_165419 ) ) ( not ( = ?auto_165421 ?auto_165418 ) ) ( not ( = ?auto_165421 ?auto_165417 ) ) ( not ( = ?auto_165419 ?auto_165418 ) ) ( not ( = ?auto_165419 ?auto_165417 ) ) ( not ( = ?auto_165418 ?auto_165417 ) ) ( not ( = ?auto_165414 ?auto_165418 ) ) ( not ( = ?auto_165414 ?auto_165421 ) ) ( not ( = ?auto_165414 ?auto_165419 ) ) ( not ( = ?auto_165415 ?auto_165418 ) ) ( not ( = ?auto_165415 ?auto_165421 ) ) ( not ( = ?auto_165415 ?auto_165419 ) ) ( not ( = ?auto_165420 ?auto_165418 ) ) ( not ( = ?auto_165420 ?auto_165421 ) ) ( not ( = ?auto_165420 ?auto_165419 ) ) ( not ( = ?auto_165416 ?auto_165418 ) ) ( not ( = ?auto_165416 ?auto_165421 ) ) ( not ( = ?auto_165416 ?auto_165419 ) ) ( ON ?auto_165417 ?auto_165416 ) ( CLEAR ?auto_165417 ) ( HOLDING ?auto_165418 ) ( CLEAR ?auto_165419 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_165421 ?auto_165419 ?auto_165418 )
      ( MAKE-2PILE ?auto_165414 ?auto_165415 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_165422 - BLOCK
      ?auto_165423 - BLOCK
    )
    :vars
    (
      ?auto_165424 - BLOCK
      ?auto_165429 - BLOCK
      ?auto_165425 - BLOCK
      ?auto_165428 - BLOCK
      ?auto_165426 - BLOCK
      ?auto_165427 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_165424 ?auto_165423 ) ( ON-TABLE ?auto_165422 ) ( ON ?auto_165423 ?auto_165422 ) ( not ( = ?auto_165422 ?auto_165423 ) ) ( not ( = ?auto_165422 ?auto_165424 ) ) ( not ( = ?auto_165423 ?auto_165424 ) ) ( not ( = ?auto_165422 ?auto_165429 ) ) ( not ( = ?auto_165422 ?auto_165425 ) ) ( not ( = ?auto_165423 ?auto_165429 ) ) ( not ( = ?auto_165423 ?auto_165425 ) ) ( not ( = ?auto_165424 ?auto_165429 ) ) ( not ( = ?auto_165424 ?auto_165425 ) ) ( not ( = ?auto_165429 ?auto_165425 ) ) ( ON ?auto_165429 ?auto_165424 ) ( ON-TABLE ?auto_165428 ) ( ON ?auto_165426 ?auto_165428 ) ( not ( = ?auto_165428 ?auto_165426 ) ) ( not ( = ?auto_165428 ?auto_165427 ) ) ( not ( = ?auto_165428 ?auto_165425 ) ) ( not ( = ?auto_165426 ?auto_165427 ) ) ( not ( = ?auto_165426 ?auto_165425 ) ) ( not ( = ?auto_165427 ?auto_165425 ) ) ( not ( = ?auto_165422 ?auto_165427 ) ) ( not ( = ?auto_165422 ?auto_165428 ) ) ( not ( = ?auto_165422 ?auto_165426 ) ) ( not ( = ?auto_165423 ?auto_165427 ) ) ( not ( = ?auto_165423 ?auto_165428 ) ) ( not ( = ?auto_165423 ?auto_165426 ) ) ( not ( = ?auto_165424 ?auto_165427 ) ) ( not ( = ?auto_165424 ?auto_165428 ) ) ( not ( = ?auto_165424 ?auto_165426 ) ) ( not ( = ?auto_165429 ?auto_165427 ) ) ( not ( = ?auto_165429 ?auto_165428 ) ) ( not ( = ?auto_165429 ?auto_165426 ) ) ( ON ?auto_165425 ?auto_165429 ) ( CLEAR ?auto_165426 ) ( ON ?auto_165427 ?auto_165425 ) ( CLEAR ?auto_165427 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_165422 ?auto_165423 ?auto_165424 ?auto_165429 ?auto_165425 )
      ( MAKE-2PILE ?auto_165422 ?auto_165423 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_165430 - BLOCK
      ?auto_165431 - BLOCK
    )
    :vars
    (
      ?auto_165437 - BLOCK
      ?auto_165434 - BLOCK
      ?auto_165433 - BLOCK
      ?auto_165432 - BLOCK
      ?auto_165436 - BLOCK
      ?auto_165435 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_165437 ?auto_165431 ) ( ON-TABLE ?auto_165430 ) ( ON ?auto_165431 ?auto_165430 ) ( not ( = ?auto_165430 ?auto_165431 ) ) ( not ( = ?auto_165430 ?auto_165437 ) ) ( not ( = ?auto_165431 ?auto_165437 ) ) ( not ( = ?auto_165430 ?auto_165434 ) ) ( not ( = ?auto_165430 ?auto_165433 ) ) ( not ( = ?auto_165431 ?auto_165434 ) ) ( not ( = ?auto_165431 ?auto_165433 ) ) ( not ( = ?auto_165437 ?auto_165434 ) ) ( not ( = ?auto_165437 ?auto_165433 ) ) ( not ( = ?auto_165434 ?auto_165433 ) ) ( ON ?auto_165434 ?auto_165437 ) ( ON-TABLE ?auto_165432 ) ( not ( = ?auto_165432 ?auto_165436 ) ) ( not ( = ?auto_165432 ?auto_165435 ) ) ( not ( = ?auto_165432 ?auto_165433 ) ) ( not ( = ?auto_165436 ?auto_165435 ) ) ( not ( = ?auto_165436 ?auto_165433 ) ) ( not ( = ?auto_165435 ?auto_165433 ) ) ( not ( = ?auto_165430 ?auto_165435 ) ) ( not ( = ?auto_165430 ?auto_165432 ) ) ( not ( = ?auto_165430 ?auto_165436 ) ) ( not ( = ?auto_165431 ?auto_165435 ) ) ( not ( = ?auto_165431 ?auto_165432 ) ) ( not ( = ?auto_165431 ?auto_165436 ) ) ( not ( = ?auto_165437 ?auto_165435 ) ) ( not ( = ?auto_165437 ?auto_165432 ) ) ( not ( = ?auto_165437 ?auto_165436 ) ) ( not ( = ?auto_165434 ?auto_165435 ) ) ( not ( = ?auto_165434 ?auto_165432 ) ) ( not ( = ?auto_165434 ?auto_165436 ) ) ( ON ?auto_165433 ?auto_165434 ) ( ON ?auto_165435 ?auto_165433 ) ( CLEAR ?auto_165435 ) ( HOLDING ?auto_165436 ) ( CLEAR ?auto_165432 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_165432 ?auto_165436 )
      ( MAKE-2PILE ?auto_165430 ?auto_165431 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_165438 - BLOCK
      ?auto_165439 - BLOCK
    )
    :vars
    (
      ?auto_165440 - BLOCK
      ?auto_165445 - BLOCK
      ?auto_165444 - BLOCK
      ?auto_165441 - BLOCK
      ?auto_165443 - BLOCK
      ?auto_165442 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_165440 ?auto_165439 ) ( ON-TABLE ?auto_165438 ) ( ON ?auto_165439 ?auto_165438 ) ( not ( = ?auto_165438 ?auto_165439 ) ) ( not ( = ?auto_165438 ?auto_165440 ) ) ( not ( = ?auto_165439 ?auto_165440 ) ) ( not ( = ?auto_165438 ?auto_165445 ) ) ( not ( = ?auto_165438 ?auto_165444 ) ) ( not ( = ?auto_165439 ?auto_165445 ) ) ( not ( = ?auto_165439 ?auto_165444 ) ) ( not ( = ?auto_165440 ?auto_165445 ) ) ( not ( = ?auto_165440 ?auto_165444 ) ) ( not ( = ?auto_165445 ?auto_165444 ) ) ( ON ?auto_165445 ?auto_165440 ) ( ON-TABLE ?auto_165441 ) ( not ( = ?auto_165441 ?auto_165443 ) ) ( not ( = ?auto_165441 ?auto_165442 ) ) ( not ( = ?auto_165441 ?auto_165444 ) ) ( not ( = ?auto_165443 ?auto_165442 ) ) ( not ( = ?auto_165443 ?auto_165444 ) ) ( not ( = ?auto_165442 ?auto_165444 ) ) ( not ( = ?auto_165438 ?auto_165442 ) ) ( not ( = ?auto_165438 ?auto_165441 ) ) ( not ( = ?auto_165438 ?auto_165443 ) ) ( not ( = ?auto_165439 ?auto_165442 ) ) ( not ( = ?auto_165439 ?auto_165441 ) ) ( not ( = ?auto_165439 ?auto_165443 ) ) ( not ( = ?auto_165440 ?auto_165442 ) ) ( not ( = ?auto_165440 ?auto_165441 ) ) ( not ( = ?auto_165440 ?auto_165443 ) ) ( not ( = ?auto_165445 ?auto_165442 ) ) ( not ( = ?auto_165445 ?auto_165441 ) ) ( not ( = ?auto_165445 ?auto_165443 ) ) ( ON ?auto_165444 ?auto_165445 ) ( ON ?auto_165442 ?auto_165444 ) ( CLEAR ?auto_165441 ) ( ON ?auto_165443 ?auto_165442 ) ( CLEAR ?auto_165443 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_165438 ?auto_165439 ?auto_165440 ?auto_165445 ?auto_165444 ?auto_165442 )
      ( MAKE-2PILE ?auto_165438 ?auto_165439 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_165446 - BLOCK
      ?auto_165447 - BLOCK
    )
    :vars
    (
      ?auto_165451 - BLOCK
      ?auto_165449 - BLOCK
      ?auto_165448 - BLOCK
      ?auto_165452 - BLOCK
      ?auto_165450 - BLOCK
      ?auto_165453 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_165451 ?auto_165447 ) ( ON-TABLE ?auto_165446 ) ( ON ?auto_165447 ?auto_165446 ) ( not ( = ?auto_165446 ?auto_165447 ) ) ( not ( = ?auto_165446 ?auto_165451 ) ) ( not ( = ?auto_165447 ?auto_165451 ) ) ( not ( = ?auto_165446 ?auto_165449 ) ) ( not ( = ?auto_165446 ?auto_165448 ) ) ( not ( = ?auto_165447 ?auto_165449 ) ) ( not ( = ?auto_165447 ?auto_165448 ) ) ( not ( = ?auto_165451 ?auto_165449 ) ) ( not ( = ?auto_165451 ?auto_165448 ) ) ( not ( = ?auto_165449 ?auto_165448 ) ) ( ON ?auto_165449 ?auto_165451 ) ( not ( = ?auto_165452 ?auto_165450 ) ) ( not ( = ?auto_165452 ?auto_165453 ) ) ( not ( = ?auto_165452 ?auto_165448 ) ) ( not ( = ?auto_165450 ?auto_165453 ) ) ( not ( = ?auto_165450 ?auto_165448 ) ) ( not ( = ?auto_165453 ?auto_165448 ) ) ( not ( = ?auto_165446 ?auto_165453 ) ) ( not ( = ?auto_165446 ?auto_165452 ) ) ( not ( = ?auto_165446 ?auto_165450 ) ) ( not ( = ?auto_165447 ?auto_165453 ) ) ( not ( = ?auto_165447 ?auto_165452 ) ) ( not ( = ?auto_165447 ?auto_165450 ) ) ( not ( = ?auto_165451 ?auto_165453 ) ) ( not ( = ?auto_165451 ?auto_165452 ) ) ( not ( = ?auto_165451 ?auto_165450 ) ) ( not ( = ?auto_165449 ?auto_165453 ) ) ( not ( = ?auto_165449 ?auto_165452 ) ) ( not ( = ?auto_165449 ?auto_165450 ) ) ( ON ?auto_165448 ?auto_165449 ) ( ON ?auto_165453 ?auto_165448 ) ( ON ?auto_165450 ?auto_165453 ) ( CLEAR ?auto_165450 ) ( HOLDING ?auto_165452 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_165452 )
      ( MAKE-2PILE ?auto_165446 ?auto_165447 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_165454 - BLOCK
      ?auto_165455 - BLOCK
    )
    :vars
    (
      ?auto_165461 - BLOCK
      ?auto_165459 - BLOCK
      ?auto_165460 - BLOCK
      ?auto_165457 - BLOCK
      ?auto_165458 - BLOCK
      ?auto_165456 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_165461 ?auto_165455 ) ( ON-TABLE ?auto_165454 ) ( ON ?auto_165455 ?auto_165454 ) ( not ( = ?auto_165454 ?auto_165455 ) ) ( not ( = ?auto_165454 ?auto_165461 ) ) ( not ( = ?auto_165455 ?auto_165461 ) ) ( not ( = ?auto_165454 ?auto_165459 ) ) ( not ( = ?auto_165454 ?auto_165460 ) ) ( not ( = ?auto_165455 ?auto_165459 ) ) ( not ( = ?auto_165455 ?auto_165460 ) ) ( not ( = ?auto_165461 ?auto_165459 ) ) ( not ( = ?auto_165461 ?auto_165460 ) ) ( not ( = ?auto_165459 ?auto_165460 ) ) ( ON ?auto_165459 ?auto_165461 ) ( not ( = ?auto_165457 ?auto_165458 ) ) ( not ( = ?auto_165457 ?auto_165456 ) ) ( not ( = ?auto_165457 ?auto_165460 ) ) ( not ( = ?auto_165458 ?auto_165456 ) ) ( not ( = ?auto_165458 ?auto_165460 ) ) ( not ( = ?auto_165456 ?auto_165460 ) ) ( not ( = ?auto_165454 ?auto_165456 ) ) ( not ( = ?auto_165454 ?auto_165457 ) ) ( not ( = ?auto_165454 ?auto_165458 ) ) ( not ( = ?auto_165455 ?auto_165456 ) ) ( not ( = ?auto_165455 ?auto_165457 ) ) ( not ( = ?auto_165455 ?auto_165458 ) ) ( not ( = ?auto_165461 ?auto_165456 ) ) ( not ( = ?auto_165461 ?auto_165457 ) ) ( not ( = ?auto_165461 ?auto_165458 ) ) ( not ( = ?auto_165459 ?auto_165456 ) ) ( not ( = ?auto_165459 ?auto_165457 ) ) ( not ( = ?auto_165459 ?auto_165458 ) ) ( ON ?auto_165460 ?auto_165459 ) ( ON ?auto_165456 ?auto_165460 ) ( ON ?auto_165458 ?auto_165456 ) ( ON ?auto_165457 ?auto_165458 ) ( CLEAR ?auto_165457 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_165454 ?auto_165455 ?auto_165461 ?auto_165459 ?auto_165460 ?auto_165456 ?auto_165458 )
      ( MAKE-2PILE ?auto_165454 ?auto_165455 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_165462 - BLOCK
      ?auto_165463 - BLOCK
    )
    :vars
    (
      ?auto_165468 - BLOCK
      ?auto_165467 - BLOCK
      ?auto_165465 - BLOCK
      ?auto_165469 - BLOCK
      ?auto_165464 - BLOCK
      ?auto_165466 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_165468 ?auto_165463 ) ( ON-TABLE ?auto_165462 ) ( ON ?auto_165463 ?auto_165462 ) ( not ( = ?auto_165462 ?auto_165463 ) ) ( not ( = ?auto_165462 ?auto_165468 ) ) ( not ( = ?auto_165463 ?auto_165468 ) ) ( not ( = ?auto_165462 ?auto_165467 ) ) ( not ( = ?auto_165462 ?auto_165465 ) ) ( not ( = ?auto_165463 ?auto_165467 ) ) ( not ( = ?auto_165463 ?auto_165465 ) ) ( not ( = ?auto_165468 ?auto_165467 ) ) ( not ( = ?auto_165468 ?auto_165465 ) ) ( not ( = ?auto_165467 ?auto_165465 ) ) ( ON ?auto_165467 ?auto_165468 ) ( not ( = ?auto_165469 ?auto_165464 ) ) ( not ( = ?auto_165469 ?auto_165466 ) ) ( not ( = ?auto_165469 ?auto_165465 ) ) ( not ( = ?auto_165464 ?auto_165466 ) ) ( not ( = ?auto_165464 ?auto_165465 ) ) ( not ( = ?auto_165466 ?auto_165465 ) ) ( not ( = ?auto_165462 ?auto_165466 ) ) ( not ( = ?auto_165462 ?auto_165469 ) ) ( not ( = ?auto_165462 ?auto_165464 ) ) ( not ( = ?auto_165463 ?auto_165466 ) ) ( not ( = ?auto_165463 ?auto_165469 ) ) ( not ( = ?auto_165463 ?auto_165464 ) ) ( not ( = ?auto_165468 ?auto_165466 ) ) ( not ( = ?auto_165468 ?auto_165469 ) ) ( not ( = ?auto_165468 ?auto_165464 ) ) ( not ( = ?auto_165467 ?auto_165466 ) ) ( not ( = ?auto_165467 ?auto_165469 ) ) ( not ( = ?auto_165467 ?auto_165464 ) ) ( ON ?auto_165465 ?auto_165467 ) ( ON ?auto_165466 ?auto_165465 ) ( ON ?auto_165464 ?auto_165466 ) ( HOLDING ?auto_165469 ) ( CLEAR ?auto_165464 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_165462 ?auto_165463 ?auto_165468 ?auto_165467 ?auto_165465 ?auto_165466 ?auto_165464 ?auto_165469 )
      ( MAKE-2PILE ?auto_165462 ?auto_165463 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_165470 - BLOCK
      ?auto_165471 - BLOCK
    )
    :vars
    (
      ?auto_165473 - BLOCK
      ?auto_165477 - BLOCK
      ?auto_165474 - BLOCK
      ?auto_165476 - BLOCK
      ?auto_165475 - BLOCK
      ?auto_165472 - BLOCK
      ?auto_165478 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_165473 ?auto_165471 ) ( ON-TABLE ?auto_165470 ) ( ON ?auto_165471 ?auto_165470 ) ( not ( = ?auto_165470 ?auto_165471 ) ) ( not ( = ?auto_165470 ?auto_165473 ) ) ( not ( = ?auto_165471 ?auto_165473 ) ) ( not ( = ?auto_165470 ?auto_165477 ) ) ( not ( = ?auto_165470 ?auto_165474 ) ) ( not ( = ?auto_165471 ?auto_165477 ) ) ( not ( = ?auto_165471 ?auto_165474 ) ) ( not ( = ?auto_165473 ?auto_165477 ) ) ( not ( = ?auto_165473 ?auto_165474 ) ) ( not ( = ?auto_165477 ?auto_165474 ) ) ( ON ?auto_165477 ?auto_165473 ) ( not ( = ?auto_165476 ?auto_165475 ) ) ( not ( = ?auto_165476 ?auto_165472 ) ) ( not ( = ?auto_165476 ?auto_165474 ) ) ( not ( = ?auto_165475 ?auto_165472 ) ) ( not ( = ?auto_165475 ?auto_165474 ) ) ( not ( = ?auto_165472 ?auto_165474 ) ) ( not ( = ?auto_165470 ?auto_165472 ) ) ( not ( = ?auto_165470 ?auto_165476 ) ) ( not ( = ?auto_165470 ?auto_165475 ) ) ( not ( = ?auto_165471 ?auto_165472 ) ) ( not ( = ?auto_165471 ?auto_165476 ) ) ( not ( = ?auto_165471 ?auto_165475 ) ) ( not ( = ?auto_165473 ?auto_165472 ) ) ( not ( = ?auto_165473 ?auto_165476 ) ) ( not ( = ?auto_165473 ?auto_165475 ) ) ( not ( = ?auto_165477 ?auto_165472 ) ) ( not ( = ?auto_165477 ?auto_165476 ) ) ( not ( = ?auto_165477 ?auto_165475 ) ) ( ON ?auto_165474 ?auto_165477 ) ( ON ?auto_165472 ?auto_165474 ) ( ON ?auto_165475 ?auto_165472 ) ( CLEAR ?auto_165475 ) ( ON ?auto_165476 ?auto_165478 ) ( CLEAR ?auto_165476 ) ( HAND-EMPTY ) ( not ( = ?auto_165470 ?auto_165478 ) ) ( not ( = ?auto_165471 ?auto_165478 ) ) ( not ( = ?auto_165473 ?auto_165478 ) ) ( not ( = ?auto_165477 ?auto_165478 ) ) ( not ( = ?auto_165474 ?auto_165478 ) ) ( not ( = ?auto_165476 ?auto_165478 ) ) ( not ( = ?auto_165475 ?auto_165478 ) ) ( not ( = ?auto_165472 ?auto_165478 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_165476 ?auto_165478 )
      ( MAKE-2PILE ?auto_165470 ?auto_165471 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_165479 - BLOCK
      ?auto_165480 - BLOCK
    )
    :vars
    (
      ?auto_165481 - BLOCK
      ?auto_165483 - BLOCK
      ?auto_165482 - BLOCK
      ?auto_165484 - BLOCK
      ?auto_165487 - BLOCK
      ?auto_165485 - BLOCK
      ?auto_165486 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_165481 ?auto_165480 ) ( ON-TABLE ?auto_165479 ) ( ON ?auto_165480 ?auto_165479 ) ( not ( = ?auto_165479 ?auto_165480 ) ) ( not ( = ?auto_165479 ?auto_165481 ) ) ( not ( = ?auto_165480 ?auto_165481 ) ) ( not ( = ?auto_165479 ?auto_165483 ) ) ( not ( = ?auto_165479 ?auto_165482 ) ) ( not ( = ?auto_165480 ?auto_165483 ) ) ( not ( = ?auto_165480 ?auto_165482 ) ) ( not ( = ?auto_165481 ?auto_165483 ) ) ( not ( = ?auto_165481 ?auto_165482 ) ) ( not ( = ?auto_165483 ?auto_165482 ) ) ( ON ?auto_165483 ?auto_165481 ) ( not ( = ?auto_165484 ?auto_165487 ) ) ( not ( = ?auto_165484 ?auto_165485 ) ) ( not ( = ?auto_165484 ?auto_165482 ) ) ( not ( = ?auto_165487 ?auto_165485 ) ) ( not ( = ?auto_165487 ?auto_165482 ) ) ( not ( = ?auto_165485 ?auto_165482 ) ) ( not ( = ?auto_165479 ?auto_165485 ) ) ( not ( = ?auto_165479 ?auto_165484 ) ) ( not ( = ?auto_165479 ?auto_165487 ) ) ( not ( = ?auto_165480 ?auto_165485 ) ) ( not ( = ?auto_165480 ?auto_165484 ) ) ( not ( = ?auto_165480 ?auto_165487 ) ) ( not ( = ?auto_165481 ?auto_165485 ) ) ( not ( = ?auto_165481 ?auto_165484 ) ) ( not ( = ?auto_165481 ?auto_165487 ) ) ( not ( = ?auto_165483 ?auto_165485 ) ) ( not ( = ?auto_165483 ?auto_165484 ) ) ( not ( = ?auto_165483 ?auto_165487 ) ) ( ON ?auto_165482 ?auto_165483 ) ( ON ?auto_165485 ?auto_165482 ) ( ON ?auto_165484 ?auto_165486 ) ( CLEAR ?auto_165484 ) ( not ( = ?auto_165479 ?auto_165486 ) ) ( not ( = ?auto_165480 ?auto_165486 ) ) ( not ( = ?auto_165481 ?auto_165486 ) ) ( not ( = ?auto_165483 ?auto_165486 ) ) ( not ( = ?auto_165482 ?auto_165486 ) ) ( not ( = ?auto_165484 ?auto_165486 ) ) ( not ( = ?auto_165487 ?auto_165486 ) ) ( not ( = ?auto_165485 ?auto_165486 ) ) ( HOLDING ?auto_165487 ) ( CLEAR ?auto_165485 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_165479 ?auto_165480 ?auto_165481 ?auto_165483 ?auto_165482 ?auto_165485 ?auto_165487 )
      ( MAKE-2PILE ?auto_165479 ?auto_165480 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_165488 - BLOCK
      ?auto_165489 - BLOCK
    )
    :vars
    (
      ?auto_165493 - BLOCK
      ?auto_165496 - BLOCK
      ?auto_165492 - BLOCK
      ?auto_165495 - BLOCK
      ?auto_165490 - BLOCK
      ?auto_165491 - BLOCK
      ?auto_165494 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_165493 ?auto_165489 ) ( ON-TABLE ?auto_165488 ) ( ON ?auto_165489 ?auto_165488 ) ( not ( = ?auto_165488 ?auto_165489 ) ) ( not ( = ?auto_165488 ?auto_165493 ) ) ( not ( = ?auto_165489 ?auto_165493 ) ) ( not ( = ?auto_165488 ?auto_165496 ) ) ( not ( = ?auto_165488 ?auto_165492 ) ) ( not ( = ?auto_165489 ?auto_165496 ) ) ( not ( = ?auto_165489 ?auto_165492 ) ) ( not ( = ?auto_165493 ?auto_165496 ) ) ( not ( = ?auto_165493 ?auto_165492 ) ) ( not ( = ?auto_165496 ?auto_165492 ) ) ( ON ?auto_165496 ?auto_165493 ) ( not ( = ?auto_165495 ?auto_165490 ) ) ( not ( = ?auto_165495 ?auto_165491 ) ) ( not ( = ?auto_165495 ?auto_165492 ) ) ( not ( = ?auto_165490 ?auto_165491 ) ) ( not ( = ?auto_165490 ?auto_165492 ) ) ( not ( = ?auto_165491 ?auto_165492 ) ) ( not ( = ?auto_165488 ?auto_165491 ) ) ( not ( = ?auto_165488 ?auto_165495 ) ) ( not ( = ?auto_165488 ?auto_165490 ) ) ( not ( = ?auto_165489 ?auto_165491 ) ) ( not ( = ?auto_165489 ?auto_165495 ) ) ( not ( = ?auto_165489 ?auto_165490 ) ) ( not ( = ?auto_165493 ?auto_165491 ) ) ( not ( = ?auto_165493 ?auto_165495 ) ) ( not ( = ?auto_165493 ?auto_165490 ) ) ( not ( = ?auto_165496 ?auto_165491 ) ) ( not ( = ?auto_165496 ?auto_165495 ) ) ( not ( = ?auto_165496 ?auto_165490 ) ) ( ON ?auto_165492 ?auto_165496 ) ( ON ?auto_165491 ?auto_165492 ) ( ON ?auto_165495 ?auto_165494 ) ( not ( = ?auto_165488 ?auto_165494 ) ) ( not ( = ?auto_165489 ?auto_165494 ) ) ( not ( = ?auto_165493 ?auto_165494 ) ) ( not ( = ?auto_165496 ?auto_165494 ) ) ( not ( = ?auto_165492 ?auto_165494 ) ) ( not ( = ?auto_165495 ?auto_165494 ) ) ( not ( = ?auto_165490 ?auto_165494 ) ) ( not ( = ?auto_165491 ?auto_165494 ) ) ( CLEAR ?auto_165491 ) ( ON ?auto_165490 ?auto_165495 ) ( CLEAR ?auto_165490 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_165494 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_165494 ?auto_165495 )
      ( MAKE-2PILE ?auto_165488 ?auto_165489 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_165497 - BLOCK
      ?auto_165498 - BLOCK
    )
    :vars
    (
      ?auto_165499 - BLOCK
      ?auto_165501 - BLOCK
      ?auto_165502 - BLOCK
      ?auto_165505 - BLOCK
      ?auto_165503 - BLOCK
      ?auto_165500 - BLOCK
      ?auto_165504 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_165499 ?auto_165498 ) ( ON-TABLE ?auto_165497 ) ( ON ?auto_165498 ?auto_165497 ) ( not ( = ?auto_165497 ?auto_165498 ) ) ( not ( = ?auto_165497 ?auto_165499 ) ) ( not ( = ?auto_165498 ?auto_165499 ) ) ( not ( = ?auto_165497 ?auto_165501 ) ) ( not ( = ?auto_165497 ?auto_165502 ) ) ( not ( = ?auto_165498 ?auto_165501 ) ) ( not ( = ?auto_165498 ?auto_165502 ) ) ( not ( = ?auto_165499 ?auto_165501 ) ) ( not ( = ?auto_165499 ?auto_165502 ) ) ( not ( = ?auto_165501 ?auto_165502 ) ) ( ON ?auto_165501 ?auto_165499 ) ( not ( = ?auto_165505 ?auto_165503 ) ) ( not ( = ?auto_165505 ?auto_165500 ) ) ( not ( = ?auto_165505 ?auto_165502 ) ) ( not ( = ?auto_165503 ?auto_165500 ) ) ( not ( = ?auto_165503 ?auto_165502 ) ) ( not ( = ?auto_165500 ?auto_165502 ) ) ( not ( = ?auto_165497 ?auto_165500 ) ) ( not ( = ?auto_165497 ?auto_165505 ) ) ( not ( = ?auto_165497 ?auto_165503 ) ) ( not ( = ?auto_165498 ?auto_165500 ) ) ( not ( = ?auto_165498 ?auto_165505 ) ) ( not ( = ?auto_165498 ?auto_165503 ) ) ( not ( = ?auto_165499 ?auto_165500 ) ) ( not ( = ?auto_165499 ?auto_165505 ) ) ( not ( = ?auto_165499 ?auto_165503 ) ) ( not ( = ?auto_165501 ?auto_165500 ) ) ( not ( = ?auto_165501 ?auto_165505 ) ) ( not ( = ?auto_165501 ?auto_165503 ) ) ( ON ?auto_165502 ?auto_165501 ) ( ON ?auto_165505 ?auto_165504 ) ( not ( = ?auto_165497 ?auto_165504 ) ) ( not ( = ?auto_165498 ?auto_165504 ) ) ( not ( = ?auto_165499 ?auto_165504 ) ) ( not ( = ?auto_165501 ?auto_165504 ) ) ( not ( = ?auto_165502 ?auto_165504 ) ) ( not ( = ?auto_165505 ?auto_165504 ) ) ( not ( = ?auto_165503 ?auto_165504 ) ) ( not ( = ?auto_165500 ?auto_165504 ) ) ( ON ?auto_165503 ?auto_165505 ) ( CLEAR ?auto_165503 ) ( ON-TABLE ?auto_165504 ) ( HOLDING ?auto_165500 ) ( CLEAR ?auto_165502 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_165497 ?auto_165498 ?auto_165499 ?auto_165501 ?auto_165502 ?auto_165500 )
      ( MAKE-2PILE ?auto_165497 ?auto_165498 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_165506 - BLOCK
      ?auto_165507 - BLOCK
    )
    :vars
    (
      ?auto_165513 - BLOCK
      ?auto_165514 - BLOCK
      ?auto_165509 - BLOCK
      ?auto_165512 - BLOCK
      ?auto_165510 - BLOCK
      ?auto_165508 - BLOCK
      ?auto_165511 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_165513 ?auto_165507 ) ( ON-TABLE ?auto_165506 ) ( ON ?auto_165507 ?auto_165506 ) ( not ( = ?auto_165506 ?auto_165507 ) ) ( not ( = ?auto_165506 ?auto_165513 ) ) ( not ( = ?auto_165507 ?auto_165513 ) ) ( not ( = ?auto_165506 ?auto_165514 ) ) ( not ( = ?auto_165506 ?auto_165509 ) ) ( not ( = ?auto_165507 ?auto_165514 ) ) ( not ( = ?auto_165507 ?auto_165509 ) ) ( not ( = ?auto_165513 ?auto_165514 ) ) ( not ( = ?auto_165513 ?auto_165509 ) ) ( not ( = ?auto_165514 ?auto_165509 ) ) ( ON ?auto_165514 ?auto_165513 ) ( not ( = ?auto_165512 ?auto_165510 ) ) ( not ( = ?auto_165512 ?auto_165508 ) ) ( not ( = ?auto_165512 ?auto_165509 ) ) ( not ( = ?auto_165510 ?auto_165508 ) ) ( not ( = ?auto_165510 ?auto_165509 ) ) ( not ( = ?auto_165508 ?auto_165509 ) ) ( not ( = ?auto_165506 ?auto_165508 ) ) ( not ( = ?auto_165506 ?auto_165512 ) ) ( not ( = ?auto_165506 ?auto_165510 ) ) ( not ( = ?auto_165507 ?auto_165508 ) ) ( not ( = ?auto_165507 ?auto_165512 ) ) ( not ( = ?auto_165507 ?auto_165510 ) ) ( not ( = ?auto_165513 ?auto_165508 ) ) ( not ( = ?auto_165513 ?auto_165512 ) ) ( not ( = ?auto_165513 ?auto_165510 ) ) ( not ( = ?auto_165514 ?auto_165508 ) ) ( not ( = ?auto_165514 ?auto_165512 ) ) ( not ( = ?auto_165514 ?auto_165510 ) ) ( ON ?auto_165509 ?auto_165514 ) ( ON ?auto_165512 ?auto_165511 ) ( not ( = ?auto_165506 ?auto_165511 ) ) ( not ( = ?auto_165507 ?auto_165511 ) ) ( not ( = ?auto_165513 ?auto_165511 ) ) ( not ( = ?auto_165514 ?auto_165511 ) ) ( not ( = ?auto_165509 ?auto_165511 ) ) ( not ( = ?auto_165512 ?auto_165511 ) ) ( not ( = ?auto_165510 ?auto_165511 ) ) ( not ( = ?auto_165508 ?auto_165511 ) ) ( ON ?auto_165510 ?auto_165512 ) ( ON-TABLE ?auto_165511 ) ( CLEAR ?auto_165509 ) ( ON ?auto_165508 ?auto_165510 ) ( CLEAR ?auto_165508 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_165511 ?auto_165512 ?auto_165510 )
      ( MAKE-2PILE ?auto_165506 ?auto_165507 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_165515 - BLOCK
      ?auto_165516 - BLOCK
    )
    :vars
    (
      ?auto_165523 - BLOCK
      ?auto_165522 - BLOCK
      ?auto_165518 - BLOCK
      ?auto_165520 - BLOCK
      ?auto_165521 - BLOCK
      ?auto_165517 - BLOCK
      ?auto_165519 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_165523 ?auto_165516 ) ( ON-TABLE ?auto_165515 ) ( ON ?auto_165516 ?auto_165515 ) ( not ( = ?auto_165515 ?auto_165516 ) ) ( not ( = ?auto_165515 ?auto_165523 ) ) ( not ( = ?auto_165516 ?auto_165523 ) ) ( not ( = ?auto_165515 ?auto_165522 ) ) ( not ( = ?auto_165515 ?auto_165518 ) ) ( not ( = ?auto_165516 ?auto_165522 ) ) ( not ( = ?auto_165516 ?auto_165518 ) ) ( not ( = ?auto_165523 ?auto_165522 ) ) ( not ( = ?auto_165523 ?auto_165518 ) ) ( not ( = ?auto_165522 ?auto_165518 ) ) ( ON ?auto_165522 ?auto_165523 ) ( not ( = ?auto_165520 ?auto_165521 ) ) ( not ( = ?auto_165520 ?auto_165517 ) ) ( not ( = ?auto_165520 ?auto_165518 ) ) ( not ( = ?auto_165521 ?auto_165517 ) ) ( not ( = ?auto_165521 ?auto_165518 ) ) ( not ( = ?auto_165517 ?auto_165518 ) ) ( not ( = ?auto_165515 ?auto_165517 ) ) ( not ( = ?auto_165515 ?auto_165520 ) ) ( not ( = ?auto_165515 ?auto_165521 ) ) ( not ( = ?auto_165516 ?auto_165517 ) ) ( not ( = ?auto_165516 ?auto_165520 ) ) ( not ( = ?auto_165516 ?auto_165521 ) ) ( not ( = ?auto_165523 ?auto_165517 ) ) ( not ( = ?auto_165523 ?auto_165520 ) ) ( not ( = ?auto_165523 ?auto_165521 ) ) ( not ( = ?auto_165522 ?auto_165517 ) ) ( not ( = ?auto_165522 ?auto_165520 ) ) ( not ( = ?auto_165522 ?auto_165521 ) ) ( ON ?auto_165520 ?auto_165519 ) ( not ( = ?auto_165515 ?auto_165519 ) ) ( not ( = ?auto_165516 ?auto_165519 ) ) ( not ( = ?auto_165523 ?auto_165519 ) ) ( not ( = ?auto_165522 ?auto_165519 ) ) ( not ( = ?auto_165518 ?auto_165519 ) ) ( not ( = ?auto_165520 ?auto_165519 ) ) ( not ( = ?auto_165521 ?auto_165519 ) ) ( not ( = ?auto_165517 ?auto_165519 ) ) ( ON ?auto_165521 ?auto_165520 ) ( ON-TABLE ?auto_165519 ) ( ON ?auto_165517 ?auto_165521 ) ( CLEAR ?auto_165517 ) ( HOLDING ?auto_165518 ) ( CLEAR ?auto_165522 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_165515 ?auto_165516 ?auto_165523 ?auto_165522 ?auto_165518 )
      ( MAKE-2PILE ?auto_165515 ?auto_165516 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_165524 - BLOCK
      ?auto_165525 - BLOCK
    )
    :vars
    (
      ?auto_165530 - BLOCK
      ?auto_165532 - BLOCK
      ?auto_165526 - BLOCK
      ?auto_165528 - BLOCK
      ?auto_165531 - BLOCK
      ?auto_165529 - BLOCK
      ?auto_165527 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_165530 ?auto_165525 ) ( ON-TABLE ?auto_165524 ) ( ON ?auto_165525 ?auto_165524 ) ( not ( = ?auto_165524 ?auto_165525 ) ) ( not ( = ?auto_165524 ?auto_165530 ) ) ( not ( = ?auto_165525 ?auto_165530 ) ) ( not ( = ?auto_165524 ?auto_165532 ) ) ( not ( = ?auto_165524 ?auto_165526 ) ) ( not ( = ?auto_165525 ?auto_165532 ) ) ( not ( = ?auto_165525 ?auto_165526 ) ) ( not ( = ?auto_165530 ?auto_165532 ) ) ( not ( = ?auto_165530 ?auto_165526 ) ) ( not ( = ?auto_165532 ?auto_165526 ) ) ( ON ?auto_165532 ?auto_165530 ) ( not ( = ?auto_165528 ?auto_165531 ) ) ( not ( = ?auto_165528 ?auto_165529 ) ) ( not ( = ?auto_165528 ?auto_165526 ) ) ( not ( = ?auto_165531 ?auto_165529 ) ) ( not ( = ?auto_165531 ?auto_165526 ) ) ( not ( = ?auto_165529 ?auto_165526 ) ) ( not ( = ?auto_165524 ?auto_165529 ) ) ( not ( = ?auto_165524 ?auto_165528 ) ) ( not ( = ?auto_165524 ?auto_165531 ) ) ( not ( = ?auto_165525 ?auto_165529 ) ) ( not ( = ?auto_165525 ?auto_165528 ) ) ( not ( = ?auto_165525 ?auto_165531 ) ) ( not ( = ?auto_165530 ?auto_165529 ) ) ( not ( = ?auto_165530 ?auto_165528 ) ) ( not ( = ?auto_165530 ?auto_165531 ) ) ( not ( = ?auto_165532 ?auto_165529 ) ) ( not ( = ?auto_165532 ?auto_165528 ) ) ( not ( = ?auto_165532 ?auto_165531 ) ) ( ON ?auto_165528 ?auto_165527 ) ( not ( = ?auto_165524 ?auto_165527 ) ) ( not ( = ?auto_165525 ?auto_165527 ) ) ( not ( = ?auto_165530 ?auto_165527 ) ) ( not ( = ?auto_165532 ?auto_165527 ) ) ( not ( = ?auto_165526 ?auto_165527 ) ) ( not ( = ?auto_165528 ?auto_165527 ) ) ( not ( = ?auto_165531 ?auto_165527 ) ) ( not ( = ?auto_165529 ?auto_165527 ) ) ( ON ?auto_165531 ?auto_165528 ) ( ON-TABLE ?auto_165527 ) ( ON ?auto_165529 ?auto_165531 ) ( CLEAR ?auto_165532 ) ( ON ?auto_165526 ?auto_165529 ) ( CLEAR ?auto_165526 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_165527 ?auto_165528 ?auto_165531 ?auto_165529 )
      ( MAKE-2PILE ?auto_165524 ?auto_165525 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_165533 - BLOCK
      ?auto_165534 - BLOCK
    )
    :vars
    (
      ?auto_165540 - BLOCK
      ?auto_165535 - BLOCK
      ?auto_165536 - BLOCK
      ?auto_165539 - BLOCK
      ?auto_165537 - BLOCK
      ?auto_165541 - BLOCK
      ?auto_165538 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_165540 ?auto_165534 ) ( ON-TABLE ?auto_165533 ) ( ON ?auto_165534 ?auto_165533 ) ( not ( = ?auto_165533 ?auto_165534 ) ) ( not ( = ?auto_165533 ?auto_165540 ) ) ( not ( = ?auto_165534 ?auto_165540 ) ) ( not ( = ?auto_165533 ?auto_165535 ) ) ( not ( = ?auto_165533 ?auto_165536 ) ) ( not ( = ?auto_165534 ?auto_165535 ) ) ( not ( = ?auto_165534 ?auto_165536 ) ) ( not ( = ?auto_165540 ?auto_165535 ) ) ( not ( = ?auto_165540 ?auto_165536 ) ) ( not ( = ?auto_165535 ?auto_165536 ) ) ( not ( = ?auto_165539 ?auto_165537 ) ) ( not ( = ?auto_165539 ?auto_165541 ) ) ( not ( = ?auto_165539 ?auto_165536 ) ) ( not ( = ?auto_165537 ?auto_165541 ) ) ( not ( = ?auto_165537 ?auto_165536 ) ) ( not ( = ?auto_165541 ?auto_165536 ) ) ( not ( = ?auto_165533 ?auto_165541 ) ) ( not ( = ?auto_165533 ?auto_165539 ) ) ( not ( = ?auto_165533 ?auto_165537 ) ) ( not ( = ?auto_165534 ?auto_165541 ) ) ( not ( = ?auto_165534 ?auto_165539 ) ) ( not ( = ?auto_165534 ?auto_165537 ) ) ( not ( = ?auto_165540 ?auto_165541 ) ) ( not ( = ?auto_165540 ?auto_165539 ) ) ( not ( = ?auto_165540 ?auto_165537 ) ) ( not ( = ?auto_165535 ?auto_165541 ) ) ( not ( = ?auto_165535 ?auto_165539 ) ) ( not ( = ?auto_165535 ?auto_165537 ) ) ( ON ?auto_165539 ?auto_165538 ) ( not ( = ?auto_165533 ?auto_165538 ) ) ( not ( = ?auto_165534 ?auto_165538 ) ) ( not ( = ?auto_165540 ?auto_165538 ) ) ( not ( = ?auto_165535 ?auto_165538 ) ) ( not ( = ?auto_165536 ?auto_165538 ) ) ( not ( = ?auto_165539 ?auto_165538 ) ) ( not ( = ?auto_165537 ?auto_165538 ) ) ( not ( = ?auto_165541 ?auto_165538 ) ) ( ON ?auto_165537 ?auto_165539 ) ( ON-TABLE ?auto_165538 ) ( ON ?auto_165541 ?auto_165537 ) ( ON ?auto_165536 ?auto_165541 ) ( CLEAR ?auto_165536 ) ( HOLDING ?auto_165535 ) ( CLEAR ?auto_165540 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_165533 ?auto_165534 ?auto_165540 ?auto_165535 )
      ( MAKE-2PILE ?auto_165533 ?auto_165534 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_165542 - BLOCK
      ?auto_165543 - BLOCK
    )
    :vars
    (
      ?auto_165548 - BLOCK
      ?auto_165546 - BLOCK
      ?auto_165544 - BLOCK
      ?auto_165547 - BLOCK
      ?auto_165545 - BLOCK
      ?auto_165550 - BLOCK
      ?auto_165549 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_165548 ?auto_165543 ) ( ON-TABLE ?auto_165542 ) ( ON ?auto_165543 ?auto_165542 ) ( not ( = ?auto_165542 ?auto_165543 ) ) ( not ( = ?auto_165542 ?auto_165548 ) ) ( not ( = ?auto_165543 ?auto_165548 ) ) ( not ( = ?auto_165542 ?auto_165546 ) ) ( not ( = ?auto_165542 ?auto_165544 ) ) ( not ( = ?auto_165543 ?auto_165546 ) ) ( not ( = ?auto_165543 ?auto_165544 ) ) ( not ( = ?auto_165548 ?auto_165546 ) ) ( not ( = ?auto_165548 ?auto_165544 ) ) ( not ( = ?auto_165546 ?auto_165544 ) ) ( not ( = ?auto_165547 ?auto_165545 ) ) ( not ( = ?auto_165547 ?auto_165550 ) ) ( not ( = ?auto_165547 ?auto_165544 ) ) ( not ( = ?auto_165545 ?auto_165550 ) ) ( not ( = ?auto_165545 ?auto_165544 ) ) ( not ( = ?auto_165550 ?auto_165544 ) ) ( not ( = ?auto_165542 ?auto_165550 ) ) ( not ( = ?auto_165542 ?auto_165547 ) ) ( not ( = ?auto_165542 ?auto_165545 ) ) ( not ( = ?auto_165543 ?auto_165550 ) ) ( not ( = ?auto_165543 ?auto_165547 ) ) ( not ( = ?auto_165543 ?auto_165545 ) ) ( not ( = ?auto_165548 ?auto_165550 ) ) ( not ( = ?auto_165548 ?auto_165547 ) ) ( not ( = ?auto_165548 ?auto_165545 ) ) ( not ( = ?auto_165546 ?auto_165550 ) ) ( not ( = ?auto_165546 ?auto_165547 ) ) ( not ( = ?auto_165546 ?auto_165545 ) ) ( ON ?auto_165547 ?auto_165549 ) ( not ( = ?auto_165542 ?auto_165549 ) ) ( not ( = ?auto_165543 ?auto_165549 ) ) ( not ( = ?auto_165548 ?auto_165549 ) ) ( not ( = ?auto_165546 ?auto_165549 ) ) ( not ( = ?auto_165544 ?auto_165549 ) ) ( not ( = ?auto_165547 ?auto_165549 ) ) ( not ( = ?auto_165545 ?auto_165549 ) ) ( not ( = ?auto_165550 ?auto_165549 ) ) ( ON ?auto_165545 ?auto_165547 ) ( ON-TABLE ?auto_165549 ) ( ON ?auto_165550 ?auto_165545 ) ( ON ?auto_165544 ?auto_165550 ) ( CLEAR ?auto_165548 ) ( ON ?auto_165546 ?auto_165544 ) ( CLEAR ?auto_165546 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_165549 ?auto_165547 ?auto_165545 ?auto_165550 ?auto_165544 )
      ( MAKE-2PILE ?auto_165542 ?auto_165543 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_165569 - BLOCK
      ?auto_165570 - BLOCK
    )
    :vars
    (
      ?auto_165574 - BLOCK
      ?auto_165576 - BLOCK
      ?auto_165572 - BLOCK
      ?auto_165575 - BLOCK
      ?auto_165577 - BLOCK
      ?auto_165571 - BLOCK
      ?auto_165573 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_165569 ) ( not ( = ?auto_165569 ?auto_165570 ) ) ( not ( = ?auto_165569 ?auto_165574 ) ) ( not ( = ?auto_165570 ?auto_165574 ) ) ( not ( = ?auto_165569 ?auto_165576 ) ) ( not ( = ?auto_165569 ?auto_165572 ) ) ( not ( = ?auto_165570 ?auto_165576 ) ) ( not ( = ?auto_165570 ?auto_165572 ) ) ( not ( = ?auto_165574 ?auto_165576 ) ) ( not ( = ?auto_165574 ?auto_165572 ) ) ( not ( = ?auto_165576 ?auto_165572 ) ) ( not ( = ?auto_165575 ?auto_165577 ) ) ( not ( = ?auto_165575 ?auto_165571 ) ) ( not ( = ?auto_165575 ?auto_165572 ) ) ( not ( = ?auto_165577 ?auto_165571 ) ) ( not ( = ?auto_165577 ?auto_165572 ) ) ( not ( = ?auto_165571 ?auto_165572 ) ) ( not ( = ?auto_165569 ?auto_165571 ) ) ( not ( = ?auto_165569 ?auto_165575 ) ) ( not ( = ?auto_165569 ?auto_165577 ) ) ( not ( = ?auto_165570 ?auto_165571 ) ) ( not ( = ?auto_165570 ?auto_165575 ) ) ( not ( = ?auto_165570 ?auto_165577 ) ) ( not ( = ?auto_165574 ?auto_165571 ) ) ( not ( = ?auto_165574 ?auto_165575 ) ) ( not ( = ?auto_165574 ?auto_165577 ) ) ( not ( = ?auto_165576 ?auto_165571 ) ) ( not ( = ?auto_165576 ?auto_165575 ) ) ( not ( = ?auto_165576 ?auto_165577 ) ) ( ON ?auto_165575 ?auto_165573 ) ( not ( = ?auto_165569 ?auto_165573 ) ) ( not ( = ?auto_165570 ?auto_165573 ) ) ( not ( = ?auto_165574 ?auto_165573 ) ) ( not ( = ?auto_165576 ?auto_165573 ) ) ( not ( = ?auto_165572 ?auto_165573 ) ) ( not ( = ?auto_165575 ?auto_165573 ) ) ( not ( = ?auto_165577 ?auto_165573 ) ) ( not ( = ?auto_165571 ?auto_165573 ) ) ( ON ?auto_165577 ?auto_165575 ) ( ON-TABLE ?auto_165573 ) ( ON ?auto_165571 ?auto_165577 ) ( ON ?auto_165572 ?auto_165571 ) ( ON ?auto_165576 ?auto_165572 ) ( ON ?auto_165574 ?auto_165576 ) ( CLEAR ?auto_165574 ) ( HOLDING ?auto_165570 ) ( CLEAR ?auto_165569 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_165569 ?auto_165570 ?auto_165574 )
      ( MAKE-2PILE ?auto_165569 ?auto_165570 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_165578 - BLOCK
      ?auto_165579 - BLOCK
    )
    :vars
    (
      ?auto_165584 - BLOCK
      ?auto_165583 - BLOCK
      ?auto_165585 - BLOCK
      ?auto_165581 - BLOCK
      ?auto_165582 - BLOCK
      ?auto_165586 - BLOCK
      ?auto_165580 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_165578 ) ( not ( = ?auto_165578 ?auto_165579 ) ) ( not ( = ?auto_165578 ?auto_165584 ) ) ( not ( = ?auto_165579 ?auto_165584 ) ) ( not ( = ?auto_165578 ?auto_165583 ) ) ( not ( = ?auto_165578 ?auto_165585 ) ) ( not ( = ?auto_165579 ?auto_165583 ) ) ( not ( = ?auto_165579 ?auto_165585 ) ) ( not ( = ?auto_165584 ?auto_165583 ) ) ( not ( = ?auto_165584 ?auto_165585 ) ) ( not ( = ?auto_165583 ?auto_165585 ) ) ( not ( = ?auto_165581 ?auto_165582 ) ) ( not ( = ?auto_165581 ?auto_165586 ) ) ( not ( = ?auto_165581 ?auto_165585 ) ) ( not ( = ?auto_165582 ?auto_165586 ) ) ( not ( = ?auto_165582 ?auto_165585 ) ) ( not ( = ?auto_165586 ?auto_165585 ) ) ( not ( = ?auto_165578 ?auto_165586 ) ) ( not ( = ?auto_165578 ?auto_165581 ) ) ( not ( = ?auto_165578 ?auto_165582 ) ) ( not ( = ?auto_165579 ?auto_165586 ) ) ( not ( = ?auto_165579 ?auto_165581 ) ) ( not ( = ?auto_165579 ?auto_165582 ) ) ( not ( = ?auto_165584 ?auto_165586 ) ) ( not ( = ?auto_165584 ?auto_165581 ) ) ( not ( = ?auto_165584 ?auto_165582 ) ) ( not ( = ?auto_165583 ?auto_165586 ) ) ( not ( = ?auto_165583 ?auto_165581 ) ) ( not ( = ?auto_165583 ?auto_165582 ) ) ( ON ?auto_165581 ?auto_165580 ) ( not ( = ?auto_165578 ?auto_165580 ) ) ( not ( = ?auto_165579 ?auto_165580 ) ) ( not ( = ?auto_165584 ?auto_165580 ) ) ( not ( = ?auto_165583 ?auto_165580 ) ) ( not ( = ?auto_165585 ?auto_165580 ) ) ( not ( = ?auto_165581 ?auto_165580 ) ) ( not ( = ?auto_165582 ?auto_165580 ) ) ( not ( = ?auto_165586 ?auto_165580 ) ) ( ON ?auto_165582 ?auto_165581 ) ( ON-TABLE ?auto_165580 ) ( ON ?auto_165586 ?auto_165582 ) ( ON ?auto_165585 ?auto_165586 ) ( ON ?auto_165583 ?auto_165585 ) ( ON ?auto_165584 ?auto_165583 ) ( CLEAR ?auto_165578 ) ( ON ?auto_165579 ?auto_165584 ) ( CLEAR ?auto_165579 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_165580 ?auto_165581 ?auto_165582 ?auto_165586 ?auto_165585 ?auto_165583 ?auto_165584 )
      ( MAKE-2PILE ?auto_165578 ?auto_165579 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_165587 - BLOCK
      ?auto_165588 - BLOCK
    )
    :vars
    (
      ?auto_165590 - BLOCK
      ?auto_165595 - BLOCK
      ?auto_165593 - BLOCK
      ?auto_165591 - BLOCK
      ?auto_165589 - BLOCK
      ?auto_165592 - BLOCK
      ?auto_165594 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_165587 ?auto_165588 ) ) ( not ( = ?auto_165587 ?auto_165590 ) ) ( not ( = ?auto_165588 ?auto_165590 ) ) ( not ( = ?auto_165587 ?auto_165595 ) ) ( not ( = ?auto_165587 ?auto_165593 ) ) ( not ( = ?auto_165588 ?auto_165595 ) ) ( not ( = ?auto_165588 ?auto_165593 ) ) ( not ( = ?auto_165590 ?auto_165595 ) ) ( not ( = ?auto_165590 ?auto_165593 ) ) ( not ( = ?auto_165595 ?auto_165593 ) ) ( not ( = ?auto_165591 ?auto_165589 ) ) ( not ( = ?auto_165591 ?auto_165592 ) ) ( not ( = ?auto_165591 ?auto_165593 ) ) ( not ( = ?auto_165589 ?auto_165592 ) ) ( not ( = ?auto_165589 ?auto_165593 ) ) ( not ( = ?auto_165592 ?auto_165593 ) ) ( not ( = ?auto_165587 ?auto_165592 ) ) ( not ( = ?auto_165587 ?auto_165591 ) ) ( not ( = ?auto_165587 ?auto_165589 ) ) ( not ( = ?auto_165588 ?auto_165592 ) ) ( not ( = ?auto_165588 ?auto_165591 ) ) ( not ( = ?auto_165588 ?auto_165589 ) ) ( not ( = ?auto_165590 ?auto_165592 ) ) ( not ( = ?auto_165590 ?auto_165591 ) ) ( not ( = ?auto_165590 ?auto_165589 ) ) ( not ( = ?auto_165595 ?auto_165592 ) ) ( not ( = ?auto_165595 ?auto_165591 ) ) ( not ( = ?auto_165595 ?auto_165589 ) ) ( ON ?auto_165591 ?auto_165594 ) ( not ( = ?auto_165587 ?auto_165594 ) ) ( not ( = ?auto_165588 ?auto_165594 ) ) ( not ( = ?auto_165590 ?auto_165594 ) ) ( not ( = ?auto_165595 ?auto_165594 ) ) ( not ( = ?auto_165593 ?auto_165594 ) ) ( not ( = ?auto_165591 ?auto_165594 ) ) ( not ( = ?auto_165589 ?auto_165594 ) ) ( not ( = ?auto_165592 ?auto_165594 ) ) ( ON ?auto_165589 ?auto_165591 ) ( ON-TABLE ?auto_165594 ) ( ON ?auto_165592 ?auto_165589 ) ( ON ?auto_165593 ?auto_165592 ) ( ON ?auto_165595 ?auto_165593 ) ( ON ?auto_165590 ?auto_165595 ) ( ON ?auto_165588 ?auto_165590 ) ( CLEAR ?auto_165588 ) ( HOLDING ?auto_165587 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_165587 )
      ( MAKE-2PILE ?auto_165587 ?auto_165588 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_165596 - BLOCK
      ?auto_165597 - BLOCK
    )
    :vars
    (
      ?auto_165602 - BLOCK
      ?auto_165598 - BLOCK
      ?auto_165604 - BLOCK
      ?auto_165603 - BLOCK
      ?auto_165599 - BLOCK
      ?auto_165600 - BLOCK
      ?auto_165601 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_165596 ?auto_165597 ) ) ( not ( = ?auto_165596 ?auto_165602 ) ) ( not ( = ?auto_165597 ?auto_165602 ) ) ( not ( = ?auto_165596 ?auto_165598 ) ) ( not ( = ?auto_165596 ?auto_165604 ) ) ( not ( = ?auto_165597 ?auto_165598 ) ) ( not ( = ?auto_165597 ?auto_165604 ) ) ( not ( = ?auto_165602 ?auto_165598 ) ) ( not ( = ?auto_165602 ?auto_165604 ) ) ( not ( = ?auto_165598 ?auto_165604 ) ) ( not ( = ?auto_165603 ?auto_165599 ) ) ( not ( = ?auto_165603 ?auto_165600 ) ) ( not ( = ?auto_165603 ?auto_165604 ) ) ( not ( = ?auto_165599 ?auto_165600 ) ) ( not ( = ?auto_165599 ?auto_165604 ) ) ( not ( = ?auto_165600 ?auto_165604 ) ) ( not ( = ?auto_165596 ?auto_165600 ) ) ( not ( = ?auto_165596 ?auto_165603 ) ) ( not ( = ?auto_165596 ?auto_165599 ) ) ( not ( = ?auto_165597 ?auto_165600 ) ) ( not ( = ?auto_165597 ?auto_165603 ) ) ( not ( = ?auto_165597 ?auto_165599 ) ) ( not ( = ?auto_165602 ?auto_165600 ) ) ( not ( = ?auto_165602 ?auto_165603 ) ) ( not ( = ?auto_165602 ?auto_165599 ) ) ( not ( = ?auto_165598 ?auto_165600 ) ) ( not ( = ?auto_165598 ?auto_165603 ) ) ( not ( = ?auto_165598 ?auto_165599 ) ) ( ON ?auto_165603 ?auto_165601 ) ( not ( = ?auto_165596 ?auto_165601 ) ) ( not ( = ?auto_165597 ?auto_165601 ) ) ( not ( = ?auto_165602 ?auto_165601 ) ) ( not ( = ?auto_165598 ?auto_165601 ) ) ( not ( = ?auto_165604 ?auto_165601 ) ) ( not ( = ?auto_165603 ?auto_165601 ) ) ( not ( = ?auto_165599 ?auto_165601 ) ) ( not ( = ?auto_165600 ?auto_165601 ) ) ( ON ?auto_165599 ?auto_165603 ) ( ON-TABLE ?auto_165601 ) ( ON ?auto_165600 ?auto_165599 ) ( ON ?auto_165604 ?auto_165600 ) ( ON ?auto_165598 ?auto_165604 ) ( ON ?auto_165602 ?auto_165598 ) ( ON ?auto_165597 ?auto_165602 ) ( ON ?auto_165596 ?auto_165597 ) ( CLEAR ?auto_165596 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_165601 ?auto_165603 ?auto_165599 ?auto_165600 ?auto_165604 ?auto_165598 ?auto_165602 ?auto_165597 )
      ( MAKE-2PILE ?auto_165596 ?auto_165597 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_165611 - BLOCK
      ?auto_165612 - BLOCK
      ?auto_165613 - BLOCK
      ?auto_165614 - BLOCK
      ?auto_165615 - BLOCK
      ?auto_165616 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_165616 ) ( CLEAR ?auto_165615 ) ( ON-TABLE ?auto_165611 ) ( ON ?auto_165612 ?auto_165611 ) ( ON ?auto_165613 ?auto_165612 ) ( ON ?auto_165614 ?auto_165613 ) ( ON ?auto_165615 ?auto_165614 ) ( not ( = ?auto_165611 ?auto_165612 ) ) ( not ( = ?auto_165611 ?auto_165613 ) ) ( not ( = ?auto_165611 ?auto_165614 ) ) ( not ( = ?auto_165611 ?auto_165615 ) ) ( not ( = ?auto_165611 ?auto_165616 ) ) ( not ( = ?auto_165612 ?auto_165613 ) ) ( not ( = ?auto_165612 ?auto_165614 ) ) ( not ( = ?auto_165612 ?auto_165615 ) ) ( not ( = ?auto_165612 ?auto_165616 ) ) ( not ( = ?auto_165613 ?auto_165614 ) ) ( not ( = ?auto_165613 ?auto_165615 ) ) ( not ( = ?auto_165613 ?auto_165616 ) ) ( not ( = ?auto_165614 ?auto_165615 ) ) ( not ( = ?auto_165614 ?auto_165616 ) ) ( not ( = ?auto_165615 ?auto_165616 ) ) )
    :subtasks
    ( ( !STACK ?auto_165616 ?auto_165615 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_165617 - BLOCK
      ?auto_165618 - BLOCK
      ?auto_165619 - BLOCK
      ?auto_165620 - BLOCK
      ?auto_165621 - BLOCK
      ?auto_165622 - BLOCK
    )
    :vars
    (
      ?auto_165623 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_165621 ) ( ON-TABLE ?auto_165617 ) ( ON ?auto_165618 ?auto_165617 ) ( ON ?auto_165619 ?auto_165618 ) ( ON ?auto_165620 ?auto_165619 ) ( ON ?auto_165621 ?auto_165620 ) ( not ( = ?auto_165617 ?auto_165618 ) ) ( not ( = ?auto_165617 ?auto_165619 ) ) ( not ( = ?auto_165617 ?auto_165620 ) ) ( not ( = ?auto_165617 ?auto_165621 ) ) ( not ( = ?auto_165617 ?auto_165622 ) ) ( not ( = ?auto_165618 ?auto_165619 ) ) ( not ( = ?auto_165618 ?auto_165620 ) ) ( not ( = ?auto_165618 ?auto_165621 ) ) ( not ( = ?auto_165618 ?auto_165622 ) ) ( not ( = ?auto_165619 ?auto_165620 ) ) ( not ( = ?auto_165619 ?auto_165621 ) ) ( not ( = ?auto_165619 ?auto_165622 ) ) ( not ( = ?auto_165620 ?auto_165621 ) ) ( not ( = ?auto_165620 ?auto_165622 ) ) ( not ( = ?auto_165621 ?auto_165622 ) ) ( ON ?auto_165622 ?auto_165623 ) ( CLEAR ?auto_165622 ) ( HAND-EMPTY ) ( not ( = ?auto_165617 ?auto_165623 ) ) ( not ( = ?auto_165618 ?auto_165623 ) ) ( not ( = ?auto_165619 ?auto_165623 ) ) ( not ( = ?auto_165620 ?auto_165623 ) ) ( not ( = ?auto_165621 ?auto_165623 ) ) ( not ( = ?auto_165622 ?auto_165623 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_165622 ?auto_165623 )
      ( MAKE-6PILE ?auto_165617 ?auto_165618 ?auto_165619 ?auto_165620 ?auto_165621 ?auto_165622 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_165624 - BLOCK
      ?auto_165625 - BLOCK
      ?auto_165626 - BLOCK
      ?auto_165627 - BLOCK
      ?auto_165628 - BLOCK
      ?auto_165629 - BLOCK
    )
    :vars
    (
      ?auto_165630 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_165624 ) ( ON ?auto_165625 ?auto_165624 ) ( ON ?auto_165626 ?auto_165625 ) ( ON ?auto_165627 ?auto_165626 ) ( not ( = ?auto_165624 ?auto_165625 ) ) ( not ( = ?auto_165624 ?auto_165626 ) ) ( not ( = ?auto_165624 ?auto_165627 ) ) ( not ( = ?auto_165624 ?auto_165628 ) ) ( not ( = ?auto_165624 ?auto_165629 ) ) ( not ( = ?auto_165625 ?auto_165626 ) ) ( not ( = ?auto_165625 ?auto_165627 ) ) ( not ( = ?auto_165625 ?auto_165628 ) ) ( not ( = ?auto_165625 ?auto_165629 ) ) ( not ( = ?auto_165626 ?auto_165627 ) ) ( not ( = ?auto_165626 ?auto_165628 ) ) ( not ( = ?auto_165626 ?auto_165629 ) ) ( not ( = ?auto_165627 ?auto_165628 ) ) ( not ( = ?auto_165627 ?auto_165629 ) ) ( not ( = ?auto_165628 ?auto_165629 ) ) ( ON ?auto_165629 ?auto_165630 ) ( CLEAR ?auto_165629 ) ( not ( = ?auto_165624 ?auto_165630 ) ) ( not ( = ?auto_165625 ?auto_165630 ) ) ( not ( = ?auto_165626 ?auto_165630 ) ) ( not ( = ?auto_165627 ?auto_165630 ) ) ( not ( = ?auto_165628 ?auto_165630 ) ) ( not ( = ?auto_165629 ?auto_165630 ) ) ( HOLDING ?auto_165628 ) ( CLEAR ?auto_165627 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_165624 ?auto_165625 ?auto_165626 ?auto_165627 ?auto_165628 )
      ( MAKE-6PILE ?auto_165624 ?auto_165625 ?auto_165626 ?auto_165627 ?auto_165628 ?auto_165629 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_165631 - BLOCK
      ?auto_165632 - BLOCK
      ?auto_165633 - BLOCK
      ?auto_165634 - BLOCK
      ?auto_165635 - BLOCK
      ?auto_165636 - BLOCK
    )
    :vars
    (
      ?auto_165637 - BLOCK
      ?auto_165638 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_165631 ) ( ON ?auto_165632 ?auto_165631 ) ( ON ?auto_165633 ?auto_165632 ) ( ON ?auto_165634 ?auto_165633 ) ( not ( = ?auto_165631 ?auto_165632 ) ) ( not ( = ?auto_165631 ?auto_165633 ) ) ( not ( = ?auto_165631 ?auto_165634 ) ) ( not ( = ?auto_165631 ?auto_165635 ) ) ( not ( = ?auto_165631 ?auto_165636 ) ) ( not ( = ?auto_165632 ?auto_165633 ) ) ( not ( = ?auto_165632 ?auto_165634 ) ) ( not ( = ?auto_165632 ?auto_165635 ) ) ( not ( = ?auto_165632 ?auto_165636 ) ) ( not ( = ?auto_165633 ?auto_165634 ) ) ( not ( = ?auto_165633 ?auto_165635 ) ) ( not ( = ?auto_165633 ?auto_165636 ) ) ( not ( = ?auto_165634 ?auto_165635 ) ) ( not ( = ?auto_165634 ?auto_165636 ) ) ( not ( = ?auto_165635 ?auto_165636 ) ) ( ON ?auto_165636 ?auto_165637 ) ( not ( = ?auto_165631 ?auto_165637 ) ) ( not ( = ?auto_165632 ?auto_165637 ) ) ( not ( = ?auto_165633 ?auto_165637 ) ) ( not ( = ?auto_165634 ?auto_165637 ) ) ( not ( = ?auto_165635 ?auto_165637 ) ) ( not ( = ?auto_165636 ?auto_165637 ) ) ( CLEAR ?auto_165634 ) ( ON ?auto_165635 ?auto_165636 ) ( CLEAR ?auto_165635 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_165638 ) ( ON ?auto_165637 ?auto_165638 ) ( not ( = ?auto_165638 ?auto_165637 ) ) ( not ( = ?auto_165638 ?auto_165636 ) ) ( not ( = ?auto_165638 ?auto_165635 ) ) ( not ( = ?auto_165631 ?auto_165638 ) ) ( not ( = ?auto_165632 ?auto_165638 ) ) ( not ( = ?auto_165633 ?auto_165638 ) ) ( not ( = ?auto_165634 ?auto_165638 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_165638 ?auto_165637 ?auto_165636 )
      ( MAKE-6PILE ?auto_165631 ?auto_165632 ?auto_165633 ?auto_165634 ?auto_165635 ?auto_165636 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_165639 - BLOCK
      ?auto_165640 - BLOCK
      ?auto_165641 - BLOCK
      ?auto_165642 - BLOCK
      ?auto_165643 - BLOCK
      ?auto_165644 - BLOCK
    )
    :vars
    (
      ?auto_165646 - BLOCK
      ?auto_165645 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_165639 ) ( ON ?auto_165640 ?auto_165639 ) ( ON ?auto_165641 ?auto_165640 ) ( not ( = ?auto_165639 ?auto_165640 ) ) ( not ( = ?auto_165639 ?auto_165641 ) ) ( not ( = ?auto_165639 ?auto_165642 ) ) ( not ( = ?auto_165639 ?auto_165643 ) ) ( not ( = ?auto_165639 ?auto_165644 ) ) ( not ( = ?auto_165640 ?auto_165641 ) ) ( not ( = ?auto_165640 ?auto_165642 ) ) ( not ( = ?auto_165640 ?auto_165643 ) ) ( not ( = ?auto_165640 ?auto_165644 ) ) ( not ( = ?auto_165641 ?auto_165642 ) ) ( not ( = ?auto_165641 ?auto_165643 ) ) ( not ( = ?auto_165641 ?auto_165644 ) ) ( not ( = ?auto_165642 ?auto_165643 ) ) ( not ( = ?auto_165642 ?auto_165644 ) ) ( not ( = ?auto_165643 ?auto_165644 ) ) ( ON ?auto_165644 ?auto_165646 ) ( not ( = ?auto_165639 ?auto_165646 ) ) ( not ( = ?auto_165640 ?auto_165646 ) ) ( not ( = ?auto_165641 ?auto_165646 ) ) ( not ( = ?auto_165642 ?auto_165646 ) ) ( not ( = ?auto_165643 ?auto_165646 ) ) ( not ( = ?auto_165644 ?auto_165646 ) ) ( ON ?auto_165643 ?auto_165644 ) ( CLEAR ?auto_165643 ) ( ON-TABLE ?auto_165645 ) ( ON ?auto_165646 ?auto_165645 ) ( not ( = ?auto_165645 ?auto_165646 ) ) ( not ( = ?auto_165645 ?auto_165644 ) ) ( not ( = ?auto_165645 ?auto_165643 ) ) ( not ( = ?auto_165639 ?auto_165645 ) ) ( not ( = ?auto_165640 ?auto_165645 ) ) ( not ( = ?auto_165641 ?auto_165645 ) ) ( not ( = ?auto_165642 ?auto_165645 ) ) ( HOLDING ?auto_165642 ) ( CLEAR ?auto_165641 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_165639 ?auto_165640 ?auto_165641 ?auto_165642 )
      ( MAKE-6PILE ?auto_165639 ?auto_165640 ?auto_165641 ?auto_165642 ?auto_165643 ?auto_165644 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_165647 - BLOCK
      ?auto_165648 - BLOCK
      ?auto_165649 - BLOCK
      ?auto_165650 - BLOCK
      ?auto_165651 - BLOCK
      ?auto_165652 - BLOCK
    )
    :vars
    (
      ?auto_165654 - BLOCK
      ?auto_165653 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_165647 ) ( ON ?auto_165648 ?auto_165647 ) ( ON ?auto_165649 ?auto_165648 ) ( not ( = ?auto_165647 ?auto_165648 ) ) ( not ( = ?auto_165647 ?auto_165649 ) ) ( not ( = ?auto_165647 ?auto_165650 ) ) ( not ( = ?auto_165647 ?auto_165651 ) ) ( not ( = ?auto_165647 ?auto_165652 ) ) ( not ( = ?auto_165648 ?auto_165649 ) ) ( not ( = ?auto_165648 ?auto_165650 ) ) ( not ( = ?auto_165648 ?auto_165651 ) ) ( not ( = ?auto_165648 ?auto_165652 ) ) ( not ( = ?auto_165649 ?auto_165650 ) ) ( not ( = ?auto_165649 ?auto_165651 ) ) ( not ( = ?auto_165649 ?auto_165652 ) ) ( not ( = ?auto_165650 ?auto_165651 ) ) ( not ( = ?auto_165650 ?auto_165652 ) ) ( not ( = ?auto_165651 ?auto_165652 ) ) ( ON ?auto_165652 ?auto_165654 ) ( not ( = ?auto_165647 ?auto_165654 ) ) ( not ( = ?auto_165648 ?auto_165654 ) ) ( not ( = ?auto_165649 ?auto_165654 ) ) ( not ( = ?auto_165650 ?auto_165654 ) ) ( not ( = ?auto_165651 ?auto_165654 ) ) ( not ( = ?auto_165652 ?auto_165654 ) ) ( ON ?auto_165651 ?auto_165652 ) ( ON-TABLE ?auto_165653 ) ( ON ?auto_165654 ?auto_165653 ) ( not ( = ?auto_165653 ?auto_165654 ) ) ( not ( = ?auto_165653 ?auto_165652 ) ) ( not ( = ?auto_165653 ?auto_165651 ) ) ( not ( = ?auto_165647 ?auto_165653 ) ) ( not ( = ?auto_165648 ?auto_165653 ) ) ( not ( = ?auto_165649 ?auto_165653 ) ) ( not ( = ?auto_165650 ?auto_165653 ) ) ( CLEAR ?auto_165649 ) ( ON ?auto_165650 ?auto_165651 ) ( CLEAR ?auto_165650 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_165653 ?auto_165654 ?auto_165652 ?auto_165651 )
      ( MAKE-6PILE ?auto_165647 ?auto_165648 ?auto_165649 ?auto_165650 ?auto_165651 ?auto_165652 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_165655 - BLOCK
      ?auto_165656 - BLOCK
      ?auto_165657 - BLOCK
      ?auto_165658 - BLOCK
      ?auto_165659 - BLOCK
      ?auto_165660 - BLOCK
    )
    :vars
    (
      ?auto_165662 - BLOCK
      ?auto_165661 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_165655 ) ( ON ?auto_165656 ?auto_165655 ) ( not ( = ?auto_165655 ?auto_165656 ) ) ( not ( = ?auto_165655 ?auto_165657 ) ) ( not ( = ?auto_165655 ?auto_165658 ) ) ( not ( = ?auto_165655 ?auto_165659 ) ) ( not ( = ?auto_165655 ?auto_165660 ) ) ( not ( = ?auto_165656 ?auto_165657 ) ) ( not ( = ?auto_165656 ?auto_165658 ) ) ( not ( = ?auto_165656 ?auto_165659 ) ) ( not ( = ?auto_165656 ?auto_165660 ) ) ( not ( = ?auto_165657 ?auto_165658 ) ) ( not ( = ?auto_165657 ?auto_165659 ) ) ( not ( = ?auto_165657 ?auto_165660 ) ) ( not ( = ?auto_165658 ?auto_165659 ) ) ( not ( = ?auto_165658 ?auto_165660 ) ) ( not ( = ?auto_165659 ?auto_165660 ) ) ( ON ?auto_165660 ?auto_165662 ) ( not ( = ?auto_165655 ?auto_165662 ) ) ( not ( = ?auto_165656 ?auto_165662 ) ) ( not ( = ?auto_165657 ?auto_165662 ) ) ( not ( = ?auto_165658 ?auto_165662 ) ) ( not ( = ?auto_165659 ?auto_165662 ) ) ( not ( = ?auto_165660 ?auto_165662 ) ) ( ON ?auto_165659 ?auto_165660 ) ( ON-TABLE ?auto_165661 ) ( ON ?auto_165662 ?auto_165661 ) ( not ( = ?auto_165661 ?auto_165662 ) ) ( not ( = ?auto_165661 ?auto_165660 ) ) ( not ( = ?auto_165661 ?auto_165659 ) ) ( not ( = ?auto_165655 ?auto_165661 ) ) ( not ( = ?auto_165656 ?auto_165661 ) ) ( not ( = ?auto_165657 ?auto_165661 ) ) ( not ( = ?auto_165658 ?auto_165661 ) ) ( ON ?auto_165658 ?auto_165659 ) ( CLEAR ?auto_165658 ) ( HOLDING ?auto_165657 ) ( CLEAR ?auto_165656 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_165655 ?auto_165656 ?auto_165657 )
      ( MAKE-6PILE ?auto_165655 ?auto_165656 ?auto_165657 ?auto_165658 ?auto_165659 ?auto_165660 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_165663 - BLOCK
      ?auto_165664 - BLOCK
      ?auto_165665 - BLOCK
      ?auto_165666 - BLOCK
      ?auto_165667 - BLOCK
      ?auto_165668 - BLOCK
    )
    :vars
    (
      ?auto_165669 - BLOCK
      ?auto_165670 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_165663 ) ( ON ?auto_165664 ?auto_165663 ) ( not ( = ?auto_165663 ?auto_165664 ) ) ( not ( = ?auto_165663 ?auto_165665 ) ) ( not ( = ?auto_165663 ?auto_165666 ) ) ( not ( = ?auto_165663 ?auto_165667 ) ) ( not ( = ?auto_165663 ?auto_165668 ) ) ( not ( = ?auto_165664 ?auto_165665 ) ) ( not ( = ?auto_165664 ?auto_165666 ) ) ( not ( = ?auto_165664 ?auto_165667 ) ) ( not ( = ?auto_165664 ?auto_165668 ) ) ( not ( = ?auto_165665 ?auto_165666 ) ) ( not ( = ?auto_165665 ?auto_165667 ) ) ( not ( = ?auto_165665 ?auto_165668 ) ) ( not ( = ?auto_165666 ?auto_165667 ) ) ( not ( = ?auto_165666 ?auto_165668 ) ) ( not ( = ?auto_165667 ?auto_165668 ) ) ( ON ?auto_165668 ?auto_165669 ) ( not ( = ?auto_165663 ?auto_165669 ) ) ( not ( = ?auto_165664 ?auto_165669 ) ) ( not ( = ?auto_165665 ?auto_165669 ) ) ( not ( = ?auto_165666 ?auto_165669 ) ) ( not ( = ?auto_165667 ?auto_165669 ) ) ( not ( = ?auto_165668 ?auto_165669 ) ) ( ON ?auto_165667 ?auto_165668 ) ( ON-TABLE ?auto_165670 ) ( ON ?auto_165669 ?auto_165670 ) ( not ( = ?auto_165670 ?auto_165669 ) ) ( not ( = ?auto_165670 ?auto_165668 ) ) ( not ( = ?auto_165670 ?auto_165667 ) ) ( not ( = ?auto_165663 ?auto_165670 ) ) ( not ( = ?auto_165664 ?auto_165670 ) ) ( not ( = ?auto_165665 ?auto_165670 ) ) ( not ( = ?auto_165666 ?auto_165670 ) ) ( ON ?auto_165666 ?auto_165667 ) ( CLEAR ?auto_165664 ) ( ON ?auto_165665 ?auto_165666 ) ( CLEAR ?auto_165665 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_165670 ?auto_165669 ?auto_165668 ?auto_165667 ?auto_165666 )
      ( MAKE-6PILE ?auto_165663 ?auto_165664 ?auto_165665 ?auto_165666 ?auto_165667 ?auto_165668 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_165671 - BLOCK
      ?auto_165672 - BLOCK
      ?auto_165673 - BLOCK
      ?auto_165674 - BLOCK
      ?auto_165675 - BLOCK
      ?auto_165676 - BLOCK
    )
    :vars
    (
      ?auto_165677 - BLOCK
      ?auto_165678 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_165671 ) ( not ( = ?auto_165671 ?auto_165672 ) ) ( not ( = ?auto_165671 ?auto_165673 ) ) ( not ( = ?auto_165671 ?auto_165674 ) ) ( not ( = ?auto_165671 ?auto_165675 ) ) ( not ( = ?auto_165671 ?auto_165676 ) ) ( not ( = ?auto_165672 ?auto_165673 ) ) ( not ( = ?auto_165672 ?auto_165674 ) ) ( not ( = ?auto_165672 ?auto_165675 ) ) ( not ( = ?auto_165672 ?auto_165676 ) ) ( not ( = ?auto_165673 ?auto_165674 ) ) ( not ( = ?auto_165673 ?auto_165675 ) ) ( not ( = ?auto_165673 ?auto_165676 ) ) ( not ( = ?auto_165674 ?auto_165675 ) ) ( not ( = ?auto_165674 ?auto_165676 ) ) ( not ( = ?auto_165675 ?auto_165676 ) ) ( ON ?auto_165676 ?auto_165677 ) ( not ( = ?auto_165671 ?auto_165677 ) ) ( not ( = ?auto_165672 ?auto_165677 ) ) ( not ( = ?auto_165673 ?auto_165677 ) ) ( not ( = ?auto_165674 ?auto_165677 ) ) ( not ( = ?auto_165675 ?auto_165677 ) ) ( not ( = ?auto_165676 ?auto_165677 ) ) ( ON ?auto_165675 ?auto_165676 ) ( ON-TABLE ?auto_165678 ) ( ON ?auto_165677 ?auto_165678 ) ( not ( = ?auto_165678 ?auto_165677 ) ) ( not ( = ?auto_165678 ?auto_165676 ) ) ( not ( = ?auto_165678 ?auto_165675 ) ) ( not ( = ?auto_165671 ?auto_165678 ) ) ( not ( = ?auto_165672 ?auto_165678 ) ) ( not ( = ?auto_165673 ?auto_165678 ) ) ( not ( = ?auto_165674 ?auto_165678 ) ) ( ON ?auto_165674 ?auto_165675 ) ( ON ?auto_165673 ?auto_165674 ) ( CLEAR ?auto_165673 ) ( HOLDING ?auto_165672 ) ( CLEAR ?auto_165671 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_165671 ?auto_165672 )
      ( MAKE-6PILE ?auto_165671 ?auto_165672 ?auto_165673 ?auto_165674 ?auto_165675 ?auto_165676 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_165679 - BLOCK
      ?auto_165680 - BLOCK
      ?auto_165681 - BLOCK
      ?auto_165682 - BLOCK
      ?auto_165683 - BLOCK
      ?auto_165684 - BLOCK
    )
    :vars
    (
      ?auto_165686 - BLOCK
      ?auto_165685 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_165679 ) ( not ( = ?auto_165679 ?auto_165680 ) ) ( not ( = ?auto_165679 ?auto_165681 ) ) ( not ( = ?auto_165679 ?auto_165682 ) ) ( not ( = ?auto_165679 ?auto_165683 ) ) ( not ( = ?auto_165679 ?auto_165684 ) ) ( not ( = ?auto_165680 ?auto_165681 ) ) ( not ( = ?auto_165680 ?auto_165682 ) ) ( not ( = ?auto_165680 ?auto_165683 ) ) ( not ( = ?auto_165680 ?auto_165684 ) ) ( not ( = ?auto_165681 ?auto_165682 ) ) ( not ( = ?auto_165681 ?auto_165683 ) ) ( not ( = ?auto_165681 ?auto_165684 ) ) ( not ( = ?auto_165682 ?auto_165683 ) ) ( not ( = ?auto_165682 ?auto_165684 ) ) ( not ( = ?auto_165683 ?auto_165684 ) ) ( ON ?auto_165684 ?auto_165686 ) ( not ( = ?auto_165679 ?auto_165686 ) ) ( not ( = ?auto_165680 ?auto_165686 ) ) ( not ( = ?auto_165681 ?auto_165686 ) ) ( not ( = ?auto_165682 ?auto_165686 ) ) ( not ( = ?auto_165683 ?auto_165686 ) ) ( not ( = ?auto_165684 ?auto_165686 ) ) ( ON ?auto_165683 ?auto_165684 ) ( ON-TABLE ?auto_165685 ) ( ON ?auto_165686 ?auto_165685 ) ( not ( = ?auto_165685 ?auto_165686 ) ) ( not ( = ?auto_165685 ?auto_165684 ) ) ( not ( = ?auto_165685 ?auto_165683 ) ) ( not ( = ?auto_165679 ?auto_165685 ) ) ( not ( = ?auto_165680 ?auto_165685 ) ) ( not ( = ?auto_165681 ?auto_165685 ) ) ( not ( = ?auto_165682 ?auto_165685 ) ) ( ON ?auto_165682 ?auto_165683 ) ( ON ?auto_165681 ?auto_165682 ) ( CLEAR ?auto_165679 ) ( ON ?auto_165680 ?auto_165681 ) ( CLEAR ?auto_165680 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_165685 ?auto_165686 ?auto_165684 ?auto_165683 ?auto_165682 ?auto_165681 )
      ( MAKE-6PILE ?auto_165679 ?auto_165680 ?auto_165681 ?auto_165682 ?auto_165683 ?auto_165684 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_165687 - BLOCK
      ?auto_165688 - BLOCK
      ?auto_165689 - BLOCK
      ?auto_165690 - BLOCK
      ?auto_165691 - BLOCK
      ?auto_165692 - BLOCK
    )
    :vars
    (
      ?auto_165694 - BLOCK
      ?auto_165693 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_165687 ?auto_165688 ) ) ( not ( = ?auto_165687 ?auto_165689 ) ) ( not ( = ?auto_165687 ?auto_165690 ) ) ( not ( = ?auto_165687 ?auto_165691 ) ) ( not ( = ?auto_165687 ?auto_165692 ) ) ( not ( = ?auto_165688 ?auto_165689 ) ) ( not ( = ?auto_165688 ?auto_165690 ) ) ( not ( = ?auto_165688 ?auto_165691 ) ) ( not ( = ?auto_165688 ?auto_165692 ) ) ( not ( = ?auto_165689 ?auto_165690 ) ) ( not ( = ?auto_165689 ?auto_165691 ) ) ( not ( = ?auto_165689 ?auto_165692 ) ) ( not ( = ?auto_165690 ?auto_165691 ) ) ( not ( = ?auto_165690 ?auto_165692 ) ) ( not ( = ?auto_165691 ?auto_165692 ) ) ( ON ?auto_165692 ?auto_165694 ) ( not ( = ?auto_165687 ?auto_165694 ) ) ( not ( = ?auto_165688 ?auto_165694 ) ) ( not ( = ?auto_165689 ?auto_165694 ) ) ( not ( = ?auto_165690 ?auto_165694 ) ) ( not ( = ?auto_165691 ?auto_165694 ) ) ( not ( = ?auto_165692 ?auto_165694 ) ) ( ON ?auto_165691 ?auto_165692 ) ( ON-TABLE ?auto_165693 ) ( ON ?auto_165694 ?auto_165693 ) ( not ( = ?auto_165693 ?auto_165694 ) ) ( not ( = ?auto_165693 ?auto_165692 ) ) ( not ( = ?auto_165693 ?auto_165691 ) ) ( not ( = ?auto_165687 ?auto_165693 ) ) ( not ( = ?auto_165688 ?auto_165693 ) ) ( not ( = ?auto_165689 ?auto_165693 ) ) ( not ( = ?auto_165690 ?auto_165693 ) ) ( ON ?auto_165690 ?auto_165691 ) ( ON ?auto_165689 ?auto_165690 ) ( ON ?auto_165688 ?auto_165689 ) ( CLEAR ?auto_165688 ) ( HOLDING ?auto_165687 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_165687 )
      ( MAKE-6PILE ?auto_165687 ?auto_165688 ?auto_165689 ?auto_165690 ?auto_165691 ?auto_165692 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_165695 - BLOCK
      ?auto_165696 - BLOCK
      ?auto_165697 - BLOCK
      ?auto_165698 - BLOCK
      ?auto_165699 - BLOCK
      ?auto_165700 - BLOCK
    )
    :vars
    (
      ?auto_165701 - BLOCK
      ?auto_165702 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_165695 ?auto_165696 ) ) ( not ( = ?auto_165695 ?auto_165697 ) ) ( not ( = ?auto_165695 ?auto_165698 ) ) ( not ( = ?auto_165695 ?auto_165699 ) ) ( not ( = ?auto_165695 ?auto_165700 ) ) ( not ( = ?auto_165696 ?auto_165697 ) ) ( not ( = ?auto_165696 ?auto_165698 ) ) ( not ( = ?auto_165696 ?auto_165699 ) ) ( not ( = ?auto_165696 ?auto_165700 ) ) ( not ( = ?auto_165697 ?auto_165698 ) ) ( not ( = ?auto_165697 ?auto_165699 ) ) ( not ( = ?auto_165697 ?auto_165700 ) ) ( not ( = ?auto_165698 ?auto_165699 ) ) ( not ( = ?auto_165698 ?auto_165700 ) ) ( not ( = ?auto_165699 ?auto_165700 ) ) ( ON ?auto_165700 ?auto_165701 ) ( not ( = ?auto_165695 ?auto_165701 ) ) ( not ( = ?auto_165696 ?auto_165701 ) ) ( not ( = ?auto_165697 ?auto_165701 ) ) ( not ( = ?auto_165698 ?auto_165701 ) ) ( not ( = ?auto_165699 ?auto_165701 ) ) ( not ( = ?auto_165700 ?auto_165701 ) ) ( ON ?auto_165699 ?auto_165700 ) ( ON-TABLE ?auto_165702 ) ( ON ?auto_165701 ?auto_165702 ) ( not ( = ?auto_165702 ?auto_165701 ) ) ( not ( = ?auto_165702 ?auto_165700 ) ) ( not ( = ?auto_165702 ?auto_165699 ) ) ( not ( = ?auto_165695 ?auto_165702 ) ) ( not ( = ?auto_165696 ?auto_165702 ) ) ( not ( = ?auto_165697 ?auto_165702 ) ) ( not ( = ?auto_165698 ?auto_165702 ) ) ( ON ?auto_165698 ?auto_165699 ) ( ON ?auto_165697 ?auto_165698 ) ( ON ?auto_165696 ?auto_165697 ) ( ON ?auto_165695 ?auto_165696 ) ( CLEAR ?auto_165695 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_165702 ?auto_165701 ?auto_165700 ?auto_165699 ?auto_165698 ?auto_165697 ?auto_165696 )
      ( MAKE-6PILE ?auto_165695 ?auto_165696 ?auto_165697 ?auto_165698 ?auto_165699 ?auto_165700 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_165703 - BLOCK
      ?auto_165704 - BLOCK
      ?auto_165705 - BLOCK
      ?auto_165706 - BLOCK
      ?auto_165707 - BLOCK
      ?auto_165708 - BLOCK
    )
    :vars
    (
      ?auto_165709 - BLOCK
      ?auto_165710 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_165703 ?auto_165704 ) ) ( not ( = ?auto_165703 ?auto_165705 ) ) ( not ( = ?auto_165703 ?auto_165706 ) ) ( not ( = ?auto_165703 ?auto_165707 ) ) ( not ( = ?auto_165703 ?auto_165708 ) ) ( not ( = ?auto_165704 ?auto_165705 ) ) ( not ( = ?auto_165704 ?auto_165706 ) ) ( not ( = ?auto_165704 ?auto_165707 ) ) ( not ( = ?auto_165704 ?auto_165708 ) ) ( not ( = ?auto_165705 ?auto_165706 ) ) ( not ( = ?auto_165705 ?auto_165707 ) ) ( not ( = ?auto_165705 ?auto_165708 ) ) ( not ( = ?auto_165706 ?auto_165707 ) ) ( not ( = ?auto_165706 ?auto_165708 ) ) ( not ( = ?auto_165707 ?auto_165708 ) ) ( ON ?auto_165708 ?auto_165709 ) ( not ( = ?auto_165703 ?auto_165709 ) ) ( not ( = ?auto_165704 ?auto_165709 ) ) ( not ( = ?auto_165705 ?auto_165709 ) ) ( not ( = ?auto_165706 ?auto_165709 ) ) ( not ( = ?auto_165707 ?auto_165709 ) ) ( not ( = ?auto_165708 ?auto_165709 ) ) ( ON ?auto_165707 ?auto_165708 ) ( ON-TABLE ?auto_165710 ) ( ON ?auto_165709 ?auto_165710 ) ( not ( = ?auto_165710 ?auto_165709 ) ) ( not ( = ?auto_165710 ?auto_165708 ) ) ( not ( = ?auto_165710 ?auto_165707 ) ) ( not ( = ?auto_165703 ?auto_165710 ) ) ( not ( = ?auto_165704 ?auto_165710 ) ) ( not ( = ?auto_165705 ?auto_165710 ) ) ( not ( = ?auto_165706 ?auto_165710 ) ) ( ON ?auto_165706 ?auto_165707 ) ( ON ?auto_165705 ?auto_165706 ) ( ON ?auto_165704 ?auto_165705 ) ( HOLDING ?auto_165703 ) ( CLEAR ?auto_165704 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_165710 ?auto_165709 ?auto_165708 ?auto_165707 ?auto_165706 ?auto_165705 ?auto_165704 ?auto_165703 )
      ( MAKE-6PILE ?auto_165703 ?auto_165704 ?auto_165705 ?auto_165706 ?auto_165707 ?auto_165708 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_165711 - BLOCK
      ?auto_165712 - BLOCK
      ?auto_165713 - BLOCK
      ?auto_165714 - BLOCK
      ?auto_165715 - BLOCK
      ?auto_165716 - BLOCK
    )
    :vars
    (
      ?auto_165717 - BLOCK
      ?auto_165718 - BLOCK
      ?auto_165719 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_165711 ?auto_165712 ) ) ( not ( = ?auto_165711 ?auto_165713 ) ) ( not ( = ?auto_165711 ?auto_165714 ) ) ( not ( = ?auto_165711 ?auto_165715 ) ) ( not ( = ?auto_165711 ?auto_165716 ) ) ( not ( = ?auto_165712 ?auto_165713 ) ) ( not ( = ?auto_165712 ?auto_165714 ) ) ( not ( = ?auto_165712 ?auto_165715 ) ) ( not ( = ?auto_165712 ?auto_165716 ) ) ( not ( = ?auto_165713 ?auto_165714 ) ) ( not ( = ?auto_165713 ?auto_165715 ) ) ( not ( = ?auto_165713 ?auto_165716 ) ) ( not ( = ?auto_165714 ?auto_165715 ) ) ( not ( = ?auto_165714 ?auto_165716 ) ) ( not ( = ?auto_165715 ?auto_165716 ) ) ( ON ?auto_165716 ?auto_165717 ) ( not ( = ?auto_165711 ?auto_165717 ) ) ( not ( = ?auto_165712 ?auto_165717 ) ) ( not ( = ?auto_165713 ?auto_165717 ) ) ( not ( = ?auto_165714 ?auto_165717 ) ) ( not ( = ?auto_165715 ?auto_165717 ) ) ( not ( = ?auto_165716 ?auto_165717 ) ) ( ON ?auto_165715 ?auto_165716 ) ( ON-TABLE ?auto_165718 ) ( ON ?auto_165717 ?auto_165718 ) ( not ( = ?auto_165718 ?auto_165717 ) ) ( not ( = ?auto_165718 ?auto_165716 ) ) ( not ( = ?auto_165718 ?auto_165715 ) ) ( not ( = ?auto_165711 ?auto_165718 ) ) ( not ( = ?auto_165712 ?auto_165718 ) ) ( not ( = ?auto_165713 ?auto_165718 ) ) ( not ( = ?auto_165714 ?auto_165718 ) ) ( ON ?auto_165714 ?auto_165715 ) ( ON ?auto_165713 ?auto_165714 ) ( ON ?auto_165712 ?auto_165713 ) ( CLEAR ?auto_165712 ) ( ON ?auto_165711 ?auto_165719 ) ( CLEAR ?auto_165711 ) ( HAND-EMPTY ) ( not ( = ?auto_165711 ?auto_165719 ) ) ( not ( = ?auto_165712 ?auto_165719 ) ) ( not ( = ?auto_165713 ?auto_165719 ) ) ( not ( = ?auto_165714 ?auto_165719 ) ) ( not ( = ?auto_165715 ?auto_165719 ) ) ( not ( = ?auto_165716 ?auto_165719 ) ) ( not ( = ?auto_165717 ?auto_165719 ) ) ( not ( = ?auto_165718 ?auto_165719 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_165711 ?auto_165719 )
      ( MAKE-6PILE ?auto_165711 ?auto_165712 ?auto_165713 ?auto_165714 ?auto_165715 ?auto_165716 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_165720 - BLOCK
      ?auto_165721 - BLOCK
      ?auto_165722 - BLOCK
      ?auto_165723 - BLOCK
      ?auto_165724 - BLOCK
      ?auto_165725 - BLOCK
    )
    :vars
    (
      ?auto_165727 - BLOCK
      ?auto_165726 - BLOCK
      ?auto_165728 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_165720 ?auto_165721 ) ) ( not ( = ?auto_165720 ?auto_165722 ) ) ( not ( = ?auto_165720 ?auto_165723 ) ) ( not ( = ?auto_165720 ?auto_165724 ) ) ( not ( = ?auto_165720 ?auto_165725 ) ) ( not ( = ?auto_165721 ?auto_165722 ) ) ( not ( = ?auto_165721 ?auto_165723 ) ) ( not ( = ?auto_165721 ?auto_165724 ) ) ( not ( = ?auto_165721 ?auto_165725 ) ) ( not ( = ?auto_165722 ?auto_165723 ) ) ( not ( = ?auto_165722 ?auto_165724 ) ) ( not ( = ?auto_165722 ?auto_165725 ) ) ( not ( = ?auto_165723 ?auto_165724 ) ) ( not ( = ?auto_165723 ?auto_165725 ) ) ( not ( = ?auto_165724 ?auto_165725 ) ) ( ON ?auto_165725 ?auto_165727 ) ( not ( = ?auto_165720 ?auto_165727 ) ) ( not ( = ?auto_165721 ?auto_165727 ) ) ( not ( = ?auto_165722 ?auto_165727 ) ) ( not ( = ?auto_165723 ?auto_165727 ) ) ( not ( = ?auto_165724 ?auto_165727 ) ) ( not ( = ?auto_165725 ?auto_165727 ) ) ( ON ?auto_165724 ?auto_165725 ) ( ON-TABLE ?auto_165726 ) ( ON ?auto_165727 ?auto_165726 ) ( not ( = ?auto_165726 ?auto_165727 ) ) ( not ( = ?auto_165726 ?auto_165725 ) ) ( not ( = ?auto_165726 ?auto_165724 ) ) ( not ( = ?auto_165720 ?auto_165726 ) ) ( not ( = ?auto_165721 ?auto_165726 ) ) ( not ( = ?auto_165722 ?auto_165726 ) ) ( not ( = ?auto_165723 ?auto_165726 ) ) ( ON ?auto_165723 ?auto_165724 ) ( ON ?auto_165722 ?auto_165723 ) ( ON ?auto_165720 ?auto_165728 ) ( CLEAR ?auto_165720 ) ( not ( = ?auto_165720 ?auto_165728 ) ) ( not ( = ?auto_165721 ?auto_165728 ) ) ( not ( = ?auto_165722 ?auto_165728 ) ) ( not ( = ?auto_165723 ?auto_165728 ) ) ( not ( = ?auto_165724 ?auto_165728 ) ) ( not ( = ?auto_165725 ?auto_165728 ) ) ( not ( = ?auto_165727 ?auto_165728 ) ) ( not ( = ?auto_165726 ?auto_165728 ) ) ( HOLDING ?auto_165721 ) ( CLEAR ?auto_165722 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_165726 ?auto_165727 ?auto_165725 ?auto_165724 ?auto_165723 ?auto_165722 ?auto_165721 )
      ( MAKE-6PILE ?auto_165720 ?auto_165721 ?auto_165722 ?auto_165723 ?auto_165724 ?auto_165725 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_165729 - BLOCK
      ?auto_165730 - BLOCK
      ?auto_165731 - BLOCK
      ?auto_165732 - BLOCK
      ?auto_165733 - BLOCK
      ?auto_165734 - BLOCK
    )
    :vars
    (
      ?auto_165737 - BLOCK
      ?auto_165735 - BLOCK
      ?auto_165736 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_165729 ?auto_165730 ) ) ( not ( = ?auto_165729 ?auto_165731 ) ) ( not ( = ?auto_165729 ?auto_165732 ) ) ( not ( = ?auto_165729 ?auto_165733 ) ) ( not ( = ?auto_165729 ?auto_165734 ) ) ( not ( = ?auto_165730 ?auto_165731 ) ) ( not ( = ?auto_165730 ?auto_165732 ) ) ( not ( = ?auto_165730 ?auto_165733 ) ) ( not ( = ?auto_165730 ?auto_165734 ) ) ( not ( = ?auto_165731 ?auto_165732 ) ) ( not ( = ?auto_165731 ?auto_165733 ) ) ( not ( = ?auto_165731 ?auto_165734 ) ) ( not ( = ?auto_165732 ?auto_165733 ) ) ( not ( = ?auto_165732 ?auto_165734 ) ) ( not ( = ?auto_165733 ?auto_165734 ) ) ( ON ?auto_165734 ?auto_165737 ) ( not ( = ?auto_165729 ?auto_165737 ) ) ( not ( = ?auto_165730 ?auto_165737 ) ) ( not ( = ?auto_165731 ?auto_165737 ) ) ( not ( = ?auto_165732 ?auto_165737 ) ) ( not ( = ?auto_165733 ?auto_165737 ) ) ( not ( = ?auto_165734 ?auto_165737 ) ) ( ON ?auto_165733 ?auto_165734 ) ( ON-TABLE ?auto_165735 ) ( ON ?auto_165737 ?auto_165735 ) ( not ( = ?auto_165735 ?auto_165737 ) ) ( not ( = ?auto_165735 ?auto_165734 ) ) ( not ( = ?auto_165735 ?auto_165733 ) ) ( not ( = ?auto_165729 ?auto_165735 ) ) ( not ( = ?auto_165730 ?auto_165735 ) ) ( not ( = ?auto_165731 ?auto_165735 ) ) ( not ( = ?auto_165732 ?auto_165735 ) ) ( ON ?auto_165732 ?auto_165733 ) ( ON ?auto_165731 ?auto_165732 ) ( ON ?auto_165729 ?auto_165736 ) ( not ( = ?auto_165729 ?auto_165736 ) ) ( not ( = ?auto_165730 ?auto_165736 ) ) ( not ( = ?auto_165731 ?auto_165736 ) ) ( not ( = ?auto_165732 ?auto_165736 ) ) ( not ( = ?auto_165733 ?auto_165736 ) ) ( not ( = ?auto_165734 ?auto_165736 ) ) ( not ( = ?auto_165737 ?auto_165736 ) ) ( not ( = ?auto_165735 ?auto_165736 ) ) ( CLEAR ?auto_165731 ) ( ON ?auto_165730 ?auto_165729 ) ( CLEAR ?auto_165730 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_165736 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_165736 ?auto_165729 )
      ( MAKE-6PILE ?auto_165729 ?auto_165730 ?auto_165731 ?auto_165732 ?auto_165733 ?auto_165734 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_165738 - BLOCK
      ?auto_165739 - BLOCK
      ?auto_165740 - BLOCK
      ?auto_165741 - BLOCK
      ?auto_165742 - BLOCK
      ?auto_165743 - BLOCK
    )
    :vars
    (
      ?auto_165744 - BLOCK
      ?auto_165745 - BLOCK
      ?auto_165746 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_165738 ?auto_165739 ) ) ( not ( = ?auto_165738 ?auto_165740 ) ) ( not ( = ?auto_165738 ?auto_165741 ) ) ( not ( = ?auto_165738 ?auto_165742 ) ) ( not ( = ?auto_165738 ?auto_165743 ) ) ( not ( = ?auto_165739 ?auto_165740 ) ) ( not ( = ?auto_165739 ?auto_165741 ) ) ( not ( = ?auto_165739 ?auto_165742 ) ) ( not ( = ?auto_165739 ?auto_165743 ) ) ( not ( = ?auto_165740 ?auto_165741 ) ) ( not ( = ?auto_165740 ?auto_165742 ) ) ( not ( = ?auto_165740 ?auto_165743 ) ) ( not ( = ?auto_165741 ?auto_165742 ) ) ( not ( = ?auto_165741 ?auto_165743 ) ) ( not ( = ?auto_165742 ?auto_165743 ) ) ( ON ?auto_165743 ?auto_165744 ) ( not ( = ?auto_165738 ?auto_165744 ) ) ( not ( = ?auto_165739 ?auto_165744 ) ) ( not ( = ?auto_165740 ?auto_165744 ) ) ( not ( = ?auto_165741 ?auto_165744 ) ) ( not ( = ?auto_165742 ?auto_165744 ) ) ( not ( = ?auto_165743 ?auto_165744 ) ) ( ON ?auto_165742 ?auto_165743 ) ( ON-TABLE ?auto_165745 ) ( ON ?auto_165744 ?auto_165745 ) ( not ( = ?auto_165745 ?auto_165744 ) ) ( not ( = ?auto_165745 ?auto_165743 ) ) ( not ( = ?auto_165745 ?auto_165742 ) ) ( not ( = ?auto_165738 ?auto_165745 ) ) ( not ( = ?auto_165739 ?auto_165745 ) ) ( not ( = ?auto_165740 ?auto_165745 ) ) ( not ( = ?auto_165741 ?auto_165745 ) ) ( ON ?auto_165741 ?auto_165742 ) ( ON ?auto_165738 ?auto_165746 ) ( not ( = ?auto_165738 ?auto_165746 ) ) ( not ( = ?auto_165739 ?auto_165746 ) ) ( not ( = ?auto_165740 ?auto_165746 ) ) ( not ( = ?auto_165741 ?auto_165746 ) ) ( not ( = ?auto_165742 ?auto_165746 ) ) ( not ( = ?auto_165743 ?auto_165746 ) ) ( not ( = ?auto_165744 ?auto_165746 ) ) ( not ( = ?auto_165745 ?auto_165746 ) ) ( ON ?auto_165739 ?auto_165738 ) ( CLEAR ?auto_165739 ) ( ON-TABLE ?auto_165746 ) ( HOLDING ?auto_165740 ) ( CLEAR ?auto_165741 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_165745 ?auto_165744 ?auto_165743 ?auto_165742 ?auto_165741 ?auto_165740 )
      ( MAKE-6PILE ?auto_165738 ?auto_165739 ?auto_165740 ?auto_165741 ?auto_165742 ?auto_165743 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_165747 - BLOCK
      ?auto_165748 - BLOCK
      ?auto_165749 - BLOCK
      ?auto_165750 - BLOCK
      ?auto_165751 - BLOCK
      ?auto_165752 - BLOCK
    )
    :vars
    (
      ?auto_165753 - BLOCK
      ?auto_165755 - BLOCK
      ?auto_165754 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_165747 ?auto_165748 ) ) ( not ( = ?auto_165747 ?auto_165749 ) ) ( not ( = ?auto_165747 ?auto_165750 ) ) ( not ( = ?auto_165747 ?auto_165751 ) ) ( not ( = ?auto_165747 ?auto_165752 ) ) ( not ( = ?auto_165748 ?auto_165749 ) ) ( not ( = ?auto_165748 ?auto_165750 ) ) ( not ( = ?auto_165748 ?auto_165751 ) ) ( not ( = ?auto_165748 ?auto_165752 ) ) ( not ( = ?auto_165749 ?auto_165750 ) ) ( not ( = ?auto_165749 ?auto_165751 ) ) ( not ( = ?auto_165749 ?auto_165752 ) ) ( not ( = ?auto_165750 ?auto_165751 ) ) ( not ( = ?auto_165750 ?auto_165752 ) ) ( not ( = ?auto_165751 ?auto_165752 ) ) ( ON ?auto_165752 ?auto_165753 ) ( not ( = ?auto_165747 ?auto_165753 ) ) ( not ( = ?auto_165748 ?auto_165753 ) ) ( not ( = ?auto_165749 ?auto_165753 ) ) ( not ( = ?auto_165750 ?auto_165753 ) ) ( not ( = ?auto_165751 ?auto_165753 ) ) ( not ( = ?auto_165752 ?auto_165753 ) ) ( ON ?auto_165751 ?auto_165752 ) ( ON-TABLE ?auto_165755 ) ( ON ?auto_165753 ?auto_165755 ) ( not ( = ?auto_165755 ?auto_165753 ) ) ( not ( = ?auto_165755 ?auto_165752 ) ) ( not ( = ?auto_165755 ?auto_165751 ) ) ( not ( = ?auto_165747 ?auto_165755 ) ) ( not ( = ?auto_165748 ?auto_165755 ) ) ( not ( = ?auto_165749 ?auto_165755 ) ) ( not ( = ?auto_165750 ?auto_165755 ) ) ( ON ?auto_165750 ?auto_165751 ) ( ON ?auto_165747 ?auto_165754 ) ( not ( = ?auto_165747 ?auto_165754 ) ) ( not ( = ?auto_165748 ?auto_165754 ) ) ( not ( = ?auto_165749 ?auto_165754 ) ) ( not ( = ?auto_165750 ?auto_165754 ) ) ( not ( = ?auto_165751 ?auto_165754 ) ) ( not ( = ?auto_165752 ?auto_165754 ) ) ( not ( = ?auto_165753 ?auto_165754 ) ) ( not ( = ?auto_165755 ?auto_165754 ) ) ( ON ?auto_165748 ?auto_165747 ) ( ON-TABLE ?auto_165754 ) ( CLEAR ?auto_165750 ) ( ON ?auto_165749 ?auto_165748 ) ( CLEAR ?auto_165749 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_165754 ?auto_165747 ?auto_165748 )
      ( MAKE-6PILE ?auto_165747 ?auto_165748 ?auto_165749 ?auto_165750 ?auto_165751 ?auto_165752 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_165756 - BLOCK
      ?auto_165757 - BLOCK
      ?auto_165758 - BLOCK
      ?auto_165759 - BLOCK
      ?auto_165760 - BLOCK
      ?auto_165761 - BLOCK
    )
    :vars
    (
      ?auto_165762 - BLOCK
      ?auto_165764 - BLOCK
      ?auto_165763 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_165756 ?auto_165757 ) ) ( not ( = ?auto_165756 ?auto_165758 ) ) ( not ( = ?auto_165756 ?auto_165759 ) ) ( not ( = ?auto_165756 ?auto_165760 ) ) ( not ( = ?auto_165756 ?auto_165761 ) ) ( not ( = ?auto_165757 ?auto_165758 ) ) ( not ( = ?auto_165757 ?auto_165759 ) ) ( not ( = ?auto_165757 ?auto_165760 ) ) ( not ( = ?auto_165757 ?auto_165761 ) ) ( not ( = ?auto_165758 ?auto_165759 ) ) ( not ( = ?auto_165758 ?auto_165760 ) ) ( not ( = ?auto_165758 ?auto_165761 ) ) ( not ( = ?auto_165759 ?auto_165760 ) ) ( not ( = ?auto_165759 ?auto_165761 ) ) ( not ( = ?auto_165760 ?auto_165761 ) ) ( ON ?auto_165761 ?auto_165762 ) ( not ( = ?auto_165756 ?auto_165762 ) ) ( not ( = ?auto_165757 ?auto_165762 ) ) ( not ( = ?auto_165758 ?auto_165762 ) ) ( not ( = ?auto_165759 ?auto_165762 ) ) ( not ( = ?auto_165760 ?auto_165762 ) ) ( not ( = ?auto_165761 ?auto_165762 ) ) ( ON ?auto_165760 ?auto_165761 ) ( ON-TABLE ?auto_165764 ) ( ON ?auto_165762 ?auto_165764 ) ( not ( = ?auto_165764 ?auto_165762 ) ) ( not ( = ?auto_165764 ?auto_165761 ) ) ( not ( = ?auto_165764 ?auto_165760 ) ) ( not ( = ?auto_165756 ?auto_165764 ) ) ( not ( = ?auto_165757 ?auto_165764 ) ) ( not ( = ?auto_165758 ?auto_165764 ) ) ( not ( = ?auto_165759 ?auto_165764 ) ) ( ON ?auto_165756 ?auto_165763 ) ( not ( = ?auto_165756 ?auto_165763 ) ) ( not ( = ?auto_165757 ?auto_165763 ) ) ( not ( = ?auto_165758 ?auto_165763 ) ) ( not ( = ?auto_165759 ?auto_165763 ) ) ( not ( = ?auto_165760 ?auto_165763 ) ) ( not ( = ?auto_165761 ?auto_165763 ) ) ( not ( = ?auto_165762 ?auto_165763 ) ) ( not ( = ?auto_165764 ?auto_165763 ) ) ( ON ?auto_165757 ?auto_165756 ) ( ON-TABLE ?auto_165763 ) ( ON ?auto_165758 ?auto_165757 ) ( CLEAR ?auto_165758 ) ( HOLDING ?auto_165759 ) ( CLEAR ?auto_165760 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_165764 ?auto_165762 ?auto_165761 ?auto_165760 ?auto_165759 )
      ( MAKE-6PILE ?auto_165756 ?auto_165757 ?auto_165758 ?auto_165759 ?auto_165760 ?auto_165761 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_165765 - BLOCK
      ?auto_165766 - BLOCK
      ?auto_165767 - BLOCK
      ?auto_165768 - BLOCK
      ?auto_165769 - BLOCK
      ?auto_165770 - BLOCK
    )
    :vars
    (
      ?auto_165771 - BLOCK
      ?auto_165772 - BLOCK
      ?auto_165773 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_165765 ?auto_165766 ) ) ( not ( = ?auto_165765 ?auto_165767 ) ) ( not ( = ?auto_165765 ?auto_165768 ) ) ( not ( = ?auto_165765 ?auto_165769 ) ) ( not ( = ?auto_165765 ?auto_165770 ) ) ( not ( = ?auto_165766 ?auto_165767 ) ) ( not ( = ?auto_165766 ?auto_165768 ) ) ( not ( = ?auto_165766 ?auto_165769 ) ) ( not ( = ?auto_165766 ?auto_165770 ) ) ( not ( = ?auto_165767 ?auto_165768 ) ) ( not ( = ?auto_165767 ?auto_165769 ) ) ( not ( = ?auto_165767 ?auto_165770 ) ) ( not ( = ?auto_165768 ?auto_165769 ) ) ( not ( = ?auto_165768 ?auto_165770 ) ) ( not ( = ?auto_165769 ?auto_165770 ) ) ( ON ?auto_165770 ?auto_165771 ) ( not ( = ?auto_165765 ?auto_165771 ) ) ( not ( = ?auto_165766 ?auto_165771 ) ) ( not ( = ?auto_165767 ?auto_165771 ) ) ( not ( = ?auto_165768 ?auto_165771 ) ) ( not ( = ?auto_165769 ?auto_165771 ) ) ( not ( = ?auto_165770 ?auto_165771 ) ) ( ON ?auto_165769 ?auto_165770 ) ( ON-TABLE ?auto_165772 ) ( ON ?auto_165771 ?auto_165772 ) ( not ( = ?auto_165772 ?auto_165771 ) ) ( not ( = ?auto_165772 ?auto_165770 ) ) ( not ( = ?auto_165772 ?auto_165769 ) ) ( not ( = ?auto_165765 ?auto_165772 ) ) ( not ( = ?auto_165766 ?auto_165772 ) ) ( not ( = ?auto_165767 ?auto_165772 ) ) ( not ( = ?auto_165768 ?auto_165772 ) ) ( ON ?auto_165765 ?auto_165773 ) ( not ( = ?auto_165765 ?auto_165773 ) ) ( not ( = ?auto_165766 ?auto_165773 ) ) ( not ( = ?auto_165767 ?auto_165773 ) ) ( not ( = ?auto_165768 ?auto_165773 ) ) ( not ( = ?auto_165769 ?auto_165773 ) ) ( not ( = ?auto_165770 ?auto_165773 ) ) ( not ( = ?auto_165771 ?auto_165773 ) ) ( not ( = ?auto_165772 ?auto_165773 ) ) ( ON ?auto_165766 ?auto_165765 ) ( ON-TABLE ?auto_165773 ) ( ON ?auto_165767 ?auto_165766 ) ( CLEAR ?auto_165769 ) ( ON ?auto_165768 ?auto_165767 ) ( CLEAR ?auto_165768 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_165773 ?auto_165765 ?auto_165766 ?auto_165767 )
      ( MAKE-6PILE ?auto_165765 ?auto_165766 ?auto_165767 ?auto_165768 ?auto_165769 ?auto_165770 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_165774 - BLOCK
      ?auto_165775 - BLOCK
      ?auto_165776 - BLOCK
      ?auto_165777 - BLOCK
      ?auto_165778 - BLOCK
      ?auto_165779 - BLOCK
    )
    :vars
    (
      ?auto_165781 - BLOCK
      ?auto_165780 - BLOCK
      ?auto_165782 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_165774 ?auto_165775 ) ) ( not ( = ?auto_165774 ?auto_165776 ) ) ( not ( = ?auto_165774 ?auto_165777 ) ) ( not ( = ?auto_165774 ?auto_165778 ) ) ( not ( = ?auto_165774 ?auto_165779 ) ) ( not ( = ?auto_165775 ?auto_165776 ) ) ( not ( = ?auto_165775 ?auto_165777 ) ) ( not ( = ?auto_165775 ?auto_165778 ) ) ( not ( = ?auto_165775 ?auto_165779 ) ) ( not ( = ?auto_165776 ?auto_165777 ) ) ( not ( = ?auto_165776 ?auto_165778 ) ) ( not ( = ?auto_165776 ?auto_165779 ) ) ( not ( = ?auto_165777 ?auto_165778 ) ) ( not ( = ?auto_165777 ?auto_165779 ) ) ( not ( = ?auto_165778 ?auto_165779 ) ) ( ON ?auto_165779 ?auto_165781 ) ( not ( = ?auto_165774 ?auto_165781 ) ) ( not ( = ?auto_165775 ?auto_165781 ) ) ( not ( = ?auto_165776 ?auto_165781 ) ) ( not ( = ?auto_165777 ?auto_165781 ) ) ( not ( = ?auto_165778 ?auto_165781 ) ) ( not ( = ?auto_165779 ?auto_165781 ) ) ( ON-TABLE ?auto_165780 ) ( ON ?auto_165781 ?auto_165780 ) ( not ( = ?auto_165780 ?auto_165781 ) ) ( not ( = ?auto_165780 ?auto_165779 ) ) ( not ( = ?auto_165780 ?auto_165778 ) ) ( not ( = ?auto_165774 ?auto_165780 ) ) ( not ( = ?auto_165775 ?auto_165780 ) ) ( not ( = ?auto_165776 ?auto_165780 ) ) ( not ( = ?auto_165777 ?auto_165780 ) ) ( ON ?auto_165774 ?auto_165782 ) ( not ( = ?auto_165774 ?auto_165782 ) ) ( not ( = ?auto_165775 ?auto_165782 ) ) ( not ( = ?auto_165776 ?auto_165782 ) ) ( not ( = ?auto_165777 ?auto_165782 ) ) ( not ( = ?auto_165778 ?auto_165782 ) ) ( not ( = ?auto_165779 ?auto_165782 ) ) ( not ( = ?auto_165781 ?auto_165782 ) ) ( not ( = ?auto_165780 ?auto_165782 ) ) ( ON ?auto_165775 ?auto_165774 ) ( ON-TABLE ?auto_165782 ) ( ON ?auto_165776 ?auto_165775 ) ( ON ?auto_165777 ?auto_165776 ) ( CLEAR ?auto_165777 ) ( HOLDING ?auto_165778 ) ( CLEAR ?auto_165779 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_165780 ?auto_165781 ?auto_165779 ?auto_165778 )
      ( MAKE-6PILE ?auto_165774 ?auto_165775 ?auto_165776 ?auto_165777 ?auto_165778 ?auto_165779 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_165783 - BLOCK
      ?auto_165784 - BLOCK
      ?auto_165785 - BLOCK
      ?auto_165786 - BLOCK
      ?auto_165787 - BLOCK
      ?auto_165788 - BLOCK
    )
    :vars
    (
      ?auto_165791 - BLOCK
      ?auto_165789 - BLOCK
      ?auto_165790 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_165783 ?auto_165784 ) ) ( not ( = ?auto_165783 ?auto_165785 ) ) ( not ( = ?auto_165783 ?auto_165786 ) ) ( not ( = ?auto_165783 ?auto_165787 ) ) ( not ( = ?auto_165783 ?auto_165788 ) ) ( not ( = ?auto_165784 ?auto_165785 ) ) ( not ( = ?auto_165784 ?auto_165786 ) ) ( not ( = ?auto_165784 ?auto_165787 ) ) ( not ( = ?auto_165784 ?auto_165788 ) ) ( not ( = ?auto_165785 ?auto_165786 ) ) ( not ( = ?auto_165785 ?auto_165787 ) ) ( not ( = ?auto_165785 ?auto_165788 ) ) ( not ( = ?auto_165786 ?auto_165787 ) ) ( not ( = ?auto_165786 ?auto_165788 ) ) ( not ( = ?auto_165787 ?auto_165788 ) ) ( ON ?auto_165788 ?auto_165791 ) ( not ( = ?auto_165783 ?auto_165791 ) ) ( not ( = ?auto_165784 ?auto_165791 ) ) ( not ( = ?auto_165785 ?auto_165791 ) ) ( not ( = ?auto_165786 ?auto_165791 ) ) ( not ( = ?auto_165787 ?auto_165791 ) ) ( not ( = ?auto_165788 ?auto_165791 ) ) ( ON-TABLE ?auto_165789 ) ( ON ?auto_165791 ?auto_165789 ) ( not ( = ?auto_165789 ?auto_165791 ) ) ( not ( = ?auto_165789 ?auto_165788 ) ) ( not ( = ?auto_165789 ?auto_165787 ) ) ( not ( = ?auto_165783 ?auto_165789 ) ) ( not ( = ?auto_165784 ?auto_165789 ) ) ( not ( = ?auto_165785 ?auto_165789 ) ) ( not ( = ?auto_165786 ?auto_165789 ) ) ( ON ?auto_165783 ?auto_165790 ) ( not ( = ?auto_165783 ?auto_165790 ) ) ( not ( = ?auto_165784 ?auto_165790 ) ) ( not ( = ?auto_165785 ?auto_165790 ) ) ( not ( = ?auto_165786 ?auto_165790 ) ) ( not ( = ?auto_165787 ?auto_165790 ) ) ( not ( = ?auto_165788 ?auto_165790 ) ) ( not ( = ?auto_165791 ?auto_165790 ) ) ( not ( = ?auto_165789 ?auto_165790 ) ) ( ON ?auto_165784 ?auto_165783 ) ( ON-TABLE ?auto_165790 ) ( ON ?auto_165785 ?auto_165784 ) ( ON ?auto_165786 ?auto_165785 ) ( CLEAR ?auto_165788 ) ( ON ?auto_165787 ?auto_165786 ) ( CLEAR ?auto_165787 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_165790 ?auto_165783 ?auto_165784 ?auto_165785 ?auto_165786 )
      ( MAKE-6PILE ?auto_165783 ?auto_165784 ?auto_165785 ?auto_165786 ?auto_165787 ?auto_165788 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_165792 - BLOCK
      ?auto_165793 - BLOCK
      ?auto_165794 - BLOCK
      ?auto_165795 - BLOCK
      ?auto_165796 - BLOCK
      ?auto_165797 - BLOCK
    )
    :vars
    (
      ?auto_165800 - BLOCK
      ?auto_165798 - BLOCK
      ?auto_165799 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_165792 ?auto_165793 ) ) ( not ( = ?auto_165792 ?auto_165794 ) ) ( not ( = ?auto_165792 ?auto_165795 ) ) ( not ( = ?auto_165792 ?auto_165796 ) ) ( not ( = ?auto_165792 ?auto_165797 ) ) ( not ( = ?auto_165793 ?auto_165794 ) ) ( not ( = ?auto_165793 ?auto_165795 ) ) ( not ( = ?auto_165793 ?auto_165796 ) ) ( not ( = ?auto_165793 ?auto_165797 ) ) ( not ( = ?auto_165794 ?auto_165795 ) ) ( not ( = ?auto_165794 ?auto_165796 ) ) ( not ( = ?auto_165794 ?auto_165797 ) ) ( not ( = ?auto_165795 ?auto_165796 ) ) ( not ( = ?auto_165795 ?auto_165797 ) ) ( not ( = ?auto_165796 ?auto_165797 ) ) ( not ( = ?auto_165792 ?auto_165800 ) ) ( not ( = ?auto_165793 ?auto_165800 ) ) ( not ( = ?auto_165794 ?auto_165800 ) ) ( not ( = ?auto_165795 ?auto_165800 ) ) ( not ( = ?auto_165796 ?auto_165800 ) ) ( not ( = ?auto_165797 ?auto_165800 ) ) ( ON-TABLE ?auto_165798 ) ( ON ?auto_165800 ?auto_165798 ) ( not ( = ?auto_165798 ?auto_165800 ) ) ( not ( = ?auto_165798 ?auto_165797 ) ) ( not ( = ?auto_165798 ?auto_165796 ) ) ( not ( = ?auto_165792 ?auto_165798 ) ) ( not ( = ?auto_165793 ?auto_165798 ) ) ( not ( = ?auto_165794 ?auto_165798 ) ) ( not ( = ?auto_165795 ?auto_165798 ) ) ( ON ?auto_165792 ?auto_165799 ) ( not ( = ?auto_165792 ?auto_165799 ) ) ( not ( = ?auto_165793 ?auto_165799 ) ) ( not ( = ?auto_165794 ?auto_165799 ) ) ( not ( = ?auto_165795 ?auto_165799 ) ) ( not ( = ?auto_165796 ?auto_165799 ) ) ( not ( = ?auto_165797 ?auto_165799 ) ) ( not ( = ?auto_165800 ?auto_165799 ) ) ( not ( = ?auto_165798 ?auto_165799 ) ) ( ON ?auto_165793 ?auto_165792 ) ( ON-TABLE ?auto_165799 ) ( ON ?auto_165794 ?auto_165793 ) ( ON ?auto_165795 ?auto_165794 ) ( ON ?auto_165796 ?auto_165795 ) ( CLEAR ?auto_165796 ) ( HOLDING ?auto_165797 ) ( CLEAR ?auto_165800 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_165798 ?auto_165800 ?auto_165797 )
      ( MAKE-6PILE ?auto_165792 ?auto_165793 ?auto_165794 ?auto_165795 ?auto_165796 ?auto_165797 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_165801 - BLOCK
      ?auto_165802 - BLOCK
      ?auto_165803 - BLOCK
      ?auto_165804 - BLOCK
      ?auto_165805 - BLOCK
      ?auto_165806 - BLOCK
    )
    :vars
    (
      ?auto_165809 - BLOCK
      ?auto_165808 - BLOCK
      ?auto_165807 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_165801 ?auto_165802 ) ) ( not ( = ?auto_165801 ?auto_165803 ) ) ( not ( = ?auto_165801 ?auto_165804 ) ) ( not ( = ?auto_165801 ?auto_165805 ) ) ( not ( = ?auto_165801 ?auto_165806 ) ) ( not ( = ?auto_165802 ?auto_165803 ) ) ( not ( = ?auto_165802 ?auto_165804 ) ) ( not ( = ?auto_165802 ?auto_165805 ) ) ( not ( = ?auto_165802 ?auto_165806 ) ) ( not ( = ?auto_165803 ?auto_165804 ) ) ( not ( = ?auto_165803 ?auto_165805 ) ) ( not ( = ?auto_165803 ?auto_165806 ) ) ( not ( = ?auto_165804 ?auto_165805 ) ) ( not ( = ?auto_165804 ?auto_165806 ) ) ( not ( = ?auto_165805 ?auto_165806 ) ) ( not ( = ?auto_165801 ?auto_165809 ) ) ( not ( = ?auto_165802 ?auto_165809 ) ) ( not ( = ?auto_165803 ?auto_165809 ) ) ( not ( = ?auto_165804 ?auto_165809 ) ) ( not ( = ?auto_165805 ?auto_165809 ) ) ( not ( = ?auto_165806 ?auto_165809 ) ) ( ON-TABLE ?auto_165808 ) ( ON ?auto_165809 ?auto_165808 ) ( not ( = ?auto_165808 ?auto_165809 ) ) ( not ( = ?auto_165808 ?auto_165806 ) ) ( not ( = ?auto_165808 ?auto_165805 ) ) ( not ( = ?auto_165801 ?auto_165808 ) ) ( not ( = ?auto_165802 ?auto_165808 ) ) ( not ( = ?auto_165803 ?auto_165808 ) ) ( not ( = ?auto_165804 ?auto_165808 ) ) ( ON ?auto_165801 ?auto_165807 ) ( not ( = ?auto_165801 ?auto_165807 ) ) ( not ( = ?auto_165802 ?auto_165807 ) ) ( not ( = ?auto_165803 ?auto_165807 ) ) ( not ( = ?auto_165804 ?auto_165807 ) ) ( not ( = ?auto_165805 ?auto_165807 ) ) ( not ( = ?auto_165806 ?auto_165807 ) ) ( not ( = ?auto_165809 ?auto_165807 ) ) ( not ( = ?auto_165808 ?auto_165807 ) ) ( ON ?auto_165802 ?auto_165801 ) ( ON-TABLE ?auto_165807 ) ( ON ?auto_165803 ?auto_165802 ) ( ON ?auto_165804 ?auto_165803 ) ( ON ?auto_165805 ?auto_165804 ) ( CLEAR ?auto_165809 ) ( ON ?auto_165806 ?auto_165805 ) ( CLEAR ?auto_165806 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_165807 ?auto_165801 ?auto_165802 ?auto_165803 ?auto_165804 ?auto_165805 )
      ( MAKE-6PILE ?auto_165801 ?auto_165802 ?auto_165803 ?auto_165804 ?auto_165805 ?auto_165806 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_165810 - BLOCK
      ?auto_165811 - BLOCK
      ?auto_165812 - BLOCK
      ?auto_165813 - BLOCK
      ?auto_165814 - BLOCK
      ?auto_165815 - BLOCK
    )
    :vars
    (
      ?auto_165816 - BLOCK
      ?auto_165817 - BLOCK
      ?auto_165818 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_165810 ?auto_165811 ) ) ( not ( = ?auto_165810 ?auto_165812 ) ) ( not ( = ?auto_165810 ?auto_165813 ) ) ( not ( = ?auto_165810 ?auto_165814 ) ) ( not ( = ?auto_165810 ?auto_165815 ) ) ( not ( = ?auto_165811 ?auto_165812 ) ) ( not ( = ?auto_165811 ?auto_165813 ) ) ( not ( = ?auto_165811 ?auto_165814 ) ) ( not ( = ?auto_165811 ?auto_165815 ) ) ( not ( = ?auto_165812 ?auto_165813 ) ) ( not ( = ?auto_165812 ?auto_165814 ) ) ( not ( = ?auto_165812 ?auto_165815 ) ) ( not ( = ?auto_165813 ?auto_165814 ) ) ( not ( = ?auto_165813 ?auto_165815 ) ) ( not ( = ?auto_165814 ?auto_165815 ) ) ( not ( = ?auto_165810 ?auto_165816 ) ) ( not ( = ?auto_165811 ?auto_165816 ) ) ( not ( = ?auto_165812 ?auto_165816 ) ) ( not ( = ?auto_165813 ?auto_165816 ) ) ( not ( = ?auto_165814 ?auto_165816 ) ) ( not ( = ?auto_165815 ?auto_165816 ) ) ( ON-TABLE ?auto_165817 ) ( not ( = ?auto_165817 ?auto_165816 ) ) ( not ( = ?auto_165817 ?auto_165815 ) ) ( not ( = ?auto_165817 ?auto_165814 ) ) ( not ( = ?auto_165810 ?auto_165817 ) ) ( not ( = ?auto_165811 ?auto_165817 ) ) ( not ( = ?auto_165812 ?auto_165817 ) ) ( not ( = ?auto_165813 ?auto_165817 ) ) ( ON ?auto_165810 ?auto_165818 ) ( not ( = ?auto_165810 ?auto_165818 ) ) ( not ( = ?auto_165811 ?auto_165818 ) ) ( not ( = ?auto_165812 ?auto_165818 ) ) ( not ( = ?auto_165813 ?auto_165818 ) ) ( not ( = ?auto_165814 ?auto_165818 ) ) ( not ( = ?auto_165815 ?auto_165818 ) ) ( not ( = ?auto_165816 ?auto_165818 ) ) ( not ( = ?auto_165817 ?auto_165818 ) ) ( ON ?auto_165811 ?auto_165810 ) ( ON-TABLE ?auto_165818 ) ( ON ?auto_165812 ?auto_165811 ) ( ON ?auto_165813 ?auto_165812 ) ( ON ?auto_165814 ?auto_165813 ) ( ON ?auto_165815 ?auto_165814 ) ( CLEAR ?auto_165815 ) ( HOLDING ?auto_165816 ) ( CLEAR ?auto_165817 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_165817 ?auto_165816 )
      ( MAKE-6PILE ?auto_165810 ?auto_165811 ?auto_165812 ?auto_165813 ?auto_165814 ?auto_165815 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_165819 - BLOCK
      ?auto_165820 - BLOCK
      ?auto_165821 - BLOCK
      ?auto_165822 - BLOCK
      ?auto_165823 - BLOCK
      ?auto_165824 - BLOCK
    )
    :vars
    (
      ?auto_165827 - BLOCK
      ?auto_165825 - BLOCK
      ?auto_165826 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_165819 ?auto_165820 ) ) ( not ( = ?auto_165819 ?auto_165821 ) ) ( not ( = ?auto_165819 ?auto_165822 ) ) ( not ( = ?auto_165819 ?auto_165823 ) ) ( not ( = ?auto_165819 ?auto_165824 ) ) ( not ( = ?auto_165820 ?auto_165821 ) ) ( not ( = ?auto_165820 ?auto_165822 ) ) ( not ( = ?auto_165820 ?auto_165823 ) ) ( not ( = ?auto_165820 ?auto_165824 ) ) ( not ( = ?auto_165821 ?auto_165822 ) ) ( not ( = ?auto_165821 ?auto_165823 ) ) ( not ( = ?auto_165821 ?auto_165824 ) ) ( not ( = ?auto_165822 ?auto_165823 ) ) ( not ( = ?auto_165822 ?auto_165824 ) ) ( not ( = ?auto_165823 ?auto_165824 ) ) ( not ( = ?auto_165819 ?auto_165827 ) ) ( not ( = ?auto_165820 ?auto_165827 ) ) ( not ( = ?auto_165821 ?auto_165827 ) ) ( not ( = ?auto_165822 ?auto_165827 ) ) ( not ( = ?auto_165823 ?auto_165827 ) ) ( not ( = ?auto_165824 ?auto_165827 ) ) ( ON-TABLE ?auto_165825 ) ( not ( = ?auto_165825 ?auto_165827 ) ) ( not ( = ?auto_165825 ?auto_165824 ) ) ( not ( = ?auto_165825 ?auto_165823 ) ) ( not ( = ?auto_165819 ?auto_165825 ) ) ( not ( = ?auto_165820 ?auto_165825 ) ) ( not ( = ?auto_165821 ?auto_165825 ) ) ( not ( = ?auto_165822 ?auto_165825 ) ) ( ON ?auto_165819 ?auto_165826 ) ( not ( = ?auto_165819 ?auto_165826 ) ) ( not ( = ?auto_165820 ?auto_165826 ) ) ( not ( = ?auto_165821 ?auto_165826 ) ) ( not ( = ?auto_165822 ?auto_165826 ) ) ( not ( = ?auto_165823 ?auto_165826 ) ) ( not ( = ?auto_165824 ?auto_165826 ) ) ( not ( = ?auto_165827 ?auto_165826 ) ) ( not ( = ?auto_165825 ?auto_165826 ) ) ( ON ?auto_165820 ?auto_165819 ) ( ON-TABLE ?auto_165826 ) ( ON ?auto_165821 ?auto_165820 ) ( ON ?auto_165822 ?auto_165821 ) ( ON ?auto_165823 ?auto_165822 ) ( ON ?auto_165824 ?auto_165823 ) ( CLEAR ?auto_165825 ) ( ON ?auto_165827 ?auto_165824 ) ( CLEAR ?auto_165827 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_165826 ?auto_165819 ?auto_165820 ?auto_165821 ?auto_165822 ?auto_165823 ?auto_165824 )
      ( MAKE-6PILE ?auto_165819 ?auto_165820 ?auto_165821 ?auto_165822 ?auto_165823 ?auto_165824 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_165828 - BLOCK
      ?auto_165829 - BLOCK
      ?auto_165830 - BLOCK
      ?auto_165831 - BLOCK
      ?auto_165832 - BLOCK
      ?auto_165833 - BLOCK
    )
    :vars
    (
      ?auto_165835 - BLOCK
      ?auto_165834 - BLOCK
      ?auto_165836 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_165828 ?auto_165829 ) ) ( not ( = ?auto_165828 ?auto_165830 ) ) ( not ( = ?auto_165828 ?auto_165831 ) ) ( not ( = ?auto_165828 ?auto_165832 ) ) ( not ( = ?auto_165828 ?auto_165833 ) ) ( not ( = ?auto_165829 ?auto_165830 ) ) ( not ( = ?auto_165829 ?auto_165831 ) ) ( not ( = ?auto_165829 ?auto_165832 ) ) ( not ( = ?auto_165829 ?auto_165833 ) ) ( not ( = ?auto_165830 ?auto_165831 ) ) ( not ( = ?auto_165830 ?auto_165832 ) ) ( not ( = ?auto_165830 ?auto_165833 ) ) ( not ( = ?auto_165831 ?auto_165832 ) ) ( not ( = ?auto_165831 ?auto_165833 ) ) ( not ( = ?auto_165832 ?auto_165833 ) ) ( not ( = ?auto_165828 ?auto_165835 ) ) ( not ( = ?auto_165829 ?auto_165835 ) ) ( not ( = ?auto_165830 ?auto_165835 ) ) ( not ( = ?auto_165831 ?auto_165835 ) ) ( not ( = ?auto_165832 ?auto_165835 ) ) ( not ( = ?auto_165833 ?auto_165835 ) ) ( not ( = ?auto_165834 ?auto_165835 ) ) ( not ( = ?auto_165834 ?auto_165833 ) ) ( not ( = ?auto_165834 ?auto_165832 ) ) ( not ( = ?auto_165828 ?auto_165834 ) ) ( not ( = ?auto_165829 ?auto_165834 ) ) ( not ( = ?auto_165830 ?auto_165834 ) ) ( not ( = ?auto_165831 ?auto_165834 ) ) ( ON ?auto_165828 ?auto_165836 ) ( not ( = ?auto_165828 ?auto_165836 ) ) ( not ( = ?auto_165829 ?auto_165836 ) ) ( not ( = ?auto_165830 ?auto_165836 ) ) ( not ( = ?auto_165831 ?auto_165836 ) ) ( not ( = ?auto_165832 ?auto_165836 ) ) ( not ( = ?auto_165833 ?auto_165836 ) ) ( not ( = ?auto_165835 ?auto_165836 ) ) ( not ( = ?auto_165834 ?auto_165836 ) ) ( ON ?auto_165829 ?auto_165828 ) ( ON-TABLE ?auto_165836 ) ( ON ?auto_165830 ?auto_165829 ) ( ON ?auto_165831 ?auto_165830 ) ( ON ?auto_165832 ?auto_165831 ) ( ON ?auto_165833 ?auto_165832 ) ( ON ?auto_165835 ?auto_165833 ) ( CLEAR ?auto_165835 ) ( HOLDING ?auto_165834 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_165834 )
      ( MAKE-6PILE ?auto_165828 ?auto_165829 ?auto_165830 ?auto_165831 ?auto_165832 ?auto_165833 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_165837 - BLOCK
      ?auto_165838 - BLOCK
      ?auto_165839 - BLOCK
      ?auto_165840 - BLOCK
      ?auto_165841 - BLOCK
      ?auto_165842 - BLOCK
    )
    :vars
    (
      ?auto_165843 - BLOCK
      ?auto_165845 - BLOCK
      ?auto_165844 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_165837 ?auto_165838 ) ) ( not ( = ?auto_165837 ?auto_165839 ) ) ( not ( = ?auto_165837 ?auto_165840 ) ) ( not ( = ?auto_165837 ?auto_165841 ) ) ( not ( = ?auto_165837 ?auto_165842 ) ) ( not ( = ?auto_165838 ?auto_165839 ) ) ( not ( = ?auto_165838 ?auto_165840 ) ) ( not ( = ?auto_165838 ?auto_165841 ) ) ( not ( = ?auto_165838 ?auto_165842 ) ) ( not ( = ?auto_165839 ?auto_165840 ) ) ( not ( = ?auto_165839 ?auto_165841 ) ) ( not ( = ?auto_165839 ?auto_165842 ) ) ( not ( = ?auto_165840 ?auto_165841 ) ) ( not ( = ?auto_165840 ?auto_165842 ) ) ( not ( = ?auto_165841 ?auto_165842 ) ) ( not ( = ?auto_165837 ?auto_165843 ) ) ( not ( = ?auto_165838 ?auto_165843 ) ) ( not ( = ?auto_165839 ?auto_165843 ) ) ( not ( = ?auto_165840 ?auto_165843 ) ) ( not ( = ?auto_165841 ?auto_165843 ) ) ( not ( = ?auto_165842 ?auto_165843 ) ) ( not ( = ?auto_165845 ?auto_165843 ) ) ( not ( = ?auto_165845 ?auto_165842 ) ) ( not ( = ?auto_165845 ?auto_165841 ) ) ( not ( = ?auto_165837 ?auto_165845 ) ) ( not ( = ?auto_165838 ?auto_165845 ) ) ( not ( = ?auto_165839 ?auto_165845 ) ) ( not ( = ?auto_165840 ?auto_165845 ) ) ( ON ?auto_165837 ?auto_165844 ) ( not ( = ?auto_165837 ?auto_165844 ) ) ( not ( = ?auto_165838 ?auto_165844 ) ) ( not ( = ?auto_165839 ?auto_165844 ) ) ( not ( = ?auto_165840 ?auto_165844 ) ) ( not ( = ?auto_165841 ?auto_165844 ) ) ( not ( = ?auto_165842 ?auto_165844 ) ) ( not ( = ?auto_165843 ?auto_165844 ) ) ( not ( = ?auto_165845 ?auto_165844 ) ) ( ON ?auto_165838 ?auto_165837 ) ( ON-TABLE ?auto_165844 ) ( ON ?auto_165839 ?auto_165838 ) ( ON ?auto_165840 ?auto_165839 ) ( ON ?auto_165841 ?auto_165840 ) ( ON ?auto_165842 ?auto_165841 ) ( ON ?auto_165843 ?auto_165842 ) ( ON ?auto_165845 ?auto_165843 ) ( CLEAR ?auto_165845 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_165844 ?auto_165837 ?auto_165838 ?auto_165839 ?auto_165840 ?auto_165841 ?auto_165842 ?auto_165843 )
      ( MAKE-6PILE ?auto_165837 ?auto_165838 ?auto_165839 ?auto_165840 ?auto_165841 ?auto_165842 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_165847 - BLOCK
    )
    :vars
    (
      ?auto_165848 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_165848 ?auto_165847 ) ( CLEAR ?auto_165848 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_165847 ) ( not ( = ?auto_165847 ?auto_165848 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_165848 ?auto_165847 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_165849 - BLOCK
    )
    :vars
    (
      ?auto_165850 - BLOCK
      ?auto_165851 - BLOCK
      ?auto_165852 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_165850 ?auto_165849 ) ( CLEAR ?auto_165850 ) ( ON-TABLE ?auto_165849 ) ( not ( = ?auto_165849 ?auto_165850 ) ) ( HOLDING ?auto_165851 ) ( CLEAR ?auto_165852 ) ( not ( = ?auto_165849 ?auto_165851 ) ) ( not ( = ?auto_165849 ?auto_165852 ) ) ( not ( = ?auto_165850 ?auto_165851 ) ) ( not ( = ?auto_165850 ?auto_165852 ) ) ( not ( = ?auto_165851 ?auto_165852 ) ) )
    :subtasks
    ( ( !STACK ?auto_165851 ?auto_165852 )
      ( MAKE-1PILE ?auto_165849 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_165853 - BLOCK
    )
    :vars
    (
      ?auto_165855 - BLOCK
      ?auto_165856 - BLOCK
      ?auto_165854 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_165855 ?auto_165853 ) ( ON-TABLE ?auto_165853 ) ( not ( = ?auto_165853 ?auto_165855 ) ) ( CLEAR ?auto_165856 ) ( not ( = ?auto_165853 ?auto_165854 ) ) ( not ( = ?auto_165853 ?auto_165856 ) ) ( not ( = ?auto_165855 ?auto_165854 ) ) ( not ( = ?auto_165855 ?auto_165856 ) ) ( not ( = ?auto_165854 ?auto_165856 ) ) ( ON ?auto_165854 ?auto_165855 ) ( CLEAR ?auto_165854 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_165853 ?auto_165855 )
      ( MAKE-1PILE ?auto_165853 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_165857 - BLOCK
    )
    :vars
    (
      ?auto_165858 - BLOCK
      ?auto_165859 - BLOCK
      ?auto_165860 - BLOCK
      ?auto_165862 - BLOCK
      ?auto_165863 - BLOCK
      ?auto_165864 - BLOCK
      ?auto_165861 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_165858 ?auto_165857 ) ( ON-TABLE ?auto_165857 ) ( not ( = ?auto_165857 ?auto_165858 ) ) ( not ( = ?auto_165857 ?auto_165859 ) ) ( not ( = ?auto_165857 ?auto_165860 ) ) ( not ( = ?auto_165858 ?auto_165859 ) ) ( not ( = ?auto_165858 ?auto_165860 ) ) ( not ( = ?auto_165859 ?auto_165860 ) ) ( ON ?auto_165859 ?auto_165858 ) ( CLEAR ?auto_165859 ) ( HOLDING ?auto_165860 ) ( CLEAR ?auto_165862 ) ( ON-TABLE ?auto_165863 ) ( ON ?auto_165864 ?auto_165863 ) ( ON ?auto_165861 ?auto_165864 ) ( ON ?auto_165862 ?auto_165861 ) ( not ( = ?auto_165863 ?auto_165864 ) ) ( not ( = ?auto_165863 ?auto_165861 ) ) ( not ( = ?auto_165863 ?auto_165862 ) ) ( not ( = ?auto_165863 ?auto_165860 ) ) ( not ( = ?auto_165864 ?auto_165861 ) ) ( not ( = ?auto_165864 ?auto_165862 ) ) ( not ( = ?auto_165864 ?auto_165860 ) ) ( not ( = ?auto_165861 ?auto_165862 ) ) ( not ( = ?auto_165861 ?auto_165860 ) ) ( not ( = ?auto_165862 ?auto_165860 ) ) ( not ( = ?auto_165857 ?auto_165862 ) ) ( not ( = ?auto_165857 ?auto_165863 ) ) ( not ( = ?auto_165857 ?auto_165864 ) ) ( not ( = ?auto_165857 ?auto_165861 ) ) ( not ( = ?auto_165858 ?auto_165862 ) ) ( not ( = ?auto_165858 ?auto_165863 ) ) ( not ( = ?auto_165858 ?auto_165864 ) ) ( not ( = ?auto_165858 ?auto_165861 ) ) ( not ( = ?auto_165859 ?auto_165862 ) ) ( not ( = ?auto_165859 ?auto_165863 ) ) ( not ( = ?auto_165859 ?auto_165864 ) ) ( not ( = ?auto_165859 ?auto_165861 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_165863 ?auto_165864 ?auto_165861 ?auto_165862 ?auto_165860 )
      ( MAKE-1PILE ?auto_165857 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_165865 - BLOCK
    )
    :vars
    (
      ?auto_165872 - BLOCK
      ?auto_165866 - BLOCK
      ?auto_165867 - BLOCK
      ?auto_165870 - BLOCK
      ?auto_165869 - BLOCK
      ?auto_165871 - BLOCK
      ?auto_165868 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_165872 ?auto_165865 ) ( ON-TABLE ?auto_165865 ) ( not ( = ?auto_165865 ?auto_165872 ) ) ( not ( = ?auto_165865 ?auto_165866 ) ) ( not ( = ?auto_165865 ?auto_165867 ) ) ( not ( = ?auto_165872 ?auto_165866 ) ) ( not ( = ?auto_165872 ?auto_165867 ) ) ( not ( = ?auto_165866 ?auto_165867 ) ) ( ON ?auto_165866 ?auto_165872 ) ( CLEAR ?auto_165870 ) ( ON-TABLE ?auto_165869 ) ( ON ?auto_165871 ?auto_165869 ) ( ON ?auto_165868 ?auto_165871 ) ( ON ?auto_165870 ?auto_165868 ) ( not ( = ?auto_165869 ?auto_165871 ) ) ( not ( = ?auto_165869 ?auto_165868 ) ) ( not ( = ?auto_165869 ?auto_165870 ) ) ( not ( = ?auto_165869 ?auto_165867 ) ) ( not ( = ?auto_165871 ?auto_165868 ) ) ( not ( = ?auto_165871 ?auto_165870 ) ) ( not ( = ?auto_165871 ?auto_165867 ) ) ( not ( = ?auto_165868 ?auto_165870 ) ) ( not ( = ?auto_165868 ?auto_165867 ) ) ( not ( = ?auto_165870 ?auto_165867 ) ) ( not ( = ?auto_165865 ?auto_165870 ) ) ( not ( = ?auto_165865 ?auto_165869 ) ) ( not ( = ?auto_165865 ?auto_165871 ) ) ( not ( = ?auto_165865 ?auto_165868 ) ) ( not ( = ?auto_165872 ?auto_165870 ) ) ( not ( = ?auto_165872 ?auto_165869 ) ) ( not ( = ?auto_165872 ?auto_165871 ) ) ( not ( = ?auto_165872 ?auto_165868 ) ) ( not ( = ?auto_165866 ?auto_165870 ) ) ( not ( = ?auto_165866 ?auto_165869 ) ) ( not ( = ?auto_165866 ?auto_165871 ) ) ( not ( = ?auto_165866 ?auto_165868 ) ) ( ON ?auto_165867 ?auto_165866 ) ( CLEAR ?auto_165867 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_165865 ?auto_165872 ?auto_165866 )
      ( MAKE-1PILE ?auto_165865 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_165873 - BLOCK
    )
    :vars
    (
      ?auto_165878 - BLOCK
      ?auto_165879 - BLOCK
      ?auto_165876 - BLOCK
      ?auto_165874 - BLOCK
      ?auto_165877 - BLOCK
      ?auto_165875 - BLOCK
      ?auto_165880 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_165878 ?auto_165873 ) ( ON-TABLE ?auto_165873 ) ( not ( = ?auto_165873 ?auto_165878 ) ) ( not ( = ?auto_165873 ?auto_165879 ) ) ( not ( = ?auto_165873 ?auto_165876 ) ) ( not ( = ?auto_165878 ?auto_165879 ) ) ( not ( = ?auto_165878 ?auto_165876 ) ) ( not ( = ?auto_165879 ?auto_165876 ) ) ( ON ?auto_165879 ?auto_165878 ) ( ON-TABLE ?auto_165874 ) ( ON ?auto_165877 ?auto_165874 ) ( ON ?auto_165875 ?auto_165877 ) ( not ( = ?auto_165874 ?auto_165877 ) ) ( not ( = ?auto_165874 ?auto_165875 ) ) ( not ( = ?auto_165874 ?auto_165880 ) ) ( not ( = ?auto_165874 ?auto_165876 ) ) ( not ( = ?auto_165877 ?auto_165875 ) ) ( not ( = ?auto_165877 ?auto_165880 ) ) ( not ( = ?auto_165877 ?auto_165876 ) ) ( not ( = ?auto_165875 ?auto_165880 ) ) ( not ( = ?auto_165875 ?auto_165876 ) ) ( not ( = ?auto_165880 ?auto_165876 ) ) ( not ( = ?auto_165873 ?auto_165880 ) ) ( not ( = ?auto_165873 ?auto_165874 ) ) ( not ( = ?auto_165873 ?auto_165877 ) ) ( not ( = ?auto_165873 ?auto_165875 ) ) ( not ( = ?auto_165878 ?auto_165880 ) ) ( not ( = ?auto_165878 ?auto_165874 ) ) ( not ( = ?auto_165878 ?auto_165877 ) ) ( not ( = ?auto_165878 ?auto_165875 ) ) ( not ( = ?auto_165879 ?auto_165880 ) ) ( not ( = ?auto_165879 ?auto_165874 ) ) ( not ( = ?auto_165879 ?auto_165877 ) ) ( not ( = ?auto_165879 ?auto_165875 ) ) ( ON ?auto_165876 ?auto_165879 ) ( CLEAR ?auto_165876 ) ( HOLDING ?auto_165880 ) ( CLEAR ?auto_165875 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_165874 ?auto_165877 ?auto_165875 ?auto_165880 )
      ( MAKE-1PILE ?auto_165873 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_165881 - BLOCK
    )
    :vars
    (
      ?auto_165886 - BLOCK
      ?auto_165888 - BLOCK
      ?auto_165885 - BLOCK
      ?auto_165883 - BLOCK
      ?auto_165882 - BLOCK
      ?auto_165884 - BLOCK
      ?auto_165887 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_165886 ?auto_165881 ) ( ON-TABLE ?auto_165881 ) ( not ( = ?auto_165881 ?auto_165886 ) ) ( not ( = ?auto_165881 ?auto_165888 ) ) ( not ( = ?auto_165881 ?auto_165885 ) ) ( not ( = ?auto_165886 ?auto_165888 ) ) ( not ( = ?auto_165886 ?auto_165885 ) ) ( not ( = ?auto_165888 ?auto_165885 ) ) ( ON ?auto_165888 ?auto_165886 ) ( ON-TABLE ?auto_165883 ) ( ON ?auto_165882 ?auto_165883 ) ( ON ?auto_165884 ?auto_165882 ) ( not ( = ?auto_165883 ?auto_165882 ) ) ( not ( = ?auto_165883 ?auto_165884 ) ) ( not ( = ?auto_165883 ?auto_165887 ) ) ( not ( = ?auto_165883 ?auto_165885 ) ) ( not ( = ?auto_165882 ?auto_165884 ) ) ( not ( = ?auto_165882 ?auto_165887 ) ) ( not ( = ?auto_165882 ?auto_165885 ) ) ( not ( = ?auto_165884 ?auto_165887 ) ) ( not ( = ?auto_165884 ?auto_165885 ) ) ( not ( = ?auto_165887 ?auto_165885 ) ) ( not ( = ?auto_165881 ?auto_165887 ) ) ( not ( = ?auto_165881 ?auto_165883 ) ) ( not ( = ?auto_165881 ?auto_165882 ) ) ( not ( = ?auto_165881 ?auto_165884 ) ) ( not ( = ?auto_165886 ?auto_165887 ) ) ( not ( = ?auto_165886 ?auto_165883 ) ) ( not ( = ?auto_165886 ?auto_165882 ) ) ( not ( = ?auto_165886 ?auto_165884 ) ) ( not ( = ?auto_165888 ?auto_165887 ) ) ( not ( = ?auto_165888 ?auto_165883 ) ) ( not ( = ?auto_165888 ?auto_165882 ) ) ( not ( = ?auto_165888 ?auto_165884 ) ) ( ON ?auto_165885 ?auto_165888 ) ( CLEAR ?auto_165884 ) ( ON ?auto_165887 ?auto_165885 ) ( CLEAR ?auto_165887 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_165881 ?auto_165886 ?auto_165888 ?auto_165885 )
      ( MAKE-1PILE ?auto_165881 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_165889 - BLOCK
    )
    :vars
    (
      ?auto_165890 - BLOCK
      ?auto_165893 - BLOCK
      ?auto_165894 - BLOCK
      ?auto_165896 - BLOCK
      ?auto_165895 - BLOCK
      ?auto_165891 - BLOCK
      ?auto_165892 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_165890 ?auto_165889 ) ( ON-TABLE ?auto_165889 ) ( not ( = ?auto_165889 ?auto_165890 ) ) ( not ( = ?auto_165889 ?auto_165893 ) ) ( not ( = ?auto_165889 ?auto_165894 ) ) ( not ( = ?auto_165890 ?auto_165893 ) ) ( not ( = ?auto_165890 ?auto_165894 ) ) ( not ( = ?auto_165893 ?auto_165894 ) ) ( ON ?auto_165893 ?auto_165890 ) ( ON-TABLE ?auto_165896 ) ( ON ?auto_165895 ?auto_165896 ) ( not ( = ?auto_165896 ?auto_165895 ) ) ( not ( = ?auto_165896 ?auto_165891 ) ) ( not ( = ?auto_165896 ?auto_165892 ) ) ( not ( = ?auto_165896 ?auto_165894 ) ) ( not ( = ?auto_165895 ?auto_165891 ) ) ( not ( = ?auto_165895 ?auto_165892 ) ) ( not ( = ?auto_165895 ?auto_165894 ) ) ( not ( = ?auto_165891 ?auto_165892 ) ) ( not ( = ?auto_165891 ?auto_165894 ) ) ( not ( = ?auto_165892 ?auto_165894 ) ) ( not ( = ?auto_165889 ?auto_165892 ) ) ( not ( = ?auto_165889 ?auto_165896 ) ) ( not ( = ?auto_165889 ?auto_165895 ) ) ( not ( = ?auto_165889 ?auto_165891 ) ) ( not ( = ?auto_165890 ?auto_165892 ) ) ( not ( = ?auto_165890 ?auto_165896 ) ) ( not ( = ?auto_165890 ?auto_165895 ) ) ( not ( = ?auto_165890 ?auto_165891 ) ) ( not ( = ?auto_165893 ?auto_165892 ) ) ( not ( = ?auto_165893 ?auto_165896 ) ) ( not ( = ?auto_165893 ?auto_165895 ) ) ( not ( = ?auto_165893 ?auto_165891 ) ) ( ON ?auto_165894 ?auto_165893 ) ( ON ?auto_165892 ?auto_165894 ) ( CLEAR ?auto_165892 ) ( HOLDING ?auto_165891 ) ( CLEAR ?auto_165895 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_165896 ?auto_165895 ?auto_165891 )
      ( MAKE-1PILE ?auto_165889 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_165897 - BLOCK
    )
    :vars
    (
      ?auto_165901 - BLOCK
      ?auto_165903 - BLOCK
      ?auto_165902 - BLOCK
      ?auto_165898 - BLOCK
      ?auto_165904 - BLOCK
      ?auto_165899 - BLOCK
      ?auto_165900 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_165901 ?auto_165897 ) ( ON-TABLE ?auto_165897 ) ( not ( = ?auto_165897 ?auto_165901 ) ) ( not ( = ?auto_165897 ?auto_165903 ) ) ( not ( = ?auto_165897 ?auto_165902 ) ) ( not ( = ?auto_165901 ?auto_165903 ) ) ( not ( = ?auto_165901 ?auto_165902 ) ) ( not ( = ?auto_165903 ?auto_165902 ) ) ( ON ?auto_165903 ?auto_165901 ) ( ON-TABLE ?auto_165898 ) ( ON ?auto_165904 ?auto_165898 ) ( not ( = ?auto_165898 ?auto_165904 ) ) ( not ( = ?auto_165898 ?auto_165899 ) ) ( not ( = ?auto_165898 ?auto_165900 ) ) ( not ( = ?auto_165898 ?auto_165902 ) ) ( not ( = ?auto_165904 ?auto_165899 ) ) ( not ( = ?auto_165904 ?auto_165900 ) ) ( not ( = ?auto_165904 ?auto_165902 ) ) ( not ( = ?auto_165899 ?auto_165900 ) ) ( not ( = ?auto_165899 ?auto_165902 ) ) ( not ( = ?auto_165900 ?auto_165902 ) ) ( not ( = ?auto_165897 ?auto_165900 ) ) ( not ( = ?auto_165897 ?auto_165898 ) ) ( not ( = ?auto_165897 ?auto_165904 ) ) ( not ( = ?auto_165897 ?auto_165899 ) ) ( not ( = ?auto_165901 ?auto_165900 ) ) ( not ( = ?auto_165901 ?auto_165898 ) ) ( not ( = ?auto_165901 ?auto_165904 ) ) ( not ( = ?auto_165901 ?auto_165899 ) ) ( not ( = ?auto_165903 ?auto_165900 ) ) ( not ( = ?auto_165903 ?auto_165898 ) ) ( not ( = ?auto_165903 ?auto_165904 ) ) ( not ( = ?auto_165903 ?auto_165899 ) ) ( ON ?auto_165902 ?auto_165903 ) ( ON ?auto_165900 ?auto_165902 ) ( CLEAR ?auto_165904 ) ( ON ?auto_165899 ?auto_165900 ) ( CLEAR ?auto_165899 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_165897 ?auto_165901 ?auto_165903 ?auto_165902 ?auto_165900 )
      ( MAKE-1PILE ?auto_165897 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_165905 - BLOCK
    )
    :vars
    (
      ?auto_165912 - BLOCK
      ?auto_165911 - BLOCK
      ?auto_165907 - BLOCK
      ?auto_165908 - BLOCK
      ?auto_165909 - BLOCK
      ?auto_165910 - BLOCK
      ?auto_165906 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_165912 ?auto_165905 ) ( ON-TABLE ?auto_165905 ) ( not ( = ?auto_165905 ?auto_165912 ) ) ( not ( = ?auto_165905 ?auto_165911 ) ) ( not ( = ?auto_165905 ?auto_165907 ) ) ( not ( = ?auto_165912 ?auto_165911 ) ) ( not ( = ?auto_165912 ?auto_165907 ) ) ( not ( = ?auto_165911 ?auto_165907 ) ) ( ON ?auto_165911 ?auto_165912 ) ( ON-TABLE ?auto_165908 ) ( not ( = ?auto_165908 ?auto_165909 ) ) ( not ( = ?auto_165908 ?auto_165910 ) ) ( not ( = ?auto_165908 ?auto_165906 ) ) ( not ( = ?auto_165908 ?auto_165907 ) ) ( not ( = ?auto_165909 ?auto_165910 ) ) ( not ( = ?auto_165909 ?auto_165906 ) ) ( not ( = ?auto_165909 ?auto_165907 ) ) ( not ( = ?auto_165910 ?auto_165906 ) ) ( not ( = ?auto_165910 ?auto_165907 ) ) ( not ( = ?auto_165906 ?auto_165907 ) ) ( not ( = ?auto_165905 ?auto_165906 ) ) ( not ( = ?auto_165905 ?auto_165908 ) ) ( not ( = ?auto_165905 ?auto_165909 ) ) ( not ( = ?auto_165905 ?auto_165910 ) ) ( not ( = ?auto_165912 ?auto_165906 ) ) ( not ( = ?auto_165912 ?auto_165908 ) ) ( not ( = ?auto_165912 ?auto_165909 ) ) ( not ( = ?auto_165912 ?auto_165910 ) ) ( not ( = ?auto_165911 ?auto_165906 ) ) ( not ( = ?auto_165911 ?auto_165908 ) ) ( not ( = ?auto_165911 ?auto_165909 ) ) ( not ( = ?auto_165911 ?auto_165910 ) ) ( ON ?auto_165907 ?auto_165911 ) ( ON ?auto_165906 ?auto_165907 ) ( ON ?auto_165910 ?auto_165906 ) ( CLEAR ?auto_165910 ) ( HOLDING ?auto_165909 ) ( CLEAR ?auto_165908 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_165908 ?auto_165909 )
      ( MAKE-1PILE ?auto_165905 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_165913 - BLOCK
    )
    :vars
    (
      ?auto_165918 - BLOCK
      ?auto_165917 - BLOCK
      ?auto_165914 - BLOCK
      ?auto_165916 - BLOCK
      ?auto_165915 - BLOCK
      ?auto_165919 - BLOCK
      ?auto_165920 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_165918 ?auto_165913 ) ( ON-TABLE ?auto_165913 ) ( not ( = ?auto_165913 ?auto_165918 ) ) ( not ( = ?auto_165913 ?auto_165917 ) ) ( not ( = ?auto_165913 ?auto_165914 ) ) ( not ( = ?auto_165918 ?auto_165917 ) ) ( not ( = ?auto_165918 ?auto_165914 ) ) ( not ( = ?auto_165917 ?auto_165914 ) ) ( ON ?auto_165917 ?auto_165918 ) ( ON-TABLE ?auto_165916 ) ( not ( = ?auto_165916 ?auto_165915 ) ) ( not ( = ?auto_165916 ?auto_165919 ) ) ( not ( = ?auto_165916 ?auto_165920 ) ) ( not ( = ?auto_165916 ?auto_165914 ) ) ( not ( = ?auto_165915 ?auto_165919 ) ) ( not ( = ?auto_165915 ?auto_165920 ) ) ( not ( = ?auto_165915 ?auto_165914 ) ) ( not ( = ?auto_165919 ?auto_165920 ) ) ( not ( = ?auto_165919 ?auto_165914 ) ) ( not ( = ?auto_165920 ?auto_165914 ) ) ( not ( = ?auto_165913 ?auto_165920 ) ) ( not ( = ?auto_165913 ?auto_165916 ) ) ( not ( = ?auto_165913 ?auto_165915 ) ) ( not ( = ?auto_165913 ?auto_165919 ) ) ( not ( = ?auto_165918 ?auto_165920 ) ) ( not ( = ?auto_165918 ?auto_165916 ) ) ( not ( = ?auto_165918 ?auto_165915 ) ) ( not ( = ?auto_165918 ?auto_165919 ) ) ( not ( = ?auto_165917 ?auto_165920 ) ) ( not ( = ?auto_165917 ?auto_165916 ) ) ( not ( = ?auto_165917 ?auto_165915 ) ) ( not ( = ?auto_165917 ?auto_165919 ) ) ( ON ?auto_165914 ?auto_165917 ) ( ON ?auto_165920 ?auto_165914 ) ( ON ?auto_165919 ?auto_165920 ) ( CLEAR ?auto_165916 ) ( ON ?auto_165915 ?auto_165919 ) ( CLEAR ?auto_165915 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_165913 ?auto_165918 ?auto_165917 ?auto_165914 ?auto_165920 ?auto_165919 )
      ( MAKE-1PILE ?auto_165913 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_165921 - BLOCK
    )
    :vars
    (
      ?auto_165923 - BLOCK
      ?auto_165924 - BLOCK
      ?auto_165928 - BLOCK
      ?auto_165925 - BLOCK
      ?auto_165922 - BLOCK
      ?auto_165926 - BLOCK
      ?auto_165927 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_165923 ?auto_165921 ) ( ON-TABLE ?auto_165921 ) ( not ( = ?auto_165921 ?auto_165923 ) ) ( not ( = ?auto_165921 ?auto_165924 ) ) ( not ( = ?auto_165921 ?auto_165928 ) ) ( not ( = ?auto_165923 ?auto_165924 ) ) ( not ( = ?auto_165923 ?auto_165928 ) ) ( not ( = ?auto_165924 ?auto_165928 ) ) ( ON ?auto_165924 ?auto_165923 ) ( not ( = ?auto_165925 ?auto_165922 ) ) ( not ( = ?auto_165925 ?auto_165926 ) ) ( not ( = ?auto_165925 ?auto_165927 ) ) ( not ( = ?auto_165925 ?auto_165928 ) ) ( not ( = ?auto_165922 ?auto_165926 ) ) ( not ( = ?auto_165922 ?auto_165927 ) ) ( not ( = ?auto_165922 ?auto_165928 ) ) ( not ( = ?auto_165926 ?auto_165927 ) ) ( not ( = ?auto_165926 ?auto_165928 ) ) ( not ( = ?auto_165927 ?auto_165928 ) ) ( not ( = ?auto_165921 ?auto_165927 ) ) ( not ( = ?auto_165921 ?auto_165925 ) ) ( not ( = ?auto_165921 ?auto_165922 ) ) ( not ( = ?auto_165921 ?auto_165926 ) ) ( not ( = ?auto_165923 ?auto_165927 ) ) ( not ( = ?auto_165923 ?auto_165925 ) ) ( not ( = ?auto_165923 ?auto_165922 ) ) ( not ( = ?auto_165923 ?auto_165926 ) ) ( not ( = ?auto_165924 ?auto_165927 ) ) ( not ( = ?auto_165924 ?auto_165925 ) ) ( not ( = ?auto_165924 ?auto_165922 ) ) ( not ( = ?auto_165924 ?auto_165926 ) ) ( ON ?auto_165928 ?auto_165924 ) ( ON ?auto_165927 ?auto_165928 ) ( ON ?auto_165926 ?auto_165927 ) ( ON ?auto_165922 ?auto_165926 ) ( CLEAR ?auto_165922 ) ( HOLDING ?auto_165925 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_165925 )
      ( MAKE-1PILE ?auto_165921 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_165929 - BLOCK
    )
    :vars
    (
      ?auto_165932 - BLOCK
      ?auto_165930 - BLOCK
      ?auto_165936 - BLOCK
      ?auto_165931 - BLOCK
      ?auto_165934 - BLOCK
      ?auto_165935 - BLOCK
      ?auto_165933 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_165932 ?auto_165929 ) ( ON-TABLE ?auto_165929 ) ( not ( = ?auto_165929 ?auto_165932 ) ) ( not ( = ?auto_165929 ?auto_165930 ) ) ( not ( = ?auto_165929 ?auto_165936 ) ) ( not ( = ?auto_165932 ?auto_165930 ) ) ( not ( = ?auto_165932 ?auto_165936 ) ) ( not ( = ?auto_165930 ?auto_165936 ) ) ( ON ?auto_165930 ?auto_165932 ) ( not ( = ?auto_165931 ?auto_165934 ) ) ( not ( = ?auto_165931 ?auto_165935 ) ) ( not ( = ?auto_165931 ?auto_165933 ) ) ( not ( = ?auto_165931 ?auto_165936 ) ) ( not ( = ?auto_165934 ?auto_165935 ) ) ( not ( = ?auto_165934 ?auto_165933 ) ) ( not ( = ?auto_165934 ?auto_165936 ) ) ( not ( = ?auto_165935 ?auto_165933 ) ) ( not ( = ?auto_165935 ?auto_165936 ) ) ( not ( = ?auto_165933 ?auto_165936 ) ) ( not ( = ?auto_165929 ?auto_165933 ) ) ( not ( = ?auto_165929 ?auto_165931 ) ) ( not ( = ?auto_165929 ?auto_165934 ) ) ( not ( = ?auto_165929 ?auto_165935 ) ) ( not ( = ?auto_165932 ?auto_165933 ) ) ( not ( = ?auto_165932 ?auto_165931 ) ) ( not ( = ?auto_165932 ?auto_165934 ) ) ( not ( = ?auto_165932 ?auto_165935 ) ) ( not ( = ?auto_165930 ?auto_165933 ) ) ( not ( = ?auto_165930 ?auto_165931 ) ) ( not ( = ?auto_165930 ?auto_165934 ) ) ( not ( = ?auto_165930 ?auto_165935 ) ) ( ON ?auto_165936 ?auto_165930 ) ( ON ?auto_165933 ?auto_165936 ) ( ON ?auto_165935 ?auto_165933 ) ( ON ?auto_165934 ?auto_165935 ) ( ON ?auto_165931 ?auto_165934 ) ( CLEAR ?auto_165931 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_165929 ?auto_165932 ?auto_165930 ?auto_165936 ?auto_165933 ?auto_165935 ?auto_165934 )
      ( MAKE-1PILE ?auto_165929 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_165937 - BLOCK
    )
    :vars
    (
      ?auto_165939 - BLOCK
      ?auto_165944 - BLOCK
      ?auto_165940 - BLOCK
      ?auto_165942 - BLOCK
      ?auto_165941 - BLOCK
      ?auto_165943 - BLOCK
      ?auto_165938 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_165939 ?auto_165937 ) ( ON-TABLE ?auto_165937 ) ( not ( = ?auto_165937 ?auto_165939 ) ) ( not ( = ?auto_165937 ?auto_165944 ) ) ( not ( = ?auto_165937 ?auto_165940 ) ) ( not ( = ?auto_165939 ?auto_165944 ) ) ( not ( = ?auto_165939 ?auto_165940 ) ) ( not ( = ?auto_165944 ?auto_165940 ) ) ( ON ?auto_165944 ?auto_165939 ) ( not ( = ?auto_165942 ?auto_165941 ) ) ( not ( = ?auto_165942 ?auto_165943 ) ) ( not ( = ?auto_165942 ?auto_165938 ) ) ( not ( = ?auto_165942 ?auto_165940 ) ) ( not ( = ?auto_165941 ?auto_165943 ) ) ( not ( = ?auto_165941 ?auto_165938 ) ) ( not ( = ?auto_165941 ?auto_165940 ) ) ( not ( = ?auto_165943 ?auto_165938 ) ) ( not ( = ?auto_165943 ?auto_165940 ) ) ( not ( = ?auto_165938 ?auto_165940 ) ) ( not ( = ?auto_165937 ?auto_165938 ) ) ( not ( = ?auto_165937 ?auto_165942 ) ) ( not ( = ?auto_165937 ?auto_165941 ) ) ( not ( = ?auto_165937 ?auto_165943 ) ) ( not ( = ?auto_165939 ?auto_165938 ) ) ( not ( = ?auto_165939 ?auto_165942 ) ) ( not ( = ?auto_165939 ?auto_165941 ) ) ( not ( = ?auto_165939 ?auto_165943 ) ) ( not ( = ?auto_165944 ?auto_165938 ) ) ( not ( = ?auto_165944 ?auto_165942 ) ) ( not ( = ?auto_165944 ?auto_165941 ) ) ( not ( = ?auto_165944 ?auto_165943 ) ) ( ON ?auto_165940 ?auto_165944 ) ( ON ?auto_165938 ?auto_165940 ) ( ON ?auto_165943 ?auto_165938 ) ( ON ?auto_165941 ?auto_165943 ) ( HOLDING ?auto_165942 ) ( CLEAR ?auto_165941 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_165937 ?auto_165939 ?auto_165944 ?auto_165940 ?auto_165938 ?auto_165943 ?auto_165941 ?auto_165942 )
      ( MAKE-1PILE ?auto_165937 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_165945 - BLOCK
    )
    :vars
    (
      ?auto_165947 - BLOCK
      ?auto_165952 - BLOCK
      ?auto_165948 - BLOCK
      ?auto_165951 - BLOCK
      ?auto_165950 - BLOCK
      ?auto_165946 - BLOCK
      ?auto_165949 - BLOCK
      ?auto_165953 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_165947 ?auto_165945 ) ( ON-TABLE ?auto_165945 ) ( not ( = ?auto_165945 ?auto_165947 ) ) ( not ( = ?auto_165945 ?auto_165952 ) ) ( not ( = ?auto_165945 ?auto_165948 ) ) ( not ( = ?auto_165947 ?auto_165952 ) ) ( not ( = ?auto_165947 ?auto_165948 ) ) ( not ( = ?auto_165952 ?auto_165948 ) ) ( ON ?auto_165952 ?auto_165947 ) ( not ( = ?auto_165951 ?auto_165950 ) ) ( not ( = ?auto_165951 ?auto_165946 ) ) ( not ( = ?auto_165951 ?auto_165949 ) ) ( not ( = ?auto_165951 ?auto_165948 ) ) ( not ( = ?auto_165950 ?auto_165946 ) ) ( not ( = ?auto_165950 ?auto_165949 ) ) ( not ( = ?auto_165950 ?auto_165948 ) ) ( not ( = ?auto_165946 ?auto_165949 ) ) ( not ( = ?auto_165946 ?auto_165948 ) ) ( not ( = ?auto_165949 ?auto_165948 ) ) ( not ( = ?auto_165945 ?auto_165949 ) ) ( not ( = ?auto_165945 ?auto_165951 ) ) ( not ( = ?auto_165945 ?auto_165950 ) ) ( not ( = ?auto_165945 ?auto_165946 ) ) ( not ( = ?auto_165947 ?auto_165949 ) ) ( not ( = ?auto_165947 ?auto_165951 ) ) ( not ( = ?auto_165947 ?auto_165950 ) ) ( not ( = ?auto_165947 ?auto_165946 ) ) ( not ( = ?auto_165952 ?auto_165949 ) ) ( not ( = ?auto_165952 ?auto_165951 ) ) ( not ( = ?auto_165952 ?auto_165950 ) ) ( not ( = ?auto_165952 ?auto_165946 ) ) ( ON ?auto_165948 ?auto_165952 ) ( ON ?auto_165949 ?auto_165948 ) ( ON ?auto_165946 ?auto_165949 ) ( ON ?auto_165950 ?auto_165946 ) ( CLEAR ?auto_165950 ) ( ON ?auto_165951 ?auto_165953 ) ( CLEAR ?auto_165951 ) ( HAND-EMPTY ) ( not ( = ?auto_165945 ?auto_165953 ) ) ( not ( = ?auto_165947 ?auto_165953 ) ) ( not ( = ?auto_165952 ?auto_165953 ) ) ( not ( = ?auto_165948 ?auto_165953 ) ) ( not ( = ?auto_165951 ?auto_165953 ) ) ( not ( = ?auto_165950 ?auto_165953 ) ) ( not ( = ?auto_165946 ?auto_165953 ) ) ( not ( = ?auto_165949 ?auto_165953 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_165951 ?auto_165953 )
      ( MAKE-1PILE ?auto_165945 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_165954 - BLOCK
    )
    :vars
    (
      ?auto_165961 - BLOCK
      ?auto_165960 - BLOCK
      ?auto_165958 - BLOCK
      ?auto_165962 - BLOCK
      ?auto_165956 - BLOCK
      ?auto_165955 - BLOCK
      ?auto_165957 - BLOCK
      ?auto_165959 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_165961 ?auto_165954 ) ( ON-TABLE ?auto_165954 ) ( not ( = ?auto_165954 ?auto_165961 ) ) ( not ( = ?auto_165954 ?auto_165960 ) ) ( not ( = ?auto_165954 ?auto_165958 ) ) ( not ( = ?auto_165961 ?auto_165960 ) ) ( not ( = ?auto_165961 ?auto_165958 ) ) ( not ( = ?auto_165960 ?auto_165958 ) ) ( ON ?auto_165960 ?auto_165961 ) ( not ( = ?auto_165962 ?auto_165956 ) ) ( not ( = ?auto_165962 ?auto_165955 ) ) ( not ( = ?auto_165962 ?auto_165957 ) ) ( not ( = ?auto_165962 ?auto_165958 ) ) ( not ( = ?auto_165956 ?auto_165955 ) ) ( not ( = ?auto_165956 ?auto_165957 ) ) ( not ( = ?auto_165956 ?auto_165958 ) ) ( not ( = ?auto_165955 ?auto_165957 ) ) ( not ( = ?auto_165955 ?auto_165958 ) ) ( not ( = ?auto_165957 ?auto_165958 ) ) ( not ( = ?auto_165954 ?auto_165957 ) ) ( not ( = ?auto_165954 ?auto_165962 ) ) ( not ( = ?auto_165954 ?auto_165956 ) ) ( not ( = ?auto_165954 ?auto_165955 ) ) ( not ( = ?auto_165961 ?auto_165957 ) ) ( not ( = ?auto_165961 ?auto_165962 ) ) ( not ( = ?auto_165961 ?auto_165956 ) ) ( not ( = ?auto_165961 ?auto_165955 ) ) ( not ( = ?auto_165960 ?auto_165957 ) ) ( not ( = ?auto_165960 ?auto_165962 ) ) ( not ( = ?auto_165960 ?auto_165956 ) ) ( not ( = ?auto_165960 ?auto_165955 ) ) ( ON ?auto_165958 ?auto_165960 ) ( ON ?auto_165957 ?auto_165958 ) ( ON ?auto_165955 ?auto_165957 ) ( ON ?auto_165962 ?auto_165959 ) ( CLEAR ?auto_165962 ) ( not ( = ?auto_165954 ?auto_165959 ) ) ( not ( = ?auto_165961 ?auto_165959 ) ) ( not ( = ?auto_165960 ?auto_165959 ) ) ( not ( = ?auto_165958 ?auto_165959 ) ) ( not ( = ?auto_165962 ?auto_165959 ) ) ( not ( = ?auto_165956 ?auto_165959 ) ) ( not ( = ?auto_165955 ?auto_165959 ) ) ( not ( = ?auto_165957 ?auto_165959 ) ) ( HOLDING ?auto_165956 ) ( CLEAR ?auto_165955 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_165954 ?auto_165961 ?auto_165960 ?auto_165958 ?auto_165957 ?auto_165955 ?auto_165956 )
      ( MAKE-1PILE ?auto_165954 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_165963 - BLOCK
    )
    :vars
    (
      ?auto_165969 - BLOCK
      ?auto_165967 - BLOCK
      ?auto_165965 - BLOCK
      ?auto_165971 - BLOCK
      ?auto_165968 - BLOCK
      ?auto_165964 - BLOCK
      ?auto_165970 - BLOCK
      ?auto_165966 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_165969 ?auto_165963 ) ( ON-TABLE ?auto_165963 ) ( not ( = ?auto_165963 ?auto_165969 ) ) ( not ( = ?auto_165963 ?auto_165967 ) ) ( not ( = ?auto_165963 ?auto_165965 ) ) ( not ( = ?auto_165969 ?auto_165967 ) ) ( not ( = ?auto_165969 ?auto_165965 ) ) ( not ( = ?auto_165967 ?auto_165965 ) ) ( ON ?auto_165967 ?auto_165969 ) ( not ( = ?auto_165971 ?auto_165968 ) ) ( not ( = ?auto_165971 ?auto_165964 ) ) ( not ( = ?auto_165971 ?auto_165970 ) ) ( not ( = ?auto_165971 ?auto_165965 ) ) ( not ( = ?auto_165968 ?auto_165964 ) ) ( not ( = ?auto_165968 ?auto_165970 ) ) ( not ( = ?auto_165968 ?auto_165965 ) ) ( not ( = ?auto_165964 ?auto_165970 ) ) ( not ( = ?auto_165964 ?auto_165965 ) ) ( not ( = ?auto_165970 ?auto_165965 ) ) ( not ( = ?auto_165963 ?auto_165970 ) ) ( not ( = ?auto_165963 ?auto_165971 ) ) ( not ( = ?auto_165963 ?auto_165968 ) ) ( not ( = ?auto_165963 ?auto_165964 ) ) ( not ( = ?auto_165969 ?auto_165970 ) ) ( not ( = ?auto_165969 ?auto_165971 ) ) ( not ( = ?auto_165969 ?auto_165968 ) ) ( not ( = ?auto_165969 ?auto_165964 ) ) ( not ( = ?auto_165967 ?auto_165970 ) ) ( not ( = ?auto_165967 ?auto_165971 ) ) ( not ( = ?auto_165967 ?auto_165968 ) ) ( not ( = ?auto_165967 ?auto_165964 ) ) ( ON ?auto_165965 ?auto_165967 ) ( ON ?auto_165970 ?auto_165965 ) ( ON ?auto_165964 ?auto_165970 ) ( ON ?auto_165971 ?auto_165966 ) ( not ( = ?auto_165963 ?auto_165966 ) ) ( not ( = ?auto_165969 ?auto_165966 ) ) ( not ( = ?auto_165967 ?auto_165966 ) ) ( not ( = ?auto_165965 ?auto_165966 ) ) ( not ( = ?auto_165971 ?auto_165966 ) ) ( not ( = ?auto_165968 ?auto_165966 ) ) ( not ( = ?auto_165964 ?auto_165966 ) ) ( not ( = ?auto_165970 ?auto_165966 ) ) ( CLEAR ?auto_165964 ) ( ON ?auto_165968 ?auto_165971 ) ( CLEAR ?auto_165968 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_165966 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_165966 ?auto_165971 )
      ( MAKE-1PILE ?auto_165963 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_165972 - BLOCK
    )
    :vars
    (
      ?auto_165974 - BLOCK
      ?auto_165977 - BLOCK
      ?auto_165980 - BLOCK
      ?auto_165979 - BLOCK
      ?auto_165976 - BLOCK
      ?auto_165975 - BLOCK
      ?auto_165973 - BLOCK
      ?auto_165978 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_165974 ?auto_165972 ) ( ON-TABLE ?auto_165972 ) ( not ( = ?auto_165972 ?auto_165974 ) ) ( not ( = ?auto_165972 ?auto_165977 ) ) ( not ( = ?auto_165972 ?auto_165980 ) ) ( not ( = ?auto_165974 ?auto_165977 ) ) ( not ( = ?auto_165974 ?auto_165980 ) ) ( not ( = ?auto_165977 ?auto_165980 ) ) ( ON ?auto_165977 ?auto_165974 ) ( not ( = ?auto_165979 ?auto_165976 ) ) ( not ( = ?auto_165979 ?auto_165975 ) ) ( not ( = ?auto_165979 ?auto_165973 ) ) ( not ( = ?auto_165979 ?auto_165980 ) ) ( not ( = ?auto_165976 ?auto_165975 ) ) ( not ( = ?auto_165976 ?auto_165973 ) ) ( not ( = ?auto_165976 ?auto_165980 ) ) ( not ( = ?auto_165975 ?auto_165973 ) ) ( not ( = ?auto_165975 ?auto_165980 ) ) ( not ( = ?auto_165973 ?auto_165980 ) ) ( not ( = ?auto_165972 ?auto_165973 ) ) ( not ( = ?auto_165972 ?auto_165979 ) ) ( not ( = ?auto_165972 ?auto_165976 ) ) ( not ( = ?auto_165972 ?auto_165975 ) ) ( not ( = ?auto_165974 ?auto_165973 ) ) ( not ( = ?auto_165974 ?auto_165979 ) ) ( not ( = ?auto_165974 ?auto_165976 ) ) ( not ( = ?auto_165974 ?auto_165975 ) ) ( not ( = ?auto_165977 ?auto_165973 ) ) ( not ( = ?auto_165977 ?auto_165979 ) ) ( not ( = ?auto_165977 ?auto_165976 ) ) ( not ( = ?auto_165977 ?auto_165975 ) ) ( ON ?auto_165980 ?auto_165977 ) ( ON ?auto_165973 ?auto_165980 ) ( ON ?auto_165979 ?auto_165978 ) ( not ( = ?auto_165972 ?auto_165978 ) ) ( not ( = ?auto_165974 ?auto_165978 ) ) ( not ( = ?auto_165977 ?auto_165978 ) ) ( not ( = ?auto_165980 ?auto_165978 ) ) ( not ( = ?auto_165979 ?auto_165978 ) ) ( not ( = ?auto_165976 ?auto_165978 ) ) ( not ( = ?auto_165975 ?auto_165978 ) ) ( not ( = ?auto_165973 ?auto_165978 ) ) ( ON ?auto_165976 ?auto_165979 ) ( CLEAR ?auto_165976 ) ( ON-TABLE ?auto_165978 ) ( HOLDING ?auto_165975 ) ( CLEAR ?auto_165973 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_165972 ?auto_165974 ?auto_165977 ?auto_165980 ?auto_165973 ?auto_165975 )
      ( MAKE-1PILE ?auto_165972 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_165981 - BLOCK
    )
    :vars
    (
      ?auto_165983 - BLOCK
      ?auto_165989 - BLOCK
      ?auto_165985 - BLOCK
      ?auto_165988 - BLOCK
      ?auto_165986 - BLOCK
      ?auto_165984 - BLOCK
      ?auto_165987 - BLOCK
      ?auto_165982 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_165983 ?auto_165981 ) ( ON-TABLE ?auto_165981 ) ( not ( = ?auto_165981 ?auto_165983 ) ) ( not ( = ?auto_165981 ?auto_165989 ) ) ( not ( = ?auto_165981 ?auto_165985 ) ) ( not ( = ?auto_165983 ?auto_165989 ) ) ( not ( = ?auto_165983 ?auto_165985 ) ) ( not ( = ?auto_165989 ?auto_165985 ) ) ( ON ?auto_165989 ?auto_165983 ) ( not ( = ?auto_165988 ?auto_165986 ) ) ( not ( = ?auto_165988 ?auto_165984 ) ) ( not ( = ?auto_165988 ?auto_165987 ) ) ( not ( = ?auto_165988 ?auto_165985 ) ) ( not ( = ?auto_165986 ?auto_165984 ) ) ( not ( = ?auto_165986 ?auto_165987 ) ) ( not ( = ?auto_165986 ?auto_165985 ) ) ( not ( = ?auto_165984 ?auto_165987 ) ) ( not ( = ?auto_165984 ?auto_165985 ) ) ( not ( = ?auto_165987 ?auto_165985 ) ) ( not ( = ?auto_165981 ?auto_165987 ) ) ( not ( = ?auto_165981 ?auto_165988 ) ) ( not ( = ?auto_165981 ?auto_165986 ) ) ( not ( = ?auto_165981 ?auto_165984 ) ) ( not ( = ?auto_165983 ?auto_165987 ) ) ( not ( = ?auto_165983 ?auto_165988 ) ) ( not ( = ?auto_165983 ?auto_165986 ) ) ( not ( = ?auto_165983 ?auto_165984 ) ) ( not ( = ?auto_165989 ?auto_165987 ) ) ( not ( = ?auto_165989 ?auto_165988 ) ) ( not ( = ?auto_165989 ?auto_165986 ) ) ( not ( = ?auto_165989 ?auto_165984 ) ) ( ON ?auto_165985 ?auto_165989 ) ( ON ?auto_165987 ?auto_165985 ) ( ON ?auto_165988 ?auto_165982 ) ( not ( = ?auto_165981 ?auto_165982 ) ) ( not ( = ?auto_165983 ?auto_165982 ) ) ( not ( = ?auto_165989 ?auto_165982 ) ) ( not ( = ?auto_165985 ?auto_165982 ) ) ( not ( = ?auto_165988 ?auto_165982 ) ) ( not ( = ?auto_165986 ?auto_165982 ) ) ( not ( = ?auto_165984 ?auto_165982 ) ) ( not ( = ?auto_165987 ?auto_165982 ) ) ( ON ?auto_165986 ?auto_165988 ) ( ON-TABLE ?auto_165982 ) ( CLEAR ?auto_165987 ) ( ON ?auto_165984 ?auto_165986 ) ( CLEAR ?auto_165984 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_165982 ?auto_165988 ?auto_165986 )
      ( MAKE-1PILE ?auto_165981 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_165990 - BLOCK
    )
    :vars
    (
      ?auto_165992 - BLOCK
      ?auto_165998 - BLOCK
      ?auto_165994 - BLOCK
      ?auto_165991 - BLOCK
      ?auto_165993 - BLOCK
      ?auto_165996 - BLOCK
      ?auto_165995 - BLOCK
      ?auto_165997 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_165992 ?auto_165990 ) ( ON-TABLE ?auto_165990 ) ( not ( = ?auto_165990 ?auto_165992 ) ) ( not ( = ?auto_165990 ?auto_165998 ) ) ( not ( = ?auto_165990 ?auto_165994 ) ) ( not ( = ?auto_165992 ?auto_165998 ) ) ( not ( = ?auto_165992 ?auto_165994 ) ) ( not ( = ?auto_165998 ?auto_165994 ) ) ( ON ?auto_165998 ?auto_165992 ) ( not ( = ?auto_165991 ?auto_165993 ) ) ( not ( = ?auto_165991 ?auto_165996 ) ) ( not ( = ?auto_165991 ?auto_165995 ) ) ( not ( = ?auto_165991 ?auto_165994 ) ) ( not ( = ?auto_165993 ?auto_165996 ) ) ( not ( = ?auto_165993 ?auto_165995 ) ) ( not ( = ?auto_165993 ?auto_165994 ) ) ( not ( = ?auto_165996 ?auto_165995 ) ) ( not ( = ?auto_165996 ?auto_165994 ) ) ( not ( = ?auto_165995 ?auto_165994 ) ) ( not ( = ?auto_165990 ?auto_165995 ) ) ( not ( = ?auto_165990 ?auto_165991 ) ) ( not ( = ?auto_165990 ?auto_165993 ) ) ( not ( = ?auto_165990 ?auto_165996 ) ) ( not ( = ?auto_165992 ?auto_165995 ) ) ( not ( = ?auto_165992 ?auto_165991 ) ) ( not ( = ?auto_165992 ?auto_165993 ) ) ( not ( = ?auto_165992 ?auto_165996 ) ) ( not ( = ?auto_165998 ?auto_165995 ) ) ( not ( = ?auto_165998 ?auto_165991 ) ) ( not ( = ?auto_165998 ?auto_165993 ) ) ( not ( = ?auto_165998 ?auto_165996 ) ) ( ON ?auto_165994 ?auto_165998 ) ( ON ?auto_165991 ?auto_165997 ) ( not ( = ?auto_165990 ?auto_165997 ) ) ( not ( = ?auto_165992 ?auto_165997 ) ) ( not ( = ?auto_165998 ?auto_165997 ) ) ( not ( = ?auto_165994 ?auto_165997 ) ) ( not ( = ?auto_165991 ?auto_165997 ) ) ( not ( = ?auto_165993 ?auto_165997 ) ) ( not ( = ?auto_165996 ?auto_165997 ) ) ( not ( = ?auto_165995 ?auto_165997 ) ) ( ON ?auto_165993 ?auto_165991 ) ( ON-TABLE ?auto_165997 ) ( ON ?auto_165996 ?auto_165993 ) ( CLEAR ?auto_165996 ) ( HOLDING ?auto_165995 ) ( CLEAR ?auto_165994 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_165990 ?auto_165992 ?auto_165998 ?auto_165994 ?auto_165995 )
      ( MAKE-1PILE ?auto_165990 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_165999 - BLOCK
    )
    :vars
    (
      ?auto_166003 - BLOCK
      ?auto_166006 - BLOCK
      ?auto_166000 - BLOCK
      ?auto_166007 - BLOCK
      ?auto_166005 - BLOCK
      ?auto_166002 - BLOCK
      ?auto_166001 - BLOCK
      ?auto_166004 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_166003 ?auto_165999 ) ( ON-TABLE ?auto_165999 ) ( not ( = ?auto_165999 ?auto_166003 ) ) ( not ( = ?auto_165999 ?auto_166006 ) ) ( not ( = ?auto_165999 ?auto_166000 ) ) ( not ( = ?auto_166003 ?auto_166006 ) ) ( not ( = ?auto_166003 ?auto_166000 ) ) ( not ( = ?auto_166006 ?auto_166000 ) ) ( ON ?auto_166006 ?auto_166003 ) ( not ( = ?auto_166007 ?auto_166005 ) ) ( not ( = ?auto_166007 ?auto_166002 ) ) ( not ( = ?auto_166007 ?auto_166001 ) ) ( not ( = ?auto_166007 ?auto_166000 ) ) ( not ( = ?auto_166005 ?auto_166002 ) ) ( not ( = ?auto_166005 ?auto_166001 ) ) ( not ( = ?auto_166005 ?auto_166000 ) ) ( not ( = ?auto_166002 ?auto_166001 ) ) ( not ( = ?auto_166002 ?auto_166000 ) ) ( not ( = ?auto_166001 ?auto_166000 ) ) ( not ( = ?auto_165999 ?auto_166001 ) ) ( not ( = ?auto_165999 ?auto_166007 ) ) ( not ( = ?auto_165999 ?auto_166005 ) ) ( not ( = ?auto_165999 ?auto_166002 ) ) ( not ( = ?auto_166003 ?auto_166001 ) ) ( not ( = ?auto_166003 ?auto_166007 ) ) ( not ( = ?auto_166003 ?auto_166005 ) ) ( not ( = ?auto_166003 ?auto_166002 ) ) ( not ( = ?auto_166006 ?auto_166001 ) ) ( not ( = ?auto_166006 ?auto_166007 ) ) ( not ( = ?auto_166006 ?auto_166005 ) ) ( not ( = ?auto_166006 ?auto_166002 ) ) ( ON ?auto_166000 ?auto_166006 ) ( ON ?auto_166007 ?auto_166004 ) ( not ( = ?auto_165999 ?auto_166004 ) ) ( not ( = ?auto_166003 ?auto_166004 ) ) ( not ( = ?auto_166006 ?auto_166004 ) ) ( not ( = ?auto_166000 ?auto_166004 ) ) ( not ( = ?auto_166007 ?auto_166004 ) ) ( not ( = ?auto_166005 ?auto_166004 ) ) ( not ( = ?auto_166002 ?auto_166004 ) ) ( not ( = ?auto_166001 ?auto_166004 ) ) ( ON ?auto_166005 ?auto_166007 ) ( ON-TABLE ?auto_166004 ) ( ON ?auto_166002 ?auto_166005 ) ( CLEAR ?auto_166000 ) ( ON ?auto_166001 ?auto_166002 ) ( CLEAR ?auto_166001 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_166004 ?auto_166007 ?auto_166005 ?auto_166002 )
      ( MAKE-1PILE ?auto_165999 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_166008 - BLOCK
    )
    :vars
    (
      ?auto_166012 - BLOCK
      ?auto_166013 - BLOCK
      ?auto_166015 - BLOCK
      ?auto_166014 - BLOCK
      ?auto_166010 - BLOCK
      ?auto_166009 - BLOCK
      ?auto_166011 - BLOCK
      ?auto_166016 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_166012 ?auto_166008 ) ( ON-TABLE ?auto_166008 ) ( not ( = ?auto_166008 ?auto_166012 ) ) ( not ( = ?auto_166008 ?auto_166013 ) ) ( not ( = ?auto_166008 ?auto_166015 ) ) ( not ( = ?auto_166012 ?auto_166013 ) ) ( not ( = ?auto_166012 ?auto_166015 ) ) ( not ( = ?auto_166013 ?auto_166015 ) ) ( ON ?auto_166013 ?auto_166012 ) ( not ( = ?auto_166014 ?auto_166010 ) ) ( not ( = ?auto_166014 ?auto_166009 ) ) ( not ( = ?auto_166014 ?auto_166011 ) ) ( not ( = ?auto_166014 ?auto_166015 ) ) ( not ( = ?auto_166010 ?auto_166009 ) ) ( not ( = ?auto_166010 ?auto_166011 ) ) ( not ( = ?auto_166010 ?auto_166015 ) ) ( not ( = ?auto_166009 ?auto_166011 ) ) ( not ( = ?auto_166009 ?auto_166015 ) ) ( not ( = ?auto_166011 ?auto_166015 ) ) ( not ( = ?auto_166008 ?auto_166011 ) ) ( not ( = ?auto_166008 ?auto_166014 ) ) ( not ( = ?auto_166008 ?auto_166010 ) ) ( not ( = ?auto_166008 ?auto_166009 ) ) ( not ( = ?auto_166012 ?auto_166011 ) ) ( not ( = ?auto_166012 ?auto_166014 ) ) ( not ( = ?auto_166012 ?auto_166010 ) ) ( not ( = ?auto_166012 ?auto_166009 ) ) ( not ( = ?auto_166013 ?auto_166011 ) ) ( not ( = ?auto_166013 ?auto_166014 ) ) ( not ( = ?auto_166013 ?auto_166010 ) ) ( not ( = ?auto_166013 ?auto_166009 ) ) ( ON ?auto_166014 ?auto_166016 ) ( not ( = ?auto_166008 ?auto_166016 ) ) ( not ( = ?auto_166012 ?auto_166016 ) ) ( not ( = ?auto_166013 ?auto_166016 ) ) ( not ( = ?auto_166015 ?auto_166016 ) ) ( not ( = ?auto_166014 ?auto_166016 ) ) ( not ( = ?auto_166010 ?auto_166016 ) ) ( not ( = ?auto_166009 ?auto_166016 ) ) ( not ( = ?auto_166011 ?auto_166016 ) ) ( ON ?auto_166010 ?auto_166014 ) ( ON-TABLE ?auto_166016 ) ( ON ?auto_166009 ?auto_166010 ) ( ON ?auto_166011 ?auto_166009 ) ( CLEAR ?auto_166011 ) ( HOLDING ?auto_166015 ) ( CLEAR ?auto_166013 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_166008 ?auto_166012 ?auto_166013 ?auto_166015 )
      ( MAKE-1PILE ?auto_166008 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_166017 - BLOCK
    )
    :vars
    (
      ?auto_166019 - BLOCK
      ?auto_166024 - BLOCK
      ?auto_166023 - BLOCK
      ?auto_166021 - BLOCK
      ?auto_166018 - BLOCK
      ?auto_166022 - BLOCK
      ?auto_166020 - BLOCK
      ?auto_166025 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_166019 ?auto_166017 ) ( ON-TABLE ?auto_166017 ) ( not ( = ?auto_166017 ?auto_166019 ) ) ( not ( = ?auto_166017 ?auto_166024 ) ) ( not ( = ?auto_166017 ?auto_166023 ) ) ( not ( = ?auto_166019 ?auto_166024 ) ) ( not ( = ?auto_166019 ?auto_166023 ) ) ( not ( = ?auto_166024 ?auto_166023 ) ) ( ON ?auto_166024 ?auto_166019 ) ( not ( = ?auto_166021 ?auto_166018 ) ) ( not ( = ?auto_166021 ?auto_166022 ) ) ( not ( = ?auto_166021 ?auto_166020 ) ) ( not ( = ?auto_166021 ?auto_166023 ) ) ( not ( = ?auto_166018 ?auto_166022 ) ) ( not ( = ?auto_166018 ?auto_166020 ) ) ( not ( = ?auto_166018 ?auto_166023 ) ) ( not ( = ?auto_166022 ?auto_166020 ) ) ( not ( = ?auto_166022 ?auto_166023 ) ) ( not ( = ?auto_166020 ?auto_166023 ) ) ( not ( = ?auto_166017 ?auto_166020 ) ) ( not ( = ?auto_166017 ?auto_166021 ) ) ( not ( = ?auto_166017 ?auto_166018 ) ) ( not ( = ?auto_166017 ?auto_166022 ) ) ( not ( = ?auto_166019 ?auto_166020 ) ) ( not ( = ?auto_166019 ?auto_166021 ) ) ( not ( = ?auto_166019 ?auto_166018 ) ) ( not ( = ?auto_166019 ?auto_166022 ) ) ( not ( = ?auto_166024 ?auto_166020 ) ) ( not ( = ?auto_166024 ?auto_166021 ) ) ( not ( = ?auto_166024 ?auto_166018 ) ) ( not ( = ?auto_166024 ?auto_166022 ) ) ( ON ?auto_166021 ?auto_166025 ) ( not ( = ?auto_166017 ?auto_166025 ) ) ( not ( = ?auto_166019 ?auto_166025 ) ) ( not ( = ?auto_166024 ?auto_166025 ) ) ( not ( = ?auto_166023 ?auto_166025 ) ) ( not ( = ?auto_166021 ?auto_166025 ) ) ( not ( = ?auto_166018 ?auto_166025 ) ) ( not ( = ?auto_166022 ?auto_166025 ) ) ( not ( = ?auto_166020 ?auto_166025 ) ) ( ON ?auto_166018 ?auto_166021 ) ( ON-TABLE ?auto_166025 ) ( ON ?auto_166022 ?auto_166018 ) ( ON ?auto_166020 ?auto_166022 ) ( CLEAR ?auto_166024 ) ( ON ?auto_166023 ?auto_166020 ) ( CLEAR ?auto_166023 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_166025 ?auto_166021 ?auto_166018 ?auto_166022 ?auto_166020 )
      ( MAKE-1PILE ?auto_166017 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_166026 - BLOCK
    )
    :vars
    (
      ?auto_166029 - BLOCK
      ?auto_166034 - BLOCK
      ?auto_166033 - BLOCK
      ?auto_166027 - BLOCK
      ?auto_166032 - BLOCK
      ?auto_166028 - BLOCK
      ?auto_166031 - BLOCK
      ?auto_166030 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_166029 ?auto_166026 ) ( ON-TABLE ?auto_166026 ) ( not ( = ?auto_166026 ?auto_166029 ) ) ( not ( = ?auto_166026 ?auto_166034 ) ) ( not ( = ?auto_166026 ?auto_166033 ) ) ( not ( = ?auto_166029 ?auto_166034 ) ) ( not ( = ?auto_166029 ?auto_166033 ) ) ( not ( = ?auto_166034 ?auto_166033 ) ) ( not ( = ?auto_166027 ?auto_166032 ) ) ( not ( = ?auto_166027 ?auto_166028 ) ) ( not ( = ?auto_166027 ?auto_166031 ) ) ( not ( = ?auto_166027 ?auto_166033 ) ) ( not ( = ?auto_166032 ?auto_166028 ) ) ( not ( = ?auto_166032 ?auto_166031 ) ) ( not ( = ?auto_166032 ?auto_166033 ) ) ( not ( = ?auto_166028 ?auto_166031 ) ) ( not ( = ?auto_166028 ?auto_166033 ) ) ( not ( = ?auto_166031 ?auto_166033 ) ) ( not ( = ?auto_166026 ?auto_166031 ) ) ( not ( = ?auto_166026 ?auto_166027 ) ) ( not ( = ?auto_166026 ?auto_166032 ) ) ( not ( = ?auto_166026 ?auto_166028 ) ) ( not ( = ?auto_166029 ?auto_166031 ) ) ( not ( = ?auto_166029 ?auto_166027 ) ) ( not ( = ?auto_166029 ?auto_166032 ) ) ( not ( = ?auto_166029 ?auto_166028 ) ) ( not ( = ?auto_166034 ?auto_166031 ) ) ( not ( = ?auto_166034 ?auto_166027 ) ) ( not ( = ?auto_166034 ?auto_166032 ) ) ( not ( = ?auto_166034 ?auto_166028 ) ) ( ON ?auto_166027 ?auto_166030 ) ( not ( = ?auto_166026 ?auto_166030 ) ) ( not ( = ?auto_166029 ?auto_166030 ) ) ( not ( = ?auto_166034 ?auto_166030 ) ) ( not ( = ?auto_166033 ?auto_166030 ) ) ( not ( = ?auto_166027 ?auto_166030 ) ) ( not ( = ?auto_166032 ?auto_166030 ) ) ( not ( = ?auto_166028 ?auto_166030 ) ) ( not ( = ?auto_166031 ?auto_166030 ) ) ( ON ?auto_166032 ?auto_166027 ) ( ON-TABLE ?auto_166030 ) ( ON ?auto_166028 ?auto_166032 ) ( ON ?auto_166031 ?auto_166028 ) ( ON ?auto_166033 ?auto_166031 ) ( CLEAR ?auto_166033 ) ( HOLDING ?auto_166034 ) ( CLEAR ?auto_166029 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_166026 ?auto_166029 ?auto_166034 )
      ( MAKE-1PILE ?auto_166026 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_166035 - BLOCK
    )
    :vars
    (
      ?auto_166042 - BLOCK
      ?auto_166037 - BLOCK
      ?auto_166036 - BLOCK
      ?auto_166040 - BLOCK
      ?auto_166039 - BLOCK
      ?auto_166043 - BLOCK
      ?auto_166041 - BLOCK
      ?auto_166038 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_166042 ?auto_166035 ) ( ON-TABLE ?auto_166035 ) ( not ( = ?auto_166035 ?auto_166042 ) ) ( not ( = ?auto_166035 ?auto_166037 ) ) ( not ( = ?auto_166035 ?auto_166036 ) ) ( not ( = ?auto_166042 ?auto_166037 ) ) ( not ( = ?auto_166042 ?auto_166036 ) ) ( not ( = ?auto_166037 ?auto_166036 ) ) ( not ( = ?auto_166040 ?auto_166039 ) ) ( not ( = ?auto_166040 ?auto_166043 ) ) ( not ( = ?auto_166040 ?auto_166041 ) ) ( not ( = ?auto_166040 ?auto_166036 ) ) ( not ( = ?auto_166039 ?auto_166043 ) ) ( not ( = ?auto_166039 ?auto_166041 ) ) ( not ( = ?auto_166039 ?auto_166036 ) ) ( not ( = ?auto_166043 ?auto_166041 ) ) ( not ( = ?auto_166043 ?auto_166036 ) ) ( not ( = ?auto_166041 ?auto_166036 ) ) ( not ( = ?auto_166035 ?auto_166041 ) ) ( not ( = ?auto_166035 ?auto_166040 ) ) ( not ( = ?auto_166035 ?auto_166039 ) ) ( not ( = ?auto_166035 ?auto_166043 ) ) ( not ( = ?auto_166042 ?auto_166041 ) ) ( not ( = ?auto_166042 ?auto_166040 ) ) ( not ( = ?auto_166042 ?auto_166039 ) ) ( not ( = ?auto_166042 ?auto_166043 ) ) ( not ( = ?auto_166037 ?auto_166041 ) ) ( not ( = ?auto_166037 ?auto_166040 ) ) ( not ( = ?auto_166037 ?auto_166039 ) ) ( not ( = ?auto_166037 ?auto_166043 ) ) ( ON ?auto_166040 ?auto_166038 ) ( not ( = ?auto_166035 ?auto_166038 ) ) ( not ( = ?auto_166042 ?auto_166038 ) ) ( not ( = ?auto_166037 ?auto_166038 ) ) ( not ( = ?auto_166036 ?auto_166038 ) ) ( not ( = ?auto_166040 ?auto_166038 ) ) ( not ( = ?auto_166039 ?auto_166038 ) ) ( not ( = ?auto_166043 ?auto_166038 ) ) ( not ( = ?auto_166041 ?auto_166038 ) ) ( ON ?auto_166039 ?auto_166040 ) ( ON-TABLE ?auto_166038 ) ( ON ?auto_166043 ?auto_166039 ) ( ON ?auto_166041 ?auto_166043 ) ( ON ?auto_166036 ?auto_166041 ) ( CLEAR ?auto_166042 ) ( ON ?auto_166037 ?auto_166036 ) ( CLEAR ?auto_166037 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_166038 ?auto_166040 ?auto_166039 ?auto_166043 ?auto_166041 ?auto_166036 )
      ( MAKE-1PILE ?auto_166035 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_166062 - BLOCK
    )
    :vars
    (
      ?auto_166067 - BLOCK
      ?auto_166069 - BLOCK
      ?auto_166068 - BLOCK
      ?auto_166063 - BLOCK
      ?auto_166065 - BLOCK
      ?auto_166070 - BLOCK
      ?auto_166064 - BLOCK
      ?auto_166066 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_166062 ?auto_166067 ) ) ( not ( = ?auto_166062 ?auto_166069 ) ) ( not ( = ?auto_166062 ?auto_166068 ) ) ( not ( = ?auto_166067 ?auto_166069 ) ) ( not ( = ?auto_166067 ?auto_166068 ) ) ( not ( = ?auto_166069 ?auto_166068 ) ) ( not ( = ?auto_166063 ?auto_166065 ) ) ( not ( = ?auto_166063 ?auto_166070 ) ) ( not ( = ?auto_166063 ?auto_166064 ) ) ( not ( = ?auto_166063 ?auto_166068 ) ) ( not ( = ?auto_166065 ?auto_166070 ) ) ( not ( = ?auto_166065 ?auto_166064 ) ) ( not ( = ?auto_166065 ?auto_166068 ) ) ( not ( = ?auto_166070 ?auto_166064 ) ) ( not ( = ?auto_166070 ?auto_166068 ) ) ( not ( = ?auto_166064 ?auto_166068 ) ) ( not ( = ?auto_166062 ?auto_166064 ) ) ( not ( = ?auto_166062 ?auto_166063 ) ) ( not ( = ?auto_166062 ?auto_166065 ) ) ( not ( = ?auto_166062 ?auto_166070 ) ) ( not ( = ?auto_166067 ?auto_166064 ) ) ( not ( = ?auto_166067 ?auto_166063 ) ) ( not ( = ?auto_166067 ?auto_166065 ) ) ( not ( = ?auto_166067 ?auto_166070 ) ) ( not ( = ?auto_166069 ?auto_166064 ) ) ( not ( = ?auto_166069 ?auto_166063 ) ) ( not ( = ?auto_166069 ?auto_166065 ) ) ( not ( = ?auto_166069 ?auto_166070 ) ) ( ON ?auto_166063 ?auto_166066 ) ( not ( = ?auto_166062 ?auto_166066 ) ) ( not ( = ?auto_166067 ?auto_166066 ) ) ( not ( = ?auto_166069 ?auto_166066 ) ) ( not ( = ?auto_166068 ?auto_166066 ) ) ( not ( = ?auto_166063 ?auto_166066 ) ) ( not ( = ?auto_166065 ?auto_166066 ) ) ( not ( = ?auto_166070 ?auto_166066 ) ) ( not ( = ?auto_166064 ?auto_166066 ) ) ( ON ?auto_166065 ?auto_166063 ) ( ON-TABLE ?auto_166066 ) ( ON ?auto_166070 ?auto_166065 ) ( ON ?auto_166064 ?auto_166070 ) ( ON ?auto_166068 ?auto_166064 ) ( ON ?auto_166069 ?auto_166068 ) ( ON ?auto_166067 ?auto_166069 ) ( CLEAR ?auto_166067 ) ( HOLDING ?auto_166062 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_166062 ?auto_166067 )
      ( MAKE-1PILE ?auto_166062 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_166071 - BLOCK
    )
    :vars
    (
      ?auto_166076 - BLOCK
      ?auto_166077 - BLOCK
      ?auto_166079 - BLOCK
      ?auto_166075 - BLOCK
      ?auto_166078 - BLOCK
      ?auto_166072 - BLOCK
      ?auto_166074 - BLOCK
      ?auto_166073 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_166071 ?auto_166076 ) ) ( not ( = ?auto_166071 ?auto_166077 ) ) ( not ( = ?auto_166071 ?auto_166079 ) ) ( not ( = ?auto_166076 ?auto_166077 ) ) ( not ( = ?auto_166076 ?auto_166079 ) ) ( not ( = ?auto_166077 ?auto_166079 ) ) ( not ( = ?auto_166075 ?auto_166078 ) ) ( not ( = ?auto_166075 ?auto_166072 ) ) ( not ( = ?auto_166075 ?auto_166074 ) ) ( not ( = ?auto_166075 ?auto_166079 ) ) ( not ( = ?auto_166078 ?auto_166072 ) ) ( not ( = ?auto_166078 ?auto_166074 ) ) ( not ( = ?auto_166078 ?auto_166079 ) ) ( not ( = ?auto_166072 ?auto_166074 ) ) ( not ( = ?auto_166072 ?auto_166079 ) ) ( not ( = ?auto_166074 ?auto_166079 ) ) ( not ( = ?auto_166071 ?auto_166074 ) ) ( not ( = ?auto_166071 ?auto_166075 ) ) ( not ( = ?auto_166071 ?auto_166078 ) ) ( not ( = ?auto_166071 ?auto_166072 ) ) ( not ( = ?auto_166076 ?auto_166074 ) ) ( not ( = ?auto_166076 ?auto_166075 ) ) ( not ( = ?auto_166076 ?auto_166078 ) ) ( not ( = ?auto_166076 ?auto_166072 ) ) ( not ( = ?auto_166077 ?auto_166074 ) ) ( not ( = ?auto_166077 ?auto_166075 ) ) ( not ( = ?auto_166077 ?auto_166078 ) ) ( not ( = ?auto_166077 ?auto_166072 ) ) ( ON ?auto_166075 ?auto_166073 ) ( not ( = ?auto_166071 ?auto_166073 ) ) ( not ( = ?auto_166076 ?auto_166073 ) ) ( not ( = ?auto_166077 ?auto_166073 ) ) ( not ( = ?auto_166079 ?auto_166073 ) ) ( not ( = ?auto_166075 ?auto_166073 ) ) ( not ( = ?auto_166078 ?auto_166073 ) ) ( not ( = ?auto_166072 ?auto_166073 ) ) ( not ( = ?auto_166074 ?auto_166073 ) ) ( ON ?auto_166078 ?auto_166075 ) ( ON-TABLE ?auto_166073 ) ( ON ?auto_166072 ?auto_166078 ) ( ON ?auto_166074 ?auto_166072 ) ( ON ?auto_166079 ?auto_166074 ) ( ON ?auto_166077 ?auto_166079 ) ( ON ?auto_166076 ?auto_166077 ) ( ON ?auto_166071 ?auto_166076 ) ( CLEAR ?auto_166071 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_166073 ?auto_166075 ?auto_166078 ?auto_166072 ?auto_166074 ?auto_166079 ?auto_166077 ?auto_166076 )
      ( MAKE-1PILE ?auto_166071 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_166087 - BLOCK
      ?auto_166088 - BLOCK
      ?auto_166089 - BLOCK
      ?auto_166090 - BLOCK
      ?auto_166091 - BLOCK
      ?auto_166092 - BLOCK
      ?auto_166093 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_166093 ) ( CLEAR ?auto_166092 ) ( ON-TABLE ?auto_166087 ) ( ON ?auto_166088 ?auto_166087 ) ( ON ?auto_166089 ?auto_166088 ) ( ON ?auto_166090 ?auto_166089 ) ( ON ?auto_166091 ?auto_166090 ) ( ON ?auto_166092 ?auto_166091 ) ( not ( = ?auto_166087 ?auto_166088 ) ) ( not ( = ?auto_166087 ?auto_166089 ) ) ( not ( = ?auto_166087 ?auto_166090 ) ) ( not ( = ?auto_166087 ?auto_166091 ) ) ( not ( = ?auto_166087 ?auto_166092 ) ) ( not ( = ?auto_166087 ?auto_166093 ) ) ( not ( = ?auto_166088 ?auto_166089 ) ) ( not ( = ?auto_166088 ?auto_166090 ) ) ( not ( = ?auto_166088 ?auto_166091 ) ) ( not ( = ?auto_166088 ?auto_166092 ) ) ( not ( = ?auto_166088 ?auto_166093 ) ) ( not ( = ?auto_166089 ?auto_166090 ) ) ( not ( = ?auto_166089 ?auto_166091 ) ) ( not ( = ?auto_166089 ?auto_166092 ) ) ( not ( = ?auto_166089 ?auto_166093 ) ) ( not ( = ?auto_166090 ?auto_166091 ) ) ( not ( = ?auto_166090 ?auto_166092 ) ) ( not ( = ?auto_166090 ?auto_166093 ) ) ( not ( = ?auto_166091 ?auto_166092 ) ) ( not ( = ?auto_166091 ?auto_166093 ) ) ( not ( = ?auto_166092 ?auto_166093 ) ) )
    :subtasks
    ( ( !STACK ?auto_166093 ?auto_166092 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_166094 - BLOCK
      ?auto_166095 - BLOCK
      ?auto_166096 - BLOCK
      ?auto_166097 - BLOCK
      ?auto_166098 - BLOCK
      ?auto_166099 - BLOCK
      ?auto_166100 - BLOCK
    )
    :vars
    (
      ?auto_166101 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_166099 ) ( ON-TABLE ?auto_166094 ) ( ON ?auto_166095 ?auto_166094 ) ( ON ?auto_166096 ?auto_166095 ) ( ON ?auto_166097 ?auto_166096 ) ( ON ?auto_166098 ?auto_166097 ) ( ON ?auto_166099 ?auto_166098 ) ( not ( = ?auto_166094 ?auto_166095 ) ) ( not ( = ?auto_166094 ?auto_166096 ) ) ( not ( = ?auto_166094 ?auto_166097 ) ) ( not ( = ?auto_166094 ?auto_166098 ) ) ( not ( = ?auto_166094 ?auto_166099 ) ) ( not ( = ?auto_166094 ?auto_166100 ) ) ( not ( = ?auto_166095 ?auto_166096 ) ) ( not ( = ?auto_166095 ?auto_166097 ) ) ( not ( = ?auto_166095 ?auto_166098 ) ) ( not ( = ?auto_166095 ?auto_166099 ) ) ( not ( = ?auto_166095 ?auto_166100 ) ) ( not ( = ?auto_166096 ?auto_166097 ) ) ( not ( = ?auto_166096 ?auto_166098 ) ) ( not ( = ?auto_166096 ?auto_166099 ) ) ( not ( = ?auto_166096 ?auto_166100 ) ) ( not ( = ?auto_166097 ?auto_166098 ) ) ( not ( = ?auto_166097 ?auto_166099 ) ) ( not ( = ?auto_166097 ?auto_166100 ) ) ( not ( = ?auto_166098 ?auto_166099 ) ) ( not ( = ?auto_166098 ?auto_166100 ) ) ( not ( = ?auto_166099 ?auto_166100 ) ) ( ON ?auto_166100 ?auto_166101 ) ( CLEAR ?auto_166100 ) ( HAND-EMPTY ) ( not ( = ?auto_166094 ?auto_166101 ) ) ( not ( = ?auto_166095 ?auto_166101 ) ) ( not ( = ?auto_166096 ?auto_166101 ) ) ( not ( = ?auto_166097 ?auto_166101 ) ) ( not ( = ?auto_166098 ?auto_166101 ) ) ( not ( = ?auto_166099 ?auto_166101 ) ) ( not ( = ?auto_166100 ?auto_166101 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_166100 ?auto_166101 )
      ( MAKE-7PILE ?auto_166094 ?auto_166095 ?auto_166096 ?auto_166097 ?auto_166098 ?auto_166099 ?auto_166100 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_166102 - BLOCK
      ?auto_166103 - BLOCK
      ?auto_166104 - BLOCK
      ?auto_166105 - BLOCK
      ?auto_166106 - BLOCK
      ?auto_166107 - BLOCK
      ?auto_166108 - BLOCK
    )
    :vars
    (
      ?auto_166109 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_166102 ) ( ON ?auto_166103 ?auto_166102 ) ( ON ?auto_166104 ?auto_166103 ) ( ON ?auto_166105 ?auto_166104 ) ( ON ?auto_166106 ?auto_166105 ) ( not ( = ?auto_166102 ?auto_166103 ) ) ( not ( = ?auto_166102 ?auto_166104 ) ) ( not ( = ?auto_166102 ?auto_166105 ) ) ( not ( = ?auto_166102 ?auto_166106 ) ) ( not ( = ?auto_166102 ?auto_166107 ) ) ( not ( = ?auto_166102 ?auto_166108 ) ) ( not ( = ?auto_166103 ?auto_166104 ) ) ( not ( = ?auto_166103 ?auto_166105 ) ) ( not ( = ?auto_166103 ?auto_166106 ) ) ( not ( = ?auto_166103 ?auto_166107 ) ) ( not ( = ?auto_166103 ?auto_166108 ) ) ( not ( = ?auto_166104 ?auto_166105 ) ) ( not ( = ?auto_166104 ?auto_166106 ) ) ( not ( = ?auto_166104 ?auto_166107 ) ) ( not ( = ?auto_166104 ?auto_166108 ) ) ( not ( = ?auto_166105 ?auto_166106 ) ) ( not ( = ?auto_166105 ?auto_166107 ) ) ( not ( = ?auto_166105 ?auto_166108 ) ) ( not ( = ?auto_166106 ?auto_166107 ) ) ( not ( = ?auto_166106 ?auto_166108 ) ) ( not ( = ?auto_166107 ?auto_166108 ) ) ( ON ?auto_166108 ?auto_166109 ) ( CLEAR ?auto_166108 ) ( not ( = ?auto_166102 ?auto_166109 ) ) ( not ( = ?auto_166103 ?auto_166109 ) ) ( not ( = ?auto_166104 ?auto_166109 ) ) ( not ( = ?auto_166105 ?auto_166109 ) ) ( not ( = ?auto_166106 ?auto_166109 ) ) ( not ( = ?auto_166107 ?auto_166109 ) ) ( not ( = ?auto_166108 ?auto_166109 ) ) ( HOLDING ?auto_166107 ) ( CLEAR ?auto_166106 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_166102 ?auto_166103 ?auto_166104 ?auto_166105 ?auto_166106 ?auto_166107 )
      ( MAKE-7PILE ?auto_166102 ?auto_166103 ?auto_166104 ?auto_166105 ?auto_166106 ?auto_166107 ?auto_166108 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_166110 - BLOCK
      ?auto_166111 - BLOCK
      ?auto_166112 - BLOCK
      ?auto_166113 - BLOCK
      ?auto_166114 - BLOCK
      ?auto_166115 - BLOCK
      ?auto_166116 - BLOCK
    )
    :vars
    (
      ?auto_166117 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_166110 ) ( ON ?auto_166111 ?auto_166110 ) ( ON ?auto_166112 ?auto_166111 ) ( ON ?auto_166113 ?auto_166112 ) ( ON ?auto_166114 ?auto_166113 ) ( not ( = ?auto_166110 ?auto_166111 ) ) ( not ( = ?auto_166110 ?auto_166112 ) ) ( not ( = ?auto_166110 ?auto_166113 ) ) ( not ( = ?auto_166110 ?auto_166114 ) ) ( not ( = ?auto_166110 ?auto_166115 ) ) ( not ( = ?auto_166110 ?auto_166116 ) ) ( not ( = ?auto_166111 ?auto_166112 ) ) ( not ( = ?auto_166111 ?auto_166113 ) ) ( not ( = ?auto_166111 ?auto_166114 ) ) ( not ( = ?auto_166111 ?auto_166115 ) ) ( not ( = ?auto_166111 ?auto_166116 ) ) ( not ( = ?auto_166112 ?auto_166113 ) ) ( not ( = ?auto_166112 ?auto_166114 ) ) ( not ( = ?auto_166112 ?auto_166115 ) ) ( not ( = ?auto_166112 ?auto_166116 ) ) ( not ( = ?auto_166113 ?auto_166114 ) ) ( not ( = ?auto_166113 ?auto_166115 ) ) ( not ( = ?auto_166113 ?auto_166116 ) ) ( not ( = ?auto_166114 ?auto_166115 ) ) ( not ( = ?auto_166114 ?auto_166116 ) ) ( not ( = ?auto_166115 ?auto_166116 ) ) ( ON ?auto_166116 ?auto_166117 ) ( not ( = ?auto_166110 ?auto_166117 ) ) ( not ( = ?auto_166111 ?auto_166117 ) ) ( not ( = ?auto_166112 ?auto_166117 ) ) ( not ( = ?auto_166113 ?auto_166117 ) ) ( not ( = ?auto_166114 ?auto_166117 ) ) ( not ( = ?auto_166115 ?auto_166117 ) ) ( not ( = ?auto_166116 ?auto_166117 ) ) ( CLEAR ?auto_166114 ) ( ON ?auto_166115 ?auto_166116 ) ( CLEAR ?auto_166115 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_166117 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_166117 ?auto_166116 )
      ( MAKE-7PILE ?auto_166110 ?auto_166111 ?auto_166112 ?auto_166113 ?auto_166114 ?auto_166115 ?auto_166116 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_166118 - BLOCK
      ?auto_166119 - BLOCK
      ?auto_166120 - BLOCK
      ?auto_166121 - BLOCK
      ?auto_166122 - BLOCK
      ?auto_166123 - BLOCK
      ?auto_166124 - BLOCK
    )
    :vars
    (
      ?auto_166125 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_166118 ) ( ON ?auto_166119 ?auto_166118 ) ( ON ?auto_166120 ?auto_166119 ) ( ON ?auto_166121 ?auto_166120 ) ( not ( = ?auto_166118 ?auto_166119 ) ) ( not ( = ?auto_166118 ?auto_166120 ) ) ( not ( = ?auto_166118 ?auto_166121 ) ) ( not ( = ?auto_166118 ?auto_166122 ) ) ( not ( = ?auto_166118 ?auto_166123 ) ) ( not ( = ?auto_166118 ?auto_166124 ) ) ( not ( = ?auto_166119 ?auto_166120 ) ) ( not ( = ?auto_166119 ?auto_166121 ) ) ( not ( = ?auto_166119 ?auto_166122 ) ) ( not ( = ?auto_166119 ?auto_166123 ) ) ( not ( = ?auto_166119 ?auto_166124 ) ) ( not ( = ?auto_166120 ?auto_166121 ) ) ( not ( = ?auto_166120 ?auto_166122 ) ) ( not ( = ?auto_166120 ?auto_166123 ) ) ( not ( = ?auto_166120 ?auto_166124 ) ) ( not ( = ?auto_166121 ?auto_166122 ) ) ( not ( = ?auto_166121 ?auto_166123 ) ) ( not ( = ?auto_166121 ?auto_166124 ) ) ( not ( = ?auto_166122 ?auto_166123 ) ) ( not ( = ?auto_166122 ?auto_166124 ) ) ( not ( = ?auto_166123 ?auto_166124 ) ) ( ON ?auto_166124 ?auto_166125 ) ( not ( = ?auto_166118 ?auto_166125 ) ) ( not ( = ?auto_166119 ?auto_166125 ) ) ( not ( = ?auto_166120 ?auto_166125 ) ) ( not ( = ?auto_166121 ?auto_166125 ) ) ( not ( = ?auto_166122 ?auto_166125 ) ) ( not ( = ?auto_166123 ?auto_166125 ) ) ( not ( = ?auto_166124 ?auto_166125 ) ) ( ON ?auto_166123 ?auto_166124 ) ( CLEAR ?auto_166123 ) ( ON-TABLE ?auto_166125 ) ( HOLDING ?auto_166122 ) ( CLEAR ?auto_166121 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_166118 ?auto_166119 ?auto_166120 ?auto_166121 ?auto_166122 )
      ( MAKE-7PILE ?auto_166118 ?auto_166119 ?auto_166120 ?auto_166121 ?auto_166122 ?auto_166123 ?auto_166124 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_166126 - BLOCK
      ?auto_166127 - BLOCK
      ?auto_166128 - BLOCK
      ?auto_166129 - BLOCK
      ?auto_166130 - BLOCK
      ?auto_166131 - BLOCK
      ?auto_166132 - BLOCK
    )
    :vars
    (
      ?auto_166133 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_166126 ) ( ON ?auto_166127 ?auto_166126 ) ( ON ?auto_166128 ?auto_166127 ) ( ON ?auto_166129 ?auto_166128 ) ( not ( = ?auto_166126 ?auto_166127 ) ) ( not ( = ?auto_166126 ?auto_166128 ) ) ( not ( = ?auto_166126 ?auto_166129 ) ) ( not ( = ?auto_166126 ?auto_166130 ) ) ( not ( = ?auto_166126 ?auto_166131 ) ) ( not ( = ?auto_166126 ?auto_166132 ) ) ( not ( = ?auto_166127 ?auto_166128 ) ) ( not ( = ?auto_166127 ?auto_166129 ) ) ( not ( = ?auto_166127 ?auto_166130 ) ) ( not ( = ?auto_166127 ?auto_166131 ) ) ( not ( = ?auto_166127 ?auto_166132 ) ) ( not ( = ?auto_166128 ?auto_166129 ) ) ( not ( = ?auto_166128 ?auto_166130 ) ) ( not ( = ?auto_166128 ?auto_166131 ) ) ( not ( = ?auto_166128 ?auto_166132 ) ) ( not ( = ?auto_166129 ?auto_166130 ) ) ( not ( = ?auto_166129 ?auto_166131 ) ) ( not ( = ?auto_166129 ?auto_166132 ) ) ( not ( = ?auto_166130 ?auto_166131 ) ) ( not ( = ?auto_166130 ?auto_166132 ) ) ( not ( = ?auto_166131 ?auto_166132 ) ) ( ON ?auto_166132 ?auto_166133 ) ( not ( = ?auto_166126 ?auto_166133 ) ) ( not ( = ?auto_166127 ?auto_166133 ) ) ( not ( = ?auto_166128 ?auto_166133 ) ) ( not ( = ?auto_166129 ?auto_166133 ) ) ( not ( = ?auto_166130 ?auto_166133 ) ) ( not ( = ?auto_166131 ?auto_166133 ) ) ( not ( = ?auto_166132 ?auto_166133 ) ) ( ON ?auto_166131 ?auto_166132 ) ( ON-TABLE ?auto_166133 ) ( CLEAR ?auto_166129 ) ( ON ?auto_166130 ?auto_166131 ) ( CLEAR ?auto_166130 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_166133 ?auto_166132 ?auto_166131 )
      ( MAKE-7PILE ?auto_166126 ?auto_166127 ?auto_166128 ?auto_166129 ?auto_166130 ?auto_166131 ?auto_166132 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_166134 - BLOCK
      ?auto_166135 - BLOCK
      ?auto_166136 - BLOCK
      ?auto_166137 - BLOCK
      ?auto_166138 - BLOCK
      ?auto_166139 - BLOCK
      ?auto_166140 - BLOCK
    )
    :vars
    (
      ?auto_166141 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_166134 ) ( ON ?auto_166135 ?auto_166134 ) ( ON ?auto_166136 ?auto_166135 ) ( not ( = ?auto_166134 ?auto_166135 ) ) ( not ( = ?auto_166134 ?auto_166136 ) ) ( not ( = ?auto_166134 ?auto_166137 ) ) ( not ( = ?auto_166134 ?auto_166138 ) ) ( not ( = ?auto_166134 ?auto_166139 ) ) ( not ( = ?auto_166134 ?auto_166140 ) ) ( not ( = ?auto_166135 ?auto_166136 ) ) ( not ( = ?auto_166135 ?auto_166137 ) ) ( not ( = ?auto_166135 ?auto_166138 ) ) ( not ( = ?auto_166135 ?auto_166139 ) ) ( not ( = ?auto_166135 ?auto_166140 ) ) ( not ( = ?auto_166136 ?auto_166137 ) ) ( not ( = ?auto_166136 ?auto_166138 ) ) ( not ( = ?auto_166136 ?auto_166139 ) ) ( not ( = ?auto_166136 ?auto_166140 ) ) ( not ( = ?auto_166137 ?auto_166138 ) ) ( not ( = ?auto_166137 ?auto_166139 ) ) ( not ( = ?auto_166137 ?auto_166140 ) ) ( not ( = ?auto_166138 ?auto_166139 ) ) ( not ( = ?auto_166138 ?auto_166140 ) ) ( not ( = ?auto_166139 ?auto_166140 ) ) ( ON ?auto_166140 ?auto_166141 ) ( not ( = ?auto_166134 ?auto_166141 ) ) ( not ( = ?auto_166135 ?auto_166141 ) ) ( not ( = ?auto_166136 ?auto_166141 ) ) ( not ( = ?auto_166137 ?auto_166141 ) ) ( not ( = ?auto_166138 ?auto_166141 ) ) ( not ( = ?auto_166139 ?auto_166141 ) ) ( not ( = ?auto_166140 ?auto_166141 ) ) ( ON ?auto_166139 ?auto_166140 ) ( ON-TABLE ?auto_166141 ) ( ON ?auto_166138 ?auto_166139 ) ( CLEAR ?auto_166138 ) ( HOLDING ?auto_166137 ) ( CLEAR ?auto_166136 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_166134 ?auto_166135 ?auto_166136 ?auto_166137 )
      ( MAKE-7PILE ?auto_166134 ?auto_166135 ?auto_166136 ?auto_166137 ?auto_166138 ?auto_166139 ?auto_166140 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_166142 - BLOCK
      ?auto_166143 - BLOCK
      ?auto_166144 - BLOCK
      ?auto_166145 - BLOCK
      ?auto_166146 - BLOCK
      ?auto_166147 - BLOCK
      ?auto_166148 - BLOCK
    )
    :vars
    (
      ?auto_166149 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_166142 ) ( ON ?auto_166143 ?auto_166142 ) ( ON ?auto_166144 ?auto_166143 ) ( not ( = ?auto_166142 ?auto_166143 ) ) ( not ( = ?auto_166142 ?auto_166144 ) ) ( not ( = ?auto_166142 ?auto_166145 ) ) ( not ( = ?auto_166142 ?auto_166146 ) ) ( not ( = ?auto_166142 ?auto_166147 ) ) ( not ( = ?auto_166142 ?auto_166148 ) ) ( not ( = ?auto_166143 ?auto_166144 ) ) ( not ( = ?auto_166143 ?auto_166145 ) ) ( not ( = ?auto_166143 ?auto_166146 ) ) ( not ( = ?auto_166143 ?auto_166147 ) ) ( not ( = ?auto_166143 ?auto_166148 ) ) ( not ( = ?auto_166144 ?auto_166145 ) ) ( not ( = ?auto_166144 ?auto_166146 ) ) ( not ( = ?auto_166144 ?auto_166147 ) ) ( not ( = ?auto_166144 ?auto_166148 ) ) ( not ( = ?auto_166145 ?auto_166146 ) ) ( not ( = ?auto_166145 ?auto_166147 ) ) ( not ( = ?auto_166145 ?auto_166148 ) ) ( not ( = ?auto_166146 ?auto_166147 ) ) ( not ( = ?auto_166146 ?auto_166148 ) ) ( not ( = ?auto_166147 ?auto_166148 ) ) ( ON ?auto_166148 ?auto_166149 ) ( not ( = ?auto_166142 ?auto_166149 ) ) ( not ( = ?auto_166143 ?auto_166149 ) ) ( not ( = ?auto_166144 ?auto_166149 ) ) ( not ( = ?auto_166145 ?auto_166149 ) ) ( not ( = ?auto_166146 ?auto_166149 ) ) ( not ( = ?auto_166147 ?auto_166149 ) ) ( not ( = ?auto_166148 ?auto_166149 ) ) ( ON ?auto_166147 ?auto_166148 ) ( ON-TABLE ?auto_166149 ) ( ON ?auto_166146 ?auto_166147 ) ( CLEAR ?auto_166144 ) ( ON ?auto_166145 ?auto_166146 ) ( CLEAR ?auto_166145 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_166149 ?auto_166148 ?auto_166147 ?auto_166146 )
      ( MAKE-7PILE ?auto_166142 ?auto_166143 ?auto_166144 ?auto_166145 ?auto_166146 ?auto_166147 ?auto_166148 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_166150 - BLOCK
      ?auto_166151 - BLOCK
      ?auto_166152 - BLOCK
      ?auto_166153 - BLOCK
      ?auto_166154 - BLOCK
      ?auto_166155 - BLOCK
      ?auto_166156 - BLOCK
    )
    :vars
    (
      ?auto_166157 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_166150 ) ( ON ?auto_166151 ?auto_166150 ) ( not ( = ?auto_166150 ?auto_166151 ) ) ( not ( = ?auto_166150 ?auto_166152 ) ) ( not ( = ?auto_166150 ?auto_166153 ) ) ( not ( = ?auto_166150 ?auto_166154 ) ) ( not ( = ?auto_166150 ?auto_166155 ) ) ( not ( = ?auto_166150 ?auto_166156 ) ) ( not ( = ?auto_166151 ?auto_166152 ) ) ( not ( = ?auto_166151 ?auto_166153 ) ) ( not ( = ?auto_166151 ?auto_166154 ) ) ( not ( = ?auto_166151 ?auto_166155 ) ) ( not ( = ?auto_166151 ?auto_166156 ) ) ( not ( = ?auto_166152 ?auto_166153 ) ) ( not ( = ?auto_166152 ?auto_166154 ) ) ( not ( = ?auto_166152 ?auto_166155 ) ) ( not ( = ?auto_166152 ?auto_166156 ) ) ( not ( = ?auto_166153 ?auto_166154 ) ) ( not ( = ?auto_166153 ?auto_166155 ) ) ( not ( = ?auto_166153 ?auto_166156 ) ) ( not ( = ?auto_166154 ?auto_166155 ) ) ( not ( = ?auto_166154 ?auto_166156 ) ) ( not ( = ?auto_166155 ?auto_166156 ) ) ( ON ?auto_166156 ?auto_166157 ) ( not ( = ?auto_166150 ?auto_166157 ) ) ( not ( = ?auto_166151 ?auto_166157 ) ) ( not ( = ?auto_166152 ?auto_166157 ) ) ( not ( = ?auto_166153 ?auto_166157 ) ) ( not ( = ?auto_166154 ?auto_166157 ) ) ( not ( = ?auto_166155 ?auto_166157 ) ) ( not ( = ?auto_166156 ?auto_166157 ) ) ( ON ?auto_166155 ?auto_166156 ) ( ON-TABLE ?auto_166157 ) ( ON ?auto_166154 ?auto_166155 ) ( ON ?auto_166153 ?auto_166154 ) ( CLEAR ?auto_166153 ) ( HOLDING ?auto_166152 ) ( CLEAR ?auto_166151 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_166150 ?auto_166151 ?auto_166152 )
      ( MAKE-7PILE ?auto_166150 ?auto_166151 ?auto_166152 ?auto_166153 ?auto_166154 ?auto_166155 ?auto_166156 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_166158 - BLOCK
      ?auto_166159 - BLOCK
      ?auto_166160 - BLOCK
      ?auto_166161 - BLOCK
      ?auto_166162 - BLOCK
      ?auto_166163 - BLOCK
      ?auto_166164 - BLOCK
    )
    :vars
    (
      ?auto_166165 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_166158 ) ( ON ?auto_166159 ?auto_166158 ) ( not ( = ?auto_166158 ?auto_166159 ) ) ( not ( = ?auto_166158 ?auto_166160 ) ) ( not ( = ?auto_166158 ?auto_166161 ) ) ( not ( = ?auto_166158 ?auto_166162 ) ) ( not ( = ?auto_166158 ?auto_166163 ) ) ( not ( = ?auto_166158 ?auto_166164 ) ) ( not ( = ?auto_166159 ?auto_166160 ) ) ( not ( = ?auto_166159 ?auto_166161 ) ) ( not ( = ?auto_166159 ?auto_166162 ) ) ( not ( = ?auto_166159 ?auto_166163 ) ) ( not ( = ?auto_166159 ?auto_166164 ) ) ( not ( = ?auto_166160 ?auto_166161 ) ) ( not ( = ?auto_166160 ?auto_166162 ) ) ( not ( = ?auto_166160 ?auto_166163 ) ) ( not ( = ?auto_166160 ?auto_166164 ) ) ( not ( = ?auto_166161 ?auto_166162 ) ) ( not ( = ?auto_166161 ?auto_166163 ) ) ( not ( = ?auto_166161 ?auto_166164 ) ) ( not ( = ?auto_166162 ?auto_166163 ) ) ( not ( = ?auto_166162 ?auto_166164 ) ) ( not ( = ?auto_166163 ?auto_166164 ) ) ( ON ?auto_166164 ?auto_166165 ) ( not ( = ?auto_166158 ?auto_166165 ) ) ( not ( = ?auto_166159 ?auto_166165 ) ) ( not ( = ?auto_166160 ?auto_166165 ) ) ( not ( = ?auto_166161 ?auto_166165 ) ) ( not ( = ?auto_166162 ?auto_166165 ) ) ( not ( = ?auto_166163 ?auto_166165 ) ) ( not ( = ?auto_166164 ?auto_166165 ) ) ( ON ?auto_166163 ?auto_166164 ) ( ON-TABLE ?auto_166165 ) ( ON ?auto_166162 ?auto_166163 ) ( ON ?auto_166161 ?auto_166162 ) ( CLEAR ?auto_166159 ) ( ON ?auto_166160 ?auto_166161 ) ( CLEAR ?auto_166160 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_166165 ?auto_166164 ?auto_166163 ?auto_166162 ?auto_166161 )
      ( MAKE-7PILE ?auto_166158 ?auto_166159 ?auto_166160 ?auto_166161 ?auto_166162 ?auto_166163 ?auto_166164 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_166166 - BLOCK
      ?auto_166167 - BLOCK
      ?auto_166168 - BLOCK
      ?auto_166169 - BLOCK
      ?auto_166170 - BLOCK
      ?auto_166171 - BLOCK
      ?auto_166172 - BLOCK
    )
    :vars
    (
      ?auto_166173 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_166166 ) ( not ( = ?auto_166166 ?auto_166167 ) ) ( not ( = ?auto_166166 ?auto_166168 ) ) ( not ( = ?auto_166166 ?auto_166169 ) ) ( not ( = ?auto_166166 ?auto_166170 ) ) ( not ( = ?auto_166166 ?auto_166171 ) ) ( not ( = ?auto_166166 ?auto_166172 ) ) ( not ( = ?auto_166167 ?auto_166168 ) ) ( not ( = ?auto_166167 ?auto_166169 ) ) ( not ( = ?auto_166167 ?auto_166170 ) ) ( not ( = ?auto_166167 ?auto_166171 ) ) ( not ( = ?auto_166167 ?auto_166172 ) ) ( not ( = ?auto_166168 ?auto_166169 ) ) ( not ( = ?auto_166168 ?auto_166170 ) ) ( not ( = ?auto_166168 ?auto_166171 ) ) ( not ( = ?auto_166168 ?auto_166172 ) ) ( not ( = ?auto_166169 ?auto_166170 ) ) ( not ( = ?auto_166169 ?auto_166171 ) ) ( not ( = ?auto_166169 ?auto_166172 ) ) ( not ( = ?auto_166170 ?auto_166171 ) ) ( not ( = ?auto_166170 ?auto_166172 ) ) ( not ( = ?auto_166171 ?auto_166172 ) ) ( ON ?auto_166172 ?auto_166173 ) ( not ( = ?auto_166166 ?auto_166173 ) ) ( not ( = ?auto_166167 ?auto_166173 ) ) ( not ( = ?auto_166168 ?auto_166173 ) ) ( not ( = ?auto_166169 ?auto_166173 ) ) ( not ( = ?auto_166170 ?auto_166173 ) ) ( not ( = ?auto_166171 ?auto_166173 ) ) ( not ( = ?auto_166172 ?auto_166173 ) ) ( ON ?auto_166171 ?auto_166172 ) ( ON-TABLE ?auto_166173 ) ( ON ?auto_166170 ?auto_166171 ) ( ON ?auto_166169 ?auto_166170 ) ( ON ?auto_166168 ?auto_166169 ) ( CLEAR ?auto_166168 ) ( HOLDING ?auto_166167 ) ( CLEAR ?auto_166166 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_166166 ?auto_166167 )
      ( MAKE-7PILE ?auto_166166 ?auto_166167 ?auto_166168 ?auto_166169 ?auto_166170 ?auto_166171 ?auto_166172 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_166174 - BLOCK
      ?auto_166175 - BLOCK
      ?auto_166176 - BLOCK
      ?auto_166177 - BLOCK
      ?auto_166178 - BLOCK
      ?auto_166179 - BLOCK
      ?auto_166180 - BLOCK
    )
    :vars
    (
      ?auto_166181 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_166174 ) ( not ( = ?auto_166174 ?auto_166175 ) ) ( not ( = ?auto_166174 ?auto_166176 ) ) ( not ( = ?auto_166174 ?auto_166177 ) ) ( not ( = ?auto_166174 ?auto_166178 ) ) ( not ( = ?auto_166174 ?auto_166179 ) ) ( not ( = ?auto_166174 ?auto_166180 ) ) ( not ( = ?auto_166175 ?auto_166176 ) ) ( not ( = ?auto_166175 ?auto_166177 ) ) ( not ( = ?auto_166175 ?auto_166178 ) ) ( not ( = ?auto_166175 ?auto_166179 ) ) ( not ( = ?auto_166175 ?auto_166180 ) ) ( not ( = ?auto_166176 ?auto_166177 ) ) ( not ( = ?auto_166176 ?auto_166178 ) ) ( not ( = ?auto_166176 ?auto_166179 ) ) ( not ( = ?auto_166176 ?auto_166180 ) ) ( not ( = ?auto_166177 ?auto_166178 ) ) ( not ( = ?auto_166177 ?auto_166179 ) ) ( not ( = ?auto_166177 ?auto_166180 ) ) ( not ( = ?auto_166178 ?auto_166179 ) ) ( not ( = ?auto_166178 ?auto_166180 ) ) ( not ( = ?auto_166179 ?auto_166180 ) ) ( ON ?auto_166180 ?auto_166181 ) ( not ( = ?auto_166174 ?auto_166181 ) ) ( not ( = ?auto_166175 ?auto_166181 ) ) ( not ( = ?auto_166176 ?auto_166181 ) ) ( not ( = ?auto_166177 ?auto_166181 ) ) ( not ( = ?auto_166178 ?auto_166181 ) ) ( not ( = ?auto_166179 ?auto_166181 ) ) ( not ( = ?auto_166180 ?auto_166181 ) ) ( ON ?auto_166179 ?auto_166180 ) ( ON-TABLE ?auto_166181 ) ( ON ?auto_166178 ?auto_166179 ) ( ON ?auto_166177 ?auto_166178 ) ( ON ?auto_166176 ?auto_166177 ) ( CLEAR ?auto_166174 ) ( ON ?auto_166175 ?auto_166176 ) ( CLEAR ?auto_166175 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_166181 ?auto_166180 ?auto_166179 ?auto_166178 ?auto_166177 ?auto_166176 )
      ( MAKE-7PILE ?auto_166174 ?auto_166175 ?auto_166176 ?auto_166177 ?auto_166178 ?auto_166179 ?auto_166180 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_166182 - BLOCK
      ?auto_166183 - BLOCK
      ?auto_166184 - BLOCK
      ?auto_166185 - BLOCK
      ?auto_166186 - BLOCK
      ?auto_166187 - BLOCK
      ?auto_166188 - BLOCK
    )
    :vars
    (
      ?auto_166189 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_166182 ?auto_166183 ) ) ( not ( = ?auto_166182 ?auto_166184 ) ) ( not ( = ?auto_166182 ?auto_166185 ) ) ( not ( = ?auto_166182 ?auto_166186 ) ) ( not ( = ?auto_166182 ?auto_166187 ) ) ( not ( = ?auto_166182 ?auto_166188 ) ) ( not ( = ?auto_166183 ?auto_166184 ) ) ( not ( = ?auto_166183 ?auto_166185 ) ) ( not ( = ?auto_166183 ?auto_166186 ) ) ( not ( = ?auto_166183 ?auto_166187 ) ) ( not ( = ?auto_166183 ?auto_166188 ) ) ( not ( = ?auto_166184 ?auto_166185 ) ) ( not ( = ?auto_166184 ?auto_166186 ) ) ( not ( = ?auto_166184 ?auto_166187 ) ) ( not ( = ?auto_166184 ?auto_166188 ) ) ( not ( = ?auto_166185 ?auto_166186 ) ) ( not ( = ?auto_166185 ?auto_166187 ) ) ( not ( = ?auto_166185 ?auto_166188 ) ) ( not ( = ?auto_166186 ?auto_166187 ) ) ( not ( = ?auto_166186 ?auto_166188 ) ) ( not ( = ?auto_166187 ?auto_166188 ) ) ( ON ?auto_166188 ?auto_166189 ) ( not ( = ?auto_166182 ?auto_166189 ) ) ( not ( = ?auto_166183 ?auto_166189 ) ) ( not ( = ?auto_166184 ?auto_166189 ) ) ( not ( = ?auto_166185 ?auto_166189 ) ) ( not ( = ?auto_166186 ?auto_166189 ) ) ( not ( = ?auto_166187 ?auto_166189 ) ) ( not ( = ?auto_166188 ?auto_166189 ) ) ( ON ?auto_166187 ?auto_166188 ) ( ON-TABLE ?auto_166189 ) ( ON ?auto_166186 ?auto_166187 ) ( ON ?auto_166185 ?auto_166186 ) ( ON ?auto_166184 ?auto_166185 ) ( ON ?auto_166183 ?auto_166184 ) ( CLEAR ?auto_166183 ) ( HOLDING ?auto_166182 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_166182 )
      ( MAKE-7PILE ?auto_166182 ?auto_166183 ?auto_166184 ?auto_166185 ?auto_166186 ?auto_166187 ?auto_166188 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_166190 - BLOCK
      ?auto_166191 - BLOCK
      ?auto_166192 - BLOCK
      ?auto_166193 - BLOCK
      ?auto_166194 - BLOCK
      ?auto_166195 - BLOCK
      ?auto_166196 - BLOCK
    )
    :vars
    (
      ?auto_166197 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_166190 ?auto_166191 ) ) ( not ( = ?auto_166190 ?auto_166192 ) ) ( not ( = ?auto_166190 ?auto_166193 ) ) ( not ( = ?auto_166190 ?auto_166194 ) ) ( not ( = ?auto_166190 ?auto_166195 ) ) ( not ( = ?auto_166190 ?auto_166196 ) ) ( not ( = ?auto_166191 ?auto_166192 ) ) ( not ( = ?auto_166191 ?auto_166193 ) ) ( not ( = ?auto_166191 ?auto_166194 ) ) ( not ( = ?auto_166191 ?auto_166195 ) ) ( not ( = ?auto_166191 ?auto_166196 ) ) ( not ( = ?auto_166192 ?auto_166193 ) ) ( not ( = ?auto_166192 ?auto_166194 ) ) ( not ( = ?auto_166192 ?auto_166195 ) ) ( not ( = ?auto_166192 ?auto_166196 ) ) ( not ( = ?auto_166193 ?auto_166194 ) ) ( not ( = ?auto_166193 ?auto_166195 ) ) ( not ( = ?auto_166193 ?auto_166196 ) ) ( not ( = ?auto_166194 ?auto_166195 ) ) ( not ( = ?auto_166194 ?auto_166196 ) ) ( not ( = ?auto_166195 ?auto_166196 ) ) ( ON ?auto_166196 ?auto_166197 ) ( not ( = ?auto_166190 ?auto_166197 ) ) ( not ( = ?auto_166191 ?auto_166197 ) ) ( not ( = ?auto_166192 ?auto_166197 ) ) ( not ( = ?auto_166193 ?auto_166197 ) ) ( not ( = ?auto_166194 ?auto_166197 ) ) ( not ( = ?auto_166195 ?auto_166197 ) ) ( not ( = ?auto_166196 ?auto_166197 ) ) ( ON ?auto_166195 ?auto_166196 ) ( ON-TABLE ?auto_166197 ) ( ON ?auto_166194 ?auto_166195 ) ( ON ?auto_166193 ?auto_166194 ) ( ON ?auto_166192 ?auto_166193 ) ( ON ?auto_166191 ?auto_166192 ) ( ON ?auto_166190 ?auto_166191 ) ( CLEAR ?auto_166190 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_166197 ?auto_166196 ?auto_166195 ?auto_166194 ?auto_166193 ?auto_166192 ?auto_166191 )
      ( MAKE-7PILE ?auto_166190 ?auto_166191 ?auto_166192 ?auto_166193 ?auto_166194 ?auto_166195 ?auto_166196 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_166198 - BLOCK
      ?auto_166199 - BLOCK
      ?auto_166200 - BLOCK
      ?auto_166201 - BLOCK
      ?auto_166202 - BLOCK
      ?auto_166203 - BLOCK
      ?auto_166204 - BLOCK
    )
    :vars
    (
      ?auto_166205 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_166198 ?auto_166199 ) ) ( not ( = ?auto_166198 ?auto_166200 ) ) ( not ( = ?auto_166198 ?auto_166201 ) ) ( not ( = ?auto_166198 ?auto_166202 ) ) ( not ( = ?auto_166198 ?auto_166203 ) ) ( not ( = ?auto_166198 ?auto_166204 ) ) ( not ( = ?auto_166199 ?auto_166200 ) ) ( not ( = ?auto_166199 ?auto_166201 ) ) ( not ( = ?auto_166199 ?auto_166202 ) ) ( not ( = ?auto_166199 ?auto_166203 ) ) ( not ( = ?auto_166199 ?auto_166204 ) ) ( not ( = ?auto_166200 ?auto_166201 ) ) ( not ( = ?auto_166200 ?auto_166202 ) ) ( not ( = ?auto_166200 ?auto_166203 ) ) ( not ( = ?auto_166200 ?auto_166204 ) ) ( not ( = ?auto_166201 ?auto_166202 ) ) ( not ( = ?auto_166201 ?auto_166203 ) ) ( not ( = ?auto_166201 ?auto_166204 ) ) ( not ( = ?auto_166202 ?auto_166203 ) ) ( not ( = ?auto_166202 ?auto_166204 ) ) ( not ( = ?auto_166203 ?auto_166204 ) ) ( ON ?auto_166204 ?auto_166205 ) ( not ( = ?auto_166198 ?auto_166205 ) ) ( not ( = ?auto_166199 ?auto_166205 ) ) ( not ( = ?auto_166200 ?auto_166205 ) ) ( not ( = ?auto_166201 ?auto_166205 ) ) ( not ( = ?auto_166202 ?auto_166205 ) ) ( not ( = ?auto_166203 ?auto_166205 ) ) ( not ( = ?auto_166204 ?auto_166205 ) ) ( ON ?auto_166203 ?auto_166204 ) ( ON-TABLE ?auto_166205 ) ( ON ?auto_166202 ?auto_166203 ) ( ON ?auto_166201 ?auto_166202 ) ( ON ?auto_166200 ?auto_166201 ) ( ON ?auto_166199 ?auto_166200 ) ( HOLDING ?auto_166198 ) ( CLEAR ?auto_166199 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_166205 ?auto_166204 ?auto_166203 ?auto_166202 ?auto_166201 ?auto_166200 ?auto_166199 ?auto_166198 )
      ( MAKE-7PILE ?auto_166198 ?auto_166199 ?auto_166200 ?auto_166201 ?auto_166202 ?auto_166203 ?auto_166204 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_166206 - BLOCK
      ?auto_166207 - BLOCK
      ?auto_166208 - BLOCK
      ?auto_166209 - BLOCK
      ?auto_166210 - BLOCK
      ?auto_166211 - BLOCK
      ?auto_166212 - BLOCK
    )
    :vars
    (
      ?auto_166213 - BLOCK
      ?auto_166214 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_166206 ?auto_166207 ) ) ( not ( = ?auto_166206 ?auto_166208 ) ) ( not ( = ?auto_166206 ?auto_166209 ) ) ( not ( = ?auto_166206 ?auto_166210 ) ) ( not ( = ?auto_166206 ?auto_166211 ) ) ( not ( = ?auto_166206 ?auto_166212 ) ) ( not ( = ?auto_166207 ?auto_166208 ) ) ( not ( = ?auto_166207 ?auto_166209 ) ) ( not ( = ?auto_166207 ?auto_166210 ) ) ( not ( = ?auto_166207 ?auto_166211 ) ) ( not ( = ?auto_166207 ?auto_166212 ) ) ( not ( = ?auto_166208 ?auto_166209 ) ) ( not ( = ?auto_166208 ?auto_166210 ) ) ( not ( = ?auto_166208 ?auto_166211 ) ) ( not ( = ?auto_166208 ?auto_166212 ) ) ( not ( = ?auto_166209 ?auto_166210 ) ) ( not ( = ?auto_166209 ?auto_166211 ) ) ( not ( = ?auto_166209 ?auto_166212 ) ) ( not ( = ?auto_166210 ?auto_166211 ) ) ( not ( = ?auto_166210 ?auto_166212 ) ) ( not ( = ?auto_166211 ?auto_166212 ) ) ( ON ?auto_166212 ?auto_166213 ) ( not ( = ?auto_166206 ?auto_166213 ) ) ( not ( = ?auto_166207 ?auto_166213 ) ) ( not ( = ?auto_166208 ?auto_166213 ) ) ( not ( = ?auto_166209 ?auto_166213 ) ) ( not ( = ?auto_166210 ?auto_166213 ) ) ( not ( = ?auto_166211 ?auto_166213 ) ) ( not ( = ?auto_166212 ?auto_166213 ) ) ( ON ?auto_166211 ?auto_166212 ) ( ON-TABLE ?auto_166213 ) ( ON ?auto_166210 ?auto_166211 ) ( ON ?auto_166209 ?auto_166210 ) ( ON ?auto_166208 ?auto_166209 ) ( ON ?auto_166207 ?auto_166208 ) ( CLEAR ?auto_166207 ) ( ON ?auto_166206 ?auto_166214 ) ( CLEAR ?auto_166206 ) ( HAND-EMPTY ) ( not ( = ?auto_166206 ?auto_166214 ) ) ( not ( = ?auto_166207 ?auto_166214 ) ) ( not ( = ?auto_166208 ?auto_166214 ) ) ( not ( = ?auto_166209 ?auto_166214 ) ) ( not ( = ?auto_166210 ?auto_166214 ) ) ( not ( = ?auto_166211 ?auto_166214 ) ) ( not ( = ?auto_166212 ?auto_166214 ) ) ( not ( = ?auto_166213 ?auto_166214 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_166206 ?auto_166214 )
      ( MAKE-7PILE ?auto_166206 ?auto_166207 ?auto_166208 ?auto_166209 ?auto_166210 ?auto_166211 ?auto_166212 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_166215 - BLOCK
      ?auto_166216 - BLOCK
      ?auto_166217 - BLOCK
      ?auto_166218 - BLOCK
      ?auto_166219 - BLOCK
      ?auto_166220 - BLOCK
      ?auto_166221 - BLOCK
    )
    :vars
    (
      ?auto_166223 - BLOCK
      ?auto_166222 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_166215 ?auto_166216 ) ) ( not ( = ?auto_166215 ?auto_166217 ) ) ( not ( = ?auto_166215 ?auto_166218 ) ) ( not ( = ?auto_166215 ?auto_166219 ) ) ( not ( = ?auto_166215 ?auto_166220 ) ) ( not ( = ?auto_166215 ?auto_166221 ) ) ( not ( = ?auto_166216 ?auto_166217 ) ) ( not ( = ?auto_166216 ?auto_166218 ) ) ( not ( = ?auto_166216 ?auto_166219 ) ) ( not ( = ?auto_166216 ?auto_166220 ) ) ( not ( = ?auto_166216 ?auto_166221 ) ) ( not ( = ?auto_166217 ?auto_166218 ) ) ( not ( = ?auto_166217 ?auto_166219 ) ) ( not ( = ?auto_166217 ?auto_166220 ) ) ( not ( = ?auto_166217 ?auto_166221 ) ) ( not ( = ?auto_166218 ?auto_166219 ) ) ( not ( = ?auto_166218 ?auto_166220 ) ) ( not ( = ?auto_166218 ?auto_166221 ) ) ( not ( = ?auto_166219 ?auto_166220 ) ) ( not ( = ?auto_166219 ?auto_166221 ) ) ( not ( = ?auto_166220 ?auto_166221 ) ) ( ON ?auto_166221 ?auto_166223 ) ( not ( = ?auto_166215 ?auto_166223 ) ) ( not ( = ?auto_166216 ?auto_166223 ) ) ( not ( = ?auto_166217 ?auto_166223 ) ) ( not ( = ?auto_166218 ?auto_166223 ) ) ( not ( = ?auto_166219 ?auto_166223 ) ) ( not ( = ?auto_166220 ?auto_166223 ) ) ( not ( = ?auto_166221 ?auto_166223 ) ) ( ON ?auto_166220 ?auto_166221 ) ( ON-TABLE ?auto_166223 ) ( ON ?auto_166219 ?auto_166220 ) ( ON ?auto_166218 ?auto_166219 ) ( ON ?auto_166217 ?auto_166218 ) ( ON ?auto_166215 ?auto_166222 ) ( CLEAR ?auto_166215 ) ( not ( = ?auto_166215 ?auto_166222 ) ) ( not ( = ?auto_166216 ?auto_166222 ) ) ( not ( = ?auto_166217 ?auto_166222 ) ) ( not ( = ?auto_166218 ?auto_166222 ) ) ( not ( = ?auto_166219 ?auto_166222 ) ) ( not ( = ?auto_166220 ?auto_166222 ) ) ( not ( = ?auto_166221 ?auto_166222 ) ) ( not ( = ?auto_166223 ?auto_166222 ) ) ( HOLDING ?auto_166216 ) ( CLEAR ?auto_166217 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_166223 ?auto_166221 ?auto_166220 ?auto_166219 ?auto_166218 ?auto_166217 ?auto_166216 )
      ( MAKE-7PILE ?auto_166215 ?auto_166216 ?auto_166217 ?auto_166218 ?auto_166219 ?auto_166220 ?auto_166221 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_166224 - BLOCK
      ?auto_166225 - BLOCK
      ?auto_166226 - BLOCK
      ?auto_166227 - BLOCK
      ?auto_166228 - BLOCK
      ?auto_166229 - BLOCK
      ?auto_166230 - BLOCK
    )
    :vars
    (
      ?auto_166231 - BLOCK
      ?auto_166232 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_166224 ?auto_166225 ) ) ( not ( = ?auto_166224 ?auto_166226 ) ) ( not ( = ?auto_166224 ?auto_166227 ) ) ( not ( = ?auto_166224 ?auto_166228 ) ) ( not ( = ?auto_166224 ?auto_166229 ) ) ( not ( = ?auto_166224 ?auto_166230 ) ) ( not ( = ?auto_166225 ?auto_166226 ) ) ( not ( = ?auto_166225 ?auto_166227 ) ) ( not ( = ?auto_166225 ?auto_166228 ) ) ( not ( = ?auto_166225 ?auto_166229 ) ) ( not ( = ?auto_166225 ?auto_166230 ) ) ( not ( = ?auto_166226 ?auto_166227 ) ) ( not ( = ?auto_166226 ?auto_166228 ) ) ( not ( = ?auto_166226 ?auto_166229 ) ) ( not ( = ?auto_166226 ?auto_166230 ) ) ( not ( = ?auto_166227 ?auto_166228 ) ) ( not ( = ?auto_166227 ?auto_166229 ) ) ( not ( = ?auto_166227 ?auto_166230 ) ) ( not ( = ?auto_166228 ?auto_166229 ) ) ( not ( = ?auto_166228 ?auto_166230 ) ) ( not ( = ?auto_166229 ?auto_166230 ) ) ( ON ?auto_166230 ?auto_166231 ) ( not ( = ?auto_166224 ?auto_166231 ) ) ( not ( = ?auto_166225 ?auto_166231 ) ) ( not ( = ?auto_166226 ?auto_166231 ) ) ( not ( = ?auto_166227 ?auto_166231 ) ) ( not ( = ?auto_166228 ?auto_166231 ) ) ( not ( = ?auto_166229 ?auto_166231 ) ) ( not ( = ?auto_166230 ?auto_166231 ) ) ( ON ?auto_166229 ?auto_166230 ) ( ON-TABLE ?auto_166231 ) ( ON ?auto_166228 ?auto_166229 ) ( ON ?auto_166227 ?auto_166228 ) ( ON ?auto_166226 ?auto_166227 ) ( ON ?auto_166224 ?auto_166232 ) ( not ( = ?auto_166224 ?auto_166232 ) ) ( not ( = ?auto_166225 ?auto_166232 ) ) ( not ( = ?auto_166226 ?auto_166232 ) ) ( not ( = ?auto_166227 ?auto_166232 ) ) ( not ( = ?auto_166228 ?auto_166232 ) ) ( not ( = ?auto_166229 ?auto_166232 ) ) ( not ( = ?auto_166230 ?auto_166232 ) ) ( not ( = ?auto_166231 ?auto_166232 ) ) ( CLEAR ?auto_166226 ) ( ON ?auto_166225 ?auto_166224 ) ( CLEAR ?auto_166225 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_166232 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_166232 ?auto_166224 )
      ( MAKE-7PILE ?auto_166224 ?auto_166225 ?auto_166226 ?auto_166227 ?auto_166228 ?auto_166229 ?auto_166230 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_166233 - BLOCK
      ?auto_166234 - BLOCK
      ?auto_166235 - BLOCK
      ?auto_166236 - BLOCK
      ?auto_166237 - BLOCK
      ?auto_166238 - BLOCK
      ?auto_166239 - BLOCK
    )
    :vars
    (
      ?auto_166241 - BLOCK
      ?auto_166240 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_166233 ?auto_166234 ) ) ( not ( = ?auto_166233 ?auto_166235 ) ) ( not ( = ?auto_166233 ?auto_166236 ) ) ( not ( = ?auto_166233 ?auto_166237 ) ) ( not ( = ?auto_166233 ?auto_166238 ) ) ( not ( = ?auto_166233 ?auto_166239 ) ) ( not ( = ?auto_166234 ?auto_166235 ) ) ( not ( = ?auto_166234 ?auto_166236 ) ) ( not ( = ?auto_166234 ?auto_166237 ) ) ( not ( = ?auto_166234 ?auto_166238 ) ) ( not ( = ?auto_166234 ?auto_166239 ) ) ( not ( = ?auto_166235 ?auto_166236 ) ) ( not ( = ?auto_166235 ?auto_166237 ) ) ( not ( = ?auto_166235 ?auto_166238 ) ) ( not ( = ?auto_166235 ?auto_166239 ) ) ( not ( = ?auto_166236 ?auto_166237 ) ) ( not ( = ?auto_166236 ?auto_166238 ) ) ( not ( = ?auto_166236 ?auto_166239 ) ) ( not ( = ?auto_166237 ?auto_166238 ) ) ( not ( = ?auto_166237 ?auto_166239 ) ) ( not ( = ?auto_166238 ?auto_166239 ) ) ( ON ?auto_166239 ?auto_166241 ) ( not ( = ?auto_166233 ?auto_166241 ) ) ( not ( = ?auto_166234 ?auto_166241 ) ) ( not ( = ?auto_166235 ?auto_166241 ) ) ( not ( = ?auto_166236 ?auto_166241 ) ) ( not ( = ?auto_166237 ?auto_166241 ) ) ( not ( = ?auto_166238 ?auto_166241 ) ) ( not ( = ?auto_166239 ?auto_166241 ) ) ( ON ?auto_166238 ?auto_166239 ) ( ON-TABLE ?auto_166241 ) ( ON ?auto_166237 ?auto_166238 ) ( ON ?auto_166236 ?auto_166237 ) ( ON ?auto_166233 ?auto_166240 ) ( not ( = ?auto_166233 ?auto_166240 ) ) ( not ( = ?auto_166234 ?auto_166240 ) ) ( not ( = ?auto_166235 ?auto_166240 ) ) ( not ( = ?auto_166236 ?auto_166240 ) ) ( not ( = ?auto_166237 ?auto_166240 ) ) ( not ( = ?auto_166238 ?auto_166240 ) ) ( not ( = ?auto_166239 ?auto_166240 ) ) ( not ( = ?auto_166241 ?auto_166240 ) ) ( ON ?auto_166234 ?auto_166233 ) ( CLEAR ?auto_166234 ) ( ON-TABLE ?auto_166240 ) ( HOLDING ?auto_166235 ) ( CLEAR ?auto_166236 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_166241 ?auto_166239 ?auto_166238 ?auto_166237 ?auto_166236 ?auto_166235 )
      ( MAKE-7PILE ?auto_166233 ?auto_166234 ?auto_166235 ?auto_166236 ?auto_166237 ?auto_166238 ?auto_166239 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_166242 - BLOCK
      ?auto_166243 - BLOCK
      ?auto_166244 - BLOCK
      ?auto_166245 - BLOCK
      ?auto_166246 - BLOCK
      ?auto_166247 - BLOCK
      ?auto_166248 - BLOCK
    )
    :vars
    (
      ?auto_166249 - BLOCK
      ?auto_166250 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_166242 ?auto_166243 ) ) ( not ( = ?auto_166242 ?auto_166244 ) ) ( not ( = ?auto_166242 ?auto_166245 ) ) ( not ( = ?auto_166242 ?auto_166246 ) ) ( not ( = ?auto_166242 ?auto_166247 ) ) ( not ( = ?auto_166242 ?auto_166248 ) ) ( not ( = ?auto_166243 ?auto_166244 ) ) ( not ( = ?auto_166243 ?auto_166245 ) ) ( not ( = ?auto_166243 ?auto_166246 ) ) ( not ( = ?auto_166243 ?auto_166247 ) ) ( not ( = ?auto_166243 ?auto_166248 ) ) ( not ( = ?auto_166244 ?auto_166245 ) ) ( not ( = ?auto_166244 ?auto_166246 ) ) ( not ( = ?auto_166244 ?auto_166247 ) ) ( not ( = ?auto_166244 ?auto_166248 ) ) ( not ( = ?auto_166245 ?auto_166246 ) ) ( not ( = ?auto_166245 ?auto_166247 ) ) ( not ( = ?auto_166245 ?auto_166248 ) ) ( not ( = ?auto_166246 ?auto_166247 ) ) ( not ( = ?auto_166246 ?auto_166248 ) ) ( not ( = ?auto_166247 ?auto_166248 ) ) ( ON ?auto_166248 ?auto_166249 ) ( not ( = ?auto_166242 ?auto_166249 ) ) ( not ( = ?auto_166243 ?auto_166249 ) ) ( not ( = ?auto_166244 ?auto_166249 ) ) ( not ( = ?auto_166245 ?auto_166249 ) ) ( not ( = ?auto_166246 ?auto_166249 ) ) ( not ( = ?auto_166247 ?auto_166249 ) ) ( not ( = ?auto_166248 ?auto_166249 ) ) ( ON ?auto_166247 ?auto_166248 ) ( ON-TABLE ?auto_166249 ) ( ON ?auto_166246 ?auto_166247 ) ( ON ?auto_166245 ?auto_166246 ) ( ON ?auto_166242 ?auto_166250 ) ( not ( = ?auto_166242 ?auto_166250 ) ) ( not ( = ?auto_166243 ?auto_166250 ) ) ( not ( = ?auto_166244 ?auto_166250 ) ) ( not ( = ?auto_166245 ?auto_166250 ) ) ( not ( = ?auto_166246 ?auto_166250 ) ) ( not ( = ?auto_166247 ?auto_166250 ) ) ( not ( = ?auto_166248 ?auto_166250 ) ) ( not ( = ?auto_166249 ?auto_166250 ) ) ( ON ?auto_166243 ?auto_166242 ) ( ON-TABLE ?auto_166250 ) ( CLEAR ?auto_166245 ) ( ON ?auto_166244 ?auto_166243 ) ( CLEAR ?auto_166244 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_166250 ?auto_166242 ?auto_166243 )
      ( MAKE-7PILE ?auto_166242 ?auto_166243 ?auto_166244 ?auto_166245 ?auto_166246 ?auto_166247 ?auto_166248 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_166251 - BLOCK
      ?auto_166252 - BLOCK
      ?auto_166253 - BLOCK
      ?auto_166254 - BLOCK
      ?auto_166255 - BLOCK
      ?auto_166256 - BLOCK
      ?auto_166257 - BLOCK
    )
    :vars
    (
      ?auto_166259 - BLOCK
      ?auto_166258 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_166251 ?auto_166252 ) ) ( not ( = ?auto_166251 ?auto_166253 ) ) ( not ( = ?auto_166251 ?auto_166254 ) ) ( not ( = ?auto_166251 ?auto_166255 ) ) ( not ( = ?auto_166251 ?auto_166256 ) ) ( not ( = ?auto_166251 ?auto_166257 ) ) ( not ( = ?auto_166252 ?auto_166253 ) ) ( not ( = ?auto_166252 ?auto_166254 ) ) ( not ( = ?auto_166252 ?auto_166255 ) ) ( not ( = ?auto_166252 ?auto_166256 ) ) ( not ( = ?auto_166252 ?auto_166257 ) ) ( not ( = ?auto_166253 ?auto_166254 ) ) ( not ( = ?auto_166253 ?auto_166255 ) ) ( not ( = ?auto_166253 ?auto_166256 ) ) ( not ( = ?auto_166253 ?auto_166257 ) ) ( not ( = ?auto_166254 ?auto_166255 ) ) ( not ( = ?auto_166254 ?auto_166256 ) ) ( not ( = ?auto_166254 ?auto_166257 ) ) ( not ( = ?auto_166255 ?auto_166256 ) ) ( not ( = ?auto_166255 ?auto_166257 ) ) ( not ( = ?auto_166256 ?auto_166257 ) ) ( ON ?auto_166257 ?auto_166259 ) ( not ( = ?auto_166251 ?auto_166259 ) ) ( not ( = ?auto_166252 ?auto_166259 ) ) ( not ( = ?auto_166253 ?auto_166259 ) ) ( not ( = ?auto_166254 ?auto_166259 ) ) ( not ( = ?auto_166255 ?auto_166259 ) ) ( not ( = ?auto_166256 ?auto_166259 ) ) ( not ( = ?auto_166257 ?auto_166259 ) ) ( ON ?auto_166256 ?auto_166257 ) ( ON-TABLE ?auto_166259 ) ( ON ?auto_166255 ?auto_166256 ) ( ON ?auto_166251 ?auto_166258 ) ( not ( = ?auto_166251 ?auto_166258 ) ) ( not ( = ?auto_166252 ?auto_166258 ) ) ( not ( = ?auto_166253 ?auto_166258 ) ) ( not ( = ?auto_166254 ?auto_166258 ) ) ( not ( = ?auto_166255 ?auto_166258 ) ) ( not ( = ?auto_166256 ?auto_166258 ) ) ( not ( = ?auto_166257 ?auto_166258 ) ) ( not ( = ?auto_166259 ?auto_166258 ) ) ( ON ?auto_166252 ?auto_166251 ) ( ON-TABLE ?auto_166258 ) ( ON ?auto_166253 ?auto_166252 ) ( CLEAR ?auto_166253 ) ( HOLDING ?auto_166254 ) ( CLEAR ?auto_166255 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_166259 ?auto_166257 ?auto_166256 ?auto_166255 ?auto_166254 )
      ( MAKE-7PILE ?auto_166251 ?auto_166252 ?auto_166253 ?auto_166254 ?auto_166255 ?auto_166256 ?auto_166257 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_166260 - BLOCK
      ?auto_166261 - BLOCK
      ?auto_166262 - BLOCK
      ?auto_166263 - BLOCK
      ?auto_166264 - BLOCK
      ?auto_166265 - BLOCK
      ?auto_166266 - BLOCK
    )
    :vars
    (
      ?auto_166267 - BLOCK
      ?auto_166268 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_166260 ?auto_166261 ) ) ( not ( = ?auto_166260 ?auto_166262 ) ) ( not ( = ?auto_166260 ?auto_166263 ) ) ( not ( = ?auto_166260 ?auto_166264 ) ) ( not ( = ?auto_166260 ?auto_166265 ) ) ( not ( = ?auto_166260 ?auto_166266 ) ) ( not ( = ?auto_166261 ?auto_166262 ) ) ( not ( = ?auto_166261 ?auto_166263 ) ) ( not ( = ?auto_166261 ?auto_166264 ) ) ( not ( = ?auto_166261 ?auto_166265 ) ) ( not ( = ?auto_166261 ?auto_166266 ) ) ( not ( = ?auto_166262 ?auto_166263 ) ) ( not ( = ?auto_166262 ?auto_166264 ) ) ( not ( = ?auto_166262 ?auto_166265 ) ) ( not ( = ?auto_166262 ?auto_166266 ) ) ( not ( = ?auto_166263 ?auto_166264 ) ) ( not ( = ?auto_166263 ?auto_166265 ) ) ( not ( = ?auto_166263 ?auto_166266 ) ) ( not ( = ?auto_166264 ?auto_166265 ) ) ( not ( = ?auto_166264 ?auto_166266 ) ) ( not ( = ?auto_166265 ?auto_166266 ) ) ( ON ?auto_166266 ?auto_166267 ) ( not ( = ?auto_166260 ?auto_166267 ) ) ( not ( = ?auto_166261 ?auto_166267 ) ) ( not ( = ?auto_166262 ?auto_166267 ) ) ( not ( = ?auto_166263 ?auto_166267 ) ) ( not ( = ?auto_166264 ?auto_166267 ) ) ( not ( = ?auto_166265 ?auto_166267 ) ) ( not ( = ?auto_166266 ?auto_166267 ) ) ( ON ?auto_166265 ?auto_166266 ) ( ON-TABLE ?auto_166267 ) ( ON ?auto_166264 ?auto_166265 ) ( ON ?auto_166260 ?auto_166268 ) ( not ( = ?auto_166260 ?auto_166268 ) ) ( not ( = ?auto_166261 ?auto_166268 ) ) ( not ( = ?auto_166262 ?auto_166268 ) ) ( not ( = ?auto_166263 ?auto_166268 ) ) ( not ( = ?auto_166264 ?auto_166268 ) ) ( not ( = ?auto_166265 ?auto_166268 ) ) ( not ( = ?auto_166266 ?auto_166268 ) ) ( not ( = ?auto_166267 ?auto_166268 ) ) ( ON ?auto_166261 ?auto_166260 ) ( ON-TABLE ?auto_166268 ) ( ON ?auto_166262 ?auto_166261 ) ( CLEAR ?auto_166264 ) ( ON ?auto_166263 ?auto_166262 ) ( CLEAR ?auto_166263 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_166268 ?auto_166260 ?auto_166261 ?auto_166262 )
      ( MAKE-7PILE ?auto_166260 ?auto_166261 ?auto_166262 ?auto_166263 ?auto_166264 ?auto_166265 ?auto_166266 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_166269 - BLOCK
      ?auto_166270 - BLOCK
      ?auto_166271 - BLOCK
      ?auto_166272 - BLOCK
      ?auto_166273 - BLOCK
      ?auto_166274 - BLOCK
      ?auto_166275 - BLOCK
    )
    :vars
    (
      ?auto_166277 - BLOCK
      ?auto_166276 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_166269 ?auto_166270 ) ) ( not ( = ?auto_166269 ?auto_166271 ) ) ( not ( = ?auto_166269 ?auto_166272 ) ) ( not ( = ?auto_166269 ?auto_166273 ) ) ( not ( = ?auto_166269 ?auto_166274 ) ) ( not ( = ?auto_166269 ?auto_166275 ) ) ( not ( = ?auto_166270 ?auto_166271 ) ) ( not ( = ?auto_166270 ?auto_166272 ) ) ( not ( = ?auto_166270 ?auto_166273 ) ) ( not ( = ?auto_166270 ?auto_166274 ) ) ( not ( = ?auto_166270 ?auto_166275 ) ) ( not ( = ?auto_166271 ?auto_166272 ) ) ( not ( = ?auto_166271 ?auto_166273 ) ) ( not ( = ?auto_166271 ?auto_166274 ) ) ( not ( = ?auto_166271 ?auto_166275 ) ) ( not ( = ?auto_166272 ?auto_166273 ) ) ( not ( = ?auto_166272 ?auto_166274 ) ) ( not ( = ?auto_166272 ?auto_166275 ) ) ( not ( = ?auto_166273 ?auto_166274 ) ) ( not ( = ?auto_166273 ?auto_166275 ) ) ( not ( = ?auto_166274 ?auto_166275 ) ) ( ON ?auto_166275 ?auto_166277 ) ( not ( = ?auto_166269 ?auto_166277 ) ) ( not ( = ?auto_166270 ?auto_166277 ) ) ( not ( = ?auto_166271 ?auto_166277 ) ) ( not ( = ?auto_166272 ?auto_166277 ) ) ( not ( = ?auto_166273 ?auto_166277 ) ) ( not ( = ?auto_166274 ?auto_166277 ) ) ( not ( = ?auto_166275 ?auto_166277 ) ) ( ON ?auto_166274 ?auto_166275 ) ( ON-TABLE ?auto_166277 ) ( ON ?auto_166269 ?auto_166276 ) ( not ( = ?auto_166269 ?auto_166276 ) ) ( not ( = ?auto_166270 ?auto_166276 ) ) ( not ( = ?auto_166271 ?auto_166276 ) ) ( not ( = ?auto_166272 ?auto_166276 ) ) ( not ( = ?auto_166273 ?auto_166276 ) ) ( not ( = ?auto_166274 ?auto_166276 ) ) ( not ( = ?auto_166275 ?auto_166276 ) ) ( not ( = ?auto_166277 ?auto_166276 ) ) ( ON ?auto_166270 ?auto_166269 ) ( ON-TABLE ?auto_166276 ) ( ON ?auto_166271 ?auto_166270 ) ( ON ?auto_166272 ?auto_166271 ) ( CLEAR ?auto_166272 ) ( HOLDING ?auto_166273 ) ( CLEAR ?auto_166274 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_166277 ?auto_166275 ?auto_166274 ?auto_166273 )
      ( MAKE-7PILE ?auto_166269 ?auto_166270 ?auto_166271 ?auto_166272 ?auto_166273 ?auto_166274 ?auto_166275 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_166278 - BLOCK
      ?auto_166279 - BLOCK
      ?auto_166280 - BLOCK
      ?auto_166281 - BLOCK
      ?auto_166282 - BLOCK
      ?auto_166283 - BLOCK
      ?auto_166284 - BLOCK
    )
    :vars
    (
      ?auto_166285 - BLOCK
      ?auto_166286 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_166278 ?auto_166279 ) ) ( not ( = ?auto_166278 ?auto_166280 ) ) ( not ( = ?auto_166278 ?auto_166281 ) ) ( not ( = ?auto_166278 ?auto_166282 ) ) ( not ( = ?auto_166278 ?auto_166283 ) ) ( not ( = ?auto_166278 ?auto_166284 ) ) ( not ( = ?auto_166279 ?auto_166280 ) ) ( not ( = ?auto_166279 ?auto_166281 ) ) ( not ( = ?auto_166279 ?auto_166282 ) ) ( not ( = ?auto_166279 ?auto_166283 ) ) ( not ( = ?auto_166279 ?auto_166284 ) ) ( not ( = ?auto_166280 ?auto_166281 ) ) ( not ( = ?auto_166280 ?auto_166282 ) ) ( not ( = ?auto_166280 ?auto_166283 ) ) ( not ( = ?auto_166280 ?auto_166284 ) ) ( not ( = ?auto_166281 ?auto_166282 ) ) ( not ( = ?auto_166281 ?auto_166283 ) ) ( not ( = ?auto_166281 ?auto_166284 ) ) ( not ( = ?auto_166282 ?auto_166283 ) ) ( not ( = ?auto_166282 ?auto_166284 ) ) ( not ( = ?auto_166283 ?auto_166284 ) ) ( ON ?auto_166284 ?auto_166285 ) ( not ( = ?auto_166278 ?auto_166285 ) ) ( not ( = ?auto_166279 ?auto_166285 ) ) ( not ( = ?auto_166280 ?auto_166285 ) ) ( not ( = ?auto_166281 ?auto_166285 ) ) ( not ( = ?auto_166282 ?auto_166285 ) ) ( not ( = ?auto_166283 ?auto_166285 ) ) ( not ( = ?auto_166284 ?auto_166285 ) ) ( ON ?auto_166283 ?auto_166284 ) ( ON-TABLE ?auto_166285 ) ( ON ?auto_166278 ?auto_166286 ) ( not ( = ?auto_166278 ?auto_166286 ) ) ( not ( = ?auto_166279 ?auto_166286 ) ) ( not ( = ?auto_166280 ?auto_166286 ) ) ( not ( = ?auto_166281 ?auto_166286 ) ) ( not ( = ?auto_166282 ?auto_166286 ) ) ( not ( = ?auto_166283 ?auto_166286 ) ) ( not ( = ?auto_166284 ?auto_166286 ) ) ( not ( = ?auto_166285 ?auto_166286 ) ) ( ON ?auto_166279 ?auto_166278 ) ( ON-TABLE ?auto_166286 ) ( ON ?auto_166280 ?auto_166279 ) ( ON ?auto_166281 ?auto_166280 ) ( CLEAR ?auto_166283 ) ( ON ?auto_166282 ?auto_166281 ) ( CLEAR ?auto_166282 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_166286 ?auto_166278 ?auto_166279 ?auto_166280 ?auto_166281 )
      ( MAKE-7PILE ?auto_166278 ?auto_166279 ?auto_166280 ?auto_166281 ?auto_166282 ?auto_166283 ?auto_166284 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_166287 - BLOCK
      ?auto_166288 - BLOCK
      ?auto_166289 - BLOCK
      ?auto_166290 - BLOCK
      ?auto_166291 - BLOCK
      ?auto_166292 - BLOCK
      ?auto_166293 - BLOCK
    )
    :vars
    (
      ?auto_166294 - BLOCK
      ?auto_166295 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_166287 ?auto_166288 ) ) ( not ( = ?auto_166287 ?auto_166289 ) ) ( not ( = ?auto_166287 ?auto_166290 ) ) ( not ( = ?auto_166287 ?auto_166291 ) ) ( not ( = ?auto_166287 ?auto_166292 ) ) ( not ( = ?auto_166287 ?auto_166293 ) ) ( not ( = ?auto_166288 ?auto_166289 ) ) ( not ( = ?auto_166288 ?auto_166290 ) ) ( not ( = ?auto_166288 ?auto_166291 ) ) ( not ( = ?auto_166288 ?auto_166292 ) ) ( not ( = ?auto_166288 ?auto_166293 ) ) ( not ( = ?auto_166289 ?auto_166290 ) ) ( not ( = ?auto_166289 ?auto_166291 ) ) ( not ( = ?auto_166289 ?auto_166292 ) ) ( not ( = ?auto_166289 ?auto_166293 ) ) ( not ( = ?auto_166290 ?auto_166291 ) ) ( not ( = ?auto_166290 ?auto_166292 ) ) ( not ( = ?auto_166290 ?auto_166293 ) ) ( not ( = ?auto_166291 ?auto_166292 ) ) ( not ( = ?auto_166291 ?auto_166293 ) ) ( not ( = ?auto_166292 ?auto_166293 ) ) ( ON ?auto_166293 ?auto_166294 ) ( not ( = ?auto_166287 ?auto_166294 ) ) ( not ( = ?auto_166288 ?auto_166294 ) ) ( not ( = ?auto_166289 ?auto_166294 ) ) ( not ( = ?auto_166290 ?auto_166294 ) ) ( not ( = ?auto_166291 ?auto_166294 ) ) ( not ( = ?auto_166292 ?auto_166294 ) ) ( not ( = ?auto_166293 ?auto_166294 ) ) ( ON-TABLE ?auto_166294 ) ( ON ?auto_166287 ?auto_166295 ) ( not ( = ?auto_166287 ?auto_166295 ) ) ( not ( = ?auto_166288 ?auto_166295 ) ) ( not ( = ?auto_166289 ?auto_166295 ) ) ( not ( = ?auto_166290 ?auto_166295 ) ) ( not ( = ?auto_166291 ?auto_166295 ) ) ( not ( = ?auto_166292 ?auto_166295 ) ) ( not ( = ?auto_166293 ?auto_166295 ) ) ( not ( = ?auto_166294 ?auto_166295 ) ) ( ON ?auto_166288 ?auto_166287 ) ( ON-TABLE ?auto_166295 ) ( ON ?auto_166289 ?auto_166288 ) ( ON ?auto_166290 ?auto_166289 ) ( ON ?auto_166291 ?auto_166290 ) ( CLEAR ?auto_166291 ) ( HOLDING ?auto_166292 ) ( CLEAR ?auto_166293 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_166294 ?auto_166293 ?auto_166292 )
      ( MAKE-7PILE ?auto_166287 ?auto_166288 ?auto_166289 ?auto_166290 ?auto_166291 ?auto_166292 ?auto_166293 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_166296 - BLOCK
      ?auto_166297 - BLOCK
      ?auto_166298 - BLOCK
      ?auto_166299 - BLOCK
      ?auto_166300 - BLOCK
      ?auto_166301 - BLOCK
      ?auto_166302 - BLOCK
    )
    :vars
    (
      ?auto_166303 - BLOCK
      ?auto_166304 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_166296 ?auto_166297 ) ) ( not ( = ?auto_166296 ?auto_166298 ) ) ( not ( = ?auto_166296 ?auto_166299 ) ) ( not ( = ?auto_166296 ?auto_166300 ) ) ( not ( = ?auto_166296 ?auto_166301 ) ) ( not ( = ?auto_166296 ?auto_166302 ) ) ( not ( = ?auto_166297 ?auto_166298 ) ) ( not ( = ?auto_166297 ?auto_166299 ) ) ( not ( = ?auto_166297 ?auto_166300 ) ) ( not ( = ?auto_166297 ?auto_166301 ) ) ( not ( = ?auto_166297 ?auto_166302 ) ) ( not ( = ?auto_166298 ?auto_166299 ) ) ( not ( = ?auto_166298 ?auto_166300 ) ) ( not ( = ?auto_166298 ?auto_166301 ) ) ( not ( = ?auto_166298 ?auto_166302 ) ) ( not ( = ?auto_166299 ?auto_166300 ) ) ( not ( = ?auto_166299 ?auto_166301 ) ) ( not ( = ?auto_166299 ?auto_166302 ) ) ( not ( = ?auto_166300 ?auto_166301 ) ) ( not ( = ?auto_166300 ?auto_166302 ) ) ( not ( = ?auto_166301 ?auto_166302 ) ) ( ON ?auto_166302 ?auto_166303 ) ( not ( = ?auto_166296 ?auto_166303 ) ) ( not ( = ?auto_166297 ?auto_166303 ) ) ( not ( = ?auto_166298 ?auto_166303 ) ) ( not ( = ?auto_166299 ?auto_166303 ) ) ( not ( = ?auto_166300 ?auto_166303 ) ) ( not ( = ?auto_166301 ?auto_166303 ) ) ( not ( = ?auto_166302 ?auto_166303 ) ) ( ON-TABLE ?auto_166303 ) ( ON ?auto_166296 ?auto_166304 ) ( not ( = ?auto_166296 ?auto_166304 ) ) ( not ( = ?auto_166297 ?auto_166304 ) ) ( not ( = ?auto_166298 ?auto_166304 ) ) ( not ( = ?auto_166299 ?auto_166304 ) ) ( not ( = ?auto_166300 ?auto_166304 ) ) ( not ( = ?auto_166301 ?auto_166304 ) ) ( not ( = ?auto_166302 ?auto_166304 ) ) ( not ( = ?auto_166303 ?auto_166304 ) ) ( ON ?auto_166297 ?auto_166296 ) ( ON-TABLE ?auto_166304 ) ( ON ?auto_166298 ?auto_166297 ) ( ON ?auto_166299 ?auto_166298 ) ( ON ?auto_166300 ?auto_166299 ) ( CLEAR ?auto_166302 ) ( ON ?auto_166301 ?auto_166300 ) ( CLEAR ?auto_166301 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_166304 ?auto_166296 ?auto_166297 ?auto_166298 ?auto_166299 ?auto_166300 )
      ( MAKE-7PILE ?auto_166296 ?auto_166297 ?auto_166298 ?auto_166299 ?auto_166300 ?auto_166301 ?auto_166302 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_166305 - BLOCK
      ?auto_166306 - BLOCK
      ?auto_166307 - BLOCK
      ?auto_166308 - BLOCK
      ?auto_166309 - BLOCK
      ?auto_166310 - BLOCK
      ?auto_166311 - BLOCK
    )
    :vars
    (
      ?auto_166313 - BLOCK
      ?auto_166312 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_166305 ?auto_166306 ) ) ( not ( = ?auto_166305 ?auto_166307 ) ) ( not ( = ?auto_166305 ?auto_166308 ) ) ( not ( = ?auto_166305 ?auto_166309 ) ) ( not ( = ?auto_166305 ?auto_166310 ) ) ( not ( = ?auto_166305 ?auto_166311 ) ) ( not ( = ?auto_166306 ?auto_166307 ) ) ( not ( = ?auto_166306 ?auto_166308 ) ) ( not ( = ?auto_166306 ?auto_166309 ) ) ( not ( = ?auto_166306 ?auto_166310 ) ) ( not ( = ?auto_166306 ?auto_166311 ) ) ( not ( = ?auto_166307 ?auto_166308 ) ) ( not ( = ?auto_166307 ?auto_166309 ) ) ( not ( = ?auto_166307 ?auto_166310 ) ) ( not ( = ?auto_166307 ?auto_166311 ) ) ( not ( = ?auto_166308 ?auto_166309 ) ) ( not ( = ?auto_166308 ?auto_166310 ) ) ( not ( = ?auto_166308 ?auto_166311 ) ) ( not ( = ?auto_166309 ?auto_166310 ) ) ( not ( = ?auto_166309 ?auto_166311 ) ) ( not ( = ?auto_166310 ?auto_166311 ) ) ( not ( = ?auto_166305 ?auto_166313 ) ) ( not ( = ?auto_166306 ?auto_166313 ) ) ( not ( = ?auto_166307 ?auto_166313 ) ) ( not ( = ?auto_166308 ?auto_166313 ) ) ( not ( = ?auto_166309 ?auto_166313 ) ) ( not ( = ?auto_166310 ?auto_166313 ) ) ( not ( = ?auto_166311 ?auto_166313 ) ) ( ON-TABLE ?auto_166313 ) ( ON ?auto_166305 ?auto_166312 ) ( not ( = ?auto_166305 ?auto_166312 ) ) ( not ( = ?auto_166306 ?auto_166312 ) ) ( not ( = ?auto_166307 ?auto_166312 ) ) ( not ( = ?auto_166308 ?auto_166312 ) ) ( not ( = ?auto_166309 ?auto_166312 ) ) ( not ( = ?auto_166310 ?auto_166312 ) ) ( not ( = ?auto_166311 ?auto_166312 ) ) ( not ( = ?auto_166313 ?auto_166312 ) ) ( ON ?auto_166306 ?auto_166305 ) ( ON-TABLE ?auto_166312 ) ( ON ?auto_166307 ?auto_166306 ) ( ON ?auto_166308 ?auto_166307 ) ( ON ?auto_166309 ?auto_166308 ) ( ON ?auto_166310 ?auto_166309 ) ( CLEAR ?auto_166310 ) ( HOLDING ?auto_166311 ) ( CLEAR ?auto_166313 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_166313 ?auto_166311 )
      ( MAKE-7PILE ?auto_166305 ?auto_166306 ?auto_166307 ?auto_166308 ?auto_166309 ?auto_166310 ?auto_166311 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_166314 - BLOCK
      ?auto_166315 - BLOCK
      ?auto_166316 - BLOCK
      ?auto_166317 - BLOCK
      ?auto_166318 - BLOCK
      ?auto_166319 - BLOCK
      ?auto_166320 - BLOCK
    )
    :vars
    (
      ?auto_166322 - BLOCK
      ?auto_166321 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_166314 ?auto_166315 ) ) ( not ( = ?auto_166314 ?auto_166316 ) ) ( not ( = ?auto_166314 ?auto_166317 ) ) ( not ( = ?auto_166314 ?auto_166318 ) ) ( not ( = ?auto_166314 ?auto_166319 ) ) ( not ( = ?auto_166314 ?auto_166320 ) ) ( not ( = ?auto_166315 ?auto_166316 ) ) ( not ( = ?auto_166315 ?auto_166317 ) ) ( not ( = ?auto_166315 ?auto_166318 ) ) ( not ( = ?auto_166315 ?auto_166319 ) ) ( not ( = ?auto_166315 ?auto_166320 ) ) ( not ( = ?auto_166316 ?auto_166317 ) ) ( not ( = ?auto_166316 ?auto_166318 ) ) ( not ( = ?auto_166316 ?auto_166319 ) ) ( not ( = ?auto_166316 ?auto_166320 ) ) ( not ( = ?auto_166317 ?auto_166318 ) ) ( not ( = ?auto_166317 ?auto_166319 ) ) ( not ( = ?auto_166317 ?auto_166320 ) ) ( not ( = ?auto_166318 ?auto_166319 ) ) ( not ( = ?auto_166318 ?auto_166320 ) ) ( not ( = ?auto_166319 ?auto_166320 ) ) ( not ( = ?auto_166314 ?auto_166322 ) ) ( not ( = ?auto_166315 ?auto_166322 ) ) ( not ( = ?auto_166316 ?auto_166322 ) ) ( not ( = ?auto_166317 ?auto_166322 ) ) ( not ( = ?auto_166318 ?auto_166322 ) ) ( not ( = ?auto_166319 ?auto_166322 ) ) ( not ( = ?auto_166320 ?auto_166322 ) ) ( ON-TABLE ?auto_166322 ) ( ON ?auto_166314 ?auto_166321 ) ( not ( = ?auto_166314 ?auto_166321 ) ) ( not ( = ?auto_166315 ?auto_166321 ) ) ( not ( = ?auto_166316 ?auto_166321 ) ) ( not ( = ?auto_166317 ?auto_166321 ) ) ( not ( = ?auto_166318 ?auto_166321 ) ) ( not ( = ?auto_166319 ?auto_166321 ) ) ( not ( = ?auto_166320 ?auto_166321 ) ) ( not ( = ?auto_166322 ?auto_166321 ) ) ( ON ?auto_166315 ?auto_166314 ) ( ON-TABLE ?auto_166321 ) ( ON ?auto_166316 ?auto_166315 ) ( ON ?auto_166317 ?auto_166316 ) ( ON ?auto_166318 ?auto_166317 ) ( ON ?auto_166319 ?auto_166318 ) ( CLEAR ?auto_166322 ) ( ON ?auto_166320 ?auto_166319 ) ( CLEAR ?auto_166320 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_166321 ?auto_166314 ?auto_166315 ?auto_166316 ?auto_166317 ?auto_166318 ?auto_166319 )
      ( MAKE-7PILE ?auto_166314 ?auto_166315 ?auto_166316 ?auto_166317 ?auto_166318 ?auto_166319 ?auto_166320 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_166323 - BLOCK
      ?auto_166324 - BLOCK
      ?auto_166325 - BLOCK
      ?auto_166326 - BLOCK
      ?auto_166327 - BLOCK
      ?auto_166328 - BLOCK
      ?auto_166329 - BLOCK
    )
    :vars
    (
      ?auto_166331 - BLOCK
      ?auto_166330 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_166323 ?auto_166324 ) ) ( not ( = ?auto_166323 ?auto_166325 ) ) ( not ( = ?auto_166323 ?auto_166326 ) ) ( not ( = ?auto_166323 ?auto_166327 ) ) ( not ( = ?auto_166323 ?auto_166328 ) ) ( not ( = ?auto_166323 ?auto_166329 ) ) ( not ( = ?auto_166324 ?auto_166325 ) ) ( not ( = ?auto_166324 ?auto_166326 ) ) ( not ( = ?auto_166324 ?auto_166327 ) ) ( not ( = ?auto_166324 ?auto_166328 ) ) ( not ( = ?auto_166324 ?auto_166329 ) ) ( not ( = ?auto_166325 ?auto_166326 ) ) ( not ( = ?auto_166325 ?auto_166327 ) ) ( not ( = ?auto_166325 ?auto_166328 ) ) ( not ( = ?auto_166325 ?auto_166329 ) ) ( not ( = ?auto_166326 ?auto_166327 ) ) ( not ( = ?auto_166326 ?auto_166328 ) ) ( not ( = ?auto_166326 ?auto_166329 ) ) ( not ( = ?auto_166327 ?auto_166328 ) ) ( not ( = ?auto_166327 ?auto_166329 ) ) ( not ( = ?auto_166328 ?auto_166329 ) ) ( not ( = ?auto_166323 ?auto_166331 ) ) ( not ( = ?auto_166324 ?auto_166331 ) ) ( not ( = ?auto_166325 ?auto_166331 ) ) ( not ( = ?auto_166326 ?auto_166331 ) ) ( not ( = ?auto_166327 ?auto_166331 ) ) ( not ( = ?auto_166328 ?auto_166331 ) ) ( not ( = ?auto_166329 ?auto_166331 ) ) ( ON ?auto_166323 ?auto_166330 ) ( not ( = ?auto_166323 ?auto_166330 ) ) ( not ( = ?auto_166324 ?auto_166330 ) ) ( not ( = ?auto_166325 ?auto_166330 ) ) ( not ( = ?auto_166326 ?auto_166330 ) ) ( not ( = ?auto_166327 ?auto_166330 ) ) ( not ( = ?auto_166328 ?auto_166330 ) ) ( not ( = ?auto_166329 ?auto_166330 ) ) ( not ( = ?auto_166331 ?auto_166330 ) ) ( ON ?auto_166324 ?auto_166323 ) ( ON-TABLE ?auto_166330 ) ( ON ?auto_166325 ?auto_166324 ) ( ON ?auto_166326 ?auto_166325 ) ( ON ?auto_166327 ?auto_166326 ) ( ON ?auto_166328 ?auto_166327 ) ( ON ?auto_166329 ?auto_166328 ) ( CLEAR ?auto_166329 ) ( HOLDING ?auto_166331 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_166331 )
      ( MAKE-7PILE ?auto_166323 ?auto_166324 ?auto_166325 ?auto_166326 ?auto_166327 ?auto_166328 ?auto_166329 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_166332 - BLOCK
      ?auto_166333 - BLOCK
      ?auto_166334 - BLOCK
      ?auto_166335 - BLOCK
      ?auto_166336 - BLOCK
      ?auto_166337 - BLOCK
      ?auto_166338 - BLOCK
    )
    :vars
    (
      ?auto_166340 - BLOCK
      ?auto_166339 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_166332 ?auto_166333 ) ) ( not ( = ?auto_166332 ?auto_166334 ) ) ( not ( = ?auto_166332 ?auto_166335 ) ) ( not ( = ?auto_166332 ?auto_166336 ) ) ( not ( = ?auto_166332 ?auto_166337 ) ) ( not ( = ?auto_166332 ?auto_166338 ) ) ( not ( = ?auto_166333 ?auto_166334 ) ) ( not ( = ?auto_166333 ?auto_166335 ) ) ( not ( = ?auto_166333 ?auto_166336 ) ) ( not ( = ?auto_166333 ?auto_166337 ) ) ( not ( = ?auto_166333 ?auto_166338 ) ) ( not ( = ?auto_166334 ?auto_166335 ) ) ( not ( = ?auto_166334 ?auto_166336 ) ) ( not ( = ?auto_166334 ?auto_166337 ) ) ( not ( = ?auto_166334 ?auto_166338 ) ) ( not ( = ?auto_166335 ?auto_166336 ) ) ( not ( = ?auto_166335 ?auto_166337 ) ) ( not ( = ?auto_166335 ?auto_166338 ) ) ( not ( = ?auto_166336 ?auto_166337 ) ) ( not ( = ?auto_166336 ?auto_166338 ) ) ( not ( = ?auto_166337 ?auto_166338 ) ) ( not ( = ?auto_166332 ?auto_166340 ) ) ( not ( = ?auto_166333 ?auto_166340 ) ) ( not ( = ?auto_166334 ?auto_166340 ) ) ( not ( = ?auto_166335 ?auto_166340 ) ) ( not ( = ?auto_166336 ?auto_166340 ) ) ( not ( = ?auto_166337 ?auto_166340 ) ) ( not ( = ?auto_166338 ?auto_166340 ) ) ( ON ?auto_166332 ?auto_166339 ) ( not ( = ?auto_166332 ?auto_166339 ) ) ( not ( = ?auto_166333 ?auto_166339 ) ) ( not ( = ?auto_166334 ?auto_166339 ) ) ( not ( = ?auto_166335 ?auto_166339 ) ) ( not ( = ?auto_166336 ?auto_166339 ) ) ( not ( = ?auto_166337 ?auto_166339 ) ) ( not ( = ?auto_166338 ?auto_166339 ) ) ( not ( = ?auto_166340 ?auto_166339 ) ) ( ON ?auto_166333 ?auto_166332 ) ( ON-TABLE ?auto_166339 ) ( ON ?auto_166334 ?auto_166333 ) ( ON ?auto_166335 ?auto_166334 ) ( ON ?auto_166336 ?auto_166335 ) ( ON ?auto_166337 ?auto_166336 ) ( ON ?auto_166338 ?auto_166337 ) ( ON ?auto_166340 ?auto_166338 ) ( CLEAR ?auto_166340 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_166339 ?auto_166332 ?auto_166333 ?auto_166334 ?auto_166335 ?auto_166336 ?auto_166337 ?auto_166338 )
      ( MAKE-7PILE ?auto_166332 ?auto_166333 ?auto_166334 ?auto_166335 ?auto_166336 ?auto_166337 ?auto_166338 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_166349 - BLOCK
      ?auto_166350 - BLOCK
      ?auto_166351 - BLOCK
      ?auto_166352 - BLOCK
      ?auto_166353 - BLOCK
      ?auto_166354 - BLOCK
      ?auto_166355 - BLOCK
      ?auto_166356 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_166356 ) ( CLEAR ?auto_166355 ) ( ON-TABLE ?auto_166349 ) ( ON ?auto_166350 ?auto_166349 ) ( ON ?auto_166351 ?auto_166350 ) ( ON ?auto_166352 ?auto_166351 ) ( ON ?auto_166353 ?auto_166352 ) ( ON ?auto_166354 ?auto_166353 ) ( ON ?auto_166355 ?auto_166354 ) ( not ( = ?auto_166349 ?auto_166350 ) ) ( not ( = ?auto_166349 ?auto_166351 ) ) ( not ( = ?auto_166349 ?auto_166352 ) ) ( not ( = ?auto_166349 ?auto_166353 ) ) ( not ( = ?auto_166349 ?auto_166354 ) ) ( not ( = ?auto_166349 ?auto_166355 ) ) ( not ( = ?auto_166349 ?auto_166356 ) ) ( not ( = ?auto_166350 ?auto_166351 ) ) ( not ( = ?auto_166350 ?auto_166352 ) ) ( not ( = ?auto_166350 ?auto_166353 ) ) ( not ( = ?auto_166350 ?auto_166354 ) ) ( not ( = ?auto_166350 ?auto_166355 ) ) ( not ( = ?auto_166350 ?auto_166356 ) ) ( not ( = ?auto_166351 ?auto_166352 ) ) ( not ( = ?auto_166351 ?auto_166353 ) ) ( not ( = ?auto_166351 ?auto_166354 ) ) ( not ( = ?auto_166351 ?auto_166355 ) ) ( not ( = ?auto_166351 ?auto_166356 ) ) ( not ( = ?auto_166352 ?auto_166353 ) ) ( not ( = ?auto_166352 ?auto_166354 ) ) ( not ( = ?auto_166352 ?auto_166355 ) ) ( not ( = ?auto_166352 ?auto_166356 ) ) ( not ( = ?auto_166353 ?auto_166354 ) ) ( not ( = ?auto_166353 ?auto_166355 ) ) ( not ( = ?auto_166353 ?auto_166356 ) ) ( not ( = ?auto_166354 ?auto_166355 ) ) ( not ( = ?auto_166354 ?auto_166356 ) ) ( not ( = ?auto_166355 ?auto_166356 ) ) )
    :subtasks
    ( ( !STACK ?auto_166356 ?auto_166355 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_166357 - BLOCK
      ?auto_166358 - BLOCK
      ?auto_166359 - BLOCK
      ?auto_166360 - BLOCK
      ?auto_166361 - BLOCK
      ?auto_166362 - BLOCK
      ?auto_166363 - BLOCK
      ?auto_166364 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_166363 ) ( ON-TABLE ?auto_166357 ) ( ON ?auto_166358 ?auto_166357 ) ( ON ?auto_166359 ?auto_166358 ) ( ON ?auto_166360 ?auto_166359 ) ( ON ?auto_166361 ?auto_166360 ) ( ON ?auto_166362 ?auto_166361 ) ( ON ?auto_166363 ?auto_166362 ) ( not ( = ?auto_166357 ?auto_166358 ) ) ( not ( = ?auto_166357 ?auto_166359 ) ) ( not ( = ?auto_166357 ?auto_166360 ) ) ( not ( = ?auto_166357 ?auto_166361 ) ) ( not ( = ?auto_166357 ?auto_166362 ) ) ( not ( = ?auto_166357 ?auto_166363 ) ) ( not ( = ?auto_166357 ?auto_166364 ) ) ( not ( = ?auto_166358 ?auto_166359 ) ) ( not ( = ?auto_166358 ?auto_166360 ) ) ( not ( = ?auto_166358 ?auto_166361 ) ) ( not ( = ?auto_166358 ?auto_166362 ) ) ( not ( = ?auto_166358 ?auto_166363 ) ) ( not ( = ?auto_166358 ?auto_166364 ) ) ( not ( = ?auto_166359 ?auto_166360 ) ) ( not ( = ?auto_166359 ?auto_166361 ) ) ( not ( = ?auto_166359 ?auto_166362 ) ) ( not ( = ?auto_166359 ?auto_166363 ) ) ( not ( = ?auto_166359 ?auto_166364 ) ) ( not ( = ?auto_166360 ?auto_166361 ) ) ( not ( = ?auto_166360 ?auto_166362 ) ) ( not ( = ?auto_166360 ?auto_166363 ) ) ( not ( = ?auto_166360 ?auto_166364 ) ) ( not ( = ?auto_166361 ?auto_166362 ) ) ( not ( = ?auto_166361 ?auto_166363 ) ) ( not ( = ?auto_166361 ?auto_166364 ) ) ( not ( = ?auto_166362 ?auto_166363 ) ) ( not ( = ?auto_166362 ?auto_166364 ) ) ( not ( = ?auto_166363 ?auto_166364 ) ) ( ON-TABLE ?auto_166364 ) ( CLEAR ?auto_166364 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_166364 )
      ( MAKE-8PILE ?auto_166357 ?auto_166358 ?auto_166359 ?auto_166360 ?auto_166361 ?auto_166362 ?auto_166363 ?auto_166364 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_166365 - BLOCK
      ?auto_166366 - BLOCK
      ?auto_166367 - BLOCK
      ?auto_166368 - BLOCK
      ?auto_166369 - BLOCK
      ?auto_166370 - BLOCK
      ?auto_166371 - BLOCK
      ?auto_166372 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_166365 ) ( ON ?auto_166366 ?auto_166365 ) ( ON ?auto_166367 ?auto_166366 ) ( ON ?auto_166368 ?auto_166367 ) ( ON ?auto_166369 ?auto_166368 ) ( ON ?auto_166370 ?auto_166369 ) ( not ( = ?auto_166365 ?auto_166366 ) ) ( not ( = ?auto_166365 ?auto_166367 ) ) ( not ( = ?auto_166365 ?auto_166368 ) ) ( not ( = ?auto_166365 ?auto_166369 ) ) ( not ( = ?auto_166365 ?auto_166370 ) ) ( not ( = ?auto_166365 ?auto_166371 ) ) ( not ( = ?auto_166365 ?auto_166372 ) ) ( not ( = ?auto_166366 ?auto_166367 ) ) ( not ( = ?auto_166366 ?auto_166368 ) ) ( not ( = ?auto_166366 ?auto_166369 ) ) ( not ( = ?auto_166366 ?auto_166370 ) ) ( not ( = ?auto_166366 ?auto_166371 ) ) ( not ( = ?auto_166366 ?auto_166372 ) ) ( not ( = ?auto_166367 ?auto_166368 ) ) ( not ( = ?auto_166367 ?auto_166369 ) ) ( not ( = ?auto_166367 ?auto_166370 ) ) ( not ( = ?auto_166367 ?auto_166371 ) ) ( not ( = ?auto_166367 ?auto_166372 ) ) ( not ( = ?auto_166368 ?auto_166369 ) ) ( not ( = ?auto_166368 ?auto_166370 ) ) ( not ( = ?auto_166368 ?auto_166371 ) ) ( not ( = ?auto_166368 ?auto_166372 ) ) ( not ( = ?auto_166369 ?auto_166370 ) ) ( not ( = ?auto_166369 ?auto_166371 ) ) ( not ( = ?auto_166369 ?auto_166372 ) ) ( not ( = ?auto_166370 ?auto_166371 ) ) ( not ( = ?auto_166370 ?auto_166372 ) ) ( not ( = ?auto_166371 ?auto_166372 ) ) ( ON-TABLE ?auto_166372 ) ( CLEAR ?auto_166372 ) ( HOLDING ?auto_166371 ) ( CLEAR ?auto_166370 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_166365 ?auto_166366 ?auto_166367 ?auto_166368 ?auto_166369 ?auto_166370 ?auto_166371 )
      ( MAKE-8PILE ?auto_166365 ?auto_166366 ?auto_166367 ?auto_166368 ?auto_166369 ?auto_166370 ?auto_166371 ?auto_166372 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_166373 - BLOCK
      ?auto_166374 - BLOCK
      ?auto_166375 - BLOCK
      ?auto_166376 - BLOCK
      ?auto_166377 - BLOCK
      ?auto_166378 - BLOCK
      ?auto_166379 - BLOCK
      ?auto_166380 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_166373 ) ( ON ?auto_166374 ?auto_166373 ) ( ON ?auto_166375 ?auto_166374 ) ( ON ?auto_166376 ?auto_166375 ) ( ON ?auto_166377 ?auto_166376 ) ( ON ?auto_166378 ?auto_166377 ) ( not ( = ?auto_166373 ?auto_166374 ) ) ( not ( = ?auto_166373 ?auto_166375 ) ) ( not ( = ?auto_166373 ?auto_166376 ) ) ( not ( = ?auto_166373 ?auto_166377 ) ) ( not ( = ?auto_166373 ?auto_166378 ) ) ( not ( = ?auto_166373 ?auto_166379 ) ) ( not ( = ?auto_166373 ?auto_166380 ) ) ( not ( = ?auto_166374 ?auto_166375 ) ) ( not ( = ?auto_166374 ?auto_166376 ) ) ( not ( = ?auto_166374 ?auto_166377 ) ) ( not ( = ?auto_166374 ?auto_166378 ) ) ( not ( = ?auto_166374 ?auto_166379 ) ) ( not ( = ?auto_166374 ?auto_166380 ) ) ( not ( = ?auto_166375 ?auto_166376 ) ) ( not ( = ?auto_166375 ?auto_166377 ) ) ( not ( = ?auto_166375 ?auto_166378 ) ) ( not ( = ?auto_166375 ?auto_166379 ) ) ( not ( = ?auto_166375 ?auto_166380 ) ) ( not ( = ?auto_166376 ?auto_166377 ) ) ( not ( = ?auto_166376 ?auto_166378 ) ) ( not ( = ?auto_166376 ?auto_166379 ) ) ( not ( = ?auto_166376 ?auto_166380 ) ) ( not ( = ?auto_166377 ?auto_166378 ) ) ( not ( = ?auto_166377 ?auto_166379 ) ) ( not ( = ?auto_166377 ?auto_166380 ) ) ( not ( = ?auto_166378 ?auto_166379 ) ) ( not ( = ?auto_166378 ?auto_166380 ) ) ( not ( = ?auto_166379 ?auto_166380 ) ) ( ON-TABLE ?auto_166380 ) ( CLEAR ?auto_166378 ) ( ON ?auto_166379 ?auto_166380 ) ( CLEAR ?auto_166379 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_166380 )
      ( MAKE-8PILE ?auto_166373 ?auto_166374 ?auto_166375 ?auto_166376 ?auto_166377 ?auto_166378 ?auto_166379 ?auto_166380 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_166381 - BLOCK
      ?auto_166382 - BLOCK
      ?auto_166383 - BLOCK
      ?auto_166384 - BLOCK
      ?auto_166385 - BLOCK
      ?auto_166386 - BLOCK
      ?auto_166387 - BLOCK
      ?auto_166388 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_166381 ) ( ON ?auto_166382 ?auto_166381 ) ( ON ?auto_166383 ?auto_166382 ) ( ON ?auto_166384 ?auto_166383 ) ( ON ?auto_166385 ?auto_166384 ) ( not ( = ?auto_166381 ?auto_166382 ) ) ( not ( = ?auto_166381 ?auto_166383 ) ) ( not ( = ?auto_166381 ?auto_166384 ) ) ( not ( = ?auto_166381 ?auto_166385 ) ) ( not ( = ?auto_166381 ?auto_166386 ) ) ( not ( = ?auto_166381 ?auto_166387 ) ) ( not ( = ?auto_166381 ?auto_166388 ) ) ( not ( = ?auto_166382 ?auto_166383 ) ) ( not ( = ?auto_166382 ?auto_166384 ) ) ( not ( = ?auto_166382 ?auto_166385 ) ) ( not ( = ?auto_166382 ?auto_166386 ) ) ( not ( = ?auto_166382 ?auto_166387 ) ) ( not ( = ?auto_166382 ?auto_166388 ) ) ( not ( = ?auto_166383 ?auto_166384 ) ) ( not ( = ?auto_166383 ?auto_166385 ) ) ( not ( = ?auto_166383 ?auto_166386 ) ) ( not ( = ?auto_166383 ?auto_166387 ) ) ( not ( = ?auto_166383 ?auto_166388 ) ) ( not ( = ?auto_166384 ?auto_166385 ) ) ( not ( = ?auto_166384 ?auto_166386 ) ) ( not ( = ?auto_166384 ?auto_166387 ) ) ( not ( = ?auto_166384 ?auto_166388 ) ) ( not ( = ?auto_166385 ?auto_166386 ) ) ( not ( = ?auto_166385 ?auto_166387 ) ) ( not ( = ?auto_166385 ?auto_166388 ) ) ( not ( = ?auto_166386 ?auto_166387 ) ) ( not ( = ?auto_166386 ?auto_166388 ) ) ( not ( = ?auto_166387 ?auto_166388 ) ) ( ON-TABLE ?auto_166388 ) ( ON ?auto_166387 ?auto_166388 ) ( CLEAR ?auto_166387 ) ( HOLDING ?auto_166386 ) ( CLEAR ?auto_166385 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_166381 ?auto_166382 ?auto_166383 ?auto_166384 ?auto_166385 ?auto_166386 )
      ( MAKE-8PILE ?auto_166381 ?auto_166382 ?auto_166383 ?auto_166384 ?auto_166385 ?auto_166386 ?auto_166387 ?auto_166388 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_166389 - BLOCK
      ?auto_166390 - BLOCK
      ?auto_166391 - BLOCK
      ?auto_166392 - BLOCK
      ?auto_166393 - BLOCK
      ?auto_166394 - BLOCK
      ?auto_166395 - BLOCK
      ?auto_166396 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_166389 ) ( ON ?auto_166390 ?auto_166389 ) ( ON ?auto_166391 ?auto_166390 ) ( ON ?auto_166392 ?auto_166391 ) ( ON ?auto_166393 ?auto_166392 ) ( not ( = ?auto_166389 ?auto_166390 ) ) ( not ( = ?auto_166389 ?auto_166391 ) ) ( not ( = ?auto_166389 ?auto_166392 ) ) ( not ( = ?auto_166389 ?auto_166393 ) ) ( not ( = ?auto_166389 ?auto_166394 ) ) ( not ( = ?auto_166389 ?auto_166395 ) ) ( not ( = ?auto_166389 ?auto_166396 ) ) ( not ( = ?auto_166390 ?auto_166391 ) ) ( not ( = ?auto_166390 ?auto_166392 ) ) ( not ( = ?auto_166390 ?auto_166393 ) ) ( not ( = ?auto_166390 ?auto_166394 ) ) ( not ( = ?auto_166390 ?auto_166395 ) ) ( not ( = ?auto_166390 ?auto_166396 ) ) ( not ( = ?auto_166391 ?auto_166392 ) ) ( not ( = ?auto_166391 ?auto_166393 ) ) ( not ( = ?auto_166391 ?auto_166394 ) ) ( not ( = ?auto_166391 ?auto_166395 ) ) ( not ( = ?auto_166391 ?auto_166396 ) ) ( not ( = ?auto_166392 ?auto_166393 ) ) ( not ( = ?auto_166392 ?auto_166394 ) ) ( not ( = ?auto_166392 ?auto_166395 ) ) ( not ( = ?auto_166392 ?auto_166396 ) ) ( not ( = ?auto_166393 ?auto_166394 ) ) ( not ( = ?auto_166393 ?auto_166395 ) ) ( not ( = ?auto_166393 ?auto_166396 ) ) ( not ( = ?auto_166394 ?auto_166395 ) ) ( not ( = ?auto_166394 ?auto_166396 ) ) ( not ( = ?auto_166395 ?auto_166396 ) ) ( ON-TABLE ?auto_166396 ) ( ON ?auto_166395 ?auto_166396 ) ( CLEAR ?auto_166393 ) ( ON ?auto_166394 ?auto_166395 ) ( CLEAR ?auto_166394 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_166396 ?auto_166395 )
      ( MAKE-8PILE ?auto_166389 ?auto_166390 ?auto_166391 ?auto_166392 ?auto_166393 ?auto_166394 ?auto_166395 ?auto_166396 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_166397 - BLOCK
      ?auto_166398 - BLOCK
      ?auto_166399 - BLOCK
      ?auto_166400 - BLOCK
      ?auto_166401 - BLOCK
      ?auto_166402 - BLOCK
      ?auto_166403 - BLOCK
      ?auto_166404 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_166397 ) ( ON ?auto_166398 ?auto_166397 ) ( ON ?auto_166399 ?auto_166398 ) ( ON ?auto_166400 ?auto_166399 ) ( not ( = ?auto_166397 ?auto_166398 ) ) ( not ( = ?auto_166397 ?auto_166399 ) ) ( not ( = ?auto_166397 ?auto_166400 ) ) ( not ( = ?auto_166397 ?auto_166401 ) ) ( not ( = ?auto_166397 ?auto_166402 ) ) ( not ( = ?auto_166397 ?auto_166403 ) ) ( not ( = ?auto_166397 ?auto_166404 ) ) ( not ( = ?auto_166398 ?auto_166399 ) ) ( not ( = ?auto_166398 ?auto_166400 ) ) ( not ( = ?auto_166398 ?auto_166401 ) ) ( not ( = ?auto_166398 ?auto_166402 ) ) ( not ( = ?auto_166398 ?auto_166403 ) ) ( not ( = ?auto_166398 ?auto_166404 ) ) ( not ( = ?auto_166399 ?auto_166400 ) ) ( not ( = ?auto_166399 ?auto_166401 ) ) ( not ( = ?auto_166399 ?auto_166402 ) ) ( not ( = ?auto_166399 ?auto_166403 ) ) ( not ( = ?auto_166399 ?auto_166404 ) ) ( not ( = ?auto_166400 ?auto_166401 ) ) ( not ( = ?auto_166400 ?auto_166402 ) ) ( not ( = ?auto_166400 ?auto_166403 ) ) ( not ( = ?auto_166400 ?auto_166404 ) ) ( not ( = ?auto_166401 ?auto_166402 ) ) ( not ( = ?auto_166401 ?auto_166403 ) ) ( not ( = ?auto_166401 ?auto_166404 ) ) ( not ( = ?auto_166402 ?auto_166403 ) ) ( not ( = ?auto_166402 ?auto_166404 ) ) ( not ( = ?auto_166403 ?auto_166404 ) ) ( ON-TABLE ?auto_166404 ) ( ON ?auto_166403 ?auto_166404 ) ( ON ?auto_166402 ?auto_166403 ) ( CLEAR ?auto_166402 ) ( HOLDING ?auto_166401 ) ( CLEAR ?auto_166400 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_166397 ?auto_166398 ?auto_166399 ?auto_166400 ?auto_166401 )
      ( MAKE-8PILE ?auto_166397 ?auto_166398 ?auto_166399 ?auto_166400 ?auto_166401 ?auto_166402 ?auto_166403 ?auto_166404 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_166405 - BLOCK
      ?auto_166406 - BLOCK
      ?auto_166407 - BLOCK
      ?auto_166408 - BLOCK
      ?auto_166409 - BLOCK
      ?auto_166410 - BLOCK
      ?auto_166411 - BLOCK
      ?auto_166412 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_166405 ) ( ON ?auto_166406 ?auto_166405 ) ( ON ?auto_166407 ?auto_166406 ) ( ON ?auto_166408 ?auto_166407 ) ( not ( = ?auto_166405 ?auto_166406 ) ) ( not ( = ?auto_166405 ?auto_166407 ) ) ( not ( = ?auto_166405 ?auto_166408 ) ) ( not ( = ?auto_166405 ?auto_166409 ) ) ( not ( = ?auto_166405 ?auto_166410 ) ) ( not ( = ?auto_166405 ?auto_166411 ) ) ( not ( = ?auto_166405 ?auto_166412 ) ) ( not ( = ?auto_166406 ?auto_166407 ) ) ( not ( = ?auto_166406 ?auto_166408 ) ) ( not ( = ?auto_166406 ?auto_166409 ) ) ( not ( = ?auto_166406 ?auto_166410 ) ) ( not ( = ?auto_166406 ?auto_166411 ) ) ( not ( = ?auto_166406 ?auto_166412 ) ) ( not ( = ?auto_166407 ?auto_166408 ) ) ( not ( = ?auto_166407 ?auto_166409 ) ) ( not ( = ?auto_166407 ?auto_166410 ) ) ( not ( = ?auto_166407 ?auto_166411 ) ) ( not ( = ?auto_166407 ?auto_166412 ) ) ( not ( = ?auto_166408 ?auto_166409 ) ) ( not ( = ?auto_166408 ?auto_166410 ) ) ( not ( = ?auto_166408 ?auto_166411 ) ) ( not ( = ?auto_166408 ?auto_166412 ) ) ( not ( = ?auto_166409 ?auto_166410 ) ) ( not ( = ?auto_166409 ?auto_166411 ) ) ( not ( = ?auto_166409 ?auto_166412 ) ) ( not ( = ?auto_166410 ?auto_166411 ) ) ( not ( = ?auto_166410 ?auto_166412 ) ) ( not ( = ?auto_166411 ?auto_166412 ) ) ( ON-TABLE ?auto_166412 ) ( ON ?auto_166411 ?auto_166412 ) ( ON ?auto_166410 ?auto_166411 ) ( CLEAR ?auto_166408 ) ( ON ?auto_166409 ?auto_166410 ) ( CLEAR ?auto_166409 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_166412 ?auto_166411 ?auto_166410 )
      ( MAKE-8PILE ?auto_166405 ?auto_166406 ?auto_166407 ?auto_166408 ?auto_166409 ?auto_166410 ?auto_166411 ?auto_166412 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_166413 - BLOCK
      ?auto_166414 - BLOCK
      ?auto_166415 - BLOCK
      ?auto_166416 - BLOCK
      ?auto_166417 - BLOCK
      ?auto_166418 - BLOCK
      ?auto_166419 - BLOCK
      ?auto_166420 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_166413 ) ( ON ?auto_166414 ?auto_166413 ) ( ON ?auto_166415 ?auto_166414 ) ( not ( = ?auto_166413 ?auto_166414 ) ) ( not ( = ?auto_166413 ?auto_166415 ) ) ( not ( = ?auto_166413 ?auto_166416 ) ) ( not ( = ?auto_166413 ?auto_166417 ) ) ( not ( = ?auto_166413 ?auto_166418 ) ) ( not ( = ?auto_166413 ?auto_166419 ) ) ( not ( = ?auto_166413 ?auto_166420 ) ) ( not ( = ?auto_166414 ?auto_166415 ) ) ( not ( = ?auto_166414 ?auto_166416 ) ) ( not ( = ?auto_166414 ?auto_166417 ) ) ( not ( = ?auto_166414 ?auto_166418 ) ) ( not ( = ?auto_166414 ?auto_166419 ) ) ( not ( = ?auto_166414 ?auto_166420 ) ) ( not ( = ?auto_166415 ?auto_166416 ) ) ( not ( = ?auto_166415 ?auto_166417 ) ) ( not ( = ?auto_166415 ?auto_166418 ) ) ( not ( = ?auto_166415 ?auto_166419 ) ) ( not ( = ?auto_166415 ?auto_166420 ) ) ( not ( = ?auto_166416 ?auto_166417 ) ) ( not ( = ?auto_166416 ?auto_166418 ) ) ( not ( = ?auto_166416 ?auto_166419 ) ) ( not ( = ?auto_166416 ?auto_166420 ) ) ( not ( = ?auto_166417 ?auto_166418 ) ) ( not ( = ?auto_166417 ?auto_166419 ) ) ( not ( = ?auto_166417 ?auto_166420 ) ) ( not ( = ?auto_166418 ?auto_166419 ) ) ( not ( = ?auto_166418 ?auto_166420 ) ) ( not ( = ?auto_166419 ?auto_166420 ) ) ( ON-TABLE ?auto_166420 ) ( ON ?auto_166419 ?auto_166420 ) ( ON ?auto_166418 ?auto_166419 ) ( ON ?auto_166417 ?auto_166418 ) ( CLEAR ?auto_166417 ) ( HOLDING ?auto_166416 ) ( CLEAR ?auto_166415 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_166413 ?auto_166414 ?auto_166415 ?auto_166416 )
      ( MAKE-8PILE ?auto_166413 ?auto_166414 ?auto_166415 ?auto_166416 ?auto_166417 ?auto_166418 ?auto_166419 ?auto_166420 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_166421 - BLOCK
      ?auto_166422 - BLOCK
      ?auto_166423 - BLOCK
      ?auto_166424 - BLOCK
      ?auto_166425 - BLOCK
      ?auto_166426 - BLOCK
      ?auto_166427 - BLOCK
      ?auto_166428 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_166421 ) ( ON ?auto_166422 ?auto_166421 ) ( ON ?auto_166423 ?auto_166422 ) ( not ( = ?auto_166421 ?auto_166422 ) ) ( not ( = ?auto_166421 ?auto_166423 ) ) ( not ( = ?auto_166421 ?auto_166424 ) ) ( not ( = ?auto_166421 ?auto_166425 ) ) ( not ( = ?auto_166421 ?auto_166426 ) ) ( not ( = ?auto_166421 ?auto_166427 ) ) ( not ( = ?auto_166421 ?auto_166428 ) ) ( not ( = ?auto_166422 ?auto_166423 ) ) ( not ( = ?auto_166422 ?auto_166424 ) ) ( not ( = ?auto_166422 ?auto_166425 ) ) ( not ( = ?auto_166422 ?auto_166426 ) ) ( not ( = ?auto_166422 ?auto_166427 ) ) ( not ( = ?auto_166422 ?auto_166428 ) ) ( not ( = ?auto_166423 ?auto_166424 ) ) ( not ( = ?auto_166423 ?auto_166425 ) ) ( not ( = ?auto_166423 ?auto_166426 ) ) ( not ( = ?auto_166423 ?auto_166427 ) ) ( not ( = ?auto_166423 ?auto_166428 ) ) ( not ( = ?auto_166424 ?auto_166425 ) ) ( not ( = ?auto_166424 ?auto_166426 ) ) ( not ( = ?auto_166424 ?auto_166427 ) ) ( not ( = ?auto_166424 ?auto_166428 ) ) ( not ( = ?auto_166425 ?auto_166426 ) ) ( not ( = ?auto_166425 ?auto_166427 ) ) ( not ( = ?auto_166425 ?auto_166428 ) ) ( not ( = ?auto_166426 ?auto_166427 ) ) ( not ( = ?auto_166426 ?auto_166428 ) ) ( not ( = ?auto_166427 ?auto_166428 ) ) ( ON-TABLE ?auto_166428 ) ( ON ?auto_166427 ?auto_166428 ) ( ON ?auto_166426 ?auto_166427 ) ( ON ?auto_166425 ?auto_166426 ) ( CLEAR ?auto_166423 ) ( ON ?auto_166424 ?auto_166425 ) ( CLEAR ?auto_166424 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_166428 ?auto_166427 ?auto_166426 ?auto_166425 )
      ( MAKE-8PILE ?auto_166421 ?auto_166422 ?auto_166423 ?auto_166424 ?auto_166425 ?auto_166426 ?auto_166427 ?auto_166428 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_166429 - BLOCK
      ?auto_166430 - BLOCK
      ?auto_166431 - BLOCK
      ?auto_166432 - BLOCK
      ?auto_166433 - BLOCK
      ?auto_166434 - BLOCK
      ?auto_166435 - BLOCK
      ?auto_166436 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_166429 ) ( ON ?auto_166430 ?auto_166429 ) ( not ( = ?auto_166429 ?auto_166430 ) ) ( not ( = ?auto_166429 ?auto_166431 ) ) ( not ( = ?auto_166429 ?auto_166432 ) ) ( not ( = ?auto_166429 ?auto_166433 ) ) ( not ( = ?auto_166429 ?auto_166434 ) ) ( not ( = ?auto_166429 ?auto_166435 ) ) ( not ( = ?auto_166429 ?auto_166436 ) ) ( not ( = ?auto_166430 ?auto_166431 ) ) ( not ( = ?auto_166430 ?auto_166432 ) ) ( not ( = ?auto_166430 ?auto_166433 ) ) ( not ( = ?auto_166430 ?auto_166434 ) ) ( not ( = ?auto_166430 ?auto_166435 ) ) ( not ( = ?auto_166430 ?auto_166436 ) ) ( not ( = ?auto_166431 ?auto_166432 ) ) ( not ( = ?auto_166431 ?auto_166433 ) ) ( not ( = ?auto_166431 ?auto_166434 ) ) ( not ( = ?auto_166431 ?auto_166435 ) ) ( not ( = ?auto_166431 ?auto_166436 ) ) ( not ( = ?auto_166432 ?auto_166433 ) ) ( not ( = ?auto_166432 ?auto_166434 ) ) ( not ( = ?auto_166432 ?auto_166435 ) ) ( not ( = ?auto_166432 ?auto_166436 ) ) ( not ( = ?auto_166433 ?auto_166434 ) ) ( not ( = ?auto_166433 ?auto_166435 ) ) ( not ( = ?auto_166433 ?auto_166436 ) ) ( not ( = ?auto_166434 ?auto_166435 ) ) ( not ( = ?auto_166434 ?auto_166436 ) ) ( not ( = ?auto_166435 ?auto_166436 ) ) ( ON-TABLE ?auto_166436 ) ( ON ?auto_166435 ?auto_166436 ) ( ON ?auto_166434 ?auto_166435 ) ( ON ?auto_166433 ?auto_166434 ) ( ON ?auto_166432 ?auto_166433 ) ( CLEAR ?auto_166432 ) ( HOLDING ?auto_166431 ) ( CLEAR ?auto_166430 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_166429 ?auto_166430 ?auto_166431 )
      ( MAKE-8PILE ?auto_166429 ?auto_166430 ?auto_166431 ?auto_166432 ?auto_166433 ?auto_166434 ?auto_166435 ?auto_166436 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_166437 - BLOCK
      ?auto_166438 - BLOCK
      ?auto_166439 - BLOCK
      ?auto_166440 - BLOCK
      ?auto_166441 - BLOCK
      ?auto_166442 - BLOCK
      ?auto_166443 - BLOCK
      ?auto_166444 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_166437 ) ( ON ?auto_166438 ?auto_166437 ) ( not ( = ?auto_166437 ?auto_166438 ) ) ( not ( = ?auto_166437 ?auto_166439 ) ) ( not ( = ?auto_166437 ?auto_166440 ) ) ( not ( = ?auto_166437 ?auto_166441 ) ) ( not ( = ?auto_166437 ?auto_166442 ) ) ( not ( = ?auto_166437 ?auto_166443 ) ) ( not ( = ?auto_166437 ?auto_166444 ) ) ( not ( = ?auto_166438 ?auto_166439 ) ) ( not ( = ?auto_166438 ?auto_166440 ) ) ( not ( = ?auto_166438 ?auto_166441 ) ) ( not ( = ?auto_166438 ?auto_166442 ) ) ( not ( = ?auto_166438 ?auto_166443 ) ) ( not ( = ?auto_166438 ?auto_166444 ) ) ( not ( = ?auto_166439 ?auto_166440 ) ) ( not ( = ?auto_166439 ?auto_166441 ) ) ( not ( = ?auto_166439 ?auto_166442 ) ) ( not ( = ?auto_166439 ?auto_166443 ) ) ( not ( = ?auto_166439 ?auto_166444 ) ) ( not ( = ?auto_166440 ?auto_166441 ) ) ( not ( = ?auto_166440 ?auto_166442 ) ) ( not ( = ?auto_166440 ?auto_166443 ) ) ( not ( = ?auto_166440 ?auto_166444 ) ) ( not ( = ?auto_166441 ?auto_166442 ) ) ( not ( = ?auto_166441 ?auto_166443 ) ) ( not ( = ?auto_166441 ?auto_166444 ) ) ( not ( = ?auto_166442 ?auto_166443 ) ) ( not ( = ?auto_166442 ?auto_166444 ) ) ( not ( = ?auto_166443 ?auto_166444 ) ) ( ON-TABLE ?auto_166444 ) ( ON ?auto_166443 ?auto_166444 ) ( ON ?auto_166442 ?auto_166443 ) ( ON ?auto_166441 ?auto_166442 ) ( ON ?auto_166440 ?auto_166441 ) ( CLEAR ?auto_166438 ) ( ON ?auto_166439 ?auto_166440 ) ( CLEAR ?auto_166439 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_166444 ?auto_166443 ?auto_166442 ?auto_166441 ?auto_166440 )
      ( MAKE-8PILE ?auto_166437 ?auto_166438 ?auto_166439 ?auto_166440 ?auto_166441 ?auto_166442 ?auto_166443 ?auto_166444 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_166445 - BLOCK
      ?auto_166446 - BLOCK
      ?auto_166447 - BLOCK
      ?auto_166448 - BLOCK
      ?auto_166449 - BLOCK
      ?auto_166450 - BLOCK
      ?auto_166451 - BLOCK
      ?auto_166452 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_166445 ) ( not ( = ?auto_166445 ?auto_166446 ) ) ( not ( = ?auto_166445 ?auto_166447 ) ) ( not ( = ?auto_166445 ?auto_166448 ) ) ( not ( = ?auto_166445 ?auto_166449 ) ) ( not ( = ?auto_166445 ?auto_166450 ) ) ( not ( = ?auto_166445 ?auto_166451 ) ) ( not ( = ?auto_166445 ?auto_166452 ) ) ( not ( = ?auto_166446 ?auto_166447 ) ) ( not ( = ?auto_166446 ?auto_166448 ) ) ( not ( = ?auto_166446 ?auto_166449 ) ) ( not ( = ?auto_166446 ?auto_166450 ) ) ( not ( = ?auto_166446 ?auto_166451 ) ) ( not ( = ?auto_166446 ?auto_166452 ) ) ( not ( = ?auto_166447 ?auto_166448 ) ) ( not ( = ?auto_166447 ?auto_166449 ) ) ( not ( = ?auto_166447 ?auto_166450 ) ) ( not ( = ?auto_166447 ?auto_166451 ) ) ( not ( = ?auto_166447 ?auto_166452 ) ) ( not ( = ?auto_166448 ?auto_166449 ) ) ( not ( = ?auto_166448 ?auto_166450 ) ) ( not ( = ?auto_166448 ?auto_166451 ) ) ( not ( = ?auto_166448 ?auto_166452 ) ) ( not ( = ?auto_166449 ?auto_166450 ) ) ( not ( = ?auto_166449 ?auto_166451 ) ) ( not ( = ?auto_166449 ?auto_166452 ) ) ( not ( = ?auto_166450 ?auto_166451 ) ) ( not ( = ?auto_166450 ?auto_166452 ) ) ( not ( = ?auto_166451 ?auto_166452 ) ) ( ON-TABLE ?auto_166452 ) ( ON ?auto_166451 ?auto_166452 ) ( ON ?auto_166450 ?auto_166451 ) ( ON ?auto_166449 ?auto_166450 ) ( ON ?auto_166448 ?auto_166449 ) ( ON ?auto_166447 ?auto_166448 ) ( CLEAR ?auto_166447 ) ( HOLDING ?auto_166446 ) ( CLEAR ?auto_166445 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_166445 ?auto_166446 )
      ( MAKE-8PILE ?auto_166445 ?auto_166446 ?auto_166447 ?auto_166448 ?auto_166449 ?auto_166450 ?auto_166451 ?auto_166452 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_166453 - BLOCK
      ?auto_166454 - BLOCK
      ?auto_166455 - BLOCK
      ?auto_166456 - BLOCK
      ?auto_166457 - BLOCK
      ?auto_166458 - BLOCK
      ?auto_166459 - BLOCK
      ?auto_166460 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_166453 ) ( not ( = ?auto_166453 ?auto_166454 ) ) ( not ( = ?auto_166453 ?auto_166455 ) ) ( not ( = ?auto_166453 ?auto_166456 ) ) ( not ( = ?auto_166453 ?auto_166457 ) ) ( not ( = ?auto_166453 ?auto_166458 ) ) ( not ( = ?auto_166453 ?auto_166459 ) ) ( not ( = ?auto_166453 ?auto_166460 ) ) ( not ( = ?auto_166454 ?auto_166455 ) ) ( not ( = ?auto_166454 ?auto_166456 ) ) ( not ( = ?auto_166454 ?auto_166457 ) ) ( not ( = ?auto_166454 ?auto_166458 ) ) ( not ( = ?auto_166454 ?auto_166459 ) ) ( not ( = ?auto_166454 ?auto_166460 ) ) ( not ( = ?auto_166455 ?auto_166456 ) ) ( not ( = ?auto_166455 ?auto_166457 ) ) ( not ( = ?auto_166455 ?auto_166458 ) ) ( not ( = ?auto_166455 ?auto_166459 ) ) ( not ( = ?auto_166455 ?auto_166460 ) ) ( not ( = ?auto_166456 ?auto_166457 ) ) ( not ( = ?auto_166456 ?auto_166458 ) ) ( not ( = ?auto_166456 ?auto_166459 ) ) ( not ( = ?auto_166456 ?auto_166460 ) ) ( not ( = ?auto_166457 ?auto_166458 ) ) ( not ( = ?auto_166457 ?auto_166459 ) ) ( not ( = ?auto_166457 ?auto_166460 ) ) ( not ( = ?auto_166458 ?auto_166459 ) ) ( not ( = ?auto_166458 ?auto_166460 ) ) ( not ( = ?auto_166459 ?auto_166460 ) ) ( ON-TABLE ?auto_166460 ) ( ON ?auto_166459 ?auto_166460 ) ( ON ?auto_166458 ?auto_166459 ) ( ON ?auto_166457 ?auto_166458 ) ( ON ?auto_166456 ?auto_166457 ) ( ON ?auto_166455 ?auto_166456 ) ( CLEAR ?auto_166453 ) ( ON ?auto_166454 ?auto_166455 ) ( CLEAR ?auto_166454 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_166460 ?auto_166459 ?auto_166458 ?auto_166457 ?auto_166456 ?auto_166455 )
      ( MAKE-8PILE ?auto_166453 ?auto_166454 ?auto_166455 ?auto_166456 ?auto_166457 ?auto_166458 ?auto_166459 ?auto_166460 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_166461 - BLOCK
      ?auto_166462 - BLOCK
      ?auto_166463 - BLOCK
      ?auto_166464 - BLOCK
      ?auto_166465 - BLOCK
      ?auto_166466 - BLOCK
      ?auto_166467 - BLOCK
      ?auto_166468 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_166461 ?auto_166462 ) ) ( not ( = ?auto_166461 ?auto_166463 ) ) ( not ( = ?auto_166461 ?auto_166464 ) ) ( not ( = ?auto_166461 ?auto_166465 ) ) ( not ( = ?auto_166461 ?auto_166466 ) ) ( not ( = ?auto_166461 ?auto_166467 ) ) ( not ( = ?auto_166461 ?auto_166468 ) ) ( not ( = ?auto_166462 ?auto_166463 ) ) ( not ( = ?auto_166462 ?auto_166464 ) ) ( not ( = ?auto_166462 ?auto_166465 ) ) ( not ( = ?auto_166462 ?auto_166466 ) ) ( not ( = ?auto_166462 ?auto_166467 ) ) ( not ( = ?auto_166462 ?auto_166468 ) ) ( not ( = ?auto_166463 ?auto_166464 ) ) ( not ( = ?auto_166463 ?auto_166465 ) ) ( not ( = ?auto_166463 ?auto_166466 ) ) ( not ( = ?auto_166463 ?auto_166467 ) ) ( not ( = ?auto_166463 ?auto_166468 ) ) ( not ( = ?auto_166464 ?auto_166465 ) ) ( not ( = ?auto_166464 ?auto_166466 ) ) ( not ( = ?auto_166464 ?auto_166467 ) ) ( not ( = ?auto_166464 ?auto_166468 ) ) ( not ( = ?auto_166465 ?auto_166466 ) ) ( not ( = ?auto_166465 ?auto_166467 ) ) ( not ( = ?auto_166465 ?auto_166468 ) ) ( not ( = ?auto_166466 ?auto_166467 ) ) ( not ( = ?auto_166466 ?auto_166468 ) ) ( not ( = ?auto_166467 ?auto_166468 ) ) ( ON-TABLE ?auto_166468 ) ( ON ?auto_166467 ?auto_166468 ) ( ON ?auto_166466 ?auto_166467 ) ( ON ?auto_166465 ?auto_166466 ) ( ON ?auto_166464 ?auto_166465 ) ( ON ?auto_166463 ?auto_166464 ) ( ON ?auto_166462 ?auto_166463 ) ( CLEAR ?auto_166462 ) ( HOLDING ?auto_166461 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_166461 )
      ( MAKE-8PILE ?auto_166461 ?auto_166462 ?auto_166463 ?auto_166464 ?auto_166465 ?auto_166466 ?auto_166467 ?auto_166468 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_166469 - BLOCK
      ?auto_166470 - BLOCK
      ?auto_166471 - BLOCK
      ?auto_166472 - BLOCK
      ?auto_166473 - BLOCK
      ?auto_166474 - BLOCK
      ?auto_166475 - BLOCK
      ?auto_166476 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_166469 ?auto_166470 ) ) ( not ( = ?auto_166469 ?auto_166471 ) ) ( not ( = ?auto_166469 ?auto_166472 ) ) ( not ( = ?auto_166469 ?auto_166473 ) ) ( not ( = ?auto_166469 ?auto_166474 ) ) ( not ( = ?auto_166469 ?auto_166475 ) ) ( not ( = ?auto_166469 ?auto_166476 ) ) ( not ( = ?auto_166470 ?auto_166471 ) ) ( not ( = ?auto_166470 ?auto_166472 ) ) ( not ( = ?auto_166470 ?auto_166473 ) ) ( not ( = ?auto_166470 ?auto_166474 ) ) ( not ( = ?auto_166470 ?auto_166475 ) ) ( not ( = ?auto_166470 ?auto_166476 ) ) ( not ( = ?auto_166471 ?auto_166472 ) ) ( not ( = ?auto_166471 ?auto_166473 ) ) ( not ( = ?auto_166471 ?auto_166474 ) ) ( not ( = ?auto_166471 ?auto_166475 ) ) ( not ( = ?auto_166471 ?auto_166476 ) ) ( not ( = ?auto_166472 ?auto_166473 ) ) ( not ( = ?auto_166472 ?auto_166474 ) ) ( not ( = ?auto_166472 ?auto_166475 ) ) ( not ( = ?auto_166472 ?auto_166476 ) ) ( not ( = ?auto_166473 ?auto_166474 ) ) ( not ( = ?auto_166473 ?auto_166475 ) ) ( not ( = ?auto_166473 ?auto_166476 ) ) ( not ( = ?auto_166474 ?auto_166475 ) ) ( not ( = ?auto_166474 ?auto_166476 ) ) ( not ( = ?auto_166475 ?auto_166476 ) ) ( ON-TABLE ?auto_166476 ) ( ON ?auto_166475 ?auto_166476 ) ( ON ?auto_166474 ?auto_166475 ) ( ON ?auto_166473 ?auto_166474 ) ( ON ?auto_166472 ?auto_166473 ) ( ON ?auto_166471 ?auto_166472 ) ( ON ?auto_166470 ?auto_166471 ) ( ON ?auto_166469 ?auto_166470 ) ( CLEAR ?auto_166469 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_166476 ?auto_166475 ?auto_166474 ?auto_166473 ?auto_166472 ?auto_166471 ?auto_166470 )
      ( MAKE-8PILE ?auto_166469 ?auto_166470 ?auto_166471 ?auto_166472 ?auto_166473 ?auto_166474 ?auto_166475 ?auto_166476 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_166477 - BLOCK
      ?auto_166478 - BLOCK
      ?auto_166479 - BLOCK
      ?auto_166480 - BLOCK
      ?auto_166481 - BLOCK
      ?auto_166482 - BLOCK
      ?auto_166483 - BLOCK
      ?auto_166484 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_166477 ?auto_166478 ) ) ( not ( = ?auto_166477 ?auto_166479 ) ) ( not ( = ?auto_166477 ?auto_166480 ) ) ( not ( = ?auto_166477 ?auto_166481 ) ) ( not ( = ?auto_166477 ?auto_166482 ) ) ( not ( = ?auto_166477 ?auto_166483 ) ) ( not ( = ?auto_166477 ?auto_166484 ) ) ( not ( = ?auto_166478 ?auto_166479 ) ) ( not ( = ?auto_166478 ?auto_166480 ) ) ( not ( = ?auto_166478 ?auto_166481 ) ) ( not ( = ?auto_166478 ?auto_166482 ) ) ( not ( = ?auto_166478 ?auto_166483 ) ) ( not ( = ?auto_166478 ?auto_166484 ) ) ( not ( = ?auto_166479 ?auto_166480 ) ) ( not ( = ?auto_166479 ?auto_166481 ) ) ( not ( = ?auto_166479 ?auto_166482 ) ) ( not ( = ?auto_166479 ?auto_166483 ) ) ( not ( = ?auto_166479 ?auto_166484 ) ) ( not ( = ?auto_166480 ?auto_166481 ) ) ( not ( = ?auto_166480 ?auto_166482 ) ) ( not ( = ?auto_166480 ?auto_166483 ) ) ( not ( = ?auto_166480 ?auto_166484 ) ) ( not ( = ?auto_166481 ?auto_166482 ) ) ( not ( = ?auto_166481 ?auto_166483 ) ) ( not ( = ?auto_166481 ?auto_166484 ) ) ( not ( = ?auto_166482 ?auto_166483 ) ) ( not ( = ?auto_166482 ?auto_166484 ) ) ( not ( = ?auto_166483 ?auto_166484 ) ) ( ON-TABLE ?auto_166484 ) ( ON ?auto_166483 ?auto_166484 ) ( ON ?auto_166482 ?auto_166483 ) ( ON ?auto_166481 ?auto_166482 ) ( ON ?auto_166480 ?auto_166481 ) ( ON ?auto_166479 ?auto_166480 ) ( ON ?auto_166478 ?auto_166479 ) ( HOLDING ?auto_166477 ) ( CLEAR ?auto_166478 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_166484 ?auto_166483 ?auto_166482 ?auto_166481 ?auto_166480 ?auto_166479 ?auto_166478 ?auto_166477 )
      ( MAKE-8PILE ?auto_166477 ?auto_166478 ?auto_166479 ?auto_166480 ?auto_166481 ?auto_166482 ?auto_166483 ?auto_166484 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_166485 - BLOCK
      ?auto_166486 - BLOCK
      ?auto_166487 - BLOCK
      ?auto_166488 - BLOCK
      ?auto_166489 - BLOCK
      ?auto_166490 - BLOCK
      ?auto_166491 - BLOCK
      ?auto_166492 - BLOCK
    )
    :vars
    (
      ?auto_166493 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_166485 ?auto_166486 ) ) ( not ( = ?auto_166485 ?auto_166487 ) ) ( not ( = ?auto_166485 ?auto_166488 ) ) ( not ( = ?auto_166485 ?auto_166489 ) ) ( not ( = ?auto_166485 ?auto_166490 ) ) ( not ( = ?auto_166485 ?auto_166491 ) ) ( not ( = ?auto_166485 ?auto_166492 ) ) ( not ( = ?auto_166486 ?auto_166487 ) ) ( not ( = ?auto_166486 ?auto_166488 ) ) ( not ( = ?auto_166486 ?auto_166489 ) ) ( not ( = ?auto_166486 ?auto_166490 ) ) ( not ( = ?auto_166486 ?auto_166491 ) ) ( not ( = ?auto_166486 ?auto_166492 ) ) ( not ( = ?auto_166487 ?auto_166488 ) ) ( not ( = ?auto_166487 ?auto_166489 ) ) ( not ( = ?auto_166487 ?auto_166490 ) ) ( not ( = ?auto_166487 ?auto_166491 ) ) ( not ( = ?auto_166487 ?auto_166492 ) ) ( not ( = ?auto_166488 ?auto_166489 ) ) ( not ( = ?auto_166488 ?auto_166490 ) ) ( not ( = ?auto_166488 ?auto_166491 ) ) ( not ( = ?auto_166488 ?auto_166492 ) ) ( not ( = ?auto_166489 ?auto_166490 ) ) ( not ( = ?auto_166489 ?auto_166491 ) ) ( not ( = ?auto_166489 ?auto_166492 ) ) ( not ( = ?auto_166490 ?auto_166491 ) ) ( not ( = ?auto_166490 ?auto_166492 ) ) ( not ( = ?auto_166491 ?auto_166492 ) ) ( ON-TABLE ?auto_166492 ) ( ON ?auto_166491 ?auto_166492 ) ( ON ?auto_166490 ?auto_166491 ) ( ON ?auto_166489 ?auto_166490 ) ( ON ?auto_166488 ?auto_166489 ) ( ON ?auto_166487 ?auto_166488 ) ( ON ?auto_166486 ?auto_166487 ) ( CLEAR ?auto_166486 ) ( ON ?auto_166485 ?auto_166493 ) ( CLEAR ?auto_166485 ) ( HAND-EMPTY ) ( not ( = ?auto_166485 ?auto_166493 ) ) ( not ( = ?auto_166486 ?auto_166493 ) ) ( not ( = ?auto_166487 ?auto_166493 ) ) ( not ( = ?auto_166488 ?auto_166493 ) ) ( not ( = ?auto_166489 ?auto_166493 ) ) ( not ( = ?auto_166490 ?auto_166493 ) ) ( not ( = ?auto_166491 ?auto_166493 ) ) ( not ( = ?auto_166492 ?auto_166493 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_166485 ?auto_166493 )
      ( MAKE-8PILE ?auto_166485 ?auto_166486 ?auto_166487 ?auto_166488 ?auto_166489 ?auto_166490 ?auto_166491 ?auto_166492 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_166494 - BLOCK
      ?auto_166495 - BLOCK
      ?auto_166496 - BLOCK
      ?auto_166497 - BLOCK
      ?auto_166498 - BLOCK
      ?auto_166499 - BLOCK
      ?auto_166500 - BLOCK
      ?auto_166501 - BLOCK
    )
    :vars
    (
      ?auto_166502 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_166494 ?auto_166495 ) ) ( not ( = ?auto_166494 ?auto_166496 ) ) ( not ( = ?auto_166494 ?auto_166497 ) ) ( not ( = ?auto_166494 ?auto_166498 ) ) ( not ( = ?auto_166494 ?auto_166499 ) ) ( not ( = ?auto_166494 ?auto_166500 ) ) ( not ( = ?auto_166494 ?auto_166501 ) ) ( not ( = ?auto_166495 ?auto_166496 ) ) ( not ( = ?auto_166495 ?auto_166497 ) ) ( not ( = ?auto_166495 ?auto_166498 ) ) ( not ( = ?auto_166495 ?auto_166499 ) ) ( not ( = ?auto_166495 ?auto_166500 ) ) ( not ( = ?auto_166495 ?auto_166501 ) ) ( not ( = ?auto_166496 ?auto_166497 ) ) ( not ( = ?auto_166496 ?auto_166498 ) ) ( not ( = ?auto_166496 ?auto_166499 ) ) ( not ( = ?auto_166496 ?auto_166500 ) ) ( not ( = ?auto_166496 ?auto_166501 ) ) ( not ( = ?auto_166497 ?auto_166498 ) ) ( not ( = ?auto_166497 ?auto_166499 ) ) ( not ( = ?auto_166497 ?auto_166500 ) ) ( not ( = ?auto_166497 ?auto_166501 ) ) ( not ( = ?auto_166498 ?auto_166499 ) ) ( not ( = ?auto_166498 ?auto_166500 ) ) ( not ( = ?auto_166498 ?auto_166501 ) ) ( not ( = ?auto_166499 ?auto_166500 ) ) ( not ( = ?auto_166499 ?auto_166501 ) ) ( not ( = ?auto_166500 ?auto_166501 ) ) ( ON-TABLE ?auto_166501 ) ( ON ?auto_166500 ?auto_166501 ) ( ON ?auto_166499 ?auto_166500 ) ( ON ?auto_166498 ?auto_166499 ) ( ON ?auto_166497 ?auto_166498 ) ( ON ?auto_166496 ?auto_166497 ) ( ON ?auto_166494 ?auto_166502 ) ( CLEAR ?auto_166494 ) ( not ( = ?auto_166494 ?auto_166502 ) ) ( not ( = ?auto_166495 ?auto_166502 ) ) ( not ( = ?auto_166496 ?auto_166502 ) ) ( not ( = ?auto_166497 ?auto_166502 ) ) ( not ( = ?auto_166498 ?auto_166502 ) ) ( not ( = ?auto_166499 ?auto_166502 ) ) ( not ( = ?auto_166500 ?auto_166502 ) ) ( not ( = ?auto_166501 ?auto_166502 ) ) ( HOLDING ?auto_166495 ) ( CLEAR ?auto_166496 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_166501 ?auto_166500 ?auto_166499 ?auto_166498 ?auto_166497 ?auto_166496 ?auto_166495 )
      ( MAKE-8PILE ?auto_166494 ?auto_166495 ?auto_166496 ?auto_166497 ?auto_166498 ?auto_166499 ?auto_166500 ?auto_166501 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_166503 - BLOCK
      ?auto_166504 - BLOCK
      ?auto_166505 - BLOCK
      ?auto_166506 - BLOCK
      ?auto_166507 - BLOCK
      ?auto_166508 - BLOCK
      ?auto_166509 - BLOCK
      ?auto_166510 - BLOCK
    )
    :vars
    (
      ?auto_166511 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_166503 ?auto_166504 ) ) ( not ( = ?auto_166503 ?auto_166505 ) ) ( not ( = ?auto_166503 ?auto_166506 ) ) ( not ( = ?auto_166503 ?auto_166507 ) ) ( not ( = ?auto_166503 ?auto_166508 ) ) ( not ( = ?auto_166503 ?auto_166509 ) ) ( not ( = ?auto_166503 ?auto_166510 ) ) ( not ( = ?auto_166504 ?auto_166505 ) ) ( not ( = ?auto_166504 ?auto_166506 ) ) ( not ( = ?auto_166504 ?auto_166507 ) ) ( not ( = ?auto_166504 ?auto_166508 ) ) ( not ( = ?auto_166504 ?auto_166509 ) ) ( not ( = ?auto_166504 ?auto_166510 ) ) ( not ( = ?auto_166505 ?auto_166506 ) ) ( not ( = ?auto_166505 ?auto_166507 ) ) ( not ( = ?auto_166505 ?auto_166508 ) ) ( not ( = ?auto_166505 ?auto_166509 ) ) ( not ( = ?auto_166505 ?auto_166510 ) ) ( not ( = ?auto_166506 ?auto_166507 ) ) ( not ( = ?auto_166506 ?auto_166508 ) ) ( not ( = ?auto_166506 ?auto_166509 ) ) ( not ( = ?auto_166506 ?auto_166510 ) ) ( not ( = ?auto_166507 ?auto_166508 ) ) ( not ( = ?auto_166507 ?auto_166509 ) ) ( not ( = ?auto_166507 ?auto_166510 ) ) ( not ( = ?auto_166508 ?auto_166509 ) ) ( not ( = ?auto_166508 ?auto_166510 ) ) ( not ( = ?auto_166509 ?auto_166510 ) ) ( ON-TABLE ?auto_166510 ) ( ON ?auto_166509 ?auto_166510 ) ( ON ?auto_166508 ?auto_166509 ) ( ON ?auto_166507 ?auto_166508 ) ( ON ?auto_166506 ?auto_166507 ) ( ON ?auto_166505 ?auto_166506 ) ( ON ?auto_166503 ?auto_166511 ) ( not ( = ?auto_166503 ?auto_166511 ) ) ( not ( = ?auto_166504 ?auto_166511 ) ) ( not ( = ?auto_166505 ?auto_166511 ) ) ( not ( = ?auto_166506 ?auto_166511 ) ) ( not ( = ?auto_166507 ?auto_166511 ) ) ( not ( = ?auto_166508 ?auto_166511 ) ) ( not ( = ?auto_166509 ?auto_166511 ) ) ( not ( = ?auto_166510 ?auto_166511 ) ) ( CLEAR ?auto_166505 ) ( ON ?auto_166504 ?auto_166503 ) ( CLEAR ?auto_166504 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_166511 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_166511 ?auto_166503 )
      ( MAKE-8PILE ?auto_166503 ?auto_166504 ?auto_166505 ?auto_166506 ?auto_166507 ?auto_166508 ?auto_166509 ?auto_166510 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_166512 - BLOCK
      ?auto_166513 - BLOCK
      ?auto_166514 - BLOCK
      ?auto_166515 - BLOCK
      ?auto_166516 - BLOCK
      ?auto_166517 - BLOCK
      ?auto_166518 - BLOCK
      ?auto_166519 - BLOCK
    )
    :vars
    (
      ?auto_166520 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_166512 ?auto_166513 ) ) ( not ( = ?auto_166512 ?auto_166514 ) ) ( not ( = ?auto_166512 ?auto_166515 ) ) ( not ( = ?auto_166512 ?auto_166516 ) ) ( not ( = ?auto_166512 ?auto_166517 ) ) ( not ( = ?auto_166512 ?auto_166518 ) ) ( not ( = ?auto_166512 ?auto_166519 ) ) ( not ( = ?auto_166513 ?auto_166514 ) ) ( not ( = ?auto_166513 ?auto_166515 ) ) ( not ( = ?auto_166513 ?auto_166516 ) ) ( not ( = ?auto_166513 ?auto_166517 ) ) ( not ( = ?auto_166513 ?auto_166518 ) ) ( not ( = ?auto_166513 ?auto_166519 ) ) ( not ( = ?auto_166514 ?auto_166515 ) ) ( not ( = ?auto_166514 ?auto_166516 ) ) ( not ( = ?auto_166514 ?auto_166517 ) ) ( not ( = ?auto_166514 ?auto_166518 ) ) ( not ( = ?auto_166514 ?auto_166519 ) ) ( not ( = ?auto_166515 ?auto_166516 ) ) ( not ( = ?auto_166515 ?auto_166517 ) ) ( not ( = ?auto_166515 ?auto_166518 ) ) ( not ( = ?auto_166515 ?auto_166519 ) ) ( not ( = ?auto_166516 ?auto_166517 ) ) ( not ( = ?auto_166516 ?auto_166518 ) ) ( not ( = ?auto_166516 ?auto_166519 ) ) ( not ( = ?auto_166517 ?auto_166518 ) ) ( not ( = ?auto_166517 ?auto_166519 ) ) ( not ( = ?auto_166518 ?auto_166519 ) ) ( ON-TABLE ?auto_166519 ) ( ON ?auto_166518 ?auto_166519 ) ( ON ?auto_166517 ?auto_166518 ) ( ON ?auto_166516 ?auto_166517 ) ( ON ?auto_166515 ?auto_166516 ) ( ON ?auto_166512 ?auto_166520 ) ( not ( = ?auto_166512 ?auto_166520 ) ) ( not ( = ?auto_166513 ?auto_166520 ) ) ( not ( = ?auto_166514 ?auto_166520 ) ) ( not ( = ?auto_166515 ?auto_166520 ) ) ( not ( = ?auto_166516 ?auto_166520 ) ) ( not ( = ?auto_166517 ?auto_166520 ) ) ( not ( = ?auto_166518 ?auto_166520 ) ) ( not ( = ?auto_166519 ?auto_166520 ) ) ( ON ?auto_166513 ?auto_166512 ) ( CLEAR ?auto_166513 ) ( ON-TABLE ?auto_166520 ) ( HOLDING ?auto_166514 ) ( CLEAR ?auto_166515 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_166519 ?auto_166518 ?auto_166517 ?auto_166516 ?auto_166515 ?auto_166514 )
      ( MAKE-8PILE ?auto_166512 ?auto_166513 ?auto_166514 ?auto_166515 ?auto_166516 ?auto_166517 ?auto_166518 ?auto_166519 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_166521 - BLOCK
      ?auto_166522 - BLOCK
      ?auto_166523 - BLOCK
      ?auto_166524 - BLOCK
      ?auto_166525 - BLOCK
      ?auto_166526 - BLOCK
      ?auto_166527 - BLOCK
      ?auto_166528 - BLOCK
    )
    :vars
    (
      ?auto_166529 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_166521 ?auto_166522 ) ) ( not ( = ?auto_166521 ?auto_166523 ) ) ( not ( = ?auto_166521 ?auto_166524 ) ) ( not ( = ?auto_166521 ?auto_166525 ) ) ( not ( = ?auto_166521 ?auto_166526 ) ) ( not ( = ?auto_166521 ?auto_166527 ) ) ( not ( = ?auto_166521 ?auto_166528 ) ) ( not ( = ?auto_166522 ?auto_166523 ) ) ( not ( = ?auto_166522 ?auto_166524 ) ) ( not ( = ?auto_166522 ?auto_166525 ) ) ( not ( = ?auto_166522 ?auto_166526 ) ) ( not ( = ?auto_166522 ?auto_166527 ) ) ( not ( = ?auto_166522 ?auto_166528 ) ) ( not ( = ?auto_166523 ?auto_166524 ) ) ( not ( = ?auto_166523 ?auto_166525 ) ) ( not ( = ?auto_166523 ?auto_166526 ) ) ( not ( = ?auto_166523 ?auto_166527 ) ) ( not ( = ?auto_166523 ?auto_166528 ) ) ( not ( = ?auto_166524 ?auto_166525 ) ) ( not ( = ?auto_166524 ?auto_166526 ) ) ( not ( = ?auto_166524 ?auto_166527 ) ) ( not ( = ?auto_166524 ?auto_166528 ) ) ( not ( = ?auto_166525 ?auto_166526 ) ) ( not ( = ?auto_166525 ?auto_166527 ) ) ( not ( = ?auto_166525 ?auto_166528 ) ) ( not ( = ?auto_166526 ?auto_166527 ) ) ( not ( = ?auto_166526 ?auto_166528 ) ) ( not ( = ?auto_166527 ?auto_166528 ) ) ( ON-TABLE ?auto_166528 ) ( ON ?auto_166527 ?auto_166528 ) ( ON ?auto_166526 ?auto_166527 ) ( ON ?auto_166525 ?auto_166526 ) ( ON ?auto_166524 ?auto_166525 ) ( ON ?auto_166521 ?auto_166529 ) ( not ( = ?auto_166521 ?auto_166529 ) ) ( not ( = ?auto_166522 ?auto_166529 ) ) ( not ( = ?auto_166523 ?auto_166529 ) ) ( not ( = ?auto_166524 ?auto_166529 ) ) ( not ( = ?auto_166525 ?auto_166529 ) ) ( not ( = ?auto_166526 ?auto_166529 ) ) ( not ( = ?auto_166527 ?auto_166529 ) ) ( not ( = ?auto_166528 ?auto_166529 ) ) ( ON ?auto_166522 ?auto_166521 ) ( ON-TABLE ?auto_166529 ) ( CLEAR ?auto_166524 ) ( ON ?auto_166523 ?auto_166522 ) ( CLEAR ?auto_166523 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_166529 ?auto_166521 ?auto_166522 )
      ( MAKE-8PILE ?auto_166521 ?auto_166522 ?auto_166523 ?auto_166524 ?auto_166525 ?auto_166526 ?auto_166527 ?auto_166528 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_166530 - BLOCK
      ?auto_166531 - BLOCK
      ?auto_166532 - BLOCK
      ?auto_166533 - BLOCK
      ?auto_166534 - BLOCK
      ?auto_166535 - BLOCK
      ?auto_166536 - BLOCK
      ?auto_166537 - BLOCK
    )
    :vars
    (
      ?auto_166538 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_166530 ?auto_166531 ) ) ( not ( = ?auto_166530 ?auto_166532 ) ) ( not ( = ?auto_166530 ?auto_166533 ) ) ( not ( = ?auto_166530 ?auto_166534 ) ) ( not ( = ?auto_166530 ?auto_166535 ) ) ( not ( = ?auto_166530 ?auto_166536 ) ) ( not ( = ?auto_166530 ?auto_166537 ) ) ( not ( = ?auto_166531 ?auto_166532 ) ) ( not ( = ?auto_166531 ?auto_166533 ) ) ( not ( = ?auto_166531 ?auto_166534 ) ) ( not ( = ?auto_166531 ?auto_166535 ) ) ( not ( = ?auto_166531 ?auto_166536 ) ) ( not ( = ?auto_166531 ?auto_166537 ) ) ( not ( = ?auto_166532 ?auto_166533 ) ) ( not ( = ?auto_166532 ?auto_166534 ) ) ( not ( = ?auto_166532 ?auto_166535 ) ) ( not ( = ?auto_166532 ?auto_166536 ) ) ( not ( = ?auto_166532 ?auto_166537 ) ) ( not ( = ?auto_166533 ?auto_166534 ) ) ( not ( = ?auto_166533 ?auto_166535 ) ) ( not ( = ?auto_166533 ?auto_166536 ) ) ( not ( = ?auto_166533 ?auto_166537 ) ) ( not ( = ?auto_166534 ?auto_166535 ) ) ( not ( = ?auto_166534 ?auto_166536 ) ) ( not ( = ?auto_166534 ?auto_166537 ) ) ( not ( = ?auto_166535 ?auto_166536 ) ) ( not ( = ?auto_166535 ?auto_166537 ) ) ( not ( = ?auto_166536 ?auto_166537 ) ) ( ON-TABLE ?auto_166537 ) ( ON ?auto_166536 ?auto_166537 ) ( ON ?auto_166535 ?auto_166536 ) ( ON ?auto_166534 ?auto_166535 ) ( ON ?auto_166530 ?auto_166538 ) ( not ( = ?auto_166530 ?auto_166538 ) ) ( not ( = ?auto_166531 ?auto_166538 ) ) ( not ( = ?auto_166532 ?auto_166538 ) ) ( not ( = ?auto_166533 ?auto_166538 ) ) ( not ( = ?auto_166534 ?auto_166538 ) ) ( not ( = ?auto_166535 ?auto_166538 ) ) ( not ( = ?auto_166536 ?auto_166538 ) ) ( not ( = ?auto_166537 ?auto_166538 ) ) ( ON ?auto_166531 ?auto_166530 ) ( ON-TABLE ?auto_166538 ) ( ON ?auto_166532 ?auto_166531 ) ( CLEAR ?auto_166532 ) ( HOLDING ?auto_166533 ) ( CLEAR ?auto_166534 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_166537 ?auto_166536 ?auto_166535 ?auto_166534 ?auto_166533 )
      ( MAKE-8PILE ?auto_166530 ?auto_166531 ?auto_166532 ?auto_166533 ?auto_166534 ?auto_166535 ?auto_166536 ?auto_166537 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_166539 - BLOCK
      ?auto_166540 - BLOCK
      ?auto_166541 - BLOCK
      ?auto_166542 - BLOCK
      ?auto_166543 - BLOCK
      ?auto_166544 - BLOCK
      ?auto_166545 - BLOCK
      ?auto_166546 - BLOCK
    )
    :vars
    (
      ?auto_166547 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_166539 ?auto_166540 ) ) ( not ( = ?auto_166539 ?auto_166541 ) ) ( not ( = ?auto_166539 ?auto_166542 ) ) ( not ( = ?auto_166539 ?auto_166543 ) ) ( not ( = ?auto_166539 ?auto_166544 ) ) ( not ( = ?auto_166539 ?auto_166545 ) ) ( not ( = ?auto_166539 ?auto_166546 ) ) ( not ( = ?auto_166540 ?auto_166541 ) ) ( not ( = ?auto_166540 ?auto_166542 ) ) ( not ( = ?auto_166540 ?auto_166543 ) ) ( not ( = ?auto_166540 ?auto_166544 ) ) ( not ( = ?auto_166540 ?auto_166545 ) ) ( not ( = ?auto_166540 ?auto_166546 ) ) ( not ( = ?auto_166541 ?auto_166542 ) ) ( not ( = ?auto_166541 ?auto_166543 ) ) ( not ( = ?auto_166541 ?auto_166544 ) ) ( not ( = ?auto_166541 ?auto_166545 ) ) ( not ( = ?auto_166541 ?auto_166546 ) ) ( not ( = ?auto_166542 ?auto_166543 ) ) ( not ( = ?auto_166542 ?auto_166544 ) ) ( not ( = ?auto_166542 ?auto_166545 ) ) ( not ( = ?auto_166542 ?auto_166546 ) ) ( not ( = ?auto_166543 ?auto_166544 ) ) ( not ( = ?auto_166543 ?auto_166545 ) ) ( not ( = ?auto_166543 ?auto_166546 ) ) ( not ( = ?auto_166544 ?auto_166545 ) ) ( not ( = ?auto_166544 ?auto_166546 ) ) ( not ( = ?auto_166545 ?auto_166546 ) ) ( ON-TABLE ?auto_166546 ) ( ON ?auto_166545 ?auto_166546 ) ( ON ?auto_166544 ?auto_166545 ) ( ON ?auto_166543 ?auto_166544 ) ( ON ?auto_166539 ?auto_166547 ) ( not ( = ?auto_166539 ?auto_166547 ) ) ( not ( = ?auto_166540 ?auto_166547 ) ) ( not ( = ?auto_166541 ?auto_166547 ) ) ( not ( = ?auto_166542 ?auto_166547 ) ) ( not ( = ?auto_166543 ?auto_166547 ) ) ( not ( = ?auto_166544 ?auto_166547 ) ) ( not ( = ?auto_166545 ?auto_166547 ) ) ( not ( = ?auto_166546 ?auto_166547 ) ) ( ON ?auto_166540 ?auto_166539 ) ( ON-TABLE ?auto_166547 ) ( ON ?auto_166541 ?auto_166540 ) ( CLEAR ?auto_166543 ) ( ON ?auto_166542 ?auto_166541 ) ( CLEAR ?auto_166542 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_166547 ?auto_166539 ?auto_166540 ?auto_166541 )
      ( MAKE-8PILE ?auto_166539 ?auto_166540 ?auto_166541 ?auto_166542 ?auto_166543 ?auto_166544 ?auto_166545 ?auto_166546 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_166548 - BLOCK
      ?auto_166549 - BLOCK
      ?auto_166550 - BLOCK
      ?auto_166551 - BLOCK
      ?auto_166552 - BLOCK
      ?auto_166553 - BLOCK
      ?auto_166554 - BLOCK
      ?auto_166555 - BLOCK
    )
    :vars
    (
      ?auto_166556 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_166548 ?auto_166549 ) ) ( not ( = ?auto_166548 ?auto_166550 ) ) ( not ( = ?auto_166548 ?auto_166551 ) ) ( not ( = ?auto_166548 ?auto_166552 ) ) ( not ( = ?auto_166548 ?auto_166553 ) ) ( not ( = ?auto_166548 ?auto_166554 ) ) ( not ( = ?auto_166548 ?auto_166555 ) ) ( not ( = ?auto_166549 ?auto_166550 ) ) ( not ( = ?auto_166549 ?auto_166551 ) ) ( not ( = ?auto_166549 ?auto_166552 ) ) ( not ( = ?auto_166549 ?auto_166553 ) ) ( not ( = ?auto_166549 ?auto_166554 ) ) ( not ( = ?auto_166549 ?auto_166555 ) ) ( not ( = ?auto_166550 ?auto_166551 ) ) ( not ( = ?auto_166550 ?auto_166552 ) ) ( not ( = ?auto_166550 ?auto_166553 ) ) ( not ( = ?auto_166550 ?auto_166554 ) ) ( not ( = ?auto_166550 ?auto_166555 ) ) ( not ( = ?auto_166551 ?auto_166552 ) ) ( not ( = ?auto_166551 ?auto_166553 ) ) ( not ( = ?auto_166551 ?auto_166554 ) ) ( not ( = ?auto_166551 ?auto_166555 ) ) ( not ( = ?auto_166552 ?auto_166553 ) ) ( not ( = ?auto_166552 ?auto_166554 ) ) ( not ( = ?auto_166552 ?auto_166555 ) ) ( not ( = ?auto_166553 ?auto_166554 ) ) ( not ( = ?auto_166553 ?auto_166555 ) ) ( not ( = ?auto_166554 ?auto_166555 ) ) ( ON-TABLE ?auto_166555 ) ( ON ?auto_166554 ?auto_166555 ) ( ON ?auto_166553 ?auto_166554 ) ( ON ?auto_166548 ?auto_166556 ) ( not ( = ?auto_166548 ?auto_166556 ) ) ( not ( = ?auto_166549 ?auto_166556 ) ) ( not ( = ?auto_166550 ?auto_166556 ) ) ( not ( = ?auto_166551 ?auto_166556 ) ) ( not ( = ?auto_166552 ?auto_166556 ) ) ( not ( = ?auto_166553 ?auto_166556 ) ) ( not ( = ?auto_166554 ?auto_166556 ) ) ( not ( = ?auto_166555 ?auto_166556 ) ) ( ON ?auto_166549 ?auto_166548 ) ( ON-TABLE ?auto_166556 ) ( ON ?auto_166550 ?auto_166549 ) ( ON ?auto_166551 ?auto_166550 ) ( CLEAR ?auto_166551 ) ( HOLDING ?auto_166552 ) ( CLEAR ?auto_166553 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_166555 ?auto_166554 ?auto_166553 ?auto_166552 )
      ( MAKE-8PILE ?auto_166548 ?auto_166549 ?auto_166550 ?auto_166551 ?auto_166552 ?auto_166553 ?auto_166554 ?auto_166555 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_166557 - BLOCK
      ?auto_166558 - BLOCK
      ?auto_166559 - BLOCK
      ?auto_166560 - BLOCK
      ?auto_166561 - BLOCK
      ?auto_166562 - BLOCK
      ?auto_166563 - BLOCK
      ?auto_166564 - BLOCK
    )
    :vars
    (
      ?auto_166565 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_166557 ?auto_166558 ) ) ( not ( = ?auto_166557 ?auto_166559 ) ) ( not ( = ?auto_166557 ?auto_166560 ) ) ( not ( = ?auto_166557 ?auto_166561 ) ) ( not ( = ?auto_166557 ?auto_166562 ) ) ( not ( = ?auto_166557 ?auto_166563 ) ) ( not ( = ?auto_166557 ?auto_166564 ) ) ( not ( = ?auto_166558 ?auto_166559 ) ) ( not ( = ?auto_166558 ?auto_166560 ) ) ( not ( = ?auto_166558 ?auto_166561 ) ) ( not ( = ?auto_166558 ?auto_166562 ) ) ( not ( = ?auto_166558 ?auto_166563 ) ) ( not ( = ?auto_166558 ?auto_166564 ) ) ( not ( = ?auto_166559 ?auto_166560 ) ) ( not ( = ?auto_166559 ?auto_166561 ) ) ( not ( = ?auto_166559 ?auto_166562 ) ) ( not ( = ?auto_166559 ?auto_166563 ) ) ( not ( = ?auto_166559 ?auto_166564 ) ) ( not ( = ?auto_166560 ?auto_166561 ) ) ( not ( = ?auto_166560 ?auto_166562 ) ) ( not ( = ?auto_166560 ?auto_166563 ) ) ( not ( = ?auto_166560 ?auto_166564 ) ) ( not ( = ?auto_166561 ?auto_166562 ) ) ( not ( = ?auto_166561 ?auto_166563 ) ) ( not ( = ?auto_166561 ?auto_166564 ) ) ( not ( = ?auto_166562 ?auto_166563 ) ) ( not ( = ?auto_166562 ?auto_166564 ) ) ( not ( = ?auto_166563 ?auto_166564 ) ) ( ON-TABLE ?auto_166564 ) ( ON ?auto_166563 ?auto_166564 ) ( ON ?auto_166562 ?auto_166563 ) ( ON ?auto_166557 ?auto_166565 ) ( not ( = ?auto_166557 ?auto_166565 ) ) ( not ( = ?auto_166558 ?auto_166565 ) ) ( not ( = ?auto_166559 ?auto_166565 ) ) ( not ( = ?auto_166560 ?auto_166565 ) ) ( not ( = ?auto_166561 ?auto_166565 ) ) ( not ( = ?auto_166562 ?auto_166565 ) ) ( not ( = ?auto_166563 ?auto_166565 ) ) ( not ( = ?auto_166564 ?auto_166565 ) ) ( ON ?auto_166558 ?auto_166557 ) ( ON-TABLE ?auto_166565 ) ( ON ?auto_166559 ?auto_166558 ) ( ON ?auto_166560 ?auto_166559 ) ( CLEAR ?auto_166562 ) ( ON ?auto_166561 ?auto_166560 ) ( CLEAR ?auto_166561 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_166565 ?auto_166557 ?auto_166558 ?auto_166559 ?auto_166560 )
      ( MAKE-8PILE ?auto_166557 ?auto_166558 ?auto_166559 ?auto_166560 ?auto_166561 ?auto_166562 ?auto_166563 ?auto_166564 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_166566 - BLOCK
      ?auto_166567 - BLOCK
      ?auto_166568 - BLOCK
      ?auto_166569 - BLOCK
      ?auto_166570 - BLOCK
      ?auto_166571 - BLOCK
      ?auto_166572 - BLOCK
      ?auto_166573 - BLOCK
    )
    :vars
    (
      ?auto_166574 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_166566 ?auto_166567 ) ) ( not ( = ?auto_166566 ?auto_166568 ) ) ( not ( = ?auto_166566 ?auto_166569 ) ) ( not ( = ?auto_166566 ?auto_166570 ) ) ( not ( = ?auto_166566 ?auto_166571 ) ) ( not ( = ?auto_166566 ?auto_166572 ) ) ( not ( = ?auto_166566 ?auto_166573 ) ) ( not ( = ?auto_166567 ?auto_166568 ) ) ( not ( = ?auto_166567 ?auto_166569 ) ) ( not ( = ?auto_166567 ?auto_166570 ) ) ( not ( = ?auto_166567 ?auto_166571 ) ) ( not ( = ?auto_166567 ?auto_166572 ) ) ( not ( = ?auto_166567 ?auto_166573 ) ) ( not ( = ?auto_166568 ?auto_166569 ) ) ( not ( = ?auto_166568 ?auto_166570 ) ) ( not ( = ?auto_166568 ?auto_166571 ) ) ( not ( = ?auto_166568 ?auto_166572 ) ) ( not ( = ?auto_166568 ?auto_166573 ) ) ( not ( = ?auto_166569 ?auto_166570 ) ) ( not ( = ?auto_166569 ?auto_166571 ) ) ( not ( = ?auto_166569 ?auto_166572 ) ) ( not ( = ?auto_166569 ?auto_166573 ) ) ( not ( = ?auto_166570 ?auto_166571 ) ) ( not ( = ?auto_166570 ?auto_166572 ) ) ( not ( = ?auto_166570 ?auto_166573 ) ) ( not ( = ?auto_166571 ?auto_166572 ) ) ( not ( = ?auto_166571 ?auto_166573 ) ) ( not ( = ?auto_166572 ?auto_166573 ) ) ( ON-TABLE ?auto_166573 ) ( ON ?auto_166572 ?auto_166573 ) ( ON ?auto_166566 ?auto_166574 ) ( not ( = ?auto_166566 ?auto_166574 ) ) ( not ( = ?auto_166567 ?auto_166574 ) ) ( not ( = ?auto_166568 ?auto_166574 ) ) ( not ( = ?auto_166569 ?auto_166574 ) ) ( not ( = ?auto_166570 ?auto_166574 ) ) ( not ( = ?auto_166571 ?auto_166574 ) ) ( not ( = ?auto_166572 ?auto_166574 ) ) ( not ( = ?auto_166573 ?auto_166574 ) ) ( ON ?auto_166567 ?auto_166566 ) ( ON-TABLE ?auto_166574 ) ( ON ?auto_166568 ?auto_166567 ) ( ON ?auto_166569 ?auto_166568 ) ( ON ?auto_166570 ?auto_166569 ) ( CLEAR ?auto_166570 ) ( HOLDING ?auto_166571 ) ( CLEAR ?auto_166572 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_166573 ?auto_166572 ?auto_166571 )
      ( MAKE-8PILE ?auto_166566 ?auto_166567 ?auto_166568 ?auto_166569 ?auto_166570 ?auto_166571 ?auto_166572 ?auto_166573 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_166575 - BLOCK
      ?auto_166576 - BLOCK
      ?auto_166577 - BLOCK
      ?auto_166578 - BLOCK
      ?auto_166579 - BLOCK
      ?auto_166580 - BLOCK
      ?auto_166581 - BLOCK
      ?auto_166582 - BLOCK
    )
    :vars
    (
      ?auto_166583 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_166575 ?auto_166576 ) ) ( not ( = ?auto_166575 ?auto_166577 ) ) ( not ( = ?auto_166575 ?auto_166578 ) ) ( not ( = ?auto_166575 ?auto_166579 ) ) ( not ( = ?auto_166575 ?auto_166580 ) ) ( not ( = ?auto_166575 ?auto_166581 ) ) ( not ( = ?auto_166575 ?auto_166582 ) ) ( not ( = ?auto_166576 ?auto_166577 ) ) ( not ( = ?auto_166576 ?auto_166578 ) ) ( not ( = ?auto_166576 ?auto_166579 ) ) ( not ( = ?auto_166576 ?auto_166580 ) ) ( not ( = ?auto_166576 ?auto_166581 ) ) ( not ( = ?auto_166576 ?auto_166582 ) ) ( not ( = ?auto_166577 ?auto_166578 ) ) ( not ( = ?auto_166577 ?auto_166579 ) ) ( not ( = ?auto_166577 ?auto_166580 ) ) ( not ( = ?auto_166577 ?auto_166581 ) ) ( not ( = ?auto_166577 ?auto_166582 ) ) ( not ( = ?auto_166578 ?auto_166579 ) ) ( not ( = ?auto_166578 ?auto_166580 ) ) ( not ( = ?auto_166578 ?auto_166581 ) ) ( not ( = ?auto_166578 ?auto_166582 ) ) ( not ( = ?auto_166579 ?auto_166580 ) ) ( not ( = ?auto_166579 ?auto_166581 ) ) ( not ( = ?auto_166579 ?auto_166582 ) ) ( not ( = ?auto_166580 ?auto_166581 ) ) ( not ( = ?auto_166580 ?auto_166582 ) ) ( not ( = ?auto_166581 ?auto_166582 ) ) ( ON-TABLE ?auto_166582 ) ( ON ?auto_166581 ?auto_166582 ) ( ON ?auto_166575 ?auto_166583 ) ( not ( = ?auto_166575 ?auto_166583 ) ) ( not ( = ?auto_166576 ?auto_166583 ) ) ( not ( = ?auto_166577 ?auto_166583 ) ) ( not ( = ?auto_166578 ?auto_166583 ) ) ( not ( = ?auto_166579 ?auto_166583 ) ) ( not ( = ?auto_166580 ?auto_166583 ) ) ( not ( = ?auto_166581 ?auto_166583 ) ) ( not ( = ?auto_166582 ?auto_166583 ) ) ( ON ?auto_166576 ?auto_166575 ) ( ON-TABLE ?auto_166583 ) ( ON ?auto_166577 ?auto_166576 ) ( ON ?auto_166578 ?auto_166577 ) ( ON ?auto_166579 ?auto_166578 ) ( CLEAR ?auto_166581 ) ( ON ?auto_166580 ?auto_166579 ) ( CLEAR ?auto_166580 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_166583 ?auto_166575 ?auto_166576 ?auto_166577 ?auto_166578 ?auto_166579 )
      ( MAKE-8PILE ?auto_166575 ?auto_166576 ?auto_166577 ?auto_166578 ?auto_166579 ?auto_166580 ?auto_166581 ?auto_166582 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_166584 - BLOCK
      ?auto_166585 - BLOCK
      ?auto_166586 - BLOCK
      ?auto_166587 - BLOCK
      ?auto_166588 - BLOCK
      ?auto_166589 - BLOCK
      ?auto_166590 - BLOCK
      ?auto_166591 - BLOCK
    )
    :vars
    (
      ?auto_166592 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_166584 ?auto_166585 ) ) ( not ( = ?auto_166584 ?auto_166586 ) ) ( not ( = ?auto_166584 ?auto_166587 ) ) ( not ( = ?auto_166584 ?auto_166588 ) ) ( not ( = ?auto_166584 ?auto_166589 ) ) ( not ( = ?auto_166584 ?auto_166590 ) ) ( not ( = ?auto_166584 ?auto_166591 ) ) ( not ( = ?auto_166585 ?auto_166586 ) ) ( not ( = ?auto_166585 ?auto_166587 ) ) ( not ( = ?auto_166585 ?auto_166588 ) ) ( not ( = ?auto_166585 ?auto_166589 ) ) ( not ( = ?auto_166585 ?auto_166590 ) ) ( not ( = ?auto_166585 ?auto_166591 ) ) ( not ( = ?auto_166586 ?auto_166587 ) ) ( not ( = ?auto_166586 ?auto_166588 ) ) ( not ( = ?auto_166586 ?auto_166589 ) ) ( not ( = ?auto_166586 ?auto_166590 ) ) ( not ( = ?auto_166586 ?auto_166591 ) ) ( not ( = ?auto_166587 ?auto_166588 ) ) ( not ( = ?auto_166587 ?auto_166589 ) ) ( not ( = ?auto_166587 ?auto_166590 ) ) ( not ( = ?auto_166587 ?auto_166591 ) ) ( not ( = ?auto_166588 ?auto_166589 ) ) ( not ( = ?auto_166588 ?auto_166590 ) ) ( not ( = ?auto_166588 ?auto_166591 ) ) ( not ( = ?auto_166589 ?auto_166590 ) ) ( not ( = ?auto_166589 ?auto_166591 ) ) ( not ( = ?auto_166590 ?auto_166591 ) ) ( ON-TABLE ?auto_166591 ) ( ON ?auto_166584 ?auto_166592 ) ( not ( = ?auto_166584 ?auto_166592 ) ) ( not ( = ?auto_166585 ?auto_166592 ) ) ( not ( = ?auto_166586 ?auto_166592 ) ) ( not ( = ?auto_166587 ?auto_166592 ) ) ( not ( = ?auto_166588 ?auto_166592 ) ) ( not ( = ?auto_166589 ?auto_166592 ) ) ( not ( = ?auto_166590 ?auto_166592 ) ) ( not ( = ?auto_166591 ?auto_166592 ) ) ( ON ?auto_166585 ?auto_166584 ) ( ON-TABLE ?auto_166592 ) ( ON ?auto_166586 ?auto_166585 ) ( ON ?auto_166587 ?auto_166586 ) ( ON ?auto_166588 ?auto_166587 ) ( ON ?auto_166589 ?auto_166588 ) ( CLEAR ?auto_166589 ) ( HOLDING ?auto_166590 ) ( CLEAR ?auto_166591 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_166591 ?auto_166590 )
      ( MAKE-8PILE ?auto_166584 ?auto_166585 ?auto_166586 ?auto_166587 ?auto_166588 ?auto_166589 ?auto_166590 ?auto_166591 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_166593 - BLOCK
      ?auto_166594 - BLOCK
      ?auto_166595 - BLOCK
      ?auto_166596 - BLOCK
      ?auto_166597 - BLOCK
      ?auto_166598 - BLOCK
      ?auto_166599 - BLOCK
      ?auto_166600 - BLOCK
    )
    :vars
    (
      ?auto_166601 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_166593 ?auto_166594 ) ) ( not ( = ?auto_166593 ?auto_166595 ) ) ( not ( = ?auto_166593 ?auto_166596 ) ) ( not ( = ?auto_166593 ?auto_166597 ) ) ( not ( = ?auto_166593 ?auto_166598 ) ) ( not ( = ?auto_166593 ?auto_166599 ) ) ( not ( = ?auto_166593 ?auto_166600 ) ) ( not ( = ?auto_166594 ?auto_166595 ) ) ( not ( = ?auto_166594 ?auto_166596 ) ) ( not ( = ?auto_166594 ?auto_166597 ) ) ( not ( = ?auto_166594 ?auto_166598 ) ) ( not ( = ?auto_166594 ?auto_166599 ) ) ( not ( = ?auto_166594 ?auto_166600 ) ) ( not ( = ?auto_166595 ?auto_166596 ) ) ( not ( = ?auto_166595 ?auto_166597 ) ) ( not ( = ?auto_166595 ?auto_166598 ) ) ( not ( = ?auto_166595 ?auto_166599 ) ) ( not ( = ?auto_166595 ?auto_166600 ) ) ( not ( = ?auto_166596 ?auto_166597 ) ) ( not ( = ?auto_166596 ?auto_166598 ) ) ( not ( = ?auto_166596 ?auto_166599 ) ) ( not ( = ?auto_166596 ?auto_166600 ) ) ( not ( = ?auto_166597 ?auto_166598 ) ) ( not ( = ?auto_166597 ?auto_166599 ) ) ( not ( = ?auto_166597 ?auto_166600 ) ) ( not ( = ?auto_166598 ?auto_166599 ) ) ( not ( = ?auto_166598 ?auto_166600 ) ) ( not ( = ?auto_166599 ?auto_166600 ) ) ( ON-TABLE ?auto_166600 ) ( ON ?auto_166593 ?auto_166601 ) ( not ( = ?auto_166593 ?auto_166601 ) ) ( not ( = ?auto_166594 ?auto_166601 ) ) ( not ( = ?auto_166595 ?auto_166601 ) ) ( not ( = ?auto_166596 ?auto_166601 ) ) ( not ( = ?auto_166597 ?auto_166601 ) ) ( not ( = ?auto_166598 ?auto_166601 ) ) ( not ( = ?auto_166599 ?auto_166601 ) ) ( not ( = ?auto_166600 ?auto_166601 ) ) ( ON ?auto_166594 ?auto_166593 ) ( ON-TABLE ?auto_166601 ) ( ON ?auto_166595 ?auto_166594 ) ( ON ?auto_166596 ?auto_166595 ) ( ON ?auto_166597 ?auto_166596 ) ( ON ?auto_166598 ?auto_166597 ) ( CLEAR ?auto_166600 ) ( ON ?auto_166599 ?auto_166598 ) ( CLEAR ?auto_166599 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_166601 ?auto_166593 ?auto_166594 ?auto_166595 ?auto_166596 ?auto_166597 ?auto_166598 )
      ( MAKE-8PILE ?auto_166593 ?auto_166594 ?auto_166595 ?auto_166596 ?auto_166597 ?auto_166598 ?auto_166599 ?auto_166600 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_166602 - BLOCK
      ?auto_166603 - BLOCK
      ?auto_166604 - BLOCK
      ?auto_166605 - BLOCK
      ?auto_166606 - BLOCK
      ?auto_166607 - BLOCK
      ?auto_166608 - BLOCK
      ?auto_166609 - BLOCK
    )
    :vars
    (
      ?auto_166610 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_166602 ?auto_166603 ) ) ( not ( = ?auto_166602 ?auto_166604 ) ) ( not ( = ?auto_166602 ?auto_166605 ) ) ( not ( = ?auto_166602 ?auto_166606 ) ) ( not ( = ?auto_166602 ?auto_166607 ) ) ( not ( = ?auto_166602 ?auto_166608 ) ) ( not ( = ?auto_166602 ?auto_166609 ) ) ( not ( = ?auto_166603 ?auto_166604 ) ) ( not ( = ?auto_166603 ?auto_166605 ) ) ( not ( = ?auto_166603 ?auto_166606 ) ) ( not ( = ?auto_166603 ?auto_166607 ) ) ( not ( = ?auto_166603 ?auto_166608 ) ) ( not ( = ?auto_166603 ?auto_166609 ) ) ( not ( = ?auto_166604 ?auto_166605 ) ) ( not ( = ?auto_166604 ?auto_166606 ) ) ( not ( = ?auto_166604 ?auto_166607 ) ) ( not ( = ?auto_166604 ?auto_166608 ) ) ( not ( = ?auto_166604 ?auto_166609 ) ) ( not ( = ?auto_166605 ?auto_166606 ) ) ( not ( = ?auto_166605 ?auto_166607 ) ) ( not ( = ?auto_166605 ?auto_166608 ) ) ( not ( = ?auto_166605 ?auto_166609 ) ) ( not ( = ?auto_166606 ?auto_166607 ) ) ( not ( = ?auto_166606 ?auto_166608 ) ) ( not ( = ?auto_166606 ?auto_166609 ) ) ( not ( = ?auto_166607 ?auto_166608 ) ) ( not ( = ?auto_166607 ?auto_166609 ) ) ( not ( = ?auto_166608 ?auto_166609 ) ) ( ON ?auto_166602 ?auto_166610 ) ( not ( = ?auto_166602 ?auto_166610 ) ) ( not ( = ?auto_166603 ?auto_166610 ) ) ( not ( = ?auto_166604 ?auto_166610 ) ) ( not ( = ?auto_166605 ?auto_166610 ) ) ( not ( = ?auto_166606 ?auto_166610 ) ) ( not ( = ?auto_166607 ?auto_166610 ) ) ( not ( = ?auto_166608 ?auto_166610 ) ) ( not ( = ?auto_166609 ?auto_166610 ) ) ( ON ?auto_166603 ?auto_166602 ) ( ON-TABLE ?auto_166610 ) ( ON ?auto_166604 ?auto_166603 ) ( ON ?auto_166605 ?auto_166604 ) ( ON ?auto_166606 ?auto_166605 ) ( ON ?auto_166607 ?auto_166606 ) ( ON ?auto_166608 ?auto_166607 ) ( CLEAR ?auto_166608 ) ( HOLDING ?auto_166609 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_166609 )
      ( MAKE-8PILE ?auto_166602 ?auto_166603 ?auto_166604 ?auto_166605 ?auto_166606 ?auto_166607 ?auto_166608 ?auto_166609 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_166611 - BLOCK
      ?auto_166612 - BLOCK
      ?auto_166613 - BLOCK
      ?auto_166614 - BLOCK
      ?auto_166615 - BLOCK
      ?auto_166616 - BLOCK
      ?auto_166617 - BLOCK
      ?auto_166618 - BLOCK
    )
    :vars
    (
      ?auto_166619 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_166611 ?auto_166612 ) ) ( not ( = ?auto_166611 ?auto_166613 ) ) ( not ( = ?auto_166611 ?auto_166614 ) ) ( not ( = ?auto_166611 ?auto_166615 ) ) ( not ( = ?auto_166611 ?auto_166616 ) ) ( not ( = ?auto_166611 ?auto_166617 ) ) ( not ( = ?auto_166611 ?auto_166618 ) ) ( not ( = ?auto_166612 ?auto_166613 ) ) ( not ( = ?auto_166612 ?auto_166614 ) ) ( not ( = ?auto_166612 ?auto_166615 ) ) ( not ( = ?auto_166612 ?auto_166616 ) ) ( not ( = ?auto_166612 ?auto_166617 ) ) ( not ( = ?auto_166612 ?auto_166618 ) ) ( not ( = ?auto_166613 ?auto_166614 ) ) ( not ( = ?auto_166613 ?auto_166615 ) ) ( not ( = ?auto_166613 ?auto_166616 ) ) ( not ( = ?auto_166613 ?auto_166617 ) ) ( not ( = ?auto_166613 ?auto_166618 ) ) ( not ( = ?auto_166614 ?auto_166615 ) ) ( not ( = ?auto_166614 ?auto_166616 ) ) ( not ( = ?auto_166614 ?auto_166617 ) ) ( not ( = ?auto_166614 ?auto_166618 ) ) ( not ( = ?auto_166615 ?auto_166616 ) ) ( not ( = ?auto_166615 ?auto_166617 ) ) ( not ( = ?auto_166615 ?auto_166618 ) ) ( not ( = ?auto_166616 ?auto_166617 ) ) ( not ( = ?auto_166616 ?auto_166618 ) ) ( not ( = ?auto_166617 ?auto_166618 ) ) ( ON ?auto_166611 ?auto_166619 ) ( not ( = ?auto_166611 ?auto_166619 ) ) ( not ( = ?auto_166612 ?auto_166619 ) ) ( not ( = ?auto_166613 ?auto_166619 ) ) ( not ( = ?auto_166614 ?auto_166619 ) ) ( not ( = ?auto_166615 ?auto_166619 ) ) ( not ( = ?auto_166616 ?auto_166619 ) ) ( not ( = ?auto_166617 ?auto_166619 ) ) ( not ( = ?auto_166618 ?auto_166619 ) ) ( ON ?auto_166612 ?auto_166611 ) ( ON-TABLE ?auto_166619 ) ( ON ?auto_166613 ?auto_166612 ) ( ON ?auto_166614 ?auto_166613 ) ( ON ?auto_166615 ?auto_166614 ) ( ON ?auto_166616 ?auto_166615 ) ( ON ?auto_166617 ?auto_166616 ) ( ON ?auto_166618 ?auto_166617 ) ( CLEAR ?auto_166618 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_166619 ?auto_166611 ?auto_166612 ?auto_166613 ?auto_166614 ?auto_166615 ?auto_166616 ?auto_166617 )
      ( MAKE-8PILE ?auto_166611 ?auto_166612 ?auto_166613 ?auto_166614 ?auto_166615 ?auto_166616 ?auto_166617 ?auto_166618 ) )
  )

)

