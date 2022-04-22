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
      ?auto_212425 - BLOCK
    )
    :vars
    (
      ?auto_212426 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_212425 ?auto_212426 ) ( CLEAR ?auto_212425 ) ( HAND-EMPTY ) ( not ( = ?auto_212425 ?auto_212426 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_212425 ?auto_212426 )
      ( !PUTDOWN ?auto_212425 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_212428 - BLOCK
    )
    :vars
    (
      ?auto_212429 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_212428 ?auto_212429 ) ( CLEAR ?auto_212428 ) ( HAND-EMPTY ) ( not ( = ?auto_212428 ?auto_212429 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_212428 ?auto_212429 )
      ( !PUTDOWN ?auto_212428 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_212432 - BLOCK
      ?auto_212433 - BLOCK
    )
    :vars
    (
      ?auto_212434 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_212432 ) ( ON ?auto_212433 ?auto_212434 ) ( CLEAR ?auto_212433 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_212432 ) ( not ( = ?auto_212432 ?auto_212433 ) ) ( not ( = ?auto_212432 ?auto_212434 ) ) ( not ( = ?auto_212433 ?auto_212434 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_212433 ?auto_212434 )
      ( !STACK ?auto_212433 ?auto_212432 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_212437 - BLOCK
      ?auto_212438 - BLOCK
    )
    :vars
    (
      ?auto_212439 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_212437 ) ( ON ?auto_212438 ?auto_212439 ) ( CLEAR ?auto_212438 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_212437 ) ( not ( = ?auto_212437 ?auto_212438 ) ) ( not ( = ?auto_212437 ?auto_212439 ) ) ( not ( = ?auto_212438 ?auto_212439 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_212438 ?auto_212439 )
      ( !STACK ?auto_212438 ?auto_212437 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_212442 - BLOCK
      ?auto_212443 - BLOCK
    )
    :vars
    (
      ?auto_212444 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_212443 ?auto_212444 ) ( not ( = ?auto_212442 ?auto_212443 ) ) ( not ( = ?auto_212442 ?auto_212444 ) ) ( not ( = ?auto_212443 ?auto_212444 ) ) ( ON ?auto_212442 ?auto_212443 ) ( CLEAR ?auto_212442 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_212442 )
      ( MAKE-2PILE ?auto_212442 ?auto_212443 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_212447 - BLOCK
      ?auto_212448 - BLOCK
    )
    :vars
    (
      ?auto_212449 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_212448 ?auto_212449 ) ( not ( = ?auto_212447 ?auto_212448 ) ) ( not ( = ?auto_212447 ?auto_212449 ) ) ( not ( = ?auto_212448 ?auto_212449 ) ) ( ON ?auto_212447 ?auto_212448 ) ( CLEAR ?auto_212447 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_212447 )
      ( MAKE-2PILE ?auto_212447 ?auto_212448 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_212453 - BLOCK
      ?auto_212454 - BLOCK
      ?auto_212455 - BLOCK
    )
    :vars
    (
      ?auto_212456 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_212454 ) ( ON ?auto_212455 ?auto_212456 ) ( CLEAR ?auto_212455 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_212453 ) ( ON ?auto_212454 ?auto_212453 ) ( not ( = ?auto_212453 ?auto_212454 ) ) ( not ( = ?auto_212453 ?auto_212455 ) ) ( not ( = ?auto_212453 ?auto_212456 ) ) ( not ( = ?auto_212454 ?auto_212455 ) ) ( not ( = ?auto_212454 ?auto_212456 ) ) ( not ( = ?auto_212455 ?auto_212456 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_212455 ?auto_212456 )
      ( !STACK ?auto_212455 ?auto_212454 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_212460 - BLOCK
      ?auto_212461 - BLOCK
      ?auto_212462 - BLOCK
    )
    :vars
    (
      ?auto_212463 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_212461 ) ( ON ?auto_212462 ?auto_212463 ) ( CLEAR ?auto_212462 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_212460 ) ( ON ?auto_212461 ?auto_212460 ) ( not ( = ?auto_212460 ?auto_212461 ) ) ( not ( = ?auto_212460 ?auto_212462 ) ) ( not ( = ?auto_212460 ?auto_212463 ) ) ( not ( = ?auto_212461 ?auto_212462 ) ) ( not ( = ?auto_212461 ?auto_212463 ) ) ( not ( = ?auto_212462 ?auto_212463 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_212462 ?auto_212463 )
      ( !STACK ?auto_212462 ?auto_212461 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_212467 - BLOCK
      ?auto_212468 - BLOCK
      ?auto_212469 - BLOCK
    )
    :vars
    (
      ?auto_212470 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_212469 ?auto_212470 ) ( ON-TABLE ?auto_212467 ) ( not ( = ?auto_212467 ?auto_212468 ) ) ( not ( = ?auto_212467 ?auto_212469 ) ) ( not ( = ?auto_212467 ?auto_212470 ) ) ( not ( = ?auto_212468 ?auto_212469 ) ) ( not ( = ?auto_212468 ?auto_212470 ) ) ( not ( = ?auto_212469 ?auto_212470 ) ) ( CLEAR ?auto_212467 ) ( ON ?auto_212468 ?auto_212469 ) ( CLEAR ?auto_212468 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_212467 ?auto_212468 )
      ( MAKE-3PILE ?auto_212467 ?auto_212468 ?auto_212469 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_212474 - BLOCK
      ?auto_212475 - BLOCK
      ?auto_212476 - BLOCK
    )
    :vars
    (
      ?auto_212477 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_212476 ?auto_212477 ) ( ON-TABLE ?auto_212474 ) ( not ( = ?auto_212474 ?auto_212475 ) ) ( not ( = ?auto_212474 ?auto_212476 ) ) ( not ( = ?auto_212474 ?auto_212477 ) ) ( not ( = ?auto_212475 ?auto_212476 ) ) ( not ( = ?auto_212475 ?auto_212477 ) ) ( not ( = ?auto_212476 ?auto_212477 ) ) ( CLEAR ?auto_212474 ) ( ON ?auto_212475 ?auto_212476 ) ( CLEAR ?auto_212475 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_212474 ?auto_212475 )
      ( MAKE-3PILE ?auto_212474 ?auto_212475 ?auto_212476 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_212481 - BLOCK
      ?auto_212482 - BLOCK
      ?auto_212483 - BLOCK
    )
    :vars
    (
      ?auto_212484 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_212483 ?auto_212484 ) ( not ( = ?auto_212481 ?auto_212482 ) ) ( not ( = ?auto_212481 ?auto_212483 ) ) ( not ( = ?auto_212481 ?auto_212484 ) ) ( not ( = ?auto_212482 ?auto_212483 ) ) ( not ( = ?auto_212482 ?auto_212484 ) ) ( not ( = ?auto_212483 ?auto_212484 ) ) ( ON ?auto_212482 ?auto_212483 ) ( ON ?auto_212481 ?auto_212482 ) ( CLEAR ?auto_212481 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_212481 )
      ( MAKE-3PILE ?auto_212481 ?auto_212482 ?auto_212483 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_212488 - BLOCK
      ?auto_212489 - BLOCK
      ?auto_212490 - BLOCK
    )
    :vars
    (
      ?auto_212491 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_212490 ?auto_212491 ) ( not ( = ?auto_212488 ?auto_212489 ) ) ( not ( = ?auto_212488 ?auto_212490 ) ) ( not ( = ?auto_212488 ?auto_212491 ) ) ( not ( = ?auto_212489 ?auto_212490 ) ) ( not ( = ?auto_212489 ?auto_212491 ) ) ( not ( = ?auto_212490 ?auto_212491 ) ) ( ON ?auto_212489 ?auto_212490 ) ( ON ?auto_212488 ?auto_212489 ) ( CLEAR ?auto_212488 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_212488 )
      ( MAKE-3PILE ?auto_212488 ?auto_212489 ?auto_212490 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_212496 - BLOCK
      ?auto_212497 - BLOCK
      ?auto_212498 - BLOCK
      ?auto_212499 - BLOCK
    )
    :vars
    (
      ?auto_212500 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_212498 ) ( ON ?auto_212499 ?auto_212500 ) ( CLEAR ?auto_212499 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_212496 ) ( ON ?auto_212497 ?auto_212496 ) ( ON ?auto_212498 ?auto_212497 ) ( not ( = ?auto_212496 ?auto_212497 ) ) ( not ( = ?auto_212496 ?auto_212498 ) ) ( not ( = ?auto_212496 ?auto_212499 ) ) ( not ( = ?auto_212496 ?auto_212500 ) ) ( not ( = ?auto_212497 ?auto_212498 ) ) ( not ( = ?auto_212497 ?auto_212499 ) ) ( not ( = ?auto_212497 ?auto_212500 ) ) ( not ( = ?auto_212498 ?auto_212499 ) ) ( not ( = ?auto_212498 ?auto_212500 ) ) ( not ( = ?auto_212499 ?auto_212500 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_212499 ?auto_212500 )
      ( !STACK ?auto_212499 ?auto_212498 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_212505 - BLOCK
      ?auto_212506 - BLOCK
      ?auto_212507 - BLOCK
      ?auto_212508 - BLOCK
    )
    :vars
    (
      ?auto_212509 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_212507 ) ( ON ?auto_212508 ?auto_212509 ) ( CLEAR ?auto_212508 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_212505 ) ( ON ?auto_212506 ?auto_212505 ) ( ON ?auto_212507 ?auto_212506 ) ( not ( = ?auto_212505 ?auto_212506 ) ) ( not ( = ?auto_212505 ?auto_212507 ) ) ( not ( = ?auto_212505 ?auto_212508 ) ) ( not ( = ?auto_212505 ?auto_212509 ) ) ( not ( = ?auto_212506 ?auto_212507 ) ) ( not ( = ?auto_212506 ?auto_212508 ) ) ( not ( = ?auto_212506 ?auto_212509 ) ) ( not ( = ?auto_212507 ?auto_212508 ) ) ( not ( = ?auto_212507 ?auto_212509 ) ) ( not ( = ?auto_212508 ?auto_212509 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_212508 ?auto_212509 )
      ( !STACK ?auto_212508 ?auto_212507 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_212514 - BLOCK
      ?auto_212515 - BLOCK
      ?auto_212516 - BLOCK
      ?auto_212517 - BLOCK
    )
    :vars
    (
      ?auto_212518 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_212517 ?auto_212518 ) ( ON-TABLE ?auto_212514 ) ( ON ?auto_212515 ?auto_212514 ) ( not ( = ?auto_212514 ?auto_212515 ) ) ( not ( = ?auto_212514 ?auto_212516 ) ) ( not ( = ?auto_212514 ?auto_212517 ) ) ( not ( = ?auto_212514 ?auto_212518 ) ) ( not ( = ?auto_212515 ?auto_212516 ) ) ( not ( = ?auto_212515 ?auto_212517 ) ) ( not ( = ?auto_212515 ?auto_212518 ) ) ( not ( = ?auto_212516 ?auto_212517 ) ) ( not ( = ?auto_212516 ?auto_212518 ) ) ( not ( = ?auto_212517 ?auto_212518 ) ) ( CLEAR ?auto_212515 ) ( ON ?auto_212516 ?auto_212517 ) ( CLEAR ?auto_212516 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_212514 ?auto_212515 ?auto_212516 )
      ( MAKE-4PILE ?auto_212514 ?auto_212515 ?auto_212516 ?auto_212517 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_212523 - BLOCK
      ?auto_212524 - BLOCK
      ?auto_212525 - BLOCK
      ?auto_212526 - BLOCK
    )
    :vars
    (
      ?auto_212527 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_212526 ?auto_212527 ) ( ON-TABLE ?auto_212523 ) ( ON ?auto_212524 ?auto_212523 ) ( not ( = ?auto_212523 ?auto_212524 ) ) ( not ( = ?auto_212523 ?auto_212525 ) ) ( not ( = ?auto_212523 ?auto_212526 ) ) ( not ( = ?auto_212523 ?auto_212527 ) ) ( not ( = ?auto_212524 ?auto_212525 ) ) ( not ( = ?auto_212524 ?auto_212526 ) ) ( not ( = ?auto_212524 ?auto_212527 ) ) ( not ( = ?auto_212525 ?auto_212526 ) ) ( not ( = ?auto_212525 ?auto_212527 ) ) ( not ( = ?auto_212526 ?auto_212527 ) ) ( CLEAR ?auto_212524 ) ( ON ?auto_212525 ?auto_212526 ) ( CLEAR ?auto_212525 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_212523 ?auto_212524 ?auto_212525 )
      ( MAKE-4PILE ?auto_212523 ?auto_212524 ?auto_212525 ?auto_212526 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_212532 - BLOCK
      ?auto_212533 - BLOCK
      ?auto_212534 - BLOCK
      ?auto_212535 - BLOCK
    )
    :vars
    (
      ?auto_212536 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_212535 ?auto_212536 ) ( ON-TABLE ?auto_212532 ) ( not ( = ?auto_212532 ?auto_212533 ) ) ( not ( = ?auto_212532 ?auto_212534 ) ) ( not ( = ?auto_212532 ?auto_212535 ) ) ( not ( = ?auto_212532 ?auto_212536 ) ) ( not ( = ?auto_212533 ?auto_212534 ) ) ( not ( = ?auto_212533 ?auto_212535 ) ) ( not ( = ?auto_212533 ?auto_212536 ) ) ( not ( = ?auto_212534 ?auto_212535 ) ) ( not ( = ?auto_212534 ?auto_212536 ) ) ( not ( = ?auto_212535 ?auto_212536 ) ) ( ON ?auto_212534 ?auto_212535 ) ( CLEAR ?auto_212532 ) ( ON ?auto_212533 ?auto_212534 ) ( CLEAR ?auto_212533 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_212532 ?auto_212533 )
      ( MAKE-4PILE ?auto_212532 ?auto_212533 ?auto_212534 ?auto_212535 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_212541 - BLOCK
      ?auto_212542 - BLOCK
      ?auto_212543 - BLOCK
      ?auto_212544 - BLOCK
    )
    :vars
    (
      ?auto_212545 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_212544 ?auto_212545 ) ( ON-TABLE ?auto_212541 ) ( not ( = ?auto_212541 ?auto_212542 ) ) ( not ( = ?auto_212541 ?auto_212543 ) ) ( not ( = ?auto_212541 ?auto_212544 ) ) ( not ( = ?auto_212541 ?auto_212545 ) ) ( not ( = ?auto_212542 ?auto_212543 ) ) ( not ( = ?auto_212542 ?auto_212544 ) ) ( not ( = ?auto_212542 ?auto_212545 ) ) ( not ( = ?auto_212543 ?auto_212544 ) ) ( not ( = ?auto_212543 ?auto_212545 ) ) ( not ( = ?auto_212544 ?auto_212545 ) ) ( ON ?auto_212543 ?auto_212544 ) ( CLEAR ?auto_212541 ) ( ON ?auto_212542 ?auto_212543 ) ( CLEAR ?auto_212542 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_212541 ?auto_212542 )
      ( MAKE-4PILE ?auto_212541 ?auto_212542 ?auto_212543 ?auto_212544 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_212550 - BLOCK
      ?auto_212551 - BLOCK
      ?auto_212552 - BLOCK
      ?auto_212553 - BLOCK
    )
    :vars
    (
      ?auto_212554 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_212553 ?auto_212554 ) ( not ( = ?auto_212550 ?auto_212551 ) ) ( not ( = ?auto_212550 ?auto_212552 ) ) ( not ( = ?auto_212550 ?auto_212553 ) ) ( not ( = ?auto_212550 ?auto_212554 ) ) ( not ( = ?auto_212551 ?auto_212552 ) ) ( not ( = ?auto_212551 ?auto_212553 ) ) ( not ( = ?auto_212551 ?auto_212554 ) ) ( not ( = ?auto_212552 ?auto_212553 ) ) ( not ( = ?auto_212552 ?auto_212554 ) ) ( not ( = ?auto_212553 ?auto_212554 ) ) ( ON ?auto_212552 ?auto_212553 ) ( ON ?auto_212551 ?auto_212552 ) ( ON ?auto_212550 ?auto_212551 ) ( CLEAR ?auto_212550 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_212550 )
      ( MAKE-4PILE ?auto_212550 ?auto_212551 ?auto_212552 ?auto_212553 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_212559 - BLOCK
      ?auto_212560 - BLOCK
      ?auto_212561 - BLOCK
      ?auto_212562 - BLOCK
    )
    :vars
    (
      ?auto_212563 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_212562 ?auto_212563 ) ( not ( = ?auto_212559 ?auto_212560 ) ) ( not ( = ?auto_212559 ?auto_212561 ) ) ( not ( = ?auto_212559 ?auto_212562 ) ) ( not ( = ?auto_212559 ?auto_212563 ) ) ( not ( = ?auto_212560 ?auto_212561 ) ) ( not ( = ?auto_212560 ?auto_212562 ) ) ( not ( = ?auto_212560 ?auto_212563 ) ) ( not ( = ?auto_212561 ?auto_212562 ) ) ( not ( = ?auto_212561 ?auto_212563 ) ) ( not ( = ?auto_212562 ?auto_212563 ) ) ( ON ?auto_212561 ?auto_212562 ) ( ON ?auto_212560 ?auto_212561 ) ( ON ?auto_212559 ?auto_212560 ) ( CLEAR ?auto_212559 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_212559 )
      ( MAKE-4PILE ?auto_212559 ?auto_212560 ?auto_212561 ?auto_212562 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_212569 - BLOCK
      ?auto_212570 - BLOCK
      ?auto_212571 - BLOCK
      ?auto_212572 - BLOCK
      ?auto_212573 - BLOCK
    )
    :vars
    (
      ?auto_212574 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_212572 ) ( ON ?auto_212573 ?auto_212574 ) ( CLEAR ?auto_212573 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_212569 ) ( ON ?auto_212570 ?auto_212569 ) ( ON ?auto_212571 ?auto_212570 ) ( ON ?auto_212572 ?auto_212571 ) ( not ( = ?auto_212569 ?auto_212570 ) ) ( not ( = ?auto_212569 ?auto_212571 ) ) ( not ( = ?auto_212569 ?auto_212572 ) ) ( not ( = ?auto_212569 ?auto_212573 ) ) ( not ( = ?auto_212569 ?auto_212574 ) ) ( not ( = ?auto_212570 ?auto_212571 ) ) ( not ( = ?auto_212570 ?auto_212572 ) ) ( not ( = ?auto_212570 ?auto_212573 ) ) ( not ( = ?auto_212570 ?auto_212574 ) ) ( not ( = ?auto_212571 ?auto_212572 ) ) ( not ( = ?auto_212571 ?auto_212573 ) ) ( not ( = ?auto_212571 ?auto_212574 ) ) ( not ( = ?auto_212572 ?auto_212573 ) ) ( not ( = ?auto_212572 ?auto_212574 ) ) ( not ( = ?auto_212573 ?auto_212574 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_212573 ?auto_212574 )
      ( !STACK ?auto_212573 ?auto_212572 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_212580 - BLOCK
      ?auto_212581 - BLOCK
      ?auto_212582 - BLOCK
      ?auto_212583 - BLOCK
      ?auto_212584 - BLOCK
    )
    :vars
    (
      ?auto_212585 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_212583 ) ( ON ?auto_212584 ?auto_212585 ) ( CLEAR ?auto_212584 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_212580 ) ( ON ?auto_212581 ?auto_212580 ) ( ON ?auto_212582 ?auto_212581 ) ( ON ?auto_212583 ?auto_212582 ) ( not ( = ?auto_212580 ?auto_212581 ) ) ( not ( = ?auto_212580 ?auto_212582 ) ) ( not ( = ?auto_212580 ?auto_212583 ) ) ( not ( = ?auto_212580 ?auto_212584 ) ) ( not ( = ?auto_212580 ?auto_212585 ) ) ( not ( = ?auto_212581 ?auto_212582 ) ) ( not ( = ?auto_212581 ?auto_212583 ) ) ( not ( = ?auto_212581 ?auto_212584 ) ) ( not ( = ?auto_212581 ?auto_212585 ) ) ( not ( = ?auto_212582 ?auto_212583 ) ) ( not ( = ?auto_212582 ?auto_212584 ) ) ( not ( = ?auto_212582 ?auto_212585 ) ) ( not ( = ?auto_212583 ?auto_212584 ) ) ( not ( = ?auto_212583 ?auto_212585 ) ) ( not ( = ?auto_212584 ?auto_212585 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_212584 ?auto_212585 )
      ( !STACK ?auto_212584 ?auto_212583 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_212591 - BLOCK
      ?auto_212592 - BLOCK
      ?auto_212593 - BLOCK
      ?auto_212594 - BLOCK
      ?auto_212595 - BLOCK
    )
    :vars
    (
      ?auto_212596 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_212595 ?auto_212596 ) ( ON-TABLE ?auto_212591 ) ( ON ?auto_212592 ?auto_212591 ) ( ON ?auto_212593 ?auto_212592 ) ( not ( = ?auto_212591 ?auto_212592 ) ) ( not ( = ?auto_212591 ?auto_212593 ) ) ( not ( = ?auto_212591 ?auto_212594 ) ) ( not ( = ?auto_212591 ?auto_212595 ) ) ( not ( = ?auto_212591 ?auto_212596 ) ) ( not ( = ?auto_212592 ?auto_212593 ) ) ( not ( = ?auto_212592 ?auto_212594 ) ) ( not ( = ?auto_212592 ?auto_212595 ) ) ( not ( = ?auto_212592 ?auto_212596 ) ) ( not ( = ?auto_212593 ?auto_212594 ) ) ( not ( = ?auto_212593 ?auto_212595 ) ) ( not ( = ?auto_212593 ?auto_212596 ) ) ( not ( = ?auto_212594 ?auto_212595 ) ) ( not ( = ?auto_212594 ?auto_212596 ) ) ( not ( = ?auto_212595 ?auto_212596 ) ) ( CLEAR ?auto_212593 ) ( ON ?auto_212594 ?auto_212595 ) ( CLEAR ?auto_212594 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_212591 ?auto_212592 ?auto_212593 ?auto_212594 )
      ( MAKE-5PILE ?auto_212591 ?auto_212592 ?auto_212593 ?auto_212594 ?auto_212595 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_212602 - BLOCK
      ?auto_212603 - BLOCK
      ?auto_212604 - BLOCK
      ?auto_212605 - BLOCK
      ?auto_212606 - BLOCK
    )
    :vars
    (
      ?auto_212607 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_212606 ?auto_212607 ) ( ON-TABLE ?auto_212602 ) ( ON ?auto_212603 ?auto_212602 ) ( ON ?auto_212604 ?auto_212603 ) ( not ( = ?auto_212602 ?auto_212603 ) ) ( not ( = ?auto_212602 ?auto_212604 ) ) ( not ( = ?auto_212602 ?auto_212605 ) ) ( not ( = ?auto_212602 ?auto_212606 ) ) ( not ( = ?auto_212602 ?auto_212607 ) ) ( not ( = ?auto_212603 ?auto_212604 ) ) ( not ( = ?auto_212603 ?auto_212605 ) ) ( not ( = ?auto_212603 ?auto_212606 ) ) ( not ( = ?auto_212603 ?auto_212607 ) ) ( not ( = ?auto_212604 ?auto_212605 ) ) ( not ( = ?auto_212604 ?auto_212606 ) ) ( not ( = ?auto_212604 ?auto_212607 ) ) ( not ( = ?auto_212605 ?auto_212606 ) ) ( not ( = ?auto_212605 ?auto_212607 ) ) ( not ( = ?auto_212606 ?auto_212607 ) ) ( CLEAR ?auto_212604 ) ( ON ?auto_212605 ?auto_212606 ) ( CLEAR ?auto_212605 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_212602 ?auto_212603 ?auto_212604 ?auto_212605 )
      ( MAKE-5PILE ?auto_212602 ?auto_212603 ?auto_212604 ?auto_212605 ?auto_212606 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_212613 - BLOCK
      ?auto_212614 - BLOCK
      ?auto_212615 - BLOCK
      ?auto_212616 - BLOCK
      ?auto_212617 - BLOCK
    )
    :vars
    (
      ?auto_212618 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_212617 ?auto_212618 ) ( ON-TABLE ?auto_212613 ) ( ON ?auto_212614 ?auto_212613 ) ( not ( = ?auto_212613 ?auto_212614 ) ) ( not ( = ?auto_212613 ?auto_212615 ) ) ( not ( = ?auto_212613 ?auto_212616 ) ) ( not ( = ?auto_212613 ?auto_212617 ) ) ( not ( = ?auto_212613 ?auto_212618 ) ) ( not ( = ?auto_212614 ?auto_212615 ) ) ( not ( = ?auto_212614 ?auto_212616 ) ) ( not ( = ?auto_212614 ?auto_212617 ) ) ( not ( = ?auto_212614 ?auto_212618 ) ) ( not ( = ?auto_212615 ?auto_212616 ) ) ( not ( = ?auto_212615 ?auto_212617 ) ) ( not ( = ?auto_212615 ?auto_212618 ) ) ( not ( = ?auto_212616 ?auto_212617 ) ) ( not ( = ?auto_212616 ?auto_212618 ) ) ( not ( = ?auto_212617 ?auto_212618 ) ) ( ON ?auto_212616 ?auto_212617 ) ( CLEAR ?auto_212614 ) ( ON ?auto_212615 ?auto_212616 ) ( CLEAR ?auto_212615 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_212613 ?auto_212614 ?auto_212615 )
      ( MAKE-5PILE ?auto_212613 ?auto_212614 ?auto_212615 ?auto_212616 ?auto_212617 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_212624 - BLOCK
      ?auto_212625 - BLOCK
      ?auto_212626 - BLOCK
      ?auto_212627 - BLOCK
      ?auto_212628 - BLOCK
    )
    :vars
    (
      ?auto_212629 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_212628 ?auto_212629 ) ( ON-TABLE ?auto_212624 ) ( ON ?auto_212625 ?auto_212624 ) ( not ( = ?auto_212624 ?auto_212625 ) ) ( not ( = ?auto_212624 ?auto_212626 ) ) ( not ( = ?auto_212624 ?auto_212627 ) ) ( not ( = ?auto_212624 ?auto_212628 ) ) ( not ( = ?auto_212624 ?auto_212629 ) ) ( not ( = ?auto_212625 ?auto_212626 ) ) ( not ( = ?auto_212625 ?auto_212627 ) ) ( not ( = ?auto_212625 ?auto_212628 ) ) ( not ( = ?auto_212625 ?auto_212629 ) ) ( not ( = ?auto_212626 ?auto_212627 ) ) ( not ( = ?auto_212626 ?auto_212628 ) ) ( not ( = ?auto_212626 ?auto_212629 ) ) ( not ( = ?auto_212627 ?auto_212628 ) ) ( not ( = ?auto_212627 ?auto_212629 ) ) ( not ( = ?auto_212628 ?auto_212629 ) ) ( ON ?auto_212627 ?auto_212628 ) ( CLEAR ?auto_212625 ) ( ON ?auto_212626 ?auto_212627 ) ( CLEAR ?auto_212626 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_212624 ?auto_212625 ?auto_212626 )
      ( MAKE-5PILE ?auto_212624 ?auto_212625 ?auto_212626 ?auto_212627 ?auto_212628 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_212635 - BLOCK
      ?auto_212636 - BLOCK
      ?auto_212637 - BLOCK
      ?auto_212638 - BLOCK
      ?auto_212639 - BLOCK
    )
    :vars
    (
      ?auto_212640 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_212639 ?auto_212640 ) ( ON-TABLE ?auto_212635 ) ( not ( = ?auto_212635 ?auto_212636 ) ) ( not ( = ?auto_212635 ?auto_212637 ) ) ( not ( = ?auto_212635 ?auto_212638 ) ) ( not ( = ?auto_212635 ?auto_212639 ) ) ( not ( = ?auto_212635 ?auto_212640 ) ) ( not ( = ?auto_212636 ?auto_212637 ) ) ( not ( = ?auto_212636 ?auto_212638 ) ) ( not ( = ?auto_212636 ?auto_212639 ) ) ( not ( = ?auto_212636 ?auto_212640 ) ) ( not ( = ?auto_212637 ?auto_212638 ) ) ( not ( = ?auto_212637 ?auto_212639 ) ) ( not ( = ?auto_212637 ?auto_212640 ) ) ( not ( = ?auto_212638 ?auto_212639 ) ) ( not ( = ?auto_212638 ?auto_212640 ) ) ( not ( = ?auto_212639 ?auto_212640 ) ) ( ON ?auto_212638 ?auto_212639 ) ( ON ?auto_212637 ?auto_212638 ) ( CLEAR ?auto_212635 ) ( ON ?auto_212636 ?auto_212637 ) ( CLEAR ?auto_212636 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_212635 ?auto_212636 )
      ( MAKE-5PILE ?auto_212635 ?auto_212636 ?auto_212637 ?auto_212638 ?auto_212639 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_212646 - BLOCK
      ?auto_212647 - BLOCK
      ?auto_212648 - BLOCK
      ?auto_212649 - BLOCK
      ?auto_212650 - BLOCK
    )
    :vars
    (
      ?auto_212651 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_212650 ?auto_212651 ) ( ON-TABLE ?auto_212646 ) ( not ( = ?auto_212646 ?auto_212647 ) ) ( not ( = ?auto_212646 ?auto_212648 ) ) ( not ( = ?auto_212646 ?auto_212649 ) ) ( not ( = ?auto_212646 ?auto_212650 ) ) ( not ( = ?auto_212646 ?auto_212651 ) ) ( not ( = ?auto_212647 ?auto_212648 ) ) ( not ( = ?auto_212647 ?auto_212649 ) ) ( not ( = ?auto_212647 ?auto_212650 ) ) ( not ( = ?auto_212647 ?auto_212651 ) ) ( not ( = ?auto_212648 ?auto_212649 ) ) ( not ( = ?auto_212648 ?auto_212650 ) ) ( not ( = ?auto_212648 ?auto_212651 ) ) ( not ( = ?auto_212649 ?auto_212650 ) ) ( not ( = ?auto_212649 ?auto_212651 ) ) ( not ( = ?auto_212650 ?auto_212651 ) ) ( ON ?auto_212649 ?auto_212650 ) ( ON ?auto_212648 ?auto_212649 ) ( CLEAR ?auto_212646 ) ( ON ?auto_212647 ?auto_212648 ) ( CLEAR ?auto_212647 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_212646 ?auto_212647 )
      ( MAKE-5PILE ?auto_212646 ?auto_212647 ?auto_212648 ?auto_212649 ?auto_212650 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_212657 - BLOCK
      ?auto_212658 - BLOCK
      ?auto_212659 - BLOCK
      ?auto_212660 - BLOCK
      ?auto_212661 - BLOCK
    )
    :vars
    (
      ?auto_212662 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_212661 ?auto_212662 ) ( not ( = ?auto_212657 ?auto_212658 ) ) ( not ( = ?auto_212657 ?auto_212659 ) ) ( not ( = ?auto_212657 ?auto_212660 ) ) ( not ( = ?auto_212657 ?auto_212661 ) ) ( not ( = ?auto_212657 ?auto_212662 ) ) ( not ( = ?auto_212658 ?auto_212659 ) ) ( not ( = ?auto_212658 ?auto_212660 ) ) ( not ( = ?auto_212658 ?auto_212661 ) ) ( not ( = ?auto_212658 ?auto_212662 ) ) ( not ( = ?auto_212659 ?auto_212660 ) ) ( not ( = ?auto_212659 ?auto_212661 ) ) ( not ( = ?auto_212659 ?auto_212662 ) ) ( not ( = ?auto_212660 ?auto_212661 ) ) ( not ( = ?auto_212660 ?auto_212662 ) ) ( not ( = ?auto_212661 ?auto_212662 ) ) ( ON ?auto_212660 ?auto_212661 ) ( ON ?auto_212659 ?auto_212660 ) ( ON ?auto_212658 ?auto_212659 ) ( ON ?auto_212657 ?auto_212658 ) ( CLEAR ?auto_212657 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_212657 )
      ( MAKE-5PILE ?auto_212657 ?auto_212658 ?auto_212659 ?auto_212660 ?auto_212661 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_212668 - BLOCK
      ?auto_212669 - BLOCK
      ?auto_212670 - BLOCK
      ?auto_212671 - BLOCK
      ?auto_212672 - BLOCK
    )
    :vars
    (
      ?auto_212673 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_212672 ?auto_212673 ) ( not ( = ?auto_212668 ?auto_212669 ) ) ( not ( = ?auto_212668 ?auto_212670 ) ) ( not ( = ?auto_212668 ?auto_212671 ) ) ( not ( = ?auto_212668 ?auto_212672 ) ) ( not ( = ?auto_212668 ?auto_212673 ) ) ( not ( = ?auto_212669 ?auto_212670 ) ) ( not ( = ?auto_212669 ?auto_212671 ) ) ( not ( = ?auto_212669 ?auto_212672 ) ) ( not ( = ?auto_212669 ?auto_212673 ) ) ( not ( = ?auto_212670 ?auto_212671 ) ) ( not ( = ?auto_212670 ?auto_212672 ) ) ( not ( = ?auto_212670 ?auto_212673 ) ) ( not ( = ?auto_212671 ?auto_212672 ) ) ( not ( = ?auto_212671 ?auto_212673 ) ) ( not ( = ?auto_212672 ?auto_212673 ) ) ( ON ?auto_212671 ?auto_212672 ) ( ON ?auto_212670 ?auto_212671 ) ( ON ?auto_212669 ?auto_212670 ) ( ON ?auto_212668 ?auto_212669 ) ( CLEAR ?auto_212668 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_212668 )
      ( MAKE-5PILE ?auto_212668 ?auto_212669 ?auto_212670 ?auto_212671 ?auto_212672 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_212680 - BLOCK
      ?auto_212681 - BLOCK
      ?auto_212682 - BLOCK
      ?auto_212683 - BLOCK
      ?auto_212684 - BLOCK
      ?auto_212685 - BLOCK
    )
    :vars
    (
      ?auto_212686 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_212684 ) ( ON ?auto_212685 ?auto_212686 ) ( CLEAR ?auto_212685 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_212680 ) ( ON ?auto_212681 ?auto_212680 ) ( ON ?auto_212682 ?auto_212681 ) ( ON ?auto_212683 ?auto_212682 ) ( ON ?auto_212684 ?auto_212683 ) ( not ( = ?auto_212680 ?auto_212681 ) ) ( not ( = ?auto_212680 ?auto_212682 ) ) ( not ( = ?auto_212680 ?auto_212683 ) ) ( not ( = ?auto_212680 ?auto_212684 ) ) ( not ( = ?auto_212680 ?auto_212685 ) ) ( not ( = ?auto_212680 ?auto_212686 ) ) ( not ( = ?auto_212681 ?auto_212682 ) ) ( not ( = ?auto_212681 ?auto_212683 ) ) ( not ( = ?auto_212681 ?auto_212684 ) ) ( not ( = ?auto_212681 ?auto_212685 ) ) ( not ( = ?auto_212681 ?auto_212686 ) ) ( not ( = ?auto_212682 ?auto_212683 ) ) ( not ( = ?auto_212682 ?auto_212684 ) ) ( not ( = ?auto_212682 ?auto_212685 ) ) ( not ( = ?auto_212682 ?auto_212686 ) ) ( not ( = ?auto_212683 ?auto_212684 ) ) ( not ( = ?auto_212683 ?auto_212685 ) ) ( not ( = ?auto_212683 ?auto_212686 ) ) ( not ( = ?auto_212684 ?auto_212685 ) ) ( not ( = ?auto_212684 ?auto_212686 ) ) ( not ( = ?auto_212685 ?auto_212686 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_212685 ?auto_212686 )
      ( !STACK ?auto_212685 ?auto_212684 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_212693 - BLOCK
      ?auto_212694 - BLOCK
      ?auto_212695 - BLOCK
      ?auto_212696 - BLOCK
      ?auto_212697 - BLOCK
      ?auto_212698 - BLOCK
    )
    :vars
    (
      ?auto_212699 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_212697 ) ( ON ?auto_212698 ?auto_212699 ) ( CLEAR ?auto_212698 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_212693 ) ( ON ?auto_212694 ?auto_212693 ) ( ON ?auto_212695 ?auto_212694 ) ( ON ?auto_212696 ?auto_212695 ) ( ON ?auto_212697 ?auto_212696 ) ( not ( = ?auto_212693 ?auto_212694 ) ) ( not ( = ?auto_212693 ?auto_212695 ) ) ( not ( = ?auto_212693 ?auto_212696 ) ) ( not ( = ?auto_212693 ?auto_212697 ) ) ( not ( = ?auto_212693 ?auto_212698 ) ) ( not ( = ?auto_212693 ?auto_212699 ) ) ( not ( = ?auto_212694 ?auto_212695 ) ) ( not ( = ?auto_212694 ?auto_212696 ) ) ( not ( = ?auto_212694 ?auto_212697 ) ) ( not ( = ?auto_212694 ?auto_212698 ) ) ( not ( = ?auto_212694 ?auto_212699 ) ) ( not ( = ?auto_212695 ?auto_212696 ) ) ( not ( = ?auto_212695 ?auto_212697 ) ) ( not ( = ?auto_212695 ?auto_212698 ) ) ( not ( = ?auto_212695 ?auto_212699 ) ) ( not ( = ?auto_212696 ?auto_212697 ) ) ( not ( = ?auto_212696 ?auto_212698 ) ) ( not ( = ?auto_212696 ?auto_212699 ) ) ( not ( = ?auto_212697 ?auto_212698 ) ) ( not ( = ?auto_212697 ?auto_212699 ) ) ( not ( = ?auto_212698 ?auto_212699 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_212698 ?auto_212699 )
      ( !STACK ?auto_212698 ?auto_212697 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_212706 - BLOCK
      ?auto_212707 - BLOCK
      ?auto_212708 - BLOCK
      ?auto_212709 - BLOCK
      ?auto_212710 - BLOCK
      ?auto_212711 - BLOCK
    )
    :vars
    (
      ?auto_212712 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_212711 ?auto_212712 ) ( ON-TABLE ?auto_212706 ) ( ON ?auto_212707 ?auto_212706 ) ( ON ?auto_212708 ?auto_212707 ) ( ON ?auto_212709 ?auto_212708 ) ( not ( = ?auto_212706 ?auto_212707 ) ) ( not ( = ?auto_212706 ?auto_212708 ) ) ( not ( = ?auto_212706 ?auto_212709 ) ) ( not ( = ?auto_212706 ?auto_212710 ) ) ( not ( = ?auto_212706 ?auto_212711 ) ) ( not ( = ?auto_212706 ?auto_212712 ) ) ( not ( = ?auto_212707 ?auto_212708 ) ) ( not ( = ?auto_212707 ?auto_212709 ) ) ( not ( = ?auto_212707 ?auto_212710 ) ) ( not ( = ?auto_212707 ?auto_212711 ) ) ( not ( = ?auto_212707 ?auto_212712 ) ) ( not ( = ?auto_212708 ?auto_212709 ) ) ( not ( = ?auto_212708 ?auto_212710 ) ) ( not ( = ?auto_212708 ?auto_212711 ) ) ( not ( = ?auto_212708 ?auto_212712 ) ) ( not ( = ?auto_212709 ?auto_212710 ) ) ( not ( = ?auto_212709 ?auto_212711 ) ) ( not ( = ?auto_212709 ?auto_212712 ) ) ( not ( = ?auto_212710 ?auto_212711 ) ) ( not ( = ?auto_212710 ?auto_212712 ) ) ( not ( = ?auto_212711 ?auto_212712 ) ) ( CLEAR ?auto_212709 ) ( ON ?auto_212710 ?auto_212711 ) ( CLEAR ?auto_212710 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_212706 ?auto_212707 ?auto_212708 ?auto_212709 ?auto_212710 )
      ( MAKE-6PILE ?auto_212706 ?auto_212707 ?auto_212708 ?auto_212709 ?auto_212710 ?auto_212711 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_212719 - BLOCK
      ?auto_212720 - BLOCK
      ?auto_212721 - BLOCK
      ?auto_212722 - BLOCK
      ?auto_212723 - BLOCK
      ?auto_212724 - BLOCK
    )
    :vars
    (
      ?auto_212725 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_212724 ?auto_212725 ) ( ON-TABLE ?auto_212719 ) ( ON ?auto_212720 ?auto_212719 ) ( ON ?auto_212721 ?auto_212720 ) ( ON ?auto_212722 ?auto_212721 ) ( not ( = ?auto_212719 ?auto_212720 ) ) ( not ( = ?auto_212719 ?auto_212721 ) ) ( not ( = ?auto_212719 ?auto_212722 ) ) ( not ( = ?auto_212719 ?auto_212723 ) ) ( not ( = ?auto_212719 ?auto_212724 ) ) ( not ( = ?auto_212719 ?auto_212725 ) ) ( not ( = ?auto_212720 ?auto_212721 ) ) ( not ( = ?auto_212720 ?auto_212722 ) ) ( not ( = ?auto_212720 ?auto_212723 ) ) ( not ( = ?auto_212720 ?auto_212724 ) ) ( not ( = ?auto_212720 ?auto_212725 ) ) ( not ( = ?auto_212721 ?auto_212722 ) ) ( not ( = ?auto_212721 ?auto_212723 ) ) ( not ( = ?auto_212721 ?auto_212724 ) ) ( not ( = ?auto_212721 ?auto_212725 ) ) ( not ( = ?auto_212722 ?auto_212723 ) ) ( not ( = ?auto_212722 ?auto_212724 ) ) ( not ( = ?auto_212722 ?auto_212725 ) ) ( not ( = ?auto_212723 ?auto_212724 ) ) ( not ( = ?auto_212723 ?auto_212725 ) ) ( not ( = ?auto_212724 ?auto_212725 ) ) ( CLEAR ?auto_212722 ) ( ON ?auto_212723 ?auto_212724 ) ( CLEAR ?auto_212723 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_212719 ?auto_212720 ?auto_212721 ?auto_212722 ?auto_212723 )
      ( MAKE-6PILE ?auto_212719 ?auto_212720 ?auto_212721 ?auto_212722 ?auto_212723 ?auto_212724 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_212732 - BLOCK
      ?auto_212733 - BLOCK
      ?auto_212734 - BLOCK
      ?auto_212735 - BLOCK
      ?auto_212736 - BLOCK
      ?auto_212737 - BLOCK
    )
    :vars
    (
      ?auto_212738 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_212737 ?auto_212738 ) ( ON-TABLE ?auto_212732 ) ( ON ?auto_212733 ?auto_212732 ) ( ON ?auto_212734 ?auto_212733 ) ( not ( = ?auto_212732 ?auto_212733 ) ) ( not ( = ?auto_212732 ?auto_212734 ) ) ( not ( = ?auto_212732 ?auto_212735 ) ) ( not ( = ?auto_212732 ?auto_212736 ) ) ( not ( = ?auto_212732 ?auto_212737 ) ) ( not ( = ?auto_212732 ?auto_212738 ) ) ( not ( = ?auto_212733 ?auto_212734 ) ) ( not ( = ?auto_212733 ?auto_212735 ) ) ( not ( = ?auto_212733 ?auto_212736 ) ) ( not ( = ?auto_212733 ?auto_212737 ) ) ( not ( = ?auto_212733 ?auto_212738 ) ) ( not ( = ?auto_212734 ?auto_212735 ) ) ( not ( = ?auto_212734 ?auto_212736 ) ) ( not ( = ?auto_212734 ?auto_212737 ) ) ( not ( = ?auto_212734 ?auto_212738 ) ) ( not ( = ?auto_212735 ?auto_212736 ) ) ( not ( = ?auto_212735 ?auto_212737 ) ) ( not ( = ?auto_212735 ?auto_212738 ) ) ( not ( = ?auto_212736 ?auto_212737 ) ) ( not ( = ?auto_212736 ?auto_212738 ) ) ( not ( = ?auto_212737 ?auto_212738 ) ) ( ON ?auto_212736 ?auto_212737 ) ( CLEAR ?auto_212734 ) ( ON ?auto_212735 ?auto_212736 ) ( CLEAR ?auto_212735 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_212732 ?auto_212733 ?auto_212734 ?auto_212735 )
      ( MAKE-6PILE ?auto_212732 ?auto_212733 ?auto_212734 ?auto_212735 ?auto_212736 ?auto_212737 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_212745 - BLOCK
      ?auto_212746 - BLOCK
      ?auto_212747 - BLOCK
      ?auto_212748 - BLOCK
      ?auto_212749 - BLOCK
      ?auto_212750 - BLOCK
    )
    :vars
    (
      ?auto_212751 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_212750 ?auto_212751 ) ( ON-TABLE ?auto_212745 ) ( ON ?auto_212746 ?auto_212745 ) ( ON ?auto_212747 ?auto_212746 ) ( not ( = ?auto_212745 ?auto_212746 ) ) ( not ( = ?auto_212745 ?auto_212747 ) ) ( not ( = ?auto_212745 ?auto_212748 ) ) ( not ( = ?auto_212745 ?auto_212749 ) ) ( not ( = ?auto_212745 ?auto_212750 ) ) ( not ( = ?auto_212745 ?auto_212751 ) ) ( not ( = ?auto_212746 ?auto_212747 ) ) ( not ( = ?auto_212746 ?auto_212748 ) ) ( not ( = ?auto_212746 ?auto_212749 ) ) ( not ( = ?auto_212746 ?auto_212750 ) ) ( not ( = ?auto_212746 ?auto_212751 ) ) ( not ( = ?auto_212747 ?auto_212748 ) ) ( not ( = ?auto_212747 ?auto_212749 ) ) ( not ( = ?auto_212747 ?auto_212750 ) ) ( not ( = ?auto_212747 ?auto_212751 ) ) ( not ( = ?auto_212748 ?auto_212749 ) ) ( not ( = ?auto_212748 ?auto_212750 ) ) ( not ( = ?auto_212748 ?auto_212751 ) ) ( not ( = ?auto_212749 ?auto_212750 ) ) ( not ( = ?auto_212749 ?auto_212751 ) ) ( not ( = ?auto_212750 ?auto_212751 ) ) ( ON ?auto_212749 ?auto_212750 ) ( CLEAR ?auto_212747 ) ( ON ?auto_212748 ?auto_212749 ) ( CLEAR ?auto_212748 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_212745 ?auto_212746 ?auto_212747 ?auto_212748 )
      ( MAKE-6PILE ?auto_212745 ?auto_212746 ?auto_212747 ?auto_212748 ?auto_212749 ?auto_212750 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_212758 - BLOCK
      ?auto_212759 - BLOCK
      ?auto_212760 - BLOCK
      ?auto_212761 - BLOCK
      ?auto_212762 - BLOCK
      ?auto_212763 - BLOCK
    )
    :vars
    (
      ?auto_212764 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_212763 ?auto_212764 ) ( ON-TABLE ?auto_212758 ) ( ON ?auto_212759 ?auto_212758 ) ( not ( = ?auto_212758 ?auto_212759 ) ) ( not ( = ?auto_212758 ?auto_212760 ) ) ( not ( = ?auto_212758 ?auto_212761 ) ) ( not ( = ?auto_212758 ?auto_212762 ) ) ( not ( = ?auto_212758 ?auto_212763 ) ) ( not ( = ?auto_212758 ?auto_212764 ) ) ( not ( = ?auto_212759 ?auto_212760 ) ) ( not ( = ?auto_212759 ?auto_212761 ) ) ( not ( = ?auto_212759 ?auto_212762 ) ) ( not ( = ?auto_212759 ?auto_212763 ) ) ( not ( = ?auto_212759 ?auto_212764 ) ) ( not ( = ?auto_212760 ?auto_212761 ) ) ( not ( = ?auto_212760 ?auto_212762 ) ) ( not ( = ?auto_212760 ?auto_212763 ) ) ( not ( = ?auto_212760 ?auto_212764 ) ) ( not ( = ?auto_212761 ?auto_212762 ) ) ( not ( = ?auto_212761 ?auto_212763 ) ) ( not ( = ?auto_212761 ?auto_212764 ) ) ( not ( = ?auto_212762 ?auto_212763 ) ) ( not ( = ?auto_212762 ?auto_212764 ) ) ( not ( = ?auto_212763 ?auto_212764 ) ) ( ON ?auto_212762 ?auto_212763 ) ( ON ?auto_212761 ?auto_212762 ) ( CLEAR ?auto_212759 ) ( ON ?auto_212760 ?auto_212761 ) ( CLEAR ?auto_212760 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_212758 ?auto_212759 ?auto_212760 )
      ( MAKE-6PILE ?auto_212758 ?auto_212759 ?auto_212760 ?auto_212761 ?auto_212762 ?auto_212763 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_212771 - BLOCK
      ?auto_212772 - BLOCK
      ?auto_212773 - BLOCK
      ?auto_212774 - BLOCK
      ?auto_212775 - BLOCK
      ?auto_212776 - BLOCK
    )
    :vars
    (
      ?auto_212777 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_212776 ?auto_212777 ) ( ON-TABLE ?auto_212771 ) ( ON ?auto_212772 ?auto_212771 ) ( not ( = ?auto_212771 ?auto_212772 ) ) ( not ( = ?auto_212771 ?auto_212773 ) ) ( not ( = ?auto_212771 ?auto_212774 ) ) ( not ( = ?auto_212771 ?auto_212775 ) ) ( not ( = ?auto_212771 ?auto_212776 ) ) ( not ( = ?auto_212771 ?auto_212777 ) ) ( not ( = ?auto_212772 ?auto_212773 ) ) ( not ( = ?auto_212772 ?auto_212774 ) ) ( not ( = ?auto_212772 ?auto_212775 ) ) ( not ( = ?auto_212772 ?auto_212776 ) ) ( not ( = ?auto_212772 ?auto_212777 ) ) ( not ( = ?auto_212773 ?auto_212774 ) ) ( not ( = ?auto_212773 ?auto_212775 ) ) ( not ( = ?auto_212773 ?auto_212776 ) ) ( not ( = ?auto_212773 ?auto_212777 ) ) ( not ( = ?auto_212774 ?auto_212775 ) ) ( not ( = ?auto_212774 ?auto_212776 ) ) ( not ( = ?auto_212774 ?auto_212777 ) ) ( not ( = ?auto_212775 ?auto_212776 ) ) ( not ( = ?auto_212775 ?auto_212777 ) ) ( not ( = ?auto_212776 ?auto_212777 ) ) ( ON ?auto_212775 ?auto_212776 ) ( ON ?auto_212774 ?auto_212775 ) ( CLEAR ?auto_212772 ) ( ON ?auto_212773 ?auto_212774 ) ( CLEAR ?auto_212773 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_212771 ?auto_212772 ?auto_212773 )
      ( MAKE-6PILE ?auto_212771 ?auto_212772 ?auto_212773 ?auto_212774 ?auto_212775 ?auto_212776 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_212784 - BLOCK
      ?auto_212785 - BLOCK
      ?auto_212786 - BLOCK
      ?auto_212787 - BLOCK
      ?auto_212788 - BLOCK
      ?auto_212789 - BLOCK
    )
    :vars
    (
      ?auto_212790 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_212789 ?auto_212790 ) ( ON-TABLE ?auto_212784 ) ( not ( = ?auto_212784 ?auto_212785 ) ) ( not ( = ?auto_212784 ?auto_212786 ) ) ( not ( = ?auto_212784 ?auto_212787 ) ) ( not ( = ?auto_212784 ?auto_212788 ) ) ( not ( = ?auto_212784 ?auto_212789 ) ) ( not ( = ?auto_212784 ?auto_212790 ) ) ( not ( = ?auto_212785 ?auto_212786 ) ) ( not ( = ?auto_212785 ?auto_212787 ) ) ( not ( = ?auto_212785 ?auto_212788 ) ) ( not ( = ?auto_212785 ?auto_212789 ) ) ( not ( = ?auto_212785 ?auto_212790 ) ) ( not ( = ?auto_212786 ?auto_212787 ) ) ( not ( = ?auto_212786 ?auto_212788 ) ) ( not ( = ?auto_212786 ?auto_212789 ) ) ( not ( = ?auto_212786 ?auto_212790 ) ) ( not ( = ?auto_212787 ?auto_212788 ) ) ( not ( = ?auto_212787 ?auto_212789 ) ) ( not ( = ?auto_212787 ?auto_212790 ) ) ( not ( = ?auto_212788 ?auto_212789 ) ) ( not ( = ?auto_212788 ?auto_212790 ) ) ( not ( = ?auto_212789 ?auto_212790 ) ) ( ON ?auto_212788 ?auto_212789 ) ( ON ?auto_212787 ?auto_212788 ) ( ON ?auto_212786 ?auto_212787 ) ( CLEAR ?auto_212784 ) ( ON ?auto_212785 ?auto_212786 ) ( CLEAR ?auto_212785 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_212784 ?auto_212785 )
      ( MAKE-6PILE ?auto_212784 ?auto_212785 ?auto_212786 ?auto_212787 ?auto_212788 ?auto_212789 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_212797 - BLOCK
      ?auto_212798 - BLOCK
      ?auto_212799 - BLOCK
      ?auto_212800 - BLOCK
      ?auto_212801 - BLOCK
      ?auto_212802 - BLOCK
    )
    :vars
    (
      ?auto_212803 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_212802 ?auto_212803 ) ( ON-TABLE ?auto_212797 ) ( not ( = ?auto_212797 ?auto_212798 ) ) ( not ( = ?auto_212797 ?auto_212799 ) ) ( not ( = ?auto_212797 ?auto_212800 ) ) ( not ( = ?auto_212797 ?auto_212801 ) ) ( not ( = ?auto_212797 ?auto_212802 ) ) ( not ( = ?auto_212797 ?auto_212803 ) ) ( not ( = ?auto_212798 ?auto_212799 ) ) ( not ( = ?auto_212798 ?auto_212800 ) ) ( not ( = ?auto_212798 ?auto_212801 ) ) ( not ( = ?auto_212798 ?auto_212802 ) ) ( not ( = ?auto_212798 ?auto_212803 ) ) ( not ( = ?auto_212799 ?auto_212800 ) ) ( not ( = ?auto_212799 ?auto_212801 ) ) ( not ( = ?auto_212799 ?auto_212802 ) ) ( not ( = ?auto_212799 ?auto_212803 ) ) ( not ( = ?auto_212800 ?auto_212801 ) ) ( not ( = ?auto_212800 ?auto_212802 ) ) ( not ( = ?auto_212800 ?auto_212803 ) ) ( not ( = ?auto_212801 ?auto_212802 ) ) ( not ( = ?auto_212801 ?auto_212803 ) ) ( not ( = ?auto_212802 ?auto_212803 ) ) ( ON ?auto_212801 ?auto_212802 ) ( ON ?auto_212800 ?auto_212801 ) ( ON ?auto_212799 ?auto_212800 ) ( CLEAR ?auto_212797 ) ( ON ?auto_212798 ?auto_212799 ) ( CLEAR ?auto_212798 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_212797 ?auto_212798 )
      ( MAKE-6PILE ?auto_212797 ?auto_212798 ?auto_212799 ?auto_212800 ?auto_212801 ?auto_212802 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_212810 - BLOCK
      ?auto_212811 - BLOCK
      ?auto_212812 - BLOCK
      ?auto_212813 - BLOCK
      ?auto_212814 - BLOCK
      ?auto_212815 - BLOCK
    )
    :vars
    (
      ?auto_212816 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_212815 ?auto_212816 ) ( not ( = ?auto_212810 ?auto_212811 ) ) ( not ( = ?auto_212810 ?auto_212812 ) ) ( not ( = ?auto_212810 ?auto_212813 ) ) ( not ( = ?auto_212810 ?auto_212814 ) ) ( not ( = ?auto_212810 ?auto_212815 ) ) ( not ( = ?auto_212810 ?auto_212816 ) ) ( not ( = ?auto_212811 ?auto_212812 ) ) ( not ( = ?auto_212811 ?auto_212813 ) ) ( not ( = ?auto_212811 ?auto_212814 ) ) ( not ( = ?auto_212811 ?auto_212815 ) ) ( not ( = ?auto_212811 ?auto_212816 ) ) ( not ( = ?auto_212812 ?auto_212813 ) ) ( not ( = ?auto_212812 ?auto_212814 ) ) ( not ( = ?auto_212812 ?auto_212815 ) ) ( not ( = ?auto_212812 ?auto_212816 ) ) ( not ( = ?auto_212813 ?auto_212814 ) ) ( not ( = ?auto_212813 ?auto_212815 ) ) ( not ( = ?auto_212813 ?auto_212816 ) ) ( not ( = ?auto_212814 ?auto_212815 ) ) ( not ( = ?auto_212814 ?auto_212816 ) ) ( not ( = ?auto_212815 ?auto_212816 ) ) ( ON ?auto_212814 ?auto_212815 ) ( ON ?auto_212813 ?auto_212814 ) ( ON ?auto_212812 ?auto_212813 ) ( ON ?auto_212811 ?auto_212812 ) ( ON ?auto_212810 ?auto_212811 ) ( CLEAR ?auto_212810 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_212810 )
      ( MAKE-6PILE ?auto_212810 ?auto_212811 ?auto_212812 ?auto_212813 ?auto_212814 ?auto_212815 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_212823 - BLOCK
      ?auto_212824 - BLOCK
      ?auto_212825 - BLOCK
      ?auto_212826 - BLOCK
      ?auto_212827 - BLOCK
      ?auto_212828 - BLOCK
    )
    :vars
    (
      ?auto_212829 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_212828 ?auto_212829 ) ( not ( = ?auto_212823 ?auto_212824 ) ) ( not ( = ?auto_212823 ?auto_212825 ) ) ( not ( = ?auto_212823 ?auto_212826 ) ) ( not ( = ?auto_212823 ?auto_212827 ) ) ( not ( = ?auto_212823 ?auto_212828 ) ) ( not ( = ?auto_212823 ?auto_212829 ) ) ( not ( = ?auto_212824 ?auto_212825 ) ) ( not ( = ?auto_212824 ?auto_212826 ) ) ( not ( = ?auto_212824 ?auto_212827 ) ) ( not ( = ?auto_212824 ?auto_212828 ) ) ( not ( = ?auto_212824 ?auto_212829 ) ) ( not ( = ?auto_212825 ?auto_212826 ) ) ( not ( = ?auto_212825 ?auto_212827 ) ) ( not ( = ?auto_212825 ?auto_212828 ) ) ( not ( = ?auto_212825 ?auto_212829 ) ) ( not ( = ?auto_212826 ?auto_212827 ) ) ( not ( = ?auto_212826 ?auto_212828 ) ) ( not ( = ?auto_212826 ?auto_212829 ) ) ( not ( = ?auto_212827 ?auto_212828 ) ) ( not ( = ?auto_212827 ?auto_212829 ) ) ( not ( = ?auto_212828 ?auto_212829 ) ) ( ON ?auto_212827 ?auto_212828 ) ( ON ?auto_212826 ?auto_212827 ) ( ON ?auto_212825 ?auto_212826 ) ( ON ?auto_212824 ?auto_212825 ) ( ON ?auto_212823 ?auto_212824 ) ( CLEAR ?auto_212823 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_212823 )
      ( MAKE-6PILE ?auto_212823 ?auto_212824 ?auto_212825 ?auto_212826 ?auto_212827 ?auto_212828 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_212837 - BLOCK
      ?auto_212838 - BLOCK
      ?auto_212839 - BLOCK
      ?auto_212840 - BLOCK
      ?auto_212841 - BLOCK
      ?auto_212842 - BLOCK
      ?auto_212843 - BLOCK
    )
    :vars
    (
      ?auto_212844 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_212842 ) ( ON ?auto_212843 ?auto_212844 ) ( CLEAR ?auto_212843 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_212837 ) ( ON ?auto_212838 ?auto_212837 ) ( ON ?auto_212839 ?auto_212838 ) ( ON ?auto_212840 ?auto_212839 ) ( ON ?auto_212841 ?auto_212840 ) ( ON ?auto_212842 ?auto_212841 ) ( not ( = ?auto_212837 ?auto_212838 ) ) ( not ( = ?auto_212837 ?auto_212839 ) ) ( not ( = ?auto_212837 ?auto_212840 ) ) ( not ( = ?auto_212837 ?auto_212841 ) ) ( not ( = ?auto_212837 ?auto_212842 ) ) ( not ( = ?auto_212837 ?auto_212843 ) ) ( not ( = ?auto_212837 ?auto_212844 ) ) ( not ( = ?auto_212838 ?auto_212839 ) ) ( not ( = ?auto_212838 ?auto_212840 ) ) ( not ( = ?auto_212838 ?auto_212841 ) ) ( not ( = ?auto_212838 ?auto_212842 ) ) ( not ( = ?auto_212838 ?auto_212843 ) ) ( not ( = ?auto_212838 ?auto_212844 ) ) ( not ( = ?auto_212839 ?auto_212840 ) ) ( not ( = ?auto_212839 ?auto_212841 ) ) ( not ( = ?auto_212839 ?auto_212842 ) ) ( not ( = ?auto_212839 ?auto_212843 ) ) ( not ( = ?auto_212839 ?auto_212844 ) ) ( not ( = ?auto_212840 ?auto_212841 ) ) ( not ( = ?auto_212840 ?auto_212842 ) ) ( not ( = ?auto_212840 ?auto_212843 ) ) ( not ( = ?auto_212840 ?auto_212844 ) ) ( not ( = ?auto_212841 ?auto_212842 ) ) ( not ( = ?auto_212841 ?auto_212843 ) ) ( not ( = ?auto_212841 ?auto_212844 ) ) ( not ( = ?auto_212842 ?auto_212843 ) ) ( not ( = ?auto_212842 ?auto_212844 ) ) ( not ( = ?auto_212843 ?auto_212844 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_212843 ?auto_212844 )
      ( !STACK ?auto_212843 ?auto_212842 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_212852 - BLOCK
      ?auto_212853 - BLOCK
      ?auto_212854 - BLOCK
      ?auto_212855 - BLOCK
      ?auto_212856 - BLOCK
      ?auto_212857 - BLOCK
      ?auto_212858 - BLOCK
    )
    :vars
    (
      ?auto_212859 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_212857 ) ( ON ?auto_212858 ?auto_212859 ) ( CLEAR ?auto_212858 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_212852 ) ( ON ?auto_212853 ?auto_212852 ) ( ON ?auto_212854 ?auto_212853 ) ( ON ?auto_212855 ?auto_212854 ) ( ON ?auto_212856 ?auto_212855 ) ( ON ?auto_212857 ?auto_212856 ) ( not ( = ?auto_212852 ?auto_212853 ) ) ( not ( = ?auto_212852 ?auto_212854 ) ) ( not ( = ?auto_212852 ?auto_212855 ) ) ( not ( = ?auto_212852 ?auto_212856 ) ) ( not ( = ?auto_212852 ?auto_212857 ) ) ( not ( = ?auto_212852 ?auto_212858 ) ) ( not ( = ?auto_212852 ?auto_212859 ) ) ( not ( = ?auto_212853 ?auto_212854 ) ) ( not ( = ?auto_212853 ?auto_212855 ) ) ( not ( = ?auto_212853 ?auto_212856 ) ) ( not ( = ?auto_212853 ?auto_212857 ) ) ( not ( = ?auto_212853 ?auto_212858 ) ) ( not ( = ?auto_212853 ?auto_212859 ) ) ( not ( = ?auto_212854 ?auto_212855 ) ) ( not ( = ?auto_212854 ?auto_212856 ) ) ( not ( = ?auto_212854 ?auto_212857 ) ) ( not ( = ?auto_212854 ?auto_212858 ) ) ( not ( = ?auto_212854 ?auto_212859 ) ) ( not ( = ?auto_212855 ?auto_212856 ) ) ( not ( = ?auto_212855 ?auto_212857 ) ) ( not ( = ?auto_212855 ?auto_212858 ) ) ( not ( = ?auto_212855 ?auto_212859 ) ) ( not ( = ?auto_212856 ?auto_212857 ) ) ( not ( = ?auto_212856 ?auto_212858 ) ) ( not ( = ?auto_212856 ?auto_212859 ) ) ( not ( = ?auto_212857 ?auto_212858 ) ) ( not ( = ?auto_212857 ?auto_212859 ) ) ( not ( = ?auto_212858 ?auto_212859 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_212858 ?auto_212859 )
      ( !STACK ?auto_212858 ?auto_212857 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_212867 - BLOCK
      ?auto_212868 - BLOCK
      ?auto_212869 - BLOCK
      ?auto_212870 - BLOCK
      ?auto_212871 - BLOCK
      ?auto_212872 - BLOCK
      ?auto_212873 - BLOCK
    )
    :vars
    (
      ?auto_212874 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_212873 ?auto_212874 ) ( ON-TABLE ?auto_212867 ) ( ON ?auto_212868 ?auto_212867 ) ( ON ?auto_212869 ?auto_212868 ) ( ON ?auto_212870 ?auto_212869 ) ( ON ?auto_212871 ?auto_212870 ) ( not ( = ?auto_212867 ?auto_212868 ) ) ( not ( = ?auto_212867 ?auto_212869 ) ) ( not ( = ?auto_212867 ?auto_212870 ) ) ( not ( = ?auto_212867 ?auto_212871 ) ) ( not ( = ?auto_212867 ?auto_212872 ) ) ( not ( = ?auto_212867 ?auto_212873 ) ) ( not ( = ?auto_212867 ?auto_212874 ) ) ( not ( = ?auto_212868 ?auto_212869 ) ) ( not ( = ?auto_212868 ?auto_212870 ) ) ( not ( = ?auto_212868 ?auto_212871 ) ) ( not ( = ?auto_212868 ?auto_212872 ) ) ( not ( = ?auto_212868 ?auto_212873 ) ) ( not ( = ?auto_212868 ?auto_212874 ) ) ( not ( = ?auto_212869 ?auto_212870 ) ) ( not ( = ?auto_212869 ?auto_212871 ) ) ( not ( = ?auto_212869 ?auto_212872 ) ) ( not ( = ?auto_212869 ?auto_212873 ) ) ( not ( = ?auto_212869 ?auto_212874 ) ) ( not ( = ?auto_212870 ?auto_212871 ) ) ( not ( = ?auto_212870 ?auto_212872 ) ) ( not ( = ?auto_212870 ?auto_212873 ) ) ( not ( = ?auto_212870 ?auto_212874 ) ) ( not ( = ?auto_212871 ?auto_212872 ) ) ( not ( = ?auto_212871 ?auto_212873 ) ) ( not ( = ?auto_212871 ?auto_212874 ) ) ( not ( = ?auto_212872 ?auto_212873 ) ) ( not ( = ?auto_212872 ?auto_212874 ) ) ( not ( = ?auto_212873 ?auto_212874 ) ) ( CLEAR ?auto_212871 ) ( ON ?auto_212872 ?auto_212873 ) ( CLEAR ?auto_212872 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_212867 ?auto_212868 ?auto_212869 ?auto_212870 ?auto_212871 ?auto_212872 )
      ( MAKE-7PILE ?auto_212867 ?auto_212868 ?auto_212869 ?auto_212870 ?auto_212871 ?auto_212872 ?auto_212873 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_212882 - BLOCK
      ?auto_212883 - BLOCK
      ?auto_212884 - BLOCK
      ?auto_212885 - BLOCK
      ?auto_212886 - BLOCK
      ?auto_212887 - BLOCK
      ?auto_212888 - BLOCK
    )
    :vars
    (
      ?auto_212889 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_212888 ?auto_212889 ) ( ON-TABLE ?auto_212882 ) ( ON ?auto_212883 ?auto_212882 ) ( ON ?auto_212884 ?auto_212883 ) ( ON ?auto_212885 ?auto_212884 ) ( ON ?auto_212886 ?auto_212885 ) ( not ( = ?auto_212882 ?auto_212883 ) ) ( not ( = ?auto_212882 ?auto_212884 ) ) ( not ( = ?auto_212882 ?auto_212885 ) ) ( not ( = ?auto_212882 ?auto_212886 ) ) ( not ( = ?auto_212882 ?auto_212887 ) ) ( not ( = ?auto_212882 ?auto_212888 ) ) ( not ( = ?auto_212882 ?auto_212889 ) ) ( not ( = ?auto_212883 ?auto_212884 ) ) ( not ( = ?auto_212883 ?auto_212885 ) ) ( not ( = ?auto_212883 ?auto_212886 ) ) ( not ( = ?auto_212883 ?auto_212887 ) ) ( not ( = ?auto_212883 ?auto_212888 ) ) ( not ( = ?auto_212883 ?auto_212889 ) ) ( not ( = ?auto_212884 ?auto_212885 ) ) ( not ( = ?auto_212884 ?auto_212886 ) ) ( not ( = ?auto_212884 ?auto_212887 ) ) ( not ( = ?auto_212884 ?auto_212888 ) ) ( not ( = ?auto_212884 ?auto_212889 ) ) ( not ( = ?auto_212885 ?auto_212886 ) ) ( not ( = ?auto_212885 ?auto_212887 ) ) ( not ( = ?auto_212885 ?auto_212888 ) ) ( not ( = ?auto_212885 ?auto_212889 ) ) ( not ( = ?auto_212886 ?auto_212887 ) ) ( not ( = ?auto_212886 ?auto_212888 ) ) ( not ( = ?auto_212886 ?auto_212889 ) ) ( not ( = ?auto_212887 ?auto_212888 ) ) ( not ( = ?auto_212887 ?auto_212889 ) ) ( not ( = ?auto_212888 ?auto_212889 ) ) ( CLEAR ?auto_212886 ) ( ON ?auto_212887 ?auto_212888 ) ( CLEAR ?auto_212887 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_212882 ?auto_212883 ?auto_212884 ?auto_212885 ?auto_212886 ?auto_212887 )
      ( MAKE-7PILE ?auto_212882 ?auto_212883 ?auto_212884 ?auto_212885 ?auto_212886 ?auto_212887 ?auto_212888 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_212897 - BLOCK
      ?auto_212898 - BLOCK
      ?auto_212899 - BLOCK
      ?auto_212900 - BLOCK
      ?auto_212901 - BLOCK
      ?auto_212902 - BLOCK
      ?auto_212903 - BLOCK
    )
    :vars
    (
      ?auto_212904 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_212903 ?auto_212904 ) ( ON-TABLE ?auto_212897 ) ( ON ?auto_212898 ?auto_212897 ) ( ON ?auto_212899 ?auto_212898 ) ( ON ?auto_212900 ?auto_212899 ) ( not ( = ?auto_212897 ?auto_212898 ) ) ( not ( = ?auto_212897 ?auto_212899 ) ) ( not ( = ?auto_212897 ?auto_212900 ) ) ( not ( = ?auto_212897 ?auto_212901 ) ) ( not ( = ?auto_212897 ?auto_212902 ) ) ( not ( = ?auto_212897 ?auto_212903 ) ) ( not ( = ?auto_212897 ?auto_212904 ) ) ( not ( = ?auto_212898 ?auto_212899 ) ) ( not ( = ?auto_212898 ?auto_212900 ) ) ( not ( = ?auto_212898 ?auto_212901 ) ) ( not ( = ?auto_212898 ?auto_212902 ) ) ( not ( = ?auto_212898 ?auto_212903 ) ) ( not ( = ?auto_212898 ?auto_212904 ) ) ( not ( = ?auto_212899 ?auto_212900 ) ) ( not ( = ?auto_212899 ?auto_212901 ) ) ( not ( = ?auto_212899 ?auto_212902 ) ) ( not ( = ?auto_212899 ?auto_212903 ) ) ( not ( = ?auto_212899 ?auto_212904 ) ) ( not ( = ?auto_212900 ?auto_212901 ) ) ( not ( = ?auto_212900 ?auto_212902 ) ) ( not ( = ?auto_212900 ?auto_212903 ) ) ( not ( = ?auto_212900 ?auto_212904 ) ) ( not ( = ?auto_212901 ?auto_212902 ) ) ( not ( = ?auto_212901 ?auto_212903 ) ) ( not ( = ?auto_212901 ?auto_212904 ) ) ( not ( = ?auto_212902 ?auto_212903 ) ) ( not ( = ?auto_212902 ?auto_212904 ) ) ( not ( = ?auto_212903 ?auto_212904 ) ) ( ON ?auto_212902 ?auto_212903 ) ( CLEAR ?auto_212900 ) ( ON ?auto_212901 ?auto_212902 ) ( CLEAR ?auto_212901 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_212897 ?auto_212898 ?auto_212899 ?auto_212900 ?auto_212901 )
      ( MAKE-7PILE ?auto_212897 ?auto_212898 ?auto_212899 ?auto_212900 ?auto_212901 ?auto_212902 ?auto_212903 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_212912 - BLOCK
      ?auto_212913 - BLOCK
      ?auto_212914 - BLOCK
      ?auto_212915 - BLOCK
      ?auto_212916 - BLOCK
      ?auto_212917 - BLOCK
      ?auto_212918 - BLOCK
    )
    :vars
    (
      ?auto_212919 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_212918 ?auto_212919 ) ( ON-TABLE ?auto_212912 ) ( ON ?auto_212913 ?auto_212912 ) ( ON ?auto_212914 ?auto_212913 ) ( ON ?auto_212915 ?auto_212914 ) ( not ( = ?auto_212912 ?auto_212913 ) ) ( not ( = ?auto_212912 ?auto_212914 ) ) ( not ( = ?auto_212912 ?auto_212915 ) ) ( not ( = ?auto_212912 ?auto_212916 ) ) ( not ( = ?auto_212912 ?auto_212917 ) ) ( not ( = ?auto_212912 ?auto_212918 ) ) ( not ( = ?auto_212912 ?auto_212919 ) ) ( not ( = ?auto_212913 ?auto_212914 ) ) ( not ( = ?auto_212913 ?auto_212915 ) ) ( not ( = ?auto_212913 ?auto_212916 ) ) ( not ( = ?auto_212913 ?auto_212917 ) ) ( not ( = ?auto_212913 ?auto_212918 ) ) ( not ( = ?auto_212913 ?auto_212919 ) ) ( not ( = ?auto_212914 ?auto_212915 ) ) ( not ( = ?auto_212914 ?auto_212916 ) ) ( not ( = ?auto_212914 ?auto_212917 ) ) ( not ( = ?auto_212914 ?auto_212918 ) ) ( not ( = ?auto_212914 ?auto_212919 ) ) ( not ( = ?auto_212915 ?auto_212916 ) ) ( not ( = ?auto_212915 ?auto_212917 ) ) ( not ( = ?auto_212915 ?auto_212918 ) ) ( not ( = ?auto_212915 ?auto_212919 ) ) ( not ( = ?auto_212916 ?auto_212917 ) ) ( not ( = ?auto_212916 ?auto_212918 ) ) ( not ( = ?auto_212916 ?auto_212919 ) ) ( not ( = ?auto_212917 ?auto_212918 ) ) ( not ( = ?auto_212917 ?auto_212919 ) ) ( not ( = ?auto_212918 ?auto_212919 ) ) ( ON ?auto_212917 ?auto_212918 ) ( CLEAR ?auto_212915 ) ( ON ?auto_212916 ?auto_212917 ) ( CLEAR ?auto_212916 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_212912 ?auto_212913 ?auto_212914 ?auto_212915 ?auto_212916 )
      ( MAKE-7PILE ?auto_212912 ?auto_212913 ?auto_212914 ?auto_212915 ?auto_212916 ?auto_212917 ?auto_212918 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_212927 - BLOCK
      ?auto_212928 - BLOCK
      ?auto_212929 - BLOCK
      ?auto_212930 - BLOCK
      ?auto_212931 - BLOCK
      ?auto_212932 - BLOCK
      ?auto_212933 - BLOCK
    )
    :vars
    (
      ?auto_212934 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_212933 ?auto_212934 ) ( ON-TABLE ?auto_212927 ) ( ON ?auto_212928 ?auto_212927 ) ( ON ?auto_212929 ?auto_212928 ) ( not ( = ?auto_212927 ?auto_212928 ) ) ( not ( = ?auto_212927 ?auto_212929 ) ) ( not ( = ?auto_212927 ?auto_212930 ) ) ( not ( = ?auto_212927 ?auto_212931 ) ) ( not ( = ?auto_212927 ?auto_212932 ) ) ( not ( = ?auto_212927 ?auto_212933 ) ) ( not ( = ?auto_212927 ?auto_212934 ) ) ( not ( = ?auto_212928 ?auto_212929 ) ) ( not ( = ?auto_212928 ?auto_212930 ) ) ( not ( = ?auto_212928 ?auto_212931 ) ) ( not ( = ?auto_212928 ?auto_212932 ) ) ( not ( = ?auto_212928 ?auto_212933 ) ) ( not ( = ?auto_212928 ?auto_212934 ) ) ( not ( = ?auto_212929 ?auto_212930 ) ) ( not ( = ?auto_212929 ?auto_212931 ) ) ( not ( = ?auto_212929 ?auto_212932 ) ) ( not ( = ?auto_212929 ?auto_212933 ) ) ( not ( = ?auto_212929 ?auto_212934 ) ) ( not ( = ?auto_212930 ?auto_212931 ) ) ( not ( = ?auto_212930 ?auto_212932 ) ) ( not ( = ?auto_212930 ?auto_212933 ) ) ( not ( = ?auto_212930 ?auto_212934 ) ) ( not ( = ?auto_212931 ?auto_212932 ) ) ( not ( = ?auto_212931 ?auto_212933 ) ) ( not ( = ?auto_212931 ?auto_212934 ) ) ( not ( = ?auto_212932 ?auto_212933 ) ) ( not ( = ?auto_212932 ?auto_212934 ) ) ( not ( = ?auto_212933 ?auto_212934 ) ) ( ON ?auto_212932 ?auto_212933 ) ( ON ?auto_212931 ?auto_212932 ) ( CLEAR ?auto_212929 ) ( ON ?auto_212930 ?auto_212931 ) ( CLEAR ?auto_212930 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_212927 ?auto_212928 ?auto_212929 ?auto_212930 )
      ( MAKE-7PILE ?auto_212927 ?auto_212928 ?auto_212929 ?auto_212930 ?auto_212931 ?auto_212932 ?auto_212933 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_212942 - BLOCK
      ?auto_212943 - BLOCK
      ?auto_212944 - BLOCK
      ?auto_212945 - BLOCK
      ?auto_212946 - BLOCK
      ?auto_212947 - BLOCK
      ?auto_212948 - BLOCK
    )
    :vars
    (
      ?auto_212949 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_212948 ?auto_212949 ) ( ON-TABLE ?auto_212942 ) ( ON ?auto_212943 ?auto_212942 ) ( ON ?auto_212944 ?auto_212943 ) ( not ( = ?auto_212942 ?auto_212943 ) ) ( not ( = ?auto_212942 ?auto_212944 ) ) ( not ( = ?auto_212942 ?auto_212945 ) ) ( not ( = ?auto_212942 ?auto_212946 ) ) ( not ( = ?auto_212942 ?auto_212947 ) ) ( not ( = ?auto_212942 ?auto_212948 ) ) ( not ( = ?auto_212942 ?auto_212949 ) ) ( not ( = ?auto_212943 ?auto_212944 ) ) ( not ( = ?auto_212943 ?auto_212945 ) ) ( not ( = ?auto_212943 ?auto_212946 ) ) ( not ( = ?auto_212943 ?auto_212947 ) ) ( not ( = ?auto_212943 ?auto_212948 ) ) ( not ( = ?auto_212943 ?auto_212949 ) ) ( not ( = ?auto_212944 ?auto_212945 ) ) ( not ( = ?auto_212944 ?auto_212946 ) ) ( not ( = ?auto_212944 ?auto_212947 ) ) ( not ( = ?auto_212944 ?auto_212948 ) ) ( not ( = ?auto_212944 ?auto_212949 ) ) ( not ( = ?auto_212945 ?auto_212946 ) ) ( not ( = ?auto_212945 ?auto_212947 ) ) ( not ( = ?auto_212945 ?auto_212948 ) ) ( not ( = ?auto_212945 ?auto_212949 ) ) ( not ( = ?auto_212946 ?auto_212947 ) ) ( not ( = ?auto_212946 ?auto_212948 ) ) ( not ( = ?auto_212946 ?auto_212949 ) ) ( not ( = ?auto_212947 ?auto_212948 ) ) ( not ( = ?auto_212947 ?auto_212949 ) ) ( not ( = ?auto_212948 ?auto_212949 ) ) ( ON ?auto_212947 ?auto_212948 ) ( ON ?auto_212946 ?auto_212947 ) ( CLEAR ?auto_212944 ) ( ON ?auto_212945 ?auto_212946 ) ( CLEAR ?auto_212945 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_212942 ?auto_212943 ?auto_212944 ?auto_212945 )
      ( MAKE-7PILE ?auto_212942 ?auto_212943 ?auto_212944 ?auto_212945 ?auto_212946 ?auto_212947 ?auto_212948 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_212957 - BLOCK
      ?auto_212958 - BLOCK
      ?auto_212959 - BLOCK
      ?auto_212960 - BLOCK
      ?auto_212961 - BLOCK
      ?auto_212962 - BLOCK
      ?auto_212963 - BLOCK
    )
    :vars
    (
      ?auto_212964 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_212963 ?auto_212964 ) ( ON-TABLE ?auto_212957 ) ( ON ?auto_212958 ?auto_212957 ) ( not ( = ?auto_212957 ?auto_212958 ) ) ( not ( = ?auto_212957 ?auto_212959 ) ) ( not ( = ?auto_212957 ?auto_212960 ) ) ( not ( = ?auto_212957 ?auto_212961 ) ) ( not ( = ?auto_212957 ?auto_212962 ) ) ( not ( = ?auto_212957 ?auto_212963 ) ) ( not ( = ?auto_212957 ?auto_212964 ) ) ( not ( = ?auto_212958 ?auto_212959 ) ) ( not ( = ?auto_212958 ?auto_212960 ) ) ( not ( = ?auto_212958 ?auto_212961 ) ) ( not ( = ?auto_212958 ?auto_212962 ) ) ( not ( = ?auto_212958 ?auto_212963 ) ) ( not ( = ?auto_212958 ?auto_212964 ) ) ( not ( = ?auto_212959 ?auto_212960 ) ) ( not ( = ?auto_212959 ?auto_212961 ) ) ( not ( = ?auto_212959 ?auto_212962 ) ) ( not ( = ?auto_212959 ?auto_212963 ) ) ( not ( = ?auto_212959 ?auto_212964 ) ) ( not ( = ?auto_212960 ?auto_212961 ) ) ( not ( = ?auto_212960 ?auto_212962 ) ) ( not ( = ?auto_212960 ?auto_212963 ) ) ( not ( = ?auto_212960 ?auto_212964 ) ) ( not ( = ?auto_212961 ?auto_212962 ) ) ( not ( = ?auto_212961 ?auto_212963 ) ) ( not ( = ?auto_212961 ?auto_212964 ) ) ( not ( = ?auto_212962 ?auto_212963 ) ) ( not ( = ?auto_212962 ?auto_212964 ) ) ( not ( = ?auto_212963 ?auto_212964 ) ) ( ON ?auto_212962 ?auto_212963 ) ( ON ?auto_212961 ?auto_212962 ) ( ON ?auto_212960 ?auto_212961 ) ( CLEAR ?auto_212958 ) ( ON ?auto_212959 ?auto_212960 ) ( CLEAR ?auto_212959 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_212957 ?auto_212958 ?auto_212959 )
      ( MAKE-7PILE ?auto_212957 ?auto_212958 ?auto_212959 ?auto_212960 ?auto_212961 ?auto_212962 ?auto_212963 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_212972 - BLOCK
      ?auto_212973 - BLOCK
      ?auto_212974 - BLOCK
      ?auto_212975 - BLOCK
      ?auto_212976 - BLOCK
      ?auto_212977 - BLOCK
      ?auto_212978 - BLOCK
    )
    :vars
    (
      ?auto_212979 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_212978 ?auto_212979 ) ( ON-TABLE ?auto_212972 ) ( ON ?auto_212973 ?auto_212972 ) ( not ( = ?auto_212972 ?auto_212973 ) ) ( not ( = ?auto_212972 ?auto_212974 ) ) ( not ( = ?auto_212972 ?auto_212975 ) ) ( not ( = ?auto_212972 ?auto_212976 ) ) ( not ( = ?auto_212972 ?auto_212977 ) ) ( not ( = ?auto_212972 ?auto_212978 ) ) ( not ( = ?auto_212972 ?auto_212979 ) ) ( not ( = ?auto_212973 ?auto_212974 ) ) ( not ( = ?auto_212973 ?auto_212975 ) ) ( not ( = ?auto_212973 ?auto_212976 ) ) ( not ( = ?auto_212973 ?auto_212977 ) ) ( not ( = ?auto_212973 ?auto_212978 ) ) ( not ( = ?auto_212973 ?auto_212979 ) ) ( not ( = ?auto_212974 ?auto_212975 ) ) ( not ( = ?auto_212974 ?auto_212976 ) ) ( not ( = ?auto_212974 ?auto_212977 ) ) ( not ( = ?auto_212974 ?auto_212978 ) ) ( not ( = ?auto_212974 ?auto_212979 ) ) ( not ( = ?auto_212975 ?auto_212976 ) ) ( not ( = ?auto_212975 ?auto_212977 ) ) ( not ( = ?auto_212975 ?auto_212978 ) ) ( not ( = ?auto_212975 ?auto_212979 ) ) ( not ( = ?auto_212976 ?auto_212977 ) ) ( not ( = ?auto_212976 ?auto_212978 ) ) ( not ( = ?auto_212976 ?auto_212979 ) ) ( not ( = ?auto_212977 ?auto_212978 ) ) ( not ( = ?auto_212977 ?auto_212979 ) ) ( not ( = ?auto_212978 ?auto_212979 ) ) ( ON ?auto_212977 ?auto_212978 ) ( ON ?auto_212976 ?auto_212977 ) ( ON ?auto_212975 ?auto_212976 ) ( CLEAR ?auto_212973 ) ( ON ?auto_212974 ?auto_212975 ) ( CLEAR ?auto_212974 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_212972 ?auto_212973 ?auto_212974 )
      ( MAKE-7PILE ?auto_212972 ?auto_212973 ?auto_212974 ?auto_212975 ?auto_212976 ?auto_212977 ?auto_212978 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_212987 - BLOCK
      ?auto_212988 - BLOCK
      ?auto_212989 - BLOCK
      ?auto_212990 - BLOCK
      ?auto_212991 - BLOCK
      ?auto_212992 - BLOCK
      ?auto_212993 - BLOCK
    )
    :vars
    (
      ?auto_212994 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_212993 ?auto_212994 ) ( ON-TABLE ?auto_212987 ) ( not ( = ?auto_212987 ?auto_212988 ) ) ( not ( = ?auto_212987 ?auto_212989 ) ) ( not ( = ?auto_212987 ?auto_212990 ) ) ( not ( = ?auto_212987 ?auto_212991 ) ) ( not ( = ?auto_212987 ?auto_212992 ) ) ( not ( = ?auto_212987 ?auto_212993 ) ) ( not ( = ?auto_212987 ?auto_212994 ) ) ( not ( = ?auto_212988 ?auto_212989 ) ) ( not ( = ?auto_212988 ?auto_212990 ) ) ( not ( = ?auto_212988 ?auto_212991 ) ) ( not ( = ?auto_212988 ?auto_212992 ) ) ( not ( = ?auto_212988 ?auto_212993 ) ) ( not ( = ?auto_212988 ?auto_212994 ) ) ( not ( = ?auto_212989 ?auto_212990 ) ) ( not ( = ?auto_212989 ?auto_212991 ) ) ( not ( = ?auto_212989 ?auto_212992 ) ) ( not ( = ?auto_212989 ?auto_212993 ) ) ( not ( = ?auto_212989 ?auto_212994 ) ) ( not ( = ?auto_212990 ?auto_212991 ) ) ( not ( = ?auto_212990 ?auto_212992 ) ) ( not ( = ?auto_212990 ?auto_212993 ) ) ( not ( = ?auto_212990 ?auto_212994 ) ) ( not ( = ?auto_212991 ?auto_212992 ) ) ( not ( = ?auto_212991 ?auto_212993 ) ) ( not ( = ?auto_212991 ?auto_212994 ) ) ( not ( = ?auto_212992 ?auto_212993 ) ) ( not ( = ?auto_212992 ?auto_212994 ) ) ( not ( = ?auto_212993 ?auto_212994 ) ) ( ON ?auto_212992 ?auto_212993 ) ( ON ?auto_212991 ?auto_212992 ) ( ON ?auto_212990 ?auto_212991 ) ( ON ?auto_212989 ?auto_212990 ) ( CLEAR ?auto_212987 ) ( ON ?auto_212988 ?auto_212989 ) ( CLEAR ?auto_212988 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_212987 ?auto_212988 )
      ( MAKE-7PILE ?auto_212987 ?auto_212988 ?auto_212989 ?auto_212990 ?auto_212991 ?auto_212992 ?auto_212993 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_213002 - BLOCK
      ?auto_213003 - BLOCK
      ?auto_213004 - BLOCK
      ?auto_213005 - BLOCK
      ?auto_213006 - BLOCK
      ?auto_213007 - BLOCK
      ?auto_213008 - BLOCK
    )
    :vars
    (
      ?auto_213009 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_213008 ?auto_213009 ) ( ON-TABLE ?auto_213002 ) ( not ( = ?auto_213002 ?auto_213003 ) ) ( not ( = ?auto_213002 ?auto_213004 ) ) ( not ( = ?auto_213002 ?auto_213005 ) ) ( not ( = ?auto_213002 ?auto_213006 ) ) ( not ( = ?auto_213002 ?auto_213007 ) ) ( not ( = ?auto_213002 ?auto_213008 ) ) ( not ( = ?auto_213002 ?auto_213009 ) ) ( not ( = ?auto_213003 ?auto_213004 ) ) ( not ( = ?auto_213003 ?auto_213005 ) ) ( not ( = ?auto_213003 ?auto_213006 ) ) ( not ( = ?auto_213003 ?auto_213007 ) ) ( not ( = ?auto_213003 ?auto_213008 ) ) ( not ( = ?auto_213003 ?auto_213009 ) ) ( not ( = ?auto_213004 ?auto_213005 ) ) ( not ( = ?auto_213004 ?auto_213006 ) ) ( not ( = ?auto_213004 ?auto_213007 ) ) ( not ( = ?auto_213004 ?auto_213008 ) ) ( not ( = ?auto_213004 ?auto_213009 ) ) ( not ( = ?auto_213005 ?auto_213006 ) ) ( not ( = ?auto_213005 ?auto_213007 ) ) ( not ( = ?auto_213005 ?auto_213008 ) ) ( not ( = ?auto_213005 ?auto_213009 ) ) ( not ( = ?auto_213006 ?auto_213007 ) ) ( not ( = ?auto_213006 ?auto_213008 ) ) ( not ( = ?auto_213006 ?auto_213009 ) ) ( not ( = ?auto_213007 ?auto_213008 ) ) ( not ( = ?auto_213007 ?auto_213009 ) ) ( not ( = ?auto_213008 ?auto_213009 ) ) ( ON ?auto_213007 ?auto_213008 ) ( ON ?auto_213006 ?auto_213007 ) ( ON ?auto_213005 ?auto_213006 ) ( ON ?auto_213004 ?auto_213005 ) ( CLEAR ?auto_213002 ) ( ON ?auto_213003 ?auto_213004 ) ( CLEAR ?auto_213003 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_213002 ?auto_213003 )
      ( MAKE-7PILE ?auto_213002 ?auto_213003 ?auto_213004 ?auto_213005 ?auto_213006 ?auto_213007 ?auto_213008 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_213017 - BLOCK
      ?auto_213018 - BLOCK
      ?auto_213019 - BLOCK
      ?auto_213020 - BLOCK
      ?auto_213021 - BLOCK
      ?auto_213022 - BLOCK
      ?auto_213023 - BLOCK
    )
    :vars
    (
      ?auto_213024 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_213023 ?auto_213024 ) ( not ( = ?auto_213017 ?auto_213018 ) ) ( not ( = ?auto_213017 ?auto_213019 ) ) ( not ( = ?auto_213017 ?auto_213020 ) ) ( not ( = ?auto_213017 ?auto_213021 ) ) ( not ( = ?auto_213017 ?auto_213022 ) ) ( not ( = ?auto_213017 ?auto_213023 ) ) ( not ( = ?auto_213017 ?auto_213024 ) ) ( not ( = ?auto_213018 ?auto_213019 ) ) ( not ( = ?auto_213018 ?auto_213020 ) ) ( not ( = ?auto_213018 ?auto_213021 ) ) ( not ( = ?auto_213018 ?auto_213022 ) ) ( not ( = ?auto_213018 ?auto_213023 ) ) ( not ( = ?auto_213018 ?auto_213024 ) ) ( not ( = ?auto_213019 ?auto_213020 ) ) ( not ( = ?auto_213019 ?auto_213021 ) ) ( not ( = ?auto_213019 ?auto_213022 ) ) ( not ( = ?auto_213019 ?auto_213023 ) ) ( not ( = ?auto_213019 ?auto_213024 ) ) ( not ( = ?auto_213020 ?auto_213021 ) ) ( not ( = ?auto_213020 ?auto_213022 ) ) ( not ( = ?auto_213020 ?auto_213023 ) ) ( not ( = ?auto_213020 ?auto_213024 ) ) ( not ( = ?auto_213021 ?auto_213022 ) ) ( not ( = ?auto_213021 ?auto_213023 ) ) ( not ( = ?auto_213021 ?auto_213024 ) ) ( not ( = ?auto_213022 ?auto_213023 ) ) ( not ( = ?auto_213022 ?auto_213024 ) ) ( not ( = ?auto_213023 ?auto_213024 ) ) ( ON ?auto_213022 ?auto_213023 ) ( ON ?auto_213021 ?auto_213022 ) ( ON ?auto_213020 ?auto_213021 ) ( ON ?auto_213019 ?auto_213020 ) ( ON ?auto_213018 ?auto_213019 ) ( ON ?auto_213017 ?auto_213018 ) ( CLEAR ?auto_213017 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_213017 )
      ( MAKE-7PILE ?auto_213017 ?auto_213018 ?auto_213019 ?auto_213020 ?auto_213021 ?auto_213022 ?auto_213023 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_213032 - BLOCK
      ?auto_213033 - BLOCK
      ?auto_213034 - BLOCK
      ?auto_213035 - BLOCK
      ?auto_213036 - BLOCK
      ?auto_213037 - BLOCK
      ?auto_213038 - BLOCK
    )
    :vars
    (
      ?auto_213039 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_213038 ?auto_213039 ) ( not ( = ?auto_213032 ?auto_213033 ) ) ( not ( = ?auto_213032 ?auto_213034 ) ) ( not ( = ?auto_213032 ?auto_213035 ) ) ( not ( = ?auto_213032 ?auto_213036 ) ) ( not ( = ?auto_213032 ?auto_213037 ) ) ( not ( = ?auto_213032 ?auto_213038 ) ) ( not ( = ?auto_213032 ?auto_213039 ) ) ( not ( = ?auto_213033 ?auto_213034 ) ) ( not ( = ?auto_213033 ?auto_213035 ) ) ( not ( = ?auto_213033 ?auto_213036 ) ) ( not ( = ?auto_213033 ?auto_213037 ) ) ( not ( = ?auto_213033 ?auto_213038 ) ) ( not ( = ?auto_213033 ?auto_213039 ) ) ( not ( = ?auto_213034 ?auto_213035 ) ) ( not ( = ?auto_213034 ?auto_213036 ) ) ( not ( = ?auto_213034 ?auto_213037 ) ) ( not ( = ?auto_213034 ?auto_213038 ) ) ( not ( = ?auto_213034 ?auto_213039 ) ) ( not ( = ?auto_213035 ?auto_213036 ) ) ( not ( = ?auto_213035 ?auto_213037 ) ) ( not ( = ?auto_213035 ?auto_213038 ) ) ( not ( = ?auto_213035 ?auto_213039 ) ) ( not ( = ?auto_213036 ?auto_213037 ) ) ( not ( = ?auto_213036 ?auto_213038 ) ) ( not ( = ?auto_213036 ?auto_213039 ) ) ( not ( = ?auto_213037 ?auto_213038 ) ) ( not ( = ?auto_213037 ?auto_213039 ) ) ( not ( = ?auto_213038 ?auto_213039 ) ) ( ON ?auto_213037 ?auto_213038 ) ( ON ?auto_213036 ?auto_213037 ) ( ON ?auto_213035 ?auto_213036 ) ( ON ?auto_213034 ?auto_213035 ) ( ON ?auto_213033 ?auto_213034 ) ( ON ?auto_213032 ?auto_213033 ) ( CLEAR ?auto_213032 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_213032 )
      ( MAKE-7PILE ?auto_213032 ?auto_213033 ?auto_213034 ?auto_213035 ?auto_213036 ?auto_213037 ?auto_213038 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_213048 - BLOCK
      ?auto_213049 - BLOCK
      ?auto_213050 - BLOCK
      ?auto_213051 - BLOCK
      ?auto_213052 - BLOCK
      ?auto_213053 - BLOCK
      ?auto_213054 - BLOCK
      ?auto_213055 - BLOCK
    )
    :vars
    (
      ?auto_213056 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_213054 ) ( ON ?auto_213055 ?auto_213056 ) ( CLEAR ?auto_213055 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_213048 ) ( ON ?auto_213049 ?auto_213048 ) ( ON ?auto_213050 ?auto_213049 ) ( ON ?auto_213051 ?auto_213050 ) ( ON ?auto_213052 ?auto_213051 ) ( ON ?auto_213053 ?auto_213052 ) ( ON ?auto_213054 ?auto_213053 ) ( not ( = ?auto_213048 ?auto_213049 ) ) ( not ( = ?auto_213048 ?auto_213050 ) ) ( not ( = ?auto_213048 ?auto_213051 ) ) ( not ( = ?auto_213048 ?auto_213052 ) ) ( not ( = ?auto_213048 ?auto_213053 ) ) ( not ( = ?auto_213048 ?auto_213054 ) ) ( not ( = ?auto_213048 ?auto_213055 ) ) ( not ( = ?auto_213048 ?auto_213056 ) ) ( not ( = ?auto_213049 ?auto_213050 ) ) ( not ( = ?auto_213049 ?auto_213051 ) ) ( not ( = ?auto_213049 ?auto_213052 ) ) ( not ( = ?auto_213049 ?auto_213053 ) ) ( not ( = ?auto_213049 ?auto_213054 ) ) ( not ( = ?auto_213049 ?auto_213055 ) ) ( not ( = ?auto_213049 ?auto_213056 ) ) ( not ( = ?auto_213050 ?auto_213051 ) ) ( not ( = ?auto_213050 ?auto_213052 ) ) ( not ( = ?auto_213050 ?auto_213053 ) ) ( not ( = ?auto_213050 ?auto_213054 ) ) ( not ( = ?auto_213050 ?auto_213055 ) ) ( not ( = ?auto_213050 ?auto_213056 ) ) ( not ( = ?auto_213051 ?auto_213052 ) ) ( not ( = ?auto_213051 ?auto_213053 ) ) ( not ( = ?auto_213051 ?auto_213054 ) ) ( not ( = ?auto_213051 ?auto_213055 ) ) ( not ( = ?auto_213051 ?auto_213056 ) ) ( not ( = ?auto_213052 ?auto_213053 ) ) ( not ( = ?auto_213052 ?auto_213054 ) ) ( not ( = ?auto_213052 ?auto_213055 ) ) ( not ( = ?auto_213052 ?auto_213056 ) ) ( not ( = ?auto_213053 ?auto_213054 ) ) ( not ( = ?auto_213053 ?auto_213055 ) ) ( not ( = ?auto_213053 ?auto_213056 ) ) ( not ( = ?auto_213054 ?auto_213055 ) ) ( not ( = ?auto_213054 ?auto_213056 ) ) ( not ( = ?auto_213055 ?auto_213056 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_213055 ?auto_213056 )
      ( !STACK ?auto_213055 ?auto_213054 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_213065 - BLOCK
      ?auto_213066 - BLOCK
      ?auto_213067 - BLOCK
      ?auto_213068 - BLOCK
      ?auto_213069 - BLOCK
      ?auto_213070 - BLOCK
      ?auto_213071 - BLOCK
      ?auto_213072 - BLOCK
    )
    :vars
    (
      ?auto_213073 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_213071 ) ( ON ?auto_213072 ?auto_213073 ) ( CLEAR ?auto_213072 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_213065 ) ( ON ?auto_213066 ?auto_213065 ) ( ON ?auto_213067 ?auto_213066 ) ( ON ?auto_213068 ?auto_213067 ) ( ON ?auto_213069 ?auto_213068 ) ( ON ?auto_213070 ?auto_213069 ) ( ON ?auto_213071 ?auto_213070 ) ( not ( = ?auto_213065 ?auto_213066 ) ) ( not ( = ?auto_213065 ?auto_213067 ) ) ( not ( = ?auto_213065 ?auto_213068 ) ) ( not ( = ?auto_213065 ?auto_213069 ) ) ( not ( = ?auto_213065 ?auto_213070 ) ) ( not ( = ?auto_213065 ?auto_213071 ) ) ( not ( = ?auto_213065 ?auto_213072 ) ) ( not ( = ?auto_213065 ?auto_213073 ) ) ( not ( = ?auto_213066 ?auto_213067 ) ) ( not ( = ?auto_213066 ?auto_213068 ) ) ( not ( = ?auto_213066 ?auto_213069 ) ) ( not ( = ?auto_213066 ?auto_213070 ) ) ( not ( = ?auto_213066 ?auto_213071 ) ) ( not ( = ?auto_213066 ?auto_213072 ) ) ( not ( = ?auto_213066 ?auto_213073 ) ) ( not ( = ?auto_213067 ?auto_213068 ) ) ( not ( = ?auto_213067 ?auto_213069 ) ) ( not ( = ?auto_213067 ?auto_213070 ) ) ( not ( = ?auto_213067 ?auto_213071 ) ) ( not ( = ?auto_213067 ?auto_213072 ) ) ( not ( = ?auto_213067 ?auto_213073 ) ) ( not ( = ?auto_213068 ?auto_213069 ) ) ( not ( = ?auto_213068 ?auto_213070 ) ) ( not ( = ?auto_213068 ?auto_213071 ) ) ( not ( = ?auto_213068 ?auto_213072 ) ) ( not ( = ?auto_213068 ?auto_213073 ) ) ( not ( = ?auto_213069 ?auto_213070 ) ) ( not ( = ?auto_213069 ?auto_213071 ) ) ( not ( = ?auto_213069 ?auto_213072 ) ) ( not ( = ?auto_213069 ?auto_213073 ) ) ( not ( = ?auto_213070 ?auto_213071 ) ) ( not ( = ?auto_213070 ?auto_213072 ) ) ( not ( = ?auto_213070 ?auto_213073 ) ) ( not ( = ?auto_213071 ?auto_213072 ) ) ( not ( = ?auto_213071 ?auto_213073 ) ) ( not ( = ?auto_213072 ?auto_213073 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_213072 ?auto_213073 )
      ( !STACK ?auto_213072 ?auto_213071 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_213082 - BLOCK
      ?auto_213083 - BLOCK
      ?auto_213084 - BLOCK
      ?auto_213085 - BLOCK
      ?auto_213086 - BLOCK
      ?auto_213087 - BLOCK
      ?auto_213088 - BLOCK
      ?auto_213089 - BLOCK
    )
    :vars
    (
      ?auto_213090 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_213089 ?auto_213090 ) ( ON-TABLE ?auto_213082 ) ( ON ?auto_213083 ?auto_213082 ) ( ON ?auto_213084 ?auto_213083 ) ( ON ?auto_213085 ?auto_213084 ) ( ON ?auto_213086 ?auto_213085 ) ( ON ?auto_213087 ?auto_213086 ) ( not ( = ?auto_213082 ?auto_213083 ) ) ( not ( = ?auto_213082 ?auto_213084 ) ) ( not ( = ?auto_213082 ?auto_213085 ) ) ( not ( = ?auto_213082 ?auto_213086 ) ) ( not ( = ?auto_213082 ?auto_213087 ) ) ( not ( = ?auto_213082 ?auto_213088 ) ) ( not ( = ?auto_213082 ?auto_213089 ) ) ( not ( = ?auto_213082 ?auto_213090 ) ) ( not ( = ?auto_213083 ?auto_213084 ) ) ( not ( = ?auto_213083 ?auto_213085 ) ) ( not ( = ?auto_213083 ?auto_213086 ) ) ( not ( = ?auto_213083 ?auto_213087 ) ) ( not ( = ?auto_213083 ?auto_213088 ) ) ( not ( = ?auto_213083 ?auto_213089 ) ) ( not ( = ?auto_213083 ?auto_213090 ) ) ( not ( = ?auto_213084 ?auto_213085 ) ) ( not ( = ?auto_213084 ?auto_213086 ) ) ( not ( = ?auto_213084 ?auto_213087 ) ) ( not ( = ?auto_213084 ?auto_213088 ) ) ( not ( = ?auto_213084 ?auto_213089 ) ) ( not ( = ?auto_213084 ?auto_213090 ) ) ( not ( = ?auto_213085 ?auto_213086 ) ) ( not ( = ?auto_213085 ?auto_213087 ) ) ( not ( = ?auto_213085 ?auto_213088 ) ) ( not ( = ?auto_213085 ?auto_213089 ) ) ( not ( = ?auto_213085 ?auto_213090 ) ) ( not ( = ?auto_213086 ?auto_213087 ) ) ( not ( = ?auto_213086 ?auto_213088 ) ) ( not ( = ?auto_213086 ?auto_213089 ) ) ( not ( = ?auto_213086 ?auto_213090 ) ) ( not ( = ?auto_213087 ?auto_213088 ) ) ( not ( = ?auto_213087 ?auto_213089 ) ) ( not ( = ?auto_213087 ?auto_213090 ) ) ( not ( = ?auto_213088 ?auto_213089 ) ) ( not ( = ?auto_213088 ?auto_213090 ) ) ( not ( = ?auto_213089 ?auto_213090 ) ) ( CLEAR ?auto_213087 ) ( ON ?auto_213088 ?auto_213089 ) ( CLEAR ?auto_213088 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_213082 ?auto_213083 ?auto_213084 ?auto_213085 ?auto_213086 ?auto_213087 ?auto_213088 )
      ( MAKE-8PILE ?auto_213082 ?auto_213083 ?auto_213084 ?auto_213085 ?auto_213086 ?auto_213087 ?auto_213088 ?auto_213089 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_213099 - BLOCK
      ?auto_213100 - BLOCK
      ?auto_213101 - BLOCK
      ?auto_213102 - BLOCK
      ?auto_213103 - BLOCK
      ?auto_213104 - BLOCK
      ?auto_213105 - BLOCK
      ?auto_213106 - BLOCK
    )
    :vars
    (
      ?auto_213107 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_213106 ?auto_213107 ) ( ON-TABLE ?auto_213099 ) ( ON ?auto_213100 ?auto_213099 ) ( ON ?auto_213101 ?auto_213100 ) ( ON ?auto_213102 ?auto_213101 ) ( ON ?auto_213103 ?auto_213102 ) ( ON ?auto_213104 ?auto_213103 ) ( not ( = ?auto_213099 ?auto_213100 ) ) ( not ( = ?auto_213099 ?auto_213101 ) ) ( not ( = ?auto_213099 ?auto_213102 ) ) ( not ( = ?auto_213099 ?auto_213103 ) ) ( not ( = ?auto_213099 ?auto_213104 ) ) ( not ( = ?auto_213099 ?auto_213105 ) ) ( not ( = ?auto_213099 ?auto_213106 ) ) ( not ( = ?auto_213099 ?auto_213107 ) ) ( not ( = ?auto_213100 ?auto_213101 ) ) ( not ( = ?auto_213100 ?auto_213102 ) ) ( not ( = ?auto_213100 ?auto_213103 ) ) ( not ( = ?auto_213100 ?auto_213104 ) ) ( not ( = ?auto_213100 ?auto_213105 ) ) ( not ( = ?auto_213100 ?auto_213106 ) ) ( not ( = ?auto_213100 ?auto_213107 ) ) ( not ( = ?auto_213101 ?auto_213102 ) ) ( not ( = ?auto_213101 ?auto_213103 ) ) ( not ( = ?auto_213101 ?auto_213104 ) ) ( not ( = ?auto_213101 ?auto_213105 ) ) ( not ( = ?auto_213101 ?auto_213106 ) ) ( not ( = ?auto_213101 ?auto_213107 ) ) ( not ( = ?auto_213102 ?auto_213103 ) ) ( not ( = ?auto_213102 ?auto_213104 ) ) ( not ( = ?auto_213102 ?auto_213105 ) ) ( not ( = ?auto_213102 ?auto_213106 ) ) ( not ( = ?auto_213102 ?auto_213107 ) ) ( not ( = ?auto_213103 ?auto_213104 ) ) ( not ( = ?auto_213103 ?auto_213105 ) ) ( not ( = ?auto_213103 ?auto_213106 ) ) ( not ( = ?auto_213103 ?auto_213107 ) ) ( not ( = ?auto_213104 ?auto_213105 ) ) ( not ( = ?auto_213104 ?auto_213106 ) ) ( not ( = ?auto_213104 ?auto_213107 ) ) ( not ( = ?auto_213105 ?auto_213106 ) ) ( not ( = ?auto_213105 ?auto_213107 ) ) ( not ( = ?auto_213106 ?auto_213107 ) ) ( CLEAR ?auto_213104 ) ( ON ?auto_213105 ?auto_213106 ) ( CLEAR ?auto_213105 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_213099 ?auto_213100 ?auto_213101 ?auto_213102 ?auto_213103 ?auto_213104 ?auto_213105 )
      ( MAKE-8PILE ?auto_213099 ?auto_213100 ?auto_213101 ?auto_213102 ?auto_213103 ?auto_213104 ?auto_213105 ?auto_213106 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_213116 - BLOCK
      ?auto_213117 - BLOCK
      ?auto_213118 - BLOCK
      ?auto_213119 - BLOCK
      ?auto_213120 - BLOCK
      ?auto_213121 - BLOCK
      ?auto_213122 - BLOCK
      ?auto_213123 - BLOCK
    )
    :vars
    (
      ?auto_213124 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_213123 ?auto_213124 ) ( ON-TABLE ?auto_213116 ) ( ON ?auto_213117 ?auto_213116 ) ( ON ?auto_213118 ?auto_213117 ) ( ON ?auto_213119 ?auto_213118 ) ( ON ?auto_213120 ?auto_213119 ) ( not ( = ?auto_213116 ?auto_213117 ) ) ( not ( = ?auto_213116 ?auto_213118 ) ) ( not ( = ?auto_213116 ?auto_213119 ) ) ( not ( = ?auto_213116 ?auto_213120 ) ) ( not ( = ?auto_213116 ?auto_213121 ) ) ( not ( = ?auto_213116 ?auto_213122 ) ) ( not ( = ?auto_213116 ?auto_213123 ) ) ( not ( = ?auto_213116 ?auto_213124 ) ) ( not ( = ?auto_213117 ?auto_213118 ) ) ( not ( = ?auto_213117 ?auto_213119 ) ) ( not ( = ?auto_213117 ?auto_213120 ) ) ( not ( = ?auto_213117 ?auto_213121 ) ) ( not ( = ?auto_213117 ?auto_213122 ) ) ( not ( = ?auto_213117 ?auto_213123 ) ) ( not ( = ?auto_213117 ?auto_213124 ) ) ( not ( = ?auto_213118 ?auto_213119 ) ) ( not ( = ?auto_213118 ?auto_213120 ) ) ( not ( = ?auto_213118 ?auto_213121 ) ) ( not ( = ?auto_213118 ?auto_213122 ) ) ( not ( = ?auto_213118 ?auto_213123 ) ) ( not ( = ?auto_213118 ?auto_213124 ) ) ( not ( = ?auto_213119 ?auto_213120 ) ) ( not ( = ?auto_213119 ?auto_213121 ) ) ( not ( = ?auto_213119 ?auto_213122 ) ) ( not ( = ?auto_213119 ?auto_213123 ) ) ( not ( = ?auto_213119 ?auto_213124 ) ) ( not ( = ?auto_213120 ?auto_213121 ) ) ( not ( = ?auto_213120 ?auto_213122 ) ) ( not ( = ?auto_213120 ?auto_213123 ) ) ( not ( = ?auto_213120 ?auto_213124 ) ) ( not ( = ?auto_213121 ?auto_213122 ) ) ( not ( = ?auto_213121 ?auto_213123 ) ) ( not ( = ?auto_213121 ?auto_213124 ) ) ( not ( = ?auto_213122 ?auto_213123 ) ) ( not ( = ?auto_213122 ?auto_213124 ) ) ( not ( = ?auto_213123 ?auto_213124 ) ) ( ON ?auto_213122 ?auto_213123 ) ( CLEAR ?auto_213120 ) ( ON ?auto_213121 ?auto_213122 ) ( CLEAR ?auto_213121 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_213116 ?auto_213117 ?auto_213118 ?auto_213119 ?auto_213120 ?auto_213121 )
      ( MAKE-8PILE ?auto_213116 ?auto_213117 ?auto_213118 ?auto_213119 ?auto_213120 ?auto_213121 ?auto_213122 ?auto_213123 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_213133 - BLOCK
      ?auto_213134 - BLOCK
      ?auto_213135 - BLOCK
      ?auto_213136 - BLOCK
      ?auto_213137 - BLOCK
      ?auto_213138 - BLOCK
      ?auto_213139 - BLOCK
      ?auto_213140 - BLOCK
    )
    :vars
    (
      ?auto_213141 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_213140 ?auto_213141 ) ( ON-TABLE ?auto_213133 ) ( ON ?auto_213134 ?auto_213133 ) ( ON ?auto_213135 ?auto_213134 ) ( ON ?auto_213136 ?auto_213135 ) ( ON ?auto_213137 ?auto_213136 ) ( not ( = ?auto_213133 ?auto_213134 ) ) ( not ( = ?auto_213133 ?auto_213135 ) ) ( not ( = ?auto_213133 ?auto_213136 ) ) ( not ( = ?auto_213133 ?auto_213137 ) ) ( not ( = ?auto_213133 ?auto_213138 ) ) ( not ( = ?auto_213133 ?auto_213139 ) ) ( not ( = ?auto_213133 ?auto_213140 ) ) ( not ( = ?auto_213133 ?auto_213141 ) ) ( not ( = ?auto_213134 ?auto_213135 ) ) ( not ( = ?auto_213134 ?auto_213136 ) ) ( not ( = ?auto_213134 ?auto_213137 ) ) ( not ( = ?auto_213134 ?auto_213138 ) ) ( not ( = ?auto_213134 ?auto_213139 ) ) ( not ( = ?auto_213134 ?auto_213140 ) ) ( not ( = ?auto_213134 ?auto_213141 ) ) ( not ( = ?auto_213135 ?auto_213136 ) ) ( not ( = ?auto_213135 ?auto_213137 ) ) ( not ( = ?auto_213135 ?auto_213138 ) ) ( not ( = ?auto_213135 ?auto_213139 ) ) ( not ( = ?auto_213135 ?auto_213140 ) ) ( not ( = ?auto_213135 ?auto_213141 ) ) ( not ( = ?auto_213136 ?auto_213137 ) ) ( not ( = ?auto_213136 ?auto_213138 ) ) ( not ( = ?auto_213136 ?auto_213139 ) ) ( not ( = ?auto_213136 ?auto_213140 ) ) ( not ( = ?auto_213136 ?auto_213141 ) ) ( not ( = ?auto_213137 ?auto_213138 ) ) ( not ( = ?auto_213137 ?auto_213139 ) ) ( not ( = ?auto_213137 ?auto_213140 ) ) ( not ( = ?auto_213137 ?auto_213141 ) ) ( not ( = ?auto_213138 ?auto_213139 ) ) ( not ( = ?auto_213138 ?auto_213140 ) ) ( not ( = ?auto_213138 ?auto_213141 ) ) ( not ( = ?auto_213139 ?auto_213140 ) ) ( not ( = ?auto_213139 ?auto_213141 ) ) ( not ( = ?auto_213140 ?auto_213141 ) ) ( ON ?auto_213139 ?auto_213140 ) ( CLEAR ?auto_213137 ) ( ON ?auto_213138 ?auto_213139 ) ( CLEAR ?auto_213138 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_213133 ?auto_213134 ?auto_213135 ?auto_213136 ?auto_213137 ?auto_213138 )
      ( MAKE-8PILE ?auto_213133 ?auto_213134 ?auto_213135 ?auto_213136 ?auto_213137 ?auto_213138 ?auto_213139 ?auto_213140 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_213150 - BLOCK
      ?auto_213151 - BLOCK
      ?auto_213152 - BLOCK
      ?auto_213153 - BLOCK
      ?auto_213154 - BLOCK
      ?auto_213155 - BLOCK
      ?auto_213156 - BLOCK
      ?auto_213157 - BLOCK
    )
    :vars
    (
      ?auto_213158 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_213157 ?auto_213158 ) ( ON-TABLE ?auto_213150 ) ( ON ?auto_213151 ?auto_213150 ) ( ON ?auto_213152 ?auto_213151 ) ( ON ?auto_213153 ?auto_213152 ) ( not ( = ?auto_213150 ?auto_213151 ) ) ( not ( = ?auto_213150 ?auto_213152 ) ) ( not ( = ?auto_213150 ?auto_213153 ) ) ( not ( = ?auto_213150 ?auto_213154 ) ) ( not ( = ?auto_213150 ?auto_213155 ) ) ( not ( = ?auto_213150 ?auto_213156 ) ) ( not ( = ?auto_213150 ?auto_213157 ) ) ( not ( = ?auto_213150 ?auto_213158 ) ) ( not ( = ?auto_213151 ?auto_213152 ) ) ( not ( = ?auto_213151 ?auto_213153 ) ) ( not ( = ?auto_213151 ?auto_213154 ) ) ( not ( = ?auto_213151 ?auto_213155 ) ) ( not ( = ?auto_213151 ?auto_213156 ) ) ( not ( = ?auto_213151 ?auto_213157 ) ) ( not ( = ?auto_213151 ?auto_213158 ) ) ( not ( = ?auto_213152 ?auto_213153 ) ) ( not ( = ?auto_213152 ?auto_213154 ) ) ( not ( = ?auto_213152 ?auto_213155 ) ) ( not ( = ?auto_213152 ?auto_213156 ) ) ( not ( = ?auto_213152 ?auto_213157 ) ) ( not ( = ?auto_213152 ?auto_213158 ) ) ( not ( = ?auto_213153 ?auto_213154 ) ) ( not ( = ?auto_213153 ?auto_213155 ) ) ( not ( = ?auto_213153 ?auto_213156 ) ) ( not ( = ?auto_213153 ?auto_213157 ) ) ( not ( = ?auto_213153 ?auto_213158 ) ) ( not ( = ?auto_213154 ?auto_213155 ) ) ( not ( = ?auto_213154 ?auto_213156 ) ) ( not ( = ?auto_213154 ?auto_213157 ) ) ( not ( = ?auto_213154 ?auto_213158 ) ) ( not ( = ?auto_213155 ?auto_213156 ) ) ( not ( = ?auto_213155 ?auto_213157 ) ) ( not ( = ?auto_213155 ?auto_213158 ) ) ( not ( = ?auto_213156 ?auto_213157 ) ) ( not ( = ?auto_213156 ?auto_213158 ) ) ( not ( = ?auto_213157 ?auto_213158 ) ) ( ON ?auto_213156 ?auto_213157 ) ( ON ?auto_213155 ?auto_213156 ) ( CLEAR ?auto_213153 ) ( ON ?auto_213154 ?auto_213155 ) ( CLEAR ?auto_213154 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_213150 ?auto_213151 ?auto_213152 ?auto_213153 ?auto_213154 )
      ( MAKE-8PILE ?auto_213150 ?auto_213151 ?auto_213152 ?auto_213153 ?auto_213154 ?auto_213155 ?auto_213156 ?auto_213157 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_213167 - BLOCK
      ?auto_213168 - BLOCK
      ?auto_213169 - BLOCK
      ?auto_213170 - BLOCK
      ?auto_213171 - BLOCK
      ?auto_213172 - BLOCK
      ?auto_213173 - BLOCK
      ?auto_213174 - BLOCK
    )
    :vars
    (
      ?auto_213175 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_213174 ?auto_213175 ) ( ON-TABLE ?auto_213167 ) ( ON ?auto_213168 ?auto_213167 ) ( ON ?auto_213169 ?auto_213168 ) ( ON ?auto_213170 ?auto_213169 ) ( not ( = ?auto_213167 ?auto_213168 ) ) ( not ( = ?auto_213167 ?auto_213169 ) ) ( not ( = ?auto_213167 ?auto_213170 ) ) ( not ( = ?auto_213167 ?auto_213171 ) ) ( not ( = ?auto_213167 ?auto_213172 ) ) ( not ( = ?auto_213167 ?auto_213173 ) ) ( not ( = ?auto_213167 ?auto_213174 ) ) ( not ( = ?auto_213167 ?auto_213175 ) ) ( not ( = ?auto_213168 ?auto_213169 ) ) ( not ( = ?auto_213168 ?auto_213170 ) ) ( not ( = ?auto_213168 ?auto_213171 ) ) ( not ( = ?auto_213168 ?auto_213172 ) ) ( not ( = ?auto_213168 ?auto_213173 ) ) ( not ( = ?auto_213168 ?auto_213174 ) ) ( not ( = ?auto_213168 ?auto_213175 ) ) ( not ( = ?auto_213169 ?auto_213170 ) ) ( not ( = ?auto_213169 ?auto_213171 ) ) ( not ( = ?auto_213169 ?auto_213172 ) ) ( not ( = ?auto_213169 ?auto_213173 ) ) ( not ( = ?auto_213169 ?auto_213174 ) ) ( not ( = ?auto_213169 ?auto_213175 ) ) ( not ( = ?auto_213170 ?auto_213171 ) ) ( not ( = ?auto_213170 ?auto_213172 ) ) ( not ( = ?auto_213170 ?auto_213173 ) ) ( not ( = ?auto_213170 ?auto_213174 ) ) ( not ( = ?auto_213170 ?auto_213175 ) ) ( not ( = ?auto_213171 ?auto_213172 ) ) ( not ( = ?auto_213171 ?auto_213173 ) ) ( not ( = ?auto_213171 ?auto_213174 ) ) ( not ( = ?auto_213171 ?auto_213175 ) ) ( not ( = ?auto_213172 ?auto_213173 ) ) ( not ( = ?auto_213172 ?auto_213174 ) ) ( not ( = ?auto_213172 ?auto_213175 ) ) ( not ( = ?auto_213173 ?auto_213174 ) ) ( not ( = ?auto_213173 ?auto_213175 ) ) ( not ( = ?auto_213174 ?auto_213175 ) ) ( ON ?auto_213173 ?auto_213174 ) ( ON ?auto_213172 ?auto_213173 ) ( CLEAR ?auto_213170 ) ( ON ?auto_213171 ?auto_213172 ) ( CLEAR ?auto_213171 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_213167 ?auto_213168 ?auto_213169 ?auto_213170 ?auto_213171 )
      ( MAKE-8PILE ?auto_213167 ?auto_213168 ?auto_213169 ?auto_213170 ?auto_213171 ?auto_213172 ?auto_213173 ?auto_213174 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_213184 - BLOCK
      ?auto_213185 - BLOCK
      ?auto_213186 - BLOCK
      ?auto_213187 - BLOCK
      ?auto_213188 - BLOCK
      ?auto_213189 - BLOCK
      ?auto_213190 - BLOCK
      ?auto_213191 - BLOCK
    )
    :vars
    (
      ?auto_213192 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_213191 ?auto_213192 ) ( ON-TABLE ?auto_213184 ) ( ON ?auto_213185 ?auto_213184 ) ( ON ?auto_213186 ?auto_213185 ) ( not ( = ?auto_213184 ?auto_213185 ) ) ( not ( = ?auto_213184 ?auto_213186 ) ) ( not ( = ?auto_213184 ?auto_213187 ) ) ( not ( = ?auto_213184 ?auto_213188 ) ) ( not ( = ?auto_213184 ?auto_213189 ) ) ( not ( = ?auto_213184 ?auto_213190 ) ) ( not ( = ?auto_213184 ?auto_213191 ) ) ( not ( = ?auto_213184 ?auto_213192 ) ) ( not ( = ?auto_213185 ?auto_213186 ) ) ( not ( = ?auto_213185 ?auto_213187 ) ) ( not ( = ?auto_213185 ?auto_213188 ) ) ( not ( = ?auto_213185 ?auto_213189 ) ) ( not ( = ?auto_213185 ?auto_213190 ) ) ( not ( = ?auto_213185 ?auto_213191 ) ) ( not ( = ?auto_213185 ?auto_213192 ) ) ( not ( = ?auto_213186 ?auto_213187 ) ) ( not ( = ?auto_213186 ?auto_213188 ) ) ( not ( = ?auto_213186 ?auto_213189 ) ) ( not ( = ?auto_213186 ?auto_213190 ) ) ( not ( = ?auto_213186 ?auto_213191 ) ) ( not ( = ?auto_213186 ?auto_213192 ) ) ( not ( = ?auto_213187 ?auto_213188 ) ) ( not ( = ?auto_213187 ?auto_213189 ) ) ( not ( = ?auto_213187 ?auto_213190 ) ) ( not ( = ?auto_213187 ?auto_213191 ) ) ( not ( = ?auto_213187 ?auto_213192 ) ) ( not ( = ?auto_213188 ?auto_213189 ) ) ( not ( = ?auto_213188 ?auto_213190 ) ) ( not ( = ?auto_213188 ?auto_213191 ) ) ( not ( = ?auto_213188 ?auto_213192 ) ) ( not ( = ?auto_213189 ?auto_213190 ) ) ( not ( = ?auto_213189 ?auto_213191 ) ) ( not ( = ?auto_213189 ?auto_213192 ) ) ( not ( = ?auto_213190 ?auto_213191 ) ) ( not ( = ?auto_213190 ?auto_213192 ) ) ( not ( = ?auto_213191 ?auto_213192 ) ) ( ON ?auto_213190 ?auto_213191 ) ( ON ?auto_213189 ?auto_213190 ) ( ON ?auto_213188 ?auto_213189 ) ( CLEAR ?auto_213186 ) ( ON ?auto_213187 ?auto_213188 ) ( CLEAR ?auto_213187 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_213184 ?auto_213185 ?auto_213186 ?auto_213187 )
      ( MAKE-8PILE ?auto_213184 ?auto_213185 ?auto_213186 ?auto_213187 ?auto_213188 ?auto_213189 ?auto_213190 ?auto_213191 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_213201 - BLOCK
      ?auto_213202 - BLOCK
      ?auto_213203 - BLOCK
      ?auto_213204 - BLOCK
      ?auto_213205 - BLOCK
      ?auto_213206 - BLOCK
      ?auto_213207 - BLOCK
      ?auto_213208 - BLOCK
    )
    :vars
    (
      ?auto_213209 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_213208 ?auto_213209 ) ( ON-TABLE ?auto_213201 ) ( ON ?auto_213202 ?auto_213201 ) ( ON ?auto_213203 ?auto_213202 ) ( not ( = ?auto_213201 ?auto_213202 ) ) ( not ( = ?auto_213201 ?auto_213203 ) ) ( not ( = ?auto_213201 ?auto_213204 ) ) ( not ( = ?auto_213201 ?auto_213205 ) ) ( not ( = ?auto_213201 ?auto_213206 ) ) ( not ( = ?auto_213201 ?auto_213207 ) ) ( not ( = ?auto_213201 ?auto_213208 ) ) ( not ( = ?auto_213201 ?auto_213209 ) ) ( not ( = ?auto_213202 ?auto_213203 ) ) ( not ( = ?auto_213202 ?auto_213204 ) ) ( not ( = ?auto_213202 ?auto_213205 ) ) ( not ( = ?auto_213202 ?auto_213206 ) ) ( not ( = ?auto_213202 ?auto_213207 ) ) ( not ( = ?auto_213202 ?auto_213208 ) ) ( not ( = ?auto_213202 ?auto_213209 ) ) ( not ( = ?auto_213203 ?auto_213204 ) ) ( not ( = ?auto_213203 ?auto_213205 ) ) ( not ( = ?auto_213203 ?auto_213206 ) ) ( not ( = ?auto_213203 ?auto_213207 ) ) ( not ( = ?auto_213203 ?auto_213208 ) ) ( not ( = ?auto_213203 ?auto_213209 ) ) ( not ( = ?auto_213204 ?auto_213205 ) ) ( not ( = ?auto_213204 ?auto_213206 ) ) ( not ( = ?auto_213204 ?auto_213207 ) ) ( not ( = ?auto_213204 ?auto_213208 ) ) ( not ( = ?auto_213204 ?auto_213209 ) ) ( not ( = ?auto_213205 ?auto_213206 ) ) ( not ( = ?auto_213205 ?auto_213207 ) ) ( not ( = ?auto_213205 ?auto_213208 ) ) ( not ( = ?auto_213205 ?auto_213209 ) ) ( not ( = ?auto_213206 ?auto_213207 ) ) ( not ( = ?auto_213206 ?auto_213208 ) ) ( not ( = ?auto_213206 ?auto_213209 ) ) ( not ( = ?auto_213207 ?auto_213208 ) ) ( not ( = ?auto_213207 ?auto_213209 ) ) ( not ( = ?auto_213208 ?auto_213209 ) ) ( ON ?auto_213207 ?auto_213208 ) ( ON ?auto_213206 ?auto_213207 ) ( ON ?auto_213205 ?auto_213206 ) ( CLEAR ?auto_213203 ) ( ON ?auto_213204 ?auto_213205 ) ( CLEAR ?auto_213204 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_213201 ?auto_213202 ?auto_213203 ?auto_213204 )
      ( MAKE-8PILE ?auto_213201 ?auto_213202 ?auto_213203 ?auto_213204 ?auto_213205 ?auto_213206 ?auto_213207 ?auto_213208 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_213218 - BLOCK
      ?auto_213219 - BLOCK
      ?auto_213220 - BLOCK
      ?auto_213221 - BLOCK
      ?auto_213222 - BLOCK
      ?auto_213223 - BLOCK
      ?auto_213224 - BLOCK
      ?auto_213225 - BLOCK
    )
    :vars
    (
      ?auto_213226 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_213225 ?auto_213226 ) ( ON-TABLE ?auto_213218 ) ( ON ?auto_213219 ?auto_213218 ) ( not ( = ?auto_213218 ?auto_213219 ) ) ( not ( = ?auto_213218 ?auto_213220 ) ) ( not ( = ?auto_213218 ?auto_213221 ) ) ( not ( = ?auto_213218 ?auto_213222 ) ) ( not ( = ?auto_213218 ?auto_213223 ) ) ( not ( = ?auto_213218 ?auto_213224 ) ) ( not ( = ?auto_213218 ?auto_213225 ) ) ( not ( = ?auto_213218 ?auto_213226 ) ) ( not ( = ?auto_213219 ?auto_213220 ) ) ( not ( = ?auto_213219 ?auto_213221 ) ) ( not ( = ?auto_213219 ?auto_213222 ) ) ( not ( = ?auto_213219 ?auto_213223 ) ) ( not ( = ?auto_213219 ?auto_213224 ) ) ( not ( = ?auto_213219 ?auto_213225 ) ) ( not ( = ?auto_213219 ?auto_213226 ) ) ( not ( = ?auto_213220 ?auto_213221 ) ) ( not ( = ?auto_213220 ?auto_213222 ) ) ( not ( = ?auto_213220 ?auto_213223 ) ) ( not ( = ?auto_213220 ?auto_213224 ) ) ( not ( = ?auto_213220 ?auto_213225 ) ) ( not ( = ?auto_213220 ?auto_213226 ) ) ( not ( = ?auto_213221 ?auto_213222 ) ) ( not ( = ?auto_213221 ?auto_213223 ) ) ( not ( = ?auto_213221 ?auto_213224 ) ) ( not ( = ?auto_213221 ?auto_213225 ) ) ( not ( = ?auto_213221 ?auto_213226 ) ) ( not ( = ?auto_213222 ?auto_213223 ) ) ( not ( = ?auto_213222 ?auto_213224 ) ) ( not ( = ?auto_213222 ?auto_213225 ) ) ( not ( = ?auto_213222 ?auto_213226 ) ) ( not ( = ?auto_213223 ?auto_213224 ) ) ( not ( = ?auto_213223 ?auto_213225 ) ) ( not ( = ?auto_213223 ?auto_213226 ) ) ( not ( = ?auto_213224 ?auto_213225 ) ) ( not ( = ?auto_213224 ?auto_213226 ) ) ( not ( = ?auto_213225 ?auto_213226 ) ) ( ON ?auto_213224 ?auto_213225 ) ( ON ?auto_213223 ?auto_213224 ) ( ON ?auto_213222 ?auto_213223 ) ( ON ?auto_213221 ?auto_213222 ) ( CLEAR ?auto_213219 ) ( ON ?auto_213220 ?auto_213221 ) ( CLEAR ?auto_213220 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_213218 ?auto_213219 ?auto_213220 )
      ( MAKE-8PILE ?auto_213218 ?auto_213219 ?auto_213220 ?auto_213221 ?auto_213222 ?auto_213223 ?auto_213224 ?auto_213225 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_213235 - BLOCK
      ?auto_213236 - BLOCK
      ?auto_213237 - BLOCK
      ?auto_213238 - BLOCK
      ?auto_213239 - BLOCK
      ?auto_213240 - BLOCK
      ?auto_213241 - BLOCK
      ?auto_213242 - BLOCK
    )
    :vars
    (
      ?auto_213243 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_213242 ?auto_213243 ) ( ON-TABLE ?auto_213235 ) ( ON ?auto_213236 ?auto_213235 ) ( not ( = ?auto_213235 ?auto_213236 ) ) ( not ( = ?auto_213235 ?auto_213237 ) ) ( not ( = ?auto_213235 ?auto_213238 ) ) ( not ( = ?auto_213235 ?auto_213239 ) ) ( not ( = ?auto_213235 ?auto_213240 ) ) ( not ( = ?auto_213235 ?auto_213241 ) ) ( not ( = ?auto_213235 ?auto_213242 ) ) ( not ( = ?auto_213235 ?auto_213243 ) ) ( not ( = ?auto_213236 ?auto_213237 ) ) ( not ( = ?auto_213236 ?auto_213238 ) ) ( not ( = ?auto_213236 ?auto_213239 ) ) ( not ( = ?auto_213236 ?auto_213240 ) ) ( not ( = ?auto_213236 ?auto_213241 ) ) ( not ( = ?auto_213236 ?auto_213242 ) ) ( not ( = ?auto_213236 ?auto_213243 ) ) ( not ( = ?auto_213237 ?auto_213238 ) ) ( not ( = ?auto_213237 ?auto_213239 ) ) ( not ( = ?auto_213237 ?auto_213240 ) ) ( not ( = ?auto_213237 ?auto_213241 ) ) ( not ( = ?auto_213237 ?auto_213242 ) ) ( not ( = ?auto_213237 ?auto_213243 ) ) ( not ( = ?auto_213238 ?auto_213239 ) ) ( not ( = ?auto_213238 ?auto_213240 ) ) ( not ( = ?auto_213238 ?auto_213241 ) ) ( not ( = ?auto_213238 ?auto_213242 ) ) ( not ( = ?auto_213238 ?auto_213243 ) ) ( not ( = ?auto_213239 ?auto_213240 ) ) ( not ( = ?auto_213239 ?auto_213241 ) ) ( not ( = ?auto_213239 ?auto_213242 ) ) ( not ( = ?auto_213239 ?auto_213243 ) ) ( not ( = ?auto_213240 ?auto_213241 ) ) ( not ( = ?auto_213240 ?auto_213242 ) ) ( not ( = ?auto_213240 ?auto_213243 ) ) ( not ( = ?auto_213241 ?auto_213242 ) ) ( not ( = ?auto_213241 ?auto_213243 ) ) ( not ( = ?auto_213242 ?auto_213243 ) ) ( ON ?auto_213241 ?auto_213242 ) ( ON ?auto_213240 ?auto_213241 ) ( ON ?auto_213239 ?auto_213240 ) ( ON ?auto_213238 ?auto_213239 ) ( CLEAR ?auto_213236 ) ( ON ?auto_213237 ?auto_213238 ) ( CLEAR ?auto_213237 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_213235 ?auto_213236 ?auto_213237 )
      ( MAKE-8PILE ?auto_213235 ?auto_213236 ?auto_213237 ?auto_213238 ?auto_213239 ?auto_213240 ?auto_213241 ?auto_213242 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_213252 - BLOCK
      ?auto_213253 - BLOCK
      ?auto_213254 - BLOCK
      ?auto_213255 - BLOCK
      ?auto_213256 - BLOCK
      ?auto_213257 - BLOCK
      ?auto_213258 - BLOCK
      ?auto_213259 - BLOCK
    )
    :vars
    (
      ?auto_213260 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_213259 ?auto_213260 ) ( ON-TABLE ?auto_213252 ) ( not ( = ?auto_213252 ?auto_213253 ) ) ( not ( = ?auto_213252 ?auto_213254 ) ) ( not ( = ?auto_213252 ?auto_213255 ) ) ( not ( = ?auto_213252 ?auto_213256 ) ) ( not ( = ?auto_213252 ?auto_213257 ) ) ( not ( = ?auto_213252 ?auto_213258 ) ) ( not ( = ?auto_213252 ?auto_213259 ) ) ( not ( = ?auto_213252 ?auto_213260 ) ) ( not ( = ?auto_213253 ?auto_213254 ) ) ( not ( = ?auto_213253 ?auto_213255 ) ) ( not ( = ?auto_213253 ?auto_213256 ) ) ( not ( = ?auto_213253 ?auto_213257 ) ) ( not ( = ?auto_213253 ?auto_213258 ) ) ( not ( = ?auto_213253 ?auto_213259 ) ) ( not ( = ?auto_213253 ?auto_213260 ) ) ( not ( = ?auto_213254 ?auto_213255 ) ) ( not ( = ?auto_213254 ?auto_213256 ) ) ( not ( = ?auto_213254 ?auto_213257 ) ) ( not ( = ?auto_213254 ?auto_213258 ) ) ( not ( = ?auto_213254 ?auto_213259 ) ) ( not ( = ?auto_213254 ?auto_213260 ) ) ( not ( = ?auto_213255 ?auto_213256 ) ) ( not ( = ?auto_213255 ?auto_213257 ) ) ( not ( = ?auto_213255 ?auto_213258 ) ) ( not ( = ?auto_213255 ?auto_213259 ) ) ( not ( = ?auto_213255 ?auto_213260 ) ) ( not ( = ?auto_213256 ?auto_213257 ) ) ( not ( = ?auto_213256 ?auto_213258 ) ) ( not ( = ?auto_213256 ?auto_213259 ) ) ( not ( = ?auto_213256 ?auto_213260 ) ) ( not ( = ?auto_213257 ?auto_213258 ) ) ( not ( = ?auto_213257 ?auto_213259 ) ) ( not ( = ?auto_213257 ?auto_213260 ) ) ( not ( = ?auto_213258 ?auto_213259 ) ) ( not ( = ?auto_213258 ?auto_213260 ) ) ( not ( = ?auto_213259 ?auto_213260 ) ) ( ON ?auto_213258 ?auto_213259 ) ( ON ?auto_213257 ?auto_213258 ) ( ON ?auto_213256 ?auto_213257 ) ( ON ?auto_213255 ?auto_213256 ) ( ON ?auto_213254 ?auto_213255 ) ( CLEAR ?auto_213252 ) ( ON ?auto_213253 ?auto_213254 ) ( CLEAR ?auto_213253 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_213252 ?auto_213253 )
      ( MAKE-8PILE ?auto_213252 ?auto_213253 ?auto_213254 ?auto_213255 ?auto_213256 ?auto_213257 ?auto_213258 ?auto_213259 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_213269 - BLOCK
      ?auto_213270 - BLOCK
      ?auto_213271 - BLOCK
      ?auto_213272 - BLOCK
      ?auto_213273 - BLOCK
      ?auto_213274 - BLOCK
      ?auto_213275 - BLOCK
      ?auto_213276 - BLOCK
    )
    :vars
    (
      ?auto_213277 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_213276 ?auto_213277 ) ( ON-TABLE ?auto_213269 ) ( not ( = ?auto_213269 ?auto_213270 ) ) ( not ( = ?auto_213269 ?auto_213271 ) ) ( not ( = ?auto_213269 ?auto_213272 ) ) ( not ( = ?auto_213269 ?auto_213273 ) ) ( not ( = ?auto_213269 ?auto_213274 ) ) ( not ( = ?auto_213269 ?auto_213275 ) ) ( not ( = ?auto_213269 ?auto_213276 ) ) ( not ( = ?auto_213269 ?auto_213277 ) ) ( not ( = ?auto_213270 ?auto_213271 ) ) ( not ( = ?auto_213270 ?auto_213272 ) ) ( not ( = ?auto_213270 ?auto_213273 ) ) ( not ( = ?auto_213270 ?auto_213274 ) ) ( not ( = ?auto_213270 ?auto_213275 ) ) ( not ( = ?auto_213270 ?auto_213276 ) ) ( not ( = ?auto_213270 ?auto_213277 ) ) ( not ( = ?auto_213271 ?auto_213272 ) ) ( not ( = ?auto_213271 ?auto_213273 ) ) ( not ( = ?auto_213271 ?auto_213274 ) ) ( not ( = ?auto_213271 ?auto_213275 ) ) ( not ( = ?auto_213271 ?auto_213276 ) ) ( not ( = ?auto_213271 ?auto_213277 ) ) ( not ( = ?auto_213272 ?auto_213273 ) ) ( not ( = ?auto_213272 ?auto_213274 ) ) ( not ( = ?auto_213272 ?auto_213275 ) ) ( not ( = ?auto_213272 ?auto_213276 ) ) ( not ( = ?auto_213272 ?auto_213277 ) ) ( not ( = ?auto_213273 ?auto_213274 ) ) ( not ( = ?auto_213273 ?auto_213275 ) ) ( not ( = ?auto_213273 ?auto_213276 ) ) ( not ( = ?auto_213273 ?auto_213277 ) ) ( not ( = ?auto_213274 ?auto_213275 ) ) ( not ( = ?auto_213274 ?auto_213276 ) ) ( not ( = ?auto_213274 ?auto_213277 ) ) ( not ( = ?auto_213275 ?auto_213276 ) ) ( not ( = ?auto_213275 ?auto_213277 ) ) ( not ( = ?auto_213276 ?auto_213277 ) ) ( ON ?auto_213275 ?auto_213276 ) ( ON ?auto_213274 ?auto_213275 ) ( ON ?auto_213273 ?auto_213274 ) ( ON ?auto_213272 ?auto_213273 ) ( ON ?auto_213271 ?auto_213272 ) ( CLEAR ?auto_213269 ) ( ON ?auto_213270 ?auto_213271 ) ( CLEAR ?auto_213270 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_213269 ?auto_213270 )
      ( MAKE-8PILE ?auto_213269 ?auto_213270 ?auto_213271 ?auto_213272 ?auto_213273 ?auto_213274 ?auto_213275 ?auto_213276 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_213286 - BLOCK
      ?auto_213287 - BLOCK
      ?auto_213288 - BLOCK
      ?auto_213289 - BLOCK
      ?auto_213290 - BLOCK
      ?auto_213291 - BLOCK
      ?auto_213292 - BLOCK
      ?auto_213293 - BLOCK
    )
    :vars
    (
      ?auto_213294 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_213293 ?auto_213294 ) ( not ( = ?auto_213286 ?auto_213287 ) ) ( not ( = ?auto_213286 ?auto_213288 ) ) ( not ( = ?auto_213286 ?auto_213289 ) ) ( not ( = ?auto_213286 ?auto_213290 ) ) ( not ( = ?auto_213286 ?auto_213291 ) ) ( not ( = ?auto_213286 ?auto_213292 ) ) ( not ( = ?auto_213286 ?auto_213293 ) ) ( not ( = ?auto_213286 ?auto_213294 ) ) ( not ( = ?auto_213287 ?auto_213288 ) ) ( not ( = ?auto_213287 ?auto_213289 ) ) ( not ( = ?auto_213287 ?auto_213290 ) ) ( not ( = ?auto_213287 ?auto_213291 ) ) ( not ( = ?auto_213287 ?auto_213292 ) ) ( not ( = ?auto_213287 ?auto_213293 ) ) ( not ( = ?auto_213287 ?auto_213294 ) ) ( not ( = ?auto_213288 ?auto_213289 ) ) ( not ( = ?auto_213288 ?auto_213290 ) ) ( not ( = ?auto_213288 ?auto_213291 ) ) ( not ( = ?auto_213288 ?auto_213292 ) ) ( not ( = ?auto_213288 ?auto_213293 ) ) ( not ( = ?auto_213288 ?auto_213294 ) ) ( not ( = ?auto_213289 ?auto_213290 ) ) ( not ( = ?auto_213289 ?auto_213291 ) ) ( not ( = ?auto_213289 ?auto_213292 ) ) ( not ( = ?auto_213289 ?auto_213293 ) ) ( not ( = ?auto_213289 ?auto_213294 ) ) ( not ( = ?auto_213290 ?auto_213291 ) ) ( not ( = ?auto_213290 ?auto_213292 ) ) ( not ( = ?auto_213290 ?auto_213293 ) ) ( not ( = ?auto_213290 ?auto_213294 ) ) ( not ( = ?auto_213291 ?auto_213292 ) ) ( not ( = ?auto_213291 ?auto_213293 ) ) ( not ( = ?auto_213291 ?auto_213294 ) ) ( not ( = ?auto_213292 ?auto_213293 ) ) ( not ( = ?auto_213292 ?auto_213294 ) ) ( not ( = ?auto_213293 ?auto_213294 ) ) ( ON ?auto_213292 ?auto_213293 ) ( ON ?auto_213291 ?auto_213292 ) ( ON ?auto_213290 ?auto_213291 ) ( ON ?auto_213289 ?auto_213290 ) ( ON ?auto_213288 ?auto_213289 ) ( ON ?auto_213287 ?auto_213288 ) ( ON ?auto_213286 ?auto_213287 ) ( CLEAR ?auto_213286 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_213286 )
      ( MAKE-8PILE ?auto_213286 ?auto_213287 ?auto_213288 ?auto_213289 ?auto_213290 ?auto_213291 ?auto_213292 ?auto_213293 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_213303 - BLOCK
      ?auto_213304 - BLOCK
      ?auto_213305 - BLOCK
      ?auto_213306 - BLOCK
      ?auto_213307 - BLOCK
      ?auto_213308 - BLOCK
      ?auto_213309 - BLOCK
      ?auto_213310 - BLOCK
    )
    :vars
    (
      ?auto_213311 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_213310 ?auto_213311 ) ( not ( = ?auto_213303 ?auto_213304 ) ) ( not ( = ?auto_213303 ?auto_213305 ) ) ( not ( = ?auto_213303 ?auto_213306 ) ) ( not ( = ?auto_213303 ?auto_213307 ) ) ( not ( = ?auto_213303 ?auto_213308 ) ) ( not ( = ?auto_213303 ?auto_213309 ) ) ( not ( = ?auto_213303 ?auto_213310 ) ) ( not ( = ?auto_213303 ?auto_213311 ) ) ( not ( = ?auto_213304 ?auto_213305 ) ) ( not ( = ?auto_213304 ?auto_213306 ) ) ( not ( = ?auto_213304 ?auto_213307 ) ) ( not ( = ?auto_213304 ?auto_213308 ) ) ( not ( = ?auto_213304 ?auto_213309 ) ) ( not ( = ?auto_213304 ?auto_213310 ) ) ( not ( = ?auto_213304 ?auto_213311 ) ) ( not ( = ?auto_213305 ?auto_213306 ) ) ( not ( = ?auto_213305 ?auto_213307 ) ) ( not ( = ?auto_213305 ?auto_213308 ) ) ( not ( = ?auto_213305 ?auto_213309 ) ) ( not ( = ?auto_213305 ?auto_213310 ) ) ( not ( = ?auto_213305 ?auto_213311 ) ) ( not ( = ?auto_213306 ?auto_213307 ) ) ( not ( = ?auto_213306 ?auto_213308 ) ) ( not ( = ?auto_213306 ?auto_213309 ) ) ( not ( = ?auto_213306 ?auto_213310 ) ) ( not ( = ?auto_213306 ?auto_213311 ) ) ( not ( = ?auto_213307 ?auto_213308 ) ) ( not ( = ?auto_213307 ?auto_213309 ) ) ( not ( = ?auto_213307 ?auto_213310 ) ) ( not ( = ?auto_213307 ?auto_213311 ) ) ( not ( = ?auto_213308 ?auto_213309 ) ) ( not ( = ?auto_213308 ?auto_213310 ) ) ( not ( = ?auto_213308 ?auto_213311 ) ) ( not ( = ?auto_213309 ?auto_213310 ) ) ( not ( = ?auto_213309 ?auto_213311 ) ) ( not ( = ?auto_213310 ?auto_213311 ) ) ( ON ?auto_213309 ?auto_213310 ) ( ON ?auto_213308 ?auto_213309 ) ( ON ?auto_213307 ?auto_213308 ) ( ON ?auto_213306 ?auto_213307 ) ( ON ?auto_213305 ?auto_213306 ) ( ON ?auto_213304 ?auto_213305 ) ( ON ?auto_213303 ?auto_213304 ) ( CLEAR ?auto_213303 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_213303 )
      ( MAKE-8PILE ?auto_213303 ?auto_213304 ?auto_213305 ?auto_213306 ?auto_213307 ?auto_213308 ?auto_213309 ?auto_213310 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_213321 - BLOCK
      ?auto_213322 - BLOCK
      ?auto_213323 - BLOCK
      ?auto_213324 - BLOCK
      ?auto_213325 - BLOCK
      ?auto_213326 - BLOCK
      ?auto_213327 - BLOCK
      ?auto_213328 - BLOCK
      ?auto_213329 - BLOCK
    )
    :vars
    (
      ?auto_213330 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_213328 ) ( ON ?auto_213329 ?auto_213330 ) ( CLEAR ?auto_213329 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_213321 ) ( ON ?auto_213322 ?auto_213321 ) ( ON ?auto_213323 ?auto_213322 ) ( ON ?auto_213324 ?auto_213323 ) ( ON ?auto_213325 ?auto_213324 ) ( ON ?auto_213326 ?auto_213325 ) ( ON ?auto_213327 ?auto_213326 ) ( ON ?auto_213328 ?auto_213327 ) ( not ( = ?auto_213321 ?auto_213322 ) ) ( not ( = ?auto_213321 ?auto_213323 ) ) ( not ( = ?auto_213321 ?auto_213324 ) ) ( not ( = ?auto_213321 ?auto_213325 ) ) ( not ( = ?auto_213321 ?auto_213326 ) ) ( not ( = ?auto_213321 ?auto_213327 ) ) ( not ( = ?auto_213321 ?auto_213328 ) ) ( not ( = ?auto_213321 ?auto_213329 ) ) ( not ( = ?auto_213321 ?auto_213330 ) ) ( not ( = ?auto_213322 ?auto_213323 ) ) ( not ( = ?auto_213322 ?auto_213324 ) ) ( not ( = ?auto_213322 ?auto_213325 ) ) ( not ( = ?auto_213322 ?auto_213326 ) ) ( not ( = ?auto_213322 ?auto_213327 ) ) ( not ( = ?auto_213322 ?auto_213328 ) ) ( not ( = ?auto_213322 ?auto_213329 ) ) ( not ( = ?auto_213322 ?auto_213330 ) ) ( not ( = ?auto_213323 ?auto_213324 ) ) ( not ( = ?auto_213323 ?auto_213325 ) ) ( not ( = ?auto_213323 ?auto_213326 ) ) ( not ( = ?auto_213323 ?auto_213327 ) ) ( not ( = ?auto_213323 ?auto_213328 ) ) ( not ( = ?auto_213323 ?auto_213329 ) ) ( not ( = ?auto_213323 ?auto_213330 ) ) ( not ( = ?auto_213324 ?auto_213325 ) ) ( not ( = ?auto_213324 ?auto_213326 ) ) ( not ( = ?auto_213324 ?auto_213327 ) ) ( not ( = ?auto_213324 ?auto_213328 ) ) ( not ( = ?auto_213324 ?auto_213329 ) ) ( not ( = ?auto_213324 ?auto_213330 ) ) ( not ( = ?auto_213325 ?auto_213326 ) ) ( not ( = ?auto_213325 ?auto_213327 ) ) ( not ( = ?auto_213325 ?auto_213328 ) ) ( not ( = ?auto_213325 ?auto_213329 ) ) ( not ( = ?auto_213325 ?auto_213330 ) ) ( not ( = ?auto_213326 ?auto_213327 ) ) ( not ( = ?auto_213326 ?auto_213328 ) ) ( not ( = ?auto_213326 ?auto_213329 ) ) ( not ( = ?auto_213326 ?auto_213330 ) ) ( not ( = ?auto_213327 ?auto_213328 ) ) ( not ( = ?auto_213327 ?auto_213329 ) ) ( not ( = ?auto_213327 ?auto_213330 ) ) ( not ( = ?auto_213328 ?auto_213329 ) ) ( not ( = ?auto_213328 ?auto_213330 ) ) ( not ( = ?auto_213329 ?auto_213330 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_213329 ?auto_213330 )
      ( !STACK ?auto_213329 ?auto_213328 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_213340 - BLOCK
      ?auto_213341 - BLOCK
      ?auto_213342 - BLOCK
      ?auto_213343 - BLOCK
      ?auto_213344 - BLOCK
      ?auto_213345 - BLOCK
      ?auto_213346 - BLOCK
      ?auto_213347 - BLOCK
      ?auto_213348 - BLOCK
    )
    :vars
    (
      ?auto_213349 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_213347 ) ( ON ?auto_213348 ?auto_213349 ) ( CLEAR ?auto_213348 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_213340 ) ( ON ?auto_213341 ?auto_213340 ) ( ON ?auto_213342 ?auto_213341 ) ( ON ?auto_213343 ?auto_213342 ) ( ON ?auto_213344 ?auto_213343 ) ( ON ?auto_213345 ?auto_213344 ) ( ON ?auto_213346 ?auto_213345 ) ( ON ?auto_213347 ?auto_213346 ) ( not ( = ?auto_213340 ?auto_213341 ) ) ( not ( = ?auto_213340 ?auto_213342 ) ) ( not ( = ?auto_213340 ?auto_213343 ) ) ( not ( = ?auto_213340 ?auto_213344 ) ) ( not ( = ?auto_213340 ?auto_213345 ) ) ( not ( = ?auto_213340 ?auto_213346 ) ) ( not ( = ?auto_213340 ?auto_213347 ) ) ( not ( = ?auto_213340 ?auto_213348 ) ) ( not ( = ?auto_213340 ?auto_213349 ) ) ( not ( = ?auto_213341 ?auto_213342 ) ) ( not ( = ?auto_213341 ?auto_213343 ) ) ( not ( = ?auto_213341 ?auto_213344 ) ) ( not ( = ?auto_213341 ?auto_213345 ) ) ( not ( = ?auto_213341 ?auto_213346 ) ) ( not ( = ?auto_213341 ?auto_213347 ) ) ( not ( = ?auto_213341 ?auto_213348 ) ) ( not ( = ?auto_213341 ?auto_213349 ) ) ( not ( = ?auto_213342 ?auto_213343 ) ) ( not ( = ?auto_213342 ?auto_213344 ) ) ( not ( = ?auto_213342 ?auto_213345 ) ) ( not ( = ?auto_213342 ?auto_213346 ) ) ( not ( = ?auto_213342 ?auto_213347 ) ) ( not ( = ?auto_213342 ?auto_213348 ) ) ( not ( = ?auto_213342 ?auto_213349 ) ) ( not ( = ?auto_213343 ?auto_213344 ) ) ( not ( = ?auto_213343 ?auto_213345 ) ) ( not ( = ?auto_213343 ?auto_213346 ) ) ( not ( = ?auto_213343 ?auto_213347 ) ) ( not ( = ?auto_213343 ?auto_213348 ) ) ( not ( = ?auto_213343 ?auto_213349 ) ) ( not ( = ?auto_213344 ?auto_213345 ) ) ( not ( = ?auto_213344 ?auto_213346 ) ) ( not ( = ?auto_213344 ?auto_213347 ) ) ( not ( = ?auto_213344 ?auto_213348 ) ) ( not ( = ?auto_213344 ?auto_213349 ) ) ( not ( = ?auto_213345 ?auto_213346 ) ) ( not ( = ?auto_213345 ?auto_213347 ) ) ( not ( = ?auto_213345 ?auto_213348 ) ) ( not ( = ?auto_213345 ?auto_213349 ) ) ( not ( = ?auto_213346 ?auto_213347 ) ) ( not ( = ?auto_213346 ?auto_213348 ) ) ( not ( = ?auto_213346 ?auto_213349 ) ) ( not ( = ?auto_213347 ?auto_213348 ) ) ( not ( = ?auto_213347 ?auto_213349 ) ) ( not ( = ?auto_213348 ?auto_213349 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_213348 ?auto_213349 )
      ( !STACK ?auto_213348 ?auto_213347 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_213359 - BLOCK
      ?auto_213360 - BLOCK
      ?auto_213361 - BLOCK
      ?auto_213362 - BLOCK
      ?auto_213363 - BLOCK
      ?auto_213364 - BLOCK
      ?auto_213365 - BLOCK
      ?auto_213366 - BLOCK
      ?auto_213367 - BLOCK
    )
    :vars
    (
      ?auto_213368 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_213367 ?auto_213368 ) ( ON-TABLE ?auto_213359 ) ( ON ?auto_213360 ?auto_213359 ) ( ON ?auto_213361 ?auto_213360 ) ( ON ?auto_213362 ?auto_213361 ) ( ON ?auto_213363 ?auto_213362 ) ( ON ?auto_213364 ?auto_213363 ) ( ON ?auto_213365 ?auto_213364 ) ( not ( = ?auto_213359 ?auto_213360 ) ) ( not ( = ?auto_213359 ?auto_213361 ) ) ( not ( = ?auto_213359 ?auto_213362 ) ) ( not ( = ?auto_213359 ?auto_213363 ) ) ( not ( = ?auto_213359 ?auto_213364 ) ) ( not ( = ?auto_213359 ?auto_213365 ) ) ( not ( = ?auto_213359 ?auto_213366 ) ) ( not ( = ?auto_213359 ?auto_213367 ) ) ( not ( = ?auto_213359 ?auto_213368 ) ) ( not ( = ?auto_213360 ?auto_213361 ) ) ( not ( = ?auto_213360 ?auto_213362 ) ) ( not ( = ?auto_213360 ?auto_213363 ) ) ( not ( = ?auto_213360 ?auto_213364 ) ) ( not ( = ?auto_213360 ?auto_213365 ) ) ( not ( = ?auto_213360 ?auto_213366 ) ) ( not ( = ?auto_213360 ?auto_213367 ) ) ( not ( = ?auto_213360 ?auto_213368 ) ) ( not ( = ?auto_213361 ?auto_213362 ) ) ( not ( = ?auto_213361 ?auto_213363 ) ) ( not ( = ?auto_213361 ?auto_213364 ) ) ( not ( = ?auto_213361 ?auto_213365 ) ) ( not ( = ?auto_213361 ?auto_213366 ) ) ( not ( = ?auto_213361 ?auto_213367 ) ) ( not ( = ?auto_213361 ?auto_213368 ) ) ( not ( = ?auto_213362 ?auto_213363 ) ) ( not ( = ?auto_213362 ?auto_213364 ) ) ( not ( = ?auto_213362 ?auto_213365 ) ) ( not ( = ?auto_213362 ?auto_213366 ) ) ( not ( = ?auto_213362 ?auto_213367 ) ) ( not ( = ?auto_213362 ?auto_213368 ) ) ( not ( = ?auto_213363 ?auto_213364 ) ) ( not ( = ?auto_213363 ?auto_213365 ) ) ( not ( = ?auto_213363 ?auto_213366 ) ) ( not ( = ?auto_213363 ?auto_213367 ) ) ( not ( = ?auto_213363 ?auto_213368 ) ) ( not ( = ?auto_213364 ?auto_213365 ) ) ( not ( = ?auto_213364 ?auto_213366 ) ) ( not ( = ?auto_213364 ?auto_213367 ) ) ( not ( = ?auto_213364 ?auto_213368 ) ) ( not ( = ?auto_213365 ?auto_213366 ) ) ( not ( = ?auto_213365 ?auto_213367 ) ) ( not ( = ?auto_213365 ?auto_213368 ) ) ( not ( = ?auto_213366 ?auto_213367 ) ) ( not ( = ?auto_213366 ?auto_213368 ) ) ( not ( = ?auto_213367 ?auto_213368 ) ) ( CLEAR ?auto_213365 ) ( ON ?auto_213366 ?auto_213367 ) ( CLEAR ?auto_213366 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_213359 ?auto_213360 ?auto_213361 ?auto_213362 ?auto_213363 ?auto_213364 ?auto_213365 ?auto_213366 )
      ( MAKE-9PILE ?auto_213359 ?auto_213360 ?auto_213361 ?auto_213362 ?auto_213363 ?auto_213364 ?auto_213365 ?auto_213366 ?auto_213367 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_213378 - BLOCK
      ?auto_213379 - BLOCK
      ?auto_213380 - BLOCK
      ?auto_213381 - BLOCK
      ?auto_213382 - BLOCK
      ?auto_213383 - BLOCK
      ?auto_213384 - BLOCK
      ?auto_213385 - BLOCK
      ?auto_213386 - BLOCK
    )
    :vars
    (
      ?auto_213387 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_213386 ?auto_213387 ) ( ON-TABLE ?auto_213378 ) ( ON ?auto_213379 ?auto_213378 ) ( ON ?auto_213380 ?auto_213379 ) ( ON ?auto_213381 ?auto_213380 ) ( ON ?auto_213382 ?auto_213381 ) ( ON ?auto_213383 ?auto_213382 ) ( ON ?auto_213384 ?auto_213383 ) ( not ( = ?auto_213378 ?auto_213379 ) ) ( not ( = ?auto_213378 ?auto_213380 ) ) ( not ( = ?auto_213378 ?auto_213381 ) ) ( not ( = ?auto_213378 ?auto_213382 ) ) ( not ( = ?auto_213378 ?auto_213383 ) ) ( not ( = ?auto_213378 ?auto_213384 ) ) ( not ( = ?auto_213378 ?auto_213385 ) ) ( not ( = ?auto_213378 ?auto_213386 ) ) ( not ( = ?auto_213378 ?auto_213387 ) ) ( not ( = ?auto_213379 ?auto_213380 ) ) ( not ( = ?auto_213379 ?auto_213381 ) ) ( not ( = ?auto_213379 ?auto_213382 ) ) ( not ( = ?auto_213379 ?auto_213383 ) ) ( not ( = ?auto_213379 ?auto_213384 ) ) ( not ( = ?auto_213379 ?auto_213385 ) ) ( not ( = ?auto_213379 ?auto_213386 ) ) ( not ( = ?auto_213379 ?auto_213387 ) ) ( not ( = ?auto_213380 ?auto_213381 ) ) ( not ( = ?auto_213380 ?auto_213382 ) ) ( not ( = ?auto_213380 ?auto_213383 ) ) ( not ( = ?auto_213380 ?auto_213384 ) ) ( not ( = ?auto_213380 ?auto_213385 ) ) ( not ( = ?auto_213380 ?auto_213386 ) ) ( not ( = ?auto_213380 ?auto_213387 ) ) ( not ( = ?auto_213381 ?auto_213382 ) ) ( not ( = ?auto_213381 ?auto_213383 ) ) ( not ( = ?auto_213381 ?auto_213384 ) ) ( not ( = ?auto_213381 ?auto_213385 ) ) ( not ( = ?auto_213381 ?auto_213386 ) ) ( not ( = ?auto_213381 ?auto_213387 ) ) ( not ( = ?auto_213382 ?auto_213383 ) ) ( not ( = ?auto_213382 ?auto_213384 ) ) ( not ( = ?auto_213382 ?auto_213385 ) ) ( not ( = ?auto_213382 ?auto_213386 ) ) ( not ( = ?auto_213382 ?auto_213387 ) ) ( not ( = ?auto_213383 ?auto_213384 ) ) ( not ( = ?auto_213383 ?auto_213385 ) ) ( not ( = ?auto_213383 ?auto_213386 ) ) ( not ( = ?auto_213383 ?auto_213387 ) ) ( not ( = ?auto_213384 ?auto_213385 ) ) ( not ( = ?auto_213384 ?auto_213386 ) ) ( not ( = ?auto_213384 ?auto_213387 ) ) ( not ( = ?auto_213385 ?auto_213386 ) ) ( not ( = ?auto_213385 ?auto_213387 ) ) ( not ( = ?auto_213386 ?auto_213387 ) ) ( CLEAR ?auto_213384 ) ( ON ?auto_213385 ?auto_213386 ) ( CLEAR ?auto_213385 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_213378 ?auto_213379 ?auto_213380 ?auto_213381 ?auto_213382 ?auto_213383 ?auto_213384 ?auto_213385 )
      ( MAKE-9PILE ?auto_213378 ?auto_213379 ?auto_213380 ?auto_213381 ?auto_213382 ?auto_213383 ?auto_213384 ?auto_213385 ?auto_213386 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_213397 - BLOCK
      ?auto_213398 - BLOCK
      ?auto_213399 - BLOCK
      ?auto_213400 - BLOCK
      ?auto_213401 - BLOCK
      ?auto_213402 - BLOCK
      ?auto_213403 - BLOCK
      ?auto_213404 - BLOCK
      ?auto_213405 - BLOCK
    )
    :vars
    (
      ?auto_213406 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_213405 ?auto_213406 ) ( ON-TABLE ?auto_213397 ) ( ON ?auto_213398 ?auto_213397 ) ( ON ?auto_213399 ?auto_213398 ) ( ON ?auto_213400 ?auto_213399 ) ( ON ?auto_213401 ?auto_213400 ) ( ON ?auto_213402 ?auto_213401 ) ( not ( = ?auto_213397 ?auto_213398 ) ) ( not ( = ?auto_213397 ?auto_213399 ) ) ( not ( = ?auto_213397 ?auto_213400 ) ) ( not ( = ?auto_213397 ?auto_213401 ) ) ( not ( = ?auto_213397 ?auto_213402 ) ) ( not ( = ?auto_213397 ?auto_213403 ) ) ( not ( = ?auto_213397 ?auto_213404 ) ) ( not ( = ?auto_213397 ?auto_213405 ) ) ( not ( = ?auto_213397 ?auto_213406 ) ) ( not ( = ?auto_213398 ?auto_213399 ) ) ( not ( = ?auto_213398 ?auto_213400 ) ) ( not ( = ?auto_213398 ?auto_213401 ) ) ( not ( = ?auto_213398 ?auto_213402 ) ) ( not ( = ?auto_213398 ?auto_213403 ) ) ( not ( = ?auto_213398 ?auto_213404 ) ) ( not ( = ?auto_213398 ?auto_213405 ) ) ( not ( = ?auto_213398 ?auto_213406 ) ) ( not ( = ?auto_213399 ?auto_213400 ) ) ( not ( = ?auto_213399 ?auto_213401 ) ) ( not ( = ?auto_213399 ?auto_213402 ) ) ( not ( = ?auto_213399 ?auto_213403 ) ) ( not ( = ?auto_213399 ?auto_213404 ) ) ( not ( = ?auto_213399 ?auto_213405 ) ) ( not ( = ?auto_213399 ?auto_213406 ) ) ( not ( = ?auto_213400 ?auto_213401 ) ) ( not ( = ?auto_213400 ?auto_213402 ) ) ( not ( = ?auto_213400 ?auto_213403 ) ) ( not ( = ?auto_213400 ?auto_213404 ) ) ( not ( = ?auto_213400 ?auto_213405 ) ) ( not ( = ?auto_213400 ?auto_213406 ) ) ( not ( = ?auto_213401 ?auto_213402 ) ) ( not ( = ?auto_213401 ?auto_213403 ) ) ( not ( = ?auto_213401 ?auto_213404 ) ) ( not ( = ?auto_213401 ?auto_213405 ) ) ( not ( = ?auto_213401 ?auto_213406 ) ) ( not ( = ?auto_213402 ?auto_213403 ) ) ( not ( = ?auto_213402 ?auto_213404 ) ) ( not ( = ?auto_213402 ?auto_213405 ) ) ( not ( = ?auto_213402 ?auto_213406 ) ) ( not ( = ?auto_213403 ?auto_213404 ) ) ( not ( = ?auto_213403 ?auto_213405 ) ) ( not ( = ?auto_213403 ?auto_213406 ) ) ( not ( = ?auto_213404 ?auto_213405 ) ) ( not ( = ?auto_213404 ?auto_213406 ) ) ( not ( = ?auto_213405 ?auto_213406 ) ) ( ON ?auto_213404 ?auto_213405 ) ( CLEAR ?auto_213402 ) ( ON ?auto_213403 ?auto_213404 ) ( CLEAR ?auto_213403 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_213397 ?auto_213398 ?auto_213399 ?auto_213400 ?auto_213401 ?auto_213402 ?auto_213403 )
      ( MAKE-9PILE ?auto_213397 ?auto_213398 ?auto_213399 ?auto_213400 ?auto_213401 ?auto_213402 ?auto_213403 ?auto_213404 ?auto_213405 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_213416 - BLOCK
      ?auto_213417 - BLOCK
      ?auto_213418 - BLOCK
      ?auto_213419 - BLOCK
      ?auto_213420 - BLOCK
      ?auto_213421 - BLOCK
      ?auto_213422 - BLOCK
      ?auto_213423 - BLOCK
      ?auto_213424 - BLOCK
    )
    :vars
    (
      ?auto_213425 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_213424 ?auto_213425 ) ( ON-TABLE ?auto_213416 ) ( ON ?auto_213417 ?auto_213416 ) ( ON ?auto_213418 ?auto_213417 ) ( ON ?auto_213419 ?auto_213418 ) ( ON ?auto_213420 ?auto_213419 ) ( ON ?auto_213421 ?auto_213420 ) ( not ( = ?auto_213416 ?auto_213417 ) ) ( not ( = ?auto_213416 ?auto_213418 ) ) ( not ( = ?auto_213416 ?auto_213419 ) ) ( not ( = ?auto_213416 ?auto_213420 ) ) ( not ( = ?auto_213416 ?auto_213421 ) ) ( not ( = ?auto_213416 ?auto_213422 ) ) ( not ( = ?auto_213416 ?auto_213423 ) ) ( not ( = ?auto_213416 ?auto_213424 ) ) ( not ( = ?auto_213416 ?auto_213425 ) ) ( not ( = ?auto_213417 ?auto_213418 ) ) ( not ( = ?auto_213417 ?auto_213419 ) ) ( not ( = ?auto_213417 ?auto_213420 ) ) ( not ( = ?auto_213417 ?auto_213421 ) ) ( not ( = ?auto_213417 ?auto_213422 ) ) ( not ( = ?auto_213417 ?auto_213423 ) ) ( not ( = ?auto_213417 ?auto_213424 ) ) ( not ( = ?auto_213417 ?auto_213425 ) ) ( not ( = ?auto_213418 ?auto_213419 ) ) ( not ( = ?auto_213418 ?auto_213420 ) ) ( not ( = ?auto_213418 ?auto_213421 ) ) ( not ( = ?auto_213418 ?auto_213422 ) ) ( not ( = ?auto_213418 ?auto_213423 ) ) ( not ( = ?auto_213418 ?auto_213424 ) ) ( not ( = ?auto_213418 ?auto_213425 ) ) ( not ( = ?auto_213419 ?auto_213420 ) ) ( not ( = ?auto_213419 ?auto_213421 ) ) ( not ( = ?auto_213419 ?auto_213422 ) ) ( not ( = ?auto_213419 ?auto_213423 ) ) ( not ( = ?auto_213419 ?auto_213424 ) ) ( not ( = ?auto_213419 ?auto_213425 ) ) ( not ( = ?auto_213420 ?auto_213421 ) ) ( not ( = ?auto_213420 ?auto_213422 ) ) ( not ( = ?auto_213420 ?auto_213423 ) ) ( not ( = ?auto_213420 ?auto_213424 ) ) ( not ( = ?auto_213420 ?auto_213425 ) ) ( not ( = ?auto_213421 ?auto_213422 ) ) ( not ( = ?auto_213421 ?auto_213423 ) ) ( not ( = ?auto_213421 ?auto_213424 ) ) ( not ( = ?auto_213421 ?auto_213425 ) ) ( not ( = ?auto_213422 ?auto_213423 ) ) ( not ( = ?auto_213422 ?auto_213424 ) ) ( not ( = ?auto_213422 ?auto_213425 ) ) ( not ( = ?auto_213423 ?auto_213424 ) ) ( not ( = ?auto_213423 ?auto_213425 ) ) ( not ( = ?auto_213424 ?auto_213425 ) ) ( ON ?auto_213423 ?auto_213424 ) ( CLEAR ?auto_213421 ) ( ON ?auto_213422 ?auto_213423 ) ( CLEAR ?auto_213422 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_213416 ?auto_213417 ?auto_213418 ?auto_213419 ?auto_213420 ?auto_213421 ?auto_213422 )
      ( MAKE-9PILE ?auto_213416 ?auto_213417 ?auto_213418 ?auto_213419 ?auto_213420 ?auto_213421 ?auto_213422 ?auto_213423 ?auto_213424 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_213435 - BLOCK
      ?auto_213436 - BLOCK
      ?auto_213437 - BLOCK
      ?auto_213438 - BLOCK
      ?auto_213439 - BLOCK
      ?auto_213440 - BLOCK
      ?auto_213441 - BLOCK
      ?auto_213442 - BLOCK
      ?auto_213443 - BLOCK
    )
    :vars
    (
      ?auto_213444 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_213443 ?auto_213444 ) ( ON-TABLE ?auto_213435 ) ( ON ?auto_213436 ?auto_213435 ) ( ON ?auto_213437 ?auto_213436 ) ( ON ?auto_213438 ?auto_213437 ) ( ON ?auto_213439 ?auto_213438 ) ( not ( = ?auto_213435 ?auto_213436 ) ) ( not ( = ?auto_213435 ?auto_213437 ) ) ( not ( = ?auto_213435 ?auto_213438 ) ) ( not ( = ?auto_213435 ?auto_213439 ) ) ( not ( = ?auto_213435 ?auto_213440 ) ) ( not ( = ?auto_213435 ?auto_213441 ) ) ( not ( = ?auto_213435 ?auto_213442 ) ) ( not ( = ?auto_213435 ?auto_213443 ) ) ( not ( = ?auto_213435 ?auto_213444 ) ) ( not ( = ?auto_213436 ?auto_213437 ) ) ( not ( = ?auto_213436 ?auto_213438 ) ) ( not ( = ?auto_213436 ?auto_213439 ) ) ( not ( = ?auto_213436 ?auto_213440 ) ) ( not ( = ?auto_213436 ?auto_213441 ) ) ( not ( = ?auto_213436 ?auto_213442 ) ) ( not ( = ?auto_213436 ?auto_213443 ) ) ( not ( = ?auto_213436 ?auto_213444 ) ) ( not ( = ?auto_213437 ?auto_213438 ) ) ( not ( = ?auto_213437 ?auto_213439 ) ) ( not ( = ?auto_213437 ?auto_213440 ) ) ( not ( = ?auto_213437 ?auto_213441 ) ) ( not ( = ?auto_213437 ?auto_213442 ) ) ( not ( = ?auto_213437 ?auto_213443 ) ) ( not ( = ?auto_213437 ?auto_213444 ) ) ( not ( = ?auto_213438 ?auto_213439 ) ) ( not ( = ?auto_213438 ?auto_213440 ) ) ( not ( = ?auto_213438 ?auto_213441 ) ) ( not ( = ?auto_213438 ?auto_213442 ) ) ( not ( = ?auto_213438 ?auto_213443 ) ) ( not ( = ?auto_213438 ?auto_213444 ) ) ( not ( = ?auto_213439 ?auto_213440 ) ) ( not ( = ?auto_213439 ?auto_213441 ) ) ( not ( = ?auto_213439 ?auto_213442 ) ) ( not ( = ?auto_213439 ?auto_213443 ) ) ( not ( = ?auto_213439 ?auto_213444 ) ) ( not ( = ?auto_213440 ?auto_213441 ) ) ( not ( = ?auto_213440 ?auto_213442 ) ) ( not ( = ?auto_213440 ?auto_213443 ) ) ( not ( = ?auto_213440 ?auto_213444 ) ) ( not ( = ?auto_213441 ?auto_213442 ) ) ( not ( = ?auto_213441 ?auto_213443 ) ) ( not ( = ?auto_213441 ?auto_213444 ) ) ( not ( = ?auto_213442 ?auto_213443 ) ) ( not ( = ?auto_213442 ?auto_213444 ) ) ( not ( = ?auto_213443 ?auto_213444 ) ) ( ON ?auto_213442 ?auto_213443 ) ( ON ?auto_213441 ?auto_213442 ) ( CLEAR ?auto_213439 ) ( ON ?auto_213440 ?auto_213441 ) ( CLEAR ?auto_213440 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_213435 ?auto_213436 ?auto_213437 ?auto_213438 ?auto_213439 ?auto_213440 )
      ( MAKE-9PILE ?auto_213435 ?auto_213436 ?auto_213437 ?auto_213438 ?auto_213439 ?auto_213440 ?auto_213441 ?auto_213442 ?auto_213443 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_213454 - BLOCK
      ?auto_213455 - BLOCK
      ?auto_213456 - BLOCK
      ?auto_213457 - BLOCK
      ?auto_213458 - BLOCK
      ?auto_213459 - BLOCK
      ?auto_213460 - BLOCK
      ?auto_213461 - BLOCK
      ?auto_213462 - BLOCK
    )
    :vars
    (
      ?auto_213463 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_213462 ?auto_213463 ) ( ON-TABLE ?auto_213454 ) ( ON ?auto_213455 ?auto_213454 ) ( ON ?auto_213456 ?auto_213455 ) ( ON ?auto_213457 ?auto_213456 ) ( ON ?auto_213458 ?auto_213457 ) ( not ( = ?auto_213454 ?auto_213455 ) ) ( not ( = ?auto_213454 ?auto_213456 ) ) ( not ( = ?auto_213454 ?auto_213457 ) ) ( not ( = ?auto_213454 ?auto_213458 ) ) ( not ( = ?auto_213454 ?auto_213459 ) ) ( not ( = ?auto_213454 ?auto_213460 ) ) ( not ( = ?auto_213454 ?auto_213461 ) ) ( not ( = ?auto_213454 ?auto_213462 ) ) ( not ( = ?auto_213454 ?auto_213463 ) ) ( not ( = ?auto_213455 ?auto_213456 ) ) ( not ( = ?auto_213455 ?auto_213457 ) ) ( not ( = ?auto_213455 ?auto_213458 ) ) ( not ( = ?auto_213455 ?auto_213459 ) ) ( not ( = ?auto_213455 ?auto_213460 ) ) ( not ( = ?auto_213455 ?auto_213461 ) ) ( not ( = ?auto_213455 ?auto_213462 ) ) ( not ( = ?auto_213455 ?auto_213463 ) ) ( not ( = ?auto_213456 ?auto_213457 ) ) ( not ( = ?auto_213456 ?auto_213458 ) ) ( not ( = ?auto_213456 ?auto_213459 ) ) ( not ( = ?auto_213456 ?auto_213460 ) ) ( not ( = ?auto_213456 ?auto_213461 ) ) ( not ( = ?auto_213456 ?auto_213462 ) ) ( not ( = ?auto_213456 ?auto_213463 ) ) ( not ( = ?auto_213457 ?auto_213458 ) ) ( not ( = ?auto_213457 ?auto_213459 ) ) ( not ( = ?auto_213457 ?auto_213460 ) ) ( not ( = ?auto_213457 ?auto_213461 ) ) ( not ( = ?auto_213457 ?auto_213462 ) ) ( not ( = ?auto_213457 ?auto_213463 ) ) ( not ( = ?auto_213458 ?auto_213459 ) ) ( not ( = ?auto_213458 ?auto_213460 ) ) ( not ( = ?auto_213458 ?auto_213461 ) ) ( not ( = ?auto_213458 ?auto_213462 ) ) ( not ( = ?auto_213458 ?auto_213463 ) ) ( not ( = ?auto_213459 ?auto_213460 ) ) ( not ( = ?auto_213459 ?auto_213461 ) ) ( not ( = ?auto_213459 ?auto_213462 ) ) ( not ( = ?auto_213459 ?auto_213463 ) ) ( not ( = ?auto_213460 ?auto_213461 ) ) ( not ( = ?auto_213460 ?auto_213462 ) ) ( not ( = ?auto_213460 ?auto_213463 ) ) ( not ( = ?auto_213461 ?auto_213462 ) ) ( not ( = ?auto_213461 ?auto_213463 ) ) ( not ( = ?auto_213462 ?auto_213463 ) ) ( ON ?auto_213461 ?auto_213462 ) ( ON ?auto_213460 ?auto_213461 ) ( CLEAR ?auto_213458 ) ( ON ?auto_213459 ?auto_213460 ) ( CLEAR ?auto_213459 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_213454 ?auto_213455 ?auto_213456 ?auto_213457 ?auto_213458 ?auto_213459 )
      ( MAKE-9PILE ?auto_213454 ?auto_213455 ?auto_213456 ?auto_213457 ?auto_213458 ?auto_213459 ?auto_213460 ?auto_213461 ?auto_213462 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_213473 - BLOCK
      ?auto_213474 - BLOCK
      ?auto_213475 - BLOCK
      ?auto_213476 - BLOCK
      ?auto_213477 - BLOCK
      ?auto_213478 - BLOCK
      ?auto_213479 - BLOCK
      ?auto_213480 - BLOCK
      ?auto_213481 - BLOCK
    )
    :vars
    (
      ?auto_213482 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_213481 ?auto_213482 ) ( ON-TABLE ?auto_213473 ) ( ON ?auto_213474 ?auto_213473 ) ( ON ?auto_213475 ?auto_213474 ) ( ON ?auto_213476 ?auto_213475 ) ( not ( = ?auto_213473 ?auto_213474 ) ) ( not ( = ?auto_213473 ?auto_213475 ) ) ( not ( = ?auto_213473 ?auto_213476 ) ) ( not ( = ?auto_213473 ?auto_213477 ) ) ( not ( = ?auto_213473 ?auto_213478 ) ) ( not ( = ?auto_213473 ?auto_213479 ) ) ( not ( = ?auto_213473 ?auto_213480 ) ) ( not ( = ?auto_213473 ?auto_213481 ) ) ( not ( = ?auto_213473 ?auto_213482 ) ) ( not ( = ?auto_213474 ?auto_213475 ) ) ( not ( = ?auto_213474 ?auto_213476 ) ) ( not ( = ?auto_213474 ?auto_213477 ) ) ( not ( = ?auto_213474 ?auto_213478 ) ) ( not ( = ?auto_213474 ?auto_213479 ) ) ( not ( = ?auto_213474 ?auto_213480 ) ) ( not ( = ?auto_213474 ?auto_213481 ) ) ( not ( = ?auto_213474 ?auto_213482 ) ) ( not ( = ?auto_213475 ?auto_213476 ) ) ( not ( = ?auto_213475 ?auto_213477 ) ) ( not ( = ?auto_213475 ?auto_213478 ) ) ( not ( = ?auto_213475 ?auto_213479 ) ) ( not ( = ?auto_213475 ?auto_213480 ) ) ( not ( = ?auto_213475 ?auto_213481 ) ) ( not ( = ?auto_213475 ?auto_213482 ) ) ( not ( = ?auto_213476 ?auto_213477 ) ) ( not ( = ?auto_213476 ?auto_213478 ) ) ( not ( = ?auto_213476 ?auto_213479 ) ) ( not ( = ?auto_213476 ?auto_213480 ) ) ( not ( = ?auto_213476 ?auto_213481 ) ) ( not ( = ?auto_213476 ?auto_213482 ) ) ( not ( = ?auto_213477 ?auto_213478 ) ) ( not ( = ?auto_213477 ?auto_213479 ) ) ( not ( = ?auto_213477 ?auto_213480 ) ) ( not ( = ?auto_213477 ?auto_213481 ) ) ( not ( = ?auto_213477 ?auto_213482 ) ) ( not ( = ?auto_213478 ?auto_213479 ) ) ( not ( = ?auto_213478 ?auto_213480 ) ) ( not ( = ?auto_213478 ?auto_213481 ) ) ( not ( = ?auto_213478 ?auto_213482 ) ) ( not ( = ?auto_213479 ?auto_213480 ) ) ( not ( = ?auto_213479 ?auto_213481 ) ) ( not ( = ?auto_213479 ?auto_213482 ) ) ( not ( = ?auto_213480 ?auto_213481 ) ) ( not ( = ?auto_213480 ?auto_213482 ) ) ( not ( = ?auto_213481 ?auto_213482 ) ) ( ON ?auto_213480 ?auto_213481 ) ( ON ?auto_213479 ?auto_213480 ) ( ON ?auto_213478 ?auto_213479 ) ( CLEAR ?auto_213476 ) ( ON ?auto_213477 ?auto_213478 ) ( CLEAR ?auto_213477 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_213473 ?auto_213474 ?auto_213475 ?auto_213476 ?auto_213477 )
      ( MAKE-9PILE ?auto_213473 ?auto_213474 ?auto_213475 ?auto_213476 ?auto_213477 ?auto_213478 ?auto_213479 ?auto_213480 ?auto_213481 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_213492 - BLOCK
      ?auto_213493 - BLOCK
      ?auto_213494 - BLOCK
      ?auto_213495 - BLOCK
      ?auto_213496 - BLOCK
      ?auto_213497 - BLOCK
      ?auto_213498 - BLOCK
      ?auto_213499 - BLOCK
      ?auto_213500 - BLOCK
    )
    :vars
    (
      ?auto_213501 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_213500 ?auto_213501 ) ( ON-TABLE ?auto_213492 ) ( ON ?auto_213493 ?auto_213492 ) ( ON ?auto_213494 ?auto_213493 ) ( ON ?auto_213495 ?auto_213494 ) ( not ( = ?auto_213492 ?auto_213493 ) ) ( not ( = ?auto_213492 ?auto_213494 ) ) ( not ( = ?auto_213492 ?auto_213495 ) ) ( not ( = ?auto_213492 ?auto_213496 ) ) ( not ( = ?auto_213492 ?auto_213497 ) ) ( not ( = ?auto_213492 ?auto_213498 ) ) ( not ( = ?auto_213492 ?auto_213499 ) ) ( not ( = ?auto_213492 ?auto_213500 ) ) ( not ( = ?auto_213492 ?auto_213501 ) ) ( not ( = ?auto_213493 ?auto_213494 ) ) ( not ( = ?auto_213493 ?auto_213495 ) ) ( not ( = ?auto_213493 ?auto_213496 ) ) ( not ( = ?auto_213493 ?auto_213497 ) ) ( not ( = ?auto_213493 ?auto_213498 ) ) ( not ( = ?auto_213493 ?auto_213499 ) ) ( not ( = ?auto_213493 ?auto_213500 ) ) ( not ( = ?auto_213493 ?auto_213501 ) ) ( not ( = ?auto_213494 ?auto_213495 ) ) ( not ( = ?auto_213494 ?auto_213496 ) ) ( not ( = ?auto_213494 ?auto_213497 ) ) ( not ( = ?auto_213494 ?auto_213498 ) ) ( not ( = ?auto_213494 ?auto_213499 ) ) ( not ( = ?auto_213494 ?auto_213500 ) ) ( not ( = ?auto_213494 ?auto_213501 ) ) ( not ( = ?auto_213495 ?auto_213496 ) ) ( not ( = ?auto_213495 ?auto_213497 ) ) ( not ( = ?auto_213495 ?auto_213498 ) ) ( not ( = ?auto_213495 ?auto_213499 ) ) ( not ( = ?auto_213495 ?auto_213500 ) ) ( not ( = ?auto_213495 ?auto_213501 ) ) ( not ( = ?auto_213496 ?auto_213497 ) ) ( not ( = ?auto_213496 ?auto_213498 ) ) ( not ( = ?auto_213496 ?auto_213499 ) ) ( not ( = ?auto_213496 ?auto_213500 ) ) ( not ( = ?auto_213496 ?auto_213501 ) ) ( not ( = ?auto_213497 ?auto_213498 ) ) ( not ( = ?auto_213497 ?auto_213499 ) ) ( not ( = ?auto_213497 ?auto_213500 ) ) ( not ( = ?auto_213497 ?auto_213501 ) ) ( not ( = ?auto_213498 ?auto_213499 ) ) ( not ( = ?auto_213498 ?auto_213500 ) ) ( not ( = ?auto_213498 ?auto_213501 ) ) ( not ( = ?auto_213499 ?auto_213500 ) ) ( not ( = ?auto_213499 ?auto_213501 ) ) ( not ( = ?auto_213500 ?auto_213501 ) ) ( ON ?auto_213499 ?auto_213500 ) ( ON ?auto_213498 ?auto_213499 ) ( ON ?auto_213497 ?auto_213498 ) ( CLEAR ?auto_213495 ) ( ON ?auto_213496 ?auto_213497 ) ( CLEAR ?auto_213496 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_213492 ?auto_213493 ?auto_213494 ?auto_213495 ?auto_213496 )
      ( MAKE-9PILE ?auto_213492 ?auto_213493 ?auto_213494 ?auto_213495 ?auto_213496 ?auto_213497 ?auto_213498 ?auto_213499 ?auto_213500 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_213511 - BLOCK
      ?auto_213512 - BLOCK
      ?auto_213513 - BLOCK
      ?auto_213514 - BLOCK
      ?auto_213515 - BLOCK
      ?auto_213516 - BLOCK
      ?auto_213517 - BLOCK
      ?auto_213518 - BLOCK
      ?auto_213519 - BLOCK
    )
    :vars
    (
      ?auto_213520 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_213519 ?auto_213520 ) ( ON-TABLE ?auto_213511 ) ( ON ?auto_213512 ?auto_213511 ) ( ON ?auto_213513 ?auto_213512 ) ( not ( = ?auto_213511 ?auto_213512 ) ) ( not ( = ?auto_213511 ?auto_213513 ) ) ( not ( = ?auto_213511 ?auto_213514 ) ) ( not ( = ?auto_213511 ?auto_213515 ) ) ( not ( = ?auto_213511 ?auto_213516 ) ) ( not ( = ?auto_213511 ?auto_213517 ) ) ( not ( = ?auto_213511 ?auto_213518 ) ) ( not ( = ?auto_213511 ?auto_213519 ) ) ( not ( = ?auto_213511 ?auto_213520 ) ) ( not ( = ?auto_213512 ?auto_213513 ) ) ( not ( = ?auto_213512 ?auto_213514 ) ) ( not ( = ?auto_213512 ?auto_213515 ) ) ( not ( = ?auto_213512 ?auto_213516 ) ) ( not ( = ?auto_213512 ?auto_213517 ) ) ( not ( = ?auto_213512 ?auto_213518 ) ) ( not ( = ?auto_213512 ?auto_213519 ) ) ( not ( = ?auto_213512 ?auto_213520 ) ) ( not ( = ?auto_213513 ?auto_213514 ) ) ( not ( = ?auto_213513 ?auto_213515 ) ) ( not ( = ?auto_213513 ?auto_213516 ) ) ( not ( = ?auto_213513 ?auto_213517 ) ) ( not ( = ?auto_213513 ?auto_213518 ) ) ( not ( = ?auto_213513 ?auto_213519 ) ) ( not ( = ?auto_213513 ?auto_213520 ) ) ( not ( = ?auto_213514 ?auto_213515 ) ) ( not ( = ?auto_213514 ?auto_213516 ) ) ( not ( = ?auto_213514 ?auto_213517 ) ) ( not ( = ?auto_213514 ?auto_213518 ) ) ( not ( = ?auto_213514 ?auto_213519 ) ) ( not ( = ?auto_213514 ?auto_213520 ) ) ( not ( = ?auto_213515 ?auto_213516 ) ) ( not ( = ?auto_213515 ?auto_213517 ) ) ( not ( = ?auto_213515 ?auto_213518 ) ) ( not ( = ?auto_213515 ?auto_213519 ) ) ( not ( = ?auto_213515 ?auto_213520 ) ) ( not ( = ?auto_213516 ?auto_213517 ) ) ( not ( = ?auto_213516 ?auto_213518 ) ) ( not ( = ?auto_213516 ?auto_213519 ) ) ( not ( = ?auto_213516 ?auto_213520 ) ) ( not ( = ?auto_213517 ?auto_213518 ) ) ( not ( = ?auto_213517 ?auto_213519 ) ) ( not ( = ?auto_213517 ?auto_213520 ) ) ( not ( = ?auto_213518 ?auto_213519 ) ) ( not ( = ?auto_213518 ?auto_213520 ) ) ( not ( = ?auto_213519 ?auto_213520 ) ) ( ON ?auto_213518 ?auto_213519 ) ( ON ?auto_213517 ?auto_213518 ) ( ON ?auto_213516 ?auto_213517 ) ( ON ?auto_213515 ?auto_213516 ) ( CLEAR ?auto_213513 ) ( ON ?auto_213514 ?auto_213515 ) ( CLEAR ?auto_213514 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_213511 ?auto_213512 ?auto_213513 ?auto_213514 )
      ( MAKE-9PILE ?auto_213511 ?auto_213512 ?auto_213513 ?auto_213514 ?auto_213515 ?auto_213516 ?auto_213517 ?auto_213518 ?auto_213519 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_213530 - BLOCK
      ?auto_213531 - BLOCK
      ?auto_213532 - BLOCK
      ?auto_213533 - BLOCK
      ?auto_213534 - BLOCK
      ?auto_213535 - BLOCK
      ?auto_213536 - BLOCK
      ?auto_213537 - BLOCK
      ?auto_213538 - BLOCK
    )
    :vars
    (
      ?auto_213539 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_213538 ?auto_213539 ) ( ON-TABLE ?auto_213530 ) ( ON ?auto_213531 ?auto_213530 ) ( ON ?auto_213532 ?auto_213531 ) ( not ( = ?auto_213530 ?auto_213531 ) ) ( not ( = ?auto_213530 ?auto_213532 ) ) ( not ( = ?auto_213530 ?auto_213533 ) ) ( not ( = ?auto_213530 ?auto_213534 ) ) ( not ( = ?auto_213530 ?auto_213535 ) ) ( not ( = ?auto_213530 ?auto_213536 ) ) ( not ( = ?auto_213530 ?auto_213537 ) ) ( not ( = ?auto_213530 ?auto_213538 ) ) ( not ( = ?auto_213530 ?auto_213539 ) ) ( not ( = ?auto_213531 ?auto_213532 ) ) ( not ( = ?auto_213531 ?auto_213533 ) ) ( not ( = ?auto_213531 ?auto_213534 ) ) ( not ( = ?auto_213531 ?auto_213535 ) ) ( not ( = ?auto_213531 ?auto_213536 ) ) ( not ( = ?auto_213531 ?auto_213537 ) ) ( not ( = ?auto_213531 ?auto_213538 ) ) ( not ( = ?auto_213531 ?auto_213539 ) ) ( not ( = ?auto_213532 ?auto_213533 ) ) ( not ( = ?auto_213532 ?auto_213534 ) ) ( not ( = ?auto_213532 ?auto_213535 ) ) ( not ( = ?auto_213532 ?auto_213536 ) ) ( not ( = ?auto_213532 ?auto_213537 ) ) ( not ( = ?auto_213532 ?auto_213538 ) ) ( not ( = ?auto_213532 ?auto_213539 ) ) ( not ( = ?auto_213533 ?auto_213534 ) ) ( not ( = ?auto_213533 ?auto_213535 ) ) ( not ( = ?auto_213533 ?auto_213536 ) ) ( not ( = ?auto_213533 ?auto_213537 ) ) ( not ( = ?auto_213533 ?auto_213538 ) ) ( not ( = ?auto_213533 ?auto_213539 ) ) ( not ( = ?auto_213534 ?auto_213535 ) ) ( not ( = ?auto_213534 ?auto_213536 ) ) ( not ( = ?auto_213534 ?auto_213537 ) ) ( not ( = ?auto_213534 ?auto_213538 ) ) ( not ( = ?auto_213534 ?auto_213539 ) ) ( not ( = ?auto_213535 ?auto_213536 ) ) ( not ( = ?auto_213535 ?auto_213537 ) ) ( not ( = ?auto_213535 ?auto_213538 ) ) ( not ( = ?auto_213535 ?auto_213539 ) ) ( not ( = ?auto_213536 ?auto_213537 ) ) ( not ( = ?auto_213536 ?auto_213538 ) ) ( not ( = ?auto_213536 ?auto_213539 ) ) ( not ( = ?auto_213537 ?auto_213538 ) ) ( not ( = ?auto_213537 ?auto_213539 ) ) ( not ( = ?auto_213538 ?auto_213539 ) ) ( ON ?auto_213537 ?auto_213538 ) ( ON ?auto_213536 ?auto_213537 ) ( ON ?auto_213535 ?auto_213536 ) ( ON ?auto_213534 ?auto_213535 ) ( CLEAR ?auto_213532 ) ( ON ?auto_213533 ?auto_213534 ) ( CLEAR ?auto_213533 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_213530 ?auto_213531 ?auto_213532 ?auto_213533 )
      ( MAKE-9PILE ?auto_213530 ?auto_213531 ?auto_213532 ?auto_213533 ?auto_213534 ?auto_213535 ?auto_213536 ?auto_213537 ?auto_213538 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_213549 - BLOCK
      ?auto_213550 - BLOCK
      ?auto_213551 - BLOCK
      ?auto_213552 - BLOCK
      ?auto_213553 - BLOCK
      ?auto_213554 - BLOCK
      ?auto_213555 - BLOCK
      ?auto_213556 - BLOCK
      ?auto_213557 - BLOCK
    )
    :vars
    (
      ?auto_213558 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_213557 ?auto_213558 ) ( ON-TABLE ?auto_213549 ) ( ON ?auto_213550 ?auto_213549 ) ( not ( = ?auto_213549 ?auto_213550 ) ) ( not ( = ?auto_213549 ?auto_213551 ) ) ( not ( = ?auto_213549 ?auto_213552 ) ) ( not ( = ?auto_213549 ?auto_213553 ) ) ( not ( = ?auto_213549 ?auto_213554 ) ) ( not ( = ?auto_213549 ?auto_213555 ) ) ( not ( = ?auto_213549 ?auto_213556 ) ) ( not ( = ?auto_213549 ?auto_213557 ) ) ( not ( = ?auto_213549 ?auto_213558 ) ) ( not ( = ?auto_213550 ?auto_213551 ) ) ( not ( = ?auto_213550 ?auto_213552 ) ) ( not ( = ?auto_213550 ?auto_213553 ) ) ( not ( = ?auto_213550 ?auto_213554 ) ) ( not ( = ?auto_213550 ?auto_213555 ) ) ( not ( = ?auto_213550 ?auto_213556 ) ) ( not ( = ?auto_213550 ?auto_213557 ) ) ( not ( = ?auto_213550 ?auto_213558 ) ) ( not ( = ?auto_213551 ?auto_213552 ) ) ( not ( = ?auto_213551 ?auto_213553 ) ) ( not ( = ?auto_213551 ?auto_213554 ) ) ( not ( = ?auto_213551 ?auto_213555 ) ) ( not ( = ?auto_213551 ?auto_213556 ) ) ( not ( = ?auto_213551 ?auto_213557 ) ) ( not ( = ?auto_213551 ?auto_213558 ) ) ( not ( = ?auto_213552 ?auto_213553 ) ) ( not ( = ?auto_213552 ?auto_213554 ) ) ( not ( = ?auto_213552 ?auto_213555 ) ) ( not ( = ?auto_213552 ?auto_213556 ) ) ( not ( = ?auto_213552 ?auto_213557 ) ) ( not ( = ?auto_213552 ?auto_213558 ) ) ( not ( = ?auto_213553 ?auto_213554 ) ) ( not ( = ?auto_213553 ?auto_213555 ) ) ( not ( = ?auto_213553 ?auto_213556 ) ) ( not ( = ?auto_213553 ?auto_213557 ) ) ( not ( = ?auto_213553 ?auto_213558 ) ) ( not ( = ?auto_213554 ?auto_213555 ) ) ( not ( = ?auto_213554 ?auto_213556 ) ) ( not ( = ?auto_213554 ?auto_213557 ) ) ( not ( = ?auto_213554 ?auto_213558 ) ) ( not ( = ?auto_213555 ?auto_213556 ) ) ( not ( = ?auto_213555 ?auto_213557 ) ) ( not ( = ?auto_213555 ?auto_213558 ) ) ( not ( = ?auto_213556 ?auto_213557 ) ) ( not ( = ?auto_213556 ?auto_213558 ) ) ( not ( = ?auto_213557 ?auto_213558 ) ) ( ON ?auto_213556 ?auto_213557 ) ( ON ?auto_213555 ?auto_213556 ) ( ON ?auto_213554 ?auto_213555 ) ( ON ?auto_213553 ?auto_213554 ) ( ON ?auto_213552 ?auto_213553 ) ( CLEAR ?auto_213550 ) ( ON ?auto_213551 ?auto_213552 ) ( CLEAR ?auto_213551 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_213549 ?auto_213550 ?auto_213551 )
      ( MAKE-9PILE ?auto_213549 ?auto_213550 ?auto_213551 ?auto_213552 ?auto_213553 ?auto_213554 ?auto_213555 ?auto_213556 ?auto_213557 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_213568 - BLOCK
      ?auto_213569 - BLOCK
      ?auto_213570 - BLOCK
      ?auto_213571 - BLOCK
      ?auto_213572 - BLOCK
      ?auto_213573 - BLOCK
      ?auto_213574 - BLOCK
      ?auto_213575 - BLOCK
      ?auto_213576 - BLOCK
    )
    :vars
    (
      ?auto_213577 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_213576 ?auto_213577 ) ( ON-TABLE ?auto_213568 ) ( ON ?auto_213569 ?auto_213568 ) ( not ( = ?auto_213568 ?auto_213569 ) ) ( not ( = ?auto_213568 ?auto_213570 ) ) ( not ( = ?auto_213568 ?auto_213571 ) ) ( not ( = ?auto_213568 ?auto_213572 ) ) ( not ( = ?auto_213568 ?auto_213573 ) ) ( not ( = ?auto_213568 ?auto_213574 ) ) ( not ( = ?auto_213568 ?auto_213575 ) ) ( not ( = ?auto_213568 ?auto_213576 ) ) ( not ( = ?auto_213568 ?auto_213577 ) ) ( not ( = ?auto_213569 ?auto_213570 ) ) ( not ( = ?auto_213569 ?auto_213571 ) ) ( not ( = ?auto_213569 ?auto_213572 ) ) ( not ( = ?auto_213569 ?auto_213573 ) ) ( not ( = ?auto_213569 ?auto_213574 ) ) ( not ( = ?auto_213569 ?auto_213575 ) ) ( not ( = ?auto_213569 ?auto_213576 ) ) ( not ( = ?auto_213569 ?auto_213577 ) ) ( not ( = ?auto_213570 ?auto_213571 ) ) ( not ( = ?auto_213570 ?auto_213572 ) ) ( not ( = ?auto_213570 ?auto_213573 ) ) ( not ( = ?auto_213570 ?auto_213574 ) ) ( not ( = ?auto_213570 ?auto_213575 ) ) ( not ( = ?auto_213570 ?auto_213576 ) ) ( not ( = ?auto_213570 ?auto_213577 ) ) ( not ( = ?auto_213571 ?auto_213572 ) ) ( not ( = ?auto_213571 ?auto_213573 ) ) ( not ( = ?auto_213571 ?auto_213574 ) ) ( not ( = ?auto_213571 ?auto_213575 ) ) ( not ( = ?auto_213571 ?auto_213576 ) ) ( not ( = ?auto_213571 ?auto_213577 ) ) ( not ( = ?auto_213572 ?auto_213573 ) ) ( not ( = ?auto_213572 ?auto_213574 ) ) ( not ( = ?auto_213572 ?auto_213575 ) ) ( not ( = ?auto_213572 ?auto_213576 ) ) ( not ( = ?auto_213572 ?auto_213577 ) ) ( not ( = ?auto_213573 ?auto_213574 ) ) ( not ( = ?auto_213573 ?auto_213575 ) ) ( not ( = ?auto_213573 ?auto_213576 ) ) ( not ( = ?auto_213573 ?auto_213577 ) ) ( not ( = ?auto_213574 ?auto_213575 ) ) ( not ( = ?auto_213574 ?auto_213576 ) ) ( not ( = ?auto_213574 ?auto_213577 ) ) ( not ( = ?auto_213575 ?auto_213576 ) ) ( not ( = ?auto_213575 ?auto_213577 ) ) ( not ( = ?auto_213576 ?auto_213577 ) ) ( ON ?auto_213575 ?auto_213576 ) ( ON ?auto_213574 ?auto_213575 ) ( ON ?auto_213573 ?auto_213574 ) ( ON ?auto_213572 ?auto_213573 ) ( ON ?auto_213571 ?auto_213572 ) ( CLEAR ?auto_213569 ) ( ON ?auto_213570 ?auto_213571 ) ( CLEAR ?auto_213570 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_213568 ?auto_213569 ?auto_213570 )
      ( MAKE-9PILE ?auto_213568 ?auto_213569 ?auto_213570 ?auto_213571 ?auto_213572 ?auto_213573 ?auto_213574 ?auto_213575 ?auto_213576 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_213587 - BLOCK
      ?auto_213588 - BLOCK
      ?auto_213589 - BLOCK
      ?auto_213590 - BLOCK
      ?auto_213591 - BLOCK
      ?auto_213592 - BLOCK
      ?auto_213593 - BLOCK
      ?auto_213594 - BLOCK
      ?auto_213595 - BLOCK
    )
    :vars
    (
      ?auto_213596 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_213595 ?auto_213596 ) ( ON-TABLE ?auto_213587 ) ( not ( = ?auto_213587 ?auto_213588 ) ) ( not ( = ?auto_213587 ?auto_213589 ) ) ( not ( = ?auto_213587 ?auto_213590 ) ) ( not ( = ?auto_213587 ?auto_213591 ) ) ( not ( = ?auto_213587 ?auto_213592 ) ) ( not ( = ?auto_213587 ?auto_213593 ) ) ( not ( = ?auto_213587 ?auto_213594 ) ) ( not ( = ?auto_213587 ?auto_213595 ) ) ( not ( = ?auto_213587 ?auto_213596 ) ) ( not ( = ?auto_213588 ?auto_213589 ) ) ( not ( = ?auto_213588 ?auto_213590 ) ) ( not ( = ?auto_213588 ?auto_213591 ) ) ( not ( = ?auto_213588 ?auto_213592 ) ) ( not ( = ?auto_213588 ?auto_213593 ) ) ( not ( = ?auto_213588 ?auto_213594 ) ) ( not ( = ?auto_213588 ?auto_213595 ) ) ( not ( = ?auto_213588 ?auto_213596 ) ) ( not ( = ?auto_213589 ?auto_213590 ) ) ( not ( = ?auto_213589 ?auto_213591 ) ) ( not ( = ?auto_213589 ?auto_213592 ) ) ( not ( = ?auto_213589 ?auto_213593 ) ) ( not ( = ?auto_213589 ?auto_213594 ) ) ( not ( = ?auto_213589 ?auto_213595 ) ) ( not ( = ?auto_213589 ?auto_213596 ) ) ( not ( = ?auto_213590 ?auto_213591 ) ) ( not ( = ?auto_213590 ?auto_213592 ) ) ( not ( = ?auto_213590 ?auto_213593 ) ) ( not ( = ?auto_213590 ?auto_213594 ) ) ( not ( = ?auto_213590 ?auto_213595 ) ) ( not ( = ?auto_213590 ?auto_213596 ) ) ( not ( = ?auto_213591 ?auto_213592 ) ) ( not ( = ?auto_213591 ?auto_213593 ) ) ( not ( = ?auto_213591 ?auto_213594 ) ) ( not ( = ?auto_213591 ?auto_213595 ) ) ( not ( = ?auto_213591 ?auto_213596 ) ) ( not ( = ?auto_213592 ?auto_213593 ) ) ( not ( = ?auto_213592 ?auto_213594 ) ) ( not ( = ?auto_213592 ?auto_213595 ) ) ( not ( = ?auto_213592 ?auto_213596 ) ) ( not ( = ?auto_213593 ?auto_213594 ) ) ( not ( = ?auto_213593 ?auto_213595 ) ) ( not ( = ?auto_213593 ?auto_213596 ) ) ( not ( = ?auto_213594 ?auto_213595 ) ) ( not ( = ?auto_213594 ?auto_213596 ) ) ( not ( = ?auto_213595 ?auto_213596 ) ) ( ON ?auto_213594 ?auto_213595 ) ( ON ?auto_213593 ?auto_213594 ) ( ON ?auto_213592 ?auto_213593 ) ( ON ?auto_213591 ?auto_213592 ) ( ON ?auto_213590 ?auto_213591 ) ( ON ?auto_213589 ?auto_213590 ) ( CLEAR ?auto_213587 ) ( ON ?auto_213588 ?auto_213589 ) ( CLEAR ?auto_213588 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_213587 ?auto_213588 )
      ( MAKE-9PILE ?auto_213587 ?auto_213588 ?auto_213589 ?auto_213590 ?auto_213591 ?auto_213592 ?auto_213593 ?auto_213594 ?auto_213595 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_213606 - BLOCK
      ?auto_213607 - BLOCK
      ?auto_213608 - BLOCK
      ?auto_213609 - BLOCK
      ?auto_213610 - BLOCK
      ?auto_213611 - BLOCK
      ?auto_213612 - BLOCK
      ?auto_213613 - BLOCK
      ?auto_213614 - BLOCK
    )
    :vars
    (
      ?auto_213615 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_213614 ?auto_213615 ) ( ON-TABLE ?auto_213606 ) ( not ( = ?auto_213606 ?auto_213607 ) ) ( not ( = ?auto_213606 ?auto_213608 ) ) ( not ( = ?auto_213606 ?auto_213609 ) ) ( not ( = ?auto_213606 ?auto_213610 ) ) ( not ( = ?auto_213606 ?auto_213611 ) ) ( not ( = ?auto_213606 ?auto_213612 ) ) ( not ( = ?auto_213606 ?auto_213613 ) ) ( not ( = ?auto_213606 ?auto_213614 ) ) ( not ( = ?auto_213606 ?auto_213615 ) ) ( not ( = ?auto_213607 ?auto_213608 ) ) ( not ( = ?auto_213607 ?auto_213609 ) ) ( not ( = ?auto_213607 ?auto_213610 ) ) ( not ( = ?auto_213607 ?auto_213611 ) ) ( not ( = ?auto_213607 ?auto_213612 ) ) ( not ( = ?auto_213607 ?auto_213613 ) ) ( not ( = ?auto_213607 ?auto_213614 ) ) ( not ( = ?auto_213607 ?auto_213615 ) ) ( not ( = ?auto_213608 ?auto_213609 ) ) ( not ( = ?auto_213608 ?auto_213610 ) ) ( not ( = ?auto_213608 ?auto_213611 ) ) ( not ( = ?auto_213608 ?auto_213612 ) ) ( not ( = ?auto_213608 ?auto_213613 ) ) ( not ( = ?auto_213608 ?auto_213614 ) ) ( not ( = ?auto_213608 ?auto_213615 ) ) ( not ( = ?auto_213609 ?auto_213610 ) ) ( not ( = ?auto_213609 ?auto_213611 ) ) ( not ( = ?auto_213609 ?auto_213612 ) ) ( not ( = ?auto_213609 ?auto_213613 ) ) ( not ( = ?auto_213609 ?auto_213614 ) ) ( not ( = ?auto_213609 ?auto_213615 ) ) ( not ( = ?auto_213610 ?auto_213611 ) ) ( not ( = ?auto_213610 ?auto_213612 ) ) ( not ( = ?auto_213610 ?auto_213613 ) ) ( not ( = ?auto_213610 ?auto_213614 ) ) ( not ( = ?auto_213610 ?auto_213615 ) ) ( not ( = ?auto_213611 ?auto_213612 ) ) ( not ( = ?auto_213611 ?auto_213613 ) ) ( not ( = ?auto_213611 ?auto_213614 ) ) ( not ( = ?auto_213611 ?auto_213615 ) ) ( not ( = ?auto_213612 ?auto_213613 ) ) ( not ( = ?auto_213612 ?auto_213614 ) ) ( not ( = ?auto_213612 ?auto_213615 ) ) ( not ( = ?auto_213613 ?auto_213614 ) ) ( not ( = ?auto_213613 ?auto_213615 ) ) ( not ( = ?auto_213614 ?auto_213615 ) ) ( ON ?auto_213613 ?auto_213614 ) ( ON ?auto_213612 ?auto_213613 ) ( ON ?auto_213611 ?auto_213612 ) ( ON ?auto_213610 ?auto_213611 ) ( ON ?auto_213609 ?auto_213610 ) ( ON ?auto_213608 ?auto_213609 ) ( CLEAR ?auto_213606 ) ( ON ?auto_213607 ?auto_213608 ) ( CLEAR ?auto_213607 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_213606 ?auto_213607 )
      ( MAKE-9PILE ?auto_213606 ?auto_213607 ?auto_213608 ?auto_213609 ?auto_213610 ?auto_213611 ?auto_213612 ?auto_213613 ?auto_213614 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_213625 - BLOCK
      ?auto_213626 - BLOCK
      ?auto_213627 - BLOCK
      ?auto_213628 - BLOCK
      ?auto_213629 - BLOCK
      ?auto_213630 - BLOCK
      ?auto_213631 - BLOCK
      ?auto_213632 - BLOCK
      ?auto_213633 - BLOCK
    )
    :vars
    (
      ?auto_213634 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_213633 ?auto_213634 ) ( not ( = ?auto_213625 ?auto_213626 ) ) ( not ( = ?auto_213625 ?auto_213627 ) ) ( not ( = ?auto_213625 ?auto_213628 ) ) ( not ( = ?auto_213625 ?auto_213629 ) ) ( not ( = ?auto_213625 ?auto_213630 ) ) ( not ( = ?auto_213625 ?auto_213631 ) ) ( not ( = ?auto_213625 ?auto_213632 ) ) ( not ( = ?auto_213625 ?auto_213633 ) ) ( not ( = ?auto_213625 ?auto_213634 ) ) ( not ( = ?auto_213626 ?auto_213627 ) ) ( not ( = ?auto_213626 ?auto_213628 ) ) ( not ( = ?auto_213626 ?auto_213629 ) ) ( not ( = ?auto_213626 ?auto_213630 ) ) ( not ( = ?auto_213626 ?auto_213631 ) ) ( not ( = ?auto_213626 ?auto_213632 ) ) ( not ( = ?auto_213626 ?auto_213633 ) ) ( not ( = ?auto_213626 ?auto_213634 ) ) ( not ( = ?auto_213627 ?auto_213628 ) ) ( not ( = ?auto_213627 ?auto_213629 ) ) ( not ( = ?auto_213627 ?auto_213630 ) ) ( not ( = ?auto_213627 ?auto_213631 ) ) ( not ( = ?auto_213627 ?auto_213632 ) ) ( not ( = ?auto_213627 ?auto_213633 ) ) ( not ( = ?auto_213627 ?auto_213634 ) ) ( not ( = ?auto_213628 ?auto_213629 ) ) ( not ( = ?auto_213628 ?auto_213630 ) ) ( not ( = ?auto_213628 ?auto_213631 ) ) ( not ( = ?auto_213628 ?auto_213632 ) ) ( not ( = ?auto_213628 ?auto_213633 ) ) ( not ( = ?auto_213628 ?auto_213634 ) ) ( not ( = ?auto_213629 ?auto_213630 ) ) ( not ( = ?auto_213629 ?auto_213631 ) ) ( not ( = ?auto_213629 ?auto_213632 ) ) ( not ( = ?auto_213629 ?auto_213633 ) ) ( not ( = ?auto_213629 ?auto_213634 ) ) ( not ( = ?auto_213630 ?auto_213631 ) ) ( not ( = ?auto_213630 ?auto_213632 ) ) ( not ( = ?auto_213630 ?auto_213633 ) ) ( not ( = ?auto_213630 ?auto_213634 ) ) ( not ( = ?auto_213631 ?auto_213632 ) ) ( not ( = ?auto_213631 ?auto_213633 ) ) ( not ( = ?auto_213631 ?auto_213634 ) ) ( not ( = ?auto_213632 ?auto_213633 ) ) ( not ( = ?auto_213632 ?auto_213634 ) ) ( not ( = ?auto_213633 ?auto_213634 ) ) ( ON ?auto_213632 ?auto_213633 ) ( ON ?auto_213631 ?auto_213632 ) ( ON ?auto_213630 ?auto_213631 ) ( ON ?auto_213629 ?auto_213630 ) ( ON ?auto_213628 ?auto_213629 ) ( ON ?auto_213627 ?auto_213628 ) ( ON ?auto_213626 ?auto_213627 ) ( ON ?auto_213625 ?auto_213626 ) ( CLEAR ?auto_213625 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_213625 )
      ( MAKE-9PILE ?auto_213625 ?auto_213626 ?auto_213627 ?auto_213628 ?auto_213629 ?auto_213630 ?auto_213631 ?auto_213632 ?auto_213633 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_213644 - BLOCK
      ?auto_213645 - BLOCK
      ?auto_213646 - BLOCK
      ?auto_213647 - BLOCK
      ?auto_213648 - BLOCK
      ?auto_213649 - BLOCK
      ?auto_213650 - BLOCK
      ?auto_213651 - BLOCK
      ?auto_213652 - BLOCK
    )
    :vars
    (
      ?auto_213653 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_213652 ?auto_213653 ) ( not ( = ?auto_213644 ?auto_213645 ) ) ( not ( = ?auto_213644 ?auto_213646 ) ) ( not ( = ?auto_213644 ?auto_213647 ) ) ( not ( = ?auto_213644 ?auto_213648 ) ) ( not ( = ?auto_213644 ?auto_213649 ) ) ( not ( = ?auto_213644 ?auto_213650 ) ) ( not ( = ?auto_213644 ?auto_213651 ) ) ( not ( = ?auto_213644 ?auto_213652 ) ) ( not ( = ?auto_213644 ?auto_213653 ) ) ( not ( = ?auto_213645 ?auto_213646 ) ) ( not ( = ?auto_213645 ?auto_213647 ) ) ( not ( = ?auto_213645 ?auto_213648 ) ) ( not ( = ?auto_213645 ?auto_213649 ) ) ( not ( = ?auto_213645 ?auto_213650 ) ) ( not ( = ?auto_213645 ?auto_213651 ) ) ( not ( = ?auto_213645 ?auto_213652 ) ) ( not ( = ?auto_213645 ?auto_213653 ) ) ( not ( = ?auto_213646 ?auto_213647 ) ) ( not ( = ?auto_213646 ?auto_213648 ) ) ( not ( = ?auto_213646 ?auto_213649 ) ) ( not ( = ?auto_213646 ?auto_213650 ) ) ( not ( = ?auto_213646 ?auto_213651 ) ) ( not ( = ?auto_213646 ?auto_213652 ) ) ( not ( = ?auto_213646 ?auto_213653 ) ) ( not ( = ?auto_213647 ?auto_213648 ) ) ( not ( = ?auto_213647 ?auto_213649 ) ) ( not ( = ?auto_213647 ?auto_213650 ) ) ( not ( = ?auto_213647 ?auto_213651 ) ) ( not ( = ?auto_213647 ?auto_213652 ) ) ( not ( = ?auto_213647 ?auto_213653 ) ) ( not ( = ?auto_213648 ?auto_213649 ) ) ( not ( = ?auto_213648 ?auto_213650 ) ) ( not ( = ?auto_213648 ?auto_213651 ) ) ( not ( = ?auto_213648 ?auto_213652 ) ) ( not ( = ?auto_213648 ?auto_213653 ) ) ( not ( = ?auto_213649 ?auto_213650 ) ) ( not ( = ?auto_213649 ?auto_213651 ) ) ( not ( = ?auto_213649 ?auto_213652 ) ) ( not ( = ?auto_213649 ?auto_213653 ) ) ( not ( = ?auto_213650 ?auto_213651 ) ) ( not ( = ?auto_213650 ?auto_213652 ) ) ( not ( = ?auto_213650 ?auto_213653 ) ) ( not ( = ?auto_213651 ?auto_213652 ) ) ( not ( = ?auto_213651 ?auto_213653 ) ) ( not ( = ?auto_213652 ?auto_213653 ) ) ( ON ?auto_213651 ?auto_213652 ) ( ON ?auto_213650 ?auto_213651 ) ( ON ?auto_213649 ?auto_213650 ) ( ON ?auto_213648 ?auto_213649 ) ( ON ?auto_213647 ?auto_213648 ) ( ON ?auto_213646 ?auto_213647 ) ( ON ?auto_213645 ?auto_213646 ) ( ON ?auto_213644 ?auto_213645 ) ( CLEAR ?auto_213644 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_213644 )
      ( MAKE-9PILE ?auto_213644 ?auto_213645 ?auto_213646 ?auto_213647 ?auto_213648 ?auto_213649 ?auto_213650 ?auto_213651 ?auto_213652 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_213664 - BLOCK
      ?auto_213665 - BLOCK
      ?auto_213666 - BLOCK
      ?auto_213667 - BLOCK
      ?auto_213668 - BLOCK
      ?auto_213669 - BLOCK
      ?auto_213670 - BLOCK
      ?auto_213671 - BLOCK
      ?auto_213672 - BLOCK
      ?auto_213673 - BLOCK
    )
    :vars
    (
      ?auto_213674 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_213672 ) ( ON ?auto_213673 ?auto_213674 ) ( CLEAR ?auto_213673 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_213664 ) ( ON ?auto_213665 ?auto_213664 ) ( ON ?auto_213666 ?auto_213665 ) ( ON ?auto_213667 ?auto_213666 ) ( ON ?auto_213668 ?auto_213667 ) ( ON ?auto_213669 ?auto_213668 ) ( ON ?auto_213670 ?auto_213669 ) ( ON ?auto_213671 ?auto_213670 ) ( ON ?auto_213672 ?auto_213671 ) ( not ( = ?auto_213664 ?auto_213665 ) ) ( not ( = ?auto_213664 ?auto_213666 ) ) ( not ( = ?auto_213664 ?auto_213667 ) ) ( not ( = ?auto_213664 ?auto_213668 ) ) ( not ( = ?auto_213664 ?auto_213669 ) ) ( not ( = ?auto_213664 ?auto_213670 ) ) ( not ( = ?auto_213664 ?auto_213671 ) ) ( not ( = ?auto_213664 ?auto_213672 ) ) ( not ( = ?auto_213664 ?auto_213673 ) ) ( not ( = ?auto_213664 ?auto_213674 ) ) ( not ( = ?auto_213665 ?auto_213666 ) ) ( not ( = ?auto_213665 ?auto_213667 ) ) ( not ( = ?auto_213665 ?auto_213668 ) ) ( not ( = ?auto_213665 ?auto_213669 ) ) ( not ( = ?auto_213665 ?auto_213670 ) ) ( not ( = ?auto_213665 ?auto_213671 ) ) ( not ( = ?auto_213665 ?auto_213672 ) ) ( not ( = ?auto_213665 ?auto_213673 ) ) ( not ( = ?auto_213665 ?auto_213674 ) ) ( not ( = ?auto_213666 ?auto_213667 ) ) ( not ( = ?auto_213666 ?auto_213668 ) ) ( not ( = ?auto_213666 ?auto_213669 ) ) ( not ( = ?auto_213666 ?auto_213670 ) ) ( not ( = ?auto_213666 ?auto_213671 ) ) ( not ( = ?auto_213666 ?auto_213672 ) ) ( not ( = ?auto_213666 ?auto_213673 ) ) ( not ( = ?auto_213666 ?auto_213674 ) ) ( not ( = ?auto_213667 ?auto_213668 ) ) ( not ( = ?auto_213667 ?auto_213669 ) ) ( not ( = ?auto_213667 ?auto_213670 ) ) ( not ( = ?auto_213667 ?auto_213671 ) ) ( not ( = ?auto_213667 ?auto_213672 ) ) ( not ( = ?auto_213667 ?auto_213673 ) ) ( not ( = ?auto_213667 ?auto_213674 ) ) ( not ( = ?auto_213668 ?auto_213669 ) ) ( not ( = ?auto_213668 ?auto_213670 ) ) ( not ( = ?auto_213668 ?auto_213671 ) ) ( not ( = ?auto_213668 ?auto_213672 ) ) ( not ( = ?auto_213668 ?auto_213673 ) ) ( not ( = ?auto_213668 ?auto_213674 ) ) ( not ( = ?auto_213669 ?auto_213670 ) ) ( not ( = ?auto_213669 ?auto_213671 ) ) ( not ( = ?auto_213669 ?auto_213672 ) ) ( not ( = ?auto_213669 ?auto_213673 ) ) ( not ( = ?auto_213669 ?auto_213674 ) ) ( not ( = ?auto_213670 ?auto_213671 ) ) ( not ( = ?auto_213670 ?auto_213672 ) ) ( not ( = ?auto_213670 ?auto_213673 ) ) ( not ( = ?auto_213670 ?auto_213674 ) ) ( not ( = ?auto_213671 ?auto_213672 ) ) ( not ( = ?auto_213671 ?auto_213673 ) ) ( not ( = ?auto_213671 ?auto_213674 ) ) ( not ( = ?auto_213672 ?auto_213673 ) ) ( not ( = ?auto_213672 ?auto_213674 ) ) ( not ( = ?auto_213673 ?auto_213674 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_213673 ?auto_213674 )
      ( !STACK ?auto_213673 ?auto_213672 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_213685 - BLOCK
      ?auto_213686 - BLOCK
      ?auto_213687 - BLOCK
      ?auto_213688 - BLOCK
      ?auto_213689 - BLOCK
      ?auto_213690 - BLOCK
      ?auto_213691 - BLOCK
      ?auto_213692 - BLOCK
      ?auto_213693 - BLOCK
      ?auto_213694 - BLOCK
    )
    :vars
    (
      ?auto_213695 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_213693 ) ( ON ?auto_213694 ?auto_213695 ) ( CLEAR ?auto_213694 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_213685 ) ( ON ?auto_213686 ?auto_213685 ) ( ON ?auto_213687 ?auto_213686 ) ( ON ?auto_213688 ?auto_213687 ) ( ON ?auto_213689 ?auto_213688 ) ( ON ?auto_213690 ?auto_213689 ) ( ON ?auto_213691 ?auto_213690 ) ( ON ?auto_213692 ?auto_213691 ) ( ON ?auto_213693 ?auto_213692 ) ( not ( = ?auto_213685 ?auto_213686 ) ) ( not ( = ?auto_213685 ?auto_213687 ) ) ( not ( = ?auto_213685 ?auto_213688 ) ) ( not ( = ?auto_213685 ?auto_213689 ) ) ( not ( = ?auto_213685 ?auto_213690 ) ) ( not ( = ?auto_213685 ?auto_213691 ) ) ( not ( = ?auto_213685 ?auto_213692 ) ) ( not ( = ?auto_213685 ?auto_213693 ) ) ( not ( = ?auto_213685 ?auto_213694 ) ) ( not ( = ?auto_213685 ?auto_213695 ) ) ( not ( = ?auto_213686 ?auto_213687 ) ) ( not ( = ?auto_213686 ?auto_213688 ) ) ( not ( = ?auto_213686 ?auto_213689 ) ) ( not ( = ?auto_213686 ?auto_213690 ) ) ( not ( = ?auto_213686 ?auto_213691 ) ) ( not ( = ?auto_213686 ?auto_213692 ) ) ( not ( = ?auto_213686 ?auto_213693 ) ) ( not ( = ?auto_213686 ?auto_213694 ) ) ( not ( = ?auto_213686 ?auto_213695 ) ) ( not ( = ?auto_213687 ?auto_213688 ) ) ( not ( = ?auto_213687 ?auto_213689 ) ) ( not ( = ?auto_213687 ?auto_213690 ) ) ( not ( = ?auto_213687 ?auto_213691 ) ) ( not ( = ?auto_213687 ?auto_213692 ) ) ( not ( = ?auto_213687 ?auto_213693 ) ) ( not ( = ?auto_213687 ?auto_213694 ) ) ( not ( = ?auto_213687 ?auto_213695 ) ) ( not ( = ?auto_213688 ?auto_213689 ) ) ( not ( = ?auto_213688 ?auto_213690 ) ) ( not ( = ?auto_213688 ?auto_213691 ) ) ( not ( = ?auto_213688 ?auto_213692 ) ) ( not ( = ?auto_213688 ?auto_213693 ) ) ( not ( = ?auto_213688 ?auto_213694 ) ) ( not ( = ?auto_213688 ?auto_213695 ) ) ( not ( = ?auto_213689 ?auto_213690 ) ) ( not ( = ?auto_213689 ?auto_213691 ) ) ( not ( = ?auto_213689 ?auto_213692 ) ) ( not ( = ?auto_213689 ?auto_213693 ) ) ( not ( = ?auto_213689 ?auto_213694 ) ) ( not ( = ?auto_213689 ?auto_213695 ) ) ( not ( = ?auto_213690 ?auto_213691 ) ) ( not ( = ?auto_213690 ?auto_213692 ) ) ( not ( = ?auto_213690 ?auto_213693 ) ) ( not ( = ?auto_213690 ?auto_213694 ) ) ( not ( = ?auto_213690 ?auto_213695 ) ) ( not ( = ?auto_213691 ?auto_213692 ) ) ( not ( = ?auto_213691 ?auto_213693 ) ) ( not ( = ?auto_213691 ?auto_213694 ) ) ( not ( = ?auto_213691 ?auto_213695 ) ) ( not ( = ?auto_213692 ?auto_213693 ) ) ( not ( = ?auto_213692 ?auto_213694 ) ) ( not ( = ?auto_213692 ?auto_213695 ) ) ( not ( = ?auto_213693 ?auto_213694 ) ) ( not ( = ?auto_213693 ?auto_213695 ) ) ( not ( = ?auto_213694 ?auto_213695 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_213694 ?auto_213695 )
      ( !STACK ?auto_213694 ?auto_213693 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_213706 - BLOCK
      ?auto_213707 - BLOCK
      ?auto_213708 - BLOCK
      ?auto_213709 - BLOCK
      ?auto_213710 - BLOCK
      ?auto_213711 - BLOCK
      ?auto_213712 - BLOCK
      ?auto_213713 - BLOCK
      ?auto_213714 - BLOCK
      ?auto_213715 - BLOCK
    )
    :vars
    (
      ?auto_213716 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_213715 ?auto_213716 ) ( ON-TABLE ?auto_213706 ) ( ON ?auto_213707 ?auto_213706 ) ( ON ?auto_213708 ?auto_213707 ) ( ON ?auto_213709 ?auto_213708 ) ( ON ?auto_213710 ?auto_213709 ) ( ON ?auto_213711 ?auto_213710 ) ( ON ?auto_213712 ?auto_213711 ) ( ON ?auto_213713 ?auto_213712 ) ( not ( = ?auto_213706 ?auto_213707 ) ) ( not ( = ?auto_213706 ?auto_213708 ) ) ( not ( = ?auto_213706 ?auto_213709 ) ) ( not ( = ?auto_213706 ?auto_213710 ) ) ( not ( = ?auto_213706 ?auto_213711 ) ) ( not ( = ?auto_213706 ?auto_213712 ) ) ( not ( = ?auto_213706 ?auto_213713 ) ) ( not ( = ?auto_213706 ?auto_213714 ) ) ( not ( = ?auto_213706 ?auto_213715 ) ) ( not ( = ?auto_213706 ?auto_213716 ) ) ( not ( = ?auto_213707 ?auto_213708 ) ) ( not ( = ?auto_213707 ?auto_213709 ) ) ( not ( = ?auto_213707 ?auto_213710 ) ) ( not ( = ?auto_213707 ?auto_213711 ) ) ( not ( = ?auto_213707 ?auto_213712 ) ) ( not ( = ?auto_213707 ?auto_213713 ) ) ( not ( = ?auto_213707 ?auto_213714 ) ) ( not ( = ?auto_213707 ?auto_213715 ) ) ( not ( = ?auto_213707 ?auto_213716 ) ) ( not ( = ?auto_213708 ?auto_213709 ) ) ( not ( = ?auto_213708 ?auto_213710 ) ) ( not ( = ?auto_213708 ?auto_213711 ) ) ( not ( = ?auto_213708 ?auto_213712 ) ) ( not ( = ?auto_213708 ?auto_213713 ) ) ( not ( = ?auto_213708 ?auto_213714 ) ) ( not ( = ?auto_213708 ?auto_213715 ) ) ( not ( = ?auto_213708 ?auto_213716 ) ) ( not ( = ?auto_213709 ?auto_213710 ) ) ( not ( = ?auto_213709 ?auto_213711 ) ) ( not ( = ?auto_213709 ?auto_213712 ) ) ( not ( = ?auto_213709 ?auto_213713 ) ) ( not ( = ?auto_213709 ?auto_213714 ) ) ( not ( = ?auto_213709 ?auto_213715 ) ) ( not ( = ?auto_213709 ?auto_213716 ) ) ( not ( = ?auto_213710 ?auto_213711 ) ) ( not ( = ?auto_213710 ?auto_213712 ) ) ( not ( = ?auto_213710 ?auto_213713 ) ) ( not ( = ?auto_213710 ?auto_213714 ) ) ( not ( = ?auto_213710 ?auto_213715 ) ) ( not ( = ?auto_213710 ?auto_213716 ) ) ( not ( = ?auto_213711 ?auto_213712 ) ) ( not ( = ?auto_213711 ?auto_213713 ) ) ( not ( = ?auto_213711 ?auto_213714 ) ) ( not ( = ?auto_213711 ?auto_213715 ) ) ( not ( = ?auto_213711 ?auto_213716 ) ) ( not ( = ?auto_213712 ?auto_213713 ) ) ( not ( = ?auto_213712 ?auto_213714 ) ) ( not ( = ?auto_213712 ?auto_213715 ) ) ( not ( = ?auto_213712 ?auto_213716 ) ) ( not ( = ?auto_213713 ?auto_213714 ) ) ( not ( = ?auto_213713 ?auto_213715 ) ) ( not ( = ?auto_213713 ?auto_213716 ) ) ( not ( = ?auto_213714 ?auto_213715 ) ) ( not ( = ?auto_213714 ?auto_213716 ) ) ( not ( = ?auto_213715 ?auto_213716 ) ) ( CLEAR ?auto_213713 ) ( ON ?auto_213714 ?auto_213715 ) ( CLEAR ?auto_213714 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_213706 ?auto_213707 ?auto_213708 ?auto_213709 ?auto_213710 ?auto_213711 ?auto_213712 ?auto_213713 ?auto_213714 )
      ( MAKE-10PILE ?auto_213706 ?auto_213707 ?auto_213708 ?auto_213709 ?auto_213710 ?auto_213711 ?auto_213712 ?auto_213713 ?auto_213714 ?auto_213715 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_213727 - BLOCK
      ?auto_213728 - BLOCK
      ?auto_213729 - BLOCK
      ?auto_213730 - BLOCK
      ?auto_213731 - BLOCK
      ?auto_213732 - BLOCK
      ?auto_213733 - BLOCK
      ?auto_213734 - BLOCK
      ?auto_213735 - BLOCK
      ?auto_213736 - BLOCK
    )
    :vars
    (
      ?auto_213737 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_213736 ?auto_213737 ) ( ON-TABLE ?auto_213727 ) ( ON ?auto_213728 ?auto_213727 ) ( ON ?auto_213729 ?auto_213728 ) ( ON ?auto_213730 ?auto_213729 ) ( ON ?auto_213731 ?auto_213730 ) ( ON ?auto_213732 ?auto_213731 ) ( ON ?auto_213733 ?auto_213732 ) ( ON ?auto_213734 ?auto_213733 ) ( not ( = ?auto_213727 ?auto_213728 ) ) ( not ( = ?auto_213727 ?auto_213729 ) ) ( not ( = ?auto_213727 ?auto_213730 ) ) ( not ( = ?auto_213727 ?auto_213731 ) ) ( not ( = ?auto_213727 ?auto_213732 ) ) ( not ( = ?auto_213727 ?auto_213733 ) ) ( not ( = ?auto_213727 ?auto_213734 ) ) ( not ( = ?auto_213727 ?auto_213735 ) ) ( not ( = ?auto_213727 ?auto_213736 ) ) ( not ( = ?auto_213727 ?auto_213737 ) ) ( not ( = ?auto_213728 ?auto_213729 ) ) ( not ( = ?auto_213728 ?auto_213730 ) ) ( not ( = ?auto_213728 ?auto_213731 ) ) ( not ( = ?auto_213728 ?auto_213732 ) ) ( not ( = ?auto_213728 ?auto_213733 ) ) ( not ( = ?auto_213728 ?auto_213734 ) ) ( not ( = ?auto_213728 ?auto_213735 ) ) ( not ( = ?auto_213728 ?auto_213736 ) ) ( not ( = ?auto_213728 ?auto_213737 ) ) ( not ( = ?auto_213729 ?auto_213730 ) ) ( not ( = ?auto_213729 ?auto_213731 ) ) ( not ( = ?auto_213729 ?auto_213732 ) ) ( not ( = ?auto_213729 ?auto_213733 ) ) ( not ( = ?auto_213729 ?auto_213734 ) ) ( not ( = ?auto_213729 ?auto_213735 ) ) ( not ( = ?auto_213729 ?auto_213736 ) ) ( not ( = ?auto_213729 ?auto_213737 ) ) ( not ( = ?auto_213730 ?auto_213731 ) ) ( not ( = ?auto_213730 ?auto_213732 ) ) ( not ( = ?auto_213730 ?auto_213733 ) ) ( not ( = ?auto_213730 ?auto_213734 ) ) ( not ( = ?auto_213730 ?auto_213735 ) ) ( not ( = ?auto_213730 ?auto_213736 ) ) ( not ( = ?auto_213730 ?auto_213737 ) ) ( not ( = ?auto_213731 ?auto_213732 ) ) ( not ( = ?auto_213731 ?auto_213733 ) ) ( not ( = ?auto_213731 ?auto_213734 ) ) ( not ( = ?auto_213731 ?auto_213735 ) ) ( not ( = ?auto_213731 ?auto_213736 ) ) ( not ( = ?auto_213731 ?auto_213737 ) ) ( not ( = ?auto_213732 ?auto_213733 ) ) ( not ( = ?auto_213732 ?auto_213734 ) ) ( not ( = ?auto_213732 ?auto_213735 ) ) ( not ( = ?auto_213732 ?auto_213736 ) ) ( not ( = ?auto_213732 ?auto_213737 ) ) ( not ( = ?auto_213733 ?auto_213734 ) ) ( not ( = ?auto_213733 ?auto_213735 ) ) ( not ( = ?auto_213733 ?auto_213736 ) ) ( not ( = ?auto_213733 ?auto_213737 ) ) ( not ( = ?auto_213734 ?auto_213735 ) ) ( not ( = ?auto_213734 ?auto_213736 ) ) ( not ( = ?auto_213734 ?auto_213737 ) ) ( not ( = ?auto_213735 ?auto_213736 ) ) ( not ( = ?auto_213735 ?auto_213737 ) ) ( not ( = ?auto_213736 ?auto_213737 ) ) ( CLEAR ?auto_213734 ) ( ON ?auto_213735 ?auto_213736 ) ( CLEAR ?auto_213735 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_213727 ?auto_213728 ?auto_213729 ?auto_213730 ?auto_213731 ?auto_213732 ?auto_213733 ?auto_213734 ?auto_213735 )
      ( MAKE-10PILE ?auto_213727 ?auto_213728 ?auto_213729 ?auto_213730 ?auto_213731 ?auto_213732 ?auto_213733 ?auto_213734 ?auto_213735 ?auto_213736 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_213748 - BLOCK
      ?auto_213749 - BLOCK
      ?auto_213750 - BLOCK
      ?auto_213751 - BLOCK
      ?auto_213752 - BLOCK
      ?auto_213753 - BLOCK
      ?auto_213754 - BLOCK
      ?auto_213755 - BLOCK
      ?auto_213756 - BLOCK
      ?auto_213757 - BLOCK
    )
    :vars
    (
      ?auto_213758 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_213757 ?auto_213758 ) ( ON-TABLE ?auto_213748 ) ( ON ?auto_213749 ?auto_213748 ) ( ON ?auto_213750 ?auto_213749 ) ( ON ?auto_213751 ?auto_213750 ) ( ON ?auto_213752 ?auto_213751 ) ( ON ?auto_213753 ?auto_213752 ) ( ON ?auto_213754 ?auto_213753 ) ( not ( = ?auto_213748 ?auto_213749 ) ) ( not ( = ?auto_213748 ?auto_213750 ) ) ( not ( = ?auto_213748 ?auto_213751 ) ) ( not ( = ?auto_213748 ?auto_213752 ) ) ( not ( = ?auto_213748 ?auto_213753 ) ) ( not ( = ?auto_213748 ?auto_213754 ) ) ( not ( = ?auto_213748 ?auto_213755 ) ) ( not ( = ?auto_213748 ?auto_213756 ) ) ( not ( = ?auto_213748 ?auto_213757 ) ) ( not ( = ?auto_213748 ?auto_213758 ) ) ( not ( = ?auto_213749 ?auto_213750 ) ) ( not ( = ?auto_213749 ?auto_213751 ) ) ( not ( = ?auto_213749 ?auto_213752 ) ) ( not ( = ?auto_213749 ?auto_213753 ) ) ( not ( = ?auto_213749 ?auto_213754 ) ) ( not ( = ?auto_213749 ?auto_213755 ) ) ( not ( = ?auto_213749 ?auto_213756 ) ) ( not ( = ?auto_213749 ?auto_213757 ) ) ( not ( = ?auto_213749 ?auto_213758 ) ) ( not ( = ?auto_213750 ?auto_213751 ) ) ( not ( = ?auto_213750 ?auto_213752 ) ) ( not ( = ?auto_213750 ?auto_213753 ) ) ( not ( = ?auto_213750 ?auto_213754 ) ) ( not ( = ?auto_213750 ?auto_213755 ) ) ( not ( = ?auto_213750 ?auto_213756 ) ) ( not ( = ?auto_213750 ?auto_213757 ) ) ( not ( = ?auto_213750 ?auto_213758 ) ) ( not ( = ?auto_213751 ?auto_213752 ) ) ( not ( = ?auto_213751 ?auto_213753 ) ) ( not ( = ?auto_213751 ?auto_213754 ) ) ( not ( = ?auto_213751 ?auto_213755 ) ) ( not ( = ?auto_213751 ?auto_213756 ) ) ( not ( = ?auto_213751 ?auto_213757 ) ) ( not ( = ?auto_213751 ?auto_213758 ) ) ( not ( = ?auto_213752 ?auto_213753 ) ) ( not ( = ?auto_213752 ?auto_213754 ) ) ( not ( = ?auto_213752 ?auto_213755 ) ) ( not ( = ?auto_213752 ?auto_213756 ) ) ( not ( = ?auto_213752 ?auto_213757 ) ) ( not ( = ?auto_213752 ?auto_213758 ) ) ( not ( = ?auto_213753 ?auto_213754 ) ) ( not ( = ?auto_213753 ?auto_213755 ) ) ( not ( = ?auto_213753 ?auto_213756 ) ) ( not ( = ?auto_213753 ?auto_213757 ) ) ( not ( = ?auto_213753 ?auto_213758 ) ) ( not ( = ?auto_213754 ?auto_213755 ) ) ( not ( = ?auto_213754 ?auto_213756 ) ) ( not ( = ?auto_213754 ?auto_213757 ) ) ( not ( = ?auto_213754 ?auto_213758 ) ) ( not ( = ?auto_213755 ?auto_213756 ) ) ( not ( = ?auto_213755 ?auto_213757 ) ) ( not ( = ?auto_213755 ?auto_213758 ) ) ( not ( = ?auto_213756 ?auto_213757 ) ) ( not ( = ?auto_213756 ?auto_213758 ) ) ( not ( = ?auto_213757 ?auto_213758 ) ) ( ON ?auto_213756 ?auto_213757 ) ( CLEAR ?auto_213754 ) ( ON ?auto_213755 ?auto_213756 ) ( CLEAR ?auto_213755 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_213748 ?auto_213749 ?auto_213750 ?auto_213751 ?auto_213752 ?auto_213753 ?auto_213754 ?auto_213755 )
      ( MAKE-10PILE ?auto_213748 ?auto_213749 ?auto_213750 ?auto_213751 ?auto_213752 ?auto_213753 ?auto_213754 ?auto_213755 ?auto_213756 ?auto_213757 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_213769 - BLOCK
      ?auto_213770 - BLOCK
      ?auto_213771 - BLOCK
      ?auto_213772 - BLOCK
      ?auto_213773 - BLOCK
      ?auto_213774 - BLOCK
      ?auto_213775 - BLOCK
      ?auto_213776 - BLOCK
      ?auto_213777 - BLOCK
      ?auto_213778 - BLOCK
    )
    :vars
    (
      ?auto_213779 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_213778 ?auto_213779 ) ( ON-TABLE ?auto_213769 ) ( ON ?auto_213770 ?auto_213769 ) ( ON ?auto_213771 ?auto_213770 ) ( ON ?auto_213772 ?auto_213771 ) ( ON ?auto_213773 ?auto_213772 ) ( ON ?auto_213774 ?auto_213773 ) ( ON ?auto_213775 ?auto_213774 ) ( not ( = ?auto_213769 ?auto_213770 ) ) ( not ( = ?auto_213769 ?auto_213771 ) ) ( not ( = ?auto_213769 ?auto_213772 ) ) ( not ( = ?auto_213769 ?auto_213773 ) ) ( not ( = ?auto_213769 ?auto_213774 ) ) ( not ( = ?auto_213769 ?auto_213775 ) ) ( not ( = ?auto_213769 ?auto_213776 ) ) ( not ( = ?auto_213769 ?auto_213777 ) ) ( not ( = ?auto_213769 ?auto_213778 ) ) ( not ( = ?auto_213769 ?auto_213779 ) ) ( not ( = ?auto_213770 ?auto_213771 ) ) ( not ( = ?auto_213770 ?auto_213772 ) ) ( not ( = ?auto_213770 ?auto_213773 ) ) ( not ( = ?auto_213770 ?auto_213774 ) ) ( not ( = ?auto_213770 ?auto_213775 ) ) ( not ( = ?auto_213770 ?auto_213776 ) ) ( not ( = ?auto_213770 ?auto_213777 ) ) ( not ( = ?auto_213770 ?auto_213778 ) ) ( not ( = ?auto_213770 ?auto_213779 ) ) ( not ( = ?auto_213771 ?auto_213772 ) ) ( not ( = ?auto_213771 ?auto_213773 ) ) ( not ( = ?auto_213771 ?auto_213774 ) ) ( not ( = ?auto_213771 ?auto_213775 ) ) ( not ( = ?auto_213771 ?auto_213776 ) ) ( not ( = ?auto_213771 ?auto_213777 ) ) ( not ( = ?auto_213771 ?auto_213778 ) ) ( not ( = ?auto_213771 ?auto_213779 ) ) ( not ( = ?auto_213772 ?auto_213773 ) ) ( not ( = ?auto_213772 ?auto_213774 ) ) ( not ( = ?auto_213772 ?auto_213775 ) ) ( not ( = ?auto_213772 ?auto_213776 ) ) ( not ( = ?auto_213772 ?auto_213777 ) ) ( not ( = ?auto_213772 ?auto_213778 ) ) ( not ( = ?auto_213772 ?auto_213779 ) ) ( not ( = ?auto_213773 ?auto_213774 ) ) ( not ( = ?auto_213773 ?auto_213775 ) ) ( not ( = ?auto_213773 ?auto_213776 ) ) ( not ( = ?auto_213773 ?auto_213777 ) ) ( not ( = ?auto_213773 ?auto_213778 ) ) ( not ( = ?auto_213773 ?auto_213779 ) ) ( not ( = ?auto_213774 ?auto_213775 ) ) ( not ( = ?auto_213774 ?auto_213776 ) ) ( not ( = ?auto_213774 ?auto_213777 ) ) ( not ( = ?auto_213774 ?auto_213778 ) ) ( not ( = ?auto_213774 ?auto_213779 ) ) ( not ( = ?auto_213775 ?auto_213776 ) ) ( not ( = ?auto_213775 ?auto_213777 ) ) ( not ( = ?auto_213775 ?auto_213778 ) ) ( not ( = ?auto_213775 ?auto_213779 ) ) ( not ( = ?auto_213776 ?auto_213777 ) ) ( not ( = ?auto_213776 ?auto_213778 ) ) ( not ( = ?auto_213776 ?auto_213779 ) ) ( not ( = ?auto_213777 ?auto_213778 ) ) ( not ( = ?auto_213777 ?auto_213779 ) ) ( not ( = ?auto_213778 ?auto_213779 ) ) ( ON ?auto_213777 ?auto_213778 ) ( CLEAR ?auto_213775 ) ( ON ?auto_213776 ?auto_213777 ) ( CLEAR ?auto_213776 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_213769 ?auto_213770 ?auto_213771 ?auto_213772 ?auto_213773 ?auto_213774 ?auto_213775 ?auto_213776 )
      ( MAKE-10PILE ?auto_213769 ?auto_213770 ?auto_213771 ?auto_213772 ?auto_213773 ?auto_213774 ?auto_213775 ?auto_213776 ?auto_213777 ?auto_213778 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_213790 - BLOCK
      ?auto_213791 - BLOCK
      ?auto_213792 - BLOCK
      ?auto_213793 - BLOCK
      ?auto_213794 - BLOCK
      ?auto_213795 - BLOCK
      ?auto_213796 - BLOCK
      ?auto_213797 - BLOCK
      ?auto_213798 - BLOCK
      ?auto_213799 - BLOCK
    )
    :vars
    (
      ?auto_213800 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_213799 ?auto_213800 ) ( ON-TABLE ?auto_213790 ) ( ON ?auto_213791 ?auto_213790 ) ( ON ?auto_213792 ?auto_213791 ) ( ON ?auto_213793 ?auto_213792 ) ( ON ?auto_213794 ?auto_213793 ) ( ON ?auto_213795 ?auto_213794 ) ( not ( = ?auto_213790 ?auto_213791 ) ) ( not ( = ?auto_213790 ?auto_213792 ) ) ( not ( = ?auto_213790 ?auto_213793 ) ) ( not ( = ?auto_213790 ?auto_213794 ) ) ( not ( = ?auto_213790 ?auto_213795 ) ) ( not ( = ?auto_213790 ?auto_213796 ) ) ( not ( = ?auto_213790 ?auto_213797 ) ) ( not ( = ?auto_213790 ?auto_213798 ) ) ( not ( = ?auto_213790 ?auto_213799 ) ) ( not ( = ?auto_213790 ?auto_213800 ) ) ( not ( = ?auto_213791 ?auto_213792 ) ) ( not ( = ?auto_213791 ?auto_213793 ) ) ( not ( = ?auto_213791 ?auto_213794 ) ) ( not ( = ?auto_213791 ?auto_213795 ) ) ( not ( = ?auto_213791 ?auto_213796 ) ) ( not ( = ?auto_213791 ?auto_213797 ) ) ( not ( = ?auto_213791 ?auto_213798 ) ) ( not ( = ?auto_213791 ?auto_213799 ) ) ( not ( = ?auto_213791 ?auto_213800 ) ) ( not ( = ?auto_213792 ?auto_213793 ) ) ( not ( = ?auto_213792 ?auto_213794 ) ) ( not ( = ?auto_213792 ?auto_213795 ) ) ( not ( = ?auto_213792 ?auto_213796 ) ) ( not ( = ?auto_213792 ?auto_213797 ) ) ( not ( = ?auto_213792 ?auto_213798 ) ) ( not ( = ?auto_213792 ?auto_213799 ) ) ( not ( = ?auto_213792 ?auto_213800 ) ) ( not ( = ?auto_213793 ?auto_213794 ) ) ( not ( = ?auto_213793 ?auto_213795 ) ) ( not ( = ?auto_213793 ?auto_213796 ) ) ( not ( = ?auto_213793 ?auto_213797 ) ) ( not ( = ?auto_213793 ?auto_213798 ) ) ( not ( = ?auto_213793 ?auto_213799 ) ) ( not ( = ?auto_213793 ?auto_213800 ) ) ( not ( = ?auto_213794 ?auto_213795 ) ) ( not ( = ?auto_213794 ?auto_213796 ) ) ( not ( = ?auto_213794 ?auto_213797 ) ) ( not ( = ?auto_213794 ?auto_213798 ) ) ( not ( = ?auto_213794 ?auto_213799 ) ) ( not ( = ?auto_213794 ?auto_213800 ) ) ( not ( = ?auto_213795 ?auto_213796 ) ) ( not ( = ?auto_213795 ?auto_213797 ) ) ( not ( = ?auto_213795 ?auto_213798 ) ) ( not ( = ?auto_213795 ?auto_213799 ) ) ( not ( = ?auto_213795 ?auto_213800 ) ) ( not ( = ?auto_213796 ?auto_213797 ) ) ( not ( = ?auto_213796 ?auto_213798 ) ) ( not ( = ?auto_213796 ?auto_213799 ) ) ( not ( = ?auto_213796 ?auto_213800 ) ) ( not ( = ?auto_213797 ?auto_213798 ) ) ( not ( = ?auto_213797 ?auto_213799 ) ) ( not ( = ?auto_213797 ?auto_213800 ) ) ( not ( = ?auto_213798 ?auto_213799 ) ) ( not ( = ?auto_213798 ?auto_213800 ) ) ( not ( = ?auto_213799 ?auto_213800 ) ) ( ON ?auto_213798 ?auto_213799 ) ( ON ?auto_213797 ?auto_213798 ) ( CLEAR ?auto_213795 ) ( ON ?auto_213796 ?auto_213797 ) ( CLEAR ?auto_213796 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_213790 ?auto_213791 ?auto_213792 ?auto_213793 ?auto_213794 ?auto_213795 ?auto_213796 )
      ( MAKE-10PILE ?auto_213790 ?auto_213791 ?auto_213792 ?auto_213793 ?auto_213794 ?auto_213795 ?auto_213796 ?auto_213797 ?auto_213798 ?auto_213799 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_213811 - BLOCK
      ?auto_213812 - BLOCK
      ?auto_213813 - BLOCK
      ?auto_213814 - BLOCK
      ?auto_213815 - BLOCK
      ?auto_213816 - BLOCK
      ?auto_213817 - BLOCK
      ?auto_213818 - BLOCK
      ?auto_213819 - BLOCK
      ?auto_213820 - BLOCK
    )
    :vars
    (
      ?auto_213821 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_213820 ?auto_213821 ) ( ON-TABLE ?auto_213811 ) ( ON ?auto_213812 ?auto_213811 ) ( ON ?auto_213813 ?auto_213812 ) ( ON ?auto_213814 ?auto_213813 ) ( ON ?auto_213815 ?auto_213814 ) ( ON ?auto_213816 ?auto_213815 ) ( not ( = ?auto_213811 ?auto_213812 ) ) ( not ( = ?auto_213811 ?auto_213813 ) ) ( not ( = ?auto_213811 ?auto_213814 ) ) ( not ( = ?auto_213811 ?auto_213815 ) ) ( not ( = ?auto_213811 ?auto_213816 ) ) ( not ( = ?auto_213811 ?auto_213817 ) ) ( not ( = ?auto_213811 ?auto_213818 ) ) ( not ( = ?auto_213811 ?auto_213819 ) ) ( not ( = ?auto_213811 ?auto_213820 ) ) ( not ( = ?auto_213811 ?auto_213821 ) ) ( not ( = ?auto_213812 ?auto_213813 ) ) ( not ( = ?auto_213812 ?auto_213814 ) ) ( not ( = ?auto_213812 ?auto_213815 ) ) ( not ( = ?auto_213812 ?auto_213816 ) ) ( not ( = ?auto_213812 ?auto_213817 ) ) ( not ( = ?auto_213812 ?auto_213818 ) ) ( not ( = ?auto_213812 ?auto_213819 ) ) ( not ( = ?auto_213812 ?auto_213820 ) ) ( not ( = ?auto_213812 ?auto_213821 ) ) ( not ( = ?auto_213813 ?auto_213814 ) ) ( not ( = ?auto_213813 ?auto_213815 ) ) ( not ( = ?auto_213813 ?auto_213816 ) ) ( not ( = ?auto_213813 ?auto_213817 ) ) ( not ( = ?auto_213813 ?auto_213818 ) ) ( not ( = ?auto_213813 ?auto_213819 ) ) ( not ( = ?auto_213813 ?auto_213820 ) ) ( not ( = ?auto_213813 ?auto_213821 ) ) ( not ( = ?auto_213814 ?auto_213815 ) ) ( not ( = ?auto_213814 ?auto_213816 ) ) ( not ( = ?auto_213814 ?auto_213817 ) ) ( not ( = ?auto_213814 ?auto_213818 ) ) ( not ( = ?auto_213814 ?auto_213819 ) ) ( not ( = ?auto_213814 ?auto_213820 ) ) ( not ( = ?auto_213814 ?auto_213821 ) ) ( not ( = ?auto_213815 ?auto_213816 ) ) ( not ( = ?auto_213815 ?auto_213817 ) ) ( not ( = ?auto_213815 ?auto_213818 ) ) ( not ( = ?auto_213815 ?auto_213819 ) ) ( not ( = ?auto_213815 ?auto_213820 ) ) ( not ( = ?auto_213815 ?auto_213821 ) ) ( not ( = ?auto_213816 ?auto_213817 ) ) ( not ( = ?auto_213816 ?auto_213818 ) ) ( not ( = ?auto_213816 ?auto_213819 ) ) ( not ( = ?auto_213816 ?auto_213820 ) ) ( not ( = ?auto_213816 ?auto_213821 ) ) ( not ( = ?auto_213817 ?auto_213818 ) ) ( not ( = ?auto_213817 ?auto_213819 ) ) ( not ( = ?auto_213817 ?auto_213820 ) ) ( not ( = ?auto_213817 ?auto_213821 ) ) ( not ( = ?auto_213818 ?auto_213819 ) ) ( not ( = ?auto_213818 ?auto_213820 ) ) ( not ( = ?auto_213818 ?auto_213821 ) ) ( not ( = ?auto_213819 ?auto_213820 ) ) ( not ( = ?auto_213819 ?auto_213821 ) ) ( not ( = ?auto_213820 ?auto_213821 ) ) ( ON ?auto_213819 ?auto_213820 ) ( ON ?auto_213818 ?auto_213819 ) ( CLEAR ?auto_213816 ) ( ON ?auto_213817 ?auto_213818 ) ( CLEAR ?auto_213817 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_213811 ?auto_213812 ?auto_213813 ?auto_213814 ?auto_213815 ?auto_213816 ?auto_213817 )
      ( MAKE-10PILE ?auto_213811 ?auto_213812 ?auto_213813 ?auto_213814 ?auto_213815 ?auto_213816 ?auto_213817 ?auto_213818 ?auto_213819 ?auto_213820 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_213832 - BLOCK
      ?auto_213833 - BLOCK
      ?auto_213834 - BLOCK
      ?auto_213835 - BLOCK
      ?auto_213836 - BLOCK
      ?auto_213837 - BLOCK
      ?auto_213838 - BLOCK
      ?auto_213839 - BLOCK
      ?auto_213840 - BLOCK
      ?auto_213841 - BLOCK
    )
    :vars
    (
      ?auto_213842 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_213841 ?auto_213842 ) ( ON-TABLE ?auto_213832 ) ( ON ?auto_213833 ?auto_213832 ) ( ON ?auto_213834 ?auto_213833 ) ( ON ?auto_213835 ?auto_213834 ) ( ON ?auto_213836 ?auto_213835 ) ( not ( = ?auto_213832 ?auto_213833 ) ) ( not ( = ?auto_213832 ?auto_213834 ) ) ( not ( = ?auto_213832 ?auto_213835 ) ) ( not ( = ?auto_213832 ?auto_213836 ) ) ( not ( = ?auto_213832 ?auto_213837 ) ) ( not ( = ?auto_213832 ?auto_213838 ) ) ( not ( = ?auto_213832 ?auto_213839 ) ) ( not ( = ?auto_213832 ?auto_213840 ) ) ( not ( = ?auto_213832 ?auto_213841 ) ) ( not ( = ?auto_213832 ?auto_213842 ) ) ( not ( = ?auto_213833 ?auto_213834 ) ) ( not ( = ?auto_213833 ?auto_213835 ) ) ( not ( = ?auto_213833 ?auto_213836 ) ) ( not ( = ?auto_213833 ?auto_213837 ) ) ( not ( = ?auto_213833 ?auto_213838 ) ) ( not ( = ?auto_213833 ?auto_213839 ) ) ( not ( = ?auto_213833 ?auto_213840 ) ) ( not ( = ?auto_213833 ?auto_213841 ) ) ( not ( = ?auto_213833 ?auto_213842 ) ) ( not ( = ?auto_213834 ?auto_213835 ) ) ( not ( = ?auto_213834 ?auto_213836 ) ) ( not ( = ?auto_213834 ?auto_213837 ) ) ( not ( = ?auto_213834 ?auto_213838 ) ) ( not ( = ?auto_213834 ?auto_213839 ) ) ( not ( = ?auto_213834 ?auto_213840 ) ) ( not ( = ?auto_213834 ?auto_213841 ) ) ( not ( = ?auto_213834 ?auto_213842 ) ) ( not ( = ?auto_213835 ?auto_213836 ) ) ( not ( = ?auto_213835 ?auto_213837 ) ) ( not ( = ?auto_213835 ?auto_213838 ) ) ( not ( = ?auto_213835 ?auto_213839 ) ) ( not ( = ?auto_213835 ?auto_213840 ) ) ( not ( = ?auto_213835 ?auto_213841 ) ) ( not ( = ?auto_213835 ?auto_213842 ) ) ( not ( = ?auto_213836 ?auto_213837 ) ) ( not ( = ?auto_213836 ?auto_213838 ) ) ( not ( = ?auto_213836 ?auto_213839 ) ) ( not ( = ?auto_213836 ?auto_213840 ) ) ( not ( = ?auto_213836 ?auto_213841 ) ) ( not ( = ?auto_213836 ?auto_213842 ) ) ( not ( = ?auto_213837 ?auto_213838 ) ) ( not ( = ?auto_213837 ?auto_213839 ) ) ( not ( = ?auto_213837 ?auto_213840 ) ) ( not ( = ?auto_213837 ?auto_213841 ) ) ( not ( = ?auto_213837 ?auto_213842 ) ) ( not ( = ?auto_213838 ?auto_213839 ) ) ( not ( = ?auto_213838 ?auto_213840 ) ) ( not ( = ?auto_213838 ?auto_213841 ) ) ( not ( = ?auto_213838 ?auto_213842 ) ) ( not ( = ?auto_213839 ?auto_213840 ) ) ( not ( = ?auto_213839 ?auto_213841 ) ) ( not ( = ?auto_213839 ?auto_213842 ) ) ( not ( = ?auto_213840 ?auto_213841 ) ) ( not ( = ?auto_213840 ?auto_213842 ) ) ( not ( = ?auto_213841 ?auto_213842 ) ) ( ON ?auto_213840 ?auto_213841 ) ( ON ?auto_213839 ?auto_213840 ) ( ON ?auto_213838 ?auto_213839 ) ( CLEAR ?auto_213836 ) ( ON ?auto_213837 ?auto_213838 ) ( CLEAR ?auto_213837 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_213832 ?auto_213833 ?auto_213834 ?auto_213835 ?auto_213836 ?auto_213837 )
      ( MAKE-10PILE ?auto_213832 ?auto_213833 ?auto_213834 ?auto_213835 ?auto_213836 ?auto_213837 ?auto_213838 ?auto_213839 ?auto_213840 ?auto_213841 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_213853 - BLOCK
      ?auto_213854 - BLOCK
      ?auto_213855 - BLOCK
      ?auto_213856 - BLOCK
      ?auto_213857 - BLOCK
      ?auto_213858 - BLOCK
      ?auto_213859 - BLOCK
      ?auto_213860 - BLOCK
      ?auto_213861 - BLOCK
      ?auto_213862 - BLOCK
    )
    :vars
    (
      ?auto_213863 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_213862 ?auto_213863 ) ( ON-TABLE ?auto_213853 ) ( ON ?auto_213854 ?auto_213853 ) ( ON ?auto_213855 ?auto_213854 ) ( ON ?auto_213856 ?auto_213855 ) ( ON ?auto_213857 ?auto_213856 ) ( not ( = ?auto_213853 ?auto_213854 ) ) ( not ( = ?auto_213853 ?auto_213855 ) ) ( not ( = ?auto_213853 ?auto_213856 ) ) ( not ( = ?auto_213853 ?auto_213857 ) ) ( not ( = ?auto_213853 ?auto_213858 ) ) ( not ( = ?auto_213853 ?auto_213859 ) ) ( not ( = ?auto_213853 ?auto_213860 ) ) ( not ( = ?auto_213853 ?auto_213861 ) ) ( not ( = ?auto_213853 ?auto_213862 ) ) ( not ( = ?auto_213853 ?auto_213863 ) ) ( not ( = ?auto_213854 ?auto_213855 ) ) ( not ( = ?auto_213854 ?auto_213856 ) ) ( not ( = ?auto_213854 ?auto_213857 ) ) ( not ( = ?auto_213854 ?auto_213858 ) ) ( not ( = ?auto_213854 ?auto_213859 ) ) ( not ( = ?auto_213854 ?auto_213860 ) ) ( not ( = ?auto_213854 ?auto_213861 ) ) ( not ( = ?auto_213854 ?auto_213862 ) ) ( not ( = ?auto_213854 ?auto_213863 ) ) ( not ( = ?auto_213855 ?auto_213856 ) ) ( not ( = ?auto_213855 ?auto_213857 ) ) ( not ( = ?auto_213855 ?auto_213858 ) ) ( not ( = ?auto_213855 ?auto_213859 ) ) ( not ( = ?auto_213855 ?auto_213860 ) ) ( not ( = ?auto_213855 ?auto_213861 ) ) ( not ( = ?auto_213855 ?auto_213862 ) ) ( not ( = ?auto_213855 ?auto_213863 ) ) ( not ( = ?auto_213856 ?auto_213857 ) ) ( not ( = ?auto_213856 ?auto_213858 ) ) ( not ( = ?auto_213856 ?auto_213859 ) ) ( not ( = ?auto_213856 ?auto_213860 ) ) ( not ( = ?auto_213856 ?auto_213861 ) ) ( not ( = ?auto_213856 ?auto_213862 ) ) ( not ( = ?auto_213856 ?auto_213863 ) ) ( not ( = ?auto_213857 ?auto_213858 ) ) ( not ( = ?auto_213857 ?auto_213859 ) ) ( not ( = ?auto_213857 ?auto_213860 ) ) ( not ( = ?auto_213857 ?auto_213861 ) ) ( not ( = ?auto_213857 ?auto_213862 ) ) ( not ( = ?auto_213857 ?auto_213863 ) ) ( not ( = ?auto_213858 ?auto_213859 ) ) ( not ( = ?auto_213858 ?auto_213860 ) ) ( not ( = ?auto_213858 ?auto_213861 ) ) ( not ( = ?auto_213858 ?auto_213862 ) ) ( not ( = ?auto_213858 ?auto_213863 ) ) ( not ( = ?auto_213859 ?auto_213860 ) ) ( not ( = ?auto_213859 ?auto_213861 ) ) ( not ( = ?auto_213859 ?auto_213862 ) ) ( not ( = ?auto_213859 ?auto_213863 ) ) ( not ( = ?auto_213860 ?auto_213861 ) ) ( not ( = ?auto_213860 ?auto_213862 ) ) ( not ( = ?auto_213860 ?auto_213863 ) ) ( not ( = ?auto_213861 ?auto_213862 ) ) ( not ( = ?auto_213861 ?auto_213863 ) ) ( not ( = ?auto_213862 ?auto_213863 ) ) ( ON ?auto_213861 ?auto_213862 ) ( ON ?auto_213860 ?auto_213861 ) ( ON ?auto_213859 ?auto_213860 ) ( CLEAR ?auto_213857 ) ( ON ?auto_213858 ?auto_213859 ) ( CLEAR ?auto_213858 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_213853 ?auto_213854 ?auto_213855 ?auto_213856 ?auto_213857 ?auto_213858 )
      ( MAKE-10PILE ?auto_213853 ?auto_213854 ?auto_213855 ?auto_213856 ?auto_213857 ?auto_213858 ?auto_213859 ?auto_213860 ?auto_213861 ?auto_213862 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_213874 - BLOCK
      ?auto_213875 - BLOCK
      ?auto_213876 - BLOCK
      ?auto_213877 - BLOCK
      ?auto_213878 - BLOCK
      ?auto_213879 - BLOCK
      ?auto_213880 - BLOCK
      ?auto_213881 - BLOCK
      ?auto_213882 - BLOCK
      ?auto_213883 - BLOCK
    )
    :vars
    (
      ?auto_213884 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_213883 ?auto_213884 ) ( ON-TABLE ?auto_213874 ) ( ON ?auto_213875 ?auto_213874 ) ( ON ?auto_213876 ?auto_213875 ) ( ON ?auto_213877 ?auto_213876 ) ( not ( = ?auto_213874 ?auto_213875 ) ) ( not ( = ?auto_213874 ?auto_213876 ) ) ( not ( = ?auto_213874 ?auto_213877 ) ) ( not ( = ?auto_213874 ?auto_213878 ) ) ( not ( = ?auto_213874 ?auto_213879 ) ) ( not ( = ?auto_213874 ?auto_213880 ) ) ( not ( = ?auto_213874 ?auto_213881 ) ) ( not ( = ?auto_213874 ?auto_213882 ) ) ( not ( = ?auto_213874 ?auto_213883 ) ) ( not ( = ?auto_213874 ?auto_213884 ) ) ( not ( = ?auto_213875 ?auto_213876 ) ) ( not ( = ?auto_213875 ?auto_213877 ) ) ( not ( = ?auto_213875 ?auto_213878 ) ) ( not ( = ?auto_213875 ?auto_213879 ) ) ( not ( = ?auto_213875 ?auto_213880 ) ) ( not ( = ?auto_213875 ?auto_213881 ) ) ( not ( = ?auto_213875 ?auto_213882 ) ) ( not ( = ?auto_213875 ?auto_213883 ) ) ( not ( = ?auto_213875 ?auto_213884 ) ) ( not ( = ?auto_213876 ?auto_213877 ) ) ( not ( = ?auto_213876 ?auto_213878 ) ) ( not ( = ?auto_213876 ?auto_213879 ) ) ( not ( = ?auto_213876 ?auto_213880 ) ) ( not ( = ?auto_213876 ?auto_213881 ) ) ( not ( = ?auto_213876 ?auto_213882 ) ) ( not ( = ?auto_213876 ?auto_213883 ) ) ( not ( = ?auto_213876 ?auto_213884 ) ) ( not ( = ?auto_213877 ?auto_213878 ) ) ( not ( = ?auto_213877 ?auto_213879 ) ) ( not ( = ?auto_213877 ?auto_213880 ) ) ( not ( = ?auto_213877 ?auto_213881 ) ) ( not ( = ?auto_213877 ?auto_213882 ) ) ( not ( = ?auto_213877 ?auto_213883 ) ) ( not ( = ?auto_213877 ?auto_213884 ) ) ( not ( = ?auto_213878 ?auto_213879 ) ) ( not ( = ?auto_213878 ?auto_213880 ) ) ( not ( = ?auto_213878 ?auto_213881 ) ) ( not ( = ?auto_213878 ?auto_213882 ) ) ( not ( = ?auto_213878 ?auto_213883 ) ) ( not ( = ?auto_213878 ?auto_213884 ) ) ( not ( = ?auto_213879 ?auto_213880 ) ) ( not ( = ?auto_213879 ?auto_213881 ) ) ( not ( = ?auto_213879 ?auto_213882 ) ) ( not ( = ?auto_213879 ?auto_213883 ) ) ( not ( = ?auto_213879 ?auto_213884 ) ) ( not ( = ?auto_213880 ?auto_213881 ) ) ( not ( = ?auto_213880 ?auto_213882 ) ) ( not ( = ?auto_213880 ?auto_213883 ) ) ( not ( = ?auto_213880 ?auto_213884 ) ) ( not ( = ?auto_213881 ?auto_213882 ) ) ( not ( = ?auto_213881 ?auto_213883 ) ) ( not ( = ?auto_213881 ?auto_213884 ) ) ( not ( = ?auto_213882 ?auto_213883 ) ) ( not ( = ?auto_213882 ?auto_213884 ) ) ( not ( = ?auto_213883 ?auto_213884 ) ) ( ON ?auto_213882 ?auto_213883 ) ( ON ?auto_213881 ?auto_213882 ) ( ON ?auto_213880 ?auto_213881 ) ( ON ?auto_213879 ?auto_213880 ) ( CLEAR ?auto_213877 ) ( ON ?auto_213878 ?auto_213879 ) ( CLEAR ?auto_213878 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_213874 ?auto_213875 ?auto_213876 ?auto_213877 ?auto_213878 )
      ( MAKE-10PILE ?auto_213874 ?auto_213875 ?auto_213876 ?auto_213877 ?auto_213878 ?auto_213879 ?auto_213880 ?auto_213881 ?auto_213882 ?auto_213883 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_213895 - BLOCK
      ?auto_213896 - BLOCK
      ?auto_213897 - BLOCK
      ?auto_213898 - BLOCK
      ?auto_213899 - BLOCK
      ?auto_213900 - BLOCK
      ?auto_213901 - BLOCK
      ?auto_213902 - BLOCK
      ?auto_213903 - BLOCK
      ?auto_213904 - BLOCK
    )
    :vars
    (
      ?auto_213905 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_213904 ?auto_213905 ) ( ON-TABLE ?auto_213895 ) ( ON ?auto_213896 ?auto_213895 ) ( ON ?auto_213897 ?auto_213896 ) ( ON ?auto_213898 ?auto_213897 ) ( not ( = ?auto_213895 ?auto_213896 ) ) ( not ( = ?auto_213895 ?auto_213897 ) ) ( not ( = ?auto_213895 ?auto_213898 ) ) ( not ( = ?auto_213895 ?auto_213899 ) ) ( not ( = ?auto_213895 ?auto_213900 ) ) ( not ( = ?auto_213895 ?auto_213901 ) ) ( not ( = ?auto_213895 ?auto_213902 ) ) ( not ( = ?auto_213895 ?auto_213903 ) ) ( not ( = ?auto_213895 ?auto_213904 ) ) ( not ( = ?auto_213895 ?auto_213905 ) ) ( not ( = ?auto_213896 ?auto_213897 ) ) ( not ( = ?auto_213896 ?auto_213898 ) ) ( not ( = ?auto_213896 ?auto_213899 ) ) ( not ( = ?auto_213896 ?auto_213900 ) ) ( not ( = ?auto_213896 ?auto_213901 ) ) ( not ( = ?auto_213896 ?auto_213902 ) ) ( not ( = ?auto_213896 ?auto_213903 ) ) ( not ( = ?auto_213896 ?auto_213904 ) ) ( not ( = ?auto_213896 ?auto_213905 ) ) ( not ( = ?auto_213897 ?auto_213898 ) ) ( not ( = ?auto_213897 ?auto_213899 ) ) ( not ( = ?auto_213897 ?auto_213900 ) ) ( not ( = ?auto_213897 ?auto_213901 ) ) ( not ( = ?auto_213897 ?auto_213902 ) ) ( not ( = ?auto_213897 ?auto_213903 ) ) ( not ( = ?auto_213897 ?auto_213904 ) ) ( not ( = ?auto_213897 ?auto_213905 ) ) ( not ( = ?auto_213898 ?auto_213899 ) ) ( not ( = ?auto_213898 ?auto_213900 ) ) ( not ( = ?auto_213898 ?auto_213901 ) ) ( not ( = ?auto_213898 ?auto_213902 ) ) ( not ( = ?auto_213898 ?auto_213903 ) ) ( not ( = ?auto_213898 ?auto_213904 ) ) ( not ( = ?auto_213898 ?auto_213905 ) ) ( not ( = ?auto_213899 ?auto_213900 ) ) ( not ( = ?auto_213899 ?auto_213901 ) ) ( not ( = ?auto_213899 ?auto_213902 ) ) ( not ( = ?auto_213899 ?auto_213903 ) ) ( not ( = ?auto_213899 ?auto_213904 ) ) ( not ( = ?auto_213899 ?auto_213905 ) ) ( not ( = ?auto_213900 ?auto_213901 ) ) ( not ( = ?auto_213900 ?auto_213902 ) ) ( not ( = ?auto_213900 ?auto_213903 ) ) ( not ( = ?auto_213900 ?auto_213904 ) ) ( not ( = ?auto_213900 ?auto_213905 ) ) ( not ( = ?auto_213901 ?auto_213902 ) ) ( not ( = ?auto_213901 ?auto_213903 ) ) ( not ( = ?auto_213901 ?auto_213904 ) ) ( not ( = ?auto_213901 ?auto_213905 ) ) ( not ( = ?auto_213902 ?auto_213903 ) ) ( not ( = ?auto_213902 ?auto_213904 ) ) ( not ( = ?auto_213902 ?auto_213905 ) ) ( not ( = ?auto_213903 ?auto_213904 ) ) ( not ( = ?auto_213903 ?auto_213905 ) ) ( not ( = ?auto_213904 ?auto_213905 ) ) ( ON ?auto_213903 ?auto_213904 ) ( ON ?auto_213902 ?auto_213903 ) ( ON ?auto_213901 ?auto_213902 ) ( ON ?auto_213900 ?auto_213901 ) ( CLEAR ?auto_213898 ) ( ON ?auto_213899 ?auto_213900 ) ( CLEAR ?auto_213899 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_213895 ?auto_213896 ?auto_213897 ?auto_213898 ?auto_213899 )
      ( MAKE-10PILE ?auto_213895 ?auto_213896 ?auto_213897 ?auto_213898 ?auto_213899 ?auto_213900 ?auto_213901 ?auto_213902 ?auto_213903 ?auto_213904 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_213916 - BLOCK
      ?auto_213917 - BLOCK
      ?auto_213918 - BLOCK
      ?auto_213919 - BLOCK
      ?auto_213920 - BLOCK
      ?auto_213921 - BLOCK
      ?auto_213922 - BLOCK
      ?auto_213923 - BLOCK
      ?auto_213924 - BLOCK
      ?auto_213925 - BLOCK
    )
    :vars
    (
      ?auto_213926 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_213925 ?auto_213926 ) ( ON-TABLE ?auto_213916 ) ( ON ?auto_213917 ?auto_213916 ) ( ON ?auto_213918 ?auto_213917 ) ( not ( = ?auto_213916 ?auto_213917 ) ) ( not ( = ?auto_213916 ?auto_213918 ) ) ( not ( = ?auto_213916 ?auto_213919 ) ) ( not ( = ?auto_213916 ?auto_213920 ) ) ( not ( = ?auto_213916 ?auto_213921 ) ) ( not ( = ?auto_213916 ?auto_213922 ) ) ( not ( = ?auto_213916 ?auto_213923 ) ) ( not ( = ?auto_213916 ?auto_213924 ) ) ( not ( = ?auto_213916 ?auto_213925 ) ) ( not ( = ?auto_213916 ?auto_213926 ) ) ( not ( = ?auto_213917 ?auto_213918 ) ) ( not ( = ?auto_213917 ?auto_213919 ) ) ( not ( = ?auto_213917 ?auto_213920 ) ) ( not ( = ?auto_213917 ?auto_213921 ) ) ( not ( = ?auto_213917 ?auto_213922 ) ) ( not ( = ?auto_213917 ?auto_213923 ) ) ( not ( = ?auto_213917 ?auto_213924 ) ) ( not ( = ?auto_213917 ?auto_213925 ) ) ( not ( = ?auto_213917 ?auto_213926 ) ) ( not ( = ?auto_213918 ?auto_213919 ) ) ( not ( = ?auto_213918 ?auto_213920 ) ) ( not ( = ?auto_213918 ?auto_213921 ) ) ( not ( = ?auto_213918 ?auto_213922 ) ) ( not ( = ?auto_213918 ?auto_213923 ) ) ( not ( = ?auto_213918 ?auto_213924 ) ) ( not ( = ?auto_213918 ?auto_213925 ) ) ( not ( = ?auto_213918 ?auto_213926 ) ) ( not ( = ?auto_213919 ?auto_213920 ) ) ( not ( = ?auto_213919 ?auto_213921 ) ) ( not ( = ?auto_213919 ?auto_213922 ) ) ( not ( = ?auto_213919 ?auto_213923 ) ) ( not ( = ?auto_213919 ?auto_213924 ) ) ( not ( = ?auto_213919 ?auto_213925 ) ) ( not ( = ?auto_213919 ?auto_213926 ) ) ( not ( = ?auto_213920 ?auto_213921 ) ) ( not ( = ?auto_213920 ?auto_213922 ) ) ( not ( = ?auto_213920 ?auto_213923 ) ) ( not ( = ?auto_213920 ?auto_213924 ) ) ( not ( = ?auto_213920 ?auto_213925 ) ) ( not ( = ?auto_213920 ?auto_213926 ) ) ( not ( = ?auto_213921 ?auto_213922 ) ) ( not ( = ?auto_213921 ?auto_213923 ) ) ( not ( = ?auto_213921 ?auto_213924 ) ) ( not ( = ?auto_213921 ?auto_213925 ) ) ( not ( = ?auto_213921 ?auto_213926 ) ) ( not ( = ?auto_213922 ?auto_213923 ) ) ( not ( = ?auto_213922 ?auto_213924 ) ) ( not ( = ?auto_213922 ?auto_213925 ) ) ( not ( = ?auto_213922 ?auto_213926 ) ) ( not ( = ?auto_213923 ?auto_213924 ) ) ( not ( = ?auto_213923 ?auto_213925 ) ) ( not ( = ?auto_213923 ?auto_213926 ) ) ( not ( = ?auto_213924 ?auto_213925 ) ) ( not ( = ?auto_213924 ?auto_213926 ) ) ( not ( = ?auto_213925 ?auto_213926 ) ) ( ON ?auto_213924 ?auto_213925 ) ( ON ?auto_213923 ?auto_213924 ) ( ON ?auto_213922 ?auto_213923 ) ( ON ?auto_213921 ?auto_213922 ) ( ON ?auto_213920 ?auto_213921 ) ( CLEAR ?auto_213918 ) ( ON ?auto_213919 ?auto_213920 ) ( CLEAR ?auto_213919 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_213916 ?auto_213917 ?auto_213918 ?auto_213919 )
      ( MAKE-10PILE ?auto_213916 ?auto_213917 ?auto_213918 ?auto_213919 ?auto_213920 ?auto_213921 ?auto_213922 ?auto_213923 ?auto_213924 ?auto_213925 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_213937 - BLOCK
      ?auto_213938 - BLOCK
      ?auto_213939 - BLOCK
      ?auto_213940 - BLOCK
      ?auto_213941 - BLOCK
      ?auto_213942 - BLOCK
      ?auto_213943 - BLOCK
      ?auto_213944 - BLOCK
      ?auto_213945 - BLOCK
      ?auto_213946 - BLOCK
    )
    :vars
    (
      ?auto_213947 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_213946 ?auto_213947 ) ( ON-TABLE ?auto_213937 ) ( ON ?auto_213938 ?auto_213937 ) ( ON ?auto_213939 ?auto_213938 ) ( not ( = ?auto_213937 ?auto_213938 ) ) ( not ( = ?auto_213937 ?auto_213939 ) ) ( not ( = ?auto_213937 ?auto_213940 ) ) ( not ( = ?auto_213937 ?auto_213941 ) ) ( not ( = ?auto_213937 ?auto_213942 ) ) ( not ( = ?auto_213937 ?auto_213943 ) ) ( not ( = ?auto_213937 ?auto_213944 ) ) ( not ( = ?auto_213937 ?auto_213945 ) ) ( not ( = ?auto_213937 ?auto_213946 ) ) ( not ( = ?auto_213937 ?auto_213947 ) ) ( not ( = ?auto_213938 ?auto_213939 ) ) ( not ( = ?auto_213938 ?auto_213940 ) ) ( not ( = ?auto_213938 ?auto_213941 ) ) ( not ( = ?auto_213938 ?auto_213942 ) ) ( not ( = ?auto_213938 ?auto_213943 ) ) ( not ( = ?auto_213938 ?auto_213944 ) ) ( not ( = ?auto_213938 ?auto_213945 ) ) ( not ( = ?auto_213938 ?auto_213946 ) ) ( not ( = ?auto_213938 ?auto_213947 ) ) ( not ( = ?auto_213939 ?auto_213940 ) ) ( not ( = ?auto_213939 ?auto_213941 ) ) ( not ( = ?auto_213939 ?auto_213942 ) ) ( not ( = ?auto_213939 ?auto_213943 ) ) ( not ( = ?auto_213939 ?auto_213944 ) ) ( not ( = ?auto_213939 ?auto_213945 ) ) ( not ( = ?auto_213939 ?auto_213946 ) ) ( not ( = ?auto_213939 ?auto_213947 ) ) ( not ( = ?auto_213940 ?auto_213941 ) ) ( not ( = ?auto_213940 ?auto_213942 ) ) ( not ( = ?auto_213940 ?auto_213943 ) ) ( not ( = ?auto_213940 ?auto_213944 ) ) ( not ( = ?auto_213940 ?auto_213945 ) ) ( not ( = ?auto_213940 ?auto_213946 ) ) ( not ( = ?auto_213940 ?auto_213947 ) ) ( not ( = ?auto_213941 ?auto_213942 ) ) ( not ( = ?auto_213941 ?auto_213943 ) ) ( not ( = ?auto_213941 ?auto_213944 ) ) ( not ( = ?auto_213941 ?auto_213945 ) ) ( not ( = ?auto_213941 ?auto_213946 ) ) ( not ( = ?auto_213941 ?auto_213947 ) ) ( not ( = ?auto_213942 ?auto_213943 ) ) ( not ( = ?auto_213942 ?auto_213944 ) ) ( not ( = ?auto_213942 ?auto_213945 ) ) ( not ( = ?auto_213942 ?auto_213946 ) ) ( not ( = ?auto_213942 ?auto_213947 ) ) ( not ( = ?auto_213943 ?auto_213944 ) ) ( not ( = ?auto_213943 ?auto_213945 ) ) ( not ( = ?auto_213943 ?auto_213946 ) ) ( not ( = ?auto_213943 ?auto_213947 ) ) ( not ( = ?auto_213944 ?auto_213945 ) ) ( not ( = ?auto_213944 ?auto_213946 ) ) ( not ( = ?auto_213944 ?auto_213947 ) ) ( not ( = ?auto_213945 ?auto_213946 ) ) ( not ( = ?auto_213945 ?auto_213947 ) ) ( not ( = ?auto_213946 ?auto_213947 ) ) ( ON ?auto_213945 ?auto_213946 ) ( ON ?auto_213944 ?auto_213945 ) ( ON ?auto_213943 ?auto_213944 ) ( ON ?auto_213942 ?auto_213943 ) ( ON ?auto_213941 ?auto_213942 ) ( CLEAR ?auto_213939 ) ( ON ?auto_213940 ?auto_213941 ) ( CLEAR ?auto_213940 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_213937 ?auto_213938 ?auto_213939 ?auto_213940 )
      ( MAKE-10PILE ?auto_213937 ?auto_213938 ?auto_213939 ?auto_213940 ?auto_213941 ?auto_213942 ?auto_213943 ?auto_213944 ?auto_213945 ?auto_213946 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_213958 - BLOCK
      ?auto_213959 - BLOCK
      ?auto_213960 - BLOCK
      ?auto_213961 - BLOCK
      ?auto_213962 - BLOCK
      ?auto_213963 - BLOCK
      ?auto_213964 - BLOCK
      ?auto_213965 - BLOCK
      ?auto_213966 - BLOCK
      ?auto_213967 - BLOCK
    )
    :vars
    (
      ?auto_213968 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_213967 ?auto_213968 ) ( ON-TABLE ?auto_213958 ) ( ON ?auto_213959 ?auto_213958 ) ( not ( = ?auto_213958 ?auto_213959 ) ) ( not ( = ?auto_213958 ?auto_213960 ) ) ( not ( = ?auto_213958 ?auto_213961 ) ) ( not ( = ?auto_213958 ?auto_213962 ) ) ( not ( = ?auto_213958 ?auto_213963 ) ) ( not ( = ?auto_213958 ?auto_213964 ) ) ( not ( = ?auto_213958 ?auto_213965 ) ) ( not ( = ?auto_213958 ?auto_213966 ) ) ( not ( = ?auto_213958 ?auto_213967 ) ) ( not ( = ?auto_213958 ?auto_213968 ) ) ( not ( = ?auto_213959 ?auto_213960 ) ) ( not ( = ?auto_213959 ?auto_213961 ) ) ( not ( = ?auto_213959 ?auto_213962 ) ) ( not ( = ?auto_213959 ?auto_213963 ) ) ( not ( = ?auto_213959 ?auto_213964 ) ) ( not ( = ?auto_213959 ?auto_213965 ) ) ( not ( = ?auto_213959 ?auto_213966 ) ) ( not ( = ?auto_213959 ?auto_213967 ) ) ( not ( = ?auto_213959 ?auto_213968 ) ) ( not ( = ?auto_213960 ?auto_213961 ) ) ( not ( = ?auto_213960 ?auto_213962 ) ) ( not ( = ?auto_213960 ?auto_213963 ) ) ( not ( = ?auto_213960 ?auto_213964 ) ) ( not ( = ?auto_213960 ?auto_213965 ) ) ( not ( = ?auto_213960 ?auto_213966 ) ) ( not ( = ?auto_213960 ?auto_213967 ) ) ( not ( = ?auto_213960 ?auto_213968 ) ) ( not ( = ?auto_213961 ?auto_213962 ) ) ( not ( = ?auto_213961 ?auto_213963 ) ) ( not ( = ?auto_213961 ?auto_213964 ) ) ( not ( = ?auto_213961 ?auto_213965 ) ) ( not ( = ?auto_213961 ?auto_213966 ) ) ( not ( = ?auto_213961 ?auto_213967 ) ) ( not ( = ?auto_213961 ?auto_213968 ) ) ( not ( = ?auto_213962 ?auto_213963 ) ) ( not ( = ?auto_213962 ?auto_213964 ) ) ( not ( = ?auto_213962 ?auto_213965 ) ) ( not ( = ?auto_213962 ?auto_213966 ) ) ( not ( = ?auto_213962 ?auto_213967 ) ) ( not ( = ?auto_213962 ?auto_213968 ) ) ( not ( = ?auto_213963 ?auto_213964 ) ) ( not ( = ?auto_213963 ?auto_213965 ) ) ( not ( = ?auto_213963 ?auto_213966 ) ) ( not ( = ?auto_213963 ?auto_213967 ) ) ( not ( = ?auto_213963 ?auto_213968 ) ) ( not ( = ?auto_213964 ?auto_213965 ) ) ( not ( = ?auto_213964 ?auto_213966 ) ) ( not ( = ?auto_213964 ?auto_213967 ) ) ( not ( = ?auto_213964 ?auto_213968 ) ) ( not ( = ?auto_213965 ?auto_213966 ) ) ( not ( = ?auto_213965 ?auto_213967 ) ) ( not ( = ?auto_213965 ?auto_213968 ) ) ( not ( = ?auto_213966 ?auto_213967 ) ) ( not ( = ?auto_213966 ?auto_213968 ) ) ( not ( = ?auto_213967 ?auto_213968 ) ) ( ON ?auto_213966 ?auto_213967 ) ( ON ?auto_213965 ?auto_213966 ) ( ON ?auto_213964 ?auto_213965 ) ( ON ?auto_213963 ?auto_213964 ) ( ON ?auto_213962 ?auto_213963 ) ( ON ?auto_213961 ?auto_213962 ) ( CLEAR ?auto_213959 ) ( ON ?auto_213960 ?auto_213961 ) ( CLEAR ?auto_213960 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_213958 ?auto_213959 ?auto_213960 )
      ( MAKE-10PILE ?auto_213958 ?auto_213959 ?auto_213960 ?auto_213961 ?auto_213962 ?auto_213963 ?auto_213964 ?auto_213965 ?auto_213966 ?auto_213967 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_213979 - BLOCK
      ?auto_213980 - BLOCK
      ?auto_213981 - BLOCK
      ?auto_213982 - BLOCK
      ?auto_213983 - BLOCK
      ?auto_213984 - BLOCK
      ?auto_213985 - BLOCK
      ?auto_213986 - BLOCK
      ?auto_213987 - BLOCK
      ?auto_213988 - BLOCK
    )
    :vars
    (
      ?auto_213989 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_213988 ?auto_213989 ) ( ON-TABLE ?auto_213979 ) ( ON ?auto_213980 ?auto_213979 ) ( not ( = ?auto_213979 ?auto_213980 ) ) ( not ( = ?auto_213979 ?auto_213981 ) ) ( not ( = ?auto_213979 ?auto_213982 ) ) ( not ( = ?auto_213979 ?auto_213983 ) ) ( not ( = ?auto_213979 ?auto_213984 ) ) ( not ( = ?auto_213979 ?auto_213985 ) ) ( not ( = ?auto_213979 ?auto_213986 ) ) ( not ( = ?auto_213979 ?auto_213987 ) ) ( not ( = ?auto_213979 ?auto_213988 ) ) ( not ( = ?auto_213979 ?auto_213989 ) ) ( not ( = ?auto_213980 ?auto_213981 ) ) ( not ( = ?auto_213980 ?auto_213982 ) ) ( not ( = ?auto_213980 ?auto_213983 ) ) ( not ( = ?auto_213980 ?auto_213984 ) ) ( not ( = ?auto_213980 ?auto_213985 ) ) ( not ( = ?auto_213980 ?auto_213986 ) ) ( not ( = ?auto_213980 ?auto_213987 ) ) ( not ( = ?auto_213980 ?auto_213988 ) ) ( not ( = ?auto_213980 ?auto_213989 ) ) ( not ( = ?auto_213981 ?auto_213982 ) ) ( not ( = ?auto_213981 ?auto_213983 ) ) ( not ( = ?auto_213981 ?auto_213984 ) ) ( not ( = ?auto_213981 ?auto_213985 ) ) ( not ( = ?auto_213981 ?auto_213986 ) ) ( not ( = ?auto_213981 ?auto_213987 ) ) ( not ( = ?auto_213981 ?auto_213988 ) ) ( not ( = ?auto_213981 ?auto_213989 ) ) ( not ( = ?auto_213982 ?auto_213983 ) ) ( not ( = ?auto_213982 ?auto_213984 ) ) ( not ( = ?auto_213982 ?auto_213985 ) ) ( not ( = ?auto_213982 ?auto_213986 ) ) ( not ( = ?auto_213982 ?auto_213987 ) ) ( not ( = ?auto_213982 ?auto_213988 ) ) ( not ( = ?auto_213982 ?auto_213989 ) ) ( not ( = ?auto_213983 ?auto_213984 ) ) ( not ( = ?auto_213983 ?auto_213985 ) ) ( not ( = ?auto_213983 ?auto_213986 ) ) ( not ( = ?auto_213983 ?auto_213987 ) ) ( not ( = ?auto_213983 ?auto_213988 ) ) ( not ( = ?auto_213983 ?auto_213989 ) ) ( not ( = ?auto_213984 ?auto_213985 ) ) ( not ( = ?auto_213984 ?auto_213986 ) ) ( not ( = ?auto_213984 ?auto_213987 ) ) ( not ( = ?auto_213984 ?auto_213988 ) ) ( not ( = ?auto_213984 ?auto_213989 ) ) ( not ( = ?auto_213985 ?auto_213986 ) ) ( not ( = ?auto_213985 ?auto_213987 ) ) ( not ( = ?auto_213985 ?auto_213988 ) ) ( not ( = ?auto_213985 ?auto_213989 ) ) ( not ( = ?auto_213986 ?auto_213987 ) ) ( not ( = ?auto_213986 ?auto_213988 ) ) ( not ( = ?auto_213986 ?auto_213989 ) ) ( not ( = ?auto_213987 ?auto_213988 ) ) ( not ( = ?auto_213987 ?auto_213989 ) ) ( not ( = ?auto_213988 ?auto_213989 ) ) ( ON ?auto_213987 ?auto_213988 ) ( ON ?auto_213986 ?auto_213987 ) ( ON ?auto_213985 ?auto_213986 ) ( ON ?auto_213984 ?auto_213985 ) ( ON ?auto_213983 ?auto_213984 ) ( ON ?auto_213982 ?auto_213983 ) ( CLEAR ?auto_213980 ) ( ON ?auto_213981 ?auto_213982 ) ( CLEAR ?auto_213981 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_213979 ?auto_213980 ?auto_213981 )
      ( MAKE-10PILE ?auto_213979 ?auto_213980 ?auto_213981 ?auto_213982 ?auto_213983 ?auto_213984 ?auto_213985 ?auto_213986 ?auto_213987 ?auto_213988 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_214000 - BLOCK
      ?auto_214001 - BLOCK
      ?auto_214002 - BLOCK
      ?auto_214003 - BLOCK
      ?auto_214004 - BLOCK
      ?auto_214005 - BLOCK
      ?auto_214006 - BLOCK
      ?auto_214007 - BLOCK
      ?auto_214008 - BLOCK
      ?auto_214009 - BLOCK
    )
    :vars
    (
      ?auto_214010 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_214009 ?auto_214010 ) ( ON-TABLE ?auto_214000 ) ( not ( = ?auto_214000 ?auto_214001 ) ) ( not ( = ?auto_214000 ?auto_214002 ) ) ( not ( = ?auto_214000 ?auto_214003 ) ) ( not ( = ?auto_214000 ?auto_214004 ) ) ( not ( = ?auto_214000 ?auto_214005 ) ) ( not ( = ?auto_214000 ?auto_214006 ) ) ( not ( = ?auto_214000 ?auto_214007 ) ) ( not ( = ?auto_214000 ?auto_214008 ) ) ( not ( = ?auto_214000 ?auto_214009 ) ) ( not ( = ?auto_214000 ?auto_214010 ) ) ( not ( = ?auto_214001 ?auto_214002 ) ) ( not ( = ?auto_214001 ?auto_214003 ) ) ( not ( = ?auto_214001 ?auto_214004 ) ) ( not ( = ?auto_214001 ?auto_214005 ) ) ( not ( = ?auto_214001 ?auto_214006 ) ) ( not ( = ?auto_214001 ?auto_214007 ) ) ( not ( = ?auto_214001 ?auto_214008 ) ) ( not ( = ?auto_214001 ?auto_214009 ) ) ( not ( = ?auto_214001 ?auto_214010 ) ) ( not ( = ?auto_214002 ?auto_214003 ) ) ( not ( = ?auto_214002 ?auto_214004 ) ) ( not ( = ?auto_214002 ?auto_214005 ) ) ( not ( = ?auto_214002 ?auto_214006 ) ) ( not ( = ?auto_214002 ?auto_214007 ) ) ( not ( = ?auto_214002 ?auto_214008 ) ) ( not ( = ?auto_214002 ?auto_214009 ) ) ( not ( = ?auto_214002 ?auto_214010 ) ) ( not ( = ?auto_214003 ?auto_214004 ) ) ( not ( = ?auto_214003 ?auto_214005 ) ) ( not ( = ?auto_214003 ?auto_214006 ) ) ( not ( = ?auto_214003 ?auto_214007 ) ) ( not ( = ?auto_214003 ?auto_214008 ) ) ( not ( = ?auto_214003 ?auto_214009 ) ) ( not ( = ?auto_214003 ?auto_214010 ) ) ( not ( = ?auto_214004 ?auto_214005 ) ) ( not ( = ?auto_214004 ?auto_214006 ) ) ( not ( = ?auto_214004 ?auto_214007 ) ) ( not ( = ?auto_214004 ?auto_214008 ) ) ( not ( = ?auto_214004 ?auto_214009 ) ) ( not ( = ?auto_214004 ?auto_214010 ) ) ( not ( = ?auto_214005 ?auto_214006 ) ) ( not ( = ?auto_214005 ?auto_214007 ) ) ( not ( = ?auto_214005 ?auto_214008 ) ) ( not ( = ?auto_214005 ?auto_214009 ) ) ( not ( = ?auto_214005 ?auto_214010 ) ) ( not ( = ?auto_214006 ?auto_214007 ) ) ( not ( = ?auto_214006 ?auto_214008 ) ) ( not ( = ?auto_214006 ?auto_214009 ) ) ( not ( = ?auto_214006 ?auto_214010 ) ) ( not ( = ?auto_214007 ?auto_214008 ) ) ( not ( = ?auto_214007 ?auto_214009 ) ) ( not ( = ?auto_214007 ?auto_214010 ) ) ( not ( = ?auto_214008 ?auto_214009 ) ) ( not ( = ?auto_214008 ?auto_214010 ) ) ( not ( = ?auto_214009 ?auto_214010 ) ) ( ON ?auto_214008 ?auto_214009 ) ( ON ?auto_214007 ?auto_214008 ) ( ON ?auto_214006 ?auto_214007 ) ( ON ?auto_214005 ?auto_214006 ) ( ON ?auto_214004 ?auto_214005 ) ( ON ?auto_214003 ?auto_214004 ) ( ON ?auto_214002 ?auto_214003 ) ( CLEAR ?auto_214000 ) ( ON ?auto_214001 ?auto_214002 ) ( CLEAR ?auto_214001 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_214000 ?auto_214001 )
      ( MAKE-10PILE ?auto_214000 ?auto_214001 ?auto_214002 ?auto_214003 ?auto_214004 ?auto_214005 ?auto_214006 ?auto_214007 ?auto_214008 ?auto_214009 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_214021 - BLOCK
      ?auto_214022 - BLOCK
      ?auto_214023 - BLOCK
      ?auto_214024 - BLOCK
      ?auto_214025 - BLOCK
      ?auto_214026 - BLOCK
      ?auto_214027 - BLOCK
      ?auto_214028 - BLOCK
      ?auto_214029 - BLOCK
      ?auto_214030 - BLOCK
    )
    :vars
    (
      ?auto_214031 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_214030 ?auto_214031 ) ( ON-TABLE ?auto_214021 ) ( not ( = ?auto_214021 ?auto_214022 ) ) ( not ( = ?auto_214021 ?auto_214023 ) ) ( not ( = ?auto_214021 ?auto_214024 ) ) ( not ( = ?auto_214021 ?auto_214025 ) ) ( not ( = ?auto_214021 ?auto_214026 ) ) ( not ( = ?auto_214021 ?auto_214027 ) ) ( not ( = ?auto_214021 ?auto_214028 ) ) ( not ( = ?auto_214021 ?auto_214029 ) ) ( not ( = ?auto_214021 ?auto_214030 ) ) ( not ( = ?auto_214021 ?auto_214031 ) ) ( not ( = ?auto_214022 ?auto_214023 ) ) ( not ( = ?auto_214022 ?auto_214024 ) ) ( not ( = ?auto_214022 ?auto_214025 ) ) ( not ( = ?auto_214022 ?auto_214026 ) ) ( not ( = ?auto_214022 ?auto_214027 ) ) ( not ( = ?auto_214022 ?auto_214028 ) ) ( not ( = ?auto_214022 ?auto_214029 ) ) ( not ( = ?auto_214022 ?auto_214030 ) ) ( not ( = ?auto_214022 ?auto_214031 ) ) ( not ( = ?auto_214023 ?auto_214024 ) ) ( not ( = ?auto_214023 ?auto_214025 ) ) ( not ( = ?auto_214023 ?auto_214026 ) ) ( not ( = ?auto_214023 ?auto_214027 ) ) ( not ( = ?auto_214023 ?auto_214028 ) ) ( not ( = ?auto_214023 ?auto_214029 ) ) ( not ( = ?auto_214023 ?auto_214030 ) ) ( not ( = ?auto_214023 ?auto_214031 ) ) ( not ( = ?auto_214024 ?auto_214025 ) ) ( not ( = ?auto_214024 ?auto_214026 ) ) ( not ( = ?auto_214024 ?auto_214027 ) ) ( not ( = ?auto_214024 ?auto_214028 ) ) ( not ( = ?auto_214024 ?auto_214029 ) ) ( not ( = ?auto_214024 ?auto_214030 ) ) ( not ( = ?auto_214024 ?auto_214031 ) ) ( not ( = ?auto_214025 ?auto_214026 ) ) ( not ( = ?auto_214025 ?auto_214027 ) ) ( not ( = ?auto_214025 ?auto_214028 ) ) ( not ( = ?auto_214025 ?auto_214029 ) ) ( not ( = ?auto_214025 ?auto_214030 ) ) ( not ( = ?auto_214025 ?auto_214031 ) ) ( not ( = ?auto_214026 ?auto_214027 ) ) ( not ( = ?auto_214026 ?auto_214028 ) ) ( not ( = ?auto_214026 ?auto_214029 ) ) ( not ( = ?auto_214026 ?auto_214030 ) ) ( not ( = ?auto_214026 ?auto_214031 ) ) ( not ( = ?auto_214027 ?auto_214028 ) ) ( not ( = ?auto_214027 ?auto_214029 ) ) ( not ( = ?auto_214027 ?auto_214030 ) ) ( not ( = ?auto_214027 ?auto_214031 ) ) ( not ( = ?auto_214028 ?auto_214029 ) ) ( not ( = ?auto_214028 ?auto_214030 ) ) ( not ( = ?auto_214028 ?auto_214031 ) ) ( not ( = ?auto_214029 ?auto_214030 ) ) ( not ( = ?auto_214029 ?auto_214031 ) ) ( not ( = ?auto_214030 ?auto_214031 ) ) ( ON ?auto_214029 ?auto_214030 ) ( ON ?auto_214028 ?auto_214029 ) ( ON ?auto_214027 ?auto_214028 ) ( ON ?auto_214026 ?auto_214027 ) ( ON ?auto_214025 ?auto_214026 ) ( ON ?auto_214024 ?auto_214025 ) ( ON ?auto_214023 ?auto_214024 ) ( CLEAR ?auto_214021 ) ( ON ?auto_214022 ?auto_214023 ) ( CLEAR ?auto_214022 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_214021 ?auto_214022 )
      ( MAKE-10PILE ?auto_214021 ?auto_214022 ?auto_214023 ?auto_214024 ?auto_214025 ?auto_214026 ?auto_214027 ?auto_214028 ?auto_214029 ?auto_214030 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_214042 - BLOCK
      ?auto_214043 - BLOCK
      ?auto_214044 - BLOCK
      ?auto_214045 - BLOCK
      ?auto_214046 - BLOCK
      ?auto_214047 - BLOCK
      ?auto_214048 - BLOCK
      ?auto_214049 - BLOCK
      ?auto_214050 - BLOCK
      ?auto_214051 - BLOCK
    )
    :vars
    (
      ?auto_214052 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_214051 ?auto_214052 ) ( not ( = ?auto_214042 ?auto_214043 ) ) ( not ( = ?auto_214042 ?auto_214044 ) ) ( not ( = ?auto_214042 ?auto_214045 ) ) ( not ( = ?auto_214042 ?auto_214046 ) ) ( not ( = ?auto_214042 ?auto_214047 ) ) ( not ( = ?auto_214042 ?auto_214048 ) ) ( not ( = ?auto_214042 ?auto_214049 ) ) ( not ( = ?auto_214042 ?auto_214050 ) ) ( not ( = ?auto_214042 ?auto_214051 ) ) ( not ( = ?auto_214042 ?auto_214052 ) ) ( not ( = ?auto_214043 ?auto_214044 ) ) ( not ( = ?auto_214043 ?auto_214045 ) ) ( not ( = ?auto_214043 ?auto_214046 ) ) ( not ( = ?auto_214043 ?auto_214047 ) ) ( not ( = ?auto_214043 ?auto_214048 ) ) ( not ( = ?auto_214043 ?auto_214049 ) ) ( not ( = ?auto_214043 ?auto_214050 ) ) ( not ( = ?auto_214043 ?auto_214051 ) ) ( not ( = ?auto_214043 ?auto_214052 ) ) ( not ( = ?auto_214044 ?auto_214045 ) ) ( not ( = ?auto_214044 ?auto_214046 ) ) ( not ( = ?auto_214044 ?auto_214047 ) ) ( not ( = ?auto_214044 ?auto_214048 ) ) ( not ( = ?auto_214044 ?auto_214049 ) ) ( not ( = ?auto_214044 ?auto_214050 ) ) ( not ( = ?auto_214044 ?auto_214051 ) ) ( not ( = ?auto_214044 ?auto_214052 ) ) ( not ( = ?auto_214045 ?auto_214046 ) ) ( not ( = ?auto_214045 ?auto_214047 ) ) ( not ( = ?auto_214045 ?auto_214048 ) ) ( not ( = ?auto_214045 ?auto_214049 ) ) ( not ( = ?auto_214045 ?auto_214050 ) ) ( not ( = ?auto_214045 ?auto_214051 ) ) ( not ( = ?auto_214045 ?auto_214052 ) ) ( not ( = ?auto_214046 ?auto_214047 ) ) ( not ( = ?auto_214046 ?auto_214048 ) ) ( not ( = ?auto_214046 ?auto_214049 ) ) ( not ( = ?auto_214046 ?auto_214050 ) ) ( not ( = ?auto_214046 ?auto_214051 ) ) ( not ( = ?auto_214046 ?auto_214052 ) ) ( not ( = ?auto_214047 ?auto_214048 ) ) ( not ( = ?auto_214047 ?auto_214049 ) ) ( not ( = ?auto_214047 ?auto_214050 ) ) ( not ( = ?auto_214047 ?auto_214051 ) ) ( not ( = ?auto_214047 ?auto_214052 ) ) ( not ( = ?auto_214048 ?auto_214049 ) ) ( not ( = ?auto_214048 ?auto_214050 ) ) ( not ( = ?auto_214048 ?auto_214051 ) ) ( not ( = ?auto_214048 ?auto_214052 ) ) ( not ( = ?auto_214049 ?auto_214050 ) ) ( not ( = ?auto_214049 ?auto_214051 ) ) ( not ( = ?auto_214049 ?auto_214052 ) ) ( not ( = ?auto_214050 ?auto_214051 ) ) ( not ( = ?auto_214050 ?auto_214052 ) ) ( not ( = ?auto_214051 ?auto_214052 ) ) ( ON ?auto_214050 ?auto_214051 ) ( ON ?auto_214049 ?auto_214050 ) ( ON ?auto_214048 ?auto_214049 ) ( ON ?auto_214047 ?auto_214048 ) ( ON ?auto_214046 ?auto_214047 ) ( ON ?auto_214045 ?auto_214046 ) ( ON ?auto_214044 ?auto_214045 ) ( ON ?auto_214043 ?auto_214044 ) ( ON ?auto_214042 ?auto_214043 ) ( CLEAR ?auto_214042 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_214042 )
      ( MAKE-10PILE ?auto_214042 ?auto_214043 ?auto_214044 ?auto_214045 ?auto_214046 ?auto_214047 ?auto_214048 ?auto_214049 ?auto_214050 ?auto_214051 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_214063 - BLOCK
      ?auto_214064 - BLOCK
      ?auto_214065 - BLOCK
      ?auto_214066 - BLOCK
      ?auto_214067 - BLOCK
      ?auto_214068 - BLOCK
      ?auto_214069 - BLOCK
      ?auto_214070 - BLOCK
      ?auto_214071 - BLOCK
      ?auto_214072 - BLOCK
    )
    :vars
    (
      ?auto_214073 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_214072 ?auto_214073 ) ( not ( = ?auto_214063 ?auto_214064 ) ) ( not ( = ?auto_214063 ?auto_214065 ) ) ( not ( = ?auto_214063 ?auto_214066 ) ) ( not ( = ?auto_214063 ?auto_214067 ) ) ( not ( = ?auto_214063 ?auto_214068 ) ) ( not ( = ?auto_214063 ?auto_214069 ) ) ( not ( = ?auto_214063 ?auto_214070 ) ) ( not ( = ?auto_214063 ?auto_214071 ) ) ( not ( = ?auto_214063 ?auto_214072 ) ) ( not ( = ?auto_214063 ?auto_214073 ) ) ( not ( = ?auto_214064 ?auto_214065 ) ) ( not ( = ?auto_214064 ?auto_214066 ) ) ( not ( = ?auto_214064 ?auto_214067 ) ) ( not ( = ?auto_214064 ?auto_214068 ) ) ( not ( = ?auto_214064 ?auto_214069 ) ) ( not ( = ?auto_214064 ?auto_214070 ) ) ( not ( = ?auto_214064 ?auto_214071 ) ) ( not ( = ?auto_214064 ?auto_214072 ) ) ( not ( = ?auto_214064 ?auto_214073 ) ) ( not ( = ?auto_214065 ?auto_214066 ) ) ( not ( = ?auto_214065 ?auto_214067 ) ) ( not ( = ?auto_214065 ?auto_214068 ) ) ( not ( = ?auto_214065 ?auto_214069 ) ) ( not ( = ?auto_214065 ?auto_214070 ) ) ( not ( = ?auto_214065 ?auto_214071 ) ) ( not ( = ?auto_214065 ?auto_214072 ) ) ( not ( = ?auto_214065 ?auto_214073 ) ) ( not ( = ?auto_214066 ?auto_214067 ) ) ( not ( = ?auto_214066 ?auto_214068 ) ) ( not ( = ?auto_214066 ?auto_214069 ) ) ( not ( = ?auto_214066 ?auto_214070 ) ) ( not ( = ?auto_214066 ?auto_214071 ) ) ( not ( = ?auto_214066 ?auto_214072 ) ) ( not ( = ?auto_214066 ?auto_214073 ) ) ( not ( = ?auto_214067 ?auto_214068 ) ) ( not ( = ?auto_214067 ?auto_214069 ) ) ( not ( = ?auto_214067 ?auto_214070 ) ) ( not ( = ?auto_214067 ?auto_214071 ) ) ( not ( = ?auto_214067 ?auto_214072 ) ) ( not ( = ?auto_214067 ?auto_214073 ) ) ( not ( = ?auto_214068 ?auto_214069 ) ) ( not ( = ?auto_214068 ?auto_214070 ) ) ( not ( = ?auto_214068 ?auto_214071 ) ) ( not ( = ?auto_214068 ?auto_214072 ) ) ( not ( = ?auto_214068 ?auto_214073 ) ) ( not ( = ?auto_214069 ?auto_214070 ) ) ( not ( = ?auto_214069 ?auto_214071 ) ) ( not ( = ?auto_214069 ?auto_214072 ) ) ( not ( = ?auto_214069 ?auto_214073 ) ) ( not ( = ?auto_214070 ?auto_214071 ) ) ( not ( = ?auto_214070 ?auto_214072 ) ) ( not ( = ?auto_214070 ?auto_214073 ) ) ( not ( = ?auto_214071 ?auto_214072 ) ) ( not ( = ?auto_214071 ?auto_214073 ) ) ( not ( = ?auto_214072 ?auto_214073 ) ) ( ON ?auto_214071 ?auto_214072 ) ( ON ?auto_214070 ?auto_214071 ) ( ON ?auto_214069 ?auto_214070 ) ( ON ?auto_214068 ?auto_214069 ) ( ON ?auto_214067 ?auto_214068 ) ( ON ?auto_214066 ?auto_214067 ) ( ON ?auto_214065 ?auto_214066 ) ( ON ?auto_214064 ?auto_214065 ) ( ON ?auto_214063 ?auto_214064 ) ( CLEAR ?auto_214063 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_214063 )
      ( MAKE-10PILE ?auto_214063 ?auto_214064 ?auto_214065 ?auto_214066 ?auto_214067 ?auto_214068 ?auto_214069 ?auto_214070 ?auto_214071 ?auto_214072 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_214085 - BLOCK
      ?auto_214086 - BLOCK
      ?auto_214087 - BLOCK
      ?auto_214088 - BLOCK
      ?auto_214089 - BLOCK
      ?auto_214090 - BLOCK
      ?auto_214091 - BLOCK
      ?auto_214092 - BLOCK
      ?auto_214093 - BLOCK
      ?auto_214094 - BLOCK
      ?auto_214095 - BLOCK
    )
    :vars
    (
      ?auto_214096 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_214094 ) ( ON ?auto_214095 ?auto_214096 ) ( CLEAR ?auto_214095 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_214085 ) ( ON ?auto_214086 ?auto_214085 ) ( ON ?auto_214087 ?auto_214086 ) ( ON ?auto_214088 ?auto_214087 ) ( ON ?auto_214089 ?auto_214088 ) ( ON ?auto_214090 ?auto_214089 ) ( ON ?auto_214091 ?auto_214090 ) ( ON ?auto_214092 ?auto_214091 ) ( ON ?auto_214093 ?auto_214092 ) ( ON ?auto_214094 ?auto_214093 ) ( not ( = ?auto_214085 ?auto_214086 ) ) ( not ( = ?auto_214085 ?auto_214087 ) ) ( not ( = ?auto_214085 ?auto_214088 ) ) ( not ( = ?auto_214085 ?auto_214089 ) ) ( not ( = ?auto_214085 ?auto_214090 ) ) ( not ( = ?auto_214085 ?auto_214091 ) ) ( not ( = ?auto_214085 ?auto_214092 ) ) ( not ( = ?auto_214085 ?auto_214093 ) ) ( not ( = ?auto_214085 ?auto_214094 ) ) ( not ( = ?auto_214085 ?auto_214095 ) ) ( not ( = ?auto_214085 ?auto_214096 ) ) ( not ( = ?auto_214086 ?auto_214087 ) ) ( not ( = ?auto_214086 ?auto_214088 ) ) ( not ( = ?auto_214086 ?auto_214089 ) ) ( not ( = ?auto_214086 ?auto_214090 ) ) ( not ( = ?auto_214086 ?auto_214091 ) ) ( not ( = ?auto_214086 ?auto_214092 ) ) ( not ( = ?auto_214086 ?auto_214093 ) ) ( not ( = ?auto_214086 ?auto_214094 ) ) ( not ( = ?auto_214086 ?auto_214095 ) ) ( not ( = ?auto_214086 ?auto_214096 ) ) ( not ( = ?auto_214087 ?auto_214088 ) ) ( not ( = ?auto_214087 ?auto_214089 ) ) ( not ( = ?auto_214087 ?auto_214090 ) ) ( not ( = ?auto_214087 ?auto_214091 ) ) ( not ( = ?auto_214087 ?auto_214092 ) ) ( not ( = ?auto_214087 ?auto_214093 ) ) ( not ( = ?auto_214087 ?auto_214094 ) ) ( not ( = ?auto_214087 ?auto_214095 ) ) ( not ( = ?auto_214087 ?auto_214096 ) ) ( not ( = ?auto_214088 ?auto_214089 ) ) ( not ( = ?auto_214088 ?auto_214090 ) ) ( not ( = ?auto_214088 ?auto_214091 ) ) ( not ( = ?auto_214088 ?auto_214092 ) ) ( not ( = ?auto_214088 ?auto_214093 ) ) ( not ( = ?auto_214088 ?auto_214094 ) ) ( not ( = ?auto_214088 ?auto_214095 ) ) ( not ( = ?auto_214088 ?auto_214096 ) ) ( not ( = ?auto_214089 ?auto_214090 ) ) ( not ( = ?auto_214089 ?auto_214091 ) ) ( not ( = ?auto_214089 ?auto_214092 ) ) ( not ( = ?auto_214089 ?auto_214093 ) ) ( not ( = ?auto_214089 ?auto_214094 ) ) ( not ( = ?auto_214089 ?auto_214095 ) ) ( not ( = ?auto_214089 ?auto_214096 ) ) ( not ( = ?auto_214090 ?auto_214091 ) ) ( not ( = ?auto_214090 ?auto_214092 ) ) ( not ( = ?auto_214090 ?auto_214093 ) ) ( not ( = ?auto_214090 ?auto_214094 ) ) ( not ( = ?auto_214090 ?auto_214095 ) ) ( not ( = ?auto_214090 ?auto_214096 ) ) ( not ( = ?auto_214091 ?auto_214092 ) ) ( not ( = ?auto_214091 ?auto_214093 ) ) ( not ( = ?auto_214091 ?auto_214094 ) ) ( not ( = ?auto_214091 ?auto_214095 ) ) ( not ( = ?auto_214091 ?auto_214096 ) ) ( not ( = ?auto_214092 ?auto_214093 ) ) ( not ( = ?auto_214092 ?auto_214094 ) ) ( not ( = ?auto_214092 ?auto_214095 ) ) ( not ( = ?auto_214092 ?auto_214096 ) ) ( not ( = ?auto_214093 ?auto_214094 ) ) ( not ( = ?auto_214093 ?auto_214095 ) ) ( not ( = ?auto_214093 ?auto_214096 ) ) ( not ( = ?auto_214094 ?auto_214095 ) ) ( not ( = ?auto_214094 ?auto_214096 ) ) ( not ( = ?auto_214095 ?auto_214096 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_214095 ?auto_214096 )
      ( !STACK ?auto_214095 ?auto_214094 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_214108 - BLOCK
      ?auto_214109 - BLOCK
      ?auto_214110 - BLOCK
      ?auto_214111 - BLOCK
      ?auto_214112 - BLOCK
      ?auto_214113 - BLOCK
      ?auto_214114 - BLOCK
      ?auto_214115 - BLOCK
      ?auto_214116 - BLOCK
      ?auto_214117 - BLOCK
      ?auto_214118 - BLOCK
    )
    :vars
    (
      ?auto_214119 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_214117 ) ( ON ?auto_214118 ?auto_214119 ) ( CLEAR ?auto_214118 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_214108 ) ( ON ?auto_214109 ?auto_214108 ) ( ON ?auto_214110 ?auto_214109 ) ( ON ?auto_214111 ?auto_214110 ) ( ON ?auto_214112 ?auto_214111 ) ( ON ?auto_214113 ?auto_214112 ) ( ON ?auto_214114 ?auto_214113 ) ( ON ?auto_214115 ?auto_214114 ) ( ON ?auto_214116 ?auto_214115 ) ( ON ?auto_214117 ?auto_214116 ) ( not ( = ?auto_214108 ?auto_214109 ) ) ( not ( = ?auto_214108 ?auto_214110 ) ) ( not ( = ?auto_214108 ?auto_214111 ) ) ( not ( = ?auto_214108 ?auto_214112 ) ) ( not ( = ?auto_214108 ?auto_214113 ) ) ( not ( = ?auto_214108 ?auto_214114 ) ) ( not ( = ?auto_214108 ?auto_214115 ) ) ( not ( = ?auto_214108 ?auto_214116 ) ) ( not ( = ?auto_214108 ?auto_214117 ) ) ( not ( = ?auto_214108 ?auto_214118 ) ) ( not ( = ?auto_214108 ?auto_214119 ) ) ( not ( = ?auto_214109 ?auto_214110 ) ) ( not ( = ?auto_214109 ?auto_214111 ) ) ( not ( = ?auto_214109 ?auto_214112 ) ) ( not ( = ?auto_214109 ?auto_214113 ) ) ( not ( = ?auto_214109 ?auto_214114 ) ) ( not ( = ?auto_214109 ?auto_214115 ) ) ( not ( = ?auto_214109 ?auto_214116 ) ) ( not ( = ?auto_214109 ?auto_214117 ) ) ( not ( = ?auto_214109 ?auto_214118 ) ) ( not ( = ?auto_214109 ?auto_214119 ) ) ( not ( = ?auto_214110 ?auto_214111 ) ) ( not ( = ?auto_214110 ?auto_214112 ) ) ( not ( = ?auto_214110 ?auto_214113 ) ) ( not ( = ?auto_214110 ?auto_214114 ) ) ( not ( = ?auto_214110 ?auto_214115 ) ) ( not ( = ?auto_214110 ?auto_214116 ) ) ( not ( = ?auto_214110 ?auto_214117 ) ) ( not ( = ?auto_214110 ?auto_214118 ) ) ( not ( = ?auto_214110 ?auto_214119 ) ) ( not ( = ?auto_214111 ?auto_214112 ) ) ( not ( = ?auto_214111 ?auto_214113 ) ) ( not ( = ?auto_214111 ?auto_214114 ) ) ( not ( = ?auto_214111 ?auto_214115 ) ) ( not ( = ?auto_214111 ?auto_214116 ) ) ( not ( = ?auto_214111 ?auto_214117 ) ) ( not ( = ?auto_214111 ?auto_214118 ) ) ( not ( = ?auto_214111 ?auto_214119 ) ) ( not ( = ?auto_214112 ?auto_214113 ) ) ( not ( = ?auto_214112 ?auto_214114 ) ) ( not ( = ?auto_214112 ?auto_214115 ) ) ( not ( = ?auto_214112 ?auto_214116 ) ) ( not ( = ?auto_214112 ?auto_214117 ) ) ( not ( = ?auto_214112 ?auto_214118 ) ) ( not ( = ?auto_214112 ?auto_214119 ) ) ( not ( = ?auto_214113 ?auto_214114 ) ) ( not ( = ?auto_214113 ?auto_214115 ) ) ( not ( = ?auto_214113 ?auto_214116 ) ) ( not ( = ?auto_214113 ?auto_214117 ) ) ( not ( = ?auto_214113 ?auto_214118 ) ) ( not ( = ?auto_214113 ?auto_214119 ) ) ( not ( = ?auto_214114 ?auto_214115 ) ) ( not ( = ?auto_214114 ?auto_214116 ) ) ( not ( = ?auto_214114 ?auto_214117 ) ) ( not ( = ?auto_214114 ?auto_214118 ) ) ( not ( = ?auto_214114 ?auto_214119 ) ) ( not ( = ?auto_214115 ?auto_214116 ) ) ( not ( = ?auto_214115 ?auto_214117 ) ) ( not ( = ?auto_214115 ?auto_214118 ) ) ( not ( = ?auto_214115 ?auto_214119 ) ) ( not ( = ?auto_214116 ?auto_214117 ) ) ( not ( = ?auto_214116 ?auto_214118 ) ) ( not ( = ?auto_214116 ?auto_214119 ) ) ( not ( = ?auto_214117 ?auto_214118 ) ) ( not ( = ?auto_214117 ?auto_214119 ) ) ( not ( = ?auto_214118 ?auto_214119 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_214118 ?auto_214119 )
      ( !STACK ?auto_214118 ?auto_214117 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_214131 - BLOCK
      ?auto_214132 - BLOCK
      ?auto_214133 - BLOCK
      ?auto_214134 - BLOCK
      ?auto_214135 - BLOCK
      ?auto_214136 - BLOCK
      ?auto_214137 - BLOCK
      ?auto_214138 - BLOCK
      ?auto_214139 - BLOCK
      ?auto_214140 - BLOCK
      ?auto_214141 - BLOCK
    )
    :vars
    (
      ?auto_214142 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_214141 ?auto_214142 ) ( ON-TABLE ?auto_214131 ) ( ON ?auto_214132 ?auto_214131 ) ( ON ?auto_214133 ?auto_214132 ) ( ON ?auto_214134 ?auto_214133 ) ( ON ?auto_214135 ?auto_214134 ) ( ON ?auto_214136 ?auto_214135 ) ( ON ?auto_214137 ?auto_214136 ) ( ON ?auto_214138 ?auto_214137 ) ( ON ?auto_214139 ?auto_214138 ) ( not ( = ?auto_214131 ?auto_214132 ) ) ( not ( = ?auto_214131 ?auto_214133 ) ) ( not ( = ?auto_214131 ?auto_214134 ) ) ( not ( = ?auto_214131 ?auto_214135 ) ) ( not ( = ?auto_214131 ?auto_214136 ) ) ( not ( = ?auto_214131 ?auto_214137 ) ) ( not ( = ?auto_214131 ?auto_214138 ) ) ( not ( = ?auto_214131 ?auto_214139 ) ) ( not ( = ?auto_214131 ?auto_214140 ) ) ( not ( = ?auto_214131 ?auto_214141 ) ) ( not ( = ?auto_214131 ?auto_214142 ) ) ( not ( = ?auto_214132 ?auto_214133 ) ) ( not ( = ?auto_214132 ?auto_214134 ) ) ( not ( = ?auto_214132 ?auto_214135 ) ) ( not ( = ?auto_214132 ?auto_214136 ) ) ( not ( = ?auto_214132 ?auto_214137 ) ) ( not ( = ?auto_214132 ?auto_214138 ) ) ( not ( = ?auto_214132 ?auto_214139 ) ) ( not ( = ?auto_214132 ?auto_214140 ) ) ( not ( = ?auto_214132 ?auto_214141 ) ) ( not ( = ?auto_214132 ?auto_214142 ) ) ( not ( = ?auto_214133 ?auto_214134 ) ) ( not ( = ?auto_214133 ?auto_214135 ) ) ( not ( = ?auto_214133 ?auto_214136 ) ) ( not ( = ?auto_214133 ?auto_214137 ) ) ( not ( = ?auto_214133 ?auto_214138 ) ) ( not ( = ?auto_214133 ?auto_214139 ) ) ( not ( = ?auto_214133 ?auto_214140 ) ) ( not ( = ?auto_214133 ?auto_214141 ) ) ( not ( = ?auto_214133 ?auto_214142 ) ) ( not ( = ?auto_214134 ?auto_214135 ) ) ( not ( = ?auto_214134 ?auto_214136 ) ) ( not ( = ?auto_214134 ?auto_214137 ) ) ( not ( = ?auto_214134 ?auto_214138 ) ) ( not ( = ?auto_214134 ?auto_214139 ) ) ( not ( = ?auto_214134 ?auto_214140 ) ) ( not ( = ?auto_214134 ?auto_214141 ) ) ( not ( = ?auto_214134 ?auto_214142 ) ) ( not ( = ?auto_214135 ?auto_214136 ) ) ( not ( = ?auto_214135 ?auto_214137 ) ) ( not ( = ?auto_214135 ?auto_214138 ) ) ( not ( = ?auto_214135 ?auto_214139 ) ) ( not ( = ?auto_214135 ?auto_214140 ) ) ( not ( = ?auto_214135 ?auto_214141 ) ) ( not ( = ?auto_214135 ?auto_214142 ) ) ( not ( = ?auto_214136 ?auto_214137 ) ) ( not ( = ?auto_214136 ?auto_214138 ) ) ( not ( = ?auto_214136 ?auto_214139 ) ) ( not ( = ?auto_214136 ?auto_214140 ) ) ( not ( = ?auto_214136 ?auto_214141 ) ) ( not ( = ?auto_214136 ?auto_214142 ) ) ( not ( = ?auto_214137 ?auto_214138 ) ) ( not ( = ?auto_214137 ?auto_214139 ) ) ( not ( = ?auto_214137 ?auto_214140 ) ) ( not ( = ?auto_214137 ?auto_214141 ) ) ( not ( = ?auto_214137 ?auto_214142 ) ) ( not ( = ?auto_214138 ?auto_214139 ) ) ( not ( = ?auto_214138 ?auto_214140 ) ) ( not ( = ?auto_214138 ?auto_214141 ) ) ( not ( = ?auto_214138 ?auto_214142 ) ) ( not ( = ?auto_214139 ?auto_214140 ) ) ( not ( = ?auto_214139 ?auto_214141 ) ) ( not ( = ?auto_214139 ?auto_214142 ) ) ( not ( = ?auto_214140 ?auto_214141 ) ) ( not ( = ?auto_214140 ?auto_214142 ) ) ( not ( = ?auto_214141 ?auto_214142 ) ) ( CLEAR ?auto_214139 ) ( ON ?auto_214140 ?auto_214141 ) ( CLEAR ?auto_214140 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_214131 ?auto_214132 ?auto_214133 ?auto_214134 ?auto_214135 ?auto_214136 ?auto_214137 ?auto_214138 ?auto_214139 ?auto_214140 )
      ( MAKE-11PILE ?auto_214131 ?auto_214132 ?auto_214133 ?auto_214134 ?auto_214135 ?auto_214136 ?auto_214137 ?auto_214138 ?auto_214139 ?auto_214140 ?auto_214141 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_214154 - BLOCK
      ?auto_214155 - BLOCK
      ?auto_214156 - BLOCK
      ?auto_214157 - BLOCK
      ?auto_214158 - BLOCK
      ?auto_214159 - BLOCK
      ?auto_214160 - BLOCK
      ?auto_214161 - BLOCK
      ?auto_214162 - BLOCK
      ?auto_214163 - BLOCK
      ?auto_214164 - BLOCK
    )
    :vars
    (
      ?auto_214165 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_214164 ?auto_214165 ) ( ON-TABLE ?auto_214154 ) ( ON ?auto_214155 ?auto_214154 ) ( ON ?auto_214156 ?auto_214155 ) ( ON ?auto_214157 ?auto_214156 ) ( ON ?auto_214158 ?auto_214157 ) ( ON ?auto_214159 ?auto_214158 ) ( ON ?auto_214160 ?auto_214159 ) ( ON ?auto_214161 ?auto_214160 ) ( ON ?auto_214162 ?auto_214161 ) ( not ( = ?auto_214154 ?auto_214155 ) ) ( not ( = ?auto_214154 ?auto_214156 ) ) ( not ( = ?auto_214154 ?auto_214157 ) ) ( not ( = ?auto_214154 ?auto_214158 ) ) ( not ( = ?auto_214154 ?auto_214159 ) ) ( not ( = ?auto_214154 ?auto_214160 ) ) ( not ( = ?auto_214154 ?auto_214161 ) ) ( not ( = ?auto_214154 ?auto_214162 ) ) ( not ( = ?auto_214154 ?auto_214163 ) ) ( not ( = ?auto_214154 ?auto_214164 ) ) ( not ( = ?auto_214154 ?auto_214165 ) ) ( not ( = ?auto_214155 ?auto_214156 ) ) ( not ( = ?auto_214155 ?auto_214157 ) ) ( not ( = ?auto_214155 ?auto_214158 ) ) ( not ( = ?auto_214155 ?auto_214159 ) ) ( not ( = ?auto_214155 ?auto_214160 ) ) ( not ( = ?auto_214155 ?auto_214161 ) ) ( not ( = ?auto_214155 ?auto_214162 ) ) ( not ( = ?auto_214155 ?auto_214163 ) ) ( not ( = ?auto_214155 ?auto_214164 ) ) ( not ( = ?auto_214155 ?auto_214165 ) ) ( not ( = ?auto_214156 ?auto_214157 ) ) ( not ( = ?auto_214156 ?auto_214158 ) ) ( not ( = ?auto_214156 ?auto_214159 ) ) ( not ( = ?auto_214156 ?auto_214160 ) ) ( not ( = ?auto_214156 ?auto_214161 ) ) ( not ( = ?auto_214156 ?auto_214162 ) ) ( not ( = ?auto_214156 ?auto_214163 ) ) ( not ( = ?auto_214156 ?auto_214164 ) ) ( not ( = ?auto_214156 ?auto_214165 ) ) ( not ( = ?auto_214157 ?auto_214158 ) ) ( not ( = ?auto_214157 ?auto_214159 ) ) ( not ( = ?auto_214157 ?auto_214160 ) ) ( not ( = ?auto_214157 ?auto_214161 ) ) ( not ( = ?auto_214157 ?auto_214162 ) ) ( not ( = ?auto_214157 ?auto_214163 ) ) ( not ( = ?auto_214157 ?auto_214164 ) ) ( not ( = ?auto_214157 ?auto_214165 ) ) ( not ( = ?auto_214158 ?auto_214159 ) ) ( not ( = ?auto_214158 ?auto_214160 ) ) ( not ( = ?auto_214158 ?auto_214161 ) ) ( not ( = ?auto_214158 ?auto_214162 ) ) ( not ( = ?auto_214158 ?auto_214163 ) ) ( not ( = ?auto_214158 ?auto_214164 ) ) ( not ( = ?auto_214158 ?auto_214165 ) ) ( not ( = ?auto_214159 ?auto_214160 ) ) ( not ( = ?auto_214159 ?auto_214161 ) ) ( not ( = ?auto_214159 ?auto_214162 ) ) ( not ( = ?auto_214159 ?auto_214163 ) ) ( not ( = ?auto_214159 ?auto_214164 ) ) ( not ( = ?auto_214159 ?auto_214165 ) ) ( not ( = ?auto_214160 ?auto_214161 ) ) ( not ( = ?auto_214160 ?auto_214162 ) ) ( not ( = ?auto_214160 ?auto_214163 ) ) ( not ( = ?auto_214160 ?auto_214164 ) ) ( not ( = ?auto_214160 ?auto_214165 ) ) ( not ( = ?auto_214161 ?auto_214162 ) ) ( not ( = ?auto_214161 ?auto_214163 ) ) ( not ( = ?auto_214161 ?auto_214164 ) ) ( not ( = ?auto_214161 ?auto_214165 ) ) ( not ( = ?auto_214162 ?auto_214163 ) ) ( not ( = ?auto_214162 ?auto_214164 ) ) ( not ( = ?auto_214162 ?auto_214165 ) ) ( not ( = ?auto_214163 ?auto_214164 ) ) ( not ( = ?auto_214163 ?auto_214165 ) ) ( not ( = ?auto_214164 ?auto_214165 ) ) ( CLEAR ?auto_214162 ) ( ON ?auto_214163 ?auto_214164 ) ( CLEAR ?auto_214163 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_214154 ?auto_214155 ?auto_214156 ?auto_214157 ?auto_214158 ?auto_214159 ?auto_214160 ?auto_214161 ?auto_214162 ?auto_214163 )
      ( MAKE-11PILE ?auto_214154 ?auto_214155 ?auto_214156 ?auto_214157 ?auto_214158 ?auto_214159 ?auto_214160 ?auto_214161 ?auto_214162 ?auto_214163 ?auto_214164 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_214177 - BLOCK
      ?auto_214178 - BLOCK
      ?auto_214179 - BLOCK
      ?auto_214180 - BLOCK
      ?auto_214181 - BLOCK
      ?auto_214182 - BLOCK
      ?auto_214183 - BLOCK
      ?auto_214184 - BLOCK
      ?auto_214185 - BLOCK
      ?auto_214186 - BLOCK
      ?auto_214187 - BLOCK
    )
    :vars
    (
      ?auto_214188 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_214187 ?auto_214188 ) ( ON-TABLE ?auto_214177 ) ( ON ?auto_214178 ?auto_214177 ) ( ON ?auto_214179 ?auto_214178 ) ( ON ?auto_214180 ?auto_214179 ) ( ON ?auto_214181 ?auto_214180 ) ( ON ?auto_214182 ?auto_214181 ) ( ON ?auto_214183 ?auto_214182 ) ( ON ?auto_214184 ?auto_214183 ) ( not ( = ?auto_214177 ?auto_214178 ) ) ( not ( = ?auto_214177 ?auto_214179 ) ) ( not ( = ?auto_214177 ?auto_214180 ) ) ( not ( = ?auto_214177 ?auto_214181 ) ) ( not ( = ?auto_214177 ?auto_214182 ) ) ( not ( = ?auto_214177 ?auto_214183 ) ) ( not ( = ?auto_214177 ?auto_214184 ) ) ( not ( = ?auto_214177 ?auto_214185 ) ) ( not ( = ?auto_214177 ?auto_214186 ) ) ( not ( = ?auto_214177 ?auto_214187 ) ) ( not ( = ?auto_214177 ?auto_214188 ) ) ( not ( = ?auto_214178 ?auto_214179 ) ) ( not ( = ?auto_214178 ?auto_214180 ) ) ( not ( = ?auto_214178 ?auto_214181 ) ) ( not ( = ?auto_214178 ?auto_214182 ) ) ( not ( = ?auto_214178 ?auto_214183 ) ) ( not ( = ?auto_214178 ?auto_214184 ) ) ( not ( = ?auto_214178 ?auto_214185 ) ) ( not ( = ?auto_214178 ?auto_214186 ) ) ( not ( = ?auto_214178 ?auto_214187 ) ) ( not ( = ?auto_214178 ?auto_214188 ) ) ( not ( = ?auto_214179 ?auto_214180 ) ) ( not ( = ?auto_214179 ?auto_214181 ) ) ( not ( = ?auto_214179 ?auto_214182 ) ) ( not ( = ?auto_214179 ?auto_214183 ) ) ( not ( = ?auto_214179 ?auto_214184 ) ) ( not ( = ?auto_214179 ?auto_214185 ) ) ( not ( = ?auto_214179 ?auto_214186 ) ) ( not ( = ?auto_214179 ?auto_214187 ) ) ( not ( = ?auto_214179 ?auto_214188 ) ) ( not ( = ?auto_214180 ?auto_214181 ) ) ( not ( = ?auto_214180 ?auto_214182 ) ) ( not ( = ?auto_214180 ?auto_214183 ) ) ( not ( = ?auto_214180 ?auto_214184 ) ) ( not ( = ?auto_214180 ?auto_214185 ) ) ( not ( = ?auto_214180 ?auto_214186 ) ) ( not ( = ?auto_214180 ?auto_214187 ) ) ( not ( = ?auto_214180 ?auto_214188 ) ) ( not ( = ?auto_214181 ?auto_214182 ) ) ( not ( = ?auto_214181 ?auto_214183 ) ) ( not ( = ?auto_214181 ?auto_214184 ) ) ( not ( = ?auto_214181 ?auto_214185 ) ) ( not ( = ?auto_214181 ?auto_214186 ) ) ( not ( = ?auto_214181 ?auto_214187 ) ) ( not ( = ?auto_214181 ?auto_214188 ) ) ( not ( = ?auto_214182 ?auto_214183 ) ) ( not ( = ?auto_214182 ?auto_214184 ) ) ( not ( = ?auto_214182 ?auto_214185 ) ) ( not ( = ?auto_214182 ?auto_214186 ) ) ( not ( = ?auto_214182 ?auto_214187 ) ) ( not ( = ?auto_214182 ?auto_214188 ) ) ( not ( = ?auto_214183 ?auto_214184 ) ) ( not ( = ?auto_214183 ?auto_214185 ) ) ( not ( = ?auto_214183 ?auto_214186 ) ) ( not ( = ?auto_214183 ?auto_214187 ) ) ( not ( = ?auto_214183 ?auto_214188 ) ) ( not ( = ?auto_214184 ?auto_214185 ) ) ( not ( = ?auto_214184 ?auto_214186 ) ) ( not ( = ?auto_214184 ?auto_214187 ) ) ( not ( = ?auto_214184 ?auto_214188 ) ) ( not ( = ?auto_214185 ?auto_214186 ) ) ( not ( = ?auto_214185 ?auto_214187 ) ) ( not ( = ?auto_214185 ?auto_214188 ) ) ( not ( = ?auto_214186 ?auto_214187 ) ) ( not ( = ?auto_214186 ?auto_214188 ) ) ( not ( = ?auto_214187 ?auto_214188 ) ) ( ON ?auto_214186 ?auto_214187 ) ( CLEAR ?auto_214184 ) ( ON ?auto_214185 ?auto_214186 ) ( CLEAR ?auto_214185 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_214177 ?auto_214178 ?auto_214179 ?auto_214180 ?auto_214181 ?auto_214182 ?auto_214183 ?auto_214184 ?auto_214185 )
      ( MAKE-11PILE ?auto_214177 ?auto_214178 ?auto_214179 ?auto_214180 ?auto_214181 ?auto_214182 ?auto_214183 ?auto_214184 ?auto_214185 ?auto_214186 ?auto_214187 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_214200 - BLOCK
      ?auto_214201 - BLOCK
      ?auto_214202 - BLOCK
      ?auto_214203 - BLOCK
      ?auto_214204 - BLOCK
      ?auto_214205 - BLOCK
      ?auto_214206 - BLOCK
      ?auto_214207 - BLOCK
      ?auto_214208 - BLOCK
      ?auto_214209 - BLOCK
      ?auto_214210 - BLOCK
    )
    :vars
    (
      ?auto_214211 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_214210 ?auto_214211 ) ( ON-TABLE ?auto_214200 ) ( ON ?auto_214201 ?auto_214200 ) ( ON ?auto_214202 ?auto_214201 ) ( ON ?auto_214203 ?auto_214202 ) ( ON ?auto_214204 ?auto_214203 ) ( ON ?auto_214205 ?auto_214204 ) ( ON ?auto_214206 ?auto_214205 ) ( ON ?auto_214207 ?auto_214206 ) ( not ( = ?auto_214200 ?auto_214201 ) ) ( not ( = ?auto_214200 ?auto_214202 ) ) ( not ( = ?auto_214200 ?auto_214203 ) ) ( not ( = ?auto_214200 ?auto_214204 ) ) ( not ( = ?auto_214200 ?auto_214205 ) ) ( not ( = ?auto_214200 ?auto_214206 ) ) ( not ( = ?auto_214200 ?auto_214207 ) ) ( not ( = ?auto_214200 ?auto_214208 ) ) ( not ( = ?auto_214200 ?auto_214209 ) ) ( not ( = ?auto_214200 ?auto_214210 ) ) ( not ( = ?auto_214200 ?auto_214211 ) ) ( not ( = ?auto_214201 ?auto_214202 ) ) ( not ( = ?auto_214201 ?auto_214203 ) ) ( not ( = ?auto_214201 ?auto_214204 ) ) ( not ( = ?auto_214201 ?auto_214205 ) ) ( not ( = ?auto_214201 ?auto_214206 ) ) ( not ( = ?auto_214201 ?auto_214207 ) ) ( not ( = ?auto_214201 ?auto_214208 ) ) ( not ( = ?auto_214201 ?auto_214209 ) ) ( not ( = ?auto_214201 ?auto_214210 ) ) ( not ( = ?auto_214201 ?auto_214211 ) ) ( not ( = ?auto_214202 ?auto_214203 ) ) ( not ( = ?auto_214202 ?auto_214204 ) ) ( not ( = ?auto_214202 ?auto_214205 ) ) ( not ( = ?auto_214202 ?auto_214206 ) ) ( not ( = ?auto_214202 ?auto_214207 ) ) ( not ( = ?auto_214202 ?auto_214208 ) ) ( not ( = ?auto_214202 ?auto_214209 ) ) ( not ( = ?auto_214202 ?auto_214210 ) ) ( not ( = ?auto_214202 ?auto_214211 ) ) ( not ( = ?auto_214203 ?auto_214204 ) ) ( not ( = ?auto_214203 ?auto_214205 ) ) ( not ( = ?auto_214203 ?auto_214206 ) ) ( not ( = ?auto_214203 ?auto_214207 ) ) ( not ( = ?auto_214203 ?auto_214208 ) ) ( not ( = ?auto_214203 ?auto_214209 ) ) ( not ( = ?auto_214203 ?auto_214210 ) ) ( not ( = ?auto_214203 ?auto_214211 ) ) ( not ( = ?auto_214204 ?auto_214205 ) ) ( not ( = ?auto_214204 ?auto_214206 ) ) ( not ( = ?auto_214204 ?auto_214207 ) ) ( not ( = ?auto_214204 ?auto_214208 ) ) ( not ( = ?auto_214204 ?auto_214209 ) ) ( not ( = ?auto_214204 ?auto_214210 ) ) ( not ( = ?auto_214204 ?auto_214211 ) ) ( not ( = ?auto_214205 ?auto_214206 ) ) ( not ( = ?auto_214205 ?auto_214207 ) ) ( not ( = ?auto_214205 ?auto_214208 ) ) ( not ( = ?auto_214205 ?auto_214209 ) ) ( not ( = ?auto_214205 ?auto_214210 ) ) ( not ( = ?auto_214205 ?auto_214211 ) ) ( not ( = ?auto_214206 ?auto_214207 ) ) ( not ( = ?auto_214206 ?auto_214208 ) ) ( not ( = ?auto_214206 ?auto_214209 ) ) ( not ( = ?auto_214206 ?auto_214210 ) ) ( not ( = ?auto_214206 ?auto_214211 ) ) ( not ( = ?auto_214207 ?auto_214208 ) ) ( not ( = ?auto_214207 ?auto_214209 ) ) ( not ( = ?auto_214207 ?auto_214210 ) ) ( not ( = ?auto_214207 ?auto_214211 ) ) ( not ( = ?auto_214208 ?auto_214209 ) ) ( not ( = ?auto_214208 ?auto_214210 ) ) ( not ( = ?auto_214208 ?auto_214211 ) ) ( not ( = ?auto_214209 ?auto_214210 ) ) ( not ( = ?auto_214209 ?auto_214211 ) ) ( not ( = ?auto_214210 ?auto_214211 ) ) ( ON ?auto_214209 ?auto_214210 ) ( CLEAR ?auto_214207 ) ( ON ?auto_214208 ?auto_214209 ) ( CLEAR ?auto_214208 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_214200 ?auto_214201 ?auto_214202 ?auto_214203 ?auto_214204 ?auto_214205 ?auto_214206 ?auto_214207 ?auto_214208 )
      ( MAKE-11PILE ?auto_214200 ?auto_214201 ?auto_214202 ?auto_214203 ?auto_214204 ?auto_214205 ?auto_214206 ?auto_214207 ?auto_214208 ?auto_214209 ?auto_214210 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_214223 - BLOCK
      ?auto_214224 - BLOCK
      ?auto_214225 - BLOCK
      ?auto_214226 - BLOCK
      ?auto_214227 - BLOCK
      ?auto_214228 - BLOCK
      ?auto_214229 - BLOCK
      ?auto_214230 - BLOCK
      ?auto_214231 - BLOCK
      ?auto_214232 - BLOCK
      ?auto_214233 - BLOCK
    )
    :vars
    (
      ?auto_214234 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_214233 ?auto_214234 ) ( ON-TABLE ?auto_214223 ) ( ON ?auto_214224 ?auto_214223 ) ( ON ?auto_214225 ?auto_214224 ) ( ON ?auto_214226 ?auto_214225 ) ( ON ?auto_214227 ?auto_214226 ) ( ON ?auto_214228 ?auto_214227 ) ( ON ?auto_214229 ?auto_214228 ) ( not ( = ?auto_214223 ?auto_214224 ) ) ( not ( = ?auto_214223 ?auto_214225 ) ) ( not ( = ?auto_214223 ?auto_214226 ) ) ( not ( = ?auto_214223 ?auto_214227 ) ) ( not ( = ?auto_214223 ?auto_214228 ) ) ( not ( = ?auto_214223 ?auto_214229 ) ) ( not ( = ?auto_214223 ?auto_214230 ) ) ( not ( = ?auto_214223 ?auto_214231 ) ) ( not ( = ?auto_214223 ?auto_214232 ) ) ( not ( = ?auto_214223 ?auto_214233 ) ) ( not ( = ?auto_214223 ?auto_214234 ) ) ( not ( = ?auto_214224 ?auto_214225 ) ) ( not ( = ?auto_214224 ?auto_214226 ) ) ( not ( = ?auto_214224 ?auto_214227 ) ) ( not ( = ?auto_214224 ?auto_214228 ) ) ( not ( = ?auto_214224 ?auto_214229 ) ) ( not ( = ?auto_214224 ?auto_214230 ) ) ( not ( = ?auto_214224 ?auto_214231 ) ) ( not ( = ?auto_214224 ?auto_214232 ) ) ( not ( = ?auto_214224 ?auto_214233 ) ) ( not ( = ?auto_214224 ?auto_214234 ) ) ( not ( = ?auto_214225 ?auto_214226 ) ) ( not ( = ?auto_214225 ?auto_214227 ) ) ( not ( = ?auto_214225 ?auto_214228 ) ) ( not ( = ?auto_214225 ?auto_214229 ) ) ( not ( = ?auto_214225 ?auto_214230 ) ) ( not ( = ?auto_214225 ?auto_214231 ) ) ( not ( = ?auto_214225 ?auto_214232 ) ) ( not ( = ?auto_214225 ?auto_214233 ) ) ( not ( = ?auto_214225 ?auto_214234 ) ) ( not ( = ?auto_214226 ?auto_214227 ) ) ( not ( = ?auto_214226 ?auto_214228 ) ) ( not ( = ?auto_214226 ?auto_214229 ) ) ( not ( = ?auto_214226 ?auto_214230 ) ) ( not ( = ?auto_214226 ?auto_214231 ) ) ( not ( = ?auto_214226 ?auto_214232 ) ) ( not ( = ?auto_214226 ?auto_214233 ) ) ( not ( = ?auto_214226 ?auto_214234 ) ) ( not ( = ?auto_214227 ?auto_214228 ) ) ( not ( = ?auto_214227 ?auto_214229 ) ) ( not ( = ?auto_214227 ?auto_214230 ) ) ( not ( = ?auto_214227 ?auto_214231 ) ) ( not ( = ?auto_214227 ?auto_214232 ) ) ( not ( = ?auto_214227 ?auto_214233 ) ) ( not ( = ?auto_214227 ?auto_214234 ) ) ( not ( = ?auto_214228 ?auto_214229 ) ) ( not ( = ?auto_214228 ?auto_214230 ) ) ( not ( = ?auto_214228 ?auto_214231 ) ) ( not ( = ?auto_214228 ?auto_214232 ) ) ( not ( = ?auto_214228 ?auto_214233 ) ) ( not ( = ?auto_214228 ?auto_214234 ) ) ( not ( = ?auto_214229 ?auto_214230 ) ) ( not ( = ?auto_214229 ?auto_214231 ) ) ( not ( = ?auto_214229 ?auto_214232 ) ) ( not ( = ?auto_214229 ?auto_214233 ) ) ( not ( = ?auto_214229 ?auto_214234 ) ) ( not ( = ?auto_214230 ?auto_214231 ) ) ( not ( = ?auto_214230 ?auto_214232 ) ) ( not ( = ?auto_214230 ?auto_214233 ) ) ( not ( = ?auto_214230 ?auto_214234 ) ) ( not ( = ?auto_214231 ?auto_214232 ) ) ( not ( = ?auto_214231 ?auto_214233 ) ) ( not ( = ?auto_214231 ?auto_214234 ) ) ( not ( = ?auto_214232 ?auto_214233 ) ) ( not ( = ?auto_214232 ?auto_214234 ) ) ( not ( = ?auto_214233 ?auto_214234 ) ) ( ON ?auto_214232 ?auto_214233 ) ( ON ?auto_214231 ?auto_214232 ) ( CLEAR ?auto_214229 ) ( ON ?auto_214230 ?auto_214231 ) ( CLEAR ?auto_214230 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_214223 ?auto_214224 ?auto_214225 ?auto_214226 ?auto_214227 ?auto_214228 ?auto_214229 ?auto_214230 )
      ( MAKE-11PILE ?auto_214223 ?auto_214224 ?auto_214225 ?auto_214226 ?auto_214227 ?auto_214228 ?auto_214229 ?auto_214230 ?auto_214231 ?auto_214232 ?auto_214233 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_214246 - BLOCK
      ?auto_214247 - BLOCK
      ?auto_214248 - BLOCK
      ?auto_214249 - BLOCK
      ?auto_214250 - BLOCK
      ?auto_214251 - BLOCK
      ?auto_214252 - BLOCK
      ?auto_214253 - BLOCK
      ?auto_214254 - BLOCK
      ?auto_214255 - BLOCK
      ?auto_214256 - BLOCK
    )
    :vars
    (
      ?auto_214257 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_214256 ?auto_214257 ) ( ON-TABLE ?auto_214246 ) ( ON ?auto_214247 ?auto_214246 ) ( ON ?auto_214248 ?auto_214247 ) ( ON ?auto_214249 ?auto_214248 ) ( ON ?auto_214250 ?auto_214249 ) ( ON ?auto_214251 ?auto_214250 ) ( ON ?auto_214252 ?auto_214251 ) ( not ( = ?auto_214246 ?auto_214247 ) ) ( not ( = ?auto_214246 ?auto_214248 ) ) ( not ( = ?auto_214246 ?auto_214249 ) ) ( not ( = ?auto_214246 ?auto_214250 ) ) ( not ( = ?auto_214246 ?auto_214251 ) ) ( not ( = ?auto_214246 ?auto_214252 ) ) ( not ( = ?auto_214246 ?auto_214253 ) ) ( not ( = ?auto_214246 ?auto_214254 ) ) ( not ( = ?auto_214246 ?auto_214255 ) ) ( not ( = ?auto_214246 ?auto_214256 ) ) ( not ( = ?auto_214246 ?auto_214257 ) ) ( not ( = ?auto_214247 ?auto_214248 ) ) ( not ( = ?auto_214247 ?auto_214249 ) ) ( not ( = ?auto_214247 ?auto_214250 ) ) ( not ( = ?auto_214247 ?auto_214251 ) ) ( not ( = ?auto_214247 ?auto_214252 ) ) ( not ( = ?auto_214247 ?auto_214253 ) ) ( not ( = ?auto_214247 ?auto_214254 ) ) ( not ( = ?auto_214247 ?auto_214255 ) ) ( not ( = ?auto_214247 ?auto_214256 ) ) ( not ( = ?auto_214247 ?auto_214257 ) ) ( not ( = ?auto_214248 ?auto_214249 ) ) ( not ( = ?auto_214248 ?auto_214250 ) ) ( not ( = ?auto_214248 ?auto_214251 ) ) ( not ( = ?auto_214248 ?auto_214252 ) ) ( not ( = ?auto_214248 ?auto_214253 ) ) ( not ( = ?auto_214248 ?auto_214254 ) ) ( not ( = ?auto_214248 ?auto_214255 ) ) ( not ( = ?auto_214248 ?auto_214256 ) ) ( not ( = ?auto_214248 ?auto_214257 ) ) ( not ( = ?auto_214249 ?auto_214250 ) ) ( not ( = ?auto_214249 ?auto_214251 ) ) ( not ( = ?auto_214249 ?auto_214252 ) ) ( not ( = ?auto_214249 ?auto_214253 ) ) ( not ( = ?auto_214249 ?auto_214254 ) ) ( not ( = ?auto_214249 ?auto_214255 ) ) ( not ( = ?auto_214249 ?auto_214256 ) ) ( not ( = ?auto_214249 ?auto_214257 ) ) ( not ( = ?auto_214250 ?auto_214251 ) ) ( not ( = ?auto_214250 ?auto_214252 ) ) ( not ( = ?auto_214250 ?auto_214253 ) ) ( not ( = ?auto_214250 ?auto_214254 ) ) ( not ( = ?auto_214250 ?auto_214255 ) ) ( not ( = ?auto_214250 ?auto_214256 ) ) ( not ( = ?auto_214250 ?auto_214257 ) ) ( not ( = ?auto_214251 ?auto_214252 ) ) ( not ( = ?auto_214251 ?auto_214253 ) ) ( not ( = ?auto_214251 ?auto_214254 ) ) ( not ( = ?auto_214251 ?auto_214255 ) ) ( not ( = ?auto_214251 ?auto_214256 ) ) ( not ( = ?auto_214251 ?auto_214257 ) ) ( not ( = ?auto_214252 ?auto_214253 ) ) ( not ( = ?auto_214252 ?auto_214254 ) ) ( not ( = ?auto_214252 ?auto_214255 ) ) ( not ( = ?auto_214252 ?auto_214256 ) ) ( not ( = ?auto_214252 ?auto_214257 ) ) ( not ( = ?auto_214253 ?auto_214254 ) ) ( not ( = ?auto_214253 ?auto_214255 ) ) ( not ( = ?auto_214253 ?auto_214256 ) ) ( not ( = ?auto_214253 ?auto_214257 ) ) ( not ( = ?auto_214254 ?auto_214255 ) ) ( not ( = ?auto_214254 ?auto_214256 ) ) ( not ( = ?auto_214254 ?auto_214257 ) ) ( not ( = ?auto_214255 ?auto_214256 ) ) ( not ( = ?auto_214255 ?auto_214257 ) ) ( not ( = ?auto_214256 ?auto_214257 ) ) ( ON ?auto_214255 ?auto_214256 ) ( ON ?auto_214254 ?auto_214255 ) ( CLEAR ?auto_214252 ) ( ON ?auto_214253 ?auto_214254 ) ( CLEAR ?auto_214253 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_214246 ?auto_214247 ?auto_214248 ?auto_214249 ?auto_214250 ?auto_214251 ?auto_214252 ?auto_214253 )
      ( MAKE-11PILE ?auto_214246 ?auto_214247 ?auto_214248 ?auto_214249 ?auto_214250 ?auto_214251 ?auto_214252 ?auto_214253 ?auto_214254 ?auto_214255 ?auto_214256 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_214269 - BLOCK
      ?auto_214270 - BLOCK
      ?auto_214271 - BLOCK
      ?auto_214272 - BLOCK
      ?auto_214273 - BLOCK
      ?auto_214274 - BLOCK
      ?auto_214275 - BLOCK
      ?auto_214276 - BLOCK
      ?auto_214277 - BLOCK
      ?auto_214278 - BLOCK
      ?auto_214279 - BLOCK
    )
    :vars
    (
      ?auto_214280 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_214279 ?auto_214280 ) ( ON-TABLE ?auto_214269 ) ( ON ?auto_214270 ?auto_214269 ) ( ON ?auto_214271 ?auto_214270 ) ( ON ?auto_214272 ?auto_214271 ) ( ON ?auto_214273 ?auto_214272 ) ( ON ?auto_214274 ?auto_214273 ) ( not ( = ?auto_214269 ?auto_214270 ) ) ( not ( = ?auto_214269 ?auto_214271 ) ) ( not ( = ?auto_214269 ?auto_214272 ) ) ( not ( = ?auto_214269 ?auto_214273 ) ) ( not ( = ?auto_214269 ?auto_214274 ) ) ( not ( = ?auto_214269 ?auto_214275 ) ) ( not ( = ?auto_214269 ?auto_214276 ) ) ( not ( = ?auto_214269 ?auto_214277 ) ) ( not ( = ?auto_214269 ?auto_214278 ) ) ( not ( = ?auto_214269 ?auto_214279 ) ) ( not ( = ?auto_214269 ?auto_214280 ) ) ( not ( = ?auto_214270 ?auto_214271 ) ) ( not ( = ?auto_214270 ?auto_214272 ) ) ( not ( = ?auto_214270 ?auto_214273 ) ) ( not ( = ?auto_214270 ?auto_214274 ) ) ( not ( = ?auto_214270 ?auto_214275 ) ) ( not ( = ?auto_214270 ?auto_214276 ) ) ( not ( = ?auto_214270 ?auto_214277 ) ) ( not ( = ?auto_214270 ?auto_214278 ) ) ( not ( = ?auto_214270 ?auto_214279 ) ) ( not ( = ?auto_214270 ?auto_214280 ) ) ( not ( = ?auto_214271 ?auto_214272 ) ) ( not ( = ?auto_214271 ?auto_214273 ) ) ( not ( = ?auto_214271 ?auto_214274 ) ) ( not ( = ?auto_214271 ?auto_214275 ) ) ( not ( = ?auto_214271 ?auto_214276 ) ) ( not ( = ?auto_214271 ?auto_214277 ) ) ( not ( = ?auto_214271 ?auto_214278 ) ) ( not ( = ?auto_214271 ?auto_214279 ) ) ( not ( = ?auto_214271 ?auto_214280 ) ) ( not ( = ?auto_214272 ?auto_214273 ) ) ( not ( = ?auto_214272 ?auto_214274 ) ) ( not ( = ?auto_214272 ?auto_214275 ) ) ( not ( = ?auto_214272 ?auto_214276 ) ) ( not ( = ?auto_214272 ?auto_214277 ) ) ( not ( = ?auto_214272 ?auto_214278 ) ) ( not ( = ?auto_214272 ?auto_214279 ) ) ( not ( = ?auto_214272 ?auto_214280 ) ) ( not ( = ?auto_214273 ?auto_214274 ) ) ( not ( = ?auto_214273 ?auto_214275 ) ) ( not ( = ?auto_214273 ?auto_214276 ) ) ( not ( = ?auto_214273 ?auto_214277 ) ) ( not ( = ?auto_214273 ?auto_214278 ) ) ( not ( = ?auto_214273 ?auto_214279 ) ) ( not ( = ?auto_214273 ?auto_214280 ) ) ( not ( = ?auto_214274 ?auto_214275 ) ) ( not ( = ?auto_214274 ?auto_214276 ) ) ( not ( = ?auto_214274 ?auto_214277 ) ) ( not ( = ?auto_214274 ?auto_214278 ) ) ( not ( = ?auto_214274 ?auto_214279 ) ) ( not ( = ?auto_214274 ?auto_214280 ) ) ( not ( = ?auto_214275 ?auto_214276 ) ) ( not ( = ?auto_214275 ?auto_214277 ) ) ( not ( = ?auto_214275 ?auto_214278 ) ) ( not ( = ?auto_214275 ?auto_214279 ) ) ( not ( = ?auto_214275 ?auto_214280 ) ) ( not ( = ?auto_214276 ?auto_214277 ) ) ( not ( = ?auto_214276 ?auto_214278 ) ) ( not ( = ?auto_214276 ?auto_214279 ) ) ( not ( = ?auto_214276 ?auto_214280 ) ) ( not ( = ?auto_214277 ?auto_214278 ) ) ( not ( = ?auto_214277 ?auto_214279 ) ) ( not ( = ?auto_214277 ?auto_214280 ) ) ( not ( = ?auto_214278 ?auto_214279 ) ) ( not ( = ?auto_214278 ?auto_214280 ) ) ( not ( = ?auto_214279 ?auto_214280 ) ) ( ON ?auto_214278 ?auto_214279 ) ( ON ?auto_214277 ?auto_214278 ) ( ON ?auto_214276 ?auto_214277 ) ( CLEAR ?auto_214274 ) ( ON ?auto_214275 ?auto_214276 ) ( CLEAR ?auto_214275 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_214269 ?auto_214270 ?auto_214271 ?auto_214272 ?auto_214273 ?auto_214274 ?auto_214275 )
      ( MAKE-11PILE ?auto_214269 ?auto_214270 ?auto_214271 ?auto_214272 ?auto_214273 ?auto_214274 ?auto_214275 ?auto_214276 ?auto_214277 ?auto_214278 ?auto_214279 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_214292 - BLOCK
      ?auto_214293 - BLOCK
      ?auto_214294 - BLOCK
      ?auto_214295 - BLOCK
      ?auto_214296 - BLOCK
      ?auto_214297 - BLOCK
      ?auto_214298 - BLOCK
      ?auto_214299 - BLOCK
      ?auto_214300 - BLOCK
      ?auto_214301 - BLOCK
      ?auto_214302 - BLOCK
    )
    :vars
    (
      ?auto_214303 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_214302 ?auto_214303 ) ( ON-TABLE ?auto_214292 ) ( ON ?auto_214293 ?auto_214292 ) ( ON ?auto_214294 ?auto_214293 ) ( ON ?auto_214295 ?auto_214294 ) ( ON ?auto_214296 ?auto_214295 ) ( ON ?auto_214297 ?auto_214296 ) ( not ( = ?auto_214292 ?auto_214293 ) ) ( not ( = ?auto_214292 ?auto_214294 ) ) ( not ( = ?auto_214292 ?auto_214295 ) ) ( not ( = ?auto_214292 ?auto_214296 ) ) ( not ( = ?auto_214292 ?auto_214297 ) ) ( not ( = ?auto_214292 ?auto_214298 ) ) ( not ( = ?auto_214292 ?auto_214299 ) ) ( not ( = ?auto_214292 ?auto_214300 ) ) ( not ( = ?auto_214292 ?auto_214301 ) ) ( not ( = ?auto_214292 ?auto_214302 ) ) ( not ( = ?auto_214292 ?auto_214303 ) ) ( not ( = ?auto_214293 ?auto_214294 ) ) ( not ( = ?auto_214293 ?auto_214295 ) ) ( not ( = ?auto_214293 ?auto_214296 ) ) ( not ( = ?auto_214293 ?auto_214297 ) ) ( not ( = ?auto_214293 ?auto_214298 ) ) ( not ( = ?auto_214293 ?auto_214299 ) ) ( not ( = ?auto_214293 ?auto_214300 ) ) ( not ( = ?auto_214293 ?auto_214301 ) ) ( not ( = ?auto_214293 ?auto_214302 ) ) ( not ( = ?auto_214293 ?auto_214303 ) ) ( not ( = ?auto_214294 ?auto_214295 ) ) ( not ( = ?auto_214294 ?auto_214296 ) ) ( not ( = ?auto_214294 ?auto_214297 ) ) ( not ( = ?auto_214294 ?auto_214298 ) ) ( not ( = ?auto_214294 ?auto_214299 ) ) ( not ( = ?auto_214294 ?auto_214300 ) ) ( not ( = ?auto_214294 ?auto_214301 ) ) ( not ( = ?auto_214294 ?auto_214302 ) ) ( not ( = ?auto_214294 ?auto_214303 ) ) ( not ( = ?auto_214295 ?auto_214296 ) ) ( not ( = ?auto_214295 ?auto_214297 ) ) ( not ( = ?auto_214295 ?auto_214298 ) ) ( not ( = ?auto_214295 ?auto_214299 ) ) ( not ( = ?auto_214295 ?auto_214300 ) ) ( not ( = ?auto_214295 ?auto_214301 ) ) ( not ( = ?auto_214295 ?auto_214302 ) ) ( not ( = ?auto_214295 ?auto_214303 ) ) ( not ( = ?auto_214296 ?auto_214297 ) ) ( not ( = ?auto_214296 ?auto_214298 ) ) ( not ( = ?auto_214296 ?auto_214299 ) ) ( not ( = ?auto_214296 ?auto_214300 ) ) ( not ( = ?auto_214296 ?auto_214301 ) ) ( not ( = ?auto_214296 ?auto_214302 ) ) ( not ( = ?auto_214296 ?auto_214303 ) ) ( not ( = ?auto_214297 ?auto_214298 ) ) ( not ( = ?auto_214297 ?auto_214299 ) ) ( not ( = ?auto_214297 ?auto_214300 ) ) ( not ( = ?auto_214297 ?auto_214301 ) ) ( not ( = ?auto_214297 ?auto_214302 ) ) ( not ( = ?auto_214297 ?auto_214303 ) ) ( not ( = ?auto_214298 ?auto_214299 ) ) ( not ( = ?auto_214298 ?auto_214300 ) ) ( not ( = ?auto_214298 ?auto_214301 ) ) ( not ( = ?auto_214298 ?auto_214302 ) ) ( not ( = ?auto_214298 ?auto_214303 ) ) ( not ( = ?auto_214299 ?auto_214300 ) ) ( not ( = ?auto_214299 ?auto_214301 ) ) ( not ( = ?auto_214299 ?auto_214302 ) ) ( not ( = ?auto_214299 ?auto_214303 ) ) ( not ( = ?auto_214300 ?auto_214301 ) ) ( not ( = ?auto_214300 ?auto_214302 ) ) ( not ( = ?auto_214300 ?auto_214303 ) ) ( not ( = ?auto_214301 ?auto_214302 ) ) ( not ( = ?auto_214301 ?auto_214303 ) ) ( not ( = ?auto_214302 ?auto_214303 ) ) ( ON ?auto_214301 ?auto_214302 ) ( ON ?auto_214300 ?auto_214301 ) ( ON ?auto_214299 ?auto_214300 ) ( CLEAR ?auto_214297 ) ( ON ?auto_214298 ?auto_214299 ) ( CLEAR ?auto_214298 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_214292 ?auto_214293 ?auto_214294 ?auto_214295 ?auto_214296 ?auto_214297 ?auto_214298 )
      ( MAKE-11PILE ?auto_214292 ?auto_214293 ?auto_214294 ?auto_214295 ?auto_214296 ?auto_214297 ?auto_214298 ?auto_214299 ?auto_214300 ?auto_214301 ?auto_214302 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_214315 - BLOCK
      ?auto_214316 - BLOCK
      ?auto_214317 - BLOCK
      ?auto_214318 - BLOCK
      ?auto_214319 - BLOCK
      ?auto_214320 - BLOCK
      ?auto_214321 - BLOCK
      ?auto_214322 - BLOCK
      ?auto_214323 - BLOCK
      ?auto_214324 - BLOCK
      ?auto_214325 - BLOCK
    )
    :vars
    (
      ?auto_214326 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_214325 ?auto_214326 ) ( ON-TABLE ?auto_214315 ) ( ON ?auto_214316 ?auto_214315 ) ( ON ?auto_214317 ?auto_214316 ) ( ON ?auto_214318 ?auto_214317 ) ( ON ?auto_214319 ?auto_214318 ) ( not ( = ?auto_214315 ?auto_214316 ) ) ( not ( = ?auto_214315 ?auto_214317 ) ) ( not ( = ?auto_214315 ?auto_214318 ) ) ( not ( = ?auto_214315 ?auto_214319 ) ) ( not ( = ?auto_214315 ?auto_214320 ) ) ( not ( = ?auto_214315 ?auto_214321 ) ) ( not ( = ?auto_214315 ?auto_214322 ) ) ( not ( = ?auto_214315 ?auto_214323 ) ) ( not ( = ?auto_214315 ?auto_214324 ) ) ( not ( = ?auto_214315 ?auto_214325 ) ) ( not ( = ?auto_214315 ?auto_214326 ) ) ( not ( = ?auto_214316 ?auto_214317 ) ) ( not ( = ?auto_214316 ?auto_214318 ) ) ( not ( = ?auto_214316 ?auto_214319 ) ) ( not ( = ?auto_214316 ?auto_214320 ) ) ( not ( = ?auto_214316 ?auto_214321 ) ) ( not ( = ?auto_214316 ?auto_214322 ) ) ( not ( = ?auto_214316 ?auto_214323 ) ) ( not ( = ?auto_214316 ?auto_214324 ) ) ( not ( = ?auto_214316 ?auto_214325 ) ) ( not ( = ?auto_214316 ?auto_214326 ) ) ( not ( = ?auto_214317 ?auto_214318 ) ) ( not ( = ?auto_214317 ?auto_214319 ) ) ( not ( = ?auto_214317 ?auto_214320 ) ) ( not ( = ?auto_214317 ?auto_214321 ) ) ( not ( = ?auto_214317 ?auto_214322 ) ) ( not ( = ?auto_214317 ?auto_214323 ) ) ( not ( = ?auto_214317 ?auto_214324 ) ) ( not ( = ?auto_214317 ?auto_214325 ) ) ( not ( = ?auto_214317 ?auto_214326 ) ) ( not ( = ?auto_214318 ?auto_214319 ) ) ( not ( = ?auto_214318 ?auto_214320 ) ) ( not ( = ?auto_214318 ?auto_214321 ) ) ( not ( = ?auto_214318 ?auto_214322 ) ) ( not ( = ?auto_214318 ?auto_214323 ) ) ( not ( = ?auto_214318 ?auto_214324 ) ) ( not ( = ?auto_214318 ?auto_214325 ) ) ( not ( = ?auto_214318 ?auto_214326 ) ) ( not ( = ?auto_214319 ?auto_214320 ) ) ( not ( = ?auto_214319 ?auto_214321 ) ) ( not ( = ?auto_214319 ?auto_214322 ) ) ( not ( = ?auto_214319 ?auto_214323 ) ) ( not ( = ?auto_214319 ?auto_214324 ) ) ( not ( = ?auto_214319 ?auto_214325 ) ) ( not ( = ?auto_214319 ?auto_214326 ) ) ( not ( = ?auto_214320 ?auto_214321 ) ) ( not ( = ?auto_214320 ?auto_214322 ) ) ( not ( = ?auto_214320 ?auto_214323 ) ) ( not ( = ?auto_214320 ?auto_214324 ) ) ( not ( = ?auto_214320 ?auto_214325 ) ) ( not ( = ?auto_214320 ?auto_214326 ) ) ( not ( = ?auto_214321 ?auto_214322 ) ) ( not ( = ?auto_214321 ?auto_214323 ) ) ( not ( = ?auto_214321 ?auto_214324 ) ) ( not ( = ?auto_214321 ?auto_214325 ) ) ( not ( = ?auto_214321 ?auto_214326 ) ) ( not ( = ?auto_214322 ?auto_214323 ) ) ( not ( = ?auto_214322 ?auto_214324 ) ) ( not ( = ?auto_214322 ?auto_214325 ) ) ( not ( = ?auto_214322 ?auto_214326 ) ) ( not ( = ?auto_214323 ?auto_214324 ) ) ( not ( = ?auto_214323 ?auto_214325 ) ) ( not ( = ?auto_214323 ?auto_214326 ) ) ( not ( = ?auto_214324 ?auto_214325 ) ) ( not ( = ?auto_214324 ?auto_214326 ) ) ( not ( = ?auto_214325 ?auto_214326 ) ) ( ON ?auto_214324 ?auto_214325 ) ( ON ?auto_214323 ?auto_214324 ) ( ON ?auto_214322 ?auto_214323 ) ( ON ?auto_214321 ?auto_214322 ) ( CLEAR ?auto_214319 ) ( ON ?auto_214320 ?auto_214321 ) ( CLEAR ?auto_214320 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_214315 ?auto_214316 ?auto_214317 ?auto_214318 ?auto_214319 ?auto_214320 )
      ( MAKE-11PILE ?auto_214315 ?auto_214316 ?auto_214317 ?auto_214318 ?auto_214319 ?auto_214320 ?auto_214321 ?auto_214322 ?auto_214323 ?auto_214324 ?auto_214325 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_214338 - BLOCK
      ?auto_214339 - BLOCK
      ?auto_214340 - BLOCK
      ?auto_214341 - BLOCK
      ?auto_214342 - BLOCK
      ?auto_214343 - BLOCK
      ?auto_214344 - BLOCK
      ?auto_214345 - BLOCK
      ?auto_214346 - BLOCK
      ?auto_214347 - BLOCK
      ?auto_214348 - BLOCK
    )
    :vars
    (
      ?auto_214349 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_214348 ?auto_214349 ) ( ON-TABLE ?auto_214338 ) ( ON ?auto_214339 ?auto_214338 ) ( ON ?auto_214340 ?auto_214339 ) ( ON ?auto_214341 ?auto_214340 ) ( ON ?auto_214342 ?auto_214341 ) ( not ( = ?auto_214338 ?auto_214339 ) ) ( not ( = ?auto_214338 ?auto_214340 ) ) ( not ( = ?auto_214338 ?auto_214341 ) ) ( not ( = ?auto_214338 ?auto_214342 ) ) ( not ( = ?auto_214338 ?auto_214343 ) ) ( not ( = ?auto_214338 ?auto_214344 ) ) ( not ( = ?auto_214338 ?auto_214345 ) ) ( not ( = ?auto_214338 ?auto_214346 ) ) ( not ( = ?auto_214338 ?auto_214347 ) ) ( not ( = ?auto_214338 ?auto_214348 ) ) ( not ( = ?auto_214338 ?auto_214349 ) ) ( not ( = ?auto_214339 ?auto_214340 ) ) ( not ( = ?auto_214339 ?auto_214341 ) ) ( not ( = ?auto_214339 ?auto_214342 ) ) ( not ( = ?auto_214339 ?auto_214343 ) ) ( not ( = ?auto_214339 ?auto_214344 ) ) ( not ( = ?auto_214339 ?auto_214345 ) ) ( not ( = ?auto_214339 ?auto_214346 ) ) ( not ( = ?auto_214339 ?auto_214347 ) ) ( not ( = ?auto_214339 ?auto_214348 ) ) ( not ( = ?auto_214339 ?auto_214349 ) ) ( not ( = ?auto_214340 ?auto_214341 ) ) ( not ( = ?auto_214340 ?auto_214342 ) ) ( not ( = ?auto_214340 ?auto_214343 ) ) ( not ( = ?auto_214340 ?auto_214344 ) ) ( not ( = ?auto_214340 ?auto_214345 ) ) ( not ( = ?auto_214340 ?auto_214346 ) ) ( not ( = ?auto_214340 ?auto_214347 ) ) ( not ( = ?auto_214340 ?auto_214348 ) ) ( not ( = ?auto_214340 ?auto_214349 ) ) ( not ( = ?auto_214341 ?auto_214342 ) ) ( not ( = ?auto_214341 ?auto_214343 ) ) ( not ( = ?auto_214341 ?auto_214344 ) ) ( not ( = ?auto_214341 ?auto_214345 ) ) ( not ( = ?auto_214341 ?auto_214346 ) ) ( not ( = ?auto_214341 ?auto_214347 ) ) ( not ( = ?auto_214341 ?auto_214348 ) ) ( not ( = ?auto_214341 ?auto_214349 ) ) ( not ( = ?auto_214342 ?auto_214343 ) ) ( not ( = ?auto_214342 ?auto_214344 ) ) ( not ( = ?auto_214342 ?auto_214345 ) ) ( not ( = ?auto_214342 ?auto_214346 ) ) ( not ( = ?auto_214342 ?auto_214347 ) ) ( not ( = ?auto_214342 ?auto_214348 ) ) ( not ( = ?auto_214342 ?auto_214349 ) ) ( not ( = ?auto_214343 ?auto_214344 ) ) ( not ( = ?auto_214343 ?auto_214345 ) ) ( not ( = ?auto_214343 ?auto_214346 ) ) ( not ( = ?auto_214343 ?auto_214347 ) ) ( not ( = ?auto_214343 ?auto_214348 ) ) ( not ( = ?auto_214343 ?auto_214349 ) ) ( not ( = ?auto_214344 ?auto_214345 ) ) ( not ( = ?auto_214344 ?auto_214346 ) ) ( not ( = ?auto_214344 ?auto_214347 ) ) ( not ( = ?auto_214344 ?auto_214348 ) ) ( not ( = ?auto_214344 ?auto_214349 ) ) ( not ( = ?auto_214345 ?auto_214346 ) ) ( not ( = ?auto_214345 ?auto_214347 ) ) ( not ( = ?auto_214345 ?auto_214348 ) ) ( not ( = ?auto_214345 ?auto_214349 ) ) ( not ( = ?auto_214346 ?auto_214347 ) ) ( not ( = ?auto_214346 ?auto_214348 ) ) ( not ( = ?auto_214346 ?auto_214349 ) ) ( not ( = ?auto_214347 ?auto_214348 ) ) ( not ( = ?auto_214347 ?auto_214349 ) ) ( not ( = ?auto_214348 ?auto_214349 ) ) ( ON ?auto_214347 ?auto_214348 ) ( ON ?auto_214346 ?auto_214347 ) ( ON ?auto_214345 ?auto_214346 ) ( ON ?auto_214344 ?auto_214345 ) ( CLEAR ?auto_214342 ) ( ON ?auto_214343 ?auto_214344 ) ( CLEAR ?auto_214343 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_214338 ?auto_214339 ?auto_214340 ?auto_214341 ?auto_214342 ?auto_214343 )
      ( MAKE-11PILE ?auto_214338 ?auto_214339 ?auto_214340 ?auto_214341 ?auto_214342 ?auto_214343 ?auto_214344 ?auto_214345 ?auto_214346 ?auto_214347 ?auto_214348 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_214361 - BLOCK
      ?auto_214362 - BLOCK
      ?auto_214363 - BLOCK
      ?auto_214364 - BLOCK
      ?auto_214365 - BLOCK
      ?auto_214366 - BLOCK
      ?auto_214367 - BLOCK
      ?auto_214368 - BLOCK
      ?auto_214369 - BLOCK
      ?auto_214370 - BLOCK
      ?auto_214371 - BLOCK
    )
    :vars
    (
      ?auto_214372 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_214371 ?auto_214372 ) ( ON-TABLE ?auto_214361 ) ( ON ?auto_214362 ?auto_214361 ) ( ON ?auto_214363 ?auto_214362 ) ( ON ?auto_214364 ?auto_214363 ) ( not ( = ?auto_214361 ?auto_214362 ) ) ( not ( = ?auto_214361 ?auto_214363 ) ) ( not ( = ?auto_214361 ?auto_214364 ) ) ( not ( = ?auto_214361 ?auto_214365 ) ) ( not ( = ?auto_214361 ?auto_214366 ) ) ( not ( = ?auto_214361 ?auto_214367 ) ) ( not ( = ?auto_214361 ?auto_214368 ) ) ( not ( = ?auto_214361 ?auto_214369 ) ) ( not ( = ?auto_214361 ?auto_214370 ) ) ( not ( = ?auto_214361 ?auto_214371 ) ) ( not ( = ?auto_214361 ?auto_214372 ) ) ( not ( = ?auto_214362 ?auto_214363 ) ) ( not ( = ?auto_214362 ?auto_214364 ) ) ( not ( = ?auto_214362 ?auto_214365 ) ) ( not ( = ?auto_214362 ?auto_214366 ) ) ( not ( = ?auto_214362 ?auto_214367 ) ) ( not ( = ?auto_214362 ?auto_214368 ) ) ( not ( = ?auto_214362 ?auto_214369 ) ) ( not ( = ?auto_214362 ?auto_214370 ) ) ( not ( = ?auto_214362 ?auto_214371 ) ) ( not ( = ?auto_214362 ?auto_214372 ) ) ( not ( = ?auto_214363 ?auto_214364 ) ) ( not ( = ?auto_214363 ?auto_214365 ) ) ( not ( = ?auto_214363 ?auto_214366 ) ) ( not ( = ?auto_214363 ?auto_214367 ) ) ( not ( = ?auto_214363 ?auto_214368 ) ) ( not ( = ?auto_214363 ?auto_214369 ) ) ( not ( = ?auto_214363 ?auto_214370 ) ) ( not ( = ?auto_214363 ?auto_214371 ) ) ( not ( = ?auto_214363 ?auto_214372 ) ) ( not ( = ?auto_214364 ?auto_214365 ) ) ( not ( = ?auto_214364 ?auto_214366 ) ) ( not ( = ?auto_214364 ?auto_214367 ) ) ( not ( = ?auto_214364 ?auto_214368 ) ) ( not ( = ?auto_214364 ?auto_214369 ) ) ( not ( = ?auto_214364 ?auto_214370 ) ) ( not ( = ?auto_214364 ?auto_214371 ) ) ( not ( = ?auto_214364 ?auto_214372 ) ) ( not ( = ?auto_214365 ?auto_214366 ) ) ( not ( = ?auto_214365 ?auto_214367 ) ) ( not ( = ?auto_214365 ?auto_214368 ) ) ( not ( = ?auto_214365 ?auto_214369 ) ) ( not ( = ?auto_214365 ?auto_214370 ) ) ( not ( = ?auto_214365 ?auto_214371 ) ) ( not ( = ?auto_214365 ?auto_214372 ) ) ( not ( = ?auto_214366 ?auto_214367 ) ) ( not ( = ?auto_214366 ?auto_214368 ) ) ( not ( = ?auto_214366 ?auto_214369 ) ) ( not ( = ?auto_214366 ?auto_214370 ) ) ( not ( = ?auto_214366 ?auto_214371 ) ) ( not ( = ?auto_214366 ?auto_214372 ) ) ( not ( = ?auto_214367 ?auto_214368 ) ) ( not ( = ?auto_214367 ?auto_214369 ) ) ( not ( = ?auto_214367 ?auto_214370 ) ) ( not ( = ?auto_214367 ?auto_214371 ) ) ( not ( = ?auto_214367 ?auto_214372 ) ) ( not ( = ?auto_214368 ?auto_214369 ) ) ( not ( = ?auto_214368 ?auto_214370 ) ) ( not ( = ?auto_214368 ?auto_214371 ) ) ( not ( = ?auto_214368 ?auto_214372 ) ) ( not ( = ?auto_214369 ?auto_214370 ) ) ( not ( = ?auto_214369 ?auto_214371 ) ) ( not ( = ?auto_214369 ?auto_214372 ) ) ( not ( = ?auto_214370 ?auto_214371 ) ) ( not ( = ?auto_214370 ?auto_214372 ) ) ( not ( = ?auto_214371 ?auto_214372 ) ) ( ON ?auto_214370 ?auto_214371 ) ( ON ?auto_214369 ?auto_214370 ) ( ON ?auto_214368 ?auto_214369 ) ( ON ?auto_214367 ?auto_214368 ) ( ON ?auto_214366 ?auto_214367 ) ( CLEAR ?auto_214364 ) ( ON ?auto_214365 ?auto_214366 ) ( CLEAR ?auto_214365 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_214361 ?auto_214362 ?auto_214363 ?auto_214364 ?auto_214365 )
      ( MAKE-11PILE ?auto_214361 ?auto_214362 ?auto_214363 ?auto_214364 ?auto_214365 ?auto_214366 ?auto_214367 ?auto_214368 ?auto_214369 ?auto_214370 ?auto_214371 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_214384 - BLOCK
      ?auto_214385 - BLOCK
      ?auto_214386 - BLOCK
      ?auto_214387 - BLOCK
      ?auto_214388 - BLOCK
      ?auto_214389 - BLOCK
      ?auto_214390 - BLOCK
      ?auto_214391 - BLOCK
      ?auto_214392 - BLOCK
      ?auto_214393 - BLOCK
      ?auto_214394 - BLOCK
    )
    :vars
    (
      ?auto_214395 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_214394 ?auto_214395 ) ( ON-TABLE ?auto_214384 ) ( ON ?auto_214385 ?auto_214384 ) ( ON ?auto_214386 ?auto_214385 ) ( ON ?auto_214387 ?auto_214386 ) ( not ( = ?auto_214384 ?auto_214385 ) ) ( not ( = ?auto_214384 ?auto_214386 ) ) ( not ( = ?auto_214384 ?auto_214387 ) ) ( not ( = ?auto_214384 ?auto_214388 ) ) ( not ( = ?auto_214384 ?auto_214389 ) ) ( not ( = ?auto_214384 ?auto_214390 ) ) ( not ( = ?auto_214384 ?auto_214391 ) ) ( not ( = ?auto_214384 ?auto_214392 ) ) ( not ( = ?auto_214384 ?auto_214393 ) ) ( not ( = ?auto_214384 ?auto_214394 ) ) ( not ( = ?auto_214384 ?auto_214395 ) ) ( not ( = ?auto_214385 ?auto_214386 ) ) ( not ( = ?auto_214385 ?auto_214387 ) ) ( not ( = ?auto_214385 ?auto_214388 ) ) ( not ( = ?auto_214385 ?auto_214389 ) ) ( not ( = ?auto_214385 ?auto_214390 ) ) ( not ( = ?auto_214385 ?auto_214391 ) ) ( not ( = ?auto_214385 ?auto_214392 ) ) ( not ( = ?auto_214385 ?auto_214393 ) ) ( not ( = ?auto_214385 ?auto_214394 ) ) ( not ( = ?auto_214385 ?auto_214395 ) ) ( not ( = ?auto_214386 ?auto_214387 ) ) ( not ( = ?auto_214386 ?auto_214388 ) ) ( not ( = ?auto_214386 ?auto_214389 ) ) ( not ( = ?auto_214386 ?auto_214390 ) ) ( not ( = ?auto_214386 ?auto_214391 ) ) ( not ( = ?auto_214386 ?auto_214392 ) ) ( not ( = ?auto_214386 ?auto_214393 ) ) ( not ( = ?auto_214386 ?auto_214394 ) ) ( not ( = ?auto_214386 ?auto_214395 ) ) ( not ( = ?auto_214387 ?auto_214388 ) ) ( not ( = ?auto_214387 ?auto_214389 ) ) ( not ( = ?auto_214387 ?auto_214390 ) ) ( not ( = ?auto_214387 ?auto_214391 ) ) ( not ( = ?auto_214387 ?auto_214392 ) ) ( not ( = ?auto_214387 ?auto_214393 ) ) ( not ( = ?auto_214387 ?auto_214394 ) ) ( not ( = ?auto_214387 ?auto_214395 ) ) ( not ( = ?auto_214388 ?auto_214389 ) ) ( not ( = ?auto_214388 ?auto_214390 ) ) ( not ( = ?auto_214388 ?auto_214391 ) ) ( not ( = ?auto_214388 ?auto_214392 ) ) ( not ( = ?auto_214388 ?auto_214393 ) ) ( not ( = ?auto_214388 ?auto_214394 ) ) ( not ( = ?auto_214388 ?auto_214395 ) ) ( not ( = ?auto_214389 ?auto_214390 ) ) ( not ( = ?auto_214389 ?auto_214391 ) ) ( not ( = ?auto_214389 ?auto_214392 ) ) ( not ( = ?auto_214389 ?auto_214393 ) ) ( not ( = ?auto_214389 ?auto_214394 ) ) ( not ( = ?auto_214389 ?auto_214395 ) ) ( not ( = ?auto_214390 ?auto_214391 ) ) ( not ( = ?auto_214390 ?auto_214392 ) ) ( not ( = ?auto_214390 ?auto_214393 ) ) ( not ( = ?auto_214390 ?auto_214394 ) ) ( not ( = ?auto_214390 ?auto_214395 ) ) ( not ( = ?auto_214391 ?auto_214392 ) ) ( not ( = ?auto_214391 ?auto_214393 ) ) ( not ( = ?auto_214391 ?auto_214394 ) ) ( not ( = ?auto_214391 ?auto_214395 ) ) ( not ( = ?auto_214392 ?auto_214393 ) ) ( not ( = ?auto_214392 ?auto_214394 ) ) ( not ( = ?auto_214392 ?auto_214395 ) ) ( not ( = ?auto_214393 ?auto_214394 ) ) ( not ( = ?auto_214393 ?auto_214395 ) ) ( not ( = ?auto_214394 ?auto_214395 ) ) ( ON ?auto_214393 ?auto_214394 ) ( ON ?auto_214392 ?auto_214393 ) ( ON ?auto_214391 ?auto_214392 ) ( ON ?auto_214390 ?auto_214391 ) ( ON ?auto_214389 ?auto_214390 ) ( CLEAR ?auto_214387 ) ( ON ?auto_214388 ?auto_214389 ) ( CLEAR ?auto_214388 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_214384 ?auto_214385 ?auto_214386 ?auto_214387 ?auto_214388 )
      ( MAKE-11PILE ?auto_214384 ?auto_214385 ?auto_214386 ?auto_214387 ?auto_214388 ?auto_214389 ?auto_214390 ?auto_214391 ?auto_214392 ?auto_214393 ?auto_214394 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_214407 - BLOCK
      ?auto_214408 - BLOCK
      ?auto_214409 - BLOCK
      ?auto_214410 - BLOCK
      ?auto_214411 - BLOCK
      ?auto_214412 - BLOCK
      ?auto_214413 - BLOCK
      ?auto_214414 - BLOCK
      ?auto_214415 - BLOCK
      ?auto_214416 - BLOCK
      ?auto_214417 - BLOCK
    )
    :vars
    (
      ?auto_214418 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_214417 ?auto_214418 ) ( ON-TABLE ?auto_214407 ) ( ON ?auto_214408 ?auto_214407 ) ( ON ?auto_214409 ?auto_214408 ) ( not ( = ?auto_214407 ?auto_214408 ) ) ( not ( = ?auto_214407 ?auto_214409 ) ) ( not ( = ?auto_214407 ?auto_214410 ) ) ( not ( = ?auto_214407 ?auto_214411 ) ) ( not ( = ?auto_214407 ?auto_214412 ) ) ( not ( = ?auto_214407 ?auto_214413 ) ) ( not ( = ?auto_214407 ?auto_214414 ) ) ( not ( = ?auto_214407 ?auto_214415 ) ) ( not ( = ?auto_214407 ?auto_214416 ) ) ( not ( = ?auto_214407 ?auto_214417 ) ) ( not ( = ?auto_214407 ?auto_214418 ) ) ( not ( = ?auto_214408 ?auto_214409 ) ) ( not ( = ?auto_214408 ?auto_214410 ) ) ( not ( = ?auto_214408 ?auto_214411 ) ) ( not ( = ?auto_214408 ?auto_214412 ) ) ( not ( = ?auto_214408 ?auto_214413 ) ) ( not ( = ?auto_214408 ?auto_214414 ) ) ( not ( = ?auto_214408 ?auto_214415 ) ) ( not ( = ?auto_214408 ?auto_214416 ) ) ( not ( = ?auto_214408 ?auto_214417 ) ) ( not ( = ?auto_214408 ?auto_214418 ) ) ( not ( = ?auto_214409 ?auto_214410 ) ) ( not ( = ?auto_214409 ?auto_214411 ) ) ( not ( = ?auto_214409 ?auto_214412 ) ) ( not ( = ?auto_214409 ?auto_214413 ) ) ( not ( = ?auto_214409 ?auto_214414 ) ) ( not ( = ?auto_214409 ?auto_214415 ) ) ( not ( = ?auto_214409 ?auto_214416 ) ) ( not ( = ?auto_214409 ?auto_214417 ) ) ( not ( = ?auto_214409 ?auto_214418 ) ) ( not ( = ?auto_214410 ?auto_214411 ) ) ( not ( = ?auto_214410 ?auto_214412 ) ) ( not ( = ?auto_214410 ?auto_214413 ) ) ( not ( = ?auto_214410 ?auto_214414 ) ) ( not ( = ?auto_214410 ?auto_214415 ) ) ( not ( = ?auto_214410 ?auto_214416 ) ) ( not ( = ?auto_214410 ?auto_214417 ) ) ( not ( = ?auto_214410 ?auto_214418 ) ) ( not ( = ?auto_214411 ?auto_214412 ) ) ( not ( = ?auto_214411 ?auto_214413 ) ) ( not ( = ?auto_214411 ?auto_214414 ) ) ( not ( = ?auto_214411 ?auto_214415 ) ) ( not ( = ?auto_214411 ?auto_214416 ) ) ( not ( = ?auto_214411 ?auto_214417 ) ) ( not ( = ?auto_214411 ?auto_214418 ) ) ( not ( = ?auto_214412 ?auto_214413 ) ) ( not ( = ?auto_214412 ?auto_214414 ) ) ( not ( = ?auto_214412 ?auto_214415 ) ) ( not ( = ?auto_214412 ?auto_214416 ) ) ( not ( = ?auto_214412 ?auto_214417 ) ) ( not ( = ?auto_214412 ?auto_214418 ) ) ( not ( = ?auto_214413 ?auto_214414 ) ) ( not ( = ?auto_214413 ?auto_214415 ) ) ( not ( = ?auto_214413 ?auto_214416 ) ) ( not ( = ?auto_214413 ?auto_214417 ) ) ( not ( = ?auto_214413 ?auto_214418 ) ) ( not ( = ?auto_214414 ?auto_214415 ) ) ( not ( = ?auto_214414 ?auto_214416 ) ) ( not ( = ?auto_214414 ?auto_214417 ) ) ( not ( = ?auto_214414 ?auto_214418 ) ) ( not ( = ?auto_214415 ?auto_214416 ) ) ( not ( = ?auto_214415 ?auto_214417 ) ) ( not ( = ?auto_214415 ?auto_214418 ) ) ( not ( = ?auto_214416 ?auto_214417 ) ) ( not ( = ?auto_214416 ?auto_214418 ) ) ( not ( = ?auto_214417 ?auto_214418 ) ) ( ON ?auto_214416 ?auto_214417 ) ( ON ?auto_214415 ?auto_214416 ) ( ON ?auto_214414 ?auto_214415 ) ( ON ?auto_214413 ?auto_214414 ) ( ON ?auto_214412 ?auto_214413 ) ( ON ?auto_214411 ?auto_214412 ) ( CLEAR ?auto_214409 ) ( ON ?auto_214410 ?auto_214411 ) ( CLEAR ?auto_214410 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_214407 ?auto_214408 ?auto_214409 ?auto_214410 )
      ( MAKE-11PILE ?auto_214407 ?auto_214408 ?auto_214409 ?auto_214410 ?auto_214411 ?auto_214412 ?auto_214413 ?auto_214414 ?auto_214415 ?auto_214416 ?auto_214417 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_214430 - BLOCK
      ?auto_214431 - BLOCK
      ?auto_214432 - BLOCK
      ?auto_214433 - BLOCK
      ?auto_214434 - BLOCK
      ?auto_214435 - BLOCK
      ?auto_214436 - BLOCK
      ?auto_214437 - BLOCK
      ?auto_214438 - BLOCK
      ?auto_214439 - BLOCK
      ?auto_214440 - BLOCK
    )
    :vars
    (
      ?auto_214441 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_214440 ?auto_214441 ) ( ON-TABLE ?auto_214430 ) ( ON ?auto_214431 ?auto_214430 ) ( ON ?auto_214432 ?auto_214431 ) ( not ( = ?auto_214430 ?auto_214431 ) ) ( not ( = ?auto_214430 ?auto_214432 ) ) ( not ( = ?auto_214430 ?auto_214433 ) ) ( not ( = ?auto_214430 ?auto_214434 ) ) ( not ( = ?auto_214430 ?auto_214435 ) ) ( not ( = ?auto_214430 ?auto_214436 ) ) ( not ( = ?auto_214430 ?auto_214437 ) ) ( not ( = ?auto_214430 ?auto_214438 ) ) ( not ( = ?auto_214430 ?auto_214439 ) ) ( not ( = ?auto_214430 ?auto_214440 ) ) ( not ( = ?auto_214430 ?auto_214441 ) ) ( not ( = ?auto_214431 ?auto_214432 ) ) ( not ( = ?auto_214431 ?auto_214433 ) ) ( not ( = ?auto_214431 ?auto_214434 ) ) ( not ( = ?auto_214431 ?auto_214435 ) ) ( not ( = ?auto_214431 ?auto_214436 ) ) ( not ( = ?auto_214431 ?auto_214437 ) ) ( not ( = ?auto_214431 ?auto_214438 ) ) ( not ( = ?auto_214431 ?auto_214439 ) ) ( not ( = ?auto_214431 ?auto_214440 ) ) ( not ( = ?auto_214431 ?auto_214441 ) ) ( not ( = ?auto_214432 ?auto_214433 ) ) ( not ( = ?auto_214432 ?auto_214434 ) ) ( not ( = ?auto_214432 ?auto_214435 ) ) ( not ( = ?auto_214432 ?auto_214436 ) ) ( not ( = ?auto_214432 ?auto_214437 ) ) ( not ( = ?auto_214432 ?auto_214438 ) ) ( not ( = ?auto_214432 ?auto_214439 ) ) ( not ( = ?auto_214432 ?auto_214440 ) ) ( not ( = ?auto_214432 ?auto_214441 ) ) ( not ( = ?auto_214433 ?auto_214434 ) ) ( not ( = ?auto_214433 ?auto_214435 ) ) ( not ( = ?auto_214433 ?auto_214436 ) ) ( not ( = ?auto_214433 ?auto_214437 ) ) ( not ( = ?auto_214433 ?auto_214438 ) ) ( not ( = ?auto_214433 ?auto_214439 ) ) ( not ( = ?auto_214433 ?auto_214440 ) ) ( not ( = ?auto_214433 ?auto_214441 ) ) ( not ( = ?auto_214434 ?auto_214435 ) ) ( not ( = ?auto_214434 ?auto_214436 ) ) ( not ( = ?auto_214434 ?auto_214437 ) ) ( not ( = ?auto_214434 ?auto_214438 ) ) ( not ( = ?auto_214434 ?auto_214439 ) ) ( not ( = ?auto_214434 ?auto_214440 ) ) ( not ( = ?auto_214434 ?auto_214441 ) ) ( not ( = ?auto_214435 ?auto_214436 ) ) ( not ( = ?auto_214435 ?auto_214437 ) ) ( not ( = ?auto_214435 ?auto_214438 ) ) ( not ( = ?auto_214435 ?auto_214439 ) ) ( not ( = ?auto_214435 ?auto_214440 ) ) ( not ( = ?auto_214435 ?auto_214441 ) ) ( not ( = ?auto_214436 ?auto_214437 ) ) ( not ( = ?auto_214436 ?auto_214438 ) ) ( not ( = ?auto_214436 ?auto_214439 ) ) ( not ( = ?auto_214436 ?auto_214440 ) ) ( not ( = ?auto_214436 ?auto_214441 ) ) ( not ( = ?auto_214437 ?auto_214438 ) ) ( not ( = ?auto_214437 ?auto_214439 ) ) ( not ( = ?auto_214437 ?auto_214440 ) ) ( not ( = ?auto_214437 ?auto_214441 ) ) ( not ( = ?auto_214438 ?auto_214439 ) ) ( not ( = ?auto_214438 ?auto_214440 ) ) ( not ( = ?auto_214438 ?auto_214441 ) ) ( not ( = ?auto_214439 ?auto_214440 ) ) ( not ( = ?auto_214439 ?auto_214441 ) ) ( not ( = ?auto_214440 ?auto_214441 ) ) ( ON ?auto_214439 ?auto_214440 ) ( ON ?auto_214438 ?auto_214439 ) ( ON ?auto_214437 ?auto_214438 ) ( ON ?auto_214436 ?auto_214437 ) ( ON ?auto_214435 ?auto_214436 ) ( ON ?auto_214434 ?auto_214435 ) ( CLEAR ?auto_214432 ) ( ON ?auto_214433 ?auto_214434 ) ( CLEAR ?auto_214433 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_214430 ?auto_214431 ?auto_214432 ?auto_214433 )
      ( MAKE-11PILE ?auto_214430 ?auto_214431 ?auto_214432 ?auto_214433 ?auto_214434 ?auto_214435 ?auto_214436 ?auto_214437 ?auto_214438 ?auto_214439 ?auto_214440 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_214453 - BLOCK
      ?auto_214454 - BLOCK
      ?auto_214455 - BLOCK
      ?auto_214456 - BLOCK
      ?auto_214457 - BLOCK
      ?auto_214458 - BLOCK
      ?auto_214459 - BLOCK
      ?auto_214460 - BLOCK
      ?auto_214461 - BLOCK
      ?auto_214462 - BLOCK
      ?auto_214463 - BLOCK
    )
    :vars
    (
      ?auto_214464 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_214463 ?auto_214464 ) ( ON-TABLE ?auto_214453 ) ( ON ?auto_214454 ?auto_214453 ) ( not ( = ?auto_214453 ?auto_214454 ) ) ( not ( = ?auto_214453 ?auto_214455 ) ) ( not ( = ?auto_214453 ?auto_214456 ) ) ( not ( = ?auto_214453 ?auto_214457 ) ) ( not ( = ?auto_214453 ?auto_214458 ) ) ( not ( = ?auto_214453 ?auto_214459 ) ) ( not ( = ?auto_214453 ?auto_214460 ) ) ( not ( = ?auto_214453 ?auto_214461 ) ) ( not ( = ?auto_214453 ?auto_214462 ) ) ( not ( = ?auto_214453 ?auto_214463 ) ) ( not ( = ?auto_214453 ?auto_214464 ) ) ( not ( = ?auto_214454 ?auto_214455 ) ) ( not ( = ?auto_214454 ?auto_214456 ) ) ( not ( = ?auto_214454 ?auto_214457 ) ) ( not ( = ?auto_214454 ?auto_214458 ) ) ( not ( = ?auto_214454 ?auto_214459 ) ) ( not ( = ?auto_214454 ?auto_214460 ) ) ( not ( = ?auto_214454 ?auto_214461 ) ) ( not ( = ?auto_214454 ?auto_214462 ) ) ( not ( = ?auto_214454 ?auto_214463 ) ) ( not ( = ?auto_214454 ?auto_214464 ) ) ( not ( = ?auto_214455 ?auto_214456 ) ) ( not ( = ?auto_214455 ?auto_214457 ) ) ( not ( = ?auto_214455 ?auto_214458 ) ) ( not ( = ?auto_214455 ?auto_214459 ) ) ( not ( = ?auto_214455 ?auto_214460 ) ) ( not ( = ?auto_214455 ?auto_214461 ) ) ( not ( = ?auto_214455 ?auto_214462 ) ) ( not ( = ?auto_214455 ?auto_214463 ) ) ( not ( = ?auto_214455 ?auto_214464 ) ) ( not ( = ?auto_214456 ?auto_214457 ) ) ( not ( = ?auto_214456 ?auto_214458 ) ) ( not ( = ?auto_214456 ?auto_214459 ) ) ( not ( = ?auto_214456 ?auto_214460 ) ) ( not ( = ?auto_214456 ?auto_214461 ) ) ( not ( = ?auto_214456 ?auto_214462 ) ) ( not ( = ?auto_214456 ?auto_214463 ) ) ( not ( = ?auto_214456 ?auto_214464 ) ) ( not ( = ?auto_214457 ?auto_214458 ) ) ( not ( = ?auto_214457 ?auto_214459 ) ) ( not ( = ?auto_214457 ?auto_214460 ) ) ( not ( = ?auto_214457 ?auto_214461 ) ) ( not ( = ?auto_214457 ?auto_214462 ) ) ( not ( = ?auto_214457 ?auto_214463 ) ) ( not ( = ?auto_214457 ?auto_214464 ) ) ( not ( = ?auto_214458 ?auto_214459 ) ) ( not ( = ?auto_214458 ?auto_214460 ) ) ( not ( = ?auto_214458 ?auto_214461 ) ) ( not ( = ?auto_214458 ?auto_214462 ) ) ( not ( = ?auto_214458 ?auto_214463 ) ) ( not ( = ?auto_214458 ?auto_214464 ) ) ( not ( = ?auto_214459 ?auto_214460 ) ) ( not ( = ?auto_214459 ?auto_214461 ) ) ( not ( = ?auto_214459 ?auto_214462 ) ) ( not ( = ?auto_214459 ?auto_214463 ) ) ( not ( = ?auto_214459 ?auto_214464 ) ) ( not ( = ?auto_214460 ?auto_214461 ) ) ( not ( = ?auto_214460 ?auto_214462 ) ) ( not ( = ?auto_214460 ?auto_214463 ) ) ( not ( = ?auto_214460 ?auto_214464 ) ) ( not ( = ?auto_214461 ?auto_214462 ) ) ( not ( = ?auto_214461 ?auto_214463 ) ) ( not ( = ?auto_214461 ?auto_214464 ) ) ( not ( = ?auto_214462 ?auto_214463 ) ) ( not ( = ?auto_214462 ?auto_214464 ) ) ( not ( = ?auto_214463 ?auto_214464 ) ) ( ON ?auto_214462 ?auto_214463 ) ( ON ?auto_214461 ?auto_214462 ) ( ON ?auto_214460 ?auto_214461 ) ( ON ?auto_214459 ?auto_214460 ) ( ON ?auto_214458 ?auto_214459 ) ( ON ?auto_214457 ?auto_214458 ) ( ON ?auto_214456 ?auto_214457 ) ( CLEAR ?auto_214454 ) ( ON ?auto_214455 ?auto_214456 ) ( CLEAR ?auto_214455 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_214453 ?auto_214454 ?auto_214455 )
      ( MAKE-11PILE ?auto_214453 ?auto_214454 ?auto_214455 ?auto_214456 ?auto_214457 ?auto_214458 ?auto_214459 ?auto_214460 ?auto_214461 ?auto_214462 ?auto_214463 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_214476 - BLOCK
      ?auto_214477 - BLOCK
      ?auto_214478 - BLOCK
      ?auto_214479 - BLOCK
      ?auto_214480 - BLOCK
      ?auto_214481 - BLOCK
      ?auto_214482 - BLOCK
      ?auto_214483 - BLOCK
      ?auto_214484 - BLOCK
      ?auto_214485 - BLOCK
      ?auto_214486 - BLOCK
    )
    :vars
    (
      ?auto_214487 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_214486 ?auto_214487 ) ( ON-TABLE ?auto_214476 ) ( ON ?auto_214477 ?auto_214476 ) ( not ( = ?auto_214476 ?auto_214477 ) ) ( not ( = ?auto_214476 ?auto_214478 ) ) ( not ( = ?auto_214476 ?auto_214479 ) ) ( not ( = ?auto_214476 ?auto_214480 ) ) ( not ( = ?auto_214476 ?auto_214481 ) ) ( not ( = ?auto_214476 ?auto_214482 ) ) ( not ( = ?auto_214476 ?auto_214483 ) ) ( not ( = ?auto_214476 ?auto_214484 ) ) ( not ( = ?auto_214476 ?auto_214485 ) ) ( not ( = ?auto_214476 ?auto_214486 ) ) ( not ( = ?auto_214476 ?auto_214487 ) ) ( not ( = ?auto_214477 ?auto_214478 ) ) ( not ( = ?auto_214477 ?auto_214479 ) ) ( not ( = ?auto_214477 ?auto_214480 ) ) ( not ( = ?auto_214477 ?auto_214481 ) ) ( not ( = ?auto_214477 ?auto_214482 ) ) ( not ( = ?auto_214477 ?auto_214483 ) ) ( not ( = ?auto_214477 ?auto_214484 ) ) ( not ( = ?auto_214477 ?auto_214485 ) ) ( not ( = ?auto_214477 ?auto_214486 ) ) ( not ( = ?auto_214477 ?auto_214487 ) ) ( not ( = ?auto_214478 ?auto_214479 ) ) ( not ( = ?auto_214478 ?auto_214480 ) ) ( not ( = ?auto_214478 ?auto_214481 ) ) ( not ( = ?auto_214478 ?auto_214482 ) ) ( not ( = ?auto_214478 ?auto_214483 ) ) ( not ( = ?auto_214478 ?auto_214484 ) ) ( not ( = ?auto_214478 ?auto_214485 ) ) ( not ( = ?auto_214478 ?auto_214486 ) ) ( not ( = ?auto_214478 ?auto_214487 ) ) ( not ( = ?auto_214479 ?auto_214480 ) ) ( not ( = ?auto_214479 ?auto_214481 ) ) ( not ( = ?auto_214479 ?auto_214482 ) ) ( not ( = ?auto_214479 ?auto_214483 ) ) ( not ( = ?auto_214479 ?auto_214484 ) ) ( not ( = ?auto_214479 ?auto_214485 ) ) ( not ( = ?auto_214479 ?auto_214486 ) ) ( not ( = ?auto_214479 ?auto_214487 ) ) ( not ( = ?auto_214480 ?auto_214481 ) ) ( not ( = ?auto_214480 ?auto_214482 ) ) ( not ( = ?auto_214480 ?auto_214483 ) ) ( not ( = ?auto_214480 ?auto_214484 ) ) ( not ( = ?auto_214480 ?auto_214485 ) ) ( not ( = ?auto_214480 ?auto_214486 ) ) ( not ( = ?auto_214480 ?auto_214487 ) ) ( not ( = ?auto_214481 ?auto_214482 ) ) ( not ( = ?auto_214481 ?auto_214483 ) ) ( not ( = ?auto_214481 ?auto_214484 ) ) ( not ( = ?auto_214481 ?auto_214485 ) ) ( not ( = ?auto_214481 ?auto_214486 ) ) ( not ( = ?auto_214481 ?auto_214487 ) ) ( not ( = ?auto_214482 ?auto_214483 ) ) ( not ( = ?auto_214482 ?auto_214484 ) ) ( not ( = ?auto_214482 ?auto_214485 ) ) ( not ( = ?auto_214482 ?auto_214486 ) ) ( not ( = ?auto_214482 ?auto_214487 ) ) ( not ( = ?auto_214483 ?auto_214484 ) ) ( not ( = ?auto_214483 ?auto_214485 ) ) ( not ( = ?auto_214483 ?auto_214486 ) ) ( not ( = ?auto_214483 ?auto_214487 ) ) ( not ( = ?auto_214484 ?auto_214485 ) ) ( not ( = ?auto_214484 ?auto_214486 ) ) ( not ( = ?auto_214484 ?auto_214487 ) ) ( not ( = ?auto_214485 ?auto_214486 ) ) ( not ( = ?auto_214485 ?auto_214487 ) ) ( not ( = ?auto_214486 ?auto_214487 ) ) ( ON ?auto_214485 ?auto_214486 ) ( ON ?auto_214484 ?auto_214485 ) ( ON ?auto_214483 ?auto_214484 ) ( ON ?auto_214482 ?auto_214483 ) ( ON ?auto_214481 ?auto_214482 ) ( ON ?auto_214480 ?auto_214481 ) ( ON ?auto_214479 ?auto_214480 ) ( CLEAR ?auto_214477 ) ( ON ?auto_214478 ?auto_214479 ) ( CLEAR ?auto_214478 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_214476 ?auto_214477 ?auto_214478 )
      ( MAKE-11PILE ?auto_214476 ?auto_214477 ?auto_214478 ?auto_214479 ?auto_214480 ?auto_214481 ?auto_214482 ?auto_214483 ?auto_214484 ?auto_214485 ?auto_214486 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_214499 - BLOCK
      ?auto_214500 - BLOCK
      ?auto_214501 - BLOCK
      ?auto_214502 - BLOCK
      ?auto_214503 - BLOCK
      ?auto_214504 - BLOCK
      ?auto_214505 - BLOCK
      ?auto_214506 - BLOCK
      ?auto_214507 - BLOCK
      ?auto_214508 - BLOCK
      ?auto_214509 - BLOCK
    )
    :vars
    (
      ?auto_214510 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_214509 ?auto_214510 ) ( ON-TABLE ?auto_214499 ) ( not ( = ?auto_214499 ?auto_214500 ) ) ( not ( = ?auto_214499 ?auto_214501 ) ) ( not ( = ?auto_214499 ?auto_214502 ) ) ( not ( = ?auto_214499 ?auto_214503 ) ) ( not ( = ?auto_214499 ?auto_214504 ) ) ( not ( = ?auto_214499 ?auto_214505 ) ) ( not ( = ?auto_214499 ?auto_214506 ) ) ( not ( = ?auto_214499 ?auto_214507 ) ) ( not ( = ?auto_214499 ?auto_214508 ) ) ( not ( = ?auto_214499 ?auto_214509 ) ) ( not ( = ?auto_214499 ?auto_214510 ) ) ( not ( = ?auto_214500 ?auto_214501 ) ) ( not ( = ?auto_214500 ?auto_214502 ) ) ( not ( = ?auto_214500 ?auto_214503 ) ) ( not ( = ?auto_214500 ?auto_214504 ) ) ( not ( = ?auto_214500 ?auto_214505 ) ) ( not ( = ?auto_214500 ?auto_214506 ) ) ( not ( = ?auto_214500 ?auto_214507 ) ) ( not ( = ?auto_214500 ?auto_214508 ) ) ( not ( = ?auto_214500 ?auto_214509 ) ) ( not ( = ?auto_214500 ?auto_214510 ) ) ( not ( = ?auto_214501 ?auto_214502 ) ) ( not ( = ?auto_214501 ?auto_214503 ) ) ( not ( = ?auto_214501 ?auto_214504 ) ) ( not ( = ?auto_214501 ?auto_214505 ) ) ( not ( = ?auto_214501 ?auto_214506 ) ) ( not ( = ?auto_214501 ?auto_214507 ) ) ( not ( = ?auto_214501 ?auto_214508 ) ) ( not ( = ?auto_214501 ?auto_214509 ) ) ( not ( = ?auto_214501 ?auto_214510 ) ) ( not ( = ?auto_214502 ?auto_214503 ) ) ( not ( = ?auto_214502 ?auto_214504 ) ) ( not ( = ?auto_214502 ?auto_214505 ) ) ( not ( = ?auto_214502 ?auto_214506 ) ) ( not ( = ?auto_214502 ?auto_214507 ) ) ( not ( = ?auto_214502 ?auto_214508 ) ) ( not ( = ?auto_214502 ?auto_214509 ) ) ( not ( = ?auto_214502 ?auto_214510 ) ) ( not ( = ?auto_214503 ?auto_214504 ) ) ( not ( = ?auto_214503 ?auto_214505 ) ) ( not ( = ?auto_214503 ?auto_214506 ) ) ( not ( = ?auto_214503 ?auto_214507 ) ) ( not ( = ?auto_214503 ?auto_214508 ) ) ( not ( = ?auto_214503 ?auto_214509 ) ) ( not ( = ?auto_214503 ?auto_214510 ) ) ( not ( = ?auto_214504 ?auto_214505 ) ) ( not ( = ?auto_214504 ?auto_214506 ) ) ( not ( = ?auto_214504 ?auto_214507 ) ) ( not ( = ?auto_214504 ?auto_214508 ) ) ( not ( = ?auto_214504 ?auto_214509 ) ) ( not ( = ?auto_214504 ?auto_214510 ) ) ( not ( = ?auto_214505 ?auto_214506 ) ) ( not ( = ?auto_214505 ?auto_214507 ) ) ( not ( = ?auto_214505 ?auto_214508 ) ) ( not ( = ?auto_214505 ?auto_214509 ) ) ( not ( = ?auto_214505 ?auto_214510 ) ) ( not ( = ?auto_214506 ?auto_214507 ) ) ( not ( = ?auto_214506 ?auto_214508 ) ) ( not ( = ?auto_214506 ?auto_214509 ) ) ( not ( = ?auto_214506 ?auto_214510 ) ) ( not ( = ?auto_214507 ?auto_214508 ) ) ( not ( = ?auto_214507 ?auto_214509 ) ) ( not ( = ?auto_214507 ?auto_214510 ) ) ( not ( = ?auto_214508 ?auto_214509 ) ) ( not ( = ?auto_214508 ?auto_214510 ) ) ( not ( = ?auto_214509 ?auto_214510 ) ) ( ON ?auto_214508 ?auto_214509 ) ( ON ?auto_214507 ?auto_214508 ) ( ON ?auto_214506 ?auto_214507 ) ( ON ?auto_214505 ?auto_214506 ) ( ON ?auto_214504 ?auto_214505 ) ( ON ?auto_214503 ?auto_214504 ) ( ON ?auto_214502 ?auto_214503 ) ( ON ?auto_214501 ?auto_214502 ) ( CLEAR ?auto_214499 ) ( ON ?auto_214500 ?auto_214501 ) ( CLEAR ?auto_214500 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_214499 ?auto_214500 )
      ( MAKE-11PILE ?auto_214499 ?auto_214500 ?auto_214501 ?auto_214502 ?auto_214503 ?auto_214504 ?auto_214505 ?auto_214506 ?auto_214507 ?auto_214508 ?auto_214509 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_214522 - BLOCK
      ?auto_214523 - BLOCK
      ?auto_214524 - BLOCK
      ?auto_214525 - BLOCK
      ?auto_214526 - BLOCK
      ?auto_214527 - BLOCK
      ?auto_214528 - BLOCK
      ?auto_214529 - BLOCK
      ?auto_214530 - BLOCK
      ?auto_214531 - BLOCK
      ?auto_214532 - BLOCK
    )
    :vars
    (
      ?auto_214533 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_214532 ?auto_214533 ) ( ON-TABLE ?auto_214522 ) ( not ( = ?auto_214522 ?auto_214523 ) ) ( not ( = ?auto_214522 ?auto_214524 ) ) ( not ( = ?auto_214522 ?auto_214525 ) ) ( not ( = ?auto_214522 ?auto_214526 ) ) ( not ( = ?auto_214522 ?auto_214527 ) ) ( not ( = ?auto_214522 ?auto_214528 ) ) ( not ( = ?auto_214522 ?auto_214529 ) ) ( not ( = ?auto_214522 ?auto_214530 ) ) ( not ( = ?auto_214522 ?auto_214531 ) ) ( not ( = ?auto_214522 ?auto_214532 ) ) ( not ( = ?auto_214522 ?auto_214533 ) ) ( not ( = ?auto_214523 ?auto_214524 ) ) ( not ( = ?auto_214523 ?auto_214525 ) ) ( not ( = ?auto_214523 ?auto_214526 ) ) ( not ( = ?auto_214523 ?auto_214527 ) ) ( not ( = ?auto_214523 ?auto_214528 ) ) ( not ( = ?auto_214523 ?auto_214529 ) ) ( not ( = ?auto_214523 ?auto_214530 ) ) ( not ( = ?auto_214523 ?auto_214531 ) ) ( not ( = ?auto_214523 ?auto_214532 ) ) ( not ( = ?auto_214523 ?auto_214533 ) ) ( not ( = ?auto_214524 ?auto_214525 ) ) ( not ( = ?auto_214524 ?auto_214526 ) ) ( not ( = ?auto_214524 ?auto_214527 ) ) ( not ( = ?auto_214524 ?auto_214528 ) ) ( not ( = ?auto_214524 ?auto_214529 ) ) ( not ( = ?auto_214524 ?auto_214530 ) ) ( not ( = ?auto_214524 ?auto_214531 ) ) ( not ( = ?auto_214524 ?auto_214532 ) ) ( not ( = ?auto_214524 ?auto_214533 ) ) ( not ( = ?auto_214525 ?auto_214526 ) ) ( not ( = ?auto_214525 ?auto_214527 ) ) ( not ( = ?auto_214525 ?auto_214528 ) ) ( not ( = ?auto_214525 ?auto_214529 ) ) ( not ( = ?auto_214525 ?auto_214530 ) ) ( not ( = ?auto_214525 ?auto_214531 ) ) ( not ( = ?auto_214525 ?auto_214532 ) ) ( not ( = ?auto_214525 ?auto_214533 ) ) ( not ( = ?auto_214526 ?auto_214527 ) ) ( not ( = ?auto_214526 ?auto_214528 ) ) ( not ( = ?auto_214526 ?auto_214529 ) ) ( not ( = ?auto_214526 ?auto_214530 ) ) ( not ( = ?auto_214526 ?auto_214531 ) ) ( not ( = ?auto_214526 ?auto_214532 ) ) ( not ( = ?auto_214526 ?auto_214533 ) ) ( not ( = ?auto_214527 ?auto_214528 ) ) ( not ( = ?auto_214527 ?auto_214529 ) ) ( not ( = ?auto_214527 ?auto_214530 ) ) ( not ( = ?auto_214527 ?auto_214531 ) ) ( not ( = ?auto_214527 ?auto_214532 ) ) ( not ( = ?auto_214527 ?auto_214533 ) ) ( not ( = ?auto_214528 ?auto_214529 ) ) ( not ( = ?auto_214528 ?auto_214530 ) ) ( not ( = ?auto_214528 ?auto_214531 ) ) ( not ( = ?auto_214528 ?auto_214532 ) ) ( not ( = ?auto_214528 ?auto_214533 ) ) ( not ( = ?auto_214529 ?auto_214530 ) ) ( not ( = ?auto_214529 ?auto_214531 ) ) ( not ( = ?auto_214529 ?auto_214532 ) ) ( not ( = ?auto_214529 ?auto_214533 ) ) ( not ( = ?auto_214530 ?auto_214531 ) ) ( not ( = ?auto_214530 ?auto_214532 ) ) ( not ( = ?auto_214530 ?auto_214533 ) ) ( not ( = ?auto_214531 ?auto_214532 ) ) ( not ( = ?auto_214531 ?auto_214533 ) ) ( not ( = ?auto_214532 ?auto_214533 ) ) ( ON ?auto_214531 ?auto_214532 ) ( ON ?auto_214530 ?auto_214531 ) ( ON ?auto_214529 ?auto_214530 ) ( ON ?auto_214528 ?auto_214529 ) ( ON ?auto_214527 ?auto_214528 ) ( ON ?auto_214526 ?auto_214527 ) ( ON ?auto_214525 ?auto_214526 ) ( ON ?auto_214524 ?auto_214525 ) ( CLEAR ?auto_214522 ) ( ON ?auto_214523 ?auto_214524 ) ( CLEAR ?auto_214523 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_214522 ?auto_214523 )
      ( MAKE-11PILE ?auto_214522 ?auto_214523 ?auto_214524 ?auto_214525 ?auto_214526 ?auto_214527 ?auto_214528 ?auto_214529 ?auto_214530 ?auto_214531 ?auto_214532 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_214545 - BLOCK
      ?auto_214546 - BLOCK
      ?auto_214547 - BLOCK
      ?auto_214548 - BLOCK
      ?auto_214549 - BLOCK
      ?auto_214550 - BLOCK
      ?auto_214551 - BLOCK
      ?auto_214552 - BLOCK
      ?auto_214553 - BLOCK
      ?auto_214554 - BLOCK
      ?auto_214555 - BLOCK
    )
    :vars
    (
      ?auto_214556 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_214555 ?auto_214556 ) ( not ( = ?auto_214545 ?auto_214546 ) ) ( not ( = ?auto_214545 ?auto_214547 ) ) ( not ( = ?auto_214545 ?auto_214548 ) ) ( not ( = ?auto_214545 ?auto_214549 ) ) ( not ( = ?auto_214545 ?auto_214550 ) ) ( not ( = ?auto_214545 ?auto_214551 ) ) ( not ( = ?auto_214545 ?auto_214552 ) ) ( not ( = ?auto_214545 ?auto_214553 ) ) ( not ( = ?auto_214545 ?auto_214554 ) ) ( not ( = ?auto_214545 ?auto_214555 ) ) ( not ( = ?auto_214545 ?auto_214556 ) ) ( not ( = ?auto_214546 ?auto_214547 ) ) ( not ( = ?auto_214546 ?auto_214548 ) ) ( not ( = ?auto_214546 ?auto_214549 ) ) ( not ( = ?auto_214546 ?auto_214550 ) ) ( not ( = ?auto_214546 ?auto_214551 ) ) ( not ( = ?auto_214546 ?auto_214552 ) ) ( not ( = ?auto_214546 ?auto_214553 ) ) ( not ( = ?auto_214546 ?auto_214554 ) ) ( not ( = ?auto_214546 ?auto_214555 ) ) ( not ( = ?auto_214546 ?auto_214556 ) ) ( not ( = ?auto_214547 ?auto_214548 ) ) ( not ( = ?auto_214547 ?auto_214549 ) ) ( not ( = ?auto_214547 ?auto_214550 ) ) ( not ( = ?auto_214547 ?auto_214551 ) ) ( not ( = ?auto_214547 ?auto_214552 ) ) ( not ( = ?auto_214547 ?auto_214553 ) ) ( not ( = ?auto_214547 ?auto_214554 ) ) ( not ( = ?auto_214547 ?auto_214555 ) ) ( not ( = ?auto_214547 ?auto_214556 ) ) ( not ( = ?auto_214548 ?auto_214549 ) ) ( not ( = ?auto_214548 ?auto_214550 ) ) ( not ( = ?auto_214548 ?auto_214551 ) ) ( not ( = ?auto_214548 ?auto_214552 ) ) ( not ( = ?auto_214548 ?auto_214553 ) ) ( not ( = ?auto_214548 ?auto_214554 ) ) ( not ( = ?auto_214548 ?auto_214555 ) ) ( not ( = ?auto_214548 ?auto_214556 ) ) ( not ( = ?auto_214549 ?auto_214550 ) ) ( not ( = ?auto_214549 ?auto_214551 ) ) ( not ( = ?auto_214549 ?auto_214552 ) ) ( not ( = ?auto_214549 ?auto_214553 ) ) ( not ( = ?auto_214549 ?auto_214554 ) ) ( not ( = ?auto_214549 ?auto_214555 ) ) ( not ( = ?auto_214549 ?auto_214556 ) ) ( not ( = ?auto_214550 ?auto_214551 ) ) ( not ( = ?auto_214550 ?auto_214552 ) ) ( not ( = ?auto_214550 ?auto_214553 ) ) ( not ( = ?auto_214550 ?auto_214554 ) ) ( not ( = ?auto_214550 ?auto_214555 ) ) ( not ( = ?auto_214550 ?auto_214556 ) ) ( not ( = ?auto_214551 ?auto_214552 ) ) ( not ( = ?auto_214551 ?auto_214553 ) ) ( not ( = ?auto_214551 ?auto_214554 ) ) ( not ( = ?auto_214551 ?auto_214555 ) ) ( not ( = ?auto_214551 ?auto_214556 ) ) ( not ( = ?auto_214552 ?auto_214553 ) ) ( not ( = ?auto_214552 ?auto_214554 ) ) ( not ( = ?auto_214552 ?auto_214555 ) ) ( not ( = ?auto_214552 ?auto_214556 ) ) ( not ( = ?auto_214553 ?auto_214554 ) ) ( not ( = ?auto_214553 ?auto_214555 ) ) ( not ( = ?auto_214553 ?auto_214556 ) ) ( not ( = ?auto_214554 ?auto_214555 ) ) ( not ( = ?auto_214554 ?auto_214556 ) ) ( not ( = ?auto_214555 ?auto_214556 ) ) ( ON ?auto_214554 ?auto_214555 ) ( ON ?auto_214553 ?auto_214554 ) ( ON ?auto_214552 ?auto_214553 ) ( ON ?auto_214551 ?auto_214552 ) ( ON ?auto_214550 ?auto_214551 ) ( ON ?auto_214549 ?auto_214550 ) ( ON ?auto_214548 ?auto_214549 ) ( ON ?auto_214547 ?auto_214548 ) ( ON ?auto_214546 ?auto_214547 ) ( ON ?auto_214545 ?auto_214546 ) ( CLEAR ?auto_214545 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_214545 )
      ( MAKE-11PILE ?auto_214545 ?auto_214546 ?auto_214547 ?auto_214548 ?auto_214549 ?auto_214550 ?auto_214551 ?auto_214552 ?auto_214553 ?auto_214554 ?auto_214555 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_214568 - BLOCK
      ?auto_214569 - BLOCK
      ?auto_214570 - BLOCK
      ?auto_214571 - BLOCK
      ?auto_214572 - BLOCK
      ?auto_214573 - BLOCK
      ?auto_214574 - BLOCK
      ?auto_214575 - BLOCK
      ?auto_214576 - BLOCK
      ?auto_214577 - BLOCK
      ?auto_214578 - BLOCK
    )
    :vars
    (
      ?auto_214579 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_214578 ?auto_214579 ) ( not ( = ?auto_214568 ?auto_214569 ) ) ( not ( = ?auto_214568 ?auto_214570 ) ) ( not ( = ?auto_214568 ?auto_214571 ) ) ( not ( = ?auto_214568 ?auto_214572 ) ) ( not ( = ?auto_214568 ?auto_214573 ) ) ( not ( = ?auto_214568 ?auto_214574 ) ) ( not ( = ?auto_214568 ?auto_214575 ) ) ( not ( = ?auto_214568 ?auto_214576 ) ) ( not ( = ?auto_214568 ?auto_214577 ) ) ( not ( = ?auto_214568 ?auto_214578 ) ) ( not ( = ?auto_214568 ?auto_214579 ) ) ( not ( = ?auto_214569 ?auto_214570 ) ) ( not ( = ?auto_214569 ?auto_214571 ) ) ( not ( = ?auto_214569 ?auto_214572 ) ) ( not ( = ?auto_214569 ?auto_214573 ) ) ( not ( = ?auto_214569 ?auto_214574 ) ) ( not ( = ?auto_214569 ?auto_214575 ) ) ( not ( = ?auto_214569 ?auto_214576 ) ) ( not ( = ?auto_214569 ?auto_214577 ) ) ( not ( = ?auto_214569 ?auto_214578 ) ) ( not ( = ?auto_214569 ?auto_214579 ) ) ( not ( = ?auto_214570 ?auto_214571 ) ) ( not ( = ?auto_214570 ?auto_214572 ) ) ( not ( = ?auto_214570 ?auto_214573 ) ) ( not ( = ?auto_214570 ?auto_214574 ) ) ( not ( = ?auto_214570 ?auto_214575 ) ) ( not ( = ?auto_214570 ?auto_214576 ) ) ( not ( = ?auto_214570 ?auto_214577 ) ) ( not ( = ?auto_214570 ?auto_214578 ) ) ( not ( = ?auto_214570 ?auto_214579 ) ) ( not ( = ?auto_214571 ?auto_214572 ) ) ( not ( = ?auto_214571 ?auto_214573 ) ) ( not ( = ?auto_214571 ?auto_214574 ) ) ( not ( = ?auto_214571 ?auto_214575 ) ) ( not ( = ?auto_214571 ?auto_214576 ) ) ( not ( = ?auto_214571 ?auto_214577 ) ) ( not ( = ?auto_214571 ?auto_214578 ) ) ( not ( = ?auto_214571 ?auto_214579 ) ) ( not ( = ?auto_214572 ?auto_214573 ) ) ( not ( = ?auto_214572 ?auto_214574 ) ) ( not ( = ?auto_214572 ?auto_214575 ) ) ( not ( = ?auto_214572 ?auto_214576 ) ) ( not ( = ?auto_214572 ?auto_214577 ) ) ( not ( = ?auto_214572 ?auto_214578 ) ) ( not ( = ?auto_214572 ?auto_214579 ) ) ( not ( = ?auto_214573 ?auto_214574 ) ) ( not ( = ?auto_214573 ?auto_214575 ) ) ( not ( = ?auto_214573 ?auto_214576 ) ) ( not ( = ?auto_214573 ?auto_214577 ) ) ( not ( = ?auto_214573 ?auto_214578 ) ) ( not ( = ?auto_214573 ?auto_214579 ) ) ( not ( = ?auto_214574 ?auto_214575 ) ) ( not ( = ?auto_214574 ?auto_214576 ) ) ( not ( = ?auto_214574 ?auto_214577 ) ) ( not ( = ?auto_214574 ?auto_214578 ) ) ( not ( = ?auto_214574 ?auto_214579 ) ) ( not ( = ?auto_214575 ?auto_214576 ) ) ( not ( = ?auto_214575 ?auto_214577 ) ) ( not ( = ?auto_214575 ?auto_214578 ) ) ( not ( = ?auto_214575 ?auto_214579 ) ) ( not ( = ?auto_214576 ?auto_214577 ) ) ( not ( = ?auto_214576 ?auto_214578 ) ) ( not ( = ?auto_214576 ?auto_214579 ) ) ( not ( = ?auto_214577 ?auto_214578 ) ) ( not ( = ?auto_214577 ?auto_214579 ) ) ( not ( = ?auto_214578 ?auto_214579 ) ) ( ON ?auto_214577 ?auto_214578 ) ( ON ?auto_214576 ?auto_214577 ) ( ON ?auto_214575 ?auto_214576 ) ( ON ?auto_214574 ?auto_214575 ) ( ON ?auto_214573 ?auto_214574 ) ( ON ?auto_214572 ?auto_214573 ) ( ON ?auto_214571 ?auto_214572 ) ( ON ?auto_214570 ?auto_214571 ) ( ON ?auto_214569 ?auto_214570 ) ( ON ?auto_214568 ?auto_214569 ) ( CLEAR ?auto_214568 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_214568 )
      ( MAKE-11PILE ?auto_214568 ?auto_214569 ?auto_214570 ?auto_214571 ?auto_214572 ?auto_214573 ?auto_214574 ?auto_214575 ?auto_214576 ?auto_214577 ?auto_214578 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_214592 - BLOCK
      ?auto_214593 - BLOCK
      ?auto_214594 - BLOCK
      ?auto_214595 - BLOCK
      ?auto_214596 - BLOCK
      ?auto_214597 - BLOCK
      ?auto_214598 - BLOCK
      ?auto_214599 - BLOCK
      ?auto_214600 - BLOCK
      ?auto_214601 - BLOCK
      ?auto_214602 - BLOCK
      ?auto_214603 - BLOCK
    )
    :vars
    (
      ?auto_214604 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_214602 ) ( ON ?auto_214603 ?auto_214604 ) ( CLEAR ?auto_214603 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_214592 ) ( ON ?auto_214593 ?auto_214592 ) ( ON ?auto_214594 ?auto_214593 ) ( ON ?auto_214595 ?auto_214594 ) ( ON ?auto_214596 ?auto_214595 ) ( ON ?auto_214597 ?auto_214596 ) ( ON ?auto_214598 ?auto_214597 ) ( ON ?auto_214599 ?auto_214598 ) ( ON ?auto_214600 ?auto_214599 ) ( ON ?auto_214601 ?auto_214600 ) ( ON ?auto_214602 ?auto_214601 ) ( not ( = ?auto_214592 ?auto_214593 ) ) ( not ( = ?auto_214592 ?auto_214594 ) ) ( not ( = ?auto_214592 ?auto_214595 ) ) ( not ( = ?auto_214592 ?auto_214596 ) ) ( not ( = ?auto_214592 ?auto_214597 ) ) ( not ( = ?auto_214592 ?auto_214598 ) ) ( not ( = ?auto_214592 ?auto_214599 ) ) ( not ( = ?auto_214592 ?auto_214600 ) ) ( not ( = ?auto_214592 ?auto_214601 ) ) ( not ( = ?auto_214592 ?auto_214602 ) ) ( not ( = ?auto_214592 ?auto_214603 ) ) ( not ( = ?auto_214592 ?auto_214604 ) ) ( not ( = ?auto_214593 ?auto_214594 ) ) ( not ( = ?auto_214593 ?auto_214595 ) ) ( not ( = ?auto_214593 ?auto_214596 ) ) ( not ( = ?auto_214593 ?auto_214597 ) ) ( not ( = ?auto_214593 ?auto_214598 ) ) ( not ( = ?auto_214593 ?auto_214599 ) ) ( not ( = ?auto_214593 ?auto_214600 ) ) ( not ( = ?auto_214593 ?auto_214601 ) ) ( not ( = ?auto_214593 ?auto_214602 ) ) ( not ( = ?auto_214593 ?auto_214603 ) ) ( not ( = ?auto_214593 ?auto_214604 ) ) ( not ( = ?auto_214594 ?auto_214595 ) ) ( not ( = ?auto_214594 ?auto_214596 ) ) ( not ( = ?auto_214594 ?auto_214597 ) ) ( not ( = ?auto_214594 ?auto_214598 ) ) ( not ( = ?auto_214594 ?auto_214599 ) ) ( not ( = ?auto_214594 ?auto_214600 ) ) ( not ( = ?auto_214594 ?auto_214601 ) ) ( not ( = ?auto_214594 ?auto_214602 ) ) ( not ( = ?auto_214594 ?auto_214603 ) ) ( not ( = ?auto_214594 ?auto_214604 ) ) ( not ( = ?auto_214595 ?auto_214596 ) ) ( not ( = ?auto_214595 ?auto_214597 ) ) ( not ( = ?auto_214595 ?auto_214598 ) ) ( not ( = ?auto_214595 ?auto_214599 ) ) ( not ( = ?auto_214595 ?auto_214600 ) ) ( not ( = ?auto_214595 ?auto_214601 ) ) ( not ( = ?auto_214595 ?auto_214602 ) ) ( not ( = ?auto_214595 ?auto_214603 ) ) ( not ( = ?auto_214595 ?auto_214604 ) ) ( not ( = ?auto_214596 ?auto_214597 ) ) ( not ( = ?auto_214596 ?auto_214598 ) ) ( not ( = ?auto_214596 ?auto_214599 ) ) ( not ( = ?auto_214596 ?auto_214600 ) ) ( not ( = ?auto_214596 ?auto_214601 ) ) ( not ( = ?auto_214596 ?auto_214602 ) ) ( not ( = ?auto_214596 ?auto_214603 ) ) ( not ( = ?auto_214596 ?auto_214604 ) ) ( not ( = ?auto_214597 ?auto_214598 ) ) ( not ( = ?auto_214597 ?auto_214599 ) ) ( not ( = ?auto_214597 ?auto_214600 ) ) ( not ( = ?auto_214597 ?auto_214601 ) ) ( not ( = ?auto_214597 ?auto_214602 ) ) ( not ( = ?auto_214597 ?auto_214603 ) ) ( not ( = ?auto_214597 ?auto_214604 ) ) ( not ( = ?auto_214598 ?auto_214599 ) ) ( not ( = ?auto_214598 ?auto_214600 ) ) ( not ( = ?auto_214598 ?auto_214601 ) ) ( not ( = ?auto_214598 ?auto_214602 ) ) ( not ( = ?auto_214598 ?auto_214603 ) ) ( not ( = ?auto_214598 ?auto_214604 ) ) ( not ( = ?auto_214599 ?auto_214600 ) ) ( not ( = ?auto_214599 ?auto_214601 ) ) ( not ( = ?auto_214599 ?auto_214602 ) ) ( not ( = ?auto_214599 ?auto_214603 ) ) ( not ( = ?auto_214599 ?auto_214604 ) ) ( not ( = ?auto_214600 ?auto_214601 ) ) ( not ( = ?auto_214600 ?auto_214602 ) ) ( not ( = ?auto_214600 ?auto_214603 ) ) ( not ( = ?auto_214600 ?auto_214604 ) ) ( not ( = ?auto_214601 ?auto_214602 ) ) ( not ( = ?auto_214601 ?auto_214603 ) ) ( not ( = ?auto_214601 ?auto_214604 ) ) ( not ( = ?auto_214602 ?auto_214603 ) ) ( not ( = ?auto_214602 ?auto_214604 ) ) ( not ( = ?auto_214603 ?auto_214604 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_214603 ?auto_214604 )
      ( !STACK ?auto_214603 ?auto_214602 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_214617 - BLOCK
      ?auto_214618 - BLOCK
      ?auto_214619 - BLOCK
      ?auto_214620 - BLOCK
      ?auto_214621 - BLOCK
      ?auto_214622 - BLOCK
      ?auto_214623 - BLOCK
      ?auto_214624 - BLOCK
      ?auto_214625 - BLOCK
      ?auto_214626 - BLOCK
      ?auto_214627 - BLOCK
      ?auto_214628 - BLOCK
    )
    :vars
    (
      ?auto_214629 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_214627 ) ( ON ?auto_214628 ?auto_214629 ) ( CLEAR ?auto_214628 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_214617 ) ( ON ?auto_214618 ?auto_214617 ) ( ON ?auto_214619 ?auto_214618 ) ( ON ?auto_214620 ?auto_214619 ) ( ON ?auto_214621 ?auto_214620 ) ( ON ?auto_214622 ?auto_214621 ) ( ON ?auto_214623 ?auto_214622 ) ( ON ?auto_214624 ?auto_214623 ) ( ON ?auto_214625 ?auto_214624 ) ( ON ?auto_214626 ?auto_214625 ) ( ON ?auto_214627 ?auto_214626 ) ( not ( = ?auto_214617 ?auto_214618 ) ) ( not ( = ?auto_214617 ?auto_214619 ) ) ( not ( = ?auto_214617 ?auto_214620 ) ) ( not ( = ?auto_214617 ?auto_214621 ) ) ( not ( = ?auto_214617 ?auto_214622 ) ) ( not ( = ?auto_214617 ?auto_214623 ) ) ( not ( = ?auto_214617 ?auto_214624 ) ) ( not ( = ?auto_214617 ?auto_214625 ) ) ( not ( = ?auto_214617 ?auto_214626 ) ) ( not ( = ?auto_214617 ?auto_214627 ) ) ( not ( = ?auto_214617 ?auto_214628 ) ) ( not ( = ?auto_214617 ?auto_214629 ) ) ( not ( = ?auto_214618 ?auto_214619 ) ) ( not ( = ?auto_214618 ?auto_214620 ) ) ( not ( = ?auto_214618 ?auto_214621 ) ) ( not ( = ?auto_214618 ?auto_214622 ) ) ( not ( = ?auto_214618 ?auto_214623 ) ) ( not ( = ?auto_214618 ?auto_214624 ) ) ( not ( = ?auto_214618 ?auto_214625 ) ) ( not ( = ?auto_214618 ?auto_214626 ) ) ( not ( = ?auto_214618 ?auto_214627 ) ) ( not ( = ?auto_214618 ?auto_214628 ) ) ( not ( = ?auto_214618 ?auto_214629 ) ) ( not ( = ?auto_214619 ?auto_214620 ) ) ( not ( = ?auto_214619 ?auto_214621 ) ) ( not ( = ?auto_214619 ?auto_214622 ) ) ( not ( = ?auto_214619 ?auto_214623 ) ) ( not ( = ?auto_214619 ?auto_214624 ) ) ( not ( = ?auto_214619 ?auto_214625 ) ) ( not ( = ?auto_214619 ?auto_214626 ) ) ( not ( = ?auto_214619 ?auto_214627 ) ) ( not ( = ?auto_214619 ?auto_214628 ) ) ( not ( = ?auto_214619 ?auto_214629 ) ) ( not ( = ?auto_214620 ?auto_214621 ) ) ( not ( = ?auto_214620 ?auto_214622 ) ) ( not ( = ?auto_214620 ?auto_214623 ) ) ( not ( = ?auto_214620 ?auto_214624 ) ) ( not ( = ?auto_214620 ?auto_214625 ) ) ( not ( = ?auto_214620 ?auto_214626 ) ) ( not ( = ?auto_214620 ?auto_214627 ) ) ( not ( = ?auto_214620 ?auto_214628 ) ) ( not ( = ?auto_214620 ?auto_214629 ) ) ( not ( = ?auto_214621 ?auto_214622 ) ) ( not ( = ?auto_214621 ?auto_214623 ) ) ( not ( = ?auto_214621 ?auto_214624 ) ) ( not ( = ?auto_214621 ?auto_214625 ) ) ( not ( = ?auto_214621 ?auto_214626 ) ) ( not ( = ?auto_214621 ?auto_214627 ) ) ( not ( = ?auto_214621 ?auto_214628 ) ) ( not ( = ?auto_214621 ?auto_214629 ) ) ( not ( = ?auto_214622 ?auto_214623 ) ) ( not ( = ?auto_214622 ?auto_214624 ) ) ( not ( = ?auto_214622 ?auto_214625 ) ) ( not ( = ?auto_214622 ?auto_214626 ) ) ( not ( = ?auto_214622 ?auto_214627 ) ) ( not ( = ?auto_214622 ?auto_214628 ) ) ( not ( = ?auto_214622 ?auto_214629 ) ) ( not ( = ?auto_214623 ?auto_214624 ) ) ( not ( = ?auto_214623 ?auto_214625 ) ) ( not ( = ?auto_214623 ?auto_214626 ) ) ( not ( = ?auto_214623 ?auto_214627 ) ) ( not ( = ?auto_214623 ?auto_214628 ) ) ( not ( = ?auto_214623 ?auto_214629 ) ) ( not ( = ?auto_214624 ?auto_214625 ) ) ( not ( = ?auto_214624 ?auto_214626 ) ) ( not ( = ?auto_214624 ?auto_214627 ) ) ( not ( = ?auto_214624 ?auto_214628 ) ) ( not ( = ?auto_214624 ?auto_214629 ) ) ( not ( = ?auto_214625 ?auto_214626 ) ) ( not ( = ?auto_214625 ?auto_214627 ) ) ( not ( = ?auto_214625 ?auto_214628 ) ) ( not ( = ?auto_214625 ?auto_214629 ) ) ( not ( = ?auto_214626 ?auto_214627 ) ) ( not ( = ?auto_214626 ?auto_214628 ) ) ( not ( = ?auto_214626 ?auto_214629 ) ) ( not ( = ?auto_214627 ?auto_214628 ) ) ( not ( = ?auto_214627 ?auto_214629 ) ) ( not ( = ?auto_214628 ?auto_214629 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_214628 ?auto_214629 )
      ( !STACK ?auto_214628 ?auto_214627 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_214642 - BLOCK
      ?auto_214643 - BLOCK
      ?auto_214644 - BLOCK
      ?auto_214645 - BLOCK
      ?auto_214646 - BLOCK
      ?auto_214647 - BLOCK
      ?auto_214648 - BLOCK
      ?auto_214649 - BLOCK
      ?auto_214650 - BLOCK
      ?auto_214651 - BLOCK
      ?auto_214652 - BLOCK
      ?auto_214653 - BLOCK
    )
    :vars
    (
      ?auto_214654 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_214653 ?auto_214654 ) ( ON-TABLE ?auto_214642 ) ( ON ?auto_214643 ?auto_214642 ) ( ON ?auto_214644 ?auto_214643 ) ( ON ?auto_214645 ?auto_214644 ) ( ON ?auto_214646 ?auto_214645 ) ( ON ?auto_214647 ?auto_214646 ) ( ON ?auto_214648 ?auto_214647 ) ( ON ?auto_214649 ?auto_214648 ) ( ON ?auto_214650 ?auto_214649 ) ( ON ?auto_214651 ?auto_214650 ) ( not ( = ?auto_214642 ?auto_214643 ) ) ( not ( = ?auto_214642 ?auto_214644 ) ) ( not ( = ?auto_214642 ?auto_214645 ) ) ( not ( = ?auto_214642 ?auto_214646 ) ) ( not ( = ?auto_214642 ?auto_214647 ) ) ( not ( = ?auto_214642 ?auto_214648 ) ) ( not ( = ?auto_214642 ?auto_214649 ) ) ( not ( = ?auto_214642 ?auto_214650 ) ) ( not ( = ?auto_214642 ?auto_214651 ) ) ( not ( = ?auto_214642 ?auto_214652 ) ) ( not ( = ?auto_214642 ?auto_214653 ) ) ( not ( = ?auto_214642 ?auto_214654 ) ) ( not ( = ?auto_214643 ?auto_214644 ) ) ( not ( = ?auto_214643 ?auto_214645 ) ) ( not ( = ?auto_214643 ?auto_214646 ) ) ( not ( = ?auto_214643 ?auto_214647 ) ) ( not ( = ?auto_214643 ?auto_214648 ) ) ( not ( = ?auto_214643 ?auto_214649 ) ) ( not ( = ?auto_214643 ?auto_214650 ) ) ( not ( = ?auto_214643 ?auto_214651 ) ) ( not ( = ?auto_214643 ?auto_214652 ) ) ( not ( = ?auto_214643 ?auto_214653 ) ) ( not ( = ?auto_214643 ?auto_214654 ) ) ( not ( = ?auto_214644 ?auto_214645 ) ) ( not ( = ?auto_214644 ?auto_214646 ) ) ( not ( = ?auto_214644 ?auto_214647 ) ) ( not ( = ?auto_214644 ?auto_214648 ) ) ( not ( = ?auto_214644 ?auto_214649 ) ) ( not ( = ?auto_214644 ?auto_214650 ) ) ( not ( = ?auto_214644 ?auto_214651 ) ) ( not ( = ?auto_214644 ?auto_214652 ) ) ( not ( = ?auto_214644 ?auto_214653 ) ) ( not ( = ?auto_214644 ?auto_214654 ) ) ( not ( = ?auto_214645 ?auto_214646 ) ) ( not ( = ?auto_214645 ?auto_214647 ) ) ( not ( = ?auto_214645 ?auto_214648 ) ) ( not ( = ?auto_214645 ?auto_214649 ) ) ( not ( = ?auto_214645 ?auto_214650 ) ) ( not ( = ?auto_214645 ?auto_214651 ) ) ( not ( = ?auto_214645 ?auto_214652 ) ) ( not ( = ?auto_214645 ?auto_214653 ) ) ( not ( = ?auto_214645 ?auto_214654 ) ) ( not ( = ?auto_214646 ?auto_214647 ) ) ( not ( = ?auto_214646 ?auto_214648 ) ) ( not ( = ?auto_214646 ?auto_214649 ) ) ( not ( = ?auto_214646 ?auto_214650 ) ) ( not ( = ?auto_214646 ?auto_214651 ) ) ( not ( = ?auto_214646 ?auto_214652 ) ) ( not ( = ?auto_214646 ?auto_214653 ) ) ( not ( = ?auto_214646 ?auto_214654 ) ) ( not ( = ?auto_214647 ?auto_214648 ) ) ( not ( = ?auto_214647 ?auto_214649 ) ) ( not ( = ?auto_214647 ?auto_214650 ) ) ( not ( = ?auto_214647 ?auto_214651 ) ) ( not ( = ?auto_214647 ?auto_214652 ) ) ( not ( = ?auto_214647 ?auto_214653 ) ) ( not ( = ?auto_214647 ?auto_214654 ) ) ( not ( = ?auto_214648 ?auto_214649 ) ) ( not ( = ?auto_214648 ?auto_214650 ) ) ( not ( = ?auto_214648 ?auto_214651 ) ) ( not ( = ?auto_214648 ?auto_214652 ) ) ( not ( = ?auto_214648 ?auto_214653 ) ) ( not ( = ?auto_214648 ?auto_214654 ) ) ( not ( = ?auto_214649 ?auto_214650 ) ) ( not ( = ?auto_214649 ?auto_214651 ) ) ( not ( = ?auto_214649 ?auto_214652 ) ) ( not ( = ?auto_214649 ?auto_214653 ) ) ( not ( = ?auto_214649 ?auto_214654 ) ) ( not ( = ?auto_214650 ?auto_214651 ) ) ( not ( = ?auto_214650 ?auto_214652 ) ) ( not ( = ?auto_214650 ?auto_214653 ) ) ( not ( = ?auto_214650 ?auto_214654 ) ) ( not ( = ?auto_214651 ?auto_214652 ) ) ( not ( = ?auto_214651 ?auto_214653 ) ) ( not ( = ?auto_214651 ?auto_214654 ) ) ( not ( = ?auto_214652 ?auto_214653 ) ) ( not ( = ?auto_214652 ?auto_214654 ) ) ( not ( = ?auto_214653 ?auto_214654 ) ) ( CLEAR ?auto_214651 ) ( ON ?auto_214652 ?auto_214653 ) ( CLEAR ?auto_214652 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_214642 ?auto_214643 ?auto_214644 ?auto_214645 ?auto_214646 ?auto_214647 ?auto_214648 ?auto_214649 ?auto_214650 ?auto_214651 ?auto_214652 )
      ( MAKE-12PILE ?auto_214642 ?auto_214643 ?auto_214644 ?auto_214645 ?auto_214646 ?auto_214647 ?auto_214648 ?auto_214649 ?auto_214650 ?auto_214651 ?auto_214652 ?auto_214653 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_214667 - BLOCK
      ?auto_214668 - BLOCK
      ?auto_214669 - BLOCK
      ?auto_214670 - BLOCK
      ?auto_214671 - BLOCK
      ?auto_214672 - BLOCK
      ?auto_214673 - BLOCK
      ?auto_214674 - BLOCK
      ?auto_214675 - BLOCK
      ?auto_214676 - BLOCK
      ?auto_214677 - BLOCK
      ?auto_214678 - BLOCK
    )
    :vars
    (
      ?auto_214679 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_214678 ?auto_214679 ) ( ON-TABLE ?auto_214667 ) ( ON ?auto_214668 ?auto_214667 ) ( ON ?auto_214669 ?auto_214668 ) ( ON ?auto_214670 ?auto_214669 ) ( ON ?auto_214671 ?auto_214670 ) ( ON ?auto_214672 ?auto_214671 ) ( ON ?auto_214673 ?auto_214672 ) ( ON ?auto_214674 ?auto_214673 ) ( ON ?auto_214675 ?auto_214674 ) ( ON ?auto_214676 ?auto_214675 ) ( not ( = ?auto_214667 ?auto_214668 ) ) ( not ( = ?auto_214667 ?auto_214669 ) ) ( not ( = ?auto_214667 ?auto_214670 ) ) ( not ( = ?auto_214667 ?auto_214671 ) ) ( not ( = ?auto_214667 ?auto_214672 ) ) ( not ( = ?auto_214667 ?auto_214673 ) ) ( not ( = ?auto_214667 ?auto_214674 ) ) ( not ( = ?auto_214667 ?auto_214675 ) ) ( not ( = ?auto_214667 ?auto_214676 ) ) ( not ( = ?auto_214667 ?auto_214677 ) ) ( not ( = ?auto_214667 ?auto_214678 ) ) ( not ( = ?auto_214667 ?auto_214679 ) ) ( not ( = ?auto_214668 ?auto_214669 ) ) ( not ( = ?auto_214668 ?auto_214670 ) ) ( not ( = ?auto_214668 ?auto_214671 ) ) ( not ( = ?auto_214668 ?auto_214672 ) ) ( not ( = ?auto_214668 ?auto_214673 ) ) ( not ( = ?auto_214668 ?auto_214674 ) ) ( not ( = ?auto_214668 ?auto_214675 ) ) ( not ( = ?auto_214668 ?auto_214676 ) ) ( not ( = ?auto_214668 ?auto_214677 ) ) ( not ( = ?auto_214668 ?auto_214678 ) ) ( not ( = ?auto_214668 ?auto_214679 ) ) ( not ( = ?auto_214669 ?auto_214670 ) ) ( not ( = ?auto_214669 ?auto_214671 ) ) ( not ( = ?auto_214669 ?auto_214672 ) ) ( not ( = ?auto_214669 ?auto_214673 ) ) ( not ( = ?auto_214669 ?auto_214674 ) ) ( not ( = ?auto_214669 ?auto_214675 ) ) ( not ( = ?auto_214669 ?auto_214676 ) ) ( not ( = ?auto_214669 ?auto_214677 ) ) ( not ( = ?auto_214669 ?auto_214678 ) ) ( not ( = ?auto_214669 ?auto_214679 ) ) ( not ( = ?auto_214670 ?auto_214671 ) ) ( not ( = ?auto_214670 ?auto_214672 ) ) ( not ( = ?auto_214670 ?auto_214673 ) ) ( not ( = ?auto_214670 ?auto_214674 ) ) ( not ( = ?auto_214670 ?auto_214675 ) ) ( not ( = ?auto_214670 ?auto_214676 ) ) ( not ( = ?auto_214670 ?auto_214677 ) ) ( not ( = ?auto_214670 ?auto_214678 ) ) ( not ( = ?auto_214670 ?auto_214679 ) ) ( not ( = ?auto_214671 ?auto_214672 ) ) ( not ( = ?auto_214671 ?auto_214673 ) ) ( not ( = ?auto_214671 ?auto_214674 ) ) ( not ( = ?auto_214671 ?auto_214675 ) ) ( not ( = ?auto_214671 ?auto_214676 ) ) ( not ( = ?auto_214671 ?auto_214677 ) ) ( not ( = ?auto_214671 ?auto_214678 ) ) ( not ( = ?auto_214671 ?auto_214679 ) ) ( not ( = ?auto_214672 ?auto_214673 ) ) ( not ( = ?auto_214672 ?auto_214674 ) ) ( not ( = ?auto_214672 ?auto_214675 ) ) ( not ( = ?auto_214672 ?auto_214676 ) ) ( not ( = ?auto_214672 ?auto_214677 ) ) ( not ( = ?auto_214672 ?auto_214678 ) ) ( not ( = ?auto_214672 ?auto_214679 ) ) ( not ( = ?auto_214673 ?auto_214674 ) ) ( not ( = ?auto_214673 ?auto_214675 ) ) ( not ( = ?auto_214673 ?auto_214676 ) ) ( not ( = ?auto_214673 ?auto_214677 ) ) ( not ( = ?auto_214673 ?auto_214678 ) ) ( not ( = ?auto_214673 ?auto_214679 ) ) ( not ( = ?auto_214674 ?auto_214675 ) ) ( not ( = ?auto_214674 ?auto_214676 ) ) ( not ( = ?auto_214674 ?auto_214677 ) ) ( not ( = ?auto_214674 ?auto_214678 ) ) ( not ( = ?auto_214674 ?auto_214679 ) ) ( not ( = ?auto_214675 ?auto_214676 ) ) ( not ( = ?auto_214675 ?auto_214677 ) ) ( not ( = ?auto_214675 ?auto_214678 ) ) ( not ( = ?auto_214675 ?auto_214679 ) ) ( not ( = ?auto_214676 ?auto_214677 ) ) ( not ( = ?auto_214676 ?auto_214678 ) ) ( not ( = ?auto_214676 ?auto_214679 ) ) ( not ( = ?auto_214677 ?auto_214678 ) ) ( not ( = ?auto_214677 ?auto_214679 ) ) ( not ( = ?auto_214678 ?auto_214679 ) ) ( CLEAR ?auto_214676 ) ( ON ?auto_214677 ?auto_214678 ) ( CLEAR ?auto_214677 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_214667 ?auto_214668 ?auto_214669 ?auto_214670 ?auto_214671 ?auto_214672 ?auto_214673 ?auto_214674 ?auto_214675 ?auto_214676 ?auto_214677 )
      ( MAKE-12PILE ?auto_214667 ?auto_214668 ?auto_214669 ?auto_214670 ?auto_214671 ?auto_214672 ?auto_214673 ?auto_214674 ?auto_214675 ?auto_214676 ?auto_214677 ?auto_214678 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_214692 - BLOCK
      ?auto_214693 - BLOCK
      ?auto_214694 - BLOCK
      ?auto_214695 - BLOCK
      ?auto_214696 - BLOCK
      ?auto_214697 - BLOCK
      ?auto_214698 - BLOCK
      ?auto_214699 - BLOCK
      ?auto_214700 - BLOCK
      ?auto_214701 - BLOCK
      ?auto_214702 - BLOCK
      ?auto_214703 - BLOCK
    )
    :vars
    (
      ?auto_214704 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_214703 ?auto_214704 ) ( ON-TABLE ?auto_214692 ) ( ON ?auto_214693 ?auto_214692 ) ( ON ?auto_214694 ?auto_214693 ) ( ON ?auto_214695 ?auto_214694 ) ( ON ?auto_214696 ?auto_214695 ) ( ON ?auto_214697 ?auto_214696 ) ( ON ?auto_214698 ?auto_214697 ) ( ON ?auto_214699 ?auto_214698 ) ( ON ?auto_214700 ?auto_214699 ) ( not ( = ?auto_214692 ?auto_214693 ) ) ( not ( = ?auto_214692 ?auto_214694 ) ) ( not ( = ?auto_214692 ?auto_214695 ) ) ( not ( = ?auto_214692 ?auto_214696 ) ) ( not ( = ?auto_214692 ?auto_214697 ) ) ( not ( = ?auto_214692 ?auto_214698 ) ) ( not ( = ?auto_214692 ?auto_214699 ) ) ( not ( = ?auto_214692 ?auto_214700 ) ) ( not ( = ?auto_214692 ?auto_214701 ) ) ( not ( = ?auto_214692 ?auto_214702 ) ) ( not ( = ?auto_214692 ?auto_214703 ) ) ( not ( = ?auto_214692 ?auto_214704 ) ) ( not ( = ?auto_214693 ?auto_214694 ) ) ( not ( = ?auto_214693 ?auto_214695 ) ) ( not ( = ?auto_214693 ?auto_214696 ) ) ( not ( = ?auto_214693 ?auto_214697 ) ) ( not ( = ?auto_214693 ?auto_214698 ) ) ( not ( = ?auto_214693 ?auto_214699 ) ) ( not ( = ?auto_214693 ?auto_214700 ) ) ( not ( = ?auto_214693 ?auto_214701 ) ) ( not ( = ?auto_214693 ?auto_214702 ) ) ( not ( = ?auto_214693 ?auto_214703 ) ) ( not ( = ?auto_214693 ?auto_214704 ) ) ( not ( = ?auto_214694 ?auto_214695 ) ) ( not ( = ?auto_214694 ?auto_214696 ) ) ( not ( = ?auto_214694 ?auto_214697 ) ) ( not ( = ?auto_214694 ?auto_214698 ) ) ( not ( = ?auto_214694 ?auto_214699 ) ) ( not ( = ?auto_214694 ?auto_214700 ) ) ( not ( = ?auto_214694 ?auto_214701 ) ) ( not ( = ?auto_214694 ?auto_214702 ) ) ( not ( = ?auto_214694 ?auto_214703 ) ) ( not ( = ?auto_214694 ?auto_214704 ) ) ( not ( = ?auto_214695 ?auto_214696 ) ) ( not ( = ?auto_214695 ?auto_214697 ) ) ( not ( = ?auto_214695 ?auto_214698 ) ) ( not ( = ?auto_214695 ?auto_214699 ) ) ( not ( = ?auto_214695 ?auto_214700 ) ) ( not ( = ?auto_214695 ?auto_214701 ) ) ( not ( = ?auto_214695 ?auto_214702 ) ) ( not ( = ?auto_214695 ?auto_214703 ) ) ( not ( = ?auto_214695 ?auto_214704 ) ) ( not ( = ?auto_214696 ?auto_214697 ) ) ( not ( = ?auto_214696 ?auto_214698 ) ) ( not ( = ?auto_214696 ?auto_214699 ) ) ( not ( = ?auto_214696 ?auto_214700 ) ) ( not ( = ?auto_214696 ?auto_214701 ) ) ( not ( = ?auto_214696 ?auto_214702 ) ) ( not ( = ?auto_214696 ?auto_214703 ) ) ( not ( = ?auto_214696 ?auto_214704 ) ) ( not ( = ?auto_214697 ?auto_214698 ) ) ( not ( = ?auto_214697 ?auto_214699 ) ) ( not ( = ?auto_214697 ?auto_214700 ) ) ( not ( = ?auto_214697 ?auto_214701 ) ) ( not ( = ?auto_214697 ?auto_214702 ) ) ( not ( = ?auto_214697 ?auto_214703 ) ) ( not ( = ?auto_214697 ?auto_214704 ) ) ( not ( = ?auto_214698 ?auto_214699 ) ) ( not ( = ?auto_214698 ?auto_214700 ) ) ( not ( = ?auto_214698 ?auto_214701 ) ) ( not ( = ?auto_214698 ?auto_214702 ) ) ( not ( = ?auto_214698 ?auto_214703 ) ) ( not ( = ?auto_214698 ?auto_214704 ) ) ( not ( = ?auto_214699 ?auto_214700 ) ) ( not ( = ?auto_214699 ?auto_214701 ) ) ( not ( = ?auto_214699 ?auto_214702 ) ) ( not ( = ?auto_214699 ?auto_214703 ) ) ( not ( = ?auto_214699 ?auto_214704 ) ) ( not ( = ?auto_214700 ?auto_214701 ) ) ( not ( = ?auto_214700 ?auto_214702 ) ) ( not ( = ?auto_214700 ?auto_214703 ) ) ( not ( = ?auto_214700 ?auto_214704 ) ) ( not ( = ?auto_214701 ?auto_214702 ) ) ( not ( = ?auto_214701 ?auto_214703 ) ) ( not ( = ?auto_214701 ?auto_214704 ) ) ( not ( = ?auto_214702 ?auto_214703 ) ) ( not ( = ?auto_214702 ?auto_214704 ) ) ( not ( = ?auto_214703 ?auto_214704 ) ) ( ON ?auto_214702 ?auto_214703 ) ( CLEAR ?auto_214700 ) ( ON ?auto_214701 ?auto_214702 ) ( CLEAR ?auto_214701 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_214692 ?auto_214693 ?auto_214694 ?auto_214695 ?auto_214696 ?auto_214697 ?auto_214698 ?auto_214699 ?auto_214700 ?auto_214701 )
      ( MAKE-12PILE ?auto_214692 ?auto_214693 ?auto_214694 ?auto_214695 ?auto_214696 ?auto_214697 ?auto_214698 ?auto_214699 ?auto_214700 ?auto_214701 ?auto_214702 ?auto_214703 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_214717 - BLOCK
      ?auto_214718 - BLOCK
      ?auto_214719 - BLOCK
      ?auto_214720 - BLOCK
      ?auto_214721 - BLOCK
      ?auto_214722 - BLOCK
      ?auto_214723 - BLOCK
      ?auto_214724 - BLOCK
      ?auto_214725 - BLOCK
      ?auto_214726 - BLOCK
      ?auto_214727 - BLOCK
      ?auto_214728 - BLOCK
    )
    :vars
    (
      ?auto_214729 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_214728 ?auto_214729 ) ( ON-TABLE ?auto_214717 ) ( ON ?auto_214718 ?auto_214717 ) ( ON ?auto_214719 ?auto_214718 ) ( ON ?auto_214720 ?auto_214719 ) ( ON ?auto_214721 ?auto_214720 ) ( ON ?auto_214722 ?auto_214721 ) ( ON ?auto_214723 ?auto_214722 ) ( ON ?auto_214724 ?auto_214723 ) ( ON ?auto_214725 ?auto_214724 ) ( not ( = ?auto_214717 ?auto_214718 ) ) ( not ( = ?auto_214717 ?auto_214719 ) ) ( not ( = ?auto_214717 ?auto_214720 ) ) ( not ( = ?auto_214717 ?auto_214721 ) ) ( not ( = ?auto_214717 ?auto_214722 ) ) ( not ( = ?auto_214717 ?auto_214723 ) ) ( not ( = ?auto_214717 ?auto_214724 ) ) ( not ( = ?auto_214717 ?auto_214725 ) ) ( not ( = ?auto_214717 ?auto_214726 ) ) ( not ( = ?auto_214717 ?auto_214727 ) ) ( not ( = ?auto_214717 ?auto_214728 ) ) ( not ( = ?auto_214717 ?auto_214729 ) ) ( not ( = ?auto_214718 ?auto_214719 ) ) ( not ( = ?auto_214718 ?auto_214720 ) ) ( not ( = ?auto_214718 ?auto_214721 ) ) ( not ( = ?auto_214718 ?auto_214722 ) ) ( not ( = ?auto_214718 ?auto_214723 ) ) ( not ( = ?auto_214718 ?auto_214724 ) ) ( not ( = ?auto_214718 ?auto_214725 ) ) ( not ( = ?auto_214718 ?auto_214726 ) ) ( not ( = ?auto_214718 ?auto_214727 ) ) ( not ( = ?auto_214718 ?auto_214728 ) ) ( not ( = ?auto_214718 ?auto_214729 ) ) ( not ( = ?auto_214719 ?auto_214720 ) ) ( not ( = ?auto_214719 ?auto_214721 ) ) ( not ( = ?auto_214719 ?auto_214722 ) ) ( not ( = ?auto_214719 ?auto_214723 ) ) ( not ( = ?auto_214719 ?auto_214724 ) ) ( not ( = ?auto_214719 ?auto_214725 ) ) ( not ( = ?auto_214719 ?auto_214726 ) ) ( not ( = ?auto_214719 ?auto_214727 ) ) ( not ( = ?auto_214719 ?auto_214728 ) ) ( not ( = ?auto_214719 ?auto_214729 ) ) ( not ( = ?auto_214720 ?auto_214721 ) ) ( not ( = ?auto_214720 ?auto_214722 ) ) ( not ( = ?auto_214720 ?auto_214723 ) ) ( not ( = ?auto_214720 ?auto_214724 ) ) ( not ( = ?auto_214720 ?auto_214725 ) ) ( not ( = ?auto_214720 ?auto_214726 ) ) ( not ( = ?auto_214720 ?auto_214727 ) ) ( not ( = ?auto_214720 ?auto_214728 ) ) ( not ( = ?auto_214720 ?auto_214729 ) ) ( not ( = ?auto_214721 ?auto_214722 ) ) ( not ( = ?auto_214721 ?auto_214723 ) ) ( not ( = ?auto_214721 ?auto_214724 ) ) ( not ( = ?auto_214721 ?auto_214725 ) ) ( not ( = ?auto_214721 ?auto_214726 ) ) ( not ( = ?auto_214721 ?auto_214727 ) ) ( not ( = ?auto_214721 ?auto_214728 ) ) ( not ( = ?auto_214721 ?auto_214729 ) ) ( not ( = ?auto_214722 ?auto_214723 ) ) ( not ( = ?auto_214722 ?auto_214724 ) ) ( not ( = ?auto_214722 ?auto_214725 ) ) ( not ( = ?auto_214722 ?auto_214726 ) ) ( not ( = ?auto_214722 ?auto_214727 ) ) ( not ( = ?auto_214722 ?auto_214728 ) ) ( not ( = ?auto_214722 ?auto_214729 ) ) ( not ( = ?auto_214723 ?auto_214724 ) ) ( not ( = ?auto_214723 ?auto_214725 ) ) ( not ( = ?auto_214723 ?auto_214726 ) ) ( not ( = ?auto_214723 ?auto_214727 ) ) ( not ( = ?auto_214723 ?auto_214728 ) ) ( not ( = ?auto_214723 ?auto_214729 ) ) ( not ( = ?auto_214724 ?auto_214725 ) ) ( not ( = ?auto_214724 ?auto_214726 ) ) ( not ( = ?auto_214724 ?auto_214727 ) ) ( not ( = ?auto_214724 ?auto_214728 ) ) ( not ( = ?auto_214724 ?auto_214729 ) ) ( not ( = ?auto_214725 ?auto_214726 ) ) ( not ( = ?auto_214725 ?auto_214727 ) ) ( not ( = ?auto_214725 ?auto_214728 ) ) ( not ( = ?auto_214725 ?auto_214729 ) ) ( not ( = ?auto_214726 ?auto_214727 ) ) ( not ( = ?auto_214726 ?auto_214728 ) ) ( not ( = ?auto_214726 ?auto_214729 ) ) ( not ( = ?auto_214727 ?auto_214728 ) ) ( not ( = ?auto_214727 ?auto_214729 ) ) ( not ( = ?auto_214728 ?auto_214729 ) ) ( ON ?auto_214727 ?auto_214728 ) ( CLEAR ?auto_214725 ) ( ON ?auto_214726 ?auto_214727 ) ( CLEAR ?auto_214726 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_214717 ?auto_214718 ?auto_214719 ?auto_214720 ?auto_214721 ?auto_214722 ?auto_214723 ?auto_214724 ?auto_214725 ?auto_214726 )
      ( MAKE-12PILE ?auto_214717 ?auto_214718 ?auto_214719 ?auto_214720 ?auto_214721 ?auto_214722 ?auto_214723 ?auto_214724 ?auto_214725 ?auto_214726 ?auto_214727 ?auto_214728 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_214742 - BLOCK
      ?auto_214743 - BLOCK
      ?auto_214744 - BLOCK
      ?auto_214745 - BLOCK
      ?auto_214746 - BLOCK
      ?auto_214747 - BLOCK
      ?auto_214748 - BLOCK
      ?auto_214749 - BLOCK
      ?auto_214750 - BLOCK
      ?auto_214751 - BLOCK
      ?auto_214752 - BLOCK
      ?auto_214753 - BLOCK
    )
    :vars
    (
      ?auto_214754 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_214753 ?auto_214754 ) ( ON-TABLE ?auto_214742 ) ( ON ?auto_214743 ?auto_214742 ) ( ON ?auto_214744 ?auto_214743 ) ( ON ?auto_214745 ?auto_214744 ) ( ON ?auto_214746 ?auto_214745 ) ( ON ?auto_214747 ?auto_214746 ) ( ON ?auto_214748 ?auto_214747 ) ( ON ?auto_214749 ?auto_214748 ) ( not ( = ?auto_214742 ?auto_214743 ) ) ( not ( = ?auto_214742 ?auto_214744 ) ) ( not ( = ?auto_214742 ?auto_214745 ) ) ( not ( = ?auto_214742 ?auto_214746 ) ) ( not ( = ?auto_214742 ?auto_214747 ) ) ( not ( = ?auto_214742 ?auto_214748 ) ) ( not ( = ?auto_214742 ?auto_214749 ) ) ( not ( = ?auto_214742 ?auto_214750 ) ) ( not ( = ?auto_214742 ?auto_214751 ) ) ( not ( = ?auto_214742 ?auto_214752 ) ) ( not ( = ?auto_214742 ?auto_214753 ) ) ( not ( = ?auto_214742 ?auto_214754 ) ) ( not ( = ?auto_214743 ?auto_214744 ) ) ( not ( = ?auto_214743 ?auto_214745 ) ) ( not ( = ?auto_214743 ?auto_214746 ) ) ( not ( = ?auto_214743 ?auto_214747 ) ) ( not ( = ?auto_214743 ?auto_214748 ) ) ( not ( = ?auto_214743 ?auto_214749 ) ) ( not ( = ?auto_214743 ?auto_214750 ) ) ( not ( = ?auto_214743 ?auto_214751 ) ) ( not ( = ?auto_214743 ?auto_214752 ) ) ( not ( = ?auto_214743 ?auto_214753 ) ) ( not ( = ?auto_214743 ?auto_214754 ) ) ( not ( = ?auto_214744 ?auto_214745 ) ) ( not ( = ?auto_214744 ?auto_214746 ) ) ( not ( = ?auto_214744 ?auto_214747 ) ) ( not ( = ?auto_214744 ?auto_214748 ) ) ( not ( = ?auto_214744 ?auto_214749 ) ) ( not ( = ?auto_214744 ?auto_214750 ) ) ( not ( = ?auto_214744 ?auto_214751 ) ) ( not ( = ?auto_214744 ?auto_214752 ) ) ( not ( = ?auto_214744 ?auto_214753 ) ) ( not ( = ?auto_214744 ?auto_214754 ) ) ( not ( = ?auto_214745 ?auto_214746 ) ) ( not ( = ?auto_214745 ?auto_214747 ) ) ( not ( = ?auto_214745 ?auto_214748 ) ) ( not ( = ?auto_214745 ?auto_214749 ) ) ( not ( = ?auto_214745 ?auto_214750 ) ) ( not ( = ?auto_214745 ?auto_214751 ) ) ( not ( = ?auto_214745 ?auto_214752 ) ) ( not ( = ?auto_214745 ?auto_214753 ) ) ( not ( = ?auto_214745 ?auto_214754 ) ) ( not ( = ?auto_214746 ?auto_214747 ) ) ( not ( = ?auto_214746 ?auto_214748 ) ) ( not ( = ?auto_214746 ?auto_214749 ) ) ( not ( = ?auto_214746 ?auto_214750 ) ) ( not ( = ?auto_214746 ?auto_214751 ) ) ( not ( = ?auto_214746 ?auto_214752 ) ) ( not ( = ?auto_214746 ?auto_214753 ) ) ( not ( = ?auto_214746 ?auto_214754 ) ) ( not ( = ?auto_214747 ?auto_214748 ) ) ( not ( = ?auto_214747 ?auto_214749 ) ) ( not ( = ?auto_214747 ?auto_214750 ) ) ( not ( = ?auto_214747 ?auto_214751 ) ) ( not ( = ?auto_214747 ?auto_214752 ) ) ( not ( = ?auto_214747 ?auto_214753 ) ) ( not ( = ?auto_214747 ?auto_214754 ) ) ( not ( = ?auto_214748 ?auto_214749 ) ) ( not ( = ?auto_214748 ?auto_214750 ) ) ( not ( = ?auto_214748 ?auto_214751 ) ) ( not ( = ?auto_214748 ?auto_214752 ) ) ( not ( = ?auto_214748 ?auto_214753 ) ) ( not ( = ?auto_214748 ?auto_214754 ) ) ( not ( = ?auto_214749 ?auto_214750 ) ) ( not ( = ?auto_214749 ?auto_214751 ) ) ( not ( = ?auto_214749 ?auto_214752 ) ) ( not ( = ?auto_214749 ?auto_214753 ) ) ( not ( = ?auto_214749 ?auto_214754 ) ) ( not ( = ?auto_214750 ?auto_214751 ) ) ( not ( = ?auto_214750 ?auto_214752 ) ) ( not ( = ?auto_214750 ?auto_214753 ) ) ( not ( = ?auto_214750 ?auto_214754 ) ) ( not ( = ?auto_214751 ?auto_214752 ) ) ( not ( = ?auto_214751 ?auto_214753 ) ) ( not ( = ?auto_214751 ?auto_214754 ) ) ( not ( = ?auto_214752 ?auto_214753 ) ) ( not ( = ?auto_214752 ?auto_214754 ) ) ( not ( = ?auto_214753 ?auto_214754 ) ) ( ON ?auto_214752 ?auto_214753 ) ( ON ?auto_214751 ?auto_214752 ) ( CLEAR ?auto_214749 ) ( ON ?auto_214750 ?auto_214751 ) ( CLEAR ?auto_214750 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_214742 ?auto_214743 ?auto_214744 ?auto_214745 ?auto_214746 ?auto_214747 ?auto_214748 ?auto_214749 ?auto_214750 )
      ( MAKE-12PILE ?auto_214742 ?auto_214743 ?auto_214744 ?auto_214745 ?auto_214746 ?auto_214747 ?auto_214748 ?auto_214749 ?auto_214750 ?auto_214751 ?auto_214752 ?auto_214753 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_214767 - BLOCK
      ?auto_214768 - BLOCK
      ?auto_214769 - BLOCK
      ?auto_214770 - BLOCK
      ?auto_214771 - BLOCK
      ?auto_214772 - BLOCK
      ?auto_214773 - BLOCK
      ?auto_214774 - BLOCK
      ?auto_214775 - BLOCK
      ?auto_214776 - BLOCK
      ?auto_214777 - BLOCK
      ?auto_214778 - BLOCK
    )
    :vars
    (
      ?auto_214779 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_214778 ?auto_214779 ) ( ON-TABLE ?auto_214767 ) ( ON ?auto_214768 ?auto_214767 ) ( ON ?auto_214769 ?auto_214768 ) ( ON ?auto_214770 ?auto_214769 ) ( ON ?auto_214771 ?auto_214770 ) ( ON ?auto_214772 ?auto_214771 ) ( ON ?auto_214773 ?auto_214772 ) ( ON ?auto_214774 ?auto_214773 ) ( not ( = ?auto_214767 ?auto_214768 ) ) ( not ( = ?auto_214767 ?auto_214769 ) ) ( not ( = ?auto_214767 ?auto_214770 ) ) ( not ( = ?auto_214767 ?auto_214771 ) ) ( not ( = ?auto_214767 ?auto_214772 ) ) ( not ( = ?auto_214767 ?auto_214773 ) ) ( not ( = ?auto_214767 ?auto_214774 ) ) ( not ( = ?auto_214767 ?auto_214775 ) ) ( not ( = ?auto_214767 ?auto_214776 ) ) ( not ( = ?auto_214767 ?auto_214777 ) ) ( not ( = ?auto_214767 ?auto_214778 ) ) ( not ( = ?auto_214767 ?auto_214779 ) ) ( not ( = ?auto_214768 ?auto_214769 ) ) ( not ( = ?auto_214768 ?auto_214770 ) ) ( not ( = ?auto_214768 ?auto_214771 ) ) ( not ( = ?auto_214768 ?auto_214772 ) ) ( not ( = ?auto_214768 ?auto_214773 ) ) ( not ( = ?auto_214768 ?auto_214774 ) ) ( not ( = ?auto_214768 ?auto_214775 ) ) ( not ( = ?auto_214768 ?auto_214776 ) ) ( not ( = ?auto_214768 ?auto_214777 ) ) ( not ( = ?auto_214768 ?auto_214778 ) ) ( not ( = ?auto_214768 ?auto_214779 ) ) ( not ( = ?auto_214769 ?auto_214770 ) ) ( not ( = ?auto_214769 ?auto_214771 ) ) ( not ( = ?auto_214769 ?auto_214772 ) ) ( not ( = ?auto_214769 ?auto_214773 ) ) ( not ( = ?auto_214769 ?auto_214774 ) ) ( not ( = ?auto_214769 ?auto_214775 ) ) ( not ( = ?auto_214769 ?auto_214776 ) ) ( not ( = ?auto_214769 ?auto_214777 ) ) ( not ( = ?auto_214769 ?auto_214778 ) ) ( not ( = ?auto_214769 ?auto_214779 ) ) ( not ( = ?auto_214770 ?auto_214771 ) ) ( not ( = ?auto_214770 ?auto_214772 ) ) ( not ( = ?auto_214770 ?auto_214773 ) ) ( not ( = ?auto_214770 ?auto_214774 ) ) ( not ( = ?auto_214770 ?auto_214775 ) ) ( not ( = ?auto_214770 ?auto_214776 ) ) ( not ( = ?auto_214770 ?auto_214777 ) ) ( not ( = ?auto_214770 ?auto_214778 ) ) ( not ( = ?auto_214770 ?auto_214779 ) ) ( not ( = ?auto_214771 ?auto_214772 ) ) ( not ( = ?auto_214771 ?auto_214773 ) ) ( not ( = ?auto_214771 ?auto_214774 ) ) ( not ( = ?auto_214771 ?auto_214775 ) ) ( not ( = ?auto_214771 ?auto_214776 ) ) ( not ( = ?auto_214771 ?auto_214777 ) ) ( not ( = ?auto_214771 ?auto_214778 ) ) ( not ( = ?auto_214771 ?auto_214779 ) ) ( not ( = ?auto_214772 ?auto_214773 ) ) ( not ( = ?auto_214772 ?auto_214774 ) ) ( not ( = ?auto_214772 ?auto_214775 ) ) ( not ( = ?auto_214772 ?auto_214776 ) ) ( not ( = ?auto_214772 ?auto_214777 ) ) ( not ( = ?auto_214772 ?auto_214778 ) ) ( not ( = ?auto_214772 ?auto_214779 ) ) ( not ( = ?auto_214773 ?auto_214774 ) ) ( not ( = ?auto_214773 ?auto_214775 ) ) ( not ( = ?auto_214773 ?auto_214776 ) ) ( not ( = ?auto_214773 ?auto_214777 ) ) ( not ( = ?auto_214773 ?auto_214778 ) ) ( not ( = ?auto_214773 ?auto_214779 ) ) ( not ( = ?auto_214774 ?auto_214775 ) ) ( not ( = ?auto_214774 ?auto_214776 ) ) ( not ( = ?auto_214774 ?auto_214777 ) ) ( not ( = ?auto_214774 ?auto_214778 ) ) ( not ( = ?auto_214774 ?auto_214779 ) ) ( not ( = ?auto_214775 ?auto_214776 ) ) ( not ( = ?auto_214775 ?auto_214777 ) ) ( not ( = ?auto_214775 ?auto_214778 ) ) ( not ( = ?auto_214775 ?auto_214779 ) ) ( not ( = ?auto_214776 ?auto_214777 ) ) ( not ( = ?auto_214776 ?auto_214778 ) ) ( not ( = ?auto_214776 ?auto_214779 ) ) ( not ( = ?auto_214777 ?auto_214778 ) ) ( not ( = ?auto_214777 ?auto_214779 ) ) ( not ( = ?auto_214778 ?auto_214779 ) ) ( ON ?auto_214777 ?auto_214778 ) ( ON ?auto_214776 ?auto_214777 ) ( CLEAR ?auto_214774 ) ( ON ?auto_214775 ?auto_214776 ) ( CLEAR ?auto_214775 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_214767 ?auto_214768 ?auto_214769 ?auto_214770 ?auto_214771 ?auto_214772 ?auto_214773 ?auto_214774 ?auto_214775 )
      ( MAKE-12PILE ?auto_214767 ?auto_214768 ?auto_214769 ?auto_214770 ?auto_214771 ?auto_214772 ?auto_214773 ?auto_214774 ?auto_214775 ?auto_214776 ?auto_214777 ?auto_214778 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_214792 - BLOCK
      ?auto_214793 - BLOCK
      ?auto_214794 - BLOCK
      ?auto_214795 - BLOCK
      ?auto_214796 - BLOCK
      ?auto_214797 - BLOCK
      ?auto_214798 - BLOCK
      ?auto_214799 - BLOCK
      ?auto_214800 - BLOCK
      ?auto_214801 - BLOCK
      ?auto_214802 - BLOCK
      ?auto_214803 - BLOCK
    )
    :vars
    (
      ?auto_214804 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_214803 ?auto_214804 ) ( ON-TABLE ?auto_214792 ) ( ON ?auto_214793 ?auto_214792 ) ( ON ?auto_214794 ?auto_214793 ) ( ON ?auto_214795 ?auto_214794 ) ( ON ?auto_214796 ?auto_214795 ) ( ON ?auto_214797 ?auto_214796 ) ( ON ?auto_214798 ?auto_214797 ) ( not ( = ?auto_214792 ?auto_214793 ) ) ( not ( = ?auto_214792 ?auto_214794 ) ) ( not ( = ?auto_214792 ?auto_214795 ) ) ( not ( = ?auto_214792 ?auto_214796 ) ) ( not ( = ?auto_214792 ?auto_214797 ) ) ( not ( = ?auto_214792 ?auto_214798 ) ) ( not ( = ?auto_214792 ?auto_214799 ) ) ( not ( = ?auto_214792 ?auto_214800 ) ) ( not ( = ?auto_214792 ?auto_214801 ) ) ( not ( = ?auto_214792 ?auto_214802 ) ) ( not ( = ?auto_214792 ?auto_214803 ) ) ( not ( = ?auto_214792 ?auto_214804 ) ) ( not ( = ?auto_214793 ?auto_214794 ) ) ( not ( = ?auto_214793 ?auto_214795 ) ) ( not ( = ?auto_214793 ?auto_214796 ) ) ( not ( = ?auto_214793 ?auto_214797 ) ) ( not ( = ?auto_214793 ?auto_214798 ) ) ( not ( = ?auto_214793 ?auto_214799 ) ) ( not ( = ?auto_214793 ?auto_214800 ) ) ( not ( = ?auto_214793 ?auto_214801 ) ) ( not ( = ?auto_214793 ?auto_214802 ) ) ( not ( = ?auto_214793 ?auto_214803 ) ) ( not ( = ?auto_214793 ?auto_214804 ) ) ( not ( = ?auto_214794 ?auto_214795 ) ) ( not ( = ?auto_214794 ?auto_214796 ) ) ( not ( = ?auto_214794 ?auto_214797 ) ) ( not ( = ?auto_214794 ?auto_214798 ) ) ( not ( = ?auto_214794 ?auto_214799 ) ) ( not ( = ?auto_214794 ?auto_214800 ) ) ( not ( = ?auto_214794 ?auto_214801 ) ) ( not ( = ?auto_214794 ?auto_214802 ) ) ( not ( = ?auto_214794 ?auto_214803 ) ) ( not ( = ?auto_214794 ?auto_214804 ) ) ( not ( = ?auto_214795 ?auto_214796 ) ) ( not ( = ?auto_214795 ?auto_214797 ) ) ( not ( = ?auto_214795 ?auto_214798 ) ) ( not ( = ?auto_214795 ?auto_214799 ) ) ( not ( = ?auto_214795 ?auto_214800 ) ) ( not ( = ?auto_214795 ?auto_214801 ) ) ( not ( = ?auto_214795 ?auto_214802 ) ) ( not ( = ?auto_214795 ?auto_214803 ) ) ( not ( = ?auto_214795 ?auto_214804 ) ) ( not ( = ?auto_214796 ?auto_214797 ) ) ( not ( = ?auto_214796 ?auto_214798 ) ) ( not ( = ?auto_214796 ?auto_214799 ) ) ( not ( = ?auto_214796 ?auto_214800 ) ) ( not ( = ?auto_214796 ?auto_214801 ) ) ( not ( = ?auto_214796 ?auto_214802 ) ) ( not ( = ?auto_214796 ?auto_214803 ) ) ( not ( = ?auto_214796 ?auto_214804 ) ) ( not ( = ?auto_214797 ?auto_214798 ) ) ( not ( = ?auto_214797 ?auto_214799 ) ) ( not ( = ?auto_214797 ?auto_214800 ) ) ( not ( = ?auto_214797 ?auto_214801 ) ) ( not ( = ?auto_214797 ?auto_214802 ) ) ( not ( = ?auto_214797 ?auto_214803 ) ) ( not ( = ?auto_214797 ?auto_214804 ) ) ( not ( = ?auto_214798 ?auto_214799 ) ) ( not ( = ?auto_214798 ?auto_214800 ) ) ( not ( = ?auto_214798 ?auto_214801 ) ) ( not ( = ?auto_214798 ?auto_214802 ) ) ( not ( = ?auto_214798 ?auto_214803 ) ) ( not ( = ?auto_214798 ?auto_214804 ) ) ( not ( = ?auto_214799 ?auto_214800 ) ) ( not ( = ?auto_214799 ?auto_214801 ) ) ( not ( = ?auto_214799 ?auto_214802 ) ) ( not ( = ?auto_214799 ?auto_214803 ) ) ( not ( = ?auto_214799 ?auto_214804 ) ) ( not ( = ?auto_214800 ?auto_214801 ) ) ( not ( = ?auto_214800 ?auto_214802 ) ) ( not ( = ?auto_214800 ?auto_214803 ) ) ( not ( = ?auto_214800 ?auto_214804 ) ) ( not ( = ?auto_214801 ?auto_214802 ) ) ( not ( = ?auto_214801 ?auto_214803 ) ) ( not ( = ?auto_214801 ?auto_214804 ) ) ( not ( = ?auto_214802 ?auto_214803 ) ) ( not ( = ?auto_214802 ?auto_214804 ) ) ( not ( = ?auto_214803 ?auto_214804 ) ) ( ON ?auto_214802 ?auto_214803 ) ( ON ?auto_214801 ?auto_214802 ) ( ON ?auto_214800 ?auto_214801 ) ( CLEAR ?auto_214798 ) ( ON ?auto_214799 ?auto_214800 ) ( CLEAR ?auto_214799 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_214792 ?auto_214793 ?auto_214794 ?auto_214795 ?auto_214796 ?auto_214797 ?auto_214798 ?auto_214799 )
      ( MAKE-12PILE ?auto_214792 ?auto_214793 ?auto_214794 ?auto_214795 ?auto_214796 ?auto_214797 ?auto_214798 ?auto_214799 ?auto_214800 ?auto_214801 ?auto_214802 ?auto_214803 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_214817 - BLOCK
      ?auto_214818 - BLOCK
      ?auto_214819 - BLOCK
      ?auto_214820 - BLOCK
      ?auto_214821 - BLOCK
      ?auto_214822 - BLOCK
      ?auto_214823 - BLOCK
      ?auto_214824 - BLOCK
      ?auto_214825 - BLOCK
      ?auto_214826 - BLOCK
      ?auto_214827 - BLOCK
      ?auto_214828 - BLOCK
    )
    :vars
    (
      ?auto_214829 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_214828 ?auto_214829 ) ( ON-TABLE ?auto_214817 ) ( ON ?auto_214818 ?auto_214817 ) ( ON ?auto_214819 ?auto_214818 ) ( ON ?auto_214820 ?auto_214819 ) ( ON ?auto_214821 ?auto_214820 ) ( ON ?auto_214822 ?auto_214821 ) ( ON ?auto_214823 ?auto_214822 ) ( not ( = ?auto_214817 ?auto_214818 ) ) ( not ( = ?auto_214817 ?auto_214819 ) ) ( not ( = ?auto_214817 ?auto_214820 ) ) ( not ( = ?auto_214817 ?auto_214821 ) ) ( not ( = ?auto_214817 ?auto_214822 ) ) ( not ( = ?auto_214817 ?auto_214823 ) ) ( not ( = ?auto_214817 ?auto_214824 ) ) ( not ( = ?auto_214817 ?auto_214825 ) ) ( not ( = ?auto_214817 ?auto_214826 ) ) ( not ( = ?auto_214817 ?auto_214827 ) ) ( not ( = ?auto_214817 ?auto_214828 ) ) ( not ( = ?auto_214817 ?auto_214829 ) ) ( not ( = ?auto_214818 ?auto_214819 ) ) ( not ( = ?auto_214818 ?auto_214820 ) ) ( not ( = ?auto_214818 ?auto_214821 ) ) ( not ( = ?auto_214818 ?auto_214822 ) ) ( not ( = ?auto_214818 ?auto_214823 ) ) ( not ( = ?auto_214818 ?auto_214824 ) ) ( not ( = ?auto_214818 ?auto_214825 ) ) ( not ( = ?auto_214818 ?auto_214826 ) ) ( not ( = ?auto_214818 ?auto_214827 ) ) ( not ( = ?auto_214818 ?auto_214828 ) ) ( not ( = ?auto_214818 ?auto_214829 ) ) ( not ( = ?auto_214819 ?auto_214820 ) ) ( not ( = ?auto_214819 ?auto_214821 ) ) ( not ( = ?auto_214819 ?auto_214822 ) ) ( not ( = ?auto_214819 ?auto_214823 ) ) ( not ( = ?auto_214819 ?auto_214824 ) ) ( not ( = ?auto_214819 ?auto_214825 ) ) ( not ( = ?auto_214819 ?auto_214826 ) ) ( not ( = ?auto_214819 ?auto_214827 ) ) ( not ( = ?auto_214819 ?auto_214828 ) ) ( not ( = ?auto_214819 ?auto_214829 ) ) ( not ( = ?auto_214820 ?auto_214821 ) ) ( not ( = ?auto_214820 ?auto_214822 ) ) ( not ( = ?auto_214820 ?auto_214823 ) ) ( not ( = ?auto_214820 ?auto_214824 ) ) ( not ( = ?auto_214820 ?auto_214825 ) ) ( not ( = ?auto_214820 ?auto_214826 ) ) ( not ( = ?auto_214820 ?auto_214827 ) ) ( not ( = ?auto_214820 ?auto_214828 ) ) ( not ( = ?auto_214820 ?auto_214829 ) ) ( not ( = ?auto_214821 ?auto_214822 ) ) ( not ( = ?auto_214821 ?auto_214823 ) ) ( not ( = ?auto_214821 ?auto_214824 ) ) ( not ( = ?auto_214821 ?auto_214825 ) ) ( not ( = ?auto_214821 ?auto_214826 ) ) ( not ( = ?auto_214821 ?auto_214827 ) ) ( not ( = ?auto_214821 ?auto_214828 ) ) ( not ( = ?auto_214821 ?auto_214829 ) ) ( not ( = ?auto_214822 ?auto_214823 ) ) ( not ( = ?auto_214822 ?auto_214824 ) ) ( not ( = ?auto_214822 ?auto_214825 ) ) ( not ( = ?auto_214822 ?auto_214826 ) ) ( not ( = ?auto_214822 ?auto_214827 ) ) ( not ( = ?auto_214822 ?auto_214828 ) ) ( not ( = ?auto_214822 ?auto_214829 ) ) ( not ( = ?auto_214823 ?auto_214824 ) ) ( not ( = ?auto_214823 ?auto_214825 ) ) ( not ( = ?auto_214823 ?auto_214826 ) ) ( not ( = ?auto_214823 ?auto_214827 ) ) ( not ( = ?auto_214823 ?auto_214828 ) ) ( not ( = ?auto_214823 ?auto_214829 ) ) ( not ( = ?auto_214824 ?auto_214825 ) ) ( not ( = ?auto_214824 ?auto_214826 ) ) ( not ( = ?auto_214824 ?auto_214827 ) ) ( not ( = ?auto_214824 ?auto_214828 ) ) ( not ( = ?auto_214824 ?auto_214829 ) ) ( not ( = ?auto_214825 ?auto_214826 ) ) ( not ( = ?auto_214825 ?auto_214827 ) ) ( not ( = ?auto_214825 ?auto_214828 ) ) ( not ( = ?auto_214825 ?auto_214829 ) ) ( not ( = ?auto_214826 ?auto_214827 ) ) ( not ( = ?auto_214826 ?auto_214828 ) ) ( not ( = ?auto_214826 ?auto_214829 ) ) ( not ( = ?auto_214827 ?auto_214828 ) ) ( not ( = ?auto_214827 ?auto_214829 ) ) ( not ( = ?auto_214828 ?auto_214829 ) ) ( ON ?auto_214827 ?auto_214828 ) ( ON ?auto_214826 ?auto_214827 ) ( ON ?auto_214825 ?auto_214826 ) ( CLEAR ?auto_214823 ) ( ON ?auto_214824 ?auto_214825 ) ( CLEAR ?auto_214824 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_214817 ?auto_214818 ?auto_214819 ?auto_214820 ?auto_214821 ?auto_214822 ?auto_214823 ?auto_214824 )
      ( MAKE-12PILE ?auto_214817 ?auto_214818 ?auto_214819 ?auto_214820 ?auto_214821 ?auto_214822 ?auto_214823 ?auto_214824 ?auto_214825 ?auto_214826 ?auto_214827 ?auto_214828 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_214842 - BLOCK
      ?auto_214843 - BLOCK
      ?auto_214844 - BLOCK
      ?auto_214845 - BLOCK
      ?auto_214846 - BLOCK
      ?auto_214847 - BLOCK
      ?auto_214848 - BLOCK
      ?auto_214849 - BLOCK
      ?auto_214850 - BLOCK
      ?auto_214851 - BLOCK
      ?auto_214852 - BLOCK
      ?auto_214853 - BLOCK
    )
    :vars
    (
      ?auto_214854 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_214853 ?auto_214854 ) ( ON-TABLE ?auto_214842 ) ( ON ?auto_214843 ?auto_214842 ) ( ON ?auto_214844 ?auto_214843 ) ( ON ?auto_214845 ?auto_214844 ) ( ON ?auto_214846 ?auto_214845 ) ( ON ?auto_214847 ?auto_214846 ) ( not ( = ?auto_214842 ?auto_214843 ) ) ( not ( = ?auto_214842 ?auto_214844 ) ) ( not ( = ?auto_214842 ?auto_214845 ) ) ( not ( = ?auto_214842 ?auto_214846 ) ) ( not ( = ?auto_214842 ?auto_214847 ) ) ( not ( = ?auto_214842 ?auto_214848 ) ) ( not ( = ?auto_214842 ?auto_214849 ) ) ( not ( = ?auto_214842 ?auto_214850 ) ) ( not ( = ?auto_214842 ?auto_214851 ) ) ( not ( = ?auto_214842 ?auto_214852 ) ) ( not ( = ?auto_214842 ?auto_214853 ) ) ( not ( = ?auto_214842 ?auto_214854 ) ) ( not ( = ?auto_214843 ?auto_214844 ) ) ( not ( = ?auto_214843 ?auto_214845 ) ) ( not ( = ?auto_214843 ?auto_214846 ) ) ( not ( = ?auto_214843 ?auto_214847 ) ) ( not ( = ?auto_214843 ?auto_214848 ) ) ( not ( = ?auto_214843 ?auto_214849 ) ) ( not ( = ?auto_214843 ?auto_214850 ) ) ( not ( = ?auto_214843 ?auto_214851 ) ) ( not ( = ?auto_214843 ?auto_214852 ) ) ( not ( = ?auto_214843 ?auto_214853 ) ) ( not ( = ?auto_214843 ?auto_214854 ) ) ( not ( = ?auto_214844 ?auto_214845 ) ) ( not ( = ?auto_214844 ?auto_214846 ) ) ( not ( = ?auto_214844 ?auto_214847 ) ) ( not ( = ?auto_214844 ?auto_214848 ) ) ( not ( = ?auto_214844 ?auto_214849 ) ) ( not ( = ?auto_214844 ?auto_214850 ) ) ( not ( = ?auto_214844 ?auto_214851 ) ) ( not ( = ?auto_214844 ?auto_214852 ) ) ( not ( = ?auto_214844 ?auto_214853 ) ) ( not ( = ?auto_214844 ?auto_214854 ) ) ( not ( = ?auto_214845 ?auto_214846 ) ) ( not ( = ?auto_214845 ?auto_214847 ) ) ( not ( = ?auto_214845 ?auto_214848 ) ) ( not ( = ?auto_214845 ?auto_214849 ) ) ( not ( = ?auto_214845 ?auto_214850 ) ) ( not ( = ?auto_214845 ?auto_214851 ) ) ( not ( = ?auto_214845 ?auto_214852 ) ) ( not ( = ?auto_214845 ?auto_214853 ) ) ( not ( = ?auto_214845 ?auto_214854 ) ) ( not ( = ?auto_214846 ?auto_214847 ) ) ( not ( = ?auto_214846 ?auto_214848 ) ) ( not ( = ?auto_214846 ?auto_214849 ) ) ( not ( = ?auto_214846 ?auto_214850 ) ) ( not ( = ?auto_214846 ?auto_214851 ) ) ( not ( = ?auto_214846 ?auto_214852 ) ) ( not ( = ?auto_214846 ?auto_214853 ) ) ( not ( = ?auto_214846 ?auto_214854 ) ) ( not ( = ?auto_214847 ?auto_214848 ) ) ( not ( = ?auto_214847 ?auto_214849 ) ) ( not ( = ?auto_214847 ?auto_214850 ) ) ( not ( = ?auto_214847 ?auto_214851 ) ) ( not ( = ?auto_214847 ?auto_214852 ) ) ( not ( = ?auto_214847 ?auto_214853 ) ) ( not ( = ?auto_214847 ?auto_214854 ) ) ( not ( = ?auto_214848 ?auto_214849 ) ) ( not ( = ?auto_214848 ?auto_214850 ) ) ( not ( = ?auto_214848 ?auto_214851 ) ) ( not ( = ?auto_214848 ?auto_214852 ) ) ( not ( = ?auto_214848 ?auto_214853 ) ) ( not ( = ?auto_214848 ?auto_214854 ) ) ( not ( = ?auto_214849 ?auto_214850 ) ) ( not ( = ?auto_214849 ?auto_214851 ) ) ( not ( = ?auto_214849 ?auto_214852 ) ) ( not ( = ?auto_214849 ?auto_214853 ) ) ( not ( = ?auto_214849 ?auto_214854 ) ) ( not ( = ?auto_214850 ?auto_214851 ) ) ( not ( = ?auto_214850 ?auto_214852 ) ) ( not ( = ?auto_214850 ?auto_214853 ) ) ( not ( = ?auto_214850 ?auto_214854 ) ) ( not ( = ?auto_214851 ?auto_214852 ) ) ( not ( = ?auto_214851 ?auto_214853 ) ) ( not ( = ?auto_214851 ?auto_214854 ) ) ( not ( = ?auto_214852 ?auto_214853 ) ) ( not ( = ?auto_214852 ?auto_214854 ) ) ( not ( = ?auto_214853 ?auto_214854 ) ) ( ON ?auto_214852 ?auto_214853 ) ( ON ?auto_214851 ?auto_214852 ) ( ON ?auto_214850 ?auto_214851 ) ( ON ?auto_214849 ?auto_214850 ) ( CLEAR ?auto_214847 ) ( ON ?auto_214848 ?auto_214849 ) ( CLEAR ?auto_214848 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_214842 ?auto_214843 ?auto_214844 ?auto_214845 ?auto_214846 ?auto_214847 ?auto_214848 )
      ( MAKE-12PILE ?auto_214842 ?auto_214843 ?auto_214844 ?auto_214845 ?auto_214846 ?auto_214847 ?auto_214848 ?auto_214849 ?auto_214850 ?auto_214851 ?auto_214852 ?auto_214853 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_214867 - BLOCK
      ?auto_214868 - BLOCK
      ?auto_214869 - BLOCK
      ?auto_214870 - BLOCK
      ?auto_214871 - BLOCK
      ?auto_214872 - BLOCK
      ?auto_214873 - BLOCK
      ?auto_214874 - BLOCK
      ?auto_214875 - BLOCK
      ?auto_214876 - BLOCK
      ?auto_214877 - BLOCK
      ?auto_214878 - BLOCK
    )
    :vars
    (
      ?auto_214879 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_214878 ?auto_214879 ) ( ON-TABLE ?auto_214867 ) ( ON ?auto_214868 ?auto_214867 ) ( ON ?auto_214869 ?auto_214868 ) ( ON ?auto_214870 ?auto_214869 ) ( ON ?auto_214871 ?auto_214870 ) ( ON ?auto_214872 ?auto_214871 ) ( not ( = ?auto_214867 ?auto_214868 ) ) ( not ( = ?auto_214867 ?auto_214869 ) ) ( not ( = ?auto_214867 ?auto_214870 ) ) ( not ( = ?auto_214867 ?auto_214871 ) ) ( not ( = ?auto_214867 ?auto_214872 ) ) ( not ( = ?auto_214867 ?auto_214873 ) ) ( not ( = ?auto_214867 ?auto_214874 ) ) ( not ( = ?auto_214867 ?auto_214875 ) ) ( not ( = ?auto_214867 ?auto_214876 ) ) ( not ( = ?auto_214867 ?auto_214877 ) ) ( not ( = ?auto_214867 ?auto_214878 ) ) ( not ( = ?auto_214867 ?auto_214879 ) ) ( not ( = ?auto_214868 ?auto_214869 ) ) ( not ( = ?auto_214868 ?auto_214870 ) ) ( not ( = ?auto_214868 ?auto_214871 ) ) ( not ( = ?auto_214868 ?auto_214872 ) ) ( not ( = ?auto_214868 ?auto_214873 ) ) ( not ( = ?auto_214868 ?auto_214874 ) ) ( not ( = ?auto_214868 ?auto_214875 ) ) ( not ( = ?auto_214868 ?auto_214876 ) ) ( not ( = ?auto_214868 ?auto_214877 ) ) ( not ( = ?auto_214868 ?auto_214878 ) ) ( not ( = ?auto_214868 ?auto_214879 ) ) ( not ( = ?auto_214869 ?auto_214870 ) ) ( not ( = ?auto_214869 ?auto_214871 ) ) ( not ( = ?auto_214869 ?auto_214872 ) ) ( not ( = ?auto_214869 ?auto_214873 ) ) ( not ( = ?auto_214869 ?auto_214874 ) ) ( not ( = ?auto_214869 ?auto_214875 ) ) ( not ( = ?auto_214869 ?auto_214876 ) ) ( not ( = ?auto_214869 ?auto_214877 ) ) ( not ( = ?auto_214869 ?auto_214878 ) ) ( not ( = ?auto_214869 ?auto_214879 ) ) ( not ( = ?auto_214870 ?auto_214871 ) ) ( not ( = ?auto_214870 ?auto_214872 ) ) ( not ( = ?auto_214870 ?auto_214873 ) ) ( not ( = ?auto_214870 ?auto_214874 ) ) ( not ( = ?auto_214870 ?auto_214875 ) ) ( not ( = ?auto_214870 ?auto_214876 ) ) ( not ( = ?auto_214870 ?auto_214877 ) ) ( not ( = ?auto_214870 ?auto_214878 ) ) ( not ( = ?auto_214870 ?auto_214879 ) ) ( not ( = ?auto_214871 ?auto_214872 ) ) ( not ( = ?auto_214871 ?auto_214873 ) ) ( not ( = ?auto_214871 ?auto_214874 ) ) ( not ( = ?auto_214871 ?auto_214875 ) ) ( not ( = ?auto_214871 ?auto_214876 ) ) ( not ( = ?auto_214871 ?auto_214877 ) ) ( not ( = ?auto_214871 ?auto_214878 ) ) ( not ( = ?auto_214871 ?auto_214879 ) ) ( not ( = ?auto_214872 ?auto_214873 ) ) ( not ( = ?auto_214872 ?auto_214874 ) ) ( not ( = ?auto_214872 ?auto_214875 ) ) ( not ( = ?auto_214872 ?auto_214876 ) ) ( not ( = ?auto_214872 ?auto_214877 ) ) ( not ( = ?auto_214872 ?auto_214878 ) ) ( not ( = ?auto_214872 ?auto_214879 ) ) ( not ( = ?auto_214873 ?auto_214874 ) ) ( not ( = ?auto_214873 ?auto_214875 ) ) ( not ( = ?auto_214873 ?auto_214876 ) ) ( not ( = ?auto_214873 ?auto_214877 ) ) ( not ( = ?auto_214873 ?auto_214878 ) ) ( not ( = ?auto_214873 ?auto_214879 ) ) ( not ( = ?auto_214874 ?auto_214875 ) ) ( not ( = ?auto_214874 ?auto_214876 ) ) ( not ( = ?auto_214874 ?auto_214877 ) ) ( not ( = ?auto_214874 ?auto_214878 ) ) ( not ( = ?auto_214874 ?auto_214879 ) ) ( not ( = ?auto_214875 ?auto_214876 ) ) ( not ( = ?auto_214875 ?auto_214877 ) ) ( not ( = ?auto_214875 ?auto_214878 ) ) ( not ( = ?auto_214875 ?auto_214879 ) ) ( not ( = ?auto_214876 ?auto_214877 ) ) ( not ( = ?auto_214876 ?auto_214878 ) ) ( not ( = ?auto_214876 ?auto_214879 ) ) ( not ( = ?auto_214877 ?auto_214878 ) ) ( not ( = ?auto_214877 ?auto_214879 ) ) ( not ( = ?auto_214878 ?auto_214879 ) ) ( ON ?auto_214877 ?auto_214878 ) ( ON ?auto_214876 ?auto_214877 ) ( ON ?auto_214875 ?auto_214876 ) ( ON ?auto_214874 ?auto_214875 ) ( CLEAR ?auto_214872 ) ( ON ?auto_214873 ?auto_214874 ) ( CLEAR ?auto_214873 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_214867 ?auto_214868 ?auto_214869 ?auto_214870 ?auto_214871 ?auto_214872 ?auto_214873 )
      ( MAKE-12PILE ?auto_214867 ?auto_214868 ?auto_214869 ?auto_214870 ?auto_214871 ?auto_214872 ?auto_214873 ?auto_214874 ?auto_214875 ?auto_214876 ?auto_214877 ?auto_214878 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_214892 - BLOCK
      ?auto_214893 - BLOCK
      ?auto_214894 - BLOCK
      ?auto_214895 - BLOCK
      ?auto_214896 - BLOCK
      ?auto_214897 - BLOCK
      ?auto_214898 - BLOCK
      ?auto_214899 - BLOCK
      ?auto_214900 - BLOCK
      ?auto_214901 - BLOCK
      ?auto_214902 - BLOCK
      ?auto_214903 - BLOCK
    )
    :vars
    (
      ?auto_214904 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_214903 ?auto_214904 ) ( ON-TABLE ?auto_214892 ) ( ON ?auto_214893 ?auto_214892 ) ( ON ?auto_214894 ?auto_214893 ) ( ON ?auto_214895 ?auto_214894 ) ( ON ?auto_214896 ?auto_214895 ) ( not ( = ?auto_214892 ?auto_214893 ) ) ( not ( = ?auto_214892 ?auto_214894 ) ) ( not ( = ?auto_214892 ?auto_214895 ) ) ( not ( = ?auto_214892 ?auto_214896 ) ) ( not ( = ?auto_214892 ?auto_214897 ) ) ( not ( = ?auto_214892 ?auto_214898 ) ) ( not ( = ?auto_214892 ?auto_214899 ) ) ( not ( = ?auto_214892 ?auto_214900 ) ) ( not ( = ?auto_214892 ?auto_214901 ) ) ( not ( = ?auto_214892 ?auto_214902 ) ) ( not ( = ?auto_214892 ?auto_214903 ) ) ( not ( = ?auto_214892 ?auto_214904 ) ) ( not ( = ?auto_214893 ?auto_214894 ) ) ( not ( = ?auto_214893 ?auto_214895 ) ) ( not ( = ?auto_214893 ?auto_214896 ) ) ( not ( = ?auto_214893 ?auto_214897 ) ) ( not ( = ?auto_214893 ?auto_214898 ) ) ( not ( = ?auto_214893 ?auto_214899 ) ) ( not ( = ?auto_214893 ?auto_214900 ) ) ( not ( = ?auto_214893 ?auto_214901 ) ) ( not ( = ?auto_214893 ?auto_214902 ) ) ( not ( = ?auto_214893 ?auto_214903 ) ) ( not ( = ?auto_214893 ?auto_214904 ) ) ( not ( = ?auto_214894 ?auto_214895 ) ) ( not ( = ?auto_214894 ?auto_214896 ) ) ( not ( = ?auto_214894 ?auto_214897 ) ) ( not ( = ?auto_214894 ?auto_214898 ) ) ( not ( = ?auto_214894 ?auto_214899 ) ) ( not ( = ?auto_214894 ?auto_214900 ) ) ( not ( = ?auto_214894 ?auto_214901 ) ) ( not ( = ?auto_214894 ?auto_214902 ) ) ( not ( = ?auto_214894 ?auto_214903 ) ) ( not ( = ?auto_214894 ?auto_214904 ) ) ( not ( = ?auto_214895 ?auto_214896 ) ) ( not ( = ?auto_214895 ?auto_214897 ) ) ( not ( = ?auto_214895 ?auto_214898 ) ) ( not ( = ?auto_214895 ?auto_214899 ) ) ( not ( = ?auto_214895 ?auto_214900 ) ) ( not ( = ?auto_214895 ?auto_214901 ) ) ( not ( = ?auto_214895 ?auto_214902 ) ) ( not ( = ?auto_214895 ?auto_214903 ) ) ( not ( = ?auto_214895 ?auto_214904 ) ) ( not ( = ?auto_214896 ?auto_214897 ) ) ( not ( = ?auto_214896 ?auto_214898 ) ) ( not ( = ?auto_214896 ?auto_214899 ) ) ( not ( = ?auto_214896 ?auto_214900 ) ) ( not ( = ?auto_214896 ?auto_214901 ) ) ( not ( = ?auto_214896 ?auto_214902 ) ) ( not ( = ?auto_214896 ?auto_214903 ) ) ( not ( = ?auto_214896 ?auto_214904 ) ) ( not ( = ?auto_214897 ?auto_214898 ) ) ( not ( = ?auto_214897 ?auto_214899 ) ) ( not ( = ?auto_214897 ?auto_214900 ) ) ( not ( = ?auto_214897 ?auto_214901 ) ) ( not ( = ?auto_214897 ?auto_214902 ) ) ( not ( = ?auto_214897 ?auto_214903 ) ) ( not ( = ?auto_214897 ?auto_214904 ) ) ( not ( = ?auto_214898 ?auto_214899 ) ) ( not ( = ?auto_214898 ?auto_214900 ) ) ( not ( = ?auto_214898 ?auto_214901 ) ) ( not ( = ?auto_214898 ?auto_214902 ) ) ( not ( = ?auto_214898 ?auto_214903 ) ) ( not ( = ?auto_214898 ?auto_214904 ) ) ( not ( = ?auto_214899 ?auto_214900 ) ) ( not ( = ?auto_214899 ?auto_214901 ) ) ( not ( = ?auto_214899 ?auto_214902 ) ) ( not ( = ?auto_214899 ?auto_214903 ) ) ( not ( = ?auto_214899 ?auto_214904 ) ) ( not ( = ?auto_214900 ?auto_214901 ) ) ( not ( = ?auto_214900 ?auto_214902 ) ) ( not ( = ?auto_214900 ?auto_214903 ) ) ( not ( = ?auto_214900 ?auto_214904 ) ) ( not ( = ?auto_214901 ?auto_214902 ) ) ( not ( = ?auto_214901 ?auto_214903 ) ) ( not ( = ?auto_214901 ?auto_214904 ) ) ( not ( = ?auto_214902 ?auto_214903 ) ) ( not ( = ?auto_214902 ?auto_214904 ) ) ( not ( = ?auto_214903 ?auto_214904 ) ) ( ON ?auto_214902 ?auto_214903 ) ( ON ?auto_214901 ?auto_214902 ) ( ON ?auto_214900 ?auto_214901 ) ( ON ?auto_214899 ?auto_214900 ) ( ON ?auto_214898 ?auto_214899 ) ( CLEAR ?auto_214896 ) ( ON ?auto_214897 ?auto_214898 ) ( CLEAR ?auto_214897 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_214892 ?auto_214893 ?auto_214894 ?auto_214895 ?auto_214896 ?auto_214897 )
      ( MAKE-12PILE ?auto_214892 ?auto_214893 ?auto_214894 ?auto_214895 ?auto_214896 ?auto_214897 ?auto_214898 ?auto_214899 ?auto_214900 ?auto_214901 ?auto_214902 ?auto_214903 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_214917 - BLOCK
      ?auto_214918 - BLOCK
      ?auto_214919 - BLOCK
      ?auto_214920 - BLOCK
      ?auto_214921 - BLOCK
      ?auto_214922 - BLOCK
      ?auto_214923 - BLOCK
      ?auto_214924 - BLOCK
      ?auto_214925 - BLOCK
      ?auto_214926 - BLOCK
      ?auto_214927 - BLOCK
      ?auto_214928 - BLOCK
    )
    :vars
    (
      ?auto_214929 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_214928 ?auto_214929 ) ( ON-TABLE ?auto_214917 ) ( ON ?auto_214918 ?auto_214917 ) ( ON ?auto_214919 ?auto_214918 ) ( ON ?auto_214920 ?auto_214919 ) ( ON ?auto_214921 ?auto_214920 ) ( not ( = ?auto_214917 ?auto_214918 ) ) ( not ( = ?auto_214917 ?auto_214919 ) ) ( not ( = ?auto_214917 ?auto_214920 ) ) ( not ( = ?auto_214917 ?auto_214921 ) ) ( not ( = ?auto_214917 ?auto_214922 ) ) ( not ( = ?auto_214917 ?auto_214923 ) ) ( not ( = ?auto_214917 ?auto_214924 ) ) ( not ( = ?auto_214917 ?auto_214925 ) ) ( not ( = ?auto_214917 ?auto_214926 ) ) ( not ( = ?auto_214917 ?auto_214927 ) ) ( not ( = ?auto_214917 ?auto_214928 ) ) ( not ( = ?auto_214917 ?auto_214929 ) ) ( not ( = ?auto_214918 ?auto_214919 ) ) ( not ( = ?auto_214918 ?auto_214920 ) ) ( not ( = ?auto_214918 ?auto_214921 ) ) ( not ( = ?auto_214918 ?auto_214922 ) ) ( not ( = ?auto_214918 ?auto_214923 ) ) ( not ( = ?auto_214918 ?auto_214924 ) ) ( not ( = ?auto_214918 ?auto_214925 ) ) ( not ( = ?auto_214918 ?auto_214926 ) ) ( not ( = ?auto_214918 ?auto_214927 ) ) ( not ( = ?auto_214918 ?auto_214928 ) ) ( not ( = ?auto_214918 ?auto_214929 ) ) ( not ( = ?auto_214919 ?auto_214920 ) ) ( not ( = ?auto_214919 ?auto_214921 ) ) ( not ( = ?auto_214919 ?auto_214922 ) ) ( not ( = ?auto_214919 ?auto_214923 ) ) ( not ( = ?auto_214919 ?auto_214924 ) ) ( not ( = ?auto_214919 ?auto_214925 ) ) ( not ( = ?auto_214919 ?auto_214926 ) ) ( not ( = ?auto_214919 ?auto_214927 ) ) ( not ( = ?auto_214919 ?auto_214928 ) ) ( not ( = ?auto_214919 ?auto_214929 ) ) ( not ( = ?auto_214920 ?auto_214921 ) ) ( not ( = ?auto_214920 ?auto_214922 ) ) ( not ( = ?auto_214920 ?auto_214923 ) ) ( not ( = ?auto_214920 ?auto_214924 ) ) ( not ( = ?auto_214920 ?auto_214925 ) ) ( not ( = ?auto_214920 ?auto_214926 ) ) ( not ( = ?auto_214920 ?auto_214927 ) ) ( not ( = ?auto_214920 ?auto_214928 ) ) ( not ( = ?auto_214920 ?auto_214929 ) ) ( not ( = ?auto_214921 ?auto_214922 ) ) ( not ( = ?auto_214921 ?auto_214923 ) ) ( not ( = ?auto_214921 ?auto_214924 ) ) ( not ( = ?auto_214921 ?auto_214925 ) ) ( not ( = ?auto_214921 ?auto_214926 ) ) ( not ( = ?auto_214921 ?auto_214927 ) ) ( not ( = ?auto_214921 ?auto_214928 ) ) ( not ( = ?auto_214921 ?auto_214929 ) ) ( not ( = ?auto_214922 ?auto_214923 ) ) ( not ( = ?auto_214922 ?auto_214924 ) ) ( not ( = ?auto_214922 ?auto_214925 ) ) ( not ( = ?auto_214922 ?auto_214926 ) ) ( not ( = ?auto_214922 ?auto_214927 ) ) ( not ( = ?auto_214922 ?auto_214928 ) ) ( not ( = ?auto_214922 ?auto_214929 ) ) ( not ( = ?auto_214923 ?auto_214924 ) ) ( not ( = ?auto_214923 ?auto_214925 ) ) ( not ( = ?auto_214923 ?auto_214926 ) ) ( not ( = ?auto_214923 ?auto_214927 ) ) ( not ( = ?auto_214923 ?auto_214928 ) ) ( not ( = ?auto_214923 ?auto_214929 ) ) ( not ( = ?auto_214924 ?auto_214925 ) ) ( not ( = ?auto_214924 ?auto_214926 ) ) ( not ( = ?auto_214924 ?auto_214927 ) ) ( not ( = ?auto_214924 ?auto_214928 ) ) ( not ( = ?auto_214924 ?auto_214929 ) ) ( not ( = ?auto_214925 ?auto_214926 ) ) ( not ( = ?auto_214925 ?auto_214927 ) ) ( not ( = ?auto_214925 ?auto_214928 ) ) ( not ( = ?auto_214925 ?auto_214929 ) ) ( not ( = ?auto_214926 ?auto_214927 ) ) ( not ( = ?auto_214926 ?auto_214928 ) ) ( not ( = ?auto_214926 ?auto_214929 ) ) ( not ( = ?auto_214927 ?auto_214928 ) ) ( not ( = ?auto_214927 ?auto_214929 ) ) ( not ( = ?auto_214928 ?auto_214929 ) ) ( ON ?auto_214927 ?auto_214928 ) ( ON ?auto_214926 ?auto_214927 ) ( ON ?auto_214925 ?auto_214926 ) ( ON ?auto_214924 ?auto_214925 ) ( ON ?auto_214923 ?auto_214924 ) ( CLEAR ?auto_214921 ) ( ON ?auto_214922 ?auto_214923 ) ( CLEAR ?auto_214922 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_214917 ?auto_214918 ?auto_214919 ?auto_214920 ?auto_214921 ?auto_214922 )
      ( MAKE-12PILE ?auto_214917 ?auto_214918 ?auto_214919 ?auto_214920 ?auto_214921 ?auto_214922 ?auto_214923 ?auto_214924 ?auto_214925 ?auto_214926 ?auto_214927 ?auto_214928 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_214942 - BLOCK
      ?auto_214943 - BLOCK
      ?auto_214944 - BLOCK
      ?auto_214945 - BLOCK
      ?auto_214946 - BLOCK
      ?auto_214947 - BLOCK
      ?auto_214948 - BLOCK
      ?auto_214949 - BLOCK
      ?auto_214950 - BLOCK
      ?auto_214951 - BLOCK
      ?auto_214952 - BLOCK
      ?auto_214953 - BLOCK
    )
    :vars
    (
      ?auto_214954 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_214953 ?auto_214954 ) ( ON-TABLE ?auto_214942 ) ( ON ?auto_214943 ?auto_214942 ) ( ON ?auto_214944 ?auto_214943 ) ( ON ?auto_214945 ?auto_214944 ) ( not ( = ?auto_214942 ?auto_214943 ) ) ( not ( = ?auto_214942 ?auto_214944 ) ) ( not ( = ?auto_214942 ?auto_214945 ) ) ( not ( = ?auto_214942 ?auto_214946 ) ) ( not ( = ?auto_214942 ?auto_214947 ) ) ( not ( = ?auto_214942 ?auto_214948 ) ) ( not ( = ?auto_214942 ?auto_214949 ) ) ( not ( = ?auto_214942 ?auto_214950 ) ) ( not ( = ?auto_214942 ?auto_214951 ) ) ( not ( = ?auto_214942 ?auto_214952 ) ) ( not ( = ?auto_214942 ?auto_214953 ) ) ( not ( = ?auto_214942 ?auto_214954 ) ) ( not ( = ?auto_214943 ?auto_214944 ) ) ( not ( = ?auto_214943 ?auto_214945 ) ) ( not ( = ?auto_214943 ?auto_214946 ) ) ( not ( = ?auto_214943 ?auto_214947 ) ) ( not ( = ?auto_214943 ?auto_214948 ) ) ( not ( = ?auto_214943 ?auto_214949 ) ) ( not ( = ?auto_214943 ?auto_214950 ) ) ( not ( = ?auto_214943 ?auto_214951 ) ) ( not ( = ?auto_214943 ?auto_214952 ) ) ( not ( = ?auto_214943 ?auto_214953 ) ) ( not ( = ?auto_214943 ?auto_214954 ) ) ( not ( = ?auto_214944 ?auto_214945 ) ) ( not ( = ?auto_214944 ?auto_214946 ) ) ( not ( = ?auto_214944 ?auto_214947 ) ) ( not ( = ?auto_214944 ?auto_214948 ) ) ( not ( = ?auto_214944 ?auto_214949 ) ) ( not ( = ?auto_214944 ?auto_214950 ) ) ( not ( = ?auto_214944 ?auto_214951 ) ) ( not ( = ?auto_214944 ?auto_214952 ) ) ( not ( = ?auto_214944 ?auto_214953 ) ) ( not ( = ?auto_214944 ?auto_214954 ) ) ( not ( = ?auto_214945 ?auto_214946 ) ) ( not ( = ?auto_214945 ?auto_214947 ) ) ( not ( = ?auto_214945 ?auto_214948 ) ) ( not ( = ?auto_214945 ?auto_214949 ) ) ( not ( = ?auto_214945 ?auto_214950 ) ) ( not ( = ?auto_214945 ?auto_214951 ) ) ( not ( = ?auto_214945 ?auto_214952 ) ) ( not ( = ?auto_214945 ?auto_214953 ) ) ( not ( = ?auto_214945 ?auto_214954 ) ) ( not ( = ?auto_214946 ?auto_214947 ) ) ( not ( = ?auto_214946 ?auto_214948 ) ) ( not ( = ?auto_214946 ?auto_214949 ) ) ( not ( = ?auto_214946 ?auto_214950 ) ) ( not ( = ?auto_214946 ?auto_214951 ) ) ( not ( = ?auto_214946 ?auto_214952 ) ) ( not ( = ?auto_214946 ?auto_214953 ) ) ( not ( = ?auto_214946 ?auto_214954 ) ) ( not ( = ?auto_214947 ?auto_214948 ) ) ( not ( = ?auto_214947 ?auto_214949 ) ) ( not ( = ?auto_214947 ?auto_214950 ) ) ( not ( = ?auto_214947 ?auto_214951 ) ) ( not ( = ?auto_214947 ?auto_214952 ) ) ( not ( = ?auto_214947 ?auto_214953 ) ) ( not ( = ?auto_214947 ?auto_214954 ) ) ( not ( = ?auto_214948 ?auto_214949 ) ) ( not ( = ?auto_214948 ?auto_214950 ) ) ( not ( = ?auto_214948 ?auto_214951 ) ) ( not ( = ?auto_214948 ?auto_214952 ) ) ( not ( = ?auto_214948 ?auto_214953 ) ) ( not ( = ?auto_214948 ?auto_214954 ) ) ( not ( = ?auto_214949 ?auto_214950 ) ) ( not ( = ?auto_214949 ?auto_214951 ) ) ( not ( = ?auto_214949 ?auto_214952 ) ) ( not ( = ?auto_214949 ?auto_214953 ) ) ( not ( = ?auto_214949 ?auto_214954 ) ) ( not ( = ?auto_214950 ?auto_214951 ) ) ( not ( = ?auto_214950 ?auto_214952 ) ) ( not ( = ?auto_214950 ?auto_214953 ) ) ( not ( = ?auto_214950 ?auto_214954 ) ) ( not ( = ?auto_214951 ?auto_214952 ) ) ( not ( = ?auto_214951 ?auto_214953 ) ) ( not ( = ?auto_214951 ?auto_214954 ) ) ( not ( = ?auto_214952 ?auto_214953 ) ) ( not ( = ?auto_214952 ?auto_214954 ) ) ( not ( = ?auto_214953 ?auto_214954 ) ) ( ON ?auto_214952 ?auto_214953 ) ( ON ?auto_214951 ?auto_214952 ) ( ON ?auto_214950 ?auto_214951 ) ( ON ?auto_214949 ?auto_214950 ) ( ON ?auto_214948 ?auto_214949 ) ( ON ?auto_214947 ?auto_214948 ) ( CLEAR ?auto_214945 ) ( ON ?auto_214946 ?auto_214947 ) ( CLEAR ?auto_214946 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_214942 ?auto_214943 ?auto_214944 ?auto_214945 ?auto_214946 )
      ( MAKE-12PILE ?auto_214942 ?auto_214943 ?auto_214944 ?auto_214945 ?auto_214946 ?auto_214947 ?auto_214948 ?auto_214949 ?auto_214950 ?auto_214951 ?auto_214952 ?auto_214953 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_214967 - BLOCK
      ?auto_214968 - BLOCK
      ?auto_214969 - BLOCK
      ?auto_214970 - BLOCK
      ?auto_214971 - BLOCK
      ?auto_214972 - BLOCK
      ?auto_214973 - BLOCK
      ?auto_214974 - BLOCK
      ?auto_214975 - BLOCK
      ?auto_214976 - BLOCK
      ?auto_214977 - BLOCK
      ?auto_214978 - BLOCK
    )
    :vars
    (
      ?auto_214979 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_214978 ?auto_214979 ) ( ON-TABLE ?auto_214967 ) ( ON ?auto_214968 ?auto_214967 ) ( ON ?auto_214969 ?auto_214968 ) ( ON ?auto_214970 ?auto_214969 ) ( not ( = ?auto_214967 ?auto_214968 ) ) ( not ( = ?auto_214967 ?auto_214969 ) ) ( not ( = ?auto_214967 ?auto_214970 ) ) ( not ( = ?auto_214967 ?auto_214971 ) ) ( not ( = ?auto_214967 ?auto_214972 ) ) ( not ( = ?auto_214967 ?auto_214973 ) ) ( not ( = ?auto_214967 ?auto_214974 ) ) ( not ( = ?auto_214967 ?auto_214975 ) ) ( not ( = ?auto_214967 ?auto_214976 ) ) ( not ( = ?auto_214967 ?auto_214977 ) ) ( not ( = ?auto_214967 ?auto_214978 ) ) ( not ( = ?auto_214967 ?auto_214979 ) ) ( not ( = ?auto_214968 ?auto_214969 ) ) ( not ( = ?auto_214968 ?auto_214970 ) ) ( not ( = ?auto_214968 ?auto_214971 ) ) ( not ( = ?auto_214968 ?auto_214972 ) ) ( not ( = ?auto_214968 ?auto_214973 ) ) ( not ( = ?auto_214968 ?auto_214974 ) ) ( not ( = ?auto_214968 ?auto_214975 ) ) ( not ( = ?auto_214968 ?auto_214976 ) ) ( not ( = ?auto_214968 ?auto_214977 ) ) ( not ( = ?auto_214968 ?auto_214978 ) ) ( not ( = ?auto_214968 ?auto_214979 ) ) ( not ( = ?auto_214969 ?auto_214970 ) ) ( not ( = ?auto_214969 ?auto_214971 ) ) ( not ( = ?auto_214969 ?auto_214972 ) ) ( not ( = ?auto_214969 ?auto_214973 ) ) ( not ( = ?auto_214969 ?auto_214974 ) ) ( not ( = ?auto_214969 ?auto_214975 ) ) ( not ( = ?auto_214969 ?auto_214976 ) ) ( not ( = ?auto_214969 ?auto_214977 ) ) ( not ( = ?auto_214969 ?auto_214978 ) ) ( not ( = ?auto_214969 ?auto_214979 ) ) ( not ( = ?auto_214970 ?auto_214971 ) ) ( not ( = ?auto_214970 ?auto_214972 ) ) ( not ( = ?auto_214970 ?auto_214973 ) ) ( not ( = ?auto_214970 ?auto_214974 ) ) ( not ( = ?auto_214970 ?auto_214975 ) ) ( not ( = ?auto_214970 ?auto_214976 ) ) ( not ( = ?auto_214970 ?auto_214977 ) ) ( not ( = ?auto_214970 ?auto_214978 ) ) ( not ( = ?auto_214970 ?auto_214979 ) ) ( not ( = ?auto_214971 ?auto_214972 ) ) ( not ( = ?auto_214971 ?auto_214973 ) ) ( not ( = ?auto_214971 ?auto_214974 ) ) ( not ( = ?auto_214971 ?auto_214975 ) ) ( not ( = ?auto_214971 ?auto_214976 ) ) ( not ( = ?auto_214971 ?auto_214977 ) ) ( not ( = ?auto_214971 ?auto_214978 ) ) ( not ( = ?auto_214971 ?auto_214979 ) ) ( not ( = ?auto_214972 ?auto_214973 ) ) ( not ( = ?auto_214972 ?auto_214974 ) ) ( not ( = ?auto_214972 ?auto_214975 ) ) ( not ( = ?auto_214972 ?auto_214976 ) ) ( not ( = ?auto_214972 ?auto_214977 ) ) ( not ( = ?auto_214972 ?auto_214978 ) ) ( not ( = ?auto_214972 ?auto_214979 ) ) ( not ( = ?auto_214973 ?auto_214974 ) ) ( not ( = ?auto_214973 ?auto_214975 ) ) ( not ( = ?auto_214973 ?auto_214976 ) ) ( not ( = ?auto_214973 ?auto_214977 ) ) ( not ( = ?auto_214973 ?auto_214978 ) ) ( not ( = ?auto_214973 ?auto_214979 ) ) ( not ( = ?auto_214974 ?auto_214975 ) ) ( not ( = ?auto_214974 ?auto_214976 ) ) ( not ( = ?auto_214974 ?auto_214977 ) ) ( not ( = ?auto_214974 ?auto_214978 ) ) ( not ( = ?auto_214974 ?auto_214979 ) ) ( not ( = ?auto_214975 ?auto_214976 ) ) ( not ( = ?auto_214975 ?auto_214977 ) ) ( not ( = ?auto_214975 ?auto_214978 ) ) ( not ( = ?auto_214975 ?auto_214979 ) ) ( not ( = ?auto_214976 ?auto_214977 ) ) ( not ( = ?auto_214976 ?auto_214978 ) ) ( not ( = ?auto_214976 ?auto_214979 ) ) ( not ( = ?auto_214977 ?auto_214978 ) ) ( not ( = ?auto_214977 ?auto_214979 ) ) ( not ( = ?auto_214978 ?auto_214979 ) ) ( ON ?auto_214977 ?auto_214978 ) ( ON ?auto_214976 ?auto_214977 ) ( ON ?auto_214975 ?auto_214976 ) ( ON ?auto_214974 ?auto_214975 ) ( ON ?auto_214973 ?auto_214974 ) ( ON ?auto_214972 ?auto_214973 ) ( CLEAR ?auto_214970 ) ( ON ?auto_214971 ?auto_214972 ) ( CLEAR ?auto_214971 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_214967 ?auto_214968 ?auto_214969 ?auto_214970 ?auto_214971 )
      ( MAKE-12PILE ?auto_214967 ?auto_214968 ?auto_214969 ?auto_214970 ?auto_214971 ?auto_214972 ?auto_214973 ?auto_214974 ?auto_214975 ?auto_214976 ?auto_214977 ?auto_214978 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_214992 - BLOCK
      ?auto_214993 - BLOCK
      ?auto_214994 - BLOCK
      ?auto_214995 - BLOCK
      ?auto_214996 - BLOCK
      ?auto_214997 - BLOCK
      ?auto_214998 - BLOCK
      ?auto_214999 - BLOCK
      ?auto_215000 - BLOCK
      ?auto_215001 - BLOCK
      ?auto_215002 - BLOCK
      ?auto_215003 - BLOCK
    )
    :vars
    (
      ?auto_215004 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_215003 ?auto_215004 ) ( ON-TABLE ?auto_214992 ) ( ON ?auto_214993 ?auto_214992 ) ( ON ?auto_214994 ?auto_214993 ) ( not ( = ?auto_214992 ?auto_214993 ) ) ( not ( = ?auto_214992 ?auto_214994 ) ) ( not ( = ?auto_214992 ?auto_214995 ) ) ( not ( = ?auto_214992 ?auto_214996 ) ) ( not ( = ?auto_214992 ?auto_214997 ) ) ( not ( = ?auto_214992 ?auto_214998 ) ) ( not ( = ?auto_214992 ?auto_214999 ) ) ( not ( = ?auto_214992 ?auto_215000 ) ) ( not ( = ?auto_214992 ?auto_215001 ) ) ( not ( = ?auto_214992 ?auto_215002 ) ) ( not ( = ?auto_214992 ?auto_215003 ) ) ( not ( = ?auto_214992 ?auto_215004 ) ) ( not ( = ?auto_214993 ?auto_214994 ) ) ( not ( = ?auto_214993 ?auto_214995 ) ) ( not ( = ?auto_214993 ?auto_214996 ) ) ( not ( = ?auto_214993 ?auto_214997 ) ) ( not ( = ?auto_214993 ?auto_214998 ) ) ( not ( = ?auto_214993 ?auto_214999 ) ) ( not ( = ?auto_214993 ?auto_215000 ) ) ( not ( = ?auto_214993 ?auto_215001 ) ) ( not ( = ?auto_214993 ?auto_215002 ) ) ( not ( = ?auto_214993 ?auto_215003 ) ) ( not ( = ?auto_214993 ?auto_215004 ) ) ( not ( = ?auto_214994 ?auto_214995 ) ) ( not ( = ?auto_214994 ?auto_214996 ) ) ( not ( = ?auto_214994 ?auto_214997 ) ) ( not ( = ?auto_214994 ?auto_214998 ) ) ( not ( = ?auto_214994 ?auto_214999 ) ) ( not ( = ?auto_214994 ?auto_215000 ) ) ( not ( = ?auto_214994 ?auto_215001 ) ) ( not ( = ?auto_214994 ?auto_215002 ) ) ( not ( = ?auto_214994 ?auto_215003 ) ) ( not ( = ?auto_214994 ?auto_215004 ) ) ( not ( = ?auto_214995 ?auto_214996 ) ) ( not ( = ?auto_214995 ?auto_214997 ) ) ( not ( = ?auto_214995 ?auto_214998 ) ) ( not ( = ?auto_214995 ?auto_214999 ) ) ( not ( = ?auto_214995 ?auto_215000 ) ) ( not ( = ?auto_214995 ?auto_215001 ) ) ( not ( = ?auto_214995 ?auto_215002 ) ) ( not ( = ?auto_214995 ?auto_215003 ) ) ( not ( = ?auto_214995 ?auto_215004 ) ) ( not ( = ?auto_214996 ?auto_214997 ) ) ( not ( = ?auto_214996 ?auto_214998 ) ) ( not ( = ?auto_214996 ?auto_214999 ) ) ( not ( = ?auto_214996 ?auto_215000 ) ) ( not ( = ?auto_214996 ?auto_215001 ) ) ( not ( = ?auto_214996 ?auto_215002 ) ) ( not ( = ?auto_214996 ?auto_215003 ) ) ( not ( = ?auto_214996 ?auto_215004 ) ) ( not ( = ?auto_214997 ?auto_214998 ) ) ( not ( = ?auto_214997 ?auto_214999 ) ) ( not ( = ?auto_214997 ?auto_215000 ) ) ( not ( = ?auto_214997 ?auto_215001 ) ) ( not ( = ?auto_214997 ?auto_215002 ) ) ( not ( = ?auto_214997 ?auto_215003 ) ) ( not ( = ?auto_214997 ?auto_215004 ) ) ( not ( = ?auto_214998 ?auto_214999 ) ) ( not ( = ?auto_214998 ?auto_215000 ) ) ( not ( = ?auto_214998 ?auto_215001 ) ) ( not ( = ?auto_214998 ?auto_215002 ) ) ( not ( = ?auto_214998 ?auto_215003 ) ) ( not ( = ?auto_214998 ?auto_215004 ) ) ( not ( = ?auto_214999 ?auto_215000 ) ) ( not ( = ?auto_214999 ?auto_215001 ) ) ( not ( = ?auto_214999 ?auto_215002 ) ) ( not ( = ?auto_214999 ?auto_215003 ) ) ( not ( = ?auto_214999 ?auto_215004 ) ) ( not ( = ?auto_215000 ?auto_215001 ) ) ( not ( = ?auto_215000 ?auto_215002 ) ) ( not ( = ?auto_215000 ?auto_215003 ) ) ( not ( = ?auto_215000 ?auto_215004 ) ) ( not ( = ?auto_215001 ?auto_215002 ) ) ( not ( = ?auto_215001 ?auto_215003 ) ) ( not ( = ?auto_215001 ?auto_215004 ) ) ( not ( = ?auto_215002 ?auto_215003 ) ) ( not ( = ?auto_215002 ?auto_215004 ) ) ( not ( = ?auto_215003 ?auto_215004 ) ) ( ON ?auto_215002 ?auto_215003 ) ( ON ?auto_215001 ?auto_215002 ) ( ON ?auto_215000 ?auto_215001 ) ( ON ?auto_214999 ?auto_215000 ) ( ON ?auto_214998 ?auto_214999 ) ( ON ?auto_214997 ?auto_214998 ) ( ON ?auto_214996 ?auto_214997 ) ( CLEAR ?auto_214994 ) ( ON ?auto_214995 ?auto_214996 ) ( CLEAR ?auto_214995 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_214992 ?auto_214993 ?auto_214994 ?auto_214995 )
      ( MAKE-12PILE ?auto_214992 ?auto_214993 ?auto_214994 ?auto_214995 ?auto_214996 ?auto_214997 ?auto_214998 ?auto_214999 ?auto_215000 ?auto_215001 ?auto_215002 ?auto_215003 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_215017 - BLOCK
      ?auto_215018 - BLOCK
      ?auto_215019 - BLOCK
      ?auto_215020 - BLOCK
      ?auto_215021 - BLOCK
      ?auto_215022 - BLOCK
      ?auto_215023 - BLOCK
      ?auto_215024 - BLOCK
      ?auto_215025 - BLOCK
      ?auto_215026 - BLOCK
      ?auto_215027 - BLOCK
      ?auto_215028 - BLOCK
    )
    :vars
    (
      ?auto_215029 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_215028 ?auto_215029 ) ( ON-TABLE ?auto_215017 ) ( ON ?auto_215018 ?auto_215017 ) ( ON ?auto_215019 ?auto_215018 ) ( not ( = ?auto_215017 ?auto_215018 ) ) ( not ( = ?auto_215017 ?auto_215019 ) ) ( not ( = ?auto_215017 ?auto_215020 ) ) ( not ( = ?auto_215017 ?auto_215021 ) ) ( not ( = ?auto_215017 ?auto_215022 ) ) ( not ( = ?auto_215017 ?auto_215023 ) ) ( not ( = ?auto_215017 ?auto_215024 ) ) ( not ( = ?auto_215017 ?auto_215025 ) ) ( not ( = ?auto_215017 ?auto_215026 ) ) ( not ( = ?auto_215017 ?auto_215027 ) ) ( not ( = ?auto_215017 ?auto_215028 ) ) ( not ( = ?auto_215017 ?auto_215029 ) ) ( not ( = ?auto_215018 ?auto_215019 ) ) ( not ( = ?auto_215018 ?auto_215020 ) ) ( not ( = ?auto_215018 ?auto_215021 ) ) ( not ( = ?auto_215018 ?auto_215022 ) ) ( not ( = ?auto_215018 ?auto_215023 ) ) ( not ( = ?auto_215018 ?auto_215024 ) ) ( not ( = ?auto_215018 ?auto_215025 ) ) ( not ( = ?auto_215018 ?auto_215026 ) ) ( not ( = ?auto_215018 ?auto_215027 ) ) ( not ( = ?auto_215018 ?auto_215028 ) ) ( not ( = ?auto_215018 ?auto_215029 ) ) ( not ( = ?auto_215019 ?auto_215020 ) ) ( not ( = ?auto_215019 ?auto_215021 ) ) ( not ( = ?auto_215019 ?auto_215022 ) ) ( not ( = ?auto_215019 ?auto_215023 ) ) ( not ( = ?auto_215019 ?auto_215024 ) ) ( not ( = ?auto_215019 ?auto_215025 ) ) ( not ( = ?auto_215019 ?auto_215026 ) ) ( not ( = ?auto_215019 ?auto_215027 ) ) ( not ( = ?auto_215019 ?auto_215028 ) ) ( not ( = ?auto_215019 ?auto_215029 ) ) ( not ( = ?auto_215020 ?auto_215021 ) ) ( not ( = ?auto_215020 ?auto_215022 ) ) ( not ( = ?auto_215020 ?auto_215023 ) ) ( not ( = ?auto_215020 ?auto_215024 ) ) ( not ( = ?auto_215020 ?auto_215025 ) ) ( not ( = ?auto_215020 ?auto_215026 ) ) ( not ( = ?auto_215020 ?auto_215027 ) ) ( not ( = ?auto_215020 ?auto_215028 ) ) ( not ( = ?auto_215020 ?auto_215029 ) ) ( not ( = ?auto_215021 ?auto_215022 ) ) ( not ( = ?auto_215021 ?auto_215023 ) ) ( not ( = ?auto_215021 ?auto_215024 ) ) ( not ( = ?auto_215021 ?auto_215025 ) ) ( not ( = ?auto_215021 ?auto_215026 ) ) ( not ( = ?auto_215021 ?auto_215027 ) ) ( not ( = ?auto_215021 ?auto_215028 ) ) ( not ( = ?auto_215021 ?auto_215029 ) ) ( not ( = ?auto_215022 ?auto_215023 ) ) ( not ( = ?auto_215022 ?auto_215024 ) ) ( not ( = ?auto_215022 ?auto_215025 ) ) ( not ( = ?auto_215022 ?auto_215026 ) ) ( not ( = ?auto_215022 ?auto_215027 ) ) ( not ( = ?auto_215022 ?auto_215028 ) ) ( not ( = ?auto_215022 ?auto_215029 ) ) ( not ( = ?auto_215023 ?auto_215024 ) ) ( not ( = ?auto_215023 ?auto_215025 ) ) ( not ( = ?auto_215023 ?auto_215026 ) ) ( not ( = ?auto_215023 ?auto_215027 ) ) ( not ( = ?auto_215023 ?auto_215028 ) ) ( not ( = ?auto_215023 ?auto_215029 ) ) ( not ( = ?auto_215024 ?auto_215025 ) ) ( not ( = ?auto_215024 ?auto_215026 ) ) ( not ( = ?auto_215024 ?auto_215027 ) ) ( not ( = ?auto_215024 ?auto_215028 ) ) ( not ( = ?auto_215024 ?auto_215029 ) ) ( not ( = ?auto_215025 ?auto_215026 ) ) ( not ( = ?auto_215025 ?auto_215027 ) ) ( not ( = ?auto_215025 ?auto_215028 ) ) ( not ( = ?auto_215025 ?auto_215029 ) ) ( not ( = ?auto_215026 ?auto_215027 ) ) ( not ( = ?auto_215026 ?auto_215028 ) ) ( not ( = ?auto_215026 ?auto_215029 ) ) ( not ( = ?auto_215027 ?auto_215028 ) ) ( not ( = ?auto_215027 ?auto_215029 ) ) ( not ( = ?auto_215028 ?auto_215029 ) ) ( ON ?auto_215027 ?auto_215028 ) ( ON ?auto_215026 ?auto_215027 ) ( ON ?auto_215025 ?auto_215026 ) ( ON ?auto_215024 ?auto_215025 ) ( ON ?auto_215023 ?auto_215024 ) ( ON ?auto_215022 ?auto_215023 ) ( ON ?auto_215021 ?auto_215022 ) ( CLEAR ?auto_215019 ) ( ON ?auto_215020 ?auto_215021 ) ( CLEAR ?auto_215020 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_215017 ?auto_215018 ?auto_215019 ?auto_215020 )
      ( MAKE-12PILE ?auto_215017 ?auto_215018 ?auto_215019 ?auto_215020 ?auto_215021 ?auto_215022 ?auto_215023 ?auto_215024 ?auto_215025 ?auto_215026 ?auto_215027 ?auto_215028 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_215042 - BLOCK
      ?auto_215043 - BLOCK
      ?auto_215044 - BLOCK
      ?auto_215045 - BLOCK
      ?auto_215046 - BLOCK
      ?auto_215047 - BLOCK
      ?auto_215048 - BLOCK
      ?auto_215049 - BLOCK
      ?auto_215050 - BLOCK
      ?auto_215051 - BLOCK
      ?auto_215052 - BLOCK
      ?auto_215053 - BLOCK
    )
    :vars
    (
      ?auto_215054 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_215053 ?auto_215054 ) ( ON-TABLE ?auto_215042 ) ( ON ?auto_215043 ?auto_215042 ) ( not ( = ?auto_215042 ?auto_215043 ) ) ( not ( = ?auto_215042 ?auto_215044 ) ) ( not ( = ?auto_215042 ?auto_215045 ) ) ( not ( = ?auto_215042 ?auto_215046 ) ) ( not ( = ?auto_215042 ?auto_215047 ) ) ( not ( = ?auto_215042 ?auto_215048 ) ) ( not ( = ?auto_215042 ?auto_215049 ) ) ( not ( = ?auto_215042 ?auto_215050 ) ) ( not ( = ?auto_215042 ?auto_215051 ) ) ( not ( = ?auto_215042 ?auto_215052 ) ) ( not ( = ?auto_215042 ?auto_215053 ) ) ( not ( = ?auto_215042 ?auto_215054 ) ) ( not ( = ?auto_215043 ?auto_215044 ) ) ( not ( = ?auto_215043 ?auto_215045 ) ) ( not ( = ?auto_215043 ?auto_215046 ) ) ( not ( = ?auto_215043 ?auto_215047 ) ) ( not ( = ?auto_215043 ?auto_215048 ) ) ( not ( = ?auto_215043 ?auto_215049 ) ) ( not ( = ?auto_215043 ?auto_215050 ) ) ( not ( = ?auto_215043 ?auto_215051 ) ) ( not ( = ?auto_215043 ?auto_215052 ) ) ( not ( = ?auto_215043 ?auto_215053 ) ) ( not ( = ?auto_215043 ?auto_215054 ) ) ( not ( = ?auto_215044 ?auto_215045 ) ) ( not ( = ?auto_215044 ?auto_215046 ) ) ( not ( = ?auto_215044 ?auto_215047 ) ) ( not ( = ?auto_215044 ?auto_215048 ) ) ( not ( = ?auto_215044 ?auto_215049 ) ) ( not ( = ?auto_215044 ?auto_215050 ) ) ( not ( = ?auto_215044 ?auto_215051 ) ) ( not ( = ?auto_215044 ?auto_215052 ) ) ( not ( = ?auto_215044 ?auto_215053 ) ) ( not ( = ?auto_215044 ?auto_215054 ) ) ( not ( = ?auto_215045 ?auto_215046 ) ) ( not ( = ?auto_215045 ?auto_215047 ) ) ( not ( = ?auto_215045 ?auto_215048 ) ) ( not ( = ?auto_215045 ?auto_215049 ) ) ( not ( = ?auto_215045 ?auto_215050 ) ) ( not ( = ?auto_215045 ?auto_215051 ) ) ( not ( = ?auto_215045 ?auto_215052 ) ) ( not ( = ?auto_215045 ?auto_215053 ) ) ( not ( = ?auto_215045 ?auto_215054 ) ) ( not ( = ?auto_215046 ?auto_215047 ) ) ( not ( = ?auto_215046 ?auto_215048 ) ) ( not ( = ?auto_215046 ?auto_215049 ) ) ( not ( = ?auto_215046 ?auto_215050 ) ) ( not ( = ?auto_215046 ?auto_215051 ) ) ( not ( = ?auto_215046 ?auto_215052 ) ) ( not ( = ?auto_215046 ?auto_215053 ) ) ( not ( = ?auto_215046 ?auto_215054 ) ) ( not ( = ?auto_215047 ?auto_215048 ) ) ( not ( = ?auto_215047 ?auto_215049 ) ) ( not ( = ?auto_215047 ?auto_215050 ) ) ( not ( = ?auto_215047 ?auto_215051 ) ) ( not ( = ?auto_215047 ?auto_215052 ) ) ( not ( = ?auto_215047 ?auto_215053 ) ) ( not ( = ?auto_215047 ?auto_215054 ) ) ( not ( = ?auto_215048 ?auto_215049 ) ) ( not ( = ?auto_215048 ?auto_215050 ) ) ( not ( = ?auto_215048 ?auto_215051 ) ) ( not ( = ?auto_215048 ?auto_215052 ) ) ( not ( = ?auto_215048 ?auto_215053 ) ) ( not ( = ?auto_215048 ?auto_215054 ) ) ( not ( = ?auto_215049 ?auto_215050 ) ) ( not ( = ?auto_215049 ?auto_215051 ) ) ( not ( = ?auto_215049 ?auto_215052 ) ) ( not ( = ?auto_215049 ?auto_215053 ) ) ( not ( = ?auto_215049 ?auto_215054 ) ) ( not ( = ?auto_215050 ?auto_215051 ) ) ( not ( = ?auto_215050 ?auto_215052 ) ) ( not ( = ?auto_215050 ?auto_215053 ) ) ( not ( = ?auto_215050 ?auto_215054 ) ) ( not ( = ?auto_215051 ?auto_215052 ) ) ( not ( = ?auto_215051 ?auto_215053 ) ) ( not ( = ?auto_215051 ?auto_215054 ) ) ( not ( = ?auto_215052 ?auto_215053 ) ) ( not ( = ?auto_215052 ?auto_215054 ) ) ( not ( = ?auto_215053 ?auto_215054 ) ) ( ON ?auto_215052 ?auto_215053 ) ( ON ?auto_215051 ?auto_215052 ) ( ON ?auto_215050 ?auto_215051 ) ( ON ?auto_215049 ?auto_215050 ) ( ON ?auto_215048 ?auto_215049 ) ( ON ?auto_215047 ?auto_215048 ) ( ON ?auto_215046 ?auto_215047 ) ( ON ?auto_215045 ?auto_215046 ) ( CLEAR ?auto_215043 ) ( ON ?auto_215044 ?auto_215045 ) ( CLEAR ?auto_215044 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_215042 ?auto_215043 ?auto_215044 )
      ( MAKE-12PILE ?auto_215042 ?auto_215043 ?auto_215044 ?auto_215045 ?auto_215046 ?auto_215047 ?auto_215048 ?auto_215049 ?auto_215050 ?auto_215051 ?auto_215052 ?auto_215053 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_215067 - BLOCK
      ?auto_215068 - BLOCK
      ?auto_215069 - BLOCK
      ?auto_215070 - BLOCK
      ?auto_215071 - BLOCK
      ?auto_215072 - BLOCK
      ?auto_215073 - BLOCK
      ?auto_215074 - BLOCK
      ?auto_215075 - BLOCK
      ?auto_215076 - BLOCK
      ?auto_215077 - BLOCK
      ?auto_215078 - BLOCK
    )
    :vars
    (
      ?auto_215079 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_215078 ?auto_215079 ) ( ON-TABLE ?auto_215067 ) ( ON ?auto_215068 ?auto_215067 ) ( not ( = ?auto_215067 ?auto_215068 ) ) ( not ( = ?auto_215067 ?auto_215069 ) ) ( not ( = ?auto_215067 ?auto_215070 ) ) ( not ( = ?auto_215067 ?auto_215071 ) ) ( not ( = ?auto_215067 ?auto_215072 ) ) ( not ( = ?auto_215067 ?auto_215073 ) ) ( not ( = ?auto_215067 ?auto_215074 ) ) ( not ( = ?auto_215067 ?auto_215075 ) ) ( not ( = ?auto_215067 ?auto_215076 ) ) ( not ( = ?auto_215067 ?auto_215077 ) ) ( not ( = ?auto_215067 ?auto_215078 ) ) ( not ( = ?auto_215067 ?auto_215079 ) ) ( not ( = ?auto_215068 ?auto_215069 ) ) ( not ( = ?auto_215068 ?auto_215070 ) ) ( not ( = ?auto_215068 ?auto_215071 ) ) ( not ( = ?auto_215068 ?auto_215072 ) ) ( not ( = ?auto_215068 ?auto_215073 ) ) ( not ( = ?auto_215068 ?auto_215074 ) ) ( not ( = ?auto_215068 ?auto_215075 ) ) ( not ( = ?auto_215068 ?auto_215076 ) ) ( not ( = ?auto_215068 ?auto_215077 ) ) ( not ( = ?auto_215068 ?auto_215078 ) ) ( not ( = ?auto_215068 ?auto_215079 ) ) ( not ( = ?auto_215069 ?auto_215070 ) ) ( not ( = ?auto_215069 ?auto_215071 ) ) ( not ( = ?auto_215069 ?auto_215072 ) ) ( not ( = ?auto_215069 ?auto_215073 ) ) ( not ( = ?auto_215069 ?auto_215074 ) ) ( not ( = ?auto_215069 ?auto_215075 ) ) ( not ( = ?auto_215069 ?auto_215076 ) ) ( not ( = ?auto_215069 ?auto_215077 ) ) ( not ( = ?auto_215069 ?auto_215078 ) ) ( not ( = ?auto_215069 ?auto_215079 ) ) ( not ( = ?auto_215070 ?auto_215071 ) ) ( not ( = ?auto_215070 ?auto_215072 ) ) ( not ( = ?auto_215070 ?auto_215073 ) ) ( not ( = ?auto_215070 ?auto_215074 ) ) ( not ( = ?auto_215070 ?auto_215075 ) ) ( not ( = ?auto_215070 ?auto_215076 ) ) ( not ( = ?auto_215070 ?auto_215077 ) ) ( not ( = ?auto_215070 ?auto_215078 ) ) ( not ( = ?auto_215070 ?auto_215079 ) ) ( not ( = ?auto_215071 ?auto_215072 ) ) ( not ( = ?auto_215071 ?auto_215073 ) ) ( not ( = ?auto_215071 ?auto_215074 ) ) ( not ( = ?auto_215071 ?auto_215075 ) ) ( not ( = ?auto_215071 ?auto_215076 ) ) ( not ( = ?auto_215071 ?auto_215077 ) ) ( not ( = ?auto_215071 ?auto_215078 ) ) ( not ( = ?auto_215071 ?auto_215079 ) ) ( not ( = ?auto_215072 ?auto_215073 ) ) ( not ( = ?auto_215072 ?auto_215074 ) ) ( not ( = ?auto_215072 ?auto_215075 ) ) ( not ( = ?auto_215072 ?auto_215076 ) ) ( not ( = ?auto_215072 ?auto_215077 ) ) ( not ( = ?auto_215072 ?auto_215078 ) ) ( not ( = ?auto_215072 ?auto_215079 ) ) ( not ( = ?auto_215073 ?auto_215074 ) ) ( not ( = ?auto_215073 ?auto_215075 ) ) ( not ( = ?auto_215073 ?auto_215076 ) ) ( not ( = ?auto_215073 ?auto_215077 ) ) ( not ( = ?auto_215073 ?auto_215078 ) ) ( not ( = ?auto_215073 ?auto_215079 ) ) ( not ( = ?auto_215074 ?auto_215075 ) ) ( not ( = ?auto_215074 ?auto_215076 ) ) ( not ( = ?auto_215074 ?auto_215077 ) ) ( not ( = ?auto_215074 ?auto_215078 ) ) ( not ( = ?auto_215074 ?auto_215079 ) ) ( not ( = ?auto_215075 ?auto_215076 ) ) ( not ( = ?auto_215075 ?auto_215077 ) ) ( not ( = ?auto_215075 ?auto_215078 ) ) ( not ( = ?auto_215075 ?auto_215079 ) ) ( not ( = ?auto_215076 ?auto_215077 ) ) ( not ( = ?auto_215076 ?auto_215078 ) ) ( not ( = ?auto_215076 ?auto_215079 ) ) ( not ( = ?auto_215077 ?auto_215078 ) ) ( not ( = ?auto_215077 ?auto_215079 ) ) ( not ( = ?auto_215078 ?auto_215079 ) ) ( ON ?auto_215077 ?auto_215078 ) ( ON ?auto_215076 ?auto_215077 ) ( ON ?auto_215075 ?auto_215076 ) ( ON ?auto_215074 ?auto_215075 ) ( ON ?auto_215073 ?auto_215074 ) ( ON ?auto_215072 ?auto_215073 ) ( ON ?auto_215071 ?auto_215072 ) ( ON ?auto_215070 ?auto_215071 ) ( CLEAR ?auto_215068 ) ( ON ?auto_215069 ?auto_215070 ) ( CLEAR ?auto_215069 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_215067 ?auto_215068 ?auto_215069 )
      ( MAKE-12PILE ?auto_215067 ?auto_215068 ?auto_215069 ?auto_215070 ?auto_215071 ?auto_215072 ?auto_215073 ?auto_215074 ?auto_215075 ?auto_215076 ?auto_215077 ?auto_215078 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_215092 - BLOCK
      ?auto_215093 - BLOCK
      ?auto_215094 - BLOCK
      ?auto_215095 - BLOCK
      ?auto_215096 - BLOCK
      ?auto_215097 - BLOCK
      ?auto_215098 - BLOCK
      ?auto_215099 - BLOCK
      ?auto_215100 - BLOCK
      ?auto_215101 - BLOCK
      ?auto_215102 - BLOCK
      ?auto_215103 - BLOCK
    )
    :vars
    (
      ?auto_215104 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_215103 ?auto_215104 ) ( ON-TABLE ?auto_215092 ) ( not ( = ?auto_215092 ?auto_215093 ) ) ( not ( = ?auto_215092 ?auto_215094 ) ) ( not ( = ?auto_215092 ?auto_215095 ) ) ( not ( = ?auto_215092 ?auto_215096 ) ) ( not ( = ?auto_215092 ?auto_215097 ) ) ( not ( = ?auto_215092 ?auto_215098 ) ) ( not ( = ?auto_215092 ?auto_215099 ) ) ( not ( = ?auto_215092 ?auto_215100 ) ) ( not ( = ?auto_215092 ?auto_215101 ) ) ( not ( = ?auto_215092 ?auto_215102 ) ) ( not ( = ?auto_215092 ?auto_215103 ) ) ( not ( = ?auto_215092 ?auto_215104 ) ) ( not ( = ?auto_215093 ?auto_215094 ) ) ( not ( = ?auto_215093 ?auto_215095 ) ) ( not ( = ?auto_215093 ?auto_215096 ) ) ( not ( = ?auto_215093 ?auto_215097 ) ) ( not ( = ?auto_215093 ?auto_215098 ) ) ( not ( = ?auto_215093 ?auto_215099 ) ) ( not ( = ?auto_215093 ?auto_215100 ) ) ( not ( = ?auto_215093 ?auto_215101 ) ) ( not ( = ?auto_215093 ?auto_215102 ) ) ( not ( = ?auto_215093 ?auto_215103 ) ) ( not ( = ?auto_215093 ?auto_215104 ) ) ( not ( = ?auto_215094 ?auto_215095 ) ) ( not ( = ?auto_215094 ?auto_215096 ) ) ( not ( = ?auto_215094 ?auto_215097 ) ) ( not ( = ?auto_215094 ?auto_215098 ) ) ( not ( = ?auto_215094 ?auto_215099 ) ) ( not ( = ?auto_215094 ?auto_215100 ) ) ( not ( = ?auto_215094 ?auto_215101 ) ) ( not ( = ?auto_215094 ?auto_215102 ) ) ( not ( = ?auto_215094 ?auto_215103 ) ) ( not ( = ?auto_215094 ?auto_215104 ) ) ( not ( = ?auto_215095 ?auto_215096 ) ) ( not ( = ?auto_215095 ?auto_215097 ) ) ( not ( = ?auto_215095 ?auto_215098 ) ) ( not ( = ?auto_215095 ?auto_215099 ) ) ( not ( = ?auto_215095 ?auto_215100 ) ) ( not ( = ?auto_215095 ?auto_215101 ) ) ( not ( = ?auto_215095 ?auto_215102 ) ) ( not ( = ?auto_215095 ?auto_215103 ) ) ( not ( = ?auto_215095 ?auto_215104 ) ) ( not ( = ?auto_215096 ?auto_215097 ) ) ( not ( = ?auto_215096 ?auto_215098 ) ) ( not ( = ?auto_215096 ?auto_215099 ) ) ( not ( = ?auto_215096 ?auto_215100 ) ) ( not ( = ?auto_215096 ?auto_215101 ) ) ( not ( = ?auto_215096 ?auto_215102 ) ) ( not ( = ?auto_215096 ?auto_215103 ) ) ( not ( = ?auto_215096 ?auto_215104 ) ) ( not ( = ?auto_215097 ?auto_215098 ) ) ( not ( = ?auto_215097 ?auto_215099 ) ) ( not ( = ?auto_215097 ?auto_215100 ) ) ( not ( = ?auto_215097 ?auto_215101 ) ) ( not ( = ?auto_215097 ?auto_215102 ) ) ( not ( = ?auto_215097 ?auto_215103 ) ) ( not ( = ?auto_215097 ?auto_215104 ) ) ( not ( = ?auto_215098 ?auto_215099 ) ) ( not ( = ?auto_215098 ?auto_215100 ) ) ( not ( = ?auto_215098 ?auto_215101 ) ) ( not ( = ?auto_215098 ?auto_215102 ) ) ( not ( = ?auto_215098 ?auto_215103 ) ) ( not ( = ?auto_215098 ?auto_215104 ) ) ( not ( = ?auto_215099 ?auto_215100 ) ) ( not ( = ?auto_215099 ?auto_215101 ) ) ( not ( = ?auto_215099 ?auto_215102 ) ) ( not ( = ?auto_215099 ?auto_215103 ) ) ( not ( = ?auto_215099 ?auto_215104 ) ) ( not ( = ?auto_215100 ?auto_215101 ) ) ( not ( = ?auto_215100 ?auto_215102 ) ) ( not ( = ?auto_215100 ?auto_215103 ) ) ( not ( = ?auto_215100 ?auto_215104 ) ) ( not ( = ?auto_215101 ?auto_215102 ) ) ( not ( = ?auto_215101 ?auto_215103 ) ) ( not ( = ?auto_215101 ?auto_215104 ) ) ( not ( = ?auto_215102 ?auto_215103 ) ) ( not ( = ?auto_215102 ?auto_215104 ) ) ( not ( = ?auto_215103 ?auto_215104 ) ) ( ON ?auto_215102 ?auto_215103 ) ( ON ?auto_215101 ?auto_215102 ) ( ON ?auto_215100 ?auto_215101 ) ( ON ?auto_215099 ?auto_215100 ) ( ON ?auto_215098 ?auto_215099 ) ( ON ?auto_215097 ?auto_215098 ) ( ON ?auto_215096 ?auto_215097 ) ( ON ?auto_215095 ?auto_215096 ) ( ON ?auto_215094 ?auto_215095 ) ( CLEAR ?auto_215092 ) ( ON ?auto_215093 ?auto_215094 ) ( CLEAR ?auto_215093 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_215092 ?auto_215093 )
      ( MAKE-12PILE ?auto_215092 ?auto_215093 ?auto_215094 ?auto_215095 ?auto_215096 ?auto_215097 ?auto_215098 ?auto_215099 ?auto_215100 ?auto_215101 ?auto_215102 ?auto_215103 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_215117 - BLOCK
      ?auto_215118 - BLOCK
      ?auto_215119 - BLOCK
      ?auto_215120 - BLOCK
      ?auto_215121 - BLOCK
      ?auto_215122 - BLOCK
      ?auto_215123 - BLOCK
      ?auto_215124 - BLOCK
      ?auto_215125 - BLOCK
      ?auto_215126 - BLOCK
      ?auto_215127 - BLOCK
      ?auto_215128 - BLOCK
    )
    :vars
    (
      ?auto_215129 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_215128 ?auto_215129 ) ( ON-TABLE ?auto_215117 ) ( not ( = ?auto_215117 ?auto_215118 ) ) ( not ( = ?auto_215117 ?auto_215119 ) ) ( not ( = ?auto_215117 ?auto_215120 ) ) ( not ( = ?auto_215117 ?auto_215121 ) ) ( not ( = ?auto_215117 ?auto_215122 ) ) ( not ( = ?auto_215117 ?auto_215123 ) ) ( not ( = ?auto_215117 ?auto_215124 ) ) ( not ( = ?auto_215117 ?auto_215125 ) ) ( not ( = ?auto_215117 ?auto_215126 ) ) ( not ( = ?auto_215117 ?auto_215127 ) ) ( not ( = ?auto_215117 ?auto_215128 ) ) ( not ( = ?auto_215117 ?auto_215129 ) ) ( not ( = ?auto_215118 ?auto_215119 ) ) ( not ( = ?auto_215118 ?auto_215120 ) ) ( not ( = ?auto_215118 ?auto_215121 ) ) ( not ( = ?auto_215118 ?auto_215122 ) ) ( not ( = ?auto_215118 ?auto_215123 ) ) ( not ( = ?auto_215118 ?auto_215124 ) ) ( not ( = ?auto_215118 ?auto_215125 ) ) ( not ( = ?auto_215118 ?auto_215126 ) ) ( not ( = ?auto_215118 ?auto_215127 ) ) ( not ( = ?auto_215118 ?auto_215128 ) ) ( not ( = ?auto_215118 ?auto_215129 ) ) ( not ( = ?auto_215119 ?auto_215120 ) ) ( not ( = ?auto_215119 ?auto_215121 ) ) ( not ( = ?auto_215119 ?auto_215122 ) ) ( not ( = ?auto_215119 ?auto_215123 ) ) ( not ( = ?auto_215119 ?auto_215124 ) ) ( not ( = ?auto_215119 ?auto_215125 ) ) ( not ( = ?auto_215119 ?auto_215126 ) ) ( not ( = ?auto_215119 ?auto_215127 ) ) ( not ( = ?auto_215119 ?auto_215128 ) ) ( not ( = ?auto_215119 ?auto_215129 ) ) ( not ( = ?auto_215120 ?auto_215121 ) ) ( not ( = ?auto_215120 ?auto_215122 ) ) ( not ( = ?auto_215120 ?auto_215123 ) ) ( not ( = ?auto_215120 ?auto_215124 ) ) ( not ( = ?auto_215120 ?auto_215125 ) ) ( not ( = ?auto_215120 ?auto_215126 ) ) ( not ( = ?auto_215120 ?auto_215127 ) ) ( not ( = ?auto_215120 ?auto_215128 ) ) ( not ( = ?auto_215120 ?auto_215129 ) ) ( not ( = ?auto_215121 ?auto_215122 ) ) ( not ( = ?auto_215121 ?auto_215123 ) ) ( not ( = ?auto_215121 ?auto_215124 ) ) ( not ( = ?auto_215121 ?auto_215125 ) ) ( not ( = ?auto_215121 ?auto_215126 ) ) ( not ( = ?auto_215121 ?auto_215127 ) ) ( not ( = ?auto_215121 ?auto_215128 ) ) ( not ( = ?auto_215121 ?auto_215129 ) ) ( not ( = ?auto_215122 ?auto_215123 ) ) ( not ( = ?auto_215122 ?auto_215124 ) ) ( not ( = ?auto_215122 ?auto_215125 ) ) ( not ( = ?auto_215122 ?auto_215126 ) ) ( not ( = ?auto_215122 ?auto_215127 ) ) ( not ( = ?auto_215122 ?auto_215128 ) ) ( not ( = ?auto_215122 ?auto_215129 ) ) ( not ( = ?auto_215123 ?auto_215124 ) ) ( not ( = ?auto_215123 ?auto_215125 ) ) ( not ( = ?auto_215123 ?auto_215126 ) ) ( not ( = ?auto_215123 ?auto_215127 ) ) ( not ( = ?auto_215123 ?auto_215128 ) ) ( not ( = ?auto_215123 ?auto_215129 ) ) ( not ( = ?auto_215124 ?auto_215125 ) ) ( not ( = ?auto_215124 ?auto_215126 ) ) ( not ( = ?auto_215124 ?auto_215127 ) ) ( not ( = ?auto_215124 ?auto_215128 ) ) ( not ( = ?auto_215124 ?auto_215129 ) ) ( not ( = ?auto_215125 ?auto_215126 ) ) ( not ( = ?auto_215125 ?auto_215127 ) ) ( not ( = ?auto_215125 ?auto_215128 ) ) ( not ( = ?auto_215125 ?auto_215129 ) ) ( not ( = ?auto_215126 ?auto_215127 ) ) ( not ( = ?auto_215126 ?auto_215128 ) ) ( not ( = ?auto_215126 ?auto_215129 ) ) ( not ( = ?auto_215127 ?auto_215128 ) ) ( not ( = ?auto_215127 ?auto_215129 ) ) ( not ( = ?auto_215128 ?auto_215129 ) ) ( ON ?auto_215127 ?auto_215128 ) ( ON ?auto_215126 ?auto_215127 ) ( ON ?auto_215125 ?auto_215126 ) ( ON ?auto_215124 ?auto_215125 ) ( ON ?auto_215123 ?auto_215124 ) ( ON ?auto_215122 ?auto_215123 ) ( ON ?auto_215121 ?auto_215122 ) ( ON ?auto_215120 ?auto_215121 ) ( ON ?auto_215119 ?auto_215120 ) ( CLEAR ?auto_215117 ) ( ON ?auto_215118 ?auto_215119 ) ( CLEAR ?auto_215118 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_215117 ?auto_215118 )
      ( MAKE-12PILE ?auto_215117 ?auto_215118 ?auto_215119 ?auto_215120 ?auto_215121 ?auto_215122 ?auto_215123 ?auto_215124 ?auto_215125 ?auto_215126 ?auto_215127 ?auto_215128 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_215142 - BLOCK
      ?auto_215143 - BLOCK
      ?auto_215144 - BLOCK
      ?auto_215145 - BLOCK
      ?auto_215146 - BLOCK
      ?auto_215147 - BLOCK
      ?auto_215148 - BLOCK
      ?auto_215149 - BLOCK
      ?auto_215150 - BLOCK
      ?auto_215151 - BLOCK
      ?auto_215152 - BLOCK
      ?auto_215153 - BLOCK
    )
    :vars
    (
      ?auto_215154 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_215153 ?auto_215154 ) ( not ( = ?auto_215142 ?auto_215143 ) ) ( not ( = ?auto_215142 ?auto_215144 ) ) ( not ( = ?auto_215142 ?auto_215145 ) ) ( not ( = ?auto_215142 ?auto_215146 ) ) ( not ( = ?auto_215142 ?auto_215147 ) ) ( not ( = ?auto_215142 ?auto_215148 ) ) ( not ( = ?auto_215142 ?auto_215149 ) ) ( not ( = ?auto_215142 ?auto_215150 ) ) ( not ( = ?auto_215142 ?auto_215151 ) ) ( not ( = ?auto_215142 ?auto_215152 ) ) ( not ( = ?auto_215142 ?auto_215153 ) ) ( not ( = ?auto_215142 ?auto_215154 ) ) ( not ( = ?auto_215143 ?auto_215144 ) ) ( not ( = ?auto_215143 ?auto_215145 ) ) ( not ( = ?auto_215143 ?auto_215146 ) ) ( not ( = ?auto_215143 ?auto_215147 ) ) ( not ( = ?auto_215143 ?auto_215148 ) ) ( not ( = ?auto_215143 ?auto_215149 ) ) ( not ( = ?auto_215143 ?auto_215150 ) ) ( not ( = ?auto_215143 ?auto_215151 ) ) ( not ( = ?auto_215143 ?auto_215152 ) ) ( not ( = ?auto_215143 ?auto_215153 ) ) ( not ( = ?auto_215143 ?auto_215154 ) ) ( not ( = ?auto_215144 ?auto_215145 ) ) ( not ( = ?auto_215144 ?auto_215146 ) ) ( not ( = ?auto_215144 ?auto_215147 ) ) ( not ( = ?auto_215144 ?auto_215148 ) ) ( not ( = ?auto_215144 ?auto_215149 ) ) ( not ( = ?auto_215144 ?auto_215150 ) ) ( not ( = ?auto_215144 ?auto_215151 ) ) ( not ( = ?auto_215144 ?auto_215152 ) ) ( not ( = ?auto_215144 ?auto_215153 ) ) ( not ( = ?auto_215144 ?auto_215154 ) ) ( not ( = ?auto_215145 ?auto_215146 ) ) ( not ( = ?auto_215145 ?auto_215147 ) ) ( not ( = ?auto_215145 ?auto_215148 ) ) ( not ( = ?auto_215145 ?auto_215149 ) ) ( not ( = ?auto_215145 ?auto_215150 ) ) ( not ( = ?auto_215145 ?auto_215151 ) ) ( not ( = ?auto_215145 ?auto_215152 ) ) ( not ( = ?auto_215145 ?auto_215153 ) ) ( not ( = ?auto_215145 ?auto_215154 ) ) ( not ( = ?auto_215146 ?auto_215147 ) ) ( not ( = ?auto_215146 ?auto_215148 ) ) ( not ( = ?auto_215146 ?auto_215149 ) ) ( not ( = ?auto_215146 ?auto_215150 ) ) ( not ( = ?auto_215146 ?auto_215151 ) ) ( not ( = ?auto_215146 ?auto_215152 ) ) ( not ( = ?auto_215146 ?auto_215153 ) ) ( not ( = ?auto_215146 ?auto_215154 ) ) ( not ( = ?auto_215147 ?auto_215148 ) ) ( not ( = ?auto_215147 ?auto_215149 ) ) ( not ( = ?auto_215147 ?auto_215150 ) ) ( not ( = ?auto_215147 ?auto_215151 ) ) ( not ( = ?auto_215147 ?auto_215152 ) ) ( not ( = ?auto_215147 ?auto_215153 ) ) ( not ( = ?auto_215147 ?auto_215154 ) ) ( not ( = ?auto_215148 ?auto_215149 ) ) ( not ( = ?auto_215148 ?auto_215150 ) ) ( not ( = ?auto_215148 ?auto_215151 ) ) ( not ( = ?auto_215148 ?auto_215152 ) ) ( not ( = ?auto_215148 ?auto_215153 ) ) ( not ( = ?auto_215148 ?auto_215154 ) ) ( not ( = ?auto_215149 ?auto_215150 ) ) ( not ( = ?auto_215149 ?auto_215151 ) ) ( not ( = ?auto_215149 ?auto_215152 ) ) ( not ( = ?auto_215149 ?auto_215153 ) ) ( not ( = ?auto_215149 ?auto_215154 ) ) ( not ( = ?auto_215150 ?auto_215151 ) ) ( not ( = ?auto_215150 ?auto_215152 ) ) ( not ( = ?auto_215150 ?auto_215153 ) ) ( not ( = ?auto_215150 ?auto_215154 ) ) ( not ( = ?auto_215151 ?auto_215152 ) ) ( not ( = ?auto_215151 ?auto_215153 ) ) ( not ( = ?auto_215151 ?auto_215154 ) ) ( not ( = ?auto_215152 ?auto_215153 ) ) ( not ( = ?auto_215152 ?auto_215154 ) ) ( not ( = ?auto_215153 ?auto_215154 ) ) ( ON ?auto_215152 ?auto_215153 ) ( ON ?auto_215151 ?auto_215152 ) ( ON ?auto_215150 ?auto_215151 ) ( ON ?auto_215149 ?auto_215150 ) ( ON ?auto_215148 ?auto_215149 ) ( ON ?auto_215147 ?auto_215148 ) ( ON ?auto_215146 ?auto_215147 ) ( ON ?auto_215145 ?auto_215146 ) ( ON ?auto_215144 ?auto_215145 ) ( ON ?auto_215143 ?auto_215144 ) ( ON ?auto_215142 ?auto_215143 ) ( CLEAR ?auto_215142 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_215142 )
      ( MAKE-12PILE ?auto_215142 ?auto_215143 ?auto_215144 ?auto_215145 ?auto_215146 ?auto_215147 ?auto_215148 ?auto_215149 ?auto_215150 ?auto_215151 ?auto_215152 ?auto_215153 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_215167 - BLOCK
      ?auto_215168 - BLOCK
      ?auto_215169 - BLOCK
      ?auto_215170 - BLOCK
      ?auto_215171 - BLOCK
      ?auto_215172 - BLOCK
      ?auto_215173 - BLOCK
      ?auto_215174 - BLOCK
      ?auto_215175 - BLOCK
      ?auto_215176 - BLOCK
      ?auto_215177 - BLOCK
      ?auto_215178 - BLOCK
    )
    :vars
    (
      ?auto_215179 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_215178 ?auto_215179 ) ( not ( = ?auto_215167 ?auto_215168 ) ) ( not ( = ?auto_215167 ?auto_215169 ) ) ( not ( = ?auto_215167 ?auto_215170 ) ) ( not ( = ?auto_215167 ?auto_215171 ) ) ( not ( = ?auto_215167 ?auto_215172 ) ) ( not ( = ?auto_215167 ?auto_215173 ) ) ( not ( = ?auto_215167 ?auto_215174 ) ) ( not ( = ?auto_215167 ?auto_215175 ) ) ( not ( = ?auto_215167 ?auto_215176 ) ) ( not ( = ?auto_215167 ?auto_215177 ) ) ( not ( = ?auto_215167 ?auto_215178 ) ) ( not ( = ?auto_215167 ?auto_215179 ) ) ( not ( = ?auto_215168 ?auto_215169 ) ) ( not ( = ?auto_215168 ?auto_215170 ) ) ( not ( = ?auto_215168 ?auto_215171 ) ) ( not ( = ?auto_215168 ?auto_215172 ) ) ( not ( = ?auto_215168 ?auto_215173 ) ) ( not ( = ?auto_215168 ?auto_215174 ) ) ( not ( = ?auto_215168 ?auto_215175 ) ) ( not ( = ?auto_215168 ?auto_215176 ) ) ( not ( = ?auto_215168 ?auto_215177 ) ) ( not ( = ?auto_215168 ?auto_215178 ) ) ( not ( = ?auto_215168 ?auto_215179 ) ) ( not ( = ?auto_215169 ?auto_215170 ) ) ( not ( = ?auto_215169 ?auto_215171 ) ) ( not ( = ?auto_215169 ?auto_215172 ) ) ( not ( = ?auto_215169 ?auto_215173 ) ) ( not ( = ?auto_215169 ?auto_215174 ) ) ( not ( = ?auto_215169 ?auto_215175 ) ) ( not ( = ?auto_215169 ?auto_215176 ) ) ( not ( = ?auto_215169 ?auto_215177 ) ) ( not ( = ?auto_215169 ?auto_215178 ) ) ( not ( = ?auto_215169 ?auto_215179 ) ) ( not ( = ?auto_215170 ?auto_215171 ) ) ( not ( = ?auto_215170 ?auto_215172 ) ) ( not ( = ?auto_215170 ?auto_215173 ) ) ( not ( = ?auto_215170 ?auto_215174 ) ) ( not ( = ?auto_215170 ?auto_215175 ) ) ( not ( = ?auto_215170 ?auto_215176 ) ) ( not ( = ?auto_215170 ?auto_215177 ) ) ( not ( = ?auto_215170 ?auto_215178 ) ) ( not ( = ?auto_215170 ?auto_215179 ) ) ( not ( = ?auto_215171 ?auto_215172 ) ) ( not ( = ?auto_215171 ?auto_215173 ) ) ( not ( = ?auto_215171 ?auto_215174 ) ) ( not ( = ?auto_215171 ?auto_215175 ) ) ( not ( = ?auto_215171 ?auto_215176 ) ) ( not ( = ?auto_215171 ?auto_215177 ) ) ( not ( = ?auto_215171 ?auto_215178 ) ) ( not ( = ?auto_215171 ?auto_215179 ) ) ( not ( = ?auto_215172 ?auto_215173 ) ) ( not ( = ?auto_215172 ?auto_215174 ) ) ( not ( = ?auto_215172 ?auto_215175 ) ) ( not ( = ?auto_215172 ?auto_215176 ) ) ( not ( = ?auto_215172 ?auto_215177 ) ) ( not ( = ?auto_215172 ?auto_215178 ) ) ( not ( = ?auto_215172 ?auto_215179 ) ) ( not ( = ?auto_215173 ?auto_215174 ) ) ( not ( = ?auto_215173 ?auto_215175 ) ) ( not ( = ?auto_215173 ?auto_215176 ) ) ( not ( = ?auto_215173 ?auto_215177 ) ) ( not ( = ?auto_215173 ?auto_215178 ) ) ( not ( = ?auto_215173 ?auto_215179 ) ) ( not ( = ?auto_215174 ?auto_215175 ) ) ( not ( = ?auto_215174 ?auto_215176 ) ) ( not ( = ?auto_215174 ?auto_215177 ) ) ( not ( = ?auto_215174 ?auto_215178 ) ) ( not ( = ?auto_215174 ?auto_215179 ) ) ( not ( = ?auto_215175 ?auto_215176 ) ) ( not ( = ?auto_215175 ?auto_215177 ) ) ( not ( = ?auto_215175 ?auto_215178 ) ) ( not ( = ?auto_215175 ?auto_215179 ) ) ( not ( = ?auto_215176 ?auto_215177 ) ) ( not ( = ?auto_215176 ?auto_215178 ) ) ( not ( = ?auto_215176 ?auto_215179 ) ) ( not ( = ?auto_215177 ?auto_215178 ) ) ( not ( = ?auto_215177 ?auto_215179 ) ) ( not ( = ?auto_215178 ?auto_215179 ) ) ( ON ?auto_215177 ?auto_215178 ) ( ON ?auto_215176 ?auto_215177 ) ( ON ?auto_215175 ?auto_215176 ) ( ON ?auto_215174 ?auto_215175 ) ( ON ?auto_215173 ?auto_215174 ) ( ON ?auto_215172 ?auto_215173 ) ( ON ?auto_215171 ?auto_215172 ) ( ON ?auto_215170 ?auto_215171 ) ( ON ?auto_215169 ?auto_215170 ) ( ON ?auto_215168 ?auto_215169 ) ( ON ?auto_215167 ?auto_215168 ) ( CLEAR ?auto_215167 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_215167 )
      ( MAKE-12PILE ?auto_215167 ?auto_215168 ?auto_215169 ?auto_215170 ?auto_215171 ?auto_215172 ?auto_215173 ?auto_215174 ?auto_215175 ?auto_215176 ?auto_215177 ?auto_215178 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_215193 - BLOCK
      ?auto_215194 - BLOCK
      ?auto_215195 - BLOCK
      ?auto_215196 - BLOCK
      ?auto_215197 - BLOCK
      ?auto_215198 - BLOCK
      ?auto_215199 - BLOCK
      ?auto_215200 - BLOCK
      ?auto_215201 - BLOCK
      ?auto_215202 - BLOCK
      ?auto_215203 - BLOCK
      ?auto_215204 - BLOCK
      ?auto_215205 - BLOCK
    )
    :vars
    (
      ?auto_215206 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_215204 ) ( ON ?auto_215205 ?auto_215206 ) ( CLEAR ?auto_215205 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_215193 ) ( ON ?auto_215194 ?auto_215193 ) ( ON ?auto_215195 ?auto_215194 ) ( ON ?auto_215196 ?auto_215195 ) ( ON ?auto_215197 ?auto_215196 ) ( ON ?auto_215198 ?auto_215197 ) ( ON ?auto_215199 ?auto_215198 ) ( ON ?auto_215200 ?auto_215199 ) ( ON ?auto_215201 ?auto_215200 ) ( ON ?auto_215202 ?auto_215201 ) ( ON ?auto_215203 ?auto_215202 ) ( ON ?auto_215204 ?auto_215203 ) ( not ( = ?auto_215193 ?auto_215194 ) ) ( not ( = ?auto_215193 ?auto_215195 ) ) ( not ( = ?auto_215193 ?auto_215196 ) ) ( not ( = ?auto_215193 ?auto_215197 ) ) ( not ( = ?auto_215193 ?auto_215198 ) ) ( not ( = ?auto_215193 ?auto_215199 ) ) ( not ( = ?auto_215193 ?auto_215200 ) ) ( not ( = ?auto_215193 ?auto_215201 ) ) ( not ( = ?auto_215193 ?auto_215202 ) ) ( not ( = ?auto_215193 ?auto_215203 ) ) ( not ( = ?auto_215193 ?auto_215204 ) ) ( not ( = ?auto_215193 ?auto_215205 ) ) ( not ( = ?auto_215193 ?auto_215206 ) ) ( not ( = ?auto_215194 ?auto_215195 ) ) ( not ( = ?auto_215194 ?auto_215196 ) ) ( not ( = ?auto_215194 ?auto_215197 ) ) ( not ( = ?auto_215194 ?auto_215198 ) ) ( not ( = ?auto_215194 ?auto_215199 ) ) ( not ( = ?auto_215194 ?auto_215200 ) ) ( not ( = ?auto_215194 ?auto_215201 ) ) ( not ( = ?auto_215194 ?auto_215202 ) ) ( not ( = ?auto_215194 ?auto_215203 ) ) ( not ( = ?auto_215194 ?auto_215204 ) ) ( not ( = ?auto_215194 ?auto_215205 ) ) ( not ( = ?auto_215194 ?auto_215206 ) ) ( not ( = ?auto_215195 ?auto_215196 ) ) ( not ( = ?auto_215195 ?auto_215197 ) ) ( not ( = ?auto_215195 ?auto_215198 ) ) ( not ( = ?auto_215195 ?auto_215199 ) ) ( not ( = ?auto_215195 ?auto_215200 ) ) ( not ( = ?auto_215195 ?auto_215201 ) ) ( not ( = ?auto_215195 ?auto_215202 ) ) ( not ( = ?auto_215195 ?auto_215203 ) ) ( not ( = ?auto_215195 ?auto_215204 ) ) ( not ( = ?auto_215195 ?auto_215205 ) ) ( not ( = ?auto_215195 ?auto_215206 ) ) ( not ( = ?auto_215196 ?auto_215197 ) ) ( not ( = ?auto_215196 ?auto_215198 ) ) ( not ( = ?auto_215196 ?auto_215199 ) ) ( not ( = ?auto_215196 ?auto_215200 ) ) ( not ( = ?auto_215196 ?auto_215201 ) ) ( not ( = ?auto_215196 ?auto_215202 ) ) ( not ( = ?auto_215196 ?auto_215203 ) ) ( not ( = ?auto_215196 ?auto_215204 ) ) ( not ( = ?auto_215196 ?auto_215205 ) ) ( not ( = ?auto_215196 ?auto_215206 ) ) ( not ( = ?auto_215197 ?auto_215198 ) ) ( not ( = ?auto_215197 ?auto_215199 ) ) ( not ( = ?auto_215197 ?auto_215200 ) ) ( not ( = ?auto_215197 ?auto_215201 ) ) ( not ( = ?auto_215197 ?auto_215202 ) ) ( not ( = ?auto_215197 ?auto_215203 ) ) ( not ( = ?auto_215197 ?auto_215204 ) ) ( not ( = ?auto_215197 ?auto_215205 ) ) ( not ( = ?auto_215197 ?auto_215206 ) ) ( not ( = ?auto_215198 ?auto_215199 ) ) ( not ( = ?auto_215198 ?auto_215200 ) ) ( not ( = ?auto_215198 ?auto_215201 ) ) ( not ( = ?auto_215198 ?auto_215202 ) ) ( not ( = ?auto_215198 ?auto_215203 ) ) ( not ( = ?auto_215198 ?auto_215204 ) ) ( not ( = ?auto_215198 ?auto_215205 ) ) ( not ( = ?auto_215198 ?auto_215206 ) ) ( not ( = ?auto_215199 ?auto_215200 ) ) ( not ( = ?auto_215199 ?auto_215201 ) ) ( not ( = ?auto_215199 ?auto_215202 ) ) ( not ( = ?auto_215199 ?auto_215203 ) ) ( not ( = ?auto_215199 ?auto_215204 ) ) ( not ( = ?auto_215199 ?auto_215205 ) ) ( not ( = ?auto_215199 ?auto_215206 ) ) ( not ( = ?auto_215200 ?auto_215201 ) ) ( not ( = ?auto_215200 ?auto_215202 ) ) ( not ( = ?auto_215200 ?auto_215203 ) ) ( not ( = ?auto_215200 ?auto_215204 ) ) ( not ( = ?auto_215200 ?auto_215205 ) ) ( not ( = ?auto_215200 ?auto_215206 ) ) ( not ( = ?auto_215201 ?auto_215202 ) ) ( not ( = ?auto_215201 ?auto_215203 ) ) ( not ( = ?auto_215201 ?auto_215204 ) ) ( not ( = ?auto_215201 ?auto_215205 ) ) ( not ( = ?auto_215201 ?auto_215206 ) ) ( not ( = ?auto_215202 ?auto_215203 ) ) ( not ( = ?auto_215202 ?auto_215204 ) ) ( not ( = ?auto_215202 ?auto_215205 ) ) ( not ( = ?auto_215202 ?auto_215206 ) ) ( not ( = ?auto_215203 ?auto_215204 ) ) ( not ( = ?auto_215203 ?auto_215205 ) ) ( not ( = ?auto_215203 ?auto_215206 ) ) ( not ( = ?auto_215204 ?auto_215205 ) ) ( not ( = ?auto_215204 ?auto_215206 ) ) ( not ( = ?auto_215205 ?auto_215206 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_215205 ?auto_215206 )
      ( !STACK ?auto_215205 ?auto_215204 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_215220 - BLOCK
      ?auto_215221 - BLOCK
      ?auto_215222 - BLOCK
      ?auto_215223 - BLOCK
      ?auto_215224 - BLOCK
      ?auto_215225 - BLOCK
      ?auto_215226 - BLOCK
      ?auto_215227 - BLOCK
      ?auto_215228 - BLOCK
      ?auto_215229 - BLOCK
      ?auto_215230 - BLOCK
      ?auto_215231 - BLOCK
      ?auto_215232 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_215231 ) ( ON-TABLE ?auto_215232 ) ( CLEAR ?auto_215232 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_215220 ) ( ON ?auto_215221 ?auto_215220 ) ( ON ?auto_215222 ?auto_215221 ) ( ON ?auto_215223 ?auto_215222 ) ( ON ?auto_215224 ?auto_215223 ) ( ON ?auto_215225 ?auto_215224 ) ( ON ?auto_215226 ?auto_215225 ) ( ON ?auto_215227 ?auto_215226 ) ( ON ?auto_215228 ?auto_215227 ) ( ON ?auto_215229 ?auto_215228 ) ( ON ?auto_215230 ?auto_215229 ) ( ON ?auto_215231 ?auto_215230 ) ( not ( = ?auto_215220 ?auto_215221 ) ) ( not ( = ?auto_215220 ?auto_215222 ) ) ( not ( = ?auto_215220 ?auto_215223 ) ) ( not ( = ?auto_215220 ?auto_215224 ) ) ( not ( = ?auto_215220 ?auto_215225 ) ) ( not ( = ?auto_215220 ?auto_215226 ) ) ( not ( = ?auto_215220 ?auto_215227 ) ) ( not ( = ?auto_215220 ?auto_215228 ) ) ( not ( = ?auto_215220 ?auto_215229 ) ) ( not ( = ?auto_215220 ?auto_215230 ) ) ( not ( = ?auto_215220 ?auto_215231 ) ) ( not ( = ?auto_215220 ?auto_215232 ) ) ( not ( = ?auto_215221 ?auto_215222 ) ) ( not ( = ?auto_215221 ?auto_215223 ) ) ( not ( = ?auto_215221 ?auto_215224 ) ) ( not ( = ?auto_215221 ?auto_215225 ) ) ( not ( = ?auto_215221 ?auto_215226 ) ) ( not ( = ?auto_215221 ?auto_215227 ) ) ( not ( = ?auto_215221 ?auto_215228 ) ) ( not ( = ?auto_215221 ?auto_215229 ) ) ( not ( = ?auto_215221 ?auto_215230 ) ) ( not ( = ?auto_215221 ?auto_215231 ) ) ( not ( = ?auto_215221 ?auto_215232 ) ) ( not ( = ?auto_215222 ?auto_215223 ) ) ( not ( = ?auto_215222 ?auto_215224 ) ) ( not ( = ?auto_215222 ?auto_215225 ) ) ( not ( = ?auto_215222 ?auto_215226 ) ) ( not ( = ?auto_215222 ?auto_215227 ) ) ( not ( = ?auto_215222 ?auto_215228 ) ) ( not ( = ?auto_215222 ?auto_215229 ) ) ( not ( = ?auto_215222 ?auto_215230 ) ) ( not ( = ?auto_215222 ?auto_215231 ) ) ( not ( = ?auto_215222 ?auto_215232 ) ) ( not ( = ?auto_215223 ?auto_215224 ) ) ( not ( = ?auto_215223 ?auto_215225 ) ) ( not ( = ?auto_215223 ?auto_215226 ) ) ( not ( = ?auto_215223 ?auto_215227 ) ) ( not ( = ?auto_215223 ?auto_215228 ) ) ( not ( = ?auto_215223 ?auto_215229 ) ) ( not ( = ?auto_215223 ?auto_215230 ) ) ( not ( = ?auto_215223 ?auto_215231 ) ) ( not ( = ?auto_215223 ?auto_215232 ) ) ( not ( = ?auto_215224 ?auto_215225 ) ) ( not ( = ?auto_215224 ?auto_215226 ) ) ( not ( = ?auto_215224 ?auto_215227 ) ) ( not ( = ?auto_215224 ?auto_215228 ) ) ( not ( = ?auto_215224 ?auto_215229 ) ) ( not ( = ?auto_215224 ?auto_215230 ) ) ( not ( = ?auto_215224 ?auto_215231 ) ) ( not ( = ?auto_215224 ?auto_215232 ) ) ( not ( = ?auto_215225 ?auto_215226 ) ) ( not ( = ?auto_215225 ?auto_215227 ) ) ( not ( = ?auto_215225 ?auto_215228 ) ) ( not ( = ?auto_215225 ?auto_215229 ) ) ( not ( = ?auto_215225 ?auto_215230 ) ) ( not ( = ?auto_215225 ?auto_215231 ) ) ( not ( = ?auto_215225 ?auto_215232 ) ) ( not ( = ?auto_215226 ?auto_215227 ) ) ( not ( = ?auto_215226 ?auto_215228 ) ) ( not ( = ?auto_215226 ?auto_215229 ) ) ( not ( = ?auto_215226 ?auto_215230 ) ) ( not ( = ?auto_215226 ?auto_215231 ) ) ( not ( = ?auto_215226 ?auto_215232 ) ) ( not ( = ?auto_215227 ?auto_215228 ) ) ( not ( = ?auto_215227 ?auto_215229 ) ) ( not ( = ?auto_215227 ?auto_215230 ) ) ( not ( = ?auto_215227 ?auto_215231 ) ) ( not ( = ?auto_215227 ?auto_215232 ) ) ( not ( = ?auto_215228 ?auto_215229 ) ) ( not ( = ?auto_215228 ?auto_215230 ) ) ( not ( = ?auto_215228 ?auto_215231 ) ) ( not ( = ?auto_215228 ?auto_215232 ) ) ( not ( = ?auto_215229 ?auto_215230 ) ) ( not ( = ?auto_215229 ?auto_215231 ) ) ( not ( = ?auto_215229 ?auto_215232 ) ) ( not ( = ?auto_215230 ?auto_215231 ) ) ( not ( = ?auto_215230 ?auto_215232 ) ) ( not ( = ?auto_215231 ?auto_215232 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_215232 )
      ( !STACK ?auto_215232 ?auto_215231 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_215246 - BLOCK
      ?auto_215247 - BLOCK
      ?auto_215248 - BLOCK
      ?auto_215249 - BLOCK
      ?auto_215250 - BLOCK
      ?auto_215251 - BLOCK
      ?auto_215252 - BLOCK
      ?auto_215253 - BLOCK
      ?auto_215254 - BLOCK
      ?auto_215255 - BLOCK
      ?auto_215256 - BLOCK
      ?auto_215257 - BLOCK
      ?auto_215258 - BLOCK
    )
    :vars
    (
      ?auto_215259 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_215258 ?auto_215259 ) ( ON-TABLE ?auto_215246 ) ( ON ?auto_215247 ?auto_215246 ) ( ON ?auto_215248 ?auto_215247 ) ( ON ?auto_215249 ?auto_215248 ) ( ON ?auto_215250 ?auto_215249 ) ( ON ?auto_215251 ?auto_215250 ) ( ON ?auto_215252 ?auto_215251 ) ( ON ?auto_215253 ?auto_215252 ) ( ON ?auto_215254 ?auto_215253 ) ( ON ?auto_215255 ?auto_215254 ) ( ON ?auto_215256 ?auto_215255 ) ( not ( = ?auto_215246 ?auto_215247 ) ) ( not ( = ?auto_215246 ?auto_215248 ) ) ( not ( = ?auto_215246 ?auto_215249 ) ) ( not ( = ?auto_215246 ?auto_215250 ) ) ( not ( = ?auto_215246 ?auto_215251 ) ) ( not ( = ?auto_215246 ?auto_215252 ) ) ( not ( = ?auto_215246 ?auto_215253 ) ) ( not ( = ?auto_215246 ?auto_215254 ) ) ( not ( = ?auto_215246 ?auto_215255 ) ) ( not ( = ?auto_215246 ?auto_215256 ) ) ( not ( = ?auto_215246 ?auto_215257 ) ) ( not ( = ?auto_215246 ?auto_215258 ) ) ( not ( = ?auto_215246 ?auto_215259 ) ) ( not ( = ?auto_215247 ?auto_215248 ) ) ( not ( = ?auto_215247 ?auto_215249 ) ) ( not ( = ?auto_215247 ?auto_215250 ) ) ( not ( = ?auto_215247 ?auto_215251 ) ) ( not ( = ?auto_215247 ?auto_215252 ) ) ( not ( = ?auto_215247 ?auto_215253 ) ) ( not ( = ?auto_215247 ?auto_215254 ) ) ( not ( = ?auto_215247 ?auto_215255 ) ) ( not ( = ?auto_215247 ?auto_215256 ) ) ( not ( = ?auto_215247 ?auto_215257 ) ) ( not ( = ?auto_215247 ?auto_215258 ) ) ( not ( = ?auto_215247 ?auto_215259 ) ) ( not ( = ?auto_215248 ?auto_215249 ) ) ( not ( = ?auto_215248 ?auto_215250 ) ) ( not ( = ?auto_215248 ?auto_215251 ) ) ( not ( = ?auto_215248 ?auto_215252 ) ) ( not ( = ?auto_215248 ?auto_215253 ) ) ( not ( = ?auto_215248 ?auto_215254 ) ) ( not ( = ?auto_215248 ?auto_215255 ) ) ( not ( = ?auto_215248 ?auto_215256 ) ) ( not ( = ?auto_215248 ?auto_215257 ) ) ( not ( = ?auto_215248 ?auto_215258 ) ) ( not ( = ?auto_215248 ?auto_215259 ) ) ( not ( = ?auto_215249 ?auto_215250 ) ) ( not ( = ?auto_215249 ?auto_215251 ) ) ( not ( = ?auto_215249 ?auto_215252 ) ) ( not ( = ?auto_215249 ?auto_215253 ) ) ( not ( = ?auto_215249 ?auto_215254 ) ) ( not ( = ?auto_215249 ?auto_215255 ) ) ( not ( = ?auto_215249 ?auto_215256 ) ) ( not ( = ?auto_215249 ?auto_215257 ) ) ( not ( = ?auto_215249 ?auto_215258 ) ) ( not ( = ?auto_215249 ?auto_215259 ) ) ( not ( = ?auto_215250 ?auto_215251 ) ) ( not ( = ?auto_215250 ?auto_215252 ) ) ( not ( = ?auto_215250 ?auto_215253 ) ) ( not ( = ?auto_215250 ?auto_215254 ) ) ( not ( = ?auto_215250 ?auto_215255 ) ) ( not ( = ?auto_215250 ?auto_215256 ) ) ( not ( = ?auto_215250 ?auto_215257 ) ) ( not ( = ?auto_215250 ?auto_215258 ) ) ( not ( = ?auto_215250 ?auto_215259 ) ) ( not ( = ?auto_215251 ?auto_215252 ) ) ( not ( = ?auto_215251 ?auto_215253 ) ) ( not ( = ?auto_215251 ?auto_215254 ) ) ( not ( = ?auto_215251 ?auto_215255 ) ) ( not ( = ?auto_215251 ?auto_215256 ) ) ( not ( = ?auto_215251 ?auto_215257 ) ) ( not ( = ?auto_215251 ?auto_215258 ) ) ( not ( = ?auto_215251 ?auto_215259 ) ) ( not ( = ?auto_215252 ?auto_215253 ) ) ( not ( = ?auto_215252 ?auto_215254 ) ) ( not ( = ?auto_215252 ?auto_215255 ) ) ( not ( = ?auto_215252 ?auto_215256 ) ) ( not ( = ?auto_215252 ?auto_215257 ) ) ( not ( = ?auto_215252 ?auto_215258 ) ) ( not ( = ?auto_215252 ?auto_215259 ) ) ( not ( = ?auto_215253 ?auto_215254 ) ) ( not ( = ?auto_215253 ?auto_215255 ) ) ( not ( = ?auto_215253 ?auto_215256 ) ) ( not ( = ?auto_215253 ?auto_215257 ) ) ( not ( = ?auto_215253 ?auto_215258 ) ) ( not ( = ?auto_215253 ?auto_215259 ) ) ( not ( = ?auto_215254 ?auto_215255 ) ) ( not ( = ?auto_215254 ?auto_215256 ) ) ( not ( = ?auto_215254 ?auto_215257 ) ) ( not ( = ?auto_215254 ?auto_215258 ) ) ( not ( = ?auto_215254 ?auto_215259 ) ) ( not ( = ?auto_215255 ?auto_215256 ) ) ( not ( = ?auto_215255 ?auto_215257 ) ) ( not ( = ?auto_215255 ?auto_215258 ) ) ( not ( = ?auto_215255 ?auto_215259 ) ) ( not ( = ?auto_215256 ?auto_215257 ) ) ( not ( = ?auto_215256 ?auto_215258 ) ) ( not ( = ?auto_215256 ?auto_215259 ) ) ( not ( = ?auto_215257 ?auto_215258 ) ) ( not ( = ?auto_215257 ?auto_215259 ) ) ( not ( = ?auto_215258 ?auto_215259 ) ) ( CLEAR ?auto_215256 ) ( ON ?auto_215257 ?auto_215258 ) ( CLEAR ?auto_215257 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_215246 ?auto_215247 ?auto_215248 ?auto_215249 ?auto_215250 ?auto_215251 ?auto_215252 ?auto_215253 ?auto_215254 ?auto_215255 ?auto_215256 ?auto_215257 )
      ( MAKE-13PILE ?auto_215246 ?auto_215247 ?auto_215248 ?auto_215249 ?auto_215250 ?auto_215251 ?auto_215252 ?auto_215253 ?auto_215254 ?auto_215255 ?auto_215256 ?auto_215257 ?auto_215258 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_215273 - BLOCK
      ?auto_215274 - BLOCK
      ?auto_215275 - BLOCK
      ?auto_215276 - BLOCK
      ?auto_215277 - BLOCK
      ?auto_215278 - BLOCK
      ?auto_215279 - BLOCK
      ?auto_215280 - BLOCK
      ?auto_215281 - BLOCK
      ?auto_215282 - BLOCK
      ?auto_215283 - BLOCK
      ?auto_215284 - BLOCK
      ?auto_215285 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_215285 ) ( ON-TABLE ?auto_215273 ) ( ON ?auto_215274 ?auto_215273 ) ( ON ?auto_215275 ?auto_215274 ) ( ON ?auto_215276 ?auto_215275 ) ( ON ?auto_215277 ?auto_215276 ) ( ON ?auto_215278 ?auto_215277 ) ( ON ?auto_215279 ?auto_215278 ) ( ON ?auto_215280 ?auto_215279 ) ( ON ?auto_215281 ?auto_215280 ) ( ON ?auto_215282 ?auto_215281 ) ( ON ?auto_215283 ?auto_215282 ) ( not ( = ?auto_215273 ?auto_215274 ) ) ( not ( = ?auto_215273 ?auto_215275 ) ) ( not ( = ?auto_215273 ?auto_215276 ) ) ( not ( = ?auto_215273 ?auto_215277 ) ) ( not ( = ?auto_215273 ?auto_215278 ) ) ( not ( = ?auto_215273 ?auto_215279 ) ) ( not ( = ?auto_215273 ?auto_215280 ) ) ( not ( = ?auto_215273 ?auto_215281 ) ) ( not ( = ?auto_215273 ?auto_215282 ) ) ( not ( = ?auto_215273 ?auto_215283 ) ) ( not ( = ?auto_215273 ?auto_215284 ) ) ( not ( = ?auto_215273 ?auto_215285 ) ) ( not ( = ?auto_215274 ?auto_215275 ) ) ( not ( = ?auto_215274 ?auto_215276 ) ) ( not ( = ?auto_215274 ?auto_215277 ) ) ( not ( = ?auto_215274 ?auto_215278 ) ) ( not ( = ?auto_215274 ?auto_215279 ) ) ( not ( = ?auto_215274 ?auto_215280 ) ) ( not ( = ?auto_215274 ?auto_215281 ) ) ( not ( = ?auto_215274 ?auto_215282 ) ) ( not ( = ?auto_215274 ?auto_215283 ) ) ( not ( = ?auto_215274 ?auto_215284 ) ) ( not ( = ?auto_215274 ?auto_215285 ) ) ( not ( = ?auto_215275 ?auto_215276 ) ) ( not ( = ?auto_215275 ?auto_215277 ) ) ( not ( = ?auto_215275 ?auto_215278 ) ) ( not ( = ?auto_215275 ?auto_215279 ) ) ( not ( = ?auto_215275 ?auto_215280 ) ) ( not ( = ?auto_215275 ?auto_215281 ) ) ( not ( = ?auto_215275 ?auto_215282 ) ) ( not ( = ?auto_215275 ?auto_215283 ) ) ( not ( = ?auto_215275 ?auto_215284 ) ) ( not ( = ?auto_215275 ?auto_215285 ) ) ( not ( = ?auto_215276 ?auto_215277 ) ) ( not ( = ?auto_215276 ?auto_215278 ) ) ( not ( = ?auto_215276 ?auto_215279 ) ) ( not ( = ?auto_215276 ?auto_215280 ) ) ( not ( = ?auto_215276 ?auto_215281 ) ) ( not ( = ?auto_215276 ?auto_215282 ) ) ( not ( = ?auto_215276 ?auto_215283 ) ) ( not ( = ?auto_215276 ?auto_215284 ) ) ( not ( = ?auto_215276 ?auto_215285 ) ) ( not ( = ?auto_215277 ?auto_215278 ) ) ( not ( = ?auto_215277 ?auto_215279 ) ) ( not ( = ?auto_215277 ?auto_215280 ) ) ( not ( = ?auto_215277 ?auto_215281 ) ) ( not ( = ?auto_215277 ?auto_215282 ) ) ( not ( = ?auto_215277 ?auto_215283 ) ) ( not ( = ?auto_215277 ?auto_215284 ) ) ( not ( = ?auto_215277 ?auto_215285 ) ) ( not ( = ?auto_215278 ?auto_215279 ) ) ( not ( = ?auto_215278 ?auto_215280 ) ) ( not ( = ?auto_215278 ?auto_215281 ) ) ( not ( = ?auto_215278 ?auto_215282 ) ) ( not ( = ?auto_215278 ?auto_215283 ) ) ( not ( = ?auto_215278 ?auto_215284 ) ) ( not ( = ?auto_215278 ?auto_215285 ) ) ( not ( = ?auto_215279 ?auto_215280 ) ) ( not ( = ?auto_215279 ?auto_215281 ) ) ( not ( = ?auto_215279 ?auto_215282 ) ) ( not ( = ?auto_215279 ?auto_215283 ) ) ( not ( = ?auto_215279 ?auto_215284 ) ) ( not ( = ?auto_215279 ?auto_215285 ) ) ( not ( = ?auto_215280 ?auto_215281 ) ) ( not ( = ?auto_215280 ?auto_215282 ) ) ( not ( = ?auto_215280 ?auto_215283 ) ) ( not ( = ?auto_215280 ?auto_215284 ) ) ( not ( = ?auto_215280 ?auto_215285 ) ) ( not ( = ?auto_215281 ?auto_215282 ) ) ( not ( = ?auto_215281 ?auto_215283 ) ) ( not ( = ?auto_215281 ?auto_215284 ) ) ( not ( = ?auto_215281 ?auto_215285 ) ) ( not ( = ?auto_215282 ?auto_215283 ) ) ( not ( = ?auto_215282 ?auto_215284 ) ) ( not ( = ?auto_215282 ?auto_215285 ) ) ( not ( = ?auto_215283 ?auto_215284 ) ) ( not ( = ?auto_215283 ?auto_215285 ) ) ( not ( = ?auto_215284 ?auto_215285 ) ) ( CLEAR ?auto_215283 ) ( ON ?auto_215284 ?auto_215285 ) ( CLEAR ?auto_215284 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_215273 ?auto_215274 ?auto_215275 ?auto_215276 ?auto_215277 ?auto_215278 ?auto_215279 ?auto_215280 ?auto_215281 ?auto_215282 ?auto_215283 ?auto_215284 )
      ( MAKE-13PILE ?auto_215273 ?auto_215274 ?auto_215275 ?auto_215276 ?auto_215277 ?auto_215278 ?auto_215279 ?auto_215280 ?auto_215281 ?auto_215282 ?auto_215283 ?auto_215284 ?auto_215285 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_215299 - BLOCK
      ?auto_215300 - BLOCK
      ?auto_215301 - BLOCK
      ?auto_215302 - BLOCK
      ?auto_215303 - BLOCK
      ?auto_215304 - BLOCK
      ?auto_215305 - BLOCK
      ?auto_215306 - BLOCK
      ?auto_215307 - BLOCK
      ?auto_215308 - BLOCK
      ?auto_215309 - BLOCK
      ?auto_215310 - BLOCK
      ?auto_215311 - BLOCK
    )
    :vars
    (
      ?auto_215312 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_215311 ?auto_215312 ) ( ON-TABLE ?auto_215299 ) ( ON ?auto_215300 ?auto_215299 ) ( ON ?auto_215301 ?auto_215300 ) ( ON ?auto_215302 ?auto_215301 ) ( ON ?auto_215303 ?auto_215302 ) ( ON ?auto_215304 ?auto_215303 ) ( ON ?auto_215305 ?auto_215304 ) ( ON ?auto_215306 ?auto_215305 ) ( ON ?auto_215307 ?auto_215306 ) ( ON ?auto_215308 ?auto_215307 ) ( not ( = ?auto_215299 ?auto_215300 ) ) ( not ( = ?auto_215299 ?auto_215301 ) ) ( not ( = ?auto_215299 ?auto_215302 ) ) ( not ( = ?auto_215299 ?auto_215303 ) ) ( not ( = ?auto_215299 ?auto_215304 ) ) ( not ( = ?auto_215299 ?auto_215305 ) ) ( not ( = ?auto_215299 ?auto_215306 ) ) ( not ( = ?auto_215299 ?auto_215307 ) ) ( not ( = ?auto_215299 ?auto_215308 ) ) ( not ( = ?auto_215299 ?auto_215309 ) ) ( not ( = ?auto_215299 ?auto_215310 ) ) ( not ( = ?auto_215299 ?auto_215311 ) ) ( not ( = ?auto_215299 ?auto_215312 ) ) ( not ( = ?auto_215300 ?auto_215301 ) ) ( not ( = ?auto_215300 ?auto_215302 ) ) ( not ( = ?auto_215300 ?auto_215303 ) ) ( not ( = ?auto_215300 ?auto_215304 ) ) ( not ( = ?auto_215300 ?auto_215305 ) ) ( not ( = ?auto_215300 ?auto_215306 ) ) ( not ( = ?auto_215300 ?auto_215307 ) ) ( not ( = ?auto_215300 ?auto_215308 ) ) ( not ( = ?auto_215300 ?auto_215309 ) ) ( not ( = ?auto_215300 ?auto_215310 ) ) ( not ( = ?auto_215300 ?auto_215311 ) ) ( not ( = ?auto_215300 ?auto_215312 ) ) ( not ( = ?auto_215301 ?auto_215302 ) ) ( not ( = ?auto_215301 ?auto_215303 ) ) ( not ( = ?auto_215301 ?auto_215304 ) ) ( not ( = ?auto_215301 ?auto_215305 ) ) ( not ( = ?auto_215301 ?auto_215306 ) ) ( not ( = ?auto_215301 ?auto_215307 ) ) ( not ( = ?auto_215301 ?auto_215308 ) ) ( not ( = ?auto_215301 ?auto_215309 ) ) ( not ( = ?auto_215301 ?auto_215310 ) ) ( not ( = ?auto_215301 ?auto_215311 ) ) ( not ( = ?auto_215301 ?auto_215312 ) ) ( not ( = ?auto_215302 ?auto_215303 ) ) ( not ( = ?auto_215302 ?auto_215304 ) ) ( not ( = ?auto_215302 ?auto_215305 ) ) ( not ( = ?auto_215302 ?auto_215306 ) ) ( not ( = ?auto_215302 ?auto_215307 ) ) ( not ( = ?auto_215302 ?auto_215308 ) ) ( not ( = ?auto_215302 ?auto_215309 ) ) ( not ( = ?auto_215302 ?auto_215310 ) ) ( not ( = ?auto_215302 ?auto_215311 ) ) ( not ( = ?auto_215302 ?auto_215312 ) ) ( not ( = ?auto_215303 ?auto_215304 ) ) ( not ( = ?auto_215303 ?auto_215305 ) ) ( not ( = ?auto_215303 ?auto_215306 ) ) ( not ( = ?auto_215303 ?auto_215307 ) ) ( not ( = ?auto_215303 ?auto_215308 ) ) ( not ( = ?auto_215303 ?auto_215309 ) ) ( not ( = ?auto_215303 ?auto_215310 ) ) ( not ( = ?auto_215303 ?auto_215311 ) ) ( not ( = ?auto_215303 ?auto_215312 ) ) ( not ( = ?auto_215304 ?auto_215305 ) ) ( not ( = ?auto_215304 ?auto_215306 ) ) ( not ( = ?auto_215304 ?auto_215307 ) ) ( not ( = ?auto_215304 ?auto_215308 ) ) ( not ( = ?auto_215304 ?auto_215309 ) ) ( not ( = ?auto_215304 ?auto_215310 ) ) ( not ( = ?auto_215304 ?auto_215311 ) ) ( not ( = ?auto_215304 ?auto_215312 ) ) ( not ( = ?auto_215305 ?auto_215306 ) ) ( not ( = ?auto_215305 ?auto_215307 ) ) ( not ( = ?auto_215305 ?auto_215308 ) ) ( not ( = ?auto_215305 ?auto_215309 ) ) ( not ( = ?auto_215305 ?auto_215310 ) ) ( not ( = ?auto_215305 ?auto_215311 ) ) ( not ( = ?auto_215305 ?auto_215312 ) ) ( not ( = ?auto_215306 ?auto_215307 ) ) ( not ( = ?auto_215306 ?auto_215308 ) ) ( not ( = ?auto_215306 ?auto_215309 ) ) ( not ( = ?auto_215306 ?auto_215310 ) ) ( not ( = ?auto_215306 ?auto_215311 ) ) ( not ( = ?auto_215306 ?auto_215312 ) ) ( not ( = ?auto_215307 ?auto_215308 ) ) ( not ( = ?auto_215307 ?auto_215309 ) ) ( not ( = ?auto_215307 ?auto_215310 ) ) ( not ( = ?auto_215307 ?auto_215311 ) ) ( not ( = ?auto_215307 ?auto_215312 ) ) ( not ( = ?auto_215308 ?auto_215309 ) ) ( not ( = ?auto_215308 ?auto_215310 ) ) ( not ( = ?auto_215308 ?auto_215311 ) ) ( not ( = ?auto_215308 ?auto_215312 ) ) ( not ( = ?auto_215309 ?auto_215310 ) ) ( not ( = ?auto_215309 ?auto_215311 ) ) ( not ( = ?auto_215309 ?auto_215312 ) ) ( not ( = ?auto_215310 ?auto_215311 ) ) ( not ( = ?auto_215310 ?auto_215312 ) ) ( not ( = ?auto_215311 ?auto_215312 ) ) ( ON ?auto_215310 ?auto_215311 ) ( CLEAR ?auto_215308 ) ( ON ?auto_215309 ?auto_215310 ) ( CLEAR ?auto_215309 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_215299 ?auto_215300 ?auto_215301 ?auto_215302 ?auto_215303 ?auto_215304 ?auto_215305 ?auto_215306 ?auto_215307 ?auto_215308 ?auto_215309 )
      ( MAKE-13PILE ?auto_215299 ?auto_215300 ?auto_215301 ?auto_215302 ?auto_215303 ?auto_215304 ?auto_215305 ?auto_215306 ?auto_215307 ?auto_215308 ?auto_215309 ?auto_215310 ?auto_215311 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_215326 - BLOCK
      ?auto_215327 - BLOCK
      ?auto_215328 - BLOCK
      ?auto_215329 - BLOCK
      ?auto_215330 - BLOCK
      ?auto_215331 - BLOCK
      ?auto_215332 - BLOCK
      ?auto_215333 - BLOCK
      ?auto_215334 - BLOCK
      ?auto_215335 - BLOCK
      ?auto_215336 - BLOCK
      ?auto_215337 - BLOCK
      ?auto_215338 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_215338 ) ( ON-TABLE ?auto_215326 ) ( ON ?auto_215327 ?auto_215326 ) ( ON ?auto_215328 ?auto_215327 ) ( ON ?auto_215329 ?auto_215328 ) ( ON ?auto_215330 ?auto_215329 ) ( ON ?auto_215331 ?auto_215330 ) ( ON ?auto_215332 ?auto_215331 ) ( ON ?auto_215333 ?auto_215332 ) ( ON ?auto_215334 ?auto_215333 ) ( ON ?auto_215335 ?auto_215334 ) ( not ( = ?auto_215326 ?auto_215327 ) ) ( not ( = ?auto_215326 ?auto_215328 ) ) ( not ( = ?auto_215326 ?auto_215329 ) ) ( not ( = ?auto_215326 ?auto_215330 ) ) ( not ( = ?auto_215326 ?auto_215331 ) ) ( not ( = ?auto_215326 ?auto_215332 ) ) ( not ( = ?auto_215326 ?auto_215333 ) ) ( not ( = ?auto_215326 ?auto_215334 ) ) ( not ( = ?auto_215326 ?auto_215335 ) ) ( not ( = ?auto_215326 ?auto_215336 ) ) ( not ( = ?auto_215326 ?auto_215337 ) ) ( not ( = ?auto_215326 ?auto_215338 ) ) ( not ( = ?auto_215327 ?auto_215328 ) ) ( not ( = ?auto_215327 ?auto_215329 ) ) ( not ( = ?auto_215327 ?auto_215330 ) ) ( not ( = ?auto_215327 ?auto_215331 ) ) ( not ( = ?auto_215327 ?auto_215332 ) ) ( not ( = ?auto_215327 ?auto_215333 ) ) ( not ( = ?auto_215327 ?auto_215334 ) ) ( not ( = ?auto_215327 ?auto_215335 ) ) ( not ( = ?auto_215327 ?auto_215336 ) ) ( not ( = ?auto_215327 ?auto_215337 ) ) ( not ( = ?auto_215327 ?auto_215338 ) ) ( not ( = ?auto_215328 ?auto_215329 ) ) ( not ( = ?auto_215328 ?auto_215330 ) ) ( not ( = ?auto_215328 ?auto_215331 ) ) ( not ( = ?auto_215328 ?auto_215332 ) ) ( not ( = ?auto_215328 ?auto_215333 ) ) ( not ( = ?auto_215328 ?auto_215334 ) ) ( not ( = ?auto_215328 ?auto_215335 ) ) ( not ( = ?auto_215328 ?auto_215336 ) ) ( not ( = ?auto_215328 ?auto_215337 ) ) ( not ( = ?auto_215328 ?auto_215338 ) ) ( not ( = ?auto_215329 ?auto_215330 ) ) ( not ( = ?auto_215329 ?auto_215331 ) ) ( not ( = ?auto_215329 ?auto_215332 ) ) ( not ( = ?auto_215329 ?auto_215333 ) ) ( not ( = ?auto_215329 ?auto_215334 ) ) ( not ( = ?auto_215329 ?auto_215335 ) ) ( not ( = ?auto_215329 ?auto_215336 ) ) ( not ( = ?auto_215329 ?auto_215337 ) ) ( not ( = ?auto_215329 ?auto_215338 ) ) ( not ( = ?auto_215330 ?auto_215331 ) ) ( not ( = ?auto_215330 ?auto_215332 ) ) ( not ( = ?auto_215330 ?auto_215333 ) ) ( not ( = ?auto_215330 ?auto_215334 ) ) ( not ( = ?auto_215330 ?auto_215335 ) ) ( not ( = ?auto_215330 ?auto_215336 ) ) ( not ( = ?auto_215330 ?auto_215337 ) ) ( not ( = ?auto_215330 ?auto_215338 ) ) ( not ( = ?auto_215331 ?auto_215332 ) ) ( not ( = ?auto_215331 ?auto_215333 ) ) ( not ( = ?auto_215331 ?auto_215334 ) ) ( not ( = ?auto_215331 ?auto_215335 ) ) ( not ( = ?auto_215331 ?auto_215336 ) ) ( not ( = ?auto_215331 ?auto_215337 ) ) ( not ( = ?auto_215331 ?auto_215338 ) ) ( not ( = ?auto_215332 ?auto_215333 ) ) ( not ( = ?auto_215332 ?auto_215334 ) ) ( not ( = ?auto_215332 ?auto_215335 ) ) ( not ( = ?auto_215332 ?auto_215336 ) ) ( not ( = ?auto_215332 ?auto_215337 ) ) ( not ( = ?auto_215332 ?auto_215338 ) ) ( not ( = ?auto_215333 ?auto_215334 ) ) ( not ( = ?auto_215333 ?auto_215335 ) ) ( not ( = ?auto_215333 ?auto_215336 ) ) ( not ( = ?auto_215333 ?auto_215337 ) ) ( not ( = ?auto_215333 ?auto_215338 ) ) ( not ( = ?auto_215334 ?auto_215335 ) ) ( not ( = ?auto_215334 ?auto_215336 ) ) ( not ( = ?auto_215334 ?auto_215337 ) ) ( not ( = ?auto_215334 ?auto_215338 ) ) ( not ( = ?auto_215335 ?auto_215336 ) ) ( not ( = ?auto_215335 ?auto_215337 ) ) ( not ( = ?auto_215335 ?auto_215338 ) ) ( not ( = ?auto_215336 ?auto_215337 ) ) ( not ( = ?auto_215336 ?auto_215338 ) ) ( not ( = ?auto_215337 ?auto_215338 ) ) ( ON ?auto_215337 ?auto_215338 ) ( CLEAR ?auto_215335 ) ( ON ?auto_215336 ?auto_215337 ) ( CLEAR ?auto_215336 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_215326 ?auto_215327 ?auto_215328 ?auto_215329 ?auto_215330 ?auto_215331 ?auto_215332 ?auto_215333 ?auto_215334 ?auto_215335 ?auto_215336 )
      ( MAKE-13PILE ?auto_215326 ?auto_215327 ?auto_215328 ?auto_215329 ?auto_215330 ?auto_215331 ?auto_215332 ?auto_215333 ?auto_215334 ?auto_215335 ?auto_215336 ?auto_215337 ?auto_215338 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_215352 - BLOCK
      ?auto_215353 - BLOCK
      ?auto_215354 - BLOCK
      ?auto_215355 - BLOCK
      ?auto_215356 - BLOCK
      ?auto_215357 - BLOCK
      ?auto_215358 - BLOCK
      ?auto_215359 - BLOCK
      ?auto_215360 - BLOCK
      ?auto_215361 - BLOCK
      ?auto_215362 - BLOCK
      ?auto_215363 - BLOCK
      ?auto_215364 - BLOCK
    )
    :vars
    (
      ?auto_215365 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_215364 ?auto_215365 ) ( ON-TABLE ?auto_215352 ) ( ON ?auto_215353 ?auto_215352 ) ( ON ?auto_215354 ?auto_215353 ) ( ON ?auto_215355 ?auto_215354 ) ( ON ?auto_215356 ?auto_215355 ) ( ON ?auto_215357 ?auto_215356 ) ( ON ?auto_215358 ?auto_215357 ) ( ON ?auto_215359 ?auto_215358 ) ( ON ?auto_215360 ?auto_215359 ) ( not ( = ?auto_215352 ?auto_215353 ) ) ( not ( = ?auto_215352 ?auto_215354 ) ) ( not ( = ?auto_215352 ?auto_215355 ) ) ( not ( = ?auto_215352 ?auto_215356 ) ) ( not ( = ?auto_215352 ?auto_215357 ) ) ( not ( = ?auto_215352 ?auto_215358 ) ) ( not ( = ?auto_215352 ?auto_215359 ) ) ( not ( = ?auto_215352 ?auto_215360 ) ) ( not ( = ?auto_215352 ?auto_215361 ) ) ( not ( = ?auto_215352 ?auto_215362 ) ) ( not ( = ?auto_215352 ?auto_215363 ) ) ( not ( = ?auto_215352 ?auto_215364 ) ) ( not ( = ?auto_215352 ?auto_215365 ) ) ( not ( = ?auto_215353 ?auto_215354 ) ) ( not ( = ?auto_215353 ?auto_215355 ) ) ( not ( = ?auto_215353 ?auto_215356 ) ) ( not ( = ?auto_215353 ?auto_215357 ) ) ( not ( = ?auto_215353 ?auto_215358 ) ) ( not ( = ?auto_215353 ?auto_215359 ) ) ( not ( = ?auto_215353 ?auto_215360 ) ) ( not ( = ?auto_215353 ?auto_215361 ) ) ( not ( = ?auto_215353 ?auto_215362 ) ) ( not ( = ?auto_215353 ?auto_215363 ) ) ( not ( = ?auto_215353 ?auto_215364 ) ) ( not ( = ?auto_215353 ?auto_215365 ) ) ( not ( = ?auto_215354 ?auto_215355 ) ) ( not ( = ?auto_215354 ?auto_215356 ) ) ( not ( = ?auto_215354 ?auto_215357 ) ) ( not ( = ?auto_215354 ?auto_215358 ) ) ( not ( = ?auto_215354 ?auto_215359 ) ) ( not ( = ?auto_215354 ?auto_215360 ) ) ( not ( = ?auto_215354 ?auto_215361 ) ) ( not ( = ?auto_215354 ?auto_215362 ) ) ( not ( = ?auto_215354 ?auto_215363 ) ) ( not ( = ?auto_215354 ?auto_215364 ) ) ( not ( = ?auto_215354 ?auto_215365 ) ) ( not ( = ?auto_215355 ?auto_215356 ) ) ( not ( = ?auto_215355 ?auto_215357 ) ) ( not ( = ?auto_215355 ?auto_215358 ) ) ( not ( = ?auto_215355 ?auto_215359 ) ) ( not ( = ?auto_215355 ?auto_215360 ) ) ( not ( = ?auto_215355 ?auto_215361 ) ) ( not ( = ?auto_215355 ?auto_215362 ) ) ( not ( = ?auto_215355 ?auto_215363 ) ) ( not ( = ?auto_215355 ?auto_215364 ) ) ( not ( = ?auto_215355 ?auto_215365 ) ) ( not ( = ?auto_215356 ?auto_215357 ) ) ( not ( = ?auto_215356 ?auto_215358 ) ) ( not ( = ?auto_215356 ?auto_215359 ) ) ( not ( = ?auto_215356 ?auto_215360 ) ) ( not ( = ?auto_215356 ?auto_215361 ) ) ( not ( = ?auto_215356 ?auto_215362 ) ) ( not ( = ?auto_215356 ?auto_215363 ) ) ( not ( = ?auto_215356 ?auto_215364 ) ) ( not ( = ?auto_215356 ?auto_215365 ) ) ( not ( = ?auto_215357 ?auto_215358 ) ) ( not ( = ?auto_215357 ?auto_215359 ) ) ( not ( = ?auto_215357 ?auto_215360 ) ) ( not ( = ?auto_215357 ?auto_215361 ) ) ( not ( = ?auto_215357 ?auto_215362 ) ) ( not ( = ?auto_215357 ?auto_215363 ) ) ( not ( = ?auto_215357 ?auto_215364 ) ) ( not ( = ?auto_215357 ?auto_215365 ) ) ( not ( = ?auto_215358 ?auto_215359 ) ) ( not ( = ?auto_215358 ?auto_215360 ) ) ( not ( = ?auto_215358 ?auto_215361 ) ) ( not ( = ?auto_215358 ?auto_215362 ) ) ( not ( = ?auto_215358 ?auto_215363 ) ) ( not ( = ?auto_215358 ?auto_215364 ) ) ( not ( = ?auto_215358 ?auto_215365 ) ) ( not ( = ?auto_215359 ?auto_215360 ) ) ( not ( = ?auto_215359 ?auto_215361 ) ) ( not ( = ?auto_215359 ?auto_215362 ) ) ( not ( = ?auto_215359 ?auto_215363 ) ) ( not ( = ?auto_215359 ?auto_215364 ) ) ( not ( = ?auto_215359 ?auto_215365 ) ) ( not ( = ?auto_215360 ?auto_215361 ) ) ( not ( = ?auto_215360 ?auto_215362 ) ) ( not ( = ?auto_215360 ?auto_215363 ) ) ( not ( = ?auto_215360 ?auto_215364 ) ) ( not ( = ?auto_215360 ?auto_215365 ) ) ( not ( = ?auto_215361 ?auto_215362 ) ) ( not ( = ?auto_215361 ?auto_215363 ) ) ( not ( = ?auto_215361 ?auto_215364 ) ) ( not ( = ?auto_215361 ?auto_215365 ) ) ( not ( = ?auto_215362 ?auto_215363 ) ) ( not ( = ?auto_215362 ?auto_215364 ) ) ( not ( = ?auto_215362 ?auto_215365 ) ) ( not ( = ?auto_215363 ?auto_215364 ) ) ( not ( = ?auto_215363 ?auto_215365 ) ) ( not ( = ?auto_215364 ?auto_215365 ) ) ( ON ?auto_215363 ?auto_215364 ) ( ON ?auto_215362 ?auto_215363 ) ( CLEAR ?auto_215360 ) ( ON ?auto_215361 ?auto_215362 ) ( CLEAR ?auto_215361 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_215352 ?auto_215353 ?auto_215354 ?auto_215355 ?auto_215356 ?auto_215357 ?auto_215358 ?auto_215359 ?auto_215360 ?auto_215361 )
      ( MAKE-13PILE ?auto_215352 ?auto_215353 ?auto_215354 ?auto_215355 ?auto_215356 ?auto_215357 ?auto_215358 ?auto_215359 ?auto_215360 ?auto_215361 ?auto_215362 ?auto_215363 ?auto_215364 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_215379 - BLOCK
      ?auto_215380 - BLOCK
      ?auto_215381 - BLOCK
      ?auto_215382 - BLOCK
      ?auto_215383 - BLOCK
      ?auto_215384 - BLOCK
      ?auto_215385 - BLOCK
      ?auto_215386 - BLOCK
      ?auto_215387 - BLOCK
      ?auto_215388 - BLOCK
      ?auto_215389 - BLOCK
      ?auto_215390 - BLOCK
      ?auto_215391 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_215391 ) ( ON-TABLE ?auto_215379 ) ( ON ?auto_215380 ?auto_215379 ) ( ON ?auto_215381 ?auto_215380 ) ( ON ?auto_215382 ?auto_215381 ) ( ON ?auto_215383 ?auto_215382 ) ( ON ?auto_215384 ?auto_215383 ) ( ON ?auto_215385 ?auto_215384 ) ( ON ?auto_215386 ?auto_215385 ) ( ON ?auto_215387 ?auto_215386 ) ( not ( = ?auto_215379 ?auto_215380 ) ) ( not ( = ?auto_215379 ?auto_215381 ) ) ( not ( = ?auto_215379 ?auto_215382 ) ) ( not ( = ?auto_215379 ?auto_215383 ) ) ( not ( = ?auto_215379 ?auto_215384 ) ) ( not ( = ?auto_215379 ?auto_215385 ) ) ( not ( = ?auto_215379 ?auto_215386 ) ) ( not ( = ?auto_215379 ?auto_215387 ) ) ( not ( = ?auto_215379 ?auto_215388 ) ) ( not ( = ?auto_215379 ?auto_215389 ) ) ( not ( = ?auto_215379 ?auto_215390 ) ) ( not ( = ?auto_215379 ?auto_215391 ) ) ( not ( = ?auto_215380 ?auto_215381 ) ) ( not ( = ?auto_215380 ?auto_215382 ) ) ( not ( = ?auto_215380 ?auto_215383 ) ) ( not ( = ?auto_215380 ?auto_215384 ) ) ( not ( = ?auto_215380 ?auto_215385 ) ) ( not ( = ?auto_215380 ?auto_215386 ) ) ( not ( = ?auto_215380 ?auto_215387 ) ) ( not ( = ?auto_215380 ?auto_215388 ) ) ( not ( = ?auto_215380 ?auto_215389 ) ) ( not ( = ?auto_215380 ?auto_215390 ) ) ( not ( = ?auto_215380 ?auto_215391 ) ) ( not ( = ?auto_215381 ?auto_215382 ) ) ( not ( = ?auto_215381 ?auto_215383 ) ) ( not ( = ?auto_215381 ?auto_215384 ) ) ( not ( = ?auto_215381 ?auto_215385 ) ) ( not ( = ?auto_215381 ?auto_215386 ) ) ( not ( = ?auto_215381 ?auto_215387 ) ) ( not ( = ?auto_215381 ?auto_215388 ) ) ( not ( = ?auto_215381 ?auto_215389 ) ) ( not ( = ?auto_215381 ?auto_215390 ) ) ( not ( = ?auto_215381 ?auto_215391 ) ) ( not ( = ?auto_215382 ?auto_215383 ) ) ( not ( = ?auto_215382 ?auto_215384 ) ) ( not ( = ?auto_215382 ?auto_215385 ) ) ( not ( = ?auto_215382 ?auto_215386 ) ) ( not ( = ?auto_215382 ?auto_215387 ) ) ( not ( = ?auto_215382 ?auto_215388 ) ) ( not ( = ?auto_215382 ?auto_215389 ) ) ( not ( = ?auto_215382 ?auto_215390 ) ) ( not ( = ?auto_215382 ?auto_215391 ) ) ( not ( = ?auto_215383 ?auto_215384 ) ) ( not ( = ?auto_215383 ?auto_215385 ) ) ( not ( = ?auto_215383 ?auto_215386 ) ) ( not ( = ?auto_215383 ?auto_215387 ) ) ( not ( = ?auto_215383 ?auto_215388 ) ) ( not ( = ?auto_215383 ?auto_215389 ) ) ( not ( = ?auto_215383 ?auto_215390 ) ) ( not ( = ?auto_215383 ?auto_215391 ) ) ( not ( = ?auto_215384 ?auto_215385 ) ) ( not ( = ?auto_215384 ?auto_215386 ) ) ( not ( = ?auto_215384 ?auto_215387 ) ) ( not ( = ?auto_215384 ?auto_215388 ) ) ( not ( = ?auto_215384 ?auto_215389 ) ) ( not ( = ?auto_215384 ?auto_215390 ) ) ( not ( = ?auto_215384 ?auto_215391 ) ) ( not ( = ?auto_215385 ?auto_215386 ) ) ( not ( = ?auto_215385 ?auto_215387 ) ) ( not ( = ?auto_215385 ?auto_215388 ) ) ( not ( = ?auto_215385 ?auto_215389 ) ) ( not ( = ?auto_215385 ?auto_215390 ) ) ( not ( = ?auto_215385 ?auto_215391 ) ) ( not ( = ?auto_215386 ?auto_215387 ) ) ( not ( = ?auto_215386 ?auto_215388 ) ) ( not ( = ?auto_215386 ?auto_215389 ) ) ( not ( = ?auto_215386 ?auto_215390 ) ) ( not ( = ?auto_215386 ?auto_215391 ) ) ( not ( = ?auto_215387 ?auto_215388 ) ) ( not ( = ?auto_215387 ?auto_215389 ) ) ( not ( = ?auto_215387 ?auto_215390 ) ) ( not ( = ?auto_215387 ?auto_215391 ) ) ( not ( = ?auto_215388 ?auto_215389 ) ) ( not ( = ?auto_215388 ?auto_215390 ) ) ( not ( = ?auto_215388 ?auto_215391 ) ) ( not ( = ?auto_215389 ?auto_215390 ) ) ( not ( = ?auto_215389 ?auto_215391 ) ) ( not ( = ?auto_215390 ?auto_215391 ) ) ( ON ?auto_215390 ?auto_215391 ) ( ON ?auto_215389 ?auto_215390 ) ( CLEAR ?auto_215387 ) ( ON ?auto_215388 ?auto_215389 ) ( CLEAR ?auto_215388 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_215379 ?auto_215380 ?auto_215381 ?auto_215382 ?auto_215383 ?auto_215384 ?auto_215385 ?auto_215386 ?auto_215387 ?auto_215388 )
      ( MAKE-13PILE ?auto_215379 ?auto_215380 ?auto_215381 ?auto_215382 ?auto_215383 ?auto_215384 ?auto_215385 ?auto_215386 ?auto_215387 ?auto_215388 ?auto_215389 ?auto_215390 ?auto_215391 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_215405 - BLOCK
      ?auto_215406 - BLOCK
      ?auto_215407 - BLOCK
      ?auto_215408 - BLOCK
      ?auto_215409 - BLOCK
      ?auto_215410 - BLOCK
      ?auto_215411 - BLOCK
      ?auto_215412 - BLOCK
      ?auto_215413 - BLOCK
      ?auto_215414 - BLOCK
      ?auto_215415 - BLOCK
      ?auto_215416 - BLOCK
      ?auto_215417 - BLOCK
    )
    :vars
    (
      ?auto_215418 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_215417 ?auto_215418 ) ( ON-TABLE ?auto_215405 ) ( ON ?auto_215406 ?auto_215405 ) ( ON ?auto_215407 ?auto_215406 ) ( ON ?auto_215408 ?auto_215407 ) ( ON ?auto_215409 ?auto_215408 ) ( ON ?auto_215410 ?auto_215409 ) ( ON ?auto_215411 ?auto_215410 ) ( ON ?auto_215412 ?auto_215411 ) ( not ( = ?auto_215405 ?auto_215406 ) ) ( not ( = ?auto_215405 ?auto_215407 ) ) ( not ( = ?auto_215405 ?auto_215408 ) ) ( not ( = ?auto_215405 ?auto_215409 ) ) ( not ( = ?auto_215405 ?auto_215410 ) ) ( not ( = ?auto_215405 ?auto_215411 ) ) ( not ( = ?auto_215405 ?auto_215412 ) ) ( not ( = ?auto_215405 ?auto_215413 ) ) ( not ( = ?auto_215405 ?auto_215414 ) ) ( not ( = ?auto_215405 ?auto_215415 ) ) ( not ( = ?auto_215405 ?auto_215416 ) ) ( not ( = ?auto_215405 ?auto_215417 ) ) ( not ( = ?auto_215405 ?auto_215418 ) ) ( not ( = ?auto_215406 ?auto_215407 ) ) ( not ( = ?auto_215406 ?auto_215408 ) ) ( not ( = ?auto_215406 ?auto_215409 ) ) ( not ( = ?auto_215406 ?auto_215410 ) ) ( not ( = ?auto_215406 ?auto_215411 ) ) ( not ( = ?auto_215406 ?auto_215412 ) ) ( not ( = ?auto_215406 ?auto_215413 ) ) ( not ( = ?auto_215406 ?auto_215414 ) ) ( not ( = ?auto_215406 ?auto_215415 ) ) ( not ( = ?auto_215406 ?auto_215416 ) ) ( not ( = ?auto_215406 ?auto_215417 ) ) ( not ( = ?auto_215406 ?auto_215418 ) ) ( not ( = ?auto_215407 ?auto_215408 ) ) ( not ( = ?auto_215407 ?auto_215409 ) ) ( not ( = ?auto_215407 ?auto_215410 ) ) ( not ( = ?auto_215407 ?auto_215411 ) ) ( not ( = ?auto_215407 ?auto_215412 ) ) ( not ( = ?auto_215407 ?auto_215413 ) ) ( not ( = ?auto_215407 ?auto_215414 ) ) ( not ( = ?auto_215407 ?auto_215415 ) ) ( not ( = ?auto_215407 ?auto_215416 ) ) ( not ( = ?auto_215407 ?auto_215417 ) ) ( not ( = ?auto_215407 ?auto_215418 ) ) ( not ( = ?auto_215408 ?auto_215409 ) ) ( not ( = ?auto_215408 ?auto_215410 ) ) ( not ( = ?auto_215408 ?auto_215411 ) ) ( not ( = ?auto_215408 ?auto_215412 ) ) ( not ( = ?auto_215408 ?auto_215413 ) ) ( not ( = ?auto_215408 ?auto_215414 ) ) ( not ( = ?auto_215408 ?auto_215415 ) ) ( not ( = ?auto_215408 ?auto_215416 ) ) ( not ( = ?auto_215408 ?auto_215417 ) ) ( not ( = ?auto_215408 ?auto_215418 ) ) ( not ( = ?auto_215409 ?auto_215410 ) ) ( not ( = ?auto_215409 ?auto_215411 ) ) ( not ( = ?auto_215409 ?auto_215412 ) ) ( not ( = ?auto_215409 ?auto_215413 ) ) ( not ( = ?auto_215409 ?auto_215414 ) ) ( not ( = ?auto_215409 ?auto_215415 ) ) ( not ( = ?auto_215409 ?auto_215416 ) ) ( not ( = ?auto_215409 ?auto_215417 ) ) ( not ( = ?auto_215409 ?auto_215418 ) ) ( not ( = ?auto_215410 ?auto_215411 ) ) ( not ( = ?auto_215410 ?auto_215412 ) ) ( not ( = ?auto_215410 ?auto_215413 ) ) ( not ( = ?auto_215410 ?auto_215414 ) ) ( not ( = ?auto_215410 ?auto_215415 ) ) ( not ( = ?auto_215410 ?auto_215416 ) ) ( not ( = ?auto_215410 ?auto_215417 ) ) ( not ( = ?auto_215410 ?auto_215418 ) ) ( not ( = ?auto_215411 ?auto_215412 ) ) ( not ( = ?auto_215411 ?auto_215413 ) ) ( not ( = ?auto_215411 ?auto_215414 ) ) ( not ( = ?auto_215411 ?auto_215415 ) ) ( not ( = ?auto_215411 ?auto_215416 ) ) ( not ( = ?auto_215411 ?auto_215417 ) ) ( not ( = ?auto_215411 ?auto_215418 ) ) ( not ( = ?auto_215412 ?auto_215413 ) ) ( not ( = ?auto_215412 ?auto_215414 ) ) ( not ( = ?auto_215412 ?auto_215415 ) ) ( not ( = ?auto_215412 ?auto_215416 ) ) ( not ( = ?auto_215412 ?auto_215417 ) ) ( not ( = ?auto_215412 ?auto_215418 ) ) ( not ( = ?auto_215413 ?auto_215414 ) ) ( not ( = ?auto_215413 ?auto_215415 ) ) ( not ( = ?auto_215413 ?auto_215416 ) ) ( not ( = ?auto_215413 ?auto_215417 ) ) ( not ( = ?auto_215413 ?auto_215418 ) ) ( not ( = ?auto_215414 ?auto_215415 ) ) ( not ( = ?auto_215414 ?auto_215416 ) ) ( not ( = ?auto_215414 ?auto_215417 ) ) ( not ( = ?auto_215414 ?auto_215418 ) ) ( not ( = ?auto_215415 ?auto_215416 ) ) ( not ( = ?auto_215415 ?auto_215417 ) ) ( not ( = ?auto_215415 ?auto_215418 ) ) ( not ( = ?auto_215416 ?auto_215417 ) ) ( not ( = ?auto_215416 ?auto_215418 ) ) ( not ( = ?auto_215417 ?auto_215418 ) ) ( ON ?auto_215416 ?auto_215417 ) ( ON ?auto_215415 ?auto_215416 ) ( ON ?auto_215414 ?auto_215415 ) ( CLEAR ?auto_215412 ) ( ON ?auto_215413 ?auto_215414 ) ( CLEAR ?auto_215413 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_215405 ?auto_215406 ?auto_215407 ?auto_215408 ?auto_215409 ?auto_215410 ?auto_215411 ?auto_215412 ?auto_215413 )
      ( MAKE-13PILE ?auto_215405 ?auto_215406 ?auto_215407 ?auto_215408 ?auto_215409 ?auto_215410 ?auto_215411 ?auto_215412 ?auto_215413 ?auto_215414 ?auto_215415 ?auto_215416 ?auto_215417 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_215432 - BLOCK
      ?auto_215433 - BLOCK
      ?auto_215434 - BLOCK
      ?auto_215435 - BLOCK
      ?auto_215436 - BLOCK
      ?auto_215437 - BLOCK
      ?auto_215438 - BLOCK
      ?auto_215439 - BLOCK
      ?auto_215440 - BLOCK
      ?auto_215441 - BLOCK
      ?auto_215442 - BLOCK
      ?auto_215443 - BLOCK
      ?auto_215444 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_215444 ) ( ON-TABLE ?auto_215432 ) ( ON ?auto_215433 ?auto_215432 ) ( ON ?auto_215434 ?auto_215433 ) ( ON ?auto_215435 ?auto_215434 ) ( ON ?auto_215436 ?auto_215435 ) ( ON ?auto_215437 ?auto_215436 ) ( ON ?auto_215438 ?auto_215437 ) ( ON ?auto_215439 ?auto_215438 ) ( not ( = ?auto_215432 ?auto_215433 ) ) ( not ( = ?auto_215432 ?auto_215434 ) ) ( not ( = ?auto_215432 ?auto_215435 ) ) ( not ( = ?auto_215432 ?auto_215436 ) ) ( not ( = ?auto_215432 ?auto_215437 ) ) ( not ( = ?auto_215432 ?auto_215438 ) ) ( not ( = ?auto_215432 ?auto_215439 ) ) ( not ( = ?auto_215432 ?auto_215440 ) ) ( not ( = ?auto_215432 ?auto_215441 ) ) ( not ( = ?auto_215432 ?auto_215442 ) ) ( not ( = ?auto_215432 ?auto_215443 ) ) ( not ( = ?auto_215432 ?auto_215444 ) ) ( not ( = ?auto_215433 ?auto_215434 ) ) ( not ( = ?auto_215433 ?auto_215435 ) ) ( not ( = ?auto_215433 ?auto_215436 ) ) ( not ( = ?auto_215433 ?auto_215437 ) ) ( not ( = ?auto_215433 ?auto_215438 ) ) ( not ( = ?auto_215433 ?auto_215439 ) ) ( not ( = ?auto_215433 ?auto_215440 ) ) ( not ( = ?auto_215433 ?auto_215441 ) ) ( not ( = ?auto_215433 ?auto_215442 ) ) ( not ( = ?auto_215433 ?auto_215443 ) ) ( not ( = ?auto_215433 ?auto_215444 ) ) ( not ( = ?auto_215434 ?auto_215435 ) ) ( not ( = ?auto_215434 ?auto_215436 ) ) ( not ( = ?auto_215434 ?auto_215437 ) ) ( not ( = ?auto_215434 ?auto_215438 ) ) ( not ( = ?auto_215434 ?auto_215439 ) ) ( not ( = ?auto_215434 ?auto_215440 ) ) ( not ( = ?auto_215434 ?auto_215441 ) ) ( not ( = ?auto_215434 ?auto_215442 ) ) ( not ( = ?auto_215434 ?auto_215443 ) ) ( not ( = ?auto_215434 ?auto_215444 ) ) ( not ( = ?auto_215435 ?auto_215436 ) ) ( not ( = ?auto_215435 ?auto_215437 ) ) ( not ( = ?auto_215435 ?auto_215438 ) ) ( not ( = ?auto_215435 ?auto_215439 ) ) ( not ( = ?auto_215435 ?auto_215440 ) ) ( not ( = ?auto_215435 ?auto_215441 ) ) ( not ( = ?auto_215435 ?auto_215442 ) ) ( not ( = ?auto_215435 ?auto_215443 ) ) ( not ( = ?auto_215435 ?auto_215444 ) ) ( not ( = ?auto_215436 ?auto_215437 ) ) ( not ( = ?auto_215436 ?auto_215438 ) ) ( not ( = ?auto_215436 ?auto_215439 ) ) ( not ( = ?auto_215436 ?auto_215440 ) ) ( not ( = ?auto_215436 ?auto_215441 ) ) ( not ( = ?auto_215436 ?auto_215442 ) ) ( not ( = ?auto_215436 ?auto_215443 ) ) ( not ( = ?auto_215436 ?auto_215444 ) ) ( not ( = ?auto_215437 ?auto_215438 ) ) ( not ( = ?auto_215437 ?auto_215439 ) ) ( not ( = ?auto_215437 ?auto_215440 ) ) ( not ( = ?auto_215437 ?auto_215441 ) ) ( not ( = ?auto_215437 ?auto_215442 ) ) ( not ( = ?auto_215437 ?auto_215443 ) ) ( not ( = ?auto_215437 ?auto_215444 ) ) ( not ( = ?auto_215438 ?auto_215439 ) ) ( not ( = ?auto_215438 ?auto_215440 ) ) ( not ( = ?auto_215438 ?auto_215441 ) ) ( not ( = ?auto_215438 ?auto_215442 ) ) ( not ( = ?auto_215438 ?auto_215443 ) ) ( not ( = ?auto_215438 ?auto_215444 ) ) ( not ( = ?auto_215439 ?auto_215440 ) ) ( not ( = ?auto_215439 ?auto_215441 ) ) ( not ( = ?auto_215439 ?auto_215442 ) ) ( not ( = ?auto_215439 ?auto_215443 ) ) ( not ( = ?auto_215439 ?auto_215444 ) ) ( not ( = ?auto_215440 ?auto_215441 ) ) ( not ( = ?auto_215440 ?auto_215442 ) ) ( not ( = ?auto_215440 ?auto_215443 ) ) ( not ( = ?auto_215440 ?auto_215444 ) ) ( not ( = ?auto_215441 ?auto_215442 ) ) ( not ( = ?auto_215441 ?auto_215443 ) ) ( not ( = ?auto_215441 ?auto_215444 ) ) ( not ( = ?auto_215442 ?auto_215443 ) ) ( not ( = ?auto_215442 ?auto_215444 ) ) ( not ( = ?auto_215443 ?auto_215444 ) ) ( ON ?auto_215443 ?auto_215444 ) ( ON ?auto_215442 ?auto_215443 ) ( ON ?auto_215441 ?auto_215442 ) ( CLEAR ?auto_215439 ) ( ON ?auto_215440 ?auto_215441 ) ( CLEAR ?auto_215440 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_215432 ?auto_215433 ?auto_215434 ?auto_215435 ?auto_215436 ?auto_215437 ?auto_215438 ?auto_215439 ?auto_215440 )
      ( MAKE-13PILE ?auto_215432 ?auto_215433 ?auto_215434 ?auto_215435 ?auto_215436 ?auto_215437 ?auto_215438 ?auto_215439 ?auto_215440 ?auto_215441 ?auto_215442 ?auto_215443 ?auto_215444 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_215458 - BLOCK
      ?auto_215459 - BLOCK
      ?auto_215460 - BLOCK
      ?auto_215461 - BLOCK
      ?auto_215462 - BLOCK
      ?auto_215463 - BLOCK
      ?auto_215464 - BLOCK
      ?auto_215465 - BLOCK
      ?auto_215466 - BLOCK
      ?auto_215467 - BLOCK
      ?auto_215468 - BLOCK
      ?auto_215469 - BLOCK
      ?auto_215470 - BLOCK
    )
    :vars
    (
      ?auto_215471 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_215470 ?auto_215471 ) ( ON-TABLE ?auto_215458 ) ( ON ?auto_215459 ?auto_215458 ) ( ON ?auto_215460 ?auto_215459 ) ( ON ?auto_215461 ?auto_215460 ) ( ON ?auto_215462 ?auto_215461 ) ( ON ?auto_215463 ?auto_215462 ) ( ON ?auto_215464 ?auto_215463 ) ( not ( = ?auto_215458 ?auto_215459 ) ) ( not ( = ?auto_215458 ?auto_215460 ) ) ( not ( = ?auto_215458 ?auto_215461 ) ) ( not ( = ?auto_215458 ?auto_215462 ) ) ( not ( = ?auto_215458 ?auto_215463 ) ) ( not ( = ?auto_215458 ?auto_215464 ) ) ( not ( = ?auto_215458 ?auto_215465 ) ) ( not ( = ?auto_215458 ?auto_215466 ) ) ( not ( = ?auto_215458 ?auto_215467 ) ) ( not ( = ?auto_215458 ?auto_215468 ) ) ( not ( = ?auto_215458 ?auto_215469 ) ) ( not ( = ?auto_215458 ?auto_215470 ) ) ( not ( = ?auto_215458 ?auto_215471 ) ) ( not ( = ?auto_215459 ?auto_215460 ) ) ( not ( = ?auto_215459 ?auto_215461 ) ) ( not ( = ?auto_215459 ?auto_215462 ) ) ( not ( = ?auto_215459 ?auto_215463 ) ) ( not ( = ?auto_215459 ?auto_215464 ) ) ( not ( = ?auto_215459 ?auto_215465 ) ) ( not ( = ?auto_215459 ?auto_215466 ) ) ( not ( = ?auto_215459 ?auto_215467 ) ) ( not ( = ?auto_215459 ?auto_215468 ) ) ( not ( = ?auto_215459 ?auto_215469 ) ) ( not ( = ?auto_215459 ?auto_215470 ) ) ( not ( = ?auto_215459 ?auto_215471 ) ) ( not ( = ?auto_215460 ?auto_215461 ) ) ( not ( = ?auto_215460 ?auto_215462 ) ) ( not ( = ?auto_215460 ?auto_215463 ) ) ( not ( = ?auto_215460 ?auto_215464 ) ) ( not ( = ?auto_215460 ?auto_215465 ) ) ( not ( = ?auto_215460 ?auto_215466 ) ) ( not ( = ?auto_215460 ?auto_215467 ) ) ( not ( = ?auto_215460 ?auto_215468 ) ) ( not ( = ?auto_215460 ?auto_215469 ) ) ( not ( = ?auto_215460 ?auto_215470 ) ) ( not ( = ?auto_215460 ?auto_215471 ) ) ( not ( = ?auto_215461 ?auto_215462 ) ) ( not ( = ?auto_215461 ?auto_215463 ) ) ( not ( = ?auto_215461 ?auto_215464 ) ) ( not ( = ?auto_215461 ?auto_215465 ) ) ( not ( = ?auto_215461 ?auto_215466 ) ) ( not ( = ?auto_215461 ?auto_215467 ) ) ( not ( = ?auto_215461 ?auto_215468 ) ) ( not ( = ?auto_215461 ?auto_215469 ) ) ( not ( = ?auto_215461 ?auto_215470 ) ) ( not ( = ?auto_215461 ?auto_215471 ) ) ( not ( = ?auto_215462 ?auto_215463 ) ) ( not ( = ?auto_215462 ?auto_215464 ) ) ( not ( = ?auto_215462 ?auto_215465 ) ) ( not ( = ?auto_215462 ?auto_215466 ) ) ( not ( = ?auto_215462 ?auto_215467 ) ) ( not ( = ?auto_215462 ?auto_215468 ) ) ( not ( = ?auto_215462 ?auto_215469 ) ) ( not ( = ?auto_215462 ?auto_215470 ) ) ( not ( = ?auto_215462 ?auto_215471 ) ) ( not ( = ?auto_215463 ?auto_215464 ) ) ( not ( = ?auto_215463 ?auto_215465 ) ) ( not ( = ?auto_215463 ?auto_215466 ) ) ( not ( = ?auto_215463 ?auto_215467 ) ) ( not ( = ?auto_215463 ?auto_215468 ) ) ( not ( = ?auto_215463 ?auto_215469 ) ) ( not ( = ?auto_215463 ?auto_215470 ) ) ( not ( = ?auto_215463 ?auto_215471 ) ) ( not ( = ?auto_215464 ?auto_215465 ) ) ( not ( = ?auto_215464 ?auto_215466 ) ) ( not ( = ?auto_215464 ?auto_215467 ) ) ( not ( = ?auto_215464 ?auto_215468 ) ) ( not ( = ?auto_215464 ?auto_215469 ) ) ( not ( = ?auto_215464 ?auto_215470 ) ) ( not ( = ?auto_215464 ?auto_215471 ) ) ( not ( = ?auto_215465 ?auto_215466 ) ) ( not ( = ?auto_215465 ?auto_215467 ) ) ( not ( = ?auto_215465 ?auto_215468 ) ) ( not ( = ?auto_215465 ?auto_215469 ) ) ( not ( = ?auto_215465 ?auto_215470 ) ) ( not ( = ?auto_215465 ?auto_215471 ) ) ( not ( = ?auto_215466 ?auto_215467 ) ) ( not ( = ?auto_215466 ?auto_215468 ) ) ( not ( = ?auto_215466 ?auto_215469 ) ) ( not ( = ?auto_215466 ?auto_215470 ) ) ( not ( = ?auto_215466 ?auto_215471 ) ) ( not ( = ?auto_215467 ?auto_215468 ) ) ( not ( = ?auto_215467 ?auto_215469 ) ) ( not ( = ?auto_215467 ?auto_215470 ) ) ( not ( = ?auto_215467 ?auto_215471 ) ) ( not ( = ?auto_215468 ?auto_215469 ) ) ( not ( = ?auto_215468 ?auto_215470 ) ) ( not ( = ?auto_215468 ?auto_215471 ) ) ( not ( = ?auto_215469 ?auto_215470 ) ) ( not ( = ?auto_215469 ?auto_215471 ) ) ( not ( = ?auto_215470 ?auto_215471 ) ) ( ON ?auto_215469 ?auto_215470 ) ( ON ?auto_215468 ?auto_215469 ) ( ON ?auto_215467 ?auto_215468 ) ( ON ?auto_215466 ?auto_215467 ) ( CLEAR ?auto_215464 ) ( ON ?auto_215465 ?auto_215466 ) ( CLEAR ?auto_215465 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_215458 ?auto_215459 ?auto_215460 ?auto_215461 ?auto_215462 ?auto_215463 ?auto_215464 ?auto_215465 )
      ( MAKE-13PILE ?auto_215458 ?auto_215459 ?auto_215460 ?auto_215461 ?auto_215462 ?auto_215463 ?auto_215464 ?auto_215465 ?auto_215466 ?auto_215467 ?auto_215468 ?auto_215469 ?auto_215470 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_215485 - BLOCK
      ?auto_215486 - BLOCK
      ?auto_215487 - BLOCK
      ?auto_215488 - BLOCK
      ?auto_215489 - BLOCK
      ?auto_215490 - BLOCK
      ?auto_215491 - BLOCK
      ?auto_215492 - BLOCK
      ?auto_215493 - BLOCK
      ?auto_215494 - BLOCK
      ?auto_215495 - BLOCK
      ?auto_215496 - BLOCK
      ?auto_215497 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_215497 ) ( ON-TABLE ?auto_215485 ) ( ON ?auto_215486 ?auto_215485 ) ( ON ?auto_215487 ?auto_215486 ) ( ON ?auto_215488 ?auto_215487 ) ( ON ?auto_215489 ?auto_215488 ) ( ON ?auto_215490 ?auto_215489 ) ( ON ?auto_215491 ?auto_215490 ) ( not ( = ?auto_215485 ?auto_215486 ) ) ( not ( = ?auto_215485 ?auto_215487 ) ) ( not ( = ?auto_215485 ?auto_215488 ) ) ( not ( = ?auto_215485 ?auto_215489 ) ) ( not ( = ?auto_215485 ?auto_215490 ) ) ( not ( = ?auto_215485 ?auto_215491 ) ) ( not ( = ?auto_215485 ?auto_215492 ) ) ( not ( = ?auto_215485 ?auto_215493 ) ) ( not ( = ?auto_215485 ?auto_215494 ) ) ( not ( = ?auto_215485 ?auto_215495 ) ) ( not ( = ?auto_215485 ?auto_215496 ) ) ( not ( = ?auto_215485 ?auto_215497 ) ) ( not ( = ?auto_215486 ?auto_215487 ) ) ( not ( = ?auto_215486 ?auto_215488 ) ) ( not ( = ?auto_215486 ?auto_215489 ) ) ( not ( = ?auto_215486 ?auto_215490 ) ) ( not ( = ?auto_215486 ?auto_215491 ) ) ( not ( = ?auto_215486 ?auto_215492 ) ) ( not ( = ?auto_215486 ?auto_215493 ) ) ( not ( = ?auto_215486 ?auto_215494 ) ) ( not ( = ?auto_215486 ?auto_215495 ) ) ( not ( = ?auto_215486 ?auto_215496 ) ) ( not ( = ?auto_215486 ?auto_215497 ) ) ( not ( = ?auto_215487 ?auto_215488 ) ) ( not ( = ?auto_215487 ?auto_215489 ) ) ( not ( = ?auto_215487 ?auto_215490 ) ) ( not ( = ?auto_215487 ?auto_215491 ) ) ( not ( = ?auto_215487 ?auto_215492 ) ) ( not ( = ?auto_215487 ?auto_215493 ) ) ( not ( = ?auto_215487 ?auto_215494 ) ) ( not ( = ?auto_215487 ?auto_215495 ) ) ( not ( = ?auto_215487 ?auto_215496 ) ) ( not ( = ?auto_215487 ?auto_215497 ) ) ( not ( = ?auto_215488 ?auto_215489 ) ) ( not ( = ?auto_215488 ?auto_215490 ) ) ( not ( = ?auto_215488 ?auto_215491 ) ) ( not ( = ?auto_215488 ?auto_215492 ) ) ( not ( = ?auto_215488 ?auto_215493 ) ) ( not ( = ?auto_215488 ?auto_215494 ) ) ( not ( = ?auto_215488 ?auto_215495 ) ) ( not ( = ?auto_215488 ?auto_215496 ) ) ( not ( = ?auto_215488 ?auto_215497 ) ) ( not ( = ?auto_215489 ?auto_215490 ) ) ( not ( = ?auto_215489 ?auto_215491 ) ) ( not ( = ?auto_215489 ?auto_215492 ) ) ( not ( = ?auto_215489 ?auto_215493 ) ) ( not ( = ?auto_215489 ?auto_215494 ) ) ( not ( = ?auto_215489 ?auto_215495 ) ) ( not ( = ?auto_215489 ?auto_215496 ) ) ( not ( = ?auto_215489 ?auto_215497 ) ) ( not ( = ?auto_215490 ?auto_215491 ) ) ( not ( = ?auto_215490 ?auto_215492 ) ) ( not ( = ?auto_215490 ?auto_215493 ) ) ( not ( = ?auto_215490 ?auto_215494 ) ) ( not ( = ?auto_215490 ?auto_215495 ) ) ( not ( = ?auto_215490 ?auto_215496 ) ) ( not ( = ?auto_215490 ?auto_215497 ) ) ( not ( = ?auto_215491 ?auto_215492 ) ) ( not ( = ?auto_215491 ?auto_215493 ) ) ( not ( = ?auto_215491 ?auto_215494 ) ) ( not ( = ?auto_215491 ?auto_215495 ) ) ( not ( = ?auto_215491 ?auto_215496 ) ) ( not ( = ?auto_215491 ?auto_215497 ) ) ( not ( = ?auto_215492 ?auto_215493 ) ) ( not ( = ?auto_215492 ?auto_215494 ) ) ( not ( = ?auto_215492 ?auto_215495 ) ) ( not ( = ?auto_215492 ?auto_215496 ) ) ( not ( = ?auto_215492 ?auto_215497 ) ) ( not ( = ?auto_215493 ?auto_215494 ) ) ( not ( = ?auto_215493 ?auto_215495 ) ) ( not ( = ?auto_215493 ?auto_215496 ) ) ( not ( = ?auto_215493 ?auto_215497 ) ) ( not ( = ?auto_215494 ?auto_215495 ) ) ( not ( = ?auto_215494 ?auto_215496 ) ) ( not ( = ?auto_215494 ?auto_215497 ) ) ( not ( = ?auto_215495 ?auto_215496 ) ) ( not ( = ?auto_215495 ?auto_215497 ) ) ( not ( = ?auto_215496 ?auto_215497 ) ) ( ON ?auto_215496 ?auto_215497 ) ( ON ?auto_215495 ?auto_215496 ) ( ON ?auto_215494 ?auto_215495 ) ( ON ?auto_215493 ?auto_215494 ) ( CLEAR ?auto_215491 ) ( ON ?auto_215492 ?auto_215493 ) ( CLEAR ?auto_215492 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_215485 ?auto_215486 ?auto_215487 ?auto_215488 ?auto_215489 ?auto_215490 ?auto_215491 ?auto_215492 )
      ( MAKE-13PILE ?auto_215485 ?auto_215486 ?auto_215487 ?auto_215488 ?auto_215489 ?auto_215490 ?auto_215491 ?auto_215492 ?auto_215493 ?auto_215494 ?auto_215495 ?auto_215496 ?auto_215497 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_215511 - BLOCK
      ?auto_215512 - BLOCK
      ?auto_215513 - BLOCK
      ?auto_215514 - BLOCK
      ?auto_215515 - BLOCK
      ?auto_215516 - BLOCK
      ?auto_215517 - BLOCK
      ?auto_215518 - BLOCK
      ?auto_215519 - BLOCK
      ?auto_215520 - BLOCK
      ?auto_215521 - BLOCK
      ?auto_215522 - BLOCK
      ?auto_215523 - BLOCK
    )
    :vars
    (
      ?auto_215524 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_215523 ?auto_215524 ) ( ON-TABLE ?auto_215511 ) ( ON ?auto_215512 ?auto_215511 ) ( ON ?auto_215513 ?auto_215512 ) ( ON ?auto_215514 ?auto_215513 ) ( ON ?auto_215515 ?auto_215514 ) ( ON ?auto_215516 ?auto_215515 ) ( not ( = ?auto_215511 ?auto_215512 ) ) ( not ( = ?auto_215511 ?auto_215513 ) ) ( not ( = ?auto_215511 ?auto_215514 ) ) ( not ( = ?auto_215511 ?auto_215515 ) ) ( not ( = ?auto_215511 ?auto_215516 ) ) ( not ( = ?auto_215511 ?auto_215517 ) ) ( not ( = ?auto_215511 ?auto_215518 ) ) ( not ( = ?auto_215511 ?auto_215519 ) ) ( not ( = ?auto_215511 ?auto_215520 ) ) ( not ( = ?auto_215511 ?auto_215521 ) ) ( not ( = ?auto_215511 ?auto_215522 ) ) ( not ( = ?auto_215511 ?auto_215523 ) ) ( not ( = ?auto_215511 ?auto_215524 ) ) ( not ( = ?auto_215512 ?auto_215513 ) ) ( not ( = ?auto_215512 ?auto_215514 ) ) ( not ( = ?auto_215512 ?auto_215515 ) ) ( not ( = ?auto_215512 ?auto_215516 ) ) ( not ( = ?auto_215512 ?auto_215517 ) ) ( not ( = ?auto_215512 ?auto_215518 ) ) ( not ( = ?auto_215512 ?auto_215519 ) ) ( not ( = ?auto_215512 ?auto_215520 ) ) ( not ( = ?auto_215512 ?auto_215521 ) ) ( not ( = ?auto_215512 ?auto_215522 ) ) ( not ( = ?auto_215512 ?auto_215523 ) ) ( not ( = ?auto_215512 ?auto_215524 ) ) ( not ( = ?auto_215513 ?auto_215514 ) ) ( not ( = ?auto_215513 ?auto_215515 ) ) ( not ( = ?auto_215513 ?auto_215516 ) ) ( not ( = ?auto_215513 ?auto_215517 ) ) ( not ( = ?auto_215513 ?auto_215518 ) ) ( not ( = ?auto_215513 ?auto_215519 ) ) ( not ( = ?auto_215513 ?auto_215520 ) ) ( not ( = ?auto_215513 ?auto_215521 ) ) ( not ( = ?auto_215513 ?auto_215522 ) ) ( not ( = ?auto_215513 ?auto_215523 ) ) ( not ( = ?auto_215513 ?auto_215524 ) ) ( not ( = ?auto_215514 ?auto_215515 ) ) ( not ( = ?auto_215514 ?auto_215516 ) ) ( not ( = ?auto_215514 ?auto_215517 ) ) ( not ( = ?auto_215514 ?auto_215518 ) ) ( not ( = ?auto_215514 ?auto_215519 ) ) ( not ( = ?auto_215514 ?auto_215520 ) ) ( not ( = ?auto_215514 ?auto_215521 ) ) ( not ( = ?auto_215514 ?auto_215522 ) ) ( not ( = ?auto_215514 ?auto_215523 ) ) ( not ( = ?auto_215514 ?auto_215524 ) ) ( not ( = ?auto_215515 ?auto_215516 ) ) ( not ( = ?auto_215515 ?auto_215517 ) ) ( not ( = ?auto_215515 ?auto_215518 ) ) ( not ( = ?auto_215515 ?auto_215519 ) ) ( not ( = ?auto_215515 ?auto_215520 ) ) ( not ( = ?auto_215515 ?auto_215521 ) ) ( not ( = ?auto_215515 ?auto_215522 ) ) ( not ( = ?auto_215515 ?auto_215523 ) ) ( not ( = ?auto_215515 ?auto_215524 ) ) ( not ( = ?auto_215516 ?auto_215517 ) ) ( not ( = ?auto_215516 ?auto_215518 ) ) ( not ( = ?auto_215516 ?auto_215519 ) ) ( not ( = ?auto_215516 ?auto_215520 ) ) ( not ( = ?auto_215516 ?auto_215521 ) ) ( not ( = ?auto_215516 ?auto_215522 ) ) ( not ( = ?auto_215516 ?auto_215523 ) ) ( not ( = ?auto_215516 ?auto_215524 ) ) ( not ( = ?auto_215517 ?auto_215518 ) ) ( not ( = ?auto_215517 ?auto_215519 ) ) ( not ( = ?auto_215517 ?auto_215520 ) ) ( not ( = ?auto_215517 ?auto_215521 ) ) ( not ( = ?auto_215517 ?auto_215522 ) ) ( not ( = ?auto_215517 ?auto_215523 ) ) ( not ( = ?auto_215517 ?auto_215524 ) ) ( not ( = ?auto_215518 ?auto_215519 ) ) ( not ( = ?auto_215518 ?auto_215520 ) ) ( not ( = ?auto_215518 ?auto_215521 ) ) ( not ( = ?auto_215518 ?auto_215522 ) ) ( not ( = ?auto_215518 ?auto_215523 ) ) ( not ( = ?auto_215518 ?auto_215524 ) ) ( not ( = ?auto_215519 ?auto_215520 ) ) ( not ( = ?auto_215519 ?auto_215521 ) ) ( not ( = ?auto_215519 ?auto_215522 ) ) ( not ( = ?auto_215519 ?auto_215523 ) ) ( not ( = ?auto_215519 ?auto_215524 ) ) ( not ( = ?auto_215520 ?auto_215521 ) ) ( not ( = ?auto_215520 ?auto_215522 ) ) ( not ( = ?auto_215520 ?auto_215523 ) ) ( not ( = ?auto_215520 ?auto_215524 ) ) ( not ( = ?auto_215521 ?auto_215522 ) ) ( not ( = ?auto_215521 ?auto_215523 ) ) ( not ( = ?auto_215521 ?auto_215524 ) ) ( not ( = ?auto_215522 ?auto_215523 ) ) ( not ( = ?auto_215522 ?auto_215524 ) ) ( not ( = ?auto_215523 ?auto_215524 ) ) ( ON ?auto_215522 ?auto_215523 ) ( ON ?auto_215521 ?auto_215522 ) ( ON ?auto_215520 ?auto_215521 ) ( ON ?auto_215519 ?auto_215520 ) ( ON ?auto_215518 ?auto_215519 ) ( CLEAR ?auto_215516 ) ( ON ?auto_215517 ?auto_215518 ) ( CLEAR ?auto_215517 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_215511 ?auto_215512 ?auto_215513 ?auto_215514 ?auto_215515 ?auto_215516 ?auto_215517 )
      ( MAKE-13PILE ?auto_215511 ?auto_215512 ?auto_215513 ?auto_215514 ?auto_215515 ?auto_215516 ?auto_215517 ?auto_215518 ?auto_215519 ?auto_215520 ?auto_215521 ?auto_215522 ?auto_215523 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_215538 - BLOCK
      ?auto_215539 - BLOCK
      ?auto_215540 - BLOCK
      ?auto_215541 - BLOCK
      ?auto_215542 - BLOCK
      ?auto_215543 - BLOCK
      ?auto_215544 - BLOCK
      ?auto_215545 - BLOCK
      ?auto_215546 - BLOCK
      ?auto_215547 - BLOCK
      ?auto_215548 - BLOCK
      ?auto_215549 - BLOCK
      ?auto_215550 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_215550 ) ( ON-TABLE ?auto_215538 ) ( ON ?auto_215539 ?auto_215538 ) ( ON ?auto_215540 ?auto_215539 ) ( ON ?auto_215541 ?auto_215540 ) ( ON ?auto_215542 ?auto_215541 ) ( ON ?auto_215543 ?auto_215542 ) ( not ( = ?auto_215538 ?auto_215539 ) ) ( not ( = ?auto_215538 ?auto_215540 ) ) ( not ( = ?auto_215538 ?auto_215541 ) ) ( not ( = ?auto_215538 ?auto_215542 ) ) ( not ( = ?auto_215538 ?auto_215543 ) ) ( not ( = ?auto_215538 ?auto_215544 ) ) ( not ( = ?auto_215538 ?auto_215545 ) ) ( not ( = ?auto_215538 ?auto_215546 ) ) ( not ( = ?auto_215538 ?auto_215547 ) ) ( not ( = ?auto_215538 ?auto_215548 ) ) ( not ( = ?auto_215538 ?auto_215549 ) ) ( not ( = ?auto_215538 ?auto_215550 ) ) ( not ( = ?auto_215539 ?auto_215540 ) ) ( not ( = ?auto_215539 ?auto_215541 ) ) ( not ( = ?auto_215539 ?auto_215542 ) ) ( not ( = ?auto_215539 ?auto_215543 ) ) ( not ( = ?auto_215539 ?auto_215544 ) ) ( not ( = ?auto_215539 ?auto_215545 ) ) ( not ( = ?auto_215539 ?auto_215546 ) ) ( not ( = ?auto_215539 ?auto_215547 ) ) ( not ( = ?auto_215539 ?auto_215548 ) ) ( not ( = ?auto_215539 ?auto_215549 ) ) ( not ( = ?auto_215539 ?auto_215550 ) ) ( not ( = ?auto_215540 ?auto_215541 ) ) ( not ( = ?auto_215540 ?auto_215542 ) ) ( not ( = ?auto_215540 ?auto_215543 ) ) ( not ( = ?auto_215540 ?auto_215544 ) ) ( not ( = ?auto_215540 ?auto_215545 ) ) ( not ( = ?auto_215540 ?auto_215546 ) ) ( not ( = ?auto_215540 ?auto_215547 ) ) ( not ( = ?auto_215540 ?auto_215548 ) ) ( not ( = ?auto_215540 ?auto_215549 ) ) ( not ( = ?auto_215540 ?auto_215550 ) ) ( not ( = ?auto_215541 ?auto_215542 ) ) ( not ( = ?auto_215541 ?auto_215543 ) ) ( not ( = ?auto_215541 ?auto_215544 ) ) ( not ( = ?auto_215541 ?auto_215545 ) ) ( not ( = ?auto_215541 ?auto_215546 ) ) ( not ( = ?auto_215541 ?auto_215547 ) ) ( not ( = ?auto_215541 ?auto_215548 ) ) ( not ( = ?auto_215541 ?auto_215549 ) ) ( not ( = ?auto_215541 ?auto_215550 ) ) ( not ( = ?auto_215542 ?auto_215543 ) ) ( not ( = ?auto_215542 ?auto_215544 ) ) ( not ( = ?auto_215542 ?auto_215545 ) ) ( not ( = ?auto_215542 ?auto_215546 ) ) ( not ( = ?auto_215542 ?auto_215547 ) ) ( not ( = ?auto_215542 ?auto_215548 ) ) ( not ( = ?auto_215542 ?auto_215549 ) ) ( not ( = ?auto_215542 ?auto_215550 ) ) ( not ( = ?auto_215543 ?auto_215544 ) ) ( not ( = ?auto_215543 ?auto_215545 ) ) ( not ( = ?auto_215543 ?auto_215546 ) ) ( not ( = ?auto_215543 ?auto_215547 ) ) ( not ( = ?auto_215543 ?auto_215548 ) ) ( not ( = ?auto_215543 ?auto_215549 ) ) ( not ( = ?auto_215543 ?auto_215550 ) ) ( not ( = ?auto_215544 ?auto_215545 ) ) ( not ( = ?auto_215544 ?auto_215546 ) ) ( not ( = ?auto_215544 ?auto_215547 ) ) ( not ( = ?auto_215544 ?auto_215548 ) ) ( not ( = ?auto_215544 ?auto_215549 ) ) ( not ( = ?auto_215544 ?auto_215550 ) ) ( not ( = ?auto_215545 ?auto_215546 ) ) ( not ( = ?auto_215545 ?auto_215547 ) ) ( not ( = ?auto_215545 ?auto_215548 ) ) ( not ( = ?auto_215545 ?auto_215549 ) ) ( not ( = ?auto_215545 ?auto_215550 ) ) ( not ( = ?auto_215546 ?auto_215547 ) ) ( not ( = ?auto_215546 ?auto_215548 ) ) ( not ( = ?auto_215546 ?auto_215549 ) ) ( not ( = ?auto_215546 ?auto_215550 ) ) ( not ( = ?auto_215547 ?auto_215548 ) ) ( not ( = ?auto_215547 ?auto_215549 ) ) ( not ( = ?auto_215547 ?auto_215550 ) ) ( not ( = ?auto_215548 ?auto_215549 ) ) ( not ( = ?auto_215548 ?auto_215550 ) ) ( not ( = ?auto_215549 ?auto_215550 ) ) ( ON ?auto_215549 ?auto_215550 ) ( ON ?auto_215548 ?auto_215549 ) ( ON ?auto_215547 ?auto_215548 ) ( ON ?auto_215546 ?auto_215547 ) ( ON ?auto_215545 ?auto_215546 ) ( CLEAR ?auto_215543 ) ( ON ?auto_215544 ?auto_215545 ) ( CLEAR ?auto_215544 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_215538 ?auto_215539 ?auto_215540 ?auto_215541 ?auto_215542 ?auto_215543 ?auto_215544 )
      ( MAKE-13PILE ?auto_215538 ?auto_215539 ?auto_215540 ?auto_215541 ?auto_215542 ?auto_215543 ?auto_215544 ?auto_215545 ?auto_215546 ?auto_215547 ?auto_215548 ?auto_215549 ?auto_215550 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_215564 - BLOCK
      ?auto_215565 - BLOCK
      ?auto_215566 - BLOCK
      ?auto_215567 - BLOCK
      ?auto_215568 - BLOCK
      ?auto_215569 - BLOCK
      ?auto_215570 - BLOCK
      ?auto_215571 - BLOCK
      ?auto_215572 - BLOCK
      ?auto_215573 - BLOCK
      ?auto_215574 - BLOCK
      ?auto_215575 - BLOCK
      ?auto_215576 - BLOCK
    )
    :vars
    (
      ?auto_215577 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_215576 ?auto_215577 ) ( ON-TABLE ?auto_215564 ) ( ON ?auto_215565 ?auto_215564 ) ( ON ?auto_215566 ?auto_215565 ) ( ON ?auto_215567 ?auto_215566 ) ( ON ?auto_215568 ?auto_215567 ) ( not ( = ?auto_215564 ?auto_215565 ) ) ( not ( = ?auto_215564 ?auto_215566 ) ) ( not ( = ?auto_215564 ?auto_215567 ) ) ( not ( = ?auto_215564 ?auto_215568 ) ) ( not ( = ?auto_215564 ?auto_215569 ) ) ( not ( = ?auto_215564 ?auto_215570 ) ) ( not ( = ?auto_215564 ?auto_215571 ) ) ( not ( = ?auto_215564 ?auto_215572 ) ) ( not ( = ?auto_215564 ?auto_215573 ) ) ( not ( = ?auto_215564 ?auto_215574 ) ) ( not ( = ?auto_215564 ?auto_215575 ) ) ( not ( = ?auto_215564 ?auto_215576 ) ) ( not ( = ?auto_215564 ?auto_215577 ) ) ( not ( = ?auto_215565 ?auto_215566 ) ) ( not ( = ?auto_215565 ?auto_215567 ) ) ( not ( = ?auto_215565 ?auto_215568 ) ) ( not ( = ?auto_215565 ?auto_215569 ) ) ( not ( = ?auto_215565 ?auto_215570 ) ) ( not ( = ?auto_215565 ?auto_215571 ) ) ( not ( = ?auto_215565 ?auto_215572 ) ) ( not ( = ?auto_215565 ?auto_215573 ) ) ( not ( = ?auto_215565 ?auto_215574 ) ) ( not ( = ?auto_215565 ?auto_215575 ) ) ( not ( = ?auto_215565 ?auto_215576 ) ) ( not ( = ?auto_215565 ?auto_215577 ) ) ( not ( = ?auto_215566 ?auto_215567 ) ) ( not ( = ?auto_215566 ?auto_215568 ) ) ( not ( = ?auto_215566 ?auto_215569 ) ) ( not ( = ?auto_215566 ?auto_215570 ) ) ( not ( = ?auto_215566 ?auto_215571 ) ) ( not ( = ?auto_215566 ?auto_215572 ) ) ( not ( = ?auto_215566 ?auto_215573 ) ) ( not ( = ?auto_215566 ?auto_215574 ) ) ( not ( = ?auto_215566 ?auto_215575 ) ) ( not ( = ?auto_215566 ?auto_215576 ) ) ( not ( = ?auto_215566 ?auto_215577 ) ) ( not ( = ?auto_215567 ?auto_215568 ) ) ( not ( = ?auto_215567 ?auto_215569 ) ) ( not ( = ?auto_215567 ?auto_215570 ) ) ( not ( = ?auto_215567 ?auto_215571 ) ) ( not ( = ?auto_215567 ?auto_215572 ) ) ( not ( = ?auto_215567 ?auto_215573 ) ) ( not ( = ?auto_215567 ?auto_215574 ) ) ( not ( = ?auto_215567 ?auto_215575 ) ) ( not ( = ?auto_215567 ?auto_215576 ) ) ( not ( = ?auto_215567 ?auto_215577 ) ) ( not ( = ?auto_215568 ?auto_215569 ) ) ( not ( = ?auto_215568 ?auto_215570 ) ) ( not ( = ?auto_215568 ?auto_215571 ) ) ( not ( = ?auto_215568 ?auto_215572 ) ) ( not ( = ?auto_215568 ?auto_215573 ) ) ( not ( = ?auto_215568 ?auto_215574 ) ) ( not ( = ?auto_215568 ?auto_215575 ) ) ( not ( = ?auto_215568 ?auto_215576 ) ) ( not ( = ?auto_215568 ?auto_215577 ) ) ( not ( = ?auto_215569 ?auto_215570 ) ) ( not ( = ?auto_215569 ?auto_215571 ) ) ( not ( = ?auto_215569 ?auto_215572 ) ) ( not ( = ?auto_215569 ?auto_215573 ) ) ( not ( = ?auto_215569 ?auto_215574 ) ) ( not ( = ?auto_215569 ?auto_215575 ) ) ( not ( = ?auto_215569 ?auto_215576 ) ) ( not ( = ?auto_215569 ?auto_215577 ) ) ( not ( = ?auto_215570 ?auto_215571 ) ) ( not ( = ?auto_215570 ?auto_215572 ) ) ( not ( = ?auto_215570 ?auto_215573 ) ) ( not ( = ?auto_215570 ?auto_215574 ) ) ( not ( = ?auto_215570 ?auto_215575 ) ) ( not ( = ?auto_215570 ?auto_215576 ) ) ( not ( = ?auto_215570 ?auto_215577 ) ) ( not ( = ?auto_215571 ?auto_215572 ) ) ( not ( = ?auto_215571 ?auto_215573 ) ) ( not ( = ?auto_215571 ?auto_215574 ) ) ( not ( = ?auto_215571 ?auto_215575 ) ) ( not ( = ?auto_215571 ?auto_215576 ) ) ( not ( = ?auto_215571 ?auto_215577 ) ) ( not ( = ?auto_215572 ?auto_215573 ) ) ( not ( = ?auto_215572 ?auto_215574 ) ) ( not ( = ?auto_215572 ?auto_215575 ) ) ( not ( = ?auto_215572 ?auto_215576 ) ) ( not ( = ?auto_215572 ?auto_215577 ) ) ( not ( = ?auto_215573 ?auto_215574 ) ) ( not ( = ?auto_215573 ?auto_215575 ) ) ( not ( = ?auto_215573 ?auto_215576 ) ) ( not ( = ?auto_215573 ?auto_215577 ) ) ( not ( = ?auto_215574 ?auto_215575 ) ) ( not ( = ?auto_215574 ?auto_215576 ) ) ( not ( = ?auto_215574 ?auto_215577 ) ) ( not ( = ?auto_215575 ?auto_215576 ) ) ( not ( = ?auto_215575 ?auto_215577 ) ) ( not ( = ?auto_215576 ?auto_215577 ) ) ( ON ?auto_215575 ?auto_215576 ) ( ON ?auto_215574 ?auto_215575 ) ( ON ?auto_215573 ?auto_215574 ) ( ON ?auto_215572 ?auto_215573 ) ( ON ?auto_215571 ?auto_215572 ) ( ON ?auto_215570 ?auto_215571 ) ( CLEAR ?auto_215568 ) ( ON ?auto_215569 ?auto_215570 ) ( CLEAR ?auto_215569 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_215564 ?auto_215565 ?auto_215566 ?auto_215567 ?auto_215568 ?auto_215569 )
      ( MAKE-13PILE ?auto_215564 ?auto_215565 ?auto_215566 ?auto_215567 ?auto_215568 ?auto_215569 ?auto_215570 ?auto_215571 ?auto_215572 ?auto_215573 ?auto_215574 ?auto_215575 ?auto_215576 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_215591 - BLOCK
      ?auto_215592 - BLOCK
      ?auto_215593 - BLOCK
      ?auto_215594 - BLOCK
      ?auto_215595 - BLOCK
      ?auto_215596 - BLOCK
      ?auto_215597 - BLOCK
      ?auto_215598 - BLOCK
      ?auto_215599 - BLOCK
      ?auto_215600 - BLOCK
      ?auto_215601 - BLOCK
      ?auto_215602 - BLOCK
      ?auto_215603 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_215603 ) ( ON-TABLE ?auto_215591 ) ( ON ?auto_215592 ?auto_215591 ) ( ON ?auto_215593 ?auto_215592 ) ( ON ?auto_215594 ?auto_215593 ) ( ON ?auto_215595 ?auto_215594 ) ( not ( = ?auto_215591 ?auto_215592 ) ) ( not ( = ?auto_215591 ?auto_215593 ) ) ( not ( = ?auto_215591 ?auto_215594 ) ) ( not ( = ?auto_215591 ?auto_215595 ) ) ( not ( = ?auto_215591 ?auto_215596 ) ) ( not ( = ?auto_215591 ?auto_215597 ) ) ( not ( = ?auto_215591 ?auto_215598 ) ) ( not ( = ?auto_215591 ?auto_215599 ) ) ( not ( = ?auto_215591 ?auto_215600 ) ) ( not ( = ?auto_215591 ?auto_215601 ) ) ( not ( = ?auto_215591 ?auto_215602 ) ) ( not ( = ?auto_215591 ?auto_215603 ) ) ( not ( = ?auto_215592 ?auto_215593 ) ) ( not ( = ?auto_215592 ?auto_215594 ) ) ( not ( = ?auto_215592 ?auto_215595 ) ) ( not ( = ?auto_215592 ?auto_215596 ) ) ( not ( = ?auto_215592 ?auto_215597 ) ) ( not ( = ?auto_215592 ?auto_215598 ) ) ( not ( = ?auto_215592 ?auto_215599 ) ) ( not ( = ?auto_215592 ?auto_215600 ) ) ( not ( = ?auto_215592 ?auto_215601 ) ) ( not ( = ?auto_215592 ?auto_215602 ) ) ( not ( = ?auto_215592 ?auto_215603 ) ) ( not ( = ?auto_215593 ?auto_215594 ) ) ( not ( = ?auto_215593 ?auto_215595 ) ) ( not ( = ?auto_215593 ?auto_215596 ) ) ( not ( = ?auto_215593 ?auto_215597 ) ) ( not ( = ?auto_215593 ?auto_215598 ) ) ( not ( = ?auto_215593 ?auto_215599 ) ) ( not ( = ?auto_215593 ?auto_215600 ) ) ( not ( = ?auto_215593 ?auto_215601 ) ) ( not ( = ?auto_215593 ?auto_215602 ) ) ( not ( = ?auto_215593 ?auto_215603 ) ) ( not ( = ?auto_215594 ?auto_215595 ) ) ( not ( = ?auto_215594 ?auto_215596 ) ) ( not ( = ?auto_215594 ?auto_215597 ) ) ( not ( = ?auto_215594 ?auto_215598 ) ) ( not ( = ?auto_215594 ?auto_215599 ) ) ( not ( = ?auto_215594 ?auto_215600 ) ) ( not ( = ?auto_215594 ?auto_215601 ) ) ( not ( = ?auto_215594 ?auto_215602 ) ) ( not ( = ?auto_215594 ?auto_215603 ) ) ( not ( = ?auto_215595 ?auto_215596 ) ) ( not ( = ?auto_215595 ?auto_215597 ) ) ( not ( = ?auto_215595 ?auto_215598 ) ) ( not ( = ?auto_215595 ?auto_215599 ) ) ( not ( = ?auto_215595 ?auto_215600 ) ) ( not ( = ?auto_215595 ?auto_215601 ) ) ( not ( = ?auto_215595 ?auto_215602 ) ) ( not ( = ?auto_215595 ?auto_215603 ) ) ( not ( = ?auto_215596 ?auto_215597 ) ) ( not ( = ?auto_215596 ?auto_215598 ) ) ( not ( = ?auto_215596 ?auto_215599 ) ) ( not ( = ?auto_215596 ?auto_215600 ) ) ( not ( = ?auto_215596 ?auto_215601 ) ) ( not ( = ?auto_215596 ?auto_215602 ) ) ( not ( = ?auto_215596 ?auto_215603 ) ) ( not ( = ?auto_215597 ?auto_215598 ) ) ( not ( = ?auto_215597 ?auto_215599 ) ) ( not ( = ?auto_215597 ?auto_215600 ) ) ( not ( = ?auto_215597 ?auto_215601 ) ) ( not ( = ?auto_215597 ?auto_215602 ) ) ( not ( = ?auto_215597 ?auto_215603 ) ) ( not ( = ?auto_215598 ?auto_215599 ) ) ( not ( = ?auto_215598 ?auto_215600 ) ) ( not ( = ?auto_215598 ?auto_215601 ) ) ( not ( = ?auto_215598 ?auto_215602 ) ) ( not ( = ?auto_215598 ?auto_215603 ) ) ( not ( = ?auto_215599 ?auto_215600 ) ) ( not ( = ?auto_215599 ?auto_215601 ) ) ( not ( = ?auto_215599 ?auto_215602 ) ) ( not ( = ?auto_215599 ?auto_215603 ) ) ( not ( = ?auto_215600 ?auto_215601 ) ) ( not ( = ?auto_215600 ?auto_215602 ) ) ( not ( = ?auto_215600 ?auto_215603 ) ) ( not ( = ?auto_215601 ?auto_215602 ) ) ( not ( = ?auto_215601 ?auto_215603 ) ) ( not ( = ?auto_215602 ?auto_215603 ) ) ( ON ?auto_215602 ?auto_215603 ) ( ON ?auto_215601 ?auto_215602 ) ( ON ?auto_215600 ?auto_215601 ) ( ON ?auto_215599 ?auto_215600 ) ( ON ?auto_215598 ?auto_215599 ) ( ON ?auto_215597 ?auto_215598 ) ( CLEAR ?auto_215595 ) ( ON ?auto_215596 ?auto_215597 ) ( CLEAR ?auto_215596 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_215591 ?auto_215592 ?auto_215593 ?auto_215594 ?auto_215595 ?auto_215596 )
      ( MAKE-13PILE ?auto_215591 ?auto_215592 ?auto_215593 ?auto_215594 ?auto_215595 ?auto_215596 ?auto_215597 ?auto_215598 ?auto_215599 ?auto_215600 ?auto_215601 ?auto_215602 ?auto_215603 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_215617 - BLOCK
      ?auto_215618 - BLOCK
      ?auto_215619 - BLOCK
      ?auto_215620 - BLOCK
      ?auto_215621 - BLOCK
      ?auto_215622 - BLOCK
      ?auto_215623 - BLOCK
      ?auto_215624 - BLOCK
      ?auto_215625 - BLOCK
      ?auto_215626 - BLOCK
      ?auto_215627 - BLOCK
      ?auto_215628 - BLOCK
      ?auto_215629 - BLOCK
    )
    :vars
    (
      ?auto_215630 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_215629 ?auto_215630 ) ( ON-TABLE ?auto_215617 ) ( ON ?auto_215618 ?auto_215617 ) ( ON ?auto_215619 ?auto_215618 ) ( ON ?auto_215620 ?auto_215619 ) ( not ( = ?auto_215617 ?auto_215618 ) ) ( not ( = ?auto_215617 ?auto_215619 ) ) ( not ( = ?auto_215617 ?auto_215620 ) ) ( not ( = ?auto_215617 ?auto_215621 ) ) ( not ( = ?auto_215617 ?auto_215622 ) ) ( not ( = ?auto_215617 ?auto_215623 ) ) ( not ( = ?auto_215617 ?auto_215624 ) ) ( not ( = ?auto_215617 ?auto_215625 ) ) ( not ( = ?auto_215617 ?auto_215626 ) ) ( not ( = ?auto_215617 ?auto_215627 ) ) ( not ( = ?auto_215617 ?auto_215628 ) ) ( not ( = ?auto_215617 ?auto_215629 ) ) ( not ( = ?auto_215617 ?auto_215630 ) ) ( not ( = ?auto_215618 ?auto_215619 ) ) ( not ( = ?auto_215618 ?auto_215620 ) ) ( not ( = ?auto_215618 ?auto_215621 ) ) ( not ( = ?auto_215618 ?auto_215622 ) ) ( not ( = ?auto_215618 ?auto_215623 ) ) ( not ( = ?auto_215618 ?auto_215624 ) ) ( not ( = ?auto_215618 ?auto_215625 ) ) ( not ( = ?auto_215618 ?auto_215626 ) ) ( not ( = ?auto_215618 ?auto_215627 ) ) ( not ( = ?auto_215618 ?auto_215628 ) ) ( not ( = ?auto_215618 ?auto_215629 ) ) ( not ( = ?auto_215618 ?auto_215630 ) ) ( not ( = ?auto_215619 ?auto_215620 ) ) ( not ( = ?auto_215619 ?auto_215621 ) ) ( not ( = ?auto_215619 ?auto_215622 ) ) ( not ( = ?auto_215619 ?auto_215623 ) ) ( not ( = ?auto_215619 ?auto_215624 ) ) ( not ( = ?auto_215619 ?auto_215625 ) ) ( not ( = ?auto_215619 ?auto_215626 ) ) ( not ( = ?auto_215619 ?auto_215627 ) ) ( not ( = ?auto_215619 ?auto_215628 ) ) ( not ( = ?auto_215619 ?auto_215629 ) ) ( not ( = ?auto_215619 ?auto_215630 ) ) ( not ( = ?auto_215620 ?auto_215621 ) ) ( not ( = ?auto_215620 ?auto_215622 ) ) ( not ( = ?auto_215620 ?auto_215623 ) ) ( not ( = ?auto_215620 ?auto_215624 ) ) ( not ( = ?auto_215620 ?auto_215625 ) ) ( not ( = ?auto_215620 ?auto_215626 ) ) ( not ( = ?auto_215620 ?auto_215627 ) ) ( not ( = ?auto_215620 ?auto_215628 ) ) ( not ( = ?auto_215620 ?auto_215629 ) ) ( not ( = ?auto_215620 ?auto_215630 ) ) ( not ( = ?auto_215621 ?auto_215622 ) ) ( not ( = ?auto_215621 ?auto_215623 ) ) ( not ( = ?auto_215621 ?auto_215624 ) ) ( not ( = ?auto_215621 ?auto_215625 ) ) ( not ( = ?auto_215621 ?auto_215626 ) ) ( not ( = ?auto_215621 ?auto_215627 ) ) ( not ( = ?auto_215621 ?auto_215628 ) ) ( not ( = ?auto_215621 ?auto_215629 ) ) ( not ( = ?auto_215621 ?auto_215630 ) ) ( not ( = ?auto_215622 ?auto_215623 ) ) ( not ( = ?auto_215622 ?auto_215624 ) ) ( not ( = ?auto_215622 ?auto_215625 ) ) ( not ( = ?auto_215622 ?auto_215626 ) ) ( not ( = ?auto_215622 ?auto_215627 ) ) ( not ( = ?auto_215622 ?auto_215628 ) ) ( not ( = ?auto_215622 ?auto_215629 ) ) ( not ( = ?auto_215622 ?auto_215630 ) ) ( not ( = ?auto_215623 ?auto_215624 ) ) ( not ( = ?auto_215623 ?auto_215625 ) ) ( not ( = ?auto_215623 ?auto_215626 ) ) ( not ( = ?auto_215623 ?auto_215627 ) ) ( not ( = ?auto_215623 ?auto_215628 ) ) ( not ( = ?auto_215623 ?auto_215629 ) ) ( not ( = ?auto_215623 ?auto_215630 ) ) ( not ( = ?auto_215624 ?auto_215625 ) ) ( not ( = ?auto_215624 ?auto_215626 ) ) ( not ( = ?auto_215624 ?auto_215627 ) ) ( not ( = ?auto_215624 ?auto_215628 ) ) ( not ( = ?auto_215624 ?auto_215629 ) ) ( not ( = ?auto_215624 ?auto_215630 ) ) ( not ( = ?auto_215625 ?auto_215626 ) ) ( not ( = ?auto_215625 ?auto_215627 ) ) ( not ( = ?auto_215625 ?auto_215628 ) ) ( not ( = ?auto_215625 ?auto_215629 ) ) ( not ( = ?auto_215625 ?auto_215630 ) ) ( not ( = ?auto_215626 ?auto_215627 ) ) ( not ( = ?auto_215626 ?auto_215628 ) ) ( not ( = ?auto_215626 ?auto_215629 ) ) ( not ( = ?auto_215626 ?auto_215630 ) ) ( not ( = ?auto_215627 ?auto_215628 ) ) ( not ( = ?auto_215627 ?auto_215629 ) ) ( not ( = ?auto_215627 ?auto_215630 ) ) ( not ( = ?auto_215628 ?auto_215629 ) ) ( not ( = ?auto_215628 ?auto_215630 ) ) ( not ( = ?auto_215629 ?auto_215630 ) ) ( ON ?auto_215628 ?auto_215629 ) ( ON ?auto_215627 ?auto_215628 ) ( ON ?auto_215626 ?auto_215627 ) ( ON ?auto_215625 ?auto_215626 ) ( ON ?auto_215624 ?auto_215625 ) ( ON ?auto_215623 ?auto_215624 ) ( ON ?auto_215622 ?auto_215623 ) ( CLEAR ?auto_215620 ) ( ON ?auto_215621 ?auto_215622 ) ( CLEAR ?auto_215621 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_215617 ?auto_215618 ?auto_215619 ?auto_215620 ?auto_215621 )
      ( MAKE-13PILE ?auto_215617 ?auto_215618 ?auto_215619 ?auto_215620 ?auto_215621 ?auto_215622 ?auto_215623 ?auto_215624 ?auto_215625 ?auto_215626 ?auto_215627 ?auto_215628 ?auto_215629 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_215644 - BLOCK
      ?auto_215645 - BLOCK
      ?auto_215646 - BLOCK
      ?auto_215647 - BLOCK
      ?auto_215648 - BLOCK
      ?auto_215649 - BLOCK
      ?auto_215650 - BLOCK
      ?auto_215651 - BLOCK
      ?auto_215652 - BLOCK
      ?auto_215653 - BLOCK
      ?auto_215654 - BLOCK
      ?auto_215655 - BLOCK
      ?auto_215656 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_215656 ) ( ON-TABLE ?auto_215644 ) ( ON ?auto_215645 ?auto_215644 ) ( ON ?auto_215646 ?auto_215645 ) ( ON ?auto_215647 ?auto_215646 ) ( not ( = ?auto_215644 ?auto_215645 ) ) ( not ( = ?auto_215644 ?auto_215646 ) ) ( not ( = ?auto_215644 ?auto_215647 ) ) ( not ( = ?auto_215644 ?auto_215648 ) ) ( not ( = ?auto_215644 ?auto_215649 ) ) ( not ( = ?auto_215644 ?auto_215650 ) ) ( not ( = ?auto_215644 ?auto_215651 ) ) ( not ( = ?auto_215644 ?auto_215652 ) ) ( not ( = ?auto_215644 ?auto_215653 ) ) ( not ( = ?auto_215644 ?auto_215654 ) ) ( not ( = ?auto_215644 ?auto_215655 ) ) ( not ( = ?auto_215644 ?auto_215656 ) ) ( not ( = ?auto_215645 ?auto_215646 ) ) ( not ( = ?auto_215645 ?auto_215647 ) ) ( not ( = ?auto_215645 ?auto_215648 ) ) ( not ( = ?auto_215645 ?auto_215649 ) ) ( not ( = ?auto_215645 ?auto_215650 ) ) ( not ( = ?auto_215645 ?auto_215651 ) ) ( not ( = ?auto_215645 ?auto_215652 ) ) ( not ( = ?auto_215645 ?auto_215653 ) ) ( not ( = ?auto_215645 ?auto_215654 ) ) ( not ( = ?auto_215645 ?auto_215655 ) ) ( not ( = ?auto_215645 ?auto_215656 ) ) ( not ( = ?auto_215646 ?auto_215647 ) ) ( not ( = ?auto_215646 ?auto_215648 ) ) ( not ( = ?auto_215646 ?auto_215649 ) ) ( not ( = ?auto_215646 ?auto_215650 ) ) ( not ( = ?auto_215646 ?auto_215651 ) ) ( not ( = ?auto_215646 ?auto_215652 ) ) ( not ( = ?auto_215646 ?auto_215653 ) ) ( not ( = ?auto_215646 ?auto_215654 ) ) ( not ( = ?auto_215646 ?auto_215655 ) ) ( not ( = ?auto_215646 ?auto_215656 ) ) ( not ( = ?auto_215647 ?auto_215648 ) ) ( not ( = ?auto_215647 ?auto_215649 ) ) ( not ( = ?auto_215647 ?auto_215650 ) ) ( not ( = ?auto_215647 ?auto_215651 ) ) ( not ( = ?auto_215647 ?auto_215652 ) ) ( not ( = ?auto_215647 ?auto_215653 ) ) ( not ( = ?auto_215647 ?auto_215654 ) ) ( not ( = ?auto_215647 ?auto_215655 ) ) ( not ( = ?auto_215647 ?auto_215656 ) ) ( not ( = ?auto_215648 ?auto_215649 ) ) ( not ( = ?auto_215648 ?auto_215650 ) ) ( not ( = ?auto_215648 ?auto_215651 ) ) ( not ( = ?auto_215648 ?auto_215652 ) ) ( not ( = ?auto_215648 ?auto_215653 ) ) ( not ( = ?auto_215648 ?auto_215654 ) ) ( not ( = ?auto_215648 ?auto_215655 ) ) ( not ( = ?auto_215648 ?auto_215656 ) ) ( not ( = ?auto_215649 ?auto_215650 ) ) ( not ( = ?auto_215649 ?auto_215651 ) ) ( not ( = ?auto_215649 ?auto_215652 ) ) ( not ( = ?auto_215649 ?auto_215653 ) ) ( not ( = ?auto_215649 ?auto_215654 ) ) ( not ( = ?auto_215649 ?auto_215655 ) ) ( not ( = ?auto_215649 ?auto_215656 ) ) ( not ( = ?auto_215650 ?auto_215651 ) ) ( not ( = ?auto_215650 ?auto_215652 ) ) ( not ( = ?auto_215650 ?auto_215653 ) ) ( not ( = ?auto_215650 ?auto_215654 ) ) ( not ( = ?auto_215650 ?auto_215655 ) ) ( not ( = ?auto_215650 ?auto_215656 ) ) ( not ( = ?auto_215651 ?auto_215652 ) ) ( not ( = ?auto_215651 ?auto_215653 ) ) ( not ( = ?auto_215651 ?auto_215654 ) ) ( not ( = ?auto_215651 ?auto_215655 ) ) ( not ( = ?auto_215651 ?auto_215656 ) ) ( not ( = ?auto_215652 ?auto_215653 ) ) ( not ( = ?auto_215652 ?auto_215654 ) ) ( not ( = ?auto_215652 ?auto_215655 ) ) ( not ( = ?auto_215652 ?auto_215656 ) ) ( not ( = ?auto_215653 ?auto_215654 ) ) ( not ( = ?auto_215653 ?auto_215655 ) ) ( not ( = ?auto_215653 ?auto_215656 ) ) ( not ( = ?auto_215654 ?auto_215655 ) ) ( not ( = ?auto_215654 ?auto_215656 ) ) ( not ( = ?auto_215655 ?auto_215656 ) ) ( ON ?auto_215655 ?auto_215656 ) ( ON ?auto_215654 ?auto_215655 ) ( ON ?auto_215653 ?auto_215654 ) ( ON ?auto_215652 ?auto_215653 ) ( ON ?auto_215651 ?auto_215652 ) ( ON ?auto_215650 ?auto_215651 ) ( ON ?auto_215649 ?auto_215650 ) ( CLEAR ?auto_215647 ) ( ON ?auto_215648 ?auto_215649 ) ( CLEAR ?auto_215648 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_215644 ?auto_215645 ?auto_215646 ?auto_215647 ?auto_215648 )
      ( MAKE-13PILE ?auto_215644 ?auto_215645 ?auto_215646 ?auto_215647 ?auto_215648 ?auto_215649 ?auto_215650 ?auto_215651 ?auto_215652 ?auto_215653 ?auto_215654 ?auto_215655 ?auto_215656 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_215670 - BLOCK
      ?auto_215671 - BLOCK
      ?auto_215672 - BLOCK
      ?auto_215673 - BLOCK
      ?auto_215674 - BLOCK
      ?auto_215675 - BLOCK
      ?auto_215676 - BLOCK
      ?auto_215677 - BLOCK
      ?auto_215678 - BLOCK
      ?auto_215679 - BLOCK
      ?auto_215680 - BLOCK
      ?auto_215681 - BLOCK
      ?auto_215682 - BLOCK
    )
    :vars
    (
      ?auto_215683 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_215682 ?auto_215683 ) ( ON-TABLE ?auto_215670 ) ( ON ?auto_215671 ?auto_215670 ) ( ON ?auto_215672 ?auto_215671 ) ( not ( = ?auto_215670 ?auto_215671 ) ) ( not ( = ?auto_215670 ?auto_215672 ) ) ( not ( = ?auto_215670 ?auto_215673 ) ) ( not ( = ?auto_215670 ?auto_215674 ) ) ( not ( = ?auto_215670 ?auto_215675 ) ) ( not ( = ?auto_215670 ?auto_215676 ) ) ( not ( = ?auto_215670 ?auto_215677 ) ) ( not ( = ?auto_215670 ?auto_215678 ) ) ( not ( = ?auto_215670 ?auto_215679 ) ) ( not ( = ?auto_215670 ?auto_215680 ) ) ( not ( = ?auto_215670 ?auto_215681 ) ) ( not ( = ?auto_215670 ?auto_215682 ) ) ( not ( = ?auto_215670 ?auto_215683 ) ) ( not ( = ?auto_215671 ?auto_215672 ) ) ( not ( = ?auto_215671 ?auto_215673 ) ) ( not ( = ?auto_215671 ?auto_215674 ) ) ( not ( = ?auto_215671 ?auto_215675 ) ) ( not ( = ?auto_215671 ?auto_215676 ) ) ( not ( = ?auto_215671 ?auto_215677 ) ) ( not ( = ?auto_215671 ?auto_215678 ) ) ( not ( = ?auto_215671 ?auto_215679 ) ) ( not ( = ?auto_215671 ?auto_215680 ) ) ( not ( = ?auto_215671 ?auto_215681 ) ) ( not ( = ?auto_215671 ?auto_215682 ) ) ( not ( = ?auto_215671 ?auto_215683 ) ) ( not ( = ?auto_215672 ?auto_215673 ) ) ( not ( = ?auto_215672 ?auto_215674 ) ) ( not ( = ?auto_215672 ?auto_215675 ) ) ( not ( = ?auto_215672 ?auto_215676 ) ) ( not ( = ?auto_215672 ?auto_215677 ) ) ( not ( = ?auto_215672 ?auto_215678 ) ) ( not ( = ?auto_215672 ?auto_215679 ) ) ( not ( = ?auto_215672 ?auto_215680 ) ) ( not ( = ?auto_215672 ?auto_215681 ) ) ( not ( = ?auto_215672 ?auto_215682 ) ) ( not ( = ?auto_215672 ?auto_215683 ) ) ( not ( = ?auto_215673 ?auto_215674 ) ) ( not ( = ?auto_215673 ?auto_215675 ) ) ( not ( = ?auto_215673 ?auto_215676 ) ) ( not ( = ?auto_215673 ?auto_215677 ) ) ( not ( = ?auto_215673 ?auto_215678 ) ) ( not ( = ?auto_215673 ?auto_215679 ) ) ( not ( = ?auto_215673 ?auto_215680 ) ) ( not ( = ?auto_215673 ?auto_215681 ) ) ( not ( = ?auto_215673 ?auto_215682 ) ) ( not ( = ?auto_215673 ?auto_215683 ) ) ( not ( = ?auto_215674 ?auto_215675 ) ) ( not ( = ?auto_215674 ?auto_215676 ) ) ( not ( = ?auto_215674 ?auto_215677 ) ) ( not ( = ?auto_215674 ?auto_215678 ) ) ( not ( = ?auto_215674 ?auto_215679 ) ) ( not ( = ?auto_215674 ?auto_215680 ) ) ( not ( = ?auto_215674 ?auto_215681 ) ) ( not ( = ?auto_215674 ?auto_215682 ) ) ( not ( = ?auto_215674 ?auto_215683 ) ) ( not ( = ?auto_215675 ?auto_215676 ) ) ( not ( = ?auto_215675 ?auto_215677 ) ) ( not ( = ?auto_215675 ?auto_215678 ) ) ( not ( = ?auto_215675 ?auto_215679 ) ) ( not ( = ?auto_215675 ?auto_215680 ) ) ( not ( = ?auto_215675 ?auto_215681 ) ) ( not ( = ?auto_215675 ?auto_215682 ) ) ( not ( = ?auto_215675 ?auto_215683 ) ) ( not ( = ?auto_215676 ?auto_215677 ) ) ( not ( = ?auto_215676 ?auto_215678 ) ) ( not ( = ?auto_215676 ?auto_215679 ) ) ( not ( = ?auto_215676 ?auto_215680 ) ) ( not ( = ?auto_215676 ?auto_215681 ) ) ( not ( = ?auto_215676 ?auto_215682 ) ) ( not ( = ?auto_215676 ?auto_215683 ) ) ( not ( = ?auto_215677 ?auto_215678 ) ) ( not ( = ?auto_215677 ?auto_215679 ) ) ( not ( = ?auto_215677 ?auto_215680 ) ) ( not ( = ?auto_215677 ?auto_215681 ) ) ( not ( = ?auto_215677 ?auto_215682 ) ) ( not ( = ?auto_215677 ?auto_215683 ) ) ( not ( = ?auto_215678 ?auto_215679 ) ) ( not ( = ?auto_215678 ?auto_215680 ) ) ( not ( = ?auto_215678 ?auto_215681 ) ) ( not ( = ?auto_215678 ?auto_215682 ) ) ( not ( = ?auto_215678 ?auto_215683 ) ) ( not ( = ?auto_215679 ?auto_215680 ) ) ( not ( = ?auto_215679 ?auto_215681 ) ) ( not ( = ?auto_215679 ?auto_215682 ) ) ( not ( = ?auto_215679 ?auto_215683 ) ) ( not ( = ?auto_215680 ?auto_215681 ) ) ( not ( = ?auto_215680 ?auto_215682 ) ) ( not ( = ?auto_215680 ?auto_215683 ) ) ( not ( = ?auto_215681 ?auto_215682 ) ) ( not ( = ?auto_215681 ?auto_215683 ) ) ( not ( = ?auto_215682 ?auto_215683 ) ) ( ON ?auto_215681 ?auto_215682 ) ( ON ?auto_215680 ?auto_215681 ) ( ON ?auto_215679 ?auto_215680 ) ( ON ?auto_215678 ?auto_215679 ) ( ON ?auto_215677 ?auto_215678 ) ( ON ?auto_215676 ?auto_215677 ) ( ON ?auto_215675 ?auto_215676 ) ( ON ?auto_215674 ?auto_215675 ) ( CLEAR ?auto_215672 ) ( ON ?auto_215673 ?auto_215674 ) ( CLEAR ?auto_215673 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_215670 ?auto_215671 ?auto_215672 ?auto_215673 )
      ( MAKE-13PILE ?auto_215670 ?auto_215671 ?auto_215672 ?auto_215673 ?auto_215674 ?auto_215675 ?auto_215676 ?auto_215677 ?auto_215678 ?auto_215679 ?auto_215680 ?auto_215681 ?auto_215682 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_215697 - BLOCK
      ?auto_215698 - BLOCK
      ?auto_215699 - BLOCK
      ?auto_215700 - BLOCK
      ?auto_215701 - BLOCK
      ?auto_215702 - BLOCK
      ?auto_215703 - BLOCK
      ?auto_215704 - BLOCK
      ?auto_215705 - BLOCK
      ?auto_215706 - BLOCK
      ?auto_215707 - BLOCK
      ?auto_215708 - BLOCK
      ?auto_215709 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_215709 ) ( ON-TABLE ?auto_215697 ) ( ON ?auto_215698 ?auto_215697 ) ( ON ?auto_215699 ?auto_215698 ) ( not ( = ?auto_215697 ?auto_215698 ) ) ( not ( = ?auto_215697 ?auto_215699 ) ) ( not ( = ?auto_215697 ?auto_215700 ) ) ( not ( = ?auto_215697 ?auto_215701 ) ) ( not ( = ?auto_215697 ?auto_215702 ) ) ( not ( = ?auto_215697 ?auto_215703 ) ) ( not ( = ?auto_215697 ?auto_215704 ) ) ( not ( = ?auto_215697 ?auto_215705 ) ) ( not ( = ?auto_215697 ?auto_215706 ) ) ( not ( = ?auto_215697 ?auto_215707 ) ) ( not ( = ?auto_215697 ?auto_215708 ) ) ( not ( = ?auto_215697 ?auto_215709 ) ) ( not ( = ?auto_215698 ?auto_215699 ) ) ( not ( = ?auto_215698 ?auto_215700 ) ) ( not ( = ?auto_215698 ?auto_215701 ) ) ( not ( = ?auto_215698 ?auto_215702 ) ) ( not ( = ?auto_215698 ?auto_215703 ) ) ( not ( = ?auto_215698 ?auto_215704 ) ) ( not ( = ?auto_215698 ?auto_215705 ) ) ( not ( = ?auto_215698 ?auto_215706 ) ) ( not ( = ?auto_215698 ?auto_215707 ) ) ( not ( = ?auto_215698 ?auto_215708 ) ) ( not ( = ?auto_215698 ?auto_215709 ) ) ( not ( = ?auto_215699 ?auto_215700 ) ) ( not ( = ?auto_215699 ?auto_215701 ) ) ( not ( = ?auto_215699 ?auto_215702 ) ) ( not ( = ?auto_215699 ?auto_215703 ) ) ( not ( = ?auto_215699 ?auto_215704 ) ) ( not ( = ?auto_215699 ?auto_215705 ) ) ( not ( = ?auto_215699 ?auto_215706 ) ) ( not ( = ?auto_215699 ?auto_215707 ) ) ( not ( = ?auto_215699 ?auto_215708 ) ) ( not ( = ?auto_215699 ?auto_215709 ) ) ( not ( = ?auto_215700 ?auto_215701 ) ) ( not ( = ?auto_215700 ?auto_215702 ) ) ( not ( = ?auto_215700 ?auto_215703 ) ) ( not ( = ?auto_215700 ?auto_215704 ) ) ( not ( = ?auto_215700 ?auto_215705 ) ) ( not ( = ?auto_215700 ?auto_215706 ) ) ( not ( = ?auto_215700 ?auto_215707 ) ) ( not ( = ?auto_215700 ?auto_215708 ) ) ( not ( = ?auto_215700 ?auto_215709 ) ) ( not ( = ?auto_215701 ?auto_215702 ) ) ( not ( = ?auto_215701 ?auto_215703 ) ) ( not ( = ?auto_215701 ?auto_215704 ) ) ( not ( = ?auto_215701 ?auto_215705 ) ) ( not ( = ?auto_215701 ?auto_215706 ) ) ( not ( = ?auto_215701 ?auto_215707 ) ) ( not ( = ?auto_215701 ?auto_215708 ) ) ( not ( = ?auto_215701 ?auto_215709 ) ) ( not ( = ?auto_215702 ?auto_215703 ) ) ( not ( = ?auto_215702 ?auto_215704 ) ) ( not ( = ?auto_215702 ?auto_215705 ) ) ( not ( = ?auto_215702 ?auto_215706 ) ) ( not ( = ?auto_215702 ?auto_215707 ) ) ( not ( = ?auto_215702 ?auto_215708 ) ) ( not ( = ?auto_215702 ?auto_215709 ) ) ( not ( = ?auto_215703 ?auto_215704 ) ) ( not ( = ?auto_215703 ?auto_215705 ) ) ( not ( = ?auto_215703 ?auto_215706 ) ) ( not ( = ?auto_215703 ?auto_215707 ) ) ( not ( = ?auto_215703 ?auto_215708 ) ) ( not ( = ?auto_215703 ?auto_215709 ) ) ( not ( = ?auto_215704 ?auto_215705 ) ) ( not ( = ?auto_215704 ?auto_215706 ) ) ( not ( = ?auto_215704 ?auto_215707 ) ) ( not ( = ?auto_215704 ?auto_215708 ) ) ( not ( = ?auto_215704 ?auto_215709 ) ) ( not ( = ?auto_215705 ?auto_215706 ) ) ( not ( = ?auto_215705 ?auto_215707 ) ) ( not ( = ?auto_215705 ?auto_215708 ) ) ( not ( = ?auto_215705 ?auto_215709 ) ) ( not ( = ?auto_215706 ?auto_215707 ) ) ( not ( = ?auto_215706 ?auto_215708 ) ) ( not ( = ?auto_215706 ?auto_215709 ) ) ( not ( = ?auto_215707 ?auto_215708 ) ) ( not ( = ?auto_215707 ?auto_215709 ) ) ( not ( = ?auto_215708 ?auto_215709 ) ) ( ON ?auto_215708 ?auto_215709 ) ( ON ?auto_215707 ?auto_215708 ) ( ON ?auto_215706 ?auto_215707 ) ( ON ?auto_215705 ?auto_215706 ) ( ON ?auto_215704 ?auto_215705 ) ( ON ?auto_215703 ?auto_215704 ) ( ON ?auto_215702 ?auto_215703 ) ( ON ?auto_215701 ?auto_215702 ) ( CLEAR ?auto_215699 ) ( ON ?auto_215700 ?auto_215701 ) ( CLEAR ?auto_215700 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_215697 ?auto_215698 ?auto_215699 ?auto_215700 )
      ( MAKE-13PILE ?auto_215697 ?auto_215698 ?auto_215699 ?auto_215700 ?auto_215701 ?auto_215702 ?auto_215703 ?auto_215704 ?auto_215705 ?auto_215706 ?auto_215707 ?auto_215708 ?auto_215709 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_215723 - BLOCK
      ?auto_215724 - BLOCK
      ?auto_215725 - BLOCK
      ?auto_215726 - BLOCK
      ?auto_215727 - BLOCK
      ?auto_215728 - BLOCK
      ?auto_215729 - BLOCK
      ?auto_215730 - BLOCK
      ?auto_215731 - BLOCK
      ?auto_215732 - BLOCK
      ?auto_215733 - BLOCK
      ?auto_215734 - BLOCK
      ?auto_215735 - BLOCK
    )
    :vars
    (
      ?auto_215736 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_215735 ?auto_215736 ) ( ON-TABLE ?auto_215723 ) ( ON ?auto_215724 ?auto_215723 ) ( not ( = ?auto_215723 ?auto_215724 ) ) ( not ( = ?auto_215723 ?auto_215725 ) ) ( not ( = ?auto_215723 ?auto_215726 ) ) ( not ( = ?auto_215723 ?auto_215727 ) ) ( not ( = ?auto_215723 ?auto_215728 ) ) ( not ( = ?auto_215723 ?auto_215729 ) ) ( not ( = ?auto_215723 ?auto_215730 ) ) ( not ( = ?auto_215723 ?auto_215731 ) ) ( not ( = ?auto_215723 ?auto_215732 ) ) ( not ( = ?auto_215723 ?auto_215733 ) ) ( not ( = ?auto_215723 ?auto_215734 ) ) ( not ( = ?auto_215723 ?auto_215735 ) ) ( not ( = ?auto_215723 ?auto_215736 ) ) ( not ( = ?auto_215724 ?auto_215725 ) ) ( not ( = ?auto_215724 ?auto_215726 ) ) ( not ( = ?auto_215724 ?auto_215727 ) ) ( not ( = ?auto_215724 ?auto_215728 ) ) ( not ( = ?auto_215724 ?auto_215729 ) ) ( not ( = ?auto_215724 ?auto_215730 ) ) ( not ( = ?auto_215724 ?auto_215731 ) ) ( not ( = ?auto_215724 ?auto_215732 ) ) ( not ( = ?auto_215724 ?auto_215733 ) ) ( not ( = ?auto_215724 ?auto_215734 ) ) ( not ( = ?auto_215724 ?auto_215735 ) ) ( not ( = ?auto_215724 ?auto_215736 ) ) ( not ( = ?auto_215725 ?auto_215726 ) ) ( not ( = ?auto_215725 ?auto_215727 ) ) ( not ( = ?auto_215725 ?auto_215728 ) ) ( not ( = ?auto_215725 ?auto_215729 ) ) ( not ( = ?auto_215725 ?auto_215730 ) ) ( not ( = ?auto_215725 ?auto_215731 ) ) ( not ( = ?auto_215725 ?auto_215732 ) ) ( not ( = ?auto_215725 ?auto_215733 ) ) ( not ( = ?auto_215725 ?auto_215734 ) ) ( not ( = ?auto_215725 ?auto_215735 ) ) ( not ( = ?auto_215725 ?auto_215736 ) ) ( not ( = ?auto_215726 ?auto_215727 ) ) ( not ( = ?auto_215726 ?auto_215728 ) ) ( not ( = ?auto_215726 ?auto_215729 ) ) ( not ( = ?auto_215726 ?auto_215730 ) ) ( not ( = ?auto_215726 ?auto_215731 ) ) ( not ( = ?auto_215726 ?auto_215732 ) ) ( not ( = ?auto_215726 ?auto_215733 ) ) ( not ( = ?auto_215726 ?auto_215734 ) ) ( not ( = ?auto_215726 ?auto_215735 ) ) ( not ( = ?auto_215726 ?auto_215736 ) ) ( not ( = ?auto_215727 ?auto_215728 ) ) ( not ( = ?auto_215727 ?auto_215729 ) ) ( not ( = ?auto_215727 ?auto_215730 ) ) ( not ( = ?auto_215727 ?auto_215731 ) ) ( not ( = ?auto_215727 ?auto_215732 ) ) ( not ( = ?auto_215727 ?auto_215733 ) ) ( not ( = ?auto_215727 ?auto_215734 ) ) ( not ( = ?auto_215727 ?auto_215735 ) ) ( not ( = ?auto_215727 ?auto_215736 ) ) ( not ( = ?auto_215728 ?auto_215729 ) ) ( not ( = ?auto_215728 ?auto_215730 ) ) ( not ( = ?auto_215728 ?auto_215731 ) ) ( not ( = ?auto_215728 ?auto_215732 ) ) ( not ( = ?auto_215728 ?auto_215733 ) ) ( not ( = ?auto_215728 ?auto_215734 ) ) ( not ( = ?auto_215728 ?auto_215735 ) ) ( not ( = ?auto_215728 ?auto_215736 ) ) ( not ( = ?auto_215729 ?auto_215730 ) ) ( not ( = ?auto_215729 ?auto_215731 ) ) ( not ( = ?auto_215729 ?auto_215732 ) ) ( not ( = ?auto_215729 ?auto_215733 ) ) ( not ( = ?auto_215729 ?auto_215734 ) ) ( not ( = ?auto_215729 ?auto_215735 ) ) ( not ( = ?auto_215729 ?auto_215736 ) ) ( not ( = ?auto_215730 ?auto_215731 ) ) ( not ( = ?auto_215730 ?auto_215732 ) ) ( not ( = ?auto_215730 ?auto_215733 ) ) ( not ( = ?auto_215730 ?auto_215734 ) ) ( not ( = ?auto_215730 ?auto_215735 ) ) ( not ( = ?auto_215730 ?auto_215736 ) ) ( not ( = ?auto_215731 ?auto_215732 ) ) ( not ( = ?auto_215731 ?auto_215733 ) ) ( not ( = ?auto_215731 ?auto_215734 ) ) ( not ( = ?auto_215731 ?auto_215735 ) ) ( not ( = ?auto_215731 ?auto_215736 ) ) ( not ( = ?auto_215732 ?auto_215733 ) ) ( not ( = ?auto_215732 ?auto_215734 ) ) ( not ( = ?auto_215732 ?auto_215735 ) ) ( not ( = ?auto_215732 ?auto_215736 ) ) ( not ( = ?auto_215733 ?auto_215734 ) ) ( not ( = ?auto_215733 ?auto_215735 ) ) ( not ( = ?auto_215733 ?auto_215736 ) ) ( not ( = ?auto_215734 ?auto_215735 ) ) ( not ( = ?auto_215734 ?auto_215736 ) ) ( not ( = ?auto_215735 ?auto_215736 ) ) ( ON ?auto_215734 ?auto_215735 ) ( ON ?auto_215733 ?auto_215734 ) ( ON ?auto_215732 ?auto_215733 ) ( ON ?auto_215731 ?auto_215732 ) ( ON ?auto_215730 ?auto_215731 ) ( ON ?auto_215729 ?auto_215730 ) ( ON ?auto_215728 ?auto_215729 ) ( ON ?auto_215727 ?auto_215728 ) ( ON ?auto_215726 ?auto_215727 ) ( CLEAR ?auto_215724 ) ( ON ?auto_215725 ?auto_215726 ) ( CLEAR ?auto_215725 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_215723 ?auto_215724 ?auto_215725 )
      ( MAKE-13PILE ?auto_215723 ?auto_215724 ?auto_215725 ?auto_215726 ?auto_215727 ?auto_215728 ?auto_215729 ?auto_215730 ?auto_215731 ?auto_215732 ?auto_215733 ?auto_215734 ?auto_215735 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_215750 - BLOCK
      ?auto_215751 - BLOCK
      ?auto_215752 - BLOCK
      ?auto_215753 - BLOCK
      ?auto_215754 - BLOCK
      ?auto_215755 - BLOCK
      ?auto_215756 - BLOCK
      ?auto_215757 - BLOCK
      ?auto_215758 - BLOCK
      ?auto_215759 - BLOCK
      ?auto_215760 - BLOCK
      ?auto_215761 - BLOCK
      ?auto_215762 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_215762 ) ( ON-TABLE ?auto_215750 ) ( ON ?auto_215751 ?auto_215750 ) ( not ( = ?auto_215750 ?auto_215751 ) ) ( not ( = ?auto_215750 ?auto_215752 ) ) ( not ( = ?auto_215750 ?auto_215753 ) ) ( not ( = ?auto_215750 ?auto_215754 ) ) ( not ( = ?auto_215750 ?auto_215755 ) ) ( not ( = ?auto_215750 ?auto_215756 ) ) ( not ( = ?auto_215750 ?auto_215757 ) ) ( not ( = ?auto_215750 ?auto_215758 ) ) ( not ( = ?auto_215750 ?auto_215759 ) ) ( not ( = ?auto_215750 ?auto_215760 ) ) ( not ( = ?auto_215750 ?auto_215761 ) ) ( not ( = ?auto_215750 ?auto_215762 ) ) ( not ( = ?auto_215751 ?auto_215752 ) ) ( not ( = ?auto_215751 ?auto_215753 ) ) ( not ( = ?auto_215751 ?auto_215754 ) ) ( not ( = ?auto_215751 ?auto_215755 ) ) ( not ( = ?auto_215751 ?auto_215756 ) ) ( not ( = ?auto_215751 ?auto_215757 ) ) ( not ( = ?auto_215751 ?auto_215758 ) ) ( not ( = ?auto_215751 ?auto_215759 ) ) ( not ( = ?auto_215751 ?auto_215760 ) ) ( not ( = ?auto_215751 ?auto_215761 ) ) ( not ( = ?auto_215751 ?auto_215762 ) ) ( not ( = ?auto_215752 ?auto_215753 ) ) ( not ( = ?auto_215752 ?auto_215754 ) ) ( not ( = ?auto_215752 ?auto_215755 ) ) ( not ( = ?auto_215752 ?auto_215756 ) ) ( not ( = ?auto_215752 ?auto_215757 ) ) ( not ( = ?auto_215752 ?auto_215758 ) ) ( not ( = ?auto_215752 ?auto_215759 ) ) ( not ( = ?auto_215752 ?auto_215760 ) ) ( not ( = ?auto_215752 ?auto_215761 ) ) ( not ( = ?auto_215752 ?auto_215762 ) ) ( not ( = ?auto_215753 ?auto_215754 ) ) ( not ( = ?auto_215753 ?auto_215755 ) ) ( not ( = ?auto_215753 ?auto_215756 ) ) ( not ( = ?auto_215753 ?auto_215757 ) ) ( not ( = ?auto_215753 ?auto_215758 ) ) ( not ( = ?auto_215753 ?auto_215759 ) ) ( not ( = ?auto_215753 ?auto_215760 ) ) ( not ( = ?auto_215753 ?auto_215761 ) ) ( not ( = ?auto_215753 ?auto_215762 ) ) ( not ( = ?auto_215754 ?auto_215755 ) ) ( not ( = ?auto_215754 ?auto_215756 ) ) ( not ( = ?auto_215754 ?auto_215757 ) ) ( not ( = ?auto_215754 ?auto_215758 ) ) ( not ( = ?auto_215754 ?auto_215759 ) ) ( not ( = ?auto_215754 ?auto_215760 ) ) ( not ( = ?auto_215754 ?auto_215761 ) ) ( not ( = ?auto_215754 ?auto_215762 ) ) ( not ( = ?auto_215755 ?auto_215756 ) ) ( not ( = ?auto_215755 ?auto_215757 ) ) ( not ( = ?auto_215755 ?auto_215758 ) ) ( not ( = ?auto_215755 ?auto_215759 ) ) ( not ( = ?auto_215755 ?auto_215760 ) ) ( not ( = ?auto_215755 ?auto_215761 ) ) ( not ( = ?auto_215755 ?auto_215762 ) ) ( not ( = ?auto_215756 ?auto_215757 ) ) ( not ( = ?auto_215756 ?auto_215758 ) ) ( not ( = ?auto_215756 ?auto_215759 ) ) ( not ( = ?auto_215756 ?auto_215760 ) ) ( not ( = ?auto_215756 ?auto_215761 ) ) ( not ( = ?auto_215756 ?auto_215762 ) ) ( not ( = ?auto_215757 ?auto_215758 ) ) ( not ( = ?auto_215757 ?auto_215759 ) ) ( not ( = ?auto_215757 ?auto_215760 ) ) ( not ( = ?auto_215757 ?auto_215761 ) ) ( not ( = ?auto_215757 ?auto_215762 ) ) ( not ( = ?auto_215758 ?auto_215759 ) ) ( not ( = ?auto_215758 ?auto_215760 ) ) ( not ( = ?auto_215758 ?auto_215761 ) ) ( not ( = ?auto_215758 ?auto_215762 ) ) ( not ( = ?auto_215759 ?auto_215760 ) ) ( not ( = ?auto_215759 ?auto_215761 ) ) ( not ( = ?auto_215759 ?auto_215762 ) ) ( not ( = ?auto_215760 ?auto_215761 ) ) ( not ( = ?auto_215760 ?auto_215762 ) ) ( not ( = ?auto_215761 ?auto_215762 ) ) ( ON ?auto_215761 ?auto_215762 ) ( ON ?auto_215760 ?auto_215761 ) ( ON ?auto_215759 ?auto_215760 ) ( ON ?auto_215758 ?auto_215759 ) ( ON ?auto_215757 ?auto_215758 ) ( ON ?auto_215756 ?auto_215757 ) ( ON ?auto_215755 ?auto_215756 ) ( ON ?auto_215754 ?auto_215755 ) ( ON ?auto_215753 ?auto_215754 ) ( CLEAR ?auto_215751 ) ( ON ?auto_215752 ?auto_215753 ) ( CLEAR ?auto_215752 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_215750 ?auto_215751 ?auto_215752 )
      ( MAKE-13PILE ?auto_215750 ?auto_215751 ?auto_215752 ?auto_215753 ?auto_215754 ?auto_215755 ?auto_215756 ?auto_215757 ?auto_215758 ?auto_215759 ?auto_215760 ?auto_215761 ?auto_215762 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_215776 - BLOCK
      ?auto_215777 - BLOCK
      ?auto_215778 - BLOCK
      ?auto_215779 - BLOCK
      ?auto_215780 - BLOCK
      ?auto_215781 - BLOCK
      ?auto_215782 - BLOCK
      ?auto_215783 - BLOCK
      ?auto_215784 - BLOCK
      ?auto_215785 - BLOCK
      ?auto_215786 - BLOCK
      ?auto_215787 - BLOCK
      ?auto_215788 - BLOCK
    )
    :vars
    (
      ?auto_215789 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_215788 ?auto_215789 ) ( ON-TABLE ?auto_215776 ) ( not ( = ?auto_215776 ?auto_215777 ) ) ( not ( = ?auto_215776 ?auto_215778 ) ) ( not ( = ?auto_215776 ?auto_215779 ) ) ( not ( = ?auto_215776 ?auto_215780 ) ) ( not ( = ?auto_215776 ?auto_215781 ) ) ( not ( = ?auto_215776 ?auto_215782 ) ) ( not ( = ?auto_215776 ?auto_215783 ) ) ( not ( = ?auto_215776 ?auto_215784 ) ) ( not ( = ?auto_215776 ?auto_215785 ) ) ( not ( = ?auto_215776 ?auto_215786 ) ) ( not ( = ?auto_215776 ?auto_215787 ) ) ( not ( = ?auto_215776 ?auto_215788 ) ) ( not ( = ?auto_215776 ?auto_215789 ) ) ( not ( = ?auto_215777 ?auto_215778 ) ) ( not ( = ?auto_215777 ?auto_215779 ) ) ( not ( = ?auto_215777 ?auto_215780 ) ) ( not ( = ?auto_215777 ?auto_215781 ) ) ( not ( = ?auto_215777 ?auto_215782 ) ) ( not ( = ?auto_215777 ?auto_215783 ) ) ( not ( = ?auto_215777 ?auto_215784 ) ) ( not ( = ?auto_215777 ?auto_215785 ) ) ( not ( = ?auto_215777 ?auto_215786 ) ) ( not ( = ?auto_215777 ?auto_215787 ) ) ( not ( = ?auto_215777 ?auto_215788 ) ) ( not ( = ?auto_215777 ?auto_215789 ) ) ( not ( = ?auto_215778 ?auto_215779 ) ) ( not ( = ?auto_215778 ?auto_215780 ) ) ( not ( = ?auto_215778 ?auto_215781 ) ) ( not ( = ?auto_215778 ?auto_215782 ) ) ( not ( = ?auto_215778 ?auto_215783 ) ) ( not ( = ?auto_215778 ?auto_215784 ) ) ( not ( = ?auto_215778 ?auto_215785 ) ) ( not ( = ?auto_215778 ?auto_215786 ) ) ( not ( = ?auto_215778 ?auto_215787 ) ) ( not ( = ?auto_215778 ?auto_215788 ) ) ( not ( = ?auto_215778 ?auto_215789 ) ) ( not ( = ?auto_215779 ?auto_215780 ) ) ( not ( = ?auto_215779 ?auto_215781 ) ) ( not ( = ?auto_215779 ?auto_215782 ) ) ( not ( = ?auto_215779 ?auto_215783 ) ) ( not ( = ?auto_215779 ?auto_215784 ) ) ( not ( = ?auto_215779 ?auto_215785 ) ) ( not ( = ?auto_215779 ?auto_215786 ) ) ( not ( = ?auto_215779 ?auto_215787 ) ) ( not ( = ?auto_215779 ?auto_215788 ) ) ( not ( = ?auto_215779 ?auto_215789 ) ) ( not ( = ?auto_215780 ?auto_215781 ) ) ( not ( = ?auto_215780 ?auto_215782 ) ) ( not ( = ?auto_215780 ?auto_215783 ) ) ( not ( = ?auto_215780 ?auto_215784 ) ) ( not ( = ?auto_215780 ?auto_215785 ) ) ( not ( = ?auto_215780 ?auto_215786 ) ) ( not ( = ?auto_215780 ?auto_215787 ) ) ( not ( = ?auto_215780 ?auto_215788 ) ) ( not ( = ?auto_215780 ?auto_215789 ) ) ( not ( = ?auto_215781 ?auto_215782 ) ) ( not ( = ?auto_215781 ?auto_215783 ) ) ( not ( = ?auto_215781 ?auto_215784 ) ) ( not ( = ?auto_215781 ?auto_215785 ) ) ( not ( = ?auto_215781 ?auto_215786 ) ) ( not ( = ?auto_215781 ?auto_215787 ) ) ( not ( = ?auto_215781 ?auto_215788 ) ) ( not ( = ?auto_215781 ?auto_215789 ) ) ( not ( = ?auto_215782 ?auto_215783 ) ) ( not ( = ?auto_215782 ?auto_215784 ) ) ( not ( = ?auto_215782 ?auto_215785 ) ) ( not ( = ?auto_215782 ?auto_215786 ) ) ( not ( = ?auto_215782 ?auto_215787 ) ) ( not ( = ?auto_215782 ?auto_215788 ) ) ( not ( = ?auto_215782 ?auto_215789 ) ) ( not ( = ?auto_215783 ?auto_215784 ) ) ( not ( = ?auto_215783 ?auto_215785 ) ) ( not ( = ?auto_215783 ?auto_215786 ) ) ( not ( = ?auto_215783 ?auto_215787 ) ) ( not ( = ?auto_215783 ?auto_215788 ) ) ( not ( = ?auto_215783 ?auto_215789 ) ) ( not ( = ?auto_215784 ?auto_215785 ) ) ( not ( = ?auto_215784 ?auto_215786 ) ) ( not ( = ?auto_215784 ?auto_215787 ) ) ( not ( = ?auto_215784 ?auto_215788 ) ) ( not ( = ?auto_215784 ?auto_215789 ) ) ( not ( = ?auto_215785 ?auto_215786 ) ) ( not ( = ?auto_215785 ?auto_215787 ) ) ( not ( = ?auto_215785 ?auto_215788 ) ) ( not ( = ?auto_215785 ?auto_215789 ) ) ( not ( = ?auto_215786 ?auto_215787 ) ) ( not ( = ?auto_215786 ?auto_215788 ) ) ( not ( = ?auto_215786 ?auto_215789 ) ) ( not ( = ?auto_215787 ?auto_215788 ) ) ( not ( = ?auto_215787 ?auto_215789 ) ) ( not ( = ?auto_215788 ?auto_215789 ) ) ( ON ?auto_215787 ?auto_215788 ) ( ON ?auto_215786 ?auto_215787 ) ( ON ?auto_215785 ?auto_215786 ) ( ON ?auto_215784 ?auto_215785 ) ( ON ?auto_215783 ?auto_215784 ) ( ON ?auto_215782 ?auto_215783 ) ( ON ?auto_215781 ?auto_215782 ) ( ON ?auto_215780 ?auto_215781 ) ( ON ?auto_215779 ?auto_215780 ) ( ON ?auto_215778 ?auto_215779 ) ( CLEAR ?auto_215776 ) ( ON ?auto_215777 ?auto_215778 ) ( CLEAR ?auto_215777 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_215776 ?auto_215777 )
      ( MAKE-13PILE ?auto_215776 ?auto_215777 ?auto_215778 ?auto_215779 ?auto_215780 ?auto_215781 ?auto_215782 ?auto_215783 ?auto_215784 ?auto_215785 ?auto_215786 ?auto_215787 ?auto_215788 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_215803 - BLOCK
      ?auto_215804 - BLOCK
      ?auto_215805 - BLOCK
      ?auto_215806 - BLOCK
      ?auto_215807 - BLOCK
      ?auto_215808 - BLOCK
      ?auto_215809 - BLOCK
      ?auto_215810 - BLOCK
      ?auto_215811 - BLOCK
      ?auto_215812 - BLOCK
      ?auto_215813 - BLOCK
      ?auto_215814 - BLOCK
      ?auto_215815 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_215815 ) ( ON-TABLE ?auto_215803 ) ( not ( = ?auto_215803 ?auto_215804 ) ) ( not ( = ?auto_215803 ?auto_215805 ) ) ( not ( = ?auto_215803 ?auto_215806 ) ) ( not ( = ?auto_215803 ?auto_215807 ) ) ( not ( = ?auto_215803 ?auto_215808 ) ) ( not ( = ?auto_215803 ?auto_215809 ) ) ( not ( = ?auto_215803 ?auto_215810 ) ) ( not ( = ?auto_215803 ?auto_215811 ) ) ( not ( = ?auto_215803 ?auto_215812 ) ) ( not ( = ?auto_215803 ?auto_215813 ) ) ( not ( = ?auto_215803 ?auto_215814 ) ) ( not ( = ?auto_215803 ?auto_215815 ) ) ( not ( = ?auto_215804 ?auto_215805 ) ) ( not ( = ?auto_215804 ?auto_215806 ) ) ( not ( = ?auto_215804 ?auto_215807 ) ) ( not ( = ?auto_215804 ?auto_215808 ) ) ( not ( = ?auto_215804 ?auto_215809 ) ) ( not ( = ?auto_215804 ?auto_215810 ) ) ( not ( = ?auto_215804 ?auto_215811 ) ) ( not ( = ?auto_215804 ?auto_215812 ) ) ( not ( = ?auto_215804 ?auto_215813 ) ) ( not ( = ?auto_215804 ?auto_215814 ) ) ( not ( = ?auto_215804 ?auto_215815 ) ) ( not ( = ?auto_215805 ?auto_215806 ) ) ( not ( = ?auto_215805 ?auto_215807 ) ) ( not ( = ?auto_215805 ?auto_215808 ) ) ( not ( = ?auto_215805 ?auto_215809 ) ) ( not ( = ?auto_215805 ?auto_215810 ) ) ( not ( = ?auto_215805 ?auto_215811 ) ) ( not ( = ?auto_215805 ?auto_215812 ) ) ( not ( = ?auto_215805 ?auto_215813 ) ) ( not ( = ?auto_215805 ?auto_215814 ) ) ( not ( = ?auto_215805 ?auto_215815 ) ) ( not ( = ?auto_215806 ?auto_215807 ) ) ( not ( = ?auto_215806 ?auto_215808 ) ) ( not ( = ?auto_215806 ?auto_215809 ) ) ( not ( = ?auto_215806 ?auto_215810 ) ) ( not ( = ?auto_215806 ?auto_215811 ) ) ( not ( = ?auto_215806 ?auto_215812 ) ) ( not ( = ?auto_215806 ?auto_215813 ) ) ( not ( = ?auto_215806 ?auto_215814 ) ) ( not ( = ?auto_215806 ?auto_215815 ) ) ( not ( = ?auto_215807 ?auto_215808 ) ) ( not ( = ?auto_215807 ?auto_215809 ) ) ( not ( = ?auto_215807 ?auto_215810 ) ) ( not ( = ?auto_215807 ?auto_215811 ) ) ( not ( = ?auto_215807 ?auto_215812 ) ) ( not ( = ?auto_215807 ?auto_215813 ) ) ( not ( = ?auto_215807 ?auto_215814 ) ) ( not ( = ?auto_215807 ?auto_215815 ) ) ( not ( = ?auto_215808 ?auto_215809 ) ) ( not ( = ?auto_215808 ?auto_215810 ) ) ( not ( = ?auto_215808 ?auto_215811 ) ) ( not ( = ?auto_215808 ?auto_215812 ) ) ( not ( = ?auto_215808 ?auto_215813 ) ) ( not ( = ?auto_215808 ?auto_215814 ) ) ( not ( = ?auto_215808 ?auto_215815 ) ) ( not ( = ?auto_215809 ?auto_215810 ) ) ( not ( = ?auto_215809 ?auto_215811 ) ) ( not ( = ?auto_215809 ?auto_215812 ) ) ( not ( = ?auto_215809 ?auto_215813 ) ) ( not ( = ?auto_215809 ?auto_215814 ) ) ( not ( = ?auto_215809 ?auto_215815 ) ) ( not ( = ?auto_215810 ?auto_215811 ) ) ( not ( = ?auto_215810 ?auto_215812 ) ) ( not ( = ?auto_215810 ?auto_215813 ) ) ( not ( = ?auto_215810 ?auto_215814 ) ) ( not ( = ?auto_215810 ?auto_215815 ) ) ( not ( = ?auto_215811 ?auto_215812 ) ) ( not ( = ?auto_215811 ?auto_215813 ) ) ( not ( = ?auto_215811 ?auto_215814 ) ) ( not ( = ?auto_215811 ?auto_215815 ) ) ( not ( = ?auto_215812 ?auto_215813 ) ) ( not ( = ?auto_215812 ?auto_215814 ) ) ( not ( = ?auto_215812 ?auto_215815 ) ) ( not ( = ?auto_215813 ?auto_215814 ) ) ( not ( = ?auto_215813 ?auto_215815 ) ) ( not ( = ?auto_215814 ?auto_215815 ) ) ( ON ?auto_215814 ?auto_215815 ) ( ON ?auto_215813 ?auto_215814 ) ( ON ?auto_215812 ?auto_215813 ) ( ON ?auto_215811 ?auto_215812 ) ( ON ?auto_215810 ?auto_215811 ) ( ON ?auto_215809 ?auto_215810 ) ( ON ?auto_215808 ?auto_215809 ) ( ON ?auto_215807 ?auto_215808 ) ( ON ?auto_215806 ?auto_215807 ) ( ON ?auto_215805 ?auto_215806 ) ( CLEAR ?auto_215803 ) ( ON ?auto_215804 ?auto_215805 ) ( CLEAR ?auto_215804 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_215803 ?auto_215804 )
      ( MAKE-13PILE ?auto_215803 ?auto_215804 ?auto_215805 ?auto_215806 ?auto_215807 ?auto_215808 ?auto_215809 ?auto_215810 ?auto_215811 ?auto_215812 ?auto_215813 ?auto_215814 ?auto_215815 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_215829 - BLOCK
      ?auto_215830 - BLOCK
      ?auto_215831 - BLOCK
      ?auto_215832 - BLOCK
      ?auto_215833 - BLOCK
      ?auto_215834 - BLOCK
      ?auto_215835 - BLOCK
      ?auto_215836 - BLOCK
      ?auto_215837 - BLOCK
      ?auto_215838 - BLOCK
      ?auto_215839 - BLOCK
      ?auto_215840 - BLOCK
      ?auto_215841 - BLOCK
    )
    :vars
    (
      ?auto_215842 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_215841 ?auto_215842 ) ( not ( = ?auto_215829 ?auto_215830 ) ) ( not ( = ?auto_215829 ?auto_215831 ) ) ( not ( = ?auto_215829 ?auto_215832 ) ) ( not ( = ?auto_215829 ?auto_215833 ) ) ( not ( = ?auto_215829 ?auto_215834 ) ) ( not ( = ?auto_215829 ?auto_215835 ) ) ( not ( = ?auto_215829 ?auto_215836 ) ) ( not ( = ?auto_215829 ?auto_215837 ) ) ( not ( = ?auto_215829 ?auto_215838 ) ) ( not ( = ?auto_215829 ?auto_215839 ) ) ( not ( = ?auto_215829 ?auto_215840 ) ) ( not ( = ?auto_215829 ?auto_215841 ) ) ( not ( = ?auto_215829 ?auto_215842 ) ) ( not ( = ?auto_215830 ?auto_215831 ) ) ( not ( = ?auto_215830 ?auto_215832 ) ) ( not ( = ?auto_215830 ?auto_215833 ) ) ( not ( = ?auto_215830 ?auto_215834 ) ) ( not ( = ?auto_215830 ?auto_215835 ) ) ( not ( = ?auto_215830 ?auto_215836 ) ) ( not ( = ?auto_215830 ?auto_215837 ) ) ( not ( = ?auto_215830 ?auto_215838 ) ) ( not ( = ?auto_215830 ?auto_215839 ) ) ( not ( = ?auto_215830 ?auto_215840 ) ) ( not ( = ?auto_215830 ?auto_215841 ) ) ( not ( = ?auto_215830 ?auto_215842 ) ) ( not ( = ?auto_215831 ?auto_215832 ) ) ( not ( = ?auto_215831 ?auto_215833 ) ) ( not ( = ?auto_215831 ?auto_215834 ) ) ( not ( = ?auto_215831 ?auto_215835 ) ) ( not ( = ?auto_215831 ?auto_215836 ) ) ( not ( = ?auto_215831 ?auto_215837 ) ) ( not ( = ?auto_215831 ?auto_215838 ) ) ( not ( = ?auto_215831 ?auto_215839 ) ) ( not ( = ?auto_215831 ?auto_215840 ) ) ( not ( = ?auto_215831 ?auto_215841 ) ) ( not ( = ?auto_215831 ?auto_215842 ) ) ( not ( = ?auto_215832 ?auto_215833 ) ) ( not ( = ?auto_215832 ?auto_215834 ) ) ( not ( = ?auto_215832 ?auto_215835 ) ) ( not ( = ?auto_215832 ?auto_215836 ) ) ( not ( = ?auto_215832 ?auto_215837 ) ) ( not ( = ?auto_215832 ?auto_215838 ) ) ( not ( = ?auto_215832 ?auto_215839 ) ) ( not ( = ?auto_215832 ?auto_215840 ) ) ( not ( = ?auto_215832 ?auto_215841 ) ) ( not ( = ?auto_215832 ?auto_215842 ) ) ( not ( = ?auto_215833 ?auto_215834 ) ) ( not ( = ?auto_215833 ?auto_215835 ) ) ( not ( = ?auto_215833 ?auto_215836 ) ) ( not ( = ?auto_215833 ?auto_215837 ) ) ( not ( = ?auto_215833 ?auto_215838 ) ) ( not ( = ?auto_215833 ?auto_215839 ) ) ( not ( = ?auto_215833 ?auto_215840 ) ) ( not ( = ?auto_215833 ?auto_215841 ) ) ( not ( = ?auto_215833 ?auto_215842 ) ) ( not ( = ?auto_215834 ?auto_215835 ) ) ( not ( = ?auto_215834 ?auto_215836 ) ) ( not ( = ?auto_215834 ?auto_215837 ) ) ( not ( = ?auto_215834 ?auto_215838 ) ) ( not ( = ?auto_215834 ?auto_215839 ) ) ( not ( = ?auto_215834 ?auto_215840 ) ) ( not ( = ?auto_215834 ?auto_215841 ) ) ( not ( = ?auto_215834 ?auto_215842 ) ) ( not ( = ?auto_215835 ?auto_215836 ) ) ( not ( = ?auto_215835 ?auto_215837 ) ) ( not ( = ?auto_215835 ?auto_215838 ) ) ( not ( = ?auto_215835 ?auto_215839 ) ) ( not ( = ?auto_215835 ?auto_215840 ) ) ( not ( = ?auto_215835 ?auto_215841 ) ) ( not ( = ?auto_215835 ?auto_215842 ) ) ( not ( = ?auto_215836 ?auto_215837 ) ) ( not ( = ?auto_215836 ?auto_215838 ) ) ( not ( = ?auto_215836 ?auto_215839 ) ) ( not ( = ?auto_215836 ?auto_215840 ) ) ( not ( = ?auto_215836 ?auto_215841 ) ) ( not ( = ?auto_215836 ?auto_215842 ) ) ( not ( = ?auto_215837 ?auto_215838 ) ) ( not ( = ?auto_215837 ?auto_215839 ) ) ( not ( = ?auto_215837 ?auto_215840 ) ) ( not ( = ?auto_215837 ?auto_215841 ) ) ( not ( = ?auto_215837 ?auto_215842 ) ) ( not ( = ?auto_215838 ?auto_215839 ) ) ( not ( = ?auto_215838 ?auto_215840 ) ) ( not ( = ?auto_215838 ?auto_215841 ) ) ( not ( = ?auto_215838 ?auto_215842 ) ) ( not ( = ?auto_215839 ?auto_215840 ) ) ( not ( = ?auto_215839 ?auto_215841 ) ) ( not ( = ?auto_215839 ?auto_215842 ) ) ( not ( = ?auto_215840 ?auto_215841 ) ) ( not ( = ?auto_215840 ?auto_215842 ) ) ( not ( = ?auto_215841 ?auto_215842 ) ) ( ON ?auto_215840 ?auto_215841 ) ( ON ?auto_215839 ?auto_215840 ) ( ON ?auto_215838 ?auto_215839 ) ( ON ?auto_215837 ?auto_215838 ) ( ON ?auto_215836 ?auto_215837 ) ( ON ?auto_215835 ?auto_215836 ) ( ON ?auto_215834 ?auto_215835 ) ( ON ?auto_215833 ?auto_215834 ) ( ON ?auto_215832 ?auto_215833 ) ( ON ?auto_215831 ?auto_215832 ) ( ON ?auto_215830 ?auto_215831 ) ( ON ?auto_215829 ?auto_215830 ) ( CLEAR ?auto_215829 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_215829 )
      ( MAKE-13PILE ?auto_215829 ?auto_215830 ?auto_215831 ?auto_215832 ?auto_215833 ?auto_215834 ?auto_215835 ?auto_215836 ?auto_215837 ?auto_215838 ?auto_215839 ?auto_215840 ?auto_215841 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_215856 - BLOCK
      ?auto_215857 - BLOCK
      ?auto_215858 - BLOCK
      ?auto_215859 - BLOCK
      ?auto_215860 - BLOCK
      ?auto_215861 - BLOCK
      ?auto_215862 - BLOCK
      ?auto_215863 - BLOCK
      ?auto_215864 - BLOCK
      ?auto_215865 - BLOCK
      ?auto_215866 - BLOCK
      ?auto_215867 - BLOCK
      ?auto_215868 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_215868 ) ( not ( = ?auto_215856 ?auto_215857 ) ) ( not ( = ?auto_215856 ?auto_215858 ) ) ( not ( = ?auto_215856 ?auto_215859 ) ) ( not ( = ?auto_215856 ?auto_215860 ) ) ( not ( = ?auto_215856 ?auto_215861 ) ) ( not ( = ?auto_215856 ?auto_215862 ) ) ( not ( = ?auto_215856 ?auto_215863 ) ) ( not ( = ?auto_215856 ?auto_215864 ) ) ( not ( = ?auto_215856 ?auto_215865 ) ) ( not ( = ?auto_215856 ?auto_215866 ) ) ( not ( = ?auto_215856 ?auto_215867 ) ) ( not ( = ?auto_215856 ?auto_215868 ) ) ( not ( = ?auto_215857 ?auto_215858 ) ) ( not ( = ?auto_215857 ?auto_215859 ) ) ( not ( = ?auto_215857 ?auto_215860 ) ) ( not ( = ?auto_215857 ?auto_215861 ) ) ( not ( = ?auto_215857 ?auto_215862 ) ) ( not ( = ?auto_215857 ?auto_215863 ) ) ( not ( = ?auto_215857 ?auto_215864 ) ) ( not ( = ?auto_215857 ?auto_215865 ) ) ( not ( = ?auto_215857 ?auto_215866 ) ) ( not ( = ?auto_215857 ?auto_215867 ) ) ( not ( = ?auto_215857 ?auto_215868 ) ) ( not ( = ?auto_215858 ?auto_215859 ) ) ( not ( = ?auto_215858 ?auto_215860 ) ) ( not ( = ?auto_215858 ?auto_215861 ) ) ( not ( = ?auto_215858 ?auto_215862 ) ) ( not ( = ?auto_215858 ?auto_215863 ) ) ( not ( = ?auto_215858 ?auto_215864 ) ) ( not ( = ?auto_215858 ?auto_215865 ) ) ( not ( = ?auto_215858 ?auto_215866 ) ) ( not ( = ?auto_215858 ?auto_215867 ) ) ( not ( = ?auto_215858 ?auto_215868 ) ) ( not ( = ?auto_215859 ?auto_215860 ) ) ( not ( = ?auto_215859 ?auto_215861 ) ) ( not ( = ?auto_215859 ?auto_215862 ) ) ( not ( = ?auto_215859 ?auto_215863 ) ) ( not ( = ?auto_215859 ?auto_215864 ) ) ( not ( = ?auto_215859 ?auto_215865 ) ) ( not ( = ?auto_215859 ?auto_215866 ) ) ( not ( = ?auto_215859 ?auto_215867 ) ) ( not ( = ?auto_215859 ?auto_215868 ) ) ( not ( = ?auto_215860 ?auto_215861 ) ) ( not ( = ?auto_215860 ?auto_215862 ) ) ( not ( = ?auto_215860 ?auto_215863 ) ) ( not ( = ?auto_215860 ?auto_215864 ) ) ( not ( = ?auto_215860 ?auto_215865 ) ) ( not ( = ?auto_215860 ?auto_215866 ) ) ( not ( = ?auto_215860 ?auto_215867 ) ) ( not ( = ?auto_215860 ?auto_215868 ) ) ( not ( = ?auto_215861 ?auto_215862 ) ) ( not ( = ?auto_215861 ?auto_215863 ) ) ( not ( = ?auto_215861 ?auto_215864 ) ) ( not ( = ?auto_215861 ?auto_215865 ) ) ( not ( = ?auto_215861 ?auto_215866 ) ) ( not ( = ?auto_215861 ?auto_215867 ) ) ( not ( = ?auto_215861 ?auto_215868 ) ) ( not ( = ?auto_215862 ?auto_215863 ) ) ( not ( = ?auto_215862 ?auto_215864 ) ) ( not ( = ?auto_215862 ?auto_215865 ) ) ( not ( = ?auto_215862 ?auto_215866 ) ) ( not ( = ?auto_215862 ?auto_215867 ) ) ( not ( = ?auto_215862 ?auto_215868 ) ) ( not ( = ?auto_215863 ?auto_215864 ) ) ( not ( = ?auto_215863 ?auto_215865 ) ) ( not ( = ?auto_215863 ?auto_215866 ) ) ( not ( = ?auto_215863 ?auto_215867 ) ) ( not ( = ?auto_215863 ?auto_215868 ) ) ( not ( = ?auto_215864 ?auto_215865 ) ) ( not ( = ?auto_215864 ?auto_215866 ) ) ( not ( = ?auto_215864 ?auto_215867 ) ) ( not ( = ?auto_215864 ?auto_215868 ) ) ( not ( = ?auto_215865 ?auto_215866 ) ) ( not ( = ?auto_215865 ?auto_215867 ) ) ( not ( = ?auto_215865 ?auto_215868 ) ) ( not ( = ?auto_215866 ?auto_215867 ) ) ( not ( = ?auto_215866 ?auto_215868 ) ) ( not ( = ?auto_215867 ?auto_215868 ) ) ( ON ?auto_215867 ?auto_215868 ) ( ON ?auto_215866 ?auto_215867 ) ( ON ?auto_215865 ?auto_215866 ) ( ON ?auto_215864 ?auto_215865 ) ( ON ?auto_215863 ?auto_215864 ) ( ON ?auto_215862 ?auto_215863 ) ( ON ?auto_215861 ?auto_215862 ) ( ON ?auto_215860 ?auto_215861 ) ( ON ?auto_215859 ?auto_215860 ) ( ON ?auto_215858 ?auto_215859 ) ( ON ?auto_215857 ?auto_215858 ) ( ON ?auto_215856 ?auto_215857 ) ( CLEAR ?auto_215856 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_215856 )
      ( MAKE-13PILE ?auto_215856 ?auto_215857 ?auto_215858 ?auto_215859 ?auto_215860 ?auto_215861 ?auto_215862 ?auto_215863 ?auto_215864 ?auto_215865 ?auto_215866 ?auto_215867 ?auto_215868 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_215882 - BLOCK
      ?auto_215883 - BLOCK
      ?auto_215884 - BLOCK
      ?auto_215885 - BLOCK
      ?auto_215886 - BLOCK
      ?auto_215887 - BLOCK
      ?auto_215888 - BLOCK
      ?auto_215889 - BLOCK
      ?auto_215890 - BLOCK
      ?auto_215891 - BLOCK
      ?auto_215892 - BLOCK
      ?auto_215893 - BLOCK
      ?auto_215894 - BLOCK
    )
    :vars
    (
      ?auto_215895 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_215882 ?auto_215883 ) ) ( not ( = ?auto_215882 ?auto_215884 ) ) ( not ( = ?auto_215882 ?auto_215885 ) ) ( not ( = ?auto_215882 ?auto_215886 ) ) ( not ( = ?auto_215882 ?auto_215887 ) ) ( not ( = ?auto_215882 ?auto_215888 ) ) ( not ( = ?auto_215882 ?auto_215889 ) ) ( not ( = ?auto_215882 ?auto_215890 ) ) ( not ( = ?auto_215882 ?auto_215891 ) ) ( not ( = ?auto_215882 ?auto_215892 ) ) ( not ( = ?auto_215882 ?auto_215893 ) ) ( not ( = ?auto_215882 ?auto_215894 ) ) ( not ( = ?auto_215883 ?auto_215884 ) ) ( not ( = ?auto_215883 ?auto_215885 ) ) ( not ( = ?auto_215883 ?auto_215886 ) ) ( not ( = ?auto_215883 ?auto_215887 ) ) ( not ( = ?auto_215883 ?auto_215888 ) ) ( not ( = ?auto_215883 ?auto_215889 ) ) ( not ( = ?auto_215883 ?auto_215890 ) ) ( not ( = ?auto_215883 ?auto_215891 ) ) ( not ( = ?auto_215883 ?auto_215892 ) ) ( not ( = ?auto_215883 ?auto_215893 ) ) ( not ( = ?auto_215883 ?auto_215894 ) ) ( not ( = ?auto_215884 ?auto_215885 ) ) ( not ( = ?auto_215884 ?auto_215886 ) ) ( not ( = ?auto_215884 ?auto_215887 ) ) ( not ( = ?auto_215884 ?auto_215888 ) ) ( not ( = ?auto_215884 ?auto_215889 ) ) ( not ( = ?auto_215884 ?auto_215890 ) ) ( not ( = ?auto_215884 ?auto_215891 ) ) ( not ( = ?auto_215884 ?auto_215892 ) ) ( not ( = ?auto_215884 ?auto_215893 ) ) ( not ( = ?auto_215884 ?auto_215894 ) ) ( not ( = ?auto_215885 ?auto_215886 ) ) ( not ( = ?auto_215885 ?auto_215887 ) ) ( not ( = ?auto_215885 ?auto_215888 ) ) ( not ( = ?auto_215885 ?auto_215889 ) ) ( not ( = ?auto_215885 ?auto_215890 ) ) ( not ( = ?auto_215885 ?auto_215891 ) ) ( not ( = ?auto_215885 ?auto_215892 ) ) ( not ( = ?auto_215885 ?auto_215893 ) ) ( not ( = ?auto_215885 ?auto_215894 ) ) ( not ( = ?auto_215886 ?auto_215887 ) ) ( not ( = ?auto_215886 ?auto_215888 ) ) ( not ( = ?auto_215886 ?auto_215889 ) ) ( not ( = ?auto_215886 ?auto_215890 ) ) ( not ( = ?auto_215886 ?auto_215891 ) ) ( not ( = ?auto_215886 ?auto_215892 ) ) ( not ( = ?auto_215886 ?auto_215893 ) ) ( not ( = ?auto_215886 ?auto_215894 ) ) ( not ( = ?auto_215887 ?auto_215888 ) ) ( not ( = ?auto_215887 ?auto_215889 ) ) ( not ( = ?auto_215887 ?auto_215890 ) ) ( not ( = ?auto_215887 ?auto_215891 ) ) ( not ( = ?auto_215887 ?auto_215892 ) ) ( not ( = ?auto_215887 ?auto_215893 ) ) ( not ( = ?auto_215887 ?auto_215894 ) ) ( not ( = ?auto_215888 ?auto_215889 ) ) ( not ( = ?auto_215888 ?auto_215890 ) ) ( not ( = ?auto_215888 ?auto_215891 ) ) ( not ( = ?auto_215888 ?auto_215892 ) ) ( not ( = ?auto_215888 ?auto_215893 ) ) ( not ( = ?auto_215888 ?auto_215894 ) ) ( not ( = ?auto_215889 ?auto_215890 ) ) ( not ( = ?auto_215889 ?auto_215891 ) ) ( not ( = ?auto_215889 ?auto_215892 ) ) ( not ( = ?auto_215889 ?auto_215893 ) ) ( not ( = ?auto_215889 ?auto_215894 ) ) ( not ( = ?auto_215890 ?auto_215891 ) ) ( not ( = ?auto_215890 ?auto_215892 ) ) ( not ( = ?auto_215890 ?auto_215893 ) ) ( not ( = ?auto_215890 ?auto_215894 ) ) ( not ( = ?auto_215891 ?auto_215892 ) ) ( not ( = ?auto_215891 ?auto_215893 ) ) ( not ( = ?auto_215891 ?auto_215894 ) ) ( not ( = ?auto_215892 ?auto_215893 ) ) ( not ( = ?auto_215892 ?auto_215894 ) ) ( not ( = ?auto_215893 ?auto_215894 ) ) ( ON ?auto_215882 ?auto_215895 ) ( not ( = ?auto_215894 ?auto_215895 ) ) ( not ( = ?auto_215893 ?auto_215895 ) ) ( not ( = ?auto_215892 ?auto_215895 ) ) ( not ( = ?auto_215891 ?auto_215895 ) ) ( not ( = ?auto_215890 ?auto_215895 ) ) ( not ( = ?auto_215889 ?auto_215895 ) ) ( not ( = ?auto_215888 ?auto_215895 ) ) ( not ( = ?auto_215887 ?auto_215895 ) ) ( not ( = ?auto_215886 ?auto_215895 ) ) ( not ( = ?auto_215885 ?auto_215895 ) ) ( not ( = ?auto_215884 ?auto_215895 ) ) ( not ( = ?auto_215883 ?auto_215895 ) ) ( not ( = ?auto_215882 ?auto_215895 ) ) ( ON ?auto_215883 ?auto_215882 ) ( ON ?auto_215884 ?auto_215883 ) ( ON ?auto_215885 ?auto_215884 ) ( ON ?auto_215886 ?auto_215885 ) ( ON ?auto_215887 ?auto_215886 ) ( ON ?auto_215888 ?auto_215887 ) ( ON ?auto_215889 ?auto_215888 ) ( ON ?auto_215890 ?auto_215889 ) ( ON ?auto_215891 ?auto_215890 ) ( ON ?auto_215892 ?auto_215891 ) ( ON ?auto_215893 ?auto_215892 ) ( ON ?auto_215894 ?auto_215893 ) ( CLEAR ?auto_215894 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_215894 ?auto_215893 ?auto_215892 ?auto_215891 ?auto_215890 ?auto_215889 ?auto_215888 ?auto_215887 ?auto_215886 ?auto_215885 ?auto_215884 ?auto_215883 ?auto_215882 )
      ( MAKE-13PILE ?auto_215882 ?auto_215883 ?auto_215884 ?auto_215885 ?auto_215886 ?auto_215887 ?auto_215888 ?auto_215889 ?auto_215890 ?auto_215891 ?auto_215892 ?auto_215893 ?auto_215894 ) )
  )

)

