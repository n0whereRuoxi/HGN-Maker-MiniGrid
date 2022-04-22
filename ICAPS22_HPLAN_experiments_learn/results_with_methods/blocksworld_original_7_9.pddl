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

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_101433 - BLOCK
      ?auto_101434 - BLOCK
      ?auto_101435 - BLOCK
      ?auto_101436 - BLOCK
      ?auto_101437 - BLOCK
      ?auto_101438 - BLOCK
      ?auto_101439 - BLOCK
    )
    :vars
    (
      ?auto_101440 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_101440 ?auto_101439 ) ( CLEAR ?auto_101440 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_101433 ) ( ON ?auto_101434 ?auto_101433 ) ( ON ?auto_101435 ?auto_101434 ) ( ON ?auto_101436 ?auto_101435 ) ( ON ?auto_101437 ?auto_101436 ) ( ON ?auto_101438 ?auto_101437 ) ( ON ?auto_101439 ?auto_101438 ) ( not ( = ?auto_101433 ?auto_101434 ) ) ( not ( = ?auto_101433 ?auto_101435 ) ) ( not ( = ?auto_101433 ?auto_101436 ) ) ( not ( = ?auto_101433 ?auto_101437 ) ) ( not ( = ?auto_101433 ?auto_101438 ) ) ( not ( = ?auto_101433 ?auto_101439 ) ) ( not ( = ?auto_101433 ?auto_101440 ) ) ( not ( = ?auto_101434 ?auto_101435 ) ) ( not ( = ?auto_101434 ?auto_101436 ) ) ( not ( = ?auto_101434 ?auto_101437 ) ) ( not ( = ?auto_101434 ?auto_101438 ) ) ( not ( = ?auto_101434 ?auto_101439 ) ) ( not ( = ?auto_101434 ?auto_101440 ) ) ( not ( = ?auto_101435 ?auto_101436 ) ) ( not ( = ?auto_101435 ?auto_101437 ) ) ( not ( = ?auto_101435 ?auto_101438 ) ) ( not ( = ?auto_101435 ?auto_101439 ) ) ( not ( = ?auto_101435 ?auto_101440 ) ) ( not ( = ?auto_101436 ?auto_101437 ) ) ( not ( = ?auto_101436 ?auto_101438 ) ) ( not ( = ?auto_101436 ?auto_101439 ) ) ( not ( = ?auto_101436 ?auto_101440 ) ) ( not ( = ?auto_101437 ?auto_101438 ) ) ( not ( = ?auto_101437 ?auto_101439 ) ) ( not ( = ?auto_101437 ?auto_101440 ) ) ( not ( = ?auto_101438 ?auto_101439 ) ) ( not ( = ?auto_101438 ?auto_101440 ) ) ( not ( = ?auto_101439 ?auto_101440 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_101440 ?auto_101439 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_101442 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_101442 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_101442 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_101443 - BLOCK
    )
    :vars
    (
      ?auto_101444 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_101443 ?auto_101444 ) ( CLEAR ?auto_101443 ) ( HAND-EMPTY ) ( not ( = ?auto_101443 ?auto_101444 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_101443 ?auto_101444 )
      ( MAKE-1PILE ?auto_101443 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_101451 - BLOCK
      ?auto_101452 - BLOCK
      ?auto_101453 - BLOCK
      ?auto_101454 - BLOCK
      ?auto_101455 - BLOCK
      ?auto_101456 - BLOCK
    )
    :vars
    (
      ?auto_101457 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_101457 ?auto_101456 ) ( CLEAR ?auto_101457 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_101451 ) ( ON ?auto_101452 ?auto_101451 ) ( ON ?auto_101453 ?auto_101452 ) ( ON ?auto_101454 ?auto_101453 ) ( ON ?auto_101455 ?auto_101454 ) ( ON ?auto_101456 ?auto_101455 ) ( not ( = ?auto_101451 ?auto_101452 ) ) ( not ( = ?auto_101451 ?auto_101453 ) ) ( not ( = ?auto_101451 ?auto_101454 ) ) ( not ( = ?auto_101451 ?auto_101455 ) ) ( not ( = ?auto_101451 ?auto_101456 ) ) ( not ( = ?auto_101451 ?auto_101457 ) ) ( not ( = ?auto_101452 ?auto_101453 ) ) ( not ( = ?auto_101452 ?auto_101454 ) ) ( not ( = ?auto_101452 ?auto_101455 ) ) ( not ( = ?auto_101452 ?auto_101456 ) ) ( not ( = ?auto_101452 ?auto_101457 ) ) ( not ( = ?auto_101453 ?auto_101454 ) ) ( not ( = ?auto_101453 ?auto_101455 ) ) ( not ( = ?auto_101453 ?auto_101456 ) ) ( not ( = ?auto_101453 ?auto_101457 ) ) ( not ( = ?auto_101454 ?auto_101455 ) ) ( not ( = ?auto_101454 ?auto_101456 ) ) ( not ( = ?auto_101454 ?auto_101457 ) ) ( not ( = ?auto_101455 ?auto_101456 ) ) ( not ( = ?auto_101455 ?auto_101457 ) ) ( not ( = ?auto_101456 ?auto_101457 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_101457 ?auto_101456 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_101458 - BLOCK
      ?auto_101459 - BLOCK
      ?auto_101460 - BLOCK
      ?auto_101461 - BLOCK
      ?auto_101462 - BLOCK
      ?auto_101463 - BLOCK
    )
    :vars
    (
      ?auto_101464 - BLOCK
      ?auto_101465 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_101464 ?auto_101463 ) ( CLEAR ?auto_101464 ) ( ON-TABLE ?auto_101458 ) ( ON ?auto_101459 ?auto_101458 ) ( ON ?auto_101460 ?auto_101459 ) ( ON ?auto_101461 ?auto_101460 ) ( ON ?auto_101462 ?auto_101461 ) ( ON ?auto_101463 ?auto_101462 ) ( not ( = ?auto_101458 ?auto_101459 ) ) ( not ( = ?auto_101458 ?auto_101460 ) ) ( not ( = ?auto_101458 ?auto_101461 ) ) ( not ( = ?auto_101458 ?auto_101462 ) ) ( not ( = ?auto_101458 ?auto_101463 ) ) ( not ( = ?auto_101458 ?auto_101464 ) ) ( not ( = ?auto_101459 ?auto_101460 ) ) ( not ( = ?auto_101459 ?auto_101461 ) ) ( not ( = ?auto_101459 ?auto_101462 ) ) ( not ( = ?auto_101459 ?auto_101463 ) ) ( not ( = ?auto_101459 ?auto_101464 ) ) ( not ( = ?auto_101460 ?auto_101461 ) ) ( not ( = ?auto_101460 ?auto_101462 ) ) ( not ( = ?auto_101460 ?auto_101463 ) ) ( not ( = ?auto_101460 ?auto_101464 ) ) ( not ( = ?auto_101461 ?auto_101462 ) ) ( not ( = ?auto_101461 ?auto_101463 ) ) ( not ( = ?auto_101461 ?auto_101464 ) ) ( not ( = ?auto_101462 ?auto_101463 ) ) ( not ( = ?auto_101462 ?auto_101464 ) ) ( not ( = ?auto_101463 ?auto_101464 ) ) ( HOLDING ?auto_101465 ) ( not ( = ?auto_101458 ?auto_101465 ) ) ( not ( = ?auto_101459 ?auto_101465 ) ) ( not ( = ?auto_101460 ?auto_101465 ) ) ( not ( = ?auto_101461 ?auto_101465 ) ) ( not ( = ?auto_101462 ?auto_101465 ) ) ( not ( = ?auto_101463 ?auto_101465 ) ) ( not ( = ?auto_101464 ?auto_101465 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_101465 )
      ( MAKE-6PILE ?auto_101458 ?auto_101459 ?auto_101460 ?auto_101461 ?auto_101462 ?auto_101463 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_101466 - BLOCK
      ?auto_101467 - BLOCK
      ?auto_101468 - BLOCK
      ?auto_101469 - BLOCK
      ?auto_101470 - BLOCK
      ?auto_101471 - BLOCK
    )
    :vars
    (
      ?auto_101472 - BLOCK
      ?auto_101473 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_101472 ?auto_101471 ) ( ON-TABLE ?auto_101466 ) ( ON ?auto_101467 ?auto_101466 ) ( ON ?auto_101468 ?auto_101467 ) ( ON ?auto_101469 ?auto_101468 ) ( ON ?auto_101470 ?auto_101469 ) ( ON ?auto_101471 ?auto_101470 ) ( not ( = ?auto_101466 ?auto_101467 ) ) ( not ( = ?auto_101466 ?auto_101468 ) ) ( not ( = ?auto_101466 ?auto_101469 ) ) ( not ( = ?auto_101466 ?auto_101470 ) ) ( not ( = ?auto_101466 ?auto_101471 ) ) ( not ( = ?auto_101466 ?auto_101472 ) ) ( not ( = ?auto_101467 ?auto_101468 ) ) ( not ( = ?auto_101467 ?auto_101469 ) ) ( not ( = ?auto_101467 ?auto_101470 ) ) ( not ( = ?auto_101467 ?auto_101471 ) ) ( not ( = ?auto_101467 ?auto_101472 ) ) ( not ( = ?auto_101468 ?auto_101469 ) ) ( not ( = ?auto_101468 ?auto_101470 ) ) ( not ( = ?auto_101468 ?auto_101471 ) ) ( not ( = ?auto_101468 ?auto_101472 ) ) ( not ( = ?auto_101469 ?auto_101470 ) ) ( not ( = ?auto_101469 ?auto_101471 ) ) ( not ( = ?auto_101469 ?auto_101472 ) ) ( not ( = ?auto_101470 ?auto_101471 ) ) ( not ( = ?auto_101470 ?auto_101472 ) ) ( not ( = ?auto_101471 ?auto_101472 ) ) ( not ( = ?auto_101466 ?auto_101473 ) ) ( not ( = ?auto_101467 ?auto_101473 ) ) ( not ( = ?auto_101468 ?auto_101473 ) ) ( not ( = ?auto_101469 ?auto_101473 ) ) ( not ( = ?auto_101470 ?auto_101473 ) ) ( not ( = ?auto_101471 ?auto_101473 ) ) ( not ( = ?auto_101472 ?auto_101473 ) ) ( ON ?auto_101473 ?auto_101472 ) ( CLEAR ?auto_101473 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_101466 ?auto_101467 ?auto_101468 ?auto_101469 ?auto_101470 ?auto_101471 ?auto_101472 )
      ( MAKE-6PILE ?auto_101466 ?auto_101467 ?auto_101468 ?auto_101469 ?auto_101470 ?auto_101471 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_101476 - BLOCK
      ?auto_101477 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_101477 ) ( CLEAR ?auto_101476 ) ( ON-TABLE ?auto_101476 ) ( not ( = ?auto_101476 ?auto_101477 ) ) )
    :subtasks
    ( ( !STACK ?auto_101477 ?auto_101476 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_101478 - BLOCK
      ?auto_101479 - BLOCK
    )
    :vars
    (
      ?auto_101480 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_101478 ) ( ON-TABLE ?auto_101478 ) ( not ( = ?auto_101478 ?auto_101479 ) ) ( ON ?auto_101479 ?auto_101480 ) ( CLEAR ?auto_101479 ) ( HAND-EMPTY ) ( not ( = ?auto_101478 ?auto_101480 ) ) ( not ( = ?auto_101479 ?auto_101480 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_101479 ?auto_101480 )
      ( MAKE-2PILE ?auto_101478 ?auto_101479 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_101481 - BLOCK
      ?auto_101482 - BLOCK
    )
    :vars
    (
      ?auto_101483 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_101481 ?auto_101482 ) ) ( ON ?auto_101482 ?auto_101483 ) ( CLEAR ?auto_101482 ) ( not ( = ?auto_101481 ?auto_101483 ) ) ( not ( = ?auto_101482 ?auto_101483 ) ) ( HOLDING ?auto_101481 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_101481 )
      ( MAKE-2PILE ?auto_101481 ?auto_101482 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_101484 - BLOCK
      ?auto_101485 - BLOCK
    )
    :vars
    (
      ?auto_101486 - BLOCK
      ?auto_101488 - BLOCK
      ?auto_101491 - BLOCK
      ?auto_101490 - BLOCK
      ?auto_101489 - BLOCK
      ?auto_101487 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_101484 ?auto_101485 ) ) ( ON ?auto_101485 ?auto_101486 ) ( not ( = ?auto_101484 ?auto_101486 ) ) ( not ( = ?auto_101485 ?auto_101486 ) ) ( ON ?auto_101484 ?auto_101485 ) ( CLEAR ?auto_101484 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_101488 ) ( ON ?auto_101491 ?auto_101488 ) ( ON ?auto_101490 ?auto_101491 ) ( ON ?auto_101489 ?auto_101490 ) ( ON ?auto_101487 ?auto_101489 ) ( ON ?auto_101486 ?auto_101487 ) ( not ( = ?auto_101488 ?auto_101491 ) ) ( not ( = ?auto_101488 ?auto_101490 ) ) ( not ( = ?auto_101488 ?auto_101489 ) ) ( not ( = ?auto_101488 ?auto_101487 ) ) ( not ( = ?auto_101488 ?auto_101486 ) ) ( not ( = ?auto_101488 ?auto_101485 ) ) ( not ( = ?auto_101488 ?auto_101484 ) ) ( not ( = ?auto_101491 ?auto_101490 ) ) ( not ( = ?auto_101491 ?auto_101489 ) ) ( not ( = ?auto_101491 ?auto_101487 ) ) ( not ( = ?auto_101491 ?auto_101486 ) ) ( not ( = ?auto_101491 ?auto_101485 ) ) ( not ( = ?auto_101491 ?auto_101484 ) ) ( not ( = ?auto_101490 ?auto_101489 ) ) ( not ( = ?auto_101490 ?auto_101487 ) ) ( not ( = ?auto_101490 ?auto_101486 ) ) ( not ( = ?auto_101490 ?auto_101485 ) ) ( not ( = ?auto_101490 ?auto_101484 ) ) ( not ( = ?auto_101489 ?auto_101487 ) ) ( not ( = ?auto_101489 ?auto_101486 ) ) ( not ( = ?auto_101489 ?auto_101485 ) ) ( not ( = ?auto_101489 ?auto_101484 ) ) ( not ( = ?auto_101487 ?auto_101486 ) ) ( not ( = ?auto_101487 ?auto_101485 ) ) ( not ( = ?auto_101487 ?auto_101484 ) ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_101488 ?auto_101491 ?auto_101490 ?auto_101489 ?auto_101487 ?auto_101486 ?auto_101485 )
      ( MAKE-2PILE ?auto_101484 ?auto_101485 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_101497 - BLOCK
      ?auto_101498 - BLOCK
      ?auto_101499 - BLOCK
      ?auto_101500 - BLOCK
      ?auto_101501 - BLOCK
    )
    :vars
    (
      ?auto_101502 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_101502 ?auto_101501 ) ( CLEAR ?auto_101502 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_101497 ) ( ON ?auto_101498 ?auto_101497 ) ( ON ?auto_101499 ?auto_101498 ) ( ON ?auto_101500 ?auto_101499 ) ( ON ?auto_101501 ?auto_101500 ) ( not ( = ?auto_101497 ?auto_101498 ) ) ( not ( = ?auto_101497 ?auto_101499 ) ) ( not ( = ?auto_101497 ?auto_101500 ) ) ( not ( = ?auto_101497 ?auto_101501 ) ) ( not ( = ?auto_101497 ?auto_101502 ) ) ( not ( = ?auto_101498 ?auto_101499 ) ) ( not ( = ?auto_101498 ?auto_101500 ) ) ( not ( = ?auto_101498 ?auto_101501 ) ) ( not ( = ?auto_101498 ?auto_101502 ) ) ( not ( = ?auto_101499 ?auto_101500 ) ) ( not ( = ?auto_101499 ?auto_101501 ) ) ( not ( = ?auto_101499 ?auto_101502 ) ) ( not ( = ?auto_101500 ?auto_101501 ) ) ( not ( = ?auto_101500 ?auto_101502 ) ) ( not ( = ?auto_101501 ?auto_101502 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_101502 ?auto_101501 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_101503 - BLOCK
      ?auto_101504 - BLOCK
      ?auto_101505 - BLOCK
      ?auto_101506 - BLOCK
      ?auto_101507 - BLOCK
    )
    :vars
    (
      ?auto_101508 - BLOCK
      ?auto_101509 - BLOCK
      ?auto_101510 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_101508 ?auto_101507 ) ( CLEAR ?auto_101508 ) ( ON-TABLE ?auto_101503 ) ( ON ?auto_101504 ?auto_101503 ) ( ON ?auto_101505 ?auto_101504 ) ( ON ?auto_101506 ?auto_101505 ) ( ON ?auto_101507 ?auto_101506 ) ( not ( = ?auto_101503 ?auto_101504 ) ) ( not ( = ?auto_101503 ?auto_101505 ) ) ( not ( = ?auto_101503 ?auto_101506 ) ) ( not ( = ?auto_101503 ?auto_101507 ) ) ( not ( = ?auto_101503 ?auto_101508 ) ) ( not ( = ?auto_101504 ?auto_101505 ) ) ( not ( = ?auto_101504 ?auto_101506 ) ) ( not ( = ?auto_101504 ?auto_101507 ) ) ( not ( = ?auto_101504 ?auto_101508 ) ) ( not ( = ?auto_101505 ?auto_101506 ) ) ( not ( = ?auto_101505 ?auto_101507 ) ) ( not ( = ?auto_101505 ?auto_101508 ) ) ( not ( = ?auto_101506 ?auto_101507 ) ) ( not ( = ?auto_101506 ?auto_101508 ) ) ( not ( = ?auto_101507 ?auto_101508 ) ) ( HOLDING ?auto_101509 ) ( CLEAR ?auto_101510 ) ( not ( = ?auto_101503 ?auto_101509 ) ) ( not ( = ?auto_101503 ?auto_101510 ) ) ( not ( = ?auto_101504 ?auto_101509 ) ) ( not ( = ?auto_101504 ?auto_101510 ) ) ( not ( = ?auto_101505 ?auto_101509 ) ) ( not ( = ?auto_101505 ?auto_101510 ) ) ( not ( = ?auto_101506 ?auto_101509 ) ) ( not ( = ?auto_101506 ?auto_101510 ) ) ( not ( = ?auto_101507 ?auto_101509 ) ) ( not ( = ?auto_101507 ?auto_101510 ) ) ( not ( = ?auto_101508 ?auto_101509 ) ) ( not ( = ?auto_101508 ?auto_101510 ) ) ( not ( = ?auto_101509 ?auto_101510 ) ) )
    :subtasks
    ( ( !STACK ?auto_101509 ?auto_101510 )
      ( MAKE-5PILE ?auto_101503 ?auto_101504 ?auto_101505 ?auto_101506 ?auto_101507 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_101511 - BLOCK
      ?auto_101512 - BLOCK
      ?auto_101513 - BLOCK
      ?auto_101514 - BLOCK
      ?auto_101515 - BLOCK
    )
    :vars
    (
      ?auto_101518 - BLOCK
      ?auto_101516 - BLOCK
      ?auto_101517 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_101518 ?auto_101515 ) ( ON-TABLE ?auto_101511 ) ( ON ?auto_101512 ?auto_101511 ) ( ON ?auto_101513 ?auto_101512 ) ( ON ?auto_101514 ?auto_101513 ) ( ON ?auto_101515 ?auto_101514 ) ( not ( = ?auto_101511 ?auto_101512 ) ) ( not ( = ?auto_101511 ?auto_101513 ) ) ( not ( = ?auto_101511 ?auto_101514 ) ) ( not ( = ?auto_101511 ?auto_101515 ) ) ( not ( = ?auto_101511 ?auto_101518 ) ) ( not ( = ?auto_101512 ?auto_101513 ) ) ( not ( = ?auto_101512 ?auto_101514 ) ) ( not ( = ?auto_101512 ?auto_101515 ) ) ( not ( = ?auto_101512 ?auto_101518 ) ) ( not ( = ?auto_101513 ?auto_101514 ) ) ( not ( = ?auto_101513 ?auto_101515 ) ) ( not ( = ?auto_101513 ?auto_101518 ) ) ( not ( = ?auto_101514 ?auto_101515 ) ) ( not ( = ?auto_101514 ?auto_101518 ) ) ( not ( = ?auto_101515 ?auto_101518 ) ) ( CLEAR ?auto_101516 ) ( not ( = ?auto_101511 ?auto_101517 ) ) ( not ( = ?auto_101511 ?auto_101516 ) ) ( not ( = ?auto_101512 ?auto_101517 ) ) ( not ( = ?auto_101512 ?auto_101516 ) ) ( not ( = ?auto_101513 ?auto_101517 ) ) ( not ( = ?auto_101513 ?auto_101516 ) ) ( not ( = ?auto_101514 ?auto_101517 ) ) ( not ( = ?auto_101514 ?auto_101516 ) ) ( not ( = ?auto_101515 ?auto_101517 ) ) ( not ( = ?auto_101515 ?auto_101516 ) ) ( not ( = ?auto_101518 ?auto_101517 ) ) ( not ( = ?auto_101518 ?auto_101516 ) ) ( not ( = ?auto_101517 ?auto_101516 ) ) ( ON ?auto_101517 ?auto_101518 ) ( CLEAR ?auto_101517 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_101511 ?auto_101512 ?auto_101513 ?auto_101514 ?auto_101515 ?auto_101518 )
      ( MAKE-5PILE ?auto_101511 ?auto_101512 ?auto_101513 ?auto_101514 ?auto_101515 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_101519 - BLOCK
      ?auto_101520 - BLOCK
      ?auto_101521 - BLOCK
      ?auto_101522 - BLOCK
      ?auto_101523 - BLOCK
    )
    :vars
    (
      ?auto_101524 - BLOCK
      ?auto_101525 - BLOCK
      ?auto_101526 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_101524 ?auto_101523 ) ( ON-TABLE ?auto_101519 ) ( ON ?auto_101520 ?auto_101519 ) ( ON ?auto_101521 ?auto_101520 ) ( ON ?auto_101522 ?auto_101521 ) ( ON ?auto_101523 ?auto_101522 ) ( not ( = ?auto_101519 ?auto_101520 ) ) ( not ( = ?auto_101519 ?auto_101521 ) ) ( not ( = ?auto_101519 ?auto_101522 ) ) ( not ( = ?auto_101519 ?auto_101523 ) ) ( not ( = ?auto_101519 ?auto_101524 ) ) ( not ( = ?auto_101520 ?auto_101521 ) ) ( not ( = ?auto_101520 ?auto_101522 ) ) ( not ( = ?auto_101520 ?auto_101523 ) ) ( not ( = ?auto_101520 ?auto_101524 ) ) ( not ( = ?auto_101521 ?auto_101522 ) ) ( not ( = ?auto_101521 ?auto_101523 ) ) ( not ( = ?auto_101521 ?auto_101524 ) ) ( not ( = ?auto_101522 ?auto_101523 ) ) ( not ( = ?auto_101522 ?auto_101524 ) ) ( not ( = ?auto_101523 ?auto_101524 ) ) ( not ( = ?auto_101519 ?auto_101525 ) ) ( not ( = ?auto_101519 ?auto_101526 ) ) ( not ( = ?auto_101520 ?auto_101525 ) ) ( not ( = ?auto_101520 ?auto_101526 ) ) ( not ( = ?auto_101521 ?auto_101525 ) ) ( not ( = ?auto_101521 ?auto_101526 ) ) ( not ( = ?auto_101522 ?auto_101525 ) ) ( not ( = ?auto_101522 ?auto_101526 ) ) ( not ( = ?auto_101523 ?auto_101525 ) ) ( not ( = ?auto_101523 ?auto_101526 ) ) ( not ( = ?auto_101524 ?auto_101525 ) ) ( not ( = ?auto_101524 ?auto_101526 ) ) ( not ( = ?auto_101525 ?auto_101526 ) ) ( ON ?auto_101525 ?auto_101524 ) ( CLEAR ?auto_101525 ) ( HOLDING ?auto_101526 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_101526 )
      ( MAKE-5PILE ?auto_101519 ?auto_101520 ?auto_101521 ?auto_101522 ?auto_101523 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_101527 - BLOCK
      ?auto_101528 - BLOCK
      ?auto_101529 - BLOCK
      ?auto_101530 - BLOCK
      ?auto_101531 - BLOCK
    )
    :vars
    (
      ?auto_101533 - BLOCK
      ?auto_101534 - BLOCK
      ?auto_101532 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_101533 ?auto_101531 ) ( ON-TABLE ?auto_101527 ) ( ON ?auto_101528 ?auto_101527 ) ( ON ?auto_101529 ?auto_101528 ) ( ON ?auto_101530 ?auto_101529 ) ( ON ?auto_101531 ?auto_101530 ) ( not ( = ?auto_101527 ?auto_101528 ) ) ( not ( = ?auto_101527 ?auto_101529 ) ) ( not ( = ?auto_101527 ?auto_101530 ) ) ( not ( = ?auto_101527 ?auto_101531 ) ) ( not ( = ?auto_101527 ?auto_101533 ) ) ( not ( = ?auto_101528 ?auto_101529 ) ) ( not ( = ?auto_101528 ?auto_101530 ) ) ( not ( = ?auto_101528 ?auto_101531 ) ) ( not ( = ?auto_101528 ?auto_101533 ) ) ( not ( = ?auto_101529 ?auto_101530 ) ) ( not ( = ?auto_101529 ?auto_101531 ) ) ( not ( = ?auto_101529 ?auto_101533 ) ) ( not ( = ?auto_101530 ?auto_101531 ) ) ( not ( = ?auto_101530 ?auto_101533 ) ) ( not ( = ?auto_101531 ?auto_101533 ) ) ( not ( = ?auto_101527 ?auto_101534 ) ) ( not ( = ?auto_101527 ?auto_101532 ) ) ( not ( = ?auto_101528 ?auto_101534 ) ) ( not ( = ?auto_101528 ?auto_101532 ) ) ( not ( = ?auto_101529 ?auto_101534 ) ) ( not ( = ?auto_101529 ?auto_101532 ) ) ( not ( = ?auto_101530 ?auto_101534 ) ) ( not ( = ?auto_101530 ?auto_101532 ) ) ( not ( = ?auto_101531 ?auto_101534 ) ) ( not ( = ?auto_101531 ?auto_101532 ) ) ( not ( = ?auto_101533 ?auto_101534 ) ) ( not ( = ?auto_101533 ?auto_101532 ) ) ( not ( = ?auto_101534 ?auto_101532 ) ) ( ON ?auto_101534 ?auto_101533 ) ( ON ?auto_101532 ?auto_101534 ) ( CLEAR ?auto_101532 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_101527 ?auto_101528 ?auto_101529 ?auto_101530 ?auto_101531 ?auto_101533 ?auto_101534 )
      ( MAKE-5PILE ?auto_101527 ?auto_101528 ?auto_101529 ?auto_101530 ?auto_101531 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_101538 - BLOCK
      ?auto_101539 - BLOCK
      ?auto_101540 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_101540 ) ( CLEAR ?auto_101539 ) ( ON-TABLE ?auto_101538 ) ( ON ?auto_101539 ?auto_101538 ) ( not ( = ?auto_101538 ?auto_101539 ) ) ( not ( = ?auto_101538 ?auto_101540 ) ) ( not ( = ?auto_101539 ?auto_101540 ) ) )
    :subtasks
    ( ( !STACK ?auto_101540 ?auto_101539 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_101541 - BLOCK
      ?auto_101542 - BLOCK
      ?auto_101543 - BLOCK
    )
    :vars
    (
      ?auto_101544 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_101542 ) ( ON-TABLE ?auto_101541 ) ( ON ?auto_101542 ?auto_101541 ) ( not ( = ?auto_101541 ?auto_101542 ) ) ( not ( = ?auto_101541 ?auto_101543 ) ) ( not ( = ?auto_101542 ?auto_101543 ) ) ( ON ?auto_101543 ?auto_101544 ) ( CLEAR ?auto_101543 ) ( HAND-EMPTY ) ( not ( = ?auto_101541 ?auto_101544 ) ) ( not ( = ?auto_101542 ?auto_101544 ) ) ( not ( = ?auto_101543 ?auto_101544 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_101543 ?auto_101544 )
      ( MAKE-3PILE ?auto_101541 ?auto_101542 ?auto_101543 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_101545 - BLOCK
      ?auto_101546 - BLOCK
      ?auto_101547 - BLOCK
    )
    :vars
    (
      ?auto_101548 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_101545 ) ( not ( = ?auto_101545 ?auto_101546 ) ) ( not ( = ?auto_101545 ?auto_101547 ) ) ( not ( = ?auto_101546 ?auto_101547 ) ) ( ON ?auto_101547 ?auto_101548 ) ( CLEAR ?auto_101547 ) ( not ( = ?auto_101545 ?auto_101548 ) ) ( not ( = ?auto_101546 ?auto_101548 ) ) ( not ( = ?auto_101547 ?auto_101548 ) ) ( HOLDING ?auto_101546 ) ( CLEAR ?auto_101545 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_101545 ?auto_101546 )
      ( MAKE-3PILE ?auto_101545 ?auto_101546 ?auto_101547 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_101549 - BLOCK
      ?auto_101550 - BLOCK
      ?auto_101551 - BLOCK
    )
    :vars
    (
      ?auto_101552 - BLOCK
      ?auto_101556 - BLOCK
      ?auto_101553 - BLOCK
      ?auto_101555 - BLOCK
      ?auto_101554 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_101549 ) ( not ( = ?auto_101549 ?auto_101550 ) ) ( not ( = ?auto_101549 ?auto_101551 ) ) ( not ( = ?auto_101550 ?auto_101551 ) ) ( ON ?auto_101551 ?auto_101552 ) ( not ( = ?auto_101549 ?auto_101552 ) ) ( not ( = ?auto_101550 ?auto_101552 ) ) ( not ( = ?auto_101551 ?auto_101552 ) ) ( CLEAR ?auto_101549 ) ( ON ?auto_101550 ?auto_101551 ) ( CLEAR ?auto_101550 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_101556 ) ( ON ?auto_101553 ?auto_101556 ) ( ON ?auto_101555 ?auto_101553 ) ( ON ?auto_101554 ?auto_101555 ) ( ON ?auto_101552 ?auto_101554 ) ( not ( = ?auto_101556 ?auto_101553 ) ) ( not ( = ?auto_101556 ?auto_101555 ) ) ( not ( = ?auto_101556 ?auto_101554 ) ) ( not ( = ?auto_101556 ?auto_101552 ) ) ( not ( = ?auto_101556 ?auto_101551 ) ) ( not ( = ?auto_101556 ?auto_101550 ) ) ( not ( = ?auto_101553 ?auto_101555 ) ) ( not ( = ?auto_101553 ?auto_101554 ) ) ( not ( = ?auto_101553 ?auto_101552 ) ) ( not ( = ?auto_101553 ?auto_101551 ) ) ( not ( = ?auto_101553 ?auto_101550 ) ) ( not ( = ?auto_101555 ?auto_101554 ) ) ( not ( = ?auto_101555 ?auto_101552 ) ) ( not ( = ?auto_101555 ?auto_101551 ) ) ( not ( = ?auto_101555 ?auto_101550 ) ) ( not ( = ?auto_101554 ?auto_101552 ) ) ( not ( = ?auto_101554 ?auto_101551 ) ) ( not ( = ?auto_101554 ?auto_101550 ) ) ( not ( = ?auto_101549 ?auto_101556 ) ) ( not ( = ?auto_101549 ?auto_101553 ) ) ( not ( = ?auto_101549 ?auto_101555 ) ) ( not ( = ?auto_101549 ?auto_101554 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_101556 ?auto_101553 ?auto_101555 ?auto_101554 ?auto_101552 ?auto_101551 )
      ( MAKE-3PILE ?auto_101549 ?auto_101550 ?auto_101551 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_101557 - BLOCK
      ?auto_101558 - BLOCK
      ?auto_101559 - BLOCK
    )
    :vars
    (
      ?auto_101560 - BLOCK
      ?auto_101561 - BLOCK
      ?auto_101562 - BLOCK
      ?auto_101564 - BLOCK
      ?auto_101563 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_101557 ?auto_101558 ) ) ( not ( = ?auto_101557 ?auto_101559 ) ) ( not ( = ?auto_101558 ?auto_101559 ) ) ( ON ?auto_101559 ?auto_101560 ) ( not ( = ?auto_101557 ?auto_101560 ) ) ( not ( = ?auto_101558 ?auto_101560 ) ) ( not ( = ?auto_101559 ?auto_101560 ) ) ( ON ?auto_101558 ?auto_101559 ) ( CLEAR ?auto_101558 ) ( ON-TABLE ?auto_101561 ) ( ON ?auto_101562 ?auto_101561 ) ( ON ?auto_101564 ?auto_101562 ) ( ON ?auto_101563 ?auto_101564 ) ( ON ?auto_101560 ?auto_101563 ) ( not ( = ?auto_101561 ?auto_101562 ) ) ( not ( = ?auto_101561 ?auto_101564 ) ) ( not ( = ?auto_101561 ?auto_101563 ) ) ( not ( = ?auto_101561 ?auto_101560 ) ) ( not ( = ?auto_101561 ?auto_101559 ) ) ( not ( = ?auto_101561 ?auto_101558 ) ) ( not ( = ?auto_101562 ?auto_101564 ) ) ( not ( = ?auto_101562 ?auto_101563 ) ) ( not ( = ?auto_101562 ?auto_101560 ) ) ( not ( = ?auto_101562 ?auto_101559 ) ) ( not ( = ?auto_101562 ?auto_101558 ) ) ( not ( = ?auto_101564 ?auto_101563 ) ) ( not ( = ?auto_101564 ?auto_101560 ) ) ( not ( = ?auto_101564 ?auto_101559 ) ) ( not ( = ?auto_101564 ?auto_101558 ) ) ( not ( = ?auto_101563 ?auto_101560 ) ) ( not ( = ?auto_101563 ?auto_101559 ) ) ( not ( = ?auto_101563 ?auto_101558 ) ) ( not ( = ?auto_101557 ?auto_101561 ) ) ( not ( = ?auto_101557 ?auto_101562 ) ) ( not ( = ?auto_101557 ?auto_101564 ) ) ( not ( = ?auto_101557 ?auto_101563 ) ) ( HOLDING ?auto_101557 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_101557 )
      ( MAKE-3PILE ?auto_101557 ?auto_101558 ?auto_101559 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_101565 - BLOCK
      ?auto_101566 - BLOCK
      ?auto_101567 - BLOCK
    )
    :vars
    (
      ?auto_101570 - BLOCK
      ?auto_101568 - BLOCK
      ?auto_101572 - BLOCK
      ?auto_101571 - BLOCK
      ?auto_101569 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_101565 ?auto_101566 ) ) ( not ( = ?auto_101565 ?auto_101567 ) ) ( not ( = ?auto_101566 ?auto_101567 ) ) ( ON ?auto_101567 ?auto_101570 ) ( not ( = ?auto_101565 ?auto_101570 ) ) ( not ( = ?auto_101566 ?auto_101570 ) ) ( not ( = ?auto_101567 ?auto_101570 ) ) ( ON ?auto_101566 ?auto_101567 ) ( ON-TABLE ?auto_101568 ) ( ON ?auto_101572 ?auto_101568 ) ( ON ?auto_101571 ?auto_101572 ) ( ON ?auto_101569 ?auto_101571 ) ( ON ?auto_101570 ?auto_101569 ) ( not ( = ?auto_101568 ?auto_101572 ) ) ( not ( = ?auto_101568 ?auto_101571 ) ) ( not ( = ?auto_101568 ?auto_101569 ) ) ( not ( = ?auto_101568 ?auto_101570 ) ) ( not ( = ?auto_101568 ?auto_101567 ) ) ( not ( = ?auto_101568 ?auto_101566 ) ) ( not ( = ?auto_101572 ?auto_101571 ) ) ( not ( = ?auto_101572 ?auto_101569 ) ) ( not ( = ?auto_101572 ?auto_101570 ) ) ( not ( = ?auto_101572 ?auto_101567 ) ) ( not ( = ?auto_101572 ?auto_101566 ) ) ( not ( = ?auto_101571 ?auto_101569 ) ) ( not ( = ?auto_101571 ?auto_101570 ) ) ( not ( = ?auto_101571 ?auto_101567 ) ) ( not ( = ?auto_101571 ?auto_101566 ) ) ( not ( = ?auto_101569 ?auto_101570 ) ) ( not ( = ?auto_101569 ?auto_101567 ) ) ( not ( = ?auto_101569 ?auto_101566 ) ) ( not ( = ?auto_101565 ?auto_101568 ) ) ( not ( = ?auto_101565 ?auto_101572 ) ) ( not ( = ?auto_101565 ?auto_101571 ) ) ( not ( = ?auto_101565 ?auto_101569 ) ) ( ON ?auto_101565 ?auto_101566 ) ( CLEAR ?auto_101565 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_101568 ?auto_101572 ?auto_101571 ?auto_101569 ?auto_101570 ?auto_101567 ?auto_101566 )
      ( MAKE-3PILE ?auto_101565 ?auto_101566 ?auto_101567 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_101577 - BLOCK
      ?auto_101578 - BLOCK
      ?auto_101579 - BLOCK
      ?auto_101580 - BLOCK
    )
    :vars
    (
      ?auto_101581 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_101581 ?auto_101580 ) ( CLEAR ?auto_101581 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_101577 ) ( ON ?auto_101578 ?auto_101577 ) ( ON ?auto_101579 ?auto_101578 ) ( ON ?auto_101580 ?auto_101579 ) ( not ( = ?auto_101577 ?auto_101578 ) ) ( not ( = ?auto_101577 ?auto_101579 ) ) ( not ( = ?auto_101577 ?auto_101580 ) ) ( not ( = ?auto_101577 ?auto_101581 ) ) ( not ( = ?auto_101578 ?auto_101579 ) ) ( not ( = ?auto_101578 ?auto_101580 ) ) ( not ( = ?auto_101578 ?auto_101581 ) ) ( not ( = ?auto_101579 ?auto_101580 ) ) ( not ( = ?auto_101579 ?auto_101581 ) ) ( not ( = ?auto_101580 ?auto_101581 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_101581 ?auto_101580 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_101582 - BLOCK
      ?auto_101583 - BLOCK
      ?auto_101584 - BLOCK
      ?auto_101585 - BLOCK
    )
    :vars
    (
      ?auto_101586 - BLOCK
      ?auto_101587 - BLOCK
      ?auto_101588 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_101586 ?auto_101585 ) ( CLEAR ?auto_101586 ) ( ON-TABLE ?auto_101582 ) ( ON ?auto_101583 ?auto_101582 ) ( ON ?auto_101584 ?auto_101583 ) ( ON ?auto_101585 ?auto_101584 ) ( not ( = ?auto_101582 ?auto_101583 ) ) ( not ( = ?auto_101582 ?auto_101584 ) ) ( not ( = ?auto_101582 ?auto_101585 ) ) ( not ( = ?auto_101582 ?auto_101586 ) ) ( not ( = ?auto_101583 ?auto_101584 ) ) ( not ( = ?auto_101583 ?auto_101585 ) ) ( not ( = ?auto_101583 ?auto_101586 ) ) ( not ( = ?auto_101584 ?auto_101585 ) ) ( not ( = ?auto_101584 ?auto_101586 ) ) ( not ( = ?auto_101585 ?auto_101586 ) ) ( HOLDING ?auto_101587 ) ( CLEAR ?auto_101588 ) ( not ( = ?auto_101582 ?auto_101587 ) ) ( not ( = ?auto_101582 ?auto_101588 ) ) ( not ( = ?auto_101583 ?auto_101587 ) ) ( not ( = ?auto_101583 ?auto_101588 ) ) ( not ( = ?auto_101584 ?auto_101587 ) ) ( not ( = ?auto_101584 ?auto_101588 ) ) ( not ( = ?auto_101585 ?auto_101587 ) ) ( not ( = ?auto_101585 ?auto_101588 ) ) ( not ( = ?auto_101586 ?auto_101587 ) ) ( not ( = ?auto_101586 ?auto_101588 ) ) ( not ( = ?auto_101587 ?auto_101588 ) ) )
    :subtasks
    ( ( !STACK ?auto_101587 ?auto_101588 )
      ( MAKE-4PILE ?auto_101582 ?auto_101583 ?auto_101584 ?auto_101585 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_101589 - BLOCK
      ?auto_101590 - BLOCK
      ?auto_101591 - BLOCK
      ?auto_101592 - BLOCK
    )
    :vars
    (
      ?auto_101593 - BLOCK
      ?auto_101595 - BLOCK
      ?auto_101594 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_101593 ?auto_101592 ) ( ON-TABLE ?auto_101589 ) ( ON ?auto_101590 ?auto_101589 ) ( ON ?auto_101591 ?auto_101590 ) ( ON ?auto_101592 ?auto_101591 ) ( not ( = ?auto_101589 ?auto_101590 ) ) ( not ( = ?auto_101589 ?auto_101591 ) ) ( not ( = ?auto_101589 ?auto_101592 ) ) ( not ( = ?auto_101589 ?auto_101593 ) ) ( not ( = ?auto_101590 ?auto_101591 ) ) ( not ( = ?auto_101590 ?auto_101592 ) ) ( not ( = ?auto_101590 ?auto_101593 ) ) ( not ( = ?auto_101591 ?auto_101592 ) ) ( not ( = ?auto_101591 ?auto_101593 ) ) ( not ( = ?auto_101592 ?auto_101593 ) ) ( CLEAR ?auto_101595 ) ( not ( = ?auto_101589 ?auto_101594 ) ) ( not ( = ?auto_101589 ?auto_101595 ) ) ( not ( = ?auto_101590 ?auto_101594 ) ) ( not ( = ?auto_101590 ?auto_101595 ) ) ( not ( = ?auto_101591 ?auto_101594 ) ) ( not ( = ?auto_101591 ?auto_101595 ) ) ( not ( = ?auto_101592 ?auto_101594 ) ) ( not ( = ?auto_101592 ?auto_101595 ) ) ( not ( = ?auto_101593 ?auto_101594 ) ) ( not ( = ?auto_101593 ?auto_101595 ) ) ( not ( = ?auto_101594 ?auto_101595 ) ) ( ON ?auto_101594 ?auto_101593 ) ( CLEAR ?auto_101594 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_101589 ?auto_101590 ?auto_101591 ?auto_101592 ?auto_101593 )
      ( MAKE-4PILE ?auto_101589 ?auto_101590 ?auto_101591 ?auto_101592 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_101596 - BLOCK
      ?auto_101597 - BLOCK
      ?auto_101598 - BLOCK
      ?auto_101599 - BLOCK
    )
    :vars
    (
      ?auto_101600 - BLOCK
      ?auto_101601 - BLOCK
      ?auto_101602 - BLOCK
      ?auto_101603 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_101600 ?auto_101599 ) ( ON-TABLE ?auto_101596 ) ( ON ?auto_101597 ?auto_101596 ) ( ON ?auto_101598 ?auto_101597 ) ( ON ?auto_101599 ?auto_101598 ) ( not ( = ?auto_101596 ?auto_101597 ) ) ( not ( = ?auto_101596 ?auto_101598 ) ) ( not ( = ?auto_101596 ?auto_101599 ) ) ( not ( = ?auto_101596 ?auto_101600 ) ) ( not ( = ?auto_101597 ?auto_101598 ) ) ( not ( = ?auto_101597 ?auto_101599 ) ) ( not ( = ?auto_101597 ?auto_101600 ) ) ( not ( = ?auto_101598 ?auto_101599 ) ) ( not ( = ?auto_101598 ?auto_101600 ) ) ( not ( = ?auto_101599 ?auto_101600 ) ) ( not ( = ?auto_101596 ?auto_101601 ) ) ( not ( = ?auto_101596 ?auto_101602 ) ) ( not ( = ?auto_101597 ?auto_101601 ) ) ( not ( = ?auto_101597 ?auto_101602 ) ) ( not ( = ?auto_101598 ?auto_101601 ) ) ( not ( = ?auto_101598 ?auto_101602 ) ) ( not ( = ?auto_101599 ?auto_101601 ) ) ( not ( = ?auto_101599 ?auto_101602 ) ) ( not ( = ?auto_101600 ?auto_101601 ) ) ( not ( = ?auto_101600 ?auto_101602 ) ) ( not ( = ?auto_101601 ?auto_101602 ) ) ( ON ?auto_101601 ?auto_101600 ) ( CLEAR ?auto_101601 ) ( HOLDING ?auto_101602 ) ( CLEAR ?auto_101603 ) ( ON-TABLE ?auto_101603 ) ( not ( = ?auto_101603 ?auto_101602 ) ) ( not ( = ?auto_101596 ?auto_101603 ) ) ( not ( = ?auto_101597 ?auto_101603 ) ) ( not ( = ?auto_101598 ?auto_101603 ) ) ( not ( = ?auto_101599 ?auto_101603 ) ) ( not ( = ?auto_101600 ?auto_101603 ) ) ( not ( = ?auto_101601 ?auto_101603 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_101603 ?auto_101602 )
      ( MAKE-4PILE ?auto_101596 ?auto_101597 ?auto_101598 ?auto_101599 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_101604 - BLOCK
      ?auto_101605 - BLOCK
      ?auto_101606 - BLOCK
      ?auto_101607 - BLOCK
    )
    :vars
    (
      ?auto_101611 - BLOCK
      ?auto_101608 - BLOCK
      ?auto_101610 - BLOCK
      ?auto_101609 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_101611 ?auto_101607 ) ( ON-TABLE ?auto_101604 ) ( ON ?auto_101605 ?auto_101604 ) ( ON ?auto_101606 ?auto_101605 ) ( ON ?auto_101607 ?auto_101606 ) ( not ( = ?auto_101604 ?auto_101605 ) ) ( not ( = ?auto_101604 ?auto_101606 ) ) ( not ( = ?auto_101604 ?auto_101607 ) ) ( not ( = ?auto_101604 ?auto_101611 ) ) ( not ( = ?auto_101605 ?auto_101606 ) ) ( not ( = ?auto_101605 ?auto_101607 ) ) ( not ( = ?auto_101605 ?auto_101611 ) ) ( not ( = ?auto_101606 ?auto_101607 ) ) ( not ( = ?auto_101606 ?auto_101611 ) ) ( not ( = ?auto_101607 ?auto_101611 ) ) ( not ( = ?auto_101604 ?auto_101608 ) ) ( not ( = ?auto_101604 ?auto_101610 ) ) ( not ( = ?auto_101605 ?auto_101608 ) ) ( not ( = ?auto_101605 ?auto_101610 ) ) ( not ( = ?auto_101606 ?auto_101608 ) ) ( not ( = ?auto_101606 ?auto_101610 ) ) ( not ( = ?auto_101607 ?auto_101608 ) ) ( not ( = ?auto_101607 ?auto_101610 ) ) ( not ( = ?auto_101611 ?auto_101608 ) ) ( not ( = ?auto_101611 ?auto_101610 ) ) ( not ( = ?auto_101608 ?auto_101610 ) ) ( ON ?auto_101608 ?auto_101611 ) ( CLEAR ?auto_101609 ) ( ON-TABLE ?auto_101609 ) ( not ( = ?auto_101609 ?auto_101610 ) ) ( not ( = ?auto_101604 ?auto_101609 ) ) ( not ( = ?auto_101605 ?auto_101609 ) ) ( not ( = ?auto_101606 ?auto_101609 ) ) ( not ( = ?auto_101607 ?auto_101609 ) ) ( not ( = ?auto_101611 ?auto_101609 ) ) ( not ( = ?auto_101608 ?auto_101609 ) ) ( ON ?auto_101610 ?auto_101608 ) ( CLEAR ?auto_101610 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_101604 ?auto_101605 ?auto_101606 ?auto_101607 ?auto_101611 ?auto_101608 )
      ( MAKE-4PILE ?auto_101604 ?auto_101605 ?auto_101606 ?auto_101607 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_101612 - BLOCK
      ?auto_101613 - BLOCK
      ?auto_101614 - BLOCK
      ?auto_101615 - BLOCK
    )
    :vars
    (
      ?auto_101616 - BLOCK
      ?auto_101617 - BLOCK
      ?auto_101618 - BLOCK
      ?auto_101619 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_101616 ?auto_101615 ) ( ON-TABLE ?auto_101612 ) ( ON ?auto_101613 ?auto_101612 ) ( ON ?auto_101614 ?auto_101613 ) ( ON ?auto_101615 ?auto_101614 ) ( not ( = ?auto_101612 ?auto_101613 ) ) ( not ( = ?auto_101612 ?auto_101614 ) ) ( not ( = ?auto_101612 ?auto_101615 ) ) ( not ( = ?auto_101612 ?auto_101616 ) ) ( not ( = ?auto_101613 ?auto_101614 ) ) ( not ( = ?auto_101613 ?auto_101615 ) ) ( not ( = ?auto_101613 ?auto_101616 ) ) ( not ( = ?auto_101614 ?auto_101615 ) ) ( not ( = ?auto_101614 ?auto_101616 ) ) ( not ( = ?auto_101615 ?auto_101616 ) ) ( not ( = ?auto_101612 ?auto_101617 ) ) ( not ( = ?auto_101612 ?auto_101618 ) ) ( not ( = ?auto_101613 ?auto_101617 ) ) ( not ( = ?auto_101613 ?auto_101618 ) ) ( not ( = ?auto_101614 ?auto_101617 ) ) ( not ( = ?auto_101614 ?auto_101618 ) ) ( not ( = ?auto_101615 ?auto_101617 ) ) ( not ( = ?auto_101615 ?auto_101618 ) ) ( not ( = ?auto_101616 ?auto_101617 ) ) ( not ( = ?auto_101616 ?auto_101618 ) ) ( not ( = ?auto_101617 ?auto_101618 ) ) ( ON ?auto_101617 ?auto_101616 ) ( not ( = ?auto_101619 ?auto_101618 ) ) ( not ( = ?auto_101612 ?auto_101619 ) ) ( not ( = ?auto_101613 ?auto_101619 ) ) ( not ( = ?auto_101614 ?auto_101619 ) ) ( not ( = ?auto_101615 ?auto_101619 ) ) ( not ( = ?auto_101616 ?auto_101619 ) ) ( not ( = ?auto_101617 ?auto_101619 ) ) ( ON ?auto_101618 ?auto_101617 ) ( CLEAR ?auto_101618 ) ( HOLDING ?auto_101619 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_101619 )
      ( MAKE-4PILE ?auto_101612 ?auto_101613 ?auto_101614 ?auto_101615 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_101620 - BLOCK
      ?auto_101621 - BLOCK
      ?auto_101622 - BLOCK
      ?auto_101623 - BLOCK
    )
    :vars
    (
      ?auto_101627 - BLOCK
      ?auto_101625 - BLOCK
      ?auto_101626 - BLOCK
      ?auto_101624 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_101627 ?auto_101623 ) ( ON-TABLE ?auto_101620 ) ( ON ?auto_101621 ?auto_101620 ) ( ON ?auto_101622 ?auto_101621 ) ( ON ?auto_101623 ?auto_101622 ) ( not ( = ?auto_101620 ?auto_101621 ) ) ( not ( = ?auto_101620 ?auto_101622 ) ) ( not ( = ?auto_101620 ?auto_101623 ) ) ( not ( = ?auto_101620 ?auto_101627 ) ) ( not ( = ?auto_101621 ?auto_101622 ) ) ( not ( = ?auto_101621 ?auto_101623 ) ) ( not ( = ?auto_101621 ?auto_101627 ) ) ( not ( = ?auto_101622 ?auto_101623 ) ) ( not ( = ?auto_101622 ?auto_101627 ) ) ( not ( = ?auto_101623 ?auto_101627 ) ) ( not ( = ?auto_101620 ?auto_101625 ) ) ( not ( = ?auto_101620 ?auto_101626 ) ) ( not ( = ?auto_101621 ?auto_101625 ) ) ( not ( = ?auto_101621 ?auto_101626 ) ) ( not ( = ?auto_101622 ?auto_101625 ) ) ( not ( = ?auto_101622 ?auto_101626 ) ) ( not ( = ?auto_101623 ?auto_101625 ) ) ( not ( = ?auto_101623 ?auto_101626 ) ) ( not ( = ?auto_101627 ?auto_101625 ) ) ( not ( = ?auto_101627 ?auto_101626 ) ) ( not ( = ?auto_101625 ?auto_101626 ) ) ( ON ?auto_101625 ?auto_101627 ) ( not ( = ?auto_101624 ?auto_101626 ) ) ( not ( = ?auto_101620 ?auto_101624 ) ) ( not ( = ?auto_101621 ?auto_101624 ) ) ( not ( = ?auto_101622 ?auto_101624 ) ) ( not ( = ?auto_101623 ?auto_101624 ) ) ( not ( = ?auto_101627 ?auto_101624 ) ) ( not ( = ?auto_101625 ?auto_101624 ) ) ( ON ?auto_101626 ?auto_101625 ) ( ON ?auto_101624 ?auto_101626 ) ( CLEAR ?auto_101624 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_101620 ?auto_101621 ?auto_101622 ?auto_101623 ?auto_101627 ?auto_101625 ?auto_101626 )
      ( MAKE-4PILE ?auto_101620 ?auto_101621 ?auto_101622 ?auto_101623 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_101632 - BLOCK
      ?auto_101633 - BLOCK
      ?auto_101634 - BLOCK
      ?auto_101635 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_101635 ) ( CLEAR ?auto_101634 ) ( ON-TABLE ?auto_101632 ) ( ON ?auto_101633 ?auto_101632 ) ( ON ?auto_101634 ?auto_101633 ) ( not ( = ?auto_101632 ?auto_101633 ) ) ( not ( = ?auto_101632 ?auto_101634 ) ) ( not ( = ?auto_101632 ?auto_101635 ) ) ( not ( = ?auto_101633 ?auto_101634 ) ) ( not ( = ?auto_101633 ?auto_101635 ) ) ( not ( = ?auto_101634 ?auto_101635 ) ) )
    :subtasks
    ( ( !STACK ?auto_101635 ?auto_101634 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_101636 - BLOCK
      ?auto_101637 - BLOCK
      ?auto_101638 - BLOCK
      ?auto_101639 - BLOCK
    )
    :vars
    (
      ?auto_101640 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_101638 ) ( ON-TABLE ?auto_101636 ) ( ON ?auto_101637 ?auto_101636 ) ( ON ?auto_101638 ?auto_101637 ) ( not ( = ?auto_101636 ?auto_101637 ) ) ( not ( = ?auto_101636 ?auto_101638 ) ) ( not ( = ?auto_101636 ?auto_101639 ) ) ( not ( = ?auto_101637 ?auto_101638 ) ) ( not ( = ?auto_101637 ?auto_101639 ) ) ( not ( = ?auto_101638 ?auto_101639 ) ) ( ON ?auto_101639 ?auto_101640 ) ( CLEAR ?auto_101639 ) ( HAND-EMPTY ) ( not ( = ?auto_101636 ?auto_101640 ) ) ( not ( = ?auto_101637 ?auto_101640 ) ) ( not ( = ?auto_101638 ?auto_101640 ) ) ( not ( = ?auto_101639 ?auto_101640 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_101639 ?auto_101640 )
      ( MAKE-4PILE ?auto_101636 ?auto_101637 ?auto_101638 ?auto_101639 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_101641 - BLOCK
      ?auto_101642 - BLOCK
      ?auto_101643 - BLOCK
      ?auto_101644 - BLOCK
    )
    :vars
    (
      ?auto_101645 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_101641 ) ( ON ?auto_101642 ?auto_101641 ) ( not ( = ?auto_101641 ?auto_101642 ) ) ( not ( = ?auto_101641 ?auto_101643 ) ) ( not ( = ?auto_101641 ?auto_101644 ) ) ( not ( = ?auto_101642 ?auto_101643 ) ) ( not ( = ?auto_101642 ?auto_101644 ) ) ( not ( = ?auto_101643 ?auto_101644 ) ) ( ON ?auto_101644 ?auto_101645 ) ( CLEAR ?auto_101644 ) ( not ( = ?auto_101641 ?auto_101645 ) ) ( not ( = ?auto_101642 ?auto_101645 ) ) ( not ( = ?auto_101643 ?auto_101645 ) ) ( not ( = ?auto_101644 ?auto_101645 ) ) ( HOLDING ?auto_101643 ) ( CLEAR ?auto_101642 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_101641 ?auto_101642 ?auto_101643 )
      ( MAKE-4PILE ?auto_101641 ?auto_101642 ?auto_101643 ?auto_101644 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_101646 - BLOCK
      ?auto_101647 - BLOCK
      ?auto_101648 - BLOCK
      ?auto_101649 - BLOCK
    )
    :vars
    (
      ?auto_101650 - BLOCK
      ?auto_101651 - BLOCK
      ?auto_101652 - BLOCK
      ?auto_101653 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_101646 ) ( ON ?auto_101647 ?auto_101646 ) ( not ( = ?auto_101646 ?auto_101647 ) ) ( not ( = ?auto_101646 ?auto_101648 ) ) ( not ( = ?auto_101646 ?auto_101649 ) ) ( not ( = ?auto_101647 ?auto_101648 ) ) ( not ( = ?auto_101647 ?auto_101649 ) ) ( not ( = ?auto_101648 ?auto_101649 ) ) ( ON ?auto_101649 ?auto_101650 ) ( not ( = ?auto_101646 ?auto_101650 ) ) ( not ( = ?auto_101647 ?auto_101650 ) ) ( not ( = ?auto_101648 ?auto_101650 ) ) ( not ( = ?auto_101649 ?auto_101650 ) ) ( CLEAR ?auto_101647 ) ( ON ?auto_101648 ?auto_101649 ) ( CLEAR ?auto_101648 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_101651 ) ( ON ?auto_101652 ?auto_101651 ) ( ON ?auto_101653 ?auto_101652 ) ( ON ?auto_101650 ?auto_101653 ) ( not ( = ?auto_101651 ?auto_101652 ) ) ( not ( = ?auto_101651 ?auto_101653 ) ) ( not ( = ?auto_101651 ?auto_101650 ) ) ( not ( = ?auto_101651 ?auto_101649 ) ) ( not ( = ?auto_101651 ?auto_101648 ) ) ( not ( = ?auto_101652 ?auto_101653 ) ) ( not ( = ?auto_101652 ?auto_101650 ) ) ( not ( = ?auto_101652 ?auto_101649 ) ) ( not ( = ?auto_101652 ?auto_101648 ) ) ( not ( = ?auto_101653 ?auto_101650 ) ) ( not ( = ?auto_101653 ?auto_101649 ) ) ( not ( = ?auto_101653 ?auto_101648 ) ) ( not ( = ?auto_101646 ?auto_101651 ) ) ( not ( = ?auto_101646 ?auto_101652 ) ) ( not ( = ?auto_101646 ?auto_101653 ) ) ( not ( = ?auto_101647 ?auto_101651 ) ) ( not ( = ?auto_101647 ?auto_101652 ) ) ( not ( = ?auto_101647 ?auto_101653 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_101651 ?auto_101652 ?auto_101653 ?auto_101650 ?auto_101649 )
      ( MAKE-4PILE ?auto_101646 ?auto_101647 ?auto_101648 ?auto_101649 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_101654 - BLOCK
      ?auto_101655 - BLOCK
      ?auto_101656 - BLOCK
      ?auto_101657 - BLOCK
    )
    :vars
    (
      ?auto_101661 - BLOCK
      ?auto_101660 - BLOCK
      ?auto_101659 - BLOCK
      ?auto_101658 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_101654 ) ( not ( = ?auto_101654 ?auto_101655 ) ) ( not ( = ?auto_101654 ?auto_101656 ) ) ( not ( = ?auto_101654 ?auto_101657 ) ) ( not ( = ?auto_101655 ?auto_101656 ) ) ( not ( = ?auto_101655 ?auto_101657 ) ) ( not ( = ?auto_101656 ?auto_101657 ) ) ( ON ?auto_101657 ?auto_101661 ) ( not ( = ?auto_101654 ?auto_101661 ) ) ( not ( = ?auto_101655 ?auto_101661 ) ) ( not ( = ?auto_101656 ?auto_101661 ) ) ( not ( = ?auto_101657 ?auto_101661 ) ) ( ON ?auto_101656 ?auto_101657 ) ( CLEAR ?auto_101656 ) ( ON-TABLE ?auto_101660 ) ( ON ?auto_101659 ?auto_101660 ) ( ON ?auto_101658 ?auto_101659 ) ( ON ?auto_101661 ?auto_101658 ) ( not ( = ?auto_101660 ?auto_101659 ) ) ( not ( = ?auto_101660 ?auto_101658 ) ) ( not ( = ?auto_101660 ?auto_101661 ) ) ( not ( = ?auto_101660 ?auto_101657 ) ) ( not ( = ?auto_101660 ?auto_101656 ) ) ( not ( = ?auto_101659 ?auto_101658 ) ) ( not ( = ?auto_101659 ?auto_101661 ) ) ( not ( = ?auto_101659 ?auto_101657 ) ) ( not ( = ?auto_101659 ?auto_101656 ) ) ( not ( = ?auto_101658 ?auto_101661 ) ) ( not ( = ?auto_101658 ?auto_101657 ) ) ( not ( = ?auto_101658 ?auto_101656 ) ) ( not ( = ?auto_101654 ?auto_101660 ) ) ( not ( = ?auto_101654 ?auto_101659 ) ) ( not ( = ?auto_101654 ?auto_101658 ) ) ( not ( = ?auto_101655 ?auto_101660 ) ) ( not ( = ?auto_101655 ?auto_101659 ) ) ( not ( = ?auto_101655 ?auto_101658 ) ) ( HOLDING ?auto_101655 ) ( CLEAR ?auto_101654 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_101654 ?auto_101655 )
      ( MAKE-4PILE ?auto_101654 ?auto_101655 ?auto_101656 ?auto_101657 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_101662 - BLOCK
      ?auto_101663 - BLOCK
      ?auto_101664 - BLOCK
      ?auto_101665 - BLOCK
    )
    :vars
    (
      ?auto_101668 - BLOCK
      ?auto_101667 - BLOCK
      ?auto_101666 - BLOCK
      ?auto_101669 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_101662 ) ( not ( = ?auto_101662 ?auto_101663 ) ) ( not ( = ?auto_101662 ?auto_101664 ) ) ( not ( = ?auto_101662 ?auto_101665 ) ) ( not ( = ?auto_101663 ?auto_101664 ) ) ( not ( = ?auto_101663 ?auto_101665 ) ) ( not ( = ?auto_101664 ?auto_101665 ) ) ( ON ?auto_101665 ?auto_101668 ) ( not ( = ?auto_101662 ?auto_101668 ) ) ( not ( = ?auto_101663 ?auto_101668 ) ) ( not ( = ?auto_101664 ?auto_101668 ) ) ( not ( = ?auto_101665 ?auto_101668 ) ) ( ON ?auto_101664 ?auto_101665 ) ( ON-TABLE ?auto_101667 ) ( ON ?auto_101666 ?auto_101667 ) ( ON ?auto_101669 ?auto_101666 ) ( ON ?auto_101668 ?auto_101669 ) ( not ( = ?auto_101667 ?auto_101666 ) ) ( not ( = ?auto_101667 ?auto_101669 ) ) ( not ( = ?auto_101667 ?auto_101668 ) ) ( not ( = ?auto_101667 ?auto_101665 ) ) ( not ( = ?auto_101667 ?auto_101664 ) ) ( not ( = ?auto_101666 ?auto_101669 ) ) ( not ( = ?auto_101666 ?auto_101668 ) ) ( not ( = ?auto_101666 ?auto_101665 ) ) ( not ( = ?auto_101666 ?auto_101664 ) ) ( not ( = ?auto_101669 ?auto_101668 ) ) ( not ( = ?auto_101669 ?auto_101665 ) ) ( not ( = ?auto_101669 ?auto_101664 ) ) ( not ( = ?auto_101662 ?auto_101667 ) ) ( not ( = ?auto_101662 ?auto_101666 ) ) ( not ( = ?auto_101662 ?auto_101669 ) ) ( not ( = ?auto_101663 ?auto_101667 ) ) ( not ( = ?auto_101663 ?auto_101666 ) ) ( not ( = ?auto_101663 ?auto_101669 ) ) ( CLEAR ?auto_101662 ) ( ON ?auto_101663 ?auto_101664 ) ( CLEAR ?auto_101663 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_101667 ?auto_101666 ?auto_101669 ?auto_101668 ?auto_101665 ?auto_101664 )
      ( MAKE-4PILE ?auto_101662 ?auto_101663 ?auto_101664 ?auto_101665 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_101670 - BLOCK
      ?auto_101671 - BLOCK
      ?auto_101672 - BLOCK
      ?auto_101673 - BLOCK
    )
    :vars
    (
      ?auto_101677 - BLOCK
      ?auto_101675 - BLOCK
      ?auto_101676 - BLOCK
      ?auto_101674 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_101670 ?auto_101671 ) ) ( not ( = ?auto_101670 ?auto_101672 ) ) ( not ( = ?auto_101670 ?auto_101673 ) ) ( not ( = ?auto_101671 ?auto_101672 ) ) ( not ( = ?auto_101671 ?auto_101673 ) ) ( not ( = ?auto_101672 ?auto_101673 ) ) ( ON ?auto_101673 ?auto_101677 ) ( not ( = ?auto_101670 ?auto_101677 ) ) ( not ( = ?auto_101671 ?auto_101677 ) ) ( not ( = ?auto_101672 ?auto_101677 ) ) ( not ( = ?auto_101673 ?auto_101677 ) ) ( ON ?auto_101672 ?auto_101673 ) ( ON-TABLE ?auto_101675 ) ( ON ?auto_101676 ?auto_101675 ) ( ON ?auto_101674 ?auto_101676 ) ( ON ?auto_101677 ?auto_101674 ) ( not ( = ?auto_101675 ?auto_101676 ) ) ( not ( = ?auto_101675 ?auto_101674 ) ) ( not ( = ?auto_101675 ?auto_101677 ) ) ( not ( = ?auto_101675 ?auto_101673 ) ) ( not ( = ?auto_101675 ?auto_101672 ) ) ( not ( = ?auto_101676 ?auto_101674 ) ) ( not ( = ?auto_101676 ?auto_101677 ) ) ( not ( = ?auto_101676 ?auto_101673 ) ) ( not ( = ?auto_101676 ?auto_101672 ) ) ( not ( = ?auto_101674 ?auto_101677 ) ) ( not ( = ?auto_101674 ?auto_101673 ) ) ( not ( = ?auto_101674 ?auto_101672 ) ) ( not ( = ?auto_101670 ?auto_101675 ) ) ( not ( = ?auto_101670 ?auto_101676 ) ) ( not ( = ?auto_101670 ?auto_101674 ) ) ( not ( = ?auto_101671 ?auto_101675 ) ) ( not ( = ?auto_101671 ?auto_101676 ) ) ( not ( = ?auto_101671 ?auto_101674 ) ) ( ON ?auto_101671 ?auto_101672 ) ( CLEAR ?auto_101671 ) ( HOLDING ?auto_101670 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_101670 )
      ( MAKE-4PILE ?auto_101670 ?auto_101671 ?auto_101672 ?auto_101673 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_101678 - BLOCK
      ?auto_101679 - BLOCK
      ?auto_101680 - BLOCK
      ?auto_101681 - BLOCK
    )
    :vars
    (
      ?auto_101684 - BLOCK
      ?auto_101682 - BLOCK
      ?auto_101685 - BLOCK
      ?auto_101683 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_101678 ?auto_101679 ) ) ( not ( = ?auto_101678 ?auto_101680 ) ) ( not ( = ?auto_101678 ?auto_101681 ) ) ( not ( = ?auto_101679 ?auto_101680 ) ) ( not ( = ?auto_101679 ?auto_101681 ) ) ( not ( = ?auto_101680 ?auto_101681 ) ) ( ON ?auto_101681 ?auto_101684 ) ( not ( = ?auto_101678 ?auto_101684 ) ) ( not ( = ?auto_101679 ?auto_101684 ) ) ( not ( = ?auto_101680 ?auto_101684 ) ) ( not ( = ?auto_101681 ?auto_101684 ) ) ( ON ?auto_101680 ?auto_101681 ) ( ON-TABLE ?auto_101682 ) ( ON ?auto_101685 ?auto_101682 ) ( ON ?auto_101683 ?auto_101685 ) ( ON ?auto_101684 ?auto_101683 ) ( not ( = ?auto_101682 ?auto_101685 ) ) ( not ( = ?auto_101682 ?auto_101683 ) ) ( not ( = ?auto_101682 ?auto_101684 ) ) ( not ( = ?auto_101682 ?auto_101681 ) ) ( not ( = ?auto_101682 ?auto_101680 ) ) ( not ( = ?auto_101685 ?auto_101683 ) ) ( not ( = ?auto_101685 ?auto_101684 ) ) ( not ( = ?auto_101685 ?auto_101681 ) ) ( not ( = ?auto_101685 ?auto_101680 ) ) ( not ( = ?auto_101683 ?auto_101684 ) ) ( not ( = ?auto_101683 ?auto_101681 ) ) ( not ( = ?auto_101683 ?auto_101680 ) ) ( not ( = ?auto_101678 ?auto_101682 ) ) ( not ( = ?auto_101678 ?auto_101685 ) ) ( not ( = ?auto_101678 ?auto_101683 ) ) ( not ( = ?auto_101679 ?auto_101682 ) ) ( not ( = ?auto_101679 ?auto_101685 ) ) ( not ( = ?auto_101679 ?auto_101683 ) ) ( ON ?auto_101679 ?auto_101680 ) ( ON ?auto_101678 ?auto_101679 ) ( CLEAR ?auto_101678 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_101682 ?auto_101685 ?auto_101683 ?auto_101684 ?auto_101681 ?auto_101680 ?auto_101679 )
      ( MAKE-4PILE ?auto_101678 ?auto_101679 ?auto_101680 ?auto_101681 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_101689 - BLOCK
      ?auto_101690 - BLOCK
      ?auto_101691 - BLOCK
    )
    :vars
    (
      ?auto_101692 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_101692 ?auto_101691 ) ( CLEAR ?auto_101692 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_101689 ) ( ON ?auto_101690 ?auto_101689 ) ( ON ?auto_101691 ?auto_101690 ) ( not ( = ?auto_101689 ?auto_101690 ) ) ( not ( = ?auto_101689 ?auto_101691 ) ) ( not ( = ?auto_101689 ?auto_101692 ) ) ( not ( = ?auto_101690 ?auto_101691 ) ) ( not ( = ?auto_101690 ?auto_101692 ) ) ( not ( = ?auto_101691 ?auto_101692 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_101692 ?auto_101691 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_101693 - BLOCK
      ?auto_101694 - BLOCK
      ?auto_101695 - BLOCK
    )
    :vars
    (
      ?auto_101696 - BLOCK
      ?auto_101697 - BLOCK
      ?auto_101698 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_101696 ?auto_101695 ) ( CLEAR ?auto_101696 ) ( ON-TABLE ?auto_101693 ) ( ON ?auto_101694 ?auto_101693 ) ( ON ?auto_101695 ?auto_101694 ) ( not ( = ?auto_101693 ?auto_101694 ) ) ( not ( = ?auto_101693 ?auto_101695 ) ) ( not ( = ?auto_101693 ?auto_101696 ) ) ( not ( = ?auto_101694 ?auto_101695 ) ) ( not ( = ?auto_101694 ?auto_101696 ) ) ( not ( = ?auto_101695 ?auto_101696 ) ) ( HOLDING ?auto_101697 ) ( CLEAR ?auto_101698 ) ( not ( = ?auto_101693 ?auto_101697 ) ) ( not ( = ?auto_101693 ?auto_101698 ) ) ( not ( = ?auto_101694 ?auto_101697 ) ) ( not ( = ?auto_101694 ?auto_101698 ) ) ( not ( = ?auto_101695 ?auto_101697 ) ) ( not ( = ?auto_101695 ?auto_101698 ) ) ( not ( = ?auto_101696 ?auto_101697 ) ) ( not ( = ?auto_101696 ?auto_101698 ) ) ( not ( = ?auto_101697 ?auto_101698 ) ) )
    :subtasks
    ( ( !STACK ?auto_101697 ?auto_101698 )
      ( MAKE-3PILE ?auto_101693 ?auto_101694 ?auto_101695 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_101699 - BLOCK
      ?auto_101700 - BLOCK
      ?auto_101701 - BLOCK
    )
    :vars
    (
      ?auto_101704 - BLOCK
      ?auto_101703 - BLOCK
      ?auto_101702 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_101704 ?auto_101701 ) ( ON-TABLE ?auto_101699 ) ( ON ?auto_101700 ?auto_101699 ) ( ON ?auto_101701 ?auto_101700 ) ( not ( = ?auto_101699 ?auto_101700 ) ) ( not ( = ?auto_101699 ?auto_101701 ) ) ( not ( = ?auto_101699 ?auto_101704 ) ) ( not ( = ?auto_101700 ?auto_101701 ) ) ( not ( = ?auto_101700 ?auto_101704 ) ) ( not ( = ?auto_101701 ?auto_101704 ) ) ( CLEAR ?auto_101703 ) ( not ( = ?auto_101699 ?auto_101702 ) ) ( not ( = ?auto_101699 ?auto_101703 ) ) ( not ( = ?auto_101700 ?auto_101702 ) ) ( not ( = ?auto_101700 ?auto_101703 ) ) ( not ( = ?auto_101701 ?auto_101702 ) ) ( not ( = ?auto_101701 ?auto_101703 ) ) ( not ( = ?auto_101704 ?auto_101702 ) ) ( not ( = ?auto_101704 ?auto_101703 ) ) ( not ( = ?auto_101702 ?auto_101703 ) ) ( ON ?auto_101702 ?auto_101704 ) ( CLEAR ?auto_101702 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_101699 ?auto_101700 ?auto_101701 ?auto_101704 )
      ( MAKE-3PILE ?auto_101699 ?auto_101700 ?auto_101701 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_101705 - BLOCK
      ?auto_101706 - BLOCK
      ?auto_101707 - BLOCK
    )
    :vars
    (
      ?auto_101710 - BLOCK
      ?auto_101709 - BLOCK
      ?auto_101708 - BLOCK
      ?auto_101711 - BLOCK
      ?auto_101712 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_101710 ?auto_101707 ) ( ON-TABLE ?auto_101705 ) ( ON ?auto_101706 ?auto_101705 ) ( ON ?auto_101707 ?auto_101706 ) ( not ( = ?auto_101705 ?auto_101706 ) ) ( not ( = ?auto_101705 ?auto_101707 ) ) ( not ( = ?auto_101705 ?auto_101710 ) ) ( not ( = ?auto_101706 ?auto_101707 ) ) ( not ( = ?auto_101706 ?auto_101710 ) ) ( not ( = ?auto_101707 ?auto_101710 ) ) ( not ( = ?auto_101705 ?auto_101709 ) ) ( not ( = ?auto_101705 ?auto_101708 ) ) ( not ( = ?auto_101706 ?auto_101709 ) ) ( not ( = ?auto_101706 ?auto_101708 ) ) ( not ( = ?auto_101707 ?auto_101709 ) ) ( not ( = ?auto_101707 ?auto_101708 ) ) ( not ( = ?auto_101710 ?auto_101709 ) ) ( not ( = ?auto_101710 ?auto_101708 ) ) ( not ( = ?auto_101709 ?auto_101708 ) ) ( ON ?auto_101709 ?auto_101710 ) ( CLEAR ?auto_101709 ) ( HOLDING ?auto_101708 ) ( CLEAR ?auto_101711 ) ( ON-TABLE ?auto_101712 ) ( ON ?auto_101711 ?auto_101712 ) ( not ( = ?auto_101712 ?auto_101711 ) ) ( not ( = ?auto_101712 ?auto_101708 ) ) ( not ( = ?auto_101711 ?auto_101708 ) ) ( not ( = ?auto_101705 ?auto_101711 ) ) ( not ( = ?auto_101705 ?auto_101712 ) ) ( not ( = ?auto_101706 ?auto_101711 ) ) ( not ( = ?auto_101706 ?auto_101712 ) ) ( not ( = ?auto_101707 ?auto_101711 ) ) ( not ( = ?auto_101707 ?auto_101712 ) ) ( not ( = ?auto_101710 ?auto_101711 ) ) ( not ( = ?auto_101710 ?auto_101712 ) ) ( not ( = ?auto_101709 ?auto_101711 ) ) ( not ( = ?auto_101709 ?auto_101712 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_101712 ?auto_101711 ?auto_101708 )
      ( MAKE-3PILE ?auto_101705 ?auto_101706 ?auto_101707 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_101713 - BLOCK
      ?auto_101714 - BLOCK
      ?auto_101715 - BLOCK
    )
    :vars
    (
      ?auto_101718 - BLOCK
      ?auto_101720 - BLOCK
      ?auto_101716 - BLOCK
      ?auto_101717 - BLOCK
      ?auto_101719 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_101718 ?auto_101715 ) ( ON-TABLE ?auto_101713 ) ( ON ?auto_101714 ?auto_101713 ) ( ON ?auto_101715 ?auto_101714 ) ( not ( = ?auto_101713 ?auto_101714 ) ) ( not ( = ?auto_101713 ?auto_101715 ) ) ( not ( = ?auto_101713 ?auto_101718 ) ) ( not ( = ?auto_101714 ?auto_101715 ) ) ( not ( = ?auto_101714 ?auto_101718 ) ) ( not ( = ?auto_101715 ?auto_101718 ) ) ( not ( = ?auto_101713 ?auto_101720 ) ) ( not ( = ?auto_101713 ?auto_101716 ) ) ( not ( = ?auto_101714 ?auto_101720 ) ) ( not ( = ?auto_101714 ?auto_101716 ) ) ( not ( = ?auto_101715 ?auto_101720 ) ) ( not ( = ?auto_101715 ?auto_101716 ) ) ( not ( = ?auto_101718 ?auto_101720 ) ) ( not ( = ?auto_101718 ?auto_101716 ) ) ( not ( = ?auto_101720 ?auto_101716 ) ) ( ON ?auto_101720 ?auto_101718 ) ( CLEAR ?auto_101717 ) ( ON-TABLE ?auto_101719 ) ( ON ?auto_101717 ?auto_101719 ) ( not ( = ?auto_101719 ?auto_101717 ) ) ( not ( = ?auto_101719 ?auto_101716 ) ) ( not ( = ?auto_101717 ?auto_101716 ) ) ( not ( = ?auto_101713 ?auto_101717 ) ) ( not ( = ?auto_101713 ?auto_101719 ) ) ( not ( = ?auto_101714 ?auto_101717 ) ) ( not ( = ?auto_101714 ?auto_101719 ) ) ( not ( = ?auto_101715 ?auto_101717 ) ) ( not ( = ?auto_101715 ?auto_101719 ) ) ( not ( = ?auto_101718 ?auto_101717 ) ) ( not ( = ?auto_101718 ?auto_101719 ) ) ( not ( = ?auto_101720 ?auto_101717 ) ) ( not ( = ?auto_101720 ?auto_101719 ) ) ( ON ?auto_101716 ?auto_101720 ) ( CLEAR ?auto_101716 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_101713 ?auto_101714 ?auto_101715 ?auto_101718 ?auto_101720 )
      ( MAKE-3PILE ?auto_101713 ?auto_101714 ?auto_101715 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_101721 - BLOCK
      ?auto_101722 - BLOCK
      ?auto_101723 - BLOCK
    )
    :vars
    (
      ?auto_101728 - BLOCK
      ?auto_101725 - BLOCK
      ?auto_101726 - BLOCK
      ?auto_101724 - BLOCK
      ?auto_101727 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_101728 ?auto_101723 ) ( ON-TABLE ?auto_101721 ) ( ON ?auto_101722 ?auto_101721 ) ( ON ?auto_101723 ?auto_101722 ) ( not ( = ?auto_101721 ?auto_101722 ) ) ( not ( = ?auto_101721 ?auto_101723 ) ) ( not ( = ?auto_101721 ?auto_101728 ) ) ( not ( = ?auto_101722 ?auto_101723 ) ) ( not ( = ?auto_101722 ?auto_101728 ) ) ( not ( = ?auto_101723 ?auto_101728 ) ) ( not ( = ?auto_101721 ?auto_101725 ) ) ( not ( = ?auto_101721 ?auto_101726 ) ) ( not ( = ?auto_101722 ?auto_101725 ) ) ( not ( = ?auto_101722 ?auto_101726 ) ) ( not ( = ?auto_101723 ?auto_101725 ) ) ( not ( = ?auto_101723 ?auto_101726 ) ) ( not ( = ?auto_101728 ?auto_101725 ) ) ( not ( = ?auto_101728 ?auto_101726 ) ) ( not ( = ?auto_101725 ?auto_101726 ) ) ( ON ?auto_101725 ?auto_101728 ) ( ON-TABLE ?auto_101724 ) ( not ( = ?auto_101724 ?auto_101727 ) ) ( not ( = ?auto_101724 ?auto_101726 ) ) ( not ( = ?auto_101727 ?auto_101726 ) ) ( not ( = ?auto_101721 ?auto_101727 ) ) ( not ( = ?auto_101721 ?auto_101724 ) ) ( not ( = ?auto_101722 ?auto_101727 ) ) ( not ( = ?auto_101722 ?auto_101724 ) ) ( not ( = ?auto_101723 ?auto_101727 ) ) ( not ( = ?auto_101723 ?auto_101724 ) ) ( not ( = ?auto_101728 ?auto_101727 ) ) ( not ( = ?auto_101728 ?auto_101724 ) ) ( not ( = ?auto_101725 ?auto_101727 ) ) ( not ( = ?auto_101725 ?auto_101724 ) ) ( ON ?auto_101726 ?auto_101725 ) ( CLEAR ?auto_101726 ) ( HOLDING ?auto_101727 ) ( CLEAR ?auto_101724 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_101724 ?auto_101727 )
      ( MAKE-3PILE ?auto_101721 ?auto_101722 ?auto_101723 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_101729 - BLOCK
      ?auto_101730 - BLOCK
      ?auto_101731 - BLOCK
    )
    :vars
    (
      ?auto_101736 - BLOCK
      ?auto_101732 - BLOCK
      ?auto_101735 - BLOCK
      ?auto_101733 - BLOCK
      ?auto_101734 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_101736 ?auto_101731 ) ( ON-TABLE ?auto_101729 ) ( ON ?auto_101730 ?auto_101729 ) ( ON ?auto_101731 ?auto_101730 ) ( not ( = ?auto_101729 ?auto_101730 ) ) ( not ( = ?auto_101729 ?auto_101731 ) ) ( not ( = ?auto_101729 ?auto_101736 ) ) ( not ( = ?auto_101730 ?auto_101731 ) ) ( not ( = ?auto_101730 ?auto_101736 ) ) ( not ( = ?auto_101731 ?auto_101736 ) ) ( not ( = ?auto_101729 ?auto_101732 ) ) ( not ( = ?auto_101729 ?auto_101735 ) ) ( not ( = ?auto_101730 ?auto_101732 ) ) ( not ( = ?auto_101730 ?auto_101735 ) ) ( not ( = ?auto_101731 ?auto_101732 ) ) ( not ( = ?auto_101731 ?auto_101735 ) ) ( not ( = ?auto_101736 ?auto_101732 ) ) ( not ( = ?auto_101736 ?auto_101735 ) ) ( not ( = ?auto_101732 ?auto_101735 ) ) ( ON ?auto_101732 ?auto_101736 ) ( ON-TABLE ?auto_101733 ) ( not ( = ?auto_101733 ?auto_101734 ) ) ( not ( = ?auto_101733 ?auto_101735 ) ) ( not ( = ?auto_101734 ?auto_101735 ) ) ( not ( = ?auto_101729 ?auto_101734 ) ) ( not ( = ?auto_101729 ?auto_101733 ) ) ( not ( = ?auto_101730 ?auto_101734 ) ) ( not ( = ?auto_101730 ?auto_101733 ) ) ( not ( = ?auto_101731 ?auto_101734 ) ) ( not ( = ?auto_101731 ?auto_101733 ) ) ( not ( = ?auto_101736 ?auto_101734 ) ) ( not ( = ?auto_101736 ?auto_101733 ) ) ( not ( = ?auto_101732 ?auto_101734 ) ) ( not ( = ?auto_101732 ?auto_101733 ) ) ( ON ?auto_101735 ?auto_101732 ) ( CLEAR ?auto_101733 ) ( ON ?auto_101734 ?auto_101735 ) ( CLEAR ?auto_101734 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_101729 ?auto_101730 ?auto_101731 ?auto_101736 ?auto_101732 ?auto_101735 )
      ( MAKE-3PILE ?auto_101729 ?auto_101730 ?auto_101731 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_101737 - BLOCK
      ?auto_101738 - BLOCK
      ?auto_101739 - BLOCK
    )
    :vars
    (
      ?auto_101742 - BLOCK
      ?auto_101741 - BLOCK
      ?auto_101740 - BLOCK
      ?auto_101744 - BLOCK
      ?auto_101743 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_101742 ?auto_101739 ) ( ON-TABLE ?auto_101737 ) ( ON ?auto_101738 ?auto_101737 ) ( ON ?auto_101739 ?auto_101738 ) ( not ( = ?auto_101737 ?auto_101738 ) ) ( not ( = ?auto_101737 ?auto_101739 ) ) ( not ( = ?auto_101737 ?auto_101742 ) ) ( not ( = ?auto_101738 ?auto_101739 ) ) ( not ( = ?auto_101738 ?auto_101742 ) ) ( not ( = ?auto_101739 ?auto_101742 ) ) ( not ( = ?auto_101737 ?auto_101741 ) ) ( not ( = ?auto_101737 ?auto_101740 ) ) ( not ( = ?auto_101738 ?auto_101741 ) ) ( not ( = ?auto_101738 ?auto_101740 ) ) ( not ( = ?auto_101739 ?auto_101741 ) ) ( not ( = ?auto_101739 ?auto_101740 ) ) ( not ( = ?auto_101742 ?auto_101741 ) ) ( not ( = ?auto_101742 ?auto_101740 ) ) ( not ( = ?auto_101741 ?auto_101740 ) ) ( ON ?auto_101741 ?auto_101742 ) ( not ( = ?auto_101744 ?auto_101743 ) ) ( not ( = ?auto_101744 ?auto_101740 ) ) ( not ( = ?auto_101743 ?auto_101740 ) ) ( not ( = ?auto_101737 ?auto_101743 ) ) ( not ( = ?auto_101737 ?auto_101744 ) ) ( not ( = ?auto_101738 ?auto_101743 ) ) ( not ( = ?auto_101738 ?auto_101744 ) ) ( not ( = ?auto_101739 ?auto_101743 ) ) ( not ( = ?auto_101739 ?auto_101744 ) ) ( not ( = ?auto_101742 ?auto_101743 ) ) ( not ( = ?auto_101742 ?auto_101744 ) ) ( not ( = ?auto_101741 ?auto_101743 ) ) ( not ( = ?auto_101741 ?auto_101744 ) ) ( ON ?auto_101740 ?auto_101741 ) ( ON ?auto_101743 ?auto_101740 ) ( CLEAR ?auto_101743 ) ( HOLDING ?auto_101744 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_101744 )
      ( MAKE-3PILE ?auto_101737 ?auto_101738 ?auto_101739 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_101745 - BLOCK
      ?auto_101746 - BLOCK
      ?auto_101747 - BLOCK
    )
    :vars
    (
      ?auto_101751 - BLOCK
      ?auto_101749 - BLOCK
      ?auto_101750 - BLOCK
      ?auto_101752 - BLOCK
      ?auto_101748 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_101751 ?auto_101747 ) ( ON-TABLE ?auto_101745 ) ( ON ?auto_101746 ?auto_101745 ) ( ON ?auto_101747 ?auto_101746 ) ( not ( = ?auto_101745 ?auto_101746 ) ) ( not ( = ?auto_101745 ?auto_101747 ) ) ( not ( = ?auto_101745 ?auto_101751 ) ) ( not ( = ?auto_101746 ?auto_101747 ) ) ( not ( = ?auto_101746 ?auto_101751 ) ) ( not ( = ?auto_101747 ?auto_101751 ) ) ( not ( = ?auto_101745 ?auto_101749 ) ) ( not ( = ?auto_101745 ?auto_101750 ) ) ( not ( = ?auto_101746 ?auto_101749 ) ) ( not ( = ?auto_101746 ?auto_101750 ) ) ( not ( = ?auto_101747 ?auto_101749 ) ) ( not ( = ?auto_101747 ?auto_101750 ) ) ( not ( = ?auto_101751 ?auto_101749 ) ) ( not ( = ?auto_101751 ?auto_101750 ) ) ( not ( = ?auto_101749 ?auto_101750 ) ) ( ON ?auto_101749 ?auto_101751 ) ( not ( = ?auto_101752 ?auto_101748 ) ) ( not ( = ?auto_101752 ?auto_101750 ) ) ( not ( = ?auto_101748 ?auto_101750 ) ) ( not ( = ?auto_101745 ?auto_101748 ) ) ( not ( = ?auto_101745 ?auto_101752 ) ) ( not ( = ?auto_101746 ?auto_101748 ) ) ( not ( = ?auto_101746 ?auto_101752 ) ) ( not ( = ?auto_101747 ?auto_101748 ) ) ( not ( = ?auto_101747 ?auto_101752 ) ) ( not ( = ?auto_101751 ?auto_101748 ) ) ( not ( = ?auto_101751 ?auto_101752 ) ) ( not ( = ?auto_101749 ?auto_101748 ) ) ( not ( = ?auto_101749 ?auto_101752 ) ) ( ON ?auto_101750 ?auto_101749 ) ( ON ?auto_101748 ?auto_101750 ) ( ON ?auto_101752 ?auto_101748 ) ( CLEAR ?auto_101752 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_101745 ?auto_101746 ?auto_101747 ?auto_101751 ?auto_101749 ?auto_101750 ?auto_101748 )
      ( MAKE-3PILE ?auto_101745 ?auto_101746 ?auto_101747 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_101758 - BLOCK
      ?auto_101759 - BLOCK
      ?auto_101760 - BLOCK
      ?auto_101761 - BLOCK
      ?auto_101762 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_101762 ) ( CLEAR ?auto_101761 ) ( ON-TABLE ?auto_101758 ) ( ON ?auto_101759 ?auto_101758 ) ( ON ?auto_101760 ?auto_101759 ) ( ON ?auto_101761 ?auto_101760 ) ( not ( = ?auto_101758 ?auto_101759 ) ) ( not ( = ?auto_101758 ?auto_101760 ) ) ( not ( = ?auto_101758 ?auto_101761 ) ) ( not ( = ?auto_101758 ?auto_101762 ) ) ( not ( = ?auto_101759 ?auto_101760 ) ) ( not ( = ?auto_101759 ?auto_101761 ) ) ( not ( = ?auto_101759 ?auto_101762 ) ) ( not ( = ?auto_101760 ?auto_101761 ) ) ( not ( = ?auto_101760 ?auto_101762 ) ) ( not ( = ?auto_101761 ?auto_101762 ) ) )
    :subtasks
    ( ( !STACK ?auto_101762 ?auto_101761 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_101763 - BLOCK
      ?auto_101764 - BLOCK
      ?auto_101765 - BLOCK
      ?auto_101766 - BLOCK
      ?auto_101767 - BLOCK
    )
    :vars
    (
      ?auto_101768 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_101766 ) ( ON-TABLE ?auto_101763 ) ( ON ?auto_101764 ?auto_101763 ) ( ON ?auto_101765 ?auto_101764 ) ( ON ?auto_101766 ?auto_101765 ) ( not ( = ?auto_101763 ?auto_101764 ) ) ( not ( = ?auto_101763 ?auto_101765 ) ) ( not ( = ?auto_101763 ?auto_101766 ) ) ( not ( = ?auto_101763 ?auto_101767 ) ) ( not ( = ?auto_101764 ?auto_101765 ) ) ( not ( = ?auto_101764 ?auto_101766 ) ) ( not ( = ?auto_101764 ?auto_101767 ) ) ( not ( = ?auto_101765 ?auto_101766 ) ) ( not ( = ?auto_101765 ?auto_101767 ) ) ( not ( = ?auto_101766 ?auto_101767 ) ) ( ON ?auto_101767 ?auto_101768 ) ( CLEAR ?auto_101767 ) ( HAND-EMPTY ) ( not ( = ?auto_101763 ?auto_101768 ) ) ( not ( = ?auto_101764 ?auto_101768 ) ) ( not ( = ?auto_101765 ?auto_101768 ) ) ( not ( = ?auto_101766 ?auto_101768 ) ) ( not ( = ?auto_101767 ?auto_101768 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_101767 ?auto_101768 )
      ( MAKE-5PILE ?auto_101763 ?auto_101764 ?auto_101765 ?auto_101766 ?auto_101767 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_101769 - BLOCK
      ?auto_101770 - BLOCK
      ?auto_101771 - BLOCK
      ?auto_101772 - BLOCK
      ?auto_101773 - BLOCK
    )
    :vars
    (
      ?auto_101774 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_101769 ) ( ON ?auto_101770 ?auto_101769 ) ( ON ?auto_101771 ?auto_101770 ) ( not ( = ?auto_101769 ?auto_101770 ) ) ( not ( = ?auto_101769 ?auto_101771 ) ) ( not ( = ?auto_101769 ?auto_101772 ) ) ( not ( = ?auto_101769 ?auto_101773 ) ) ( not ( = ?auto_101770 ?auto_101771 ) ) ( not ( = ?auto_101770 ?auto_101772 ) ) ( not ( = ?auto_101770 ?auto_101773 ) ) ( not ( = ?auto_101771 ?auto_101772 ) ) ( not ( = ?auto_101771 ?auto_101773 ) ) ( not ( = ?auto_101772 ?auto_101773 ) ) ( ON ?auto_101773 ?auto_101774 ) ( CLEAR ?auto_101773 ) ( not ( = ?auto_101769 ?auto_101774 ) ) ( not ( = ?auto_101770 ?auto_101774 ) ) ( not ( = ?auto_101771 ?auto_101774 ) ) ( not ( = ?auto_101772 ?auto_101774 ) ) ( not ( = ?auto_101773 ?auto_101774 ) ) ( HOLDING ?auto_101772 ) ( CLEAR ?auto_101771 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_101769 ?auto_101770 ?auto_101771 ?auto_101772 )
      ( MAKE-5PILE ?auto_101769 ?auto_101770 ?auto_101771 ?auto_101772 ?auto_101773 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_101775 - BLOCK
      ?auto_101776 - BLOCK
      ?auto_101777 - BLOCK
      ?auto_101778 - BLOCK
      ?auto_101779 - BLOCK
    )
    :vars
    (
      ?auto_101780 - BLOCK
      ?auto_101781 - BLOCK
      ?auto_101782 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_101775 ) ( ON ?auto_101776 ?auto_101775 ) ( ON ?auto_101777 ?auto_101776 ) ( not ( = ?auto_101775 ?auto_101776 ) ) ( not ( = ?auto_101775 ?auto_101777 ) ) ( not ( = ?auto_101775 ?auto_101778 ) ) ( not ( = ?auto_101775 ?auto_101779 ) ) ( not ( = ?auto_101776 ?auto_101777 ) ) ( not ( = ?auto_101776 ?auto_101778 ) ) ( not ( = ?auto_101776 ?auto_101779 ) ) ( not ( = ?auto_101777 ?auto_101778 ) ) ( not ( = ?auto_101777 ?auto_101779 ) ) ( not ( = ?auto_101778 ?auto_101779 ) ) ( ON ?auto_101779 ?auto_101780 ) ( not ( = ?auto_101775 ?auto_101780 ) ) ( not ( = ?auto_101776 ?auto_101780 ) ) ( not ( = ?auto_101777 ?auto_101780 ) ) ( not ( = ?auto_101778 ?auto_101780 ) ) ( not ( = ?auto_101779 ?auto_101780 ) ) ( CLEAR ?auto_101777 ) ( ON ?auto_101778 ?auto_101779 ) ( CLEAR ?auto_101778 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_101781 ) ( ON ?auto_101782 ?auto_101781 ) ( ON ?auto_101780 ?auto_101782 ) ( not ( = ?auto_101781 ?auto_101782 ) ) ( not ( = ?auto_101781 ?auto_101780 ) ) ( not ( = ?auto_101781 ?auto_101779 ) ) ( not ( = ?auto_101781 ?auto_101778 ) ) ( not ( = ?auto_101782 ?auto_101780 ) ) ( not ( = ?auto_101782 ?auto_101779 ) ) ( not ( = ?auto_101782 ?auto_101778 ) ) ( not ( = ?auto_101775 ?auto_101781 ) ) ( not ( = ?auto_101775 ?auto_101782 ) ) ( not ( = ?auto_101776 ?auto_101781 ) ) ( not ( = ?auto_101776 ?auto_101782 ) ) ( not ( = ?auto_101777 ?auto_101781 ) ) ( not ( = ?auto_101777 ?auto_101782 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_101781 ?auto_101782 ?auto_101780 ?auto_101779 )
      ( MAKE-5PILE ?auto_101775 ?auto_101776 ?auto_101777 ?auto_101778 ?auto_101779 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_101783 - BLOCK
      ?auto_101784 - BLOCK
      ?auto_101785 - BLOCK
      ?auto_101786 - BLOCK
      ?auto_101787 - BLOCK
    )
    :vars
    (
      ?auto_101788 - BLOCK
      ?auto_101789 - BLOCK
      ?auto_101790 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_101783 ) ( ON ?auto_101784 ?auto_101783 ) ( not ( = ?auto_101783 ?auto_101784 ) ) ( not ( = ?auto_101783 ?auto_101785 ) ) ( not ( = ?auto_101783 ?auto_101786 ) ) ( not ( = ?auto_101783 ?auto_101787 ) ) ( not ( = ?auto_101784 ?auto_101785 ) ) ( not ( = ?auto_101784 ?auto_101786 ) ) ( not ( = ?auto_101784 ?auto_101787 ) ) ( not ( = ?auto_101785 ?auto_101786 ) ) ( not ( = ?auto_101785 ?auto_101787 ) ) ( not ( = ?auto_101786 ?auto_101787 ) ) ( ON ?auto_101787 ?auto_101788 ) ( not ( = ?auto_101783 ?auto_101788 ) ) ( not ( = ?auto_101784 ?auto_101788 ) ) ( not ( = ?auto_101785 ?auto_101788 ) ) ( not ( = ?auto_101786 ?auto_101788 ) ) ( not ( = ?auto_101787 ?auto_101788 ) ) ( ON ?auto_101786 ?auto_101787 ) ( CLEAR ?auto_101786 ) ( ON-TABLE ?auto_101789 ) ( ON ?auto_101790 ?auto_101789 ) ( ON ?auto_101788 ?auto_101790 ) ( not ( = ?auto_101789 ?auto_101790 ) ) ( not ( = ?auto_101789 ?auto_101788 ) ) ( not ( = ?auto_101789 ?auto_101787 ) ) ( not ( = ?auto_101789 ?auto_101786 ) ) ( not ( = ?auto_101790 ?auto_101788 ) ) ( not ( = ?auto_101790 ?auto_101787 ) ) ( not ( = ?auto_101790 ?auto_101786 ) ) ( not ( = ?auto_101783 ?auto_101789 ) ) ( not ( = ?auto_101783 ?auto_101790 ) ) ( not ( = ?auto_101784 ?auto_101789 ) ) ( not ( = ?auto_101784 ?auto_101790 ) ) ( not ( = ?auto_101785 ?auto_101789 ) ) ( not ( = ?auto_101785 ?auto_101790 ) ) ( HOLDING ?auto_101785 ) ( CLEAR ?auto_101784 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_101783 ?auto_101784 ?auto_101785 )
      ( MAKE-5PILE ?auto_101783 ?auto_101784 ?auto_101785 ?auto_101786 ?auto_101787 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_101791 - BLOCK
      ?auto_101792 - BLOCK
      ?auto_101793 - BLOCK
      ?auto_101794 - BLOCK
      ?auto_101795 - BLOCK
    )
    :vars
    (
      ?auto_101796 - BLOCK
      ?auto_101797 - BLOCK
      ?auto_101798 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_101791 ) ( ON ?auto_101792 ?auto_101791 ) ( not ( = ?auto_101791 ?auto_101792 ) ) ( not ( = ?auto_101791 ?auto_101793 ) ) ( not ( = ?auto_101791 ?auto_101794 ) ) ( not ( = ?auto_101791 ?auto_101795 ) ) ( not ( = ?auto_101792 ?auto_101793 ) ) ( not ( = ?auto_101792 ?auto_101794 ) ) ( not ( = ?auto_101792 ?auto_101795 ) ) ( not ( = ?auto_101793 ?auto_101794 ) ) ( not ( = ?auto_101793 ?auto_101795 ) ) ( not ( = ?auto_101794 ?auto_101795 ) ) ( ON ?auto_101795 ?auto_101796 ) ( not ( = ?auto_101791 ?auto_101796 ) ) ( not ( = ?auto_101792 ?auto_101796 ) ) ( not ( = ?auto_101793 ?auto_101796 ) ) ( not ( = ?auto_101794 ?auto_101796 ) ) ( not ( = ?auto_101795 ?auto_101796 ) ) ( ON ?auto_101794 ?auto_101795 ) ( ON-TABLE ?auto_101797 ) ( ON ?auto_101798 ?auto_101797 ) ( ON ?auto_101796 ?auto_101798 ) ( not ( = ?auto_101797 ?auto_101798 ) ) ( not ( = ?auto_101797 ?auto_101796 ) ) ( not ( = ?auto_101797 ?auto_101795 ) ) ( not ( = ?auto_101797 ?auto_101794 ) ) ( not ( = ?auto_101798 ?auto_101796 ) ) ( not ( = ?auto_101798 ?auto_101795 ) ) ( not ( = ?auto_101798 ?auto_101794 ) ) ( not ( = ?auto_101791 ?auto_101797 ) ) ( not ( = ?auto_101791 ?auto_101798 ) ) ( not ( = ?auto_101792 ?auto_101797 ) ) ( not ( = ?auto_101792 ?auto_101798 ) ) ( not ( = ?auto_101793 ?auto_101797 ) ) ( not ( = ?auto_101793 ?auto_101798 ) ) ( CLEAR ?auto_101792 ) ( ON ?auto_101793 ?auto_101794 ) ( CLEAR ?auto_101793 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_101797 ?auto_101798 ?auto_101796 ?auto_101795 ?auto_101794 )
      ( MAKE-5PILE ?auto_101791 ?auto_101792 ?auto_101793 ?auto_101794 ?auto_101795 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_101799 - BLOCK
      ?auto_101800 - BLOCK
      ?auto_101801 - BLOCK
      ?auto_101802 - BLOCK
      ?auto_101803 - BLOCK
    )
    :vars
    (
      ?auto_101804 - BLOCK
      ?auto_101805 - BLOCK
      ?auto_101806 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_101799 ) ( not ( = ?auto_101799 ?auto_101800 ) ) ( not ( = ?auto_101799 ?auto_101801 ) ) ( not ( = ?auto_101799 ?auto_101802 ) ) ( not ( = ?auto_101799 ?auto_101803 ) ) ( not ( = ?auto_101800 ?auto_101801 ) ) ( not ( = ?auto_101800 ?auto_101802 ) ) ( not ( = ?auto_101800 ?auto_101803 ) ) ( not ( = ?auto_101801 ?auto_101802 ) ) ( not ( = ?auto_101801 ?auto_101803 ) ) ( not ( = ?auto_101802 ?auto_101803 ) ) ( ON ?auto_101803 ?auto_101804 ) ( not ( = ?auto_101799 ?auto_101804 ) ) ( not ( = ?auto_101800 ?auto_101804 ) ) ( not ( = ?auto_101801 ?auto_101804 ) ) ( not ( = ?auto_101802 ?auto_101804 ) ) ( not ( = ?auto_101803 ?auto_101804 ) ) ( ON ?auto_101802 ?auto_101803 ) ( ON-TABLE ?auto_101805 ) ( ON ?auto_101806 ?auto_101805 ) ( ON ?auto_101804 ?auto_101806 ) ( not ( = ?auto_101805 ?auto_101806 ) ) ( not ( = ?auto_101805 ?auto_101804 ) ) ( not ( = ?auto_101805 ?auto_101803 ) ) ( not ( = ?auto_101805 ?auto_101802 ) ) ( not ( = ?auto_101806 ?auto_101804 ) ) ( not ( = ?auto_101806 ?auto_101803 ) ) ( not ( = ?auto_101806 ?auto_101802 ) ) ( not ( = ?auto_101799 ?auto_101805 ) ) ( not ( = ?auto_101799 ?auto_101806 ) ) ( not ( = ?auto_101800 ?auto_101805 ) ) ( not ( = ?auto_101800 ?auto_101806 ) ) ( not ( = ?auto_101801 ?auto_101805 ) ) ( not ( = ?auto_101801 ?auto_101806 ) ) ( ON ?auto_101801 ?auto_101802 ) ( CLEAR ?auto_101801 ) ( HOLDING ?auto_101800 ) ( CLEAR ?auto_101799 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_101799 ?auto_101800 )
      ( MAKE-5PILE ?auto_101799 ?auto_101800 ?auto_101801 ?auto_101802 ?auto_101803 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_101807 - BLOCK
      ?auto_101808 - BLOCK
      ?auto_101809 - BLOCK
      ?auto_101810 - BLOCK
      ?auto_101811 - BLOCK
    )
    :vars
    (
      ?auto_101813 - BLOCK
      ?auto_101812 - BLOCK
      ?auto_101814 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_101807 ) ( not ( = ?auto_101807 ?auto_101808 ) ) ( not ( = ?auto_101807 ?auto_101809 ) ) ( not ( = ?auto_101807 ?auto_101810 ) ) ( not ( = ?auto_101807 ?auto_101811 ) ) ( not ( = ?auto_101808 ?auto_101809 ) ) ( not ( = ?auto_101808 ?auto_101810 ) ) ( not ( = ?auto_101808 ?auto_101811 ) ) ( not ( = ?auto_101809 ?auto_101810 ) ) ( not ( = ?auto_101809 ?auto_101811 ) ) ( not ( = ?auto_101810 ?auto_101811 ) ) ( ON ?auto_101811 ?auto_101813 ) ( not ( = ?auto_101807 ?auto_101813 ) ) ( not ( = ?auto_101808 ?auto_101813 ) ) ( not ( = ?auto_101809 ?auto_101813 ) ) ( not ( = ?auto_101810 ?auto_101813 ) ) ( not ( = ?auto_101811 ?auto_101813 ) ) ( ON ?auto_101810 ?auto_101811 ) ( ON-TABLE ?auto_101812 ) ( ON ?auto_101814 ?auto_101812 ) ( ON ?auto_101813 ?auto_101814 ) ( not ( = ?auto_101812 ?auto_101814 ) ) ( not ( = ?auto_101812 ?auto_101813 ) ) ( not ( = ?auto_101812 ?auto_101811 ) ) ( not ( = ?auto_101812 ?auto_101810 ) ) ( not ( = ?auto_101814 ?auto_101813 ) ) ( not ( = ?auto_101814 ?auto_101811 ) ) ( not ( = ?auto_101814 ?auto_101810 ) ) ( not ( = ?auto_101807 ?auto_101812 ) ) ( not ( = ?auto_101807 ?auto_101814 ) ) ( not ( = ?auto_101808 ?auto_101812 ) ) ( not ( = ?auto_101808 ?auto_101814 ) ) ( not ( = ?auto_101809 ?auto_101812 ) ) ( not ( = ?auto_101809 ?auto_101814 ) ) ( ON ?auto_101809 ?auto_101810 ) ( CLEAR ?auto_101807 ) ( ON ?auto_101808 ?auto_101809 ) ( CLEAR ?auto_101808 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_101812 ?auto_101814 ?auto_101813 ?auto_101811 ?auto_101810 ?auto_101809 )
      ( MAKE-5PILE ?auto_101807 ?auto_101808 ?auto_101809 ?auto_101810 ?auto_101811 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_101815 - BLOCK
      ?auto_101816 - BLOCK
      ?auto_101817 - BLOCK
      ?auto_101818 - BLOCK
      ?auto_101819 - BLOCK
    )
    :vars
    (
      ?auto_101821 - BLOCK
      ?auto_101822 - BLOCK
      ?auto_101820 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_101815 ?auto_101816 ) ) ( not ( = ?auto_101815 ?auto_101817 ) ) ( not ( = ?auto_101815 ?auto_101818 ) ) ( not ( = ?auto_101815 ?auto_101819 ) ) ( not ( = ?auto_101816 ?auto_101817 ) ) ( not ( = ?auto_101816 ?auto_101818 ) ) ( not ( = ?auto_101816 ?auto_101819 ) ) ( not ( = ?auto_101817 ?auto_101818 ) ) ( not ( = ?auto_101817 ?auto_101819 ) ) ( not ( = ?auto_101818 ?auto_101819 ) ) ( ON ?auto_101819 ?auto_101821 ) ( not ( = ?auto_101815 ?auto_101821 ) ) ( not ( = ?auto_101816 ?auto_101821 ) ) ( not ( = ?auto_101817 ?auto_101821 ) ) ( not ( = ?auto_101818 ?auto_101821 ) ) ( not ( = ?auto_101819 ?auto_101821 ) ) ( ON ?auto_101818 ?auto_101819 ) ( ON-TABLE ?auto_101822 ) ( ON ?auto_101820 ?auto_101822 ) ( ON ?auto_101821 ?auto_101820 ) ( not ( = ?auto_101822 ?auto_101820 ) ) ( not ( = ?auto_101822 ?auto_101821 ) ) ( not ( = ?auto_101822 ?auto_101819 ) ) ( not ( = ?auto_101822 ?auto_101818 ) ) ( not ( = ?auto_101820 ?auto_101821 ) ) ( not ( = ?auto_101820 ?auto_101819 ) ) ( not ( = ?auto_101820 ?auto_101818 ) ) ( not ( = ?auto_101815 ?auto_101822 ) ) ( not ( = ?auto_101815 ?auto_101820 ) ) ( not ( = ?auto_101816 ?auto_101822 ) ) ( not ( = ?auto_101816 ?auto_101820 ) ) ( not ( = ?auto_101817 ?auto_101822 ) ) ( not ( = ?auto_101817 ?auto_101820 ) ) ( ON ?auto_101817 ?auto_101818 ) ( ON ?auto_101816 ?auto_101817 ) ( CLEAR ?auto_101816 ) ( HOLDING ?auto_101815 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_101815 )
      ( MAKE-5PILE ?auto_101815 ?auto_101816 ?auto_101817 ?auto_101818 ?auto_101819 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_101823 - BLOCK
      ?auto_101824 - BLOCK
      ?auto_101825 - BLOCK
      ?auto_101826 - BLOCK
      ?auto_101827 - BLOCK
    )
    :vars
    (
      ?auto_101828 - BLOCK
      ?auto_101830 - BLOCK
      ?auto_101829 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_101823 ?auto_101824 ) ) ( not ( = ?auto_101823 ?auto_101825 ) ) ( not ( = ?auto_101823 ?auto_101826 ) ) ( not ( = ?auto_101823 ?auto_101827 ) ) ( not ( = ?auto_101824 ?auto_101825 ) ) ( not ( = ?auto_101824 ?auto_101826 ) ) ( not ( = ?auto_101824 ?auto_101827 ) ) ( not ( = ?auto_101825 ?auto_101826 ) ) ( not ( = ?auto_101825 ?auto_101827 ) ) ( not ( = ?auto_101826 ?auto_101827 ) ) ( ON ?auto_101827 ?auto_101828 ) ( not ( = ?auto_101823 ?auto_101828 ) ) ( not ( = ?auto_101824 ?auto_101828 ) ) ( not ( = ?auto_101825 ?auto_101828 ) ) ( not ( = ?auto_101826 ?auto_101828 ) ) ( not ( = ?auto_101827 ?auto_101828 ) ) ( ON ?auto_101826 ?auto_101827 ) ( ON-TABLE ?auto_101830 ) ( ON ?auto_101829 ?auto_101830 ) ( ON ?auto_101828 ?auto_101829 ) ( not ( = ?auto_101830 ?auto_101829 ) ) ( not ( = ?auto_101830 ?auto_101828 ) ) ( not ( = ?auto_101830 ?auto_101827 ) ) ( not ( = ?auto_101830 ?auto_101826 ) ) ( not ( = ?auto_101829 ?auto_101828 ) ) ( not ( = ?auto_101829 ?auto_101827 ) ) ( not ( = ?auto_101829 ?auto_101826 ) ) ( not ( = ?auto_101823 ?auto_101830 ) ) ( not ( = ?auto_101823 ?auto_101829 ) ) ( not ( = ?auto_101824 ?auto_101830 ) ) ( not ( = ?auto_101824 ?auto_101829 ) ) ( not ( = ?auto_101825 ?auto_101830 ) ) ( not ( = ?auto_101825 ?auto_101829 ) ) ( ON ?auto_101825 ?auto_101826 ) ( ON ?auto_101824 ?auto_101825 ) ( ON ?auto_101823 ?auto_101824 ) ( CLEAR ?auto_101823 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_101830 ?auto_101829 ?auto_101828 ?auto_101827 ?auto_101826 ?auto_101825 ?auto_101824 )
      ( MAKE-5PILE ?auto_101823 ?auto_101824 ?auto_101825 ?auto_101826 ?auto_101827 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_101833 - BLOCK
      ?auto_101834 - BLOCK
    )
    :vars
    (
      ?auto_101835 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_101835 ?auto_101834 ) ( CLEAR ?auto_101835 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_101833 ) ( ON ?auto_101834 ?auto_101833 ) ( not ( = ?auto_101833 ?auto_101834 ) ) ( not ( = ?auto_101833 ?auto_101835 ) ) ( not ( = ?auto_101834 ?auto_101835 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_101835 ?auto_101834 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_101836 - BLOCK
      ?auto_101837 - BLOCK
    )
    :vars
    (
      ?auto_101838 - BLOCK
      ?auto_101839 - BLOCK
      ?auto_101840 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_101838 ?auto_101837 ) ( CLEAR ?auto_101838 ) ( ON-TABLE ?auto_101836 ) ( ON ?auto_101837 ?auto_101836 ) ( not ( = ?auto_101836 ?auto_101837 ) ) ( not ( = ?auto_101836 ?auto_101838 ) ) ( not ( = ?auto_101837 ?auto_101838 ) ) ( HOLDING ?auto_101839 ) ( CLEAR ?auto_101840 ) ( not ( = ?auto_101836 ?auto_101839 ) ) ( not ( = ?auto_101836 ?auto_101840 ) ) ( not ( = ?auto_101837 ?auto_101839 ) ) ( not ( = ?auto_101837 ?auto_101840 ) ) ( not ( = ?auto_101838 ?auto_101839 ) ) ( not ( = ?auto_101838 ?auto_101840 ) ) ( not ( = ?auto_101839 ?auto_101840 ) ) )
    :subtasks
    ( ( !STACK ?auto_101839 ?auto_101840 )
      ( MAKE-2PILE ?auto_101836 ?auto_101837 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_101841 - BLOCK
      ?auto_101842 - BLOCK
    )
    :vars
    (
      ?auto_101843 - BLOCK
      ?auto_101844 - BLOCK
      ?auto_101845 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_101843 ?auto_101842 ) ( ON-TABLE ?auto_101841 ) ( ON ?auto_101842 ?auto_101841 ) ( not ( = ?auto_101841 ?auto_101842 ) ) ( not ( = ?auto_101841 ?auto_101843 ) ) ( not ( = ?auto_101842 ?auto_101843 ) ) ( CLEAR ?auto_101844 ) ( not ( = ?auto_101841 ?auto_101845 ) ) ( not ( = ?auto_101841 ?auto_101844 ) ) ( not ( = ?auto_101842 ?auto_101845 ) ) ( not ( = ?auto_101842 ?auto_101844 ) ) ( not ( = ?auto_101843 ?auto_101845 ) ) ( not ( = ?auto_101843 ?auto_101844 ) ) ( not ( = ?auto_101845 ?auto_101844 ) ) ( ON ?auto_101845 ?auto_101843 ) ( CLEAR ?auto_101845 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_101841 ?auto_101842 ?auto_101843 )
      ( MAKE-2PILE ?auto_101841 ?auto_101842 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_101846 - BLOCK
      ?auto_101847 - BLOCK
    )
    :vars
    (
      ?auto_101849 - BLOCK
      ?auto_101850 - BLOCK
      ?auto_101848 - BLOCK
      ?auto_101853 - BLOCK
      ?auto_101851 - BLOCK
      ?auto_101852 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_101849 ?auto_101847 ) ( ON-TABLE ?auto_101846 ) ( ON ?auto_101847 ?auto_101846 ) ( not ( = ?auto_101846 ?auto_101847 ) ) ( not ( = ?auto_101846 ?auto_101849 ) ) ( not ( = ?auto_101847 ?auto_101849 ) ) ( not ( = ?auto_101846 ?auto_101850 ) ) ( not ( = ?auto_101846 ?auto_101848 ) ) ( not ( = ?auto_101847 ?auto_101850 ) ) ( not ( = ?auto_101847 ?auto_101848 ) ) ( not ( = ?auto_101849 ?auto_101850 ) ) ( not ( = ?auto_101849 ?auto_101848 ) ) ( not ( = ?auto_101850 ?auto_101848 ) ) ( ON ?auto_101850 ?auto_101849 ) ( CLEAR ?auto_101850 ) ( HOLDING ?auto_101848 ) ( CLEAR ?auto_101853 ) ( ON-TABLE ?auto_101851 ) ( ON ?auto_101852 ?auto_101851 ) ( ON ?auto_101853 ?auto_101852 ) ( not ( = ?auto_101851 ?auto_101852 ) ) ( not ( = ?auto_101851 ?auto_101853 ) ) ( not ( = ?auto_101851 ?auto_101848 ) ) ( not ( = ?auto_101852 ?auto_101853 ) ) ( not ( = ?auto_101852 ?auto_101848 ) ) ( not ( = ?auto_101853 ?auto_101848 ) ) ( not ( = ?auto_101846 ?auto_101853 ) ) ( not ( = ?auto_101846 ?auto_101851 ) ) ( not ( = ?auto_101846 ?auto_101852 ) ) ( not ( = ?auto_101847 ?auto_101853 ) ) ( not ( = ?auto_101847 ?auto_101851 ) ) ( not ( = ?auto_101847 ?auto_101852 ) ) ( not ( = ?auto_101849 ?auto_101853 ) ) ( not ( = ?auto_101849 ?auto_101851 ) ) ( not ( = ?auto_101849 ?auto_101852 ) ) ( not ( = ?auto_101850 ?auto_101853 ) ) ( not ( = ?auto_101850 ?auto_101851 ) ) ( not ( = ?auto_101850 ?auto_101852 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_101851 ?auto_101852 ?auto_101853 ?auto_101848 )
      ( MAKE-2PILE ?auto_101846 ?auto_101847 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_101854 - BLOCK
      ?auto_101855 - BLOCK
    )
    :vars
    (
      ?auto_101857 - BLOCK
      ?auto_101856 - BLOCK
      ?auto_101859 - BLOCK
      ?auto_101860 - BLOCK
      ?auto_101861 - BLOCK
      ?auto_101858 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_101857 ?auto_101855 ) ( ON-TABLE ?auto_101854 ) ( ON ?auto_101855 ?auto_101854 ) ( not ( = ?auto_101854 ?auto_101855 ) ) ( not ( = ?auto_101854 ?auto_101857 ) ) ( not ( = ?auto_101855 ?auto_101857 ) ) ( not ( = ?auto_101854 ?auto_101856 ) ) ( not ( = ?auto_101854 ?auto_101859 ) ) ( not ( = ?auto_101855 ?auto_101856 ) ) ( not ( = ?auto_101855 ?auto_101859 ) ) ( not ( = ?auto_101857 ?auto_101856 ) ) ( not ( = ?auto_101857 ?auto_101859 ) ) ( not ( = ?auto_101856 ?auto_101859 ) ) ( ON ?auto_101856 ?auto_101857 ) ( CLEAR ?auto_101860 ) ( ON-TABLE ?auto_101861 ) ( ON ?auto_101858 ?auto_101861 ) ( ON ?auto_101860 ?auto_101858 ) ( not ( = ?auto_101861 ?auto_101858 ) ) ( not ( = ?auto_101861 ?auto_101860 ) ) ( not ( = ?auto_101861 ?auto_101859 ) ) ( not ( = ?auto_101858 ?auto_101860 ) ) ( not ( = ?auto_101858 ?auto_101859 ) ) ( not ( = ?auto_101860 ?auto_101859 ) ) ( not ( = ?auto_101854 ?auto_101860 ) ) ( not ( = ?auto_101854 ?auto_101861 ) ) ( not ( = ?auto_101854 ?auto_101858 ) ) ( not ( = ?auto_101855 ?auto_101860 ) ) ( not ( = ?auto_101855 ?auto_101861 ) ) ( not ( = ?auto_101855 ?auto_101858 ) ) ( not ( = ?auto_101857 ?auto_101860 ) ) ( not ( = ?auto_101857 ?auto_101861 ) ) ( not ( = ?auto_101857 ?auto_101858 ) ) ( not ( = ?auto_101856 ?auto_101860 ) ) ( not ( = ?auto_101856 ?auto_101861 ) ) ( not ( = ?auto_101856 ?auto_101858 ) ) ( ON ?auto_101859 ?auto_101856 ) ( CLEAR ?auto_101859 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_101854 ?auto_101855 ?auto_101857 ?auto_101856 )
      ( MAKE-2PILE ?auto_101854 ?auto_101855 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_101862 - BLOCK
      ?auto_101863 - BLOCK
    )
    :vars
    (
      ?auto_101865 - BLOCK
      ?auto_101868 - BLOCK
      ?auto_101864 - BLOCK
      ?auto_101867 - BLOCK
      ?auto_101866 - BLOCK
      ?auto_101869 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_101865 ?auto_101863 ) ( ON-TABLE ?auto_101862 ) ( ON ?auto_101863 ?auto_101862 ) ( not ( = ?auto_101862 ?auto_101863 ) ) ( not ( = ?auto_101862 ?auto_101865 ) ) ( not ( = ?auto_101863 ?auto_101865 ) ) ( not ( = ?auto_101862 ?auto_101868 ) ) ( not ( = ?auto_101862 ?auto_101864 ) ) ( not ( = ?auto_101863 ?auto_101868 ) ) ( not ( = ?auto_101863 ?auto_101864 ) ) ( not ( = ?auto_101865 ?auto_101868 ) ) ( not ( = ?auto_101865 ?auto_101864 ) ) ( not ( = ?auto_101868 ?auto_101864 ) ) ( ON ?auto_101868 ?auto_101865 ) ( ON-TABLE ?auto_101867 ) ( ON ?auto_101866 ?auto_101867 ) ( not ( = ?auto_101867 ?auto_101866 ) ) ( not ( = ?auto_101867 ?auto_101869 ) ) ( not ( = ?auto_101867 ?auto_101864 ) ) ( not ( = ?auto_101866 ?auto_101869 ) ) ( not ( = ?auto_101866 ?auto_101864 ) ) ( not ( = ?auto_101869 ?auto_101864 ) ) ( not ( = ?auto_101862 ?auto_101869 ) ) ( not ( = ?auto_101862 ?auto_101867 ) ) ( not ( = ?auto_101862 ?auto_101866 ) ) ( not ( = ?auto_101863 ?auto_101869 ) ) ( not ( = ?auto_101863 ?auto_101867 ) ) ( not ( = ?auto_101863 ?auto_101866 ) ) ( not ( = ?auto_101865 ?auto_101869 ) ) ( not ( = ?auto_101865 ?auto_101867 ) ) ( not ( = ?auto_101865 ?auto_101866 ) ) ( not ( = ?auto_101868 ?auto_101869 ) ) ( not ( = ?auto_101868 ?auto_101867 ) ) ( not ( = ?auto_101868 ?auto_101866 ) ) ( ON ?auto_101864 ?auto_101868 ) ( CLEAR ?auto_101864 ) ( HOLDING ?auto_101869 ) ( CLEAR ?auto_101866 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_101867 ?auto_101866 ?auto_101869 )
      ( MAKE-2PILE ?auto_101862 ?auto_101863 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_101870 - BLOCK
      ?auto_101871 - BLOCK
    )
    :vars
    (
      ?auto_101877 - BLOCK
      ?auto_101873 - BLOCK
      ?auto_101876 - BLOCK
      ?auto_101874 - BLOCK
      ?auto_101875 - BLOCK
      ?auto_101872 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_101877 ?auto_101871 ) ( ON-TABLE ?auto_101870 ) ( ON ?auto_101871 ?auto_101870 ) ( not ( = ?auto_101870 ?auto_101871 ) ) ( not ( = ?auto_101870 ?auto_101877 ) ) ( not ( = ?auto_101871 ?auto_101877 ) ) ( not ( = ?auto_101870 ?auto_101873 ) ) ( not ( = ?auto_101870 ?auto_101876 ) ) ( not ( = ?auto_101871 ?auto_101873 ) ) ( not ( = ?auto_101871 ?auto_101876 ) ) ( not ( = ?auto_101877 ?auto_101873 ) ) ( not ( = ?auto_101877 ?auto_101876 ) ) ( not ( = ?auto_101873 ?auto_101876 ) ) ( ON ?auto_101873 ?auto_101877 ) ( ON-TABLE ?auto_101874 ) ( ON ?auto_101875 ?auto_101874 ) ( not ( = ?auto_101874 ?auto_101875 ) ) ( not ( = ?auto_101874 ?auto_101872 ) ) ( not ( = ?auto_101874 ?auto_101876 ) ) ( not ( = ?auto_101875 ?auto_101872 ) ) ( not ( = ?auto_101875 ?auto_101876 ) ) ( not ( = ?auto_101872 ?auto_101876 ) ) ( not ( = ?auto_101870 ?auto_101872 ) ) ( not ( = ?auto_101870 ?auto_101874 ) ) ( not ( = ?auto_101870 ?auto_101875 ) ) ( not ( = ?auto_101871 ?auto_101872 ) ) ( not ( = ?auto_101871 ?auto_101874 ) ) ( not ( = ?auto_101871 ?auto_101875 ) ) ( not ( = ?auto_101877 ?auto_101872 ) ) ( not ( = ?auto_101877 ?auto_101874 ) ) ( not ( = ?auto_101877 ?auto_101875 ) ) ( not ( = ?auto_101873 ?auto_101872 ) ) ( not ( = ?auto_101873 ?auto_101874 ) ) ( not ( = ?auto_101873 ?auto_101875 ) ) ( ON ?auto_101876 ?auto_101873 ) ( CLEAR ?auto_101875 ) ( ON ?auto_101872 ?auto_101876 ) ( CLEAR ?auto_101872 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_101870 ?auto_101871 ?auto_101877 ?auto_101873 ?auto_101876 )
      ( MAKE-2PILE ?auto_101870 ?auto_101871 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_101878 - BLOCK
      ?auto_101879 - BLOCK
    )
    :vars
    (
      ?auto_101881 - BLOCK
      ?auto_101880 - BLOCK
      ?auto_101882 - BLOCK
      ?auto_101885 - BLOCK
      ?auto_101883 - BLOCK
      ?auto_101884 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_101881 ?auto_101879 ) ( ON-TABLE ?auto_101878 ) ( ON ?auto_101879 ?auto_101878 ) ( not ( = ?auto_101878 ?auto_101879 ) ) ( not ( = ?auto_101878 ?auto_101881 ) ) ( not ( = ?auto_101879 ?auto_101881 ) ) ( not ( = ?auto_101878 ?auto_101880 ) ) ( not ( = ?auto_101878 ?auto_101882 ) ) ( not ( = ?auto_101879 ?auto_101880 ) ) ( not ( = ?auto_101879 ?auto_101882 ) ) ( not ( = ?auto_101881 ?auto_101880 ) ) ( not ( = ?auto_101881 ?auto_101882 ) ) ( not ( = ?auto_101880 ?auto_101882 ) ) ( ON ?auto_101880 ?auto_101881 ) ( ON-TABLE ?auto_101885 ) ( not ( = ?auto_101885 ?auto_101883 ) ) ( not ( = ?auto_101885 ?auto_101884 ) ) ( not ( = ?auto_101885 ?auto_101882 ) ) ( not ( = ?auto_101883 ?auto_101884 ) ) ( not ( = ?auto_101883 ?auto_101882 ) ) ( not ( = ?auto_101884 ?auto_101882 ) ) ( not ( = ?auto_101878 ?auto_101884 ) ) ( not ( = ?auto_101878 ?auto_101885 ) ) ( not ( = ?auto_101878 ?auto_101883 ) ) ( not ( = ?auto_101879 ?auto_101884 ) ) ( not ( = ?auto_101879 ?auto_101885 ) ) ( not ( = ?auto_101879 ?auto_101883 ) ) ( not ( = ?auto_101881 ?auto_101884 ) ) ( not ( = ?auto_101881 ?auto_101885 ) ) ( not ( = ?auto_101881 ?auto_101883 ) ) ( not ( = ?auto_101880 ?auto_101884 ) ) ( not ( = ?auto_101880 ?auto_101885 ) ) ( not ( = ?auto_101880 ?auto_101883 ) ) ( ON ?auto_101882 ?auto_101880 ) ( ON ?auto_101884 ?auto_101882 ) ( CLEAR ?auto_101884 ) ( HOLDING ?auto_101883 ) ( CLEAR ?auto_101885 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_101885 ?auto_101883 )
      ( MAKE-2PILE ?auto_101878 ?auto_101879 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_101886 - BLOCK
      ?auto_101887 - BLOCK
    )
    :vars
    (
      ?auto_101889 - BLOCK
      ?auto_101891 - BLOCK
      ?auto_101892 - BLOCK
      ?auto_101890 - BLOCK
      ?auto_101893 - BLOCK
      ?auto_101888 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_101889 ?auto_101887 ) ( ON-TABLE ?auto_101886 ) ( ON ?auto_101887 ?auto_101886 ) ( not ( = ?auto_101886 ?auto_101887 ) ) ( not ( = ?auto_101886 ?auto_101889 ) ) ( not ( = ?auto_101887 ?auto_101889 ) ) ( not ( = ?auto_101886 ?auto_101891 ) ) ( not ( = ?auto_101886 ?auto_101892 ) ) ( not ( = ?auto_101887 ?auto_101891 ) ) ( not ( = ?auto_101887 ?auto_101892 ) ) ( not ( = ?auto_101889 ?auto_101891 ) ) ( not ( = ?auto_101889 ?auto_101892 ) ) ( not ( = ?auto_101891 ?auto_101892 ) ) ( ON ?auto_101891 ?auto_101889 ) ( ON-TABLE ?auto_101890 ) ( not ( = ?auto_101890 ?auto_101893 ) ) ( not ( = ?auto_101890 ?auto_101888 ) ) ( not ( = ?auto_101890 ?auto_101892 ) ) ( not ( = ?auto_101893 ?auto_101888 ) ) ( not ( = ?auto_101893 ?auto_101892 ) ) ( not ( = ?auto_101888 ?auto_101892 ) ) ( not ( = ?auto_101886 ?auto_101888 ) ) ( not ( = ?auto_101886 ?auto_101890 ) ) ( not ( = ?auto_101886 ?auto_101893 ) ) ( not ( = ?auto_101887 ?auto_101888 ) ) ( not ( = ?auto_101887 ?auto_101890 ) ) ( not ( = ?auto_101887 ?auto_101893 ) ) ( not ( = ?auto_101889 ?auto_101888 ) ) ( not ( = ?auto_101889 ?auto_101890 ) ) ( not ( = ?auto_101889 ?auto_101893 ) ) ( not ( = ?auto_101891 ?auto_101888 ) ) ( not ( = ?auto_101891 ?auto_101890 ) ) ( not ( = ?auto_101891 ?auto_101893 ) ) ( ON ?auto_101892 ?auto_101891 ) ( ON ?auto_101888 ?auto_101892 ) ( CLEAR ?auto_101890 ) ( ON ?auto_101893 ?auto_101888 ) ( CLEAR ?auto_101893 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_101886 ?auto_101887 ?auto_101889 ?auto_101891 ?auto_101892 ?auto_101888 )
      ( MAKE-2PILE ?auto_101886 ?auto_101887 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_101894 - BLOCK
      ?auto_101895 - BLOCK
    )
    :vars
    (
      ?auto_101899 - BLOCK
      ?auto_101900 - BLOCK
      ?auto_101898 - BLOCK
      ?auto_101897 - BLOCK
      ?auto_101901 - BLOCK
      ?auto_101896 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_101899 ?auto_101895 ) ( ON-TABLE ?auto_101894 ) ( ON ?auto_101895 ?auto_101894 ) ( not ( = ?auto_101894 ?auto_101895 ) ) ( not ( = ?auto_101894 ?auto_101899 ) ) ( not ( = ?auto_101895 ?auto_101899 ) ) ( not ( = ?auto_101894 ?auto_101900 ) ) ( not ( = ?auto_101894 ?auto_101898 ) ) ( not ( = ?auto_101895 ?auto_101900 ) ) ( not ( = ?auto_101895 ?auto_101898 ) ) ( not ( = ?auto_101899 ?auto_101900 ) ) ( not ( = ?auto_101899 ?auto_101898 ) ) ( not ( = ?auto_101900 ?auto_101898 ) ) ( ON ?auto_101900 ?auto_101899 ) ( not ( = ?auto_101897 ?auto_101901 ) ) ( not ( = ?auto_101897 ?auto_101896 ) ) ( not ( = ?auto_101897 ?auto_101898 ) ) ( not ( = ?auto_101901 ?auto_101896 ) ) ( not ( = ?auto_101901 ?auto_101898 ) ) ( not ( = ?auto_101896 ?auto_101898 ) ) ( not ( = ?auto_101894 ?auto_101896 ) ) ( not ( = ?auto_101894 ?auto_101897 ) ) ( not ( = ?auto_101894 ?auto_101901 ) ) ( not ( = ?auto_101895 ?auto_101896 ) ) ( not ( = ?auto_101895 ?auto_101897 ) ) ( not ( = ?auto_101895 ?auto_101901 ) ) ( not ( = ?auto_101899 ?auto_101896 ) ) ( not ( = ?auto_101899 ?auto_101897 ) ) ( not ( = ?auto_101899 ?auto_101901 ) ) ( not ( = ?auto_101900 ?auto_101896 ) ) ( not ( = ?auto_101900 ?auto_101897 ) ) ( not ( = ?auto_101900 ?auto_101901 ) ) ( ON ?auto_101898 ?auto_101900 ) ( ON ?auto_101896 ?auto_101898 ) ( ON ?auto_101901 ?auto_101896 ) ( CLEAR ?auto_101901 ) ( HOLDING ?auto_101897 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_101897 )
      ( MAKE-2PILE ?auto_101894 ?auto_101895 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_101902 - BLOCK
      ?auto_101903 - BLOCK
    )
    :vars
    (
      ?auto_101905 - BLOCK
      ?auto_101904 - BLOCK
      ?auto_101907 - BLOCK
      ?auto_101906 - BLOCK
      ?auto_101908 - BLOCK
      ?auto_101909 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_101905 ?auto_101903 ) ( ON-TABLE ?auto_101902 ) ( ON ?auto_101903 ?auto_101902 ) ( not ( = ?auto_101902 ?auto_101903 ) ) ( not ( = ?auto_101902 ?auto_101905 ) ) ( not ( = ?auto_101903 ?auto_101905 ) ) ( not ( = ?auto_101902 ?auto_101904 ) ) ( not ( = ?auto_101902 ?auto_101907 ) ) ( not ( = ?auto_101903 ?auto_101904 ) ) ( not ( = ?auto_101903 ?auto_101907 ) ) ( not ( = ?auto_101905 ?auto_101904 ) ) ( not ( = ?auto_101905 ?auto_101907 ) ) ( not ( = ?auto_101904 ?auto_101907 ) ) ( ON ?auto_101904 ?auto_101905 ) ( not ( = ?auto_101906 ?auto_101908 ) ) ( not ( = ?auto_101906 ?auto_101909 ) ) ( not ( = ?auto_101906 ?auto_101907 ) ) ( not ( = ?auto_101908 ?auto_101909 ) ) ( not ( = ?auto_101908 ?auto_101907 ) ) ( not ( = ?auto_101909 ?auto_101907 ) ) ( not ( = ?auto_101902 ?auto_101909 ) ) ( not ( = ?auto_101902 ?auto_101906 ) ) ( not ( = ?auto_101902 ?auto_101908 ) ) ( not ( = ?auto_101903 ?auto_101909 ) ) ( not ( = ?auto_101903 ?auto_101906 ) ) ( not ( = ?auto_101903 ?auto_101908 ) ) ( not ( = ?auto_101905 ?auto_101909 ) ) ( not ( = ?auto_101905 ?auto_101906 ) ) ( not ( = ?auto_101905 ?auto_101908 ) ) ( not ( = ?auto_101904 ?auto_101909 ) ) ( not ( = ?auto_101904 ?auto_101906 ) ) ( not ( = ?auto_101904 ?auto_101908 ) ) ( ON ?auto_101907 ?auto_101904 ) ( ON ?auto_101909 ?auto_101907 ) ( ON ?auto_101908 ?auto_101909 ) ( ON ?auto_101906 ?auto_101908 ) ( CLEAR ?auto_101906 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_101902 ?auto_101903 ?auto_101905 ?auto_101904 ?auto_101907 ?auto_101909 ?auto_101908 )
      ( MAKE-2PILE ?auto_101902 ?auto_101903 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_101916 - BLOCK
      ?auto_101917 - BLOCK
      ?auto_101918 - BLOCK
      ?auto_101919 - BLOCK
      ?auto_101920 - BLOCK
      ?auto_101921 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_101921 ) ( CLEAR ?auto_101920 ) ( ON-TABLE ?auto_101916 ) ( ON ?auto_101917 ?auto_101916 ) ( ON ?auto_101918 ?auto_101917 ) ( ON ?auto_101919 ?auto_101918 ) ( ON ?auto_101920 ?auto_101919 ) ( not ( = ?auto_101916 ?auto_101917 ) ) ( not ( = ?auto_101916 ?auto_101918 ) ) ( not ( = ?auto_101916 ?auto_101919 ) ) ( not ( = ?auto_101916 ?auto_101920 ) ) ( not ( = ?auto_101916 ?auto_101921 ) ) ( not ( = ?auto_101917 ?auto_101918 ) ) ( not ( = ?auto_101917 ?auto_101919 ) ) ( not ( = ?auto_101917 ?auto_101920 ) ) ( not ( = ?auto_101917 ?auto_101921 ) ) ( not ( = ?auto_101918 ?auto_101919 ) ) ( not ( = ?auto_101918 ?auto_101920 ) ) ( not ( = ?auto_101918 ?auto_101921 ) ) ( not ( = ?auto_101919 ?auto_101920 ) ) ( not ( = ?auto_101919 ?auto_101921 ) ) ( not ( = ?auto_101920 ?auto_101921 ) ) )
    :subtasks
    ( ( !STACK ?auto_101921 ?auto_101920 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_101922 - BLOCK
      ?auto_101923 - BLOCK
      ?auto_101924 - BLOCK
      ?auto_101925 - BLOCK
      ?auto_101926 - BLOCK
      ?auto_101927 - BLOCK
    )
    :vars
    (
      ?auto_101928 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_101926 ) ( ON-TABLE ?auto_101922 ) ( ON ?auto_101923 ?auto_101922 ) ( ON ?auto_101924 ?auto_101923 ) ( ON ?auto_101925 ?auto_101924 ) ( ON ?auto_101926 ?auto_101925 ) ( not ( = ?auto_101922 ?auto_101923 ) ) ( not ( = ?auto_101922 ?auto_101924 ) ) ( not ( = ?auto_101922 ?auto_101925 ) ) ( not ( = ?auto_101922 ?auto_101926 ) ) ( not ( = ?auto_101922 ?auto_101927 ) ) ( not ( = ?auto_101923 ?auto_101924 ) ) ( not ( = ?auto_101923 ?auto_101925 ) ) ( not ( = ?auto_101923 ?auto_101926 ) ) ( not ( = ?auto_101923 ?auto_101927 ) ) ( not ( = ?auto_101924 ?auto_101925 ) ) ( not ( = ?auto_101924 ?auto_101926 ) ) ( not ( = ?auto_101924 ?auto_101927 ) ) ( not ( = ?auto_101925 ?auto_101926 ) ) ( not ( = ?auto_101925 ?auto_101927 ) ) ( not ( = ?auto_101926 ?auto_101927 ) ) ( ON ?auto_101927 ?auto_101928 ) ( CLEAR ?auto_101927 ) ( HAND-EMPTY ) ( not ( = ?auto_101922 ?auto_101928 ) ) ( not ( = ?auto_101923 ?auto_101928 ) ) ( not ( = ?auto_101924 ?auto_101928 ) ) ( not ( = ?auto_101925 ?auto_101928 ) ) ( not ( = ?auto_101926 ?auto_101928 ) ) ( not ( = ?auto_101927 ?auto_101928 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_101927 ?auto_101928 )
      ( MAKE-6PILE ?auto_101922 ?auto_101923 ?auto_101924 ?auto_101925 ?auto_101926 ?auto_101927 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_101929 - BLOCK
      ?auto_101930 - BLOCK
      ?auto_101931 - BLOCK
      ?auto_101932 - BLOCK
      ?auto_101933 - BLOCK
      ?auto_101934 - BLOCK
    )
    :vars
    (
      ?auto_101935 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_101929 ) ( ON ?auto_101930 ?auto_101929 ) ( ON ?auto_101931 ?auto_101930 ) ( ON ?auto_101932 ?auto_101931 ) ( not ( = ?auto_101929 ?auto_101930 ) ) ( not ( = ?auto_101929 ?auto_101931 ) ) ( not ( = ?auto_101929 ?auto_101932 ) ) ( not ( = ?auto_101929 ?auto_101933 ) ) ( not ( = ?auto_101929 ?auto_101934 ) ) ( not ( = ?auto_101930 ?auto_101931 ) ) ( not ( = ?auto_101930 ?auto_101932 ) ) ( not ( = ?auto_101930 ?auto_101933 ) ) ( not ( = ?auto_101930 ?auto_101934 ) ) ( not ( = ?auto_101931 ?auto_101932 ) ) ( not ( = ?auto_101931 ?auto_101933 ) ) ( not ( = ?auto_101931 ?auto_101934 ) ) ( not ( = ?auto_101932 ?auto_101933 ) ) ( not ( = ?auto_101932 ?auto_101934 ) ) ( not ( = ?auto_101933 ?auto_101934 ) ) ( ON ?auto_101934 ?auto_101935 ) ( CLEAR ?auto_101934 ) ( not ( = ?auto_101929 ?auto_101935 ) ) ( not ( = ?auto_101930 ?auto_101935 ) ) ( not ( = ?auto_101931 ?auto_101935 ) ) ( not ( = ?auto_101932 ?auto_101935 ) ) ( not ( = ?auto_101933 ?auto_101935 ) ) ( not ( = ?auto_101934 ?auto_101935 ) ) ( HOLDING ?auto_101933 ) ( CLEAR ?auto_101932 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_101929 ?auto_101930 ?auto_101931 ?auto_101932 ?auto_101933 )
      ( MAKE-6PILE ?auto_101929 ?auto_101930 ?auto_101931 ?auto_101932 ?auto_101933 ?auto_101934 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_101936 - BLOCK
      ?auto_101937 - BLOCK
      ?auto_101938 - BLOCK
      ?auto_101939 - BLOCK
      ?auto_101940 - BLOCK
      ?auto_101941 - BLOCK
    )
    :vars
    (
      ?auto_101942 - BLOCK
      ?auto_101943 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_101936 ) ( ON ?auto_101937 ?auto_101936 ) ( ON ?auto_101938 ?auto_101937 ) ( ON ?auto_101939 ?auto_101938 ) ( not ( = ?auto_101936 ?auto_101937 ) ) ( not ( = ?auto_101936 ?auto_101938 ) ) ( not ( = ?auto_101936 ?auto_101939 ) ) ( not ( = ?auto_101936 ?auto_101940 ) ) ( not ( = ?auto_101936 ?auto_101941 ) ) ( not ( = ?auto_101937 ?auto_101938 ) ) ( not ( = ?auto_101937 ?auto_101939 ) ) ( not ( = ?auto_101937 ?auto_101940 ) ) ( not ( = ?auto_101937 ?auto_101941 ) ) ( not ( = ?auto_101938 ?auto_101939 ) ) ( not ( = ?auto_101938 ?auto_101940 ) ) ( not ( = ?auto_101938 ?auto_101941 ) ) ( not ( = ?auto_101939 ?auto_101940 ) ) ( not ( = ?auto_101939 ?auto_101941 ) ) ( not ( = ?auto_101940 ?auto_101941 ) ) ( ON ?auto_101941 ?auto_101942 ) ( not ( = ?auto_101936 ?auto_101942 ) ) ( not ( = ?auto_101937 ?auto_101942 ) ) ( not ( = ?auto_101938 ?auto_101942 ) ) ( not ( = ?auto_101939 ?auto_101942 ) ) ( not ( = ?auto_101940 ?auto_101942 ) ) ( not ( = ?auto_101941 ?auto_101942 ) ) ( CLEAR ?auto_101939 ) ( ON ?auto_101940 ?auto_101941 ) ( CLEAR ?auto_101940 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_101943 ) ( ON ?auto_101942 ?auto_101943 ) ( not ( = ?auto_101943 ?auto_101942 ) ) ( not ( = ?auto_101943 ?auto_101941 ) ) ( not ( = ?auto_101943 ?auto_101940 ) ) ( not ( = ?auto_101936 ?auto_101943 ) ) ( not ( = ?auto_101937 ?auto_101943 ) ) ( not ( = ?auto_101938 ?auto_101943 ) ) ( not ( = ?auto_101939 ?auto_101943 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_101943 ?auto_101942 ?auto_101941 )
      ( MAKE-6PILE ?auto_101936 ?auto_101937 ?auto_101938 ?auto_101939 ?auto_101940 ?auto_101941 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_101944 - BLOCK
      ?auto_101945 - BLOCK
      ?auto_101946 - BLOCK
      ?auto_101947 - BLOCK
      ?auto_101948 - BLOCK
      ?auto_101949 - BLOCK
    )
    :vars
    (
      ?auto_101951 - BLOCK
      ?auto_101950 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_101944 ) ( ON ?auto_101945 ?auto_101944 ) ( ON ?auto_101946 ?auto_101945 ) ( not ( = ?auto_101944 ?auto_101945 ) ) ( not ( = ?auto_101944 ?auto_101946 ) ) ( not ( = ?auto_101944 ?auto_101947 ) ) ( not ( = ?auto_101944 ?auto_101948 ) ) ( not ( = ?auto_101944 ?auto_101949 ) ) ( not ( = ?auto_101945 ?auto_101946 ) ) ( not ( = ?auto_101945 ?auto_101947 ) ) ( not ( = ?auto_101945 ?auto_101948 ) ) ( not ( = ?auto_101945 ?auto_101949 ) ) ( not ( = ?auto_101946 ?auto_101947 ) ) ( not ( = ?auto_101946 ?auto_101948 ) ) ( not ( = ?auto_101946 ?auto_101949 ) ) ( not ( = ?auto_101947 ?auto_101948 ) ) ( not ( = ?auto_101947 ?auto_101949 ) ) ( not ( = ?auto_101948 ?auto_101949 ) ) ( ON ?auto_101949 ?auto_101951 ) ( not ( = ?auto_101944 ?auto_101951 ) ) ( not ( = ?auto_101945 ?auto_101951 ) ) ( not ( = ?auto_101946 ?auto_101951 ) ) ( not ( = ?auto_101947 ?auto_101951 ) ) ( not ( = ?auto_101948 ?auto_101951 ) ) ( not ( = ?auto_101949 ?auto_101951 ) ) ( ON ?auto_101948 ?auto_101949 ) ( CLEAR ?auto_101948 ) ( ON-TABLE ?auto_101950 ) ( ON ?auto_101951 ?auto_101950 ) ( not ( = ?auto_101950 ?auto_101951 ) ) ( not ( = ?auto_101950 ?auto_101949 ) ) ( not ( = ?auto_101950 ?auto_101948 ) ) ( not ( = ?auto_101944 ?auto_101950 ) ) ( not ( = ?auto_101945 ?auto_101950 ) ) ( not ( = ?auto_101946 ?auto_101950 ) ) ( not ( = ?auto_101947 ?auto_101950 ) ) ( HOLDING ?auto_101947 ) ( CLEAR ?auto_101946 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_101944 ?auto_101945 ?auto_101946 ?auto_101947 )
      ( MAKE-6PILE ?auto_101944 ?auto_101945 ?auto_101946 ?auto_101947 ?auto_101948 ?auto_101949 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_101952 - BLOCK
      ?auto_101953 - BLOCK
      ?auto_101954 - BLOCK
      ?auto_101955 - BLOCK
      ?auto_101956 - BLOCK
      ?auto_101957 - BLOCK
    )
    :vars
    (
      ?auto_101958 - BLOCK
      ?auto_101959 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_101952 ) ( ON ?auto_101953 ?auto_101952 ) ( ON ?auto_101954 ?auto_101953 ) ( not ( = ?auto_101952 ?auto_101953 ) ) ( not ( = ?auto_101952 ?auto_101954 ) ) ( not ( = ?auto_101952 ?auto_101955 ) ) ( not ( = ?auto_101952 ?auto_101956 ) ) ( not ( = ?auto_101952 ?auto_101957 ) ) ( not ( = ?auto_101953 ?auto_101954 ) ) ( not ( = ?auto_101953 ?auto_101955 ) ) ( not ( = ?auto_101953 ?auto_101956 ) ) ( not ( = ?auto_101953 ?auto_101957 ) ) ( not ( = ?auto_101954 ?auto_101955 ) ) ( not ( = ?auto_101954 ?auto_101956 ) ) ( not ( = ?auto_101954 ?auto_101957 ) ) ( not ( = ?auto_101955 ?auto_101956 ) ) ( not ( = ?auto_101955 ?auto_101957 ) ) ( not ( = ?auto_101956 ?auto_101957 ) ) ( ON ?auto_101957 ?auto_101958 ) ( not ( = ?auto_101952 ?auto_101958 ) ) ( not ( = ?auto_101953 ?auto_101958 ) ) ( not ( = ?auto_101954 ?auto_101958 ) ) ( not ( = ?auto_101955 ?auto_101958 ) ) ( not ( = ?auto_101956 ?auto_101958 ) ) ( not ( = ?auto_101957 ?auto_101958 ) ) ( ON ?auto_101956 ?auto_101957 ) ( ON-TABLE ?auto_101959 ) ( ON ?auto_101958 ?auto_101959 ) ( not ( = ?auto_101959 ?auto_101958 ) ) ( not ( = ?auto_101959 ?auto_101957 ) ) ( not ( = ?auto_101959 ?auto_101956 ) ) ( not ( = ?auto_101952 ?auto_101959 ) ) ( not ( = ?auto_101953 ?auto_101959 ) ) ( not ( = ?auto_101954 ?auto_101959 ) ) ( not ( = ?auto_101955 ?auto_101959 ) ) ( CLEAR ?auto_101954 ) ( ON ?auto_101955 ?auto_101956 ) ( CLEAR ?auto_101955 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_101959 ?auto_101958 ?auto_101957 ?auto_101956 )
      ( MAKE-6PILE ?auto_101952 ?auto_101953 ?auto_101954 ?auto_101955 ?auto_101956 ?auto_101957 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_101960 - BLOCK
      ?auto_101961 - BLOCK
      ?auto_101962 - BLOCK
      ?auto_101963 - BLOCK
      ?auto_101964 - BLOCK
      ?auto_101965 - BLOCK
    )
    :vars
    (
      ?auto_101967 - BLOCK
      ?auto_101966 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_101960 ) ( ON ?auto_101961 ?auto_101960 ) ( not ( = ?auto_101960 ?auto_101961 ) ) ( not ( = ?auto_101960 ?auto_101962 ) ) ( not ( = ?auto_101960 ?auto_101963 ) ) ( not ( = ?auto_101960 ?auto_101964 ) ) ( not ( = ?auto_101960 ?auto_101965 ) ) ( not ( = ?auto_101961 ?auto_101962 ) ) ( not ( = ?auto_101961 ?auto_101963 ) ) ( not ( = ?auto_101961 ?auto_101964 ) ) ( not ( = ?auto_101961 ?auto_101965 ) ) ( not ( = ?auto_101962 ?auto_101963 ) ) ( not ( = ?auto_101962 ?auto_101964 ) ) ( not ( = ?auto_101962 ?auto_101965 ) ) ( not ( = ?auto_101963 ?auto_101964 ) ) ( not ( = ?auto_101963 ?auto_101965 ) ) ( not ( = ?auto_101964 ?auto_101965 ) ) ( ON ?auto_101965 ?auto_101967 ) ( not ( = ?auto_101960 ?auto_101967 ) ) ( not ( = ?auto_101961 ?auto_101967 ) ) ( not ( = ?auto_101962 ?auto_101967 ) ) ( not ( = ?auto_101963 ?auto_101967 ) ) ( not ( = ?auto_101964 ?auto_101967 ) ) ( not ( = ?auto_101965 ?auto_101967 ) ) ( ON ?auto_101964 ?auto_101965 ) ( ON-TABLE ?auto_101966 ) ( ON ?auto_101967 ?auto_101966 ) ( not ( = ?auto_101966 ?auto_101967 ) ) ( not ( = ?auto_101966 ?auto_101965 ) ) ( not ( = ?auto_101966 ?auto_101964 ) ) ( not ( = ?auto_101960 ?auto_101966 ) ) ( not ( = ?auto_101961 ?auto_101966 ) ) ( not ( = ?auto_101962 ?auto_101966 ) ) ( not ( = ?auto_101963 ?auto_101966 ) ) ( ON ?auto_101963 ?auto_101964 ) ( CLEAR ?auto_101963 ) ( HOLDING ?auto_101962 ) ( CLEAR ?auto_101961 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_101960 ?auto_101961 ?auto_101962 )
      ( MAKE-6PILE ?auto_101960 ?auto_101961 ?auto_101962 ?auto_101963 ?auto_101964 ?auto_101965 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_101968 - BLOCK
      ?auto_101969 - BLOCK
      ?auto_101970 - BLOCK
      ?auto_101971 - BLOCK
      ?auto_101972 - BLOCK
      ?auto_101973 - BLOCK
    )
    :vars
    (
      ?auto_101974 - BLOCK
      ?auto_101975 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_101968 ) ( ON ?auto_101969 ?auto_101968 ) ( not ( = ?auto_101968 ?auto_101969 ) ) ( not ( = ?auto_101968 ?auto_101970 ) ) ( not ( = ?auto_101968 ?auto_101971 ) ) ( not ( = ?auto_101968 ?auto_101972 ) ) ( not ( = ?auto_101968 ?auto_101973 ) ) ( not ( = ?auto_101969 ?auto_101970 ) ) ( not ( = ?auto_101969 ?auto_101971 ) ) ( not ( = ?auto_101969 ?auto_101972 ) ) ( not ( = ?auto_101969 ?auto_101973 ) ) ( not ( = ?auto_101970 ?auto_101971 ) ) ( not ( = ?auto_101970 ?auto_101972 ) ) ( not ( = ?auto_101970 ?auto_101973 ) ) ( not ( = ?auto_101971 ?auto_101972 ) ) ( not ( = ?auto_101971 ?auto_101973 ) ) ( not ( = ?auto_101972 ?auto_101973 ) ) ( ON ?auto_101973 ?auto_101974 ) ( not ( = ?auto_101968 ?auto_101974 ) ) ( not ( = ?auto_101969 ?auto_101974 ) ) ( not ( = ?auto_101970 ?auto_101974 ) ) ( not ( = ?auto_101971 ?auto_101974 ) ) ( not ( = ?auto_101972 ?auto_101974 ) ) ( not ( = ?auto_101973 ?auto_101974 ) ) ( ON ?auto_101972 ?auto_101973 ) ( ON-TABLE ?auto_101975 ) ( ON ?auto_101974 ?auto_101975 ) ( not ( = ?auto_101975 ?auto_101974 ) ) ( not ( = ?auto_101975 ?auto_101973 ) ) ( not ( = ?auto_101975 ?auto_101972 ) ) ( not ( = ?auto_101968 ?auto_101975 ) ) ( not ( = ?auto_101969 ?auto_101975 ) ) ( not ( = ?auto_101970 ?auto_101975 ) ) ( not ( = ?auto_101971 ?auto_101975 ) ) ( ON ?auto_101971 ?auto_101972 ) ( CLEAR ?auto_101969 ) ( ON ?auto_101970 ?auto_101971 ) ( CLEAR ?auto_101970 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_101975 ?auto_101974 ?auto_101973 ?auto_101972 ?auto_101971 )
      ( MAKE-6PILE ?auto_101968 ?auto_101969 ?auto_101970 ?auto_101971 ?auto_101972 ?auto_101973 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_101976 - BLOCK
      ?auto_101977 - BLOCK
      ?auto_101978 - BLOCK
      ?auto_101979 - BLOCK
      ?auto_101980 - BLOCK
      ?auto_101981 - BLOCK
    )
    :vars
    (
      ?auto_101983 - BLOCK
      ?auto_101982 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_101976 ) ( not ( = ?auto_101976 ?auto_101977 ) ) ( not ( = ?auto_101976 ?auto_101978 ) ) ( not ( = ?auto_101976 ?auto_101979 ) ) ( not ( = ?auto_101976 ?auto_101980 ) ) ( not ( = ?auto_101976 ?auto_101981 ) ) ( not ( = ?auto_101977 ?auto_101978 ) ) ( not ( = ?auto_101977 ?auto_101979 ) ) ( not ( = ?auto_101977 ?auto_101980 ) ) ( not ( = ?auto_101977 ?auto_101981 ) ) ( not ( = ?auto_101978 ?auto_101979 ) ) ( not ( = ?auto_101978 ?auto_101980 ) ) ( not ( = ?auto_101978 ?auto_101981 ) ) ( not ( = ?auto_101979 ?auto_101980 ) ) ( not ( = ?auto_101979 ?auto_101981 ) ) ( not ( = ?auto_101980 ?auto_101981 ) ) ( ON ?auto_101981 ?auto_101983 ) ( not ( = ?auto_101976 ?auto_101983 ) ) ( not ( = ?auto_101977 ?auto_101983 ) ) ( not ( = ?auto_101978 ?auto_101983 ) ) ( not ( = ?auto_101979 ?auto_101983 ) ) ( not ( = ?auto_101980 ?auto_101983 ) ) ( not ( = ?auto_101981 ?auto_101983 ) ) ( ON ?auto_101980 ?auto_101981 ) ( ON-TABLE ?auto_101982 ) ( ON ?auto_101983 ?auto_101982 ) ( not ( = ?auto_101982 ?auto_101983 ) ) ( not ( = ?auto_101982 ?auto_101981 ) ) ( not ( = ?auto_101982 ?auto_101980 ) ) ( not ( = ?auto_101976 ?auto_101982 ) ) ( not ( = ?auto_101977 ?auto_101982 ) ) ( not ( = ?auto_101978 ?auto_101982 ) ) ( not ( = ?auto_101979 ?auto_101982 ) ) ( ON ?auto_101979 ?auto_101980 ) ( ON ?auto_101978 ?auto_101979 ) ( CLEAR ?auto_101978 ) ( HOLDING ?auto_101977 ) ( CLEAR ?auto_101976 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_101976 ?auto_101977 )
      ( MAKE-6PILE ?auto_101976 ?auto_101977 ?auto_101978 ?auto_101979 ?auto_101980 ?auto_101981 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_101984 - BLOCK
      ?auto_101985 - BLOCK
      ?auto_101986 - BLOCK
      ?auto_101987 - BLOCK
      ?auto_101988 - BLOCK
      ?auto_101989 - BLOCK
    )
    :vars
    (
      ?auto_101990 - BLOCK
      ?auto_101991 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_101984 ) ( not ( = ?auto_101984 ?auto_101985 ) ) ( not ( = ?auto_101984 ?auto_101986 ) ) ( not ( = ?auto_101984 ?auto_101987 ) ) ( not ( = ?auto_101984 ?auto_101988 ) ) ( not ( = ?auto_101984 ?auto_101989 ) ) ( not ( = ?auto_101985 ?auto_101986 ) ) ( not ( = ?auto_101985 ?auto_101987 ) ) ( not ( = ?auto_101985 ?auto_101988 ) ) ( not ( = ?auto_101985 ?auto_101989 ) ) ( not ( = ?auto_101986 ?auto_101987 ) ) ( not ( = ?auto_101986 ?auto_101988 ) ) ( not ( = ?auto_101986 ?auto_101989 ) ) ( not ( = ?auto_101987 ?auto_101988 ) ) ( not ( = ?auto_101987 ?auto_101989 ) ) ( not ( = ?auto_101988 ?auto_101989 ) ) ( ON ?auto_101989 ?auto_101990 ) ( not ( = ?auto_101984 ?auto_101990 ) ) ( not ( = ?auto_101985 ?auto_101990 ) ) ( not ( = ?auto_101986 ?auto_101990 ) ) ( not ( = ?auto_101987 ?auto_101990 ) ) ( not ( = ?auto_101988 ?auto_101990 ) ) ( not ( = ?auto_101989 ?auto_101990 ) ) ( ON ?auto_101988 ?auto_101989 ) ( ON-TABLE ?auto_101991 ) ( ON ?auto_101990 ?auto_101991 ) ( not ( = ?auto_101991 ?auto_101990 ) ) ( not ( = ?auto_101991 ?auto_101989 ) ) ( not ( = ?auto_101991 ?auto_101988 ) ) ( not ( = ?auto_101984 ?auto_101991 ) ) ( not ( = ?auto_101985 ?auto_101991 ) ) ( not ( = ?auto_101986 ?auto_101991 ) ) ( not ( = ?auto_101987 ?auto_101991 ) ) ( ON ?auto_101987 ?auto_101988 ) ( ON ?auto_101986 ?auto_101987 ) ( CLEAR ?auto_101984 ) ( ON ?auto_101985 ?auto_101986 ) ( CLEAR ?auto_101985 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_101991 ?auto_101990 ?auto_101989 ?auto_101988 ?auto_101987 ?auto_101986 )
      ( MAKE-6PILE ?auto_101984 ?auto_101985 ?auto_101986 ?auto_101987 ?auto_101988 ?auto_101989 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_101992 - BLOCK
      ?auto_101993 - BLOCK
      ?auto_101994 - BLOCK
      ?auto_101995 - BLOCK
      ?auto_101996 - BLOCK
      ?auto_101997 - BLOCK
    )
    :vars
    (
      ?auto_101998 - BLOCK
      ?auto_101999 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_101992 ?auto_101993 ) ) ( not ( = ?auto_101992 ?auto_101994 ) ) ( not ( = ?auto_101992 ?auto_101995 ) ) ( not ( = ?auto_101992 ?auto_101996 ) ) ( not ( = ?auto_101992 ?auto_101997 ) ) ( not ( = ?auto_101993 ?auto_101994 ) ) ( not ( = ?auto_101993 ?auto_101995 ) ) ( not ( = ?auto_101993 ?auto_101996 ) ) ( not ( = ?auto_101993 ?auto_101997 ) ) ( not ( = ?auto_101994 ?auto_101995 ) ) ( not ( = ?auto_101994 ?auto_101996 ) ) ( not ( = ?auto_101994 ?auto_101997 ) ) ( not ( = ?auto_101995 ?auto_101996 ) ) ( not ( = ?auto_101995 ?auto_101997 ) ) ( not ( = ?auto_101996 ?auto_101997 ) ) ( ON ?auto_101997 ?auto_101998 ) ( not ( = ?auto_101992 ?auto_101998 ) ) ( not ( = ?auto_101993 ?auto_101998 ) ) ( not ( = ?auto_101994 ?auto_101998 ) ) ( not ( = ?auto_101995 ?auto_101998 ) ) ( not ( = ?auto_101996 ?auto_101998 ) ) ( not ( = ?auto_101997 ?auto_101998 ) ) ( ON ?auto_101996 ?auto_101997 ) ( ON-TABLE ?auto_101999 ) ( ON ?auto_101998 ?auto_101999 ) ( not ( = ?auto_101999 ?auto_101998 ) ) ( not ( = ?auto_101999 ?auto_101997 ) ) ( not ( = ?auto_101999 ?auto_101996 ) ) ( not ( = ?auto_101992 ?auto_101999 ) ) ( not ( = ?auto_101993 ?auto_101999 ) ) ( not ( = ?auto_101994 ?auto_101999 ) ) ( not ( = ?auto_101995 ?auto_101999 ) ) ( ON ?auto_101995 ?auto_101996 ) ( ON ?auto_101994 ?auto_101995 ) ( ON ?auto_101993 ?auto_101994 ) ( CLEAR ?auto_101993 ) ( HOLDING ?auto_101992 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_101992 )
      ( MAKE-6PILE ?auto_101992 ?auto_101993 ?auto_101994 ?auto_101995 ?auto_101996 ?auto_101997 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_102000 - BLOCK
      ?auto_102001 - BLOCK
      ?auto_102002 - BLOCK
      ?auto_102003 - BLOCK
      ?auto_102004 - BLOCK
      ?auto_102005 - BLOCK
    )
    :vars
    (
      ?auto_102007 - BLOCK
      ?auto_102006 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_102000 ?auto_102001 ) ) ( not ( = ?auto_102000 ?auto_102002 ) ) ( not ( = ?auto_102000 ?auto_102003 ) ) ( not ( = ?auto_102000 ?auto_102004 ) ) ( not ( = ?auto_102000 ?auto_102005 ) ) ( not ( = ?auto_102001 ?auto_102002 ) ) ( not ( = ?auto_102001 ?auto_102003 ) ) ( not ( = ?auto_102001 ?auto_102004 ) ) ( not ( = ?auto_102001 ?auto_102005 ) ) ( not ( = ?auto_102002 ?auto_102003 ) ) ( not ( = ?auto_102002 ?auto_102004 ) ) ( not ( = ?auto_102002 ?auto_102005 ) ) ( not ( = ?auto_102003 ?auto_102004 ) ) ( not ( = ?auto_102003 ?auto_102005 ) ) ( not ( = ?auto_102004 ?auto_102005 ) ) ( ON ?auto_102005 ?auto_102007 ) ( not ( = ?auto_102000 ?auto_102007 ) ) ( not ( = ?auto_102001 ?auto_102007 ) ) ( not ( = ?auto_102002 ?auto_102007 ) ) ( not ( = ?auto_102003 ?auto_102007 ) ) ( not ( = ?auto_102004 ?auto_102007 ) ) ( not ( = ?auto_102005 ?auto_102007 ) ) ( ON ?auto_102004 ?auto_102005 ) ( ON-TABLE ?auto_102006 ) ( ON ?auto_102007 ?auto_102006 ) ( not ( = ?auto_102006 ?auto_102007 ) ) ( not ( = ?auto_102006 ?auto_102005 ) ) ( not ( = ?auto_102006 ?auto_102004 ) ) ( not ( = ?auto_102000 ?auto_102006 ) ) ( not ( = ?auto_102001 ?auto_102006 ) ) ( not ( = ?auto_102002 ?auto_102006 ) ) ( not ( = ?auto_102003 ?auto_102006 ) ) ( ON ?auto_102003 ?auto_102004 ) ( ON ?auto_102002 ?auto_102003 ) ( ON ?auto_102001 ?auto_102002 ) ( ON ?auto_102000 ?auto_102001 ) ( CLEAR ?auto_102000 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_102006 ?auto_102007 ?auto_102005 ?auto_102004 ?auto_102003 ?auto_102002 ?auto_102001 )
      ( MAKE-6PILE ?auto_102000 ?auto_102001 ?auto_102002 ?auto_102003 ?auto_102004 ?auto_102005 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_102009 - BLOCK
    )
    :vars
    (
      ?auto_102010 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_102010 ?auto_102009 ) ( CLEAR ?auto_102010 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_102009 ) ( not ( = ?auto_102009 ?auto_102010 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_102010 ?auto_102009 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_102011 - BLOCK
    )
    :vars
    (
      ?auto_102012 - BLOCK
      ?auto_102013 - BLOCK
      ?auto_102014 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_102012 ?auto_102011 ) ( CLEAR ?auto_102012 ) ( ON-TABLE ?auto_102011 ) ( not ( = ?auto_102011 ?auto_102012 ) ) ( HOLDING ?auto_102013 ) ( CLEAR ?auto_102014 ) ( not ( = ?auto_102011 ?auto_102013 ) ) ( not ( = ?auto_102011 ?auto_102014 ) ) ( not ( = ?auto_102012 ?auto_102013 ) ) ( not ( = ?auto_102012 ?auto_102014 ) ) ( not ( = ?auto_102013 ?auto_102014 ) ) )
    :subtasks
    ( ( !STACK ?auto_102013 ?auto_102014 )
      ( MAKE-1PILE ?auto_102011 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_102015 - BLOCK
    )
    :vars
    (
      ?auto_102016 - BLOCK
      ?auto_102017 - BLOCK
      ?auto_102018 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_102016 ?auto_102015 ) ( ON-TABLE ?auto_102015 ) ( not ( = ?auto_102015 ?auto_102016 ) ) ( CLEAR ?auto_102017 ) ( not ( = ?auto_102015 ?auto_102018 ) ) ( not ( = ?auto_102015 ?auto_102017 ) ) ( not ( = ?auto_102016 ?auto_102018 ) ) ( not ( = ?auto_102016 ?auto_102017 ) ) ( not ( = ?auto_102018 ?auto_102017 ) ) ( ON ?auto_102018 ?auto_102016 ) ( CLEAR ?auto_102018 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_102015 ?auto_102016 )
      ( MAKE-1PILE ?auto_102015 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_102019 - BLOCK
    )
    :vars
    (
      ?auto_102022 - BLOCK
      ?auto_102020 - BLOCK
      ?auto_102021 - BLOCK
      ?auto_102026 - BLOCK
      ?auto_102025 - BLOCK
      ?auto_102023 - BLOCK
      ?auto_102024 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_102022 ?auto_102019 ) ( ON-TABLE ?auto_102019 ) ( not ( = ?auto_102019 ?auto_102022 ) ) ( not ( = ?auto_102019 ?auto_102020 ) ) ( not ( = ?auto_102019 ?auto_102021 ) ) ( not ( = ?auto_102022 ?auto_102020 ) ) ( not ( = ?auto_102022 ?auto_102021 ) ) ( not ( = ?auto_102020 ?auto_102021 ) ) ( ON ?auto_102020 ?auto_102022 ) ( CLEAR ?auto_102020 ) ( HOLDING ?auto_102021 ) ( CLEAR ?auto_102026 ) ( ON-TABLE ?auto_102025 ) ( ON ?auto_102023 ?auto_102025 ) ( ON ?auto_102024 ?auto_102023 ) ( ON ?auto_102026 ?auto_102024 ) ( not ( = ?auto_102025 ?auto_102023 ) ) ( not ( = ?auto_102025 ?auto_102024 ) ) ( not ( = ?auto_102025 ?auto_102026 ) ) ( not ( = ?auto_102025 ?auto_102021 ) ) ( not ( = ?auto_102023 ?auto_102024 ) ) ( not ( = ?auto_102023 ?auto_102026 ) ) ( not ( = ?auto_102023 ?auto_102021 ) ) ( not ( = ?auto_102024 ?auto_102026 ) ) ( not ( = ?auto_102024 ?auto_102021 ) ) ( not ( = ?auto_102026 ?auto_102021 ) ) ( not ( = ?auto_102019 ?auto_102026 ) ) ( not ( = ?auto_102019 ?auto_102025 ) ) ( not ( = ?auto_102019 ?auto_102023 ) ) ( not ( = ?auto_102019 ?auto_102024 ) ) ( not ( = ?auto_102022 ?auto_102026 ) ) ( not ( = ?auto_102022 ?auto_102025 ) ) ( not ( = ?auto_102022 ?auto_102023 ) ) ( not ( = ?auto_102022 ?auto_102024 ) ) ( not ( = ?auto_102020 ?auto_102026 ) ) ( not ( = ?auto_102020 ?auto_102025 ) ) ( not ( = ?auto_102020 ?auto_102023 ) ) ( not ( = ?auto_102020 ?auto_102024 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_102025 ?auto_102023 ?auto_102024 ?auto_102026 ?auto_102021 )
      ( MAKE-1PILE ?auto_102019 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_102027 - BLOCK
    )
    :vars
    (
      ?auto_102031 - BLOCK
      ?auto_102028 - BLOCK
      ?auto_102033 - BLOCK
      ?auto_102030 - BLOCK
      ?auto_102029 - BLOCK
      ?auto_102032 - BLOCK
      ?auto_102034 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_102031 ?auto_102027 ) ( ON-TABLE ?auto_102027 ) ( not ( = ?auto_102027 ?auto_102031 ) ) ( not ( = ?auto_102027 ?auto_102028 ) ) ( not ( = ?auto_102027 ?auto_102033 ) ) ( not ( = ?auto_102031 ?auto_102028 ) ) ( not ( = ?auto_102031 ?auto_102033 ) ) ( not ( = ?auto_102028 ?auto_102033 ) ) ( ON ?auto_102028 ?auto_102031 ) ( CLEAR ?auto_102030 ) ( ON-TABLE ?auto_102029 ) ( ON ?auto_102032 ?auto_102029 ) ( ON ?auto_102034 ?auto_102032 ) ( ON ?auto_102030 ?auto_102034 ) ( not ( = ?auto_102029 ?auto_102032 ) ) ( not ( = ?auto_102029 ?auto_102034 ) ) ( not ( = ?auto_102029 ?auto_102030 ) ) ( not ( = ?auto_102029 ?auto_102033 ) ) ( not ( = ?auto_102032 ?auto_102034 ) ) ( not ( = ?auto_102032 ?auto_102030 ) ) ( not ( = ?auto_102032 ?auto_102033 ) ) ( not ( = ?auto_102034 ?auto_102030 ) ) ( not ( = ?auto_102034 ?auto_102033 ) ) ( not ( = ?auto_102030 ?auto_102033 ) ) ( not ( = ?auto_102027 ?auto_102030 ) ) ( not ( = ?auto_102027 ?auto_102029 ) ) ( not ( = ?auto_102027 ?auto_102032 ) ) ( not ( = ?auto_102027 ?auto_102034 ) ) ( not ( = ?auto_102031 ?auto_102030 ) ) ( not ( = ?auto_102031 ?auto_102029 ) ) ( not ( = ?auto_102031 ?auto_102032 ) ) ( not ( = ?auto_102031 ?auto_102034 ) ) ( not ( = ?auto_102028 ?auto_102030 ) ) ( not ( = ?auto_102028 ?auto_102029 ) ) ( not ( = ?auto_102028 ?auto_102032 ) ) ( not ( = ?auto_102028 ?auto_102034 ) ) ( ON ?auto_102033 ?auto_102028 ) ( CLEAR ?auto_102033 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_102027 ?auto_102031 ?auto_102028 )
      ( MAKE-1PILE ?auto_102027 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_102035 - BLOCK
    )
    :vars
    (
      ?auto_102038 - BLOCK
      ?auto_102036 - BLOCK
      ?auto_102040 - BLOCK
      ?auto_102042 - BLOCK
      ?auto_102037 - BLOCK
      ?auto_102041 - BLOCK
      ?auto_102039 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_102038 ?auto_102035 ) ( ON-TABLE ?auto_102035 ) ( not ( = ?auto_102035 ?auto_102038 ) ) ( not ( = ?auto_102035 ?auto_102036 ) ) ( not ( = ?auto_102035 ?auto_102040 ) ) ( not ( = ?auto_102038 ?auto_102036 ) ) ( not ( = ?auto_102038 ?auto_102040 ) ) ( not ( = ?auto_102036 ?auto_102040 ) ) ( ON ?auto_102036 ?auto_102038 ) ( ON-TABLE ?auto_102042 ) ( ON ?auto_102037 ?auto_102042 ) ( ON ?auto_102041 ?auto_102037 ) ( not ( = ?auto_102042 ?auto_102037 ) ) ( not ( = ?auto_102042 ?auto_102041 ) ) ( not ( = ?auto_102042 ?auto_102039 ) ) ( not ( = ?auto_102042 ?auto_102040 ) ) ( not ( = ?auto_102037 ?auto_102041 ) ) ( not ( = ?auto_102037 ?auto_102039 ) ) ( not ( = ?auto_102037 ?auto_102040 ) ) ( not ( = ?auto_102041 ?auto_102039 ) ) ( not ( = ?auto_102041 ?auto_102040 ) ) ( not ( = ?auto_102039 ?auto_102040 ) ) ( not ( = ?auto_102035 ?auto_102039 ) ) ( not ( = ?auto_102035 ?auto_102042 ) ) ( not ( = ?auto_102035 ?auto_102037 ) ) ( not ( = ?auto_102035 ?auto_102041 ) ) ( not ( = ?auto_102038 ?auto_102039 ) ) ( not ( = ?auto_102038 ?auto_102042 ) ) ( not ( = ?auto_102038 ?auto_102037 ) ) ( not ( = ?auto_102038 ?auto_102041 ) ) ( not ( = ?auto_102036 ?auto_102039 ) ) ( not ( = ?auto_102036 ?auto_102042 ) ) ( not ( = ?auto_102036 ?auto_102037 ) ) ( not ( = ?auto_102036 ?auto_102041 ) ) ( ON ?auto_102040 ?auto_102036 ) ( CLEAR ?auto_102040 ) ( HOLDING ?auto_102039 ) ( CLEAR ?auto_102041 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_102042 ?auto_102037 ?auto_102041 ?auto_102039 )
      ( MAKE-1PILE ?auto_102035 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_102043 - BLOCK
    )
    :vars
    (
      ?auto_102045 - BLOCK
      ?auto_102044 - BLOCK
      ?auto_102048 - BLOCK
      ?auto_102050 - BLOCK
      ?auto_102047 - BLOCK
      ?auto_102049 - BLOCK
      ?auto_102046 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_102045 ?auto_102043 ) ( ON-TABLE ?auto_102043 ) ( not ( = ?auto_102043 ?auto_102045 ) ) ( not ( = ?auto_102043 ?auto_102044 ) ) ( not ( = ?auto_102043 ?auto_102048 ) ) ( not ( = ?auto_102045 ?auto_102044 ) ) ( not ( = ?auto_102045 ?auto_102048 ) ) ( not ( = ?auto_102044 ?auto_102048 ) ) ( ON ?auto_102044 ?auto_102045 ) ( ON-TABLE ?auto_102050 ) ( ON ?auto_102047 ?auto_102050 ) ( ON ?auto_102049 ?auto_102047 ) ( not ( = ?auto_102050 ?auto_102047 ) ) ( not ( = ?auto_102050 ?auto_102049 ) ) ( not ( = ?auto_102050 ?auto_102046 ) ) ( not ( = ?auto_102050 ?auto_102048 ) ) ( not ( = ?auto_102047 ?auto_102049 ) ) ( not ( = ?auto_102047 ?auto_102046 ) ) ( not ( = ?auto_102047 ?auto_102048 ) ) ( not ( = ?auto_102049 ?auto_102046 ) ) ( not ( = ?auto_102049 ?auto_102048 ) ) ( not ( = ?auto_102046 ?auto_102048 ) ) ( not ( = ?auto_102043 ?auto_102046 ) ) ( not ( = ?auto_102043 ?auto_102050 ) ) ( not ( = ?auto_102043 ?auto_102047 ) ) ( not ( = ?auto_102043 ?auto_102049 ) ) ( not ( = ?auto_102045 ?auto_102046 ) ) ( not ( = ?auto_102045 ?auto_102050 ) ) ( not ( = ?auto_102045 ?auto_102047 ) ) ( not ( = ?auto_102045 ?auto_102049 ) ) ( not ( = ?auto_102044 ?auto_102046 ) ) ( not ( = ?auto_102044 ?auto_102050 ) ) ( not ( = ?auto_102044 ?auto_102047 ) ) ( not ( = ?auto_102044 ?auto_102049 ) ) ( ON ?auto_102048 ?auto_102044 ) ( CLEAR ?auto_102049 ) ( ON ?auto_102046 ?auto_102048 ) ( CLEAR ?auto_102046 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_102043 ?auto_102045 ?auto_102044 ?auto_102048 )
      ( MAKE-1PILE ?auto_102043 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_102051 - BLOCK
    )
    :vars
    (
      ?auto_102054 - BLOCK
      ?auto_102056 - BLOCK
      ?auto_102053 - BLOCK
      ?auto_102057 - BLOCK
      ?auto_102055 - BLOCK
      ?auto_102058 - BLOCK
      ?auto_102052 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_102054 ?auto_102051 ) ( ON-TABLE ?auto_102051 ) ( not ( = ?auto_102051 ?auto_102054 ) ) ( not ( = ?auto_102051 ?auto_102056 ) ) ( not ( = ?auto_102051 ?auto_102053 ) ) ( not ( = ?auto_102054 ?auto_102056 ) ) ( not ( = ?auto_102054 ?auto_102053 ) ) ( not ( = ?auto_102056 ?auto_102053 ) ) ( ON ?auto_102056 ?auto_102054 ) ( ON-TABLE ?auto_102057 ) ( ON ?auto_102055 ?auto_102057 ) ( not ( = ?auto_102057 ?auto_102055 ) ) ( not ( = ?auto_102057 ?auto_102058 ) ) ( not ( = ?auto_102057 ?auto_102052 ) ) ( not ( = ?auto_102057 ?auto_102053 ) ) ( not ( = ?auto_102055 ?auto_102058 ) ) ( not ( = ?auto_102055 ?auto_102052 ) ) ( not ( = ?auto_102055 ?auto_102053 ) ) ( not ( = ?auto_102058 ?auto_102052 ) ) ( not ( = ?auto_102058 ?auto_102053 ) ) ( not ( = ?auto_102052 ?auto_102053 ) ) ( not ( = ?auto_102051 ?auto_102052 ) ) ( not ( = ?auto_102051 ?auto_102057 ) ) ( not ( = ?auto_102051 ?auto_102055 ) ) ( not ( = ?auto_102051 ?auto_102058 ) ) ( not ( = ?auto_102054 ?auto_102052 ) ) ( not ( = ?auto_102054 ?auto_102057 ) ) ( not ( = ?auto_102054 ?auto_102055 ) ) ( not ( = ?auto_102054 ?auto_102058 ) ) ( not ( = ?auto_102056 ?auto_102052 ) ) ( not ( = ?auto_102056 ?auto_102057 ) ) ( not ( = ?auto_102056 ?auto_102055 ) ) ( not ( = ?auto_102056 ?auto_102058 ) ) ( ON ?auto_102053 ?auto_102056 ) ( ON ?auto_102052 ?auto_102053 ) ( CLEAR ?auto_102052 ) ( HOLDING ?auto_102058 ) ( CLEAR ?auto_102055 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_102057 ?auto_102055 ?auto_102058 )
      ( MAKE-1PILE ?auto_102051 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_102059 - BLOCK
    )
    :vars
    (
      ?auto_102060 - BLOCK
      ?auto_102064 - BLOCK
      ?auto_102063 - BLOCK
      ?auto_102062 - BLOCK
      ?auto_102065 - BLOCK
      ?auto_102061 - BLOCK
      ?auto_102066 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_102060 ?auto_102059 ) ( ON-TABLE ?auto_102059 ) ( not ( = ?auto_102059 ?auto_102060 ) ) ( not ( = ?auto_102059 ?auto_102064 ) ) ( not ( = ?auto_102059 ?auto_102063 ) ) ( not ( = ?auto_102060 ?auto_102064 ) ) ( not ( = ?auto_102060 ?auto_102063 ) ) ( not ( = ?auto_102064 ?auto_102063 ) ) ( ON ?auto_102064 ?auto_102060 ) ( ON-TABLE ?auto_102062 ) ( ON ?auto_102065 ?auto_102062 ) ( not ( = ?auto_102062 ?auto_102065 ) ) ( not ( = ?auto_102062 ?auto_102061 ) ) ( not ( = ?auto_102062 ?auto_102066 ) ) ( not ( = ?auto_102062 ?auto_102063 ) ) ( not ( = ?auto_102065 ?auto_102061 ) ) ( not ( = ?auto_102065 ?auto_102066 ) ) ( not ( = ?auto_102065 ?auto_102063 ) ) ( not ( = ?auto_102061 ?auto_102066 ) ) ( not ( = ?auto_102061 ?auto_102063 ) ) ( not ( = ?auto_102066 ?auto_102063 ) ) ( not ( = ?auto_102059 ?auto_102066 ) ) ( not ( = ?auto_102059 ?auto_102062 ) ) ( not ( = ?auto_102059 ?auto_102065 ) ) ( not ( = ?auto_102059 ?auto_102061 ) ) ( not ( = ?auto_102060 ?auto_102066 ) ) ( not ( = ?auto_102060 ?auto_102062 ) ) ( not ( = ?auto_102060 ?auto_102065 ) ) ( not ( = ?auto_102060 ?auto_102061 ) ) ( not ( = ?auto_102064 ?auto_102066 ) ) ( not ( = ?auto_102064 ?auto_102062 ) ) ( not ( = ?auto_102064 ?auto_102065 ) ) ( not ( = ?auto_102064 ?auto_102061 ) ) ( ON ?auto_102063 ?auto_102064 ) ( ON ?auto_102066 ?auto_102063 ) ( CLEAR ?auto_102065 ) ( ON ?auto_102061 ?auto_102066 ) ( CLEAR ?auto_102061 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_102059 ?auto_102060 ?auto_102064 ?auto_102063 ?auto_102066 )
      ( MAKE-1PILE ?auto_102059 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_102067 - BLOCK
    )
    :vars
    (
      ?auto_102068 - BLOCK
      ?auto_102071 - BLOCK
      ?auto_102072 - BLOCK
      ?auto_102069 - BLOCK
      ?auto_102073 - BLOCK
      ?auto_102070 - BLOCK
      ?auto_102074 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_102068 ?auto_102067 ) ( ON-TABLE ?auto_102067 ) ( not ( = ?auto_102067 ?auto_102068 ) ) ( not ( = ?auto_102067 ?auto_102071 ) ) ( not ( = ?auto_102067 ?auto_102072 ) ) ( not ( = ?auto_102068 ?auto_102071 ) ) ( not ( = ?auto_102068 ?auto_102072 ) ) ( not ( = ?auto_102071 ?auto_102072 ) ) ( ON ?auto_102071 ?auto_102068 ) ( ON-TABLE ?auto_102069 ) ( not ( = ?auto_102069 ?auto_102073 ) ) ( not ( = ?auto_102069 ?auto_102070 ) ) ( not ( = ?auto_102069 ?auto_102074 ) ) ( not ( = ?auto_102069 ?auto_102072 ) ) ( not ( = ?auto_102073 ?auto_102070 ) ) ( not ( = ?auto_102073 ?auto_102074 ) ) ( not ( = ?auto_102073 ?auto_102072 ) ) ( not ( = ?auto_102070 ?auto_102074 ) ) ( not ( = ?auto_102070 ?auto_102072 ) ) ( not ( = ?auto_102074 ?auto_102072 ) ) ( not ( = ?auto_102067 ?auto_102074 ) ) ( not ( = ?auto_102067 ?auto_102069 ) ) ( not ( = ?auto_102067 ?auto_102073 ) ) ( not ( = ?auto_102067 ?auto_102070 ) ) ( not ( = ?auto_102068 ?auto_102074 ) ) ( not ( = ?auto_102068 ?auto_102069 ) ) ( not ( = ?auto_102068 ?auto_102073 ) ) ( not ( = ?auto_102068 ?auto_102070 ) ) ( not ( = ?auto_102071 ?auto_102074 ) ) ( not ( = ?auto_102071 ?auto_102069 ) ) ( not ( = ?auto_102071 ?auto_102073 ) ) ( not ( = ?auto_102071 ?auto_102070 ) ) ( ON ?auto_102072 ?auto_102071 ) ( ON ?auto_102074 ?auto_102072 ) ( ON ?auto_102070 ?auto_102074 ) ( CLEAR ?auto_102070 ) ( HOLDING ?auto_102073 ) ( CLEAR ?auto_102069 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_102069 ?auto_102073 )
      ( MAKE-1PILE ?auto_102067 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_102075 - BLOCK
    )
    :vars
    (
      ?auto_102077 - BLOCK
      ?auto_102076 - BLOCK
      ?auto_102081 - BLOCK
      ?auto_102082 - BLOCK
      ?auto_102079 - BLOCK
      ?auto_102078 - BLOCK
      ?auto_102080 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_102077 ?auto_102075 ) ( ON-TABLE ?auto_102075 ) ( not ( = ?auto_102075 ?auto_102077 ) ) ( not ( = ?auto_102075 ?auto_102076 ) ) ( not ( = ?auto_102075 ?auto_102081 ) ) ( not ( = ?auto_102077 ?auto_102076 ) ) ( not ( = ?auto_102077 ?auto_102081 ) ) ( not ( = ?auto_102076 ?auto_102081 ) ) ( ON ?auto_102076 ?auto_102077 ) ( ON-TABLE ?auto_102082 ) ( not ( = ?auto_102082 ?auto_102079 ) ) ( not ( = ?auto_102082 ?auto_102078 ) ) ( not ( = ?auto_102082 ?auto_102080 ) ) ( not ( = ?auto_102082 ?auto_102081 ) ) ( not ( = ?auto_102079 ?auto_102078 ) ) ( not ( = ?auto_102079 ?auto_102080 ) ) ( not ( = ?auto_102079 ?auto_102081 ) ) ( not ( = ?auto_102078 ?auto_102080 ) ) ( not ( = ?auto_102078 ?auto_102081 ) ) ( not ( = ?auto_102080 ?auto_102081 ) ) ( not ( = ?auto_102075 ?auto_102080 ) ) ( not ( = ?auto_102075 ?auto_102082 ) ) ( not ( = ?auto_102075 ?auto_102079 ) ) ( not ( = ?auto_102075 ?auto_102078 ) ) ( not ( = ?auto_102077 ?auto_102080 ) ) ( not ( = ?auto_102077 ?auto_102082 ) ) ( not ( = ?auto_102077 ?auto_102079 ) ) ( not ( = ?auto_102077 ?auto_102078 ) ) ( not ( = ?auto_102076 ?auto_102080 ) ) ( not ( = ?auto_102076 ?auto_102082 ) ) ( not ( = ?auto_102076 ?auto_102079 ) ) ( not ( = ?auto_102076 ?auto_102078 ) ) ( ON ?auto_102081 ?auto_102076 ) ( ON ?auto_102080 ?auto_102081 ) ( ON ?auto_102078 ?auto_102080 ) ( CLEAR ?auto_102082 ) ( ON ?auto_102079 ?auto_102078 ) ( CLEAR ?auto_102079 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_102075 ?auto_102077 ?auto_102076 ?auto_102081 ?auto_102080 ?auto_102078 )
      ( MAKE-1PILE ?auto_102075 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_102083 - BLOCK
    )
    :vars
    (
      ?auto_102090 - BLOCK
      ?auto_102085 - BLOCK
      ?auto_102084 - BLOCK
      ?auto_102087 - BLOCK
      ?auto_102088 - BLOCK
      ?auto_102089 - BLOCK
      ?auto_102086 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_102090 ?auto_102083 ) ( ON-TABLE ?auto_102083 ) ( not ( = ?auto_102083 ?auto_102090 ) ) ( not ( = ?auto_102083 ?auto_102085 ) ) ( not ( = ?auto_102083 ?auto_102084 ) ) ( not ( = ?auto_102090 ?auto_102085 ) ) ( not ( = ?auto_102090 ?auto_102084 ) ) ( not ( = ?auto_102085 ?auto_102084 ) ) ( ON ?auto_102085 ?auto_102090 ) ( not ( = ?auto_102087 ?auto_102088 ) ) ( not ( = ?auto_102087 ?auto_102089 ) ) ( not ( = ?auto_102087 ?auto_102086 ) ) ( not ( = ?auto_102087 ?auto_102084 ) ) ( not ( = ?auto_102088 ?auto_102089 ) ) ( not ( = ?auto_102088 ?auto_102086 ) ) ( not ( = ?auto_102088 ?auto_102084 ) ) ( not ( = ?auto_102089 ?auto_102086 ) ) ( not ( = ?auto_102089 ?auto_102084 ) ) ( not ( = ?auto_102086 ?auto_102084 ) ) ( not ( = ?auto_102083 ?auto_102086 ) ) ( not ( = ?auto_102083 ?auto_102087 ) ) ( not ( = ?auto_102083 ?auto_102088 ) ) ( not ( = ?auto_102083 ?auto_102089 ) ) ( not ( = ?auto_102090 ?auto_102086 ) ) ( not ( = ?auto_102090 ?auto_102087 ) ) ( not ( = ?auto_102090 ?auto_102088 ) ) ( not ( = ?auto_102090 ?auto_102089 ) ) ( not ( = ?auto_102085 ?auto_102086 ) ) ( not ( = ?auto_102085 ?auto_102087 ) ) ( not ( = ?auto_102085 ?auto_102088 ) ) ( not ( = ?auto_102085 ?auto_102089 ) ) ( ON ?auto_102084 ?auto_102085 ) ( ON ?auto_102086 ?auto_102084 ) ( ON ?auto_102089 ?auto_102086 ) ( ON ?auto_102088 ?auto_102089 ) ( CLEAR ?auto_102088 ) ( HOLDING ?auto_102087 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_102087 )
      ( MAKE-1PILE ?auto_102083 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_102091 - BLOCK
    )
    :vars
    (
      ?auto_102097 - BLOCK
      ?auto_102098 - BLOCK
      ?auto_102092 - BLOCK
      ?auto_102093 - BLOCK
      ?auto_102095 - BLOCK
      ?auto_102094 - BLOCK
      ?auto_102096 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_102097 ?auto_102091 ) ( ON-TABLE ?auto_102091 ) ( not ( = ?auto_102091 ?auto_102097 ) ) ( not ( = ?auto_102091 ?auto_102098 ) ) ( not ( = ?auto_102091 ?auto_102092 ) ) ( not ( = ?auto_102097 ?auto_102098 ) ) ( not ( = ?auto_102097 ?auto_102092 ) ) ( not ( = ?auto_102098 ?auto_102092 ) ) ( ON ?auto_102098 ?auto_102097 ) ( not ( = ?auto_102093 ?auto_102095 ) ) ( not ( = ?auto_102093 ?auto_102094 ) ) ( not ( = ?auto_102093 ?auto_102096 ) ) ( not ( = ?auto_102093 ?auto_102092 ) ) ( not ( = ?auto_102095 ?auto_102094 ) ) ( not ( = ?auto_102095 ?auto_102096 ) ) ( not ( = ?auto_102095 ?auto_102092 ) ) ( not ( = ?auto_102094 ?auto_102096 ) ) ( not ( = ?auto_102094 ?auto_102092 ) ) ( not ( = ?auto_102096 ?auto_102092 ) ) ( not ( = ?auto_102091 ?auto_102096 ) ) ( not ( = ?auto_102091 ?auto_102093 ) ) ( not ( = ?auto_102091 ?auto_102095 ) ) ( not ( = ?auto_102091 ?auto_102094 ) ) ( not ( = ?auto_102097 ?auto_102096 ) ) ( not ( = ?auto_102097 ?auto_102093 ) ) ( not ( = ?auto_102097 ?auto_102095 ) ) ( not ( = ?auto_102097 ?auto_102094 ) ) ( not ( = ?auto_102098 ?auto_102096 ) ) ( not ( = ?auto_102098 ?auto_102093 ) ) ( not ( = ?auto_102098 ?auto_102095 ) ) ( not ( = ?auto_102098 ?auto_102094 ) ) ( ON ?auto_102092 ?auto_102098 ) ( ON ?auto_102096 ?auto_102092 ) ( ON ?auto_102094 ?auto_102096 ) ( ON ?auto_102095 ?auto_102094 ) ( ON ?auto_102093 ?auto_102095 ) ( CLEAR ?auto_102093 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_102091 ?auto_102097 ?auto_102098 ?auto_102092 ?auto_102096 ?auto_102094 ?auto_102095 )
      ( MAKE-1PILE ?auto_102091 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_102106 - BLOCK
      ?auto_102107 - BLOCK
      ?auto_102108 - BLOCK
      ?auto_102109 - BLOCK
      ?auto_102110 - BLOCK
      ?auto_102111 - BLOCK
      ?auto_102112 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_102112 ) ( CLEAR ?auto_102111 ) ( ON-TABLE ?auto_102106 ) ( ON ?auto_102107 ?auto_102106 ) ( ON ?auto_102108 ?auto_102107 ) ( ON ?auto_102109 ?auto_102108 ) ( ON ?auto_102110 ?auto_102109 ) ( ON ?auto_102111 ?auto_102110 ) ( not ( = ?auto_102106 ?auto_102107 ) ) ( not ( = ?auto_102106 ?auto_102108 ) ) ( not ( = ?auto_102106 ?auto_102109 ) ) ( not ( = ?auto_102106 ?auto_102110 ) ) ( not ( = ?auto_102106 ?auto_102111 ) ) ( not ( = ?auto_102106 ?auto_102112 ) ) ( not ( = ?auto_102107 ?auto_102108 ) ) ( not ( = ?auto_102107 ?auto_102109 ) ) ( not ( = ?auto_102107 ?auto_102110 ) ) ( not ( = ?auto_102107 ?auto_102111 ) ) ( not ( = ?auto_102107 ?auto_102112 ) ) ( not ( = ?auto_102108 ?auto_102109 ) ) ( not ( = ?auto_102108 ?auto_102110 ) ) ( not ( = ?auto_102108 ?auto_102111 ) ) ( not ( = ?auto_102108 ?auto_102112 ) ) ( not ( = ?auto_102109 ?auto_102110 ) ) ( not ( = ?auto_102109 ?auto_102111 ) ) ( not ( = ?auto_102109 ?auto_102112 ) ) ( not ( = ?auto_102110 ?auto_102111 ) ) ( not ( = ?auto_102110 ?auto_102112 ) ) ( not ( = ?auto_102111 ?auto_102112 ) ) )
    :subtasks
    ( ( !STACK ?auto_102112 ?auto_102111 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_102113 - BLOCK
      ?auto_102114 - BLOCK
      ?auto_102115 - BLOCK
      ?auto_102116 - BLOCK
      ?auto_102117 - BLOCK
      ?auto_102118 - BLOCK
      ?auto_102119 - BLOCK
    )
    :vars
    (
      ?auto_102120 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_102118 ) ( ON-TABLE ?auto_102113 ) ( ON ?auto_102114 ?auto_102113 ) ( ON ?auto_102115 ?auto_102114 ) ( ON ?auto_102116 ?auto_102115 ) ( ON ?auto_102117 ?auto_102116 ) ( ON ?auto_102118 ?auto_102117 ) ( not ( = ?auto_102113 ?auto_102114 ) ) ( not ( = ?auto_102113 ?auto_102115 ) ) ( not ( = ?auto_102113 ?auto_102116 ) ) ( not ( = ?auto_102113 ?auto_102117 ) ) ( not ( = ?auto_102113 ?auto_102118 ) ) ( not ( = ?auto_102113 ?auto_102119 ) ) ( not ( = ?auto_102114 ?auto_102115 ) ) ( not ( = ?auto_102114 ?auto_102116 ) ) ( not ( = ?auto_102114 ?auto_102117 ) ) ( not ( = ?auto_102114 ?auto_102118 ) ) ( not ( = ?auto_102114 ?auto_102119 ) ) ( not ( = ?auto_102115 ?auto_102116 ) ) ( not ( = ?auto_102115 ?auto_102117 ) ) ( not ( = ?auto_102115 ?auto_102118 ) ) ( not ( = ?auto_102115 ?auto_102119 ) ) ( not ( = ?auto_102116 ?auto_102117 ) ) ( not ( = ?auto_102116 ?auto_102118 ) ) ( not ( = ?auto_102116 ?auto_102119 ) ) ( not ( = ?auto_102117 ?auto_102118 ) ) ( not ( = ?auto_102117 ?auto_102119 ) ) ( not ( = ?auto_102118 ?auto_102119 ) ) ( ON ?auto_102119 ?auto_102120 ) ( CLEAR ?auto_102119 ) ( HAND-EMPTY ) ( not ( = ?auto_102113 ?auto_102120 ) ) ( not ( = ?auto_102114 ?auto_102120 ) ) ( not ( = ?auto_102115 ?auto_102120 ) ) ( not ( = ?auto_102116 ?auto_102120 ) ) ( not ( = ?auto_102117 ?auto_102120 ) ) ( not ( = ?auto_102118 ?auto_102120 ) ) ( not ( = ?auto_102119 ?auto_102120 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_102119 ?auto_102120 )
      ( MAKE-7PILE ?auto_102113 ?auto_102114 ?auto_102115 ?auto_102116 ?auto_102117 ?auto_102118 ?auto_102119 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_102121 - BLOCK
      ?auto_102122 - BLOCK
      ?auto_102123 - BLOCK
      ?auto_102124 - BLOCK
      ?auto_102125 - BLOCK
      ?auto_102126 - BLOCK
      ?auto_102127 - BLOCK
    )
    :vars
    (
      ?auto_102128 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_102121 ) ( ON ?auto_102122 ?auto_102121 ) ( ON ?auto_102123 ?auto_102122 ) ( ON ?auto_102124 ?auto_102123 ) ( ON ?auto_102125 ?auto_102124 ) ( not ( = ?auto_102121 ?auto_102122 ) ) ( not ( = ?auto_102121 ?auto_102123 ) ) ( not ( = ?auto_102121 ?auto_102124 ) ) ( not ( = ?auto_102121 ?auto_102125 ) ) ( not ( = ?auto_102121 ?auto_102126 ) ) ( not ( = ?auto_102121 ?auto_102127 ) ) ( not ( = ?auto_102122 ?auto_102123 ) ) ( not ( = ?auto_102122 ?auto_102124 ) ) ( not ( = ?auto_102122 ?auto_102125 ) ) ( not ( = ?auto_102122 ?auto_102126 ) ) ( not ( = ?auto_102122 ?auto_102127 ) ) ( not ( = ?auto_102123 ?auto_102124 ) ) ( not ( = ?auto_102123 ?auto_102125 ) ) ( not ( = ?auto_102123 ?auto_102126 ) ) ( not ( = ?auto_102123 ?auto_102127 ) ) ( not ( = ?auto_102124 ?auto_102125 ) ) ( not ( = ?auto_102124 ?auto_102126 ) ) ( not ( = ?auto_102124 ?auto_102127 ) ) ( not ( = ?auto_102125 ?auto_102126 ) ) ( not ( = ?auto_102125 ?auto_102127 ) ) ( not ( = ?auto_102126 ?auto_102127 ) ) ( ON ?auto_102127 ?auto_102128 ) ( CLEAR ?auto_102127 ) ( not ( = ?auto_102121 ?auto_102128 ) ) ( not ( = ?auto_102122 ?auto_102128 ) ) ( not ( = ?auto_102123 ?auto_102128 ) ) ( not ( = ?auto_102124 ?auto_102128 ) ) ( not ( = ?auto_102125 ?auto_102128 ) ) ( not ( = ?auto_102126 ?auto_102128 ) ) ( not ( = ?auto_102127 ?auto_102128 ) ) ( HOLDING ?auto_102126 ) ( CLEAR ?auto_102125 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_102121 ?auto_102122 ?auto_102123 ?auto_102124 ?auto_102125 ?auto_102126 )
      ( MAKE-7PILE ?auto_102121 ?auto_102122 ?auto_102123 ?auto_102124 ?auto_102125 ?auto_102126 ?auto_102127 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_102129 - BLOCK
      ?auto_102130 - BLOCK
      ?auto_102131 - BLOCK
      ?auto_102132 - BLOCK
      ?auto_102133 - BLOCK
      ?auto_102134 - BLOCK
      ?auto_102135 - BLOCK
    )
    :vars
    (
      ?auto_102136 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_102129 ) ( ON ?auto_102130 ?auto_102129 ) ( ON ?auto_102131 ?auto_102130 ) ( ON ?auto_102132 ?auto_102131 ) ( ON ?auto_102133 ?auto_102132 ) ( not ( = ?auto_102129 ?auto_102130 ) ) ( not ( = ?auto_102129 ?auto_102131 ) ) ( not ( = ?auto_102129 ?auto_102132 ) ) ( not ( = ?auto_102129 ?auto_102133 ) ) ( not ( = ?auto_102129 ?auto_102134 ) ) ( not ( = ?auto_102129 ?auto_102135 ) ) ( not ( = ?auto_102130 ?auto_102131 ) ) ( not ( = ?auto_102130 ?auto_102132 ) ) ( not ( = ?auto_102130 ?auto_102133 ) ) ( not ( = ?auto_102130 ?auto_102134 ) ) ( not ( = ?auto_102130 ?auto_102135 ) ) ( not ( = ?auto_102131 ?auto_102132 ) ) ( not ( = ?auto_102131 ?auto_102133 ) ) ( not ( = ?auto_102131 ?auto_102134 ) ) ( not ( = ?auto_102131 ?auto_102135 ) ) ( not ( = ?auto_102132 ?auto_102133 ) ) ( not ( = ?auto_102132 ?auto_102134 ) ) ( not ( = ?auto_102132 ?auto_102135 ) ) ( not ( = ?auto_102133 ?auto_102134 ) ) ( not ( = ?auto_102133 ?auto_102135 ) ) ( not ( = ?auto_102134 ?auto_102135 ) ) ( ON ?auto_102135 ?auto_102136 ) ( not ( = ?auto_102129 ?auto_102136 ) ) ( not ( = ?auto_102130 ?auto_102136 ) ) ( not ( = ?auto_102131 ?auto_102136 ) ) ( not ( = ?auto_102132 ?auto_102136 ) ) ( not ( = ?auto_102133 ?auto_102136 ) ) ( not ( = ?auto_102134 ?auto_102136 ) ) ( not ( = ?auto_102135 ?auto_102136 ) ) ( CLEAR ?auto_102133 ) ( ON ?auto_102134 ?auto_102135 ) ( CLEAR ?auto_102134 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_102136 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_102136 ?auto_102135 )
      ( MAKE-7PILE ?auto_102129 ?auto_102130 ?auto_102131 ?auto_102132 ?auto_102133 ?auto_102134 ?auto_102135 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_102137 - BLOCK
      ?auto_102138 - BLOCK
      ?auto_102139 - BLOCK
      ?auto_102140 - BLOCK
      ?auto_102141 - BLOCK
      ?auto_102142 - BLOCK
      ?auto_102143 - BLOCK
    )
    :vars
    (
      ?auto_102144 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_102137 ) ( ON ?auto_102138 ?auto_102137 ) ( ON ?auto_102139 ?auto_102138 ) ( ON ?auto_102140 ?auto_102139 ) ( not ( = ?auto_102137 ?auto_102138 ) ) ( not ( = ?auto_102137 ?auto_102139 ) ) ( not ( = ?auto_102137 ?auto_102140 ) ) ( not ( = ?auto_102137 ?auto_102141 ) ) ( not ( = ?auto_102137 ?auto_102142 ) ) ( not ( = ?auto_102137 ?auto_102143 ) ) ( not ( = ?auto_102138 ?auto_102139 ) ) ( not ( = ?auto_102138 ?auto_102140 ) ) ( not ( = ?auto_102138 ?auto_102141 ) ) ( not ( = ?auto_102138 ?auto_102142 ) ) ( not ( = ?auto_102138 ?auto_102143 ) ) ( not ( = ?auto_102139 ?auto_102140 ) ) ( not ( = ?auto_102139 ?auto_102141 ) ) ( not ( = ?auto_102139 ?auto_102142 ) ) ( not ( = ?auto_102139 ?auto_102143 ) ) ( not ( = ?auto_102140 ?auto_102141 ) ) ( not ( = ?auto_102140 ?auto_102142 ) ) ( not ( = ?auto_102140 ?auto_102143 ) ) ( not ( = ?auto_102141 ?auto_102142 ) ) ( not ( = ?auto_102141 ?auto_102143 ) ) ( not ( = ?auto_102142 ?auto_102143 ) ) ( ON ?auto_102143 ?auto_102144 ) ( not ( = ?auto_102137 ?auto_102144 ) ) ( not ( = ?auto_102138 ?auto_102144 ) ) ( not ( = ?auto_102139 ?auto_102144 ) ) ( not ( = ?auto_102140 ?auto_102144 ) ) ( not ( = ?auto_102141 ?auto_102144 ) ) ( not ( = ?auto_102142 ?auto_102144 ) ) ( not ( = ?auto_102143 ?auto_102144 ) ) ( ON ?auto_102142 ?auto_102143 ) ( CLEAR ?auto_102142 ) ( ON-TABLE ?auto_102144 ) ( HOLDING ?auto_102141 ) ( CLEAR ?auto_102140 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_102137 ?auto_102138 ?auto_102139 ?auto_102140 ?auto_102141 )
      ( MAKE-7PILE ?auto_102137 ?auto_102138 ?auto_102139 ?auto_102140 ?auto_102141 ?auto_102142 ?auto_102143 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_102145 - BLOCK
      ?auto_102146 - BLOCK
      ?auto_102147 - BLOCK
      ?auto_102148 - BLOCK
      ?auto_102149 - BLOCK
      ?auto_102150 - BLOCK
      ?auto_102151 - BLOCK
    )
    :vars
    (
      ?auto_102152 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_102145 ) ( ON ?auto_102146 ?auto_102145 ) ( ON ?auto_102147 ?auto_102146 ) ( ON ?auto_102148 ?auto_102147 ) ( not ( = ?auto_102145 ?auto_102146 ) ) ( not ( = ?auto_102145 ?auto_102147 ) ) ( not ( = ?auto_102145 ?auto_102148 ) ) ( not ( = ?auto_102145 ?auto_102149 ) ) ( not ( = ?auto_102145 ?auto_102150 ) ) ( not ( = ?auto_102145 ?auto_102151 ) ) ( not ( = ?auto_102146 ?auto_102147 ) ) ( not ( = ?auto_102146 ?auto_102148 ) ) ( not ( = ?auto_102146 ?auto_102149 ) ) ( not ( = ?auto_102146 ?auto_102150 ) ) ( not ( = ?auto_102146 ?auto_102151 ) ) ( not ( = ?auto_102147 ?auto_102148 ) ) ( not ( = ?auto_102147 ?auto_102149 ) ) ( not ( = ?auto_102147 ?auto_102150 ) ) ( not ( = ?auto_102147 ?auto_102151 ) ) ( not ( = ?auto_102148 ?auto_102149 ) ) ( not ( = ?auto_102148 ?auto_102150 ) ) ( not ( = ?auto_102148 ?auto_102151 ) ) ( not ( = ?auto_102149 ?auto_102150 ) ) ( not ( = ?auto_102149 ?auto_102151 ) ) ( not ( = ?auto_102150 ?auto_102151 ) ) ( ON ?auto_102151 ?auto_102152 ) ( not ( = ?auto_102145 ?auto_102152 ) ) ( not ( = ?auto_102146 ?auto_102152 ) ) ( not ( = ?auto_102147 ?auto_102152 ) ) ( not ( = ?auto_102148 ?auto_102152 ) ) ( not ( = ?auto_102149 ?auto_102152 ) ) ( not ( = ?auto_102150 ?auto_102152 ) ) ( not ( = ?auto_102151 ?auto_102152 ) ) ( ON ?auto_102150 ?auto_102151 ) ( ON-TABLE ?auto_102152 ) ( CLEAR ?auto_102148 ) ( ON ?auto_102149 ?auto_102150 ) ( CLEAR ?auto_102149 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_102152 ?auto_102151 ?auto_102150 )
      ( MAKE-7PILE ?auto_102145 ?auto_102146 ?auto_102147 ?auto_102148 ?auto_102149 ?auto_102150 ?auto_102151 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_102153 - BLOCK
      ?auto_102154 - BLOCK
      ?auto_102155 - BLOCK
      ?auto_102156 - BLOCK
      ?auto_102157 - BLOCK
      ?auto_102158 - BLOCK
      ?auto_102159 - BLOCK
    )
    :vars
    (
      ?auto_102160 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_102153 ) ( ON ?auto_102154 ?auto_102153 ) ( ON ?auto_102155 ?auto_102154 ) ( not ( = ?auto_102153 ?auto_102154 ) ) ( not ( = ?auto_102153 ?auto_102155 ) ) ( not ( = ?auto_102153 ?auto_102156 ) ) ( not ( = ?auto_102153 ?auto_102157 ) ) ( not ( = ?auto_102153 ?auto_102158 ) ) ( not ( = ?auto_102153 ?auto_102159 ) ) ( not ( = ?auto_102154 ?auto_102155 ) ) ( not ( = ?auto_102154 ?auto_102156 ) ) ( not ( = ?auto_102154 ?auto_102157 ) ) ( not ( = ?auto_102154 ?auto_102158 ) ) ( not ( = ?auto_102154 ?auto_102159 ) ) ( not ( = ?auto_102155 ?auto_102156 ) ) ( not ( = ?auto_102155 ?auto_102157 ) ) ( not ( = ?auto_102155 ?auto_102158 ) ) ( not ( = ?auto_102155 ?auto_102159 ) ) ( not ( = ?auto_102156 ?auto_102157 ) ) ( not ( = ?auto_102156 ?auto_102158 ) ) ( not ( = ?auto_102156 ?auto_102159 ) ) ( not ( = ?auto_102157 ?auto_102158 ) ) ( not ( = ?auto_102157 ?auto_102159 ) ) ( not ( = ?auto_102158 ?auto_102159 ) ) ( ON ?auto_102159 ?auto_102160 ) ( not ( = ?auto_102153 ?auto_102160 ) ) ( not ( = ?auto_102154 ?auto_102160 ) ) ( not ( = ?auto_102155 ?auto_102160 ) ) ( not ( = ?auto_102156 ?auto_102160 ) ) ( not ( = ?auto_102157 ?auto_102160 ) ) ( not ( = ?auto_102158 ?auto_102160 ) ) ( not ( = ?auto_102159 ?auto_102160 ) ) ( ON ?auto_102158 ?auto_102159 ) ( ON-TABLE ?auto_102160 ) ( ON ?auto_102157 ?auto_102158 ) ( CLEAR ?auto_102157 ) ( HOLDING ?auto_102156 ) ( CLEAR ?auto_102155 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_102153 ?auto_102154 ?auto_102155 ?auto_102156 )
      ( MAKE-7PILE ?auto_102153 ?auto_102154 ?auto_102155 ?auto_102156 ?auto_102157 ?auto_102158 ?auto_102159 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_102161 - BLOCK
      ?auto_102162 - BLOCK
      ?auto_102163 - BLOCK
      ?auto_102164 - BLOCK
      ?auto_102165 - BLOCK
      ?auto_102166 - BLOCK
      ?auto_102167 - BLOCK
    )
    :vars
    (
      ?auto_102168 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_102161 ) ( ON ?auto_102162 ?auto_102161 ) ( ON ?auto_102163 ?auto_102162 ) ( not ( = ?auto_102161 ?auto_102162 ) ) ( not ( = ?auto_102161 ?auto_102163 ) ) ( not ( = ?auto_102161 ?auto_102164 ) ) ( not ( = ?auto_102161 ?auto_102165 ) ) ( not ( = ?auto_102161 ?auto_102166 ) ) ( not ( = ?auto_102161 ?auto_102167 ) ) ( not ( = ?auto_102162 ?auto_102163 ) ) ( not ( = ?auto_102162 ?auto_102164 ) ) ( not ( = ?auto_102162 ?auto_102165 ) ) ( not ( = ?auto_102162 ?auto_102166 ) ) ( not ( = ?auto_102162 ?auto_102167 ) ) ( not ( = ?auto_102163 ?auto_102164 ) ) ( not ( = ?auto_102163 ?auto_102165 ) ) ( not ( = ?auto_102163 ?auto_102166 ) ) ( not ( = ?auto_102163 ?auto_102167 ) ) ( not ( = ?auto_102164 ?auto_102165 ) ) ( not ( = ?auto_102164 ?auto_102166 ) ) ( not ( = ?auto_102164 ?auto_102167 ) ) ( not ( = ?auto_102165 ?auto_102166 ) ) ( not ( = ?auto_102165 ?auto_102167 ) ) ( not ( = ?auto_102166 ?auto_102167 ) ) ( ON ?auto_102167 ?auto_102168 ) ( not ( = ?auto_102161 ?auto_102168 ) ) ( not ( = ?auto_102162 ?auto_102168 ) ) ( not ( = ?auto_102163 ?auto_102168 ) ) ( not ( = ?auto_102164 ?auto_102168 ) ) ( not ( = ?auto_102165 ?auto_102168 ) ) ( not ( = ?auto_102166 ?auto_102168 ) ) ( not ( = ?auto_102167 ?auto_102168 ) ) ( ON ?auto_102166 ?auto_102167 ) ( ON-TABLE ?auto_102168 ) ( ON ?auto_102165 ?auto_102166 ) ( CLEAR ?auto_102163 ) ( ON ?auto_102164 ?auto_102165 ) ( CLEAR ?auto_102164 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_102168 ?auto_102167 ?auto_102166 ?auto_102165 )
      ( MAKE-7PILE ?auto_102161 ?auto_102162 ?auto_102163 ?auto_102164 ?auto_102165 ?auto_102166 ?auto_102167 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_102169 - BLOCK
      ?auto_102170 - BLOCK
      ?auto_102171 - BLOCK
      ?auto_102172 - BLOCK
      ?auto_102173 - BLOCK
      ?auto_102174 - BLOCK
      ?auto_102175 - BLOCK
    )
    :vars
    (
      ?auto_102176 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_102169 ) ( ON ?auto_102170 ?auto_102169 ) ( not ( = ?auto_102169 ?auto_102170 ) ) ( not ( = ?auto_102169 ?auto_102171 ) ) ( not ( = ?auto_102169 ?auto_102172 ) ) ( not ( = ?auto_102169 ?auto_102173 ) ) ( not ( = ?auto_102169 ?auto_102174 ) ) ( not ( = ?auto_102169 ?auto_102175 ) ) ( not ( = ?auto_102170 ?auto_102171 ) ) ( not ( = ?auto_102170 ?auto_102172 ) ) ( not ( = ?auto_102170 ?auto_102173 ) ) ( not ( = ?auto_102170 ?auto_102174 ) ) ( not ( = ?auto_102170 ?auto_102175 ) ) ( not ( = ?auto_102171 ?auto_102172 ) ) ( not ( = ?auto_102171 ?auto_102173 ) ) ( not ( = ?auto_102171 ?auto_102174 ) ) ( not ( = ?auto_102171 ?auto_102175 ) ) ( not ( = ?auto_102172 ?auto_102173 ) ) ( not ( = ?auto_102172 ?auto_102174 ) ) ( not ( = ?auto_102172 ?auto_102175 ) ) ( not ( = ?auto_102173 ?auto_102174 ) ) ( not ( = ?auto_102173 ?auto_102175 ) ) ( not ( = ?auto_102174 ?auto_102175 ) ) ( ON ?auto_102175 ?auto_102176 ) ( not ( = ?auto_102169 ?auto_102176 ) ) ( not ( = ?auto_102170 ?auto_102176 ) ) ( not ( = ?auto_102171 ?auto_102176 ) ) ( not ( = ?auto_102172 ?auto_102176 ) ) ( not ( = ?auto_102173 ?auto_102176 ) ) ( not ( = ?auto_102174 ?auto_102176 ) ) ( not ( = ?auto_102175 ?auto_102176 ) ) ( ON ?auto_102174 ?auto_102175 ) ( ON-TABLE ?auto_102176 ) ( ON ?auto_102173 ?auto_102174 ) ( ON ?auto_102172 ?auto_102173 ) ( CLEAR ?auto_102172 ) ( HOLDING ?auto_102171 ) ( CLEAR ?auto_102170 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_102169 ?auto_102170 ?auto_102171 )
      ( MAKE-7PILE ?auto_102169 ?auto_102170 ?auto_102171 ?auto_102172 ?auto_102173 ?auto_102174 ?auto_102175 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_102177 - BLOCK
      ?auto_102178 - BLOCK
      ?auto_102179 - BLOCK
      ?auto_102180 - BLOCK
      ?auto_102181 - BLOCK
      ?auto_102182 - BLOCK
      ?auto_102183 - BLOCK
    )
    :vars
    (
      ?auto_102184 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_102177 ) ( ON ?auto_102178 ?auto_102177 ) ( not ( = ?auto_102177 ?auto_102178 ) ) ( not ( = ?auto_102177 ?auto_102179 ) ) ( not ( = ?auto_102177 ?auto_102180 ) ) ( not ( = ?auto_102177 ?auto_102181 ) ) ( not ( = ?auto_102177 ?auto_102182 ) ) ( not ( = ?auto_102177 ?auto_102183 ) ) ( not ( = ?auto_102178 ?auto_102179 ) ) ( not ( = ?auto_102178 ?auto_102180 ) ) ( not ( = ?auto_102178 ?auto_102181 ) ) ( not ( = ?auto_102178 ?auto_102182 ) ) ( not ( = ?auto_102178 ?auto_102183 ) ) ( not ( = ?auto_102179 ?auto_102180 ) ) ( not ( = ?auto_102179 ?auto_102181 ) ) ( not ( = ?auto_102179 ?auto_102182 ) ) ( not ( = ?auto_102179 ?auto_102183 ) ) ( not ( = ?auto_102180 ?auto_102181 ) ) ( not ( = ?auto_102180 ?auto_102182 ) ) ( not ( = ?auto_102180 ?auto_102183 ) ) ( not ( = ?auto_102181 ?auto_102182 ) ) ( not ( = ?auto_102181 ?auto_102183 ) ) ( not ( = ?auto_102182 ?auto_102183 ) ) ( ON ?auto_102183 ?auto_102184 ) ( not ( = ?auto_102177 ?auto_102184 ) ) ( not ( = ?auto_102178 ?auto_102184 ) ) ( not ( = ?auto_102179 ?auto_102184 ) ) ( not ( = ?auto_102180 ?auto_102184 ) ) ( not ( = ?auto_102181 ?auto_102184 ) ) ( not ( = ?auto_102182 ?auto_102184 ) ) ( not ( = ?auto_102183 ?auto_102184 ) ) ( ON ?auto_102182 ?auto_102183 ) ( ON-TABLE ?auto_102184 ) ( ON ?auto_102181 ?auto_102182 ) ( ON ?auto_102180 ?auto_102181 ) ( CLEAR ?auto_102178 ) ( ON ?auto_102179 ?auto_102180 ) ( CLEAR ?auto_102179 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_102184 ?auto_102183 ?auto_102182 ?auto_102181 ?auto_102180 )
      ( MAKE-7PILE ?auto_102177 ?auto_102178 ?auto_102179 ?auto_102180 ?auto_102181 ?auto_102182 ?auto_102183 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_102185 - BLOCK
      ?auto_102186 - BLOCK
      ?auto_102187 - BLOCK
      ?auto_102188 - BLOCK
      ?auto_102189 - BLOCK
      ?auto_102190 - BLOCK
      ?auto_102191 - BLOCK
    )
    :vars
    (
      ?auto_102192 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_102185 ) ( not ( = ?auto_102185 ?auto_102186 ) ) ( not ( = ?auto_102185 ?auto_102187 ) ) ( not ( = ?auto_102185 ?auto_102188 ) ) ( not ( = ?auto_102185 ?auto_102189 ) ) ( not ( = ?auto_102185 ?auto_102190 ) ) ( not ( = ?auto_102185 ?auto_102191 ) ) ( not ( = ?auto_102186 ?auto_102187 ) ) ( not ( = ?auto_102186 ?auto_102188 ) ) ( not ( = ?auto_102186 ?auto_102189 ) ) ( not ( = ?auto_102186 ?auto_102190 ) ) ( not ( = ?auto_102186 ?auto_102191 ) ) ( not ( = ?auto_102187 ?auto_102188 ) ) ( not ( = ?auto_102187 ?auto_102189 ) ) ( not ( = ?auto_102187 ?auto_102190 ) ) ( not ( = ?auto_102187 ?auto_102191 ) ) ( not ( = ?auto_102188 ?auto_102189 ) ) ( not ( = ?auto_102188 ?auto_102190 ) ) ( not ( = ?auto_102188 ?auto_102191 ) ) ( not ( = ?auto_102189 ?auto_102190 ) ) ( not ( = ?auto_102189 ?auto_102191 ) ) ( not ( = ?auto_102190 ?auto_102191 ) ) ( ON ?auto_102191 ?auto_102192 ) ( not ( = ?auto_102185 ?auto_102192 ) ) ( not ( = ?auto_102186 ?auto_102192 ) ) ( not ( = ?auto_102187 ?auto_102192 ) ) ( not ( = ?auto_102188 ?auto_102192 ) ) ( not ( = ?auto_102189 ?auto_102192 ) ) ( not ( = ?auto_102190 ?auto_102192 ) ) ( not ( = ?auto_102191 ?auto_102192 ) ) ( ON ?auto_102190 ?auto_102191 ) ( ON-TABLE ?auto_102192 ) ( ON ?auto_102189 ?auto_102190 ) ( ON ?auto_102188 ?auto_102189 ) ( ON ?auto_102187 ?auto_102188 ) ( CLEAR ?auto_102187 ) ( HOLDING ?auto_102186 ) ( CLEAR ?auto_102185 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_102185 ?auto_102186 )
      ( MAKE-7PILE ?auto_102185 ?auto_102186 ?auto_102187 ?auto_102188 ?auto_102189 ?auto_102190 ?auto_102191 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_102193 - BLOCK
      ?auto_102194 - BLOCK
      ?auto_102195 - BLOCK
      ?auto_102196 - BLOCK
      ?auto_102197 - BLOCK
      ?auto_102198 - BLOCK
      ?auto_102199 - BLOCK
    )
    :vars
    (
      ?auto_102200 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_102193 ) ( not ( = ?auto_102193 ?auto_102194 ) ) ( not ( = ?auto_102193 ?auto_102195 ) ) ( not ( = ?auto_102193 ?auto_102196 ) ) ( not ( = ?auto_102193 ?auto_102197 ) ) ( not ( = ?auto_102193 ?auto_102198 ) ) ( not ( = ?auto_102193 ?auto_102199 ) ) ( not ( = ?auto_102194 ?auto_102195 ) ) ( not ( = ?auto_102194 ?auto_102196 ) ) ( not ( = ?auto_102194 ?auto_102197 ) ) ( not ( = ?auto_102194 ?auto_102198 ) ) ( not ( = ?auto_102194 ?auto_102199 ) ) ( not ( = ?auto_102195 ?auto_102196 ) ) ( not ( = ?auto_102195 ?auto_102197 ) ) ( not ( = ?auto_102195 ?auto_102198 ) ) ( not ( = ?auto_102195 ?auto_102199 ) ) ( not ( = ?auto_102196 ?auto_102197 ) ) ( not ( = ?auto_102196 ?auto_102198 ) ) ( not ( = ?auto_102196 ?auto_102199 ) ) ( not ( = ?auto_102197 ?auto_102198 ) ) ( not ( = ?auto_102197 ?auto_102199 ) ) ( not ( = ?auto_102198 ?auto_102199 ) ) ( ON ?auto_102199 ?auto_102200 ) ( not ( = ?auto_102193 ?auto_102200 ) ) ( not ( = ?auto_102194 ?auto_102200 ) ) ( not ( = ?auto_102195 ?auto_102200 ) ) ( not ( = ?auto_102196 ?auto_102200 ) ) ( not ( = ?auto_102197 ?auto_102200 ) ) ( not ( = ?auto_102198 ?auto_102200 ) ) ( not ( = ?auto_102199 ?auto_102200 ) ) ( ON ?auto_102198 ?auto_102199 ) ( ON-TABLE ?auto_102200 ) ( ON ?auto_102197 ?auto_102198 ) ( ON ?auto_102196 ?auto_102197 ) ( ON ?auto_102195 ?auto_102196 ) ( CLEAR ?auto_102193 ) ( ON ?auto_102194 ?auto_102195 ) ( CLEAR ?auto_102194 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_102200 ?auto_102199 ?auto_102198 ?auto_102197 ?auto_102196 ?auto_102195 )
      ( MAKE-7PILE ?auto_102193 ?auto_102194 ?auto_102195 ?auto_102196 ?auto_102197 ?auto_102198 ?auto_102199 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_102201 - BLOCK
      ?auto_102202 - BLOCK
      ?auto_102203 - BLOCK
      ?auto_102204 - BLOCK
      ?auto_102205 - BLOCK
      ?auto_102206 - BLOCK
      ?auto_102207 - BLOCK
    )
    :vars
    (
      ?auto_102208 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_102201 ?auto_102202 ) ) ( not ( = ?auto_102201 ?auto_102203 ) ) ( not ( = ?auto_102201 ?auto_102204 ) ) ( not ( = ?auto_102201 ?auto_102205 ) ) ( not ( = ?auto_102201 ?auto_102206 ) ) ( not ( = ?auto_102201 ?auto_102207 ) ) ( not ( = ?auto_102202 ?auto_102203 ) ) ( not ( = ?auto_102202 ?auto_102204 ) ) ( not ( = ?auto_102202 ?auto_102205 ) ) ( not ( = ?auto_102202 ?auto_102206 ) ) ( not ( = ?auto_102202 ?auto_102207 ) ) ( not ( = ?auto_102203 ?auto_102204 ) ) ( not ( = ?auto_102203 ?auto_102205 ) ) ( not ( = ?auto_102203 ?auto_102206 ) ) ( not ( = ?auto_102203 ?auto_102207 ) ) ( not ( = ?auto_102204 ?auto_102205 ) ) ( not ( = ?auto_102204 ?auto_102206 ) ) ( not ( = ?auto_102204 ?auto_102207 ) ) ( not ( = ?auto_102205 ?auto_102206 ) ) ( not ( = ?auto_102205 ?auto_102207 ) ) ( not ( = ?auto_102206 ?auto_102207 ) ) ( ON ?auto_102207 ?auto_102208 ) ( not ( = ?auto_102201 ?auto_102208 ) ) ( not ( = ?auto_102202 ?auto_102208 ) ) ( not ( = ?auto_102203 ?auto_102208 ) ) ( not ( = ?auto_102204 ?auto_102208 ) ) ( not ( = ?auto_102205 ?auto_102208 ) ) ( not ( = ?auto_102206 ?auto_102208 ) ) ( not ( = ?auto_102207 ?auto_102208 ) ) ( ON ?auto_102206 ?auto_102207 ) ( ON-TABLE ?auto_102208 ) ( ON ?auto_102205 ?auto_102206 ) ( ON ?auto_102204 ?auto_102205 ) ( ON ?auto_102203 ?auto_102204 ) ( ON ?auto_102202 ?auto_102203 ) ( CLEAR ?auto_102202 ) ( HOLDING ?auto_102201 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_102201 )
      ( MAKE-7PILE ?auto_102201 ?auto_102202 ?auto_102203 ?auto_102204 ?auto_102205 ?auto_102206 ?auto_102207 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_102209 - BLOCK
      ?auto_102210 - BLOCK
      ?auto_102211 - BLOCK
      ?auto_102212 - BLOCK
      ?auto_102213 - BLOCK
      ?auto_102214 - BLOCK
      ?auto_102215 - BLOCK
    )
    :vars
    (
      ?auto_102216 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_102209 ?auto_102210 ) ) ( not ( = ?auto_102209 ?auto_102211 ) ) ( not ( = ?auto_102209 ?auto_102212 ) ) ( not ( = ?auto_102209 ?auto_102213 ) ) ( not ( = ?auto_102209 ?auto_102214 ) ) ( not ( = ?auto_102209 ?auto_102215 ) ) ( not ( = ?auto_102210 ?auto_102211 ) ) ( not ( = ?auto_102210 ?auto_102212 ) ) ( not ( = ?auto_102210 ?auto_102213 ) ) ( not ( = ?auto_102210 ?auto_102214 ) ) ( not ( = ?auto_102210 ?auto_102215 ) ) ( not ( = ?auto_102211 ?auto_102212 ) ) ( not ( = ?auto_102211 ?auto_102213 ) ) ( not ( = ?auto_102211 ?auto_102214 ) ) ( not ( = ?auto_102211 ?auto_102215 ) ) ( not ( = ?auto_102212 ?auto_102213 ) ) ( not ( = ?auto_102212 ?auto_102214 ) ) ( not ( = ?auto_102212 ?auto_102215 ) ) ( not ( = ?auto_102213 ?auto_102214 ) ) ( not ( = ?auto_102213 ?auto_102215 ) ) ( not ( = ?auto_102214 ?auto_102215 ) ) ( ON ?auto_102215 ?auto_102216 ) ( not ( = ?auto_102209 ?auto_102216 ) ) ( not ( = ?auto_102210 ?auto_102216 ) ) ( not ( = ?auto_102211 ?auto_102216 ) ) ( not ( = ?auto_102212 ?auto_102216 ) ) ( not ( = ?auto_102213 ?auto_102216 ) ) ( not ( = ?auto_102214 ?auto_102216 ) ) ( not ( = ?auto_102215 ?auto_102216 ) ) ( ON ?auto_102214 ?auto_102215 ) ( ON-TABLE ?auto_102216 ) ( ON ?auto_102213 ?auto_102214 ) ( ON ?auto_102212 ?auto_102213 ) ( ON ?auto_102211 ?auto_102212 ) ( ON ?auto_102210 ?auto_102211 ) ( ON ?auto_102209 ?auto_102210 ) ( CLEAR ?auto_102209 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_102216 ?auto_102215 ?auto_102214 ?auto_102213 ?auto_102212 ?auto_102211 ?auto_102210 )
      ( MAKE-7PILE ?auto_102209 ?auto_102210 ?auto_102211 ?auto_102212 ?auto_102213 ?auto_102214 ?auto_102215 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_102223 - BLOCK
      ?auto_102224 - BLOCK
      ?auto_102225 - BLOCK
      ?auto_102226 - BLOCK
      ?auto_102227 - BLOCK
      ?auto_102228 - BLOCK
    )
    :vars
    (
      ?auto_102229 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_102229 ?auto_102228 ) ( CLEAR ?auto_102229 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_102223 ) ( ON ?auto_102224 ?auto_102223 ) ( ON ?auto_102225 ?auto_102224 ) ( ON ?auto_102226 ?auto_102225 ) ( ON ?auto_102227 ?auto_102226 ) ( ON ?auto_102228 ?auto_102227 ) ( not ( = ?auto_102223 ?auto_102224 ) ) ( not ( = ?auto_102223 ?auto_102225 ) ) ( not ( = ?auto_102223 ?auto_102226 ) ) ( not ( = ?auto_102223 ?auto_102227 ) ) ( not ( = ?auto_102223 ?auto_102228 ) ) ( not ( = ?auto_102223 ?auto_102229 ) ) ( not ( = ?auto_102224 ?auto_102225 ) ) ( not ( = ?auto_102224 ?auto_102226 ) ) ( not ( = ?auto_102224 ?auto_102227 ) ) ( not ( = ?auto_102224 ?auto_102228 ) ) ( not ( = ?auto_102224 ?auto_102229 ) ) ( not ( = ?auto_102225 ?auto_102226 ) ) ( not ( = ?auto_102225 ?auto_102227 ) ) ( not ( = ?auto_102225 ?auto_102228 ) ) ( not ( = ?auto_102225 ?auto_102229 ) ) ( not ( = ?auto_102226 ?auto_102227 ) ) ( not ( = ?auto_102226 ?auto_102228 ) ) ( not ( = ?auto_102226 ?auto_102229 ) ) ( not ( = ?auto_102227 ?auto_102228 ) ) ( not ( = ?auto_102227 ?auto_102229 ) ) ( not ( = ?auto_102228 ?auto_102229 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_102229 ?auto_102228 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_102245 - BLOCK
      ?auto_102246 - BLOCK
      ?auto_102247 - BLOCK
      ?auto_102248 - BLOCK
      ?auto_102249 - BLOCK
      ?auto_102250 - BLOCK
    )
    :vars
    (
      ?auto_102251 - BLOCK
      ?auto_102252 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_102245 ) ( ON ?auto_102246 ?auto_102245 ) ( ON ?auto_102247 ?auto_102246 ) ( ON ?auto_102248 ?auto_102247 ) ( ON ?auto_102249 ?auto_102248 ) ( not ( = ?auto_102245 ?auto_102246 ) ) ( not ( = ?auto_102245 ?auto_102247 ) ) ( not ( = ?auto_102245 ?auto_102248 ) ) ( not ( = ?auto_102245 ?auto_102249 ) ) ( not ( = ?auto_102245 ?auto_102250 ) ) ( not ( = ?auto_102245 ?auto_102251 ) ) ( not ( = ?auto_102246 ?auto_102247 ) ) ( not ( = ?auto_102246 ?auto_102248 ) ) ( not ( = ?auto_102246 ?auto_102249 ) ) ( not ( = ?auto_102246 ?auto_102250 ) ) ( not ( = ?auto_102246 ?auto_102251 ) ) ( not ( = ?auto_102247 ?auto_102248 ) ) ( not ( = ?auto_102247 ?auto_102249 ) ) ( not ( = ?auto_102247 ?auto_102250 ) ) ( not ( = ?auto_102247 ?auto_102251 ) ) ( not ( = ?auto_102248 ?auto_102249 ) ) ( not ( = ?auto_102248 ?auto_102250 ) ) ( not ( = ?auto_102248 ?auto_102251 ) ) ( not ( = ?auto_102249 ?auto_102250 ) ) ( not ( = ?auto_102249 ?auto_102251 ) ) ( not ( = ?auto_102250 ?auto_102251 ) ) ( ON ?auto_102251 ?auto_102252 ) ( CLEAR ?auto_102251 ) ( not ( = ?auto_102245 ?auto_102252 ) ) ( not ( = ?auto_102246 ?auto_102252 ) ) ( not ( = ?auto_102247 ?auto_102252 ) ) ( not ( = ?auto_102248 ?auto_102252 ) ) ( not ( = ?auto_102249 ?auto_102252 ) ) ( not ( = ?auto_102250 ?auto_102252 ) ) ( not ( = ?auto_102251 ?auto_102252 ) ) ( HOLDING ?auto_102250 ) ( CLEAR ?auto_102249 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_102245 ?auto_102246 ?auto_102247 ?auto_102248 ?auto_102249 ?auto_102250 ?auto_102251 )
      ( MAKE-6PILE ?auto_102245 ?auto_102246 ?auto_102247 ?auto_102248 ?auto_102249 ?auto_102250 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_102253 - BLOCK
      ?auto_102254 - BLOCK
      ?auto_102255 - BLOCK
      ?auto_102256 - BLOCK
      ?auto_102257 - BLOCK
      ?auto_102258 - BLOCK
    )
    :vars
    (
      ?auto_102259 - BLOCK
      ?auto_102260 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_102253 ) ( ON ?auto_102254 ?auto_102253 ) ( ON ?auto_102255 ?auto_102254 ) ( ON ?auto_102256 ?auto_102255 ) ( ON ?auto_102257 ?auto_102256 ) ( not ( = ?auto_102253 ?auto_102254 ) ) ( not ( = ?auto_102253 ?auto_102255 ) ) ( not ( = ?auto_102253 ?auto_102256 ) ) ( not ( = ?auto_102253 ?auto_102257 ) ) ( not ( = ?auto_102253 ?auto_102258 ) ) ( not ( = ?auto_102253 ?auto_102259 ) ) ( not ( = ?auto_102254 ?auto_102255 ) ) ( not ( = ?auto_102254 ?auto_102256 ) ) ( not ( = ?auto_102254 ?auto_102257 ) ) ( not ( = ?auto_102254 ?auto_102258 ) ) ( not ( = ?auto_102254 ?auto_102259 ) ) ( not ( = ?auto_102255 ?auto_102256 ) ) ( not ( = ?auto_102255 ?auto_102257 ) ) ( not ( = ?auto_102255 ?auto_102258 ) ) ( not ( = ?auto_102255 ?auto_102259 ) ) ( not ( = ?auto_102256 ?auto_102257 ) ) ( not ( = ?auto_102256 ?auto_102258 ) ) ( not ( = ?auto_102256 ?auto_102259 ) ) ( not ( = ?auto_102257 ?auto_102258 ) ) ( not ( = ?auto_102257 ?auto_102259 ) ) ( not ( = ?auto_102258 ?auto_102259 ) ) ( ON ?auto_102259 ?auto_102260 ) ( not ( = ?auto_102253 ?auto_102260 ) ) ( not ( = ?auto_102254 ?auto_102260 ) ) ( not ( = ?auto_102255 ?auto_102260 ) ) ( not ( = ?auto_102256 ?auto_102260 ) ) ( not ( = ?auto_102257 ?auto_102260 ) ) ( not ( = ?auto_102258 ?auto_102260 ) ) ( not ( = ?auto_102259 ?auto_102260 ) ) ( CLEAR ?auto_102257 ) ( ON ?auto_102258 ?auto_102259 ) ( CLEAR ?auto_102258 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_102260 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_102260 ?auto_102259 )
      ( MAKE-6PILE ?auto_102253 ?auto_102254 ?auto_102255 ?auto_102256 ?auto_102257 ?auto_102258 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_102261 - BLOCK
      ?auto_102262 - BLOCK
      ?auto_102263 - BLOCK
      ?auto_102264 - BLOCK
      ?auto_102265 - BLOCK
      ?auto_102266 - BLOCK
    )
    :vars
    (
      ?auto_102268 - BLOCK
      ?auto_102267 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_102261 ) ( ON ?auto_102262 ?auto_102261 ) ( ON ?auto_102263 ?auto_102262 ) ( ON ?auto_102264 ?auto_102263 ) ( not ( = ?auto_102261 ?auto_102262 ) ) ( not ( = ?auto_102261 ?auto_102263 ) ) ( not ( = ?auto_102261 ?auto_102264 ) ) ( not ( = ?auto_102261 ?auto_102265 ) ) ( not ( = ?auto_102261 ?auto_102266 ) ) ( not ( = ?auto_102261 ?auto_102268 ) ) ( not ( = ?auto_102262 ?auto_102263 ) ) ( not ( = ?auto_102262 ?auto_102264 ) ) ( not ( = ?auto_102262 ?auto_102265 ) ) ( not ( = ?auto_102262 ?auto_102266 ) ) ( not ( = ?auto_102262 ?auto_102268 ) ) ( not ( = ?auto_102263 ?auto_102264 ) ) ( not ( = ?auto_102263 ?auto_102265 ) ) ( not ( = ?auto_102263 ?auto_102266 ) ) ( not ( = ?auto_102263 ?auto_102268 ) ) ( not ( = ?auto_102264 ?auto_102265 ) ) ( not ( = ?auto_102264 ?auto_102266 ) ) ( not ( = ?auto_102264 ?auto_102268 ) ) ( not ( = ?auto_102265 ?auto_102266 ) ) ( not ( = ?auto_102265 ?auto_102268 ) ) ( not ( = ?auto_102266 ?auto_102268 ) ) ( ON ?auto_102268 ?auto_102267 ) ( not ( = ?auto_102261 ?auto_102267 ) ) ( not ( = ?auto_102262 ?auto_102267 ) ) ( not ( = ?auto_102263 ?auto_102267 ) ) ( not ( = ?auto_102264 ?auto_102267 ) ) ( not ( = ?auto_102265 ?auto_102267 ) ) ( not ( = ?auto_102266 ?auto_102267 ) ) ( not ( = ?auto_102268 ?auto_102267 ) ) ( ON ?auto_102266 ?auto_102268 ) ( CLEAR ?auto_102266 ) ( ON-TABLE ?auto_102267 ) ( HOLDING ?auto_102265 ) ( CLEAR ?auto_102264 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_102261 ?auto_102262 ?auto_102263 ?auto_102264 ?auto_102265 )
      ( MAKE-6PILE ?auto_102261 ?auto_102262 ?auto_102263 ?auto_102264 ?auto_102265 ?auto_102266 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_102269 - BLOCK
      ?auto_102270 - BLOCK
      ?auto_102271 - BLOCK
      ?auto_102272 - BLOCK
      ?auto_102273 - BLOCK
      ?auto_102274 - BLOCK
    )
    :vars
    (
      ?auto_102276 - BLOCK
      ?auto_102275 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_102269 ) ( ON ?auto_102270 ?auto_102269 ) ( ON ?auto_102271 ?auto_102270 ) ( ON ?auto_102272 ?auto_102271 ) ( not ( = ?auto_102269 ?auto_102270 ) ) ( not ( = ?auto_102269 ?auto_102271 ) ) ( not ( = ?auto_102269 ?auto_102272 ) ) ( not ( = ?auto_102269 ?auto_102273 ) ) ( not ( = ?auto_102269 ?auto_102274 ) ) ( not ( = ?auto_102269 ?auto_102276 ) ) ( not ( = ?auto_102270 ?auto_102271 ) ) ( not ( = ?auto_102270 ?auto_102272 ) ) ( not ( = ?auto_102270 ?auto_102273 ) ) ( not ( = ?auto_102270 ?auto_102274 ) ) ( not ( = ?auto_102270 ?auto_102276 ) ) ( not ( = ?auto_102271 ?auto_102272 ) ) ( not ( = ?auto_102271 ?auto_102273 ) ) ( not ( = ?auto_102271 ?auto_102274 ) ) ( not ( = ?auto_102271 ?auto_102276 ) ) ( not ( = ?auto_102272 ?auto_102273 ) ) ( not ( = ?auto_102272 ?auto_102274 ) ) ( not ( = ?auto_102272 ?auto_102276 ) ) ( not ( = ?auto_102273 ?auto_102274 ) ) ( not ( = ?auto_102273 ?auto_102276 ) ) ( not ( = ?auto_102274 ?auto_102276 ) ) ( ON ?auto_102276 ?auto_102275 ) ( not ( = ?auto_102269 ?auto_102275 ) ) ( not ( = ?auto_102270 ?auto_102275 ) ) ( not ( = ?auto_102271 ?auto_102275 ) ) ( not ( = ?auto_102272 ?auto_102275 ) ) ( not ( = ?auto_102273 ?auto_102275 ) ) ( not ( = ?auto_102274 ?auto_102275 ) ) ( not ( = ?auto_102276 ?auto_102275 ) ) ( ON ?auto_102274 ?auto_102276 ) ( ON-TABLE ?auto_102275 ) ( CLEAR ?auto_102272 ) ( ON ?auto_102273 ?auto_102274 ) ( CLEAR ?auto_102273 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_102275 ?auto_102276 ?auto_102274 )
      ( MAKE-6PILE ?auto_102269 ?auto_102270 ?auto_102271 ?auto_102272 ?auto_102273 ?auto_102274 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_102277 - BLOCK
      ?auto_102278 - BLOCK
      ?auto_102279 - BLOCK
      ?auto_102280 - BLOCK
      ?auto_102281 - BLOCK
      ?auto_102282 - BLOCK
    )
    :vars
    (
      ?auto_102283 - BLOCK
      ?auto_102284 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_102277 ) ( ON ?auto_102278 ?auto_102277 ) ( ON ?auto_102279 ?auto_102278 ) ( not ( = ?auto_102277 ?auto_102278 ) ) ( not ( = ?auto_102277 ?auto_102279 ) ) ( not ( = ?auto_102277 ?auto_102280 ) ) ( not ( = ?auto_102277 ?auto_102281 ) ) ( not ( = ?auto_102277 ?auto_102282 ) ) ( not ( = ?auto_102277 ?auto_102283 ) ) ( not ( = ?auto_102278 ?auto_102279 ) ) ( not ( = ?auto_102278 ?auto_102280 ) ) ( not ( = ?auto_102278 ?auto_102281 ) ) ( not ( = ?auto_102278 ?auto_102282 ) ) ( not ( = ?auto_102278 ?auto_102283 ) ) ( not ( = ?auto_102279 ?auto_102280 ) ) ( not ( = ?auto_102279 ?auto_102281 ) ) ( not ( = ?auto_102279 ?auto_102282 ) ) ( not ( = ?auto_102279 ?auto_102283 ) ) ( not ( = ?auto_102280 ?auto_102281 ) ) ( not ( = ?auto_102280 ?auto_102282 ) ) ( not ( = ?auto_102280 ?auto_102283 ) ) ( not ( = ?auto_102281 ?auto_102282 ) ) ( not ( = ?auto_102281 ?auto_102283 ) ) ( not ( = ?auto_102282 ?auto_102283 ) ) ( ON ?auto_102283 ?auto_102284 ) ( not ( = ?auto_102277 ?auto_102284 ) ) ( not ( = ?auto_102278 ?auto_102284 ) ) ( not ( = ?auto_102279 ?auto_102284 ) ) ( not ( = ?auto_102280 ?auto_102284 ) ) ( not ( = ?auto_102281 ?auto_102284 ) ) ( not ( = ?auto_102282 ?auto_102284 ) ) ( not ( = ?auto_102283 ?auto_102284 ) ) ( ON ?auto_102282 ?auto_102283 ) ( ON-TABLE ?auto_102284 ) ( ON ?auto_102281 ?auto_102282 ) ( CLEAR ?auto_102281 ) ( HOLDING ?auto_102280 ) ( CLEAR ?auto_102279 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_102277 ?auto_102278 ?auto_102279 ?auto_102280 )
      ( MAKE-6PILE ?auto_102277 ?auto_102278 ?auto_102279 ?auto_102280 ?auto_102281 ?auto_102282 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_102285 - BLOCK
      ?auto_102286 - BLOCK
      ?auto_102287 - BLOCK
      ?auto_102288 - BLOCK
      ?auto_102289 - BLOCK
      ?auto_102290 - BLOCK
    )
    :vars
    (
      ?auto_102292 - BLOCK
      ?auto_102291 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_102285 ) ( ON ?auto_102286 ?auto_102285 ) ( ON ?auto_102287 ?auto_102286 ) ( not ( = ?auto_102285 ?auto_102286 ) ) ( not ( = ?auto_102285 ?auto_102287 ) ) ( not ( = ?auto_102285 ?auto_102288 ) ) ( not ( = ?auto_102285 ?auto_102289 ) ) ( not ( = ?auto_102285 ?auto_102290 ) ) ( not ( = ?auto_102285 ?auto_102292 ) ) ( not ( = ?auto_102286 ?auto_102287 ) ) ( not ( = ?auto_102286 ?auto_102288 ) ) ( not ( = ?auto_102286 ?auto_102289 ) ) ( not ( = ?auto_102286 ?auto_102290 ) ) ( not ( = ?auto_102286 ?auto_102292 ) ) ( not ( = ?auto_102287 ?auto_102288 ) ) ( not ( = ?auto_102287 ?auto_102289 ) ) ( not ( = ?auto_102287 ?auto_102290 ) ) ( not ( = ?auto_102287 ?auto_102292 ) ) ( not ( = ?auto_102288 ?auto_102289 ) ) ( not ( = ?auto_102288 ?auto_102290 ) ) ( not ( = ?auto_102288 ?auto_102292 ) ) ( not ( = ?auto_102289 ?auto_102290 ) ) ( not ( = ?auto_102289 ?auto_102292 ) ) ( not ( = ?auto_102290 ?auto_102292 ) ) ( ON ?auto_102292 ?auto_102291 ) ( not ( = ?auto_102285 ?auto_102291 ) ) ( not ( = ?auto_102286 ?auto_102291 ) ) ( not ( = ?auto_102287 ?auto_102291 ) ) ( not ( = ?auto_102288 ?auto_102291 ) ) ( not ( = ?auto_102289 ?auto_102291 ) ) ( not ( = ?auto_102290 ?auto_102291 ) ) ( not ( = ?auto_102292 ?auto_102291 ) ) ( ON ?auto_102290 ?auto_102292 ) ( ON-TABLE ?auto_102291 ) ( ON ?auto_102289 ?auto_102290 ) ( CLEAR ?auto_102287 ) ( ON ?auto_102288 ?auto_102289 ) ( CLEAR ?auto_102288 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_102291 ?auto_102292 ?auto_102290 ?auto_102289 )
      ( MAKE-6PILE ?auto_102285 ?auto_102286 ?auto_102287 ?auto_102288 ?auto_102289 ?auto_102290 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_102293 - BLOCK
      ?auto_102294 - BLOCK
      ?auto_102295 - BLOCK
      ?auto_102296 - BLOCK
      ?auto_102297 - BLOCK
      ?auto_102298 - BLOCK
    )
    :vars
    (
      ?auto_102300 - BLOCK
      ?auto_102299 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_102293 ) ( ON ?auto_102294 ?auto_102293 ) ( not ( = ?auto_102293 ?auto_102294 ) ) ( not ( = ?auto_102293 ?auto_102295 ) ) ( not ( = ?auto_102293 ?auto_102296 ) ) ( not ( = ?auto_102293 ?auto_102297 ) ) ( not ( = ?auto_102293 ?auto_102298 ) ) ( not ( = ?auto_102293 ?auto_102300 ) ) ( not ( = ?auto_102294 ?auto_102295 ) ) ( not ( = ?auto_102294 ?auto_102296 ) ) ( not ( = ?auto_102294 ?auto_102297 ) ) ( not ( = ?auto_102294 ?auto_102298 ) ) ( not ( = ?auto_102294 ?auto_102300 ) ) ( not ( = ?auto_102295 ?auto_102296 ) ) ( not ( = ?auto_102295 ?auto_102297 ) ) ( not ( = ?auto_102295 ?auto_102298 ) ) ( not ( = ?auto_102295 ?auto_102300 ) ) ( not ( = ?auto_102296 ?auto_102297 ) ) ( not ( = ?auto_102296 ?auto_102298 ) ) ( not ( = ?auto_102296 ?auto_102300 ) ) ( not ( = ?auto_102297 ?auto_102298 ) ) ( not ( = ?auto_102297 ?auto_102300 ) ) ( not ( = ?auto_102298 ?auto_102300 ) ) ( ON ?auto_102300 ?auto_102299 ) ( not ( = ?auto_102293 ?auto_102299 ) ) ( not ( = ?auto_102294 ?auto_102299 ) ) ( not ( = ?auto_102295 ?auto_102299 ) ) ( not ( = ?auto_102296 ?auto_102299 ) ) ( not ( = ?auto_102297 ?auto_102299 ) ) ( not ( = ?auto_102298 ?auto_102299 ) ) ( not ( = ?auto_102300 ?auto_102299 ) ) ( ON ?auto_102298 ?auto_102300 ) ( ON-TABLE ?auto_102299 ) ( ON ?auto_102297 ?auto_102298 ) ( ON ?auto_102296 ?auto_102297 ) ( CLEAR ?auto_102296 ) ( HOLDING ?auto_102295 ) ( CLEAR ?auto_102294 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_102293 ?auto_102294 ?auto_102295 )
      ( MAKE-6PILE ?auto_102293 ?auto_102294 ?auto_102295 ?auto_102296 ?auto_102297 ?auto_102298 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_102301 - BLOCK
      ?auto_102302 - BLOCK
      ?auto_102303 - BLOCK
      ?auto_102304 - BLOCK
      ?auto_102305 - BLOCK
      ?auto_102306 - BLOCK
    )
    :vars
    (
      ?auto_102307 - BLOCK
      ?auto_102308 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_102301 ) ( ON ?auto_102302 ?auto_102301 ) ( not ( = ?auto_102301 ?auto_102302 ) ) ( not ( = ?auto_102301 ?auto_102303 ) ) ( not ( = ?auto_102301 ?auto_102304 ) ) ( not ( = ?auto_102301 ?auto_102305 ) ) ( not ( = ?auto_102301 ?auto_102306 ) ) ( not ( = ?auto_102301 ?auto_102307 ) ) ( not ( = ?auto_102302 ?auto_102303 ) ) ( not ( = ?auto_102302 ?auto_102304 ) ) ( not ( = ?auto_102302 ?auto_102305 ) ) ( not ( = ?auto_102302 ?auto_102306 ) ) ( not ( = ?auto_102302 ?auto_102307 ) ) ( not ( = ?auto_102303 ?auto_102304 ) ) ( not ( = ?auto_102303 ?auto_102305 ) ) ( not ( = ?auto_102303 ?auto_102306 ) ) ( not ( = ?auto_102303 ?auto_102307 ) ) ( not ( = ?auto_102304 ?auto_102305 ) ) ( not ( = ?auto_102304 ?auto_102306 ) ) ( not ( = ?auto_102304 ?auto_102307 ) ) ( not ( = ?auto_102305 ?auto_102306 ) ) ( not ( = ?auto_102305 ?auto_102307 ) ) ( not ( = ?auto_102306 ?auto_102307 ) ) ( ON ?auto_102307 ?auto_102308 ) ( not ( = ?auto_102301 ?auto_102308 ) ) ( not ( = ?auto_102302 ?auto_102308 ) ) ( not ( = ?auto_102303 ?auto_102308 ) ) ( not ( = ?auto_102304 ?auto_102308 ) ) ( not ( = ?auto_102305 ?auto_102308 ) ) ( not ( = ?auto_102306 ?auto_102308 ) ) ( not ( = ?auto_102307 ?auto_102308 ) ) ( ON ?auto_102306 ?auto_102307 ) ( ON-TABLE ?auto_102308 ) ( ON ?auto_102305 ?auto_102306 ) ( ON ?auto_102304 ?auto_102305 ) ( CLEAR ?auto_102302 ) ( ON ?auto_102303 ?auto_102304 ) ( CLEAR ?auto_102303 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_102308 ?auto_102307 ?auto_102306 ?auto_102305 ?auto_102304 )
      ( MAKE-6PILE ?auto_102301 ?auto_102302 ?auto_102303 ?auto_102304 ?auto_102305 ?auto_102306 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_102309 - BLOCK
      ?auto_102310 - BLOCK
      ?auto_102311 - BLOCK
      ?auto_102312 - BLOCK
      ?auto_102313 - BLOCK
      ?auto_102314 - BLOCK
    )
    :vars
    (
      ?auto_102315 - BLOCK
      ?auto_102316 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_102309 ) ( not ( = ?auto_102309 ?auto_102310 ) ) ( not ( = ?auto_102309 ?auto_102311 ) ) ( not ( = ?auto_102309 ?auto_102312 ) ) ( not ( = ?auto_102309 ?auto_102313 ) ) ( not ( = ?auto_102309 ?auto_102314 ) ) ( not ( = ?auto_102309 ?auto_102315 ) ) ( not ( = ?auto_102310 ?auto_102311 ) ) ( not ( = ?auto_102310 ?auto_102312 ) ) ( not ( = ?auto_102310 ?auto_102313 ) ) ( not ( = ?auto_102310 ?auto_102314 ) ) ( not ( = ?auto_102310 ?auto_102315 ) ) ( not ( = ?auto_102311 ?auto_102312 ) ) ( not ( = ?auto_102311 ?auto_102313 ) ) ( not ( = ?auto_102311 ?auto_102314 ) ) ( not ( = ?auto_102311 ?auto_102315 ) ) ( not ( = ?auto_102312 ?auto_102313 ) ) ( not ( = ?auto_102312 ?auto_102314 ) ) ( not ( = ?auto_102312 ?auto_102315 ) ) ( not ( = ?auto_102313 ?auto_102314 ) ) ( not ( = ?auto_102313 ?auto_102315 ) ) ( not ( = ?auto_102314 ?auto_102315 ) ) ( ON ?auto_102315 ?auto_102316 ) ( not ( = ?auto_102309 ?auto_102316 ) ) ( not ( = ?auto_102310 ?auto_102316 ) ) ( not ( = ?auto_102311 ?auto_102316 ) ) ( not ( = ?auto_102312 ?auto_102316 ) ) ( not ( = ?auto_102313 ?auto_102316 ) ) ( not ( = ?auto_102314 ?auto_102316 ) ) ( not ( = ?auto_102315 ?auto_102316 ) ) ( ON ?auto_102314 ?auto_102315 ) ( ON-TABLE ?auto_102316 ) ( ON ?auto_102313 ?auto_102314 ) ( ON ?auto_102312 ?auto_102313 ) ( ON ?auto_102311 ?auto_102312 ) ( CLEAR ?auto_102311 ) ( HOLDING ?auto_102310 ) ( CLEAR ?auto_102309 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_102309 ?auto_102310 )
      ( MAKE-6PILE ?auto_102309 ?auto_102310 ?auto_102311 ?auto_102312 ?auto_102313 ?auto_102314 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_102317 - BLOCK
      ?auto_102318 - BLOCK
      ?auto_102319 - BLOCK
      ?auto_102320 - BLOCK
      ?auto_102321 - BLOCK
      ?auto_102322 - BLOCK
    )
    :vars
    (
      ?auto_102324 - BLOCK
      ?auto_102323 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_102317 ) ( not ( = ?auto_102317 ?auto_102318 ) ) ( not ( = ?auto_102317 ?auto_102319 ) ) ( not ( = ?auto_102317 ?auto_102320 ) ) ( not ( = ?auto_102317 ?auto_102321 ) ) ( not ( = ?auto_102317 ?auto_102322 ) ) ( not ( = ?auto_102317 ?auto_102324 ) ) ( not ( = ?auto_102318 ?auto_102319 ) ) ( not ( = ?auto_102318 ?auto_102320 ) ) ( not ( = ?auto_102318 ?auto_102321 ) ) ( not ( = ?auto_102318 ?auto_102322 ) ) ( not ( = ?auto_102318 ?auto_102324 ) ) ( not ( = ?auto_102319 ?auto_102320 ) ) ( not ( = ?auto_102319 ?auto_102321 ) ) ( not ( = ?auto_102319 ?auto_102322 ) ) ( not ( = ?auto_102319 ?auto_102324 ) ) ( not ( = ?auto_102320 ?auto_102321 ) ) ( not ( = ?auto_102320 ?auto_102322 ) ) ( not ( = ?auto_102320 ?auto_102324 ) ) ( not ( = ?auto_102321 ?auto_102322 ) ) ( not ( = ?auto_102321 ?auto_102324 ) ) ( not ( = ?auto_102322 ?auto_102324 ) ) ( ON ?auto_102324 ?auto_102323 ) ( not ( = ?auto_102317 ?auto_102323 ) ) ( not ( = ?auto_102318 ?auto_102323 ) ) ( not ( = ?auto_102319 ?auto_102323 ) ) ( not ( = ?auto_102320 ?auto_102323 ) ) ( not ( = ?auto_102321 ?auto_102323 ) ) ( not ( = ?auto_102322 ?auto_102323 ) ) ( not ( = ?auto_102324 ?auto_102323 ) ) ( ON ?auto_102322 ?auto_102324 ) ( ON-TABLE ?auto_102323 ) ( ON ?auto_102321 ?auto_102322 ) ( ON ?auto_102320 ?auto_102321 ) ( ON ?auto_102319 ?auto_102320 ) ( CLEAR ?auto_102317 ) ( ON ?auto_102318 ?auto_102319 ) ( CLEAR ?auto_102318 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_102323 ?auto_102324 ?auto_102322 ?auto_102321 ?auto_102320 ?auto_102319 )
      ( MAKE-6PILE ?auto_102317 ?auto_102318 ?auto_102319 ?auto_102320 ?auto_102321 ?auto_102322 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_102325 - BLOCK
      ?auto_102326 - BLOCK
      ?auto_102327 - BLOCK
      ?auto_102328 - BLOCK
      ?auto_102329 - BLOCK
      ?auto_102330 - BLOCK
    )
    :vars
    (
      ?auto_102332 - BLOCK
      ?auto_102331 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_102325 ?auto_102326 ) ) ( not ( = ?auto_102325 ?auto_102327 ) ) ( not ( = ?auto_102325 ?auto_102328 ) ) ( not ( = ?auto_102325 ?auto_102329 ) ) ( not ( = ?auto_102325 ?auto_102330 ) ) ( not ( = ?auto_102325 ?auto_102332 ) ) ( not ( = ?auto_102326 ?auto_102327 ) ) ( not ( = ?auto_102326 ?auto_102328 ) ) ( not ( = ?auto_102326 ?auto_102329 ) ) ( not ( = ?auto_102326 ?auto_102330 ) ) ( not ( = ?auto_102326 ?auto_102332 ) ) ( not ( = ?auto_102327 ?auto_102328 ) ) ( not ( = ?auto_102327 ?auto_102329 ) ) ( not ( = ?auto_102327 ?auto_102330 ) ) ( not ( = ?auto_102327 ?auto_102332 ) ) ( not ( = ?auto_102328 ?auto_102329 ) ) ( not ( = ?auto_102328 ?auto_102330 ) ) ( not ( = ?auto_102328 ?auto_102332 ) ) ( not ( = ?auto_102329 ?auto_102330 ) ) ( not ( = ?auto_102329 ?auto_102332 ) ) ( not ( = ?auto_102330 ?auto_102332 ) ) ( ON ?auto_102332 ?auto_102331 ) ( not ( = ?auto_102325 ?auto_102331 ) ) ( not ( = ?auto_102326 ?auto_102331 ) ) ( not ( = ?auto_102327 ?auto_102331 ) ) ( not ( = ?auto_102328 ?auto_102331 ) ) ( not ( = ?auto_102329 ?auto_102331 ) ) ( not ( = ?auto_102330 ?auto_102331 ) ) ( not ( = ?auto_102332 ?auto_102331 ) ) ( ON ?auto_102330 ?auto_102332 ) ( ON-TABLE ?auto_102331 ) ( ON ?auto_102329 ?auto_102330 ) ( ON ?auto_102328 ?auto_102329 ) ( ON ?auto_102327 ?auto_102328 ) ( ON ?auto_102326 ?auto_102327 ) ( CLEAR ?auto_102326 ) ( HOLDING ?auto_102325 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_102325 )
      ( MAKE-6PILE ?auto_102325 ?auto_102326 ?auto_102327 ?auto_102328 ?auto_102329 ?auto_102330 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_102333 - BLOCK
      ?auto_102334 - BLOCK
      ?auto_102335 - BLOCK
      ?auto_102336 - BLOCK
      ?auto_102337 - BLOCK
      ?auto_102338 - BLOCK
    )
    :vars
    (
      ?auto_102340 - BLOCK
      ?auto_102339 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_102333 ?auto_102334 ) ) ( not ( = ?auto_102333 ?auto_102335 ) ) ( not ( = ?auto_102333 ?auto_102336 ) ) ( not ( = ?auto_102333 ?auto_102337 ) ) ( not ( = ?auto_102333 ?auto_102338 ) ) ( not ( = ?auto_102333 ?auto_102340 ) ) ( not ( = ?auto_102334 ?auto_102335 ) ) ( not ( = ?auto_102334 ?auto_102336 ) ) ( not ( = ?auto_102334 ?auto_102337 ) ) ( not ( = ?auto_102334 ?auto_102338 ) ) ( not ( = ?auto_102334 ?auto_102340 ) ) ( not ( = ?auto_102335 ?auto_102336 ) ) ( not ( = ?auto_102335 ?auto_102337 ) ) ( not ( = ?auto_102335 ?auto_102338 ) ) ( not ( = ?auto_102335 ?auto_102340 ) ) ( not ( = ?auto_102336 ?auto_102337 ) ) ( not ( = ?auto_102336 ?auto_102338 ) ) ( not ( = ?auto_102336 ?auto_102340 ) ) ( not ( = ?auto_102337 ?auto_102338 ) ) ( not ( = ?auto_102337 ?auto_102340 ) ) ( not ( = ?auto_102338 ?auto_102340 ) ) ( ON ?auto_102340 ?auto_102339 ) ( not ( = ?auto_102333 ?auto_102339 ) ) ( not ( = ?auto_102334 ?auto_102339 ) ) ( not ( = ?auto_102335 ?auto_102339 ) ) ( not ( = ?auto_102336 ?auto_102339 ) ) ( not ( = ?auto_102337 ?auto_102339 ) ) ( not ( = ?auto_102338 ?auto_102339 ) ) ( not ( = ?auto_102340 ?auto_102339 ) ) ( ON ?auto_102338 ?auto_102340 ) ( ON-TABLE ?auto_102339 ) ( ON ?auto_102337 ?auto_102338 ) ( ON ?auto_102336 ?auto_102337 ) ( ON ?auto_102335 ?auto_102336 ) ( ON ?auto_102334 ?auto_102335 ) ( ON ?auto_102333 ?auto_102334 ) ( CLEAR ?auto_102333 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_102339 ?auto_102340 ?auto_102338 ?auto_102337 ?auto_102336 ?auto_102335 ?auto_102334 )
      ( MAKE-6PILE ?auto_102333 ?auto_102334 ?auto_102335 ?auto_102336 ?auto_102337 ?auto_102338 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_102342 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_102342 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_102342 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_102343 - BLOCK
    )
    :vars
    (
      ?auto_102344 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_102343 ?auto_102344 ) ( CLEAR ?auto_102343 ) ( HAND-EMPTY ) ( not ( = ?auto_102343 ?auto_102344 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_102343 ?auto_102344 )
      ( MAKE-1PILE ?auto_102343 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_102345 - BLOCK
    )
    :vars
    (
      ?auto_102346 - BLOCK
      ?auto_102349 - BLOCK
      ?auto_102348 - BLOCK
      ?auto_102350 - BLOCK
      ?auto_102347 - BLOCK
      ?auto_102351 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_102345 ?auto_102346 ) ) ( HOLDING ?auto_102345 ) ( CLEAR ?auto_102346 ) ( ON-TABLE ?auto_102349 ) ( ON ?auto_102348 ?auto_102349 ) ( ON ?auto_102350 ?auto_102348 ) ( ON ?auto_102347 ?auto_102350 ) ( ON ?auto_102351 ?auto_102347 ) ( ON ?auto_102346 ?auto_102351 ) ( not ( = ?auto_102349 ?auto_102348 ) ) ( not ( = ?auto_102349 ?auto_102350 ) ) ( not ( = ?auto_102349 ?auto_102347 ) ) ( not ( = ?auto_102349 ?auto_102351 ) ) ( not ( = ?auto_102349 ?auto_102346 ) ) ( not ( = ?auto_102349 ?auto_102345 ) ) ( not ( = ?auto_102348 ?auto_102350 ) ) ( not ( = ?auto_102348 ?auto_102347 ) ) ( not ( = ?auto_102348 ?auto_102351 ) ) ( not ( = ?auto_102348 ?auto_102346 ) ) ( not ( = ?auto_102348 ?auto_102345 ) ) ( not ( = ?auto_102350 ?auto_102347 ) ) ( not ( = ?auto_102350 ?auto_102351 ) ) ( not ( = ?auto_102350 ?auto_102346 ) ) ( not ( = ?auto_102350 ?auto_102345 ) ) ( not ( = ?auto_102347 ?auto_102351 ) ) ( not ( = ?auto_102347 ?auto_102346 ) ) ( not ( = ?auto_102347 ?auto_102345 ) ) ( not ( = ?auto_102351 ?auto_102346 ) ) ( not ( = ?auto_102351 ?auto_102345 ) ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_102349 ?auto_102348 ?auto_102350 ?auto_102347 ?auto_102351 ?auto_102346 ?auto_102345 )
      ( MAKE-1PILE ?auto_102345 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_102352 - BLOCK
    )
    :vars
    (
      ?auto_102356 - BLOCK
      ?auto_102354 - BLOCK
      ?auto_102355 - BLOCK
      ?auto_102358 - BLOCK
      ?auto_102357 - BLOCK
      ?auto_102353 - BLOCK
      ?auto_102359 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_102352 ?auto_102356 ) ) ( CLEAR ?auto_102356 ) ( ON-TABLE ?auto_102354 ) ( ON ?auto_102355 ?auto_102354 ) ( ON ?auto_102358 ?auto_102355 ) ( ON ?auto_102357 ?auto_102358 ) ( ON ?auto_102353 ?auto_102357 ) ( ON ?auto_102356 ?auto_102353 ) ( not ( = ?auto_102354 ?auto_102355 ) ) ( not ( = ?auto_102354 ?auto_102358 ) ) ( not ( = ?auto_102354 ?auto_102357 ) ) ( not ( = ?auto_102354 ?auto_102353 ) ) ( not ( = ?auto_102354 ?auto_102356 ) ) ( not ( = ?auto_102354 ?auto_102352 ) ) ( not ( = ?auto_102355 ?auto_102358 ) ) ( not ( = ?auto_102355 ?auto_102357 ) ) ( not ( = ?auto_102355 ?auto_102353 ) ) ( not ( = ?auto_102355 ?auto_102356 ) ) ( not ( = ?auto_102355 ?auto_102352 ) ) ( not ( = ?auto_102358 ?auto_102357 ) ) ( not ( = ?auto_102358 ?auto_102353 ) ) ( not ( = ?auto_102358 ?auto_102356 ) ) ( not ( = ?auto_102358 ?auto_102352 ) ) ( not ( = ?auto_102357 ?auto_102353 ) ) ( not ( = ?auto_102357 ?auto_102356 ) ) ( not ( = ?auto_102357 ?auto_102352 ) ) ( not ( = ?auto_102353 ?auto_102356 ) ) ( not ( = ?auto_102353 ?auto_102352 ) ) ( ON ?auto_102352 ?auto_102359 ) ( CLEAR ?auto_102352 ) ( HAND-EMPTY ) ( not ( = ?auto_102352 ?auto_102359 ) ) ( not ( = ?auto_102356 ?auto_102359 ) ) ( not ( = ?auto_102354 ?auto_102359 ) ) ( not ( = ?auto_102355 ?auto_102359 ) ) ( not ( = ?auto_102358 ?auto_102359 ) ) ( not ( = ?auto_102357 ?auto_102359 ) ) ( not ( = ?auto_102353 ?auto_102359 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_102352 ?auto_102359 )
      ( MAKE-1PILE ?auto_102352 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_102360 - BLOCK
    )
    :vars
    (
      ?auto_102366 - BLOCK
      ?auto_102365 - BLOCK
      ?auto_102364 - BLOCK
      ?auto_102362 - BLOCK
      ?auto_102363 - BLOCK
      ?auto_102361 - BLOCK
      ?auto_102367 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_102360 ?auto_102366 ) ) ( ON-TABLE ?auto_102365 ) ( ON ?auto_102364 ?auto_102365 ) ( ON ?auto_102362 ?auto_102364 ) ( ON ?auto_102363 ?auto_102362 ) ( ON ?auto_102361 ?auto_102363 ) ( not ( = ?auto_102365 ?auto_102364 ) ) ( not ( = ?auto_102365 ?auto_102362 ) ) ( not ( = ?auto_102365 ?auto_102363 ) ) ( not ( = ?auto_102365 ?auto_102361 ) ) ( not ( = ?auto_102365 ?auto_102366 ) ) ( not ( = ?auto_102365 ?auto_102360 ) ) ( not ( = ?auto_102364 ?auto_102362 ) ) ( not ( = ?auto_102364 ?auto_102363 ) ) ( not ( = ?auto_102364 ?auto_102361 ) ) ( not ( = ?auto_102364 ?auto_102366 ) ) ( not ( = ?auto_102364 ?auto_102360 ) ) ( not ( = ?auto_102362 ?auto_102363 ) ) ( not ( = ?auto_102362 ?auto_102361 ) ) ( not ( = ?auto_102362 ?auto_102366 ) ) ( not ( = ?auto_102362 ?auto_102360 ) ) ( not ( = ?auto_102363 ?auto_102361 ) ) ( not ( = ?auto_102363 ?auto_102366 ) ) ( not ( = ?auto_102363 ?auto_102360 ) ) ( not ( = ?auto_102361 ?auto_102366 ) ) ( not ( = ?auto_102361 ?auto_102360 ) ) ( ON ?auto_102360 ?auto_102367 ) ( CLEAR ?auto_102360 ) ( not ( = ?auto_102360 ?auto_102367 ) ) ( not ( = ?auto_102366 ?auto_102367 ) ) ( not ( = ?auto_102365 ?auto_102367 ) ) ( not ( = ?auto_102364 ?auto_102367 ) ) ( not ( = ?auto_102362 ?auto_102367 ) ) ( not ( = ?auto_102363 ?auto_102367 ) ) ( not ( = ?auto_102361 ?auto_102367 ) ) ( HOLDING ?auto_102366 ) ( CLEAR ?auto_102361 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_102365 ?auto_102364 ?auto_102362 ?auto_102363 ?auto_102361 ?auto_102366 )
      ( MAKE-1PILE ?auto_102360 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_102368 - BLOCK
    )
    :vars
    (
      ?auto_102373 - BLOCK
      ?auto_102372 - BLOCK
      ?auto_102370 - BLOCK
      ?auto_102375 - BLOCK
      ?auto_102371 - BLOCK
      ?auto_102369 - BLOCK
      ?auto_102374 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_102368 ?auto_102373 ) ) ( ON-TABLE ?auto_102372 ) ( ON ?auto_102370 ?auto_102372 ) ( ON ?auto_102375 ?auto_102370 ) ( ON ?auto_102371 ?auto_102375 ) ( ON ?auto_102369 ?auto_102371 ) ( not ( = ?auto_102372 ?auto_102370 ) ) ( not ( = ?auto_102372 ?auto_102375 ) ) ( not ( = ?auto_102372 ?auto_102371 ) ) ( not ( = ?auto_102372 ?auto_102369 ) ) ( not ( = ?auto_102372 ?auto_102373 ) ) ( not ( = ?auto_102372 ?auto_102368 ) ) ( not ( = ?auto_102370 ?auto_102375 ) ) ( not ( = ?auto_102370 ?auto_102371 ) ) ( not ( = ?auto_102370 ?auto_102369 ) ) ( not ( = ?auto_102370 ?auto_102373 ) ) ( not ( = ?auto_102370 ?auto_102368 ) ) ( not ( = ?auto_102375 ?auto_102371 ) ) ( not ( = ?auto_102375 ?auto_102369 ) ) ( not ( = ?auto_102375 ?auto_102373 ) ) ( not ( = ?auto_102375 ?auto_102368 ) ) ( not ( = ?auto_102371 ?auto_102369 ) ) ( not ( = ?auto_102371 ?auto_102373 ) ) ( not ( = ?auto_102371 ?auto_102368 ) ) ( not ( = ?auto_102369 ?auto_102373 ) ) ( not ( = ?auto_102369 ?auto_102368 ) ) ( ON ?auto_102368 ?auto_102374 ) ( not ( = ?auto_102368 ?auto_102374 ) ) ( not ( = ?auto_102373 ?auto_102374 ) ) ( not ( = ?auto_102372 ?auto_102374 ) ) ( not ( = ?auto_102370 ?auto_102374 ) ) ( not ( = ?auto_102375 ?auto_102374 ) ) ( not ( = ?auto_102371 ?auto_102374 ) ) ( not ( = ?auto_102369 ?auto_102374 ) ) ( CLEAR ?auto_102369 ) ( ON ?auto_102373 ?auto_102368 ) ( CLEAR ?auto_102373 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_102374 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_102374 ?auto_102368 )
      ( MAKE-1PILE ?auto_102368 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_102376 - BLOCK
    )
    :vars
    (
      ?auto_102383 - BLOCK
      ?auto_102377 - BLOCK
      ?auto_102379 - BLOCK
      ?auto_102378 - BLOCK
      ?auto_102382 - BLOCK
      ?auto_102380 - BLOCK
      ?auto_102381 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_102376 ?auto_102383 ) ) ( ON-TABLE ?auto_102377 ) ( ON ?auto_102379 ?auto_102377 ) ( ON ?auto_102378 ?auto_102379 ) ( ON ?auto_102382 ?auto_102378 ) ( not ( = ?auto_102377 ?auto_102379 ) ) ( not ( = ?auto_102377 ?auto_102378 ) ) ( not ( = ?auto_102377 ?auto_102382 ) ) ( not ( = ?auto_102377 ?auto_102380 ) ) ( not ( = ?auto_102377 ?auto_102383 ) ) ( not ( = ?auto_102377 ?auto_102376 ) ) ( not ( = ?auto_102379 ?auto_102378 ) ) ( not ( = ?auto_102379 ?auto_102382 ) ) ( not ( = ?auto_102379 ?auto_102380 ) ) ( not ( = ?auto_102379 ?auto_102383 ) ) ( not ( = ?auto_102379 ?auto_102376 ) ) ( not ( = ?auto_102378 ?auto_102382 ) ) ( not ( = ?auto_102378 ?auto_102380 ) ) ( not ( = ?auto_102378 ?auto_102383 ) ) ( not ( = ?auto_102378 ?auto_102376 ) ) ( not ( = ?auto_102382 ?auto_102380 ) ) ( not ( = ?auto_102382 ?auto_102383 ) ) ( not ( = ?auto_102382 ?auto_102376 ) ) ( not ( = ?auto_102380 ?auto_102383 ) ) ( not ( = ?auto_102380 ?auto_102376 ) ) ( ON ?auto_102376 ?auto_102381 ) ( not ( = ?auto_102376 ?auto_102381 ) ) ( not ( = ?auto_102383 ?auto_102381 ) ) ( not ( = ?auto_102377 ?auto_102381 ) ) ( not ( = ?auto_102379 ?auto_102381 ) ) ( not ( = ?auto_102378 ?auto_102381 ) ) ( not ( = ?auto_102382 ?auto_102381 ) ) ( not ( = ?auto_102380 ?auto_102381 ) ) ( ON ?auto_102383 ?auto_102376 ) ( CLEAR ?auto_102383 ) ( ON-TABLE ?auto_102381 ) ( HOLDING ?auto_102380 ) ( CLEAR ?auto_102382 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_102377 ?auto_102379 ?auto_102378 ?auto_102382 ?auto_102380 )
      ( MAKE-1PILE ?auto_102376 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_102384 - BLOCK
    )
    :vars
    (
      ?auto_102386 - BLOCK
      ?auto_102389 - BLOCK
      ?auto_102385 - BLOCK
      ?auto_102391 - BLOCK
      ?auto_102390 - BLOCK
      ?auto_102388 - BLOCK
      ?auto_102387 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_102384 ?auto_102386 ) ) ( ON-TABLE ?auto_102389 ) ( ON ?auto_102385 ?auto_102389 ) ( ON ?auto_102391 ?auto_102385 ) ( ON ?auto_102390 ?auto_102391 ) ( not ( = ?auto_102389 ?auto_102385 ) ) ( not ( = ?auto_102389 ?auto_102391 ) ) ( not ( = ?auto_102389 ?auto_102390 ) ) ( not ( = ?auto_102389 ?auto_102388 ) ) ( not ( = ?auto_102389 ?auto_102386 ) ) ( not ( = ?auto_102389 ?auto_102384 ) ) ( not ( = ?auto_102385 ?auto_102391 ) ) ( not ( = ?auto_102385 ?auto_102390 ) ) ( not ( = ?auto_102385 ?auto_102388 ) ) ( not ( = ?auto_102385 ?auto_102386 ) ) ( not ( = ?auto_102385 ?auto_102384 ) ) ( not ( = ?auto_102391 ?auto_102390 ) ) ( not ( = ?auto_102391 ?auto_102388 ) ) ( not ( = ?auto_102391 ?auto_102386 ) ) ( not ( = ?auto_102391 ?auto_102384 ) ) ( not ( = ?auto_102390 ?auto_102388 ) ) ( not ( = ?auto_102390 ?auto_102386 ) ) ( not ( = ?auto_102390 ?auto_102384 ) ) ( not ( = ?auto_102388 ?auto_102386 ) ) ( not ( = ?auto_102388 ?auto_102384 ) ) ( ON ?auto_102384 ?auto_102387 ) ( not ( = ?auto_102384 ?auto_102387 ) ) ( not ( = ?auto_102386 ?auto_102387 ) ) ( not ( = ?auto_102389 ?auto_102387 ) ) ( not ( = ?auto_102385 ?auto_102387 ) ) ( not ( = ?auto_102391 ?auto_102387 ) ) ( not ( = ?auto_102390 ?auto_102387 ) ) ( not ( = ?auto_102388 ?auto_102387 ) ) ( ON ?auto_102386 ?auto_102384 ) ( ON-TABLE ?auto_102387 ) ( CLEAR ?auto_102390 ) ( ON ?auto_102388 ?auto_102386 ) ( CLEAR ?auto_102388 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_102387 ?auto_102384 ?auto_102386 )
      ( MAKE-1PILE ?auto_102384 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_102392 - BLOCK
    )
    :vars
    (
      ?auto_102393 - BLOCK
      ?auto_102395 - BLOCK
      ?auto_102398 - BLOCK
      ?auto_102394 - BLOCK
      ?auto_102396 - BLOCK
      ?auto_102397 - BLOCK
      ?auto_102399 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_102392 ?auto_102393 ) ) ( ON-TABLE ?auto_102395 ) ( ON ?auto_102398 ?auto_102395 ) ( ON ?auto_102394 ?auto_102398 ) ( not ( = ?auto_102395 ?auto_102398 ) ) ( not ( = ?auto_102395 ?auto_102394 ) ) ( not ( = ?auto_102395 ?auto_102396 ) ) ( not ( = ?auto_102395 ?auto_102397 ) ) ( not ( = ?auto_102395 ?auto_102393 ) ) ( not ( = ?auto_102395 ?auto_102392 ) ) ( not ( = ?auto_102398 ?auto_102394 ) ) ( not ( = ?auto_102398 ?auto_102396 ) ) ( not ( = ?auto_102398 ?auto_102397 ) ) ( not ( = ?auto_102398 ?auto_102393 ) ) ( not ( = ?auto_102398 ?auto_102392 ) ) ( not ( = ?auto_102394 ?auto_102396 ) ) ( not ( = ?auto_102394 ?auto_102397 ) ) ( not ( = ?auto_102394 ?auto_102393 ) ) ( not ( = ?auto_102394 ?auto_102392 ) ) ( not ( = ?auto_102396 ?auto_102397 ) ) ( not ( = ?auto_102396 ?auto_102393 ) ) ( not ( = ?auto_102396 ?auto_102392 ) ) ( not ( = ?auto_102397 ?auto_102393 ) ) ( not ( = ?auto_102397 ?auto_102392 ) ) ( ON ?auto_102392 ?auto_102399 ) ( not ( = ?auto_102392 ?auto_102399 ) ) ( not ( = ?auto_102393 ?auto_102399 ) ) ( not ( = ?auto_102395 ?auto_102399 ) ) ( not ( = ?auto_102398 ?auto_102399 ) ) ( not ( = ?auto_102394 ?auto_102399 ) ) ( not ( = ?auto_102396 ?auto_102399 ) ) ( not ( = ?auto_102397 ?auto_102399 ) ) ( ON ?auto_102393 ?auto_102392 ) ( ON-TABLE ?auto_102399 ) ( ON ?auto_102397 ?auto_102393 ) ( CLEAR ?auto_102397 ) ( HOLDING ?auto_102396 ) ( CLEAR ?auto_102394 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_102395 ?auto_102398 ?auto_102394 ?auto_102396 )
      ( MAKE-1PILE ?auto_102392 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_102400 - BLOCK
    )
    :vars
    (
      ?auto_102404 - BLOCK
      ?auto_102401 - BLOCK
      ?auto_102406 - BLOCK
      ?auto_102403 - BLOCK
      ?auto_102402 - BLOCK
      ?auto_102405 - BLOCK
      ?auto_102407 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_102400 ?auto_102404 ) ) ( ON-TABLE ?auto_102401 ) ( ON ?auto_102406 ?auto_102401 ) ( ON ?auto_102403 ?auto_102406 ) ( not ( = ?auto_102401 ?auto_102406 ) ) ( not ( = ?auto_102401 ?auto_102403 ) ) ( not ( = ?auto_102401 ?auto_102402 ) ) ( not ( = ?auto_102401 ?auto_102405 ) ) ( not ( = ?auto_102401 ?auto_102404 ) ) ( not ( = ?auto_102401 ?auto_102400 ) ) ( not ( = ?auto_102406 ?auto_102403 ) ) ( not ( = ?auto_102406 ?auto_102402 ) ) ( not ( = ?auto_102406 ?auto_102405 ) ) ( not ( = ?auto_102406 ?auto_102404 ) ) ( not ( = ?auto_102406 ?auto_102400 ) ) ( not ( = ?auto_102403 ?auto_102402 ) ) ( not ( = ?auto_102403 ?auto_102405 ) ) ( not ( = ?auto_102403 ?auto_102404 ) ) ( not ( = ?auto_102403 ?auto_102400 ) ) ( not ( = ?auto_102402 ?auto_102405 ) ) ( not ( = ?auto_102402 ?auto_102404 ) ) ( not ( = ?auto_102402 ?auto_102400 ) ) ( not ( = ?auto_102405 ?auto_102404 ) ) ( not ( = ?auto_102405 ?auto_102400 ) ) ( ON ?auto_102400 ?auto_102407 ) ( not ( = ?auto_102400 ?auto_102407 ) ) ( not ( = ?auto_102404 ?auto_102407 ) ) ( not ( = ?auto_102401 ?auto_102407 ) ) ( not ( = ?auto_102406 ?auto_102407 ) ) ( not ( = ?auto_102403 ?auto_102407 ) ) ( not ( = ?auto_102402 ?auto_102407 ) ) ( not ( = ?auto_102405 ?auto_102407 ) ) ( ON ?auto_102404 ?auto_102400 ) ( ON-TABLE ?auto_102407 ) ( ON ?auto_102405 ?auto_102404 ) ( CLEAR ?auto_102403 ) ( ON ?auto_102402 ?auto_102405 ) ( CLEAR ?auto_102402 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_102407 ?auto_102400 ?auto_102404 ?auto_102405 )
      ( MAKE-1PILE ?auto_102400 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_102408 - BLOCK
    )
    :vars
    (
      ?auto_102411 - BLOCK
      ?auto_102413 - BLOCK
      ?auto_102409 - BLOCK
      ?auto_102414 - BLOCK
      ?auto_102415 - BLOCK
      ?auto_102410 - BLOCK
      ?auto_102412 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_102408 ?auto_102411 ) ) ( ON-TABLE ?auto_102413 ) ( ON ?auto_102409 ?auto_102413 ) ( not ( = ?auto_102413 ?auto_102409 ) ) ( not ( = ?auto_102413 ?auto_102414 ) ) ( not ( = ?auto_102413 ?auto_102415 ) ) ( not ( = ?auto_102413 ?auto_102410 ) ) ( not ( = ?auto_102413 ?auto_102411 ) ) ( not ( = ?auto_102413 ?auto_102408 ) ) ( not ( = ?auto_102409 ?auto_102414 ) ) ( not ( = ?auto_102409 ?auto_102415 ) ) ( not ( = ?auto_102409 ?auto_102410 ) ) ( not ( = ?auto_102409 ?auto_102411 ) ) ( not ( = ?auto_102409 ?auto_102408 ) ) ( not ( = ?auto_102414 ?auto_102415 ) ) ( not ( = ?auto_102414 ?auto_102410 ) ) ( not ( = ?auto_102414 ?auto_102411 ) ) ( not ( = ?auto_102414 ?auto_102408 ) ) ( not ( = ?auto_102415 ?auto_102410 ) ) ( not ( = ?auto_102415 ?auto_102411 ) ) ( not ( = ?auto_102415 ?auto_102408 ) ) ( not ( = ?auto_102410 ?auto_102411 ) ) ( not ( = ?auto_102410 ?auto_102408 ) ) ( ON ?auto_102408 ?auto_102412 ) ( not ( = ?auto_102408 ?auto_102412 ) ) ( not ( = ?auto_102411 ?auto_102412 ) ) ( not ( = ?auto_102413 ?auto_102412 ) ) ( not ( = ?auto_102409 ?auto_102412 ) ) ( not ( = ?auto_102414 ?auto_102412 ) ) ( not ( = ?auto_102415 ?auto_102412 ) ) ( not ( = ?auto_102410 ?auto_102412 ) ) ( ON ?auto_102411 ?auto_102408 ) ( ON-TABLE ?auto_102412 ) ( ON ?auto_102410 ?auto_102411 ) ( ON ?auto_102415 ?auto_102410 ) ( CLEAR ?auto_102415 ) ( HOLDING ?auto_102414 ) ( CLEAR ?auto_102409 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_102413 ?auto_102409 ?auto_102414 )
      ( MAKE-1PILE ?auto_102408 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_102416 - BLOCK
    )
    :vars
    (
      ?auto_102417 - BLOCK
      ?auto_102420 - BLOCK
      ?auto_102423 - BLOCK
      ?auto_102418 - BLOCK
      ?auto_102422 - BLOCK
      ?auto_102419 - BLOCK
      ?auto_102421 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_102416 ?auto_102417 ) ) ( ON-TABLE ?auto_102420 ) ( ON ?auto_102423 ?auto_102420 ) ( not ( = ?auto_102420 ?auto_102423 ) ) ( not ( = ?auto_102420 ?auto_102418 ) ) ( not ( = ?auto_102420 ?auto_102422 ) ) ( not ( = ?auto_102420 ?auto_102419 ) ) ( not ( = ?auto_102420 ?auto_102417 ) ) ( not ( = ?auto_102420 ?auto_102416 ) ) ( not ( = ?auto_102423 ?auto_102418 ) ) ( not ( = ?auto_102423 ?auto_102422 ) ) ( not ( = ?auto_102423 ?auto_102419 ) ) ( not ( = ?auto_102423 ?auto_102417 ) ) ( not ( = ?auto_102423 ?auto_102416 ) ) ( not ( = ?auto_102418 ?auto_102422 ) ) ( not ( = ?auto_102418 ?auto_102419 ) ) ( not ( = ?auto_102418 ?auto_102417 ) ) ( not ( = ?auto_102418 ?auto_102416 ) ) ( not ( = ?auto_102422 ?auto_102419 ) ) ( not ( = ?auto_102422 ?auto_102417 ) ) ( not ( = ?auto_102422 ?auto_102416 ) ) ( not ( = ?auto_102419 ?auto_102417 ) ) ( not ( = ?auto_102419 ?auto_102416 ) ) ( ON ?auto_102416 ?auto_102421 ) ( not ( = ?auto_102416 ?auto_102421 ) ) ( not ( = ?auto_102417 ?auto_102421 ) ) ( not ( = ?auto_102420 ?auto_102421 ) ) ( not ( = ?auto_102423 ?auto_102421 ) ) ( not ( = ?auto_102418 ?auto_102421 ) ) ( not ( = ?auto_102422 ?auto_102421 ) ) ( not ( = ?auto_102419 ?auto_102421 ) ) ( ON ?auto_102417 ?auto_102416 ) ( ON-TABLE ?auto_102421 ) ( ON ?auto_102419 ?auto_102417 ) ( ON ?auto_102422 ?auto_102419 ) ( CLEAR ?auto_102423 ) ( ON ?auto_102418 ?auto_102422 ) ( CLEAR ?auto_102418 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_102421 ?auto_102416 ?auto_102417 ?auto_102419 ?auto_102422 )
      ( MAKE-1PILE ?auto_102416 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_102424 - BLOCK
    )
    :vars
    (
      ?auto_102431 - BLOCK
      ?auto_102430 - BLOCK
      ?auto_102427 - BLOCK
      ?auto_102426 - BLOCK
      ?auto_102425 - BLOCK
      ?auto_102429 - BLOCK
      ?auto_102428 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_102424 ?auto_102431 ) ) ( ON-TABLE ?auto_102430 ) ( not ( = ?auto_102430 ?auto_102427 ) ) ( not ( = ?auto_102430 ?auto_102426 ) ) ( not ( = ?auto_102430 ?auto_102425 ) ) ( not ( = ?auto_102430 ?auto_102429 ) ) ( not ( = ?auto_102430 ?auto_102431 ) ) ( not ( = ?auto_102430 ?auto_102424 ) ) ( not ( = ?auto_102427 ?auto_102426 ) ) ( not ( = ?auto_102427 ?auto_102425 ) ) ( not ( = ?auto_102427 ?auto_102429 ) ) ( not ( = ?auto_102427 ?auto_102431 ) ) ( not ( = ?auto_102427 ?auto_102424 ) ) ( not ( = ?auto_102426 ?auto_102425 ) ) ( not ( = ?auto_102426 ?auto_102429 ) ) ( not ( = ?auto_102426 ?auto_102431 ) ) ( not ( = ?auto_102426 ?auto_102424 ) ) ( not ( = ?auto_102425 ?auto_102429 ) ) ( not ( = ?auto_102425 ?auto_102431 ) ) ( not ( = ?auto_102425 ?auto_102424 ) ) ( not ( = ?auto_102429 ?auto_102431 ) ) ( not ( = ?auto_102429 ?auto_102424 ) ) ( ON ?auto_102424 ?auto_102428 ) ( not ( = ?auto_102424 ?auto_102428 ) ) ( not ( = ?auto_102431 ?auto_102428 ) ) ( not ( = ?auto_102430 ?auto_102428 ) ) ( not ( = ?auto_102427 ?auto_102428 ) ) ( not ( = ?auto_102426 ?auto_102428 ) ) ( not ( = ?auto_102425 ?auto_102428 ) ) ( not ( = ?auto_102429 ?auto_102428 ) ) ( ON ?auto_102431 ?auto_102424 ) ( ON-TABLE ?auto_102428 ) ( ON ?auto_102429 ?auto_102431 ) ( ON ?auto_102425 ?auto_102429 ) ( ON ?auto_102426 ?auto_102425 ) ( CLEAR ?auto_102426 ) ( HOLDING ?auto_102427 ) ( CLEAR ?auto_102430 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_102430 ?auto_102427 )
      ( MAKE-1PILE ?auto_102424 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_102432 - BLOCK
    )
    :vars
    (
      ?auto_102435 - BLOCK
      ?auto_102433 - BLOCK
      ?auto_102438 - BLOCK
      ?auto_102434 - BLOCK
      ?auto_102437 - BLOCK
      ?auto_102436 - BLOCK
      ?auto_102439 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_102432 ?auto_102435 ) ) ( ON-TABLE ?auto_102433 ) ( not ( = ?auto_102433 ?auto_102438 ) ) ( not ( = ?auto_102433 ?auto_102434 ) ) ( not ( = ?auto_102433 ?auto_102437 ) ) ( not ( = ?auto_102433 ?auto_102436 ) ) ( not ( = ?auto_102433 ?auto_102435 ) ) ( not ( = ?auto_102433 ?auto_102432 ) ) ( not ( = ?auto_102438 ?auto_102434 ) ) ( not ( = ?auto_102438 ?auto_102437 ) ) ( not ( = ?auto_102438 ?auto_102436 ) ) ( not ( = ?auto_102438 ?auto_102435 ) ) ( not ( = ?auto_102438 ?auto_102432 ) ) ( not ( = ?auto_102434 ?auto_102437 ) ) ( not ( = ?auto_102434 ?auto_102436 ) ) ( not ( = ?auto_102434 ?auto_102435 ) ) ( not ( = ?auto_102434 ?auto_102432 ) ) ( not ( = ?auto_102437 ?auto_102436 ) ) ( not ( = ?auto_102437 ?auto_102435 ) ) ( not ( = ?auto_102437 ?auto_102432 ) ) ( not ( = ?auto_102436 ?auto_102435 ) ) ( not ( = ?auto_102436 ?auto_102432 ) ) ( ON ?auto_102432 ?auto_102439 ) ( not ( = ?auto_102432 ?auto_102439 ) ) ( not ( = ?auto_102435 ?auto_102439 ) ) ( not ( = ?auto_102433 ?auto_102439 ) ) ( not ( = ?auto_102438 ?auto_102439 ) ) ( not ( = ?auto_102434 ?auto_102439 ) ) ( not ( = ?auto_102437 ?auto_102439 ) ) ( not ( = ?auto_102436 ?auto_102439 ) ) ( ON ?auto_102435 ?auto_102432 ) ( ON-TABLE ?auto_102439 ) ( ON ?auto_102436 ?auto_102435 ) ( ON ?auto_102437 ?auto_102436 ) ( ON ?auto_102434 ?auto_102437 ) ( CLEAR ?auto_102433 ) ( ON ?auto_102438 ?auto_102434 ) ( CLEAR ?auto_102438 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_102439 ?auto_102432 ?auto_102435 ?auto_102436 ?auto_102437 ?auto_102434 )
      ( MAKE-1PILE ?auto_102432 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_102440 - BLOCK
    )
    :vars
    (
      ?auto_102446 - BLOCK
      ?auto_102447 - BLOCK
      ?auto_102441 - BLOCK
      ?auto_102443 - BLOCK
      ?auto_102442 - BLOCK
      ?auto_102445 - BLOCK
      ?auto_102444 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_102440 ?auto_102446 ) ) ( not ( = ?auto_102447 ?auto_102441 ) ) ( not ( = ?auto_102447 ?auto_102443 ) ) ( not ( = ?auto_102447 ?auto_102442 ) ) ( not ( = ?auto_102447 ?auto_102445 ) ) ( not ( = ?auto_102447 ?auto_102446 ) ) ( not ( = ?auto_102447 ?auto_102440 ) ) ( not ( = ?auto_102441 ?auto_102443 ) ) ( not ( = ?auto_102441 ?auto_102442 ) ) ( not ( = ?auto_102441 ?auto_102445 ) ) ( not ( = ?auto_102441 ?auto_102446 ) ) ( not ( = ?auto_102441 ?auto_102440 ) ) ( not ( = ?auto_102443 ?auto_102442 ) ) ( not ( = ?auto_102443 ?auto_102445 ) ) ( not ( = ?auto_102443 ?auto_102446 ) ) ( not ( = ?auto_102443 ?auto_102440 ) ) ( not ( = ?auto_102442 ?auto_102445 ) ) ( not ( = ?auto_102442 ?auto_102446 ) ) ( not ( = ?auto_102442 ?auto_102440 ) ) ( not ( = ?auto_102445 ?auto_102446 ) ) ( not ( = ?auto_102445 ?auto_102440 ) ) ( ON ?auto_102440 ?auto_102444 ) ( not ( = ?auto_102440 ?auto_102444 ) ) ( not ( = ?auto_102446 ?auto_102444 ) ) ( not ( = ?auto_102447 ?auto_102444 ) ) ( not ( = ?auto_102441 ?auto_102444 ) ) ( not ( = ?auto_102443 ?auto_102444 ) ) ( not ( = ?auto_102442 ?auto_102444 ) ) ( not ( = ?auto_102445 ?auto_102444 ) ) ( ON ?auto_102446 ?auto_102440 ) ( ON-TABLE ?auto_102444 ) ( ON ?auto_102445 ?auto_102446 ) ( ON ?auto_102442 ?auto_102445 ) ( ON ?auto_102443 ?auto_102442 ) ( ON ?auto_102441 ?auto_102443 ) ( CLEAR ?auto_102441 ) ( HOLDING ?auto_102447 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_102447 )
      ( MAKE-1PILE ?auto_102440 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_102448 - BLOCK
    )
    :vars
    (
      ?auto_102453 - BLOCK
      ?auto_102451 - BLOCK
      ?auto_102455 - BLOCK
      ?auto_102449 - BLOCK
      ?auto_102454 - BLOCK
      ?auto_102450 - BLOCK
      ?auto_102452 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_102448 ?auto_102453 ) ) ( not ( = ?auto_102451 ?auto_102455 ) ) ( not ( = ?auto_102451 ?auto_102449 ) ) ( not ( = ?auto_102451 ?auto_102454 ) ) ( not ( = ?auto_102451 ?auto_102450 ) ) ( not ( = ?auto_102451 ?auto_102453 ) ) ( not ( = ?auto_102451 ?auto_102448 ) ) ( not ( = ?auto_102455 ?auto_102449 ) ) ( not ( = ?auto_102455 ?auto_102454 ) ) ( not ( = ?auto_102455 ?auto_102450 ) ) ( not ( = ?auto_102455 ?auto_102453 ) ) ( not ( = ?auto_102455 ?auto_102448 ) ) ( not ( = ?auto_102449 ?auto_102454 ) ) ( not ( = ?auto_102449 ?auto_102450 ) ) ( not ( = ?auto_102449 ?auto_102453 ) ) ( not ( = ?auto_102449 ?auto_102448 ) ) ( not ( = ?auto_102454 ?auto_102450 ) ) ( not ( = ?auto_102454 ?auto_102453 ) ) ( not ( = ?auto_102454 ?auto_102448 ) ) ( not ( = ?auto_102450 ?auto_102453 ) ) ( not ( = ?auto_102450 ?auto_102448 ) ) ( ON ?auto_102448 ?auto_102452 ) ( not ( = ?auto_102448 ?auto_102452 ) ) ( not ( = ?auto_102453 ?auto_102452 ) ) ( not ( = ?auto_102451 ?auto_102452 ) ) ( not ( = ?auto_102455 ?auto_102452 ) ) ( not ( = ?auto_102449 ?auto_102452 ) ) ( not ( = ?auto_102454 ?auto_102452 ) ) ( not ( = ?auto_102450 ?auto_102452 ) ) ( ON ?auto_102453 ?auto_102448 ) ( ON-TABLE ?auto_102452 ) ( ON ?auto_102450 ?auto_102453 ) ( ON ?auto_102454 ?auto_102450 ) ( ON ?auto_102449 ?auto_102454 ) ( ON ?auto_102455 ?auto_102449 ) ( ON ?auto_102451 ?auto_102455 ) ( CLEAR ?auto_102451 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_102452 ?auto_102448 ?auto_102453 ?auto_102450 ?auto_102454 ?auto_102449 ?auto_102455 )
      ( MAKE-1PILE ?auto_102448 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_102461 - BLOCK
      ?auto_102462 - BLOCK
      ?auto_102463 - BLOCK
      ?auto_102464 - BLOCK
      ?auto_102465 - BLOCK
    )
    :vars
    (
      ?auto_102466 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_102466 ?auto_102465 ) ( CLEAR ?auto_102466 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_102461 ) ( ON ?auto_102462 ?auto_102461 ) ( ON ?auto_102463 ?auto_102462 ) ( ON ?auto_102464 ?auto_102463 ) ( ON ?auto_102465 ?auto_102464 ) ( not ( = ?auto_102461 ?auto_102462 ) ) ( not ( = ?auto_102461 ?auto_102463 ) ) ( not ( = ?auto_102461 ?auto_102464 ) ) ( not ( = ?auto_102461 ?auto_102465 ) ) ( not ( = ?auto_102461 ?auto_102466 ) ) ( not ( = ?auto_102462 ?auto_102463 ) ) ( not ( = ?auto_102462 ?auto_102464 ) ) ( not ( = ?auto_102462 ?auto_102465 ) ) ( not ( = ?auto_102462 ?auto_102466 ) ) ( not ( = ?auto_102463 ?auto_102464 ) ) ( not ( = ?auto_102463 ?auto_102465 ) ) ( not ( = ?auto_102463 ?auto_102466 ) ) ( not ( = ?auto_102464 ?auto_102465 ) ) ( not ( = ?auto_102464 ?auto_102466 ) ) ( not ( = ?auto_102465 ?auto_102466 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_102466 ?auto_102465 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_102467 - BLOCK
      ?auto_102468 - BLOCK
      ?auto_102469 - BLOCK
      ?auto_102470 - BLOCK
      ?auto_102471 - BLOCK
    )
    :vars
    (
      ?auto_102472 - BLOCK
      ?auto_102473 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_102472 ?auto_102471 ) ( CLEAR ?auto_102472 ) ( ON-TABLE ?auto_102467 ) ( ON ?auto_102468 ?auto_102467 ) ( ON ?auto_102469 ?auto_102468 ) ( ON ?auto_102470 ?auto_102469 ) ( ON ?auto_102471 ?auto_102470 ) ( not ( = ?auto_102467 ?auto_102468 ) ) ( not ( = ?auto_102467 ?auto_102469 ) ) ( not ( = ?auto_102467 ?auto_102470 ) ) ( not ( = ?auto_102467 ?auto_102471 ) ) ( not ( = ?auto_102467 ?auto_102472 ) ) ( not ( = ?auto_102468 ?auto_102469 ) ) ( not ( = ?auto_102468 ?auto_102470 ) ) ( not ( = ?auto_102468 ?auto_102471 ) ) ( not ( = ?auto_102468 ?auto_102472 ) ) ( not ( = ?auto_102469 ?auto_102470 ) ) ( not ( = ?auto_102469 ?auto_102471 ) ) ( not ( = ?auto_102469 ?auto_102472 ) ) ( not ( = ?auto_102470 ?auto_102471 ) ) ( not ( = ?auto_102470 ?auto_102472 ) ) ( not ( = ?auto_102471 ?auto_102472 ) ) ( HOLDING ?auto_102473 ) ( not ( = ?auto_102467 ?auto_102473 ) ) ( not ( = ?auto_102468 ?auto_102473 ) ) ( not ( = ?auto_102469 ?auto_102473 ) ) ( not ( = ?auto_102470 ?auto_102473 ) ) ( not ( = ?auto_102471 ?auto_102473 ) ) ( not ( = ?auto_102472 ?auto_102473 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_102473 )
      ( MAKE-5PILE ?auto_102467 ?auto_102468 ?auto_102469 ?auto_102470 ?auto_102471 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_102474 - BLOCK
      ?auto_102475 - BLOCK
      ?auto_102476 - BLOCK
      ?auto_102477 - BLOCK
      ?auto_102478 - BLOCK
    )
    :vars
    (
      ?auto_102480 - BLOCK
      ?auto_102479 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_102480 ?auto_102478 ) ( ON-TABLE ?auto_102474 ) ( ON ?auto_102475 ?auto_102474 ) ( ON ?auto_102476 ?auto_102475 ) ( ON ?auto_102477 ?auto_102476 ) ( ON ?auto_102478 ?auto_102477 ) ( not ( = ?auto_102474 ?auto_102475 ) ) ( not ( = ?auto_102474 ?auto_102476 ) ) ( not ( = ?auto_102474 ?auto_102477 ) ) ( not ( = ?auto_102474 ?auto_102478 ) ) ( not ( = ?auto_102474 ?auto_102480 ) ) ( not ( = ?auto_102475 ?auto_102476 ) ) ( not ( = ?auto_102475 ?auto_102477 ) ) ( not ( = ?auto_102475 ?auto_102478 ) ) ( not ( = ?auto_102475 ?auto_102480 ) ) ( not ( = ?auto_102476 ?auto_102477 ) ) ( not ( = ?auto_102476 ?auto_102478 ) ) ( not ( = ?auto_102476 ?auto_102480 ) ) ( not ( = ?auto_102477 ?auto_102478 ) ) ( not ( = ?auto_102477 ?auto_102480 ) ) ( not ( = ?auto_102478 ?auto_102480 ) ) ( not ( = ?auto_102474 ?auto_102479 ) ) ( not ( = ?auto_102475 ?auto_102479 ) ) ( not ( = ?auto_102476 ?auto_102479 ) ) ( not ( = ?auto_102477 ?auto_102479 ) ) ( not ( = ?auto_102478 ?auto_102479 ) ) ( not ( = ?auto_102480 ?auto_102479 ) ) ( ON ?auto_102479 ?auto_102480 ) ( CLEAR ?auto_102479 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_102474 ?auto_102475 ?auto_102476 ?auto_102477 ?auto_102478 ?auto_102480 )
      ( MAKE-5PILE ?auto_102474 ?auto_102475 ?auto_102476 ?auto_102477 ?auto_102478 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_102481 - BLOCK
      ?auto_102482 - BLOCK
      ?auto_102483 - BLOCK
      ?auto_102484 - BLOCK
      ?auto_102485 - BLOCK
    )
    :vars
    (
      ?auto_102486 - BLOCK
      ?auto_102487 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_102486 ?auto_102485 ) ( ON-TABLE ?auto_102481 ) ( ON ?auto_102482 ?auto_102481 ) ( ON ?auto_102483 ?auto_102482 ) ( ON ?auto_102484 ?auto_102483 ) ( ON ?auto_102485 ?auto_102484 ) ( not ( = ?auto_102481 ?auto_102482 ) ) ( not ( = ?auto_102481 ?auto_102483 ) ) ( not ( = ?auto_102481 ?auto_102484 ) ) ( not ( = ?auto_102481 ?auto_102485 ) ) ( not ( = ?auto_102481 ?auto_102486 ) ) ( not ( = ?auto_102482 ?auto_102483 ) ) ( not ( = ?auto_102482 ?auto_102484 ) ) ( not ( = ?auto_102482 ?auto_102485 ) ) ( not ( = ?auto_102482 ?auto_102486 ) ) ( not ( = ?auto_102483 ?auto_102484 ) ) ( not ( = ?auto_102483 ?auto_102485 ) ) ( not ( = ?auto_102483 ?auto_102486 ) ) ( not ( = ?auto_102484 ?auto_102485 ) ) ( not ( = ?auto_102484 ?auto_102486 ) ) ( not ( = ?auto_102485 ?auto_102486 ) ) ( not ( = ?auto_102481 ?auto_102487 ) ) ( not ( = ?auto_102482 ?auto_102487 ) ) ( not ( = ?auto_102483 ?auto_102487 ) ) ( not ( = ?auto_102484 ?auto_102487 ) ) ( not ( = ?auto_102485 ?auto_102487 ) ) ( not ( = ?auto_102486 ?auto_102487 ) ) ( HOLDING ?auto_102487 ) ( CLEAR ?auto_102486 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_102481 ?auto_102482 ?auto_102483 ?auto_102484 ?auto_102485 ?auto_102486 ?auto_102487 )
      ( MAKE-5PILE ?auto_102481 ?auto_102482 ?auto_102483 ?auto_102484 ?auto_102485 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_102488 - BLOCK
      ?auto_102489 - BLOCK
      ?auto_102490 - BLOCK
      ?auto_102491 - BLOCK
      ?auto_102492 - BLOCK
    )
    :vars
    (
      ?auto_102493 - BLOCK
      ?auto_102494 - BLOCK
      ?auto_102495 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_102493 ?auto_102492 ) ( ON-TABLE ?auto_102488 ) ( ON ?auto_102489 ?auto_102488 ) ( ON ?auto_102490 ?auto_102489 ) ( ON ?auto_102491 ?auto_102490 ) ( ON ?auto_102492 ?auto_102491 ) ( not ( = ?auto_102488 ?auto_102489 ) ) ( not ( = ?auto_102488 ?auto_102490 ) ) ( not ( = ?auto_102488 ?auto_102491 ) ) ( not ( = ?auto_102488 ?auto_102492 ) ) ( not ( = ?auto_102488 ?auto_102493 ) ) ( not ( = ?auto_102489 ?auto_102490 ) ) ( not ( = ?auto_102489 ?auto_102491 ) ) ( not ( = ?auto_102489 ?auto_102492 ) ) ( not ( = ?auto_102489 ?auto_102493 ) ) ( not ( = ?auto_102490 ?auto_102491 ) ) ( not ( = ?auto_102490 ?auto_102492 ) ) ( not ( = ?auto_102490 ?auto_102493 ) ) ( not ( = ?auto_102491 ?auto_102492 ) ) ( not ( = ?auto_102491 ?auto_102493 ) ) ( not ( = ?auto_102492 ?auto_102493 ) ) ( not ( = ?auto_102488 ?auto_102494 ) ) ( not ( = ?auto_102489 ?auto_102494 ) ) ( not ( = ?auto_102490 ?auto_102494 ) ) ( not ( = ?auto_102491 ?auto_102494 ) ) ( not ( = ?auto_102492 ?auto_102494 ) ) ( not ( = ?auto_102493 ?auto_102494 ) ) ( CLEAR ?auto_102493 ) ( ON ?auto_102494 ?auto_102495 ) ( CLEAR ?auto_102494 ) ( HAND-EMPTY ) ( not ( = ?auto_102488 ?auto_102495 ) ) ( not ( = ?auto_102489 ?auto_102495 ) ) ( not ( = ?auto_102490 ?auto_102495 ) ) ( not ( = ?auto_102491 ?auto_102495 ) ) ( not ( = ?auto_102492 ?auto_102495 ) ) ( not ( = ?auto_102493 ?auto_102495 ) ) ( not ( = ?auto_102494 ?auto_102495 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_102494 ?auto_102495 )
      ( MAKE-5PILE ?auto_102488 ?auto_102489 ?auto_102490 ?auto_102491 ?auto_102492 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_102512 - BLOCK
      ?auto_102513 - BLOCK
      ?auto_102514 - BLOCK
      ?auto_102515 - BLOCK
      ?auto_102516 - BLOCK
    )
    :vars
    (
      ?auto_102517 - BLOCK
      ?auto_102518 - BLOCK
      ?auto_102519 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_102512 ) ( ON ?auto_102513 ?auto_102512 ) ( ON ?auto_102514 ?auto_102513 ) ( ON ?auto_102515 ?auto_102514 ) ( not ( = ?auto_102512 ?auto_102513 ) ) ( not ( = ?auto_102512 ?auto_102514 ) ) ( not ( = ?auto_102512 ?auto_102515 ) ) ( not ( = ?auto_102512 ?auto_102516 ) ) ( not ( = ?auto_102512 ?auto_102517 ) ) ( not ( = ?auto_102513 ?auto_102514 ) ) ( not ( = ?auto_102513 ?auto_102515 ) ) ( not ( = ?auto_102513 ?auto_102516 ) ) ( not ( = ?auto_102513 ?auto_102517 ) ) ( not ( = ?auto_102514 ?auto_102515 ) ) ( not ( = ?auto_102514 ?auto_102516 ) ) ( not ( = ?auto_102514 ?auto_102517 ) ) ( not ( = ?auto_102515 ?auto_102516 ) ) ( not ( = ?auto_102515 ?auto_102517 ) ) ( not ( = ?auto_102516 ?auto_102517 ) ) ( not ( = ?auto_102512 ?auto_102518 ) ) ( not ( = ?auto_102513 ?auto_102518 ) ) ( not ( = ?auto_102514 ?auto_102518 ) ) ( not ( = ?auto_102515 ?auto_102518 ) ) ( not ( = ?auto_102516 ?auto_102518 ) ) ( not ( = ?auto_102517 ?auto_102518 ) ) ( ON ?auto_102518 ?auto_102519 ) ( not ( = ?auto_102512 ?auto_102519 ) ) ( not ( = ?auto_102513 ?auto_102519 ) ) ( not ( = ?auto_102514 ?auto_102519 ) ) ( not ( = ?auto_102515 ?auto_102519 ) ) ( not ( = ?auto_102516 ?auto_102519 ) ) ( not ( = ?auto_102517 ?auto_102519 ) ) ( not ( = ?auto_102518 ?auto_102519 ) ) ( ON ?auto_102517 ?auto_102518 ) ( CLEAR ?auto_102517 ) ( HOLDING ?auto_102516 ) ( CLEAR ?auto_102515 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_102512 ?auto_102513 ?auto_102514 ?auto_102515 ?auto_102516 ?auto_102517 )
      ( MAKE-5PILE ?auto_102512 ?auto_102513 ?auto_102514 ?auto_102515 ?auto_102516 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_102520 - BLOCK
      ?auto_102521 - BLOCK
      ?auto_102522 - BLOCK
      ?auto_102523 - BLOCK
      ?auto_102524 - BLOCK
    )
    :vars
    (
      ?auto_102526 - BLOCK
      ?auto_102527 - BLOCK
      ?auto_102525 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_102520 ) ( ON ?auto_102521 ?auto_102520 ) ( ON ?auto_102522 ?auto_102521 ) ( ON ?auto_102523 ?auto_102522 ) ( not ( = ?auto_102520 ?auto_102521 ) ) ( not ( = ?auto_102520 ?auto_102522 ) ) ( not ( = ?auto_102520 ?auto_102523 ) ) ( not ( = ?auto_102520 ?auto_102524 ) ) ( not ( = ?auto_102520 ?auto_102526 ) ) ( not ( = ?auto_102521 ?auto_102522 ) ) ( not ( = ?auto_102521 ?auto_102523 ) ) ( not ( = ?auto_102521 ?auto_102524 ) ) ( not ( = ?auto_102521 ?auto_102526 ) ) ( not ( = ?auto_102522 ?auto_102523 ) ) ( not ( = ?auto_102522 ?auto_102524 ) ) ( not ( = ?auto_102522 ?auto_102526 ) ) ( not ( = ?auto_102523 ?auto_102524 ) ) ( not ( = ?auto_102523 ?auto_102526 ) ) ( not ( = ?auto_102524 ?auto_102526 ) ) ( not ( = ?auto_102520 ?auto_102527 ) ) ( not ( = ?auto_102521 ?auto_102527 ) ) ( not ( = ?auto_102522 ?auto_102527 ) ) ( not ( = ?auto_102523 ?auto_102527 ) ) ( not ( = ?auto_102524 ?auto_102527 ) ) ( not ( = ?auto_102526 ?auto_102527 ) ) ( ON ?auto_102527 ?auto_102525 ) ( not ( = ?auto_102520 ?auto_102525 ) ) ( not ( = ?auto_102521 ?auto_102525 ) ) ( not ( = ?auto_102522 ?auto_102525 ) ) ( not ( = ?auto_102523 ?auto_102525 ) ) ( not ( = ?auto_102524 ?auto_102525 ) ) ( not ( = ?auto_102526 ?auto_102525 ) ) ( not ( = ?auto_102527 ?auto_102525 ) ) ( ON ?auto_102526 ?auto_102527 ) ( CLEAR ?auto_102523 ) ( ON ?auto_102524 ?auto_102526 ) ( CLEAR ?auto_102524 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_102525 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_102525 ?auto_102527 ?auto_102526 )
      ( MAKE-5PILE ?auto_102520 ?auto_102521 ?auto_102522 ?auto_102523 ?auto_102524 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_102528 - BLOCK
      ?auto_102529 - BLOCK
      ?auto_102530 - BLOCK
      ?auto_102531 - BLOCK
      ?auto_102532 - BLOCK
    )
    :vars
    (
      ?auto_102535 - BLOCK
      ?auto_102534 - BLOCK
      ?auto_102533 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_102528 ) ( ON ?auto_102529 ?auto_102528 ) ( ON ?auto_102530 ?auto_102529 ) ( not ( = ?auto_102528 ?auto_102529 ) ) ( not ( = ?auto_102528 ?auto_102530 ) ) ( not ( = ?auto_102528 ?auto_102531 ) ) ( not ( = ?auto_102528 ?auto_102532 ) ) ( not ( = ?auto_102528 ?auto_102535 ) ) ( not ( = ?auto_102529 ?auto_102530 ) ) ( not ( = ?auto_102529 ?auto_102531 ) ) ( not ( = ?auto_102529 ?auto_102532 ) ) ( not ( = ?auto_102529 ?auto_102535 ) ) ( not ( = ?auto_102530 ?auto_102531 ) ) ( not ( = ?auto_102530 ?auto_102532 ) ) ( not ( = ?auto_102530 ?auto_102535 ) ) ( not ( = ?auto_102531 ?auto_102532 ) ) ( not ( = ?auto_102531 ?auto_102535 ) ) ( not ( = ?auto_102532 ?auto_102535 ) ) ( not ( = ?auto_102528 ?auto_102534 ) ) ( not ( = ?auto_102529 ?auto_102534 ) ) ( not ( = ?auto_102530 ?auto_102534 ) ) ( not ( = ?auto_102531 ?auto_102534 ) ) ( not ( = ?auto_102532 ?auto_102534 ) ) ( not ( = ?auto_102535 ?auto_102534 ) ) ( ON ?auto_102534 ?auto_102533 ) ( not ( = ?auto_102528 ?auto_102533 ) ) ( not ( = ?auto_102529 ?auto_102533 ) ) ( not ( = ?auto_102530 ?auto_102533 ) ) ( not ( = ?auto_102531 ?auto_102533 ) ) ( not ( = ?auto_102532 ?auto_102533 ) ) ( not ( = ?auto_102535 ?auto_102533 ) ) ( not ( = ?auto_102534 ?auto_102533 ) ) ( ON ?auto_102535 ?auto_102534 ) ( ON ?auto_102532 ?auto_102535 ) ( CLEAR ?auto_102532 ) ( ON-TABLE ?auto_102533 ) ( HOLDING ?auto_102531 ) ( CLEAR ?auto_102530 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_102528 ?auto_102529 ?auto_102530 ?auto_102531 )
      ( MAKE-5PILE ?auto_102528 ?auto_102529 ?auto_102530 ?auto_102531 ?auto_102532 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_102536 - BLOCK
      ?auto_102537 - BLOCK
      ?auto_102538 - BLOCK
      ?auto_102539 - BLOCK
      ?auto_102540 - BLOCK
    )
    :vars
    (
      ?auto_102541 - BLOCK
      ?auto_102543 - BLOCK
      ?auto_102542 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_102536 ) ( ON ?auto_102537 ?auto_102536 ) ( ON ?auto_102538 ?auto_102537 ) ( not ( = ?auto_102536 ?auto_102537 ) ) ( not ( = ?auto_102536 ?auto_102538 ) ) ( not ( = ?auto_102536 ?auto_102539 ) ) ( not ( = ?auto_102536 ?auto_102540 ) ) ( not ( = ?auto_102536 ?auto_102541 ) ) ( not ( = ?auto_102537 ?auto_102538 ) ) ( not ( = ?auto_102537 ?auto_102539 ) ) ( not ( = ?auto_102537 ?auto_102540 ) ) ( not ( = ?auto_102537 ?auto_102541 ) ) ( not ( = ?auto_102538 ?auto_102539 ) ) ( not ( = ?auto_102538 ?auto_102540 ) ) ( not ( = ?auto_102538 ?auto_102541 ) ) ( not ( = ?auto_102539 ?auto_102540 ) ) ( not ( = ?auto_102539 ?auto_102541 ) ) ( not ( = ?auto_102540 ?auto_102541 ) ) ( not ( = ?auto_102536 ?auto_102543 ) ) ( not ( = ?auto_102537 ?auto_102543 ) ) ( not ( = ?auto_102538 ?auto_102543 ) ) ( not ( = ?auto_102539 ?auto_102543 ) ) ( not ( = ?auto_102540 ?auto_102543 ) ) ( not ( = ?auto_102541 ?auto_102543 ) ) ( ON ?auto_102543 ?auto_102542 ) ( not ( = ?auto_102536 ?auto_102542 ) ) ( not ( = ?auto_102537 ?auto_102542 ) ) ( not ( = ?auto_102538 ?auto_102542 ) ) ( not ( = ?auto_102539 ?auto_102542 ) ) ( not ( = ?auto_102540 ?auto_102542 ) ) ( not ( = ?auto_102541 ?auto_102542 ) ) ( not ( = ?auto_102543 ?auto_102542 ) ) ( ON ?auto_102541 ?auto_102543 ) ( ON ?auto_102540 ?auto_102541 ) ( ON-TABLE ?auto_102542 ) ( CLEAR ?auto_102538 ) ( ON ?auto_102539 ?auto_102540 ) ( CLEAR ?auto_102539 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_102542 ?auto_102543 ?auto_102541 ?auto_102540 )
      ( MAKE-5PILE ?auto_102536 ?auto_102537 ?auto_102538 ?auto_102539 ?auto_102540 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_102544 - BLOCK
      ?auto_102545 - BLOCK
      ?auto_102546 - BLOCK
      ?auto_102547 - BLOCK
      ?auto_102548 - BLOCK
    )
    :vars
    (
      ?auto_102550 - BLOCK
      ?auto_102549 - BLOCK
      ?auto_102551 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_102544 ) ( ON ?auto_102545 ?auto_102544 ) ( not ( = ?auto_102544 ?auto_102545 ) ) ( not ( = ?auto_102544 ?auto_102546 ) ) ( not ( = ?auto_102544 ?auto_102547 ) ) ( not ( = ?auto_102544 ?auto_102548 ) ) ( not ( = ?auto_102544 ?auto_102550 ) ) ( not ( = ?auto_102545 ?auto_102546 ) ) ( not ( = ?auto_102545 ?auto_102547 ) ) ( not ( = ?auto_102545 ?auto_102548 ) ) ( not ( = ?auto_102545 ?auto_102550 ) ) ( not ( = ?auto_102546 ?auto_102547 ) ) ( not ( = ?auto_102546 ?auto_102548 ) ) ( not ( = ?auto_102546 ?auto_102550 ) ) ( not ( = ?auto_102547 ?auto_102548 ) ) ( not ( = ?auto_102547 ?auto_102550 ) ) ( not ( = ?auto_102548 ?auto_102550 ) ) ( not ( = ?auto_102544 ?auto_102549 ) ) ( not ( = ?auto_102545 ?auto_102549 ) ) ( not ( = ?auto_102546 ?auto_102549 ) ) ( not ( = ?auto_102547 ?auto_102549 ) ) ( not ( = ?auto_102548 ?auto_102549 ) ) ( not ( = ?auto_102550 ?auto_102549 ) ) ( ON ?auto_102549 ?auto_102551 ) ( not ( = ?auto_102544 ?auto_102551 ) ) ( not ( = ?auto_102545 ?auto_102551 ) ) ( not ( = ?auto_102546 ?auto_102551 ) ) ( not ( = ?auto_102547 ?auto_102551 ) ) ( not ( = ?auto_102548 ?auto_102551 ) ) ( not ( = ?auto_102550 ?auto_102551 ) ) ( not ( = ?auto_102549 ?auto_102551 ) ) ( ON ?auto_102550 ?auto_102549 ) ( ON ?auto_102548 ?auto_102550 ) ( ON-TABLE ?auto_102551 ) ( ON ?auto_102547 ?auto_102548 ) ( CLEAR ?auto_102547 ) ( HOLDING ?auto_102546 ) ( CLEAR ?auto_102545 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_102544 ?auto_102545 ?auto_102546 )
      ( MAKE-5PILE ?auto_102544 ?auto_102545 ?auto_102546 ?auto_102547 ?auto_102548 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_102552 - BLOCK
      ?auto_102553 - BLOCK
      ?auto_102554 - BLOCK
      ?auto_102555 - BLOCK
      ?auto_102556 - BLOCK
    )
    :vars
    (
      ?auto_102558 - BLOCK
      ?auto_102559 - BLOCK
      ?auto_102557 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_102552 ) ( ON ?auto_102553 ?auto_102552 ) ( not ( = ?auto_102552 ?auto_102553 ) ) ( not ( = ?auto_102552 ?auto_102554 ) ) ( not ( = ?auto_102552 ?auto_102555 ) ) ( not ( = ?auto_102552 ?auto_102556 ) ) ( not ( = ?auto_102552 ?auto_102558 ) ) ( not ( = ?auto_102553 ?auto_102554 ) ) ( not ( = ?auto_102553 ?auto_102555 ) ) ( not ( = ?auto_102553 ?auto_102556 ) ) ( not ( = ?auto_102553 ?auto_102558 ) ) ( not ( = ?auto_102554 ?auto_102555 ) ) ( not ( = ?auto_102554 ?auto_102556 ) ) ( not ( = ?auto_102554 ?auto_102558 ) ) ( not ( = ?auto_102555 ?auto_102556 ) ) ( not ( = ?auto_102555 ?auto_102558 ) ) ( not ( = ?auto_102556 ?auto_102558 ) ) ( not ( = ?auto_102552 ?auto_102559 ) ) ( not ( = ?auto_102553 ?auto_102559 ) ) ( not ( = ?auto_102554 ?auto_102559 ) ) ( not ( = ?auto_102555 ?auto_102559 ) ) ( not ( = ?auto_102556 ?auto_102559 ) ) ( not ( = ?auto_102558 ?auto_102559 ) ) ( ON ?auto_102559 ?auto_102557 ) ( not ( = ?auto_102552 ?auto_102557 ) ) ( not ( = ?auto_102553 ?auto_102557 ) ) ( not ( = ?auto_102554 ?auto_102557 ) ) ( not ( = ?auto_102555 ?auto_102557 ) ) ( not ( = ?auto_102556 ?auto_102557 ) ) ( not ( = ?auto_102558 ?auto_102557 ) ) ( not ( = ?auto_102559 ?auto_102557 ) ) ( ON ?auto_102558 ?auto_102559 ) ( ON ?auto_102556 ?auto_102558 ) ( ON-TABLE ?auto_102557 ) ( ON ?auto_102555 ?auto_102556 ) ( CLEAR ?auto_102553 ) ( ON ?auto_102554 ?auto_102555 ) ( CLEAR ?auto_102554 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_102557 ?auto_102559 ?auto_102558 ?auto_102556 ?auto_102555 )
      ( MAKE-5PILE ?auto_102552 ?auto_102553 ?auto_102554 ?auto_102555 ?auto_102556 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_102560 - BLOCK
      ?auto_102561 - BLOCK
      ?auto_102562 - BLOCK
      ?auto_102563 - BLOCK
      ?auto_102564 - BLOCK
    )
    :vars
    (
      ?auto_102567 - BLOCK
      ?auto_102565 - BLOCK
      ?auto_102566 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_102560 ) ( not ( = ?auto_102560 ?auto_102561 ) ) ( not ( = ?auto_102560 ?auto_102562 ) ) ( not ( = ?auto_102560 ?auto_102563 ) ) ( not ( = ?auto_102560 ?auto_102564 ) ) ( not ( = ?auto_102560 ?auto_102567 ) ) ( not ( = ?auto_102561 ?auto_102562 ) ) ( not ( = ?auto_102561 ?auto_102563 ) ) ( not ( = ?auto_102561 ?auto_102564 ) ) ( not ( = ?auto_102561 ?auto_102567 ) ) ( not ( = ?auto_102562 ?auto_102563 ) ) ( not ( = ?auto_102562 ?auto_102564 ) ) ( not ( = ?auto_102562 ?auto_102567 ) ) ( not ( = ?auto_102563 ?auto_102564 ) ) ( not ( = ?auto_102563 ?auto_102567 ) ) ( not ( = ?auto_102564 ?auto_102567 ) ) ( not ( = ?auto_102560 ?auto_102565 ) ) ( not ( = ?auto_102561 ?auto_102565 ) ) ( not ( = ?auto_102562 ?auto_102565 ) ) ( not ( = ?auto_102563 ?auto_102565 ) ) ( not ( = ?auto_102564 ?auto_102565 ) ) ( not ( = ?auto_102567 ?auto_102565 ) ) ( ON ?auto_102565 ?auto_102566 ) ( not ( = ?auto_102560 ?auto_102566 ) ) ( not ( = ?auto_102561 ?auto_102566 ) ) ( not ( = ?auto_102562 ?auto_102566 ) ) ( not ( = ?auto_102563 ?auto_102566 ) ) ( not ( = ?auto_102564 ?auto_102566 ) ) ( not ( = ?auto_102567 ?auto_102566 ) ) ( not ( = ?auto_102565 ?auto_102566 ) ) ( ON ?auto_102567 ?auto_102565 ) ( ON ?auto_102564 ?auto_102567 ) ( ON-TABLE ?auto_102566 ) ( ON ?auto_102563 ?auto_102564 ) ( ON ?auto_102562 ?auto_102563 ) ( CLEAR ?auto_102562 ) ( HOLDING ?auto_102561 ) ( CLEAR ?auto_102560 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_102560 ?auto_102561 )
      ( MAKE-5PILE ?auto_102560 ?auto_102561 ?auto_102562 ?auto_102563 ?auto_102564 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_102568 - BLOCK
      ?auto_102569 - BLOCK
      ?auto_102570 - BLOCK
      ?auto_102571 - BLOCK
      ?auto_102572 - BLOCK
    )
    :vars
    (
      ?auto_102574 - BLOCK
      ?auto_102575 - BLOCK
      ?auto_102573 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_102568 ) ( not ( = ?auto_102568 ?auto_102569 ) ) ( not ( = ?auto_102568 ?auto_102570 ) ) ( not ( = ?auto_102568 ?auto_102571 ) ) ( not ( = ?auto_102568 ?auto_102572 ) ) ( not ( = ?auto_102568 ?auto_102574 ) ) ( not ( = ?auto_102569 ?auto_102570 ) ) ( not ( = ?auto_102569 ?auto_102571 ) ) ( not ( = ?auto_102569 ?auto_102572 ) ) ( not ( = ?auto_102569 ?auto_102574 ) ) ( not ( = ?auto_102570 ?auto_102571 ) ) ( not ( = ?auto_102570 ?auto_102572 ) ) ( not ( = ?auto_102570 ?auto_102574 ) ) ( not ( = ?auto_102571 ?auto_102572 ) ) ( not ( = ?auto_102571 ?auto_102574 ) ) ( not ( = ?auto_102572 ?auto_102574 ) ) ( not ( = ?auto_102568 ?auto_102575 ) ) ( not ( = ?auto_102569 ?auto_102575 ) ) ( not ( = ?auto_102570 ?auto_102575 ) ) ( not ( = ?auto_102571 ?auto_102575 ) ) ( not ( = ?auto_102572 ?auto_102575 ) ) ( not ( = ?auto_102574 ?auto_102575 ) ) ( ON ?auto_102575 ?auto_102573 ) ( not ( = ?auto_102568 ?auto_102573 ) ) ( not ( = ?auto_102569 ?auto_102573 ) ) ( not ( = ?auto_102570 ?auto_102573 ) ) ( not ( = ?auto_102571 ?auto_102573 ) ) ( not ( = ?auto_102572 ?auto_102573 ) ) ( not ( = ?auto_102574 ?auto_102573 ) ) ( not ( = ?auto_102575 ?auto_102573 ) ) ( ON ?auto_102574 ?auto_102575 ) ( ON ?auto_102572 ?auto_102574 ) ( ON-TABLE ?auto_102573 ) ( ON ?auto_102571 ?auto_102572 ) ( ON ?auto_102570 ?auto_102571 ) ( CLEAR ?auto_102568 ) ( ON ?auto_102569 ?auto_102570 ) ( CLEAR ?auto_102569 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_102573 ?auto_102575 ?auto_102574 ?auto_102572 ?auto_102571 ?auto_102570 )
      ( MAKE-5PILE ?auto_102568 ?auto_102569 ?auto_102570 ?auto_102571 ?auto_102572 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_102576 - BLOCK
      ?auto_102577 - BLOCK
      ?auto_102578 - BLOCK
      ?auto_102579 - BLOCK
      ?auto_102580 - BLOCK
    )
    :vars
    (
      ?auto_102583 - BLOCK
      ?auto_102582 - BLOCK
      ?auto_102581 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_102576 ?auto_102577 ) ) ( not ( = ?auto_102576 ?auto_102578 ) ) ( not ( = ?auto_102576 ?auto_102579 ) ) ( not ( = ?auto_102576 ?auto_102580 ) ) ( not ( = ?auto_102576 ?auto_102583 ) ) ( not ( = ?auto_102577 ?auto_102578 ) ) ( not ( = ?auto_102577 ?auto_102579 ) ) ( not ( = ?auto_102577 ?auto_102580 ) ) ( not ( = ?auto_102577 ?auto_102583 ) ) ( not ( = ?auto_102578 ?auto_102579 ) ) ( not ( = ?auto_102578 ?auto_102580 ) ) ( not ( = ?auto_102578 ?auto_102583 ) ) ( not ( = ?auto_102579 ?auto_102580 ) ) ( not ( = ?auto_102579 ?auto_102583 ) ) ( not ( = ?auto_102580 ?auto_102583 ) ) ( not ( = ?auto_102576 ?auto_102582 ) ) ( not ( = ?auto_102577 ?auto_102582 ) ) ( not ( = ?auto_102578 ?auto_102582 ) ) ( not ( = ?auto_102579 ?auto_102582 ) ) ( not ( = ?auto_102580 ?auto_102582 ) ) ( not ( = ?auto_102583 ?auto_102582 ) ) ( ON ?auto_102582 ?auto_102581 ) ( not ( = ?auto_102576 ?auto_102581 ) ) ( not ( = ?auto_102577 ?auto_102581 ) ) ( not ( = ?auto_102578 ?auto_102581 ) ) ( not ( = ?auto_102579 ?auto_102581 ) ) ( not ( = ?auto_102580 ?auto_102581 ) ) ( not ( = ?auto_102583 ?auto_102581 ) ) ( not ( = ?auto_102582 ?auto_102581 ) ) ( ON ?auto_102583 ?auto_102582 ) ( ON ?auto_102580 ?auto_102583 ) ( ON-TABLE ?auto_102581 ) ( ON ?auto_102579 ?auto_102580 ) ( ON ?auto_102578 ?auto_102579 ) ( ON ?auto_102577 ?auto_102578 ) ( CLEAR ?auto_102577 ) ( HOLDING ?auto_102576 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_102576 )
      ( MAKE-5PILE ?auto_102576 ?auto_102577 ?auto_102578 ?auto_102579 ?auto_102580 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_102584 - BLOCK
      ?auto_102585 - BLOCK
      ?auto_102586 - BLOCK
      ?auto_102587 - BLOCK
      ?auto_102588 - BLOCK
    )
    :vars
    (
      ?auto_102591 - BLOCK
      ?auto_102590 - BLOCK
      ?auto_102589 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_102584 ?auto_102585 ) ) ( not ( = ?auto_102584 ?auto_102586 ) ) ( not ( = ?auto_102584 ?auto_102587 ) ) ( not ( = ?auto_102584 ?auto_102588 ) ) ( not ( = ?auto_102584 ?auto_102591 ) ) ( not ( = ?auto_102585 ?auto_102586 ) ) ( not ( = ?auto_102585 ?auto_102587 ) ) ( not ( = ?auto_102585 ?auto_102588 ) ) ( not ( = ?auto_102585 ?auto_102591 ) ) ( not ( = ?auto_102586 ?auto_102587 ) ) ( not ( = ?auto_102586 ?auto_102588 ) ) ( not ( = ?auto_102586 ?auto_102591 ) ) ( not ( = ?auto_102587 ?auto_102588 ) ) ( not ( = ?auto_102587 ?auto_102591 ) ) ( not ( = ?auto_102588 ?auto_102591 ) ) ( not ( = ?auto_102584 ?auto_102590 ) ) ( not ( = ?auto_102585 ?auto_102590 ) ) ( not ( = ?auto_102586 ?auto_102590 ) ) ( not ( = ?auto_102587 ?auto_102590 ) ) ( not ( = ?auto_102588 ?auto_102590 ) ) ( not ( = ?auto_102591 ?auto_102590 ) ) ( ON ?auto_102590 ?auto_102589 ) ( not ( = ?auto_102584 ?auto_102589 ) ) ( not ( = ?auto_102585 ?auto_102589 ) ) ( not ( = ?auto_102586 ?auto_102589 ) ) ( not ( = ?auto_102587 ?auto_102589 ) ) ( not ( = ?auto_102588 ?auto_102589 ) ) ( not ( = ?auto_102591 ?auto_102589 ) ) ( not ( = ?auto_102590 ?auto_102589 ) ) ( ON ?auto_102591 ?auto_102590 ) ( ON ?auto_102588 ?auto_102591 ) ( ON-TABLE ?auto_102589 ) ( ON ?auto_102587 ?auto_102588 ) ( ON ?auto_102586 ?auto_102587 ) ( ON ?auto_102585 ?auto_102586 ) ( ON ?auto_102584 ?auto_102585 ) ( CLEAR ?auto_102584 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_102589 ?auto_102590 ?auto_102591 ?auto_102588 ?auto_102587 ?auto_102586 ?auto_102585 )
      ( MAKE-5PILE ?auto_102584 ?auto_102585 ?auto_102586 ?auto_102587 ?auto_102588 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_102594 - BLOCK
      ?auto_102595 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_102595 ) ( CLEAR ?auto_102594 ) ( ON-TABLE ?auto_102594 ) ( not ( = ?auto_102594 ?auto_102595 ) ) )
    :subtasks
    ( ( !STACK ?auto_102595 ?auto_102594 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_102596 - BLOCK
      ?auto_102597 - BLOCK
    )
    :vars
    (
      ?auto_102598 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_102596 ) ( ON-TABLE ?auto_102596 ) ( not ( = ?auto_102596 ?auto_102597 ) ) ( ON ?auto_102597 ?auto_102598 ) ( CLEAR ?auto_102597 ) ( HAND-EMPTY ) ( not ( = ?auto_102596 ?auto_102598 ) ) ( not ( = ?auto_102597 ?auto_102598 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_102597 ?auto_102598 )
      ( MAKE-2PILE ?auto_102596 ?auto_102597 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_102599 - BLOCK
      ?auto_102600 - BLOCK
    )
    :vars
    (
      ?auto_102601 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_102599 ?auto_102600 ) ) ( ON ?auto_102600 ?auto_102601 ) ( CLEAR ?auto_102600 ) ( not ( = ?auto_102599 ?auto_102601 ) ) ( not ( = ?auto_102600 ?auto_102601 ) ) ( HOLDING ?auto_102599 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_102599 )
      ( MAKE-2PILE ?auto_102599 ?auto_102600 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_102602 - BLOCK
      ?auto_102603 - BLOCK
    )
    :vars
    (
      ?auto_102604 - BLOCK
      ?auto_102607 - BLOCK
      ?auto_102606 - BLOCK
      ?auto_102605 - BLOCK
      ?auto_102608 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_102602 ?auto_102603 ) ) ( ON ?auto_102603 ?auto_102604 ) ( not ( = ?auto_102602 ?auto_102604 ) ) ( not ( = ?auto_102603 ?auto_102604 ) ) ( ON ?auto_102602 ?auto_102603 ) ( CLEAR ?auto_102602 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_102607 ) ( ON ?auto_102606 ?auto_102607 ) ( ON ?auto_102605 ?auto_102606 ) ( ON ?auto_102608 ?auto_102605 ) ( ON ?auto_102604 ?auto_102608 ) ( not ( = ?auto_102607 ?auto_102606 ) ) ( not ( = ?auto_102607 ?auto_102605 ) ) ( not ( = ?auto_102607 ?auto_102608 ) ) ( not ( = ?auto_102607 ?auto_102604 ) ) ( not ( = ?auto_102607 ?auto_102603 ) ) ( not ( = ?auto_102607 ?auto_102602 ) ) ( not ( = ?auto_102606 ?auto_102605 ) ) ( not ( = ?auto_102606 ?auto_102608 ) ) ( not ( = ?auto_102606 ?auto_102604 ) ) ( not ( = ?auto_102606 ?auto_102603 ) ) ( not ( = ?auto_102606 ?auto_102602 ) ) ( not ( = ?auto_102605 ?auto_102608 ) ) ( not ( = ?auto_102605 ?auto_102604 ) ) ( not ( = ?auto_102605 ?auto_102603 ) ) ( not ( = ?auto_102605 ?auto_102602 ) ) ( not ( = ?auto_102608 ?auto_102604 ) ) ( not ( = ?auto_102608 ?auto_102603 ) ) ( not ( = ?auto_102608 ?auto_102602 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_102607 ?auto_102606 ?auto_102605 ?auto_102608 ?auto_102604 ?auto_102603 )
      ( MAKE-2PILE ?auto_102602 ?auto_102603 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_102609 - BLOCK
      ?auto_102610 - BLOCK
    )
    :vars
    (
      ?auto_102614 - BLOCK
      ?auto_102612 - BLOCK
      ?auto_102615 - BLOCK
      ?auto_102613 - BLOCK
      ?auto_102611 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_102609 ?auto_102610 ) ) ( ON ?auto_102610 ?auto_102614 ) ( not ( = ?auto_102609 ?auto_102614 ) ) ( not ( = ?auto_102610 ?auto_102614 ) ) ( ON-TABLE ?auto_102612 ) ( ON ?auto_102615 ?auto_102612 ) ( ON ?auto_102613 ?auto_102615 ) ( ON ?auto_102611 ?auto_102613 ) ( ON ?auto_102614 ?auto_102611 ) ( not ( = ?auto_102612 ?auto_102615 ) ) ( not ( = ?auto_102612 ?auto_102613 ) ) ( not ( = ?auto_102612 ?auto_102611 ) ) ( not ( = ?auto_102612 ?auto_102614 ) ) ( not ( = ?auto_102612 ?auto_102610 ) ) ( not ( = ?auto_102612 ?auto_102609 ) ) ( not ( = ?auto_102615 ?auto_102613 ) ) ( not ( = ?auto_102615 ?auto_102611 ) ) ( not ( = ?auto_102615 ?auto_102614 ) ) ( not ( = ?auto_102615 ?auto_102610 ) ) ( not ( = ?auto_102615 ?auto_102609 ) ) ( not ( = ?auto_102613 ?auto_102611 ) ) ( not ( = ?auto_102613 ?auto_102614 ) ) ( not ( = ?auto_102613 ?auto_102610 ) ) ( not ( = ?auto_102613 ?auto_102609 ) ) ( not ( = ?auto_102611 ?auto_102614 ) ) ( not ( = ?auto_102611 ?auto_102610 ) ) ( not ( = ?auto_102611 ?auto_102609 ) ) ( HOLDING ?auto_102609 ) ( CLEAR ?auto_102610 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_102612 ?auto_102615 ?auto_102613 ?auto_102611 ?auto_102614 ?auto_102610 ?auto_102609 )
      ( MAKE-2PILE ?auto_102609 ?auto_102610 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_102616 - BLOCK
      ?auto_102617 - BLOCK
    )
    :vars
    (
      ?auto_102619 - BLOCK
      ?auto_102622 - BLOCK
      ?auto_102618 - BLOCK
      ?auto_102621 - BLOCK
      ?auto_102620 - BLOCK
      ?auto_102623 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_102616 ?auto_102617 ) ) ( ON ?auto_102617 ?auto_102619 ) ( not ( = ?auto_102616 ?auto_102619 ) ) ( not ( = ?auto_102617 ?auto_102619 ) ) ( ON-TABLE ?auto_102622 ) ( ON ?auto_102618 ?auto_102622 ) ( ON ?auto_102621 ?auto_102618 ) ( ON ?auto_102620 ?auto_102621 ) ( ON ?auto_102619 ?auto_102620 ) ( not ( = ?auto_102622 ?auto_102618 ) ) ( not ( = ?auto_102622 ?auto_102621 ) ) ( not ( = ?auto_102622 ?auto_102620 ) ) ( not ( = ?auto_102622 ?auto_102619 ) ) ( not ( = ?auto_102622 ?auto_102617 ) ) ( not ( = ?auto_102622 ?auto_102616 ) ) ( not ( = ?auto_102618 ?auto_102621 ) ) ( not ( = ?auto_102618 ?auto_102620 ) ) ( not ( = ?auto_102618 ?auto_102619 ) ) ( not ( = ?auto_102618 ?auto_102617 ) ) ( not ( = ?auto_102618 ?auto_102616 ) ) ( not ( = ?auto_102621 ?auto_102620 ) ) ( not ( = ?auto_102621 ?auto_102619 ) ) ( not ( = ?auto_102621 ?auto_102617 ) ) ( not ( = ?auto_102621 ?auto_102616 ) ) ( not ( = ?auto_102620 ?auto_102619 ) ) ( not ( = ?auto_102620 ?auto_102617 ) ) ( not ( = ?auto_102620 ?auto_102616 ) ) ( CLEAR ?auto_102617 ) ( ON ?auto_102616 ?auto_102623 ) ( CLEAR ?auto_102616 ) ( HAND-EMPTY ) ( not ( = ?auto_102616 ?auto_102623 ) ) ( not ( = ?auto_102617 ?auto_102623 ) ) ( not ( = ?auto_102619 ?auto_102623 ) ) ( not ( = ?auto_102622 ?auto_102623 ) ) ( not ( = ?auto_102618 ?auto_102623 ) ) ( not ( = ?auto_102621 ?auto_102623 ) ) ( not ( = ?auto_102620 ?auto_102623 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_102616 ?auto_102623 )
      ( MAKE-2PILE ?auto_102616 ?auto_102617 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_102624 - BLOCK
      ?auto_102625 - BLOCK
    )
    :vars
    (
      ?auto_102627 - BLOCK
      ?auto_102631 - BLOCK
      ?auto_102629 - BLOCK
      ?auto_102630 - BLOCK
      ?auto_102628 - BLOCK
      ?auto_102626 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_102624 ?auto_102625 ) ) ( not ( = ?auto_102624 ?auto_102627 ) ) ( not ( = ?auto_102625 ?auto_102627 ) ) ( ON-TABLE ?auto_102631 ) ( ON ?auto_102629 ?auto_102631 ) ( ON ?auto_102630 ?auto_102629 ) ( ON ?auto_102628 ?auto_102630 ) ( ON ?auto_102627 ?auto_102628 ) ( not ( = ?auto_102631 ?auto_102629 ) ) ( not ( = ?auto_102631 ?auto_102630 ) ) ( not ( = ?auto_102631 ?auto_102628 ) ) ( not ( = ?auto_102631 ?auto_102627 ) ) ( not ( = ?auto_102631 ?auto_102625 ) ) ( not ( = ?auto_102631 ?auto_102624 ) ) ( not ( = ?auto_102629 ?auto_102630 ) ) ( not ( = ?auto_102629 ?auto_102628 ) ) ( not ( = ?auto_102629 ?auto_102627 ) ) ( not ( = ?auto_102629 ?auto_102625 ) ) ( not ( = ?auto_102629 ?auto_102624 ) ) ( not ( = ?auto_102630 ?auto_102628 ) ) ( not ( = ?auto_102630 ?auto_102627 ) ) ( not ( = ?auto_102630 ?auto_102625 ) ) ( not ( = ?auto_102630 ?auto_102624 ) ) ( not ( = ?auto_102628 ?auto_102627 ) ) ( not ( = ?auto_102628 ?auto_102625 ) ) ( not ( = ?auto_102628 ?auto_102624 ) ) ( ON ?auto_102624 ?auto_102626 ) ( CLEAR ?auto_102624 ) ( not ( = ?auto_102624 ?auto_102626 ) ) ( not ( = ?auto_102625 ?auto_102626 ) ) ( not ( = ?auto_102627 ?auto_102626 ) ) ( not ( = ?auto_102631 ?auto_102626 ) ) ( not ( = ?auto_102629 ?auto_102626 ) ) ( not ( = ?auto_102630 ?auto_102626 ) ) ( not ( = ?auto_102628 ?auto_102626 ) ) ( HOLDING ?auto_102625 ) ( CLEAR ?auto_102627 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_102631 ?auto_102629 ?auto_102630 ?auto_102628 ?auto_102627 ?auto_102625 )
      ( MAKE-2PILE ?auto_102624 ?auto_102625 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_102632 - BLOCK
      ?auto_102633 - BLOCK
    )
    :vars
    (
      ?auto_102638 - BLOCK
      ?auto_102636 - BLOCK
      ?auto_102637 - BLOCK
      ?auto_102635 - BLOCK
      ?auto_102634 - BLOCK
      ?auto_102639 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_102632 ?auto_102633 ) ) ( not ( = ?auto_102632 ?auto_102638 ) ) ( not ( = ?auto_102633 ?auto_102638 ) ) ( ON-TABLE ?auto_102636 ) ( ON ?auto_102637 ?auto_102636 ) ( ON ?auto_102635 ?auto_102637 ) ( ON ?auto_102634 ?auto_102635 ) ( ON ?auto_102638 ?auto_102634 ) ( not ( = ?auto_102636 ?auto_102637 ) ) ( not ( = ?auto_102636 ?auto_102635 ) ) ( not ( = ?auto_102636 ?auto_102634 ) ) ( not ( = ?auto_102636 ?auto_102638 ) ) ( not ( = ?auto_102636 ?auto_102633 ) ) ( not ( = ?auto_102636 ?auto_102632 ) ) ( not ( = ?auto_102637 ?auto_102635 ) ) ( not ( = ?auto_102637 ?auto_102634 ) ) ( not ( = ?auto_102637 ?auto_102638 ) ) ( not ( = ?auto_102637 ?auto_102633 ) ) ( not ( = ?auto_102637 ?auto_102632 ) ) ( not ( = ?auto_102635 ?auto_102634 ) ) ( not ( = ?auto_102635 ?auto_102638 ) ) ( not ( = ?auto_102635 ?auto_102633 ) ) ( not ( = ?auto_102635 ?auto_102632 ) ) ( not ( = ?auto_102634 ?auto_102638 ) ) ( not ( = ?auto_102634 ?auto_102633 ) ) ( not ( = ?auto_102634 ?auto_102632 ) ) ( ON ?auto_102632 ?auto_102639 ) ( not ( = ?auto_102632 ?auto_102639 ) ) ( not ( = ?auto_102633 ?auto_102639 ) ) ( not ( = ?auto_102638 ?auto_102639 ) ) ( not ( = ?auto_102636 ?auto_102639 ) ) ( not ( = ?auto_102637 ?auto_102639 ) ) ( not ( = ?auto_102635 ?auto_102639 ) ) ( not ( = ?auto_102634 ?auto_102639 ) ) ( CLEAR ?auto_102638 ) ( ON ?auto_102633 ?auto_102632 ) ( CLEAR ?auto_102633 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_102639 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_102639 ?auto_102632 )
      ( MAKE-2PILE ?auto_102632 ?auto_102633 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_102640 - BLOCK
      ?auto_102641 - BLOCK
    )
    :vars
    (
      ?auto_102643 - BLOCK
      ?auto_102645 - BLOCK
      ?auto_102646 - BLOCK
      ?auto_102642 - BLOCK
      ?auto_102647 - BLOCK
      ?auto_102644 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_102640 ?auto_102641 ) ) ( not ( = ?auto_102640 ?auto_102643 ) ) ( not ( = ?auto_102641 ?auto_102643 ) ) ( ON-TABLE ?auto_102645 ) ( ON ?auto_102646 ?auto_102645 ) ( ON ?auto_102642 ?auto_102646 ) ( ON ?auto_102647 ?auto_102642 ) ( not ( = ?auto_102645 ?auto_102646 ) ) ( not ( = ?auto_102645 ?auto_102642 ) ) ( not ( = ?auto_102645 ?auto_102647 ) ) ( not ( = ?auto_102645 ?auto_102643 ) ) ( not ( = ?auto_102645 ?auto_102641 ) ) ( not ( = ?auto_102645 ?auto_102640 ) ) ( not ( = ?auto_102646 ?auto_102642 ) ) ( not ( = ?auto_102646 ?auto_102647 ) ) ( not ( = ?auto_102646 ?auto_102643 ) ) ( not ( = ?auto_102646 ?auto_102641 ) ) ( not ( = ?auto_102646 ?auto_102640 ) ) ( not ( = ?auto_102642 ?auto_102647 ) ) ( not ( = ?auto_102642 ?auto_102643 ) ) ( not ( = ?auto_102642 ?auto_102641 ) ) ( not ( = ?auto_102642 ?auto_102640 ) ) ( not ( = ?auto_102647 ?auto_102643 ) ) ( not ( = ?auto_102647 ?auto_102641 ) ) ( not ( = ?auto_102647 ?auto_102640 ) ) ( ON ?auto_102640 ?auto_102644 ) ( not ( = ?auto_102640 ?auto_102644 ) ) ( not ( = ?auto_102641 ?auto_102644 ) ) ( not ( = ?auto_102643 ?auto_102644 ) ) ( not ( = ?auto_102645 ?auto_102644 ) ) ( not ( = ?auto_102646 ?auto_102644 ) ) ( not ( = ?auto_102642 ?auto_102644 ) ) ( not ( = ?auto_102647 ?auto_102644 ) ) ( ON ?auto_102641 ?auto_102640 ) ( CLEAR ?auto_102641 ) ( ON-TABLE ?auto_102644 ) ( HOLDING ?auto_102643 ) ( CLEAR ?auto_102647 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_102645 ?auto_102646 ?auto_102642 ?auto_102647 ?auto_102643 )
      ( MAKE-2PILE ?auto_102640 ?auto_102641 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_102648 - BLOCK
      ?auto_102649 - BLOCK
    )
    :vars
    (
      ?auto_102654 - BLOCK
      ?auto_102653 - BLOCK
      ?auto_102655 - BLOCK
      ?auto_102652 - BLOCK
      ?auto_102651 - BLOCK
      ?auto_102650 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_102648 ?auto_102649 ) ) ( not ( = ?auto_102648 ?auto_102654 ) ) ( not ( = ?auto_102649 ?auto_102654 ) ) ( ON-TABLE ?auto_102653 ) ( ON ?auto_102655 ?auto_102653 ) ( ON ?auto_102652 ?auto_102655 ) ( ON ?auto_102651 ?auto_102652 ) ( not ( = ?auto_102653 ?auto_102655 ) ) ( not ( = ?auto_102653 ?auto_102652 ) ) ( not ( = ?auto_102653 ?auto_102651 ) ) ( not ( = ?auto_102653 ?auto_102654 ) ) ( not ( = ?auto_102653 ?auto_102649 ) ) ( not ( = ?auto_102653 ?auto_102648 ) ) ( not ( = ?auto_102655 ?auto_102652 ) ) ( not ( = ?auto_102655 ?auto_102651 ) ) ( not ( = ?auto_102655 ?auto_102654 ) ) ( not ( = ?auto_102655 ?auto_102649 ) ) ( not ( = ?auto_102655 ?auto_102648 ) ) ( not ( = ?auto_102652 ?auto_102651 ) ) ( not ( = ?auto_102652 ?auto_102654 ) ) ( not ( = ?auto_102652 ?auto_102649 ) ) ( not ( = ?auto_102652 ?auto_102648 ) ) ( not ( = ?auto_102651 ?auto_102654 ) ) ( not ( = ?auto_102651 ?auto_102649 ) ) ( not ( = ?auto_102651 ?auto_102648 ) ) ( ON ?auto_102648 ?auto_102650 ) ( not ( = ?auto_102648 ?auto_102650 ) ) ( not ( = ?auto_102649 ?auto_102650 ) ) ( not ( = ?auto_102654 ?auto_102650 ) ) ( not ( = ?auto_102653 ?auto_102650 ) ) ( not ( = ?auto_102655 ?auto_102650 ) ) ( not ( = ?auto_102652 ?auto_102650 ) ) ( not ( = ?auto_102651 ?auto_102650 ) ) ( ON ?auto_102649 ?auto_102648 ) ( ON-TABLE ?auto_102650 ) ( CLEAR ?auto_102651 ) ( ON ?auto_102654 ?auto_102649 ) ( CLEAR ?auto_102654 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_102650 ?auto_102648 ?auto_102649 )
      ( MAKE-2PILE ?auto_102648 ?auto_102649 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_102656 - BLOCK
      ?auto_102657 - BLOCK
    )
    :vars
    (
      ?auto_102661 - BLOCK
      ?auto_102658 - BLOCK
      ?auto_102659 - BLOCK
      ?auto_102662 - BLOCK
      ?auto_102663 - BLOCK
      ?auto_102660 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_102656 ?auto_102657 ) ) ( not ( = ?auto_102656 ?auto_102661 ) ) ( not ( = ?auto_102657 ?auto_102661 ) ) ( ON-TABLE ?auto_102658 ) ( ON ?auto_102659 ?auto_102658 ) ( ON ?auto_102662 ?auto_102659 ) ( not ( = ?auto_102658 ?auto_102659 ) ) ( not ( = ?auto_102658 ?auto_102662 ) ) ( not ( = ?auto_102658 ?auto_102663 ) ) ( not ( = ?auto_102658 ?auto_102661 ) ) ( not ( = ?auto_102658 ?auto_102657 ) ) ( not ( = ?auto_102658 ?auto_102656 ) ) ( not ( = ?auto_102659 ?auto_102662 ) ) ( not ( = ?auto_102659 ?auto_102663 ) ) ( not ( = ?auto_102659 ?auto_102661 ) ) ( not ( = ?auto_102659 ?auto_102657 ) ) ( not ( = ?auto_102659 ?auto_102656 ) ) ( not ( = ?auto_102662 ?auto_102663 ) ) ( not ( = ?auto_102662 ?auto_102661 ) ) ( not ( = ?auto_102662 ?auto_102657 ) ) ( not ( = ?auto_102662 ?auto_102656 ) ) ( not ( = ?auto_102663 ?auto_102661 ) ) ( not ( = ?auto_102663 ?auto_102657 ) ) ( not ( = ?auto_102663 ?auto_102656 ) ) ( ON ?auto_102656 ?auto_102660 ) ( not ( = ?auto_102656 ?auto_102660 ) ) ( not ( = ?auto_102657 ?auto_102660 ) ) ( not ( = ?auto_102661 ?auto_102660 ) ) ( not ( = ?auto_102658 ?auto_102660 ) ) ( not ( = ?auto_102659 ?auto_102660 ) ) ( not ( = ?auto_102662 ?auto_102660 ) ) ( not ( = ?auto_102663 ?auto_102660 ) ) ( ON ?auto_102657 ?auto_102656 ) ( ON-TABLE ?auto_102660 ) ( ON ?auto_102661 ?auto_102657 ) ( CLEAR ?auto_102661 ) ( HOLDING ?auto_102663 ) ( CLEAR ?auto_102662 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_102658 ?auto_102659 ?auto_102662 ?auto_102663 )
      ( MAKE-2PILE ?auto_102656 ?auto_102657 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_102664 - BLOCK
      ?auto_102665 - BLOCK
    )
    :vars
    (
      ?auto_102666 - BLOCK
      ?auto_102668 - BLOCK
      ?auto_102670 - BLOCK
      ?auto_102667 - BLOCK
      ?auto_102669 - BLOCK
      ?auto_102671 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_102664 ?auto_102665 ) ) ( not ( = ?auto_102664 ?auto_102666 ) ) ( not ( = ?auto_102665 ?auto_102666 ) ) ( ON-TABLE ?auto_102668 ) ( ON ?auto_102670 ?auto_102668 ) ( ON ?auto_102667 ?auto_102670 ) ( not ( = ?auto_102668 ?auto_102670 ) ) ( not ( = ?auto_102668 ?auto_102667 ) ) ( not ( = ?auto_102668 ?auto_102669 ) ) ( not ( = ?auto_102668 ?auto_102666 ) ) ( not ( = ?auto_102668 ?auto_102665 ) ) ( not ( = ?auto_102668 ?auto_102664 ) ) ( not ( = ?auto_102670 ?auto_102667 ) ) ( not ( = ?auto_102670 ?auto_102669 ) ) ( not ( = ?auto_102670 ?auto_102666 ) ) ( not ( = ?auto_102670 ?auto_102665 ) ) ( not ( = ?auto_102670 ?auto_102664 ) ) ( not ( = ?auto_102667 ?auto_102669 ) ) ( not ( = ?auto_102667 ?auto_102666 ) ) ( not ( = ?auto_102667 ?auto_102665 ) ) ( not ( = ?auto_102667 ?auto_102664 ) ) ( not ( = ?auto_102669 ?auto_102666 ) ) ( not ( = ?auto_102669 ?auto_102665 ) ) ( not ( = ?auto_102669 ?auto_102664 ) ) ( ON ?auto_102664 ?auto_102671 ) ( not ( = ?auto_102664 ?auto_102671 ) ) ( not ( = ?auto_102665 ?auto_102671 ) ) ( not ( = ?auto_102666 ?auto_102671 ) ) ( not ( = ?auto_102668 ?auto_102671 ) ) ( not ( = ?auto_102670 ?auto_102671 ) ) ( not ( = ?auto_102667 ?auto_102671 ) ) ( not ( = ?auto_102669 ?auto_102671 ) ) ( ON ?auto_102665 ?auto_102664 ) ( ON-TABLE ?auto_102671 ) ( ON ?auto_102666 ?auto_102665 ) ( CLEAR ?auto_102667 ) ( ON ?auto_102669 ?auto_102666 ) ( CLEAR ?auto_102669 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_102671 ?auto_102664 ?auto_102665 ?auto_102666 )
      ( MAKE-2PILE ?auto_102664 ?auto_102665 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_102672 - BLOCK
      ?auto_102673 - BLOCK
    )
    :vars
    (
      ?auto_102676 - BLOCK
      ?auto_102675 - BLOCK
      ?auto_102674 - BLOCK
      ?auto_102677 - BLOCK
      ?auto_102679 - BLOCK
      ?auto_102678 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_102672 ?auto_102673 ) ) ( not ( = ?auto_102672 ?auto_102676 ) ) ( not ( = ?auto_102673 ?auto_102676 ) ) ( ON-TABLE ?auto_102675 ) ( ON ?auto_102674 ?auto_102675 ) ( not ( = ?auto_102675 ?auto_102674 ) ) ( not ( = ?auto_102675 ?auto_102677 ) ) ( not ( = ?auto_102675 ?auto_102679 ) ) ( not ( = ?auto_102675 ?auto_102676 ) ) ( not ( = ?auto_102675 ?auto_102673 ) ) ( not ( = ?auto_102675 ?auto_102672 ) ) ( not ( = ?auto_102674 ?auto_102677 ) ) ( not ( = ?auto_102674 ?auto_102679 ) ) ( not ( = ?auto_102674 ?auto_102676 ) ) ( not ( = ?auto_102674 ?auto_102673 ) ) ( not ( = ?auto_102674 ?auto_102672 ) ) ( not ( = ?auto_102677 ?auto_102679 ) ) ( not ( = ?auto_102677 ?auto_102676 ) ) ( not ( = ?auto_102677 ?auto_102673 ) ) ( not ( = ?auto_102677 ?auto_102672 ) ) ( not ( = ?auto_102679 ?auto_102676 ) ) ( not ( = ?auto_102679 ?auto_102673 ) ) ( not ( = ?auto_102679 ?auto_102672 ) ) ( ON ?auto_102672 ?auto_102678 ) ( not ( = ?auto_102672 ?auto_102678 ) ) ( not ( = ?auto_102673 ?auto_102678 ) ) ( not ( = ?auto_102676 ?auto_102678 ) ) ( not ( = ?auto_102675 ?auto_102678 ) ) ( not ( = ?auto_102674 ?auto_102678 ) ) ( not ( = ?auto_102677 ?auto_102678 ) ) ( not ( = ?auto_102679 ?auto_102678 ) ) ( ON ?auto_102673 ?auto_102672 ) ( ON-TABLE ?auto_102678 ) ( ON ?auto_102676 ?auto_102673 ) ( ON ?auto_102679 ?auto_102676 ) ( CLEAR ?auto_102679 ) ( HOLDING ?auto_102677 ) ( CLEAR ?auto_102674 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_102675 ?auto_102674 ?auto_102677 )
      ( MAKE-2PILE ?auto_102672 ?auto_102673 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_102680 - BLOCK
      ?auto_102681 - BLOCK
    )
    :vars
    (
      ?auto_102686 - BLOCK
      ?auto_102685 - BLOCK
      ?auto_102684 - BLOCK
      ?auto_102687 - BLOCK
      ?auto_102682 - BLOCK
      ?auto_102683 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_102680 ?auto_102681 ) ) ( not ( = ?auto_102680 ?auto_102686 ) ) ( not ( = ?auto_102681 ?auto_102686 ) ) ( ON-TABLE ?auto_102685 ) ( ON ?auto_102684 ?auto_102685 ) ( not ( = ?auto_102685 ?auto_102684 ) ) ( not ( = ?auto_102685 ?auto_102687 ) ) ( not ( = ?auto_102685 ?auto_102682 ) ) ( not ( = ?auto_102685 ?auto_102686 ) ) ( not ( = ?auto_102685 ?auto_102681 ) ) ( not ( = ?auto_102685 ?auto_102680 ) ) ( not ( = ?auto_102684 ?auto_102687 ) ) ( not ( = ?auto_102684 ?auto_102682 ) ) ( not ( = ?auto_102684 ?auto_102686 ) ) ( not ( = ?auto_102684 ?auto_102681 ) ) ( not ( = ?auto_102684 ?auto_102680 ) ) ( not ( = ?auto_102687 ?auto_102682 ) ) ( not ( = ?auto_102687 ?auto_102686 ) ) ( not ( = ?auto_102687 ?auto_102681 ) ) ( not ( = ?auto_102687 ?auto_102680 ) ) ( not ( = ?auto_102682 ?auto_102686 ) ) ( not ( = ?auto_102682 ?auto_102681 ) ) ( not ( = ?auto_102682 ?auto_102680 ) ) ( ON ?auto_102680 ?auto_102683 ) ( not ( = ?auto_102680 ?auto_102683 ) ) ( not ( = ?auto_102681 ?auto_102683 ) ) ( not ( = ?auto_102686 ?auto_102683 ) ) ( not ( = ?auto_102685 ?auto_102683 ) ) ( not ( = ?auto_102684 ?auto_102683 ) ) ( not ( = ?auto_102687 ?auto_102683 ) ) ( not ( = ?auto_102682 ?auto_102683 ) ) ( ON ?auto_102681 ?auto_102680 ) ( ON-TABLE ?auto_102683 ) ( ON ?auto_102686 ?auto_102681 ) ( ON ?auto_102682 ?auto_102686 ) ( CLEAR ?auto_102684 ) ( ON ?auto_102687 ?auto_102682 ) ( CLEAR ?auto_102687 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_102683 ?auto_102680 ?auto_102681 ?auto_102686 ?auto_102682 )
      ( MAKE-2PILE ?auto_102680 ?auto_102681 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_102688 - BLOCK
      ?auto_102689 - BLOCK
    )
    :vars
    (
      ?auto_102694 - BLOCK
      ?auto_102695 - BLOCK
      ?auto_102692 - BLOCK
      ?auto_102691 - BLOCK
      ?auto_102693 - BLOCK
      ?auto_102690 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_102688 ?auto_102689 ) ) ( not ( = ?auto_102688 ?auto_102694 ) ) ( not ( = ?auto_102689 ?auto_102694 ) ) ( ON-TABLE ?auto_102695 ) ( not ( = ?auto_102695 ?auto_102692 ) ) ( not ( = ?auto_102695 ?auto_102691 ) ) ( not ( = ?auto_102695 ?auto_102693 ) ) ( not ( = ?auto_102695 ?auto_102694 ) ) ( not ( = ?auto_102695 ?auto_102689 ) ) ( not ( = ?auto_102695 ?auto_102688 ) ) ( not ( = ?auto_102692 ?auto_102691 ) ) ( not ( = ?auto_102692 ?auto_102693 ) ) ( not ( = ?auto_102692 ?auto_102694 ) ) ( not ( = ?auto_102692 ?auto_102689 ) ) ( not ( = ?auto_102692 ?auto_102688 ) ) ( not ( = ?auto_102691 ?auto_102693 ) ) ( not ( = ?auto_102691 ?auto_102694 ) ) ( not ( = ?auto_102691 ?auto_102689 ) ) ( not ( = ?auto_102691 ?auto_102688 ) ) ( not ( = ?auto_102693 ?auto_102694 ) ) ( not ( = ?auto_102693 ?auto_102689 ) ) ( not ( = ?auto_102693 ?auto_102688 ) ) ( ON ?auto_102688 ?auto_102690 ) ( not ( = ?auto_102688 ?auto_102690 ) ) ( not ( = ?auto_102689 ?auto_102690 ) ) ( not ( = ?auto_102694 ?auto_102690 ) ) ( not ( = ?auto_102695 ?auto_102690 ) ) ( not ( = ?auto_102692 ?auto_102690 ) ) ( not ( = ?auto_102691 ?auto_102690 ) ) ( not ( = ?auto_102693 ?auto_102690 ) ) ( ON ?auto_102689 ?auto_102688 ) ( ON-TABLE ?auto_102690 ) ( ON ?auto_102694 ?auto_102689 ) ( ON ?auto_102693 ?auto_102694 ) ( ON ?auto_102691 ?auto_102693 ) ( CLEAR ?auto_102691 ) ( HOLDING ?auto_102692 ) ( CLEAR ?auto_102695 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_102695 ?auto_102692 )
      ( MAKE-2PILE ?auto_102688 ?auto_102689 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_102696 - BLOCK
      ?auto_102697 - BLOCK
    )
    :vars
    (
      ?auto_102698 - BLOCK
      ?auto_102701 - BLOCK
      ?auto_102700 - BLOCK
      ?auto_102699 - BLOCK
      ?auto_102702 - BLOCK
      ?auto_102703 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_102696 ?auto_102697 ) ) ( not ( = ?auto_102696 ?auto_102698 ) ) ( not ( = ?auto_102697 ?auto_102698 ) ) ( ON-TABLE ?auto_102701 ) ( not ( = ?auto_102701 ?auto_102700 ) ) ( not ( = ?auto_102701 ?auto_102699 ) ) ( not ( = ?auto_102701 ?auto_102702 ) ) ( not ( = ?auto_102701 ?auto_102698 ) ) ( not ( = ?auto_102701 ?auto_102697 ) ) ( not ( = ?auto_102701 ?auto_102696 ) ) ( not ( = ?auto_102700 ?auto_102699 ) ) ( not ( = ?auto_102700 ?auto_102702 ) ) ( not ( = ?auto_102700 ?auto_102698 ) ) ( not ( = ?auto_102700 ?auto_102697 ) ) ( not ( = ?auto_102700 ?auto_102696 ) ) ( not ( = ?auto_102699 ?auto_102702 ) ) ( not ( = ?auto_102699 ?auto_102698 ) ) ( not ( = ?auto_102699 ?auto_102697 ) ) ( not ( = ?auto_102699 ?auto_102696 ) ) ( not ( = ?auto_102702 ?auto_102698 ) ) ( not ( = ?auto_102702 ?auto_102697 ) ) ( not ( = ?auto_102702 ?auto_102696 ) ) ( ON ?auto_102696 ?auto_102703 ) ( not ( = ?auto_102696 ?auto_102703 ) ) ( not ( = ?auto_102697 ?auto_102703 ) ) ( not ( = ?auto_102698 ?auto_102703 ) ) ( not ( = ?auto_102701 ?auto_102703 ) ) ( not ( = ?auto_102700 ?auto_102703 ) ) ( not ( = ?auto_102699 ?auto_102703 ) ) ( not ( = ?auto_102702 ?auto_102703 ) ) ( ON ?auto_102697 ?auto_102696 ) ( ON-TABLE ?auto_102703 ) ( ON ?auto_102698 ?auto_102697 ) ( ON ?auto_102702 ?auto_102698 ) ( ON ?auto_102699 ?auto_102702 ) ( CLEAR ?auto_102701 ) ( ON ?auto_102700 ?auto_102699 ) ( CLEAR ?auto_102700 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_102703 ?auto_102696 ?auto_102697 ?auto_102698 ?auto_102702 ?auto_102699 )
      ( MAKE-2PILE ?auto_102696 ?auto_102697 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_102704 - BLOCK
      ?auto_102705 - BLOCK
    )
    :vars
    (
      ?auto_102711 - BLOCK
      ?auto_102710 - BLOCK
      ?auto_102706 - BLOCK
      ?auto_102707 - BLOCK
      ?auto_102709 - BLOCK
      ?auto_102708 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_102704 ?auto_102705 ) ) ( not ( = ?auto_102704 ?auto_102711 ) ) ( not ( = ?auto_102705 ?auto_102711 ) ) ( not ( = ?auto_102710 ?auto_102706 ) ) ( not ( = ?auto_102710 ?auto_102707 ) ) ( not ( = ?auto_102710 ?auto_102709 ) ) ( not ( = ?auto_102710 ?auto_102711 ) ) ( not ( = ?auto_102710 ?auto_102705 ) ) ( not ( = ?auto_102710 ?auto_102704 ) ) ( not ( = ?auto_102706 ?auto_102707 ) ) ( not ( = ?auto_102706 ?auto_102709 ) ) ( not ( = ?auto_102706 ?auto_102711 ) ) ( not ( = ?auto_102706 ?auto_102705 ) ) ( not ( = ?auto_102706 ?auto_102704 ) ) ( not ( = ?auto_102707 ?auto_102709 ) ) ( not ( = ?auto_102707 ?auto_102711 ) ) ( not ( = ?auto_102707 ?auto_102705 ) ) ( not ( = ?auto_102707 ?auto_102704 ) ) ( not ( = ?auto_102709 ?auto_102711 ) ) ( not ( = ?auto_102709 ?auto_102705 ) ) ( not ( = ?auto_102709 ?auto_102704 ) ) ( ON ?auto_102704 ?auto_102708 ) ( not ( = ?auto_102704 ?auto_102708 ) ) ( not ( = ?auto_102705 ?auto_102708 ) ) ( not ( = ?auto_102711 ?auto_102708 ) ) ( not ( = ?auto_102710 ?auto_102708 ) ) ( not ( = ?auto_102706 ?auto_102708 ) ) ( not ( = ?auto_102707 ?auto_102708 ) ) ( not ( = ?auto_102709 ?auto_102708 ) ) ( ON ?auto_102705 ?auto_102704 ) ( ON-TABLE ?auto_102708 ) ( ON ?auto_102711 ?auto_102705 ) ( ON ?auto_102709 ?auto_102711 ) ( ON ?auto_102707 ?auto_102709 ) ( ON ?auto_102706 ?auto_102707 ) ( CLEAR ?auto_102706 ) ( HOLDING ?auto_102710 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_102710 )
      ( MAKE-2PILE ?auto_102704 ?auto_102705 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_102712 - BLOCK
      ?auto_102713 - BLOCK
    )
    :vars
    (
      ?auto_102719 - BLOCK
      ?auto_102714 - BLOCK
      ?auto_102716 - BLOCK
      ?auto_102718 - BLOCK
      ?auto_102715 - BLOCK
      ?auto_102717 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_102712 ?auto_102713 ) ) ( not ( = ?auto_102712 ?auto_102719 ) ) ( not ( = ?auto_102713 ?auto_102719 ) ) ( not ( = ?auto_102714 ?auto_102716 ) ) ( not ( = ?auto_102714 ?auto_102718 ) ) ( not ( = ?auto_102714 ?auto_102715 ) ) ( not ( = ?auto_102714 ?auto_102719 ) ) ( not ( = ?auto_102714 ?auto_102713 ) ) ( not ( = ?auto_102714 ?auto_102712 ) ) ( not ( = ?auto_102716 ?auto_102718 ) ) ( not ( = ?auto_102716 ?auto_102715 ) ) ( not ( = ?auto_102716 ?auto_102719 ) ) ( not ( = ?auto_102716 ?auto_102713 ) ) ( not ( = ?auto_102716 ?auto_102712 ) ) ( not ( = ?auto_102718 ?auto_102715 ) ) ( not ( = ?auto_102718 ?auto_102719 ) ) ( not ( = ?auto_102718 ?auto_102713 ) ) ( not ( = ?auto_102718 ?auto_102712 ) ) ( not ( = ?auto_102715 ?auto_102719 ) ) ( not ( = ?auto_102715 ?auto_102713 ) ) ( not ( = ?auto_102715 ?auto_102712 ) ) ( ON ?auto_102712 ?auto_102717 ) ( not ( = ?auto_102712 ?auto_102717 ) ) ( not ( = ?auto_102713 ?auto_102717 ) ) ( not ( = ?auto_102719 ?auto_102717 ) ) ( not ( = ?auto_102714 ?auto_102717 ) ) ( not ( = ?auto_102716 ?auto_102717 ) ) ( not ( = ?auto_102718 ?auto_102717 ) ) ( not ( = ?auto_102715 ?auto_102717 ) ) ( ON ?auto_102713 ?auto_102712 ) ( ON-TABLE ?auto_102717 ) ( ON ?auto_102719 ?auto_102713 ) ( ON ?auto_102715 ?auto_102719 ) ( ON ?auto_102718 ?auto_102715 ) ( ON ?auto_102716 ?auto_102718 ) ( ON ?auto_102714 ?auto_102716 ) ( CLEAR ?auto_102714 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_102717 ?auto_102712 ?auto_102713 ?auto_102719 ?auto_102715 ?auto_102718 ?auto_102716 )
      ( MAKE-2PILE ?auto_102712 ?auto_102713 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_102724 - BLOCK
      ?auto_102725 - BLOCK
      ?auto_102726 - BLOCK
      ?auto_102727 - BLOCK
    )
    :vars
    (
      ?auto_102728 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_102728 ?auto_102727 ) ( CLEAR ?auto_102728 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_102724 ) ( ON ?auto_102725 ?auto_102724 ) ( ON ?auto_102726 ?auto_102725 ) ( ON ?auto_102727 ?auto_102726 ) ( not ( = ?auto_102724 ?auto_102725 ) ) ( not ( = ?auto_102724 ?auto_102726 ) ) ( not ( = ?auto_102724 ?auto_102727 ) ) ( not ( = ?auto_102724 ?auto_102728 ) ) ( not ( = ?auto_102725 ?auto_102726 ) ) ( not ( = ?auto_102725 ?auto_102727 ) ) ( not ( = ?auto_102725 ?auto_102728 ) ) ( not ( = ?auto_102726 ?auto_102727 ) ) ( not ( = ?auto_102726 ?auto_102728 ) ) ( not ( = ?auto_102727 ?auto_102728 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_102728 ?auto_102727 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_102729 - BLOCK
      ?auto_102730 - BLOCK
      ?auto_102731 - BLOCK
      ?auto_102732 - BLOCK
    )
    :vars
    (
      ?auto_102733 - BLOCK
      ?auto_102734 - BLOCK
      ?auto_102735 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_102733 ?auto_102732 ) ( CLEAR ?auto_102733 ) ( ON-TABLE ?auto_102729 ) ( ON ?auto_102730 ?auto_102729 ) ( ON ?auto_102731 ?auto_102730 ) ( ON ?auto_102732 ?auto_102731 ) ( not ( = ?auto_102729 ?auto_102730 ) ) ( not ( = ?auto_102729 ?auto_102731 ) ) ( not ( = ?auto_102729 ?auto_102732 ) ) ( not ( = ?auto_102729 ?auto_102733 ) ) ( not ( = ?auto_102730 ?auto_102731 ) ) ( not ( = ?auto_102730 ?auto_102732 ) ) ( not ( = ?auto_102730 ?auto_102733 ) ) ( not ( = ?auto_102731 ?auto_102732 ) ) ( not ( = ?auto_102731 ?auto_102733 ) ) ( not ( = ?auto_102732 ?auto_102733 ) ) ( HOLDING ?auto_102734 ) ( CLEAR ?auto_102735 ) ( not ( = ?auto_102729 ?auto_102734 ) ) ( not ( = ?auto_102729 ?auto_102735 ) ) ( not ( = ?auto_102730 ?auto_102734 ) ) ( not ( = ?auto_102730 ?auto_102735 ) ) ( not ( = ?auto_102731 ?auto_102734 ) ) ( not ( = ?auto_102731 ?auto_102735 ) ) ( not ( = ?auto_102732 ?auto_102734 ) ) ( not ( = ?auto_102732 ?auto_102735 ) ) ( not ( = ?auto_102733 ?auto_102734 ) ) ( not ( = ?auto_102733 ?auto_102735 ) ) ( not ( = ?auto_102734 ?auto_102735 ) ) )
    :subtasks
    ( ( !STACK ?auto_102734 ?auto_102735 )
      ( MAKE-4PILE ?auto_102729 ?auto_102730 ?auto_102731 ?auto_102732 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_102736 - BLOCK
      ?auto_102737 - BLOCK
      ?auto_102738 - BLOCK
      ?auto_102739 - BLOCK
    )
    :vars
    (
      ?auto_102741 - BLOCK
      ?auto_102742 - BLOCK
      ?auto_102740 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_102741 ?auto_102739 ) ( ON-TABLE ?auto_102736 ) ( ON ?auto_102737 ?auto_102736 ) ( ON ?auto_102738 ?auto_102737 ) ( ON ?auto_102739 ?auto_102738 ) ( not ( = ?auto_102736 ?auto_102737 ) ) ( not ( = ?auto_102736 ?auto_102738 ) ) ( not ( = ?auto_102736 ?auto_102739 ) ) ( not ( = ?auto_102736 ?auto_102741 ) ) ( not ( = ?auto_102737 ?auto_102738 ) ) ( not ( = ?auto_102737 ?auto_102739 ) ) ( not ( = ?auto_102737 ?auto_102741 ) ) ( not ( = ?auto_102738 ?auto_102739 ) ) ( not ( = ?auto_102738 ?auto_102741 ) ) ( not ( = ?auto_102739 ?auto_102741 ) ) ( CLEAR ?auto_102742 ) ( not ( = ?auto_102736 ?auto_102740 ) ) ( not ( = ?auto_102736 ?auto_102742 ) ) ( not ( = ?auto_102737 ?auto_102740 ) ) ( not ( = ?auto_102737 ?auto_102742 ) ) ( not ( = ?auto_102738 ?auto_102740 ) ) ( not ( = ?auto_102738 ?auto_102742 ) ) ( not ( = ?auto_102739 ?auto_102740 ) ) ( not ( = ?auto_102739 ?auto_102742 ) ) ( not ( = ?auto_102741 ?auto_102740 ) ) ( not ( = ?auto_102741 ?auto_102742 ) ) ( not ( = ?auto_102740 ?auto_102742 ) ) ( ON ?auto_102740 ?auto_102741 ) ( CLEAR ?auto_102740 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_102736 ?auto_102737 ?auto_102738 ?auto_102739 ?auto_102741 )
      ( MAKE-4PILE ?auto_102736 ?auto_102737 ?auto_102738 ?auto_102739 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_102743 - BLOCK
      ?auto_102744 - BLOCK
      ?auto_102745 - BLOCK
      ?auto_102746 - BLOCK
    )
    :vars
    (
      ?auto_102749 - BLOCK
      ?auto_102747 - BLOCK
      ?auto_102748 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_102749 ?auto_102746 ) ( ON-TABLE ?auto_102743 ) ( ON ?auto_102744 ?auto_102743 ) ( ON ?auto_102745 ?auto_102744 ) ( ON ?auto_102746 ?auto_102745 ) ( not ( = ?auto_102743 ?auto_102744 ) ) ( not ( = ?auto_102743 ?auto_102745 ) ) ( not ( = ?auto_102743 ?auto_102746 ) ) ( not ( = ?auto_102743 ?auto_102749 ) ) ( not ( = ?auto_102744 ?auto_102745 ) ) ( not ( = ?auto_102744 ?auto_102746 ) ) ( not ( = ?auto_102744 ?auto_102749 ) ) ( not ( = ?auto_102745 ?auto_102746 ) ) ( not ( = ?auto_102745 ?auto_102749 ) ) ( not ( = ?auto_102746 ?auto_102749 ) ) ( not ( = ?auto_102743 ?auto_102747 ) ) ( not ( = ?auto_102743 ?auto_102748 ) ) ( not ( = ?auto_102744 ?auto_102747 ) ) ( not ( = ?auto_102744 ?auto_102748 ) ) ( not ( = ?auto_102745 ?auto_102747 ) ) ( not ( = ?auto_102745 ?auto_102748 ) ) ( not ( = ?auto_102746 ?auto_102747 ) ) ( not ( = ?auto_102746 ?auto_102748 ) ) ( not ( = ?auto_102749 ?auto_102747 ) ) ( not ( = ?auto_102749 ?auto_102748 ) ) ( not ( = ?auto_102747 ?auto_102748 ) ) ( ON ?auto_102747 ?auto_102749 ) ( CLEAR ?auto_102747 ) ( HOLDING ?auto_102748 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_102748 )
      ( MAKE-4PILE ?auto_102743 ?auto_102744 ?auto_102745 ?auto_102746 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_102750 - BLOCK
      ?auto_102751 - BLOCK
      ?auto_102752 - BLOCK
      ?auto_102753 - BLOCK
    )
    :vars
    (
      ?auto_102755 - BLOCK
      ?auto_102756 - BLOCK
      ?auto_102754 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_102755 ?auto_102753 ) ( ON-TABLE ?auto_102750 ) ( ON ?auto_102751 ?auto_102750 ) ( ON ?auto_102752 ?auto_102751 ) ( ON ?auto_102753 ?auto_102752 ) ( not ( = ?auto_102750 ?auto_102751 ) ) ( not ( = ?auto_102750 ?auto_102752 ) ) ( not ( = ?auto_102750 ?auto_102753 ) ) ( not ( = ?auto_102750 ?auto_102755 ) ) ( not ( = ?auto_102751 ?auto_102752 ) ) ( not ( = ?auto_102751 ?auto_102753 ) ) ( not ( = ?auto_102751 ?auto_102755 ) ) ( not ( = ?auto_102752 ?auto_102753 ) ) ( not ( = ?auto_102752 ?auto_102755 ) ) ( not ( = ?auto_102753 ?auto_102755 ) ) ( not ( = ?auto_102750 ?auto_102756 ) ) ( not ( = ?auto_102750 ?auto_102754 ) ) ( not ( = ?auto_102751 ?auto_102756 ) ) ( not ( = ?auto_102751 ?auto_102754 ) ) ( not ( = ?auto_102752 ?auto_102756 ) ) ( not ( = ?auto_102752 ?auto_102754 ) ) ( not ( = ?auto_102753 ?auto_102756 ) ) ( not ( = ?auto_102753 ?auto_102754 ) ) ( not ( = ?auto_102755 ?auto_102756 ) ) ( not ( = ?auto_102755 ?auto_102754 ) ) ( not ( = ?auto_102756 ?auto_102754 ) ) ( ON ?auto_102756 ?auto_102755 ) ( ON ?auto_102754 ?auto_102756 ) ( CLEAR ?auto_102754 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_102750 ?auto_102751 ?auto_102752 ?auto_102753 ?auto_102755 ?auto_102756 )
      ( MAKE-4PILE ?auto_102750 ?auto_102751 ?auto_102752 ?auto_102753 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_102757 - BLOCK
      ?auto_102758 - BLOCK
      ?auto_102759 - BLOCK
      ?auto_102760 - BLOCK
    )
    :vars
    (
      ?auto_102762 - BLOCK
      ?auto_102763 - BLOCK
      ?auto_102761 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_102762 ?auto_102760 ) ( ON-TABLE ?auto_102757 ) ( ON ?auto_102758 ?auto_102757 ) ( ON ?auto_102759 ?auto_102758 ) ( ON ?auto_102760 ?auto_102759 ) ( not ( = ?auto_102757 ?auto_102758 ) ) ( not ( = ?auto_102757 ?auto_102759 ) ) ( not ( = ?auto_102757 ?auto_102760 ) ) ( not ( = ?auto_102757 ?auto_102762 ) ) ( not ( = ?auto_102758 ?auto_102759 ) ) ( not ( = ?auto_102758 ?auto_102760 ) ) ( not ( = ?auto_102758 ?auto_102762 ) ) ( not ( = ?auto_102759 ?auto_102760 ) ) ( not ( = ?auto_102759 ?auto_102762 ) ) ( not ( = ?auto_102760 ?auto_102762 ) ) ( not ( = ?auto_102757 ?auto_102763 ) ) ( not ( = ?auto_102757 ?auto_102761 ) ) ( not ( = ?auto_102758 ?auto_102763 ) ) ( not ( = ?auto_102758 ?auto_102761 ) ) ( not ( = ?auto_102759 ?auto_102763 ) ) ( not ( = ?auto_102759 ?auto_102761 ) ) ( not ( = ?auto_102760 ?auto_102763 ) ) ( not ( = ?auto_102760 ?auto_102761 ) ) ( not ( = ?auto_102762 ?auto_102763 ) ) ( not ( = ?auto_102762 ?auto_102761 ) ) ( not ( = ?auto_102763 ?auto_102761 ) ) ( ON ?auto_102763 ?auto_102762 ) ( HOLDING ?auto_102761 ) ( CLEAR ?auto_102763 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_102757 ?auto_102758 ?auto_102759 ?auto_102760 ?auto_102762 ?auto_102763 ?auto_102761 )
      ( MAKE-4PILE ?auto_102757 ?auto_102758 ?auto_102759 ?auto_102760 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_102764 - BLOCK
      ?auto_102765 - BLOCK
      ?auto_102766 - BLOCK
      ?auto_102767 - BLOCK
    )
    :vars
    (
      ?auto_102768 - BLOCK
      ?auto_102770 - BLOCK
      ?auto_102769 - BLOCK
      ?auto_102771 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_102768 ?auto_102767 ) ( ON-TABLE ?auto_102764 ) ( ON ?auto_102765 ?auto_102764 ) ( ON ?auto_102766 ?auto_102765 ) ( ON ?auto_102767 ?auto_102766 ) ( not ( = ?auto_102764 ?auto_102765 ) ) ( not ( = ?auto_102764 ?auto_102766 ) ) ( not ( = ?auto_102764 ?auto_102767 ) ) ( not ( = ?auto_102764 ?auto_102768 ) ) ( not ( = ?auto_102765 ?auto_102766 ) ) ( not ( = ?auto_102765 ?auto_102767 ) ) ( not ( = ?auto_102765 ?auto_102768 ) ) ( not ( = ?auto_102766 ?auto_102767 ) ) ( not ( = ?auto_102766 ?auto_102768 ) ) ( not ( = ?auto_102767 ?auto_102768 ) ) ( not ( = ?auto_102764 ?auto_102770 ) ) ( not ( = ?auto_102764 ?auto_102769 ) ) ( not ( = ?auto_102765 ?auto_102770 ) ) ( not ( = ?auto_102765 ?auto_102769 ) ) ( not ( = ?auto_102766 ?auto_102770 ) ) ( not ( = ?auto_102766 ?auto_102769 ) ) ( not ( = ?auto_102767 ?auto_102770 ) ) ( not ( = ?auto_102767 ?auto_102769 ) ) ( not ( = ?auto_102768 ?auto_102770 ) ) ( not ( = ?auto_102768 ?auto_102769 ) ) ( not ( = ?auto_102770 ?auto_102769 ) ) ( ON ?auto_102770 ?auto_102768 ) ( CLEAR ?auto_102770 ) ( ON ?auto_102769 ?auto_102771 ) ( CLEAR ?auto_102769 ) ( HAND-EMPTY ) ( not ( = ?auto_102764 ?auto_102771 ) ) ( not ( = ?auto_102765 ?auto_102771 ) ) ( not ( = ?auto_102766 ?auto_102771 ) ) ( not ( = ?auto_102767 ?auto_102771 ) ) ( not ( = ?auto_102768 ?auto_102771 ) ) ( not ( = ?auto_102770 ?auto_102771 ) ) ( not ( = ?auto_102769 ?auto_102771 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_102769 ?auto_102771 )
      ( MAKE-4PILE ?auto_102764 ?auto_102765 ?auto_102766 ?auto_102767 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_102772 - BLOCK
      ?auto_102773 - BLOCK
      ?auto_102774 - BLOCK
      ?auto_102775 - BLOCK
    )
    :vars
    (
      ?auto_102778 - BLOCK
      ?auto_102779 - BLOCK
      ?auto_102777 - BLOCK
      ?auto_102776 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_102778 ?auto_102775 ) ( ON-TABLE ?auto_102772 ) ( ON ?auto_102773 ?auto_102772 ) ( ON ?auto_102774 ?auto_102773 ) ( ON ?auto_102775 ?auto_102774 ) ( not ( = ?auto_102772 ?auto_102773 ) ) ( not ( = ?auto_102772 ?auto_102774 ) ) ( not ( = ?auto_102772 ?auto_102775 ) ) ( not ( = ?auto_102772 ?auto_102778 ) ) ( not ( = ?auto_102773 ?auto_102774 ) ) ( not ( = ?auto_102773 ?auto_102775 ) ) ( not ( = ?auto_102773 ?auto_102778 ) ) ( not ( = ?auto_102774 ?auto_102775 ) ) ( not ( = ?auto_102774 ?auto_102778 ) ) ( not ( = ?auto_102775 ?auto_102778 ) ) ( not ( = ?auto_102772 ?auto_102779 ) ) ( not ( = ?auto_102772 ?auto_102777 ) ) ( not ( = ?auto_102773 ?auto_102779 ) ) ( not ( = ?auto_102773 ?auto_102777 ) ) ( not ( = ?auto_102774 ?auto_102779 ) ) ( not ( = ?auto_102774 ?auto_102777 ) ) ( not ( = ?auto_102775 ?auto_102779 ) ) ( not ( = ?auto_102775 ?auto_102777 ) ) ( not ( = ?auto_102778 ?auto_102779 ) ) ( not ( = ?auto_102778 ?auto_102777 ) ) ( not ( = ?auto_102779 ?auto_102777 ) ) ( ON ?auto_102777 ?auto_102776 ) ( CLEAR ?auto_102777 ) ( not ( = ?auto_102772 ?auto_102776 ) ) ( not ( = ?auto_102773 ?auto_102776 ) ) ( not ( = ?auto_102774 ?auto_102776 ) ) ( not ( = ?auto_102775 ?auto_102776 ) ) ( not ( = ?auto_102778 ?auto_102776 ) ) ( not ( = ?auto_102779 ?auto_102776 ) ) ( not ( = ?auto_102777 ?auto_102776 ) ) ( HOLDING ?auto_102779 ) ( CLEAR ?auto_102778 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_102772 ?auto_102773 ?auto_102774 ?auto_102775 ?auto_102778 ?auto_102779 )
      ( MAKE-4PILE ?auto_102772 ?auto_102773 ?auto_102774 ?auto_102775 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_102780 - BLOCK
      ?auto_102781 - BLOCK
      ?auto_102782 - BLOCK
      ?auto_102783 - BLOCK
    )
    :vars
    (
      ?auto_102786 - BLOCK
      ?auto_102784 - BLOCK
      ?auto_102787 - BLOCK
      ?auto_102785 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_102786 ?auto_102783 ) ( ON-TABLE ?auto_102780 ) ( ON ?auto_102781 ?auto_102780 ) ( ON ?auto_102782 ?auto_102781 ) ( ON ?auto_102783 ?auto_102782 ) ( not ( = ?auto_102780 ?auto_102781 ) ) ( not ( = ?auto_102780 ?auto_102782 ) ) ( not ( = ?auto_102780 ?auto_102783 ) ) ( not ( = ?auto_102780 ?auto_102786 ) ) ( not ( = ?auto_102781 ?auto_102782 ) ) ( not ( = ?auto_102781 ?auto_102783 ) ) ( not ( = ?auto_102781 ?auto_102786 ) ) ( not ( = ?auto_102782 ?auto_102783 ) ) ( not ( = ?auto_102782 ?auto_102786 ) ) ( not ( = ?auto_102783 ?auto_102786 ) ) ( not ( = ?auto_102780 ?auto_102784 ) ) ( not ( = ?auto_102780 ?auto_102787 ) ) ( not ( = ?auto_102781 ?auto_102784 ) ) ( not ( = ?auto_102781 ?auto_102787 ) ) ( not ( = ?auto_102782 ?auto_102784 ) ) ( not ( = ?auto_102782 ?auto_102787 ) ) ( not ( = ?auto_102783 ?auto_102784 ) ) ( not ( = ?auto_102783 ?auto_102787 ) ) ( not ( = ?auto_102786 ?auto_102784 ) ) ( not ( = ?auto_102786 ?auto_102787 ) ) ( not ( = ?auto_102784 ?auto_102787 ) ) ( ON ?auto_102787 ?auto_102785 ) ( not ( = ?auto_102780 ?auto_102785 ) ) ( not ( = ?auto_102781 ?auto_102785 ) ) ( not ( = ?auto_102782 ?auto_102785 ) ) ( not ( = ?auto_102783 ?auto_102785 ) ) ( not ( = ?auto_102786 ?auto_102785 ) ) ( not ( = ?auto_102784 ?auto_102785 ) ) ( not ( = ?auto_102787 ?auto_102785 ) ) ( CLEAR ?auto_102786 ) ( ON ?auto_102784 ?auto_102787 ) ( CLEAR ?auto_102784 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_102785 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_102785 ?auto_102787 )
      ( MAKE-4PILE ?auto_102780 ?auto_102781 ?auto_102782 ?auto_102783 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_102804 - BLOCK
      ?auto_102805 - BLOCK
      ?auto_102806 - BLOCK
      ?auto_102807 - BLOCK
    )
    :vars
    (
      ?auto_102810 - BLOCK
      ?auto_102811 - BLOCK
      ?auto_102808 - BLOCK
      ?auto_102809 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_102804 ) ( ON ?auto_102805 ?auto_102804 ) ( ON ?auto_102806 ?auto_102805 ) ( not ( = ?auto_102804 ?auto_102805 ) ) ( not ( = ?auto_102804 ?auto_102806 ) ) ( not ( = ?auto_102804 ?auto_102807 ) ) ( not ( = ?auto_102804 ?auto_102810 ) ) ( not ( = ?auto_102805 ?auto_102806 ) ) ( not ( = ?auto_102805 ?auto_102807 ) ) ( not ( = ?auto_102805 ?auto_102810 ) ) ( not ( = ?auto_102806 ?auto_102807 ) ) ( not ( = ?auto_102806 ?auto_102810 ) ) ( not ( = ?auto_102807 ?auto_102810 ) ) ( not ( = ?auto_102804 ?auto_102811 ) ) ( not ( = ?auto_102804 ?auto_102808 ) ) ( not ( = ?auto_102805 ?auto_102811 ) ) ( not ( = ?auto_102805 ?auto_102808 ) ) ( not ( = ?auto_102806 ?auto_102811 ) ) ( not ( = ?auto_102806 ?auto_102808 ) ) ( not ( = ?auto_102807 ?auto_102811 ) ) ( not ( = ?auto_102807 ?auto_102808 ) ) ( not ( = ?auto_102810 ?auto_102811 ) ) ( not ( = ?auto_102810 ?auto_102808 ) ) ( not ( = ?auto_102811 ?auto_102808 ) ) ( ON ?auto_102808 ?auto_102809 ) ( not ( = ?auto_102804 ?auto_102809 ) ) ( not ( = ?auto_102805 ?auto_102809 ) ) ( not ( = ?auto_102806 ?auto_102809 ) ) ( not ( = ?auto_102807 ?auto_102809 ) ) ( not ( = ?auto_102810 ?auto_102809 ) ) ( not ( = ?auto_102811 ?auto_102809 ) ) ( not ( = ?auto_102808 ?auto_102809 ) ) ( ON ?auto_102811 ?auto_102808 ) ( ON-TABLE ?auto_102809 ) ( ON ?auto_102810 ?auto_102811 ) ( CLEAR ?auto_102810 ) ( HOLDING ?auto_102807 ) ( CLEAR ?auto_102806 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_102804 ?auto_102805 ?auto_102806 ?auto_102807 ?auto_102810 )
      ( MAKE-4PILE ?auto_102804 ?auto_102805 ?auto_102806 ?auto_102807 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_102812 - BLOCK
      ?auto_102813 - BLOCK
      ?auto_102814 - BLOCK
      ?auto_102815 - BLOCK
    )
    :vars
    (
      ?auto_102818 - BLOCK
      ?auto_102817 - BLOCK
      ?auto_102819 - BLOCK
      ?auto_102816 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_102812 ) ( ON ?auto_102813 ?auto_102812 ) ( ON ?auto_102814 ?auto_102813 ) ( not ( = ?auto_102812 ?auto_102813 ) ) ( not ( = ?auto_102812 ?auto_102814 ) ) ( not ( = ?auto_102812 ?auto_102815 ) ) ( not ( = ?auto_102812 ?auto_102818 ) ) ( not ( = ?auto_102813 ?auto_102814 ) ) ( not ( = ?auto_102813 ?auto_102815 ) ) ( not ( = ?auto_102813 ?auto_102818 ) ) ( not ( = ?auto_102814 ?auto_102815 ) ) ( not ( = ?auto_102814 ?auto_102818 ) ) ( not ( = ?auto_102815 ?auto_102818 ) ) ( not ( = ?auto_102812 ?auto_102817 ) ) ( not ( = ?auto_102812 ?auto_102819 ) ) ( not ( = ?auto_102813 ?auto_102817 ) ) ( not ( = ?auto_102813 ?auto_102819 ) ) ( not ( = ?auto_102814 ?auto_102817 ) ) ( not ( = ?auto_102814 ?auto_102819 ) ) ( not ( = ?auto_102815 ?auto_102817 ) ) ( not ( = ?auto_102815 ?auto_102819 ) ) ( not ( = ?auto_102818 ?auto_102817 ) ) ( not ( = ?auto_102818 ?auto_102819 ) ) ( not ( = ?auto_102817 ?auto_102819 ) ) ( ON ?auto_102819 ?auto_102816 ) ( not ( = ?auto_102812 ?auto_102816 ) ) ( not ( = ?auto_102813 ?auto_102816 ) ) ( not ( = ?auto_102814 ?auto_102816 ) ) ( not ( = ?auto_102815 ?auto_102816 ) ) ( not ( = ?auto_102818 ?auto_102816 ) ) ( not ( = ?auto_102817 ?auto_102816 ) ) ( not ( = ?auto_102819 ?auto_102816 ) ) ( ON ?auto_102817 ?auto_102819 ) ( ON-TABLE ?auto_102816 ) ( ON ?auto_102818 ?auto_102817 ) ( CLEAR ?auto_102814 ) ( ON ?auto_102815 ?auto_102818 ) ( CLEAR ?auto_102815 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_102816 ?auto_102819 ?auto_102817 ?auto_102818 )
      ( MAKE-4PILE ?auto_102812 ?auto_102813 ?auto_102814 ?auto_102815 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_102820 - BLOCK
      ?auto_102821 - BLOCK
      ?auto_102822 - BLOCK
      ?auto_102823 - BLOCK
    )
    :vars
    (
      ?auto_102827 - BLOCK
      ?auto_102826 - BLOCK
      ?auto_102824 - BLOCK
      ?auto_102825 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_102820 ) ( ON ?auto_102821 ?auto_102820 ) ( not ( = ?auto_102820 ?auto_102821 ) ) ( not ( = ?auto_102820 ?auto_102822 ) ) ( not ( = ?auto_102820 ?auto_102823 ) ) ( not ( = ?auto_102820 ?auto_102827 ) ) ( not ( = ?auto_102821 ?auto_102822 ) ) ( not ( = ?auto_102821 ?auto_102823 ) ) ( not ( = ?auto_102821 ?auto_102827 ) ) ( not ( = ?auto_102822 ?auto_102823 ) ) ( not ( = ?auto_102822 ?auto_102827 ) ) ( not ( = ?auto_102823 ?auto_102827 ) ) ( not ( = ?auto_102820 ?auto_102826 ) ) ( not ( = ?auto_102820 ?auto_102824 ) ) ( not ( = ?auto_102821 ?auto_102826 ) ) ( not ( = ?auto_102821 ?auto_102824 ) ) ( not ( = ?auto_102822 ?auto_102826 ) ) ( not ( = ?auto_102822 ?auto_102824 ) ) ( not ( = ?auto_102823 ?auto_102826 ) ) ( not ( = ?auto_102823 ?auto_102824 ) ) ( not ( = ?auto_102827 ?auto_102826 ) ) ( not ( = ?auto_102827 ?auto_102824 ) ) ( not ( = ?auto_102826 ?auto_102824 ) ) ( ON ?auto_102824 ?auto_102825 ) ( not ( = ?auto_102820 ?auto_102825 ) ) ( not ( = ?auto_102821 ?auto_102825 ) ) ( not ( = ?auto_102822 ?auto_102825 ) ) ( not ( = ?auto_102823 ?auto_102825 ) ) ( not ( = ?auto_102827 ?auto_102825 ) ) ( not ( = ?auto_102826 ?auto_102825 ) ) ( not ( = ?auto_102824 ?auto_102825 ) ) ( ON ?auto_102826 ?auto_102824 ) ( ON-TABLE ?auto_102825 ) ( ON ?auto_102827 ?auto_102826 ) ( ON ?auto_102823 ?auto_102827 ) ( CLEAR ?auto_102823 ) ( HOLDING ?auto_102822 ) ( CLEAR ?auto_102821 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_102820 ?auto_102821 ?auto_102822 )
      ( MAKE-4PILE ?auto_102820 ?auto_102821 ?auto_102822 ?auto_102823 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_102828 - BLOCK
      ?auto_102829 - BLOCK
      ?auto_102830 - BLOCK
      ?auto_102831 - BLOCK
    )
    :vars
    (
      ?auto_102833 - BLOCK
      ?auto_102834 - BLOCK
      ?auto_102835 - BLOCK
      ?auto_102832 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_102828 ) ( ON ?auto_102829 ?auto_102828 ) ( not ( = ?auto_102828 ?auto_102829 ) ) ( not ( = ?auto_102828 ?auto_102830 ) ) ( not ( = ?auto_102828 ?auto_102831 ) ) ( not ( = ?auto_102828 ?auto_102833 ) ) ( not ( = ?auto_102829 ?auto_102830 ) ) ( not ( = ?auto_102829 ?auto_102831 ) ) ( not ( = ?auto_102829 ?auto_102833 ) ) ( not ( = ?auto_102830 ?auto_102831 ) ) ( not ( = ?auto_102830 ?auto_102833 ) ) ( not ( = ?auto_102831 ?auto_102833 ) ) ( not ( = ?auto_102828 ?auto_102834 ) ) ( not ( = ?auto_102828 ?auto_102835 ) ) ( not ( = ?auto_102829 ?auto_102834 ) ) ( not ( = ?auto_102829 ?auto_102835 ) ) ( not ( = ?auto_102830 ?auto_102834 ) ) ( not ( = ?auto_102830 ?auto_102835 ) ) ( not ( = ?auto_102831 ?auto_102834 ) ) ( not ( = ?auto_102831 ?auto_102835 ) ) ( not ( = ?auto_102833 ?auto_102834 ) ) ( not ( = ?auto_102833 ?auto_102835 ) ) ( not ( = ?auto_102834 ?auto_102835 ) ) ( ON ?auto_102835 ?auto_102832 ) ( not ( = ?auto_102828 ?auto_102832 ) ) ( not ( = ?auto_102829 ?auto_102832 ) ) ( not ( = ?auto_102830 ?auto_102832 ) ) ( not ( = ?auto_102831 ?auto_102832 ) ) ( not ( = ?auto_102833 ?auto_102832 ) ) ( not ( = ?auto_102834 ?auto_102832 ) ) ( not ( = ?auto_102835 ?auto_102832 ) ) ( ON ?auto_102834 ?auto_102835 ) ( ON-TABLE ?auto_102832 ) ( ON ?auto_102833 ?auto_102834 ) ( ON ?auto_102831 ?auto_102833 ) ( CLEAR ?auto_102829 ) ( ON ?auto_102830 ?auto_102831 ) ( CLEAR ?auto_102830 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_102832 ?auto_102835 ?auto_102834 ?auto_102833 ?auto_102831 )
      ( MAKE-4PILE ?auto_102828 ?auto_102829 ?auto_102830 ?auto_102831 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_102836 - BLOCK
      ?auto_102837 - BLOCK
      ?auto_102838 - BLOCK
      ?auto_102839 - BLOCK
    )
    :vars
    (
      ?auto_102842 - BLOCK
      ?auto_102841 - BLOCK
      ?auto_102840 - BLOCK
      ?auto_102843 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_102836 ) ( not ( = ?auto_102836 ?auto_102837 ) ) ( not ( = ?auto_102836 ?auto_102838 ) ) ( not ( = ?auto_102836 ?auto_102839 ) ) ( not ( = ?auto_102836 ?auto_102842 ) ) ( not ( = ?auto_102837 ?auto_102838 ) ) ( not ( = ?auto_102837 ?auto_102839 ) ) ( not ( = ?auto_102837 ?auto_102842 ) ) ( not ( = ?auto_102838 ?auto_102839 ) ) ( not ( = ?auto_102838 ?auto_102842 ) ) ( not ( = ?auto_102839 ?auto_102842 ) ) ( not ( = ?auto_102836 ?auto_102841 ) ) ( not ( = ?auto_102836 ?auto_102840 ) ) ( not ( = ?auto_102837 ?auto_102841 ) ) ( not ( = ?auto_102837 ?auto_102840 ) ) ( not ( = ?auto_102838 ?auto_102841 ) ) ( not ( = ?auto_102838 ?auto_102840 ) ) ( not ( = ?auto_102839 ?auto_102841 ) ) ( not ( = ?auto_102839 ?auto_102840 ) ) ( not ( = ?auto_102842 ?auto_102841 ) ) ( not ( = ?auto_102842 ?auto_102840 ) ) ( not ( = ?auto_102841 ?auto_102840 ) ) ( ON ?auto_102840 ?auto_102843 ) ( not ( = ?auto_102836 ?auto_102843 ) ) ( not ( = ?auto_102837 ?auto_102843 ) ) ( not ( = ?auto_102838 ?auto_102843 ) ) ( not ( = ?auto_102839 ?auto_102843 ) ) ( not ( = ?auto_102842 ?auto_102843 ) ) ( not ( = ?auto_102841 ?auto_102843 ) ) ( not ( = ?auto_102840 ?auto_102843 ) ) ( ON ?auto_102841 ?auto_102840 ) ( ON-TABLE ?auto_102843 ) ( ON ?auto_102842 ?auto_102841 ) ( ON ?auto_102839 ?auto_102842 ) ( ON ?auto_102838 ?auto_102839 ) ( CLEAR ?auto_102838 ) ( HOLDING ?auto_102837 ) ( CLEAR ?auto_102836 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_102836 ?auto_102837 )
      ( MAKE-4PILE ?auto_102836 ?auto_102837 ?auto_102838 ?auto_102839 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_102844 - BLOCK
      ?auto_102845 - BLOCK
      ?auto_102846 - BLOCK
      ?auto_102847 - BLOCK
    )
    :vars
    (
      ?auto_102850 - BLOCK
      ?auto_102851 - BLOCK
      ?auto_102849 - BLOCK
      ?auto_102848 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_102844 ) ( not ( = ?auto_102844 ?auto_102845 ) ) ( not ( = ?auto_102844 ?auto_102846 ) ) ( not ( = ?auto_102844 ?auto_102847 ) ) ( not ( = ?auto_102844 ?auto_102850 ) ) ( not ( = ?auto_102845 ?auto_102846 ) ) ( not ( = ?auto_102845 ?auto_102847 ) ) ( not ( = ?auto_102845 ?auto_102850 ) ) ( not ( = ?auto_102846 ?auto_102847 ) ) ( not ( = ?auto_102846 ?auto_102850 ) ) ( not ( = ?auto_102847 ?auto_102850 ) ) ( not ( = ?auto_102844 ?auto_102851 ) ) ( not ( = ?auto_102844 ?auto_102849 ) ) ( not ( = ?auto_102845 ?auto_102851 ) ) ( not ( = ?auto_102845 ?auto_102849 ) ) ( not ( = ?auto_102846 ?auto_102851 ) ) ( not ( = ?auto_102846 ?auto_102849 ) ) ( not ( = ?auto_102847 ?auto_102851 ) ) ( not ( = ?auto_102847 ?auto_102849 ) ) ( not ( = ?auto_102850 ?auto_102851 ) ) ( not ( = ?auto_102850 ?auto_102849 ) ) ( not ( = ?auto_102851 ?auto_102849 ) ) ( ON ?auto_102849 ?auto_102848 ) ( not ( = ?auto_102844 ?auto_102848 ) ) ( not ( = ?auto_102845 ?auto_102848 ) ) ( not ( = ?auto_102846 ?auto_102848 ) ) ( not ( = ?auto_102847 ?auto_102848 ) ) ( not ( = ?auto_102850 ?auto_102848 ) ) ( not ( = ?auto_102851 ?auto_102848 ) ) ( not ( = ?auto_102849 ?auto_102848 ) ) ( ON ?auto_102851 ?auto_102849 ) ( ON-TABLE ?auto_102848 ) ( ON ?auto_102850 ?auto_102851 ) ( ON ?auto_102847 ?auto_102850 ) ( ON ?auto_102846 ?auto_102847 ) ( CLEAR ?auto_102844 ) ( ON ?auto_102845 ?auto_102846 ) ( CLEAR ?auto_102845 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_102848 ?auto_102849 ?auto_102851 ?auto_102850 ?auto_102847 ?auto_102846 )
      ( MAKE-4PILE ?auto_102844 ?auto_102845 ?auto_102846 ?auto_102847 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_102852 - BLOCK
      ?auto_102853 - BLOCK
      ?auto_102854 - BLOCK
      ?auto_102855 - BLOCK
    )
    :vars
    (
      ?auto_102856 - BLOCK
      ?auto_102859 - BLOCK
      ?auto_102858 - BLOCK
      ?auto_102857 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_102852 ?auto_102853 ) ) ( not ( = ?auto_102852 ?auto_102854 ) ) ( not ( = ?auto_102852 ?auto_102855 ) ) ( not ( = ?auto_102852 ?auto_102856 ) ) ( not ( = ?auto_102853 ?auto_102854 ) ) ( not ( = ?auto_102853 ?auto_102855 ) ) ( not ( = ?auto_102853 ?auto_102856 ) ) ( not ( = ?auto_102854 ?auto_102855 ) ) ( not ( = ?auto_102854 ?auto_102856 ) ) ( not ( = ?auto_102855 ?auto_102856 ) ) ( not ( = ?auto_102852 ?auto_102859 ) ) ( not ( = ?auto_102852 ?auto_102858 ) ) ( not ( = ?auto_102853 ?auto_102859 ) ) ( not ( = ?auto_102853 ?auto_102858 ) ) ( not ( = ?auto_102854 ?auto_102859 ) ) ( not ( = ?auto_102854 ?auto_102858 ) ) ( not ( = ?auto_102855 ?auto_102859 ) ) ( not ( = ?auto_102855 ?auto_102858 ) ) ( not ( = ?auto_102856 ?auto_102859 ) ) ( not ( = ?auto_102856 ?auto_102858 ) ) ( not ( = ?auto_102859 ?auto_102858 ) ) ( ON ?auto_102858 ?auto_102857 ) ( not ( = ?auto_102852 ?auto_102857 ) ) ( not ( = ?auto_102853 ?auto_102857 ) ) ( not ( = ?auto_102854 ?auto_102857 ) ) ( not ( = ?auto_102855 ?auto_102857 ) ) ( not ( = ?auto_102856 ?auto_102857 ) ) ( not ( = ?auto_102859 ?auto_102857 ) ) ( not ( = ?auto_102858 ?auto_102857 ) ) ( ON ?auto_102859 ?auto_102858 ) ( ON-TABLE ?auto_102857 ) ( ON ?auto_102856 ?auto_102859 ) ( ON ?auto_102855 ?auto_102856 ) ( ON ?auto_102854 ?auto_102855 ) ( ON ?auto_102853 ?auto_102854 ) ( CLEAR ?auto_102853 ) ( HOLDING ?auto_102852 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_102852 )
      ( MAKE-4PILE ?auto_102852 ?auto_102853 ?auto_102854 ?auto_102855 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_102860 - BLOCK
      ?auto_102861 - BLOCK
      ?auto_102862 - BLOCK
      ?auto_102863 - BLOCK
    )
    :vars
    (
      ?auto_102864 - BLOCK
      ?auto_102867 - BLOCK
      ?auto_102865 - BLOCK
      ?auto_102866 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_102860 ?auto_102861 ) ) ( not ( = ?auto_102860 ?auto_102862 ) ) ( not ( = ?auto_102860 ?auto_102863 ) ) ( not ( = ?auto_102860 ?auto_102864 ) ) ( not ( = ?auto_102861 ?auto_102862 ) ) ( not ( = ?auto_102861 ?auto_102863 ) ) ( not ( = ?auto_102861 ?auto_102864 ) ) ( not ( = ?auto_102862 ?auto_102863 ) ) ( not ( = ?auto_102862 ?auto_102864 ) ) ( not ( = ?auto_102863 ?auto_102864 ) ) ( not ( = ?auto_102860 ?auto_102867 ) ) ( not ( = ?auto_102860 ?auto_102865 ) ) ( not ( = ?auto_102861 ?auto_102867 ) ) ( not ( = ?auto_102861 ?auto_102865 ) ) ( not ( = ?auto_102862 ?auto_102867 ) ) ( not ( = ?auto_102862 ?auto_102865 ) ) ( not ( = ?auto_102863 ?auto_102867 ) ) ( not ( = ?auto_102863 ?auto_102865 ) ) ( not ( = ?auto_102864 ?auto_102867 ) ) ( not ( = ?auto_102864 ?auto_102865 ) ) ( not ( = ?auto_102867 ?auto_102865 ) ) ( ON ?auto_102865 ?auto_102866 ) ( not ( = ?auto_102860 ?auto_102866 ) ) ( not ( = ?auto_102861 ?auto_102866 ) ) ( not ( = ?auto_102862 ?auto_102866 ) ) ( not ( = ?auto_102863 ?auto_102866 ) ) ( not ( = ?auto_102864 ?auto_102866 ) ) ( not ( = ?auto_102867 ?auto_102866 ) ) ( not ( = ?auto_102865 ?auto_102866 ) ) ( ON ?auto_102867 ?auto_102865 ) ( ON-TABLE ?auto_102866 ) ( ON ?auto_102864 ?auto_102867 ) ( ON ?auto_102863 ?auto_102864 ) ( ON ?auto_102862 ?auto_102863 ) ( ON ?auto_102861 ?auto_102862 ) ( ON ?auto_102860 ?auto_102861 ) ( CLEAR ?auto_102860 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_102866 ?auto_102865 ?auto_102867 ?auto_102864 ?auto_102863 ?auto_102862 ?auto_102861 )
      ( MAKE-4PILE ?auto_102860 ?auto_102861 ?auto_102862 ?auto_102863 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_102871 - BLOCK
      ?auto_102872 - BLOCK
      ?auto_102873 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_102873 ) ( CLEAR ?auto_102872 ) ( ON-TABLE ?auto_102871 ) ( ON ?auto_102872 ?auto_102871 ) ( not ( = ?auto_102871 ?auto_102872 ) ) ( not ( = ?auto_102871 ?auto_102873 ) ) ( not ( = ?auto_102872 ?auto_102873 ) ) )
    :subtasks
    ( ( !STACK ?auto_102873 ?auto_102872 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_102874 - BLOCK
      ?auto_102875 - BLOCK
      ?auto_102876 - BLOCK
    )
    :vars
    (
      ?auto_102877 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_102875 ) ( ON-TABLE ?auto_102874 ) ( ON ?auto_102875 ?auto_102874 ) ( not ( = ?auto_102874 ?auto_102875 ) ) ( not ( = ?auto_102874 ?auto_102876 ) ) ( not ( = ?auto_102875 ?auto_102876 ) ) ( ON ?auto_102876 ?auto_102877 ) ( CLEAR ?auto_102876 ) ( HAND-EMPTY ) ( not ( = ?auto_102874 ?auto_102877 ) ) ( not ( = ?auto_102875 ?auto_102877 ) ) ( not ( = ?auto_102876 ?auto_102877 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_102876 ?auto_102877 )
      ( MAKE-3PILE ?auto_102874 ?auto_102875 ?auto_102876 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_102878 - BLOCK
      ?auto_102879 - BLOCK
      ?auto_102880 - BLOCK
    )
    :vars
    (
      ?auto_102881 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_102878 ) ( not ( = ?auto_102878 ?auto_102879 ) ) ( not ( = ?auto_102878 ?auto_102880 ) ) ( not ( = ?auto_102879 ?auto_102880 ) ) ( ON ?auto_102880 ?auto_102881 ) ( CLEAR ?auto_102880 ) ( not ( = ?auto_102878 ?auto_102881 ) ) ( not ( = ?auto_102879 ?auto_102881 ) ) ( not ( = ?auto_102880 ?auto_102881 ) ) ( HOLDING ?auto_102879 ) ( CLEAR ?auto_102878 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_102878 ?auto_102879 )
      ( MAKE-3PILE ?auto_102878 ?auto_102879 ?auto_102880 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_102882 - BLOCK
      ?auto_102883 - BLOCK
      ?auto_102884 - BLOCK
    )
    :vars
    (
      ?auto_102885 - BLOCK
      ?auto_102888 - BLOCK
      ?auto_102887 - BLOCK
      ?auto_102886 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_102882 ) ( not ( = ?auto_102882 ?auto_102883 ) ) ( not ( = ?auto_102882 ?auto_102884 ) ) ( not ( = ?auto_102883 ?auto_102884 ) ) ( ON ?auto_102884 ?auto_102885 ) ( not ( = ?auto_102882 ?auto_102885 ) ) ( not ( = ?auto_102883 ?auto_102885 ) ) ( not ( = ?auto_102884 ?auto_102885 ) ) ( CLEAR ?auto_102882 ) ( ON ?auto_102883 ?auto_102884 ) ( CLEAR ?auto_102883 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_102888 ) ( ON ?auto_102887 ?auto_102888 ) ( ON ?auto_102886 ?auto_102887 ) ( ON ?auto_102885 ?auto_102886 ) ( not ( = ?auto_102888 ?auto_102887 ) ) ( not ( = ?auto_102888 ?auto_102886 ) ) ( not ( = ?auto_102888 ?auto_102885 ) ) ( not ( = ?auto_102888 ?auto_102884 ) ) ( not ( = ?auto_102888 ?auto_102883 ) ) ( not ( = ?auto_102887 ?auto_102886 ) ) ( not ( = ?auto_102887 ?auto_102885 ) ) ( not ( = ?auto_102887 ?auto_102884 ) ) ( not ( = ?auto_102887 ?auto_102883 ) ) ( not ( = ?auto_102886 ?auto_102885 ) ) ( not ( = ?auto_102886 ?auto_102884 ) ) ( not ( = ?auto_102886 ?auto_102883 ) ) ( not ( = ?auto_102882 ?auto_102888 ) ) ( not ( = ?auto_102882 ?auto_102887 ) ) ( not ( = ?auto_102882 ?auto_102886 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_102888 ?auto_102887 ?auto_102886 ?auto_102885 ?auto_102884 )
      ( MAKE-3PILE ?auto_102882 ?auto_102883 ?auto_102884 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_102889 - BLOCK
      ?auto_102890 - BLOCK
      ?auto_102891 - BLOCK
    )
    :vars
    (
      ?auto_102893 - BLOCK
      ?auto_102892 - BLOCK
      ?auto_102895 - BLOCK
      ?auto_102894 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_102889 ?auto_102890 ) ) ( not ( = ?auto_102889 ?auto_102891 ) ) ( not ( = ?auto_102890 ?auto_102891 ) ) ( ON ?auto_102891 ?auto_102893 ) ( not ( = ?auto_102889 ?auto_102893 ) ) ( not ( = ?auto_102890 ?auto_102893 ) ) ( not ( = ?auto_102891 ?auto_102893 ) ) ( ON ?auto_102890 ?auto_102891 ) ( CLEAR ?auto_102890 ) ( ON-TABLE ?auto_102892 ) ( ON ?auto_102895 ?auto_102892 ) ( ON ?auto_102894 ?auto_102895 ) ( ON ?auto_102893 ?auto_102894 ) ( not ( = ?auto_102892 ?auto_102895 ) ) ( not ( = ?auto_102892 ?auto_102894 ) ) ( not ( = ?auto_102892 ?auto_102893 ) ) ( not ( = ?auto_102892 ?auto_102891 ) ) ( not ( = ?auto_102892 ?auto_102890 ) ) ( not ( = ?auto_102895 ?auto_102894 ) ) ( not ( = ?auto_102895 ?auto_102893 ) ) ( not ( = ?auto_102895 ?auto_102891 ) ) ( not ( = ?auto_102895 ?auto_102890 ) ) ( not ( = ?auto_102894 ?auto_102893 ) ) ( not ( = ?auto_102894 ?auto_102891 ) ) ( not ( = ?auto_102894 ?auto_102890 ) ) ( not ( = ?auto_102889 ?auto_102892 ) ) ( not ( = ?auto_102889 ?auto_102895 ) ) ( not ( = ?auto_102889 ?auto_102894 ) ) ( HOLDING ?auto_102889 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_102889 )
      ( MAKE-3PILE ?auto_102889 ?auto_102890 ?auto_102891 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_102896 - BLOCK
      ?auto_102897 - BLOCK
      ?auto_102898 - BLOCK
    )
    :vars
    (
      ?auto_102901 - BLOCK
      ?auto_102902 - BLOCK
      ?auto_102899 - BLOCK
      ?auto_102900 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_102896 ?auto_102897 ) ) ( not ( = ?auto_102896 ?auto_102898 ) ) ( not ( = ?auto_102897 ?auto_102898 ) ) ( ON ?auto_102898 ?auto_102901 ) ( not ( = ?auto_102896 ?auto_102901 ) ) ( not ( = ?auto_102897 ?auto_102901 ) ) ( not ( = ?auto_102898 ?auto_102901 ) ) ( ON ?auto_102897 ?auto_102898 ) ( ON-TABLE ?auto_102902 ) ( ON ?auto_102899 ?auto_102902 ) ( ON ?auto_102900 ?auto_102899 ) ( ON ?auto_102901 ?auto_102900 ) ( not ( = ?auto_102902 ?auto_102899 ) ) ( not ( = ?auto_102902 ?auto_102900 ) ) ( not ( = ?auto_102902 ?auto_102901 ) ) ( not ( = ?auto_102902 ?auto_102898 ) ) ( not ( = ?auto_102902 ?auto_102897 ) ) ( not ( = ?auto_102899 ?auto_102900 ) ) ( not ( = ?auto_102899 ?auto_102901 ) ) ( not ( = ?auto_102899 ?auto_102898 ) ) ( not ( = ?auto_102899 ?auto_102897 ) ) ( not ( = ?auto_102900 ?auto_102901 ) ) ( not ( = ?auto_102900 ?auto_102898 ) ) ( not ( = ?auto_102900 ?auto_102897 ) ) ( not ( = ?auto_102896 ?auto_102902 ) ) ( not ( = ?auto_102896 ?auto_102899 ) ) ( not ( = ?auto_102896 ?auto_102900 ) ) ( ON ?auto_102896 ?auto_102897 ) ( CLEAR ?auto_102896 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_102902 ?auto_102899 ?auto_102900 ?auto_102901 ?auto_102898 ?auto_102897 )
      ( MAKE-3PILE ?auto_102896 ?auto_102897 ?auto_102898 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_102903 - BLOCK
      ?auto_102904 - BLOCK
      ?auto_102905 - BLOCK
    )
    :vars
    (
      ?auto_102907 - BLOCK
      ?auto_102906 - BLOCK
      ?auto_102908 - BLOCK
      ?auto_102909 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_102903 ?auto_102904 ) ) ( not ( = ?auto_102903 ?auto_102905 ) ) ( not ( = ?auto_102904 ?auto_102905 ) ) ( ON ?auto_102905 ?auto_102907 ) ( not ( = ?auto_102903 ?auto_102907 ) ) ( not ( = ?auto_102904 ?auto_102907 ) ) ( not ( = ?auto_102905 ?auto_102907 ) ) ( ON ?auto_102904 ?auto_102905 ) ( ON-TABLE ?auto_102906 ) ( ON ?auto_102908 ?auto_102906 ) ( ON ?auto_102909 ?auto_102908 ) ( ON ?auto_102907 ?auto_102909 ) ( not ( = ?auto_102906 ?auto_102908 ) ) ( not ( = ?auto_102906 ?auto_102909 ) ) ( not ( = ?auto_102906 ?auto_102907 ) ) ( not ( = ?auto_102906 ?auto_102905 ) ) ( not ( = ?auto_102906 ?auto_102904 ) ) ( not ( = ?auto_102908 ?auto_102909 ) ) ( not ( = ?auto_102908 ?auto_102907 ) ) ( not ( = ?auto_102908 ?auto_102905 ) ) ( not ( = ?auto_102908 ?auto_102904 ) ) ( not ( = ?auto_102909 ?auto_102907 ) ) ( not ( = ?auto_102909 ?auto_102905 ) ) ( not ( = ?auto_102909 ?auto_102904 ) ) ( not ( = ?auto_102903 ?auto_102906 ) ) ( not ( = ?auto_102903 ?auto_102908 ) ) ( not ( = ?auto_102903 ?auto_102909 ) ) ( HOLDING ?auto_102903 ) ( CLEAR ?auto_102904 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_102906 ?auto_102908 ?auto_102909 ?auto_102907 ?auto_102905 ?auto_102904 ?auto_102903 )
      ( MAKE-3PILE ?auto_102903 ?auto_102904 ?auto_102905 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_102910 - BLOCK
      ?auto_102911 - BLOCK
      ?auto_102912 - BLOCK
    )
    :vars
    (
      ?auto_102915 - BLOCK
      ?auto_102914 - BLOCK
      ?auto_102916 - BLOCK
      ?auto_102913 - BLOCK
      ?auto_102917 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_102910 ?auto_102911 ) ) ( not ( = ?auto_102910 ?auto_102912 ) ) ( not ( = ?auto_102911 ?auto_102912 ) ) ( ON ?auto_102912 ?auto_102915 ) ( not ( = ?auto_102910 ?auto_102915 ) ) ( not ( = ?auto_102911 ?auto_102915 ) ) ( not ( = ?auto_102912 ?auto_102915 ) ) ( ON ?auto_102911 ?auto_102912 ) ( ON-TABLE ?auto_102914 ) ( ON ?auto_102916 ?auto_102914 ) ( ON ?auto_102913 ?auto_102916 ) ( ON ?auto_102915 ?auto_102913 ) ( not ( = ?auto_102914 ?auto_102916 ) ) ( not ( = ?auto_102914 ?auto_102913 ) ) ( not ( = ?auto_102914 ?auto_102915 ) ) ( not ( = ?auto_102914 ?auto_102912 ) ) ( not ( = ?auto_102914 ?auto_102911 ) ) ( not ( = ?auto_102916 ?auto_102913 ) ) ( not ( = ?auto_102916 ?auto_102915 ) ) ( not ( = ?auto_102916 ?auto_102912 ) ) ( not ( = ?auto_102916 ?auto_102911 ) ) ( not ( = ?auto_102913 ?auto_102915 ) ) ( not ( = ?auto_102913 ?auto_102912 ) ) ( not ( = ?auto_102913 ?auto_102911 ) ) ( not ( = ?auto_102910 ?auto_102914 ) ) ( not ( = ?auto_102910 ?auto_102916 ) ) ( not ( = ?auto_102910 ?auto_102913 ) ) ( CLEAR ?auto_102911 ) ( ON ?auto_102910 ?auto_102917 ) ( CLEAR ?auto_102910 ) ( HAND-EMPTY ) ( not ( = ?auto_102910 ?auto_102917 ) ) ( not ( = ?auto_102911 ?auto_102917 ) ) ( not ( = ?auto_102912 ?auto_102917 ) ) ( not ( = ?auto_102915 ?auto_102917 ) ) ( not ( = ?auto_102914 ?auto_102917 ) ) ( not ( = ?auto_102916 ?auto_102917 ) ) ( not ( = ?auto_102913 ?auto_102917 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_102910 ?auto_102917 )
      ( MAKE-3PILE ?auto_102910 ?auto_102911 ?auto_102912 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_102918 - BLOCK
      ?auto_102919 - BLOCK
      ?auto_102920 - BLOCK
    )
    :vars
    (
      ?auto_102922 - BLOCK
      ?auto_102923 - BLOCK
      ?auto_102924 - BLOCK
      ?auto_102925 - BLOCK
      ?auto_102921 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_102918 ?auto_102919 ) ) ( not ( = ?auto_102918 ?auto_102920 ) ) ( not ( = ?auto_102919 ?auto_102920 ) ) ( ON ?auto_102920 ?auto_102922 ) ( not ( = ?auto_102918 ?auto_102922 ) ) ( not ( = ?auto_102919 ?auto_102922 ) ) ( not ( = ?auto_102920 ?auto_102922 ) ) ( ON-TABLE ?auto_102923 ) ( ON ?auto_102924 ?auto_102923 ) ( ON ?auto_102925 ?auto_102924 ) ( ON ?auto_102922 ?auto_102925 ) ( not ( = ?auto_102923 ?auto_102924 ) ) ( not ( = ?auto_102923 ?auto_102925 ) ) ( not ( = ?auto_102923 ?auto_102922 ) ) ( not ( = ?auto_102923 ?auto_102920 ) ) ( not ( = ?auto_102923 ?auto_102919 ) ) ( not ( = ?auto_102924 ?auto_102925 ) ) ( not ( = ?auto_102924 ?auto_102922 ) ) ( not ( = ?auto_102924 ?auto_102920 ) ) ( not ( = ?auto_102924 ?auto_102919 ) ) ( not ( = ?auto_102925 ?auto_102922 ) ) ( not ( = ?auto_102925 ?auto_102920 ) ) ( not ( = ?auto_102925 ?auto_102919 ) ) ( not ( = ?auto_102918 ?auto_102923 ) ) ( not ( = ?auto_102918 ?auto_102924 ) ) ( not ( = ?auto_102918 ?auto_102925 ) ) ( ON ?auto_102918 ?auto_102921 ) ( CLEAR ?auto_102918 ) ( not ( = ?auto_102918 ?auto_102921 ) ) ( not ( = ?auto_102919 ?auto_102921 ) ) ( not ( = ?auto_102920 ?auto_102921 ) ) ( not ( = ?auto_102922 ?auto_102921 ) ) ( not ( = ?auto_102923 ?auto_102921 ) ) ( not ( = ?auto_102924 ?auto_102921 ) ) ( not ( = ?auto_102925 ?auto_102921 ) ) ( HOLDING ?auto_102919 ) ( CLEAR ?auto_102920 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_102923 ?auto_102924 ?auto_102925 ?auto_102922 ?auto_102920 ?auto_102919 )
      ( MAKE-3PILE ?auto_102918 ?auto_102919 ?auto_102920 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_102926 - BLOCK
      ?auto_102927 - BLOCK
      ?auto_102928 - BLOCK
    )
    :vars
    (
      ?auto_102930 - BLOCK
      ?auto_102931 - BLOCK
      ?auto_102929 - BLOCK
      ?auto_102932 - BLOCK
      ?auto_102933 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_102926 ?auto_102927 ) ) ( not ( = ?auto_102926 ?auto_102928 ) ) ( not ( = ?auto_102927 ?auto_102928 ) ) ( ON ?auto_102928 ?auto_102930 ) ( not ( = ?auto_102926 ?auto_102930 ) ) ( not ( = ?auto_102927 ?auto_102930 ) ) ( not ( = ?auto_102928 ?auto_102930 ) ) ( ON-TABLE ?auto_102931 ) ( ON ?auto_102929 ?auto_102931 ) ( ON ?auto_102932 ?auto_102929 ) ( ON ?auto_102930 ?auto_102932 ) ( not ( = ?auto_102931 ?auto_102929 ) ) ( not ( = ?auto_102931 ?auto_102932 ) ) ( not ( = ?auto_102931 ?auto_102930 ) ) ( not ( = ?auto_102931 ?auto_102928 ) ) ( not ( = ?auto_102931 ?auto_102927 ) ) ( not ( = ?auto_102929 ?auto_102932 ) ) ( not ( = ?auto_102929 ?auto_102930 ) ) ( not ( = ?auto_102929 ?auto_102928 ) ) ( not ( = ?auto_102929 ?auto_102927 ) ) ( not ( = ?auto_102932 ?auto_102930 ) ) ( not ( = ?auto_102932 ?auto_102928 ) ) ( not ( = ?auto_102932 ?auto_102927 ) ) ( not ( = ?auto_102926 ?auto_102931 ) ) ( not ( = ?auto_102926 ?auto_102929 ) ) ( not ( = ?auto_102926 ?auto_102932 ) ) ( ON ?auto_102926 ?auto_102933 ) ( not ( = ?auto_102926 ?auto_102933 ) ) ( not ( = ?auto_102927 ?auto_102933 ) ) ( not ( = ?auto_102928 ?auto_102933 ) ) ( not ( = ?auto_102930 ?auto_102933 ) ) ( not ( = ?auto_102931 ?auto_102933 ) ) ( not ( = ?auto_102929 ?auto_102933 ) ) ( not ( = ?auto_102932 ?auto_102933 ) ) ( CLEAR ?auto_102928 ) ( ON ?auto_102927 ?auto_102926 ) ( CLEAR ?auto_102927 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_102933 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_102933 ?auto_102926 )
      ( MAKE-3PILE ?auto_102926 ?auto_102927 ?auto_102928 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_102934 - BLOCK
      ?auto_102935 - BLOCK
      ?auto_102936 - BLOCK
    )
    :vars
    (
      ?auto_102938 - BLOCK
      ?auto_102937 - BLOCK
      ?auto_102940 - BLOCK
      ?auto_102941 - BLOCK
      ?auto_102939 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_102934 ?auto_102935 ) ) ( not ( = ?auto_102934 ?auto_102936 ) ) ( not ( = ?auto_102935 ?auto_102936 ) ) ( not ( = ?auto_102934 ?auto_102938 ) ) ( not ( = ?auto_102935 ?auto_102938 ) ) ( not ( = ?auto_102936 ?auto_102938 ) ) ( ON-TABLE ?auto_102937 ) ( ON ?auto_102940 ?auto_102937 ) ( ON ?auto_102941 ?auto_102940 ) ( ON ?auto_102938 ?auto_102941 ) ( not ( = ?auto_102937 ?auto_102940 ) ) ( not ( = ?auto_102937 ?auto_102941 ) ) ( not ( = ?auto_102937 ?auto_102938 ) ) ( not ( = ?auto_102937 ?auto_102936 ) ) ( not ( = ?auto_102937 ?auto_102935 ) ) ( not ( = ?auto_102940 ?auto_102941 ) ) ( not ( = ?auto_102940 ?auto_102938 ) ) ( not ( = ?auto_102940 ?auto_102936 ) ) ( not ( = ?auto_102940 ?auto_102935 ) ) ( not ( = ?auto_102941 ?auto_102938 ) ) ( not ( = ?auto_102941 ?auto_102936 ) ) ( not ( = ?auto_102941 ?auto_102935 ) ) ( not ( = ?auto_102934 ?auto_102937 ) ) ( not ( = ?auto_102934 ?auto_102940 ) ) ( not ( = ?auto_102934 ?auto_102941 ) ) ( ON ?auto_102934 ?auto_102939 ) ( not ( = ?auto_102934 ?auto_102939 ) ) ( not ( = ?auto_102935 ?auto_102939 ) ) ( not ( = ?auto_102936 ?auto_102939 ) ) ( not ( = ?auto_102938 ?auto_102939 ) ) ( not ( = ?auto_102937 ?auto_102939 ) ) ( not ( = ?auto_102940 ?auto_102939 ) ) ( not ( = ?auto_102941 ?auto_102939 ) ) ( ON ?auto_102935 ?auto_102934 ) ( CLEAR ?auto_102935 ) ( ON-TABLE ?auto_102939 ) ( HOLDING ?auto_102936 ) ( CLEAR ?auto_102938 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_102937 ?auto_102940 ?auto_102941 ?auto_102938 ?auto_102936 )
      ( MAKE-3PILE ?auto_102934 ?auto_102935 ?auto_102936 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_102942 - BLOCK
      ?auto_102943 - BLOCK
      ?auto_102944 - BLOCK
    )
    :vars
    (
      ?auto_102947 - BLOCK
      ?auto_102946 - BLOCK
      ?auto_102948 - BLOCK
      ?auto_102949 - BLOCK
      ?auto_102945 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_102942 ?auto_102943 ) ) ( not ( = ?auto_102942 ?auto_102944 ) ) ( not ( = ?auto_102943 ?auto_102944 ) ) ( not ( = ?auto_102942 ?auto_102947 ) ) ( not ( = ?auto_102943 ?auto_102947 ) ) ( not ( = ?auto_102944 ?auto_102947 ) ) ( ON-TABLE ?auto_102946 ) ( ON ?auto_102948 ?auto_102946 ) ( ON ?auto_102949 ?auto_102948 ) ( ON ?auto_102947 ?auto_102949 ) ( not ( = ?auto_102946 ?auto_102948 ) ) ( not ( = ?auto_102946 ?auto_102949 ) ) ( not ( = ?auto_102946 ?auto_102947 ) ) ( not ( = ?auto_102946 ?auto_102944 ) ) ( not ( = ?auto_102946 ?auto_102943 ) ) ( not ( = ?auto_102948 ?auto_102949 ) ) ( not ( = ?auto_102948 ?auto_102947 ) ) ( not ( = ?auto_102948 ?auto_102944 ) ) ( not ( = ?auto_102948 ?auto_102943 ) ) ( not ( = ?auto_102949 ?auto_102947 ) ) ( not ( = ?auto_102949 ?auto_102944 ) ) ( not ( = ?auto_102949 ?auto_102943 ) ) ( not ( = ?auto_102942 ?auto_102946 ) ) ( not ( = ?auto_102942 ?auto_102948 ) ) ( not ( = ?auto_102942 ?auto_102949 ) ) ( ON ?auto_102942 ?auto_102945 ) ( not ( = ?auto_102942 ?auto_102945 ) ) ( not ( = ?auto_102943 ?auto_102945 ) ) ( not ( = ?auto_102944 ?auto_102945 ) ) ( not ( = ?auto_102947 ?auto_102945 ) ) ( not ( = ?auto_102946 ?auto_102945 ) ) ( not ( = ?auto_102948 ?auto_102945 ) ) ( not ( = ?auto_102949 ?auto_102945 ) ) ( ON ?auto_102943 ?auto_102942 ) ( ON-TABLE ?auto_102945 ) ( CLEAR ?auto_102947 ) ( ON ?auto_102944 ?auto_102943 ) ( CLEAR ?auto_102944 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_102945 ?auto_102942 ?auto_102943 )
      ( MAKE-3PILE ?auto_102942 ?auto_102943 ?auto_102944 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_102950 - BLOCK
      ?auto_102951 - BLOCK
      ?auto_102952 - BLOCK
    )
    :vars
    (
      ?auto_102954 - BLOCK
      ?auto_102957 - BLOCK
      ?auto_102956 - BLOCK
      ?auto_102953 - BLOCK
      ?auto_102955 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_102950 ?auto_102951 ) ) ( not ( = ?auto_102950 ?auto_102952 ) ) ( not ( = ?auto_102951 ?auto_102952 ) ) ( not ( = ?auto_102950 ?auto_102954 ) ) ( not ( = ?auto_102951 ?auto_102954 ) ) ( not ( = ?auto_102952 ?auto_102954 ) ) ( ON-TABLE ?auto_102957 ) ( ON ?auto_102956 ?auto_102957 ) ( ON ?auto_102953 ?auto_102956 ) ( not ( = ?auto_102957 ?auto_102956 ) ) ( not ( = ?auto_102957 ?auto_102953 ) ) ( not ( = ?auto_102957 ?auto_102954 ) ) ( not ( = ?auto_102957 ?auto_102952 ) ) ( not ( = ?auto_102957 ?auto_102951 ) ) ( not ( = ?auto_102956 ?auto_102953 ) ) ( not ( = ?auto_102956 ?auto_102954 ) ) ( not ( = ?auto_102956 ?auto_102952 ) ) ( not ( = ?auto_102956 ?auto_102951 ) ) ( not ( = ?auto_102953 ?auto_102954 ) ) ( not ( = ?auto_102953 ?auto_102952 ) ) ( not ( = ?auto_102953 ?auto_102951 ) ) ( not ( = ?auto_102950 ?auto_102957 ) ) ( not ( = ?auto_102950 ?auto_102956 ) ) ( not ( = ?auto_102950 ?auto_102953 ) ) ( ON ?auto_102950 ?auto_102955 ) ( not ( = ?auto_102950 ?auto_102955 ) ) ( not ( = ?auto_102951 ?auto_102955 ) ) ( not ( = ?auto_102952 ?auto_102955 ) ) ( not ( = ?auto_102954 ?auto_102955 ) ) ( not ( = ?auto_102957 ?auto_102955 ) ) ( not ( = ?auto_102956 ?auto_102955 ) ) ( not ( = ?auto_102953 ?auto_102955 ) ) ( ON ?auto_102951 ?auto_102950 ) ( ON-TABLE ?auto_102955 ) ( ON ?auto_102952 ?auto_102951 ) ( CLEAR ?auto_102952 ) ( HOLDING ?auto_102954 ) ( CLEAR ?auto_102953 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_102957 ?auto_102956 ?auto_102953 ?auto_102954 )
      ( MAKE-3PILE ?auto_102950 ?auto_102951 ?auto_102952 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_102958 - BLOCK
      ?auto_102959 - BLOCK
      ?auto_102960 - BLOCK
    )
    :vars
    (
      ?auto_102961 - BLOCK
      ?auto_102964 - BLOCK
      ?auto_102963 - BLOCK
      ?auto_102962 - BLOCK
      ?auto_102965 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_102958 ?auto_102959 ) ) ( not ( = ?auto_102958 ?auto_102960 ) ) ( not ( = ?auto_102959 ?auto_102960 ) ) ( not ( = ?auto_102958 ?auto_102961 ) ) ( not ( = ?auto_102959 ?auto_102961 ) ) ( not ( = ?auto_102960 ?auto_102961 ) ) ( ON-TABLE ?auto_102964 ) ( ON ?auto_102963 ?auto_102964 ) ( ON ?auto_102962 ?auto_102963 ) ( not ( = ?auto_102964 ?auto_102963 ) ) ( not ( = ?auto_102964 ?auto_102962 ) ) ( not ( = ?auto_102964 ?auto_102961 ) ) ( not ( = ?auto_102964 ?auto_102960 ) ) ( not ( = ?auto_102964 ?auto_102959 ) ) ( not ( = ?auto_102963 ?auto_102962 ) ) ( not ( = ?auto_102963 ?auto_102961 ) ) ( not ( = ?auto_102963 ?auto_102960 ) ) ( not ( = ?auto_102963 ?auto_102959 ) ) ( not ( = ?auto_102962 ?auto_102961 ) ) ( not ( = ?auto_102962 ?auto_102960 ) ) ( not ( = ?auto_102962 ?auto_102959 ) ) ( not ( = ?auto_102958 ?auto_102964 ) ) ( not ( = ?auto_102958 ?auto_102963 ) ) ( not ( = ?auto_102958 ?auto_102962 ) ) ( ON ?auto_102958 ?auto_102965 ) ( not ( = ?auto_102958 ?auto_102965 ) ) ( not ( = ?auto_102959 ?auto_102965 ) ) ( not ( = ?auto_102960 ?auto_102965 ) ) ( not ( = ?auto_102961 ?auto_102965 ) ) ( not ( = ?auto_102964 ?auto_102965 ) ) ( not ( = ?auto_102963 ?auto_102965 ) ) ( not ( = ?auto_102962 ?auto_102965 ) ) ( ON ?auto_102959 ?auto_102958 ) ( ON-TABLE ?auto_102965 ) ( ON ?auto_102960 ?auto_102959 ) ( CLEAR ?auto_102962 ) ( ON ?auto_102961 ?auto_102960 ) ( CLEAR ?auto_102961 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_102965 ?auto_102958 ?auto_102959 ?auto_102960 )
      ( MAKE-3PILE ?auto_102958 ?auto_102959 ?auto_102960 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_102966 - BLOCK
      ?auto_102967 - BLOCK
      ?auto_102968 - BLOCK
    )
    :vars
    (
      ?auto_102971 - BLOCK
      ?auto_102972 - BLOCK
      ?auto_102973 - BLOCK
      ?auto_102969 - BLOCK
      ?auto_102970 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_102966 ?auto_102967 ) ) ( not ( = ?auto_102966 ?auto_102968 ) ) ( not ( = ?auto_102967 ?auto_102968 ) ) ( not ( = ?auto_102966 ?auto_102971 ) ) ( not ( = ?auto_102967 ?auto_102971 ) ) ( not ( = ?auto_102968 ?auto_102971 ) ) ( ON-TABLE ?auto_102972 ) ( ON ?auto_102973 ?auto_102972 ) ( not ( = ?auto_102972 ?auto_102973 ) ) ( not ( = ?auto_102972 ?auto_102969 ) ) ( not ( = ?auto_102972 ?auto_102971 ) ) ( not ( = ?auto_102972 ?auto_102968 ) ) ( not ( = ?auto_102972 ?auto_102967 ) ) ( not ( = ?auto_102973 ?auto_102969 ) ) ( not ( = ?auto_102973 ?auto_102971 ) ) ( not ( = ?auto_102973 ?auto_102968 ) ) ( not ( = ?auto_102973 ?auto_102967 ) ) ( not ( = ?auto_102969 ?auto_102971 ) ) ( not ( = ?auto_102969 ?auto_102968 ) ) ( not ( = ?auto_102969 ?auto_102967 ) ) ( not ( = ?auto_102966 ?auto_102972 ) ) ( not ( = ?auto_102966 ?auto_102973 ) ) ( not ( = ?auto_102966 ?auto_102969 ) ) ( ON ?auto_102966 ?auto_102970 ) ( not ( = ?auto_102966 ?auto_102970 ) ) ( not ( = ?auto_102967 ?auto_102970 ) ) ( not ( = ?auto_102968 ?auto_102970 ) ) ( not ( = ?auto_102971 ?auto_102970 ) ) ( not ( = ?auto_102972 ?auto_102970 ) ) ( not ( = ?auto_102973 ?auto_102970 ) ) ( not ( = ?auto_102969 ?auto_102970 ) ) ( ON ?auto_102967 ?auto_102966 ) ( ON-TABLE ?auto_102970 ) ( ON ?auto_102968 ?auto_102967 ) ( ON ?auto_102971 ?auto_102968 ) ( CLEAR ?auto_102971 ) ( HOLDING ?auto_102969 ) ( CLEAR ?auto_102973 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_102972 ?auto_102973 ?auto_102969 )
      ( MAKE-3PILE ?auto_102966 ?auto_102967 ?auto_102968 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_102974 - BLOCK
      ?auto_102975 - BLOCK
      ?auto_102976 - BLOCK
    )
    :vars
    (
      ?auto_102978 - BLOCK
      ?auto_102980 - BLOCK
      ?auto_102977 - BLOCK
      ?auto_102979 - BLOCK
      ?auto_102981 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_102974 ?auto_102975 ) ) ( not ( = ?auto_102974 ?auto_102976 ) ) ( not ( = ?auto_102975 ?auto_102976 ) ) ( not ( = ?auto_102974 ?auto_102978 ) ) ( not ( = ?auto_102975 ?auto_102978 ) ) ( not ( = ?auto_102976 ?auto_102978 ) ) ( ON-TABLE ?auto_102980 ) ( ON ?auto_102977 ?auto_102980 ) ( not ( = ?auto_102980 ?auto_102977 ) ) ( not ( = ?auto_102980 ?auto_102979 ) ) ( not ( = ?auto_102980 ?auto_102978 ) ) ( not ( = ?auto_102980 ?auto_102976 ) ) ( not ( = ?auto_102980 ?auto_102975 ) ) ( not ( = ?auto_102977 ?auto_102979 ) ) ( not ( = ?auto_102977 ?auto_102978 ) ) ( not ( = ?auto_102977 ?auto_102976 ) ) ( not ( = ?auto_102977 ?auto_102975 ) ) ( not ( = ?auto_102979 ?auto_102978 ) ) ( not ( = ?auto_102979 ?auto_102976 ) ) ( not ( = ?auto_102979 ?auto_102975 ) ) ( not ( = ?auto_102974 ?auto_102980 ) ) ( not ( = ?auto_102974 ?auto_102977 ) ) ( not ( = ?auto_102974 ?auto_102979 ) ) ( ON ?auto_102974 ?auto_102981 ) ( not ( = ?auto_102974 ?auto_102981 ) ) ( not ( = ?auto_102975 ?auto_102981 ) ) ( not ( = ?auto_102976 ?auto_102981 ) ) ( not ( = ?auto_102978 ?auto_102981 ) ) ( not ( = ?auto_102980 ?auto_102981 ) ) ( not ( = ?auto_102977 ?auto_102981 ) ) ( not ( = ?auto_102979 ?auto_102981 ) ) ( ON ?auto_102975 ?auto_102974 ) ( ON-TABLE ?auto_102981 ) ( ON ?auto_102976 ?auto_102975 ) ( ON ?auto_102978 ?auto_102976 ) ( CLEAR ?auto_102977 ) ( ON ?auto_102979 ?auto_102978 ) ( CLEAR ?auto_102979 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_102981 ?auto_102974 ?auto_102975 ?auto_102976 ?auto_102978 )
      ( MAKE-3PILE ?auto_102974 ?auto_102975 ?auto_102976 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_102982 - BLOCK
      ?auto_102983 - BLOCK
      ?auto_102984 - BLOCK
    )
    :vars
    (
      ?auto_102986 - BLOCK
      ?auto_102989 - BLOCK
      ?auto_102985 - BLOCK
      ?auto_102988 - BLOCK
      ?auto_102987 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_102982 ?auto_102983 ) ) ( not ( = ?auto_102982 ?auto_102984 ) ) ( not ( = ?auto_102983 ?auto_102984 ) ) ( not ( = ?auto_102982 ?auto_102986 ) ) ( not ( = ?auto_102983 ?auto_102986 ) ) ( not ( = ?auto_102984 ?auto_102986 ) ) ( ON-TABLE ?auto_102989 ) ( not ( = ?auto_102989 ?auto_102985 ) ) ( not ( = ?auto_102989 ?auto_102988 ) ) ( not ( = ?auto_102989 ?auto_102986 ) ) ( not ( = ?auto_102989 ?auto_102984 ) ) ( not ( = ?auto_102989 ?auto_102983 ) ) ( not ( = ?auto_102985 ?auto_102988 ) ) ( not ( = ?auto_102985 ?auto_102986 ) ) ( not ( = ?auto_102985 ?auto_102984 ) ) ( not ( = ?auto_102985 ?auto_102983 ) ) ( not ( = ?auto_102988 ?auto_102986 ) ) ( not ( = ?auto_102988 ?auto_102984 ) ) ( not ( = ?auto_102988 ?auto_102983 ) ) ( not ( = ?auto_102982 ?auto_102989 ) ) ( not ( = ?auto_102982 ?auto_102985 ) ) ( not ( = ?auto_102982 ?auto_102988 ) ) ( ON ?auto_102982 ?auto_102987 ) ( not ( = ?auto_102982 ?auto_102987 ) ) ( not ( = ?auto_102983 ?auto_102987 ) ) ( not ( = ?auto_102984 ?auto_102987 ) ) ( not ( = ?auto_102986 ?auto_102987 ) ) ( not ( = ?auto_102989 ?auto_102987 ) ) ( not ( = ?auto_102985 ?auto_102987 ) ) ( not ( = ?auto_102988 ?auto_102987 ) ) ( ON ?auto_102983 ?auto_102982 ) ( ON-TABLE ?auto_102987 ) ( ON ?auto_102984 ?auto_102983 ) ( ON ?auto_102986 ?auto_102984 ) ( ON ?auto_102988 ?auto_102986 ) ( CLEAR ?auto_102988 ) ( HOLDING ?auto_102985 ) ( CLEAR ?auto_102989 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_102989 ?auto_102985 )
      ( MAKE-3PILE ?auto_102982 ?auto_102983 ?auto_102984 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_102990 - BLOCK
      ?auto_102991 - BLOCK
      ?auto_102992 - BLOCK
    )
    :vars
    (
      ?auto_102996 - BLOCK
      ?auto_102993 - BLOCK
      ?auto_102995 - BLOCK
      ?auto_102994 - BLOCK
      ?auto_102997 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_102990 ?auto_102991 ) ) ( not ( = ?auto_102990 ?auto_102992 ) ) ( not ( = ?auto_102991 ?auto_102992 ) ) ( not ( = ?auto_102990 ?auto_102996 ) ) ( not ( = ?auto_102991 ?auto_102996 ) ) ( not ( = ?auto_102992 ?auto_102996 ) ) ( ON-TABLE ?auto_102993 ) ( not ( = ?auto_102993 ?auto_102995 ) ) ( not ( = ?auto_102993 ?auto_102994 ) ) ( not ( = ?auto_102993 ?auto_102996 ) ) ( not ( = ?auto_102993 ?auto_102992 ) ) ( not ( = ?auto_102993 ?auto_102991 ) ) ( not ( = ?auto_102995 ?auto_102994 ) ) ( not ( = ?auto_102995 ?auto_102996 ) ) ( not ( = ?auto_102995 ?auto_102992 ) ) ( not ( = ?auto_102995 ?auto_102991 ) ) ( not ( = ?auto_102994 ?auto_102996 ) ) ( not ( = ?auto_102994 ?auto_102992 ) ) ( not ( = ?auto_102994 ?auto_102991 ) ) ( not ( = ?auto_102990 ?auto_102993 ) ) ( not ( = ?auto_102990 ?auto_102995 ) ) ( not ( = ?auto_102990 ?auto_102994 ) ) ( ON ?auto_102990 ?auto_102997 ) ( not ( = ?auto_102990 ?auto_102997 ) ) ( not ( = ?auto_102991 ?auto_102997 ) ) ( not ( = ?auto_102992 ?auto_102997 ) ) ( not ( = ?auto_102996 ?auto_102997 ) ) ( not ( = ?auto_102993 ?auto_102997 ) ) ( not ( = ?auto_102995 ?auto_102997 ) ) ( not ( = ?auto_102994 ?auto_102997 ) ) ( ON ?auto_102991 ?auto_102990 ) ( ON-TABLE ?auto_102997 ) ( ON ?auto_102992 ?auto_102991 ) ( ON ?auto_102996 ?auto_102992 ) ( ON ?auto_102994 ?auto_102996 ) ( CLEAR ?auto_102993 ) ( ON ?auto_102995 ?auto_102994 ) ( CLEAR ?auto_102995 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_102997 ?auto_102990 ?auto_102991 ?auto_102992 ?auto_102996 ?auto_102994 )
      ( MAKE-3PILE ?auto_102990 ?auto_102991 ?auto_102992 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_102998 - BLOCK
      ?auto_102999 - BLOCK
      ?auto_103000 - BLOCK
    )
    :vars
    (
      ?auto_103003 - BLOCK
      ?auto_103004 - BLOCK
      ?auto_103002 - BLOCK
      ?auto_103005 - BLOCK
      ?auto_103001 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_102998 ?auto_102999 ) ) ( not ( = ?auto_102998 ?auto_103000 ) ) ( not ( = ?auto_102999 ?auto_103000 ) ) ( not ( = ?auto_102998 ?auto_103003 ) ) ( not ( = ?auto_102999 ?auto_103003 ) ) ( not ( = ?auto_103000 ?auto_103003 ) ) ( not ( = ?auto_103004 ?auto_103002 ) ) ( not ( = ?auto_103004 ?auto_103005 ) ) ( not ( = ?auto_103004 ?auto_103003 ) ) ( not ( = ?auto_103004 ?auto_103000 ) ) ( not ( = ?auto_103004 ?auto_102999 ) ) ( not ( = ?auto_103002 ?auto_103005 ) ) ( not ( = ?auto_103002 ?auto_103003 ) ) ( not ( = ?auto_103002 ?auto_103000 ) ) ( not ( = ?auto_103002 ?auto_102999 ) ) ( not ( = ?auto_103005 ?auto_103003 ) ) ( not ( = ?auto_103005 ?auto_103000 ) ) ( not ( = ?auto_103005 ?auto_102999 ) ) ( not ( = ?auto_102998 ?auto_103004 ) ) ( not ( = ?auto_102998 ?auto_103002 ) ) ( not ( = ?auto_102998 ?auto_103005 ) ) ( ON ?auto_102998 ?auto_103001 ) ( not ( = ?auto_102998 ?auto_103001 ) ) ( not ( = ?auto_102999 ?auto_103001 ) ) ( not ( = ?auto_103000 ?auto_103001 ) ) ( not ( = ?auto_103003 ?auto_103001 ) ) ( not ( = ?auto_103004 ?auto_103001 ) ) ( not ( = ?auto_103002 ?auto_103001 ) ) ( not ( = ?auto_103005 ?auto_103001 ) ) ( ON ?auto_102999 ?auto_102998 ) ( ON-TABLE ?auto_103001 ) ( ON ?auto_103000 ?auto_102999 ) ( ON ?auto_103003 ?auto_103000 ) ( ON ?auto_103005 ?auto_103003 ) ( ON ?auto_103002 ?auto_103005 ) ( CLEAR ?auto_103002 ) ( HOLDING ?auto_103004 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_103004 )
      ( MAKE-3PILE ?auto_102998 ?auto_102999 ?auto_103000 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_103006 - BLOCK
      ?auto_103007 - BLOCK
      ?auto_103008 - BLOCK
    )
    :vars
    (
      ?auto_103010 - BLOCK
      ?auto_103011 - BLOCK
      ?auto_103009 - BLOCK
      ?auto_103013 - BLOCK
      ?auto_103012 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_103006 ?auto_103007 ) ) ( not ( = ?auto_103006 ?auto_103008 ) ) ( not ( = ?auto_103007 ?auto_103008 ) ) ( not ( = ?auto_103006 ?auto_103010 ) ) ( not ( = ?auto_103007 ?auto_103010 ) ) ( not ( = ?auto_103008 ?auto_103010 ) ) ( not ( = ?auto_103011 ?auto_103009 ) ) ( not ( = ?auto_103011 ?auto_103013 ) ) ( not ( = ?auto_103011 ?auto_103010 ) ) ( not ( = ?auto_103011 ?auto_103008 ) ) ( not ( = ?auto_103011 ?auto_103007 ) ) ( not ( = ?auto_103009 ?auto_103013 ) ) ( not ( = ?auto_103009 ?auto_103010 ) ) ( not ( = ?auto_103009 ?auto_103008 ) ) ( not ( = ?auto_103009 ?auto_103007 ) ) ( not ( = ?auto_103013 ?auto_103010 ) ) ( not ( = ?auto_103013 ?auto_103008 ) ) ( not ( = ?auto_103013 ?auto_103007 ) ) ( not ( = ?auto_103006 ?auto_103011 ) ) ( not ( = ?auto_103006 ?auto_103009 ) ) ( not ( = ?auto_103006 ?auto_103013 ) ) ( ON ?auto_103006 ?auto_103012 ) ( not ( = ?auto_103006 ?auto_103012 ) ) ( not ( = ?auto_103007 ?auto_103012 ) ) ( not ( = ?auto_103008 ?auto_103012 ) ) ( not ( = ?auto_103010 ?auto_103012 ) ) ( not ( = ?auto_103011 ?auto_103012 ) ) ( not ( = ?auto_103009 ?auto_103012 ) ) ( not ( = ?auto_103013 ?auto_103012 ) ) ( ON ?auto_103007 ?auto_103006 ) ( ON-TABLE ?auto_103012 ) ( ON ?auto_103008 ?auto_103007 ) ( ON ?auto_103010 ?auto_103008 ) ( ON ?auto_103013 ?auto_103010 ) ( ON ?auto_103009 ?auto_103013 ) ( ON ?auto_103011 ?auto_103009 ) ( CLEAR ?auto_103011 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_103012 ?auto_103006 ?auto_103007 ?auto_103008 ?auto_103010 ?auto_103013 ?auto_103009 )
      ( MAKE-3PILE ?auto_103006 ?auto_103007 ?auto_103008 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_103017 - BLOCK
      ?auto_103018 - BLOCK
      ?auto_103019 - BLOCK
    )
    :vars
    (
      ?auto_103020 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_103020 ?auto_103019 ) ( CLEAR ?auto_103020 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_103017 ) ( ON ?auto_103018 ?auto_103017 ) ( ON ?auto_103019 ?auto_103018 ) ( not ( = ?auto_103017 ?auto_103018 ) ) ( not ( = ?auto_103017 ?auto_103019 ) ) ( not ( = ?auto_103017 ?auto_103020 ) ) ( not ( = ?auto_103018 ?auto_103019 ) ) ( not ( = ?auto_103018 ?auto_103020 ) ) ( not ( = ?auto_103019 ?auto_103020 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_103020 ?auto_103019 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_103021 - BLOCK
      ?auto_103022 - BLOCK
      ?auto_103023 - BLOCK
    )
    :vars
    (
      ?auto_103024 - BLOCK
      ?auto_103025 - BLOCK
      ?auto_103026 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_103024 ?auto_103023 ) ( CLEAR ?auto_103024 ) ( ON-TABLE ?auto_103021 ) ( ON ?auto_103022 ?auto_103021 ) ( ON ?auto_103023 ?auto_103022 ) ( not ( = ?auto_103021 ?auto_103022 ) ) ( not ( = ?auto_103021 ?auto_103023 ) ) ( not ( = ?auto_103021 ?auto_103024 ) ) ( not ( = ?auto_103022 ?auto_103023 ) ) ( not ( = ?auto_103022 ?auto_103024 ) ) ( not ( = ?auto_103023 ?auto_103024 ) ) ( HOLDING ?auto_103025 ) ( CLEAR ?auto_103026 ) ( not ( = ?auto_103021 ?auto_103025 ) ) ( not ( = ?auto_103021 ?auto_103026 ) ) ( not ( = ?auto_103022 ?auto_103025 ) ) ( not ( = ?auto_103022 ?auto_103026 ) ) ( not ( = ?auto_103023 ?auto_103025 ) ) ( not ( = ?auto_103023 ?auto_103026 ) ) ( not ( = ?auto_103024 ?auto_103025 ) ) ( not ( = ?auto_103024 ?auto_103026 ) ) ( not ( = ?auto_103025 ?auto_103026 ) ) )
    :subtasks
    ( ( !STACK ?auto_103025 ?auto_103026 )
      ( MAKE-3PILE ?auto_103021 ?auto_103022 ?auto_103023 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_103027 - BLOCK
      ?auto_103028 - BLOCK
      ?auto_103029 - BLOCK
    )
    :vars
    (
      ?auto_103030 - BLOCK
      ?auto_103031 - BLOCK
      ?auto_103032 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_103030 ?auto_103029 ) ( ON-TABLE ?auto_103027 ) ( ON ?auto_103028 ?auto_103027 ) ( ON ?auto_103029 ?auto_103028 ) ( not ( = ?auto_103027 ?auto_103028 ) ) ( not ( = ?auto_103027 ?auto_103029 ) ) ( not ( = ?auto_103027 ?auto_103030 ) ) ( not ( = ?auto_103028 ?auto_103029 ) ) ( not ( = ?auto_103028 ?auto_103030 ) ) ( not ( = ?auto_103029 ?auto_103030 ) ) ( CLEAR ?auto_103031 ) ( not ( = ?auto_103027 ?auto_103032 ) ) ( not ( = ?auto_103027 ?auto_103031 ) ) ( not ( = ?auto_103028 ?auto_103032 ) ) ( not ( = ?auto_103028 ?auto_103031 ) ) ( not ( = ?auto_103029 ?auto_103032 ) ) ( not ( = ?auto_103029 ?auto_103031 ) ) ( not ( = ?auto_103030 ?auto_103032 ) ) ( not ( = ?auto_103030 ?auto_103031 ) ) ( not ( = ?auto_103032 ?auto_103031 ) ) ( ON ?auto_103032 ?auto_103030 ) ( CLEAR ?auto_103032 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_103027 ?auto_103028 ?auto_103029 ?auto_103030 )
      ( MAKE-3PILE ?auto_103027 ?auto_103028 ?auto_103029 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_103033 - BLOCK
      ?auto_103034 - BLOCK
      ?auto_103035 - BLOCK
    )
    :vars
    (
      ?auto_103036 - BLOCK
      ?auto_103038 - BLOCK
      ?auto_103037 - BLOCK
      ?auto_103039 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_103036 ?auto_103035 ) ( ON-TABLE ?auto_103033 ) ( ON ?auto_103034 ?auto_103033 ) ( ON ?auto_103035 ?auto_103034 ) ( not ( = ?auto_103033 ?auto_103034 ) ) ( not ( = ?auto_103033 ?auto_103035 ) ) ( not ( = ?auto_103033 ?auto_103036 ) ) ( not ( = ?auto_103034 ?auto_103035 ) ) ( not ( = ?auto_103034 ?auto_103036 ) ) ( not ( = ?auto_103035 ?auto_103036 ) ) ( not ( = ?auto_103033 ?auto_103038 ) ) ( not ( = ?auto_103033 ?auto_103037 ) ) ( not ( = ?auto_103034 ?auto_103038 ) ) ( not ( = ?auto_103034 ?auto_103037 ) ) ( not ( = ?auto_103035 ?auto_103038 ) ) ( not ( = ?auto_103035 ?auto_103037 ) ) ( not ( = ?auto_103036 ?auto_103038 ) ) ( not ( = ?auto_103036 ?auto_103037 ) ) ( not ( = ?auto_103038 ?auto_103037 ) ) ( ON ?auto_103038 ?auto_103036 ) ( CLEAR ?auto_103038 ) ( HOLDING ?auto_103037 ) ( CLEAR ?auto_103039 ) ( ON-TABLE ?auto_103039 ) ( not ( = ?auto_103039 ?auto_103037 ) ) ( not ( = ?auto_103033 ?auto_103039 ) ) ( not ( = ?auto_103034 ?auto_103039 ) ) ( not ( = ?auto_103035 ?auto_103039 ) ) ( not ( = ?auto_103036 ?auto_103039 ) ) ( not ( = ?auto_103038 ?auto_103039 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_103039 ?auto_103037 )
      ( MAKE-3PILE ?auto_103033 ?auto_103034 ?auto_103035 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_103040 - BLOCK
      ?auto_103041 - BLOCK
      ?auto_103042 - BLOCK
    )
    :vars
    (
      ?auto_103046 - BLOCK
      ?auto_103044 - BLOCK
      ?auto_103045 - BLOCK
      ?auto_103043 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_103046 ?auto_103042 ) ( ON-TABLE ?auto_103040 ) ( ON ?auto_103041 ?auto_103040 ) ( ON ?auto_103042 ?auto_103041 ) ( not ( = ?auto_103040 ?auto_103041 ) ) ( not ( = ?auto_103040 ?auto_103042 ) ) ( not ( = ?auto_103040 ?auto_103046 ) ) ( not ( = ?auto_103041 ?auto_103042 ) ) ( not ( = ?auto_103041 ?auto_103046 ) ) ( not ( = ?auto_103042 ?auto_103046 ) ) ( not ( = ?auto_103040 ?auto_103044 ) ) ( not ( = ?auto_103040 ?auto_103045 ) ) ( not ( = ?auto_103041 ?auto_103044 ) ) ( not ( = ?auto_103041 ?auto_103045 ) ) ( not ( = ?auto_103042 ?auto_103044 ) ) ( not ( = ?auto_103042 ?auto_103045 ) ) ( not ( = ?auto_103046 ?auto_103044 ) ) ( not ( = ?auto_103046 ?auto_103045 ) ) ( not ( = ?auto_103044 ?auto_103045 ) ) ( ON ?auto_103044 ?auto_103046 ) ( CLEAR ?auto_103043 ) ( ON-TABLE ?auto_103043 ) ( not ( = ?auto_103043 ?auto_103045 ) ) ( not ( = ?auto_103040 ?auto_103043 ) ) ( not ( = ?auto_103041 ?auto_103043 ) ) ( not ( = ?auto_103042 ?auto_103043 ) ) ( not ( = ?auto_103046 ?auto_103043 ) ) ( not ( = ?auto_103044 ?auto_103043 ) ) ( ON ?auto_103045 ?auto_103044 ) ( CLEAR ?auto_103045 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_103040 ?auto_103041 ?auto_103042 ?auto_103046 ?auto_103044 )
      ( MAKE-3PILE ?auto_103040 ?auto_103041 ?auto_103042 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_103047 - BLOCK
      ?auto_103048 - BLOCK
      ?auto_103049 - BLOCK
    )
    :vars
    (
      ?auto_103050 - BLOCK
      ?auto_103051 - BLOCK
      ?auto_103052 - BLOCK
      ?auto_103053 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_103050 ?auto_103049 ) ( ON-TABLE ?auto_103047 ) ( ON ?auto_103048 ?auto_103047 ) ( ON ?auto_103049 ?auto_103048 ) ( not ( = ?auto_103047 ?auto_103048 ) ) ( not ( = ?auto_103047 ?auto_103049 ) ) ( not ( = ?auto_103047 ?auto_103050 ) ) ( not ( = ?auto_103048 ?auto_103049 ) ) ( not ( = ?auto_103048 ?auto_103050 ) ) ( not ( = ?auto_103049 ?auto_103050 ) ) ( not ( = ?auto_103047 ?auto_103051 ) ) ( not ( = ?auto_103047 ?auto_103052 ) ) ( not ( = ?auto_103048 ?auto_103051 ) ) ( not ( = ?auto_103048 ?auto_103052 ) ) ( not ( = ?auto_103049 ?auto_103051 ) ) ( not ( = ?auto_103049 ?auto_103052 ) ) ( not ( = ?auto_103050 ?auto_103051 ) ) ( not ( = ?auto_103050 ?auto_103052 ) ) ( not ( = ?auto_103051 ?auto_103052 ) ) ( ON ?auto_103051 ?auto_103050 ) ( not ( = ?auto_103053 ?auto_103052 ) ) ( not ( = ?auto_103047 ?auto_103053 ) ) ( not ( = ?auto_103048 ?auto_103053 ) ) ( not ( = ?auto_103049 ?auto_103053 ) ) ( not ( = ?auto_103050 ?auto_103053 ) ) ( not ( = ?auto_103051 ?auto_103053 ) ) ( ON ?auto_103052 ?auto_103051 ) ( CLEAR ?auto_103052 ) ( HOLDING ?auto_103053 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_103053 )
      ( MAKE-3PILE ?auto_103047 ?auto_103048 ?auto_103049 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_103054 - BLOCK
      ?auto_103055 - BLOCK
      ?auto_103056 - BLOCK
    )
    :vars
    (
      ?auto_103060 - BLOCK
      ?auto_103057 - BLOCK
      ?auto_103059 - BLOCK
      ?auto_103058 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_103060 ?auto_103056 ) ( ON-TABLE ?auto_103054 ) ( ON ?auto_103055 ?auto_103054 ) ( ON ?auto_103056 ?auto_103055 ) ( not ( = ?auto_103054 ?auto_103055 ) ) ( not ( = ?auto_103054 ?auto_103056 ) ) ( not ( = ?auto_103054 ?auto_103060 ) ) ( not ( = ?auto_103055 ?auto_103056 ) ) ( not ( = ?auto_103055 ?auto_103060 ) ) ( not ( = ?auto_103056 ?auto_103060 ) ) ( not ( = ?auto_103054 ?auto_103057 ) ) ( not ( = ?auto_103054 ?auto_103059 ) ) ( not ( = ?auto_103055 ?auto_103057 ) ) ( not ( = ?auto_103055 ?auto_103059 ) ) ( not ( = ?auto_103056 ?auto_103057 ) ) ( not ( = ?auto_103056 ?auto_103059 ) ) ( not ( = ?auto_103060 ?auto_103057 ) ) ( not ( = ?auto_103060 ?auto_103059 ) ) ( not ( = ?auto_103057 ?auto_103059 ) ) ( ON ?auto_103057 ?auto_103060 ) ( not ( = ?auto_103058 ?auto_103059 ) ) ( not ( = ?auto_103054 ?auto_103058 ) ) ( not ( = ?auto_103055 ?auto_103058 ) ) ( not ( = ?auto_103056 ?auto_103058 ) ) ( not ( = ?auto_103060 ?auto_103058 ) ) ( not ( = ?auto_103057 ?auto_103058 ) ) ( ON ?auto_103059 ?auto_103057 ) ( ON ?auto_103058 ?auto_103059 ) ( CLEAR ?auto_103058 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_103054 ?auto_103055 ?auto_103056 ?auto_103060 ?auto_103057 ?auto_103059 )
      ( MAKE-3PILE ?auto_103054 ?auto_103055 ?auto_103056 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_103061 - BLOCK
      ?auto_103062 - BLOCK
      ?auto_103063 - BLOCK
    )
    :vars
    (
      ?auto_103066 - BLOCK
      ?auto_103065 - BLOCK
      ?auto_103064 - BLOCK
      ?auto_103067 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_103066 ?auto_103063 ) ( ON-TABLE ?auto_103061 ) ( ON ?auto_103062 ?auto_103061 ) ( ON ?auto_103063 ?auto_103062 ) ( not ( = ?auto_103061 ?auto_103062 ) ) ( not ( = ?auto_103061 ?auto_103063 ) ) ( not ( = ?auto_103061 ?auto_103066 ) ) ( not ( = ?auto_103062 ?auto_103063 ) ) ( not ( = ?auto_103062 ?auto_103066 ) ) ( not ( = ?auto_103063 ?auto_103066 ) ) ( not ( = ?auto_103061 ?auto_103065 ) ) ( not ( = ?auto_103061 ?auto_103064 ) ) ( not ( = ?auto_103062 ?auto_103065 ) ) ( not ( = ?auto_103062 ?auto_103064 ) ) ( not ( = ?auto_103063 ?auto_103065 ) ) ( not ( = ?auto_103063 ?auto_103064 ) ) ( not ( = ?auto_103066 ?auto_103065 ) ) ( not ( = ?auto_103066 ?auto_103064 ) ) ( not ( = ?auto_103065 ?auto_103064 ) ) ( ON ?auto_103065 ?auto_103066 ) ( not ( = ?auto_103067 ?auto_103064 ) ) ( not ( = ?auto_103061 ?auto_103067 ) ) ( not ( = ?auto_103062 ?auto_103067 ) ) ( not ( = ?auto_103063 ?auto_103067 ) ) ( not ( = ?auto_103066 ?auto_103067 ) ) ( not ( = ?auto_103065 ?auto_103067 ) ) ( ON ?auto_103064 ?auto_103065 ) ( HOLDING ?auto_103067 ) ( CLEAR ?auto_103064 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_103061 ?auto_103062 ?auto_103063 ?auto_103066 ?auto_103065 ?auto_103064 ?auto_103067 )
      ( MAKE-3PILE ?auto_103061 ?auto_103062 ?auto_103063 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_103068 - BLOCK
      ?auto_103069 - BLOCK
      ?auto_103070 - BLOCK
    )
    :vars
    (
      ?auto_103073 - BLOCK
      ?auto_103074 - BLOCK
      ?auto_103071 - BLOCK
      ?auto_103072 - BLOCK
      ?auto_103075 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_103073 ?auto_103070 ) ( ON-TABLE ?auto_103068 ) ( ON ?auto_103069 ?auto_103068 ) ( ON ?auto_103070 ?auto_103069 ) ( not ( = ?auto_103068 ?auto_103069 ) ) ( not ( = ?auto_103068 ?auto_103070 ) ) ( not ( = ?auto_103068 ?auto_103073 ) ) ( not ( = ?auto_103069 ?auto_103070 ) ) ( not ( = ?auto_103069 ?auto_103073 ) ) ( not ( = ?auto_103070 ?auto_103073 ) ) ( not ( = ?auto_103068 ?auto_103074 ) ) ( not ( = ?auto_103068 ?auto_103071 ) ) ( not ( = ?auto_103069 ?auto_103074 ) ) ( not ( = ?auto_103069 ?auto_103071 ) ) ( not ( = ?auto_103070 ?auto_103074 ) ) ( not ( = ?auto_103070 ?auto_103071 ) ) ( not ( = ?auto_103073 ?auto_103074 ) ) ( not ( = ?auto_103073 ?auto_103071 ) ) ( not ( = ?auto_103074 ?auto_103071 ) ) ( ON ?auto_103074 ?auto_103073 ) ( not ( = ?auto_103072 ?auto_103071 ) ) ( not ( = ?auto_103068 ?auto_103072 ) ) ( not ( = ?auto_103069 ?auto_103072 ) ) ( not ( = ?auto_103070 ?auto_103072 ) ) ( not ( = ?auto_103073 ?auto_103072 ) ) ( not ( = ?auto_103074 ?auto_103072 ) ) ( ON ?auto_103071 ?auto_103074 ) ( CLEAR ?auto_103071 ) ( ON ?auto_103072 ?auto_103075 ) ( CLEAR ?auto_103072 ) ( HAND-EMPTY ) ( not ( = ?auto_103068 ?auto_103075 ) ) ( not ( = ?auto_103069 ?auto_103075 ) ) ( not ( = ?auto_103070 ?auto_103075 ) ) ( not ( = ?auto_103073 ?auto_103075 ) ) ( not ( = ?auto_103074 ?auto_103075 ) ) ( not ( = ?auto_103071 ?auto_103075 ) ) ( not ( = ?auto_103072 ?auto_103075 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_103072 ?auto_103075 )
      ( MAKE-3PILE ?auto_103068 ?auto_103069 ?auto_103070 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_103076 - BLOCK
      ?auto_103077 - BLOCK
      ?auto_103078 - BLOCK
    )
    :vars
    (
      ?auto_103083 - BLOCK
      ?auto_103080 - BLOCK
      ?auto_103082 - BLOCK
      ?auto_103079 - BLOCK
      ?auto_103081 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_103083 ?auto_103078 ) ( ON-TABLE ?auto_103076 ) ( ON ?auto_103077 ?auto_103076 ) ( ON ?auto_103078 ?auto_103077 ) ( not ( = ?auto_103076 ?auto_103077 ) ) ( not ( = ?auto_103076 ?auto_103078 ) ) ( not ( = ?auto_103076 ?auto_103083 ) ) ( not ( = ?auto_103077 ?auto_103078 ) ) ( not ( = ?auto_103077 ?auto_103083 ) ) ( not ( = ?auto_103078 ?auto_103083 ) ) ( not ( = ?auto_103076 ?auto_103080 ) ) ( not ( = ?auto_103076 ?auto_103082 ) ) ( not ( = ?auto_103077 ?auto_103080 ) ) ( not ( = ?auto_103077 ?auto_103082 ) ) ( not ( = ?auto_103078 ?auto_103080 ) ) ( not ( = ?auto_103078 ?auto_103082 ) ) ( not ( = ?auto_103083 ?auto_103080 ) ) ( not ( = ?auto_103083 ?auto_103082 ) ) ( not ( = ?auto_103080 ?auto_103082 ) ) ( ON ?auto_103080 ?auto_103083 ) ( not ( = ?auto_103079 ?auto_103082 ) ) ( not ( = ?auto_103076 ?auto_103079 ) ) ( not ( = ?auto_103077 ?auto_103079 ) ) ( not ( = ?auto_103078 ?auto_103079 ) ) ( not ( = ?auto_103083 ?auto_103079 ) ) ( not ( = ?auto_103080 ?auto_103079 ) ) ( ON ?auto_103079 ?auto_103081 ) ( CLEAR ?auto_103079 ) ( not ( = ?auto_103076 ?auto_103081 ) ) ( not ( = ?auto_103077 ?auto_103081 ) ) ( not ( = ?auto_103078 ?auto_103081 ) ) ( not ( = ?auto_103083 ?auto_103081 ) ) ( not ( = ?auto_103080 ?auto_103081 ) ) ( not ( = ?auto_103082 ?auto_103081 ) ) ( not ( = ?auto_103079 ?auto_103081 ) ) ( HOLDING ?auto_103082 ) ( CLEAR ?auto_103080 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_103076 ?auto_103077 ?auto_103078 ?auto_103083 ?auto_103080 ?auto_103082 )
      ( MAKE-3PILE ?auto_103076 ?auto_103077 ?auto_103078 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_103084 - BLOCK
      ?auto_103085 - BLOCK
      ?auto_103086 - BLOCK
    )
    :vars
    (
      ?auto_103088 - BLOCK
      ?auto_103087 - BLOCK
      ?auto_103091 - BLOCK
      ?auto_103090 - BLOCK
      ?auto_103089 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_103088 ?auto_103086 ) ( ON-TABLE ?auto_103084 ) ( ON ?auto_103085 ?auto_103084 ) ( ON ?auto_103086 ?auto_103085 ) ( not ( = ?auto_103084 ?auto_103085 ) ) ( not ( = ?auto_103084 ?auto_103086 ) ) ( not ( = ?auto_103084 ?auto_103088 ) ) ( not ( = ?auto_103085 ?auto_103086 ) ) ( not ( = ?auto_103085 ?auto_103088 ) ) ( not ( = ?auto_103086 ?auto_103088 ) ) ( not ( = ?auto_103084 ?auto_103087 ) ) ( not ( = ?auto_103084 ?auto_103091 ) ) ( not ( = ?auto_103085 ?auto_103087 ) ) ( not ( = ?auto_103085 ?auto_103091 ) ) ( not ( = ?auto_103086 ?auto_103087 ) ) ( not ( = ?auto_103086 ?auto_103091 ) ) ( not ( = ?auto_103088 ?auto_103087 ) ) ( not ( = ?auto_103088 ?auto_103091 ) ) ( not ( = ?auto_103087 ?auto_103091 ) ) ( ON ?auto_103087 ?auto_103088 ) ( not ( = ?auto_103090 ?auto_103091 ) ) ( not ( = ?auto_103084 ?auto_103090 ) ) ( not ( = ?auto_103085 ?auto_103090 ) ) ( not ( = ?auto_103086 ?auto_103090 ) ) ( not ( = ?auto_103088 ?auto_103090 ) ) ( not ( = ?auto_103087 ?auto_103090 ) ) ( ON ?auto_103090 ?auto_103089 ) ( not ( = ?auto_103084 ?auto_103089 ) ) ( not ( = ?auto_103085 ?auto_103089 ) ) ( not ( = ?auto_103086 ?auto_103089 ) ) ( not ( = ?auto_103088 ?auto_103089 ) ) ( not ( = ?auto_103087 ?auto_103089 ) ) ( not ( = ?auto_103091 ?auto_103089 ) ) ( not ( = ?auto_103090 ?auto_103089 ) ) ( CLEAR ?auto_103087 ) ( ON ?auto_103091 ?auto_103090 ) ( CLEAR ?auto_103091 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_103089 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_103089 ?auto_103090 )
      ( MAKE-3PILE ?auto_103084 ?auto_103085 ?auto_103086 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_103092 - BLOCK
      ?auto_103093 - BLOCK
      ?auto_103094 - BLOCK
    )
    :vars
    (
      ?auto_103099 - BLOCK
      ?auto_103098 - BLOCK
      ?auto_103096 - BLOCK
      ?auto_103095 - BLOCK
      ?auto_103097 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_103099 ?auto_103094 ) ( ON-TABLE ?auto_103092 ) ( ON ?auto_103093 ?auto_103092 ) ( ON ?auto_103094 ?auto_103093 ) ( not ( = ?auto_103092 ?auto_103093 ) ) ( not ( = ?auto_103092 ?auto_103094 ) ) ( not ( = ?auto_103092 ?auto_103099 ) ) ( not ( = ?auto_103093 ?auto_103094 ) ) ( not ( = ?auto_103093 ?auto_103099 ) ) ( not ( = ?auto_103094 ?auto_103099 ) ) ( not ( = ?auto_103092 ?auto_103098 ) ) ( not ( = ?auto_103092 ?auto_103096 ) ) ( not ( = ?auto_103093 ?auto_103098 ) ) ( not ( = ?auto_103093 ?auto_103096 ) ) ( not ( = ?auto_103094 ?auto_103098 ) ) ( not ( = ?auto_103094 ?auto_103096 ) ) ( not ( = ?auto_103099 ?auto_103098 ) ) ( not ( = ?auto_103099 ?auto_103096 ) ) ( not ( = ?auto_103098 ?auto_103096 ) ) ( not ( = ?auto_103095 ?auto_103096 ) ) ( not ( = ?auto_103092 ?auto_103095 ) ) ( not ( = ?auto_103093 ?auto_103095 ) ) ( not ( = ?auto_103094 ?auto_103095 ) ) ( not ( = ?auto_103099 ?auto_103095 ) ) ( not ( = ?auto_103098 ?auto_103095 ) ) ( ON ?auto_103095 ?auto_103097 ) ( not ( = ?auto_103092 ?auto_103097 ) ) ( not ( = ?auto_103093 ?auto_103097 ) ) ( not ( = ?auto_103094 ?auto_103097 ) ) ( not ( = ?auto_103099 ?auto_103097 ) ) ( not ( = ?auto_103098 ?auto_103097 ) ) ( not ( = ?auto_103096 ?auto_103097 ) ) ( not ( = ?auto_103095 ?auto_103097 ) ) ( ON ?auto_103096 ?auto_103095 ) ( CLEAR ?auto_103096 ) ( ON-TABLE ?auto_103097 ) ( HOLDING ?auto_103098 ) ( CLEAR ?auto_103099 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_103092 ?auto_103093 ?auto_103094 ?auto_103099 ?auto_103098 )
      ( MAKE-3PILE ?auto_103092 ?auto_103093 ?auto_103094 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_103100 - BLOCK
      ?auto_103101 - BLOCK
      ?auto_103102 - BLOCK
    )
    :vars
    (
      ?auto_103105 - BLOCK
      ?auto_103103 - BLOCK
      ?auto_103107 - BLOCK
      ?auto_103106 - BLOCK
      ?auto_103104 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_103105 ?auto_103102 ) ( ON-TABLE ?auto_103100 ) ( ON ?auto_103101 ?auto_103100 ) ( ON ?auto_103102 ?auto_103101 ) ( not ( = ?auto_103100 ?auto_103101 ) ) ( not ( = ?auto_103100 ?auto_103102 ) ) ( not ( = ?auto_103100 ?auto_103105 ) ) ( not ( = ?auto_103101 ?auto_103102 ) ) ( not ( = ?auto_103101 ?auto_103105 ) ) ( not ( = ?auto_103102 ?auto_103105 ) ) ( not ( = ?auto_103100 ?auto_103103 ) ) ( not ( = ?auto_103100 ?auto_103107 ) ) ( not ( = ?auto_103101 ?auto_103103 ) ) ( not ( = ?auto_103101 ?auto_103107 ) ) ( not ( = ?auto_103102 ?auto_103103 ) ) ( not ( = ?auto_103102 ?auto_103107 ) ) ( not ( = ?auto_103105 ?auto_103103 ) ) ( not ( = ?auto_103105 ?auto_103107 ) ) ( not ( = ?auto_103103 ?auto_103107 ) ) ( not ( = ?auto_103106 ?auto_103107 ) ) ( not ( = ?auto_103100 ?auto_103106 ) ) ( not ( = ?auto_103101 ?auto_103106 ) ) ( not ( = ?auto_103102 ?auto_103106 ) ) ( not ( = ?auto_103105 ?auto_103106 ) ) ( not ( = ?auto_103103 ?auto_103106 ) ) ( ON ?auto_103106 ?auto_103104 ) ( not ( = ?auto_103100 ?auto_103104 ) ) ( not ( = ?auto_103101 ?auto_103104 ) ) ( not ( = ?auto_103102 ?auto_103104 ) ) ( not ( = ?auto_103105 ?auto_103104 ) ) ( not ( = ?auto_103103 ?auto_103104 ) ) ( not ( = ?auto_103107 ?auto_103104 ) ) ( not ( = ?auto_103106 ?auto_103104 ) ) ( ON ?auto_103107 ?auto_103106 ) ( ON-TABLE ?auto_103104 ) ( CLEAR ?auto_103105 ) ( ON ?auto_103103 ?auto_103107 ) ( CLEAR ?auto_103103 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_103104 ?auto_103106 ?auto_103107 )
      ( MAKE-3PILE ?auto_103100 ?auto_103101 ?auto_103102 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_103124 - BLOCK
      ?auto_103125 - BLOCK
      ?auto_103126 - BLOCK
    )
    :vars
    (
      ?auto_103129 - BLOCK
      ?auto_103128 - BLOCK
      ?auto_103127 - BLOCK
      ?auto_103131 - BLOCK
      ?auto_103130 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_103124 ) ( ON ?auto_103125 ?auto_103124 ) ( not ( = ?auto_103124 ?auto_103125 ) ) ( not ( = ?auto_103124 ?auto_103126 ) ) ( not ( = ?auto_103124 ?auto_103129 ) ) ( not ( = ?auto_103125 ?auto_103126 ) ) ( not ( = ?auto_103125 ?auto_103129 ) ) ( not ( = ?auto_103126 ?auto_103129 ) ) ( not ( = ?auto_103124 ?auto_103128 ) ) ( not ( = ?auto_103124 ?auto_103127 ) ) ( not ( = ?auto_103125 ?auto_103128 ) ) ( not ( = ?auto_103125 ?auto_103127 ) ) ( not ( = ?auto_103126 ?auto_103128 ) ) ( not ( = ?auto_103126 ?auto_103127 ) ) ( not ( = ?auto_103129 ?auto_103128 ) ) ( not ( = ?auto_103129 ?auto_103127 ) ) ( not ( = ?auto_103128 ?auto_103127 ) ) ( not ( = ?auto_103131 ?auto_103127 ) ) ( not ( = ?auto_103124 ?auto_103131 ) ) ( not ( = ?auto_103125 ?auto_103131 ) ) ( not ( = ?auto_103126 ?auto_103131 ) ) ( not ( = ?auto_103129 ?auto_103131 ) ) ( not ( = ?auto_103128 ?auto_103131 ) ) ( ON ?auto_103131 ?auto_103130 ) ( not ( = ?auto_103124 ?auto_103130 ) ) ( not ( = ?auto_103125 ?auto_103130 ) ) ( not ( = ?auto_103126 ?auto_103130 ) ) ( not ( = ?auto_103129 ?auto_103130 ) ) ( not ( = ?auto_103128 ?auto_103130 ) ) ( not ( = ?auto_103127 ?auto_103130 ) ) ( not ( = ?auto_103131 ?auto_103130 ) ) ( ON ?auto_103127 ?auto_103131 ) ( ON-TABLE ?auto_103130 ) ( ON ?auto_103128 ?auto_103127 ) ( ON ?auto_103129 ?auto_103128 ) ( CLEAR ?auto_103129 ) ( HOLDING ?auto_103126 ) ( CLEAR ?auto_103125 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_103124 ?auto_103125 ?auto_103126 ?auto_103129 )
      ( MAKE-3PILE ?auto_103124 ?auto_103125 ?auto_103126 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_103132 - BLOCK
      ?auto_103133 - BLOCK
      ?auto_103134 - BLOCK
    )
    :vars
    (
      ?auto_103139 - BLOCK
      ?auto_103136 - BLOCK
      ?auto_103135 - BLOCK
      ?auto_103137 - BLOCK
      ?auto_103138 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_103132 ) ( ON ?auto_103133 ?auto_103132 ) ( not ( = ?auto_103132 ?auto_103133 ) ) ( not ( = ?auto_103132 ?auto_103134 ) ) ( not ( = ?auto_103132 ?auto_103139 ) ) ( not ( = ?auto_103133 ?auto_103134 ) ) ( not ( = ?auto_103133 ?auto_103139 ) ) ( not ( = ?auto_103134 ?auto_103139 ) ) ( not ( = ?auto_103132 ?auto_103136 ) ) ( not ( = ?auto_103132 ?auto_103135 ) ) ( not ( = ?auto_103133 ?auto_103136 ) ) ( not ( = ?auto_103133 ?auto_103135 ) ) ( not ( = ?auto_103134 ?auto_103136 ) ) ( not ( = ?auto_103134 ?auto_103135 ) ) ( not ( = ?auto_103139 ?auto_103136 ) ) ( not ( = ?auto_103139 ?auto_103135 ) ) ( not ( = ?auto_103136 ?auto_103135 ) ) ( not ( = ?auto_103137 ?auto_103135 ) ) ( not ( = ?auto_103132 ?auto_103137 ) ) ( not ( = ?auto_103133 ?auto_103137 ) ) ( not ( = ?auto_103134 ?auto_103137 ) ) ( not ( = ?auto_103139 ?auto_103137 ) ) ( not ( = ?auto_103136 ?auto_103137 ) ) ( ON ?auto_103137 ?auto_103138 ) ( not ( = ?auto_103132 ?auto_103138 ) ) ( not ( = ?auto_103133 ?auto_103138 ) ) ( not ( = ?auto_103134 ?auto_103138 ) ) ( not ( = ?auto_103139 ?auto_103138 ) ) ( not ( = ?auto_103136 ?auto_103138 ) ) ( not ( = ?auto_103135 ?auto_103138 ) ) ( not ( = ?auto_103137 ?auto_103138 ) ) ( ON ?auto_103135 ?auto_103137 ) ( ON-TABLE ?auto_103138 ) ( ON ?auto_103136 ?auto_103135 ) ( ON ?auto_103139 ?auto_103136 ) ( CLEAR ?auto_103133 ) ( ON ?auto_103134 ?auto_103139 ) ( CLEAR ?auto_103134 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_103138 ?auto_103137 ?auto_103135 ?auto_103136 ?auto_103139 )
      ( MAKE-3PILE ?auto_103132 ?auto_103133 ?auto_103134 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_103140 - BLOCK
      ?auto_103141 - BLOCK
      ?auto_103142 - BLOCK
    )
    :vars
    (
      ?auto_103147 - BLOCK
      ?auto_103146 - BLOCK
      ?auto_103144 - BLOCK
      ?auto_103145 - BLOCK
      ?auto_103143 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_103140 ) ( not ( = ?auto_103140 ?auto_103141 ) ) ( not ( = ?auto_103140 ?auto_103142 ) ) ( not ( = ?auto_103140 ?auto_103147 ) ) ( not ( = ?auto_103141 ?auto_103142 ) ) ( not ( = ?auto_103141 ?auto_103147 ) ) ( not ( = ?auto_103142 ?auto_103147 ) ) ( not ( = ?auto_103140 ?auto_103146 ) ) ( not ( = ?auto_103140 ?auto_103144 ) ) ( not ( = ?auto_103141 ?auto_103146 ) ) ( not ( = ?auto_103141 ?auto_103144 ) ) ( not ( = ?auto_103142 ?auto_103146 ) ) ( not ( = ?auto_103142 ?auto_103144 ) ) ( not ( = ?auto_103147 ?auto_103146 ) ) ( not ( = ?auto_103147 ?auto_103144 ) ) ( not ( = ?auto_103146 ?auto_103144 ) ) ( not ( = ?auto_103145 ?auto_103144 ) ) ( not ( = ?auto_103140 ?auto_103145 ) ) ( not ( = ?auto_103141 ?auto_103145 ) ) ( not ( = ?auto_103142 ?auto_103145 ) ) ( not ( = ?auto_103147 ?auto_103145 ) ) ( not ( = ?auto_103146 ?auto_103145 ) ) ( ON ?auto_103145 ?auto_103143 ) ( not ( = ?auto_103140 ?auto_103143 ) ) ( not ( = ?auto_103141 ?auto_103143 ) ) ( not ( = ?auto_103142 ?auto_103143 ) ) ( not ( = ?auto_103147 ?auto_103143 ) ) ( not ( = ?auto_103146 ?auto_103143 ) ) ( not ( = ?auto_103144 ?auto_103143 ) ) ( not ( = ?auto_103145 ?auto_103143 ) ) ( ON ?auto_103144 ?auto_103145 ) ( ON-TABLE ?auto_103143 ) ( ON ?auto_103146 ?auto_103144 ) ( ON ?auto_103147 ?auto_103146 ) ( ON ?auto_103142 ?auto_103147 ) ( CLEAR ?auto_103142 ) ( HOLDING ?auto_103141 ) ( CLEAR ?auto_103140 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_103140 ?auto_103141 )
      ( MAKE-3PILE ?auto_103140 ?auto_103141 ?auto_103142 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_103148 - BLOCK
      ?auto_103149 - BLOCK
      ?auto_103150 - BLOCK
    )
    :vars
    (
      ?auto_103155 - BLOCK
      ?auto_103153 - BLOCK
      ?auto_103154 - BLOCK
      ?auto_103151 - BLOCK
      ?auto_103152 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_103148 ) ( not ( = ?auto_103148 ?auto_103149 ) ) ( not ( = ?auto_103148 ?auto_103150 ) ) ( not ( = ?auto_103148 ?auto_103155 ) ) ( not ( = ?auto_103149 ?auto_103150 ) ) ( not ( = ?auto_103149 ?auto_103155 ) ) ( not ( = ?auto_103150 ?auto_103155 ) ) ( not ( = ?auto_103148 ?auto_103153 ) ) ( not ( = ?auto_103148 ?auto_103154 ) ) ( not ( = ?auto_103149 ?auto_103153 ) ) ( not ( = ?auto_103149 ?auto_103154 ) ) ( not ( = ?auto_103150 ?auto_103153 ) ) ( not ( = ?auto_103150 ?auto_103154 ) ) ( not ( = ?auto_103155 ?auto_103153 ) ) ( not ( = ?auto_103155 ?auto_103154 ) ) ( not ( = ?auto_103153 ?auto_103154 ) ) ( not ( = ?auto_103151 ?auto_103154 ) ) ( not ( = ?auto_103148 ?auto_103151 ) ) ( not ( = ?auto_103149 ?auto_103151 ) ) ( not ( = ?auto_103150 ?auto_103151 ) ) ( not ( = ?auto_103155 ?auto_103151 ) ) ( not ( = ?auto_103153 ?auto_103151 ) ) ( ON ?auto_103151 ?auto_103152 ) ( not ( = ?auto_103148 ?auto_103152 ) ) ( not ( = ?auto_103149 ?auto_103152 ) ) ( not ( = ?auto_103150 ?auto_103152 ) ) ( not ( = ?auto_103155 ?auto_103152 ) ) ( not ( = ?auto_103153 ?auto_103152 ) ) ( not ( = ?auto_103154 ?auto_103152 ) ) ( not ( = ?auto_103151 ?auto_103152 ) ) ( ON ?auto_103154 ?auto_103151 ) ( ON-TABLE ?auto_103152 ) ( ON ?auto_103153 ?auto_103154 ) ( ON ?auto_103155 ?auto_103153 ) ( ON ?auto_103150 ?auto_103155 ) ( CLEAR ?auto_103148 ) ( ON ?auto_103149 ?auto_103150 ) ( CLEAR ?auto_103149 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_103152 ?auto_103151 ?auto_103154 ?auto_103153 ?auto_103155 ?auto_103150 )
      ( MAKE-3PILE ?auto_103148 ?auto_103149 ?auto_103150 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_103156 - BLOCK
      ?auto_103157 - BLOCK
      ?auto_103158 - BLOCK
    )
    :vars
    (
      ?auto_103163 - BLOCK
      ?auto_103159 - BLOCK
      ?auto_103161 - BLOCK
      ?auto_103160 - BLOCK
      ?auto_103162 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_103156 ?auto_103157 ) ) ( not ( = ?auto_103156 ?auto_103158 ) ) ( not ( = ?auto_103156 ?auto_103163 ) ) ( not ( = ?auto_103157 ?auto_103158 ) ) ( not ( = ?auto_103157 ?auto_103163 ) ) ( not ( = ?auto_103158 ?auto_103163 ) ) ( not ( = ?auto_103156 ?auto_103159 ) ) ( not ( = ?auto_103156 ?auto_103161 ) ) ( not ( = ?auto_103157 ?auto_103159 ) ) ( not ( = ?auto_103157 ?auto_103161 ) ) ( not ( = ?auto_103158 ?auto_103159 ) ) ( not ( = ?auto_103158 ?auto_103161 ) ) ( not ( = ?auto_103163 ?auto_103159 ) ) ( not ( = ?auto_103163 ?auto_103161 ) ) ( not ( = ?auto_103159 ?auto_103161 ) ) ( not ( = ?auto_103160 ?auto_103161 ) ) ( not ( = ?auto_103156 ?auto_103160 ) ) ( not ( = ?auto_103157 ?auto_103160 ) ) ( not ( = ?auto_103158 ?auto_103160 ) ) ( not ( = ?auto_103163 ?auto_103160 ) ) ( not ( = ?auto_103159 ?auto_103160 ) ) ( ON ?auto_103160 ?auto_103162 ) ( not ( = ?auto_103156 ?auto_103162 ) ) ( not ( = ?auto_103157 ?auto_103162 ) ) ( not ( = ?auto_103158 ?auto_103162 ) ) ( not ( = ?auto_103163 ?auto_103162 ) ) ( not ( = ?auto_103159 ?auto_103162 ) ) ( not ( = ?auto_103161 ?auto_103162 ) ) ( not ( = ?auto_103160 ?auto_103162 ) ) ( ON ?auto_103161 ?auto_103160 ) ( ON-TABLE ?auto_103162 ) ( ON ?auto_103159 ?auto_103161 ) ( ON ?auto_103163 ?auto_103159 ) ( ON ?auto_103158 ?auto_103163 ) ( ON ?auto_103157 ?auto_103158 ) ( CLEAR ?auto_103157 ) ( HOLDING ?auto_103156 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_103156 )
      ( MAKE-3PILE ?auto_103156 ?auto_103157 ?auto_103158 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_103164 - BLOCK
      ?auto_103165 - BLOCK
      ?auto_103166 - BLOCK
    )
    :vars
    (
      ?auto_103171 - BLOCK
      ?auto_103168 - BLOCK
      ?auto_103169 - BLOCK
      ?auto_103167 - BLOCK
      ?auto_103170 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_103164 ?auto_103165 ) ) ( not ( = ?auto_103164 ?auto_103166 ) ) ( not ( = ?auto_103164 ?auto_103171 ) ) ( not ( = ?auto_103165 ?auto_103166 ) ) ( not ( = ?auto_103165 ?auto_103171 ) ) ( not ( = ?auto_103166 ?auto_103171 ) ) ( not ( = ?auto_103164 ?auto_103168 ) ) ( not ( = ?auto_103164 ?auto_103169 ) ) ( not ( = ?auto_103165 ?auto_103168 ) ) ( not ( = ?auto_103165 ?auto_103169 ) ) ( not ( = ?auto_103166 ?auto_103168 ) ) ( not ( = ?auto_103166 ?auto_103169 ) ) ( not ( = ?auto_103171 ?auto_103168 ) ) ( not ( = ?auto_103171 ?auto_103169 ) ) ( not ( = ?auto_103168 ?auto_103169 ) ) ( not ( = ?auto_103167 ?auto_103169 ) ) ( not ( = ?auto_103164 ?auto_103167 ) ) ( not ( = ?auto_103165 ?auto_103167 ) ) ( not ( = ?auto_103166 ?auto_103167 ) ) ( not ( = ?auto_103171 ?auto_103167 ) ) ( not ( = ?auto_103168 ?auto_103167 ) ) ( ON ?auto_103167 ?auto_103170 ) ( not ( = ?auto_103164 ?auto_103170 ) ) ( not ( = ?auto_103165 ?auto_103170 ) ) ( not ( = ?auto_103166 ?auto_103170 ) ) ( not ( = ?auto_103171 ?auto_103170 ) ) ( not ( = ?auto_103168 ?auto_103170 ) ) ( not ( = ?auto_103169 ?auto_103170 ) ) ( not ( = ?auto_103167 ?auto_103170 ) ) ( ON ?auto_103169 ?auto_103167 ) ( ON-TABLE ?auto_103170 ) ( ON ?auto_103168 ?auto_103169 ) ( ON ?auto_103171 ?auto_103168 ) ( ON ?auto_103166 ?auto_103171 ) ( ON ?auto_103165 ?auto_103166 ) ( ON ?auto_103164 ?auto_103165 ) ( CLEAR ?auto_103164 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_103170 ?auto_103167 ?auto_103169 ?auto_103168 ?auto_103171 ?auto_103166 ?auto_103165 )
      ( MAKE-3PILE ?auto_103164 ?auto_103165 ?auto_103166 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_103176 - BLOCK
      ?auto_103177 - BLOCK
      ?auto_103178 - BLOCK
      ?auto_103179 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_103179 ) ( CLEAR ?auto_103178 ) ( ON-TABLE ?auto_103176 ) ( ON ?auto_103177 ?auto_103176 ) ( ON ?auto_103178 ?auto_103177 ) ( not ( = ?auto_103176 ?auto_103177 ) ) ( not ( = ?auto_103176 ?auto_103178 ) ) ( not ( = ?auto_103176 ?auto_103179 ) ) ( not ( = ?auto_103177 ?auto_103178 ) ) ( not ( = ?auto_103177 ?auto_103179 ) ) ( not ( = ?auto_103178 ?auto_103179 ) ) )
    :subtasks
    ( ( !STACK ?auto_103179 ?auto_103178 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_103180 - BLOCK
      ?auto_103181 - BLOCK
      ?auto_103182 - BLOCK
      ?auto_103183 - BLOCK
    )
    :vars
    (
      ?auto_103184 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_103182 ) ( ON-TABLE ?auto_103180 ) ( ON ?auto_103181 ?auto_103180 ) ( ON ?auto_103182 ?auto_103181 ) ( not ( = ?auto_103180 ?auto_103181 ) ) ( not ( = ?auto_103180 ?auto_103182 ) ) ( not ( = ?auto_103180 ?auto_103183 ) ) ( not ( = ?auto_103181 ?auto_103182 ) ) ( not ( = ?auto_103181 ?auto_103183 ) ) ( not ( = ?auto_103182 ?auto_103183 ) ) ( ON ?auto_103183 ?auto_103184 ) ( CLEAR ?auto_103183 ) ( HAND-EMPTY ) ( not ( = ?auto_103180 ?auto_103184 ) ) ( not ( = ?auto_103181 ?auto_103184 ) ) ( not ( = ?auto_103182 ?auto_103184 ) ) ( not ( = ?auto_103183 ?auto_103184 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_103183 ?auto_103184 )
      ( MAKE-4PILE ?auto_103180 ?auto_103181 ?auto_103182 ?auto_103183 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_103185 - BLOCK
      ?auto_103186 - BLOCK
      ?auto_103187 - BLOCK
      ?auto_103188 - BLOCK
    )
    :vars
    (
      ?auto_103189 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_103185 ) ( ON ?auto_103186 ?auto_103185 ) ( not ( = ?auto_103185 ?auto_103186 ) ) ( not ( = ?auto_103185 ?auto_103187 ) ) ( not ( = ?auto_103185 ?auto_103188 ) ) ( not ( = ?auto_103186 ?auto_103187 ) ) ( not ( = ?auto_103186 ?auto_103188 ) ) ( not ( = ?auto_103187 ?auto_103188 ) ) ( ON ?auto_103188 ?auto_103189 ) ( CLEAR ?auto_103188 ) ( not ( = ?auto_103185 ?auto_103189 ) ) ( not ( = ?auto_103186 ?auto_103189 ) ) ( not ( = ?auto_103187 ?auto_103189 ) ) ( not ( = ?auto_103188 ?auto_103189 ) ) ( HOLDING ?auto_103187 ) ( CLEAR ?auto_103186 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_103185 ?auto_103186 ?auto_103187 )
      ( MAKE-4PILE ?auto_103185 ?auto_103186 ?auto_103187 ?auto_103188 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_103190 - BLOCK
      ?auto_103191 - BLOCK
      ?auto_103192 - BLOCK
      ?auto_103193 - BLOCK
    )
    :vars
    (
      ?auto_103194 - BLOCK
      ?auto_103195 - BLOCK
      ?auto_103196 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_103190 ) ( ON ?auto_103191 ?auto_103190 ) ( not ( = ?auto_103190 ?auto_103191 ) ) ( not ( = ?auto_103190 ?auto_103192 ) ) ( not ( = ?auto_103190 ?auto_103193 ) ) ( not ( = ?auto_103191 ?auto_103192 ) ) ( not ( = ?auto_103191 ?auto_103193 ) ) ( not ( = ?auto_103192 ?auto_103193 ) ) ( ON ?auto_103193 ?auto_103194 ) ( not ( = ?auto_103190 ?auto_103194 ) ) ( not ( = ?auto_103191 ?auto_103194 ) ) ( not ( = ?auto_103192 ?auto_103194 ) ) ( not ( = ?auto_103193 ?auto_103194 ) ) ( CLEAR ?auto_103191 ) ( ON ?auto_103192 ?auto_103193 ) ( CLEAR ?auto_103192 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_103195 ) ( ON ?auto_103196 ?auto_103195 ) ( ON ?auto_103194 ?auto_103196 ) ( not ( = ?auto_103195 ?auto_103196 ) ) ( not ( = ?auto_103195 ?auto_103194 ) ) ( not ( = ?auto_103195 ?auto_103193 ) ) ( not ( = ?auto_103195 ?auto_103192 ) ) ( not ( = ?auto_103196 ?auto_103194 ) ) ( not ( = ?auto_103196 ?auto_103193 ) ) ( not ( = ?auto_103196 ?auto_103192 ) ) ( not ( = ?auto_103190 ?auto_103195 ) ) ( not ( = ?auto_103190 ?auto_103196 ) ) ( not ( = ?auto_103191 ?auto_103195 ) ) ( not ( = ?auto_103191 ?auto_103196 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_103195 ?auto_103196 ?auto_103194 ?auto_103193 )
      ( MAKE-4PILE ?auto_103190 ?auto_103191 ?auto_103192 ?auto_103193 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_103197 - BLOCK
      ?auto_103198 - BLOCK
      ?auto_103199 - BLOCK
      ?auto_103200 - BLOCK
    )
    :vars
    (
      ?auto_103201 - BLOCK
      ?auto_103203 - BLOCK
      ?auto_103202 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_103197 ) ( not ( = ?auto_103197 ?auto_103198 ) ) ( not ( = ?auto_103197 ?auto_103199 ) ) ( not ( = ?auto_103197 ?auto_103200 ) ) ( not ( = ?auto_103198 ?auto_103199 ) ) ( not ( = ?auto_103198 ?auto_103200 ) ) ( not ( = ?auto_103199 ?auto_103200 ) ) ( ON ?auto_103200 ?auto_103201 ) ( not ( = ?auto_103197 ?auto_103201 ) ) ( not ( = ?auto_103198 ?auto_103201 ) ) ( not ( = ?auto_103199 ?auto_103201 ) ) ( not ( = ?auto_103200 ?auto_103201 ) ) ( ON ?auto_103199 ?auto_103200 ) ( CLEAR ?auto_103199 ) ( ON-TABLE ?auto_103203 ) ( ON ?auto_103202 ?auto_103203 ) ( ON ?auto_103201 ?auto_103202 ) ( not ( = ?auto_103203 ?auto_103202 ) ) ( not ( = ?auto_103203 ?auto_103201 ) ) ( not ( = ?auto_103203 ?auto_103200 ) ) ( not ( = ?auto_103203 ?auto_103199 ) ) ( not ( = ?auto_103202 ?auto_103201 ) ) ( not ( = ?auto_103202 ?auto_103200 ) ) ( not ( = ?auto_103202 ?auto_103199 ) ) ( not ( = ?auto_103197 ?auto_103203 ) ) ( not ( = ?auto_103197 ?auto_103202 ) ) ( not ( = ?auto_103198 ?auto_103203 ) ) ( not ( = ?auto_103198 ?auto_103202 ) ) ( HOLDING ?auto_103198 ) ( CLEAR ?auto_103197 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_103197 ?auto_103198 )
      ( MAKE-4PILE ?auto_103197 ?auto_103198 ?auto_103199 ?auto_103200 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_103204 - BLOCK
      ?auto_103205 - BLOCK
      ?auto_103206 - BLOCK
      ?auto_103207 - BLOCK
    )
    :vars
    (
      ?auto_103209 - BLOCK
      ?auto_103210 - BLOCK
      ?auto_103208 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_103204 ) ( not ( = ?auto_103204 ?auto_103205 ) ) ( not ( = ?auto_103204 ?auto_103206 ) ) ( not ( = ?auto_103204 ?auto_103207 ) ) ( not ( = ?auto_103205 ?auto_103206 ) ) ( not ( = ?auto_103205 ?auto_103207 ) ) ( not ( = ?auto_103206 ?auto_103207 ) ) ( ON ?auto_103207 ?auto_103209 ) ( not ( = ?auto_103204 ?auto_103209 ) ) ( not ( = ?auto_103205 ?auto_103209 ) ) ( not ( = ?auto_103206 ?auto_103209 ) ) ( not ( = ?auto_103207 ?auto_103209 ) ) ( ON ?auto_103206 ?auto_103207 ) ( ON-TABLE ?auto_103210 ) ( ON ?auto_103208 ?auto_103210 ) ( ON ?auto_103209 ?auto_103208 ) ( not ( = ?auto_103210 ?auto_103208 ) ) ( not ( = ?auto_103210 ?auto_103209 ) ) ( not ( = ?auto_103210 ?auto_103207 ) ) ( not ( = ?auto_103210 ?auto_103206 ) ) ( not ( = ?auto_103208 ?auto_103209 ) ) ( not ( = ?auto_103208 ?auto_103207 ) ) ( not ( = ?auto_103208 ?auto_103206 ) ) ( not ( = ?auto_103204 ?auto_103210 ) ) ( not ( = ?auto_103204 ?auto_103208 ) ) ( not ( = ?auto_103205 ?auto_103210 ) ) ( not ( = ?auto_103205 ?auto_103208 ) ) ( CLEAR ?auto_103204 ) ( ON ?auto_103205 ?auto_103206 ) ( CLEAR ?auto_103205 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_103210 ?auto_103208 ?auto_103209 ?auto_103207 ?auto_103206 )
      ( MAKE-4PILE ?auto_103204 ?auto_103205 ?auto_103206 ?auto_103207 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_103211 - BLOCK
      ?auto_103212 - BLOCK
      ?auto_103213 - BLOCK
      ?auto_103214 - BLOCK
    )
    :vars
    (
      ?auto_103215 - BLOCK
      ?auto_103217 - BLOCK
      ?auto_103216 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_103211 ?auto_103212 ) ) ( not ( = ?auto_103211 ?auto_103213 ) ) ( not ( = ?auto_103211 ?auto_103214 ) ) ( not ( = ?auto_103212 ?auto_103213 ) ) ( not ( = ?auto_103212 ?auto_103214 ) ) ( not ( = ?auto_103213 ?auto_103214 ) ) ( ON ?auto_103214 ?auto_103215 ) ( not ( = ?auto_103211 ?auto_103215 ) ) ( not ( = ?auto_103212 ?auto_103215 ) ) ( not ( = ?auto_103213 ?auto_103215 ) ) ( not ( = ?auto_103214 ?auto_103215 ) ) ( ON ?auto_103213 ?auto_103214 ) ( ON-TABLE ?auto_103217 ) ( ON ?auto_103216 ?auto_103217 ) ( ON ?auto_103215 ?auto_103216 ) ( not ( = ?auto_103217 ?auto_103216 ) ) ( not ( = ?auto_103217 ?auto_103215 ) ) ( not ( = ?auto_103217 ?auto_103214 ) ) ( not ( = ?auto_103217 ?auto_103213 ) ) ( not ( = ?auto_103216 ?auto_103215 ) ) ( not ( = ?auto_103216 ?auto_103214 ) ) ( not ( = ?auto_103216 ?auto_103213 ) ) ( not ( = ?auto_103211 ?auto_103217 ) ) ( not ( = ?auto_103211 ?auto_103216 ) ) ( not ( = ?auto_103212 ?auto_103217 ) ) ( not ( = ?auto_103212 ?auto_103216 ) ) ( ON ?auto_103212 ?auto_103213 ) ( CLEAR ?auto_103212 ) ( HOLDING ?auto_103211 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_103211 )
      ( MAKE-4PILE ?auto_103211 ?auto_103212 ?auto_103213 ?auto_103214 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_103218 - BLOCK
      ?auto_103219 - BLOCK
      ?auto_103220 - BLOCK
      ?auto_103221 - BLOCK
    )
    :vars
    (
      ?auto_103222 - BLOCK
      ?auto_103224 - BLOCK
      ?auto_103223 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_103218 ?auto_103219 ) ) ( not ( = ?auto_103218 ?auto_103220 ) ) ( not ( = ?auto_103218 ?auto_103221 ) ) ( not ( = ?auto_103219 ?auto_103220 ) ) ( not ( = ?auto_103219 ?auto_103221 ) ) ( not ( = ?auto_103220 ?auto_103221 ) ) ( ON ?auto_103221 ?auto_103222 ) ( not ( = ?auto_103218 ?auto_103222 ) ) ( not ( = ?auto_103219 ?auto_103222 ) ) ( not ( = ?auto_103220 ?auto_103222 ) ) ( not ( = ?auto_103221 ?auto_103222 ) ) ( ON ?auto_103220 ?auto_103221 ) ( ON-TABLE ?auto_103224 ) ( ON ?auto_103223 ?auto_103224 ) ( ON ?auto_103222 ?auto_103223 ) ( not ( = ?auto_103224 ?auto_103223 ) ) ( not ( = ?auto_103224 ?auto_103222 ) ) ( not ( = ?auto_103224 ?auto_103221 ) ) ( not ( = ?auto_103224 ?auto_103220 ) ) ( not ( = ?auto_103223 ?auto_103222 ) ) ( not ( = ?auto_103223 ?auto_103221 ) ) ( not ( = ?auto_103223 ?auto_103220 ) ) ( not ( = ?auto_103218 ?auto_103224 ) ) ( not ( = ?auto_103218 ?auto_103223 ) ) ( not ( = ?auto_103219 ?auto_103224 ) ) ( not ( = ?auto_103219 ?auto_103223 ) ) ( ON ?auto_103219 ?auto_103220 ) ( ON ?auto_103218 ?auto_103219 ) ( CLEAR ?auto_103218 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_103224 ?auto_103223 ?auto_103222 ?auto_103221 ?auto_103220 ?auto_103219 )
      ( MAKE-4PILE ?auto_103218 ?auto_103219 ?auto_103220 ?auto_103221 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_103225 - BLOCK
      ?auto_103226 - BLOCK
      ?auto_103227 - BLOCK
      ?auto_103228 - BLOCK
    )
    :vars
    (
      ?auto_103230 - BLOCK
      ?auto_103229 - BLOCK
      ?auto_103231 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_103225 ?auto_103226 ) ) ( not ( = ?auto_103225 ?auto_103227 ) ) ( not ( = ?auto_103225 ?auto_103228 ) ) ( not ( = ?auto_103226 ?auto_103227 ) ) ( not ( = ?auto_103226 ?auto_103228 ) ) ( not ( = ?auto_103227 ?auto_103228 ) ) ( ON ?auto_103228 ?auto_103230 ) ( not ( = ?auto_103225 ?auto_103230 ) ) ( not ( = ?auto_103226 ?auto_103230 ) ) ( not ( = ?auto_103227 ?auto_103230 ) ) ( not ( = ?auto_103228 ?auto_103230 ) ) ( ON ?auto_103227 ?auto_103228 ) ( ON-TABLE ?auto_103229 ) ( ON ?auto_103231 ?auto_103229 ) ( ON ?auto_103230 ?auto_103231 ) ( not ( = ?auto_103229 ?auto_103231 ) ) ( not ( = ?auto_103229 ?auto_103230 ) ) ( not ( = ?auto_103229 ?auto_103228 ) ) ( not ( = ?auto_103229 ?auto_103227 ) ) ( not ( = ?auto_103231 ?auto_103230 ) ) ( not ( = ?auto_103231 ?auto_103228 ) ) ( not ( = ?auto_103231 ?auto_103227 ) ) ( not ( = ?auto_103225 ?auto_103229 ) ) ( not ( = ?auto_103225 ?auto_103231 ) ) ( not ( = ?auto_103226 ?auto_103229 ) ) ( not ( = ?auto_103226 ?auto_103231 ) ) ( ON ?auto_103226 ?auto_103227 ) ( HOLDING ?auto_103225 ) ( CLEAR ?auto_103226 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_103229 ?auto_103231 ?auto_103230 ?auto_103228 ?auto_103227 ?auto_103226 ?auto_103225 )
      ( MAKE-4PILE ?auto_103225 ?auto_103226 ?auto_103227 ?auto_103228 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_103232 - BLOCK
      ?auto_103233 - BLOCK
      ?auto_103234 - BLOCK
      ?auto_103235 - BLOCK
    )
    :vars
    (
      ?auto_103236 - BLOCK
      ?auto_103238 - BLOCK
      ?auto_103237 - BLOCK
      ?auto_103239 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_103232 ?auto_103233 ) ) ( not ( = ?auto_103232 ?auto_103234 ) ) ( not ( = ?auto_103232 ?auto_103235 ) ) ( not ( = ?auto_103233 ?auto_103234 ) ) ( not ( = ?auto_103233 ?auto_103235 ) ) ( not ( = ?auto_103234 ?auto_103235 ) ) ( ON ?auto_103235 ?auto_103236 ) ( not ( = ?auto_103232 ?auto_103236 ) ) ( not ( = ?auto_103233 ?auto_103236 ) ) ( not ( = ?auto_103234 ?auto_103236 ) ) ( not ( = ?auto_103235 ?auto_103236 ) ) ( ON ?auto_103234 ?auto_103235 ) ( ON-TABLE ?auto_103238 ) ( ON ?auto_103237 ?auto_103238 ) ( ON ?auto_103236 ?auto_103237 ) ( not ( = ?auto_103238 ?auto_103237 ) ) ( not ( = ?auto_103238 ?auto_103236 ) ) ( not ( = ?auto_103238 ?auto_103235 ) ) ( not ( = ?auto_103238 ?auto_103234 ) ) ( not ( = ?auto_103237 ?auto_103236 ) ) ( not ( = ?auto_103237 ?auto_103235 ) ) ( not ( = ?auto_103237 ?auto_103234 ) ) ( not ( = ?auto_103232 ?auto_103238 ) ) ( not ( = ?auto_103232 ?auto_103237 ) ) ( not ( = ?auto_103233 ?auto_103238 ) ) ( not ( = ?auto_103233 ?auto_103237 ) ) ( ON ?auto_103233 ?auto_103234 ) ( CLEAR ?auto_103233 ) ( ON ?auto_103232 ?auto_103239 ) ( CLEAR ?auto_103232 ) ( HAND-EMPTY ) ( not ( = ?auto_103232 ?auto_103239 ) ) ( not ( = ?auto_103233 ?auto_103239 ) ) ( not ( = ?auto_103234 ?auto_103239 ) ) ( not ( = ?auto_103235 ?auto_103239 ) ) ( not ( = ?auto_103236 ?auto_103239 ) ) ( not ( = ?auto_103238 ?auto_103239 ) ) ( not ( = ?auto_103237 ?auto_103239 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_103232 ?auto_103239 )
      ( MAKE-4PILE ?auto_103232 ?auto_103233 ?auto_103234 ?auto_103235 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_103240 - BLOCK
      ?auto_103241 - BLOCK
      ?auto_103242 - BLOCK
      ?auto_103243 - BLOCK
    )
    :vars
    (
      ?auto_103245 - BLOCK
      ?auto_103246 - BLOCK
      ?auto_103247 - BLOCK
      ?auto_103244 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_103240 ?auto_103241 ) ) ( not ( = ?auto_103240 ?auto_103242 ) ) ( not ( = ?auto_103240 ?auto_103243 ) ) ( not ( = ?auto_103241 ?auto_103242 ) ) ( not ( = ?auto_103241 ?auto_103243 ) ) ( not ( = ?auto_103242 ?auto_103243 ) ) ( ON ?auto_103243 ?auto_103245 ) ( not ( = ?auto_103240 ?auto_103245 ) ) ( not ( = ?auto_103241 ?auto_103245 ) ) ( not ( = ?auto_103242 ?auto_103245 ) ) ( not ( = ?auto_103243 ?auto_103245 ) ) ( ON ?auto_103242 ?auto_103243 ) ( ON-TABLE ?auto_103246 ) ( ON ?auto_103247 ?auto_103246 ) ( ON ?auto_103245 ?auto_103247 ) ( not ( = ?auto_103246 ?auto_103247 ) ) ( not ( = ?auto_103246 ?auto_103245 ) ) ( not ( = ?auto_103246 ?auto_103243 ) ) ( not ( = ?auto_103246 ?auto_103242 ) ) ( not ( = ?auto_103247 ?auto_103245 ) ) ( not ( = ?auto_103247 ?auto_103243 ) ) ( not ( = ?auto_103247 ?auto_103242 ) ) ( not ( = ?auto_103240 ?auto_103246 ) ) ( not ( = ?auto_103240 ?auto_103247 ) ) ( not ( = ?auto_103241 ?auto_103246 ) ) ( not ( = ?auto_103241 ?auto_103247 ) ) ( ON ?auto_103240 ?auto_103244 ) ( CLEAR ?auto_103240 ) ( not ( = ?auto_103240 ?auto_103244 ) ) ( not ( = ?auto_103241 ?auto_103244 ) ) ( not ( = ?auto_103242 ?auto_103244 ) ) ( not ( = ?auto_103243 ?auto_103244 ) ) ( not ( = ?auto_103245 ?auto_103244 ) ) ( not ( = ?auto_103246 ?auto_103244 ) ) ( not ( = ?auto_103247 ?auto_103244 ) ) ( HOLDING ?auto_103241 ) ( CLEAR ?auto_103242 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_103246 ?auto_103247 ?auto_103245 ?auto_103243 ?auto_103242 ?auto_103241 )
      ( MAKE-4PILE ?auto_103240 ?auto_103241 ?auto_103242 ?auto_103243 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_103248 - BLOCK
      ?auto_103249 - BLOCK
      ?auto_103250 - BLOCK
      ?auto_103251 - BLOCK
    )
    :vars
    (
      ?auto_103252 - BLOCK
      ?auto_103255 - BLOCK
      ?auto_103253 - BLOCK
      ?auto_103254 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_103248 ?auto_103249 ) ) ( not ( = ?auto_103248 ?auto_103250 ) ) ( not ( = ?auto_103248 ?auto_103251 ) ) ( not ( = ?auto_103249 ?auto_103250 ) ) ( not ( = ?auto_103249 ?auto_103251 ) ) ( not ( = ?auto_103250 ?auto_103251 ) ) ( ON ?auto_103251 ?auto_103252 ) ( not ( = ?auto_103248 ?auto_103252 ) ) ( not ( = ?auto_103249 ?auto_103252 ) ) ( not ( = ?auto_103250 ?auto_103252 ) ) ( not ( = ?auto_103251 ?auto_103252 ) ) ( ON ?auto_103250 ?auto_103251 ) ( ON-TABLE ?auto_103255 ) ( ON ?auto_103253 ?auto_103255 ) ( ON ?auto_103252 ?auto_103253 ) ( not ( = ?auto_103255 ?auto_103253 ) ) ( not ( = ?auto_103255 ?auto_103252 ) ) ( not ( = ?auto_103255 ?auto_103251 ) ) ( not ( = ?auto_103255 ?auto_103250 ) ) ( not ( = ?auto_103253 ?auto_103252 ) ) ( not ( = ?auto_103253 ?auto_103251 ) ) ( not ( = ?auto_103253 ?auto_103250 ) ) ( not ( = ?auto_103248 ?auto_103255 ) ) ( not ( = ?auto_103248 ?auto_103253 ) ) ( not ( = ?auto_103249 ?auto_103255 ) ) ( not ( = ?auto_103249 ?auto_103253 ) ) ( ON ?auto_103248 ?auto_103254 ) ( not ( = ?auto_103248 ?auto_103254 ) ) ( not ( = ?auto_103249 ?auto_103254 ) ) ( not ( = ?auto_103250 ?auto_103254 ) ) ( not ( = ?auto_103251 ?auto_103254 ) ) ( not ( = ?auto_103252 ?auto_103254 ) ) ( not ( = ?auto_103255 ?auto_103254 ) ) ( not ( = ?auto_103253 ?auto_103254 ) ) ( CLEAR ?auto_103250 ) ( ON ?auto_103249 ?auto_103248 ) ( CLEAR ?auto_103249 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_103254 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_103254 ?auto_103248 )
      ( MAKE-4PILE ?auto_103248 ?auto_103249 ?auto_103250 ?auto_103251 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_103256 - BLOCK
      ?auto_103257 - BLOCK
      ?auto_103258 - BLOCK
      ?auto_103259 - BLOCK
    )
    :vars
    (
      ?auto_103263 - BLOCK
      ?auto_103261 - BLOCK
      ?auto_103260 - BLOCK
      ?auto_103262 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_103256 ?auto_103257 ) ) ( not ( = ?auto_103256 ?auto_103258 ) ) ( not ( = ?auto_103256 ?auto_103259 ) ) ( not ( = ?auto_103257 ?auto_103258 ) ) ( not ( = ?auto_103257 ?auto_103259 ) ) ( not ( = ?auto_103258 ?auto_103259 ) ) ( ON ?auto_103259 ?auto_103263 ) ( not ( = ?auto_103256 ?auto_103263 ) ) ( not ( = ?auto_103257 ?auto_103263 ) ) ( not ( = ?auto_103258 ?auto_103263 ) ) ( not ( = ?auto_103259 ?auto_103263 ) ) ( ON-TABLE ?auto_103261 ) ( ON ?auto_103260 ?auto_103261 ) ( ON ?auto_103263 ?auto_103260 ) ( not ( = ?auto_103261 ?auto_103260 ) ) ( not ( = ?auto_103261 ?auto_103263 ) ) ( not ( = ?auto_103261 ?auto_103259 ) ) ( not ( = ?auto_103261 ?auto_103258 ) ) ( not ( = ?auto_103260 ?auto_103263 ) ) ( not ( = ?auto_103260 ?auto_103259 ) ) ( not ( = ?auto_103260 ?auto_103258 ) ) ( not ( = ?auto_103256 ?auto_103261 ) ) ( not ( = ?auto_103256 ?auto_103260 ) ) ( not ( = ?auto_103257 ?auto_103261 ) ) ( not ( = ?auto_103257 ?auto_103260 ) ) ( ON ?auto_103256 ?auto_103262 ) ( not ( = ?auto_103256 ?auto_103262 ) ) ( not ( = ?auto_103257 ?auto_103262 ) ) ( not ( = ?auto_103258 ?auto_103262 ) ) ( not ( = ?auto_103259 ?auto_103262 ) ) ( not ( = ?auto_103263 ?auto_103262 ) ) ( not ( = ?auto_103261 ?auto_103262 ) ) ( not ( = ?auto_103260 ?auto_103262 ) ) ( ON ?auto_103257 ?auto_103256 ) ( CLEAR ?auto_103257 ) ( ON-TABLE ?auto_103262 ) ( HOLDING ?auto_103258 ) ( CLEAR ?auto_103259 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_103261 ?auto_103260 ?auto_103263 ?auto_103259 ?auto_103258 )
      ( MAKE-4PILE ?auto_103256 ?auto_103257 ?auto_103258 ?auto_103259 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_103264 - BLOCK
      ?auto_103265 - BLOCK
      ?auto_103266 - BLOCK
      ?auto_103267 - BLOCK
    )
    :vars
    (
      ?auto_103271 - BLOCK
      ?auto_103268 - BLOCK
      ?auto_103270 - BLOCK
      ?auto_103269 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_103264 ?auto_103265 ) ) ( not ( = ?auto_103264 ?auto_103266 ) ) ( not ( = ?auto_103264 ?auto_103267 ) ) ( not ( = ?auto_103265 ?auto_103266 ) ) ( not ( = ?auto_103265 ?auto_103267 ) ) ( not ( = ?auto_103266 ?auto_103267 ) ) ( ON ?auto_103267 ?auto_103271 ) ( not ( = ?auto_103264 ?auto_103271 ) ) ( not ( = ?auto_103265 ?auto_103271 ) ) ( not ( = ?auto_103266 ?auto_103271 ) ) ( not ( = ?auto_103267 ?auto_103271 ) ) ( ON-TABLE ?auto_103268 ) ( ON ?auto_103270 ?auto_103268 ) ( ON ?auto_103271 ?auto_103270 ) ( not ( = ?auto_103268 ?auto_103270 ) ) ( not ( = ?auto_103268 ?auto_103271 ) ) ( not ( = ?auto_103268 ?auto_103267 ) ) ( not ( = ?auto_103268 ?auto_103266 ) ) ( not ( = ?auto_103270 ?auto_103271 ) ) ( not ( = ?auto_103270 ?auto_103267 ) ) ( not ( = ?auto_103270 ?auto_103266 ) ) ( not ( = ?auto_103264 ?auto_103268 ) ) ( not ( = ?auto_103264 ?auto_103270 ) ) ( not ( = ?auto_103265 ?auto_103268 ) ) ( not ( = ?auto_103265 ?auto_103270 ) ) ( ON ?auto_103264 ?auto_103269 ) ( not ( = ?auto_103264 ?auto_103269 ) ) ( not ( = ?auto_103265 ?auto_103269 ) ) ( not ( = ?auto_103266 ?auto_103269 ) ) ( not ( = ?auto_103267 ?auto_103269 ) ) ( not ( = ?auto_103271 ?auto_103269 ) ) ( not ( = ?auto_103268 ?auto_103269 ) ) ( not ( = ?auto_103270 ?auto_103269 ) ) ( ON ?auto_103265 ?auto_103264 ) ( ON-TABLE ?auto_103269 ) ( CLEAR ?auto_103267 ) ( ON ?auto_103266 ?auto_103265 ) ( CLEAR ?auto_103266 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_103269 ?auto_103264 ?auto_103265 )
      ( MAKE-4PILE ?auto_103264 ?auto_103265 ?auto_103266 ?auto_103267 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_103272 - BLOCK
      ?auto_103273 - BLOCK
      ?auto_103274 - BLOCK
      ?auto_103275 - BLOCK
    )
    :vars
    (
      ?auto_103279 - BLOCK
      ?auto_103276 - BLOCK
      ?auto_103278 - BLOCK
      ?auto_103277 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_103272 ?auto_103273 ) ) ( not ( = ?auto_103272 ?auto_103274 ) ) ( not ( = ?auto_103272 ?auto_103275 ) ) ( not ( = ?auto_103273 ?auto_103274 ) ) ( not ( = ?auto_103273 ?auto_103275 ) ) ( not ( = ?auto_103274 ?auto_103275 ) ) ( not ( = ?auto_103272 ?auto_103279 ) ) ( not ( = ?auto_103273 ?auto_103279 ) ) ( not ( = ?auto_103274 ?auto_103279 ) ) ( not ( = ?auto_103275 ?auto_103279 ) ) ( ON-TABLE ?auto_103276 ) ( ON ?auto_103278 ?auto_103276 ) ( ON ?auto_103279 ?auto_103278 ) ( not ( = ?auto_103276 ?auto_103278 ) ) ( not ( = ?auto_103276 ?auto_103279 ) ) ( not ( = ?auto_103276 ?auto_103275 ) ) ( not ( = ?auto_103276 ?auto_103274 ) ) ( not ( = ?auto_103278 ?auto_103279 ) ) ( not ( = ?auto_103278 ?auto_103275 ) ) ( not ( = ?auto_103278 ?auto_103274 ) ) ( not ( = ?auto_103272 ?auto_103276 ) ) ( not ( = ?auto_103272 ?auto_103278 ) ) ( not ( = ?auto_103273 ?auto_103276 ) ) ( not ( = ?auto_103273 ?auto_103278 ) ) ( ON ?auto_103272 ?auto_103277 ) ( not ( = ?auto_103272 ?auto_103277 ) ) ( not ( = ?auto_103273 ?auto_103277 ) ) ( not ( = ?auto_103274 ?auto_103277 ) ) ( not ( = ?auto_103275 ?auto_103277 ) ) ( not ( = ?auto_103279 ?auto_103277 ) ) ( not ( = ?auto_103276 ?auto_103277 ) ) ( not ( = ?auto_103278 ?auto_103277 ) ) ( ON ?auto_103273 ?auto_103272 ) ( ON-TABLE ?auto_103277 ) ( ON ?auto_103274 ?auto_103273 ) ( CLEAR ?auto_103274 ) ( HOLDING ?auto_103275 ) ( CLEAR ?auto_103279 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_103276 ?auto_103278 ?auto_103279 ?auto_103275 )
      ( MAKE-4PILE ?auto_103272 ?auto_103273 ?auto_103274 ?auto_103275 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_103280 - BLOCK
      ?auto_103281 - BLOCK
      ?auto_103282 - BLOCK
      ?auto_103283 - BLOCK
    )
    :vars
    (
      ?auto_103284 - BLOCK
      ?auto_103286 - BLOCK
      ?auto_103287 - BLOCK
      ?auto_103285 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_103280 ?auto_103281 ) ) ( not ( = ?auto_103280 ?auto_103282 ) ) ( not ( = ?auto_103280 ?auto_103283 ) ) ( not ( = ?auto_103281 ?auto_103282 ) ) ( not ( = ?auto_103281 ?auto_103283 ) ) ( not ( = ?auto_103282 ?auto_103283 ) ) ( not ( = ?auto_103280 ?auto_103284 ) ) ( not ( = ?auto_103281 ?auto_103284 ) ) ( not ( = ?auto_103282 ?auto_103284 ) ) ( not ( = ?auto_103283 ?auto_103284 ) ) ( ON-TABLE ?auto_103286 ) ( ON ?auto_103287 ?auto_103286 ) ( ON ?auto_103284 ?auto_103287 ) ( not ( = ?auto_103286 ?auto_103287 ) ) ( not ( = ?auto_103286 ?auto_103284 ) ) ( not ( = ?auto_103286 ?auto_103283 ) ) ( not ( = ?auto_103286 ?auto_103282 ) ) ( not ( = ?auto_103287 ?auto_103284 ) ) ( not ( = ?auto_103287 ?auto_103283 ) ) ( not ( = ?auto_103287 ?auto_103282 ) ) ( not ( = ?auto_103280 ?auto_103286 ) ) ( not ( = ?auto_103280 ?auto_103287 ) ) ( not ( = ?auto_103281 ?auto_103286 ) ) ( not ( = ?auto_103281 ?auto_103287 ) ) ( ON ?auto_103280 ?auto_103285 ) ( not ( = ?auto_103280 ?auto_103285 ) ) ( not ( = ?auto_103281 ?auto_103285 ) ) ( not ( = ?auto_103282 ?auto_103285 ) ) ( not ( = ?auto_103283 ?auto_103285 ) ) ( not ( = ?auto_103284 ?auto_103285 ) ) ( not ( = ?auto_103286 ?auto_103285 ) ) ( not ( = ?auto_103287 ?auto_103285 ) ) ( ON ?auto_103281 ?auto_103280 ) ( ON-TABLE ?auto_103285 ) ( ON ?auto_103282 ?auto_103281 ) ( CLEAR ?auto_103284 ) ( ON ?auto_103283 ?auto_103282 ) ( CLEAR ?auto_103283 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_103285 ?auto_103280 ?auto_103281 ?auto_103282 )
      ( MAKE-4PILE ?auto_103280 ?auto_103281 ?auto_103282 ?auto_103283 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_103288 - BLOCK
      ?auto_103289 - BLOCK
      ?auto_103290 - BLOCK
      ?auto_103291 - BLOCK
    )
    :vars
    (
      ?auto_103294 - BLOCK
      ?auto_103295 - BLOCK
      ?auto_103293 - BLOCK
      ?auto_103292 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_103288 ?auto_103289 ) ) ( not ( = ?auto_103288 ?auto_103290 ) ) ( not ( = ?auto_103288 ?auto_103291 ) ) ( not ( = ?auto_103289 ?auto_103290 ) ) ( not ( = ?auto_103289 ?auto_103291 ) ) ( not ( = ?auto_103290 ?auto_103291 ) ) ( not ( = ?auto_103288 ?auto_103294 ) ) ( not ( = ?auto_103289 ?auto_103294 ) ) ( not ( = ?auto_103290 ?auto_103294 ) ) ( not ( = ?auto_103291 ?auto_103294 ) ) ( ON-TABLE ?auto_103295 ) ( ON ?auto_103293 ?auto_103295 ) ( not ( = ?auto_103295 ?auto_103293 ) ) ( not ( = ?auto_103295 ?auto_103294 ) ) ( not ( = ?auto_103295 ?auto_103291 ) ) ( not ( = ?auto_103295 ?auto_103290 ) ) ( not ( = ?auto_103293 ?auto_103294 ) ) ( not ( = ?auto_103293 ?auto_103291 ) ) ( not ( = ?auto_103293 ?auto_103290 ) ) ( not ( = ?auto_103288 ?auto_103295 ) ) ( not ( = ?auto_103288 ?auto_103293 ) ) ( not ( = ?auto_103289 ?auto_103295 ) ) ( not ( = ?auto_103289 ?auto_103293 ) ) ( ON ?auto_103288 ?auto_103292 ) ( not ( = ?auto_103288 ?auto_103292 ) ) ( not ( = ?auto_103289 ?auto_103292 ) ) ( not ( = ?auto_103290 ?auto_103292 ) ) ( not ( = ?auto_103291 ?auto_103292 ) ) ( not ( = ?auto_103294 ?auto_103292 ) ) ( not ( = ?auto_103295 ?auto_103292 ) ) ( not ( = ?auto_103293 ?auto_103292 ) ) ( ON ?auto_103289 ?auto_103288 ) ( ON-TABLE ?auto_103292 ) ( ON ?auto_103290 ?auto_103289 ) ( ON ?auto_103291 ?auto_103290 ) ( CLEAR ?auto_103291 ) ( HOLDING ?auto_103294 ) ( CLEAR ?auto_103293 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_103295 ?auto_103293 ?auto_103294 )
      ( MAKE-4PILE ?auto_103288 ?auto_103289 ?auto_103290 ?auto_103291 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_103296 - BLOCK
      ?auto_103297 - BLOCK
      ?auto_103298 - BLOCK
      ?auto_103299 - BLOCK
    )
    :vars
    (
      ?auto_103300 - BLOCK
      ?auto_103302 - BLOCK
      ?auto_103301 - BLOCK
      ?auto_103303 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_103296 ?auto_103297 ) ) ( not ( = ?auto_103296 ?auto_103298 ) ) ( not ( = ?auto_103296 ?auto_103299 ) ) ( not ( = ?auto_103297 ?auto_103298 ) ) ( not ( = ?auto_103297 ?auto_103299 ) ) ( not ( = ?auto_103298 ?auto_103299 ) ) ( not ( = ?auto_103296 ?auto_103300 ) ) ( not ( = ?auto_103297 ?auto_103300 ) ) ( not ( = ?auto_103298 ?auto_103300 ) ) ( not ( = ?auto_103299 ?auto_103300 ) ) ( ON-TABLE ?auto_103302 ) ( ON ?auto_103301 ?auto_103302 ) ( not ( = ?auto_103302 ?auto_103301 ) ) ( not ( = ?auto_103302 ?auto_103300 ) ) ( not ( = ?auto_103302 ?auto_103299 ) ) ( not ( = ?auto_103302 ?auto_103298 ) ) ( not ( = ?auto_103301 ?auto_103300 ) ) ( not ( = ?auto_103301 ?auto_103299 ) ) ( not ( = ?auto_103301 ?auto_103298 ) ) ( not ( = ?auto_103296 ?auto_103302 ) ) ( not ( = ?auto_103296 ?auto_103301 ) ) ( not ( = ?auto_103297 ?auto_103302 ) ) ( not ( = ?auto_103297 ?auto_103301 ) ) ( ON ?auto_103296 ?auto_103303 ) ( not ( = ?auto_103296 ?auto_103303 ) ) ( not ( = ?auto_103297 ?auto_103303 ) ) ( not ( = ?auto_103298 ?auto_103303 ) ) ( not ( = ?auto_103299 ?auto_103303 ) ) ( not ( = ?auto_103300 ?auto_103303 ) ) ( not ( = ?auto_103302 ?auto_103303 ) ) ( not ( = ?auto_103301 ?auto_103303 ) ) ( ON ?auto_103297 ?auto_103296 ) ( ON-TABLE ?auto_103303 ) ( ON ?auto_103298 ?auto_103297 ) ( ON ?auto_103299 ?auto_103298 ) ( CLEAR ?auto_103301 ) ( ON ?auto_103300 ?auto_103299 ) ( CLEAR ?auto_103300 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_103303 ?auto_103296 ?auto_103297 ?auto_103298 ?auto_103299 )
      ( MAKE-4PILE ?auto_103296 ?auto_103297 ?auto_103298 ?auto_103299 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_103304 - BLOCK
      ?auto_103305 - BLOCK
      ?auto_103306 - BLOCK
      ?auto_103307 - BLOCK
    )
    :vars
    (
      ?auto_103311 - BLOCK
      ?auto_103308 - BLOCK
      ?auto_103309 - BLOCK
      ?auto_103310 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_103304 ?auto_103305 ) ) ( not ( = ?auto_103304 ?auto_103306 ) ) ( not ( = ?auto_103304 ?auto_103307 ) ) ( not ( = ?auto_103305 ?auto_103306 ) ) ( not ( = ?auto_103305 ?auto_103307 ) ) ( not ( = ?auto_103306 ?auto_103307 ) ) ( not ( = ?auto_103304 ?auto_103311 ) ) ( not ( = ?auto_103305 ?auto_103311 ) ) ( not ( = ?auto_103306 ?auto_103311 ) ) ( not ( = ?auto_103307 ?auto_103311 ) ) ( ON-TABLE ?auto_103308 ) ( not ( = ?auto_103308 ?auto_103309 ) ) ( not ( = ?auto_103308 ?auto_103311 ) ) ( not ( = ?auto_103308 ?auto_103307 ) ) ( not ( = ?auto_103308 ?auto_103306 ) ) ( not ( = ?auto_103309 ?auto_103311 ) ) ( not ( = ?auto_103309 ?auto_103307 ) ) ( not ( = ?auto_103309 ?auto_103306 ) ) ( not ( = ?auto_103304 ?auto_103308 ) ) ( not ( = ?auto_103304 ?auto_103309 ) ) ( not ( = ?auto_103305 ?auto_103308 ) ) ( not ( = ?auto_103305 ?auto_103309 ) ) ( ON ?auto_103304 ?auto_103310 ) ( not ( = ?auto_103304 ?auto_103310 ) ) ( not ( = ?auto_103305 ?auto_103310 ) ) ( not ( = ?auto_103306 ?auto_103310 ) ) ( not ( = ?auto_103307 ?auto_103310 ) ) ( not ( = ?auto_103311 ?auto_103310 ) ) ( not ( = ?auto_103308 ?auto_103310 ) ) ( not ( = ?auto_103309 ?auto_103310 ) ) ( ON ?auto_103305 ?auto_103304 ) ( ON-TABLE ?auto_103310 ) ( ON ?auto_103306 ?auto_103305 ) ( ON ?auto_103307 ?auto_103306 ) ( ON ?auto_103311 ?auto_103307 ) ( CLEAR ?auto_103311 ) ( HOLDING ?auto_103309 ) ( CLEAR ?auto_103308 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_103308 ?auto_103309 )
      ( MAKE-4PILE ?auto_103304 ?auto_103305 ?auto_103306 ?auto_103307 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_103312 - BLOCK
      ?auto_103313 - BLOCK
      ?auto_103314 - BLOCK
      ?auto_103315 - BLOCK
    )
    :vars
    (
      ?auto_103316 - BLOCK
      ?auto_103317 - BLOCK
      ?auto_103319 - BLOCK
      ?auto_103318 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_103312 ?auto_103313 ) ) ( not ( = ?auto_103312 ?auto_103314 ) ) ( not ( = ?auto_103312 ?auto_103315 ) ) ( not ( = ?auto_103313 ?auto_103314 ) ) ( not ( = ?auto_103313 ?auto_103315 ) ) ( not ( = ?auto_103314 ?auto_103315 ) ) ( not ( = ?auto_103312 ?auto_103316 ) ) ( not ( = ?auto_103313 ?auto_103316 ) ) ( not ( = ?auto_103314 ?auto_103316 ) ) ( not ( = ?auto_103315 ?auto_103316 ) ) ( ON-TABLE ?auto_103317 ) ( not ( = ?auto_103317 ?auto_103319 ) ) ( not ( = ?auto_103317 ?auto_103316 ) ) ( not ( = ?auto_103317 ?auto_103315 ) ) ( not ( = ?auto_103317 ?auto_103314 ) ) ( not ( = ?auto_103319 ?auto_103316 ) ) ( not ( = ?auto_103319 ?auto_103315 ) ) ( not ( = ?auto_103319 ?auto_103314 ) ) ( not ( = ?auto_103312 ?auto_103317 ) ) ( not ( = ?auto_103312 ?auto_103319 ) ) ( not ( = ?auto_103313 ?auto_103317 ) ) ( not ( = ?auto_103313 ?auto_103319 ) ) ( ON ?auto_103312 ?auto_103318 ) ( not ( = ?auto_103312 ?auto_103318 ) ) ( not ( = ?auto_103313 ?auto_103318 ) ) ( not ( = ?auto_103314 ?auto_103318 ) ) ( not ( = ?auto_103315 ?auto_103318 ) ) ( not ( = ?auto_103316 ?auto_103318 ) ) ( not ( = ?auto_103317 ?auto_103318 ) ) ( not ( = ?auto_103319 ?auto_103318 ) ) ( ON ?auto_103313 ?auto_103312 ) ( ON-TABLE ?auto_103318 ) ( ON ?auto_103314 ?auto_103313 ) ( ON ?auto_103315 ?auto_103314 ) ( ON ?auto_103316 ?auto_103315 ) ( CLEAR ?auto_103317 ) ( ON ?auto_103319 ?auto_103316 ) ( CLEAR ?auto_103319 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_103318 ?auto_103312 ?auto_103313 ?auto_103314 ?auto_103315 ?auto_103316 )
      ( MAKE-4PILE ?auto_103312 ?auto_103313 ?auto_103314 ?auto_103315 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_103320 - BLOCK
      ?auto_103321 - BLOCK
      ?auto_103322 - BLOCK
      ?auto_103323 - BLOCK
    )
    :vars
    (
      ?auto_103326 - BLOCK
      ?auto_103327 - BLOCK
      ?auto_103324 - BLOCK
      ?auto_103325 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_103320 ?auto_103321 ) ) ( not ( = ?auto_103320 ?auto_103322 ) ) ( not ( = ?auto_103320 ?auto_103323 ) ) ( not ( = ?auto_103321 ?auto_103322 ) ) ( not ( = ?auto_103321 ?auto_103323 ) ) ( not ( = ?auto_103322 ?auto_103323 ) ) ( not ( = ?auto_103320 ?auto_103326 ) ) ( not ( = ?auto_103321 ?auto_103326 ) ) ( not ( = ?auto_103322 ?auto_103326 ) ) ( not ( = ?auto_103323 ?auto_103326 ) ) ( not ( = ?auto_103327 ?auto_103324 ) ) ( not ( = ?auto_103327 ?auto_103326 ) ) ( not ( = ?auto_103327 ?auto_103323 ) ) ( not ( = ?auto_103327 ?auto_103322 ) ) ( not ( = ?auto_103324 ?auto_103326 ) ) ( not ( = ?auto_103324 ?auto_103323 ) ) ( not ( = ?auto_103324 ?auto_103322 ) ) ( not ( = ?auto_103320 ?auto_103327 ) ) ( not ( = ?auto_103320 ?auto_103324 ) ) ( not ( = ?auto_103321 ?auto_103327 ) ) ( not ( = ?auto_103321 ?auto_103324 ) ) ( ON ?auto_103320 ?auto_103325 ) ( not ( = ?auto_103320 ?auto_103325 ) ) ( not ( = ?auto_103321 ?auto_103325 ) ) ( not ( = ?auto_103322 ?auto_103325 ) ) ( not ( = ?auto_103323 ?auto_103325 ) ) ( not ( = ?auto_103326 ?auto_103325 ) ) ( not ( = ?auto_103327 ?auto_103325 ) ) ( not ( = ?auto_103324 ?auto_103325 ) ) ( ON ?auto_103321 ?auto_103320 ) ( ON-TABLE ?auto_103325 ) ( ON ?auto_103322 ?auto_103321 ) ( ON ?auto_103323 ?auto_103322 ) ( ON ?auto_103326 ?auto_103323 ) ( ON ?auto_103324 ?auto_103326 ) ( CLEAR ?auto_103324 ) ( HOLDING ?auto_103327 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_103327 )
      ( MAKE-4PILE ?auto_103320 ?auto_103321 ?auto_103322 ?auto_103323 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_103328 - BLOCK
      ?auto_103329 - BLOCK
      ?auto_103330 - BLOCK
      ?auto_103331 - BLOCK
    )
    :vars
    (
      ?auto_103335 - BLOCK
      ?auto_103334 - BLOCK
      ?auto_103333 - BLOCK
      ?auto_103332 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_103328 ?auto_103329 ) ) ( not ( = ?auto_103328 ?auto_103330 ) ) ( not ( = ?auto_103328 ?auto_103331 ) ) ( not ( = ?auto_103329 ?auto_103330 ) ) ( not ( = ?auto_103329 ?auto_103331 ) ) ( not ( = ?auto_103330 ?auto_103331 ) ) ( not ( = ?auto_103328 ?auto_103335 ) ) ( not ( = ?auto_103329 ?auto_103335 ) ) ( not ( = ?auto_103330 ?auto_103335 ) ) ( not ( = ?auto_103331 ?auto_103335 ) ) ( not ( = ?auto_103334 ?auto_103333 ) ) ( not ( = ?auto_103334 ?auto_103335 ) ) ( not ( = ?auto_103334 ?auto_103331 ) ) ( not ( = ?auto_103334 ?auto_103330 ) ) ( not ( = ?auto_103333 ?auto_103335 ) ) ( not ( = ?auto_103333 ?auto_103331 ) ) ( not ( = ?auto_103333 ?auto_103330 ) ) ( not ( = ?auto_103328 ?auto_103334 ) ) ( not ( = ?auto_103328 ?auto_103333 ) ) ( not ( = ?auto_103329 ?auto_103334 ) ) ( not ( = ?auto_103329 ?auto_103333 ) ) ( ON ?auto_103328 ?auto_103332 ) ( not ( = ?auto_103328 ?auto_103332 ) ) ( not ( = ?auto_103329 ?auto_103332 ) ) ( not ( = ?auto_103330 ?auto_103332 ) ) ( not ( = ?auto_103331 ?auto_103332 ) ) ( not ( = ?auto_103335 ?auto_103332 ) ) ( not ( = ?auto_103334 ?auto_103332 ) ) ( not ( = ?auto_103333 ?auto_103332 ) ) ( ON ?auto_103329 ?auto_103328 ) ( ON-TABLE ?auto_103332 ) ( ON ?auto_103330 ?auto_103329 ) ( ON ?auto_103331 ?auto_103330 ) ( ON ?auto_103335 ?auto_103331 ) ( ON ?auto_103333 ?auto_103335 ) ( ON ?auto_103334 ?auto_103333 ) ( CLEAR ?auto_103334 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_103332 ?auto_103328 ?auto_103329 ?auto_103330 ?auto_103331 ?auto_103335 ?auto_103333 )
      ( MAKE-4PILE ?auto_103328 ?auto_103329 ?auto_103330 ?auto_103331 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_103338 - BLOCK
      ?auto_103339 - BLOCK
    )
    :vars
    (
      ?auto_103340 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_103340 ?auto_103339 ) ( CLEAR ?auto_103340 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_103338 ) ( ON ?auto_103339 ?auto_103338 ) ( not ( = ?auto_103338 ?auto_103339 ) ) ( not ( = ?auto_103338 ?auto_103340 ) ) ( not ( = ?auto_103339 ?auto_103340 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_103340 ?auto_103339 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_103341 - BLOCK
      ?auto_103342 - BLOCK
    )
    :vars
    (
      ?auto_103343 - BLOCK
      ?auto_103344 - BLOCK
      ?auto_103345 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_103343 ?auto_103342 ) ( CLEAR ?auto_103343 ) ( ON-TABLE ?auto_103341 ) ( ON ?auto_103342 ?auto_103341 ) ( not ( = ?auto_103341 ?auto_103342 ) ) ( not ( = ?auto_103341 ?auto_103343 ) ) ( not ( = ?auto_103342 ?auto_103343 ) ) ( HOLDING ?auto_103344 ) ( CLEAR ?auto_103345 ) ( not ( = ?auto_103341 ?auto_103344 ) ) ( not ( = ?auto_103341 ?auto_103345 ) ) ( not ( = ?auto_103342 ?auto_103344 ) ) ( not ( = ?auto_103342 ?auto_103345 ) ) ( not ( = ?auto_103343 ?auto_103344 ) ) ( not ( = ?auto_103343 ?auto_103345 ) ) ( not ( = ?auto_103344 ?auto_103345 ) ) )
    :subtasks
    ( ( !STACK ?auto_103344 ?auto_103345 )
      ( MAKE-2PILE ?auto_103341 ?auto_103342 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_103346 - BLOCK
      ?auto_103347 - BLOCK
    )
    :vars
    (
      ?auto_103349 - BLOCK
      ?auto_103350 - BLOCK
      ?auto_103348 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_103349 ?auto_103347 ) ( ON-TABLE ?auto_103346 ) ( ON ?auto_103347 ?auto_103346 ) ( not ( = ?auto_103346 ?auto_103347 ) ) ( not ( = ?auto_103346 ?auto_103349 ) ) ( not ( = ?auto_103347 ?auto_103349 ) ) ( CLEAR ?auto_103350 ) ( not ( = ?auto_103346 ?auto_103348 ) ) ( not ( = ?auto_103346 ?auto_103350 ) ) ( not ( = ?auto_103347 ?auto_103348 ) ) ( not ( = ?auto_103347 ?auto_103350 ) ) ( not ( = ?auto_103349 ?auto_103348 ) ) ( not ( = ?auto_103349 ?auto_103350 ) ) ( not ( = ?auto_103348 ?auto_103350 ) ) ( ON ?auto_103348 ?auto_103349 ) ( CLEAR ?auto_103348 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_103346 ?auto_103347 ?auto_103349 )
      ( MAKE-2PILE ?auto_103346 ?auto_103347 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_103351 - BLOCK
      ?auto_103352 - BLOCK
    )
    :vars
    (
      ?auto_103354 - BLOCK
      ?auto_103355 - BLOCK
      ?auto_103353 - BLOCK
      ?auto_103356 - BLOCK
      ?auto_103357 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_103354 ?auto_103352 ) ( ON-TABLE ?auto_103351 ) ( ON ?auto_103352 ?auto_103351 ) ( not ( = ?auto_103351 ?auto_103352 ) ) ( not ( = ?auto_103351 ?auto_103354 ) ) ( not ( = ?auto_103352 ?auto_103354 ) ) ( not ( = ?auto_103351 ?auto_103355 ) ) ( not ( = ?auto_103351 ?auto_103353 ) ) ( not ( = ?auto_103352 ?auto_103355 ) ) ( not ( = ?auto_103352 ?auto_103353 ) ) ( not ( = ?auto_103354 ?auto_103355 ) ) ( not ( = ?auto_103354 ?auto_103353 ) ) ( not ( = ?auto_103355 ?auto_103353 ) ) ( ON ?auto_103355 ?auto_103354 ) ( CLEAR ?auto_103355 ) ( HOLDING ?auto_103353 ) ( CLEAR ?auto_103356 ) ( ON-TABLE ?auto_103357 ) ( ON ?auto_103356 ?auto_103357 ) ( not ( = ?auto_103357 ?auto_103356 ) ) ( not ( = ?auto_103357 ?auto_103353 ) ) ( not ( = ?auto_103356 ?auto_103353 ) ) ( not ( = ?auto_103351 ?auto_103356 ) ) ( not ( = ?auto_103351 ?auto_103357 ) ) ( not ( = ?auto_103352 ?auto_103356 ) ) ( not ( = ?auto_103352 ?auto_103357 ) ) ( not ( = ?auto_103354 ?auto_103356 ) ) ( not ( = ?auto_103354 ?auto_103357 ) ) ( not ( = ?auto_103355 ?auto_103356 ) ) ( not ( = ?auto_103355 ?auto_103357 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_103357 ?auto_103356 ?auto_103353 )
      ( MAKE-2PILE ?auto_103351 ?auto_103352 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_103358 - BLOCK
      ?auto_103359 - BLOCK
    )
    :vars
    (
      ?auto_103361 - BLOCK
      ?auto_103362 - BLOCK
      ?auto_103360 - BLOCK
      ?auto_103364 - BLOCK
      ?auto_103363 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_103361 ?auto_103359 ) ( ON-TABLE ?auto_103358 ) ( ON ?auto_103359 ?auto_103358 ) ( not ( = ?auto_103358 ?auto_103359 ) ) ( not ( = ?auto_103358 ?auto_103361 ) ) ( not ( = ?auto_103359 ?auto_103361 ) ) ( not ( = ?auto_103358 ?auto_103362 ) ) ( not ( = ?auto_103358 ?auto_103360 ) ) ( not ( = ?auto_103359 ?auto_103362 ) ) ( not ( = ?auto_103359 ?auto_103360 ) ) ( not ( = ?auto_103361 ?auto_103362 ) ) ( not ( = ?auto_103361 ?auto_103360 ) ) ( not ( = ?auto_103362 ?auto_103360 ) ) ( ON ?auto_103362 ?auto_103361 ) ( CLEAR ?auto_103364 ) ( ON-TABLE ?auto_103363 ) ( ON ?auto_103364 ?auto_103363 ) ( not ( = ?auto_103363 ?auto_103364 ) ) ( not ( = ?auto_103363 ?auto_103360 ) ) ( not ( = ?auto_103364 ?auto_103360 ) ) ( not ( = ?auto_103358 ?auto_103364 ) ) ( not ( = ?auto_103358 ?auto_103363 ) ) ( not ( = ?auto_103359 ?auto_103364 ) ) ( not ( = ?auto_103359 ?auto_103363 ) ) ( not ( = ?auto_103361 ?auto_103364 ) ) ( not ( = ?auto_103361 ?auto_103363 ) ) ( not ( = ?auto_103362 ?auto_103364 ) ) ( not ( = ?auto_103362 ?auto_103363 ) ) ( ON ?auto_103360 ?auto_103362 ) ( CLEAR ?auto_103360 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_103358 ?auto_103359 ?auto_103361 ?auto_103362 )
      ( MAKE-2PILE ?auto_103358 ?auto_103359 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_103365 - BLOCK
      ?auto_103366 - BLOCK
    )
    :vars
    (
      ?auto_103369 - BLOCK
      ?auto_103370 - BLOCK
      ?auto_103367 - BLOCK
      ?auto_103368 - BLOCK
      ?auto_103371 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_103369 ?auto_103366 ) ( ON-TABLE ?auto_103365 ) ( ON ?auto_103366 ?auto_103365 ) ( not ( = ?auto_103365 ?auto_103366 ) ) ( not ( = ?auto_103365 ?auto_103369 ) ) ( not ( = ?auto_103366 ?auto_103369 ) ) ( not ( = ?auto_103365 ?auto_103370 ) ) ( not ( = ?auto_103365 ?auto_103367 ) ) ( not ( = ?auto_103366 ?auto_103370 ) ) ( not ( = ?auto_103366 ?auto_103367 ) ) ( not ( = ?auto_103369 ?auto_103370 ) ) ( not ( = ?auto_103369 ?auto_103367 ) ) ( not ( = ?auto_103370 ?auto_103367 ) ) ( ON ?auto_103370 ?auto_103369 ) ( ON-TABLE ?auto_103368 ) ( not ( = ?auto_103368 ?auto_103371 ) ) ( not ( = ?auto_103368 ?auto_103367 ) ) ( not ( = ?auto_103371 ?auto_103367 ) ) ( not ( = ?auto_103365 ?auto_103371 ) ) ( not ( = ?auto_103365 ?auto_103368 ) ) ( not ( = ?auto_103366 ?auto_103371 ) ) ( not ( = ?auto_103366 ?auto_103368 ) ) ( not ( = ?auto_103369 ?auto_103371 ) ) ( not ( = ?auto_103369 ?auto_103368 ) ) ( not ( = ?auto_103370 ?auto_103371 ) ) ( not ( = ?auto_103370 ?auto_103368 ) ) ( ON ?auto_103367 ?auto_103370 ) ( CLEAR ?auto_103367 ) ( HOLDING ?auto_103371 ) ( CLEAR ?auto_103368 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_103368 ?auto_103371 )
      ( MAKE-2PILE ?auto_103365 ?auto_103366 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_103372 - BLOCK
      ?auto_103373 - BLOCK
    )
    :vars
    (
      ?auto_103376 - BLOCK
      ?auto_103378 - BLOCK
      ?auto_103374 - BLOCK
      ?auto_103375 - BLOCK
      ?auto_103377 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_103376 ?auto_103373 ) ( ON-TABLE ?auto_103372 ) ( ON ?auto_103373 ?auto_103372 ) ( not ( = ?auto_103372 ?auto_103373 ) ) ( not ( = ?auto_103372 ?auto_103376 ) ) ( not ( = ?auto_103373 ?auto_103376 ) ) ( not ( = ?auto_103372 ?auto_103378 ) ) ( not ( = ?auto_103372 ?auto_103374 ) ) ( not ( = ?auto_103373 ?auto_103378 ) ) ( not ( = ?auto_103373 ?auto_103374 ) ) ( not ( = ?auto_103376 ?auto_103378 ) ) ( not ( = ?auto_103376 ?auto_103374 ) ) ( not ( = ?auto_103378 ?auto_103374 ) ) ( ON ?auto_103378 ?auto_103376 ) ( ON-TABLE ?auto_103375 ) ( not ( = ?auto_103375 ?auto_103377 ) ) ( not ( = ?auto_103375 ?auto_103374 ) ) ( not ( = ?auto_103377 ?auto_103374 ) ) ( not ( = ?auto_103372 ?auto_103377 ) ) ( not ( = ?auto_103372 ?auto_103375 ) ) ( not ( = ?auto_103373 ?auto_103377 ) ) ( not ( = ?auto_103373 ?auto_103375 ) ) ( not ( = ?auto_103376 ?auto_103377 ) ) ( not ( = ?auto_103376 ?auto_103375 ) ) ( not ( = ?auto_103378 ?auto_103377 ) ) ( not ( = ?auto_103378 ?auto_103375 ) ) ( ON ?auto_103374 ?auto_103378 ) ( CLEAR ?auto_103375 ) ( ON ?auto_103377 ?auto_103374 ) ( CLEAR ?auto_103377 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_103372 ?auto_103373 ?auto_103376 ?auto_103378 ?auto_103374 )
      ( MAKE-2PILE ?auto_103372 ?auto_103373 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_103379 - BLOCK
      ?auto_103380 - BLOCK
    )
    :vars
    (
      ?auto_103381 - BLOCK
      ?auto_103383 - BLOCK
      ?auto_103382 - BLOCK
      ?auto_103384 - BLOCK
      ?auto_103385 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_103381 ?auto_103380 ) ( ON-TABLE ?auto_103379 ) ( ON ?auto_103380 ?auto_103379 ) ( not ( = ?auto_103379 ?auto_103380 ) ) ( not ( = ?auto_103379 ?auto_103381 ) ) ( not ( = ?auto_103380 ?auto_103381 ) ) ( not ( = ?auto_103379 ?auto_103383 ) ) ( not ( = ?auto_103379 ?auto_103382 ) ) ( not ( = ?auto_103380 ?auto_103383 ) ) ( not ( = ?auto_103380 ?auto_103382 ) ) ( not ( = ?auto_103381 ?auto_103383 ) ) ( not ( = ?auto_103381 ?auto_103382 ) ) ( not ( = ?auto_103383 ?auto_103382 ) ) ( ON ?auto_103383 ?auto_103381 ) ( not ( = ?auto_103384 ?auto_103385 ) ) ( not ( = ?auto_103384 ?auto_103382 ) ) ( not ( = ?auto_103385 ?auto_103382 ) ) ( not ( = ?auto_103379 ?auto_103385 ) ) ( not ( = ?auto_103379 ?auto_103384 ) ) ( not ( = ?auto_103380 ?auto_103385 ) ) ( not ( = ?auto_103380 ?auto_103384 ) ) ( not ( = ?auto_103381 ?auto_103385 ) ) ( not ( = ?auto_103381 ?auto_103384 ) ) ( not ( = ?auto_103383 ?auto_103385 ) ) ( not ( = ?auto_103383 ?auto_103384 ) ) ( ON ?auto_103382 ?auto_103383 ) ( ON ?auto_103385 ?auto_103382 ) ( CLEAR ?auto_103385 ) ( HOLDING ?auto_103384 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_103384 )
      ( MAKE-2PILE ?auto_103379 ?auto_103380 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_103386 - BLOCK
      ?auto_103387 - BLOCK
    )
    :vars
    (
      ?auto_103390 - BLOCK
      ?auto_103391 - BLOCK
      ?auto_103392 - BLOCK
      ?auto_103388 - BLOCK
      ?auto_103389 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_103390 ?auto_103387 ) ( ON-TABLE ?auto_103386 ) ( ON ?auto_103387 ?auto_103386 ) ( not ( = ?auto_103386 ?auto_103387 ) ) ( not ( = ?auto_103386 ?auto_103390 ) ) ( not ( = ?auto_103387 ?auto_103390 ) ) ( not ( = ?auto_103386 ?auto_103391 ) ) ( not ( = ?auto_103386 ?auto_103392 ) ) ( not ( = ?auto_103387 ?auto_103391 ) ) ( not ( = ?auto_103387 ?auto_103392 ) ) ( not ( = ?auto_103390 ?auto_103391 ) ) ( not ( = ?auto_103390 ?auto_103392 ) ) ( not ( = ?auto_103391 ?auto_103392 ) ) ( ON ?auto_103391 ?auto_103390 ) ( not ( = ?auto_103388 ?auto_103389 ) ) ( not ( = ?auto_103388 ?auto_103392 ) ) ( not ( = ?auto_103389 ?auto_103392 ) ) ( not ( = ?auto_103386 ?auto_103389 ) ) ( not ( = ?auto_103386 ?auto_103388 ) ) ( not ( = ?auto_103387 ?auto_103389 ) ) ( not ( = ?auto_103387 ?auto_103388 ) ) ( not ( = ?auto_103390 ?auto_103389 ) ) ( not ( = ?auto_103390 ?auto_103388 ) ) ( not ( = ?auto_103391 ?auto_103389 ) ) ( not ( = ?auto_103391 ?auto_103388 ) ) ( ON ?auto_103392 ?auto_103391 ) ( ON ?auto_103389 ?auto_103392 ) ( ON ?auto_103388 ?auto_103389 ) ( CLEAR ?auto_103388 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_103386 ?auto_103387 ?auto_103390 ?auto_103391 ?auto_103392 ?auto_103389 )
      ( MAKE-2PILE ?auto_103386 ?auto_103387 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_103393 - BLOCK
      ?auto_103394 - BLOCK
    )
    :vars
    (
      ?auto_103396 - BLOCK
      ?auto_103398 - BLOCK
      ?auto_103397 - BLOCK
      ?auto_103399 - BLOCK
      ?auto_103395 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_103396 ?auto_103394 ) ( ON-TABLE ?auto_103393 ) ( ON ?auto_103394 ?auto_103393 ) ( not ( = ?auto_103393 ?auto_103394 ) ) ( not ( = ?auto_103393 ?auto_103396 ) ) ( not ( = ?auto_103394 ?auto_103396 ) ) ( not ( = ?auto_103393 ?auto_103398 ) ) ( not ( = ?auto_103393 ?auto_103397 ) ) ( not ( = ?auto_103394 ?auto_103398 ) ) ( not ( = ?auto_103394 ?auto_103397 ) ) ( not ( = ?auto_103396 ?auto_103398 ) ) ( not ( = ?auto_103396 ?auto_103397 ) ) ( not ( = ?auto_103398 ?auto_103397 ) ) ( ON ?auto_103398 ?auto_103396 ) ( not ( = ?auto_103399 ?auto_103395 ) ) ( not ( = ?auto_103399 ?auto_103397 ) ) ( not ( = ?auto_103395 ?auto_103397 ) ) ( not ( = ?auto_103393 ?auto_103395 ) ) ( not ( = ?auto_103393 ?auto_103399 ) ) ( not ( = ?auto_103394 ?auto_103395 ) ) ( not ( = ?auto_103394 ?auto_103399 ) ) ( not ( = ?auto_103396 ?auto_103395 ) ) ( not ( = ?auto_103396 ?auto_103399 ) ) ( not ( = ?auto_103398 ?auto_103395 ) ) ( not ( = ?auto_103398 ?auto_103399 ) ) ( ON ?auto_103397 ?auto_103398 ) ( ON ?auto_103395 ?auto_103397 ) ( HOLDING ?auto_103399 ) ( CLEAR ?auto_103395 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_103393 ?auto_103394 ?auto_103396 ?auto_103398 ?auto_103397 ?auto_103395 ?auto_103399 )
      ( MAKE-2PILE ?auto_103393 ?auto_103394 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_103400 - BLOCK
      ?auto_103401 - BLOCK
    )
    :vars
    (
      ?auto_103404 - BLOCK
      ?auto_103403 - BLOCK
      ?auto_103405 - BLOCK
      ?auto_103406 - BLOCK
      ?auto_103402 - BLOCK
      ?auto_103407 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_103404 ?auto_103401 ) ( ON-TABLE ?auto_103400 ) ( ON ?auto_103401 ?auto_103400 ) ( not ( = ?auto_103400 ?auto_103401 ) ) ( not ( = ?auto_103400 ?auto_103404 ) ) ( not ( = ?auto_103401 ?auto_103404 ) ) ( not ( = ?auto_103400 ?auto_103403 ) ) ( not ( = ?auto_103400 ?auto_103405 ) ) ( not ( = ?auto_103401 ?auto_103403 ) ) ( not ( = ?auto_103401 ?auto_103405 ) ) ( not ( = ?auto_103404 ?auto_103403 ) ) ( not ( = ?auto_103404 ?auto_103405 ) ) ( not ( = ?auto_103403 ?auto_103405 ) ) ( ON ?auto_103403 ?auto_103404 ) ( not ( = ?auto_103406 ?auto_103402 ) ) ( not ( = ?auto_103406 ?auto_103405 ) ) ( not ( = ?auto_103402 ?auto_103405 ) ) ( not ( = ?auto_103400 ?auto_103402 ) ) ( not ( = ?auto_103400 ?auto_103406 ) ) ( not ( = ?auto_103401 ?auto_103402 ) ) ( not ( = ?auto_103401 ?auto_103406 ) ) ( not ( = ?auto_103404 ?auto_103402 ) ) ( not ( = ?auto_103404 ?auto_103406 ) ) ( not ( = ?auto_103403 ?auto_103402 ) ) ( not ( = ?auto_103403 ?auto_103406 ) ) ( ON ?auto_103405 ?auto_103403 ) ( ON ?auto_103402 ?auto_103405 ) ( CLEAR ?auto_103402 ) ( ON ?auto_103406 ?auto_103407 ) ( CLEAR ?auto_103406 ) ( HAND-EMPTY ) ( not ( = ?auto_103400 ?auto_103407 ) ) ( not ( = ?auto_103401 ?auto_103407 ) ) ( not ( = ?auto_103404 ?auto_103407 ) ) ( not ( = ?auto_103403 ?auto_103407 ) ) ( not ( = ?auto_103405 ?auto_103407 ) ) ( not ( = ?auto_103406 ?auto_103407 ) ) ( not ( = ?auto_103402 ?auto_103407 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_103406 ?auto_103407 )
      ( MAKE-2PILE ?auto_103400 ?auto_103401 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_103408 - BLOCK
      ?auto_103409 - BLOCK
    )
    :vars
    (
      ?auto_103414 - BLOCK
      ?auto_103411 - BLOCK
      ?auto_103410 - BLOCK
      ?auto_103412 - BLOCK
      ?auto_103413 - BLOCK
      ?auto_103415 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_103414 ?auto_103409 ) ( ON-TABLE ?auto_103408 ) ( ON ?auto_103409 ?auto_103408 ) ( not ( = ?auto_103408 ?auto_103409 ) ) ( not ( = ?auto_103408 ?auto_103414 ) ) ( not ( = ?auto_103409 ?auto_103414 ) ) ( not ( = ?auto_103408 ?auto_103411 ) ) ( not ( = ?auto_103408 ?auto_103410 ) ) ( not ( = ?auto_103409 ?auto_103411 ) ) ( not ( = ?auto_103409 ?auto_103410 ) ) ( not ( = ?auto_103414 ?auto_103411 ) ) ( not ( = ?auto_103414 ?auto_103410 ) ) ( not ( = ?auto_103411 ?auto_103410 ) ) ( ON ?auto_103411 ?auto_103414 ) ( not ( = ?auto_103412 ?auto_103413 ) ) ( not ( = ?auto_103412 ?auto_103410 ) ) ( not ( = ?auto_103413 ?auto_103410 ) ) ( not ( = ?auto_103408 ?auto_103413 ) ) ( not ( = ?auto_103408 ?auto_103412 ) ) ( not ( = ?auto_103409 ?auto_103413 ) ) ( not ( = ?auto_103409 ?auto_103412 ) ) ( not ( = ?auto_103414 ?auto_103413 ) ) ( not ( = ?auto_103414 ?auto_103412 ) ) ( not ( = ?auto_103411 ?auto_103413 ) ) ( not ( = ?auto_103411 ?auto_103412 ) ) ( ON ?auto_103410 ?auto_103411 ) ( ON ?auto_103412 ?auto_103415 ) ( CLEAR ?auto_103412 ) ( not ( = ?auto_103408 ?auto_103415 ) ) ( not ( = ?auto_103409 ?auto_103415 ) ) ( not ( = ?auto_103414 ?auto_103415 ) ) ( not ( = ?auto_103411 ?auto_103415 ) ) ( not ( = ?auto_103410 ?auto_103415 ) ) ( not ( = ?auto_103412 ?auto_103415 ) ) ( not ( = ?auto_103413 ?auto_103415 ) ) ( HOLDING ?auto_103413 ) ( CLEAR ?auto_103410 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_103408 ?auto_103409 ?auto_103414 ?auto_103411 ?auto_103410 ?auto_103413 )
      ( MAKE-2PILE ?auto_103408 ?auto_103409 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_103416 - BLOCK
      ?auto_103417 - BLOCK
    )
    :vars
    (
      ?auto_103421 - BLOCK
      ?auto_103423 - BLOCK
      ?auto_103418 - BLOCK
      ?auto_103420 - BLOCK
      ?auto_103419 - BLOCK
      ?auto_103422 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_103421 ?auto_103417 ) ( ON-TABLE ?auto_103416 ) ( ON ?auto_103417 ?auto_103416 ) ( not ( = ?auto_103416 ?auto_103417 ) ) ( not ( = ?auto_103416 ?auto_103421 ) ) ( not ( = ?auto_103417 ?auto_103421 ) ) ( not ( = ?auto_103416 ?auto_103423 ) ) ( not ( = ?auto_103416 ?auto_103418 ) ) ( not ( = ?auto_103417 ?auto_103423 ) ) ( not ( = ?auto_103417 ?auto_103418 ) ) ( not ( = ?auto_103421 ?auto_103423 ) ) ( not ( = ?auto_103421 ?auto_103418 ) ) ( not ( = ?auto_103423 ?auto_103418 ) ) ( ON ?auto_103423 ?auto_103421 ) ( not ( = ?auto_103420 ?auto_103419 ) ) ( not ( = ?auto_103420 ?auto_103418 ) ) ( not ( = ?auto_103419 ?auto_103418 ) ) ( not ( = ?auto_103416 ?auto_103419 ) ) ( not ( = ?auto_103416 ?auto_103420 ) ) ( not ( = ?auto_103417 ?auto_103419 ) ) ( not ( = ?auto_103417 ?auto_103420 ) ) ( not ( = ?auto_103421 ?auto_103419 ) ) ( not ( = ?auto_103421 ?auto_103420 ) ) ( not ( = ?auto_103423 ?auto_103419 ) ) ( not ( = ?auto_103423 ?auto_103420 ) ) ( ON ?auto_103418 ?auto_103423 ) ( ON ?auto_103420 ?auto_103422 ) ( not ( = ?auto_103416 ?auto_103422 ) ) ( not ( = ?auto_103417 ?auto_103422 ) ) ( not ( = ?auto_103421 ?auto_103422 ) ) ( not ( = ?auto_103423 ?auto_103422 ) ) ( not ( = ?auto_103418 ?auto_103422 ) ) ( not ( = ?auto_103420 ?auto_103422 ) ) ( not ( = ?auto_103419 ?auto_103422 ) ) ( CLEAR ?auto_103418 ) ( ON ?auto_103419 ?auto_103420 ) ( CLEAR ?auto_103419 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_103422 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_103422 ?auto_103420 )
      ( MAKE-2PILE ?auto_103416 ?auto_103417 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_103424 - BLOCK
      ?auto_103425 - BLOCK
    )
    :vars
    (
      ?auto_103427 - BLOCK
      ?auto_103426 - BLOCK
      ?auto_103429 - BLOCK
      ?auto_103431 - BLOCK
      ?auto_103430 - BLOCK
      ?auto_103428 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_103427 ?auto_103425 ) ( ON-TABLE ?auto_103424 ) ( ON ?auto_103425 ?auto_103424 ) ( not ( = ?auto_103424 ?auto_103425 ) ) ( not ( = ?auto_103424 ?auto_103427 ) ) ( not ( = ?auto_103425 ?auto_103427 ) ) ( not ( = ?auto_103424 ?auto_103426 ) ) ( not ( = ?auto_103424 ?auto_103429 ) ) ( not ( = ?auto_103425 ?auto_103426 ) ) ( not ( = ?auto_103425 ?auto_103429 ) ) ( not ( = ?auto_103427 ?auto_103426 ) ) ( not ( = ?auto_103427 ?auto_103429 ) ) ( not ( = ?auto_103426 ?auto_103429 ) ) ( ON ?auto_103426 ?auto_103427 ) ( not ( = ?auto_103431 ?auto_103430 ) ) ( not ( = ?auto_103431 ?auto_103429 ) ) ( not ( = ?auto_103430 ?auto_103429 ) ) ( not ( = ?auto_103424 ?auto_103430 ) ) ( not ( = ?auto_103424 ?auto_103431 ) ) ( not ( = ?auto_103425 ?auto_103430 ) ) ( not ( = ?auto_103425 ?auto_103431 ) ) ( not ( = ?auto_103427 ?auto_103430 ) ) ( not ( = ?auto_103427 ?auto_103431 ) ) ( not ( = ?auto_103426 ?auto_103430 ) ) ( not ( = ?auto_103426 ?auto_103431 ) ) ( ON ?auto_103431 ?auto_103428 ) ( not ( = ?auto_103424 ?auto_103428 ) ) ( not ( = ?auto_103425 ?auto_103428 ) ) ( not ( = ?auto_103427 ?auto_103428 ) ) ( not ( = ?auto_103426 ?auto_103428 ) ) ( not ( = ?auto_103429 ?auto_103428 ) ) ( not ( = ?auto_103431 ?auto_103428 ) ) ( not ( = ?auto_103430 ?auto_103428 ) ) ( ON ?auto_103430 ?auto_103431 ) ( CLEAR ?auto_103430 ) ( ON-TABLE ?auto_103428 ) ( HOLDING ?auto_103429 ) ( CLEAR ?auto_103426 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_103424 ?auto_103425 ?auto_103427 ?auto_103426 ?auto_103429 )
      ( MAKE-2PILE ?auto_103424 ?auto_103425 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_103432 - BLOCK
      ?auto_103433 - BLOCK
    )
    :vars
    (
      ?auto_103437 - BLOCK
      ?auto_103436 - BLOCK
      ?auto_103434 - BLOCK
      ?auto_103435 - BLOCK
      ?auto_103439 - BLOCK
      ?auto_103438 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_103437 ?auto_103433 ) ( ON-TABLE ?auto_103432 ) ( ON ?auto_103433 ?auto_103432 ) ( not ( = ?auto_103432 ?auto_103433 ) ) ( not ( = ?auto_103432 ?auto_103437 ) ) ( not ( = ?auto_103433 ?auto_103437 ) ) ( not ( = ?auto_103432 ?auto_103436 ) ) ( not ( = ?auto_103432 ?auto_103434 ) ) ( not ( = ?auto_103433 ?auto_103436 ) ) ( not ( = ?auto_103433 ?auto_103434 ) ) ( not ( = ?auto_103437 ?auto_103436 ) ) ( not ( = ?auto_103437 ?auto_103434 ) ) ( not ( = ?auto_103436 ?auto_103434 ) ) ( ON ?auto_103436 ?auto_103437 ) ( not ( = ?auto_103435 ?auto_103439 ) ) ( not ( = ?auto_103435 ?auto_103434 ) ) ( not ( = ?auto_103439 ?auto_103434 ) ) ( not ( = ?auto_103432 ?auto_103439 ) ) ( not ( = ?auto_103432 ?auto_103435 ) ) ( not ( = ?auto_103433 ?auto_103439 ) ) ( not ( = ?auto_103433 ?auto_103435 ) ) ( not ( = ?auto_103437 ?auto_103439 ) ) ( not ( = ?auto_103437 ?auto_103435 ) ) ( not ( = ?auto_103436 ?auto_103439 ) ) ( not ( = ?auto_103436 ?auto_103435 ) ) ( ON ?auto_103435 ?auto_103438 ) ( not ( = ?auto_103432 ?auto_103438 ) ) ( not ( = ?auto_103433 ?auto_103438 ) ) ( not ( = ?auto_103437 ?auto_103438 ) ) ( not ( = ?auto_103436 ?auto_103438 ) ) ( not ( = ?auto_103434 ?auto_103438 ) ) ( not ( = ?auto_103435 ?auto_103438 ) ) ( not ( = ?auto_103439 ?auto_103438 ) ) ( ON ?auto_103439 ?auto_103435 ) ( ON-TABLE ?auto_103438 ) ( CLEAR ?auto_103436 ) ( ON ?auto_103434 ?auto_103439 ) ( CLEAR ?auto_103434 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_103438 ?auto_103435 ?auto_103439 )
      ( MAKE-2PILE ?auto_103432 ?auto_103433 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_103440 - BLOCK
      ?auto_103441 - BLOCK
    )
    :vars
    (
      ?auto_103444 - BLOCK
      ?auto_103443 - BLOCK
      ?auto_103442 - BLOCK
      ?auto_103447 - BLOCK
      ?auto_103445 - BLOCK
      ?auto_103446 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_103444 ?auto_103441 ) ( ON-TABLE ?auto_103440 ) ( ON ?auto_103441 ?auto_103440 ) ( not ( = ?auto_103440 ?auto_103441 ) ) ( not ( = ?auto_103440 ?auto_103444 ) ) ( not ( = ?auto_103441 ?auto_103444 ) ) ( not ( = ?auto_103440 ?auto_103443 ) ) ( not ( = ?auto_103440 ?auto_103442 ) ) ( not ( = ?auto_103441 ?auto_103443 ) ) ( not ( = ?auto_103441 ?auto_103442 ) ) ( not ( = ?auto_103444 ?auto_103443 ) ) ( not ( = ?auto_103444 ?auto_103442 ) ) ( not ( = ?auto_103443 ?auto_103442 ) ) ( not ( = ?auto_103447 ?auto_103445 ) ) ( not ( = ?auto_103447 ?auto_103442 ) ) ( not ( = ?auto_103445 ?auto_103442 ) ) ( not ( = ?auto_103440 ?auto_103445 ) ) ( not ( = ?auto_103440 ?auto_103447 ) ) ( not ( = ?auto_103441 ?auto_103445 ) ) ( not ( = ?auto_103441 ?auto_103447 ) ) ( not ( = ?auto_103444 ?auto_103445 ) ) ( not ( = ?auto_103444 ?auto_103447 ) ) ( not ( = ?auto_103443 ?auto_103445 ) ) ( not ( = ?auto_103443 ?auto_103447 ) ) ( ON ?auto_103447 ?auto_103446 ) ( not ( = ?auto_103440 ?auto_103446 ) ) ( not ( = ?auto_103441 ?auto_103446 ) ) ( not ( = ?auto_103444 ?auto_103446 ) ) ( not ( = ?auto_103443 ?auto_103446 ) ) ( not ( = ?auto_103442 ?auto_103446 ) ) ( not ( = ?auto_103447 ?auto_103446 ) ) ( not ( = ?auto_103445 ?auto_103446 ) ) ( ON ?auto_103445 ?auto_103447 ) ( ON-TABLE ?auto_103446 ) ( ON ?auto_103442 ?auto_103445 ) ( CLEAR ?auto_103442 ) ( HOLDING ?auto_103443 ) ( CLEAR ?auto_103444 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_103440 ?auto_103441 ?auto_103444 ?auto_103443 )
      ( MAKE-2PILE ?auto_103440 ?auto_103441 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_103448 - BLOCK
      ?auto_103449 - BLOCK
    )
    :vars
    (
      ?auto_103455 - BLOCK
      ?auto_103450 - BLOCK
      ?auto_103454 - BLOCK
      ?auto_103451 - BLOCK
      ?auto_103452 - BLOCK
      ?auto_103453 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_103455 ?auto_103449 ) ( ON-TABLE ?auto_103448 ) ( ON ?auto_103449 ?auto_103448 ) ( not ( = ?auto_103448 ?auto_103449 ) ) ( not ( = ?auto_103448 ?auto_103455 ) ) ( not ( = ?auto_103449 ?auto_103455 ) ) ( not ( = ?auto_103448 ?auto_103450 ) ) ( not ( = ?auto_103448 ?auto_103454 ) ) ( not ( = ?auto_103449 ?auto_103450 ) ) ( not ( = ?auto_103449 ?auto_103454 ) ) ( not ( = ?auto_103455 ?auto_103450 ) ) ( not ( = ?auto_103455 ?auto_103454 ) ) ( not ( = ?auto_103450 ?auto_103454 ) ) ( not ( = ?auto_103451 ?auto_103452 ) ) ( not ( = ?auto_103451 ?auto_103454 ) ) ( not ( = ?auto_103452 ?auto_103454 ) ) ( not ( = ?auto_103448 ?auto_103452 ) ) ( not ( = ?auto_103448 ?auto_103451 ) ) ( not ( = ?auto_103449 ?auto_103452 ) ) ( not ( = ?auto_103449 ?auto_103451 ) ) ( not ( = ?auto_103455 ?auto_103452 ) ) ( not ( = ?auto_103455 ?auto_103451 ) ) ( not ( = ?auto_103450 ?auto_103452 ) ) ( not ( = ?auto_103450 ?auto_103451 ) ) ( ON ?auto_103451 ?auto_103453 ) ( not ( = ?auto_103448 ?auto_103453 ) ) ( not ( = ?auto_103449 ?auto_103453 ) ) ( not ( = ?auto_103455 ?auto_103453 ) ) ( not ( = ?auto_103450 ?auto_103453 ) ) ( not ( = ?auto_103454 ?auto_103453 ) ) ( not ( = ?auto_103451 ?auto_103453 ) ) ( not ( = ?auto_103452 ?auto_103453 ) ) ( ON ?auto_103452 ?auto_103451 ) ( ON-TABLE ?auto_103453 ) ( ON ?auto_103454 ?auto_103452 ) ( CLEAR ?auto_103455 ) ( ON ?auto_103450 ?auto_103454 ) ( CLEAR ?auto_103450 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_103453 ?auto_103451 ?auto_103452 ?auto_103454 )
      ( MAKE-2PILE ?auto_103448 ?auto_103449 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_103472 - BLOCK
      ?auto_103473 - BLOCK
    )
    :vars
    (
      ?auto_103474 - BLOCK
      ?auto_103477 - BLOCK
      ?auto_103478 - BLOCK
      ?auto_103475 - BLOCK
      ?auto_103479 - BLOCK
      ?auto_103476 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_103472 ) ( not ( = ?auto_103472 ?auto_103473 ) ) ( not ( = ?auto_103472 ?auto_103474 ) ) ( not ( = ?auto_103473 ?auto_103474 ) ) ( not ( = ?auto_103472 ?auto_103477 ) ) ( not ( = ?auto_103472 ?auto_103478 ) ) ( not ( = ?auto_103473 ?auto_103477 ) ) ( not ( = ?auto_103473 ?auto_103478 ) ) ( not ( = ?auto_103474 ?auto_103477 ) ) ( not ( = ?auto_103474 ?auto_103478 ) ) ( not ( = ?auto_103477 ?auto_103478 ) ) ( not ( = ?auto_103475 ?auto_103479 ) ) ( not ( = ?auto_103475 ?auto_103478 ) ) ( not ( = ?auto_103479 ?auto_103478 ) ) ( not ( = ?auto_103472 ?auto_103479 ) ) ( not ( = ?auto_103472 ?auto_103475 ) ) ( not ( = ?auto_103473 ?auto_103479 ) ) ( not ( = ?auto_103473 ?auto_103475 ) ) ( not ( = ?auto_103474 ?auto_103479 ) ) ( not ( = ?auto_103474 ?auto_103475 ) ) ( not ( = ?auto_103477 ?auto_103479 ) ) ( not ( = ?auto_103477 ?auto_103475 ) ) ( ON ?auto_103475 ?auto_103476 ) ( not ( = ?auto_103472 ?auto_103476 ) ) ( not ( = ?auto_103473 ?auto_103476 ) ) ( not ( = ?auto_103474 ?auto_103476 ) ) ( not ( = ?auto_103477 ?auto_103476 ) ) ( not ( = ?auto_103478 ?auto_103476 ) ) ( not ( = ?auto_103475 ?auto_103476 ) ) ( not ( = ?auto_103479 ?auto_103476 ) ) ( ON ?auto_103479 ?auto_103475 ) ( ON-TABLE ?auto_103476 ) ( ON ?auto_103478 ?auto_103479 ) ( ON ?auto_103477 ?auto_103478 ) ( ON ?auto_103474 ?auto_103477 ) ( CLEAR ?auto_103474 ) ( HOLDING ?auto_103473 ) ( CLEAR ?auto_103472 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_103472 ?auto_103473 ?auto_103474 )
      ( MAKE-2PILE ?auto_103472 ?auto_103473 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_103480 - BLOCK
      ?auto_103481 - BLOCK
    )
    :vars
    (
      ?auto_103482 - BLOCK
      ?auto_103485 - BLOCK
      ?auto_103484 - BLOCK
      ?auto_103486 - BLOCK
      ?auto_103483 - BLOCK
      ?auto_103487 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_103480 ) ( not ( = ?auto_103480 ?auto_103481 ) ) ( not ( = ?auto_103480 ?auto_103482 ) ) ( not ( = ?auto_103481 ?auto_103482 ) ) ( not ( = ?auto_103480 ?auto_103485 ) ) ( not ( = ?auto_103480 ?auto_103484 ) ) ( not ( = ?auto_103481 ?auto_103485 ) ) ( not ( = ?auto_103481 ?auto_103484 ) ) ( not ( = ?auto_103482 ?auto_103485 ) ) ( not ( = ?auto_103482 ?auto_103484 ) ) ( not ( = ?auto_103485 ?auto_103484 ) ) ( not ( = ?auto_103486 ?auto_103483 ) ) ( not ( = ?auto_103486 ?auto_103484 ) ) ( not ( = ?auto_103483 ?auto_103484 ) ) ( not ( = ?auto_103480 ?auto_103483 ) ) ( not ( = ?auto_103480 ?auto_103486 ) ) ( not ( = ?auto_103481 ?auto_103483 ) ) ( not ( = ?auto_103481 ?auto_103486 ) ) ( not ( = ?auto_103482 ?auto_103483 ) ) ( not ( = ?auto_103482 ?auto_103486 ) ) ( not ( = ?auto_103485 ?auto_103483 ) ) ( not ( = ?auto_103485 ?auto_103486 ) ) ( ON ?auto_103486 ?auto_103487 ) ( not ( = ?auto_103480 ?auto_103487 ) ) ( not ( = ?auto_103481 ?auto_103487 ) ) ( not ( = ?auto_103482 ?auto_103487 ) ) ( not ( = ?auto_103485 ?auto_103487 ) ) ( not ( = ?auto_103484 ?auto_103487 ) ) ( not ( = ?auto_103486 ?auto_103487 ) ) ( not ( = ?auto_103483 ?auto_103487 ) ) ( ON ?auto_103483 ?auto_103486 ) ( ON-TABLE ?auto_103487 ) ( ON ?auto_103484 ?auto_103483 ) ( ON ?auto_103485 ?auto_103484 ) ( ON ?auto_103482 ?auto_103485 ) ( CLEAR ?auto_103480 ) ( ON ?auto_103481 ?auto_103482 ) ( CLEAR ?auto_103481 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_103487 ?auto_103486 ?auto_103483 ?auto_103484 ?auto_103485 ?auto_103482 )
      ( MAKE-2PILE ?auto_103480 ?auto_103481 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_103488 - BLOCK
      ?auto_103489 - BLOCK
    )
    :vars
    (
      ?auto_103492 - BLOCK
      ?auto_103494 - BLOCK
      ?auto_103490 - BLOCK
      ?auto_103495 - BLOCK
      ?auto_103491 - BLOCK
      ?auto_103493 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_103488 ?auto_103489 ) ) ( not ( = ?auto_103488 ?auto_103492 ) ) ( not ( = ?auto_103489 ?auto_103492 ) ) ( not ( = ?auto_103488 ?auto_103494 ) ) ( not ( = ?auto_103488 ?auto_103490 ) ) ( not ( = ?auto_103489 ?auto_103494 ) ) ( not ( = ?auto_103489 ?auto_103490 ) ) ( not ( = ?auto_103492 ?auto_103494 ) ) ( not ( = ?auto_103492 ?auto_103490 ) ) ( not ( = ?auto_103494 ?auto_103490 ) ) ( not ( = ?auto_103495 ?auto_103491 ) ) ( not ( = ?auto_103495 ?auto_103490 ) ) ( not ( = ?auto_103491 ?auto_103490 ) ) ( not ( = ?auto_103488 ?auto_103491 ) ) ( not ( = ?auto_103488 ?auto_103495 ) ) ( not ( = ?auto_103489 ?auto_103491 ) ) ( not ( = ?auto_103489 ?auto_103495 ) ) ( not ( = ?auto_103492 ?auto_103491 ) ) ( not ( = ?auto_103492 ?auto_103495 ) ) ( not ( = ?auto_103494 ?auto_103491 ) ) ( not ( = ?auto_103494 ?auto_103495 ) ) ( ON ?auto_103495 ?auto_103493 ) ( not ( = ?auto_103488 ?auto_103493 ) ) ( not ( = ?auto_103489 ?auto_103493 ) ) ( not ( = ?auto_103492 ?auto_103493 ) ) ( not ( = ?auto_103494 ?auto_103493 ) ) ( not ( = ?auto_103490 ?auto_103493 ) ) ( not ( = ?auto_103495 ?auto_103493 ) ) ( not ( = ?auto_103491 ?auto_103493 ) ) ( ON ?auto_103491 ?auto_103495 ) ( ON-TABLE ?auto_103493 ) ( ON ?auto_103490 ?auto_103491 ) ( ON ?auto_103494 ?auto_103490 ) ( ON ?auto_103492 ?auto_103494 ) ( ON ?auto_103489 ?auto_103492 ) ( CLEAR ?auto_103489 ) ( HOLDING ?auto_103488 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_103488 )
      ( MAKE-2PILE ?auto_103488 ?auto_103489 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_103496 - BLOCK
      ?auto_103497 - BLOCK
    )
    :vars
    (
      ?auto_103501 - BLOCK
      ?auto_103498 - BLOCK
      ?auto_103502 - BLOCK
      ?auto_103499 - BLOCK
      ?auto_103500 - BLOCK
      ?auto_103503 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_103496 ?auto_103497 ) ) ( not ( = ?auto_103496 ?auto_103501 ) ) ( not ( = ?auto_103497 ?auto_103501 ) ) ( not ( = ?auto_103496 ?auto_103498 ) ) ( not ( = ?auto_103496 ?auto_103502 ) ) ( not ( = ?auto_103497 ?auto_103498 ) ) ( not ( = ?auto_103497 ?auto_103502 ) ) ( not ( = ?auto_103501 ?auto_103498 ) ) ( not ( = ?auto_103501 ?auto_103502 ) ) ( not ( = ?auto_103498 ?auto_103502 ) ) ( not ( = ?auto_103499 ?auto_103500 ) ) ( not ( = ?auto_103499 ?auto_103502 ) ) ( not ( = ?auto_103500 ?auto_103502 ) ) ( not ( = ?auto_103496 ?auto_103500 ) ) ( not ( = ?auto_103496 ?auto_103499 ) ) ( not ( = ?auto_103497 ?auto_103500 ) ) ( not ( = ?auto_103497 ?auto_103499 ) ) ( not ( = ?auto_103501 ?auto_103500 ) ) ( not ( = ?auto_103501 ?auto_103499 ) ) ( not ( = ?auto_103498 ?auto_103500 ) ) ( not ( = ?auto_103498 ?auto_103499 ) ) ( ON ?auto_103499 ?auto_103503 ) ( not ( = ?auto_103496 ?auto_103503 ) ) ( not ( = ?auto_103497 ?auto_103503 ) ) ( not ( = ?auto_103501 ?auto_103503 ) ) ( not ( = ?auto_103498 ?auto_103503 ) ) ( not ( = ?auto_103502 ?auto_103503 ) ) ( not ( = ?auto_103499 ?auto_103503 ) ) ( not ( = ?auto_103500 ?auto_103503 ) ) ( ON ?auto_103500 ?auto_103499 ) ( ON-TABLE ?auto_103503 ) ( ON ?auto_103502 ?auto_103500 ) ( ON ?auto_103498 ?auto_103502 ) ( ON ?auto_103501 ?auto_103498 ) ( ON ?auto_103497 ?auto_103501 ) ( ON ?auto_103496 ?auto_103497 ) ( CLEAR ?auto_103496 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_103503 ?auto_103499 ?auto_103500 ?auto_103502 ?auto_103498 ?auto_103501 ?auto_103497 )
      ( MAKE-2PILE ?auto_103496 ?auto_103497 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_103509 - BLOCK
      ?auto_103510 - BLOCK
      ?auto_103511 - BLOCK
      ?auto_103512 - BLOCK
      ?auto_103513 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_103513 ) ( CLEAR ?auto_103512 ) ( ON-TABLE ?auto_103509 ) ( ON ?auto_103510 ?auto_103509 ) ( ON ?auto_103511 ?auto_103510 ) ( ON ?auto_103512 ?auto_103511 ) ( not ( = ?auto_103509 ?auto_103510 ) ) ( not ( = ?auto_103509 ?auto_103511 ) ) ( not ( = ?auto_103509 ?auto_103512 ) ) ( not ( = ?auto_103509 ?auto_103513 ) ) ( not ( = ?auto_103510 ?auto_103511 ) ) ( not ( = ?auto_103510 ?auto_103512 ) ) ( not ( = ?auto_103510 ?auto_103513 ) ) ( not ( = ?auto_103511 ?auto_103512 ) ) ( not ( = ?auto_103511 ?auto_103513 ) ) ( not ( = ?auto_103512 ?auto_103513 ) ) )
    :subtasks
    ( ( !STACK ?auto_103513 ?auto_103512 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_103514 - BLOCK
      ?auto_103515 - BLOCK
      ?auto_103516 - BLOCK
      ?auto_103517 - BLOCK
      ?auto_103518 - BLOCK
    )
    :vars
    (
      ?auto_103519 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_103517 ) ( ON-TABLE ?auto_103514 ) ( ON ?auto_103515 ?auto_103514 ) ( ON ?auto_103516 ?auto_103515 ) ( ON ?auto_103517 ?auto_103516 ) ( not ( = ?auto_103514 ?auto_103515 ) ) ( not ( = ?auto_103514 ?auto_103516 ) ) ( not ( = ?auto_103514 ?auto_103517 ) ) ( not ( = ?auto_103514 ?auto_103518 ) ) ( not ( = ?auto_103515 ?auto_103516 ) ) ( not ( = ?auto_103515 ?auto_103517 ) ) ( not ( = ?auto_103515 ?auto_103518 ) ) ( not ( = ?auto_103516 ?auto_103517 ) ) ( not ( = ?auto_103516 ?auto_103518 ) ) ( not ( = ?auto_103517 ?auto_103518 ) ) ( ON ?auto_103518 ?auto_103519 ) ( CLEAR ?auto_103518 ) ( HAND-EMPTY ) ( not ( = ?auto_103514 ?auto_103519 ) ) ( not ( = ?auto_103515 ?auto_103519 ) ) ( not ( = ?auto_103516 ?auto_103519 ) ) ( not ( = ?auto_103517 ?auto_103519 ) ) ( not ( = ?auto_103518 ?auto_103519 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_103518 ?auto_103519 )
      ( MAKE-5PILE ?auto_103514 ?auto_103515 ?auto_103516 ?auto_103517 ?auto_103518 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_103520 - BLOCK
      ?auto_103521 - BLOCK
      ?auto_103522 - BLOCK
      ?auto_103523 - BLOCK
      ?auto_103524 - BLOCK
    )
    :vars
    (
      ?auto_103525 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_103520 ) ( ON ?auto_103521 ?auto_103520 ) ( ON ?auto_103522 ?auto_103521 ) ( not ( = ?auto_103520 ?auto_103521 ) ) ( not ( = ?auto_103520 ?auto_103522 ) ) ( not ( = ?auto_103520 ?auto_103523 ) ) ( not ( = ?auto_103520 ?auto_103524 ) ) ( not ( = ?auto_103521 ?auto_103522 ) ) ( not ( = ?auto_103521 ?auto_103523 ) ) ( not ( = ?auto_103521 ?auto_103524 ) ) ( not ( = ?auto_103522 ?auto_103523 ) ) ( not ( = ?auto_103522 ?auto_103524 ) ) ( not ( = ?auto_103523 ?auto_103524 ) ) ( ON ?auto_103524 ?auto_103525 ) ( CLEAR ?auto_103524 ) ( not ( = ?auto_103520 ?auto_103525 ) ) ( not ( = ?auto_103521 ?auto_103525 ) ) ( not ( = ?auto_103522 ?auto_103525 ) ) ( not ( = ?auto_103523 ?auto_103525 ) ) ( not ( = ?auto_103524 ?auto_103525 ) ) ( HOLDING ?auto_103523 ) ( CLEAR ?auto_103522 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_103520 ?auto_103521 ?auto_103522 ?auto_103523 )
      ( MAKE-5PILE ?auto_103520 ?auto_103521 ?auto_103522 ?auto_103523 ?auto_103524 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_103526 - BLOCK
      ?auto_103527 - BLOCK
      ?auto_103528 - BLOCK
      ?auto_103529 - BLOCK
      ?auto_103530 - BLOCK
    )
    :vars
    (
      ?auto_103531 - BLOCK
      ?auto_103532 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_103526 ) ( ON ?auto_103527 ?auto_103526 ) ( ON ?auto_103528 ?auto_103527 ) ( not ( = ?auto_103526 ?auto_103527 ) ) ( not ( = ?auto_103526 ?auto_103528 ) ) ( not ( = ?auto_103526 ?auto_103529 ) ) ( not ( = ?auto_103526 ?auto_103530 ) ) ( not ( = ?auto_103527 ?auto_103528 ) ) ( not ( = ?auto_103527 ?auto_103529 ) ) ( not ( = ?auto_103527 ?auto_103530 ) ) ( not ( = ?auto_103528 ?auto_103529 ) ) ( not ( = ?auto_103528 ?auto_103530 ) ) ( not ( = ?auto_103529 ?auto_103530 ) ) ( ON ?auto_103530 ?auto_103531 ) ( not ( = ?auto_103526 ?auto_103531 ) ) ( not ( = ?auto_103527 ?auto_103531 ) ) ( not ( = ?auto_103528 ?auto_103531 ) ) ( not ( = ?auto_103529 ?auto_103531 ) ) ( not ( = ?auto_103530 ?auto_103531 ) ) ( CLEAR ?auto_103528 ) ( ON ?auto_103529 ?auto_103530 ) ( CLEAR ?auto_103529 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_103532 ) ( ON ?auto_103531 ?auto_103532 ) ( not ( = ?auto_103532 ?auto_103531 ) ) ( not ( = ?auto_103532 ?auto_103530 ) ) ( not ( = ?auto_103532 ?auto_103529 ) ) ( not ( = ?auto_103526 ?auto_103532 ) ) ( not ( = ?auto_103527 ?auto_103532 ) ) ( not ( = ?auto_103528 ?auto_103532 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_103532 ?auto_103531 ?auto_103530 )
      ( MAKE-5PILE ?auto_103526 ?auto_103527 ?auto_103528 ?auto_103529 ?auto_103530 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_103533 - BLOCK
      ?auto_103534 - BLOCK
      ?auto_103535 - BLOCK
      ?auto_103536 - BLOCK
      ?auto_103537 - BLOCK
    )
    :vars
    (
      ?auto_103539 - BLOCK
      ?auto_103538 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_103533 ) ( ON ?auto_103534 ?auto_103533 ) ( not ( = ?auto_103533 ?auto_103534 ) ) ( not ( = ?auto_103533 ?auto_103535 ) ) ( not ( = ?auto_103533 ?auto_103536 ) ) ( not ( = ?auto_103533 ?auto_103537 ) ) ( not ( = ?auto_103534 ?auto_103535 ) ) ( not ( = ?auto_103534 ?auto_103536 ) ) ( not ( = ?auto_103534 ?auto_103537 ) ) ( not ( = ?auto_103535 ?auto_103536 ) ) ( not ( = ?auto_103535 ?auto_103537 ) ) ( not ( = ?auto_103536 ?auto_103537 ) ) ( ON ?auto_103537 ?auto_103539 ) ( not ( = ?auto_103533 ?auto_103539 ) ) ( not ( = ?auto_103534 ?auto_103539 ) ) ( not ( = ?auto_103535 ?auto_103539 ) ) ( not ( = ?auto_103536 ?auto_103539 ) ) ( not ( = ?auto_103537 ?auto_103539 ) ) ( ON ?auto_103536 ?auto_103537 ) ( CLEAR ?auto_103536 ) ( ON-TABLE ?auto_103538 ) ( ON ?auto_103539 ?auto_103538 ) ( not ( = ?auto_103538 ?auto_103539 ) ) ( not ( = ?auto_103538 ?auto_103537 ) ) ( not ( = ?auto_103538 ?auto_103536 ) ) ( not ( = ?auto_103533 ?auto_103538 ) ) ( not ( = ?auto_103534 ?auto_103538 ) ) ( not ( = ?auto_103535 ?auto_103538 ) ) ( HOLDING ?auto_103535 ) ( CLEAR ?auto_103534 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_103533 ?auto_103534 ?auto_103535 )
      ( MAKE-5PILE ?auto_103533 ?auto_103534 ?auto_103535 ?auto_103536 ?auto_103537 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_103540 - BLOCK
      ?auto_103541 - BLOCK
      ?auto_103542 - BLOCK
      ?auto_103543 - BLOCK
      ?auto_103544 - BLOCK
    )
    :vars
    (
      ?auto_103546 - BLOCK
      ?auto_103545 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_103540 ) ( ON ?auto_103541 ?auto_103540 ) ( not ( = ?auto_103540 ?auto_103541 ) ) ( not ( = ?auto_103540 ?auto_103542 ) ) ( not ( = ?auto_103540 ?auto_103543 ) ) ( not ( = ?auto_103540 ?auto_103544 ) ) ( not ( = ?auto_103541 ?auto_103542 ) ) ( not ( = ?auto_103541 ?auto_103543 ) ) ( not ( = ?auto_103541 ?auto_103544 ) ) ( not ( = ?auto_103542 ?auto_103543 ) ) ( not ( = ?auto_103542 ?auto_103544 ) ) ( not ( = ?auto_103543 ?auto_103544 ) ) ( ON ?auto_103544 ?auto_103546 ) ( not ( = ?auto_103540 ?auto_103546 ) ) ( not ( = ?auto_103541 ?auto_103546 ) ) ( not ( = ?auto_103542 ?auto_103546 ) ) ( not ( = ?auto_103543 ?auto_103546 ) ) ( not ( = ?auto_103544 ?auto_103546 ) ) ( ON ?auto_103543 ?auto_103544 ) ( ON-TABLE ?auto_103545 ) ( ON ?auto_103546 ?auto_103545 ) ( not ( = ?auto_103545 ?auto_103546 ) ) ( not ( = ?auto_103545 ?auto_103544 ) ) ( not ( = ?auto_103545 ?auto_103543 ) ) ( not ( = ?auto_103540 ?auto_103545 ) ) ( not ( = ?auto_103541 ?auto_103545 ) ) ( not ( = ?auto_103542 ?auto_103545 ) ) ( CLEAR ?auto_103541 ) ( ON ?auto_103542 ?auto_103543 ) ( CLEAR ?auto_103542 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_103545 ?auto_103546 ?auto_103544 ?auto_103543 )
      ( MAKE-5PILE ?auto_103540 ?auto_103541 ?auto_103542 ?auto_103543 ?auto_103544 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_103547 - BLOCK
      ?auto_103548 - BLOCK
      ?auto_103549 - BLOCK
      ?auto_103550 - BLOCK
      ?auto_103551 - BLOCK
    )
    :vars
    (
      ?auto_103552 - BLOCK
      ?auto_103553 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_103547 ) ( not ( = ?auto_103547 ?auto_103548 ) ) ( not ( = ?auto_103547 ?auto_103549 ) ) ( not ( = ?auto_103547 ?auto_103550 ) ) ( not ( = ?auto_103547 ?auto_103551 ) ) ( not ( = ?auto_103548 ?auto_103549 ) ) ( not ( = ?auto_103548 ?auto_103550 ) ) ( not ( = ?auto_103548 ?auto_103551 ) ) ( not ( = ?auto_103549 ?auto_103550 ) ) ( not ( = ?auto_103549 ?auto_103551 ) ) ( not ( = ?auto_103550 ?auto_103551 ) ) ( ON ?auto_103551 ?auto_103552 ) ( not ( = ?auto_103547 ?auto_103552 ) ) ( not ( = ?auto_103548 ?auto_103552 ) ) ( not ( = ?auto_103549 ?auto_103552 ) ) ( not ( = ?auto_103550 ?auto_103552 ) ) ( not ( = ?auto_103551 ?auto_103552 ) ) ( ON ?auto_103550 ?auto_103551 ) ( ON-TABLE ?auto_103553 ) ( ON ?auto_103552 ?auto_103553 ) ( not ( = ?auto_103553 ?auto_103552 ) ) ( not ( = ?auto_103553 ?auto_103551 ) ) ( not ( = ?auto_103553 ?auto_103550 ) ) ( not ( = ?auto_103547 ?auto_103553 ) ) ( not ( = ?auto_103548 ?auto_103553 ) ) ( not ( = ?auto_103549 ?auto_103553 ) ) ( ON ?auto_103549 ?auto_103550 ) ( CLEAR ?auto_103549 ) ( HOLDING ?auto_103548 ) ( CLEAR ?auto_103547 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_103547 ?auto_103548 )
      ( MAKE-5PILE ?auto_103547 ?auto_103548 ?auto_103549 ?auto_103550 ?auto_103551 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_103554 - BLOCK
      ?auto_103555 - BLOCK
      ?auto_103556 - BLOCK
      ?auto_103557 - BLOCK
      ?auto_103558 - BLOCK
    )
    :vars
    (
      ?auto_103560 - BLOCK
      ?auto_103559 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_103554 ) ( not ( = ?auto_103554 ?auto_103555 ) ) ( not ( = ?auto_103554 ?auto_103556 ) ) ( not ( = ?auto_103554 ?auto_103557 ) ) ( not ( = ?auto_103554 ?auto_103558 ) ) ( not ( = ?auto_103555 ?auto_103556 ) ) ( not ( = ?auto_103555 ?auto_103557 ) ) ( not ( = ?auto_103555 ?auto_103558 ) ) ( not ( = ?auto_103556 ?auto_103557 ) ) ( not ( = ?auto_103556 ?auto_103558 ) ) ( not ( = ?auto_103557 ?auto_103558 ) ) ( ON ?auto_103558 ?auto_103560 ) ( not ( = ?auto_103554 ?auto_103560 ) ) ( not ( = ?auto_103555 ?auto_103560 ) ) ( not ( = ?auto_103556 ?auto_103560 ) ) ( not ( = ?auto_103557 ?auto_103560 ) ) ( not ( = ?auto_103558 ?auto_103560 ) ) ( ON ?auto_103557 ?auto_103558 ) ( ON-TABLE ?auto_103559 ) ( ON ?auto_103560 ?auto_103559 ) ( not ( = ?auto_103559 ?auto_103560 ) ) ( not ( = ?auto_103559 ?auto_103558 ) ) ( not ( = ?auto_103559 ?auto_103557 ) ) ( not ( = ?auto_103554 ?auto_103559 ) ) ( not ( = ?auto_103555 ?auto_103559 ) ) ( not ( = ?auto_103556 ?auto_103559 ) ) ( ON ?auto_103556 ?auto_103557 ) ( CLEAR ?auto_103554 ) ( ON ?auto_103555 ?auto_103556 ) ( CLEAR ?auto_103555 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_103559 ?auto_103560 ?auto_103558 ?auto_103557 ?auto_103556 )
      ( MAKE-5PILE ?auto_103554 ?auto_103555 ?auto_103556 ?auto_103557 ?auto_103558 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_103561 - BLOCK
      ?auto_103562 - BLOCK
      ?auto_103563 - BLOCK
      ?auto_103564 - BLOCK
      ?auto_103565 - BLOCK
    )
    :vars
    (
      ?auto_103567 - BLOCK
      ?auto_103566 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_103561 ?auto_103562 ) ) ( not ( = ?auto_103561 ?auto_103563 ) ) ( not ( = ?auto_103561 ?auto_103564 ) ) ( not ( = ?auto_103561 ?auto_103565 ) ) ( not ( = ?auto_103562 ?auto_103563 ) ) ( not ( = ?auto_103562 ?auto_103564 ) ) ( not ( = ?auto_103562 ?auto_103565 ) ) ( not ( = ?auto_103563 ?auto_103564 ) ) ( not ( = ?auto_103563 ?auto_103565 ) ) ( not ( = ?auto_103564 ?auto_103565 ) ) ( ON ?auto_103565 ?auto_103567 ) ( not ( = ?auto_103561 ?auto_103567 ) ) ( not ( = ?auto_103562 ?auto_103567 ) ) ( not ( = ?auto_103563 ?auto_103567 ) ) ( not ( = ?auto_103564 ?auto_103567 ) ) ( not ( = ?auto_103565 ?auto_103567 ) ) ( ON ?auto_103564 ?auto_103565 ) ( ON-TABLE ?auto_103566 ) ( ON ?auto_103567 ?auto_103566 ) ( not ( = ?auto_103566 ?auto_103567 ) ) ( not ( = ?auto_103566 ?auto_103565 ) ) ( not ( = ?auto_103566 ?auto_103564 ) ) ( not ( = ?auto_103561 ?auto_103566 ) ) ( not ( = ?auto_103562 ?auto_103566 ) ) ( not ( = ?auto_103563 ?auto_103566 ) ) ( ON ?auto_103563 ?auto_103564 ) ( ON ?auto_103562 ?auto_103563 ) ( CLEAR ?auto_103562 ) ( HOLDING ?auto_103561 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_103561 )
      ( MAKE-5PILE ?auto_103561 ?auto_103562 ?auto_103563 ?auto_103564 ?auto_103565 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_103568 - BLOCK
      ?auto_103569 - BLOCK
      ?auto_103570 - BLOCK
      ?auto_103571 - BLOCK
      ?auto_103572 - BLOCK
    )
    :vars
    (
      ?auto_103573 - BLOCK
      ?auto_103574 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_103568 ?auto_103569 ) ) ( not ( = ?auto_103568 ?auto_103570 ) ) ( not ( = ?auto_103568 ?auto_103571 ) ) ( not ( = ?auto_103568 ?auto_103572 ) ) ( not ( = ?auto_103569 ?auto_103570 ) ) ( not ( = ?auto_103569 ?auto_103571 ) ) ( not ( = ?auto_103569 ?auto_103572 ) ) ( not ( = ?auto_103570 ?auto_103571 ) ) ( not ( = ?auto_103570 ?auto_103572 ) ) ( not ( = ?auto_103571 ?auto_103572 ) ) ( ON ?auto_103572 ?auto_103573 ) ( not ( = ?auto_103568 ?auto_103573 ) ) ( not ( = ?auto_103569 ?auto_103573 ) ) ( not ( = ?auto_103570 ?auto_103573 ) ) ( not ( = ?auto_103571 ?auto_103573 ) ) ( not ( = ?auto_103572 ?auto_103573 ) ) ( ON ?auto_103571 ?auto_103572 ) ( ON-TABLE ?auto_103574 ) ( ON ?auto_103573 ?auto_103574 ) ( not ( = ?auto_103574 ?auto_103573 ) ) ( not ( = ?auto_103574 ?auto_103572 ) ) ( not ( = ?auto_103574 ?auto_103571 ) ) ( not ( = ?auto_103568 ?auto_103574 ) ) ( not ( = ?auto_103569 ?auto_103574 ) ) ( not ( = ?auto_103570 ?auto_103574 ) ) ( ON ?auto_103570 ?auto_103571 ) ( ON ?auto_103569 ?auto_103570 ) ( ON ?auto_103568 ?auto_103569 ) ( CLEAR ?auto_103568 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_103574 ?auto_103573 ?auto_103572 ?auto_103571 ?auto_103570 ?auto_103569 )
      ( MAKE-5PILE ?auto_103568 ?auto_103569 ?auto_103570 ?auto_103571 ?auto_103572 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_103575 - BLOCK
      ?auto_103576 - BLOCK
      ?auto_103577 - BLOCK
      ?auto_103578 - BLOCK
      ?auto_103579 - BLOCK
    )
    :vars
    (
      ?auto_103580 - BLOCK
      ?auto_103581 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_103575 ?auto_103576 ) ) ( not ( = ?auto_103575 ?auto_103577 ) ) ( not ( = ?auto_103575 ?auto_103578 ) ) ( not ( = ?auto_103575 ?auto_103579 ) ) ( not ( = ?auto_103576 ?auto_103577 ) ) ( not ( = ?auto_103576 ?auto_103578 ) ) ( not ( = ?auto_103576 ?auto_103579 ) ) ( not ( = ?auto_103577 ?auto_103578 ) ) ( not ( = ?auto_103577 ?auto_103579 ) ) ( not ( = ?auto_103578 ?auto_103579 ) ) ( ON ?auto_103579 ?auto_103580 ) ( not ( = ?auto_103575 ?auto_103580 ) ) ( not ( = ?auto_103576 ?auto_103580 ) ) ( not ( = ?auto_103577 ?auto_103580 ) ) ( not ( = ?auto_103578 ?auto_103580 ) ) ( not ( = ?auto_103579 ?auto_103580 ) ) ( ON ?auto_103578 ?auto_103579 ) ( ON-TABLE ?auto_103581 ) ( ON ?auto_103580 ?auto_103581 ) ( not ( = ?auto_103581 ?auto_103580 ) ) ( not ( = ?auto_103581 ?auto_103579 ) ) ( not ( = ?auto_103581 ?auto_103578 ) ) ( not ( = ?auto_103575 ?auto_103581 ) ) ( not ( = ?auto_103576 ?auto_103581 ) ) ( not ( = ?auto_103577 ?auto_103581 ) ) ( ON ?auto_103577 ?auto_103578 ) ( ON ?auto_103576 ?auto_103577 ) ( HOLDING ?auto_103575 ) ( CLEAR ?auto_103576 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_103581 ?auto_103580 ?auto_103579 ?auto_103578 ?auto_103577 ?auto_103576 ?auto_103575 )
      ( MAKE-5PILE ?auto_103575 ?auto_103576 ?auto_103577 ?auto_103578 ?auto_103579 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_103582 - BLOCK
      ?auto_103583 - BLOCK
      ?auto_103584 - BLOCK
      ?auto_103585 - BLOCK
      ?auto_103586 - BLOCK
    )
    :vars
    (
      ?auto_103588 - BLOCK
      ?auto_103587 - BLOCK
      ?auto_103589 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_103582 ?auto_103583 ) ) ( not ( = ?auto_103582 ?auto_103584 ) ) ( not ( = ?auto_103582 ?auto_103585 ) ) ( not ( = ?auto_103582 ?auto_103586 ) ) ( not ( = ?auto_103583 ?auto_103584 ) ) ( not ( = ?auto_103583 ?auto_103585 ) ) ( not ( = ?auto_103583 ?auto_103586 ) ) ( not ( = ?auto_103584 ?auto_103585 ) ) ( not ( = ?auto_103584 ?auto_103586 ) ) ( not ( = ?auto_103585 ?auto_103586 ) ) ( ON ?auto_103586 ?auto_103588 ) ( not ( = ?auto_103582 ?auto_103588 ) ) ( not ( = ?auto_103583 ?auto_103588 ) ) ( not ( = ?auto_103584 ?auto_103588 ) ) ( not ( = ?auto_103585 ?auto_103588 ) ) ( not ( = ?auto_103586 ?auto_103588 ) ) ( ON ?auto_103585 ?auto_103586 ) ( ON-TABLE ?auto_103587 ) ( ON ?auto_103588 ?auto_103587 ) ( not ( = ?auto_103587 ?auto_103588 ) ) ( not ( = ?auto_103587 ?auto_103586 ) ) ( not ( = ?auto_103587 ?auto_103585 ) ) ( not ( = ?auto_103582 ?auto_103587 ) ) ( not ( = ?auto_103583 ?auto_103587 ) ) ( not ( = ?auto_103584 ?auto_103587 ) ) ( ON ?auto_103584 ?auto_103585 ) ( ON ?auto_103583 ?auto_103584 ) ( CLEAR ?auto_103583 ) ( ON ?auto_103582 ?auto_103589 ) ( CLEAR ?auto_103582 ) ( HAND-EMPTY ) ( not ( = ?auto_103582 ?auto_103589 ) ) ( not ( = ?auto_103583 ?auto_103589 ) ) ( not ( = ?auto_103584 ?auto_103589 ) ) ( not ( = ?auto_103585 ?auto_103589 ) ) ( not ( = ?auto_103586 ?auto_103589 ) ) ( not ( = ?auto_103588 ?auto_103589 ) ) ( not ( = ?auto_103587 ?auto_103589 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_103582 ?auto_103589 )
      ( MAKE-5PILE ?auto_103582 ?auto_103583 ?auto_103584 ?auto_103585 ?auto_103586 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_103590 - BLOCK
      ?auto_103591 - BLOCK
      ?auto_103592 - BLOCK
      ?auto_103593 - BLOCK
      ?auto_103594 - BLOCK
    )
    :vars
    (
      ?auto_103595 - BLOCK
      ?auto_103597 - BLOCK
      ?auto_103596 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_103590 ?auto_103591 ) ) ( not ( = ?auto_103590 ?auto_103592 ) ) ( not ( = ?auto_103590 ?auto_103593 ) ) ( not ( = ?auto_103590 ?auto_103594 ) ) ( not ( = ?auto_103591 ?auto_103592 ) ) ( not ( = ?auto_103591 ?auto_103593 ) ) ( not ( = ?auto_103591 ?auto_103594 ) ) ( not ( = ?auto_103592 ?auto_103593 ) ) ( not ( = ?auto_103592 ?auto_103594 ) ) ( not ( = ?auto_103593 ?auto_103594 ) ) ( ON ?auto_103594 ?auto_103595 ) ( not ( = ?auto_103590 ?auto_103595 ) ) ( not ( = ?auto_103591 ?auto_103595 ) ) ( not ( = ?auto_103592 ?auto_103595 ) ) ( not ( = ?auto_103593 ?auto_103595 ) ) ( not ( = ?auto_103594 ?auto_103595 ) ) ( ON ?auto_103593 ?auto_103594 ) ( ON-TABLE ?auto_103597 ) ( ON ?auto_103595 ?auto_103597 ) ( not ( = ?auto_103597 ?auto_103595 ) ) ( not ( = ?auto_103597 ?auto_103594 ) ) ( not ( = ?auto_103597 ?auto_103593 ) ) ( not ( = ?auto_103590 ?auto_103597 ) ) ( not ( = ?auto_103591 ?auto_103597 ) ) ( not ( = ?auto_103592 ?auto_103597 ) ) ( ON ?auto_103592 ?auto_103593 ) ( ON ?auto_103590 ?auto_103596 ) ( CLEAR ?auto_103590 ) ( not ( = ?auto_103590 ?auto_103596 ) ) ( not ( = ?auto_103591 ?auto_103596 ) ) ( not ( = ?auto_103592 ?auto_103596 ) ) ( not ( = ?auto_103593 ?auto_103596 ) ) ( not ( = ?auto_103594 ?auto_103596 ) ) ( not ( = ?auto_103595 ?auto_103596 ) ) ( not ( = ?auto_103597 ?auto_103596 ) ) ( HOLDING ?auto_103591 ) ( CLEAR ?auto_103592 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_103597 ?auto_103595 ?auto_103594 ?auto_103593 ?auto_103592 ?auto_103591 )
      ( MAKE-5PILE ?auto_103590 ?auto_103591 ?auto_103592 ?auto_103593 ?auto_103594 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_103598 - BLOCK
      ?auto_103599 - BLOCK
      ?auto_103600 - BLOCK
      ?auto_103601 - BLOCK
      ?auto_103602 - BLOCK
    )
    :vars
    (
      ?auto_103605 - BLOCK
      ?auto_103603 - BLOCK
      ?auto_103604 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_103598 ?auto_103599 ) ) ( not ( = ?auto_103598 ?auto_103600 ) ) ( not ( = ?auto_103598 ?auto_103601 ) ) ( not ( = ?auto_103598 ?auto_103602 ) ) ( not ( = ?auto_103599 ?auto_103600 ) ) ( not ( = ?auto_103599 ?auto_103601 ) ) ( not ( = ?auto_103599 ?auto_103602 ) ) ( not ( = ?auto_103600 ?auto_103601 ) ) ( not ( = ?auto_103600 ?auto_103602 ) ) ( not ( = ?auto_103601 ?auto_103602 ) ) ( ON ?auto_103602 ?auto_103605 ) ( not ( = ?auto_103598 ?auto_103605 ) ) ( not ( = ?auto_103599 ?auto_103605 ) ) ( not ( = ?auto_103600 ?auto_103605 ) ) ( not ( = ?auto_103601 ?auto_103605 ) ) ( not ( = ?auto_103602 ?auto_103605 ) ) ( ON ?auto_103601 ?auto_103602 ) ( ON-TABLE ?auto_103603 ) ( ON ?auto_103605 ?auto_103603 ) ( not ( = ?auto_103603 ?auto_103605 ) ) ( not ( = ?auto_103603 ?auto_103602 ) ) ( not ( = ?auto_103603 ?auto_103601 ) ) ( not ( = ?auto_103598 ?auto_103603 ) ) ( not ( = ?auto_103599 ?auto_103603 ) ) ( not ( = ?auto_103600 ?auto_103603 ) ) ( ON ?auto_103600 ?auto_103601 ) ( ON ?auto_103598 ?auto_103604 ) ( not ( = ?auto_103598 ?auto_103604 ) ) ( not ( = ?auto_103599 ?auto_103604 ) ) ( not ( = ?auto_103600 ?auto_103604 ) ) ( not ( = ?auto_103601 ?auto_103604 ) ) ( not ( = ?auto_103602 ?auto_103604 ) ) ( not ( = ?auto_103605 ?auto_103604 ) ) ( not ( = ?auto_103603 ?auto_103604 ) ) ( CLEAR ?auto_103600 ) ( ON ?auto_103599 ?auto_103598 ) ( CLEAR ?auto_103599 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_103604 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_103604 ?auto_103598 )
      ( MAKE-5PILE ?auto_103598 ?auto_103599 ?auto_103600 ?auto_103601 ?auto_103602 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_103606 - BLOCK
      ?auto_103607 - BLOCK
      ?auto_103608 - BLOCK
      ?auto_103609 - BLOCK
      ?auto_103610 - BLOCK
    )
    :vars
    (
      ?auto_103611 - BLOCK
      ?auto_103613 - BLOCK
      ?auto_103612 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_103606 ?auto_103607 ) ) ( not ( = ?auto_103606 ?auto_103608 ) ) ( not ( = ?auto_103606 ?auto_103609 ) ) ( not ( = ?auto_103606 ?auto_103610 ) ) ( not ( = ?auto_103607 ?auto_103608 ) ) ( not ( = ?auto_103607 ?auto_103609 ) ) ( not ( = ?auto_103607 ?auto_103610 ) ) ( not ( = ?auto_103608 ?auto_103609 ) ) ( not ( = ?auto_103608 ?auto_103610 ) ) ( not ( = ?auto_103609 ?auto_103610 ) ) ( ON ?auto_103610 ?auto_103611 ) ( not ( = ?auto_103606 ?auto_103611 ) ) ( not ( = ?auto_103607 ?auto_103611 ) ) ( not ( = ?auto_103608 ?auto_103611 ) ) ( not ( = ?auto_103609 ?auto_103611 ) ) ( not ( = ?auto_103610 ?auto_103611 ) ) ( ON ?auto_103609 ?auto_103610 ) ( ON-TABLE ?auto_103613 ) ( ON ?auto_103611 ?auto_103613 ) ( not ( = ?auto_103613 ?auto_103611 ) ) ( not ( = ?auto_103613 ?auto_103610 ) ) ( not ( = ?auto_103613 ?auto_103609 ) ) ( not ( = ?auto_103606 ?auto_103613 ) ) ( not ( = ?auto_103607 ?auto_103613 ) ) ( not ( = ?auto_103608 ?auto_103613 ) ) ( ON ?auto_103606 ?auto_103612 ) ( not ( = ?auto_103606 ?auto_103612 ) ) ( not ( = ?auto_103607 ?auto_103612 ) ) ( not ( = ?auto_103608 ?auto_103612 ) ) ( not ( = ?auto_103609 ?auto_103612 ) ) ( not ( = ?auto_103610 ?auto_103612 ) ) ( not ( = ?auto_103611 ?auto_103612 ) ) ( not ( = ?auto_103613 ?auto_103612 ) ) ( ON ?auto_103607 ?auto_103606 ) ( CLEAR ?auto_103607 ) ( ON-TABLE ?auto_103612 ) ( HOLDING ?auto_103608 ) ( CLEAR ?auto_103609 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_103613 ?auto_103611 ?auto_103610 ?auto_103609 ?auto_103608 )
      ( MAKE-5PILE ?auto_103606 ?auto_103607 ?auto_103608 ?auto_103609 ?auto_103610 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_103614 - BLOCK
      ?auto_103615 - BLOCK
      ?auto_103616 - BLOCK
      ?auto_103617 - BLOCK
      ?auto_103618 - BLOCK
    )
    :vars
    (
      ?auto_103619 - BLOCK
      ?auto_103621 - BLOCK
      ?auto_103620 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_103614 ?auto_103615 ) ) ( not ( = ?auto_103614 ?auto_103616 ) ) ( not ( = ?auto_103614 ?auto_103617 ) ) ( not ( = ?auto_103614 ?auto_103618 ) ) ( not ( = ?auto_103615 ?auto_103616 ) ) ( not ( = ?auto_103615 ?auto_103617 ) ) ( not ( = ?auto_103615 ?auto_103618 ) ) ( not ( = ?auto_103616 ?auto_103617 ) ) ( not ( = ?auto_103616 ?auto_103618 ) ) ( not ( = ?auto_103617 ?auto_103618 ) ) ( ON ?auto_103618 ?auto_103619 ) ( not ( = ?auto_103614 ?auto_103619 ) ) ( not ( = ?auto_103615 ?auto_103619 ) ) ( not ( = ?auto_103616 ?auto_103619 ) ) ( not ( = ?auto_103617 ?auto_103619 ) ) ( not ( = ?auto_103618 ?auto_103619 ) ) ( ON ?auto_103617 ?auto_103618 ) ( ON-TABLE ?auto_103621 ) ( ON ?auto_103619 ?auto_103621 ) ( not ( = ?auto_103621 ?auto_103619 ) ) ( not ( = ?auto_103621 ?auto_103618 ) ) ( not ( = ?auto_103621 ?auto_103617 ) ) ( not ( = ?auto_103614 ?auto_103621 ) ) ( not ( = ?auto_103615 ?auto_103621 ) ) ( not ( = ?auto_103616 ?auto_103621 ) ) ( ON ?auto_103614 ?auto_103620 ) ( not ( = ?auto_103614 ?auto_103620 ) ) ( not ( = ?auto_103615 ?auto_103620 ) ) ( not ( = ?auto_103616 ?auto_103620 ) ) ( not ( = ?auto_103617 ?auto_103620 ) ) ( not ( = ?auto_103618 ?auto_103620 ) ) ( not ( = ?auto_103619 ?auto_103620 ) ) ( not ( = ?auto_103621 ?auto_103620 ) ) ( ON ?auto_103615 ?auto_103614 ) ( ON-TABLE ?auto_103620 ) ( CLEAR ?auto_103617 ) ( ON ?auto_103616 ?auto_103615 ) ( CLEAR ?auto_103616 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_103620 ?auto_103614 ?auto_103615 )
      ( MAKE-5PILE ?auto_103614 ?auto_103615 ?auto_103616 ?auto_103617 ?auto_103618 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_103622 - BLOCK
      ?auto_103623 - BLOCK
      ?auto_103624 - BLOCK
      ?auto_103625 - BLOCK
      ?auto_103626 - BLOCK
    )
    :vars
    (
      ?auto_103627 - BLOCK
      ?auto_103629 - BLOCK
      ?auto_103628 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_103622 ?auto_103623 ) ) ( not ( = ?auto_103622 ?auto_103624 ) ) ( not ( = ?auto_103622 ?auto_103625 ) ) ( not ( = ?auto_103622 ?auto_103626 ) ) ( not ( = ?auto_103623 ?auto_103624 ) ) ( not ( = ?auto_103623 ?auto_103625 ) ) ( not ( = ?auto_103623 ?auto_103626 ) ) ( not ( = ?auto_103624 ?auto_103625 ) ) ( not ( = ?auto_103624 ?auto_103626 ) ) ( not ( = ?auto_103625 ?auto_103626 ) ) ( ON ?auto_103626 ?auto_103627 ) ( not ( = ?auto_103622 ?auto_103627 ) ) ( not ( = ?auto_103623 ?auto_103627 ) ) ( not ( = ?auto_103624 ?auto_103627 ) ) ( not ( = ?auto_103625 ?auto_103627 ) ) ( not ( = ?auto_103626 ?auto_103627 ) ) ( ON-TABLE ?auto_103629 ) ( ON ?auto_103627 ?auto_103629 ) ( not ( = ?auto_103629 ?auto_103627 ) ) ( not ( = ?auto_103629 ?auto_103626 ) ) ( not ( = ?auto_103629 ?auto_103625 ) ) ( not ( = ?auto_103622 ?auto_103629 ) ) ( not ( = ?auto_103623 ?auto_103629 ) ) ( not ( = ?auto_103624 ?auto_103629 ) ) ( ON ?auto_103622 ?auto_103628 ) ( not ( = ?auto_103622 ?auto_103628 ) ) ( not ( = ?auto_103623 ?auto_103628 ) ) ( not ( = ?auto_103624 ?auto_103628 ) ) ( not ( = ?auto_103625 ?auto_103628 ) ) ( not ( = ?auto_103626 ?auto_103628 ) ) ( not ( = ?auto_103627 ?auto_103628 ) ) ( not ( = ?auto_103629 ?auto_103628 ) ) ( ON ?auto_103623 ?auto_103622 ) ( ON-TABLE ?auto_103628 ) ( ON ?auto_103624 ?auto_103623 ) ( CLEAR ?auto_103624 ) ( HOLDING ?auto_103625 ) ( CLEAR ?auto_103626 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_103629 ?auto_103627 ?auto_103626 ?auto_103625 )
      ( MAKE-5PILE ?auto_103622 ?auto_103623 ?auto_103624 ?auto_103625 ?auto_103626 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_103630 - BLOCK
      ?auto_103631 - BLOCK
      ?auto_103632 - BLOCK
      ?auto_103633 - BLOCK
      ?auto_103634 - BLOCK
    )
    :vars
    (
      ?auto_103635 - BLOCK
      ?auto_103637 - BLOCK
      ?auto_103636 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_103630 ?auto_103631 ) ) ( not ( = ?auto_103630 ?auto_103632 ) ) ( not ( = ?auto_103630 ?auto_103633 ) ) ( not ( = ?auto_103630 ?auto_103634 ) ) ( not ( = ?auto_103631 ?auto_103632 ) ) ( not ( = ?auto_103631 ?auto_103633 ) ) ( not ( = ?auto_103631 ?auto_103634 ) ) ( not ( = ?auto_103632 ?auto_103633 ) ) ( not ( = ?auto_103632 ?auto_103634 ) ) ( not ( = ?auto_103633 ?auto_103634 ) ) ( ON ?auto_103634 ?auto_103635 ) ( not ( = ?auto_103630 ?auto_103635 ) ) ( not ( = ?auto_103631 ?auto_103635 ) ) ( not ( = ?auto_103632 ?auto_103635 ) ) ( not ( = ?auto_103633 ?auto_103635 ) ) ( not ( = ?auto_103634 ?auto_103635 ) ) ( ON-TABLE ?auto_103637 ) ( ON ?auto_103635 ?auto_103637 ) ( not ( = ?auto_103637 ?auto_103635 ) ) ( not ( = ?auto_103637 ?auto_103634 ) ) ( not ( = ?auto_103637 ?auto_103633 ) ) ( not ( = ?auto_103630 ?auto_103637 ) ) ( not ( = ?auto_103631 ?auto_103637 ) ) ( not ( = ?auto_103632 ?auto_103637 ) ) ( ON ?auto_103630 ?auto_103636 ) ( not ( = ?auto_103630 ?auto_103636 ) ) ( not ( = ?auto_103631 ?auto_103636 ) ) ( not ( = ?auto_103632 ?auto_103636 ) ) ( not ( = ?auto_103633 ?auto_103636 ) ) ( not ( = ?auto_103634 ?auto_103636 ) ) ( not ( = ?auto_103635 ?auto_103636 ) ) ( not ( = ?auto_103637 ?auto_103636 ) ) ( ON ?auto_103631 ?auto_103630 ) ( ON-TABLE ?auto_103636 ) ( ON ?auto_103632 ?auto_103631 ) ( CLEAR ?auto_103634 ) ( ON ?auto_103633 ?auto_103632 ) ( CLEAR ?auto_103633 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_103636 ?auto_103630 ?auto_103631 ?auto_103632 )
      ( MAKE-5PILE ?auto_103630 ?auto_103631 ?auto_103632 ?auto_103633 ?auto_103634 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_103638 - BLOCK
      ?auto_103639 - BLOCK
      ?auto_103640 - BLOCK
      ?auto_103641 - BLOCK
      ?auto_103642 - BLOCK
    )
    :vars
    (
      ?auto_103644 - BLOCK
      ?auto_103643 - BLOCK
      ?auto_103645 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_103638 ?auto_103639 ) ) ( not ( = ?auto_103638 ?auto_103640 ) ) ( not ( = ?auto_103638 ?auto_103641 ) ) ( not ( = ?auto_103638 ?auto_103642 ) ) ( not ( = ?auto_103639 ?auto_103640 ) ) ( not ( = ?auto_103639 ?auto_103641 ) ) ( not ( = ?auto_103639 ?auto_103642 ) ) ( not ( = ?auto_103640 ?auto_103641 ) ) ( not ( = ?auto_103640 ?auto_103642 ) ) ( not ( = ?auto_103641 ?auto_103642 ) ) ( not ( = ?auto_103638 ?auto_103644 ) ) ( not ( = ?auto_103639 ?auto_103644 ) ) ( not ( = ?auto_103640 ?auto_103644 ) ) ( not ( = ?auto_103641 ?auto_103644 ) ) ( not ( = ?auto_103642 ?auto_103644 ) ) ( ON-TABLE ?auto_103643 ) ( ON ?auto_103644 ?auto_103643 ) ( not ( = ?auto_103643 ?auto_103644 ) ) ( not ( = ?auto_103643 ?auto_103642 ) ) ( not ( = ?auto_103643 ?auto_103641 ) ) ( not ( = ?auto_103638 ?auto_103643 ) ) ( not ( = ?auto_103639 ?auto_103643 ) ) ( not ( = ?auto_103640 ?auto_103643 ) ) ( ON ?auto_103638 ?auto_103645 ) ( not ( = ?auto_103638 ?auto_103645 ) ) ( not ( = ?auto_103639 ?auto_103645 ) ) ( not ( = ?auto_103640 ?auto_103645 ) ) ( not ( = ?auto_103641 ?auto_103645 ) ) ( not ( = ?auto_103642 ?auto_103645 ) ) ( not ( = ?auto_103644 ?auto_103645 ) ) ( not ( = ?auto_103643 ?auto_103645 ) ) ( ON ?auto_103639 ?auto_103638 ) ( ON-TABLE ?auto_103645 ) ( ON ?auto_103640 ?auto_103639 ) ( ON ?auto_103641 ?auto_103640 ) ( CLEAR ?auto_103641 ) ( HOLDING ?auto_103642 ) ( CLEAR ?auto_103644 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_103643 ?auto_103644 ?auto_103642 )
      ( MAKE-5PILE ?auto_103638 ?auto_103639 ?auto_103640 ?auto_103641 ?auto_103642 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_103646 - BLOCK
      ?auto_103647 - BLOCK
      ?auto_103648 - BLOCK
      ?auto_103649 - BLOCK
      ?auto_103650 - BLOCK
    )
    :vars
    (
      ?auto_103651 - BLOCK
      ?auto_103653 - BLOCK
      ?auto_103652 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_103646 ?auto_103647 ) ) ( not ( = ?auto_103646 ?auto_103648 ) ) ( not ( = ?auto_103646 ?auto_103649 ) ) ( not ( = ?auto_103646 ?auto_103650 ) ) ( not ( = ?auto_103647 ?auto_103648 ) ) ( not ( = ?auto_103647 ?auto_103649 ) ) ( not ( = ?auto_103647 ?auto_103650 ) ) ( not ( = ?auto_103648 ?auto_103649 ) ) ( not ( = ?auto_103648 ?auto_103650 ) ) ( not ( = ?auto_103649 ?auto_103650 ) ) ( not ( = ?auto_103646 ?auto_103651 ) ) ( not ( = ?auto_103647 ?auto_103651 ) ) ( not ( = ?auto_103648 ?auto_103651 ) ) ( not ( = ?auto_103649 ?auto_103651 ) ) ( not ( = ?auto_103650 ?auto_103651 ) ) ( ON-TABLE ?auto_103653 ) ( ON ?auto_103651 ?auto_103653 ) ( not ( = ?auto_103653 ?auto_103651 ) ) ( not ( = ?auto_103653 ?auto_103650 ) ) ( not ( = ?auto_103653 ?auto_103649 ) ) ( not ( = ?auto_103646 ?auto_103653 ) ) ( not ( = ?auto_103647 ?auto_103653 ) ) ( not ( = ?auto_103648 ?auto_103653 ) ) ( ON ?auto_103646 ?auto_103652 ) ( not ( = ?auto_103646 ?auto_103652 ) ) ( not ( = ?auto_103647 ?auto_103652 ) ) ( not ( = ?auto_103648 ?auto_103652 ) ) ( not ( = ?auto_103649 ?auto_103652 ) ) ( not ( = ?auto_103650 ?auto_103652 ) ) ( not ( = ?auto_103651 ?auto_103652 ) ) ( not ( = ?auto_103653 ?auto_103652 ) ) ( ON ?auto_103647 ?auto_103646 ) ( ON-TABLE ?auto_103652 ) ( ON ?auto_103648 ?auto_103647 ) ( ON ?auto_103649 ?auto_103648 ) ( CLEAR ?auto_103651 ) ( ON ?auto_103650 ?auto_103649 ) ( CLEAR ?auto_103650 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_103652 ?auto_103646 ?auto_103647 ?auto_103648 ?auto_103649 )
      ( MAKE-5PILE ?auto_103646 ?auto_103647 ?auto_103648 ?auto_103649 ?auto_103650 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_103654 - BLOCK
      ?auto_103655 - BLOCK
      ?auto_103656 - BLOCK
      ?auto_103657 - BLOCK
      ?auto_103658 - BLOCK
    )
    :vars
    (
      ?auto_103659 - BLOCK
      ?auto_103660 - BLOCK
      ?auto_103661 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_103654 ?auto_103655 ) ) ( not ( = ?auto_103654 ?auto_103656 ) ) ( not ( = ?auto_103654 ?auto_103657 ) ) ( not ( = ?auto_103654 ?auto_103658 ) ) ( not ( = ?auto_103655 ?auto_103656 ) ) ( not ( = ?auto_103655 ?auto_103657 ) ) ( not ( = ?auto_103655 ?auto_103658 ) ) ( not ( = ?auto_103656 ?auto_103657 ) ) ( not ( = ?auto_103656 ?auto_103658 ) ) ( not ( = ?auto_103657 ?auto_103658 ) ) ( not ( = ?auto_103654 ?auto_103659 ) ) ( not ( = ?auto_103655 ?auto_103659 ) ) ( not ( = ?auto_103656 ?auto_103659 ) ) ( not ( = ?auto_103657 ?auto_103659 ) ) ( not ( = ?auto_103658 ?auto_103659 ) ) ( ON-TABLE ?auto_103660 ) ( not ( = ?auto_103660 ?auto_103659 ) ) ( not ( = ?auto_103660 ?auto_103658 ) ) ( not ( = ?auto_103660 ?auto_103657 ) ) ( not ( = ?auto_103654 ?auto_103660 ) ) ( not ( = ?auto_103655 ?auto_103660 ) ) ( not ( = ?auto_103656 ?auto_103660 ) ) ( ON ?auto_103654 ?auto_103661 ) ( not ( = ?auto_103654 ?auto_103661 ) ) ( not ( = ?auto_103655 ?auto_103661 ) ) ( not ( = ?auto_103656 ?auto_103661 ) ) ( not ( = ?auto_103657 ?auto_103661 ) ) ( not ( = ?auto_103658 ?auto_103661 ) ) ( not ( = ?auto_103659 ?auto_103661 ) ) ( not ( = ?auto_103660 ?auto_103661 ) ) ( ON ?auto_103655 ?auto_103654 ) ( ON-TABLE ?auto_103661 ) ( ON ?auto_103656 ?auto_103655 ) ( ON ?auto_103657 ?auto_103656 ) ( ON ?auto_103658 ?auto_103657 ) ( CLEAR ?auto_103658 ) ( HOLDING ?auto_103659 ) ( CLEAR ?auto_103660 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_103660 ?auto_103659 )
      ( MAKE-5PILE ?auto_103654 ?auto_103655 ?auto_103656 ?auto_103657 ?auto_103658 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_103662 - BLOCK
      ?auto_103663 - BLOCK
      ?auto_103664 - BLOCK
      ?auto_103665 - BLOCK
      ?auto_103666 - BLOCK
    )
    :vars
    (
      ?auto_103667 - BLOCK
      ?auto_103669 - BLOCK
      ?auto_103668 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_103662 ?auto_103663 ) ) ( not ( = ?auto_103662 ?auto_103664 ) ) ( not ( = ?auto_103662 ?auto_103665 ) ) ( not ( = ?auto_103662 ?auto_103666 ) ) ( not ( = ?auto_103663 ?auto_103664 ) ) ( not ( = ?auto_103663 ?auto_103665 ) ) ( not ( = ?auto_103663 ?auto_103666 ) ) ( not ( = ?auto_103664 ?auto_103665 ) ) ( not ( = ?auto_103664 ?auto_103666 ) ) ( not ( = ?auto_103665 ?auto_103666 ) ) ( not ( = ?auto_103662 ?auto_103667 ) ) ( not ( = ?auto_103663 ?auto_103667 ) ) ( not ( = ?auto_103664 ?auto_103667 ) ) ( not ( = ?auto_103665 ?auto_103667 ) ) ( not ( = ?auto_103666 ?auto_103667 ) ) ( ON-TABLE ?auto_103669 ) ( not ( = ?auto_103669 ?auto_103667 ) ) ( not ( = ?auto_103669 ?auto_103666 ) ) ( not ( = ?auto_103669 ?auto_103665 ) ) ( not ( = ?auto_103662 ?auto_103669 ) ) ( not ( = ?auto_103663 ?auto_103669 ) ) ( not ( = ?auto_103664 ?auto_103669 ) ) ( ON ?auto_103662 ?auto_103668 ) ( not ( = ?auto_103662 ?auto_103668 ) ) ( not ( = ?auto_103663 ?auto_103668 ) ) ( not ( = ?auto_103664 ?auto_103668 ) ) ( not ( = ?auto_103665 ?auto_103668 ) ) ( not ( = ?auto_103666 ?auto_103668 ) ) ( not ( = ?auto_103667 ?auto_103668 ) ) ( not ( = ?auto_103669 ?auto_103668 ) ) ( ON ?auto_103663 ?auto_103662 ) ( ON-TABLE ?auto_103668 ) ( ON ?auto_103664 ?auto_103663 ) ( ON ?auto_103665 ?auto_103664 ) ( ON ?auto_103666 ?auto_103665 ) ( CLEAR ?auto_103669 ) ( ON ?auto_103667 ?auto_103666 ) ( CLEAR ?auto_103667 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_103668 ?auto_103662 ?auto_103663 ?auto_103664 ?auto_103665 ?auto_103666 )
      ( MAKE-5PILE ?auto_103662 ?auto_103663 ?auto_103664 ?auto_103665 ?auto_103666 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_103670 - BLOCK
      ?auto_103671 - BLOCK
      ?auto_103672 - BLOCK
      ?auto_103673 - BLOCK
      ?auto_103674 - BLOCK
    )
    :vars
    (
      ?auto_103677 - BLOCK
      ?auto_103675 - BLOCK
      ?auto_103676 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_103670 ?auto_103671 ) ) ( not ( = ?auto_103670 ?auto_103672 ) ) ( not ( = ?auto_103670 ?auto_103673 ) ) ( not ( = ?auto_103670 ?auto_103674 ) ) ( not ( = ?auto_103671 ?auto_103672 ) ) ( not ( = ?auto_103671 ?auto_103673 ) ) ( not ( = ?auto_103671 ?auto_103674 ) ) ( not ( = ?auto_103672 ?auto_103673 ) ) ( not ( = ?auto_103672 ?auto_103674 ) ) ( not ( = ?auto_103673 ?auto_103674 ) ) ( not ( = ?auto_103670 ?auto_103677 ) ) ( not ( = ?auto_103671 ?auto_103677 ) ) ( not ( = ?auto_103672 ?auto_103677 ) ) ( not ( = ?auto_103673 ?auto_103677 ) ) ( not ( = ?auto_103674 ?auto_103677 ) ) ( not ( = ?auto_103675 ?auto_103677 ) ) ( not ( = ?auto_103675 ?auto_103674 ) ) ( not ( = ?auto_103675 ?auto_103673 ) ) ( not ( = ?auto_103670 ?auto_103675 ) ) ( not ( = ?auto_103671 ?auto_103675 ) ) ( not ( = ?auto_103672 ?auto_103675 ) ) ( ON ?auto_103670 ?auto_103676 ) ( not ( = ?auto_103670 ?auto_103676 ) ) ( not ( = ?auto_103671 ?auto_103676 ) ) ( not ( = ?auto_103672 ?auto_103676 ) ) ( not ( = ?auto_103673 ?auto_103676 ) ) ( not ( = ?auto_103674 ?auto_103676 ) ) ( not ( = ?auto_103677 ?auto_103676 ) ) ( not ( = ?auto_103675 ?auto_103676 ) ) ( ON ?auto_103671 ?auto_103670 ) ( ON-TABLE ?auto_103676 ) ( ON ?auto_103672 ?auto_103671 ) ( ON ?auto_103673 ?auto_103672 ) ( ON ?auto_103674 ?auto_103673 ) ( ON ?auto_103677 ?auto_103674 ) ( CLEAR ?auto_103677 ) ( HOLDING ?auto_103675 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_103675 )
      ( MAKE-5PILE ?auto_103670 ?auto_103671 ?auto_103672 ?auto_103673 ?auto_103674 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_103678 - BLOCK
      ?auto_103679 - BLOCK
      ?auto_103680 - BLOCK
      ?auto_103681 - BLOCK
      ?auto_103682 - BLOCK
    )
    :vars
    (
      ?auto_103683 - BLOCK
      ?auto_103684 - BLOCK
      ?auto_103685 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_103678 ?auto_103679 ) ) ( not ( = ?auto_103678 ?auto_103680 ) ) ( not ( = ?auto_103678 ?auto_103681 ) ) ( not ( = ?auto_103678 ?auto_103682 ) ) ( not ( = ?auto_103679 ?auto_103680 ) ) ( not ( = ?auto_103679 ?auto_103681 ) ) ( not ( = ?auto_103679 ?auto_103682 ) ) ( not ( = ?auto_103680 ?auto_103681 ) ) ( not ( = ?auto_103680 ?auto_103682 ) ) ( not ( = ?auto_103681 ?auto_103682 ) ) ( not ( = ?auto_103678 ?auto_103683 ) ) ( not ( = ?auto_103679 ?auto_103683 ) ) ( not ( = ?auto_103680 ?auto_103683 ) ) ( not ( = ?auto_103681 ?auto_103683 ) ) ( not ( = ?auto_103682 ?auto_103683 ) ) ( not ( = ?auto_103684 ?auto_103683 ) ) ( not ( = ?auto_103684 ?auto_103682 ) ) ( not ( = ?auto_103684 ?auto_103681 ) ) ( not ( = ?auto_103678 ?auto_103684 ) ) ( not ( = ?auto_103679 ?auto_103684 ) ) ( not ( = ?auto_103680 ?auto_103684 ) ) ( ON ?auto_103678 ?auto_103685 ) ( not ( = ?auto_103678 ?auto_103685 ) ) ( not ( = ?auto_103679 ?auto_103685 ) ) ( not ( = ?auto_103680 ?auto_103685 ) ) ( not ( = ?auto_103681 ?auto_103685 ) ) ( not ( = ?auto_103682 ?auto_103685 ) ) ( not ( = ?auto_103683 ?auto_103685 ) ) ( not ( = ?auto_103684 ?auto_103685 ) ) ( ON ?auto_103679 ?auto_103678 ) ( ON-TABLE ?auto_103685 ) ( ON ?auto_103680 ?auto_103679 ) ( ON ?auto_103681 ?auto_103680 ) ( ON ?auto_103682 ?auto_103681 ) ( ON ?auto_103683 ?auto_103682 ) ( ON ?auto_103684 ?auto_103683 ) ( CLEAR ?auto_103684 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_103685 ?auto_103678 ?auto_103679 ?auto_103680 ?auto_103681 ?auto_103682 ?auto_103683 )
      ( MAKE-5PILE ?auto_103678 ?auto_103679 ?auto_103680 ?auto_103681 ?auto_103682 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_103687 - BLOCK
    )
    :vars
    (
      ?auto_103688 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_103688 ?auto_103687 ) ( CLEAR ?auto_103688 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_103687 ) ( not ( = ?auto_103687 ?auto_103688 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_103688 ?auto_103687 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_103689 - BLOCK
    )
    :vars
    (
      ?auto_103690 - BLOCK
      ?auto_103691 - BLOCK
      ?auto_103692 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_103690 ?auto_103689 ) ( CLEAR ?auto_103690 ) ( ON-TABLE ?auto_103689 ) ( not ( = ?auto_103689 ?auto_103690 ) ) ( HOLDING ?auto_103691 ) ( CLEAR ?auto_103692 ) ( not ( = ?auto_103689 ?auto_103691 ) ) ( not ( = ?auto_103689 ?auto_103692 ) ) ( not ( = ?auto_103690 ?auto_103691 ) ) ( not ( = ?auto_103690 ?auto_103692 ) ) ( not ( = ?auto_103691 ?auto_103692 ) ) )
    :subtasks
    ( ( !STACK ?auto_103691 ?auto_103692 )
      ( MAKE-1PILE ?auto_103689 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_103693 - BLOCK
    )
    :vars
    (
      ?auto_103695 - BLOCK
      ?auto_103696 - BLOCK
      ?auto_103694 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_103695 ?auto_103693 ) ( ON-TABLE ?auto_103693 ) ( not ( = ?auto_103693 ?auto_103695 ) ) ( CLEAR ?auto_103696 ) ( not ( = ?auto_103693 ?auto_103694 ) ) ( not ( = ?auto_103693 ?auto_103696 ) ) ( not ( = ?auto_103695 ?auto_103694 ) ) ( not ( = ?auto_103695 ?auto_103696 ) ) ( not ( = ?auto_103694 ?auto_103696 ) ) ( ON ?auto_103694 ?auto_103695 ) ( CLEAR ?auto_103694 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_103693 ?auto_103695 )
      ( MAKE-1PILE ?auto_103693 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_103697 - BLOCK
    )
    :vars
    (
      ?auto_103698 - BLOCK
      ?auto_103699 - BLOCK
      ?auto_103700 - BLOCK
      ?auto_103703 - BLOCK
      ?auto_103701 - BLOCK
      ?auto_103702 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_103698 ?auto_103697 ) ( ON-TABLE ?auto_103697 ) ( not ( = ?auto_103697 ?auto_103698 ) ) ( not ( = ?auto_103697 ?auto_103699 ) ) ( not ( = ?auto_103697 ?auto_103700 ) ) ( not ( = ?auto_103698 ?auto_103699 ) ) ( not ( = ?auto_103698 ?auto_103700 ) ) ( not ( = ?auto_103699 ?auto_103700 ) ) ( ON ?auto_103699 ?auto_103698 ) ( CLEAR ?auto_103699 ) ( HOLDING ?auto_103700 ) ( CLEAR ?auto_103703 ) ( ON-TABLE ?auto_103701 ) ( ON ?auto_103702 ?auto_103701 ) ( ON ?auto_103703 ?auto_103702 ) ( not ( = ?auto_103701 ?auto_103702 ) ) ( not ( = ?auto_103701 ?auto_103703 ) ) ( not ( = ?auto_103701 ?auto_103700 ) ) ( not ( = ?auto_103702 ?auto_103703 ) ) ( not ( = ?auto_103702 ?auto_103700 ) ) ( not ( = ?auto_103703 ?auto_103700 ) ) ( not ( = ?auto_103697 ?auto_103703 ) ) ( not ( = ?auto_103697 ?auto_103701 ) ) ( not ( = ?auto_103697 ?auto_103702 ) ) ( not ( = ?auto_103698 ?auto_103703 ) ) ( not ( = ?auto_103698 ?auto_103701 ) ) ( not ( = ?auto_103698 ?auto_103702 ) ) ( not ( = ?auto_103699 ?auto_103703 ) ) ( not ( = ?auto_103699 ?auto_103701 ) ) ( not ( = ?auto_103699 ?auto_103702 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_103701 ?auto_103702 ?auto_103703 ?auto_103700 )
      ( MAKE-1PILE ?auto_103697 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_103704 - BLOCK
    )
    :vars
    (
      ?auto_103707 - BLOCK
      ?auto_103710 - BLOCK
      ?auto_103709 - BLOCK
      ?auto_103705 - BLOCK
      ?auto_103708 - BLOCK
      ?auto_103706 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_103707 ?auto_103704 ) ( ON-TABLE ?auto_103704 ) ( not ( = ?auto_103704 ?auto_103707 ) ) ( not ( = ?auto_103704 ?auto_103710 ) ) ( not ( = ?auto_103704 ?auto_103709 ) ) ( not ( = ?auto_103707 ?auto_103710 ) ) ( not ( = ?auto_103707 ?auto_103709 ) ) ( not ( = ?auto_103710 ?auto_103709 ) ) ( ON ?auto_103710 ?auto_103707 ) ( CLEAR ?auto_103705 ) ( ON-TABLE ?auto_103708 ) ( ON ?auto_103706 ?auto_103708 ) ( ON ?auto_103705 ?auto_103706 ) ( not ( = ?auto_103708 ?auto_103706 ) ) ( not ( = ?auto_103708 ?auto_103705 ) ) ( not ( = ?auto_103708 ?auto_103709 ) ) ( not ( = ?auto_103706 ?auto_103705 ) ) ( not ( = ?auto_103706 ?auto_103709 ) ) ( not ( = ?auto_103705 ?auto_103709 ) ) ( not ( = ?auto_103704 ?auto_103705 ) ) ( not ( = ?auto_103704 ?auto_103708 ) ) ( not ( = ?auto_103704 ?auto_103706 ) ) ( not ( = ?auto_103707 ?auto_103705 ) ) ( not ( = ?auto_103707 ?auto_103708 ) ) ( not ( = ?auto_103707 ?auto_103706 ) ) ( not ( = ?auto_103710 ?auto_103705 ) ) ( not ( = ?auto_103710 ?auto_103708 ) ) ( not ( = ?auto_103710 ?auto_103706 ) ) ( ON ?auto_103709 ?auto_103710 ) ( CLEAR ?auto_103709 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_103704 ?auto_103707 ?auto_103710 )
      ( MAKE-1PILE ?auto_103704 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_103711 - BLOCK
    )
    :vars
    (
      ?auto_103712 - BLOCK
      ?auto_103715 - BLOCK
      ?auto_103716 - BLOCK
      ?auto_103714 - BLOCK
      ?auto_103713 - BLOCK
      ?auto_103717 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_103712 ?auto_103711 ) ( ON-TABLE ?auto_103711 ) ( not ( = ?auto_103711 ?auto_103712 ) ) ( not ( = ?auto_103711 ?auto_103715 ) ) ( not ( = ?auto_103711 ?auto_103716 ) ) ( not ( = ?auto_103712 ?auto_103715 ) ) ( not ( = ?auto_103712 ?auto_103716 ) ) ( not ( = ?auto_103715 ?auto_103716 ) ) ( ON ?auto_103715 ?auto_103712 ) ( ON-TABLE ?auto_103714 ) ( ON ?auto_103713 ?auto_103714 ) ( not ( = ?auto_103714 ?auto_103713 ) ) ( not ( = ?auto_103714 ?auto_103717 ) ) ( not ( = ?auto_103714 ?auto_103716 ) ) ( not ( = ?auto_103713 ?auto_103717 ) ) ( not ( = ?auto_103713 ?auto_103716 ) ) ( not ( = ?auto_103717 ?auto_103716 ) ) ( not ( = ?auto_103711 ?auto_103717 ) ) ( not ( = ?auto_103711 ?auto_103714 ) ) ( not ( = ?auto_103711 ?auto_103713 ) ) ( not ( = ?auto_103712 ?auto_103717 ) ) ( not ( = ?auto_103712 ?auto_103714 ) ) ( not ( = ?auto_103712 ?auto_103713 ) ) ( not ( = ?auto_103715 ?auto_103717 ) ) ( not ( = ?auto_103715 ?auto_103714 ) ) ( not ( = ?auto_103715 ?auto_103713 ) ) ( ON ?auto_103716 ?auto_103715 ) ( CLEAR ?auto_103716 ) ( HOLDING ?auto_103717 ) ( CLEAR ?auto_103713 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_103714 ?auto_103713 ?auto_103717 )
      ( MAKE-1PILE ?auto_103711 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_103718 - BLOCK
    )
    :vars
    (
      ?auto_103724 - BLOCK
      ?auto_103722 - BLOCK
      ?auto_103720 - BLOCK
      ?auto_103723 - BLOCK
      ?auto_103721 - BLOCK
      ?auto_103719 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_103724 ?auto_103718 ) ( ON-TABLE ?auto_103718 ) ( not ( = ?auto_103718 ?auto_103724 ) ) ( not ( = ?auto_103718 ?auto_103722 ) ) ( not ( = ?auto_103718 ?auto_103720 ) ) ( not ( = ?auto_103724 ?auto_103722 ) ) ( not ( = ?auto_103724 ?auto_103720 ) ) ( not ( = ?auto_103722 ?auto_103720 ) ) ( ON ?auto_103722 ?auto_103724 ) ( ON-TABLE ?auto_103723 ) ( ON ?auto_103721 ?auto_103723 ) ( not ( = ?auto_103723 ?auto_103721 ) ) ( not ( = ?auto_103723 ?auto_103719 ) ) ( not ( = ?auto_103723 ?auto_103720 ) ) ( not ( = ?auto_103721 ?auto_103719 ) ) ( not ( = ?auto_103721 ?auto_103720 ) ) ( not ( = ?auto_103719 ?auto_103720 ) ) ( not ( = ?auto_103718 ?auto_103719 ) ) ( not ( = ?auto_103718 ?auto_103723 ) ) ( not ( = ?auto_103718 ?auto_103721 ) ) ( not ( = ?auto_103724 ?auto_103719 ) ) ( not ( = ?auto_103724 ?auto_103723 ) ) ( not ( = ?auto_103724 ?auto_103721 ) ) ( not ( = ?auto_103722 ?auto_103719 ) ) ( not ( = ?auto_103722 ?auto_103723 ) ) ( not ( = ?auto_103722 ?auto_103721 ) ) ( ON ?auto_103720 ?auto_103722 ) ( CLEAR ?auto_103721 ) ( ON ?auto_103719 ?auto_103720 ) ( CLEAR ?auto_103719 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_103718 ?auto_103724 ?auto_103722 ?auto_103720 )
      ( MAKE-1PILE ?auto_103718 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_103725 - BLOCK
    )
    :vars
    (
      ?auto_103730 - BLOCK
      ?auto_103727 - BLOCK
      ?auto_103731 - BLOCK
      ?auto_103729 - BLOCK
      ?auto_103728 - BLOCK
      ?auto_103726 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_103730 ?auto_103725 ) ( ON-TABLE ?auto_103725 ) ( not ( = ?auto_103725 ?auto_103730 ) ) ( not ( = ?auto_103725 ?auto_103727 ) ) ( not ( = ?auto_103725 ?auto_103731 ) ) ( not ( = ?auto_103730 ?auto_103727 ) ) ( not ( = ?auto_103730 ?auto_103731 ) ) ( not ( = ?auto_103727 ?auto_103731 ) ) ( ON ?auto_103727 ?auto_103730 ) ( ON-TABLE ?auto_103729 ) ( not ( = ?auto_103729 ?auto_103728 ) ) ( not ( = ?auto_103729 ?auto_103726 ) ) ( not ( = ?auto_103729 ?auto_103731 ) ) ( not ( = ?auto_103728 ?auto_103726 ) ) ( not ( = ?auto_103728 ?auto_103731 ) ) ( not ( = ?auto_103726 ?auto_103731 ) ) ( not ( = ?auto_103725 ?auto_103726 ) ) ( not ( = ?auto_103725 ?auto_103729 ) ) ( not ( = ?auto_103725 ?auto_103728 ) ) ( not ( = ?auto_103730 ?auto_103726 ) ) ( not ( = ?auto_103730 ?auto_103729 ) ) ( not ( = ?auto_103730 ?auto_103728 ) ) ( not ( = ?auto_103727 ?auto_103726 ) ) ( not ( = ?auto_103727 ?auto_103729 ) ) ( not ( = ?auto_103727 ?auto_103728 ) ) ( ON ?auto_103731 ?auto_103727 ) ( ON ?auto_103726 ?auto_103731 ) ( CLEAR ?auto_103726 ) ( HOLDING ?auto_103728 ) ( CLEAR ?auto_103729 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_103729 ?auto_103728 )
      ( MAKE-1PILE ?auto_103725 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_103732 - BLOCK
    )
    :vars
    (
      ?auto_103737 - BLOCK
      ?auto_103738 - BLOCK
      ?auto_103735 - BLOCK
      ?auto_103734 - BLOCK
      ?auto_103733 - BLOCK
      ?auto_103736 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_103737 ?auto_103732 ) ( ON-TABLE ?auto_103732 ) ( not ( = ?auto_103732 ?auto_103737 ) ) ( not ( = ?auto_103732 ?auto_103738 ) ) ( not ( = ?auto_103732 ?auto_103735 ) ) ( not ( = ?auto_103737 ?auto_103738 ) ) ( not ( = ?auto_103737 ?auto_103735 ) ) ( not ( = ?auto_103738 ?auto_103735 ) ) ( ON ?auto_103738 ?auto_103737 ) ( ON-TABLE ?auto_103734 ) ( not ( = ?auto_103734 ?auto_103733 ) ) ( not ( = ?auto_103734 ?auto_103736 ) ) ( not ( = ?auto_103734 ?auto_103735 ) ) ( not ( = ?auto_103733 ?auto_103736 ) ) ( not ( = ?auto_103733 ?auto_103735 ) ) ( not ( = ?auto_103736 ?auto_103735 ) ) ( not ( = ?auto_103732 ?auto_103736 ) ) ( not ( = ?auto_103732 ?auto_103734 ) ) ( not ( = ?auto_103732 ?auto_103733 ) ) ( not ( = ?auto_103737 ?auto_103736 ) ) ( not ( = ?auto_103737 ?auto_103734 ) ) ( not ( = ?auto_103737 ?auto_103733 ) ) ( not ( = ?auto_103738 ?auto_103736 ) ) ( not ( = ?auto_103738 ?auto_103734 ) ) ( not ( = ?auto_103738 ?auto_103733 ) ) ( ON ?auto_103735 ?auto_103738 ) ( ON ?auto_103736 ?auto_103735 ) ( CLEAR ?auto_103734 ) ( ON ?auto_103733 ?auto_103736 ) ( CLEAR ?auto_103733 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_103732 ?auto_103737 ?auto_103738 ?auto_103735 ?auto_103736 )
      ( MAKE-1PILE ?auto_103732 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_103739 - BLOCK
    )
    :vars
    (
      ?auto_103745 - BLOCK
      ?auto_103743 - BLOCK
      ?auto_103740 - BLOCK
      ?auto_103742 - BLOCK
      ?auto_103744 - BLOCK
      ?auto_103741 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_103745 ?auto_103739 ) ( ON-TABLE ?auto_103739 ) ( not ( = ?auto_103739 ?auto_103745 ) ) ( not ( = ?auto_103739 ?auto_103743 ) ) ( not ( = ?auto_103739 ?auto_103740 ) ) ( not ( = ?auto_103745 ?auto_103743 ) ) ( not ( = ?auto_103745 ?auto_103740 ) ) ( not ( = ?auto_103743 ?auto_103740 ) ) ( ON ?auto_103743 ?auto_103745 ) ( not ( = ?auto_103742 ?auto_103744 ) ) ( not ( = ?auto_103742 ?auto_103741 ) ) ( not ( = ?auto_103742 ?auto_103740 ) ) ( not ( = ?auto_103744 ?auto_103741 ) ) ( not ( = ?auto_103744 ?auto_103740 ) ) ( not ( = ?auto_103741 ?auto_103740 ) ) ( not ( = ?auto_103739 ?auto_103741 ) ) ( not ( = ?auto_103739 ?auto_103742 ) ) ( not ( = ?auto_103739 ?auto_103744 ) ) ( not ( = ?auto_103745 ?auto_103741 ) ) ( not ( = ?auto_103745 ?auto_103742 ) ) ( not ( = ?auto_103745 ?auto_103744 ) ) ( not ( = ?auto_103743 ?auto_103741 ) ) ( not ( = ?auto_103743 ?auto_103742 ) ) ( not ( = ?auto_103743 ?auto_103744 ) ) ( ON ?auto_103740 ?auto_103743 ) ( ON ?auto_103741 ?auto_103740 ) ( ON ?auto_103744 ?auto_103741 ) ( CLEAR ?auto_103744 ) ( HOLDING ?auto_103742 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_103742 )
      ( MAKE-1PILE ?auto_103739 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_103746 - BLOCK
    )
    :vars
    (
      ?auto_103751 - BLOCK
      ?auto_103750 - BLOCK
      ?auto_103747 - BLOCK
      ?auto_103749 - BLOCK
      ?auto_103752 - BLOCK
      ?auto_103748 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_103751 ?auto_103746 ) ( ON-TABLE ?auto_103746 ) ( not ( = ?auto_103746 ?auto_103751 ) ) ( not ( = ?auto_103746 ?auto_103750 ) ) ( not ( = ?auto_103746 ?auto_103747 ) ) ( not ( = ?auto_103751 ?auto_103750 ) ) ( not ( = ?auto_103751 ?auto_103747 ) ) ( not ( = ?auto_103750 ?auto_103747 ) ) ( ON ?auto_103750 ?auto_103751 ) ( not ( = ?auto_103749 ?auto_103752 ) ) ( not ( = ?auto_103749 ?auto_103748 ) ) ( not ( = ?auto_103749 ?auto_103747 ) ) ( not ( = ?auto_103752 ?auto_103748 ) ) ( not ( = ?auto_103752 ?auto_103747 ) ) ( not ( = ?auto_103748 ?auto_103747 ) ) ( not ( = ?auto_103746 ?auto_103748 ) ) ( not ( = ?auto_103746 ?auto_103749 ) ) ( not ( = ?auto_103746 ?auto_103752 ) ) ( not ( = ?auto_103751 ?auto_103748 ) ) ( not ( = ?auto_103751 ?auto_103749 ) ) ( not ( = ?auto_103751 ?auto_103752 ) ) ( not ( = ?auto_103750 ?auto_103748 ) ) ( not ( = ?auto_103750 ?auto_103749 ) ) ( not ( = ?auto_103750 ?auto_103752 ) ) ( ON ?auto_103747 ?auto_103750 ) ( ON ?auto_103748 ?auto_103747 ) ( ON ?auto_103752 ?auto_103748 ) ( ON ?auto_103749 ?auto_103752 ) ( CLEAR ?auto_103749 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_103746 ?auto_103751 ?auto_103750 ?auto_103747 ?auto_103748 ?auto_103752 )
      ( MAKE-1PILE ?auto_103746 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_103753 - BLOCK
    )
    :vars
    (
      ?auto_103754 - BLOCK
      ?auto_103759 - BLOCK
      ?auto_103755 - BLOCK
      ?auto_103757 - BLOCK
      ?auto_103758 - BLOCK
      ?auto_103756 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_103754 ?auto_103753 ) ( ON-TABLE ?auto_103753 ) ( not ( = ?auto_103753 ?auto_103754 ) ) ( not ( = ?auto_103753 ?auto_103759 ) ) ( not ( = ?auto_103753 ?auto_103755 ) ) ( not ( = ?auto_103754 ?auto_103759 ) ) ( not ( = ?auto_103754 ?auto_103755 ) ) ( not ( = ?auto_103759 ?auto_103755 ) ) ( ON ?auto_103759 ?auto_103754 ) ( not ( = ?auto_103757 ?auto_103758 ) ) ( not ( = ?auto_103757 ?auto_103756 ) ) ( not ( = ?auto_103757 ?auto_103755 ) ) ( not ( = ?auto_103758 ?auto_103756 ) ) ( not ( = ?auto_103758 ?auto_103755 ) ) ( not ( = ?auto_103756 ?auto_103755 ) ) ( not ( = ?auto_103753 ?auto_103756 ) ) ( not ( = ?auto_103753 ?auto_103757 ) ) ( not ( = ?auto_103753 ?auto_103758 ) ) ( not ( = ?auto_103754 ?auto_103756 ) ) ( not ( = ?auto_103754 ?auto_103757 ) ) ( not ( = ?auto_103754 ?auto_103758 ) ) ( not ( = ?auto_103759 ?auto_103756 ) ) ( not ( = ?auto_103759 ?auto_103757 ) ) ( not ( = ?auto_103759 ?auto_103758 ) ) ( ON ?auto_103755 ?auto_103759 ) ( ON ?auto_103756 ?auto_103755 ) ( ON ?auto_103758 ?auto_103756 ) ( HOLDING ?auto_103757 ) ( CLEAR ?auto_103758 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_103753 ?auto_103754 ?auto_103759 ?auto_103755 ?auto_103756 ?auto_103758 ?auto_103757 )
      ( MAKE-1PILE ?auto_103753 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_103760 - BLOCK
    )
    :vars
    (
      ?auto_103762 - BLOCK
      ?auto_103764 - BLOCK
      ?auto_103766 - BLOCK
      ?auto_103763 - BLOCK
      ?auto_103761 - BLOCK
      ?auto_103765 - BLOCK
      ?auto_103767 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_103762 ?auto_103760 ) ( ON-TABLE ?auto_103760 ) ( not ( = ?auto_103760 ?auto_103762 ) ) ( not ( = ?auto_103760 ?auto_103764 ) ) ( not ( = ?auto_103760 ?auto_103766 ) ) ( not ( = ?auto_103762 ?auto_103764 ) ) ( not ( = ?auto_103762 ?auto_103766 ) ) ( not ( = ?auto_103764 ?auto_103766 ) ) ( ON ?auto_103764 ?auto_103762 ) ( not ( = ?auto_103763 ?auto_103761 ) ) ( not ( = ?auto_103763 ?auto_103765 ) ) ( not ( = ?auto_103763 ?auto_103766 ) ) ( not ( = ?auto_103761 ?auto_103765 ) ) ( not ( = ?auto_103761 ?auto_103766 ) ) ( not ( = ?auto_103765 ?auto_103766 ) ) ( not ( = ?auto_103760 ?auto_103765 ) ) ( not ( = ?auto_103760 ?auto_103763 ) ) ( not ( = ?auto_103760 ?auto_103761 ) ) ( not ( = ?auto_103762 ?auto_103765 ) ) ( not ( = ?auto_103762 ?auto_103763 ) ) ( not ( = ?auto_103762 ?auto_103761 ) ) ( not ( = ?auto_103764 ?auto_103765 ) ) ( not ( = ?auto_103764 ?auto_103763 ) ) ( not ( = ?auto_103764 ?auto_103761 ) ) ( ON ?auto_103766 ?auto_103764 ) ( ON ?auto_103765 ?auto_103766 ) ( ON ?auto_103761 ?auto_103765 ) ( CLEAR ?auto_103761 ) ( ON ?auto_103763 ?auto_103767 ) ( CLEAR ?auto_103763 ) ( HAND-EMPTY ) ( not ( = ?auto_103760 ?auto_103767 ) ) ( not ( = ?auto_103762 ?auto_103767 ) ) ( not ( = ?auto_103764 ?auto_103767 ) ) ( not ( = ?auto_103766 ?auto_103767 ) ) ( not ( = ?auto_103763 ?auto_103767 ) ) ( not ( = ?auto_103761 ?auto_103767 ) ) ( not ( = ?auto_103765 ?auto_103767 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_103763 ?auto_103767 )
      ( MAKE-1PILE ?auto_103760 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_103768 - BLOCK
    )
    :vars
    (
      ?auto_103774 - BLOCK
      ?auto_103772 - BLOCK
      ?auto_103773 - BLOCK
      ?auto_103769 - BLOCK
      ?auto_103770 - BLOCK
      ?auto_103771 - BLOCK
      ?auto_103775 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_103774 ?auto_103768 ) ( ON-TABLE ?auto_103768 ) ( not ( = ?auto_103768 ?auto_103774 ) ) ( not ( = ?auto_103768 ?auto_103772 ) ) ( not ( = ?auto_103768 ?auto_103773 ) ) ( not ( = ?auto_103774 ?auto_103772 ) ) ( not ( = ?auto_103774 ?auto_103773 ) ) ( not ( = ?auto_103772 ?auto_103773 ) ) ( ON ?auto_103772 ?auto_103774 ) ( not ( = ?auto_103769 ?auto_103770 ) ) ( not ( = ?auto_103769 ?auto_103771 ) ) ( not ( = ?auto_103769 ?auto_103773 ) ) ( not ( = ?auto_103770 ?auto_103771 ) ) ( not ( = ?auto_103770 ?auto_103773 ) ) ( not ( = ?auto_103771 ?auto_103773 ) ) ( not ( = ?auto_103768 ?auto_103771 ) ) ( not ( = ?auto_103768 ?auto_103769 ) ) ( not ( = ?auto_103768 ?auto_103770 ) ) ( not ( = ?auto_103774 ?auto_103771 ) ) ( not ( = ?auto_103774 ?auto_103769 ) ) ( not ( = ?auto_103774 ?auto_103770 ) ) ( not ( = ?auto_103772 ?auto_103771 ) ) ( not ( = ?auto_103772 ?auto_103769 ) ) ( not ( = ?auto_103772 ?auto_103770 ) ) ( ON ?auto_103773 ?auto_103772 ) ( ON ?auto_103771 ?auto_103773 ) ( ON ?auto_103769 ?auto_103775 ) ( CLEAR ?auto_103769 ) ( not ( = ?auto_103768 ?auto_103775 ) ) ( not ( = ?auto_103774 ?auto_103775 ) ) ( not ( = ?auto_103772 ?auto_103775 ) ) ( not ( = ?auto_103773 ?auto_103775 ) ) ( not ( = ?auto_103769 ?auto_103775 ) ) ( not ( = ?auto_103770 ?auto_103775 ) ) ( not ( = ?auto_103771 ?auto_103775 ) ) ( HOLDING ?auto_103770 ) ( CLEAR ?auto_103771 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_103768 ?auto_103774 ?auto_103772 ?auto_103773 ?auto_103771 ?auto_103770 )
      ( MAKE-1PILE ?auto_103768 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_103776 - BLOCK
    )
    :vars
    (
      ?auto_103778 - BLOCK
      ?auto_103782 - BLOCK
      ?auto_103783 - BLOCK
      ?auto_103780 - BLOCK
      ?auto_103779 - BLOCK
      ?auto_103781 - BLOCK
      ?auto_103777 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_103778 ?auto_103776 ) ( ON-TABLE ?auto_103776 ) ( not ( = ?auto_103776 ?auto_103778 ) ) ( not ( = ?auto_103776 ?auto_103782 ) ) ( not ( = ?auto_103776 ?auto_103783 ) ) ( not ( = ?auto_103778 ?auto_103782 ) ) ( not ( = ?auto_103778 ?auto_103783 ) ) ( not ( = ?auto_103782 ?auto_103783 ) ) ( ON ?auto_103782 ?auto_103778 ) ( not ( = ?auto_103780 ?auto_103779 ) ) ( not ( = ?auto_103780 ?auto_103781 ) ) ( not ( = ?auto_103780 ?auto_103783 ) ) ( not ( = ?auto_103779 ?auto_103781 ) ) ( not ( = ?auto_103779 ?auto_103783 ) ) ( not ( = ?auto_103781 ?auto_103783 ) ) ( not ( = ?auto_103776 ?auto_103781 ) ) ( not ( = ?auto_103776 ?auto_103780 ) ) ( not ( = ?auto_103776 ?auto_103779 ) ) ( not ( = ?auto_103778 ?auto_103781 ) ) ( not ( = ?auto_103778 ?auto_103780 ) ) ( not ( = ?auto_103778 ?auto_103779 ) ) ( not ( = ?auto_103782 ?auto_103781 ) ) ( not ( = ?auto_103782 ?auto_103780 ) ) ( not ( = ?auto_103782 ?auto_103779 ) ) ( ON ?auto_103783 ?auto_103782 ) ( ON ?auto_103781 ?auto_103783 ) ( ON ?auto_103780 ?auto_103777 ) ( not ( = ?auto_103776 ?auto_103777 ) ) ( not ( = ?auto_103778 ?auto_103777 ) ) ( not ( = ?auto_103782 ?auto_103777 ) ) ( not ( = ?auto_103783 ?auto_103777 ) ) ( not ( = ?auto_103780 ?auto_103777 ) ) ( not ( = ?auto_103779 ?auto_103777 ) ) ( not ( = ?auto_103781 ?auto_103777 ) ) ( CLEAR ?auto_103781 ) ( ON ?auto_103779 ?auto_103780 ) ( CLEAR ?auto_103779 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_103777 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_103777 ?auto_103780 )
      ( MAKE-1PILE ?auto_103776 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_103784 - BLOCK
    )
    :vars
    (
      ?auto_103791 - BLOCK
      ?auto_103786 - BLOCK
      ?auto_103789 - BLOCK
      ?auto_103788 - BLOCK
      ?auto_103790 - BLOCK
      ?auto_103787 - BLOCK
      ?auto_103785 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_103791 ?auto_103784 ) ( ON-TABLE ?auto_103784 ) ( not ( = ?auto_103784 ?auto_103791 ) ) ( not ( = ?auto_103784 ?auto_103786 ) ) ( not ( = ?auto_103784 ?auto_103789 ) ) ( not ( = ?auto_103791 ?auto_103786 ) ) ( not ( = ?auto_103791 ?auto_103789 ) ) ( not ( = ?auto_103786 ?auto_103789 ) ) ( ON ?auto_103786 ?auto_103791 ) ( not ( = ?auto_103788 ?auto_103790 ) ) ( not ( = ?auto_103788 ?auto_103787 ) ) ( not ( = ?auto_103788 ?auto_103789 ) ) ( not ( = ?auto_103790 ?auto_103787 ) ) ( not ( = ?auto_103790 ?auto_103789 ) ) ( not ( = ?auto_103787 ?auto_103789 ) ) ( not ( = ?auto_103784 ?auto_103787 ) ) ( not ( = ?auto_103784 ?auto_103788 ) ) ( not ( = ?auto_103784 ?auto_103790 ) ) ( not ( = ?auto_103791 ?auto_103787 ) ) ( not ( = ?auto_103791 ?auto_103788 ) ) ( not ( = ?auto_103791 ?auto_103790 ) ) ( not ( = ?auto_103786 ?auto_103787 ) ) ( not ( = ?auto_103786 ?auto_103788 ) ) ( not ( = ?auto_103786 ?auto_103790 ) ) ( ON ?auto_103789 ?auto_103786 ) ( ON ?auto_103788 ?auto_103785 ) ( not ( = ?auto_103784 ?auto_103785 ) ) ( not ( = ?auto_103791 ?auto_103785 ) ) ( not ( = ?auto_103786 ?auto_103785 ) ) ( not ( = ?auto_103789 ?auto_103785 ) ) ( not ( = ?auto_103788 ?auto_103785 ) ) ( not ( = ?auto_103790 ?auto_103785 ) ) ( not ( = ?auto_103787 ?auto_103785 ) ) ( ON ?auto_103790 ?auto_103788 ) ( CLEAR ?auto_103790 ) ( ON-TABLE ?auto_103785 ) ( HOLDING ?auto_103787 ) ( CLEAR ?auto_103789 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_103784 ?auto_103791 ?auto_103786 ?auto_103789 ?auto_103787 )
      ( MAKE-1PILE ?auto_103784 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_103792 - BLOCK
    )
    :vars
    (
      ?auto_103796 - BLOCK
      ?auto_103794 - BLOCK
      ?auto_103797 - BLOCK
      ?auto_103793 - BLOCK
      ?auto_103799 - BLOCK
      ?auto_103795 - BLOCK
      ?auto_103798 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_103796 ?auto_103792 ) ( ON-TABLE ?auto_103792 ) ( not ( = ?auto_103792 ?auto_103796 ) ) ( not ( = ?auto_103792 ?auto_103794 ) ) ( not ( = ?auto_103792 ?auto_103797 ) ) ( not ( = ?auto_103796 ?auto_103794 ) ) ( not ( = ?auto_103796 ?auto_103797 ) ) ( not ( = ?auto_103794 ?auto_103797 ) ) ( ON ?auto_103794 ?auto_103796 ) ( not ( = ?auto_103793 ?auto_103799 ) ) ( not ( = ?auto_103793 ?auto_103795 ) ) ( not ( = ?auto_103793 ?auto_103797 ) ) ( not ( = ?auto_103799 ?auto_103795 ) ) ( not ( = ?auto_103799 ?auto_103797 ) ) ( not ( = ?auto_103795 ?auto_103797 ) ) ( not ( = ?auto_103792 ?auto_103795 ) ) ( not ( = ?auto_103792 ?auto_103793 ) ) ( not ( = ?auto_103792 ?auto_103799 ) ) ( not ( = ?auto_103796 ?auto_103795 ) ) ( not ( = ?auto_103796 ?auto_103793 ) ) ( not ( = ?auto_103796 ?auto_103799 ) ) ( not ( = ?auto_103794 ?auto_103795 ) ) ( not ( = ?auto_103794 ?auto_103793 ) ) ( not ( = ?auto_103794 ?auto_103799 ) ) ( ON ?auto_103797 ?auto_103794 ) ( ON ?auto_103793 ?auto_103798 ) ( not ( = ?auto_103792 ?auto_103798 ) ) ( not ( = ?auto_103796 ?auto_103798 ) ) ( not ( = ?auto_103794 ?auto_103798 ) ) ( not ( = ?auto_103797 ?auto_103798 ) ) ( not ( = ?auto_103793 ?auto_103798 ) ) ( not ( = ?auto_103799 ?auto_103798 ) ) ( not ( = ?auto_103795 ?auto_103798 ) ) ( ON ?auto_103799 ?auto_103793 ) ( ON-TABLE ?auto_103798 ) ( CLEAR ?auto_103797 ) ( ON ?auto_103795 ?auto_103799 ) ( CLEAR ?auto_103795 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_103798 ?auto_103793 ?auto_103799 )
      ( MAKE-1PILE ?auto_103792 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_103800 - BLOCK
    )
    :vars
    (
      ?auto_103801 - BLOCK
      ?auto_103805 - BLOCK
      ?auto_103802 - BLOCK
      ?auto_103806 - BLOCK
      ?auto_103807 - BLOCK
      ?auto_103803 - BLOCK
      ?auto_103804 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_103801 ?auto_103800 ) ( ON-TABLE ?auto_103800 ) ( not ( = ?auto_103800 ?auto_103801 ) ) ( not ( = ?auto_103800 ?auto_103805 ) ) ( not ( = ?auto_103800 ?auto_103802 ) ) ( not ( = ?auto_103801 ?auto_103805 ) ) ( not ( = ?auto_103801 ?auto_103802 ) ) ( not ( = ?auto_103805 ?auto_103802 ) ) ( ON ?auto_103805 ?auto_103801 ) ( not ( = ?auto_103806 ?auto_103807 ) ) ( not ( = ?auto_103806 ?auto_103803 ) ) ( not ( = ?auto_103806 ?auto_103802 ) ) ( not ( = ?auto_103807 ?auto_103803 ) ) ( not ( = ?auto_103807 ?auto_103802 ) ) ( not ( = ?auto_103803 ?auto_103802 ) ) ( not ( = ?auto_103800 ?auto_103803 ) ) ( not ( = ?auto_103800 ?auto_103806 ) ) ( not ( = ?auto_103800 ?auto_103807 ) ) ( not ( = ?auto_103801 ?auto_103803 ) ) ( not ( = ?auto_103801 ?auto_103806 ) ) ( not ( = ?auto_103801 ?auto_103807 ) ) ( not ( = ?auto_103805 ?auto_103803 ) ) ( not ( = ?auto_103805 ?auto_103806 ) ) ( not ( = ?auto_103805 ?auto_103807 ) ) ( ON ?auto_103806 ?auto_103804 ) ( not ( = ?auto_103800 ?auto_103804 ) ) ( not ( = ?auto_103801 ?auto_103804 ) ) ( not ( = ?auto_103805 ?auto_103804 ) ) ( not ( = ?auto_103802 ?auto_103804 ) ) ( not ( = ?auto_103806 ?auto_103804 ) ) ( not ( = ?auto_103807 ?auto_103804 ) ) ( not ( = ?auto_103803 ?auto_103804 ) ) ( ON ?auto_103807 ?auto_103806 ) ( ON-TABLE ?auto_103804 ) ( ON ?auto_103803 ?auto_103807 ) ( CLEAR ?auto_103803 ) ( HOLDING ?auto_103802 ) ( CLEAR ?auto_103805 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_103800 ?auto_103801 ?auto_103805 ?auto_103802 )
      ( MAKE-1PILE ?auto_103800 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_103808 - BLOCK
    )
    :vars
    (
      ?auto_103809 - BLOCK
      ?auto_103815 - BLOCK
      ?auto_103813 - BLOCK
      ?auto_103810 - BLOCK
      ?auto_103814 - BLOCK
      ?auto_103811 - BLOCK
      ?auto_103812 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_103809 ?auto_103808 ) ( ON-TABLE ?auto_103808 ) ( not ( = ?auto_103808 ?auto_103809 ) ) ( not ( = ?auto_103808 ?auto_103815 ) ) ( not ( = ?auto_103808 ?auto_103813 ) ) ( not ( = ?auto_103809 ?auto_103815 ) ) ( not ( = ?auto_103809 ?auto_103813 ) ) ( not ( = ?auto_103815 ?auto_103813 ) ) ( ON ?auto_103815 ?auto_103809 ) ( not ( = ?auto_103810 ?auto_103814 ) ) ( not ( = ?auto_103810 ?auto_103811 ) ) ( not ( = ?auto_103810 ?auto_103813 ) ) ( not ( = ?auto_103814 ?auto_103811 ) ) ( not ( = ?auto_103814 ?auto_103813 ) ) ( not ( = ?auto_103811 ?auto_103813 ) ) ( not ( = ?auto_103808 ?auto_103811 ) ) ( not ( = ?auto_103808 ?auto_103810 ) ) ( not ( = ?auto_103808 ?auto_103814 ) ) ( not ( = ?auto_103809 ?auto_103811 ) ) ( not ( = ?auto_103809 ?auto_103810 ) ) ( not ( = ?auto_103809 ?auto_103814 ) ) ( not ( = ?auto_103815 ?auto_103811 ) ) ( not ( = ?auto_103815 ?auto_103810 ) ) ( not ( = ?auto_103815 ?auto_103814 ) ) ( ON ?auto_103810 ?auto_103812 ) ( not ( = ?auto_103808 ?auto_103812 ) ) ( not ( = ?auto_103809 ?auto_103812 ) ) ( not ( = ?auto_103815 ?auto_103812 ) ) ( not ( = ?auto_103813 ?auto_103812 ) ) ( not ( = ?auto_103810 ?auto_103812 ) ) ( not ( = ?auto_103814 ?auto_103812 ) ) ( not ( = ?auto_103811 ?auto_103812 ) ) ( ON ?auto_103814 ?auto_103810 ) ( ON-TABLE ?auto_103812 ) ( ON ?auto_103811 ?auto_103814 ) ( CLEAR ?auto_103815 ) ( ON ?auto_103813 ?auto_103811 ) ( CLEAR ?auto_103813 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_103812 ?auto_103810 ?auto_103814 ?auto_103811 )
      ( MAKE-1PILE ?auto_103808 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_103816 - BLOCK
    )
    :vars
    (
      ?auto_103817 - BLOCK
      ?auto_103822 - BLOCK
      ?auto_103818 - BLOCK
      ?auto_103820 - BLOCK
      ?auto_103821 - BLOCK
      ?auto_103819 - BLOCK
      ?auto_103823 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_103817 ?auto_103816 ) ( ON-TABLE ?auto_103816 ) ( not ( = ?auto_103816 ?auto_103817 ) ) ( not ( = ?auto_103816 ?auto_103822 ) ) ( not ( = ?auto_103816 ?auto_103818 ) ) ( not ( = ?auto_103817 ?auto_103822 ) ) ( not ( = ?auto_103817 ?auto_103818 ) ) ( not ( = ?auto_103822 ?auto_103818 ) ) ( not ( = ?auto_103820 ?auto_103821 ) ) ( not ( = ?auto_103820 ?auto_103819 ) ) ( not ( = ?auto_103820 ?auto_103818 ) ) ( not ( = ?auto_103821 ?auto_103819 ) ) ( not ( = ?auto_103821 ?auto_103818 ) ) ( not ( = ?auto_103819 ?auto_103818 ) ) ( not ( = ?auto_103816 ?auto_103819 ) ) ( not ( = ?auto_103816 ?auto_103820 ) ) ( not ( = ?auto_103816 ?auto_103821 ) ) ( not ( = ?auto_103817 ?auto_103819 ) ) ( not ( = ?auto_103817 ?auto_103820 ) ) ( not ( = ?auto_103817 ?auto_103821 ) ) ( not ( = ?auto_103822 ?auto_103819 ) ) ( not ( = ?auto_103822 ?auto_103820 ) ) ( not ( = ?auto_103822 ?auto_103821 ) ) ( ON ?auto_103820 ?auto_103823 ) ( not ( = ?auto_103816 ?auto_103823 ) ) ( not ( = ?auto_103817 ?auto_103823 ) ) ( not ( = ?auto_103822 ?auto_103823 ) ) ( not ( = ?auto_103818 ?auto_103823 ) ) ( not ( = ?auto_103820 ?auto_103823 ) ) ( not ( = ?auto_103821 ?auto_103823 ) ) ( not ( = ?auto_103819 ?auto_103823 ) ) ( ON ?auto_103821 ?auto_103820 ) ( ON-TABLE ?auto_103823 ) ( ON ?auto_103819 ?auto_103821 ) ( ON ?auto_103818 ?auto_103819 ) ( CLEAR ?auto_103818 ) ( HOLDING ?auto_103822 ) ( CLEAR ?auto_103817 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_103816 ?auto_103817 ?auto_103822 )
      ( MAKE-1PILE ?auto_103816 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_103824 - BLOCK
    )
    :vars
    (
      ?auto_103831 - BLOCK
      ?auto_103826 - BLOCK
      ?auto_103827 - BLOCK
      ?auto_103830 - BLOCK
      ?auto_103825 - BLOCK
      ?auto_103829 - BLOCK
      ?auto_103828 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_103831 ?auto_103824 ) ( ON-TABLE ?auto_103824 ) ( not ( = ?auto_103824 ?auto_103831 ) ) ( not ( = ?auto_103824 ?auto_103826 ) ) ( not ( = ?auto_103824 ?auto_103827 ) ) ( not ( = ?auto_103831 ?auto_103826 ) ) ( not ( = ?auto_103831 ?auto_103827 ) ) ( not ( = ?auto_103826 ?auto_103827 ) ) ( not ( = ?auto_103830 ?auto_103825 ) ) ( not ( = ?auto_103830 ?auto_103829 ) ) ( not ( = ?auto_103830 ?auto_103827 ) ) ( not ( = ?auto_103825 ?auto_103829 ) ) ( not ( = ?auto_103825 ?auto_103827 ) ) ( not ( = ?auto_103829 ?auto_103827 ) ) ( not ( = ?auto_103824 ?auto_103829 ) ) ( not ( = ?auto_103824 ?auto_103830 ) ) ( not ( = ?auto_103824 ?auto_103825 ) ) ( not ( = ?auto_103831 ?auto_103829 ) ) ( not ( = ?auto_103831 ?auto_103830 ) ) ( not ( = ?auto_103831 ?auto_103825 ) ) ( not ( = ?auto_103826 ?auto_103829 ) ) ( not ( = ?auto_103826 ?auto_103830 ) ) ( not ( = ?auto_103826 ?auto_103825 ) ) ( ON ?auto_103830 ?auto_103828 ) ( not ( = ?auto_103824 ?auto_103828 ) ) ( not ( = ?auto_103831 ?auto_103828 ) ) ( not ( = ?auto_103826 ?auto_103828 ) ) ( not ( = ?auto_103827 ?auto_103828 ) ) ( not ( = ?auto_103830 ?auto_103828 ) ) ( not ( = ?auto_103825 ?auto_103828 ) ) ( not ( = ?auto_103829 ?auto_103828 ) ) ( ON ?auto_103825 ?auto_103830 ) ( ON-TABLE ?auto_103828 ) ( ON ?auto_103829 ?auto_103825 ) ( ON ?auto_103827 ?auto_103829 ) ( CLEAR ?auto_103831 ) ( ON ?auto_103826 ?auto_103827 ) ( CLEAR ?auto_103826 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_103828 ?auto_103830 ?auto_103825 ?auto_103829 ?auto_103827 )
      ( MAKE-1PILE ?auto_103824 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_103848 - BLOCK
    )
    :vars
    (
      ?auto_103854 - BLOCK
      ?auto_103851 - BLOCK
      ?auto_103849 - BLOCK
      ?auto_103850 - BLOCK
      ?auto_103852 - BLOCK
      ?auto_103855 - BLOCK
      ?auto_103853 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_103848 ?auto_103854 ) ) ( not ( = ?auto_103848 ?auto_103851 ) ) ( not ( = ?auto_103848 ?auto_103849 ) ) ( not ( = ?auto_103854 ?auto_103851 ) ) ( not ( = ?auto_103854 ?auto_103849 ) ) ( not ( = ?auto_103851 ?auto_103849 ) ) ( not ( = ?auto_103850 ?auto_103852 ) ) ( not ( = ?auto_103850 ?auto_103855 ) ) ( not ( = ?auto_103850 ?auto_103849 ) ) ( not ( = ?auto_103852 ?auto_103855 ) ) ( not ( = ?auto_103852 ?auto_103849 ) ) ( not ( = ?auto_103855 ?auto_103849 ) ) ( not ( = ?auto_103848 ?auto_103855 ) ) ( not ( = ?auto_103848 ?auto_103850 ) ) ( not ( = ?auto_103848 ?auto_103852 ) ) ( not ( = ?auto_103854 ?auto_103855 ) ) ( not ( = ?auto_103854 ?auto_103850 ) ) ( not ( = ?auto_103854 ?auto_103852 ) ) ( not ( = ?auto_103851 ?auto_103855 ) ) ( not ( = ?auto_103851 ?auto_103850 ) ) ( not ( = ?auto_103851 ?auto_103852 ) ) ( ON ?auto_103850 ?auto_103853 ) ( not ( = ?auto_103848 ?auto_103853 ) ) ( not ( = ?auto_103854 ?auto_103853 ) ) ( not ( = ?auto_103851 ?auto_103853 ) ) ( not ( = ?auto_103849 ?auto_103853 ) ) ( not ( = ?auto_103850 ?auto_103853 ) ) ( not ( = ?auto_103852 ?auto_103853 ) ) ( not ( = ?auto_103855 ?auto_103853 ) ) ( ON ?auto_103852 ?auto_103850 ) ( ON-TABLE ?auto_103853 ) ( ON ?auto_103855 ?auto_103852 ) ( ON ?auto_103849 ?auto_103855 ) ( ON ?auto_103851 ?auto_103849 ) ( ON ?auto_103854 ?auto_103851 ) ( CLEAR ?auto_103854 ) ( HOLDING ?auto_103848 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_103848 ?auto_103854 )
      ( MAKE-1PILE ?auto_103848 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_103856 - BLOCK
    )
    :vars
    (
      ?auto_103858 - BLOCK
      ?auto_103860 - BLOCK
      ?auto_103861 - BLOCK
      ?auto_103863 - BLOCK
      ?auto_103859 - BLOCK
      ?auto_103857 - BLOCK
      ?auto_103862 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_103856 ?auto_103858 ) ) ( not ( = ?auto_103856 ?auto_103860 ) ) ( not ( = ?auto_103856 ?auto_103861 ) ) ( not ( = ?auto_103858 ?auto_103860 ) ) ( not ( = ?auto_103858 ?auto_103861 ) ) ( not ( = ?auto_103860 ?auto_103861 ) ) ( not ( = ?auto_103863 ?auto_103859 ) ) ( not ( = ?auto_103863 ?auto_103857 ) ) ( not ( = ?auto_103863 ?auto_103861 ) ) ( not ( = ?auto_103859 ?auto_103857 ) ) ( not ( = ?auto_103859 ?auto_103861 ) ) ( not ( = ?auto_103857 ?auto_103861 ) ) ( not ( = ?auto_103856 ?auto_103857 ) ) ( not ( = ?auto_103856 ?auto_103863 ) ) ( not ( = ?auto_103856 ?auto_103859 ) ) ( not ( = ?auto_103858 ?auto_103857 ) ) ( not ( = ?auto_103858 ?auto_103863 ) ) ( not ( = ?auto_103858 ?auto_103859 ) ) ( not ( = ?auto_103860 ?auto_103857 ) ) ( not ( = ?auto_103860 ?auto_103863 ) ) ( not ( = ?auto_103860 ?auto_103859 ) ) ( ON ?auto_103863 ?auto_103862 ) ( not ( = ?auto_103856 ?auto_103862 ) ) ( not ( = ?auto_103858 ?auto_103862 ) ) ( not ( = ?auto_103860 ?auto_103862 ) ) ( not ( = ?auto_103861 ?auto_103862 ) ) ( not ( = ?auto_103863 ?auto_103862 ) ) ( not ( = ?auto_103859 ?auto_103862 ) ) ( not ( = ?auto_103857 ?auto_103862 ) ) ( ON ?auto_103859 ?auto_103863 ) ( ON-TABLE ?auto_103862 ) ( ON ?auto_103857 ?auto_103859 ) ( ON ?auto_103861 ?auto_103857 ) ( ON ?auto_103860 ?auto_103861 ) ( ON ?auto_103858 ?auto_103860 ) ( ON ?auto_103856 ?auto_103858 ) ( CLEAR ?auto_103856 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_103862 ?auto_103863 ?auto_103859 ?auto_103857 ?auto_103861 ?auto_103860 ?auto_103858 )
      ( MAKE-1PILE ?auto_103856 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_103870 - BLOCK
      ?auto_103871 - BLOCK
      ?auto_103872 - BLOCK
      ?auto_103873 - BLOCK
      ?auto_103874 - BLOCK
      ?auto_103875 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_103875 ) ( CLEAR ?auto_103874 ) ( ON-TABLE ?auto_103870 ) ( ON ?auto_103871 ?auto_103870 ) ( ON ?auto_103872 ?auto_103871 ) ( ON ?auto_103873 ?auto_103872 ) ( ON ?auto_103874 ?auto_103873 ) ( not ( = ?auto_103870 ?auto_103871 ) ) ( not ( = ?auto_103870 ?auto_103872 ) ) ( not ( = ?auto_103870 ?auto_103873 ) ) ( not ( = ?auto_103870 ?auto_103874 ) ) ( not ( = ?auto_103870 ?auto_103875 ) ) ( not ( = ?auto_103871 ?auto_103872 ) ) ( not ( = ?auto_103871 ?auto_103873 ) ) ( not ( = ?auto_103871 ?auto_103874 ) ) ( not ( = ?auto_103871 ?auto_103875 ) ) ( not ( = ?auto_103872 ?auto_103873 ) ) ( not ( = ?auto_103872 ?auto_103874 ) ) ( not ( = ?auto_103872 ?auto_103875 ) ) ( not ( = ?auto_103873 ?auto_103874 ) ) ( not ( = ?auto_103873 ?auto_103875 ) ) ( not ( = ?auto_103874 ?auto_103875 ) ) )
    :subtasks
    ( ( !STACK ?auto_103875 ?auto_103874 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_103876 - BLOCK
      ?auto_103877 - BLOCK
      ?auto_103878 - BLOCK
      ?auto_103879 - BLOCK
      ?auto_103880 - BLOCK
      ?auto_103881 - BLOCK
    )
    :vars
    (
      ?auto_103882 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_103880 ) ( ON-TABLE ?auto_103876 ) ( ON ?auto_103877 ?auto_103876 ) ( ON ?auto_103878 ?auto_103877 ) ( ON ?auto_103879 ?auto_103878 ) ( ON ?auto_103880 ?auto_103879 ) ( not ( = ?auto_103876 ?auto_103877 ) ) ( not ( = ?auto_103876 ?auto_103878 ) ) ( not ( = ?auto_103876 ?auto_103879 ) ) ( not ( = ?auto_103876 ?auto_103880 ) ) ( not ( = ?auto_103876 ?auto_103881 ) ) ( not ( = ?auto_103877 ?auto_103878 ) ) ( not ( = ?auto_103877 ?auto_103879 ) ) ( not ( = ?auto_103877 ?auto_103880 ) ) ( not ( = ?auto_103877 ?auto_103881 ) ) ( not ( = ?auto_103878 ?auto_103879 ) ) ( not ( = ?auto_103878 ?auto_103880 ) ) ( not ( = ?auto_103878 ?auto_103881 ) ) ( not ( = ?auto_103879 ?auto_103880 ) ) ( not ( = ?auto_103879 ?auto_103881 ) ) ( not ( = ?auto_103880 ?auto_103881 ) ) ( ON ?auto_103881 ?auto_103882 ) ( CLEAR ?auto_103881 ) ( HAND-EMPTY ) ( not ( = ?auto_103876 ?auto_103882 ) ) ( not ( = ?auto_103877 ?auto_103882 ) ) ( not ( = ?auto_103878 ?auto_103882 ) ) ( not ( = ?auto_103879 ?auto_103882 ) ) ( not ( = ?auto_103880 ?auto_103882 ) ) ( not ( = ?auto_103881 ?auto_103882 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_103881 ?auto_103882 )
      ( MAKE-6PILE ?auto_103876 ?auto_103877 ?auto_103878 ?auto_103879 ?auto_103880 ?auto_103881 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_103883 - BLOCK
      ?auto_103884 - BLOCK
      ?auto_103885 - BLOCK
      ?auto_103886 - BLOCK
      ?auto_103887 - BLOCK
      ?auto_103888 - BLOCK
    )
    :vars
    (
      ?auto_103889 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_103883 ) ( ON ?auto_103884 ?auto_103883 ) ( ON ?auto_103885 ?auto_103884 ) ( ON ?auto_103886 ?auto_103885 ) ( not ( = ?auto_103883 ?auto_103884 ) ) ( not ( = ?auto_103883 ?auto_103885 ) ) ( not ( = ?auto_103883 ?auto_103886 ) ) ( not ( = ?auto_103883 ?auto_103887 ) ) ( not ( = ?auto_103883 ?auto_103888 ) ) ( not ( = ?auto_103884 ?auto_103885 ) ) ( not ( = ?auto_103884 ?auto_103886 ) ) ( not ( = ?auto_103884 ?auto_103887 ) ) ( not ( = ?auto_103884 ?auto_103888 ) ) ( not ( = ?auto_103885 ?auto_103886 ) ) ( not ( = ?auto_103885 ?auto_103887 ) ) ( not ( = ?auto_103885 ?auto_103888 ) ) ( not ( = ?auto_103886 ?auto_103887 ) ) ( not ( = ?auto_103886 ?auto_103888 ) ) ( not ( = ?auto_103887 ?auto_103888 ) ) ( ON ?auto_103888 ?auto_103889 ) ( CLEAR ?auto_103888 ) ( not ( = ?auto_103883 ?auto_103889 ) ) ( not ( = ?auto_103884 ?auto_103889 ) ) ( not ( = ?auto_103885 ?auto_103889 ) ) ( not ( = ?auto_103886 ?auto_103889 ) ) ( not ( = ?auto_103887 ?auto_103889 ) ) ( not ( = ?auto_103888 ?auto_103889 ) ) ( HOLDING ?auto_103887 ) ( CLEAR ?auto_103886 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_103883 ?auto_103884 ?auto_103885 ?auto_103886 ?auto_103887 )
      ( MAKE-6PILE ?auto_103883 ?auto_103884 ?auto_103885 ?auto_103886 ?auto_103887 ?auto_103888 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_103890 - BLOCK
      ?auto_103891 - BLOCK
      ?auto_103892 - BLOCK
      ?auto_103893 - BLOCK
      ?auto_103894 - BLOCK
      ?auto_103895 - BLOCK
    )
    :vars
    (
      ?auto_103896 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_103890 ) ( ON ?auto_103891 ?auto_103890 ) ( ON ?auto_103892 ?auto_103891 ) ( ON ?auto_103893 ?auto_103892 ) ( not ( = ?auto_103890 ?auto_103891 ) ) ( not ( = ?auto_103890 ?auto_103892 ) ) ( not ( = ?auto_103890 ?auto_103893 ) ) ( not ( = ?auto_103890 ?auto_103894 ) ) ( not ( = ?auto_103890 ?auto_103895 ) ) ( not ( = ?auto_103891 ?auto_103892 ) ) ( not ( = ?auto_103891 ?auto_103893 ) ) ( not ( = ?auto_103891 ?auto_103894 ) ) ( not ( = ?auto_103891 ?auto_103895 ) ) ( not ( = ?auto_103892 ?auto_103893 ) ) ( not ( = ?auto_103892 ?auto_103894 ) ) ( not ( = ?auto_103892 ?auto_103895 ) ) ( not ( = ?auto_103893 ?auto_103894 ) ) ( not ( = ?auto_103893 ?auto_103895 ) ) ( not ( = ?auto_103894 ?auto_103895 ) ) ( ON ?auto_103895 ?auto_103896 ) ( not ( = ?auto_103890 ?auto_103896 ) ) ( not ( = ?auto_103891 ?auto_103896 ) ) ( not ( = ?auto_103892 ?auto_103896 ) ) ( not ( = ?auto_103893 ?auto_103896 ) ) ( not ( = ?auto_103894 ?auto_103896 ) ) ( not ( = ?auto_103895 ?auto_103896 ) ) ( CLEAR ?auto_103893 ) ( ON ?auto_103894 ?auto_103895 ) ( CLEAR ?auto_103894 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_103896 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_103896 ?auto_103895 )
      ( MAKE-6PILE ?auto_103890 ?auto_103891 ?auto_103892 ?auto_103893 ?auto_103894 ?auto_103895 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_103897 - BLOCK
      ?auto_103898 - BLOCK
      ?auto_103899 - BLOCK
      ?auto_103900 - BLOCK
      ?auto_103901 - BLOCK
      ?auto_103902 - BLOCK
    )
    :vars
    (
      ?auto_103903 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_103897 ) ( ON ?auto_103898 ?auto_103897 ) ( ON ?auto_103899 ?auto_103898 ) ( not ( = ?auto_103897 ?auto_103898 ) ) ( not ( = ?auto_103897 ?auto_103899 ) ) ( not ( = ?auto_103897 ?auto_103900 ) ) ( not ( = ?auto_103897 ?auto_103901 ) ) ( not ( = ?auto_103897 ?auto_103902 ) ) ( not ( = ?auto_103898 ?auto_103899 ) ) ( not ( = ?auto_103898 ?auto_103900 ) ) ( not ( = ?auto_103898 ?auto_103901 ) ) ( not ( = ?auto_103898 ?auto_103902 ) ) ( not ( = ?auto_103899 ?auto_103900 ) ) ( not ( = ?auto_103899 ?auto_103901 ) ) ( not ( = ?auto_103899 ?auto_103902 ) ) ( not ( = ?auto_103900 ?auto_103901 ) ) ( not ( = ?auto_103900 ?auto_103902 ) ) ( not ( = ?auto_103901 ?auto_103902 ) ) ( ON ?auto_103902 ?auto_103903 ) ( not ( = ?auto_103897 ?auto_103903 ) ) ( not ( = ?auto_103898 ?auto_103903 ) ) ( not ( = ?auto_103899 ?auto_103903 ) ) ( not ( = ?auto_103900 ?auto_103903 ) ) ( not ( = ?auto_103901 ?auto_103903 ) ) ( not ( = ?auto_103902 ?auto_103903 ) ) ( ON ?auto_103901 ?auto_103902 ) ( CLEAR ?auto_103901 ) ( ON-TABLE ?auto_103903 ) ( HOLDING ?auto_103900 ) ( CLEAR ?auto_103899 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_103897 ?auto_103898 ?auto_103899 ?auto_103900 )
      ( MAKE-6PILE ?auto_103897 ?auto_103898 ?auto_103899 ?auto_103900 ?auto_103901 ?auto_103902 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_103904 - BLOCK
      ?auto_103905 - BLOCK
      ?auto_103906 - BLOCK
      ?auto_103907 - BLOCK
      ?auto_103908 - BLOCK
      ?auto_103909 - BLOCK
    )
    :vars
    (
      ?auto_103910 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_103904 ) ( ON ?auto_103905 ?auto_103904 ) ( ON ?auto_103906 ?auto_103905 ) ( not ( = ?auto_103904 ?auto_103905 ) ) ( not ( = ?auto_103904 ?auto_103906 ) ) ( not ( = ?auto_103904 ?auto_103907 ) ) ( not ( = ?auto_103904 ?auto_103908 ) ) ( not ( = ?auto_103904 ?auto_103909 ) ) ( not ( = ?auto_103905 ?auto_103906 ) ) ( not ( = ?auto_103905 ?auto_103907 ) ) ( not ( = ?auto_103905 ?auto_103908 ) ) ( not ( = ?auto_103905 ?auto_103909 ) ) ( not ( = ?auto_103906 ?auto_103907 ) ) ( not ( = ?auto_103906 ?auto_103908 ) ) ( not ( = ?auto_103906 ?auto_103909 ) ) ( not ( = ?auto_103907 ?auto_103908 ) ) ( not ( = ?auto_103907 ?auto_103909 ) ) ( not ( = ?auto_103908 ?auto_103909 ) ) ( ON ?auto_103909 ?auto_103910 ) ( not ( = ?auto_103904 ?auto_103910 ) ) ( not ( = ?auto_103905 ?auto_103910 ) ) ( not ( = ?auto_103906 ?auto_103910 ) ) ( not ( = ?auto_103907 ?auto_103910 ) ) ( not ( = ?auto_103908 ?auto_103910 ) ) ( not ( = ?auto_103909 ?auto_103910 ) ) ( ON ?auto_103908 ?auto_103909 ) ( ON-TABLE ?auto_103910 ) ( CLEAR ?auto_103906 ) ( ON ?auto_103907 ?auto_103908 ) ( CLEAR ?auto_103907 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_103910 ?auto_103909 ?auto_103908 )
      ( MAKE-6PILE ?auto_103904 ?auto_103905 ?auto_103906 ?auto_103907 ?auto_103908 ?auto_103909 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_103911 - BLOCK
      ?auto_103912 - BLOCK
      ?auto_103913 - BLOCK
      ?auto_103914 - BLOCK
      ?auto_103915 - BLOCK
      ?auto_103916 - BLOCK
    )
    :vars
    (
      ?auto_103917 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_103911 ) ( ON ?auto_103912 ?auto_103911 ) ( not ( = ?auto_103911 ?auto_103912 ) ) ( not ( = ?auto_103911 ?auto_103913 ) ) ( not ( = ?auto_103911 ?auto_103914 ) ) ( not ( = ?auto_103911 ?auto_103915 ) ) ( not ( = ?auto_103911 ?auto_103916 ) ) ( not ( = ?auto_103912 ?auto_103913 ) ) ( not ( = ?auto_103912 ?auto_103914 ) ) ( not ( = ?auto_103912 ?auto_103915 ) ) ( not ( = ?auto_103912 ?auto_103916 ) ) ( not ( = ?auto_103913 ?auto_103914 ) ) ( not ( = ?auto_103913 ?auto_103915 ) ) ( not ( = ?auto_103913 ?auto_103916 ) ) ( not ( = ?auto_103914 ?auto_103915 ) ) ( not ( = ?auto_103914 ?auto_103916 ) ) ( not ( = ?auto_103915 ?auto_103916 ) ) ( ON ?auto_103916 ?auto_103917 ) ( not ( = ?auto_103911 ?auto_103917 ) ) ( not ( = ?auto_103912 ?auto_103917 ) ) ( not ( = ?auto_103913 ?auto_103917 ) ) ( not ( = ?auto_103914 ?auto_103917 ) ) ( not ( = ?auto_103915 ?auto_103917 ) ) ( not ( = ?auto_103916 ?auto_103917 ) ) ( ON ?auto_103915 ?auto_103916 ) ( ON-TABLE ?auto_103917 ) ( ON ?auto_103914 ?auto_103915 ) ( CLEAR ?auto_103914 ) ( HOLDING ?auto_103913 ) ( CLEAR ?auto_103912 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_103911 ?auto_103912 ?auto_103913 )
      ( MAKE-6PILE ?auto_103911 ?auto_103912 ?auto_103913 ?auto_103914 ?auto_103915 ?auto_103916 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_103918 - BLOCK
      ?auto_103919 - BLOCK
      ?auto_103920 - BLOCK
      ?auto_103921 - BLOCK
      ?auto_103922 - BLOCK
      ?auto_103923 - BLOCK
    )
    :vars
    (
      ?auto_103924 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_103918 ) ( ON ?auto_103919 ?auto_103918 ) ( not ( = ?auto_103918 ?auto_103919 ) ) ( not ( = ?auto_103918 ?auto_103920 ) ) ( not ( = ?auto_103918 ?auto_103921 ) ) ( not ( = ?auto_103918 ?auto_103922 ) ) ( not ( = ?auto_103918 ?auto_103923 ) ) ( not ( = ?auto_103919 ?auto_103920 ) ) ( not ( = ?auto_103919 ?auto_103921 ) ) ( not ( = ?auto_103919 ?auto_103922 ) ) ( not ( = ?auto_103919 ?auto_103923 ) ) ( not ( = ?auto_103920 ?auto_103921 ) ) ( not ( = ?auto_103920 ?auto_103922 ) ) ( not ( = ?auto_103920 ?auto_103923 ) ) ( not ( = ?auto_103921 ?auto_103922 ) ) ( not ( = ?auto_103921 ?auto_103923 ) ) ( not ( = ?auto_103922 ?auto_103923 ) ) ( ON ?auto_103923 ?auto_103924 ) ( not ( = ?auto_103918 ?auto_103924 ) ) ( not ( = ?auto_103919 ?auto_103924 ) ) ( not ( = ?auto_103920 ?auto_103924 ) ) ( not ( = ?auto_103921 ?auto_103924 ) ) ( not ( = ?auto_103922 ?auto_103924 ) ) ( not ( = ?auto_103923 ?auto_103924 ) ) ( ON ?auto_103922 ?auto_103923 ) ( ON-TABLE ?auto_103924 ) ( ON ?auto_103921 ?auto_103922 ) ( CLEAR ?auto_103919 ) ( ON ?auto_103920 ?auto_103921 ) ( CLEAR ?auto_103920 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_103924 ?auto_103923 ?auto_103922 ?auto_103921 )
      ( MAKE-6PILE ?auto_103918 ?auto_103919 ?auto_103920 ?auto_103921 ?auto_103922 ?auto_103923 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_103925 - BLOCK
      ?auto_103926 - BLOCK
      ?auto_103927 - BLOCK
      ?auto_103928 - BLOCK
      ?auto_103929 - BLOCK
      ?auto_103930 - BLOCK
    )
    :vars
    (
      ?auto_103931 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_103925 ) ( not ( = ?auto_103925 ?auto_103926 ) ) ( not ( = ?auto_103925 ?auto_103927 ) ) ( not ( = ?auto_103925 ?auto_103928 ) ) ( not ( = ?auto_103925 ?auto_103929 ) ) ( not ( = ?auto_103925 ?auto_103930 ) ) ( not ( = ?auto_103926 ?auto_103927 ) ) ( not ( = ?auto_103926 ?auto_103928 ) ) ( not ( = ?auto_103926 ?auto_103929 ) ) ( not ( = ?auto_103926 ?auto_103930 ) ) ( not ( = ?auto_103927 ?auto_103928 ) ) ( not ( = ?auto_103927 ?auto_103929 ) ) ( not ( = ?auto_103927 ?auto_103930 ) ) ( not ( = ?auto_103928 ?auto_103929 ) ) ( not ( = ?auto_103928 ?auto_103930 ) ) ( not ( = ?auto_103929 ?auto_103930 ) ) ( ON ?auto_103930 ?auto_103931 ) ( not ( = ?auto_103925 ?auto_103931 ) ) ( not ( = ?auto_103926 ?auto_103931 ) ) ( not ( = ?auto_103927 ?auto_103931 ) ) ( not ( = ?auto_103928 ?auto_103931 ) ) ( not ( = ?auto_103929 ?auto_103931 ) ) ( not ( = ?auto_103930 ?auto_103931 ) ) ( ON ?auto_103929 ?auto_103930 ) ( ON-TABLE ?auto_103931 ) ( ON ?auto_103928 ?auto_103929 ) ( ON ?auto_103927 ?auto_103928 ) ( CLEAR ?auto_103927 ) ( HOLDING ?auto_103926 ) ( CLEAR ?auto_103925 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_103925 ?auto_103926 )
      ( MAKE-6PILE ?auto_103925 ?auto_103926 ?auto_103927 ?auto_103928 ?auto_103929 ?auto_103930 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_103932 - BLOCK
      ?auto_103933 - BLOCK
      ?auto_103934 - BLOCK
      ?auto_103935 - BLOCK
      ?auto_103936 - BLOCK
      ?auto_103937 - BLOCK
    )
    :vars
    (
      ?auto_103938 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_103932 ) ( not ( = ?auto_103932 ?auto_103933 ) ) ( not ( = ?auto_103932 ?auto_103934 ) ) ( not ( = ?auto_103932 ?auto_103935 ) ) ( not ( = ?auto_103932 ?auto_103936 ) ) ( not ( = ?auto_103932 ?auto_103937 ) ) ( not ( = ?auto_103933 ?auto_103934 ) ) ( not ( = ?auto_103933 ?auto_103935 ) ) ( not ( = ?auto_103933 ?auto_103936 ) ) ( not ( = ?auto_103933 ?auto_103937 ) ) ( not ( = ?auto_103934 ?auto_103935 ) ) ( not ( = ?auto_103934 ?auto_103936 ) ) ( not ( = ?auto_103934 ?auto_103937 ) ) ( not ( = ?auto_103935 ?auto_103936 ) ) ( not ( = ?auto_103935 ?auto_103937 ) ) ( not ( = ?auto_103936 ?auto_103937 ) ) ( ON ?auto_103937 ?auto_103938 ) ( not ( = ?auto_103932 ?auto_103938 ) ) ( not ( = ?auto_103933 ?auto_103938 ) ) ( not ( = ?auto_103934 ?auto_103938 ) ) ( not ( = ?auto_103935 ?auto_103938 ) ) ( not ( = ?auto_103936 ?auto_103938 ) ) ( not ( = ?auto_103937 ?auto_103938 ) ) ( ON ?auto_103936 ?auto_103937 ) ( ON-TABLE ?auto_103938 ) ( ON ?auto_103935 ?auto_103936 ) ( ON ?auto_103934 ?auto_103935 ) ( CLEAR ?auto_103932 ) ( ON ?auto_103933 ?auto_103934 ) ( CLEAR ?auto_103933 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_103938 ?auto_103937 ?auto_103936 ?auto_103935 ?auto_103934 )
      ( MAKE-6PILE ?auto_103932 ?auto_103933 ?auto_103934 ?auto_103935 ?auto_103936 ?auto_103937 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_103939 - BLOCK
      ?auto_103940 - BLOCK
      ?auto_103941 - BLOCK
      ?auto_103942 - BLOCK
      ?auto_103943 - BLOCK
      ?auto_103944 - BLOCK
    )
    :vars
    (
      ?auto_103945 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_103939 ?auto_103940 ) ) ( not ( = ?auto_103939 ?auto_103941 ) ) ( not ( = ?auto_103939 ?auto_103942 ) ) ( not ( = ?auto_103939 ?auto_103943 ) ) ( not ( = ?auto_103939 ?auto_103944 ) ) ( not ( = ?auto_103940 ?auto_103941 ) ) ( not ( = ?auto_103940 ?auto_103942 ) ) ( not ( = ?auto_103940 ?auto_103943 ) ) ( not ( = ?auto_103940 ?auto_103944 ) ) ( not ( = ?auto_103941 ?auto_103942 ) ) ( not ( = ?auto_103941 ?auto_103943 ) ) ( not ( = ?auto_103941 ?auto_103944 ) ) ( not ( = ?auto_103942 ?auto_103943 ) ) ( not ( = ?auto_103942 ?auto_103944 ) ) ( not ( = ?auto_103943 ?auto_103944 ) ) ( ON ?auto_103944 ?auto_103945 ) ( not ( = ?auto_103939 ?auto_103945 ) ) ( not ( = ?auto_103940 ?auto_103945 ) ) ( not ( = ?auto_103941 ?auto_103945 ) ) ( not ( = ?auto_103942 ?auto_103945 ) ) ( not ( = ?auto_103943 ?auto_103945 ) ) ( not ( = ?auto_103944 ?auto_103945 ) ) ( ON ?auto_103943 ?auto_103944 ) ( ON-TABLE ?auto_103945 ) ( ON ?auto_103942 ?auto_103943 ) ( ON ?auto_103941 ?auto_103942 ) ( ON ?auto_103940 ?auto_103941 ) ( CLEAR ?auto_103940 ) ( HOLDING ?auto_103939 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_103939 )
      ( MAKE-6PILE ?auto_103939 ?auto_103940 ?auto_103941 ?auto_103942 ?auto_103943 ?auto_103944 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_103946 - BLOCK
      ?auto_103947 - BLOCK
      ?auto_103948 - BLOCK
      ?auto_103949 - BLOCK
      ?auto_103950 - BLOCK
      ?auto_103951 - BLOCK
    )
    :vars
    (
      ?auto_103952 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_103946 ?auto_103947 ) ) ( not ( = ?auto_103946 ?auto_103948 ) ) ( not ( = ?auto_103946 ?auto_103949 ) ) ( not ( = ?auto_103946 ?auto_103950 ) ) ( not ( = ?auto_103946 ?auto_103951 ) ) ( not ( = ?auto_103947 ?auto_103948 ) ) ( not ( = ?auto_103947 ?auto_103949 ) ) ( not ( = ?auto_103947 ?auto_103950 ) ) ( not ( = ?auto_103947 ?auto_103951 ) ) ( not ( = ?auto_103948 ?auto_103949 ) ) ( not ( = ?auto_103948 ?auto_103950 ) ) ( not ( = ?auto_103948 ?auto_103951 ) ) ( not ( = ?auto_103949 ?auto_103950 ) ) ( not ( = ?auto_103949 ?auto_103951 ) ) ( not ( = ?auto_103950 ?auto_103951 ) ) ( ON ?auto_103951 ?auto_103952 ) ( not ( = ?auto_103946 ?auto_103952 ) ) ( not ( = ?auto_103947 ?auto_103952 ) ) ( not ( = ?auto_103948 ?auto_103952 ) ) ( not ( = ?auto_103949 ?auto_103952 ) ) ( not ( = ?auto_103950 ?auto_103952 ) ) ( not ( = ?auto_103951 ?auto_103952 ) ) ( ON ?auto_103950 ?auto_103951 ) ( ON-TABLE ?auto_103952 ) ( ON ?auto_103949 ?auto_103950 ) ( ON ?auto_103948 ?auto_103949 ) ( ON ?auto_103947 ?auto_103948 ) ( ON ?auto_103946 ?auto_103947 ) ( CLEAR ?auto_103946 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_103952 ?auto_103951 ?auto_103950 ?auto_103949 ?auto_103948 ?auto_103947 )
      ( MAKE-6PILE ?auto_103946 ?auto_103947 ?auto_103948 ?auto_103949 ?auto_103950 ?auto_103951 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_103953 - BLOCK
      ?auto_103954 - BLOCK
      ?auto_103955 - BLOCK
      ?auto_103956 - BLOCK
      ?auto_103957 - BLOCK
      ?auto_103958 - BLOCK
    )
    :vars
    (
      ?auto_103959 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_103953 ?auto_103954 ) ) ( not ( = ?auto_103953 ?auto_103955 ) ) ( not ( = ?auto_103953 ?auto_103956 ) ) ( not ( = ?auto_103953 ?auto_103957 ) ) ( not ( = ?auto_103953 ?auto_103958 ) ) ( not ( = ?auto_103954 ?auto_103955 ) ) ( not ( = ?auto_103954 ?auto_103956 ) ) ( not ( = ?auto_103954 ?auto_103957 ) ) ( not ( = ?auto_103954 ?auto_103958 ) ) ( not ( = ?auto_103955 ?auto_103956 ) ) ( not ( = ?auto_103955 ?auto_103957 ) ) ( not ( = ?auto_103955 ?auto_103958 ) ) ( not ( = ?auto_103956 ?auto_103957 ) ) ( not ( = ?auto_103956 ?auto_103958 ) ) ( not ( = ?auto_103957 ?auto_103958 ) ) ( ON ?auto_103958 ?auto_103959 ) ( not ( = ?auto_103953 ?auto_103959 ) ) ( not ( = ?auto_103954 ?auto_103959 ) ) ( not ( = ?auto_103955 ?auto_103959 ) ) ( not ( = ?auto_103956 ?auto_103959 ) ) ( not ( = ?auto_103957 ?auto_103959 ) ) ( not ( = ?auto_103958 ?auto_103959 ) ) ( ON ?auto_103957 ?auto_103958 ) ( ON-TABLE ?auto_103959 ) ( ON ?auto_103956 ?auto_103957 ) ( ON ?auto_103955 ?auto_103956 ) ( ON ?auto_103954 ?auto_103955 ) ( HOLDING ?auto_103953 ) ( CLEAR ?auto_103954 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_103959 ?auto_103958 ?auto_103957 ?auto_103956 ?auto_103955 ?auto_103954 ?auto_103953 )
      ( MAKE-6PILE ?auto_103953 ?auto_103954 ?auto_103955 ?auto_103956 ?auto_103957 ?auto_103958 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_103960 - BLOCK
      ?auto_103961 - BLOCK
      ?auto_103962 - BLOCK
      ?auto_103963 - BLOCK
      ?auto_103964 - BLOCK
      ?auto_103965 - BLOCK
    )
    :vars
    (
      ?auto_103966 - BLOCK
      ?auto_103967 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_103960 ?auto_103961 ) ) ( not ( = ?auto_103960 ?auto_103962 ) ) ( not ( = ?auto_103960 ?auto_103963 ) ) ( not ( = ?auto_103960 ?auto_103964 ) ) ( not ( = ?auto_103960 ?auto_103965 ) ) ( not ( = ?auto_103961 ?auto_103962 ) ) ( not ( = ?auto_103961 ?auto_103963 ) ) ( not ( = ?auto_103961 ?auto_103964 ) ) ( not ( = ?auto_103961 ?auto_103965 ) ) ( not ( = ?auto_103962 ?auto_103963 ) ) ( not ( = ?auto_103962 ?auto_103964 ) ) ( not ( = ?auto_103962 ?auto_103965 ) ) ( not ( = ?auto_103963 ?auto_103964 ) ) ( not ( = ?auto_103963 ?auto_103965 ) ) ( not ( = ?auto_103964 ?auto_103965 ) ) ( ON ?auto_103965 ?auto_103966 ) ( not ( = ?auto_103960 ?auto_103966 ) ) ( not ( = ?auto_103961 ?auto_103966 ) ) ( not ( = ?auto_103962 ?auto_103966 ) ) ( not ( = ?auto_103963 ?auto_103966 ) ) ( not ( = ?auto_103964 ?auto_103966 ) ) ( not ( = ?auto_103965 ?auto_103966 ) ) ( ON ?auto_103964 ?auto_103965 ) ( ON-TABLE ?auto_103966 ) ( ON ?auto_103963 ?auto_103964 ) ( ON ?auto_103962 ?auto_103963 ) ( ON ?auto_103961 ?auto_103962 ) ( CLEAR ?auto_103961 ) ( ON ?auto_103960 ?auto_103967 ) ( CLEAR ?auto_103960 ) ( HAND-EMPTY ) ( not ( = ?auto_103960 ?auto_103967 ) ) ( not ( = ?auto_103961 ?auto_103967 ) ) ( not ( = ?auto_103962 ?auto_103967 ) ) ( not ( = ?auto_103963 ?auto_103967 ) ) ( not ( = ?auto_103964 ?auto_103967 ) ) ( not ( = ?auto_103965 ?auto_103967 ) ) ( not ( = ?auto_103966 ?auto_103967 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_103960 ?auto_103967 )
      ( MAKE-6PILE ?auto_103960 ?auto_103961 ?auto_103962 ?auto_103963 ?auto_103964 ?auto_103965 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_103968 - BLOCK
      ?auto_103969 - BLOCK
      ?auto_103970 - BLOCK
      ?auto_103971 - BLOCK
      ?auto_103972 - BLOCK
      ?auto_103973 - BLOCK
    )
    :vars
    (
      ?auto_103975 - BLOCK
      ?auto_103974 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_103968 ?auto_103969 ) ) ( not ( = ?auto_103968 ?auto_103970 ) ) ( not ( = ?auto_103968 ?auto_103971 ) ) ( not ( = ?auto_103968 ?auto_103972 ) ) ( not ( = ?auto_103968 ?auto_103973 ) ) ( not ( = ?auto_103969 ?auto_103970 ) ) ( not ( = ?auto_103969 ?auto_103971 ) ) ( not ( = ?auto_103969 ?auto_103972 ) ) ( not ( = ?auto_103969 ?auto_103973 ) ) ( not ( = ?auto_103970 ?auto_103971 ) ) ( not ( = ?auto_103970 ?auto_103972 ) ) ( not ( = ?auto_103970 ?auto_103973 ) ) ( not ( = ?auto_103971 ?auto_103972 ) ) ( not ( = ?auto_103971 ?auto_103973 ) ) ( not ( = ?auto_103972 ?auto_103973 ) ) ( ON ?auto_103973 ?auto_103975 ) ( not ( = ?auto_103968 ?auto_103975 ) ) ( not ( = ?auto_103969 ?auto_103975 ) ) ( not ( = ?auto_103970 ?auto_103975 ) ) ( not ( = ?auto_103971 ?auto_103975 ) ) ( not ( = ?auto_103972 ?auto_103975 ) ) ( not ( = ?auto_103973 ?auto_103975 ) ) ( ON ?auto_103972 ?auto_103973 ) ( ON-TABLE ?auto_103975 ) ( ON ?auto_103971 ?auto_103972 ) ( ON ?auto_103970 ?auto_103971 ) ( ON ?auto_103968 ?auto_103974 ) ( CLEAR ?auto_103968 ) ( not ( = ?auto_103968 ?auto_103974 ) ) ( not ( = ?auto_103969 ?auto_103974 ) ) ( not ( = ?auto_103970 ?auto_103974 ) ) ( not ( = ?auto_103971 ?auto_103974 ) ) ( not ( = ?auto_103972 ?auto_103974 ) ) ( not ( = ?auto_103973 ?auto_103974 ) ) ( not ( = ?auto_103975 ?auto_103974 ) ) ( HOLDING ?auto_103969 ) ( CLEAR ?auto_103970 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_103975 ?auto_103973 ?auto_103972 ?auto_103971 ?auto_103970 ?auto_103969 )
      ( MAKE-6PILE ?auto_103968 ?auto_103969 ?auto_103970 ?auto_103971 ?auto_103972 ?auto_103973 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_103976 - BLOCK
      ?auto_103977 - BLOCK
      ?auto_103978 - BLOCK
      ?auto_103979 - BLOCK
      ?auto_103980 - BLOCK
      ?auto_103981 - BLOCK
    )
    :vars
    (
      ?auto_103983 - BLOCK
      ?auto_103982 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_103976 ?auto_103977 ) ) ( not ( = ?auto_103976 ?auto_103978 ) ) ( not ( = ?auto_103976 ?auto_103979 ) ) ( not ( = ?auto_103976 ?auto_103980 ) ) ( not ( = ?auto_103976 ?auto_103981 ) ) ( not ( = ?auto_103977 ?auto_103978 ) ) ( not ( = ?auto_103977 ?auto_103979 ) ) ( not ( = ?auto_103977 ?auto_103980 ) ) ( not ( = ?auto_103977 ?auto_103981 ) ) ( not ( = ?auto_103978 ?auto_103979 ) ) ( not ( = ?auto_103978 ?auto_103980 ) ) ( not ( = ?auto_103978 ?auto_103981 ) ) ( not ( = ?auto_103979 ?auto_103980 ) ) ( not ( = ?auto_103979 ?auto_103981 ) ) ( not ( = ?auto_103980 ?auto_103981 ) ) ( ON ?auto_103981 ?auto_103983 ) ( not ( = ?auto_103976 ?auto_103983 ) ) ( not ( = ?auto_103977 ?auto_103983 ) ) ( not ( = ?auto_103978 ?auto_103983 ) ) ( not ( = ?auto_103979 ?auto_103983 ) ) ( not ( = ?auto_103980 ?auto_103983 ) ) ( not ( = ?auto_103981 ?auto_103983 ) ) ( ON ?auto_103980 ?auto_103981 ) ( ON-TABLE ?auto_103983 ) ( ON ?auto_103979 ?auto_103980 ) ( ON ?auto_103978 ?auto_103979 ) ( ON ?auto_103976 ?auto_103982 ) ( not ( = ?auto_103976 ?auto_103982 ) ) ( not ( = ?auto_103977 ?auto_103982 ) ) ( not ( = ?auto_103978 ?auto_103982 ) ) ( not ( = ?auto_103979 ?auto_103982 ) ) ( not ( = ?auto_103980 ?auto_103982 ) ) ( not ( = ?auto_103981 ?auto_103982 ) ) ( not ( = ?auto_103983 ?auto_103982 ) ) ( CLEAR ?auto_103978 ) ( ON ?auto_103977 ?auto_103976 ) ( CLEAR ?auto_103977 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_103982 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_103982 ?auto_103976 )
      ( MAKE-6PILE ?auto_103976 ?auto_103977 ?auto_103978 ?auto_103979 ?auto_103980 ?auto_103981 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_103984 - BLOCK
      ?auto_103985 - BLOCK
      ?auto_103986 - BLOCK
      ?auto_103987 - BLOCK
      ?auto_103988 - BLOCK
      ?auto_103989 - BLOCK
    )
    :vars
    (
      ?auto_103990 - BLOCK
      ?auto_103991 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_103984 ?auto_103985 ) ) ( not ( = ?auto_103984 ?auto_103986 ) ) ( not ( = ?auto_103984 ?auto_103987 ) ) ( not ( = ?auto_103984 ?auto_103988 ) ) ( not ( = ?auto_103984 ?auto_103989 ) ) ( not ( = ?auto_103985 ?auto_103986 ) ) ( not ( = ?auto_103985 ?auto_103987 ) ) ( not ( = ?auto_103985 ?auto_103988 ) ) ( not ( = ?auto_103985 ?auto_103989 ) ) ( not ( = ?auto_103986 ?auto_103987 ) ) ( not ( = ?auto_103986 ?auto_103988 ) ) ( not ( = ?auto_103986 ?auto_103989 ) ) ( not ( = ?auto_103987 ?auto_103988 ) ) ( not ( = ?auto_103987 ?auto_103989 ) ) ( not ( = ?auto_103988 ?auto_103989 ) ) ( ON ?auto_103989 ?auto_103990 ) ( not ( = ?auto_103984 ?auto_103990 ) ) ( not ( = ?auto_103985 ?auto_103990 ) ) ( not ( = ?auto_103986 ?auto_103990 ) ) ( not ( = ?auto_103987 ?auto_103990 ) ) ( not ( = ?auto_103988 ?auto_103990 ) ) ( not ( = ?auto_103989 ?auto_103990 ) ) ( ON ?auto_103988 ?auto_103989 ) ( ON-TABLE ?auto_103990 ) ( ON ?auto_103987 ?auto_103988 ) ( ON ?auto_103984 ?auto_103991 ) ( not ( = ?auto_103984 ?auto_103991 ) ) ( not ( = ?auto_103985 ?auto_103991 ) ) ( not ( = ?auto_103986 ?auto_103991 ) ) ( not ( = ?auto_103987 ?auto_103991 ) ) ( not ( = ?auto_103988 ?auto_103991 ) ) ( not ( = ?auto_103989 ?auto_103991 ) ) ( not ( = ?auto_103990 ?auto_103991 ) ) ( ON ?auto_103985 ?auto_103984 ) ( CLEAR ?auto_103985 ) ( ON-TABLE ?auto_103991 ) ( HOLDING ?auto_103986 ) ( CLEAR ?auto_103987 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_103990 ?auto_103989 ?auto_103988 ?auto_103987 ?auto_103986 )
      ( MAKE-6PILE ?auto_103984 ?auto_103985 ?auto_103986 ?auto_103987 ?auto_103988 ?auto_103989 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_103992 - BLOCK
      ?auto_103993 - BLOCK
      ?auto_103994 - BLOCK
      ?auto_103995 - BLOCK
      ?auto_103996 - BLOCK
      ?auto_103997 - BLOCK
    )
    :vars
    (
      ?auto_103998 - BLOCK
      ?auto_103999 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_103992 ?auto_103993 ) ) ( not ( = ?auto_103992 ?auto_103994 ) ) ( not ( = ?auto_103992 ?auto_103995 ) ) ( not ( = ?auto_103992 ?auto_103996 ) ) ( not ( = ?auto_103992 ?auto_103997 ) ) ( not ( = ?auto_103993 ?auto_103994 ) ) ( not ( = ?auto_103993 ?auto_103995 ) ) ( not ( = ?auto_103993 ?auto_103996 ) ) ( not ( = ?auto_103993 ?auto_103997 ) ) ( not ( = ?auto_103994 ?auto_103995 ) ) ( not ( = ?auto_103994 ?auto_103996 ) ) ( not ( = ?auto_103994 ?auto_103997 ) ) ( not ( = ?auto_103995 ?auto_103996 ) ) ( not ( = ?auto_103995 ?auto_103997 ) ) ( not ( = ?auto_103996 ?auto_103997 ) ) ( ON ?auto_103997 ?auto_103998 ) ( not ( = ?auto_103992 ?auto_103998 ) ) ( not ( = ?auto_103993 ?auto_103998 ) ) ( not ( = ?auto_103994 ?auto_103998 ) ) ( not ( = ?auto_103995 ?auto_103998 ) ) ( not ( = ?auto_103996 ?auto_103998 ) ) ( not ( = ?auto_103997 ?auto_103998 ) ) ( ON ?auto_103996 ?auto_103997 ) ( ON-TABLE ?auto_103998 ) ( ON ?auto_103995 ?auto_103996 ) ( ON ?auto_103992 ?auto_103999 ) ( not ( = ?auto_103992 ?auto_103999 ) ) ( not ( = ?auto_103993 ?auto_103999 ) ) ( not ( = ?auto_103994 ?auto_103999 ) ) ( not ( = ?auto_103995 ?auto_103999 ) ) ( not ( = ?auto_103996 ?auto_103999 ) ) ( not ( = ?auto_103997 ?auto_103999 ) ) ( not ( = ?auto_103998 ?auto_103999 ) ) ( ON ?auto_103993 ?auto_103992 ) ( ON-TABLE ?auto_103999 ) ( CLEAR ?auto_103995 ) ( ON ?auto_103994 ?auto_103993 ) ( CLEAR ?auto_103994 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_103999 ?auto_103992 ?auto_103993 )
      ( MAKE-6PILE ?auto_103992 ?auto_103993 ?auto_103994 ?auto_103995 ?auto_103996 ?auto_103997 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_104000 - BLOCK
      ?auto_104001 - BLOCK
      ?auto_104002 - BLOCK
      ?auto_104003 - BLOCK
      ?auto_104004 - BLOCK
      ?auto_104005 - BLOCK
    )
    :vars
    (
      ?auto_104006 - BLOCK
      ?auto_104007 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_104000 ?auto_104001 ) ) ( not ( = ?auto_104000 ?auto_104002 ) ) ( not ( = ?auto_104000 ?auto_104003 ) ) ( not ( = ?auto_104000 ?auto_104004 ) ) ( not ( = ?auto_104000 ?auto_104005 ) ) ( not ( = ?auto_104001 ?auto_104002 ) ) ( not ( = ?auto_104001 ?auto_104003 ) ) ( not ( = ?auto_104001 ?auto_104004 ) ) ( not ( = ?auto_104001 ?auto_104005 ) ) ( not ( = ?auto_104002 ?auto_104003 ) ) ( not ( = ?auto_104002 ?auto_104004 ) ) ( not ( = ?auto_104002 ?auto_104005 ) ) ( not ( = ?auto_104003 ?auto_104004 ) ) ( not ( = ?auto_104003 ?auto_104005 ) ) ( not ( = ?auto_104004 ?auto_104005 ) ) ( ON ?auto_104005 ?auto_104006 ) ( not ( = ?auto_104000 ?auto_104006 ) ) ( not ( = ?auto_104001 ?auto_104006 ) ) ( not ( = ?auto_104002 ?auto_104006 ) ) ( not ( = ?auto_104003 ?auto_104006 ) ) ( not ( = ?auto_104004 ?auto_104006 ) ) ( not ( = ?auto_104005 ?auto_104006 ) ) ( ON ?auto_104004 ?auto_104005 ) ( ON-TABLE ?auto_104006 ) ( ON ?auto_104000 ?auto_104007 ) ( not ( = ?auto_104000 ?auto_104007 ) ) ( not ( = ?auto_104001 ?auto_104007 ) ) ( not ( = ?auto_104002 ?auto_104007 ) ) ( not ( = ?auto_104003 ?auto_104007 ) ) ( not ( = ?auto_104004 ?auto_104007 ) ) ( not ( = ?auto_104005 ?auto_104007 ) ) ( not ( = ?auto_104006 ?auto_104007 ) ) ( ON ?auto_104001 ?auto_104000 ) ( ON-TABLE ?auto_104007 ) ( ON ?auto_104002 ?auto_104001 ) ( CLEAR ?auto_104002 ) ( HOLDING ?auto_104003 ) ( CLEAR ?auto_104004 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_104006 ?auto_104005 ?auto_104004 ?auto_104003 )
      ( MAKE-6PILE ?auto_104000 ?auto_104001 ?auto_104002 ?auto_104003 ?auto_104004 ?auto_104005 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_104008 - BLOCK
      ?auto_104009 - BLOCK
      ?auto_104010 - BLOCK
      ?auto_104011 - BLOCK
      ?auto_104012 - BLOCK
      ?auto_104013 - BLOCK
    )
    :vars
    (
      ?auto_104015 - BLOCK
      ?auto_104014 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_104008 ?auto_104009 ) ) ( not ( = ?auto_104008 ?auto_104010 ) ) ( not ( = ?auto_104008 ?auto_104011 ) ) ( not ( = ?auto_104008 ?auto_104012 ) ) ( not ( = ?auto_104008 ?auto_104013 ) ) ( not ( = ?auto_104009 ?auto_104010 ) ) ( not ( = ?auto_104009 ?auto_104011 ) ) ( not ( = ?auto_104009 ?auto_104012 ) ) ( not ( = ?auto_104009 ?auto_104013 ) ) ( not ( = ?auto_104010 ?auto_104011 ) ) ( not ( = ?auto_104010 ?auto_104012 ) ) ( not ( = ?auto_104010 ?auto_104013 ) ) ( not ( = ?auto_104011 ?auto_104012 ) ) ( not ( = ?auto_104011 ?auto_104013 ) ) ( not ( = ?auto_104012 ?auto_104013 ) ) ( ON ?auto_104013 ?auto_104015 ) ( not ( = ?auto_104008 ?auto_104015 ) ) ( not ( = ?auto_104009 ?auto_104015 ) ) ( not ( = ?auto_104010 ?auto_104015 ) ) ( not ( = ?auto_104011 ?auto_104015 ) ) ( not ( = ?auto_104012 ?auto_104015 ) ) ( not ( = ?auto_104013 ?auto_104015 ) ) ( ON ?auto_104012 ?auto_104013 ) ( ON-TABLE ?auto_104015 ) ( ON ?auto_104008 ?auto_104014 ) ( not ( = ?auto_104008 ?auto_104014 ) ) ( not ( = ?auto_104009 ?auto_104014 ) ) ( not ( = ?auto_104010 ?auto_104014 ) ) ( not ( = ?auto_104011 ?auto_104014 ) ) ( not ( = ?auto_104012 ?auto_104014 ) ) ( not ( = ?auto_104013 ?auto_104014 ) ) ( not ( = ?auto_104015 ?auto_104014 ) ) ( ON ?auto_104009 ?auto_104008 ) ( ON-TABLE ?auto_104014 ) ( ON ?auto_104010 ?auto_104009 ) ( CLEAR ?auto_104012 ) ( ON ?auto_104011 ?auto_104010 ) ( CLEAR ?auto_104011 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_104014 ?auto_104008 ?auto_104009 ?auto_104010 )
      ( MAKE-6PILE ?auto_104008 ?auto_104009 ?auto_104010 ?auto_104011 ?auto_104012 ?auto_104013 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_104016 - BLOCK
      ?auto_104017 - BLOCK
      ?auto_104018 - BLOCK
      ?auto_104019 - BLOCK
      ?auto_104020 - BLOCK
      ?auto_104021 - BLOCK
    )
    :vars
    (
      ?auto_104023 - BLOCK
      ?auto_104022 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_104016 ?auto_104017 ) ) ( not ( = ?auto_104016 ?auto_104018 ) ) ( not ( = ?auto_104016 ?auto_104019 ) ) ( not ( = ?auto_104016 ?auto_104020 ) ) ( not ( = ?auto_104016 ?auto_104021 ) ) ( not ( = ?auto_104017 ?auto_104018 ) ) ( not ( = ?auto_104017 ?auto_104019 ) ) ( not ( = ?auto_104017 ?auto_104020 ) ) ( not ( = ?auto_104017 ?auto_104021 ) ) ( not ( = ?auto_104018 ?auto_104019 ) ) ( not ( = ?auto_104018 ?auto_104020 ) ) ( not ( = ?auto_104018 ?auto_104021 ) ) ( not ( = ?auto_104019 ?auto_104020 ) ) ( not ( = ?auto_104019 ?auto_104021 ) ) ( not ( = ?auto_104020 ?auto_104021 ) ) ( ON ?auto_104021 ?auto_104023 ) ( not ( = ?auto_104016 ?auto_104023 ) ) ( not ( = ?auto_104017 ?auto_104023 ) ) ( not ( = ?auto_104018 ?auto_104023 ) ) ( not ( = ?auto_104019 ?auto_104023 ) ) ( not ( = ?auto_104020 ?auto_104023 ) ) ( not ( = ?auto_104021 ?auto_104023 ) ) ( ON-TABLE ?auto_104023 ) ( ON ?auto_104016 ?auto_104022 ) ( not ( = ?auto_104016 ?auto_104022 ) ) ( not ( = ?auto_104017 ?auto_104022 ) ) ( not ( = ?auto_104018 ?auto_104022 ) ) ( not ( = ?auto_104019 ?auto_104022 ) ) ( not ( = ?auto_104020 ?auto_104022 ) ) ( not ( = ?auto_104021 ?auto_104022 ) ) ( not ( = ?auto_104023 ?auto_104022 ) ) ( ON ?auto_104017 ?auto_104016 ) ( ON-TABLE ?auto_104022 ) ( ON ?auto_104018 ?auto_104017 ) ( ON ?auto_104019 ?auto_104018 ) ( CLEAR ?auto_104019 ) ( HOLDING ?auto_104020 ) ( CLEAR ?auto_104021 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_104023 ?auto_104021 ?auto_104020 )
      ( MAKE-6PILE ?auto_104016 ?auto_104017 ?auto_104018 ?auto_104019 ?auto_104020 ?auto_104021 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_104024 - BLOCK
      ?auto_104025 - BLOCK
      ?auto_104026 - BLOCK
      ?auto_104027 - BLOCK
      ?auto_104028 - BLOCK
      ?auto_104029 - BLOCK
    )
    :vars
    (
      ?auto_104031 - BLOCK
      ?auto_104030 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_104024 ?auto_104025 ) ) ( not ( = ?auto_104024 ?auto_104026 ) ) ( not ( = ?auto_104024 ?auto_104027 ) ) ( not ( = ?auto_104024 ?auto_104028 ) ) ( not ( = ?auto_104024 ?auto_104029 ) ) ( not ( = ?auto_104025 ?auto_104026 ) ) ( not ( = ?auto_104025 ?auto_104027 ) ) ( not ( = ?auto_104025 ?auto_104028 ) ) ( not ( = ?auto_104025 ?auto_104029 ) ) ( not ( = ?auto_104026 ?auto_104027 ) ) ( not ( = ?auto_104026 ?auto_104028 ) ) ( not ( = ?auto_104026 ?auto_104029 ) ) ( not ( = ?auto_104027 ?auto_104028 ) ) ( not ( = ?auto_104027 ?auto_104029 ) ) ( not ( = ?auto_104028 ?auto_104029 ) ) ( ON ?auto_104029 ?auto_104031 ) ( not ( = ?auto_104024 ?auto_104031 ) ) ( not ( = ?auto_104025 ?auto_104031 ) ) ( not ( = ?auto_104026 ?auto_104031 ) ) ( not ( = ?auto_104027 ?auto_104031 ) ) ( not ( = ?auto_104028 ?auto_104031 ) ) ( not ( = ?auto_104029 ?auto_104031 ) ) ( ON-TABLE ?auto_104031 ) ( ON ?auto_104024 ?auto_104030 ) ( not ( = ?auto_104024 ?auto_104030 ) ) ( not ( = ?auto_104025 ?auto_104030 ) ) ( not ( = ?auto_104026 ?auto_104030 ) ) ( not ( = ?auto_104027 ?auto_104030 ) ) ( not ( = ?auto_104028 ?auto_104030 ) ) ( not ( = ?auto_104029 ?auto_104030 ) ) ( not ( = ?auto_104031 ?auto_104030 ) ) ( ON ?auto_104025 ?auto_104024 ) ( ON-TABLE ?auto_104030 ) ( ON ?auto_104026 ?auto_104025 ) ( ON ?auto_104027 ?auto_104026 ) ( CLEAR ?auto_104029 ) ( ON ?auto_104028 ?auto_104027 ) ( CLEAR ?auto_104028 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_104030 ?auto_104024 ?auto_104025 ?auto_104026 ?auto_104027 )
      ( MAKE-6PILE ?auto_104024 ?auto_104025 ?auto_104026 ?auto_104027 ?auto_104028 ?auto_104029 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_104032 - BLOCK
      ?auto_104033 - BLOCK
      ?auto_104034 - BLOCK
      ?auto_104035 - BLOCK
      ?auto_104036 - BLOCK
      ?auto_104037 - BLOCK
    )
    :vars
    (
      ?auto_104038 - BLOCK
      ?auto_104039 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_104032 ?auto_104033 ) ) ( not ( = ?auto_104032 ?auto_104034 ) ) ( not ( = ?auto_104032 ?auto_104035 ) ) ( not ( = ?auto_104032 ?auto_104036 ) ) ( not ( = ?auto_104032 ?auto_104037 ) ) ( not ( = ?auto_104033 ?auto_104034 ) ) ( not ( = ?auto_104033 ?auto_104035 ) ) ( not ( = ?auto_104033 ?auto_104036 ) ) ( not ( = ?auto_104033 ?auto_104037 ) ) ( not ( = ?auto_104034 ?auto_104035 ) ) ( not ( = ?auto_104034 ?auto_104036 ) ) ( not ( = ?auto_104034 ?auto_104037 ) ) ( not ( = ?auto_104035 ?auto_104036 ) ) ( not ( = ?auto_104035 ?auto_104037 ) ) ( not ( = ?auto_104036 ?auto_104037 ) ) ( not ( = ?auto_104032 ?auto_104038 ) ) ( not ( = ?auto_104033 ?auto_104038 ) ) ( not ( = ?auto_104034 ?auto_104038 ) ) ( not ( = ?auto_104035 ?auto_104038 ) ) ( not ( = ?auto_104036 ?auto_104038 ) ) ( not ( = ?auto_104037 ?auto_104038 ) ) ( ON-TABLE ?auto_104038 ) ( ON ?auto_104032 ?auto_104039 ) ( not ( = ?auto_104032 ?auto_104039 ) ) ( not ( = ?auto_104033 ?auto_104039 ) ) ( not ( = ?auto_104034 ?auto_104039 ) ) ( not ( = ?auto_104035 ?auto_104039 ) ) ( not ( = ?auto_104036 ?auto_104039 ) ) ( not ( = ?auto_104037 ?auto_104039 ) ) ( not ( = ?auto_104038 ?auto_104039 ) ) ( ON ?auto_104033 ?auto_104032 ) ( ON-TABLE ?auto_104039 ) ( ON ?auto_104034 ?auto_104033 ) ( ON ?auto_104035 ?auto_104034 ) ( ON ?auto_104036 ?auto_104035 ) ( CLEAR ?auto_104036 ) ( HOLDING ?auto_104037 ) ( CLEAR ?auto_104038 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_104038 ?auto_104037 )
      ( MAKE-6PILE ?auto_104032 ?auto_104033 ?auto_104034 ?auto_104035 ?auto_104036 ?auto_104037 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_104040 - BLOCK
      ?auto_104041 - BLOCK
      ?auto_104042 - BLOCK
      ?auto_104043 - BLOCK
      ?auto_104044 - BLOCK
      ?auto_104045 - BLOCK
    )
    :vars
    (
      ?auto_104046 - BLOCK
      ?auto_104047 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_104040 ?auto_104041 ) ) ( not ( = ?auto_104040 ?auto_104042 ) ) ( not ( = ?auto_104040 ?auto_104043 ) ) ( not ( = ?auto_104040 ?auto_104044 ) ) ( not ( = ?auto_104040 ?auto_104045 ) ) ( not ( = ?auto_104041 ?auto_104042 ) ) ( not ( = ?auto_104041 ?auto_104043 ) ) ( not ( = ?auto_104041 ?auto_104044 ) ) ( not ( = ?auto_104041 ?auto_104045 ) ) ( not ( = ?auto_104042 ?auto_104043 ) ) ( not ( = ?auto_104042 ?auto_104044 ) ) ( not ( = ?auto_104042 ?auto_104045 ) ) ( not ( = ?auto_104043 ?auto_104044 ) ) ( not ( = ?auto_104043 ?auto_104045 ) ) ( not ( = ?auto_104044 ?auto_104045 ) ) ( not ( = ?auto_104040 ?auto_104046 ) ) ( not ( = ?auto_104041 ?auto_104046 ) ) ( not ( = ?auto_104042 ?auto_104046 ) ) ( not ( = ?auto_104043 ?auto_104046 ) ) ( not ( = ?auto_104044 ?auto_104046 ) ) ( not ( = ?auto_104045 ?auto_104046 ) ) ( ON-TABLE ?auto_104046 ) ( ON ?auto_104040 ?auto_104047 ) ( not ( = ?auto_104040 ?auto_104047 ) ) ( not ( = ?auto_104041 ?auto_104047 ) ) ( not ( = ?auto_104042 ?auto_104047 ) ) ( not ( = ?auto_104043 ?auto_104047 ) ) ( not ( = ?auto_104044 ?auto_104047 ) ) ( not ( = ?auto_104045 ?auto_104047 ) ) ( not ( = ?auto_104046 ?auto_104047 ) ) ( ON ?auto_104041 ?auto_104040 ) ( ON-TABLE ?auto_104047 ) ( ON ?auto_104042 ?auto_104041 ) ( ON ?auto_104043 ?auto_104042 ) ( ON ?auto_104044 ?auto_104043 ) ( CLEAR ?auto_104046 ) ( ON ?auto_104045 ?auto_104044 ) ( CLEAR ?auto_104045 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_104047 ?auto_104040 ?auto_104041 ?auto_104042 ?auto_104043 ?auto_104044 )
      ( MAKE-6PILE ?auto_104040 ?auto_104041 ?auto_104042 ?auto_104043 ?auto_104044 ?auto_104045 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_104048 - BLOCK
      ?auto_104049 - BLOCK
      ?auto_104050 - BLOCK
      ?auto_104051 - BLOCK
      ?auto_104052 - BLOCK
      ?auto_104053 - BLOCK
    )
    :vars
    (
      ?auto_104054 - BLOCK
      ?auto_104055 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_104048 ?auto_104049 ) ) ( not ( = ?auto_104048 ?auto_104050 ) ) ( not ( = ?auto_104048 ?auto_104051 ) ) ( not ( = ?auto_104048 ?auto_104052 ) ) ( not ( = ?auto_104048 ?auto_104053 ) ) ( not ( = ?auto_104049 ?auto_104050 ) ) ( not ( = ?auto_104049 ?auto_104051 ) ) ( not ( = ?auto_104049 ?auto_104052 ) ) ( not ( = ?auto_104049 ?auto_104053 ) ) ( not ( = ?auto_104050 ?auto_104051 ) ) ( not ( = ?auto_104050 ?auto_104052 ) ) ( not ( = ?auto_104050 ?auto_104053 ) ) ( not ( = ?auto_104051 ?auto_104052 ) ) ( not ( = ?auto_104051 ?auto_104053 ) ) ( not ( = ?auto_104052 ?auto_104053 ) ) ( not ( = ?auto_104048 ?auto_104054 ) ) ( not ( = ?auto_104049 ?auto_104054 ) ) ( not ( = ?auto_104050 ?auto_104054 ) ) ( not ( = ?auto_104051 ?auto_104054 ) ) ( not ( = ?auto_104052 ?auto_104054 ) ) ( not ( = ?auto_104053 ?auto_104054 ) ) ( ON ?auto_104048 ?auto_104055 ) ( not ( = ?auto_104048 ?auto_104055 ) ) ( not ( = ?auto_104049 ?auto_104055 ) ) ( not ( = ?auto_104050 ?auto_104055 ) ) ( not ( = ?auto_104051 ?auto_104055 ) ) ( not ( = ?auto_104052 ?auto_104055 ) ) ( not ( = ?auto_104053 ?auto_104055 ) ) ( not ( = ?auto_104054 ?auto_104055 ) ) ( ON ?auto_104049 ?auto_104048 ) ( ON-TABLE ?auto_104055 ) ( ON ?auto_104050 ?auto_104049 ) ( ON ?auto_104051 ?auto_104050 ) ( ON ?auto_104052 ?auto_104051 ) ( ON ?auto_104053 ?auto_104052 ) ( CLEAR ?auto_104053 ) ( HOLDING ?auto_104054 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_104054 )
      ( MAKE-6PILE ?auto_104048 ?auto_104049 ?auto_104050 ?auto_104051 ?auto_104052 ?auto_104053 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_104056 - BLOCK
      ?auto_104057 - BLOCK
      ?auto_104058 - BLOCK
      ?auto_104059 - BLOCK
      ?auto_104060 - BLOCK
      ?auto_104061 - BLOCK
    )
    :vars
    (
      ?auto_104062 - BLOCK
      ?auto_104063 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_104056 ?auto_104057 ) ) ( not ( = ?auto_104056 ?auto_104058 ) ) ( not ( = ?auto_104056 ?auto_104059 ) ) ( not ( = ?auto_104056 ?auto_104060 ) ) ( not ( = ?auto_104056 ?auto_104061 ) ) ( not ( = ?auto_104057 ?auto_104058 ) ) ( not ( = ?auto_104057 ?auto_104059 ) ) ( not ( = ?auto_104057 ?auto_104060 ) ) ( not ( = ?auto_104057 ?auto_104061 ) ) ( not ( = ?auto_104058 ?auto_104059 ) ) ( not ( = ?auto_104058 ?auto_104060 ) ) ( not ( = ?auto_104058 ?auto_104061 ) ) ( not ( = ?auto_104059 ?auto_104060 ) ) ( not ( = ?auto_104059 ?auto_104061 ) ) ( not ( = ?auto_104060 ?auto_104061 ) ) ( not ( = ?auto_104056 ?auto_104062 ) ) ( not ( = ?auto_104057 ?auto_104062 ) ) ( not ( = ?auto_104058 ?auto_104062 ) ) ( not ( = ?auto_104059 ?auto_104062 ) ) ( not ( = ?auto_104060 ?auto_104062 ) ) ( not ( = ?auto_104061 ?auto_104062 ) ) ( ON ?auto_104056 ?auto_104063 ) ( not ( = ?auto_104056 ?auto_104063 ) ) ( not ( = ?auto_104057 ?auto_104063 ) ) ( not ( = ?auto_104058 ?auto_104063 ) ) ( not ( = ?auto_104059 ?auto_104063 ) ) ( not ( = ?auto_104060 ?auto_104063 ) ) ( not ( = ?auto_104061 ?auto_104063 ) ) ( not ( = ?auto_104062 ?auto_104063 ) ) ( ON ?auto_104057 ?auto_104056 ) ( ON-TABLE ?auto_104063 ) ( ON ?auto_104058 ?auto_104057 ) ( ON ?auto_104059 ?auto_104058 ) ( ON ?auto_104060 ?auto_104059 ) ( ON ?auto_104061 ?auto_104060 ) ( ON ?auto_104062 ?auto_104061 ) ( CLEAR ?auto_104062 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_104063 ?auto_104056 ?auto_104057 ?auto_104058 ?auto_104059 ?auto_104060 ?auto_104061 )
      ( MAKE-6PILE ?auto_104056 ?auto_104057 ?auto_104058 ?auto_104059 ?auto_104060 ?auto_104061 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_104071 - BLOCK
      ?auto_104072 - BLOCK
      ?auto_104073 - BLOCK
      ?auto_104074 - BLOCK
      ?auto_104075 - BLOCK
      ?auto_104076 - BLOCK
      ?auto_104077 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_104077 ) ( CLEAR ?auto_104076 ) ( ON-TABLE ?auto_104071 ) ( ON ?auto_104072 ?auto_104071 ) ( ON ?auto_104073 ?auto_104072 ) ( ON ?auto_104074 ?auto_104073 ) ( ON ?auto_104075 ?auto_104074 ) ( ON ?auto_104076 ?auto_104075 ) ( not ( = ?auto_104071 ?auto_104072 ) ) ( not ( = ?auto_104071 ?auto_104073 ) ) ( not ( = ?auto_104071 ?auto_104074 ) ) ( not ( = ?auto_104071 ?auto_104075 ) ) ( not ( = ?auto_104071 ?auto_104076 ) ) ( not ( = ?auto_104071 ?auto_104077 ) ) ( not ( = ?auto_104072 ?auto_104073 ) ) ( not ( = ?auto_104072 ?auto_104074 ) ) ( not ( = ?auto_104072 ?auto_104075 ) ) ( not ( = ?auto_104072 ?auto_104076 ) ) ( not ( = ?auto_104072 ?auto_104077 ) ) ( not ( = ?auto_104073 ?auto_104074 ) ) ( not ( = ?auto_104073 ?auto_104075 ) ) ( not ( = ?auto_104073 ?auto_104076 ) ) ( not ( = ?auto_104073 ?auto_104077 ) ) ( not ( = ?auto_104074 ?auto_104075 ) ) ( not ( = ?auto_104074 ?auto_104076 ) ) ( not ( = ?auto_104074 ?auto_104077 ) ) ( not ( = ?auto_104075 ?auto_104076 ) ) ( not ( = ?auto_104075 ?auto_104077 ) ) ( not ( = ?auto_104076 ?auto_104077 ) ) )
    :subtasks
    ( ( !STACK ?auto_104077 ?auto_104076 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_104078 - BLOCK
      ?auto_104079 - BLOCK
      ?auto_104080 - BLOCK
      ?auto_104081 - BLOCK
      ?auto_104082 - BLOCK
      ?auto_104083 - BLOCK
      ?auto_104084 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_104083 ) ( ON-TABLE ?auto_104078 ) ( ON ?auto_104079 ?auto_104078 ) ( ON ?auto_104080 ?auto_104079 ) ( ON ?auto_104081 ?auto_104080 ) ( ON ?auto_104082 ?auto_104081 ) ( ON ?auto_104083 ?auto_104082 ) ( not ( = ?auto_104078 ?auto_104079 ) ) ( not ( = ?auto_104078 ?auto_104080 ) ) ( not ( = ?auto_104078 ?auto_104081 ) ) ( not ( = ?auto_104078 ?auto_104082 ) ) ( not ( = ?auto_104078 ?auto_104083 ) ) ( not ( = ?auto_104078 ?auto_104084 ) ) ( not ( = ?auto_104079 ?auto_104080 ) ) ( not ( = ?auto_104079 ?auto_104081 ) ) ( not ( = ?auto_104079 ?auto_104082 ) ) ( not ( = ?auto_104079 ?auto_104083 ) ) ( not ( = ?auto_104079 ?auto_104084 ) ) ( not ( = ?auto_104080 ?auto_104081 ) ) ( not ( = ?auto_104080 ?auto_104082 ) ) ( not ( = ?auto_104080 ?auto_104083 ) ) ( not ( = ?auto_104080 ?auto_104084 ) ) ( not ( = ?auto_104081 ?auto_104082 ) ) ( not ( = ?auto_104081 ?auto_104083 ) ) ( not ( = ?auto_104081 ?auto_104084 ) ) ( not ( = ?auto_104082 ?auto_104083 ) ) ( not ( = ?auto_104082 ?auto_104084 ) ) ( not ( = ?auto_104083 ?auto_104084 ) ) ( ON-TABLE ?auto_104084 ) ( CLEAR ?auto_104084 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_104084 )
      ( MAKE-7PILE ?auto_104078 ?auto_104079 ?auto_104080 ?auto_104081 ?auto_104082 ?auto_104083 ?auto_104084 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_104085 - BLOCK
      ?auto_104086 - BLOCK
      ?auto_104087 - BLOCK
      ?auto_104088 - BLOCK
      ?auto_104089 - BLOCK
      ?auto_104090 - BLOCK
      ?auto_104091 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_104085 ) ( ON ?auto_104086 ?auto_104085 ) ( ON ?auto_104087 ?auto_104086 ) ( ON ?auto_104088 ?auto_104087 ) ( ON ?auto_104089 ?auto_104088 ) ( not ( = ?auto_104085 ?auto_104086 ) ) ( not ( = ?auto_104085 ?auto_104087 ) ) ( not ( = ?auto_104085 ?auto_104088 ) ) ( not ( = ?auto_104085 ?auto_104089 ) ) ( not ( = ?auto_104085 ?auto_104090 ) ) ( not ( = ?auto_104085 ?auto_104091 ) ) ( not ( = ?auto_104086 ?auto_104087 ) ) ( not ( = ?auto_104086 ?auto_104088 ) ) ( not ( = ?auto_104086 ?auto_104089 ) ) ( not ( = ?auto_104086 ?auto_104090 ) ) ( not ( = ?auto_104086 ?auto_104091 ) ) ( not ( = ?auto_104087 ?auto_104088 ) ) ( not ( = ?auto_104087 ?auto_104089 ) ) ( not ( = ?auto_104087 ?auto_104090 ) ) ( not ( = ?auto_104087 ?auto_104091 ) ) ( not ( = ?auto_104088 ?auto_104089 ) ) ( not ( = ?auto_104088 ?auto_104090 ) ) ( not ( = ?auto_104088 ?auto_104091 ) ) ( not ( = ?auto_104089 ?auto_104090 ) ) ( not ( = ?auto_104089 ?auto_104091 ) ) ( not ( = ?auto_104090 ?auto_104091 ) ) ( ON-TABLE ?auto_104091 ) ( CLEAR ?auto_104091 ) ( HOLDING ?auto_104090 ) ( CLEAR ?auto_104089 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_104085 ?auto_104086 ?auto_104087 ?auto_104088 ?auto_104089 ?auto_104090 )
      ( MAKE-7PILE ?auto_104085 ?auto_104086 ?auto_104087 ?auto_104088 ?auto_104089 ?auto_104090 ?auto_104091 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_104092 - BLOCK
      ?auto_104093 - BLOCK
      ?auto_104094 - BLOCK
      ?auto_104095 - BLOCK
      ?auto_104096 - BLOCK
      ?auto_104097 - BLOCK
      ?auto_104098 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_104092 ) ( ON ?auto_104093 ?auto_104092 ) ( ON ?auto_104094 ?auto_104093 ) ( ON ?auto_104095 ?auto_104094 ) ( ON ?auto_104096 ?auto_104095 ) ( not ( = ?auto_104092 ?auto_104093 ) ) ( not ( = ?auto_104092 ?auto_104094 ) ) ( not ( = ?auto_104092 ?auto_104095 ) ) ( not ( = ?auto_104092 ?auto_104096 ) ) ( not ( = ?auto_104092 ?auto_104097 ) ) ( not ( = ?auto_104092 ?auto_104098 ) ) ( not ( = ?auto_104093 ?auto_104094 ) ) ( not ( = ?auto_104093 ?auto_104095 ) ) ( not ( = ?auto_104093 ?auto_104096 ) ) ( not ( = ?auto_104093 ?auto_104097 ) ) ( not ( = ?auto_104093 ?auto_104098 ) ) ( not ( = ?auto_104094 ?auto_104095 ) ) ( not ( = ?auto_104094 ?auto_104096 ) ) ( not ( = ?auto_104094 ?auto_104097 ) ) ( not ( = ?auto_104094 ?auto_104098 ) ) ( not ( = ?auto_104095 ?auto_104096 ) ) ( not ( = ?auto_104095 ?auto_104097 ) ) ( not ( = ?auto_104095 ?auto_104098 ) ) ( not ( = ?auto_104096 ?auto_104097 ) ) ( not ( = ?auto_104096 ?auto_104098 ) ) ( not ( = ?auto_104097 ?auto_104098 ) ) ( ON-TABLE ?auto_104098 ) ( CLEAR ?auto_104096 ) ( ON ?auto_104097 ?auto_104098 ) ( CLEAR ?auto_104097 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_104098 )
      ( MAKE-7PILE ?auto_104092 ?auto_104093 ?auto_104094 ?auto_104095 ?auto_104096 ?auto_104097 ?auto_104098 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_104099 - BLOCK
      ?auto_104100 - BLOCK
      ?auto_104101 - BLOCK
      ?auto_104102 - BLOCK
      ?auto_104103 - BLOCK
      ?auto_104104 - BLOCK
      ?auto_104105 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_104099 ) ( ON ?auto_104100 ?auto_104099 ) ( ON ?auto_104101 ?auto_104100 ) ( ON ?auto_104102 ?auto_104101 ) ( not ( = ?auto_104099 ?auto_104100 ) ) ( not ( = ?auto_104099 ?auto_104101 ) ) ( not ( = ?auto_104099 ?auto_104102 ) ) ( not ( = ?auto_104099 ?auto_104103 ) ) ( not ( = ?auto_104099 ?auto_104104 ) ) ( not ( = ?auto_104099 ?auto_104105 ) ) ( not ( = ?auto_104100 ?auto_104101 ) ) ( not ( = ?auto_104100 ?auto_104102 ) ) ( not ( = ?auto_104100 ?auto_104103 ) ) ( not ( = ?auto_104100 ?auto_104104 ) ) ( not ( = ?auto_104100 ?auto_104105 ) ) ( not ( = ?auto_104101 ?auto_104102 ) ) ( not ( = ?auto_104101 ?auto_104103 ) ) ( not ( = ?auto_104101 ?auto_104104 ) ) ( not ( = ?auto_104101 ?auto_104105 ) ) ( not ( = ?auto_104102 ?auto_104103 ) ) ( not ( = ?auto_104102 ?auto_104104 ) ) ( not ( = ?auto_104102 ?auto_104105 ) ) ( not ( = ?auto_104103 ?auto_104104 ) ) ( not ( = ?auto_104103 ?auto_104105 ) ) ( not ( = ?auto_104104 ?auto_104105 ) ) ( ON-TABLE ?auto_104105 ) ( ON ?auto_104104 ?auto_104105 ) ( CLEAR ?auto_104104 ) ( HOLDING ?auto_104103 ) ( CLEAR ?auto_104102 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_104099 ?auto_104100 ?auto_104101 ?auto_104102 ?auto_104103 )
      ( MAKE-7PILE ?auto_104099 ?auto_104100 ?auto_104101 ?auto_104102 ?auto_104103 ?auto_104104 ?auto_104105 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_104106 - BLOCK
      ?auto_104107 - BLOCK
      ?auto_104108 - BLOCK
      ?auto_104109 - BLOCK
      ?auto_104110 - BLOCK
      ?auto_104111 - BLOCK
      ?auto_104112 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_104106 ) ( ON ?auto_104107 ?auto_104106 ) ( ON ?auto_104108 ?auto_104107 ) ( ON ?auto_104109 ?auto_104108 ) ( not ( = ?auto_104106 ?auto_104107 ) ) ( not ( = ?auto_104106 ?auto_104108 ) ) ( not ( = ?auto_104106 ?auto_104109 ) ) ( not ( = ?auto_104106 ?auto_104110 ) ) ( not ( = ?auto_104106 ?auto_104111 ) ) ( not ( = ?auto_104106 ?auto_104112 ) ) ( not ( = ?auto_104107 ?auto_104108 ) ) ( not ( = ?auto_104107 ?auto_104109 ) ) ( not ( = ?auto_104107 ?auto_104110 ) ) ( not ( = ?auto_104107 ?auto_104111 ) ) ( not ( = ?auto_104107 ?auto_104112 ) ) ( not ( = ?auto_104108 ?auto_104109 ) ) ( not ( = ?auto_104108 ?auto_104110 ) ) ( not ( = ?auto_104108 ?auto_104111 ) ) ( not ( = ?auto_104108 ?auto_104112 ) ) ( not ( = ?auto_104109 ?auto_104110 ) ) ( not ( = ?auto_104109 ?auto_104111 ) ) ( not ( = ?auto_104109 ?auto_104112 ) ) ( not ( = ?auto_104110 ?auto_104111 ) ) ( not ( = ?auto_104110 ?auto_104112 ) ) ( not ( = ?auto_104111 ?auto_104112 ) ) ( ON-TABLE ?auto_104112 ) ( ON ?auto_104111 ?auto_104112 ) ( CLEAR ?auto_104109 ) ( ON ?auto_104110 ?auto_104111 ) ( CLEAR ?auto_104110 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_104112 ?auto_104111 )
      ( MAKE-7PILE ?auto_104106 ?auto_104107 ?auto_104108 ?auto_104109 ?auto_104110 ?auto_104111 ?auto_104112 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_104113 - BLOCK
      ?auto_104114 - BLOCK
      ?auto_104115 - BLOCK
      ?auto_104116 - BLOCK
      ?auto_104117 - BLOCK
      ?auto_104118 - BLOCK
      ?auto_104119 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_104113 ) ( ON ?auto_104114 ?auto_104113 ) ( ON ?auto_104115 ?auto_104114 ) ( not ( = ?auto_104113 ?auto_104114 ) ) ( not ( = ?auto_104113 ?auto_104115 ) ) ( not ( = ?auto_104113 ?auto_104116 ) ) ( not ( = ?auto_104113 ?auto_104117 ) ) ( not ( = ?auto_104113 ?auto_104118 ) ) ( not ( = ?auto_104113 ?auto_104119 ) ) ( not ( = ?auto_104114 ?auto_104115 ) ) ( not ( = ?auto_104114 ?auto_104116 ) ) ( not ( = ?auto_104114 ?auto_104117 ) ) ( not ( = ?auto_104114 ?auto_104118 ) ) ( not ( = ?auto_104114 ?auto_104119 ) ) ( not ( = ?auto_104115 ?auto_104116 ) ) ( not ( = ?auto_104115 ?auto_104117 ) ) ( not ( = ?auto_104115 ?auto_104118 ) ) ( not ( = ?auto_104115 ?auto_104119 ) ) ( not ( = ?auto_104116 ?auto_104117 ) ) ( not ( = ?auto_104116 ?auto_104118 ) ) ( not ( = ?auto_104116 ?auto_104119 ) ) ( not ( = ?auto_104117 ?auto_104118 ) ) ( not ( = ?auto_104117 ?auto_104119 ) ) ( not ( = ?auto_104118 ?auto_104119 ) ) ( ON-TABLE ?auto_104119 ) ( ON ?auto_104118 ?auto_104119 ) ( ON ?auto_104117 ?auto_104118 ) ( CLEAR ?auto_104117 ) ( HOLDING ?auto_104116 ) ( CLEAR ?auto_104115 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_104113 ?auto_104114 ?auto_104115 ?auto_104116 )
      ( MAKE-7PILE ?auto_104113 ?auto_104114 ?auto_104115 ?auto_104116 ?auto_104117 ?auto_104118 ?auto_104119 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_104120 - BLOCK
      ?auto_104121 - BLOCK
      ?auto_104122 - BLOCK
      ?auto_104123 - BLOCK
      ?auto_104124 - BLOCK
      ?auto_104125 - BLOCK
      ?auto_104126 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_104120 ) ( ON ?auto_104121 ?auto_104120 ) ( ON ?auto_104122 ?auto_104121 ) ( not ( = ?auto_104120 ?auto_104121 ) ) ( not ( = ?auto_104120 ?auto_104122 ) ) ( not ( = ?auto_104120 ?auto_104123 ) ) ( not ( = ?auto_104120 ?auto_104124 ) ) ( not ( = ?auto_104120 ?auto_104125 ) ) ( not ( = ?auto_104120 ?auto_104126 ) ) ( not ( = ?auto_104121 ?auto_104122 ) ) ( not ( = ?auto_104121 ?auto_104123 ) ) ( not ( = ?auto_104121 ?auto_104124 ) ) ( not ( = ?auto_104121 ?auto_104125 ) ) ( not ( = ?auto_104121 ?auto_104126 ) ) ( not ( = ?auto_104122 ?auto_104123 ) ) ( not ( = ?auto_104122 ?auto_104124 ) ) ( not ( = ?auto_104122 ?auto_104125 ) ) ( not ( = ?auto_104122 ?auto_104126 ) ) ( not ( = ?auto_104123 ?auto_104124 ) ) ( not ( = ?auto_104123 ?auto_104125 ) ) ( not ( = ?auto_104123 ?auto_104126 ) ) ( not ( = ?auto_104124 ?auto_104125 ) ) ( not ( = ?auto_104124 ?auto_104126 ) ) ( not ( = ?auto_104125 ?auto_104126 ) ) ( ON-TABLE ?auto_104126 ) ( ON ?auto_104125 ?auto_104126 ) ( ON ?auto_104124 ?auto_104125 ) ( CLEAR ?auto_104122 ) ( ON ?auto_104123 ?auto_104124 ) ( CLEAR ?auto_104123 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_104126 ?auto_104125 ?auto_104124 )
      ( MAKE-7PILE ?auto_104120 ?auto_104121 ?auto_104122 ?auto_104123 ?auto_104124 ?auto_104125 ?auto_104126 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_104127 - BLOCK
      ?auto_104128 - BLOCK
      ?auto_104129 - BLOCK
      ?auto_104130 - BLOCK
      ?auto_104131 - BLOCK
      ?auto_104132 - BLOCK
      ?auto_104133 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_104127 ) ( ON ?auto_104128 ?auto_104127 ) ( not ( = ?auto_104127 ?auto_104128 ) ) ( not ( = ?auto_104127 ?auto_104129 ) ) ( not ( = ?auto_104127 ?auto_104130 ) ) ( not ( = ?auto_104127 ?auto_104131 ) ) ( not ( = ?auto_104127 ?auto_104132 ) ) ( not ( = ?auto_104127 ?auto_104133 ) ) ( not ( = ?auto_104128 ?auto_104129 ) ) ( not ( = ?auto_104128 ?auto_104130 ) ) ( not ( = ?auto_104128 ?auto_104131 ) ) ( not ( = ?auto_104128 ?auto_104132 ) ) ( not ( = ?auto_104128 ?auto_104133 ) ) ( not ( = ?auto_104129 ?auto_104130 ) ) ( not ( = ?auto_104129 ?auto_104131 ) ) ( not ( = ?auto_104129 ?auto_104132 ) ) ( not ( = ?auto_104129 ?auto_104133 ) ) ( not ( = ?auto_104130 ?auto_104131 ) ) ( not ( = ?auto_104130 ?auto_104132 ) ) ( not ( = ?auto_104130 ?auto_104133 ) ) ( not ( = ?auto_104131 ?auto_104132 ) ) ( not ( = ?auto_104131 ?auto_104133 ) ) ( not ( = ?auto_104132 ?auto_104133 ) ) ( ON-TABLE ?auto_104133 ) ( ON ?auto_104132 ?auto_104133 ) ( ON ?auto_104131 ?auto_104132 ) ( ON ?auto_104130 ?auto_104131 ) ( CLEAR ?auto_104130 ) ( HOLDING ?auto_104129 ) ( CLEAR ?auto_104128 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_104127 ?auto_104128 ?auto_104129 )
      ( MAKE-7PILE ?auto_104127 ?auto_104128 ?auto_104129 ?auto_104130 ?auto_104131 ?auto_104132 ?auto_104133 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_104134 - BLOCK
      ?auto_104135 - BLOCK
      ?auto_104136 - BLOCK
      ?auto_104137 - BLOCK
      ?auto_104138 - BLOCK
      ?auto_104139 - BLOCK
      ?auto_104140 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_104134 ) ( ON ?auto_104135 ?auto_104134 ) ( not ( = ?auto_104134 ?auto_104135 ) ) ( not ( = ?auto_104134 ?auto_104136 ) ) ( not ( = ?auto_104134 ?auto_104137 ) ) ( not ( = ?auto_104134 ?auto_104138 ) ) ( not ( = ?auto_104134 ?auto_104139 ) ) ( not ( = ?auto_104134 ?auto_104140 ) ) ( not ( = ?auto_104135 ?auto_104136 ) ) ( not ( = ?auto_104135 ?auto_104137 ) ) ( not ( = ?auto_104135 ?auto_104138 ) ) ( not ( = ?auto_104135 ?auto_104139 ) ) ( not ( = ?auto_104135 ?auto_104140 ) ) ( not ( = ?auto_104136 ?auto_104137 ) ) ( not ( = ?auto_104136 ?auto_104138 ) ) ( not ( = ?auto_104136 ?auto_104139 ) ) ( not ( = ?auto_104136 ?auto_104140 ) ) ( not ( = ?auto_104137 ?auto_104138 ) ) ( not ( = ?auto_104137 ?auto_104139 ) ) ( not ( = ?auto_104137 ?auto_104140 ) ) ( not ( = ?auto_104138 ?auto_104139 ) ) ( not ( = ?auto_104138 ?auto_104140 ) ) ( not ( = ?auto_104139 ?auto_104140 ) ) ( ON-TABLE ?auto_104140 ) ( ON ?auto_104139 ?auto_104140 ) ( ON ?auto_104138 ?auto_104139 ) ( ON ?auto_104137 ?auto_104138 ) ( CLEAR ?auto_104135 ) ( ON ?auto_104136 ?auto_104137 ) ( CLEAR ?auto_104136 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_104140 ?auto_104139 ?auto_104138 ?auto_104137 )
      ( MAKE-7PILE ?auto_104134 ?auto_104135 ?auto_104136 ?auto_104137 ?auto_104138 ?auto_104139 ?auto_104140 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_104141 - BLOCK
      ?auto_104142 - BLOCK
      ?auto_104143 - BLOCK
      ?auto_104144 - BLOCK
      ?auto_104145 - BLOCK
      ?auto_104146 - BLOCK
      ?auto_104147 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_104141 ) ( not ( = ?auto_104141 ?auto_104142 ) ) ( not ( = ?auto_104141 ?auto_104143 ) ) ( not ( = ?auto_104141 ?auto_104144 ) ) ( not ( = ?auto_104141 ?auto_104145 ) ) ( not ( = ?auto_104141 ?auto_104146 ) ) ( not ( = ?auto_104141 ?auto_104147 ) ) ( not ( = ?auto_104142 ?auto_104143 ) ) ( not ( = ?auto_104142 ?auto_104144 ) ) ( not ( = ?auto_104142 ?auto_104145 ) ) ( not ( = ?auto_104142 ?auto_104146 ) ) ( not ( = ?auto_104142 ?auto_104147 ) ) ( not ( = ?auto_104143 ?auto_104144 ) ) ( not ( = ?auto_104143 ?auto_104145 ) ) ( not ( = ?auto_104143 ?auto_104146 ) ) ( not ( = ?auto_104143 ?auto_104147 ) ) ( not ( = ?auto_104144 ?auto_104145 ) ) ( not ( = ?auto_104144 ?auto_104146 ) ) ( not ( = ?auto_104144 ?auto_104147 ) ) ( not ( = ?auto_104145 ?auto_104146 ) ) ( not ( = ?auto_104145 ?auto_104147 ) ) ( not ( = ?auto_104146 ?auto_104147 ) ) ( ON-TABLE ?auto_104147 ) ( ON ?auto_104146 ?auto_104147 ) ( ON ?auto_104145 ?auto_104146 ) ( ON ?auto_104144 ?auto_104145 ) ( ON ?auto_104143 ?auto_104144 ) ( CLEAR ?auto_104143 ) ( HOLDING ?auto_104142 ) ( CLEAR ?auto_104141 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_104141 ?auto_104142 )
      ( MAKE-7PILE ?auto_104141 ?auto_104142 ?auto_104143 ?auto_104144 ?auto_104145 ?auto_104146 ?auto_104147 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_104148 - BLOCK
      ?auto_104149 - BLOCK
      ?auto_104150 - BLOCK
      ?auto_104151 - BLOCK
      ?auto_104152 - BLOCK
      ?auto_104153 - BLOCK
      ?auto_104154 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_104148 ) ( not ( = ?auto_104148 ?auto_104149 ) ) ( not ( = ?auto_104148 ?auto_104150 ) ) ( not ( = ?auto_104148 ?auto_104151 ) ) ( not ( = ?auto_104148 ?auto_104152 ) ) ( not ( = ?auto_104148 ?auto_104153 ) ) ( not ( = ?auto_104148 ?auto_104154 ) ) ( not ( = ?auto_104149 ?auto_104150 ) ) ( not ( = ?auto_104149 ?auto_104151 ) ) ( not ( = ?auto_104149 ?auto_104152 ) ) ( not ( = ?auto_104149 ?auto_104153 ) ) ( not ( = ?auto_104149 ?auto_104154 ) ) ( not ( = ?auto_104150 ?auto_104151 ) ) ( not ( = ?auto_104150 ?auto_104152 ) ) ( not ( = ?auto_104150 ?auto_104153 ) ) ( not ( = ?auto_104150 ?auto_104154 ) ) ( not ( = ?auto_104151 ?auto_104152 ) ) ( not ( = ?auto_104151 ?auto_104153 ) ) ( not ( = ?auto_104151 ?auto_104154 ) ) ( not ( = ?auto_104152 ?auto_104153 ) ) ( not ( = ?auto_104152 ?auto_104154 ) ) ( not ( = ?auto_104153 ?auto_104154 ) ) ( ON-TABLE ?auto_104154 ) ( ON ?auto_104153 ?auto_104154 ) ( ON ?auto_104152 ?auto_104153 ) ( ON ?auto_104151 ?auto_104152 ) ( ON ?auto_104150 ?auto_104151 ) ( CLEAR ?auto_104148 ) ( ON ?auto_104149 ?auto_104150 ) ( CLEAR ?auto_104149 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_104154 ?auto_104153 ?auto_104152 ?auto_104151 ?auto_104150 )
      ( MAKE-7PILE ?auto_104148 ?auto_104149 ?auto_104150 ?auto_104151 ?auto_104152 ?auto_104153 ?auto_104154 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_104155 - BLOCK
      ?auto_104156 - BLOCK
      ?auto_104157 - BLOCK
      ?auto_104158 - BLOCK
      ?auto_104159 - BLOCK
      ?auto_104160 - BLOCK
      ?auto_104161 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_104155 ?auto_104156 ) ) ( not ( = ?auto_104155 ?auto_104157 ) ) ( not ( = ?auto_104155 ?auto_104158 ) ) ( not ( = ?auto_104155 ?auto_104159 ) ) ( not ( = ?auto_104155 ?auto_104160 ) ) ( not ( = ?auto_104155 ?auto_104161 ) ) ( not ( = ?auto_104156 ?auto_104157 ) ) ( not ( = ?auto_104156 ?auto_104158 ) ) ( not ( = ?auto_104156 ?auto_104159 ) ) ( not ( = ?auto_104156 ?auto_104160 ) ) ( not ( = ?auto_104156 ?auto_104161 ) ) ( not ( = ?auto_104157 ?auto_104158 ) ) ( not ( = ?auto_104157 ?auto_104159 ) ) ( not ( = ?auto_104157 ?auto_104160 ) ) ( not ( = ?auto_104157 ?auto_104161 ) ) ( not ( = ?auto_104158 ?auto_104159 ) ) ( not ( = ?auto_104158 ?auto_104160 ) ) ( not ( = ?auto_104158 ?auto_104161 ) ) ( not ( = ?auto_104159 ?auto_104160 ) ) ( not ( = ?auto_104159 ?auto_104161 ) ) ( not ( = ?auto_104160 ?auto_104161 ) ) ( ON-TABLE ?auto_104161 ) ( ON ?auto_104160 ?auto_104161 ) ( ON ?auto_104159 ?auto_104160 ) ( ON ?auto_104158 ?auto_104159 ) ( ON ?auto_104157 ?auto_104158 ) ( ON ?auto_104156 ?auto_104157 ) ( CLEAR ?auto_104156 ) ( HOLDING ?auto_104155 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_104155 )
      ( MAKE-7PILE ?auto_104155 ?auto_104156 ?auto_104157 ?auto_104158 ?auto_104159 ?auto_104160 ?auto_104161 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_104162 - BLOCK
      ?auto_104163 - BLOCK
      ?auto_104164 - BLOCK
      ?auto_104165 - BLOCK
      ?auto_104166 - BLOCK
      ?auto_104167 - BLOCK
      ?auto_104168 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_104162 ?auto_104163 ) ) ( not ( = ?auto_104162 ?auto_104164 ) ) ( not ( = ?auto_104162 ?auto_104165 ) ) ( not ( = ?auto_104162 ?auto_104166 ) ) ( not ( = ?auto_104162 ?auto_104167 ) ) ( not ( = ?auto_104162 ?auto_104168 ) ) ( not ( = ?auto_104163 ?auto_104164 ) ) ( not ( = ?auto_104163 ?auto_104165 ) ) ( not ( = ?auto_104163 ?auto_104166 ) ) ( not ( = ?auto_104163 ?auto_104167 ) ) ( not ( = ?auto_104163 ?auto_104168 ) ) ( not ( = ?auto_104164 ?auto_104165 ) ) ( not ( = ?auto_104164 ?auto_104166 ) ) ( not ( = ?auto_104164 ?auto_104167 ) ) ( not ( = ?auto_104164 ?auto_104168 ) ) ( not ( = ?auto_104165 ?auto_104166 ) ) ( not ( = ?auto_104165 ?auto_104167 ) ) ( not ( = ?auto_104165 ?auto_104168 ) ) ( not ( = ?auto_104166 ?auto_104167 ) ) ( not ( = ?auto_104166 ?auto_104168 ) ) ( not ( = ?auto_104167 ?auto_104168 ) ) ( ON-TABLE ?auto_104168 ) ( ON ?auto_104167 ?auto_104168 ) ( ON ?auto_104166 ?auto_104167 ) ( ON ?auto_104165 ?auto_104166 ) ( ON ?auto_104164 ?auto_104165 ) ( ON ?auto_104163 ?auto_104164 ) ( ON ?auto_104162 ?auto_104163 ) ( CLEAR ?auto_104162 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_104168 ?auto_104167 ?auto_104166 ?auto_104165 ?auto_104164 ?auto_104163 )
      ( MAKE-7PILE ?auto_104162 ?auto_104163 ?auto_104164 ?auto_104165 ?auto_104166 ?auto_104167 ?auto_104168 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_104169 - BLOCK
      ?auto_104170 - BLOCK
      ?auto_104171 - BLOCK
      ?auto_104172 - BLOCK
      ?auto_104173 - BLOCK
      ?auto_104174 - BLOCK
      ?auto_104175 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_104169 ?auto_104170 ) ) ( not ( = ?auto_104169 ?auto_104171 ) ) ( not ( = ?auto_104169 ?auto_104172 ) ) ( not ( = ?auto_104169 ?auto_104173 ) ) ( not ( = ?auto_104169 ?auto_104174 ) ) ( not ( = ?auto_104169 ?auto_104175 ) ) ( not ( = ?auto_104170 ?auto_104171 ) ) ( not ( = ?auto_104170 ?auto_104172 ) ) ( not ( = ?auto_104170 ?auto_104173 ) ) ( not ( = ?auto_104170 ?auto_104174 ) ) ( not ( = ?auto_104170 ?auto_104175 ) ) ( not ( = ?auto_104171 ?auto_104172 ) ) ( not ( = ?auto_104171 ?auto_104173 ) ) ( not ( = ?auto_104171 ?auto_104174 ) ) ( not ( = ?auto_104171 ?auto_104175 ) ) ( not ( = ?auto_104172 ?auto_104173 ) ) ( not ( = ?auto_104172 ?auto_104174 ) ) ( not ( = ?auto_104172 ?auto_104175 ) ) ( not ( = ?auto_104173 ?auto_104174 ) ) ( not ( = ?auto_104173 ?auto_104175 ) ) ( not ( = ?auto_104174 ?auto_104175 ) ) ( ON-TABLE ?auto_104175 ) ( ON ?auto_104174 ?auto_104175 ) ( ON ?auto_104173 ?auto_104174 ) ( ON ?auto_104172 ?auto_104173 ) ( ON ?auto_104171 ?auto_104172 ) ( ON ?auto_104170 ?auto_104171 ) ( HOLDING ?auto_104169 ) ( CLEAR ?auto_104170 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_104175 ?auto_104174 ?auto_104173 ?auto_104172 ?auto_104171 ?auto_104170 ?auto_104169 )
      ( MAKE-7PILE ?auto_104169 ?auto_104170 ?auto_104171 ?auto_104172 ?auto_104173 ?auto_104174 ?auto_104175 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_104176 - BLOCK
      ?auto_104177 - BLOCK
      ?auto_104178 - BLOCK
      ?auto_104179 - BLOCK
      ?auto_104180 - BLOCK
      ?auto_104181 - BLOCK
      ?auto_104182 - BLOCK
    )
    :vars
    (
      ?auto_104183 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_104176 ?auto_104177 ) ) ( not ( = ?auto_104176 ?auto_104178 ) ) ( not ( = ?auto_104176 ?auto_104179 ) ) ( not ( = ?auto_104176 ?auto_104180 ) ) ( not ( = ?auto_104176 ?auto_104181 ) ) ( not ( = ?auto_104176 ?auto_104182 ) ) ( not ( = ?auto_104177 ?auto_104178 ) ) ( not ( = ?auto_104177 ?auto_104179 ) ) ( not ( = ?auto_104177 ?auto_104180 ) ) ( not ( = ?auto_104177 ?auto_104181 ) ) ( not ( = ?auto_104177 ?auto_104182 ) ) ( not ( = ?auto_104178 ?auto_104179 ) ) ( not ( = ?auto_104178 ?auto_104180 ) ) ( not ( = ?auto_104178 ?auto_104181 ) ) ( not ( = ?auto_104178 ?auto_104182 ) ) ( not ( = ?auto_104179 ?auto_104180 ) ) ( not ( = ?auto_104179 ?auto_104181 ) ) ( not ( = ?auto_104179 ?auto_104182 ) ) ( not ( = ?auto_104180 ?auto_104181 ) ) ( not ( = ?auto_104180 ?auto_104182 ) ) ( not ( = ?auto_104181 ?auto_104182 ) ) ( ON-TABLE ?auto_104182 ) ( ON ?auto_104181 ?auto_104182 ) ( ON ?auto_104180 ?auto_104181 ) ( ON ?auto_104179 ?auto_104180 ) ( ON ?auto_104178 ?auto_104179 ) ( ON ?auto_104177 ?auto_104178 ) ( CLEAR ?auto_104177 ) ( ON ?auto_104176 ?auto_104183 ) ( CLEAR ?auto_104176 ) ( HAND-EMPTY ) ( not ( = ?auto_104176 ?auto_104183 ) ) ( not ( = ?auto_104177 ?auto_104183 ) ) ( not ( = ?auto_104178 ?auto_104183 ) ) ( not ( = ?auto_104179 ?auto_104183 ) ) ( not ( = ?auto_104180 ?auto_104183 ) ) ( not ( = ?auto_104181 ?auto_104183 ) ) ( not ( = ?auto_104182 ?auto_104183 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_104176 ?auto_104183 )
      ( MAKE-7PILE ?auto_104176 ?auto_104177 ?auto_104178 ?auto_104179 ?auto_104180 ?auto_104181 ?auto_104182 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_104184 - BLOCK
      ?auto_104185 - BLOCK
      ?auto_104186 - BLOCK
      ?auto_104187 - BLOCK
      ?auto_104188 - BLOCK
      ?auto_104189 - BLOCK
      ?auto_104190 - BLOCK
    )
    :vars
    (
      ?auto_104191 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_104184 ?auto_104185 ) ) ( not ( = ?auto_104184 ?auto_104186 ) ) ( not ( = ?auto_104184 ?auto_104187 ) ) ( not ( = ?auto_104184 ?auto_104188 ) ) ( not ( = ?auto_104184 ?auto_104189 ) ) ( not ( = ?auto_104184 ?auto_104190 ) ) ( not ( = ?auto_104185 ?auto_104186 ) ) ( not ( = ?auto_104185 ?auto_104187 ) ) ( not ( = ?auto_104185 ?auto_104188 ) ) ( not ( = ?auto_104185 ?auto_104189 ) ) ( not ( = ?auto_104185 ?auto_104190 ) ) ( not ( = ?auto_104186 ?auto_104187 ) ) ( not ( = ?auto_104186 ?auto_104188 ) ) ( not ( = ?auto_104186 ?auto_104189 ) ) ( not ( = ?auto_104186 ?auto_104190 ) ) ( not ( = ?auto_104187 ?auto_104188 ) ) ( not ( = ?auto_104187 ?auto_104189 ) ) ( not ( = ?auto_104187 ?auto_104190 ) ) ( not ( = ?auto_104188 ?auto_104189 ) ) ( not ( = ?auto_104188 ?auto_104190 ) ) ( not ( = ?auto_104189 ?auto_104190 ) ) ( ON-TABLE ?auto_104190 ) ( ON ?auto_104189 ?auto_104190 ) ( ON ?auto_104188 ?auto_104189 ) ( ON ?auto_104187 ?auto_104188 ) ( ON ?auto_104186 ?auto_104187 ) ( ON ?auto_104184 ?auto_104191 ) ( CLEAR ?auto_104184 ) ( not ( = ?auto_104184 ?auto_104191 ) ) ( not ( = ?auto_104185 ?auto_104191 ) ) ( not ( = ?auto_104186 ?auto_104191 ) ) ( not ( = ?auto_104187 ?auto_104191 ) ) ( not ( = ?auto_104188 ?auto_104191 ) ) ( not ( = ?auto_104189 ?auto_104191 ) ) ( not ( = ?auto_104190 ?auto_104191 ) ) ( HOLDING ?auto_104185 ) ( CLEAR ?auto_104186 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_104190 ?auto_104189 ?auto_104188 ?auto_104187 ?auto_104186 ?auto_104185 )
      ( MAKE-7PILE ?auto_104184 ?auto_104185 ?auto_104186 ?auto_104187 ?auto_104188 ?auto_104189 ?auto_104190 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_104192 - BLOCK
      ?auto_104193 - BLOCK
      ?auto_104194 - BLOCK
      ?auto_104195 - BLOCK
      ?auto_104196 - BLOCK
      ?auto_104197 - BLOCK
      ?auto_104198 - BLOCK
    )
    :vars
    (
      ?auto_104199 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_104192 ?auto_104193 ) ) ( not ( = ?auto_104192 ?auto_104194 ) ) ( not ( = ?auto_104192 ?auto_104195 ) ) ( not ( = ?auto_104192 ?auto_104196 ) ) ( not ( = ?auto_104192 ?auto_104197 ) ) ( not ( = ?auto_104192 ?auto_104198 ) ) ( not ( = ?auto_104193 ?auto_104194 ) ) ( not ( = ?auto_104193 ?auto_104195 ) ) ( not ( = ?auto_104193 ?auto_104196 ) ) ( not ( = ?auto_104193 ?auto_104197 ) ) ( not ( = ?auto_104193 ?auto_104198 ) ) ( not ( = ?auto_104194 ?auto_104195 ) ) ( not ( = ?auto_104194 ?auto_104196 ) ) ( not ( = ?auto_104194 ?auto_104197 ) ) ( not ( = ?auto_104194 ?auto_104198 ) ) ( not ( = ?auto_104195 ?auto_104196 ) ) ( not ( = ?auto_104195 ?auto_104197 ) ) ( not ( = ?auto_104195 ?auto_104198 ) ) ( not ( = ?auto_104196 ?auto_104197 ) ) ( not ( = ?auto_104196 ?auto_104198 ) ) ( not ( = ?auto_104197 ?auto_104198 ) ) ( ON-TABLE ?auto_104198 ) ( ON ?auto_104197 ?auto_104198 ) ( ON ?auto_104196 ?auto_104197 ) ( ON ?auto_104195 ?auto_104196 ) ( ON ?auto_104194 ?auto_104195 ) ( ON ?auto_104192 ?auto_104199 ) ( not ( = ?auto_104192 ?auto_104199 ) ) ( not ( = ?auto_104193 ?auto_104199 ) ) ( not ( = ?auto_104194 ?auto_104199 ) ) ( not ( = ?auto_104195 ?auto_104199 ) ) ( not ( = ?auto_104196 ?auto_104199 ) ) ( not ( = ?auto_104197 ?auto_104199 ) ) ( not ( = ?auto_104198 ?auto_104199 ) ) ( CLEAR ?auto_104194 ) ( ON ?auto_104193 ?auto_104192 ) ( CLEAR ?auto_104193 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_104199 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_104199 ?auto_104192 )
      ( MAKE-7PILE ?auto_104192 ?auto_104193 ?auto_104194 ?auto_104195 ?auto_104196 ?auto_104197 ?auto_104198 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_104200 - BLOCK
      ?auto_104201 - BLOCK
      ?auto_104202 - BLOCK
      ?auto_104203 - BLOCK
      ?auto_104204 - BLOCK
      ?auto_104205 - BLOCK
      ?auto_104206 - BLOCK
    )
    :vars
    (
      ?auto_104207 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_104200 ?auto_104201 ) ) ( not ( = ?auto_104200 ?auto_104202 ) ) ( not ( = ?auto_104200 ?auto_104203 ) ) ( not ( = ?auto_104200 ?auto_104204 ) ) ( not ( = ?auto_104200 ?auto_104205 ) ) ( not ( = ?auto_104200 ?auto_104206 ) ) ( not ( = ?auto_104201 ?auto_104202 ) ) ( not ( = ?auto_104201 ?auto_104203 ) ) ( not ( = ?auto_104201 ?auto_104204 ) ) ( not ( = ?auto_104201 ?auto_104205 ) ) ( not ( = ?auto_104201 ?auto_104206 ) ) ( not ( = ?auto_104202 ?auto_104203 ) ) ( not ( = ?auto_104202 ?auto_104204 ) ) ( not ( = ?auto_104202 ?auto_104205 ) ) ( not ( = ?auto_104202 ?auto_104206 ) ) ( not ( = ?auto_104203 ?auto_104204 ) ) ( not ( = ?auto_104203 ?auto_104205 ) ) ( not ( = ?auto_104203 ?auto_104206 ) ) ( not ( = ?auto_104204 ?auto_104205 ) ) ( not ( = ?auto_104204 ?auto_104206 ) ) ( not ( = ?auto_104205 ?auto_104206 ) ) ( ON-TABLE ?auto_104206 ) ( ON ?auto_104205 ?auto_104206 ) ( ON ?auto_104204 ?auto_104205 ) ( ON ?auto_104203 ?auto_104204 ) ( ON ?auto_104200 ?auto_104207 ) ( not ( = ?auto_104200 ?auto_104207 ) ) ( not ( = ?auto_104201 ?auto_104207 ) ) ( not ( = ?auto_104202 ?auto_104207 ) ) ( not ( = ?auto_104203 ?auto_104207 ) ) ( not ( = ?auto_104204 ?auto_104207 ) ) ( not ( = ?auto_104205 ?auto_104207 ) ) ( not ( = ?auto_104206 ?auto_104207 ) ) ( ON ?auto_104201 ?auto_104200 ) ( CLEAR ?auto_104201 ) ( ON-TABLE ?auto_104207 ) ( HOLDING ?auto_104202 ) ( CLEAR ?auto_104203 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_104206 ?auto_104205 ?auto_104204 ?auto_104203 ?auto_104202 )
      ( MAKE-7PILE ?auto_104200 ?auto_104201 ?auto_104202 ?auto_104203 ?auto_104204 ?auto_104205 ?auto_104206 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_104208 - BLOCK
      ?auto_104209 - BLOCK
      ?auto_104210 - BLOCK
      ?auto_104211 - BLOCK
      ?auto_104212 - BLOCK
      ?auto_104213 - BLOCK
      ?auto_104214 - BLOCK
    )
    :vars
    (
      ?auto_104215 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_104208 ?auto_104209 ) ) ( not ( = ?auto_104208 ?auto_104210 ) ) ( not ( = ?auto_104208 ?auto_104211 ) ) ( not ( = ?auto_104208 ?auto_104212 ) ) ( not ( = ?auto_104208 ?auto_104213 ) ) ( not ( = ?auto_104208 ?auto_104214 ) ) ( not ( = ?auto_104209 ?auto_104210 ) ) ( not ( = ?auto_104209 ?auto_104211 ) ) ( not ( = ?auto_104209 ?auto_104212 ) ) ( not ( = ?auto_104209 ?auto_104213 ) ) ( not ( = ?auto_104209 ?auto_104214 ) ) ( not ( = ?auto_104210 ?auto_104211 ) ) ( not ( = ?auto_104210 ?auto_104212 ) ) ( not ( = ?auto_104210 ?auto_104213 ) ) ( not ( = ?auto_104210 ?auto_104214 ) ) ( not ( = ?auto_104211 ?auto_104212 ) ) ( not ( = ?auto_104211 ?auto_104213 ) ) ( not ( = ?auto_104211 ?auto_104214 ) ) ( not ( = ?auto_104212 ?auto_104213 ) ) ( not ( = ?auto_104212 ?auto_104214 ) ) ( not ( = ?auto_104213 ?auto_104214 ) ) ( ON-TABLE ?auto_104214 ) ( ON ?auto_104213 ?auto_104214 ) ( ON ?auto_104212 ?auto_104213 ) ( ON ?auto_104211 ?auto_104212 ) ( ON ?auto_104208 ?auto_104215 ) ( not ( = ?auto_104208 ?auto_104215 ) ) ( not ( = ?auto_104209 ?auto_104215 ) ) ( not ( = ?auto_104210 ?auto_104215 ) ) ( not ( = ?auto_104211 ?auto_104215 ) ) ( not ( = ?auto_104212 ?auto_104215 ) ) ( not ( = ?auto_104213 ?auto_104215 ) ) ( not ( = ?auto_104214 ?auto_104215 ) ) ( ON ?auto_104209 ?auto_104208 ) ( ON-TABLE ?auto_104215 ) ( CLEAR ?auto_104211 ) ( ON ?auto_104210 ?auto_104209 ) ( CLEAR ?auto_104210 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_104215 ?auto_104208 ?auto_104209 )
      ( MAKE-7PILE ?auto_104208 ?auto_104209 ?auto_104210 ?auto_104211 ?auto_104212 ?auto_104213 ?auto_104214 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_104216 - BLOCK
      ?auto_104217 - BLOCK
      ?auto_104218 - BLOCK
      ?auto_104219 - BLOCK
      ?auto_104220 - BLOCK
      ?auto_104221 - BLOCK
      ?auto_104222 - BLOCK
    )
    :vars
    (
      ?auto_104223 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_104216 ?auto_104217 ) ) ( not ( = ?auto_104216 ?auto_104218 ) ) ( not ( = ?auto_104216 ?auto_104219 ) ) ( not ( = ?auto_104216 ?auto_104220 ) ) ( not ( = ?auto_104216 ?auto_104221 ) ) ( not ( = ?auto_104216 ?auto_104222 ) ) ( not ( = ?auto_104217 ?auto_104218 ) ) ( not ( = ?auto_104217 ?auto_104219 ) ) ( not ( = ?auto_104217 ?auto_104220 ) ) ( not ( = ?auto_104217 ?auto_104221 ) ) ( not ( = ?auto_104217 ?auto_104222 ) ) ( not ( = ?auto_104218 ?auto_104219 ) ) ( not ( = ?auto_104218 ?auto_104220 ) ) ( not ( = ?auto_104218 ?auto_104221 ) ) ( not ( = ?auto_104218 ?auto_104222 ) ) ( not ( = ?auto_104219 ?auto_104220 ) ) ( not ( = ?auto_104219 ?auto_104221 ) ) ( not ( = ?auto_104219 ?auto_104222 ) ) ( not ( = ?auto_104220 ?auto_104221 ) ) ( not ( = ?auto_104220 ?auto_104222 ) ) ( not ( = ?auto_104221 ?auto_104222 ) ) ( ON-TABLE ?auto_104222 ) ( ON ?auto_104221 ?auto_104222 ) ( ON ?auto_104220 ?auto_104221 ) ( ON ?auto_104216 ?auto_104223 ) ( not ( = ?auto_104216 ?auto_104223 ) ) ( not ( = ?auto_104217 ?auto_104223 ) ) ( not ( = ?auto_104218 ?auto_104223 ) ) ( not ( = ?auto_104219 ?auto_104223 ) ) ( not ( = ?auto_104220 ?auto_104223 ) ) ( not ( = ?auto_104221 ?auto_104223 ) ) ( not ( = ?auto_104222 ?auto_104223 ) ) ( ON ?auto_104217 ?auto_104216 ) ( ON-TABLE ?auto_104223 ) ( ON ?auto_104218 ?auto_104217 ) ( CLEAR ?auto_104218 ) ( HOLDING ?auto_104219 ) ( CLEAR ?auto_104220 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_104222 ?auto_104221 ?auto_104220 ?auto_104219 )
      ( MAKE-7PILE ?auto_104216 ?auto_104217 ?auto_104218 ?auto_104219 ?auto_104220 ?auto_104221 ?auto_104222 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_104224 - BLOCK
      ?auto_104225 - BLOCK
      ?auto_104226 - BLOCK
      ?auto_104227 - BLOCK
      ?auto_104228 - BLOCK
      ?auto_104229 - BLOCK
      ?auto_104230 - BLOCK
    )
    :vars
    (
      ?auto_104231 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_104224 ?auto_104225 ) ) ( not ( = ?auto_104224 ?auto_104226 ) ) ( not ( = ?auto_104224 ?auto_104227 ) ) ( not ( = ?auto_104224 ?auto_104228 ) ) ( not ( = ?auto_104224 ?auto_104229 ) ) ( not ( = ?auto_104224 ?auto_104230 ) ) ( not ( = ?auto_104225 ?auto_104226 ) ) ( not ( = ?auto_104225 ?auto_104227 ) ) ( not ( = ?auto_104225 ?auto_104228 ) ) ( not ( = ?auto_104225 ?auto_104229 ) ) ( not ( = ?auto_104225 ?auto_104230 ) ) ( not ( = ?auto_104226 ?auto_104227 ) ) ( not ( = ?auto_104226 ?auto_104228 ) ) ( not ( = ?auto_104226 ?auto_104229 ) ) ( not ( = ?auto_104226 ?auto_104230 ) ) ( not ( = ?auto_104227 ?auto_104228 ) ) ( not ( = ?auto_104227 ?auto_104229 ) ) ( not ( = ?auto_104227 ?auto_104230 ) ) ( not ( = ?auto_104228 ?auto_104229 ) ) ( not ( = ?auto_104228 ?auto_104230 ) ) ( not ( = ?auto_104229 ?auto_104230 ) ) ( ON-TABLE ?auto_104230 ) ( ON ?auto_104229 ?auto_104230 ) ( ON ?auto_104228 ?auto_104229 ) ( ON ?auto_104224 ?auto_104231 ) ( not ( = ?auto_104224 ?auto_104231 ) ) ( not ( = ?auto_104225 ?auto_104231 ) ) ( not ( = ?auto_104226 ?auto_104231 ) ) ( not ( = ?auto_104227 ?auto_104231 ) ) ( not ( = ?auto_104228 ?auto_104231 ) ) ( not ( = ?auto_104229 ?auto_104231 ) ) ( not ( = ?auto_104230 ?auto_104231 ) ) ( ON ?auto_104225 ?auto_104224 ) ( ON-TABLE ?auto_104231 ) ( ON ?auto_104226 ?auto_104225 ) ( CLEAR ?auto_104228 ) ( ON ?auto_104227 ?auto_104226 ) ( CLEAR ?auto_104227 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_104231 ?auto_104224 ?auto_104225 ?auto_104226 )
      ( MAKE-7PILE ?auto_104224 ?auto_104225 ?auto_104226 ?auto_104227 ?auto_104228 ?auto_104229 ?auto_104230 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_104232 - BLOCK
      ?auto_104233 - BLOCK
      ?auto_104234 - BLOCK
      ?auto_104235 - BLOCK
      ?auto_104236 - BLOCK
      ?auto_104237 - BLOCK
      ?auto_104238 - BLOCK
    )
    :vars
    (
      ?auto_104239 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_104232 ?auto_104233 ) ) ( not ( = ?auto_104232 ?auto_104234 ) ) ( not ( = ?auto_104232 ?auto_104235 ) ) ( not ( = ?auto_104232 ?auto_104236 ) ) ( not ( = ?auto_104232 ?auto_104237 ) ) ( not ( = ?auto_104232 ?auto_104238 ) ) ( not ( = ?auto_104233 ?auto_104234 ) ) ( not ( = ?auto_104233 ?auto_104235 ) ) ( not ( = ?auto_104233 ?auto_104236 ) ) ( not ( = ?auto_104233 ?auto_104237 ) ) ( not ( = ?auto_104233 ?auto_104238 ) ) ( not ( = ?auto_104234 ?auto_104235 ) ) ( not ( = ?auto_104234 ?auto_104236 ) ) ( not ( = ?auto_104234 ?auto_104237 ) ) ( not ( = ?auto_104234 ?auto_104238 ) ) ( not ( = ?auto_104235 ?auto_104236 ) ) ( not ( = ?auto_104235 ?auto_104237 ) ) ( not ( = ?auto_104235 ?auto_104238 ) ) ( not ( = ?auto_104236 ?auto_104237 ) ) ( not ( = ?auto_104236 ?auto_104238 ) ) ( not ( = ?auto_104237 ?auto_104238 ) ) ( ON-TABLE ?auto_104238 ) ( ON ?auto_104237 ?auto_104238 ) ( ON ?auto_104232 ?auto_104239 ) ( not ( = ?auto_104232 ?auto_104239 ) ) ( not ( = ?auto_104233 ?auto_104239 ) ) ( not ( = ?auto_104234 ?auto_104239 ) ) ( not ( = ?auto_104235 ?auto_104239 ) ) ( not ( = ?auto_104236 ?auto_104239 ) ) ( not ( = ?auto_104237 ?auto_104239 ) ) ( not ( = ?auto_104238 ?auto_104239 ) ) ( ON ?auto_104233 ?auto_104232 ) ( ON-TABLE ?auto_104239 ) ( ON ?auto_104234 ?auto_104233 ) ( ON ?auto_104235 ?auto_104234 ) ( CLEAR ?auto_104235 ) ( HOLDING ?auto_104236 ) ( CLEAR ?auto_104237 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_104238 ?auto_104237 ?auto_104236 )
      ( MAKE-7PILE ?auto_104232 ?auto_104233 ?auto_104234 ?auto_104235 ?auto_104236 ?auto_104237 ?auto_104238 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_104240 - BLOCK
      ?auto_104241 - BLOCK
      ?auto_104242 - BLOCK
      ?auto_104243 - BLOCK
      ?auto_104244 - BLOCK
      ?auto_104245 - BLOCK
      ?auto_104246 - BLOCK
    )
    :vars
    (
      ?auto_104247 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_104240 ?auto_104241 ) ) ( not ( = ?auto_104240 ?auto_104242 ) ) ( not ( = ?auto_104240 ?auto_104243 ) ) ( not ( = ?auto_104240 ?auto_104244 ) ) ( not ( = ?auto_104240 ?auto_104245 ) ) ( not ( = ?auto_104240 ?auto_104246 ) ) ( not ( = ?auto_104241 ?auto_104242 ) ) ( not ( = ?auto_104241 ?auto_104243 ) ) ( not ( = ?auto_104241 ?auto_104244 ) ) ( not ( = ?auto_104241 ?auto_104245 ) ) ( not ( = ?auto_104241 ?auto_104246 ) ) ( not ( = ?auto_104242 ?auto_104243 ) ) ( not ( = ?auto_104242 ?auto_104244 ) ) ( not ( = ?auto_104242 ?auto_104245 ) ) ( not ( = ?auto_104242 ?auto_104246 ) ) ( not ( = ?auto_104243 ?auto_104244 ) ) ( not ( = ?auto_104243 ?auto_104245 ) ) ( not ( = ?auto_104243 ?auto_104246 ) ) ( not ( = ?auto_104244 ?auto_104245 ) ) ( not ( = ?auto_104244 ?auto_104246 ) ) ( not ( = ?auto_104245 ?auto_104246 ) ) ( ON-TABLE ?auto_104246 ) ( ON ?auto_104245 ?auto_104246 ) ( ON ?auto_104240 ?auto_104247 ) ( not ( = ?auto_104240 ?auto_104247 ) ) ( not ( = ?auto_104241 ?auto_104247 ) ) ( not ( = ?auto_104242 ?auto_104247 ) ) ( not ( = ?auto_104243 ?auto_104247 ) ) ( not ( = ?auto_104244 ?auto_104247 ) ) ( not ( = ?auto_104245 ?auto_104247 ) ) ( not ( = ?auto_104246 ?auto_104247 ) ) ( ON ?auto_104241 ?auto_104240 ) ( ON-TABLE ?auto_104247 ) ( ON ?auto_104242 ?auto_104241 ) ( ON ?auto_104243 ?auto_104242 ) ( CLEAR ?auto_104245 ) ( ON ?auto_104244 ?auto_104243 ) ( CLEAR ?auto_104244 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_104247 ?auto_104240 ?auto_104241 ?auto_104242 ?auto_104243 )
      ( MAKE-7PILE ?auto_104240 ?auto_104241 ?auto_104242 ?auto_104243 ?auto_104244 ?auto_104245 ?auto_104246 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_104248 - BLOCK
      ?auto_104249 - BLOCK
      ?auto_104250 - BLOCK
      ?auto_104251 - BLOCK
      ?auto_104252 - BLOCK
      ?auto_104253 - BLOCK
      ?auto_104254 - BLOCK
    )
    :vars
    (
      ?auto_104255 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_104248 ?auto_104249 ) ) ( not ( = ?auto_104248 ?auto_104250 ) ) ( not ( = ?auto_104248 ?auto_104251 ) ) ( not ( = ?auto_104248 ?auto_104252 ) ) ( not ( = ?auto_104248 ?auto_104253 ) ) ( not ( = ?auto_104248 ?auto_104254 ) ) ( not ( = ?auto_104249 ?auto_104250 ) ) ( not ( = ?auto_104249 ?auto_104251 ) ) ( not ( = ?auto_104249 ?auto_104252 ) ) ( not ( = ?auto_104249 ?auto_104253 ) ) ( not ( = ?auto_104249 ?auto_104254 ) ) ( not ( = ?auto_104250 ?auto_104251 ) ) ( not ( = ?auto_104250 ?auto_104252 ) ) ( not ( = ?auto_104250 ?auto_104253 ) ) ( not ( = ?auto_104250 ?auto_104254 ) ) ( not ( = ?auto_104251 ?auto_104252 ) ) ( not ( = ?auto_104251 ?auto_104253 ) ) ( not ( = ?auto_104251 ?auto_104254 ) ) ( not ( = ?auto_104252 ?auto_104253 ) ) ( not ( = ?auto_104252 ?auto_104254 ) ) ( not ( = ?auto_104253 ?auto_104254 ) ) ( ON-TABLE ?auto_104254 ) ( ON ?auto_104248 ?auto_104255 ) ( not ( = ?auto_104248 ?auto_104255 ) ) ( not ( = ?auto_104249 ?auto_104255 ) ) ( not ( = ?auto_104250 ?auto_104255 ) ) ( not ( = ?auto_104251 ?auto_104255 ) ) ( not ( = ?auto_104252 ?auto_104255 ) ) ( not ( = ?auto_104253 ?auto_104255 ) ) ( not ( = ?auto_104254 ?auto_104255 ) ) ( ON ?auto_104249 ?auto_104248 ) ( ON-TABLE ?auto_104255 ) ( ON ?auto_104250 ?auto_104249 ) ( ON ?auto_104251 ?auto_104250 ) ( ON ?auto_104252 ?auto_104251 ) ( CLEAR ?auto_104252 ) ( HOLDING ?auto_104253 ) ( CLEAR ?auto_104254 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_104254 ?auto_104253 )
      ( MAKE-7PILE ?auto_104248 ?auto_104249 ?auto_104250 ?auto_104251 ?auto_104252 ?auto_104253 ?auto_104254 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_104256 - BLOCK
      ?auto_104257 - BLOCK
      ?auto_104258 - BLOCK
      ?auto_104259 - BLOCK
      ?auto_104260 - BLOCK
      ?auto_104261 - BLOCK
      ?auto_104262 - BLOCK
    )
    :vars
    (
      ?auto_104263 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_104256 ?auto_104257 ) ) ( not ( = ?auto_104256 ?auto_104258 ) ) ( not ( = ?auto_104256 ?auto_104259 ) ) ( not ( = ?auto_104256 ?auto_104260 ) ) ( not ( = ?auto_104256 ?auto_104261 ) ) ( not ( = ?auto_104256 ?auto_104262 ) ) ( not ( = ?auto_104257 ?auto_104258 ) ) ( not ( = ?auto_104257 ?auto_104259 ) ) ( not ( = ?auto_104257 ?auto_104260 ) ) ( not ( = ?auto_104257 ?auto_104261 ) ) ( not ( = ?auto_104257 ?auto_104262 ) ) ( not ( = ?auto_104258 ?auto_104259 ) ) ( not ( = ?auto_104258 ?auto_104260 ) ) ( not ( = ?auto_104258 ?auto_104261 ) ) ( not ( = ?auto_104258 ?auto_104262 ) ) ( not ( = ?auto_104259 ?auto_104260 ) ) ( not ( = ?auto_104259 ?auto_104261 ) ) ( not ( = ?auto_104259 ?auto_104262 ) ) ( not ( = ?auto_104260 ?auto_104261 ) ) ( not ( = ?auto_104260 ?auto_104262 ) ) ( not ( = ?auto_104261 ?auto_104262 ) ) ( ON-TABLE ?auto_104262 ) ( ON ?auto_104256 ?auto_104263 ) ( not ( = ?auto_104256 ?auto_104263 ) ) ( not ( = ?auto_104257 ?auto_104263 ) ) ( not ( = ?auto_104258 ?auto_104263 ) ) ( not ( = ?auto_104259 ?auto_104263 ) ) ( not ( = ?auto_104260 ?auto_104263 ) ) ( not ( = ?auto_104261 ?auto_104263 ) ) ( not ( = ?auto_104262 ?auto_104263 ) ) ( ON ?auto_104257 ?auto_104256 ) ( ON-TABLE ?auto_104263 ) ( ON ?auto_104258 ?auto_104257 ) ( ON ?auto_104259 ?auto_104258 ) ( ON ?auto_104260 ?auto_104259 ) ( CLEAR ?auto_104262 ) ( ON ?auto_104261 ?auto_104260 ) ( CLEAR ?auto_104261 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_104263 ?auto_104256 ?auto_104257 ?auto_104258 ?auto_104259 ?auto_104260 )
      ( MAKE-7PILE ?auto_104256 ?auto_104257 ?auto_104258 ?auto_104259 ?auto_104260 ?auto_104261 ?auto_104262 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_104264 - BLOCK
      ?auto_104265 - BLOCK
      ?auto_104266 - BLOCK
      ?auto_104267 - BLOCK
      ?auto_104268 - BLOCK
      ?auto_104269 - BLOCK
      ?auto_104270 - BLOCK
    )
    :vars
    (
      ?auto_104271 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_104264 ?auto_104265 ) ) ( not ( = ?auto_104264 ?auto_104266 ) ) ( not ( = ?auto_104264 ?auto_104267 ) ) ( not ( = ?auto_104264 ?auto_104268 ) ) ( not ( = ?auto_104264 ?auto_104269 ) ) ( not ( = ?auto_104264 ?auto_104270 ) ) ( not ( = ?auto_104265 ?auto_104266 ) ) ( not ( = ?auto_104265 ?auto_104267 ) ) ( not ( = ?auto_104265 ?auto_104268 ) ) ( not ( = ?auto_104265 ?auto_104269 ) ) ( not ( = ?auto_104265 ?auto_104270 ) ) ( not ( = ?auto_104266 ?auto_104267 ) ) ( not ( = ?auto_104266 ?auto_104268 ) ) ( not ( = ?auto_104266 ?auto_104269 ) ) ( not ( = ?auto_104266 ?auto_104270 ) ) ( not ( = ?auto_104267 ?auto_104268 ) ) ( not ( = ?auto_104267 ?auto_104269 ) ) ( not ( = ?auto_104267 ?auto_104270 ) ) ( not ( = ?auto_104268 ?auto_104269 ) ) ( not ( = ?auto_104268 ?auto_104270 ) ) ( not ( = ?auto_104269 ?auto_104270 ) ) ( ON ?auto_104264 ?auto_104271 ) ( not ( = ?auto_104264 ?auto_104271 ) ) ( not ( = ?auto_104265 ?auto_104271 ) ) ( not ( = ?auto_104266 ?auto_104271 ) ) ( not ( = ?auto_104267 ?auto_104271 ) ) ( not ( = ?auto_104268 ?auto_104271 ) ) ( not ( = ?auto_104269 ?auto_104271 ) ) ( not ( = ?auto_104270 ?auto_104271 ) ) ( ON ?auto_104265 ?auto_104264 ) ( ON-TABLE ?auto_104271 ) ( ON ?auto_104266 ?auto_104265 ) ( ON ?auto_104267 ?auto_104266 ) ( ON ?auto_104268 ?auto_104267 ) ( ON ?auto_104269 ?auto_104268 ) ( CLEAR ?auto_104269 ) ( HOLDING ?auto_104270 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_104270 )
      ( MAKE-7PILE ?auto_104264 ?auto_104265 ?auto_104266 ?auto_104267 ?auto_104268 ?auto_104269 ?auto_104270 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_104272 - BLOCK
      ?auto_104273 - BLOCK
      ?auto_104274 - BLOCK
      ?auto_104275 - BLOCK
      ?auto_104276 - BLOCK
      ?auto_104277 - BLOCK
      ?auto_104278 - BLOCK
    )
    :vars
    (
      ?auto_104279 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_104272 ?auto_104273 ) ) ( not ( = ?auto_104272 ?auto_104274 ) ) ( not ( = ?auto_104272 ?auto_104275 ) ) ( not ( = ?auto_104272 ?auto_104276 ) ) ( not ( = ?auto_104272 ?auto_104277 ) ) ( not ( = ?auto_104272 ?auto_104278 ) ) ( not ( = ?auto_104273 ?auto_104274 ) ) ( not ( = ?auto_104273 ?auto_104275 ) ) ( not ( = ?auto_104273 ?auto_104276 ) ) ( not ( = ?auto_104273 ?auto_104277 ) ) ( not ( = ?auto_104273 ?auto_104278 ) ) ( not ( = ?auto_104274 ?auto_104275 ) ) ( not ( = ?auto_104274 ?auto_104276 ) ) ( not ( = ?auto_104274 ?auto_104277 ) ) ( not ( = ?auto_104274 ?auto_104278 ) ) ( not ( = ?auto_104275 ?auto_104276 ) ) ( not ( = ?auto_104275 ?auto_104277 ) ) ( not ( = ?auto_104275 ?auto_104278 ) ) ( not ( = ?auto_104276 ?auto_104277 ) ) ( not ( = ?auto_104276 ?auto_104278 ) ) ( not ( = ?auto_104277 ?auto_104278 ) ) ( ON ?auto_104272 ?auto_104279 ) ( not ( = ?auto_104272 ?auto_104279 ) ) ( not ( = ?auto_104273 ?auto_104279 ) ) ( not ( = ?auto_104274 ?auto_104279 ) ) ( not ( = ?auto_104275 ?auto_104279 ) ) ( not ( = ?auto_104276 ?auto_104279 ) ) ( not ( = ?auto_104277 ?auto_104279 ) ) ( not ( = ?auto_104278 ?auto_104279 ) ) ( ON ?auto_104273 ?auto_104272 ) ( ON-TABLE ?auto_104279 ) ( ON ?auto_104274 ?auto_104273 ) ( ON ?auto_104275 ?auto_104274 ) ( ON ?auto_104276 ?auto_104275 ) ( ON ?auto_104277 ?auto_104276 ) ( ON ?auto_104278 ?auto_104277 ) ( CLEAR ?auto_104278 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_104279 ?auto_104272 ?auto_104273 ?auto_104274 ?auto_104275 ?auto_104276 ?auto_104277 )
      ( MAKE-7PILE ?auto_104272 ?auto_104273 ?auto_104274 ?auto_104275 ?auto_104276 ?auto_104277 ?auto_104278 ) )
  )

)

