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
      ?auto_154398 - BLOCK
      ?auto_154399 - BLOCK
      ?auto_154400 - BLOCK
      ?auto_154401 - BLOCK
      ?auto_154402 - BLOCK
      ?auto_154403 - BLOCK
      ?auto_154404 - BLOCK
      ?auto_154405 - BLOCK
    )
    :vars
    (
      ?auto_154406 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_154406 ?auto_154405 ) ( CLEAR ?auto_154406 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_154398 ) ( ON ?auto_154399 ?auto_154398 ) ( ON ?auto_154400 ?auto_154399 ) ( ON ?auto_154401 ?auto_154400 ) ( ON ?auto_154402 ?auto_154401 ) ( ON ?auto_154403 ?auto_154402 ) ( ON ?auto_154404 ?auto_154403 ) ( ON ?auto_154405 ?auto_154404 ) ( not ( = ?auto_154398 ?auto_154399 ) ) ( not ( = ?auto_154398 ?auto_154400 ) ) ( not ( = ?auto_154398 ?auto_154401 ) ) ( not ( = ?auto_154398 ?auto_154402 ) ) ( not ( = ?auto_154398 ?auto_154403 ) ) ( not ( = ?auto_154398 ?auto_154404 ) ) ( not ( = ?auto_154398 ?auto_154405 ) ) ( not ( = ?auto_154398 ?auto_154406 ) ) ( not ( = ?auto_154399 ?auto_154400 ) ) ( not ( = ?auto_154399 ?auto_154401 ) ) ( not ( = ?auto_154399 ?auto_154402 ) ) ( not ( = ?auto_154399 ?auto_154403 ) ) ( not ( = ?auto_154399 ?auto_154404 ) ) ( not ( = ?auto_154399 ?auto_154405 ) ) ( not ( = ?auto_154399 ?auto_154406 ) ) ( not ( = ?auto_154400 ?auto_154401 ) ) ( not ( = ?auto_154400 ?auto_154402 ) ) ( not ( = ?auto_154400 ?auto_154403 ) ) ( not ( = ?auto_154400 ?auto_154404 ) ) ( not ( = ?auto_154400 ?auto_154405 ) ) ( not ( = ?auto_154400 ?auto_154406 ) ) ( not ( = ?auto_154401 ?auto_154402 ) ) ( not ( = ?auto_154401 ?auto_154403 ) ) ( not ( = ?auto_154401 ?auto_154404 ) ) ( not ( = ?auto_154401 ?auto_154405 ) ) ( not ( = ?auto_154401 ?auto_154406 ) ) ( not ( = ?auto_154402 ?auto_154403 ) ) ( not ( = ?auto_154402 ?auto_154404 ) ) ( not ( = ?auto_154402 ?auto_154405 ) ) ( not ( = ?auto_154402 ?auto_154406 ) ) ( not ( = ?auto_154403 ?auto_154404 ) ) ( not ( = ?auto_154403 ?auto_154405 ) ) ( not ( = ?auto_154403 ?auto_154406 ) ) ( not ( = ?auto_154404 ?auto_154405 ) ) ( not ( = ?auto_154404 ?auto_154406 ) ) ( not ( = ?auto_154405 ?auto_154406 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_154406 ?auto_154405 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_154408 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_154408 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_154408 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_154409 - BLOCK
    )
    :vars
    (
      ?auto_154410 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_154409 ?auto_154410 ) ( CLEAR ?auto_154409 ) ( HAND-EMPTY ) ( not ( = ?auto_154409 ?auto_154410 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_154409 ?auto_154410 )
      ( MAKE-1PILE ?auto_154409 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_154418 - BLOCK
      ?auto_154419 - BLOCK
      ?auto_154420 - BLOCK
      ?auto_154421 - BLOCK
      ?auto_154422 - BLOCK
      ?auto_154423 - BLOCK
      ?auto_154424 - BLOCK
    )
    :vars
    (
      ?auto_154425 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_154425 ?auto_154424 ) ( CLEAR ?auto_154425 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_154418 ) ( ON ?auto_154419 ?auto_154418 ) ( ON ?auto_154420 ?auto_154419 ) ( ON ?auto_154421 ?auto_154420 ) ( ON ?auto_154422 ?auto_154421 ) ( ON ?auto_154423 ?auto_154422 ) ( ON ?auto_154424 ?auto_154423 ) ( not ( = ?auto_154418 ?auto_154419 ) ) ( not ( = ?auto_154418 ?auto_154420 ) ) ( not ( = ?auto_154418 ?auto_154421 ) ) ( not ( = ?auto_154418 ?auto_154422 ) ) ( not ( = ?auto_154418 ?auto_154423 ) ) ( not ( = ?auto_154418 ?auto_154424 ) ) ( not ( = ?auto_154418 ?auto_154425 ) ) ( not ( = ?auto_154419 ?auto_154420 ) ) ( not ( = ?auto_154419 ?auto_154421 ) ) ( not ( = ?auto_154419 ?auto_154422 ) ) ( not ( = ?auto_154419 ?auto_154423 ) ) ( not ( = ?auto_154419 ?auto_154424 ) ) ( not ( = ?auto_154419 ?auto_154425 ) ) ( not ( = ?auto_154420 ?auto_154421 ) ) ( not ( = ?auto_154420 ?auto_154422 ) ) ( not ( = ?auto_154420 ?auto_154423 ) ) ( not ( = ?auto_154420 ?auto_154424 ) ) ( not ( = ?auto_154420 ?auto_154425 ) ) ( not ( = ?auto_154421 ?auto_154422 ) ) ( not ( = ?auto_154421 ?auto_154423 ) ) ( not ( = ?auto_154421 ?auto_154424 ) ) ( not ( = ?auto_154421 ?auto_154425 ) ) ( not ( = ?auto_154422 ?auto_154423 ) ) ( not ( = ?auto_154422 ?auto_154424 ) ) ( not ( = ?auto_154422 ?auto_154425 ) ) ( not ( = ?auto_154423 ?auto_154424 ) ) ( not ( = ?auto_154423 ?auto_154425 ) ) ( not ( = ?auto_154424 ?auto_154425 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_154425 ?auto_154424 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_154426 - BLOCK
      ?auto_154427 - BLOCK
      ?auto_154428 - BLOCK
      ?auto_154429 - BLOCK
      ?auto_154430 - BLOCK
      ?auto_154431 - BLOCK
      ?auto_154432 - BLOCK
    )
    :vars
    (
      ?auto_154433 - BLOCK
      ?auto_154434 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_154433 ?auto_154432 ) ( CLEAR ?auto_154433 ) ( ON-TABLE ?auto_154426 ) ( ON ?auto_154427 ?auto_154426 ) ( ON ?auto_154428 ?auto_154427 ) ( ON ?auto_154429 ?auto_154428 ) ( ON ?auto_154430 ?auto_154429 ) ( ON ?auto_154431 ?auto_154430 ) ( ON ?auto_154432 ?auto_154431 ) ( not ( = ?auto_154426 ?auto_154427 ) ) ( not ( = ?auto_154426 ?auto_154428 ) ) ( not ( = ?auto_154426 ?auto_154429 ) ) ( not ( = ?auto_154426 ?auto_154430 ) ) ( not ( = ?auto_154426 ?auto_154431 ) ) ( not ( = ?auto_154426 ?auto_154432 ) ) ( not ( = ?auto_154426 ?auto_154433 ) ) ( not ( = ?auto_154427 ?auto_154428 ) ) ( not ( = ?auto_154427 ?auto_154429 ) ) ( not ( = ?auto_154427 ?auto_154430 ) ) ( not ( = ?auto_154427 ?auto_154431 ) ) ( not ( = ?auto_154427 ?auto_154432 ) ) ( not ( = ?auto_154427 ?auto_154433 ) ) ( not ( = ?auto_154428 ?auto_154429 ) ) ( not ( = ?auto_154428 ?auto_154430 ) ) ( not ( = ?auto_154428 ?auto_154431 ) ) ( not ( = ?auto_154428 ?auto_154432 ) ) ( not ( = ?auto_154428 ?auto_154433 ) ) ( not ( = ?auto_154429 ?auto_154430 ) ) ( not ( = ?auto_154429 ?auto_154431 ) ) ( not ( = ?auto_154429 ?auto_154432 ) ) ( not ( = ?auto_154429 ?auto_154433 ) ) ( not ( = ?auto_154430 ?auto_154431 ) ) ( not ( = ?auto_154430 ?auto_154432 ) ) ( not ( = ?auto_154430 ?auto_154433 ) ) ( not ( = ?auto_154431 ?auto_154432 ) ) ( not ( = ?auto_154431 ?auto_154433 ) ) ( not ( = ?auto_154432 ?auto_154433 ) ) ( HOLDING ?auto_154434 ) ( not ( = ?auto_154426 ?auto_154434 ) ) ( not ( = ?auto_154427 ?auto_154434 ) ) ( not ( = ?auto_154428 ?auto_154434 ) ) ( not ( = ?auto_154429 ?auto_154434 ) ) ( not ( = ?auto_154430 ?auto_154434 ) ) ( not ( = ?auto_154431 ?auto_154434 ) ) ( not ( = ?auto_154432 ?auto_154434 ) ) ( not ( = ?auto_154433 ?auto_154434 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_154434 )
      ( MAKE-7PILE ?auto_154426 ?auto_154427 ?auto_154428 ?auto_154429 ?auto_154430 ?auto_154431 ?auto_154432 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_154435 - BLOCK
      ?auto_154436 - BLOCK
      ?auto_154437 - BLOCK
      ?auto_154438 - BLOCK
      ?auto_154439 - BLOCK
      ?auto_154440 - BLOCK
      ?auto_154441 - BLOCK
    )
    :vars
    (
      ?auto_154443 - BLOCK
      ?auto_154442 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_154443 ?auto_154441 ) ( ON-TABLE ?auto_154435 ) ( ON ?auto_154436 ?auto_154435 ) ( ON ?auto_154437 ?auto_154436 ) ( ON ?auto_154438 ?auto_154437 ) ( ON ?auto_154439 ?auto_154438 ) ( ON ?auto_154440 ?auto_154439 ) ( ON ?auto_154441 ?auto_154440 ) ( not ( = ?auto_154435 ?auto_154436 ) ) ( not ( = ?auto_154435 ?auto_154437 ) ) ( not ( = ?auto_154435 ?auto_154438 ) ) ( not ( = ?auto_154435 ?auto_154439 ) ) ( not ( = ?auto_154435 ?auto_154440 ) ) ( not ( = ?auto_154435 ?auto_154441 ) ) ( not ( = ?auto_154435 ?auto_154443 ) ) ( not ( = ?auto_154436 ?auto_154437 ) ) ( not ( = ?auto_154436 ?auto_154438 ) ) ( not ( = ?auto_154436 ?auto_154439 ) ) ( not ( = ?auto_154436 ?auto_154440 ) ) ( not ( = ?auto_154436 ?auto_154441 ) ) ( not ( = ?auto_154436 ?auto_154443 ) ) ( not ( = ?auto_154437 ?auto_154438 ) ) ( not ( = ?auto_154437 ?auto_154439 ) ) ( not ( = ?auto_154437 ?auto_154440 ) ) ( not ( = ?auto_154437 ?auto_154441 ) ) ( not ( = ?auto_154437 ?auto_154443 ) ) ( not ( = ?auto_154438 ?auto_154439 ) ) ( not ( = ?auto_154438 ?auto_154440 ) ) ( not ( = ?auto_154438 ?auto_154441 ) ) ( not ( = ?auto_154438 ?auto_154443 ) ) ( not ( = ?auto_154439 ?auto_154440 ) ) ( not ( = ?auto_154439 ?auto_154441 ) ) ( not ( = ?auto_154439 ?auto_154443 ) ) ( not ( = ?auto_154440 ?auto_154441 ) ) ( not ( = ?auto_154440 ?auto_154443 ) ) ( not ( = ?auto_154441 ?auto_154443 ) ) ( not ( = ?auto_154435 ?auto_154442 ) ) ( not ( = ?auto_154436 ?auto_154442 ) ) ( not ( = ?auto_154437 ?auto_154442 ) ) ( not ( = ?auto_154438 ?auto_154442 ) ) ( not ( = ?auto_154439 ?auto_154442 ) ) ( not ( = ?auto_154440 ?auto_154442 ) ) ( not ( = ?auto_154441 ?auto_154442 ) ) ( not ( = ?auto_154443 ?auto_154442 ) ) ( ON ?auto_154442 ?auto_154443 ) ( CLEAR ?auto_154442 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_154435 ?auto_154436 ?auto_154437 ?auto_154438 ?auto_154439 ?auto_154440 ?auto_154441 ?auto_154443 )
      ( MAKE-7PILE ?auto_154435 ?auto_154436 ?auto_154437 ?auto_154438 ?auto_154439 ?auto_154440 ?auto_154441 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_154446 - BLOCK
      ?auto_154447 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_154447 ) ( CLEAR ?auto_154446 ) ( ON-TABLE ?auto_154446 ) ( not ( = ?auto_154446 ?auto_154447 ) ) )
    :subtasks
    ( ( !STACK ?auto_154447 ?auto_154446 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_154448 - BLOCK
      ?auto_154449 - BLOCK
    )
    :vars
    (
      ?auto_154450 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_154448 ) ( ON-TABLE ?auto_154448 ) ( not ( = ?auto_154448 ?auto_154449 ) ) ( ON ?auto_154449 ?auto_154450 ) ( CLEAR ?auto_154449 ) ( HAND-EMPTY ) ( not ( = ?auto_154448 ?auto_154450 ) ) ( not ( = ?auto_154449 ?auto_154450 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_154449 ?auto_154450 )
      ( MAKE-2PILE ?auto_154448 ?auto_154449 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_154451 - BLOCK
      ?auto_154452 - BLOCK
    )
    :vars
    (
      ?auto_154453 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_154451 ?auto_154452 ) ) ( ON ?auto_154452 ?auto_154453 ) ( CLEAR ?auto_154452 ) ( not ( = ?auto_154451 ?auto_154453 ) ) ( not ( = ?auto_154452 ?auto_154453 ) ) ( HOLDING ?auto_154451 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_154451 )
      ( MAKE-2PILE ?auto_154451 ?auto_154452 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_154454 - BLOCK
      ?auto_154455 - BLOCK
    )
    :vars
    (
      ?auto_154456 - BLOCK
      ?auto_154461 - BLOCK
      ?auto_154459 - BLOCK
      ?auto_154458 - BLOCK
      ?auto_154462 - BLOCK
      ?auto_154457 - BLOCK
      ?auto_154460 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_154454 ?auto_154455 ) ) ( ON ?auto_154455 ?auto_154456 ) ( not ( = ?auto_154454 ?auto_154456 ) ) ( not ( = ?auto_154455 ?auto_154456 ) ) ( ON ?auto_154454 ?auto_154455 ) ( CLEAR ?auto_154454 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_154461 ) ( ON ?auto_154459 ?auto_154461 ) ( ON ?auto_154458 ?auto_154459 ) ( ON ?auto_154462 ?auto_154458 ) ( ON ?auto_154457 ?auto_154462 ) ( ON ?auto_154460 ?auto_154457 ) ( ON ?auto_154456 ?auto_154460 ) ( not ( = ?auto_154461 ?auto_154459 ) ) ( not ( = ?auto_154461 ?auto_154458 ) ) ( not ( = ?auto_154461 ?auto_154462 ) ) ( not ( = ?auto_154461 ?auto_154457 ) ) ( not ( = ?auto_154461 ?auto_154460 ) ) ( not ( = ?auto_154461 ?auto_154456 ) ) ( not ( = ?auto_154461 ?auto_154455 ) ) ( not ( = ?auto_154461 ?auto_154454 ) ) ( not ( = ?auto_154459 ?auto_154458 ) ) ( not ( = ?auto_154459 ?auto_154462 ) ) ( not ( = ?auto_154459 ?auto_154457 ) ) ( not ( = ?auto_154459 ?auto_154460 ) ) ( not ( = ?auto_154459 ?auto_154456 ) ) ( not ( = ?auto_154459 ?auto_154455 ) ) ( not ( = ?auto_154459 ?auto_154454 ) ) ( not ( = ?auto_154458 ?auto_154462 ) ) ( not ( = ?auto_154458 ?auto_154457 ) ) ( not ( = ?auto_154458 ?auto_154460 ) ) ( not ( = ?auto_154458 ?auto_154456 ) ) ( not ( = ?auto_154458 ?auto_154455 ) ) ( not ( = ?auto_154458 ?auto_154454 ) ) ( not ( = ?auto_154462 ?auto_154457 ) ) ( not ( = ?auto_154462 ?auto_154460 ) ) ( not ( = ?auto_154462 ?auto_154456 ) ) ( not ( = ?auto_154462 ?auto_154455 ) ) ( not ( = ?auto_154462 ?auto_154454 ) ) ( not ( = ?auto_154457 ?auto_154460 ) ) ( not ( = ?auto_154457 ?auto_154456 ) ) ( not ( = ?auto_154457 ?auto_154455 ) ) ( not ( = ?auto_154457 ?auto_154454 ) ) ( not ( = ?auto_154460 ?auto_154456 ) ) ( not ( = ?auto_154460 ?auto_154455 ) ) ( not ( = ?auto_154460 ?auto_154454 ) ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_154461 ?auto_154459 ?auto_154458 ?auto_154462 ?auto_154457 ?auto_154460 ?auto_154456 ?auto_154455 )
      ( MAKE-2PILE ?auto_154454 ?auto_154455 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_154469 - BLOCK
      ?auto_154470 - BLOCK
      ?auto_154471 - BLOCK
      ?auto_154472 - BLOCK
      ?auto_154473 - BLOCK
      ?auto_154474 - BLOCK
    )
    :vars
    (
      ?auto_154475 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_154475 ?auto_154474 ) ( CLEAR ?auto_154475 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_154469 ) ( ON ?auto_154470 ?auto_154469 ) ( ON ?auto_154471 ?auto_154470 ) ( ON ?auto_154472 ?auto_154471 ) ( ON ?auto_154473 ?auto_154472 ) ( ON ?auto_154474 ?auto_154473 ) ( not ( = ?auto_154469 ?auto_154470 ) ) ( not ( = ?auto_154469 ?auto_154471 ) ) ( not ( = ?auto_154469 ?auto_154472 ) ) ( not ( = ?auto_154469 ?auto_154473 ) ) ( not ( = ?auto_154469 ?auto_154474 ) ) ( not ( = ?auto_154469 ?auto_154475 ) ) ( not ( = ?auto_154470 ?auto_154471 ) ) ( not ( = ?auto_154470 ?auto_154472 ) ) ( not ( = ?auto_154470 ?auto_154473 ) ) ( not ( = ?auto_154470 ?auto_154474 ) ) ( not ( = ?auto_154470 ?auto_154475 ) ) ( not ( = ?auto_154471 ?auto_154472 ) ) ( not ( = ?auto_154471 ?auto_154473 ) ) ( not ( = ?auto_154471 ?auto_154474 ) ) ( not ( = ?auto_154471 ?auto_154475 ) ) ( not ( = ?auto_154472 ?auto_154473 ) ) ( not ( = ?auto_154472 ?auto_154474 ) ) ( not ( = ?auto_154472 ?auto_154475 ) ) ( not ( = ?auto_154473 ?auto_154474 ) ) ( not ( = ?auto_154473 ?auto_154475 ) ) ( not ( = ?auto_154474 ?auto_154475 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_154475 ?auto_154474 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_154476 - BLOCK
      ?auto_154477 - BLOCK
      ?auto_154478 - BLOCK
      ?auto_154479 - BLOCK
      ?auto_154480 - BLOCK
      ?auto_154481 - BLOCK
    )
    :vars
    (
      ?auto_154482 - BLOCK
      ?auto_154483 - BLOCK
      ?auto_154484 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_154482 ?auto_154481 ) ( CLEAR ?auto_154482 ) ( ON-TABLE ?auto_154476 ) ( ON ?auto_154477 ?auto_154476 ) ( ON ?auto_154478 ?auto_154477 ) ( ON ?auto_154479 ?auto_154478 ) ( ON ?auto_154480 ?auto_154479 ) ( ON ?auto_154481 ?auto_154480 ) ( not ( = ?auto_154476 ?auto_154477 ) ) ( not ( = ?auto_154476 ?auto_154478 ) ) ( not ( = ?auto_154476 ?auto_154479 ) ) ( not ( = ?auto_154476 ?auto_154480 ) ) ( not ( = ?auto_154476 ?auto_154481 ) ) ( not ( = ?auto_154476 ?auto_154482 ) ) ( not ( = ?auto_154477 ?auto_154478 ) ) ( not ( = ?auto_154477 ?auto_154479 ) ) ( not ( = ?auto_154477 ?auto_154480 ) ) ( not ( = ?auto_154477 ?auto_154481 ) ) ( not ( = ?auto_154477 ?auto_154482 ) ) ( not ( = ?auto_154478 ?auto_154479 ) ) ( not ( = ?auto_154478 ?auto_154480 ) ) ( not ( = ?auto_154478 ?auto_154481 ) ) ( not ( = ?auto_154478 ?auto_154482 ) ) ( not ( = ?auto_154479 ?auto_154480 ) ) ( not ( = ?auto_154479 ?auto_154481 ) ) ( not ( = ?auto_154479 ?auto_154482 ) ) ( not ( = ?auto_154480 ?auto_154481 ) ) ( not ( = ?auto_154480 ?auto_154482 ) ) ( not ( = ?auto_154481 ?auto_154482 ) ) ( HOLDING ?auto_154483 ) ( CLEAR ?auto_154484 ) ( not ( = ?auto_154476 ?auto_154483 ) ) ( not ( = ?auto_154476 ?auto_154484 ) ) ( not ( = ?auto_154477 ?auto_154483 ) ) ( not ( = ?auto_154477 ?auto_154484 ) ) ( not ( = ?auto_154478 ?auto_154483 ) ) ( not ( = ?auto_154478 ?auto_154484 ) ) ( not ( = ?auto_154479 ?auto_154483 ) ) ( not ( = ?auto_154479 ?auto_154484 ) ) ( not ( = ?auto_154480 ?auto_154483 ) ) ( not ( = ?auto_154480 ?auto_154484 ) ) ( not ( = ?auto_154481 ?auto_154483 ) ) ( not ( = ?auto_154481 ?auto_154484 ) ) ( not ( = ?auto_154482 ?auto_154483 ) ) ( not ( = ?auto_154482 ?auto_154484 ) ) ( not ( = ?auto_154483 ?auto_154484 ) ) )
    :subtasks
    ( ( !STACK ?auto_154483 ?auto_154484 )
      ( MAKE-6PILE ?auto_154476 ?auto_154477 ?auto_154478 ?auto_154479 ?auto_154480 ?auto_154481 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_155816 - BLOCK
      ?auto_155817 - BLOCK
      ?auto_155818 - BLOCK
      ?auto_155819 - BLOCK
      ?auto_155820 - BLOCK
      ?auto_155821 - BLOCK
    )
    :vars
    (
      ?auto_155823 - BLOCK
      ?auto_155822 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_155823 ?auto_155821 ) ( ON-TABLE ?auto_155816 ) ( ON ?auto_155817 ?auto_155816 ) ( ON ?auto_155818 ?auto_155817 ) ( ON ?auto_155819 ?auto_155818 ) ( ON ?auto_155820 ?auto_155819 ) ( ON ?auto_155821 ?auto_155820 ) ( not ( = ?auto_155816 ?auto_155817 ) ) ( not ( = ?auto_155816 ?auto_155818 ) ) ( not ( = ?auto_155816 ?auto_155819 ) ) ( not ( = ?auto_155816 ?auto_155820 ) ) ( not ( = ?auto_155816 ?auto_155821 ) ) ( not ( = ?auto_155816 ?auto_155823 ) ) ( not ( = ?auto_155817 ?auto_155818 ) ) ( not ( = ?auto_155817 ?auto_155819 ) ) ( not ( = ?auto_155817 ?auto_155820 ) ) ( not ( = ?auto_155817 ?auto_155821 ) ) ( not ( = ?auto_155817 ?auto_155823 ) ) ( not ( = ?auto_155818 ?auto_155819 ) ) ( not ( = ?auto_155818 ?auto_155820 ) ) ( not ( = ?auto_155818 ?auto_155821 ) ) ( not ( = ?auto_155818 ?auto_155823 ) ) ( not ( = ?auto_155819 ?auto_155820 ) ) ( not ( = ?auto_155819 ?auto_155821 ) ) ( not ( = ?auto_155819 ?auto_155823 ) ) ( not ( = ?auto_155820 ?auto_155821 ) ) ( not ( = ?auto_155820 ?auto_155823 ) ) ( not ( = ?auto_155821 ?auto_155823 ) ) ( not ( = ?auto_155816 ?auto_155822 ) ) ( not ( = ?auto_155817 ?auto_155822 ) ) ( not ( = ?auto_155818 ?auto_155822 ) ) ( not ( = ?auto_155819 ?auto_155822 ) ) ( not ( = ?auto_155820 ?auto_155822 ) ) ( not ( = ?auto_155821 ?auto_155822 ) ) ( not ( = ?auto_155823 ?auto_155822 ) ) ( ON ?auto_155822 ?auto_155823 ) ( CLEAR ?auto_155822 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_155816 ?auto_155817 ?auto_155818 ?auto_155819 ?auto_155820 ?auto_155821 ?auto_155823 )
      ( MAKE-6PILE ?auto_155816 ?auto_155817 ?auto_155818 ?auto_155819 ?auto_155820 ?auto_155821 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_154494 - BLOCK
      ?auto_154495 - BLOCK
      ?auto_154496 - BLOCK
      ?auto_154497 - BLOCK
      ?auto_154498 - BLOCK
      ?auto_154499 - BLOCK
    )
    :vars
    (
      ?auto_154501 - BLOCK
      ?auto_154502 - BLOCK
      ?auto_154500 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_154501 ?auto_154499 ) ( ON-TABLE ?auto_154494 ) ( ON ?auto_154495 ?auto_154494 ) ( ON ?auto_154496 ?auto_154495 ) ( ON ?auto_154497 ?auto_154496 ) ( ON ?auto_154498 ?auto_154497 ) ( ON ?auto_154499 ?auto_154498 ) ( not ( = ?auto_154494 ?auto_154495 ) ) ( not ( = ?auto_154494 ?auto_154496 ) ) ( not ( = ?auto_154494 ?auto_154497 ) ) ( not ( = ?auto_154494 ?auto_154498 ) ) ( not ( = ?auto_154494 ?auto_154499 ) ) ( not ( = ?auto_154494 ?auto_154501 ) ) ( not ( = ?auto_154495 ?auto_154496 ) ) ( not ( = ?auto_154495 ?auto_154497 ) ) ( not ( = ?auto_154495 ?auto_154498 ) ) ( not ( = ?auto_154495 ?auto_154499 ) ) ( not ( = ?auto_154495 ?auto_154501 ) ) ( not ( = ?auto_154496 ?auto_154497 ) ) ( not ( = ?auto_154496 ?auto_154498 ) ) ( not ( = ?auto_154496 ?auto_154499 ) ) ( not ( = ?auto_154496 ?auto_154501 ) ) ( not ( = ?auto_154497 ?auto_154498 ) ) ( not ( = ?auto_154497 ?auto_154499 ) ) ( not ( = ?auto_154497 ?auto_154501 ) ) ( not ( = ?auto_154498 ?auto_154499 ) ) ( not ( = ?auto_154498 ?auto_154501 ) ) ( not ( = ?auto_154499 ?auto_154501 ) ) ( not ( = ?auto_154494 ?auto_154502 ) ) ( not ( = ?auto_154494 ?auto_154500 ) ) ( not ( = ?auto_154495 ?auto_154502 ) ) ( not ( = ?auto_154495 ?auto_154500 ) ) ( not ( = ?auto_154496 ?auto_154502 ) ) ( not ( = ?auto_154496 ?auto_154500 ) ) ( not ( = ?auto_154497 ?auto_154502 ) ) ( not ( = ?auto_154497 ?auto_154500 ) ) ( not ( = ?auto_154498 ?auto_154502 ) ) ( not ( = ?auto_154498 ?auto_154500 ) ) ( not ( = ?auto_154499 ?auto_154502 ) ) ( not ( = ?auto_154499 ?auto_154500 ) ) ( not ( = ?auto_154501 ?auto_154502 ) ) ( not ( = ?auto_154501 ?auto_154500 ) ) ( not ( = ?auto_154502 ?auto_154500 ) ) ( ON ?auto_154502 ?auto_154501 ) ( CLEAR ?auto_154502 ) ( HOLDING ?auto_154500 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_154500 )
      ( MAKE-6PILE ?auto_154494 ?auto_154495 ?auto_154496 ?auto_154497 ?auto_154498 ?auto_154499 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_154503 - BLOCK
      ?auto_154504 - BLOCK
      ?auto_154505 - BLOCK
      ?auto_154506 - BLOCK
      ?auto_154507 - BLOCK
      ?auto_154508 - BLOCK
    )
    :vars
    (
      ?auto_154511 - BLOCK
      ?auto_154510 - BLOCK
      ?auto_154509 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_154511 ?auto_154508 ) ( ON-TABLE ?auto_154503 ) ( ON ?auto_154504 ?auto_154503 ) ( ON ?auto_154505 ?auto_154504 ) ( ON ?auto_154506 ?auto_154505 ) ( ON ?auto_154507 ?auto_154506 ) ( ON ?auto_154508 ?auto_154507 ) ( not ( = ?auto_154503 ?auto_154504 ) ) ( not ( = ?auto_154503 ?auto_154505 ) ) ( not ( = ?auto_154503 ?auto_154506 ) ) ( not ( = ?auto_154503 ?auto_154507 ) ) ( not ( = ?auto_154503 ?auto_154508 ) ) ( not ( = ?auto_154503 ?auto_154511 ) ) ( not ( = ?auto_154504 ?auto_154505 ) ) ( not ( = ?auto_154504 ?auto_154506 ) ) ( not ( = ?auto_154504 ?auto_154507 ) ) ( not ( = ?auto_154504 ?auto_154508 ) ) ( not ( = ?auto_154504 ?auto_154511 ) ) ( not ( = ?auto_154505 ?auto_154506 ) ) ( not ( = ?auto_154505 ?auto_154507 ) ) ( not ( = ?auto_154505 ?auto_154508 ) ) ( not ( = ?auto_154505 ?auto_154511 ) ) ( not ( = ?auto_154506 ?auto_154507 ) ) ( not ( = ?auto_154506 ?auto_154508 ) ) ( not ( = ?auto_154506 ?auto_154511 ) ) ( not ( = ?auto_154507 ?auto_154508 ) ) ( not ( = ?auto_154507 ?auto_154511 ) ) ( not ( = ?auto_154508 ?auto_154511 ) ) ( not ( = ?auto_154503 ?auto_154510 ) ) ( not ( = ?auto_154503 ?auto_154509 ) ) ( not ( = ?auto_154504 ?auto_154510 ) ) ( not ( = ?auto_154504 ?auto_154509 ) ) ( not ( = ?auto_154505 ?auto_154510 ) ) ( not ( = ?auto_154505 ?auto_154509 ) ) ( not ( = ?auto_154506 ?auto_154510 ) ) ( not ( = ?auto_154506 ?auto_154509 ) ) ( not ( = ?auto_154507 ?auto_154510 ) ) ( not ( = ?auto_154507 ?auto_154509 ) ) ( not ( = ?auto_154508 ?auto_154510 ) ) ( not ( = ?auto_154508 ?auto_154509 ) ) ( not ( = ?auto_154511 ?auto_154510 ) ) ( not ( = ?auto_154511 ?auto_154509 ) ) ( not ( = ?auto_154510 ?auto_154509 ) ) ( ON ?auto_154510 ?auto_154511 ) ( ON ?auto_154509 ?auto_154510 ) ( CLEAR ?auto_154509 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_154503 ?auto_154504 ?auto_154505 ?auto_154506 ?auto_154507 ?auto_154508 ?auto_154511 ?auto_154510 )
      ( MAKE-6PILE ?auto_154503 ?auto_154504 ?auto_154505 ?auto_154506 ?auto_154507 ?auto_154508 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_154515 - BLOCK
      ?auto_154516 - BLOCK
      ?auto_154517 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_154517 ) ( CLEAR ?auto_154516 ) ( ON-TABLE ?auto_154515 ) ( ON ?auto_154516 ?auto_154515 ) ( not ( = ?auto_154515 ?auto_154516 ) ) ( not ( = ?auto_154515 ?auto_154517 ) ) ( not ( = ?auto_154516 ?auto_154517 ) ) )
    :subtasks
    ( ( !STACK ?auto_154517 ?auto_154516 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_154518 - BLOCK
      ?auto_154519 - BLOCK
      ?auto_154520 - BLOCK
    )
    :vars
    (
      ?auto_154521 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_154519 ) ( ON-TABLE ?auto_154518 ) ( ON ?auto_154519 ?auto_154518 ) ( not ( = ?auto_154518 ?auto_154519 ) ) ( not ( = ?auto_154518 ?auto_154520 ) ) ( not ( = ?auto_154519 ?auto_154520 ) ) ( ON ?auto_154520 ?auto_154521 ) ( CLEAR ?auto_154520 ) ( HAND-EMPTY ) ( not ( = ?auto_154518 ?auto_154521 ) ) ( not ( = ?auto_154519 ?auto_154521 ) ) ( not ( = ?auto_154520 ?auto_154521 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_154520 ?auto_154521 )
      ( MAKE-3PILE ?auto_154518 ?auto_154519 ?auto_154520 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_154522 - BLOCK
      ?auto_154523 - BLOCK
      ?auto_154524 - BLOCK
    )
    :vars
    (
      ?auto_154525 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_154522 ) ( not ( = ?auto_154522 ?auto_154523 ) ) ( not ( = ?auto_154522 ?auto_154524 ) ) ( not ( = ?auto_154523 ?auto_154524 ) ) ( ON ?auto_154524 ?auto_154525 ) ( CLEAR ?auto_154524 ) ( not ( = ?auto_154522 ?auto_154525 ) ) ( not ( = ?auto_154523 ?auto_154525 ) ) ( not ( = ?auto_154524 ?auto_154525 ) ) ( HOLDING ?auto_154523 ) ( CLEAR ?auto_154522 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_154522 ?auto_154523 )
      ( MAKE-3PILE ?auto_154522 ?auto_154523 ?auto_154524 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_154526 - BLOCK
      ?auto_154527 - BLOCK
      ?auto_154528 - BLOCK
    )
    :vars
    (
      ?auto_154529 - BLOCK
      ?auto_154531 - BLOCK
      ?auto_154530 - BLOCK
      ?auto_154532 - BLOCK
      ?auto_154534 - BLOCK
      ?auto_154533 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_154526 ) ( not ( = ?auto_154526 ?auto_154527 ) ) ( not ( = ?auto_154526 ?auto_154528 ) ) ( not ( = ?auto_154527 ?auto_154528 ) ) ( ON ?auto_154528 ?auto_154529 ) ( not ( = ?auto_154526 ?auto_154529 ) ) ( not ( = ?auto_154527 ?auto_154529 ) ) ( not ( = ?auto_154528 ?auto_154529 ) ) ( CLEAR ?auto_154526 ) ( ON ?auto_154527 ?auto_154528 ) ( CLEAR ?auto_154527 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_154531 ) ( ON ?auto_154530 ?auto_154531 ) ( ON ?auto_154532 ?auto_154530 ) ( ON ?auto_154534 ?auto_154532 ) ( ON ?auto_154533 ?auto_154534 ) ( ON ?auto_154529 ?auto_154533 ) ( not ( = ?auto_154531 ?auto_154530 ) ) ( not ( = ?auto_154531 ?auto_154532 ) ) ( not ( = ?auto_154531 ?auto_154534 ) ) ( not ( = ?auto_154531 ?auto_154533 ) ) ( not ( = ?auto_154531 ?auto_154529 ) ) ( not ( = ?auto_154531 ?auto_154528 ) ) ( not ( = ?auto_154531 ?auto_154527 ) ) ( not ( = ?auto_154530 ?auto_154532 ) ) ( not ( = ?auto_154530 ?auto_154534 ) ) ( not ( = ?auto_154530 ?auto_154533 ) ) ( not ( = ?auto_154530 ?auto_154529 ) ) ( not ( = ?auto_154530 ?auto_154528 ) ) ( not ( = ?auto_154530 ?auto_154527 ) ) ( not ( = ?auto_154532 ?auto_154534 ) ) ( not ( = ?auto_154532 ?auto_154533 ) ) ( not ( = ?auto_154532 ?auto_154529 ) ) ( not ( = ?auto_154532 ?auto_154528 ) ) ( not ( = ?auto_154532 ?auto_154527 ) ) ( not ( = ?auto_154534 ?auto_154533 ) ) ( not ( = ?auto_154534 ?auto_154529 ) ) ( not ( = ?auto_154534 ?auto_154528 ) ) ( not ( = ?auto_154534 ?auto_154527 ) ) ( not ( = ?auto_154533 ?auto_154529 ) ) ( not ( = ?auto_154533 ?auto_154528 ) ) ( not ( = ?auto_154533 ?auto_154527 ) ) ( not ( = ?auto_154526 ?auto_154531 ) ) ( not ( = ?auto_154526 ?auto_154530 ) ) ( not ( = ?auto_154526 ?auto_154532 ) ) ( not ( = ?auto_154526 ?auto_154534 ) ) ( not ( = ?auto_154526 ?auto_154533 ) ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_154531 ?auto_154530 ?auto_154532 ?auto_154534 ?auto_154533 ?auto_154529 ?auto_154528 )
      ( MAKE-3PILE ?auto_154526 ?auto_154527 ?auto_154528 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_154535 - BLOCK
      ?auto_154536 - BLOCK
      ?auto_154537 - BLOCK
    )
    :vars
    (
      ?auto_154542 - BLOCK
      ?auto_154539 - BLOCK
      ?auto_154541 - BLOCK
      ?auto_154543 - BLOCK
      ?auto_154538 - BLOCK
      ?auto_154540 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_154535 ?auto_154536 ) ) ( not ( = ?auto_154535 ?auto_154537 ) ) ( not ( = ?auto_154536 ?auto_154537 ) ) ( ON ?auto_154537 ?auto_154542 ) ( not ( = ?auto_154535 ?auto_154542 ) ) ( not ( = ?auto_154536 ?auto_154542 ) ) ( not ( = ?auto_154537 ?auto_154542 ) ) ( ON ?auto_154536 ?auto_154537 ) ( CLEAR ?auto_154536 ) ( ON-TABLE ?auto_154539 ) ( ON ?auto_154541 ?auto_154539 ) ( ON ?auto_154543 ?auto_154541 ) ( ON ?auto_154538 ?auto_154543 ) ( ON ?auto_154540 ?auto_154538 ) ( ON ?auto_154542 ?auto_154540 ) ( not ( = ?auto_154539 ?auto_154541 ) ) ( not ( = ?auto_154539 ?auto_154543 ) ) ( not ( = ?auto_154539 ?auto_154538 ) ) ( not ( = ?auto_154539 ?auto_154540 ) ) ( not ( = ?auto_154539 ?auto_154542 ) ) ( not ( = ?auto_154539 ?auto_154537 ) ) ( not ( = ?auto_154539 ?auto_154536 ) ) ( not ( = ?auto_154541 ?auto_154543 ) ) ( not ( = ?auto_154541 ?auto_154538 ) ) ( not ( = ?auto_154541 ?auto_154540 ) ) ( not ( = ?auto_154541 ?auto_154542 ) ) ( not ( = ?auto_154541 ?auto_154537 ) ) ( not ( = ?auto_154541 ?auto_154536 ) ) ( not ( = ?auto_154543 ?auto_154538 ) ) ( not ( = ?auto_154543 ?auto_154540 ) ) ( not ( = ?auto_154543 ?auto_154542 ) ) ( not ( = ?auto_154543 ?auto_154537 ) ) ( not ( = ?auto_154543 ?auto_154536 ) ) ( not ( = ?auto_154538 ?auto_154540 ) ) ( not ( = ?auto_154538 ?auto_154542 ) ) ( not ( = ?auto_154538 ?auto_154537 ) ) ( not ( = ?auto_154538 ?auto_154536 ) ) ( not ( = ?auto_154540 ?auto_154542 ) ) ( not ( = ?auto_154540 ?auto_154537 ) ) ( not ( = ?auto_154540 ?auto_154536 ) ) ( not ( = ?auto_154535 ?auto_154539 ) ) ( not ( = ?auto_154535 ?auto_154541 ) ) ( not ( = ?auto_154535 ?auto_154543 ) ) ( not ( = ?auto_154535 ?auto_154538 ) ) ( not ( = ?auto_154535 ?auto_154540 ) ) ( HOLDING ?auto_154535 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_154535 )
      ( MAKE-3PILE ?auto_154535 ?auto_154536 ?auto_154537 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_154544 - BLOCK
      ?auto_154545 - BLOCK
      ?auto_154546 - BLOCK
    )
    :vars
    (
      ?auto_154548 - BLOCK
      ?auto_154551 - BLOCK
      ?auto_154547 - BLOCK
      ?auto_154549 - BLOCK
      ?auto_154552 - BLOCK
      ?auto_154550 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_154544 ?auto_154545 ) ) ( not ( = ?auto_154544 ?auto_154546 ) ) ( not ( = ?auto_154545 ?auto_154546 ) ) ( ON ?auto_154546 ?auto_154548 ) ( not ( = ?auto_154544 ?auto_154548 ) ) ( not ( = ?auto_154545 ?auto_154548 ) ) ( not ( = ?auto_154546 ?auto_154548 ) ) ( ON ?auto_154545 ?auto_154546 ) ( ON-TABLE ?auto_154551 ) ( ON ?auto_154547 ?auto_154551 ) ( ON ?auto_154549 ?auto_154547 ) ( ON ?auto_154552 ?auto_154549 ) ( ON ?auto_154550 ?auto_154552 ) ( ON ?auto_154548 ?auto_154550 ) ( not ( = ?auto_154551 ?auto_154547 ) ) ( not ( = ?auto_154551 ?auto_154549 ) ) ( not ( = ?auto_154551 ?auto_154552 ) ) ( not ( = ?auto_154551 ?auto_154550 ) ) ( not ( = ?auto_154551 ?auto_154548 ) ) ( not ( = ?auto_154551 ?auto_154546 ) ) ( not ( = ?auto_154551 ?auto_154545 ) ) ( not ( = ?auto_154547 ?auto_154549 ) ) ( not ( = ?auto_154547 ?auto_154552 ) ) ( not ( = ?auto_154547 ?auto_154550 ) ) ( not ( = ?auto_154547 ?auto_154548 ) ) ( not ( = ?auto_154547 ?auto_154546 ) ) ( not ( = ?auto_154547 ?auto_154545 ) ) ( not ( = ?auto_154549 ?auto_154552 ) ) ( not ( = ?auto_154549 ?auto_154550 ) ) ( not ( = ?auto_154549 ?auto_154548 ) ) ( not ( = ?auto_154549 ?auto_154546 ) ) ( not ( = ?auto_154549 ?auto_154545 ) ) ( not ( = ?auto_154552 ?auto_154550 ) ) ( not ( = ?auto_154552 ?auto_154548 ) ) ( not ( = ?auto_154552 ?auto_154546 ) ) ( not ( = ?auto_154552 ?auto_154545 ) ) ( not ( = ?auto_154550 ?auto_154548 ) ) ( not ( = ?auto_154550 ?auto_154546 ) ) ( not ( = ?auto_154550 ?auto_154545 ) ) ( not ( = ?auto_154544 ?auto_154551 ) ) ( not ( = ?auto_154544 ?auto_154547 ) ) ( not ( = ?auto_154544 ?auto_154549 ) ) ( not ( = ?auto_154544 ?auto_154552 ) ) ( not ( = ?auto_154544 ?auto_154550 ) ) ( ON ?auto_154544 ?auto_154545 ) ( CLEAR ?auto_154544 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_154551 ?auto_154547 ?auto_154549 ?auto_154552 ?auto_154550 ?auto_154548 ?auto_154546 ?auto_154545 )
      ( MAKE-3PILE ?auto_154544 ?auto_154545 ?auto_154546 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_154558 - BLOCK
      ?auto_154559 - BLOCK
      ?auto_154560 - BLOCK
      ?auto_154561 - BLOCK
      ?auto_154562 - BLOCK
    )
    :vars
    (
      ?auto_154563 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_154563 ?auto_154562 ) ( CLEAR ?auto_154563 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_154558 ) ( ON ?auto_154559 ?auto_154558 ) ( ON ?auto_154560 ?auto_154559 ) ( ON ?auto_154561 ?auto_154560 ) ( ON ?auto_154562 ?auto_154561 ) ( not ( = ?auto_154558 ?auto_154559 ) ) ( not ( = ?auto_154558 ?auto_154560 ) ) ( not ( = ?auto_154558 ?auto_154561 ) ) ( not ( = ?auto_154558 ?auto_154562 ) ) ( not ( = ?auto_154558 ?auto_154563 ) ) ( not ( = ?auto_154559 ?auto_154560 ) ) ( not ( = ?auto_154559 ?auto_154561 ) ) ( not ( = ?auto_154559 ?auto_154562 ) ) ( not ( = ?auto_154559 ?auto_154563 ) ) ( not ( = ?auto_154560 ?auto_154561 ) ) ( not ( = ?auto_154560 ?auto_154562 ) ) ( not ( = ?auto_154560 ?auto_154563 ) ) ( not ( = ?auto_154561 ?auto_154562 ) ) ( not ( = ?auto_154561 ?auto_154563 ) ) ( not ( = ?auto_154562 ?auto_154563 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_154563 ?auto_154562 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_154564 - BLOCK
      ?auto_154565 - BLOCK
      ?auto_154566 - BLOCK
      ?auto_154567 - BLOCK
      ?auto_154568 - BLOCK
    )
    :vars
    (
      ?auto_154569 - BLOCK
      ?auto_154570 - BLOCK
      ?auto_154571 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_154569 ?auto_154568 ) ( CLEAR ?auto_154569 ) ( ON-TABLE ?auto_154564 ) ( ON ?auto_154565 ?auto_154564 ) ( ON ?auto_154566 ?auto_154565 ) ( ON ?auto_154567 ?auto_154566 ) ( ON ?auto_154568 ?auto_154567 ) ( not ( = ?auto_154564 ?auto_154565 ) ) ( not ( = ?auto_154564 ?auto_154566 ) ) ( not ( = ?auto_154564 ?auto_154567 ) ) ( not ( = ?auto_154564 ?auto_154568 ) ) ( not ( = ?auto_154564 ?auto_154569 ) ) ( not ( = ?auto_154565 ?auto_154566 ) ) ( not ( = ?auto_154565 ?auto_154567 ) ) ( not ( = ?auto_154565 ?auto_154568 ) ) ( not ( = ?auto_154565 ?auto_154569 ) ) ( not ( = ?auto_154566 ?auto_154567 ) ) ( not ( = ?auto_154566 ?auto_154568 ) ) ( not ( = ?auto_154566 ?auto_154569 ) ) ( not ( = ?auto_154567 ?auto_154568 ) ) ( not ( = ?auto_154567 ?auto_154569 ) ) ( not ( = ?auto_154568 ?auto_154569 ) ) ( HOLDING ?auto_154570 ) ( CLEAR ?auto_154571 ) ( not ( = ?auto_154564 ?auto_154570 ) ) ( not ( = ?auto_154564 ?auto_154571 ) ) ( not ( = ?auto_154565 ?auto_154570 ) ) ( not ( = ?auto_154565 ?auto_154571 ) ) ( not ( = ?auto_154566 ?auto_154570 ) ) ( not ( = ?auto_154566 ?auto_154571 ) ) ( not ( = ?auto_154567 ?auto_154570 ) ) ( not ( = ?auto_154567 ?auto_154571 ) ) ( not ( = ?auto_154568 ?auto_154570 ) ) ( not ( = ?auto_154568 ?auto_154571 ) ) ( not ( = ?auto_154569 ?auto_154570 ) ) ( not ( = ?auto_154569 ?auto_154571 ) ) ( not ( = ?auto_154570 ?auto_154571 ) ) )
    :subtasks
    ( ( !STACK ?auto_154570 ?auto_154571 )
      ( MAKE-5PILE ?auto_154564 ?auto_154565 ?auto_154566 ?auto_154567 ?auto_154568 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_154572 - BLOCK
      ?auto_154573 - BLOCK
      ?auto_154574 - BLOCK
      ?auto_154575 - BLOCK
      ?auto_154576 - BLOCK
    )
    :vars
    (
      ?auto_154579 - BLOCK
      ?auto_154578 - BLOCK
      ?auto_154577 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_154579 ?auto_154576 ) ( ON-TABLE ?auto_154572 ) ( ON ?auto_154573 ?auto_154572 ) ( ON ?auto_154574 ?auto_154573 ) ( ON ?auto_154575 ?auto_154574 ) ( ON ?auto_154576 ?auto_154575 ) ( not ( = ?auto_154572 ?auto_154573 ) ) ( not ( = ?auto_154572 ?auto_154574 ) ) ( not ( = ?auto_154572 ?auto_154575 ) ) ( not ( = ?auto_154572 ?auto_154576 ) ) ( not ( = ?auto_154572 ?auto_154579 ) ) ( not ( = ?auto_154573 ?auto_154574 ) ) ( not ( = ?auto_154573 ?auto_154575 ) ) ( not ( = ?auto_154573 ?auto_154576 ) ) ( not ( = ?auto_154573 ?auto_154579 ) ) ( not ( = ?auto_154574 ?auto_154575 ) ) ( not ( = ?auto_154574 ?auto_154576 ) ) ( not ( = ?auto_154574 ?auto_154579 ) ) ( not ( = ?auto_154575 ?auto_154576 ) ) ( not ( = ?auto_154575 ?auto_154579 ) ) ( not ( = ?auto_154576 ?auto_154579 ) ) ( CLEAR ?auto_154578 ) ( not ( = ?auto_154572 ?auto_154577 ) ) ( not ( = ?auto_154572 ?auto_154578 ) ) ( not ( = ?auto_154573 ?auto_154577 ) ) ( not ( = ?auto_154573 ?auto_154578 ) ) ( not ( = ?auto_154574 ?auto_154577 ) ) ( not ( = ?auto_154574 ?auto_154578 ) ) ( not ( = ?auto_154575 ?auto_154577 ) ) ( not ( = ?auto_154575 ?auto_154578 ) ) ( not ( = ?auto_154576 ?auto_154577 ) ) ( not ( = ?auto_154576 ?auto_154578 ) ) ( not ( = ?auto_154579 ?auto_154577 ) ) ( not ( = ?auto_154579 ?auto_154578 ) ) ( not ( = ?auto_154577 ?auto_154578 ) ) ( ON ?auto_154577 ?auto_154579 ) ( CLEAR ?auto_154577 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_154572 ?auto_154573 ?auto_154574 ?auto_154575 ?auto_154576 ?auto_154579 )
      ( MAKE-5PILE ?auto_154572 ?auto_154573 ?auto_154574 ?auto_154575 ?auto_154576 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_154580 - BLOCK
      ?auto_154581 - BLOCK
      ?auto_154582 - BLOCK
      ?auto_154583 - BLOCK
      ?auto_154584 - BLOCK
    )
    :vars
    (
      ?auto_154585 - BLOCK
      ?auto_154586 - BLOCK
      ?auto_154587 - BLOCK
      ?auto_154588 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_154585 ?auto_154584 ) ( ON-TABLE ?auto_154580 ) ( ON ?auto_154581 ?auto_154580 ) ( ON ?auto_154582 ?auto_154581 ) ( ON ?auto_154583 ?auto_154582 ) ( ON ?auto_154584 ?auto_154583 ) ( not ( = ?auto_154580 ?auto_154581 ) ) ( not ( = ?auto_154580 ?auto_154582 ) ) ( not ( = ?auto_154580 ?auto_154583 ) ) ( not ( = ?auto_154580 ?auto_154584 ) ) ( not ( = ?auto_154580 ?auto_154585 ) ) ( not ( = ?auto_154581 ?auto_154582 ) ) ( not ( = ?auto_154581 ?auto_154583 ) ) ( not ( = ?auto_154581 ?auto_154584 ) ) ( not ( = ?auto_154581 ?auto_154585 ) ) ( not ( = ?auto_154582 ?auto_154583 ) ) ( not ( = ?auto_154582 ?auto_154584 ) ) ( not ( = ?auto_154582 ?auto_154585 ) ) ( not ( = ?auto_154583 ?auto_154584 ) ) ( not ( = ?auto_154583 ?auto_154585 ) ) ( not ( = ?auto_154584 ?auto_154585 ) ) ( not ( = ?auto_154580 ?auto_154586 ) ) ( not ( = ?auto_154580 ?auto_154587 ) ) ( not ( = ?auto_154581 ?auto_154586 ) ) ( not ( = ?auto_154581 ?auto_154587 ) ) ( not ( = ?auto_154582 ?auto_154586 ) ) ( not ( = ?auto_154582 ?auto_154587 ) ) ( not ( = ?auto_154583 ?auto_154586 ) ) ( not ( = ?auto_154583 ?auto_154587 ) ) ( not ( = ?auto_154584 ?auto_154586 ) ) ( not ( = ?auto_154584 ?auto_154587 ) ) ( not ( = ?auto_154585 ?auto_154586 ) ) ( not ( = ?auto_154585 ?auto_154587 ) ) ( not ( = ?auto_154586 ?auto_154587 ) ) ( ON ?auto_154586 ?auto_154585 ) ( CLEAR ?auto_154586 ) ( HOLDING ?auto_154587 ) ( CLEAR ?auto_154588 ) ( ON-TABLE ?auto_154588 ) ( not ( = ?auto_154588 ?auto_154587 ) ) ( not ( = ?auto_154580 ?auto_154588 ) ) ( not ( = ?auto_154581 ?auto_154588 ) ) ( not ( = ?auto_154582 ?auto_154588 ) ) ( not ( = ?auto_154583 ?auto_154588 ) ) ( not ( = ?auto_154584 ?auto_154588 ) ) ( not ( = ?auto_154585 ?auto_154588 ) ) ( not ( = ?auto_154586 ?auto_154588 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_154588 ?auto_154587 )
      ( MAKE-5PILE ?auto_154580 ?auto_154581 ?auto_154582 ?auto_154583 ?auto_154584 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_156108 - BLOCK
      ?auto_156109 - BLOCK
      ?auto_156110 - BLOCK
      ?auto_156111 - BLOCK
      ?auto_156112 - BLOCK
    )
    :vars
    (
      ?auto_156114 - BLOCK
      ?auto_156115 - BLOCK
      ?auto_156113 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_156114 ?auto_156112 ) ( ON-TABLE ?auto_156108 ) ( ON ?auto_156109 ?auto_156108 ) ( ON ?auto_156110 ?auto_156109 ) ( ON ?auto_156111 ?auto_156110 ) ( ON ?auto_156112 ?auto_156111 ) ( not ( = ?auto_156108 ?auto_156109 ) ) ( not ( = ?auto_156108 ?auto_156110 ) ) ( not ( = ?auto_156108 ?auto_156111 ) ) ( not ( = ?auto_156108 ?auto_156112 ) ) ( not ( = ?auto_156108 ?auto_156114 ) ) ( not ( = ?auto_156109 ?auto_156110 ) ) ( not ( = ?auto_156109 ?auto_156111 ) ) ( not ( = ?auto_156109 ?auto_156112 ) ) ( not ( = ?auto_156109 ?auto_156114 ) ) ( not ( = ?auto_156110 ?auto_156111 ) ) ( not ( = ?auto_156110 ?auto_156112 ) ) ( not ( = ?auto_156110 ?auto_156114 ) ) ( not ( = ?auto_156111 ?auto_156112 ) ) ( not ( = ?auto_156111 ?auto_156114 ) ) ( not ( = ?auto_156112 ?auto_156114 ) ) ( not ( = ?auto_156108 ?auto_156115 ) ) ( not ( = ?auto_156108 ?auto_156113 ) ) ( not ( = ?auto_156109 ?auto_156115 ) ) ( not ( = ?auto_156109 ?auto_156113 ) ) ( not ( = ?auto_156110 ?auto_156115 ) ) ( not ( = ?auto_156110 ?auto_156113 ) ) ( not ( = ?auto_156111 ?auto_156115 ) ) ( not ( = ?auto_156111 ?auto_156113 ) ) ( not ( = ?auto_156112 ?auto_156115 ) ) ( not ( = ?auto_156112 ?auto_156113 ) ) ( not ( = ?auto_156114 ?auto_156115 ) ) ( not ( = ?auto_156114 ?auto_156113 ) ) ( not ( = ?auto_156115 ?auto_156113 ) ) ( ON ?auto_156115 ?auto_156114 ) ( ON ?auto_156113 ?auto_156115 ) ( CLEAR ?auto_156113 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_156108 ?auto_156109 ?auto_156110 ?auto_156111 ?auto_156112 ?auto_156114 ?auto_156115 )
      ( MAKE-5PILE ?auto_156108 ?auto_156109 ?auto_156110 ?auto_156111 ?auto_156112 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_154598 - BLOCK
      ?auto_154599 - BLOCK
      ?auto_154600 - BLOCK
      ?auto_154601 - BLOCK
      ?auto_154602 - BLOCK
    )
    :vars
    (
      ?auto_154604 - BLOCK
      ?auto_154606 - BLOCK
      ?auto_154605 - BLOCK
      ?auto_154603 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_154604 ?auto_154602 ) ( ON-TABLE ?auto_154598 ) ( ON ?auto_154599 ?auto_154598 ) ( ON ?auto_154600 ?auto_154599 ) ( ON ?auto_154601 ?auto_154600 ) ( ON ?auto_154602 ?auto_154601 ) ( not ( = ?auto_154598 ?auto_154599 ) ) ( not ( = ?auto_154598 ?auto_154600 ) ) ( not ( = ?auto_154598 ?auto_154601 ) ) ( not ( = ?auto_154598 ?auto_154602 ) ) ( not ( = ?auto_154598 ?auto_154604 ) ) ( not ( = ?auto_154599 ?auto_154600 ) ) ( not ( = ?auto_154599 ?auto_154601 ) ) ( not ( = ?auto_154599 ?auto_154602 ) ) ( not ( = ?auto_154599 ?auto_154604 ) ) ( not ( = ?auto_154600 ?auto_154601 ) ) ( not ( = ?auto_154600 ?auto_154602 ) ) ( not ( = ?auto_154600 ?auto_154604 ) ) ( not ( = ?auto_154601 ?auto_154602 ) ) ( not ( = ?auto_154601 ?auto_154604 ) ) ( not ( = ?auto_154602 ?auto_154604 ) ) ( not ( = ?auto_154598 ?auto_154606 ) ) ( not ( = ?auto_154598 ?auto_154605 ) ) ( not ( = ?auto_154599 ?auto_154606 ) ) ( not ( = ?auto_154599 ?auto_154605 ) ) ( not ( = ?auto_154600 ?auto_154606 ) ) ( not ( = ?auto_154600 ?auto_154605 ) ) ( not ( = ?auto_154601 ?auto_154606 ) ) ( not ( = ?auto_154601 ?auto_154605 ) ) ( not ( = ?auto_154602 ?auto_154606 ) ) ( not ( = ?auto_154602 ?auto_154605 ) ) ( not ( = ?auto_154604 ?auto_154606 ) ) ( not ( = ?auto_154604 ?auto_154605 ) ) ( not ( = ?auto_154606 ?auto_154605 ) ) ( ON ?auto_154606 ?auto_154604 ) ( not ( = ?auto_154603 ?auto_154605 ) ) ( not ( = ?auto_154598 ?auto_154603 ) ) ( not ( = ?auto_154599 ?auto_154603 ) ) ( not ( = ?auto_154600 ?auto_154603 ) ) ( not ( = ?auto_154601 ?auto_154603 ) ) ( not ( = ?auto_154602 ?auto_154603 ) ) ( not ( = ?auto_154604 ?auto_154603 ) ) ( not ( = ?auto_154606 ?auto_154603 ) ) ( ON ?auto_154605 ?auto_154606 ) ( CLEAR ?auto_154605 ) ( HOLDING ?auto_154603 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_154603 )
      ( MAKE-5PILE ?auto_154598 ?auto_154599 ?auto_154600 ?auto_154601 ?auto_154602 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_154607 - BLOCK
      ?auto_154608 - BLOCK
      ?auto_154609 - BLOCK
      ?auto_154610 - BLOCK
      ?auto_154611 - BLOCK
    )
    :vars
    (
      ?auto_154614 - BLOCK
      ?auto_154612 - BLOCK
      ?auto_154613 - BLOCK
      ?auto_154615 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_154614 ?auto_154611 ) ( ON-TABLE ?auto_154607 ) ( ON ?auto_154608 ?auto_154607 ) ( ON ?auto_154609 ?auto_154608 ) ( ON ?auto_154610 ?auto_154609 ) ( ON ?auto_154611 ?auto_154610 ) ( not ( = ?auto_154607 ?auto_154608 ) ) ( not ( = ?auto_154607 ?auto_154609 ) ) ( not ( = ?auto_154607 ?auto_154610 ) ) ( not ( = ?auto_154607 ?auto_154611 ) ) ( not ( = ?auto_154607 ?auto_154614 ) ) ( not ( = ?auto_154608 ?auto_154609 ) ) ( not ( = ?auto_154608 ?auto_154610 ) ) ( not ( = ?auto_154608 ?auto_154611 ) ) ( not ( = ?auto_154608 ?auto_154614 ) ) ( not ( = ?auto_154609 ?auto_154610 ) ) ( not ( = ?auto_154609 ?auto_154611 ) ) ( not ( = ?auto_154609 ?auto_154614 ) ) ( not ( = ?auto_154610 ?auto_154611 ) ) ( not ( = ?auto_154610 ?auto_154614 ) ) ( not ( = ?auto_154611 ?auto_154614 ) ) ( not ( = ?auto_154607 ?auto_154612 ) ) ( not ( = ?auto_154607 ?auto_154613 ) ) ( not ( = ?auto_154608 ?auto_154612 ) ) ( not ( = ?auto_154608 ?auto_154613 ) ) ( not ( = ?auto_154609 ?auto_154612 ) ) ( not ( = ?auto_154609 ?auto_154613 ) ) ( not ( = ?auto_154610 ?auto_154612 ) ) ( not ( = ?auto_154610 ?auto_154613 ) ) ( not ( = ?auto_154611 ?auto_154612 ) ) ( not ( = ?auto_154611 ?auto_154613 ) ) ( not ( = ?auto_154614 ?auto_154612 ) ) ( not ( = ?auto_154614 ?auto_154613 ) ) ( not ( = ?auto_154612 ?auto_154613 ) ) ( ON ?auto_154612 ?auto_154614 ) ( not ( = ?auto_154615 ?auto_154613 ) ) ( not ( = ?auto_154607 ?auto_154615 ) ) ( not ( = ?auto_154608 ?auto_154615 ) ) ( not ( = ?auto_154609 ?auto_154615 ) ) ( not ( = ?auto_154610 ?auto_154615 ) ) ( not ( = ?auto_154611 ?auto_154615 ) ) ( not ( = ?auto_154614 ?auto_154615 ) ) ( not ( = ?auto_154612 ?auto_154615 ) ) ( ON ?auto_154613 ?auto_154612 ) ( ON ?auto_154615 ?auto_154613 ) ( CLEAR ?auto_154615 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_154607 ?auto_154608 ?auto_154609 ?auto_154610 ?auto_154611 ?auto_154614 ?auto_154612 ?auto_154613 )
      ( MAKE-5PILE ?auto_154607 ?auto_154608 ?auto_154609 ?auto_154610 ?auto_154611 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_154620 - BLOCK
      ?auto_154621 - BLOCK
      ?auto_154622 - BLOCK
      ?auto_154623 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_154623 ) ( CLEAR ?auto_154622 ) ( ON-TABLE ?auto_154620 ) ( ON ?auto_154621 ?auto_154620 ) ( ON ?auto_154622 ?auto_154621 ) ( not ( = ?auto_154620 ?auto_154621 ) ) ( not ( = ?auto_154620 ?auto_154622 ) ) ( not ( = ?auto_154620 ?auto_154623 ) ) ( not ( = ?auto_154621 ?auto_154622 ) ) ( not ( = ?auto_154621 ?auto_154623 ) ) ( not ( = ?auto_154622 ?auto_154623 ) ) )
    :subtasks
    ( ( !STACK ?auto_154623 ?auto_154622 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_154624 - BLOCK
      ?auto_154625 - BLOCK
      ?auto_154626 - BLOCK
      ?auto_154627 - BLOCK
    )
    :vars
    (
      ?auto_154628 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_154626 ) ( ON-TABLE ?auto_154624 ) ( ON ?auto_154625 ?auto_154624 ) ( ON ?auto_154626 ?auto_154625 ) ( not ( = ?auto_154624 ?auto_154625 ) ) ( not ( = ?auto_154624 ?auto_154626 ) ) ( not ( = ?auto_154624 ?auto_154627 ) ) ( not ( = ?auto_154625 ?auto_154626 ) ) ( not ( = ?auto_154625 ?auto_154627 ) ) ( not ( = ?auto_154626 ?auto_154627 ) ) ( ON ?auto_154627 ?auto_154628 ) ( CLEAR ?auto_154627 ) ( HAND-EMPTY ) ( not ( = ?auto_154624 ?auto_154628 ) ) ( not ( = ?auto_154625 ?auto_154628 ) ) ( not ( = ?auto_154626 ?auto_154628 ) ) ( not ( = ?auto_154627 ?auto_154628 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_154627 ?auto_154628 )
      ( MAKE-4PILE ?auto_154624 ?auto_154625 ?auto_154626 ?auto_154627 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_154629 - BLOCK
      ?auto_154630 - BLOCK
      ?auto_154631 - BLOCK
      ?auto_154632 - BLOCK
    )
    :vars
    (
      ?auto_154633 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_154629 ) ( ON ?auto_154630 ?auto_154629 ) ( not ( = ?auto_154629 ?auto_154630 ) ) ( not ( = ?auto_154629 ?auto_154631 ) ) ( not ( = ?auto_154629 ?auto_154632 ) ) ( not ( = ?auto_154630 ?auto_154631 ) ) ( not ( = ?auto_154630 ?auto_154632 ) ) ( not ( = ?auto_154631 ?auto_154632 ) ) ( ON ?auto_154632 ?auto_154633 ) ( CLEAR ?auto_154632 ) ( not ( = ?auto_154629 ?auto_154633 ) ) ( not ( = ?auto_154630 ?auto_154633 ) ) ( not ( = ?auto_154631 ?auto_154633 ) ) ( not ( = ?auto_154632 ?auto_154633 ) ) ( HOLDING ?auto_154631 ) ( CLEAR ?auto_154630 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_154629 ?auto_154630 ?auto_154631 )
      ( MAKE-4PILE ?auto_154629 ?auto_154630 ?auto_154631 ?auto_154632 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_154634 - BLOCK
      ?auto_154635 - BLOCK
      ?auto_154636 - BLOCK
      ?auto_154637 - BLOCK
    )
    :vars
    (
      ?auto_154638 - BLOCK
      ?auto_154641 - BLOCK
      ?auto_154642 - BLOCK
      ?auto_154639 - BLOCK
      ?auto_154640 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_154634 ) ( ON ?auto_154635 ?auto_154634 ) ( not ( = ?auto_154634 ?auto_154635 ) ) ( not ( = ?auto_154634 ?auto_154636 ) ) ( not ( = ?auto_154634 ?auto_154637 ) ) ( not ( = ?auto_154635 ?auto_154636 ) ) ( not ( = ?auto_154635 ?auto_154637 ) ) ( not ( = ?auto_154636 ?auto_154637 ) ) ( ON ?auto_154637 ?auto_154638 ) ( not ( = ?auto_154634 ?auto_154638 ) ) ( not ( = ?auto_154635 ?auto_154638 ) ) ( not ( = ?auto_154636 ?auto_154638 ) ) ( not ( = ?auto_154637 ?auto_154638 ) ) ( CLEAR ?auto_154635 ) ( ON ?auto_154636 ?auto_154637 ) ( CLEAR ?auto_154636 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_154641 ) ( ON ?auto_154642 ?auto_154641 ) ( ON ?auto_154639 ?auto_154642 ) ( ON ?auto_154640 ?auto_154639 ) ( ON ?auto_154638 ?auto_154640 ) ( not ( = ?auto_154641 ?auto_154642 ) ) ( not ( = ?auto_154641 ?auto_154639 ) ) ( not ( = ?auto_154641 ?auto_154640 ) ) ( not ( = ?auto_154641 ?auto_154638 ) ) ( not ( = ?auto_154641 ?auto_154637 ) ) ( not ( = ?auto_154641 ?auto_154636 ) ) ( not ( = ?auto_154642 ?auto_154639 ) ) ( not ( = ?auto_154642 ?auto_154640 ) ) ( not ( = ?auto_154642 ?auto_154638 ) ) ( not ( = ?auto_154642 ?auto_154637 ) ) ( not ( = ?auto_154642 ?auto_154636 ) ) ( not ( = ?auto_154639 ?auto_154640 ) ) ( not ( = ?auto_154639 ?auto_154638 ) ) ( not ( = ?auto_154639 ?auto_154637 ) ) ( not ( = ?auto_154639 ?auto_154636 ) ) ( not ( = ?auto_154640 ?auto_154638 ) ) ( not ( = ?auto_154640 ?auto_154637 ) ) ( not ( = ?auto_154640 ?auto_154636 ) ) ( not ( = ?auto_154634 ?auto_154641 ) ) ( not ( = ?auto_154634 ?auto_154642 ) ) ( not ( = ?auto_154634 ?auto_154639 ) ) ( not ( = ?auto_154634 ?auto_154640 ) ) ( not ( = ?auto_154635 ?auto_154641 ) ) ( not ( = ?auto_154635 ?auto_154642 ) ) ( not ( = ?auto_154635 ?auto_154639 ) ) ( not ( = ?auto_154635 ?auto_154640 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_154641 ?auto_154642 ?auto_154639 ?auto_154640 ?auto_154638 ?auto_154637 )
      ( MAKE-4PILE ?auto_154634 ?auto_154635 ?auto_154636 ?auto_154637 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_154643 - BLOCK
      ?auto_154644 - BLOCK
      ?auto_154645 - BLOCK
      ?auto_154646 - BLOCK
    )
    :vars
    (
      ?auto_154650 - BLOCK
      ?auto_154648 - BLOCK
      ?auto_154651 - BLOCK
      ?auto_154649 - BLOCK
      ?auto_154647 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_154643 ) ( not ( = ?auto_154643 ?auto_154644 ) ) ( not ( = ?auto_154643 ?auto_154645 ) ) ( not ( = ?auto_154643 ?auto_154646 ) ) ( not ( = ?auto_154644 ?auto_154645 ) ) ( not ( = ?auto_154644 ?auto_154646 ) ) ( not ( = ?auto_154645 ?auto_154646 ) ) ( ON ?auto_154646 ?auto_154650 ) ( not ( = ?auto_154643 ?auto_154650 ) ) ( not ( = ?auto_154644 ?auto_154650 ) ) ( not ( = ?auto_154645 ?auto_154650 ) ) ( not ( = ?auto_154646 ?auto_154650 ) ) ( ON ?auto_154645 ?auto_154646 ) ( CLEAR ?auto_154645 ) ( ON-TABLE ?auto_154648 ) ( ON ?auto_154651 ?auto_154648 ) ( ON ?auto_154649 ?auto_154651 ) ( ON ?auto_154647 ?auto_154649 ) ( ON ?auto_154650 ?auto_154647 ) ( not ( = ?auto_154648 ?auto_154651 ) ) ( not ( = ?auto_154648 ?auto_154649 ) ) ( not ( = ?auto_154648 ?auto_154647 ) ) ( not ( = ?auto_154648 ?auto_154650 ) ) ( not ( = ?auto_154648 ?auto_154646 ) ) ( not ( = ?auto_154648 ?auto_154645 ) ) ( not ( = ?auto_154651 ?auto_154649 ) ) ( not ( = ?auto_154651 ?auto_154647 ) ) ( not ( = ?auto_154651 ?auto_154650 ) ) ( not ( = ?auto_154651 ?auto_154646 ) ) ( not ( = ?auto_154651 ?auto_154645 ) ) ( not ( = ?auto_154649 ?auto_154647 ) ) ( not ( = ?auto_154649 ?auto_154650 ) ) ( not ( = ?auto_154649 ?auto_154646 ) ) ( not ( = ?auto_154649 ?auto_154645 ) ) ( not ( = ?auto_154647 ?auto_154650 ) ) ( not ( = ?auto_154647 ?auto_154646 ) ) ( not ( = ?auto_154647 ?auto_154645 ) ) ( not ( = ?auto_154643 ?auto_154648 ) ) ( not ( = ?auto_154643 ?auto_154651 ) ) ( not ( = ?auto_154643 ?auto_154649 ) ) ( not ( = ?auto_154643 ?auto_154647 ) ) ( not ( = ?auto_154644 ?auto_154648 ) ) ( not ( = ?auto_154644 ?auto_154651 ) ) ( not ( = ?auto_154644 ?auto_154649 ) ) ( not ( = ?auto_154644 ?auto_154647 ) ) ( HOLDING ?auto_154644 ) ( CLEAR ?auto_154643 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_154643 ?auto_154644 )
      ( MAKE-4PILE ?auto_154643 ?auto_154644 ?auto_154645 ?auto_154646 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_154652 - BLOCK
      ?auto_154653 - BLOCK
      ?auto_154654 - BLOCK
      ?auto_154655 - BLOCK
    )
    :vars
    (
      ?auto_154657 - BLOCK
      ?auto_154659 - BLOCK
      ?auto_154656 - BLOCK
      ?auto_154658 - BLOCK
      ?auto_154660 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_154652 ) ( not ( = ?auto_154652 ?auto_154653 ) ) ( not ( = ?auto_154652 ?auto_154654 ) ) ( not ( = ?auto_154652 ?auto_154655 ) ) ( not ( = ?auto_154653 ?auto_154654 ) ) ( not ( = ?auto_154653 ?auto_154655 ) ) ( not ( = ?auto_154654 ?auto_154655 ) ) ( ON ?auto_154655 ?auto_154657 ) ( not ( = ?auto_154652 ?auto_154657 ) ) ( not ( = ?auto_154653 ?auto_154657 ) ) ( not ( = ?auto_154654 ?auto_154657 ) ) ( not ( = ?auto_154655 ?auto_154657 ) ) ( ON ?auto_154654 ?auto_154655 ) ( ON-TABLE ?auto_154659 ) ( ON ?auto_154656 ?auto_154659 ) ( ON ?auto_154658 ?auto_154656 ) ( ON ?auto_154660 ?auto_154658 ) ( ON ?auto_154657 ?auto_154660 ) ( not ( = ?auto_154659 ?auto_154656 ) ) ( not ( = ?auto_154659 ?auto_154658 ) ) ( not ( = ?auto_154659 ?auto_154660 ) ) ( not ( = ?auto_154659 ?auto_154657 ) ) ( not ( = ?auto_154659 ?auto_154655 ) ) ( not ( = ?auto_154659 ?auto_154654 ) ) ( not ( = ?auto_154656 ?auto_154658 ) ) ( not ( = ?auto_154656 ?auto_154660 ) ) ( not ( = ?auto_154656 ?auto_154657 ) ) ( not ( = ?auto_154656 ?auto_154655 ) ) ( not ( = ?auto_154656 ?auto_154654 ) ) ( not ( = ?auto_154658 ?auto_154660 ) ) ( not ( = ?auto_154658 ?auto_154657 ) ) ( not ( = ?auto_154658 ?auto_154655 ) ) ( not ( = ?auto_154658 ?auto_154654 ) ) ( not ( = ?auto_154660 ?auto_154657 ) ) ( not ( = ?auto_154660 ?auto_154655 ) ) ( not ( = ?auto_154660 ?auto_154654 ) ) ( not ( = ?auto_154652 ?auto_154659 ) ) ( not ( = ?auto_154652 ?auto_154656 ) ) ( not ( = ?auto_154652 ?auto_154658 ) ) ( not ( = ?auto_154652 ?auto_154660 ) ) ( not ( = ?auto_154653 ?auto_154659 ) ) ( not ( = ?auto_154653 ?auto_154656 ) ) ( not ( = ?auto_154653 ?auto_154658 ) ) ( not ( = ?auto_154653 ?auto_154660 ) ) ( CLEAR ?auto_154652 ) ( ON ?auto_154653 ?auto_154654 ) ( CLEAR ?auto_154653 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_154659 ?auto_154656 ?auto_154658 ?auto_154660 ?auto_154657 ?auto_154655 ?auto_154654 )
      ( MAKE-4PILE ?auto_154652 ?auto_154653 ?auto_154654 ?auto_154655 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_154661 - BLOCK
      ?auto_154662 - BLOCK
      ?auto_154663 - BLOCK
      ?auto_154664 - BLOCK
    )
    :vars
    (
      ?auto_154667 - BLOCK
      ?auto_154669 - BLOCK
      ?auto_154668 - BLOCK
      ?auto_154666 - BLOCK
      ?auto_154665 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_154661 ?auto_154662 ) ) ( not ( = ?auto_154661 ?auto_154663 ) ) ( not ( = ?auto_154661 ?auto_154664 ) ) ( not ( = ?auto_154662 ?auto_154663 ) ) ( not ( = ?auto_154662 ?auto_154664 ) ) ( not ( = ?auto_154663 ?auto_154664 ) ) ( ON ?auto_154664 ?auto_154667 ) ( not ( = ?auto_154661 ?auto_154667 ) ) ( not ( = ?auto_154662 ?auto_154667 ) ) ( not ( = ?auto_154663 ?auto_154667 ) ) ( not ( = ?auto_154664 ?auto_154667 ) ) ( ON ?auto_154663 ?auto_154664 ) ( ON-TABLE ?auto_154669 ) ( ON ?auto_154668 ?auto_154669 ) ( ON ?auto_154666 ?auto_154668 ) ( ON ?auto_154665 ?auto_154666 ) ( ON ?auto_154667 ?auto_154665 ) ( not ( = ?auto_154669 ?auto_154668 ) ) ( not ( = ?auto_154669 ?auto_154666 ) ) ( not ( = ?auto_154669 ?auto_154665 ) ) ( not ( = ?auto_154669 ?auto_154667 ) ) ( not ( = ?auto_154669 ?auto_154664 ) ) ( not ( = ?auto_154669 ?auto_154663 ) ) ( not ( = ?auto_154668 ?auto_154666 ) ) ( not ( = ?auto_154668 ?auto_154665 ) ) ( not ( = ?auto_154668 ?auto_154667 ) ) ( not ( = ?auto_154668 ?auto_154664 ) ) ( not ( = ?auto_154668 ?auto_154663 ) ) ( not ( = ?auto_154666 ?auto_154665 ) ) ( not ( = ?auto_154666 ?auto_154667 ) ) ( not ( = ?auto_154666 ?auto_154664 ) ) ( not ( = ?auto_154666 ?auto_154663 ) ) ( not ( = ?auto_154665 ?auto_154667 ) ) ( not ( = ?auto_154665 ?auto_154664 ) ) ( not ( = ?auto_154665 ?auto_154663 ) ) ( not ( = ?auto_154661 ?auto_154669 ) ) ( not ( = ?auto_154661 ?auto_154668 ) ) ( not ( = ?auto_154661 ?auto_154666 ) ) ( not ( = ?auto_154661 ?auto_154665 ) ) ( not ( = ?auto_154662 ?auto_154669 ) ) ( not ( = ?auto_154662 ?auto_154668 ) ) ( not ( = ?auto_154662 ?auto_154666 ) ) ( not ( = ?auto_154662 ?auto_154665 ) ) ( ON ?auto_154662 ?auto_154663 ) ( CLEAR ?auto_154662 ) ( HOLDING ?auto_154661 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_154661 )
      ( MAKE-4PILE ?auto_154661 ?auto_154662 ?auto_154663 ?auto_154664 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_154670 - BLOCK
      ?auto_154671 - BLOCK
      ?auto_154672 - BLOCK
      ?auto_154673 - BLOCK
    )
    :vars
    (
      ?auto_154675 - BLOCK
      ?auto_154676 - BLOCK
      ?auto_154674 - BLOCK
      ?auto_154677 - BLOCK
      ?auto_154678 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_154670 ?auto_154671 ) ) ( not ( = ?auto_154670 ?auto_154672 ) ) ( not ( = ?auto_154670 ?auto_154673 ) ) ( not ( = ?auto_154671 ?auto_154672 ) ) ( not ( = ?auto_154671 ?auto_154673 ) ) ( not ( = ?auto_154672 ?auto_154673 ) ) ( ON ?auto_154673 ?auto_154675 ) ( not ( = ?auto_154670 ?auto_154675 ) ) ( not ( = ?auto_154671 ?auto_154675 ) ) ( not ( = ?auto_154672 ?auto_154675 ) ) ( not ( = ?auto_154673 ?auto_154675 ) ) ( ON ?auto_154672 ?auto_154673 ) ( ON-TABLE ?auto_154676 ) ( ON ?auto_154674 ?auto_154676 ) ( ON ?auto_154677 ?auto_154674 ) ( ON ?auto_154678 ?auto_154677 ) ( ON ?auto_154675 ?auto_154678 ) ( not ( = ?auto_154676 ?auto_154674 ) ) ( not ( = ?auto_154676 ?auto_154677 ) ) ( not ( = ?auto_154676 ?auto_154678 ) ) ( not ( = ?auto_154676 ?auto_154675 ) ) ( not ( = ?auto_154676 ?auto_154673 ) ) ( not ( = ?auto_154676 ?auto_154672 ) ) ( not ( = ?auto_154674 ?auto_154677 ) ) ( not ( = ?auto_154674 ?auto_154678 ) ) ( not ( = ?auto_154674 ?auto_154675 ) ) ( not ( = ?auto_154674 ?auto_154673 ) ) ( not ( = ?auto_154674 ?auto_154672 ) ) ( not ( = ?auto_154677 ?auto_154678 ) ) ( not ( = ?auto_154677 ?auto_154675 ) ) ( not ( = ?auto_154677 ?auto_154673 ) ) ( not ( = ?auto_154677 ?auto_154672 ) ) ( not ( = ?auto_154678 ?auto_154675 ) ) ( not ( = ?auto_154678 ?auto_154673 ) ) ( not ( = ?auto_154678 ?auto_154672 ) ) ( not ( = ?auto_154670 ?auto_154676 ) ) ( not ( = ?auto_154670 ?auto_154674 ) ) ( not ( = ?auto_154670 ?auto_154677 ) ) ( not ( = ?auto_154670 ?auto_154678 ) ) ( not ( = ?auto_154671 ?auto_154676 ) ) ( not ( = ?auto_154671 ?auto_154674 ) ) ( not ( = ?auto_154671 ?auto_154677 ) ) ( not ( = ?auto_154671 ?auto_154678 ) ) ( ON ?auto_154671 ?auto_154672 ) ( ON ?auto_154670 ?auto_154671 ) ( CLEAR ?auto_154670 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_154676 ?auto_154674 ?auto_154677 ?auto_154678 ?auto_154675 ?auto_154673 ?auto_154672 ?auto_154671 )
      ( MAKE-4PILE ?auto_154670 ?auto_154671 ?auto_154672 ?auto_154673 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_154683 - BLOCK
      ?auto_154684 - BLOCK
      ?auto_154685 - BLOCK
      ?auto_154686 - BLOCK
    )
    :vars
    (
      ?auto_154687 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_154687 ?auto_154686 ) ( CLEAR ?auto_154687 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_154683 ) ( ON ?auto_154684 ?auto_154683 ) ( ON ?auto_154685 ?auto_154684 ) ( ON ?auto_154686 ?auto_154685 ) ( not ( = ?auto_154683 ?auto_154684 ) ) ( not ( = ?auto_154683 ?auto_154685 ) ) ( not ( = ?auto_154683 ?auto_154686 ) ) ( not ( = ?auto_154683 ?auto_154687 ) ) ( not ( = ?auto_154684 ?auto_154685 ) ) ( not ( = ?auto_154684 ?auto_154686 ) ) ( not ( = ?auto_154684 ?auto_154687 ) ) ( not ( = ?auto_154685 ?auto_154686 ) ) ( not ( = ?auto_154685 ?auto_154687 ) ) ( not ( = ?auto_154686 ?auto_154687 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_154687 ?auto_154686 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_154688 - BLOCK
      ?auto_154689 - BLOCK
      ?auto_154690 - BLOCK
      ?auto_154691 - BLOCK
    )
    :vars
    (
      ?auto_154692 - BLOCK
      ?auto_154693 - BLOCK
      ?auto_154694 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_154692 ?auto_154691 ) ( CLEAR ?auto_154692 ) ( ON-TABLE ?auto_154688 ) ( ON ?auto_154689 ?auto_154688 ) ( ON ?auto_154690 ?auto_154689 ) ( ON ?auto_154691 ?auto_154690 ) ( not ( = ?auto_154688 ?auto_154689 ) ) ( not ( = ?auto_154688 ?auto_154690 ) ) ( not ( = ?auto_154688 ?auto_154691 ) ) ( not ( = ?auto_154688 ?auto_154692 ) ) ( not ( = ?auto_154689 ?auto_154690 ) ) ( not ( = ?auto_154689 ?auto_154691 ) ) ( not ( = ?auto_154689 ?auto_154692 ) ) ( not ( = ?auto_154690 ?auto_154691 ) ) ( not ( = ?auto_154690 ?auto_154692 ) ) ( not ( = ?auto_154691 ?auto_154692 ) ) ( HOLDING ?auto_154693 ) ( CLEAR ?auto_154694 ) ( not ( = ?auto_154688 ?auto_154693 ) ) ( not ( = ?auto_154688 ?auto_154694 ) ) ( not ( = ?auto_154689 ?auto_154693 ) ) ( not ( = ?auto_154689 ?auto_154694 ) ) ( not ( = ?auto_154690 ?auto_154693 ) ) ( not ( = ?auto_154690 ?auto_154694 ) ) ( not ( = ?auto_154691 ?auto_154693 ) ) ( not ( = ?auto_154691 ?auto_154694 ) ) ( not ( = ?auto_154692 ?auto_154693 ) ) ( not ( = ?auto_154692 ?auto_154694 ) ) ( not ( = ?auto_154693 ?auto_154694 ) ) )
    :subtasks
    ( ( !STACK ?auto_154693 ?auto_154694 )
      ( MAKE-4PILE ?auto_154688 ?auto_154689 ?auto_154690 ?auto_154691 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_154695 - BLOCK
      ?auto_154696 - BLOCK
      ?auto_154697 - BLOCK
      ?auto_154698 - BLOCK
    )
    :vars
    (
      ?auto_154701 - BLOCK
      ?auto_154699 - BLOCK
      ?auto_154700 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_154701 ?auto_154698 ) ( ON-TABLE ?auto_154695 ) ( ON ?auto_154696 ?auto_154695 ) ( ON ?auto_154697 ?auto_154696 ) ( ON ?auto_154698 ?auto_154697 ) ( not ( = ?auto_154695 ?auto_154696 ) ) ( not ( = ?auto_154695 ?auto_154697 ) ) ( not ( = ?auto_154695 ?auto_154698 ) ) ( not ( = ?auto_154695 ?auto_154701 ) ) ( not ( = ?auto_154696 ?auto_154697 ) ) ( not ( = ?auto_154696 ?auto_154698 ) ) ( not ( = ?auto_154696 ?auto_154701 ) ) ( not ( = ?auto_154697 ?auto_154698 ) ) ( not ( = ?auto_154697 ?auto_154701 ) ) ( not ( = ?auto_154698 ?auto_154701 ) ) ( CLEAR ?auto_154699 ) ( not ( = ?auto_154695 ?auto_154700 ) ) ( not ( = ?auto_154695 ?auto_154699 ) ) ( not ( = ?auto_154696 ?auto_154700 ) ) ( not ( = ?auto_154696 ?auto_154699 ) ) ( not ( = ?auto_154697 ?auto_154700 ) ) ( not ( = ?auto_154697 ?auto_154699 ) ) ( not ( = ?auto_154698 ?auto_154700 ) ) ( not ( = ?auto_154698 ?auto_154699 ) ) ( not ( = ?auto_154701 ?auto_154700 ) ) ( not ( = ?auto_154701 ?auto_154699 ) ) ( not ( = ?auto_154700 ?auto_154699 ) ) ( ON ?auto_154700 ?auto_154701 ) ( CLEAR ?auto_154700 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_154695 ?auto_154696 ?auto_154697 ?auto_154698 ?auto_154701 )
      ( MAKE-4PILE ?auto_154695 ?auto_154696 ?auto_154697 ?auto_154698 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_154702 - BLOCK
      ?auto_154703 - BLOCK
      ?auto_154704 - BLOCK
      ?auto_154705 - BLOCK
    )
    :vars
    (
      ?auto_154708 - BLOCK
      ?auto_154707 - BLOCK
      ?auto_154706 - BLOCK
      ?auto_154709 - BLOCK
      ?auto_154710 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_154708 ?auto_154705 ) ( ON-TABLE ?auto_154702 ) ( ON ?auto_154703 ?auto_154702 ) ( ON ?auto_154704 ?auto_154703 ) ( ON ?auto_154705 ?auto_154704 ) ( not ( = ?auto_154702 ?auto_154703 ) ) ( not ( = ?auto_154702 ?auto_154704 ) ) ( not ( = ?auto_154702 ?auto_154705 ) ) ( not ( = ?auto_154702 ?auto_154708 ) ) ( not ( = ?auto_154703 ?auto_154704 ) ) ( not ( = ?auto_154703 ?auto_154705 ) ) ( not ( = ?auto_154703 ?auto_154708 ) ) ( not ( = ?auto_154704 ?auto_154705 ) ) ( not ( = ?auto_154704 ?auto_154708 ) ) ( not ( = ?auto_154705 ?auto_154708 ) ) ( not ( = ?auto_154702 ?auto_154707 ) ) ( not ( = ?auto_154702 ?auto_154706 ) ) ( not ( = ?auto_154703 ?auto_154707 ) ) ( not ( = ?auto_154703 ?auto_154706 ) ) ( not ( = ?auto_154704 ?auto_154707 ) ) ( not ( = ?auto_154704 ?auto_154706 ) ) ( not ( = ?auto_154705 ?auto_154707 ) ) ( not ( = ?auto_154705 ?auto_154706 ) ) ( not ( = ?auto_154708 ?auto_154707 ) ) ( not ( = ?auto_154708 ?auto_154706 ) ) ( not ( = ?auto_154707 ?auto_154706 ) ) ( ON ?auto_154707 ?auto_154708 ) ( CLEAR ?auto_154707 ) ( HOLDING ?auto_154706 ) ( CLEAR ?auto_154709 ) ( ON-TABLE ?auto_154710 ) ( ON ?auto_154709 ?auto_154710 ) ( not ( = ?auto_154710 ?auto_154709 ) ) ( not ( = ?auto_154710 ?auto_154706 ) ) ( not ( = ?auto_154709 ?auto_154706 ) ) ( not ( = ?auto_154702 ?auto_154709 ) ) ( not ( = ?auto_154702 ?auto_154710 ) ) ( not ( = ?auto_154703 ?auto_154709 ) ) ( not ( = ?auto_154703 ?auto_154710 ) ) ( not ( = ?auto_154704 ?auto_154709 ) ) ( not ( = ?auto_154704 ?auto_154710 ) ) ( not ( = ?auto_154705 ?auto_154709 ) ) ( not ( = ?auto_154705 ?auto_154710 ) ) ( not ( = ?auto_154708 ?auto_154709 ) ) ( not ( = ?auto_154708 ?auto_154710 ) ) ( not ( = ?auto_154707 ?auto_154709 ) ) ( not ( = ?auto_154707 ?auto_154710 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_154710 ?auto_154709 ?auto_154706 )
      ( MAKE-4PILE ?auto_154702 ?auto_154703 ?auto_154704 ?auto_154705 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_154711 - BLOCK
      ?auto_154712 - BLOCK
      ?auto_154713 - BLOCK
      ?auto_154714 - BLOCK
    )
    :vars
    (
      ?auto_154716 - BLOCK
      ?auto_154718 - BLOCK
      ?auto_154719 - BLOCK
      ?auto_154717 - BLOCK
      ?auto_154715 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_154716 ?auto_154714 ) ( ON-TABLE ?auto_154711 ) ( ON ?auto_154712 ?auto_154711 ) ( ON ?auto_154713 ?auto_154712 ) ( ON ?auto_154714 ?auto_154713 ) ( not ( = ?auto_154711 ?auto_154712 ) ) ( not ( = ?auto_154711 ?auto_154713 ) ) ( not ( = ?auto_154711 ?auto_154714 ) ) ( not ( = ?auto_154711 ?auto_154716 ) ) ( not ( = ?auto_154712 ?auto_154713 ) ) ( not ( = ?auto_154712 ?auto_154714 ) ) ( not ( = ?auto_154712 ?auto_154716 ) ) ( not ( = ?auto_154713 ?auto_154714 ) ) ( not ( = ?auto_154713 ?auto_154716 ) ) ( not ( = ?auto_154714 ?auto_154716 ) ) ( not ( = ?auto_154711 ?auto_154718 ) ) ( not ( = ?auto_154711 ?auto_154719 ) ) ( not ( = ?auto_154712 ?auto_154718 ) ) ( not ( = ?auto_154712 ?auto_154719 ) ) ( not ( = ?auto_154713 ?auto_154718 ) ) ( not ( = ?auto_154713 ?auto_154719 ) ) ( not ( = ?auto_154714 ?auto_154718 ) ) ( not ( = ?auto_154714 ?auto_154719 ) ) ( not ( = ?auto_154716 ?auto_154718 ) ) ( not ( = ?auto_154716 ?auto_154719 ) ) ( not ( = ?auto_154718 ?auto_154719 ) ) ( ON ?auto_154718 ?auto_154716 ) ( CLEAR ?auto_154717 ) ( ON-TABLE ?auto_154715 ) ( ON ?auto_154717 ?auto_154715 ) ( not ( = ?auto_154715 ?auto_154717 ) ) ( not ( = ?auto_154715 ?auto_154719 ) ) ( not ( = ?auto_154717 ?auto_154719 ) ) ( not ( = ?auto_154711 ?auto_154717 ) ) ( not ( = ?auto_154711 ?auto_154715 ) ) ( not ( = ?auto_154712 ?auto_154717 ) ) ( not ( = ?auto_154712 ?auto_154715 ) ) ( not ( = ?auto_154713 ?auto_154717 ) ) ( not ( = ?auto_154713 ?auto_154715 ) ) ( not ( = ?auto_154714 ?auto_154717 ) ) ( not ( = ?auto_154714 ?auto_154715 ) ) ( not ( = ?auto_154716 ?auto_154717 ) ) ( not ( = ?auto_154716 ?auto_154715 ) ) ( not ( = ?auto_154718 ?auto_154717 ) ) ( not ( = ?auto_154718 ?auto_154715 ) ) ( ON ?auto_154719 ?auto_154718 ) ( CLEAR ?auto_154719 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_154711 ?auto_154712 ?auto_154713 ?auto_154714 ?auto_154716 ?auto_154718 )
      ( MAKE-4PILE ?auto_154711 ?auto_154712 ?auto_154713 ?auto_154714 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_154720 - BLOCK
      ?auto_154721 - BLOCK
      ?auto_154722 - BLOCK
      ?auto_154723 - BLOCK
    )
    :vars
    (
      ?auto_154725 - BLOCK
      ?auto_154726 - BLOCK
      ?auto_154724 - BLOCK
      ?auto_154728 - BLOCK
      ?auto_154727 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_154725 ?auto_154723 ) ( ON-TABLE ?auto_154720 ) ( ON ?auto_154721 ?auto_154720 ) ( ON ?auto_154722 ?auto_154721 ) ( ON ?auto_154723 ?auto_154722 ) ( not ( = ?auto_154720 ?auto_154721 ) ) ( not ( = ?auto_154720 ?auto_154722 ) ) ( not ( = ?auto_154720 ?auto_154723 ) ) ( not ( = ?auto_154720 ?auto_154725 ) ) ( not ( = ?auto_154721 ?auto_154722 ) ) ( not ( = ?auto_154721 ?auto_154723 ) ) ( not ( = ?auto_154721 ?auto_154725 ) ) ( not ( = ?auto_154722 ?auto_154723 ) ) ( not ( = ?auto_154722 ?auto_154725 ) ) ( not ( = ?auto_154723 ?auto_154725 ) ) ( not ( = ?auto_154720 ?auto_154726 ) ) ( not ( = ?auto_154720 ?auto_154724 ) ) ( not ( = ?auto_154721 ?auto_154726 ) ) ( not ( = ?auto_154721 ?auto_154724 ) ) ( not ( = ?auto_154722 ?auto_154726 ) ) ( not ( = ?auto_154722 ?auto_154724 ) ) ( not ( = ?auto_154723 ?auto_154726 ) ) ( not ( = ?auto_154723 ?auto_154724 ) ) ( not ( = ?auto_154725 ?auto_154726 ) ) ( not ( = ?auto_154725 ?auto_154724 ) ) ( not ( = ?auto_154726 ?auto_154724 ) ) ( ON ?auto_154726 ?auto_154725 ) ( ON-TABLE ?auto_154728 ) ( not ( = ?auto_154728 ?auto_154727 ) ) ( not ( = ?auto_154728 ?auto_154724 ) ) ( not ( = ?auto_154727 ?auto_154724 ) ) ( not ( = ?auto_154720 ?auto_154727 ) ) ( not ( = ?auto_154720 ?auto_154728 ) ) ( not ( = ?auto_154721 ?auto_154727 ) ) ( not ( = ?auto_154721 ?auto_154728 ) ) ( not ( = ?auto_154722 ?auto_154727 ) ) ( not ( = ?auto_154722 ?auto_154728 ) ) ( not ( = ?auto_154723 ?auto_154727 ) ) ( not ( = ?auto_154723 ?auto_154728 ) ) ( not ( = ?auto_154725 ?auto_154727 ) ) ( not ( = ?auto_154725 ?auto_154728 ) ) ( not ( = ?auto_154726 ?auto_154727 ) ) ( not ( = ?auto_154726 ?auto_154728 ) ) ( ON ?auto_154724 ?auto_154726 ) ( CLEAR ?auto_154724 ) ( HOLDING ?auto_154727 ) ( CLEAR ?auto_154728 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_154728 ?auto_154727 )
      ( MAKE-4PILE ?auto_154720 ?auto_154721 ?auto_154722 ?auto_154723 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_156422 - BLOCK
      ?auto_156423 - BLOCK
      ?auto_156424 - BLOCK
      ?auto_156425 - BLOCK
    )
    :vars
    (
      ?auto_156427 - BLOCK
      ?auto_156428 - BLOCK
      ?auto_156426 - BLOCK
      ?auto_156429 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_156427 ?auto_156425 ) ( ON-TABLE ?auto_156422 ) ( ON ?auto_156423 ?auto_156422 ) ( ON ?auto_156424 ?auto_156423 ) ( ON ?auto_156425 ?auto_156424 ) ( not ( = ?auto_156422 ?auto_156423 ) ) ( not ( = ?auto_156422 ?auto_156424 ) ) ( not ( = ?auto_156422 ?auto_156425 ) ) ( not ( = ?auto_156422 ?auto_156427 ) ) ( not ( = ?auto_156423 ?auto_156424 ) ) ( not ( = ?auto_156423 ?auto_156425 ) ) ( not ( = ?auto_156423 ?auto_156427 ) ) ( not ( = ?auto_156424 ?auto_156425 ) ) ( not ( = ?auto_156424 ?auto_156427 ) ) ( not ( = ?auto_156425 ?auto_156427 ) ) ( not ( = ?auto_156422 ?auto_156428 ) ) ( not ( = ?auto_156422 ?auto_156426 ) ) ( not ( = ?auto_156423 ?auto_156428 ) ) ( not ( = ?auto_156423 ?auto_156426 ) ) ( not ( = ?auto_156424 ?auto_156428 ) ) ( not ( = ?auto_156424 ?auto_156426 ) ) ( not ( = ?auto_156425 ?auto_156428 ) ) ( not ( = ?auto_156425 ?auto_156426 ) ) ( not ( = ?auto_156427 ?auto_156428 ) ) ( not ( = ?auto_156427 ?auto_156426 ) ) ( not ( = ?auto_156428 ?auto_156426 ) ) ( ON ?auto_156428 ?auto_156427 ) ( not ( = ?auto_156429 ?auto_156426 ) ) ( not ( = ?auto_156422 ?auto_156429 ) ) ( not ( = ?auto_156423 ?auto_156429 ) ) ( not ( = ?auto_156424 ?auto_156429 ) ) ( not ( = ?auto_156425 ?auto_156429 ) ) ( not ( = ?auto_156427 ?auto_156429 ) ) ( not ( = ?auto_156428 ?auto_156429 ) ) ( ON ?auto_156426 ?auto_156428 ) ( ON ?auto_156429 ?auto_156426 ) ( CLEAR ?auto_156429 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_156422 ?auto_156423 ?auto_156424 ?auto_156425 ?auto_156427 ?auto_156428 ?auto_156426 )
      ( MAKE-4PILE ?auto_156422 ?auto_156423 ?auto_156424 ?auto_156425 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_154738 - BLOCK
      ?auto_154739 - BLOCK
      ?auto_154740 - BLOCK
      ?auto_154741 - BLOCK
    )
    :vars
    (
      ?auto_154746 - BLOCK
      ?auto_154742 - BLOCK
      ?auto_154743 - BLOCK
      ?auto_154744 - BLOCK
      ?auto_154745 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_154746 ?auto_154741 ) ( ON-TABLE ?auto_154738 ) ( ON ?auto_154739 ?auto_154738 ) ( ON ?auto_154740 ?auto_154739 ) ( ON ?auto_154741 ?auto_154740 ) ( not ( = ?auto_154738 ?auto_154739 ) ) ( not ( = ?auto_154738 ?auto_154740 ) ) ( not ( = ?auto_154738 ?auto_154741 ) ) ( not ( = ?auto_154738 ?auto_154746 ) ) ( not ( = ?auto_154739 ?auto_154740 ) ) ( not ( = ?auto_154739 ?auto_154741 ) ) ( not ( = ?auto_154739 ?auto_154746 ) ) ( not ( = ?auto_154740 ?auto_154741 ) ) ( not ( = ?auto_154740 ?auto_154746 ) ) ( not ( = ?auto_154741 ?auto_154746 ) ) ( not ( = ?auto_154738 ?auto_154742 ) ) ( not ( = ?auto_154738 ?auto_154743 ) ) ( not ( = ?auto_154739 ?auto_154742 ) ) ( not ( = ?auto_154739 ?auto_154743 ) ) ( not ( = ?auto_154740 ?auto_154742 ) ) ( not ( = ?auto_154740 ?auto_154743 ) ) ( not ( = ?auto_154741 ?auto_154742 ) ) ( not ( = ?auto_154741 ?auto_154743 ) ) ( not ( = ?auto_154746 ?auto_154742 ) ) ( not ( = ?auto_154746 ?auto_154743 ) ) ( not ( = ?auto_154742 ?auto_154743 ) ) ( ON ?auto_154742 ?auto_154746 ) ( not ( = ?auto_154744 ?auto_154745 ) ) ( not ( = ?auto_154744 ?auto_154743 ) ) ( not ( = ?auto_154745 ?auto_154743 ) ) ( not ( = ?auto_154738 ?auto_154745 ) ) ( not ( = ?auto_154738 ?auto_154744 ) ) ( not ( = ?auto_154739 ?auto_154745 ) ) ( not ( = ?auto_154739 ?auto_154744 ) ) ( not ( = ?auto_154740 ?auto_154745 ) ) ( not ( = ?auto_154740 ?auto_154744 ) ) ( not ( = ?auto_154741 ?auto_154745 ) ) ( not ( = ?auto_154741 ?auto_154744 ) ) ( not ( = ?auto_154746 ?auto_154745 ) ) ( not ( = ?auto_154746 ?auto_154744 ) ) ( not ( = ?auto_154742 ?auto_154745 ) ) ( not ( = ?auto_154742 ?auto_154744 ) ) ( ON ?auto_154743 ?auto_154742 ) ( ON ?auto_154745 ?auto_154743 ) ( CLEAR ?auto_154745 ) ( HOLDING ?auto_154744 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_154744 )
      ( MAKE-4PILE ?auto_154738 ?auto_154739 ?auto_154740 ?auto_154741 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_154747 - BLOCK
      ?auto_154748 - BLOCK
      ?auto_154749 - BLOCK
      ?auto_154750 - BLOCK
    )
    :vars
    (
      ?auto_154754 - BLOCK
      ?auto_154755 - BLOCK
      ?auto_154752 - BLOCK
      ?auto_154751 - BLOCK
      ?auto_154753 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_154754 ?auto_154750 ) ( ON-TABLE ?auto_154747 ) ( ON ?auto_154748 ?auto_154747 ) ( ON ?auto_154749 ?auto_154748 ) ( ON ?auto_154750 ?auto_154749 ) ( not ( = ?auto_154747 ?auto_154748 ) ) ( not ( = ?auto_154747 ?auto_154749 ) ) ( not ( = ?auto_154747 ?auto_154750 ) ) ( not ( = ?auto_154747 ?auto_154754 ) ) ( not ( = ?auto_154748 ?auto_154749 ) ) ( not ( = ?auto_154748 ?auto_154750 ) ) ( not ( = ?auto_154748 ?auto_154754 ) ) ( not ( = ?auto_154749 ?auto_154750 ) ) ( not ( = ?auto_154749 ?auto_154754 ) ) ( not ( = ?auto_154750 ?auto_154754 ) ) ( not ( = ?auto_154747 ?auto_154755 ) ) ( not ( = ?auto_154747 ?auto_154752 ) ) ( not ( = ?auto_154748 ?auto_154755 ) ) ( not ( = ?auto_154748 ?auto_154752 ) ) ( not ( = ?auto_154749 ?auto_154755 ) ) ( not ( = ?auto_154749 ?auto_154752 ) ) ( not ( = ?auto_154750 ?auto_154755 ) ) ( not ( = ?auto_154750 ?auto_154752 ) ) ( not ( = ?auto_154754 ?auto_154755 ) ) ( not ( = ?auto_154754 ?auto_154752 ) ) ( not ( = ?auto_154755 ?auto_154752 ) ) ( ON ?auto_154755 ?auto_154754 ) ( not ( = ?auto_154751 ?auto_154753 ) ) ( not ( = ?auto_154751 ?auto_154752 ) ) ( not ( = ?auto_154753 ?auto_154752 ) ) ( not ( = ?auto_154747 ?auto_154753 ) ) ( not ( = ?auto_154747 ?auto_154751 ) ) ( not ( = ?auto_154748 ?auto_154753 ) ) ( not ( = ?auto_154748 ?auto_154751 ) ) ( not ( = ?auto_154749 ?auto_154753 ) ) ( not ( = ?auto_154749 ?auto_154751 ) ) ( not ( = ?auto_154750 ?auto_154753 ) ) ( not ( = ?auto_154750 ?auto_154751 ) ) ( not ( = ?auto_154754 ?auto_154753 ) ) ( not ( = ?auto_154754 ?auto_154751 ) ) ( not ( = ?auto_154755 ?auto_154753 ) ) ( not ( = ?auto_154755 ?auto_154751 ) ) ( ON ?auto_154752 ?auto_154755 ) ( ON ?auto_154753 ?auto_154752 ) ( ON ?auto_154751 ?auto_154753 ) ( CLEAR ?auto_154751 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_154747 ?auto_154748 ?auto_154749 ?auto_154750 ?auto_154754 ?auto_154755 ?auto_154752 ?auto_154753 )
      ( MAKE-4PILE ?auto_154747 ?auto_154748 ?auto_154749 ?auto_154750 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_154761 - BLOCK
      ?auto_154762 - BLOCK
      ?auto_154763 - BLOCK
      ?auto_154764 - BLOCK
      ?auto_154765 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_154765 ) ( CLEAR ?auto_154764 ) ( ON-TABLE ?auto_154761 ) ( ON ?auto_154762 ?auto_154761 ) ( ON ?auto_154763 ?auto_154762 ) ( ON ?auto_154764 ?auto_154763 ) ( not ( = ?auto_154761 ?auto_154762 ) ) ( not ( = ?auto_154761 ?auto_154763 ) ) ( not ( = ?auto_154761 ?auto_154764 ) ) ( not ( = ?auto_154761 ?auto_154765 ) ) ( not ( = ?auto_154762 ?auto_154763 ) ) ( not ( = ?auto_154762 ?auto_154764 ) ) ( not ( = ?auto_154762 ?auto_154765 ) ) ( not ( = ?auto_154763 ?auto_154764 ) ) ( not ( = ?auto_154763 ?auto_154765 ) ) ( not ( = ?auto_154764 ?auto_154765 ) ) )
    :subtasks
    ( ( !STACK ?auto_154765 ?auto_154764 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_154766 - BLOCK
      ?auto_154767 - BLOCK
      ?auto_154768 - BLOCK
      ?auto_154769 - BLOCK
      ?auto_154770 - BLOCK
    )
    :vars
    (
      ?auto_154771 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_154769 ) ( ON-TABLE ?auto_154766 ) ( ON ?auto_154767 ?auto_154766 ) ( ON ?auto_154768 ?auto_154767 ) ( ON ?auto_154769 ?auto_154768 ) ( not ( = ?auto_154766 ?auto_154767 ) ) ( not ( = ?auto_154766 ?auto_154768 ) ) ( not ( = ?auto_154766 ?auto_154769 ) ) ( not ( = ?auto_154766 ?auto_154770 ) ) ( not ( = ?auto_154767 ?auto_154768 ) ) ( not ( = ?auto_154767 ?auto_154769 ) ) ( not ( = ?auto_154767 ?auto_154770 ) ) ( not ( = ?auto_154768 ?auto_154769 ) ) ( not ( = ?auto_154768 ?auto_154770 ) ) ( not ( = ?auto_154769 ?auto_154770 ) ) ( ON ?auto_154770 ?auto_154771 ) ( CLEAR ?auto_154770 ) ( HAND-EMPTY ) ( not ( = ?auto_154766 ?auto_154771 ) ) ( not ( = ?auto_154767 ?auto_154771 ) ) ( not ( = ?auto_154768 ?auto_154771 ) ) ( not ( = ?auto_154769 ?auto_154771 ) ) ( not ( = ?auto_154770 ?auto_154771 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_154770 ?auto_154771 )
      ( MAKE-5PILE ?auto_154766 ?auto_154767 ?auto_154768 ?auto_154769 ?auto_154770 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_154772 - BLOCK
      ?auto_154773 - BLOCK
      ?auto_154774 - BLOCK
      ?auto_154775 - BLOCK
      ?auto_154776 - BLOCK
    )
    :vars
    (
      ?auto_154777 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_154772 ) ( ON ?auto_154773 ?auto_154772 ) ( ON ?auto_154774 ?auto_154773 ) ( not ( = ?auto_154772 ?auto_154773 ) ) ( not ( = ?auto_154772 ?auto_154774 ) ) ( not ( = ?auto_154772 ?auto_154775 ) ) ( not ( = ?auto_154772 ?auto_154776 ) ) ( not ( = ?auto_154773 ?auto_154774 ) ) ( not ( = ?auto_154773 ?auto_154775 ) ) ( not ( = ?auto_154773 ?auto_154776 ) ) ( not ( = ?auto_154774 ?auto_154775 ) ) ( not ( = ?auto_154774 ?auto_154776 ) ) ( not ( = ?auto_154775 ?auto_154776 ) ) ( ON ?auto_154776 ?auto_154777 ) ( CLEAR ?auto_154776 ) ( not ( = ?auto_154772 ?auto_154777 ) ) ( not ( = ?auto_154773 ?auto_154777 ) ) ( not ( = ?auto_154774 ?auto_154777 ) ) ( not ( = ?auto_154775 ?auto_154777 ) ) ( not ( = ?auto_154776 ?auto_154777 ) ) ( HOLDING ?auto_154775 ) ( CLEAR ?auto_154774 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_154772 ?auto_154773 ?auto_154774 ?auto_154775 )
      ( MAKE-5PILE ?auto_154772 ?auto_154773 ?auto_154774 ?auto_154775 ?auto_154776 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_154778 - BLOCK
      ?auto_154779 - BLOCK
      ?auto_154780 - BLOCK
      ?auto_154781 - BLOCK
      ?auto_154782 - BLOCK
    )
    :vars
    (
      ?auto_154783 - BLOCK
      ?auto_154786 - BLOCK
      ?auto_154785 - BLOCK
      ?auto_154784 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_154778 ) ( ON ?auto_154779 ?auto_154778 ) ( ON ?auto_154780 ?auto_154779 ) ( not ( = ?auto_154778 ?auto_154779 ) ) ( not ( = ?auto_154778 ?auto_154780 ) ) ( not ( = ?auto_154778 ?auto_154781 ) ) ( not ( = ?auto_154778 ?auto_154782 ) ) ( not ( = ?auto_154779 ?auto_154780 ) ) ( not ( = ?auto_154779 ?auto_154781 ) ) ( not ( = ?auto_154779 ?auto_154782 ) ) ( not ( = ?auto_154780 ?auto_154781 ) ) ( not ( = ?auto_154780 ?auto_154782 ) ) ( not ( = ?auto_154781 ?auto_154782 ) ) ( ON ?auto_154782 ?auto_154783 ) ( not ( = ?auto_154778 ?auto_154783 ) ) ( not ( = ?auto_154779 ?auto_154783 ) ) ( not ( = ?auto_154780 ?auto_154783 ) ) ( not ( = ?auto_154781 ?auto_154783 ) ) ( not ( = ?auto_154782 ?auto_154783 ) ) ( CLEAR ?auto_154780 ) ( ON ?auto_154781 ?auto_154782 ) ( CLEAR ?auto_154781 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_154786 ) ( ON ?auto_154785 ?auto_154786 ) ( ON ?auto_154784 ?auto_154785 ) ( ON ?auto_154783 ?auto_154784 ) ( not ( = ?auto_154786 ?auto_154785 ) ) ( not ( = ?auto_154786 ?auto_154784 ) ) ( not ( = ?auto_154786 ?auto_154783 ) ) ( not ( = ?auto_154786 ?auto_154782 ) ) ( not ( = ?auto_154786 ?auto_154781 ) ) ( not ( = ?auto_154785 ?auto_154784 ) ) ( not ( = ?auto_154785 ?auto_154783 ) ) ( not ( = ?auto_154785 ?auto_154782 ) ) ( not ( = ?auto_154785 ?auto_154781 ) ) ( not ( = ?auto_154784 ?auto_154783 ) ) ( not ( = ?auto_154784 ?auto_154782 ) ) ( not ( = ?auto_154784 ?auto_154781 ) ) ( not ( = ?auto_154778 ?auto_154786 ) ) ( not ( = ?auto_154778 ?auto_154785 ) ) ( not ( = ?auto_154778 ?auto_154784 ) ) ( not ( = ?auto_154779 ?auto_154786 ) ) ( not ( = ?auto_154779 ?auto_154785 ) ) ( not ( = ?auto_154779 ?auto_154784 ) ) ( not ( = ?auto_154780 ?auto_154786 ) ) ( not ( = ?auto_154780 ?auto_154785 ) ) ( not ( = ?auto_154780 ?auto_154784 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_154786 ?auto_154785 ?auto_154784 ?auto_154783 ?auto_154782 )
      ( MAKE-5PILE ?auto_154778 ?auto_154779 ?auto_154780 ?auto_154781 ?auto_154782 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_154787 - BLOCK
      ?auto_154788 - BLOCK
      ?auto_154789 - BLOCK
      ?auto_154790 - BLOCK
      ?auto_154791 - BLOCK
    )
    :vars
    (
      ?auto_154792 - BLOCK
      ?auto_154794 - BLOCK
      ?auto_154793 - BLOCK
      ?auto_154795 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_154787 ) ( ON ?auto_154788 ?auto_154787 ) ( not ( = ?auto_154787 ?auto_154788 ) ) ( not ( = ?auto_154787 ?auto_154789 ) ) ( not ( = ?auto_154787 ?auto_154790 ) ) ( not ( = ?auto_154787 ?auto_154791 ) ) ( not ( = ?auto_154788 ?auto_154789 ) ) ( not ( = ?auto_154788 ?auto_154790 ) ) ( not ( = ?auto_154788 ?auto_154791 ) ) ( not ( = ?auto_154789 ?auto_154790 ) ) ( not ( = ?auto_154789 ?auto_154791 ) ) ( not ( = ?auto_154790 ?auto_154791 ) ) ( ON ?auto_154791 ?auto_154792 ) ( not ( = ?auto_154787 ?auto_154792 ) ) ( not ( = ?auto_154788 ?auto_154792 ) ) ( not ( = ?auto_154789 ?auto_154792 ) ) ( not ( = ?auto_154790 ?auto_154792 ) ) ( not ( = ?auto_154791 ?auto_154792 ) ) ( ON ?auto_154790 ?auto_154791 ) ( CLEAR ?auto_154790 ) ( ON-TABLE ?auto_154794 ) ( ON ?auto_154793 ?auto_154794 ) ( ON ?auto_154795 ?auto_154793 ) ( ON ?auto_154792 ?auto_154795 ) ( not ( = ?auto_154794 ?auto_154793 ) ) ( not ( = ?auto_154794 ?auto_154795 ) ) ( not ( = ?auto_154794 ?auto_154792 ) ) ( not ( = ?auto_154794 ?auto_154791 ) ) ( not ( = ?auto_154794 ?auto_154790 ) ) ( not ( = ?auto_154793 ?auto_154795 ) ) ( not ( = ?auto_154793 ?auto_154792 ) ) ( not ( = ?auto_154793 ?auto_154791 ) ) ( not ( = ?auto_154793 ?auto_154790 ) ) ( not ( = ?auto_154795 ?auto_154792 ) ) ( not ( = ?auto_154795 ?auto_154791 ) ) ( not ( = ?auto_154795 ?auto_154790 ) ) ( not ( = ?auto_154787 ?auto_154794 ) ) ( not ( = ?auto_154787 ?auto_154793 ) ) ( not ( = ?auto_154787 ?auto_154795 ) ) ( not ( = ?auto_154788 ?auto_154794 ) ) ( not ( = ?auto_154788 ?auto_154793 ) ) ( not ( = ?auto_154788 ?auto_154795 ) ) ( not ( = ?auto_154789 ?auto_154794 ) ) ( not ( = ?auto_154789 ?auto_154793 ) ) ( not ( = ?auto_154789 ?auto_154795 ) ) ( HOLDING ?auto_154789 ) ( CLEAR ?auto_154788 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_154787 ?auto_154788 ?auto_154789 )
      ( MAKE-5PILE ?auto_154787 ?auto_154788 ?auto_154789 ?auto_154790 ?auto_154791 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_154796 - BLOCK
      ?auto_154797 - BLOCK
      ?auto_154798 - BLOCK
      ?auto_154799 - BLOCK
      ?auto_154800 - BLOCK
    )
    :vars
    (
      ?auto_154804 - BLOCK
      ?auto_154803 - BLOCK
      ?auto_154802 - BLOCK
      ?auto_154801 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_154796 ) ( ON ?auto_154797 ?auto_154796 ) ( not ( = ?auto_154796 ?auto_154797 ) ) ( not ( = ?auto_154796 ?auto_154798 ) ) ( not ( = ?auto_154796 ?auto_154799 ) ) ( not ( = ?auto_154796 ?auto_154800 ) ) ( not ( = ?auto_154797 ?auto_154798 ) ) ( not ( = ?auto_154797 ?auto_154799 ) ) ( not ( = ?auto_154797 ?auto_154800 ) ) ( not ( = ?auto_154798 ?auto_154799 ) ) ( not ( = ?auto_154798 ?auto_154800 ) ) ( not ( = ?auto_154799 ?auto_154800 ) ) ( ON ?auto_154800 ?auto_154804 ) ( not ( = ?auto_154796 ?auto_154804 ) ) ( not ( = ?auto_154797 ?auto_154804 ) ) ( not ( = ?auto_154798 ?auto_154804 ) ) ( not ( = ?auto_154799 ?auto_154804 ) ) ( not ( = ?auto_154800 ?auto_154804 ) ) ( ON ?auto_154799 ?auto_154800 ) ( ON-TABLE ?auto_154803 ) ( ON ?auto_154802 ?auto_154803 ) ( ON ?auto_154801 ?auto_154802 ) ( ON ?auto_154804 ?auto_154801 ) ( not ( = ?auto_154803 ?auto_154802 ) ) ( not ( = ?auto_154803 ?auto_154801 ) ) ( not ( = ?auto_154803 ?auto_154804 ) ) ( not ( = ?auto_154803 ?auto_154800 ) ) ( not ( = ?auto_154803 ?auto_154799 ) ) ( not ( = ?auto_154802 ?auto_154801 ) ) ( not ( = ?auto_154802 ?auto_154804 ) ) ( not ( = ?auto_154802 ?auto_154800 ) ) ( not ( = ?auto_154802 ?auto_154799 ) ) ( not ( = ?auto_154801 ?auto_154804 ) ) ( not ( = ?auto_154801 ?auto_154800 ) ) ( not ( = ?auto_154801 ?auto_154799 ) ) ( not ( = ?auto_154796 ?auto_154803 ) ) ( not ( = ?auto_154796 ?auto_154802 ) ) ( not ( = ?auto_154796 ?auto_154801 ) ) ( not ( = ?auto_154797 ?auto_154803 ) ) ( not ( = ?auto_154797 ?auto_154802 ) ) ( not ( = ?auto_154797 ?auto_154801 ) ) ( not ( = ?auto_154798 ?auto_154803 ) ) ( not ( = ?auto_154798 ?auto_154802 ) ) ( not ( = ?auto_154798 ?auto_154801 ) ) ( CLEAR ?auto_154797 ) ( ON ?auto_154798 ?auto_154799 ) ( CLEAR ?auto_154798 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_154803 ?auto_154802 ?auto_154801 ?auto_154804 ?auto_154800 ?auto_154799 )
      ( MAKE-5PILE ?auto_154796 ?auto_154797 ?auto_154798 ?auto_154799 ?auto_154800 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_154805 - BLOCK
      ?auto_154806 - BLOCK
      ?auto_154807 - BLOCK
      ?auto_154808 - BLOCK
      ?auto_154809 - BLOCK
    )
    :vars
    (
      ?auto_154810 - BLOCK
      ?auto_154812 - BLOCK
      ?auto_154813 - BLOCK
      ?auto_154811 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_154805 ) ( not ( = ?auto_154805 ?auto_154806 ) ) ( not ( = ?auto_154805 ?auto_154807 ) ) ( not ( = ?auto_154805 ?auto_154808 ) ) ( not ( = ?auto_154805 ?auto_154809 ) ) ( not ( = ?auto_154806 ?auto_154807 ) ) ( not ( = ?auto_154806 ?auto_154808 ) ) ( not ( = ?auto_154806 ?auto_154809 ) ) ( not ( = ?auto_154807 ?auto_154808 ) ) ( not ( = ?auto_154807 ?auto_154809 ) ) ( not ( = ?auto_154808 ?auto_154809 ) ) ( ON ?auto_154809 ?auto_154810 ) ( not ( = ?auto_154805 ?auto_154810 ) ) ( not ( = ?auto_154806 ?auto_154810 ) ) ( not ( = ?auto_154807 ?auto_154810 ) ) ( not ( = ?auto_154808 ?auto_154810 ) ) ( not ( = ?auto_154809 ?auto_154810 ) ) ( ON ?auto_154808 ?auto_154809 ) ( ON-TABLE ?auto_154812 ) ( ON ?auto_154813 ?auto_154812 ) ( ON ?auto_154811 ?auto_154813 ) ( ON ?auto_154810 ?auto_154811 ) ( not ( = ?auto_154812 ?auto_154813 ) ) ( not ( = ?auto_154812 ?auto_154811 ) ) ( not ( = ?auto_154812 ?auto_154810 ) ) ( not ( = ?auto_154812 ?auto_154809 ) ) ( not ( = ?auto_154812 ?auto_154808 ) ) ( not ( = ?auto_154813 ?auto_154811 ) ) ( not ( = ?auto_154813 ?auto_154810 ) ) ( not ( = ?auto_154813 ?auto_154809 ) ) ( not ( = ?auto_154813 ?auto_154808 ) ) ( not ( = ?auto_154811 ?auto_154810 ) ) ( not ( = ?auto_154811 ?auto_154809 ) ) ( not ( = ?auto_154811 ?auto_154808 ) ) ( not ( = ?auto_154805 ?auto_154812 ) ) ( not ( = ?auto_154805 ?auto_154813 ) ) ( not ( = ?auto_154805 ?auto_154811 ) ) ( not ( = ?auto_154806 ?auto_154812 ) ) ( not ( = ?auto_154806 ?auto_154813 ) ) ( not ( = ?auto_154806 ?auto_154811 ) ) ( not ( = ?auto_154807 ?auto_154812 ) ) ( not ( = ?auto_154807 ?auto_154813 ) ) ( not ( = ?auto_154807 ?auto_154811 ) ) ( ON ?auto_154807 ?auto_154808 ) ( CLEAR ?auto_154807 ) ( HOLDING ?auto_154806 ) ( CLEAR ?auto_154805 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_154805 ?auto_154806 )
      ( MAKE-5PILE ?auto_154805 ?auto_154806 ?auto_154807 ?auto_154808 ?auto_154809 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_154814 - BLOCK
      ?auto_154815 - BLOCK
      ?auto_154816 - BLOCK
      ?auto_154817 - BLOCK
      ?auto_154818 - BLOCK
    )
    :vars
    (
      ?auto_154820 - BLOCK
      ?auto_154822 - BLOCK
      ?auto_154819 - BLOCK
      ?auto_154821 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_154814 ) ( not ( = ?auto_154814 ?auto_154815 ) ) ( not ( = ?auto_154814 ?auto_154816 ) ) ( not ( = ?auto_154814 ?auto_154817 ) ) ( not ( = ?auto_154814 ?auto_154818 ) ) ( not ( = ?auto_154815 ?auto_154816 ) ) ( not ( = ?auto_154815 ?auto_154817 ) ) ( not ( = ?auto_154815 ?auto_154818 ) ) ( not ( = ?auto_154816 ?auto_154817 ) ) ( not ( = ?auto_154816 ?auto_154818 ) ) ( not ( = ?auto_154817 ?auto_154818 ) ) ( ON ?auto_154818 ?auto_154820 ) ( not ( = ?auto_154814 ?auto_154820 ) ) ( not ( = ?auto_154815 ?auto_154820 ) ) ( not ( = ?auto_154816 ?auto_154820 ) ) ( not ( = ?auto_154817 ?auto_154820 ) ) ( not ( = ?auto_154818 ?auto_154820 ) ) ( ON ?auto_154817 ?auto_154818 ) ( ON-TABLE ?auto_154822 ) ( ON ?auto_154819 ?auto_154822 ) ( ON ?auto_154821 ?auto_154819 ) ( ON ?auto_154820 ?auto_154821 ) ( not ( = ?auto_154822 ?auto_154819 ) ) ( not ( = ?auto_154822 ?auto_154821 ) ) ( not ( = ?auto_154822 ?auto_154820 ) ) ( not ( = ?auto_154822 ?auto_154818 ) ) ( not ( = ?auto_154822 ?auto_154817 ) ) ( not ( = ?auto_154819 ?auto_154821 ) ) ( not ( = ?auto_154819 ?auto_154820 ) ) ( not ( = ?auto_154819 ?auto_154818 ) ) ( not ( = ?auto_154819 ?auto_154817 ) ) ( not ( = ?auto_154821 ?auto_154820 ) ) ( not ( = ?auto_154821 ?auto_154818 ) ) ( not ( = ?auto_154821 ?auto_154817 ) ) ( not ( = ?auto_154814 ?auto_154822 ) ) ( not ( = ?auto_154814 ?auto_154819 ) ) ( not ( = ?auto_154814 ?auto_154821 ) ) ( not ( = ?auto_154815 ?auto_154822 ) ) ( not ( = ?auto_154815 ?auto_154819 ) ) ( not ( = ?auto_154815 ?auto_154821 ) ) ( not ( = ?auto_154816 ?auto_154822 ) ) ( not ( = ?auto_154816 ?auto_154819 ) ) ( not ( = ?auto_154816 ?auto_154821 ) ) ( ON ?auto_154816 ?auto_154817 ) ( CLEAR ?auto_154814 ) ( ON ?auto_154815 ?auto_154816 ) ( CLEAR ?auto_154815 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_154822 ?auto_154819 ?auto_154821 ?auto_154820 ?auto_154818 ?auto_154817 ?auto_154816 )
      ( MAKE-5PILE ?auto_154814 ?auto_154815 ?auto_154816 ?auto_154817 ?auto_154818 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_154823 - BLOCK
      ?auto_154824 - BLOCK
      ?auto_154825 - BLOCK
      ?auto_154826 - BLOCK
      ?auto_154827 - BLOCK
    )
    :vars
    (
      ?auto_154831 - BLOCK
      ?auto_154829 - BLOCK
      ?auto_154828 - BLOCK
      ?auto_154830 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_154823 ?auto_154824 ) ) ( not ( = ?auto_154823 ?auto_154825 ) ) ( not ( = ?auto_154823 ?auto_154826 ) ) ( not ( = ?auto_154823 ?auto_154827 ) ) ( not ( = ?auto_154824 ?auto_154825 ) ) ( not ( = ?auto_154824 ?auto_154826 ) ) ( not ( = ?auto_154824 ?auto_154827 ) ) ( not ( = ?auto_154825 ?auto_154826 ) ) ( not ( = ?auto_154825 ?auto_154827 ) ) ( not ( = ?auto_154826 ?auto_154827 ) ) ( ON ?auto_154827 ?auto_154831 ) ( not ( = ?auto_154823 ?auto_154831 ) ) ( not ( = ?auto_154824 ?auto_154831 ) ) ( not ( = ?auto_154825 ?auto_154831 ) ) ( not ( = ?auto_154826 ?auto_154831 ) ) ( not ( = ?auto_154827 ?auto_154831 ) ) ( ON ?auto_154826 ?auto_154827 ) ( ON-TABLE ?auto_154829 ) ( ON ?auto_154828 ?auto_154829 ) ( ON ?auto_154830 ?auto_154828 ) ( ON ?auto_154831 ?auto_154830 ) ( not ( = ?auto_154829 ?auto_154828 ) ) ( not ( = ?auto_154829 ?auto_154830 ) ) ( not ( = ?auto_154829 ?auto_154831 ) ) ( not ( = ?auto_154829 ?auto_154827 ) ) ( not ( = ?auto_154829 ?auto_154826 ) ) ( not ( = ?auto_154828 ?auto_154830 ) ) ( not ( = ?auto_154828 ?auto_154831 ) ) ( not ( = ?auto_154828 ?auto_154827 ) ) ( not ( = ?auto_154828 ?auto_154826 ) ) ( not ( = ?auto_154830 ?auto_154831 ) ) ( not ( = ?auto_154830 ?auto_154827 ) ) ( not ( = ?auto_154830 ?auto_154826 ) ) ( not ( = ?auto_154823 ?auto_154829 ) ) ( not ( = ?auto_154823 ?auto_154828 ) ) ( not ( = ?auto_154823 ?auto_154830 ) ) ( not ( = ?auto_154824 ?auto_154829 ) ) ( not ( = ?auto_154824 ?auto_154828 ) ) ( not ( = ?auto_154824 ?auto_154830 ) ) ( not ( = ?auto_154825 ?auto_154829 ) ) ( not ( = ?auto_154825 ?auto_154828 ) ) ( not ( = ?auto_154825 ?auto_154830 ) ) ( ON ?auto_154825 ?auto_154826 ) ( ON ?auto_154824 ?auto_154825 ) ( CLEAR ?auto_154824 ) ( HOLDING ?auto_154823 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_154823 )
      ( MAKE-5PILE ?auto_154823 ?auto_154824 ?auto_154825 ?auto_154826 ?auto_154827 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_154832 - BLOCK
      ?auto_154833 - BLOCK
      ?auto_154834 - BLOCK
      ?auto_154835 - BLOCK
      ?auto_154836 - BLOCK
    )
    :vars
    (
      ?auto_154838 - BLOCK
      ?auto_154839 - BLOCK
      ?auto_154837 - BLOCK
      ?auto_154840 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_154832 ?auto_154833 ) ) ( not ( = ?auto_154832 ?auto_154834 ) ) ( not ( = ?auto_154832 ?auto_154835 ) ) ( not ( = ?auto_154832 ?auto_154836 ) ) ( not ( = ?auto_154833 ?auto_154834 ) ) ( not ( = ?auto_154833 ?auto_154835 ) ) ( not ( = ?auto_154833 ?auto_154836 ) ) ( not ( = ?auto_154834 ?auto_154835 ) ) ( not ( = ?auto_154834 ?auto_154836 ) ) ( not ( = ?auto_154835 ?auto_154836 ) ) ( ON ?auto_154836 ?auto_154838 ) ( not ( = ?auto_154832 ?auto_154838 ) ) ( not ( = ?auto_154833 ?auto_154838 ) ) ( not ( = ?auto_154834 ?auto_154838 ) ) ( not ( = ?auto_154835 ?auto_154838 ) ) ( not ( = ?auto_154836 ?auto_154838 ) ) ( ON ?auto_154835 ?auto_154836 ) ( ON-TABLE ?auto_154839 ) ( ON ?auto_154837 ?auto_154839 ) ( ON ?auto_154840 ?auto_154837 ) ( ON ?auto_154838 ?auto_154840 ) ( not ( = ?auto_154839 ?auto_154837 ) ) ( not ( = ?auto_154839 ?auto_154840 ) ) ( not ( = ?auto_154839 ?auto_154838 ) ) ( not ( = ?auto_154839 ?auto_154836 ) ) ( not ( = ?auto_154839 ?auto_154835 ) ) ( not ( = ?auto_154837 ?auto_154840 ) ) ( not ( = ?auto_154837 ?auto_154838 ) ) ( not ( = ?auto_154837 ?auto_154836 ) ) ( not ( = ?auto_154837 ?auto_154835 ) ) ( not ( = ?auto_154840 ?auto_154838 ) ) ( not ( = ?auto_154840 ?auto_154836 ) ) ( not ( = ?auto_154840 ?auto_154835 ) ) ( not ( = ?auto_154832 ?auto_154839 ) ) ( not ( = ?auto_154832 ?auto_154837 ) ) ( not ( = ?auto_154832 ?auto_154840 ) ) ( not ( = ?auto_154833 ?auto_154839 ) ) ( not ( = ?auto_154833 ?auto_154837 ) ) ( not ( = ?auto_154833 ?auto_154840 ) ) ( not ( = ?auto_154834 ?auto_154839 ) ) ( not ( = ?auto_154834 ?auto_154837 ) ) ( not ( = ?auto_154834 ?auto_154840 ) ) ( ON ?auto_154834 ?auto_154835 ) ( ON ?auto_154833 ?auto_154834 ) ( ON ?auto_154832 ?auto_154833 ) ( CLEAR ?auto_154832 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_154839 ?auto_154837 ?auto_154840 ?auto_154838 ?auto_154836 ?auto_154835 ?auto_154834 ?auto_154833 )
      ( MAKE-5PILE ?auto_154832 ?auto_154833 ?auto_154834 ?auto_154835 ?auto_154836 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_154844 - BLOCK
      ?auto_154845 - BLOCK
      ?auto_154846 - BLOCK
    )
    :vars
    (
      ?auto_154847 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_154847 ?auto_154846 ) ( CLEAR ?auto_154847 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_154844 ) ( ON ?auto_154845 ?auto_154844 ) ( ON ?auto_154846 ?auto_154845 ) ( not ( = ?auto_154844 ?auto_154845 ) ) ( not ( = ?auto_154844 ?auto_154846 ) ) ( not ( = ?auto_154844 ?auto_154847 ) ) ( not ( = ?auto_154845 ?auto_154846 ) ) ( not ( = ?auto_154845 ?auto_154847 ) ) ( not ( = ?auto_154846 ?auto_154847 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_154847 ?auto_154846 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_154848 - BLOCK
      ?auto_154849 - BLOCK
      ?auto_154850 - BLOCK
    )
    :vars
    (
      ?auto_154851 - BLOCK
      ?auto_154852 - BLOCK
      ?auto_154853 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_154851 ?auto_154850 ) ( CLEAR ?auto_154851 ) ( ON-TABLE ?auto_154848 ) ( ON ?auto_154849 ?auto_154848 ) ( ON ?auto_154850 ?auto_154849 ) ( not ( = ?auto_154848 ?auto_154849 ) ) ( not ( = ?auto_154848 ?auto_154850 ) ) ( not ( = ?auto_154848 ?auto_154851 ) ) ( not ( = ?auto_154849 ?auto_154850 ) ) ( not ( = ?auto_154849 ?auto_154851 ) ) ( not ( = ?auto_154850 ?auto_154851 ) ) ( HOLDING ?auto_154852 ) ( CLEAR ?auto_154853 ) ( not ( = ?auto_154848 ?auto_154852 ) ) ( not ( = ?auto_154848 ?auto_154853 ) ) ( not ( = ?auto_154849 ?auto_154852 ) ) ( not ( = ?auto_154849 ?auto_154853 ) ) ( not ( = ?auto_154850 ?auto_154852 ) ) ( not ( = ?auto_154850 ?auto_154853 ) ) ( not ( = ?auto_154851 ?auto_154852 ) ) ( not ( = ?auto_154851 ?auto_154853 ) ) ( not ( = ?auto_154852 ?auto_154853 ) ) )
    :subtasks
    ( ( !STACK ?auto_154852 ?auto_154853 )
      ( MAKE-3PILE ?auto_154848 ?auto_154849 ?auto_154850 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_154854 - BLOCK
      ?auto_154855 - BLOCK
      ?auto_154856 - BLOCK
    )
    :vars
    (
      ?auto_154858 - BLOCK
      ?auto_154859 - BLOCK
      ?auto_154857 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_154858 ?auto_154856 ) ( ON-TABLE ?auto_154854 ) ( ON ?auto_154855 ?auto_154854 ) ( ON ?auto_154856 ?auto_154855 ) ( not ( = ?auto_154854 ?auto_154855 ) ) ( not ( = ?auto_154854 ?auto_154856 ) ) ( not ( = ?auto_154854 ?auto_154858 ) ) ( not ( = ?auto_154855 ?auto_154856 ) ) ( not ( = ?auto_154855 ?auto_154858 ) ) ( not ( = ?auto_154856 ?auto_154858 ) ) ( CLEAR ?auto_154859 ) ( not ( = ?auto_154854 ?auto_154857 ) ) ( not ( = ?auto_154854 ?auto_154859 ) ) ( not ( = ?auto_154855 ?auto_154857 ) ) ( not ( = ?auto_154855 ?auto_154859 ) ) ( not ( = ?auto_154856 ?auto_154857 ) ) ( not ( = ?auto_154856 ?auto_154859 ) ) ( not ( = ?auto_154858 ?auto_154857 ) ) ( not ( = ?auto_154858 ?auto_154859 ) ) ( not ( = ?auto_154857 ?auto_154859 ) ) ( ON ?auto_154857 ?auto_154858 ) ( CLEAR ?auto_154857 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_154854 ?auto_154855 ?auto_154856 ?auto_154858 )
      ( MAKE-3PILE ?auto_154854 ?auto_154855 ?auto_154856 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_154860 - BLOCK
      ?auto_154861 - BLOCK
      ?auto_154862 - BLOCK
    )
    :vars
    (
      ?auto_154863 - BLOCK
      ?auto_154864 - BLOCK
      ?auto_154865 - BLOCK
      ?auto_154867 - BLOCK
      ?auto_154868 - BLOCK
      ?auto_154866 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_154863 ?auto_154862 ) ( ON-TABLE ?auto_154860 ) ( ON ?auto_154861 ?auto_154860 ) ( ON ?auto_154862 ?auto_154861 ) ( not ( = ?auto_154860 ?auto_154861 ) ) ( not ( = ?auto_154860 ?auto_154862 ) ) ( not ( = ?auto_154860 ?auto_154863 ) ) ( not ( = ?auto_154861 ?auto_154862 ) ) ( not ( = ?auto_154861 ?auto_154863 ) ) ( not ( = ?auto_154862 ?auto_154863 ) ) ( not ( = ?auto_154860 ?auto_154864 ) ) ( not ( = ?auto_154860 ?auto_154865 ) ) ( not ( = ?auto_154861 ?auto_154864 ) ) ( not ( = ?auto_154861 ?auto_154865 ) ) ( not ( = ?auto_154862 ?auto_154864 ) ) ( not ( = ?auto_154862 ?auto_154865 ) ) ( not ( = ?auto_154863 ?auto_154864 ) ) ( not ( = ?auto_154863 ?auto_154865 ) ) ( not ( = ?auto_154864 ?auto_154865 ) ) ( ON ?auto_154864 ?auto_154863 ) ( CLEAR ?auto_154864 ) ( HOLDING ?auto_154865 ) ( CLEAR ?auto_154867 ) ( ON-TABLE ?auto_154868 ) ( ON ?auto_154866 ?auto_154868 ) ( ON ?auto_154867 ?auto_154866 ) ( not ( = ?auto_154868 ?auto_154866 ) ) ( not ( = ?auto_154868 ?auto_154867 ) ) ( not ( = ?auto_154868 ?auto_154865 ) ) ( not ( = ?auto_154866 ?auto_154867 ) ) ( not ( = ?auto_154866 ?auto_154865 ) ) ( not ( = ?auto_154867 ?auto_154865 ) ) ( not ( = ?auto_154860 ?auto_154867 ) ) ( not ( = ?auto_154860 ?auto_154868 ) ) ( not ( = ?auto_154860 ?auto_154866 ) ) ( not ( = ?auto_154861 ?auto_154867 ) ) ( not ( = ?auto_154861 ?auto_154868 ) ) ( not ( = ?auto_154861 ?auto_154866 ) ) ( not ( = ?auto_154862 ?auto_154867 ) ) ( not ( = ?auto_154862 ?auto_154868 ) ) ( not ( = ?auto_154862 ?auto_154866 ) ) ( not ( = ?auto_154863 ?auto_154867 ) ) ( not ( = ?auto_154863 ?auto_154868 ) ) ( not ( = ?auto_154863 ?auto_154866 ) ) ( not ( = ?auto_154864 ?auto_154867 ) ) ( not ( = ?auto_154864 ?auto_154868 ) ) ( not ( = ?auto_154864 ?auto_154866 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_154868 ?auto_154866 ?auto_154867 ?auto_154865 )
      ( MAKE-3PILE ?auto_154860 ?auto_154861 ?auto_154862 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_154869 - BLOCK
      ?auto_154870 - BLOCK
      ?auto_154871 - BLOCK
    )
    :vars
    (
      ?auto_154875 - BLOCK
      ?auto_154877 - BLOCK
      ?auto_154872 - BLOCK
      ?auto_154873 - BLOCK
      ?auto_154874 - BLOCK
      ?auto_154876 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_154875 ?auto_154871 ) ( ON-TABLE ?auto_154869 ) ( ON ?auto_154870 ?auto_154869 ) ( ON ?auto_154871 ?auto_154870 ) ( not ( = ?auto_154869 ?auto_154870 ) ) ( not ( = ?auto_154869 ?auto_154871 ) ) ( not ( = ?auto_154869 ?auto_154875 ) ) ( not ( = ?auto_154870 ?auto_154871 ) ) ( not ( = ?auto_154870 ?auto_154875 ) ) ( not ( = ?auto_154871 ?auto_154875 ) ) ( not ( = ?auto_154869 ?auto_154877 ) ) ( not ( = ?auto_154869 ?auto_154872 ) ) ( not ( = ?auto_154870 ?auto_154877 ) ) ( not ( = ?auto_154870 ?auto_154872 ) ) ( not ( = ?auto_154871 ?auto_154877 ) ) ( not ( = ?auto_154871 ?auto_154872 ) ) ( not ( = ?auto_154875 ?auto_154877 ) ) ( not ( = ?auto_154875 ?auto_154872 ) ) ( not ( = ?auto_154877 ?auto_154872 ) ) ( ON ?auto_154877 ?auto_154875 ) ( CLEAR ?auto_154873 ) ( ON-TABLE ?auto_154874 ) ( ON ?auto_154876 ?auto_154874 ) ( ON ?auto_154873 ?auto_154876 ) ( not ( = ?auto_154874 ?auto_154876 ) ) ( not ( = ?auto_154874 ?auto_154873 ) ) ( not ( = ?auto_154874 ?auto_154872 ) ) ( not ( = ?auto_154876 ?auto_154873 ) ) ( not ( = ?auto_154876 ?auto_154872 ) ) ( not ( = ?auto_154873 ?auto_154872 ) ) ( not ( = ?auto_154869 ?auto_154873 ) ) ( not ( = ?auto_154869 ?auto_154874 ) ) ( not ( = ?auto_154869 ?auto_154876 ) ) ( not ( = ?auto_154870 ?auto_154873 ) ) ( not ( = ?auto_154870 ?auto_154874 ) ) ( not ( = ?auto_154870 ?auto_154876 ) ) ( not ( = ?auto_154871 ?auto_154873 ) ) ( not ( = ?auto_154871 ?auto_154874 ) ) ( not ( = ?auto_154871 ?auto_154876 ) ) ( not ( = ?auto_154875 ?auto_154873 ) ) ( not ( = ?auto_154875 ?auto_154874 ) ) ( not ( = ?auto_154875 ?auto_154876 ) ) ( not ( = ?auto_154877 ?auto_154873 ) ) ( not ( = ?auto_154877 ?auto_154874 ) ) ( not ( = ?auto_154877 ?auto_154876 ) ) ( ON ?auto_154872 ?auto_154877 ) ( CLEAR ?auto_154872 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_154869 ?auto_154870 ?auto_154871 ?auto_154875 ?auto_154877 )
      ( MAKE-3PILE ?auto_154869 ?auto_154870 ?auto_154871 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_154878 - BLOCK
      ?auto_154879 - BLOCK
      ?auto_154880 - BLOCK
    )
    :vars
    (
      ?auto_154886 - BLOCK
      ?auto_154885 - BLOCK
      ?auto_154883 - BLOCK
      ?auto_154882 - BLOCK
      ?auto_154881 - BLOCK
      ?auto_154884 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_154886 ?auto_154880 ) ( ON-TABLE ?auto_154878 ) ( ON ?auto_154879 ?auto_154878 ) ( ON ?auto_154880 ?auto_154879 ) ( not ( = ?auto_154878 ?auto_154879 ) ) ( not ( = ?auto_154878 ?auto_154880 ) ) ( not ( = ?auto_154878 ?auto_154886 ) ) ( not ( = ?auto_154879 ?auto_154880 ) ) ( not ( = ?auto_154879 ?auto_154886 ) ) ( not ( = ?auto_154880 ?auto_154886 ) ) ( not ( = ?auto_154878 ?auto_154885 ) ) ( not ( = ?auto_154878 ?auto_154883 ) ) ( not ( = ?auto_154879 ?auto_154885 ) ) ( not ( = ?auto_154879 ?auto_154883 ) ) ( not ( = ?auto_154880 ?auto_154885 ) ) ( not ( = ?auto_154880 ?auto_154883 ) ) ( not ( = ?auto_154886 ?auto_154885 ) ) ( not ( = ?auto_154886 ?auto_154883 ) ) ( not ( = ?auto_154885 ?auto_154883 ) ) ( ON ?auto_154885 ?auto_154886 ) ( ON-TABLE ?auto_154882 ) ( ON ?auto_154881 ?auto_154882 ) ( not ( = ?auto_154882 ?auto_154881 ) ) ( not ( = ?auto_154882 ?auto_154884 ) ) ( not ( = ?auto_154882 ?auto_154883 ) ) ( not ( = ?auto_154881 ?auto_154884 ) ) ( not ( = ?auto_154881 ?auto_154883 ) ) ( not ( = ?auto_154884 ?auto_154883 ) ) ( not ( = ?auto_154878 ?auto_154884 ) ) ( not ( = ?auto_154878 ?auto_154882 ) ) ( not ( = ?auto_154878 ?auto_154881 ) ) ( not ( = ?auto_154879 ?auto_154884 ) ) ( not ( = ?auto_154879 ?auto_154882 ) ) ( not ( = ?auto_154879 ?auto_154881 ) ) ( not ( = ?auto_154880 ?auto_154884 ) ) ( not ( = ?auto_154880 ?auto_154882 ) ) ( not ( = ?auto_154880 ?auto_154881 ) ) ( not ( = ?auto_154886 ?auto_154884 ) ) ( not ( = ?auto_154886 ?auto_154882 ) ) ( not ( = ?auto_154886 ?auto_154881 ) ) ( not ( = ?auto_154885 ?auto_154884 ) ) ( not ( = ?auto_154885 ?auto_154882 ) ) ( not ( = ?auto_154885 ?auto_154881 ) ) ( ON ?auto_154883 ?auto_154885 ) ( CLEAR ?auto_154883 ) ( HOLDING ?auto_154884 ) ( CLEAR ?auto_154881 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_154882 ?auto_154881 ?auto_154884 )
      ( MAKE-3PILE ?auto_154878 ?auto_154879 ?auto_154880 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_154887 - BLOCK
      ?auto_154888 - BLOCK
      ?auto_154889 - BLOCK
    )
    :vars
    (
      ?auto_154895 - BLOCK
      ?auto_154893 - BLOCK
      ?auto_154891 - BLOCK
      ?auto_154890 - BLOCK
      ?auto_154894 - BLOCK
      ?auto_154892 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_154895 ?auto_154889 ) ( ON-TABLE ?auto_154887 ) ( ON ?auto_154888 ?auto_154887 ) ( ON ?auto_154889 ?auto_154888 ) ( not ( = ?auto_154887 ?auto_154888 ) ) ( not ( = ?auto_154887 ?auto_154889 ) ) ( not ( = ?auto_154887 ?auto_154895 ) ) ( not ( = ?auto_154888 ?auto_154889 ) ) ( not ( = ?auto_154888 ?auto_154895 ) ) ( not ( = ?auto_154889 ?auto_154895 ) ) ( not ( = ?auto_154887 ?auto_154893 ) ) ( not ( = ?auto_154887 ?auto_154891 ) ) ( not ( = ?auto_154888 ?auto_154893 ) ) ( not ( = ?auto_154888 ?auto_154891 ) ) ( not ( = ?auto_154889 ?auto_154893 ) ) ( not ( = ?auto_154889 ?auto_154891 ) ) ( not ( = ?auto_154895 ?auto_154893 ) ) ( not ( = ?auto_154895 ?auto_154891 ) ) ( not ( = ?auto_154893 ?auto_154891 ) ) ( ON ?auto_154893 ?auto_154895 ) ( ON-TABLE ?auto_154890 ) ( ON ?auto_154894 ?auto_154890 ) ( not ( = ?auto_154890 ?auto_154894 ) ) ( not ( = ?auto_154890 ?auto_154892 ) ) ( not ( = ?auto_154890 ?auto_154891 ) ) ( not ( = ?auto_154894 ?auto_154892 ) ) ( not ( = ?auto_154894 ?auto_154891 ) ) ( not ( = ?auto_154892 ?auto_154891 ) ) ( not ( = ?auto_154887 ?auto_154892 ) ) ( not ( = ?auto_154887 ?auto_154890 ) ) ( not ( = ?auto_154887 ?auto_154894 ) ) ( not ( = ?auto_154888 ?auto_154892 ) ) ( not ( = ?auto_154888 ?auto_154890 ) ) ( not ( = ?auto_154888 ?auto_154894 ) ) ( not ( = ?auto_154889 ?auto_154892 ) ) ( not ( = ?auto_154889 ?auto_154890 ) ) ( not ( = ?auto_154889 ?auto_154894 ) ) ( not ( = ?auto_154895 ?auto_154892 ) ) ( not ( = ?auto_154895 ?auto_154890 ) ) ( not ( = ?auto_154895 ?auto_154894 ) ) ( not ( = ?auto_154893 ?auto_154892 ) ) ( not ( = ?auto_154893 ?auto_154890 ) ) ( not ( = ?auto_154893 ?auto_154894 ) ) ( ON ?auto_154891 ?auto_154893 ) ( CLEAR ?auto_154894 ) ( ON ?auto_154892 ?auto_154891 ) ( CLEAR ?auto_154892 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_154887 ?auto_154888 ?auto_154889 ?auto_154895 ?auto_154893 ?auto_154891 )
      ( MAKE-3PILE ?auto_154887 ?auto_154888 ?auto_154889 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_154896 - BLOCK
      ?auto_154897 - BLOCK
      ?auto_154898 - BLOCK
    )
    :vars
    (
      ?auto_154900 - BLOCK
      ?auto_154899 - BLOCK
      ?auto_154903 - BLOCK
      ?auto_154904 - BLOCK
      ?auto_154902 - BLOCK
      ?auto_154901 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_154900 ?auto_154898 ) ( ON-TABLE ?auto_154896 ) ( ON ?auto_154897 ?auto_154896 ) ( ON ?auto_154898 ?auto_154897 ) ( not ( = ?auto_154896 ?auto_154897 ) ) ( not ( = ?auto_154896 ?auto_154898 ) ) ( not ( = ?auto_154896 ?auto_154900 ) ) ( not ( = ?auto_154897 ?auto_154898 ) ) ( not ( = ?auto_154897 ?auto_154900 ) ) ( not ( = ?auto_154898 ?auto_154900 ) ) ( not ( = ?auto_154896 ?auto_154899 ) ) ( not ( = ?auto_154896 ?auto_154903 ) ) ( not ( = ?auto_154897 ?auto_154899 ) ) ( not ( = ?auto_154897 ?auto_154903 ) ) ( not ( = ?auto_154898 ?auto_154899 ) ) ( not ( = ?auto_154898 ?auto_154903 ) ) ( not ( = ?auto_154900 ?auto_154899 ) ) ( not ( = ?auto_154900 ?auto_154903 ) ) ( not ( = ?auto_154899 ?auto_154903 ) ) ( ON ?auto_154899 ?auto_154900 ) ( ON-TABLE ?auto_154904 ) ( not ( = ?auto_154904 ?auto_154902 ) ) ( not ( = ?auto_154904 ?auto_154901 ) ) ( not ( = ?auto_154904 ?auto_154903 ) ) ( not ( = ?auto_154902 ?auto_154901 ) ) ( not ( = ?auto_154902 ?auto_154903 ) ) ( not ( = ?auto_154901 ?auto_154903 ) ) ( not ( = ?auto_154896 ?auto_154901 ) ) ( not ( = ?auto_154896 ?auto_154904 ) ) ( not ( = ?auto_154896 ?auto_154902 ) ) ( not ( = ?auto_154897 ?auto_154901 ) ) ( not ( = ?auto_154897 ?auto_154904 ) ) ( not ( = ?auto_154897 ?auto_154902 ) ) ( not ( = ?auto_154898 ?auto_154901 ) ) ( not ( = ?auto_154898 ?auto_154904 ) ) ( not ( = ?auto_154898 ?auto_154902 ) ) ( not ( = ?auto_154900 ?auto_154901 ) ) ( not ( = ?auto_154900 ?auto_154904 ) ) ( not ( = ?auto_154900 ?auto_154902 ) ) ( not ( = ?auto_154899 ?auto_154901 ) ) ( not ( = ?auto_154899 ?auto_154904 ) ) ( not ( = ?auto_154899 ?auto_154902 ) ) ( ON ?auto_154903 ?auto_154899 ) ( ON ?auto_154901 ?auto_154903 ) ( CLEAR ?auto_154901 ) ( HOLDING ?auto_154902 ) ( CLEAR ?auto_154904 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_154904 ?auto_154902 )
      ( MAKE-3PILE ?auto_154896 ?auto_154897 ?auto_154898 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_156763 - BLOCK
      ?auto_156764 - BLOCK
      ?auto_156765 - BLOCK
    )
    :vars
    (
      ?auto_156768 - BLOCK
      ?auto_156769 - BLOCK
      ?auto_156770 - BLOCK
      ?auto_156767 - BLOCK
      ?auto_156766 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_156768 ?auto_156765 ) ( ON-TABLE ?auto_156763 ) ( ON ?auto_156764 ?auto_156763 ) ( ON ?auto_156765 ?auto_156764 ) ( not ( = ?auto_156763 ?auto_156764 ) ) ( not ( = ?auto_156763 ?auto_156765 ) ) ( not ( = ?auto_156763 ?auto_156768 ) ) ( not ( = ?auto_156764 ?auto_156765 ) ) ( not ( = ?auto_156764 ?auto_156768 ) ) ( not ( = ?auto_156765 ?auto_156768 ) ) ( not ( = ?auto_156763 ?auto_156769 ) ) ( not ( = ?auto_156763 ?auto_156770 ) ) ( not ( = ?auto_156764 ?auto_156769 ) ) ( not ( = ?auto_156764 ?auto_156770 ) ) ( not ( = ?auto_156765 ?auto_156769 ) ) ( not ( = ?auto_156765 ?auto_156770 ) ) ( not ( = ?auto_156768 ?auto_156769 ) ) ( not ( = ?auto_156768 ?auto_156770 ) ) ( not ( = ?auto_156769 ?auto_156770 ) ) ( ON ?auto_156769 ?auto_156768 ) ( not ( = ?auto_156767 ?auto_156766 ) ) ( not ( = ?auto_156767 ?auto_156770 ) ) ( not ( = ?auto_156766 ?auto_156770 ) ) ( not ( = ?auto_156763 ?auto_156766 ) ) ( not ( = ?auto_156763 ?auto_156767 ) ) ( not ( = ?auto_156764 ?auto_156766 ) ) ( not ( = ?auto_156764 ?auto_156767 ) ) ( not ( = ?auto_156765 ?auto_156766 ) ) ( not ( = ?auto_156765 ?auto_156767 ) ) ( not ( = ?auto_156768 ?auto_156766 ) ) ( not ( = ?auto_156768 ?auto_156767 ) ) ( not ( = ?auto_156769 ?auto_156766 ) ) ( not ( = ?auto_156769 ?auto_156767 ) ) ( ON ?auto_156770 ?auto_156769 ) ( ON ?auto_156766 ?auto_156770 ) ( ON ?auto_156767 ?auto_156766 ) ( CLEAR ?auto_156767 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_156763 ?auto_156764 ?auto_156765 ?auto_156768 ?auto_156769 ?auto_156770 ?auto_156766 )
      ( MAKE-3PILE ?auto_156763 ?auto_156764 ?auto_156765 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_154914 - BLOCK
      ?auto_154915 - BLOCK
      ?auto_154916 - BLOCK
    )
    :vars
    (
      ?auto_154917 - BLOCK
      ?auto_154919 - BLOCK
      ?auto_154921 - BLOCK
      ?auto_154922 - BLOCK
      ?auto_154920 - BLOCK
      ?auto_154918 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_154917 ?auto_154916 ) ( ON-TABLE ?auto_154914 ) ( ON ?auto_154915 ?auto_154914 ) ( ON ?auto_154916 ?auto_154915 ) ( not ( = ?auto_154914 ?auto_154915 ) ) ( not ( = ?auto_154914 ?auto_154916 ) ) ( not ( = ?auto_154914 ?auto_154917 ) ) ( not ( = ?auto_154915 ?auto_154916 ) ) ( not ( = ?auto_154915 ?auto_154917 ) ) ( not ( = ?auto_154916 ?auto_154917 ) ) ( not ( = ?auto_154914 ?auto_154919 ) ) ( not ( = ?auto_154914 ?auto_154921 ) ) ( not ( = ?auto_154915 ?auto_154919 ) ) ( not ( = ?auto_154915 ?auto_154921 ) ) ( not ( = ?auto_154916 ?auto_154919 ) ) ( not ( = ?auto_154916 ?auto_154921 ) ) ( not ( = ?auto_154917 ?auto_154919 ) ) ( not ( = ?auto_154917 ?auto_154921 ) ) ( not ( = ?auto_154919 ?auto_154921 ) ) ( ON ?auto_154919 ?auto_154917 ) ( not ( = ?auto_154922 ?auto_154920 ) ) ( not ( = ?auto_154922 ?auto_154918 ) ) ( not ( = ?auto_154922 ?auto_154921 ) ) ( not ( = ?auto_154920 ?auto_154918 ) ) ( not ( = ?auto_154920 ?auto_154921 ) ) ( not ( = ?auto_154918 ?auto_154921 ) ) ( not ( = ?auto_154914 ?auto_154918 ) ) ( not ( = ?auto_154914 ?auto_154922 ) ) ( not ( = ?auto_154914 ?auto_154920 ) ) ( not ( = ?auto_154915 ?auto_154918 ) ) ( not ( = ?auto_154915 ?auto_154922 ) ) ( not ( = ?auto_154915 ?auto_154920 ) ) ( not ( = ?auto_154916 ?auto_154918 ) ) ( not ( = ?auto_154916 ?auto_154922 ) ) ( not ( = ?auto_154916 ?auto_154920 ) ) ( not ( = ?auto_154917 ?auto_154918 ) ) ( not ( = ?auto_154917 ?auto_154922 ) ) ( not ( = ?auto_154917 ?auto_154920 ) ) ( not ( = ?auto_154919 ?auto_154918 ) ) ( not ( = ?auto_154919 ?auto_154922 ) ) ( not ( = ?auto_154919 ?auto_154920 ) ) ( ON ?auto_154921 ?auto_154919 ) ( ON ?auto_154918 ?auto_154921 ) ( ON ?auto_154920 ?auto_154918 ) ( CLEAR ?auto_154920 ) ( HOLDING ?auto_154922 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_154922 )
      ( MAKE-3PILE ?auto_154914 ?auto_154915 ?auto_154916 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_154923 - BLOCK
      ?auto_154924 - BLOCK
      ?auto_154925 - BLOCK
    )
    :vars
    (
      ?auto_154929 - BLOCK
      ?auto_154928 - BLOCK
      ?auto_154926 - BLOCK
      ?auto_154927 - BLOCK
      ?auto_154931 - BLOCK
      ?auto_154930 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_154929 ?auto_154925 ) ( ON-TABLE ?auto_154923 ) ( ON ?auto_154924 ?auto_154923 ) ( ON ?auto_154925 ?auto_154924 ) ( not ( = ?auto_154923 ?auto_154924 ) ) ( not ( = ?auto_154923 ?auto_154925 ) ) ( not ( = ?auto_154923 ?auto_154929 ) ) ( not ( = ?auto_154924 ?auto_154925 ) ) ( not ( = ?auto_154924 ?auto_154929 ) ) ( not ( = ?auto_154925 ?auto_154929 ) ) ( not ( = ?auto_154923 ?auto_154928 ) ) ( not ( = ?auto_154923 ?auto_154926 ) ) ( not ( = ?auto_154924 ?auto_154928 ) ) ( not ( = ?auto_154924 ?auto_154926 ) ) ( not ( = ?auto_154925 ?auto_154928 ) ) ( not ( = ?auto_154925 ?auto_154926 ) ) ( not ( = ?auto_154929 ?auto_154928 ) ) ( not ( = ?auto_154929 ?auto_154926 ) ) ( not ( = ?auto_154928 ?auto_154926 ) ) ( ON ?auto_154928 ?auto_154929 ) ( not ( = ?auto_154927 ?auto_154931 ) ) ( not ( = ?auto_154927 ?auto_154930 ) ) ( not ( = ?auto_154927 ?auto_154926 ) ) ( not ( = ?auto_154931 ?auto_154930 ) ) ( not ( = ?auto_154931 ?auto_154926 ) ) ( not ( = ?auto_154930 ?auto_154926 ) ) ( not ( = ?auto_154923 ?auto_154930 ) ) ( not ( = ?auto_154923 ?auto_154927 ) ) ( not ( = ?auto_154923 ?auto_154931 ) ) ( not ( = ?auto_154924 ?auto_154930 ) ) ( not ( = ?auto_154924 ?auto_154927 ) ) ( not ( = ?auto_154924 ?auto_154931 ) ) ( not ( = ?auto_154925 ?auto_154930 ) ) ( not ( = ?auto_154925 ?auto_154927 ) ) ( not ( = ?auto_154925 ?auto_154931 ) ) ( not ( = ?auto_154929 ?auto_154930 ) ) ( not ( = ?auto_154929 ?auto_154927 ) ) ( not ( = ?auto_154929 ?auto_154931 ) ) ( not ( = ?auto_154928 ?auto_154930 ) ) ( not ( = ?auto_154928 ?auto_154927 ) ) ( not ( = ?auto_154928 ?auto_154931 ) ) ( ON ?auto_154926 ?auto_154928 ) ( ON ?auto_154930 ?auto_154926 ) ( ON ?auto_154931 ?auto_154930 ) ( ON ?auto_154927 ?auto_154931 ) ( CLEAR ?auto_154927 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_154923 ?auto_154924 ?auto_154925 ?auto_154929 ?auto_154928 ?auto_154926 ?auto_154930 ?auto_154931 )
      ( MAKE-3PILE ?auto_154923 ?auto_154924 ?auto_154925 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_154938 - BLOCK
      ?auto_154939 - BLOCK
      ?auto_154940 - BLOCK
      ?auto_154941 - BLOCK
      ?auto_154942 - BLOCK
      ?auto_154943 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_154943 ) ( CLEAR ?auto_154942 ) ( ON-TABLE ?auto_154938 ) ( ON ?auto_154939 ?auto_154938 ) ( ON ?auto_154940 ?auto_154939 ) ( ON ?auto_154941 ?auto_154940 ) ( ON ?auto_154942 ?auto_154941 ) ( not ( = ?auto_154938 ?auto_154939 ) ) ( not ( = ?auto_154938 ?auto_154940 ) ) ( not ( = ?auto_154938 ?auto_154941 ) ) ( not ( = ?auto_154938 ?auto_154942 ) ) ( not ( = ?auto_154938 ?auto_154943 ) ) ( not ( = ?auto_154939 ?auto_154940 ) ) ( not ( = ?auto_154939 ?auto_154941 ) ) ( not ( = ?auto_154939 ?auto_154942 ) ) ( not ( = ?auto_154939 ?auto_154943 ) ) ( not ( = ?auto_154940 ?auto_154941 ) ) ( not ( = ?auto_154940 ?auto_154942 ) ) ( not ( = ?auto_154940 ?auto_154943 ) ) ( not ( = ?auto_154941 ?auto_154942 ) ) ( not ( = ?auto_154941 ?auto_154943 ) ) ( not ( = ?auto_154942 ?auto_154943 ) ) )
    :subtasks
    ( ( !STACK ?auto_154943 ?auto_154942 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_154944 - BLOCK
      ?auto_154945 - BLOCK
      ?auto_154946 - BLOCK
      ?auto_154947 - BLOCK
      ?auto_154948 - BLOCK
      ?auto_154949 - BLOCK
    )
    :vars
    (
      ?auto_154950 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_154948 ) ( ON-TABLE ?auto_154944 ) ( ON ?auto_154945 ?auto_154944 ) ( ON ?auto_154946 ?auto_154945 ) ( ON ?auto_154947 ?auto_154946 ) ( ON ?auto_154948 ?auto_154947 ) ( not ( = ?auto_154944 ?auto_154945 ) ) ( not ( = ?auto_154944 ?auto_154946 ) ) ( not ( = ?auto_154944 ?auto_154947 ) ) ( not ( = ?auto_154944 ?auto_154948 ) ) ( not ( = ?auto_154944 ?auto_154949 ) ) ( not ( = ?auto_154945 ?auto_154946 ) ) ( not ( = ?auto_154945 ?auto_154947 ) ) ( not ( = ?auto_154945 ?auto_154948 ) ) ( not ( = ?auto_154945 ?auto_154949 ) ) ( not ( = ?auto_154946 ?auto_154947 ) ) ( not ( = ?auto_154946 ?auto_154948 ) ) ( not ( = ?auto_154946 ?auto_154949 ) ) ( not ( = ?auto_154947 ?auto_154948 ) ) ( not ( = ?auto_154947 ?auto_154949 ) ) ( not ( = ?auto_154948 ?auto_154949 ) ) ( ON ?auto_154949 ?auto_154950 ) ( CLEAR ?auto_154949 ) ( HAND-EMPTY ) ( not ( = ?auto_154944 ?auto_154950 ) ) ( not ( = ?auto_154945 ?auto_154950 ) ) ( not ( = ?auto_154946 ?auto_154950 ) ) ( not ( = ?auto_154947 ?auto_154950 ) ) ( not ( = ?auto_154948 ?auto_154950 ) ) ( not ( = ?auto_154949 ?auto_154950 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_154949 ?auto_154950 )
      ( MAKE-6PILE ?auto_154944 ?auto_154945 ?auto_154946 ?auto_154947 ?auto_154948 ?auto_154949 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_154951 - BLOCK
      ?auto_154952 - BLOCK
      ?auto_154953 - BLOCK
      ?auto_154954 - BLOCK
      ?auto_154955 - BLOCK
      ?auto_154956 - BLOCK
    )
    :vars
    (
      ?auto_154957 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_154951 ) ( ON ?auto_154952 ?auto_154951 ) ( ON ?auto_154953 ?auto_154952 ) ( ON ?auto_154954 ?auto_154953 ) ( not ( = ?auto_154951 ?auto_154952 ) ) ( not ( = ?auto_154951 ?auto_154953 ) ) ( not ( = ?auto_154951 ?auto_154954 ) ) ( not ( = ?auto_154951 ?auto_154955 ) ) ( not ( = ?auto_154951 ?auto_154956 ) ) ( not ( = ?auto_154952 ?auto_154953 ) ) ( not ( = ?auto_154952 ?auto_154954 ) ) ( not ( = ?auto_154952 ?auto_154955 ) ) ( not ( = ?auto_154952 ?auto_154956 ) ) ( not ( = ?auto_154953 ?auto_154954 ) ) ( not ( = ?auto_154953 ?auto_154955 ) ) ( not ( = ?auto_154953 ?auto_154956 ) ) ( not ( = ?auto_154954 ?auto_154955 ) ) ( not ( = ?auto_154954 ?auto_154956 ) ) ( not ( = ?auto_154955 ?auto_154956 ) ) ( ON ?auto_154956 ?auto_154957 ) ( CLEAR ?auto_154956 ) ( not ( = ?auto_154951 ?auto_154957 ) ) ( not ( = ?auto_154952 ?auto_154957 ) ) ( not ( = ?auto_154953 ?auto_154957 ) ) ( not ( = ?auto_154954 ?auto_154957 ) ) ( not ( = ?auto_154955 ?auto_154957 ) ) ( not ( = ?auto_154956 ?auto_154957 ) ) ( HOLDING ?auto_154955 ) ( CLEAR ?auto_154954 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_154951 ?auto_154952 ?auto_154953 ?auto_154954 ?auto_154955 )
      ( MAKE-6PILE ?auto_154951 ?auto_154952 ?auto_154953 ?auto_154954 ?auto_154955 ?auto_154956 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_154958 - BLOCK
      ?auto_154959 - BLOCK
      ?auto_154960 - BLOCK
      ?auto_154961 - BLOCK
      ?auto_154962 - BLOCK
      ?auto_154963 - BLOCK
    )
    :vars
    (
      ?auto_154964 - BLOCK
      ?auto_154966 - BLOCK
      ?auto_154965 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_154958 ) ( ON ?auto_154959 ?auto_154958 ) ( ON ?auto_154960 ?auto_154959 ) ( ON ?auto_154961 ?auto_154960 ) ( not ( = ?auto_154958 ?auto_154959 ) ) ( not ( = ?auto_154958 ?auto_154960 ) ) ( not ( = ?auto_154958 ?auto_154961 ) ) ( not ( = ?auto_154958 ?auto_154962 ) ) ( not ( = ?auto_154958 ?auto_154963 ) ) ( not ( = ?auto_154959 ?auto_154960 ) ) ( not ( = ?auto_154959 ?auto_154961 ) ) ( not ( = ?auto_154959 ?auto_154962 ) ) ( not ( = ?auto_154959 ?auto_154963 ) ) ( not ( = ?auto_154960 ?auto_154961 ) ) ( not ( = ?auto_154960 ?auto_154962 ) ) ( not ( = ?auto_154960 ?auto_154963 ) ) ( not ( = ?auto_154961 ?auto_154962 ) ) ( not ( = ?auto_154961 ?auto_154963 ) ) ( not ( = ?auto_154962 ?auto_154963 ) ) ( ON ?auto_154963 ?auto_154964 ) ( not ( = ?auto_154958 ?auto_154964 ) ) ( not ( = ?auto_154959 ?auto_154964 ) ) ( not ( = ?auto_154960 ?auto_154964 ) ) ( not ( = ?auto_154961 ?auto_154964 ) ) ( not ( = ?auto_154962 ?auto_154964 ) ) ( not ( = ?auto_154963 ?auto_154964 ) ) ( CLEAR ?auto_154961 ) ( ON ?auto_154962 ?auto_154963 ) ( CLEAR ?auto_154962 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_154966 ) ( ON ?auto_154965 ?auto_154966 ) ( ON ?auto_154964 ?auto_154965 ) ( not ( = ?auto_154966 ?auto_154965 ) ) ( not ( = ?auto_154966 ?auto_154964 ) ) ( not ( = ?auto_154966 ?auto_154963 ) ) ( not ( = ?auto_154966 ?auto_154962 ) ) ( not ( = ?auto_154965 ?auto_154964 ) ) ( not ( = ?auto_154965 ?auto_154963 ) ) ( not ( = ?auto_154965 ?auto_154962 ) ) ( not ( = ?auto_154958 ?auto_154966 ) ) ( not ( = ?auto_154958 ?auto_154965 ) ) ( not ( = ?auto_154959 ?auto_154966 ) ) ( not ( = ?auto_154959 ?auto_154965 ) ) ( not ( = ?auto_154960 ?auto_154966 ) ) ( not ( = ?auto_154960 ?auto_154965 ) ) ( not ( = ?auto_154961 ?auto_154966 ) ) ( not ( = ?auto_154961 ?auto_154965 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_154966 ?auto_154965 ?auto_154964 ?auto_154963 )
      ( MAKE-6PILE ?auto_154958 ?auto_154959 ?auto_154960 ?auto_154961 ?auto_154962 ?auto_154963 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_154967 - BLOCK
      ?auto_154968 - BLOCK
      ?auto_154969 - BLOCK
      ?auto_154970 - BLOCK
      ?auto_154971 - BLOCK
      ?auto_154972 - BLOCK
    )
    :vars
    (
      ?auto_154975 - BLOCK
      ?auto_154973 - BLOCK
      ?auto_154974 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_154967 ) ( ON ?auto_154968 ?auto_154967 ) ( ON ?auto_154969 ?auto_154968 ) ( not ( = ?auto_154967 ?auto_154968 ) ) ( not ( = ?auto_154967 ?auto_154969 ) ) ( not ( = ?auto_154967 ?auto_154970 ) ) ( not ( = ?auto_154967 ?auto_154971 ) ) ( not ( = ?auto_154967 ?auto_154972 ) ) ( not ( = ?auto_154968 ?auto_154969 ) ) ( not ( = ?auto_154968 ?auto_154970 ) ) ( not ( = ?auto_154968 ?auto_154971 ) ) ( not ( = ?auto_154968 ?auto_154972 ) ) ( not ( = ?auto_154969 ?auto_154970 ) ) ( not ( = ?auto_154969 ?auto_154971 ) ) ( not ( = ?auto_154969 ?auto_154972 ) ) ( not ( = ?auto_154970 ?auto_154971 ) ) ( not ( = ?auto_154970 ?auto_154972 ) ) ( not ( = ?auto_154971 ?auto_154972 ) ) ( ON ?auto_154972 ?auto_154975 ) ( not ( = ?auto_154967 ?auto_154975 ) ) ( not ( = ?auto_154968 ?auto_154975 ) ) ( not ( = ?auto_154969 ?auto_154975 ) ) ( not ( = ?auto_154970 ?auto_154975 ) ) ( not ( = ?auto_154971 ?auto_154975 ) ) ( not ( = ?auto_154972 ?auto_154975 ) ) ( ON ?auto_154971 ?auto_154972 ) ( CLEAR ?auto_154971 ) ( ON-TABLE ?auto_154973 ) ( ON ?auto_154974 ?auto_154973 ) ( ON ?auto_154975 ?auto_154974 ) ( not ( = ?auto_154973 ?auto_154974 ) ) ( not ( = ?auto_154973 ?auto_154975 ) ) ( not ( = ?auto_154973 ?auto_154972 ) ) ( not ( = ?auto_154973 ?auto_154971 ) ) ( not ( = ?auto_154974 ?auto_154975 ) ) ( not ( = ?auto_154974 ?auto_154972 ) ) ( not ( = ?auto_154974 ?auto_154971 ) ) ( not ( = ?auto_154967 ?auto_154973 ) ) ( not ( = ?auto_154967 ?auto_154974 ) ) ( not ( = ?auto_154968 ?auto_154973 ) ) ( not ( = ?auto_154968 ?auto_154974 ) ) ( not ( = ?auto_154969 ?auto_154973 ) ) ( not ( = ?auto_154969 ?auto_154974 ) ) ( not ( = ?auto_154970 ?auto_154973 ) ) ( not ( = ?auto_154970 ?auto_154974 ) ) ( HOLDING ?auto_154970 ) ( CLEAR ?auto_154969 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_154967 ?auto_154968 ?auto_154969 ?auto_154970 )
      ( MAKE-6PILE ?auto_154967 ?auto_154968 ?auto_154969 ?auto_154970 ?auto_154971 ?auto_154972 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_154976 - BLOCK
      ?auto_154977 - BLOCK
      ?auto_154978 - BLOCK
      ?auto_154979 - BLOCK
      ?auto_154980 - BLOCK
      ?auto_154981 - BLOCK
    )
    :vars
    (
      ?auto_154982 - BLOCK
      ?auto_154984 - BLOCK
      ?auto_154983 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_154976 ) ( ON ?auto_154977 ?auto_154976 ) ( ON ?auto_154978 ?auto_154977 ) ( not ( = ?auto_154976 ?auto_154977 ) ) ( not ( = ?auto_154976 ?auto_154978 ) ) ( not ( = ?auto_154976 ?auto_154979 ) ) ( not ( = ?auto_154976 ?auto_154980 ) ) ( not ( = ?auto_154976 ?auto_154981 ) ) ( not ( = ?auto_154977 ?auto_154978 ) ) ( not ( = ?auto_154977 ?auto_154979 ) ) ( not ( = ?auto_154977 ?auto_154980 ) ) ( not ( = ?auto_154977 ?auto_154981 ) ) ( not ( = ?auto_154978 ?auto_154979 ) ) ( not ( = ?auto_154978 ?auto_154980 ) ) ( not ( = ?auto_154978 ?auto_154981 ) ) ( not ( = ?auto_154979 ?auto_154980 ) ) ( not ( = ?auto_154979 ?auto_154981 ) ) ( not ( = ?auto_154980 ?auto_154981 ) ) ( ON ?auto_154981 ?auto_154982 ) ( not ( = ?auto_154976 ?auto_154982 ) ) ( not ( = ?auto_154977 ?auto_154982 ) ) ( not ( = ?auto_154978 ?auto_154982 ) ) ( not ( = ?auto_154979 ?auto_154982 ) ) ( not ( = ?auto_154980 ?auto_154982 ) ) ( not ( = ?auto_154981 ?auto_154982 ) ) ( ON ?auto_154980 ?auto_154981 ) ( ON-TABLE ?auto_154984 ) ( ON ?auto_154983 ?auto_154984 ) ( ON ?auto_154982 ?auto_154983 ) ( not ( = ?auto_154984 ?auto_154983 ) ) ( not ( = ?auto_154984 ?auto_154982 ) ) ( not ( = ?auto_154984 ?auto_154981 ) ) ( not ( = ?auto_154984 ?auto_154980 ) ) ( not ( = ?auto_154983 ?auto_154982 ) ) ( not ( = ?auto_154983 ?auto_154981 ) ) ( not ( = ?auto_154983 ?auto_154980 ) ) ( not ( = ?auto_154976 ?auto_154984 ) ) ( not ( = ?auto_154976 ?auto_154983 ) ) ( not ( = ?auto_154977 ?auto_154984 ) ) ( not ( = ?auto_154977 ?auto_154983 ) ) ( not ( = ?auto_154978 ?auto_154984 ) ) ( not ( = ?auto_154978 ?auto_154983 ) ) ( not ( = ?auto_154979 ?auto_154984 ) ) ( not ( = ?auto_154979 ?auto_154983 ) ) ( CLEAR ?auto_154978 ) ( ON ?auto_154979 ?auto_154980 ) ( CLEAR ?auto_154979 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_154984 ?auto_154983 ?auto_154982 ?auto_154981 ?auto_154980 )
      ( MAKE-6PILE ?auto_154976 ?auto_154977 ?auto_154978 ?auto_154979 ?auto_154980 ?auto_154981 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_154985 - BLOCK
      ?auto_154986 - BLOCK
      ?auto_154987 - BLOCK
      ?auto_154988 - BLOCK
      ?auto_154989 - BLOCK
      ?auto_154990 - BLOCK
    )
    :vars
    (
      ?auto_154993 - BLOCK
      ?auto_154992 - BLOCK
      ?auto_154991 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_154985 ) ( ON ?auto_154986 ?auto_154985 ) ( not ( = ?auto_154985 ?auto_154986 ) ) ( not ( = ?auto_154985 ?auto_154987 ) ) ( not ( = ?auto_154985 ?auto_154988 ) ) ( not ( = ?auto_154985 ?auto_154989 ) ) ( not ( = ?auto_154985 ?auto_154990 ) ) ( not ( = ?auto_154986 ?auto_154987 ) ) ( not ( = ?auto_154986 ?auto_154988 ) ) ( not ( = ?auto_154986 ?auto_154989 ) ) ( not ( = ?auto_154986 ?auto_154990 ) ) ( not ( = ?auto_154987 ?auto_154988 ) ) ( not ( = ?auto_154987 ?auto_154989 ) ) ( not ( = ?auto_154987 ?auto_154990 ) ) ( not ( = ?auto_154988 ?auto_154989 ) ) ( not ( = ?auto_154988 ?auto_154990 ) ) ( not ( = ?auto_154989 ?auto_154990 ) ) ( ON ?auto_154990 ?auto_154993 ) ( not ( = ?auto_154985 ?auto_154993 ) ) ( not ( = ?auto_154986 ?auto_154993 ) ) ( not ( = ?auto_154987 ?auto_154993 ) ) ( not ( = ?auto_154988 ?auto_154993 ) ) ( not ( = ?auto_154989 ?auto_154993 ) ) ( not ( = ?auto_154990 ?auto_154993 ) ) ( ON ?auto_154989 ?auto_154990 ) ( ON-TABLE ?auto_154992 ) ( ON ?auto_154991 ?auto_154992 ) ( ON ?auto_154993 ?auto_154991 ) ( not ( = ?auto_154992 ?auto_154991 ) ) ( not ( = ?auto_154992 ?auto_154993 ) ) ( not ( = ?auto_154992 ?auto_154990 ) ) ( not ( = ?auto_154992 ?auto_154989 ) ) ( not ( = ?auto_154991 ?auto_154993 ) ) ( not ( = ?auto_154991 ?auto_154990 ) ) ( not ( = ?auto_154991 ?auto_154989 ) ) ( not ( = ?auto_154985 ?auto_154992 ) ) ( not ( = ?auto_154985 ?auto_154991 ) ) ( not ( = ?auto_154986 ?auto_154992 ) ) ( not ( = ?auto_154986 ?auto_154991 ) ) ( not ( = ?auto_154987 ?auto_154992 ) ) ( not ( = ?auto_154987 ?auto_154991 ) ) ( not ( = ?auto_154988 ?auto_154992 ) ) ( not ( = ?auto_154988 ?auto_154991 ) ) ( ON ?auto_154988 ?auto_154989 ) ( CLEAR ?auto_154988 ) ( HOLDING ?auto_154987 ) ( CLEAR ?auto_154986 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_154985 ?auto_154986 ?auto_154987 )
      ( MAKE-6PILE ?auto_154985 ?auto_154986 ?auto_154987 ?auto_154988 ?auto_154989 ?auto_154990 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_154994 - BLOCK
      ?auto_154995 - BLOCK
      ?auto_154996 - BLOCK
      ?auto_154997 - BLOCK
      ?auto_154998 - BLOCK
      ?auto_154999 - BLOCK
    )
    :vars
    (
      ?auto_155002 - BLOCK
      ?auto_155000 - BLOCK
      ?auto_155001 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_154994 ) ( ON ?auto_154995 ?auto_154994 ) ( not ( = ?auto_154994 ?auto_154995 ) ) ( not ( = ?auto_154994 ?auto_154996 ) ) ( not ( = ?auto_154994 ?auto_154997 ) ) ( not ( = ?auto_154994 ?auto_154998 ) ) ( not ( = ?auto_154994 ?auto_154999 ) ) ( not ( = ?auto_154995 ?auto_154996 ) ) ( not ( = ?auto_154995 ?auto_154997 ) ) ( not ( = ?auto_154995 ?auto_154998 ) ) ( not ( = ?auto_154995 ?auto_154999 ) ) ( not ( = ?auto_154996 ?auto_154997 ) ) ( not ( = ?auto_154996 ?auto_154998 ) ) ( not ( = ?auto_154996 ?auto_154999 ) ) ( not ( = ?auto_154997 ?auto_154998 ) ) ( not ( = ?auto_154997 ?auto_154999 ) ) ( not ( = ?auto_154998 ?auto_154999 ) ) ( ON ?auto_154999 ?auto_155002 ) ( not ( = ?auto_154994 ?auto_155002 ) ) ( not ( = ?auto_154995 ?auto_155002 ) ) ( not ( = ?auto_154996 ?auto_155002 ) ) ( not ( = ?auto_154997 ?auto_155002 ) ) ( not ( = ?auto_154998 ?auto_155002 ) ) ( not ( = ?auto_154999 ?auto_155002 ) ) ( ON ?auto_154998 ?auto_154999 ) ( ON-TABLE ?auto_155000 ) ( ON ?auto_155001 ?auto_155000 ) ( ON ?auto_155002 ?auto_155001 ) ( not ( = ?auto_155000 ?auto_155001 ) ) ( not ( = ?auto_155000 ?auto_155002 ) ) ( not ( = ?auto_155000 ?auto_154999 ) ) ( not ( = ?auto_155000 ?auto_154998 ) ) ( not ( = ?auto_155001 ?auto_155002 ) ) ( not ( = ?auto_155001 ?auto_154999 ) ) ( not ( = ?auto_155001 ?auto_154998 ) ) ( not ( = ?auto_154994 ?auto_155000 ) ) ( not ( = ?auto_154994 ?auto_155001 ) ) ( not ( = ?auto_154995 ?auto_155000 ) ) ( not ( = ?auto_154995 ?auto_155001 ) ) ( not ( = ?auto_154996 ?auto_155000 ) ) ( not ( = ?auto_154996 ?auto_155001 ) ) ( not ( = ?auto_154997 ?auto_155000 ) ) ( not ( = ?auto_154997 ?auto_155001 ) ) ( ON ?auto_154997 ?auto_154998 ) ( CLEAR ?auto_154995 ) ( ON ?auto_154996 ?auto_154997 ) ( CLEAR ?auto_154996 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_155000 ?auto_155001 ?auto_155002 ?auto_154999 ?auto_154998 ?auto_154997 )
      ( MAKE-6PILE ?auto_154994 ?auto_154995 ?auto_154996 ?auto_154997 ?auto_154998 ?auto_154999 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_155003 - BLOCK
      ?auto_155004 - BLOCK
      ?auto_155005 - BLOCK
      ?auto_155006 - BLOCK
      ?auto_155007 - BLOCK
      ?auto_155008 - BLOCK
    )
    :vars
    (
      ?auto_155009 - BLOCK
      ?auto_155011 - BLOCK
      ?auto_155010 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_155003 ) ( not ( = ?auto_155003 ?auto_155004 ) ) ( not ( = ?auto_155003 ?auto_155005 ) ) ( not ( = ?auto_155003 ?auto_155006 ) ) ( not ( = ?auto_155003 ?auto_155007 ) ) ( not ( = ?auto_155003 ?auto_155008 ) ) ( not ( = ?auto_155004 ?auto_155005 ) ) ( not ( = ?auto_155004 ?auto_155006 ) ) ( not ( = ?auto_155004 ?auto_155007 ) ) ( not ( = ?auto_155004 ?auto_155008 ) ) ( not ( = ?auto_155005 ?auto_155006 ) ) ( not ( = ?auto_155005 ?auto_155007 ) ) ( not ( = ?auto_155005 ?auto_155008 ) ) ( not ( = ?auto_155006 ?auto_155007 ) ) ( not ( = ?auto_155006 ?auto_155008 ) ) ( not ( = ?auto_155007 ?auto_155008 ) ) ( ON ?auto_155008 ?auto_155009 ) ( not ( = ?auto_155003 ?auto_155009 ) ) ( not ( = ?auto_155004 ?auto_155009 ) ) ( not ( = ?auto_155005 ?auto_155009 ) ) ( not ( = ?auto_155006 ?auto_155009 ) ) ( not ( = ?auto_155007 ?auto_155009 ) ) ( not ( = ?auto_155008 ?auto_155009 ) ) ( ON ?auto_155007 ?auto_155008 ) ( ON-TABLE ?auto_155011 ) ( ON ?auto_155010 ?auto_155011 ) ( ON ?auto_155009 ?auto_155010 ) ( not ( = ?auto_155011 ?auto_155010 ) ) ( not ( = ?auto_155011 ?auto_155009 ) ) ( not ( = ?auto_155011 ?auto_155008 ) ) ( not ( = ?auto_155011 ?auto_155007 ) ) ( not ( = ?auto_155010 ?auto_155009 ) ) ( not ( = ?auto_155010 ?auto_155008 ) ) ( not ( = ?auto_155010 ?auto_155007 ) ) ( not ( = ?auto_155003 ?auto_155011 ) ) ( not ( = ?auto_155003 ?auto_155010 ) ) ( not ( = ?auto_155004 ?auto_155011 ) ) ( not ( = ?auto_155004 ?auto_155010 ) ) ( not ( = ?auto_155005 ?auto_155011 ) ) ( not ( = ?auto_155005 ?auto_155010 ) ) ( not ( = ?auto_155006 ?auto_155011 ) ) ( not ( = ?auto_155006 ?auto_155010 ) ) ( ON ?auto_155006 ?auto_155007 ) ( ON ?auto_155005 ?auto_155006 ) ( CLEAR ?auto_155005 ) ( HOLDING ?auto_155004 ) ( CLEAR ?auto_155003 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_155003 ?auto_155004 )
      ( MAKE-6PILE ?auto_155003 ?auto_155004 ?auto_155005 ?auto_155006 ?auto_155007 ?auto_155008 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_155012 - BLOCK
      ?auto_155013 - BLOCK
      ?auto_155014 - BLOCK
      ?auto_155015 - BLOCK
      ?auto_155016 - BLOCK
      ?auto_155017 - BLOCK
    )
    :vars
    (
      ?auto_155018 - BLOCK
      ?auto_155019 - BLOCK
      ?auto_155020 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_155012 ) ( not ( = ?auto_155012 ?auto_155013 ) ) ( not ( = ?auto_155012 ?auto_155014 ) ) ( not ( = ?auto_155012 ?auto_155015 ) ) ( not ( = ?auto_155012 ?auto_155016 ) ) ( not ( = ?auto_155012 ?auto_155017 ) ) ( not ( = ?auto_155013 ?auto_155014 ) ) ( not ( = ?auto_155013 ?auto_155015 ) ) ( not ( = ?auto_155013 ?auto_155016 ) ) ( not ( = ?auto_155013 ?auto_155017 ) ) ( not ( = ?auto_155014 ?auto_155015 ) ) ( not ( = ?auto_155014 ?auto_155016 ) ) ( not ( = ?auto_155014 ?auto_155017 ) ) ( not ( = ?auto_155015 ?auto_155016 ) ) ( not ( = ?auto_155015 ?auto_155017 ) ) ( not ( = ?auto_155016 ?auto_155017 ) ) ( ON ?auto_155017 ?auto_155018 ) ( not ( = ?auto_155012 ?auto_155018 ) ) ( not ( = ?auto_155013 ?auto_155018 ) ) ( not ( = ?auto_155014 ?auto_155018 ) ) ( not ( = ?auto_155015 ?auto_155018 ) ) ( not ( = ?auto_155016 ?auto_155018 ) ) ( not ( = ?auto_155017 ?auto_155018 ) ) ( ON ?auto_155016 ?auto_155017 ) ( ON-TABLE ?auto_155019 ) ( ON ?auto_155020 ?auto_155019 ) ( ON ?auto_155018 ?auto_155020 ) ( not ( = ?auto_155019 ?auto_155020 ) ) ( not ( = ?auto_155019 ?auto_155018 ) ) ( not ( = ?auto_155019 ?auto_155017 ) ) ( not ( = ?auto_155019 ?auto_155016 ) ) ( not ( = ?auto_155020 ?auto_155018 ) ) ( not ( = ?auto_155020 ?auto_155017 ) ) ( not ( = ?auto_155020 ?auto_155016 ) ) ( not ( = ?auto_155012 ?auto_155019 ) ) ( not ( = ?auto_155012 ?auto_155020 ) ) ( not ( = ?auto_155013 ?auto_155019 ) ) ( not ( = ?auto_155013 ?auto_155020 ) ) ( not ( = ?auto_155014 ?auto_155019 ) ) ( not ( = ?auto_155014 ?auto_155020 ) ) ( not ( = ?auto_155015 ?auto_155019 ) ) ( not ( = ?auto_155015 ?auto_155020 ) ) ( ON ?auto_155015 ?auto_155016 ) ( ON ?auto_155014 ?auto_155015 ) ( CLEAR ?auto_155012 ) ( ON ?auto_155013 ?auto_155014 ) ( CLEAR ?auto_155013 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_155019 ?auto_155020 ?auto_155018 ?auto_155017 ?auto_155016 ?auto_155015 ?auto_155014 )
      ( MAKE-6PILE ?auto_155012 ?auto_155013 ?auto_155014 ?auto_155015 ?auto_155016 ?auto_155017 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_155021 - BLOCK
      ?auto_155022 - BLOCK
      ?auto_155023 - BLOCK
      ?auto_155024 - BLOCK
      ?auto_155025 - BLOCK
      ?auto_155026 - BLOCK
    )
    :vars
    (
      ?auto_155028 - BLOCK
      ?auto_155027 - BLOCK
      ?auto_155029 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_155021 ?auto_155022 ) ) ( not ( = ?auto_155021 ?auto_155023 ) ) ( not ( = ?auto_155021 ?auto_155024 ) ) ( not ( = ?auto_155021 ?auto_155025 ) ) ( not ( = ?auto_155021 ?auto_155026 ) ) ( not ( = ?auto_155022 ?auto_155023 ) ) ( not ( = ?auto_155022 ?auto_155024 ) ) ( not ( = ?auto_155022 ?auto_155025 ) ) ( not ( = ?auto_155022 ?auto_155026 ) ) ( not ( = ?auto_155023 ?auto_155024 ) ) ( not ( = ?auto_155023 ?auto_155025 ) ) ( not ( = ?auto_155023 ?auto_155026 ) ) ( not ( = ?auto_155024 ?auto_155025 ) ) ( not ( = ?auto_155024 ?auto_155026 ) ) ( not ( = ?auto_155025 ?auto_155026 ) ) ( ON ?auto_155026 ?auto_155028 ) ( not ( = ?auto_155021 ?auto_155028 ) ) ( not ( = ?auto_155022 ?auto_155028 ) ) ( not ( = ?auto_155023 ?auto_155028 ) ) ( not ( = ?auto_155024 ?auto_155028 ) ) ( not ( = ?auto_155025 ?auto_155028 ) ) ( not ( = ?auto_155026 ?auto_155028 ) ) ( ON ?auto_155025 ?auto_155026 ) ( ON-TABLE ?auto_155027 ) ( ON ?auto_155029 ?auto_155027 ) ( ON ?auto_155028 ?auto_155029 ) ( not ( = ?auto_155027 ?auto_155029 ) ) ( not ( = ?auto_155027 ?auto_155028 ) ) ( not ( = ?auto_155027 ?auto_155026 ) ) ( not ( = ?auto_155027 ?auto_155025 ) ) ( not ( = ?auto_155029 ?auto_155028 ) ) ( not ( = ?auto_155029 ?auto_155026 ) ) ( not ( = ?auto_155029 ?auto_155025 ) ) ( not ( = ?auto_155021 ?auto_155027 ) ) ( not ( = ?auto_155021 ?auto_155029 ) ) ( not ( = ?auto_155022 ?auto_155027 ) ) ( not ( = ?auto_155022 ?auto_155029 ) ) ( not ( = ?auto_155023 ?auto_155027 ) ) ( not ( = ?auto_155023 ?auto_155029 ) ) ( not ( = ?auto_155024 ?auto_155027 ) ) ( not ( = ?auto_155024 ?auto_155029 ) ) ( ON ?auto_155024 ?auto_155025 ) ( ON ?auto_155023 ?auto_155024 ) ( ON ?auto_155022 ?auto_155023 ) ( CLEAR ?auto_155022 ) ( HOLDING ?auto_155021 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_155021 )
      ( MAKE-6PILE ?auto_155021 ?auto_155022 ?auto_155023 ?auto_155024 ?auto_155025 ?auto_155026 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_155030 - BLOCK
      ?auto_155031 - BLOCK
      ?auto_155032 - BLOCK
      ?auto_155033 - BLOCK
      ?auto_155034 - BLOCK
      ?auto_155035 - BLOCK
    )
    :vars
    (
      ?auto_155038 - BLOCK
      ?auto_155036 - BLOCK
      ?auto_155037 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_155030 ?auto_155031 ) ) ( not ( = ?auto_155030 ?auto_155032 ) ) ( not ( = ?auto_155030 ?auto_155033 ) ) ( not ( = ?auto_155030 ?auto_155034 ) ) ( not ( = ?auto_155030 ?auto_155035 ) ) ( not ( = ?auto_155031 ?auto_155032 ) ) ( not ( = ?auto_155031 ?auto_155033 ) ) ( not ( = ?auto_155031 ?auto_155034 ) ) ( not ( = ?auto_155031 ?auto_155035 ) ) ( not ( = ?auto_155032 ?auto_155033 ) ) ( not ( = ?auto_155032 ?auto_155034 ) ) ( not ( = ?auto_155032 ?auto_155035 ) ) ( not ( = ?auto_155033 ?auto_155034 ) ) ( not ( = ?auto_155033 ?auto_155035 ) ) ( not ( = ?auto_155034 ?auto_155035 ) ) ( ON ?auto_155035 ?auto_155038 ) ( not ( = ?auto_155030 ?auto_155038 ) ) ( not ( = ?auto_155031 ?auto_155038 ) ) ( not ( = ?auto_155032 ?auto_155038 ) ) ( not ( = ?auto_155033 ?auto_155038 ) ) ( not ( = ?auto_155034 ?auto_155038 ) ) ( not ( = ?auto_155035 ?auto_155038 ) ) ( ON ?auto_155034 ?auto_155035 ) ( ON-TABLE ?auto_155036 ) ( ON ?auto_155037 ?auto_155036 ) ( ON ?auto_155038 ?auto_155037 ) ( not ( = ?auto_155036 ?auto_155037 ) ) ( not ( = ?auto_155036 ?auto_155038 ) ) ( not ( = ?auto_155036 ?auto_155035 ) ) ( not ( = ?auto_155036 ?auto_155034 ) ) ( not ( = ?auto_155037 ?auto_155038 ) ) ( not ( = ?auto_155037 ?auto_155035 ) ) ( not ( = ?auto_155037 ?auto_155034 ) ) ( not ( = ?auto_155030 ?auto_155036 ) ) ( not ( = ?auto_155030 ?auto_155037 ) ) ( not ( = ?auto_155031 ?auto_155036 ) ) ( not ( = ?auto_155031 ?auto_155037 ) ) ( not ( = ?auto_155032 ?auto_155036 ) ) ( not ( = ?auto_155032 ?auto_155037 ) ) ( not ( = ?auto_155033 ?auto_155036 ) ) ( not ( = ?auto_155033 ?auto_155037 ) ) ( ON ?auto_155033 ?auto_155034 ) ( ON ?auto_155032 ?auto_155033 ) ( ON ?auto_155031 ?auto_155032 ) ( ON ?auto_155030 ?auto_155031 ) ( CLEAR ?auto_155030 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_155036 ?auto_155037 ?auto_155038 ?auto_155035 ?auto_155034 ?auto_155033 ?auto_155032 ?auto_155031 )
      ( MAKE-6PILE ?auto_155030 ?auto_155031 ?auto_155032 ?auto_155033 ?auto_155034 ?auto_155035 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_155041 - BLOCK
      ?auto_155042 - BLOCK
    )
    :vars
    (
      ?auto_155043 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_155043 ?auto_155042 ) ( CLEAR ?auto_155043 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_155041 ) ( ON ?auto_155042 ?auto_155041 ) ( not ( = ?auto_155041 ?auto_155042 ) ) ( not ( = ?auto_155041 ?auto_155043 ) ) ( not ( = ?auto_155042 ?auto_155043 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_155043 ?auto_155042 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_155044 - BLOCK
      ?auto_155045 - BLOCK
    )
    :vars
    (
      ?auto_155046 - BLOCK
      ?auto_155047 - BLOCK
      ?auto_155048 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_155046 ?auto_155045 ) ( CLEAR ?auto_155046 ) ( ON-TABLE ?auto_155044 ) ( ON ?auto_155045 ?auto_155044 ) ( not ( = ?auto_155044 ?auto_155045 ) ) ( not ( = ?auto_155044 ?auto_155046 ) ) ( not ( = ?auto_155045 ?auto_155046 ) ) ( HOLDING ?auto_155047 ) ( CLEAR ?auto_155048 ) ( not ( = ?auto_155044 ?auto_155047 ) ) ( not ( = ?auto_155044 ?auto_155048 ) ) ( not ( = ?auto_155045 ?auto_155047 ) ) ( not ( = ?auto_155045 ?auto_155048 ) ) ( not ( = ?auto_155046 ?auto_155047 ) ) ( not ( = ?auto_155046 ?auto_155048 ) ) ( not ( = ?auto_155047 ?auto_155048 ) ) )
    :subtasks
    ( ( !STACK ?auto_155047 ?auto_155048 )
      ( MAKE-2PILE ?auto_155044 ?auto_155045 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_155049 - BLOCK
      ?auto_155050 - BLOCK
    )
    :vars
    (
      ?auto_155052 - BLOCK
      ?auto_155053 - BLOCK
      ?auto_155051 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_155052 ?auto_155050 ) ( ON-TABLE ?auto_155049 ) ( ON ?auto_155050 ?auto_155049 ) ( not ( = ?auto_155049 ?auto_155050 ) ) ( not ( = ?auto_155049 ?auto_155052 ) ) ( not ( = ?auto_155050 ?auto_155052 ) ) ( CLEAR ?auto_155053 ) ( not ( = ?auto_155049 ?auto_155051 ) ) ( not ( = ?auto_155049 ?auto_155053 ) ) ( not ( = ?auto_155050 ?auto_155051 ) ) ( not ( = ?auto_155050 ?auto_155053 ) ) ( not ( = ?auto_155052 ?auto_155051 ) ) ( not ( = ?auto_155052 ?auto_155053 ) ) ( not ( = ?auto_155051 ?auto_155053 ) ) ( ON ?auto_155051 ?auto_155052 ) ( CLEAR ?auto_155051 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_155049 ?auto_155050 ?auto_155052 )
      ( MAKE-2PILE ?auto_155049 ?auto_155050 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_155054 - BLOCK
      ?auto_155055 - BLOCK
    )
    :vars
    (
      ?auto_155056 - BLOCK
      ?auto_155058 - BLOCK
      ?auto_155057 - BLOCK
      ?auto_155059 - BLOCK
      ?auto_155061 - BLOCK
      ?auto_155062 - BLOCK
      ?auto_155060 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_155056 ?auto_155055 ) ( ON-TABLE ?auto_155054 ) ( ON ?auto_155055 ?auto_155054 ) ( not ( = ?auto_155054 ?auto_155055 ) ) ( not ( = ?auto_155054 ?auto_155056 ) ) ( not ( = ?auto_155055 ?auto_155056 ) ) ( not ( = ?auto_155054 ?auto_155058 ) ) ( not ( = ?auto_155054 ?auto_155057 ) ) ( not ( = ?auto_155055 ?auto_155058 ) ) ( not ( = ?auto_155055 ?auto_155057 ) ) ( not ( = ?auto_155056 ?auto_155058 ) ) ( not ( = ?auto_155056 ?auto_155057 ) ) ( not ( = ?auto_155058 ?auto_155057 ) ) ( ON ?auto_155058 ?auto_155056 ) ( CLEAR ?auto_155058 ) ( HOLDING ?auto_155057 ) ( CLEAR ?auto_155059 ) ( ON-TABLE ?auto_155061 ) ( ON ?auto_155062 ?auto_155061 ) ( ON ?auto_155060 ?auto_155062 ) ( ON ?auto_155059 ?auto_155060 ) ( not ( = ?auto_155061 ?auto_155062 ) ) ( not ( = ?auto_155061 ?auto_155060 ) ) ( not ( = ?auto_155061 ?auto_155059 ) ) ( not ( = ?auto_155061 ?auto_155057 ) ) ( not ( = ?auto_155062 ?auto_155060 ) ) ( not ( = ?auto_155062 ?auto_155059 ) ) ( not ( = ?auto_155062 ?auto_155057 ) ) ( not ( = ?auto_155060 ?auto_155059 ) ) ( not ( = ?auto_155060 ?auto_155057 ) ) ( not ( = ?auto_155059 ?auto_155057 ) ) ( not ( = ?auto_155054 ?auto_155059 ) ) ( not ( = ?auto_155054 ?auto_155061 ) ) ( not ( = ?auto_155054 ?auto_155062 ) ) ( not ( = ?auto_155054 ?auto_155060 ) ) ( not ( = ?auto_155055 ?auto_155059 ) ) ( not ( = ?auto_155055 ?auto_155061 ) ) ( not ( = ?auto_155055 ?auto_155062 ) ) ( not ( = ?auto_155055 ?auto_155060 ) ) ( not ( = ?auto_155056 ?auto_155059 ) ) ( not ( = ?auto_155056 ?auto_155061 ) ) ( not ( = ?auto_155056 ?auto_155062 ) ) ( not ( = ?auto_155056 ?auto_155060 ) ) ( not ( = ?auto_155058 ?auto_155059 ) ) ( not ( = ?auto_155058 ?auto_155061 ) ) ( not ( = ?auto_155058 ?auto_155062 ) ) ( not ( = ?auto_155058 ?auto_155060 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_155061 ?auto_155062 ?auto_155060 ?auto_155059 ?auto_155057 )
      ( MAKE-2PILE ?auto_155054 ?auto_155055 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_155063 - BLOCK
      ?auto_155064 - BLOCK
    )
    :vars
    (
      ?auto_155067 - BLOCK
      ?auto_155065 - BLOCK
      ?auto_155068 - BLOCK
      ?auto_155066 - BLOCK
      ?auto_155071 - BLOCK
      ?auto_155069 - BLOCK
      ?auto_155070 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_155067 ?auto_155064 ) ( ON-TABLE ?auto_155063 ) ( ON ?auto_155064 ?auto_155063 ) ( not ( = ?auto_155063 ?auto_155064 ) ) ( not ( = ?auto_155063 ?auto_155067 ) ) ( not ( = ?auto_155064 ?auto_155067 ) ) ( not ( = ?auto_155063 ?auto_155065 ) ) ( not ( = ?auto_155063 ?auto_155068 ) ) ( not ( = ?auto_155064 ?auto_155065 ) ) ( not ( = ?auto_155064 ?auto_155068 ) ) ( not ( = ?auto_155067 ?auto_155065 ) ) ( not ( = ?auto_155067 ?auto_155068 ) ) ( not ( = ?auto_155065 ?auto_155068 ) ) ( ON ?auto_155065 ?auto_155067 ) ( CLEAR ?auto_155066 ) ( ON-TABLE ?auto_155071 ) ( ON ?auto_155069 ?auto_155071 ) ( ON ?auto_155070 ?auto_155069 ) ( ON ?auto_155066 ?auto_155070 ) ( not ( = ?auto_155071 ?auto_155069 ) ) ( not ( = ?auto_155071 ?auto_155070 ) ) ( not ( = ?auto_155071 ?auto_155066 ) ) ( not ( = ?auto_155071 ?auto_155068 ) ) ( not ( = ?auto_155069 ?auto_155070 ) ) ( not ( = ?auto_155069 ?auto_155066 ) ) ( not ( = ?auto_155069 ?auto_155068 ) ) ( not ( = ?auto_155070 ?auto_155066 ) ) ( not ( = ?auto_155070 ?auto_155068 ) ) ( not ( = ?auto_155066 ?auto_155068 ) ) ( not ( = ?auto_155063 ?auto_155066 ) ) ( not ( = ?auto_155063 ?auto_155071 ) ) ( not ( = ?auto_155063 ?auto_155069 ) ) ( not ( = ?auto_155063 ?auto_155070 ) ) ( not ( = ?auto_155064 ?auto_155066 ) ) ( not ( = ?auto_155064 ?auto_155071 ) ) ( not ( = ?auto_155064 ?auto_155069 ) ) ( not ( = ?auto_155064 ?auto_155070 ) ) ( not ( = ?auto_155067 ?auto_155066 ) ) ( not ( = ?auto_155067 ?auto_155071 ) ) ( not ( = ?auto_155067 ?auto_155069 ) ) ( not ( = ?auto_155067 ?auto_155070 ) ) ( not ( = ?auto_155065 ?auto_155066 ) ) ( not ( = ?auto_155065 ?auto_155071 ) ) ( not ( = ?auto_155065 ?auto_155069 ) ) ( not ( = ?auto_155065 ?auto_155070 ) ) ( ON ?auto_155068 ?auto_155065 ) ( CLEAR ?auto_155068 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_155063 ?auto_155064 ?auto_155067 ?auto_155065 )
      ( MAKE-2PILE ?auto_155063 ?auto_155064 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_155072 - BLOCK
      ?auto_155073 - BLOCK
    )
    :vars
    (
      ?auto_155074 - BLOCK
      ?auto_155080 - BLOCK
      ?auto_155079 - BLOCK
      ?auto_155077 - BLOCK
      ?auto_155075 - BLOCK
      ?auto_155076 - BLOCK
      ?auto_155078 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_155074 ?auto_155073 ) ( ON-TABLE ?auto_155072 ) ( ON ?auto_155073 ?auto_155072 ) ( not ( = ?auto_155072 ?auto_155073 ) ) ( not ( = ?auto_155072 ?auto_155074 ) ) ( not ( = ?auto_155073 ?auto_155074 ) ) ( not ( = ?auto_155072 ?auto_155080 ) ) ( not ( = ?auto_155072 ?auto_155079 ) ) ( not ( = ?auto_155073 ?auto_155080 ) ) ( not ( = ?auto_155073 ?auto_155079 ) ) ( not ( = ?auto_155074 ?auto_155080 ) ) ( not ( = ?auto_155074 ?auto_155079 ) ) ( not ( = ?auto_155080 ?auto_155079 ) ) ( ON ?auto_155080 ?auto_155074 ) ( ON-TABLE ?auto_155077 ) ( ON ?auto_155075 ?auto_155077 ) ( ON ?auto_155076 ?auto_155075 ) ( not ( = ?auto_155077 ?auto_155075 ) ) ( not ( = ?auto_155077 ?auto_155076 ) ) ( not ( = ?auto_155077 ?auto_155078 ) ) ( not ( = ?auto_155077 ?auto_155079 ) ) ( not ( = ?auto_155075 ?auto_155076 ) ) ( not ( = ?auto_155075 ?auto_155078 ) ) ( not ( = ?auto_155075 ?auto_155079 ) ) ( not ( = ?auto_155076 ?auto_155078 ) ) ( not ( = ?auto_155076 ?auto_155079 ) ) ( not ( = ?auto_155078 ?auto_155079 ) ) ( not ( = ?auto_155072 ?auto_155078 ) ) ( not ( = ?auto_155072 ?auto_155077 ) ) ( not ( = ?auto_155072 ?auto_155075 ) ) ( not ( = ?auto_155072 ?auto_155076 ) ) ( not ( = ?auto_155073 ?auto_155078 ) ) ( not ( = ?auto_155073 ?auto_155077 ) ) ( not ( = ?auto_155073 ?auto_155075 ) ) ( not ( = ?auto_155073 ?auto_155076 ) ) ( not ( = ?auto_155074 ?auto_155078 ) ) ( not ( = ?auto_155074 ?auto_155077 ) ) ( not ( = ?auto_155074 ?auto_155075 ) ) ( not ( = ?auto_155074 ?auto_155076 ) ) ( not ( = ?auto_155080 ?auto_155078 ) ) ( not ( = ?auto_155080 ?auto_155077 ) ) ( not ( = ?auto_155080 ?auto_155075 ) ) ( not ( = ?auto_155080 ?auto_155076 ) ) ( ON ?auto_155079 ?auto_155080 ) ( CLEAR ?auto_155079 ) ( HOLDING ?auto_155078 ) ( CLEAR ?auto_155076 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_155077 ?auto_155075 ?auto_155076 ?auto_155078 )
      ( MAKE-2PILE ?auto_155072 ?auto_155073 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_155081 - BLOCK
      ?auto_155082 - BLOCK
    )
    :vars
    (
      ?auto_155084 - BLOCK
      ?auto_155088 - BLOCK
      ?auto_155085 - BLOCK
      ?auto_155083 - BLOCK
      ?auto_155086 - BLOCK
      ?auto_155087 - BLOCK
      ?auto_155089 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_155084 ?auto_155082 ) ( ON-TABLE ?auto_155081 ) ( ON ?auto_155082 ?auto_155081 ) ( not ( = ?auto_155081 ?auto_155082 ) ) ( not ( = ?auto_155081 ?auto_155084 ) ) ( not ( = ?auto_155082 ?auto_155084 ) ) ( not ( = ?auto_155081 ?auto_155088 ) ) ( not ( = ?auto_155081 ?auto_155085 ) ) ( not ( = ?auto_155082 ?auto_155088 ) ) ( not ( = ?auto_155082 ?auto_155085 ) ) ( not ( = ?auto_155084 ?auto_155088 ) ) ( not ( = ?auto_155084 ?auto_155085 ) ) ( not ( = ?auto_155088 ?auto_155085 ) ) ( ON ?auto_155088 ?auto_155084 ) ( ON-TABLE ?auto_155083 ) ( ON ?auto_155086 ?auto_155083 ) ( ON ?auto_155087 ?auto_155086 ) ( not ( = ?auto_155083 ?auto_155086 ) ) ( not ( = ?auto_155083 ?auto_155087 ) ) ( not ( = ?auto_155083 ?auto_155089 ) ) ( not ( = ?auto_155083 ?auto_155085 ) ) ( not ( = ?auto_155086 ?auto_155087 ) ) ( not ( = ?auto_155086 ?auto_155089 ) ) ( not ( = ?auto_155086 ?auto_155085 ) ) ( not ( = ?auto_155087 ?auto_155089 ) ) ( not ( = ?auto_155087 ?auto_155085 ) ) ( not ( = ?auto_155089 ?auto_155085 ) ) ( not ( = ?auto_155081 ?auto_155089 ) ) ( not ( = ?auto_155081 ?auto_155083 ) ) ( not ( = ?auto_155081 ?auto_155086 ) ) ( not ( = ?auto_155081 ?auto_155087 ) ) ( not ( = ?auto_155082 ?auto_155089 ) ) ( not ( = ?auto_155082 ?auto_155083 ) ) ( not ( = ?auto_155082 ?auto_155086 ) ) ( not ( = ?auto_155082 ?auto_155087 ) ) ( not ( = ?auto_155084 ?auto_155089 ) ) ( not ( = ?auto_155084 ?auto_155083 ) ) ( not ( = ?auto_155084 ?auto_155086 ) ) ( not ( = ?auto_155084 ?auto_155087 ) ) ( not ( = ?auto_155088 ?auto_155089 ) ) ( not ( = ?auto_155088 ?auto_155083 ) ) ( not ( = ?auto_155088 ?auto_155086 ) ) ( not ( = ?auto_155088 ?auto_155087 ) ) ( ON ?auto_155085 ?auto_155088 ) ( CLEAR ?auto_155087 ) ( ON ?auto_155089 ?auto_155085 ) ( CLEAR ?auto_155089 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_155081 ?auto_155082 ?auto_155084 ?auto_155088 ?auto_155085 )
      ( MAKE-2PILE ?auto_155081 ?auto_155082 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_155090 - BLOCK
      ?auto_155091 - BLOCK
    )
    :vars
    (
      ?auto_155098 - BLOCK
      ?auto_155097 - BLOCK
      ?auto_155092 - BLOCK
      ?auto_155095 - BLOCK
      ?auto_155096 - BLOCK
      ?auto_155093 - BLOCK
      ?auto_155094 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_155098 ?auto_155091 ) ( ON-TABLE ?auto_155090 ) ( ON ?auto_155091 ?auto_155090 ) ( not ( = ?auto_155090 ?auto_155091 ) ) ( not ( = ?auto_155090 ?auto_155098 ) ) ( not ( = ?auto_155091 ?auto_155098 ) ) ( not ( = ?auto_155090 ?auto_155097 ) ) ( not ( = ?auto_155090 ?auto_155092 ) ) ( not ( = ?auto_155091 ?auto_155097 ) ) ( not ( = ?auto_155091 ?auto_155092 ) ) ( not ( = ?auto_155098 ?auto_155097 ) ) ( not ( = ?auto_155098 ?auto_155092 ) ) ( not ( = ?auto_155097 ?auto_155092 ) ) ( ON ?auto_155097 ?auto_155098 ) ( ON-TABLE ?auto_155095 ) ( ON ?auto_155096 ?auto_155095 ) ( not ( = ?auto_155095 ?auto_155096 ) ) ( not ( = ?auto_155095 ?auto_155093 ) ) ( not ( = ?auto_155095 ?auto_155094 ) ) ( not ( = ?auto_155095 ?auto_155092 ) ) ( not ( = ?auto_155096 ?auto_155093 ) ) ( not ( = ?auto_155096 ?auto_155094 ) ) ( not ( = ?auto_155096 ?auto_155092 ) ) ( not ( = ?auto_155093 ?auto_155094 ) ) ( not ( = ?auto_155093 ?auto_155092 ) ) ( not ( = ?auto_155094 ?auto_155092 ) ) ( not ( = ?auto_155090 ?auto_155094 ) ) ( not ( = ?auto_155090 ?auto_155095 ) ) ( not ( = ?auto_155090 ?auto_155096 ) ) ( not ( = ?auto_155090 ?auto_155093 ) ) ( not ( = ?auto_155091 ?auto_155094 ) ) ( not ( = ?auto_155091 ?auto_155095 ) ) ( not ( = ?auto_155091 ?auto_155096 ) ) ( not ( = ?auto_155091 ?auto_155093 ) ) ( not ( = ?auto_155098 ?auto_155094 ) ) ( not ( = ?auto_155098 ?auto_155095 ) ) ( not ( = ?auto_155098 ?auto_155096 ) ) ( not ( = ?auto_155098 ?auto_155093 ) ) ( not ( = ?auto_155097 ?auto_155094 ) ) ( not ( = ?auto_155097 ?auto_155095 ) ) ( not ( = ?auto_155097 ?auto_155096 ) ) ( not ( = ?auto_155097 ?auto_155093 ) ) ( ON ?auto_155092 ?auto_155097 ) ( ON ?auto_155094 ?auto_155092 ) ( CLEAR ?auto_155094 ) ( HOLDING ?auto_155093 ) ( CLEAR ?auto_155096 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_155095 ?auto_155096 ?auto_155093 )
      ( MAKE-2PILE ?auto_155090 ?auto_155091 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_155099 - BLOCK
      ?auto_155100 - BLOCK
    )
    :vars
    (
      ?auto_155103 - BLOCK
      ?auto_155101 - BLOCK
      ?auto_155106 - BLOCK
      ?auto_155102 - BLOCK
      ?auto_155105 - BLOCK
      ?auto_155107 - BLOCK
      ?auto_155104 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_155103 ?auto_155100 ) ( ON-TABLE ?auto_155099 ) ( ON ?auto_155100 ?auto_155099 ) ( not ( = ?auto_155099 ?auto_155100 ) ) ( not ( = ?auto_155099 ?auto_155103 ) ) ( not ( = ?auto_155100 ?auto_155103 ) ) ( not ( = ?auto_155099 ?auto_155101 ) ) ( not ( = ?auto_155099 ?auto_155106 ) ) ( not ( = ?auto_155100 ?auto_155101 ) ) ( not ( = ?auto_155100 ?auto_155106 ) ) ( not ( = ?auto_155103 ?auto_155101 ) ) ( not ( = ?auto_155103 ?auto_155106 ) ) ( not ( = ?auto_155101 ?auto_155106 ) ) ( ON ?auto_155101 ?auto_155103 ) ( ON-TABLE ?auto_155102 ) ( ON ?auto_155105 ?auto_155102 ) ( not ( = ?auto_155102 ?auto_155105 ) ) ( not ( = ?auto_155102 ?auto_155107 ) ) ( not ( = ?auto_155102 ?auto_155104 ) ) ( not ( = ?auto_155102 ?auto_155106 ) ) ( not ( = ?auto_155105 ?auto_155107 ) ) ( not ( = ?auto_155105 ?auto_155104 ) ) ( not ( = ?auto_155105 ?auto_155106 ) ) ( not ( = ?auto_155107 ?auto_155104 ) ) ( not ( = ?auto_155107 ?auto_155106 ) ) ( not ( = ?auto_155104 ?auto_155106 ) ) ( not ( = ?auto_155099 ?auto_155104 ) ) ( not ( = ?auto_155099 ?auto_155102 ) ) ( not ( = ?auto_155099 ?auto_155105 ) ) ( not ( = ?auto_155099 ?auto_155107 ) ) ( not ( = ?auto_155100 ?auto_155104 ) ) ( not ( = ?auto_155100 ?auto_155102 ) ) ( not ( = ?auto_155100 ?auto_155105 ) ) ( not ( = ?auto_155100 ?auto_155107 ) ) ( not ( = ?auto_155103 ?auto_155104 ) ) ( not ( = ?auto_155103 ?auto_155102 ) ) ( not ( = ?auto_155103 ?auto_155105 ) ) ( not ( = ?auto_155103 ?auto_155107 ) ) ( not ( = ?auto_155101 ?auto_155104 ) ) ( not ( = ?auto_155101 ?auto_155102 ) ) ( not ( = ?auto_155101 ?auto_155105 ) ) ( not ( = ?auto_155101 ?auto_155107 ) ) ( ON ?auto_155106 ?auto_155101 ) ( ON ?auto_155104 ?auto_155106 ) ( CLEAR ?auto_155105 ) ( ON ?auto_155107 ?auto_155104 ) ( CLEAR ?auto_155107 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_155099 ?auto_155100 ?auto_155103 ?auto_155101 ?auto_155106 ?auto_155104 )
      ( MAKE-2PILE ?auto_155099 ?auto_155100 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_155108 - BLOCK
      ?auto_155109 - BLOCK
    )
    :vars
    (
      ?auto_155111 - BLOCK
      ?auto_155113 - BLOCK
      ?auto_155114 - BLOCK
      ?auto_155112 - BLOCK
      ?auto_155110 - BLOCK
      ?auto_155115 - BLOCK
      ?auto_155116 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_155111 ?auto_155109 ) ( ON-TABLE ?auto_155108 ) ( ON ?auto_155109 ?auto_155108 ) ( not ( = ?auto_155108 ?auto_155109 ) ) ( not ( = ?auto_155108 ?auto_155111 ) ) ( not ( = ?auto_155109 ?auto_155111 ) ) ( not ( = ?auto_155108 ?auto_155113 ) ) ( not ( = ?auto_155108 ?auto_155114 ) ) ( not ( = ?auto_155109 ?auto_155113 ) ) ( not ( = ?auto_155109 ?auto_155114 ) ) ( not ( = ?auto_155111 ?auto_155113 ) ) ( not ( = ?auto_155111 ?auto_155114 ) ) ( not ( = ?auto_155113 ?auto_155114 ) ) ( ON ?auto_155113 ?auto_155111 ) ( ON-TABLE ?auto_155112 ) ( not ( = ?auto_155112 ?auto_155110 ) ) ( not ( = ?auto_155112 ?auto_155115 ) ) ( not ( = ?auto_155112 ?auto_155116 ) ) ( not ( = ?auto_155112 ?auto_155114 ) ) ( not ( = ?auto_155110 ?auto_155115 ) ) ( not ( = ?auto_155110 ?auto_155116 ) ) ( not ( = ?auto_155110 ?auto_155114 ) ) ( not ( = ?auto_155115 ?auto_155116 ) ) ( not ( = ?auto_155115 ?auto_155114 ) ) ( not ( = ?auto_155116 ?auto_155114 ) ) ( not ( = ?auto_155108 ?auto_155116 ) ) ( not ( = ?auto_155108 ?auto_155112 ) ) ( not ( = ?auto_155108 ?auto_155110 ) ) ( not ( = ?auto_155108 ?auto_155115 ) ) ( not ( = ?auto_155109 ?auto_155116 ) ) ( not ( = ?auto_155109 ?auto_155112 ) ) ( not ( = ?auto_155109 ?auto_155110 ) ) ( not ( = ?auto_155109 ?auto_155115 ) ) ( not ( = ?auto_155111 ?auto_155116 ) ) ( not ( = ?auto_155111 ?auto_155112 ) ) ( not ( = ?auto_155111 ?auto_155110 ) ) ( not ( = ?auto_155111 ?auto_155115 ) ) ( not ( = ?auto_155113 ?auto_155116 ) ) ( not ( = ?auto_155113 ?auto_155112 ) ) ( not ( = ?auto_155113 ?auto_155110 ) ) ( not ( = ?auto_155113 ?auto_155115 ) ) ( ON ?auto_155114 ?auto_155113 ) ( ON ?auto_155116 ?auto_155114 ) ( ON ?auto_155115 ?auto_155116 ) ( CLEAR ?auto_155115 ) ( HOLDING ?auto_155110 ) ( CLEAR ?auto_155112 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_155112 ?auto_155110 )
      ( MAKE-2PILE ?auto_155108 ?auto_155109 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_157135 - BLOCK
      ?auto_157136 - BLOCK
    )
    :vars
    (
      ?auto_157140 - BLOCK
      ?auto_157141 - BLOCK
      ?auto_157137 - BLOCK
      ?auto_157142 - BLOCK
      ?auto_157139 - BLOCK
      ?auto_157138 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_157140 ?auto_157136 ) ( ON-TABLE ?auto_157135 ) ( ON ?auto_157136 ?auto_157135 ) ( not ( = ?auto_157135 ?auto_157136 ) ) ( not ( = ?auto_157135 ?auto_157140 ) ) ( not ( = ?auto_157136 ?auto_157140 ) ) ( not ( = ?auto_157135 ?auto_157141 ) ) ( not ( = ?auto_157135 ?auto_157137 ) ) ( not ( = ?auto_157136 ?auto_157141 ) ) ( not ( = ?auto_157136 ?auto_157137 ) ) ( not ( = ?auto_157140 ?auto_157141 ) ) ( not ( = ?auto_157140 ?auto_157137 ) ) ( not ( = ?auto_157141 ?auto_157137 ) ) ( ON ?auto_157141 ?auto_157140 ) ( not ( = ?auto_157142 ?auto_157139 ) ) ( not ( = ?auto_157142 ?auto_157138 ) ) ( not ( = ?auto_157142 ?auto_157137 ) ) ( not ( = ?auto_157139 ?auto_157138 ) ) ( not ( = ?auto_157139 ?auto_157137 ) ) ( not ( = ?auto_157138 ?auto_157137 ) ) ( not ( = ?auto_157135 ?auto_157138 ) ) ( not ( = ?auto_157135 ?auto_157142 ) ) ( not ( = ?auto_157135 ?auto_157139 ) ) ( not ( = ?auto_157136 ?auto_157138 ) ) ( not ( = ?auto_157136 ?auto_157142 ) ) ( not ( = ?auto_157136 ?auto_157139 ) ) ( not ( = ?auto_157140 ?auto_157138 ) ) ( not ( = ?auto_157140 ?auto_157142 ) ) ( not ( = ?auto_157140 ?auto_157139 ) ) ( not ( = ?auto_157141 ?auto_157138 ) ) ( not ( = ?auto_157141 ?auto_157142 ) ) ( not ( = ?auto_157141 ?auto_157139 ) ) ( ON ?auto_157137 ?auto_157141 ) ( ON ?auto_157138 ?auto_157137 ) ( ON ?auto_157139 ?auto_157138 ) ( ON ?auto_157142 ?auto_157139 ) ( CLEAR ?auto_157142 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_157135 ?auto_157136 ?auto_157140 ?auto_157141 ?auto_157137 ?auto_157138 ?auto_157139 )
      ( MAKE-2PILE ?auto_157135 ?auto_157136 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_155126 - BLOCK
      ?auto_155127 - BLOCK
    )
    :vars
    (
      ?auto_155134 - BLOCK
      ?auto_155130 - BLOCK
      ?auto_155128 - BLOCK
      ?auto_155132 - BLOCK
      ?auto_155131 - BLOCK
      ?auto_155129 - BLOCK
      ?auto_155133 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_155134 ?auto_155127 ) ( ON-TABLE ?auto_155126 ) ( ON ?auto_155127 ?auto_155126 ) ( not ( = ?auto_155126 ?auto_155127 ) ) ( not ( = ?auto_155126 ?auto_155134 ) ) ( not ( = ?auto_155127 ?auto_155134 ) ) ( not ( = ?auto_155126 ?auto_155130 ) ) ( not ( = ?auto_155126 ?auto_155128 ) ) ( not ( = ?auto_155127 ?auto_155130 ) ) ( not ( = ?auto_155127 ?auto_155128 ) ) ( not ( = ?auto_155134 ?auto_155130 ) ) ( not ( = ?auto_155134 ?auto_155128 ) ) ( not ( = ?auto_155130 ?auto_155128 ) ) ( ON ?auto_155130 ?auto_155134 ) ( not ( = ?auto_155132 ?auto_155131 ) ) ( not ( = ?auto_155132 ?auto_155129 ) ) ( not ( = ?auto_155132 ?auto_155133 ) ) ( not ( = ?auto_155132 ?auto_155128 ) ) ( not ( = ?auto_155131 ?auto_155129 ) ) ( not ( = ?auto_155131 ?auto_155133 ) ) ( not ( = ?auto_155131 ?auto_155128 ) ) ( not ( = ?auto_155129 ?auto_155133 ) ) ( not ( = ?auto_155129 ?auto_155128 ) ) ( not ( = ?auto_155133 ?auto_155128 ) ) ( not ( = ?auto_155126 ?auto_155133 ) ) ( not ( = ?auto_155126 ?auto_155132 ) ) ( not ( = ?auto_155126 ?auto_155131 ) ) ( not ( = ?auto_155126 ?auto_155129 ) ) ( not ( = ?auto_155127 ?auto_155133 ) ) ( not ( = ?auto_155127 ?auto_155132 ) ) ( not ( = ?auto_155127 ?auto_155131 ) ) ( not ( = ?auto_155127 ?auto_155129 ) ) ( not ( = ?auto_155134 ?auto_155133 ) ) ( not ( = ?auto_155134 ?auto_155132 ) ) ( not ( = ?auto_155134 ?auto_155131 ) ) ( not ( = ?auto_155134 ?auto_155129 ) ) ( not ( = ?auto_155130 ?auto_155133 ) ) ( not ( = ?auto_155130 ?auto_155132 ) ) ( not ( = ?auto_155130 ?auto_155131 ) ) ( not ( = ?auto_155130 ?auto_155129 ) ) ( ON ?auto_155128 ?auto_155130 ) ( ON ?auto_155133 ?auto_155128 ) ( ON ?auto_155129 ?auto_155133 ) ( ON ?auto_155131 ?auto_155129 ) ( CLEAR ?auto_155131 ) ( HOLDING ?auto_155132 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_155132 )
      ( MAKE-2PILE ?auto_155126 ?auto_155127 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_155135 - BLOCK
      ?auto_155136 - BLOCK
    )
    :vars
    (
      ?auto_155139 - BLOCK
      ?auto_155140 - BLOCK
      ?auto_155143 - BLOCK
      ?auto_155137 - BLOCK
      ?auto_155141 - BLOCK
      ?auto_155142 - BLOCK
      ?auto_155138 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_155139 ?auto_155136 ) ( ON-TABLE ?auto_155135 ) ( ON ?auto_155136 ?auto_155135 ) ( not ( = ?auto_155135 ?auto_155136 ) ) ( not ( = ?auto_155135 ?auto_155139 ) ) ( not ( = ?auto_155136 ?auto_155139 ) ) ( not ( = ?auto_155135 ?auto_155140 ) ) ( not ( = ?auto_155135 ?auto_155143 ) ) ( not ( = ?auto_155136 ?auto_155140 ) ) ( not ( = ?auto_155136 ?auto_155143 ) ) ( not ( = ?auto_155139 ?auto_155140 ) ) ( not ( = ?auto_155139 ?auto_155143 ) ) ( not ( = ?auto_155140 ?auto_155143 ) ) ( ON ?auto_155140 ?auto_155139 ) ( not ( = ?auto_155137 ?auto_155141 ) ) ( not ( = ?auto_155137 ?auto_155142 ) ) ( not ( = ?auto_155137 ?auto_155138 ) ) ( not ( = ?auto_155137 ?auto_155143 ) ) ( not ( = ?auto_155141 ?auto_155142 ) ) ( not ( = ?auto_155141 ?auto_155138 ) ) ( not ( = ?auto_155141 ?auto_155143 ) ) ( not ( = ?auto_155142 ?auto_155138 ) ) ( not ( = ?auto_155142 ?auto_155143 ) ) ( not ( = ?auto_155138 ?auto_155143 ) ) ( not ( = ?auto_155135 ?auto_155138 ) ) ( not ( = ?auto_155135 ?auto_155137 ) ) ( not ( = ?auto_155135 ?auto_155141 ) ) ( not ( = ?auto_155135 ?auto_155142 ) ) ( not ( = ?auto_155136 ?auto_155138 ) ) ( not ( = ?auto_155136 ?auto_155137 ) ) ( not ( = ?auto_155136 ?auto_155141 ) ) ( not ( = ?auto_155136 ?auto_155142 ) ) ( not ( = ?auto_155139 ?auto_155138 ) ) ( not ( = ?auto_155139 ?auto_155137 ) ) ( not ( = ?auto_155139 ?auto_155141 ) ) ( not ( = ?auto_155139 ?auto_155142 ) ) ( not ( = ?auto_155140 ?auto_155138 ) ) ( not ( = ?auto_155140 ?auto_155137 ) ) ( not ( = ?auto_155140 ?auto_155141 ) ) ( not ( = ?auto_155140 ?auto_155142 ) ) ( ON ?auto_155143 ?auto_155140 ) ( ON ?auto_155138 ?auto_155143 ) ( ON ?auto_155142 ?auto_155138 ) ( ON ?auto_155141 ?auto_155142 ) ( ON ?auto_155137 ?auto_155141 ) ( CLEAR ?auto_155137 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_155135 ?auto_155136 ?auto_155139 ?auto_155140 ?auto_155143 ?auto_155138 ?auto_155142 ?auto_155141 )
      ( MAKE-2PILE ?auto_155135 ?auto_155136 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_155151 - BLOCK
      ?auto_155152 - BLOCK
      ?auto_155153 - BLOCK
      ?auto_155154 - BLOCK
      ?auto_155155 - BLOCK
      ?auto_155156 - BLOCK
      ?auto_155157 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_155157 ) ( CLEAR ?auto_155156 ) ( ON-TABLE ?auto_155151 ) ( ON ?auto_155152 ?auto_155151 ) ( ON ?auto_155153 ?auto_155152 ) ( ON ?auto_155154 ?auto_155153 ) ( ON ?auto_155155 ?auto_155154 ) ( ON ?auto_155156 ?auto_155155 ) ( not ( = ?auto_155151 ?auto_155152 ) ) ( not ( = ?auto_155151 ?auto_155153 ) ) ( not ( = ?auto_155151 ?auto_155154 ) ) ( not ( = ?auto_155151 ?auto_155155 ) ) ( not ( = ?auto_155151 ?auto_155156 ) ) ( not ( = ?auto_155151 ?auto_155157 ) ) ( not ( = ?auto_155152 ?auto_155153 ) ) ( not ( = ?auto_155152 ?auto_155154 ) ) ( not ( = ?auto_155152 ?auto_155155 ) ) ( not ( = ?auto_155152 ?auto_155156 ) ) ( not ( = ?auto_155152 ?auto_155157 ) ) ( not ( = ?auto_155153 ?auto_155154 ) ) ( not ( = ?auto_155153 ?auto_155155 ) ) ( not ( = ?auto_155153 ?auto_155156 ) ) ( not ( = ?auto_155153 ?auto_155157 ) ) ( not ( = ?auto_155154 ?auto_155155 ) ) ( not ( = ?auto_155154 ?auto_155156 ) ) ( not ( = ?auto_155154 ?auto_155157 ) ) ( not ( = ?auto_155155 ?auto_155156 ) ) ( not ( = ?auto_155155 ?auto_155157 ) ) ( not ( = ?auto_155156 ?auto_155157 ) ) )
    :subtasks
    ( ( !STACK ?auto_155157 ?auto_155156 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_155158 - BLOCK
      ?auto_155159 - BLOCK
      ?auto_155160 - BLOCK
      ?auto_155161 - BLOCK
      ?auto_155162 - BLOCK
      ?auto_155163 - BLOCK
      ?auto_155164 - BLOCK
    )
    :vars
    (
      ?auto_155165 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_155163 ) ( ON-TABLE ?auto_155158 ) ( ON ?auto_155159 ?auto_155158 ) ( ON ?auto_155160 ?auto_155159 ) ( ON ?auto_155161 ?auto_155160 ) ( ON ?auto_155162 ?auto_155161 ) ( ON ?auto_155163 ?auto_155162 ) ( not ( = ?auto_155158 ?auto_155159 ) ) ( not ( = ?auto_155158 ?auto_155160 ) ) ( not ( = ?auto_155158 ?auto_155161 ) ) ( not ( = ?auto_155158 ?auto_155162 ) ) ( not ( = ?auto_155158 ?auto_155163 ) ) ( not ( = ?auto_155158 ?auto_155164 ) ) ( not ( = ?auto_155159 ?auto_155160 ) ) ( not ( = ?auto_155159 ?auto_155161 ) ) ( not ( = ?auto_155159 ?auto_155162 ) ) ( not ( = ?auto_155159 ?auto_155163 ) ) ( not ( = ?auto_155159 ?auto_155164 ) ) ( not ( = ?auto_155160 ?auto_155161 ) ) ( not ( = ?auto_155160 ?auto_155162 ) ) ( not ( = ?auto_155160 ?auto_155163 ) ) ( not ( = ?auto_155160 ?auto_155164 ) ) ( not ( = ?auto_155161 ?auto_155162 ) ) ( not ( = ?auto_155161 ?auto_155163 ) ) ( not ( = ?auto_155161 ?auto_155164 ) ) ( not ( = ?auto_155162 ?auto_155163 ) ) ( not ( = ?auto_155162 ?auto_155164 ) ) ( not ( = ?auto_155163 ?auto_155164 ) ) ( ON ?auto_155164 ?auto_155165 ) ( CLEAR ?auto_155164 ) ( HAND-EMPTY ) ( not ( = ?auto_155158 ?auto_155165 ) ) ( not ( = ?auto_155159 ?auto_155165 ) ) ( not ( = ?auto_155160 ?auto_155165 ) ) ( not ( = ?auto_155161 ?auto_155165 ) ) ( not ( = ?auto_155162 ?auto_155165 ) ) ( not ( = ?auto_155163 ?auto_155165 ) ) ( not ( = ?auto_155164 ?auto_155165 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_155164 ?auto_155165 )
      ( MAKE-7PILE ?auto_155158 ?auto_155159 ?auto_155160 ?auto_155161 ?auto_155162 ?auto_155163 ?auto_155164 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_155166 - BLOCK
      ?auto_155167 - BLOCK
      ?auto_155168 - BLOCK
      ?auto_155169 - BLOCK
      ?auto_155170 - BLOCK
      ?auto_155171 - BLOCK
      ?auto_155172 - BLOCK
    )
    :vars
    (
      ?auto_155173 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_155166 ) ( ON ?auto_155167 ?auto_155166 ) ( ON ?auto_155168 ?auto_155167 ) ( ON ?auto_155169 ?auto_155168 ) ( ON ?auto_155170 ?auto_155169 ) ( not ( = ?auto_155166 ?auto_155167 ) ) ( not ( = ?auto_155166 ?auto_155168 ) ) ( not ( = ?auto_155166 ?auto_155169 ) ) ( not ( = ?auto_155166 ?auto_155170 ) ) ( not ( = ?auto_155166 ?auto_155171 ) ) ( not ( = ?auto_155166 ?auto_155172 ) ) ( not ( = ?auto_155167 ?auto_155168 ) ) ( not ( = ?auto_155167 ?auto_155169 ) ) ( not ( = ?auto_155167 ?auto_155170 ) ) ( not ( = ?auto_155167 ?auto_155171 ) ) ( not ( = ?auto_155167 ?auto_155172 ) ) ( not ( = ?auto_155168 ?auto_155169 ) ) ( not ( = ?auto_155168 ?auto_155170 ) ) ( not ( = ?auto_155168 ?auto_155171 ) ) ( not ( = ?auto_155168 ?auto_155172 ) ) ( not ( = ?auto_155169 ?auto_155170 ) ) ( not ( = ?auto_155169 ?auto_155171 ) ) ( not ( = ?auto_155169 ?auto_155172 ) ) ( not ( = ?auto_155170 ?auto_155171 ) ) ( not ( = ?auto_155170 ?auto_155172 ) ) ( not ( = ?auto_155171 ?auto_155172 ) ) ( ON ?auto_155172 ?auto_155173 ) ( CLEAR ?auto_155172 ) ( not ( = ?auto_155166 ?auto_155173 ) ) ( not ( = ?auto_155167 ?auto_155173 ) ) ( not ( = ?auto_155168 ?auto_155173 ) ) ( not ( = ?auto_155169 ?auto_155173 ) ) ( not ( = ?auto_155170 ?auto_155173 ) ) ( not ( = ?auto_155171 ?auto_155173 ) ) ( not ( = ?auto_155172 ?auto_155173 ) ) ( HOLDING ?auto_155171 ) ( CLEAR ?auto_155170 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_155166 ?auto_155167 ?auto_155168 ?auto_155169 ?auto_155170 ?auto_155171 )
      ( MAKE-7PILE ?auto_155166 ?auto_155167 ?auto_155168 ?auto_155169 ?auto_155170 ?auto_155171 ?auto_155172 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_155174 - BLOCK
      ?auto_155175 - BLOCK
      ?auto_155176 - BLOCK
      ?auto_155177 - BLOCK
      ?auto_155178 - BLOCK
      ?auto_155179 - BLOCK
      ?auto_155180 - BLOCK
    )
    :vars
    (
      ?auto_155181 - BLOCK
      ?auto_155182 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_155174 ) ( ON ?auto_155175 ?auto_155174 ) ( ON ?auto_155176 ?auto_155175 ) ( ON ?auto_155177 ?auto_155176 ) ( ON ?auto_155178 ?auto_155177 ) ( not ( = ?auto_155174 ?auto_155175 ) ) ( not ( = ?auto_155174 ?auto_155176 ) ) ( not ( = ?auto_155174 ?auto_155177 ) ) ( not ( = ?auto_155174 ?auto_155178 ) ) ( not ( = ?auto_155174 ?auto_155179 ) ) ( not ( = ?auto_155174 ?auto_155180 ) ) ( not ( = ?auto_155175 ?auto_155176 ) ) ( not ( = ?auto_155175 ?auto_155177 ) ) ( not ( = ?auto_155175 ?auto_155178 ) ) ( not ( = ?auto_155175 ?auto_155179 ) ) ( not ( = ?auto_155175 ?auto_155180 ) ) ( not ( = ?auto_155176 ?auto_155177 ) ) ( not ( = ?auto_155176 ?auto_155178 ) ) ( not ( = ?auto_155176 ?auto_155179 ) ) ( not ( = ?auto_155176 ?auto_155180 ) ) ( not ( = ?auto_155177 ?auto_155178 ) ) ( not ( = ?auto_155177 ?auto_155179 ) ) ( not ( = ?auto_155177 ?auto_155180 ) ) ( not ( = ?auto_155178 ?auto_155179 ) ) ( not ( = ?auto_155178 ?auto_155180 ) ) ( not ( = ?auto_155179 ?auto_155180 ) ) ( ON ?auto_155180 ?auto_155181 ) ( not ( = ?auto_155174 ?auto_155181 ) ) ( not ( = ?auto_155175 ?auto_155181 ) ) ( not ( = ?auto_155176 ?auto_155181 ) ) ( not ( = ?auto_155177 ?auto_155181 ) ) ( not ( = ?auto_155178 ?auto_155181 ) ) ( not ( = ?auto_155179 ?auto_155181 ) ) ( not ( = ?auto_155180 ?auto_155181 ) ) ( CLEAR ?auto_155178 ) ( ON ?auto_155179 ?auto_155180 ) ( CLEAR ?auto_155179 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_155182 ) ( ON ?auto_155181 ?auto_155182 ) ( not ( = ?auto_155182 ?auto_155181 ) ) ( not ( = ?auto_155182 ?auto_155180 ) ) ( not ( = ?auto_155182 ?auto_155179 ) ) ( not ( = ?auto_155174 ?auto_155182 ) ) ( not ( = ?auto_155175 ?auto_155182 ) ) ( not ( = ?auto_155176 ?auto_155182 ) ) ( not ( = ?auto_155177 ?auto_155182 ) ) ( not ( = ?auto_155178 ?auto_155182 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_155182 ?auto_155181 ?auto_155180 )
      ( MAKE-7PILE ?auto_155174 ?auto_155175 ?auto_155176 ?auto_155177 ?auto_155178 ?auto_155179 ?auto_155180 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_155183 - BLOCK
      ?auto_155184 - BLOCK
      ?auto_155185 - BLOCK
      ?auto_155186 - BLOCK
      ?auto_155187 - BLOCK
      ?auto_155188 - BLOCK
      ?auto_155189 - BLOCK
    )
    :vars
    (
      ?auto_155191 - BLOCK
      ?auto_155190 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_155183 ) ( ON ?auto_155184 ?auto_155183 ) ( ON ?auto_155185 ?auto_155184 ) ( ON ?auto_155186 ?auto_155185 ) ( not ( = ?auto_155183 ?auto_155184 ) ) ( not ( = ?auto_155183 ?auto_155185 ) ) ( not ( = ?auto_155183 ?auto_155186 ) ) ( not ( = ?auto_155183 ?auto_155187 ) ) ( not ( = ?auto_155183 ?auto_155188 ) ) ( not ( = ?auto_155183 ?auto_155189 ) ) ( not ( = ?auto_155184 ?auto_155185 ) ) ( not ( = ?auto_155184 ?auto_155186 ) ) ( not ( = ?auto_155184 ?auto_155187 ) ) ( not ( = ?auto_155184 ?auto_155188 ) ) ( not ( = ?auto_155184 ?auto_155189 ) ) ( not ( = ?auto_155185 ?auto_155186 ) ) ( not ( = ?auto_155185 ?auto_155187 ) ) ( not ( = ?auto_155185 ?auto_155188 ) ) ( not ( = ?auto_155185 ?auto_155189 ) ) ( not ( = ?auto_155186 ?auto_155187 ) ) ( not ( = ?auto_155186 ?auto_155188 ) ) ( not ( = ?auto_155186 ?auto_155189 ) ) ( not ( = ?auto_155187 ?auto_155188 ) ) ( not ( = ?auto_155187 ?auto_155189 ) ) ( not ( = ?auto_155188 ?auto_155189 ) ) ( ON ?auto_155189 ?auto_155191 ) ( not ( = ?auto_155183 ?auto_155191 ) ) ( not ( = ?auto_155184 ?auto_155191 ) ) ( not ( = ?auto_155185 ?auto_155191 ) ) ( not ( = ?auto_155186 ?auto_155191 ) ) ( not ( = ?auto_155187 ?auto_155191 ) ) ( not ( = ?auto_155188 ?auto_155191 ) ) ( not ( = ?auto_155189 ?auto_155191 ) ) ( ON ?auto_155188 ?auto_155189 ) ( CLEAR ?auto_155188 ) ( ON-TABLE ?auto_155190 ) ( ON ?auto_155191 ?auto_155190 ) ( not ( = ?auto_155190 ?auto_155191 ) ) ( not ( = ?auto_155190 ?auto_155189 ) ) ( not ( = ?auto_155190 ?auto_155188 ) ) ( not ( = ?auto_155183 ?auto_155190 ) ) ( not ( = ?auto_155184 ?auto_155190 ) ) ( not ( = ?auto_155185 ?auto_155190 ) ) ( not ( = ?auto_155186 ?auto_155190 ) ) ( not ( = ?auto_155187 ?auto_155190 ) ) ( HOLDING ?auto_155187 ) ( CLEAR ?auto_155186 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_155183 ?auto_155184 ?auto_155185 ?auto_155186 ?auto_155187 )
      ( MAKE-7PILE ?auto_155183 ?auto_155184 ?auto_155185 ?auto_155186 ?auto_155187 ?auto_155188 ?auto_155189 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_155192 - BLOCK
      ?auto_155193 - BLOCK
      ?auto_155194 - BLOCK
      ?auto_155195 - BLOCK
      ?auto_155196 - BLOCK
      ?auto_155197 - BLOCK
      ?auto_155198 - BLOCK
    )
    :vars
    (
      ?auto_155200 - BLOCK
      ?auto_155199 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_155192 ) ( ON ?auto_155193 ?auto_155192 ) ( ON ?auto_155194 ?auto_155193 ) ( ON ?auto_155195 ?auto_155194 ) ( not ( = ?auto_155192 ?auto_155193 ) ) ( not ( = ?auto_155192 ?auto_155194 ) ) ( not ( = ?auto_155192 ?auto_155195 ) ) ( not ( = ?auto_155192 ?auto_155196 ) ) ( not ( = ?auto_155192 ?auto_155197 ) ) ( not ( = ?auto_155192 ?auto_155198 ) ) ( not ( = ?auto_155193 ?auto_155194 ) ) ( not ( = ?auto_155193 ?auto_155195 ) ) ( not ( = ?auto_155193 ?auto_155196 ) ) ( not ( = ?auto_155193 ?auto_155197 ) ) ( not ( = ?auto_155193 ?auto_155198 ) ) ( not ( = ?auto_155194 ?auto_155195 ) ) ( not ( = ?auto_155194 ?auto_155196 ) ) ( not ( = ?auto_155194 ?auto_155197 ) ) ( not ( = ?auto_155194 ?auto_155198 ) ) ( not ( = ?auto_155195 ?auto_155196 ) ) ( not ( = ?auto_155195 ?auto_155197 ) ) ( not ( = ?auto_155195 ?auto_155198 ) ) ( not ( = ?auto_155196 ?auto_155197 ) ) ( not ( = ?auto_155196 ?auto_155198 ) ) ( not ( = ?auto_155197 ?auto_155198 ) ) ( ON ?auto_155198 ?auto_155200 ) ( not ( = ?auto_155192 ?auto_155200 ) ) ( not ( = ?auto_155193 ?auto_155200 ) ) ( not ( = ?auto_155194 ?auto_155200 ) ) ( not ( = ?auto_155195 ?auto_155200 ) ) ( not ( = ?auto_155196 ?auto_155200 ) ) ( not ( = ?auto_155197 ?auto_155200 ) ) ( not ( = ?auto_155198 ?auto_155200 ) ) ( ON ?auto_155197 ?auto_155198 ) ( ON-TABLE ?auto_155199 ) ( ON ?auto_155200 ?auto_155199 ) ( not ( = ?auto_155199 ?auto_155200 ) ) ( not ( = ?auto_155199 ?auto_155198 ) ) ( not ( = ?auto_155199 ?auto_155197 ) ) ( not ( = ?auto_155192 ?auto_155199 ) ) ( not ( = ?auto_155193 ?auto_155199 ) ) ( not ( = ?auto_155194 ?auto_155199 ) ) ( not ( = ?auto_155195 ?auto_155199 ) ) ( not ( = ?auto_155196 ?auto_155199 ) ) ( CLEAR ?auto_155195 ) ( ON ?auto_155196 ?auto_155197 ) ( CLEAR ?auto_155196 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_155199 ?auto_155200 ?auto_155198 ?auto_155197 )
      ( MAKE-7PILE ?auto_155192 ?auto_155193 ?auto_155194 ?auto_155195 ?auto_155196 ?auto_155197 ?auto_155198 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_155201 - BLOCK
      ?auto_155202 - BLOCK
      ?auto_155203 - BLOCK
      ?auto_155204 - BLOCK
      ?auto_155205 - BLOCK
      ?auto_155206 - BLOCK
      ?auto_155207 - BLOCK
    )
    :vars
    (
      ?auto_155208 - BLOCK
      ?auto_155209 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_155201 ) ( ON ?auto_155202 ?auto_155201 ) ( ON ?auto_155203 ?auto_155202 ) ( not ( = ?auto_155201 ?auto_155202 ) ) ( not ( = ?auto_155201 ?auto_155203 ) ) ( not ( = ?auto_155201 ?auto_155204 ) ) ( not ( = ?auto_155201 ?auto_155205 ) ) ( not ( = ?auto_155201 ?auto_155206 ) ) ( not ( = ?auto_155201 ?auto_155207 ) ) ( not ( = ?auto_155202 ?auto_155203 ) ) ( not ( = ?auto_155202 ?auto_155204 ) ) ( not ( = ?auto_155202 ?auto_155205 ) ) ( not ( = ?auto_155202 ?auto_155206 ) ) ( not ( = ?auto_155202 ?auto_155207 ) ) ( not ( = ?auto_155203 ?auto_155204 ) ) ( not ( = ?auto_155203 ?auto_155205 ) ) ( not ( = ?auto_155203 ?auto_155206 ) ) ( not ( = ?auto_155203 ?auto_155207 ) ) ( not ( = ?auto_155204 ?auto_155205 ) ) ( not ( = ?auto_155204 ?auto_155206 ) ) ( not ( = ?auto_155204 ?auto_155207 ) ) ( not ( = ?auto_155205 ?auto_155206 ) ) ( not ( = ?auto_155205 ?auto_155207 ) ) ( not ( = ?auto_155206 ?auto_155207 ) ) ( ON ?auto_155207 ?auto_155208 ) ( not ( = ?auto_155201 ?auto_155208 ) ) ( not ( = ?auto_155202 ?auto_155208 ) ) ( not ( = ?auto_155203 ?auto_155208 ) ) ( not ( = ?auto_155204 ?auto_155208 ) ) ( not ( = ?auto_155205 ?auto_155208 ) ) ( not ( = ?auto_155206 ?auto_155208 ) ) ( not ( = ?auto_155207 ?auto_155208 ) ) ( ON ?auto_155206 ?auto_155207 ) ( ON-TABLE ?auto_155209 ) ( ON ?auto_155208 ?auto_155209 ) ( not ( = ?auto_155209 ?auto_155208 ) ) ( not ( = ?auto_155209 ?auto_155207 ) ) ( not ( = ?auto_155209 ?auto_155206 ) ) ( not ( = ?auto_155201 ?auto_155209 ) ) ( not ( = ?auto_155202 ?auto_155209 ) ) ( not ( = ?auto_155203 ?auto_155209 ) ) ( not ( = ?auto_155204 ?auto_155209 ) ) ( not ( = ?auto_155205 ?auto_155209 ) ) ( ON ?auto_155205 ?auto_155206 ) ( CLEAR ?auto_155205 ) ( HOLDING ?auto_155204 ) ( CLEAR ?auto_155203 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_155201 ?auto_155202 ?auto_155203 ?auto_155204 )
      ( MAKE-7PILE ?auto_155201 ?auto_155202 ?auto_155203 ?auto_155204 ?auto_155205 ?auto_155206 ?auto_155207 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_155210 - BLOCK
      ?auto_155211 - BLOCK
      ?auto_155212 - BLOCK
      ?auto_155213 - BLOCK
      ?auto_155214 - BLOCK
      ?auto_155215 - BLOCK
      ?auto_155216 - BLOCK
    )
    :vars
    (
      ?auto_155217 - BLOCK
      ?auto_155218 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_155210 ) ( ON ?auto_155211 ?auto_155210 ) ( ON ?auto_155212 ?auto_155211 ) ( not ( = ?auto_155210 ?auto_155211 ) ) ( not ( = ?auto_155210 ?auto_155212 ) ) ( not ( = ?auto_155210 ?auto_155213 ) ) ( not ( = ?auto_155210 ?auto_155214 ) ) ( not ( = ?auto_155210 ?auto_155215 ) ) ( not ( = ?auto_155210 ?auto_155216 ) ) ( not ( = ?auto_155211 ?auto_155212 ) ) ( not ( = ?auto_155211 ?auto_155213 ) ) ( not ( = ?auto_155211 ?auto_155214 ) ) ( not ( = ?auto_155211 ?auto_155215 ) ) ( not ( = ?auto_155211 ?auto_155216 ) ) ( not ( = ?auto_155212 ?auto_155213 ) ) ( not ( = ?auto_155212 ?auto_155214 ) ) ( not ( = ?auto_155212 ?auto_155215 ) ) ( not ( = ?auto_155212 ?auto_155216 ) ) ( not ( = ?auto_155213 ?auto_155214 ) ) ( not ( = ?auto_155213 ?auto_155215 ) ) ( not ( = ?auto_155213 ?auto_155216 ) ) ( not ( = ?auto_155214 ?auto_155215 ) ) ( not ( = ?auto_155214 ?auto_155216 ) ) ( not ( = ?auto_155215 ?auto_155216 ) ) ( ON ?auto_155216 ?auto_155217 ) ( not ( = ?auto_155210 ?auto_155217 ) ) ( not ( = ?auto_155211 ?auto_155217 ) ) ( not ( = ?auto_155212 ?auto_155217 ) ) ( not ( = ?auto_155213 ?auto_155217 ) ) ( not ( = ?auto_155214 ?auto_155217 ) ) ( not ( = ?auto_155215 ?auto_155217 ) ) ( not ( = ?auto_155216 ?auto_155217 ) ) ( ON ?auto_155215 ?auto_155216 ) ( ON-TABLE ?auto_155218 ) ( ON ?auto_155217 ?auto_155218 ) ( not ( = ?auto_155218 ?auto_155217 ) ) ( not ( = ?auto_155218 ?auto_155216 ) ) ( not ( = ?auto_155218 ?auto_155215 ) ) ( not ( = ?auto_155210 ?auto_155218 ) ) ( not ( = ?auto_155211 ?auto_155218 ) ) ( not ( = ?auto_155212 ?auto_155218 ) ) ( not ( = ?auto_155213 ?auto_155218 ) ) ( not ( = ?auto_155214 ?auto_155218 ) ) ( ON ?auto_155214 ?auto_155215 ) ( CLEAR ?auto_155212 ) ( ON ?auto_155213 ?auto_155214 ) ( CLEAR ?auto_155213 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_155218 ?auto_155217 ?auto_155216 ?auto_155215 ?auto_155214 )
      ( MAKE-7PILE ?auto_155210 ?auto_155211 ?auto_155212 ?auto_155213 ?auto_155214 ?auto_155215 ?auto_155216 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_155219 - BLOCK
      ?auto_155220 - BLOCK
      ?auto_155221 - BLOCK
      ?auto_155222 - BLOCK
      ?auto_155223 - BLOCK
      ?auto_155224 - BLOCK
      ?auto_155225 - BLOCK
    )
    :vars
    (
      ?auto_155227 - BLOCK
      ?auto_155226 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_155219 ) ( ON ?auto_155220 ?auto_155219 ) ( not ( = ?auto_155219 ?auto_155220 ) ) ( not ( = ?auto_155219 ?auto_155221 ) ) ( not ( = ?auto_155219 ?auto_155222 ) ) ( not ( = ?auto_155219 ?auto_155223 ) ) ( not ( = ?auto_155219 ?auto_155224 ) ) ( not ( = ?auto_155219 ?auto_155225 ) ) ( not ( = ?auto_155220 ?auto_155221 ) ) ( not ( = ?auto_155220 ?auto_155222 ) ) ( not ( = ?auto_155220 ?auto_155223 ) ) ( not ( = ?auto_155220 ?auto_155224 ) ) ( not ( = ?auto_155220 ?auto_155225 ) ) ( not ( = ?auto_155221 ?auto_155222 ) ) ( not ( = ?auto_155221 ?auto_155223 ) ) ( not ( = ?auto_155221 ?auto_155224 ) ) ( not ( = ?auto_155221 ?auto_155225 ) ) ( not ( = ?auto_155222 ?auto_155223 ) ) ( not ( = ?auto_155222 ?auto_155224 ) ) ( not ( = ?auto_155222 ?auto_155225 ) ) ( not ( = ?auto_155223 ?auto_155224 ) ) ( not ( = ?auto_155223 ?auto_155225 ) ) ( not ( = ?auto_155224 ?auto_155225 ) ) ( ON ?auto_155225 ?auto_155227 ) ( not ( = ?auto_155219 ?auto_155227 ) ) ( not ( = ?auto_155220 ?auto_155227 ) ) ( not ( = ?auto_155221 ?auto_155227 ) ) ( not ( = ?auto_155222 ?auto_155227 ) ) ( not ( = ?auto_155223 ?auto_155227 ) ) ( not ( = ?auto_155224 ?auto_155227 ) ) ( not ( = ?auto_155225 ?auto_155227 ) ) ( ON ?auto_155224 ?auto_155225 ) ( ON-TABLE ?auto_155226 ) ( ON ?auto_155227 ?auto_155226 ) ( not ( = ?auto_155226 ?auto_155227 ) ) ( not ( = ?auto_155226 ?auto_155225 ) ) ( not ( = ?auto_155226 ?auto_155224 ) ) ( not ( = ?auto_155219 ?auto_155226 ) ) ( not ( = ?auto_155220 ?auto_155226 ) ) ( not ( = ?auto_155221 ?auto_155226 ) ) ( not ( = ?auto_155222 ?auto_155226 ) ) ( not ( = ?auto_155223 ?auto_155226 ) ) ( ON ?auto_155223 ?auto_155224 ) ( ON ?auto_155222 ?auto_155223 ) ( CLEAR ?auto_155222 ) ( HOLDING ?auto_155221 ) ( CLEAR ?auto_155220 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_155219 ?auto_155220 ?auto_155221 )
      ( MAKE-7PILE ?auto_155219 ?auto_155220 ?auto_155221 ?auto_155222 ?auto_155223 ?auto_155224 ?auto_155225 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_155228 - BLOCK
      ?auto_155229 - BLOCK
      ?auto_155230 - BLOCK
      ?auto_155231 - BLOCK
      ?auto_155232 - BLOCK
      ?auto_155233 - BLOCK
      ?auto_155234 - BLOCK
    )
    :vars
    (
      ?auto_155235 - BLOCK
      ?auto_155236 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_155228 ) ( ON ?auto_155229 ?auto_155228 ) ( not ( = ?auto_155228 ?auto_155229 ) ) ( not ( = ?auto_155228 ?auto_155230 ) ) ( not ( = ?auto_155228 ?auto_155231 ) ) ( not ( = ?auto_155228 ?auto_155232 ) ) ( not ( = ?auto_155228 ?auto_155233 ) ) ( not ( = ?auto_155228 ?auto_155234 ) ) ( not ( = ?auto_155229 ?auto_155230 ) ) ( not ( = ?auto_155229 ?auto_155231 ) ) ( not ( = ?auto_155229 ?auto_155232 ) ) ( not ( = ?auto_155229 ?auto_155233 ) ) ( not ( = ?auto_155229 ?auto_155234 ) ) ( not ( = ?auto_155230 ?auto_155231 ) ) ( not ( = ?auto_155230 ?auto_155232 ) ) ( not ( = ?auto_155230 ?auto_155233 ) ) ( not ( = ?auto_155230 ?auto_155234 ) ) ( not ( = ?auto_155231 ?auto_155232 ) ) ( not ( = ?auto_155231 ?auto_155233 ) ) ( not ( = ?auto_155231 ?auto_155234 ) ) ( not ( = ?auto_155232 ?auto_155233 ) ) ( not ( = ?auto_155232 ?auto_155234 ) ) ( not ( = ?auto_155233 ?auto_155234 ) ) ( ON ?auto_155234 ?auto_155235 ) ( not ( = ?auto_155228 ?auto_155235 ) ) ( not ( = ?auto_155229 ?auto_155235 ) ) ( not ( = ?auto_155230 ?auto_155235 ) ) ( not ( = ?auto_155231 ?auto_155235 ) ) ( not ( = ?auto_155232 ?auto_155235 ) ) ( not ( = ?auto_155233 ?auto_155235 ) ) ( not ( = ?auto_155234 ?auto_155235 ) ) ( ON ?auto_155233 ?auto_155234 ) ( ON-TABLE ?auto_155236 ) ( ON ?auto_155235 ?auto_155236 ) ( not ( = ?auto_155236 ?auto_155235 ) ) ( not ( = ?auto_155236 ?auto_155234 ) ) ( not ( = ?auto_155236 ?auto_155233 ) ) ( not ( = ?auto_155228 ?auto_155236 ) ) ( not ( = ?auto_155229 ?auto_155236 ) ) ( not ( = ?auto_155230 ?auto_155236 ) ) ( not ( = ?auto_155231 ?auto_155236 ) ) ( not ( = ?auto_155232 ?auto_155236 ) ) ( ON ?auto_155232 ?auto_155233 ) ( ON ?auto_155231 ?auto_155232 ) ( CLEAR ?auto_155229 ) ( ON ?auto_155230 ?auto_155231 ) ( CLEAR ?auto_155230 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_155236 ?auto_155235 ?auto_155234 ?auto_155233 ?auto_155232 ?auto_155231 )
      ( MAKE-7PILE ?auto_155228 ?auto_155229 ?auto_155230 ?auto_155231 ?auto_155232 ?auto_155233 ?auto_155234 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_155237 - BLOCK
      ?auto_155238 - BLOCK
      ?auto_155239 - BLOCK
      ?auto_155240 - BLOCK
      ?auto_155241 - BLOCK
      ?auto_155242 - BLOCK
      ?auto_155243 - BLOCK
    )
    :vars
    (
      ?auto_155245 - BLOCK
      ?auto_155244 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_155237 ) ( not ( = ?auto_155237 ?auto_155238 ) ) ( not ( = ?auto_155237 ?auto_155239 ) ) ( not ( = ?auto_155237 ?auto_155240 ) ) ( not ( = ?auto_155237 ?auto_155241 ) ) ( not ( = ?auto_155237 ?auto_155242 ) ) ( not ( = ?auto_155237 ?auto_155243 ) ) ( not ( = ?auto_155238 ?auto_155239 ) ) ( not ( = ?auto_155238 ?auto_155240 ) ) ( not ( = ?auto_155238 ?auto_155241 ) ) ( not ( = ?auto_155238 ?auto_155242 ) ) ( not ( = ?auto_155238 ?auto_155243 ) ) ( not ( = ?auto_155239 ?auto_155240 ) ) ( not ( = ?auto_155239 ?auto_155241 ) ) ( not ( = ?auto_155239 ?auto_155242 ) ) ( not ( = ?auto_155239 ?auto_155243 ) ) ( not ( = ?auto_155240 ?auto_155241 ) ) ( not ( = ?auto_155240 ?auto_155242 ) ) ( not ( = ?auto_155240 ?auto_155243 ) ) ( not ( = ?auto_155241 ?auto_155242 ) ) ( not ( = ?auto_155241 ?auto_155243 ) ) ( not ( = ?auto_155242 ?auto_155243 ) ) ( ON ?auto_155243 ?auto_155245 ) ( not ( = ?auto_155237 ?auto_155245 ) ) ( not ( = ?auto_155238 ?auto_155245 ) ) ( not ( = ?auto_155239 ?auto_155245 ) ) ( not ( = ?auto_155240 ?auto_155245 ) ) ( not ( = ?auto_155241 ?auto_155245 ) ) ( not ( = ?auto_155242 ?auto_155245 ) ) ( not ( = ?auto_155243 ?auto_155245 ) ) ( ON ?auto_155242 ?auto_155243 ) ( ON-TABLE ?auto_155244 ) ( ON ?auto_155245 ?auto_155244 ) ( not ( = ?auto_155244 ?auto_155245 ) ) ( not ( = ?auto_155244 ?auto_155243 ) ) ( not ( = ?auto_155244 ?auto_155242 ) ) ( not ( = ?auto_155237 ?auto_155244 ) ) ( not ( = ?auto_155238 ?auto_155244 ) ) ( not ( = ?auto_155239 ?auto_155244 ) ) ( not ( = ?auto_155240 ?auto_155244 ) ) ( not ( = ?auto_155241 ?auto_155244 ) ) ( ON ?auto_155241 ?auto_155242 ) ( ON ?auto_155240 ?auto_155241 ) ( ON ?auto_155239 ?auto_155240 ) ( CLEAR ?auto_155239 ) ( HOLDING ?auto_155238 ) ( CLEAR ?auto_155237 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_155237 ?auto_155238 )
      ( MAKE-7PILE ?auto_155237 ?auto_155238 ?auto_155239 ?auto_155240 ?auto_155241 ?auto_155242 ?auto_155243 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_155246 - BLOCK
      ?auto_155247 - BLOCK
      ?auto_155248 - BLOCK
      ?auto_155249 - BLOCK
      ?auto_155250 - BLOCK
      ?auto_155251 - BLOCK
      ?auto_155252 - BLOCK
    )
    :vars
    (
      ?auto_155254 - BLOCK
      ?auto_155253 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_155246 ) ( not ( = ?auto_155246 ?auto_155247 ) ) ( not ( = ?auto_155246 ?auto_155248 ) ) ( not ( = ?auto_155246 ?auto_155249 ) ) ( not ( = ?auto_155246 ?auto_155250 ) ) ( not ( = ?auto_155246 ?auto_155251 ) ) ( not ( = ?auto_155246 ?auto_155252 ) ) ( not ( = ?auto_155247 ?auto_155248 ) ) ( not ( = ?auto_155247 ?auto_155249 ) ) ( not ( = ?auto_155247 ?auto_155250 ) ) ( not ( = ?auto_155247 ?auto_155251 ) ) ( not ( = ?auto_155247 ?auto_155252 ) ) ( not ( = ?auto_155248 ?auto_155249 ) ) ( not ( = ?auto_155248 ?auto_155250 ) ) ( not ( = ?auto_155248 ?auto_155251 ) ) ( not ( = ?auto_155248 ?auto_155252 ) ) ( not ( = ?auto_155249 ?auto_155250 ) ) ( not ( = ?auto_155249 ?auto_155251 ) ) ( not ( = ?auto_155249 ?auto_155252 ) ) ( not ( = ?auto_155250 ?auto_155251 ) ) ( not ( = ?auto_155250 ?auto_155252 ) ) ( not ( = ?auto_155251 ?auto_155252 ) ) ( ON ?auto_155252 ?auto_155254 ) ( not ( = ?auto_155246 ?auto_155254 ) ) ( not ( = ?auto_155247 ?auto_155254 ) ) ( not ( = ?auto_155248 ?auto_155254 ) ) ( not ( = ?auto_155249 ?auto_155254 ) ) ( not ( = ?auto_155250 ?auto_155254 ) ) ( not ( = ?auto_155251 ?auto_155254 ) ) ( not ( = ?auto_155252 ?auto_155254 ) ) ( ON ?auto_155251 ?auto_155252 ) ( ON-TABLE ?auto_155253 ) ( ON ?auto_155254 ?auto_155253 ) ( not ( = ?auto_155253 ?auto_155254 ) ) ( not ( = ?auto_155253 ?auto_155252 ) ) ( not ( = ?auto_155253 ?auto_155251 ) ) ( not ( = ?auto_155246 ?auto_155253 ) ) ( not ( = ?auto_155247 ?auto_155253 ) ) ( not ( = ?auto_155248 ?auto_155253 ) ) ( not ( = ?auto_155249 ?auto_155253 ) ) ( not ( = ?auto_155250 ?auto_155253 ) ) ( ON ?auto_155250 ?auto_155251 ) ( ON ?auto_155249 ?auto_155250 ) ( ON ?auto_155248 ?auto_155249 ) ( CLEAR ?auto_155246 ) ( ON ?auto_155247 ?auto_155248 ) ( CLEAR ?auto_155247 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_155253 ?auto_155254 ?auto_155252 ?auto_155251 ?auto_155250 ?auto_155249 ?auto_155248 )
      ( MAKE-7PILE ?auto_155246 ?auto_155247 ?auto_155248 ?auto_155249 ?auto_155250 ?auto_155251 ?auto_155252 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_155255 - BLOCK
      ?auto_155256 - BLOCK
      ?auto_155257 - BLOCK
      ?auto_155258 - BLOCK
      ?auto_155259 - BLOCK
      ?auto_155260 - BLOCK
      ?auto_155261 - BLOCK
    )
    :vars
    (
      ?auto_155263 - BLOCK
      ?auto_155262 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_155255 ?auto_155256 ) ) ( not ( = ?auto_155255 ?auto_155257 ) ) ( not ( = ?auto_155255 ?auto_155258 ) ) ( not ( = ?auto_155255 ?auto_155259 ) ) ( not ( = ?auto_155255 ?auto_155260 ) ) ( not ( = ?auto_155255 ?auto_155261 ) ) ( not ( = ?auto_155256 ?auto_155257 ) ) ( not ( = ?auto_155256 ?auto_155258 ) ) ( not ( = ?auto_155256 ?auto_155259 ) ) ( not ( = ?auto_155256 ?auto_155260 ) ) ( not ( = ?auto_155256 ?auto_155261 ) ) ( not ( = ?auto_155257 ?auto_155258 ) ) ( not ( = ?auto_155257 ?auto_155259 ) ) ( not ( = ?auto_155257 ?auto_155260 ) ) ( not ( = ?auto_155257 ?auto_155261 ) ) ( not ( = ?auto_155258 ?auto_155259 ) ) ( not ( = ?auto_155258 ?auto_155260 ) ) ( not ( = ?auto_155258 ?auto_155261 ) ) ( not ( = ?auto_155259 ?auto_155260 ) ) ( not ( = ?auto_155259 ?auto_155261 ) ) ( not ( = ?auto_155260 ?auto_155261 ) ) ( ON ?auto_155261 ?auto_155263 ) ( not ( = ?auto_155255 ?auto_155263 ) ) ( not ( = ?auto_155256 ?auto_155263 ) ) ( not ( = ?auto_155257 ?auto_155263 ) ) ( not ( = ?auto_155258 ?auto_155263 ) ) ( not ( = ?auto_155259 ?auto_155263 ) ) ( not ( = ?auto_155260 ?auto_155263 ) ) ( not ( = ?auto_155261 ?auto_155263 ) ) ( ON ?auto_155260 ?auto_155261 ) ( ON-TABLE ?auto_155262 ) ( ON ?auto_155263 ?auto_155262 ) ( not ( = ?auto_155262 ?auto_155263 ) ) ( not ( = ?auto_155262 ?auto_155261 ) ) ( not ( = ?auto_155262 ?auto_155260 ) ) ( not ( = ?auto_155255 ?auto_155262 ) ) ( not ( = ?auto_155256 ?auto_155262 ) ) ( not ( = ?auto_155257 ?auto_155262 ) ) ( not ( = ?auto_155258 ?auto_155262 ) ) ( not ( = ?auto_155259 ?auto_155262 ) ) ( ON ?auto_155259 ?auto_155260 ) ( ON ?auto_155258 ?auto_155259 ) ( ON ?auto_155257 ?auto_155258 ) ( ON ?auto_155256 ?auto_155257 ) ( CLEAR ?auto_155256 ) ( HOLDING ?auto_155255 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_155255 )
      ( MAKE-7PILE ?auto_155255 ?auto_155256 ?auto_155257 ?auto_155258 ?auto_155259 ?auto_155260 ?auto_155261 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_155264 - BLOCK
      ?auto_155265 - BLOCK
      ?auto_155266 - BLOCK
      ?auto_155267 - BLOCK
      ?auto_155268 - BLOCK
      ?auto_155269 - BLOCK
      ?auto_155270 - BLOCK
    )
    :vars
    (
      ?auto_155271 - BLOCK
      ?auto_155272 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_155264 ?auto_155265 ) ) ( not ( = ?auto_155264 ?auto_155266 ) ) ( not ( = ?auto_155264 ?auto_155267 ) ) ( not ( = ?auto_155264 ?auto_155268 ) ) ( not ( = ?auto_155264 ?auto_155269 ) ) ( not ( = ?auto_155264 ?auto_155270 ) ) ( not ( = ?auto_155265 ?auto_155266 ) ) ( not ( = ?auto_155265 ?auto_155267 ) ) ( not ( = ?auto_155265 ?auto_155268 ) ) ( not ( = ?auto_155265 ?auto_155269 ) ) ( not ( = ?auto_155265 ?auto_155270 ) ) ( not ( = ?auto_155266 ?auto_155267 ) ) ( not ( = ?auto_155266 ?auto_155268 ) ) ( not ( = ?auto_155266 ?auto_155269 ) ) ( not ( = ?auto_155266 ?auto_155270 ) ) ( not ( = ?auto_155267 ?auto_155268 ) ) ( not ( = ?auto_155267 ?auto_155269 ) ) ( not ( = ?auto_155267 ?auto_155270 ) ) ( not ( = ?auto_155268 ?auto_155269 ) ) ( not ( = ?auto_155268 ?auto_155270 ) ) ( not ( = ?auto_155269 ?auto_155270 ) ) ( ON ?auto_155270 ?auto_155271 ) ( not ( = ?auto_155264 ?auto_155271 ) ) ( not ( = ?auto_155265 ?auto_155271 ) ) ( not ( = ?auto_155266 ?auto_155271 ) ) ( not ( = ?auto_155267 ?auto_155271 ) ) ( not ( = ?auto_155268 ?auto_155271 ) ) ( not ( = ?auto_155269 ?auto_155271 ) ) ( not ( = ?auto_155270 ?auto_155271 ) ) ( ON ?auto_155269 ?auto_155270 ) ( ON-TABLE ?auto_155272 ) ( ON ?auto_155271 ?auto_155272 ) ( not ( = ?auto_155272 ?auto_155271 ) ) ( not ( = ?auto_155272 ?auto_155270 ) ) ( not ( = ?auto_155272 ?auto_155269 ) ) ( not ( = ?auto_155264 ?auto_155272 ) ) ( not ( = ?auto_155265 ?auto_155272 ) ) ( not ( = ?auto_155266 ?auto_155272 ) ) ( not ( = ?auto_155267 ?auto_155272 ) ) ( not ( = ?auto_155268 ?auto_155272 ) ) ( ON ?auto_155268 ?auto_155269 ) ( ON ?auto_155267 ?auto_155268 ) ( ON ?auto_155266 ?auto_155267 ) ( ON ?auto_155265 ?auto_155266 ) ( ON ?auto_155264 ?auto_155265 ) ( CLEAR ?auto_155264 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_155272 ?auto_155271 ?auto_155270 ?auto_155269 ?auto_155268 ?auto_155267 ?auto_155266 ?auto_155265 )
      ( MAKE-7PILE ?auto_155264 ?auto_155265 ?auto_155266 ?auto_155267 ?auto_155268 ?auto_155269 ?auto_155270 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_155274 - BLOCK
    )
    :vars
    (
      ?auto_155275 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_155275 ?auto_155274 ) ( CLEAR ?auto_155275 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_155274 ) ( not ( = ?auto_155274 ?auto_155275 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_155275 ?auto_155274 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_155276 - BLOCK
    )
    :vars
    (
      ?auto_155277 - BLOCK
      ?auto_155278 - BLOCK
      ?auto_155279 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_155277 ?auto_155276 ) ( CLEAR ?auto_155277 ) ( ON-TABLE ?auto_155276 ) ( not ( = ?auto_155276 ?auto_155277 ) ) ( HOLDING ?auto_155278 ) ( CLEAR ?auto_155279 ) ( not ( = ?auto_155276 ?auto_155278 ) ) ( not ( = ?auto_155276 ?auto_155279 ) ) ( not ( = ?auto_155277 ?auto_155278 ) ) ( not ( = ?auto_155277 ?auto_155279 ) ) ( not ( = ?auto_155278 ?auto_155279 ) ) )
    :subtasks
    ( ( !STACK ?auto_155278 ?auto_155279 )
      ( MAKE-1PILE ?auto_155276 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_155280 - BLOCK
    )
    :vars
    (
      ?auto_155281 - BLOCK
      ?auto_155283 - BLOCK
      ?auto_155282 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_155281 ?auto_155280 ) ( ON-TABLE ?auto_155280 ) ( not ( = ?auto_155280 ?auto_155281 ) ) ( CLEAR ?auto_155283 ) ( not ( = ?auto_155280 ?auto_155282 ) ) ( not ( = ?auto_155280 ?auto_155283 ) ) ( not ( = ?auto_155281 ?auto_155282 ) ) ( not ( = ?auto_155281 ?auto_155283 ) ) ( not ( = ?auto_155282 ?auto_155283 ) ) ( ON ?auto_155282 ?auto_155281 ) ( CLEAR ?auto_155282 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_155280 ?auto_155281 )
      ( MAKE-1PILE ?auto_155280 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_155284 - BLOCK
    )
    :vars
    (
      ?auto_155286 - BLOCK
      ?auto_155287 - BLOCK
      ?auto_155285 - BLOCK
      ?auto_155292 - BLOCK
      ?auto_155291 - BLOCK
      ?auto_155289 - BLOCK
      ?auto_155290 - BLOCK
      ?auto_155288 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_155286 ?auto_155284 ) ( ON-TABLE ?auto_155284 ) ( not ( = ?auto_155284 ?auto_155286 ) ) ( not ( = ?auto_155284 ?auto_155287 ) ) ( not ( = ?auto_155284 ?auto_155285 ) ) ( not ( = ?auto_155286 ?auto_155287 ) ) ( not ( = ?auto_155286 ?auto_155285 ) ) ( not ( = ?auto_155287 ?auto_155285 ) ) ( ON ?auto_155287 ?auto_155286 ) ( CLEAR ?auto_155287 ) ( HOLDING ?auto_155285 ) ( CLEAR ?auto_155292 ) ( ON-TABLE ?auto_155291 ) ( ON ?auto_155289 ?auto_155291 ) ( ON ?auto_155290 ?auto_155289 ) ( ON ?auto_155288 ?auto_155290 ) ( ON ?auto_155292 ?auto_155288 ) ( not ( = ?auto_155291 ?auto_155289 ) ) ( not ( = ?auto_155291 ?auto_155290 ) ) ( not ( = ?auto_155291 ?auto_155288 ) ) ( not ( = ?auto_155291 ?auto_155292 ) ) ( not ( = ?auto_155291 ?auto_155285 ) ) ( not ( = ?auto_155289 ?auto_155290 ) ) ( not ( = ?auto_155289 ?auto_155288 ) ) ( not ( = ?auto_155289 ?auto_155292 ) ) ( not ( = ?auto_155289 ?auto_155285 ) ) ( not ( = ?auto_155290 ?auto_155288 ) ) ( not ( = ?auto_155290 ?auto_155292 ) ) ( not ( = ?auto_155290 ?auto_155285 ) ) ( not ( = ?auto_155288 ?auto_155292 ) ) ( not ( = ?auto_155288 ?auto_155285 ) ) ( not ( = ?auto_155292 ?auto_155285 ) ) ( not ( = ?auto_155284 ?auto_155292 ) ) ( not ( = ?auto_155284 ?auto_155291 ) ) ( not ( = ?auto_155284 ?auto_155289 ) ) ( not ( = ?auto_155284 ?auto_155290 ) ) ( not ( = ?auto_155284 ?auto_155288 ) ) ( not ( = ?auto_155286 ?auto_155292 ) ) ( not ( = ?auto_155286 ?auto_155291 ) ) ( not ( = ?auto_155286 ?auto_155289 ) ) ( not ( = ?auto_155286 ?auto_155290 ) ) ( not ( = ?auto_155286 ?auto_155288 ) ) ( not ( = ?auto_155287 ?auto_155292 ) ) ( not ( = ?auto_155287 ?auto_155291 ) ) ( not ( = ?auto_155287 ?auto_155289 ) ) ( not ( = ?auto_155287 ?auto_155290 ) ) ( not ( = ?auto_155287 ?auto_155288 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_155291 ?auto_155289 ?auto_155290 ?auto_155288 ?auto_155292 ?auto_155285 )
      ( MAKE-1PILE ?auto_155284 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_155293 - BLOCK
    )
    :vars
    (
      ?auto_155296 - BLOCK
      ?auto_155299 - BLOCK
      ?auto_155295 - BLOCK
      ?auto_155294 - BLOCK
      ?auto_155301 - BLOCK
      ?auto_155300 - BLOCK
      ?auto_155297 - BLOCK
      ?auto_155298 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_155296 ?auto_155293 ) ( ON-TABLE ?auto_155293 ) ( not ( = ?auto_155293 ?auto_155296 ) ) ( not ( = ?auto_155293 ?auto_155299 ) ) ( not ( = ?auto_155293 ?auto_155295 ) ) ( not ( = ?auto_155296 ?auto_155299 ) ) ( not ( = ?auto_155296 ?auto_155295 ) ) ( not ( = ?auto_155299 ?auto_155295 ) ) ( ON ?auto_155299 ?auto_155296 ) ( CLEAR ?auto_155294 ) ( ON-TABLE ?auto_155301 ) ( ON ?auto_155300 ?auto_155301 ) ( ON ?auto_155297 ?auto_155300 ) ( ON ?auto_155298 ?auto_155297 ) ( ON ?auto_155294 ?auto_155298 ) ( not ( = ?auto_155301 ?auto_155300 ) ) ( not ( = ?auto_155301 ?auto_155297 ) ) ( not ( = ?auto_155301 ?auto_155298 ) ) ( not ( = ?auto_155301 ?auto_155294 ) ) ( not ( = ?auto_155301 ?auto_155295 ) ) ( not ( = ?auto_155300 ?auto_155297 ) ) ( not ( = ?auto_155300 ?auto_155298 ) ) ( not ( = ?auto_155300 ?auto_155294 ) ) ( not ( = ?auto_155300 ?auto_155295 ) ) ( not ( = ?auto_155297 ?auto_155298 ) ) ( not ( = ?auto_155297 ?auto_155294 ) ) ( not ( = ?auto_155297 ?auto_155295 ) ) ( not ( = ?auto_155298 ?auto_155294 ) ) ( not ( = ?auto_155298 ?auto_155295 ) ) ( not ( = ?auto_155294 ?auto_155295 ) ) ( not ( = ?auto_155293 ?auto_155294 ) ) ( not ( = ?auto_155293 ?auto_155301 ) ) ( not ( = ?auto_155293 ?auto_155300 ) ) ( not ( = ?auto_155293 ?auto_155297 ) ) ( not ( = ?auto_155293 ?auto_155298 ) ) ( not ( = ?auto_155296 ?auto_155294 ) ) ( not ( = ?auto_155296 ?auto_155301 ) ) ( not ( = ?auto_155296 ?auto_155300 ) ) ( not ( = ?auto_155296 ?auto_155297 ) ) ( not ( = ?auto_155296 ?auto_155298 ) ) ( not ( = ?auto_155299 ?auto_155294 ) ) ( not ( = ?auto_155299 ?auto_155301 ) ) ( not ( = ?auto_155299 ?auto_155300 ) ) ( not ( = ?auto_155299 ?auto_155297 ) ) ( not ( = ?auto_155299 ?auto_155298 ) ) ( ON ?auto_155295 ?auto_155299 ) ( CLEAR ?auto_155295 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_155293 ?auto_155296 ?auto_155299 )
      ( MAKE-1PILE ?auto_155293 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_155302 - BLOCK
    )
    :vars
    (
      ?auto_155306 - BLOCK
      ?auto_155305 - BLOCK
      ?auto_155304 - BLOCK
      ?auto_155307 - BLOCK
      ?auto_155308 - BLOCK
      ?auto_155309 - BLOCK
      ?auto_155303 - BLOCK
      ?auto_155310 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_155306 ?auto_155302 ) ( ON-TABLE ?auto_155302 ) ( not ( = ?auto_155302 ?auto_155306 ) ) ( not ( = ?auto_155302 ?auto_155305 ) ) ( not ( = ?auto_155302 ?auto_155304 ) ) ( not ( = ?auto_155306 ?auto_155305 ) ) ( not ( = ?auto_155306 ?auto_155304 ) ) ( not ( = ?auto_155305 ?auto_155304 ) ) ( ON ?auto_155305 ?auto_155306 ) ( ON-TABLE ?auto_155307 ) ( ON ?auto_155308 ?auto_155307 ) ( ON ?auto_155309 ?auto_155308 ) ( ON ?auto_155303 ?auto_155309 ) ( not ( = ?auto_155307 ?auto_155308 ) ) ( not ( = ?auto_155307 ?auto_155309 ) ) ( not ( = ?auto_155307 ?auto_155303 ) ) ( not ( = ?auto_155307 ?auto_155310 ) ) ( not ( = ?auto_155307 ?auto_155304 ) ) ( not ( = ?auto_155308 ?auto_155309 ) ) ( not ( = ?auto_155308 ?auto_155303 ) ) ( not ( = ?auto_155308 ?auto_155310 ) ) ( not ( = ?auto_155308 ?auto_155304 ) ) ( not ( = ?auto_155309 ?auto_155303 ) ) ( not ( = ?auto_155309 ?auto_155310 ) ) ( not ( = ?auto_155309 ?auto_155304 ) ) ( not ( = ?auto_155303 ?auto_155310 ) ) ( not ( = ?auto_155303 ?auto_155304 ) ) ( not ( = ?auto_155310 ?auto_155304 ) ) ( not ( = ?auto_155302 ?auto_155310 ) ) ( not ( = ?auto_155302 ?auto_155307 ) ) ( not ( = ?auto_155302 ?auto_155308 ) ) ( not ( = ?auto_155302 ?auto_155309 ) ) ( not ( = ?auto_155302 ?auto_155303 ) ) ( not ( = ?auto_155306 ?auto_155310 ) ) ( not ( = ?auto_155306 ?auto_155307 ) ) ( not ( = ?auto_155306 ?auto_155308 ) ) ( not ( = ?auto_155306 ?auto_155309 ) ) ( not ( = ?auto_155306 ?auto_155303 ) ) ( not ( = ?auto_155305 ?auto_155310 ) ) ( not ( = ?auto_155305 ?auto_155307 ) ) ( not ( = ?auto_155305 ?auto_155308 ) ) ( not ( = ?auto_155305 ?auto_155309 ) ) ( not ( = ?auto_155305 ?auto_155303 ) ) ( ON ?auto_155304 ?auto_155305 ) ( CLEAR ?auto_155304 ) ( HOLDING ?auto_155310 ) ( CLEAR ?auto_155303 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_155307 ?auto_155308 ?auto_155309 ?auto_155303 ?auto_155310 )
      ( MAKE-1PILE ?auto_155302 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_155311 - BLOCK
    )
    :vars
    (
      ?auto_155318 - BLOCK
      ?auto_155315 - BLOCK
      ?auto_155317 - BLOCK
      ?auto_155316 - BLOCK
      ?auto_155312 - BLOCK
      ?auto_155314 - BLOCK
      ?auto_155313 - BLOCK
      ?auto_155319 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_155318 ?auto_155311 ) ( ON-TABLE ?auto_155311 ) ( not ( = ?auto_155311 ?auto_155318 ) ) ( not ( = ?auto_155311 ?auto_155315 ) ) ( not ( = ?auto_155311 ?auto_155317 ) ) ( not ( = ?auto_155318 ?auto_155315 ) ) ( not ( = ?auto_155318 ?auto_155317 ) ) ( not ( = ?auto_155315 ?auto_155317 ) ) ( ON ?auto_155315 ?auto_155318 ) ( ON-TABLE ?auto_155316 ) ( ON ?auto_155312 ?auto_155316 ) ( ON ?auto_155314 ?auto_155312 ) ( ON ?auto_155313 ?auto_155314 ) ( not ( = ?auto_155316 ?auto_155312 ) ) ( not ( = ?auto_155316 ?auto_155314 ) ) ( not ( = ?auto_155316 ?auto_155313 ) ) ( not ( = ?auto_155316 ?auto_155319 ) ) ( not ( = ?auto_155316 ?auto_155317 ) ) ( not ( = ?auto_155312 ?auto_155314 ) ) ( not ( = ?auto_155312 ?auto_155313 ) ) ( not ( = ?auto_155312 ?auto_155319 ) ) ( not ( = ?auto_155312 ?auto_155317 ) ) ( not ( = ?auto_155314 ?auto_155313 ) ) ( not ( = ?auto_155314 ?auto_155319 ) ) ( not ( = ?auto_155314 ?auto_155317 ) ) ( not ( = ?auto_155313 ?auto_155319 ) ) ( not ( = ?auto_155313 ?auto_155317 ) ) ( not ( = ?auto_155319 ?auto_155317 ) ) ( not ( = ?auto_155311 ?auto_155319 ) ) ( not ( = ?auto_155311 ?auto_155316 ) ) ( not ( = ?auto_155311 ?auto_155312 ) ) ( not ( = ?auto_155311 ?auto_155314 ) ) ( not ( = ?auto_155311 ?auto_155313 ) ) ( not ( = ?auto_155318 ?auto_155319 ) ) ( not ( = ?auto_155318 ?auto_155316 ) ) ( not ( = ?auto_155318 ?auto_155312 ) ) ( not ( = ?auto_155318 ?auto_155314 ) ) ( not ( = ?auto_155318 ?auto_155313 ) ) ( not ( = ?auto_155315 ?auto_155319 ) ) ( not ( = ?auto_155315 ?auto_155316 ) ) ( not ( = ?auto_155315 ?auto_155312 ) ) ( not ( = ?auto_155315 ?auto_155314 ) ) ( not ( = ?auto_155315 ?auto_155313 ) ) ( ON ?auto_155317 ?auto_155315 ) ( CLEAR ?auto_155313 ) ( ON ?auto_155319 ?auto_155317 ) ( CLEAR ?auto_155319 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_155311 ?auto_155318 ?auto_155315 ?auto_155317 )
      ( MAKE-1PILE ?auto_155311 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_155320 - BLOCK
    )
    :vars
    (
      ?auto_155325 - BLOCK
      ?auto_155322 - BLOCK
      ?auto_155323 - BLOCK
      ?auto_155321 - BLOCK
      ?auto_155327 - BLOCK
      ?auto_155328 - BLOCK
      ?auto_155324 - BLOCK
      ?auto_155326 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_155325 ?auto_155320 ) ( ON-TABLE ?auto_155320 ) ( not ( = ?auto_155320 ?auto_155325 ) ) ( not ( = ?auto_155320 ?auto_155322 ) ) ( not ( = ?auto_155320 ?auto_155323 ) ) ( not ( = ?auto_155325 ?auto_155322 ) ) ( not ( = ?auto_155325 ?auto_155323 ) ) ( not ( = ?auto_155322 ?auto_155323 ) ) ( ON ?auto_155322 ?auto_155325 ) ( ON-TABLE ?auto_155321 ) ( ON ?auto_155327 ?auto_155321 ) ( ON ?auto_155328 ?auto_155327 ) ( not ( = ?auto_155321 ?auto_155327 ) ) ( not ( = ?auto_155321 ?auto_155328 ) ) ( not ( = ?auto_155321 ?auto_155324 ) ) ( not ( = ?auto_155321 ?auto_155326 ) ) ( not ( = ?auto_155321 ?auto_155323 ) ) ( not ( = ?auto_155327 ?auto_155328 ) ) ( not ( = ?auto_155327 ?auto_155324 ) ) ( not ( = ?auto_155327 ?auto_155326 ) ) ( not ( = ?auto_155327 ?auto_155323 ) ) ( not ( = ?auto_155328 ?auto_155324 ) ) ( not ( = ?auto_155328 ?auto_155326 ) ) ( not ( = ?auto_155328 ?auto_155323 ) ) ( not ( = ?auto_155324 ?auto_155326 ) ) ( not ( = ?auto_155324 ?auto_155323 ) ) ( not ( = ?auto_155326 ?auto_155323 ) ) ( not ( = ?auto_155320 ?auto_155326 ) ) ( not ( = ?auto_155320 ?auto_155321 ) ) ( not ( = ?auto_155320 ?auto_155327 ) ) ( not ( = ?auto_155320 ?auto_155328 ) ) ( not ( = ?auto_155320 ?auto_155324 ) ) ( not ( = ?auto_155325 ?auto_155326 ) ) ( not ( = ?auto_155325 ?auto_155321 ) ) ( not ( = ?auto_155325 ?auto_155327 ) ) ( not ( = ?auto_155325 ?auto_155328 ) ) ( not ( = ?auto_155325 ?auto_155324 ) ) ( not ( = ?auto_155322 ?auto_155326 ) ) ( not ( = ?auto_155322 ?auto_155321 ) ) ( not ( = ?auto_155322 ?auto_155327 ) ) ( not ( = ?auto_155322 ?auto_155328 ) ) ( not ( = ?auto_155322 ?auto_155324 ) ) ( ON ?auto_155323 ?auto_155322 ) ( ON ?auto_155326 ?auto_155323 ) ( CLEAR ?auto_155326 ) ( HOLDING ?auto_155324 ) ( CLEAR ?auto_155328 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_155321 ?auto_155327 ?auto_155328 ?auto_155324 )
      ( MAKE-1PILE ?auto_155320 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_155329 - BLOCK
    )
    :vars
    (
      ?auto_155335 - BLOCK
      ?auto_155331 - BLOCK
      ?auto_155337 - BLOCK
      ?auto_155333 - BLOCK
      ?auto_155336 - BLOCK
      ?auto_155334 - BLOCK
      ?auto_155330 - BLOCK
      ?auto_155332 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_155335 ?auto_155329 ) ( ON-TABLE ?auto_155329 ) ( not ( = ?auto_155329 ?auto_155335 ) ) ( not ( = ?auto_155329 ?auto_155331 ) ) ( not ( = ?auto_155329 ?auto_155337 ) ) ( not ( = ?auto_155335 ?auto_155331 ) ) ( not ( = ?auto_155335 ?auto_155337 ) ) ( not ( = ?auto_155331 ?auto_155337 ) ) ( ON ?auto_155331 ?auto_155335 ) ( ON-TABLE ?auto_155333 ) ( ON ?auto_155336 ?auto_155333 ) ( ON ?auto_155334 ?auto_155336 ) ( not ( = ?auto_155333 ?auto_155336 ) ) ( not ( = ?auto_155333 ?auto_155334 ) ) ( not ( = ?auto_155333 ?auto_155330 ) ) ( not ( = ?auto_155333 ?auto_155332 ) ) ( not ( = ?auto_155333 ?auto_155337 ) ) ( not ( = ?auto_155336 ?auto_155334 ) ) ( not ( = ?auto_155336 ?auto_155330 ) ) ( not ( = ?auto_155336 ?auto_155332 ) ) ( not ( = ?auto_155336 ?auto_155337 ) ) ( not ( = ?auto_155334 ?auto_155330 ) ) ( not ( = ?auto_155334 ?auto_155332 ) ) ( not ( = ?auto_155334 ?auto_155337 ) ) ( not ( = ?auto_155330 ?auto_155332 ) ) ( not ( = ?auto_155330 ?auto_155337 ) ) ( not ( = ?auto_155332 ?auto_155337 ) ) ( not ( = ?auto_155329 ?auto_155332 ) ) ( not ( = ?auto_155329 ?auto_155333 ) ) ( not ( = ?auto_155329 ?auto_155336 ) ) ( not ( = ?auto_155329 ?auto_155334 ) ) ( not ( = ?auto_155329 ?auto_155330 ) ) ( not ( = ?auto_155335 ?auto_155332 ) ) ( not ( = ?auto_155335 ?auto_155333 ) ) ( not ( = ?auto_155335 ?auto_155336 ) ) ( not ( = ?auto_155335 ?auto_155334 ) ) ( not ( = ?auto_155335 ?auto_155330 ) ) ( not ( = ?auto_155331 ?auto_155332 ) ) ( not ( = ?auto_155331 ?auto_155333 ) ) ( not ( = ?auto_155331 ?auto_155336 ) ) ( not ( = ?auto_155331 ?auto_155334 ) ) ( not ( = ?auto_155331 ?auto_155330 ) ) ( ON ?auto_155337 ?auto_155331 ) ( ON ?auto_155332 ?auto_155337 ) ( CLEAR ?auto_155334 ) ( ON ?auto_155330 ?auto_155332 ) ( CLEAR ?auto_155330 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_155329 ?auto_155335 ?auto_155331 ?auto_155337 ?auto_155332 )
      ( MAKE-1PILE ?auto_155329 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_155338 - BLOCK
    )
    :vars
    (
      ?auto_155340 - BLOCK
      ?auto_155341 - BLOCK
      ?auto_155346 - BLOCK
      ?auto_155339 - BLOCK
      ?auto_155344 - BLOCK
      ?auto_155343 - BLOCK
      ?auto_155345 - BLOCK
      ?auto_155342 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_155340 ?auto_155338 ) ( ON-TABLE ?auto_155338 ) ( not ( = ?auto_155338 ?auto_155340 ) ) ( not ( = ?auto_155338 ?auto_155341 ) ) ( not ( = ?auto_155338 ?auto_155346 ) ) ( not ( = ?auto_155340 ?auto_155341 ) ) ( not ( = ?auto_155340 ?auto_155346 ) ) ( not ( = ?auto_155341 ?auto_155346 ) ) ( ON ?auto_155341 ?auto_155340 ) ( ON-TABLE ?auto_155339 ) ( ON ?auto_155344 ?auto_155339 ) ( not ( = ?auto_155339 ?auto_155344 ) ) ( not ( = ?auto_155339 ?auto_155343 ) ) ( not ( = ?auto_155339 ?auto_155345 ) ) ( not ( = ?auto_155339 ?auto_155342 ) ) ( not ( = ?auto_155339 ?auto_155346 ) ) ( not ( = ?auto_155344 ?auto_155343 ) ) ( not ( = ?auto_155344 ?auto_155345 ) ) ( not ( = ?auto_155344 ?auto_155342 ) ) ( not ( = ?auto_155344 ?auto_155346 ) ) ( not ( = ?auto_155343 ?auto_155345 ) ) ( not ( = ?auto_155343 ?auto_155342 ) ) ( not ( = ?auto_155343 ?auto_155346 ) ) ( not ( = ?auto_155345 ?auto_155342 ) ) ( not ( = ?auto_155345 ?auto_155346 ) ) ( not ( = ?auto_155342 ?auto_155346 ) ) ( not ( = ?auto_155338 ?auto_155342 ) ) ( not ( = ?auto_155338 ?auto_155339 ) ) ( not ( = ?auto_155338 ?auto_155344 ) ) ( not ( = ?auto_155338 ?auto_155343 ) ) ( not ( = ?auto_155338 ?auto_155345 ) ) ( not ( = ?auto_155340 ?auto_155342 ) ) ( not ( = ?auto_155340 ?auto_155339 ) ) ( not ( = ?auto_155340 ?auto_155344 ) ) ( not ( = ?auto_155340 ?auto_155343 ) ) ( not ( = ?auto_155340 ?auto_155345 ) ) ( not ( = ?auto_155341 ?auto_155342 ) ) ( not ( = ?auto_155341 ?auto_155339 ) ) ( not ( = ?auto_155341 ?auto_155344 ) ) ( not ( = ?auto_155341 ?auto_155343 ) ) ( not ( = ?auto_155341 ?auto_155345 ) ) ( ON ?auto_155346 ?auto_155341 ) ( ON ?auto_155342 ?auto_155346 ) ( ON ?auto_155345 ?auto_155342 ) ( CLEAR ?auto_155345 ) ( HOLDING ?auto_155343 ) ( CLEAR ?auto_155344 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_155339 ?auto_155344 ?auto_155343 )
      ( MAKE-1PILE ?auto_155338 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_155347 - BLOCK
    )
    :vars
    (
      ?auto_155350 - BLOCK
      ?auto_155349 - BLOCK
      ?auto_155355 - BLOCK
      ?auto_155348 - BLOCK
      ?auto_155354 - BLOCK
      ?auto_155351 - BLOCK
      ?auto_155352 - BLOCK
      ?auto_155353 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_155350 ?auto_155347 ) ( ON-TABLE ?auto_155347 ) ( not ( = ?auto_155347 ?auto_155350 ) ) ( not ( = ?auto_155347 ?auto_155349 ) ) ( not ( = ?auto_155347 ?auto_155355 ) ) ( not ( = ?auto_155350 ?auto_155349 ) ) ( not ( = ?auto_155350 ?auto_155355 ) ) ( not ( = ?auto_155349 ?auto_155355 ) ) ( ON ?auto_155349 ?auto_155350 ) ( ON-TABLE ?auto_155348 ) ( ON ?auto_155354 ?auto_155348 ) ( not ( = ?auto_155348 ?auto_155354 ) ) ( not ( = ?auto_155348 ?auto_155351 ) ) ( not ( = ?auto_155348 ?auto_155352 ) ) ( not ( = ?auto_155348 ?auto_155353 ) ) ( not ( = ?auto_155348 ?auto_155355 ) ) ( not ( = ?auto_155354 ?auto_155351 ) ) ( not ( = ?auto_155354 ?auto_155352 ) ) ( not ( = ?auto_155354 ?auto_155353 ) ) ( not ( = ?auto_155354 ?auto_155355 ) ) ( not ( = ?auto_155351 ?auto_155352 ) ) ( not ( = ?auto_155351 ?auto_155353 ) ) ( not ( = ?auto_155351 ?auto_155355 ) ) ( not ( = ?auto_155352 ?auto_155353 ) ) ( not ( = ?auto_155352 ?auto_155355 ) ) ( not ( = ?auto_155353 ?auto_155355 ) ) ( not ( = ?auto_155347 ?auto_155353 ) ) ( not ( = ?auto_155347 ?auto_155348 ) ) ( not ( = ?auto_155347 ?auto_155354 ) ) ( not ( = ?auto_155347 ?auto_155351 ) ) ( not ( = ?auto_155347 ?auto_155352 ) ) ( not ( = ?auto_155350 ?auto_155353 ) ) ( not ( = ?auto_155350 ?auto_155348 ) ) ( not ( = ?auto_155350 ?auto_155354 ) ) ( not ( = ?auto_155350 ?auto_155351 ) ) ( not ( = ?auto_155350 ?auto_155352 ) ) ( not ( = ?auto_155349 ?auto_155353 ) ) ( not ( = ?auto_155349 ?auto_155348 ) ) ( not ( = ?auto_155349 ?auto_155354 ) ) ( not ( = ?auto_155349 ?auto_155351 ) ) ( not ( = ?auto_155349 ?auto_155352 ) ) ( ON ?auto_155355 ?auto_155349 ) ( ON ?auto_155353 ?auto_155355 ) ( ON ?auto_155352 ?auto_155353 ) ( CLEAR ?auto_155354 ) ( ON ?auto_155351 ?auto_155352 ) ( CLEAR ?auto_155351 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_155347 ?auto_155350 ?auto_155349 ?auto_155355 ?auto_155353 ?auto_155352 )
      ( MAKE-1PILE ?auto_155347 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_155356 - BLOCK
    )
    :vars
    (
      ?auto_155359 - BLOCK
      ?auto_155363 - BLOCK
      ?auto_155360 - BLOCK
      ?auto_155364 - BLOCK
      ?auto_155361 - BLOCK
      ?auto_155357 - BLOCK
      ?auto_155358 - BLOCK
      ?auto_155362 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_155359 ?auto_155356 ) ( ON-TABLE ?auto_155356 ) ( not ( = ?auto_155356 ?auto_155359 ) ) ( not ( = ?auto_155356 ?auto_155363 ) ) ( not ( = ?auto_155356 ?auto_155360 ) ) ( not ( = ?auto_155359 ?auto_155363 ) ) ( not ( = ?auto_155359 ?auto_155360 ) ) ( not ( = ?auto_155363 ?auto_155360 ) ) ( ON ?auto_155363 ?auto_155359 ) ( ON-TABLE ?auto_155364 ) ( not ( = ?auto_155364 ?auto_155361 ) ) ( not ( = ?auto_155364 ?auto_155357 ) ) ( not ( = ?auto_155364 ?auto_155358 ) ) ( not ( = ?auto_155364 ?auto_155362 ) ) ( not ( = ?auto_155364 ?auto_155360 ) ) ( not ( = ?auto_155361 ?auto_155357 ) ) ( not ( = ?auto_155361 ?auto_155358 ) ) ( not ( = ?auto_155361 ?auto_155362 ) ) ( not ( = ?auto_155361 ?auto_155360 ) ) ( not ( = ?auto_155357 ?auto_155358 ) ) ( not ( = ?auto_155357 ?auto_155362 ) ) ( not ( = ?auto_155357 ?auto_155360 ) ) ( not ( = ?auto_155358 ?auto_155362 ) ) ( not ( = ?auto_155358 ?auto_155360 ) ) ( not ( = ?auto_155362 ?auto_155360 ) ) ( not ( = ?auto_155356 ?auto_155362 ) ) ( not ( = ?auto_155356 ?auto_155364 ) ) ( not ( = ?auto_155356 ?auto_155361 ) ) ( not ( = ?auto_155356 ?auto_155357 ) ) ( not ( = ?auto_155356 ?auto_155358 ) ) ( not ( = ?auto_155359 ?auto_155362 ) ) ( not ( = ?auto_155359 ?auto_155364 ) ) ( not ( = ?auto_155359 ?auto_155361 ) ) ( not ( = ?auto_155359 ?auto_155357 ) ) ( not ( = ?auto_155359 ?auto_155358 ) ) ( not ( = ?auto_155363 ?auto_155362 ) ) ( not ( = ?auto_155363 ?auto_155364 ) ) ( not ( = ?auto_155363 ?auto_155361 ) ) ( not ( = ?auto_155363 ?auto_155357 ) ) ( not ( = ?auto_155363 ?auto_155358 ) ) ( ON ?auto_155360 ?auto_155363 ) ( ON ?auto_155362 ?auto_155360 ) ( ON ?auto_155358 ?auto_155362 ) ( ON ?auto_155357 ?auto_155358 ) ( CLEAR ?auto_155357 ) ( HOLDING ?auto_155361 ) ( CLEAR ?auto_155364 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_155364 ?auto_155361 )
      ( MAKE-1PILE ?auto_155356 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_157535 - BLOCK
    )
    :vars
    (
      ?auto_157540 - BLOCK
      ?auto_157541 - BLOCK
      ?auto_157536 - BLOCK
      ?auto_157542 - BLOCK
      ?auto_157539 - BLOCK
      ?auto_157537 - BLOCK
      ?auto_157538 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_157540 ?auto_157535 ) ( ON-TABLE ?auto_157535 ) ( not ( = ?auto_157535 ?auto_157540 ) ) ( not ( = ?auto_157535 ?auto_157541 ) ) ( not ( = ?auto_157535 ?auto_157536 ) ) ( not ( = ?auto_157540 ?auto_157541 ) ) ( not ( = ?auto_157540 ?auto_157536 ) ) ( not ( = ?auto_157541 ?auto_157536 ) ) ( ON ?auto_157541 ?auto_157540 ) ( not ( = ?auto_157542 ?auto_157539 ) ) ( not ( = ?auto_157542 ?auto_157537 ) ) ( not ( = ?auto_157542 ?auto_157538 ) ) ( not ( = ?auto_157542 ?auto_157536 ) ) ( not ( = ?auto_157539 ?auto_157537 ) ) ( not ( = ?auto_157539 ?auto_157538 ) ) ( not ( = ?auto_157539 ?auto_157536 ) ) ( not ( = ?auto_157537 ?auto_157538 ) ) ( not ( = ?auto_157537 ?auto_157536 ) ) ( not ( = ?auto_157538 ?auto_157536 ) ) ( not ( = ?auto_157535 ?auto_157538 ) ) ( not ( = ?auto_157535 ?auto_157542 ) ) ( not ( = ?auto_157535 ?auto_157539 ) ) ( not ( = ?auto_157535 ?auto_157537 ) ) ( not ( = ?auto_157540 ?auto_157538 ) ) ( not ( = ?auto_157540 ?auto_157542 ) ) ( not ( = ?auto_157540 ?auto_157539 ) ) ( not ( = ?auto_157540 ?auto_157537 ) ) ( not ( = ?auto_157541 ?auto_157538 ) ) ( not ( = ?auto_157541 ?auto_157542 ) ) ( not ( = ?auto_157541 ?auto_157539 ) ) ( not ( = ?auto_157541 ?auto_157537 ) ) ( ON ?auto_157536 ?auto_157541 ) ( ON ?auto_157538 ?auto_157536 ) ( ON ?auto_157537 ?auto_157538 ) ( ON ?auto_157539 ?auto_157537 ) ( ON ?auto_157542 ?auto_157539 ) ( CLEAR ?auto_157542 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_157535 ?auto_157540 ?auto_157541 ?auto_157536 ?auto_157538 ?auto_157537 ?auto_157539 )
      ( MAKE-1PILE ?auto_157535 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_155374 - BLOCK
    )
    :vars
    (
      ?auto_155382 - BLOCK
      ?auto_155380 - BLOCK
      ?auto_155375 - BLOCK
      ?auto_155379 - BLOCK
      ?auto_155376 - BLOCK
      ?auto_155378 - BLOCK
      ?auto_155381 - BLOCK
      ?auto_155377 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_155382 ?auto_155374 ) ( ON-TABLE ?auto_155374 ) ( not ( = ?auto_155374 ?auto_155382 ) ) ( not ( = ?auto_155374 ?auto_155380 ) ) ( not ( = ?auto_155374 ?auto_155375 ) ) ( not ( = ?auto_155382 ?auto_155380 ) ) ( not ( = ?auto_155382 ?auto_155375 ) ) ( not ( = ?auto_155380 ?auto_155375 ) ) ( ON ?auto_155380 ?auto_155382 ) ( not ( = ?auto_155379 ?auto_155376 ) ) ( not ( = ?auto_155379 ?auto_155378 ) ) ( not ( = ?auto_155379 ?auto_155381 ) ) ( not ( = ?auto_155379 ?auto_155377 ) ) ( not ( = ?auto_155379 ?auto_155375 ) ) ( not ( = ?auto_155376 ?auto_155378 ) ) ( not ( = ?auto_155376 ?auto_155381 ) ) ( not ( = ?auto_155376 ?auto_155377 ) ) ( not ( = ?auto_155376 ?auto_155375 ) ) ( not ( = ?auto_155378 ?auto_155381 ) ) ( not ( = ?auto_155378 ?auto_155377 ) ) ( not ( = ?auto_155378 ?auto_155375 ) ) ( not ( = ?auto_155381 ?auto_155377 ) ) ( not ( = ?auto_155381 ?auto_155375 ) ) ( not ( = ?auto_155377 ?auto_155375 ) ) ( not ( = ?auto_155374 ?auto_155377 ) ) ( not ( = ?auto_155374 ?auto_155379 ) ) ( not ( = ?auto_155374 ?auto_155376 ) ) ( not ( = ?auto_155374 ?auto_155378 ) ) ( not ( = ?auto_155374 ?auto_155381 ) ) ( not ( = ?auto_155382 ?auto_155377 ) ) ( not ( = ?auto_155382 ?auto_155379 ) ) ( not ( = ?auto_155382 ?auto_155376 ) ) ( not ( = ?auto_155382 ?auto_155378 ) ) ( not ( = ?auto_155382 ?auto_155381 ) ) ( not ( = ?auto_155380 ?auto_155377 ) ) ( not ( = ?auto_155380 ?auto_155379 ) ) ( not ( = ?auto_155380 ?auto_155376 ) ) ( not ( = ?auto_155380 ?auto_155378 ) ) ( not ( = ?auto_155380 ?auto_155381 ) ) ( ON ?auto_155375 ?auto_155380 ) ( ON ?auto_155377 ?auto_155375 ) ( ON ?auto_155381 ?auto_155377 ) ( ON ?auto_155378 ?auto_155381 ) ( ON ?auto_155376 ?auto_155378 ) ( CLEAR ?auto_155376 ) ( HOLDING ?auto_155379 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_155379 )
      ( MAKE-1PILE ?auto_155374 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_155383 - BLOCK
    )
    :vars
    (
      ?auto_155391 - BLOCK
      ?auto_155389 - BLOCK
      ?auto_155386 - BLOCK
      ?auto_155387 - BLOCK
      ?auto_155384 - BLOCK
      ?auto_155385 - BLOCK
      ?auto_155388 - BLOCK
      ?auto_155390 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_155391 ?auto_155383 ) ( ON-TABLE ?auto_155383 ) ( not ( = ?auto_155383 ?auto_155391 ) ) ( not ( = ?auto_155383 ?auto_155389 ) ) ( not ( = ?auto_155383 ?auto_155386 ) ) ( not ( = ?auto_155391 ?auto_155389 ) ) ( not ( = ?auto_155391 ?auto_155386 ) ) ( not ( = ?auto_155389 ?auto_155386 ) ) ( ON ?auto_155389 ?auto_155391 ) ( not ( = ?auto_155387 ?auto_155384 ) ) ( not ( = ?auto_155387 ?auto_155385 ) ) ( not ( = ?auto_155387 ?auto_155388 ) ) ( not ( = ?auto_155387 ?auto_155390 ) ) ( not ( = ?auto_155387 ?auto_155386 ) ) ( not ( = ?auto_155384 ?auto_155385 ) ) ( not ( = ?auto_155384 ?auto_155388 ) ) ( not ( = ?auto_155384 ?auto_155390 ) ) ( not ( = ?auto_155384 ?auto_155386 ) ) ( not ( = ?auto_155385 ?auto_155388 ) ) ( not ( = ?auto_155385 ?auto_155390 ) ) ( not ( = ?auto_155385 ?auto_155386 ) ) ( not ( = ?auto_155388 ?auto_155390 ) ) ( not ( = ?auto_155388 ?auto_155386 ) ) ( not ( = ?auto_155390 ?auto_155386 ) ) ( not ( = ?auto_155383 ?auto_155390 ) ) ( not ( = ?auto_155383 ?auto_155387 ) ) ( not ( = ?auto_155383 ?auto_155384 ) ) ( not ( = ?auto_155383 ?auto_155385 ) ) ( not ( = ?auto_155383 ?auto_155388 ) ) ( not ( = ?auto_155391 ?auto_155390 ) ) ( not ( = ?auto_155391 ?auto_155387 ) ) ( not ( = ?auto_155391 ?auto_155384 ) ) ( not ( = ?auto_155391 ?auto_155385 ) ) ( not ( = ?auto_155391 ?auto_155388 ) ) ( not ( = ?auto_155389 ?auto_155390 ) ) ( not ( = ?auto_155389 ?auto_155387 ) ) ( not ( = ?auto_155389 ?auto_155384 ) ) ( not ( = ?auto_155389 ?auto_155385 ) ) ( not ( = ?auto_155389 ?auto_155388 ) ) ( ON ?auto_155386 ?auto_155389 ) ( ON ?auto_155390 ?auto_155386 ) ( ON ?auto_155388 ?auto_155390 ) ( ON ?auto_155385 ?auto_155388 ) ( ON ?auto_155384 ?auto_155385 ) ( ON ?auto_155387 ?auto_155384 ) ( CLEAR ?auto_155387 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_155383 ?auto_155391 ?auto_155389 ?auto_155386 ?auto_155390 ?auto_155388 ?auto_155385 ?auto_155384 )
      ( MAKE-1PILE ?auto_155383 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_155400 - BLOCK
      ?auto_155401 - BLOCK
      ?auto_155402 - BLOCK
      ?auto_155403 - BLOCK
      ?auto_155404 - BLOCK
      ?auto_155405 - BLOCK
      ?auto_155406 - BLOCK
      ?auto_155407 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_155407 ) ( CLEAR ?auto_155406 ) ( ON-TABLE ?auto_155400 ) ( ON ?auto_155401 ?auto_155400 ) ( ON ?auto_155402 ?auto_155401 ) ( ON ?auto_155403 ?auto_155402 ) ( ON ?auto_155404 ?auto_155403 ) ( ON ?auto_155405 ?auto_155404 ) ( ON ?auto_155406 ?auto_155405 ) ( not ( = ?auto_155400 ?auto_155401 ) ) ( not ( = ?auto_155400 ?auto_155402 ) ) ( not ( = ?auto_155400 ?auto_155403 ) ) ( not ( = ?auto_155400 ?auto_155404 ) ) ( not ( = ?auto_155400 ?auto_155405 ) ) ( not ( = ?auto_155400 ?auto_155406 ) ) ( not ( = ?auto_155400 ?auto_155407 ) ) ( not ( = ?auto_155401 ?auto_155402 ) ) ( not ( = ?auto_155401 ?auto_155403 ) ) ( not ( = ?auto_155401 ?auto_155404 ) ) ( not ( = ?auto_155401 ?auto_155405 ) ) ( not ( = ?auto_155401 ?auto_155406 ) ) ( not ( = ?auto_155401 ?auto_155407 ) ) ( not ( = ?auto_155402 ?auto_155403 ) ) ( not ( = ?auto_155402 ?auto_155404 ) ) ( not ( = ?auto_155402 ?auto_155405 ) ) ( not ( = ?auto_155402 ?auto_155406 ) ) ( not ( = ?auto_155402 ?auto_155407 ) ) ( not ( = ?auto_155403 ?auto_155404 ) ) ( not ( = ?auto_155403 ?auto_155405 ) ) ( not ( = ?auto_155403 ?auto_155406 ) ) ( not ( = ?auto_155403 ?auto_155407 ) ) ( not ( = ?auto_155404 ?auto_155405 ) ) ( not ( = ?auto_155404 ?auto_155406 ) ) ( not ( = ?auto_155404 ?auto_155407 ) ) ( not ( = ?auto_155405 ?auto_155406 ) ) ( not ( = ?auto_155405 ?auto_155407 ) ) ( not ( = ?auto_155406 ?auto_155407 ) ) )
    :subtasks
    ( ( !STACK ?auto_155407 ?auto_155406 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_155408 - BLOCK
      ?auto_155409 - BLOCK
      ?auto_155410 - BLOCK
      ?auto_155411 - BLOCK
      ?auto_155412 - BLOCK
      ?auto_155413 - BLOCK
      ?auto_155414 - BLOCK
      ?auto_155415 - BLOCK
    )
    :vars
    (
      ?auto_155416 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_155414 ) ( ON-TABLE ?auto_155408 ) ( ON ?auto_155409 ?auto_155408 ) ( ON ?auto_155410 ?auto_155409 ) ( ON ?auto_155411 ?auto_155410 ) ( ON ?auto_155412 ?auto_155411 ) ( ON ?auto_155413 ?auto_155412 ) ( ON ?auto_155414 ?auto_155413 ) ( not ( = ?auto_155408 ?auto_155409 ) ) ( not ( = ?auto_155408 ?auto_155410 ) ) ( not ( = ?auto_155408 ?auto_155411 ) ) ( not ( = ?auto_155408 ?auto_155412 ) ) ( not ( = ?auto_155408 ?auto_155413 ) ) ( not ( = ?auto_155408 ?auto_155414 ) ) ( not ( = ?auto_155408 ?auto_155415 ) ) ( not ( = ?auto_155409 ?auto_155410 ) ) ( not ( = ?auto_155409 ?auto_155411 ) ) ( not ( = ?auto_155409 ?auto_155412 ) ) ( not ( = ?auto_155409 ?auto_155413 ) ) ( not ( = ?auto_155409 ?auto_155414 ) ) ( not ( = ?auto_155409 ?auto_155415 ) ) ( not ( = ?auto_155410 ?auto_155411 ) ) ( not ( = ?auto_155410 ?auto_155412 ) ) ( not ( = ?auto_155410 ?auto_155413 ) ) ( not ( = ?auto_155410 ?auto_155414 ) ) ( not ( = ?auto_155410 ?auto_155415 ) ) ( not ( = ?auto_155411 ?auto_155412 ) ) ( not ( = ?auto_155411 ?auto_155413 ) ) ( not ( = ?auto_155411 ?auto_155414 ) ) ( not ( = ?auto_155411 ?auto_155415 ) ) ( not ( = ?auto_155412 ?auto_155413 ) ) ( not ( = ?auto_155412 ?auto_155414 ) ) ( not ( = ?auto_155412 ?auto_155415 ) ) ( not ( = ?auto_155413 ?auto_155414 ) ) ( not ( = ?auto_155413 ?auto_155415 ) ) ( not ( = ?auto_155414 ?auto_155415 ) ) ( ON ?auto_155415 ?auto_155416 ) ( CLEAR ?auto_155415 ) ( HAND-EMPTY ) ( not ( = ?auto_155408 ?auto_155416 ) ) ( not ( = ?auto_155409 ?auto_155416 ) ) ( not ( = ?auto_155410 ?auto_155416 ) ) ( not ( = ?auto_155411 ?auto_155416 ) ) ( not ( = ?auto_155412 ?auto_155416 ) ) ( not ( = ?auto_155413 ?auto_155416 ) ) ( not ( = ?auto_155414 ?auto_155416 ) ) ( not ( = ?auto_155415 ?auto_155416 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_155415 ?auto_155416 )
      ( MAKE-8PILE ?auto_155408 ?auto_155409 ?auto_155410 ?auto_155411 ?auto_155412 ?auto_155413 ?auto_155414 ?auto_155415 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_155417 - BLOCK
      ?auto_155418 - BLOCK
      ?auto_155419 - BLOCK
      ?auto_155420 - BLOCK
      ?auto_155421 - BLOCK
      ?auto_155422 - BLOCK
      ?auto_155423 - BLOCK
      ?auto_155424 - BLOCK
    )
    :vars
    (
      ?auto_155425 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_155417 ) ( ON ?auto_155418 ?auto_155417 ) ( ON ?auto_155419 ?auto_155418 ) ( ON ?auto_155420 ?auto_155419 ) ( ON ?auto_155421 ?auto_155420 ) ( ON ?auto_155422 ?auto_155421 ) ( not ( = ?auto_155417 ?auto_155418 ) ) ( not ( = ?auto_155417 ?auto_155419 ) ) ( not ( = ?auto_155417 ?auto_155420 ) ) ( not ( = ?auto_155417 ?auto_155421 ) ) ( not ( = ?auto_155417 ?auto_155422 ) ) ( not ( = ?auto_155417 ?auto_155423 ) ) ( not ( = ?auto_155417 ?auto_155424 ) ) ( not ( = ?auto_155418 ?auto_155419 ) ) ( not ( = ?auto_155418 ?auto_155420 ) ) ( not ( = ?auto_155418 ?auto_155421 ) ) ( not ( = ?auto_155418 ?auto_155422 ) ) ( not ( = ?auto_155418 ?auto_155423 ) ) ( not ( = ?auto_155418 ?auto_155424 ) ) ( not ( = ?auto_155419 ?auto_155420 ) ) ( not ( = ?auto_155419 ?auto_155421 ) ) ( not ( = ?auto_155419 ?auto_155422 ) ) ( not ( = ?auto_155419 ?auto_155423 ) ) ( not ( = ?auto_155419 ?auto_155424 ) ) ( not ( = ?auto_155420 ?auto_155421 ) ) ( not ( = ?auto_155420 ?auto_155422 ) ) ( not ( = ?auto_155420 ?auto_155423 ) ) ( not ( = ?auto_155420 ?auto_155424 ) ) ( not ( = ?auto_155421 ?auto_155422 ) ) ( not ( = ?auto_155421 ?auto_155423 ) ) ( not ( = ?auto_155421 ?auto_155424 ) ) ( not ( = ?auto_155422 ?auto_155423 ) ) ( not ( = ?auto_155422 ?auto_155424 ) ) ( not ( = ?auto_155423 ?auto_155424 ) ) ( ON ?auto_155424 ?auto_155425 ) ( CLEAR ?auto_155424 ) ( not ( = ?auto_155417 ?auto_155425 ) ) ( not ( = ?auto_155418 ?auto_155425 ) ) ( not ( = ?auto_155419 ?auto_155425 ) ) ( not ( = ?auto_155420 ?auto_155425 ) ) ( not ( = ?auto_155421 ?auto_155425 ) ) ( not ( = ?auto_155422 ?auto_155425 ) ) ( not ( = ?auto_155423 ?auto_155425 ) ) ( not ( = ?auto_155424 ?auto_155425 ) ) ( HOLDING ?auto_155423 ) ( CLEAR ?auto_155422 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_155417 ?auto_155418 ?auto_155419 ?auto_155420 ?auto_155421 ?auto_155422 ?auto_155423 )
      ( MAKE-8PILE ?auto_155417 ?auto_155418 ?auto_155419 ?auto_155420 ?auto_155421 ?auto_155422 ?auto_155423 ?auto_155424 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_155426 - BLOCK
      ?auto_155427 - BLOCK
      ?auto_155428 - BLOCK
      ?auto_155429 - BLOCK
      ?auto_155430 - BLOCK
      ?auto_155431 - BLOCK
      ?auto_155432 - BLOCK
      ?auto_155433 - BLOCK
    )
    :vars
    (
      ?auto_155434 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_155426 ) ( ON ?auto_155427 ?auto_155426 ) ( ON ?auto_155428 ?auto_155427 ) ( ON ?auto_155429 ?auto_155428 ) ( ON ?auto_155430 ?auto_155429 ) ( ON ?auto_155431 ?auto_155430 ) ( not ( = ?auto_155426 ?auto_155427 ) ) ( not ( = ?auto_155426 ?auto_155428 ) ) ( not ( = ?auto_155426 ?auto_155429 ) ) ( not ( = ?auto_155426 ?auto_155430 ) ) ( not ( = ?auto_155426 ?auto_155431 ) ) ( not ( = ?auto_155426 ?auto_155432 ) ) ( not ( = ?auto_155426 ?auto_155433 ) ) ( not ( = ?auto_155427 ?auto_155428 ) ) ( not ( = ?auto_155427 ?auto_155429 ) ) ( not ( = ?auto_155427 ?auto_155430 ) ) ( not ( = ?auto_155427 ?auto_155431 ) ) ( not ( = ?auto_155427 ?auto_155432 ) ) ( not ( = ?auto_155427 ?auto_155433 ) ) ( not ( = ?auto_155428 ?auto_155429 ) ) ( not ( = ?auto_155428 ?auto_155430 ) ) ( not ( = ?auto_155428 ?auto_155431 ) ) ( not ( = ?auto_155428 ?auto_155432 ) ) ( not ( = ?auto_155428 ?auto_155433 ) ) ( not ( = ?auto_155429 ?auto_155430 ) ) ( not ( = ?auto_155429 ?auto_155431 ) ) ( not ( = ?auto_155429 ?auto_155432 ) ) ( not ( = ?auto_155429 ?auto_155433 ) ) ( not ( = ?auto_155430 ?auto_155431 ) ) ( not ( = ?auto_155430 ?auto_155432 ) ) ( not ( = ?auto_155430 ?auto_155433 ) ) ( not ( = ?auto_155431 ?auto_155432 ) ) ( not ( = ?auto_155431 ?auto_155433 ) ) ( not ( = ?auto_155432 ?auto_155433 ) ) ( ON ?auto_155433 ?auto_155434 ) ( not ( = ?auto_155426 ?auto_155434 ) ) ( not ( = ?auto_155427 ?auto_155434 ) ) ( not ( = ?auto_155428 ?auto_155434 ) ) ( not ( = ?auto_155429 ?auto_155434 ) ) ( not ( = ?auto_155430 ?auto_155434 ) ) ( not ( = ?auto_155431 ?auto_155434 ) ) ( not ( = ?auto_155432 ?auto_155434 ) ) ( not ( = ?auto_155433 ?auto_155434 ) ) ( CLEAR ?auto_155431 ) ( ON ?auto_155432 ?auto_155433 ) ( CLEAR ?auto_155432 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_155434 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_155434 ?auto_155433 )
      ( MAKE-8PILE ?auto_155426 ?auto_155427 ?auto_155428 ?auto_155429 ?auto_155430 ?auto_155431 ?auto_155432 ?auto_155433 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_155435 - BLOCK
      ?auto_155436 - BLOCK
      ?auto_155437 - BLOCK
      ?auto_155438 - BLOCK
      ?auto_155439 - BLOCK
      ?auto_155440 - BLOCK
      ?auto_155441 - BLOCK
      ?auto_155442 - BLOCK
    )
    :vars
    (
      ?auto_155443 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_155435 ) ( ON ?auto_155436 ?auto_155435 ) ( ON ?auto_155437 ?auto_155436 ) ( ON ?auto_155438 ?auto_155437 ) ( ON ?auto_155439 ?auto_155438 ) ( not ( = ?auto_155435 ?auto_155436 ) ) ( not ( = ?auto_155435 ?auto_155437 ) ) ( not ( = ?auto_155435 ?auto_155438 ) ) ( not ( = ?auto_155435 ?auto_155439 ) ) ( not ( = ?auto_155435 ?auto_155440 ) ) ( not ( = ?auto_155435 ?auto_155441 ) ) ( not ( = ?auto_155435 ?auto_155442 ) ) ( not ( = ?auto_155436 ?auto_155437 ) ) ( not ( = ?auto_155436 ?auto_155438 ) ) ( not ( = ?auto_155436 ?auto_155439 ) ) ( not ( = ?auto_155436 ?auto_155440 ) ) ( not ( = ?auto_155436 ?auto_155441 ) ) ( not ( = ?auto_155436 ?auto_155442 ) ) ( not ( = ?auto_155437 ?auto_155438 ) ) ( not ( = ?auto_155437 ?auto_155439 ) ) ( not ( = ?auto_155437 ?auto_155440 ) ) ( not ( = ?auto_155437 ?auto_155441 ) ) ( not ( = ?auto_155437 ?auto_155442 ) ) ( not ( = ?auto_155438 ?auto_155439 ) ) ( not ( = ?auto_155438 ?auto_155440 ) ) ( not ( = ?auto_155438 ?auto_155441 ) ) ( not ( = ?auto_155438 ?auto_155442 ) ) ( not ( = ?auto_155439 ?auto_155440 ) ) ( not ( = ?auto_155439 ?auto_155441 ) ) ( not ( = ?auto_155439 ?auto_155442 ) ) ( not ( = ?auto_155440 ?auto_155441 ) ) ( not ( = ?auto_155440 ?auto_155442 ) ) ( not ( = ?auto_155441 ?auto_155442 ) ) ( ON ?auto_155442 ?auto_155443 ) ( not ( = ?auto_155435 ?auto_155443 ) ) ( not ( = ?auto_155436 ?auto_155443 ) ) ( not ( = ?auto_155437 ?auto_155443 ) ) ( not ( = ?auto_155438 ?auto_155443 ) ) ( not ( = ?auto_155439 ?auto_155443 ) ) ( not ( = ?auto_155440 ?auto_155443 ) ) ( not ( = ?auto_155441 ?auto_155443 ) ) ( not ( = ?auto_155442 ?auto_155443 ) ) ( ON ?auto_155441 ?auto_155442 ) ( CLEAR ?auto_155441 ) ( ON-TABLE ?auto_155443 ) ( HOLDING ?auto_155440 ) ( CLEAR ?auto_155439 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_155435 ?auto_155436 ?auto_155437 ?auto_155438 ?auto_155439 ?auto_155440 )
      ( MAKE-8PILE ?auto_155435 ?auto_155436 ?auto_155437 ?auto_155438 ?auto_155439 ?auto_155440 ?auto_155441 ?auto_155442 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_155444 - BLOCK
      ?auto_155445 - BLOCK
      ?auto_155446 - BLOCK
      ?auto_155447 - BLOCK
      ?auto_155448 - BLOCK
      ?auto_155449 - BLOCK
      ?auto_155450 - BLOCK
      ?auto_155451 - BLOCK
    )
    :vars
    (
      ?auto_155452 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_155444 ) ( ON ?auto_155445 ?auto_155444 ) ( ON ?auto_155446 ?auto_155445 ) ( ON ?auto_155447 ?auto_155446 ) ( ON ?auto_155448 ?auto_155447 ) ( not ( = ?auto_155444 ?auto_155445 ) ) ( not ( = ?auto_155444 ?auto_155446 ) ) ( not ( = ?auto_155444 ?auto_155447 ) ) ( not ( = ?auto_155444 ?auto_155448 ) ) ( not ( = ?auto_155444 ?auto_155449 ) ) ( not ( = ?auto_155444 ?auto_155450 ) ) ( not ( = ?auto_155444 ?auto_155451 ) ) ( not ( = ?auto_155445 ?auto_155446 ) ) ( not ( = ?auto_155445 ?auto_155447 ) ) ( not ( = ?auto_155445 ?auto_155448 ) ) ( not ( = ?auto_155445 ?auto_155449 ) ) ( not ( = ?auto_155445 ?auto_155450 ) ) ( not ( = ?auto_155445 ?auto_155451 ) ) ( not ( = ?auto_155446 ?auto_155447 ) ) ( not ( = ?auto_155446 ?auto_155448 ) ) ( not ( = ?auto_155446 ?auto_155449 ) ) ( not ( = ?auto_155446 ?auto_155450 ) ) ( not ( = ?auto_155446 ?auto_155451 ) ) ( not ( = ?auto_155447 ?auto_155448 ) ) ( not ( = ?auto_155447 ?auto_155449 ) ) ( not ( = ?auto_155447 ?auto_155450 ) ) ( not ( = ?auto_155447 ?auto_155451 ) ) ( not ( = ?auto_155448 ?auto_155449 ) ) ( not ( = ?auto_155448 ?auto_155450 ) ) ( not ( = ?auto_155448 ?auto_155451 ) ) ( not ( = ?auto_155449 ?auto_155450 ) ) ( not ( = ?auto_155449 ?auto_155451 ) ) ( not ( = ?auto_155450 ?auto_155451 ) ) ( ON ?auto_155451 ?auto_155452 ) ( not ( = ?auto_155444 ?auto_155452 ) ) ( not ( = ?auto_155445 ?auto_155452 ) ) ( not ( = ?auto_155446 ?auto_155452 ) ) ( not ( = ?auto_155447 ?auto_155452 ) ) ( not ( = ?auto_155448 ?auto_155452 ) ) ( not ( = ?auto_155449 ?auto_155452 ) ) ( not ( = ?auto_155450 ?auto_155452 ) ) ( not ( = ?auto_155451 ?auto_155452 ) ) ( ON ?auto_155450 ?auto_155451 ) ( ON-TABLE ?auto_155452 ) ( CLEAR ?auto_155448 ) ( ON ?auto_155449 ?auto_155450 ) ( CLEAR ?auto_155449 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_155452 ?auto_155451 ?auto_155450 )
      ( MAKE-8PILE ?auto_155444 ?auto_155445 ?auto_155446 ?auto_155447 ?auto_155448 ?auto_155449 ?auto_155450 ?auto_155451 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_155453 - BLOCK
      ?auto_155454 - BLOCK
      ?auto_155455 - BLOCK
      ?auto_155456 - BLOCK
      ?auto_155457 - BLOCK
      ?auto_155458 - BLOCK
      ?auto_155459 - BLOCK
      ?auto_155460 - BLOCK
    )
    :vars
    (
      ?auto_155461 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_155453 ) ( ON ?auto_155454 ?auto_155453 ) ( ON ?auto_155455 ?auto_155454 ) ( ON ?auto_155456 ?auto_155455 ) ( not ( = ?auto_155453 ?auto_155454 ) ) ( not ( = ?auto_155453 ?auto_155455 ) ) ( not ( = ?auto_155453 ?auto_155456 ) ) ( not ( = ?auto_155453 ?auto_155457 ) ) ( not ( = ?auto_155453 ?auto_155458 ) ) ( not ( = ?auto_155453 ?auto_155459 ) ) ( not ( = ?auto_155453 ?auto_155460 ) ) ( not ( = ?auto_155454 ?auto_155455 ) ) ( not ( = ?auto_155454 ?auto_155456 ) ) ( not ( = ?auto_155454 ?auto_155457 ) ) ( not ( = ?auto_155454 ?auto_155458 ) ) ( not ( = ?auto_155454 ?auto_155459 ) ) ( not ( = ?auto_155454 ?auto_155460 ) ) ( not ( = ?auto_155455 ?auto_155456 ) ) ( not ( = ?auto_155455 ?auto_155457 ) ) ( not ( = ?auto_155455 ?auto_155458 ) ) ( not ( = ?auto_155455 ?auto_155459 ) ) ( not ( = ?auto_155455 ?auto_155460 ) ) ( not ( = ?auto_155456 ?auto_155457 ) ) ( not ( = ?auto_155456 ?auto_155458 ) ) ( not ( = ?auto_155456 ?auto_155459 ) ) ( not ( = ?auto_155456 ?auto_155460 ) ) ( not ( = ?auto_155457 ?auto_155458 ) ) ( not ( = ?auto_155457 ?auto_155459 ) ) ( not ( = ?auto_155457 ?auto_155460 ) ) ( not ( = ?auto_155458 ?auto_155459 ) ) ( not ( = ?auto_155458 ?auto_155460 ) ) ( not ( = ?auto_155459 ?auto_155460 ) ) ( ON ?auto_155460 ?auto_155461 ) ( not ( = ?auto_155453 ?auto_155461 ) ) ( not ( = ?auto_155454 ?auto_155461 ) ) ( not ( = ?auto_155455 ?auto_155461 ) ) ( not ( = ?auto_155456 ?auto_155461 ) ) ( not ( = ?auto_155457 ?auto_155461 ) ) ( not ( = ?auto_155458 ?auto_155461 ) ) ( not ( = ?auto_155459 ?auto_155461 ) ) ( not ( = ?auto_155460 ?auto_155461 ) ) ( ON ?auto_155459 ?auto_155460 ) ( ON-TABLE ?auto_155461 ) ( ON ?auto_155458 ?auto_155459 ) ( CLEAR ?auto_155458 ) ( HOLDING ?auto_155457 ) ( CLEAR ?auto_155456 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_155453 ?auto_155454 ?auto_155455 ?auto_155456 ?auto_155457 )
      ( MAKE-8PILE ?auto_155453 ?auto_155454 ?auto_155455 ?auto_155456 ?auto_155457 ?auto_155458 ?auto_155459 ?auto_155460 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_155462 - BLOCK
      ?auto_155463 - BLOCK
      ?auto_155464 - BLOCK
      ?auto_155465 - BLOCK
      ?auto_155466 - BLOCK
      ?auto_155467 - BLOCK
      ?auto_155468 - BLOCK
      ?auto_155469 - BLOCK
    )
    :vars
    (
      ?auto_155470 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_155462 ) ( ON ?auto_155463 ?auto_155462 ) ( ON ?auto_155464 ?auto_155463 ) ( ON ?auto_155465 ?auto_155464 ) ( not ( = ?auto_155462 ?auto_155463 ) ) ( not ( = ?auto_155462 ?auto_155464 ) ) ( not ( = ?auto_155462 ?auto_155465 ) ) ( not ( = ?auto_155462 ?auto_155466 ) ) ( not ( = ?auto_155462 ?auto_155467 ) ) ( not ( = ?auto_155462 ?auto_155468 ) ) ( not ( = ?auto_155462 ?auto_155469 ) ) ( not ( = ?auto_155463 ?auto_155464 ) ) ( not ( = ?auto_155463 ?auto_155465 ) ) ( not ( = ?auto_155463 ?auto_155466 ) ) ( not ( = ?auto_155463 ?auto_155467 ) ) ( not ( = ?auto_155463 ?auto_155468 ) ) ( not ( = ?auto_155463 ?auto_155469 ) ) ( not ( = ?auto_155464 ?auto_155465 ) ) ( not ( = ?auto_155464 ?auto_155466 ) ) ( not ( = ?auto_155464 ?auto_155467 ) ) ( not ( = ?auto_155464 ?auto_155468 ) ) ( not ( = ?auto_155464 ?auto_155469 ) ) ( not ( = ?auto_155465 ?auto_155466 ) ) ( not ( = ?auto_155465 ?auto_155467 ) ) ( not ( = ?auto_155465 ?auto_155468 ) ) ( not ( = ?auto_155465 ?auto_155469 ) ) ( not ( = ?auto_155466 ?auto_155467 ) ) ( not ( = ?auto_155466 ?auto_155468 ) ) ( not ( = ?auto_155466 ?auto_155469 ) ) ( not ( = ?auto_155467 ?auto_155468 ) ) ( not ( = ?auto_155467 ?auto_155469 ) ) ( not ( = ?auto_155468 ?auto_155469 ) ) ( ON ?auto_155469 ?auto_155470 ) ( not ( = ?auto_155462 ?auto_155470 ) ) ( not ( = ?auto_155463 ?auto_155470 ) ) ( not ( = ?auto_155464 ?auto_155470 ) ) ( not ( = ?auto_155465 ?auto_155470 ) ) ( not ( = ?auto_155466 ?auto_155470 ) ) ( not ( = ?auto_155467 ?auto_155470 ) ) ( not ( = ?auto_155468 ?auto_155470 ) ) ( not ( = ?auto_155469 ?auto_155470 ) ) ( ON ?auto_155468 ?auto_155469 ) ( ON-TABLE ?auto_155470 ) ( ON ?auto_155467 ?auto_155468 ) ( CLEAR ?auto_155465 ) ( ON ?auto_155466 ?auto_155467 ) ( CLEAR ?auto_155466 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_155470 ?auto_155469 ?auto_155468 ?auto_155467 )
      ( MAKE-8PILE ?auto_155462 ?auto_155463 ?auto_155464 ?auto_155465 ?auto_155466 ?auto_155467 ?auto_155468 ?auto_155469 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_155471 - BLOCK
      ?auto_155472 - BLOCK
      ?auto_155473 - BLOCK
      ?auto_155474 - BLOCK
      ?auto_155475 - BLOCK
      ?auto_155476 - BLOCK
      ?auto_155477 - BLOCK
      ?auto_155478 - BLOCK
    )
    :vars
    (
      ?auto_155479 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_155471 ) ( ON ?auto_155472 ?auto_155471 ) ( ON ?auto_155473 ?auto_155472 ) ( not ( = ?auto_155471 ?auto_155472 ) ) ( not ( = ?auto_155471 ?auto_155473 ) ) ( not ( = ?auto_155471 ?auto_155474 ) ) ( not ( = ?auto_155471 ?auto_155475 ) ) ( not ( = ?auto_155471 ?auto_155476 ) ) ( not ( = ?auto_155471 ?auto_155477 ) ) ( not ( = ?auto_155471 ?auto_155478 ) ) ( not ( = ?auto_155472 ?auto_155473 ) ) ( not ( = ?auto_155472 ?auto_155474 ) ) ( not ( = ?auto_155472 ?auto_155475 ) ) ( not ( = ?auto_155472 ?auto_155476 ) ) ( not ( = ?auto_155472 ?auto_155477 ) ) ( not ( = ?auto_155472 ?auto_155478 ) ) ( not ( = ?auto_155473 ?auto_155474 ) ) ( not ( = ?auto_155473 ?auto_155475 ) ) ( not ( = ?auto_155473 ?auto_155476 ) ) ( not ( = ?auto_155473 ?auto_155477 ) ) ( not ( = ?auto_155473 ?auto_155478 ) ) ( not ( = ?auto_155474 ?auto_155475 ) ) ( not ( = ?auto_155474 ?auto_155476 ) ) ( not ( = ?auto_155474 ?auto_155477 ) ) ( not ( = ?auto_155474 ?auto_155478 ) ) ( not ( = ?auto_155475 ?auto_155476 ) ) ( not ( = ?auto_155475 ?auto_155477 ) ) ( not ( = ?auto_155475 ?auto_155478 ) ) ( not ( = ?auto_155476 ?auto_155477 ) ) ( not ( = ?auto_155476 ?auto_155478 ) ) ( not ( = ?auto_155477 ?auto_155478 ) ) ( ON ?auto_155478 ?auto_155479 ) ( not ( = ?auto_155471 ?auto_155479 ) ) ( not ( = ?auto_155472 ?auto_155479 ) ) ( not ( = ?auto_155473 ?auto_155479 ) ) ( not ( = ?auto_155474 ?auto_155479 ) ) ( not ( = ?auto_155475 ?auto_155479 ) ) ( not ( = ?auto_155476 ?auto_155479 ) ) ( not ( = ?auto_155477 ?auto_155479 ) ) ( not ( = ?auto_155478 ?auto_155479 ) ) ( ON ?auto_155477 ?auto_155478 ) ( ON-TABLE ?auto_155479 ) ( ON ?auto_155476 ?auto_155477 ) ( ON ?auto_155475 ?auto_155476 ) ( CLEAR ?auto_155475 ) ( HOLDING ?auto_155474 ) ( CLEAR ?auto_155473 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_155471 ?auto_155472 ?auto_155473 ?auto_155474 )
      ( MAKE-8PILE ?auto_155471 ?auto_155472 ?auto_155473 ?auto_155474 ?auto_155475 ?auto_155476 ?auto_155477 ?auto_155478 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_155480 - BLOCK
      ?auto_155481 - BLOCK
      ?auto_155482 - BLOCK
      ?auto_155483 - BLOCK
      ?auto_155484 - BLOCK
      ?auto_155485 - BLOCK
      ?auto_155486 - BLOCK
      ?auto_155487 - BLOCK
    )
    :vars
    (
      ?auto_155488 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_155480 ) ( ON ?auto_155481 ?auto_155480 ) ( ON ?auto_155482 ?auto_155481 ) ( not ( = ?auto_155480 ?auto_155481 ) ) ( not ( = ?auto_155480 ?auto_155482 ) ) ( not ( = ?auto_155480 ?auto_155483 ) ) ( not ( = ?auto_155480 ?auto_155484 ) ) ( not ( = ?auto_155480 ?auto_155485 ) ) ( not ( = ?auto_155480 ?auto_155486 ) ) ( not ( = ?auto_155480 ?auto_155487 ) ) ( not ( = ?auto_155481 ?auto_155482 ) ) ( not ( = ?auto_155481 ?auto_155483 ) ) ( not ( = ?auto_155481 ?auto_155484 ) ) ( not ( = ?auto_155481 ?auto_155485 ) ) ( not ( = ?auto_155481 ?auto_155486 ) ) ( not ( = ?auto_155481 ?auto_155487 ) ) ( not ( = ?auto_155482 ?auto_155483 ) ) ( not ( = ?auto_155482 ?auto_155484 ) ) ( not ( = ?auto_155482 ?auto_155485 ) ) ( not ( = ?auto_155482 ?auto_155486 ) ) ( not ( = ?auto_155482 ?auto_155487 ) ) ( not ( = ?auto_155483 ?auto_155484 ) ) ( not ( = ?auto_155483 ?auto_155485 ) ) ( not ( = ?auto_155483 ?auto_155486 ) ) ( not ( = ?auto_155483 ?auto_155487 ) ) ( not ( = ?auto_155484 ?auto_155485 ) ) ( not ( = ?auto_155484 ?auto_155486 ) ) ( not ( = ?auto_155484 ?auto_155487 ) ) ( not ( = ?auto_155485 ?auto_155486 ) ) ( not ( = ?auto_155485 ?auto_155487 ) ) ( not ( = ?auto_155486 ?auto_155487 ) ) ( ON ?auto_155487 ?auto_155488 ) ( not ( = ?auto_155480 ?auto_155488 ) ) ( not ( = ?auto_155481 ?auto_155488 ) ) ( not ( = ?auto_155482 ?auto_155488 ) ) ( not ( = ?auto_155483 ?auto_155488 ) ) ( not ( = ?auto_155484 ?auto_155488 ) ) ( not ( = ?auto_155485 ?auto_155488 ) ) ( not ( = ?auto_155486 ?auto_155488 ) ) ( not ( = ?auto_155487 ?auto_155488 ) ) ( ON ?auto_155486 ?auto_155487 ) ( ON-TABLE ?auto_155488 ) ( ON ?auto_155485 ?auto_155486 ) ( ON ?auto_155484 ?auto_155485 ) ( CLEAR ?auto_155482 ) ( ON ?auto_155483 ?auto_155484 ) ( CLEAR ?auto_155483 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_155488 ?auto_155487 ?auto_155486 ?auto_155485 ?auto_155484 )
      ( MAKE-8PILE ?auto_155480 ?auto_155481 ?auto_155482 ?auto_155483 ?auto_155484 ?auto_155485 ?auto_155486 ?auto_155487 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_155489 - BLOCK
      ?auto_155490 - BLOCK
      ?auto_155491 - BLOCK
      ?auto_155492 - BLOCK
      ?auto_155493 - BLOCK
      ?auto_155494 - BLOCK
      ?auto_155495 - BLOCK
      ?auto_155496 - BLOCK
    )
    :vars
    (
      ?auto_155497 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_155489 ) ( ON ?auto_155490 ?auto_155489 ) ( not ( = ?auto_155489 ?auto_155490 ) ) ( not ( = ?auto_155489 ?auto_155491 ) ) ( not ( = ?auto_155489 ?auto_155492 ) ) ( not ( = ?auto_155489 ?auto_155493 ) ) ( not ( = ?auto_155489 ?auto_155494 ) ) ( not ( = ?auto_155489 ?auto_155495 ) ) ( not ( = ?auto_155489 ?auto_155496 ) ) ( not ( = ?auto_155490 ?auto_155491 ) ) ( not ( = ?auto_155490 ?auto_155492 ) ) ( not ( = ?auto_155490 ?auto_155493 ) ) ( not ( = ?auto_155490 ?auto_155494 ) ) ( not ( = ?auto_155490 ?auto_155495 ) ) ( not ( = ?auto_155490 ?auto_155496 ) ) ( not ( = ?auto_155491 ?auto_155492 ) ) ( not ( = ?auto_155491 ?auto_155493 ) ) ( not ( = ?auto_155491 ?auto_155494 ) ) ( not ( = ?auto_155491 ?auto_155495 ) ) ( not ( = ?auto_155491 ?auto_155496 ) ) ( not ( = ?auto_155492 ?auto_155493 ) ) ( not ( = ?auto_155492 ?auto_155494 ) ) ( not ( = ?auto_155492 ?auto_155495 ) ) ( not ( = ?auto_155492 ?auto_155496 ) ) ( not ( = ?auto_155493 ?auto_155494 ) ) ( not ( = ?auto_155493 ?auto_155495 ) ) ( not ( = ?auto_155493 ?auto_155496 ) ) ( not ( = ?auto_155494 ?auto_155495 ) ) ( not ( = ?auto_155494 ?auto_155496 ) ) ( not ( = ?auto_155495 ?auto_155496 ) ) ( ON ?auto_155496 ?auto_155497 ) ( not ( = ?auto_155489 ?auto_155497 ) ) ( not ( = ?auto_155490 ?auto_155497 ) ) ( not ( = ?auto_155491 ?auto_155497 ) ) ( not ( = ?auto_155492 ?auto_155497 ) ) ( not ( = ?auto_155493 ?auto_155497 ) ) ( not ( = ?auto_155494 ?auto_155497 ) ) ( not ( = ?auto_155495 ?auto_155497 ) ) ( not ( = ?auto_155496 ?auto_155497 ) ) ( ON ?auto_155495 ?auto_155496 ) ( ON-TABLE ?auto_155497 ) ( ON ?auto_155494 ?auto_155495 ) ( ON ?auto_155493 ?auto_155494 ) ( ON ?auto_155492 ?auto_155493 ) ( CLEAR ?auto_155492 ) ( HOLDING ?auto_155491 ) ( CLEAR ?auto_155490 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_155489 ?auto_155490 ?auto_155491 )
      ( MAKE-8PILE ?auto_155489 ?auto_155490 ?auto_155491 ?auto_155492 ?auto_155493 ?auto_155494 ?auto_155495 ?auto_155496 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_155498 - BLOCK
      ?auto_155499 - BLOCK
      ?auto_155500 - BLOCK
      ?auto_155501 - BLOCK
      ?auto_155502 - BLOCK
      ?auto_155503 - BLOCK
      ?auto_155504 - BLOCK
      ?auto_155505 - BLOCK
    )
    :vars
    (
      ?auto_155506 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_155498 ) ( ON ?auto_155499 ?auto_155498 ) ( not ( = ?auto_155498 ?auto_155499 ) ) ( not ( = ?auto_155498 ?auto_155500 ) ) ( not ( = ?auto_155498 ?auto_155501 ) ) ( not ( = ?auto_155498 ?auto_155502 ) ) ( not ( = ?auto_155498 ?auto_155503 ) ) ( not ( = ?auto_155498 ?auto_155504 ) ) ( not ( = ?auto_155498 ?auto_155505 ) ) ( not ( = ?auto_155499 ?auto_155500 ) ) ( not ( = ?auto_155499 ?auto_155501 ) ) ( not ( = ?auto_155499 ?auto_155502 ) ) ( not ( = ?auto_155499 ?auto_155503 ) ) ( not ( = ?auto_155499 ?auto_155504 ) ) ( not ( = ?auto_155499 ?auto_155505 ) ) ( not ( = ?auto_155500 ?auto_155501 ) ) ( not ( = ?auto_155500 ?auto_155502 ) ) ( not ( = ?auto_155500 ?auto_155503 ) ) ( not ( = ?auto_155500 ?auto_155504 ) ) ( not ( = ?auto_155500 ?auto_155505 ) ) ( not ( = ?auto_155501 ?auto_155502 ) ) ( not ( = ?auto_155501 ?auto_155503 ) ) ( not ( = ?auto_155501 ?auto_155504 ) ) ( not ( = ?auto_155501 ?auto_155505 ) ) ( not ( = ?auto_155502 ?auto_155503 ) ) ( not ( = ?auto_155502 ?auto_155504 ) ) ( not ( = ?auto_155502 ?auto_155505 ) ) ( not ( = ?auto_155503 ?auto_155504 ) ) ( not ( = ?auto_155503 ?auto_155505 ) ) ( not ( = ?auto_155504 ?auto_155505 ) ) ( ON ?auto_155505 ?auto_155506 ) ( not ( = ?auto_155498 ?auto_155506 ) ) ( not ( = ?auto_155499 ?auto_155506 ) ) ( not ( = ?auto_155500 ?auto_155506 ) ) ( not ( = ?auto_155501 ?auto_155506 ) ) ( not ( = ?auto_155502 ?auto_155506 ) ) ( not ( = ?auto_155503 ?auto_155506 ) ) ( not ( = ?auto_155504 ?auto_155506 ) ) ( not ( = ?auto_155505 ?auto_155506 ) ) ( ON ?auto_155504 ?auto_155505 ) ( ON-TABLE ?auto_155506 ) ( ON ?auto_155503 ?auto_155504 ) ( ON ?auto_155502 ?auto_155503 ) ( ON ?auto_155501 ?auto_155502 ) ( CLEAR ?auto_155499 ) ( ON ?auto_155500 ?auto_155501 ) ( CLEAR ?auto_155500 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_155506 ?auto_155505 ?auto_155504 ?auto_155503 ?auto_155502 ?auto_155501 )
      ( MAKE-8PILE ?auto_155498 ?auto_155499 ?auto_155500 ?auto_155501 ?auto_155502 ?auto_155503 ?auto_155504 ?auto_155505 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_155507 - BLOCK
      ?auto_155508 - BLOCK
      ?auto_155509 - BLOCK
      ?auto_155510 - BLOCK
      ?auto_155511 - BLOCK
      ?auto_155512 - BLOCK
      ?auto_155513 - BLOCK
      ?auto_155514 - BLOCK
    )
    :vars
    (
      ?auto_155515 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_155507 ) ( not ( = ?auto_155507 ?auto_155508 ) ) ( not ( = ?auto_155507 ?auto_155509 ) ) ( not ( = ?auto_155507 ?auto_155510 ) ) ( not ( = ?auto_155507 ?auto_155511 ) ) ( not ( = ?auto_155507 ?auto_155512 ) ) ( not ( = ?auto_155507 ?auto_155513 ) ) ( not ( = ?auto_155507 ?auto_155514 ) ) ( not ( = ?auto_155508 ?auto_155509 ) ) ( not ( = ?auto_155508 ?auto_155510 ) ) ( not ( = ?auto_155508 ?auto_155511 ) ) ( not ( = ?auto_155508 ?auto_155512 ) ) ( not ( = ?auto_155508 ?auto_155513 ) ) ( not ( = ?auto_155508 ?auto_155514 ) ) ( not ( = ?auto_155509 ?auto_155510 ) ) ( not ( = ?auto_155509 ?auto_155511 ) ) ( not ( = ?auto_155509 ?auto_155512 ) ) ( not ( = ?auto_155509 ?auto_155513 ) ) ( not ( = ?auto_155509 ?auto_155514 ) ) ( not ( = ?auto_155510 ?auto_155511 ) ) ( not ( = ?auto_155510 ?auto_155512 ) ) ( not ( = ?auto_155510 ?auto_155513 ) ) ( not ( = ?auto_155510 ?auto_155514 ) ) ( not ( = ?auto_155511 ?auto_155512 ) ) ( not ( = ?auto_155511 ?auto_155513 ) ) ( not ( = ?auto_155511 ?auto_155514 ) ) ( not ( = ?auto_155512 ?auto_155513 ) ) ( not ( = ?auto_155512 ?auto_155514 ) ) ( not ( = ?auto_155513 ?auto_155514 ) ) ( ON ?auto_155514 ?auto_155515 ) ( not ( = ?auto_155507 ?auto_155515 ) ) ( not ( = ?auto_155508 ?auto_155515 ) ) ( not ( = ?auto_155509 ?auto_155515 ) ) ( not ( = ?auto_155510 ?auto_155515 ) ) ( not ( = ?auto_155511 ?auto_155515 ) ) ( not ( = ?auto_155512 ?auto_155515 ) ) ( not ( = ?auto_155513 ?auto_155515 ) ) ( not ( = ?auto_155514 ?auto_155515 ) ) ( ON ?auto_155513 ?auto_155514 ) ( ON-TABLE ?auto_155515 ) ( ON ?auto_155512 ?auto_155513 ) ( ON ?auto_155511 ?auto_155512 ) ( ON ?auto_155510 ?auto_155511 ) ( ON ?auto_155509 ?auto_155510 ) ( CLEAR ?auto_155509 ) ( HOLDING ?auto_155508 ) ( CLEAR ?auto_155507 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_155507 ?auto_155508 )
      ( MAKE-8PILE ?auto_155507 ?auto_155508 ?auto_155509 ?auto_155510 ?auto_155511 ?auto_155512 ?auto_155513 ?auto_155514 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_155516 - BLOCK
      ?auto_155517 - BLOCK
      ?auto_155518 - BLOCK
      ?auto_155519 - BLOCK
      ?auto_155520 - BLOCK
      ?auto_155521 - BLOCK
      ?auto_155522 - BLOCK
      ?auto_155523 - BLOCK
    )
    :vars
    (
      ?auto_155524 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_155516 ) ( not ( = ?auto_155516 ?auto_155517 ) ) ( not ( = ?auto_155516 ?auto_155518 ) ) ( not ( = ?auto_155516 ?auto_155519 ) ) ( not ( = ?auto_155516 ?auto_155520 ) ) ( not ( = ?auto_155516 ?auto_155521 ) ) ( not ( = ?auto_155516 ?auto_155522 ) ) ( not ( = ?auto_155516 ?auto_155523 ) ) ( not ( = ?auto_155517 ?auto_155518 ) ) ( not ( = ?auto_155517 ?auto_155519 ) ) ( not ( = ?auto_155517 ?auto_155520 ) ) ( not ( = ?auto_155517 ?auto_155521 ) ) ( not ( = ?auto_155517 ?auto_155522 ) ) ( not ( = ?auto_155517 ?auto_155523 ) ) ( not ( = ?auto_155518 ?auto_155519 ) ) ( not ( = ?auto_155518 ?auto_155520 ) ) ( not ( = ?auto_155518 ?auto_155521 ) ) ( not ( = ?auto_155518 ?auto_155522 ) ) ( not ( = ?auto_155518 ?auto_155523 ) ) ( not ( = ?auto_155519 ?auto_155520 ) ) ( not ( = ?auto_155519 ?auto_155521 ) ) ( not ( = ?auto_155519 ?auto_155522 ) ) ( not ( = ?auto_155519 ?auto_155523 ) ) ( not ( = ?auto_155520 ?auto_155521 ) ) ( not ( = ?auto_155520 ?auto_155522 ) ) ( not ( = ?auto_155520 ?auto_155523 ) ) ( not ( = ?auto_155521 ?auto_155522 ) ) ( not ( = ?auto_155521 ?auto_155523 ) ) ( not ( = ?auto_155522 ?auto_155523 ) ) ( ON ?auto_155523 ?auto_155524 ) ( not ( = ?auto_155516 ?auto_155524 ) ) ( not ( = ?auto_155517 ?auto_155524 ) ) ( not ( = ?auto_155518 ?auto_155524 ) ) ( not ( = ?auto_155519 ?auto_155524 ) ) ( not ( = ?auto_155520 ?auto_155524 ) ) ( not ( = ?auto_155521 ?auto_155524 ) ) ( not ( = ?auto_155522 ?auto_155524 ) ) ( not ( = ?auto_155523 ?auto_155524 ) ) ( ON ?auto_155522 ?auto_155523 ) ( ON-TABLE ?auto_155524 ) ( ON ?auto_155521 ?auto_155522 ) ( ON ?auto_155520 ?auto_155521 ) ( ON ?auto_155519 ?auto_155520 ) ( ON ?auto_155518 ?auto_155519 ) ( CLEAR ?auto_155516 ) ( ON ?auto_155517 ?auto_155518 ) ( CLEAR ?auto_155517 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_155524 ?auto_155523 ?auto_155522 ?auto_155521 ?auto_155520 ?auto_155519 ?auto_155518 )
      ( MAKE-8PILE ?auto_155516 ?auto_155517 ?auto_155518 ?auto_155519 ?auto_155520 ?auto_155521 ?auto_155522 ?auto_155523 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_155525 - BLOCK
      ?auto_155526 - BLOCK
      ?auto_155527 - BLOCK
      ?auto_155528 - BLOCK
      ?auto_155529 - BLOCK
      ?auto_155530 - BLOCK
      ?auto_155531 - BLOCK
      ?auto_155532 - BLOCK
    )
    :vars
    (
      ?auto_155533 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_155525 ?auto_155526 ) ) ( not ( = ?auto_155525 ?auto_155527 ) ) ( not ( = ?auto_155525 ?auto_155528 ) ) ( not ( = ?auto_155525 ?auto_155529 ) ) ( not ( = ?auto_155525 ?auto_155530 ) ) ( not ( = ?auto_155525 ?auto_155531 ) ) ( not ( = ?auto_155525 ?auto_155532 ) ) ( not ( = ?auto_155526 ?auto_155527 ) ) ( not ( = ?auto_155526 ?auto_155528 ) ) ( not ( = ?auto_155526 ?auto_155529 ) ) ( not ( = ?auto_155526 ?auto_155530 ) ) ( not ( = ?auto_155526 ?auto_155531 ) ) ( not ( = ?auto_155526 ?auto_155532 ) ) ( not ( = ?auto_155527 ?auto_155528 ) ) ( not ( = ?auto_155527 ?auto_155529 ) ) ( not ( = ?auto_155527 ?auto_155530 ) ) ( not ( = ?auto_155527 ?auto_155531 ) ) ( not ( = ?auto_155527 ?auto_155532 ) ) ( not ( = ?auto_155528 ?auto_155529 ) ) ( not ( = ?auto_155528 ?auto_155530 ) ) ( not ( = ?auto_155528 ?auto_155531 ) ) ( not ( = ?auto_155528 ?auto_155532 ) ) ( not ( = ?auto_155529 ?auto_155530 ) ) ( not ( = ?auto_155529 ?auto_155531 ) ) ( not ( = ?auto_155529 ?auto_155532 ) ) ( not ( = ?auto_155530 ?auto_155531 ) ) ( not ( = ?auto_155530 ?auto_155532 ) ) ( not ( = ?auto_155531 ?auto_155532 ) ) ( ON ?auto_155532 ?auto_155533 ) ( not ( = ?auto_155525 ?auto_155533 ) ) ( not ( = ?auto_155526 ?auto_155533 ) ) ( not ( = ?auto_155527 ?auto_155533 ) ) ( not ( = ?auto_155528 ?auto_155533 ) ) ( not ( = ?auto_155529 ?auto_155533 ) ) ( not ( = ?auto_155530 ?auto_155533 ) ) ( not ( = ?auto_155531 ?auto_155533 ) ) ( not ( = ?auto_155532 ?auto_155533 ) ) ( ON ?auto_155531 ?auto_155532 ) ( ON-TABLE ?auto_155533 ) ( ON ?auto_155530 ?auto_155531 ) ( ON ?auto_155529 ?auto_155530 ) ( ON ?auto_155528 ?auto_155529 ) ( ON ?auto_155527 ?auto_155528 ) ( ON ?auto_155526 ?auto_155527 ) ( CLEAR ?auto_155526 ) ( HOLDING ?auto_155525 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_155525 )
      ( MAKE-8PILE ?auto_155525 ?auto_155526 ?auto_155527 ?auto_155528 ?auto_155529 ?auto_155530 ?auto_155531 ?auto_155532 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_155534 - BLOCK
      ?auto_155535 - BLOCK
      ?auto_155536 - BLOCK
      ?auto_155537 - BLOCK
      ?auto_155538 - BLOCK
      ?auto_155539 - BLOCK
      ?auto_155540 - BLOCK
      ?auto_155541 - BLOCK
    )
    :vars
    (
      ?auto_155542 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_155534 ?auto_155535 ) ) ( not ( = ?auto_155534 ?auto_155536 ) ) ( not ( = ?auto_155534 ?auto_155537 ) ) ( not ( = ?auto_155534 ?auto_155538 ) ) ( not ( = ?auto_155534 ?auto_155539 ) ) ( not ( = ?auto_155534 ?auto_155540 ) ) ( not ( = ?auto_155534 ?auto_155541 ) ) ( not ( = ?auto_155535 ?auto_155536 ) ) ( not ( = ?auto_155535 ?auto_155537 ) ) ( not ( = ?auto_155535 ?auto_155538 ) ) ( not ( = ?auto_155535 ?auto_155539 ) ) ( not ( = ?auto_155535 ?auto_155540 ) ) ( not ( = ?auto_155535 ?auto_155541 ) ) ( not ( = ?auto_155536 ?auto_155537 ) ) ( not ( = ?auto_155536 ?auto_155538 ) ) ( not ( = ?auto_155536 ?auto_155539 ) ) ( not ( = ?auto_155536 ?auto_155540 ) ) ( not ( = ?auto_155536 ?auto_155541 ) ) ( not ( = ?auto_155537 ?auto_155538 ) ) ( not ( = ?auto_155537 ?auto_155539 ) ) ( not ( = ?auto_155537 ?auto_155540 ) ) ( not ( = ?auto_155537 ?auto_155541 ) ) ( not ( = ?auto_155538 ?auto_155539 ) ) ( not ( = ?auto_155538 ?auto_155540 ) ) ( not ( = ?auto_155538 ?auto_155541 ) ) ( not ( = ?auto_155539 ?auto_155540 ) ) ( not ( = ?auto_155539 ?auto_155541 ) ) ( not ( = ?auto_155540 ?auto_155541 ) ) ( ON ?auto_155541 ?auto_155542 ) ( not ( = ?auto_155534 ?auto_155542 ) ) ( not ( = ?auto_155535 ?auto_155542 ) ) ( not ( = ?auto_155536 ?auto_155542 ) ) ( not ( = ?auto_155537 ?auto_155542 ) ) ( not ( = ?auto_155538 ?auto_155542 ) ) ( not ( = ?auto_155539 ?auto_155542 ) ) ( not ( = ?auto_155540 ?auto_155542 ) ) ( not ( = ?auto_155541 ?auto_155542 ) ) ( ON ?auto_155540 ?auto_155541 ) ( ON-TABLE ?auto_155542 ) ( ON ?auto_155539 ?auto_155540 ) ( ON ?auto_155538 ?auto_155539 ) ( ON ?auto_155537 ?auto_155538 ) ( ON ?auto_155536 ?auto_155537 ) ( ON ?auto_155535 ?auto_155536 ) ( ON ?auto_155534 ?auto_155535 ) ( CLEAR ?auto_155534 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_155542 ?auto_155541 ?auto_155540 ?auto_155539 ?auto_155538 ?auto_155537 ?auto_155536 ?auto_155535 )
      ( MAKE-8PILE ?auto_155534 ?auto_155535 ?auto_155536 ?auto_155537 ?auto_155538 ?auto_155539 ?auto_155540 ?auto_155541 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_155679 - BLOCK
    )
    :vars
    (
      ?auto_155680 - BLOCK
      ?auto_155681 - BLOCK
      ?auto_155682 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_155679 ?auto_155680 ) ( CLEAR ?auto_155679 ) ( not ( = ?auto_155679 ?auto_155680 ) ) ( HOLDING ?auto_155681 ) ( CLEAR ?auto_155682 ) ( not ( = ?auto_155679 ?auto_155681 ) ) ( not ( = ?auto_155679 ?auto_155682 ) ) ( not ( = ?auto_155680 ?auto_155681 ) ) ( not ( = ?auto_155680 ?auto_155682 ) ) ( not ( = ?auto_155681 ?auto_155682 ) ) )
    :subtasks
    ( ( !STACK ?auto_155681 ?auto_155682 )
      ( MAKE-1PILE ?auto_155679 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_155683 - BLOCK
    )
    :vars
    (
      ?auto_155686 - BLOCK
      ?auto_155685 - BLOCK
      ?auto_155684 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_155683 ?auto_155686 ) ( not ( = ?auto_155683 ?auto_155686 ) ) ( CLEAR ?auto_155685 ) ( not ( = ?auto_155683 ?auto_155684 ) ) ( not ( = ?auto_155683 ?auto_155685 ) ) ( not ( = ?auto_155686 ?auto_155684 ) ) ( not ( = ?auto_155686 ?auto_155685 ) ) ( not ( = ?auto_155684 ?auto_155685 ) ) ( ON ?auto_155684 ?auto_155683 ) ( CLEAR ?auto_155684 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_155686 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_155686 ?auto_155683 )
      ( MAKE-1PILE ?auto_155683 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_155687 - BLOCK
    )
    :vars
    (
      ?auto_155688 - BLOCK
      ?auto_155689 - BLOCK
      ?auto_155690 - BLOCK
      ?auto_155695 - BLOCK
      ?auto_155694 - BLOCK
      ?auto_155692 - BLOCK
      ?auto_155693 - BLOCK
      ?auto_155691 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_155687 ?auto_155688 ) ( not ( = ?auto_155687 ?auto_155688 ) ) ( not ( = ?auto_155687 ?auto_155689 ) ) ( not ( = ?auto_155687 ?auto_155690 ) ) ( not ( = ?auto_155688 ?auto_155689 ) ) ( not ( = ?auto_155688 ?auto_155690 ) ) ( not ( = ?auto_155689 ?auto_155690 ) ) ( ON ?auto_155689 ?auto_155687 ) ( CLEAR ?auto_155689 ) ( ON-TABLE ?auto_155688 ) ( HOLDING ?auto_155690 ) ( CLEAR ?auto_155695 ) ( ON-TABLE ?auto_155694 ) ( ON ?auto_155692 ?auto_155694 ) ( ON ?auto_155693 ?auto_155692 ) ( ON ?auto_155691 ?auto_155693 ) ( ON ?auto_155695 ?auto_155691 ) ( not ( = ?auto_155694 ?auto_155692 ) ) ( not ( = ?auto_155694 ?auto_155693 ) ) ( not ( = ?auto_155694 ?auto_155691 ) ) ( not ( = ?auto_155694 ?auto_155695 ) ) ( not ( = ?auto_155694 ?auto_155690 ) ) ( not ( = ?auto_155692 ?auto_155693 ) ) ( not ( = ?auto_155692 ?auto_155691 ) ) ( not ( = ?auto_155692 ?auto_155695 ) ) ( not ( = ?auto_155692 ?auto_155690 ) ) ( not ( = ?auto_155693 ?auto_155691 ) ) ( not ( = ?auto_155693 ?auto_155695 ) ) ( not ( = ?auto_155693 ?auto_155690 ) ) ( not ( = ?auto_155691 ?auto_155695 ) ) ( not ( = ?auto_155691 ?auto_155690 ) ) ( not ( = ?auto_155695 ?auto_155690 ) ) ( not ( = ?auto_155687 ?auto_155695 ) ) ( not ( = ?auto_155687 ?auto_155694 ) ) ( not ( = ?auto_155687 ?auto_155692 ) ) ( not ( = ?auto_155687 ?auto_155693 ) ) ( not ( = ?auto_155687 ?auto_155691 ) ) ( not ( = ?auto_155688 ?auto_155695 ) ) ( not ( = ?auto_155688 ?auto_155694 ) ) ( not ( = ?auto_155688 ?auto_155692 ) ) ( not ( = ?auto_155688 ?auto_155693 ) ) ( not ( = ?auto_155688 ?auto_155691 ) ) ( not ( = ?auto_155689 ?auto_155695 ) ) ( not ( = ?auto_155689 ?auto_155694 ) ) ( not ( = ?auto_155689 ?auto_155692 ) ) ( not ( = ?auto_155689 ?auto_155693 ) ) ( not ( = ?auto_155689 ?auto_155691 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_155694 ?auto_155692 ?auto_155693 ?auto_155691 ?auto_155695 ?auto_155690 )
      ( MAKE-1PILE ?auto_155687 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_155696 - BLOCK
    )
    :vars
    (
      ?auto_155698 - BLOCK
      ?auto_155697 - BLOCK
      ?auto_155702 - BLOCK
      ?auto_155703 - BLOCK
      ?auto_155704 - BLOCK
      ?auto_155699 - BLOCK
      ?auto_155701 - BLOCK
      ?auto_155700 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_155696 ?auto_155698 ) ( not ( = ?auto_155696 ?auto_155698 ) ) ( not ( = ?auto_155696 ?auto_155697 ) ) ( not ( = ?auto_155696 ?auto_155702 ) ) ( not ( = ?auto_155698 ?auto_155697 ) ) ( not ( = ?auto_155698 ?auto_155702 ) ) ( not ( = ?auto_155697 ?auto_155702 ) ) ( ON ?auto_155697 ?auto_155696 ) ( ON-TABLE ?auto_155698 ) ( CLEAR ?auto_155703 ) ( ON-TABLE ?auto_155704 ) ( ON ?auto_155699 ?auto_155704 ) ( ON ?auto_155701 ?auto_155699 ) ( ON ?auto_155700 ?auto_155701 ) ( ON ?auto_155703 ?auto_155700 ) ( not ( = ?auto_155704 ?auto_155699 ) ) ( not ( = ?auto_155704 ?auto_155701 ) ) ( not ( = ?auto_155704 ?auto_155700 ) ) ( not ( = ?auto_155704 ?auto_155703 ) ) ( not ( = ?auto_155704 ?auto_155702 ) ) ( not ( = ?auto_155699 ?auto_155701 ) ) ( not ( = ?auto_155699 ?auto_155700 ) ) ( not ( = ?auto_155699 ?auto_155703 ) ) ( not ( = ?auto_155699 ?auto_155702 ) ) ( not ( = ?auto_155701 ?auto_155700 ) ) ( not ( = ?auto_155701 ?auto_155703 ) ) ( not ( = ?auto_155701 ?auto_155702 ) ) ( not ( = ?auto_155700 ?auto_155703 ) ) ( not ( = ?auto_155700 ?auto_155702 ) ) ( not ( = ?auto_155703 ?auto_155702 ) ) ( not ( = ?auto_155696 ?auto_155703 ) ) ( not ( = ?auto_155696 ?auto_155704 ) ) ( not ( = ?auto_155696 ?auto_155699 ) ) ( not ( = ?auto_155696 ?auto_155701 ) ) ( not ( = ?auto_155696 ?auto_155700 ) ) ( not ( = ?auto_155698 ?auto_155703 ) ) ( not ( = ?auto_155698 ?auto_155704 ) ) ( not ( = ?auto_155698 ?auto_155699 ) ) ( not ( = ?auto_155698 ?auto_155701 ) ) ( not ( = ?auto_155698 ?auto_155700 ) ) ( not ( = ?auto_155697 ?auto_155703 ) ) ( not ( = ?auto_155697 ?auto_155704 ) ) ( not ( = ?auto_155697 ?auto_155699 ) ) ( not ( = ?auto_155697 ?auto_155701 ) ) ( not ( = ?auto_155697 ?auto_155700 ) ) ( ON ?auto_155702 ?auto_155697 ) ( CLEAR ?auto_155702 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_155698 ?auto_155696 ?auto_155697 )
      ( MAKE-1PILE ?auto_155696 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_155705 - BLOCK
    )
    :vars
    (
      ?auto_155713 - BLOCK
      ?auto_155706 - BLOCK
      ?auto_155710 - BLOCK
      ?auto_155711 - BLOCK
      ?auto_155707 - BLOCK
      ?auto_155708 - BLOCK
      ?auto_155712 - BLOCK
      ?auto_155709 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_155705 ?auto_155713 ) ( not ( = ?auto_155705 ?auto_155713 ) ) ( not ( = ?auto_155705 ?auto_155706 ) ) ( not ( = ?auto_155705 ?auto_155710 ) ) ( not ( = ?auto_155713 ?auto_155706 ) ) ( not ( = ?auto_155713 ?auto_155710 ) ) ( not ( = ?auto_155706 ?auto_155710 ) ) ( ON ?auto_155706 ?auto_155705 ) ( ON-TABLE ?auto_155713 ) ( ON-TABLE ?auto_155711 ) ( ON ?auto_155707 ?auto_155711 ) ( ON ?auto_155708 ?auto_155707 ) ( ON ?auto_155712 ?auto_155708 ) ( not ( = ?auto_155711 ?auto_155707 ) ) ( not ( = ?auto_155711 ?auto_155708 ) ) ( not ( = ?auto_155711 ?auto_155712 ) ) ( not ( = ?auto_155711 ?auto_155709 ) ) ( not ( = ?auto_155711 ?auto_155710 ) ) ( not ( = ?auto_155707 ?auto_155708 ) ) ( not ( = ?auto_155707 ?auto_155712 ) ) ( not ( = ?auto_155707 ?auto_155709 ) ) ( not ( = ?auto_155707 ?auto_155710 ) ) ( not ( = ?auto_155708 ?auto_155712 ) ) ( not ( = ?auto_155708 ?auto_155709 ) ) ( not ( = ?auto_155708 ?auto_155710 ) ) ( not ( = ?auto_155712 ?auto_155709 ) ) ( not ( = ?auto_155712 ?auto_155710 ) ) ( not ( = ?auto_155709 ?auto_155710 ) ) ( not ( = ?auto_155705 ?auto_155709 ) ) ( not ( = ?auto_155705 ?auto_155711 ) ) ( not ( = ?auto_155705 ?auto_155707 ) ) ( not ( = ?auto_155705 ?auto_155708 ) ) ( not ( = ?auto_155705 ?auto_155712 ) ) ( not ( = ?auto_155713 ?auto_155709 ) ) ( not ( = ?auto_155713 ?auto_155711 ) ) ( not ( = ?auto_155713 ?auto_155707 ) ) ( not ( = ?auto_155713 ?auto_155708 ) ) ( not ( = ?auto_155713 ?auto_155712 ) ) ( not ( = ?auto_155706 ?auto_155709 ) ) ( not ( = ?auto_155706 ?auto_155711 ) ) ( not ( = ?auto_155706 ?auto_155707 ) ) ( not ( = ?auto_155706 ?auto_155708 ) ) ( not ( = ?auto_155706 ?auto_155712 ) ) ( ON ?auto_155710 ?auto_155706 ) ( CLEAR ?auto_155710 ) ( HOLDING ?auto_155709 ) ( CLEAR ?auto_155712 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_155711 ?auto_155707 ?auto_155708 ?auto_155712 ?auto_155709 )
      ( MAKE-1PILE ?auto_155705 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_155714 - BLOCK
    )
    :vars
    (
      ?auto_155722 - BLOCK
      ?auto_155720 - BLOCK
      ?auto_155719 - BLOCK
      ?auto_155716 - BLOCK
      ?auto_155717 - BLOCK
      ?auto_155715 - BLOCK
      ?auto_155718 - BLOCK
      ?auto_155721 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_155714 ?auto_155722 ) ( not ( = ?auto_155714 ?auto_155722 ) ) ( not ( = ?auto_155714 ?auto_155720 ) ) ( not ( = ?auto_155714 ?auto_155719 ) ) ( not ( = ?auto_155722 ?auto_155720 ) ) ( not ( = ?auto_155722 ?auto_155719 ) ) ( not ( = ?auto_155720 ?auto_155719 ) ) ( ON ?auto_155720 ?auto_155714 ) ( ON-TABLE ?auto_155722 ) ( ON-TABLE ?auto_155716 ) ( ON ?auto_155717 ?auto_155716 ) ( ON ?auto_155715 ?auto_155717 ) ( ON ?auto_155718 ?auto_155715 ) ( not ( = ?auto_155716 ?auto_155717 ) ) ( not ( = ?auto_155716 ?auto_155715 ) ) ( not ( = ?auto_155716 ?auto_155718 ) ) ( not ( = ?auto_155716 ?auto_155721 ) ) ( not ( = ?auto_155716 ?auto_155719 ) ) ( not ( = ?auto_155717 ?auto_155715 ) ) ( not ( = ?auto_155717 ?auto_155718 ) ) ( not ( = ?auto_155717 ?auto_155721 ) ) ( not ( = ?auto_155717 ?auto_155719 ) ) ( not ( = ?auto_155715 ?auto_155718 ) ) ( not ( = ?auto_155715 ?auto_155721 ) ) ( not ( = ?auto_155715 ?auto_155719 ) ) ( not ( = ?auto_155718 ?auto_155721 ) ) ( not ( = ?auto_155718 ?auto_155719 ) ) ( not ( = ?auto_155721 ?auto_155719 ) ) ( not ( = ?auto_155714 ?auto_155721 ) ) ( not ( = ?auto_155714 ?auto_155716 ) ) ( not ( = ?auto_155714 ?auto_155717 ) ) ( not ( = ?auto_155714 ?auto_155715 ) ) ( not ( = ?auto_155714 ?auto_155718 ) ) ( not ( = ?auto_155722 ?auto_155721 ) ) ( not ( = ?auto_155722 ?auto_155716 ) ) ( not ( = ?auto_155722 ?auto_155717 ) ) ( not ( = ?auto_155722 ?auto_155715 ) ) ( not ( = ?auto_155722 ?auto_155718 ) ) ( not ( = ?auto_155720 ?auto_155721 ) ) ( not ( = ?auto_155720 ?auto_155716 ) ) ( not ( = ?auto_155720 ?auto_155717 ) ) ( not ( = ?auto_155720 ?auto_155715 ) ) ( not ( = ?auto_155720 ?auto_155718 ) ) ( ON ?auto_155719 ?auto_155720 ) ( CLEAR ?auto_155718 ) ( ON ?auto_155721 ?auto_155719 ) ( CLEAR ?auto_155721 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_155722 ?auto_155714 ?auto_155720 ?auto_155719 )
      ( MAKE-1PILE ?auto_155714 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_155723 - BLOCK
    )
    :vars
    (
      ?auto_155728 - BLOCK
      ?auto_155726 - BLOCK
      ?auto_155730 - BLOCK
      ?auto_155725 - BLOCK
      ?auto_155731 - BLOCK
      ?auto_155724 - BLOCK
      ?auto_155729 - BLOCK
      ?auto_155727 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_155723 ?auto_155728 ) ( not ( = ?auto_155723 ?auto_155728 ) ) ( not ( = ?auto_155723 ?auto_155726 ) ) ( not ( = ?auto_155723 ?auto_155730 ) ) ( not ( = ?auto_155728 ?auto_155726 ) ) ( not ( = ?auto_155728 ?auto_155730 ) ) ( not ( = ?auto_155726 ?auto_155730 ) ) ( ON ?auto_155726 ?auto_155723 ) ( ON-TABLE ?auto_155728 ) ( ON-TABLE ?auto_155725 ) ( ON ?auto_155731 ?auto_155725 ) ( ON ?auto_155724 ?auto_155731 ) ( not ( = ?auto_155725 ?auto_155731 ) ) ( not ( = ?auto_155725 ?auto_155724 ) ) ( not ( = ?auto_155725 ?auto_155729 ) ) ( not ( = ?auto_155725 ?auto_155727 ) ) ( not ( = ?auto_155725 ?auto_155730 ) ) ( not ( = ?auto_155731 ?auto_155724 ) ) ( not ( = ?auto_155731 ?auto_155729 ) ) ( not ( = ?auto_155731 ?auto_155727 ) ) ( not ( = ?auto_155731 ?auto_155730 ) ) ( not ( = ?auto_155724 ?auto_155729 ) ) ( not ( = ?auto_155724 ?auto_155727 ) ) ( not ( = ?auto_155724 ?auto_155730 ) ) ( not ( = ?auto_155729 ?auto_155727 ) ) ( not ( = ?auto_155729 ?auto_155730 ) ) ( not ( = ?auto_155727 ?auto_155730 ) ) ( not ( = ?auto_155723 ?auto_155727 ) ) ( not ( = ?auto_155723 ?auto_155725 ) ) ( not ( = ?auto_155723 ?auto_155731 ) ) ( not ( = ?auto_155723 ?auto_155724 ) ) ( not ( = ?auto_155723 ?auto_155729 ) ) ( not ( = ?auto_155728 ?auto_155727 ) ) ( not ( = ?auto_155728 ?auto_155725 ) ) ( not ( = ?auto_155728 ?auto_155731 ) ) ( not ( = ?auto_155728 ?auto_155724 ) ) ( not ( = ?auto_155728 ?auto_155729 ) ) ( not ( = ?auto_155726 ?auto_155727 ) ) ( not ( = ?auto_155726 ?auto_155725 ) ) ( not ( = ?auto_155726 ?auto_155731 ) ) ( not ( = ?auto_155726 ?auto_155724 ) ) ( not ( = ?auto_155726 ?auto_155729 ) ) ( ON ?auto_155730 ?auto_155726 ) ( ON ?auto_155727 ?auto_155730 ) ( CLEAR ?auto_155727 ) ( HOLDING ?auto_155729 ) ( CLEAR ?auto_155724 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_155725 ?auto_155731 ?auto_155724 ?auto_155729 )
      ( MAKE-1PILE ?auto_155723 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_155732 - BLOCK
    )
    :vars
    (
      ?auto_155736 - BLOCK
      ?auto_155739 - BLOCK
      ?auto_155737 - BLOCK
      ?auto_155740 - BLOCK
      ?auto_155733 - BLOCK
      ?auto_155738 - BLOCK
      ?auto_155735 - BLOCK
      ?auto_155734 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_155732 ?auto_155736 ) ( not ( = ?auto_155732 ?auto_155736 ) ) ( not ( = ?auto_155732 ?auto_155739 ) ) ( not ( = ?auto_155732 ?auto_155737 ) ) ( not ( = ?auto_155736 ?auto_155739 ) ) ( not ( = ?auto_155736 ?auto_155737 ) ) ( not ( = ?auto_155739 ?auto_155737 ) ) ( ON ?auto_155739 ?auto_155732 ) ( ON-TABLE ?auto_155736 ) ( ON-TABLE ?auto_155740 ) ( ON ?auto_155733 ?auto_155740 ) ( ON ?auto_155738 ?auto_155733 ) ( not ( = ?auto_155740 ?auto_155733 ) ) ( not ( = ?auto_155740 ?auto_155738 ) ) ( not ( = ?auto_155740 ?auto_155735 ) ) ( not ( = ?auto_155740 ?auto_155734 ) ) ( not ( = ?auto_155740 ?auto_155737 ) ) ( not ( = ?auto_155733 ?auto_155738 ) ) ( not ( = ?auto_155733 ?auto_155735 ) ) ( not ( = ?auto_155733 ?auto_155734 ) ) ( not ( = ?auto_155733 ?auto_155737 ) ) ( not ( = ?auto_155738 ?auto_155735 ) ) ( not ( = ?auto_155738 ?auto_155734 ) ) ( not ( = ?auto_155738 ?auto_155737 ) ) ( not ( = ?auto_155735 ?auto_155734 ) ) ( not ( = ?auto_155735 ?auto_155737 ) ) ( not ( = ?auto_155734 ?auto_155737 ) ) ( not ( = ?auto_155732 ?auto_155734 ) ) ( not ( = ?auto_155732 ?auto_155740 ) ) ( not ( = ?auto_155732 ?auto_155733 ) ) ( not ( = ?auto_155732 ?auto_155738 ) ) ( not ( = ?auto_155732 ?auto_155735 ) ) ( not ( = ?auto_155736 ?auto_155734 ) ) ( not ( = ?auto_155736 ?auto_155740 ) ) ( not ( = ?auto_155736 ?auto_155733 ) ) ( not ( = ?auto_155736 ?auto_155738 ) ) ( not ( = ?auto_155736 ?auto_155735 ) ) ( not ( = ?auto_155739 ?auto_155734 ) ) ( not ( = ?auto_155739 ?auto_155740 ) ) ( not ( = ?auto_155739 ?auto_155733 ) ) ( not ( = ?auto_155739 ?auto_155738 ) ) ( not ( = ?auto_155739 ?auto_155735 ) ) ( ON ?auto_155737 ?auto_155739 ) ( ON ?auto_155734 ?auto_155737 ) ( CLEAR ?auto_155738 ) ( ON ?auto_155735 ?auto_155734 ) ( CLEAR ?auto_155735 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_155736 ?auto_155732 ?auto_155739 ?auto_155737 ?auto_155734 )
      ( MAKE-1PILE ?auto_155732 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_155741 - BLOCK
    )
    :vars
    (
      ?auto_155745 - BLOCK
      ?auto_155748 - BLOCK
      ?auto_155744 - BLOCK
      ?auto_155742 - BLOCK
      ?auto_155747 - BLOCK
      ?auto_155749 - BLOCK
      ?auto_155743 - BLOCK
      ?auto_155746 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_155741 ?auto_155745 ) ( not ( = ?auto_155741 ?auto_155745 ) ) ( not ( = ?auto_155741 ?auto_155748 ) ) ( not ( = ?auto_155741 ?auto_155744 ) ) ( not ( = ?auto_155745 ?auto_155748 ) ) ( not ( = ?auto_155745 ?auto_155744 ) ) ( not ( = ?auto_155748 ?auto_155744 ) ) ( ON ?auto_155748 ?auto_155741 ) ( ON-TABLE ?auto_155745 ) ( ON-TABLE ?auto_155742 ) ( ON ?auto_155747 ?auto_155742 ) ( not ( = ?auto_155742 ?auto_155747 ) ) ( not ( = ?auto_155742 ?auto_155749 ) ) ( not ( = ?auto_155742 ?auto_155743 ) ) ( not ( = ?auto_155742 ?auto_155746 ) ) ( not ( = ?auto_155742 ?auto_155744 ) ) ( not ( = ?auto_155747 ?auto_155749 ) ) ( not ( = ?auto_155747 ?auto_155743 ) ) ( not ( = ?auto_155747 ?auto_155746 ) ) ( not ( = ?auto_155747 ?auto_155744 ) ) ( not ( = ?auto_155749 ?auto_155743 ) ) ( not ( = ?auto_155749 ?auto_155746 ) ) ( not ( = ?auto_155749 ?auto_155744 ) ) ( not ( = ?auto_155743 ?auto_155746 ) ) ( not ( = ?auto_155743 ?auto_155744 ) ) ( not ( = ?auto_155746 ?auto_155744 ) ) ( not ( = ?auto_155741 ?auto_155746 ) ) ( not ( = ?auto_155741 ?auto_155742 ) ) ( not ( = ?auto_155741 ?auto_155747 ) ) ( not ( = ?auto_155741 ?auto_155749 ) ) ( not ( = ?auto_155741 ?auto_155743 ) ) ( not ( = ?auto_155745 ?auto_155746 ) ) ( not ( = ?auto_155745 ?auto_155742 ) ) ( not ( = ?auto_155745 ?auto_155747 ) ) ( not ( = ?auto_155745 ?auto_155749 ) ) ( not ( = ?auto_155745 ?auto_155743 ) ) ( not ( = ?auto_155748 ?auto_155746 ) ) ( not ( = ?auto_155748 ?auto_155742 ) ) ( not ( = ?auto_155748 ?auto_155747 ) ) ( not ( = ?auto_155748 ?auto_155749 ) ) ( not ( = ?auto_155748 ?auto_155743 ) ) ( ON ?auto_155744 ?auto_155748 ) ( ON ?auto_155746 ?auto_155744 ) ( ON ?auto_155743 ?auto_155746 ) ( CLEAR ?auto_155743 ) ( HOLDING ?auto_155749 ) ( CLEAR ?auto_155747 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_155742 ?auto_155747 ?auto_155749 )
      ( MAKE-1PILE ?auto_155741 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_155750 - BLOCK
    )
    :vars
    (
      ?auto_155751 - BLOCK
      ?auto_155756 - BLOCK
      ?auto_155757 - BLOCK
      ?auto_155753 - BLOCK
      ?auto_155754 - BLOCK
      ?auto_155755 - BLOCK
      ?auto_155752 - BLOCK
      ?auto_155758 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_155750 ?auto_155751 ) ( not ( = ?auto_155750 ?auto_155751 ) ) ( not ( = ?auto_155750 ?auto_155756 ) ) ( not ( = ?auto_155750 ?auto_155757 ) ) ( not ( = ?auto_155751 ?auto_155756 ) ) ( not ( = ?auto_155751 ?auto_155757 ) ) ( not ( = ?auto_155756 ?auto_155757 ) ) ( ON ?auto_155756 ?auto_155750 ) ( ON-TABLE ?auto_155751 ) ( ON-TABLE ?auto_155753 ) ( ON ?auto_155754 ?auto_155753 ) ( not ( = ?auto_155753 ?auto_155754 ) ) ( not ( = ?auto_155753 ?auto_155755 ) ) ( not ( = ?auto_155753 ?auto_155752 ) ) ( not ( = ?auto_155753 ?auto_155758 ) ) ( not ( = ?auto_155753 ?auto_155757 ) ) ( not ( = ?auto_155754 ?auto_155755 ) ) ( not ( = ?auto_155754 ?auto_155752 ) ) ( not ( = ?auto_155754 ?auto_155758 ) ) ( not ( = ?auto_155754 ?auto_155757 ) ) ( not ( = ?auto_155755 ?auto_155752 ) ) ( not ( = ?auto_155755 ?auto_155758 ) ) ( not ( = ?auto_155755 ?auto_155757 ) ) ( not ( = ?auto_155752 ?auto_155758 ) ) ( not ( = ?auto_155752 ?auto_155757 ) ) ( not ( = ?auto_155758 ?auto_155757 ) ) ( not ( = ?auto_155750 ?auto_155758 ) ) ( not ( = ?auto_155750 ?auto_155753 ) ) ( not ( = ?auto_155750 ?auto_155754 ) ) ( not ( = ?auto_155750 ?auto_155755 ) ) ( not ( = ?auto_155750 ?auto_155752 ) ) ( not ( = ?auto_155751 ?auto_155758 ) ) ( not ( = ?auto_155751 ?auto_155753 ) ) ( not ( = ?auto_155751 ?auto_155754 ) ) ( not ( = ?auto_155751 ?auto_155755 ) ) ( not ( = ?auto_155751 ?auto_155752 ) ) ( not ( = ?auto_155756 ?auto_155758 ) ) ( not ( = ?auto_155756 ?auto_155753 ) ) ( not ( = ?auto_155756 ?auto_155754 ) ) ( not ( = ?auto_155756 ?auto_155755 ) ) ( not ( = ?auto_155756 ?auto_155752 ) ) ( ON ?auto_155757 ?auto_155756 ) ( ON ?auto_155758 ?auto_155757 ) ( ON ?auto_155752 ?auto_155758 ) ( CLEAR ?auto_155754 ) ( ON ?auto_155755 ?auto_155752 ) ( CLEAR ?auto_155755 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_155751 ?auto_155750 ?auto_155756 ?auto_155757 ?auto_155758 ?auto_155752 )
      ( MAKE-1PILE ?auto_155750 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_155759 - BLOCK
    )
    :vars
    (
      ?auto_155761 - BLOCK
      ?auto_155765 - BLOCK
      ?auto_155764 - BLOCK
      ?auto_155767 - BLOCK
      ?auto_155760 - BLOCK
      ?auto_155766 - BLOCK
      ?auto_155762 - BLOCK
      ?auto_155763 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_155759 ?auto_155761 ) ( not ( = ?auto_155759 ?auto_155761 ) ) ( not ( = ?auto_155759 ?auto_155765 ) ) ( not ( = ?auto_155759 ?auto_155764 ) ) ( not ( = ?auto_155761 ?auto_155765 ) ) ( not ( = ?auto_155761 ?auto_155764 ) ) ( not ( = ?auto_155765 ?auto_155764 ) ) ( ON ?auto_155765 ?auto_155759 ) ( ON-TABLE ?auto_155761 ) ( ON-TABLE ?auto_155767 ) ( not ( = ?auto_155767 ?auto_155760 ) ) ( not ( = ?auto_155767 ?auto_155766 ) ) ( not ( = ?auto_155767 ?auto_155762 ) ) ( not ( = ?auto_155767 ?auto_155763 ) ) ( not ( = ?auto_155767 ?auto_155764 ) ) ( not ( = ?auto_155760 ?auto_155766 ) ) ( not ( = ?auto_155760 ?auto_155762 ) ) ( not ( = ?auto_155760 ?auto_155763 ) ) ( not ( = ?auto_155760 ?auto_155764 ) ) ( not ( = ?auto_155766 ?auto_155762 ) ) ( not ( = ?auto_155766 ?auto_155763 ) ) ( not ( = ?auto_155766 ?auto_155764 ) ) ( not ( = ?auto_155762 ?auto_155763 ) ) ( not ( = ?auto_155762 ?auto_155764 ) ) ( not ( = ?auto_155763 ?auto_155764 ) ) ( not ( = ?auto_155759 ?auto_155763 ) ) ( not ( = ?auto_155759 ?auto_155767 ) ) ( not ( = ?auto_155759 ?auto_155760 ) ) ( not ( = ?auto_155759 ?auto_155766 ) ) ( not ( = ?auto_155759 ?auto_155762 ) ) ( not ( = ?auto_155761 ?auto_155763 ) ) ( not ( = ?auto_155761 ?auto_155767 ) ) ( not ( = ?auto_155761 ?auto_155760 ) ) ( not ( = ?auto_155761 ?auto_155766 ) ) ( not ( = ?auto_155761 ?auto_155762 ) ) ( not ( = ?auto_155765 ?auto_155763 ) ) ( not ( = ?auto_155765 ?auto_155767 ) ) ( not ( = ?auto_155765 ?auto_155760 ) ) ( not ( = ?auto_155765 ?auto_155766 ) ) ( not ( = ?auto_155765 ?auto_155762 ) ) ( ON ?auto_155764 ?auto_155765 ) ( ON ?auto_155763 ?auto_155764 ) ( ON ?auto_155762 ?auto_155763 ) ( ON ?auto_155766 ?auto_155762 ) ( CLEAR ?auto_155766 ) ( HOLDING ?auto_155760 ) ( CLEAR ?auto_155767 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_155767 ?auto_155760 )
      ( MAKE-1PILE ?auto_155759 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_155768 - BLOCK
    )
    :vars
    (
      ?auto_155772 - BLOCK
      ?auto_155770 - BLOCK
      ?auto_155771 - BLOCK
      ?auto_155774 - BLOCK
      ?auto_155776 - BLOCK
      ?auto_155769 - BLOCK
      ?auto_155775 - BLOCK
      ?auto_155773 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_155768 ?auto_155772 ) ( not ( = ?auto_155768 ?auto_155772 ) ) ( not ( = ?auto_155768 ?auto_155770 ) ) ( not ( = ?auto_155768 ?auto_155771 ) ) ( not ( = ?auto_155772 ?auto_155770 ) ) ( not ( = ?auto_155772 ?auto_155771 ) ) ( not ( = ?auto_155770 ?auto_155771 ) ) ( ON ?auto_155770 ?auto_155768 ) ( ON-TABLE ?auto_155772 ) ( ON-TABLE ?auto_155774 ) ( not ( = ?auto_155774 ?auto_155776 ) ) ( not ( = ?auto_155774 ?auto_155769 ) ) ( not ( = ?auto_155774 ?auto_155775 ) ) ( not ( = ?auto_155774 ?auto_155773 ) ) ( not ( = ?auto_155774 ?auto_155771 ) ) ( not ( = ?auto_155776 ?auto_155769 ) ) ( not ( = ?auto_155776 ?auto_155775 ) ) ( not ( = ?auto_155776 ?auto_155773 ) ) ( not ( = ?auto_155776 ?auto_155771 ) ) ( not ( = ?auto_155769 ?auto_155775 ) ) ( not ( = ?auto_155769 ?auto_155773 ) ) ( not ( = ?auto_155769 ?auto_155771 ) ) ( not ( = ?auto_155775 ?auto_155773 ) ) ( not ( = ?auto_155775 ?auto_155771 ) ) ( not ( = ?auto_155773 ?auto_155771 ) ) ( not ( = ?auto_155768 ?auto_155773 ) ) ( not ( = ?auto_155768 ?auto_155774 ) ) ( not ( = ?auto_155768 ?auto_155776 ) ) ( not ( = ?auto_155768 ?auto_155769 ) ) ( not ( = ?auto_155768 ?auto_155775 ) ) ( not ( = ?auto_155772 ?auto_155773 ) ) ( not ( = ?auto_155772 ?auto_155774 ) ) ( not ( = ?auto_155772 ?auto_155776 ) ) ( not ( = ?auto_155772 ?auto_155769 ) ) ( not ( = ?auto_155772 ?auto_155775 ) ) ( not ( = ?auto_155770 ?auto_155773 ) ) ( not ( = ?auto_155770 ?auto_155774 ) ) ( not ( = ?auto_155770 ?auto_155776 ) ) ( not ( = ?auto_155770 ?auto_155769 ) ) ( not ( = ?auto_155770 ?auto_155775 ) ) ( ON ?auto_155771 ?auto_155770 ) ( ON ?auto_155773 ?auto_155771 ) ( ON ?auto_155775 ?auto_155773 ) ( ON ?auto_155769 ?auto_155775 ) ( CLEAR ?auto_155774 ) ( ON ?auto_155776 ?auto_155769 ) ( CLEAR ?auto_155776 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_155772 ?auto_155768 ?auto_155770 ?auto_155771 ?auto_155773 ?auto_155775 ?auto_155769 )
      ( MAKE-1PILE ?auto_155768 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_155777 - BLOCK
    )
    :vars
    (
      ?auto_155780 - BLOCK
      ?auto_155778 - BLOCK
      ?auto_155784 - BLOCK
      ?auto_155781 - BLOCK
      ?auto_155783 - BLOCK
      ?auto_155779 - BLOCK
      ?auto_155785 - BLOCK
      ?auto_155782 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_155777 ?auto_155780 ) ( not ( = ?auto_155777 ?auto_155780 ) ) ( not ( = ?auto_155777 ?auto_155778 ) ) ( not ( = ?auto_155777 ?auto_155784 ) ) ( not ( = ?auto_155780 ?auto_155778 ) ) ( not ( = ?auto_155780 ?auto_155784 ) ) ( not ( = ?auto_155778 ?auto_155784 ) ) ( ON ?auto_155778 ?auto_155777 ) ( ON-TABLE ?auto_155780 ) ( not ( = ?auto_155781 ?auto_155783 ) ) ( not ( = ?auto_155781 ?auto_155779 ) ) ( not ( = ?auto_155781 ?auto_155785 ) ) ( not ( = ?auto_155781 ?auto_155782 ) ) ( not ( = ?auto_155781 ?auto_155784 ) ) ( not ( = ?auto_155783 ?auto_155779 ) ) ( not ( = ?auto_155783 ?auto_155785 ) ) ( not ( = ?auto_155783 ?auto_155782 ) ) ( not ( = ?auto_155783 ?auto_155784 ) ) ( not ( = ?auto_155779 ?auto_155785 ) ) ( not ( = ?auto_155779 ?auto_155782 ) ) ( not ( = ?auto_155779 ?auto_155784 ) ) ( not ( = ?auto_155785 ?auto_155782 ) ) ( not ( = ?auto_155785 ?auto_155784 ) ) ( not ( = ?auto_155782 ?auto_155784 ) ) ( not ( = ?auto_155777 ?auto_155782 ) ) ( not ( = ?auto_155777 ?auto_155781 ) ) ( not ( = ?auto_155777 ?auto_155783 ) ) ( not ( = ?auto_155777 ?auto_155779 ) ) ( not ( = ?auto_155777 ?auto_155785 ) ) ( not ( = ?auto_155780 ?auto_155782 ) ) ( not ( = ?auto_155780 ?auto_155781 ) ) ( not ( = ?auto_155780 ?auto_155783 ) ) ( not ( = ?auto_155780 ?auto_155779 ) ) ( not ( = ?auto_155780 ?auto_155785 ) ) ( not ( = ?auto_155778 ?auto_155782 ) ) ( not ( = ?auto_155778 ?auto_155781 ) ) ( not ( = ?auto_155778 ?auto_155783 ) ) ( not ( = ?auto_155778 ?auto_155779 ) ) ( not ( = ?auto_155778 ?auto_155785 ) ) ( ON ?auto_155784 ?auto_155778 ) ( ON ?auto_155782 ?auto_155784 ) ( ON ?auto_155785 ?auto_155782 ) ( ON ?auto_155779 ?auto_155785 ) ( ON ?auto_155783 ?auto_155779 ) ( CLEAR ?auto_155783 ) ( HOLDING ?auto_155781 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_155781 )
      ( MAKE-1PILE ?auto_155777 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_155786 - BLOCK
    )
    :vars
    (
      ?auto_155792 - BLOCK
      ?auto_155787 - BLOCK
      ?auto_155788 - BLOCK
      ?auto_155789 - BLOCK
      ?auto_155793 - BLOCK
      ?auto_155791 - BLOCK
      ?auto_155794 - BLOCK
      ?auto_155790 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_155786 ?auto_155792 ) ( not ( = ?auto_155786 ?auto_155792 ) ) ( not ( = ?auto_155786 ?auto_155787 ) ) ( not ( = ?auto_155786 ?auto_155788 ) ) ( not ( = ?auto_155792 ?auto_155787 ) ) ( not ( = ?auto_155792 ?auto_155788 ) ) ( not ( = ?auto_155787 ?auto_155788 ) ) ( ON ?auto_155787 ?auto_155786 ) ( ON-TABLE ?auto_155792 ) ( not ( = ?auto_155789 ?auto_155793 ) ) ( not ( = ?auto_155789 ?auto_155791 ) ) ( not ( = ?auto_155789 ?auto_155794 ) ) ( not ( = ?auto_155789 ?auto_155790 ) ) ( not ( = ?auto_155789 ?auto_155788 ) ) ( not ( = ?auto_155793 ?auto_155791 ) ) ( not ( = ?auto_155793 ?auto_155794 ) ) ( not ( = ?auto_155793 ?auto_155790 ) ) ( not ( = ?auto_155793 ?auto_155788 ) ) ( not ( = ?auto_155791 ?auto_155794 ) ) ( not ( = ?auto_155791 ?auto_155790 ) ) ( not ( = ?auto_155791 ?auto_155788 ) ) ( not ( = ?auto_155794 ?auto_155790 ) ) ( not ( = ?auto_155794 ?auto_155788 ) ) ( not ( = ?auto_155790 ?auto_155788 ) ) ( not ( = ?auto_155786 ?auto_155790 ) ) ( not ( = ?auto_155786 ?auto_155789 ) ) ( not ( = ?auto_155786 ?auto_155793 ) ) ( not ( = ?auto_155786 ?auto_155791 ) ) ( not ( = ?auto_155786 ?auto_155794 ) ) ( not ( = ?auto_155792 ?auto_155790 ) ) ( not ( = ?auto_155792 ?auto_155789 ) ) ( not ( = ?auto_155792 ?auto_155793 ) ) ( not ( = ?auto_155792 ?auto_155791 ) ) ( not ( = ?auto_155792 ?auto_155794 ) ) ( not ( = ?auto_155787 ?auto_155790 ) ) ( not ( = ?auto_155787 ?auto_155789 ) ) ( not ( = ?auto_155787 ?auto_155793 ) ) ( not ( = ?auto_155787 ?auto_155791 ) ) ( not ( = ?auto_155787 ?auto_155794 ) ) ( ON ?auto_155788 ?auto_155787 ) ( ON ?auto_155790 ?auto_155788 ) ( ON ?auto_155794 ?auto_155790 ) ( ON ?auto_155791 ?auto_155794 ) ( ON ?auto_155793 ?auto_155791 ) ( ON ?auto_155789 ?auto_155793 ) ( CLEAR ?auto_155789 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_155792 ?auto_155786 ?auto_155787 ?auto_155788 ?auto_155790 ?auto_155794 ?auto_155791 ?auto_155793 )
      ( MAKE-1PILE ?auto_155786 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_155808 - BLOCK
      ?auto_155809 - BLOCK
      ?auto_155810 - BLOCK
      ?auto_155811 - BLOCK
      ?auto_155812 - BLOCK
      ?auto_155813 - BLOCK
    )
    :vars
    (
      ?auto_155814 - BLOCK
      ?auto_155815 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_155814 ?auto_155813 ) ( CLEAR ?auto_155814 ) ( ON-TABLE ?auto_155808 ) ( ON ?auto_155809 ?auto_155808 ) ( ON ?auto_155810 ?auto_155809 ) ( ON ?auto_155811 ?auto_155810 ) ( ON ?auto_155812 ?auto_155811 ) ( ON ?auto_155813 ?auto_155812 ) ( not ( = ?auto_155808 ?auto_155809 ) ) ( not ( = ?auto_155808 ?auto_155810 ) ) ( not ( = ?auto_155808 ?auto_155811 ) ) ( not ( = ?auto_155808 ?auto_155812 ) ) ( not ( = ?auto_155808 ?auto_155813 ) ) ( not ( = ?auto_155808 ?auto_155814 ) ) ( not ( = ?auto_155809 ?auto_155810 ) ) ( not ( = ?auto_155809 ?auto_155811 ) ) ( not ( = ?auto_155809 ?auto_155812 ) ) ( not ( = ?auto_155809 ?auto_155813 ) ) ( not ( = ?auto_155809 ?auto_155814 ) ) ( not ( = ?auto_155810 ?auto_155811 ) ) ( not ( = ?auto_155810 ?auto_155812 ) ) ( not ( = ?auto_155810 ?auto_155813 ) ) ( not ( = ?auto_155810 ?auto_155814 ) ) ( not ( = ?auto_155811 ?auto_155812 ) ) ( not ( = ?auto_155811 ?auto_155813 ) ) ( not ( = ?auto_155811 ?auto_155814 ) ) ( not ( = ?auto_155812 ?auto_155813 ) ) ( not ( = ?auto_155812 ?auto_155814 ) ) ( not ( = ?auto_155813 ?auto_155814 ) ) ( HOLDING ?auto_155815 ) ( not ( = ?auto_155808 ?auto_155815 ) ) ( not ( = ?auto_155809 ?auto_155815 ) ) ( not ( = ?auto_155810 ?auto_155815 ) ) ( not ( = ?auto_155811 ?auto_155815 ) ) ( not ( = ?auto_155812 ?auto_155815 ) ) ( not ( = ?auto_155813 ?auto_155815 ) ) ( not ( = ?auto_155814 ?auto_155815 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_155815 )
      ( MAKE-6PILE ?auto_155808 ?auto_155809 ?auto_155810 ?auto_155811 ?auto_155812 ?auto_155813 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_155933 - BLOCK
      ?auto_155934 - BLOCK
    )
    :vars
    (
      ?auto_155935 - BLOCK
      ?auto_155938 - BLOCK
      ?auto_155939 - BLOCK
      ?auto_155937 - BLOCK
      ?auto_155940 - BLOCK
      ?auto_155936 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_155933 ?auto_155934 ) ) ( ON ?auto_155934 ?auto_155935 ) ( not ( = ?auto_155933 ?auto_155935 ) ) ( not ( = ?auto_155934 ?auto_155935 ) ) ( ON ?auto_155933 ?auto_155934 ) ( CLEAR ?auto_155933 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_155938 ) ( ON ?auto_155939 ?auto_155938 ) ( ON ?auto_155937 ?auto_155939 ) ( ON ?auto_155940 ?auto_155937 ) ( ON ?auto_155936 ?auto_155940 ) ( ON ?auto_155935 ?auto_155936 ) ( not ( = ?auto_155938 ?auto_155939 ) ) ( not ( = ?auto_155938 ?auto_155937 ) ) ( not ( = ?auto_155938 ?auto_155940 ) ) ( not ( = ?auto_155938 ?auto_155936 ) ) ( not ( = ?auto_155938 ?auto_155935 ) ) ( not ( = ?auto_155938 ?auto_155934 ) ) ( not ( = ?auto_155938 ?auto_155933 ) ) ( not ( = ?auto_155939 ?auto_155937 ) ) ( not ( = ?auto_155939 ?auto_155940 ) ) ( not ( = ?auto_155939 ?auto_155936 ) ) ( not ( = ?auto_155939 ?auto_155935 ) ) ( not ( = ?auto_155939 ?auto_155934 ) ) ( not ( = ?auto_155939 ?auto_155933 ) ) ( not ( = ?auto_155937 ?auto_155940 ) ) ( not ( = ?auto_155937 ?auto_155936 ) ) ( not ( = ?auto_155937 ?auto_155935 ) ) ( not ( = ?auto_155937 ?auto_155934 ) ) ( not ( = ?auto_155937 ?auto_155933 ) ) ( not ( = ?auto_155940 ?auto_155936 ) ) ( not ( = ?auto_155940 ?auto_155935 ) ) ( not ( = ?auto_155940 ?auto_155934 ) ) ( not ( = ?auto_155940 ?auto_155933 ) ) ( not ( = ?auto_155936 ?auto_155935 ) ) ( not ( = ?auto_155936 ?auto_155934 ) ) ( not ( = ?auto_155936 ?auto_155933 ) ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_155938 ?auto_155939 ?auto_155937 ?auto_155940 ?auto_155936 ?auto_155935 ?auto_155934 )
      ( MAKE-2PILE ?auto_155933 ?auto_155934 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_155943 - BLOCK
      ?auto_155944 - BLOCK
    )
    :vars
    (
      ?auto_155945 - BLOCK
      ?auto_155946 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_155943 ?auto_155944 ) ) ( ON ?auto_155944 ?auto_155945 ) ( CLEAR ?auto_155944 ) ( not ( = ?auto_155943 ?auto_155945 ) ) ( not ( = ?auto_155944 ?auto_155945 ) ) ( ON ?auto_155943 ?auto_155946 ) ( CLEAR ?auto_155943 ) ( HAND-EMPTY ) ( not ( = ?auto_155943 ?auto_155946 ) ) ( not ( = ?auto_155944 ?auto_155946 ) ) ( not ( = ?auto_155945 ?auto_155946 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_155943 ?auto_155946 )
      ( MAKE-2PILE ?auto_155943 ?auto_155944 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_155947 - BLOCK
      ?auto_155948 - BLOCK
    )
    :vars
    (
      ?auto_155949 - BLOCK
      ?auto_155950 - BLOCK
      ?auto_155955 - BLOCK
      ?auto_155954 - BLOCK
      ?auto_155951 - BLOCK
      ?auto_155952 - BLOCK
      ?auto_155953 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_155947 ?auto_155948 ) ) ( not ( = ?auto_155947 ?auto_155949 ) ) ( not ( = ?auto_155948 ?auto_155949 ) ) ( ON ?auto_155947 ?auto_155950 ) ( CLEAR ?auto_155947 ) ( not ( = ?auto_155947 ?auto_155950 ) ) ( not ( = ?auto_155948 ?auto_155950 ) ) ( not ( = ?auto_155949 ?auto_155950 ) ) ( HOLDING ?auto_155948 ) ( CLEAR ?auto_155949 ) ( ON-TABLE ?auto_155955 ) ( ON ?auto_155954 ?auto_155955 ) ( ON ?auto_155951 ?auto_155954 ) ( ON ?auto_155952 ?auto_155951 ) ( ON ?auto_155953 ?auto_155952 ) ( ON ?auto_155949 ?auto_155953 ) ( not ( = ?auto_155955 ?auto_155954 ) ) ( not ( = ?auto_155955 ?auto_155951 ) ) ( not ( = ?auto_155955 ?auto_155952 ) ) ( not ( = ?auto_155955 ?auto_155953 ) ) ( not ( = ?auto_155955 ?auto_155949 ) ) ( not ( = ?auto_155955 ?auto_155948 ) ) ( not ( = ?auto_155954 ?auto_155951 ) ) ( not ( = ?auto_155954 ?auto_155952 ) ) ( not ( = ?auto_155954 ?auto_155953 ) ) ( not ( = ?auto_155954 ?auto_155949 ) ) ( not ( = ?auto_155954 ?auto_155948 ) ) ( not ( = ?auto_155951 ?auto_155952 ) ) ( not ( = ?auto_155951 ?auto_155953 ) ) ( not ( = ?auto_155951 ?auto_155949 ) ) ( not ( = ?auto_155951 ?auto_155948 ) ) ( not ( = ?auto_155952 ?auto_155953 ) ) ( not ( = ?auto_155952 ?auto_155949 ) ) ( not ( = ?auto_155952 ?auto_155948 ) ) ( not ( = ?auto_155953 ?auto_155949 ) ) ( not ( = ?auto_155953 ?auto_155948 ) ) ( not ( = ?auto_155947 ?auto_155955 ) ) ( not ( = ?auto_155947 ?auto_155954 ) ) ( not ( = ?auto_155947 ?auto_155951 ) ) ( not ( = ?auto_155947 ?auto_155952 ) ) ( not ( = ?auto_155947 ?auto_155953 ) ) ( not ( = ?auto_155950 ?auto_155955 ) ) ( not ( = ?auto_155950 ?auto_155954 ) ) ( not ( = ?auto_155950 ?auto_155951 ) ) ( not ( = ?auto_155950 ?auto_155952 ) ) ( not ( = ?auto_155950 ?auto_155953 ) ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_155955 ?auto_155954 ?auto_155951 ?auto_155952 ?auto_155953 ?auto_155949 ?auto_155948 )
      ( MAKE-2PILE ?auto_155947 ?auto_155948 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_155956 - BLOCK
      ?auto_155957 - BLOCK
    )
    :vars
    (
      ?auto_155963 - BLOCK
      ?auto_155960 - BLOCK
      ?auto_155958 - BLOCK
      ?auto_155962 - BLOCK
      ?auto_155961 - BLOCK
      ?auto_155964 - BLOCK
      ?auto_155959 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_155956 ?auto_155957 ) ) ( not ( = ?auto_155956 ?auto_155963 ) ) ( not ( = ?auto_155957 ?auto_155963 ) ) ( ON ?auto_155956 ?auto_155960 ) ( not ( = ?auto_155956 ?auto_155960 ) ) ( not ( = ?auto_155957 ?auto_155960 ) ) ( not ( = ?auto_155963 ?auto_155960 ) ) ( CLEAR ?auto_155963 ) ( ON-TABLE ?auto_155958 ) ( ON ?auto_155962 ?auto_155958 ) ( ON ?auto_155961 ?auto_155962 ) ( ON ?auto_155964 ?auto_155961 ) ( ON ?auto_155959 ?auto_155964 ) ( ON ?auto_155963 ?auto_155959 ) ( not ( = ?auto_155958 ?auto_155962 ) ) ( not ( = ?auto_155958 ?auto_155961 ) ) ( not ( = ?auto_155958 ?auto_155964 ) ) ( not ( = ?auto_155958 ?auto_155959 ) ) ( not ( = ?auto_155958 ?auto_155963 ) ) ( not ( = ?auto_155958 ?auto_155957 ) ) ( not ( = ?auto_155962 ?auto_155961 ) ) ( not ( = ?auto_155962 ?auto_155964 ) ) ( not ( = ?auto_155962 ?auto_155959 ) ) ( not ( = ?auto_155962 ?auto_155963 ) ) ( not ( = ?auto_155962 ?auto_155957 ) ) ( not ( = ?auto_155961 ?auto_155964 ) ) ( not ( = ?auto_155961 ?auto_155959 ) ) ( not ( = ?auto_155961 ?auto_155963 ) ) ( not ( = ?auto_155961 ?auto_155957 ) ) ( not ( = ?auto_155964 ?auto_155959 ) ) ( not ( = ?auto_155964 ?auto_155963 ) ) ( not ( = ?auto_155964 ?auto_155957 ) ) ( not ( = ?auto_155959 ?auto_155963 ) ) ( not ( = ?auto_155959 ?auto_155957 ) ) ( not ( = ?auto_155956 ?auto_155958 ) ) ( not ( = ?auto_155956 ?auto_155962 ) ) ( not ( = ?auto_155956 ?auto_155961 ) ) ( not ( = ?auto_155956 ?auto_155964 ) ) ( not ( = ?auto_155956 ?auto_155959 ) ) ( not ( = ?auto_155960 ?auto_155958 ) ) ( not ( = ?auto_155960 ?auto_155962 ) ) ( not ( = ?auto_155960 ?auto_155961 ) ) ( not ( = ?auto_155960 ?auto_155964 ) ) ( not ( = ?auto_155960 ?auto_155959 ) ) ( ON ?auto_155957 ?auto_155956 ) ( CLEAR ?auto_155957 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_155960 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_155960 ?auto_155956 )
      ( MAKE-2PILE ?auto_155956 ?auto_155957 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_155965 - BLOCK
      ?auto_155966 - BLOCK
    )
    :vars
    (
      ?auto_155967 - BLOCK
      ?auto_155969 - BLOCK
      ?auto_155971 - BLOCK
      ?auto_155968 - BLOCK
      ?auto_155973 - BLOCK
      ?auto_155972 - BLOCK
      ?auto_155970 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_155965 ?auto_155966 ) ) ( not ( = ?auto_155965 ?auto_155967 ) ) ( not ( = ?auto_155966 ?auto_155967 ) ) ( ON ?auto_155965 ?auto_155969 ) ( not ( = ?auto_155965 ?auto_155969 ) ) ( not ( = ?auto_155966 ?auto_155969 ) ) ( not ( = ?auto_155967 ?auto_155969 ) ) ( ON-TABLE ?auto_155971 ) ( ON ?auto_155968 ?auto_155971 ) ( ON ?auto_155973 ?auto_155968 ) ( ON ?auto_155972 ?auto_155973 ) ( ON ?auto_155970 ?auto_155972 ) ( not ( = ?auto_155971 ?auto_155968 ) ) ( not ( = ?auto_155971 ?auto_155973 ) ) ( not ( = ?auto_155971 ?auto_155972 ) ) ( not ( = ?auto_155971 ?auto_155970 ) ) ( not ( = ?auto_155971 ?auto_155967 ) ) ( not ( = ?auto_155971 ?auto_155966 ) ) ( not ( = ?auto_155968 ?auto_155973 ) ) ( not ( = ?auto_155968 ?auto_155972 ) ) ( not ( = ?auto_155968 ?auto_155970 ) ) ( not ( = ?auto_155968 ?auto_155967 ) ) ( not ( = ?auto_155968 ?auto_155966 ) ) ( not ( = ?auto_155973 ?auto_155972 ) ) ( not ( = ?auto_155973 ?auto_155970 ) ) ( not ( = ?auto_155973 ?auto_155967 ) ) ( not ( = ?auto_155973 ?auto_155966 ) ) ( not ( = ?auto_155972 ?auto_155970 ) ) ( not ( = ?auto_155972 ?auto_155967 ) ) ( not ( = ?auto_155972 ?auto_155966 ) ) ( not ( = ?auto_155970 ?auto_155967 ) ) ( not ( = ?auto_155970 ?auto_155966 ) ) ( not ( = ?auto_155965 ?auto_155971 ) ) ( not ( = ?auto_155965 ?auto_155968 ) ) ( not ( = ?auto_155965 ?auto_155973 ) ) ( not ( = ?auto_155965 ?auto_155972 ) ) ( not ( = ?auto_155965 ?auto_155970 ) ) ( not ( = ?auto_155969 ?auto_155971 ) ) ( not ( = ?auto_155969 ?auto_155968 ) ) ( not ( = ?auto_155969 ?auto_155973 ) ) ( not ( = ?auto_155969 ?auto_155972 ) ) ( not ( = ?auto_155969 ?auto_155970 ) ) ( ON ?auto_155966 ?auto_155965 ) ( CLEAR ?auto_155966 ) ( ON-TABLE ?auto_155969 ) ( HOLDING ?auto_155967 ) ( CLEAR ?auto_155970 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_155971 ?auto_155968 ?auto_155973 ?auto_155972 ?auto_155970 ?auto_155967 )
      ( MAKE-2PILE ?auto_155965 ?auto_155966 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_155974 - BLOCK
      ?auto_155975 - BLOCK
    )
    :vars
    (
      ?auto_155977 - BLOCK
      ?auto_155979 - BLOCK
      ?auto_155976 - BLOCK
      ?auto_155981 - BLOCK
      ?auto_155978 - BLOCK
      ?auto_155980 - BLOCK
      ?auto_155982 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_155974 ?auto_155975 ) ) ( not ( = ?auto_155974 ?auto_155977 ) ) ( not ( = ?auto_155975 ?auto_155977 ) ) ( ON ?auto_155974 ?auto_155979 ) ( not ( = ?auto_155974 ?auto_155979 ) ) ( not ( = ?auto_155975 ?auto_155979 ) ) ( not ( = ?auto_155977 ?auto_155979 ) ) ( ON-TABLE ?auto_155976 ) ( ON ?auto_155981 ?auto_155976 ) ( ON ?auto_155978 ?auto_155981 ) ( ON ?auto_155980 ?auto_155978 ) ( ON ?auto_155982 ?auto_155980 ) ( not ( = ?auto_155976 ?auto_155981 ) ) ( not ( = ?auto_155976 ?auto_155978 ) ) ( not ( = ?auto_155976 ?auto_155980 ) ) ( not ( = ?auto_155976 ?auto_155982 ) ) ( not ( = ?auto_155976 ?auto_155977 ) ) ( not ( = ?auto_155976 ?auto_155975 ) ) ( not ( = ?auto_155981 ?auto_155978 ) ) ( not ( = ?auto_155981 ?auto_155980 ) ) ( not ( = ?auto_155981 ?auto_155982 ) ) ( not ( = ?auto_155981 ?auto_155977 ) ) ( not ( = ?auto_155981 ?auto_155975 ) ) ( not ( = ?auto_155978 ?auto_155980 ) ) ( not ( = ?auto_155978 ?auto_155982 ) ) ( not ( = ?auto_155978 ?auto_155977 ) ) ( not ( = ?auto_155978 ?auto_155975 ) ) ( not ( = ?auto_155980 ?auto_155982 ) ) ( not ( = ?auto_155980 ?auto_155977 ) ) ( not ( = ?auto_155980 ?auto_155975 ) ) ( not ( = ?auto_155982 ?auto_155977 ) ) ( not ( = ?auto_155982 ?auto_155975 ) ) ( not ( = ?auto_155974 ?auto_155976 ) ) ( not ( = ?auto_155974 ?auto_155981 ) ) ( not ( = ?auto_155974 ?auto_155978 ) ) ( not ( = ?auto_155974 ?auto_155980 ) ) ( not ( = ?auto_155974 ?auto_155982 ) ) ( not ( = ?auto_155979 ?auto_155976 ) ) ( not ( = ?auto_155979 ?auto_155981 ) ) ( not ( = ?auto_155979 ?auto_155978 ) ) ( not ( = ?auto_155979 ?auto_155980 ) ) ( not ( = ?auto_155979 ?auto_155982 ) ) ( ON ?auto_155975 ?auto_155974 ) ( ON-TABLE ?auto_155979 ) ( CLEAR ?auto_155982 ) ( ON ?auto_155977 ?auto_155975 ) ( CLEAR ?auto_155977 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_155979 ?auto_155974 ?auto_155975 )
      ( MAKE-2PILE ?auto_155974 ?auto_155975 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_155983 - BLOCK
      ?auto_155984 - BLOCK
    )
    :vars
    (
      ?auto_155988 - BLOCK
      ?auto_155991 - BLOCK
      ?auto_155985 - BLOCK
      ?auto_155989 - BLOCK
      ?auto_155990 - BLOCK
      ?auto_155986 - BLOCK
      ?auto_155987 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_155983 ?auto_155984 ) ) ( not ( = ?auto_155983 ?auto_155988 ) ) ( not ( = ?auto_155984 ?auto_155988 ) ) ( ON ?auto_155983 ?auto_155991 ) ( not ( = ?auto_155983 ?auto_155991 ) ) ( not ( = ?auto_155984 ?auto_155991 ) ) ( not ( = ?auto_155988 ?auto_155991 ) ) ( ON-TABLE ?auto_155985 ) ( ON ?auto_155989 ?auto_155985 ) ( ON ?auto_155990 ?auto_155989 ) ( ON ?auto_155986 ?auto_155990 ) ( not ( = ?auto_155985 ?auto_155989 ) ) ( not ( = ?auto_155985 ?auto_155990 ) ) ( not ( = ?auto_155985 ?auto_155986 ) ) ( not ( = ?auto_155985 ?auto_155987 ) ) ( not ( = ?auto_155985 ?auto_155988 ) ) ( not ( = ?auto_155985 ?auto_155984 ) ) ( not ( = ?auto_155989 ?auto_155990 ) ) ( not ( = ?auto_155989 ?auto_155986 ) ) ( not ( = ?auto_155989 ?auto_155987 ) ) ( not ( = ?auto_155989 ?auto_155988 ) ) ( not ( = ?auto_155989 ?auto_155984 ) ) ( not ( = ?auto_155990 ?auto_155986 ) ) ( not ( = ?auto_155990 ?auto_155987 ) ) ( not ( = ?auto_155990 ?auto_155988 ) ) ( not ( = ?auto_155990 ?auto_155984 ) ) ( not ( = ?auto_155986 ?auto_155987 ) ) ( not ( = ?auto_155986 ?auto_155988 ) ) ( not ( = ?auto_155986 ?auto_155984 ) ) ( not ( = ?auto_155987 ?auto_155988 ) ) ( not ( = ?auto_155987 ?auto_155984 ) ) ( not ( = ?auto_155983 ?auto_155985 ) ) ( not ( = ?auto_155983 ?auto_155989 ) ) ( not ( = ?auto_155983 ?auto_155990 ) ) ( not ( = ?auto_155983 ?auto_155986 ) ) ( not ( = ?auto_155983 ?auto_155987 ) ) ( not ( = ?auto_155991 ?auto_155985 ) ) ( not ( = ?auto_155991 ?auto_155989 ) ) ( not ( = ?auto_155991 ?auto_155990 ) ) ( not ( = ?auto_155991 ?auto_155986 ) ) ( not ( = ?auto_155991 ?auto_155987 ) ) ( ON ?auto_155984 ?auto_155983 ) ( ON-TABLE ?auto_155991 ) ( ON ?auto_155988 ?auto_155984 ) ( CLEAR ?auto_155988 ) ( HOLDING ?auto_155987 ) ( CLEAR ?auto_155986 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_155985 ?auto_155989 ?auto_155990 ?auto_155986 ?auto_155987 )
      ( MAKE-2PILE ?auto_155983 ?auto_155984 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_155992 - BLOCK
      ?auto_155993 - BLOCK
    )
    :vars
    (
      ?auto_155995 - BLOCK
      ?auto_155994 - BLOCK
      ?auto_155998 - BLOCK
      ?auto_155999 - BLOCK
      ?auto_155997 - BLOCK
      ?auto_155996 - BLOCK
      ?auto_156000 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_155992 ?auto_155993 ) ) ( not ( = ?auto_155992 ?auto_155995 ) ) ( not ( = ?auto_155993 ?auto_155995 ) ) ( ON ?auto_155992 ?auto_155994 ) ( not ( = ?auto_155992 ?auto_155994 ) ) ( not ( = ?auto_155993 ?auto_155994 ) ) ( not ( = ?auto_155995 ?auto_155994 ) ) ( ON-TABLE ?auto_155998 ) ( ON ?auto_155999 ?auto_155998 ) ( ON ?auto_155997 ?auto_155999 ) ( ON ?auto_155996 ?auto_155997 ) ( not ( = ?auto_155998 ?auto_155999 ) ) ( not ( = ?auto_155998 ?auto_155997 ) ) ( not ( = ?auto_155998 ?auto_155996 ) ) ( not ( = ?auto_155998 ?auto_156000 ) ) ( not ( = ?auto_155998 ?auto_155995 ) ) ( not ( = ?auto_155998 ?auto_155993 ) ) ( not ( = ?auto_155999 ?auto_155997 ) ) ( not ( = ?auto_155999 ?auto_155996 ) ) ( not ( = ?auto_155999 ?auto_156000 ) ) ( not ( = ?auto_155999 ?auto_155995 ) ) ( not ( = ?auto_155999 ?auto_155993 ) ) ( not ( = ?auto_155997 ?auto_155996 ) ) ( not ( = ?auto_155997 ?auto_156000 ) ) ( not ( = ?auto_155997 ?auto_155995 ) ) ( not ( = ?auto_155997 ?auto_155993 ) ) ( not ( = ?auto_155996 ?auto_156000 ) ) ( not ( = ?auto_155996 ?auto_155995 ) ) ( not ( = ?auto_155996 ?auto_155993 ) ) ( not ( = ?auto_156000 ?auto_155995 ) ) ( not ( = ?auto_156000 ?auto_155993 ) ) ( not ( = ?auto_155992 ?auto_155998 ) ) ( not ( = ?auto_155992 ?auto_155999 ) ) ( not ( = ?auto_155992 ?auto_155997 ) ) ( not ( = ?auto_155992 ?auto_155996 ) ) ( not ( = ?auto_155992 ?auto_156000 ) ) ( not ( = ?auto_155994 ?auto_155998 ) ) ( not ( = ?auto_155994 ?auto_155999 ) ) ( not ( = ?auto_155994 ?auto_155997 ) ) ( not ( = ?auto_155994 ?auto_155996 ) ) ( not ( = ?auto_155994 ?auto_156000 ) ) ( ON ?auto_155993 ?auto_155992 ) ( ON-TABLE ?auto_155994 ) ( ON ?auto_155995 ?auto_155993 ) ( CLEAR ?auto_155996 ) ( ON ?auto_156000 ?auto_155995 ) ( CLEAR ?auto_156000 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_155994 ?auto_155992 ?auto_155993 ?auto_155995 )
      ( MAKE-2PILE ?auto_155992 ?auto_155993 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_156001 - BLOCK
      ?auto_156002 - BLOCK
    )
    :vars
    (
      ?auto_156006 - BLOCK
      ?auto_156005 - BLOCK
      ?auto_156003 - BLOCK
      ?auto_156008 - BLOCK
      ?auto_156004 - BLOCK
      ?auto_156009 - BLOCK
      ?auto_156007 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_156001 ?auto_156002 ) ) ( not ( = ?auto_156001 ?auto_156006 ) ) ( not ( = ?auto_156002 ?auto_156006 ) ) ( ON ?auto_156001 ?auto_156005 ) ( not ( = ?auto_156001 ?auto_156005 ) ) ( not ( = ?auto_156002 ?auto_156005 ) ) ( not ( = ?auto_156006 ?auto_156005 ) ) ( ON-TABLE ?auto_156003 ) ( ON ?auto_156008 ?auto_156003 ) ( ON ?auto_156004 ?auto_156008 ) ( not ( = ?auto_156003 ?auto_156008 ) ) ( not ( = ?auto_156003 ?auto_156004 ) ) ( not ( = ?auto_156003 ?auto_156009 ) ) ( not ( = ?auto_156003 ?auto_156007 ) ) ( not ( = ?auto_156003 ?auto_156006 ) ) ( not ( = ?auto_156003 ?auto_156002 ) ) ( not ( = ?auto_156008 ?auto_156004 ) ) ( not ( = ?auto_156008 ?auto_156009 ) ) ( not ( = ?auto_156008 ?auto_156007 ) ) ( not ( = ?auto_156008 ?auto_156006 ) ) ( not ( = ?auto_156008 ?auto_156002 ) ) ( not ( = ?auto_156004 ?auto_156009 ) ) ( not ( = ?auto_156004 ?auto_156007 ) ) ( not ( = ?auto_156004 ?auto_156006 ) ) ( not ( = ?auto_156004 ?auto_156002 ) ) ( not ( = ?auto_156009 ?auto_156007 ) ) ( not ( = ?auto_156009 ?auto_156006 ) ) ( not ( = ?auto_156009 ?auto_156002 ) ) ( not ( = ?auto_156007 ?auto_156006 ) ) ( not ( = ?auto_156007 ?auto_156002 ) ) ( not ( = ?auto_156001 ?auto_156003 ) ) ( not ( = ?auto_156001 ?auto_156008 ) ) ( not ( = ?auto_156001 ?auto_156004 ) ) ( not ( = ?auto_156001 ?auto_156009 ) ) ( not ( = ?auto_156001 ?auto_156007 ) ) ( not ( = ?auto_156005 ?auto_156003 ) ) ( not ( = ?auto_156005 ?auto_156008 ) ) ( not ( = ?auto_156005 ?auto_156004 ) ) ( not ( = ?auto_156005 ?auto_156009 ) ) ( not ( = ?auto_156005 ?auto_156007 ) ) ( ON ?auto_156002 ?auto_156001 ) ( ON-TABLE ?auto_156005 ) ( ON ?auto_156006 ?auto_156002 ) ( ON ?auto_156007 ?auto_156006 ) ( CLEAR ?auto_156007 ) ( HOLDING ?auto_156009 ) ( CLEAR ?auto_156004 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_156003 ?auto_156008 ?auto_156004 ?auto_156009 )
      ( MAKE-2PILE ?auto_156001 ?auto_156002 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_156010 - BLOCK
      ?auto_156011 - BLOCK
    )
    :vars
    (
      ?auto_156013 - BLOCK
      ?auto_156015 - BLOCK
      ?auto_156016 - BLOCK
      ?auto_156012 - BLOCK
      ?auto_156017 - BLOCK
      ?auto_156018 - BLOCK
      ?auto_156014 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_156010 ?auto_156011 ) ) ( not ( = ?auto_156010 ?auto_156013 ) ) ( not ( = ?auto_156011 ?auto_156013 ) ) ( ON ?auto_156010 ?auto_156015 ) ( not ( = ?auto_156010 ?auto_156015 ) ) ( not ( = ?auto_156011 ?auto_156015 ) ) ( not ( = ?auto_156013 ?auto_156015 ) ) ( ON-TABLE ?auto_156016 ) ( ON ?auto_156012 ?auto_156016 ) ( ON ?auto_156017 ?auto_156012 ) ( not ( = ?auto_156016 ?auto_156012 ) ) ( not ( = ?auto_156016 ?auto_156017 ) ) ( not ( = ?auto_156016 ?auto_156018 ) ) ( not ( = ?auto_156016 ?auto_156014 ) ) ( not ( = ?auto_156016 ?auto_156013 ) ) ( not ( = ?auto_156016 ?auto_156011 ) ) ( not ( = ?auto_156012 ?auto_156017 ) ) ( not ( = ?auto_156012 ?auto_156018 ) ) ( not ( = ?auto_156012 ?auto_156014 ) ) ( not ( = ?auto_156012 ?auto_156013 ) ) ( not ( = ?auto_156012 ?auto_156011 ) ) ( not ( = ?auto_156017 ?auto_156018 ) ) ( not ( = ?auto_156017 ?auto_156014 ) ) ( not ( = ?auto_156017 ?auto_156013 ) ) ( not ( = ?auto_156017 ?auto_156011 ) ) ( not ( = ?auto_156018 ?auto_156014 ) ) ( not ( = ?auto_156018 ?auto_156013 ) ) ( not ( = ?auto_156018 ?auto_156011 ) ) ( not ( = ?auto_156014 ?auto_156013 ) ) ( not ( = ?auto_156014 ?auto_156011 ) ) ( not ( = ?auto_156010 ?auto_156016 ) ) ( not ( = ?auto_156010 ?auto_156012 ) ) ( not ( = ?auto_156010 ?auto_156017 ) ) ( not ( = ?auto_156010 ?auto_156018 ) ) ( not ( = ?auto_156010 ?auto_156014 ) ) ( not ( = ?auto_156015 ?auto_156016 ) ) ( not ( = ?auto_156015 ?auto_156012 ) ) ( not ( = ?auto_156015 ?auto_156017 ) ) ( not ( = ?auto_156015 ?auto_156018 ) ) ( not ( = ?auto_156015 ?auto_156014 ) ) ( ON ?auto_156011 ?auto_156010 ) ( ON-TABLE ?auto_156015 ) ( ON ?auto_156013 ?auto_156011 ) ( ON ?auto_156014 ?auto_156013 ) ( CLEAR ?auto_156017 ) ( ON ?auto_156018 ?auto_156014 ) ( CLEAR ?auto_156018 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_156015 ?auto_156010 ?auto_156011 ?auto_156013 ?auto_156014 )
      ( MAKE-2PILE ?auto_156010 ?auto_156011 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_156019 - BLOCK
      ?auto_156020 - BLOCK
    )
    :vars
    (
      ?auto_156023 - BLOCK
      ?auto_156025 - BLOCK
      ?auto_156024 - BLOCK
      ?auto_156022 - BLOCK
      ?auto_156021 - BLOCK
      ?auto_156027 - BLOCK
      ?auto_156026 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_156019 ?auto_156020 ) ) ( not ( = ?auto_156019 ?auto_156023 ) ) ( not ( = ?auto_156020 ?auto_156023 ) ) ( ON ?auto_156019 ?auto_156025 ) ( not ( = ?auto_156019 ?auto_156025 ) ) ( not ( = ?auto_156020 ?auto_156025 ) ) ( not ( = ?auto_156023 ?auto_156025 ) ) ( ON-TABLE ?auto_156024 ) ( ON ?auto_156022 ?auto_156024 ) ( not ( = ?auto_156024 ?auto_156022 ) ) ( not ( = ?auto_156024 ?auto_156021 ) ) ( not ( = ?auto_156024 ?auto_156027 ) ) ( not ( = ?auto_156024 ?auto_156026 ) ) ( not ( = ?auto_156024 ?auto_156023 ) ) ( not ( = ?auto_156024 ?auto_156020 ) ) ( not ( = ?auto_156022 ?auto_156021 ) ) ( not ( = ?auto_156022 ?auto_156027 ) ) ( not ( = ?auto_156022 ?auto_156026 ) ) ( not ( = ?auto_156022 ?auto_156023 ) ) ( not ( = ?auto_156022 ?auto_156020 ) ) ( not ( = ?auto_156021 ?auto_156027 ) ) ( not ( = ?auto_156021 ?auto_156026 ) ) ( not ( = ?auto_156021 ?auto_156023 ) ) ( not ( = ?auto_156021 ?auto_156020 ) ) ( not ( = ?auto_156027 ?auto_156026 ) ) ( not ( = ?auto_156027 ?auto_156023 ) ) ( not ( = ?auto_156027 ?auto_156020 ) ) ( not ( = ?auto_156026 ?auto_156023 ) ) ( not ( = ?auto_156026 ?auto_156020 ) ) ( not ( = ?auto_156019 ?auto_156024 ) ) ( not ( = ?auto_156019 ?auto_156022 ) ) ( not ( = ?auto_156019 ?auto_156021 ) ) ( not ( = ?auto_156019 ?auto_156027 ) ) ( not ( = ?auto_156019 ?auto_156026 ) ) ( not ( = ?auto_156025 ?auto_156024 ) ) ( not ( = ?auto_156025 ?auto_156022 ) ) ( not ( = ?auto_156025 ?auto_156021 ) ) ( not ( = ?auto_156025 ?auto_156027 ) ) ( not ( = ?auto_156025 ?auto_156026 ) ) ( ON ?auto_156020 ?auto_156019 ) ( ON-TABLE ?auto_156025 ) ( ON ?auto_156023 ?auto_156020 ) ( ON ?auto_156026 ?auto_156023 ) ( ON ?auto_156027 ?auto_156026 ) ( CLEAR ?auto_156027 ) ( HOLDING ?auto_156021 ) ( CLEAR ?auto_156022 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_156024 ?auto_156022 ?auto_156021 )
      ( MAKE-2PILE ?auto_156019 ?auto_156020 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_156028 - BLOCK
      ?auto_156029 - BLOCK
    )
    :vars
    (
      ?auto_156034 - BLOCK
      ?auto_156035 - BLOCK
      ?auto_156036 - BLOCK
      ?auto_156033 - BLOCK
      ?auto_156031 - BLOCK
      ?auto_156030 - BLOCK
      ?auto_156032 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_156028 ?auto_156029 ) ) ( not ( = ?auto_156028 ?auto_156034 ) ) ( not ( = ?auto_156029 ?auto_156034 ) ) ( ON ?auto_156028 ?auto_156035 ) ( not ( = ?auto_156028 ?auto_156035 ) ) ( not ( = ?auto_156029 ?auto_156035 ) ) ( not ( = ?auto_156034 ?auto_156035 ) ) ( ON-TABLE ?auto_156036 ) ( ON ?auto_156033 ?auto_156036 ) ( not ( = ?auto_156036 ?auto_156033 ) ) ( not ( = ?auto_156036 ?auto_156031 ) ) ( not ( = ?auto_156036 ?auto_156030 ) ) ( not ( = ?auto_156036 ?auto_156032 ) ) ( not ( = ?auto_156036 ?auto_156034 ) ) ( not ( = ?auto_156036 ?auto_156029 ) ) ( not ( = ?auto_156033 ?auto_156031 ) ) ( not ( = ?auto_156033 ?auto_156030 ) ) ( not ( = ?auto_156033 ?auto_156032 ) ) ( not ( = ?auto_156033 ?auto_156034 ) ) ( not ( = ?auto_156033 ?auto_156029 ) ) ( not ( = ?auto_156031 ?auto_156030 ) ) ( not ( = ?auto_156031 ?auto_156032 ) ) ( not ( = ?auto_156031 ?auto_156034 ) ) ( not ( = ?auto_156031 ?auto_156029 ) ) ( not ( = ?auto_156030 ?auto_156032 ) ) ( not ( = ?auto_156030 ?auto_156034 ) ) ( not ( = ?auto_156030 ?auto_156029 ) ) ( not ( = ?auto_156032 ?auto_156034 ) ) ( not ( = ?auto_156032 ?auto_156029 ) ) ( not ( = ?auto_156028 ?auto_156036 ) ) ( not ( = ?auto_156028 ?auto_156033 ) ) ( not ( = ?auto_156028 ?auto_156031 ) ) ( not ( = ?auto_156028 ?auto_156030 ) ) ( not ( = ?auto_156028 ?auto_156032 ) ) ( not ( = ?auto_156035 ?auto_156036 ) ) ( not ( = ?auto_156035 ?auto_156033 ) ) ( not ( = ?auto_156035 ?auto_156031 ) ) ( not ( = ?auto_156035 ?auto_156030 ) ) ( not ( = ?auto_156035 ?auto_156032 ) ) ( ON ?auto_156029 ?auto_156028 ) ( ON-TABLE ?auto_156035 ) ( ON ?auto_156034 ?auto_156029 ) ( ON ?auto_156032 ?auto_156034 ) ( ON ?auto_156030 ?auto_156032 ) ( CLEAR ?auto_156033 ) ( ON ?auto_156031 ?auto_156030 ) ( CLEAR ?auto_156031 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_156035 ?auto_156028 ?auto_156029 ?auto_156034 ?auto_156032 ?auto_156030 )
      ( MAKE-2PILE ?auto_156028 ?auto_156029 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_156037 - BLOCK
      ?auto_156038 - BLOCK
    )
    :vars
    (
      ?auto_156041 - BLOCK
      ?auto_156040 - BLOCK
      ?auto_156044 - BLOCK
      ?auto_156043 - BLOCK
      ?auto_156045 - BLOCK
      ?auto_156042 - BLOCK
      ?auto_156039 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_156037 ?auto_156038 ) ) ( not ( = ?auto_156037 ?auto_156041 ) ) ( not ( = ?auto_156038 ?auto_156041 ) ) ( ON ?auto_156037 ?auto_156040 ) ( not ( = ?auto_156037 ?auto_156040 ) ) ( not ( = ?auto_156038 ?auto_156040 ) ) ( not ( = ?auto_156041 ?auto_156040 ) ) ( ON-TABLE ?auto_156044 ) ( not ( = ?auto_156044 ?auto_156043 ) ) ( not ( = ?auto_156044 ?auto_156045 ) ) ( not ( = ?auto_156044 ?auto_156042 ) ) ( not ( = ?auto_156044 ?auto_156039 ) ) ( not ( = ?auto_156044 ?auto_156041 ) ) ( not ( = ?auto_156044 ?auto_156038 ) ) ( not ( = ?auto_156043 ?auto_156045 ) ) ( not ( = ?auto_156043 ?auto_156042 ) ) ( not ( = ?auto_156043 ?auto_156039 ) ) ( not ( = ?auto_156043 ?auto_156041 ) ) ( not ( = ?auto_156043 ?auto_156038 ) ) ( not ( = ?auto_156045 ?auto_156042 ) ) ( not ( = ?auto_156045 ?auto_156039 ) ) ( not ( = ?auto_156045 ?auto_156041 ) ) ( not ( = ?auto_156045 ?auto_156038 ) ) ( not ( = ?auto_156042 ?auto_156039 ) ) ( not ( = ?auto_156042 ?auto_156041 ) ) ( not ( = ?auto_156042 ?auto_156038 ) ) ( not ( = ?auto_156039 ?auto_156041 ) ) ( not ( = ?auto_156039 ?auto_156038 ) ) ( not ( = ?auto_156037 ?auto_156044 ) ) ( not ( = ?auto_156037 ?auto_156043 ) ) ( not ( = ?auto_156037 ?auto_156045 ) ) ( not ( = ?auto_156037 ?auto_156042 ) ) ( not ( = ?auto_156037 ?auto_156039 ) ) ( not ( = ?auto_156040 ?auto_156044 ) ) ( not ( = ?auto_156040 ?auto_156043 ) ) ( not ( = ?auto_156040 ?auto_156045 ) ) ( not ( = ?auto_156040 ?auto_156042 ) ) ( not ( = ?auto_156040 ?auto_156039 ) ) ( ON ?auto_156038 ?auto_156037 ) ( ON-TABLE ?auto_156040 ) ( ON ?auto_156041 ?auto_156038 ) ( ON ?auto_156039 ?auto_156041 ) ( ON ?auto_156042 ?auto_156039 ) ( ON ?auto_156045 ?auto_156042 ) ( CLEAR ?auto_156045 ) ( HOLDING ?auto_156043 ) ( CLEAR ?auto_156044 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_156044 ?auto_156043 )
      ( MAKE-2PILE ?auto_156037 ?auto_156038 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_156046 - BLOCK
      ?auto_156047 - BLOCK
    )
    :vars
    (
      ?auto_156051 - BLOCK
      ?auto_156054 - BLOCK
      ?auto_156050 - BLOCK
      ?auto_156049 - BLOCK
      ?auto_156048 - BLOCK
      ?auto_156053 - BLOCK
      ?auto_156052 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_156046 ?auto_156047 ) ) ( not ( = ?auto_156046 ?auto_156051 ) ) ( not ( = ?auto_156047 ?auto_156051 ) ) ( ON ?auto_156046 ?auto_156054 ) ( not ( = ?auto_156046 ?auto_156054 ) ) ( not ( = ?auto_156047 ?auto_156054 ) ) ( not ( = ?auto_156051 ?auto_156054 ) ) ( ON-TABLE ?auto_156050 ) ( not ( = ?auto_156050 ?auto_156049 ) ) ( not ( = ?auto_156050 ?auto_156048 ) ) ( not ( = ?auto_156050 ?auto_156053 ) ) ( not ( = ?auto_156050 ?auto_156052 ) ) ( not ( = ?auto_156050 ?auto_156051 ) ) ( not ( = ?auto_156050 ?auto_156047 ) ) ( not ( = ?auto_156049 ?auto_156048 ) ) ( not ( = ?auto_156049 ?auto_156053 ) ) ( not ( = ?auto_156049 ?auto_156052 ) ) ( not ( = ?auto_156049 ?auto_156051 ) ) ( not ( = ?auto_156049 ?auto_156047 ) ) ( not ( = ?auto_156048 ?auto_156053 ) ) ( not ( = ?auto_156048 ?auto_156052 ) ) ( not ( = ?auto_156048 ?auto_156051 ) ) ( not ( = ?auto_156048 ?auto_156047 ) ) ( not ( = ?auto_156053 ?auto_156052 ) ) ( not ( = ?auto_156053 ?auto_156051 ) ) ( not ( = ?auto_156053 ?auto_156047 ) ) ( not ( = ?auto_156052 ?auto_156051 ) ) ( not ( = ?auto_156052 ?auto_156047 ) ) ( not ( = ?auto_156046 ?auto_156050 ) ) ( not ( = ?auto_156046 ?auto_156049 ) ) ( not ( = ?auto_156046 ?auto_156048 ) ) ( not ( = ?auto_156046 ?auto_156053 ) ) ( not ( = ?auto_156046 ?auto_156052 ) ) ( not ( = ?auto_156054 ?auto_156050 ) ) ( not ( = ?auto_156054 ?auto_156049 ) ) ( not ( = ?auto_156054 ?auto_156048 ) ) ( not ( = ?auto_156054 ?auto_156053 ) ) ( not ( = ?auto_156054 ?auto_156052 ) ) ( ON ?auto_156047 ?auto_156046 ) ( ON-TABLE ?auto_156054 ) ( ON ?auto_156051 ?auto_156047 ) ( ON ?auto_156052 ?auto_156051 ) ( ON ?auto_156053 ?auto_156052 ) ( ON ?auto_156048 ?auto_156053 ) ( CLEAR ?auto_156050 ) ( ON ?auto_156049 ?auto_156048 ) ( CLEAR ?auto_156049 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_156054 ?auto_156046 ?auto_156047 ?auto_156051 ?auto_156052 ?auto_156053 ?auto_156048 )
      ( MAKE-2PILE ?auto_156046 ?auto_156047 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_156055 - BLOCK
      ?auto_156056 - BLOCK
    )
    :vars
    (
      ?auto_156061 - BLOCK
      ?auto_156062 - BLOCK
      ?auto_156057 - BLOCK
      ?auto_156059 - BLOCK
      ?auto_156058 - BLOCK
      ?auto_156063 - BLOCK
      ?auto_156060 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_156055 ?auto_156056 ) ) ( not ( = ?auto_156055 ?auto_156061 ) ) ( not ( = ?auto_156056 ?auto_156061 ) ) ( ON ?auto_156055 ?auto_156062 ) ( not ( = ?auto_156055 ?auto_156062 ) ) ( not ( = ?auto_156056 ?auto_156062 ) ) ( not ( = ?auto_156061 ?auto_156062 ) ) ( not ( = ?auto_156057 ?auto_156059 ) ) ( not ( = ?auto_156057 ?auto_156058 ) ) ( not ( = ?auto_156057 ?auto_156063 ) ) ( not ( = ?auto_156057 ?auto_156060 ) ) ( not ( = ?auto_156057 ?auto_156061 ) ) ( not ( = ?auto_156057 ?auto_156056 ) ) ( not ( = ?auto_156059 ?auto_156058 ) ) ( not ( = ?auto_156059 ?auto_156063 ) ) ( not ( = ?auto_156059 ?auto_156060 ) ) ( not ( = ?auto_156059 ?auto_156061 ) ) ( not ( = ?auto_156059 ?auto_156056 ) ) ( not ( = ?auto_156058 ?auto_156063 ) ) ( not ( = ?auto_156058 ?auto_156060 ) ) ( not ( = ?auto_156058 ?auto_156061 ) ) ( not ( = ?auto_156058 ?auto_156056 ) ) ( not ( = ?auto_156063 ?auto_156060 ) ) ( not ( = ?auto_156063 ?auto_156061 ) ) ( not ( = ?auto_156063 ?auto_156056 ) ) ( not ( = ?auto_156060 ?auto_156061 ) ) ( not ( = ?auto_156060 ?auto_156056 ) ) ( not ( = ?auto_156055 ?auto_156057 ) ) ( not ( = ?auto_156055 ?auto_156059 ) ) ( not ( = ?auto_156055 ?auto_156058 ) ) ( not ( = ?auto_156055 ?auto_156063 ) ) ( not ( = ?auto_156055 ?auto_156060 ) ) ( not ( = ?auto_156062 ?auto_156057 ) ) ( not ( = ?auto_156062 ?auto_156059 ) ) ( not ( = ?auto_156062 ?auto_156058 ) ) ( not ( = ?auto_156062 ?auto_156063 ) ) ( not ( = ?auto_156062 ?auto_156060 ) ) ( ON ?auto_156056 ?auto_156055 ) ( ON-TABLE ?auto_156062 ) ( ON ?auto_156061 ?auto_156056 ) ( ON ?auto_156060 ?auto_156061 ) ( ON ?auto_156063 ?auto_156060 ) ( ON ?auto_156058 ?auto_156063 ) ( ON ?auto_156059 ?auto_156058 ) ( CLEAR ?auto_156059 ) ( HOLDING ?auto_156057 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_156057 )
      ( MAKE-2PILE ?auto_156055 ?auto_156056 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_156064 - BLOCK
      ?auto_156065 - BLOCK
    )
    :vars
    (
      ?auto_156068 - BLOCK
      ?auto_156071 - BLOCK
      ?auto_156066 - BLOCK
      ?auto_156069 - BLOCK
      ?auto_156072 - BLOCK
      ?auto_156070 - BLOCK
      ?auto_156067 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_156064 ?auto_156065 ) ) ( not ( = ?auto_156064 ?auto_156068 ) ) ( not ( = ?auto_156065 ?auto_156068 ) ) ( ON ?auto_156064 ?auto_156071 ) ( not ( = ?auto_156064 ?auto_156071 ) ) ( not ( = ?auto_156065 ?auto_156071 ) ) ( not ( = ?auto_156068 ?auto_156071 ) ) ( not ( = ?auto_156066 ?auto_156069 ) ) ( not ( = ?auto_156066 ?auto_156072 ) ) ( not ( = ?auto_156066 ?auto_156070 ) ) ( not ( = ?auto_156066 ?auto_156067 ) ) ( not ( = ?auto_156066 ?auto_156068 ) ) ( not ( = ?auto_156066 ?auto_156065 ) ) ( not ( = ?auto_156069 ?auto_156072 ) ) ( not ( = ?auto_156069 ?auto_156070 ) ) ( not ( = ?auto_156069 ?auto_156067 ) ) ( not ( = ?auto_156069 ?auto_156068 ) ) ( not ( = ?auto_156069 ?auto_156065 ) ) ( not ( = ?auto_156072 ?auto_156070 ) ) ( not ( = ?auto_156072 ?auto_156067 ) ) ( not ( = ?auto_156072 ?auto_156068 ) ) ( not ( = ?auto_156072 ?auto_156065 ) ) ( not ( = ?auto_156070 ?auto_156067 ) ) ( not ( = ?auto_156070 ?auto_156068 ) ) ( not ( = ?auto_156070 ?auto_156065 ) ) ( not ( = ?auto_156067 ?auto_156068 ) ) ( not ( = ?auto_156067 ?auto_156065 ) ) ( not ( = ?auto_156064 ?auto_156066 ) ) ( not ( = ?auto_156064 ?auto_156069 ) ) ( not ( = ?auto_156064 ?auto_156072 ) ) ( not ( = ?auto_156064 ?auto_156070 ) ) ( not ( = ?auto_156064 ?auto_156067 ) ) ( not ( = ?auto_156071 ?auto_156066 ) ) ( not ( = ?auto_156071 ?auto_156069 ) ) ( not ( = ?auto_156071 ?auto_156072 ) ) ( not ( = ?auto_156071 ?auto_156070 ) ) ( not ( = ?auto_156071 ?auto_156067 ) ) ( ON ?auto_156065 ?auto_156064 ) ( ON-TABLE ?auto_156071 ) ( ON ?auto_156068 ?auto_156065 ) ( ON ?auto_156067 ?auto_156068 ) ( ON ?auto_156070 ?auto_156067 ) ( ON ?auto_156072 ?auto_156070 ) ( ON ?auto_156069 ?auto_156072 ) ( ON ?auto_156066 ?auto_156069 ) ( CLEAR ?auto_156066 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_156071 ?auto_156064 ?auto_156065 ?auto_156068 ?auto_156067 ?auto_156070 ?auto_156072 ?auto_156069 )
      ( MAKE-2PILE ?auto_156064 ?auto_156065 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_156100 - BLOCK
      ?auto_156101 - BLOCK
      ?auto_156102 - BLOCK
      ?auto_156103 - BLOCK
      ?auto_156104 - BLOCK
    )
    :vars
    (
      ?auto_156105 - BLOCK
      ?auto_156107 - BLOCK
      ?auto_156106 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_156105 ?auto_156104 ) ( ON-TABLE ?auto_156100 ) ( ON ?auto_156101 ?auto_156100 ) ( ON ?auto_156102 ?auto_156101 ) ( ON ?auto_156103 ?auto_156102 ) ( ON ?auto_156104 ?auto_156103 ) ( not ( = ?auto_156100 ?auto_156101 ) ) ( not ( = ?auto_156100 ?auto_156102 ) ) ( not ( = ?auto_156100 ?auto_156103 ) ) ( not ( = ?auto_156100 ?auto_156104 ) ) ( not ( = ?auto_156100 ?auto_156105 ) ) ( not ( = ?auto_156101 ?auto_156102 ) ) ( not ( = ?auto_156101 ?auto_156103 ) ) ( not ( = ?auto_156101 ?auto_156104 ) ) ( not ( = ?auto_156101 ?auto_156105 ) ) ( not ( = ?auto_156102 ?auto_156103 ) ) ( not ( = ?auto_156102 ?auto_156104 ) ) ( not ( = ?auto_156102 ?auto_156105 ) ) ( not ( = ?auto_156103 ?auto_156104 ) ) ( not ( = ?auto_156103 ?auto_156105 ) ) ( not ( = ?auto_156104 ?auto_156105 ) ) ( not ( = ?auto_156100 ?auto_156107 ) ) ( not ( = ?auto_156100 ?auto_156106 ) ) ( not ( = ?auto_156101 ?auto_156107 ) ) ( not ( = ?auto_156101 ?auto_156106 ) ) ( not ( = ?auto_156102 ?auto_156107 ) ) ( not ( = ?auto_156102 ?auto_156106 ) ) ( not ( = ?auto_156103 ?auto_156107 ) ) ( not ( = ?auto_156103 ?auto_156106 ) ) ( not ( = ?auto_156104 ?auto_156107 ) ) ( not ( = ?auto_156104 ?auto_156106 ) ) ( not ( = ?auto_156105 ?auto_156107 ) ) ( not ( = ?auto_156105 ?auto_156106 ) ) ( not ( = ?auto_156107 ?auto_156106 ) ) ( ON ?auto_156107 ?auto_156105 ) ( CLEAR ?auto_156107 ) ( HOLDING ?auto_156106 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_156106 )
      ( MAKE-5PILE ?auto_156100 ?auto_156101 ?auto_156102 ?auto_156103 ?auto_156104 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_156213 - BLOCK
      ?auto_156214 - BLOCK
      ?auto_156215 - BLOCK
    )
    :vars
    (
      ?auto_156216 - BLOCK
      ?auto_156220 - BLOCK
      ?auto_156219 - BLOCK
      ?auto_156218 - BLOCK
      ?auto_156217 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_156213 ) ( not ( = ?auto_156213 ?auto_156214 ) ) ( not ( = ?auto_156213 ?auto_156215 ) ) ( not ( = ?auto_156214 ?auto_156215 ) ) ( ON ?auto_156215 ?auto_156216 ) ( not ( = ?auto_156213 ?auto_156216 ) ) ( not ( = ?auto_156214 ?auto_156216 ) ) ( not ( = ?auto_156215 ?auto_156216 ) ) ( CLEAR ?auto_156213 ) ( ON ?auto_156214 ?auto_156215 ) ( CLEAR ?auto_156214 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_156220 ) ( ON ?auto_156219 ?auto_156220 ) ( ON ?auto_156218 ?auto_156219 ) ( ON ?auto_156217 ?auto_156218 ) ( ON ?auto_156216 ?auto_156217 ) ( not ( = ?auto_156220 ?auto_156219 ) ) ( not ( = ?auto_156220 ?auto_156218 ) ) ( not ( = ?auto_156220 ?auto_156217 ) ) ( not ( = ?auto_156220 ?auto_156216 ) ) ( not ( = ?auto_156220 ?auto_156215 ) ) ( not ( = ?auto_156220 ?auto_156214 ) ) ( not ( = ?auto_156219 ?auto_156218 ) ) ( not ( = ?auto_156219 ?auto_156217 ) ) ( not ( = ?auto_156219 ?auto_156216 ) ) ( not ( = ?auto_156219 ?auto_156215 ) ) ( not ( = ?auto_156219 ?auto_156214 ) ) ( not ( = ?auto_156218 ?auto_156217 ) ) ( not ( = ?auto_156218 ?auto_156216 ) ) ( not ( = ?auto_156218 ?auto_156215 ) ) ( not ( = ?auto_156218 ?auto_156214 ) ) ( not ( = ?auto_156217 ?auto_156216 ) ) ( not ( = ?auto_156217 ?auto_156215 ) ) ( not ( = ?auto_156217 ?auto_156214 ) ) ( not ( = ?auto_156213 ?auto_156220 ) ) ( not ( = ?auto_156213 ?auto_156219 ) ) ( not ( = ?auto_156213 ?auto_156218 ) ) ( not ( = ?auto_156213 ?auto_156217 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_156220 ?auto_156219 ?auto_156218 ?auto_156217 ?auto_156216 ?auto_156215 )
      ( MAKE-3PILE ?auto_156213 ?auto_156214 ?auto_156215 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_156221 - BLOCK
      ?auto_156222 - BLOCK
      ?auto_156223 - BLOCK
    )
    :vars
    (
      ?auto_156225 - BLOCK
      ?auto_156228 - BLOCK
      ?auto_156226 - BLOCK
      ?auto_156227 - BLOCK
      ?auto_156224 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_156221 ?auto_156222 ) ) ( not ( = ?auto_156221 ?auto_156223 ) ) ( not ( = ?auto_156222 ?auto_156223 ) ) ( ON ?auto_156223 ?auto_156225 ) ( not ( = ?auto_156221 ?auto_156225 ) ) ( not ( = ?auto_156222 ?auto_156225 ) ) ( not ( = ?auto_156223 ?auto_156225 ) ) ( ON ?auto_156222 ?auto_156223 ) ( CLEAR ?auto_156222 ) ( ON-TABLE ?auto_156228 ) ( ON ?auto_156226 ?auto_156228 ) ( ON ?auto_156227 ?auto_156226 ) ( ON ?auto_156224 ?auto_156227 ) ( ON ?auto_156225 ?auto_156224 ) ( not ( = ?auto_156228 ?auto_156226 ) ) ( not ( = ?auto_156228 ?auto_156227 ) ) ( not ( = ?auto_156228 ?auto_156224 ) ) ( not ( = ?auto_156228 ?auto_156225 ) ) ( not ( = ?auto_156228 ?auto_156223 ) ) ( not ( = ?auto_156228 ?auto_156222 ) ) ( not ( = ?auto_156226 ?auto_156227 ) ) ( not ( = ?auto_156226 ?auto_156224 ) ) ( not ( = ?auto_156226 ?auto_156225 ) ) ( not ( = ?auto_156226 ?auto_156223 ) ) ( not ( = ?auto_156226 ?auto_156222 ) ) ( not ( = ?auto_156227 ?auto_156224 ) ) ( not ( = ?auto_156227 ?auto_156225 ) ) ( not ( = ?auto_156227 ?auto_156223 ) ) ( not ( = ?auto_156227 ?auto_156222 ) ) ( not ( = ?auto_156224 ?auto_156225 ) ) ( not ( = ?auto_156224 ?auto_156223 ) ) ( not ( = ?auto_156224 ?auto_156222 ) ) ( not ( = ?auto_156221 ?auto_156228 ) ) ( not ( = ?auto_156221 ?auto_156226 ) ) ( not ( = ?auto_156221 ?auto_156227 ) ) ( not ( = ?auto_156221 ?auto_156224 ) ) ( HOLDING ?auto_156221 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_156221 )
      ( MAKE-3PILE ?auto_156221 ?auto_156222 ?auto_156223 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_156229 - BLOCK
      ?auto_156230 - BLOCK
      ?auto_156231 - BLOCK
    )
    :vars
    (
      ?auto_156232 - BLOCK
      ?auto_156235 - BLOCK
      ?auto_156234 - BLOCK
      ?auto_156233 - BLOCK
      ?auto_156236 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_156229 ?auto_156230 ) ) ( not ( = ?auto_156229 ?auto_156231 ) ) ( not ( = ?auto_156230 ?auto_156231 ) ) ( ON ?auto_156231 ?auto_156232 ) ( not ( = ?auto_156229 ?auto_156232 ) ) ( not ( = ?auto_156230 ?auto_156232 ) ) ( not ( = ?auto_156231 ?auto_156232 ) ) ( ON ?auto_156230 ?auto_156231 ) ( ON-TABLE ?auto_156235 ) ( ON ?auto_156234 ?auto_156235 ) ( ON ?auto_156233 ?auto_156234 ) ( ON ?auto_156236 ?auto_156233 ) ( ON ?auto_156232 ?auto_156236 ) ( not ( = ?auto_156235 ?auto_156234 ) ) ( not ( = ?auto_156235 ?auto_156233 ) ) ( not ( = ?auto_156235 ?auto_156236 ) ) ( not ( = ?auto_156235 ?auto_156232 ) ) ( not ( = ?auto_156235 ?auto_156231 ) ) ( not ( = ?auto_156235 ?auto_156230 ) ) ( not ( = ?auto_156234 ?auto_156233 ) ) ( not ( = ?auto_156234 ?auto_156236 ) ) ( not ( = ?auto_156234 ?auto_156232 ) ) ( not ( = ?auto_156234 ?auto_156231 ) ) ( not ( = ?auto_156234 ?auto_156230 ) ) ( not ( = ?auto_156233 ?auto_156236 ) ) ( not ( = ?auto_156233 ?auto_156232 ) ) ( not ( = ?auto_156233 ?auto_156231 ) ) ( not ( = ?auto_156233 ?auto_156230 ) ) ( not ( = ?auto_156236 ?auto_156232 ) ) ( not ( = ?auto_156236 ?auto_156231 ) ) ( not ( = ?auto_156236 ?auto_156230 ) ) ( not ( = ?auto_156229 ?auto_156235 ) ) ( not ( = ?auto_156229 ?auto_156234 ) ) ( not ( = ?auto_156229 ?auto_156233 ) ) ( not ( = ?auto_156229 ?auto_156236 ) ) ( ON ?auto_156229 ?auto_156230 ) ( CLEAR ?auto_156229 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_156235 ?auto_156234 ?auto_156233 ?auto_156236 ?auto_156232 ?auto_156231 ?auto_156230 )
      ( MAKE-3PILE ?auto_156229 ?auto_156230 ?auto_156231 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_156240 - BLOCK
      ?auto_156241 - BLOCK
      ?auto_156242 - BLOCK
    )
    :vars
    (
      ?auto_156245 - BLOCK
      ?auto_156243 - BLOCK
      ?auto_156244 - BLOCK
      ?auto_156246 - BLOCK
      ?auto_156247 - BLOCK
      ?auto_156248 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_156240 ?auto_156241 ) ) ( not ( = ?auto_156240 ?auto_156242 ) ) ( not ( = ?auto_156241 ?auto_156242 ) ) ( ON ?auto_156242 ?auto_156245 ) ( not ( = ?auto_156240 ?auto_156245 ) ) ( not ( = ?auto_156241 ?auto_156245 ) ) ( not ( = ?auto_156242 ?auto_156245 ) ) ( ON ?auto_156241 ?auto_156242 ) ( CLEAR ?auto_156241 ) ( ON-TABLE ?auto_156243 ) ( ON ?auto_156244 ?auto_156243 ) ( ON ?auto_156246 ?auto_156244 ) ( ON ?auto_156247 ?auto_156246 ) ( ON ?auto_156245 ?auto_156247 ) ( not ( = ?auto_156243 ?auto_156244 ) ) ( not ( = ?auto_156243 ?auto_156246 ) ) ( not ( = ?auto_156243 ?auto_156247 ) ) ( not ( = ?auto_156243 ?auto_156245 ) ) ( not ( = ?auto_156243 ?auto_156242 ) ) ( not ( = ?auto_156243 ?auto_156241 ) ) ( not ( = ?auto_156244 ?auto_156246 ) ) ( not ( = ?auto_156244 ?auto_156247 ) ) ( not ( = ?auto_156244 ?auto_156245 ) ) ( not ( = ?auto_156244 ?auto_156242 ) ) ( not ( = ?auto_156244 ?auto_156241 ) ) ( not ( = ?auto_156246 ?auto_156247 ) ) ( not ( = ?auto_156246 ?auto_156245 ) ) ( not ( = ?auto_156246 ?auto_156242 ) ) ( not ( = ?auto_156246 ?auto_156241 ) ) ( not ( = ?auto_156247 ?auto_156245 ) ) ( not ( = ?auto_156247 ?auto_156242 ) ) ( not ( = ?auto_156247 ?auto_156241 ) ) ( not ( = ?auto_156240 ?auto_156243 ) ) ( not ( = ?auto_156240 ?auto_156244 ) ) ( not ( = ?auto_156240 ?auto_156246 ) ) ( not ( = ?auto_156240 ?auto_156247 ) ) ( ON ?auto_156240 ?auto_156248 ) ( CLEAR ?auto_156240 ) ( HAND-EMPTY ) ( not ( = ?auto_156240 ?auto_156248 ) ) ( not ( = ?auto_156241 ?auto_156248 ) ) ( not ( = ?auto_156242 ?auto_156248 ) ) ( not ( = ?auto_156245 ?auto_156248 ) ) ( not ( = ?auto_156243 ?auto_156248 ) ) ( not ( = ?auto_156244 ?auto_156248 ) ) ( not ( = ?auto_156246 ?auto_156248 ) ) ( not ( = ?auto_156247 ?auto_156248 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_156240 ?auto_156248 )
      ( MAKE-3PILE ?auto_156240 ?auto_156241 ?auto_156242 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_156249 - BLOCK
      ?auto_156250 - BLOCK
      ?auto_156251 - BLOCK
    )
    :vars
    (
      ?auto_156256 - BLOCK
      ?auto_156252 - BLOCK
      ?auto_156253 - BLOCK
      ?auto_156254 - BLOCK
      ?auto_156255 - BLOCK
      ?auto_156257 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_156249 ?auto_156250 ) ) ( not ( = ?auto_156249 ?auto_156251 ) ) ( not ( = ?auto_156250 ?auto_156251 ) ) ( ON ?auto_156251 ?auto_156256 ) ( not ( = ?auto_156249 ?auto_156256 ) ) ( not ( = ?auto_156250 ?auto_156256 ) ) ( not ( = ?auto_156251 ?auto_156256 ) ) ( ON-TABLE ?auto_156252 ) ( ON ?auto_156253 ?auto_156252 ) ( ON ?auto_156254 ?auto_156253 ) ( ON ?auto_156255 ?auto_156254 ) ( ON ?auto_156256 ?auto_156255 ) ( not ( = ?auto_156252 ?auto_156253 ) ) ( not ( = ?auto_156252 ?auto_156254 ) ) ( not ( = ?auto_156252 ?auto_156255 ) ) ( not ( = ?auto_156252 ?auto_156256 ) ) ( not ( = ?auto_156252 ?auto_156251 ) ) ( not ( = ?auto_156252 ?auto_156250 ) ) ( not ( = ?auto_156253 ?auto_156254 ) ) ( not ( = ?auto_156253 ?auto_156255 ) ) ( not ( = ?auto_156253 ?auto_156256 ) ) ( not ( = ?auto_156253 ?auto_156251 ) ) ( not ( = ?auto_156253 ?auto_156250 ) ) ( not ( = ?auto_156254 ?auto_156255 ) ) ( not ( = ?auto_156254 ?auto_156256 ) ) ( not ( = ?auto_156254 ?auto_156251 ) ) ( not ( = ?auto_156254 ?auto_156250 ) ) ( not ( = ?auto_156255 ?auto_156256 ) ) ( not ( = ?auto_156255 ?auto_156251 ) ) ( not ( = ?auto_156255 ?auto_156250 ) ) ( not ( = ?auto_156249 ?auto_156252 ) ) ( not ( = ?auto_156249 ?auto_156253 ) ) ( not ( = ?auto_156249 ?auto_156254 ) ) ( not ( = ?auto_156249 ?auto_156255 ) ) ( ON ?auto_156249 ?auto_156257 ) ( CLEAR ?auto_156249 ) ( not ( = ?auto_156249 ?auto_156257 ) ) ( not ( = ?auto_156250 ?auto_156257 ) ) ( not ( = ?auto_156251 ?auto_156257 ) ) ( not ( = ?auto_156256 ?auto_156257 ) ) ( not ( = ?auto_156252 ?auto_156257 ) ) ( not ( = ?auto_156253 ?auto_156257 ) ) ( not ( = ?auto_156254 ?auto_156257 ) ) ( not ( = ?auto_156255 ?auto_156257 ) ) ( HOLDING ?auto_156250 ) ( CLEAR ?auto_156251 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_156252 ?auto_156253 ?auto_156254 ?auto_156255 ?auto_156256 ?auto_156251 ?auto_156250 )
      ( MAKE-3PILE ?auto_156249 ?auto_156250 ?auto_156251 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_156258 - BLOCK
      ?auto_156259 - BLOCK
      ?auto_156260 - BLOCK
    )
    :vars
    (
      ?auto_156264 - BLOCK
      ?auto_156262 - BLOCK
      ?auto_156261 - BLOCK
      ?auto_156265 - BLOCK
      ?auto_156263 - BLOCK
      ?auto_156266 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_156258 ?auto_156259 ) ) ( not ( = ?auto_156258 ?auto_156260 ) ) ( not ( = ?auto_156259 ?auto_156260 ) ) ( ON ?auto_156260 ?auto_156264 ) ( not ( = ?auto_156258 ?auto_156264 ) ) ( not ( = ?auto_156259 ?auto_156264 ) ) ( not ( = ?auto_156260 ?auto_156264 ) ) ( ON-TABLE ?auto_156262 ) ( ON ?auto_156261 ?auto_156262 ) ( ON ?auto_156265 ?auto_156261 ) ( ON ?auto_156263 ?auto_156265 ) ( ON ?auto_156264 ?auto_156263 ) ( not ( = ?auto_156262 ?auto_156261 ) ) ( not ( = ?auto_156262 ?auto_156265 ) ) ( not ( = ?auto_156262 ?auto_156263 ) ) ( not ( = ?auto_156262 ?auto_156264 ) ) ( not ( = ?auto_156262 ?auto_156260 ) ) ( not ( = ?auto_156262 ?auto_156259 ) ) ( not ( = ?auto_156261 ?auto_156265 ) ) ( not ( = ?auto_156261 ?auto_156263 ) ) ( not ( = ?auto_156261 ?auto_156264 ) ) ( not ( = ?auto_156261 ?auto_156260 ) ) ( not ( = ?auto_156261 ?auto_156259 ) ) ( not ( = ?auto_156265 ?auto_156263 ) ) ( not ( = ?auto_156265 ?auto_156264 ) ) ( not ( = ?auto_156265 ?auto_156260 ) ) ( not ( = ?auto_156265 ?auto_156259 ) ) ( not ( = ?auto_156263 ?auto_156264 ) ) ( not ( = ?auto_156263 ?auto_156260 ) ) ( not ( = ?auto_156263 ?auto_156259 ) ) ( not ( = ?auto_156258 ?auto_156262 ) ) ( not ( = ?auto_156258 ?auto_156261 ) ) ( not ( = ?auto_156258 ?auto_156265 ) ) ( not ( = ?auto_156258 ?auto_156263 ) ) ( ON ?auto_156258 ?auto_156266 ) ( not ( = ?auto_156258 ?auto_156266 ) ) ( not ( = ?auto_156259 ?auto_156266 ) ) ( not ( = ?auto_156260 ?auto_156266 ) ) ( not ( = ?auto_156264 ?auto_156266 ) ) ( not ( = ?auto_156262 ?auto_156266 ) ) ( not ( = ?auto_156261 ?auto_156266 ) ) ( not ( = ?auto_156265 ?auto_156266 ) ) ( not ( = ?auto_156263 ?auto_156266 ) ) ( CLEAR ?auto_156260 ) ( ON ?auto_156259 ?auto_156258 ) ( CLEAR ?auto_156259 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_156266 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_156266 ?auto_156258 )
      ( MAKE-3PILE ?auto_156258 ?auto_156259 ?auto_156260 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_156267 - BLOCK
      ?auto_156268 - BLOCK
      ?auto_156269 - BLOCK
    )
    :vars
    (
      ?auto_156274 - BLOCK
      ?auto_156270 - BLOCK
      ?auto_156271 - BLOCK
      ?auto_156272 - BLOCK
      ?auto_156273 - BLOCK
      ?auto_156275 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_156267 ?auto_156268 ) ) ( not ( = ?auto_156267 ?auto_156269 ) ) ( not ( = ?auto_156268 ?auto_156269 ) ) ( not ( = ?auto_156267 ?auto_156274 ) ) ( not ( = ?auto_156268 ?auto_156274 ) ) ( not ( = ?auto_156269 ?auto_156274 ) ) ( ON-TABLE ?auto_156270 ) ( ON ?auto_156271 ?auto_156270 ) ( ON ?auto_156272 ?auto_156271 ) ( ON ?auto_156273 ?auto_156272 ) ( ON ?auto_156274 ?auto_156273 ) ( not ( = ?auto_156270 ?auto_156271 ) ) ( not ( = ?auto_156270 ?auto_156272 ) ) ( not ( = ?auto_156270 ?auto_156273 ) ) ( not ( = ?auto_156270 ?auto_156274 ) ) ( not ( = ?auto_156270 ?auto_156269 ) ) ( not ( = ?auto_156270 ?auto_156268 ) ) ( not ( = ?auto_156271 ?auto_156272 ) ) ( not ( = ?auto_156271 ?auto_156273 ) ) ( not ( = ?auto_156271 ?auto_156274 ) ) ( not ( = ?auto_156271 ?auto_156269 ) ) ( not ( = ?auto_156271 ?auto_156268 ) ) ( not ( = ?auto_156272 ?auto_156273 ) ) ( not ( = ?auto_156272 ?auto_156274 ) ) ( not ( = ?auto_156272 ?auto_156269 ) ) ( not ( = ?auto_156272 ?auto_156268 ) ) ( not ( = ?auto_156273 ?auto_156274 ) ) ( not ( = ?auto_156273 ?auto_156269 ) ) ( not ( = ?auto_156273 ?auto_156268 ) ) ( not ( = ?auto_156267 ?auto_156270 ) ) ( not ( = ?auto_156267 ?auto_156271 ) ) ( not ( = ?auto_156267 ?auto_156272 ) ) ( not ( = ?auto_156267 ?auto_156273 ) ) ( ON ?auto_156267 ?auto_156275 ) ( not ( = ?auto_156267 ?auto_156275 ) ) ( not ( = ?auto_156268 ?auto_156275 ) ) ( not ( = ?auto_156269 ?auto_156275 ) ) ( not ( = ?auto_156274 ?auto_156275 ) ) ( not ( = ?auto_156270 ?auto_156275 ) ) ( not ( = ?auto_156271 ?auto_156275 ) ) ( not ( = ?auto_156272 ?auto_156275 ) ) ( not ( = ?auto_156273 ?auto_156275 ) ) ( ON ?auto_156268 ?auto_156267 ) ( CLEAR ?auto_156268 ) ( ON-TABLE ?auto_156275 ) ( HOLDING ?auto_156269 ) ( CLEAR ?auto_156274 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_156270 ?auto_156271 ?auto_156272 ?auto_156273 ?auto_156274 ?auto_156269 )
      ( MAKE-3PILE ?auto_156267 ?auto_156268 ?auto_156269 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_156276 - BLOCK
      ?auto_156277 - BLOCK
      ?auto_156278 - BLOCK
    )
    :vars
    (
      ?auto_156279 - BLOCK
      ?auto_156282 - BLOCK
      ?auto_156283 - BLOCK
      ?auto_156281 - BLOCK
      ?auto_156280 - BLOCK
      ?auto_156284 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_156276 ?auto_156277 ) ) ( not ( = ?auto_156276 ?auto_156278 ) ) ( not ( = ?auto_156277 ?auto_156278 ) ) ( not ( = ?auto_156276 ?auto_156279 ) ) ( not ( = ?auto_156277 ?auto_156279 ) ) ( not ( = ?auto_156278 ?auto_156279 ) ) ( ON-TABLE ?auto_156282 ) ( ON ?auto_156283 ?auto_156282 ) ( ON ?auto_156281 ?auto_156283 ) ( ON ?auto_156280 ?auto_156281 ) ( ON ?auto_156279 ?auto_156280 ) ( not ( = ?auto_156282 ?auto_156283 ) ) ( not ( = ?auto_156282 ?auto_156281 ) ) ( not ( = ?auto_156282 ?auto_156280 ) ) ( not ( = ?auto_156282 ?auto_156279 ) ) ( not ( = ?auto_156282 ?auto_156278 ) ) ( not ( = ?auto_156282 ?auto_156277 ) ) ( not ( = ?auto_156283 ?auto_156281 ) ) ( not ( = ?auto_156283 ?auto_156280 ) ) ( not ( = ?auto_156283 ?auto_156279 ) ) ( not ( = ?auto_156283 ?auto_156278 ) ) ( not ( = ?auto_156283 ?auto_156277 ) ) ( not ( = ?auto_156281 ?auto_156280 ) ) ( not ( = ?auto_156281 ?auto_156279 ) ) ( not ( = ?auto_156281 ?auto_156278 ) ) ( not ( = ?auto_156281 ?auto_156277 ) ) ( not ( = ?auto_156280 ?auto_156279 ) ) ( not ( = ?auto_156280 ?auto_156278 ) ) ( not ( = ?auto_156280 ?auto_156277 ) ) ( not ( = ?auto_156276 ?auto_156282 ) ) ( not ( = ?auto_156276 ?auto_156283 ) ) ( not ( = ?auto_156276 ?auto_156281 ) ) ( not ( = ?auto_156276 ?auto_156280 ) ) ( ON ?auto_156276 ?auto_156284 ) ( not ( = ?auto_156276 ?auto_156284 ) ) ( not ( = ?auto_156277 ?auto_156284 ) ) ( not ( = ?auto_156278 ?auto_156284 ) ) ( not ( = ?auto_156279 ?auto_156284 ) ) ( not ( = ?auto_156282 ?auto_156284 ) ) ( not ( = ?auto_156283 ?auto_156284 ) ) ( not ( = ?auto_156281 ?auto_156284 ) ) ( not ( = ?auto_156280 ?auto_156284 ) ) ( ON ?auto_156277 ?auto_156276 ) ( ON-TABLE ?auto_156284 ) ( CLEAR ?auto_156279 ) ( ON ?auto_156278 ?auto_156277 ) ( CLEAR ?auto_156278 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_156284 ?auto_156276 ?auto_156277 )
      ( MAKE-3PILE ?auto_156276 ?auto_156277 ?auto_156278 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_156285 - BLOCK
      ?auto_156286 - BLOCK
      ?auto_156287 - BLOCK
    )
    :vars
    (
      ?auto_156291 - BLOCK
      ?auto_156288 - BLOCK
      ?auto_156293 - BLOCK
      ?auto_156292 - BLOCK
      ?auto_156290 - BLOCK
      ?auto_156289 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_156285 ?auto_156286 ) ) ( not ( = ?auto_156285 ?auto_156287 ) ) ( not ( = ?auto_156286 ?auto_156287 ) ) ( not ( = ?auto_156285 ?auto_156291 ) ) ( not ( = ?auto_156286 ?auto_156291 ) ) ( not ( = ?auto_156287 ?auto_156291 ) ) ( ON-TABLE ?auto_156288 ) ( ON ?auto_156293 ?auto_156288 ) ( ON ?auto_156292 ?auto_156293 ) ( ON ?auto_156290 ?auto_156292 ) ( not ( = ?auto_156288 ?auto_156293 ) ) ( not ( = ?auto_156288 ?auto_156292 ) ) ( not ( = ?auto_156288 ?auto_156290 ) ) ( not ( = ?auto_156288 ?auto_156291 ) ) ( not ( = ?auto_156288 ?auto_156287 ) ) ( not ( = ?auto_156288 ?auto_156286 ) ) ( not ( = ?auto_156293 ?auto_156292 ) ) ( not ( = ?auto_156293 ?auto_156290 ) ) ( not ( = ?auto_156293 ?auto_156291 ) ) ( not ( = ?auto_156293 ?auto_156287 ) ) ( not ( = ?auto_156293 ?auto_156286 ) ) ( not ( = ?auto_156292 ?auto_156290 ) ) ( not ( = ?auto_156292 ?auto_156291 ) ) ( not ( = ?auto_156292 ?auto_156287 ) ) ( not ( = ?auto_156292 ?auto_156286 ) ) ( not ( = ?auto_156290 ?auto_156291 ) ) ( not ( = ?auto_156290 ?auto_156287 ) ) ( not ( = ?auto_156290 ?auto_156286 ) ) ( not ( = ?auto_156285 ?auto_156288 ) ) ( not ( = ?auto_156285 ?auto_156293 ) ) ( not ( = ?auto_156285 ?auto_156292 ) ) ( not ( = ?auto_156285 ?auto_156290 ) ) ( ON ?auto_156285 ?auto_156289 ) ( not ( = ?auto_156285 ?auto_156289 ) ) ( not ( = ?auto_156286 ?auto_156289 ) ) ( not ( = ?auto_156287 ?auto_156289 ) ) ( not ( = ?auto_156291 ?auto_156289 ) ) ( not ( = ?auto_156288 ?auto_156289 ) ) ( not ( = ?auto_156293 ?auto_156289 ) ) ( not ( = ?auto_156292 ?auto_156289 ) ) ( not ( = ?auto_156290 ?auto_156289 ) ) ( ON ?auto_156286 ?auto_156285 ) ( ON-TABLE ?auto_156289 ) ( ON ?auto_156287 ?auto_156286 ) ( CLEAR ?auto_156287 ) ( HOLDING ?auto_156291 ) ( CLEAR ?auto_156290 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_156288 ?auto_156293 ?auto_156292 ?auto_156290 ?auto_156291 )
      ( MAKE-3PILE ?auto_156285 ?auto_156286 ?auto_156287 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_156294 - BLOCK
      ?auto_156295 - BLOCK
      ?auto_156296 - BLOCK
    )
    :vars
    (
      ?auto_156297 - BLOCK
      ?auto_156300 - BLOCK
      ?auto_156298 - BLOCK
      ?auto_156302 - BLOCK
      ?auto_156301 - BLOCK
      ?auto_156299 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_156294 ?auto_156295 ) ) ( not ( = ?auto_156294 ?auto_156296 ) ) ( not ( = ?auto_156295 ?auto_156296 ) ) ( not ( = ?auto_156294 ?auto_156297 ) ) ( not ( = ?auto_156295 ?auto_156297 ) ) ( not ( = ?auto_156296 ?auto_156297 ) ) ( ON-TABLE ?auto_156300 ) ( ON ?auto_156298 ?auto_156300 ) ( ON ?auto_156302 ?auto_156298 ) ( ON ?auto_156301 ?auto_156302 ) ( not ( = ?auto_156300 ?auto_156298 ) ) ( not ( = ?auto_156300 ?auto_156302 ) ) ( not ( = ?auto_156300 ?auto_156301 ) ) ( not ( = ?auto_156300 ?auto_156297 ) ) ( not ( = ?auto_156300 ?auto_156296 ) ) ( not ( = ?auto_156300 ?auto_156295 ) ) ( not ( = ?auto_156298 ?auto_156302 ) ) ( not ( = ?auto_156298 ?auto_156301 ) ) ( not ( = ?auto_156298 ?auto_156297 ) ) ( not ( = ?auto_156298 ?auto_156296 ) ) ( not ( = ?auto_156298 ?auto_156295 ) ) ( not ( = ?auto_156302 ?auto_156301 ) ) ( not ( = ?auto_156302 ?auto_156297 ) ) ( not ( = ?auto_156302 ?auto_156296 ) ) ( not ( = ?auto_156302 ?auto_156295 ) ) ( not ( = ?auto_156301 ?auto_156297 ) ) ( not ( = ?auto_156301 ?auto_156296 ) ) ( not ( = ?auto_156301 ?auto_156295 ) ) ( not ( = ?auto_156294 ?auto_156300 ) ) ( not ( = ?auto_156294 ?auto_156298 ) ) ( not ( = ?auto_156294 ?auto_156302 ) ) ( not ( = ?auto_156294 ?auto_156301 ) ) ( ON ?auto_156294 ?auto_156299 ) ( not ( = ?auto_156294 ?auto_156299 ) ) ( not ( = ?auto_156295 ?auto_156299 ) ) ( not ( = ?auto_156296 ?auto_156299 ) ) ( not ( = ?auto_156297 ?auto_156299 ) ) ( not ( = ?auto_156300 ?auto_156299 ) ) ( not ( = ?auto_156298 ?auto_156299 ) ) ( not ( = ?auto_156302 ?auto_156299 ) ) ( not ( = ?auto_156301 ?auto_156299 ) ) ( ON ?auto_156295 ?auto_156294 ) ( ON-TABLE ?auto_156299 ) ( ON ?auto_156296 ?auto_156295 ) ( CLEAR ?auto_156301 ) ( ON ?auto_156297 ?auto_156296 ) ( CLEAR ?auto_156297 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_156299 ?auto_156294 ?auto_156295 ?auto_156296 )
      ( MAKE-3PILE ?auto_156294 ?auto_156295 ?auto_156296 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_156303 - BLOCK
      ?auto_156304 - BLOCK
      ?auto_156305 - BLOCK
    )
    :vars
    (
      ?auto_156310 - BLOCK
      ?auto_156309 - BLOCK
      ?auto_156307 - BLOCK
      ?auto_156308 - BLOCK
      ?auto_156311 - BLOCK
      ?auto_156306 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_156303 ?auto_156304 ) ) ( not ( = ?auto_156303 ?auto_156305 ) ) ( not ( = ?auto_156304 ?auto_156305 ) ) ( not ( = ?auto_156303 ?auto_156310 ) ) ( not ( = ?auto_156304 ?auto_156310 ) ) ( not ( = ?auto_156305 ?auto_156310 ) ) ( ON-TABLE ?auto_156309 ) ( ON ?auto_156307 ?auto_156309 ) ( ON ?auto_156308 ?auto_156307 ) ( not ( = ?auto_156309 ?auto_156307 ) ) ( not ( = ?auto_156309 ?auto_156308 ) ) ( not ( = ?auto_156309 ?auto_156311 ) ) ( not ( = ?auto_156309 ?auto_156310 ) ) ( not ( = ?auto_156309 ?auto_156305 ) ) ( not ( = ?auto_156309 ?auto_156304 ) ) ( not ( = ?auto_156307 ?auto_156308 ) ) ( not ( = ?auto_156307 ?auto_156311 ) ) ( not ( = ?auto_156307 ?auto_156310 ) ) ( not ( = ?auto_156307 ?auto_156305 ) ) ( not ( = ?auto_156307 ?auto_156304 ) ) ( not ( = ?auto_156308 ?auto_156311 ) ) ( not ( = ?auto_156308 ?auto_156310 ) ) ( not ( = ?auto_156308 ?auto_156305 ) ) ( not ( = ?auto_156308 ?auto_156304 ) ) ( not ( = ?auto_156311 ?auto_156310 ) ) ( not ( = ?auto_156311 ?auto_156305 ) ) ( not ( = ?auto_156311 ?auto_156304 ) ) ( not ( = ?auto_156303 ?auto_156309 ) ) ( not ( = ?auto_156303 ?auto_156307 ) ) ( not ( = ?auto_156303 ?auto_156308 ) ) ( not ( = ?auto_156303 ?auto_156311 ) ) ( ON ?auto_156303 ?auto_156306 ) ( not ( = ?auto_156303 ?auto_156306 ) ) ( not ( = ?auto_156304 ?auto_156306 ) ) ( not ( = ?auto_156305 ?auto_156306 ) ) ( not ( = ?auto_156310 ?auto_156306 ) ) ( not ( = ?auto_156309 ?auto_156306 ) ) ( not ( = ?auto_156307 ?auto_156306 ) ) ( not ( = ?auto_156308 ?auto_156306 ) ) ( not ( = ?auto_156311 ?auto_156306 ) ) ( ON ?auto_156304 ?auto_156303 ) ( ON-TABLE ?auto_156306 ) ( ON ?auto_156305 ?auto_156304 ) ( ON ?auto_156310 ?auto_156305 ) ( CLEAR ?auto_156310 ) ( HOLDING ?auto_156311 ) ( CLEAR ?auto_156308 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_156309 ?auto_156307 ?auto_156308 ?auto_156311 )
      ( MAKE-3PILE ?auto_156303 ?auto_156304 ?auto_156305 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_156312 - BLOCK
      ?auto_156313 - BLOCK
      ?auto_156314 - BLOCK
    )
    :vars
    (
      ?auto_156319 - BLOCK
      ?auto_156315 - BLOCK
      ?auto_156318 - BLOCK
      ?auto_156317 - BLOCK
      ?auto_156316 - BLOCK
      ?auto_156320 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_156312 ?auto_156313 ) ) ( not ( = ?auto_156312 ?auto_156314 ) ) ( not ( = ?auto_156313 ?auto_156314 ) ) ( not ( = ?auto_156312 ?auto_156319 ) ) ( not ( = ?auto_156313 ?auto_156319 ) ) ( not ( = ?auto_156314 ?auto_156319 ) ) ( ON-TABLE ?auto_156315 ) ( ON ?auto_156318 ?auto_156315 ) ( ON ?auto_156317 ?auto_156318 ) ( not ( = ?auto_156315 ?auto_156318 ) ) ( not ( = ?auto_156315 ?auto_156317 ) ) ( not ( = ?auto_156315 ?auto_156316 ) ) ( not ( = ?auto_156315 ?auto_156319 ) ) ( not ( = ?auto_156315 ?auto_156314 ) ) ( not ( = ?auto_156315 ?auto_156313 ) ) ( not ( = ?auto_156318 ?auto_156317 ) ) ( not ( = ?auto_156318 ?auto_156316 ) ) ( not ( = ?auto_156318 ?auto_156319 ) ) ( not ( = ?auto_156318 ?auto_156314 ) ) ( not ( = ?auto_156318 ?auto_156313 ) ) ( not ( = ?auto_156317 ?auto_156316 ) ) ( not ( = ?auto_156317 ?auto_156319 ) ) ( not ( = ?auto_156317 ?auto_156314 ) ) ( not ( = ?auto_156317 ?auto_156313 ) ) ( not ( = ?auto_156316 ?auto_156319 ) ) ( not ( = ?auto_156316 ?auto_156314 ) ) ( not ( = ?auto_156316 ?auto_156313 ) ) ( not ( = ?auto_156312 ?auto_156315 ) ) ( not ( = ?auto_156312 ?auto_156318 ) ) ( not ( = ?auto_156312 ?auto_156317 ) ) ( not ( = ?auto_156312 ?auto_156316 ) ) ( ON ?auto_156312 ?auto_156320 ) ( not ( = ?auto_156312 ?auto_156320 ) ) ( not ( = ?auto_156313 ?auto_156320 ) ) ( not ( = ?auto_156314 ?auto_156320 ) ) ( not ( = ?auto_156319 ?auto_156320 ) ) ( not ( = ?auto_156315 ?auto_156320 ) ) ( not ( = ?auto_156318 ?auto_156320 ) ) ( not ( = ?auto_156317 ?auto_156320 ) ) ( not ( = ?auto_156316 ?auto_156320 ) ) ( ON ?auto_156313 ?auto_156312 ) ( ON-TABLE ?auto_156320 ) ( ON ?auto_156314 ?auto_156313 ) ( ON ?auto_156319 ?auto_156314 ) ( CLEAR ?auto_156317 ) ( ON ?auto_156316 ?auto_156319 ) ( CLEAR ?auto_156316 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_156320 ?auto_156312 ?auto_156313 ?auto_156314 ?auto_156319 )
      ( MAKE-3PILE ?auto_156312 ?auto_156313 ?auto_156314 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_156321 - BLOCK
      ?auto_156322 - BLOCK
      ?auto_156323 - BLOCK
    )
    :vars
    (
      ?auto_156329 - BLOCK
      ?auto_156327 - BLOCK
      ?auto_156324 - BLOCK
      ?auto_156326 - BLOCK
      ?auto_156325 - BLOCK
      ?auto_156328 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_156321 ?auto_156322 ) ) ( not ( = ?auto_156321 ?auto_156323 ) ) ( not ( = ?auto_156322 ?auto_156323 ) ) ( not ( = ?auto_156321 ?auto_156329 ) ) ( not ( = ?auto_156322 ?auto_156329 ) ) ( not ( = ?auto_156323 ?auto_156329 ) ) ( ON-TABLE ?auto_156327 ) ( ON ?auto_156324 ?auto_156327 ) ( not ( = ?auto_156327 ?auto_156324 ) ) ( not ( = ?auto_156327 ?auto_156326 ) ) ( not ( = ?auto_156327 ?auto_156325 ) ) ( not ( = ?auto_156327 ?auto_156329 ) ) ( not ( = ?auto_156327 ?auto_156323 ) ) ( not ( = ?auto_156327 ?auto_156322 ) ) ( not ( = ?auto_156324 ?auto_156326 ) ) ( not ( = ?auto_156324 ?auto_156325 ) ) ( not ( = ?auto_156324 ?auto_156329 ) ) ( not ( = ?auto_156324 ?auto_156323 ) ) ( not ( = ?auto_156324 ?auto_156322 ) ) ( not ( = ?auto_156326 ?auto_156325 ) ) ( not ( = ?auto_156326 ?auto_156329 ) ) ( not ( = ?auto_156326 ?auto_156323 ) ) ( not ( = ?auto_156326 ?auto_156322 ) ) ( not ( = ?auto_156325 ?auto_156329 ) ) ( not ( = ?auto_156325 ?auto_156323 ) ) ( not ( = ?auto_156325 ?auto_156322 ) ) ( not ( = ?auto_156321 ?auto_156327 ) ) ( not ( = ?auto_156321 ?auto_156324 ) ) ( not ( = ?auto_156321 ?auto_156326 ) ) ( not ( = ?auto_156321 ?auto_156325 ) ) ( ON ?auto_156321 ?auto_156328 ) ( not ( = ?auto_156321 ?auto_156328 ) ) ( not ( = ?auto_156322 ?auto_156328 ) ) ( not ( = ?auto_156323 ?auto_156328 ) ) ( not ( = ?auto_156329 ?auto_156328 ) ) ( not ( = ?auto_156327 ?auto_156328 ) ) ( not ( = ?auto_156324 ?auto_156328 ) ) ( not ( = ?auto_156326 ?auto_156328 ) ) ( not ( = ?auto_156325 ?auto_156328 ) ) ( ON ?auto_156322 ?auto_156321 ) ( ON-TABLE ?auto_156328 ) ( ON ?auto_156323 ?auto_156322 ) ( ON ?auto_156329 ?auto_156323 ) ( ON ?auto_156325 ?auto_156329 ) ( CLEAR ?auto_156325 ) ( HOLDING ?auto_156326 ) ( CLEAR ?auto_156324 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_156327 ?auto_156324 ?auto_156326 )
      ( MAKE-3PILE ?auto_156321 ?auto_156322 ?auto_156323 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_156330 - BLOCK
      ?auto_156331 - BLOCK
      ?auto_156332 - BLOCK
    )
    :vars
    (
      ?auto_156335 - BLOCK
      ?auto_156338 - BLOCK
      ?auto_156334 - BLOCK
      ?auto_156333 - BLOCK
      ?auto_156337 - BLOCK
      ?auto_156336 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_156330 ?auto_156331 ) ) ( not ( = ?auto_156330 ?auto_156332 ) ) ( not ( = ?auto_156331 ?auto_156332 ) ) ( not ( = ?auto_156330 ?auto_156335 ) ) ( not ( = ?auto_156331 ?auto_156335 ) ) ( not ( = ?auto_156332 ?auto_156335 ) ) ( ON-TABLE ?auto_156338 ) ( ON ?auto_156334 ?auto_156338 ) ( not ( = ?auto_156338 ?auto_156334 ) ) ( not ( = ?auto_156338 ?auto_156333 ) ) ( not ( = ?auto_156338 ?auto_156337 ) ) ( not ( = ?auto_156338 ?auto_156335 ) ) ( not ( = ?auto_156338 ?auto_156332 ) ) ( not ( = ?auto_156338 ?auto_156331 ) ) ( not ( = ?auto_156334 ?auto_156333 ) ) ( not ( = ?auto_156334 ?auto_156337 ) ) ( not ( = ?auto_156334 ?auto_156335 ) ) ( not ( = ?auto_156334 ?auto_156332 ) ) ( not ( = ?auto_156334 ?auto_156331 ) ) ( not ( = ?auto_156333 ?auto_156337 ) ) ( not ( = ?auto_156333 ?auto_156335 ) ) ( not ( = ?auto_156333 ?auto_156332 ) ) ( not ( = ?auto_156333 ?auto_156331 ) ) ( not ( = ?auto_156337 ?auto_156335 ) ) ( not ( = ?auto_156337 ?auto_156332 ) ) ( not ( = ?auto_156337 ?auto_156331 ) ) ( not ( = ?auto_156330 ?auto_156338 ) ) ( not ( = ?auto_156330 ?auto_156334 ) ) ( not ( = ?auto_156330 ?auto_156333 ) ) ( not ( = ?auto_156330 ?auto_156337 ) ) ( ON ?auto_156330 ?auto_156336 ) ( not ( = ?auto_156330 ?auto_156336 ) ) ( not ( = ?auto_156331 ?auto_156336 ) ) ( not ( = ?auto_156332 ?auto_156336 ) ) ( not ( = ?auto_156335 ?auto_156336 ) ) ( not ( = ?auto_156338 ?auto_156336 ) ) ( not ( = ?auto_156334 ?auto_156336 ) ) ( not ( = ?auto_156333 ?auto_156336 ) ) ( not ( = ?auto_156337 ?auto_156336 ) ) ( ON ?auto_156331 ?auto_156330 ) ( ON-TABLE ?auto_156336 ) ( ON ?auto_156332 ?auto_156331 ) ( ON ?auto_156335 ?auto_156332 ) ( ON ?auto_156337 ?auto_156335 ) ( CLEAR ?auto_156334 ) ( ON ?auto_156333 ?auto_156337 ) ( CLEAR ?auto_156333 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_156336 ?auto_156330 ?auto_156331 ?auto_156332 ?auto_156335 ?auto_156337 )
      ( MAKE-3PILE ?auto_156330 ?auto_156331 ?auto_156332 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_156339 - BLOCK
      ?auto_156340 - BLOCK
      ?auto_156341 - BLOCK
    )
    :vars
    (
      ?auto_156342 - BLOCK
      ?auto_156345 - BLOCK
      ?auto_156347 - BLOCK
      ?auto_156346 - BLOCK
      ?auto_156343 - BLOCK
      ?auto_156344 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_156339 ?auto_156340 ) ) ( not ( = ?auto_156339 ?auto_156341 ) ) ( not ( = ?auto_156340 ?auto_156341 ) ) ( not ( = ?auto_156339 ?auto_156342 ) ) ( not ( = ?auto_156340 ?auto_156342 ) ) ( not ( = ?auto_156341 ?auto_156342 ) ) ( ON-TABLE ?auto_156345 ) ( not ( = ?auto_156345 ?auto_156347 ) ) ( not ( = ?auto_156345 ?auto_156346 ) ) ( not ( = ?auto_156345 ?auto_156343 ) ) ( not ( = ?auto_156345 ?auto_156342 ) ) ( not ( = ?auto_156345 ?auto_156341 ) ) ( not ( = ?auto_156345 ?auto_156340 ) ) ( not ( = ?auto_156347 ?auto_156346 ) ) ( not ( = ?auto_156347 ?auto_156343 ) ) ( not ( = ?auto_156347 ?auto_156342 ) ) ( not ( = ?auto_156347 ?auto_156341 ) ) ( not ( = ?auto_156347 ?auto_156340 ) ) ( not ( = ?auto_156346 ?auto_156343 ) ) ( not ( = ?auto_156346 ?auto_156342 ) ) ( not ( = ?auto_156346 ?auto_156341 ) ) ( not ( = ?auto_156346 ?auto_156340 ) ) ( not ( = ?auto_156343 ?auto_156342 ) ) ( not ( = ?auto_156343 ?auto_156341 ) ) ( not ( = ?auto_156343 ?auto_156340 ) ) ( not ( = ?auto_156339 ?auto_156345 ) ) ( not ( = ?auto_156339 ?auto_156347 ) ) ( not ( = ?auto_156339 ?auto_156346 ) ) ( not ( = ?auto_156339 ?auto_156343 ) ) ( ON ?auto_156339 ?auto_156344 ) ( not ( = ?auto_156339 ?auto_156344 ) ) ( not ( = ?auto_156340 ?auto_156344 ) ) ( not ( = ?auto_156341 ?auto_156344 ) ) ( not ( = ?auto_156342 ?auto_156344 ) ) ( not ( = ?auto_156345 ?auto_156344 ) ) ( not ( = ?auto_156347 ?auto_156344 ) ) ( not ( = ?auto_156346 ?auto_156344 ) ) ( not ( = ?auto_156343 ?auto_156344 ) ) ( ON ?auto_156340 ?auto_156339 ) ( ON-TABLE ?auto_156344 ) ( ON ?auto_156341 ?auto_156340 ) ( ON ?auto_156342 ?auto_156341 ) ( ON ?auto_156343 ?auto_156342 ) ( ON ?auto_156346 ?auto_156343 ) ( CLEAR ?auto_156346 ) ( HOLDING ?auto_156347 ) ( CLEAR ?auto_156345 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_156345 ?auto_156347 )
      ( MAKE-3PILE ?auto_156339 ?auto_156340 ?auto_156341 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_156348 - BLOCK
      ?auto_156349 - BLOCK
      ?auto_156350 - BLOCK
    )
    :vars
    (
      ?auto_156355 - BLOCK
      ?auto_156356 - BLOCK
      ?auto_156354 - BLOCK
      ?auto_156351 - BLOCK
      ?auto_156353 - BLOCK
      ?auto_156352 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_156348 ?auto_156349 ) ) ( not ( = ?auto_156348 ?auto_156350 ) ) ( not ( = ?auto_156349 ?auto_156350 ) ) ( not ( = ?auto_156348 ?auto_156355 ) ) ( not ( = ?auto_156349 ?auto_156355 ) ) ( not ( = ?auto_156350 ?auto_156355 ) ) ( ON-TABLE ?auto_156356 ) ( not ( = ?auto_156356 ?auto_156354 ) ) ( not ( = ?auto_156356 ?auto_156351 ) ) ( not ( = ?auto_156356 ?auto_156353 ) ) ( not ( = ?auto_156356 ?auto_156355 ) ) ( not ( = ?auto_156356 ?auto_156350 ) ) ( not ( = ?auto_156356 ?auto_156349 ) ) ( not ( = ?auto_156354 ?auto_156351 ) ) ( not ( = ?auto_156354 ?auto_156353 ) ) ( not ( = ?auto_156354 ?auto_156355 ) ) ( not ( = ?auto_156354 ?auto_156350 ) ) ( not ( = ?auto_156354 ?auto_156349 ) ) ( not ( = ?auto_156351 ?auto_156353 ) ) ( not ( = ?auto_156351 ?auto_156355 ) ) ( not ( = ?auto_156351 ?auto_156350 ) ) ( not ( = ?auto_156351 ?auto_156349 ) ) ( not ( = ?auto_156353 ?auto_156355 ) ) ( not ( = ?auto_156353 ?auto_156350 ) ) ( not ( = ?auto_156353 ?auto_156349 ) ) ( not ( = ?auto_156348 ?auto_156356 ) ) ( not ( = ?auto_156348 ?auto_156354 ) ) ( not ( = ?auto_156348 ?auto_156351 ) ) ( not ( = ?auto_156348 ?auto_156353 ) ) ( ON ?auto_156348 ?auto_156352 ) ( not ( = ?auto_156348 ?auto_156352 ) ) ( not ( = ?auto_156349 ?auto_156352 ) ) ( not ( = ?auto_156350 ?auto_156352 ) ) ( not ( = ?auto_156355 ?auto_156352 ) ) ( not ( = ?auto_156356 ?auto_156352 ) ) ( not ( = ?auto_156354 ?auto_156352 ) ) ( not ( = ?auto_156351 ?auto_156352 ) ) ( not ( = ?auto_156353 ?auto_156352 ) ) ( ON ?auto_156349 ?auto_156348 ) ( ON-TABLE ?auto_156352 ) ( ON ?auto_156350 ?auto_156349 ) ( ON ?auto_156355 ?auto_156350 ) ( ON ?auto_156353 ?auto_156355 ) ( ON ?auto_156351 ?auto_156353 ) ( CLEAR ?auto_156356 ) ( ON ?auto_156354 ?auto_156351 ) ( CLEAR ?auto_156354 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_156352 ?auto_156348 ?auto_156349 ?auto_156350 ?auto_156355 ?auto_156353 ?auto_156351 )
      ( MAKE-3PILE ?auto_156348 ?auto_156349 ?auto_156350 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_156357 - BLOCK
      ?auto_156358 - BLOCK
      ?auto_156359 - BLOCK
    )
    :vars
    (
      ?auto_156360 - BLOCK
      ?auto_156364 - BLOCK
      ?auto_156361 - BLOCK
      ?auto_156365 - BLOCK
      ?auto_156362 - BLOCK
      ?auto_156363 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_156357 ?auto_156358 ) ) ( not ( = ?auto_156357 ?auto_156359 ) ) ( not ( = ?auto_156358 ?auto_156359 ) ) ( not ( = ?auto_156357 ?auto_156360 ) ) ( not ( = ?auto_156358 ?auto_156360 ) ) ( not ( = ?auto_156359 ?auto_156360 ) ) ( not ( = ?auto_156364 ?auto_156361 ) ) ( not ( = ?auto_156364 ?auto_156365 ) ) ( not ( = ?auto_156364 ?auto_156362 ) ) ( not ( = ?auto_156364 ?auto_156360 ) ) ( not ( = ?auto_156364 ?auto_156359 ) ) ( not ( = ?auto_156364 ?auto_156358 ) ) ( not ( = ?auto_156361 ?auto_156365 ) ) ( not ( = ?auto_156361 ?auto_156362 ) ) ( not ( = ?auto_156361 ?auto_156360 ) ) ( not ( = ?auto_156361 ?auto_156359 ) ) ( not ( = ?auto_156361 ?auto_156358 ) ) ( not ( = ?auto_156365 ?auto_156362 ) ) ( not ( = ?auto_156365 ?auto_156360 ) ) ( not ( = ?auto_156365 ?auto_156359 ) ) ( not ( = ?auto_156365 ?auto_156358 ) ) ( not ( = ?auto_156362 ?auto_156360 ) ) ( not ( = ?auto_156362 ?auto_156359 ) ) ( not ( = ?auto_156362 ?auto_156358 ) ) ( not ( = ?auto_156357 ?auto_156364 ) ) ( not ( = ?auto_156357 ?auto_156361 ) ) ( not ( = ?auto_156357 ?auto_156365 ) ) ( not ( = ?auto_156357 ?auto_156362 ) ) ( ON ?auto_156357 ?auto_156363 ) ( not ( = ?auto_156357 ?auto_156363 ) ) ( not ( = ?auto_156358 ?auto_156363 ) ) ( not ( = ?auto_156359 ?auto_156363 ) ) ( not ( = ?auto_156360 ?auto_156363 ) ) ( not ( = ?auto_156364 ?auto_156363 ) ) ( not ( = ?auto_156361 ?auto_156363 ) ) ( not ( = ?auto_156365 ?auto_156363 ) ) ( not ( = ?auto_156362 ?auto_156363 ) ) ( ON ?auto_156358 ?auto_156357 ) ( ON-TABLE ?auto_156363 ) ( ON ?auto_156359 ?auto_156358 ) ( ON ?auto_156360 ?auto_156359 ) ( ON ?auto_156362 ?auto_156360 ) ( ON ?auto_156365 ?auto_156362 ) ( ON ?auto_156361 ?auto_156365 ) ( CLEAR ?auto_156361 ) ( HOLDING ?auto_156364 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_156364 )
      ( MAKE-3PILE ?auto_156357 ?auto_156358 ?auto_156359 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_156366 - BLOCK
      ?auto_156367 - BLOCK
      ?auto_156368 - BLOCK
    )
    :vars
    (
      ?auto_156369 - BLOCK
      ?auto_156374 - BLOCK
      ?auto_156371 - BLOCK
      ?auto_156373 - BLOCK
      ?auto_156372 - BLOCK
      ?auto_156370 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_156366 ?auto_156367 ) ) ( not ( = ?auto_156366 ?auto_156368 ) ) ( not ( = ?auto_156367 ?auto_156368 ) ) ( not ( = ?auto_156366 ?auto_156369 ) ) ( not ( = ?auto_156367 ?auto_156369 ) ) ( not ( = ?auto_156368 ?auto_156369 ) ) ( not ( = ?auto_156374 ?auto_156371 ) ) ( not ( = ?auto_156374 ?auto_156373 ) ) ( not ( = ?auto_156374 ?auto_156372 ) ) ( not ( = ?auto_156374 ?auto_156369 ) ) ( not ( = ?auto_156374 ?auto_156368 ) ) ( not ( = ?auto_156374 ?auto_156367 ) ) ( not ( = ?auto_156371 ?auto_156373 ) ) ( not ( = ?auto_156371 ?auto_156372 ) ) ( not ( = ?auto_156371 ?auto_156369 ) ) ( not ( = ?auto_156371 ?auto_156368 ) ) ( not ( = ?auto_156371 ?auto_156367 ) ) ( not ( = ?auto_156373 ?auto_156372 ) ) ( not ( = ?auto_156373 ?auto_156369 ) ) ( not ( = ?auto_156373 ?auto_156368 ) ) ( not ( = ?auto_156373 ?auto_156367 ) ) ( not ( = ?auto_156372 ?auto_156369 ) ) ( not ( = ?auto_156372 ?auto_156368 ) ) ( not ( = ?auto_156372 ?auto_156367 ) ) ( not ( = ?auto_156366 ?auto_156374 ) ) ( not ( = ?auto_156366 ?auto_156371 ) ) ( not ( = ?auto_156366 ?auto_156373 ) ) ( not ( = ?auto_156366 ?auto_156372 ) ) ( ON ?auto_156366 ?auto_156370 ) ( not ( = ?auto_156366 ?auto_156370 ) ) ( not ( = ?auto_156367 ?auto_156370 ) ) ( not ( = ?auto_156368 ?auto_156370 ) ) ( not ( = ?auto_156369 ?auto_156370 ) ) ( not ( = ?auto_156374 ?auto_156370 ) ) ( not ( = ?auto_156371 ?auto_156370 ) ) ( not ( = ?auto_156373 ?auto_156370 ) ) ( not ( = ?auto_156372 ?auto_156370 ) ) ( ON ?auto_156367 ?auto_156366 ) ( ON-TABLE ?auto_156370 ) ( ON ?auto_156368 ?auto_156367 ) ( ON ?auto_156369 ?auto_156368 ) ( ON ?auto_156372 ?auto_156369 ) ( ON ?auto_156373 ?auto_156372 ) ( ON ?auto_156371 ?auto_156373 ) ( ON ?auto_156374 ?auto_156371 ) ( CLEAR ?auto_156374 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_156370 ?auto_156366 ?auto_156367 ?auto_156368 ?auto_156369 ?auto_156372 ?auto_156373 ?auto_156371 )
      ( MAKE-3PILE ?auto_156366 ?auto_156367 ?auto_156368 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_156398 - BLOCK
      ?auto_156399 - BLOCK
      ?auto_156400 - BLOCK
      ?auto_156401 - BLOCK
    )
    :vars
    (
      ?auto_156402 - BLOCK
      ?auto_156403 - BLOCK
      ?auto_156404 - BLOCK
      ?auto_156405 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_156402 ?auto_156401 ) ( ON-TABLE ?auto_156398 ) ( ON ?auto_156399 ?auto_156398 ) ( ON ?auto_156400 ?auto_156399 ) ( ON ?auto_156401 ?auto_156400 ) ( not ( = ?auto_156398 ?auto_156399 ) ) ( not ( = ?auto_156398 ?auto_156400 ) ) ( not ( = ?auto_156398 ?auto_156401 ) ) ( not ( = ?auto_156398 ?auto_156402 ) ) ( not ( = ?auto_156399 ?auto_156400 ) ) ( not ( = ?auto_156399 ?auto_156401 ) ) ( not ( = ?auto_156399 ?auto_156402 ) ) ( not ( = ?auto_156400 ?auto_156401 ) ) ( not ( = ?auto_156400 ?auto_156402 ) ) ( not ( = ?auto_156401 ?auto_156402 ) ) ( not ( = ?auto_156398 ?auto_156403 ) ) ( not ( = ?auto_156398 ?auto_156404 ) ) ( not ( = ?auto_156399 ?auto_156403 ) ) ( not ( = ?auto_156399 ?auto_156404 ) ) ( not ( = ?auto_156400 ?auto_156403 ) ) ( not ( = ?auto_156400 ?auto_156404 ) ) ( not ( = ?auto_156401 ?auto_156403 ) ) ( not ( = ?auto_156401 ?auto_156404 ) ) ( not ( = ?auto_156402 ?auto_156403 ) ) ( not ( = ?auto_156402 ?auto_156404 ) ) ( not ( = ?auto_156403 ?auto_156404 ) ) ( ON ?auto_156403 ?auto_156402 ) ( CLEAR ?auto_156403 ) ( HOLDING ?auto_156404 ) ( CLEAR ?auto_156405 ) ( ON-TABLE ?auto_156405 ) ( not ( = ?auto_156405 ?auto_156404 ) ) ( not ( = ?auto_156398 ?auto_156405 ) ) ( not ( = ?auto_156399 ?auto_156405 ) ) ( not ( = ?auto_156400 ?auto_156405 ) ) ( not ( = ?auto_156401 ?auto_156405 ) ) ( not ( = ?auto_156402 ?auto_156405 ) ) ( not ( = ?auto_156403 ?auto_156405 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_156405 ?auto_156404 )
      ( MAKE-4PILE ?auto_156398 ?auto_156399 ?auto_156400 ?auto_156401 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_156406 - BLOCK
      ?auto_156407 - BLOCK
      ?auto_156408 - BLOCK
      ?auto_156409 - BLOCK
    )
    :vars
    (
      ?auto_156411 - BLOCK
      ?auto_156410 - BLOCK
      ?auto_156412 - BLOCK
      ?auto_156413 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_156411 ?auto_156409 ) ( ON-TABLE ?auto_156406 ) ( ON ?auto_156407 ?auto_156406 ) ( ON ?auto_156408 ?auto_156407 ) ( ON ?auto_156409 ?auto_156408 ) ( not ( = ?auto_156406 ?auto_156407 ) ) ( not ( = ?auto_156406 ?auto_156408 ) ) ( not ( = ?auto_156406 ?auto_156409 ) ) ( not ( = ?auto_156406 ?auto_156411 ) ) ( not ( = ?auto_156407 ?auto_156408 ) ) ( not ( = ?auto_156407 ?auto_156409 ) ) ( not ( = ?auto_156407 ?auto_156411 ) ) ( not ( = ?auto_156408 ?auto_156409 ) ) ( not ( = ?auto_156408 ?auto_156411 ) ) ( not ( = ?auto_156409 ?auto_156411 ) ) ( not ( = ?auto_156406 ?auto_156410 ) ) ( not ( = ?auto_156406 ?auto_156412 ) ) ( not ( = ?auto_156407 ?auto_156410 ) ) ( not ( = ?auto_156407 ?auto_156412 ) ) ( not ( = ?auto_156408 ?auto_156410 ) ) ( not ( = ?auto_156408 ?auto_156412 ) ) ( not ( = ?auto_156409 ?auto_156410 ) ) ( not ( = ?auto_156409 ?auto_156412 ) ) ( not ( = ?auto_156411 ?auto_156410 ) ) ( not ( = ?auto_156411 ?auto_156412 ) ) ( not ( = ?auto_156410 ?auto_156412 ) ) ( ON ?auto_156410 ?auto_156411 ) ( CLEAR ?auto_156413 ) ( ON-TABLE ?auto_156413 ) ( not ( = ?auto_156413 ?auto_156412 ) ) ( not ( = ?auto_156406 ?auto_156413 ) ) ( not ( = ?auto_156407 ?auto_156413 ) ) ( not ( = ?auto_156408 ?auto_156413 ) ) ( not ( = ?auto_156409 ?auto_156413 ) ) ( not ( = ?auto_156411 ?auto_156413 ) ) ( not ( = ?auto_156410 ?auto_156413 ) ) ( ON ?auto_156412 ?auto_156410 ) ( CLEAR ?auto_156412 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_156406 ?auto_156407 ?auto_156408 ?auto_156409 ?auto_156411 ?auto_156410 )
      ( MAKE-4PILE ?auto_156406 ?auto_156407 ?auto_156408 ?auto_156409 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_156414 - BLOCK
      ?auto_156415 - BLOCK
      ?auto_156416 - BLOCK
      ?auto_156417 - BLOCK
    )
    :vars
    (
      ?auto_156421 - BLOCK
      ?auto_156418 - BLOCK
      ?auto_156420 - BLOCK
      ?auto_156419 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_156421 ?auto_156417 ) ( ON-TABLE ?auto_156414 ) ( ON ?auto_156415 ?auto_156414 ) ( ON ?auto_156416 ?auto_156415 ) ( ON ?auto_156417 ?auto_156416 ) ( not ( = ?auto_156414 ?auto_156415 ) ) ( not ( = ?auto_156414 ?auto_156416 ) ) ( not ( = ?auto_156414 ?auto_156417 ) ) ( not ( = ?auto_156414 ?auto_156421 ) ) ( not ( = ?auto_156415 ?auto_156416 ) ) ( not ( = ?auto_156415 ?auto_156417 ) ) ( not ( = ?auto_156415 ?auto_156421 ) ) ( not ( = ?auto_156416 ?auto_156417 ) ) ( not ( = ?auto_156416 ?auto_156421 ) ) ( not ( = ?auto_156417 ?auto_156421 ) ) ( not ( = ?auto_156414 ?auto_156418 ) ) ( not ( = ?auto_156414 ?auto_156420 ) ) ( not ( = ?auto_156415 ?auto_156418 ) ) ( not ( = ?auto_156415 ?auto_156420 ) ) ( not ( = ?auto_156416 ?auto_156418 ) ) ( not ( = ?auto_156416 ?auto_156420 ) ) ( not ( = ?auto_156417 ?auto_156418 ) ) ( not ( = ?auto_156417 ?auto_156420 ) ) ( not ( = ?auto_156421 ?auto_156418 ) ) ( not ( = ?auto_156421 ?auto_156420 ) ) ( not ( = ?auto_156418 ?auto_156420 ) ) ( ON ?auto_156418 ?auto_156421 ) ( not ( = ?auto_156419 ?auto_156420 ) ) ( not ( = ?auto_156414 ?auto_156419 ) ) ( not ( = ?auto_156415 ?auto_156419 ) ) ( not ( = ?auto_156416 ?auto_156419 ) ) ( not ( = ?auto_156417 ?auto_156419 ) ) ( not ( = ?auto_156421 ?auto_156419 ) ) ( not ( = ?auto_156418 ?auto_156419 ) ) ( ON ?auto_156420 ?auto_156418 ) ( CLEAR ?auto_156420 ) ( HOLDING ?auto_156419 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_156419 )
      ( MAKE-4PILE ?auto_156414 ?auto_156415 ?auto_156416 ?auto_156417 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_156434 - BLOCK
      ?auto_156435 - BLOCK
      ?auto_156436 - BLOCK
      ?auto_156437 - BLOCK
    )
    :vars
    (
      ?auto_156440 - BLOCK
      ?auto_156439 - BLOCK
      ?auto_156441 - BLOCK
      ?auto_156438 - BLOCK
      ?auto_156442 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_156440 ?auto_156437 ) ( ON-TABLE ?auto_156434 ) ( ON ?auto_156435 ?auto_156434 ) ( ON ?auto_156436 ?auto_156435 ) ( ON ?auto_156437 ?auto_156436 ) ( not ( = ?auto_156434 ?auto_156435 ) ) ( not ( = ?auto_156434 ?auto_156436 ) ) ( not ( = ?auto_156434 ?auto_156437 ) ) ( not ( = ?auto_156434 ?auto_156440 ) ) ( not ( = ?auto_156435 ?auto_156436 ) ) ( not ( = ?auto_156435 ?auto_156437 ) ) ( not ( = ?auto_156435 ?auto_156440 ) ) ( not ( = ?auto_156436 ?auto_156437 ) ) ( not ( = ?auto_156436 ?auto_156440 ) ) ( not ( = ?auto_156437 ?auto_156440 ) ) ( not ( = ?auto_156434 ?auto_156439 ) ) ( not ( = ?auto_156434 ?auto_156441 ) ) ( not ( = ?auto_156435 ?auto_156439 ) ) ( not ( = ?auto_156435 ?auto_156441 ) ) ( not ( = ?auto_156436 ?auto_156439 ) ) ( not ( = ?auto_156436 ?auto_156441 ) ) ( not ( = ?auto_156437 ?auto_156439 ) ) ( not ( = ?auto_156437 ?auto_156441 ) ) ( not ( = ?auto_156440 ?auto_156439 ) ) ( not ( = ?auto_156440 ?auto_156441 ) ) ( not ( = ?auto_156439 ?auto_156441 ) ) ( ON ?auto_156439 ?auto_156440 ) ( not ( = ?auto_156438 ?auto_156441 ) ) ( not ( = ?auto_156434 ?auto_156438 ) ) ( not ( = ?auto_156435 ?auto_156438 ) ) ( not ( = ?auto_156436 ?auto_156438 ) ) ( not ( = ?auto_156437 ?auto_156438 ) ) ( not ( = ?auto_156440 ?auto_156438 ) ) ( not ( = ?auto_156439 ?auto_156438 ) ) ( ON ?auto_156441 ?auto_156439 ) ( CLEAR ?auto_156441 ) ( ON ?auto_156438 ?auto_156442 ) ( CLEAR ?auto_156438 ) ( HAND-EMPTY ) ( not ( = ?auto_156434 ?auto_156442 ) ) ( not ( = ?auto_156435 ?auto_156442 ) ) ( not ( = ?auto_156436 ?auto_156442 ) ) ( not ( = ?auto_156437 ?auto_156442 ) ) ( not ( = ?auto_156440 ?auto_156442 ) ) ( not ( = ?auto_156439 ?auto_156442 ) ) ( not ( = ?auto_156441 ?auto_156442 ) ) ( not ( = ?auto_156438 ?auto_156442 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_156438 ?auto_156442 )
      ( MAKE-4PILE ?auto_156434 ?auto_156435 ?auto_156436 ?auto_156437 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_156443 - BLOCK
      ?auto_156444 - BLOCK
      ?auto_156445 - BLOCK
      ?auto_156446 - BLOCK
    )
    :vars
    (
      ?auto_156448 - BLOCK
      ?auto_156451 - BLOCK
      ?auto_156449 - BLOCK
      ?auto_156447 - BLOCK
      ?auto_156450 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_156448 ?auto_156446 ) ( ON-TABLE ?auto_156443 ) ( ON ?auto_156444 ?auto_156443 ) ( ON ?auto_156445 ?auto_156444 ) ( ON ?auto_156446 ?auto_156445 ) ( not ( = ?auto_156443 ?auto_156444 ) ) ( not ( = ?auto_156443 ?auto_156445 ) ) ( not ( = ?auto_156443 ?auto_156446 ) ) ( not ( = ?auto_156443 ?auto_156448 ) ) ( not ( = ?auto_156444 ?auto_156445 ) ) ( not ( = ?auto_156444 ?auto_156446 ) ) ( not ( = ?auto_156444 ?auto_156448 ) ) ( not ( = ?auto_156445 ?auto_156446 ) ) ( not ( = ?auto_156445 ?auto_156448 ) ) ( not ( = ?auto_156446 ?auto_156448 ) ) ( not ( = ?auto_156443 ?auto_156451 ) ) ( not ( = ?auto_156443 ?auto_156449 ) ) ( not ( = ?auto_156444 ?auto_156451 ) ) ( not ( = ?auto_156444 ?auto_156449 ) ) ( not ( = ?auto_156445 ?auto_156451 ) ) ( not ( = ?auto_156445 ?auto_156449 ) ) ( not ( = ?auto_156446 ?auto_156451 ) ) ( not ( = ?auto_156446 ?auto_156449 ) ) ( not ( = ?auto_156448 ?auto_156451 ) ) ( not ( = ?auto_156448 ?auto_156449 ) ) ( not ( = ?auto_156451 ?auto_156449 ) ) ( ON ?auto_156451 ?auto_156448 ) ( not ( = ?auto_156447 ?auto_156449 ) ) ( not ( = ?auto_156443 ?auto_156447 ) ) ( not ( = ?auto_156444 ?auto_156447 ) ) ( not ( = ?auto_156445 ?auto_156447 ) ) ( not ( = ?auto_156446 ?auto_156447 ) ) ( not ( = ?auto_156448 ?auto_156447 ) ) ( not ( = ?auto_156451 ?auto_156447 ) ) ( ON ?auto_156447 ?auto_156450 ) ( CLEAR ?auto_156447 ) ( not ( = ?auto_156443 ?auto_156450 ) ) ( not ( = ?auto_156444 ?auto_156450 ) ) ( not ( = ?auto_156445 ?auto_156450 ) ) ( not ( = ?auto_156446 ?auto_156450 ) ) ( not ( = ?auto_156448 ?auto_156450 ) ) ( not ( = ?auto_156451 ?auto_156450 ) ) ( not ( = ?auto_156449 ?auto_156450 ) ) ( not ( = ?auto_156447 ?auto_156450 ) ) ( HOLDING ?auto_156449 ) ( CLEAR ?auto_156451 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_156443 ?auto_156444 ?auto_156445 ?auto_156446 ?auto_156448 ?auto_156451 ?auto_156449 )
      ( MAKE-4PILE ?auto_156443 ?auto_156444 ?auto_156445 ?auto_156446 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_156525 - BLOCK
      ?auto_156526 - BLOCK
      ?auto_156527 - BLOCK
      ?auto_156528 - BLOCK
    )
    :vars
    (
      ?auto_156529 - BLOCK
      ?auto_156531 - BLOCK
      ?auto_156532 - BLOCK
      ?auto_156530 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_156525 ) ( ON ?auto_156526 ?auto_156525 ) ( not ( = ?auto_156525 ?auto_156526 ) ) ( not ( = ?auto_156525 ?auto_156527 ) ) ( not ( = ?auto_156525 ?auto_156528 ) ) ( not ( = ?auto_156526 ?auto_156527 ) ) ( not ( = ?auto_156526 ?auto_156528 ) ) ( not ( = ?auto_156527 ?auto_156528 ) ) ( ON ?auto_156528 ?auto_156529 ) ( not ( = ?auto_156525 ?auto_156529 ) ) ( not ( = ?auto_156526 ?auto_156529 ) ) ( not ( = ?auto_156527 ?auto_156529 ) ) ( not ( = ?auto_156528 ?auto_156529 ) ) ( CLEAR ?auto_156526 ) ( ON ?auto_156527 ?auto_156528 ) ( CLEAR ?auto_156527 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_156531 ) ( ON ?auto_156532 ?auto_156531 ) ( ON ?auto_156530 ?auto_156532 ) ( ON ?auto_156529 ?auto_156530 ) ( not ( = ?auto_156531 ?auto_156532 ) ) ( not ( = ?auto_156531 ?auto_156530 ) ) ( not ( = ?auto_156531 ?auto_156529 ) ) ( not ( = ?auto_156531 ?auto_156528 ) ) ( not ( = ?auto_156531 ?auto_156527 ) ) ( not ( = ?auto_156532 ?auto_156530 ) ) ( not ( = ?auto_156532 ?auto_156529 ) ) ( not ( = ?auto_156532 ?auto_156528 ) ) ( not ( = ?auto_156532 ?auto_156527 ) ) ( not ( = ?auto_156530 ?auto_156529 ) ) ( not ( = ?auto_156530 ?auto_156528 ) ) ( not ( = ?auto_156530 ?auto_156527 ) ) ( not ( = ?auto_156525 ?auto_156531 ) ) ( not ( = ?auto_156525 ?auto_156532 ) ) ( not ( = ?auto_156525 ?auto_156530 ) ) ( not ( = ?auto_156526 ?auto_156531 ) ) ( not ( = ?auto_156526 ?auto_156532 ) ) ( not ( = ?auto_156526 ?auto_156530 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_156531 ?auto_156532 ?auto_156530 ?auto_156529 ?auto_156528 )
      ( MAKE-4PILE ?auto_156525 ?auto_156526 ?auto_156527 ?auto_156528 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_156533 - BLOCK
      ?auto_156534 - BLOCK
      ?auto_156535 - BLOCK
      ?auto_156536 - BLOCK
    )
    :vars
    (
      ?auto_156537 - BLOCK
      ?auto_156540 - BLOCK
      ?auto_156538 - BLOCK
      ?auto_156539 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_156533 ) ( not ( = ?auto_156533 ?auto_156534 ) ) ( not ( = ?auto_156533 ?auto_156535 ) ) ( not ( = ?auto_156533 ?auto_156536 ) ) ( not ( = ?auto_156534 ?auto_156535 ) ) ( not ( = ?auto_156534 ?auto_156536 ) ) ( not ( = ?auto_156535 ?auto_156536 ) ) ( ON ?auto_156536 ?auto_156537 ) ( not ( = ?auto_156533 ?auto_156537 ) ) ( not ( = ?auto_156534 ?auto_156537 ) ) ( not ( = ?auto_156535 ?auto_156537 ) ) ( not ( = ?auto_156536 ?auto_156537 ) ) ( ON ?auto_156535 ?auto_156536 ) ( CLEAR ?auto_156535 ) ( ON-TABLE ?auto_156540 ) ( ON ?auto_156538 ?auto_156540 ) ( ON ?auto_156539 ?auto_156538 ) ( ON ?auto_156537 ?auto_156539 ) ( not ( = ?auto_156540 ?auto_156538 ) ) ( not ( = ?auto_156540 ?auto_156539 ) ) ( not ( = ?auto_156540 ?auto_156537 ) ) ( not ( = ?auto_156540 ?auto_156536 ) ) ( not ( = ?auto_156540 ?auto_156535 ) ) ( not ( = ?auto_156538 ?auto_156539 ) ) ( not ( = ?auto_156538 ?auto_156537 ) ) ( not ( = ?auto_156538 ?auto_156536 ) ) ( not ( = ?auto_156538 ?auto_156535 ) ) ( not ( = ?auto_156539 ?auto_156537 ) ) ( not ( = ?auto_156539 ?auto_156536 ) ) ( not ( = ?auto_156539 ?auto_156535 ) ) ( not ( = ?auto_156533 ?auto_156540 ) ) ( not ( = ?auto_156533 ?auto_156538 ) ) ( not ( = ?auto_156533 ?auto_156539 ) ) ( not ( = ?auto_156534 ?auto_156540 ) ) ( not ( = ?auto_156534 ?auto_156538 ) ) ( not ( = ?auto_156534 ?auto_156539 ) ) ( HOLDING ?auto_156534 ) ( CLEAR ?auto_156533 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_156533 ?auto_156534 )
      ( MAKE-4PILE ?auto_156533 ?auto_156534 ?auto_156535 ?auto_156536 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_156541 - BLOCK
      ?auto_156542 - BLOCK
      ?auto_156543 - BLOCK
      ?auto_156544 - BLOCK
    )
    :vars
    (
      ?auto_156547 - BLOCK
      ?auto_156548 - BLOCK
      ?auto_156546 - BLOCK
      ?auto_156545 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_156541 ) ( not ( = ?auto_156541 ?auto_156542 ) ) ( not ( = ?auto_156541 ?auto_156543 ) ) ( not ( = ?auto_156541 ?auto_156544 ) ) ( not ( = ?auto_156542 ?auto_156543 ) ) ( not ( = ?auto_156542 ?auto_156544 ) ) ( not ( = ?auto_156543 ?auto_156544 ) ) ( ON ?auto_156544 ?auto_156547 ) ( not ( = ?auto_156541 ?auto_156547 ) ) ( not ( = ?auto_156542 ?auto_156547 ) ) ( not ( = ?auto_156543 ?auto_156547 ) ) ( not ( = ?auto_156544 ?auto_156547 ) ) ( ON ?auto_156543 ?auto_156544 ) ( ON-TABLE ?auto_156548 ) ( ON ?auto_156546 ?auto_156548 ) ( ON ?auto_156545 ?auto_156546 ) ( ON ?auto_156547 ?auto_156545 ) ( not ( = ?auto_156548 ?auto_156546 ) ) ( not ( = ?auto_156548 ?auto_156545 ) ) ( not ( = ?auto_156548 ?auto_156547 ) ) ( not ( = ?auto_156548 ?auto_156544 ) ) ( not ( = ?auto_156548 ?auto_156543 ) ) ( not ( = ?auto_156546 ?auto_156545 ) ) ( not ( = ?auto_156546 ?auto_156547 ) ) ( not ( = ?auto_156546 ?auto_156544 ) ) ( not ( = ?auto_156546 ?auto_156543 ) ) ( not ( = ?auto_156545 ?auto_156547 ) ) ( not ( = ?auto_156545 ?auto_156544 ) ) ( not ( = ?auto_156545 ?auto_156543 ) ) ( not ( = ?auto_156541 ?auto_156548 ) ) ( not ( = ?auto_156541 ?auto_156546 ) ) ( not ( = ?auto_156541 ?auto_156545 ) ) ( not ( = ?auto_156542 ?auto_156548 ) ) ( not ( = ?auto_156542 ?auto_156546 ) ) ( not ( = ?auto_156542 ?auto_156545 ) ) ( CLEAR ?auto_156541 ) ( ON ?auto_156542 ?auto_156543 ) ( CLEAR ?auto_156542 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_156548 ?auto_156546 ?auto_156545 ?auto_156547 ?auto_156544 ?auto_156543 )
      ( MAKE-4PILE ?auto_156541 ?auto_156542 ?auto_156543 ?auto_156544 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_156549 - BLOCK
      ?auto_156550 - BLOCK
      ?auto_156551 - BLOCK
      ?auto_156552 - BLOCK
    )
    :vars
    (
      ?auto_156553 - BLOCK
      ?auto_156554 - BLOCK
      ?auto_156555 - BLOCK
      ?auto_156556 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_156549 ?auto_156550 ) ) ( not ( = ?auto_156549 ?auto_156551 ) ) ( not ( = ?auto_156549 ?auto_156552 ) ) ( not ( = ?auto_156550 ?auto_156551 ) ) ( not ( = ?auto_156550 ?auto_156552 ) ) ( not ( = ?auto_156551 ?auto_156552 ) ) ( ON ?auto_156552 ?auto_156553 ) ( not ( = ?auto_156549 ?auto_156553 ) ) ( not ( = ?auto_156550 ?auto_156553 ) ) ( not ( = ?auto_156551 ?auto_156553 ) ) ( not ( = ?auto_156552 ?auto_156553 ) ) ( ON ?auto_156551 ?auto_156552 ) ( ON-TABLE ?auto_156554 ) ( ON ?auto_156555 ?auto_156554 ) ( ON ?auto_156556 ?auto_156555 ) ( ON ?auto_156553 ?auto_156556 ) ( not ( = ?auto_156554 ?auto_156555 ) ) ( not ( = ?auto_156554 ?auto_156556 ) ) ( not ( = ?auto_156554 ?auto_156553 ) ) ( not ( = ?auto_156554 ?auto_156552 ) ) ( not ( = ?auto_156554 ?auto_156551 ) ) ( not ( = ?auto_156555 ?auto_156556 ) ) ( not ( = ?auto_156555 ?auto_156553 ) ) ( not ( = ?auto_156555 ?auto_156552 ) ) ( not ( = ?auto_156555 ?auto_156551 ) ) ( not ( = ?auto_156556 ?auto_156553 ) ) ( not ( = ?auto_156556 ?auto_156552 ) ) ( not ( = ?auto_156556 ?auto_156551 ) ) ( not ( = ?auto_156549 ?auto_156554 ) ) ( not ( = ?auto_156549 ?auto_156555 ) ) ( not ( = ?auto_156549 ?auto_156556 ) ) ( not ( = ?auto_156550 ?auto_156554 ) ) ( not ( = ?auto_156550 ?auto_156555 ) ) ( not ( = ?auto_156550 ?auto_156556 ) ) ( ON ?auto_156550 ?auto_156551 ) ( CLEAR ?auto_156550 ) ( HOLDING ?auto_156549 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_156549 )
      ( MAKE-4PILE ?auto_156549 ?auto_156550 ?auto_156551 ?auto_156552 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_156557 - BLOCK
      ?auto_156558 - BLOCK
      ?auto_156559 - BLOCK
      ?auto_156560 - BLOCK
    )
    :vars
    (
      ?auto_156563 - BLOCK
      ?auto_156562 - BLOCK
      ?auto_156561 - BLOCK
      ?auto_156564 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_156557 ?auto_156558 ) ) ( not ( = ?auto_156557 ?auto_156559 ) ) ( not ( = ?auto_156557 ?auto_156560 ) ) ( not ( = ?auto_156558 ?auto_156559 ) ) ( not ( = ?auto_156558 ?auto_156560 ) ) ( not ( = ?auto_156559 ?auto_156560 ) ) ( ON ?auto_156560 ?auto_156563 ) ( not ( = ?auto_156557 ?auto_156563 ) ) ( not ( = ?auto_156558 ?auto_156563 ) ) ( not ( = ?auto_156559 ?auto_156563 ) ) ( not ( = ?auto_156560 ?auto_156563 ) ) ( ON ?auto_156559 ?auto_156560 ) ( ON-TABLE ?auto_156562 ) ( ON ?auto_156561 ?auto_156562 ) ( ON ?auto_156564 ?auto_156561 ) ( ON ?auto_156563 ?auto_156564 ) ( not ( = ?auto_156562 ?auto_156561 ) ) ( not ( = ?auto_156562 ?auto_156564 ) ) ( not ( = ?auto_156562 ?auto_156563 ) ) ( not ( = ?auto_156562 ?auto_156560 ) ) ( not ( = ?auto_156562 ?auto_156559 ) ) ( not ( = ?auto_156561 ?auto_156564 ) ) ( not ( = ?auto_156561 ?auto_156563 ) ) ( not ( = ?auto_156561 ?auto_156560 ) ) ( not ( = ?auto_156561 ?auto_156559 ) ) ( not ( = ?auto_156564 ?auto_156563 ) ) ( not ( = ?auto_156564 ?auto_156560 ) ) ( not ( = ?auto_156564 ?auto_156559 ) ) ( not ( = ?auto_156557 ?auto_156562 ) ) ( not ( = ?auto_156557 ?auto_156561 ) ) ( not ( = ?auto_156557 ?auto_156564 ) ) ( not ( = ?auto_156558 ?auto_156562 ) ) ( not ( = ?auto_156558 ?auto_156561 ) ) ( not ( = ?auto_156558 ?auto_156564 ) ) ( ON ?auto_156558 ?auto_156559 ) ( ON ?auto_156557 ?auto_156558 ) ( CLEAR ?auto_156557 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_156562 ?auto_156561 ?auto_156564 ?auto_156563 ?auto_156560 ?auto_156559 ?auto_156558 )
      ( MAKE-4PILE ?auto_156557 ?auto_156558 ?auto_156559 ?auto_156560 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_156569 - BLOCK
      ?auto_156570 - BLOCK
      ?auto_156571 - BLOCK
      ?auto_156572 - BLOCK
    )
    :vars
    (
      ?auto_156575 - BLOCK
      ?auto_156574 - BLOCK
      ?auto_156573 - BLOCK
      ?auto_156576 - BLOCK
      ?auto_156577 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_156569 ?auto_156570 ) ) ( not ( = ?auto_156569 ?auto_156571 ) ) ( not ( = ?auto_156569 ?auto_156572 ) ) ( not ( = ?auto_156570 ?auto_156571 ) ) ( not ( = ?auto_156570 ?auto_156572 ) ) ( not ( = ?auto_156571 ?auto_156572 ) ) ( ON ?auto_156572 ?auto_156575 ) ( not ( = ?auto_156569 ?auto_156575 ) ) ( not ( = ?auto_156570 ?auto_156575 ) ) ( not ( = ?auto_156571 ?auto_156575 ) ) ( not ( = ?auto_156572 ?auto_156575 ) ) ( ON ?auto_156571 ?auto_156572 ) ( ON-TABLE ?auto_156574 ) ( ON ?auto_156573 ?auto_156574 ) ( ON ?auto_156576 ?auto_156573 ) ( ON ?auto_156575 ?auto_156576 ) ( not ( = ?auto_156574 ?auto_156573 ) ) ( not ( = ?auto_156574 ?auto_156576 ) ) ( not ( = ?auto_156574 ?auto_156575 ) ) ( not ( = ?auto_156574 ?auto_156572 ) ) ( not ( = ?auto_156574 ?auto_156571 ) ) ( not ( = ?auto_156573 ?auto_156576 ) ) ( not ( = ?auto_156573 ?auto_156575 ) ) ( not ( = ?auto_156573 ?auto_156572 ) ) ( not ( = ?auto_156573 ?auto_156571 ) ) ( not ( = ?auto_156576 ?auto_156575 ) ) ( not ( = ?auto_156576 ?auto_156572 ) ) ( not ( = ?auto_156576 ?auto_156571 ) ) ( not ( = ?auto_156569 ?auto_156574 ) ) ( not ( = ?auto_156569 ?auto_156573 ) ) ( not ( = ?auto_156569 ?auto_156576 ) ) ( not ( = ?auto_156570 ?auto_156574 ) ) ( not ( = ?auto_156570 ?auto_156573 ) ) ( not ( = ?auto_156570 ?auto_156576 ) ) ( ON ?auto_156570 ?auto_156571 ) ( CLEAR ?auto_156570 ) ( ON ?auto_156569 ?auto_156577 ) ( CLEAR ?auto_156569 ) ( HAND-EMPTY ) ( not ( = ?auto_156569 ?auto_156577 ) ) ( not ( = ?auto_156570 ?auto_156577 ) ) ( not ( = ?auto_156571 ?auto_156577 ) ) ( not ( = ?auto_156572 ?auto_156577 ) ) ( not ( = ?auto_156575 ?auto_156577 ) ) ( not ( = ?auto_156574 ?auto_156577 ) ) ( not ( = ?auto_156573 ?auto_156577 ) ) ( not ( = ?auto_156576 ?auto_156577 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_156569 ?auto_156577 )
      ( MAKE-4PILE ?auto_156569 ?auto_156570 ?auto_156571 ?auto_156572 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_156578 - BLOCK
      ?auto_156579 - BLOCK
      ?auto_156580 - BLOCK
      ?auto_156581 - BLOCK
    )
    :vars
    (
      ?auto_156586 - BLOCK
      ?auto_156583 - BLOCK
      ?auto_156585 - BLOCK
      ?auto_156582 - BLOCK
      ?auto_156584 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_156578 ?auto_156579 ) ) ( not ( = ?auto_156578 ?auto_156580 ) ) ( not ( = ?auto_156578 ?auto_156581 ) ) ( not ( = ?auto_156579 ?auto_156580 ) ) ( not ( = ?auto_156579 ?auto_156581 ) ) ( not ( = ?auto_156580 ?auto_156581 ) ) ( ON ?auto_156581 ?auto_156586 ) ( not ( = ?auto_156578 ?auto_156586 ) ) ( not ( = ?auto_156579 ?auto_156586 ) ) ( not ( = ?auto_156580 ?auto_156586 ) ) ( not ( = ?auto_156581 ?auto_156586 ) ) ( ON ?auto_156580 ?auto_156581 ) ( ON-TABLE ?auto_156583 ) ( ON ?auto_156585 ?auto_156583 ) ( ON ?auto_156582 ?auto_156585 ) ( ON ?auto_156586 ?auto_156582 ) ( not ( = ?auto_156583 ?auto_156585 ) ) ( not ( = ?auto_156583 ?auto_156582 ) ) ( not ( = ?auto_156583 ?auto_156586 ) ) ( not ( = ?auto_156583 ?auto_156581 ) ) ( not ( = ?auto_156583 ?auto_156580 ) ) ( not ( = ?auto_156585 ?auto_156582 ) ) ( not ( = ?auto_156585 ?auto_156586 ) ) ( not ( = ?auto_156585 ?auto_156581 ) ) ( not ( = ?auto_156585 ?auto_156580 ) ) ( not ( = ?auto_156582 ?auto_156586 ) ) ( not ( = ?auto_156582 ?auto_156581 ) ) ( not ( = ?auto_156582 ?auto_156580 ) ) ( not ( = ?auto_156578 ?auto_156583 ) ) ( not ( = ?auto_156578 ?auto_156585 ) ) ( not ( = ?auto_156578 ?auto_156582 ) ) ( not ( = ?auto_156579 ?auto_156583 ) ) ( not ( = ?auto_156579 ?auto_156585 ) ) ( not ( = ?auto_156579 ?auto_156582 ) ) ( ON ?auto_156578 ?auto_156584 ) ( CLEAR ?auto_156578 ) ( not ( = ?auto_156578 ?auto_156584 ) ) ( not ( = ?auto_156579 ?auto_156584 ) ) ( not ( = ?auto_156580 ?auto_156584 ) ) ( not ( = ?auto_156581 ?auto_156584 ) ) ( not ( = ?auto_156586 ?auto_156584 ) ) ( not ( = ?auto_156583 ?auto_156584 ) ) ( not ( = ?auto_156585 ?auto_156584 ) ) ( not ( = ?auto_156582 ?auto_156584 ) ) ( HOLDING ?auto_156579 ) ( CLEAR ?auto_156580 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_156583 ?auto_156585 ?auto_156582 ?auto_156586 ?auto_156581 ?auto_156580 ?auto_156579 )
      ( MAKE-4PILE ?auto_156578 ?auto_156579 ?auto_156580 ?auto_156581 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_156587 - BLOCK
      ?auto_156588 - BLOCK
      ?auto_156589 - BLOCK
      ?auto_156590 - BLOCK
    )
    :vars
    (
      ?auto_156593 - BLOCK
      ?auto_156592 - BLOCK
      ?auto_156591 - BLOCK
      ?auto_156595 - BLOCK
      ?auto_156594 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_156587 ?auto_156588 ) ) ( not ( = ?auto_156587 ?auto_156589 ) ) ( not ( = ?auto_156587 ?auto_156590 ) ) ( not ( = ?auto_156588 ?auto_156589 ) ) ( not ( = ?auto_156588 ?auto_156590 ) ) ( not ( = ?auto_156589 ?auto_156590 ) ) ( ON ?auto_156590 ?auto_156593 ) ( not ( = ?auto_156587 ?auto_156593 ) ) ( not ( = ?auto_156588 ?auto_156593 ) ) ( not ( = ?auto_156589 ?auto_156593 ) ) ( not ( = ?auto_156590 ?auto_156593 ) ) ( ON ?auto_156589 ?auto_156590 ) ( ON-TABLE ?auto_156592 ) ( ON ?auto_156591 ?auto_156592 ) ( ON ?auto_156595 ?auto_156591 ) ( ON ?auto_156593 ?auto_156595 ) ( not ( = ?auto_156592 ?auto_156591 ) ) ( not ( = ?auto_156592 ?auto_156595 ) ) ( not ( = ?auto_156592 ?auto_156593 ) ) ( not ( = ?auto_156592 ?auto_156590 ) ) ( not ( = ?auto_156592 ?auto_156589 ) ) ( not ( = ?auto_156591 ?auto_156595 ) ) ( not ( = ?auto_156591 ?auto_156593 ) ) ( not ( = ?auto_156591 ?auto_156590 ) ) ( not ( = ?auto_156591 ?auto_156589 ) ) ( not ( = ?auto_156595 ?auto_156593 ) ) ( not ( = ?auto_156595 ?auto_156590 ) ) ( not ( = ?auto_156595 ?auto_156589 ) ) ( not ( = ?auto_156587 ?auto_156592 ) ) ( not ( = ?auto_156587 ?auto_156591 ) ) ( not ( = ?auto_156587 ?auto_156595 ) ) ( not ( = ?auto_156588 ?auto_156592 ) ) ( not ( = ?auto_156588 ?auto_156591 ) ) ( not ( = ?auto_156588 ?auto_156595 ) ) ( ON ?auto_156587 ?auto_156594 ) ( not ( = ?auto_156587 ?auto_156594 ) ) ( not ( = ?auto_156588 ?auto_156594 ) ) ( not ( = ?auto_156589 ?auto_156594 ) ) ( not ( = ?auto_156590 ?auto_156594 ) ) ( not ( = ?auto_156593 ?auto_156594 ) ) ( not ( = ?auto_156592 ?auto_156594 ) ) ( not ( = ?auto_156591 ?auto_156594 ) ) ( not ( = ?auto_156595 ?auto_156594 ) ) ( CLEAR ?auto_156589 ) ( ON ?auto_156588 ?auto_156587 ) ( CLEAR ?auto_156588 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_156594 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_156594 ?auto_156587 )
      ( MAKE-4PILE ?auto_156587 ?auto_156588 ?auto_156589 ?auto_156590 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_156596 - BLOCK
      ?auto_156597 - BLOCK
      ?auto_156598 - BLOCK
      ?auto_156599 - BLOCK
    )
    :vars
    (
      ?auto_156601 - BLOCK
      ?auto_156602 - BLOCK
      ?auto_156604 - BLOCK
      ?auto_156600 - BLOCK
      ?auto_156603 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_156596 ?auto_156597 ) ) ( not ( = ?auto_156596 ?auto_156598 ) ) ( not ( = ?auto_156596 ?auto_156599 ) ) ( not ( = ?auto_156597 ?auto_156598 ) ) ( not ( = ?auto_156597 ?auto_156599 ) ) ( not ( = ?auto_156598 ?auto_156599 ) ) ( ON ?auto_156599 ?auto_156601 ) ( not ( = ?auto_156596 ?auto_156601 ) ) ( not ( = ?auto_156597 ?auto_156601 ) ) ( not ( = ?auto_156598 ?auto_156601 ) ) ( not ( = ?auto_156599 ?auto_156601 ) ) ( ON-TABLE ?auto_156602 ) ( ON ?auto_156604 ?auto_156602 ) ( ON ?auto_156600 ?auto_156604 ) ( ON ?auto_156601 ?auto_156600 ) ( not ( = ?auto_156602 ?auto_156604 ) ) ( not ( = ?auto_156602 ?auto_156600 ) ) ( not ( = ?auto_156602 ?auto_156601 ) ) ( not ( = ?auto_156602 ?auto_156599 ) ) ( not ( = ?auto_156602 ?auto_156598 ) ) ( not ( = ?auto_156604 ?auto_156600 ) ) ( not ( = ?auto_156604 ?auto_156601 ) ) ( not ( = ?auto_156604 ?auto_156599 ) ) ( not ( = ?auto_156604 ?auto_156598 ) ) ( not ( = ?auto_156600 ?auto_156601 ) ) ( not ( = ?auto_156600 ?auto_156599 ) ) ( not ( = ?auto_156600 ?auto_156598 ) ) ( not ( = ?auto_156596 ?auto_156602 ) ) ( not ( = ?auto_156596 ?auto_156604 ) ) ( not ( = ?auto_156596 ?auto_156600 ) ) ( not ( = ?auto_156597 ?auto_156602 ) ) ( not ( = ?auto_156597 ?auto_156604 ) ) ( not ( = ?auto_156597 ?auto_156600 ) ) ( ON ?auto_156596 ?auto_156603 ) ( not ( = ?auto_156596 ?auto_156603 ) ) ( not ( = ?auto_156597 ?auto_156603 ) ) ( not ( = ?auto_156598 ?auto_156603 ) ) ( not ( = ?auto_156599 ?auto_156603 ) ) ( not ( = ?auto_156601 ?auto_156603 ) ) ( not ( = ?auto_156602 ?auto_156603 ) ) ( not ( = ?auto_156604 ?auto_156603 ) ) ( not ( = ?auto_156600 ?auto_156603 ) ) ( ON ?auto_156597 ?auto_156596 ) ( CLEAR ?auto_156597 ) ( ON-TABLE ?auto_156603 ) ( HOLDING ?auto_156598 ) ( CLEAR ?auto_156599 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_156602 ?auto_156604 ?auto_156600 ?auto_156601 ?auto_156599 ?auto_156598 )
      ( MAKE-4PILE ?auto_156596 ?auto_156597 ?auto_156598 ?auto_156599 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_156605 - BLOCK
      ?auto_156606 - BLOCK
      ?auto_156607 - BLOCK
      ?auto_156608 - BLOCK
    )
    :vars
    (
      ?auto_156610 - BLOCK
      ?auto_156612 - BLOCK
      ?auto_156611 - BLOCK
      ?auto_156609 - BLOCK
      ?auto_156613 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_156605 ?auto_156606 ) ) ( not ( = ?auto_156605 ?auto_156607 ) ) ( not ( = ?auto_156605 ?auto_156608 ) ) ( not ( = ?auto_156606 ?auto_156607 ) ) ( not ( = ?auto_156606 ?auto_156608 ) ) ( not ( = ?auto_156607 ?auto_156608 ) ) ( ON ?auto_156608 ?auto_156610 ) ( not ( = ?auto_156605 ?auto_156610 ) ) ( not ( = ?auto_156606 ?auto_156610 ) ) ( not ( = ?auto_156607 ?auto_156610 ) ) ( not ( = ?auto_156608 ?auto_156610 ) ) ( ON-TABLE ?auto_156612 ) ( ON ?auto_156611 ?auto_156612 ) ( ON ?auto_156609 ?auto_156611 ) ( ON ?auto_156610 ?auto_156609 ) ( not ( = ?auto_156612 ?auto_156611 ) ) ( not ( = ?auto_156612 ?auto_156609 ) ) ( not ( = ?auto_156612 ?auto_156610 ) ) ( not ( = ?auto_156612 ?auto_156608 ) ) ( not ( = ?auto_156612 ?auto_156607 ) ) ( not ( = ?auto_156611 ?auto_156609 ) ) ( not ( = ?auto_156611 ?auto_156610 ) ) ( not ( = ?auto_156611 ?auto_156608 ) ) ( not ( = ?auto_156611 ?auto_156607 ) ) ( not ( = ?auto_156609 ?auto_156610 ) ) ( not ( = ?auto_156609 ?auto_156608 ) ) ( not ( = ?auto_156609 ?auto_156607 ) ) ( not ( = ?auto_156605 ?auto_156612 ) ) ( not ( = ?auto_156605 ?auto_156611 ) ) ( not ( = ?auto_156605 ?auto_156609 ) ) ( not ( = ?auto_156606 ?auto_156612 ) ) ( not ( = ?auto_156606 ?auto_156611 ) ) ( not ( = ?auto_156606 ?auto_156609 ) ) ( ON ?auto_156605 ?auto_156613 ) ( not ( = ?auto_156605 ?auto_156613 ) ) ( not ( = ?auto_156606 ?auto_156613 ) ) ( not ( = ?auto_156607 ?auto_156613 ) ) ( not ( = ?auto_156608 ?auto_156613 ) ) ( not ( = ?auto_156610 ?auto_156613 ) ) ( not ( = ?auto_156612 ?auto_156613 ) ) ( not ( = ?auto_156611 ?auto_156613 ) ) ( not ( = ?auto_156609 ?auto_156613 ) ) ( ON ?auto_156606 ?auto_156605 ) ( ON-TABLE ?auto_156613 ) ( CLEAR ?auto_156608 ) ( ON ?auto_156607 ?auto_156606 ) ( CLEAR ?auto_156607 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_156613 ?auto_156605 ?auto_156606 )
      ( MAKE-4PILE ?auto_156605 ?auto_156606 ?auto_156607 ?auto_156608 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_156614 - BLOCK
      ?auto_156615 - BLOCK
      ?auto_156616 - BLOCK
      ?auto_156617 - BLOCK
    )
    :vars
    (
      ?auto_156620 - BLOCK
      ?auto_156619 - BLOCK
      ?auto_156621 - BLOCK
      ?auto_156618 - BLOCK
      ?auto_156622 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_156614 ?auto_156615 ) ) ( not ( = ?auto_156614 ?auto_156616 ) ) ( not ( = ?auto_156614 ?auto_156617 ) ) ( not ( = ?auto_156615 ?auto_156616 ) ) ( not ( = ?auto_156615 ?auto_156617 ) ) ( not ( = ?auto_156616 ?auto_156617 ) ) ( not ( = ?auto_156614 ?auto_156620 ) ) ( not ( = ?auto_156615 ?auto_156620 ) ) ( not ( = ?auto_156616 ?auto_156620 ) ) ( not ( = ?auto_156617 ?auto_156620 ) ) ( ON-TABLE ?auto_156619 ) ( ON ?auto_156621 ?auto_156619 ) ( ON ?auto_156618 ?auto_156621 ) ( ON ?auto_156620 ?auto_156618 ) ( not ( = ?auto_156619 ?auto_156621 ) ) ( not ( = ?auto_156619 ?auto_156618 ) ) ( not ( = ?auto_156619 ?auto_156620 ) ) ( not ( = ?auto_156619 ?auto_156617 ) ) ( not ( = ?auto_156619 ?auto_156616 ) ) ( not ( = ?auto_156621 ?auto_156618 ) ) ( not ( = ?auto_156621 ?auto_156620 ) ) ( not ( = ?auto_156621 ?auto_156617 ) ) ( not ( = ?auto_156621 ?auto_156616 ) ) ( not ( = ?auto_156618 ?auto_156620 ) ) ( not ( = ?auto_156618 ?auto_156617 ) ) ( not ( = ?auto_156618 ?auto_156616 ) ) ( not ( = ?auto_156614 ?auto_156619 ) ) ( not ( = ?auto_156614 ?auto_156621 ) ) ( not ( = ?auto_156614 ?auto_156618 ) ) ( not ( = ?auto_156615 ?auto_156619 ) ) ( not ( = ?auto_156615 ?auto_156621 ) ) ( not ( = ?auto_156615 ?auto_156618 ) ) ( ON ?auto_156614 ?auto_156622 ) ( not ( = ?auto_156614 ?auto_156622 ) ) ( not ( = ?auto_156615 ?auto_156622 ) ) ( not ( = ?auto_156616 ?auto_156622 ) ) ( not ( = ?auto_156617 ?auto_156622 ) ) ( not ( = ?auto_156620 ?auto_156622 ) ) ( not ( = ?auto_156619 ?auto_156622 ) ) ( not ( = ?auto_156621 ?auto_156622 ) ) ( not ( = ?auto_156618 ?auto_156622 ) ) ( ON ?auto_156615 ?auto_156614 ) ( ON-TABLE ?auto_156622 ) ( ON ?auto_156616 ?auto_156615 ) ( CLEAR ?auto_156616 ) ( HOLDING ?auto_156617 ) ( CLEAR ?auto_156620 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_156619 ?auto_156621 ?auto_156618 ?auto_156620 ?auto_156617 )
      ( MAKE-4PILE ?auto_156614 ?auto_156615 ?auto_156616 ?auto_156617 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_156623 - BLOCK
      ?auto_156624 - BLOCK
      ?auto_156625 - BLOCK
      ?auto_156626 - BLOCK
    )
    :vars
    (
      ?auto_156629 - BLOCK
      ?auto_156627 - BLOCK
      ?auto_156630 - BLOCK
      ?auto_156628 - BLOCK
      ?auto_156631 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_156623 ?auto_156624 ) ) ( not ( = ?auto_156623 ?auto_156625 ) ) ( not ( = ?auto_156623 ?auto_156626 ) ) ( not ( = ?auto_156624 ?auto_156625 ) ) ( not ( = ?auto_156624 ?auto_156626 ) ) ( not ( = ?auto_156625 ?auto_156626 ) ) ( not ( = ?auto_156623 ?auto_156629 ) ) ( not ( = ?auto_156624 ?auto_156629 ) ) ( not ( = ?auto_156625 ?auto_156629 ) ) ( not ( = ?auto_156626 ?auto_156629 ) ) ( ON-TABLE ?auto_156627 ) ( ON ?auto_156630 ?auto_156627 ) ( ON ?auto_156628 ?auto_156630 ) ( ON ?auto_156629 ?auto_156628 ) ( not ( = ?auto_156627 ?auto_156630 ) ) ( not ( = ?auto_156627 ?auto_156628 ) ) ( not ( = ?auto_156627 ?auto_156629 ) ) ( not ( = ?auto_156627 ?auto_156626 ) ) ( not ( = ?auto_156627 ?auto_156625 ) ) ( not ( = ?auto_156630 ?auto_156628 ) ) ( not ( = ?auto_156630 ?auto_156629 ) ) ( not ( = ?auto_156630 ?auto_156626 ) ) ( not ( = ?auto_156630 ?auto_156625 ) ) ( not ( = ?auto_156628 ?auto_156629 ) ) ( not ( = ?auto_156628 ?auto_156626 ) ) ( not ( = ?auto_156628 ?auto_156625 ) ) ( not ( = ?auto_156623 ?auto_156627 ) ) ( not ( = ?auto_156623 ?auto_156630 ) ) ( not ( = ?auto_156623 ?auto_156628 ) ) ( not ( = ?auto_156624 ?auto_156627 ) ) ( not ( = ?auto_156624 ?auto_156630 ) ) ( not ( = ?auto_156624 ?auto_156628 ) ) ( ON ?auto_156623 ?auto_156631 ) ( not ( = ?auto_156623 ?auto_156631 ) ) ( not ( = ?auto_156624 ?auto_156631 ) ) ( not ( = ?auto_156625 ?auto_156631 ) ) ( not ( = ?auto_156626 ?auto_156631 ) ) ( not ( = ?auto_156629 ?auto_156631 ) ) ( not ( = ?auto_156627 ?auto_156631 ) ) ( not ( = ?auto_156630 ?auto_156631 ) ) ( not ( = ?auto_156628 ?auto_156631 ) ) ( ON ?auto_156624 ?auto_156623 ) ( ON-TABLE ?auto_156631 ) ( ON ?auto_156625 ?auto_156624 ) ( CLEAR ?auto_156629 ) ( ON ?auto_156626 ?auto_156625 ) ( CLEAR ?auto_156626 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_156631 ?auto_156623 ?auto_156624 ?auto_156625 )
      ( MAKE-4PILE ?auto_156623 ?auto_156624 ?auto_156625 ?auto_156626 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_156632 - BLOCK
      ?auto_156633 - BLOCK
      ?auto_156634 - BLOCK
      ?auto_156635 - BLOCK
    )
    :vars
    (
      ?auto_156640 - BLOCK
      ?auto_156637 - BLOCK
      ?auto_156639 - BLOCK
      ?auto_156636 - BLOCK
      ?auto_156638 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_156632 ?auto_156633 ) ) ( not ( = ?auto_156632 ?auto_156634 ) ) ( not ( = ?auto_156632 ?auto_156635 ) ) ( not ( = ?auto_156633 ?auto_156634 ) ) ( not ( = ?auto_156633 ?auto_156635 ) ) ( not ( = ?auto_156634 ?auto_156635 ) ) ( not ( = ?auto_156632 ?auto_156640 ) ) ( not ( = ?auto_156633 ?auto_156640 ) ) ( not ( = ?auto_156634 ?auto_156640 ) ) ( not ( = ?auto_156635 ?auto_156640 ) ) ( ON-TABLE ?auto_156637 ) ( ON ?auto_156639 ?auto_156637 ) ( ON ?auto_156636 ?auto_156639 ) ( not ( = ?auto_156637 ?auto_156639 ) ) ( not ( = ?auto_156637 ?auto_156636 ) ) ( not ( = ?auto_156637 ?auto_156640 ) ) ( not ( = ?auto_156637 ?auto_156635 ) ) ( not ( = ?auto_156637 ?auto_156634 ) ) ( not ( = ?auto_156639 ?auto_156636 ) ) ( not ( = ?auto_156639 ?auto_156640 ) ) ( not ( = ?auto_156639 ?auto_156635 ) ) ( not ( = ?auto_156639 ?auto_156634 ) ) ( not ( = ?auto_156636 ?auto_156640 ) ) ( not ( = ?auto_156636 ?auto_156635 ) ) ( not ( = ?auto_156636 ?auto_156634 ) ) ( not ( = ?auto_156632 ?auto_156637 ) ) ( not ( = ?auto_156632 ?auto_156639 ) ) ( not ( = ?auto_156632 ?auto_156636 ) ) ( not ( = ?auto_156633 ?auto_156637 ) ) ( not ( = ?auto_156633 ?auto_156639 ) ) ( not ( = ?auto_156633 ?auto_156636 ) ) ( ON ?auto_156632 ?auto_156638 ) ( not ( = ?auto_156632 ?auto_156638 ) ) ( not ( = ?auto_156633 ?auto_156638 ) ) ( not ( = ?auto_156634 ?auto_156638 ) ) ( not ( = ?auto_156635 ?auto_156638 ) ) ( not ( = ?auto_156640 ?auto_156638 ) ) ( not ( = ?auto_156637 ?auto_156638 ) ) ( not ( = ?auto_156639 ?auto_156638 ) ) ( not ( = ?auto_156636 ?auto_156638 ) ) ( ON ?auto_156633 ?auto_156632 ) ( ON-TABLE ?auto_156638 ) ( ON ?auto_156634 ?auto_156633 ) ( ON ?auto_156635 ?auto_156634 ) ( CLEAR ?auto_156635 ) ( HOLDING ?auto_156640 ) ( CLEAR ?auto_156636 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_156637 ?auto_156639 ?auto_156636 ?auto_156640 )
      ( MAKE-4PILE ?auto_156632 ?auto_156633 ?auto_156634 ?auto_156635 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_156641 - BLOCK
      ?auto_156642 - BLOCK
      ?auto_156643 - BLOCK
      ?auto_156644 - BLOCK
    )
    :vars
    (
      ?auto_156645 - BLOCK
      ?auto_156649 - BLOCK
      ?auto_156647 - BLOCK
      ?auto_156648 - BLOCK
      ?auto_156646 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_156641 ?auto_156642 ) ) ( not ( = ?auto_156641 ?auto_156643 ) ) ( not ( = ?auto_156641 ?auto_156644 ) ) ( not ( = ?auto_156642 ?auto_156643 ) ) ( not ( = ?auto_156642 ?auto_156644 ) ) ( not ( = ?auto_156643 ?auto_156644 ) ) ( not ( = ?auto_156641 ?auto_156645 ) ) ( not ( = ?auto_156642 ?auto_156645 ) ) ( not ( = ?auto_156643 ?auto_156645 ) ) ( not ( = ?auto_156644 ?auto_156645 ) ) ( ON-TABLE ?auto_156649 ) ( ON ?auto_156647 ?auto_156649 ) ( ON ?auto_156648 ?auto_156647 ) ( not ( = ?auto_156649 ?auto_156647 ) ) ( not ( = ?auto_156649 ?auto_156648 ) ) ( not ( = ?auto_156649 ?auto_156645 ) ) ( not ( = ?auto_156649 ?auto_156644 ) ) ( not ( = ?auto_156649 ?auto_156643 ) ) ( not ( = ?auto_156647 ?auto_156648 ) ) ( not ( = ?auto_156647 ?auto_156645 ) ) ( not ( = ?auto_156647 ?auto_156644 ) ) ( not ( = ?auto_156647 ?auto_156643 ) ) ( not ( = ?auto_156648 ?auto_156645 ) ) ( not ( = ?auto_156648 ?auto_156644 ) ) ( not ( = ?auto_156648 ?auto_156643 ) ) ( not ( = ?auto_156641 ?auto_156649 ) ) ( not ( = ?auto_156641 ?auto_156647 ) ) ( not ( = ?auto_156641 ?auto_156648 ) ) ( not ( = ?auto_156642 ?auto_156649 ) ) ( not ( = ?auto_156642 ?auto_156647 ) ) ( not ( = ?auto_156642 ?auto_156648 ) ) ( ON ?auto_156641 ?auto_156646 ) ( not ( = ?auto_156641 ?auto_156646 ) ) ( not ( = ?auto_156642 ?auto_156646 ) ) ( not ( = ?auto_156643 ?auto_156646 ) ) ( not ( = ?auto_156644 ?auto_156646 ) ) ( not ( = ?auto_156645 ?auto_156646 ) ) ( not ( = ?auto_156649 ?auto_156646 ) ) ( not ( = ?auto_156647 ?auto_156646 ) ) ( not ( = ?auto_156648 ?auto_156646 ) ) ( ON ?auto_156642 ?auto_156641 ) ( ON-TABLE ?auto_156646 ) ( ON ?auto_156643 ?auto_156642 ) ( ON ?auto_156644 ?auto_156643 ) ( CLEAR ?auto_156648 ) ( ON ?auto_156645 ?auto_156644 ) ( CLEAR ?auto_156645 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_156646 ?auto_156641 ?auto_156642 ?auto_156643 ?auto_156644 )
      ( MAKE-4PILE ?auto_156641 ?auto_156642 ?auto_156643 ?auto_156644 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_156650 - BLOCK
      ?auto_156651 - BLOCK
      ?auto_156652 - BLOCK
      ?auto_156653 - BLOCK
    )
    :vars
    (
      ?auto_156655 - BLOCK
      ?auto_156658 - BLOCK
      ?auto_156654 - BLOCK
      ?auto_156657 - BLOCK
      ?auto_156656 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_156650 ?auto_156651 ) ) ( not ( = ?auto_156650 ?auto_156652 ) ) ( not ( = ?auto_156650 ?auto_156653 ) ) ( not ( = ?auto_156651 ?auto_156652 ) ) ( not ( = ?auto_156651 ?auto_156653 ) ) ( not ( = ?auto_156652 ?auto_156653 ) ) ( not ( = ?auto_156650 ?auto_156655 ) ) ( not ( = ?auto_156651 ?auto_156655 ) ) ( not ( = ?auto_156652 ?auto_156655 ) ) ( not ( = ?auto_156653 ?auto_156655 ) ) ( ON-TABLE ?auto_156658 ) ( ON ?auto_156654 ?auto_156658 ) ( not ( = ?auto_156658 ?auto_156654 ) ) ( not ( = ?auto_156658 ?auto_156657 ) ) ( not ( = ?auto_156658 ?auto_156655 ) ) ( not ( = ?auto_156658 ?auto_156653 ) ) ( not ( = ?auto_156658 ?auto_156652 ) ) ( not ( = ?auto_156654 ?auto_156657 ) ) ( not ( = ?auto_156654 ?auto_156655 ) ) ( not ( = ?auto_156654 ?auto_156653 ) ) ( not ( = ?auto_156654 ?auto_156652 ) ) ( not ( = ?auto_156657 ?auto_156655 ) ) ( not ( = ?auto_156657 ?auto_156653 ) ) ( not ( = ?auto_156657 ?auto_156652 ) ) ( not ( = ?auto_156650 ?auto_156658 ) ) ( not ( = ?auto_156650 ?auto_156654 ) ) ( not ( = ?auto_156650 ?auto_156657 ) ) ( not ( = ?auto_156651 ?auto_156658 ) ) ( not ( = ?auto_156651 ?auto_156654 ) ) ( not ( = ?auto_156651 ?auto_156657 ) ) ( ON ?auto_156650 ?auto_156656 ) ( not ( = ?auto_156650 ?auto_156656 ) ) ( not ( = ?auto_156651 ?auto_156656 ) ) ( not ( = ?auto_156652 ?auto_156656 ) ) ( not ( = ?auto_156653 ?auto_156656 ) ) ( not ( = ?auto_156655 ?auto_156656 ) ) ( not ( = ?auto_156658 ?auto_156656 ) ) ( not ( = ?auto_156654 ?auto_156656 ) ) ( not ( = ?auto_156657 ?auto_156656 ) ) ( ON ?auto_156651 ?auto_156650 ) ( ON-TABLE ?auto_156656 ) ( ON ?auto_156652 ?auto_156651 ) ( ON ?auto_156653 ?auto_156652 ) ( ON ?auto_156655 ?auto_156653 ) ( CLEAR ?auto_156655 ) ( HOLDING ?auto_156657 ) ( CLEAR ?auto_156654 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_156658 ?auto_156654 ?auto_156657 )
      ( MAKE-4PILE ?auto_156650 ?auto_156651 ?auto_156652 ?auto_156653 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_156659 - BLOCK
      ?auto_156660 - BLOCK
      ?auto_156661 - BLOCK
      ?auto_156662 - BLOCK
    )
    :vars
    (
      ?auto_156664 - BLOCK
      ?auto_156666 - BLOCK
      ?auto_156665 - BLOCK
      ?auto_156667 - BLOCK
      ?auto_156663 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_156659 ?auto_156660 ) ) ( not ( = ?auto_156659 ?auto_156661 ) ) ( not ( = ?auto_156659 ?auto_156662 ) ) ( not ( = ?auto_156660 ?auto_156661 ) ) ( not ( = ?auto_156660 ?auto_156662 ) ) ( not ( = ?auto_156661 ?auto_156662 ) ) ( not ( = ?auto_156659 ?auto_156664 ) ) ( not ( = ?auto_156660 ?auto_156664 ) ) ( not ( = ?auto_156661 ?auto_156664 ) ) ( not ( = ?auto_156662 ?auto_156664 ) ) ( ON-TABLE ?auto_156666 ) ( ON ?auto_156665 ?auto_156666 ) ( not ( = ?auto_156666 ?auto_156665 ) ) ( not ( = ?auto_156666 ?auto_156667 ) ) ( not ( = ?auto_156666 ?auto_156664 ) ) ( not ( = ?auto_156666 ?auto_156662 ) ) ( not ( = ?auto_156666 ?auto_156661 ) ) ( not ( = ?auto_156665 ?auto_156667 ) ) ( not ( = ?auto_156665 ?auto_156664 ) ) ( not ( = ?auto_156665 ?auto_156662 ) ) ( not ( = ?auto_156665 ?auto_156661 ) ) ( not ( = ?auto_156667 ?auto_156664 ) ) ( not ( = ?auto_156667 ?auto_156662 ) ) ( not ( = ?auto_156667 ?auto_156661 ) ) ( not ( = ?auto_156659 ?auto_156666 ) ) ( not ( = ?auto_156659 ?auto_156665 ) ) ( not ( = ?auto_156659 ?auto_156667 ) ) ( not ( = ?auto_156660 ?auto_156666 ) ) ( not ( = ?auto_156660 ?auto_156665 ) ) ( not ( = ?auto_156660 ?auto_156667 ) ) ( ON ?auto_156659 ?auto_156663 ) ( not ( = ?auto_156659 ?auto_156663 ) ) ( not ( = ?auto_156660 ?auto_156663 ) ) ( not ( = ?auto_156661 ?auto_156663 ) ) ( not ( = ?auto_156662 ?auto_156663 ) ) ( not ( = ?auto_156664 ?auto_156663 ) ) ( not ( = ?auto_156666 ?auto_156663 ) ) ( not ( = ?auto_156665 ?auto_156663 ) ) ( not ( = ?auto_156667 ?auto_156663 ) ) ( ON ?auto_156660 ?auto_156659 ) ( ON-TABLE ?auto_156663 ) ( ON ?auto_156661 ?auto_156660 ) ( ON ?auto_156662 ?auto_156661 ) ( ON ?auto_156664 ?auto_156662 ) ( CLEAR ?auto_156665 ) ( ON ?auto_156667 ?auto_156664 ) ( CLEAR ?auto_156667 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_156663 ?auto_156659 ?auto_156660 ?auto_156661 ?auto_156662 ?auto_156664 )
      ( MAKE-4PILE ?auto_156659 ?auto_156660 ?auto_156661 ?auto_156662 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_156668 - BLOCK
      ?auto_156669 - BLOCK
      ?auto_156670 - BLOCK
      ?auto_156671 - BLOCK
    )
    :vars
    (
      ?auto_156675 - BLOCK
      ?auto_156672 - BLOCK
      ?auto_156676 - BLOCK
      ?auto_156673 - BLOCK
      ?auto_156674 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_156668 ?auto_156669 ) ) ( not ( = ?auto_156668 ?auto_156670 ) ) ( not ( = ?auto_156668 ?auto_156671 ) ) ( not ( = ?auto_156669 ?auto_156670 ) ) ( not ( = ?auto_156669 ?auto_156671 ) ) ( not ( = ?auto_156670 ?auto_156671 ) ) ( not ( = ?auto_156668 ?auto_156675 ) ) ( not ( = ?auto_156669 ?auto_156675 ) ) ( not ( = ?auto_156670 ?auto_156675 ) ) ( not ( = ?auto_156671 ?auto_156675 ) ) ( ON-TABLE ?auto_156672 ) ( not ( = ?auto_156672 ?auto_156676 ) ) ( not ( = ?auto_156672 ?auto_156673 ) ) ( not ( = ?auto_156672 ?auto_156675 ) ) ( not ( = ?auto_156672 ?auto_156671 ) ) ( not ( = ?auto_156672 ?auto_156670 ) ) ( not ( = ?auto_156676 ?auto_156673 ) ) ( not ( = ?auto_156676 ?auto_156675 ) ) ( not ( = ?auto_156676 ?auto_156671 ) ) ( not ( = ?auto_156676 ?auto_156670 ) ) ( not ( = ?auto_156673 ?auto_156675 ) ) ( not ( = ?auto_156673 ?auto_156671 ) ) ( not ( = ?auto_156673 ?auto_156670 ) ) ( not ( = ?auto_156668 ?auto_156672 ) ) ( not ( = ?auto_156668 ?auto_156676 ) ) ( not ( = ?auto_156668 ?auto_156673 ) ) ( not ( = ?auto_156669 ?auto_156672 ) ) ( not ( = ?auto_156669 ?auto_156676 ) ) ( not ( = ?auto_156669 ?auto_156673 ) ) ( ON ?auto_156668 ?auto_156674 ) ( not ( = ?auto_156668 ?auto_156674 ) ) ( not ( = ?auto_156669 ?auto_156674 ) ) ( not ( = ?auto_156670 ?auto_156674 ) ) ( not ( = ?auto_156671 ?auto_156674 ) ) ( not ( = ?auto_156675 ?auto_156674 ) ) ( not ( = ?auto_156672 ?auto_156674 ) ) ( not ( = ?auto_156676 ?auto_156674 ) ) ( not ( = ?auto_156673 ?auto_156674 ) ) ( ON ?auto_156669 ?auto_156668 ) ( ON-TABLE ?auto_156674 ) ( ON ?auto_156670 ?auto_156669 ) ( ON ?auto_156671 ?auto_156670 ) ( ON ?auto_156675 ?auto_156671 ) ( ON ?auto_156673 ?auto_156675 ) ( CLEAR ?auto_156673 ) ( HOLDING ?auto_156676 ) ( CLEAR ?auto_156672 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_156672 ?auto_156676 )
      ( MAKE-4PILE ?auto_156668 ?auto_156669 ?auto_156670 ?auto_156671 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_156677 - BLOCK
      ?auto_156678 - BLOCK
      ?auto_156679 - BLOCK
      ?auto_156680 - BLOCK
    )
    :vars
    (
      ?auto_156683 - BLOCK
      ?auto_156684 - BLOCK
      ?auto_156682 - BLOCK
      ?auto_156681 - BLOCK
      ?auto_156685 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_156677 ?auto_156678 ) ) ( not ( = ?auto_156677 ?auto_156679 ) ) ( not ( = ?auto_156677 ?auto_156680 ) ) ( not ( = ?auto_156678 ?auto_156679 ) ) ( not ( = ?auto_156678 ?auto_156680 ) ) ( not ( = ?auto_156679 ?auto_156680 ) ) ( not ( = ?auto_156677 ?auto_156683 ) ) ( not ( = ?auto_156678 ?auto_156683 ) ) ( not ( = ?auto_156679 ?auto_156683 ) ) ( not ( = ?auto_156680 ?auto_156683 ) ) ( ON-TABLE ?auto_156684 ) ( not ( = ?auto_156684 ?auto_156682 ) ) ( not ( = ?auto_156684 ?auto_156681 ) ) ( not ( = ?auto_156684 ?auto_156683 ) ) ( not ( = ?auto_156684 ?auto_156680 ) ) ( not ( = ?auto_156684 ?auto_156679 ) ) ( not ( = ?auto_156682 ?auto_156681 ) ) ( not ( = ?auto_156682 ?auto_156683 ) ) ( not ( = ?auto_156682 ?auto_156680 ) ) ( not ( = ?auto_156682 ?auto_156679 ) ) ( not ( = ?auto_156681 ?auto_156683 ) ) ( not ( = ?auto_156681 ?auto_156680 ) ) ( not ( = ?auto_156681 ?auto_156679 ) ) ( not ( = ?auto_156677 ?auto_156684 ) ) ( not ( = ?auto_156677 ?auto_156682 ) ) ( not ( = ?auto_156677 ?auto_156681 ) ) ( not ( = ?auto_156678 ?auto_156684 ) ) ( not ( = ?auto_156678 ?auto_156682 ) ) ( not ( = ?auto_156678 ?auto_156681 ) ) ( ON ?auto_156677 ?auto_156685 ) ( not ( = ?auto_156677 ?auto_156685 ) ) ( not ( = ?auto_156678 ?auto_156685 ) ) ( not ( = ?auto_156679 ?auto_156685 ) ) ( not ( = ?auto_156680 ?auto_156685 ) ) ( not ( = ?auto_156683 ?auto_156685 ) ) ( not ( = ?auto_156684 ?auto_156685 ) ) ( not ( = ?auto_156682 ?auto_156685 ) ) ( not ( = ?auto_156681 ?auto_156685 ) ) ( ON ?auto_156678 ?auto_156677 ) ( ON-TABLE ?auto_156685 ) ( ON ?auto_156679 ?auto_156678 ) ( ON ?auto_156680 ?auto_156679 ) ( ON ?auto_156683 ?auto_156680 ) ( ON ?auto_156681 ?auto_156683 ) ( CLEAR ?auto_156684 ) ( ON ?auto_156682 ?auto_156681 ) ( CLEAR ?auto_156682 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_156685 ?auto_156677 ?auto_156678 ?auto_156679 ?auto_156680 ?auto_156683 ?auto_156681 )
      ( MAKE-4PILE ?auto_156677 ?auto_156678 ?auto_156679 ?auto_156680 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_156686 - BLOCK
      ?auto_156687 - BLOCK
      ?auto_156688 - BLOCK
      ?auto_156689 - BLOCK
    )
    :vars
    (
      ?auto_156693 - BLOCK
      ?auto_156692 - BLOCK
      ?auto_156691 - BLOCK
      ?auto_156694 - BLOCK
      ?auto_156690 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_156686 ?auto_156687 ) ) ( not ( = ?auto_156686 ?auto_156688 ) ) ( not ( = ?auto_156686 ?auto_156689 ) ) ( not ( = ?auto_156687 ?auto_156688 ) ) ( not ( = ?auto_156687 ?auto_156689 ) ) ( not ( = ?auto_156688 ?auto_156689 ) ) ( not ( = ?auto_156686 ?auto_156693 ) ) ( not ( = ?auto_156687 ?auto_156693 ) ) ( not ( = ?auto_156688 ?auto_156693 ) ) ( not ( = ?auto_156689 ?auto_156693 ) ) ( not ( = ?auto_156692 ?auto_156691 ) ) ( not ( = ?auto_156692 ?auto_156694 ) ) ( not ( = ?auto_156692 ?auto_156693 ) ) ( not ( = ?auto_156692 ?auto_156689 ) ) ( not ( = ?auto_156692 ?auto_156688 ) ) ( not ( = ?auto_156691 ?auto_156694 ) ) ( not ( = ?auto_156691 ?auto_156693 ) ) ( not ( = ?auto_156691 ?auto_156689 ) ) ( not ( = ?auto_156691 ?auto_156688 ) ) ( not ( = ?auto_156694 ?auto_156693 ) ) ( not ( = ?auto_156694 ?auto_156689 ) ) ( not ( = ?auto_156694 ?auto_156688 ) ) ( not ( = ?auto_156686 ?auto_156692 ) ) ( not ( = ?auto_156686 ?auto_156691 ) ) ( not ( = ?auto_156686 ?auto_156694 ) ) ( not ( = ?auto_156687 ?auto_156692 ) ) ( not ( = ?auto_156687 ?auto_156691 ) ) ( not ( = ?auto_156687 ?auto_156694 ) ) ( ON ?auto_156686 ?auto_156690 ) ( not ( = ?auto_156686 ?auto_156690 ) ) ( not ( = ?auto_156687 ?auto_156690 ) ) ( not ( = ?auto_156688 ?auto_156690 ) ) ( not ( = ?auto_156689 ?auto_156690 ) ) ( not ( = ?auto_156693 ?auto_156690 ) ) ( not ( = ?auto_156692 ?auto_156690 ) ) ( not ( = ?auto_156691 ?auto_156690 ) ) ( not ( = ?auto_156694 ?auto_156690 ) ) ( ON ?auto_156687 ?auto_156686 ) ( ON-TABLE ?auto_156690 ) ( ON ?auto_156688 ?auto_156687 ) ( ON ?auto_156689 ?auto_156688 ) ( ON ?auto_156693 ?auto_156689 ) ( ON ?auto_156694 ?auto_156693 ) ( ON ?auto_156691 ?auto_156694 ) ( CLEAR ?auto_156691 ) ( HOLDING ?auto_156692 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_156692 )
      ( MAKE-4PILE ?auto_156686 ?auto_156687 ?auto_156688 ?auto_156689 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_156695 - BLOCK
      ?auto_156696 - BLOCK
      ?auto_156697 - BLOCK
      ?auto_156698 - BLOCK
    )
    :vars
    (
      ?auto_156701 - BLOCK
      ?auto_156702 - BLOCK
      ?auto_156703 - BLOCK
      ?auto_156700 - BLOCK
      ?auto_156699 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_156695 ?auto_156696 ) ) ( not ( = ?auto_156695 ?auto_156697 ) ) ( not ( = ?auto_156695 ?auto_156698 ) ) ( not ( = ?auto_156696 ?auto_156697 ) ) ( not ( = ?auto_156696 ?auto_156698 ) ) ( not ( = ?auto_156697 ?auto_156698 ) ) ( not ( = ?auto_156695 ?auto_156701 ) ) ( not ( = ?auto_156696 ?auto_156701 ) ) ( not ( = ?auto_156697 ?auto_156701 ) ) ( not ( = ?auto_156698 ?auto_156701 ) ) ( not ( = ?auto_156702 ?auto_156703 ) ) ( not ( = ?auto_156702 ?auto_156700 ) ) ( not ( = ?auto_156702 ?auto_156701 ) ) ( not ( = ?auto_156702 ?auto_156698 ) ) ( not ( = ?auto_156702 ?auto_156697 ) ) ( not ( = ?auto_156703 ?auto_156700 ) ) ( not ( = ?auto_156703 ?auto_156701 ) ) ( not ( = ?auto_156703 ?auto_156698 ) ) ( not ( = ?auto_156703 ?auto_156697 ) ) ( not ( = ?auto_156700 ?auto_156701 ) ) ( not ( = ?auto_156700 ?auto_156698 ) ) ( not ( = ?auto_156700 ?auto_156697 ) ) ( not ( = ?auto_156695 ?auto_156702 ) ) ( not ( = ?auto_156695 ?auto_156703 ) ) ( not ( = ?auto_156695 ?auto_156700 ) ) ( not ( = ?auto_156696 ?auto_156702 ) ) ( not ( = ?auto_156696 ?auto_156703 ) ) ( not ( = ?auto_156696 ?auto_156700 ) ) ( ON ?auto_156695 ?auto_156699 ) ( not ( = ?auto_156695 ?auto_156699 ) ) ( not ( = ?auto_156696 ?auto_156699 ) ) ( not ( = ?auto_156697 ?auto_156699 ) ) ( not ( = ?auto_156698 ?auto_156699 ) ) ( not ( = ?auto_156701 ?auto_156699 ) ) ( not ( = ?auto_156702 ?auto_156699 ) ) ( not ( = ?auto_156703 ?auto_156699 ) ) ( not ( = ?auto_156700 ?auto_156699 ) ) ( ON ?auto_156696 ?auto_156695 ) ( ON-TABLE ?auto_156699 ) ( ON ?auto_156697 ?auto_156696 ) ( ON ?auto_156698 ?auto_156697 ) ( ON ?auto_156701 ?auto_156698 ) ( ON ?auto_156700 ?auto_156701 ) ( ON ?auto_156703 ?auto_156700 ) ( ON ?auto_156702 ?auto_156703 ) ( CLEAR ?auto_156702 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_156699 ?auto_156695 ?auto_156696 ?auto_156697 ?auto_156698 ?auto_156701 ?auto_156700 ?auto_156703 )
      ( MAKE-4PILE ?auto_156695 ?auto_156696 ?auto_156697 ?auto_156698 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_156723 - BLOCK
      ?auto_156724 - BLOCK
      ?auto_156725 - BLOCK
    )
    :vars
    (
      ?auto_156728 - BLOCK
      ?auto_156726 - BLOCK
      ?auto_156727 - BLOCK
      ?auto_156730 - BLOCK
      ?auto_156729 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_156728 ?auto_156725 ) ( ON-TABLE ?auto_156723 ) ( ON ?auto_156724 ?auto_156723 ) ( ON ?auto_156725 ?auto_156724 ) ( not ( = ?auto_156723 ?auto_156724 ) ) ( not ( = ?auto_156723 ?auto_156725 ) ) ( not ( = ?auto_156723 ?auto_156728 ) ) ( not ( = ?auto_156724 ?auto_156725 ) ) ( not ( = ?auto_156724 ?auto_156728 ) ) ( not ( = ?auto_156725 ?auto_156728 ) ) ( not ( = ?auto_156723 ?auto_156726 ) ) ( not ( = ?auto_156723 ?auto_156727 ) ) ( not ( = ?auto_156724 ?auto_156726 ) ) ( not ( = ?auto_156724 ?auto_156727 ) ) ( not ( = ?auto_156725 ?auto_156726 ) ) ( not ( = ?auto_156725 ?auto_156727 ) ) ( not ( = ?auto_156728 ?auto_156726 ) ) ( not ( = ?auto_156728 ?auto_156727 ) ) ( not ( = ?auto_156726 ?auto_156727 ) ) ( ON ?auto_156726 ?auto_156728 ) ( CLEAR ?auto_156726 ) ( HOLDING ?auto_156727 ) ( CLEAR ?auto_156730 ) ( ON-TABLE ?auto_156729 ) ( ON ?auto_156730 ?auto_156729 ) ( not ( = ?auto_156729 ?auto_156730 ) ) ( not ( = ?auto_156729 ?auto_156727 ) ) ( not ( = ?auto_156730 ?auto_156727 ) ) ( not ( = ?auto_156723 ?auto_156730 ) ) ( not ( = ?auto_156723 ?auto_156729 ) ) ( not ( = ?auto_156724 ?auto_156730 ) ) ( not ( = ?auto_156724 ?auto_156729 ) ) ( not ( = ?auto_156725 ?auto_156730 ) ) ( not ( = ?auto_156725 ?auto_156729 ) ) ( not ( = ?auto_156728 ?auto_156730 ) ) ( not ( = ?auto_156728 ?auto_156729 ) ) ( not ( = ?auto_156726 ?auto_156730 ) ) ( not ( = ?auto_156726 ?auto_156729 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_156729 ?auto_156730 ?auto_156727 )
      ( MAKE-3PILE ?auto_156723 ?auto_156724 ?auto_156725 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_156731 - BLOCK
      ?auto_156732 - BLOCK
      ?auto_156733 - BLOCK
    )
    :vars
    (
      ?auto_156736 - BLOCK
      ?auto_156737 - BLOCK
      ?auto_156735 - BLOCK
      ?auto_156738 - BLOCK
      ?auto_156734 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_156736 ?auto_156733 ) ( ON-TABLE ?auto_156731 ) ( ON ?auto_156732 ?auto_156731 ) ( ON ?auto_156733 ?auto_156732 ) ( not ( = ?auto_156731 ?auto_156732 ) ) ( not ( = ?auto_156731 ?auto_156733 ) ) ( not ( = ?auto_156731 ?auto_156736 ) ) ( not ( = ?auto_156732 ?auto_156733 ) ) ( not ( = ?auto_156732 ?auto_156736 ) ) ( not ( = ?auto_156733 ?auto_156736 ) ) ( not ( = ?auto_156731 ?auto_156737 ) ) ( not ( = ?auto_156731 ?auto_156735 ) ) ( not ( = ?auto_156732 ?auto_156737 ) ) ( not ( = ?auto_156732 ?auto_156735 ) ) ( not ( = ?auto_156733 ?auto_156737 ) ) ( not ( = ?auto_156733 ?auto_156735 ) ) ( not ( = ?auto_156736 ?auto_156737 ) ) ( not ( = ?auto_156736 ?auto_156735 ) ) ( not ( = ?auto_156737 ?auto_156735 ) ) ( ON ?auto_156737 ?auto_156736 ) ( CLEAR ?auto_156738 ) ( ON-TABLE ?auto_156734 ) ( ON ?auto_156738 ?auto_156734 ) ( not ( = ?auto_156734 ?auto_156738 ) ) ( not ( = ?auto_156734 ?auto_156735 ) ) ( not ( = ?auto_156738 ?auto_156735 ) ) ( not ( = ?auto_156731 ?auto_156738 ) ) ( not ( = ?auto_156731 ?auto_156734 ) ) ( not ( = ?auto_156732 ?auto_156738 ) ) ( not ( = ?auto_156732 ?auto_156734 ) ) ( not ( = ?auto_156733 ?auto_156738 ) ) ( not ( = ?auto_156733 ?auto_156734 ) ) ( not ( = ?auto_156736 ?auto_156738 ) ) ( not ( = ?auto_156736 ?auto_156734 ) ) ( not ( = ?auto_156737 ?auto_156738 ) ) ( not ( = ?auto_156737 ?auto_156734 ) ) ( ON ?auto_156735 ?auto_156737 ) ( CLEAR ?auto_156735 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_156731 ?auto_156732 ?auto_156733 ?auto_156736 ?auto_156737 )
      ( MAKE-3PILE ?auto_156731 ?auto_156732 ?auto_156733 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_156739 - BLOCK
      ?auto_156740 - BLOCK
      ?auto_156741 - BLOCK
    )
    :vars
    (
      ?auto_156745 - BLOCK
      ?auto_156742 - BLOCK
      ?auto_156744 - BLOCK
      ?auto_156743 - BLOCK
      ?auto_156746 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_156745 ?auto_156741 ) ( ON-TABLE ?auto_156739 ) ( ON ?auto_156740 ?auto_156739 ) ( ON ?auto_156741 ?auto_156740 ) ( not ( = ?auto_156739 ?auto_156740 ) ) ( not ( = ?auto_156739 ?auto_156741 ) ) ( not ( = ?auto_156739 ?auto_156745 ) ) ( not ( = ?auto_156740 ?auto_156741 ) ) ( not ( = ?auto_156740 ?auto_156745 ) ) ( not ( = ?auto_156741 ?auto_156745 ) ) ( not ( = ?auto_156739 ?auto_156742 ) ) ( not ( = ?auto_156739 ?auto_156744 ) ) ( not ( = ?auto_156740 ?auto_156742 ) ) ( not ( = ?auto_156740 ?auto_156744 ) ) ( not ( = ?auto_156741 ?auto_156742 ) ) ( not ( = ?auto_156741 ?auto_156744 ) ) ( not ( = ?auto_156745 ?auto_156742 ) ) ( not ( = ?auto_156745 ?auto_156744 ) ) ( not ( = ?auto_156742 ?auto_156744 ) ) ( ON ?auto_156742 ?auto_156745 ) ( ON-TABLE ?auto_156743 ) ( not ( = ?auto_156743 ?auto_156746 ) ) ( not ( = ?auto_156743 ?auto_156744 ) ) ( not ( = ?auto_156746 ?auto_156744 ) ) ( not ( = ?auto_156739 ?auto_156746 ) ) ( not ( = ?auto_156739 ?auto_156743 ) ) ( not ( = ?auto_156740 ?auto_156746 ) ) ( not ( = ?auto_156740 ?auto_156743 ) ) ( not ( = ?auto_156741 ?auto_156746 ) ) ( not ( = ?auto_156741 ?auto_156743 ) ) ( not ( = ?auto_156745 ?auto_156746 ) ) ( not ( = ?auto_156745 ?auto_156743 ) ) ( not ( = ?auto_156742 ?auto_156746 ) ) ( not ( = ?auto_156742 ?auto_156743 ) ) ( ON ?auto_156744 ?auto_156742 ) ( CLEAR ?auto_156744 ) ( HOLDING ?auto_156746 ) ( CLEAR ?auto_156743 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_156743 ?auto_156746 )
      ( MAKE-3PILE ?auto_156739 ?auto_156740 ?auto_156741 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_156747 - BLOCK
      ?auto_156748 - BLOCK
      ?auto_156749 - BLOCK
    )
    :vars
    (
      ?auto_156754 - BLOCK
      ?auto_156751 - BLOCK
      ?auto_156753 - BLOCK
      ?auto_156752 - BLOCK
      ?auto_156750 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_156754 ?auto_156749 ) ( ON-TABLE ?auto_156747 ) ( ON ?auto_156748 ?auto_156747 ) ( ON ?auto_156749 ?auto_156748 ) ( not ( = ?auto_156747 ?auto_156748 ) ) ( not ( = ?auto_156747 ?auto_156749 ) ) ( not ( = ?auto_156747 ?auto_156754 ) ) ( not ( = ?auto_156748 ?auto_156749 ) ) ( not ( = ?auto_156748 ?auto_156754 ) ) ( not ( = ?auto_156749 ?auto_156754 ) ) ( not ( = ?auto_156747 ?auto_156751 ) ) ( not ( = ?auto_156747 ?auto_156753 ) ) ( not ( = ?auto_156748 ?auto_156751 ) ) ( not ( = ?auto_156748 ?auto_156753 ) ) ( not ( = ?auto_156749 ?auto_156751 ) ) ( not ( = ?auto_156749 ?auto_156753 ) ) ( not ( = ?auto_156754 ?auto_156751 ) ) ( not ( = ?auto_156754 ?auto_156753 ) ) ( not ( = ?auto_156751 ?auto_156753 ) ) ( ON ?auto_156751 ?auto_156754 ) ( ON-TABLE ?auto_156752 ) ( not ( = ?auto_156752 ?auto_156750 ) ) ( not ( = ?auto_156752 ?auto_156753 ) ) ( not ( = ?auto_156750 ?auto_156753 ) ) ( not ( = ?auto_156747 ?auto_156750 ) ) ( not ( = ?auto_156747 ?auto_156752 ) ) ( not ( = ?auto_156748 ?auto_156750 ) ) ( not ( = ?auto_156748 ?auto_156752 ) ) ( not ( = ?auto_156749 ?auto_156750 ) ) ( not ( = ?auto_156749 ?auto_156752 ) ) ( not ( = ?auto_156754 ?auto_156750 ) ) ( not ( = ?auto_156754 ?auto_156752 ) ) ( not ( = ?auto_156751 ?auto_156750 ) ) ( not ( = ?auto_156751 ?auto_156752 ) ) ( ON ?auto_156753 ?auto_156751 ) ( CLEAR ?auto_156752 ) ( ON ?auto_156750 ?auto_156753 ) ( CLEAR ?auto_156750 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_156747 ?auto_156748 ?auto_156749 ?auto_156754 ?auto_156751 ?auto_156753 )
      ( MAKE-3PILE ?auto_156747 ?auto_156748 ?auto_156749 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_156755 - BLOCK
      ?auto_156756 - BLOCK
      ?auto_156757 - BLOCK
    )
    :vars
    (
      ?auto_156761 - BLOCK
      ?auto_156759 - BLOCK
      ?auto_156762 - BLOCK
      ?auto_156760 - BLOCK
      ?auto_156758 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_156761 ?auto_156757 ) ( ON-TABLE ?auto_156755 ) ( ON ?auto_156756 ?auto_156755 ) ( ON ?auto_156757 ?auto_156756 ) ( not ( = ?auto_156755 ?auto_156756 ) ) ( not ( = ?auto_156755 ?auto_156757 ) ) ( not ( = ?auto_156755 ?auto_156761 ) ) ( not ( = ?auto_156756 ?auto_156757 ) ) ( not ( = ?auto_156756 ?auto_156761 ) ) ( not ( = ?auto_156757 ?auto_156761 ) ) ( not ( = ?auto_156755 ?auto_156759 ) ) ( not ( = ?auto_156755 ?auto_156762 ) ) ( not ( = ?auto_156756 ?auto_156759 ) ) ( not ( = ?auto_156756 ?auto_156762 ) ) ( not ( = ?auto_156757 ?auto_156759 ) ) ( not ( = ?auto_156757 ?auto_156762 ) ) ( not ( = ?auto_156761 ?auto_156759 ) ) ( not ( = ?auto_156761 ?auto_156762 ) ) ( not ( = ?auto_156759 ?auto_156762 ) ) ( ON ?auto_156759 ?auto_156761 ) ( not ( = ?auto_156760 ?auto_156758 ) ) ( not ( = ?auto_156760 ?auto_156762 ) ) ( not ( = ?auto_156758 ?auto_156762 ) ) ( not ( = ?auto_156755 ?auto_156758 ) ) ( not ( = ?auto_156755 ?auto_156760 ) ) ( not ( = ?auto_156756 ?auto_156758 ) ) ( not ( = ?auto_156756 ?auto_156760 ) ) ( not ( = ?auto_156757 ?auto_156758 ) ) ( not ( = ?auto_156757 ?auto_156760 ) ) ( not ( = ?auto_156761 ?auto_156758 ) ) ( not ( = ?auto_156761 ?auto_156760 ) ) ( not ( = ?auto_156759 ?auto_156758 ) ) ( not ( = ?auto_156759 ?auto_156760 ) ) ( ON ?auto_156762 ?auto_156759 ) ( ON ?auto_156758 ?auto_156762 ) ( CLEAR ?auto_156758 ) ( HOLDING ?auto_156760 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_156760 )
      ( MAKE-3PILE ?auto_156755 ?auto_156756 ?auto_156757 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_156774 - BLOCK
      ?auto_156775 - BLOCK
      ?auto_156776 - BLOCK
    )
    :vars
    (
      ?auto_156777 - BLOCK
      ?auto_156778 - BLOCK
      ?auto_156781 - BLOCK
      ?auto_156779 - BLOCK
      ?auto_156780 - BLOCK
      ?auto_156782 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_156777 ?auto_156776 ) ( ON-TABLE ?auto_156774 ) ( ON ?auto_156775 ?auto_156774 ) ( ON ?auto_156776 ?auto_156775 ) ( not ( = ?auto_156774 ?auto_156775 ) ) ( not ( = ?auto_156774 ?auto_156776 ) ) ( not ( = ?auto_156774 ?auto_156777 ) ) ( not ( = ?auto_156775 ?auto_156776 ) ) ( not ( = ?auto_156775 ?auto_156777 ) ) ( not ( = ?auto_156776 ?auto_156777 ) ) ( not ( = ?auto_156774 ?auto_156778 ) ) ( not ( = ?auto_156774 ?auto_156781 ) ) ( not ( = ?auto_156775 ?auto_156778 ) ) ( not ( = ?auto_156775 ?auto_156781 ) ) ( not ( = ?auto_156776 ?auto_156778 ) ) ( not ( = ?auto_156776 ?auto_156781 ) ) ( not ( = ?auto_156777 ?auto_156778 ) ) ( not ( = ?auto_156777 ?auto_156781 ) ) ( not ( = ?auto_156778 ?auto_156781 ) ) ( ON ?auto_156778 ?auto_156777 ) ( not ( = ?auto_156779 ?auto_156780 ) ) ( not ( = ?auto_156779 ?auto_156781 ) ) ( not ( = ?auto_156780 ?auto_156781 ) ) ( not ( = ?auto_156774 ?auto_156780 ) ) ( not ( = ?auto_156774 ?auto_156779 ) ) ( not ( = ?auto_156775 ?auto_156780 ) ) ( not ( = ?auto_156775 ?auto_156779 ) ) ( not ( = ?auto_156776 ?auto_156780 ) ) ( not ( = ?auto_156776 ?auto_156779 ) ) ( not ( = ?auto_156777 ?auto_156780 ) ) ( not ( = ?auto_156777 ?auto_156779 ) ) ( not ( = ?auto_156778 ?auto_156780 ) ) ( not ( = ?auto_156778 ?auto_156779 ) ) ( ON ?auto_156781 ?auto_156778 ) ( ON ?auto_156780 ?auto_156781 ) ( CLEAR ?auto_156780 ) ( ON ?auto_156779 ?auto_156782 ) ( CLEAR ?auto_156779 ) ( HAND-EMPTY ) ( not ( = ?auto_156774 ?auto_156782 ) ) ( not ( = ?auto_156775 ?auto_156782 ) ) ( not ( = ?auto_156776 ?auto_156782 ) ) ( not ( = ?auto_156777 ?auto_156782 ) ) ( not ( = ?auto_156778 ?auto_156782 ) ) ( not ( = ?auto_156781 ?auto_156782 ) ) ( not ( = ?auto_156779 ?auto_156782 ) ) ( not ( = ?auto_156780 ?auto_156782 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_156779 ?auto_156782 )
      ( MAKE-3PILE ?auto_156774 ?auto_156775 ?auto_156776 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_156783 - BLOCK
      ?auto_156784 - BLOCK
      ?auto_156785 - BLOCK
    )
    :vars
    (
      ?auto_156788 - BLOCK
      ?auto_156790 - BLOCK
      ?auto_156791 - BLOCK
      ?auto_156787 - BLOCK
      ?auto_156789 - BLOCK
      ?auto_156786 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_156788 ?auto_156785 ) ( ON-TABLE ?auto_156783 ) ( ON ?auto_156784 ?auto_156783 ) ( ON ?auto_156785 ?auto_156784 ) ( not ( = ?auto_156783 ?auto_156784 ) ) ( not ( = ?auto_156783 ?auto_156785 ) ) ( not ( = ?auto_156783 ?auto_156788 ) ) ( not ( = ?auto_156784 ?auto_156785 ) ) ( not ( = ?auto_156784 ?auto_156788 ) ) ( not ( = ?auto_156785 ?auto_156788 ) ) ( not ( = ?auto_156783 ?auto_156790 ) ) ( not ( = ?auto_156783 ?auto_156791 ) ) ( not ( = ?auto_156784 ?auto_156790 ) ) ( not ( = ?auto_156784 ?auto_156791 ) ) ( not ( = ?auto_156785 ?auto_156790 ) ) ( not ( = ?auto_156785 ?auto_156791 ) ) ( not ( = ?auto_156788 ?auto_156790 ) ) ( not ( = ?auto_156788 ?auto_156791 ) ) ( not ( = ?auto_156790 ?auto_156791 ) ) ( ON ?auto_156790 ?auto_156788 ) ( not ( = ?auto_156787 ?auto_156789 ) ) ( not ( = ?auto_156787 ?auto_156791 ) ) ( not ( = ?auto_156789 ?auto_156791 ) ) ( not ( = ?auto_156783 ?auto_156789 ) ) ( not ( = ?auto_156783 ?auto_156787 ) ) ( not ( = ?auto_156784 ?auto_156789 ) ) ( not ( = ?auto_156784 ?auto_156787 ) ) ( not ( = ?auto_156785 ?auto_156789 ) ) ( not ( = ?auto_156785 ?auto_156787 ) ) ( not ( = ?auto_156788 ?auto_156789 ) ) ( not ( = ?auto_156788 ?auto_156787 ) ) ( not ( = ?auto_156790 ?auto_156789 ) ) ( not ( = ?auto_156790 ?auto_156787 ) ) ( ON ?auto_156791 ?auto_156790 ) ( ON ?auto_156787 ?auto_156786 ) ( CLEAR ?auto_156787 ) ( not ( = ?auto_156783 ?auto_156786 ) ) ( not ( = ?auto_156784 ?auto_156786 ) ) ( not ( = ?auto_156785 ?auto_156786 ) ) ( not ( = ?auto_156788 ?auto_156786 ) ) ( not ( = ?auto_156790 ?auto_156786 ) ) ( not ( = ?auto_156791 ?auto_156786 ) ) ( not ( = ?auto_156787 ?auto_156786 ) ) ( not ( = ?auto_156789 ?auto_156786 ) ) ( HOLDING ?auto_156789 ) ( CLEAR ?auto_156791 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_156783 ?auto_156784 ?auto_156785 ?auto_156788 ?auto_156790 ?auto_156791 ?auto_156789 )
      ( MAKE-3PILE ?auto_156783 ?auto_156784 ?auto_156785 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_156792 - BLOCK
      ?auto_156793 - BLOCK
      ?auto_156794 - BLOCK
    )
    :vars
    (
      ?auto_156797 - BLOCK
      ?auto_156795 - BLOCK
      ?auto_156800 - BLOCK
      ?auto_156799 - BLOCK
      ?auto_156796 - BLOCK
      ?auto_156798 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_156797 ?auto_156794 ) ( ON-TABLE ?auto_156792 ) ( ON ?auto_156793 ?auto_156792 ) ( ON ?auto_156794 ?auto_156793 ) ( not ( = ?auto_156792 ?auto_156793 ) ) ( not ( = ?auto_156792 ?auto_156794 ) ) ( not ( = ?auto_156792 ?auto_156797 ) ) ( not ( = ?auto_156793 ?auto_156794 ) ) ( not ( = ?auto_156793 ?auto_156797 ) ) ( not ( = ?auto_156794 ?auto_156797 ) ) ( not ( = ?auto_156792 ?auto_156795 ) ) ( not ( = ?auto_156792 ?auto_156800 ) ) ( not ( = ?auto_156793 ?auto_156795 ) ) ( not ( = ?auto_156793 ?auto_156800 ) ) ( not ( = ?auto_156794 ?auto_156795 ) ) ( not ( = ?auto_156794 ?auto_156800 ) ) ( not ( = ?auto_156797 ?auto_156795 ) ) ( not ( = ?auto_156797 ?auto_156800 ) ) ( not ( = ?auto_156795 ?auto_156800 ) ) ( ON ?auto_156795 ?auto_156797 ) ( not ( = ?auto_156799 ?auto_156796 ) ) ( not ( = ?auto_156799 ?auto_156800 ) ) ( not ( = ?auto_156796 ?auto_156800 ) ) ( not ( = ?auto_156792 ?auto_156796 ) ) ( not ( = ?auto_156792 ?auto_156799 ) ) ( not ( = ?auto_156793 ?auto_156796 ) ) ( not ( = ?auto_156793 ?auto_156799 ) ) ( not ( = ?auto_156794 ?auto_156796 ) ) ( not ( = ?auto_156794 ?auto_156799 ) ) ( not ( = ?auto_156797 ?auto_156796 ) ) ( not ( = ?auto_156797 ?auto_156799 ) ) ( not ( = ?auto_156795 ?auto_156796 ) ) ( not ( = ?auto_156795 ?auto_156799 ) ) ( ON ?auto_156800 ?auto_156795 ) ( ON ?auto_156799 ?auto_156798 ) ( not ( = ?auto_156792 ?auto_156798 ) ) ( not ( = ?auto_156793 ?auto_156798 ) ) ( not ( = ?auto_156794 ?auto_156798 ) ) ( not ( = ?auto_156797 ?auto_156798 ) ) ( not ( = ?auto_156795 ?auto_156798 ) ) ( not ( = ?auto_156800 ?auto_156798 ) ) ( not ( = ?auto_156799 ?auto_156798 ) ) ( not ( = ?auto_156796 ?auto_156798 ) ) ( CLEAR ?auto_156800 ) ( ON ?auto_156796 ?auto_156799 ) ( CLEAR ?auto_156796 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_156798 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_156798 ?auto_156799 )
      ( MAKE-3PILE ?auto_156792 ?auto_156793 ?auto_156794 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_156801 - BLOCK
      ?auto_156802 - BLOCK
      ?auto_156803 - BLOCK
    )
    :vars
    (
      ?auto_156804 - BLOCK
      ?auto_156805 - BLOCK
      ?auto_156806 - BLOCK
      ?auto_156807 - BLOCK
      ?auto_156808 - BLOCK
      ?auto_156809 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_156804 ?auto_156803 ) ( ON-TABLE ?auto_156801 ) ( ON ?auto_156802 ?auto_156801 ) ( ON ?auto_156803 ?auto_156802 ) ( not ( = ?auto_156801 ?auto_156802 ) ) ( not ( = ?auto_156801 ?auto_156803 ) ) ( not ( = ?auto_156801 ?auto_156804 ) ) ( not ( = ?auto_156802 ?auto_156803 ) ) ( not ( = ?auto_156802 ?auto_156804 ) ) ( not ( = ?auto_156803 ?auto_156804 ) ) ( not ( = ?auto_156801 ?auto_156805 ) ) ( not ( = ?auto_156801 ?auto_156806 ) ) ( not ( = ?auto_156802 ?auto_156805 ) ) ( not ( = ?auto_156802 ?auto_156806 ) ) ( not ( = ?auto_156803 ?auto_156805 ) ) ( not ( = ?auto_156803 ?auto_156806 ) ) ( not ( = ?auto_156804 ?auto_156805 ) ) ( not ( = ?auto_156804 ?auto_156806 ) ) ( not ( = ?auto_156805 ?auto_156806 ) ) ( ON ?auto_156805 ?auto_156804 ) ( not ( = ?auto_156807 ?auto_156808 ) ) ( not ( = ?auto_156807 ?auto_156806 ) ) ( not ( = ?auto_156808 ?auto_156806 ) ) ( not ( = ?auto_156801 ?auto_156808 ) ) ( not ( = ?auto_156801 ?auto_156807 ) ) ( not ( = ?auto_156802 ?auto_156808 ) ) ( not ( = ?auto_156802 ?auto_156807 ) ) ( not ( = ?auto_156803 ?auto_156808 ) ) ( not ( = ?auto_156803 ?auto_156807 ) ) ( not ( = ?auto_156804 ?auto_156808 ) ) ( not ( = ?auto_156804 ?auto_156807 ) ) ( not ( = ?auto_156805 ?auto_156808 ) ) ( not ( = ?auto_156805 ?auto_156807 ) ) ( ON ?auto_156807 ?auto_156809 ) ( not ( = ?auto_156801 ?auto_156809 ) ) ( not ( = ?auto_156802 ?auto_156809 ) ) ( not ( = ?auto_156803 ?auto_156809 ) ) ( not ( = ?auto_156804 ?auto_156809 ) ) ( not ( = ?auto_156805 ?auto_156809 ) ) ( not ( = ?auto_156806 ?auto_156809 ) ) ( not ( = ?auto_156807 ?auto_156809 ) ) ( not ( = ?auto_156808 ?auto_156809 ) ) ( ON ?auto_156808 ?auto_156807 ) ( CLEAR ?auto_156808 ) ( ON-TABLE ?auto_156809 ) ( HOLDING ?auto_156806 ) ( CLEAR ?auto_156805 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_156801 ?auto_156802 ?auto_156803 ?auto_156804 ?auto_156805 ?auto_156806 )
      ( MAKE-3PILE ?auto_156801 ?auto_156802 ?auto_156803 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_156868 - BLOCK
      ?auto_156869 - BLOCK
      ?auto_156870 - BLOCK
      ?auto_156871 - BLOCK
      ?auto_156872 - BLOCK
    )
    :vars
    (
      ?auto_156873 - BLOCK
      ?auto_156875 - BLOCK
      ?auto_156874 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_156868 ) ( ON ?auto_156869 ?auto_156868 ) ( ON ?auto_156870 ?auto_156869 ) ( not ( = ?auto_156868 ?auto_156869 ) ) ( not ( = ?auto_156868 ?auto_156870 ) ) ( not ( = ?auto_156868 ?auto_156871 ) ) ( not ( = ?auto_156868 ?auto_156872 ) ) ( not ( = ?auto_156869 ?auto_156870 ) ) ( not ( = ?auto_156869 ?auto_156871 ) ) ( not ( = ?auto_156869 ?auto_156872 ) ) ( not ( = ?auto_156870 ?auto_156871 ) ) ( not ( = ?auto_156870 ?auto_156872 ) ) ( not ( = ?auto_156871 ?auto_156872 ) ) ( ON ?auto_156872 ?auto_156873 ) ( not ( = ?auto_156868 ?auto_156873 ) ) ( not ( = ?auto_156869 ?auto_156873 ) ) ( not ( = ?auto_156870 ?auto_156873 ) ) ( not ( = ?auto_156871 ?auto_156873 ) ) ( not ( = ?auto_156872 ?auto_156873 ) ) ( CLEAR ?auto_156870 ) ( ON ?auto_156871 ?auto_156872 ) ( CLEAR ?auto_156871 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_156875 ) ( ON ?auto_156874 ?auto_156875 ) ( ON ?auto_156873 ?auto_156874 ) ( not ( = ?auto_156875 ?auto_156874 ) ) ( not ( = ?auto_156875 ?auto_156873 ) ) ( not ( = ?auto_156875 ?auto_156872 ) ) ( not ( = ?auto_156875 ?auto_156871 ) ) ( not ( = ?auto_156874 ?auto_156873 ) ) ( not ( = ?auto_156874 ?auto_156872 ) ) ( not ( = ?auto_156874 ?auto_156871 ) ) ( not ( = ?auto_156868 ?auto_156875 ) ) ( not ( = ?auto_156868 ?auto_156874 ) ) ( not ( = ?auto_156869 ?auto_156875 ) ) ( not ( = ?auto_156869 ?auto_156874 ) ) ( not ( = ?auto_156870 ?auto_156875 ) ) ( not ( = ?auto_156870 ?auto_156874 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_156875 ?auto_156874 ?auto_156873 ?auto_156872 )
      ( MAKE-5PILE ?auto_156868 ?auto_156869 ?auto_156870 ?auto_156871 ?auto_156872 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_156876 - BLOCK
      ?auto_156877 - BLOCK
      ?auto_156878 - BLOCK
      ?auto_156879 - BLOCK
      ?auto_156880 - BLOCK
    )
    :vars
    (
      ?auto_156882 - BLOCK
      ?auto_156881 - BLOCK
      ?auto_156883 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_156876 ) ( ON ?auto_156877 ?auto_156876 ) ( not ( = ?auto_156876 ?auto_156877 ) ) ( not ( = ?auto_156876 ?auto_156878 ) ) ( not ( = ?auto_156876 ?auto_156879 ) ) ( not ( = ?auto_156876 ?auto_156880 ) ) ( not ( = ?auto_156877 ?auto_156878 ) ) ( not ( = ?auto_156877 ?auto_156879 ) ) ( not ( = ?auto_156877 ?auto_156880 ) ) ( not ( = ?auto_156878 ?auto_156879 ) ) ( not ( = ?auto_156878 ?auto_156880 ) ) ( not ( = ?auto_156879 ?auto_156880 ) ) ( ON ?auto_156880 ?auto_156882 ) ( not ( = ?auto_156876 ?auto_156882 ) ) ( not ( = ?auto_156877 ?auto_156882 ) ) ( not ( = ?auto_156878 ?auto_156882 ) ) ( not ( = ?auto_156879 ?auto_156882 ) ) ( not ( = ?auto_156880 ?auto_156882 ) ) ( ON ?auto_156879 ?auto_156880 ) ( CLEAR ?auto_156879 ) ( ON-TABLE ?auto_156881 ) ( ON ?auto_156883 ?auto_156881 ) ( ON ?auto_156882 ?auto_156883 ) ( not ( = ?auto_156881 ?auto_156883 ) ) ( not ( = ?auto_156881 ?auto_156882 ) ) ( not ( = ?auto_156881 ?auto_156880 ) ) ( not ( = ?auto_156881 ?auto_156879 ) ) ( not ( = ?auto_156883 ?auto_156882 ) ) ( not ( = ?auto_156883 ?auto_156880 ) ) ( not ( = ?auto_156883 ?auto_156879 ) ) ( not ( = ?auto_156876 ?auto_156881 ) ) ( not ( = ?auto_156876 ?auto_156883 ) ) ( not ( = ?auto_156877 ?auto_156881 ) ) ( not ( = ?auto_156877 ?auto_156883 ) ) ( not ( = ?auto_156878 ?auto_156881 ) ) ( not ( = ?auto_156878 ?auto_156883 ) ) ( HOLDING ?auto_156878 ) ( CLEAR ?auto_156877 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_156876 ?auto_156877 ?auto_156878 )
      ( MAKE-5PILE ?auto_156876 ?auto_156877 ?auto_156878 ?auto_156879 ?auto_156880 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_156884 - BLOCK
      ?auto_156885 - BLOCK
      ?auto_156886 - BLOCK
      ?auto_156887 - BLOCK
      ?auto_156888 - BLOCK
    )
    :vars
    (
      ?auto_156891 - BLOCK
      ?auto_156889 - BLOCK
      ?auto_156890 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_156884 ) ( ON ?auto_156885 ?auto_156884 ) ( not ( = ?auto_156884 ?auto_156885 ) ) ( not ( = ?auto_156884 ?auto_156886 ) ) ( not ( = ?auto_156884 ?auto_156887 ) ) ( not ( = ?auto_156884 ?auto_156888 ) ) ( not ( = ?auto_156885 ?auto_156886 ) ) ( not ( = ?auto_156885 ?auto_156887 ) ) ( not ( = ?auto_156885 ?auto_156888 ) ) ( not ( = ?auto_156886 ?auto_156887 ) ) ( not ( = ?auto_156886 ?auto_156888 ) ) ( not ( = ?auto_156887 ?auto_156888 ) ) ( ON ?auto_156888 ?auto_156891 ) ( not ( = ?auto_156884 ?auto_156891 ) ) ( not ( = ?auto_156885 ?auto_156891 ) ) ( not ( = ?auto_156886 ?auto_156891 ) ) ( not ( = ?auto_156887 ?auto_156891 ) ) ( not ( = ?auto_156888 ?auto_156891 ) ) ( ON ?auto_156887 ?auto_156888 ) ( ON-TABLE ?auto_156889 ) ( ON ?auto_156890 ?auto_156889 ) ( ON ?auto_156891 ?auto_156890 ) ( not ( = ?auto_156889 ?auto_156890 ) ) ( not ( = ?auto_156889 ?auto_156891 ) ) ( not ( = ?auto_156889 ?auto_156888 ) ) ( not ( = ?auto_156889 ?auto_156887 ) ) ( not ( = ?auto_156890 ?auto_156891 ) ) ( not ( = ?auto_156890 ?auto_156888 ) ) ( not ( = ?auto_156890 ?auto_156887 ) ) ( not ( = ?auto_156884 ?auto_156889 ) ) ( not ( = ?auto_156884 ?auto_156890 ) ) ( not ( = ?auto_156885 ?auto_156889 ) ) ( not ( = ?auto_156885 ?auto_156890 ) ) ( not ( = ?auto_156886 ?auto_156889 ) ) ( not ( = ?auto_156886 ?auto_156890 ) ) ( CLEAR ?auto_156885 ) ( ON ?auto_156886 ?auto_156887 ) ( CLEAR ?auto_156886 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_156889 ?auto_156890 ?auto_156891 ?auto_156888 ?auto_156887 )
      ( MAKE-5PILE ?auto_156884 ?auto_156885 ?auto_156886 ?auto_156887 ?auto_156888 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_156892 - BLOCK
      ?auto_156893 - BLOCK
      ?auto_156894 - BLOCK
      ?auto_156895 - BLOCK
      ?auto_156896 - BLOCK
    )
    :vars
    (
      ?auto_156899 - BLOCK
      ?auto_156897 - BLOCK
      ?auto_156898 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_156892 ) ( not ( = ?auto_156892 ?auto_156893 ) ) ( not ( = ?auto_156892 ?auto_156894 ) ) ( not ( = ?auto_156892 ?auto_156895 ) ) ( not ( = ?auto_156892 ?auto_156896 ) ) ( not ( = ?auto_156893 ?auto_156894 ) ) ( not ( = ?auto_156893 ?auto_156895 ) ) ( not ( = ?auto_156893 ?auto_156896 ) ) ( not ( = ?auto_156894 ?auto_156895 ) ) ( not ( = ?auto_156894 ?auto_156896 ) ) ( not ( = ?auto_156895 ?auto_156896 ) ) ( ON ?auto_156896 ?auto_156899 ) ( not ( = ?auto_156892 ?auto_156899 ) ) ( not ( = ?auto_156893 ?auto_156899 ) ) ( not ( = ?auto_156894 ?auto_156899 ) ) ( not ( = ?auto_156895 ?auto_156899 ) ) ( not ( = ?auto_156896 ?auto_156899 ) ) ( ON ?auto_156895 ?auto_156896 ) ( ON-TABLE ?auto_156897 ) ( ON ?auto_156898 ?auto_156897 ) ( ON ?auto_156899 ?auto_156898 ) ( not ( = ?auto_156897 ?auto_156898 ) ) ( not ( = ?auto_156897 ?auto_156899 ) ) ( not ( = ?auto_156897 ?auto_156896 ) ) ( not ( = ?auto_156897 ?auto_156895 ) ) ( not ( = ?auto_156898 ?auto_156899 ) ) ( not ( = ?auto_156898 ?auto_156896 ) ) ( not ( = ?auto_156898 ?auto_156895 ) ) ( not ( = ?auto_156892 ?auto_156897 ) ) ( not ( = ?auto_156892 ?auto_156898 ) ) ( not ( = ?auto_156893 ?auto_156897 ) ) ( not ( = ?auto_156893 ?auto_156898 ) ) ( not ( = ?auto_156894 ?auto_156897 ) ) ( not ( = ?auto_156894 ?auto_156898 ) ) ( ON ?auto_156894 ?auto_156895 ) ( CLEAR ?auto_156894 ) ( HOLDING ?auto_156893 ) ( CLEAR ?auto_156892 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_156892 ?auto_156893 )
      ( MAKE-5PILE ?auto_156892 ?auto_156893 ?auto_156894 ?auto_156895 ?auto_156896 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_156900 - BLOCK
      ?auto_156901 - BLOCK
      ?auto_156902 - BLOCK
      ?auto_156903 - BLOCK
      ?auto_156904 - BLOCK
    )
    :vars
    (
      ?auto_156907 - BLOCK
      ?auto_156906 - BLOCK
      ?auto_156905 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_156900 ) ( not ( = ?auto_156900 ?auto_156901 ) ) ( not ( = ?auto_156900 ?auto_156902 ) ) ( not ( = ?auto_156900 ?auto_156903 ) ) ( not ( = ?auto_156900 ?auto_156904 ) ) ( not ( = ?auto_156901 ?auto_156902 ) ) ( not ( = ?auto_156901 ?auto_156903 ) ) ( not ( = ?auto_156901 ?auto_156904 ) ) ( not ( = ?auto_156902 ?auto_156903 ) ) ( not ( = ?auto_156902 ?auto_156904 ) ) ( not ( = ?auto_156903 ?auto_156904 ) ) ( ON ?auto_156904 ?auto_156907 ) ( not ( = ?auto_156900 ?auto_156907 ) ) ( not ( = ?auto_156901 ?auto_156907 ) ) ( not ( = ?auto_156902 ?auto_156907 ) ) ( not ( = ?auto_156903 ?auto_156907 ) ) ( not ( = ?auto_156904 ?auto_156907 ) ) ( ON ?auto_156903 ?auto_156904 ) ( ON-TABLE ?auto_156906 ) ( ON ?auto_156905 ?auto_156906 ) ( ON ?auto_156907 ?auto_156905 ) ( not ( = ?auto_156906 ?auto_156905 ) ) ( not ( = ?auto_156906 ?auto_156907 ) ) ( not ( = ?auto_156906 ?auto_156904 ) ) ( not ( = ?auto_156906 ?auto_156903 ) ) ( not ( = ?auto_156905 ?auto_156907 ) ) ( not ( = ?auto_156905 ?auto_156904 ) ) ( not ( = ?auto_156905 ?auto_156903 ) ) ( not ( = ?auto_156900 ?auto_156906 ) ) ( not ( = ?auto_156900 ?auto_156905 ) ) ( not ( = ?auto_156901 ?auto_156906 ) ) ( not ( = ?auto_156901 ?auto_156905 ) ) ( not ( = ?auto_156902 ?auto_156906 ) ) ( not ( = ?auto_156902 ?auto_156905 ) ) ( ON ?auto_156902 ?auto_156903 ) ( CLEAR ?auto_156900 ) ( ON ?auto_156901 ?auto_156902 ) ( CLEAR ?auto_156901 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_156906 ?auto_156905 ?auto_156907 ?auto_156904 ?auto_156903 ?auto_156902 )
      ( MAKE-5PILE ?auto_156900 ?auto_156901 ?auto_156902 ?auto_156903 ?auto_156904 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_156908 - BLOCK
      ?auto_156909 - BLOCK
      ?auto_156910 - BLOCK
      ?auto_156911 - BLOCK
      ?auto_156912 - BLOCK
    )
    :vars
    (
      ?auto_156913 - BLOCK
      ?auto_156914 - BLOCK
      ?auto_156915 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_156908 ?auto_156909 ) ) ( not ( = ?auto_156908 ?auto_156910 ) ) ( not ( = ?auto_156908 ?auto_156911 ) ) ( not ( = ?auto_156908 ?auto_156912 ) ) ( not ( = ?auto_156909 ?auto_156910 ) ) ( not ( = ?auto_156909 ?auto_156911 ) ) ( not ( = ?auto_156909 ?auto_156912 ) ) ( not ( = ?auto_156910 ?auto_156911 ) ) ( not ( = ?auto_156910 ?auto_156912 ) ) ( not ( = ?auto_156911 ?auto_156912 ) ) ( ON ?auto_156912 ?auto_156913 ) ( not ( = ?auto_156908 ?auto_156913 ) ) ( not ( = ?auto_156909 ?auto_156913 ) ) ( not ( = ?auto_156910 ?auto_156913 ) ) ( not ( = ?auto_156911 ?auto_156913 ) ) ( not ( = ?auto_156912 ?auto_156913 ) ) ( ON ?auto_156911 ?auto_156912 ) ( ON-TABLE ?auto_156914 ) ( ON ?auto_156915 ?auto_156914 ) ( ON ?auto_156913 ?auto_156915 ) ( not ( = ?auto_156914 ?auto_156915 ) ) ( not ( = ?auto_156914 ?auto_156913 ) ) ( not ( = ?auto_156914 ?auto_156912 ) ) ( not ( = ?auto_156914 ?auto_156911 ) ) ( not ( = ?auto_156915 ?auto_156913 ) ) ( not ( = ?auto_156915 ?auto_156912 ) ) ( not ( = ?auto_156915 ?auto_156911 ) ) ( not ( = ?auto_156908 ?auto_156914 ) ) ( not ( = ?auto_156908 ?auto_156915 ) ) ( not ( = ?auto_156909 ?auto_156914 ) ) ( not ( = ?auto_156909 ?auto_156915 ) ) ( not ( = ?auto_156910 ?auto_156914 ) ) ( not ( = ?auto_156910 ?auto_156915 ) ) ( ON ?auto_156910 ?auto_156911 ) ( ON ?auto_156909 ?auto_156910 ) ( CLEAR ?auto_156909 ) ( HOLDING ?auto_156908 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_156908 )
      ( MAKE-5PILE ?auto_156908 ?auto_156909 ?auto_156910 ?auto_156911 ?auto_156912 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_156916 - BLOCK
      ?auto_156917 - BLOCK
      ?auto_156918 - BLOCK
      ?auto_156919 - BLOCK
      ?auto_156920 - BLOCK
    )
    :vars
    (
      ?auto_156922 - BLOCK
      ?auto_156921 - BLOCK
      ?auto_156923 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_156916 ?auto_156917 ) ) ( not ( = ?auto_156916 ?auto_156918 ) ) ( not ( = ?auto_156916 ?auto_156919 ) ) ( not ( = ?auto_156916 ?auto_156920 ) ) ( not ( = ?auto_156917 ?auto_156918 ) ) ( not ( = ?auto_156917 ?auto_156919 ) ) ( not ( = ?auto_156917 ?auto_156920 ) ) ( not ( = ?auto_156918 ?auto_156919 ) ) ( not ( = ?auto_156918 ?auto_156920 ) ) ( not ( = ?auto_156919 ?auto_156920 ) ) ( ON ?auto_156920 ?auto_156922 ) ( not ( = ?auto_156916 ?auto_156922 ) ) ( not ( = ?auto_156917 ?auto_156922 ) ) ( not ( = ?auto_156918 ?auto_156922 ) ) ( not ( = ?auto_156919 ?auto_156922 ) ) ( not ( = ?auto_156920 ?auto_156922 ) ) ( ON ?auto_156919 ?auto_156920 ) ( ON-TABLE ?auto_156921 ) ( ON ?auto_156923 ?auto_156921 ) ( ON ?auto_156922 ?auto_156923 ) ( not ( = ?auto_156921 ?auto_156923 ) ) ( not ( = ?auto_156921 ?auto_156922 ) ) ( not ( = ?auto_156921 ?auto_156920 ) ) ( not ( = ?auto_156921 ?auto_156919 ) ) ( not ( = ?auto_156923 ?auto_156922 ) ) ( not ( = ?auto_156923 ?auto_156920 ) ) ( not ( = ?auto_156923 ?auto_156919 ) ) ( not ( = ?auto_156916 ?auto_156921 ) ) ( not ( = ?auto_156916 ?auto_156923 ) ) ( not ( = ?auto_156917 ?auto_156921 ) ) ( not ( = ?auto_156917 ?auto_156923 ) ) ( not ( = ?auto_156918 ?auto_156921 ) ) ( not ( = ?auto_156918 ?auto_156923 ) ) ( ON ?auto_156918 ?auto_156919 ) ( ON ?auto_156917 ?auto_156918 ) ( ON ?auto_156916 ?auto_156917 ) ( CLEAR ?auto_156916 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_156921 ?auto_156923 ?auto_156922 ?auto_156920 ?auto_156919 ?auto_156918 ?auto_156917 )
      ( MAKE-5PILE ?auto_156916 ?auto_156917 ?auto_156918 ?auto_156919 ?auto_156920 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_156929 - BLOCK
      ?auto_156930 - BLOCK
      ?auto_156931 - BLOCK
      ?auto_156932 - BLOCK
      ?auto_156933 - BLOCK
    )
    :vars
    (
      ?auto_156935 - BLOCK
      ?auto_156936 - BLOCK
      ?auto_156934 - BLOCK
      ?auto_156937 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_156929 ?auto_156930 ) ) ( not ( = ?auto_156929 ?auto_156931 ) ) ( not ( = ?auto_156929 ?auto_156932 ) ) ( not ( = ?auto_156929 ?auto_156933 ) ) ( not ( = ?auto_156930 ?auto_156931 ) ) ( not ( = ?auto_156930 ?auto_156932 ) ) ( not ( = ?auto_156930 ?auto_156933 ) ) ( not ( = ?auto_156931 ?auto_156932 ) ) ( not ( = ?auto_156931 ?auto_156933 ) ) ( not ( = ?auto_156932 ?auto_156933 ) ) ( ON ?auto_156933 ?auto_156935 ) ( not ( = ?auto_156929 ?auto_156935 ) ) ( not ( = ?auto_156930 ?auto_156935 ) ) ( not ( = ?auto_156931 ?auto_156935 ) ) ( not ( = ?auto_156932 ?auto_156935 ) ) ( not ( = ?auto_156933 ?auto_156935 ) ) ( ON ?auto_156932 ?auto_156933 ) ( ON-TABLE ?auto_156936 ) ( ON ?auto_156934 ?auto_156936 ) ( ON ?auto_156935 ?auto_156934 ) ( not ( = ?auto_156936 ?auto_156934 ) ) ( not ( = ?auto_156936 ?auto_156935 ) ) ( not ( = ?auto_156936 ?auto_156933 ) ) ( not ( = ?auto_156936 ?auto_156932 ) ) ( not ( = ?auto_156934 ?auto_156935 ) ) ( not ( = ?auto_156934 ?auto_156933 ) ) ( not ( = ?auto_156934 ?auto_156932 ) ) ( not ( = ?auto_156929 ?auto_156936 ) ) ( not ( = ?auto_156929 ?auto_156934 ) ) ( not ( = ?auto_156930 ?auto_156936 ) ) ( not ( = ?auto_156930 ?auto_156934 ) ) ( not ( = ?auto_156931 ?auto_156936 ) ) ( not ( = ?auto_156931 ?auto_156934 ) ) ( ON ?auto_156931 ?auto_156932 ) ( ON ?auto_156930 ?auto_156931 ) ( CLEAR ?auto_156930 ) ( ON ?auto_156929 ?auto_156937 ) ( CLEAR ?auto_156929 ) ( HAND-EMPTY ) ( not ( = ?auto_156929 ?auto_156937 ) ) ( not ( = ?auto_156930 ?auto_156937 ) ) ( not ( = ?auto_156931 ?auto_156937 ) ) ( not ( = ?auto_156932 ?auto_156937 ) ) ( not ( = ?auto_156933 ?auto_156937 ) ) ( not ( = ?auto_156935 ?auto_156937 ) ) ( not ( = ?auto_156936 ?auto_156937 ) ) ( not ( = ?auto_156934 ?auto_156937 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_156929 ?auto_156937 )
      ( MAKE-5PILE ?auto_156929 ?auto_156930 ?auto_156931 ?auto_156932 ?auto_156933 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_156938 - BLOCK
      ?auto_156939 - BLOCK
      ?auto_156940 - BLOCK
      ?auto_156941 - BLOCK
      ?auto_156942 - BLOCK
    )
    :vars
    (
      ?auto_156943 - BLOCK
      ?auto_156944 - BLOCK
      ?auto_156945 - BLOCK
      ?auto_156946 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_156938 ?auto_156939 ) ) ( not ( = ?auto_156938 ?auto_156940 ) ) ( not ( = ?auto_156938 ?auto_156941 ) ) ( not ( = ?auto_156938 ?auto_156942 ) ) ( not ( = ?auto_156939 ?auto_156940 ) ) ( not ( = ?auto_156939 ?auto_156941 ) ) ( not ( = ?auto_156939 ?auto_156942 ) ) ( not ( = ?auto_156940 ?auto_156941 ) ) ( not ( = ?auto_156940 ?auto_156942 ) ) ( not ( = ?auto_156941 ?auto_156942 ) ) ( ON ?auto_156942 ?auto_156943 ) ( not ( = ?auto_156938 ?auto_156943 ) ) ( not ( = ?auto_156939 ?auto_156943 ) ) ( not ( = ?auto_156940 ?auto_156943 ) ) ( not ( = ?auto_156941 ?auto_156943 ) ) ( not ( = ?auto_156942 ?auto_156943 ) ) ( ON ?auto_156941 ?auto_156942 ) ( ON-TABLE ?auto_156944 ) ( ON ?auto_156945 ?auto_156944 ) ( ON ?auto_156943 ?auto_156945 ) ( not ( = ?auto_156944 ?auto_156945 ) ) ( not ( = ?auto_156944 ?auto_156943 ) ) ( not ( = ?auto_156944 ?auto_156942 ) ) ( not ( = ?auto_156944 ?auto_156941 ) ) ( not ( = ?auto_156945 ?auto_156943 ) ) ( not ( = ?auto_156945 ?auto_156942 ) ) ( not ( = ?auto_156945 ?auto_156941 ) ) ( not ( = ?auto_156938 ?auto_156944 ) ) ( not ( = ?auto_156938 ?auto_156945 ) ) ( not ( = ?auto_156939 ?auto_156944 ) ) ( not ( = ?auto_156939 ?auto_156945 ) ) ( not ( = ?auto_156940 ?auto_156944 ) ) ( not ( = ?auto_156940 ?auto_156945 ) ) ( ON ?auto_156940 ?auto_156941 ) ( ON ?auto_156938 ?auto_156946 ) ( CLEAR ?auto_156938 ) ( not ( = ?auto_156938 ?auto_156946 ) ) ( not ( = ?auto_156939 ?auto_156946 ) ) ( not ( = ?auto_156940 ?auto_156946 ) ) ( not ( = ?auto_156941 ?auto_156946 ) ) ( not ( = ?auto_156942 ?auto_156946 ) ) ( not ( = ?auto_156943 ?auto_156946 ) ) ( not ( = ?auto_156944 ?auto_156946 ) ) ( not ( = ?auto_156945 ?auto_156946 ) ) ( HOLDING ?auto_156939 ) ( CLEAR ?auto_156940 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_156944 ?auto_156945 ?auto_156943 ?auto_156942 ?auto_156941 ?auto_156940 ?auto_156939 )
      ( MAKE-5PILE ?auto_156938 ?auto_156939 ?auto_156940 ?auto_156941 ?auto_156942 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_156947 - BLOCK
      ?auto_156948 - BLOCK
      ?auto_156949 - BLOCK
      ?auto_156950 - BLOCK
      ?auto_156951 - BLOCK
    )
    :vars
    (
      ?auto_156953 - BLOCK
      ?auto_156954 - BLOCK
      ?auto_156952 - BLOCK
      ?auto_156955 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_156947 ?auto_156948 ) ) ( not ( = ?auto_156947 ?auto_156949 ) ) ( not ( = ?auto_156947 ?auto_156950 ) ) ( not ( = ?auto_156947 ?auto_156951 ) ) ( not ( = ?auto_156948 ?auto_156949 ) ) ( not ( = ?auto_156948 ?auto_156950 ) ) ( not ( = ?auto_156948 ?auto_156951 ) ) ( not ( = ?auto_156949 ?auto_156950 ) ) ( not ( = ?auto_156949 ?auto_156951 ) ) ( not ( = ?auto_156950 ?auto_156951 ) ) ( ON ?auto_156951 ?auto_156953 ) ( not ( = ?auto_156947 ?auto_156953 ) ) ( not ( = ?auto_156948 ?auto_156953 ) ) ( not ( = ?auto_156949 ?auto_156953 ) ) ( not ( = ?auto_156950 ?auto_156953 ) ) ( not ( = ?auto_156951 ?auto_156953 ) ) ( ON ?auto_156950 ?auto_156951 ) ( ON-TABLE ?auto_156954 ) ( ON ?auto_156952 ?auto_156954 ) ( ON ?auto_156953 ?auto_156952 ) ( not ( = ?auto_156954 ?auto_156952 ) ) ( not ( = ?auto_156954 ?auto_156953 ) ) ( not ( = ?auto_156954 ?auto_156951 ) ) ( not ( = ?auto_156954 ?auto_156950 ) ) ( not ( = ?auto_156952 ?auto_156953 ) ) ( not ( = ?auto_156952 ?auto_156951 ) ) ( not ( = ?auto_156952 ?auto_156950 ) ) ( not ( = ?auto_156947 ?auto_156954 ) ) ( not ( = ?auto_156947 ?auto_156952 ) ) ( not ( = ?auto_156948 ?auto_156954 ) ) ( not ( = ?auto_156948 ?auto_156952 ) ) ( not ( = ?auto_156949 ?auto_156954 ) ) ( not ( = ?auto_156949 ?auto_156952 ) ) ( ON ?auto_156949 ?auto_156950 ) ( ON ?auto_156947 ?auto_156955 ) ( not ( = ?auto_156947 ?auto_156955 ) ) ( not ( = ?auto_156948 ?auto_156955 ) ) ( not ( = ?auto_156949 ?auto_156955 ) ) ( not ( = ?auto_156950 ?auto_156955 ) ) ( not ( = ?auto_156951 ?auto_156955 ) ) ( not ( = ?auto_156953 ?auto_156955 ) ) ( not ( = ?auto_156954 ?auto_156955 ) ) ( not ( = ?auto_156952 ?auto_156955 ) ) ( CLEAR ?auto_156949 ) ( ON ?auto_156948 ?auto_156947 ) ( CLEAR ?auto_156948 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_156955 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_156955 ?auto_156947 )
      ( MAKE-5PILE ?auto_156947 ?auto_156948 ?auto_156949 ?auto_156950 ?auto_156951 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_156956 - BLOCK
      ?auto_156957 - BLOCK
      ?auto_156958 - BLOCK
      ?auto_156959 - BLOCK
      ?auto_156960 - BLOCK
    )
    :vars
    (
      ?auto_156964 - BLOCK
      ?auto_156962 - BLOCK
      ?auto_156961 - BLOCK
      ?auto_156963 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_156956 ?auto_156957 ) ) ( not ( = ?auto_156956 ?auto_156958 ) ) ( not ( = ?auto_156956 ?auto_156959 ) ) ( not ( = ?auto_156956 ?auto_156960 ) ) ( not ( = ?auto_156957 ?auto_156958 ) ) ( not ( = ?auto_156957 ?auto_156959 ) ) ( not ( = ?auto_156957 ?auto_156960 ) ) ( not ( = ?auto_156958 ?auto_156959 ) ) ( not ( = ?auto_156958 ?auto_156960 ) ) ( not ( = ?auto_156959 ?auto_156960 ) ) ( ON ?auto_156960 ?auto_156964 ) ( not ( = ?auto_156956 ?auto_156964 ) ) ( not ( = ?auto_156957 ?auto_156964 ) ) ( not ( = ?auto_156958 ?auto_156964 ) ) ( not ( = ?auto_156959 ?auto_156964 ) ) ( not ( = ?auto_156960 ?auto_156964 ) ) ( ON ?auto_156959 ?auto_156960 ) ( ON-TABLE ?auto_156962 ) ( ON ?auto_156961 ?auto_156962 ) ( ON ?auto_156964 ?auto_156961 ) ( not ( = ?auto_156962 ?auto_156961 ) ) ( not ( = ?auto_156962 ?auto_156964 ) ) ( not ( = ?auto_156962 ?auto_156960 ) ) ( not ( = ?auto_156962 ?auto_156959 ) ) ( not ( = ?auto_156961 ?auto_156964 ) ) ( not ( = ?auto_156961 ?auto_156960 ) ) ( not ( = ?auto_156961 ?auto_156959 ) ) ( not ( = ?auto_156956 ?auto_156962 ) ) ( not ( = ?auto_156956 ?auto_156961 ) ) ( not ( = ?auto_156957 ?auto_156962 ) ) ( not ( = ?auto_156957 ?auto_156961 ) ) ( not ( = ?auto_156958 ?auto_156962 ) ) ( not ( = ?auto_156958 ?auto_156961 ) ) ( ON ?auto_156956 ?auto_156963 ) ( not ( = ?auto_156956 ?auto_156963 ) ) ( not ( = ?auto_156957 ?auto_156963 ) ) ( not ( = ?auto_156958 ?auto_156963 ) ) ( not ( = ?auto_156959 ?auto_156963 ) ) ( not ( = ?auto_156960 ?auto_156963 ) ) ( not ( = ?auto_156964 ?auto_156963 ) ) ( not ( = ?auto_156962 ?auto_156963 ) ) ( not ( = ?auto_156961 ?auto_156963 ) ) ( ON ?auto_156957 ?auto_156956 ) ( CLEAR ?auto_156957 ) ( ON-TABLE ?auto_156963 ) ( HOLDING ?auto_156958 ) ( CLEAR ?auto_156959 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_156962 ?auto_156961 ?auto_156964 ?auto_156960 ?auto_156959 ?auto_156958 )
      ( MAKE-5PILE ?auto_156956 ?auto_156957 ?auto_156958 ?auto_156959 ?auto_156960 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_156965 - BLOCK
      ?auto_156966 - BLOCK
      ?auto_156967 - BLOCK
      ?auto_156968 - BLOCK
      ?auto_156969 - BLOCK
    )
    :vars
    (
      ?auto_156970 - BLOCK
      ?auto_156972 - BLOCK
      ?auto_156971 - BLOCK
      ?auto_156973 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_156965 ?auto_156966 ) ) ( not ( = ?auto_156965 ?auto_156967 ) ) ( not ( = ?auto_156965 ?auto_156968 ) ) ( not ( = ?auto_156965 ?auto_156969 ) ) ( not ( = ?auto_156966 ?auto_156967 ) ) ( not ( = ?auto_156966 ?auto_156968 ) ) ( not ( = ?auto_156966 ?auto_156969 ) ) ( not ( = ?auto_156967 ?auto_156968 ) ) ( not ( = ?auto_156967 ?auto_156969 ) ) ( not ( = ?auto_156968 ?auto_156969 ) ) ( ON ?auto_156969 ?auto_156970 ) ( not ( = ?auto_156965 ?auto_156970 ) ) ( not ( = ?auto_156966 ?auto_156970 ) ) ( not ( = ?auto_156967 ?auto_156970 ) ) ( not ( = ?auto_156968 ?auto_156970 ) ) ( not ( = ?auto_156969 ?auto_156970 ) ) ( ON ?auto_156968 ?auto_156969 ) ( ON-TABLE ?auto_156972 ) ( ON ?auto_156971 ?auto_156972 ) ( ON ?auto_156970 ?auto_156971 ) ( not ( = ?auto_156972 ?auto_156971 ) ) ( not ( = ?auto_156972 ?auto_156970 ) ) ( not ( = ?auto_156972 ?auto_156969 ) ) ( not ( = ?auto_156972 ?auto_156968 ) ) ( not ( = ?auto_156971 ?auto_156970 ) ) ( not ( = ?auto_156971 ?auto_156969 ) ) ( not ( = ?auto_156971 ?auto_156968 ) ) ( not ( = ?auto_156965 ?auto_156972 ) ) ( not ( = ?auto_156965 ?auto_156971 ) ) ( not ( = ?auto_156966 ?auto_156972 ) ) ( not ( = ?auto_156966 ?auto_156971 ) ) ( not ( = ?auto_156967 ?auto_156972 ) ) ( not ( = ?auto_156967 ?auto_156971 ) ) ( ON ?auto_156965 ?auto_156973 ) ( not ( = ?auto_156965 ?auto_156973 ) ) ( not ( = ?auto_156966 ?auto_156973 ) ) ( not ( = ?auto_156967 ?auto_156973 ) ) ( not ( = ?auto_156968 ?auto_156973 ) ) ( not ( = ?auto_156969 ?auto_156973 ) ) ( not ( = ?auto_156970 ?auto_156973 ) ) ( not ( = ?auto_156972 ?auto_156973 ) ) ( not ( = ?auto_156971 ?auto_156973 ) ) ( ON ?auto_156966 ?auto_156965 ) ( ON-TABLE ?auto_156973 ) ( CLEAR ?auto_156968 ) ( ON ?auto_156967 ?auto_156966 ) ( CLEAR ?auto_156967 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_156973 ?auto_156965 ?auto_156966 )
      ( MAKE-5PILE ?auto_156965 ?auto_156966 ?auto_156967 ?auto_156968 ?auto_156969 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_156974 - BLOCK
      ?auto_156975 - BLOCK
      ?auto_156976 - BLOCK
      ?auto_156977 - BLOCK
      ?auto_156978 - BLOCK
    )
    :vars
    (
      ?auto_156981 - BLOCK
      ?auto_156980 - BLOCK
      ?auto_156982 - BLOCK
      ?auto_156979 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_156974 ?auto_156975 ) ) ( not ( = ?auto_156974 ?auto_156976 ) ) ( not ( = ?auto_156974 ?auto_156977 ) ) ( not ( = ?auto_156974 ?auto_156978 ) ) ( not ( = ?auto_156975 ?auto_156976 ) ) ( not ( = ?auto_156975 ?auto_156977 ) ) ( not ( = ?auto_156975 ?auto_156978 ) ) ( not ( = ?auto_156976 ?auto_156977 ) ) ( not ( = ?auto_156976 ?auto_156978 ) ) ( not ( = ?auto_156977 ?auto_156978 ) ) ( ON ?auto_156978 ?auto_156981 ) ( not ( = ?auto_156974 ?auto_156981 ) ) ( not ( = ?auto_156975 ?auto_156981 ) ) ( not ( = ?auto_156976 ?auto_156981 ) ) ( not ( = ?auto_156977 ?auto_156981 ) ) ( not ( = ?auto_156978 ?auto_156981 ) ) ( ON-TABLE ?auto_156980 ) ( ON ?auto_156982 ?auto_156980 ) ( ON ?auto_156981 ?auto_156982 ) ( not ( = ?auto_156980 ?auto_156982 ) ) ( not ( = ?auto_156980 ?auto_156981 ) ) ( not ( = ?auto_156980 ?auto_156978 ) ) ( not ( = ?auto_156980 ?auto_156977 ) ) ( not ( = ?auto_156982 ?auto_156981 ) ) ( not ( = ?auto_156982 ?auto_156978 ) ) ( not ( = ?auto_156982 ?auto_156977 ) ) ( not ( = ?auto_156974 ?auto_156980 ) ) ( not ( = ?auto_156974 ?auto_156982 ) ) ( not ( = ?auto_156975 ?auto_156980 ) ) ( not ( = ?auto_156975 ?auto_156982 ) ) ( not ( = ?auto_156976 ?auto_156980 ) ) ( not ( = ?auto_156976 ?auto_156982 ) ) ( ON ?auto_156974 ?auto_156979 ) ( not ( = ?auto_156974 ?auto_156979 ) ) ( not ( = ?auto_156975 ?auto_156979 ) ) ( not ( = ?auto_156976 ?auto_156979 ) ) ( not ( = ?auto_156977 ?auto_156979 ) ) ( not ( = ?auto_156978 ?auto_156979 ) ) ( not ( = ?auto_156981 ?auto_156979 ) ) ( not ( = ?auto_156980 ?auto_156979 ) ) ( not ( = ?auto_156982 ?auto_156979 ) ) ( ON ?auto_156975 ?auto_156974 ) ( ON-TABLE ?auto_156979 ) ( ON ?auto_156976 ?auto_156975 ) ( CLEAR ?auto_156976 ) ( HOLDING ?auto_156977 ) ( CLEAR ?auto_156978 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_156980 ?auto_156982 ?auto_156981 ?auto_156978 ?auto_156977 )
      ( MAKE-5PILE ?auto_156974 ?auto_156975 ?auto_156976 ?auto_156977 ?auto_156978 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_156983 - BLOCK
      ?auto_156984 - BLOCK
      ?auto_156985 - BLOCK
      ?auto_156986 - BLOCK
      ?auto_156987 - BLOCK
    )
    :vars
    (
      ?auto_156990 - BLOCK
      ?auto_156988 - BLOCK
      ?auto_156989 - BLOCK
      ?auto_156991 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_156983 ?auto_156984 ) ) ( not ( = ?auto_156983 ?auto_156985 ) ) ( not ( = ?auto_156983 ?auto_156986 ) ) ( not ( = ?auto_156983 ?auto_156987 ) ) ( not ( = ?auto_156984 ?auto_156985 ) ) ( not ( = ?auto_156984 ?auto_156986 ) ) ( not ( = ?auto_156984 ?auto_156987 ) ) ( not ( = ?auto_156985 ?auto_156986 ) ) ( not ( = ?auto_156985 ?auto_156987 ) ) ( not ( = ?auto_156986 ?auto_156987 ) ) ( ON ?auto_156987 ?auto_156990 ) ( not ( = ?auto_156983 ?auto_156990 ) ) ( not ( = ?auto_156984 ?auto_156990 ) ) ( not ( = ?auto_156985 ?auto_156990 ) ) ( not ( = ?auto_156986 ?auto_156990 ) ) ( not ( = ?auto_156987 ?auto_156990 ) ) ( ON-TABLE ?auto_156988 ) ( ON ?auto_156989 ?auto_156988 ) ( ON ?auto_156990 ?auto_156989 ) ( not ( = ?auto_156988 ?auto_156989 ) ) ( not ( = ?auto_156988 ?auto_156990 ) ) ( not ( = ?auto_156988 ?auto_156987 ) ) ( not ( = ?auto_156988 ?auto_156986 ) ) ( not ( = ?auto_156989 ?auto_156990 ) ) ( not ( = ?auto_156989 ?auto_156987 ) ) ( not ( = ?auto_156989 ?auto_156986 ) ) ( not ( = ?auto_156983 ?auto_156988 ) ) ( not ( = ?auto_156983 ?auto_156989 ) ) ( not ( = ?auto_156984 ?auto_156988 ) ) ( not ( = ?auto_156984 ?auto_156989 ) ) ( not ( = ?auto_156985 ?auto_156988 ) ) ( not ( = ?auto_156985 ?auto_156989 ) ) ( ON ?auto_156983 ?auto_156991 ) ( not ( = ?auto_156983 ?auto_156991 ) ) ( not ( = ?auto_156984 ?auto_156991 ) ) ( not ( = ?auto_156985 ?auto_156991 ) ) ( not ( = ?auto_156986 ?auto_156991 ) ) ( not ( = ?auto_156987 ?auto_156991 ) ) ( not ( = ?auto_156990 ?auto_156991 ) ) ( not ( = ?auto_156988 ?auto_156991 ) ) ( not ( = ?auto_156989 ?auto_156991 ) ) ( ON ?auto_156984 ?auto_156983 ) ( ON-TABLE ?auto_156991 ) ( ON ?auto_156985 ?auto_156984 ) ( CLEAR ?auto_156987 ) ( ON ?auto_156986 ?auto_156985 ) ( CLEAR ?auto_156986 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_156991 ?auto_156983 ?auto_156984 ?auto_156985 )
      ( MAKE-5PILE ?auto_156983 ?auto_156984 ?auto_156985 ?auto_156986 ?auto_156987 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_156992 - BLOCK
      ?auto_156993 - BLOCK
      ?auto_156994 - BLOCK
      ?auto_156995 - BLOCK
      ?auto_156996 - BLOCK
    )
    :vars
    (
      ?auto_156998 - BLOCK
      ?auto_156999 - BLOCK
      ?auto_156997 - BLOCK
      ?auto_157000 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_156992 ?auto_156993 ) ) ( not ( = ?auto_156992 ?auto_156994 ) ) ( not ( = ?auto_156992 ?auto_156995 ) ) ( not ( = ?auto_156992 ?auto_156996 ) ) ( not ( = ?auto_156993 ?auto_156994 ) ) ( not ( = ?auto_156993 ?auto_156995 ) ) ( not ( = ?auto_156993 ?auto_156996 ) ) ( not ( = ?auto_156994 ?auto_156995 ) ) ( not ( = ?auto_156994 ?auto_156996 ) ) ( not ( = ?auto_156995 ?auto_156996 ) ) ( not ( = ?auto_156992 ?auto_156998 ) ) ( not ( = ?auto_156993 ?auto_156998 ) ) ( not ( = ?auto_156994 ?auto_156998 ) ) ( not ( = ?auto_156995 ?auto_156998 ) ) ( not ( = ?auto_156996 ?auto_156998 ) ) ( ON-TABLE ?auto_156999 ) ( ON ?auto_156997 ?auto_156999 ) ( ON ?auto_156998 ?auto_156997 ) ( not ( = ?auto_156999 ?auto_156997 ) ) ( not ( = ?auto_156999 ?auto_156998 ) ) ( not ( = ?auto_156999 ?auto_156996 ) ) ( not ( = ?auto_156999 ?auto_156995 ) ) ( not ( = ?auto_156997 ?auto_156998 ) ) ( not ( = ?auto_156997 ?auto_156996 ) ) ( not ( = ?auto_156997 ?auto_156995 ) ) ( not ( = ?auto_156992 ?auto_156999 ) ) ( not ( = ?auto_156992 ?auto_156997 ) ) ( not ( = ?auto_156993 ?auto_156999 ) ) ( not ( = ?auto_156993 ?auto_156997 ) ) ( not ( = ?auto_156994 ?auto_156999 ) ) ( not ( = ?auto_156994 ?auto_156997 ) ) ( ON ?auto_156992 ?auto_157000 ) ( not ( = ?auto_156992 ?auto_157000 ) ) ( not ( = ?auto_156993 ?auto_157000 ) ) ( not ( = ?auto_156994 ?auto_157000 ) ) ( not ( = ?auto_156995 ?auto_157000 ) ) ( not ( = ?auto_156996 ?auto_157000 ) ) ( not ( = ?auto_156998 ?auto_157000 ) ) ( not ( = ?auto_156999 ?auto_157000 ) ) ( not ( = ?auto_156997 ?auto_157000 ) ) ( ON ?auto_156993 ?auto_156992 ) ( ON-TABLE ?auto_157000 ) ( ON ?auto_156994 ?auto_156993 ) ( ON ?auto_156995 ?auto_156994 ) ( CLEAR ?auto_156995 ) ( HOLDING ?auto_156996 ) ( CLEAR ?auto_156998 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_156999 ?auto_156997 ?auto_156998 ?auto_156996 )
      ( MAKE-5PILE ?auto_156992 ?auto_156993 ?auto_156994 ?auto_156995 ?auto_156996 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_157001 - BLOCK
      ?auto_157002 - BLOCK
      ?auto_157003 - BLOCK
      ?auto_157004 - BLOCK
      ?auto_157005 - BLOCK
    )
    :vars
    (
      ?auto_157008 - BLOCK
      ?auto_157006 - BLOCK
      ?auto_157007 - BLOCK
      ?auto_157009 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_157001 ?auto_157002 ) ) ( not ( = ?auto_157001 ?auto_157003 ) ) ( not ( = ?auto_157001 ?auto_157004 ) ) ( not ( = ?auto_157001 ?auto_157005 ) ) ( not ( = ?auto_157002 ?auto_157003 ) ) ( not ( = ?auto_157002 ?auto_157004 ) ) ( not ( = ?auto_157002 ?auto_157005 ) ) ( not ( = ?auto_157003 ?auto_157004 ) ) ( not ( = ?auto_157003 ?auto_157005 ) ) ( not ( = ?auto_157004 ?auto_157005 ) ) ( not ( = ?auto_157001 ?auto_157008 ) ) ( not ( = ?auto_157002 ?auto_157008 ) ) ( not ( = ?auto_157003 ?auto_157008 ) ) ( not ( = ?auto_157004 ?auto_157008 ) ) ( not ( = ?auto_157005 ?auto_157008 ) ) ( ON-TABLE ?auto_157006 ) ( ON ?auto_157007 ?auto_157006 ) ( ON ?auto_157008 ?auto_157007 ) ( not ( = ?auto_157006 ?auto_157007 ) ) ( not ( = ?auto_157006 ?auto_157008 ) ) ( not ( = ?auto_157006 ?auto_157005 ) ) ( not ( = ?auto_157006 ?auto_157004 ) ) ( not ( = ?auto_157007 ?auto_157008 ) ) ( not ( = ?auto_157007 ?auto_157005 ) ) ( not ( = ?auto_157007 ?auto_157004 ) ) ( not ( = ?auto_157001 ?auto_157006 ) ) ( not ( = ?auto_157001 ?auto_157007 ) ) ( not ( = ?auto_157002 ?auto_157006 ) ) ( not ( = ?auto_157002 ?auto_157007 ) ) ( not ( = ?auto_157003 ?auto_157006 ) ) ( not ( = ?auto_157003 ?auto_157007 ) ) ( ON ?auto_157001 ?auto_157009 ) ( not ( = ?auto_157001 ?auto_157009 ) ) ( not ( = ?auto_157002 ?auto_157009 ) ) ( not ( = ?auto_157003 ?auto_157009 ) ) ( not ( = ?auto_157004 ?auto_157009 ) ) ( not ( = ?auto_157005 ?auto_157009 ) ) ( not ( = ?auto_157008 ?auto_157009 ) ) ( not ( = ?auto_157006 ?auto_157009 ) ) ( not ( = ?auto_157007 ?auto_157009 ) ) ( ON ?auto_157002 ?auto_157001 ) ( ON-TABLE ?auto_157009 ) ( ON ?auto_157003 ?auto_157002 ) ( ON ?auto_157004 ?auto_157003 ) ( CLEAR ?auto_157008 ) ( ON ?auto_157005 ?auto_157004 ) ( CLEAR ?auto_157005 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_157009 ?auto_157001 ?auto_157002 ?auto_157003 ?auto_157004 )
      ( MAKE-5PILE ?auto_157001 ?auto_157002 ?auto_157003 ?auto_157004 ?auto_157005 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_157010 - BLOCK
      ?auto_157011 - BLOCK
      ?auto_157012 - BLOCK
      ?auto_157013 - BLOCK
      ?auto_157014 - BLOCK
    )
    :vars
    (
      ?auto_157017 - BLOCK
      ?auto_157015 - BLOCK
      ?auto_157018 - BLOCK
      ?auto_157016 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_157010 ?auto_157011 ) ) ( not ( = ?auto_157010 ?auto_157012 ) ) ( not ( = ?auto_157010 ?auto_157013 ) ) ( not ( = ?auto_157010 ?auto_157014 ) ) ( not ( = ?auto_157011 ?auto_157012 ) ) ( not ( = ?auto_157011 ?auto_157013 ) ) ( not ( = ?auto_157011 ?auto_157014 ) ) ( not ( = ?auto_157012 ?auto_157013 ) ) ( not ( = ?auto_157012 ?auto_157014 ) ) ( not ( = ?auto_157013 ?auto_157014 ) ) ( not ( = ?auto_157010 ?auto_157017 ) ) ( not ( = ?auto_157011 ?auto_157017 ) ) ( not ( = ?auto_157012 ?auto_157017 ) ) ( not ( = ?auto_157013 ?auto_157017 ) ) ( not ( = ?auto_157014 ?auto_157017 ) ) ( ON-TABLE ?auto_157015 ) ( ON ?auto_157018 ?auto_157015 ) ( not ( = ?auto_157015 ?auto_157018 ) ) ( not ( = ?auto_157015 ?auto_157017 ) ) ( not ( = ?auto_157015 ?auto_157014 ) ) ( not ( = ?auto_157015 ?auto_157013 ) ) ( not ( = ?auto_157018 ?auto_157017 ) ) ( not ( = ?auto_157018 ?auto_157014 ) ) ( not ( = ?auto_157018 ?auto_157013 ) ) ( not ( = ?auto_157010 ?auto_157015 ) ) ( not ( = ?auto_157010 ?auto_157018 ) ) ( not ( = ?auto_157011 ?auto_157015 ) ) ( not ( = ?auto_157011 ?auto_157018 ) ) ( not ( = ?auto_157012 ?auto_157015 ) ) ( not ( = ?auto_157012 ?auto_157018 ) ) ( ON ?auto_157010 ?auto_157016 ) ( not ( = ?auto_157010 ?auto_157016 ) ) ( not ( = ?auto_157011 ?auto_157016 ) ) ( not ( = ?auto_157012 ?auto_157016 ) ) ( not ( = ?auto_157013 ?auto_157016 ) ) ( not ( = ?auto_157014 ?auto_157016 ) ) ( not ( = ?auto_157017 ?auto_157016 ) ) ( not ( = ?auto_157015 ?auto_157016 ) ) ( not ( = ?auto_157018 ?auto_157016 ) ) ( ON ?auto_157011 ?auto_157010 ) ( ON-TABLE ?auto_157016 ) ( ON ?auto_157012 ?auto_157011 ) ( ON ?auto_157013 ?auto_157012 ) ( ON ?auto_157014 ?auto_157013 ) ( CLEAR ?auto_157014 ) ( HOLDING ?auto_157017 ) ( CLEAR ?auto_157018 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_157015 ?auto_157018 ?auto_157017 )
      ( MAKE-5PILE ?auto_157010 ?auto_157011 ?auto_157012 ?auto_157013 ?auto_157014 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_157019 - BLOCK
      ?auto_157020 - BLOCK
      ?auto_157021 - BLOCK
      ?auto_157022 - BLOCK
      ?auto_157023 - BLOCK
    )
    :vars
    (
      ?auto_157024 - BLOCK
      ?auto_157025 - BLOCK
      ?auto_157026 - BLOCK
      ?auto_157027 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_157019 ?auto_157020 ) ) ( not ( = ?auto_157019 ?auto_157021 ) ) ( not ( = ?auto_157019 ?auto_157022 ) ) ( not ( = ?auto_157019 ?auto_157023 ) ) ( not ( = ?auto_157020 ?auto_157021 ) ) ( not ( = ?auto_157020 ?auto_157022 ) ) ( not ( = ?auto_157020 ?auto_157023 ) ) ( not ( = ?auto_157021 ?auto_157022 ) ) ( not ( = ?auto_157021 ?auto_157023 ) ) ( not ( = ?auto_157022 ?auto_157023 ) ) ( not ( = ?auto_157019 ?auto_157024 ) ) ( not ( = ?auto_157020 ?auto_157024 ) ) ( not ( = ?auto_157021 ?auto_157024 ) ) ( not ( = ?auto_157022 ?auto_157024 ) ) ( not ( = ?auto_157023 ?auto_157024 ) ) ( ON-TABLE ?auto_157025 ) ( ON ?auto_157026 ?auto_157025 ) ( not ( = ?auto_157025 ?auto_157026 ) ) ( not ( = ?auto_157025 ?auto_157024 ) ) ( not ( = ?auto_157025 ?auto_157023 ) ) ( not ( = ?auto_157025 ?auto_157022 ) ) ( not ( = ?auto_157026 ?auto_157024 ) ) ( not ( = ?auto_157026 ?auto_157023 ) ) ( not ( = ?auto_157026 ?auto_157022 ) ) ( not ( = ?auto_157019 ?auto_157025 ) ) ( not ( = ?auto_157019 ?auto_157026 ) ) ( not ( = ?auto_157020 ?auto_157025 ) ) ( not ( = ?auto_157020 ?auto_157026 ) ) ( not ( = ?auto_157021 ?auto_157025 ) ) ( not ( = ?auto_157021 ?auto_157026 ) ) ( ON ?auto_157019 ?auto_157027 ) ( not ( = ?auto_157019 ?auto_157027 ) ) ( not ( = ?auto_157020 ?auto_157027 ) ) ( not ( = ?auto_157021 ?auto_157027 ) ) ( not ( = ?auto_157022 ?auto_157027 ) ) ( not ( = ?auto_157023 ?auto_157027 ) ) ( not ( = ?auto_157024 ?auto_157027 ) ) ( not ( = ?auto_157025 ?auto_157027 ) ) ( not ( = ?auto_157026 ?auto_157027 ) ) ( ON ?auto_157020 ?auto_157019 ) ( ON-TABLE ?auto_157027 ) ( ON ?auto_157021 ?auto_157020 ) ( ON ?auto_157022 ?auto_157021 ) ( ON ?auto_157023 ?auto_157022 ) ( CLEAR ?auto_157026 ) ( ON ?auto_157024 ?auto_157023 ) ( CLEAR ?auto_157024 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_157027 ?auto_157019 ?auto_157020 ?auto_157021 ?auto_157022 ?auto_157023 )
      ( MAKE-5PILE ?auto_157019 ?auto_157020 ?auto_157021 ?auto_157022 ?auto_157023 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_157028 - BLOCK
      ?auto_157029 - BLOCK
      ?auto_157030 - BLOCK
      ?auto_157031 - BLOCK
      ?auto_157032 - BLOCK
    )
    :vars
    (
      ?auto_157034 - BLOCK
      ?auto_157036 - BLOCK
      ?auto_157033 - BLOCK
      ?auto_157035 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_157028 ?auto_157029 ) ) ( not ( = ?auto_157028 ?auto_157030 ) ) ( not ( = ?auto_157028 ?auto_157031 ) ) ( not ( = ?auto_157028 ?auto_157032 ) ) ( not ( = ?auto_157029 ?auto_157030 ) ) ( not ( = ?auto_157029 ?auto_157031 ) ) ( not ( = ?auto_157029 ?auto_157032 ) ) ( not ( = ?auto_157030 ?auto_157031 ) ) ( not ( = ?auto_157030 ?auto_157032 ) ) ( not ( = ?auto_157031 ?auto_157032 ) ) ( not ( = ?auto_157028 ?auto_157034 ) ) ( not ( = ?auto_157029 ?auto_157034 ) ) ( not ( = ?auto_157030 ?auto_157034 ) ) ( not ( = ?auto_157031 ?auto_157034 ) ) ( not ( = ?auto_157032 ?auto_157034 ) ) ( ON-TABLE ?auto_157036 ) ( not ( = ?auto_157036 ?auto_157033 ) ) ( not ( = ?auto_157036 ?auto_157034 ) ) ( not ( = ?auto_157036 ?auto_157032 ) ) ( not ( = ?auto_157036 ?auto_157031 ) ) ( not ( = ?auto_157033 ?auto_157034 ) ) ( not ( = ?auto_157033 ?auto_157032 ) ) ( not ( = ?auto_157033 ?auto_157031 ) ) ( not ( = ?auto_157028 ?auto_157036 ) ) ( not ( = ?auto_157028 ?auto_157033 ) ) ( not ( = ?auto_157029 ?auto_157036 ) ) ( not ( = ?auto_157029 ?auto_157033 ) ) ( not ( = ?auto_157030 ?auto_157036 ) ) ( not ( = ?auto_157030 ?auto_157033 ) ) ( ON ?auto_157028 ?auto_157035 ) ( not ( = ?auto_157028 ?auto_157035 ) ) ( not ( = ?auto_157029 ?auto_157035 ) ) ( not ( = ?auto_157030 ?auto_157035 ) ) ( not ( = ?auto_157031 ?auto_157035 ) ) ( not ( = ?auto_157032 ?auto_157035 ) ) ( not ( = ?auto_157034 ?auto_157035 ) ) ( not ( = ?auto_157036 ?auto_157035 ) ) ( not ( = ?auto_157033 ?auto_157035 ) ) ( ON ?auto_157029 ?auto_157028 ) ( ON-TABLE ?auto_157035 ) ( ON ?auto_157030 ?auto_157029 ) ( ON ?auto_157031 ?auto_157030 ) ( ON ?auto_157032 ?auto_157031 ) ( ON ?auto_157034 ?auto_157032 ) ( CLEAR ?auto_157034 ) ( HOLDING ?auto_157033 ) ( CLEAR ?auto_157036 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_157036 ?auto_157033 )
      ( MAKE-5PILE ?auto_157028 ?auto_157029 ?auto_157030 ?auto_157031 ?auto_157032 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_157037 - BLOCK
      ?auto_157038 - BLOCK
      ?auto_157039 - BLOCK
      ?auto_157040 - BLOCK
      ?auto_157041 - BLOCK
    )
    :vars
    (
      ?auto_157045 - BLOCK
      ?auto_157043 - BLOCK
      ?auto_157044 - BLOCK
      ?auto_157042 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_157037 ?auto_157038 ) ) ( not ( = ?auto_157037 ?auto_157039 ) ) ( not ( = ?auto_157037 ?auto_157040 ) ) ( not ( = ?auto_157037 ?auto_157041 ) ) ( not ( = ?auto_157038 ?auto_157039 ) ) ( not ( = ?auto_157038 ?auto_157040 ) ) ( not ( = ?auto_157038 ?auto_157041 ) ) ( not ( = ?auto_157039 ?auto_157040 ) ) ( not ( = ?auto_157039 ?auto_157041 ) ) ( not ( = ?auto_157040 ?auto_157041 ) ) ( not ( = ?auto_157037 ?auto_157045 ) ) ( not ( = ?auto_157038 ?auto_157045 ) ) ( not ( = ?auto_157039 ?auto_157045 ) ) ( not ( = ?auto_157040 ?auto_157045 ) ) ( not ( = ?auto_157041 ?auto_157045 ) ) ( ON-TABLE ?auto_157043 ) ( not ( = ?auto_157043 ?auto_157044 ) ) ( not ( = ?auto_157043 ?auto_157045 ) ) ( not ( = ?auto_157043 ?auto_157041 ) ) ( not ( = ?auto_157043 ?auto_157040 ) ) ( not ( = ?auto_157044 ?auto_157045 ) ) ( not ( = ?auto_157044 ?auto_157041 ) ) ( not ( = ?auto_157044 ?auto_157040 ) ) ( not ( = ?auto_157037 ?auto_157043 ) ) ( not ( = ?auto_157037 ?auto_157044 ) ) ( not ( = ?auto_157038 ?auto_157043 ) ) ( not ( = ?auto_157038 ?auto_157044 ) ) ( not ( = ?auto_157039 ?auto_157043 ) ) ( not ( = ?auto_157039 ?auto_157044 ) ) ( ON ?auto_157037 ?auto_157042 ) ( not ( = ?auto_157037 ?auto_157042 ) ) ( not ( = ?auto_157038 ?auto_157042 ) ) ( not ( = ?auto_157039 ?auto_157042 ) ) ( not ( = ?auto_157040 ?auto_157042 ) ) ( not ( = ?auto_157041 ?auto_157042 ) ) ( not ( = ?auto_157045 ?auto_157042 ) ) ( not ( = ?auto_157043 ?auto_157042 ) ) ( not ( = ?auto_157044 ?auto_157042 ) ) ( ON ?auto_157038 ?auto_157037 ) ( ON-TABLE ?auto_157042 ) ( ON ?auto_157039 ?auto_157038 ) ( ON ?auto_157040 ?auto_157039 ) ( ON ?auto_157041 ?auto_157040 ) ( ON ?auto_157045 ?auto_157041 ) ( CLEAR ?auto_157043 ) ( ON ?auto_157044 ?auto_157045 ) ( CLEAR ?auto_157044 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_157042 ?auto_157037 ?auto_157038 ?auto_157039 ?auto_157040 ?auto_157041 ?auto_157045 )
      ( MAKE-5PILE ?auto_157037 ?auto_157038 ?auto_157039 ?auto_157040 ?auto_157041 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_157046 - BLOCK
      ?auto_157047 - BLOCK
      ?auto_157048 - BLOCK
      ?auto_157049 - BLOCK
      ?auto_157050 - BLOCK
    )
    :vars
    (
      ?auto_157053 - BLOCK
      ?auto_157052 - BLOCK
      ?auto_157051 - BLOCK
      ?auto_157054 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_157046 ?auto_157047 ) ) ( not ( = ?auto_157046 ?auto_157048 ) ) ( not ( = ?auto_157046 ?auto_157049 ) ) ( not ( = ?auto_157046 ?auto_157050 ) ) ( not ( = ?auto_157047 ?auto_157048 ) ) ( not ( = ?auto_157047 ?auto_157049 ) ) ( not ( = ?auto_157047 ?auto_157050 ) ) ( not ( = ?auto_157048 ?auto_157049 ) ) ( not ( = ?auto_157048 ?auto_157050 ) ) ( not ( = ?auto_157049 ?auto_157050 ) ) ( not ( = ?auto_157046 ?auto_157053 ) ) ( not ( = ?auto_157047 ?auto_157053 ) ) ( not ( = ?auto_157048 ?auto_157053 ) ) ( not ( = ?auto_157049 ?auto_157053 ) ) ( not ( = ?auto_157050 ?auto_157053 ) ) ( not ( = ?auto_157052 ?auto_157051 ) ) ( not ( = ?auto_157052 ?auto_157053 ) ) ( not ( = ?auto_157052 ?auto_157050 ) ) ( not ( = ?auto_157052 ?auto_157049 ) ) ( not ( = ?auto_157051 ?auto_157053 ) ) ( not ( = ?auto_157051 ?auto_157050 ) ) ( not ( = ?auto_157051 ?auto_157049 ) ) ( not ( = ?auto_157046 ?auto_157052 ) ) ( not ( = ?auto_157046 ?auto_157051 ) ) ( not ( = ?auto_157047 ?auto_157052 ) ) ( not ( = ?auto_157047 ?auto_157051 ) ) ( not ( = ?auto_157048 ?auto_157052 ) ) ( not ( = ?auto_157048 ?auto_157051 ) ) ( ON ?auto_157046 ?auto_157054 ) ( not ( = ?auto_157046 ?auto_157054 ) ) ( not ( = ?auto_157047 ?auto_157054 ) ) ( not ( = ?auto_157048 ?auto_157054 ) ) ( not ( = ?auto_157049 ?auto_157054 ) ) ( not ( = ?auto_157050 ?auto_157054 ) ) ( not ( = ?auto_157053 ?auto_157054 ) ) ( not ( = ?auto_157052 ?auto_157054 ) ) ( not ( = ?auto_157051 ?auto_157054 ) ) ( ON ?auto_157047 ?auto_157046 ) ( ON-TABLE ?auto_157054 ) ( ON ?auto_157048 ?auto_157047 ) ( ON ?auto_157049 ?auto_157048 ) ( ON ?auto_157050 ?auto_157049 ) ( ON ?auto_157053 ?auto_157050 ) ( ON ?auto_157051 ?auto_157053 ) ( CLEAR ?auto_157051 ) ( HOLDING ?auto_157052 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_157052 )
      ( MAKE-5PILE ?auto_157046 ?auto_157047 ?auto_157048 ?auto_157049 ?auto_157050 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_157055 - BLOCK
      ?auto_157056 - BLOCK
      ?auto_157057 - BLOCK
      ?auto_157058 - BLOCK
      ?auto_157059 - BLOCK
    )
    :vars
    (
      ?auto_157062 - BLOCK
      ?auto_157061 - BLOCK
      ?auto_157060 - BLOCK
      ?auto_157063 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_157055 ?auto_157056 ) ) ( not ( = ?auto_157055 ?auto_157057 ) ) ( not ( = ?auto_157055 ?auto_157058 ) ) ( not ( = ?auto_157055 ?auto_157059 ) ) ( not ( = ?auto_157056 ?auto_157057 ) ) ( not ( = ?auto_157056 ?auto_157058 ) ) ( not ( = ?auto_157056 ?auto_157059 ) ) ( not ( = ?auto_157057 ?auto_157058 ) ) ( not ( = ?auto_157057 ?auto_157059 ) ) ( not ( = ?auto_157058 ?auto_157059 ) ) ( not ( = ?auto_157055 ?auto_157062 ) ) ( not ( = ?auto_157056 ?auto_157062 ) ) ( not ( = ?auto_157057 ?auto_157062 ) ) ( not ( = ?auto_157058 ?auto_157062 ) ) ( not ( = ?auto_157059 ?auto_157062 ) ) ( not ( = ?auto_157061 ?auto_157060 ) ) ( not ( = ?auto_157061 ?auto_157062 ) ) ( not ( = ?auto_157061 ?auto_157059 ) ) ( not ( = ?auto_157061 ?auto_157058 ) ) ( not ( = ?auto_157060 ?auto_157062 ) ) ( not ( = ?auto_157060 ?auto_157059 ) ) ( not ( = ?auto_157060 ?auto_157058 ) ) ( not ( = ?auto_157055 ?auto_157061 ) ) ( not ( = ?auto_157055 ?auto_157060 ) ) ( not ( = ?auto_157056 ?auto_157061 ) ) ( not ( = ?auto_157056 ?auto_157060 ) ) ( not ( = ?auto_157057 ?auto_157061 ) ) ( not ( = ?auto_157057 ?auto_157060 ) ) ( ON ?auto_157055 ?auto_157063 ) ( not ( = ?auto_157055 ?auto_157063 ) ) ( not ( = ?auto_157056 ?auto_157063 ) ) ( not ( = ?auto_157057 ?auto_157063 ) ) ( not ( = ?auto_157058 ?auto_157063 ) ) ( not ( = ?auto_157059 ?auto_157063 ) ) ( not ( = ?auto_157062 ?auto_157063 ) ) ( not ( = ?auto_157061 ?auto_157063 ) ) ( not ( = ?auto_157060 ?auto_157063 ) ) ( ON ?auto_157056 ?auto_157055 ) ( ON-TABLE ?auto_157063 ) ( ON ?auto_157057 ?auto_157056 ) ( ON ?auto_157058 ?auto_157057 ) ( ON ?auto_157059 ?auto_157058 ) ( ON ?auto_157062 ?auto_157059 ) ( ON ?auto_157060 ?auto_157062 ) ( ON ?auto_157061 ?auto_157060 ) ( CLEAR ?auto_157061 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_157063 ?auto_157055 ?auto_157056 ?auto_157057 ?auto_157058 ?auto_157059 ?auto_157062 ?auto_157060 )
      ( MAKE-5PILE ?auto_157055 ?auto_157056 ?auto_157057 ?auto_157058 ?auto_157059 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_157079 - BLOCK
      ?auto_157080 - BLOCK
    )
    :vars
    (
      ?auto_157083 - BLOCK
      ?auto_157081 - BLOCK
      ?auto_157082 - BLOCK
      ?auto_157085 - BLOCK
      ?auto_157084 - BLOCK
      ?auto_157086 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_157083 ?auto_157080 ) ( ON-TABLE ?auto_157079 ) ( ON ?auto_157080 ?auto_157079 ) ( not ( = ?auto_157079 ?auto_157080 ) ) ( not ( = ?auto_157079 ?auto_157083 ) ) ( not ( = ?auto_157080 ?auto_157083 ) ) ( not ( = ?auto_157079 ?auto_157081 ) ) ( not ( = ?auto_157079 ?auto_157082 ) ) ( not ( = ?auto_157080 ?auto_157081 ) ) ( not ( = ?auto_157080 ?auto_157082 ) ) ( not ( = ?auto_157083 ?auto_157081 ) ) ( not ( = ?auto_157083 ?auto_157082 ) ) ( not ( = ?auto_157081 ?auto_157082 ) ) ( ON ?auto_157081 ?auto_157083 ) ( CLEAR ?auto_157081 ) ( HOLDING ?auto_157082 ) ( CLEAR ?auto_157085 ) ( ON-TABLE ?auto_157084 ) ( ON ?auto_157086 ?auto_157084 ) ( ON ?auto_157085 ?auto_157086 ) ( not ( = ?auto_157084 ?auto_157086 ) ) ( not ( = ?auto_157084 ?auto_157085 ) ) ( not ( = ?auto_157084 ?auto_157082 ) ) ( not ( = ?auto_157086 ?auto_157085 ) ) ( not ( = ?auto_157086 ?auto_157082 ) ) ( not ( = ?auto_157085 ?auto_157082 ) ) ( not ( = ?auto_157079 ?auto_157085 ) ) ( not ( = ?auto_157079 ?auto_157084 ) ) ( not ( = ?auto_157079 ?auto_157086 ) ) ( not ( = ?auto_157080 ?auto_157085 ) ) ( not ( = ?auto_157080 ?auto_157084 ) ) ( not ( = ?auto_157080 ?auto_157086 ) ) ( not ( = ?auto_157083 ?auto_157085 ) ) ( not ( = ?auto_157083 ?auto_157084 ) ) ( not ( = ?auto_157083 ?auto_157086 ) ) ( not ( = ?auto_157081 ?auto_157085 ) ) ( not ( = ?auto_157081 ?auto_157084 ) ) ( not ( = ?auto_157081 ?auto_157086 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_157084 ?auto_157086 ?auto_157085 ?auto_157082 )
      ( MAKE-2PILE ?auto_157079 ?auto_157080 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_157087 - BLOCK
      ?auto_157088 - BLOCK
    )
    :vars
    (
      ?auto_157093 - BLOCK
      ?auto_157091 - BLOCK
      ?auto_157090 - BLOCK
      ?auto_157089 - BLOCK
      ?auto_157094 - BLOCK
      ?auto_157092 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_157093 ?auto_157088 ) ( ON-TABLE ?auto_157087 ) ( ON ?auto_157088 ?auto_157087 ) ( not ( = ?auto_157087 ?auto_157088 ) ) ( not ( = ?auto_157087 ?auto_157093 ) ) ( not ( = ?auto_157088 ?auto_157093 ) ) ( not ( = ?auto_157087 ?auto_157091 ) ) ( not ( = ?auto_157087 ?auto_157090 ) ) ( not ( = ?auto_157088 ?auto_157091 ) ) ( not ( = ?auto_157088 ?auto_157090 ) ) ( not ( = ?auto_157093 ?auto_157091 ) ) ( not ( = ?auto_157093 ?auto_157090 ) ) ( not ( = ?auto_157091 ?auto_157090 ) ) ( ON ?auto_157091 ?auto_157093 ) ( CLEAR ?auto_157089 ) ( ON-TABLE ?auto_157094 ) ( ON ?auto_157092 ?auto_157094 ) ( ON ?auto_157089 ?auto_157092 ) ( not ( = ?auto_157094 ?auto_157092 ) ) ( not ( = ?auto_157094 ?auto_157089 ) ) ( not ( = ?auto_157094 ?auto_157090 ) ) ( not ( = ?auto_157092 ?auto_157089 ) ) ( not ( = ?auto_157092 ?auto_157090 ) ) ( not ( = ?auto_157089 ?auto_157090 ) ) ( not ( = ?auto_157087 ?auto_157089 ) ) ( not ( = ?auto_157087 ?auto_157094 ) ) ( not ( = ?auto_157087 ?auto_157092 ) ) ( not ( = ?auto_157088 ?auto_157089 ) ) ( not ( = ?auto_157088 ?auto_157094 ) ) ( not ( = ?auto_157088 ?auto_157092 ) ) ( not ( = ?auto_157093 ?auto_157089 ) ) ( not ( = ?auto_157093 ?auto_157094 ) ) ( not ( = ?auto_157093 ?auto_157092 ) ) ( not ( = ?auto_157091 ?auto_157089 ) ) ( not ( = ?auto_157091 ?auto_157094 ) ) ( not ( = ?auto_157091 ?auto_157092 ) ) ( ON ?auto_157090 ?auto_157091 ) ( CLEAR ?auto_157090 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_157087 ?auto_157088 ?auto_157093 ?auto_157091 )
      ( MAKE-2PILE ?auto_157087 ?auto_157088 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_157095 - BLOCK
      ?auto_157096 - BLOCK
    )
    :vars
    (
      ?auto_157101 - BLOCK
      ?auto_157102 - BLOCK
      ?auto_157098 - BLOCK
      ?auto_157097 - BLOCK
      ?auto_157099 - BLOCK
      ?auto_157100 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_157101 ?auto_157096 ) ( ON-TABLE ?auto_157095 ) ( ON ?auto_157096 ?auto_157095 ) ( not ( = ?auto_157095 ?auto_157096 ) ) ( not ( = ?auto_157095 ?auto_157101 ) ) ( not ( = ?auto_157096 ?auto_157101 ) ) ( not ( = ?auto_157095 ?auto_157102 ) ) ( not ( = ?auto_157095 ?auto_157098 ) ) ( not ( = ?auto_157096 ?auto_157102 ) ) ( not ( = ?auto_157096 ?auto_157098 ) ) ( not ( = ?auto_157101 ?auto_157102 ) ) ( not ( = ?auto_157101 ?auto_157098 ) ) ( not ( = ?auto_157102 ?auto_157098 ) ) ( ON ?auto_157102 ?auto_157101 ) ( ON-TABLE ?auto_157097 ) ( ON ?auto_157099 ?auto_157097 ) ( not ( = ?auto_157097 ?auto_157099 ) ) ( not ( = ?auto_157097 ?auto_157100 ) ) ( not ( = ?auto_157097 ?auto_157098 ) ) ( not ( = ?auto_157099 ?auto_157100 ) ) ( not ( = ?auto_157099 ?auto_157098 ) ) ( not ( = ?auto_157100 ?auto_157098 ) ) ( not ( = ?auto_157095 ?auto_157100 ) ) ( not ( = ?auto_157095 ?auto_157097 ) ) ( not ( = ?auto_157095 ?auto_157099 ) ) ( not ( = ?auto_157096 ?auto_157100 ) ) ( not ( = ?auto_157096 ?auto_157097 ) ) ( not ( = ?auto_157096 ?auto_157099 ) ) ( not ( = ?auto_157101 ?auto_157100 ) ) ( not ( = ?auto_157101 ?auto_157097 ) ) ( not ( = ?auto_157101 ?auto_157099 ) ) ( not ( = ?auto_157102 ?auto_157100 ) ) ( not ( = ?auto_157102 ?auto_157097 ) ) ( not ( = ?auto_157102 ?auto_157099 ) ) ( ON ?auto_157098 ?auto_157102 ) ( CLEAR ?auto_157098 ) ( HOLDING ?auto_157100 ) ( CLEAR ?auto_157099 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_157097 ?auto_157099 ?auto_157100 )
      ( MAKE-2PILE ?auto_157095 ?auto_157096 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_157103 - BLOCK
      ?auto_157104 - BLOCK
    )
    :vars
    (
      ?auto_157108 - BLOCK
      ?auto_157107 - BLOCK
      ?auto_157109 - BLOCK
      ?auto_157110 - BLOCK
      ?auto_157105 - BLOCK
      ?auto_157106 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_157108 ?auto_157104 ) ( ON-TABLE ?auto_157103 ) ( ON ?auto_157104 ?auto_157103 ) ( not ( = ?auto_157103 ?auto_157104 ) ) ( not ( = ?auto_157103 ?auto_157108 ) ) ( not ( = ?auto_157104 ?auto_157108 ) ) ( not ( = ?auto_157103 ?auto_157107 ) ) ( not ( = ?auto_157103 ?auto_157109 ) ) ( not ( = ?auto_157104 ?auto_157107 ) ) ( not ( = ?auto_157104 ?auto_157109 ) ) ( not ( = ?auto_157108 ?auto_157107 ) ) ( not ( = ?auto_157108 ?auto_157109 ) ) ( not ( = ?auto_157107 ?auto_157109 ) ) ( ON ?auto_157107 ?auto_157108 ) ( ON-TABLE ?auto_157110 ) ( ON ?auto_157105 ?auto_157110 ) ( not ( = ?auto_157110 ?auto_157105 ) ) ( not ( = ?auto_157110 ?auto_157106 ) ) ( not ( = ?auto_157110 ?auto_157109 ) ) ( not ( = ?auto_157105 ?auto_157106 ) ) ( not ( = ?auto_157105 ?auto_157109 ) ) ( not ( = ?auto_157106 ?auto_157109 ) ) ( not ( = ?auto_157103 ?auto_157106 ) ) ( not ( = ?auto_157103 ?auto_157110 ) ) ( not ( = ?auto_157103 ?auto_157105 ) ) ( not ( = ?auto_157104 ?auto_157106 ) ) ( not ( = ?auto_157104 ?auto_157110 ) ) ( not ( = ?auto_157104 ?auto_157105 ) ) ( not ( = ?auto_157108 ?auto_157106 ) ) ( not ( = ?auto_157108 ?auto_157110 ) ) ( not ( = ?auto_157108 ?auto_157105 ) ) ( not ( = ?auto_157107 ?auto_157106 ) ) ( not ( = ?auto_157107 ?auto_157110 ) ) ( not ( = ?auto_157107 ?auto_157105 ) ) ( ON ?auto_157109 ?auto_157107 ) ( CLEAR ?auto_157105 ) ( ON ?auto_157106 ?auto_157109 ) ( CLEAR ?auto_157106 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_157103 ?auto_157104 ?auto_157108 ?auto_157107 ?auto_157109 )
      ( MAKE-2PILE ?auto_157103 ?auto_157104 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_157111 - BLOCK
      ?auto_157112 - BLOCK
    )
    :vars
    (
      ?auto_157115 - BLOCK
      ?auto_157113 - BLOCK
      ?auto_157117 - BLOCK
      ?auto_157118 - BLOCK
      ?auto_157116 - BLOCK
      ?auto_157114 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_157115 ?auto_157112 ) ( ON-TABLE ?auto_157111 ) ( ON ?auto_157112 ?auto_157111 ) ( not ( = ?auto_157111 ?auto_157112 ) ) ( not ( = ?auto_157111 ?auto_157115 ) ) ( not ( = ?auto_157112 ?auto_157115 ) ) ( not ( = ?auto_157111 ?auto_157113 ) ) ( not ( = ?auto_157111 ?auto_157117 ) ) ( not ( = ?auto_157112 ?auto_157113 ) ) ( not ( = ?auto_157112 ?auto_157117 ) ) ( not ( = ?auto_157115 ?auto_157113 ) ) ( not ( = ?auto_157115 ?auto_157117 ) ) ( not ( = ?auto_157113 ?auto_157117 ) ) ( ON ?auto_157113 ?auto_157115 ) ( ON-TABLE ?auto_157118 ) ( not ( = ?auto_157118 ?auto_157116 ) ) ( not ( = ?auto_157118 ?auto_157114 ) ) ( not ( = ?auto_157118 ?auto_157117 ) ) ( not ( = ?auto_157116 ?auto_157114 ) ) ( not ( = ?auto_157116 ?auto_157117 ) ) ( not ( = ?auto_157114 ?auto_157117 ) ) ( not ( = ?auto_157111 ?auto_157114 ) ) ( not ( = ?auto_157111 ?auto_157118 ) ) ( not ( = ?auto_157111 ?auto_157116 ) ) ( not ( = ?auto_157112 ?auto_157114 ) ) ( not ( = ?auto_157112 ?auto_157118 ) ) ( not ( = ?auto_157112 ?auto_157116 ) ) ( not ( = ?auto_157115 ?auto_157114 ) ) ( not ( = ?auto_157115 ?auto_157118 ) ) ( not ( = ?auto_157115 ?auto_157116 ) ) ( not ( = ?auto_157113 ?auto_157114 ) ) ( not ( = ?auto_157113 ?auto_157118 ) ) ( not ( = ?auto_157113 ?auto_157116 ) ) ( ON ?auto_157117 ?auto_157113 ) ( ON ?auto_157114 ?auto_157117 ) ( CLEAR ?auto_157114 ) ( HOLDING ?auto_157116 ) ( CLEAR ?auto_157118 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_157118 ?auto_157116 )
      ( MAKE-2PILE ?auto_157111 ?auto_157112 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_157119 - BLOCK
      ?auto_157120 - BLOCK
    )
    :vars
    (
      ?auto_157121 - BLOCK
      ?auto_157124 - BLOCK
      ?auto_157122 - BLOCK
      ?auto_157123 - BLOCK
      ?auto_157125 - BLOCK
      ?auto_157126 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_157121 ?auto_157120 ) ( ON-TABLE ?auto_157119 ) ( ON ?auto_157120 ?auto_157119 ) ( not ( = ?auto_157119 ?auto_157120 ) ) ( not ( = ?auto_157119 ?auto_157121 ) ) ( not ( = ?auto_157120 ?auto_157121 ) ) ( not ( = ?auto_157119 ?auto_157124 ) ) ( not ( = ?auto_157119 ?auto_157122 ) ) ( not ( = ?auto_157120 ?auto_157124 ) ) ( not ( = ?auto_157120 ?auto_157122 ) ) ( not ( = ?auto_157121 ?auto_157124 ) ) ( not ( = ?auto_157121 ?auto_157122 ) ) ( not ( = ?auto_157124 ?auto_157122 ) ) ( ON ?auto_157124 ?auto_157121 ) ( ON-TABLE ?auto_157123 ) ( not ( = ?auto_157123 ?auto_157125 ) ) ( not ( = ?auto_157123 ?auto_157126 ) ) ( not ( = ?auto_157123 ?auto_157122 ) ) ( not ( = ?auto_157125 ?auto_157126 ) ) ( not ( = ?auto_157125 ?auto_157122 ) ) ( not ( = ?auto_157126 ?auto_157122 ) ) ( not ( = ?auto_157119 ?auto_157126 ) ) ( not ( = ?auto_157119 ?auto_157123 ) ) ( not ( = ?auto_157119 ?auto_157125 ) ) ( not ( = ?auto_157120 ?auto_157126 ) ) ( not ( = ?auto_157120 ?auto_157123 ) ) ( not ( = ?auto_157120 ?auto_157125 ) ) ( not ( = ?auto_157121 ?auto_157126 ) ) ( not ( = ?auto_157121 ?auto_157123 ) ) ( not ( = ?auto_157121 ?auto_157125 ) ) ( not ( = ?auto_157124 ?auto_157126 ) ) ( not ( = ?auto_157124 ?auto_157123 ) ) ( not ( = ?auto_157124 ?auto_157125 ) ) ( ON ?auto_157122 ?auto_157124 ) ( ON ?auto_157126 ?auto_157122 ) ( CLEAR ?auto_157123 ) ( ON ?auto_157125 ?auto_157126 ) ( CLEAR ?auto_157125 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_157119 ?auto_157120 ?auto_157121 ?auto_157124 ?auto_157122 ?auto_157126 )
      ( MAKE-2PILE ?auto_157119 ?auto_157120 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_157127 - BLOCK
      ?auto_157128 - BLOCK
    )
    :vars
    (
      ?auto_157132 - BLOCK
      ?auto_157131 - BLOCK
      ?auto_157134 - BLOCK
      ?auto_157133 - BLOCK
      ?auto_157129 - BLOCK
      ?auto_157130 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_157132 ?auto_157128 ) ( ON-TABLE ?auto_157127 ) ( ON ?auto_157128 ?auto_157127 ) ( not ( = ?auto_157127 ?auto_157128 ) ) ( not ( = ?auto_157127 ?auto_157132 ) ) ( not ( = ?auto_157128 ?auto_157132 ) ) ( not ( = ?auto_157127 ?auto_157131 ) ) ( not ( = ?auto_157127 ?auto_157134 ) ) ( not ( = ?auto_157128 ?auto_157131 ) ) ( not ( = ?auto_157128 ?auto_157134 ) ) ( not ( = ?auto_157132 ?auto_157131 ) ) ( not ( = ?auto_157132 ?auto_157134 ) ) ( not ( = ?auto_157131 ?auto_157134 ) ) ( ON ?auto_157131 ?auto_157132 ) ( not ( = ?auto_157133 ?auto_157129 ) ) ( not ( = ?auto_157133 ?auto_157130 ) ) ( not ( = ?auto_157133 ?auto_157134 ) ) ( not ( = ?auto_157129 ?auto_157130 ) ) ( not ( = ?auto_157129 ?auto_157134 ) ) ( not ( = ?auto_157130 ?auto_157134 ) ) ( not ( = ?auto_157127 ?auto_157130 ) ) ( not ( = ?auto_157127 ?auto_157133 ) ) ( not ( = ?auto_157127 ?auto_157129 ) ) ( not ( = ?auto_157128 ?auto_157130 ) ) ( not ( = ?auto_157128 ?auto_157133 ) ) ( not ( = ?auto_157128 ?auto_157129 ) ) ( not ( = ?auto_157132 ?auto_157130 ) ) ( not ( = ?auto_157132 ?auto_157133 ) ) ( not ( = ?auto_157132 ?auto_157129 ) ) ( not ( = ?auto_157131 ?auto_157130 ) ) ( not ( = ?auto_157131 ?auto_157133 ) ) ( not ( = ?auto_157131 ?auto_157129 ) ) ( ON ?auto_157134 ?auto_157131 ) ( ON ?auto_157130 ?auto_157134 ) ( ON ?auto_157129 ?auto_157130 ) ( CLEAR ?auto_157129 ) ( HOLDING ?auto_157133 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_157133 )
      ( MAKE-2PILE ?auto_157127 ?auto_157128 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_157145 - BLOCK
      ?auto_157146 - BLOCK
    )
    :vars
    (
      ?auto_157150 - BLOCK
      ?auto_157148 - BLOCK
      ?auto_157152 - BLOCK
      ?auto_157147 - BLOCK
      ?auto_157149 - BLOCK
      ?auto_157151 - BLOCK
      ?auto_157153 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_157150 ?auto_157146 ) ( ON-TABLE ?auto_157145 ) ( ON ?auto_157146 ?auto_157145 ) ( not ( = ?auto_157145 ?auto_157146 ) ) ( not ( = ?auto_157145 ?auto_157150 ) ) ( not ( = ?auto_157146 ?auto_157150 ) ) ( not ( = ?auto_157145 ?auto_157148 ) ) ( not ( = ?auto_157145 ?auto_157152 ) ) ( not ( = ?auto_157146 ?auto_157148 ) ) ( not ( = ?auto_157146 ?auto_157152 ) ) ( not ( = ?auto_157150 ?auto_157148 ) ) ( not ( = ?auto_157150 ?auto_157152 ) ) ( not ( = ?auto_157148 ?auto_157152 ) ) ( ON ?auto_157148 ?auto_157150 ) ( not ( = ?auto_157147 ?auto_157149 ) ) ( not ( = ?auto_157147 ?auto_157151 ) ) ( not ( = ?auto_157147 ?auto_157152 ) ) ( not ( = ?auto_157149 ?auto_157151 ) ) ( not ( = ?auto_157149 ?auto_157152 ) ) ( not ( = ?auto_157151 ?auto_157152 ) ) ( not ( = ?auto_157145 ?auto_157151 ) ) ( not ( = ?auto_157145 ?auto_157147 ) ) ( not ( = ?auto_157145 ?auto_157149 ) ) ( not ( = ?auto_157146 ?auto_157151 ) ) ( not ( = ?auto_157146 ?auto_157147 ) ) ( not ( = ?auto_157146 ?auto_157149 ) ) ( not ( = ?auto_157150 ?auto_157151 ) ) ( not ( = ?auto_157150 ?auto_157147 ) ) ( not ( = ?auto_157150 ?auto_157149 ) ) ( not ( = ?auto_157148 ?auto_157151 ) ) ( not ( = ?auto_157148 ?auto_157147 ) ) ( not ( = ?auto_157148 ?auto_157149 ) ) ( ON ?auto_157152 ?auto_157148 ) ( ON ?auto_157151 ?auto_157152 ) ( ON ?auto_157149 ?auto_157151 ) ( CLEAR ?auto_157149 ) ( ON ?auto_157147 ?auto_157153 ) ( CLEAR ?auto_157147 ) ( HAND-EMPTY ) ( not ( = ?auto_157145 ?auto_157153 ) ) ( not ( = ?auto_157146 ?auto_157153 ) ) ( not ( = ?auto_157150 ?auto_157153 ) ) ( not ( = ?auto_157148 ?auto_157153 ) ) ( not ( = ?auto_157152 ?auto_157153 ) ) ( not ( = ?auto_157147 ?auto_157153 ) ) ( not ( = ?auto_157149 ?auto_157153 ) ) ( not ( = ?auto_157151 ?auto_157153 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_157147 ?auto_157153 )
      ( MAKE-2PILE ?auto_157145 ?auto_157146 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_157154 - BLOCK
      ?auto_157155 - BLOCK
    )
    :vars
    (
      ?auto_157157 - BLOCK
      ?auto_157159 - BLOCK
      ?auto_157162 - BLOCK
      ?auto_157158 - BLOCK
      ?auto_157161 - BLOCK
      ?auto_157156 - BLOCK
      ?auto_157160 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_157157 ?auto_157155 ) ( ON-TABLE ?auto_157154 ) ( ON ?auto_157155 ?auto_157154 ) ( not ( = ?auto_157154 ?auto_157155 ) ) ( not ( = ?auto_157154 ?auto_157157 ) ) ( not ( = ?auto_157155 ?auto_157157 ) ) ( not ( = ?auto_157154 ?auto_157159 ) ) ( not ( = ?auto_157154 ?auto_157162 ) ) ( not ( = ?auto_157155 ?auto_157159 ) ) ( not ( = ?auto_157155 ?auto_157162 ) ) ( not ( = ?auto_157157 ?auto_157159 ) ) ( not ( = ?auto_157157 ?auto_157162 ) ) ( not ( = ?auto_157159 ?auto_157162 ) ) ( ON ?auto_157159 ?auto_157157 ) ( not ( = ?auto_157158 ?auto_157161 ) ) ( not ( = ?auto_157158 ?auto_157156 ) ) ( not ( = ?auto_157158 ?auto_157162 ) ) ( not ( = ?auto_157161 ?auto_157156 ) ) ( not ( = ?auto_157161 ?auto_157162 ) ) ( not ( = ?auto_157156 ?auto_157162 ) ) ( not ( = ?auto_157154 ?auto_157156 ) ) ( not ( = ?auto_157154 ?auto_157158 ) ) ( not ( = ?auto_157154 ?auto_157161 ) ) ( not ( = ?auto_157155 ?auto_157156 ) ) ( not ( = ?auto_157155 ?auto_157158 ) ) ( not ( = ?auto_157155 ?auto_157161 ) ) ( not ( = ?auto_157157 ?auto_157156 ) ) ( not ( = ?auto_157157 ?auto_157158 ) ) ( not ( = ?auto_157157 ?auto_157161 ) ) ( not ( = ?auto_157159 ?auto_157156 ) ) ( not ( = ?auto_157159 ?auto_157158 ) ) ( not ( = ?auto_157159 ?auto_157161 ) ) ( ON ?auto_157162 ?auto_157159 ) ( ON ?auto_157156 ?auto_157162 ) ( ON ?auto_157158 ?auto_157160 ) ( CLEAR ?auto_157158 ) ( not ( = ?auto_157154 ?auto_157160 ) ) ( not ( = ?auto_157155 ?auto_157160 ) ) ( not ( = ?auto_157157 ?auto_157160 ) ) ( not ( = ?auto_157159 ?auto_157160 ) ) ( not ( = ?auto_157162 ?auto_157160 ) ) ( not ( = ?auto_157158 ?auto_157160 ) ) ( not ( = ?auto_157161 ?auto_157160 ) ) ( not ( = ?auto_157156 ?auto_157160 ) ) ( HOLDING ?auto_157161 ) ( CLEAR ?auto_157156 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_157154 ?auto_157155 ?auto_157157 ?auto_157159 ?auto_157162 ?auto_157156 ?auto_157161 )
      ( MAKE-2PILE ?auto_157154 ?auto_157155 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_157163 - BLOCK
      ?auto_157164 - BLOCK
    )
    :vars
    (
      ?auto_157170 - BLOCK
      ?auto_157168 - BLOCK
      ?auto_157171 - BLOCK
      ?auto_157167 - BLOCK
      ?auto_157169 - BLOCK
      ?auto_157165 - BLOCK
      ?auto_157166 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_157170 ?auto_157164 ) ( ON-TABLE ?auto_157163 ) ( ON ?auto_157164 ?auto_157163 ) ( not ( = ?auto_157163 ?auto_157164 ) ) ( not ( = ?auto_157163 ?auto_157170 ) ) ( not ( = ?auto_157164 ?auto_157170 ) ) ( not ( = ?auto_157163 ?auto_157168 ) ) ( not ( = ?auto_157163 ?auto_157171 ) ) ( not ( = ?auto_157164 ?auto_157168 ) ) ( not ( = ?auto_157164 ?auto_157171 ) ) ( not ( = ?auto_157170 ?auto_157168 ) ) ( not ( = ?auto_157170 ?auto_157171 ) ) ( not ( = ?auto_157168 ?auto_157171 ) ) ( ON ?auto_157168 ?auto_157170 ) ( not ( = ?auto_157167 ?auto_157169 ) ) ( not ( = ?auto_157167 ?auto_157165 ) ) ( not ( = ?auto_157167 ?auto_157171 ) ) ( not ( = ?auto_157169 ?auto_157165 ) ) ( not ( = ?auto_157169 ?auto_157171 ) ) ( not ( = ?auto_157165 ?auto_157171 ) ) ( not ( = ?auto_157163 ?auto_157165 ) ) ( not ( = ?auto_157163 ?auto_157167 ) ) ( not ( = ?auto_157163 ?auto_157169 ) ) ( not ( = ?auto_157164 ?auto_157165 ) ) ( not ( = ?auto_157164 ?auto_157167 ) ) ( not ( = ?auto_157164 ?auto_157169 ) ) ( not ( = ?auto_157170 ?auto_157165 ) ) ( not ( = ?auto_157170 ?auto_157167 ) ) ( not ( = ?auto_157170 ?auto_157169 ) ) ( not ( = ?auto_157168 ?auto_157165 ) ) ( not ( = ?auto_157168 ?auto_157167 ) ) ( not ( = ?auto_157168 ?auto_157169 ) ) ( ON ?auto_157171 ?auto_157168 ) ( ON ?auto_157165 ?auto_157171 ) ( ON ?auto_157167 ?auto_157166 ) ( not ( = ?auto_157163 ?auto_157166 ) ) ( not ( = ?auto_157164 ?auto_157166 ) ) ( not ( = ?auto_157170 ?auto_157166 ) ) ( not ( = ?auto_157168 ?auto_157166 ) ) ( not ( = ?auto_157171 ?auto_157166 ) ) ( not ( = ?auto_157167 ?auto_157166 ) ) ( not ( = ?auto_157169 ?auto_157166 ) ) ( not ( = ?auto_157165 ?auto_157166 ) ) ( CLEAR ?auto_157165 ) ( ON ?auto_157169 ?auto_157167 ) ( CLEAR ?auto_157169 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_157166 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_157166 ?auto_157167 )
      ( MAKE-2PILE ?auto_157163 ?auto_157164 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_157172 - BLOCK
      ?auto_157173 - BLOCK
    )
    :vars
    (
      ?auto_157179 - BLOCK
      ?auto_157175 - BLOCK
      ?auto_157180 - BLOCK
      ?auto_157178 - BLOCK
      ?auto_157176 - BLOCK
      ?auto_157177 - BLOCK
      ?auto_157174 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_157179 ?auto_157173 ) ( ON-TABLE ?auto_157172 ) ( ON ?auto_157173 ?auto_157172 ) ( not ( = ?auto_157172 ?auto_157173 ) ) ( not ( = ?auto_157172 ?auto_157179 ) ) ( not ( = ?auto_157173 ?auto_157179 ) ) ( not ( = ?auto_157172 ?auto_157175 ) ) ( not ( = ?auto_157172 ?auto_157180 ) ) ( not ( = ?auto_157173 ?auto_157175 ) ) ( not ( = ?auto_157173 ?auto_157180 ) ) ( not ( = ?auto_157179 ?auto_157175 ) ) ( not ( = ?auto_157179 ?auto_157180 ) ) ( not ( = ?auto_157175 ?auto_157180 ) ) ( ON ?auto_157175 ?auto_157179 ) ( not ( = ?auto_157178 ?auto_157176 ) ) ( not ( = ?auto_157178 ?auto_157177 ) ) ( not ( = ?auto_157178 ?auto_157180 ) ) ( not ( = ?auto_157176 ?auto_157177 ) ) ( not ( = ?auto_157176 ?auto_157180 ) ) ( not ( = ?auto_157177 ?auto_157180 ) ) ( not ( = ?auto_157172 ?auto_157177 ) ) ( not ( = ?auto_157172 ?auto_157178 ) ) ( not ( = ?auto_157172 ?auto_157176 ) ) ( not ( = ?auto_157173 ?auto_157177 ) ) ( not ( = ?auto_157173 ?auto_157178 ) ) ( not ( = ?auto_157173 ?auto_157176 ) ) ( not ( = ?auto_157179 ?auto_157177 ) ) ( not ( = ?auto_157179 ?auto_157178 ) ) ( not ( = ?auto_157179 ?auto_157176 ) ) ( not ( = ?auto_157175 ?auto_157177 ) ) ( not ( = ?auto_157175 ?auto_157178 ) ) ( not ( = ?auto_157175 ?auto_157176 ) ) ( ON ?auto_157180 ?auto_157175 ) ( ON ?auto_157178 ?auto_157174 ) ( not ( = ?auto_157172 ?auto_157174 ) ) ( not ( = ?auto_157173 ?auto_157174 ) ) ( not ( = ?auto_157179 ?auto_157174 ) ) ( not ( = ?auto_157175 ?auto_157174 ) ) ( not ( = ?auto_157180 ?auto_157174 ) ) ( not ( = ?auto_157178 ?auto_157174 ) ) ( not ( = ?auto_157176 ?auto_157174 ) ) ( not ( = ?auto_157177 ?auto_157174 ) ) ( ON ?auto_157176 ?auto_157178 ) ( CLEAR ?auto_157176 ) ( ON-TABLE ?auto_157174 ) ( HOLDING ?auto_157177 ) ( CLEAR ?auto_157180 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_157172 ?auto_157173 ?auto_157179 ?auto_157175 ?auto_157180 ?auto_157177 )
      ( MAKE-2PILE ?auto_157172 ?auto_157173 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_157181 - BLOCK
      ?auto_157182 - BLOCK
    )
    :vars
    (
      ?auto_157185 - BLOCK
      ?auto_157183 - BLOCK
      ?auto_157188 - BLOCK
      ?auto_157189 - BLOCK
      ?auto_157186 - BLOCK
      ?auto_157187 - BLOCK
      ?auto_157184 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_157185 ?auto_157182 ) ( ON-TABLE ?auto_157181 ) ( ON ?auto_157182 ?auto_157181 ) ( not ( = ?auto_157181 ?auto_157182 ) ) ( not ( = ?auto_157181 ?auto_157185 ) ) ( not ( = ?auto_157182 ?auto_157185 ) ) ( not ( = ?auto_157181 ?auto_157183 ) ) ( not ( = ?auto_157181 ?auto_157188 ) ) ( not ( = ?auto_157182 ?auto_157183 ) ) ( not ( = ?auto_157182 ?auto_157188 ) ) ( not ( = ?auto_157185 ?auto_157183 ) ) ( not ( = ?auto_157185 ?auto_157188 ) ) ( not ( = ?auto_157183 ?auto_157188 ) ) ( ON ?auto_157183 ?auto_157185 ) ( not ( = ?auto_157189 ?auto_157186 ) ) ( not ( = ?auto_157189 ?auto_157187 ) ) ( not ( = ?auto_157189 ?auto_157188 ) ) ( not ( = ?auto_157186 ?auto_157187 ) ) ( not ( = ?auto_157186 ?auto_157188 ) ) ( not ( = ?auto_157187 ?auto_157188 ) ) ( not ( = ?auto_157181 ?auto_157187 ) ) ( not ( = ?auto_157181 ?auto_157189 ) ) ( not ( = ?auto_157181 ?auto_157186 ) ) ( not ( = ?auto_157182 ?auto_157187 ) ) ( not ( = ?auto_157182 ?auto_157189 ) ) ( not ( = ?auto_157182 ?auto_157186 ) ) ( not ( = ?auto_157185 ?auto_157187 ) ) ( not ( = ?auto_157185 ?auto_157189 ) ) ( not ( = ?auto_157185 ?auto_157186 ) ) ( not ( = ?auto_157183 ?auto_157187 ) ) ( not ( = ?auto_157183 ?auto_157189 ) ) ( not ( = ?auto_157183 ?auto_157186 ) ) ( ON ?auto_157188 ?auto_157183 ) ( ON ?auto_157189 ?auto_157184 ) ( not ( = ?auto_157181 ?auto_157184 ) ) ( not ( = ?auto_157182 ?auto_157184 ) ) ( not ( = ?auto_157185 ?auto_157184 ) ) ( not ( = ?auto_157183 ?auto_157184 ) ) ( not ( = ?auto_157188 ?auto_157184 ) ) ( not ( = ?auto_157189 ?auto_157184 ) ) ( not ( = ?auto_157186 ?auto_157184 ) ) ( not ( = ?auto_157187 ?auto_157184 ) ) ( ON ?auto_157186 ?auto_157189 ) ( ON-TABLE ?auto_157184 ) ( CLEAR ?auto_157188 ) ( ON ?auto_157187 ?auto_157186 ) ( CLEAR ?auto_157187 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_157184 ?auto_157189 ?auto_157186 )
      ( MAKE-2PILE ?auto_157181 ?auto_157182 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_157239 - BLOCK
      ?auto_157240 - BLOCK
      ?auto_157241 - BLOCK
      ?auto_157242 - BLOCK
      ?auto_157243 - BLOCK
      ?auto_157244 - BLOCK
    )
    :vars
    (
      ?auto_157245 - BLOCK
      ?auto_157246 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_157239 ) ( ON ?auto_157240 ?auto_157239 ) ( ON ?auto_157241 ?auto_157240 ) ( ON ?auto_157242 ?auto_157241 ) ( not ( = ?auto_157239 ?auto_157240 ) ) ( not ( = ?auto_157239 ?auto_157241 ) ) ( not ( = ?auto_157239 ?auto_157242 ) ) ( not ( = ?auto_157239 ?auto_157243 ) ) ( not ( = ?auto_157239 ?auto_157244 ) ) ( not ( = ?auto_157240 ?auto_157241 ) ) ( not ( = ?auto_157240 ?auto_157242 ) ) ( not ( = ?auto_157240 ?auto_157243 ) ) ( not ( = ?auto_157240 ?auto_157244 ) ) ( not ( = ?auto_157241 ?auto_157242 ) ) ( not ( = ?auto_157241 ?auto_157243 ) ) ( not ( = ?auto_157241 ?auto_157244 ) ) ( not ( = ?auto_157242 ?auto_157243 ) ) ( not ( = ?auto_157242 ?auto_157244 ) ) ( not ( = ?auto_157243 ?auto_157244 ) ) ( ON ?auto_157244 ?auto_157245 ) ( not ( = ?auto_157239 ?auto_157245 ) ) ( not ( = ?auto_157240 ?auto_157245 ) ) ( not ( = ?auto_157241 ?auto_157245 ) ) ( not ( = ?auto_157242 ?auto_157245 ) ) ( not ( = ?auto_157243 ?auto_157245 ) ) ( not ( = ?auto_157244 ?auto_157245 ) ) ( CLEAR ?auto_157242 ) ( ON ?auto_157243 ?auto_157244 ) ( CLEAR ?auto_157243 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_157246 ) ( ON ?auto_157245 ?auto_157246 ) ( not ( = ?auto_157246 ?auto_157245 ) ) ( not ( = ?auto_157246 ?auto_157244 ) ) ( not ( = ?auto_157246 ?auto_157243 ) ) ( not ( = ?auto_157239 ?auto_157246 ) ) ( not ( = ?auto_157240 ?auto_157246 ) ) ( not ( = ?auto_157241 ?auto_157246 ) ) ( not ( = ?auto_157242 ?auto_157246 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_157246 ?auto_157245 ?auto_157244 )
      ( MAKE-6PILE ?auto_157239 ?auto_157240 ?auto_157241 ?auto_157242 ?auto_157243 ?auto_157244 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_157247 - BLOCK
      ?auto_157248 - BLOCK
      ?auto_157249 - BLOCK
      ?auto_157250 - BLOCK
      ?auto_157251 - BLOCK
      ?auto_157252 - BLOCK
    )
    :vars
    (
      ?auto_157253 - BLOCK
      ?auto_157254 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_157247 ) ( ON ?auto_157248 ?auto_157247 ) ( ON ?auto_157249 ?auto_157248 ) ( not ( = ?auto_157247 ?auto_157248 ) ) ( not ( = ?auto_157247 ?auto_157249 ) ) ( not ( = ?auto_157247 ?auto_157250 ) ) ( not ( = ?auto_157247 ?auto_157251 ) ) ( not ( = ?auto_157247 ?auto_157252 ) ) ( not ( = ?auto_157248 ?auto_157249 ) ) ( not ( = ?auto_157248 ?auto_157250 ) ) ( not ( = ?auto_157248 ?auto_157251 ) ) ( not ( = ?auto_157248 ?auto_157252 ) ) ( not ( = ?auto_157249 ?auto_157250 ) ) ( not ( = ?auto_157249 ?auto_157251 ) ) ( not ( = ?auto_157249 ?auto_157252 ) ) ( not ( = ?auto_157250 ?auto_157251 ) ) ( not ( = ?auto_157250 ?auto_157252 ) ) ( not ( = ?auto_157251 ?auto_157252 ) ) ( ON ?auto_157252 ?auto_157253 ) ( not ( = ?auto_157247 ?auto_157253 ) ) ( not ( = ?auto_157248 ?auto_157253 ) ) ( not ( = ?auto_157249 ?auto_157253 ) ) ( not ( = ?auto_157250 ?auto_157253 ) ) ( not ( = ?auto_157251 ?auto_157253 ) ) ( not ( = ?auto_157252 ?auto_157253 ) ) ( ON ?auto_157251 ?auto_157252 ) ( CLEAR ?auto_157251 ) ( ON-TABLE ?auto_157254 ) ( ON ?auto_157253 ?auto_157254 ) ( not ( = ?auto_157254 ?auto_157253 ) ) ( not ( = ?auto_157254 ?auto_157252 ) ) ( not ( = ?auto_157254 ?auto_157251 ) ) ( not ( = ?auto_157247 ?auto_157254 ) ) ( not ( = ?auto_157248 ?auto_157254 ) ) ( not ( = ?auto_157249 ?auto_157254 ) ) ( not ( = ?auto_157250 ?auto_157254 ) ) ( HOLDING ?auto_157250 ) ( CLEAR ?auto_157249 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_157247 ?auto_157248 ?auto_157249 ?auto_157250 )
      ( MAKE-6PILE ?auto_157247 ?auto_157248 ?auto_157249 ?auto_157250 ?auto_157251 ?auto_157252 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_157255 - BLOCK
      ?auto_157256 - BLOCK
      ?auto_157257 - BLOCK
      ?auto_157258 - BLOCK
      ?auto_157259 - BLOCK
      ?auto_157260 - BLOCK
    )
    :vars
    (
      ?auto_157261 - BLOCK
      ?auto_157262 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_157255 ) ( ON ?auto_157256 ?auto_157255 ) ( ON ?auto_157257 ?auto_157256 ) ( not ( = ?auto_157255 ?auto_157256 ) ) ( not ( = ?auto_157255 ?auto_157257 ) ) ( not ( = ?auto_157255 ?auto_157258 ) ) ( not ( = ?auto_157255 ?auto_157259 ) ) ( not ( = ?auto_157255 ?auto_157260 ) ) ( not ( = ?auto_157256 ?auto_157257 ) ) ( not ( = ?auto_157256 ?auto_157258 ) ) ( not ( = ?auto_157256 ?auto_157259 ) ) ( not ( = ?auto_157256 ?auto_157260 ) ) ( not ( = ?auto_157257 ?auto_157258 ) ) ( not ( = ?auto_157257 ?auto_157259 ) ) ( not ( = ?auto_157257 ?auto_157260 ) ) ( not ( = ?auto_157258 ?auto_157259 ) ) ( not ( = ?auto_157258 ?auto_157260 ) ) ( not ( = ?auto_157259 ?auto_157260 ) ) ( ON ?auto_157260 ?auto_157261 ) ( not ( = ?auto_157255 ?auto_157261 ) ) ( not ( = ?auto_157256 ?auto_157261 ) ) ( not ( = ?auto_157257 ?auto_157261 ) ) ( not ( = ?auto_157258 ?auto_157261 ) ) ( not ( = ?auto_157259 ?auto_157261 ) ) ( not ( = ?auto_157260 ?auto_157261 ) ) ( ON ?auto_157259 ?auto_157260 ) ( ON-TABLE ?auto_157262 ) ( ON ?auto_157261 ?auto_157262 ) ( not ( = ?auto_157262 ?auto_157261 ) ) ( not ( = ?auto_157262 ?auto_157260 ) ) ( not ( = ?auto_157262 ?auto_157259 ) ) ( not ( = ?auto_157255 ?auto_157262 ) ) ( not ( = ?auto_157256 ?auto_157262 ) ) ( not ( = ?auto_157257 ?auto_157262 ) ) ( not ( = ?auto_157258 ?auto_157262 ) ) ( CLEAR ?auto_157257 ) ( ON ?auto_157258 ?auto_157259 ) ( CLEAR ?auto_157258 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_157262 ?auto_157261 ?auto_157260 ?auto_157259 )
      ( MAKE-6PILE ?auto_157255 ?auto_157256 ?auto_157257 ?auto_157258 ?auto_157259 ?auto_157260 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_157263 - BLOCK
      ?auto_157264 - BLOCK
      ?auto_157265 - BLOCK
      ?auto_157266 - BLOCK
      ?auto_157267 - BLOCK
      ?auto_157268 - BLOCK
    )
    :vars
    (
      ?auto_157270 - BLOCK
      ?auto_157269 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_157263 ) ( ON ?auto_157264 ?auto_157263 ) ( not ( = ?auto_157263 ?auto_157264 ) ) ( not ( = ?auto_157263 ?auto_157265 ) ) ( not ( = ?auto_157263 ?auto_157266 ) ) ( not ( = ?auto_157263 ?auto_157267 ) ) ( not ( = ?auto_157263 ?auto_157268 ) ) ( not ( = ?auto_157264 ?auto_157265 ) ) ( not ( = ?auto_157264 ?auto_157266 ) ) ( not ( = ?auto_157264 ?auto_157267 ) ) ( not ( = ?auto_157264 ?auto_157268 ) ) ( not ( = ?auto_157265 ?auto_157266 ) ) ( not ( = ?auto_157265 ?auto_157267 ) ) ( not ( = ?auto_157265 ?auto_157268 ) ) ( not ( = ?auto_157266 ?auto_157267 ) ) ( not ( = ?auto_157266 ?auto_157268 ) ) ( not ( = ?auto_157267 ?auto_157268 ) ) ( ON ?auto_157268 ?auto_157270 ) ( not ( = ?auto_157263 ?auto_157270 ) ) ( not ( = ?auto_157264 ?auto_157270 ) ) ( not ( = ?auto_157265 ?auto_157270 ) ) ( not ( = ?auto_157266 ?auto_157270 ) ) ( not ( = ?auto_157267 ?auto_157270 ) ) ( not ( = ?auto_157268 ?auto_157270 ) ) ( ON ?auto_157267 ?auto_157268 ) ( ON-TABLE ?auto_157269 ) ( ON ?auto_157270 ?auto_157269 ) ( not ( = ?auto_157269 ?auto_157270 ) ) ( not ( = ?auto_157269 ?auto_157268 ) ) ( not ( = ?auto_157269 ?auto_157267 ) ) ( not ( = ?auto_157263 ?auto_157269 ) ) ( not ( = ?auto_157264 ?auto_157269 ) ) ( not ( = ?auto_157265 ?auto_157269 ) ) ( not ( = ?auto_157266 ?auto_157269 ) ) ( ON ?auto_157266 ?auto_157267 ) ( CLEAR ?auto_157266 ) ( HOLDING ?auto_157265 ) ( CLEAR ?auto_157264 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_157263 ?auto_157264 ?auto_157265 )
      ( MAKE-6PILE ?auto_157263 ?auto_157264 ?auto_157265 ?auto_157266 ?auto_157267 ?auto_157268 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_157271 - BLOCK
      ?auto_157272 - BLOCK
      ?auto_157273 - BLOCK
      ?auto_157274 - BLOCK
      ?auto_157275 - BLOCK
      ?auto_157276 - BLOCK
    )
    :vars
    (
      ?auto_157278 - BLOCK
      ?auto_157277 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_157271 ) ( ON ?auto_157272 ?auto_157271 ) ( not ( = ?auto_157271 ?auto_157272 ) ) ( not ( = ?auto_157271 ?auto_157273 ) ) ( not ( = ?auto_157271 ?auto_157274 ) ) ( not ( = ?auto_157271 ?auto_157275 ) ) ( not ( = ?auto_157271 ?auto_157276 ) ) ( not ( = ?auto_157272 ?auto_157273 ) ) ( not ( = ?auto_157272 ?auto_157274 ) ) ( not ( = ?auto_157272 ?auto_157275 ) ) ( not ( = ?auto_157272 ?auto_157276 ) ) ( not ( = ?auto_157273 ?auto_157274 ) ) ( not ( = ?auto_157273 ?auto_157275 ) ) ( not ( = ?auto_157273 ?auto_157276 ) ) ( not ( = ?auto_157274 ?auto_157275 ) ) ( not ( = ?auto_157274 ?auto_157276 ) ) ( not ( = ?auto_157275 ?auto_157276 ) ) ( ON ?auto_157276 ?auto_157278 ) ( not ( = ?auto_157271 ?auto_157278 ) ) ( not ( = ?auto_157272 ?auto_157278 ) ) ( not ( = ?auto_157273 ?auto_157278 ) ) ( not ( = ?auto_157274 ?auto_157278 ) ) ( not ( = ?auto_157275 ?auto_157278 ) ) ( not ( = ?auto_157276 ?auto_157278 ) ) ( ON ?auto_157275 ?auto_157276 ) ( ON-TABLE ?auto_157277 ) ( ON ?auto_157278 ?auto_157277 ) ( not ( = ?auto_157277 ?auto_157278 ) ) ( not ( = ?auto_157277 ?auto_157276 ) ) ( not ( = ?auto_157277 ?auto_157275 ) ) ( not ( = ?auto_157271 ?auto_157277 ) ) ( not ( = ?auto_157272 ?auto_157277 ) ) ( not ( = ?auto_157273 ?auto_157277 ) ) ( not ( = ?auto_157274 ?auto_157277 ) ) ( ON ?auto_157274 ?auto_157275 ) ( CLEAR ?auto_157272 ) ( ON ?auto_157273 ?auto_157274 ) ( CLEAR ?auto_157273 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_157277 ?auto_157278 ?auto_157276 ?auto_157275 ?auto_157274 )
      ( MAKE-6PILE ?auto_157271 ?auto_157272 ?auto_157273 ?auto_157274 ?auto_157275 ?auto_157276 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_157279 - BLOCK
      ?auto_157280 - BLOCK
      ?auto_157281 - BLOCK
      ?auto_157282 - BLOCK
      ?auto_157283 - BLOCK
      ?auto_157284 - BLOCK
    )
    :vars
    (
      ?auto_157286 - BLOCK
      ?auto_157285 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_157279 ) ( not ( = ?auto_157279 ?auto_157280 ) ) ( not ( = ?auto_157279 ?auto_157281 ) ) ( not ( = ?auto_157279 ?auto_157282 ) ) ( not ( = ?auto_157279 ?auto_157283 ) ) ( not ( = ?auto_157279 ?auto_157284 ) ) ( not ( = ?auto_157280 ?auto_157281 ) ) ( not ( = ?auto_157280 ?auto_157282 ) ) ( not ( = ?auto_157280 ?auto_157283 ) ) ( not ( = ?auto_157280 ?auto_157284 ) ) ( not ( = ?auto_157281 ?auto_157282 ) ) ( not ( = ?auto_157281 ?auto_157283 ) ) ( not ( = ?auto_157281 ?auto_157284 ) ) ( not ( = ?auto_157282 ?auto_157283 ) ) ( not ( = ?auto_157282 ?auto_157284 ) ) ( not ( = ?auto_157283 ?auto_157284 ) ) ( ON ?auto_157284 ?auto_157286 ) ( not ( = ?auto_157279 ?auto_157286 ) ) ( not ( = ?auto_157280 ?auto_157286 ) ) ( not ( = ?auto_157281 ?auto_157286 ) ) ( not ( = ?auto_157282 ?auto_157286 ) ) ( not ( = ?auto_157283 ?auto_157286 ) ) ( not ( = ?auto_157284 ?auto_157286 ) ) ( ON ?auto_157283 ?auto_157284 ) ( ON-TABLE ?auto_157285 ) ( ON ?auto_157286 ?auto_157285 ) ( not ( = ?auto_157285 ?auto_157286 ) ) ( not ( = ?auto_157285 ?auto_157284 ) ) ( not ( = ?auto_157285 ?auto_157283 ) ) ( not ( = ?auto_157279 ?auto_157285 ) ) ( not ( = ?auto_157280 ?auto_157285 ) ) ( not ( = ?auto_157281 ?auto_157285 ) ) ( not ( = ?auto_157282 ?auto_157285 ) ) ( ON ?auto_157282 ?auto_157283 ) ( ON ?auto_157281 ?auto_157282 ) ( CLEAR ?auto_157281 ) ( HOLDING ?auto_157280 ) ( CLEAR ?auto_157279 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_157279 ?auto_157280 )
      ( MAKE-6PILE ?auto_157279 ?auto_157280 ?auto_157281 ?auto_157282 ?auto_157283 ?auto_157284 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_157287 - BLOCK
      ?auto_157288 - BLOCK
      ?auto_157289 - BLOCK
      ?auto_157290 - BLOCK
      ?auto_157291 - BLOCK
      ?auto_157292 - BLOCK
    )
    :vars
    (
      ?auto_157294 - BLOCK
      ?auto_157293 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_157287 ) ( not ( = ?auto_157287 ?auto_157288 ) ) ( not ( = ?auto_157287 ?auto_157289 ) ) ( not ( = ?auto_157287 ?auto_157290 ) ) ( not ( = ?auto_157287 ?auto_157291 ) ) ( not ( = ?auto_157287 ?auto_157292 ) ) ( not ( = ?auto_157288 ?auto_157289 ) ) ( not ( = ?auto_157288 ?auto_157290 ) ) ( not ( = ?auto_157288 ?auto_157291 ) ) ( not ( = ?auto_157288 ?auto_157292 ) ) ( not ( = ?auto_157289 ?auto_157290 ) ) ( not ( = ?auto_157289 ?auto_157291 ) ) ( not ( = ?auto_157289 ?auto_157292 ) ) ( not ( = ?auto_157290 ?auto_157291 ) ) ( not ( = ?auto_157290 ?auto_157292 ) ) ( not ( = ?auto_157291 ?auto_157292 ) ) ( ON ?auto_157292 ?auto_157294 ) ( not ( = ?auto_157287 ?auto_157294 ) ) ( not ( = ?auto_157288 ?auto_157294 ) ) ( not ( = ?auto_157289 ?auto_157294 ) ) ( not ( = ?auto_157290 ?auto_157294 ) ) ( not ( = ?auto_157291 ?auto_157294 ) ) ( not ( = ?auto_157292 ?auto_157294 ) ) ( ON ?auto_157291 ?auto_157292 ) ( ON-TABLE ?auto_157293 ) ( ON ?auto_157294 ?auto_157293 ) ( not ( = ?auto_157293 ?auto_157294 ) ) ( not ( = ?auto_157293 ?auto_157292 ) ) ( not ( = ?auto_157293 ?auto_157291 ) ) ( not ( = ?auto_157287 ?auto_157293 ) ) ( not ( = ?auto_157288 ?auto_157293 ) ) ( not ( = ?auto_157289 ?auto_157293 ) ) ( not ( = ?auto_157290 ?auto_157293 ) ) ( ON ?auto_157290 ?auto_157291 ) ( ON ?auto_157289 ?auto_157290 ) ( CLEAR ?auto_157287 ) ( ON ?auto_157288 ?auto_157289 ) ( CLEAR ?auto_157288 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_157293 ?auto_157294 ?auto_157292 ?auto_157291 ?auto_157290 ?auto_157289 )
      ( MAKE-6PILE ?auto_157287 ?auto_157288 ?auto_157289 ?auto_157290 ?auto_157291 ?auto_157292 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_157295 - BLOCK
      ?auto_157296 - BLOCK
      ?auto_157297 - BLOCK
      ?auto_157298 - BLOCK
      ?auto_157299 - BLOCK
      ?auto_157300 - BLOCK
    )
    :vars
    (
      ?auto_157301 - BLOCK
      ?auto_157302 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_157295 ?auto_157296 ) ) ( not ( = ?auto_157295 ?auto_157297 ) ) ( not ( = ?auto_157295 ?auto_157298 ) ) ( not ( = ?auto_157295 ?auto_157299 ) ) ( not ( = ?auto_157295 ?auto_157300 ) ) ( not ( = ?auto_157296 ?auto_157297 ) ) ( not ( = ?auto_157296 ?auto_157298 ) ) ( not ( = ?auto_157296 ?auto_157299 ) ) ( not ( = ?auto_157296 ?auto_157300 ) ) ( not ( = ?auto_157297 ?auto_157298 ) ) ( not ( = ?auto_157297 ?auto_157299 ) ) ( not ( = ?auto_157297 ?auto_157300 ) ) ( not ( = ?auto_157298 ?auto_157299 ) ) ( not ( = ?auto_157298 ?auto_157300 ) ) ( not ( = ?auto_157299 ?auto_157300 ) ) ( ON ?auto_157300 ?auto_157301 ) ( not ( = ?auto_157295 ?auto_157301 ) ) ( not ( = ?auto_157296 ?auto_157301 ) ) ( not ( = ?auto_157297 ?auto_157301 ) ) ( not ( = ?auto_157298 ?auto_157301 ) ) ( not ( = ?auto_157299 ?auto_157301 ) ) ( not ( = ?auto_157300 ?auto_157301 ) ) ( ON ?auto_157299 ?auto_157300 ) ( ON-TABLE ?auto_157302 ) ( ON ?auto_157301 ?auto_157302 ) ( not ( = ?auto_157302 ?auto_157301 ) ) ( not ( = ?auto_157302 ?auto_157300 ) ) ( not ( = ?auto_157302 ?auto_157299 ) ) ( not ( = ?auto_157295 ?auto_157302 ) ) ( not ( = ?auto_157296 ?auto_157302 ) ) ( not ( = ?auto_157297 ?auto_157302 ) ) ( not ( = ?auto_157298 ?auto_157302 ) ) ( ON ?auto_157298 ?auto_157299 ) ( ON ?auto_157297 ?auto_157298 ) ( ON ?auto_157296 ?auto_157297 ) ( CLEAR ?auto_157296 ) ( HOLDING ?auto_157295 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_157295 )
      ( MAKE-6PILE ?auto_157295 ?auto_157296 ?auto_157297 ?auto_157298 ?auto_157299 ?auto_157300 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_157303 - BLOCK
      ?auto_157304 - BLOCK
      ?auto_157305 - BLOCK
      ?auto_157306 - BLOCK
      ?auto_157307 - BLOCK
      ?auto_157308 - BLOCK
    )
    :vars
    (
      ?auto_157309 - BLOCK
      ?auto_157310 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_157303 ?auto_157304 ) ) ( not ( = ?auto_157303 ?auto_157305 ) ) ( not ( = ?auto_157303 ?auto_157306 ) ) ( not ( = ?auto_157303 ?auto_157307 ) ) ( not ( = ?auto_157303 ?auto_157308 ) ) ( not ( = ?auto_157304 ?auto_157305 ) ) ( not ( = ?auto_157304 ?auto_157306 ) ) ( not ( = ?auto_157304 ?auto_157307 ) ) ( not ( = ?auto_157304 ?auto_157308 ) ) ( not ( = ?auto_157305 ?auto_157306 ) ) ( not ( = ?auto_157305 ?auto_157307 ) ) ( not ( = ?auto_157305 ?auto_157308 ) ) ( not ( = ?auto_157306 ?auto_157307 ) ) ( not ( = ?auto_157306 ?auto_157308 ) ) ( not ( = ?auto_157307 ?auto_157308 ) ) ( ON ?auto_157308 ?auto_157309 ) ( not ( = ?auto_157303 ?auto_157309 ) ) ( not ( = ?auto_157304 ?auto_157309 ) ) ( not ( = ?auto_157305 ?auto_157309 ) ) ( not ( = ?auto_157306 ?auto_157309 ) ) ( not ( = ?auto_157307 ?auto_157309 ) ) ( not ( = ?auto_157308 ?auto_157309 ) ) ( ON ?auto_157307 ?auto_157308 ) ( ON-TABLE ?auto_157310 ) ( ON ?auto_157309 ?auto_157310 ) ( not ( = ?auto_157310 ?auto_157309 ) ) ( not ( = ?auto_157310 ?auto_157308 ) ) ( not ( = ?auto_157310 ?auto_157307 ) ) ( not ( = ?auto_157303 ?auto_157310 ) ) ( not ( = ?auto_157304 ?auto_157310 ) ) ( not ( = ?auto_157305 ?auto_157310 ) ) ( not ( = ?auto_157306 ?auto_157310 ) ) ( ON ?auto_157306 ?auto_157307 ) ( ON ?auto_157305 ?auto_157306 ) ( ON ?auto_157304 ?auto_157305 ) ( ON ?auto_157303 ?auto_157304 ) ( CLEAR ?auto_157303 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_157310 ?auto_157309 ?auto_157308 ?auto_157307 ?auto_157306 ?auto_157305 ?auto_157304 )
      ( MAKE-6PILE ?auto_157303 ?auto_157304 ?auto_157305 ?auto_157306 ?auto_157307 ?auto_157308 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_157317 - BLOCK
      ?auto_157318 - BLOCK
      ?auto_157319 - BLOCK
      ?auto_157320 - BLOCK
      ?auto_157321 - BLOCK
      ?auto_157322 - BLOCK
    )
    :vars
    (
      ?auto_157323 - BLOCK
      ?auto_157324 - BLOCK
      ?auto_157325 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_157317 ?auto_157318 ) ) ( not ( = ?auto_157317 ?auto_157319 ) ) ( not ( = ?auto_157317 ?auto_157320 ) ) ( not ( = ?auto_157317 ?auto_157321 ) ) ( not ( = ?auto_157317 ?auto_157322 ) ) ( not ( = ?auto_157318 ?auto_157319 ) ) ( not ( = ?auto_157318 ?auto_157320 ) ) ( not ( = ?auto_157318 ?auto_157321 ) ) ( not ( = ?auto_157318 ?auto_157322 ) ) ( not ( = ?auto_157319 ?auto_157320 ) ) ( not ( = ?auto_157319 ?auto_157321 ) ) ( not ( = ?auto_157319 ?auto_157322 ) ) ( not ( = ?auto_157320 ?auto_157321 ) ) ( not ( = ?auto_157320 ?auto_157322 ) ) ( not ( = ?auto_157321 ?auto_157322 ) ) ( ON ?auto_157322 ?auto_157323 ) ( not ( = ?auto_157317 ?auto_157323 ) ) ( not ( = ?auto_157318 ?auto_157323 ) ) ( not ( = ?auto_157319 ?auto_157323 ) ) ( not ( = ?auto_157320 ?auto_157323 ) ) ( not ( = ?auto_157321 ?auto_157323 ) ) ( not ( = ?auto_157322 ?auto_157323 ) ) ( ON ?auto_157321 ?auto_157322 ) ( ON-TABLE ?auto_157324 ) ( ON ?auto_157323 ?auto_157324 ) ( not ( = ?auto_157324 ?auto_157323 ) ) ( not ( = ?auto_157324 ?auto_157322 ) ) ( not ( = ?auto_157324 ?auto_157321 ) ) ( not ( = ?auto_157317 ?auto_157324 ) ) ( not ( = ?auto_157318 ?auto_157324 ) ) ( not ( = ?auto_157319 ?auto_157324 ) ) ( not ( = ?auto_157320 ?auto_157324 ) ) ( ON ?auto_157320 ?auto_157321 ) ( ON ?auto_157319 ?auto_157320 ) ( ON ?auto_157318 ?auto_157319 ) ( CLEAR ?auto_157318 ) ( ON ?auto_157317 ?auto_157325 ) ( CLEAR ?auto_157317 ) ( HAND-EMPTY ) ( not ( = ?auto_157317 ?auto_157325 ) ) ( not ( = ?auto_157318 ?auto_157325 ) ) ( not ( = ?auto_157319 ?auto_157325 ) ) ( not ( = ?auto_157320 ?auto_157325 ) ) ( not ( = ?auto_157321 ?auto_157325 ) ) ( not ( = ?auto_157322 ?auto_157325 ) ) ( not ( = ?auto_157323 ?auto_157325 ) ) ( not ( = ?auto_157324 ?auto_157325 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_157317 ?auto_157325 )
      ( MAKE-6PILE ?auto_157317 ?auto_157318 ?auto_157319 ?auto_157320 ?auto_157321 ?auto_157322 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_157326 - BLOCK
      ?auto_157327 - BLOCK
      ?auto_157328 - BLOCK
      ?auto_157329 - BLOCK
      ?auto_157330 - BLOCK
      ?auto_157331 - BLOCK
    )
    :vars
    (
      ?auto_157332 - BLOCK
      ?auto_157333 - BLOCK
      ?auto_157334 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_157326 ?auto_157327 ) ) ( not ( = ?auto_157326 ?auto_157328 ) ) ( not ( = ?auto_157326 ?auto_157329 ) ) ( not ( = ?auto_157326 ?auto_157330 ) ) ( not ( = ?auto_157326 ?auto_157331 ) ) ( not ( = ?auto_157327 ?auto_157328 ) ) ( not ( = ?auto_157327 ?auto_157329 ) ) ( not ( = ?auto_157327 ?auto_157330 ) ) ( not ( = ?auto_157327 ?auto_157331 ) ) ( not ( = ?auto_157328 ?auto_157329 ) ) ( not ( = ?auto_157328 ?auto_157330 ) ) ( not ( = ?auto_157328 ?auto_157331 ) ) ( not ( = ?auto_157329 ?auto_157330 ) ) ( not ( = ?auto_157329 ?auto_157331 ) ) ( not ( = ?auto_157330 ?auto_157331 ) ) ( ON ?auto_157331 ?auto_157332 ) ( not ( = ?auto_157326 ?auto_157332 ) ) ( not ( = ?auto_157327 ?auto_157332 ) ) ( not ( = ?auto_157328 ?auto_157332 ) ) ( not ( = ?auto_157329 ?auto_157332 ) ) ( not ( = ?auto_157330 ?auto_157332 ) ) ( not ( = ?auto_157331 ?auto_157332 ) ) ( ON ?auto_157330 ?auto_157331 ) ( ON-TABLE ?auto_157333 ) ( ON ?auto_157332 ?auto_157333 ) ( not ( = ?auto_157333 ?auto_157332 ) ) ( not ( = ?auto_157333 ?auto_157331 ) ) ( not ( = ?auto_157333 ?auto_157330 ) ) ( not ( = ?auto_157326 ?auto_157333 ) ) ( not ( = ?auto_157327 ?auto_157333 ) ) ( not ( = ?auto_157328 ?auto_157333 ) ) ( not ( = ?auto_157329 ?auto_157333 ) ) ( ON ?auto_157329 ?auto_157330 ) ( ON ?auto_157328 ?auto_157329 ) ( ON ?auto_157326 ?auto_157334 ) ( CLEAR ?auto_157326 ) ( not ( = ?auto_157326 ?auto_157334 ) ) ( not ( = ?auto_157327 ?auto_157334 ) ) ( not ( = ?auto_157328 ?auto_157334 ) ) ( not ( = ?auto_157329 ?auto_157334 ) ) ( not ( = ?auto_157330 ?auto_157334 ) ) ( not ( = ?auto_157331 ?auto_157334 ) ) ( not ( = ?auto_157332 ?auto_157334 ) ) ( not ( = ?auto_157333 ?auto_157334 ) ) ( HOLDING ?auto_157327 ) ( CLEAR ?auto_157328 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_157333 ?auto_157332 ?auto_157331 ?auto_157330 ?auto_157329 ?auto_157328 ?auto_157327 )
      ( MAKE-6PILE ?auto_157326 ?auto_157327 ?auto_157328 ?auto_157329 ?auto_157330 ?auto_157331 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_157335 - BLOCK
      ?auto_157336 - BLOCK
      ?auto_157337 - BLOCK
      ?auto_157338 - BLOCK
      ?auto_157339 - BLOCK
      ?auto_157340 - BLOCK
    )
    :vars
    (
      ?auto_157343 - BLOCK
      ?auto_157342 - BLOCK
      ?auto_157341 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_157335 ?auto_157336 ) ) ( not ( = ?auto_157335 ?auto_157337 ) ) ( not ( = ?auto_157335 ?auto_157338 ) ) ( not ( = ?auto_157335 ?auto_157339 ) ) ( not ( = ?auto_157335 ?auto_157340 ) ) ( not ( = ?auto_157336 ?auto_157337 ) ) ( not ( = ?auto_157336 ?auto_157338 ) ) ( not ( = ?auto_157336 ?auto_157339 ) ) ( not ( = ?auto_157336 ?auto_157340 ) ) ( not ( = ?auto_157337 ?auto_157338 ) ) ( not ( = ?auto_157337 ?auto_157339 ) ) ( not ( = ?auto_157337 ?auto_157340 ) ) ( not ( = ?auto_157338 ?auto_157339 ) ) ( not ( = ?auto_157338 ?auto_157340 ) ) ( not ( = ?auto_157339 ?auto_157340 ) ) ( ON ?auto_157340 ?auto_157343 ) ( not ( = ?auto_157335 ?auto_157343 ) ) ( not ( = ?auto_157336 ?auto_157343 ) ) ( not ( = ?auto_157337 ?auto_157343 ) ) ( not ( = ?auto_157338 ?auto_157343 ) ) ( not ( = ?auto_157339 ?auto_157343 ) ) ( not ( = ?auto_157340 ?auto_157343 ) ) ( ON ?auto_157339 ?auto_157340 ) ( ON-TABLE ?auto_157342 ) ( ON ?auto_157343 ?auto_157342 ) ( not ( = ?auto_157342 ?auto_157343 ) ) ( not ( = ?auto_157342 ?auto_157340 ) ) ( not ( = ?auto_157342 ?auto_157339 ) ) ( not ( = ?auto_157335 ?auto_157342 ) ) ( not ( = ?auto_157336 ?auto_157342 ) ) ( not ( = ?auto_157337 ?auto_157342 ) ) ( not ( = ?auto_157338 ?auto_157342 ) ) ( ON ?auto_157338 ?auto_157339 ) ( ON ?auto_157337 ?auto_157338 ) ( ON ?auto_157335 ?auto_157341 ) ( not ( = ?auto_157335 ?auto_157341 ) ) ( not ( = ?auto_157336 ?auto_157341 ) ) ( not ( = ?auto_157337 ?auto_157341 ) ) ( not ( = ?auto_157338 ?auto_157341 ) ) ( not ( = ?auto_157339 ?auto_157341 ) ) ( not ( = ?auto_157340 ?auto_157341 ) ) ( not ( = ?auto_157343 ?auto_157341 ) ) ( not ( = ?auto_157342 ?auto_157341 ) ) ( CLEAR ?auto_157337 ) ( ON ?auto_157336 ?auto_157335 ) ( CLEAR ?auto_157336 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_157341 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_157341 ?auto_157335 )
      ( MAKE-6PILE ?auto_157335 ?auto_157336 ?auto_157337 ?auto_157338 ?auto_157339 ?auto_157340 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_157344 - BLOCK
      ?auto_157345 - BLOCK
      ?auto_157346 - BLOCK
      ?auto_157347 - BLOCK
      ?auto_157348 - BLOCK
      ?auto_157349 - BLOCK
    )
    :vars
    (
      ?auto_157352 - BLOCK
      ?auto_157351 - BLOCK
      ?auto_157350 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_157344 ?auto_157345 ) ) ( not ( = ?auto_157344 ?auto_157346 ) ) ( not ( = ?auto_157344 ?auto_157347 ) ) ( not ( = ?auto_157344 ?auto_157348 ) ) ( not ( = ?auto_157344 ?auto_157349 ) ) ( not ( = ?auto_157345 ?auto_157346 ) ) ( not ( = ?auto_157345 ?auto_157347 ) ) ( not ( = ?auto_157345 ?auto_157348 ) ) ( not ( = ?auto_157345 ?auto_157349 ) ) ( not ( = ?auto_157346 ?auto_157347 ) ) ( not ( = ?auto_157346 ?auto_157348 ) ) ( not ( = ?auto_157346 ?auto_157349 ) ) ( not ( = ?auto_157347 ?auto_157348 ) ) ( not ( = ?auto_157347 ?auto_157349 ) ) ( not ( = ?auto_157348 ?auto_157349 ) ) ( ON ?auto_157349 ?auto_157352 ) ( not ( = ?auto_157344 ?auto_157352 ) ) ( not ( = ?auto_157345 ?auto_157352 ) ) ( not ( = ?auto_157346 ?auto_157352 ) ) ( not ( = ?auto_157347 ?auto_157352 ) ) ( not ( = ?auto_157348 ?auto_157352 ) ) ( not ( = ?auto_157349 ?auto_157352 ) ) ( ON ?auto_157348 ?auto_157349 ) ( ON-TABLE ?auto_157351 ) ( ON ?auto_157352 ?auto_157351 ) ( not ( = ?auto_157351 ?auto_157352 ) ) ( not ( = ?auto_157351 ?auto_157349 ) ) ( not ( = ?auto_157351 ?auto_157348 ) ) ( not ( = ?auto_157344 ?auto_157351 ) ) ( not ( = ?auto_157345 ?auto_157351 ) ) ( not ( = ?auto_157346 ?auto_157351 ) ) ( not ( = ?auto_157347 ?auto_157351 ) ) ( ON ?auto_157347 ?auto_157348 ) ( ON ?auto_157344 ?auto_157350 ) ( not ( = ?auto_157344 ?auto_157350 ) ) ( not ( = ?auto_157345 ?auto_157350 ) ) ( not ( = ?auto_157346 ?auto_157350 ) ) ( not ( = ?auto_157347 ?auto_157350 ) ) ( not ( = ?auto_157348 ?auto_157350 ) ) ( not ( = ?auto_157349 ?auto_157350 ) ) ( not ( = ?auto_157352 ?auto_157350 ) ) ( not ( = ?auto_157351 ?auto_157350 ) ) ( ON ?auto_157345 ?auto_157344 ) ( CLEAR ?auto_157345 ) ( ON-TABLE ?auto_157350 ) ( HOLDING ?auto_157346 ) ( CLEAR ?auto_157347 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_157351 ?auto_157352 ?auto_157349 ?auto_157348 ?auto_157347 ?auto_157346 )
      ( MAKE-6PILE ?auto_157344 ?auto_157345 ?auto_157346 ?auto_157347 ?auto_157348 ?auto_157349 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_157353 - BLOCK
      ?auto_157354 - BLOCK
      ?auto_157355 - BLOCK
      ?auto_157356 - BLOCK
      ?auto_157357 - BLOCK
      ?auto_157358 - BLOCK
    )
    :vars
    (
      ?auto_157359 - BLOCK
      ?auto_157360 - BLOCK
      ?auto_157361 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_157353 ?auto_157354 ) ) ( not ( = ?auto_157353 ?auto_157355 ) ) ( not ( = ?auto_157353 ?auto_157356 ) ) ( not ( = ?auto_157353 ?auto_157357 ) ) ( not ( = ?auto_157353 ?auto_157358 ) ) ( not ( = ?auto_157354 ?auto_157355 ) ) ( not ( = ?auto_157354 ?auto_157356 ) ) ( not ( = ?auto_157354 ?auto_157357 ) ) ( not ( = ?auto_157354 ?auto_157358 ) ) ( not ( = ?auto_157355 ?auto_157356 ) ) ( not ( = ?auto_157355 ?auto_157357 ) ) ( not ( = ?auto_157355 ?auto_157358 ) ) ( not ( = ?auto_157356 ?auto_157357 ) ) ( not ( = ?auto_157356 ?auto_157358 ) ) ( not ( = ?auto_157357 ?auto_157358 ) ) ( ON ?auto_157358 ?auto_157359 ) ( not ( = ?auto_157353 ?auto_157359 ) ) ( not ( = ?auto_157354 ?auto_157359 ) ) ( not ( = ?auto_157355 ?auto_157359 ) ) ( not ( = ?auto_157356 ?auto_157359 ) ) ( not ( = ?auto_157357 ?auto_157359 ) ) ( not ( = ?auto_157358 ?auto_157359 ) ) ( ON ?auto_157357 ?auto_157358 ) ( ON-TABLE ?auto_157360 ) ( ON ?auto_157359 ?auto_157360 ) ( not ( = ?auto_157360 ?auto_157359 ) ) ( not ( = ?auto_157360 ?auto_157358 ) ) ( not ( = ?auto_157360 ?auto_157357 ) ) ( not ( = ?auto_157353 ?auto_157360 ) ) ( not ( = ?auto_157354 ?auto_157360 ) ) ( not ( = ?auto_157355 ?auto_157360 ) ) ( not ( = ?auto_157356 ?auto_157360 ) ) ( ON ?auto_157356 ?auto_157357 ) ( ON ?auto_157353 ?auto_157361 ) ( not ( = ?auto_157353 ?auto_157361 ) ) ( not ( = ?auto_157354 ?auto_157361 ) ) ( not ( = ?auto_157355 ?auto_157361 ) ) ( not ( = ?auto_157356 ?auto_157361 ) ) ( not ( = ?auto_157357 ?auto_157361 ) ) ( not ( = ?auto_157358 ?auto_157361 ) ) ( not ( = ?auto_157359 ?auto_157361 ) ) ( not ( = ?auto_157360 ?auto_157361 ) ) ( ON ?auto_157354 ?auto_157353 ) ( ON-TABLE ?auto_157361 ) ( CLEAR ?auto_157356 ) ( ON ?auto_157355 ?auto_157354 ) ( CLEAR ?auto_157355 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_157361 ?auto_157353 ?auto_157354 )
      ( MAKE-6PILE ?auto_157353 ?auto_157354 ?auto_157355 ?auto_157356 ?auto_157357 ?auto_157358 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_157362 - BLOCK
      ?auto_157363 - BLOCK
      ?auto_157364 - BLOCK
      ?auto_157365 - BLOCK
      ?auto_157366 - BLOCK
      ?auto_157367 - BLOCK
    )
    :vars
    (
      ?auto_157370 - BLOCK
      ?auto_157368 - BLOCK
      ?auto_157369 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_157362 ?auto_157363 ) ) ( not ( = ?auto_157362 ?auto_157364 ) ) ( not ( = ?auto_157362 ?auto_157365 ) ) ( not ( = ?auto_157362 ?auto_157366 ) ) ( not ( = ?auto_157362 ?auto_157367 ) ) ( not ( = ?auto_157363 ?auto_157364 ) ) ( not ( = ?auto_157363 ?auto_157365 ) ) ( not ( = ?auto_157363 ?auto_157366 ) ) ( not ( = ?auto_157363 ?auto_157367 ) ) ( not ( = ?auto_157364 ?auto_157365 ) ) ( not ( = ?auto_157364 ?auto_157366 ) ) ( not ( = ?auto_157364 ?auto_157367 ) ) ( not ( = ?auto_157365 ?auto_157366 ) ) ( not ( = ?auto_157365 ?auto_157367 ) ) ( not ( = ?auto_157366 ?auto_157367 ) ) ( ON ?auto_157367 ?auto_157370 ) ( not ( = ?auto_157362 ?auto_157370 ) ) ( not ( = ?auto_157363 ?auto_157370 ) ) ( not ( = ?auto_157364 ?auto_157370 ) ) ( not ( = ?auto_157365 ?auto_157370 ) ) ( not ( = ?auto_157366 ?auto_157370 ) ) ( not ( = ?auto_157367 ?auto_157370 ) ) ( ON ?auto_157366 ?auto_157367 ) ( ON-TABLE ?auto_157368 ) ( ON ?auto_157370 ?auto_157368 ) ( not ( = ?auto_157368 ?auto_157370 ) ) ( not ( = ?auto_157368 ?auto_157367 ) ) ( not ( = ?auto_157368 ?auto_157366 ) ) ( not ( = ?auto_157362 ?auto_157368 ) ) ( not ( = ?auto_157363 ?auto_157368 ) ) ( not ( = ?auto_157364 ?auto_157368 ) ) ( not ( = ?auto_157365 ?auto_157368 ) ) ( ON ?auto_157362 ?auto_157369 ) ( not ( = ?auto_157362 ?auto_157369 ) ) ( not ( = ?auto_157363 ?auto_157369 ) ) ( not ( = ?auto_157364 ?auto_157369 ) ) ( not ( = ?auto_157365 ?auto_157369 ) ) ( not ( = ?auto_157366 ?auto_157369 ) ) ( not ( = ?auto_157367 ?auto_157369 ) ) ( not ( = ?auto_157370 ?auto_157369 ) ) ( not ( = ?auto_157368 ?auto_157369 ) ) ( ON ?auto_157363 ?auto_157362 ) ( ON-TABLE ?auto_157369 ) ( ON ?auto_157364 ?auto_157363 ) ( CLEAR ?auto_157364 ) ( HOLDING ?auto_157365 ) ( CLEAR ?auto_157366 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_157368 ?auto_157370 ?auto_157367 ?auto_157366 ?auto_157365 )
      ( MAKE-6PILE ?auto_157362 ?auto_157363 ?auto_157364 ?auto_157365 ?auto_157366 ?auto_157367 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_157371 - BLOCK
      ?auto_157372 - BLOCK
      ?auto_157373 - BLOCK
      ?auto_157374 - BLOCK
      ?auto_157375 - BLOCK
      ?auto_157376 - BLOCK
    )
    :vars
    (
      ?auto_157378 - BLOCK
      ?auto_157377 - BLOCK
      ?auto_157379 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_157371 ?auto_157372 ) ) ( not ( = ?auto_157371 ?auto_157373 ) ) ( not ( = ?auto_157371 ?auto_157374 ) ) ( not ( = ?auto_157371 ?auto_157375 ) ) ( not ( = ?auto_157371 ?auto_157376 ) ) ( not ( = ?auto_157372 ?auto_157373 ) ) ( not ( = ?auto_157372 ?auto_157374 ) ) ( not ( = ?auto_157372 ?auto_157375 ) ) ( not ( = ?auto_157372 ?auto_157376 ) ) ( not ( = ?auto_157373 ?auto_157374 ) ) ( not ( = ?auto_157373 ?auto_157375 ) ) ( not ( = ?auto_157373 ?auto_157376 ) ) ( not ( = ?auto_157374 ?auto_157375 ) ) ( not ( = ?auto_157374 ?auto_157376 ) ) ( not ( = ?auto_157375 ?auto_157376 ) ) ( ON ?auto_157376 ?auto_157378 ) ( not ( = ?auto_157371 ?auto_157378 ) ) ( not ( = ?auto_157372 ?auto_157378 ) ) ( not ( = ?auto_157373 ?auto_157378 ) ) ( not ( = ?auto_157374 ?auto_157378 ) ) ( not ( = ?auto_157375 ?auto_157378 ) ) ( not ( = ?auto_157376 ?auto_157378 ) ) ( ON ?auto_157375 ?auto_157376 ) ( ON-TABLE ?auto_157377 ) ( ON ?auto_157378 ?auto_157377 ) ( not ( = ?auto_157377 ?auto_157378 ) ) ( not ( = ?auto_157377 ?auto_157376 ) ) ( not ( = ?auto_157377 ?auto_157375 ) ) ( not ( = ?auto_157371 ?auto_157377 ) ) ( not ( = ?auto_157372 ?auto_157377 ) ) ( not ( = ?auto_157373 ?auto_157377 ) ) ( not ( = ?auto_157374 ?auto_157377 ) ) ( ON ?auto_157371 ?auto_157379 ) ( not ( = ?auto_157371 ?auto_157379 ) ) ( not ( = ?auto_157372 ?auto_157379 ) ) ( not ( = ?auto_157373 ?auto_157379 ) ) ( not ( = ?auto_157374 ?auto_157379 ) ) ( not ( = ?auto_157375 ?auto_157379 ) ) ( not ( = ?auto_157376 ?auto_157379 ) ) ( not ( = ?auto_157378 ?auto_157379 ) ) ( not ( = ?auto_157377 ?auto_157379 ) ) ( ON ?auto_157372 ?auto_157371 ) ( ON-TABLE ?auto_157379 ) ( ON ?auto_157373 ?auto_157372 ) ( CLEAR ?auto_157375 ) ( ON ?auto_157374 ?auto_157373 ) ( CLEAR ?auto_157374 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_157379 ?auto_157371 ?auto_157372 ?auto_157373 )
      ( MAKE-6PILE ?auto_157371 ?auto_157372 ?auto_157373 ?auto_157374 ?auto_157375 ?auto_157376 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_157380 - BLOCK
      ?auto_157381 - BLOCK
      ?auto_157382 - BLOCK
      ?auto_157383 - BLOCK
      ?auto_157384 - BLOCK
      ?auto_157385 - BLOCK
    )
    :vars
    (
      ?auto_157388 - BLOCK
      ?auto_157387 - BLOCK
      ?auto_157386 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_157380 ?auto_157381 ) ) ( not ( = ?auto_157380 ?auto_157382 ) ) ( not ( = ?auto_157380 ?auto_157383 ) ) ( not ( = ?auto_157380 ?auto_157384 ) ) ( not ( = ?auto_157380 ?auto_157385 ) ) ( not ( = ?auto_157381 ?auto_157382 ) ) ( not ( = ?auto_157381 ?auto_157383 ) ) ( not ( = ?auto_157381 ?auto_157384 ) ) ( not ( = ?auto_157381 ?auto_157385 ) ) ( not ( = ?auto_157382 ?auto_157383 ) ) ( not ( = ?auto_157382 ?auto_157384 ) ) ( not ( = ?auto_157382 ?auto_157385 ) ) ( not ( = ?auto_157383 ?auto_157384 ) ) ( not ( = ?auto_157383 ?auto_157385 ) ) ( not ( = ?auto_157384 ?auto_157385 ) ) ( ON ?auto_157385 ?auto_157388 ) ( not ( = ?auto_157380 ?auto_157388 ) ) ( not ( = ?auto_157381 ?auto_157388 ) ) ( not ( = ?auto_157382 ?auto_157388 ) ) ( not ( = ?auto_157383 ?auto_157388 ) ) ( not ( = ?auto_157384 ?auto_157388 ) ) ( not ( = ?auto_157385 ?auto_157388 ) ) ( ON-TABLE ?auto_157387 ) ( ON ?auto_157388 ?auto_157387 ) ( not ( = ?auto_157387 ?auto_157388 ) ) ( not ( = ?auto_157387 ?auto_157385 ) ) ( not ( = ?auto_157387 ?auto_157384 ) ) ( not ( = ?auto_157380 ?auto_157387 ) ) ( not ( = ?auto_157381 ?auto_157387 ) ) ( not ( = ?auto_157382 ?auto_157387 ) ) ( not ( = ?auto_157383 ?auto_157387 ) ) ( ON ?auto_157380 ?auto_157386 ) ( not ( = ?auto_157380 ?auto_157386 ) ) ( not ( = ?auto_157381 ?auto_157386 ) ) ( not ( = ?auto_157382 ?auto_157386 ) ) ( not ( = ?auto_157383 ?auto_157386 ) ) ( not ( = ?auto_157384 ?auto_157386 ) ) ( not ( = ?auto_157385 ?auto_157386 ) ) ( not ( = ?auto_157388 ?auto_157386 ) ) ( not ( = ?auto_157387 ?auto_157386 ) ) ( ON ?auto_157381 ?auto_157380 ) ( ON-TABLE ?auto_157386 ) ( ON ?auto_157382 ?auto_157381 ) ( ON ?auto_157383 ?auto_157382 ) ( CLEAR ?auto_157383 ) ( HOLDING ?auto_157384 ) ( CLEAR ?auto_157385 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_157387 ?auto_157388 ?auto_157385 ?auto_157384 )
      ( MAKE-6PILE ?auto_157380 ?auto_157381 ?auto_157382 ?auto_157383 ?auto_157384 ?auto_157385 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_157389 - BLOCK
      ?auto_157390 - BLOCK
      ?auto_157391 - BLOCK
      ?auto_157392 - BLOCK
      ?auto_157393 - BLOCK
      ?auto_157394 - BLOCK
    )
    :vars
    (
      ?auto_157397 - BLOCK
      ?auto_157396 - BLOCK
      ?auto_157395 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_157389 ?auto_157390 ) ) ( not ( = ?auto_157389 ?auto_157391 ) ) ( not ( = ?auto_157389 ?auto_157392 ) ) ( not ( = ?auto_157389 ?auto_157393 ) ) ( not ( = ?auto_157389 ?auto_157394 ) ) ( not ( = ?auto_157390 ?auto_157391 ) ) ( not ( = ?auto_157390 ?auto_157392 ) ) ( not ( = ?auto_157390 ?auto_157393 ) ) ( not ( = ?auto_157390 ?auto_157394 ) ) ( not ( = ?auto_157391 ?auto_157392 ) ) ( not ( = ?auto_157391 ?auto_157393 ) ) ( not ( = ?auto_157391 ?auto_157394 ) ) ( not ( = ?auto_157392 ?auto_157393 ) ) ( not ( = ?auto_157392 ?auto_157394 ) ) ( not ( = ?auto_157393 ?auto_157394 ) ) ( ON ?auto_157394 ?auto_157397 ) ( not ( = ?auto_157389 ?auto_157397 ) ) ( not ( = ?auto_157390 ?auto_157397 ) ) ( not ( = ?auto_157391 ?auto_157397 ) ) ( not ( = ?auto_157392 ?auto_157397 ) ) ( not ( = ?auto_157393 ?auto_157397 ) ) ( not ( = ?auto_157394 ?auto_157397 ) ) ( ON-TABLE ?auto_157396 ) ( ON ?auto_157397 ?auto_157396 ) ( not ( = ?auto_157396 ?auto_157397 ) ) ( not ( = ?auto_157396 ?auto_157394 ) ) ( not ( = ?auto_157396 ?auto_157393 ) ) ( not ( = ?auto_157389 ?auto_157396 ) ) ( not ( = ?auto_157390 ?auto_157396 ) ) ( not ( = ?auto_157391 ?auto_157396 ) ) ( not ( = ?auto_157392 ?auto_157396 ) ) ( ON ?auto_157389 ?auto_157395 ) ( not ( = ?auto_157389 ?auto_157395 ) ) ( not ( = ?auto_157390 ?auto_157395 ) ) ( not ( = ?auto_157391 ?auto_157395 ) ) ( not ( = ?auto_157392 ?auto_157395 ) ) ( not ( = ?auto_157393 ?auto_157395 ) ) ( not ( = ?auto_157394 ?auto_157395 ) ) ( not ( = ?auto_157397 ?auto_157395 ) ) ( not ( = ?auto_157396 ?auto_157395 ) ) ( ON ?auto_157390 ?auto_157389 ) ( ON-TABLE ?auto_157395 ) ( ON ?auto_157391 ?auto_157390 ) ( ON ?auto_157392 ?auto_157391 ) ( CLEAR ?auto_157394 ) ( ON ?auto_157393 ?auto_157392 ) ( CLEAR ?auto_157393 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_157395 ?auto_157389 ?auto_157390 ?auto_157391 ?auto_157392 )
      ( MAKE-6PILE ?auto_157389 ?auto_157390 ?auto_157391 ?auto_157392 ?auto_157393 ?auto_157394 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_157398 - BLOCK
      ?auto_157399 - BLOCK
      ?auto_157400 - BLOCK
      ?auto_157401 - BLOCK
      ?auto_157402 - BLOCK
      ?auto_157403 - BLOCK
    )
    :vars
    (
      ?auto_157405 - BLOCK
      ?auto_157404 - BLOCK
      ?auto_157406 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_157398 ?auto_157399 ) ) ( not ( = ?auto_157398 ?auto_157400 ) ) ( not ( = ?auto_157398 ?auto_157401 ) ) ( not ( = ?auto_157398 ?auto_157402 ) ) ( not ( = ?auto_157398 ?auto_157403 ) ) ( not ( = ?auto_157399 ?auto_157400 ) ) ( not ( = ?auto_157399 ?auto_157401 ) ) ( not ( = ?auto_157399 ?auto_157402 ) ) ( not ( = ?auto_157399 ?auto_157403 ) ) ( not ( = ?auto_157400 ?auto_157401 ) ) ( not ( = ?auto_157400 ?auto_157402 ) ) ( not ( = ?auto_157400 ?auto_157403 ) ) ( not ( = ?auto_157401 ?auto_157402 ) ) ( not ( = ?auto_157401 ?auto_157403 ) ) ( not ( = ?auto_157402 ?auto_157403 ) ) ( not ( = ?auto_157398 ?auto_157405 ) ) ( not ( = ?auto_157399 ?auto_157405 ) ) ( not ( = ?auto_157400 ?auto_157405 ) ) ( not ( = ?auto_157401 ?auto_157405 ) ) ( not ( = ?auto_157402 ?auto_157405 ) ) ( not ( = ?auto_157403 ?auto_157405 ) ) ( ON-TABLE ?auto_157404 ) ( ON ?auto_157405 ?auto_157404 ) ( not ( = ?auto_157404 ?auto_157405 ) ) ( not ( = ?auto_157404 ?auto_157403 ) ) ( not ( = ?auto_157404 ?auto_157402 ) ) ( not ( = ?auto_157398 ?auto_157404 ) ) ( not ( = ?auto_157399 ?auto_157404 ) ) ( not ( = ?auto_157400 ?auto_157404 ) ) ( not ( = ?auto_157401 ?auto_157404 ) ) ( ON ?auto_157398 ?auto_157406 ) ( not ( = ?auto_157398 ?auto_157406 ) ) ( not ( = ?auto_157399 ?auto_157406 ) ) ( not ( = ?auto_157400 ?auto_157406 ) ) ( not ( = ?auto_157401 ?auto_157406 ) ) ( not ( = ?auto_157402 ?auto_157406 ) ) ( not ( = ?auto_157403 ?auto_157406 ) ) ( not ( = ?auto_157405 ?auto_157406 ) ) ( not ( = ?auto_157404 ?auto_157406 ) ) ( ON ?auto_157399 ?auto_157398 ) ( ON-TABLE ?auto_157406 ) ( ON ?auto_157400 ?auto_157399 ) ( ON ?auto_157401 ?auto_157400 ) ( ON ?auto_157402 ?auto_157401 ) ( CLEAR ?auto_157402 ) ( HOLDING ?auto_157403 ) ( CLEAR ?auto_157405 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_157404 ?auto_157405 ?auto_157403 )
      ( MAKE-6PILE ?auto_157398 ?auto_157399 ?auto_157400 ?auto_157401 ?auto_157402 ?auto_157403 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_157407 - BLOCK
      ?auto_157408 - BLOCK
      ?auto_157409 - BLOCK
      ?auto_157410 - BLOCK
      ?auto_157411 - BLOCK
      ?auto_157412 - BLOCK
    )
    :vars
    (
      ?auto_157415 - BLOCK
      ?auto_157414 - BLOCK
      ?auto_157413 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_157407 ?auto_157408 ) ) ( not ( = ?auto_157407 ?auto_157409 ) ) ( not ( = ?auto_157407 ?auto_157410 ) ) ( not ( = ?auto_157407 ?auto_157411 ) ) ( not ( = ?auto_157407 ?auto_157412 ) ) ( not ( = ?auto_157408 ?auto_157409 ) ) ( not ( = ?auto_157408 ?auto_157410 ) ) ( not ( = ?auto_157408 ?auto_157411 ) ) ( not ( = ?auto_157408 ?auto_157412 ) ) ( not ( = ?auto_157409 ?auto_157410 ) ) ( not ( = ?auto_157409 ?auto_157411 ) ) ( not ( = ?auto_157409 ?auto_157412 ) ) ( not ( = ?auto_157410 ?auto_157411 ) ) ( not ( = ?auto_157410 ?auto_157412 ) ) ( not ( = ?auto_157411 ?auto_157412 ) ) ( not ( = ?auto_157407 ?auto_157415 ) ) ( not ( = ?auto_157408 ?auto_157415 ) ) ( not ( = ?auto_157409 ?auto_157415 ) ) ( not ( = ?auto_157410 ?auto_157415 ) ) ( not ( = ?auto_157411 ?auto_157415 ) ) ( not ( = ?auto_157412 ?auto_157415 ) ) ( ON-TABLE ?auto_157414 ) ( ON ?auto_157415 ?auto_157414 ) ( not ( = ?auto_157414 ?auto_157415 ) ) ( not ( = ?auto_157414 ?auto_157412 ) ) ( not ( = ?auto_157414 ?auto_157411 ) ) ( not ( = ?auto_157407 ?auto_157414 ) ) ( not ( = ?auto_157408 ?auto_157414 ) ) ( not ( = ?auto_157409 ?auto_157414 ) ) ( not ( = ?auto_157410 ?auto_157414 ) ) ( ON ?auto_157407 ?auto_157413 ) ( not ( = ?auto_157407 ?auto_157413 ) ) ( not ( = ?auto_157408 ?auto_157413 ) ) ( not ( = ?auto_157409 ?auto_157413 ) ) ( not ( = ?auto_157410 ?auto_157413 ) ) ( not ( = ?auto_157411 ?auto_157413 ) ) ( not ( = ?auto_157412 ?auto_157413 ) ) ( not ( = ?auto_157415 ?auto_157413 ) ) ( not ( = ?auto_157414 ?auto_157413 ) ) ( ON ?auto_157408 ?auto_157407 ) ( ON-TABLE ?auto_157413 ) ( ON ?auto_157409 ?auto_157408 ) ( ON ?auto_157410 ?auto_157409 ) ( ON ?auto_157411 ?auto_157410 ) ( CLEAR ?auto_157415 ) ( ON ?auto_157412 ?auto_157411 ) ( CLEAR ?auto_157412 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_157413 ?auto_157407 ?auto_157408 ?auto_157409 ?auto_157410 ?auto_157411 )
      ( MAKE-6PILE ?auto_157407 ?auto_157408 ?auto_157409 ?auto_157410 ?auto_157411 ?auto_157412 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_157416 - BLOCK
      ?auto_157417 - BLOCK
      ?auto_157418 - BLOCK
      ?auto_157419 - BLOCK
      ?auto_157420 - BLOCK
      ?auto_157421 - BLOCK
    )
    :vars
    (
      ?auto_157424 - BLOCK
      ?auto_157422 - BLOCK
      ?auto_157423 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_157416 ?auto_157417 ) ) ( not ( = ?auto_157416 ?auto_157418 ) ) ( not ( = ?auto_157416 ?auto_157419 ) ) ( not ( = ?auto_157416 ?auto_157420 ) ) ( not ( = ?auto_157416 ?auto_157421 ) ) ( not ( = ?auto_157417 ?auto_157418 ) ) ( not ( = ?auto_157417 ?auto_157419 ) ) ( not ( = ?auto_157417 ?auto_157420 ) ) ( not ( = ?auto_157417 ?auto_157421 ) ) ( not ( = ?auto_157418 ?auto_157419 ) ) ( not ( = ?auto_157418 ?auto_157420 ) ) ( not ( = ?auto_157418 ?auto_157421 ) ) ( not ( = ?auto_157419 ?auto_157420 ) ) ( not ( = ?auto_157419 ?auto_157421 ) ) ( not ( = ?auto_157420 ?auto_157421 ) ) ( not ( = ?auto_157416 ?auto_157424 ) ) ( not ( = ?auto_157417 ?auto_157424 ) ) ( not ( = ?auto_157418 ?auto_157424 ) ) ( not ( = ?auto_157419 ?auto_157424 ) ) ( not ( = ?auto_157420 ?auto_157424 ) ) ( not ( = ?auto_157421 ?auto_157424 ) ) ( ON-TABLE ?auto_157422 ) ( not ( = ?auto_157422 ?auto_157424 ) ) ( not ( = ?auto_157422 ?auto_157421 ) ) ( not ( = ?auto_157422 ?auto_157420 ) ) ( not ( = ?auto_157416 ?auto_157422 ) ) ( not ( = ?auto_157417 ?auto_157422 ) ) ( not ( = ?auto_157418 ?auto_157422 ) ) ( not ( = ?auto_157419 ?auto_157422 ) ) ( ON ?auto_157416 ?auto_157423 ) ( not ( = ?auto_157416 ?auto_157423 ) ) ( not ( = ?auto_157417 ?auto_157423 ) ) ( not ( = ?auto_157418 ?auto_157423 ) ) ( not ( = ?auto_157419 ?auto_157423 ) ) ( not ( = ?auto_157420 ?auto_157423 ) ) ( not ( = ?auto_157421 ?auto_157423 ) ) ( not ( = ?auto_157424 ?auto_157423 ) ) ( not ( = ?auto_157422 ?auto_157423 ) ) ( ON ?auto_157417 ?auto_157416 ) ( ON-TABLE ?auto_157423 ) ( ON ?auto_157418 ?auto_157417 ) ( ON ?auto_157419 ?auto_157418 ) ( ON ?auto_157420 ?auto_157419 ) ( ON ?auto_157421 ?auto_157420 ) ( CLEAR ?auto_157421 ) ( HOLDING ?auto_157424 ) ( CLEAR ?auto_157422 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_157422 ?auto_157424 )
      ( MAKE-6PILE ?auto_157416 ?auto_157417 ?auto_157418 ?auto_157419 ?auto_157420 ?auto_157421 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_157425 - BLOCK
      ?auto_157426 - BLOCK
      ?auto_157427 - BLOCK
      ?auto_157428 - BLOCK
      ?auto_157429 - BLOCK
      ?auto_157430 - BLOCK
    )
    :vars
    (
      ?auto_157432 - BLOCK
      ?auto_157431 - BLOCK
      ?auto_157433 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_157425 ?auto_157426 ) ) ( not ( = ?auto_157425 ?auto_157427 ) ) ( not ( = ?auto_157425 ?auto_157428 ) ) ( not ( = ?auto_157425 ?auto_157429 ) ) ( not ( = ?auto_157425 ?auto_157430 ) ) ( not ( = ?auto_157426 ?auto_157427 ) ) ( not ( = ?auto_157426 ?auto_157428 ) ) ( not ( = ?auto_157426 ?auto_157429 ) ) ( not ( = ?auto_157426 ?auto_157430 ) ) ( not ( = ?auto_157427 ?auto_157428 ) ) ( not ( = ?auto_157427 ?auto_157429 ) ) ( not ( = ?auto_157427 ?auto_157430 ) ) ( not ( = ?auto_157428 ?auto_157429 ) ) ( not ( = ?auto_157428 ?auto_157430 ) ) ( not ( = ?auto_157429 ?auto_157430 ) ) ( not ( = ?auto_157425 ?auto_157432 ) ) ( not ( = ?auto_157426 ?auto_157432 ) ) ( not ( = ?auto_157427 ?auto_157432 ) ) ( not ( = ?auto_157428 ?auto_157432 ) ) ( not ( = ?auto_157429 ?auto_157432 ) ) ( not ( = ?auto_157430 ?auto_157432 ) ) ( ON-TABLE ?auto_157431 ) ( not ( = ?auto_157431 ?auto_157432 ) ) ( not ( = ?auto_157431 ?auto_157430 ) ) ( not ( = ?auto_157431 ?auto_157429 ) ) ( not ( = ?auto_157425 ?auto_157431 ) ) ( not ( = ?auto_157426 ?auto_157431 ) ) ( not ( = ?auto_157427 ?auto_157431 ) ) ( not ( = ?auto_157428 ?auto_157431 ) ) ( ON ?auto_157425 ?auto_157433 ) ( not ( = ?auto_157425 ?auto_157433 ) ) ( not ( = ?auto_157426 ?auto_157433 ) ) ( not ( = ?auto_157427 ?auto_157433 ) ) ( not ( = ?auto_157428 ?auto_157433 ) ) ( not ( = ?auto_157429 ?auto_157433 ) ) ( not ( = ?auto_157430 ?auto_157433 ) ) ( not ( = ?auto_157432 ?auto_157433 ) ) ( not ( = ?auto_157431 ?auto_157433 ) ) ( ON ?auto_157426 ?auto_157425 ) ( ON-TABLE ?auto_157433 ) ( ON ?auto_157427 ?auto_157426 ) ( ON ?auto_157428 ?auto_157427 ) ( ON ?auto_157429 ?auto_157428 ) ( ON ?auto_157430 ?auto_157429 ) ( CLEAR ?auto_157431 ) ( ON ?auto_157432 ?auto_157430 ) ( CLEAR ?auto_157432 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_157433 ?auto_157425 ?auto_157426 ?auto_157427 ?auto_157428 ?auto_157429 ?auto_157430 )
      ( MAKE-6PILE ?auto_157425 ?auto_157426 ?auto_157427 ?auto_157428 ?auto_157429 ?auto_157430 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_157434 - BLOCK
      ?auto_157435 - BLOCK
      ?auto_157436 - BLOCK
      ?auto_157437 - BLOCK
      ?auto_157438 - BLOCK
      ?auto_157439 - BLOCK
    )
    :vars
    (
      ?auto_157441 - BLOCK
      ?auto_157442 - BLOCK
      ?auto_157440 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_157434 ?auto_157435 ) ) ( not ( = ?auto_157434 ?auto_157436 ) ) ( not ( = ?auto_157434 ?auto_157437 ) ) ( not ( = ?auto_157434 ?auto_157438 ) ) ( not ( = ?auto_157434 ?auto_157439 ) ) ( not ( = ?auto_157435 ?auto_157436 ) ) ( not ( = ?auto_157435 ?auto_157437 ) ) ( not ( = ?auto_157435 ?auto_157438 ) ) ( not ( = ?auto_157435 ?auto_157439 ) ) ( not ( = ?auto_157436 ?auto_157437 ) ) ( not ( = ?auto_157436 ?auto_157438 ) ) ( not ( = ?auto_157436 ?auto_157439 ) ) ( not ( = ?auto_157437 ?auto_157438 ) ) ( not ( = ?auto_157437 ?auto_157439 ) ) ( not ( = ?auto_157438 ?auto_157439 ) ) ( not ( = ?auto_157434 ?auto_157441 ) ) ( not ( = ?auto_157435 ?auto_157441 ) ) ( not ( = ?auto_157436 ?auto_157441 ) ) ( not ( = ?auto_157437 ?auto_157441 ) ) ( not ( = ?auto_157438 ?auto_157441 ) ) ( not ( = ?auto_157439 ?auto_157441 ) ) ( not ( = ?auto_157442 ?auto_157441 ) ) ( not ( = ?auto_157442 ?auto_157439 ) ) ( not ( = ?auto_157442 ?auto_157438 ) ) ( not ( = ?auto_157434 ?auto_157442 ) ) ( not ( = ?auto_157435 ?auto_157442 ) ) ( not ( = ?auto_157436 ?auto_157442 ) ) ( not ( = ?auto_157437 ?auto_157442 ) ) ( ON ?auto_157434 ?auto_157440 ) ( not ( = ?auto_157434 ?auto_157440 ) ) ( not ( = ?auto_157435 ?auto_157440 ) ) ( not ( = ?auto_157436 ?auto_157440 ) ) ( not ( = ?auto_157437 ?auto_157440 ) ) ( not ( = ?auto_157438 ?auto_157440 ) ) ( not ( = ?auto_157439 ?auto_157440 ) ) ( not ( = ?auto_157441 ?auto_157440 ) ) ( not ( = ?auto_157442 ?auto_157440 ) ) ( ON ?auto_157435 ?auto_157434 ) ( ON-TABLE ?auto_157440 ) ( ON ?auto_157436 ?auto_157435 ) ( ON ?auto_157437 ?auto_157436 ) ( ON ?auto_157438 ?auto_157437 ) ( ON ?auto_157439 ?auto_157438 ) ( ON ?auto_157441 ?auto_157439 ) ( CLEAR ?auto_157441 ) ( HOLDING ?auto_157442 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_157442 )
      ( MAKE-6PILE ?auto_157434 ?auto_157435 ?auto_157436 ?auto_157437 ?auto_157438 ?auto_157439 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_157443 - BLOCK
      ?auto_157444 - BLOCK
      ?auto_157445 - BLOCK
      ?auto_157446 - BLOCK
      ?auto_157447 - BLOCK
      ?auto_157448 - BLOCK
    )
    :vars
    (
      ?auto_157451 - BLOCK
      ?auto_157450 - BLOCK
      ?auto_157449 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_157443 ?auto_157444 ) ) ( not ( = ?auto_157443 ?auto_157445 ) ) ( not ( = ?auto_157443 ?auto_157446 ) ) ( not ( = ?auto_157443 ?auto_157447 ) ) ( not ( = ?auto_157443 ?auto_157448 ) ) ( not ( = ?auto_157444 ?auto_157445 ) ) ( not ( = ?auto_157444 ?auto_157446 ) ) ( not ( = ?auto_157444 ?auto_157447 ) ) ( not ( = ?auto_157444 ?auto_157448 ) ) ( not ( = ?auto_157445 ?auto_157446 ) ) ( not ( = ?auto_157445 ?auto_157447 ) ) ( not ( = ?auto_157445 ?auto_157448 ) ) ( not ( = ?auto_157446 ?auto_157447 ) ) ( not ( = ?auto_157446 ?auto_157448 ) ) ( not ( = ?auto_157447 ?auto_157448 ) ) ( not ( = ?auto_157443 ?auto_157451 ) ) ( not ( = ?auto_157444 ?auto_157451 ) ) ( not ( = ?auto_157445 ?auto_157451 ) ) ( not ( = ?auto_157446 ?auto_157451 ) ) ( not ( = ?auto_157447 ?auto_157451 ) ) ( not ( = ?auto_157448 ?auto_157451 ) ) ( not ( = ?auto_157450 ?auto_157451 ) ) ( not ( = ?auto_157450 ?auto_157448 ) ) ( not ( = ?auto_157450 ?auto_157447 ) ) ( not ( = ?auto_157443 ?auto_157450 ) ) ( not ( = ?auto_157444 ?auto_157450 ) ) ( not ( = ?auto_157445 ?auto_157450 ) ) ( not ( = ?auto_157446 ?auto_157450 ) ) ( ON ?auto_157443 ?auto_157449 ) ( not ( = ?auto_157443 ?auto_157449 ) ) ( not ( = ?auto_157444 ?auto_157449 ) ) ( not ( = ?auto_157445 ?auto_157449 ) ) ( not ( = ?auto_157446 ?auto_157449 ) ) ( not ( = ?auto_157447 ?auto_157449 ) ) ( not ( = ?auto_157448 ?auto_157449 ) ) ( not ( = ?auto_157451 ?auto_157449 ) ) ( not ( = ?auto_157450 ?auto_157449 ) ) ( ON ?auto_157444 ?auto_157443 ) ( ON-TABLE ?auto_157449 ) ( ON ?auto_157445 ?auto_157444 ) ( ON ?auto_157446 ?auto_157445 ) ( ON ?auto_157447 ?auto_157446 ) ( ON ?auto_157448 ?auto_157447 ) ( ON ?auto_157451 ?auto_157448 ) ( ON ?auto_157450 ?auto_157451 ) ( CLEAR ?auto_157450 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_157449 ?auto_157443 ?auto_157444 ?auto_157445 ?auto_157446 ?auto_157447 ?auto_157448 ?auto_157451 )
      ( MAKE-6PILE ?auto_157443 ?auto_157444 ?auto_157445 ?auto_157446 ?auto_157447 ?auto_157448 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_157463 - BLOCK
    )
    :vars
    (
      ?auto_157464 - BLOCK
      ?auto_157465 - BLOCK
      ?auto_157466 - BLOCK
      ?auto_157469 - BLOCK
      ?auto_157470 - BLOCK
      ?auto_157467 - BLOCK
      ?auto_157468 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_157464 ?auto_157463 ) ( ON-TABLE ?auto_157463 ) ( not ( = ?auto_157463 ?auto_157464 ) ) ( not ( = ?auto_157463 ?auto_157465 ) ) ( not ( = ?auto_157463 ?auto_157466 ) ) ( not ( = ?auto_157464 ?auto_157465 ) ) ( not ( = ?auto_157464 ?auto_157466 ) ) ( not ( = ?auto_157465 ?auto_157466 ) ) ( ON ?auto_157465 ?auto_157464 ) ( CLEAR ?auto_157465 ) ( HOLDING ?auto_157466 ) ( CLEAR ?auto_157469 ) ( ON-TABLE ?auto_157470 ) ( ON ?auto_157467 ?auto_157470 ) ( ON ?auto_157468 ?auto_157467 ) ( ON ?auto_157469 ?auto_157468 ) ( not ( = ?auto_157470 ?auto_157467 ) ) ( not ( = ?auto_157470 ?auto_157468 ) ) ( not ( = ?auto_157470 ?auto_157469 ) ) ( not ( = ?auto_157470 ?auto_157466 ) ) ( not ( = ?auto_157467 ?auto_157468 ) ) ( not ( = ?auto_157467 ?auto_157469 ) ) ( not ( = ?auto_157467 ?auto_157466 ) ) ( not ( = ?auto_157468 ?auto_157469 ) ) ( not ( = ?auto_157468 ?auto_157466 ) ) ( not ( = ?auto_157469 ?auto_157466 ) ) ( not ( = ?auto_157463 ?auto_157469 ) ) ( not ( = ?auto_157463 ?auto_157470 ) ) ( not ( = ?auto_157463 ?auto_157467 ) ) ( not ( = ?auto_157463 ?auto_157468 ) ) ( not ( = ?auto_157464 ?auto_157469 ) ) ( not ( = ?auto_157464 ?auto_157470 ) ) ( not ( = ?auto_157464 ?auto_157467 ) ) ( not ( = ?auto_157464 ?auto_157468 ) ) ( not ( = ?auto_157465 ?auto_157469 ) ) ( not ( = ?auto_157465 ?auto_157470 ) ) ( not ( = ?auto_157465 ?auto_157467 ) ) ( not ( = ?auto_157465 ?auto_157468 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_157470 ?auto_157467 ?auto_157468 ?auto_157469 ?auto_157466 )
      ( MAKE-1PILE ?auto_157463 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_157471 - BLOCK
    )
    :vars
    (
      ?auto_157473 - BLOCK
      ?auto_157476 - BLOCK
      ?auto_157474 - BLOCK
      ?auto_157472 - BLOCK
      ?auto_157475 - BLOCK
      ?auto_157477 - BLOCK
      ?auto_157478 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_157473 ?auto_157471 ) ( ON-TABLE ?auto_157471 ) ( not ( = ?auto_157471 ?auto_157473 ) ) ( not ( = ?auto_157471 ?auto_157476 ) ) ( not ( = ?auto_157471 ?auto_157474 ) ) ( not ( = ?auto_157473 ?auto_157476 ) ) ( not ( = ?auto_157473 ?auto_157474 ) ) ( not ( = ?auto_157476 ?auto_157474 ) ) ( ON ?auto_157476 ?auto_157473 ) ( CLEAR ?auto_157472 ) ( ON-TABLE ?auto_157475 ) ( ON ?auto_157477 ?auto_157475 ) ( ON ?auto_157478 ?auto_157477 ) ( ON ?auto_157472 ?auto_157478 ) ( not ( = ?auto_157475 ?auto_157477 ) ) ( not ( = ?auto_157475 ?auto_157478 ) ) ( not ( = ?auto_157475 ?auto_157472 ) ) ( not ( = ?auto_157475 ?auto_157474 ) ) ( not ( = ?auto_157477 ?auto_157478 ) ) ( not ( = ?auto_157477 ?auto_157472 ) ) ( not ( = ?auto_157477 ?auto_157474 ) ) ( not ( = ?auto_157478 ?auto_157472 ) ) ( not ( = ?auto_157478 ?auto_157474 ) ) ( not ( = ?auto_157472 ?auto_157474 ) ) ( not ( = ?auto_157471 ?auto_157472 ) ) ( not ( = ?auto_157471 ?auto_157475 ) ) ( not ( = ?auto_157471 ?auto_157477 ) ) ( not ( = ?auto_157471 ?auto_157478 ) ) ( not ( = ?auto_157473 ?auto_157472 ) ) ( not ( = ?auto_157473 ?auto_157475 ) ) ( not ( = ?auto_157473 ?auto_157477 ) ) ( not ( = ?auto_157473 ?auto_157478 ) ) ( not ( = ?auto_157476 ?auto_157472 ) ) ( not ( = ?auto_157476 ?auto_157475 ) ) ( not ( = ?auto_157476 ?auto_157477 ) ) ( not ( = ?auto_157476 ?auto_157478 ) ) ( ON ?auto_157474 ?auto_157476 ) ( CLEAR ?auto_157474 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_157471 ?auto_157473 ?auto_157476 )
      ( MAKE-1PILE ?auto_157471 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_157479 - BLOCK
    )
    :vars
    (
      ?auto_157486 - BLOCK
      ?auto_157482 - BLOCK
      ?auto_157481 - BLOCK
      ?auto_157480 - BLOCK
      ?auto_157485 - BLOCK
      ?auto_157483 - BLOCK
      ?auto_157484 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_157486 ?auto_157479 ) ( ON-TABLE ?auto_157479 ) ( not ( = ?auto_157479 ?auto_157486 ) ) ( not ( = ?auto_157479 ?auto_157482 ) ) ( not ( = ?auto_157479 ?auto_157481 ) ) ( not ( = ?auto_157486 ?auto_157482 ) ) ( not ( = ?auto_157486 ?auto_157481 ) ) ( not ( = ?auto_157482 ?auto_157481 ) ) ( ON ?auto_157482 ?auto_157486 ) ( ON-TABLE ?auto_157480 ) ( ON ?auto_157485 ?auto_157480 ) ( ON ?auto_157483 ?auto_157485 ) ( not ( = ?auto_157480 ?auto_157485 ) ) ( not ( = ?auto_157480 ?auto_157483 ) ) ( not ( = ?auto_157480 ?auto_157484 ) ) ( not ( = ?auto_157480 ?auto_157481 ) ) ( not ( = ?auto_157485 ?auto_157483 ) ) ( not ( = ?auto_157485 ?auto_157484 ) ) ( not ( = ?auto_157485 ?auto_157481 ) ) ( not ( = ?auto_157483 ?auto_157484 ) ) ( not ( = ?auto_157483 ?auto_157481 ) ) ( not ( = ?auto_157484 ?auto_157481 ) ) ( not ( = ?auto_157479 ?auto_157484 ) ) ( not ( = ?auto_157479 ?auto_157480 ) ) ( not ( = ?auto_157479 ?auto_157485 ) ) ( not ( = ?auto_157479 ?auto_157483 ) ) ( not ( = ?auto_157486 ?auto_157484 ) ) ( not ( = ?auto_157486 ?auto_157480 ) ) ( not ( = ?auto_157486 ?auto_157485 ) ) ( not ( = ?auto_157486 ?auto_157483 ) ) ( not ( = ?auto_157482 ?auto_157484 ) ) ( not ( = ?auto_157482 ?auto_157480 ) ) ( not ( = ?auto_157482 ?auto_157485 ) ) ( not ( = ?auto_157482 ?auto_157483 ) ) ( ON ?auto_157481 ?auto_157482 ) ( CLEAR ?auto_157481 ) ( HOLDING ?auto_157484 ) ( CLEAR ?auto_157483 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_157480 ?auto_157485 ?auto_157483 ?auto_157484 )
      ( MAKE-1PILE ?auto_157479 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_157487 - BLOCK
    )
    :vars
    (
      ?auto_157491 - BLOCK
      ?auto_157488 - BLOCK
      ?auto_157489 - BLOCK
      ?auto_157490 - BLOCK
      ?auto_157493 - BLOCK
      ?auto_157492 - BLOCK
      ?auto_157494 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_157491 ?auto_157487 ) ( ON-TABLE ?auto_157487 ) ( not ( = ?auto_157487 ?auto_157491 ) ) ( not ( = ?auto_157487 ?auto_157488 ) ) ( not ( = ?auto_157487 ?auto_157489 ) ) ( not ( = ?auto_157491 ?auto_157488 ) ) ( not ( = ?auto_157491 ?auto_157489 ) ) ( not ( = ?auto_157488 ?auto_157489 ) ) ( ON ?auto_157488 ?auto_157491 ) ( ON-TABLE ?auto_157490 ) ( ON ?auto_157493 ?auto_157490 ) ( ON ?auto_157492 ?auto_157493 ) ( not ( = ?auto_157490 ?auto_157493 ) ) ( not ( = ?auto_157490 ?auto_157492 ) ) ( not ( = ?auto_157490 ?auto_157494 ) ) ( not ( = ?auto_157490 ?auto_157489 ) ) ( not ( = ?auto_157493 ?auto_157492 ) ) ( not ( = ?auto_157493 ?auto_157494 ) ) ( not ( = ?auto_157493 ?auto_157489 ) ) ( not ( = ?auto_157492 ?auto_157494 ) ) ( not ( = ?auto_157492 ?auto_157489 ) ) ( not ( = ?auto_157494 ?auto_157489 ) ) ( not ( = ?auto_157487 ?auto_157494 ) ) ( not ( = ?auto_157487 ?auto_157490 ) ) ( not ( = ?auto_157487 ?auto_157493 ) ) ( not ( = ?auto_157487 ?auto_157492 ) ) ( not ( = ?auto_157491 ?auto_157494 ) ) ( not ( = ?auto_157491 ?auto_157490 ) ) ( not ( = ?auto_157491 ?auto_157493 ) ) ( not ( = ?auto_157491 ?auto_157492 ) ) ( not ( = ?auto_157488 ?auto_157494 ) ) ( not ( = ?auto_157488 ?auto_157490 ) ) ( not ( = ?auto_157488 ?auto_157493 ) ) ( not ( = ?auto_157488 ?auto_157492 ) ) ( ON ?auto_157489 ?auto_157488 ) ( CLEAR ?auto_157492 ) ( ON ?auto_157494 ?auto_157489 ) ( CLEAR ?auto_157494 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_157487 ?auto_157491 ?auto_157488 ?auto_157489 )
      ( MAKE-1PILE ?auto_157487 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_157495 - BLOCK
    )
    :vars
    (
      ?auto_157501 - BLOCK
      ?auto_157499 - BLOCK
      ?auto_157498 - BLOCK
      ?auto_157500 - BLOCK
      ?auto_157497 - BLOCK
      ?auto_157502 - BLOCK
      ?auto_157496 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_157501 ?auto_157495 ) ( ON-TABLE ?auto_157495 ) ( not ( = ?auto_157495 ?auto_157501 ) ) ( not ( = ?auto_157495 ?auto_157499 ) ) ( not ( = ?auto_157495 ?auto_157498 ) ) ( not ( = ?auto_157501 ?auto_157499 ) ) ( not ( = ?auto_157501 ?auto_157498 ) ) ( not ( = ?auto_157499 ?auto_157498 ) ) ( ON ?auto_157499 ?auto_157501 ) ( ON-TABLE ?auto_157500 ) ( ON ?auto_157497 ?auto_157500 ) ( not ( = ?auto_157500 ?auto_157497 ) ) ( not ( = ?auto_157500 ?auto_157502 ) ) ( not ( = ?auto_157500 ?auto_157496 ) ) ( not ( = ?auto_157500 ?auto_157498 ) ) ( not ( = ?auto_157497 ?auto_157502 ) ) ( not ( = ?auto_157497 ?auto_157496 ) ) ( not ( = ?auto_157497 ?auto_157498 ) ) ( not ( = ?auto_157502 ?auto_157496 ) ) ( not ( = ?auto_157502 ?auto_157498 ) ) ( not ( = ?auto_157496 ?auto_157498 ) ) ( not ( = ?auto_157495 ?auto_157496 ) ) ( not ( = ?auto_157495 ?auto_157500 ) ) ( not ( = ?auto_157495 ?auto_157497 ) ) ( not ( = ?auto_157495 ?auto_157502 ) ) ( not ( = ?auto_157501 ?auto_157496 ) ) ( not ( = ?auto_157501 ?auto_157500 ) ) ( not ( = ?auto_157501 ?auto_157497 ) ) ( not ( = ?auto_157501 ?auto_157502 ) ) ( not ( = ?auto_157499 ?auto_157496 ) ) ( not ( = ?auto_157499 ?auto_157500 ) ) ( not ( = ?auto_157499 ?auto_157497 ) ) ( not ( = ?auto_157499 ?auto_157502 ) ) ( ON ?auto_157498 ?auto_157499 ) ( ON ?auto_157496 ?auto_157498 ) ( CLEAR ?auto_157496 ) ( HOLDING ?auto_157502 ) ( CLEAR ?auto_157497 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_157500 ?auto_157497 ?auto_157502 )
      ( MAKE-1PILE ?auto_157495 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_157503 - BLOCK
    )
    :vars
    (
      ?auto_157510 - BLOCK
      ?auto_157509 - BLOCK
      ?auto_157506 - BLOCK
      ?auto_157507 - BLOCK
      ?auto_157504 - BLOCK
      ?auto_157505 - BLOCK
      ?auto_157508 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_157510 ?auto_157503 ) ( ON-TABLE ?auto_157503 ) ( not ( = ?auto_157503 ?auto_157510 ) ) ( not ( = ?auto_157503 ?auto_157509 ) ) ( not ( = ?auto_157503 ?auto_157506 ) ) ( not ( = ?auto_157510 ?auto_157509 ) ) ( not ( = ?auto_157510 ?auto_157506 ) ) ( not ( = ?auto_157509 ?auto_157506 ) ) ( ON ?auto_157509 ?auto_157510 ) ( ON-TABLE ?auto_157507 ) ( ON ?auto_157504 ?auto_157507 ) ( not ( = ?auto_157507 ?auto_157504 ) ) ( not ( = ?auto_157507 ?auto_157505 ) ) ( not ( = ?auto_157507 ?auto_157508 ) ) ( not ( = ?auto_157507 ?auto_157506 ) ) ( not ( = ?auto_157504 ?auto_157505 ) ) ( not ( = ?auto_157504 ?auto_157508 ) ) ( not ( = ?auto_157504 ?auto_157506 ) ) ( not ( = ?auto_157505 ?auto_157508 ) ) ( not ( = ?auto_157505 ?auto_157506 ) ) ( not ( = ?auto_157508 ?auto_157506 ) ) ( not ( = ?auto_157503 ?auto_157508 ) ) ( not ( = ?auto_157503 ?auto_157507 ) ) ( not ( = ?auto_157503 ?auto_157504 ) ) ( not ( = ?auto_157503 ?auto_157505 ) ) ( not ( = ?auto_157510 ?auto_157508 ) ) ( not ( = ?auto_157510 ?auto_157507 ) ) ( not ( = ?auto_157510 ?auto_157504 ) ) ( not ( = ?auto_157510 ?auto_157505 ) ) ( not ( = ?auto_157509 ?auto_157508 ) ) ( not ( = ?auto_157509 ?auto_157507 ) ) ( not ( = ?auto_157509 ?auto_157504 ) ) ( not ( = ?auto_157509 ?auto_157505 ) ) ( ON ?auto_157506 ?auto_157509 ) ( ON ?auto_157508 ?auto_157506 ) ( CLEAR ?auto_157504 ) ( ON ?auto_157505 ?auto_157508 ) ( CLEAR ?auto_157505 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_157503 ?auto_157510 ?auto_157509 ?auto_157506 ?auto_157508 )
      ( MAKE-1PILE ?auto_157503 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_157511 - BLOCK
    )
    :vars
    (
      ?auto_157516 - BLOCK
      ?auto_157512 - BLOCK
      ?auto_157513 - BLOCK
      ?auto_157515 - BLOCK
      ?auto_157517 - BLOCK
      ?auto_157518 - BLOCK
      ?auto_157514 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_157516 ?auto_157511 ) ( ON-TABLE ?auto_157511 ) ( not ( = ?auto_157511 ?auto_157516 ) ) ( not ( = ?auto_157511 ?auto_157512 ) ) ( not ( = ?auto_157511 ?auto_157513 ) ) ( not ( = ?auto_157516 ?auto_157512 ) ) ( not ( = ?auto_157516 ?auto_157513 ) ) ( not ( = ?auto_157512 ?auto_157513 ) ) ( ON ?auto_157512 ?auto_157516 ) ( ON-TABLE ?auto_157515 ) ( not ( = ?auto_157515 ?auto_157517 ) ) ( not ( = ?auto_157515 ?auto_157518 ) ) ( not ( = ?auto_157515 ?auto_157514 ) ) ( not ( = ?auto_157515 ?auto_157513 ) ) ( not ( = ?auto_157517 ?auto_157518 ) ) ( not ( = ?auto_157517 ?auto_157514 ) ) ( not ( = ?auto_157517 ?auto_157513 ) ) ( not ( = ?auto_157518 ?auto_157514 ) ) ( not ( = ?auto_157518 ?auto_157513 ) ) ( not ( = ?auto_157514 ?auto_157513 ) ) ( not ( = ?auto_157511 ?auto_157514 ) ) ( not ( = ?auto_157511 ?auto_157515 ) ) ( not ( = ?auto_157511 ?auto_157517 ) ) ( not ( = ?auto_157511 ?auto_157518 ) ) ( not ( = ?auto_157516 ?auto_157514 ) ) ( not ( = ?auto_157516 ?auto_157515 ) ) ( not ( = ?auto_157516 ?auto_157517 ) ) ( not ( = ?auto_157516 ?auto_157518 ) ) ( not ( = ?auto_157512 ?auto_157514 ) ) ( not ( = ?auto_157512 ?auto_157515 ) ) ( not ( = ?auto_157512 ?auto_157517 ) ) ( not ( = ?auto_157512 ?auto_157518 ) ) ( ON ?auto_157513 ?auto_157512 ) ( ON ?auto_157514 ?auto_157513 ) ( ON ?auto_157518 ?auto_157514 ) ( CLEAR ?auto_157518 ) ( HOLDING ?auto_157517 ) ( CLEAR ?auto_157515 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_157515 ?auto_157517 )
      ( MAKE-1PILE ?auto_157511 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_157519 - BLOCK
    )
    :vars
    (
      ?auto_157525 - BLOCK
      ?auto_157524 - BLOCK
      ?auto_157521 - BLOCK
      ?auto_157526 - BLOCK
      ?auto_157522 - BLOCK
      ?auto_157523 - BLOCK
      ?auto_157520 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_157525 ?auto_157519 ) ( ON-TABLE ?auto_157519 ) ( not ( = ?auto_157519 ?auto_157525 ) ) ( not ( = ?auto_157519 ?auto_157524 ) ) ( not ( = ?auto_157519 ?auto_157521 ) ) ( not ( = ?auto_157525 ?auto_157524 ) ) ( not ( = ?auto_157525 ?auto_157521 ) ) ( not ( = ?auto_157524 ?auto_157521 ) ) ( ON ?auto_157524 ?auto_157525 ) ( ON-TABLE ?auto_157526 ) ( not ( = ?auto_157526 ?auto_157522 ) ) ( not ( = ?auto_157526 ?auto_157523 ) ) ( not ( = ?auto_157526 ?auto_157520 ) ) ( not ( = ?auto_157526 ?auto_157521 ) ) ( not ( = ?auto_157522 ?auto_157523 ) ) ( not ( = ?auto_157522 ?auto_157520 ) ) ( not ( = ?auto_157522 ?auto_157521 ) ) ( not ( = ?auto_157523 ?auto_157520 ) ) ( not ( = ?auto_157523 ?auto_157521 ) ) ( not ( = ?auto_157520 ?auto_157521 ) ) ( not ( = ?auto_157519 ?auto_157520 ) ) ( not ( = ?auto_157519 ?auto_157526 ) ) ( not ( = ?auto_157519 ?auto_157522 ) ) ( not ( = ?auto_157519 ?auto_157523 ) ) ( not ( = ?auto_157525 ?auto_157520 ) ) ( not ( = ?auto_157525 ?auto_157526 ) ) ( not ( = ?auto_157525 ?auto_157522 ) ) ( not ( = ?auto_157525 ?auto_157523 ) ) ( not ( = ?auto_157524 ?auto_157520 ) ) ( not ( = ?auto_157524 ?auto_157526 ) ) ( not ( = ?auto_157524 ?auto_157522 ) ) ( not ( = ?auto_157524 ?auto_157523 ) ) ( ON ?auto_157521 ?auto_157524 ) ( ON ?auto_157520 ?auto_157521 ) ( ON ?auto_157523 ?auto_157520 ) ( CLEAR ?auto_157526 ) ( ON ?auto_157522 ?auto_157523 ) ( CLEAR ?auto_157522 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_157519 ?auto_157525 ?auto_157524 ?auto_157521 ?auto_157520 ?auto_157523 )
      ( MAKE-1PILE ?auto_157519 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_157527 - BLOCK
    )
    :vars
    (
      ?auto_157529 - BLOCK
      ?auto_157533 - BLOCK
      ?auto_157528 - BLOCK
      ?auto_157532 - BLOCK
      ?auto_157531 - BLOCK
      ?auto_157534 - BLOCK
      ?auto_157530 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_157529 ?auto_157527 ) ( ON-TABLE ?auto_157527 ) ( not ( = ?auto_157527 ?auto_157529 ) ) ( not ( = ?auto_157527 ?auto_157533 ) ) ( not ( = ?auto_157527 ?auto_157528 ) ) ( not ( = ?auto_157529 ?auto_157533 ) ) ( not ( = ?auto_157529 ?auto_157528 ) ) ( not ( = ?auto_157533 ?auto_157528 ) ) ( ON ?auto_157533 ?auto_157529 ) ( not ( = ?auto_157532 ?auto_157531 ) ) ( not ( = ?auto_157532 ?auto_157534 ) ) ( not ( = ?auto_157532 ?auto_157530 ) ) ( not ( = ?auto_157532 ?auto_157528 ) ) ( not ( = ?auto_157531 ?auto_157534 ) ) ( not ( = ?auto_157531 ?auto_157530 ) ) ( not ( = ?auto_157531 ?auto_157528 ) ) ( not ( = ?auto_157534 ?auto_157530 ) ) ( not ( = ?auto_157534 ?auto_157528 ) ) ( not ( = ?auto_157530 ?auto_157528 ) ) ( not ( = ?auto_157527 ?auto_157530 ) ) ( not ( = ?auto_157527 ?auto_157532 ) ) ( not ( = ?auto_157527 ?auto_157531 ) ) ( not ( = ?auto_157527 ?auto_157534 ) ) ( not ( = ?auto_157529 ?auto_157530 ) ) ( not ( = ?auto_157529 ?auto_157532 ) ) ( not ( = ?auto_157529 ?auto_157531 ) ) ( not ( = ?auto_157529 ?auto_157534 ) ) ( not ( = ?auto_157533 ?auto_157530 ) ) ( not ( = ?auto_157533 ?auto_157532 ) ) ( not ( = ?auto_157533 ?auto_157531 ) ) ( not ( = ?auto_157533 ?auto_157534 ) ) ( ON ?auto_157528 ?auto_157533 ) ( ON ?auto_157530 ?auto_157528 ) ( ON ?auto_157534 ?auto_157530 ) ( ON ?auto_157531 ?auto_157534 ) ( CLEAR ?auto_157531 ) ( HOLDING ?auto_157532 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_157532 )
      ( MAKE-1PILE ?auto_157527 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_157544 - BLOCK
    )
    :vars
    (
      ?auto_157550 - BLOCK
      ?auto_157546 - BLOCK
      ?auto_157548 - BLOCK
      ?auto_157545 - BLOCK
      ?auto_157549 - BLOCK
      ?auto_157547 - BLOCK
      ?auto_157551 - BLOCK
      ?auto_157552 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_157550 ?auto_157544 ) ( ON-TABLE ?auto_157544 ) ( not ( = ?auto_157544 ?auto_157550 ) ) ( not ( = ?auto_157544 ?auto_157546 ) ) ( not ( = ?auto_157544 ?auto_157548 ) ) ( not ( = ?auto_157550 ?auto_157546 ) ) ( not ( = ?auto_157550 ?auto_157548 ) ) ( not ( = ?auto_157546 ?auto_157548 ) ) ( ON ?auto_157546 ?auto_157550 ) ( not ( = ?auto_157545 ?auto_157549 ) ) ( not ( = ?auto_157545 ?auto_157547 ) ) ( not ( = ?auto_157545 ?auto_157551 ) ) ( not ( = ?auto_157545 ?auto_157548 ) ) ( not ( = ?auto_157549 ?auto_157547 ) ) ( not ( = ?auto_157549 ?auto_157551 ) ) ( not ( = ?auto_157549 ?auto_157548 ) ) ( not ( = ?auto_157547 ?auto_157551 ) ) ( not ( = ?auto_157547 ?auto_157548 ) ) ( not ( = ?auto_157551 ?auto_157548 ) ) ( not ( = ?auto_157544 ?auto_157551 ) ) ( not ( = ?auto_157544 ?auto_157545 ) ) ( not ( = ?auto_157544 ?auto_157549 ) ) ( not ( = ?auto_157544 ?auto_157547 ) ) ( not ( = ?auto_157550 ?auto_157551 ) ) ( not ( = ?auto_157550 ?auto_157545 ) ) ( not ( = ?auto_157550 ?auto_157549 ) ) ( not ( = ?auto_157550 ?auto_157547 ) ) ( not ( = ?auto_157546 ?auto_157551 ) ) ( not ( = ?auto_157546 ?auto_157545 ) ) ( not ( = ?auto_157546 ?auto_157549 ) ) ( not ( = ?auto_157546 ?auto_157547 ) ) ( ON ?auto_157548 ?auto_157546 ) ( ON ?auto_157551 ?auto_157548 ) ( ON ?auto_157547 ?auto_157551 ) ( ON ?auto_157549 ?auto_157547 ) ( CLEAR ?auto_157549 ) ( ON ?auto_157545 ?auto_157552 ) ( CLEAR ?auto_157545 ) ( HAND-EMPTY ) ( not ( = ?auto_157544 ?auto_157552 ) ) ( not ( = ?auto_157550 ?auto_157552 ) ) ( not ( = ?auto_157546 ?auto_157552 ) ) ( not ( = ?auto_157548 ?auto_157552 ) ) ( not ( = ?auto_157545 ?auto_157552 ) ) ( not ( = ?auto_157549 ?auto_157552 ) ) ( not ( = ?auto_157547 ?auto_157552 ) ) ( not ( = ?auto_157551 ?auto_157552 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_157545 ?auto_157552 )
      ( MAKE-1PILE ?auto_157544 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_157553 - BLOCK
    )
    :vars
    (
      ?auto_157556 - BLOCK
      ?auto_157555 - BLOCK
      ?auto_157559 - BLOCK
      ?auto_157557 - BLOCK
      ?auto_157561 - BLOCK
      ?auto_157560 - BLOCK
      ?auto_157554 - BLOCK
      ?auto_157558 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_157556 ?auto_157553 ) ( ON-TABLE ?auto_157553 ) ( not ( = ?auto_157553 ?auto_157556 ) ) ( not ( = ?auto_157553 ?auto_157555 ) ) ( not ( = ?auto_157553 ?auto_157559 ) ) ( not ( = ?auto_157556 ?auto_157555 ) ) ( not ( = ?auto_157556 ?auto_157559 ) ) ( not ( = ?auto_157555 ?auto_157559 ) ) ( ON ?auto_157555 ?auto_157556 ) ( not ( = ?auto_157557 ?auto_157561 ) ) ( not ( = ?auto_157557 ?auto_157560 ) ) ( not ( = ?auto_157557 ?auto_157554 ) ) ( not ( = ?auto_157557 ?auto_157559 ) ) ( not ( = ?auto_157561 ?auto_157560 ) ) ( not ( = ?auto_157561 ?auto_157554 ) ) ( not ( = ?auto_157561 ?auto_157559 ) ) ( not ( = ?auto_157560 ?auto_157554 ) ) ( not ( = ?auto_157560 ?auto_157559 ) ) ( not ( = ?auto_157554 ?auto_157559 ) ) ( not ( = ?auto_157553 ?auto_157554 ) ) ( not ( = ?auto_157553 ?auto_157557 ) ) ( not ( = ?auto_157553 ?auto_157561 ) ) ( not ( = ?auto_157553 ?auto_157560 ) ) ( not ( = ?auto_157556 ?auto_157554 ) ) ( not ( = ?auto_157556 ?auto_157557 ) ) ( not ( = ?auto_157556 ?auto_157561 ) ) ( not ( = ?auto_157556 ?auto_157560 ) ) ( not ( = ?auto_157555 ?auto_157554 ) ) ( not ( = ?auto_157555 ?auto_157557 ) ) ( not ( = ?auto_157555 ?auto_157561 ) ) ( not ( = ?auto_157555 ?auto_157560 ) ) ( ON ?auto_157559 ?auto_157555 ) ( ON ?auto_157554 ?auto_157559 ) ( ON ?auto_157560 ?auto_157554 ) ( ON ?auto_157557 ?auto_157558 ) ( CLEAR ?auto_157557 ) ( not ( = ?auto_157553 ?auto_157558 ) ) ( not ( = ?auto_157556 ?auto_157558 ) ) ( not ( = ?auto_157555 ?auto_157558 ) ) ( not ( = ?auto_157559 ?auto_157558 ) ) ( not ( = ?auto_157557 ?auto_157558 ) ) ( not ( = ?auto_157561 ?auto_157558 ) ) ( not ( = ?auto_157560 ?auto_157558 ) ) ( not ( = ?auto_157554 ?auto_157558 ) ) ( HOLDING ?auto_157561 ) ( CLEAR ?auto_157560 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_157553 ?auto_157556 ?auto_157555 ?auto_157559 ?auto_157554 ?auto_157560 ?auto_157561 )
      ( MAKE-1PILE ?auto_157553 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_157562 - BLOCK
    )
    :vars
    (
      ?auto_157570 - BLOCK
      ?auto_157567 - BLOCK
      ?auto_157568 - BLOCK
      ?auto_157569 - BLOCK
      ?auto_157566 - BLOCK
      ?auto_157563 - BLOCK
      ?auto_157565 - BLOCK
      ?auto_157564 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_157570 ?auto_157562 ) ( ON-TABLE ?auto_157562 ) ( not ( = ?auto_157562 ?auto_157570 ) ) ( not ( = ?auto_157562 ?auto_157567 ) ) ( not ( = ?auto_157562 ?auto_157568 ) ) ( not ( = ?auto_157570 ?auto_157567 ) ) ( not ( = ?auto_157570 ?auto_157568 ) ) ( not ( = ?auto_157567 ?auto_157568 ) ) ( ON ?auto_157567 ?auto_157570 ) ( not ( = ?auto_157569 ?auto_157566 ) ) ( not ( = ?auto_157569 ?auto_157563 ) ) ( not ( = ?auto_157569 ?auto_157565 ) ) ( not ( = ?auto_157569 ?auto_157568 ) ) ( not ( = ?auto_157566 ?auto_157563 ) ) ( not ( = ?auto_157566 ?auto_157565 ) ) ( not ( = ?auto_157566 ?auto_157568 ) ) ( not ( = ?auto_157563 ?auto_157565 ) ) ( not ( = ?auto_157563 ?auto_157568 ) ) ( not ( = ?auto_157565 ?auto_157568 ) ) ( not ( = ?auto_157562 ?auto_157565 ) ) ( not ( = ?auto_157562 ?auto_157569 ) ) ( not ( = ?auto_157562 ?auto_157566 ) ) ( not ( = ?auto_157562 ?auto_157563 ) ) ( not ( = ?auto_157570 ?auto_157565 ) ) ( not ( = ?auto_157570 ?auto_157569 ) ) ( not ( = ?auto_157570 ?auto_157566 ) ) ( not ( = ?auto_157570 ?auto_157563 ) ) ( not ( = ?auto_157567 ?auto_157565 ) ) ( not ( = ?auto_157567 ?auto_157569 ) ) ( not ( = ?auto_157567 ?auto_157566 ) ) ( not ( = ?auto_157567 ?auto_157563 ) ) ( ON ?auto_157568 ?auto_157567 ) ( ON ?auto_157565 ?auto_157568 ) ( ON ?auto_157563 ?auto_157565 ) ( ON ?auto_157569 ?auto_157564 ) ( not ( = ?auto_157562 ?auto_157564 ) ) ( not ( = ?auto_157570 ?auto_157564 ) ) ( not ( = ?auto_157567 ?auto_157564 ) ) ( not ( = ?auto_157568 ?auto_157564 ) ) ( not ( = ?auto_157569 ?auto_157564 ) ) ( not ( = ?auto_157566 ?auto_157564 ) ) ( not ( = ?auto_157563 ?auto_157564 ) ) ( not ( = ?auto_157565 ?auto_157564 ) ) ( CLEAR ?auto_157563 ) ( ON ?auto_157566 ?auto_157569 ) ( CLEAR ?auto_157566 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_157564 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_157564 ?auto_157569 )
      ( MAKE-1PILE ?auto_157562 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_157571 - BLOCK
    )
    :vars
    (
      ?auto_157573 - BLOCK
      ?auto_157578 - BLOCK
      ?auto_157576 - BLOCK
      ?auto_157579 - BLOCK
      ?auto_157577 - BLOCK
      ?auto_157572 - BLOCK
      ?auto_157574 - BLOCK
      ?auto_157575 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_157573 ?auto_157571 ) ( ON-TABLE ?auto_157571 ) ( not ( = ?auto_157571 ?auto_157573 ) ) ( not ( = ?auto_157571 ?auto_157578 ) ) ( not ( = ?auto_157571 ?auto_157576 ) ) ( not ( = ?auto_157573 ?auto_157578 ) ) ( not ( = ?auto_157573 ?auto_157576 ) ) ( not ( = ?auto_157578 ?auto_157576 ) ) ( ON ?auto_157578 ?auto_157573 ) ( not ( = ?auto_157579 ?auto_157577 ) ) ( not ( = ?auto_157579 ?auto_157572 ) ) ( not ( = ?auto_157579 ?auto_157574 ) ) ( not ( = ?auto_157579 ?auto_157576 ) ) ( not ( = ?auto_157577 ?auto_157572 ) ) ( not ( = ?auto_157577 ?auto_157574 ) ) ( not ( = ?auto_157577 ?auto_157576 ) ) ( not ( = ?auto_157572 ?auto_157574 ) ) ( not ( = ?auto_157572 ?auto_157576 ) ) ( not ( = ?auto_157574 ?auto_157576 ) ) ( not ( = ?auto_157571 ?auto_157574 ) ) ( not ( = ?auto_157571 ?auto_157579 ) ) ( not ( = ?auto_157571 ?auto_157577 ) ) ( not ( = ?auto_157571 ?auto_157572 ) ) ( not ( = ?auto_157573 ?auto_157574 ) ) ( not ( = ?auto_157573 ?auto_157579 ) ) ( not ( = ?auto_157573 ?auto_157577 ) ) ( not ( = ?auto_157573 ?auto_157572 ) ) ( not ( = ?auto_157578 ?auto_157574 ) ) ( not ( = ?auto_157578 ?auto_157579 ) ) ( not ( = ?auto_157578 ?auto_157577 ) ) ( not ( = ?auto_157578 ?auto_157572 ) ) ( ON ?auto_157576 ?auto_157578 ) ( ON ?auto_157574 ?auto_157576 ) ( ON ?auto_157579 ?auto_157575 ) ( not ( = ?auto_157571 ?auto_157575 ) ) ( not ( = ?auto_157573 ?auto_157575 ) ) ( not ( = ?auto_157578 ?auto_157575 ) ) ( not ( = ?auto_157576 ?auto_157575 ) ) ( not ( = ?auto_157579 ?auto_157575 ) ) ( not ( = ?auto_157577 ?auto_157575 ) ) ( not ( = ?auto_157572 ?auto_157575 ) ) ( not ( = ?auto_157574 ?auto_157575 ) ) ( ON ?auto_157577 ?auto_157579 ) ( CLEAR ?auto_157577 ) ( ON-TABLE ?auto_157575 ) ( HOLDING ?auto_157572 ) ( CLEAR ?auto_157574 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_157571 ?auto_157573 ?auto_157578 ?auto_157576 ?auto_157574 ?auto_157572 )
      ( MAKE-1PILE ?auto_157571 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_157580 - BLOCK
    )
    :vars
    (
      ?auto_157584 - BLOCK
      ?auto_157585 - BLOCK
      ?auto_157588 - BLOCK
      ?auto_157583 - BLOCK
      ?auto_157582 - BLOCK
      ?auto_157586 - BLOCK
      ?auto_157581 - BLOCK
      ?auto_157587 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_157584 ?auto_157580 ) ( ON-TABLE ?auto_157580 ) ( not ( = ?auto_157580 ?auto_157584 ) ) ( not ( = ?auto_157580 ?auto_157585 ) ) ( not ( = ?auto_157580 ?auto_157588 ) ) ( not ( = ?auto_157584 ?auto_157585 ) ) ( not ( = ?auto_157584 ?auto_157588 ) ) ( not ( = ?auto_157585 ?auto_157588 ) ) ( ON ?auto_157585 ?auto_157584 ) ( not ( = ?auto_157583 ?auto_157582 ) ) ( not ( = ?auto_157583 ?auto_157586 ) ) ( not ( = ?auto_157583 ?auto_157581 ) ) ( not ( = ?auto_157583 ?auto_157588 ) ) ( not ( = ?auto_157582 ?auto_157586 ) ) ( not ( = ?auto_157582 ?auto_157581 ) ) ( not ( = ?auto_157582 ?auto_157588 ) ) ( not ( = ?auto_157586 ?auto_157581 ) ) ( not ( = ?auto_157586 ?auto_157588 ) ) ( not ( = ?auto_157581 ?auto_157588 ) ) ( not ( = ?auto_157580 ?auto_157581 ) ) ( not ( = ?auto_157580 ?auto_157583 ) ) ( not ( = ?auto_157580 ?auto_157582 ) ) ( not ( = ?auto_157580 ?auto_157586 ) ) ( not ( = ?auto_157584 ?auto_157581 ) ) ( not ( = ?auto_157584 ?auto_157583 ) ) ( not ( = ?auto_157584 ?auto_157582 ) ) ( not ( = ?auto_157584 ?auto_157586 ) ) ( not ( = ?auto_157585 ?auto_157581 ) ) ( not ( = ?auto_157585 ?auto_157583 ) ) ( not ( = ?auto_157585 ?auto_157582 ) ) ( not ( = ?auto_157585 ?auto_157586 ) ) ( ON ?auto_157588 ?auto_157585 ) ( ON ?auto_157581 ?auto_157588 ) ( ON ?auto_157583 ?auto_157587 ) ( not ( = ?auto_157580 ?auto_157587 ) ) ( not ( = ?auto_157584 ?auto_157587 ) ) ( not ( = ?auto_157585 ?auto_157587 ) ) ( not ( = ?auto_157588 ?auto_157587 ) ) ( not ( = ?auto_157583 ?auto_157587 ) ) ( not ( = ?auto_157582 ?auto_157587 ) ) ( not ( = ?auto_157586 ?auto_157587 ) ) ( not ( = ?auto_157581 ?auto_157587 ) ) ( ON ?auto_157582 ?auto_157583 ) ( ON-TABLE ?auto_157587 ) ( CLEAR ?auto_157581 ) ( ON ?auto_157586 ?auto_157582 ) ( CLEAR ?auto_157586 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_157587 ?auto_157583 ?auto_157582 )
      ( MAKE-1PILE ?auto_157580 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_157632 - BLOCK
      ?auto_157633 - BLOCK
      ?auto_157634 - BLOCK
      ?auto_157635 - BLOCK
      ?auto_157636 - BLOCK
      ?auto_157637 - BLOCK
      ?auto_157638 - BLOCK
    )
    :vars
    (
      ?auto_157639 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_157632 ) ( ON ?auto_157633 ?auto_157632 ) ( ON ?auto_157634 ?auto_157633 ) ( ON ?auto_157635 ?auto_157634 ) ( ON ?auto_157636 ?auto_157635 ) ( not ( = ?auto_157632 ?auto_157633 ) ) ( not ( = ?auto_157632 ?auto_157634 ) ) ( not ( = ?auto_157632 ?auto_157635 ) ) ( not ( = ?auto_157632 ?auto_157636 ) ) ( not ( = ?auto_157632 ?auto_157637 ) ) ( not ( = ?auto_157632 ?auto_157638 ) ) ( not ( = ?auto_157633 ?auto_157634 ) ) ( not ( = ?auto_157633 ?auto_157635 ) ) ( not ( = ?auto_157633 ?auto_157636 ) ) ( not ( = ?auto_157633 ?auto_157637 ) ) ( not ( = ?auto_157633 ?auto_157638 ) ) ( not ( = ?auto_157634 ?auto_157635 ) ) ( not ( = ?auto_157634 ?auto_157636 ) ) ( not ( = ?auto_157634 ?auto_157637 ) ) ( not ( = ?auto_157634 ?auto_157638 ) ) ( not ( = ?auto_157635 ?auto_157636 ) ) ( not ( = ?auto_157635 ?auto_157637 ) ) ( not ( = ?auto_157635 ?auto_157638 ) ) ( not ( = ?auto_157636 ?auto_157637 ) ) ( not ( = ?auto_157636 ?auto_157638 ) ) ( not ( = ?auto_157637 ?auto_157638 ) ) ( ON ?auto_157638 ?auto_157639 ) ( not ( = ?auto_157632 ?auto_157639 ) ) ( not ( = ?auto_157633 ?auto_157639 ) ) ( not ( = ?auto_157634 ?auto_157639 ) ) ( not ( = ?auto_157635 ?auto_157639 ) ) ( not ( = ?auto_157636 ?auto_157639 ) ) ( not ( = ?auto_157637 ?auto_157639 ) ) ( not ( = ?auto_157638 ?auto_157639 ) ) ( CLEAR ?auto_157636 ) ( ON ?auto_157637 ?auto_157638 ) ( CLEAR ?auto_157637 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_157639 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_157639 ?auto_157638 )
      ( MAKE-7PILE ?auto_157632 ?auto_157633 ?auto_157634 ?auto_157635 ?auto_157636 ?auto_157637 ?auto_157638 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_157640 - BLOCK
      ?auto_157641 - BLOCK
      ?auto_157642 - BLOCK
      ?auto_157643 - BLOCK
      ?auto_157644 - BLOCK
      ?auto_157645 - BLOCK
      ?auto_157646 - BLOCK
    )
    :vars
    (
      ?auto_157647 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_157640 ) ( ON ?auto_157641 ?auto_157640 ) ( ON ?auto_157642 ?auto_157641 ) ( ON ?auto_157643 ?auto_157642 ) ( not ( = ?auto_157640 ?auto_157641 ) ) ( not ( = ?auto_157640 ?auto_157642 ) ) ( not ( = ?auto_157640 ?auto_157643 ) ) ( not ( = ?auto_157640 ?auto_157644 ) ) ( not ( = ?auto_157640 ?auto_157645 ) ) ( not ( = ?auto_157640 ?auto_157646 ) ) ( not ( = ?auto_157641 ?auto_157642 ) ) ( not ( = ?auto_157641 ?auto_157643 ) ) ( not ( = ?auto_157641 ?auto_157644 ) ) ( not ( = ?auto_157641 ?auto_157645 ) ) ( not ( = ?auto_157641 ?auto_157646 ) ) ( not ( = ?auto_157642 ?auto_157643 ) ) ( not ( = ?auto_157642 ?auto_157644 ) ) ( not ( = ?auto_157642 ?auto_157645 ) ) ( not ( = ?auto_157642 ?auto_157646 ) ) ( not ( = ?auto_157643 ?auto_157644 ) ) ( not ( = ?auto_157643 ?auto_157645 ) ) ( not ( = ?auto_157643 ?auto_157646 ) ) ( not ( = ?auto_157644 ?auto_157645 ) ) ( not ( = ?auto_157644 ?auto_157646 ) ) ( not ( = ?auto_157645 ?auto_157646 ) ) ( ON ?auto_157646 ?auto_157647 ) ( not ( = ?auto_157640 ?auto_157647 ) ) ( not ( = ?auto_157641 ?auto_157647 ) ) ( not ( = ?auto_157642 ?auto_157647 ) ) ( not ( = ?auto_157643 ?auto_157647 ) ) ( not ( = ?auto_157644 ?auto_157647 ) ) ( not ( = ?auto_157645 ?auto_157647 ) ) ( not ( = ?auto_157646 ?auto_157647 ) ) ( ON ?auto_157645 ?auto_157646 ) ( CLEAR ?auto_157645 ) ( ON-TABLE ?auto_157647 ) ( HOLDING ?auto_157644 ) ( CLEAR ?auto_157643 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_157640 ?auto_157641 ?auto_157642 ?auto_157643 ?auto_157644 )
      ( MAKE-7PILE ?auto_157640 ?auto_157641 ?auto_157642 ?auto_157643 ?auto_157644 ?auto_157645 ?auto_157646 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_157648 - BLOCK
      ?auto_157649 - BLOCK
      ?auto_157650 - BLOCK
      ?auto_157651 - BLOCK
      ?auto_157652 - BLOCK
      ?auto_157653 - BLOCK
      ?auto_157654 - BLOCK
    )
    :vars
    (
      ?auto_157655 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_157648 ) ( ON ?auto_157649 ?auto_157648 ) ( ON ?auto_157650 ?auto_157649 ) ( ON ?auto_157651 ?auto_157650 ) ( not ( = ?auto_157648 ?auto_157649 ) ) ( not ( = ?auto_157648 ?auto_157650 ) ) ( not ( = ?auto_157648 ?auto_157651 ) ) ( not ( = ?auto_157648 ?auto_157652 ) ) ( not ( = ?auto_157648 ?auto_157653 ) ) ( not ( = ?auto_157648 ?auto_157654 ) ) ( not ( = ?auto_157649 ?auto_157650 ) ) ( not ( = ?auto_157649 ?auto_157651 ) ) ( not ( = ?auto_157649 ?auto_157652 ) ) ( not ( = ?auto_157649 ?auto_157653 ) ) ( not ( = ?auto_157649 ?auto_157654 ) ) ( not ( = ?auto_157650 ?auto_157651 ) ) ( not ( = ?auto_157650 ?auto_157652 ) ) ( not ( = ?auto_157650 ?auto_157653 ) ) ( not ( = ?auto_157650 ?auto_157654 ) ) ( not ( = ?auto_157651 ?auto_157652 ) ) ( not ( = ?auto_157651 ?auto_157653 ) ) ( not ( = ?auto_157651 ?auto_157654 ) ) ( not ( = ?auto_157652 ?auto_157653 ) ) ( not ( = ?auto_157652 ?auto_157654 ) ) ( not ( = ?auto_157653 ?auto_157654 ) ) ( ON ?auto_157654 ?auto_157655 ) ( not ( = ?auto_157648 ?auto_157655 ) ) ( not ( = ?auto_157649 ?auto_157655 ) ) ( not ( = ?auto_157650 ?auto_157655 ) ) ( not ( = ?auto_157651 ?auto_157655 ) ) ( not ( = ?auto_157652 ?auto_157655 ) ) ( not ( = ?auto_157653 ?auto_157655 ) ) ( not ( = ?auto_157654 ?auto_157655 ) ) ( ON ?auto_157653 ?auto_157654 ) ( ON-TABLE ?auto_157655 ) ( CLEAR ?auto_157651 ) ( ON ?auto_157652 ?auto_157653 ) ( CLEAR ?auto_157652 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_157655 ?auto_157654 ?auto_157653 )
      ( MAKE-7PILE ?auto_157648 ?auto_157649 ?auto_157650 ?auto_157651 ?auto_157652 ?auto_157653 ?auto_157654 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_157656 - BLOCK
      ?auto_157657 - BLOCK
      ?auto_157658 - BLOCK
      ?auto_157659 - BLOCK
      ?auto_157660 - BLOCK
      ?auto_157661 - BLOCK
      ?auto_157662 - BLOCK
    )
    :vars
    (
      ?auto_157663 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_157656 ) ( ON ?auto_157657 ?auto_157656 ) ( ON ?auto_157658 ?auto_157657 ) ( not ( = ?auto_157656 ?auto_157657 ) ) ( not ( = ?auto_157656 ?auto_157658 ) ) ( not ( = ?auto_157656 ?auto_157659 ) ) ( not ( = ?auto_157656 ?auto_157660 ) ) ( not ( = ?auto_157656 ?auto_157661 ) ) ( not ( = ?auto_157656 ?auto_157662 ) ) ( not ( = ?auto_157657 ?auto_157658 ) ) ( not ( = ?auto_157657 ?auto_157659 ) ) ( not ( = ?auto_157657 ?auto_157660 ) ) ( not ( = ?auto_157657 ?auto_157661 ) ) ( not ( = ?auto_157657 ?auto_157662 ) ) ( not ( = ?auto_157658 ?auto_157659 ) ) ( not ( = ?auto_157658 ?auto_157660 ) ) ( not ( = ?auto_157658 ?auto_157661 ) ) ( not ( = ?auto_157658 ?auto_157662 ) ) ( not ( = ?auto_157659 ?auto_157660 ) ) ( not ( = ?auto_157659 ?auto_157661 ) ) ( not ( = ?auto_157659 ?auto_157662 ) ) ( not ( = ?auto_157660 ?auto_157661 ) ) ( not ( = ?auto_157660 ?auto_157662 ) ) ( not ( = ?auto_157661 ?auto_157662 ) ) ( ON ?auto_157662 ?auto_157663 ) ( not ( = ?auto_157656 ?auto_157663 ) ) ( not ( = ?auto_157657 ?auto_157663 ) ) ( not ( = ?auto_157658 ?auto_157663 ) ) ( not ( = ?auto_157659 ?auto_157663 ) ) ( not ( = ?auto_157660 ?auto_157663 ) ) ( not ( = ?auto_157661 ?auto_157663 ) ) ( not ( = ?auto_157662 ?auto_157663 ) ) ( ON ?auto_157661 ?auto_157662 ) ( ON-TABLE ?auto_157663 ) ( ON ?auto_157660 ?auto_157661 ) ( CLEAR ?auto_157660 ) ( HOLDING ?auto_157659 ) ( CLEAR ?auto_157658 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_157656 ?auto_157657 ?auto_157658 ?auto_157659 )
      ( MAKE-7PILE ?auto_157656 ?auto_157657 ?auto_157658 ?auto_157659 ?auto_157660 ?auto_157661 ?auto_157662 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_157664 - BLOCK
      ?auto_157665 - BLOCK
      ?auto_157666 - BLOCK
      ?auto_157667 - BLOCK
      ?auto_157668 - BLOCK
      ?auto_157669 - BLOCK
      ?auto_157670 - BLOCK
    )
    :vars
    (
      ?auto_157671 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_157664 ) ( ON ?auto_157665 ?auto_157664 ) ( ON ?auto_157666 ?auto_157665 ) ( not ( = ?auto_157664 ?auto_157665 ) ) ( not ( = ?auto_157664 ?auto_157666 ) ) ( not ( = ?auto_157664 ?auto_157667 ) ) ( not ( = ?auto_157664 ?auto_157668 ) ) ( not ( = ?auto_157664 ?auto_157669 ) ) ( not ( = ?auto_157664 ?auto_157670 ) ) ( not ( = ?auto_157665 ?auto_157666 ) ) ( not ( = ?auto_157665 ?auto_157667 ) ) ( not ( = ?auto_157665 ?auto_157668 ) ) ( not ( = ?auto_157665 ?auto_157669 ) ) ( not ( = ?auto_157665 ?auto_157670 ) ) ( not ( = ?auto_157666 ?auto_157667 ) ) ( not ( = ?auto_157666 ?auto_157668 ) ) ( not ( = ?auto_157666 ?auto_157669 ) ) ( not ( = ?auto_157666 ?auto_157670 ) ) ( not ( = ?auto_157667 ?auto_157668 ) ) ( not ( = ?auto_157667 ?auto_157669 ) ) ( not ( = ?auto_157667 ?auto_157670 ) ) ( not ( = ?auto_157668 ?auto_157669 ) ) ( not ( = ?auto_157668 ?auto_157670 ) ) ( not ( = ?auto_157669 ?auto_157670 ) ) ( ON ?auto_157670 ?auto_157671 ) ( not ( = ?auto_157664 ?auto_157671 ) ) ( not ( = ?auto_157665 ?auto_157671 ) ) ( not ( = ?auto_157666 ?auto_157671 ) ) ( not ( = ?auto_157667 ?auto_157671 ) ) ( not ( = ?auto_157668 ?auto_157671 ) ) ( not ( = ?auto_157669 ?auto_157671 ) ) ( not ( = ?auto_157670 ?auto_157671 ) ) ( ON ?auto_157669 ?auto_157670 ) ( ON-TABLE ?auto_157671 ) ( ON ?auto_157668 ?auto_157669 ) ( CLEAR ?auto_157666 ) ( ON ?auto_157667 ?auto_157668 ) ( CLEAR ?auto_157667 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_157671 ?auto_157670 ?auto_157669 ?auto_157668 )
      ( MAKE-7PILE ?auto_157664 ?auto_157665 ?auto_157666 ?auto_157667 ?auto_157668 ?auto_157669 ?auto_157670 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_157672 - BLOCK
      ?auto_157673 - BLOCK
      ?auto_157674 - BLOCK
      ?auto_157675 - BLOCK
      ?auto_157676 - BLOCK
      ?auto_157677 - BLOCK
      ?auto_157678 - BLOCK
    )
    :vars
    (
      ?auto_157679 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_157672 ) ( ON ?auto_157673 ?auto_157672 ) ( not ( = ?auto_157672 ?auto_157673 ) ) ( not ( = ?auto_157672 ?auto_157674 ) ) ( not ( = ?auto_157672 ?auto_157675 ) ) ( not ( = ?auto_157672 ?auto_157676 ) ) ( not ( = ?auto_157672 ?auto_157677 ) ) ( not ( = ?auto_157672 ?auto_157678 ) ) ( not ( = ?auto_157673 ?auto_157674 ) ) ( not ( = ?auto_157673 ?auto_157675 ) ) ( not ( = ?auto_157673 ?auto_157676 ) ) ( not ( = ?auto_157673 ?auto_157677 ) ) ( not ( = ?auto_157673 ?auto_157678 ) ) ( not ( = ?auto_157674 ?auto_157675 ) ) ( not ( = ?auto_157674 ?auto_157676 ) ) ( not ( = ?auto_157674 ?auto_157677 ) ) ( not ( = ?auto_157674 ?auto_157678 ) ) ( not ( = ?auto_157675 ?auto_157676 ) ) ( not ( = ?auto_157675 ?auto_157677 ) ) ( not ( = ?auto_157675 ?auto_157678 ) ) ( not ( = ?auto_157676 ?auto_157677 ) ) ( not ( = ?auto_157676 ?auto_157678 ) ) ( not ( = ?auto_157677 ?auto_157678 ) ) ( ON ?auto_157678 ?auto_157679 ) ( not ( = ?auto_157672 ?auto_157679 ) ) ( not ( = ?auto_157673 ?auto_157679 ) ) ( not ( = ?auto_157674 ?auto_157679 ) ) ( not ( = ?auto_157675 ?auto_157679 ) ) ( not ( = ?auto_157676 ?auto_157679 ) ) ( not ( = ?auto_157677 ?auto_157679 ) ) ( not ( = ?auto_157678 ?auto_157679 ) ) ( ON ?auto_157677 ?auto_157678 ) ( ON-TABLE ?auto_157679 ) ( ON ?auto_157676 ?auto_157677 ) ( ON ?auto_157675 ?auto_157676 ) ( CLEAR ?auto_157675 ) ( HOLDING ?auto_157674 ) ( CLEAR ?auto_157673 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_157672 ?auto_157673 ?auto_157674 )
      ( MAKE-7PILE ?auto_157672 ?auto_157673 ?auto_157674 ?auto_157675 ?auto_157676 ?auto_157677 ?auto_157678 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_157680 - BLOCK
      ?auto_157681 - BLOCK
      ?auto_157682 - BLOCK
      ?auto_157683 - BLOCK
      ?auto_157684 - BLOCK
      ?auto_157685 - BLOCK
      ?auto_157686 - BLOCK
    )
    :vars
    (
      ?auto_157687 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_157680 ) ( ON ?auto_157681 ?auto_157680 ) ( not ( = ?auto_157680 ?auto_157681 ) ) ( not ( = ?auto_157680 ?auto_157682 ) ) ( not ( = ?auto_157680 ?auto_157683 ) ) ( not ( = ?auto_157680 ?auto_157684 ) ) ( not ( = ?auto_157680 ?auto_157685 ) ) ( not ( = ?auto_157680 ?auto_157686 ) ) ( not ( = ?auto_157681 ?auto_157682 ) ) ( not ( = ?auto_157681 ?auto_157683 ) ) ( not ( = ?auto_157681 ?auto_157684 ) ) ( not ( = ?auto_157681 ?auto_157685 ) ) ( not ( = ?auto_157681 ?auto_157686 ) ) ( not ( = ?auto_157682 ?auto_157683 ) ) ( not ( = ?auto_157682 ?auto_157684 ) ) ( not ( = ?auto_157682 ?auto_157685 ) ) ( not ( = ?auto_157682 ?auto_157686 ) ) ( not ( = ?auto_157683 ?auto_157684 ) ) ( not ( = ?auto_157683 ?auto_157685 ) ) ( not ( = ?auto_157683 ?auto_157686 ) ) ( not ( = ?auto_157684 ?auto_157685 ) ) ( not ( = ?auto_157684 ?auto_157686 ) ) ( not ( = ?auto_157685 ?auto_157686 ) ) ( ON ?auto_157686 ?auto_157687 ) ( not ( = ?auto_157680 ?auto_157687 ) ) ( not ( = ?auto_157681 ?auto_157687 ) ) ( not ( = ?auto_157682 ?auto_157687 ) ) ( not ( = ?auto_157683 ?auto_157687 ) ) ( not ( = ?auto_157684 ?auto_157687 ) ) ( not ( = ?auto_157685 ?auto_157687 ) ) ( not ( = ?auto_157686 ?auto_157687 ) ) ( ON ?auto_157685 ?auto_157686 ) ( ON-TABLE ?auto_157687 ) ( ON ?auto_157684 ?auto_157685 ) ( ON ?auto_157683 ?auto_157684 ) ( CLEAR ?auto_157681 ) ( ON ?auto_157682 ?auto_157683 ) ( CLEAR ?auto_157682 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_157687 ?auto_157686 ?auto_157685 ?auto_157684 ?auto_157683 )
      ( MAKE-7PILE ?auto_157680 ?auto_157681 ?auto_157682 ?auto_157683 ?auto_157684 ?auto_157685 ?auto_157686 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_157688 - BLOCK
      ?auto_157689 - BLOCK
      ?auto_157690 - BLOCK
      ?auto_157691 - BLOCK
      ?auto_157692 - BLOCK
      ?auto_157693 - BLOCK
      ?auto_157694 - BLOCK
    )
    :vars
    (
      ?auto_157695 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_157688 ) ( not ( = ?auto_157688 ?auto_157689 ) ) ( not ( = ?auto_157688 ?auto_157690 ) ) ( not ( = ?auto_157688 ?auto_157691 ) ) ( not ( = ?auto_157688 ?auto_157692 ) ) ( not ( = ?auto_157688 ?auto_157693 ) ) ( not ( = ?auto_157688 ?auto_157694 ) ) ( not ( = ?auto_157689 ?auto_157690 ) ) ( not ( = ?auto_157689 ?auto_157691 ) ) ( not ( = ?auto_157689 ?auto_157692 ) ) ( not ( = ?auto_157689 ?auto_157693 ) ) ( not ( = ?auto_157689 ?auto_157694 ) ) ( not ( = ?auto_157690 ?auto_157691 ) ) ( not ( = ?auto_157690 ?auto_157692 ) ) ( not ( = ?auto_157690 ?auto_157693 ) ) ( not ( = ?auto_157690 ?auto_157694 ) ) ( not ( = ?auto_157691 ?auto_157692 ) ) ( not ( = ?auto_157691 ?auto_157693 ) ) ( not ( = ?auto_157691 ?auto_157694 ) ) ( not ( = ?auto_157692 ?auto_157693 ) ) ( not ( = ?auto_157692 ?auto_157694 ) ) ( not ( = ?auto_157693 ?auto_157694 ) ) ( ON ?auto_157694 ?auto_157695 ) ( not ( = ?auto_157688 ?auto_157695 ) ) ( not ( = ?auto_157689 ?auto_157695 ) ) ( not ( = ?auto_157690 ?auto_157695 ) ) ( not ( = ?auto_157691 ?auto_157695 ) ) ( not ( = ?auto_157692 ?auto_157695 ) ) ( not ( = ?auto_157693 ?auto_157695 ) ) ( not ( = ?auto_157694 ?auto_157695 ) ) ( ON ?auto_157693 ?auto_157694 ) ( ON-TABLE ?auto_157695 ) ( ON ?auto_157692 ?auto_157693 ) ( ON ?auto_157691 ?auto_157692 ) ( ON ?auto_157690 ?auto_157691 ) ( CLEAR ?auto_157690 ) ( HOLDING ?auto_157689 ) ( CLEAR ?auto_157688 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_157688 ?auto_157689 )
      ( MAKE-7PILE ?auto_157688 ?auto_157689 ?auto_157690 ?auto_157691 ?auto_157692 ?auto_157693 ?auto_157694 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_157696 - BLOCK
      ?auto_157697 - BLOCK
      ?auto_157698 - BLOCK
      ?auto_157699 - BLOCK
      ?auto_157700 - BLOCK
      ?auto_157701 - BLOCK
      ?auto_157702 - BLOCK
    )
    :vars
    (
      ?auto_157703 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_157696 ) ( not ( = ?auto_157696 ?auto_157697 ) ) ( not ( = ?auto_157696 ?auto_157698 ) ) ( not ( = ?auto_157696 ?auto_157699 ) ) ( not ( = ?auto_157696 ?auto_157700 ) ) ( not ( = ?auto_157696 ?auto_157701 ) ) ( not ( = ?auto_157696 ?auto_157702 ) ) ( not ( = ?auto_157697 ?auto_157698 ) ) ( not ( = ?auto_157697 ?auto_157699 ) ) ( not ( = ?auto_157697 ?auto_157700 ) ) ( not ( = ?auto_157697 ?auto_157701 ) ) ( not ( = ?auto_157697 ?auto_157702 ) ) ( not ( = ?auto_157698 ?auto_157699 ) ) ( not ( = ?auto_157698 ?auto_157700 ) ) ( not ( = ?auto_157698 ?auto_157701 ) ) ( not ( = ?auto_157698 ?auto_157702 ) ) ( not ( = ?auto_157699 ?auto_157700 ) ) ( not ( = ?auto_157699 ?auto_157701 ) ) ( not ( = ?auto_157699 ?auto_157702 ) ) ( not ( = ?auto_157700 ?auto_157701 ) ) ( not ( = ?auto_157700 ?auto_157702 ) ) ( not ( = ?auto_157701 ?auto_157702 ) ) ( ON ?auto_157702 ?auto_157703 ) ( not ( = ?auto_157696 ?auto_157703 ) ) ( not ( = ?auto_157697 ?auto_157703 ) ) ( not ( = ?auto_157698 ?auto_157703 ) ) ( not ( = ?auto_157699 ?auto_157703 ) ) ( not ( = ?auto_157700 ?auto_157703 ) ) ( not ( = ?auto_157701 ?auto_157703 ) ) ( not ( = ?auto_157702 ?auto_157703 ) ) ( ON ?auto_157701 ?auto_157702 ) ( ON-TABLE ?auto_157703 ) ( ON ?auto_157700 ?auto_157701 ) ( ON ?auto_157699 ?auto_157700 ) ( ON ?auto_157698 ?auto_157699 ) ( CLEAR ?auto_157696 ) ( ON ?auto_157697 ?auto_157698 ) ( CLEAR ?auto_157697 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_157703 ?auto_157702 ?auto_157701 ?auto_157700 ?auto_157699 ?auto_157698 )
      ( MAKE-7PILE ?auto_157696 ?auto_157697 ?auto_157698 ?auto_157699 ?auto_157700 ?auto_157701 ?auto_157702 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_157704 - BLOCK
      ?auto_157705 - BLOCK
      ?auto_157706 - BLOCK
      ?auto_157707 - BLOCK
      ?auto_157708 - BLOCK
      ?auto_157709 - BLOCK
      ?auto_157710 - BLOCK
    )
    :vars
    (
      ?auto_157711 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_157704 ?auto_157705 ) ) ( not ( = ?auto_157704 ?auto_157706 ) ) ( not ( = ?auto_157704 ?auto_157707 ) ) ( not ( = ?auto_157704 ?auto_157708 ) ) ( not ( = ?auto_157704 ?auto_157709 ) ) ( not ( = ?auto_157704 ?auto_157710 ) ) ( not ( = ?auto_157705 ?auto_157706 ) ) ( not ( = ?auto_157705 ?auto_157707 ) ) ( not ( = ?auto_157705 ?auto_157708 ) ) ( not ( = ?auto_157705 ?auto_157709 ) ) ( not ( = ?auto_157705 ?auto_157710 ) ) ( not ( = ?auto_157706 ?auto_157707 ) ) ( not ( = ?auto_157706 ?auto_157708 ) ) ( not ( = ?auto_157706 ?auto_157709 ) ) ( not ( = ?auto_157706 ?auto_157710 ) ) ( not ( = ?auto_157707 ?auto_157708 ) ) ( not ( = ?auto_157707 ?auto_157709 ) ) ( not ( = ?auto_157707 ?auto_157710 ) ) ( not ( = ?auto_157708 ?auto_157709 ) ) ( not ( = ?auto_157708 ?auto_157710 ) ) ( not ( = ?auto_157709 ?auto_157710 ) ) ( ON ?auto_157710 ?auto_157711 ) ( not ( = ?auto_157704 ?auto_157711 ) ) ( not ( = ?auto_157705 ?auto_157711 ) ) ( not ( = ?auto_157706 ?auto_157711 ) ) ( not ( = ?auto_157707 ?auto_157711 ) ) ( not ( = ?auto_157708 ?auto_157711 ) ) ( not ( = ?auto_157709 ?auto_157711 ) ) ( not ( = ?auto_157710 ?auto_157711 ) ) ( ON ?auto_157709 ?auto_157710 ) ( ON-TABLE ?auto_157711 ) ( ON ?auto_157708 ?auto_157709 ) ( ON ?auto_157707 ?auto_157708 ) ( ON ?auto_157706 ?auto_157707 ) ( ON ?auto_157705 ?auto_157706 ) ( CLEAR ?auto_157705 ) ( HOLDING ?auto_157704 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_157704 )
      ( MAKE-7PILE ?auto_157704 ?auto_157705 ?auto_157706 ?auto_157707 ?auto_157708 ?auto_157709 ?auto_157710 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_157712 - BLOCK
      ?auto_157713 - BLOCK
      ?auto_157714 - BLOCK
      ?auto_157715 - BLOCK
      ?auto_157716 - BLOCK
      ?auto_157717 - BLOCK
      ?auto_157718 - BLOCK
    )
    :vars
    (
      ?auto_157719 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_157712 ?auto_157713 ) ) ( not ( = ?auto_157712 ?auto_157714 ) ) ( not ( = ?auto_157712 ?auto_157715 ) ) ( not ( = ?auto_157712 ?auto_157716 ) ) ( not ( = ?auto_157712 ?auto_157717 ) ) ( not ( = ?auto_157712 ?auto_157718 ) ) ( not ( = ?auto_157713 ?auto_157714 ) ) ( not ( = ?auto_157713 ?auto_157715 ) ) ( not ( = ?auto_157713 ?auto_157716 ) ) ( not ( = ?auto_157713 ?auto_157717 ) ) ( not ( = ?auto_157713 ?auto_157718 ) ) ( not ( = ?auto_157714 ?auto_157715 ) ) ( not ( = ?auto_157714 ?auto_157716 ) ) ( not ( = ?auto_157714 ?auto_157717 ) ) ( not ( = ?auto_157714 ?auto_157718 ) ) ( not ( = ?auto_157715 ?auto_157716 ) ) ( not ( = ?auto_157715 ?auto_157717 ) ) ( not ( = ?auto_157715 ?auto_157718 ) ) ( not ( = ?auto_157716 ?auto_157717 ) ) ( not ( = ?auto_157716 ?auto_157718 ) ) ( not ( = ?auto_157717 ?auto_157718 ) ) ( ON ?auto_157718 ?auto_157719 ) ( not ( = ?auto_157712 ?auto_157719 ) ) ( not ( = ?auto_157713 ?auto_157719 ) ) ( not ( = ?auto_157714 ?auto_157719 ) ) ( not ( = ?auto_157715 ?auto_157719 ) ) ( not ( = ?auto_157716 ?auto_157719 ) ) ( not ( = ?auto_157717 ?auto_157719 ) ) ( not ( = ?auto_157718 ?auto_157719 ) ) ( ON ?auto_157717 ?auto_157718 ) ( ON-TABLE ?auto_157719 ) ( ON ?auto_157716 ?auto_157717 ) ( ON ?auto_157715 ?auto_157716 ) ( ON ?auto_157714 ?auto_157715 ) ( ON ?auto_157713 ?auto_157714 ) ( ON ?auto_157712 ?auto_157713 ) ( CLEAR ?auto_157712 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_157719 ?auto_157718 ?auto_157717 ?auto_157716 ?auto_157715 ?auto_157714 ?auto_157713 )
      ( MAKE-7PILE ?auto_157712 ?auto_157713 ?auto_157714 ?auto_157715 ?auto_157716 ?auto_157717 ?auto_157718 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_157727 - BLOCK
      ?auto_157728 - BLOCK
      ?auto_157729 - BLOCK
      ?auto_157730 - BLOCK
      ?auto_157731 - BLOCK
      ?auto_157732 - BLOCK
      ?auto_157733 - BLOCK
    )
    :vars
    (
      ?auto_157734 - BLOCK
      ?auto_157735 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_157727 ?auto_157728 ) ) ( not ( = ?auto_157727 ?auto_157729 ) ) ( not ( = ?auto_157727 ?auto_157730 ) ) ( not ( = ?auto_157727 ?auto_157731 ) ) ( not ( = ?auto_157727 ?auto_157732 ) ) ( not ( = ?auto_157727 ?auto_157733 ) ) ( not ( = ?auto_157728 ?auto_157729 ) ) ( not ( = ?auto_157728 ?auto_157730 ) ) ( not ( = ?auto_157728 ?auto_157731 ) ) ( not ( = ?auto_157728 ?auto_157732 ) ) ( not ( = ?auto_157728 ?auto_157733 ) ) ( not ( = ?auto_157729 ?auto_157730 ) ) ( not ( = ?auto_157729 ?auto_157731 ) ) ( not ( = ?auto_157729 ?auto_157732 ) ) ( not ( = ?auto_157729 ?auto_157733 ) ) ( not ( = ?auto_157730 ?auto_157731 ) ) ( not ( = ?auto_157730 ?auto_157732 ) ) ( not ( = ?auto_157730 ?auto_157733 ) ) ( not ( = ?auto_157731 ?auto_157732 ) ) ( not ( = ?auto_157731 ?auto_157733 ) ) ( not ( = ?auto_157732 ?auto_157733 ) ) ( ON ?auto_157733 ?auto_157734 ) ( not ( = ?auto_157727 ?auto_157734 ) ) ( not ( = ?auto_157728 ?auto_157734 ) ) ( not ( = ?auto_157729 ?auto_157734 ) ) ( not ( = ?auto_157730 ?auto_157734 ) ) ( not ( = ?auto_157731 ?auto_157734 ) ) ( not ( = ?auto_157732 ?auto_157734 ) ) ( not ( = ?auto_157733 ?auto_157734 ) ) ( ON ?auto_157732 ?auto_157733 ) ( ON-TABLE ?auto_157734 ) ( ON ?auto_157731 ?auto_157732 ) ( ON ?auto_157730 ?auto_157731 ) ( ON ?auto_157729 ?auto_157730 ) ( ON ?auto_157728 ?auto_157729 ) ( CLEAR ?auto_157728 ) ( ON ?auto_157727 ?auto_157735 ) ( CLEAR ?auto_157727 ) ( HAND-EMPTY ) ( not ( = ?auto_157727 ?auto_157735 ) ) ( not ( = ?auto_157728 ?auto_157735 ) ) ( not ( = ?auto_157729 ?auto_157735 ) ) ( not ( = ?auto_157730 ?auto_157735 ) ) ( not ( = ?auto_157731 ?auto_157735 ) ) ( not ( = ?auto_157732 ?auto_157735 ) ) ( not ( = ?auto_157733 ?auto_157735 ) ) ( not ( = ?auto_157734 ?auto_157735 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_157727 ?auto_157735 )
      ( MAKE-7PILE ?auto_157727 ?auto_157728 ?auto_157729 ?auto_157730 ?auto_157731 ?auto_157732 ?auto_157733 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_157736 - BLOCK
      ?auto_157737 - BLOCK
      ?auto_157738 - BLOCK
      ?auto_157739 - BLOCK
      ?auto_157740 - BLOCK
      ?auto_157741 - BLOCK
      ?auto_157742 - BLOCK
    )
    :vars
    (
      ?auto_157743 - BLOCK
      ?auto_157744 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_157736 ?auto_157737 ) ) ( not ( = ?auto_157736 ?auto_157738 ) ) ( not ( = ?auto_157736 ?auto_157739 ) ) ( not ( = ?auto_157736 ?auto_157740 ) ) ( not ( = ?auto_157736 ?auto_157741 ) ) ( not ( = ?auto_157736 ?auto_157742 ) ) ( not ( = ?auto_157737 ?auto_157738 ) ) ( not ( = ?auto_157737 ?auto_157739 ) ) ( not ( = ?auto_157737 ?auto_157740 ) ) ( not ( = ?auto_157737 ?auto_157741 ) ) ( not ( = ?auto_157737 ?auto_157742 ) ) ( not ( = ?auto_157738 ?auto_157739 ) ) ( not ( = ?auto_157738 ?auto_157740 ) ) ( not ( = ?auto_157738 ?auto_157741 ) ) ( not ( = ?auto_157738 ?auto_157742 ) ) ( not ( = ?auto_157739 ?auto_157740 ) ) ( not ( = ?auto_157739 ?auto_157741 ) ) ( not ( = ?auto_157739 ?auto_157742 ) ) ( not ( = ?auto_157740 ?auto_157741 ) ) ( not ( = ?auto_157740 ?auto_157742 ) ) ( not ( = ?auto_157741 ?auto_157742 ) ) ( ON ?auto_157742 ?auto_157743 ) ( not ( = ?auto_157736 ?auto_157743 ) ) ( not ( = ?auto_157737 ?auto_157743 ) ) ( not ( = ?auto_157738 ?auto_157743 ) ) ( not ( = ?auto_157739 ?auto_157743 ) ) ( not ( = ?auto_157740 ?auto_157743 ) ) ( not ( = ?auto_157741 ?auto_157743 ) ) ( not ( = ?auto_157742 ?auto_157743 ) ) ( ON ?auto_157741 ?auto_157742 ) ( ON-TABLE ?auto_157743 ) ( ON ?auto_157740 ?auto_157741 ) ( ON ?auto_157739 ?auto_157740 ) ( ON ?auto_157738 ?auto_157739 ) ( ON ?auto_157736 ?auto_157744 ) ( CLEAR ?auto_157736 ) ( not ( = ?auto_157736 ?auto_157744 ) ) ( not ( = ?auto_157737 ?auto_157744 ) ) ( not ( = ?auto_157738 ?auto_157744 ) ) ( not ( = ?auto_157739 ?auto_157744 ) ) ( not ( = ?auto_157740 ?auto_157744 ) ) ( not ( = ?auto_157741 ?auto_157744 ) ) ( not ( = ?auto_157742 ?auto_157744 ) ) ( not ( = ?auto_157743 ?auto_157744 ) ) ( HOLDING ?auto_157737 ) ( CLEAR ?auto_157738 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_157743 ?auto_157742 ?auto_157741 ?auto_157740 ?auto_157739 ?auto_157738 ?auto_157737 )
      ( MAKE-7PILE ?auto_157736 ?auto_157737 ?auto_157738 ?auto_157739 ?auto_157740 ?auto_157741 ?auto_157742 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_157745 - BLOCK
      ?auto_157746 - BLOCK
      ?auto_157747 - BLOCK
      ?auto_157748 - BLOCK
      ?auto_157749 - BLOCK
      ?auto_157750 - BLOCK
      ?auto_157751 - BLOCK
    )
    :vars
    (
      ?auto_157752 - BLOCK
      ?auto_157753 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_157745 ?auto_157746 ) ) ( not ( = ?auto_157745 ?auto_157747 ) ) ( not ( = ?auto_157745 ?auto_157748 ) ) ( not ( = ?auto_157745 ?auto_157749 ) ) ( not ( = ?auto_157745 ?auto_157750 ) ) ( not ( = ?auto_157745 ?auto_157751 ) ) ( not ( = ?auto_157746 ?auto_157747 ) ) ( not ( = ?auto_157746 ?auto_157748 ) ) ( not ( = ?auto_157746 ?auto_157749 ) ) ( not ( = ?auto_157746 ?auto_157750 ) ) ( not ( = ?auto_157746 ?auto_157751 ) ) ( not ( = ?auto_157747 ?auto_157748 ) ) ( not ( = ?auto_157747 ?auto_157749 ) ) ( not ( = ?auto_157747 ?auto_157750 ) ) ( not ( = ?auto_157747 ?auto_157751 ) ) ( not ( = ?auto_157748 ?auto_157749 ) ) ( not ( = ?auto_157748 ?auto_157750 ) ) ( not ( = ?auto_157748 ?auto_157751 ) ) ( not ( = ?auto_157749 ?auto_157750 ) ) ( not ( = ?auto_157749 ?auto_157751 ) ) ( not ( = ?auto_157750 ?auto_157751 ) ) ( ON ?auto_157751 ?auto_157752 ) ( not ( = ?auto_157745 ?auto_157752 ) ) ( not ( = ?auto_157746 ?auto_157752 ) ) ( not ( = ?auto_157747 ?auto_157752 ) ) ( not ( = ?auto_157748 ?auto_157752 ) ) ( not ( = ?auto_157749 ?auto_157752 ) ) ( not ( = ?auto_157750 ?auto_157752 ) ) ( not ( = ?auto_157751 ?auto_157752 ) ) ( ON ?auto_157750 ?auto_157751 ) ( ON-TABLE ?auto_157752 ) ( ON ?auto_157749 ?auto_157750 ) ( ON ?auto_157748 ?auto_157749 ) ( ON ?auto_157747 ?auto_157748 ) ( ON ?auto_157745 ?auto_157753 ) ( not ( = ?auto_157745 ?auto_157753 ) ) ( not ( = ?auto_157746 ?auto_157753 ) ) ( not ( = ?auto_157747 ?auto_157753 ) ) ( not ( = ?auto_157748 ?auto_157753 ) ) ( not ( = ?auto_157749 ?auto_157753 ) ) ( not ( = ?auto_157750 ?auto_157753 ) ) ( not ( = ?auto_157751 ?auto_157753 ) ) ( not ( = ?auto_157752 ?auto_157753 ) ) ( CLEAR ?auto_157747 ) ( ON ?auto_157746 ?auto_157745 ) ( CLEAR ?auto_157746 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_157753 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_157753 ?auto_157745 )
      ( MAKE-7PILE ?auto_157745 ?auto_157746 ?auto_157747 ?auto_157748 ?auto_157749 ?auto_157750 ?auto_157751 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_157754 - BLOCK
      ?auto_157755 - BLOCK
      ?auto_157756 - BLOCK
      ?auto_157757 - BLOCK
      ?auto_157758 - BLOCK
      ?auto_157759 - BLOCK
      ?auto_157760 - BLOCK
    )
    :vars
    (
      ?auto_157761 - BLOCK
      ?auto_157762 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_157754 ?auto_157755 ) ) ( not ( = ?auto_157754 ?auto_157756 ) ) ( not ( = ?auto_157754 ?auto_157757 ) ) ( not ( = ?auto_157754 ?auto_157758 ) ) ( not ( = ?auto_157754 ?auto_157759 ) ) ( not ( = ?auto_157754 ?auto_157760 ) ) ( not ( = ?auto_157755 ?auto_157756 ) ) ( not ( = ?auto_157755 ?auto_157757 ) ) ( not ( = ?auto_157755 ?auto_157758 ) ) ( not ( = ?auto_157755 ?auto_157759 ) ) ( not ( = ?auto_157755 ?auto_157760 ) ) ( not ( = ?auto_157756 ?auto_157757 ) ) ( not ( = ?auto_157756 ?auto_157758 ) ) ( not ( = ?auto_157756 ?auto_157759 ) ) ( not ( = ?auto_157756 ?auto_157760 ) ) ( not ( = ?auto_157757 ?auto_157758 ) ) ( not ( = ?auto_157757 ?auto_157759 ) ) ( not ( = ?auto_157757 ?auto_157760 ) ) ( not ( = ?auto_157758 ?auto_157759 ) ) ( not ( = ?auto_157758 ?auto_157760 ) ) ( not ( = ?auto_157759 ?auto_157760 ) ) ( ON ?auto_157760 ?auto_157761 ) ( not ( = ?auto_157754 ?auto_157761 ) ) ( not ( = ?auto_157755 ?auto_157761 ) ) ( not ( = ?auto_157756 ?auto_157761 ) ) ( not ( = ?auto_157757 ?auto_157761 ) ) ( not ( = ?auto_157758 ?auto_157761 ) ) ( not ( = ?auto_157759 ?auto_157761 ) ) ( not ( = ?auto_157760 ?auto_157761 ) ) ( ON ?auto_157759 ?auto_157760 ) ( ON-TABLE ?auto_157761 ) ( ON ?auto_157758 ?auto_157759 ) ( ON ?auto_157757 ?auto_157758 ) ( ON ?auto_157754 ?auto_157762 ) ( not ( = ?auto_157754 ?auto_157762 ) ) ( not ( = ?auto_157755 ?auto_157762 ) ) ( not ( = ?auto_157756 ?auto_157762 ) ) ( not ( = ?auto_157757 ?auto_157762 ) ) ( not ( = ?auto_157758 ?auto_157762 ) ) ( not ( = ?auto_157759 ?auto_157762 ) ) ( not ( = ?auto_157760 ?auto_157762 ) ) ( not ( = ?auto_157761 ?auto_157762 ) ) ( ON ?auto_157755 ?auto_157754 ) ( CLEAR ?auto_157755 ) ( ON-TABLE ?auto_157762 ) ( HOLDING ?auto_157756 ) ( CLEAR ?auto_157757 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_157761 ?auto_157760 ?auto_157759 ?auto_157758 ?auto_157757 ?auto_157756 )
      ( MAKE-7PILE ?auto_157754 ?auto_157755 ?auto_157756 ?auto_157757 ?auto_157758 ?auto_157759 ?auto_157760 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_157763 - BLOCK
      ?auto_157764 - BLOCK
      ?auto_157765 - BLOCK
      ?auto_157766 - BLOCK
      ?auto_157767 - BLOCK
      ?auto_157768 - BLOCK
      ?auto_157769 - BLOCK
    )
    :vars
    (
      ?auto_157770 - BLOCK
      ?auto_157771 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_157763 ?auto_157764 ) ) ( not ( = ?auto_157763 ?auto_157765 ) ) ( not ( = ?auto_157763 ?auto_157766 ) ) ( not ( = ?auto_157763 ?auto_157767 ) ) ( not ( = ?auto_157763 ?auto_157768 ) ) ( not ( = ?auto_157763 ?auto_157769 ) ) ( not ( = ?auto_157764 ?auto_157765 ) ) ( not ( = ?auto_157764 ?auto_157766 ) ) ( not ( = ?auto_157764 ?auto_157767 ) ) ( not ( = ?auto_157764 ?auto_157768 ) ) ( not ( = ?auto_157764 ?auto_157769 ) ) ( not ( = ?auto_157765 ?auto_157766 ) ) ( not ( = ?auto_157765 ?auto_157767 ) ) ( not ( = ?auto_157765 ?auto_157768 ) ) ( not ( = ?auto_157765 ?auto_157769 ) ) ( not ( = ?auto_157766 ?auto_157767 ) ) ( not ( = ?auto_157766 ?auto_157768 ) ) ( not ( = ?auto_157766 ?auto_157769 ) ) ( not ( = ?auto_157767 ?auto_157768 ) ) ( not ( = ?auto_157767 ?auto_157769 ) ) ( not ( = ?auto_157768 ?auto_157769 ) ) ( ON ?auto_157769 ?auto_157770 ) ( not ( = ?auto_157763 ?auto_157770 ) ) ( not ( = ?auto_157764 ?auto_157770 ) ) ( not ( = ?auto_157765 ?auto_157770 ) ) ( not ( = ?auto_157766 ?auto_157770 ) ) ( not ( = ?auto_157767 ?auto_157770 ) ) ( not ( = ?auto_157768 ?auto_157770 ) ) ( not ( = ?auto_157769 ?auto_157770 ) ) ( ON ?auto_157768 ?auto_157769 ) ( ON-TABLE ?auto_157770 ) ( ON ?auto_157767 ?auto_157768 ) ( ON ?auto_157766 ?auto_157767 ) ( ON ?auto_157763 ?auto_157771 ) ( not ( = ?auto_157763 ?auto_157771 ) ) ( not ( = ?auto_157764 ?auto_157771 ) ) ( not ( = ?auto_157765 ?auto_157771 ) ) ( not ( = ?auto_157766 ?auto_157771 ) ) ( not ( = ?auto_157767 ?auto_157771 ) ) ( not ( = ?auto_157768 ?auto_157771 ) ) ( not ( = ?auto_157769 ?auto_157771 ) ) ( not ( = ?auto_157770 ?auto_157771 ) ) ( ON ?auto_157764 ?auto_157763 ) ( ON-TABLE ?auto_157771 ) ( CLEAR ?auto_157766 ) ( ON ?auto_157765 ?auto_157764 ) ( CLEAR ?auto_157765 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_157771 ?auto_157763 ?auto_157764 )
      ( MAKE-7PILE ?auto_157763 ?auto_157764 ?auto_157765 ?auto_157766 ?auto_157767 ?auto_157768 ?auto_157769 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_157772 - BLOCK
      ?auto_157773 - BLOCK
      ?auto_157774 - BLOCK
      ?auto_157775 - BLOCK
      ?auto_157776 - BLOCK
      ?auto_157777 - BLOCK
      ?auto_157778 - BLOCK
    )
    :vars
    (
      ?auto_157779 - BLOCK
      ?auto_157780 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_157772 ?auto_157773 ) ) ( not ( = ?auto_157772 ?auto_157774 ) ) ( not ( = ?auto_157772 ?auto_157775 ) ) ( not ( = ?auto_157772 ?auto_157776 ) ) ( not ( = ?auto_157772 ?auto_157777 ) ) ( not ( = ?auto_157772 ?auto_157778 ) ) ( not ( = ?auto_157773 ?auto_157774 ) ) ( not ( = ?auto_157773 ?auto_157775 ) ) ( not ( = ?auto_157773 ?auto_157776 ) ) ( not ( = ?auto_157773 ?auto_157777 ) ) ( not ( = ?auto_157773 ?auto_157778 ) ) ( not ( = ?auto_157774 ?auto_157775 ) ) ( not ( = ?auto_157774 ?auto_157776 ) ) ( not ( = ?auto_157774 ?auto_157777 ) ) ( not ( = ?auto_157774 ?auto_157778 ) ) ( not ( = ?auto_157775 ?auto_157776 ) ) ( not ( = ?auto_157775 ?auto_157777 ) ) ( not ( = ?auto_157775 ?auto_157778 ) ) ( not ( = ?auto_157776 ?auto_157777 ) ) ( not ( = ?auto_157776 ?auto_157778 ) ) ( not ( = ?auto_157777 ?auto_157778 ) ) ( ON ?auto_157778 ?auto_157779 ) ( not ( = ?auto_157772 ?auto_157779 ) ) ( not ( = ?auto_157773 ?auto_157779 ) ) ( not ( = ?auto_157774 ?auto_157779 ) ) ( not ( = ?auto_157775 ?auto_157779 ) ) ( not ( = ?auto_157776 ?auto_157779 ) ) ( not ( = ?auto_157777 ?auto_157779 ) ) ( not ( = ?auto_157778 ?auto_157779 ) ) ( ON ?auto_157777 ?auto_157778 ) ( ON-TABLE ?auto_157779 ) ( ON ?auto_157776 ?auto_157777 ) ( ON ?auto_157772 ?auto_157780 ) ( not ( = ?auto_157772 ?auto_157780 ) ) ( not ( = ?auto_157773 ?auto_157780 ) ) ( not ( = ?auto_157774 ?auto_157780 ) ) ( not ( = ?auto_157775 ?auto_157780 ) ) ( not ( = ?auto_157776 ?auto_157780 ) ) ( not ( = ?auto_157777 ?auto_157780 ) ) ( not ( = ?auto_157778 ?auto_157780 ) ) ( not ( = ?auto_157779 ?auto_157780 ) ) ( ON ?auto_157773 ?auto_157772 ) ( ON-TABLE ?auto_157780 ) ( ON ?auto_157774 ?auto_157773 ) ( CLEAR ?auto_157774 ) ( HOLDING ?auto_157775 ) ( CLEAR ?auto_157776 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_157779 ?auto_157778 ?auto_157777 ?auto_157776 ?auto_157775 )
      ( MAKE-7PILE ?auto_157772 ?auto_157773 ?auto_157774 ?auto_157775 ?auto_157776 ?auto_157777 ?auto_157778 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_157781 - BLOCK
      ?auto_157782 - BLOCK
      ?auto_157783 - BLOCK
      ?auto_157784 - BLOCK
      ?auto_157785 - BLOCK
      ?auto_157786 - BLOCK
      ?auto_157787 - BLOCK
    )
    :vars
    (
      ?auto_157788 - BLOCK
      ?auto_157789 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_157781 ?auto_157782 ) ) ( not ( = ?auto_157781 ?auto_157783 ) ) ( not ( = ?auto_157781 ?auto_157784 ) ) ( not ( = ?auto_157781 ?auto_157785 ) ) ( not ( = ?auto_157781 ?auto_157786 ) ) ( not ( = ?auto_157781 ?auto_157787 ) ) ( not ( = ?auto_157782 ?auto_157783 ) ) ( not ( = ?auto_157782 ?auto_157784 ) ) ( not ( = ?auto_157782 ?auto_157785 ) ) ( not ( = ?auto_157782 ?auto_157786 ) ) ( not ( = ?auto_157782 ?auto_157787 ) ) ( not ( = ?auto_157783 ?auto_157784 ) ) ( not ( = ?auto_157783 ?auto_157785 ) ) ( not ( = ?auto_157783 ?auto_157786 ) ) ( not ( = ?auto_157783 ?auto_157787 ) ) ( not ( = ?auto_157784 ?auto_157785 ) ) ( not ( = ?auto_157784 ?auto_157786 ) ) ( not ( = ?auto_157784 ?auto_157787 ) ) ( not ( = ?auto_157785 ?auto_157786 ) ) ( not ( = ?auto_157785 ?auto_157787 ) ) ( not ( = ?auto_157786 ?auto_157787 ) ) ( ON ?auto_157787 ?auto_157788 ) ( not ( = ?auto_157781 ?auto_157788 ) ) ( not ( = ?auto_157782 ?auto_157788 ) ) ( not ( = ?auto_157783 ?auto_157788 ) ) ( not ( = ?auto_157784 ?auto_157788 ) ) ( not ( = ?auto_157785 ?auto_157788 ) ) ( not ( = ?auto_157786 ?auto_157788 ) ) ( not ( = ?auto_157787 ?auto_157788 ) ) ( ON ?auto_157786 ?auto_157787 ) ( ON-TABLE ?auto_157788 ) ( ON ?auto_157785 ?auto_157786 ) ( ON ?auto_157781 ?auto_157789 ) ( not ( = ?auto_157781 ?auto_157789 ) ) ( not ( = ?auto_157782 ?auto_157789 ) ) ( not ( = ?auto_157783 ?auto_157789 ) ) ( not ( = ?auto_157784 ?auto_157789 ) ) ( not ( = ?auto_157785 ?auto_157789 ) ) ( not ( = ?auto_157786 ?auto_157789 ) ) ( not ( = ?auto_157787 ?auto_157789 ) ) ( not ( = ?auto_157788 ?auto_157789 ) ) ( ON ?auto_157782 ?auto_157781 ) ( ON-TABLE ?auto_157789 ) ( ON ?auto_157783 ?auto_157782 ) ( CLEAR ?auto_157785 ) ( ON ?auto_157784 ?auto_157783 ) ( CLEAR ?auto_157784 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_157789 ?auto_157781 ?auto_157782 ?auto_157783 )
      ( MAKE-7PILE ?auto_157781 ?auto_157782 ?auto_157783 ?auto_157784 ?auto_157785 ?auto_157786 ?auto_157787 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_157790 - BLOCK
      ?auto_157791 - BLOCK
      ?auto_157792 - BLOCK
      ?auto_157793 - BLOCK
      ?auto_157794 - BLOCK
      ?auto_157795 - BLOCK
      ?auto_157796 - BLOCK
    )
    :vars
    (
      ?auto_157798 - BLOCK
      ?auto_157797 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_157790 ?auto_157791 ) ) ( not ( = ?auto_157790 ?auto_157792 ) ) ( not ( = ?auto_157790 ?auto_157793 ) ) ( not ( = ?auto_157790 ?auto_157794 ) ) ( not ( = ?auto_157790 ?auto_157795 ) ) ( not ( = ?auto_157790 ?auto_157796 ) ) ( not ( = ?auto_157791 ?auto_157792 ) ) ( not ( = ?auto_157791 ?auto_157793 ) ) ( not ( = ?auto_157791 ?auto_157794 ) ) ( not ( = ?auto_157791 ?auto_157795 ) ) ( not ( = ?auto_157791 ?auto_157796 ) ) ( not ( = ?auto_157792 ?auto_157793 ) ) ( not ( = ?auto_157792 ?auto_157794 ) ) ( not ( = ?auto_157792 ?auto_157795 ) ) ( not ( = ?auto_157792 ?auto_157796 ) ) ( not ( = ?auto_157793 ?auto_157794 ) ) ( not ( = ?auto_157793 ?auto_157795 ) ) ( not ( = ?auto_157793 ?auto_157796 ) ) ( not ( = ?auto_157794 ?auto_157795 ) ) ( not ( = ?auto_157794 ?auto_157796 ) ) ( not ( = ?auto_157795 ?auto_157796 ) ) ( ON ?auto_157796 ?auto_157798 ) ( not ( = ?auto_157790 ?auto_157798 ) ) ( not ( = ?auto_157791 ?auto_157798 ) ) ( not ( = ?auto_157792 ?auto_157798 ) ) ( not ( = ?auto_157793 ?auto_157798 ) ) ( not ( = ?auto_157794 ?auto_157798 ) ) ( not ( = ?auto_157795 ?auto_157798 ) ) ( not ( = ?auto_157796 ?auto_157798 ) ) ( ON ?auto_157795 ?auto_157796 ) ( ON-TABLE ?auto_157798 ) ( ON ?auto_157790 ?auto_157797 ) ( not ( = ?auto_157790 ?auto_157797 ) ) ( not ( = ?auto_157791 ?auto_157797 ) ) ( not ( = ?auto_157792 ?auto_157797 ) ) ( not ( = ?auto_157793 ?auto_157797 ) ) ( not ( = ?auto_157794 ?auto_157797 ) ) ( not ( = ?auto_157795 ?auto_157797 ) ) ( not ( = ?auto_157796 ?auto_157797 ) ) ( not ( = ?auto_157798 ?auto_157797 ) ) ( ON ?auto_157791 ?auto_157790 ) ( ON-TABLE ?auto_157797 ) ( ON ?auto_157792 ?auto_157791 ) ( ON ?auto_157793 ?auto_157792 ) ( CLEAR ?auto_157793 ) ( HOLDING ?auto_157794 ) ( CLEAR ?auto_157795 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_157798 ?auto_157796 ?auto_157795 ?auto_157794 )
      ( MAKE-7PILE ?auto_157790 ?auto_157791 ?auto_157792 ?auto_157793 ?auto_157794 ?auto_157795 ?auto_157796 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_157799 - BLOCK
      ?auto_157800 - BLOCK
      ?auto_157801 - BLOCK
      ?auto_157802 - BLOCK
      ?auto_157803 - BLOCK
      ?auto_157804 - BLOCK
      ?auto_157805 - BLOCK
    )
    :vars
    (
      ?auto_157806 - BLOCK
      ?auto_157807 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_157799 ?auto_157800 ) ) ( not ( = ?auto_157799 ?auto_157801 ) ) ( not ( = ?auto_157799 ?auto_157802 ) ) ( not ( = ?auto_157799 ?auto_157803 ) ) ( not ( = ?auto_157799 ?auto_157804 ) ) ( not ( = ?auto_157799 ?auto_157805 ) ) ( not ( = ?auto_157800 ?auto_157801 ) ) ( not ( = ?auto_157800 ?auto_157802 ) ) ( not ( = ?auto_157800 ?auto_157803 ) ) ( not ( = ?auto_157800 ?auto_157804 ) ) ( not ( = ?auto_157800 ?auto_157805 ) ) ( not ( = ?auto_157801 ?auto_157802 ) ) ( not ( = ?auto_157801 ?auto_157803 ) ) ( not ( = ?auto_157801 ?auto_157804 ) ) ( not ( = ?auto_157801 ?auto_157805 ) ) ( not ( = ?auto_157802 ?auto_157803 ) ) ( not ( = ?auto_157802 ?auto_157804 ) ) ( not ( = ?auto_157802 ?auto_157805 ) ) ( not ( = ?auto_157803 ?auto_157804 ) ) ( not ( = ?auto_157803 ?auto_157805 ) ) ( not ( = ?auto_157804 ?auto_157805 ) ) ( ON ?auto_157805 ?auto_157806 ) ( not ( = ?auto_157799 ?auto_157806 ) ) ( not ( = ?auto_157800 ?auto_157806 ) ) ( not ( = ?auto_157801 ?auto_157806 ) ) ( not ( = ?auto_157802 ?auto_157806 ) ) ( not ( = ?auto_157803 ?auto_157806 ) ) ( not ( = ?auto_157804 ?auto_157806 ) ) ( not ( = ?auto_157805 ?auto_157806 ) ) ( ON ?auto_157804 ?auto_157805 ) ( ON-TABLE ?auto_157806 ) ( ON ?auto_157799 ?auto_157807 ) ( not ( = ?auto_157799 ?auto_157807 ) ) ( not ( = ?auto_157800 ?auto_157807 ) ) ( not ( = ?auto_157801 ?auto_157807 ) ) ( not ( = ?auto_157802 ?auto_157807 ) ) ( not ( = ?auto_157803 ?auto_157807 ) ) ( not ( = ?auto_157804 ?auto_157807 ) ) ( not ( = ?auto_157805 ?auto_157807 ) ) ( not ( = ?auto_157806 ?auto_157807 ) ) ( ON ?auto_157800 ?auto_157799 ) ( ON-TABLE ?auto_157807 ) ( ON ?auto_157801 ?auto_157800 ) ( ON ?auto_157802 ?auto_157801 ) ( CLEAR ?auto_157804 ) ( ON ?auto_157803 ?auto_157802 ) ( CLEAR ?auto_157803 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_157807 ?auto_157799 ?auto_157800 ?auto_157801 ?auto_157802 )
      ( MAKE-7PILE ?auto_157799 ?auto_157800 ?auto_157801 ?auto_157802 ?auto_157803 ?auto_157804 ?auto_157805 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_157808 - BLOCK
      ?auto_157809 - BLOCK
      ?auto_157810 - BLOCK
      ?auto_157811 - BLOCK
      ?auto_157812 - BLOCK
      ?auto_157813 - BLOCK
      ?auto_157814 - BLOCK
    )
    :vars
    (
      ?auto_157816 - BLOCK
      ?auto_157815 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_157808 ?auto_157809 ) ) ( not ( = ?auto_157808 ?auto_157810 ) ) ( not ( = ?auto_157808 ?auto_157811 ) ) ( not ( = ?auto_157808 ?auto_157812 ) ) ( not ( = ?auto_157808 ?auto_157813 ) ) ( not ( = ?auto_157808 ?auto_157814 ) ) ( not ( = ?auto_157809 ?auto_157810 ) ) ( not ( = ?auto_157809 ?auto_157811 ) ) ( not ( = ?auto_157809 ?auto_157812 ) ) ( not ( = ?auto_157809 ?auto_157813 ) ) ( not ( = ?auto_157809 ?auto_157814 ) ) ( not ( = ?auto_157810 ?auto_157811 ) ) ( not ( = ?auto_157810 ?auto_157812 ) ) ( not ( = ?auto_157810 ?auto_157813 ) ) ( not ( = ?auto_157810 ?auto_157814 ) ) ( not ( = ?auto_157811 ?auto_157812 ) ) ( not ( = ?auto_157811 ?auto_157813 ) ) ( not ( = ?auto_157811 ?auto_157814 ) ) ( not ( = ?auto_157812 ?auto_157813 ) ) ( not ( = ?auto_157812 ?auto_157814 ) ) ( not ( = ?auto_157813 ?auto_157814 ) ) ( ON ?auto_157814 ?auto_157816 ) ( not ( = ?auto_157808 ?auto_157816 ) ) ( not ( = ?auto_157809 ?auto_157816 ) ) ( not ( = ?auto_157810 ?auto_157816 ) ) ( not ( = ?auto_157811 ?auto_157816 ) ) ( not ( = ?auto_157812 ?auto_157816 ) ) ( not ( = ?auto_157813 ?auto_157816 ) ) ( not ( = ?auto_157814 ?auto_157816 ) ) ( ON-TABLE ?auto_157816 ) ( ON ?auto_157808 ?auto_157815 ) ( not ( = ?auto_157808 ?auto_157815 ) ) ( not ( = ?auto_157809 ?auto_157815 ) ) ( not ( = ?auto_157810 ?auto_157815 ) ) ( not ( = ?auto_157811 ?auto_157815 ) ) ( not ( = ?auto_157812 ?auto_157815 ) ) ( not ( = ?auto_157813 ?auto_157815 ) ) ( not ( = ?auto_157814 ?auto_157815 ) ) ( not ( = ?auto_157816 ?auto_157815 ) ) ( ON ?auto_157809 ?auto_157808 ) ( ON-TABLE ?auto_157815 ) ( ON ?auto_157810 ?auto_157809 ) ( ON ?auto_157811 ?auto_157810 ) ( ON ?auto_157812 ?auto_157811 ) ( CLEAR ?auto_157812 ) ( HOLDING ?auto_157813 ) ( CLEAR ?auto_157814 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_157816 ?auto_157814 ?auto_157813 )
      ( MAKE-7PILE ?auto_157808 ?auto_157809 ?auto_157810 ?auto_157811 ?auto_157812 ?auto_157813 ?auto_157814 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_157817 - BLOCK
      ?auto_157818 - BLOCK
      ?auto_157819 - BLOCK
      ?auto_157820 - BLOCK
      ?auto_157821 - BLOCK
      ?auto_157822 - BLOCK
      ?auto_157823 - BLOCK
    )
    :vars
    (
      ?auto_157824 - BLOCK
      ?auto_157825 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_157817 ?auto_157818 ) ) ( not ( = ?auto_157817 ?auto_157819 ) ) ( not ( = ?auto_157817 ?auto_157820 ) ) ( not ( = ?auto_157817 ?auto_157821 ) ) ( not ( = ?auto_157817 ?auto_157822 ) ) ( not ( = ?auto_157817 ?auto_157823 ) ) ( not ( = ?auto_157818 ?auto_157819 ) ) ( not ( = ?auto_157818 ?auto_157820 ) ) ( not ( = ?auto_157818 ?auto_157821 ) ) ( not ( = ?auto_157818 ?auto_157822 ) ) ( not ( = ?auto_157818 ?auto_157823 ) ) ( not ( = ?auto_157819 ?auto_157820 ) ) ( not ( = ?auto_157819 ?auto_157821 ) ) ( not ( = ?auto_157819 ?auto_157822 ) ) ( not ( = ?auto_157819 ?auto_157823 ) ) ( not ( = ?auto_157820 ?auto_157821 ) ) ( not ( = ?auto_157820 ?auto_157822 ) ) ( not ( = ?auto_157820 ?auto_157823 ) ) ( not ( = ?auto_157821 ?auto_157822 ) ) ( not ( = ?auto_157821 ?auto_157823 ) ) ( not ( = ?auto_157822 ?auto_157823 ) ) ( ON ?auto_157823 ?auto_157824 ) ( not ( = ?auto_157817 ?auto_157824 ) ) ( not ( = ?auto_157818 ?auto_157824 ) ) ( not ( = ?auto_157819 ?auto_157824 ) ) ( not ( = ?auto_157820 ?auto_157824 ) ) ( not ( = ?auto_157821 ?auto_157824 ) ) ( not ( = ?auto_157822 ?auto_157824 ) ) ( not ( = ?auto_157823 ?auto_157824 ) ) ( ON-TABLE ?auto_157824 ) ( ON ?auto_157817 ?auto_157825 ) ( not ( = ?auto_157817 ?auto_157825 ) ) ( not ( = ?auto_157818 ?auto_157825 ) ) ( not ( = ?auto_157819 ?auto_157825 ) ) ( not ( = ?auto_157820 ?auto_157825 ) ) ( not ( = ?auto_157821 ?auto_157825 ) ) ( not ( = ?auto_157822 ?auto_157825 ) ) ( not ( = ?auto_157823 ?auto_157825 ) ) ( not ( = ?auto_157824 ?auto_157825 ) ) ( ON ?auto_157818 ?auto_157817 ) ( ON-TABLE ?auto_157825 ) ( ON ?auto_157819 ?auto_157818 ) ( ON ?auto_157820 ?auto_157819 ) ( ON ?auto_157821 ?auto_157820 ) ( CLEAR ?auto_157823 ) ( ON ?auto_157822 ?auto_157821 ) ( CLEAR ?auto_157822 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_157825 ?auto_157817 ?auto_157818 ?auto_157819 ?auto_157820 ?auto_157821 )
      ( MAKE-7PILE ?auto_157817 ?auto_157818 ?auto_157819 ?auto_157820 ?auto_157821 ?auto_157822 ?auto_157823 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_157826 - BLOCK
      ?auto_157827 - BLOCK
      ?auto_157828 - BLOCK
      ?auto_157829 - BLOCK
      ?auto_157830 - BLOCK
      ?auto_157831 - BLOCK
      ?auto_157832 - BLOCK
    )
    :vars
    (
      ?auto_157833 - BLOCK
      ?auto_157834 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_157826 ?auto_157827 ) ) ( not ( = ?auto_157826 ?auto_157828 ) ) ( not ( = ?auto_157826 ?auto_157829 ) ) ( not ( = ?auto_157826 ?auto_157830 ) ) ( not ( = ?auto_157826 ?auto_157831 ) ) ( not ( = ?auto_157826 ?auto_157832 ) ) ( not ( = ?auto_157827 ?auto_157828 ) ) ( not ( = ?auto_157827 ?auto_157829 ) ) ( not ( = ?auto_157827 ?auto_157830 ) ) ( not ( = ?auto_157827 ?auto_157831 ) ) ( not ( = ?auto_157827 ?auto_157832 ) ) ( not ( = ?auto_157828 ?auto_157829 ) ) ( not ( = ?auto_157828 ?auto_157830 ) ) ( not ( = ?auto_157828 ?auto_157831 ) ) ( not ( = ?auto_157828 ?auto_157832 ) ) ( not ( = ?auto_157829 ?auto_157830 ) ) ( not ( = ?auto_157829 ?auto_157831 ) ) ( not ( = ?auto_157829 ?auto_157832 ) ) ( not ( = ?auto_157830 ?auto_157831 ) ) ( not ( = ?auto_157830 ?auto_157832 ) ) ( not ( = ?auto_157831 ?auto_157832 ) ) ( not ( = ?auto_157826 ?auto_157833 ) ) ( not ( = ?auto_157827 ?auto_157833 ) ) ( not ( = ?auto_157828 ?auto_157833 ) ) ( not ( = ?auto_157829 ?auto_157833 ) ) ( not ( = ?auto_157830 ?auto_157833 ) ) ( not ( = ?auto_157831 ?auto_157833 ) ) ( not ( = ?auto_157832 ?auto_157833 ) ) ( ON-TABLE ?auto_157833 ) ( ON ?auto_157826 ?auto_157834 ) ( not ( = ?auto_157826 ?auto_157834 ) ) ( not ( = ?auto_157827 ?auto_157834 ) ) ( not ( = ?auto_157828 ?auto_157834 ) ) ( not ( = ?auto_157829 ?auto_157834 ) ) ( not ( = ?auto_157830 ?auto_157834 ) ) ( not ( = ?auto_157831 ?auto_157834 ) ) ( not ( = ?auto_157832 ?auto_157834 ) ) ( not ( = ?auto_157833 ?auto_157834 ) ) ( ON ?auto_157827 ?auto_157826 ) ( ON-TABLE ?auto_157834 ) ( ON ?auto_157828 ?auto_157827 ) ( ON ?auto_157829 ?auto_157828 ) ( ON ?auto_157830 ?auto_157829 ) ( ON ?auto_157831 ?auto_157830 ) ( CLEAR ?auto_157831 ) ( HOLDING ?auto_157832 ) ( CLEAR ?auto_157833 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_157833 ?auto_157832 )
      ( MAKE-7PILE ?auto_157826 ?auto_157827 ?auto_157828 ?auto_157829 ?auto_157830 ?auto_157831 ?auto_157832 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_157835 - BLOCK
      ?auto_157836 - BLOCK
      ?auto_157837 - BLOCK
      ?auto_157838 - BLOCK
      ?auto_157839 - BLOCK
      ?auto_157840 - BLOCK
      ?auto_157841 - BLOCK
    )
    :vars
    (
      ?auto_157842 - BLOCK
      ?auto_157843 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_157835 ?auto_157836 ) ) ( not ( = ?auto_157835 ?auto_157837 ) ) ( not ( = ?auto_157835 ?auto_157838 ) ) ( not ( = ?auto_157835 ?auto_157839 ) ) ( not ( = ?auto_157835 ?auto_157840 ) ) ( not ( = ?auto_157835 ?auto_157841 ) ) ( not ( = ?auto_157836 ?auto_157837 ) ) ( not ( = ?auto_157836 ?auto_157838 ) ) ( not ( = ?auto_157836 ?auto_157839 ) ) ( not ( = ?auto_157836 ?auto_157840 ) ) ( not ( = ?auto_157836 ?auto_157841 ) ) ( not ( = ?auto_157837 ?auto_157838 ) ) ( not ( = ?auto_157837 ?auto_157839 ) ) ( not ( = ?auto_157837 ?auto_157840 ) ) ( not ( = ?auto_157837 ?auto_157841 ) ) ( not ( = ?auto_157838 ?auto_157839 ) ) ( not ( = ?auto_157838 ?auto_157840 ) ) ( not ( = ?auto_157838 ?auto_157841 ) ) ( not ( = ?auto_157839 ?auto_157840 ) ) ( not ( = ?auto_157839 ?auto_157841 ) ) ( not ( = ?auto_157840 ?auto_157841 ) ) ( not ( = ?auto_157835 ?auto_157842 ) ) ( not ( = ?auto_157836 ?auto_157842 ) ) ( not ( = ?auto_157837 ?auto_157842 ) ) ( not ( = ?auto_157838 ?auto_157842 ) ) ( not ( = ?auto_157839 ?auto_157842 ) ) ( not ( = ?auto_157840 ?auto_157842 ) ) ( not ( = ?auto_157841 ?auto_157842 ) ) ( ON-TABLE ?auto_157842 ) ( ON ?auto_157835 ?auto_157843 ) ( not ( = ?auto_157835 ?auto_157843 ) ) ( not ( = ?auto_157836 ?auto_157843 ) ) ( not ( = ?auto_157837 ?auto_157843 ) ) ( not ( = ?auto_157838 ?auto_157843 ) ) ( not ( = ?auto_157839 ?auto_157843 ) ) ( not ( = ?auto_157840 ?auto_157843 ) ) ( not ( = ?auto_157841 ?auto_157843 ) ) ( not ( = ?auto_157842 ?auto_157843 ) ) ( ON ?auto_157836 ?auto_157835 ) ( ON-TABLE ?auto_157843 ) ( ON ?auto_157837 ?auto_157836 ) ( ON ?auto_157838 ?auto_157837 ) ( ON ?auto_157839 ?auto_157838 ) ( ON ?auto_157840 ?auto_157839 ) ( CLEAR ?auto_157842 ) ( ON ?auto_157841 ?auto_157840 ) ( CLEAR ?auto_157841 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_157843 ?auto_157835 ?auto_157836 ?auto_157837 ?auto_157838 ?auto_157839 ?auto_157840 )
      ( MAKE-7PILE ?auto_157835 ?auto_157836 ?auto_157837 ?auto_157838 ?auto_157839 ?auto_157840 ?auto_157841 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_157844 - BLOCK
      ?auto_157845 - BLOCK
      ?auto_157846 - BLOCK
      ?auto_157847 - BLOCK
      ?auto_157848 - BLOCK
      ?auto_157849 - BLOCK
      ?auto_157850 - BLOCK
    )
    :vars
    (
      ?auto_157852 - BLOCK
      ?auto_157851 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_157844 ?auto_157845 ) ) ( not ( = ?auto_157844 ?auto_157846 ) ) ( not ( = ?auto_157844 ?auto_157847 ) ) ( not ( = ?auto_157844 ?auto_157848 ) ) ( not ( = ?auto_157844 ?auto_157849 ) ) ( not ( = ?auto_157844 ?auto_157850 ) ) ( not ( = ?auto_157845 ?auto_157846 ) ) ( not ( = ?auto_157845 ?auto_157847 ) ) ( not ( = ?auto_157845 ?auto_157848 ) ) ( not ( = ?auto_157845 ?auto_157849 ) ) ( not ( = ?auto_157845 ?auto_157850 ) ) ( not ( = ?auto_157846 ?auto_157847 ) ) ( not ( = ?auto_157846 ?auto_157848 ) ) ( not ( = ?auto_157846 ?auto_157849 ) ) ( not ( = ?auto_157846 ?auto_157850 ) ) ( not ( = ?auto_157847 ?auto_157848 ) ) ( not ( = ?auto_157847 ?auto_157849 ) ) ( not ( = ?auto_157847 ?auto_157850 ) ) ( not ( = ?auto_157848 ?auto_157849 ) ) ( not ( = ?auto_157848 ?auto_157850 ) ) ( not ( = ?auto_157849 ?auto_157850 ) ) ( not ( = ?auto_157844 ?auto_157852 ) ) ( not ( = ?auto_157845 ?auto_157852 ) ) ( not ( = ?auto_157846 ?auto_157852 ) ) ( not ( = ?auto_157847 ?auto_157852 ) ) ( not ( = ?auto_157848 ?auto_157852 ) ) ( not ( = ?auto_157849 ?auto_157852 ) ) ( not ( = ?auto_157850 ?auto_157852 ) ) ( ON ?auto_157844 ?auto_157851 ) ( not ( = ?auto_157844 ?auto_157851 ) ) ( not ( = ?auto_157845 ?auto_157851 ) ) ( not ( = ?auto_157846 ?auto_157851 ) ) ( not ( = ?auto_157847 ?auto_157851 ) ) ( not ( = ?auto_157848 ?auto_157851 ) ) ( not ( = ?auto_157849 ?auto_157851 ) ) ( not ( = ?auto_157850 ?auto_157851 ) ) ( not ( = ?auto_157852 ?auto_157851 ) ) ( ON ?auto_157845 ?auto_157844 ) ( ON-TABLE ?auto_157851 ) ( ON ?auto_157846 ?auto_157845 ) ( ON ?auto_157847 ?auto_157846 ) ( ON ?auto_157848 ?auto_157847 ) ( ON ?auto_157849 ?auto_157848 ) ( ON ?auto_157850 ?auto_157849 ) ( CLEAR ?auto_157850 ) ( HOLDING ?auto_157852 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_157852 )
      ( MAKE-7PILE ?auto_157844 ?auto_157845 ?auto_157846 ?auto_157847 ?auto_157848 ?auto_157849 ?auto_157850 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_157853 - BLOCK
      ?auto_157854 - BLOCK
      ?auto_157855 - BLOCK
      ?auto_157856 - BLOCK
      ?auto_157857 - BLOCK
      ?auto_157858 - BLOCK
      ?auto_157859 - BLOCK
    )
    :vars
    (
      ?auto_157861 - BLOCK
      ?auto_157860 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_157853 ?auto_157854 ) ) ( not ( = ?auto_157853 ?auto_157855 ) ) ( not ( = ?auto_157853 ?auto_157856 ) ) ( not ( = ?auto_157853 ?auto_157857 ) ) ( not ( = ?auto_157853 ?auto_157858 ) ) ( not ( = ?auto_157853 ?auto_157859 ) ) ( not ( = ?auto_157854 ?auto_157855 ) ) ( not ( = ?auto_157854 ?auto_157856 ) ) ( not ( = ?auto_157854 ?auto_157857 ) ) ( not ( = ?auto_157854 ?auto_157858 ) ) ( not ( = ?auto_157854 ?auto_157859 ) ) ( not ( = ?auto_157855 ?auto_157856 ) ) ( not ( = ?auto_157855 ?auto_157857 ) ) ( not ( = ?auto_157855 ?auto_157858 ) ) ( not ( = ?auto_157855 ?auto_157859 ) ) ( not ( = ?auto_157856 ?auto_157857 ) ) ( not ( = ?auto_157856 ?auto_157858 ) ) ( not ( = ?auto_157856 ?auto_157859 ) ) ( not ( = ?auto_157857 ?auto_157858 ) ) ( not ( = ?auto_157857 ?auto_157859 ) ) ( not ( = ?auto_157858 ?auto_157859 ) ) ( not ( = ?auto_157853 ?auto_157861 ) ) ( not ( = ?auto_157854 ?auto_157861 ) ) ( not ( = ?auto_157855 ?auto_157861 ) ) ( not ( = ?auto_157856 ?auto_157861 ) ) ( not ( = ?auto_157857 ?auto_157861 ) ) ( not ( = ?auto_157858 ?auto_157861 ) ) ( not ( = ?auto_157859 ?auto_157861 ) ) ( ON ?auto_157853 ?auto_157860 ) ( not ( = ?auto_157853 ?auto_157860 ) ) ( not ( = ?auto_157854 ?auto_157860 ) ) ( not ( = ?auto_157855 ?auto_157860 ) ) ( not ( = ?auto_157856 ?auto_157860 ) ) ( not ( = ?auto_157857 ?auto_157860 ) ) ( not ( = ?auto_157858 ?auto_157860 ) ) ( not ( = ?auto_157859 ?auto_157860 ) ) ( not ( = ?auto_157861 ?auto_157860 ) ) ( ON ?auto_157854 ?auto_157853 ) ( ON-TABLE ?auto_157860 ) ( ON ?auto_157855 ?auto_157854 ) ( ON ?auto_157856 ?auto_157855 ) ( ON ?auto_157857 ?auto_157856 ) ( ON ?auto_157858 ?auto_157857 ) ( ON ?auto_157859 ?auto_157858 ) ( ON ?auto_157861 ?auto_157859 ) ( CLEAR ?auto_157861 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_157860 ?auto_157853 ?auto_157854 ?auto_157855 ?auto_157856 ?auto_157857 ?auto_157858 ?auto_157859 )
      ( MAKE-7PILE ?auto_157853 ?auto_157854 ?auto_157855 ?auto_157856 ?auto_157857 ?auto_157858 ?auto_157859 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_157878 - BLOCK
      ?auto_157879 - BLOCK
      ?auto_157880 - BLOCK
      ?auto_157881 - BLOCK
      ?auto_157882 - BLOCK
      ?auto_157883 - BLOCK
      ?auto_157884 - BLOCK
      ?auto_157885 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_157884 ) ( ON-TABLE ?auto_157878 ) ( ON ?auto_157879 ?auto_157878 ) ( ON ?auto_157880 ?auto_157879 ) ( ON ?auto_157881 ?auto_157880 ) ( ON ?auto_157882 ?auto_157881 ) ( ON ?auto_157883 ?auto_157882 ) ( ON ?auto_157884 ?auto_157883 ) ( not ( = ?auto_157878 ?auto_157879 ) ) ( not ( = ?auto_157878 ?auto_157880 ) ) ( not ( = ?auto_157878 ?auto_157881 ) ) ( not ( = ?auto_157878 ?auto_157882 ) ) ( not ( = ?auto_157878 ?auto_157883 ) ) ( not ( = ?auto_157878 ?auto_157884 ) ) ( not ( = ?auto_157878 ?auto_157885 ) ) ( not ( = ?auto_157879 ?auto_157880 ) ) ( not ( = ?auto_157879 ?auto_157881 ) ) ( not ( = ?auto_157879 ?auto_157882 ) ) ( not ( = ?auto_157879 ?auto_157883 ) ) ( not ( = ?auto_157879 ?auto_157884 ) ) ( not ( = ?auto_157879 ?auto_157885 ) ) ( not ( = ?auto_157880 ?auto_157881 ) ) ( not ( = ?auto_157880 ?auto_157882 ) ) ( not ( = ?auto_157880 ?auto_157883 ) ) ( not ( = ?auto_157880 ?auto_157884 ) ) ( not ( = ?auto_157880 ?auto_157885 ) ) ( not ( = ?auto_157881 ?auto_157882 ) ) ( not ( = ?auto_157881 ?auto_157883 ) ) ( not ( = ?auto_157881 ?auto_157884 ) ) ( not ( = ?auto_157881 ?auto_157885 ) ) ( not ( = ?auto_157882 ?auto_157883 ) ) ( not ( = ?auto_157882 ?auto_157884 ) ) ( not ( = ?auto_157882 ?auto_157885 ) ) ( not ( = ?auto_157883 ?auto_157884 ) ) ( not ( = ?auto_157883 ?auto_157885 ) ) ( not ( = ?auto_157884 ?auto_157885 ) ) ( ON-TABLE ?auto_157885 ) ( CLEAR ?auto_157885 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_157885 )
      ( MAKE-8PILE ?auto_157878 ?auto_157879 ?auto_157880 ?auto_157881 ?auto_157882 ?auto_157883 ?auto_157884 ?auto_157885 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_157886 - BLOCK
      ?auto_157887 - BLOCK
      ?auto_157888 - BLOCK
      ?auto_157889 - BLOCK
      ?auto_157890 - BLOCK
      ?auto_157891 - BLOCK
      ?auto_157892 - BLOCK
      ?auto_157893 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_157886 ) ( ON ?auto_157887 ?auto_157886 ) ( ON ?auto_157888 ?auto_157887 ) ( ON ?auto_157889 ?auto_157888 ) ( ON ?auto_157890 ?auto_157889 ) ( ON ?auto_157891 ?auto_157890 ) ( not ( = ?auto_157886 ?auto_157887 ) ) ( not ( = ?auto_157886 ?auto_157888 ) ) ( not ( = ?auto_157886 ?auto_157889 ) ) ( not ( = ?auto_157886 ?auto_157890 ) ) ( not ( = ?auto_157886 ?auto_157891 ) ) ( not ( = ?auto_157886 ?auto_157892 ) ) ( not ( = ?auto_157886 ?auto_157893 ) ) ( not ( = ?auto_157887 ?auto_157888 ) ) ( not ( = ?auto_157887 ?auto_157889 ) ) ( not ( = ?auto_157887 ?auto_157890 ) ) ( not ( = ?auto_157887 ?auto_157891 ) ) ( not ( = ?auto_157887 ?auto_157892 ) ) ( not ( = ?auto_157887 ?auto_157893 ) ) ( not ( = ?auto_157888 ?auto_157889 ) ) ( not ( = ?auto_157888 ?auto_157890 ) ) ( not ( = ?auto_157888 ?auto_157891 ) ) ( not ( = ?auto_157888 ?auto_157892 ) ) ( not ( = ?auto_157888 ?auto_157893 ) ) ( not ( = ?auto_157889 ?auto_157890 ) ) ( not ( = ?auto_157889 ?auto_157891 ) ) ( not ( = ?auto_157889 ?auto_157892 ) ) ( not ( = ?auto_157889 ?auto_157893 ) ) ( not ( = ?auto_157890 ?auto_157891 ) ) ( not ( = ?auto_157890 ?auto_157892 ) ) ( not ( = ?auto_157890 ?auto_157893 ) ) ( not ( = ?auto_157891 ?auto_157892 ) ) ( not ( = ?auto_157891 ?auto_157893 ) ) ( not ( = ?auto_157892 ?auto_157893 ) ) ( ON-TABLE ?auto_157893 ) ( CLEAR ?auto_157893 ) ( HOLDING ?auto_157892 ) ( CLEAR ?auto_157891 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_157886 ?auto_157887 ?auto_157888 ?auto_157889 ?auto_157890 ?auto_157891 ?auto_157892 )
      ( MAKE-8PILE ?auto_157886 ?auto_157887 ?auto_157888 ?auto_157889 ?auto_157890 ?auto_157891 ?auto_157892 ?auto_157893 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_157894 - BLOCK
      ?auto_157895 - BLOCK
      ?auto_157896 - BLOCK
      ?auto_157897 - BLOCK
      ?auto_157898 - BLOCK
      ?auto_157899 - BLOCK
      ?auto_157900 - BLOCK
      ?auto_157901 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_157894 ) ( ON ?auto_157895 ?auto_157894 ) ( ON ?auto_157896 ?auto_157895 ) ( ON ?auto_157897 ?auto_157896 ) ( ON ?auto_157898 ?auto_157897 ) ( ON ?auto_157899 ?auto_157898 ) ( not ( = ?auto_157894 ?auto_157895 ) ) ( not ( = ?auto_157894 ?auto_157896 ) ) ( not ( = ?auto_157894 ?auto_157897 ) ) ( not ( = ?auto_157894 ?auto_157898 ) ) ( not ( = ?auto_157894 ?auto_157899 ) ) ( not ( = ?auto_157894 ?auto_157900 ) ) ( not ( = ?auto_157894 ?auto_157901 ) ) ( not ( = ?auto_157895 ?auto_157896 ) ) ( not ( = ?auto_157895 ?auto_157897 ) ) ( not ( = ?auto_157895 ?auto_157898 ) ) ( not ( = ?auto_157895 ?auto_157899 ) ) ( not ( = ?auto_157895 ?auto_157900 ) ) ( not ( = ?auto_157895 ?auto_157901 ) ) ( not ( = ?auto_157896 ?auto_157897 ) ) ( not ( = ?auto_157896 ?auto_157898 ) ) ( not ( = ?auto_157896 ?auto_157899 ) ) ( not ( = ?auto_157896 ?auto_157900 ) ) ( not ( = ?auto_157896 ?auto_157901 ) ) ( not ( = ?auto_157897 ?auto_157898 ) ) ( not ( = ?auto_157897 ?auto_157899 ) ) ( not ( = ?auto_157897 ?auto_157900 ) ) ( not ( = ?auto_157897 ?auto_157901 ) ) ( not ( = ?auto_157898 ?auto_157899 ) ) ( not ( = ?auto_157898 ?auto_157900 ) ) ( not ( = ?auto_157898 ?auto_157901 ) ) ( not ( = ?auto_157899 ?auto_157900 ) ) ( not ( = ?auto_157899 ?auto_157901 ) ) ( not ( = ?auto_157900 ?auto_157901 ) ) ( ON-TABLE ?auto_157901 ) ( CLEAR ?auto_157899 ) ( ON ?auto_157900 ?auto_157901 ) ( CLEAR ?auto_157900 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_157901 )
      ( MAKE-8PILE ?auto_157894 ?auto_157895 ?auto_157896 ?auto_157897 ?auto_157898 ?auto_157899 ?auto_157900 ?auto_157901 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_157902 - BLOCK
      ?auto_157903 - BLOCK
      ?auto_157904 - BLOCK
      ?auto_157905 - BLOCK
      ?auto_157906 - BLOCK
      ?auto_157907 - BLOCK
      ?auto_157908 - BLOCK
      ?auto_157909 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_157902 ) ( ON ?auto_157903 ?auto_157902 ) ( ON ?auto_157904 ?auto_157903 ) ( ON ?auto_157905 ?auto_157904 ) ( ON ?auto_157906 ?auto_157905 ) ( not ( = ?auto_157902 ?auto_157903 ) ) ( not ( = ?auto_157902 ?auto_157904 ) ) ( not ( = ?auto_157902 ?auto_157905 ) ) ( not ( = ?auto_157902 ?auto_157906 ) ) ( not ( = ?auto_157902 ?auto_157907 ) ) ( not ( = ?auto_157902 ?auto_157908 ) ) ( not ( = ?auto_157902 ?auto_157909 ) ) ( not ( = ?auto_157903 ?auto_157904 ) ) ( not ( = ?auto_157903 ?auto_157905 ) ) ( not ( = ?auto_157903 ?auto_157906 ) ) ( not ( = ?auto_157903 ?auto_157907 ) ) ( not ( = ?auto_157903 ?auto_157908 ) ) ( not ( = ?auto_157903 ?auto_157909 ) ) ( not ( = ?auto_157904 ?auto_157905 ) ) ( not ( = ?auto_157904 ?auto_157906 ) ) ( not ( = ?auto_157904 ?auto_157907 ) ) ( not ( = ?auto_157904 ?auto_157908 ) ) ( not ( = ?auto_157904 ?auto_157909 ) ) ( not ( = ?auto_157905 ?auto_157906 ) ) ( not ( = ?auto_157905 ?auto_157907 ) ) ( not ( = ?auto_157905 ?auto_157908 ) ) ( not ( = ?auto_157905 ?auto_157909 ) ) ( not ( = ?auto_157906 ?auto_157907 ) ) ( not ( = ?auto_157906 ?auto_157908 ) ) ( not ( = ?auto_157906 ?auto_157909 ) ) ( not ( = ?auto_157907 ?auto_157908 ) ) ( not ( = ?auto_157907 ?auto_157909 ) ) ( not ( = ?auto_157908 ?auto_157909 ) ) ( ON-TABLE ?auto_157909 ) ( ON ?auto_157908 ?auto_157909 ) ( CLEAR ?auto_157908 ) ( HOLDING ?auto_157907 ) ( CLEAR ?auto_157906 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_157902 ?auto_157903 ?auto_157904 ?auto_157905 ?auto_157906 ?auto_157907 )
      ( MAKE-8PILE ?auto_157902 ?auto_157903 ?auto_157904 ?auto_157905 ?auto_157906 ?auto_157907 ?auto_157908 ?auto_157909 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_157910 - BLOCK
      ?auto_157911 - BLOCK
      ?auto_157912 - BLOCK
      ?auto_157913 - BLOCK
      ?auto_157914 - BLOCK
      ?auto_157915 - BLOCK
      ?auto_157916 - BLOCK
      ?auto_157917 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_157910 ) ( ON ?auto_157911 ?auto_157910 ) ( ON ?auto_157912 ?auto_157911 ) ( ON ?auto_157913 ?auto_157912 ) ( ON ?auto_157914 ?auto_157913 ) ( not ( = ?auto_157910 ?auto_157911 ) ) ( not ( = ?auto_157910 ?auto_157912 ) ) ( not ( = ?auto_157910 ?auto_157913 ) ) ( not ( = ?auto_157910 ?auto_157914 ) ) ( not ( = ?auto_157910 ?auto_157915 ) ) ( not ( = ?auto_157910 ?auto_157916 ) ) ( not ( = ?auto_157910 ?auto_157917 ) ) ( not ( = ?auto_157911 ?auto_157912 ) ) ( not ( = ?auto_157911 ?auto_157913 ) ) ( not ( = ?auto_157911 ?auto_157914 ) ) ( not ( = ?auto_157911 ?auto_157915 ) ) ( not ( = ?auto_157911 ?auto_157916 ) ) ( not ( = ?auto_157911 ?auto_157917 ) ) ( not ( = ?auto_157912 ?auto_157913 ) ) ( not ( = ?auto_157912 ?auto_157914 ) ) ( not ( = ?auto_157912 ?auto_157915 ) ) ( not ( = ?auto_157912 ?auto_157916 ) ) ( not ( = ?auto_157912 ?auto_157917 ) ) ( not ( = ?auto_157913 ?auto_157914 ) ) ( not ( = ?auto_157913 ?auto_157915 ) ) ( not ( = ?auto_157913 ?auto_157916 ) ) ( not ( = ?auto_157913 ?auto_157917 ) ) ( not ( = ?auto_157914 ?auto_157915 ) ) ( not ( = ?auto_157914 ?auto_157916 ) ) ( not ( = ?auto_157914 ?auto_157917 ) ) ( not ( = ?auto_157915 ?auto_157916 ) ) ( not ( = ?auto_157915 ?auto_157917 ) ) ( not ( = ?auto_157916 ?auto_157917 ) ) ( ON-TABLE ?auto_157917 ) ( ON ?auto_157916 ?auto_157917 ) ( CLEAR ?auto_157914 ) ( ON ?auto_157915 ?auto_157916 ) ( CLEAR ?auto_157915 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_157917 ?auto_157916 )
      ( MAKE-8PILE ?auto_157910 ?auto_157911 ?auto_157912 ?auto_157913 ?auto_157914 ?auto_157915 ?auto_157916 ?auto_157917 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_157918 - BLOCK
      ?auto_157919 - BLOCK
      ?auto_157920 - BLOCK
      ?auto_157921 - BLOCK
      ?auto_157922 - BLOCK
      ?auto_157923 - BLOCK
      ?auto_157924 - BLOCK
      ?auto_157925 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_157918 ) ( ON ?auto_157919 ?auto_157918 ) ( ON ?auto_157920 ?auto_157919 ) ( ON ?auto_157921 ?auto_157920 ) ( not ( = ?auto_157918 ?auto_157919 ) ) ( not ( = ?auto_157918 ?auto_157920 ) ) ( not ( = ?auto_157918 ?auto_157921 ) ) ( not ( = ?auto_157918 ?auto_157922 ) ) ( not ( = ?auto_157918 ?auto_157923 ) ) ( not ( = ?auto_157918 ?auto_157924 ) ) ( not ( = ?auto_157918 ?auto_157925 ) ) ( not ( = ?auto_157919 ?auto_157920 ) ) ( not ( = ?auto_157919 ?auto_157921 ) ) ( not ( = ?auto_157919 ?auto_157922 ) ) ( not ( = ?auto_157919 ?auto_157923 ) ) ( not ( = ?auto_157919 ?auto_157924 ) ) ( not ( = ?auto_157919 ?auto_157925 ) ) ( not ( = ?auto_157920 ?auto_157921 ) ) ( not ( = ?auto_157920 ?auto_157922 ) ) ( not ( = ?auto_157920 ?auto_157923 ) ) ( not ( = ?auto_157920 ?auto_157924 ) ) ( not ( = ?auto_157920 ?auto_157925 ) ) ( not ( = ?auto_157921 ?auto_157922 ) ) ( not ( = ?auto_157921 ?auto_157923 ) ) ( not ( = ?auto_157921 ?auto_157924 ) ) ( not ( = ?auto_157921 ?auto_157925 ) ) ( not ( = ?auto_157922 ?auto_157923 ) ) ( not ( = ?auto_157922 ?auto_157924 ) ) ( not ( = ?auto_157922 ?auto_157925 ) ) ( not ( = ?auto_157923 ?auto_157924 ) ) ( not ( = ?auto_157923 ?auto_157925 ) ) ( not ( = ?auto_157924 ?auto_157925 ) ) ( ON-TABLE ?auto_157925 ) ( ON ?auto_157924 ?auto_157925 ) ( ON ?auto_157923 ?auto_157924 ) ( CLEAR ?auto_157923 ) ( HOLDING ?auto_157922 ) ( CLEAR ?auto_157921 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_157918 ?auto_157919 ?auto_157920 ?auto_157921 ?auto_157922 )
      ( MAKE-8PILE ?auto_157918 ?auto_157919 ?auto_157920 ?auto_157921 ?auto_157922 ?auto_157923 ?auto_157924 ?auto_157925 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_157926 - BLOCK
      ?auto_157927 - BLOCK
      ?auto_157928 - BLOCK
      ?auto_157929 - BLOCK
      ?auto_157930 - BLOCK
      ?auto_157931 - BLOCK
      ?auto_157932 - BLOCK
      ?auto_157933 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_157926 ) ( ON ?auto_157927 ?auto_157926 ) ( ON ?auto_157928 ?auto_157927 ) ( ON ?auto_157929 ?auto_157928 ) ( not ( = ?auto_157926 ?auto_157927 ) ) ( not ( = ?auto_157926 ?auto_157928 ) ) ( not ( = ?auto_157926 ?auto_157929 ) ) ( not ( = ?auto_157926 ?auto_157930 ) ) ( not ( = ?auto_157926 ?auto_157931 ) ) ( not ( = ?auto_157926 ?auto_157932 ) ) ( not ( = ?auto_157926 ?auto_157933 ) ) ( not ( = ?auto_157927 ?auto_157928 ) ) ( not ( = ?auto_157927 ?auto_157929 ) ) ( not ( = ?auto_157927 ?auto_157930 ) ) ( not ( = ?auto_157927 ?auto_157931 ) ) ( not ( = ?auto_157927 ?auto_157932 ) ) ( not ( = ?auto_157927 ?auto_157933 ) ) ( not ( = ?auto_157928 ?auto_157929 ) ) ( not ( = ?auto_157928 ?auto_157930 ) ) ( not ( = ?auto_157928 ?auto_157931 ) ) ( not ( = ?auto_157928 ?auto_157932 ) ) ( not ( = ?auto_157928 ?auto_157933 ) ) ( not ( = ?auto_157929 ?auto_157930 ) ) ( not ( = ?auto_157929 ?auto_157931 ) ) ( not ( = ?auto_157929 ?auto_157932 ) ) ( not ( = ?auto_157929 ?auto_157933 ) ) ( not ( = ?auto_157930 ?auto_157931 ) ) ( not ( = ?auto_157930 ?auto_157932 ) ) ( not ( = ?auto_157930 ?auto_157933 ) ) ( not ( = ?auto_157931 ?auto_157932 ) ) ( not ( = ?auto_157931 ?auto_157933 ) ) ( not ( = ?auto_157932 ?auto_157933 ) ) ( ON-TABLE ?auto_157933 ) ( ON ?auto_157932 ?auto_157933 ) ( ON ?auto_157931 ?auto_157932 ) ( CLEAR ?auto_157929 ) ( ON ?auto_157930 ?auto_157931 ) ( CLEAR ?auto_157930 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_157933 ?auto_157932 ?auto_157931 )
      ( MAKE-8PILE ?auto_157926 ?auto_157927 ?auto_157928 ?auto_157929 ?auto_157930 ?auto_157931 ?auto_157932 ?auto_157933 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_157934 - BLOCK
      ?auto_157935 - BLOCK
      ?auto_157936 - BLOCK
      ?auto_157937 - BLOCK
      ?auto_157938 - BLOCK
      ?auto_157939 - BLOCK
      ?auto_157940 - BLOCK
      ?auto_157941 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_157934 ) ( ON ?auto_157935 ?auto_157934 ) ( ON ?auto_157936 ?auto_157935 ) ( not ( = ?auto_157934 ?auto_157935 ) ) ( not ( = ?auto_157934 ?auto_157936 ) ) ( not ( = ?auto_157934 ?auto_157937 ) ) ( not ( = ?auto_157934 ?auto_157938 ) ) ( not ( = ?auto_157934 ?auto_157939 ) ) ( not ( = ?auto_157934 ?auto_157940 ) ) ( not ( = ?auto_157934 ?auto_157941 ) ) ( not ( = ?auto_157935 ?auto_157936 ) ) ( not ( = ?auto_157935 ?auto_157937 ) ) ( not ( = ?auto_157935 ?auto_157938 ) ) ( not ( = ?auto_157935 ?auto_157939 ) ) ( not ( = ?auto_157935 ?auto_157940 ) ) ( not ( = ?auto_157935 ?auto_157941 ) ) ( not ( = ?auto_157936 ?auto_157937 ) ) ( not ( = ?auto_157936 ?auto_157938 ) ) ( not ( = ?auto_157936 ?auto_157939 ) ) ( not ( = ?auto_157936 ?auto_157940 ) ) ( not ( = ?auto_157936 ?auto_157941 ) ) ( not ( = ?auto_157937 ?auto_157938 ) ) ( not ( = ?auto_157937 ?auto_157939 ) ) ( not ( = ?auto_157937 ?auto_157940 ) ) ( not ( = ?auto_157937 ?auto_157941 ) ) ( not ( = ?auto_157938 ?auto_157939 ) ) ( not ( = ?auto_157938 ?auto_157940 ) ) ( not ( = ?auto_157938 ?auto_157941 ) ) ( not ( = ?auto_157939 ?auto_157940 ) ) ( not ( = ?auto_157939 ?auto_157941 ) ) ( not ( = ?auto_157940 ?auto_157941 ) ) ( ON-TABLE ?auto_157941 ) ( ON ?auto_157940 ?auto_157941 ) ( ON ?auto_157939 ?auto_157940 ) ( ON ?auto_157938 ?auto_157939 ) ( CLEAR ?auto_157938 ) ( HOLDING ?auto_157937 ) ( CLEAR ?auto_157936 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_157934 ?auto_157935 ?auto_157936 ?auto_157937 )
      ( MAKE-8PILE ?auto_157934 ?auto_157935 ?auto_157936 ?auto_157937 ?auto_157938 ?auto_157939 ?auto_157940 ?auto_157941 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_157942 - BLOCK
      ?auto_157943 - BLOCK
      ?auto_157944 - BLOCK
      ?auto_157945 - BLOCK
      ?auto_157946 - BLOCK
      ?auto_157947 - BLOCK
      ?auto_157948 - BLOCK
      ?auto_157949 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_157942 ) ( ON ?auto_157943 ?auto_157942 ) ( ON ?auto_157944 ?auto_157943 ) ( not ( = ?auto_157942 ?auto_157943 ) ) ( not ( = ?auto_157942 ?auto_157944 ) ) ( not ( = ?auto_157942 ?auto_157945 ) ) ( not ( = ?auto_157942 ?auto_157946 ) ) ( not ( = ?auto_157942 ?auto_157947 ) ) ( not ( = ?auto_157942 ?auto_157948 ) ) ( not ( = ?auto_157942 ?auto_157949 ) ) ( not ( = ?auto_157943 ?auto_157944 ) ) ( not ( = ?auto_157943 ?auto_157945 ) ) ( not ( = ?auto_157943 ?auto_157946 ) ) ( not ( = ?auto_157943 ?auto_157947 ) ) ( not ( = ?auto_157943 ?auto_157948 ) ) ( not ( = ?auto_157943 ?auto_157949 ) ) ( not ( = ?auto_157944 ?auto_157945 ) ) ( not ( = ?auto_157944 ?auto_157946 ) ) ( not ( = ?auto_157944 ?auto_157947 ) ) ( not ( = ?auto_157944 ?auto_157948 ) ) ( not ( = ?auto_157944 ?auto_157949 ) ) ( not ( = ?auto_157945 ?auto_157946 ) ) ( not ( = ?auto_157945 ?auto_157947 ) ) ( not ( = ?auto_157945 ?auto_157948 ) ) ( not ( = ?auto_157945 ?auto_157949 ) ) ( not ( = ?auto_157946 ?auto_157947 ) ) ( not ( = ?auto_157946 ?auto_157948 ) ) ( not ( = ?auto_157946 ?auto_157949 ) ) ( not ( = ?auto_157947 ?auto_157948 ) ) ( not ( = ?auto_157947 ?auto_157949 ) ) ( not ( = ?auto_157948 ?auto_157949 ) ) ( ON-TABLE ?auto_157949 ) ( ON ?auto_157948 ?auto_157949 ) ( ON ?auto_157947 ?auto_157948 ) ( ON ?auto_157946 ?auto_157947 ) ( CLEAR ?auto_157944 ) ( ON ?auto_157945 ?auto_157946 ) ( CLEAR ?auto_157945 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_157949 ?auto_157948 ?auto_157947 ?auto_157946 )
      ( MAKE-8PILE ?auto_157942 ?auto_157943 ?auto_157944 ?auto_157945 ?auto_157946 ?auto_157947 ?auto_157948 ?auto_157949 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_157950 - BLOCK
      ?auto_157951 - BLOCK
      ?auto_157952 - BLOCK
      ?auto_157953 - BLOCK
      ?auto_157954 - BLOCK
      ?auto_157955 - BLOCK
      ?auto_157956 - BLOCK
      ?auto_157957 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_157950 ) ( ON ?auto_157951 ?auto_157950 ) ( not ( = ?auto_157950 ?auto_157951 ) ) ( not ( = ?auto_157950 ?auto_157952 ) ) ( not ( = ?auto_157950 ?auto_157953 ) ) ( not ( = ?auto_157950 ?auto_157954 ) ) ( not ( = ?auto_157950 ?auto_157955 ) ) ( not ( = ?auto_157950 ?auto_157956 ) ) ( not ( = ?auto_157950 ?auto_157957 ) ) ( not ( = ?auto_157951 ?auto_157952 ) ) ( not ( = ?auto_157951 ?auto_157953 ) ) ( not ( = ?auto_157951 ?auto_157954 ) ) ( not ( = ?auto_157951 ?auto_157955 ) ) ( not ( = ?auto_157951 ?auto_157956 ) ) ( not ( = ?auto_157951 ?auto_157957 ) ) ( not ( = ?auto_157952 ?auto_157953 ) ) ( not ( = ?auto_157952 ?auto_157954 ) ) ( not ( = ?auto_157952 ?auto_157955 ) ) ( not ( = ?auto_157952 ?auto_157956 ) ) ( not ( = ?auto_157952 ?auto_157957 ) ) ( not ( = ?auto_157953 ?auto_157954 ) ) ( not ( = ?auto_157953 ?auto_157955 ) ) ( not ( = ?auto_157953 ?auto_157956 ) ) ( not ( = ?auto_157953 ?auto_157957 ) ) ( not ( = ?auto_157954 ?auto_157955 ) ) ( not ( = ?auto_157954 ?auto_157956 ) ) ( not ( = ?auto_157954 ?auto_157957 ) ) ( not ( = ?auto_157955 ?auto_157956 ) ) ( not ( = ?auto_157955 ?auto_157957 ) ) ( not ( = ?auto_157956 ?auto_157957 ) ) ( ON-TABLE ?auto_157957 ) ( ON ?auto_157956 ?auto_157957 ) ( ON ?auto_157955 ?auto_157956 ) ( ON ?auto_157954 ?auto_157955 ) ( ON ?auto_157953 ?auto_157954 ) ( CLEAR ?auto_157953 ) ( HOLDING ?auto_157952 ) ( CLEAR ?auto_157951 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_157950 ?auto_157951 ?auto_157952 )
      ( MAKE-8PILE ?auto_157950 ?auto_157951 ?auto_157952 ?auto_157953 ?auto_157954 ?auto_157955 ?auto_157956 ?auto_157957 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_157958 - BLOCK
      ?auto_157959 - BLOCK
      ?auto_157960 - BLOCK
      ?auto_157961 - BLOCK
      ?auto_157962 - BLOCK
      ?auto_157963 - BLOCK
      ?auto_157964 - BLOCK
      ?auto_157965 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_157958 ) ( ON ?auto_157959 ?auto_157958 ) ( not ( = ?auto_157958 ?auto_157959 ) ) ( not ( = ?auto_157958 ?auto_157960 ) ) ( not ( = ?auto_157958 ?auto_157961 ) ) ( not ( = ?auto_157958 ?auto_157962 ) ) ( not ( = ?auto_157958 ?auto_157963 ) ) ( not ( = ?auto_157958 ?auto_157964 ) ) ( not ( = ?auto_157958 ?auto_157965 ) ) ( not ( = ?auto_157959 ?auto_157960 ) ) ( not ( = ?auto_157959 ?auto_157961 ) ) ( not ( = ?auto_157959 ?auto_157962 ) ) ( not ( = ?auto_157959 ?auto_157963 ) ) ( not ( = ?auto_157959 ?auto_157964 ) ) ( not ( = ?auto_157959 ?auto_157965 ) ) ( not ( = ?auto_157960 ?auto_157961 ) ) ( not ( = ?auto_157960 ?auto_157962 ) ) ( not ( = ?auto_157960 ?auto_157963 ) ) ( not ( = ?auto_157960 ?auto_157964 ) ) ( not ( = ?auto_157960 ?auto_157965 ) ) ( not ( = ?auto_157961 ?auto_157962 ) ) ( not ( = ?auto_157961 ?auto_157963 ) ) ( not ( = ?auto_157961 ?auto_157964 ) ) ( not ( = ?auto_157961 ?auto_157965 ) ) ( not ( = ?auto_157962 ?auto_157963 ) ) ( not ( = ?auto_157962 ?auto_157964 ) ) ( not ( = ?auto_157962 ?auto_157965 ) ) ( not ( = ?auto_157963 ?auto_157964 ) ) ( not ( = ?auto_157963 ?auto_157965 ) ) ( not ( = ?auto_157964 ?auto_157965 ) ) ( ON-TABLE ?auto_157965 ) ( ON ?auto_157964 ?auto_157965 ) ( ON ?auto_157963 ?auto_157964 ) ( ON ?auto_157962 ?auto_157963 ) ( ON ?auto_157961 ?auto_157962 ) ( CLEAR ?auto_157959 ) ( ON ?auto_157960 ?auto_157961 ) ( CLEAR ?auto_157960 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_157965 ?auto_157964 ?auto_157963 ?auto_157962 ?auto_157961 )
      ( MAKE-8PILE ?auto_157958 ?auto_157959 ?auto_157960 ?auto_157961 ?auto_157962 ?auto_157963 ?auto_157964 ?auto_157965 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_157966 - BLOCK
      ?auto_157967 - BLOCK
      ?auto_157968 - BLOCK
      ?auto_157969 - BLOCK
      ?auto_157970 - BLOCK
      ?auto_157971 - BLOCK
      ?auto_157972 - BLOCK
      ?auto_157973 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_157966 ) ( not ( = ?auto_157966 ?auto_157967 ) ) ( not ( = ?auto_157966 ?auto_157968 ) ) ( not ( = ?auto_157966 ?auto_157969 ) ) ( not ( = ?auto_157966 ?auto_157970 ) ) ( not ( = ?auto_157966 ?auto_157971 ) ) ( not ( = ?auto_157966 ?auto_157972 ) ) ( not ( = ?auto_157966 ?auto_157973 ) ) ( not ( = ?auto_157967 ?auto_157968 ) ) ( not ( = ?auto_157967 ?auto_157969 ) ) ( not ( = ?auto_157967 ?auto_157970 ) ) ( not ( = ?auto_157967 ?auto_157971 ) ) ( not ( = ?auto_157967 ?auto_157972 ) ) ( not ( = ?auto_157967 ?auto_157973 ) ) ( not ( = ?auto_157968 ?auto_157969 ) ) ( not ( = ?auto_157968 ?auto_157970 ) ) ( not ( = ?auto_157968 ?auto_157971 ) ) ( not ( = ?auto_157968 ?auto_157972 ) ) ( not ( = ?auto_157968 ?auto_157973 ) ) ( not ( = ?auto_157969 ?auto_157970 ) ) ( not ( = ?auto_157969 ?auto_157971 ) ) ( not ( = ?auto_157969 ?auto_157972 ) ) ( not ( = ?auto_157969 ?auto_157973 ) ) ( not ( = ?auto_157970 ?auto_157971 ) ) ( not ( = ?auto_157970 ?auto_157972 ) ) ( not ( = ?auto_157970 ?auto_157973 ) ) ( not ( = ?auto_157971 ?auto_157972 ) ) ( not ( = ?auto_157971 ?auto_157973 ) ) ( not ( = ?auto_157972 ?auto_157973 ) ) ( ON-TABLE ?auto_157973 ) ( ON ?auto_157972 ?auto_157973 ) ( ON ?auto_157971 ?auto_157972 ) ( ON ?auto_157970 ?auto_157971 ) ( ON ?auto_157969 ?auto_157970 ) ( ON ?auto_157968 ?auto_157969 ) ( CLEAR ?auto_157968 ) ( HOLDING ?auto_157967 ) ( CLEAR ?auto_157966 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_157966 ?auto_157967 )
      ( MAKE-8PILE ?auto_157966 ?auto_157967 ?auto_157968 ?auto_157969 ?auto_157970 ?auto_157971 ?auto_157972 ?auto_157973 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_157974 - BLOCK
      ?auto_157975 - BLOCK
      ?auto_157976 - BLOCK
      ?auto_157977 - BLOCK
      ?auto_157978 - BLOCK
      ?auto_157979 - BLOCK
      ?auto_157980 - BLOCK
      ?auto_157981 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_157974 ) ( not ( = ?auto_157974 ?auto_157975 ) ) ( not ( = ?auto_157974 ?auto_157976 ) ) ( not ( = ?auto_157974 ?auto_157977 ) ) ( not ( = ?auto_157974 ?auto_157978 ) ) ( not ( = ?auto_157974 ?auto_157979 ) ) ( not ( = ?auto_157974 ?auto_157980 ) ) ( not ( = ?auto_157974 ?auto_157981 ) ) ( not ( = ?auto_157975 ?auto_157976 ) ) ( not ( = ?auto_157975 ?auto_157977 ) ) ( not ( = ?auto_157975 ?auto_157978 ) ) ( not ( = ?auto_157975 ?auto_157979 ) ) ( not ( = ?auto_157975 ?auto_157980 ) ) ( not ( = ?auto_157975 ?auto_157981 ) ) ( not ( = ?auto_157976 ?auto_157977 ) ) ( not ( = ?auto_157976 ?auto_157978 ) ) ( not ( = ?auto_157976 ?auto_157979 ) ) ( not ( = ?auto_157976 ?auto_157980 ) ) ( not ( = ?auto_157976 ?auto_157981 ) ) ( not ( = ?auto_157977 ?auto_157978 ) ) ( not ( = ?auto_157977 ?auto_157979 ) ) ( not ( = ?auto_157977 ?auto_157980 ) ) ( not ( = ?auto_157977 ?auto_157981 ) ) ( not ( = ?auto_157978 ?auto_157979 ) ) ( not ( = ?auto_157978 ?auto_157980 ) ) ( not ( = ?auto_157978 ?auto_157981 ) ) ( not ( = ?auto_157979 ?auto_157980 ) ) ( not ( = ?auto_157979 ?auto_157981 ) ) ( not ( = ?auto_157980 ?auto_157981 ) ) ( ON-TABLE ?auto_157981 ) ( ON ?auto_157980 ?auto_157981 ) ( ON ?auto_157979 ?auto_157980 ) ( ON ?auto_157978 ?auto_157979 ) ( ON ?auto_157977 ?auto_157978 ) ( ON ?auto_157976 ?auto_157977 ) ( CLEAR ?auto_157974 ) ( ON ?auto_157975 ?auto_157976 ) ( CLEAR ?auto_157975 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_157981 ?auto_157980 ?auto_157979 ?auto_157978 ?auto_157977 ?auto_157976 )
      ( MAKE-8PILE ?auto_157974 ?auto_157975 ?auto_157976 ?auto_157977 ?auto_157978 ?auto_157979 ?auto_157980 ?auto_157981 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_157982 - BLOCK
      ?auto_157983 - BLOCK
      ?auto_157984 - BLOCK
      ?auto_157985 - BLOCK
      ?auto_157986 - BLOCK
      ?auto_157987 - BLOCK
      ?auto_157988 - BLOCK
      ?auto_157989 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_157982 ?auto_157983 ) ) ( not ( = ?auto_157982 ?auto_157984 ) ) ( not ( = ?auto_157982 ?auto_157985 ) ) ( not ( = ?auto_157982 ?auto_157986 ) ) ( not ( = ?auto_157982 ?auto_157987 ) ) ( not ( = ?auto_157982 ?auto_157988 ) ) ( not ( = ?auto_157982 ?auto_157989 ) ) ( not ( = ?auto_157983 ?auto_157984 ) ) ( not ( = ?auto_157983 ?auto_157985 ) ) ( not ( = ?auto_157983 ?auto_157986 ) ) ( not ( = ?auto_157983 ?auto_157987 ) ) ( not ( = ?auto_157983 ?auto_157988 ) ) ( not ( = ?auto_157983 ?auto_157989 ) ) ( not ( = ?auto_157984 ?auto_157985 ) ) ( not ( = ?auto_157984 ?auto_157986 ) ) ( not ( = ?auto_157984 ?auto_157987 ) ) ( not ( = ?auto_157984 ?auto_157988 ) ) ( not ( = ?auto_157984 ?auto_157989 ) ) ( not ( = ?auto_157985 ?auto_157986 ) ) ( not ( = ?auto_157985 ?auto_157987 ) ) ( not ( = ?auto_157985 ?auto_157988 ) ) ( not ( = ?auto_157985 ?auto_157989 ) ) ( not ( = ?auto_157986 ?auto_157987 ) ) ( not ( = ?auto_157986 ?auto_157988 ) ) ( not ( = ?auto_157986 ?auto_157989 ) ) ( not ( = ?auto_157987 ?auto_157988 ) ) ( not ( = ?auto_157987 ?auto_157989 ) ) ( not ( = ?auto_157988 ?auto_157989 ) ) ( ON-TABLE ?auto_157989 ) ( ON ?auto_157988 ?auto_157989 ) ( ON ?auto_157987 ?auto_157988 ) ( ON ?auto_157986 ?auto_157987 ) ( ON ?auto_157985 ?auto_157986 ) ( ON ?auto_157984 ?auto_157985 ) ( ON ?auto_157983 ?auto_157984 ) ( CLEAR ?auto_157983 ) ( HOLDING ?auto_157982 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_157982 )
      ( MAKE-8PILE ?auto_157982 ?auto_157983 ?auto_157984 ?auto_157985 ?auto_157986 ?auto_157987 ?auto_157988 ?auto_157989 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_157990 - BLOCK
      ?auto_157991 - BLOCK
      ?auto_157992 - BLOCK
      ?auto_157993 - BLOCK
      ?auto_157994 - BLOCK
      ?auto_157995 - BLOCK
      ?auto_157996 - BLOCK
      ?auto_157997 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_157990 ?auto_157991 ) ) ( not ( = ?auto_157990 ?auto_157992 ) ) ( not ( = ?auto_157990 ?auto_157993 ) ) ( not ( = ?auto_157990 ?auto_157994 ) ) ( not ( = ?auto_157990 ?auto_157995 ) ) ( not ( = ?auto_157990 ?auto_157996 ) ) ( not ( = ?auto_157990 ?auto_157997 ) ) ( not ( = ?auto_157991 ?auto_157992 ) ) ( not ( = ?auto_157991 ?auto_157993 ) ) ( not ( = ?auto_157991 ?auto_157994 ) ) ( not ( = ?auto_157991 ?auto_157995 ) ) ( not ( = ?auto_157991 ?auto_157996 ) ) ( not ( = ?auto_157991 ?auto_157997 ) ) ( not ( = ?auto_157992 ?auto_157993 ) ) ( not ( = ?auto_157992 ?auto_157994 ) ) ( not ( = ?auto_157992 ?auto_157995 ) ) ( not ( = ?auto_157992 ?auto_157996 ) ) ( not ( = ?auto_157992 ?auto_157997 ) ) ( not ( = ?auto_157993 ?auto_157994 ) ) ( not ( = ?auto_157993 ?auto_157995 ) ) ( not ( = ?auto_157993 ?auto_157996 ) ) ( not ( = ?auto_157993 ?auto_157997 ) ) ( not ( = ?auto_157994 ?auto_157995 ) ) ( not ( = ?auto_157994 ?auto_157996 ) ) ( not ( = ?auto_157994 ?auto_157997 ) ) ( not ( = ?auto_157995 ?auto_157996 ) ) ( not ( = ?auto_157995 ?auto_157997 ) ) ( not ( = ?auto_157996 ?auto_157997 ) ) ( ON-TABLE ?auto_157997 ) ( ON ?auto_157996 ?auto_157997 ) ( ON ?auto_157995 ?auto_157996 ) ( ON ?auto_157994 ?auto_157995 ) ( ON ?auto_157993 ?auto_157994 ) ( ON ?auto_157992 ?auto_157993 ) ( ON ?auto_157991 ?auto_157992 ) ( ON ?auto_157990 ?auto_157991 ) ( CLEAR ?auto_157990 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_157997 ?auto_157996 ?auto_157995 ?auto_157994 ?auto_157993 ?auto_157992 ?auto_157991 )
      ( MAKE-8PILE ?auto_157990 ?auto_157991 ?auto_157992 ?auto_157993 ?auto_157994 ?auto_157995 ?auto_157996 ?auto_157997 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_158006 - BLOCK
      ?auto_158007 - BLOCK
      ?auto_158008 - BLOCK
      ?auto_158009 - BLOCK
      ?auto_158010 - BLOCK
      ?auto_158011 - BLOCK
      ?auto_158012 - BLOCK
      ?auto_158013 - BLOCK
    )
    :vars
    (
      ?auto_158014 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_158006 ?auto_158007 ) ) ( not ( = ?auto_158006 ?auto_158008 ) ) ( not ( = ?auto_158006 ?auto_158009 ) ) ( not ( = ?auto_158006 ?auto_158010 ) ) ( not ( = ?auto_158006 ?auto_158011 ) ) ( not ( = ?auto_158006 ?auto_158012 ) ) ( not ( = ?auto_158006 ?auto_158013 ) ) ( not ( = ?auto_158007 ?auto_158008 ) ) ( not ( = ?auto_158007 ?auto_158009 ) ) ( not ( = ?auto_158007 ?auto_158010 ) ) ( not ( = ?auto_158007 ?auto_158011 ) ) ( not ( = ?auto_158007 ?auto_158012 ) ) ( not ( = ?auto_158007 ?auto_158013 ) ) ( not ( = ?auto_158008 ?auto_158009 ) ) ( not ( = ?auto_158008 ?auto_158010 ) ) ( not ( = ?auto_158008 ?auto_158011 ) ) ( not ( = ?auto_158008 ?auto_158012 ) ) ( not ( = ?auto_158008 ?auto_158013 ) ) ( not ( = ?auto_158009 ?auto_158010 ) ) ( not ( = ?auto_158009 ?auto_158011 ) ) ( not ( = ?auto_158009 ?auto_158012 ) ) ( not ( = ?auto_158009 ?auto_158013 ) ) ( not ( = ?auto_158010 ?auto_158011 ) ) ( not ( = ?auto_158010 ?auto_158012 ) ) ( not ( = ?auto_158010 ?auto_158013 ) ) ( not ( = ?auto_158011 ?auto_158012 ) ) ( not ( = ?auto_158011 ?auto_158013 ) ) ( not ( = ?auto_158012 ?auto_158013 ) ) ( ON-TABLE ?auto_158013 ) ( ON ?auto_158012 ?auto_158013 ) ( ON ?auto_158011 ?auto_158012 ) ( ON ?auto_158010 ?auto_158011 ) ( ON ?auto_158009 ?auto_158010 ) ( ON ?auto_158008 ?auto_158009 ) ( ON ?auto_158007 ?auto_158008 ) ( CLEAR ?auto_158007 ) ( ON ?auto_158006 ?auto_158014 ) ( CLEAR ?auto_158006 ) ( HAND-EMPTY ) ( not ( = ?auto_158006 ?auto_158014 ) ) ( not ( = ?auto_158007 ?auto_158014 ) ) ( not ( = ?auto_158008 ?auto_158014 ) ) ( not ( = ?auto_158009 ?auto_158014 ) ) ( not ( = ?auto_158010 ?auto_158014 ) ) ( not ( = ?auto_158011 ?auto_158014 ) ) ( not ( = ?auto_158012 ?auto_158014 ) ) ( not ( = ?auto_158013 ?auto_158014 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_158006 ?auto_158014 )
      ( MAKE-8PILE ?auto_158006 ?auto_158007 ?auto_158008 ?auto_158009 ?auto_158010 ?auto_158011 ?auto_158012 ?auto_158013 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_158015 - BLOCK
      ?auto_158016 - BLOCK
      ?auto_158017 - BLOCK
      ?auto_158018 - BLOCK
      ?auto_158019 - BLOCK
      ?auto_158020 - BLOCK
      ?auto_158021 - BLOCK
      ?auto_158022 - BLOCK
    )
    :vars
    (
      ?auto_158023 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_158015 ?auto_158016 ) ) ( not ( = ?auto_158015 ?auto_158017 ) ) ( not ( = ?auto_158015 ?auto_158018 ) ) ( not ( = ?auto_158015 ?auto_158019 ) ) ( not ( = ?auto_158015 ?auto_158020 ) ) ( not ( = ?auto_158015 ?auto_158021 ) ) ( not ( = ?auto_158015 ?auto_158022 ) ) ( not ( = ?auto_158016 ?auto_158017 ) ) ( not ( = ?auto_158016 ?auto_158018 ) ) ( not ( = ?auto_158016 ?auto_158019 ) ) ( not ( = ?auto_158016 ?auto_158020 ) ) ( not ( = ?auto_158016 ?auto_158021 ) ) ( not ( = ?auto_158016 ?auto_158022 ) ) ( not ( = ?auto_158017 ?auto_158018 ) ) ( not ( = ?auto_158017 ?auto_158019 ) ) ( not ( = ?auto_158017 ?auto_158020 ) ) ( not ( = ?auto_158017 ?auto_158021 ) ) ( not ( = ?auto_158017 ?auto_158022 ) ) ( not ( = ?auto_158018 ?auto_158019 ) ) ( not ( = ?auto_158018 ?auto_158020 ) ) ( not ( = ?auto_158018 ?auto_158021 ) ) ( not ( = ?auto_158018 ?auto_158022 ) ) ( not ( = ?auto_158019 ?auto_158020 ) ) ( not ( = ?auto_158019 ?auto_158021 ) ) ( not ( = ?auto_158019 ?auto_158022 ) ) ( not ( = ?auto_158020 ?auto_158021 ) ) ( not ( = ?auto_158020 ?auto_158022 ) ) ( not ( = ?auto_158021 ?auto_158022 ) ) ( ON-TABLE ?auto_158022 ) ( ON ?auto_158021 ?auto_158022 ) ( ON ?auto_158020 ?auto_158021 ) ( ON ?auto_158019 ?auto_158020 ) ( ON ?auto_158018 ?auto_158019 ) ( ON ?auto_158017 ?auto_158018 ) ( ON ?auto_158015 ?auto_158023 ) ( CLEAR ?auto_158015 ) ( not ( = ?auto_158015 ?auto_158023 ) ) ( not ( = ?auto_158016 ?auto_158023 ) ) ( not ( = ?auto_158017 ?auto_158023 ) ) ( not ( = ?auto_158018 ?auto_158023 ) ) ( not ( = ?auto_158019 ?auto_158023 ) ) ( not ( = ?auto_158020 ?auto_158023 ) ) ( not ( = ?auto_158021 ?auto_158023 ) ) ( not ( = ?auto_158022 ?auto_158023 ) ) ( HOLDING ?auto_158016 ) ( CLEAR ?auto_158017 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_158022 ?auto_158021 ?auto_158020 ?auto_158019 ?auto_158018 ?auto_158017 ?auto_158016 )
      ( MAKE-8PILE ?auto_158015 ?auto_158016 ?auto_158017 ?auto_158018 ?auto_158019 ?auto_158020 ?auto_158021 ?auto_158022 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_158024 - BLOCK
      ?auto_158025 - BLOCK
      ?auto_158026 - BLOCK
      ?auto_158027 - BLOCK
      ?auto_158028 - BLOCK
      ?auto_158029 - BLOCK
      ?auto_158030 - BLOCK
      ?auto_158031 - BLOCK
    )
    :vars
    (
      ?auto_158032 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_158024 ?auto_158025 ) ) ( not ( = ?auto_158024 ?auto_158026 ) ) ( not ( = ?auto_158024 ?auto_158027 ) ) ( not ( = ?auto_158024 ?auto_158028 ) ) ( not ( = ?auto_158024 ?auto_158029 ) ) ( not ( = ?auto_158024 ?auto_158030 ) ) ( not ( = ?auto_158024 ?auto_158031 ) ) ( not ( = ?auto_158025 ?auto_158026 ) ) ( not ( = ?auto_158025 ?auto_158027 ) ) ( not ( = ?auto_158025 ?auto_158028 ) ) ( not ( = ?auto_158025 ?auto_158029 ) ) ( not ( = ?auto_158025 ?auto_158030 ) ) ( not ( = ?auto_158025 ?auto_158031 ) ) ( not ( = ?auto_158026 ?auto_158027 ) ) ( not ( = ?auto_158026 ?auto_158028 ) ) ( not ( = ?auto_158026 ?auto_158029 ) ) ( not ( = ?auto_158026 ?auto_158030 ) ) ( not ( = ?auto_158026 ?auto_158031 ) ) ( not ( = ?auto_158027 ?auto_158028 ) ) ( not ( = ?auto_158027 ?auto_158029 ) ) ( not ( = ?auto_158027 ?auto_158030 ) ) ( not ( = ?auto_158027 ?auto_158031 ) ) ( not ( = ?auto_158028 ?auto_158029 ) ) ( not ( = ?auto_158028 ?auto_158030 ) ) ( not ( = ?auto_158028 ?auto_158031 ) ) ( not ( = ?auto_158029 ?auto_158030 ) ) ( not ( = ?auto_158029 ?auto_158031 ) ) ( not ( = ?auto_158030 ?auto_158031 ) ) ( ON-TABLE ?auto_158031 ) ( ON ?auto_158030 ?auto_158031 ) ( ON ?auto_158029 ?auto_158030 ) ( ON ?auto_158028 ?auto_158029 ) ( ON ?auto_158027 ?auto_158028 ) ( ON ?auto_158026 ?auto_158027 ) ( ON ?auto_158024 ?auto_158032 ) ( not ( = ?auto_158024 ?auto_158032 ) ) ( not ( = ?auto_158025 ?auto_158032 ) ) ( not ( = ?auto_158026 ?auto_158032 ) ) ( not ( = ?auto_158027 ?auto_158032 ) ) ( not ( = ?auto_158028 ?auto_158032 ) ) ( not ( = ?auto_158029 ?auto_158032 ) ) ( not ( = ?auto_158030 ?auto_158032 ) ) ( not ( = ?auto_158031 ?auto_158032 ) ) ( CLEAR ?auto_158026 ) ( ON ?auto_158025 ?auto_158024 ) ( CLEAR ?auto_158025 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_158032 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_158032 ?auto_158024 )
      ( MAKE-8PILE ?auto_158024 ?auto_158025 ?auto_158026 ?auto_158027 ?auto_158028 ?auto_158029 ?auto_158030 ?auto_158031 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_158033 - BLOCK
      ?auto_158034 - BLOCK
      ?auto_158035 - BLOCK
      ?auto_158036 - BLOCK
      ?auto_158037 - BLOCK
      ?auto_158038 - BLOCK
      ?auto_158039 - BLOCK
      ?auto_158040 - BLOCK
    )
    :vars
    (
      ?auto_158041 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_158033 ?auto_158034 ) ) ( not ( = ?auto_158033 ?auto_158035 ) ) ( not ( = ?auto_158033 ?auto_158036 ) ) ( not ( = ?auto_158033 ?auto_158037 ) ) ( not ( = ?auto_158033 ?auto_158038 ) ) ( not ( = ?auto_158033 ?auto_158039 ) ) ( not ( = ?auto_158033 ?auto_158040 ) ) ( not ( = ?auto_158034 ?auto_158035 ) ) ( not ( = ?auto_158034 ?auto_158036 ) ) ( not ( = ?auto_158034 ?auto_158037 ) ) ( not ( = ?auto_158034 ?auto_158038 ) ) ( not ( = ?auto_158034 ?auto_158039 ) ) ( not ( = ?auto_158034 ?auto_158040 ) ) ( not ( = ?auto_158035 ?auto_158036 ) ) ( not ( = ?auto_158035 ?auto_158037 ) ) ( not ( = ?auto_158035 ?auto_158038 ) ) ( not ( = ?auto_158035 ?auto_158039 ) ) ( not ( = ?auto_158035 ?auto_158040 ) ) ( not ( = ?auto_158036 ?auto_158037 ) ) ( not ( = ?auto_158036 ?auto_158038 ) ) ( not ( = ?auto_158036 ?auto_158039 ) ) ( not ( = ?auto_158036 ?auto_158040 ) ) ( not ( = ?auto_158037 ?auto_158038 ) ) ( not ( = ?auto_158037 ?auto_158039 ) ) ( not ( = ?auto_158037 ?auto_158040 ) ) ( not ( = ?auto_158038 ?auto_158039 ) ) ( not ( = ?auto_158038 ?auto_158040 ) ) ( not ( = ?auto_158039 ?auto_158040 ) ) ( ON-TABLE ?auto_158040 ) ( ON ?auto_158039 ?auto_158040 ) ( ON ?auto_158038 ?auto_158039 ) ( ON ?auto_158037 ?auto_158038 ) ( ON ?auto_158036 ?auto_158037 ) ( ON ?auto_158033 ?auto_158041 ) ( not ( = ?auto_158033 ?auto_158041 ) ) ( not ( = ?auto_158034 ?auto_158041 ) ) ( not ( = ?auto_158035 ?auto_158041 ) ) ( not ( = ?auto_158036 ?auto_158041 ) ) ( not ( = ?auto_158037 ?auto_158041 ) ) ( not ( = ?auto_158038 ?auto_158041 ) ) ( not ( = ?auto_158039 ?auto_158041 ) ) ( not ( = ?auto_158040 ?auto_158041 ) ) ( ON ?auto_158034 ?auto_158033 ) ( CLEAR ?auto_158034 ) ( ON-TABLE ?auto_158041 ) ( HOLDING ?auto_158035 ) ( CLEAR ?auto_158036 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_158040 ?auto_158039 ?auto_158038 ?auto_158037 ?auto_158036 ?auto_158035 )
      ( MAKE-8PILE ?auto_158033 ?auto_158034 ?auto_158035 ?auto_158036 ?auto_158037 ?auto_158038 ?auto_158039 ?auto_158040 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_158042 - BLOCK
      ?auto_158043 - BLOCK
      ?auto_158044 - BLOCK
      ?auto_158045 - BLOCK
      ?auto_158046 - BLOCK
      ?auto_158047 - BLOCK
      ?auto_158048 - BLOCK
      ?auto_158049 - BLOCK
    )
    :vars
    (
      ?auto_158050 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_158042 ?auto_158043 ) ) ( not ( = ?auto_158042 ?auto_158044 ) ) ( not ( = ?auto_158042 ?auto_158045 ) ) ( not ( = ?auto_158042 ?auto_158046 ) ) ( not ( = ?auto_158042 ?auto_158047 ) ) ( not ( = ?auto_158042 ?auto_158048 ) ) ( not ( = ?auto_158042 ?auto_158049 ) ) ( not ( = ?auto_158043 ?auto_158044 ) ) ( not ( = ?auto_158043 ?auto_158045 ) ) ( not ( = ?auto_158043 ?auto_158046 ) ) ( not ( = ?auto_158043 ?auto_158047 ) ) ( not ( = ?auto_158043 ?auto_158048 ) ) ( not ( = ?auto_158043 ?auto_158049 ) ) ( not ( = ?auto_158044 ?auto_158045 ) ) ( not ( = ?auto_158044 ?auto_158046 ) ) ( not ( = ?auto_158044 ?auto_158047 ) ) ( not ( = ?auto_158044 ?auto_158048 ) ) ( not ( = ?auto_158044 ?auto_158049 ) ) ( not ( = ?auto_158045 ?auto_158046 ) ) ( not ( = ?auto_158045 ?auto_158047 ) ) ( not ( = ?auto_158045 ?auto_158048 ) ) ( not ( = ?auto_158045 ?auto_158049 ) ) ( not ( = ?auto_158046 ?auto_158047 ) ) ( not ( = ?auto_158046 ?auto_158048 ) ) ( not ( = ?auto_158046 ?auto_158049 ) ) ( not ( = ?auto_158047 ?auto_158048 ) ) ( not ( = ?auto_158047 ?auto_158049 ) ) ( not ( = ?auto_158048 ?auto_158049 ) ) ( ON-TABLE ?auto_158049 ) ( ON ?auto_158048 ?auto_158049 ) ( ON ?auto_158047 ?auto_158048 ) ( ON ?auto_158046 ?auto_158047 ) ( ON ?auto_158045 ?auto_158046 ) ( ON ?auto_158042 ?auto_158050 ) ( not ( = ?auto_158042 ?auto_158050 ) ) ( not ( = ?auto_158043 ?auto_158050 ) ) ( not ( = ?auto_158044 ?auto_158050 ) ) ( not ( = ?auto_158045 ?auto_158050 ) ) ( not ( = ?auto_158046 ?auto_158050 ) ) ( not ( = ?auto_158047 ?auto_158050 ) ) ( not ( = ?auto_158048 ?auto_158050 ) ) ( not ( = ?auto_158049 ?auto_158050 ) ) ( ON ?auto_158043 ?auto_158042 ) ( ON-TABLE ?auto_158050 ) ( CLEAR ?auto_158045 ) ( ON ?auto_158044 ?auto_158043 ) ( CLEAR ?auto_158044 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_158050 ?auto_158042 ?auto_158043 )
      ( MAKE-8PILE ?auto_158042 ?auto_158043 ?auto_158044 ?auto_158045 ?auto_158046 ?auto_158047 ?auto_158048 ?auto_158049 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_158051 - BLOCK
      ?auto_158052 - BLOCK
      ?auto_158053 - BLOCK
      ?auto_158054 - BLOCK
      ?auto_158055 - BLOCK
      ?auto_158056 - BLOCK
      ?auto_158057 - BLOCK
      ?auto_158058 - BLOCK
    )
    :vars
    (
      ?auto_158059 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_158051 ?auto_158052 ) ) ( not ( = ?auto_158051 ?auto_158053 ) ) ( not ( = ?auto_158051 ?auto_158054 ) ) ( not ( = ?auto_158051 ?auto_158055 ) ) ( not ( = ?auto_158051 ?auto_158056 ) ) ( not ( = ?auto_158051 ?auto_158057 ) ) ( not ( = ?auto_158051 ?auto_158058 ) ) ( not ( = ?auto_158052 ?auto_158053 ) ) ( not ( = ?auto_158052 ?auto_158054 ) ) ( not ( = ?auto_158052 ?auto_158055 ) ) ( not ( = ?auto_158052 ?auto_158056 ) ) ( not ( = ?auto_158052 ?auto_158057 ) ) ( not ( = ?auto_158052 ?auto_158058 ) ) ( not ( = ?auto_158053 ?auto_158054 ) ) ( not ( = ?auto_158053 ?auto_158055 ) ) ( not ( = ?auto_158053 ?auto_158056 ) ) ( not ( = ?auto_158053 ?auto_158057 ) ) ( not ( = ?auto_158053 ?auto_158058 ) ) ( not ( = ?auto_158054 ?auto_158055 ) ) ( not ( = ?auto_158054 ?auto_158056 ) ) ( not ( = ?auto_158054 ?auto_158057 ) ) ( not ( = ?auto_158054 ?auto_158058 ) ) ( not ( = ?auto_158055 ?auto_158056 ) ) ( not ( = ?auto_158055 ?auto_158057 ) ) ( not ( = ?auto_158055 ?auto_158058 ) ) ( not ( = ?auto_158056 ?auto_158057 ) ) ( not ( = ?auto_158056 ?auto_158058 ) ) ( not ( = ?auto_158057 ?auto_158058 ) ) ( ON-TABLE ?auto_158058 ) ( ON ?auto_158057 ?auto_158058 ) ( ON ?auto_158056 ?auto_158057 ) ( ON ?auto_158055 ?auto_158056 ) ( ON ?auto_158051 ?auto_158059 ) ( not ( = ?auto_158051 ?auto_158059 ) ) ( not ( = ?auto_158052 ?auto_158059 ) ) ( not ( = ?auto_158053 ?auto_158059 ) ) ( not ( = ?auto_158054 ?auto_158059 ) ) ( not ( = ?auto_158055 ?auto_158059 ) ) ( not ( = ?auto_158056 ?auto_158059 ) ) ( not ( = ?auto_158057 ?auto_158059 ) ) ( not ( = ?auto_158058 ?auto_158059 ) ) ( ON ?auto_158052 ?auto_158051 ) ( ON-TABLE ?auto_158059 ) ( ON ?auto_158053 ?auto_158052 ) ( CLEAR ?auto_158053 ) ( HOLDING ?auto_158054 ) ( CLEAR ?auto_158055 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_158058 ?auto_158057 ?auto_158056 ?auto_158055 ?auto_158054 )
      ( MAKE-8PILE ?auto_158051 ?auto_158052 ?auto_158053 ?auto_158054 ?auto_158055 ?auto_158056 ?auto_158057 ?auto_158058 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_158060 - BLOCK
      ?auto_158061 - BLOCK
      ?auto_158062 - BLOCK
      ?auto_158063 - BLOCK
      ?auto_158064 - BLOCK
      ?auto_158065 - BLOCK
      ?auto_158066 - BLOCK
      ?auto_158067 - BLOCK
    )
    :vars
    (
      ?auto_158068 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_158060 ?auto_158061 ) ) ( not ( = ?auto_158060 ?auto_158062 ) ) ( not ( = ?auto_158060 ?auto_158063 ) ) ( not ( = ?auto_158060 ?auto_158064 ) ) ( not ( = ?auto_158060 ?auto_158065 ) ) ( not ( = ?auto_158060 ?auto_158066 ) ) ( not ( = ?auto_158060 ?auto_158067 ) ) ( not ( = ?auto_158061 ?auto_158062 ) ) ( not ( = ?auto_158061 ?auto_158063 ) ) ( not ( = ?auto_158061 ?auto_158064 ) ) ( not ( = ?auto_158061 ?auto_158065 ) ) ( not ( = ?auto_158061 ?auto_158066 ) ) ( not ( = ?auto_158061 ?auto_158067 ) ) ( not ( = ?auto_158062 ?auto_158063 ) ) ( not ( = ?auto_158062 ?auto_158064 ) ) ( not ( = ?auto_158062 ?auto_158065 ) ) ( not ( = ?auto_158062 ?auto_158066 ) ) ( not ( = ?auto_158062 ?auto_158067 ) ) ( not ( = ?auto_158063 ?auto_158064 ) ) ( not ( = ?auto_158063 ?auto_158065 ) ) ( not ( = ?auto_158063 ?auto_158066 ) ) ( not ( = ?auto_158063 ?auto_158067 ) ) ( not ( = ?auto_158064 ?auto_158065 ) ) ( not ( = ?auto_158064 ?auto_158066 ) ) ( not ( = ?auto_158064 ?auto_158067 ) ) ( not ( = ?auto_158065 ?auto_158066 ) ) ( not ( = ?auto_158065 ?auto_158067 ) ) ( not ( = ?auto_158066 ?auto_158067 ) ) ( ON-TABLE ?auto_158067 ) ( ON ?auto_158066 ?auto_158067 ) ( ON ?auto_158065 ?auto_158066 ) ( ON ?auto_158064 ?auto_158065 ) ( ON ?auto_158060 ?auto_158068 ) ( not ( = ?auto_158060 ?auto_158068 ) ) ( not ( = ?auto_158061 ?auto_158068 ) ) ( not ( = ?auto_158062 ?auto_158068 ) ) ( not ( = ?auto_158063 ?auto_158068 ) ) ( not ( = ?auto_158064 ?auto_158068 ) ) ( not ( = ?auto_158065 ?auto_158068 ) ) ( not ( = ?auto_158066 ?auto_158068 ) ) ( not ( = ?auto_158067 ?auto_158068 ) ) ( ON ?auto_158061 ?auto_158060 ) ( ON-TABLE ?auto_158068 ) ( ON ?auto_158062 ?auto_158061 ) ( CLEAR ?auto_158064 ) ( ON ?auto_158063 ?auto_158062 ) ( CLEAR ?auto_158063 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_158068 ?auto_158060 ?auto_158061 ?auto_158062 )
      ( MAKE-8PILE ?auto_158060 ?auto_158061 ?auto_158062 ?auto_158063 ?auto_158064 ?auto_158065 ?auto_158066 ?auto_158067 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_158069 - BLOCK
      ?auto_158070 - BLOCK
      ?auto_158071 - BLOCK
      ?auto_158072 - BLOCK
      ?auto_158073 - BLOCK
      ?auto_158074 - BLOCK
      ?auto_158075 - BLOCK
      ?auto_158076 - BLOCK
    )
    :vars
    (
      ?auto_158077 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_158069 ?auto_158070 ) ) ( not ( = ?auto_158069 ?auto_158071 ) ) ( not ( = ?auto_158069 ?auto_158072 ) ) ( not ( = ?auto_158069 ?auto_158073 ) ) ( not ( = ?auto_158069 ?auto_158074 ) ) ( not ( = ?auto_158069 ?auto_158075 ) ) ( not ( = ?auto_158069 ?auto_158076 ) ) ( not ( = ?auto_158070 ?auto_158071 ) ) ( not ( = ?auto_158070 ?auto_158072 ) ) ( not ( = ?auto_158070 ?auto_158073 ) ) ( not ( = ?auto_158070 ?auto_158074 ) ) ( not ( = ?auto_158070 ?auto_158075 ) ) ( not ( = ?auto_158070 ?auto_158076 ) ) ( not ( = ?auto_158071 ?auto_158072 ) ) ( not ( = ?auto_158071 ?auto_158073 ) ) ( not ( = ?auto_158071 ?auto_158074 ) ) ( not ( = ?auto_158071 ?auto_158075 ) ) ( not ( = ?auto_158071 ?auto_158076 ) ) ( not ( = ?auto_158072 ?auto_158073 ) ) ( not ( = ?auto_158072 ?auto_158074 ) ) ( not ( = ?auto_158072 ?auto_158075 ) ) ( not ( = ?auto_158072 ?auto_158076 ) ) ( not ( = ?auto_158073 ?auto_158074 ) ) ( not ( = ?auto_158073 ?auto_158075 ) ) ( not ( = ?auto_158073 ?auto_158076 ) ) ( not ( = ?auto_158074 ?auto_158075 ) ) ( not ( = ?auto_158074 ?auto_158076 ) ) ( not ( = ?auto_158075 ?auto_158076 ) ) ( ON-TABLE ?auto_158076 ) ( ON ?auto_158075 ?auto_158076 ) ( ON ?auto_158074 ?auto_158075 ) ( ON ?auto_158069 ?auto_158077 ) ( not ( = ?auto_158069 ?auto_158077 ) ) ( not ( = ?auto_158070 ?auto_158077 ) ) ( not ( = ?auto_158071 ?auto_158077 ) ) ( not ( = ?auto_158072 ?auto_158077 ) ) ( not ( = ?auto_158073 ?auto_158077 ) ) ( not ( = ?auto_158074 ?auto_158077 ) ) ( not ( = ?auto_158075 ?auto_158077 ) ) ( not ( = ?auto_158076 ?auto_158077 ) ) ( ON ?auto_158070 ?auto_158069 ) ( ON-TABLE ?auto_158077 ) ( ON ?auto_158071 ?auto_158070 ) ( ON ?auto_158072 ?auto_158071 ) ( CLEAR ?auto_158072 ) ( HOLDING ?auto_158073 ) ( CLEAR ?auto_158074 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_158076 ?auto_158075 ?auto_158074 ?auto_158073 )
      ( MAKE-8PILE ?auto_158069 ?auto_158070 ?auto_158071 ?auto_158072 ?auto_158073 ?auto_158074 ?auto_158075 ?auto_158076 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_158078 - BLOCK
      ?auto_158079 - BLOCK
      ?auto_158080 - BLOCK
      ?auto_158081 - BLOCK
      ?auto_158082 - BLOCK
      ?auto_158083 - BLOCK
      ?auto_158084 - BLOCK
      ?auto_158085 - BLOCK
    )
    :vars
    (
      ?auto_158086 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_158078 ?auto_158079 ) ) ( not ( = ?auto_158078 ?auto_158080 ) ) ( not ( = ?auto_158078 ?auto_158081 ) ) ( not ( = ?auto_158078 ?auto_158082 ) ) ( not ( = ?auto_158078 ?auto_158083 ) ) ( not ( = ?auto_158078 ?auto_158084 ) ) ( not ( = ?auto_158078 ?auto_158085 ) ) ( not ( = ?auto_158079 ?auto_158080 ) ) ( not ( = ?auto_158079 ?auto_158081 ) ) ( not ( = ?auto_158079 ?auto_158082 ) ) ( not ( = ?auto_158079 ?auto_158083 ) ) ( not ( = ?auto_158079 ?auto_158084 ) ) ( not ( = ?auto_158079 ?auto_158085 ) ) ( not ( = ?auto_158080 ?auto_158081 ) ) ( not ( = ?auto_158080 ?auto_158082 ) ) ( not ( = ?auto_158080 ?auto_158083 ) ) ( not ( = ?auto_158080 ?auto_158084 ) ) ( not ( = ?auto_158080 ?auto_158085 ) ) ( not ( = ?auto_158081 ?auto_158082 ) ) ( not ( = ?auto_158081 ?auto_158083 ) ) ( not ( = ?auto_158081 ?auto_158084 ) ) ( not ( = ?auto_158081 ?auto_158085 ) ) ( not ( = ?auto_158082 ?auto_158083 ) ) ( not ( = ?auto_158082 ?auto_158084 ) ) ( not ( = ?auto_158082 ?auto_158085 ) ) ( not ( = ?auto_158083 ?auto_158084 ) ) ( not ( = ?auto_158083 ?auto_158085 ) ) ( not ( = ?auto_158084 ?auto_158085 ) ) ( ON-TABLE ?auto_158085 ) ( ON ?auto_158084 ?auto_158085 ) ( ON ?auto_158083 ?auto_158084 ) ( ON ?auto_158078 ?auto_158086 ) ( not ( = ?auto_158078 ?auto_158086 ) ) ( not ( = ?auto_158079 ?auto_158086 ) ) ( not ( = ?auto_158080 ?auto_158086 ) ) ( not ( = ?auto_158081 ?auto_158086 ) ) ( not ( = ?auto_158082 ?auto_158086 ) ) ( not ( = ?auto_158083 ?auto_158086 ) ) ( not ( = ?auto_158084 ?auto_158086 ) ) ( not ( = ?auto_158085 ?auto_158086 ) ) ( ON ?auto_158079 ?auto_158078 ) ( ON-TABLE ?auto_158086 ) ( ON ?auto_158080 ?auto_158079 ) ( ON ?auto_158081 ?auto_158080 ) ( CLEAR ?auto_158083 ) ( ON ?auto_158082 ?auto_158081 ) ( CLEAR ?auto_158082 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_158086 ?auto_158078 ?auto_158079 ?auto_158080 ?auto_158081 )
      ( MAKE-8PILE ?auto_158078 ?auto_158079 ?auto_158080 ?auto_158081 ?auto_158082 ?auto_158083 ?auto_158084 ?auto_158085 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_158087 - BLOCK
      ?auto_158088 - BLOCK
      ?auto_158089 - BLOCK
      ?auto_158090 - BLOCK
      ?auto_158091 - BLOCK
      ?auto_158092 - BLOCK
      ?auto_158093 - BLOCK
      ?auto_158094 - BLOCK
    )
    :vars
    (
      ?auto_158095 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_158087 ?auto_158088 ) ) ( not ( = ?auto_158087 ?auto_158089 ) ) ( not ( = ?auto_158087 ?auto_158090 ) ) ( not ( = ?auto_158087 ?auto_158091 ) ) ( not ( = ?auto_158087 ?auto_158092 ) ) ( not ( = ?auto_158087 ?auto_158093 ) ) ( not ( = ?auto_158087 ?auto_158094 ) ) ( not ( = ?auto_158088 ?auto_158089 ) ) ( not ( = ?auto_158088 ?auto_158090 ) ) ( not ( = ?auto_158088 ?auto_158091 ) ) ( not ( = ?auto_158088 ?auto_158092 ) ) ( not ( = ?auto_158088 ?auto_158093 ) ) ( not ( = ?auto_158088 ?auto_158094 ) ) ( not ( = ?auto_158089 ?auto_158090 ) ) ( not ( = ?auto_158089 ?auto_158091 ) ) ( not ( = ?auto_158089 ?auto_158092 ) ) ( not ( = ?auto_158089 ?auto_158093 ) ) ( not ( = ?auto_158089 ?auto_158094 ) ) ( not ( = ?auto_158090 ?auto_158091 ) ) ( not ( = ?auto_158090 ?auto_158092 ) ) ( not ( = ?auto_158090 ?auto_158093 ) ) ( not ( = ?auto_158090 ?auto_158094 ) ) ( not ( = ?auto_158091 ?auto_158092 ) ) ( not ( = ?auto_158091 ?auto_158093 ) ) ( not ( = ?auto_158091 ?auto_158094 ) ) ( not ( = ?auto_158092 ?auto_158093 ) ) ( not ( = ?auto_158092 ?auto_158094 ) ) ( not ( = ?auto_158093 ?auto_158094 ) ) ( ON-TABLE ?auto_158094 ) ( ON ?auto_158093 ?auto_158094 ) ( ON ?auto_158087 ?auto_158095 ) ( not ( = ?auto_158087 ?auto_158095 ) ) ( not ( = ?auto_158088 ?auto_158095 ) ) ( not ( = ?auto_158089 ?auto_158095 ) ) ( not ( = ?auto_158090 ?auto_158095 ) ) ( not ( = ?auto_158091 ?auto_158095 ) ) ( not ( = ?auto_158092 ?auto_158095 ) ) ( not ( = ?auto_158093 ?auto_158095 ) ) ( not ( = ?auto_158094 ?auto_158095 ) ) ( ON ?auto_158088 ?auto_158087 ) ( ON-TABLE ?auto_158095 ) ( ON ?auto_158089 ?auto_158088 ) ( ON ?auto_158090 ?auto_158089 ) ( ON ?auto_158091 ?auto_158090 ) ( CLEAR ?auto_158091 ) ( HOLDING ?auto_158092 ) ( CLEAR ?auto_158093 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_158094 ?auto_158093 ?auto_158092 )
      ( MAKE-8PILE ?auto_158087 ?auto_158088 ?auto_158089 ?auto_158090 ?auto_158091 ?auto_158092 ?auto_158093 ?auto_158094 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_158096 - BLOCK
      ?auto_158097 - BLOCK
      ?auto_158098 - BLOCK
      ?auto_158099 - BLOCK
      ?auto_158100 - BLOCK
      ?auto_158101 - BLOCK
      ?auto_158102 - BLOCK
      ?auto_158103 - BLOCK
    )
    :vars
    (
      ?auto_158104 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_158096 ?auto_158097 ) ) ( not ( = ?auto_158096 ?auto_158098 ) ) ( not ( = ?auto_158096 ?auto_158099 ) ) ( not ( = ?auto_158096 ?auto_158100 ) ) ( not ( = ?auto_158096 ?auto_158101 ) ) ( not ( = ?auto_158096 ?auto_158102 ) ) ( not ( = ?auto_158096 ?auto_158103 ) ) ( not ( = ?auto_158097 ?auto_158098 ) ) ( not ( = ?auto_158097 ?auto_158099 ) ) ( not ( = ?auto_158097 ?auto_158100 ) ) ( not ( = ?auto_158097 ?auto_158101 ) ) ( not ( = ?auto_158097 ?auto_158102 ) ) ( not ( = ?auto_158097 ?auto_158103 ) ) ( not ( = ?auto_158098 ?auto_158099 ) ) ( not ( = ?auto_158098 ?auto_158100 ) ) ( not ( = ?auto_158098 ?auto_158101 ) ) ( not ( = ?auto_158098 ?auto_158102 ) ) ( not ( = ?auto_158098 ?auto_158103 ) ) ( not ( = ?auto_158099 ?auto_158100 ) ) ( not ( = ?auto_158099 ?auto_158101 ) ) ( not ( = ?auto_158099 ?auto_158102 ) ) ( not ( = ?auto_158099 ?auto_158103 ) ) ( not ( = ?auto_158100 ?auto_158101 ) ) ( not ( = ?auto_158100 ?auto_158102 ) ) ( not ( = ?auto_158100 ?auto_158103 ) ) ( not ( = ?auto_158101 ?auto_158102 ) ) ( not ( = ?auto_158101 ?auto_158103 ) ) ( not ( = ?auto_158102 ?auto_158103 ) ) ( ON-TABLE ?auto_158103 ) ( ON ?auto_158102 ?auto_158103 ) ( ON ?auto_158096 ?auto_158104 ) ( not ( = ?auto_158096 ?auto_158104 ) ) ( not ( = ?auto_158097 ?auto_158104 ) ) ( not ( = ?auto_158098 ?auto_158104 ) ) ( not ( = ?auto_158099 ?auto_158104 ) ) ( not ( = ?auto_158100 ?auto_158104 ) ) ( not ( = ?auto_158101 ?auto_158104 ) ) ( not ( = ?auto_158102 ?auto_158104 ) ) ( not ( = ?auto_158103 ?auto_158104 ) ) ( ON ?auto_158097 ?auto_158096 ) ( ON-TABLE ?auto_158104 ) ( ON ?auto_158098 ?auto_158097 ) ( ON ?auto_158099 ?auto_158098 ) ( ON ?auto_158100 ?auto_158099 ) ( CLEAR ?auto_158102 ) ( ON ?auto_158101 ?auto_158100 ) ( CLEAR ?auto_158101 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_158104 ?auto_158096 ?auto_158097 ?auto_158098 ?auto_158099 ?auto_158100 )
      ( MAKE-8PILE ?auto_158096 ?auto_158097 ?auto_158098 ?auto_158099 ?auto_158100 ?auto_158101 ?auto_158102 ?auto_158103 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_158105 - BLOCK
      ?auto_158106 - BLOCK
      ?auto_158107 - BLOCK
      ?auto_158108 - BLOCK
      ?auto_158109 - BLOCK
      ?auto_158110 - BLOCK
      ?auto_158111 - BLOCK
      ?auto_158112 - BLOCK
    )
    :vars
    (
      ?auto_158113 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_158105 ?auto_158106 ) ) ( not ( = ?auto_158105 ?auto_158107 ) ) ( not ( = ?auto_158105 ?auto_158108 ) ) ( not ( = ?auto_158105 ?auto_158109 ) ) ( not ( = ?auto_158105 ?auto_158110 ) ) ( not ( = ?auto_158105 ?auto_158111 ) ) ( not ( = ?auto_158105 ?auto_158112 ) ) ( not ( = ?auto_158106 ?auto_158107 ) ) ( not ( = ?auto_158106 ?auto_158108 ) ) ( not ( = ?auto_158106 ?auto_158109 ) ) ( not ( = ?auto_158106 ?auto_158110 ) ) ( not ( = ?auto_158106 ?auto_158111 ) ) ( not ( = ?auto_158106 ?auto_158112 ) ) ( not ( = ?auto_158107 ?auto_158108 ) ) ( not ( = ?auto_158107 ?auto_158109 ) ) ( not ( = ?auto_158107 ?auto_158110 ) ) ( not ( = ?auto_158107 ?auto_158111 ) ) ( not ( = ?auto_158107 ?auto_158112 ) ) ( not ( = ?auto_158108 ?auto_158109 ) ) ( not ( = ?auto_158108 ?auto_158110 ) ) ( not ( = ?auto_158108 ?auto_158111 ) ) ( not ( = ?auto_158108 ?auto_158112 ) ) ( not ( = ?auto_158109 ?auto_158110 ) ) ( not ( = ?auto_158109 ?auto_158111 ) ) ( not ( = ?auto_158109 ?auto_158112 ) ) ( not ( = ?auto_158110 ?auto_158111 ) ) ( not ( = ?auto_158110 ?auto_158112 ) ) ( not ( = ?auto_158111 ?auto_158112 ) ) ( ON-TABLE ?auto_158112 ) ( ON ?auto_158105 ?auto_158113 ) ( not ( = ?auto_158105 ?auto_158113 ) ) ( not ( = ?auto_158106 ?auto_158113 ) ) ( not ( = ?auto_158107 ?auto_158113 ) ) ( not ( = ?auto_158108 ?auto_158113 ) ) ( not ( = ?auto_158109 ?auto_158113 ) ) ( not ( = ?auto_158110 ?auto_158113 ) ) ( not ( = ?auto_158111 ?auto_158113 ) ) ( not ( = ?auto_158112 ?auto_158113 ) ) ( ON ?auto_158106 ?auto_158105 ) ( ON-TABLE ?auto_158113 ) ( ON ?auto_158107 ?auto_158106 ) ( ON ?auto_158108 ?auto_158107 ) ( ON ?auto_158109 ?auto_158108 ) ( ON ?auto_158110 ?auto_158109 ) ( CLEAR ?auto_158110 ) ( HOLDING ?auto_158111 ) ( CLEAR ?auto_158112 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_158112 ?auto_158111 )
      ( MAKE-8PILE ?auto_158105 ?auto_158106 ?auto_158107 ?auto_158108 ?auto_158109 ?auto_158110 ?auto_158111 ?auto_158112 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_158114 - BLOCK
      ?auto_158115 - BLOCK
      ?auto_158116 - BLOCK
      ?auto_158117 - BLOCK
      ?auto_158118 - BLOCK
      ?auto_158119 - BLOCK
      ?auto_158120 - BLOCK
      ?auto_158121 - BLOCK
    )
    :vars
    (
      ?auto_158122 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_158114 ?auto_158115 ) ) ( not ( = ?auto_158114 ?auto_158116 ) ) ( not ( = ?auto_158114 ?auto_158117 ) ) ( not ( = ?auto_158114 ?auto_158118 ) ) ( not ( = ?auto_158114 ?auto_158119 ) ) ( not ( = ?auto_158114 ?auto_158120 ) ) ( not ( = ?auto_158114 ?auto_158121 ) ) ( not ( = ?auto_158115 ?auto_158116 ) ) ( not ( = ?auto_158115 ?auto_158117 ) ) ( not ( = ?auto_158115 ?auto_158118 ) ) ( not ( = ?auto_158115 ?auto_158119 ) ) ( not ( = ?auto_158115 ?auto_158120 ) ) ( not ( = ?auto_158115 ?auto_158121 ) ) ( not ( = ?auto_158116 ?auto_158117 ) ) ( not ( = ?auto_158116 ?auto_158118 ) ) ( not ( = ?auto_158116 ?auto_158119 ) ) ( not ( = ?auto_158116 ?auto_158120 ) ) ( not ( = ?auto_158116 ?auto_158121 ) ) ( not ( = ?auto_158117 ?auto_158118 ) ) ( not ( = ?auto_158117 ?auto_158119 ) ) ( not ( = ?auto_158117 ?auto_158120 ) ) ( not ( = ?auto_158117 ?auto_158121 ) ) ( not ( = ?auto_158118 ?auto_158119 ) ) ( not ( = ?auto_158118 ?auto_158120 ) ) ( not ( = ?auto_158118 ?auto_158121 ) ) ( not ( = ?auto_158119 ?auto_158120 ) ) ( not ( = ?auto_158119 ?auto_158121 ) ) ( not ( = ?auto_158120 ?auto_158121 ) ) ( ON-TABLE ?auto_158121 ) ( ON ?auto_158114 ?auto_158122 ) ( not ( = ?auto_158114 ?auto_158122 ) ) ( not ( = ?auto_158115 ?auto_158122 ) ) ( not ( = ?auto_158116 ?auto_158122 ) ) ( not ( = ?auto_158117 ?auto_158122 ) ) ( not ( = ?auto_158118 ?auto_158122 ) ) ( not ( = ?auto_158119 ?auto_158122 ) ) ( not ( = ?auto_158120 ?auto_158122 ) ) ( not ( = ?auto_158121 ?auto_158122 ) ) ( ON ?auto_158115 ?auto_158114 ) ( ON-TABLE ?auto_158122 ) ( ON ?auto_158116 ?auto_158115 ) ( ON ?auto_158117 ?auto_158116 ) ( ON ?auto_158118 ?auto_158117 ) ( ON ?auto_158119 ?auto_158118 ) ( CLEAR ?auto_158121 ) ( ON ?auto_158120 ?auto_158119 ) ( CLEAR ?auto_158120 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_158122 ?auto_158114 ?auto_158115 ?auto_158116 ?auto_158117 ?auto_158118 ?auto_158119 )
      ( MAKE-8PILE ?auto_158114 ?auto_158115 ?auto_158116 ?auto_158117 ?auto_158118 ?auto_158119 ?auto_158120 ?auto_158121 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_158123 - BLOCK
      ?auto_158124 - BLOCK
      ?auto_158125 - BLOCK
      ?auto_158126 - BLOCK
      ?auto_158127 - BLOCK
      ?auto_158128 - BLOCK
      ?auto_158129 - BLOCK
      ?auto_158130 - BLOCK
    )
    :vars
    (
      ?auto_158131 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_158123 ?auto_158124 ) ) ( not ( = ?auto_158123 ?auto_158125 ) ) ( not ( = ?auto_158123 ?auto_158126 ) ) ( not ( = ?auto_158123 ?auto_158127 ) ) ( not ( = ?auto_158123 ?auto_158128 ) ) ( not ( = ?auto_158123 ?auto_158129 ) ) ( not ( = ?auto_158123 ?auto_158130 ) ) ( not ( = ?auto_158124 ?auto_158125 ) ) ( not ( = ?auto_158124 ?auto_158126 ) ) ( not ( = ?auto_158124 ?auto_158127 ) ) ( not ( = ?auto_158124 ?auto_158128 ) ) ( not ( = ?auto_158124 ?auto_158129 ) ) ( not ( = ?auto_158124 ?auto_158130 ) ) ( not ( = ?auto_158125 ?auto_158126 ) ) ( not ( = ?auto_158125 ?auto_158127 ) ) ( not ( = ?auto_158125 ?auto_158128 ) ) ( not ( = ?auto_158125 ?auto_158129 ) ) ( not ( = ?auto_158125 ?auto_158130 ) ) ( not ( = ?auto_158126 ?auto_158127 ) ) ( not ( = ?auto_158126 ?auto_158128 ) ) ( not ( = ?auto_158126 ?auto_158129 ) ) ( not ( = ?auto_158126 ?auto_158130 ) ) ( not ( = ?auto_158127 ?auto_158128 ) ) ( not ( = ?auto_158127 ?auto_158129 ) ) ( not ( = ?auto_158127 ?auto_158130 ) ) ( not ( = ?auto_158128 ?auto_158129 ) ) ( not ( = ?auto_158128 ?auto_158130 ) ) ( not ( = ?auto_158129 ?auto_158130 ) ) ( ON ?auto_158123 ?auto_158131 ) ( not ( = ?auto_158123 ?auto_158131 ) ) ( not ( = ?auto_158124 ?auto_158131 ) ) ( not ( = ?auto_158125 ?auto_158131 ) ) ( not ( = ?auto_158126 ?auto_158131 ) ) ( not ( = ?auto_158127 ?auto_158131 ) ) ( not ( = ?auto_158128 ?auto_158131 ) ) ( not ( = ?auto_158129 ?auto_158131 ) ) ( not ( = ?auto_158130 ?auto_158131 ) ) ( ON ?auto_158124 ?auto_158123 ) ( ON-TABLE ?auto_158131 ) ( ON ?auto_158125 ?auto_158124 ) ( ON ?auto_158126 ?auto_158125 ) ( ON ?auto_158127 ?auto_158126 ) ( ON ?auto_158128 ?auto_158127 ) ( ON ?auto_158129 ?auto_158128 ) ( CLEAR ?auto_158129 ) ( HOLDING ?auto_158130 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_158130 )
      ( MAKE-8PILE ?auto_158123 ?auto_158124 ?auto_158125 ?auto_158126 ?auto_158127 ?auto_158128 ?auto_158129 ?auto_158130 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_158132 - BLOCK
      ?auto_158133 - BLOCK
      ?auto_158134 - BLOCK
      ?auto_158135 - BLOCK
      ?auto_158136 - BLOCK
      ?auto_158137 - BLOCK
      ?auto_158138 - BLOCK
      ?auto_158139 - BLOCK
    )
    :vars
    (
      ?auto_158140 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_158132 ?auto_158133 ) ) ( not ( = ?auto_158132 ?auto_158134 ) ) ( not ( = ?auto_158132 ?auto_158135 ) ) ( not ( = ?auto_158132 ?auto_158136 ) ) ( not ( = ?auto_158132 ?auto_158137 ) ) ( not ( = ?auto_158132 ?auto_158138 ) ) ( not ( = ?auto_158132 ?auto_158139 ) ) ( not ( = ?auto_158133 ?auto_158134 ) ) ( not ( = ?auto_158133 ?auto_158135 ) ) ( not ( = ?auto_158133 ?auto_158136 ) ) ( not ( = ?auto_158133 ?auto_158137 ) ) ( not ( = ?auto_158133 ?auto_158138 ) ) ( not ( = ?auto_158133 ?auto_158139 ) ) ( not ( = ?auto_158134 ?auto_158135 ) ) ( not ( = ?auto_158134 ?auto_158136 ) ) ( not ( = ?auto_158134 ?auto_158137 ) ) ( not ( = ?auto_158134 ?auto_158138 ) ) ( not ( = ?auto_158134 ?auto_158139 ) ) ( not ( = ?auto_158135 ?auto_158136 ) ) ( not ( = ?auto_158135 ?auto_158137 ) ) ( not ( = ?auto_158135 ?auto_158138 ) ) ( not ( = ?auto_158135 ?auto_158139 ) ) ( not ( = ?auto_158136 ?auto_158137 ) ) ( not ( = ?auto_158136 ?auto_158138 ) ) ( not ( = ?auto_158136 ?auto_158139 ) ) ( not ( = ?auto_158137 ?auto_158138 ) ) ( not ( = ?auto_158137 ?auto_158139 ) ) ( not ( = ?auto_158138 ?auto_158139 ) ) ( ON ?auto_158132 ?auto_158140 ) ( not ( = ?auto_158132 ?auto_158140 ) ) ( not ( = ?auto_158133 ?auto_158140 ) ) ( not ( = ?auto_158134 ?auto_158140 ) ) ( not ( = ?auto_158135 ?auto_158140 ) ) ( not ( = ?auto_158136 ?auto_158140 ) ) ( not ( = ?auto_158137 ?auto_158140 ) ) ( not ( = ?auto_158138 ?auto_158140 ) ) ( not ( = ?auto_158139 ?auto_158140 ) ) ( ON ?auto_158133 ?auto_158132 ) ( ON-TABLE ?auto_158140 ) ( ON ?auto_158134 ?auto_158133 ) ( ON ?auto_158135 ?auto_158134 ) ( ON ?auto_158136 ?auto_158135 ) ( ON ?auto_158137 ?auto_158136 ) ( ON ?auto_158138 ?auto_158137 ) ( ON ?auto_158139 ?auto_158138 ) ( CLEAR ?auto_158139 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_158140 ?auto_158132 ?auto_158133 ?auto_158134 ?auto_158135 ?auto_158136 ?auto_158137 ?auto_158138 )
      ( MAKE-8PILE ?auto_158132 ?auto_158133 ?auto_158134 ?auto_158135 ?auto_158136 ?auto_158137 ?auto_158138 ?auto_158139 ) )
  )

)

