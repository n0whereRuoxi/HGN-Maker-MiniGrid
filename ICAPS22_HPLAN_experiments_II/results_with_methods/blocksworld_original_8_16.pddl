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
      ?auto_200428 - BLOCK
      ?auto_200429 - BLOCK
      ?auto_200430 - BLOCK
      ?auto_200431 - BLOCK
      ?auto_200432 - BLOCK
      ?auto_200433 - BLOCK
      ?auto_200434 - BLOCK
      ?auto_200435 - BLOCK
    )
    :vars
    (
      ?auto_200436 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_200436 ?auto_200435 ) ( CLEAR ?auto_200436 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_200428 ) ( ON ?auto_200429 ?auto_200428 ) ( ON ?auto_200430 ?auto_200429 ) ( ON ?auto_200431 ?auto_200430 ) ( ON ?auto_200432 ?auto_200431 ) ( ON ?auto_200433 ?auto_200432 ) ( ON ?auto_200434 ?auto_200433 ) ( ON ?auto_200435 ?auto_200434 ) ( not ( = ?auto_200428 ?auto_200429 ) ) ( not ( = ?auto_200428 ?auto_200430 ) ) ( not ( = ?auto_200428 ?auto_200431 ) ) ( not ( = ?auto_200428 ?auto_200432 ) ) ( not ( = ?auto_200428 ?auto_200433 ) ) ( not ( = ?auto_200428 ?auto_200434 ) ) ( not ( = ?auto_200428 ?auto_200435 ) ) ( not ( = ?auto_200428 ?auto_200436 ) ) ( not ( = ?auto_200429 ?auto_200430 ) ) ( not ( = ?auto_200429 ?auto_200431 ) ) ( not ( = ?auto_200429 ?auto_200432 ) ) ( not ( = ?auto_200429 ?auto_200433 ) ) ( not ( = ?auto_200429 ?auto_200434 ) ) ( not ( = ?auto_200429 ?auto_200435 ) ) ( not ( = ?auto_200429 ?auto_200436 ) ) ( not ( = ?auto_200430 ?auto_200431 ) ) ( not ( = ?auto_200430 ?auto_200432 ) ) ( not ( = ?auto_200430 ?auto_200433 ) ) ( not ( = ?auto_200430 ?auto_200434 ) ) ( not ( = ?auto_200430 ?auto_200435 ) ) ( not ( = ?auto_200430 ?auto_200436 ) ) ( not ( = ?auto_200431 ?auto_200432 ) ) ( not ( = ?auto_200431 ?auto_200433 ) ) ( not ( = ?auto_200431 ?auto_200434 ) ) ( not ( = ?auto_200431 ?auto_200435 ) ) ( not ( = ?auto_200431 ?auto_200436 ) ) ( not ( = ?auto_200432 ?auto_200433 ) ) ( not ( = ?auto_200432 ?auto_200434 ) ) ( not ( = ?auto_200432 ?auto_200435 ) ) ( not ( = ?auto_200432 ?auto_200436 ) ) ( not ( = ?auto_200433 ?auto_200434 ) ) ( not ( = ?auto_200433 ?auto_200435 ) ) ( not ( = ?auto_200433 ?auto_200436 ) ) ( not ( = ?auto_200434 ?auto_200435 ) ) ( not ( = ?auto_200434 ?auto_200436 ) ) ( not ( = ?auto_200435 ?auto_200436 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_200436 ?auto_200435 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_200438 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_200438 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_200438 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_200439 - BLOCK
    )
    :vars
    (
      ?auto_200440 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_200439 ?auto_200440 ) ( CLEAR ?auto_200439 ) ( HAND-EMPTY ) ( not ( = ?auto_200439 ?auto_200440 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_200439 ?auto_200440 )
      ( MAKE-1PILE ?auto_200439 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_200448 - BLOCK
      ?auto_200449 - BLOCK
      ?auto_200450 - BLOCK
      ?auto_200451 - BLOCK
      ?auto_200452 - BLOCK
      ?auto_200453 - BLOCK
      ?auto_200454 - BLOCK
    )
    :vars
    (
      ?auto_200455 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_200455 ?auto_200454 ) ( CLEAR ?auto_200455 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_200448 ) ( ON ?auto_200449 ?auto_200448 ) ( ON ?auto_200450 ?auto_200449 ) ( ON ?auto_200451 ?auto_200450 ) ( ON ?auto_200452 ?auto_200451 ) ( ON ?auto_200453 ?auto_200452 ) ( ON ?auto_200454 ?auto_200453 ) ( not ( = ?auto_200448 ?auto_200449 ) ) ( not ( = ?auto_200448 ?auto_200450 ) ) ( not ( = ?auto_200448 ?auto_200451 ) ) ( not ( = ?auto_200448 ?auto_200452 ) ) ( not ( = ?auto_200448 ?auto_200453 ) ) ( not ( = ?auto_200448 ?auto_200454 ) ) ( not ( = ?auto_200448 ?auto_200455 ) ) ( not ( = ?auto_200449 ?auto_200450 ) ) ( not ( = ?auto_200449 ?auto_200451 ) ) ( not ( = ?auto_200449 ?auto_200452 ) ) ( not ( = ?auto_200449 ?auto_200453 ) ) ( not ( = ?auto_200449 ?auto_200454 ) ) ( not ( = ?auto_200449 ?auto_200455 ) ) ( not ( = ?auto_200450 ?auto_200451 ) ) ( not ( = ?auto_200450 ?auto_200452 ) ) ( not ( = ?auto_200450 ?auto_200453 ) ) ( not ( = ?auto_200450 ?auto_200454 ) ) ( not ( = ?auto_200450 ?auto_200455 ) ) ( not ( = ?auto_200451 ?auto_200452 ) ) ( not ( = ?auto_200451 ?auto_200453 ) ) ( not ( = ?auto_200451 ?auto_200454 ) ) ( not ( = ?auto_200451 ?auto_200455 ) ) ( not ( = ?auto_200452 ?auto_200453 ) ) ( not ( = ?auto_200452 ?auto_200454 ) ) ( not ( = ?auto_200452 ?auto_200455 ) ) ( not ( = ?auto_200453 ?auto_200454 ) ) ( not ( = ?auto_200453 ?auto_200455 ) ) ( not ( = ?auto_200454 ?auto_200455 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_200455 ?auto_200454 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_200456 - BLOCK
      ?auto_200457 - BLOCK
      ?auto_200458 - BLOCK
      ?auto_200459 - BLOCK
      ?auto_200460 - BLOCK
      ?auto_200461 - BLOCK
      ?auto_200462 - BLOCK
    )
    :vars
    (
      ?auto_200463 - BLOCK
      ?auto_200464 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_200463 ?auto_200462 ) ( CLEAR ?auto_200463 ) ( ON-TABLE ?auto_200456 ) ( ON ?auto_200457 ?auto_200456 ) ( ON ?auto_200458 ?auto_200457 ) ( ON ?auto_200459 ?auto_200458 ) ( ON ?auto_200460 ?auto_200459 ) ( ON ?auto_200461 ?auto_200460 ) ( ON ?auto_200462 ?auto_200461 ) ( not ( = ?auto_200456 ?auto_200457 ) ) ( not ( = ?auto_200456 ?auto_200458 ) ) ( not ( = ?auto_200456 ?auto_200459 ) ) ( not ( = ?auto_200456 ?auto_200460 ) ) ( not ( = ?auto_200456 ?auto_200461 ) ) ( not ( = ?auto_200456 ?auto_200462 ) ) ( not ( = ?auto_200456 ?auto_200463 ) ) ( not ( = ?auto_200457 ?auto_200458 ) ) ( not ( = ?auto_200457 ?auto_200459 ) ) ( not ( = ?auto_200457 ?auto_200460 ) ) ( not ( = ?auto_200457 ?auto_200461 ) ) ( not ( = ?auto_200457 ?auto_200462 ) ) ( not ( = ?auto_200457 ?auto_200463 ) ) ( not ( = ?auto_200458 ?auto_200459 ) ) ( not ( = ?auto_200458 ?auto_200460 ) ) ( not ( = ?auto_200458 ?auto_200461 ) ) ( not ( = ?auto_200458 ?auto_200462 ) ) ( not ( = ?auto_200458 ?auto_200463 ) ) ( not ( = ?auto_200459 ?auto_200460 ) ) ( not ( = ?auto_200459 ?auto_200461 ) ) ( not ( = ?auto_200459 ?auto_200462 ) ) ( not ( = ?auto_200459 ?auto_200463 ) ) ( not ( = ?auto_200460 ?auto_200461 ) ) ( not ( = ?auto_200460 ?auto_200462 ) ) ( not ( = ?auto_200460 ?auto_200463 ) ) ( not ( = ?auto_200461 ?auto_200462 ) ) ( not ( = ?auto_200461 ?auto_200463 ) ) ( not ( = ?auto_200462 ?auto_200463 ) ) ( HOLDING ?auto_200464 ) ( not ( = ?auto_200456 ?auto_200464 ) ) ( not ( = ?auto_200457 ?auto_200464 ) ) ( not ( = ?auto_200458 ?auto_200464 ) ) ( not ( = ?auto_200459 ?auto_200464 ) ) ( not ( = ?auto_200460 ?auto_200464 ) ) ( not ( = ?auto_200461 ?auto_200464 ) ) ( not ( = ?auto_200462 ?auto_200464 ) ) ( not ( = ?auto_200463 ?auto_200464 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_200464 )
      ( MAKE-7PILE ?auto_200456 ?auto_200457 ?auto_200458 ?auto_200459 ?auto_200460 ?auto_200461 ?auto_200462 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_200465 - BLOCK
      ?auto_200466 - BLOCK
      ?auto_200467 - BLOCK
      ?auto_200468 - BLOCK
      ?auto_200469 - BLOCK
      ?auto_200470 - BLOCK
      ?auto_200471 - BLOCK
    )
    :vars
    (
      ?auto_200472 - BLOCK
      ?auto_200473 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_200472 ?auto_200471 ) ( ON-TABLE ?auto_200465 ) ( ON ?auto_200466 ?auto_200465 ) ( ON ?auto_200467 ?auto_200466 ) ( ON ?auto_200468 ?auto_200467 ) ( ON ?auto_200469 ?auto_200468 ) ( ON ?auto_200470 ?auto_200469 ) ( ON ?auto_200471 ?auto_200470 ) ( not ( = ?auto_200465 ?auto_200466 ) ) ( not ( = ?auto_200465 ?auto_200467 ) ) ( not ( = ?auto_200465 ?auto_200468 ) ) ( not ( = ?auto_200465 ?auto_200469 ) ) ( not ( = ?auto_200465 ?auto_200470 ) ) ( not ( = ?auto_200465 ?auto_200471 ) ) ( not ( = ?auto_200465 ?auto_200472 ) ) ( not ( = ?auto_200466 ?auto_200467 ) ) ( not ( = ?auto_200466 ?auto_200468 ) ) ( not ( = ?auto_200466 ?auto_200469 ) ) ( not ( = ?auto_200466 ?auto_200470 ) ) ( not ( = ?auto_200466 ?auto_200471 ) ) ( not ( = ?auto_200466 ?auto_200472 ) ) ( not ( = ?auto_200467 ?auto_200468 ) ) ( not ( = ?auto_200467 ?auto_200469 ) ) ( not ( = ?auto_200467 ?auto_200470 ) ) ( not ( = ?auto_200467 ?auto_200471 ) ) ( not ( = ?auto_200467 ?auto_200472 ) ) ( not ( = ?auto_200468 ?auto_200469 ) ) ( not ( = ?auto_200468 ?auto_200470 ) ) ( not ( = ?auto_200468 ?auto_200471 ) ) ( not ( = ?auto_200468 ?auto_200472 ) ) ( not ( = ?auto_200469 ?auto_200470 ) ) ( not ( = ?auto_200469 ?auto_200471 ) ) ( not ( = ?auto_200469 ?auto_200472 ) ) ( not ( = ?auto_200470 ?auto_200471 ) ) ( not ( = ?auto_200470 ?auto_200472 ) ) ( not ( = ?auto_200471 ?auto_200472 ) ) ( not ( = ?auto_200465 ?auto_200473 ) ) ( not ( = ?auto_200466 ?auto_200473 ) ) ( not ( = ?auto_200467 ?auto_200473 ) ) ( not ( = ?auto_200468 ?auto_200473 ) ) ( not ( = ?auto_200469 ?auto_200473 ) ) ( not ( = ?auto_200470 ?auto_200473 ) ) ( not ( = ?auto_200471 ?auto_200473 ) ) ( not ( = ?auto_200472 ?auto_200473 ) ) ( ON ?auto_200473 ?auto_200472 ) ( CLEAR ?auto_200473 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_200465 ?auto_200466 ?auto_200467 ?auto_200468 ?auto_200469 ?auto_200470 ?auto_200471 ?auto_200472 )
      ( MAKE-7PILE ?auto_200465 ?auto_200466 ?auto_200467 ?auto_200468 ?auto_200469 ?auto_200470 ?auto_200471 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_200476 - BLOCK
      ?auto_200477 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_200477 ) ( CLEAR ?auto_200476 ) ( ON-TABLE ?auto_200476 ) ( not ( = ?auto_200476 ?auto_200477 ) ) )
    :subtasks
    ( ( !STACK ?auto_200477 ?auto_200476 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_200478 - BLOCK
      ?auto_200479 - BLOCK
    )
    :vars
    (
      ?auto_200480 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_200478 ) ( ON-TABLE ?auto_200478 ) ( not ( = ?auto_200478 ?auto_200479 ) ) ( ON ?auto_200479 ?auto_200480 ) ( CLEAR ?auto_200479 ) ( HAND-EMPTY ) ( not ( = ?auto_200478 ?auto_200480 ) ) ( not ( = ?auto_200479 ?auto_200480 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_200479 ?auto_200480 )
      ( MAKE-2PILE ?auto_200478 ?auto_200479 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_200481 - BLOCK
      ?auto_200482 - BLOCK
    )
    :vars
    (
      ?auto_200483 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_200481 ?auto_200482 ) ) ( ON ?auto_200482 ?auto_200483 ) ( CLEAR ?auto_200482 ) ( not ( = ?auto_200481 ?auto_200483 ) ) ( not ( = ?auto_200482 ?auto_200483 ) ) ( HOLDING ?auto_200481 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_200481 )
      ( MAKE-2PILE ?auto_200481 ?auto_200482 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_200484 - BLOCK
      ?auto_200485 - BLOCK
    )
    :vars
    (
      ?auto_200486 - BLOCK
      ?auto_200491 - BLOCK
      ?auto_200487 - BLOCK
      ?auto_200492 - BLOCK
      ?auto_200490 - BLOCK
      ?auto_200489 - BLOCK
      ?auto_200488 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_200484 ?auto_200485 ) ) ( ON ?auto_200485 ?auto_200486 ) ( not ( = ?auto_200484 ?auto_200486 ) ) ( not ( = ?auto_200485 ?auto_200486 ) ) ( ON ?auto_200484 ?auto_200485 ) ( CLEAR ?auto_200484 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_200491 ) ( ON ?auto_200487 ?auto_200491 ) ( ON ?auto_200492 ?auto_200487 ) ( ON ?auto_200490 ?auto_200492 ) ( ON ?auto_200489 ?auto_200490 ) ( ON ?auto_200488 ?auto_200489 ) ( ON ?auto_200486 ?auto_200488 ) ( not ( = ?auto_200491 ?auto_200487 ) ) ( not ( = ?auto_200491 ?auto_200492 ) ) ( not ( = ?auto_200491 ?auto_200490 ) ) ( not ( = ?auto_200491 ?auto_200489 ) ) ( not ( = ?auto_200491 ?auto_200488 ) ) ( not ( = ?auto_200491 ?auto_200486 ) ) ( not ( = ?auto_200491 ?auto_200485 ) ) ( not ( = ?auto_200491 ?auto_200484 ) ) ( not ( = ?auto_200487 ?auto_200492 ) ) ( not ( = ?auto_200487 ?auto_200490 ) ) ( not ( = ?auto_200487 ?auto_200489 ) ) ( not ( = ?auto_200487 ?auto_200488 ) ) ( not ( = ?auto_200487 ?auto_200486 ) ) ( not ( = ?auto_200487 ?auto_200485 ) ) ( not ( = ?auto_200487 ?auto_200484 ) ) ( not ( = ?auto_200492 ?auto_200490 ) ) ( not ( = ?auto_200492 ?auto_200489 ) ) ( not ( = ?auto_200492 ?auto_200488 ) ) ( not ( = ?auto_200492 ?auto_200486 ) ) ( not ( = ?auto_200492 ?auto_200485 ) ) ( not ( = ?auto_200492 ?auto_200484 ) ) ( not ( = ?auto_200490 ?auto_200489 ) ) ( not ( = ?auto_200490 ?auto_200488 ) ) ( not ( = ?auto_200490 ?auto_200486 ) ) ( not ( = ?auto_200490 ?auto_200485 ) ) ( not ( = ?auto_200490 ?auto_200484 ) ) ( not ( = ?auto_200489 ?auto_200488 ) ) ( not ( = ?auto_200489 ?auto_200486 ) ) ( not ( = ?auto_200489 ?auto_200485 ) ) ( not ( = ?auto_200489 ?auto_200484 ) ) ( not ( = ?auto_200488 ?auto_200486 ) ) ( not ( = ?auto_200488 ?auto_200485 ) ) ( not ( = ?auto_200488 ?auto_200484 ) ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_200491 ?auto_200487 ?auto_200492 ?auto_200490 ?auto_200489 ?auto_200488 ?auto_200486 ?auto_200485 )
      ( MAKE-2PILE ?auto_200484 ?auto_200485 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_200499 - BLOCK
      ?auto_200500 - BLOCK
      ?auto_200501 - BLOCK
      ?auto_200502 - BLOCK
      ?auto_200503 - BLOCK
      ?auto_200504 - BLOCK
    )
    :vars
    (
      ?auto_200505 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_200505 ?auto_200504 ) ( CLEAR ?auto_200505 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_200499 ) ( ON ?auto_200500 ?auto_200499 ) ( ON ?auto_200501 ?auto_200500 ) ( ON ?auto_200502 ?auto_200501 ) ( ON ?auto_200503 ?auto_200502 ) ( ON ?auto_200504 ?auto_200503 ) ( not ( = ?auto_200499 ?auto_200500 ) ) ( not ( = ?auto_200499 ?auto_200501 ) ) ( not ( = ?auto_200499 ?auto_200502 ) ) ( not ( = ?auto_200499 ?auto_200503 ) ) ( not ( = ?auto_200499 ?auto_200504 ) ) ( not ( = ?auto_200499 ?auto_200505 ) ) ( not ( = ?auto_200500 ?auto_200501 ) ) ( not ( = ?auto_200500 ?auto_200502 ) ) ( not ( = ?auto_200500 ?auto_200503 ) ) ( not ( = ?auto_200500 ?auto_200504 ) ) ( not ( = ?auto_200500 ?auto_200505 ) ) ( not ( = ?auto_200501 ?auto_200502 ) ) ( not ( = ?auto_200501 ?auto_200503 ) ) ( not ( = ?auto_200501 ?auto_200504 ) ) ( not ( = ?auto_200501 ?auto_200505 ) ) ( not ( = ?auto_200502 ?auto_200503 ) ) ( not ( = ?auto_200502 ?auto_200504 ) ) ( not ( = ?auto_200502 ?auto_200505 ) ) ( not ( = ?auto_200503 ?auto_200504 ) ) ( not ( = ?auto_200503 ?auto_200505 ) ) ( not ( = ?auto_200504 ?auto_200505 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_200505 ?auto_200504 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_200506 - BLOCK
      ?auto_200507 - BLOCK
      ?auto_200508 - BLOCK
      ?auto_200509 - BLOCK
      ?auto_200510 - BLOCK
      ?auto_200511 - BLOCK
    )
    :vars
    (
      ?auto_200512 - BLOCK
      ?auto_200513 - BLOCK
      ?auto_200514 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_200512 ?auto_200511 ) ( CLEAR ?auto_200512 ) ( ON-TABLE ?auto_200506 ) ( ON ?auto_200507 ?auto_200506 ) ( ON ?auto_200508 ?auto_200507 ) ( ON ?auto_200509 ?auto_200508 ) ( ON ?auto_200510 ?auto_200509 ) ( ON ?auto_200511 ?auto_200510 ) ( not ( = ?auto_200506 ?auto_200507 ) ) ( not ( = ?auto_200506 ?auto_200508 ) ) ( not ( = ?auto_200506 ?auto_200509 ) ) ( not ( = ?auto_200506 ?auto_200510 ) ) ( not ( = ?auto_200506 ?auto_200511 ) ) ( not ( = ?auto_200506 ?auto_200512 ) ) ( not ( = ?auto_200507 ?auto_200508 ) ) ( not ( = ?auto_200507 ?auto_200509 ) ) ( not ( = ?auto_200507 ?auto_200510 ) ) ( not ( = ?auto_200507 ?auto_200511 ) ) ( not ( = ?auto_200507 ?auto_200512 ) ) ( not ( = ?auto_200508 ?auto_200509 ) ) ( not ( = ?auto_200508 ?auto_200510 ) ) ( not ( = ?auto_200508 ?auto_200511 ) ) ( not ( = ?auto_200508 ?auto_200512 ) ) ( not ( = ?auto_200509 ?auto_200510 ) ) ( not ( = ?auto_200509 ?auto_200511 ) ) ( not ( = ?auto_200509 ?auto_200512 ) ) ( not ( = ?auto_200510 ?auto_200511 ) ) ( not ( = ?auto_200510 ?auto_200512 ) ) ( not ( = ?auto_200511 ?auto_200512 ) ) ( HOLDING ?auto_200513 ) ( CLEAR ?auto_200514 ) ( not ( = ?auto_200506 ?auto_200513 ) ) ( not ( = ?auto_200506 ?auto_200514 ) ) ( not ( = ?auto_200507 ?auto_200513 ) ) ( not ( = ?auto_200507 ?auto_200514 ) ) ( not ( = ?auto_200508 ?auto_200513 ) ) ( not ( = ?auto_200508 ?auto_200514 ) ) ( not ( = ?auto_200509 ?auto_200513 ) ) ( not ( = ?auto_200509 ?auto_200514 ) ) ( not ( = ?auto_200510 ?auto_200513 ) ) ( not ( = ?auto_200510 ?auto_200514 ) ) ( not ( = ?auto_200511 ?auto_200513 ) ) ( not ( = ?auto_200511 ?auto_200514 ) ) ( not ( = ?auto_200512 ?auto_200513 ) ) ( not ( = ?auto_200512 ?auto_200514 ) ) ( not ( = ?auto_200513 ?auto_200514 ) ) )
    :subtasks
    ( ( !STACK ?auto_200513 ?auto_200514 )
      ( MAKE-6PILE ?auto_200506 ?auto_200507 ?auto_200508 ?auto_200509 ?auto_200510 ?auto_200511 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_200515 - BLOCK
      ?auto_200516 - BLOCK
      ?auto_200517 - BLOCK
      ?auto_200518 - BLOCK
      ?auto_200519 - BLOCK
      ?auto_200520 - BLOCK
    )
    :vars
    (
      ?auto_200523 - BLOCK
      ?auto_200522 - BLOCK
      ?auto_200521 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_200523 ?auto_200520 ) ( ON-TABLE ?auto_200515 ) ( ON ?auto_200516 ?auto_200515 ) ( ON ?auto_200517 ?auto_200516 ) ( ON ?auto_200518 ?auto_200517 ) ( ON ?auto_200519 ?auto_200518 ) ( ON ?auto_200520 ?auto_200519 ) ( not ( = ?auto_200515 ?auto_200516 ) ) ( not ( = ?auto_200515 ?auto_200517 ) ) ( not ( = ?auto_200515 ?auto_200518 ) ) ( not ( = ?auto_200515 ?auto_200519 ) ) ( not ( = ?auto_200515 ?auto_200520 ) ) ( not ( = ?auto_200515 ?auto_200523 ) ) ( not ( = ?auto_200516 ?auto_200517 ) ) ( not ( = ?auto_200516 ?auto_200518 ) ) ( not ( = ?auto_200516 ?auto_200519 ) ) ( not ( = ?auto_200516 ?auto_200520 ) ) ( not ( = ?auto_200516 ?auto_200523 ) ) ( not ( = ?auto_200517 ?auto_200518 ) ) ( not ( = ?auto_200517 ?auto_200519 ) ) ( not ( = ?auto_200517 ?auto_200520 ) ) ( not ( = ?auto_200517 ?auto_200523 ) ) ( not ( = ?auto_200518 ?auto_200519 ) ) ( not ( = ?auto_200518 ?auto_200520 ) ) ( not ( = ?auto_200518 ?auto_200523 ) ) ( not ( = ?auto_200519 ?auto_200520 ) ) ( not ( = ?auto_200519 ?auto_200523 ) ) ( not ( = ?auto_200520 ?auto_200523 ) ) ( CLEAR ?auto_200522 ) ( not ( = ?auto_200515 ?auto_200521 ) ) ( not ( = ?auto_200515 ?auto_200522 ) ) ( not ( = ?auto_200516 ?auto_200521 ) ) ( not ( = ?auto_200516 ?auto_200522 ) ) ( not ( = ?auto_200517 ?auto_200521 ) ) ( not ( = ?auto_200517 ?auto_200522 ) ) ( not ( = ?auto_200518 ?auto_200521 ) ) ( not ( = ?auto_200518 ?auto_200522 ) ) ( not ( = ?auto_200519 ?auto_200521 ) ) ( not ( = ?auto_200519 ?auto_200522 ) ) ( not ( = ?auto_200520 ?auto_200521 ) ) ( not ( = ?auto_200520 ?auto_200522 ) ) ( not ( = ?auto_200523 ?auto_200521 ) ) ( not ( = ?auto_200523 ?auto_200522 ) ) ( not ( = ?auto_200521 ?auto_200522 ) ) ( ON ?auto_200521 ?auto_200523 ) ( CLEAR ?auto_200521 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_200515 ?auto_200516 ?auto_200517 ?auto_200518 ?auto_200519 ?auto_200520 ?auto_200523 )
      ( MAKE-6PILE ?auto_200515 ?auto_200516 ?auto_200517 ?auto_200518 ?auto_200519 ?auto_200520 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_200524 - BLOCK
      ?auto_200525 - BLOCK
      ?auto_200526 - BLOCK
      ?auto_200527 - BLOCK
      ?auto_200528 - BLOCK
      ?auto_200529 - BLOCK
    )
    :vars
    (
      ?auto_200531 - BLOCK
      ?auto_200530 - BLOCK
      ?auto_200532 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_200531 ?auto_200529 ) ( ON-TABLE ?auto_200524 ) ( ON ?auto_200525 ?auto_200524 ) ( ON ?auto_200526 ?auto_200525 ) ( ON ?auto_200527 ?auto_200526 ) ( ON ?auto_200528 ?auto_200527 ) ( ON ?auto_200529 ?auto_200528 ) ( not ( = ?auto_200524 ?auto_200525 ) ) ( not ( = ?auto_200524 ?auto_200526 ) ) ( not ( = ?auto_200524 ?auto_200527 ) ) ( not ( = ?auto_200524 ?auto_200528 ) ) ( not ( = ?auto_200524 ?auto_200529 ) ) ( not ( = ?auto_200524 ?auto_200531 ) ) ( not ( = ?auto_200525 ?auto_200526 ) ) ( not ( = ?auto_200525 ?auto_200527 ) ) ( not ( = ?auto_200525 ?auto_200528 ) ) ( not ( = ?auto_200525 ?auto_200529 ) ) ( not ( = ?auto_200525 ?auto_200531 ) ) ( not ( = ?auto_200526 ?auto_200527 ) ) ( not ( = ?auto_200526 ?auto_200528 ) ) ( not ( = ?auto_200526 ?auto_200529 ) ) ( not ( = ?auto_200526 ?auto_200531 ) ) ( not ( = ?auto_200527 ?auto_200528 ) ) ( not ( = ?auto_200527 ?auto_200529 ) ) ( not ( = ?auto_200527 ?auto_200531 ) ) ( not ( = ?auto_200528 ?auto_200529 ) ) ( not ( = ?auto_200528 ?auto_200531 ) ) ( not ( = ?auto_200529 ?auto_200531 ) ) ( not ( = ?auto_200524 ?auto_200530 ) ) ( not ( = ?auto_200524 ?auto_200532 ) ) ( not ( = ?auto_200525 ?auto_200530 ) ) ( not ( = ?auto_200525 ?auto_200532 ) ) ( not ( = ?auto_200526 ?auto_200530 ) ) ( not ( = ?auto_200526 ?auto_200532 ) ) ( not ( = ?auto_200527 ?auto_200530 ) ) ( not ( = ?auto_200527 ?auto_200532 ) ) ( not ( = ?auto_200528 ?auto_200530 ) ) ( not ( = ?auto_200528 ?auto_200532 ) ) ( not ( = ?auto_200529 ?auto_200530 ) ) ( not ( = ?auto_200529 ?auto_200532 ) ) ( not ( = ?auto_200531 ?auto_200530 ) ) ( not ( = ?auto_200531 ?auto_200532 ) ) ( not ( = ?auto_200530 ?auto_200532 ) ) ( ON ?auto_200530 ?auto_200531 ) ( CLEAR ?auto_200530 ) ( HOLDING ?auto_200532 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_200532 )
      ( MAKE-6PILE ?auto_200524 ?auto_200525 ?auto_200526 ?auto_200527 ?auto_200528 ?auto_200529 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_200533 - BLOCK
      ?auto_200534 - BLOCK
      ?auto_200535 - BLOCK
      ?auto_200536 - BLOCK
      ?auto_200537 - BLOCK
      ?auto_200538 - BLOCK
    )
    :vars
    (
      ?auto_200540 - BLOCK
      ?auto_200541 - BLOCK
      ?auto_200539 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_200540 ?auto_200538 ) ( ON-TABLE ?auto_200533 ) ( ON ?auto_200534 ?auto_200533 ) ( ON ?auto_200535 ?auto_200534 ) ( ON ?auto_200536 ?auto_200535 ) ( ON ?auto_200537 ?auto_200536 ) ( ON ?auto_200538 ?auto_200537 ) ( not ( = ?auto_200533 ?auto_200534 ) ) ( not ( = ?auto_200533 ?auto_200535 ) ) ( not ( = ?auto_200533 ?auto_200536 ) ) ( not ( = ?auto_200533 ?auto_200537 ) ) ( not ( = ?auto_200533 ?auto_200538 ) ) ( not ( = ?auto_200533 ?auto_200540 ) ) ( not ( = ?auto_200534 ?auto_200535 ) ) ( not ( = ?auto_200534 ?auto_200536 ) ) ( not ( = ?auto_200534 ?auto_200537 ) ) ( not ( = ?auto_200534 ?auto_200538 ) ) ( not ( = ?auto_200534 ?auto_200540 ) ) ( not ( = ?auto_200535 ?auto_200536 ) ) ( not ( = ?auto_200535 ?auto_200537 ) ) ( not ( = ?auto_200535 ?auto_200538 ) ) ( not ( = ?auto_200535 ?auto_200540 ) ) ( not ( = ?auto_200536 ?auto_200537 ) ) ( not ( = ?auto_200536 ?auto_200538 ) ) ( not ( = ?auto_200536 ?auto_200540 ) ) ( not ( = ?auto_200537 ?auto_200538 ) ) ( not ( = ?auto_200537 ?auto_200540 ) ) ( not ( = ?auto_200538 ?auto_200540 ) ) ( not ( = ?auto_200533 ?auto_200541 ) ) ( not ( = ?auto_200533 ?auto_200539 ) ) ( not ( = ?auto_200534 ?auto_200541 ) ) ( not ( = ?auto_200534 ?auto_200539 ) ) ( not ( = ?auto_200535 ?auto_200541 ) ) ( not ( = ?auto_200535 ?auto_200539 ) ) ( not ( = ?auto_200536 ?auto_200541 ) ) ( not ( = ?auto_200536 ?auto_200539 ) ) ( not ( = ?auto_200537 ?auto_200541 ) ) ( not ( = ?auto_200537 ?auto_200539 ) ) ( not ( = ?auto_200538 ?auto_200541 ) ) ( not ( = ?auto_200538 ?auto_200539 ) ) ( not ( = ?auto_200540 ?auto_200541 ) ) ( not ( = ?auto_200540 ?auto_200539 ) ) ( not ( = ?auto_200541 ?auto_200539 ) ) ( ON ?auto_200541 ?auto_200540 ) ( ON ?auto_200539 ?auto_200541 ) ( CLEAR ?auto_200539 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_200533 ?auto_200534 ?auto_200535 ?auto_200536 ?auto_200537 ?auto_200538 ?auto_200540 ?auto_200541 )
      ( MAKE-6PILE ?auto_200533 ?auto_200534 ?auto_200535 ?auto_200536 ?auto_200537 ?auto_200538 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_200545 - BLOCK
      ?auto_200546 - BLOCK
      ?auto_200547 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_200547 ) ( CLEAR ?auto_200546 ) ( ON-TABLE ?auto_200545 ) ( ON ?auto_200546 ?auto_200545 ) ( not ( = ?auto_200545 ?auto_200546 ) ) ( not ( = ?auto_200545 ?auto_200547 ) ) ( not ( = ?auto_200546 ?auto_200547 ) ) )
    :subtasks
    ( ( !STACK ?auto_200547 ?auto_200546 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_200548 - BLOCK
      ?auto_200549 - BLOCK
      ?auto_200550 - BLOCK
    )
    :vars
    (
      ?auto_200551 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_200549 ) ( ON-TABLE ?auto_200548 ) ( ON ?auto_200549 ?auto_200548 ) ( not ( = ?auto_200548 ?auto_200549 ) ) ( not ( = ?auto_200548 ?auto_200550 ) ) ( not ( = ?auto_200549 ?auto_200550 ) ) ( ON ?auto_200550 ?auto_200551 ) ( CLEAR ?auto_200550 ) ( HAND-EMPTY ) ( not ( = ?auto_200548 ?auto_200551 ) ) ( not ( = ?auto_200549 ?auto_200551 ) ) ( not ( = ?auto_200550 ?auto_200551 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_200550 ?auto_200551 )
      ( MAKE-3PILE ?auto_200548 ?auto_200549 ?auto_200550 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_200552 - BLOCK
      ?auto_200553 - BLOCK
      ?auto_200554 - BLOCK
    )
    :vars
    (
      ?auto_200555 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_200552 ) ( not ( = ?auto_200552 ?auto_200553 ) ) ( not ( = ?auto_200552 ?auto_200554 ) ) ( not ( = ?auto_200553 ?auto_200554 ) ) ( ON ?auto_200554 ?auto_200555 ) ( CLEAR ?auto_200554 ) ( not ( = ?auto_200552 ?auto_200555 ) ) ( not ( = ?auto_200553 ?auto_200555 ) ) ( not ( = ?auto_200554 ?auto_200555 ) ) ( HOLDING ?auto_200553 ) ( CLEAR ?auto_200552 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_200552 ?auto_200553 )
      ( MAKE-3PILE ?auto_200552 ?auto_200553 ?auto_200554 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_200556 - BLOCK
      ?auto_200557 - BLOCK
      ?auto_200558 - BLOCK
    )
    :vars
    (
      ?auto_200559 - BLOCK
      ?auto_200562 - BLOCK
      ?auto_200560 - BLOCK
      ?auto_200561 - BLOCK
      ?auto_200564 - BLOCK
      ?auto_200563 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_200556 ) ( not ( = ?auto_200556 ?auto_200557 ) ) ( not ( = ?auto_200556 ?auto_200558 ) ) ( not ( = ?auto_200557 ?auto_200558 ) ) ( ON ?auto_200558 ?auto_200559 ) ( not ( = ?auto_200556 ?auto_200559 ) ) ( not ( = ?auto_200557 ?auto_200559 ) ) ( not ( = ?auto_200558 ?auto_200559 ) ) ( CLEAR ?auto_200556 ) ( ON ?auto_200557 ?auto_200558 ) ( CLEAR ?auto_200557 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_200562 ) ( ON ?auto_200560 ?auto_200562 ) ( ON ?auto_200561 ?auto_200560 ) ( ON ?auto_200564 ?auto_200561 ) ( ON ?auto_200563 ?auto_200564 ) ( ON ?auto_200559 ?auto_200563 ) ( not ( = ?auto_200562 ?auto_200560 ) ) ( not ( = ?auto_200562 ?auto_200561 ) ) ( not ( = ?auto_200562 ?auto_200564 ) ) ( not ( = ?auto_200562 ?auto_200563 ) ) ( not ( = ?auto_200562 ?auto_200559 ) ) ( not ( = ?auto_200562 ?auto_200558 ) ) ( not ( = ?auto_200562 ?auto_200557 ) ) ( not ( = ?auto_200560 ?auto_200561 ) ) ( not ( = ?auto_200560 ?auto_200564 ) ) ( not ( = ?auto_200560 ?auto_200563 ) ) ( not ( = ?auto_200560 ?auto_200559 ) ) ( not ( = ?auto_200560 ?auto_200558 ) ) ( not ( = ?auto_200560 ?auto_200557 ) ) ( not ( = ?auto_200561 ?auto_200564 ) ) ( not ( = ?auto_200561 ?auto_200563 ) ) ( not ( = ?auto_200561 ?auto_200559 ) ) ( not ( = ?auto_200561 ?auto_200558 ) ) ( not ( = ?auto_200561 ?auto_200557 ) ) ( not ( = ?auto_200564 ?auto_200563 ) ) ( not ( = ?auto_200564 ?auto_200559 ) ) ( not ( = ?auto_200564 ?auto_200558 ) ) ( not ( = ?auto_200564 ?auto_200557 ) ) ( not ( = ?auto_200563 ?auto_200559 ) ) ( not ( = ?auto_200563 ?auto_200558 ) ) ( not ( = ?auto_200563 ?auto_200557 ) ) ( not ( = ?auto_200556 ?auto_200562 ) ) ( not ( = ?auto_200556 ?auto_200560 ) ) ( not ( = ?auto_200556 ?auto_200561 ) ) ( not ( = ?auto_200556 ?auto_200564 ) ) ( not ( = ?auto_200556 ?auto_200563 ) ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_200562 ?auto_200560 ?auto_200561 ?auto_200564 ?auto_200563 ?auto_200559 ?auto_200558 )
      ( MAKE-3PILE ?auto_200556 ?auto_200557 ?auto_200558 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_200565 - BLOCK
      ?auto_200566 - BLOCK
      ?auto_200567 - BLOCK
    )
    :vars
    (
      ?auto_200569 - BLOCK
      ?auto_200570 - BLOCK
      ?auto_200571 - BLOCK
      ?auto_200572 - BLOCK
      ?auto_200573 - BLOCK
      ?auto_200568 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_200565 ?auto_200566 ) ) ( not ( = ?auto_200565 ?auto_200567 ) ) ( not ( = ?auto_200566 ?auto_200567 ) ) ( ON ?auto_200567 ?auto_200569 ) ( not ( = ?auto_200565 ?auto_200569 ) ) ( not ( = ?auto_200566 ?auto_200569 ) ) ( not ( = ?auto_200567 ?auto_200569 ) ) ( ON ?auto_200566 ?auto_200567 ) ( CLEAR ?auto_200566 ) ( ON-TABLE ?auto_200570 ) ( ON ?auto_200571 ?auto_200570 ) ( ON ?auto_200572 ?auto_200571 ) ( ON ?auto_200573 ?auto_200572 ) ( ON ?auto_200568 ?auto_200573 ) ( ON ?auto_200569 ?auto_200568 ) ( not ( = ?auto_200570 ?auto_200571 ) ) ( not ( = ?auto_200570 ?auto_200572 ) ) ( not ( = ?auto_200570 ?auto_200573 ) ) ( not ( = ?auto_200570 ?auto_200568 ) ) ( not ( = ?auto_200570 ?auto_200569 ) ) ( not ( = ?auto_200570 ?auto_200567 ) ) ( not ( = ?auto_200570 ?auto_200566 ) ) ( not ( = ?auto_200571 ?auto_200572 ) ) ( not ( = ?auto_200571 ?auto_200573 ) ) ( not ( = ?auto_200571 ?auto_200568 ) ) ( not ( = ?auto_200571 ?auto_200569 ) ) ( not ( = ?auto_200571 ?auto_200567 ) ) ( not ( = ?auto_200571 ?auto_200566 ) ) ( not ( = ?auto_200572 ?auto_200573 ) ) ( not ( = ?auto_200572 ?auto_200568 ) ) ( not ( = ?auto_200572 ?auto_200569 ) ) ( not ( = ?auto_200572 ?auto_200567 ) ) ( not ( = ?auto_200572 ?auto_200566 ) ) ( not ( = ?auto_200573 ?auto_200568 ) ) ( not ( = ?auto_200573 ?auto_200569 ) ) ( not ( = ?auto_200573 ?auto_200567 ) ) ( not ( = ?auto_200573 ?auto_200566 ) ) ( not ( = ?auto_200568 ?auto_200569 ) ) ( not ( = ?auto_200568 ?auto_200567 ) ) ( not ( = ?auto_200568 ?auto_200566 ) ) ( not ( = ?auto_200565 ?auto_200570 ) ) ( not ( = ?auto_200565 ?auto_200571 ) ) ( not ( = ?auto_200565 ?auto_200572 ) ) ( not ( = ?auto_200565 ?auto_200573 ) ) ( not ( = ?auto_200565 ?auto_200568 ) ) ( HOLDING ?auto_200565 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_200565 )
      ( MAKE-3PILE ?auto_200565 ?auto_200566 ?auto_200567 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_200574 - BLOCK
      ?auto_200575 - BLOCK
      ?auto_200576 - BLOCK
    )
    :vars
    (
      ?auto_200578 - BLOCK
      ?auto_200579 - BLOCK
      ?auto_200582 - BLOCK
      ?auto_200577 - BLOCK
      ?auto_200581 - BLOCK
      ?auto_200580 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_200574 ?auto_200575 ) ) ( not ( = ?auto_200574 ?auto_200576 ) ) ( not ( = ?auto_200575 ?auto_200576 ) ) ( ON ?auto_200576 ?auto_200578 ) ( not ( = ?auto_200574 ?auto_200578 ) ) ( not ( = ?auto_200575 ?auto_200578 ) ) ( not ( = ?auto_200576 ?auto_200578 ) ) ( ON ?auto_200575 ?auto_200576 ) ( ON-TABLE ?auto_200579 ) ( ON ?auto_200582 ?auto_200579 ) ( ON ?auto_200577 ?auto_200582 ) ( ON ?auto_200581 ?auto_200577 ) ( ON ?auto_200580 ?auto_200581 ) ( ON ?auto_200578 ?auto_200580 ) ( not ( = ?auto_200579 ?auto_200582 ) ) ( not ( = ?auto_200579 ?auto_200577 ) ) ( not ( = ?auto_200579 ?auto_200581 ) ) ( not ( = ?auto_200579 ?auto_200580 ) ) ( not ( = ?auto_200579 ?auto_200578 ) ) ( not ( = ?auto_200579 ?auto_200576 ) ) ( not ( = ?auto_200579 ?auto_200575 ) ) ( not ( = ?auto_200582 ?auto_200577 ) ) ( not ( = ?auto_200582 ?auto_200581 ) ) ( not ( = ?auto_200582 ?auto_200580 ) ) ( not ( = ?auto_200582 ?auto_200578 ) ) ( not ( = ?auto_200582 ?auto_200576 ) ) ( not ( = ?auto_200582 ?auto_200575 ) ) ( not ( = ?auto_200577 ?auto_200581 ) ) ( not ( = ?auto_200577 ?auto_200580 ) ) ( not ( = ?auto_200577 ?auto_200578 ) ) ( not ( = ?auto_200577 ?auto_200576 ) ) ( not ( = ?auto_200577 ?auto_200575 ) ) ( not ( = ?auto_200581 ?auto_200580 ) ) ( not ( = ?auto_200581 ?auto_200578 ) ) ( not ( = ?auto_200581 ?auto_200576 ) ) ( not ( = ?auto_200581 ?auto_200575 ) ) ( not ( = ?auto_200580 ?auto_200578 ) ) ( not ( = ?auto_200580 ?auto_200576 ) ) ( not ( = ?auto_200580 ?auto_200575 ) ) ( not ( = ?auto_200574 ?auto_200579 ) ) ( not ( = ?auto_200574 ?auto_200582 ) ) ( not ( = ?auto_200574 ?auto_200577 ) ) ( not ( = ?auto_200574 ?auto_200581 ) ) ( not ( = ?auto_200574 ?auto_200580 ) ) ( ON ?auto_200574 ?auto_200575 ) ( CLEAR ?auto_200574 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_200579 ?auto_200582 ?auto_200577 ?auto_200581 ?auto_200580 ?auto_200578 ?auto_200576 ?auto_200575 )
      ( MAKE-3PILE ?auto_200574 ?auto_200575 ?auto_200576 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_200588 - BLOCK
      ?auto_200589 - BLOCK
      ?auto_200590 - BLOCK
      ?auto_200591 - BLOCK
      ?auto_200592 - BLOCK
    )
    :vars
    (
      ?auto_200593 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_200593 ?auto_200592 ) ( CLEAR ?auto_200593 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_200588 ) ( ON ?auto_200589 ?auto_200588 ) ( ON ?auto_200590 ?auto_200589 ) ( ON ?auto_200591 ?auto_200590 ) ( ON ?auto_200592 ?auto_200591 ) ( not ( = ?auto_200588 ?auto_200589 ) ) ( not ( = ?auto_200588 ?auto_200590 ) ) ( not ( = ?auto_200588 ?auto_200591 ) ) ( not ( = ?auto_200588 ?auto_200592 ) ) ( not ( = ?auto_200588 ?auto_200593 ) ) ( not ( = ?auto_200589 ?auto_200590 ) ) ( not ( = ?auto_200589 ?auto_200591 ) ) ( not ( = ?auto_200589 ?auto_200592 ) ) ( not ( = ?auto_200589 ?auto_200593 ) ) ( not ( = ?auto_200590 ?auto_200591 ) ) ( not ( = ?auto_200590 ?auto_200592 ) ) ( not ( = ?auto_200590 ?auto_200593 ) ) ( not ( = ?auto_200591 ?auto_200592 ) ) ( not ( = ?auto_200591 ?auto_200593 ) ) ( not ( = ?auto_200592 ?auto_200593 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_200593 ?auto_200592 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_200594 - BLOCK
      ?auto_200595 - BLOCK
      ?auto_200596 - BLOCK
      ?auto_200597 - BLOCK
      ?auto_200598 - BLOCK
    )
    :vars
    (
      ?auto_200599 - BLOCK
      ?auto_200600 - BLOCK
      ?auto_200601 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_200599 ?auto_200598 ) ( CLEAR ?auto_200599 ) ( ON-TABLE ?auto_200594 ) ( ON ?auto_200595 ?auto_200594 ) ( ON ?auto_200596 ?auto_200595 ) ( ON ?auto_200597 ?auto_200596 ) ( ON ?auto_200598 ?auto_200597 ) ( not ( = ?auto_200594 ?auto_200595 ) ) ( not ( = ?auto_200594 ?auto_200596 ) ) ( not ( = ?auto_200594 ?auto_200597 ) ) ( not ( = ?auto_200594 ?auto_200598 ) ) ( not ( = ?auto_200594 ?auto_200599 ) ) ( not ( = ?auto_200595 ?auto_200596 ) ) ( not ( = ?auto_200595 ?auto_200597 ) ) ( not ( = ?auto_200595 ?auto_200598 ) ) ( not ( = ?auto_200595 ?auto_200599 ) ) ( not ( = ?auto_200596 ?auto_200597 ) ) ( not ( = ?auto_200596 ?auto_200598 ) ) ( not ( = ?auto_200596 ?auto_200599 ) ) ( not ( = ?auto_200597 ?auto_200598 ) ) ( not ( = ?auto_200597 ?auto_200599 ) ) ( not ( = ?auto_200598 ?auto_200599 ) ) ( HOLDING ?auto_200600 ) ( CLEAR ?auto_200601 ) ( not ( = ?auto_200594 ?auto_200600 ) ) ( not ( = ?auto_200594 ?auto_200601 ) ) ( not ( = ?auto_200595 ?auto_200600 ) ) ( not ( = ?auto_200595 ?auto_200601 ) ) ( not ( = ?auto_200596 ?auto_200600 ) ) ( not ( = ?auto_200596 ?auto_200601 ) ) ( not ( = ?auto_200597 ?auto_200600 ) ) ( not ( = ?auto_200597 ?auto_200601 ) ) ( not ( = ?auto_200598 ?auto_200600 ) ) ( not ( = ?auto_200598 ?auto_200601 ) ) ( not ( = ?auto_200599 ?auto_200600 ) ) ( not ( = ?auto_200599 ?auto_200601 ) ) ( not ( = ?auto_200600 ?auto_200601 ) ) )
    :subtasks
    ( ( !STACK ?auto_200600 ?auto_200601 )
      ( MAKE-5PILE ?auto_200594 ?auto_200595 ?auto_200596 ?auto_200597 ?auto_200598 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_200602 - BLOCK
      ?auto_200603 - BLOCK
      ?auto_200604 - BLOCK
      ?auto_200605 - BLOCK
      ?auto_200606 - BLOCK
    )
    :vars
    (
      ?auto_200609 - BLOCK
      ?auto_200608 - BLOCK
      ?auto_200607 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_200609 ?auto_200606 ) ( ON-TABLE ?auto_200602 ) ( ON ?auto_200603 ?auto_200602 ) ( ON ?auto_200604 ?auto_200603 ) ( ON ?auto_200605 ?auto_200604 ) ( ON ?auto_200606 ?auto_200605 ) ( not ( = ?auto_200602 ?auto_200603 ) ) ( not ( = ?auto_200602 ?auto_200604 ) ) ( not ( = ?auto_200602 ?auto_200605 ) ) ( not ( = ?auto_200602 ?auto_200606 ) ) ( not ( = ?auto_200602 ?auto_200609 ) ) ( not ( = ?auto_200603 ?auto_200604 ) ) ( not ( = ?auto_200603 ?auto_200605 ) ) ( not ( = ?auto_200603 ?auto_200606 ) ) ( not ( = ?auto_200603 ?auto_200609 ) ) ( not ( = ?auto_200604 ?auto_200605 ) ) ( not ( = ?auto_200604 ?auto_200606 ) ) ( not ( = ?auto_200604 ?auto_200609 ) ) ( not ( = ?auto_200605 ?auto_200606 ) ) ( not ( = ?auto_200605 ?auto_200609 ) ) ( not ( = ?auto_200606 ?auto_200609 ) ) ( CLEAR ?auto_200608 ) ( not ( = ?auto_200602 ?auto_200607 ) ) ( not ( = ?auto_200602 ?auto_200608 ) ) ( not ( = ?auto_200603 ?auto_200607 ) ) ( not ( = ?auto_200603 ?auto_200608 ) ) ( not ( = ?auto_200604 ?auto_200607 ) ) ( not ( = ?auto_200604 ?auto_200608 ) ) ( not ( = ?auto_200605 ?auto_200607 ) ) ( not ( = ?auto_200605 ?auto_200608 ) ) ( not ( = ?auto_200606 ?auto_200607 ) ) ( not ( = ?auto_200606 ?auto_200608 ) ) ( not ( = ?auto_200609 ?auto_200607 ) ) ( not ( = ?auto_200609 ?auto_200608 ) ) ( not ( = ?auto_200607 ?auto_200608 ) ) ( ON ?auto_200607 ?auto_200609 ) ( CLEAR ?auto_200607 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_200602 ?auto_200603 ?auto_200604 ?auto_200605 ?auto_200606 ?auto_200609 )
      ( MAKE-5PILE ?auto_200602 ?auto_200603 ?auto_200604 ?auto_200605 ?auto_200606 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_200610 - BLOCK
      ?auto_200611 - BLOCK
      ?auto_200612 - BLOCK
      ?auto_200613 - BLOCK
      ?auto_200614 - BLOCK
    )
    :vars
    (
      ?auto_200616 - BLOCK
      ?auto_200617 - BLOCK
      ?auto_200615 - BLOCK
      ?auto_200618 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_200616 ?auto_200614 ) ( ON-TABLE ?auto_200610 ) ( ON ?auto_200611 ?auto_200610 ) ( ON ?auto_200612 ?auto_200611 ) ( ON ?auto_200613 ?auto_200612 ) ( ON ?auto_200614 ?auto_200613 ) ( not ( = ?auto_200610 ?auto_200611 ) ) ( not ( = ?auto_200610 ?auto_200612 ) ) ( not ( = ?auto_200610 ?auto_200613 ) ) ( not ( = ?auto_200610 ?auto_200614 ) ) ( not ( = ?auto_200610 ?auto_200616 ) ) ( not ( = ?auto_200611 ?auto_200612 ) ) ( not ( = ?auto_200611 ?auto_200613 ) ) ( not ( = ?auto_200611 ?auto_200614 ) ) ( not ( = ?auto_200611 ?auto_200616 ) ) ( not ( = ?auto_200612 ?auto_200613 ) ) ( not ( = ?auto_200612 ?auto_200614 ) ) ( not ( = ?auto_200612 ?auto_200616 ) ) ( not ( = ?auto_200613 ?auto_200614 ) ) ( not ( = ?auto_200613 ?auto_200616 ) ) ( not ( = ?auto_200614 ?auto_200616 ) ) ( not ( = ?auto_200610 ?auto_200617 ) ) ( not ( = ?auto_200610 ?auto_200615 ) ) ( not ( = ?auto_200611 ?auto_200617 ) ) ( not ( = ?auto_200611 ?auto_200615 ) ) ( not ( = ?auto_200612 ?auto_200617 ) ) ( not ( = ?auto_200612 ?auto_200615 ) ) ( not ( = ?auto_200613 ?auto_200617 ) ) ( not ( = ?auto_200613 ?auto_200615 ) ) ( not ( = ?auto_200614 ?auto_200617 ) ) ( not ( = ?auto_200614 ?auto_200615 ) ) ( not ( = ?auto_200616 ?auto_200617 ) ) ( not ( = ?auto_200616 ?auto_200615 ) ) ( not ( = ?auto_200617 ?auto_200615 ) ) ( ON ?auto_200617 ?auto_200616 ) ( CLEAR ?auto_200617 ) ( HOLDING ?auto_200615 ) ( CLEAR ?auto_200618 ) ( ON-TABLE ?auto_200618 ) ( not ( = ?auto_200618 ?auto_200615 ) ) ( not ( = ?auto_200610 ?auto_200618 ) ) ( not ( = ?auto_200611 ?auto_200618 ) ) ( not ( = ?auto_200612 ?auto_200618 ) ) ( not ( = ?auto_200613 ?auto_200618 ) ) ( not ( = ?auto_200614 ?auto_200618 ) ) ( not ( = ?auto_200616 ?auto_200618 ) ) ( not ( = ?auto_200617 ?auto_200618 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_200618 ?auto_200615 )
      ( MAKE-5PILE ?auto_200610 ?auto_200611 ?auto_200612 ?auto_200613 ?auto_200614 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_200619 - BLOCK
      ?auto_200620 - BLOCK
      ?auto_200621 - BLOCK
      ?auto_200622 - BLOCK
      ?auto_200623 - BLOCK
    )
    :vars
    (
      ?auto_200626 - BLOCK
      ?auto_200624 - BLOCK
      ?auto_200627 - BLOCK
      ?auto_200625 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_200626 ?auto_200623 ) ( ON-TABLE ?auto_200619 ) ( ON ?auto_200620 ?auto_200619 ) ( ON ?auto_200621 ?auto_200620 ) ( ON ?auto_200622 ?auto_200621 ) ( ON ?auto_200623 ?auto_200622 ) ( not ( = ?auto_200619 ?auto_200620 ) ) ( not ( = ?auto_200619 ?auto_200621 ) ) ( not ( = ?auto_200619 ?auto_200622 ) ) ( not ( = ?auto_200619 ?auto_200623 ) ) ( not ( = ?auto_200619 ?auto_200626 ) ) ( not ( = ?auto_200620 ?auto_200621 ) ) ( not ( = ?auto_200620 ?auto_200622 ) ) ( not ( = ?auto_200620 ?auto_200623 ) ) ( not ( = ?auto_200620 ?auto_200626 ) ) ( not ( = ?auto_200621 ?auto_200622 ) ) ( not ( = ?auto_200621 ?auto_200623 ) ) ( not ( = ?auto_200621 ?auto_200626 ) ) ( not ( = ?auto_200622 ?auto_200623 ) ) ( not ( = ?auto_200622 ?auto_200626 ) ) ( not ( = ?auto_200623 ?auto_200626 ) ) ( not ( = ?auto_200619 ?auto_200624 ) ) ( not ( = ?auto_200619 ?auto_200627 ) ) ( not ( = ?auto_200620 ?auto_200624 ) ) ( not ( = ?auto_200620 ?auto_200627 ) ) ( not ( = ?auto_200621 ?auto_200624 ) ) ( not ( = ?auto_200621 ?auto_200627 ) ) ( not ( = ?auto_200622 ?auto_200624 ) ) ( not ( = ?auto_200622 ?auto_200627 ) ) ( not ( = ?auto_200623 ?auto_200624 ) ) ( not ( = ?auto_200623 ?auto_200627 ) ) ( not ( = ?auto_200626 ?auto_200624 ) ) ( not ( = ?auto_200626 ?auto_200627 ) ) ( not ( = ?auto_200624 ?auto_200627 ) ) ( ON ?auto_200624 ?auto_200626 ) ( CLEAR ?auto_200625 ) ( ON-TABLE ?auto_200625 ) ( not ( = ?auto_200625 ?auto_200627 ) ) ( not ( = ?auto_200619 ?auto_200625 ) ) ( not ( = ?auto_200620 ?auto_200625 ) ) ( not ( = ?auto_200621 ?auto_200625 ) ) ( not ( = ?auto_200622 ?auto_200625 ) ) ( not ( = ?auto_200623 ?auto_200625 ) ) ( not ( = ?auto_200626 ?auto_200625 ) ) ( not ( = ?auto_200624 ?auto_200625 ) ) ( ON ?auto_200627 ?auto_200624 ) ( CLEAR ?auto_200627 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_200619 ?auto_200620 ?auto_200621 ?auto_200622 ?auto_200623 ?auto_200626 ?auto_200624 )
      ( MAKE-5PILE ?auto_200619 ?auto_200620 ?auto_200621 ?auto_200622 ?auto_200623 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_200628 - BLOCK
      ?auto_200629 - BLOCK
      ?auto_200630 - BLOCK
      ?auto_200631 - BLOCK
      ?auto_200632 - BLOCK
    )
    :vars
    (
      ?auto_200636 - BLOCK
      ?auto_200634 - BLOCK
      ?auto_200635 - BLOCK
      ?auto_200633 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_200636 ?auto_200632 ) ( ON-TABLE ?auto_200628 ) ( ON ?auto_200629 ?auto_200628 ) ( ON ?auto_200630 ?auto_200629 ) ( ON ?auto_200631 ?auto_200630 ) ( ON ?auto_200632 ?auto_200631 ) ( not ( = ?auto_200628 ?auto_200629 ) ) ( not ( = ?auto_200628 ?auto_200630 ) ) ( not ( = ?auto_200628 ?auto_200631 ) ) ( not ( = ?auto_200628 ?auto_200632 ) ) ( not ( = ?auto_200628 ?auto_200636 ) ) ( not ( = ?auto_200629 ?auto_200630 ) ) ( not ( = ?auto_200629 ?auto_200631 ) ) ( not ( = ?auto_200629 ?auto_200632 ) ) ( not ( = ?auto_200629 ?auto_200636 ) ) ( not ( = ?auto_200630 ?auto_200631 ) ) ( not ( = ?auto_200630 ?auto_200632 ) ) ( not ( = ?auto_200630 ?auto_200636 ) ) ( not ( = ?auto_200631 ?auto_200632 ) ) ( not ( = ?auto_200631 ?auto_200636 ) ) ( not ( = ?auto_200632 ?auto_200636 ) ) ( not ( = ?auto_200628 ?auto_200634 ) ) ( not ( = ?auto_200628 ?auto_200635 ) ) ( not ( = ?auto_200629 ?auto_200634 ) ) ( not ( = ?auto_200629 ?auto_200635 ) ) ( not ( = ?auto_200630 ?auto_200634 ) ) ( not ( = ?auto_200630 ?auto_200635 ) ) ( not ( = ?auto_200631 ?auto_200634 ) ) ( not ( = ?auto_200631 ?auto_200635 ) ) ( not ( = ?auto_200632 ?auto_200634 ) ) ( not ( = ?auto_200632 ?auto_200635 ) ) ( not ( = ?auto_200636 ?auto_200634 ) ) ( not ( = ?auto_200636 ?auto_200635 ) ) ( not ( = ?auto_200634 ?auto_200635 ) ) ( ON ?auto_200634 ?auto_200636 ) ( not ( = ?auto_200633 ?auto_200635 ) ) ( not ( = ?auto_200628 ?auto_200633 ) ) ( not ( = ?auto_200629 ?auto_200633 ) ) ( not ( = ?auto_200630 ?auto_200633 ) ) ( not ( = ?auto_200631 ?auto_200633 ) ) ( not ( = ?auto_200632 ?auto_200633 ) ) ( not ( = ?auto_200636 ?auto_200633 ) ) ( not ( = ?auto_200634 ?auto_200633 ) ) ( ON ?auto_200635 ?auto_200634 ) ( CLEAR ?auto_200635 ) ( HOLDING ?auto_200633 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_200633 )
      ( MAKE-5PILE ?auto_200628 ?auto_200629 ?auto_200630 ?auto_200631 ?auto_200632 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_200637 - BLOCK
      ?auto_200638 - BLOCK
      ?auto_200639 - BLOCK
      ?auto_200640 - BLOCK
      ?auto_200641 - BLOCK
    )
    :vars
    (
      ?auto_200643 - BLOCK
      ?auto_200642 - BLOCK
      ?auto_200645 - BLOCK
      ?auto_200644 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_200643 ?auto_200641 ) ( ON-TABLE ?auto_200637 ) ( ON ?auto_200638 ?auto_200637 ) ( ON ?auto_200639 ?auto_200638 ) ( ON ?auto_200640 ?auto_200639 ) ( ON ?auto_200641 ?auto_200640 ) ( not ( = ?auto_200637 ?auto_200638 ) ) ( not ( = ?auto_200637 ?auto_200639 ) ) ( not ( = ?auto_200637 ?auto_200640 ) ) ( not ( = ?auto_200637 ?auto_200641 ) ) ( not ( = ?auto_200637 ?auto_200643 ) ) ( not ( = ?auto_200638 ?auto_200639 ) ) ( not ( = ?auto_200638 ?auto_200640 ) ) ( not ( = ?auto_200638 ?auto_200641 ) ) ( not ( = ?auto_200638 ?auto_200643 ) ) ( not ( = ?auto_200639 ?auto_200640 ) ) ( not ( = ?auto_200639 ?auto_200641 ) ) ( not ( = ?auto_200639 ?auto_200643 ) ) ( not ( = ?auto_200640 ?auto_200641 ) ) ( not ( = ?auto_200640 ?auto_200643 ) ) ( not ( = ?auto_200641 ?auto_200643 ) ) ( not ( = ?auto_200637 ?auto_200642 ) ) ( not ( = ?auto_200637 ?auto_200645 ) ) ( not ( = ?auto_200638 ?auto_200642 ) ) ( not ( = ?auto_200638 ?auto_200645 ) ) ( not ( = ?auto_200639 ?auto_200642 ) ) ( not ( = ?auto_200639 ?auto_200645 ) ) ( not ( = ?auto_200640 ?auto_200642 ) ) ( not ( = ?auto_200640 ?auto_200645 ) ) ( not ( = ?auto_200641 ?auto_200642 ) ) ( not ( = ?auto_200641 ?auto_200645 ) ) ( not ( = ?auto_200643 ?auto_200642 ) ) ( not ( = ?auto_200643 ?auto_200645 ) ) ( not ( = ?auto_200642 ?auto_200645 ) ) ( ON ?auto_200642 ?auto_200643 ) ( not ( = ?auto_200644 ?auto_200645 ) ) ( not ( = ?auto_200637 ?auto_200644 ) ) ( not ( = ?auto_200638 ?auto_200644 ) ) ( not ( = ?auto_200639 ?auto_200644 ) ) ( not ( = ?auto_200640 ?auto_200644 ) ) ( not ( = ?auto_200641 ?auto_200644 ) ) ( not ( = ?auto_200643 ?auto_200644 ) ) ( not ( = ?auto_200642 ?auto_200644 ) ) ( ON ?auto_200645 ?auto_200642 ) ( ON ?auto_200644 ?auto_200645 ) ( CLEAR ?auto_200644 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_200637 ?auto_200638 ?auto_200639 ?auto_200640 ?auto_200641 ?auto_200643 ?auto_200642 ?auto_200645 )
      ( MAKE-5PILE ?auto_200637 ?auto_200638 ?auto_200639 ?auto_200640 ?auto_200641 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_200650 - BLOCK
      ?auto_200651 - BLOCK
      ?auto_200652 - BLOCK
      ?auto_200653 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_200653 ) ( CLEAR ?auto_200652 ) ( ON-TABLE ?auto_200650 ) ( ON ?auto_200651 ?auto_200650 ) ( ON ?auto_200652 ?auto_200651 ) ( not ( = ?auto_200650 ?auto_200651 ) ) ( not ( = ?auto_200650 ?auto_200652 ) ) ( not ( = ?auto_200650 ?auto_200653 ) ) ( not ( = ?auto_200651 ?auto_200652 ) ) ( not ( = ?auto_200651 ?auto_200653 ) ) ( not ( = ?auto_200652 ?auto_200653 ) ) )
    :subtasks
    ( ( !STACK ?auto_200653 ?auto_200652 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_200654 - BLOCK
      ?auto_200655 - BLOCK
      ?auto_200656 - BLOCK
      ?auto_200657 - BLOCK
    )
    :vars
    (
      ?auto_200658 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_200656 ) ( ON-TABLE ?auto_200654 ) ( ON ?auto_200655 ?auto_200654 ) ( ON ?auto_200656 ?auto_200655 ) ( not ( = ?auto_200654 ?auto_200655 ) ) ( not ( = ?auto_200654 ?auto_200656 ) ) ( not ( = ?auto_200654 ?auto_200657 ) ) ( not ( = ?auto_200655 ?auto_200656 ) ) ( not ( = ?auto_200655 ?auto_200657 ) ) ( not ( = ?auto_200656 ?auto_200657 ) ) ( ON ?auto_200657 ?auto_200658 ) ( CLEAR ?auto_200657 ) ( HAND-EMPTY ) ( not ( = ?auto_200654 ?auto_200658 ) ) ( not ( = ?auto_200655 ?auto_200658 ) ) ( not ( = ?auto_200656 ?auto_200658 ) ) ( not ( = ?auto_200657 ?auto_200658 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_200657 ?auto_200658 )
      ( MAKE-4PILE ?auto_200654 ?auto_200655 ?auto_200656 ?auto_200657 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_200659 - BLOCK
      ?auto_200660 - BLOCK
      ?auto_200661 - BLOCK
      ?auto_200662 - BLOCK
    )
    :vars
    (
      ?auto_200663 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_200659 ) ( ON ?auto_200660 ?auto_200659 ) ( not ( = ?auto_200659 ?auto_200660 ) ) ( not ( = ?auto_200659 ?auto_200661 ) ) ( not ( = ?auto_200659 ?auto_200662 ) ) ( not ( = ?auto_200660 ?auto_200661 ) ) ( not ( = ?auto_200660 ?auto_200662 ) ) ( not ( = ?auto_200661 ?auto_200662 ) ) ( ON ?auto_200662 ?auto_200663 ) ( CLEAR ?auto_200662 ) ( not ( = ?auto_200659 ?auto_200663 ) ) ( not ( = ?auto_200660 ?auto_200663 ) ) ( not ( = ?auto_200661 ?auto_200663 ) ) ( not ( = ?auto_200662 ?auto_200663 ) ) ( HOLDING ?auto_200661 ) ( CLEAR ?auto_200660 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_200659 ?auto_200660 ?auto_200661 )
      ( MAKE-4PILE ?auto_200659 ?auto_200660 ?auto_200661 ?auto_200662 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_200664 - BLOCK
      ?auto_200665 - BLOCK
      ?auto_200666 - BLOCK
      ?auto_200667 - BLOCK
    )
    :vars
    (
      ?auto_200668 - BLOCK
      ?auto_200672 - BLOCK
      ?auto_200671 - BLOCK
      ?auto_200670 - BLOCK
      ?auto_200669 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_200664 ) ( ON ?auto_200665 ?auto_200664 ) ( not ( = ?auto_200664 ?auto_200665 ) ) ( not ( = ?auto_200664 ?auto_200666 ) ) ( not ( = ?auto_200664 ?auto_200667 ) ) ( not ( = ?auto_200665 ?auto_200666 ) ) ( not ( = ?auto_200665 ?auto_200667 ) ) ( not ( = ?auto_200666 ?auto_200667 ) ) ( ON ?auto_200667 ?auto_200668 ) ( not ( = ?auto_200664 ?auto_200668 ) ) ( not ( = ?auto_200665 ?auto_200668 ) ) ( not ( = ?auto_200666 ?auto_200668 ) ) ( not ( = ?auto_200667 ?auto_200668 ) ) ( CLEAR ?auto_200665 ) ( ON ?auto_200666 ?auto_200667 ) ( CLEAR ?auto_200666 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_200672 ) ( ON ?auto_200671 ?auto_200672 ) ( ON ?auto_200670 ?auto_200671 ) ( ON ?auto_200669 ?auto_200670 ) ( ON ?auto_200668 ?auto_200669 ) ( not ( = ?auto_200672 ?auto_200671 ) ) ( not ( = ?auto_200672 ?auto_200670 ) ) ( not ( = ?auto_200672 ?auto_200669 ) ) ( not ( = ?auto_200672 ?auto_200668 ) ) ( not ( = ?auto_200672 ?auto_200667 ) ) ( not ( = ?auto_200672 ?auto_200666 ) ) ( not ( = ?auto_200671 ?auto_200670 ) ) ( not ( = ?auto_200671 ?auto_200669 ) ) ( not ( = ?auto_200671 ?auto_200668 ) ) ( not ( = ?auto_200671 ?auto_200667 ) ) ( not ( = ?auto_200671 ?auto_200666 ) ) ( not ( = ?auto_200670 ?auto_200669 ) ) ( not ( = ?auto_200670 ?auto_200668 ) ) ( not ( = ?auto_200670 ?auto_200667 ) ) ( not ( = ?auto_200670 ?auto_200666 ) ) ( not ( = ?auto_200669 ?auto_200668 ) ) ( not ( = ?auto_200669 ?auto_200667 ) ) ( not ( = ?auto_200669 ?auto_200666 ) ) ( not ( = ?auto_200664 ?auto_200672 ) ) ( not ( = ?auto_200664 ?auto_200671 ) ) ( not ( = ?auto_200664 ?auto_200670 ) ) ( not ( = ?auto_200664 ?auto_200669 ) ) ( not ( = ?auto_200665 ?auto_200672 ) ) ( not ( = ?auto_200665 ?auto_200671 ) ) ( not ( = ?auto_200665 ?auto_200670 ) ) ( not ( = ?auto_200665 ?auto_200669 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_200672 ?auto_200671 ?auto_200670 ?auto_200669 ?auto_200668 ?auto_200667 )
      ( MAKE-4PILE ?auto_200664 ?auto_200665 ?auto_200666 ?auto_200667 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_200673 - BLOCK
      ?auto_200674 - BLOCK
      ?auto_200675 - BLOCK
      ?auto_200676 - BLOCK
    )
    :vars
    (
      ?auto_200678 - BLOCK
      ?auto_200679 - BLOCK
      ?auto_200681 - BLOCK
      ?auto_200680 - BLOCK
      ?auto_200677 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_200673 ) ( not ( = ?auto_200673 ?auto_200674 ) ) ( not ( = ?auto_200673 ?auto_200675 ) ) ( not ( = ?auto_200673 ?auto_200676 ) ) ( not ( = ?auto_200674 ?auto_200675 ) ) ( not ( = ?auto_200674 ?auto_200676 ) ) ( not ( = ?auto_200675 ?auto_200676 ) ) ( ON ?auto_200676 ?auto_200678 ) ( not ( = ?auto_200673 ?auto_200678 ) ) ( not ( = ?auto_200674 ?auto_200678 ) ) ( not ( = ?auto_200675 ?auto_200678 ) ) ( not ( = ?auto_200676 ?auto_200678 ) ) ( ON ?auto_200675 ?auto_200676 ) ( CLEAR ?auto_200675 ) ( ON-TABLE ?auto_200679 ) ( ON ?auto_200681 ?auto_200679 ) ( ON ?auto_200680 ?auto_200681 ) ( ON ?auto_200677 ?auto_200680 ) ( ON ?auto_200678 ?auto_200677 ) ( not ( = ?auto_200679 ?auto_200681 ) ) ( not ( = ?auto_200679 ?auto_200680 ) ) ( not ( = ?auto_200679 ?auto_200677 ) ) ( not ( = ?auto_200679 ?auto_200678 ) ) ( not ( = ?auto_200679 ?auto_200676 ) ) ( not ( = ?auto_200679 ?auto_200675 ) ) ( not ( = ?auto_200681 ?auto_200680 ) ) ( not ( = ?auto_200681 ?auto_200677 ) ) ( not ( = ?auto_200681 ?auto_200678 ) ) ( not ( = ?auto_200681 ?auto_200676 ) ) ( not ( = ?auto_200681 ?auto_200675 ) ) ( not ( = ?auto_200680 ?auto_200677 ) ) ( not ( = ?auto_200680 ?auto_200678 ) ) ( not ( = ?auto_200680 ?auto_200676 ) ) ( not ( = ?auto_200680 ?auto_200675 ) ) ( not ( = ?auto_200677 ?auto_200678 ) ) ( not ( = ?auto_200677 ?auto_200676 ) ) ( not ( = ?auto_200677 ?auto_200675 ) ) ( not ( = ?auto_200673 ?auto_200679 ) ) ( not ( = ?auto_200673 ?auto_200681 ) ) ( not ( = ?auto_200673 ?auto_200680 ) ) ( not ( = ?auto_200673 ?auto_200677 ) ) ( not ( = ?auto_200674 ?auto_200679 ) ) ( not ( = ?auto_200674 ?auto_200681 ) ) ( not ( = ?auto_200674 ?auto_200680 ) ) ( not ( = ?auto_200674 ?auto_200677 ) ) ( HOLDING ?auto_200674 ) ( CLEAR ?auto_200673 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_200673 ?auto_200674 )
      ( MAKE-4PILE ?auto_200673 ?auto_200674 ?auto_200675 ?auto_200676 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_200682 - BLOCK
      ?auto_200683 - BLOCK
      ?auto_200684 - BLOCK
      ?auto_200685 - BLOCK
    )
    :vars
    (
      ?auto_200686 - BLOCK
      ?auto_200690 - BLOCK
      ?auto_200689 - BLOCK
      ?auto_200687 - BLOCK
      ?auto_200688 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_200682 ) ( not ( = ?auto_200682 ?auto_200683 ) ) ( not ( = ?auto_200682 ?auto_200684 ) ) ( not ( = ?auto_200682 ?auto_200685 ) ) ( not ( = ?auto_200683 ?auto_200684 ) ) ( not ( = ?auto_200683 ?auto_200685 ) ) ( not ( = ?auto_200684 ?auto_200685 ) ) ( ON ?auto_200685 ?auto_200686 ) ( not ( = ?auto_200682 ?auto_200686 ) ) ( not ( = ?auto_200683 ?auto_200686 ) ) ( not ( = ?auto_200684 ?auto_200686 ) ) ( not ( = ?auto_200685 ?auto_200686 ) ) ( ON ?auto_200684 ?auto_200685 ) ( ON-TABLE ?auto_200690 ) ( ON ?auto_200689 ?auto_200690 ) ( ON ?auto_200687 ?auto_200689 ) ( ON ?auto_200688 ?auto_200687 ) ( ON ?auto_200686 ?auto_200688 ) ( not ( = ?auto_200690 ?auto_200689 ) ) ( not ( = ?auto_200690 ?auto_200687 ) ) ( not ( = ?auto_200690 ?auto_200688 ) ) ( not ( = ?auto_200690 ?auto_200686 ) ) ( not ( = ?auto_200690 ?auto_200685 ) ) ( not ( = ?auto_200690 ?auto_200684 ) ) ( not ( = ?auto_200689 ?auto_200687 ) ) ( not ( = ?auto_200689 ?auto_200688 ) ) ( not ( = ?auto_200689 ?auto_200686 ) ) ( not ( = ?auto_200689 ?auto_200685 ) ) ( not ( = ?auto_200689 ?auto_200684 ) ) ( not ( = ?auto_200687 ?auto_200688 ) ) ( not ( = ?auto_200687 ?auto_200686 ) ) ( not ( = ?auto_200687 ?auto_200685 ) ) ( not ( = ?auto_200687 ?auto_200684 ) ) ( not ( = ?auto_200688 ?auto_200686 ) ) ( not ( = ?auto_200688 ?auto_200685 ) ) ( not ( = ?auto_200688 ?auto_200684 ) ) ( not ( = ?auto_200682 ?auto_200690 ) ) ( not ( = ?auto_200682 ?auto_200689 ) ) ( not ( = ?auto_200682 ?auto_200687 ) ) ( not ( = ?auto_200682 ?auto_200688 ) ) ( not ( = ?auto_200683 ?auto_200690 ) ) ( not ( = ?auto_200683 ?auto_200689 ) ) ( not ( = ?auto_200683 ?auto_200687 ) ) ( not ( = ?auto_200683 ?auto_200688 ) ) ( CLEAR ?auto_200682 ) ( ON ?auto_200683 ?auto_200684 ) ( CLEAR ?auto_200683 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_200690 ?auto_200689 ?auto_200687 ?auto_200688 ?auto_200686 ?auto_200685 ?auto_200684 )
      ( MAKE-4PILE ?auto_200682 ?auto_200683 ?auto_200684 ?auto_200685 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_200691 - BLOCK
      ?auto_200692 - BLOCK
      ?auto_200693 - BLOCK
      ?auto_200694 - BLOCK
    )
    :vars
    (
      ?auto_200699 - BLOCK
      ?auto_200698 - BLOCK
      ?auto_200697 - BLOCK
      ?auto_200696 - BLOCK
      ?auto_200695 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_200691 ?auto_200692 ) ) ( not ( = ?auto_200691 ?auto_200693 ) ) ( not ( = ?auto_200691 ?auto_200694 ) ) ( not ( = ?auto_200692 ?auto_200693 ) ) ( not ( = ?auto_200692 ?auto_200694 ) ) ( not ( = ?auto_200693 ?auto_200694 ) ) ( ON ?auto_200694 ?auto_200699 ) ( not ( = ?auto_200691 ?auto_200699 ) ) ( not ( = ?auto_200692 ?auto_200699 ) ) ( not ( = ?auto_200693 ?auto_200699 ) ) ( not ( = ?auto_200694 ?auto_200699 ) ) ( ON ?auto_200693 ?auto_200694 ) ( ON-TABLE ?auto_200698 ) ( ON ?auto_200697 ?auto_200698 ) ( ON ?auto_200696 ?auto_200697 ) ( ON ?auto_200695 ?auto_200696 ) ( ON ?auto_200699 ?auto_200695 ) ( not ( = ?auto_200698 ?auto_200697 ) ) ( not ( = ?auto_200698 ?auto_200696 ) ) ( not ( = ?auto_200698 ?auto_200695 ) ) ( not ( = ?auto_200698 ?auto_200699 ) ) ( not ( = ?auto_200698 ?auto_200694 ) ) ( not ( = ?auto_200698 ?auto_200693 ) ) ( not ( = ?auto_200697 ?auto_200696 ) ) ( not ( = ?auto_200697 ?auto_200695 ) ) ( not ( = ?auto_200697 ?auto_200699 ) ) ( not ( = ?auto_200697 ?auto_200694 ) ) ( not ( = ?auto_200697 ?auto_200693 ) ) ( not ( = ?auto_200696 ?auto_200695 ) ) ( not ( = ?auto_200696 ?auto_200699 ) ) ( not ( = ?auto_200696 ?auto_200694 ) ) ( not ( = ?auto_200696 ?auto_200693 ) ) ( not ( = ?auto_200695 ?auto_200699 ) ) ( not ( = ?auto_200695 ?auto_200694 ) ) ( not ( = ?auto_200695 ?auto_200693 ) ) ( not ( = ?auto_200691 ?auto_200698 ) ) ( not ( = ?auto_200691 ?auto_200697 ) ) ( not ( = ?auto_200691 ?auto_200696 ) ) ( not ( = ?auto_200691 ?auto_200695 ) ) ( not ( = ?auto_200692 ?auto_200698 ) ) ( not ( = ?auto_200692 ?auto_200697 ) ) ( not ( = ?auto_200692 ?auto_200696 ) ) ( not ( = ?auto_200692 ?auto_200695 ) ) ( ON ?auto_200692 ?auto_200693 ) ( CLEAR ?auto_200692 ) ( HOLDING ?auto_200691 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_200691 )
      ( MAKE-4PILE ?auto_200691 ?auto_200692 ?auto_200693 ?auto_200694 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_200700 - BLOCK
      ?auto_200701 - BLOCK
      ?auto_200702 - BLOCK
      ?auto_200703 - BLOCK
    )
    :vars
    (
      ?auto_200706 - BLOCK
      ?auto_200707 - BLOCK
      ?auto_200708 - BLOCK
      ?auto_200704 - BLOCK
      ?auto_200705 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_200700 ?auto_200701 ) ) ( not ( = ?auto_200700 ?auto_200702 ) ) ( not ( = ?auto_200700 ?auto_200703 ) ) ( not ( = ?auto_200701 ?auto_200702 ) ) ( not ( = ?auto_200701 ?auto_200703 ) ) ( not ( = ?auto_200702 ?auto_200703 ) ) ( ON ?auto_200703 ?auto_200706 ) ( not ( = ?auto_200700 ?auto_200706 ) ) ( not ( = ?auto_200701 ?auto_200706 ) ) ( not ( = ?auto_200702 ?auto_200706 ) ) ( not ( = ?auto_200703 ?auto_200706 ) ) ( ON ?auto_200702 ?auto_200703 ) ( ON-TABLE ?auto_200707 ) ( ON ?auto_200708 ?auto_200707 ) ( ON ?auto_200704 ?auto_200708 ) ( ON ?auto_200705 ?auto_200704 ) ( ON ?auto_200706 ?auto_200705 ) ( not ( = ?auto_200707 ?auto_200708 ) ) ( not ( = ?auto_200707 ?auto_200704 ) ) ( not ( = ?auto_200707 ?auto_200705 ) ) ( not ( = ?auto_200707 ?auto_200706 ) ) ( not ( = ?auto_200707 ?auto_200703 ) ) ( not ( = ?auto_200707 ?auto_200702 ) ) ( not ( = ?auto_200708 ?auto_200704 ) ) ( not ( = ?auto_200708 ?auto_200705 ) ) ( not ( = ?auto_200708 ?auto_200706 ) ) ( not ( = ?auto_200708 ?auto_200703 ) ) ( not ( = ?auto_200708 ?auto_200702 ) ) ( not ( = ?auto_200704 ?auto_200705 ) ) ( not ( = ?auto_200704 ?auto_200706 ) ) ( not ( = ?auto_200704 ?auto_200703 ) ) ( not ( = ?auto_200704 ?auto_200702 ) ) ( not ( = ?auto_200705 ?auto_200706 ) ) ( not ( = ?auto_200705 ?auto_200703 ) ) ( not ( = ?auto_200705 ?auto_200702 ) ) ( not ( = ?auto_200700 ?auto_200707 ) ) ( not ( = ?auto_200700 ?auto_200708 ) ) ( not ( = ?auto_200700 ?auto_200704 ) ) ( not ( = ?auto_200700 ?auto_200705 ) ) ( not ( = ?auto_200701 ?auto_200707 ) ) ( not ( = ?auto_200701 ?auto_200708 ) ) ( not ( = ?auto_200701 ?auto_200704 ) ) ( not ( = ?auto_200701 ?auto_200705 ) ) ( ON ?auto_200701 ?auto_200702 ) ( ON ?auto_200700 ?auto_200701 ) ( CLEAR ?auto_200700 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_200707 ?auto_200708 ?auto_200704 ?auto_200705 ?auto_200706 ?auto_200703 ?auto_200702 ?auto_200701 )
      ( MAKE-4PILE ?auto_200700 ?auto_200701 ?auto_200702 ?auto_200703 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_200713 - BLOCK
      ?auto_200714 - BLOCK
      ?auto_200715 - BLOCK
      ?auto_200716 - BLOCK
    )
    :vars
    (
      ?auto_200717 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_200717 ?auto_200716 ) ( CLEAR ?auto_200717 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_200713 ) ( ON ?auto_200714 ?auto_200713 ) ( ON ?auto_200715 ?auto_200714 ) ( ON ?auto_200716 ?auto_200715 ) ( not ( = ?auto_200713 ?auto_200714 ) ) ( not ( = ?auto_200713 ?auto_200715 ) ) ( not ( = ?auto_200713 ?auto_200716 ) ) ( not ( = ?auto_200713 ?auto_200717 ) ) ( not ( = ?auto_200714 ?auto_200715 ) ) ( not ( = ?auto_200714 ?auto_200716 ) ) ( not ( = ?auto_200714 ?auto_200717 ) ) ( not ( = ?auto_200715 ?auto_200716 ) ) ( not ( = ?auto_200715 ?auto_200717 ) ) ( not ( = ?auto_200716 ?auto_200717 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_200717 ?auto_200716 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_200718 - BLOCK
      ?auto_200719 - BLOCK
      ?auto_200720 - BLOCK
      ?auto_200721 - BLOCK
    )
    :vars
    (
      ?auto_200722 - BLOCK
      ?auto_200723 - BLOCK
      ?auto_200724 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_200722 ?auto_200721 ) ( CLEAR ?auto_200722 ) ( ON-TABLE ?auto_200718 ) ( ON ?auto_200719 ?auto_200718 ) ( ON ?auto_200720 ?auto_200719 ) ( ON ?auto_200721 ?auto_200720 ) ( not ( = ?auto_200718 ?auto_200719 ) ) ( not ( = ?auto_200718 ?auto_200720 ) ) ( not ( = ?auto_200718 ?auto_200721 ) ) ( not ( = ?auto_200718 ?auto_200722 ) ) ( not ( = ?auto_200719 ?auto_200720 ) ) ( not ( = ?auto_200719 ?auto_200721 ) ) ( not ( = ?auto_200719 ?auto_200722 ) ) ( not ( = ?auto_200720 ?auto_200721 ) ) ( not ( = ?auto_200720 ?auto_200722 ) ) ( not ( = ?auto_200721 ?auto_200722 ) ) ( HOLDING ?auto_200723 ) ( CLEAR ?auto_200724 ) ( not ( = ?auto_200718 ?auto_200723 ) ) ( not ( = ?auto_200718 ?auto_200724 ) ) ( not ( = ?auto_200719 ?auto_200723 ) ) ( not ( = ?auto_200719 ?auto_200724 ) ) ( not ( = ?auto_200720 ?auto_200723 ) ) ( not ( = ?auto_200720 ?auto_200724 ) ) ( not ( = ?auto_200721 ?auto_200723 ) ) ( not ( = ?auto_200721 ?auto_200724 ) ) ( not ( = ?auto_200722 ?auto_200723 ) ) ( not ( = ?auto_200722 ?auto_200724 ) ) ( not ( = ?auto_200723 ?auto_200724 ) ) )
    :subtasks
    ( ( !STACK ?auto_200723 ?auto_200724 )
      ( MAKE-4PILE ?auto_200718 ?auto_200719 ?auto_200720 ?auto_200721 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_200725 - BLOCK
      ?auto_200726 - BLOCK
      ?auto_200727 - BLOCK
      ?auto_200728 - BLOCK
    )
    :vars
    (
      ?auto_200731 - BLOCK
      ?auto_200730 - BLOCK
      ?auto_200729 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_200731 ?auto_200728 ) ( ON-TABLE ?auto_200725 ) ( ON ?auto_200726 ?auto_200725 ) ( ON ?auto_200727 ?auto_200726 ) ( ON ?auto_200728 ?auto_200727 ) ( not ( = ?auto_200725 ?auto_200726 ) ) ( not ( = ?auto_200725 ?auto_200727 ) ) ( not ( = ?auto_200725 ?auto_200728 ) ) ( not ( = ?auto_200725 ?auto_200731 ) ) ( not ( = ?auto_200726 ?auto_200727 ) ) ( not ( = ?auto_200726 ?auto_200728 ) ) ( not ( = ?auto_200726 ?auto_200731 ) ) ( not ( = ?auto_200727 ?auto_200728 ) ) ( not ( = ?auto_200727 ?auto_200731 ) ) ( not ( = ?auto_200728 ?auto_200731 ) ) ( CLEAR ?auto_200730 ) ( not ( = ?auto_200725 ?auto_200729 ) ) ( not ( = ?auto_200725 ?auto_200730 ) ) ( not ( = ?auto_200726 ?auto_200729 ) ) ( not ( = ?auto_200726 ?auto_200730 ) ) ( not ( = ?auto_200727 ?auto_200729 ) ) ( not ( = ?auto_200727 ?auto_200730 ) ) ( not ( = ?auto_200728 ?auto_200729 ) ) ( not ( = ?auto_200728 ?auto_200730 ) ) ( not ( = ?auto_200731 ?auto_200729 ) ) ( not ( = ?auto_200731 ?auto_200730 ) ) ( not ( = ?auto_200729 ?auto_200730 ) ) ( ON ?auto_200729 ?auto_200731 ) ( CLEAR ?auto_200729 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_200725 ?auto_200726 ?auto_200727 ?auto_200728 ?auto_200731 )
      ( MAKE-4PILE ?auto_200725 ?auto_200726 ?auto_200727 ?auto_200728 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_200732 - BLOCK
      ?auto_200733 - BLOCK
      ?auto_200734 - BLOCK
      ?auto_200735 - BLOCK
    )
    :vars
    (
      ?auto_200736 - BLOCK
      ?auto_200737 - BLOCK
      ?auto_200738 - BLOCK
      ?auto_200740 - BLOCK
      ?auto_200739 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_200736 ?auto_200735 ) ( ON-TABLE ?auto_200732 ) ( ON ?auto_200733 ?auto_200732 ) ( ON ?auto_200734 ?auto_200733 ) ( ON ?auto_200735 ?auto_200734 ) ( not ( = ?auto_200732 ?auto_200733 ) ) ( not ( = ?auto_200732 ?auto_200734 ) ) ( not ( = ?auto_200732 ?auto_200735 ) ) ( not ( = ?auto_200732 ?auto_200736 ) ) ( not ( = ?auto_200733 ?auto_200734 ) ) ( not ( = ?auto_200733 ?auto_200735 ) ) ( not ( = ?auto_200733 ?auto_200736 ) ) ( not ( = ?auto_200734 ?auto_200735 ) ) ( not ( = ?auto_200734 ?auto_200736 ) ) ( not ( = ?auto_200735 ?auto_200736 ) ) ( not ( = ?auto_200732 ?auto_200737 ) ) ( not ( = ?auto_200732 ?auto_200738 ) ) ( not ( = ?auto_200733 ?auto_200737 ) ) ( not ( = ?auto_200733 ?auto_200738 ) ) ( not ( = ?auto_200734 ?auto_200737 ) ) ( not ( = ?auto_200734 ?auto_200738 ) ) ( not ( = ?auto_200735 ?auto_200737 ) ) ( not ( = ?auto_200735 ?auto_200738 ) ) ( not ( = ?auto_200736 ?auto_200737 ) ) ( not ( = ?auto_200736 ?auto_200738 ) ) ( not ( = ?auto_200737 ?auto_200738 ) ) ( ON ?auto_200737 ?auto_200736 ) ( CLEAR ?auto_200737 ) ( HOLDING ?auto_200738 ) ( CLEAR ?auto_200740 ) ( ON-TABLE ?auto_200739 ) ( ON ?auto_200740 ?auto_200739 ) ( not ( = ?auto_200739 ?auto_200740 ) ) ( not ( = ?auto_200739 ?auto_200738 ) ) ( not ( = ?auto_200740 ?auto_200738 ) ) ( not ( = ?auto_200732 ?auto_200740 ) ) ( not ( = ?auto_200732 ?auto_200739 ) ) ( not ( = ?auto_200733 ?auto_200740 ) ) ( not ( = ?auto_200733 ?auto_200739 ) ) ( not ( = ?auto_200734 ?auto_200740 ) ) ( not ( = ?auto_200734 ?auto_200739 ) ) ( not ( = ?auto_200735 ?auto_200740 ) ) ( not ( = ?auto_200735 ?auto_200739 ) ) ( not ( = ?auto_200736 ?auto_200740 ) ) ( not ( = ?auto_200736 ?auto_200739 ) ) ( not ( = ?auto_200737 ?auto_200740 ) ) ( not ( = ?auto_200737 ?auto_200739 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_200739 ?auto_200740 ?auto_200738 )
      ( MAKE-4PILE ?auto_200732 ?auto_200733 ?auto_200734 ?auto_200735 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_200741 - BLOCK
      ?auto_200742 - BLOCK
      ?auto_200743 - BLOCK
      ?auto_200744 - BLOCK
    )
    :vars
    (
      ?auto_200746 - BLOCK
      ?auto_200745 - BLOCK
      ?auto_200748 - BLOCK
      ?auto_200747 - BLOCK
      ?auto_200749 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_200746 ?auto_200744 ) ( ON-TABLE ?auto_200741 ) ( ON ?auto_200742 ?auto_200741 ) ( ON ?auto_200743 ?auto_200742 ) ( ON ?auto_200744 ?auto_200743 ) ( not ( = ?auto_200741 ?auto_200742 ) ) ( not ( = ?auto_200741 ?auto_200743 ) ) ( not ( = ?auto_200741 ?auto_200744 ) ) ( not ( = ?auto_200741 ?auto_200746 ) ) ( not ( = ?auto_200742 ?auto_200743 ) ) ( not ( = ?auto_200742 ?auto_200744 ) ) ( not ( = ?auto_200742 ?auto_200746 ) ) ( not ( = ?auto_200743 ?auto_200744 ) ) ( not ( = ?auto_200743 ?auto_200746 ) ) ( not ( = ?auto_200744 ?auto_200746 ) ) ( not ( = ?auto_200741 ?auto_200745 ) ) ( not ( = ?auto_200741 ?auto_200748 ) ) ( not ( = ?auto_200742 ?auto_200745 ) ) ( not ( = ?auto_200742 ?auto_200748 ) ) ( not ( = ?auto_200743 ?auto_200745 ) ) ( not ( = ?auto_200743 ?auto_200748 ) ) ( not ( = ?auto_200744 ?auto_200745 ) ) ( not ( = ?auto_200744 ?auto_200748 ) ) ( not ( = ?auto_200746 ?auto_200745 ) ) ( not ( = ?auto_200746 ?auto_200748 ) ) ( not ( = ?auto_200745 ?auto_200748 ) ) ( ON ?auto_200745 ?auto_200746 ) ( CLEAR ?auto_200747 ) ( ON-TABLE ?auto_200749 ) ( ON ?auto_200747 ?auto_200749 ) ( not ( = ?auto_200749 ?auto_200747 ) ) ( not ( = ?auto_200749 ?auto_200748 ) ) ( not ( = ?auto_200747 ?auto_200748 ) ) ( not ( = ?auto_200741 ?auto_200747 ) ) ( not ( = ?auto_200741 ?auto_200749 ) ) ( not ( = ?auto_200742 ?auto_200747 ) ) ( not ( = ?auto_200742 ?auto_200749 ) ) ( not ( = ?auto_200743 ?auto_200747 ) ) ( not ( = ?auto_200743 ?auto_200749 ) ) ( not ( = ?auto_200744 ?auto_200747 ) ) ( not ( = ?auto_200744 ?auto_200749 ) ) ( not ( = ?auto_200746 ?auto_200747 ) ) ( not ( = ?auto_200746 ?auto_200749 ) ) ( not ( = ?auto_200745 ?auto_200747 ) ) ( not ( = ?auto_200745 ?auto_200749 ) ) ( ON ?auto_200748 ?auto_200745 ) ( CLEAR ?auto_200748 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_200741 ?auto_200742 ?auto_200743 ?auto_200744 ?auto_200746 ?auto_200745 )
      ( MAKE-4PILE ?auto_200741 ?auto_200742 ?auto_200743 ?auto_200744 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_200750 - BLOCK
      ?auto_200751 - BLOCK
      ?auto_200752 - BLOCK
      ?auto_200753 - BLOCK
    )
    :vars
    (
      ?auto_200755 - BLOCK
      ?auto_200754 - BLOCK
      ?auto_200757 - BLOCK
      ?auto_200758 - BLOCK
      ?auto_200756 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_200755 ?auto_200753 ) ( ON-TABLE ?auto_200750 ) ( ON ?auto_200751 ?auto_200750 ) ( ON ?auto_200752 ?auto_200751 ) ( ON ?auto_200753 ?auto_200752 ) ( not ( = ?auto_200750 ?auto_200751 ) ) ( not ( = ?auto_200750 ?auto_200752 ) ) ( not ( = ?auto_200750 ?auto_200753 ) ) ( not ( = ?auto_200750 ?auto_200755 ) ) ( not ( = ?auto_200751 ?auto_200752 ) ) ( not ( = ?auto_200751 ?auto_200753 ) ) ( not ( = ?auto_200751 ?auto_200755 ) ) ( not ( = ?auto_200752 ?auto_200753 ) ) ( not ( = ?auto_200752 ?auto_200755 ) ) ( not ( = ?auto_200753 ?auto_200755 ) ) ( not ( = ?auto_200750 ?auto_200754 ) ) ( not ( = ?auto_200750 ?auto_200757 ) ) ( not ( = ?auto_200751 ?auto_200754 ) ) ( not ( = ?auto_200751 ?auto_200757 ) ) ( not ( = ?auto_200752 ?auto_200754 ) ) ( not ( = ?auto_200752 ?auto_200757 ) ) ( not ( = ?auto_200753 ?auto_200754 ) ) ( not ( = ?auto_200753 ?auto_200757 ) ) ( not ( = ?auto_200755 ?auto_200754 ) ) ( not ( = ?auto_200755 ?auto_200757 ) ) ( not ( = ?auto_200754 ?auto_200757 ) ) ( ON ?auto_200754 ?auto_200755 ) ( ON-TABLE ?auto_200758 ) ( not ( = ?auto_200758 ?auto_200756 ) ) ( not ( = ?auto_200758 ?auto_200757 ) ) ( not ( = ?auto_200756 ?auto_200757 ) ) ( not ( = ?auto_200750 ?auto_200756 ) ) ( not ( = ?auto_200750 ?auto_200758 ) ) ( not ( = ?auto_200751 ?auto_200756 ) ) ( not ( = ?auto_200751 ?auto_200758 ) ) ( not ( = ?auto_200752 ?auto_200756 ) ) ( not ( = ?auto_200752 ?auto_200758 ) ) ( not ( = ?auto_200753 ?auto_200756 ) ) ( not ( = ?auto_200753 ?auto_200758 ) ) ( not ( = ?auto_200755 ?auto_200756 ) ) ( not ( = ?auto_200755 ?auto_200758 ) ) ( not ( = ?auto_200754 ?auto_200756 ) ) ( not ( = ?auto_200754 ?auto_200758 ) ) ( ON ?auto_200757 ?auto_200754 ) ( CLEAR ?auto_200757 ) ( HOLDING ?auto_200756 ) ( CLEAR ?auto_200758 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_200758 ?auto_200756 )
      ( MAKE-4PILE ?auto_200750 ?auto_200751 ?auto_200752 ?auto_200753 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_200759 - BLOCK
      ?auto_200760 - BLOCK
      ?auto_200761 - BLOCK
      ?auto_200762 - BLOCK
    )
    :vars
    (
      ?auto_200763 - BLOCK
      ?auto_200766 - BLOCK
      ?auto_200767 - BLOCK
      ?auto_200765 - BLOCK
      ?auto_200764 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_200763 ?auto_200762 ) ( ON-TABLE ?auto_200759 ) ( ON ?auto_200760 ?auto_200759 ) ( ON ?auto_200761 ?auto_200760 ) ( ON ?auto_200762 ?auto_200761 ) ( not ( = ?auto_200759 ?auto_200760 ) ) ( not ( = ?auto_200759 ?auto_200761 ) ) ( not ( = ?auto_200759 ?auto_200762 ) ) ( not ( = ?auto_200759 ?auto_200763 ) ) ( not ( = ?auto_200760 ?auto_200761 ) ) ( not ( = ?auto_200760 ?auto_200762 ) ) ( not ( = ?auto_200760 ?auto_200763 ) ) ( not ( = ?auto_200761 ?auto_200762 ) ) ( not ( = ?auto_200761 ?auto_200763 ) ) ( not ( = ?auto_200762 ?auto_200763 ) ) ( not ( = ?auto_200759 ?auto_200766 ) ) ( not ( = ?auto_200759 ?auto_200767 ) ) ( not ( = ?auto_200760 ?auto_200766 ) ) ( not ( = ?auto_200760 ?auto_200767 ) ) ( not ( = ?auto_200761 ?auto_200766 ) ) ( not ( = ?auto_200761 ?auto_200767 ) ) ( not ( = ?auto_200762 ?auto_200766 ) ) ( not ( = ?auto_200762 ?auto_200767 ) ) ( not ( = ?auto_200763 ?auto_200766 ) ) ( not ( = ?auto_200763 ?auto_200767 ) ) ( not ( = ?auto_200766 ?auto_200767 ) ) ( ON ?auto_200766 ?auto_200763 ) ( ON-TABLE ?auto_200765 ) ( not ( = ?auto_200765 ?auto_200764 ) ) ( not ( = ?auto_200765 ?auto_200767 ) ) ( not ( = ?auto_200764 ?auto_200767 ) ) ( not ( = ?auto_200759 ?auto_200764 ) ) ( not ( = ?auto_200759 ?auto_200765 ) ) ( not ( = ?auto_200760 ?auto_200764 ) ) ( not ( = ?auto_200760 ?auto_200765 ) ) ( not ( = ?auto_200761 ?auto_200764 ) ) ( not ( = ?auto_200761 ?auto_200765 ) ) ( not ( = ?auto_200762 ?auto_200764 ) ) ( not ( = ?auto_200762 ?auto_200765 ) ) ( not ( = ?auto_200763 ?auto_200764 ) ) ( not ( = ?auto_200763 ?auto_200765 ) ) ( not ( = ?auto_200766 ?auto_200764 ) ) ( not ( = ?auto_200766 ?auto_200765 ) ) ( ON ?auto_200767 ?auto_200766 ) ( CLEAR ?auto_200765 ) ( ON ?auto_200764 ?auto_200767 ) ( CLEAR ?auto_200764 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_200759 ?auto_200760 ?auto_200761 ?auto_200762 ?auto_200763 ?auto_200766 ?auto_200767 )
      ( MAKE-4PILE ?auto_200759 ?auto_200760 ?auto_200761 ?auto_200762 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_200768 - BLOCK
      ?auto_200769 - BLOCK
      ?auto_200770 - BLOCK
      ?auto_200771 - BLOCK
    )
    :vars
    (
      ?auto_200773 - BLOCK
      ?auto_200775 - BLOCK
      ?auto_200774 - BLOCK
      ?auto_200776 - BLOCK
      ?auto_200772 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_200773 ?auto_200771 ) ( ON-TABLE ?auto_200768 ) ( ON ?auto_200769 ?auto_200768 ) ( ON ?auto_200770 ?auto_200769 ) ( ON ?auto_200771 ?auto_200770 ) ( not ( = ?auto_200768 ?auto_200769 ) ) ( not ( = ?auto_200768 ?auto_200770 ) ) ( not ( = ?auto_200768 ?auto_200771 ) ) ( not ( = ?auto_200768 ?auto_200773 ) ) ( not ( = ?auto_200769 ?auto_200770 ) ) ( not ( = ?auto_200769 ?auto_200771 ) ) ( not ( = ?auto_200769 ?auto_200773 ) ) ( not ( = ?auto_200770 ?auto_200771 ) ) ( not ( = ?auto_200770 ?auto_200773 ) ) ( not ( = ?auto_200771 ?auto_200773 ) ) ( not ( = ?auto_200768 ?auto_200775 ) ) ( not ( = ?auto_200768 ?auto_200774 ) ) ( not ( = ?auto_200769 ?auto_200775 ) ) ( not ( = ?auto_200769 ?auto_200774 ) ) ( not ( = ?auto_200770 ?auto_200775 ) ) ( not ( = ?auto_200770 ?auto_200774 ) ) ( not ( = ?auto_200771 ?auto_200775 ) ) ( not ( = ?auto_200771 ?auto_200774 ) ) ( not ( = ?auto_200773 ?auto_200775 ) ) ( not ( = ?auto_200773 ?auto_200774 ) ) ( not ( = ?auto_200775 ?auto_200774 ) ) ( ON ?auto_200775 ?auto_200773 ) ( not ( = ?auto_200776 ?auto_200772 ) ) ( not ( = ?auto_200776 ?auto_200774 ) ) ( not ( = ?auto_200772 ?auto_200774 ) ) ( not ( = ?auto_200768 ?auto_200772 ) ) ( not ( = ?auto_200768 ?auto_200776 ) ) ( not ( = ?auto_200769 ?auto_200772 ) ) ( not ( = ?auto_200769 ?auto_200776 ) ) ( not ( = ?auto_200770 ?auto_200772 ) ) ( not ( = ?auto_200770 ?auto_200776 ) ) ( not ( = ?auto_200771 ?auto_200772 ) ) ( not ( = ?auto_200771 ?auto_200776 ) ) ( not ( = ?auto_200773 ?auto_200772 ) ) ( not ( = ?auto_200773 ?auto_200776 ) ) ( not ( = ?auto_200775 ?auto_200772 ) ) ( not ( = ?auto_200775 ?auto_200776 ) ) ( ON ?auto_200774 ?auto_200775 ) ( ON ?auto_200772 ?auto_200774 ) ( CLEAR ?auto_200772 ) ( HOLDING ?auto_200776 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_200776 )
      ( MAKE-4PILE ?auto_200768 ?auto_200769 ?auto_200770 ?auto_200771 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_200777 - BLOCK
      ?auto_200778 - BLOCK
      ?auto_200779 - BLOCK
      ?auto_200780 - BLOCK
    )
    :vars
    (
      ?auto_200784 - BLOCK
      ?auto_200781 - BLOCK
      ?auto_200782 - BLOCK
      ?auto_200783 - BLOCK
      ?auto_200785 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_200784 ?auto_200780 ) ( ON-TABLE ?auto_200777 ) ( ON ?auto_200778 ?auto_200777 ) ( ON ?auto_200779 ?auto_200778 ) ( ON ?auto_200780 ?auto_200779 ) ( not ( = ?auto_200777 ?auto_200778 ) ) ( not ( = ?auto_200777 ?auto_200779 ) ) ( not ( = ?auto_200777 ?auto_200780 ) ) ( not ( = ?auto_200777 ?auto_200784 ) ) ( not ( = ?auto_200778 ?auto_200779 ) ) ( not ( = ?auto_200778 ?auto_200780 ) ) ( not ( = ?auto_200778 ?auto_200784 ) ) ( not ( = ?auto_200779 ?auto_200780 ) ) ( not ( = ?auto_200779 ?auto_200784 ) ) ( not ( = ?auto_200780 ?auto_200784 ) ) ( not ( = ?auto_200777 ?auto_200781 ) ) ( not ( = ?auto_200777 ?auto_200782 ) ) ( not ( = ?auto_200778 ?auto_200781 ) ) ( not ( = ?auto_200778 ?auto_200782 ) ) ( not ( = ?auto_200779 ?auto_200781 ) ) ( not ( = ?auto_200779 ?auto_200782 ) ) ( not ( = ?auto_200780 ?auto_200781 ) ) ( not ( = ?auto_200780 ?auto_200782 ) ) ( not ( = ?auto_200784 ?auto_200781 ) ) ( not ( = ?auto_200784 ?auto_200782 ) ) ( not ( = ?auto_200781 ?auto_200782 ) ) ( ON ?auto_200781 ?auto_200784 ) ( not ( = ?auto_200783 ?auto_200785 ) ) ( not ( = ?auto_200783 ?auto_200782 ) ) ( not ( = ?auto_200785 ?auto_200782 ) ) ( not ( = ?auto_200777 ?auto_200785 ) ) ( not ( = ?auto_200777 ?auto_200783 ) ) ( not ( = ?auto_200778 ?auto_200785 ) ) ( not ( = ?auto_200778 ?auto_200783 ) ) ( not ( = ?auto_200779 ?auto_200785 ) ) ( not ( = ?auto_200779 ?auto_200783 ) ) ( not ( = ?auto_200780 ?auto_200785 ) ) ( not ( = ?auto_200780 ?auto_200783 ) ) ( not ( = ?auto_200784 ?auto_200785 ) ) ( not ( = ?auto_200784 ?auto_200783 ) ) ( not ( = ?auto_200781 ?auto_200785 ) ) ( not ( = ?auto_200781 ?auto_200783 ) ) ( ON ?auto_200782 ?auto_200781 ) ( ON ?auto_200785 ?auto_200782 ) ( ON ?auto_200783 ?auto_200785 ) ( CLEAR ?auto_200783 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_200777 ?auto_200778 ?auto_200779 ?auto_200780 ?auto_200784 ?auto_200781 ?auto_200782 ?auto_200785 )
      ( MAKE-4PILE ?auto_200777 ?auto_200778 ?auto_200779 ?auto_200780 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_200791 - BLOCK
      ?auto_200792 - BLOCK
      ?auto_200793 - BLOCK
      ?auto_200794 - BLOCK
      ?auto_200795 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_200795 ) ( CLEAR ?auto_200794 ) ( ON-TABLE ?auto_200791 ) ( ON ?auto_200792 ?auto_200791 ) ( ON ?auto_200793 ?auto_200792 ) ( ON ?auto_200794 ?auto_200793 ) ( not ( = ?auto_200791 ?auto_200792 ) ) ( not ( = ?auto_200791 ?auto_200793 ) ) ( not ( = ?auto_200791 ?auto_200794 ) ) ( not ( = ?auto_200791 ?auto_200795 ) ) ( not ( = ?auto_200792 ?auto_200793 ) ) ( not ( = ?auto_200792 ?auto_200794 ) ) ( not ( = ?auto_200792 ?auto_200795 ) ) ( not ( = ?auto_200793 ?auto_200794 ) ) ( not ( = ?auto_200793 ?auto_200795 ) ) ( not ( = ?auto_200794 ?auto_200795 ) ) )
    :subtasks
    ( ( !STACK ?auto_200795 ?auto_200794 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_200796 - BLOCK
      ?auto_200797 - BLOCK
      ?auto_200798 - BLOCK
      ?auto_200799 - BLOCK
      ?auto_200800 - BLOCK
    )
    :vars
    (
      ?auto_200801 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_200799 ) ( ON-TABLE ?auto_200796 ) ( ON ?auto_200797 ?auto_200796 ) ( ON ?auto_200798 ?auto_200797 ) ( ON ?auto_200799 ?auto_200798 ) ( not ( = ?auto_200796 ?auto_200797 ) ) ( not ( = ?auto_200796 ?auto_200798 ) ) ( not ( = ?auto_200796 ?auto_200799 ) ) ( not ( = ?auto_200796 ?auto_200800 ) ) ( not ( = ?auto_200797 ?auto_200798 ) ) ( not ( = ?auto_200797 ?auto_200799 ) ) ( not ( = ?auto_200797 ?auto_200800 ) ) ( not ( = ?auto_200798 ?auto_200799 ) ) ( not ( = ?auto_200798 ?auto_200800 ) ) ( not ( = ?auto_200799 ?auto_200800 ) ) ( ON ?auto_200800 ?auto_200801 ) ( CLEAR ?auto_200800 ) ( HAND-EMPTY ) ( not ( = ?auto_200796 ?auto_200801 ) ) ( not ( = ?auto_200797 ?auto_200801 ) ) ( not ( = ?auto_200798 ?auto_200801 ) ) ( not ( = ?auto_200799 ?auto_200801 ) ) ( not ( = ?auto_200800 ?auto_200801 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_200800 ?auto_200801 )
      ( MAKE-5PILE ?auto_200796 ?auto_200797 ?auto_200798 ?auto_200799 ?auto_200800 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_200802 - BLOCK
      ?auto_200803 - BLOCK
      ?auto_200804 - BLOCK
      ?auto_200805 - BLOCK
      ?auto_200806 - BLOCK
    )
    :vars
    (
      ?auto_200807 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_200802 ) ( ON ?auto_200803 ?auto_200802 ) ( ON ?auto_200804 ?auto_200803 ) ( not ( = ?auto_200802 ?auto_200803 ) ) ( not ( = ?auto_200802 ?auto_200804 ) ) ( not ( = ?auto_200802 ?auto_200805 ) ) ( not ( = ?auto_200802 ?auto_200806 ) ) ( not ( = ?auto_200803 ?auto_200804 ) ) ( not ( = ?auto_200803 ?auto_200805 ) ) ( not ( = ?auto_200803 ?auto_200806 ) ) ( not ( = ?auto_200804 ?auto_200805 ) ) ( not ( = ?auto_200804 ?auto_200806 ) ) ( not ( = ?auto_200805 ?auto_200806 ) ) ( ON ?auto_200806 ?auto_200807 ) ( CLEAR ?auto_200806 ) ( not ( = ?auto_200802 ?auto_200807 ) ) ( not ( = ?auto_200803 ?auto_200807 ) ) ( not ( = ?auto_200804 ?auto_200807 ) ) ( not ( = ?auto_200805 ?auto_200807 ) ) ( not ( = ?auto_200806 ?auto_200807 ) ) ( HOLDING ?auto_200805 ) ( CLEAR ?auto_200804 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_200802 ?auto_200803 ?auto_200804 ?auto_200805 )
      ( MAKE-5PILE ?auto_200802 ?auto_200803 ?auto_200804 ?auto_200805 ?auto_200806 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_200808 - BLOCK
      ?auto_200809 - BLOCK
      ?auto_200810 - BLOCK
      ?auto_200811 - BLOCK
      ?auto_200812 - BLOCK
    )
    :vars
    (
      ?auto_200813 - BLOCK
      ?auto_200816 - BLOCK
      ?auto_200814 - BLOCK
      ?auto_200815 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_200808 ) ( ON ?auto_200809 ?auto_200808 ) ( ON ?auto_200810 ?auto_200809 ) ( not ( = ?auto_200808 ?auto_200809 ) ) ( not ( = ?auto_200808 ?auto_200810 ) ) ( not ( = ?auto_200808 ?auto_200811 ) ) ( not ( = ?auto_200808 ?auto_200812 ) ) ( not ( = ?auto_200809 ?auto_200810 ) ) ( not ( = ?auto_200809 ?auto_200811 ) ) ( not ( = ?auto_200809 ?auto_200812 ) ) ( not ( = ?auto_200810 ?auto_200811 ) ) ( not ( = ?auto_200810 ?auto_200812 ) ) ( not ( = ?auto_200811 ?auto_200812 ) ) ( ON ?auto_200812 ?auto_200813 ) ( not ( = ?auto_200808 ?auto_200813 ) ) ( not ( = ?auto_200809 ?auto_200813 ) ) ( not ( = ?auto_200810 ?auto_200813 ) ) ( not ( = ?auto_200811 ?auto_200813 ) ) ( not ( = ?auto_200812 ?auto_200813 ) ) ( CLEAR ?auto_200810 ) ( ON ?auto_200811 ?auto_200812 ) ( CLEAR ?auto_200811 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_200816 ) ( ON ?auto_200814 ?auto_200816 ) ( ON ?auto_200815 ?auto_200814 ) ( ON ?auto_200813 ?auto_200815 ) ( not ( = ?auto_200816 ?auto_200814 ) ) ( not ( = ?auto_200816 ?auto_200815 ) ) ( not ( = ?auto_200816 ?auto_200813 ) ) ( not ( = ?auto_200816 ?auto_200812 ) ) ( not ( = ?auto_200816 ?auto_200811 ) ) ( not ( = ?auto_200814 ?auto_200815 ) ) ( not ( = ?auto_200814 ?auto_200813 ) ) ( not ( = ?auto_200814 ?auto_200812 ) ) ( not ( = ?auto_200814 ?auto_200811 ) ) ( not ( = ?auto_200815 ?auto_200813 ) ) ( not ( = ?auto_200815 ?auto_200812 ) ) ( not ( = ?auto_200815 ?auto_200811 ) ) ( not ( = ?auto_200808 ?auto_200816 ) ) ( not ( = ?auto_200808 ?auto_200814 ) ) ( not ( = ?auto_200808 ?auto_200815 ) ) ( not ( = ?auto_200809 ?auto_200816 ) ) ( not ( = ?auto_200809 ?auto_200814 ) ) ( not ( = ?auto_200809 ?auto_200815 ) ) ( not ( = ?auto_200810 ?auto_200816 ) ) ( not ( = ?auto_200810 ?auto_200814 ) ) ( not ( = ?auto_200810 ?auto_200815 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_200816 ?auto_200814 ?auto_200815 ?auto_200813 ?auto_200812 )
      ( MAKE-5PILE ?auto_200808 ?auto_200809 ?auto_200810 ?auto_200811 ?auto_200812 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_200817 - BLOCK
      ?auto_200818 - BLOCK
      ?auto_200819 - BLOCK
      ?auto_200820 - BLOCK
      ?auto_200821 - BLOCK
    )
    :vars
    (
      ?auto_200824 - BLOCK
      ?auto_200825 - BLOCK
      ?auto_200822 - BLOCK
      ?auto_200823 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_200817 ) ( ON ?auto_200818 ?auto_200817 ) ( not ( = ?auto_200817 ?auto_200818 ) ) ( not ( = ?auto_200817 ?auto_200819 ) ) ( not ( = ?auto_200817 ?auto_200820 ) ) ( not ( = ?auto_200817 ?auto_200821 ) ) ( not ( = ?auto_200818 ?auto_200819 ) ) ( not ( = ?auto_200818 ?auto_200820 ) ) ( not ( = ?auto_200818 ?auto_200821 ) ) ( not ( = ?auto_200819 ?auto_200820 ) ) ( not ( = ?auto_200819 ?auto_200821 ) ) ( not ( = ?auto_200820 ?auto_200821 ) ) ( ON ?auto_200821 ?auto_200824 ) ( not ( = ?auto_200817 ?auto_200824 ) ) ( not ( = ?auto_200818 ?auto_200824 ) ) ( not ( = ?auto_200819 ?auto_200824 ) ) ( not ( = ?auto_200820 ?auto_200824 ) ) ( not ( = ?auto_200821 ?auto_200824 ) ) ( ON ?auto_200820 ?auto_200821 ) ( CLEAR ?auto_200820 ) ( ON-TABLE ?auto_200825 ) ( ON ?auto_200822 ?auto_200825 ) ( ON ?auto_200823 ?auto_200822 ) ( ON ?auto_200824 ?auto_200823 ) ( not ( = ?auto_200825 ?auto_200822 ) ) ( not ( = ?auto_200825 ?auto_200823 ) ) ( not ( = ?auto_200825 ?auto_200824 ) ) ( not ( = ?auto_200825 ?auto_200821 ) ) ( not ( = ?auto_200825 ?auto_200820 ) ) ( not ( = ?auto_200822 ?auto_200823 ) ) ( not ( = ?auto_200822 ?auto_200824 ) ) ( not ( = ?auto_200822 ?auto_200821 ) ) ( not ( = ?auto_200822 ?auto_200820 ) ) ( not ( = ?auto_200823 ?auto_200824 ) ) ( not ( = ?auto_200823 ?auto_200821 ) ) ( not ( = ?auto_200823 ?auto_200820 ) ) ( not ( = ?auto_200817 ?auto_200825 ) ) ( not ( = ?auto_200817 ?auto_200822 ) ) ( not ( = ?auto_200817 ?auto_200823 ) ) ( not ( = ?auto_200818 ?auto_200825 ) ) ( not ( = ?auto_200818 ?auto_200822 ) ) ( not ( = ?auto_200818 ?auto_200823 ) ) ( not ( = ?auto_200819 ?auto_200825 ) ) ( not ( = ?auto_200819 ?auto_200822 ) ) ( not ( = ?auto_200819 ?auto_200823 ) ) ( HOLDING ?auto_200819 ) ( CLEAR ?auto_200818 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_200817 ?auto_200818 ?auto_200819 )
      ( MAKE-5PILE ?auto_200817 ?auto_200818 ?auto_200819 ?auto_200820 ?auto_200821 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_200826 - BLOCK
      ?auto_200827 - BLOCK
      ?auto_200828 - BLOCK
      ?auto_200829 - BLOCK
      ?auto_200830 - BLOCK
    )
    :vars
    (
      ?auto_200834 - BLOCK
      ?auto_200831 - BLOCK
      ?auto_200832 - BLOCK
      ?auto_200833 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_200826 ) ( ON ?auto_200827 ?auto_200826 ) ( not ( = ?auto_200826 ?auto_200827 ) ) ( not ( = ?auto_200826 ?auto_200828 ) ) ( not ( = ?auto_200826 ?auto_200829 ) ) ( not ( = ?auto_200826 ?auto_200830 ) ) ( not ( = ?auto_200827 ?auto_200828 ) ) ( not ( = ?auto_200827 ?auto_200829 ) ) ( not ( = ?auto_200827 ?auto_200830 ) ) ( not ( = ?auto_200828 ?auto_200829 ) ) ( not ( = ?auto_200828 ?auto_200830 ) ) ( not ( = ?auto_200829 ?auto_200830 ) ) ( ON ?auto_200830 ?auto_200834 ) ( not ( = ?auto_200826 ?auto_200834 ) ) ( not ( = ?auto_200827 ?auto_200834 ) ) ( not ( = ?auto_200828 ?auto_200834 ) ) ( not ( = ?auto_200829 ?auto_200834 ) ) ( not ( = ?auto_200830 ?auto_200834 ) ) ( ON ?auto_200829 ?auto_200830 ) ( ON-TABLE ?auto_200831 ) ( ON ?auto_200832 ?auto_200831 ) ( ON ?auto_200833 ?auto_200832 ) ( ON ?auto_200834 ?auto_200833 ) ( not ( = ?auto_200831 ?auto_200832 ) ) ( not ( = ?auto_200831 ?auto_200833 ) ) ( not ( = ?auto_200831 ?auto_200834 ) ) ( not ( = ?auto_200831 ?auto_200830 ) ) ( not ( = ?auto_200831 ?auto_200829 ) ) ( not ( = ?auto_200832 ?auto_200833 ) ) ( not ( = ?auto_200832 ?auto_200834 ) ) ( not ( = ?auto_200832 ?auto_200830 ) ) ( not ( = ?auto_200832 ?auto_200829 ) ) ( not ( = ?auto_200833 ?auto_200834 ) ) ( not ( = ?auto_200833 ?auto_200830 ) ) ( not ( = ?auto_200833 ?auto_200829 ) ) ( not ( = ?auto_200826 ?auto_200831 ) ) ( not ( = ?auto_200826 ?auto_200832 ) ) ( not ( = ?auto_200826 ?auto_200833 ) ) ( not ( = ?auto_200827 ?auto_200831 ) ) ( not ( = ?auto_200827 ?auto_200832 ) ) ( not ( = ?auto_200827 ?auto_200833 ) ) ( not ( = ?auto_200828 ?auto_200831 ) ) ( not ( = ?auto_200828 ?auto_200832 ) ) ( not ( = ?auto_200828 ?auto_200833 ) ) ( CLEAR ?auto_200827 ) ( ON ?auto_200828 ?auto_200829 ) ( CLEAR ?auto_200828 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_200831 ?auto_200832 ?auto_200833 ?auto_200834 ?auto_200830 ?auto_200829 )
      ( MAKE-5PILE ?auto_200826 ?auto_200827 ?auto_200828 ?auto_200829 ?auto_200830 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_200835 - BLOCK
      ?auto_200836 - BLOCK
      ?auto_200837 - BLOCK
      ?auto_200838 - BLOCK
      ?auto_200839 - BLOCK
    )
    :vars
    (
      ?auto_200843 - BLOCK
      ?auto_200842 - BLOCK
      ?auto_200840 - BLOCK
      ?auto_200841 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_200835 ) ( not ( = ?auto_200835 ?auto_200836 ) ) ( not ( = ?auto_200835 ?auto_200837 ) ) ( not ( = ?auto_200835 ?auto_200838 ) ) ( not ( = ?auto_200835 ?auto_200839 ) ) ( not ( = ?auto_200836 ?auto_200837 ) ) ( not ( = ?auto_200836 ?auto_200838 ) ) ( not ( = ?auto_200836 ?auto_200839 ) ) ( not ( = ?auto_200837 ?auto_200838 ) ) ( not ( = ?auto_200837 ?auto_200839 ) ) ( not ( = ?auto_200838 ?auto_200839 ) ) ( ON ?auto_200839 ?auto_200843 ) ( not ( = ?auto_200835 ?auto_200843 ) ) ( not ( = ?auto_200836 ?auto_200843 ) ) ( not ( = ?auto_200837 ?auto_200843 ) ) ( not ( = ?auto_200838 ?auto_200843 ) ) ( not ( = ?auto_200839 ?auto_200843 ) ) ( ON ?auto_200838 ?auto_200839 ) ( ON-TABLE ?auto_200842 ) ( ON ?auto_200840 ?auto_200842 ) ( ON ?auto_200841 ?auto_200840 ) ( ON ?auto_200843 ?auto_200841 ) ( not ( = ?auto_200842 ?auto_200840 ) ) ( not ( = ?auto_200842 ?auto_200841 ) ) ( not ( = ?auto_200842 ?auto_200843 ) ) ( not ( = ?auto_200842 ?auto_200839 ) ) ( not ( = ?auto_200842 ?auto_200838 ) ) ( not ( = ?auto_200840 ?auto_200841 ) ) ( not ( = ?auto_200840 ?auto_200843 ) ) ( not ( = ?auto_200840 ?auto_200839 ) ) ( not ( = ?auto_200840 ?auto_200838 ) ) ( not ( = ?auto_200841 ?auto_200843 ) ) ( not ( = ?auto_200841 ?auto_200839 ) ) ( not ( = ?auto_200841 ?auto_200838 ) ) ( not ( = ?auto_200835 ?auto_200842 ) ) ( not ( = ?auto_200835 ?auto_200840 ) ) ( not ( = ?auto_200835 ?auto_200841 ) ) ( not ( = ?auto_200836 ?auto_200842 ) ) ( not ( = ?auto_200836 ?auto_200840 ) ) ( not ( = ?auto_200836 ?auto_200841 ) ) ( not ( = ?auto_200837 ?auto_200842 ) ) ( not ( = ?auto_200837 ?auto_200840 ) ) ( not ( = ?auto_200837 ?auto_200841 ) ) ( ON ?auto_200837 ?auto_200838 ) ( CLEAR ?auto_200837 ) ( HOLDING ?auto_200836 ) ( CLEAR ?auto_200835 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_200835 ?auto_200836 )
      ( MAKE-5PILE ?auto_200835 ?auto_200836 ?auto_200837 ?auto_200838 ?auto_200839 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_200844 - BLOCK
      ?auto_200845 - BLOCK
      ?auto_200846 - BLOCK
      ?auto_200847 - BLOCK
      ?auto_200848 - BLOCK
    )
    :vars
    (
      ?auto_200850 - BLOCK
      ?auto_200851 - BLOCK
      ?auto_200852 - BLOCK
      ?auto_200849 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_200844 ) ( not ( = ?auto_200844 ?auto_200845 ) ) ( not ( = ?auto_200844 ?auto_200846 ) ) ( not ( = ?auto_200844 ?auto_200847 ) ) ( not ( = ?auto_200844 ?auto_200848 ) ) ( not ( = ?auto_200845 ?auto_200846 ) ) ( not ( = ?auto_200845 ?auto_200847 ) ) ( not ( = ?auto_200845 ?auto_200848 ) ) ( not ( = ?auto_200846 ?auto_200847 ) ) ( not ( = ?auto_200846 ?auto_200848 ) ) ( not ( = ?auto_200847 ?auto_200848 ) ) ( ON ?auto_200848 ?auto_200850 ) ( not ( = ?auto_200844 ?auto_200850 ) ) ( not ( = ?auto_200845 ?auto_200850 ) ) ( not ( = ?auto_200846 ?auto_200850 ) ) ( not ( = ?auto_200847 ?auto_200850 ) ) ( not ( = ?auto_200848 ?auto_200850 ) ) ( ON ?auto_200847 ?auto_200848 ) ( ON-TABLE ?auto_200851 ) ( ON ?auto_200852 ?auto_200851 ) ( ON ?auto_200849 ?auto_200852 ) ( ON ?auto_200850 ?auto_200849 ) ( not ( = ?auto_200851 ?auto_200852 ) ) ( not ( = ?auto_200851 ?auto_200849 ) ) ( not ( = ?auto_200851 ?auto_200850 ) ) ( not ( = ?auto_200851 ?auto_200848 ) ) ( not ( = ?auto_200851 ?auto_200847 ) ) ( not ( = ?auto_200852 ?auto_200849 ) ) ( not ( = ?auto_200852 ?auto_200850 ) ) ( not ( = ?auto_200852 ?auto_200848 ) ) ( not ( = ?auto_200852 ?auto_200847 ) ) ( not ( = ?auto_200849 ?auto_200850 ) ) ( not ( = ?auto_200849 ?auto_200848 ) ) ( not ( = ?auto_200849 ?auto_200847 ) ) ( not ( = ?auto_200844 ?auto_200851 ) ) ( not ( = ?auto_200844 ?auto_200852 ) ) ( not ( = ?auto_200844 ?auto_200849 ) ) ( not ( = ?auto_200845 ?auto_200851 ) ) ( not ( = ?auto_200845 ?auto_200852 ) ) ( not ( = ?auto_200845 ?auto_200849 ) ) ( not ( = ?auto_200846 ?auto_200851 ) ) ( not ( = ?auto_200846 ?auto_200852 ) ) ( not ( = ?auto_200846 ?auto_200849 ) ) ( ON ?auto_200846 ?auto_200847 ) ( CLEAR ?auto_200844 ) ( ON ?auto_200845 ?auto_200846 ) ( CLEAR ?auto_200845 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_200851 ?auto_200852 ?auto_200849 ?auto_200850 ?auto_200848 ?auto_200847 ?auto_200846 )
      ( MAKE-5PILE ?auto_200844 ?auto_200845 ?auto_200846 ?auto_200847 ?auto_200848 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_200853 - BLOCK
      ?auto_200854 - BLOCK
      ?auto_200855 - BLOCK
      ?auto_200856 - BLOCK
      ?auto_200857 - BLOCK
    )
    :vars
    (
      ?auto_200861 - BLOCK
      ?auto_200858 - BLOCK
      ?auto_200859 - BLOCK
      ?auto_200860 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_200853 ?auto_200854 ) ) ( not ( = ?auto_200853 ?auto_200855 ) ) ( not ( = ?auto_200853 ?auto_200856 ) ) ( not ( = ?auto_200853 ?auto_200857 ) ) ( not ( = ?auto_200854 ?auto_200855 ) ) ( not ( = ?auto_200854 ?auto_200856 ) ) ( not ( = ?auto_200854 ?auto_200857 ) ) ( not ( = ?auto_200855 ?auto_200856 ) ) ( not ( = ?auto_200855 ?auto_200857 ) ) ( not ( = ?auto_200856 ?auto_200857 ) ) ( ON ?auto_200857 ?auto_200861 ) ( not ( = ?auto_200853 ?auto_200861 ) ) ( not ( = ?auto_200854 ?auto_200861 ) ) ( not ( = ?auto_200855 ?auto_200861 ) ) ( not ( = ?auto_200856 ?auto_200861 ) ) ( not ( = ?auto_200857 ?auto_200861 ) ) ( ON ?auto_200856 ?auto_200857 ) ( ON-TABLE ?auto_200858 ) ( ON ?auto_200859 ?auto_200858 ) ( ON ?auto_200860 ?auto_200859 ) ( ON ?auto_200861 ?auto_200860 ) ( not ( = ?auto_200858 ?auto_200859 ) ) ( not ( = ?auto_200858 ?auto_200860 ) ) ( not ( = ?auto_200858 ?auto_200861 ) ) ( not ( = ?auto_200858 ?auto_200857 ) ) ( not ( = ?auto_200858 ?auto_200856 ) ) ( not ( = ?auto_200859 ?auto_200860 ) ) ( not ( = ?auto_200859 ?auto_200861 ) ) ( not ( = ?auto_200859 ?auto_200857 ) ) ( not ( = ?auto_200859 ?auto_200856 ) ) ( not ( = ?auto_200860 ?auto_200861 ) ) ( not ( = ?auto_200860 ?auto_200857 ) ) ( not ( = ?auto_200860 ?auto_200856 ) ) ( not ( = ?auto_200853 ?auto_200858 ) ) ( not ( = ?auto_200853 ?auto_200859 ) ) ( not ( = ?auto_200853 ?auto_200860 ) ) ( not ( = ?auto_200854 ?auto_200858 ) ) ( not ( = ?auto_200854 ?auto_200859 ) ) ( not ( = ?auto_200854 ?auto_200860 ) ) ( not ( = ?auto_200855 ?auto_200858 ) ) ( not ( = ?auto_200855 ?auto_200859 ) ) ( not ( = ?auto_200855 ?auto_200860 ) ) ( ON ?auto_200855 ?auto_200856 ) ( ON ?auto_200854 ?auto_200855 ) ( CLEAR ?auto_200854 ) ( HOLDING ?auto_200853 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_200853 )
      ( MAKE-5PILE ?auto_200853 ?auto_200854 ?auto_200855 ?auto_200856 ?auto_200857 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_200862 - BLOCK
      ?auto_200863 - BLOCK
      ?auto_200864 - BLOCK
      ?auto_200865 - BLOCK
      ?auto_200866 - BLOCK
    )
    :vars
    (
      ?auto_200868 - BLOCK
      ?auto_200869 - BLOCK
      ?auto_200867 - BLOCK
      ?auto_200870 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_200862 ?auto_200863 ) ) ( not ( = ?auto_200862 ?auto_200864 ) ) ( not ( = ?auto_200862 ?auto_200865 ) ) ( not ( = ?auto_200862 ?auto_200866 ) ) ( not ( = ?auto_200863 ?auto_200864 ) ) ( not ( = ?auto_200863 ?auto_200865 ) ) ( not ( = ?auto_200863 ?auto_200866 ) ) ( not ( = ?auto_200864 ?auto_200865 ) ) ( not ( = ?auto_200864 ?auto_200866 ) ) ( not ( = ?auto_200865 ?auto_200866 ) ) ( ON ?auto_200866 ?auto_200868 ) ( not ( = ?auto_200862 ?auto_200868 ) ) ( not ( = ?auto_200863 ?auto_200868 ) ) ( not ( = ?auto_200864 ?auto_200868 ) ) ( not ( = ?auto_200865 ?auto_200868 ) ) ( not ( = ?auto_200866 ?auto_200868 ) ) ( ON ?auto_200865 ?auto_200866 ) ( ON-TABLE ?auto_200869 ) ( ON ?auto_200867 ?auto_200869 ) ( ON ?auto_200870 ?auto_200867 ) ( ON ?auto_200868 ?auto_200870 ) ( not ( = ?auto_200869 ?auto_200867 ) ) ( not ( = ?auto_200869 ?auto_200870 ) ) ( not ( = ?auto_200869 ?auto_200868 ) ) ( not ( = ?auto_200869 ?auto_200866 ) ) ( not ( = ?auto_200869 ?auto_200865 ) ) ( not ( = ?auto_200867 ?auto_200870 ) ) ( not ( = ?auto_200867 ?auto_200868 ) ) ( not ( = ?auto_200867 ?auto_200866 ) ) ( not ( = ?auto_200867 ?auto_200865 ) ) ( not ( = ?auto_200870 ?auto_200868 ) ) ( not ( = ?auto_200870 ?auto_200866 ) ) ( not ( = ?auto_200870 ?auto_200865 ) ) ( not ( = ?auto_200862 ?auto_200869 ) ) ( not ( = ?auto_200862 ?auto_200867 ) ) ( not ( = ?auto_200862 ?auto_200870 ) ) ( not ( = ?auto_200863 ?auto_200869 ) ) ( not ( = ?auto_200863 ?auto_200867 ) ) ( not ( = ?auto_200863 ?auto_200870 ) ) ( not ( = ?auto_200864 ?auto_200869 ) ) ( not ( = ?auto_200864 ?auto_200867 ) ) ( not ( = ?auto_200864 ?auto_200870 ) ) ( ON ?auto_200864 ?auto_200865 ) ( ON ?auto_200863 ?auto_200864 ) ( ON ?auto_200862 ?auto_200863 ) ( CLEAR ?auto_200862 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_200869 ?auto_200867 ?auto_200870 ?auto_200868 ?auto_200866 ?auto_200865 ?auto_200864 ?auto_200863 )
      ( MAKE-5PILE ?auto_200862 ?auto_200863 ?auto_200864 ?auto_200865 ?auto_200866 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_200874 - BLOCK
      ?auto_200875 - BLOCK
      ?auto_200876 - BLOCK
    )
    :vars
    (
      ?auto_200877 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_200877 ?auto_200876 ) ( CLEAR ?auto_200877 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_200874 ) ( ON ?auto_200875 ?auto_200874 ) ( ON ?auto_200876 ?auto_200875 ) ( not ( = ?auto_200874 ?auto_200875 ) ) ( not ( = ?auto_200874 ?auto_200876 ) ) ( not ( = ?auto_200874 ?auto_200877 ) ) ( not ( = ?auto_200875 ?auto_200876 ) ) ( not ( = ?auto_200875 ?auto_200877 ) ) ( not ( = ?auto_200876 ?auto_200877 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_200877 ?auto_200876 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_200878 - BLOCK
      ?auto_200879 - BLOCK
      ?auto_200880 - BLOCK
    )
    :vars
    (
      ?auto_200881 - BLOCK
      ?auto_200882 - BLOCK
      ?auto_200883 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_200881 ?auto_200880 ) ( CLEAR ?auto_200881 ) ( ON-TABLE ?auto_200878 ) ( ON ?auto_200879 ?auto_200878 ) ( ON ?auto_200880 ?auto_200879 ) ( not ( = ?auto_200878 ?auto_200879 ) ) ( not ( = ?auto_200878 ?auto_200880 ) ) ( not ( = ?auto_200878 ?auto_200881 ) ) ( not ( = ?auto_200879 ?auto_200880 ) ) ( not ( = ?auto_200879 ?auto_200881 ) ) ( not ( = ?auto_200880 ?auto_200881 ) ) ( HOLDING ?auto_200882 ) ( CLEAR ?auto_200883 ) ( not ( = ?auto_200878 ?auto_200882 ) ) ( not ( = ?auto_200878 ?auto_200883 ) ) ( not ( = ?auto_200879 ?auto_200882 ) ) ( not ( = ?auto_200879 ?auto_200883 ) ) ( not ( = ?auto_200880 ?auto_200882 ) ) ( not ( = ?auto_200880 ?auto_200883 ) ) ( not ( = ?auto_200881 ?auto_200882 ) ) ( not ( = ?auto_200881 ?auto_200883 ) ) ( not ( = ?auto_200882 ?auto_200883 ) ) )
    :subtasks
    ( ( !STACK ?auto_200882 ?auto_200883 )
      ( MAKE-3PILE ?auto_200878 ?auto_200879 ?auto_200880 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_200884 - BLOCK
      ?auto_200885 - BLOCK
      ?auto_200886 - BLOCK
    )
    :vars
    (
      ?auto_200888 - BLOCK
      ?auto_200887 - BLOCK
      ?auto_200889 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_200888 ?auto_200886 ) ( ON-TABLE ?auto_200884 ) ( ON ?auto_200885 ?auto_200884 ) ( ON ?auto_200886 ?auto_200885 ) ( not ( = ?auto_200884 ?auto_200885 ) ) ( not ( = ?auto_200884 ?auto_200886 ) ) ( not ( = ?auto_200884 ?auto_200888 ) ) ( not ( = ?auto_200885 ?auto_200886 ) ) ( not ( = ?auto_200885 ?auto_200888 ) ) ( not ( = ?auto_200886 ?auto_200888 ) ) ( CLEAR ?auto_200887 ) ( not ( = ?auto_200884 ?auto_200889 ) ) ( not ( = ?auto_200884 ?auto_200887 ) ) ( not ( = ?auto_200885 ?auto_200889 ) ) ( not ( = ?auto_200885 ?auto_200887 ) ) ( not ( = ?auto_200886 ?auto_200889 ) ) ( not ( = ?auto_200886 ?auto_200887 ) ) ( not ( = ?auto_200888 ?auto_200889 ) ) ( not ( = ?auto_200888 ?auto_200887 ) ) ( not ( = ?auto_200889 ?auto_200887 ) ) ( ON ?auto_200889 ?auto_200888 ) ( CLEAR ?auto_200889 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_200884 ?auto_200885 ?auto_200886 ?auto_200888 )
      ( MAKE-3PILE ?auto_200884 ?auto_200885 ?auto_200886 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_200890 - BLOCK
      ?auto_200891 - BLOCK
      ?auto_200892 - BLOCK
    )
    :vars
    (
      ?auto_200895 - BLOCK
      ?auto_200894 - BLOCK
      ?auto_200893 - BLOCK
      ?auto_200897 - BLOCK
      ?auto_200896 - BLOCK
      ?auto_200898 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_200895 ?auto_200892 ) ( ON-TABLE ?auto_200890 ) ( ON ?auto_200891 ?auto_200890 ) ( ON ?auto_200892 ?auto_200891 ) ( not ( = ?auto_200890 ?auto_200891 ) ) ( not ( = ?auto_200890 ?auto_200892 ) ) ( not ( = ?auto_200890 ?auto_200895 ) ) ( not ( = ?auto_200891 ?auto_200892 ) ) ( not ( = ?auto_200891 ?auto_200895 ) ) ( not ( = ?auto_200892 ?auto_200895 ) ) ( not ( = ?auto_200890 ?auto_200894 ) ) ( not ( = ?auto_200890 ?auto_200893 ) ) ( not ( = ?auto_200891 ?auto_200894 ) ) ( not ( = ?auto_200891 ?auto_200893 ) ) ( not ( = ?auto_200892 ?auto_200894 ) ) ( not ( = ?auto_200892 ?auto_200893 ) ) ( not ( = ?auto_200895 ?auto_200894 ) ) ( not ( = ?auto_200895 ?auto_200893 ) ) ( not ( = ?auto_200894 ?auto_200893 ) ) ( ON ?auto_200894 ?auto_200895 ) ( CLEAR ?auto_200894 ) ( HOLDING ?auto_200893 ) ( CLEAR ?auto_200897 ) ( ON-TABLE ?auto_200896 ) ( ON ?auto_200898 ?auto_200896 ) ( ON ?auto_200897 ?auto_200898 ) ( not ( = ?auto_200896 ?auto_200898 ) ) ( not ( = ?auto_200896 ?auto_200897 ) ) ( not ( = ?auto_200896 ?auto_200893 ) ) ( not ( = ?auto_200898 ?auto_200897 ) ) ( not ( = ?auto_200898 ?auto_200893 ) ) ( not ( = ?auto_200897 ?auto_200893 ) ) ( not ( = ?auto_200890 ?auto_200897 ) ) ( not ( = ?auto_200890 ?auto_200896 ) ) ( not ( = ?auto_200890 ?auto_200898 ) ) ( not ( = ?auto_200891 ?auto_200897 ) ) ( not ( = ?auto_200891 ?auto_200896 ) ) ( not ( = ?auto_200891 ?auto_200898 ) ) ( not ( = ?auto_200892 ?auto_200897 ) ) ( not ( = ?auto_200892 ?auto_200896 ) ) ( not ( = ?auto_200892 ?auto_200898 ) ) ( not ( = ?auto_200895 ?auto_200897 ) ) ( not ( = ?auto_200895 ?auto_200896 ) ) ( not ( = ?auto_200895 ?auto_200898 ) ) ( not ( = ?auto_200894 ?auto_200897 ) ) ( not ( = ?auto_200894 ?auto_200896 ) ) ( not ( = ?auto_200894 ?auto_200898 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_200896 ?auto_200898 ?auto_200897 ?auto_200893 )
      ( MAKE-3PILE ?auto_200890 ?auto_200891 ?auto_200892 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_200899 - BLOCK
      ?auto_200900 - BLOCK
      ?auto_200901 - BLOCK
    )
    :vars
    (
      ?auto_200905 - BLOCK
      ?auto_200903 - BLOCK
      ?auto_200902 - BLOCK
      ?auto_200906 - BLOCK
      ?auto_200904 - BLOCK
      ?auto_200907 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_200905 ?auto_200901 ) ( ON-TABLE ?auto_200899 ) ( ON ?auto_200900 ?auto_200899 ) ( ON ?auto_200901 ?auto_200900 ) ( not ( = ?auto_200899 ?auto_200900 ) ) ( not ( = ?auto_200899 ?auto_200901 ) ) ( not ( = ?auto_200899 ?auto_200905 ) ) ( not ( = ?auto_200900 ?auto_200901 ) ) ( not ( = ?auto_200900 ?auto_200905 ) ) ( not ( = ?auto_200901 ?auto_200905 ) ) ( not ( = ?auto_200899 ?auto_200903 ) ) ( not ( = ?auto_200899 ?auto_200902 ) ) ( not ( = ?auto_200900 ?auto_200903 ) ) ( not ( = ?auto_200900 ?auto_200902 ) ) ( not ( = ?auto_200901 ?auto_200903 ) ) ( not ( = ?auto_200901 ?auto_200902 ) ) ( not ( = ?auto_200905 ?auto_200903 ) ) ( not ( = ?auto_200905 ?auto_200902 ) ) ( not ( = ?auto_200903 ?auto_200902 ) ) ( ON ?auto_200903 ?auto_200905 ) ( CLEAR ?auto_200906 ) ( ON-TABLE ?auto_200904 ) ( ON ?auto_200907 ?auto_200904 ) ( ON ?auto_200906 ?auto_200907 ) ( not ( = ?auto_200904 ?auto_200907 ) ) ( not ( = ?auto_200904 ?auto_200906 ) ) ( not ( = ?auto_200904 ?auto_200902 ) ) ( not ( = ?auto_200907 ?auto_200906 ) ) ( not ( = ?auto_200907 ?auto_200902 ) ) ( not ( = ?auto_200906 ?auto_200902 ) ) ( not ( = ?auto_200899 ?auto_200906 ) ) ( not ( = ?auto_200899 ?auto_200904 ) ) ( not ( = ?auto_200899 ?auto_200907 ) ) ( not ( = ?auto_200900 ?auto_200906 ) ) ( not ( = ?auto_200900 ?auto_200904 ) ) ( not ( = ?auto_200900 ?auto_200907 ) ) ( not ( = ?auto_200901 ?auto_200906 ) ) ( not ( = ?auto_200901 ?auto_200904 ) ) ( not ( = ?auto_200901 ?auto_200907 ) ) ( not ( = ?auto_200905 ?auto_200906 ) ) ( not ( = ?auto_200905 ?auto_200904 ) ) ( not ( = ?auto_200905 ?auto_200907 ) ) ( not ( = ?auto_200903 ?auto_200906 ) ) ( not ( = ?auto_200903 ?auto_200904 ) ) ( not ( = ?auto_200903 ?auto_200907 ) ) ( ON ?auto_200902 ?auto_200903 ) ( CLEAR ?auto_200902 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_200899 ?auto_200900 ?auto_200901 ?auto_200905 ?auto_200903 )
      ( MAKE-3PILE ?auto_200899 ?auto_200900 ?auto_200901 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_200908 - BLOCK
      ?auto_200909 - BLOCK
      ?auto_200910 - BLOCK
    )
    :vars
    (
      ?auto_200914 - BLOCK
      ?auto_200916 - BLOCK
      ?auto_200911 - BLOCK
      ?auto_200915 - BLOCK
      ?auto_200912 - BLOCK
      ?auto_200913 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_200914 ?auto_200910 ) ( ON-TABLE ?auto_200908 ) ( ON ?auto_200909 ?auto_200908 ) ( ON ?auto_200910 ?auto_200909 ) ( not ( = ?auto_200908 ?auto_200909 ) ) ( not ( = ?auto_200908 ?auto_200910 ) ) ( not ( = ?auto_200908 ?auto_200914 ) ) ( not ( = ?auto_200909 ?auto_200910 ) ) ( not ( = ?auto_200909 ?auto_200914 ) ) ( not ( = ?auto_200910 ?auto_200914 ) ) ( not ( = ?auto_200908 ?auto_200916 ) ) ( not ( = ?auto_200908 ?auto_200911 ) ) ( not ( = ?auto_200909 ?auto_200916 ) ) ( not ( = ?auto_200909 ?auto_200911 ) ) ( not ( = ?auto_200910 ?auto_200916 ) ) ( not ( = ?auto_200910 ?auto_200911 ) ) ( not ( = ?auto_200914 ?auto_200916 ) ) ( not ( = ?auto_200914 ?auto_200911 ) ) ( not ( = ?auto_200916 ?auto_200911 ) ) ( ON ?auto_200916 ?auto_200914 ) ( ON-TABLE ?auto_200915 ) ( ON ?auto_200912 ?auto_200915 ) ( not ( = ?auto_200915 ?auto_200912 ) ) ( not ( = ?auto_200915 ?auto_200913 ) ) ( not ( = ?auto_200915 ?auto_200911 ) ) ( not ( = ?auto_200912 ?auto_200913 ) ) ( not ( = ?auto_200912 ?auto_200911 ) ) ( not ( = ?auto_200913 ?auto_200911 ) ) ( not ( = ?auto_200908 ?auto_200913 ) ) ( not ( = ?auto_200908 ?auto_200915 ) ) ( not ( = ?auto_200908 ?auto_200912 ) ) ( not ( = ?auto_200909 ?auto_200913 ) ) ( not ( = ?auto_200909 ?auto_200915 ) ) ( not ( = ?auto_200909 ?auto_200912 ) ) ( not ( = ?auto_200910 ?auto_200913 ) ) ( not ( = ?auto_200910 ?auto_200915 ) ) ( not ( = ?auto_200910 ?auto_200912 ) ) ( not ( = ?auto_200914 ?auto_200913 ) ) ( not ( = ?auto_200914 ?auto_200915 ) ) ( not ( = ?auto_200914 ?auto_200912 ) ) ( not ( = ?auto_200916 ?auto_200913 ) ) ( not ( = ?auto_200916 ?auto_200915 ) ) ( not ( = ?auto_200916 ?auto_200912 ) ) ( ON ?auto_200911 ?auto_200916 ) ( CLEAR ?auto_200911 ) ( HOLDING ?auto_200913 ) ( CLEAR ?auto_200912 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_200915 ?auto_200912 ?auto_200913 )
      ( MAKE-3PILE ?auto_200908 ?auto_200909 ?auto_200910 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_200917 - BLOCK
      ?auto_200918 - BLOCK
      ?auto_200919 - BLOCK
    )
    :vars
    (
      ?auto_200920 - BLOCK
      ?auto_200924 - BLOCK
      ?auto_200922 - BLOCK
      ?auto_200921 - BLOCK
      ?auto_200923 - BLOCK
      ?auto_200925 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_200920 ?auto_200919 ) ( ON-TABLE ?auto_200917 ) ( ON ?auto_200918 ?auto_200917 ) ( ON ?auto_200919 ?auto_200918 ) ( not ( = ?auto_200917 ?auto_200918 ) ) ( not ( = ?auto_200917 ?auto_200919 ) ) ( not ( = ?auto_200917 ?auto_200920 ) ) ( not ( = ?auto_200918 ?auto_200919 ) ) ( not ( = ?auto_200918 ?auto_200920 ) ) ( not ( = ?auto_200919 ?auto_200920 ) ) ( not ( = ?auto_200917 ?auto_200924 ) ) ( not ( = ?auto_200917 ?auto_200922 ) ) ( not ( = ?auto_200918 ?auto_200924 ) ) ( not ( = ?auto_200918 ?auto_200922 ) ) ( not ( = ?auto_200919 ?auto_200924 ) ) ( not ( = ?auto_200919 ?auto_200922 ) ) ( not ( = ?auto_200920 ?auto_200924 ) ) ( not ( = ?auto_200920 ?auto_200922 ) ) ( not ( = ?auto_200924 ?auto_200922 ) ) ( ON ?auto_200924 ?auto_200920 ) ( ON-TABLE ?auto_200921 ) ( ON ?auto_200923 ?auto_200921 ) ( not ( = ?auto_200921 ?auto_200923 ) ) ( not ( = ?auto_200921 ?auto_200925 ) ) ( not ( = ?auto_200921 ?auto_200922 ) ) ( not ( = ?auto_200923 ?auto_200925 ) ) ( not ( = ?auto_200923 ?auto_200922 ) ) ( not ( = ?auto_200925 ?auto_200922 ) ) ( not ( = ?auto_200917 ?auto_200925 ) ) ( not ( = ?auto_200917 ?auto_200921 ) ) ( not ( = ?auto_200917 ?auto_200923 ) ) ( not ( = ?auto_200918 ?auto_200925 ) ) ( not ( = ?auto_200918 ?auto_200921 ) ) ( not ( = ?auto_200918 ?auto_200923 ) ) ( not ( = ?auto_200919 ?auto_200925 ) ) ( not ( = ?auto_200919 ?auto_200921 ) ) ( not ( = ?auto_200919 ?auto_200923 ) ) ( not ( = ?auto_200920 ?auto_200925 ) ) ( not ( = ?auto_200920 ?auto_200921 ) ) ( not ( = ?auto_200920 ?auto_200923 ) ) ( not ( = ?auto_200924 ?auto_200925 ) ) ( not ( = ?auto_200924 ?auto_200921 ) ) ( not ( = ?auto_200924 ?auto_200923 ) ) ( ON ?auto_200922 ?auto_200924 ) ( CLEAR ?auto_200923 ) ( ON ?auto_200925 ?auto_200922 ) ( CLEAR ?auto_200925 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_200917 ?auto_200918 ?auto_200919 ?auto_200920 ?auto_200924 ?auto_200922 )
      ( MAKE-3PILE ?auto_200917 ?auto_200918 ?auto_200919 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_200926 - BLOCK
      ?auto_200927 - BLOCK
      ?auto_200928 - BLOCK
    )
    :vars
    (
      ?auto_200934 - BLOCK
      ?auto_200929 - BLOCK
      ?auto_200930 - BLOCK
      ?auto_200933 - BLOCK
      ?auto_200931 - BLOCK
      ?auto_200932 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_200934 ?auto_200928 ) ( ON-TABLE ?auto_200926 ) ( ON ?auto_200927 ?auto_200926 ) ( ON ?auto_200928 ?auto_200927 ) ( not ( = ?auto_200926 ?auto_200927 ) ) ( not ( = ?auto_200926 ?auto_200928 ) ) ( not ( = ?auto_200926 ?auto_200934 ) ) ( not ( = ?auto_200927 ?auto_200928 ) ) ( not ( = ?auto_200927 ?auto_200934 ) ) ( not ( = ?auto_200928 ?auto_200934 ) ) ( not ( = ?auto_200926 ?auto_200929 ) ) ( not ( = ?auto_200926 ?auto_200930 ) ) ( not ( = ?auto_200927 ?auto_200929 ) ) ( not ( = ?auto_200927 ?auto_200930 ) ) ( not ( = ?auto_200928 ?auto_200929 ) ) ( not ( = ?auto_200928 ?auto_200930 ) ) ( not ( = ?auto_200934 ?auto_200929 ) ) ( not ( = ?auto_200934 ?auto_200930 ) ) ( not ( = ?auto_200929 ?auto_200930 ) ) ( ON ?auto_200929 ?auto_200934 ) ( ON-TABLE ?auto_200933 ) ( not ( = ?auto_200933 ?auto_200931 ) ) ( not ( = ?auto_200933 ?auto_200932 ) ) ( not ( = ?auto_200933 ?auto_200930 ) ) ( not ( = ?auto_200931 ?auto_200932 ) ) ( not ( = ?auto_200931 ?auto_200930 ) ) ( not ( = ?auto_200932 ?auto_200930 ) ) ( not ( = ?auto_200926 ?auto_200932 ) ) ( not ( = ?auto_200926 ?auto_200933 ) ) ( not ( = ?auto_200926 ?auto_200931 ) ) ( not ( = ?auto_200927 ?auto_200932 ) ) ( not ( = ?auto_200927 ?auto_200933 ) ) ( not ( = ?auto_200927 ?auto_200931 ) ) ( not ( = ?auto_200928 ?auto_200932 ) ) ( not ( = ?auto_200928 ?auto_200933 ) ) ( not ( = ?auto_200928 ?auto_200931 ) ) ( not ( = ?auto_200934 ?auto_200932 ) ) ( not ( = ?auto_200934 ?auto_200933 ) ) ( not ( = ?auto_200934 ?auto_200931 ) ) ( not ( = ?auto_200929 ?auto_200932 ) ) ( not ( = ?auto_200929 ?auto_200933 ) ) ( not ( = ?auto_200929 ?auto_200931 ) ) ( ON ?auto_200930 ?auto_200929 ) ( ON ?auto_200932 ?auto_200930 ) ( CLEAR ?auto_200932 ) ( HOLDING ?auto_200931 ) ( CLEAR ?auto_200933 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_200933 ?auto_200931 )
      ( MAKE-3PILE ?auto_200926 ?auto_200927 ?auto_200928 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_200935 - BLOCK
      ?auto_200936 - BLOCK
      ?auto_200937 - BLOCK
    )
    :vars
    (
      ?auto_200943 - BLOCK
      ?auto_200940 - BLOCK
      ?auto_200938 - BLOCK
      ?auto_200941 - BLOCK
      ?auto_200939 - BLOCK
      ?auto_200942 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_200943 ?auto_200937 ) ( ON-TABLE ?auto_200935 ) ( ON ?auto_200936 ?auto_200935 ) ( ON ?auto_200937 ?auto_200936 ) ( not ( = ?auto_200935 ?auto_200936 ) ) ( not ( = ?auto_200935 ?auto_200937 ) ) ( not ( = ?auto_200935 ?auto_200943 ) ) ( not ( = ?auto_200936 ?auto_200937 ) ) ( not ( = ?auto_200936 ?auto_200943 ) ) ( not ( = ?auto_200937 ?auto_200943 ) ) ( not ( = ?auto_200935 ?auto_200940 ) ) ( not ( = ?auto_200935 ?auto_200938 ) ) ( not ( = ?auto_200936 ?auto_200940 ) ) ( not ( = ?auto_200936 ?auto_200938 ) ) ( not ( = ?auto_200937 ?auto_200940 ) ) ( not ( = ?auto_200937 ?auto_200938 ) ) ( not ( = ?auto_200943 ?auto_200940 ) ) ( not ( = ?auto_200943 ?auto_200938 ) ) ( not ( = ?auto_200940 ?auto_200938 ) ) ( ON ?auto_200940 ?auto_200943 ) ( ON-TABLE ?auto_200941 ) ( not ( = ?auto_200941 ?auto_200939 ) ) ( not ( = ?auto_200941 ?auto_200942 ) ) ( not ( = ?auto_200941 ?auto_200938 ) ) ( not ( = ?auto_200939 ?auto_200942 ) ) ( not ( = ?auto_200939 ?auto_200938 ) ) ( not ( = ?auto_200942 ?auto_200938 ) ) ( not ( = ?auto_200935 ?auto_200942 ) ) ( not ( = ?auto_200935 ?auto_200941 ) ) ( not ( = ?auto_200935 ?auto_200939 ) ) ( not ( = ?auto_200936 ?auto_200942 ) ) ( not ( = ?auto_200936 ?auto_200941 ) ) ( not ( = ?auto_200936 ?auto_200939 ) ) ( not ( = ?auto_200937 ?auto_200942 ) ) ( not ( = ?auto_200937 ?auto_200941 ) ) ( not ( = ?auto_200937 ?auto_200939 ) ) ( not ( = ?auto_200943 ?auto_200942 ) ) ( not ( = ?auto_200943 ?auto_200941 ) ) ( not ( = ?auto_200943 ?auto_200939 ) ) ( not ( = ?auto_200940 ?auto_200942 ) ) ( not ( = ?auto_200940 ?auto_200941 ) ) ( not ( = ?auto_200940 ?auto_200939 ) ) ( ON ?auto_200938 ?auto_200940 ) ( ON ?auto_200942 ?auto_200938 ) ( CLEAR ?auto_200941 ) ( ON ?auto_200939 ?auto_200942 ) ( CLEAR ?auto_200939 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_200935 ?auto_200936 ?auto_200937 ?auto_200943 ?auto_200940 ?auto_200938 ?auto_200942 )
      ( MAKE-3PILE ?auto_200935 ?auto_200936 ?auto_200937 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_200944 - BLOCK
      ?auto_200945 - BLOCK
      ?auto_200946 - BLOCK
    )
    :vars
    (
      ?auto_200950 - BLOCK
      ?auto_200948 - BLOCK
      ?auto_200951 - BLOCK
      ?auto_200952 - BLOCK
      ?auto_200947 - BLOCK
      ?auto_200949 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_200950 ?auto_200946 ) ( ON-TABLE ?auto_200944 ) ( ON ?auto_200945 ?auto_200944 ) ( ON ?auto_200946 ?auto_200945 ) ( not ( = ?auto_200944 ?auto_200945 ) ) ( not ( = ?auto_200944 ?auto_200946 ) ) ( not ( = ?auto_200944 ?auto_200950 ) ) ( not ( = ?auto_200945 ?auto_200946 ) ) ( not ( = ?auto_200945 ?auto_200950 ) ) ( not ( = ?auto_200946 ?auto_200950 ) ) ( not ( = ?auto_200944 ?auto_200948 ) ) ( not ( = ?auto_200944 ?auto_200951 ) ) ( not ( = ?auto_200945 ?auto_200948 ) ) ( not ( = ?auto_200945 ?auto_200951 ) ) ( not ( = ?auto_200946 ?auto_200948 ) ) ( not ( = ?auto_200946 ?auto_200951 ) ) ( not ( = ?auto_200950 ?auto_200948 ) ) ( not ( = ?auto_200950 ?auto_200951 ) ) ( not ( = ?auto_200948 ?auto_200951 ) ) ( ON ?auto_200948 ?auto_200950 ) ( not ( = ?auto_200952 ?auto_200947 ) ) ( not ( = ?auto_200952 ?auto_200949 ) ) ( not ( = ?auto_200952 ?auto_200951 ) ) ( not ( = ?auto_200947 ?auto_200949 ) ) ( not ( = ?auto_200947 ?auto_200951 ) ) ( not ( = ?auto_200949 ?auto_200951 ) ) ( not ( = ?auto_200944 ?auto_200949 ) ) ( not ( = ?auto_200944 ?auto_200952 ) ) ( not ( = ?auto_200944 ?auto_200947 ) ) ( not ( = ?auto_200945 ?auto_200949 ) ) ( not ( = ?auto_200945 ?auto_200952 ) ) ( not ( = ?auto_200945 ?auto_200947 ) ) ( not ( = ?auto_200946 ?auto_200949 ) ) ( not ( = ?auto_200946 ?auto_200952 ) ) ( not ( = ?auto_200946 ?auto_200947 ) ) ( not ( = ?auto_200950 ?auto_200949 ) ) ( not ( = ?auto_200950 ?auto_200952 ) ) ( not ( = ?auto_200950 ?auto_200947 ) ) ( not ( = ?auto_200948 ?auto_200949 ) ) ( not ( = ?auto_200948 ?auto_200952 ) ) ( not ( = ?auto_200948 ?auto_200947 ) ) ( ON ?auto_200951 ?auto_200948 ) ( ON ?auto_200949 ?auto_200951 ) ( ON ?auto_200947 ?auto_200949 ) ( CLEAR ?auto_200947 ) ( HOLDING ?auto_200952 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_200952 )
      ( MAKE-3PILE ?auto_200944 ?auto_200945 ?auto_200946 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_200953 - BLOCK
      ?auto_200954 - BLOCK
      ?auto_200955 - BLOCK
    )
    :vars
    (
      ?auto_200959 - BLOCK
      ?auto_200958 - BLOCK
      ?auto_200961 - BLOCK
      ?auto_200960 - BLOCK
      ?auto_200956 - BLOCK
      ?auto_200957 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_200959 ?auto_200955 ) ( ON-TABLE ?auto_200953 ) ( ON ?auto_200954 ?auto_200953 ) ( ON ?auto_200955 ?auto_200954 ) ( not ( = ?auto_200953 ?auto_200954 ) ) ( not ( = ?auto_200953 ?auto_200955 ) ) ( not ( = ?auto_200953 ?auto_200959 ) ) ( not ( = ?auto_200954 ?auto_200955 ) ) ( not ( = ?auto_200954 ?auto_200959 ) ) ( not ( = ?auto_200955 ?auto_200959 ) ) ( not ( = ?auto_200953 ?auto_200958 ) ) ( not ( = ?auto_200953 ?auto_200961 ) ) ( not ( = ?auto_200954 ?auto_200958 ) ) ( not ( = ?auto_200954 ?auto_200961 ) ) ( not ( = ?auto_200955 ?auto_200958 ) ) ( not ( = ?auto_200955 ?auto_200961 ) ) ( not ( = ?auto_200959 ?auto_200958 ) ) ( not ( = ?auto_200959 ?auto_200961 ) ) ( not ( = ?auto_200958 ?auto_200961 ) ) ( ON ?auto_200958 ?auto_200959 ) ( not ( = ?auto_200960 ?auto_200956 ) ) ( not ( = ?auto_200960 ?auto_200957 ) ) ( not ( = ?auto_200960 ?auto_200961 ) ) ( not ( = ?auto_200956 ?auto_200957 ) ) ( not ( = ?auto_200956 ?auto_200961 ) ) ( not ( = ?auto_200957 ?auto_200961 ) ) ( not ( = ?auto_200953 ?auto_200957 ) ) ( not ( = ?auto_200953 ?auto_200960 ) ) ( not ( = ?auto_200953 ?auto_200956 ) ) ( not ( = ?auto_200954 ?auto_200957 ) ) ( not ( = ?auto_200954 ?auto_200960 ) ) ( not ( = ?auto_200954 ?auto_200956 ) ) ( not ( = ?auto_200955 ?auto_200957 ) ) ( not ( = ?auto_200955 ?auto_200960 ) ) ( not ( = ?auto_200955 ?auto_200956 ) ) ( not ( = ?auto_200959 ?auto_200957 ) ) ( not ( = ?auto_200959 ?auto_200960 ) ) ( not ( = ?auto_200959 ?auto_200956 ) ) ( not ( = ?auto_200958 ?auto_200957 ) ) ( not ( = ?auto_200958 ?auto_200960 ) ) ( not ( = ?auto_200958 ?auto_200956 ) ) ( ON ?auto_200961 ?auto_200958 ) ( ON ?auto_200957 ?auto_200961 ) ( ON ?auto_200956 ?auto_200957 ) ( ON ?auto_200960 ?auto_200956 ) ( CLEAR ?auto_200960 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_200953 ?auto_200954 ?auto_200955 ?auto_200959 ?auto_200958 ?auto_200961 ?auto_200957 ?auto_200956 )
      ( MAKE-3PILE ?auto_200953 ?auto_200954 ?auto_200955 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_200968 - BLOCK
      ?auto_200969 - BLOCK
      ?auto_200970 - BLOCK
      ?auto_200971 - BLOCK
      ?auto_200972 - BLOCK
      ?auto_200973 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_200973 ) ( CLEAR ?auto_200972 ) ( ON-TABLE ?auto_200968 ) ( ON ?auto_200969 ?auto_200968 ) ( ON ?auto_200970 ?auto_200969 ) ( ON ?auto_200971 ?auto_200970 ) ( ON ?auto_200972 ?auto_200971 ) ( not ( = ?auto_200968 ?auto_200969 ) ) ( not ( = ?auto_200968 ?auto_200970 ) ) ( not ( = ?auto_200968 ?auto_200971 ) ) ( not ( = ?auto_200968 ?auto_200972 ) ) ( not ( = ?auto_200968 ?auto_200973 ) ) ( not ( = ?auto_200969 ?auto_200970 ) ) ( not ( = ?auto_200969 ?auto_200971 ) ) ( not ( = ?auto_200969 ?auto_200972 ) ) ( not ( = ?auto_200969 ?auto_200973 ) ) ( not ( = ?auto_200970 ?auto_200971 ) ) ( not ( = ?auto_200970 ?auto_200972 ) ) ( not ( = ?auto_200970 ?auto_200973 ) ) ( not ( = ?auto_200971 ?auto_200972 ) ) ( not ( = ?auto_200971 ?auto_200973 ) ) ( not ( = ?auto_200972 ?auto_200973 ) ) )
    :subtasks
    ( ( !STACK ?auto_200973 ?auto_200972 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_200974 - BLOCK
      ?auto_200975 - BLOCK
      ?auto_200976 - BLOCK
      ?auto_200977 - BLOCK
      ?auto_200978 - BLOCK
      ?auto_200979 - BLOCK
    )
    :vars
    (
      ?auto_200980 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_200978 ) ( ON-TABLE ?auto_200974 ) ( ON ?auto_200975 ?auto_200974 ) ( ON ?auto_200976 ?auto_200975 ) ( ON ?auto_200977 ?auto_200976 ) ( ON ?auto_200978 ?auto_200977 ) ( not ( = ?auto_200974 ?auto_200975 ) ) ( not ( = ?auto_200974 ?auto_200976 ) ) ( not ( = ?auto_200974 ?auto_200977 ) ) ( not ( = ?auto_200974 ?auto_200978 ) ) ( not ( = ?auto_200974 ?auto_200979 ) ) ( not ( = ?auto_200975 ?auto_200976 ) ) ( not ( = ?auto_200975 ?auto_200977 ) ) ( not ( = ?auto_200975 ?auto_200978 ) ) ( not ( = ?auto_200975 ?auto_200979 ) ) ( not ( = ?auto_200976 ?auto_200977 ) ) ( not ( = ?auto_200976 ?auto_200978 ) ) ( not ( = ?auto_200976 ?auto_200979 ) ) ( not ( = ?auto_200977 ?auto_200978 ) ) ( not ( = ?auto_200977 ?auto_200979 ) ) ( not ( = ?auto_200978 ?auto_200979 ) ) ( ON ?auto_200979 ?auto_200980 ) ( CLEAR ?auto_200979 ) ( HAND-EMPTY ) ( not ( = ?auto_200974 ?auto_200980 ) ) ( not ( = ?auto_200975 ?auto_200980 ) ) ( not ( = ?auto_200976 ?auto_200980 ) ) ( not ( = ?auto_200977 ?auto_200980 ) ) ( not ( = ?auto_200978 ?auto_200980 ) ) ( not ( = ?auto_200979 ?auto_200980 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_200979 ?auto_200980 )
      ( MAKE-6PILE ?auto_200974 ?auto_200975 ?auto_200976 ?auto_200977 ?auto_200978 ?auto_200979 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_200981 - BLOCK
      ?auto_200982 - BLOCK
      ?auto_200983 - BLOCK
      ?auto_200984 - BLOCK
      ?auto_200985 - BLOCK
      ?auto_200986 - BLOCK
    )
    :vars
    (
      ?auto_200987 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_200981 ) ( ON ?auto_200982 ?auto_200981 ) ( ON ?auto_200983 ?auto_200982 ) ( ON ?auto_200984 ?auto_200983 ) ( not ( = ?auto_200981 ?auto_200982 ) ) ( not ( = ?auto_200981 ?auto_200983 ) ) ( not ( = ?auto_200981 ?auto_200984 ) ) ( not ( = ?auto_200981 ?auto_200985 ) ) ( not ( = ?auto_200981 ?auto_200986 ) ) ( not ( = ?auto_200982 ?auto_200983 ) ) ( not ( = ?auto_200982 ?auto_200984 ) ) ( not ( = ?auto_200982 ?auto_200985 ) ) ( not ( = ?auto_200982 ?auto_200986 ) ) ( not ( = ?auto_200983 ?auto_200984 ) ) ( not ( = ?auto_200983 ?auto_200985 ) ) ( not ( = ?auto_200983 ?auto_200986 ) ) ( not ( = ?auto_200984 ?auto_200985 ) ) ( not ( = ?auto_200984 ?auto_200986 ) ) ( not ( = ?auto_200985 ?auto_200986 ) ) ( ON ?auto_200986 ?auto_200987 ) ( CLEAR ?auto_200986 ) ( not ( = ?auto_200981 ?auto_200987 ) ) ( not ( = ?auto_200982 ?auto_200987 ) ) ( not ( = ?auto_200983 ?auto_200987 ) ) ( not ( = ?auto_200984 ?auto_200987 ) ) ( not ( = ?auto_200985 ?auto_200987 ) ) ( not ( = ?auto_200986 ?auto_200987 ) ) ( HOLDING ?auto_200985 ) ( CLEAR ?auto_200984 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_200981 ?auto_200982 ?auto_200983 ?auto_200984 ?auto_200985 )
      ( MAKE-6PILE ?auto_200981 ?auto_200982 ?auto_200983 ?auto_200984 ?auto_200985 ?auto_200986 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_200988 - BLOCK
      ?auto_200989 - BLOCK
      ?auto_200990 - BLOCK
      ?auto_200991 - BLOCK
      ?auto_200992 - BLOCK
      ?auto_200993 - BLOCK
    )
    :vars
    (
      ?auto_200994 - BLOCK
      ?auto_200995 - BLOCK
      ?auto_200996 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_200988 ) ( ON ?auto_200989 ?auto_200988 ) ( ON ?auto_200990 ?auto_200989 ) ( ON ?auto_200991 ?auto_200990 ) ( not ( = ?auto_200988 ?auto_200989 ) ) ( not ( = ?auto_200988 ?auto_200990 ) ) ( not ( = ?auto_200988 ?auto_200991 ) ) ( not ( = ?auto_200988 ?auto_200992 ) ) ( not ( = ?auto_200988 ?auto_200993 ) ) ( not ( = ?auto_200989 ?auto_200990 ) ) ( not ( = ?auto_200989 ?auto_200991 ) ) ( not ( = ?auto_200989 ?auto_200992 ) ) ( not ( = ?auto_200989 ?auto_200993 ) ) ( not ( = ?auto_200990 ?auto_200991 ) ) ( not ( = ?auto_200990 ?auto_200992 ) ) ( not ( = ?auto_200990 ?auto_200993 ) ) ( not ( = ?auto_200991 ?auto_200992 ) ) ( not ( = ?auto_200991 ?auto_200993 ) ) ( not ( = ?auto_200992 ?auto_200993 ) ) ( ON ?auto_200993 ?auto_200994 ) ( not ( = ?auto_200988 ?auto_200994 ) ) ( not ( = ?auto_200989 ?auto_200994 ) ) ( not ( = ?auto_200990 ?auto_200994 ) ) ( not ( = ?auto_200991 ?auto_200994 ) ) ( not ( = ?auto_200992 ?auto_200994 ) ) ( not ( = ?auto_200993 ?auto_200994 ) ) ( CLEAR ?auto_200991 ) ( ON ?auto_200992 ?auto_200993 ) ( CLEAR ?auto_200992 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_200995 ) ( ON ?auto_200996 ?auto_200995 ) ( ON ?auto_200994 ?auto_200996 ) ( not ( = ?auto_200995 ?auto_200996 ) ) ( not ( = ?auto_200995 ?auto_200994 ) ) ( not ( = ?auto_200995 ?auto_200993 ) ) ( not ( = ?auto_200995 ?auto_200992 ) ) ( not ( = ?auto_200996 ?auto_200994 ) ) ( not ( = ?auto_200996 ?auto_200993 ) ) ( not ( = ?auto_200996 ?auto_200992 ) ) ( not ( = ?auto_200988 ?auto_200995 ) ) ( not ( = ?auto_200988 ?auto_200996 ) ) ( not ( = ?auto_200989 ?auto_200995 ) ) ( not ( = ?auto_200989 ?auto_200996 ) ) ( not ( = ?auto_200990 ?auto_200995 ) ) ( not ( = ?auto_200990 ?auto_200996 ) ) ( not ( = ?auto_200991 ?auto_200995 ) ) ( not ( = ?auto_200991 ?auto_200996 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_200995 ?auto_200996 ?auto_200994 ?auto_200993 )
      ( MAKE-6PILE ?auto_200988 ?auto_200989 ?auto_200990 ?auto_200991 ?auto_200992 ?auto_200993 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_200997 - BLOCK
      ?auto_200998 - BLOCK
      ?auto_200999 - BLOCK
      ?auto_201000 - BLOCK
      ?auto_201001 - BLOCK
      ?auto_201002 - BLOCK
    )
    :vars
    (
      ?auto_201004 - BLOCK
      ?auto_201003 - BLOCK
      ?auto_201005 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_200997 ) ( ON ?auto_200998 ?auto_200997 ) ( ON ?auto_200999 ?auto_200998 ) ( not ( = ?auto_200997 ?auto_200998 ) ) ( not ( = ?auto_200997 ?auto_200999 ) ) ( not ( = ?auto_200997 ?auto_201000 ) ) ( not ( = ?auto_200997 ?auto_201001 ) ) ( not ( = ?auto_200997 ?auto_201002 ) ) ( not ( = ?auto_200998 ?auto_200999 ) ) ( not ( = ?auto_200998 ?auto_201000 ) ) ( not ( = ?auto_200998 ?auto_201001 ) ) ( not ( = ?auto_200998 ?auto_201002 ) ) ( not ( = ?auto_200999 ?auto_201000 ) ) ( not ( = ?auto_200999 ?auto_201001 ) ) ( not ( = ?auto_200999 ?auto_201002 ) ) ( not ( = ?auto_201000 ?auto_201001 ) ) ( not ( = ?auto_201000 ?auto_201002 ) ) ( not ( = ?auto_201001 ?auto_201002 ) ) ( ON ?auto_201002 ?auto_201004 ) ( not ( = ?auto_200997 ?auto_201004 ) ) ( not ( = ?auto_200998 ?auto_201004 ) ) ( not ( = ?auto_200999 ?auto_201004 ) ) ( not ( = ?auto_201000 ?auto_201004 ) ) ( not ( = ?auto_201001 ?auto_201004 ) ) ( not ( = ?auto_201002 ?auto_201004 ) ) ( ON ?auto_201001 ?auto_201002 ) ( CLEAR ?auto_201001 ) ( ON-TABLE ?auto_201003 ) ( ON ?auto_201005 ?auto_201003 ) ( ON ?auto_201004 ?auto_201005 ) ( not ( = ?auto_201003 ?auto_201005 ) ) ( not ( = ?auto_201003 ?auto_201004 ) ) ( not ( = ?auto_201003 ?auto_201002 ) ) ( not ( = ?auto_201003 ?auto_201001 ) ) ( not ( = ?auto_201005 ?auto_201004 ) ) ( not ( = ?auto_201005 ?auto_201002 ) ) ( not ( = ?auto_201005 ?auto_201001 ) ) ( not ( = ?auto_200997 ?auto_201003 ) ) ( not ( = ?auto_200997 ?auto_201005 ) ) ( not ( = ?auto_200998 ?auto_201003 ) ) ( not ( = ?auto_200998 ?auto_201005 ) ) ( not ( = ?auto_200999 ?auto_201003 ) ) ( not ( = ?auto_200999 ?auto_201005 ) ) ( not ( = ?auto_201000 ?auto_201003 ) ) ( not ( = ?auto_201000 ?auto_201005 ) ) ( HOLDING ?auto_201000 ) ( CLEAR ?auto_200999 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_200997 ?auto_200998 ?auto_200999 ?auto_201000 )
      ( MAKE-6PILE ?auto_200997 ?auto_200998 ?auto_200999 ?auto_201000 ?auto_201001 ?auto_201002 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_201006 - BLOCK
      ?auto_201007 - BLOCK
      ?auto_201008 - BLOCK
      ?auto_201009 - BLOCK
      ?auto_201010 - BLOCK
      ?auto_201011 - BLOCK
    )
    :vars
    (
      ?auto_201012 - BLOCK
      ?auto_201014 - BLOCK
      ?auto_201013 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_201006 ) ( ON ?auto_201007 ?auto_201006 ) ( ON ?auto_201008 ?auto_201007 ) ( not ( = ?auto_201006 ?auto_201007 ) ) ( not ( = ?auto_201006 ?auto_201008 ) ) ( not ( = ?auto_201006 ?auto_201009 ) ) ( not ( = ?auto_201006 ?auto_201010 ) ) ( not ( = ?auto_201006 ?auto_201011 ) ) ( not ( = ?auto_201007 ?auto_201008 ) ) ( not ( = ?auto_201007 ?auto_201009 ) ) ( not ( = ?auto_201007 ?auto_201010 ) ) ( not ( = ?auto_201007 ?auto_201011 ) ) ( not ( = ?auto_201008 ?auto_201009 ) ) ( not ( = ?auto_201008 ?auto_201010 ) ) ( not ( = ?auto_201008 ?auto_201011 ) ) ( not ( = ?auto_201009 ?auto_201010 ) ) ( not ( = ?auto_201009 ?auto_201011 ) ) ( not ( = ?auto_201010 ?auto_201011 ) ) ( ON ?auto_201011 ?auto_201012 ) ( not ( = ?auto_201006 ?auto_201012 ) ) ( not ( = ?auto_201007 ?auto_201012 ) ) ( not ( = ?auto_201008 ?auto_201012 ) ) ( not ( = ?auto_201009 ?auto_201012 ) ) ( not ( = ?auto_201010 ?auto_201012 ) ) ( not ( = ?auto_201011 ?auto_201012 ) ) ( ON ?auto_201010 ?auto_201011 ) ( ON-TABLE ?auto_201014 ) ( ON ?auto_201013 ?auto_201014 ) ( ON ?auto_201012 ?auto_201013 ) ( not ( = ?auto_201014 ?auto_201013 ) ) ( not ( = ?auto_201014 ?auto_201012 ) ) ( not ( = ?auto_201014 ?auto_201011 ) ) ( not ( = ?auto_201014 ?auto_201010 ) ) ( not ( = ?auto_201013 ?auto_201012 ) ) ( not ( = ?auto_201013 ?auto_201011 ) ) ( not ( = ?auto_201013 ?auto_201010 ) ) ( not ( = ?auto_201006 ?auto_201014 ) ) ( not ( = ?auto_201006 ?auto_201013 ) ) ( not ( = ?auto_201007 ?auto_201014 ) ) ( not ( = ?auto_201007 ?auto_201013 ) ) ( not ( = ?auto_201008 ?auto_201014 ) ) ( not ( = ?auto_201008 ?auto_201013 ) ) ( not ( = ?auto_201009 ?auto_201014 ) ) ( not ( = ?auto_201009 ?auto_201013 ) ) ( CLEAR ?auto_201008 ) ( ON ?auto_201009 ?auto_201010 ) ( CLEAR ?auto_201009 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_201014 ?auto_201013 ?auto_201012 ?auto_201011 ?auto_201010 )
      ( MAKE-6PILE ?auto_201006 ?auto_201007 ?auto_201008 ?auto_201009 ?auto_201010 ?auto_201011 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_201015 - BLOCK
      ?auto_201016 - BLOCK
      ?auto_201017 - BLOCK
      ?auto_201018 - BLOCK
      ?auto_201019 - BLOCK
      ?auto_201020 - BLOCK
    )
    :vars
    (
      ?auto_201022 - BLOCK
      ?auto_201021 - BLOCK
      ?auto_201023 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_201015 ) ( ON ?auto_201016 ?auto_201015 ) ( not ( = ?auto_201015 ?auto_201016 ) ) ( not ( = ?auto_201015 ?auto_201017 ) ) ( not ( = ?auto_201015 ?auto_201018 ) ) ( not ( = ?auto_201015 ?auto_201019 ) ) ( not ( = ?auto_201015 ?auto_201020 ) ) ( not ( = ?auto_201016 ?auto_201017 ) ) ( not ( = ?auto_201016 ?auto_201018 ) ) ( not ( = ?auto_201016 ?auto_201019 ) ) ( not ( = ?auto_201016 ?auto_201020 ) ) ( not ( = ?auto_201017 ?auto_201018 ) ) ( not ( = ?auto_201017 ?auto_201019 ) ) ( not ( = ?auto_201017 ?auto_201020 ) ) ( not ( = ?auto_201018 ?auto_201019 ) ) ( not ( = ?auto_201018 ?auto_201020 ) ) ( not ( = ?auto_201019 ?auto_201020 ) ) ( ON ?auto_201020 ?auto_201022 ) ( not ( = ?auto_201015 ?auto_201022 ) ) ( not ( = ?auto_201016 ?auto_201022 ) ) ( not ( = ?auto_201017 ?auto_201022 ) ) ( not ( = ?auto_201018 ?auto_201022 ) ) ( not ( = ?auto_201019 ?auto_201022 ) ) ( not ( = ?auto_201020 ?auto_201022 ) ) ( ON ?auto_201019 ?auto_201020 ) ( ON-TABLE ?auto_201021 ) ( ON ?auto_201023 ?auto_201021 ) ( ON ?auto_201022 ?auto_201023 ) ( not ( = ?auto_201021 ?auto_201023 ) ) ( not ( = ?auto_201021 ?auto_201022 ) ) ( not ( = ?auto_201021 ?auto_201020 ) ) ( not ( = ?auto_201021 ?auto_201019 ) ) ( not ( = ?auto_201023 ?auto_201022 ) ) ( not ( = ?auto_201023 ?auto_201020 ) ) ( not ( = ?auto_201023 ?auto_201019 ) ) ( not ( = ?auto_201015 ?auto_201021 ) ) ( not ( = ?auto_201015 ?auto_201023 ) ) ( not ( = ?auto_201016 ?auto_201021 ) ) ( not ( = ?auto_201016 ?auto_201023 ) ) ( not ( = ?auto_201017 ?auto_201021 ) ) ( not ( = ?auto_201017 ?auto_201023 ) ) ( not ( = ?auto_201018 ?auto_201021 ) ) ( not ( = ?auto_201018 ?auto_201023 ) ) ( ON ?auto_201018 ?auto_201019 ) ( CLEAR ?auto_201018 ) ( HOLDING ?auto_201017 ) ( CLEAR ?auto_201016 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_201015 ?auto_201016 ?auto_201017 )
      ( MAKE-6PILE ?auto_201015 ?auto_201016 ?auto_201017 ?auto_201018 ?auto_201019 ?auto_201020 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_201024 - BLOCK
      ?auto_201025 - BLOCK
      ?auto_201026 - BLOCK
      ?auto_201027 - BLOCK
      ?auto_201028 - BLOCK
      ?auto_201029 - BLOCK
    )
    :vars
    (
      ?auto_201030 - BLOCK
      ?auto_201032 - BLOCK
      ?auto_201031 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_201024 ) ( ON ?auto_201025 ?auto_201024 ) ( not ( = ?auto_201024 ?auto_201025 ) ) ( not ( = ?auto_201024 ?auto_201026 ) ) ( not ( = ?auto_201024 ?auto_201027 ) ) ( not ( = ?auto_201024 ?auto_201028 ) ) ( not ( = ?auto_201024 ?auto_201029 ) ) ( not ( = ?auto_201025 ?auto_201026 ) ) ( not ( = ?auto_201025 ?auto_201027 ) ) ( not ( = ?auto_201025 ?auto_201028 ) ) ( not ( = ?auto_201025 ?auto_201029 ) ) ( not ( = ?auto_201026 ?auto_201027 ) ) ( not ( = ?auto_201026 ?auto_201028 ) ) ( not ( = ?auto_201026 ?auto_201029 ) ) ( not ( = ?auto_201027 ?auto_201028 ) ) ( not ( = ?auto_201027 ?auto_201029 ) ) ( not ( = ?auto_201028 ?auto_201029 ) ) ( ON ?auto_201029 ?auto_201030 ) ( not ( = ?auto_201024 ?auto_201030 ) ) ( not ( = ?auto_201025 ?auto_201030 ) ) ( not ( = ?auto_201026 ?auto_201030 ) ) ( not ( = ?auto_201027 ?auto_201030 ) ) ( not ( = ?auto_201028 ?auto_201030 ) ) ( not ( = ?auto_201029 ?auto_201030 ) ) ( ON ?auto_201028 ?auto_201029 ) ( ON-TABLE ?auto_201032 ) ( ON ?auto_201031 ?auto_201032 ) ( ON ?auto_201030 ?auto_201031 ) ( not ( = ?auto_201032 ?auto_201031 ) ) ( not ( = ?auto_201032 ?auto_201030 ) ) ( not ( = ?auto_201032 ?auto_201029 ) ) ( not ( = ?auto_201032 ?auto_201028 ) ) ( not ( = ?auto_201031 ?auto_201030 ) ) ( not ( = ?auto_201031 ?auto_201029 ) ) ( not ( = ?auto_201031 ?auto_201028 ) ) ( not ( = ?auto_201024 ?auto_201032 ) ) ( not ( = ?auto_201024 ?auto_201031 ) ) ( not ( = ?auto_201025 ?auto_201032 ) ) ( not ( = ?auto_201025 ?auto_201031 ) ) ( not ( = ?auto_201026 ?auto_201032 ) ) ( not ( = ?auto_201026 ?auto_201031 ) ) ( not ( = ?auto_201027 ?auto_201032 ) ) ( not ( = ?auto_201027 ?auto_201031 ) ) ( ON ?auto_201027 ?auto_201028 ) ( CLEAR ?auto_201025 ) ( ON ?auto_201026 ?auto_201027 ) ( CLEAR ?auto_201026 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_201032 ?auto_201031 ?auto_201030 ?auto_201029 ?auto_201028 ?auto_201027 )
      ( MAKE-6PILE ?auto_201024 ?auto_201025 ?auto_201026 ?auto_201027 ?auto_201028 ?auto_201029 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_201033 - BLOCK
      ?auto_201034 - BLOCK
      ?auto_201035 - BLOCK
      ?auto_201036 - BLOCK
      ?auto_201037 - BLOCK
      ?auto_201038 - BLOCK
    )
    :vars
    (
      ?auto_201039 - BLOCK
      ?auto_201040 - BLOCK
      ?auto_201041 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_201033 ) ( not ( = ?auto_201033 ?auto_201034 ) ) ( not ( = ?auto_201033 ?auto_201035 ) ) ( not ( = ?auto_201033 ?auto_201036 ) ) ( not ( = ?auto_201033 ?auto_201037 ) ) ( not ( = ?auto_201033 ?auto_201038 ) ) ( not ( = ?auto_201034 ?auto_201035 ) ) ( not ( = ?auto_201034 ?auto_201036 ) ) ( not ( = ?auto_201034 ?auto_201037 ) ) ( not ( = ?auto_201034 ?auto_201038 ) ) ( not ( = ?auto_201035 ?auto_201036 ) ) ( not ( = ?auto_201035 ?auto_201037 ) ) ( not ( = ?auto_201035 ?auto_201038 ) ) ( not ( = ?auto_201036 ?auto_201037 ) ) ( not ( = ?auto_201036 ?auto_201038 ) ) ( not ( = ?auto_201037 ?auto_201038 ) ) ( ON ?auto_201038 ?auto_201039 ) ( not ( = ?auto_201033 ?auto_201039 ) ) ( not ( = ?auto_201034 ?auto_201039 ) ) ( not ( = ?auto_201035 ?auto_201039 ) ) ( not ( = ?auto_201036 ?auto_201039 ) ) ( not ( = ?auto_201037 ?auto_201039 ) ) ( not ( = ?auto_201038 ?auto_201039 ) ) ( ON ?auto_201037 ?auto_201038 ) ( ON-TABLE ?auto_201040 ) ( ON ?auto_201041 ?auto_201040 ) ( ON ?auto_201039 ?auto_201041 ) ( not ( = ?auto_201040 ?auto_201041 ) ) ( not ( = ?auto_201040 ?auto_201039 ) ) ( not ( = ?auto_201040 ?auto_201038 ) ) ( not ( = ?auto_201040 ?auto_201037 ) ) ( not ( = ?auto_201041 ?auto_201039 ) ) ( not ( = ?auto_201041 ?auto_201038 ) ) ( not ( = ?auto_201041 ?auto_201037 ) ) ( not ( = ?auto_201033 ?auto_201040 ) ) ( not ( = ?auto_201033 ?auto_201041 ) ) ( not ( = ?auto_201034 ?auto_201040 ) ) ( not ( = ?auto_201034 ?auto_201041 ) ) ( not ( = ?auto_201035 ?auto_201040 ) ) ( not ( = ?auto_201035 ?auto_201041 ) ) ( not ( = ?auto_201036 ?auto_201040 ) ) ( not ( = ?auto_201036 ?auto_201041 ) ) ( ON ?auto_201036 ?auto_201037 ) ( ON ?auto_201035 ?auto_201036 ) ( CLEAR ?auto_201035 ) ( HOLDING ?auto_201034 ) ( CLEAR ?auto_201033 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_201033 ?auto_201034 )
      ( MAKE-6PILE ?auto_201033 ?auto_201034 ?auto_201035 ?auto_201036 ?auto_201037 ?auto_201038 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_201042 - BLOCK
      ?auto_201043 - BLOCK
      ?auto_201044 - BLOCK
      ?auto_201045 - BLOCK
      ?auto_201046 - BLOCK
      ?auto_201047 - BLOCK
    )
    :vars
    (
      ?auto_201049 - BLOCK
      ?auto_201048 - BLOCK
      ?auto_201050 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_201042 ) ( not ( = ?auto_201042 ?auto_201043 ) ) ( not ( = ?auto_201042 ?auto_201044 ) ) ( not ( = ?auto_201042 ?auto_201045 ) ) ( not ( = ?auto_201042 ?auto_201046 ) ) ( not ( = ?auto_201042 ?auto_201047 ) ) ( not ( = ?auto_201043 ?auto_201044 ) ) ( not ( = ?auto_201043 ?auto_201045 ) ) ( not ( = ?auto_201043 ?auto_201046 ) ) ( not ( = ?auto_201043 ?auto_201047 ) ) ( not ( = ?auto_201044 ?auto_201045 ) ) ( not ( = ?auto_201044 ?auto_201046 ) ) ( not ( = ?auto_201044 ?auto_201047 ) ) ( not ( = ?auto_201045 ?auto_201046 ) ) ( not ( = ?auto_201045 ?auto_201047 ) ) ( not ( = ?auto_201046 ?auto_201047 ) ) ( ON ?auto_201047 ?auto_201049 ) ( not ( = ?auto_201042 ?auto_201049 ) ) ( not ( = ?auto_201043 ?auto_201049 ) ) ( not ( = ?auto_201044 ?auto_201049 ) ) ( not ( = ?auto_201045 ?auto_201049 ) ) ( not ( = ?auto_201046 ?auto_201049 ) ) ( not ( = ?auto_201047 ?auto_201049 ) ) ( ON ?auto_201046 ?auto_201047 ) ( ON-TABLE ?auto_201048 ) ( ON ?auto_201050 ?auto_201048 ) ( ON ?auto_201049 ?auto_201050 ) ( not ( = ?auto_201048 ?auto_201050 ) ) ( not ( = ?auto_201048 ?auto_201049 ) ) ( not ( = ?auto_201048 ?auto_201047 ) ) ( not ( = ?auto_201048 ?auto_201046 ) ) ( not ( = ?auto_201050 ?auto_201049 ) ) ( not ( = ?auto_201050 ?auto_201047 ) ) ( not ( = ?auto_201050 ?auto_201046 ) ) ( not ( = ?auto_201042 ?auto_201048 ) ) ( not ( = ?auto_201042 ?auto_201050 ) ) ( not ( = ?auto_201043 ?auto_201048 ) ) ( not ( = ?auto_201043 ?auto_201050 ) ) ( not ( = ?auto_201044 ?auto_201048 ) ) ( not ( = ?auto_201044 ?auto_201050 ) ) ( not ( = ?auto_201045 ?auto_201048 ) ) ( not ( = ?auto_201045 ?auto_201050 ) ) ( ON ?auto_201045 ?auto_201046 ) ( ON ?auto_201044 ?auto_201045 ) ( CLEAR ?auto_201042 ) ( ON ?auto_201043 ?auto_201044 ) ( CLEAR ?auto_201043 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_201048 ?auto_201050 ?auto_201049 ?auto_201047 ?auto_201046 ?auto_201045 ?auto_201044 )
      ( MAKE-6PILE ?auto_201042 ?auto_201043 ?auto_201044 ?auto_201045 ?auto_201046 ?auto_201047 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_201051 - BLOCK
      ?auto_201052 - BLOCK
      ?auto_201053 - BLOCK
      ?auto_201054 - BLOCK
      ?auto_201055 - BLOCK
      ?auto_201056 - BLOCK
    )
    :vars
    (
      ?auto_201057 - BLOCK
      ?auto_201059 - BLOCK
      ?auto_201058 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_201051 ?auto_201052 ) ) ( not ( = ?auto_201051 ?auto_201053 ) ) ( not ( = ?auto_201051 ?auto_201054 ) ) ( not ( = ?auto_201051 ?auto_201055 ) ) ( not ( = ?auto_201051 ?auto_201056 ) ) ( not ( = ?auto_201052 ?auto_201053 ) ) ( not ( = ?auto_201052 ?auto_201054 ) ) ( not ( = ?auto_201052 ?auto_201055 ) ) ( not ( = ?auto_201052 ?auto_201056 ) ) ( not ( = ?auto_201053 ?auto_201054 ) ) ( not ( = ?auto_201053 ?auto_201055 ) ) ( not ( = ?auto_201053 ?auto_201056 ) ) ( not ( = ?auto_201054 ?auto_201055 ) ) ( not ( = ?auto_201054 ?auto_201056 ) ) ( not ( = ?auto_201055 ?auto_201056 ) ) ( ON ?auto_201056 ?auto_201057 ) ( not ( = ?auto_201051 ?auto_201057 ) ) ( not ( = ?auto_201052 ?auto_201057 ) ) ( not ( = ?auto_201053 ?auto_201057 ) ) ( not ( = ?auto_201054 ?auto_201057 ) ) ( not ( = ?auto_201055 ?auto_201057 ) ) ( not ( = ?auto_201056 ?auto_201057 ) ) ( ON ?auto_201055 ?auto_201056 ) ( ON-TABLE ?auto_201059 ) ( ON ?auto_201058 ?auto_201059 ) ( ON ?auto_201057 ?auto_201058 ) ( not ( = ?auto_201059 ?auto_201058 ) ) ( not ( = ?auto_201059 ?auto_201057 ) ) ( not ( = ?auto_201059 ?auto_201056 ) ) ( not ( = ?auto_201059 ?auto_201055 ) ) ( not ( = ?auto_201058 ?auto_201057 ) ) ( not ( = ?auto_201058 ?auto_201056 ) ) ( not ( = ?auto_201058 ?auto_201055 ) ) ( not ( = ?auto_201051 ?auto_201059 ) ) ( not ( = ?auto_201051 ?auto_201058 ) ) ( not ( = ?auto_201052 ?auto_201059 ) ) ( not ( = ?auto_201052 ?auto_201058 ) ) ( not ( = ?auto_201053 ?auto_201059 ) ) ( not ( = ?auto_201053 ?auto_201058 ) ) ( not ( = ?auto_201054 ?auto_201059 ) ) ( not ( = ?auto_201054 ?auto_201058 ) ) ( ON ?auto_201054 ?auto_201055 ) ( ON ?auto_201053 ?auto_201054 ) ( ON ?auto_201052 ?auto_201053 ) ( CLEAR ?auto_201052 ) ( HOLDING ?auto_201051 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_201051 )
      ( MAKE-6PILE ?auto_201051 ?auto_201052 ?auto_201053 ?auto_201054 ?auto_201055 ?auto_201056 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_201060 - BLOCK
      ?auto_201061 - BLOCK
      ?auto_201062 - BLOCK
      ?auto_201063 - BLOCK
      ?auto_201064 - BLOCK
      ?auto_201065 - BLOCK
    )
    :vars
    (
      ?auto_201066 - BLOCK
      ?auto_201068 - BLOCK
      ?auto_201067 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_201060 ?auto_201061 ) ) ( not ( = ?auto_201060 ?auto_201062 ) ) ( not ( = ?auto_201060 ?auto_201063 ) ) ( not ( = ?auto_201060 ?auto_201064 ) ) ( not ( = ?auto_201060 ?auto_201065 ) ) ( not ( = ?auto_201061 ?auto_201062 ) ) ( not ( = ?auto_201061 ?auto_201063 ) ) ( not ( = ?auto_201061 ?auto_201064 ) ) ( not ( = ?auto_201061 ?auto_201065 ) ) ( not ( = ?auto_201062 ?auto_201063 ) ) ( not ( = ?auto_201062 ?auto_201064 ) ) ( not ( = ?auto_201062 ?auto_201065 ) ) ( not ( = ?auto_201063 ?auto_201064 ) ) ( not ( = ?auto_201063 ?auto_201065 ) ) ( not ( = ?auto_201064 ?auto_201065 ) ) ( ON ?auto_201065 ?auto_201066 ) ( not ( = ?auto_201060 ?auto_201066 ) ) ( not ( = ?auto_201061 ?auto_201066 ) ) ( not ( = ?auto_201062 ?auto_201066 ) ) ( not ( = ?auto_201063 ?auto_201066 ) ) ( not ( = ?auto_201064 ?auto_201066 ) ) ( not ( = ?auto_201065 ?auto_201066 ) ) ( ON ?auto_201064 ?auto_201065 ) ( ON-TABLE ?auto_201068 ) ( ON ?auto_201067 ?auto_201068 ) ( ON ?auto_201066 ?auto_201067 ) ( not ( = ?auto_201068 ?auto_201067 ) ) ( not ( = ?auto_201068 ?auto_201066 ) ) ( not ( = ?auto_201068 ?auto_201065 ) ) ( not ( = ?auto_201068 ?auto_201064 ) ) ( not ( = ?auto_201067 ?auto_201066 ) ) ( not ( = ?auto_201067 ?auto_201065 ) ) ( not ( = ?auto_201067 ?auto_201064 ) ) ( not ( = ?auto_201060 ?auto_201068 ) ) ( not ( = ?auto_201060 ?auto_201067 ) ) ( not ( = ?auto_201061 ?auto_201068 ) ) ( not ( = ?auto_201061 ?auto_201067 ) ) ( not ( = ?auto_201062 ?auto_201068 ) ) ( not ( = ?auto_201062 ?auto_201067 ) ) ( not ( = ?auto_201063 ?auto_201068 ) ) ( not ( = ?auto_201063 ?auto_201067 ) ) ( ON ?auto_201063 ?auto_201064 ) ( ON ?auto_201062 ?auto_201063 ) ( ON ?auto_201061 ?auto_201062 ) ( ON ?auto_201060 ?auto_201061 ) ( CLEAR ?auto_201060 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_201068 ?auto_201067 ?auto_201066 ?auto_201065 ?auto_201064 ?auto_201063 ?auto_201062 ?auto_201061 )
      ( MAKE-6PILE ?auto_201060 ?auto_201061 ?auto_201062 ?auto_201063 ?auto_201064 ?auto_201065 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_201071 - BLOCK
      ?auto_201072 - BLOCK
    )
    :vars
    (
      ?auto_201073 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_201073 ?auto_201072 ) ( CLEAR ?auto_201073 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_201071 ) ( ON ?auto_201072 ?auto_201071 ) ( not ( = ?auto_201071 ?auto_201072 ) ) ( not ( = ?auto_201071 ?auto_201073 ) ) ( not ( = ?auto_201072 ?auto_201073 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_201073 ?auto_201072 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_201074 - BLOCK
      ?auto_201075 - BLOCK
    )
    :vars
    (
      ?auto_201076 - BLOCK
      ?auto_201077 - BLOCK
      ?auto_201078 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_201076 ?auto_201075 ) ( CLEAR ?auto_201076 ) ( ON-TABLE ?auto_201074 ) ( ON ?auto_201075 ?auto_201074 ) ( not ( = ?auto_201074 ?auto_201075 ) ) ( not ( = ?auto_201074 ?auto_201076 ) ) ( not ( = ?auto_201075 ?auto_201076 ) ) ( HOLDING ?auto_201077 ) ( CLEAR ?auto_201078 ) ( not ( = ?auto_201074 ?auto_201077 ) ) ( not ( = ?auto_201074 ?auto_201078 ) ) ( not ( = ?auto_201075 ?auto_201077 ) ) ( not ( = ?auto_201075 ?auto_201078 ) ) ( not ( = ?auto_201076 ?auto_201077 ) ) ( not ( = ?auto_201076 ?auto_201078 ) ) ( not ( = ?auto_201077 ?auto_201078 ) ) )
    :subtasks
    ( ( !STACK ?auto_201077 ?auto_201078 )
      ( MAKE-2PILE ?auto_201074 ?auto_201075 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_201079 - BLOCK
      ?auto_201080 - BLOCK
    )
    :vars
    (
      ?auto_201083 - BLOCK
      ?auto_201081 - BLOCK
      ?auto_201082 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_201083 ?auto_201080 ) ( ON-TABLE ?auto_201079 ) ( ON ?auto_201080 ?auto_201079 ) ( not ( = ?auto_201079 ?auto_201080 ) ) ( not ( = ?auto_201079 ?auto_201083 ) ) ( not ( = ?auto_201080 ?auto_201083 ) ) ( CLEAR ?auto_201081 ) ( not ( = ?auto_201079 ?auto_201082 ) ) ( not ( = ?auto_201079 ?auto_201081 ) ) ( not ( = ?auto_201080 ?auto_201082 ) ) ( not ( = ?auto_201080 ?auto_201081 ) ) ( not ( = ?auto_201083 ?auto_201082 ) ) ( not ( = ?auto_201083 ?auto_201081 ) ) ( not ( = ?auto_201082 ?auto_201081 ) ) ( ON ?auto_201082 ?auto_201083 ) ( CLEAR ?auto_201082 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_201079 ?auto_201080 ?auto_201083 )
      ( MAKE-2PILE ?auto_201079 ?auto_201080 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_201084 - BLOCK
      ?auto_201085 - BLOCK
    )
    :vars
    (
      ?auto_201088 - BLOCK
      ?auto_201086 - BLOCK
      ?auto_201087 - BLOCK
      ?auto_201089 - BLOCK
      ?auto_201092 - BLOCK
      ?auto_201091 - BLOCK
      ?auto_201090 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_201088 ?auto_201085 ) ( ON-TABLE ?auto_201084 ) ( ON ?auto_201085 ?auto_201084 ) ( not ( = ?auto_201084 ?auto_201085 ) ) ( not ( = ?auto_201084 ?auto_201088 ) ) ( not ( = ?auto_201085 ?auto_201088 ) ) ( not ( = ?auto_201084 ?auto_201086 ) ) ( not ( = ?auto_201084 ?auto_201087 ) ) ( not ( = ?auto_201085 ?auto_201086 ) ) ( not ( = ?auto_201085 ?auto_201087 ) ) ( not ( = ?auto_201088 ?auto_201086 ) ) ( not ( = ?auto_201088 ?auto_201087 ) ) ( not ( = ?auto_201086 ?auto_201087 ) ) ( ON ?auto_201086 ?auto_201088 ) ( CLEAR ?auto_201086 ) ( HOLDING ?auto_201087 ) ( CLEAR ?auto_201089 ) ( ON-TABLE ?auto_201092 ) ( ON ?auto_201091 ?auto_201092 ) ( ON ?auto_201090 ?auto_201091 ) ( ON ?auto_201089 ?auto_201090 ) ( not ( = ?auto_201092 ?auto_201091 ) ) ( not ( = ?auto_201092 ?auto_201090 ) ) ( not ( = ?auto_201092 ?auto_201089 ) ) ( not ( = ?auto_201092 ?auto_201087 ) ) ( not ( = ?auto_201091 ?auto_201090 ) ) ( not ( = ?auto_201091 ?auto_201089 ) ) ( not ( = ?auto_201091 ?auto_201087 ) ) ( not ( = ?auto_201090 ?auto_201089 ) ) ( not ( = ?auto_201090 ?auto_201087 ) ) ( not ( = ?auto_201089 ?auto_201087 ) ) ( not ( = ?auto_201084 ?auto_201089 ) ) ( not ( = ?auto_201084 ?auto_201092 ) ) ( not ( = ?auto_201084 ?auto_201091 ) ) ( not ( = ?auto_201084 ?auto_201090 ) ) ( not ( = ?auto_201085 ?auto_201089 ) ) ( not ( = ?auto_201085 ?auto_201092 ) ) ( not ( = ?auto_201085 ?auto_201091 ) ) ( not ( = ?auto_201085 ?auto_201090 ) ) ( not ( = ?auto_201088 ?auto_201089 ) ) ( not ( = ?auto_201088 ?auto_201092 ) ) ( not ( = ?auto_201088 ?auto_201091 ) ) ( not ( = ?auto_201088 ?auto_201090 ) ) ( not ( = ?auto_201086 ?auto_201089 ) ) ( not ( = ?auto_201086 ?auto_201092 ) ) ( not ( = ?auto_201086 ?auto_201091 ) ) ( not ( = ?auto_201086 ?auto_201090 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_201092 ?auto_201091 ?auto_201090 ?auto_201089 ?auto_201087 )
      ( MAKE-2PILE ?auto_201084 ?auto_201085 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_201093 - BLOCK
      ?auto_201094 - BLOCK
    )
    :vars
    (
      ?auto_201099 - BLOCK
      ?auto_201097 - BLOCK
      ?auto_201100 - BLOCK
      ?auto_201095 - BLOCK
      ?auto_201101 - BLOCK
      ?auto_201096 - BLOCK
      ?auto_201098 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_201099 ?auto_201094 ) ( ON-TABLE ?auto_201093 ) ( ON ?auto_201094 ?auto_201093 ) ( not ( = ?auto_201093 ?auto_201094 ) ) ( not ( = ?auto_201093 ?auto_201099 ) ) ( not ( = ?auto_201094 ?auto_201099 ) ) ( not ( = ?auto_201093 ?auto_201097 ) ) ( not ( = ?auto_201093 ?auto_201100 ) ) ( not ( = ?auto_201094 ?auto_201097 ) ) ( not ( = ?auto_201094 ?auto_201100 ) ) ( not ( = ?auto_201099 ?auto_201097 ) ) ( not ( = ?auto_201099 ?auto_201100 ) ) ( not ( = ?auto_201097 ?auto_201100 ) ) ( ON ?auto_201097 ?auto_201099 ) ( CLEAR ?auto_201095 ) ( ON-TABLE ?auto_201101 ) ( ON ?auto_201096 ?auto_201101 ) ( ON ?auto_201098 ?auto_201096 ) ( ON ?auto_201095 ?auto_201098 ) ( not ( = ?auto_201101 ?auto_201096 ) ) ( not ( = ?auto_201101 ?auto_201098 ) ) ( not ( = ?auto_201101 ?auto_201095 ) ) ( not ( = ?auto_201101 ?auto_201100 ) ) ( not ( = ?auto_201096 ?auto_201098 ) ) ( not ( = ?auto_201096 ?auto_201095 ) ) ( not ( = ?auto_201096 ?auto_201100 ) ) ( not ( = ?auto_201098 ?auto_201095 ) ) ( not ( = ?auto_201098 ?auto_201100 ) ) ( not ( = ?auto_201095 ?auto_201100 ) ) ( not ( = ?auto_201093 ?auto_201095 ) ) ( not ( = ?auto_201093 ?auto_201101 ) ) ( not ( = ?auto_201093 ?auto_201096 ) ) ( not ( = ?auto_201093 ?auto_201098 ) ) ( not ( = ?auto_201094 ?auto_201095 ) ) ( not ( = ?auto_201094 ?auto_201101 ) ) ( not ( = ?auto_201094 ?auto_201096 ) ) ( not ( = ?auto_201094 ?auto_201098 ) ) ( not ( = ?auto_201099 ?auto_201095 ) ) ( not ( = ?auto_201099 ?auto_201101 ) ) ( not ( = ?auto_201099 ?auto_201096 ) ) ( not ( = ?auto_201099 ?auto_201098 ) ) ( not ( = ?auto_201097 ?auto_201095 ) ) ( not ( = ?auto_201097 ?auto_201101 ) ) ( not ( = ?auto_201097 ?auto_201096 ) ) ( not ( = ?auto_201097 ?auto_201098 ) ) ( ON ?auto_201100 ?auto_201097 ) ( CLEAR ?auto_201100 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_201093 ?auto_201094 ?auto_201099 ?auto_201097 )
      ( MAKE-2PILE ?auto_201093 ?auto_201094 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_201102 - BLOCK
      ?auto_201103 - BLOCK
    )
    :vars
    (
      ?auto_201109 - BLOCK
      ?auto_201104 - BLOCK
      ?auto_201105 - BLOCK
      ?auto_201108 - BLOCK
      ?auto_201110 - BLOCK
      ?auto_201107 - BLOCK
      ?auto_201106 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_201109 ?auto_201103 ) ( ON-TABLE ?auto_201102 ) ( ON ?auto_201103 ?auto_201102 ) ( not ( = ?auto_201102 ?auto_201103 ) ) ( not ( = ?auto_201102 ?auto_201109 ) ) ( not ( = ?auto_201103 ?auto_201109 ) ) ( not ( = ?auto_201102 ?auto_201104 ) ) ( not ( = ?auto_201102 ?auto_201105 ) ) ( not ( = ?auto_201103 ?auto_201104 ) ) ( not ( = ?auto_201103 ?auto_201105 ) ) ( not ( = ?auto_201109 ?auto_201104 ) ) ( not ( = ?auto_201109 ?auto_201105 ) ) ( not ( = ?auto_201104 ?auto_201105 ) ) ( ON ?auto_201104 ?auto_201109 ) ( ON-TABLE ?auto_201108 ) ( ON ?auto_201110 ?auto_201108 ) ( ON ?auto_201107 ?auto_201110 ) ( not ( = ?auto_201108 ?auto_201110 ) ) ( not ( = ?auto_201108 ?auto_201107 ) ) ( not ( = ?auto_201108 ?auto_201106 ) ) ( not ( = ?auto_201108 ?auto_201105 ) ) ( not ( = ?auto_201110 ?auto_201107 ) ) ( not ( = ?auto_201110 ?auto_201106 ) ) ( not ( = ?auto_201110 ?auto_201105 ) ) ( not ( = ?auto_201107 ?auto_201106 ) ) ( not ( = ?auto_201107 ?auto_201105 ) ) ( not ( = ?auto_201106 ?auto_201105 ) ) ( not ( = ?auto_201102 ?auto_201106 ) ) ( not ( = ?auto_201102 ?auto_201108 ) ) ( not ( = ?auto_201102 ?auto_201110 ) ) ( not ( = ?auto_201102 ?auto_201107 ) ) ( not ( = ?auto_201103 ?auto_201106 ) ) ( not ( = ?auto_201103 ?auto_201108 ) ) ( not ( = ?auto_201103 ?auto_201110 ) ) ( not ( = ?auto_201103 ?auto_201107 ) ) ( not ( = ?auto_201109 ?auto_201106 ) ) ( not ( = ?auto_201109 ?auto_201108 ) ) ( not ( = ?auto_201109 ?auto_201110 ) ) ( not ( = ?auto_201109 ?auto_201107 ) ) ( not ( = ?auto_201104 ?auto_201106 ) ) ( not ( = ?auto_201104 ?auto_201108 ) ) ( not ( = ?auto_201104 ?auto_201110 ) ) ( not ( = ?auto_201104 ?auto_201107 ) ) ( ON ?auto_201105 ?auto_201104 ) ( CLEAR ?auto_201105 ) ( HOLDING ?auto_201106 ) ( CLEAR ?auto_201107 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_201108 ?auto_201110 ?auto_201107 ?auto_201106 )
      ( MAKE-2PILE ?auto_201102 ?auto_201103 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_201111 - BLOCK
      ?auto_201112 - BLOCK
    )
    :vars
    (
      ?auto_201119 - BLOCK
      ?auto_201117 - BLOCK
      ?auto_201118 - BLOCK
      ?auto_201116 - BLOCK
      ?auto_201113 - BLOCK
      ?auto_201115 - BLOCK
      ?auto_201114 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_201119 ?auto_201112 ) ( ON-TABLE ?auto_201111 ) ( ON ?auto_201112 ?auto_201111 ) ( not ( = ?auto_201111 ?auto_201112 ) ) ( not ( = ?auto_201111 ?auto_201119 ) ) ( not ( = ?auto_201112 ?auto_201119 ) ) ( not ( = ?auto_201111 ?auto_201117 ) ) ( not ( = ?auto_201111 ?auto_201118 ) ) ( not ( = ?auto_201112 ?auto_201117 ) ) ( not ( = ?auto_201112 ?auto_201118 ) ) ( not ( = ?auto_201119 ?auto_201117 ) ) ( not ( = ?auto_201119 ?auto_201118 ) ) ( not ( = ?auto_201117 ?auto_201118 ) ) ( ON ?auto_201117 ?auto_201119 ) ( ON-TABLE ?auto_201116 ) ( ON ?auto_201113 ?auto_201116 ) ( ON ?auto_201115 ?auto_201113 ) ( not ( = ?auto_201116 ?auto_201113 ) ) ( not ( = ?auto_201116 ?auto_201115 ) ) ( not ( = ?auto_201116 ?auto_201114 ) ) ( not ( = ?auto_201116 ?auto_201118 ) ) ( not ( = ?auto_201113 ?auto_201115 ) ) ( not ( = ?auto_201113 ?auto_201114 ) ) ( not ( = ?auto_201113 ?auto_201118 ) ) ( not ( = ?auto_201115 ?auto_201114 ) ) ( not ( = ?auto_201115 ?auto_201118 ) ) ( not ( = ?auto_201114 ?auto_201118 ) ) ( not ( = ?auto_201111 ?auto_201114 ) ) ( not ( = ?auto_201111 ?auto_201116 ) ) ( not ( = ?auto_201111 ?auto_201113 ) ) ( not ( = ?auto_201111 ?auto_201115 ) ) ( not ( = ?auto_201112 ?auto_201114 ) ) ( not ( = ?auto_201112 ?auto_201116 ) ) ( not ( = ?auto_201112 ?auto_201113 ) ) ( not ( = ?auto_201112 ?auto_201115 ) ) ( not ( = ?auto_201119 ?auto_201114 ) ) ( not ( = ?auto_201119 ?auto_201116 ) ) ( not ( = ?auto_201119 ?auto_201113 ) ) ( not ( = ?auto_201119 ?auto_201115 ) ) ( not ( = ?auto_201117 ?auto_201114 ) ) ( not ( = ?auto_201117 ?auto_201116 ) ) ( not ( = ?auto_201117 ?auto_201113 ) ) ( not ( = ?auto_201117 ?auto_201115 ) ) ( ON ?auto_201118 ?auto_201117 ) ( CLEAR ?auto_201115 ) ( ON ?auto_201114 ?auto_201118 ) ( CLEAR ?auto_201114 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_201111 ?auto_201112 ?auto_201119 ?auto_201117 ?auto_201118 )
      ( MAKE-2PILE ?auto_201111 ?auto_201112 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_201120 - BLOCK
      ?auto_201121 - BLOCK
    )
    :vars
    (
      ?auto_201122 - BLOCK
      ?auto_201125 - BLOCK
      ?auto_201123 - BLOCK
      ?auto_201124 - BLOCK
      ?auto_201127 - BLOCK
      ?auto_201128 - BLOCK
      ?auto_201126 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_201122 ?auto_201121 ) ( ON-TABLE ?auto_201120 ) ( ON ?auto_201121 ?auto_201120 ) ( not ( = ?auto_201120 ?auto_201121 ) ) ( not ( = ?auto_201120 ?auto_201122 ) ) ( not ( = ?auto_201121 ?auto_201122 ) ) ( not ( = ?auto_201120 ?auto_201125 ) ) ( not ( = ?auto_201120 ?auto_201123 ) ) ( not ( = ?auto_201121 ?auto_201125 ) ) ( not ( = ?auto_201121 ?auto_201123 ) ) ( not ( = ?auto_201122 ?auto_201125 ) ) ( not ( = ?auto_201122 ?auto_201123 ) ) ( not ( = ?auto_201125 ?auto_201123 ) ) ( ON ?auto_201125 ?auto_201122 ) ( ON-TABLE ?auto_201124 ) ( ON ?auto_201127 ?auto_201124 ) ( not ( = ?auto_201124 ?auto_201127 ) ) ( not ( = ?auto_201124 ?auto_201128 ) ) ( not ( = ?auto_201124 ?auto_201126 ) ) ( not ( = ?auto_201124 ?auto_201123 ) ) ( not ( = ?auto_201127 ?auto_201128 ) ) ( not ( = ?auto_201127 ?auto_201126 ) ) ( not ( = ?auto_201127 ?auto_201123 ) ) ( not ( = ?auto_201128 ?auto_201126 ) ) ( not ( = ?auto_201128 ?auto_201123 ) ) ( not ( = ?auto_201126 ?auto_201123 ) ) ( not ( = ?auto_201120 ?auto_201126 ) ) ( not ( = ?auto_201120 ?auto_201124 ) ) ( not ( = ?auto_201120 ?auto_201127 ) ) ( not ( = ?auto_201120 ?auto_201128 ) ) ( not ( = ?auto_201121 ?auto_201126 ) ) ( not ( = ?auto_201121 ?auto_201124 ) ) ( not ( = ?auto_201121 ?auto_201127 ) ) ( not ( = ?auto_201121 ?auto_201128 ) ) ( not ( = ?auto_201122 ?auto_201126 ) ) ( not ( = ?auto_201122 ?auto_201124 ) ) ( not ( = ?auto_201122 ?auto_201127 ) ) ( not ( = ?auto_201122 ?auto_201128 ) ) ( not ( = ?auto_201125 ?auto_201126 ) ) ( not ( = ?auto_201125 ?auto_201124 ) ) ( not ( = ?auto_201125 ?auto_201127 ) ) ( not ( = ?auto_201125 ?auto_201128 ) ) ( ON ?auto_201123 ?auto_201125 ) ( ON ?auto_201126 ?auto_201123 ) ( CLEAR ?auto_201126 ) ( HOLDING ?auto_201128 ) ( CLEAR ?auto_201127 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_201124 ?auto_201127 ?auto_201128 )
      ( MAKE-2PILE ?auto_201120 ?auto_201121 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_201129 - BLOCK
      ?auto_201130 - BLOCK
    )
    :vars
    (
      ?auto_201136 - BLOCK
      ?auto_201131 - BLOCK
      ?auto_201133 - BLOCK
      ?auto_201135 - BLOCK
      ?auto_201137 - BLOCK
      ?auto_201134 - BLOCK
      ?auto_201132 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_201136 ?auto_201130 ) ( ON-TABLE ?auto_201129 ) ( ON ?auto_201130 ?auto_201129 ) ( not ( = ?auto_201129 ?auto_201130 ) ) ( not ( = ?auto_201129 ?auto_201136 ) ) ( not ( = ?auto_201130 ?auto_201136 ) ) ( not ( = ?auto_201129 ?auto_201131 ) ) ( not ( = ?auto_201129 ?auto_201133 ) ) ( not ( = ?auto_201130 ?auto_201131 ) ) ( not ( = ?auto_201130 ?auto_201133 ) ) ( not ( = ?auto_201136 ?auto_201131 ) ) ( not ( = ?auto_201136 ?auto_201133 ) ) ( not ( = ?auto_201131 ?auto_201133 ) ) ( ON ?auto_201131 ?auto_201136 ) ( ON-TABLE ?auto_201135 ) ( ON ?auto_201137 ?auto_201135 ) ( not ( = ?auto_201135 ?auto_201137 ) ) ( not ( = ?auto_201135 ?auto_201134 ) ) ( not ( = ?auto_201135 ?auto_201132 ) ) ( not ( = ?auto_201135 ?auto_201133 ) ) ( not ( = ?auto_201137 ?auto_201134 ) ) ( not ( = ?auto_201137 ?auto_201132 ) ) ( not ( = ?auto_201137 ?auto_201133 ) ) ( not ( = ?auto_201134 ?auto_201132 ) ) ( not ( = ?auto_201134 ?auto_201133 ) ) ( not ( = ?auto_201132 ?auto_201133 ) ) ( not ( = ?auto_201129 ?auto_201132 ) ) ( not ( = ?auto_201129 ?auto_201135 ) ) ( not ( = ?auto_201129 ?auto_201137 ) ) ( not ( = ?auto_201129 ?auto_201134 ) ) ( not ( = ?auto_201130 ?auto_201132 ) ) ( not ( = ?auto_201130 ?auto_201135 ) ) ( not ( = ?auto_201130 ?auto_201137 ) ) ( not ( = ?auto_201130 ?auto_201134 ) ) ( not ( = ?auto_201136 ?auto_201132 ) ) ( not ( = ?auto_201136 ?auto_201135 ) ) ( not ( = ?auto_201136 ?auto_201137 ) ) ( not ( = ?auto_201136 ?auto_201134 ) ) ( not ( = ?auto_201131 ?auto_201132 ) ) ( not ( = ?auto_201131 ?auto_201135 ) ) ( not ( = ?auto_201131 ?auto_201137 ) ) ( not ( = ?auto_201131 ?auto_201134 ) ) ( ON ?auto_201133 ?auto_201131 ) ( ON ?auto_201132 ?auto_201133 ) ( CLEAR ?auto_201137 ) ( ON ?auto_201134 ?auto_201132 ) ( CLEAR ?auto_201134 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_201129 ?auto_201130 ?auto_201136 ?auto_201131 ?auto_201133 ?auto_201132 )
      ( MAKE-2PILE ?auto_201129 ?auto_201130 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_201138 - BLOCK
      ?auto_201139 - BLOCK
    )
    :vars
    (
      ?auto_201141 - BLOCK
      ?auto_201140 - BLOCK
      ?auto_201144 - BLOCK
      ?auto_201145 - BLOCK
      ?auto_201142 - BLOCK
      ?auto_201143 - BLOCK
      ?auto_201146 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_201141 ?auto_201139 ) ( ON-TABLE ?auto_201138 ) ( ON ?auto_201139 ?auto_201138 ) ( not ( = ?auto_201138 ?auto_201139 ) ) ( not ( = ?auto_201138 ?auto_201141 ) ) ( not ( = ?auto_201139 ?auto_201141 ) ) ( not ( = ?auto_201138 ?auto_201140 ) ) ( not ( = ?auto_201138 ?auto_201144 ) ) ( not ( = ?auto_201139 ?auto_201140 ) ) ( not ( = ?auto_201139 ?auto_201144 ) ) ( not ( = ?auto_201141 ?auto_201140 ) ) ( not ( = ?auto_201141 ?auto_201144 ) ) ( not ( = ?auto_201140 ?auto_201144 ) ) ( ON ?auto_201140 ?auto_201141 ) ( ON-TABLE ?auto_201145 ) ( not ( = ?auto_201145 ?auto_201142 ) ) ( not ( = ?auto_201145 ?auto_201143 ) ) ( not ( = ?auto_201145 ?auto_201146 ) ) ( not ( = ?auto_201145 ?auto_201144 ) ) ( not ( = ?auto_201142 ?auto_201143 ) ) ( not ( = ?auto_201142 ?auto_201146 ) ) ( not ( = ?auto_201142 ?auto_201144 ) ) ( not ( = ?auto_201143 ?auto_201146 ) ) ( not ( = ?auto_201143 ?auto_201144 ) ) ( not ( = ?auto_201146 ?auto_201144 ) ) ( not ( = ?auto_201138 ?auto_201146 ) ) ( not ( = ?auto_201138 ?auto_201145 ) ) ( not ( = ?auto_201138 ?auto_201142 ) ) ( not ( = ?auto_201138 ?auto_201143 ) ) ( not ( = ?auto_201139 ?auto_201146 ) ) ( not ( = ?auto_201139 ?auto_201145 ) ) ( not ( = ?auto_201139 ?auto_201142 ) ) ( not ( = ?auto_201139 ?auto_201143 ) ) ( not ( = ?auto_201141 ?auto_201146 ) ) ( not ( = ?auto_201141 ?auto_201145 ) ) ( not ( = ?auto_201141 ?auto_201142 ) ) ( not ( = ?auto_201141 ?auto_201143 ) ) ( not ( = ?auto_201140 ?auto_201146 ) ) ( not ( = ?auto_201140 ?auto_201145 ) ) ( not ( = ?auto_201140 ?auto_201142 ) ) ( not ( = ?auto_201140 ?auto_201143 ) ) ( ON ?auto_201144 ?auto_201140 ) ( ON ?auto_201146 ?auto_201144 ) ( ON ?auto_201143 ?auto_201146 ) ( CLEAR ?auto_201143 ) ( HOLDING ?auto_201142 ) ( CLEAR ?auto_201145 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_201145 ?auto_201142 )
      ( MAKE-2PILE ?auto_201138 ?auto_201139 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_201147 - BLOCK
      ?auto_201148 - BLOCK
    )
    :vars
    (
      ?auto_201152 - BLOCK
      ?auto_201155 - BLOCK
      ?auto_201151 - BLOCK
      ?auto_201154 - BLOCK
      ?auto_201149 - BLOCK
      ?auto_201153 - BLOCK
      ?auto_201150 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_201152 ?auto_201148 ) ( ON-TABLE ?auto_201147 ) ( ON ?auto_201148 ?auto_201147 ) ( not ( = ?auto_201147 ?auto_201148 ) ) ( not ( = ?auto_201147 ?auto_201152 ) ) ( not ( = ?auto_201148 ?auto_201152 ) ) ( not ( = ?auto_201147 ?auto_201155 ) ) ( not ( = ?auto_201147 ?auto_201151 ) ) ( not ( = ?auto_201148 ?auto_201155 ) ) ( not ( = ?auto_201148 ?auto_201151 ) ) ( not ( = ?auto_201152 ?auto_201155 ) ) ( not ( = ?auto_201152 ?auto_201151 ) ) ( not ( = ?auto_201155 ?auto_201151 ) ) ( ON ?auto_201155 ?auto_201152 ) ( ON-TABLE ?auto_201154 ) ( not ( = ?auto_201154 ?auto_201149 ) ) ( not ( = ?auto_201154 ?auto_201153 ) ) ( not ( = ?auto_201154 ?auto_201150 ) ) ( not ( = ?auto_201154 ?auto_201151 ) ) ( not ( = ?auto_201149 ?auto_201153 ) ) ( not ( = ?auto_201149 ?auto_201150 ) ) ( not ( = ?auto_201149 ?auto_201151 ) ) ( not ( = ?auto_201153 ?auto_201150 ) ) ( not ( = ?auto_201153 ?auto_201151 ) ) ( not ( = ?auto_201150 ?auto_201151 ) ) ( not ( = ?auto_201147 ?auto_201150 ) ) ( not ( = ?auto_201147 ?auto_201154 ) ) ( not ( = ?auto_201147 ?auto_201149 ) ) ( not ( = ?auto_201147 ?auto_201153 ) ) ( not ( = ?auto_201148 ?auto_201150 ) ) ( not ( = ?auto_201148 ?auto_201154 ) ) ( not ( = ?auto_201148 ?auto_201149 ) ) ( not ( = ?auto_201148 ?auto_201153 ) ) ( not ( = ?auto_201152 ?auto_201150 ) ) ( not ( = ?auto_201152 ?auto_201154 ) ) ( not ( = ?auto_201152 ?auto_201149 ) ) ( not ( = ?auto_201152 ?auto_201153 ) ) ( not ( = ?auto_201155 ?auto_201150 ) ) ( not ( = ?auto_201155 ?auto_201154 ) ) ( not ( = ?auto_201155 ?auto_201149 ) ) ( not ( = ?auto_201155 ?auto_201153 ) ) ( ON ?auto_201151 ?auto_201155 ) ( ON ?auto_201150 ?auto_201151 ) ( ON ?auto_201153 ?auto_201150 ) ( CLEAR ?auto_201154 ) ( ON ?auto_201149 ?auto_201153 ) ( CLEAR ?auto_201149 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_201147 ?auto_201148 ?auto_201152 ?auto_201155 ?auto_201151 ?auto_201150 ?auto_201153 )
      ( MAKE-2PILE ?auto_201147 ?auto_201148 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_201156 - BLOCK
      ?auto_201157 - BLOCK
    )
    :vars
    (
      ?auto_201162 - BLOCK
      ?auto_201161 - BLOCK
      ?auto_201159 - BLOCK
      ?auto_201158 - BLOCK
      ?auto_201164 - BLOCK
      ?auto_201160 - BLOCK
      ?auto_201163 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_201162 ?auto_201157 ) ( ON-TABLE ?auto_201156 ) ( ON ?auto_201157 ?auto_201156 ) ( not ( = ?auto_201156 ?auto_201157 ) ) ( not ( = ?auto_201156 ?auto_201162 ) ) ( not ( = ?auto_201157 ?auto_201162 ) ) ( not ( = ?auto_201156 ?auto_201161 ) ) ( not ( = ?auto_201156 ?auto_201159 ) ) ( not ( = ?auto_201157 ?auto_201161 ) ) ( not ( = ?auto_201157 ?auto_201159 ) ) ( not ( = ?auto_201162 ?auto_201161 ) ) ( not ( = ?auto_201162 ?auto_201159 ) ) ( not ( = ?auto_201161 ?auto_201159 ) ) ( ON ?auto_201161 ?auto_201162 ) ( not ( = ?auto_201158 ?auto_201164 ) ) ( not ( = ?auto_201158 ?auto_201160 ) ) ( not ( = ?auto_201158 ?auto_201163 ) ) ( not ( = ?auto_201158 ?auto_201159 ) ) ( not ( = ?auto_201164 ?auto_201160 ) ) ( not ( = ?auto_201164 ?auto_201163 ) ) ( not ( = ?auto_201164 ?auto_201159 ) ) ( not ( = ?auto_201160 ?auto_201163 ) ) ( not ( = ?auto_201160 ?auto_201159 ) ) ( not ( = ?auto_201163 ?auto_201159 ) ) ( not ( = ?auto_201156 ?auto_201163 ) ) ( not ( = ?auto_201156 ?auto_201158 ) ) ( not ( = ?auto_201156 ?auto_201164 ) ) ( not ( = ?auto_201156 ?auto_201160 ) ) ( not ( = ?auto_201157 ?auto_201163 ) ) ( not ( = ?auto_201157 ?auto_201158 ) ) ( not ( = ?auto_201157 ?auto_201164 ) ) ( not ( = ?auto_201157 ?auto_201160 ) ) ( not ( = ?auto_201162 ?auto_201163 ) ) ( not ( = ?auto_201162 ?auto_201158 ) ) ( not ( = ?auto_201162 ?auto_201164 ) ) ( not ( = ?auto_201162 ?auto_201160 ) ) ( not ( = ?auto_201161 ?auto_201163 ) ) ( not ( = ?auto_201161 ?auto_201158 ) ) ( not ( = ?auto_201161 ?auto_201164 ) ) ( not ( = ?auto_201161 ?auto_201160 ) ) ( ON ?auto_201159 ?auto_201161 ) ( ON ?auto_201163 ?auto_201159 ) ( ON ?auto_201160 ?auto_201163 ) ( ON ?auto_201164 ?auto_201160 ) ( CLEAR ?auto_201164 ) ( HOLDING ?auto_201158 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_201158 )
      ( MAKE-2PILE ?auto_201156 ?auto_201157 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_201165 - BLOCK
      ?auto_201166 - BLOCK
    )
    :vars
    (
      ?auto_201172 - BLOCK
      ?auto_201173 - BLOCK
      ?auto_201167 - BLOCK
      ?auto_201170 - BLOCK
      ?auto_201171 - BLOCK
      ?auto_201169 - BLOCK
      ?auto_201168 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_201172 ?auto_201166 ) ( ON-TABLE ?auto_201165 ) ( ON ?auto_201166 ?auto_201165 ) ( not ( = ?auto_201165 ?auto_201166 ) ) ( not ( = ?auto_201165 ?auto_201172 ) ) ( not ( = ?auto_201166 ?auto_201172 ) ) ( not ( = ?auto_201165 ?auto_201173 ) ) ( not ( = ?auto_201165 ?auto_201167 ) ) ( not ( = ?auto_201166 ?auto_201173 ) ) ( not ( = ?auto_201166 ?auto_201167 ) ) ( not ( = ?auto_201172 ?auto_201173 ) ) ( not ( = ?auto_201172 ?auto_201167 ) ) ( not ( = ?auto_201173 ?auto_201167 ) ) ( ON ?auto_201173 ?auto_201172 ) ( not ( = ?auto_201170 ?auto_201171 ) ) ( not ( = ?auto_201170 ?auto_201169 ) ) ( not ( = ?auto_201170 ?auto_201168 ) ) ( not ( = ?auto_201170 ?auto_201167 ) ) ( not ( = ?auto_201171 ?auto_201169 ) ) ( not ( = ?auto_201171 ?auto_201168 ) ) ( not ( = ?auto_201171 ?auto_201167 ) ) ( not ( = ?auto_201169 ?auto_201168 ) ) ( not ( = ?auto_201169 ?auto_201167 ) ) ( not ( = ?auto_201168 ?auto_201167 ) ) ( not ( = ?auto_201165 ?auto_201168 ) ) ( not ( = ?auto_201165 ?auto_201170 ) ) ( not ( = ?auto_201165 ?auto_201171 ) ) ( not ( = ?auto_201165 ?auto_201169 ) ) ( not ( = ?auto_201166 ?auto_201168 ) ) ( not ( = ?auto_201166 ?auto_201170 ) ) ( not ( = ?auto_201166 ?auto_201171 ) ) ( not ( = ?auto_201166 ?auto_201169 ) ) ( not ( = ?auto_201172 ?auto_201168 ) ) ( not ( = ?auto_201172 ?auto_201170 ) ) ( not ( = ?auto_201172 ?auto_201171 ) ) ( not ( = ?auto_201172 ?auto_201169 ) ) ( not ( = ?auto_201173 ?auto_201168 ) ) ( not ( = ?auto_201173 ?auto_201170 ) ) ( not ( = ?auto_201173 ?auto_201171 ) ) ( not ( = ?auto_201173 ?auto_201169 ) ) ( ON ?auto_201167 ?auto_201173 ) ( ON ?auto_201168 ?auto_201167 ) ( ON ?auto_201169 ?auto_201168 ) ( ON ?auto_201171 ?auto_201169 ) ( ON ?auto_201170 ?auto_201171 ) ( CLEAR ?auto_201170 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_201165 ?auto_201166 ?auto_201172 ?auto_201173 ?auto_201167 ?auto_201168 ?auto_201169 ?auto_201171 )
      ( MAKE-2PILE ?auto_201165 ?auto_201166 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_201181 - BLOCK
      ?auto_201182 - BLOCK
      ?auto_201183 - BLOCK
      ?auto_201184 - BLOCK
      ?auto_201185 - BLOCK
      ?auto_201186 - BLOCK
      ?auto_201187 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_201187 ) ( CLEAR ?auto_201186 ) ( ON-TABLE ?auto_201181 ) ( ON ?auto_201182 ?auto_201181 ) ( ON ?auto_201183 ?auto_201182 ) ( ON ?auto_201184 ?auto_201183 ) ( ON ?auto_201185 ?auto_201184 ) ( ON ?auto_201186 ?auto_201185 ) ( not ( = ?auto_201181 ?auto_201182 ) ) ( not ( = ?auto_201181 ?auto_201183 ) ) ( not ( = ?auto_201181 ?auto_201184 ) ) ( not ( = ?auto_201181 ?auto_201185 ) ) ( not ( = ?auto_201181 ?auto_201186 ) ) ( not ( = ?auto_201181 ?auto_201187 ) ) ( not ( = ?auto_201182 ?auto_201183 ) ) ( not ( = ?auto_201182 ?auto_201184 ) ) ( not ( = ?auto_201182 ?auto_201185 ) ) ( not ( = ?auto_201182 ?auto_201186 ) ) ( not ( = ?auto_201182 ?auto_201187 ) ) ( not ( = ?auto_201183 ?auto_201184 ) ) ( not ( = ?auto_201183 ?auto_201185 ) ) ( not ( = ?auto_201183 ?auto_201186 ) ) ( not ( = ?auto_201183 ?auto_201187 ) ) ( not ( = ?auto_201184 ?auto_201185 ) ) ( not ( = ?auto_201184 ?auto_201186 ) ) ( not ( = ?auto_201184 ?auto_201187 ) ) ( not ( = ?auto_201185 ?auto_201186 ) ) ( not ( = ?auto_201185 ?auto_201187 ) ) ( not ( = ?auto_201186 ?auto_201187 ) ) )
    :subtasks
    ( ( !STACK ?auto_201187 ?auto_201186 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_201188 - BLOCK
      ?auto_201189 - BLOCK
      ?auto_201190 - BLOCK
      ?auto_201191 - BLOCK
      ?auto_201192 - BLOCK
      ?auto_201193 - BLOCK
      ?auto_201194 - BLOCK
    )
    :vars
    (
      ?auto_201195 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_201193 ) ( ON-TABLE ?auto_201188 ) ( ON ?auto_201189 ?auto_201188 ) ( ON ?auto_201190 ?auto_201189 ) ( ON ?auto_201191 ?auto_201190 ) ( ON ?auto_201192 ?auto_201191 ) ( ON ?auto_201193 ?auto_201192 ) ( not ( = ?auto_201188 ?auto_201189 ) ) ( not ( = ?auto_201188 ?auto_201190 ) ) ( not ( = ?auto_201188 ?auto_201191 ) ) ( not ( = ?auto_201188 ?auto_201192 ) ) ( not ( = ?auto_201188 ?auto_201193 ) ) ( not ( = ?auto_201188 ?auto_201194 ) ) ( not ( = ?auto_201189 ?auto_201190 ) ) ( not ( = ?auto_201189 ?auto_201191 ) ) ( not ( = ?auto_201189 ?auto_201192 ) ) ( not ( = ?auto_201189 ?auto_201193 ) ) ( not ( = ?auto_201189 ?auto_201194 ) ) ( not ( = ?auto_201190 ?auto_201191 ) ) ( not ( = ?auto_201190 ?auto_201192 ) ) ( not ( = ?auto_201190 ?auto_201193 ) ) ( not ( = ?auto_201190 ?auto_201194 ) ) ( not ( = ?auto_201191 ?auto_201192 ) ) ( not ( = ?auto_201191 ?auto_201193 ) ) ( not ( = ?auto_201191 ?auto_201194 ) ) ( not ( = ?auto_201192 ?auto_201193 ) ) ( not ( = ?auto_201192 ?auto_201194 ) ) ( not ( = ?auto_201193 ?auto_201194 ) ) ( ON ?auto_201194 ?auto_201195 ) ( CLEAR ?auto_201194 ) ( HAND-EMPTY ) ( not ( = ?auto_201188 ?auto_201195 ) ) ( not ( = ?auto_201189 ?auto_201195 ) ) ( not ( = ?auto_201190 ?auto_201195 ) ) ( not ( = ?auto_201191 ?auto_201195 ) ) ( not ( = ?auto_201192 ?auto_201195 ) ) ( not ( = ?auto_201193 ?auto_201195 ) ) ( not ( = ?auto_201194 ?auto_201195 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_201194 ?auto_201195 )
      ( MAKE-7PILE ?auto_201188 ?auto_201189 ?auto_201190 ?auto_201191 ?auto_201192 ?auto_201193 ?auto_201194 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_201196 - BLOCK
      ?auto_201197 - BLOCK
      ?auto_201198 - BLOCK
      ?auto_201199 - BLOCK
      ?auto_201200 - BLOCK
      ?auto_201201 - BLOCK
      ?auto_201202 - BLOCK
    )
    :vars
    (
      ?auto_201203 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_201196 ) ( ON ?auto_201197 ?auto_201196 ) ( ON ?auto_201198 ?auto_201197 ) ( ON ?auto_201199 ?auto_201198 ) ( ON ?auto_201200 ?auto_201199 ) ( not ( = ?auto_201196 ?auto_201197 ) ) ( not ( = ?auto_201196 ?auto_201198 ) ) ( not ( = ?auto_201196 ?auto_201199 ) ) ( not ( = ?auto_201196 ?auto_201200 ) ) ( not ( = ?auto_201196 ?auto_201201 ) ) ( not ( = ?auto_201196 ?auto_201202 ) ) ( not ( = ?auto_201197 ?auto_201198 ) ) ( not ( = ?auto_201197 ?auto_201199 ) ) ( not ( = ?auto_201197 ?auto_201200 ) ) ( not ( = ?auto_201197 ?auto_201201 ) ) ( not ( = ?auto_201197 ?auto_201202 ) ) ( not ( = ?auto_201198 ?auto_201199 ) ) ( not ( = ?auto_201198 ?auto_201200 ) ) ( not ( = ?auto_201198 ?auto_201201 ) ) ( not ( = ?auto_201198 ?auto_201202 ) ) ( not ( = ?auto_201199 ?auto_201200 ) ) ( not ( = ?auto_201199 ?auto_201201 ) ) ( not ( = ?auto_201199 ?auto_201202 ) ) ( not ( = ?auto_201200 ?auto_201201 ) ) ( not ( = ?auto_201200 ?auto_201202 ) ) ( not ( = ?auto_201201 ?auto_201202 ) ) ( ON ?auto_201202 ?auto_201203 ) ( CLEAR ?auto_201202 ) ( not ( = ?auto_201196 ?auto_201203 ) ) ( not ( = ?auto_201197 ?auto_201203 ) ) ( not ( = ?auto_201198 ?auto_201203 ) ) ( not ( = ?auto_201199 ?auto_201203 ) ) ( not ( = ?auto_201200 ?auto_201203 ) ) ( not ( = ?auto_201201 ?auto_201203 ) ) ( not ( = ?auto_201202 ?auto_201203 ) ) ( HOLDING ?auto_201201 ) ( CLEAR ?auto_201200 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_201196 ?auto_201197 ?auto_201198 ?auto_201199 ?auto_201200 ?auto_201201 )
      ( MAKE-7PILE ?auto_201196 ?auto_201197 ?auto_201198 ?auto_201199 ?auto_201200 ?auto_201201 ?auto_201202 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_201204 - BLOCK
      ?auto_201205 - BLOCK
      ?auto_201206 - BLOCK
      ?auto_201207 - BLOCK
      ?auto_201208 - BLOCK
      ?auto_201209 - BLOCK
      ?auto_201210 - BLOCK
    )
    :vars
    (
      ?auto_201211 - BLOCK
      ?auto_201212 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_201204 ) ( ON ?auto_201205 ?auto_201204 ) ( ON ?auto_201206 ?auto_201205 ) ( ON ?auto_201207 ?auto_201206 ) ( ON ?auto_201208 ?auto_201207 ) ( not ( = ?auto_201204 ?auto_201205 ) ) ( not ( = ?auto_201204 ?auto_201206 ) ) ( not ( = ?auto_201204 ?auto_201207 ) ) ( not ( = ?auto_201204 ?auto_201208 ) ) ( not ( = ?auto_201204 ?auto_201209 ) ) ( not ( = ?auto_201204 ?auto_201210 ) ) ( not ( = ?auto_201205 ?auto_201206 ) ) ( not ( = ?auto_201205 ?auto_201207 ) ) ( not ( = ?auto_201205 ?auto_201208 ) ) ( not ( = ?auto_201205 ?auto_201209 ) ) ( not ( = ?auto_201205 ?auto_201210 ) ) ( not ( = ?auto_201206 ?auto_201207 ) ) ( not ( = ?auto_201206 ?auto_201208 ) ) ( not ( = ?auto_201206 ?auto_201209 ) ) ( not ( = ?auto_201206 ?auto_201210 ) ) ( not ( = ?auto_201207 ?auto_201208 ) ) ( not ( = ?auto_201207 ?auto_201209 ) ) ( not ( = ?auto_201207 ?auto_201210 ) ) ( not ( = ?auto_201208 ?auto_201209 ) ) ( not ( = ?auto_201208 ?auto_201210 ) ) ( not ( = ?auto_201209 ?auto_201210 ) ) ( ON ?auto_201210 ?auto_201211 ) ( not ( = ?auto_201204 ?auto_201211 ) ) ( not ( = ?auto_201205 ?auto_201211 ) ) ( not ( = ?auto_201206 ?auto_201211 ) ) ( not ( = ?auto_201207 ?auto_201211 ) ) ( not ( = ?auto_201208 ?auto_201211 ) ) ( not ( = ?auto_201209 ?auto_201211 ) ) ( not ( = ?auto_201210 ?auto_201211 ) ) ( CLEAR ?auto_201208 ) ( ON ?auto_201209 ?auto_201210 ) ( CLEAR ?auto_201209 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_201212 ) ( ON ?auto_201211 ?auto_201212 ) ( not ( = ?auto_201212 ?auto_201211 ) ) ( not ( = ?auto_201212 ?auto_201210 ) ) ( not ( = ?auto_201212 ?auto_201209 ) ) ( not ( = ?auto_201204 ?auto_201212 ) ) ( not ( = ?auto_201205 ?auto_201212 ) ) ( not ( = ?auto_201206 ?auto_201212 ) ) ( not ( = ?auto_201207 ?auto_201212 ) ) ( not ( = ?auto_201208 ?auto_201212 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_201212 ?auto_201211 ?auto_201210 )
      ( MAKE-7PILE ?auto_201204 ?auto_201205 ?auto_201206 ?auto_201207 ?auto_201208 ?auto_201209 ?auto_201210 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_201213 - BLOCK
      ?auto_201214 - BLOCK
      ?auto_201215 - BLOCK
      ?auto_201216 - BLOCK
      ?auto_201217 - BLOCK
      ?auto_201218 - BLOCK
      ?auto_201219 - BLOCK
    )
    :vars
    (
      ?auto_201221 - BLOCK
      ?auto_201220 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_201213 ) ( ON ?auto_201214 ?auto_201213 ) ( ON ?auto_201215 ?auto_201214 ) ( ON ?auto_201216 ?auto_201215 ) ( not ( = ?auto_201213 ?auto_201214 ) ) ( not ( = ?auto_201213 ?auto_201215 ) ) ( not ( = ?auto_201213 ?auto_201216 ) ) ( not ( = ?auto_201213 ?auto_201217 ) ) ( not ( = ?auto_201213 ?auto_201218 ) ) ( not ( = ?auto_201213 ?auto_201219 ) ) ( not ( = ?auto_201214 ?auto_201215 ) ) ( not ( = ?auto_201214 ?auto_201216 ) ) ( not ( = ?auto_201214 ?auto_201217 ) ) ( not ( = ?auto_201214 ?auto_201218 ) ) ( not ( = ?auto_201214 ?auto_201219 ) ) ( not ( = ?auto_201215 ?auto_201216 ) ) ( not ( = ?auto_201215 ?auto_201217 ) ) ( not ( = ?auto_201215 ?auto_201218 ) ) ( not ( = ?auto_201215 ?auto_201219 ) ) ( not ( = ?auto_201216 ?auto_201217 ) ) ( not ( = ?auto_201216 ?auto_201218 ) ) ( not ( = ?auto_201216 ?auto_201219 ) ) ( not ( = ?auto_201217 ?auto_201218 ) ) ( not ( = ?auto_201217 ?auto_201219 ) ) ( not ( = ?auto_201218 ?auto_201219 ) ) ( ON ?auto_201219 ?auto_201221 ) ( not ( = ?auto_201213 ?auto_201221 ) ) ( not ( = ?auto_201214 ?auto_201221 ) ) ( not ( = ?auto_201215 ?auto_201221 ) ) ( not ( = ?auto_201216 ?auto_201221 ) ) ( not ( = ?auto_201217 ?auto_201221 ) ) ( not ( = ?auto_201218 ?auto_201221 ) ) ( not ( = ?auto_201219 ?auto_201221 ) ) ( ON ?auto_201218 ?auto_201219 ) ( CLEAR ?auto_201218 ) ( ON-TABLE ?auto_201220 ) ( ON ?auto_201221 ?auto_201220 ) ( not ( = ?auto_201220 ?auto_201221 ) ) ( not ( = ?auto_201220 ?auto_201219 ) ) ( not ( = ?auto_201220 ?auto_201218 ) ) ( not ( = ?auto_201213 ?auto_201220 ) ) ( not ( = ?auto_201214 ?auto_201220 ) ) ( not ( = ?auto_201215 ?auto_201220 ) ) ( not ( = ?auto_201216 ?auto_201220 ) ) ( not ( = ?auto_201217 ?auto_201220 ) ) ( HOLDING ?auto_201217 ) ( CLEAR ?auto_201216 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_201213 ?auto_201214 ?auto_201215 ?auto_201216 ?auto_201217 )
      ( MAKE-7PILE ?auto_201213 ?auto_201214 ?auto_201215 ?auto_201216 ?auto_201217 ?auto_201218 ?auto_201219 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_201222 - BLOCK
      ?auto_201223 - BLOCK
      ?auto_201224 - BLOCK
      ?auto_201225 - BLOCK
      ?auto_201226 - BLOCK
      ?auto_201227 - BLOCK
      ?auto_201228 - BLOCK
    )
    :vars
    (
      ?auto_201229 - BLOCK
      ?auto_201230 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_201222 ) ( ON ?auto_201223 ?auto_201222 ) ( ON ?auto_201224 ?auto_201223 ) ( ON ?auto_201225 ?auto_201224 ) ( not ( = ?auto_201222 ?auto_201223 ) ) ( not ( = ?auto_201222 ?auto_201224 ) ) ( not ( = ?auto_201222 ?auto_201225 ) ) ( not ( = ?auto_201222 ?auto_201226 ) ) ( not ( = ?auto_201222 ?auto_201227 ) ) ( not ( = ?auto_201222 ?auto_201228 ) ) ( not ( = ?auto_201223 ?auto_201224 ) ) ( not ( = ?auto_201223 ?auto_201225 ) ) ( not ( = ?auto_201223 ?auto_201226 ) ) ( not ( = ?auto_201223 ?auto_201227 ) ) ( not ( = ?auto_201223 ?auto_201228 ) ) ( not ( = ?auto_201224 ?auto_201225 ) ) ( not ( = ?auto_201224 ?auto_201226 ) ) ( not ( = ?auto_201224 ?auto_201227 ) ) ( not ( = ?auto_201224 ?auto_201228 ) ) ( not ( = ?auto_201225 ?auto_201226 ) ) ( not ( = ?auto_201225 ?auto_201227 ) ) ( not ( = ?auto_201225 ?auto_201228 ) ) ( not ( = ?auto_201226 ?auto_201227 ) ) ( not ( = ?auto_201226 ?auto_201228 ) ) ( not ( = ?auto_201227 ?auto_201228 ) ) ( ON ?auto_201228 ?auto_201229 ) ( not ( = ?auto_201222 ?auto_201229 ) ) ( not ( = ?auto_201223 ?auto_201229 ) ) ( not ( = ?auto_201224 ?auto_201229 ) ) ( not ( = ?auto_201225 ?auto_201229 ) ) ( not ( = ?auto_201226 ?auto_201229 ) ) ( not ( = ?auto_201227 ?auto_201229 ) ) ( not ( = ?auto_201228 ?auto_201229 ) ) ( ON ?auto_201227 ?auto_201228 ) ( ON-TABLE ?auto_201230 ) ( ON ?auto_201229 ?auto_201230 ) ( not ( = ?auto_201230 ?auto_201229 ) ) ( not ( = ?auto_201230 ?auto_201228 ) ) ( not ( = ?auto_201230 ?auto_201227 ) ) ( not ( = ?auto_201222 ?auto_201230 ) ) ( not ( = ?auto_201223 ?auto_201230 ) ) ( not ( = ?auto_201224 ?auto_201230 ) ) ( not ( = ?auto_201225 ?auto_201230 ) ) ( not ( = ?auto_201226 ?auto_201230 ) ) ( CLEAR ?auto_201225 ) ( ON ?auto_201226 ?auto_201227 ) ( CLEAR ?auto_201226 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_201230 ?auto_201229 ?auto_201228 ?auto_201227 )
      ( MAKE-7PILE ?auto_201222 ?auto_201223 ?auto_201224 ?auto_201225 ?auto_201226 ?auto_201227 ?auto_201228 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_201231 - BLOCK
      ?auto_201232 - BLOCK
      ?auto_201233 - BLOCK
      ?auto_201234 - BLOCK
      ?auto_201235 - BLOCK
      ?auto_201236 - BLOCK
      ?auto_201237 - BLOCK
    )
    :vars
    (
      ?auto_201238 - BLOCK
      ?auto_201239 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_201231 ) ( ON ?auto_201232 ?auto_201231 ) ( ON ?auto_201233 ?auto_201232 ) ( not ( = ?auto_201231 ?auto_201232 ) ) ( not ( = ?auto_201231 ?auto_201233 ) ) ( not ( = ?auto_201231 ?auto_201234 ) ) ( not ( = ?auto_201231 ?auto_201235 ) ) ( not ( = ?auto_201231 ?auto_201236 ) ) ( not ( = ?auto_201231 ?auto_201237 ) ) ( not ( = ?auto_201232 ?auto_201233 ) ) ( not ( = ?auto_201232 ?auto_201234 ) ) ( not ( = ?auto_201232 ?auto_201235 ) ) ( not ( = ?auto_201232 ?auto_201236 ) ) ( not ( = ?auto_201232 ?auto_201237 ) ) ( not ( = ?auto_201233 ?auto_201234 ) ) ( not ( = ?auto_201233 ?auto_201235 ) ) ( not ( = ?auto_201233 ?auto_201236 ) ) ( not ( = ?auto_201233 ?auto_201237 ) ) ( not ( = ?auto_201234 ?auto_201235 ) ) ( not ( = ?auto_201234 ?auto_201236 ) ) ( not ( = ?auto_201234 ?auto_201237 ) ) ( not ( = ?auto_201235 ?auto_201236 ) ) ( not ( = ?auto_201235 ?auto_201237 ) ) ( not ( = ?auto_201236 ?auto_201237 ) ) ( ON ?auto_201237 ?auto_201238 ) ( not ( = ?auto_201231 ?auto_201238 ) ) ( not ( = ?auto_201232 ?auto_201238 ) ) ( not ( = ?auto_201233 ?auto_201238 ) ) ( not ( = ?auto_201234 ?auto_201238 ) ) ( not ( = ?auto_201235 ?auto_201238 ) ) ( not ( = ?auto_201236 ?auto_201238 ) ) ( not ( = ?auto_201237 ?auto_201238 ) ) ( ON ?auto_201236 ?auto_201237 ) ( ON-TABLE ?auto_201239 ) ( ON ?auto_201238 ?auto_201239 ) ( not ( = ?auto_201239 ?auto_201238 ) ) ( not ( = ?auto_201239 ?auto_201237 ) ) ( not ( = ?auto_201239 ?auto_201236 ) ) ( not ( = ?auto_201231 ?auto_201239 ) ) ( not ( = ?auto_201232 ?auto_201239 ) ) ( not ( = ?auto_201233 ?auto_201239 ) ) ( not ( = ?auto_201234 ?auto_201239 ) ) ( not ( = ?auto_201235 ?auto_201239 ) ) ( ON ?auto_201235 ?auto_201236 ) ( CLEAR ?auto_201235 ) ( HOLDING ?auto_201234 ) ( CLEAR ?auto_201233 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_201231 ?auto_201232 ?auto_201233 ?auto_201234 )
      ( MAKE-7PILE ?auto_201231 ?auto_201232 ?auto_201233 ?auto_201234 ?auto_201235 ?auto_201236 ?auto_201237 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_201240 - BLOCK
      ?auto_201241 - BLOCK
      ?auto_201242 - BLOCK
      ?auto_201243 - BLOCK
      ?auto_201244 - BLOCK
      ?auto_201245 - BLOCK
      ?auto_201246 - BLOCK
    )
    :vars
    (
      ?auto_201248 - BLOCK
      ?auto_201247 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_201240 ) ( ON ?auto_201241 ?auto_201240 ) ( ON ?auto_201242 ?auto_201241 ) ( not ( = ?auto_201240 ?auto_201241 ) ) ( not ( = ?auto_201240 ?auto_201242 ) ) ( not ( = ?auto_201240 ?auto_201243 ) ) ( not ( = ?auto_201240 ?auto_201244 ) ) ( not ( = ?auto_201240 ?auto_201245 ) ) ( not ( = ?auto_201240 ?auto_201246 ) ) ( not ( = ?auto_201241 ?auto_201242 ) ) ( not ( = ?auto_201241 ?auto_201243 ) ) ( not ( = ?auto_201241 ?auto_201244 ) ) ( not ( = ?auto_201241 ?auto_201245 ) ) ( not ( = ?auto_201241 ?auto_201246 ) ) ( not ( = ?auto_201242 ?auto_201243 ) ) ( not ( = ?auto_201242 ?auto_201244 ) ) ( not ( = ?auto_201242 ?auto_201245 ) ) ( not ( = ?auto_201242 ?auto_201246 ) ) ( not ( = ?auto_201243 ?auto_201244 ) ) ( not ( = ?auto_201243 ?auto_201245 ) ) ( not ( = ?auto_201243 ?auto_201246 ) ) ( not ( = ?auto_201244 ?auto_201245 ) ) ( not ( = ?auto_201244 ?auto_201246 ) ) ( not ( = ?auto_201245 ?auto_201246 ) ) ( ON ?auto_201246 ?auto_201248 ) ( not ( = ?auto_201240 ?auto_201248 ) ) ( not ( = ?auto_201241 ?auto_201248 ) ) ( not ( = ?auto_201242 ?auto_201248 ) ) ( not ( = ?auto_201243 ?auto_201248 ) ) ( not ( = ?auto_201244 ?auto_201248 ) ) ( not ( = ?auto_201245 ?auto_201248 ) ) ( not ( = ?auto_201246 ?auto_201248 ) ) ( ON ?auto_201245 ?auto_201246 ) ( ON-TABLE ?auto_201247 ) ( ON ?auto_201248 ?auto_201247 ) ( not ( = ?auto_201247 ?auto_201248 ) ) ( not ( = ?auto_201247 ?auto_201246 ) ) ( not ( = ?auto_201247 ?auto_201245 ) ) ( not ( = ?auto_201240 ?auto_201247 ) ) ( not ( = ?auto_201241 ?auto_201247 ) ) ( not ( = ?auto_201242 ?auto_201247 ) ) ( not ( = ?auto_201243 ?auto_201247 ) ) ( not ( = ?auto_201244 ?auto_201247 ) ) ( ON ?auto_201244 ?auto_201245 ) ( CLEAR ?auto_201242 ) ( ON ?auto_201243 ?auto_201244 ) ( CLEAR ?auto_201243 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_201247 ?auto_201248 ?auto_201246 ?auto_201245 ?auto_201244 )
      ( MAKE-7PILE ?auto_201240 ?auto_201241 ?auto_201242 ?auto_201243 ?auto_201244 ?auto_201245 ?auto_201246 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_201249 - BLOCK
      ?auto_201250 - BLOCK
      ?auto_201251 - BLOCK
      ?auto_201252 - BLOCK
      ?auto_201253 - BLOCK
      ?auto_201254 - BLOCK
      ?auto_201255 - BLOCK
    )
    :vars
    (
      ?auto_201256 - BLOCK
      ?auto_201257 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_201249 ) ( ON ?auto_201250 ?auto_201249 ) ( not ( = ?auto_201249 ?auto_201250 ) ) ( not ( = ?auto_201249 ?auto_201251 ) ) ( not ( = ?auto_201249 ?auto_201252 ) ) ( not ( = ?auto_201249 ?auto_201253 ) ) ( not ( = ?auto_201249 ?auto_201254 ) ) ( not ( = ?auto_201249 ?auto_201255 ) ) ( not ( = ?auto_201250 ?auto_201251 ) ) ( not ( = ?auto_201250 ?auto_201252 ) ) ( not ( = ?auto_201250 ?auto_201253 ) ) ( not ( = ?auto_201250 ?auto_201254 ) ) ( not ( = ?auto_201250 ?auto_201255 ) ) ( not ( = ?auto_201251 ?auto_201252 ) ) ( not ( = ?auto_201251 ?auto_201253 ) ) ( not ( = ?auto_201251 ?auto_201254 ) ) ( not ( = ?auto_201251 ?auto_201255 ) ) ( not ( = ?auto_201252 ?auto_201253 ) ) ( not ( = ?auto_201252 ?auto_201254 ) ) ( not ( = ?auto_201252 ?auto_201255 ) ) ( not ( = ?auto_201253 ?auto_201254 ) ) ( not ( = ?auto_201253 ?auto_201255 ) ) ( not ( = ?auto_201254 ?auto_201255 ) ) ( ON ?auto_201255 ?auto_201256 ) ( not ( = ?auto_201249 ?auto_201256 ) ) ( not ( = ?auto_201250 ?auto_201256 ) ) ( not ( = ?auto_201251 ?auto_201256 ) ) ( not ( = ?auto_201252 ?auto_201256 ) ) ( not ( = ?auto_201253 ?auto_201256 ) ) ( not ( = ?auto_201254 ?auto_201256 ) ) ( not ( = ?auto_201255 ?auto_201256 ) ) ( ON ?auto_201254 ?auto_201255 ) ( ON-TABLE ?auto_201257 ) ( ON ?auto_201256 ?auto_201257 ) ( not ( = ?auto_201257 ?auto_201256 ) ) ( not ( = ?auto_201257 ?auto_201255 ) ) ( not ( = ?auto_201257 ?auto_201254 ) ) ( not ( = ?auto_201249 ?auto_201257 ) ) ( not ( = ?auto_201250 ?auto_201257 ) ) ( not ( = ?auto_201251 ?auto_201257 ) ) ( not ( = ?auto_201252 ?auto_201257 ) ) ( not ( = ?auto_201253 ?auto_201257 ) ) ( ON ?auto_201253 ?auto_201254 ) ( ON ?auto_201252 ?auto_201253 ) ( CLEAR ?auto_201252 ) ( HOLDING ?auto_201251 ) ( CLEAR ?auto_201250 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_201249 ?auto_201250 ?auto_201251 )
      ( MAKE-7PILE ?auto_201249 ?auto_201250 ?auto_201251 ?auto_201252 ?auto_201253 ?auto_201254 ?auto_201255 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_201258 - BLOCK
      ?auto_201259 - BLOCK
      ?auto_201260 - BLOCK
      ?auto_201261 - BLOCK
      ?auto_201262 - BLOCK
      ?auto_201263 - BLOCK
      ?auto_201264 - BLOCK
    )
    :vars
    (
      ?auto_201266 - BLOCK
      ?auto_201265 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_201258 ) ( ON ?auto_201259 ?auto_201258 ) ( not ( = ?auto_201258 ?auto_201259 ) ) ( not ( = ?auto_201258 ?auto_201260 ) ) ( not ( = ?auto_201258 ?auto_201261 ) ) ( not ( = ?auto_201258 ?auto_201262 ) ) ( not ( = ?auto_201258 ?auto_201263 ) ) ( not ( = ?auto_201258 ?auto_201264 ) ) ( not ( = ?auto_201259 ?auto_201260 ) ) ( not ( = ?auto_201259 ?auto_201261 ) ) ( not ( = ?auto_201259 ?auto_201262 ) ) ( not ( = ?auto_201259 ?auto_201263 ) ) ( not ( = ?auto_201259 ?auto_201264 ) ) ( not ( = ?auto_201260 ?auto_201261 ) ) ( not ( = ?auto_201260 ?auto_201262 ) ) ( not ( = ?auto_201260 ?auto_201263 ) ) ( not ( = ?auto_201260 ?auto_201264 ) ) ( not ( = ?auto_201261 ?auto_201262 ) ) ( not ( = ?auto_201261 ?auto_201263 ) ) ( not ( = ?auto_201261 ?auto_201264 ) ) ( not ( = ?auto_201262 ?auto_201263 ) ) ( not ( = ?auto_201262 ?auto_201264 ) ) ( not ( = ?auto_201263 ?auto_201264 ) ) ( ON ?auto_201264 ?auto_201266 ) ( not ( = ?auto_201258 ?auto_201266 ) ) ( not ( = ?auto_201259 ?auto_201266 ) ) ( not ( = ?auto_201260 ?auto_201266 ) ) ( not ( = ?auto_201261 ?auto_201266 ) ) ( not ( = ?auto_201262 ?auto_201266 ) ) ( not ( = ?auto_201263 ?auto_201266 ) ) ( not ( = ?auto_201264 ?auto_201266 ) ) ( ON ?auto_201263 ?auto_201264 ) ( ON-TABLE ?auto_201265 ) ( ON ?auto_201266 ?auto_201265 ) ( not ( = ?auto_201265 ?auto_201266 ) ) ( not ( = ?auto_201265 ?auto_201264 ) ) ( not ( = ?auto_201265 ?auto_201263 ) ) ( not ( = ?auto_201258 ?auto_201265 ) ) ( not ( = ?auto_201259 ?auto_201265 ) ) ( not ( = ?auto_201260 ?auto_201265 ) ) ( not ( = ?auto_201261 ?auto_201265 ) ) ( not ( = ?auto_201262 ?auto_201265 ) ) ( ON ?auto_201262 ?auto_201263 ) ( ON ?auto_201261 ?auto_201262 ) ( CLEAR ?auto_201259 ) ( ON ?auto_201260 ?auto_201261 ) ( CLEAR ?auto_201260 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_201265 ?auto_201266 ?auto_201264 ?auto_201263 ?auto_201262 ?auto_201261 )
      ( MAKE-7PILE ?auto_201258 ?auto_201259 ?auto_201260 ?auto_201261 ?auto_201262 ?auto_201263 ?auto_201264 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_201267 - BLOCK
      ?auto_201268 - BLOCK
      ?auto_201269 - BLOCK
      ?auto_201270 - BLOCK
      ?auto_201271 - BLOCK
      ?auto_201272 - BLOCK
      ?auto_201273 - BLOCK
    )
    :vars
    (
      ?auto_201274 - BLOCK
      ?auto_201275 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_201267 ) ( not ( = ?auto_201267 ?auto_201268 ) ) ( not ( = ?auto_201267 ?auto_201269 ) ) ( not ( = ?auto_201267 ?auto_201270 ) ) ( not ( = ?auto_201267 ?auto_201271 ) ) ( not ( = ?auto_201267 ?auto_201272 ) ) ( not ( = ?auto_201267 ?auto_201273 ) ) ( not ( = ?auto_201268 ?auto_201269 ) ) ( not ( = ?auto_201268 ?auto_201270 ) ) ( not ( = ?auto_201268 ?auto_201271 ) ) ( not ( = ?auto_201268 ?auto_201272 ) ) ( not ( = ?auto_201268 ?auto_201273 ) ) ( not ( = ?auto_201269 ?auto_201270 ) ) ( not ( = ?auto_201269 ?auto_201271 ) ) ( not ( = ?auto_201269 ?auto_201272 ) ) ( not ( = ?auto_201269 ?auto_201273 ) ) ( not ( = ?auto_201270 ?auto_201271 ) ) ( not ( = ?auto_201270 ?auto_201272 ) ) ( not ( = ?auto_201270 ?auto_201273 ) ) ( not ( = ?auto_201271 ?auto_201272 ) ) ( not ( = ?auto_201271 ?auto_201273 ) ) ( not ( = ?auto_201272 ?auto_201273 ) ) ( ON ?auto_201273 ?auto_201274 ) ( not ( = ?auto_201267 ?auto_201274 ) ) ( not ( = ?auto_201268 ?auto_201274 ) ) ( not ( = ?auto_201269 ?auto_201274 ) ) ( not ( = ?auto_201270 ?auto_201274 ) ) ( not ( = ?auto_201271 ?auto_201274 ) ) ( not ( = ?auto_201272 ?auto_201274 ) ) ( not ( = ?auto_201273 ?auto_201274 ) ) ( ON ?auto_201272 ?auto_201273 ) ( ON-TABLE ?auto_201275 ) ( ON ?auto_201274 ?auto_201275 ) ( not ( = ?auto_201275 ?auto_201274 ) ) ( not ( = ?auto_201275 ?auto_201273 ) ) ( not ( = ?auto_201275 ?auto_201272 ) ) ( not ( = ?auto_201267 ?auto_201275 ) ) ( not ( = ?auto_201268 ?auto_201275 ) ) ( not ( = ?auto_201269 ?auto_201275 ) ) ( not ( = ?auto_201270 ?auto_201275 ) ) ( not ( = ?auto_201271 ?auto_201275 ) ) ( ON ?auto_201271 ?auto_201272 ) ( ON ?auto_201270 ?auto_201271 ) ( ON ?auto_201269 ?auto_201270 ) ( CLEAR ?auto_201269 ) ( HOLDING ?auto_201268 ) ( CLEAR ?auto_201267 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_201267 ?auto_201268 )
      ( MAKE-7PILE ?auto_201267 ?auto_201268 ?auto_201269 ?auto_201270 ?auto_201271 ?auto_201272 ?auto_201273 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_201276 - BLOCK
      ?auto_201277 - BLOCK
      ?auto_201278 - BLOCK
      ?auto_201279 - BLOCK
      ?auto_201280 - BLOCK
      ?auto_201281 - BLOCK
      ?auto_201282 - BLOCK
    )
    :vars
    (
      ?auto_201284 - BLOCK
      ?auto_201283 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_201276 ) ( not ( = ?auto_201276 ?auto_201277 ) ) ( not ( = ?auto_201276 ?auto_201278 ) ) ( not ( = ?auto_201276 ?auto_201279 ) ) ( not ( = ?auto_201276 ?auto_201280 ) ) ( not ( = ?auto_201276 ?auto_201281 ) ) ( not ( = ?auto_201276 ?auto_201282 ) ) ( not ( = ?auto_201277 ?auto_201278 ) ) ( not ( = ?auto_201277 ?auto_201279 ) ) ( not ( = ?auto_201277 ?auto_201280 ) ) ( not ( = ?auto_201277 ?auto_201281 ) ) ( not ( = ?auto_201277 ?auto_201282 ) ) ( not ( = ?auto_201278 ?auto_201279 ) ) ( not ( = ?auto_201278 ?auto_201280 ) ) ( not ( = ?auto_201278 ?auto_201281 ) ) ( not ( = ?auto_201278 ?auto_201282 ) ) ( not ( = ?auto_201279 ?auto_201280 ) ) ( not ( = ?auto_201279 ?auto_201281 ) ) ( not ( = ?auto_201279 ?auto_201282 ) ) ( not ( = ?auto_201280 ?auto_201281 ) ) ( not ( = ?auto_201280 ?auto_201282 ) ) ( not ( = ?auto_201281 ?auto_201282 ) ) ( ON ?auto_201282 ?auto_201284 ) ( not ( = ?auto_201276 ?auto_201284 ) ) ( not ( = ?auto_201277 ?auto_201284 ) ) ( not ( = ?auto_201278 ?auto_201284 ) ) ( not ( = ?auto_201279 ?auto_201284 ) ) ( not ( = ?auto_201280 ?auto_201284 ) ) ( not ( = ?auto_201281 ?auto_201284 ) ) ( not ( = ?auto_201282 ?auto_201284 ) ) ( ON ?auto_201281 ?auto_201282 ) ( ON-TABLE ?auto_201283 ) ( ON ?auto_201284 ?auto_201283 ) ( not ( = ?auto_201283 ?auto_201284 ) ) ( not ( = ?auto_201283 ?auto_201282 ) ) ( not ( = ?auto_201283 ?auto_201281 ) ) ( not ( = ?auto_201276 ?auto_201283 ) ) ( not ( = ?auto_201277 ?auto_201283 ) ) ( not ( = ?auto_201278 ?auto_201283 ) ) ( not ( = ?auto_201279 ?auto_201283 ) ) ( not ( = ?auto_201280 ?auto_201283 ) ) ( ON ?auto_201280 ?auto_201281 ) ( ON ?auto_201279 ?auto_201280 ) ( ON ?auto_201278 ?auto_201279 ) ( CLEAR ?auto_201276 ) ( ON ?auto_201277 ?auto_201278 ) ( CLEAR ?auto_201277 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_201283 ?auto_201284 ?auto_201282 ?auto_201281 ?auto_201280 ?auto_201279 ?auto_201278 )
      ( MAKE-7PILE ?auto_201276 ?auto_201277 ?auto_201278 ?auto_201279 ?auto_201280 ?auto_201281 ?auto_201282 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_201285 - BLOCK
      ?auto_201286 - BLOCK
      ?auto_201287 - BLOCK
      ?auto_201288 - BLOCK
      ?auto_201289 - BLOCK
      ?auto_201290 - BLOCK
      ?auto_201291 - BLOCK
    )
    :vars
    (
      ?auto_201293 - BLOCK
      ?auto_201292 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_201285 ?auto_201286 ) ) ( not ( = ?auto_201285 ?auto_201287 ) ) ( not ( = ?auto_201285 ?auto_201288 ) ) ( not ( = ?auto_201285 ?auto_201289 ) ) ( not ( = ?auto_201285 ?auto_201290 ) ) ( not ( = ?auto_201285 ?auto_201291 ) ) ( not ( = ?auto_201286 ?auto_201287 ) ) ( not ( = ?auto_201286 ?auto_201288 ) ) ( not ( = ?auto_201286 ?auto_201289 ) ) ( not ( = ?auto_201286 ?auto_201290 ) ) ( not ( = ?auto_201286 ?auto_201291 ) ) ( not ( = ?auto_201287 ?auto_201288 ) ) ( not ( = ?auto_201287 ?auto_201289 ) ) ( not ( = ?auto_201287 ?auto_201290 ) ) ( not ( = ?auto_201287 ?auto_201291 ) ) ( not ( = ?auto_201288 ?auto_201289 ) ) ( not ( = ?auto_201288 ?auto_201290 ) ) ( not ( = ?auto_201288 ?auto_201291 ) ) ( not ( = ?auto_201289 ?auto_201290 ) ) ( not ( = ?auto_201289 ?auto_201291 ) ) ( not ( = ?auto_201290 ?auto_201291 ) ) ( ON ?auto_201291 ?auto_201293 ) ( not ( = ?auto_201285 ?auto_201293 ) ) ( not ( = ?auto_201286 ?auto_201293 ) ) ( not ( = ?auto_201287 ?auto_201293 ) ) ( not ( = ?auto_201288 ?auto_201293 ) ) ( not ( = ?auto_201289 ?auto_201293 ) ) ( not ( = ?auto_201290 ?auto_201293 ) ) ( not ( = ?auto_201291 ?auto_201293 ) ) ( ON ?auto_201290 ?auto_201291 ) ( ON-TABLE ?auto_201292 ) ( ON ?auto_201293 ?auto_201292 ) ( not ( = ?auto_201292 ?auto_201293 ) ) ( not ( = ?auto_201292 ?auto_201291 ) ) ( not ( = ?auto_201292 ?auto_201290 ) ) ( not ( = ?auto_201285 ?auto_201292 ) ) ( not ( = ?auto_201286 ?auto_201292 ) ) ( not ( = ?auto_201287 ?auto_201292 ) ) ( not ( = ?auto_201288 ?auto_201292 ) ) ( not ( = ?auto_201289 ?auto_201292 ) ) ( ON ?auto_201289 ?auto_201290 ) ( ON ?auto_201288 ?auto_201289 ) ( ON ?auto_201287 ?auto_201288 ) ( ON ?auto_201286 ?auto_201287 ) ( CLEAR ?auto_201286 ) ( HOLDING ?auto_201285 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_201285 )
      ( MAKE-7PILE ?auto_201285 ?auto_201286 ?auto_201287 ?auto_201288 ?auto_201289 ?auto_201290 ?auto_201291 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_201294 - BLOCK
      ?auto_201295 - BLOCK
      ?auto_201296 - BLOCK
      ?auto_201297 - BLOCK
      ?auto_201298 - BLOCK
      ?auto_201299 - BLOCK
      ?auto_201300 - BLOCK
    )
    :vars
    (
      ?auto_201302 - BLOCK
      ?auto_201301 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_201294 ?auto_201295 ) ) ( not ( = ?auto_201294 ?auto_201296 ) ) ( not ( = ?auto_201294 ?auto_201297 ) ) ( not ( = ?auto_201294 ?auto_201298 ) ) ( not ( = ?auto_201294 ?auto_201299 ) ) ( not ( = ?auto_201294 ?auto_201300 ) ) ( not ( = ?auto_201295 ?auto_201296 ) ) ( not ( = ?auto_201295 ?auto_201297 ) ) ( not ( = ?auto_201295 ?auto_201298 ) ) ( not ( = ?auto_201295 ?auto_201299 ) ) ( not ( = ?auto_201295 ?auto_201300 ) ) ( not ( = ?auto_201296 ?auto_201297 ) ) ( not ( = ?auto_201296 ?auto_201298 ) ) ( not ( = ?auto_201296 ?auto_201299 ) ) ( not ( = ?auto_201296 ?auto_201300 ) ) ( not ( = ?auto_201297 ?auto_201298 ) ) ( not ( = ?auto_201297 ?auto_201299 ) ) ( not ( = ?auto_201297 ?auto_201300 ) ) ( not ( = ?auto_201298 ?auto_201299 ) ) ( not ( = ?auto_201298 ?auto_201300 ) ) ( not ( = ?auto_201299 ?auto_201300 ) ) ( ON ?auto_201300 ?auto_201302 ) ( not ( = ?auto_201294 ?auto_201302 ) ) ( not ( = ?auto_201295 ?auto_201302 ) ) ( not ( = ?auto_201296 ?auto_201302 ) ) ( not ( = ?auto_201297 ?auto_201302 ) ) ( not ( = ?auto_201298 ?auto_201302 ) ) ( not ( = ?auto_201299 ?auto_201302 ) ) ( not ( = ?auto_201300 ?auto_201302 ) ) ( ON ?auto_201299 ?auto_201300 ) ( ON-TABLE ?auto_201301 ) ( ON ?auto_201302 ?auto_201301 ) ( not ( = ?auto_201301 ?auto_201302 ) ) ( not ( = ?auto_201301 ?auto_201300 ) ) ( not ( = ?auto_201301 ?auto_201299 ) ) ( not ( = ?auto_201294 ?auto_201301 ) ) ( not ( = ?auto_201295 ?auto_201301 ) ) ( not ( = ?auto_201296 ?auto_201301 ) ) ( not ( = ?auto_201297 ?auto_201301 ) ) ( not ( = ?auto_201298 ?auto_201301 ) ) ( ON ?auto_201298 ?auto_201299 ) ( ON ?auto_201297 ?auto_201298 ) ( ON ?auto_201296 ?auto_201297 ) ( ON ?auto_201295 ?auto_201296 ) ( ON ?auto_201294 ?auto_201295 ) ( CLEAR ?auto_201294 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_201301 ?auto_201302 ?auto_201300 ?auto_201299 ?auto_201298 ?auto_201297 ?auto_201296 ?auto_201295 )
      ( MAKE-7PILE ?auto_201294 ?auto_201295 ?auto_201296 ?auto_201297 ?auto_201298 ?auto_201299 ?auto_201300 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_201304 - BLOCK
    )
    :vars
    (
      ?auto_201305 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_201305 ?auto_201304 ) ( CLEAR ?auto_201305 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_201304 ) ( not ( = ?auto_201304 ?auto_201305 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_201305 ?auto_201304 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_201306 - BLOCK
    )
    :vars
    (
      ?auto_201307 - BLOCK
      ?auto_201308 - BLOCK
      ?auto_201309 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_201307 ?auto_201306 ) ( CLEAR ?auto_201307 ) ( ON-TABLE ?auto_201306 ) ( not ( = ?auto_201306 ?auto_201307 ) ) ( HOLDING ?auto_201308 ) ( CLEAR ?auto_201309 ) ( not ( = ?auto_201306 ?auto_201308 ) ) ( not ( = ?auto_201306 ?auto_201309 ) ) ( not ( = ?auto_201307 ?auto_201308 ) ) ( not ( = ?auto_201307 ?auto_201309 ) ) ( not ( = ?auto_201308 ?auto_201309 ) ) )
    :subtasks
    ( ( !STACK ?auto_201308 ?auto_201309 )
      ( MAKE-1PILE ?auto_201306 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_201310 - BLOCK
    )
    :vars
    (
      ?auto_201312 - BLOCK
      ?auto_201311 - BLOCK
      ?auto_201313 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_201312 ?auto_201310 ) ( ON-TABLE ?auto_201310 ) ( not ( = ?auto_201310 ?auto_201312 ) ) ( CLEAR ?auto_201311 ) ( not ( = ?auto_201310 ?auto_201313 ) ) ( not ( = ?auto_201310 ?auto_201311 ) ) ( not ( = ?auto_201312 ?auto_201313 ) ) ( not ( = ?auto_201312 ?auto_201311 ) ) ( not ( = ?auto_201313 ?auto_201311 ) ) ( ON ?auto_201313 ?auto_201312 ) ( CLEAR ?auto_201313 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_201310 ?auto_201312 )
      ( MAKE-1PILE ?auto_201310 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_201314 - BLOCK
    )
    :vars
    (
      ?auto_201315 - BLOCK
      ?auto_201317 - BLOCK
      ?auto_201316 - BLOCK
      ?auto_201321 - BLOCK
      ?auto_201318 - BLOCK
      ?auto_201322 - BLOCK
      ?auto_201320 - BLOCK
      ?auto_201319 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_201315 ?auto_201314 ) ( ON-TABLE ?auto_201314 ) ( not ( = ?auto_201314 ?auto_201315 ) ) ( not ( = ?auto_201314 ?auto_201317 ) ) ( not ( = ?auto_201314 ?auto_201316 ) ) ( not ( = ?auto_201315 ?auto_201317 ) ) ( not ( = ?auto_201315 ?auto_201316 ) ) ( not ( = ?auto_201317 ?auto_201316 ) ) ( ON ?auto_201317 ?auto_201315 ) ( CLEAR ?auto_201317 ) ( HOLDING ?auto_201316 ) ( CLEAR ?auto_201321 ) ( ON-TABLE ?auto_201318 ) ( ON ?auto_201322 ?auto_201318 ) ( ON ?auto_201320 ?auto_201322 ) ( ON ?auto_201319 ?auto_201320 ) ( ON ?auto_201321 ?auto_201319 ) ( not ( = ?auto_201318 ?auto_201322 ) ) ( not ( = ?auto_201318 ?auto_201320 ) ) ( not ( = ?auto_201318 ?auto_201319 ) ) ( not ( = ?auto_201318 ?auto_201321 ) ) ( not ( = ?auto_201318 ?auto_201316 ) ) ( not ( = ?auto_201322 ?auto_201320 ) ) ( not ( = ?auto_201322 ?auto_201319 ) ) ( not ( = ?auto_201322 ?auto_201321 ) ) ( not ( = ?auto_201322 ?auto_201316 ) ) ( not ( = ?auto_201320 ?auto_201319 ) ) ( not ( = ?auto_201320 ?auto_201321 ) ) ( not ( = ?auto_201320 ?auto_201316 ) ) ( not ( = ?auto_201319 ?auto_201321 ) ) ( not ( = ?auto_201319 ?auto_201316 ) ) ( not ( = ?auto_201321 ?auto_201316 ) ) ( not ( = ?auto_201314 ?auto_201321 ) ) ( not ( = ?auto_201314 ?auto_201318 ) ) ( not ( = ?auto_201314 ?auto_201322 ) ) ( not ( = ?auto_201314 ?auto_201320 ) ) ( not ( = ?auto_201314 ?auto_201319 ) ) ( not ( = ?auto_201315 ?auto_201321 ) ) ( not ( = ?auto_201315 ?auto_201318 ) ) ( not ( = ?auto_201315 ?auto_201322 ) ) ( not ( = ?auto_201315 ?auto_201320 ) ) ( not ( = ?auto_201315 ?auto_201319 ) ) ( not ( = ?auto_201317 ?auto_201321 ) ) ( not ( = ?auto_201317 ?auto_201318 ) ) ( not ( = ?auto_201317 ?auto_201322 ) ) ( not ( = ?auto_201317 ?auto_201320 ) ) ( not ( = ?auto_201317 ?auto_201319 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_201318 ?auto_201322 ?auto_201320 ?auto_201319 ?auto_201321 ?auto_201316 )
      ( MAKE-1PILE ?auto_201314 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_201323 - BLOCK
    )
    :vars
    (
      ?auto_201329 - BLOCK
      ?auto_201328 - BLOCK
      ?auto_201331 - BLOCK
      ?auto_201327 - BLOCK
      ?auto_201330 - BLOCK
      ?auto_201325 - BLOCK
      ?auto_201324 - BLOCK
      ?auto_201326 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_201329 ?auto_201323 ) ( ON-TABLE ?auto_201323 ) ( not ( = ?auto_201323 ?auto_201329 ) ) ( not ( = ?auto_201323 ?auto_201328 ) ) ( not ( = ?auto_201323 ?auto_201331 ) ) ( not ( = ?auto_201329 ?auto_201328 ) ) ( not ( = ?auto_201329 ?auto_201331 ) ) ( not ( = ?auto_201328 ?auto_201331 ) ) ( ON ?auto_201328 ?auto_201329 ) ( CLEAR ?auto_201327 ) ( ON-TABLE ?auto_201330 ) ( ON ?auto_201325 ?auto_201330 ) ( ON ?auto_201324 ?auto_201325 ) ( ON ?auto_201326 ?auto_201324 ) ( ON ?auto_201327 ?auto_201326 ) ( not ( = ?auto_201330 ?auto_201325 ) ) ( not ( = ?auto_201330 ?auto_201324 ) ) ( not ( = ?auto_201330 ?auto_201326 ) ) ( not ( = ?auto_201330 ?auto_201327 ) ) ( not ( = ?auto_201330 ?auto_201331 ) ) ( not ( = ?auto_201325 ?auto_201324 ) ) ( not ( = ?auto_201325 ?auto_201326 ) ) ( not ( = ?auto_201325 ?auto_201327 ) ) ( not ( = ?auto_201325 ?auto_201331 ) ) ( not ( = ?auto_201324 ?auto_201326 ) ) ( not ( = ?auto_201324 ?auto_201327 ) ) ( not ( = ?auto_201324 ?auto_201331 ) ) ( not ( = ?auto_201326 ?auto_201327 ) ) ( not ( = ?auto_201326 ?auto_201331 ) ) ( not ( = ?auto_201327 ?auto_201331 ) ) ( not ( = ?auto_201323 ?auto_201327 ) ) ( not ( = ?auto_201323 ?auto_201330 ) ) ( not ( = ?auto_201323 ?auto_201325 ) ) ( not ( = ?auto_201323 ?auto_201324 ) ) ( not ( = ?auto_201323 ?auto_201326 ) ) ( not ( = ?auto_201329 ?auto_201327 ) ) ( not ( = ?auto_201329 ?auto_201330 ) ) ( not ( = ?auto_201329 ?auto_201325 ) ) ( not ( = ?auto_201329 ?auto_201324 ) ) ( not ( = ?auto_201329 ?auto_201326 ) ) ( not ( = ?auto_201328 ?auto_201327 ) ) ( not ( = ?auto_201328 ?auto_201330 ) ) ( not ( = ?auto_201328 ?auto_201325 ) ) ( not ( = ?auto_201328 ?auto_201324 ) ) ( not ( = ?auto_201328 ?auto_201326 ) ) ( ON ?auto_201331 ?auto_201328 ) ( CLEAR ?auto_201331 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_201323 ?auto_201329 ?auto_201328 )
      ( MAKE-1PILE ?auto_201323 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_201332 - BLOCK
    )
    :vars
    (
      ?auto_201336 - BLOCK
      ?auto_201337 - BLOCK
      ?auto_201335 - BLOCK
      ?auto_201333 - BLOCK
      ?auto_201339 - BLOCK
      ?auto_201334 - BLOCK
      ?auto_201338 - BLOCK
      ?auto_201340 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_201336 ?auto_201332 ) ( ON-TABLE ?auto_201332 ) ( not ( = ?auto_201332 ?auto_201336 ) ) ( not ( = ?auto_201332 ?auto_201337 ) ) ( not ( = ?auto_201332 ?auto_201335 ) ) ( not ( = ?auto_201336 ?auto_201337 ) ) ( not ( = ?auto_201336 ?auto_201335 ) ) ( not ( = ?auto_201337 ?auto_201335 ) ) ( ON ?auto_201337 ?auto_201336 ) ( ON-TABLE ?auto_201333 ) ( ON ?auto_201339 ?auto_201333 ) ( ON ?auto_201334 ?auto_201339 ) ( ON ?auto_201338 ?auto_201334 ) ( not ( = ?auto_201333 ?auto_201339 ) ) ( not ( = ?auto_201333 ?auto_201334 ) ) ( not ( = ?auto_201333 ?auto_201338 ) ) ( not ( = ?auto_201333 ?auto_201340 ) ) ( not ( = ?auto_201333 ?auto_201335 ) ) ( not ( = ?auto_201339 ?auto_201334 ) ) ( not ( = ?auto_201339 ?auto_201338 ) ) ( not ( = ?auto_201339 ?auto_201340 ) ) ( not ( = ?auto_201339 ?auto_201335 ) ) ( not ( = ?auto_201334 ?auto_201338 ) ) ( not ( = ?auto_201334 ?auto_201340 ) ) ( not ( = ?auto_201334 ?auto_201335 ) ) ( not ( = ?auto_201338 ?auto_201340 ) ) ( not ( = ?auto_201338 ?auto_201335 ) ) ( not ( = ?auto_201340 ?auto_201335 ) ) ( not ( = ?auto_201332 ?auto_201340 ) ) ( not ( = ?auto_201332 ?auto_201333 ) ) ( not ( = ?auto_201332 ?auto_201339 ) ) ( not ( = ?auto_201332 ?auto_201334 ) ) ( not ( = ?auto_201332 ?auto_201338 ) ) ( not ( = ?auto_201336 ?auto_201340 ) ) ( not ( = ?auto_201336 ?auto_201333 ) ) ( not ( = ?auto_201336 ?auto_201339 ) ) ( not ( = ?auto_201336 ?auto_201334 ) ) ( not ( = ?auto_201336 ?auto_201338 ) ) ( not ( = ?auto_201337 ?auto_201340 ) ) ( not ( = ?auto_201337 ?auto_201333 ) ) ( not ( = ?auto_201337 ?auto_201339 ) ) ( not ( = ?auto_201337 ?auto_201334 ) ) ( not ( = ?auto_201337 ?auto_201338 ) ) ( ON ?auto_201335 ?auto_201337 ) ( CLEAR ?auto_201335 ) ( HOLDING ?auto_201340 ) ( CLEAR ?auto_201338 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_201333 ?auto_201339 ?auto_201334 ?auto_201338 ?auto_201340 )
      ( MAKE-1PILE ?auto_201332 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_201341 - BLOCK
    )
    :vars
    (
      ?auto_201342 - BLOCK
      ?auto_201349 - BLOCK
      ?auto_201347 - BLOCK
      ?auto_201344 - BLOCK
      ?auto_201348 - BLOCK
      ?auto_201343 - BLOCK
      ?auto_201345 - BLOCK
      ?auto_201346 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_201342 ?auto_201341 ) ( ON-TABLE ?auto_201341 ) ( not ( = ?auto_201341 ?auto_201342 ) ) ( not ( = ?auto_201341 ?auto_201349 ) ) ( not ( = ?auto_201341 ?auto_201347 ) ) ( not ( = ?auto_201342 ?auto_201349 ) ) ( not ( = ?auto_201342 ?auto_201347 ) ) ( not ( = ?auto_201349 ?auto_201347 ) ) ( ON ?auto_201349 ?auto_201342 ) ( ON-TABLE ?auto_201344 ) ( ON ?auto_201348 ?auto_201344 ) ( ON ?auto_201343 ?auto_201348 ) ( ON ?auto_201345 ?auto_201343 ) ( not ( = ?auto_201344 ?auto_201348 ) ) ( not ( = ?auto_201344 ?auto_201343 ) ) ( not ( = ?auto_201344 ?auto_201345 ) ) ( not ( = ?auto_201344 ?auto_201346 ) ) ( not ( = ?auto_201344 ?auto_201347 ) ) ( not ( = ?auto_201348 ?auto_201343 ) ) ( not ( = ?auto_201348 ?auto_201345 ) ) ( not ( = ?auto_201348 ?auto_201346 ) ) ( not ( = ?auto_201348 ?auto_201347 ) ) ( not ( = ?auto_201343 ?auto_201345 ) ) ( not ( = ?auto_201343 ?auto_201346 ) ) ( not ( = ?auto_201343 ?auto_201347 ) ) ( not ( = ?auto_201345 ?auto_201346 ) ) ( not ( = ?auto_201345 ?auto_201347 ) ) ( not ( = ?auto_201346 ?auto_201347 ) ) ( not ( = ?auto_201341 ?auto_201346 ) ) ( not ( = ?auto_201341 ?auto_201344 ) ) ( not ( = ?auto_201341 ?auto_201348 ) ) ( not ( = ?auto_201341 ?auto_201343 ) ) ( not ( = ?auto_201341 ?auto_201345 ) ) ( not ( = ?auto_201342 ?auto_201346 ) ) ( not ( = ?auto_201342 ?auto_201344 ) ) ( not ( = ?auto_201342 ?auto_201348 ) ) ( not ( = ?auto_201342 ?auto_201343 ) ) ( not ( = ?auto_201342 ?auto_201345 ) ) ( not ( = ?auto_201349 ?auto_201346 ) ) ( not ( = ?auto_201349 ?auto_201344 ) ) ( not ( = ?auto_201349 ?auto_201348 ) ) ( not ( = ?auto_201349 ?auto_201343 ) ) ( not ( = ?auto_201349 ?auto_201345 ) ) ( ON ?auto_201347 ?auto_201349 ) ( CLEAR ?auto_201345 ) ( ON ?auto_201346 ?auto_201347 ) ( CLEAR ?auto_201346 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_201341 ?auto_201342 ?auto_201349 ?auto_201347 )
      ( MAKE-1PILE ?auto_201341 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_201350 - BLOCK
    )
    :vars
    (
      ?auto_201351 - BLOCK
      ?auto_201356 - BLOCK
      ?auto_201357 - BLOCK
      ?auto_201353 - BLOCK
      ?auto_201354 - BLOCK
      ?auto_201358 - BLOCK
      ?auto_201355 - BLOCK
      ?auto_201352 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_201351 ?auto_201350 ) ( ON-TABLE ?auto_201350 ) ( not ( = ?auto_201350 ?auto_201351 ) ) ( not ( = ?auto_201350 ?auto_201356 ) ) ( not ( = ?auto_201350 ?auto_201357 ) ) ( not ( = ?auto_201351 ?auto_201356 ) ) ( not ( = ?auto_201351 ?auto_201357 ) ) ( not ( = ?auto_201356 ?auto_201357 ) ) ( ON ?auto_201356 ?auto_201351 ) ( ON-TABLE ?auto_201353 ) ( ON ?auto_201354 ?auto_201353 ) ( ON ?auto_201358 ?auto_201354 ) ( not ( = ?auto_201353 ?auto_201354 ) ) ( not ( = ?auto_201353 ?auto_201358 ) ) ( not ( = ?auto_201353 ?auto_201355 ) ) ( not ( = ?auto_201353 ?auto_201352 ) ) ( not ( = ?auto_201353 ?auto_201357 ) ) ( not ( = ?auto_201354 ?auto_201358 ) ) ( not ( = ?auto_201354 ?auto_201355 ) ) ( not ( = ?auto_201354 ?auto_201352 ) ) ( not ( = ?auto_201354 ?auto_201357 ) ) ( not ( = ?auto_201358 ?auto_201355 ) ) ( not ( = ?auto_201358 ?auto_201352 ) ) ( not ( = ?auto_201358 ?auto_201357 ) ) ( not ( = ?auto_201355 ?auto_201352 ) ) ( not ( = ?auto_201355 ?auto_201357 ) ) ( not ( = ?auto_201352 ?auto_201357 ) ) ( not ( = ?auto_201350 ?auto_201352 ) ) ( not ( = ?auto_201350 ?auto_201353 ) ) ( not ( = ?auto_201350 ?auto_201354 ) ) ( not ( = ?auto_201350 ?auto_201358 ) ) ( not ( = ?auto_201350 ?auto_201355 ) ) ( not ( = ?auto_201351 ?auto_201352 ) ) ( not ( = ?auto_201351 ?auto_201353 ) ) ( not ( = ?auto_201351 ?auto_201354 ) ) ( not ( = ?auto_201351 ?auto_201358 ) ) ( not ( = ?auto_201351 ?auto_201355 ) ) ( not ( = ?auto_201356 ?auto_201352 ) ) ( not ( = ?auto_201356 ?auto_201353 ) ) ( not ( = ?auto_201356 ?auto_201354 ) ) ( not ( = ?auto_201356 ?auto_201358 ) ) ( not ( = ?auto_201356 ?auto_201355 ) ) ( ON ?auto_201357 ?auto_201356 ) ( ON ?auto_201352 ?auto_201357 ) ( CLEAR ?auto_201352 ) ( HOLDING ?auto_201355 ) ( CLEAR ?auto_201358 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_201353 ?auto_201354 ?auto_201358 ?auto_201355 )
      ( MAKE-1PILE ?auto_201350 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_201359 - BLOCK
    )
    :vars
    (
      ?auto_201363 - BLOCK
      ?auto_201361 - BLOCK
      ?auto_201367 - BLOCK
      ?auto_201362 - BLOCK
      ?auto_201360 - BLOCK
      ?auto_201364 - BLOCK
      ?auto_201366 - BLOCK
      ?auto_201365 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_201363 ?auto_201359 ) ( ON-TABLE ?auto_201359 ) ( not ( = ?auto_201359 ?auto_201363 ) ) ( not ( = ?auto_201359 ?auto_201361 ) ) ( not ( = ?auto_201359 ?auto_201367 ) ) ( not ( = ?auto_201363 ?auto_201361 ) ) ( not ( = ?auto_201363 ?auto_201367 ) ) ( not ( = ?auto_201361 ?auto_201367 ) ) ( ON ?auto_201361 ?auto_201363 ) ( ON-TABLE ?auto_201362 ) ( ON ?auto_201360 ?auto_201362 ) ( ON ?auto_201364 ?auto_201360 ) ( not ( = ?auto_201362 ?auto_201360 ) ) ( not ( = ?auto_201362 ?auto_201364 ) ) ( not ( = ?auto_201362 ?auto_201366 ) ) ( not ( = ?auto_201362 ?auto_201365 ) ) ( not ( = ?auto_201362 ?auto_201367 ) ) ( not ( = ?auto_201360 ?auto_201364 ) ) ( not ( = ?auto_201360 ?auto_201366 ) ) ( not ( = ?auto_201360 ?auto_201365 ) ) ( not ( = ?auto_201360 ?auto_201367 ) ) ( not ( = ?auto_201364 ?auto_201366 ) ) ( not ( = ?auto_201364 ?auto_201365 ) ) ( not ( = ?auto_201364 ?auto_201367 ) ) ( not ( = ?auto_201366 ?auto_201365 ) ) ( not ( = ?auto_201366 ?auto_201367 ) ) ( not ( = ?auto_201365 ?auto_201367 ) ) ( not ( = ?auto_201359 ?auto_201365 ) ) ( not ( = ?auto_201359 ?auto_201362 ) ) ( not ( = ?auto_201359 ?auto_201360 ) ) ( not ( = ?auto_201359 ?auto_201364 ) ) ( not ( = ?auto_201359 ?auto_201366 ) ) ( not ( = ?auto_201363 ?auto_201365 ) ) ( not ( = ?auto_201363 ?auto_201362 ) ) ( not ( = ?auto_201363 ?auto_201360 ) ) ( not ( = ?auto_201363 ?auto_201364 ) ) ( not ( = ?auto_201363 ?auto_201366 ) ) ( not ( = ?auto_201361 ?auto_201365 ) ) ( not ( = ?auto_201361 ?auto_201362 ) ) ( not ( = ?auto_201361 ?auto_201360 ) ) ( not ( = ?auto_201361 ?auto_201364 ) ) ( not ( = ?auto_201361 ?auto_201366 ) ) ( ON ?auto_201367 ?auto_201361 ) ( ON ?auto_201365 ?auto_201367 ) ( CLEAR ?auto_201364 ) ( ON ?auto_201366 ?auto_201365 ) ( CLEAR ?auto_201366 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_201359 ?auto_201363 ?auto_201361 ?auto_201367 ?auto_201365 )
      ( MAKE-1PILE ?auto_201359 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_201368 - BLOCK
    )
    :vars
    (
      ?auto_201370 - BLOCK
      ?auto_201375 - BLOCK
      ?auto_201372 - BLOCK
      ?auto_201369 - BLOCK
      ?auto_201374 - BLOCK
      ?auto_201373 - BLOCK
      ?auto_201376 - BLOCK
      ?auto_201371 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_201370 ?auto_201368 ) ( ON-TABLE ?auto_201368 ) ( not ( = ?auto_201368 ?auto_201370 ) ) ( not ( = ?auto_201368 ?auto_201375 ) ) ( not ( = ?auto_201368 ?auto_201372 ) ) ( not ( = ?auto_201370 ?auto_201375 ) ) ( not ( = ?auto_201370 ?auto_201372 ) ) ( not ( = ?auto_201375 ?auto_201372 ) ) ( ON ?auto_201375 ?auto_201370 ) ( ON-TABLE ?auto_201369 ) ( ON ?auto_201374 ?auto_201369 ) ( not ( = ?auto_201369 ?auto_201374 ) ) ( not ( = ?auto_201369 ?auto_201373 ) ) ( not ( = ?auto_201369 ?auto_201376 ) ) ( not ( = ?auto_201369 ?auto_201371 ) ) ( not ( = ?auto_201369 ?auto_201372 ) ) ( not ( = ?auto_201374 ?auto_201373 ) ) ( not ( = ?auto_201374 ?auto_201376 ) ) ( not ( = ?auto_201374 ?auto_201371 ) ) ( not ( = ?auto_201374 ?auto_201372 ) ) ( not ( = ?auto_201373 ?auto_201376 ) ) ( not ( = ?auto_201373 ?auto_201371 ) ) ( not ( = ?auto_201373 ?auto_201372 ) ) ( not ( = ?auto_201376 ?auto_201371 ) ) ( not ( = ?auto_201376 ?auto_201372 ) ) ( not ( = ?auto_201371 ?auto_201372 ) ) ( not ( = ?auto_201368 ?auto_201371 ) ) ( not ( = ?auto_201368 ?auto_201369 ) ) ( not ( = ?auto_201368 ?auto_201374 ) ) ( not ( = ?auto_201368 ?auto_201373 ) ) ( not ( = ?auto_201368 ?auto_201376 ) ) ( not ( = ?auto_201370 ?auto_201371 ) ) ( not ( = ?auto_201370 ?auto_201369 ) ) ( not ( = ?auto_201370 ?auto_201374 ) ) ( not ( = ?auto_201370 ?auto_201373 ) ) ( not ( = ?auto_201370 ?auto_201376 ) ) ( not ( = ?auto_201375 ?auto_201371 ) ) ( not ( = ?auto_201375 ?auto_201369 ) ) ( not ( = ?auto_201375 ?auto_201374 ) ) ( not ( = ?auto_201375 ?auto_201373 ) ) ( not ( = ?auto_201375 ?auto_201376 ) ) ( ON ?auto_201372 ?auto_201375 ) ( ON ?auto_201371 ?auto_201372 ) ( ON ?auto_201376 ?auto_201371 ) ( CLEAR ?auto_201376 ) ( HOLDING ?auto_201373 ) ( CLEAR ?auto_201374 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_201369 ?auto_201374 ?auto_201373 )
      ( MAKE-1PILE ?auto_201368 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_201377 - BLOCK
    )
    :vars
    (
      ?auto_201378 - BLOCK
      ?auto_201382 - BLOCK
      ?auto_201383 - BLOCK
      ?auto_201379 - BLOCK
      ?auto_201381 - BLOCK
      ?auto_201385 - BLOCK
      ?auto_201380 - BLOCK
      ?auto_201384 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_201378 ?auto_201377 ) ( ON-TABLE ?auto_201377 ) ( not ( = ?auto_201377 ?auto_201378 ) ) ( not ( = ?auto_201377 ?auto_201382 ) ) ( not ( = ?auto_201377 ?auto_201383 ) ) ( not ( = ?auto_201378 ?auto_201382 ) ) ( not ( = ?auto_201378 ?auto_201383 ) ) ( not ( = ?auto_201382 ?auto_201383 ) ) ( ON ?auto_201382 ?auto_201378 ) ( ON-TABLE ?auto_201379 ) ( ON ?auto_201381 ?auto_201379 ) ( not ( = ?auto_201379 ?auto_201381 ) ) ( not ( = ?auto_201379 ?auto_201385 ) ) ( not ( = ?auto_201379 ?auto_201380 ) ) ( not ( = ?auto_201379 ?auto_201384 ) ) ( not ( = ?auto_201379 ?auto_201383 ) ) ( not ( = ?auto_201381 ?auto_201385 ) ) ( not ( = ?auto_201381 ?auto_201380 ) ) ( not ( = ?auto_201381 ?auto_201384 ) ) ( not ( = ?auto_201381 ?auto_201383 ) ) ( not ( = ?auto_201385 ?auto_201380 ) ) ( not ( = ?auto_201385 ?auto_201384 ) ) ( not ( = ?auto_201385 ?auto_201383 ) ) ( not ( = ?auto_201380 ?auto_201384 ) ) ( not ( = ?auto_201380 ?auto_201383 ) ) ( not ( = ?auto_201384 ?auto_201383 ) ) ( not ( = ?auto_201377 ?auto_201384 ) ) ( not ( = ?auto_201377 ?auto_201379 ) ) ( not ( = ?auto_201377 ?auto_201381 ) ) ( not ( = ?auto_201377 ?auto_201385 ) ) ( not ( = ?auto_201377 ?auto_201380 ) ) ( not ( = ?auto_201378 ?auto_201384 ) ) ( not ( = ?auto_201378 ?auto_201379 ) ) ( not ( = ?auto_201378 ?auto_201381 ) ) ( not ( = ?auto_201378 ?auto_201385 ) ) ( not ( = ?auto_201378 ?auto_201380 ) ) ( not ( = ?auto_201382 ?auto_201384 ) ) ( not ( = ?auto_201382 ?auto_201379 ) ) ( not ( = ?auto_201382 ?auto_201381 ) ) ( not ( = ?auto_201382 ?auto_201385 ) ) ( not ( = ?auto_201382 ?auto_201380 ) ) ( ON ?auto_201383 ?auto_201382 ) ( ON ?auto_201384 ?auto_201383 ) ( ON ?auto_201380 ?auto_201384 ) ( CLEAR ?auto_201381 ) ( ON ?auto_201385 ?auto_201380 ) ( CLEAR ?auto_201385 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_201377 ?auto_201378 ?auto_201382 ?auto_201383 ?auto_201384 ?auto_201380 )
      ( MAKE-1PILE ?auto_201377 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_201386 - BLOCK
    )
    :vars
    (
      ?auto_201390 - BLOCK
      ?auto_201388 - BLOCK
      ?auto_201387 - BLOCK
      ?auto_201394 - BLOCK
      ?auto_201393 - BLOCK
      ?auto_201389 - BLOCK
      ?auto_201391 - BLOCK
      ?auto_201392 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_201390 ?auto_201386 ) ( ON-TABLE ?auto_201386 ) ( not ( = ?auto_201386 ?auto_201390 ) ) ( not ( = ?auto_201386 ?auto_201388 ) ) ( not ( = ?auto_201386 ?auto_201387 ) ) ( not ( = ?auto_201390 ?auto_201388 ) ) ( not ( = ?auto_201390 ?auto_201387 ) ) ( not ( = ?auto_201388 ?auto_201387 ) ) ( ON ?auto_201388 ?auto_201390 ) ( ON-TABLE ?auto_201394 ) ( not ( = ?auto_201394 ?auto_201393 ) ) ( not ( = ?auto_201394 ?auto_201389 ) ) ( not ( = ?auto_201394 ?auto_201391 ) ) ( not ( = ?auto_201394 ?auto_201392 ) ) ( not ( = ?auto_201394 ?auto_201387 ) ) ( not ( = ?auto_201393 ?auto_201389 ) ) ( not ( = ?auto_201393 ?auto_201391 ) ) ( not ( = ?auto_201393 ?auto_201392 ) ) ( not ( = ?auto_201393 ?auto_201387 ) ) ( not ( = ?auto_201389 ?auto_201391 ) ) ( not ( = ?auto_201389 ?auto_201392 ) ) ( not ( = ?auto_201389 ?auto_201387 ) ) ( not ( = ?auto_201391 ?auto_201392 ) ) ( not ( = ?auto_201391 ?auto_201387 ) ) ( not ( = ?auto_201392 ?auto_201387 ) ) ( not ( = ?auto_201386 ?auto_201392 ) ) ( not ( = ?auto_201386 ?auto_201394 ) ) ( not ( = ?auto_201386 ?auto_201393 ) ) ( not ( = ?auto_201386 ?auto_201389 ) ) ( not ( = ?auto_201386 ?auto_201391 ) ) ( not ( = ?auto_201390 ?auto_201392 ) ) ( not ( = ?auto_201390 ?auto_201394 ) ) ( not ( = ?auto_201390 ?auto_201393 ) ) ( not ( = ?auto_201390 ?auto_201389 ) ) ( not ( = ?auto_201390 ?auto_201391 ) ) ( not ( = ?auto_201388 ?auto_201392 ) ) ( not ( = ?auto_201388 ?auto_201394 ) ) ( not ( = ?auto_201388 ?auto_201393 ) ) ( not ( = ?auto_201388 ?auto_201389 ) ) ( not ( = ?auto_201388 ?auto_201391 ) ) ( ON ?auto_201387 ?auto_201388 ) ( ON ?auto_201392 ?auto_201387 ) ( ON ?auto_201391 ?auto_201392 ) ( ON ?auto_201389 ?auto_201391 ) ( CLEAR ?auto_201389 ) ( HOLDING ?auto_201393 ) ( CLEAR ?auto_201394 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_201394 ?auto_201393 )
      ( MAKE-1PILE ?auto_201386 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_201395 - BLOCK
    )
    :vars
    (
      ?auto_201398 - BLOCK
      ?auto_201403 - BLOCK
      ?auto_201401 - BLOCK
      ?auto_201399 - BLOCK
      ?auto_201400 - BLOCK
      ?auto_201396 - BLOCK
      ?auto_201397 - BLOCK
      ?auto_201402 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_201398 ?auto_201395 ) ( ON-TABLE ?auto_201395 ) ( not ( = ?auto_201395 ?auto_201398 ) ) ( not ( = ?auto_201395 ?auto_201403 ) ) ( not ( = ?auto_201395 ?auto_201401 ) ) ( not ( = ?auto_201398 ?auto_201403 ) ) ( not ( = ?auto_201398 ?auto_201401 ) ) ( not ( = ?auto_201403 ?auto_201401 ) ) ( ON ?auto_201403 ?auto_201398 ) ( ON-TABLE ?auto_201399 ) ( not ( = ?auto_201399 ?auto_201400 ) ) ( not ( = ?auto_201399 ?auto_201396 ) ) ( not ( = ?auto_201399 ?auto_201397 ) ) ( not ( = ?auto_201399 ?auto_201402 ) ) ( not ( = ?auto_201399 ?auto_201401 ) ) ( not ( = ?auto_201400 ?auto_201396 ) ) ( not ( = ?auto_201400 ?auto_201397 ) ) ( not ( = ?auto_201400 ?auto_201402 ) ) ( not ( = ?auto_201400 ?auto_201401 ) ) ( not ( = ?auto_201396 ?auto_201397 ) ) ( not ( = ?auto_201396 ?auto_201402 ) ) ( not ( = ?auto_201396 ?auto_201401 ) ) ( not ( = ?auto_201397 ?auto_201402 ) ) ( not ( = ?auto_201397 ?auto_201401 ) ) ( not ( = ?auto_201402 ?auto_201401 ) ) ( not ( = ?auto_201395 ?auto_201402 ) ) ( not ( = ?auto_201395 ?auto_201399 ) ) ( not ( = ?auto_201395 ?auto_201400 ) ) ( not ( = ?auto_201395 ?auto_201396 ) ) ( not ( = ?auto_201395 ?auto_201397 ) ) ( not ( = ?auto_201398 ?auto_201402 ) ) ( not ( = ?auto_201398 ?auto_201399 ) ) ( not ( = ?auto_201398 ?auto_201400 ) ) ( not ( = ?auto_201398 ?auto_201396 ) ) ( not ( = ?auto_201398 ?auto_201397 ) ) ( not ( = ?auto_201403 ?auto_201402 ) ) ( not ( = ?auto_201403 ?auto_201399 ) ) ( not ( = ?auto_201403 ?auto_201400 ) ) ( not ( = ?auto_201403 ?auto_201396 ) ) ( not ( = ?auto_201403 ?auto_201397 ) ) ( ON ?auto_201401 ?auto_201403 ) ( ON ?auto_201402 ?auto_201401 ) ( ON ?auto_201397 ?auto_201402 ) ( ON ?auto_201396 ?auto_201397 ) ( CLEAR ?auto_201399 ) ( ON ?auto_201400 ?auto_201396 ) ( CLEAR ?auto_201400 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_201395 ?auto_201398 ?auto_201403 ?auto_201401 ?auto_201402 ?auto_201397 ?auto_201396 )
      ( MAKE-1PILE ?auto_201395 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_201404 - BLOCK
    )
    :vars
    (
      ?auto_201408 - BLOCK
      ?auto_201407 - BLOCK
      ?auto_201406 - BLOCK
      ?auto_201411 - BLOCK
      ?auto_201405 - BLOCK
      ?auto_201412 - BLOCK
      ?auto_201410 - BLOCK
      ?auto_201409 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_201408 ?auto_201404 ) ( ON-TABLE ?auto_201404 ) ( not ( = ?auto_201404 ?auto_201408 ) ) ( not ( = ?auto_201404 ?auto_201407 ) ) ( not ( = ?auto_201404 ?auto_201406 ) ) ( not ( = ?auto_201408 ?auto_201407 ) ) ( not ( = ?auto_201408 ?auto_201406 ) ) ( not ( = ?auto_201407 ?auto_201406 ) ) ( ON ?auto_201407 ?auto_201408 ) ( not ( = ?auto_201411 ?auto_201405 ) ) ( not ( = ?auto_201411 ?auto_201412 ) ) ( not ( = ?auto_201411 ?auto_201410 ) ) ( not ( = ?auto_201411 ?auto_201409 ) ) ( not ( = ?auto_201411 ?auto_201406 ) ) ( not ( = ?auto_201405 ?auto_201412 ) ) ( not ( = ?auto_201405 ?auto_201410 ) ) ( not ( = ?auto_201405 ?auto_201409 ) ) ( not ( = ?auto_201405 ?auto_201406 ) ) ( not ( = ?auto_201412 ?auto_201410 ) ) ( not ( = ?auto_201412 ?auto_201409 ) ) ( not ( = ?auto_201412 ?auto_201406 ) ) ( not ( = ?auto_201410 ?auto_201409 ) ) ( not ( = ?auto_201410 ?auto_201406 ) ) ( not ( = ?auto_201409 ?auto_201406 ) ) ( not ( = ?auto_201404 ?auto_201409 ) ) ( not ( = ?auto_201404 ?auto_201411 ) ) ( not ( = ?auto_201404 ?auto_201405 ) ) ( not ( = ?auto_201404 ?auto_201412 ) ) ( not ( = ?auto_201404 ?auto_201410 ) ) ( not ( = ?auto_201408 ?auto_201409 ) ) ( not ( = ?auto_201408 ?auto_201411 ) ) ( not ( = ?auto_201408 ?auto_201405 ) ) ( not ( = ?auto_201408 ?auto_201412 ) ) ( not ( = ?auto_201408 ?auto_201410 ) ) ( not ( = ?auto_201407 ?auto_201409 ) ) ( not ( = ?auto_201407 ?auto_201411 ) ) ( not ( = ?auto_201407 ?auto_201405 ) ) ( not ( = ?auto_201407 ?auto_201412 ) ) ( not ( = ?auto_201407 ?auto_201410 ) ) ( ON ?auto_201406 ?auto_201407 ) ( ON ?auto_201409 ?auto_201406 ) ( ON ?auto_201410 ?auto_201409 ) ( ON ?auto_201412 ?auto_201410 ) ( ON ?auto_201405 ?auto_201412 ) ( CLEAR ?auto_201405 ) ( HOLDING ?auto_201411 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_201411 )
      ( MAKE-1PILE ?auto_201404 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_201413 - BLOCK
    )
    :vars
    (
      ?auto_201417 - BLOCK
      ?auto_201421 - BLOCK
      ?auto_201420 - BLOCK
      ?auto_201416 - BLOCK
      ?auto_201415 - BLOCK
      ?auto_201414 - BLOCK
      ?auto_201418 - BLOCK
      ?auto_201419 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_201417 ?auto_201413 ) ( ON-TABLE ?auto_201413 ) ( not ( = ?auto_201413 ?auto_201417 ) ) ( not ( = ?auto_201413 ?auto_201421 ) ) ( not ( = ?auto_201413 ?auto_201420 ) ) ( not ( = ?auto_201417 ?auto_201421 ) ) ( not ( = ?auto_201417 ?auto_201420 ) ) ( not ( = ?auto_201421 ?auto_201420 ) ) ( ON ?auto_201421 ?auto_201417 ) ( not ( = ?auto_201416 ?auto_201415 ) ) ( not ( = ?auto_201416 ?auto_201414 ) ) ( not ( = ?auto_201416 ?auto_201418 ) ) ( not ( = ?auto_201416 ?auto_201419 ) ) ( not ( = ?auto_201416 ?auto_201420 ) ) ( not ( = ?auto_201415 ?auto_201414 ) ) ( not ( = ?auto_201415 ?auto_201418 ) ) ( not ( = ?auto_201415 ?auto_201419 ) ) ( not ( = ?auto_201415 ?auto_201420 ) ) ( not ( = ?auto_201414 ?auto_201418 ) ) ( not ( = ?auto_201414 ?auto_201419 ) ) ( not ( = ?auto_201414 ?auto_201420 ) ) ( not ( = ?auto_201418 ?auto_201419 ) ) ( not ( = ?auto_201418 ?auto_201420 ) ) ( not ( = ?auto_201419 ?auto_201420 ) ) ( not ( = ?auto_201413 ?auto_201419 ) ) ( not ( = ?auto_201413 ?auto_201416 ) ) ( not ( = ?auto_201413 ?auto_201415 ) ) ( not ( = ?auto_201413 ?auto_201414 ) ) ( not ( = ?auto_201413 ?auto_201418 ) ) ( not ( = ?auto_201417 ?auto_201419 ) ) ( not ( = ?auto_201417 ?auto_201416 ) ) ( not ( = ?auto_201417 ?auto_201415 ) ) ( not ( = ?auto_201417 ?auto_201414 ) ) ( not ( = ?auto_201417 ?auto_201418 ) ) ( not ( = ?auto_201421 ?auto_201419 ) ) ( not ( = ?auto_201421 ?auto_201416 ) ) ( not ( = ?auto_201421 ?auto_201415 ) ) ( not ( = ?auto_201421 ?auto_201414 ) ) ( not ( = ?auto_201421 ?auto_201418 ) ) ( ON ?auto_201420 ?auto_201421 ) ( ON ?auto_201419 ?auto_201420 ) ( ON ?auto_201418 ?auto_201419 ) ( ON ?auto_201414 ?auto_201418 ) ( ON ?auto_201415 ?auto_201414 ) ( ON ?auto_201416 ?auto_201415 ) ( CLEAR ?auto_201416 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_201413 ?auto_201417 ?auto_201421 ?auto_201420 ?auto_201419 ?auto_201418 ?auto_201414 ?auto_201415 )
      ( MAKE-1PILE ?auto_201413 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_201430 - BLOCK
      ?auto_201431 - BLOCK
      ?auto_201432 - BLOCK
      ?auto_201433 - BLOCK
      ?auto_201434 - BLOCK
      ?auto_201435 - BLOCK
      ?auto_201436 - BLOCK
      ?auto_201437 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_201437 ) ( CLEAR ?auto_201436 ) ( ON-TABLE ?auto_201430 ) ( ON ?auto_201431 ?auto_201430 ) ( ON ?auto_201432 ?auto_201431 ) ( ON ?auto_201433 ?auto_201432 ) ( ON ?auto_201434 ?auto_201433 ) ( ON ?auto_201435 ?auto_201434 ) ( ON ?auto_201436 ?auto_201435 ) ( not ( = ?auto_201430 ?auto_201431 ) ) ( not ( = ?auto_201430 ?auto_201432 ) ) ( not ( = ?auto_201430 ?auto_201433 ) ) ( not ( = ?auto_201430 ?auto_201434 ) ) ( not ( = ?auto_201430 ?auto_201435 ) ) ( not ( = ?auto_201430 ?auto_201436 ) ) ( not ( = ?auto_201430 ?auto_201437 ) ) ( not ( = ?auto_201431 ?auto_201432 ) ) ( not ( = ?auto_201431 ?auto_201433 ) ) ( not ( = ?auto_201431 ?auto_201434 ) ) ( not ( = ?auto_201431 ?auto_201435 ) ) ( not ( = ?auto_201431 ?auto_201436 ) ) ( not ( = ?auto_201431 ?auto_201437 ) ) ( not ( = ?auto_201432 ?auto_201433 ) ) ( not ( = ?auto_201432 ?auto_201434 ) ) ( not ( = ?auto_201432 ?auto_201435 ) ) ( not ( = ?auto_201432 ?auto_201436 ) ) ( not ( = ?auto_201432 ?auto_201437 ) ) ( not ( = ?auto_201433 ?auto_201434 ) ) ( not ( = ?auto_201433 ?auto_201435 ) ) ( not ( = ?auto_201433 ?auto_201436 ) ) ( not ( = ?auto_201433 ?auto_201437 ) ) ( not ( = ?auto_201434 ?auto_201435 ) ) ( not ( = ?auto_201434 ?auto_201436 ) ) ( not ( = ?auto_201434 ?auto_201437 ) ) ( not ( = ?auto_201435 ?auto_201436 ) ) ( not ( = ?auto_201435 ?auto_201437 ) ) ( not ( = ?auto_201436 ?auto_201437 ) ) )
    :subtasks
    ( ( !STACK ?auto_201437 ?auto_201436 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_201438 - BLOCK
      ?auto_201439 - BLOCK
      ?auto_201440 - BLOCK
      ?auto_201441 - BLOCK
      ?auto_201442 - BLOCK
      ?auto_201443 - BLOCK
      ?auto_201444 - BLOCK
      ?auto_201445 - BLOCK
    )
    :vars
    (
      ?auto_201446 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_201444 ) ( ON-TABLE ?auto_201438 ) ( ON ?auto_201439 ?auto_201438 ) ( ON ?auto_201440 ?auto_201439 ) ( ON ?auto_201441 ?auto_201440 ) ( ON ?auto_201442 ?auto_201441 ) ( ON ?auto_201443 ?auto_201442 ) ( ON ?auto_201444 ?auto_201443 ) ( not ( = ?auto_201438 ?auto_201439 ) ) ( not ( = ?auto_201438 ?auto_201440 ) ) ( not ( = ?auto_201438 ?auto_201441 ) ) ( not ( = ?auto_201438 ?auto_201442 ) ) ( not ( = ?auto_201438 ?auto_201443 ) ) ( not ( = ?auto_201438 ?auto_201444 ) ) ( not ( = ?auto_201438 ?auto_201445 ) ) ( not ( = ?auto_201439 ?auto_201440 ) ) ( not ( = ?auto_201439 ?auto_201441 ) ) ( not ( = ?auto_201439 ?auto_201442 ) ) ( not ( = ?auto_201439 ?auto_201443 ) ) ( not ( = ?auto_201439 ?auto_201444 ) ) ( not ( = ?auto_201439 ?auto_201445 ) ) ( not ( = ?auto_201440 ?auto_201441 ) ) ( not ( = ?auto_201440 ?auto_201442 ) ) ( not ( = ?auto_201440 ?auto_201443 ) ) ( not ( = ?auto_201440 ?auto_201444 ) ) ( not ( = ?auto_201440 ?auto_201445 ) ) ( not ( = ?auto_201441 ?auto_201442 ) ) ( not ( = ?auto_201441 ?auto_201443 ) ) ( not ( = ?auto_201441 ?auto_201444 ) ) ( not ( = ?auto_201441 ?auto_201445 ) ) ( not ( = ?auto_201442 ?auto_201443 ) ) ( not ( = ?auto_201442 ?auto_201444 ) ) ( not ( = ?auto_201442 ?auto_201445 ) ) ( not ( = ?auto_201443 ?auto_201444 ) ) ( not ( = ?auto_201443 ?auto_201445 ) ) ( not ( = ?auto_201444 ?auto_201445 ) ) ( ON ?auto_201445 ?auto_201446 ) ( CLEAR ?auto_201445 ) ( HAND-EMPTY ) ( not ( = ?auto_201438 ?auto_201446 ) ) ( not ( = ?auto_201439 ?auto_201446 ) ) ( not ( = ?auto_201440 ?auto_201446 ) ) ( not ( = ?auto_201441 ?auto_201446 ) ) ( not ( = ?auto_201442 ?auto_201446 ) ) ( not ( = ?auto_201443 ?auto_201446 ) ) ( not ( = ?auto_201444 ?auto_201446 ) ) ( not ( = ?auto_201445 ?auto_201446 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_201445 ?auto_201446 )
      ( MAKE-8PILE ?auto_201438 ?auto_201439 ?auto_201440 ?auto_201441 ?auto_201442 ?auto_201443 ?auto_201444 ?auto_201445 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_201447 - BLOCK
      ?auto_201448 - BLOCK
      ?auto_201449 - BLOCK
      ?auto_201450 - BLOCK
      ?auto_201451 - BLOCK
      ?auto_201452 - BLOCK
      ?auto_201453 - BLOCK
      ?auto_201454 - BLOCK
    )
    :vars
    (
      ?auto_201455 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_201447 ) ( ON ?auto_201448 ?auto_201447 ) ( ON ?auto_201449 ?auto_201448 ) ( ON ?auto_201450 ?auto_201449 ) ( ON ?auto_201451 ?auto_201450 ) ( ON ?auto_201452 ?auto_201451 ) ( not ( = ?auto_201447 ?auto_201448 ) ) ( not ( = ?auto_201447 ?auto_201449 ) ) ( not ( = ?auto_201447 ?auto_201450 ) ) ( not ( = ?auto_201447 ?auto_201451 ) ) ( not ( = ?auto_201447 ?auto_201452 ) ) ( not ( = ?auto_201447 ?auto_201453 ) ) ( not ( = ?auto_201447 ?auto_201454 ) ) ( not ( = ?auto_201448 ?auto_201449 ) ) ( not ( = ?auto_201448 ?auto_201450 ) ) ( not ( = ?auto_201448 ?auto_201451 ) ) ( not ( = ?auto_201448 ?auto_201452 ) ) ( not ( = ?auto_201448 ?auto_201453 ) ) ( not ( = ?auto_201448 ?auto_201454 ) ) ( not ( = ?auto_201449 ?auto_201450 ) ) ( not ( = ?auto_201449 ?auto_201451 ) ) ( not ( = ?auto_201449 ?auto_201452 ) ) ( not ( = ?auto_201449 ?auto_201453 ) ) ( not ( = ?auto_201449 ?auto_201454 ) ) ( not ( = ?auto_201450 ?auto_201451 ) ) ( not ( = ?auto_201450 ?auto_201452 ) ) ( not ( = ?auto_201450 ?auto_201453 ) ) ( not ( = ?auto_201450 ?auto_201454 ) ) ( not ( = ?auto_201451 ?auto_201452 ) ) ( not ( = ?auto_201451 ?auto_201453 ) ) ( not ( = ?auto_201451 ?auto_201454 ) ) ( not ( = ?auto_201452 ?auto_201453 ) ) ( not ( = ?auto_201452 ?auto_201454 ) ) ( not ( = ?auto_201453 ?auto_201454 ) ) ( ON ?auto_201454 ?auto_201455 ) ( CLEAR ?auto_201454 ) ( not ( = ?auto_201447 ?auto_201455 ) ) ( not ( = ?auto_201448 ?auto_201455 ) ) ( not ( = ?auto_201449 ?auto_201455 ) ) ( not ( = ?auto_201450 ?auto_201455 ) ) ( not ( = ?auto_201451 ?auto_201455 ) ) ( not ( = ?auto_201452 ?auto_201455 ) ) ( not ( = ?auto_201453 ?auto_201455 ) ) ( not ( = ?auto_201454 ?auto_201455 ) ) ( HOLDING ?auto_201453 ) ( CLEAR ?auto_201452 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_201447 ?auto_201448 ?auto_201449 ?auto_201450 ?auto_201451 ?auto_201452 ?auto_201453 )
      ( MAKE-8PILE ?auto_201447 ?auto_201448 ?auto_201449 ?auto_201450 ?auto_201451 ?auto_201452 ?auto_201453 ?auto_201454 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_201456 - BLOCK
      ?auto_201457 - BLOCK
      ?auto_201458 - BLOCK
      ?auto_201459 - BLOCK
      ?auto_201460 - BLOCK
      ?auto_201461 - BLOCK
      ?auto_201462 - BLOCK
      ?auto_201463 - BLOCK
    )
    :vars
    (
      ?auto_201464 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_201456 ) ( ON ?auto_201457 ?auto_201456 ) ( ON ?auto_201458 ?auto_201457 ) ( ON ?auto_201459 ?auto_201458 ) ( ON ?auto_201460 ?auto_201459 ) ( ON ?auto_201461 ?auto_201460 ) ( not ( = ?auto_201456 ?auto_201457 ) ) ( not ( = ?auto_201456 ?auto_201458 ) ) ( not ( = ?auto_201456 ?auto_201459 ) ) ( not ( = ?auto_201456 ?auto_201460 ) ) ( not ( = ?auto_201456 ?auto_201461 ) ) ( not ( = ?auto_201456 ?auto_201462 ) ) ( not ( = ?auto_201456 ?auto_201463 ) ) ( not ( = ?auto_201457 ?auto_201458 ) ) ( not ( = ?auto_201457 ?auto_201459 ) ) ( not ( = ?auto_201457 ?auto_201460 ) ) ( not ( = ?auto_201457 ?auto_201461 ) ) ( not ( = ?auto_201457 ?auto_201462 ) ) ( not ( = ?auto_201457 ?auto_201463 ) ) ( not ( = ?auto_201458 ?auto_201459 ) ) ( not ( = ?auto_201458 ?auto_201460 ) ) ( not ( = ?auto_201458 ?auto_201461 ) ) ( not ( = ?auto_201458 ?auto_201462 ) ) ( not ( = ?auto_201458 ?auto_201463 ) ) ( not ( = ?auto_201459 ?auto_201460 ) ) ( not ( = ?auto_201459 ?auto_201461 ) ) ( not ( = ?auto_201459 ?auto_201462 ) ) ( not ( = ?auto_201459 ?auto_201463 ) ) ( not ( = ?auto_201460 ?auto_201461 ) ) ( not ( = ?auto_201460 ?auto_201462 ) ) ( not ( = ?auto_201460 ?auto_201463 ) ) ( not ( = ?auto_201461 ?auto_201462 ) ) ( not ( = ?auto_201461 ?auto_201463 ) ) ( not ( = ?auto_201462 ?auto_201463 ) ) ( ON ?auto_201463 ?auto_201464 ) ( not ( = ?auto_201456 ?auto_201464 ) ) ( not ( = ?auto_201457 ?auto_201464 ) ) ( not ( = ?auto_201458 ?auto_201464 ) ) ( not ( = ?auto_201459 ?auto_201464 ) ) ( not ( = ?auto_201460 ?auto_201464 ) ) ( not ( = ?auto_201461 ?auto_201464 ) ) ( not ( = ?auto_201462 ?auto_201464 ) ) ( not ( = ?auto_201463 ?auto_201464 ) ) ( CLEAR ?auto_201461 ) ( ON ?auto_201462 ?auto_201463 ) ( CLEAR ?auto_201462 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_201464 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_201464 ?auto_201463 )
      ( MAKE-8PILE ?auto_201456 ?auto_201457 ?auto_201458 ?auto_201459 ?auto_201460 ?auto_201461 ?auto_201462 ?auto_201463 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_201465 - BLOCK
      ?auto_201466 - BLOCK
      ?auto_201467 - BLOCK
      ?auto_201468 - BLOCK
      ?auto_201469 - BLOCK
      ?auto_201470 - BLOCK
      ?auto_201471 - BLOCK
      ?auto_201472 - BLOCK
    )
    :vars
    (
      ?auto_201473 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_201465 ) ( ON ?auto_201466 ?auto_201465 ) ( ON ?auto_201467 ?auto_201466 ) ( ON ?auto_201468 ?auto_201467 ) ( ON ?auto_201469 ?auto_201468 ) ( not ( = ?auto_201465 ?auto_201466 ) ) ( not ( = ?auto_201465 ?auto_201467 ) ) ( not ( = ?auto_201465 ?auto_201468 ) ) ( not ( = ?auto_201465 ?auto_201469 ) ) ( not ( = ?auto_201465 ?auto_201470 ) ) ( not ( = ?auto_201465 ?auto_201471 ) ) ( not ( = ?auto_201465 ?auto_201472 ) ) ( not ( = ?auto_201466 ?auto_201467 ) ) ( not ( = ?auto_201466 ?auto_201468 ) ) ( not ( = ?auto_201466 ?auto_201469 ) ) ( not ( = ?auto_201466 ?auto_201470 ) ) ( not ( = ?auto_201466 ?auto_201471 ) ) ( not ( = ?auto_201466 ?auto_201472 ) ) ( not ( = ?auto_201467 ?auto_201468 ) ) ( not ( = ?auto_201467 ?auto_201469 ) ) ( not ( = ?auto_201467 ?auto_201470 ) ) ( not ( = ?auto_201467 ?auto_201471 ) ) ( not ( = ?auto_201467 ?auto_201472 ) ) ( not ( = ?auto_201468 ?auto_201469 ) ) ( not ( = ?auto_201468 ?auto_201470 ) ) ( not ( = ?auto_201468 ?auto_201471 ) ) ( not ( = ?auto_201468 ?auto_201472 ) ) ( not ( = ?auto_201469 ?auto_201470 ) ) ( not ( = ?auto_201469 ?auto_201471 ) ) ( not ( = ?auto_201469 ?auto_201472 ) ) ( not ( = ?auto_201470 ?auto_201471 ) ) ( not ( = ?auto_201470 ?auto_201472 ) ) ( not ( = ?auto_201471 ?auto_201472 ) ) ( ON ?auto_201472 ?auto_201473 ) ( not ( = ?auto_201465 ?auto_201473 ) ) ( not ( = ?auto_201466 ?auto_201473 ) ) ( not ( = ?auto_201467 ?auto_201473 ) ) ( not ( = ?auto_201468 ?auto_201473 ) ) ( not ( = ?auto_201469 ?auto_201473 ) ) ( not ( = ?auto_201470 ?auto_201473 ) ) ( not ( = ?auto_201471 ?auto_201473 ) ) ( not ( = ?auto_201472 ?auto_201473 ) ) ( ON ?auto_201471 ?auto_201472 ) ( CLEAR ?auto_201471 ) ( ON-TABLE ?auto_201473 ) ( HOLDING ?auto_201470 ) ( CLEAR ?auto_201469 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_201465 ?auto_201466 ?auto_201467 ?auto_201468 ?auto_201469 ?auto_201470 )
      ( MAKE-8PILE ?auto_201465 ?auto_201466 ?auto_201467 ?auto_201468 ?auto_201469 ?auto_201470 ?auto_201471 ?auto_201472 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_201474 - BLOCK
      ?auto_201475 - BLOCK
      ?auto_201476 - BLOCK
      ?auto_201477 - BLOCK
      ?auto_201478 - BLOCK
      ?auto_201479 - BLOCK
      ?auto_201480 - BLOCK
      ?auto_201481 - BLOCK
    )
    :vars
    (
      ?auto_201482 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_201474 ) ( ON ?auto_201475 ?auto_201474 ) ( ON ?auto_201476 ?auto_201475 ) ( ON ?auto_201477 ?auto_201476 ) ( ON ?auto_201478 ?auto_201477 ) ( not ( = ?auto_201474 ?auto_201475 ) ) ( not ( = ?auto_201474 ?auto_201476 ) ) ( not ( = ?auto_201474 ?auto_201477 ) ) ( not ( = ?auto_201474 ?auto_201478 ) ) ( not ( = ?auto_201474 ?auto_201479 ) ) ( not ( = ?auto_201474 ?auto_201480 ) ) ( not ( = ?auto_201474 ?auto_201481 ) ) ( not ( = ?auto_201475 ?auto_201476 ) ) ( not ( = ?auto_201475 ?auto_201477 ) ) ( not ( = ?auto_201475 ?auto_201478 ) ) ( not ( = ?auto_201475 ?auto_201479 ) ) ( not ( = ?auto_201475 ?auto_201480 ) ) ( not ( = ?auto_201475 ?auto_201481 ) ) ( not ( = ?auto_201476 ?auto_201477 ) ) ( not ( = ?auto_201476 ?auto_201478 ) ) ( not ( = ?auto_201476 ?auto_201479 ) ) ( not ( = ?auto_201476 ?auto_201480 ) ) ( not ( = ?auto_201476 ?auto_201481 ) ) ( not ( = ?auto_201477 ?auto_201478 ) ) ( not ( = ?auto_201477 ?auto_201479 ) ) ( not ( = ?auto_201477 ?auto_201480 ) ) ( not ( = ?auto_201477 ?auto_201481 ) ) ( not ( = ?auto_201478 ?auto_201479 ) ) ( not ( = ?auto_201478 ?auto_201480 ) ) ( not ( = ?auto_201478 ?auto_201481 ) ) ( not ( = ?auto_201479 ?auto_201480 ) ) ( not ( = ?auto_201479 ?auto_201481 ) ) ( not ( = ?auto_201480 ?auto_201481 ) ) ( ON ?auto_201481 ?auto_201482 ) ( not ( = ?auto_201474 ?auto_201482 ) ) ( not ( = ?auto_201475 ?auto_201482 ) ) ( not ( = ?auto_201476 ?auto_201482 ) ) ( not ( = ?auto_201477 ?auto_201482 ) ) ( not ( = ?auto_201478 ?auto_201482 ) ) ( not ( = ?auto_201479 ?auto_201482 ) ) ( not ( = ?auto_201480 ?auto_201482 ) ) ( not ( = ?auto_201481 ?auto_201482 ) ) ( ON ?auto_201480 ?auto_201481 ) ( ON-TABLE ?auto_201482 ) ( CLEAR ?auto_201478 ) ( ON ?auto_201479 ?auto_201480 ) ( CLEAR ?auto_201479 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_201482 ?auto_201481 ?auto_201480 )
      ( MAKE-8PILE ?auto_201474 ?auto_201475 ?auto_201476 ?auto_201477 ?auto_201478 ?auto_201479 ?auto_201480 ?auto_201481 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_201483 - BLOCK
      ?auto_201484 - BLOCK
      ?auto_201485 - BLOCK
      ?auto_201486 - BLOCK
      ?auto_201487 - BLOCK
      ?auto_201488 - BLOCK
      ?auto_201489 - BLOCK
      ?auto_201490 - BLOCK
    )
    :vars
    (
      ?auto_201491 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_201483 ) ( ON ?auto_201484 ?auto_201483 ) ( ON ?auto_201485 ?auto_201484 ) ( ON ?auto_201486 ?auto_201485 ) ( not ( = ?auto_201483 ?auto_201484 ) ) ( not ( = ?auto_201483 ?auto_201485 ) ) ( not ( = ?auto_201483 ?auto_201486 ) ) ( not ( = ?auto_201483 ?auto_201487 ) ) ( not ( = ?auto_201483 ?auto_201488 ) ) ( not ( = ?auto_201483 ?auto_201489 ) ) ( not ( = ?auto_201483 ?auto_201490 ) ) ( not ( = ?auto_201484 ?auto_201485 ) ) ( not ( = ?auto_201484 ?auto_201486 ) ) ( not ( = ?auto_201484 ?auto_201487 ) ) ( not ( = ?auto_201484 ?auto_201488 ) ) ( not ( = ?auto_201484 ?auto_201489 ) ) ( not ( = ?auto_201484 ?auto_201490 ) ) ( not ( = ?auto_201485 ?auto_201486 ) ) ( not ( = ?auto_201485 ?auto_201487 ) ) ( not ( = ?auto_201485 ?auto_201488 ) ) ( not ( = ?auto_201485 ?auto_201489 ) ) ( not ( = ?auto_201485 ?auto_201490 ) ) ( not ( = ?auto_201486 ?auto_201487 ) ) ( not ( = ?auto_201486 ?auto_201488 ) ) ( not ( = ?auto_201486 ?auto_201489 ) ) ( not ( = ?auto_201486 ?auto_201490 ) ) ( not ( = ?auto_201487 ?auto_201488 ) ) ( not ( = ?auto_201487 ?auto_201489 ) ) ( not ( = ?auto_201487 ?auto_201490 ) ) ( not ( = ?auto_201488 ?auto_201489 ) ) ( not ( = ?auto_201488 ?auto_201490 ) ) ( not ( = ?auto_201489 ?auto_201490 ) ) ( ON ?auto_201490 ?auto_201491 ) ( not ( = ?auto_201483 ?auto_201491 ) ) ( not ( = ?auto_201484 ?auto_201491 ) ) ( not ( = ?auto_201485 ?auto_201491 ) ) ( not ( = ?auto_201486 ?auto_201491 ) ) ( not ( = ?auto_201487 ?auto_201491 ) ) ( not ( = ?auto_201488 ?auto_201491 ) ) ( not ( = ?auto_201489 ?auto_201491 ) ) ( not ( = ?auto_201490 ?auto_201491 ) ) ( ON ?auto_201489 ?auto_201490 ) ( ON-TABLE ?auto_201491 ) ( ON ?auto_201488 ?auto_201489 ) ( CLEAR ?auto_201488 ) ( HOLDING ?auto_201487 ) ( CLEAR ?auto_201486 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_201483 ?auto_201484 ?auto_201485 ?auto_201486 ?auto_201487 )
      ( MAKE-8PILE ?auto_201483 ?auto_201484 ?auto_201485 ?auto_201486 ?auto_201487 ?auto_201488 ?auto_201489 ?auto_201490 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_201492 - BLOCK
      ?auto_201493 - BLOCK
      ?auto_201494 - BLOCK
      ?auto_201495 - BLOCK
      ?auto_201496 - BLOCK
      ?auto_201497 - BLOCK
      ?auto_201498 - BLOCK
      ?auto_201499 - BLOCK
    )
    :vars
    (
      ?auto_201500 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_201492 ) ( ON ?auto_201493 ?auto_201492 ) ( ON ?auto_201494 ?auto_201493 ) ( ON ?auto_201495 ?auto_201494 ) ( not ( = ?auto_201492 ?auto_201493 ) ) ( not ( = ?auto_201492 ?auto_201494 ) ) ( not ( = ?auto_201492 ?auto_201495 ) ) ( not ( = ?auto_201492 ?auto_201496 ) ) ( not ( = ?auto_201492 ?auto_201497 ) ) ( not ( = ?auto_201492 ?auto_201498 ) ) ( not ( = ?auto_201492 ?auto_201499 ) ) ( not ( = ?auto_201493 ?auto_201494 ) ) ( not ( = ?auto_201493 ?auto_201495 ) ) ( not ( = ?auto_201493 ?auto_201496 ) ) ( not ( = ?auto_201493 ?auto_201497 ) ) ( not ( = ?auto_201493 ?auto_201498 ) ) ( not ( = ?auto_201493 ?auto_201499 ) ) ( not ( = ?auto_201494 ?auto_201495 ) ) ( not ( = ?auto_201494 ?auto_201496 ) ) ( not ( = ?auto_201494 ?auto_201497 ) ) ( not ( = ?auto_201494 ?auto_201498 ) ) ( not ( = ?auto_201494 ?auto_201499 ) ) ( not ( = ?auto_201495 ?auto_201496 ) ) ( not ( = ?auto_201495 ?auto_201497 ) ) ( not ( = ?auto_201495 ?auto_201498 ) ) ( not ( = ?auto_201495 ?auto_201499 ) ) ( not ( = ?auto_201496 ?auto_201497 ) ) ( not ( = ?auto_201496 ?auto_201498 ) ) ( not ( = ?auto_201496 ?auto_201499 ) ) ( not ( = ?auto_201497 ?auto_201498 ) ) ( not ( = ?auto_201497 ?auto_201499 ) ) ( not ( = ?auto_201498 ?auto_201499 ) ) ( ON ?auto_201499 ?auto_201500 ) ( not ( = ?auto_201492 ?auto_201500 ) ) ( not ( = ?auto_201493 ?auto_201500 ) ) ( not ( = ?auto_201494 ?auto_201500 ) ) ( not ( = ?auto_201495 ?auto_201500 ) ) ( not ( = ?auto_201496 ?auto_201500 ) ) ( not ( = ?auto_201497 ?auto_201500 ) ) ( not ( = ?auto_201498 ?auto_201500 ) ) ( not ( = ?auto_201499 ?auto_201500 ) ) ( ON ?auto_201498 ?auto_201499 ) ( ON-TABLE ?auto_201500 ) ( ON ?auto_201497 ?auto_201498 ) ( CLEAR ?auto_201495 ) ( ON ?auto_201496 ?auto_201497 ) ( CLEAR ?auto_201496 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_201500 ?auto_201499 ?auto_201498 ?auto_201497 )
      ( MAKE-8PILE ?auto_201492 ?auto_201493 ?auto_201494 ?auto_201495 ?auto_201496 ?auto_201497 ?auto_201498 ?auto_201499 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_201501 - BLOCK
      ?auto_201502 - BLOCK
      ?auto_201503 - BLOCK
      ?auto_201504 - BLOCK
      ?auto_201505 - BLOCK
      ?auto_201506 - BLOCK
      ?auto_201507 - BLOCK
      ?auto_201508 - BLOCK
    )
    :vars
    (
      ?auto_201509 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_201501 ) ( ON ?auto_201502 ?auto_201501 ) ( ON ?auto_201503 ?auto_201502 ) ( not ( = ?auto_201501 ?auto_201502 ) ) ( not ( = ?auto_201501 ?auto_201503 ) ) ( not ( = ?auto_201501 ?auto_201504 ) ) ( not ( = ?auto_201501 ?auto_201505 ) ) ( not ( = ?auto_201501 ?auto_201506 ) ) ( not ( = ?auto_201501 ?auto_201507 ) ) ( not ( = ?auto_201501 ?auto_201508 ) ) ( not ( = ?auto_201502 ?auto_201503 ) ) ( not ( = ?auto_201502 ?auto_201504 ) ) ( not ( = ?auto_201502 ?auto_201505 ) ) ( not ( = ?auto_201502 ?auto_201506 ) ) ( not ( = ?auto_201502 ?auto_201507 ) ) ( not ( = ?auto_201502 ?auto_201508 ) ) ( not ( = ?auto_201503 ?auto_201504 ) ) ( not ( = ?auto_201503 ?auto_201505 ) ) ( not ( = ?auto_201503 ?auto_201506 ) ) ( not ( = ?auto_201503 ?auto_201507 ) ) ( not ( = ?auto_201503 ?auto_201508 ) ) ( not ( = ?auto_201504 ?auto_201505 ) ) ( not ( = ?auto_201504 ?auto_201506 ) ) ( not ( = ?auto_201504 ?auto_201507 ) ) ( not ( = ?auto_201504 ?auto_201508 ) ) ( not ( = ?auto_201505 ?auto_201506 ) ) ( not ( = ?auto_201505 ?auto_201507 ) ) ( not ( = ?auto_201505 ?auto_201508 ) ) ( not ( = ?auto_201506 ?auto_201507 ) ) ( not ( = ?auto_201506 ?auto_201508 ) ) ( not ( = ?auto_201507 ?auto_201508 ) ) ( ON ?auto_201508 ?auto_201509 ) ( not ( = ?auto_201501 ?auto_201509 ) ) ( not ( = ?auto_201502 ?auto_201509 ) ) ( not ( = ?auto_201503 ?auto_201509 ) ) ( not ( = ?auto_201504 ?auto_201509 ) ) ( not ( = ?auto_201505 ?auto_201509 ) ) ( not ( = ?auto_201506 ?auto_201509 ) ) ( not ( = ?auto_201507 ?auto_201509 ) ) ( not ( = ?auto_201508 ?auto_201509 ) ) ( ON ?auto_201507 ?auto_201508 ) ( ON-TABLE ?auto_201509 ) ( ON ?auto_201506 ?auto_201507 ) ( ON ?auto_201505 ?auto_201506 ) ( CLEAR ?auto_201505 ) ( HOLDING ?auto_201504 ) ( CLEAR ?auto_201503 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_201501 ?auto_201502 ?auto_201503 ?auto_201504 )
      ( MAKE-8PILE ?auto_201501 ?auto_201502 ?auto_201503 ?auto_201504 ?auto_201505 ?auto_201506 ?auto_201507 ?auto_201508 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_201510 - BLOCK
      ?auto_201511 - BLOCK
      ?auto_201512 - BLOCK
      ?auto_201513 - BLOCK
      ?auto_201514 - BLOCK
      ?auto_201515 - BLOCK
      ?auto_201516 - BLOCK
      ?auto_201517 - BLOCK
    )
    :vars
    (
      ?auto_201518 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_201510 ) ( ON ?auto_201511 ?auto_201510 ) ( ON ?auto_201512 ?auto_201511 ) ( not ( = ?auto_201510 ?auto_201511 ) ) ( not ( = ?auto_201510 ?auto_201512 ) ) ( not ( = ?auto_201510 ?auto_201513 ) ) ( not ( = ?auto_201510 ?auto_201514 ) ) ( not ( = ?auto_201510 ?auto_201515 ) ) ( not ( = ?auto_201510 ?auto_201516 ) ) ( not ( = ?auto_201510 ?auto_201517 ) ) ( not ( = ?auto_201511 ?auto_201512 ) ) ( not ( = ?auto_201511 ?auto_201513 ) ) ( not ( = ?auto_201511 ?auto_201514 ) ) ( not ( = ?auto_201511 ?auto_201515 ) ) ( not ( = ?auto_201511 ?auto_201516 ) ) ( not ( = ?auto_201511 ?auto_201517 ) ) ( not ( = ?auto_201512 ?auto_201513 ) ) ( not ( = ?auto_201512 ?auto_201514 ) ) ( not ( = ?auto_201512 ?auto_201515 ) ) ( not ( = ?auto_201512 ?auto_201516 ) ) ( not ( = ?auto_201512 ?auto_201517 ) ) ( not ( = ?auto_201513 ?auto_201514 ) ) ( not ( = ?auto_201513 ?auto_201515 ) ) ( not ( = ?auto_201513 ?auto_201516 ) ) ( not ( = ?auto_201513 ?auto_201517 ) ) ( not ( = ?auto_201514 ?auto_201515 ) ) ( not ( = ?auto_201514 ?auto_201516 ) ) ( not ( = ?auto_201514 ?auto_201517 ) ) ( not ( = ?auto_201515 ?auto_201516 ) ) ( not ( = ?auto_201515 ?auto_201517 ) ) ( not ( = ?auto_201516 ?auto_201517 ) ) ( ON ?auto_201517 ?auto_201518 ) ( not ( = ?auto_201510 ?auto_201518 ) ) ( not ( = ?auto_201511 ?auto_201518 ) ) ( not ( = ?auto_201512 ?auto_201518 ) ) ( not ( = ?auto_201513 ?auto_201518 ) ) ( not ( = ?auto_201514 ?auto_201518 ) ) ( not ( = ?auto_201515 ?auto_201518 ) ) ( not ( = ?auto_201516 ?auto_201518 ) ) ( not ( = ?auto_201517 ?auto_201518 ) ) ( ON ?auto_201516 ?auto_201517 ) ( ON-TABLE ?auto_201518 ) ( ON ?auto_201515 ?auto_201516 ) ( ON ?auto_201514 ?auto_201515 ) ( CLEAR ?auto_201512 ) ( ON ?auto_201513 ?auto_201514 ) ( CLEAR ?auto_201513 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_201518 ?auto_201517 ?auto_201516 ?auto_201515 ?auto_201514 )
      ( MAKE-8PILE ?auto_201510 ?auto_201511 ?auto_201512 ?auto_201513 ?auto_201514 ?auto_201515 ?auto_201516 ?auto_201517 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_201519 - BLOCK
      ?auto_201520 - BLOCK
      ?auto_201521 - BLOCK
      ?auto_201522 - BLOCK
      ?auto_201523 - BLOCK
      ?auto_201524 - BLOCK
      ?auto_201525 - BLOCK
      ?auto_201526 - BLOCK
    )
    :vars
    (
      ?auto_201527 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_201519 ) ( ON ?auto_201520 ?auto_201519 ) ( not ( = ?auto_201519 ?auto_201520 ) ) ( not ( = ?auto_201519 ?auto_201521 ) ) ( not ( = ?auto_201519 ?auto_201522 ) ) ( not ( = ?auto_201519 ?auto_201523 ) ) ( not ( = ?auto_201519 ?auto_201524 ) ) ( not ( = ?auto_201519 ?auto_201525 ) ) ( not ( = ?auto_201519 ?auto_201526 ) ) ( not ( = ?auto_201520 ?auto_201521 ) ) ( not ( = ?auto_201520 ?auto_201522 ) ) ( not ( = ?auto_201520 ?auto_201523 ) ) ( not ( = ?auto_201520 ?auto_201524 ) ) ( not ( = ?auto_201520 ?auto_201525 ) ) ( not ( = ?auto_201520 ?auto_201526 ) ) ( not ( = ?auto_201521 ?auto_201522 ) ) ( not ( = ?auto_201521 ?auto_201523 ) ) ( not ( = ?auto_201521 ?auto_201524 ) ) ( not ( = ?auto_201521 ?auto_201525 ) ) ( not ( = ?auto_201521 ?auto_201526 ) ) ( not ( = ?auto_201522 ?auto_201523 ) ) ( not ( = ?auto_201522 ?auto_201524 ) ) ( not ( = ?auto_201522 ?auto_201525 ) ) ( not ( = ?auto_201522 ?auto_201526 ) ) ( not ( = ?auto_201523 ?auto_201524 ) ) ( not ( = ?auto_201523 ?auto_201525 ) ) ( not ( = ?auto_201523 ?auto_201526 ) ) ( not ( = ?auto_201524 ?auto_201525 ) ) ( not ( = ?auto_201524 ?auto_201526 ) ) ( not ( = ?auto_201525 ?auto_201526 ) ) ( ON ?auto_201526 ?auto_201527 ) ( not ( = ?auto_201519 ?auto_201527 ) ) ( not ( = ?auto_201520 ?auto_201527 ) ) ( not ( = ?auto_201521 ?auto_201527 ) ) ( not ( = ?auto_201522 ?auto_201527 ) ) ( not ( = ?auto_201523 ?auto_201527 ) ) ( not ( = ?auto_201524 ?auto_201527 ) ) ( not ( = ?auto_201525 ?auto_201527 ) ) ( not ( = ?auto_201526 ?auto_201527 ) ) ( ON ?auto_201525 ?auto_201526 ) ( ON-TABLE ?auto_201527 ) ( ON ?auto_201524 ?auto_201525 ) ( ON ?auto_201523 ?auto_201524 ) ( ON ?auto_201522 ?auto_201523 ) ( CLEAR ?auto_201522 ) ( HOLDING ?auto_201521 ) ( CLEAR ?auto_201520 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_201519 ?auto_201520 ?auto_201521 )
      ( MAKE-8PILE ?auto_201519 ?auto_201520 ?auto_201521 ?auto_201522 ?auto_201523 ?auto_201524 ?auto_201525 ?auto_201526 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_201528 - BLOCK
      ?auto_201529 - BLOCK
      ?auto_201530 - BLOCK
      ?auto_201531 - BLOCK
      ?auto_201532 - BLOCK
      ?auto_201533 - BLOCK
      ?auto_201534 - BLOCK
      ?auto_201535 - BLOCK
    )
    :vars
    (
      ?auto_201536 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_201528 ) ( ON ?auto_201529 ?auto_201528 ) ( not ( = ?auto_201528 ?auto_201529 ) ) ( not ( = ?auto_201528 ?auto_201530 ) ) ( not ( = ?auto_201528 ?auto_201531 ) ) ( not ( = ?auto_201528 ?auto_201532 ) ) ( not ( = ?auto_201528 ?auto_201533 ) ) ( not ( = ?auto_201528 ?auto_201534 ) ) ( not ( = ?auto_201528 ?auto_201535 ) ) ( not ( = ?auto_201529 ?auto_201530 ) ) ( not ( = ?auto_201529 ?auto_201531 ) ) ( not ( = ?auto_201529 ?auto_201532 ) ) ( not ( = ?auto_201529 ?auto_201533 ) ) ( not ( = ?auto_201529 ?auto_201534 ) ) ( not ( = ?auto_201529 ?auto_201535 ) ) ( not ( = ?auto_201530 ?auto_201531 ) ) ( not ( = ?auto_201530 ?auto_201532 ) ) ( not ( = ?auto_201530 ?auto_201533 ) ) ( not ( = ?auto_201530 ?auto_201534 ) ) ( not ( = ?auto_201530 ?auto_201535 ) ) ( not ( = ?auto_201531 ?auto_201532 ) ) ( not ( = ?auto_201531 ?auto_201533 ) ) ( not ( = ?auto_201531 ?auto_201534 ) ) ( not ( = ?auto_201531 ?auto_201535 ) ) ( not ( = ?auto_201532 ?auto_201533 ) ) ( not ( = ?auto_201532 ?auto_201534 ) ) ( not ( = ?auto_201532 ?auto_201535 ) ) ( not ( = ?auto_201533 ?auto_201534 ) ) ( not ( = ?auto_201533 ?auto_201535 ) ) ( not ( = ?auto_201534 ?auto_201535 ) ) ( ON ?auto_201535 ?auto_201536 ) ( not ( = ?auto_201528 ?auto_201536 ) ) ( not ( = ?auto_201529 ?auto_201536 ) ) ( not ( = ?auto_201530 ?auto_201536 ) ) ( not ( = ?auto_201531 ?auto_201536 ) ) ( not ( = ?auto_201532 ?auto_201536 ) ) ( not ( = ?auto_201533 ?auto_201536 ) ) ( not ( = ?auto_201534 ?auto_201536 ) ) ( not ( = ?auto_201535 ?auto_201536 ) ) ( ON ?auto_201534 ?auto_201535 ) ( ON-TABLE ?auto_201536 ) ( ON ?auto_201533 ?auto_201534 ) ( ON ?auto_201532 ?auto_201533 ) ( ON ?auto_201531 ?auto_201532 ) ( CLEAR ?auto_201529 ) ( ON ?auto_201530 ?auto_201531 ) ( CLEAR ?auto_201530 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_201536 ?auto_201535 ?auto_201534 ?auto_201533 ?auto_201532 ?auto_201531 )
      ( MAKE-8PILE ?auto_201528 ?auto_201529 ?auto_201530 ?auto_201531 ?auto_201532 ?auto_201533 ?auto_201534 ?auto_201535 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_201537 - BLOCK
      ?auto_201538 - BLOCK
      ?auto_201539 - BLOCK
      ?auto_201540 - BLOCK
      ?auto_201541 - BLOCK
      ?auto_201542 - BLOCK
      ?auto_201543 - BLOCK
      ?auto_201544 - BLOCK
    )
    :vars
    (
      ?auto_201545 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_201537 ) ( not ( = ?auto_201537 ?auto_201538 ) ) ( not ( = ?auto_201537 ?auto_201539 ) ) ( not ( = ?auto_201537 ?auto_201540 ) ) ( not ( = ?auto_201537 ?auto_201541 ) ) ( not ( = ?auto_201537 ?auto_201542 ) ) ( not ( = ?auto_201537 ?auto_201543 ) ) ( not ( = ?auto_201537 ?auto_201544 ) ) ( not ( = ?auto_201538 ?auto_201539 ) ) ( not ( = ?auto_201538 ?auto_201540 ) ) ( not ( = ?auto_201538 ?auto_201541 ) ) ( not ( = ?auto_201538 ?auto_201542 ) ) ( not ( = ?auto_201538 ?auto_201543 ) ) ( not ( = ?auto_201538 ?auto_201544 ) ) ( not ( = ?auto_201539 ?auto_201540 ) ) ( not ( = ?auto_201539 ?auto_201541 ) ) ( not ( = ?auto_201539 ?auto_201542 ) ) ( not ( = ?auto_201539 ?auto_201543 ) ) ( not ( = ?auto_201539 ?auto_201544 ) ) ( not ( = ?auto_201540 ?auto_201541 ) ) ( not ( = ?auto_201540 ?auto_201542 ) ) ( not ( = ?auto_201540 ?auto_201543 ) ) ( not ( = ?auto_201540 ?auto_201544 ) ) ( not ( = ?auto_201541 ?auto_201542 ) ) ( not ( = ?auto_201541 ?auto_201543 ) ) ( not ( = ?auto_201541 ?auto_201544 ) ) ( not ( = ?auto_201542 ?auto_201543 ) ) ( not ( = ?auto_201542 ?auto_201544 ) ) ( not ( = ?auto_201543 ?auto_201544 ) ) ( ON ?auto_201544 ?auto_201545 ) ( not ( = ?auto_201537 ?auto_201545 ) ) ( not ( = ?auto_201538 ?auto_201545 ) ) ( not ( = ?auto_201539 ?auto_201545 ) ) ( not ( = ?auto_201540 ?auto_201545 ) ) ( not ( = ?auto_201541 ?auto_201545 ) ) ( not ( = ?auto_201542 ?auto_201545 ) ) ( not ( = ?auto_201543 ?auto_201545 ) ) ( not ( = ?auto_201544 ?auto_201545 ) ) ( ON ?auto_201543 ?auto_201544 ) ( ON-TABLE ?auto_201545 ) ( ON ?auto_201542 ?auto_201543 ) ( ON ?auto_201541 ?auto_201542 ) ( ON ?auto_201540 ?auto_201541 ) ( ON ?auto_201539 ?auto_201540 ) ( CLEAR ?auto_201539 ) ( HOLDING ?auto_201538 ) ( CLEAR ?auto_201537 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_201537 ?auto_201538 )
      ( MAKE-8PILE ?auto_201537 ?auto_201538 ?auto_201539 ?auto_201540 ?auto_201541 ?auto_201542 ?auto_201543 ?auto_201544 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_201546 - BLOCK
      ?auto_201547 - BLOCK
      ?auto_201548 - BLOCK
      ?auto_201549 - BLOCK
      ?auto_201550 - BLOCK
      ?auto_201551 - BLOCK
      ?auto_201552 - BLOCK
      ?auto_201553 - BLOCK
    )
    :vars
    (
      ?auto_201554 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_201546 ) ( not ( = ?auto_201546 ?auto_201547 ) ) ( not ( = ?auto_201546 ?auto_201548 ) ) ( not ( = ?auto_201546 ?auto_201549 ) ) ( not ( = ?auto_201546 ?auto_201550 ) ) ( not ( = ?auto_201546 ?auto_201551 ) ) ( not ( = ?auto_201546 ?auto_201552 ) ) ( not ( = ?auto_201546 ?auto_201553 ) ) ( not ( = ?auto_201547 ?auto_201548 ) ) ( not ( = ?auto_201547 ?auto_201549 ) ) ( not ( = ?auto_201547 ?auto_201550 ) ) ( not ( = ?auto_201547 ?auto_201551 ) ) ( not ( = ?auto_201547 ?auto_201552 ) ) ( not ( = ?auto_201547 ?auto_201553 ) ) ( not ( = ?auto_201548 ?auto_201549 ) ) ( not ( = ?auto_201548 ?auto_201550 ) ) ( not ( = ?auto_201548 ?auto_201551 ) ) ( not ( = ?auto_201548 ?auto_201552 ) ) ( not ( = ?auto_201548 ?auto_201553 ) ) ( not ( = ?auto_201549 ?auto_201550 ) ) ( not ( = ?auto_201549 ?auto_201551 ) ) ( not ( = ?auto_201549 ?auto_201552 ) ) ( not ( = ?auto_201549 ?auto_201553 ) ) ( not ( = ?auto_201550 ?auto_201551 ) ) ( not ( = ?auto_201550 ?auto_201552 ) ) ( not ( = ?auto_201550 ?auto_201553 ) ) ( not ( = ?auto_201551 ?auto_201552 ) ) ( not ( = ?auto_201551 ?auto_201553 ) ) ( not ( = ?auto_201552 ?auto_201553 ) ) ( ON ?auto_201553 ?auto_201554 ) ( not ( = ?auto_201546 ?auto_201554 ) ) ( not ( = ?auto_201547 ?auto_201554 ) ) ( not ( = ?auto_201548 ?auto_201554 ) ) ( not ( = ?auto_201549 ?auto_201554 ) ) ( not ( = ?auto_201550 ?auto_201554 ) ) ( not ( = ?auto_201551 ?auto_201554 ) ) ( not ( = ?auto_201552 ?auto_201554 ) ) ( not ( = ?auto_201553 ?auto_201554 ) ) ( ON ?auto_201552 ?auto_201553 ) ( ON-TABLE ?auto_201554 ) ( ON ?auto_201551 ?auto_201552 ) ( ON ?auto_201550 ?auto_201551 ) ( ON ?auto_201549 ?auto_201550 ) ( ON ?auto_201548 ?auto_201549 ) ( CLEAR ?auto_201546 ) ( ON ?auto_201547 ?auto_201548 ) ( CLEAR ?auto_201547 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_201554 ?auto_201553 ?auto_201552 ?auto_201551 ?auto_201550 ?auto_201549 ?auto_201548 )
      ( MAKE-8PILE ?auto_201546 ?auto_201547 ?auto_201548 ?auto_201549 ?auto_201550 ?auto_201551 ?auto_201552 ?auto_201553 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_201555 - BLOCK
      ?auto_201556 - BLOCK
      ?auto_201557 - BLOCK
      ?auto_201558 - BLOCK
      ?auto_201559 - BLOCK
      ?auto_201560 - BLOCK
      ?auto_201561 - BLOCK
      ?auto_201562 - BLOCK
    )
    :vars
    (
      ?auto_201563 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_201555 ?auto_201556 ) ) ( not ( = ?auto_201555 ?auto_201557 ) ) ( not ( = ?auto_201555 ?auto_201558 ) ) ( not ( = ?auto_201555 ?auto_201559 ) ) ( not ( = ?auto_201555 ?auto_201560 ) ) ( not ( = ?auto_201555 ?auto_201561 ) ) ( not ( = ?auto_201555 ?auto_201562 ) ) ( not ( = ?auto_201556 ?auto_201557 ) ) ( not ( = ?auto_201556 ?auto_201558 ) ) ( not ( = ?auto_201556 ?auto_201559 ) ) ( not ( = ?auto_201556 ?auto_201560 ) ) ( not ( = ?auto_201556 ?auto_201561 ) ) ( not ( = ?auto_201556 ?auto_201562 ) ) ( not ( = ?auto_201557 ?auto_201558 ) ) ( not ( = ?auto_201557 ?auto_201559 ) ) ( not ( = ?auto_201557 ?auto_201560 ) ) ( not ( = ?auto_201557 ?auto_201561 ) ) ( not ( = ?auto_201557 ?auto_201562 ) ) ( not ( = ?auto_201558 ?auto_201559 ) ) ( not ( = ?auto_201558 ?auto_201560 ) ) ( not ( = ?auto_201558 ?auto_201561 ) ) ( not ( = ?auto_201558 ?auto_201562 ) ) ( not ( = ?auto_201559 ?auto_201560 ) ) ( not ( = ?auto_201559 ?auto_201561 ) ) ( not ( = ?auto_201559 ?auto_201562 ) ) ( not ( = ?auto_201560 ?auto_201561 ) ) ( not ( = ?auto_201560 ?auto_201562 ) ) ( not ( = ?auto_201561 ?auto_201562 ) ) ( ON ?auto_201562 ?auto_201563 ) ( not ( = ?auto_201555 ?auto_201563 ) ) ( not ( = ?auto_201556 ?auto_201563 ) ) ( not ( = ?auto_201557 ?auto_201563 ) ) ( not ( = ?auto_201558 ?auto_201563 ) ) ( not ( = ?auto_201559 ?auto_201563 ) ) ( not ( = ?auto_201560 ?auto_201563 ) ) ( not ( = ?auto_201561 ?auto_201563 ) ) ( not ( = ?auto_201562 ?auto_201563 ) ) ( ON ?auto_201561 ?auto_201562 ) ( ON-TABLE ?auto_201563 ) ( ON ?auto_201560 ?auto_201561 ) ( ON ?auto_201559 ?auto_201560 ) ( ON ?auto_201558 ?auto_201559 ) ( ON ?auto_201557 ?auto_201558 ) ( ON ?auto_201556 ?auto_201557 ) ( CLEAR ?auto_201556 ) ( HOLDING ?auto_201555 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_201555 )
      ( MAKE-8PILE ?auto_201555 ?auto_201556 ?auto_201557 ?auto_201558 ?auto_201559 ?auto_201560 ?auto_201561 ?auto_201562 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_201564 - BLOCK
      ?auto_201565 - BLOCK
      ?auto_201566 - BLOCK
      ?auto_201567 - BLOCK
      ?auto_201568 - BLOCK
      ?auto_201569 - BLOCK
      ?auto_201570 - BLOCK
      ?auto_201571 - BLOCK
    )
    :vars
    (
      ?auto_201572 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_201564 ?auto_201565 ) ) ( not ( = ?auto_201564 ?auto_201566 ) ) ( not ( = ?auto_201564 ?auto_201567 ) ) ( not ( = ?auto_201564 ?auto_201568 ) ) ( not ( = ?auto_201564 ?auto_201569 ) ) ( not ( = ?auto_201564 ?auto_201570 ) ) ( not ( = ?auto_201564 ?auto_201571 ) ) ( not ( = ?auto_201565 ?auto_201566 ) ) ( not ( = ?auto_201565 ?auto_201567 ) ) ( not ( = ?auto_201565 ?auto_201568 ) ) ( not ( = ?auto_201565 ?auto_201569 ) ) ( not ( = ?auto_201565 ?auto_201570 ) ) ( not ( = ?auto_201565 ?auto_201571 ) ) ( not ( = ?auto_201566 ?auto_201567 ) ) ( not ( = ?auto_201566 ?auto_201568 ) ) ( not ( = ?auto_201566 ?auto_201569 ) ) ( not ( = ?auto_201566 ?auto_201570 ) ) ( not ( = ?auto_201566 ?auto_201571 ) ) ( not ( = ?auto_201567 ?auto_201568 ) ) ( not ( = ?auto_201567 ?auto_201569 ) ) ( not ( = ?auto_201567 ?auto_201570 ) ) ( not ( = ?auto_201567 ?auto_201571 ) ) ( not ( = ?auto_201568 ?auto_201569 ) ) ( not ( = ?auto_201568 ?auto_201570 ) ) ( not ( = ?auto_201568 ?auto_201571 ) ) ( not ( = ?auto_201569 ?auto_201570 ) ) ( not ( = ?auto_201569 ?auto_201571 ) ) ( not ( = ?auto_201570 ?auto_201571 ) ) ( ON ?auto_201571 ?auto_201572 ) ( not ( = ?auto_201564 ?auto_201572 ) ) ( not ( = ?auto_201565 ?auto_201572 ) ) ( not ( = ?auto_201566 ?auto_201572 ) ) ( not ( = ?auto_201567 ?auto_201572 ) ) ( not ( = ?auto_201568 ?auto_201572 ) ) ( not ( = ?auto_201569 ?auto_201572 ) ) ( not ( = ?auto_201570 ?auto_201572 ) ) ( not ( = ?auto_201571 ?auto_201572 ) ) ( ON ?auto_201570 ?auto_201571 ) ( ON-TABLE ?auto_201572 ) ( ON ?auto_201569 ?auto_201570 ) ( ON ?auto_201568 ?auto_201569 ) ( ON ?auto_201567 ?auto_201568 ) ( ON ?auto_201566 ?auto_201567 ) ( ON ?auto_201565 ?auto_201566 ) ( ON ?auto_201564 ?auto_201565 ) ( CLEAR ?auto_201564 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_201572 ?auto_201571 ?auto_201570 ?auto_201569 ?auto_201568 ?auto_201567 ?auto_201566 ?auto_201565 )
      ( MAKE-8PILE ?auto_201564 ?auto_201565 ?auto_201566 ?auto_201567 ?auto_201568 ?auto_201569 ?auto_201570 ?auto_201571 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_201580 - BLOCK
      ?auto_201581 - BLOCK
      ?auto_201582 - BLOCK
      ?auto_201583 - BLOCK
      ?auto_201584 - BLOCK
      ?auto_201585 - BLOCK
      ?auto_201586 - BLOCK
    )
    :vars
    (
      ?auto_201587 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_201587 ?auto_201586 ) ( CLEAR ?auto_201587 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_201580 ) ( ON ?auto_201581 ?auto_201580 ) ( ON ?auto_201582 ?auto_201581 ) ( ON ?auto_201583 ?auto_201582 ) ( ON ?auto_201584 ?auto_201583 ) ( ON ?auto_201585 ?auto_201584 ) ( ON ?auto_201586 ?auto_201585 ) ( not ( = ?auto_201580 ?auto_201581 ) ) ( not ( = ?auto_201580 ?auto_201582 ) ) ( not ( = ?auto_201580 ?auto_201583 ) ) ( not ( = ?auto_201580 ?auto_201584 ) ) ( not ( = ?auto_201580 ?auto_201585 ) ) ( not ( = ?auto_201580 ?auto_201586 ) ) ( not ( = ?auto_201580 ?auto_201587 ) ) ( not ( = ?auto_201581 ?auto_201582 ) ) ( not ( = ?auto_201581 ?auto_201583 ) ) ( not ( = ?auto_201581 ?auto_201584 ) ) ( not ( = ?auto_201581 ?auto_201585 ) ) ( not ( = ?auto_201581 ?auto_201586 ) ) ( not ( = ?auto_201581 ?auto_201587 ) ) ( not ( = ?auto_201582 ?auto_201583 ) ) ( not ( = ?auto_201582 ?auto_201584 ) ) ( not ( = ?auto_201582 ?auto_201585 ) ) ( not ( = ?auto_201582 ?auto_201586 ) ) ( not ( = ?auto_201582 ?auto_201587 ) ) ( not ( = ?auto_201583 ?auto_201584 ) ) ( not ( = ?auto_201583 ?auto_201585 ) ) ( not ( = ?auto_201583 ?auto_201586 ) ) ( not ( = ?auto_201583 ?auto_201587 ) ) ( not ( = ?auto_201584 ?auto_201585 ) ) ( not ( = ?auto_201584 ?auto_201586 ) ) ( not ( = ?auto_201584 ?auto_201587 ) ) ( not ( = ?auto_201585 ?auto_201586 ) ) ( not ( = ?auto_201585 ?auto_201587 ) ) ( not ( = ?auto_201586 ?auto_201587 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_201587 ?auto_201586 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_201605 - BLOCK
      ?auto_201606 - BLOCK
      ?auto_201607 - BLOCK
      ?auto_201608 - BLOCK
      ?auto_201609 - BLOCK
      ?auto_201610 - BLOCK
      ?auto_201611 - BLOCK
    )
    :vars
    (
      ?auto_201612 - BLOCK
      ?auto_201613 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_201605 ) ( ON ?auto_201606 ?auto_201605 ) ( ON ?auto_201607 ?auto_201606 ) ( ON ?auto_201608 ?auto_201607 ) ( ON ?auto_201609 ?auto_201608 ) ( ON ?auto_201610 ?auto_201609 ) ( not ( = ?auto_201605 ?auto_201606 ) ) ( not ( = ?auto_201605 ?auto_201607 ) ) ( not ( = ?auto_201605 ?auto_201608 ) ) ( not ( = ?auto_201605 ?auto_201609 ) ) ( not ( = ?auto_201605 ?auto_201610 ) ) ( not ( = ?auto_201605 ?auto_201611 ) ) ( not ( = ?auto_201605 ?auto_201612 ) ) ( not ( = ?auto_201606 ?auto_201607 ) ) ( not ( = ?auto_201606 ?auto_201608 ) ) ( not ( = ?auto_201606 ?auto_201609 ) ) ( not ( = ?auto_201606 ?auto_201610 ) ) ( not ( = ?auto_201606 ?auto_201611 ) ) ( not ( = ?auto_201606 ?auto_201612 ) ) ( not ( = ?auto_201607 ?auto_201608 ) ) ( not ( = ?auto_201607 ?auto_201609 ) ) ( not ( = ?auto_201607 ?auto_201610 ) ) ( not ( = ?auto_201607 ?auto_201611 ) ) ( not ( = ?auto_201607 ?auto_201612 ) ) ( not ( = ?auto_201608 ?auto_201609 ) ) ( not ( = ?auto_201608 ?auto_201610 ) ) ( not ( = ?auto_201608 ?auto_201611 ) ) ( not ( = ?auto_201608 ?auto_201612 ) ) ( not ( = ?auto_201609 ?auto_201610 ) ) ( not ( = ?auto_201609 ?auto_201611 ) ) ( not ( = ?auto_201609 ?auto_201612 ) ) ( not ( = ?auto_201610 ?auto_201611 ) ) ( not ( = ?auto_201610 ?auto_201612 ) ) ( not ( = ?auto_201611 ?auto_201612 ) ) ( ON ?auto_201612 ?auto_201613 ) ( CLEAR ?auto_201612 ) ( not ( = ?auto_201605 ?auto_201613 ) ) ( not ( = ?auto_201606 ?auto_201613 ) ) ( not ( = ?auto_201607 ?auto_201613 ) ) ( not ( = ?auto_201608 ?auto_201613 ) ) ( not ( = ?auto_201609 ?auto_201613 ) ) ( not ( = ?auto_201610 ?auto_201613 ) ) ( not ( = ?auto_201611 ?auto_201613 ) ) ( not ( = ?auto_201612 ?auto_201613 ) ) ( HOLDING ?auto_201611 ) ( CLEAR ?auto_201610 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_201605 ?auto_201606 ?auto_201607 ?auto_201608 ?auto_201609 ?auto_201610 ?auto_201611 ?auto_201612 )
      ( MAKE-7PILE ?auto_201605 ?auto_201606 ?auto_201607 ?auto_201608 ?auto_201609 ?auto_201610 ?auto_201611 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_201614 - BLOCK
      ?auto_201615 - BLOCK
      ?auto_201616 - BLOCK
      ?auto_201617 - BLOCK
      ?auto_201618 - BLOCK
      ?auto_201619 - BLOCK
      ?auto_201620 - BLOCK
    )
    :vars
    (
      ?auto_201621 - BLOCK
      ?auto_201622 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_201614 ) ( ON ?auto_201615 ?auto_201614 ) ( ON ?auto_201616 ?auto_201615 ) ( ON ?auto_201617 ?auto_201616 ) ( ON ?auto_201618 ?auto_201617 ) ( ON ?auto_201619 ?auto_201618 ) ( not ( = ?auto_201614 ?auto_201615 ) ) ( not ( = ?auto_201614 ?auto_201616 ) ) ( not ( = ?auto_201614 ?auto_201617 ) ) ( not ( = ?auto_201614 ?auto_201618 ) ) ( not ( = ?auto_201614 ?auto_201619 ) ) ( not ( = ?auto_201614 ?auto_201620 ) ) ( not ( = ?auto_201614 ?auto_201621 ) ) ( not ( = ?auto_201615 ?auto_201616 ) ) ( not ( = ?auto_201615 ?auto_201617 ) ) ( not ( = ?auto_201615 ?auto_201618 ) ) ( not ( = ?auto_201615 ?auto_201619 ) ) ( not ( = ?auto_201615 ?auto_201620 ) ) ( not ( = ?auto_201615 ?auto_201621 ) ) ( not ( = ?auto_201616 ?auto_201617 ) ) ( not ( = ?auto_201616 ?auto_201618 ) ) ( not ( = ?auto_201616 ?auto_201619 ) ) ( not ( = ?auto_201616 ?auto_201620 ) ) ( not ( = ?auto_201616 ?auto_201621 ) ) ( not ( = ?auto_201617 ?auto_201618 ) ) ( not ( = ?auto_201617 ?auto_201619 ) ) ( not ( = ?auto_201617 ?auto_201620 ) ) ( not ( = ?auto_201617 ?auto_201621 ) ) ( not ( = ?auto_201618 ?auto_201619 ) ) ( not ( = ?auto_201618 ?auto_201620 ) ) ( not ( = ?auto_201618 ?auto_201621 ) ) ( not ( = ?auto_201619 ?auto_201620 ) ) ( not ( = ?auto_201619 ?auto_201621 ) ) ( not ( = ?auto_201620 ?auto_201621 ) ) ( ON ?auto_201621 ?auto_201622 ) ( not ( = ?auto_201614 ?auto_201622 ) ) ( not ( = ?auto_201615 ?auto_201622 ) ) ( not ( = ?auto_201616 ?auto_201622 ) ) ( not ( = ?auto_201617 ?auto_201622 ) ) ( not ( = ?auto_201618 ?auto_201622 ) ) ( not ( = ?auto_201619 ?auto_201622 ) ) ( not ( = ?auto_201620 ?auto_201622 ) ) ( not ( = ?auto_201621 ?auto_201622 ) ) ( CLEAR ?auto_201619 ) ( ON ?auto_201620 ?auto_201621 ) ( CLEAR ?auto_201620 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_201622 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_201622 ?auto_201621 )
      ( MAKE-7PILE ?auto_201614 ?auto_201615 ?auto_201616 ?auto_201617 ?auto_201618 ?auto_201619 ?auto_201620 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_201623 - BLOCK
      ?auto_201624 - BLOCK
      ?auto_201625 - BLOCK
      ?auto_201626 - BLOCK
      ?auto_201627 - BLOCK
      ?auto_201628 - BLOCK
      ?auto_201629 - BLOCK
    )
    :vars
    (
      ?auto_201631 - BLOCK
      ?auto_201630 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_201623 ) ( ON ?auto_201624 ?auto_201623 ) ( ON ?auto_201625 ?auto_201624 ) ( ON ?auto_201626 ?auto_201625 ) ( ON ?auto_201627 ?auto_201626 ) ( not ( = ?auto_201623 ?auto_201624 ) ) ( not ( = ?auto_201623 ?auto_201625 ) ) ( not ( = ?auto_201623 ?auto_201626 ) ) ( not ( = ?auto_201623 ?auto_201627 ) ) ( not ( = ?auto_201623 ?auto_201628 ) ) ( not ( = ?auto_201623 ?auto_201629 ) ) ( not ( = ?auto_201623 ?auto_201631 ) ) ( not ( = ?auto_201624 ?auto_201625 ) ) ( not ( = ?auto_201624 ?auto_201626 ) ) ( not ( = ?auto_201624 ?auto_201627 ) ) ( not ( = ?auto_201624 ?auto_201628 ) ) ( not ( = ?auto_201624 ?auto_201629 ) ) ( not ( = ?auto_201624 ?auto_201631 ) ) ( not ( = ?auto_201625 ?auto_201626 ) ) ( not ( = ?auto_201625 ?auto_201627 ) ) ( not ( = ?auto_201625 ?auto_201628 ) ) ( not ( = ?auto_201625 ?auto_201629 ) ) ( not ( = ?auto_201625 ?auto_201631 ) ) ( not ( = ?auto_201626 ?auto_201627 ) ) ( not ( = ?auto_201626 ?auto_201628 ) ) ( not ( = ?auto_201626 ?auto_201629 ) ) ( not ( = ?auto_201626 ?auto_201631 ) ) ( not ( = ?auto_201627 ?auto_201628 ) ) ( not ( = ?auto_201627 ?auto_201629 ) ) ( not ( = ?auto_201627 ?auto_201631 ) ) ( not ( = ?auto_201628 ?auto_201629 ) ) ( not ( = ?auto_201628 ?auto_201631 ) ) ( not ( = ?auto_201629 ?auto_201631 ) ) ( ON ?auto_201631 ?auto_201630 ) ( not ( = ?auto_201623 ?auto_201630 ) ) ( not ( = ?auto_201624 ?auto_201630 ) ) ( not ( = ?auto_201625 ?auto_201630 ) ) ( not ( = ?auto_201626 ?auto_201630 ) ) ( not ( = ?auto_201627 ?auto_201630 ) ) ( not ( = ?auto_201628 ?auto_201630 ) ) ( not ( = ?auto_201629 ?auto_201630 ) ) ( not ( = ?auto_201631 ?auto_201630 ) ) ( ON ?auto_201629 ?auto_201631 ) ( CLEAR ?auto_201629 ) ( ON-TABLE ?auto_201630 ) ( HOLDING ?auto_201628 ) ( CLEAR ?auto_201627 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_201623 ?auto_201624 ?auto_201625 ?auto_201626 ?auto_201627 ?auto_201628 )
      ( MAKE-7PILE ?auto_201623 ?auto_201624 ?auto_201625 ?auto_201626 ?auto_201627 ?auto_201628 ?auto_201629 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_201632 - BLOCK
      ?auto_201633 - BLOCK
      ?auto_201634 - BLOCK
      ?auto_201635 - BLOCK
      ?auto_201636 - BLOCK
      ?auto_201637 - BLOCK
      ?auto_201638 - BLOCK
    )
    :vars
    (
      ?auto_201639 - BLOCK
      ?auto_201640 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_201632 ) ( ON ?auto_201633 ?auto_201632 ) ( ON ?auto_201634 ?auto_201633 ) ( ON ?auto_201635 ?auto_201634 ) ( ON ?auto_201636 ?auto_201635 ) ( not ( = ?auto_201632 ?auto_201633 ) ) ( not ( = ?auto_201632 ?auto_201634 ) ) ( not ( = ?auto_201632 ?auto_201635 ) ) ( not ( = ?auto_201632 ?auto_201636 ) ) ( not ( = ?auto_201632 ?auto_201637 ) ) ( not ( = ?auto_201632 ?auto_201638 ) ) ( not ( = ?auto_201632 ?auto_201639 ) ) ( not ( = ?auto_201633 ?auto_201634 ) ) ( not ( = ?auto_201633 ?auto_201635 ) ) ( not ( = ?auto_201633 ?auto_201636 ) ) ( not ( = ?auto_201633 ?auto_201637 ) ) ( not ( = ?auto_201633 ?auto_201638 ) ) ( not ( = ?auto_201633 ?auto_201639 ) ) ( not ( = ?auto_201634 ?auto_201635 ) ) ( not ( = ?auto_201634 ?auto_201636 ) ) ( not ( = ?auto_201634 ?auto_201637 ) ) ( not ( = ?auto_201634 ?auto_201638 ) ) ( not ( = ?auto_201634 ?auto_201639 ) ) ( not ( = ?auto_201635 ?auto_201636 ) ) ( not ( = ?auto_201635 ?auto_201637 ) ) ( not ( = ?auto_201635 ?auto_201638 ) ) ( not ( = ?auto_201635 ?auto_201639 ) ) ( not ( = ?auto_201636 ?auto_201637 ) ) ( not ( = ?auto_201636 ?auto_201638 ) ) ( not ( = ?auto_201636 ?auto_201639 ) ) ( not ( = ?auto_201637 ?auto_201638 ) ) ( not ( = ?auto_201637 ?auto_201639 ) ) ( not ( = ?auto_201638 ?auto_201639 ) ) ( ON ?auto_201639 ?auto_201640 ) ( not ( = ?auto_201632 ?auto_201640 ) ) ( not ( = ?auto_201633 ?auto_201640 ) ) ( not ( = ?auto_201634 ?auto_201640 ) ) ( not ( = ?auto_201635 ?auto_201640 ) ) ( not ( = ?auto_201636 ?auto_201640 ) ) ( not ( = ?auto_201637 ?auto_201640 ) ) ( not ( = ?auto_201638 ?auto_201640 ) ) ( not ( = ?auto_201639 ?auto_201640 ) ) ( ON ?auto_201638 ?auto_201639 ) ( ON-TABLE ?auto_201640 ) ( CLEAR ?auto_201636 ) ( ON ?auto_201637 ?auto_201638 ) ( CLEAR ?auto_201637 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_201640 ?auto_201639 ?auto_201638 )
      ( MAKE-7PILE ?auto_201632 ?auto_201633 ?auto_201634 ?auto_201635 ?auto_201636 ?auto_201637 ?auto_201638 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_201641 - BLOCK
      ?auto_201642 - BLOCK
      ?auto_201643 - BLOCK
      ?auto_201644 - BLOCK
      ?auto_201645 - BLOCK
      ?auto_201646 - BLOCK
      ?auto_201647 - BLOCK
    )
    :vars
    (
      ?auto_201648 - BLOCK
      ?auto_201649 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_201641 ) ( ON ?auto_201642 ?auto_201641 ) ( ON ?auto_201643 ?auto_201642 ) ( ON ?auto_201644 ?auto_201643 ) ( not ( = ?auto_201641 ?auto_201642 ) ) ( not ( = ?auto_201641 ?auto_201643 ) ) ( not ( = ?auto_201641 ?auto_201644 ) ) ( not ( = ?auto_201641 ?auto_201645 ) ) ( not ( = ?auto_201641 ?auto_201646 ) ) ( not ( = ?auto_201641 ?auto_201647 ) ) ( not ( = ?auto_201641 ?auto_201648 ) ) ( not ( = ?auto_201642 ?auto_201643 ) ) ( not ( = ?auto_201642 ?auto_201644 ) ) ( not ( = ?auto_201642 ?auto_201645 ) ) ( not ( = ?auto_201642 ?auto_201646 ) ) ( not ( = ?auto_201642 ?auto_201647 ) ) ( not ( = ?auto_201642 ?auto_201648 ) ) ( not ( = ?auto_201643 ?auto_201644 ) ) ( not ( = ?auto_201643 ?auto_201645 ) ) ( not ( = ?auto_201643 ?auto_201646 ) ) ( not ( = ?auto_201643 ?auto_201647 ) ) ( not ( = ?auto_201643 ?auto_201648 ) ) ( not ( = ?auto_201644 ?auto_201645 ) ) ( not ( = ?auto_201644 ?auto_201646 ) ) ( not ( = ?auto_201644 ?auto_201647 ) ) ( not ( = ?auto_201644 ?auto_201648 ) ) ( not ( = ?auto_201645 ?auto_201646 ) ) ( not ( = ?auto_201645 ?auto_201647 ) ) ( not ( = ?auto_201645 ?auto_201648 ) ) ( not ( = ?auto_201646 ?auto_201647 ) ) ( not ( = ?auto_201646 ?auto_201648 ) ) ( not ( = ?auto_201647 ?auto_201648 ) ) ( ON ?auto_201648 ?auto_201649 ) ( not ( = ?auto_201641 ?auto_201649 ) ) ( not ( = ?auto_201642 ?auto_201649 ) ) ( not ( = ?auto_201643 ?auto_201649 ) ) ( not ( = ?auto_201644 ?auto_201649 ) ) ( not ( = ?auto_201645 ?auto_201649 ) ) ( not ( = ?auto_201646 ?auto_201649 ) ) ( not ( = ?auto_201647 ?auto_201649 ) ) ( not ( = ?auto_201648 ?auto_201649 ) ) ( ON ?auto_201647 ?auto_201648 ) ( ON-TABLE ?auto_201649 ) ( ON ?auto_201646 ?auto_201647 ) ( CLEAR ?auto_201646 ) ( HOLDING ?auto_201645 ) ( CLEAR ?auto_201644 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_201641 ?auto_201642 ?auto_201643 ?auto_201644 ?auto_201645 )
      ( MAKE-7PILE ?auto_201641 ?auto_201642 ?auto_201643 ?auto_201644 ?auto_201645 ?auto_201646 ?auto_201647 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_201650 - BLOCK
      ?auto_201651 - BLOCK
      ?auto_201652 - BLOCK
      ?auto_201653 - BLOCK
      ?auto_201654 - BLOCK
      ?auto_201655 - BLOCK
      ?auto_201656 - BLOCK
    )
    :vars
    (
      ?auto_201658 - BLOCK
      ?auto_201657 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_201650 ) ( ON ?auto_201651 ?auto_201650 ) ( ON ?auto_201652 ?auto_201651 ) ( ON ?auto_201653 ?auto_201652 ) ( not ( = ?auto_201650 ?auto_201651 ) ) ( not ( = ?auto_201650 ?auto_201652 ) ) ( not ( = ?auto_201650 ?auto_201653 ) ) ( not ( = ?auto_201650 ?auto_201654 ) ) ( not ( = ?auto_201650 ?auto_201655 ) ) ( not ( = ?auto_201650 ?auto_201656 ) ) ( not ( = ?auto_201650 ?auto_201658 ) ) ( not ( = ?auto_201651 ?auto_201652 ) ) ( not ( = ?auto_201651 ?auto_201653 ) ) ( not ( = ?auto_201651 ?auto_201654 ) ) ( not ( = ?auto_201651 ?auto_201655 ) ) ( not ( = ?auto_201651 ?auto_201656 ) ) ( not ( = ?auto_201651 ?auto_201658 ) ) ( not ( = ?auto_201652 ?auto_201653 ) ) ( not ( = ?auto_201652 ?auto_201654 ) ) ( not ( = ?auto_201652 ?auto_201655 ) ) ( not ( = ?auto_201652 ?auto_201656 ) ) ( not ( = ?auto_201652 ?auto_201658 ) ) ( not ( = ?auto_201653 ?auto_201654 ) ) ( not ( = ?auto_201653 ?auto_201655 ) ) ( not ( = ?auto_201653 ?auto_201656 ) ) ( not ( = ?auto_201653 ?auto_201658 ) ) ( not ( = ?auto_201654 ?auto_201655 ) ) ( not ( = ?auto_201654 ?auto_201656 ) ) ( not ( = ?auto_201654 ?auto_201658 ) ) ( not ( = ?auto_201655 ?auto_201656 ) ) ( not ( = ?auto_201655 ?auto_201658 ) ) ( not ( = ?auto_201656 ?auto_201658 ) ) ( ON ?auto_201658 ?auto_201657 ) ( not ( = ?auto_201650 ?auto_201657 ) ) ( not ( = ?auto_201651 ?auto_201657 ) ) ( not ( = ?auto_201652 ?auto_201657 ) ) ( not ( = ?auto_201653 ?auto_201657 ) ) ( not ( = ?auto_201654 ?auto_201657 ) ) ( not ( = ?auto_201655 ?auto_201657 ) ) ( not ( = ?auto_201656 ?auto_201657 ) ) ( not ( = ?auto_201658 ?auto_201657 ) ) ( ON ?auto_201656 ?auto_201658 ) ( ON-TABLE ?auto_201657 ) ( ON ?auto_201655 ?auto_201656 ) ( CLEAR ?auto_201653 ) ( ON ?auto_201654 ?auto_201655 ) ( CLEAR ?auto_201654 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_201657 ?auto_201658 ?auto_201656 ?auto_201655 )
      ( MAKE-7PILE ?auto_201650 ?auto_201651 ?auto_201652 ?auto_201653 ?auto_201654 ?auto_201655 ?auto_201656 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_201659 - BLOCK
      ?auto_201660 - BLOCK
      ?auto_201661 - BLOCK
      ?auto_201662 - BLOCK
      ?auto_201663 - BLOCK
      ?auto_201664 - BLOCK
      ?auto_201665 - BLOCK
    )
    :vars
    (
      ?auto_201666 - BLOCK
      ?auto_201667 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_201659 ) ( ON ?auto_201660 ?auto_201659 ) ( ON ?auto_201661 ?auto_201660 ) ( not ( = ?auto_201659 ?auto_201660 ) ) ( not ( = ?auto_201659 ?auto_201661 ) ) ( not ( = ?auto_201659 ?auto_201662 ) ) ( not ( = ?auto_201659 ?auto_201663 ) ) ( not ( = ?auto_201659 ?auto_201664 ) ) ( not ( = ?auto_201659 ?auto_201665 ) ) ( not ( = ?auto_201659 ?auto_201666 ) ) ( not ( = ?auto_201660 ?auto_201661 ) ) ( not ( = ?auto_201660 ?auto_201662 ) ) ( not ( = ?auto_201660 ?auto_201663 ) ) ( not ( = ?auto_201660 ?auto_201664 ) ) ( not ( = ?auto_201660 ?auto_201665 ) ) ( not ( = ?auto_201660 ?auto_201666 ) ) ( not ( = ?auto_201661 ?auto_201662 ) ) ( not ( = ?auto_201661 ?auto_201663 ) ) ( not ( = ?auto_201661 ?auto_201664 ) ) ( not ( = ?auto_201661 ?auto_201665 ) ) ( not ( = ?auto_201661 ?auto_201666 ) ) ( not ( = ?auto_201662 ?auto_201663 ) ) ( not ( = ?auto_201662 ?auto_201664 ) ) ( not ( = ?auto_201662 ?auto_201665 ) ) ( not ( = ?auto_201662 ?auto_201666 ) ) ( not ( = ?auto_201663 ?auto_201664 ) ) ( not ( = ?auto_201663 ?auto_201665 ) ) ( not ( = ?auto_201663 ?auto_201666 ) ) ( not ( = ?auto_201664 ?auto_201665 ) ) ( not ( = ?auto_201664 ?auto_201666 ) ) ( not ( = ?auto_201665 ?auto_201666 ) ) ( ON ?auto_201666 ?auto_201667 ) ( not ( = ?auto_201659 ?auto_201667 ) ) ( not ( = ?auto_201660 ?auto_201667 ) ) ( not ( = ?auto_201661 ?auto_201667 ) ) ( not ( = ?auto_201662 ?auto_201667 ) ) ( not ( = ?auto_201663 ?auto_201667 ) ) ( not ( = ?auto_201664 ?auto_201667 ) ) ( not ( = ?auto_201665 ?auto_201667 ) ) ( not ( = ?auto_201666 ?auto_201667 ) ) ( ON ?auto_201665 ?auto_201666 ) ( ON-TABLE ?auto_201667 ) ( ON ?auto_201664 ?auto_201665 ) ( ON ?auto_201663 ?auto_201664 ) ( CLEAR ?auto_201663 ) ( HOLDING ?auto_201662 ) ( CLEAR ?auto_201661 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_201659 ?auto_201660 ?auto_201661 ?auto_201662 )
      ( MAKE-7PILE ?auto_201659 ?auto_201660 ?auto_201661 ?auto_201662 ?auto_201663 ?auto_201664 ?auto_201665 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_201668 - BLOCK
      ?auto_201669 - BLOCK
      ?auto_201670 - BLOCK
      ?auto_201671 - BLOCK
      ?auto_201672 - BLOCK
      ?auto_201673 - BLOCK
      ?auto_201674 - BLOCK
    )
    :vars
    (
      ?auto_201676 - BLOCK
      ?auto_201675 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_201668 ) ( ON ?auto_201669 ?auto_201668 ) ( ON ?auto_201670 ?auto_201669 ) ( not ( = ?auto_201668 ?auto_201669 ) ) ( not ( = ?auto_201668 ?auto_201670 ) ) ( not ( = ?auto_201668 ?auto_201671 ) ) ( not ( = ?auto_201668 ?auto_201672 ) ) ( not ( = ?auto_201668 ?auto_201673 ) ) ( not ( = ?auto_201668 ?auto_201674 ) ) ( not ( = ?auto_201668 ?auto_201676 ) ) ( not ( = ?auto_201669 ?auto_201670 ) ) ( not ( = ?auto_201669 ?auto_201671 ) ) ( not ( = ?auto_201669 ?auto_201672 ) ) ( not ( = ?auto_201669 ?auto_201673 ) ) ( not ( = ?auto_201669 ?auto_201674 ) ) ( not ( = ?auto_201669 ?auto_201676 ) ) ( not ( = ?auto_201670 ?auto_201671 ) ) ( not ( = ?auto_201670 ?auto_201672 ) ) ( not ( = ?auto_201670 ?auto_201673 ) ) ( not ( = ?auto_201670 ?auto_201674 ) ) ( not ( = ?auto_201670 ?auto_201676 ) ) ( not ( = ?auto_201671 ?auto_201672 ) ) ( not ( = ?auto_201671 ?auto_201673 ) ) ( not ( = ?auto_201671 ?auto_201674 ) ) ( not ( = ?auto_201671 ?auto_201676 ) ) ( not ( = ?auto_201672 ?auto_201673 ) ) ( not ( = ?auto_201672 ?auto_201674 ) ) ( not ( = ?auto_201672 ?auto_201676 ) ) ( not ( = ?auto_201673 ?auto_201674 ) ) ( not ( = ?auto_201673 ?auto_201676 ) ) ( not ( = ?auto_201674 ?auto_201676 ) ) ( ON ?auto_201676 ?auto_201675 ) ( not ( = ?auto_201668 ?auto_201675 ) ) ( not ( = ?auto_201669 ?auto_201675 ) ) ( not ( = ?auto_201670 ?auto_201675 ) ) ( not ( = ?auto_201671 ?auto_201675 ) ) ( not ( = ?auto_201672 ?auto_201675 ) ) ( not ( = ?auto_201673 ?auto_201675 ) ) ( not ( = ?auto_201674 ?auto_201675 ) ) ( not ( = ?auto_201676 ?auto_201675 ) ) ( ON ?auto_201674 ?auto_201676 ) ( ON-TABLE ?auto_201675 ) ( ON ?auto_201673 ?auto_201674 ) ( ON ?auto_201672 ?auto_201673 ) ( CLEAR ?auto_201670 ) ( ON ?auto_201671 ?auto_201672 ) ( CLEAR ?auto_201671 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_201675 ?auto_201676 ?auto_201674 ?auto_201673 ?auto_201672 )
      ( MAKE-7PILE ?auto_201668 ?auto_201669 ?auto_201670 ?auto_201671 ?auto_201672 ?auto_201673 ?auto_201674 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_201677 - BLOCK
      ?auto_201678 - BLOCK
      ?auto_201679 - BLOCK
      ?auto_201680 - BLOCK
      ?auto_201681 - BLOCK
      ?auto_201682 - BLOCK
      ?auto_201683 - BLOCK
    )
    :vars
    (
      ?auto_201684 - BLOCK
      ?auto_201685 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_201677 ) ( ON ?auto_201678 ?auto_201677 ) ( not ( = ?auto_201677 ?auto_201678 ) ) ( not ( = ?auto_201677 ?auto_201679 ) ) ( not ( = ?auto_201677 ?auto_201680 ) ) ( not ( = ?auto_201677 ?auto_201681 ) ) ( not ( = ?auto_201677 ?auto_201682 ) ) ( not ( = ?auto_201677 ?auto_201683 ) ) ( not ( = ?auto_201677 ?auto_201684 ) ) ( not ( = ?auto_201678 ?auto_201679 ) ) ( not ( = ?auto_201678 ?auto_201680 ) ) ( not ( = ?auto_201678 ?auto_201681 ) ) ( not ( = ?auto_201678 ?auto_201682 ) ) ( not ( = ?auto_201678 ?auto_201683 ) ) ( not ( = ?auto_201678 ?auto_201684 ) ) ( not ( = ?auto_201679 ?auto_201680 ) ) ( not ( = ?auto_201679 ?auto_201681 ) ) ( not ( = ?auto_201679 ?auto_201682 ) ) ( not ( = ?auto_201679 ?auto_201683 ) ) ( not ( = ?auto_201679 ?auto_201684 ) ) ( not ( = ?auto_201680 ?auto_201681 ) ) ( not ( = ?auto_201680 ?auto_201682 ) ) ( not ( = ?auto_201680 ?auto_201683 ) ) ( not ( = ?auto_201680 ?auto_201684 ) ) ( not ( = ?auto_201681 ?auto_201682 ) ) ( not ( = ?auto_201681 ?auto_201683 ) ) ( not ( = ?auto_201681 ?auto_201684 ) ) ( not ( = ?auto_201682 ?auto_201683 ) ) ( not ( = ?auto_201682 ?auto_201684 ) ) ( not ( = ?auto_201683 ?auto_201684 ) ) ( ON ?auto_201684 ?auto_201685 ) ( not ( = ?auto_201677 ?auto_201685 ) ) ( not ( = ?auto_201678 ?auto_201685 ) ) ( not ( = ?auto_201679 ?auto_201685 ) ) ( not ( = ?auto_201680 ?auto_201685 ) ) ( not ( = ?auto_201681 ?auto_201685 ) ) ( not ( = ?auto_201682 ?auto_201685 ) ) ( not ( = ?auto_201683 ?auto_201685 ) ) ( not ( = ?auto_201684 ?auto_201685 ) ) ( ON ?auto_201683 ?auto_201684 ) ( ON-TABLE ?auto_201685 ) ( ON ?auto_201682 ?auto_201683 ) ( ON ?auto_201681 ?auto_201682 ) ( ON ?auto_201680 ?auto_201681 ) ( CLEAR ?auto_201680 ) ( HOLDING ?auto_201679 ) ( CLEAR ?auto_201678 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_201677 ?auto_201678 ?auto_201679 )
      ( MAKE-7PILE ?auto_201677 ?auto_201678 ?auto_201679 ?auto_201680 ?auto_201681 ?auto_201682 ?auto_201683 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_201686 - BLOCK
      ?auto_201687 - BLOCK
      ?auto_201688 - BLOCK
      ?auto_201689 - BLOCK
      ?auto_201690 - BLOCK
      ?auto_201691 - BLOCK
      ?auto_201692 - BLOCK
    )
    :vars
    (
      ?auto_201694 - BLOCK
      ?auto_201693 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_201686 ) ( ON ?auto_201687 ?auto_201686 ) ( not ( = ?auto_201686 ?auto_201687 ) ) ( not ( = ?auto_201686 ?auto_201688 ) ) ( not ( = ?auto_201686 ?auto_201689 ) ) ( not ( = ?auto_201686 ?auto_201690 ) ) ( not ( = ?auto_201686 ?auto_201691 ) ) ( not ( = ?auto_201686 ?auto_201692 ) ) ( not ( = ?auto_201686 ?auto_201694 ) ) ( not ( = ?auto_201687 ?auto_201688 ) ) ( not ( = ?auto_201687 ?auto_201689 ) ) ( not ( = ?auto_201687 ?auto_201690 ) ) ( not ( = ?auto_201687 ?auto_201691 ) ) ( not ( = ?auto_201687 ?auto_201692 ) ) ( not ( = ?auto_201687 ?auto_201694 ) ) ( not ( = ?auto_201688 ?auto_201689 ) ) ( not ( = ?auto_201688 ?auto_201690 ) ) ( not ( = ?auto_201688 ?auto_201691 ) ) ( not ( = ?auto_201688 ?auto_201692 ) ) ( not ( = ?auto_201688 ?auto_201694 ) ) ( not ( = ?auto_201689 ?auto_201690 ) ) ( not ( = ?auto_201689 ?auto_201691 ) ) ( not ( = ?auto_201689 ?auto_201692 ) ) ( not ( = ?auto_201689 ?auto_201694 ) ) ( not ( = ?auto_201690 ?auto_201691 ) ) ( not ( = ?auto_201690 ?auto_201692 ) ) ( not ( = ?auto_201690 ?auto_201694 ) ) ( not ( = ?auto_201691 ?auto_201692 ) ) ( not ( = ?auto_201691 ?auto_201694 ) ) ( not ( = ?auto_201692 ?auto_201694 ) ) ( ON ?auto_201694 ?auto_201693 ) ( not ( = ?auto_201686 ?auto_201693 ) ) ( not ( = ?auto_201687 ?auto_201693 ) ) ( not ( = ?auto_201688 ?auto_201693 ) ) ( not ( = ?auto_201689 ?auto_201693 ) ) ( not ( = ?auto_201690 ?auto_201693 ) ) ( not ( = ?auto_201691 ?auto_201693 ) ) ( not ( = ?auto_201692 ?auto_201693 ) ) ( not ( = ?auto_201694 ?auto_201693 ) ) ( ON ?auto_201692 ?auto_201694 ) ( ON-TABLE ?auto_201693 ) ( ON ?auto_201691 ?auto_201692 ) ( ON ?auto_201690 ?auto_201691 ) ( ON ?auto_201689 ?auto_201690 ) ( CLEAR ?auto_201687 ) ( ON ?auto_201688 ?auto_201689 ) ( CLEAR ?auto_201688 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_201693 ?auto_201694 ?auto_201692 ?auto_201691 ?auto_201690 ?auto_201689 )
      ( MAKE-7PILE ?auto_201686 ?auto_201687 ?auto_201688 ?auto_201689 ?auto_201690 ?auto_201691 ?auto_201692 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_201695 - BLOCK
      ?auto_201696 - BLOCK
      ?auto_201697 - BLOCK
      ?auto_201698 - BLOCK
      ?auto_201699 - BLOCK
      ?auto_201700 - BLOCK
      ?auto_201701 - BLOCK
    )
    :vars
    (
      ?auto_201703 - BLOCK
      ?auto_201702 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_201695 ) ( not ( = ?auto_201695 ?auto_201696 ) ) ( not ( = ?auto_201695 ?auto_201697 ) ) ( not ( = ?auto_201695 ?auto_201698 ) ) ( not ( = ?auto_201695 ?auto_201699 ) ) ( not ( = ?auto_201695 ?auto_201700 ) ) ( not ( = ?auto_201695 ?auto_201701 ) ) ( not ( = ?auto_201695 ?auto_201703 ) ) ( not ( = ?auto_201696 ?auto_201697 ) ) ( not ( = ?auto_201696 ?auto_201698 ) ) ( not ( = ?auto_201696 ?auto_201699 ) ) ( not ( = ?auto_201696 ?auto_201700 ) ) ( not ( = ?auto_201696 ?auto_201701 ) ) ( not ( = ?auto_201696 ?auto_201703 ) ) ( not ( = ?auto_201697 ?auto_201698 ) ) ( not ( = ?auto_201697 ?auto_201699 ) ) ( not ( = ?auto_201697 ?auto_201700 ) ) ( not ( = ?auto_201697 ?auto_201701 ) ) ( not ( = ?auto_201697 ?auto_201703 ) ) ( not ( = ?auto_201698 ?auto_201699 ) ) ( not ( = ?auto_201698 ?auto_201700 ) ) ( not ( = ?auto_201698 ?auto_201701 ) ) ( not ( = ?auto_201698 ?auto_201703 ) ) ( not ( = ?auto_201699 ?auto_201700 ) ) ( not ( = ?auto_201699 ?auto_201701 ) ) ( not ( = ?auto_201699 ?auto_201703 ) ) ( not ( = ?auto_201700 ?auto_201701 ) ) ( not ( = ?auto_201700 ?auto_201703 ) ) ( not ( = ?auto_201701 ?auto_201703 ) ) ( ON ?auto_201703 ?auto_201702 ) ( not ( = ?auto_201695 ?auto_201702 ) ) ( not ( = ?auto_201696 ?auto_201702 ) ) ( not ( = ?auto_201697 ?auto_201702 ) ) ( not ( = ?auto_201698 ?auto_201702 ) ) ( not ( = ?auto_201699 ?auto_201702 ) ) ( not ( = ?auto_201700 ?auto_201702 ) ) ( not ( = ?auto_201701 ?auto_201702 ) ) ( not ( = ?auto_201703 ?auto_201702 ) ) ( ON ?auto_201701 ?auto_201703 ) ( ON-TABLE ?auto_201702 ) ( ON ?auto_201700 ?auto_201701 ) ( ON ?auto_201699 ?auto_201700 ) ( ON ?auto_201698 ?auto_201699 ) ( ON ?auto_201697 ?auto_201698 ) ( CLEAR ?auto_201697 ) ( HOLDING ?auto_201696 ) ( CLEAR ?auto_201695 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_201695 ?auto_201696 )
      ( MAKE-7PILE ?auto_201695 ?auto_201696 ?auto_201697 ?auto_201698 ?auto_201699 ?auto_201700 ?auto_201701 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_201704 - BLOCK
      ?auto_201705 - BLOCK
      ?auto_201706 - BLOCK
      ?auto_201707 - BLOCK
      ?auto_201708 - BLOCK
      ?auto_201709 - BLOCK
      ?auto_201710 - BLOCK
    )
    :vars
    (
      ?auto_201711 - BLOCK
      ?auto_201712 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_201704 ) ( not ( = ?auto_201704 ?auto_201705 ) ) ( not ( = ?auto_201704 ?auto_201706 ) ) ( not ( = ?auto_201704 ?auto_201707 ) ) ( not ( = ?auto_201704 ?auto_201708 ) ) ( not ( = ?auto_201704 ?auto_201709 ) ) ( not ( = ?auto_201704 ?auto_201710 ) ) ( not ( = ?auto_201704 ?auto_201711 ) ) ( not ( = ?auto_201705 ?auto_201706 ) ) ( not ( = ?auto_201705 ?auto_201707 ) ) ( not ( = ?auto_201705 ?auto_201708 ) ) ( not ( = ?auto_201705 ?auto_201709 ) ) ( not ( = ?auto_201705 ?auto_201710 ) ) ( not ( = ?auto_201705 ?auto_201711 ) ) ( not ( = ?auto_201706 ?auto_201707 ) ) ( not ( = ?auto_201706 ?auto_201708 ) ) ( not ( = ?auto_201706 ?auto_201709 ) ) ( not ( = ?auto_201706 ?auto_201710 ) ) ( not ( = ?auto_201706 ?auto_201711 ) ) ( not ( = ?auto_201707 ?auto_201708 ) ) ( not ( = ?auto_201707 ?auto_201709 ) ) ( not ( = ?auto_201707 ?auto_201710 ) ) ( not ( = ?auto_201707 ?auto_201711 ) ) ( not ( = ?auto_201708 ?auto_201709 ) ) ( not ( = ?auto_201708 ?auto_201710 ) ) ( not ( = ?auto_201708 ?auto_201711 ) ) ( not ( = ?auto_201709 ?auto_201710 ) ) ( not ( = ?auto_201709 ?auto_201711 ) ) ( not ( = ?auto_201710 ?auto_201711 ) ) ( ON ?auto_201711 ?auto_201712 ) ( not ( = ?auto_201704 ?auto_201712 ) ) ( not ( = ?auto_201705 ?auto_201712 ) ) ( not ( = ?auto_201706 ?auto_201712 ) ) ( not ( = ?auto_201707 ?auto_201712 ) ) ( not ( = ?auto_201708 ?auto_201712 ) ) ( not ( = ?auto_201709 ?auto_201712 ) ) ( not ( = ?auto_201710 ?auto_201712 ) ) ( not ( = ?auto_201711 ?auto_201712 ) ) ( ON ?auto_201710 ?auto_201711 ) ( ON-TABLE ?auto_201712 ) ( ON ?auto_201709 ?auto_201710 ) ( ON ?auto_201708 ?auto_201709 ) ( ON ?auto_201707 ?auto_201708 ) ( ON ?auto_201706 ?auto_201707 ) ( CLEAR ?auto_201704 ) ( ON ?auto_201705 ?auto_201706 ) ( CLEAR ?auto_201705 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_201712 ?auto_201711 ?auto_201710 ?auto_201709 ?auto_201708 ?auto_201707 ?auto_201706 )
      ( MAKE-7PILE ?auto_201704 ?auto_201705 ?auto_201706 ?auto_201707 ?auto_201708 ?auto_201709 ?auto_201710 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_201713 - BLOCK
      ?auto_201714 - BLOCK
      ?auto_201715 - BLOCK
      ?auto_201716 - BLOCK
      ?auto_201717 - BLOCK
      ?auto_201718 - BLOCK
      ?auto_201719 - BLOCK
    )
    :vars
    (
      ?auto_201721 - BLOCK
      ?auto_201720 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_201713 ?auto_201714 ) ) ( not ( = ?auto_201713 ?auto_201715 ) ) ( not ( = ?auto_201713 ?auto_201716 ) ) ( not ( = ?auto_201713 ?auto_201717 ) ) ( not ( = ?auto_201713 ?auto_201718 ) ) ( not ( = ?auto_201713 ?auto_201719 ) ) ( not ( = ?auto_201713 ?auto_201721 ) ) ( not ( = ?auto_201714 ?auto_201715 ) ) ( not ( = ?auto_201714 ?auto_201716 ) ) ( not ( = ?auto_201714 ?auto_201717 ) ) ( not ( = ?auto_201714 ?auto_201718 ) ) ( not ( = ?auto_201714 ?auto_201719 ) ) ( not ( = ?auto_201714 ?auto_201721 ) ) ( not ( = ?auto_201715 ?auto_201716 ) ) ( not ( = ?auto_201715 ?auto_201717 ) ) ( not ( = ?auto_201715 ?auto_201718 ) ) ( not ( = ?auto_201715 ?auto_201719 ) ) ( not ( = ?auto_201715 ?auto_201721 ) ) ( not ( = ?auto_201716 ?auto_201717 ) ) ( not ( = ?auto_201716 ?auto_201718 ) ) ( not ( = ?auto_201716 ?auto_201719 ) ) ( not ( = ?auto_201716 ?auto_201721 ) ) ( not ( = ?auto_201717 ?auto_201718 ) ) ( not ( = ?auto_201717 ?auto_201719 ) ) ( not ( = ?auto_201717 ?auto_201721 ) ) ( not ( = ?auto_201718 ?auto_201719 ) ) ( not ( = ?auto_201718 ?auto_201721 ) ) ( not ( = ?auto_201719 ?auto_201721 ) ) ( ON ?auto_201721 ?auto_201720 ) ( not ( = ?auto_201713 ?auto_201720 ) ) ( not ( = ?auto_201714 ?auto_201720 ) ) ( not ( = ?auto_201715 ?auto_201720 ) ) ( not ( = ?auto_201716 ?auto_201720 ) ) ( not ( = ?auto_201717 ?auto_201720 ) ) ( not ( = ?auto_201718 ?auto_201720 ) ) ( not ( = ?auto_201719 ?auto_201720 ) ) ( not ( = ?auto_201721 ?auto_201720 ) ) ( ON ?auto_201719 ?auto_201721 ) ( ON-TABLE ?auto_201720 ) ( ON ?auto_201718 ?auto_201719 ) ( ON ?auto_201717 ?auto_201718 ) ( ON ?auto_201716 ?auto_201717 ) ( ON ?auto_201715 ?auto_201716 ) ( ON ?auto_201714 ?auto_201715 ) ( CLEAR ?auto_201714 ) ( HOLDING ?auto_201713 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_201713 )
      ( MAKE-7PILE ?auto_201713 ?auto_201714 ?auto_201715 ?auto_201716 ?auto_201717 ?auto_201718 ?auto_201719 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_201722 - BLOCK
      ?auto_201723 - BLOCK
      ?auto_201724 - BLOCK
      ?auto_201725 - BLOCK
      ?auto_201726 - BLOCK
      ?auto_201727 - BLOCK
      ?auto_201728 - BLOCK
    )
    :vars
    (
      ?auto_201729 - BLOCK
      ?auto_201730 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_201722 ?auto_201723 ) ) ( not ( = ?auto_201722 ?auto_201724 ) ) ( not ( = ?auto_201722 ?auto_201725 ) ) ( not ( = ?auto_201722 ?auto_201726 ) ) ( not ( = ?auto_201722 ?auto_201727 ) ) ( not ( = ?auto_201722 ?auto_201728 ) ) ( not ( = ?auto_201722 ?auto_201729 ) ) ( not ( = ?auto_201723 ?auto_201724 ) ) ( not ( = ?auto_201723 ?auto_201725 ) ) ( not ( = ?auto_201723 ?auto_201726 ) ) ( not ( = ?auto_201723 ?auto_201727 ) ) ( not ( = ?auto_201723 ?auto_201728 ) ) ( not ( = ?auto_201723 ?auto_201729 ) ) ( not ( = ?auto_201724 ?auto_201725 ) ) ( not ( = ?auto_201724 ?auto_201726 ) ) ( not ( = ?auto_201724 ?auto_201727 ) ) ( not ( = ?auto_201724 ?auto_201728 ) ) ( not ( = ?auto_201724 ?auto_201729 ) ) ( not ( = ?auto_201725 ?auto_201726 ) ) ( not ( = ?auto_201725 ?auto_201727 ) ) ( not ( = ?auto_201725 ?auto_201728 ) ) ( not ( = ?auto_201725 ?auto_201729 ) ) ( not ( = ?auto_201726 ?auto_201727 ) ) ( not ( = ?auto_201726 ?auto_201728 ) ) ( not ( = ?auto_201726 ?auto_201729 ) ) ( not ( = ?auto_201727 ?auto_201728 ) ) ( not ( = ?auto_201727 ?auto_201729 ) ) ( not ( = ?auto_201728 ?auto_201729 ) ) ( ON ?auto_201729 ?auto_201730 ) ( not ( = ?auto_201722 ?auto_201730 ) ) ( not ( = ?auto_201723 ?auto_201730 ) ) ( not ( = ?auto_201724 ?auto_201730 ) ) ( not ( = ?auto_201725 ?auto_201730 ) ) ( not ( = ?auto_201726 ?auto_201730 ) ) ( not ( = ?auto_201727 ?auto_201730 ) ) ( not ( = ?auto_201728 ?auto_201730 ) ) ( not ( = ?auto_201729 ?auto_201730 ) ) ( ON ?auto_201728 ?auto_201729 ) ( ON-TABLE ?auto_201730 ) ( ON ?auto_201727 ?auto_201728 ) ( ON ?auto_201726 ?auto_201727 ) ( ON ?auto_201725 ?auto_201726 ) ( ON ?auto_201724 ?auto_201725 ) ( ON ?auto_201723 ?auto_201724 ) ( ON ?auto_201722 ?auto_201723 ) ( CLEAR ?auto_201722 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_201730 ?auto_201729 ?auto_201728 ?auto_201727 ?auto_201726 ?auto_201725 ?auto_201724 ?auto_201723 )
      ( MAKE-7PILE ?auto_201722 ?auto_201723 ?auto_201724 ?auto_201725 ?auto_201726 ?auto_201727 ?auto_201728 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_201732 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_201732 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_201732 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_201733 - BLOCK
    )
    :vars
    (
      ?auto_201734 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_201733 ?auto_201734 ) ( CLEAR ?auto_201733 ) ( HAND-EMPTY ) ( not ( = ?auto_201733 ?auto_201734 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_201733 ?auto_201734 )
      ( MAKE-1PILE ?auto_201733 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_201735 - BLOCK
    )
    :vars
    (
      ?auto_201736 - BLOCK
      ?auto_201740 - BLOCK
      ?auto_201739 - BLOCK
      ?auto_201737 - BLOCK
      ?auto_201741 - BLOCK
      ?auto_201738 - BLOCK
      ?auto_201742 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_201735 ?auto_201736 ) ) ( HOLDING ?auto_201735 ) ( CLEAR ?auto_201736 ) ( ON-TABLE ?auto_201740 ) ( ON ?auto_201739 ?auto_201740 ) ( ON ?auto_201737 ?auto_201739 ) ( ON ?auto_201741 ?auto_201737 ) ( ON ?auto_201738 ?auto_201741 ) ( ON ?auto_201742 ?auto_201738 ) ( ON ?auto_201736 ?auto_201742 ) ( not ( = ?auto_201740 ?auto_201739 ) ) ( not ( = ?auto_201740 ?auto_201737 ) ) ( not ( = ?auto_201740 ?auto_201741 ) ) ( not ( = ?auto_201740 ?auto_201738 ) ) ( not ( = ?auto_201740 ?auto_201742 ) ) ( not ( = ?auto_201740 ?auto_201736 ) ) ( not ( = ?auto_201740 ?auto_201735 ) ) ( not ( = ?auto_201739 ?auto_201737 ) ) ( not ( = ?auto_201739 ?auto_201741 ) ) ( not ( = ?auto_201739 ?auto_201738 ) ) ( not ( = ?auto_201739 ?auto_201742 ) ) ( not ( = ?auto_201739 ?auto_201736 ) ) ( not ( = ?auto_201739 ?auto_201735 ) ) ( not ( = ?auto_201737 ?auto_201741 ) ) ( not ( = ?auto_201737 ?auto_201738 ) ) ( not ( = ?auto_201737 ?auto_201742 ) ) ( not ( = ?auto_201737 ?auto_201736 ) ) ( not ( = ?auto_201737 ?auto_201735 ) ) ( not ( = ?auto_201741 ?auto_201738 ) ) ( not ( = ?auto_201741 ?auto_201742 ) ) ( not ( = ?auto_201741 ?auto_201736 ) ) ( not ( = ?auto_201741 ?auto_201735 ) ) ( not ( = ?auto_201738 ?auto_201742 ) ) ( not ( = ?auto_201738 ?auto_201736 ) ) ( not ( = ?auto_201738 ?auto_201735 ) ) ( not ( = ?auto_201742 ?auto_201736 ) ) ( not ( = ?auto_201742 ?auto_201735 ) ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_201740 ?auto_201739 ?auto_201737 ?auto_201741 ?auto_201738 ?auto_201742 ?auto_201736 ?auto_201735 )
      ( MAKE-1PILE ?auto_201735 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_201743 - BLOCK
    )
    :vars
    (
      ?auto_201746 - BLOCK
      ?auto_201744 - BLOCK
      ?auto_201749 - BLOCK
      ?auto_201748 - BLOCK
      ?auto_201750 - BLOCK
      ?auto_201745 - BLOCK
      ?auto_201747 - BLOCK
      ?auto_201751 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_201743 ?auto_201746 ) ) ( CLEAR ?auto_201746 ) ( ON-TABLE ?auto_201744 ) ( ON ?auto_201749 ?auto_201744 ) ( ON ?auto_201748 ?auto_201749 ) ( ON ?auto_201750 ?auto_201748 ) ( ON ?auto_201745 ?auto_201750 ) ( ON ?auto_201747 ?auto_201745 ) ( ON ?auto_201746 ?auto_201747 ) ( not ( = ?auto_201744 ?auto_201749 ) ) ( not ( = ?auto_201744 ?auto_201748 ) ) ( not ( = ?auto_201744 ?auto_201750 ) ) ( not ( = ?auto_201744 ?auto_201745 ) ) ( not ( = ?auto_201744 ?auto_201747 ) ) ( not ( = ?auto_201744 ?auto_201746 ) ) ( not ( = ?auto_201744 ?auto_201743 ) ) ( not ( = ?auto_201749 ?auto_201748 ) ) ( not ( = ?auto_201749 ?auto_201750 ) ) ( not ( = ?auto_201749 ?auto_201745 ) ) ( not ( = ?auto_201749 ?auto_201747 ) ) ( not ( = ?auto_201749 ?auto_201746 ) ) ( not ( = ?auto_201749 ?auto_201743 ) ) ( not ( = ?auto_201748 ?auto_201750 ) ) ( not ( = ?auto_201748 ?auto_201745 ) ) ( not ( = ?auto_201748 ?auto_201747 ) ) ( not ( = ?auto_201748 ?auto_201746 ) ) ( not ( = ?auto_201748 ?auto_201743 ) ) ( not ( = ?auto_201750 ?auto_201745 ) ) ( not ( = ?auto_201750 ?auto_201747 ) ) ( not ( = ?auto_201750 ?auto_201746 ) ) ( not ( = ?auto_201750 ?auto_201743 ) ) ( not ( = ?auto_201745 ?auto_201747 ) ) ( not ( = ?auto_201745 ?auto_201746 ) ) ( not ( = ?auto_201745 ?auto_201743 ) ) ( not ( = ?auto_201747 ?auto_201746 ) ) ( not ( = ?auto_201747 ?auto_201743 ) ) ( ON ?auto_201743 ?auto_201751 ) ( CLEAR ?auto_201743 ) ( HAND-EMPTY ) ( not ( = ?auto_201743 ?auto_201751 ) ) ( not ( = ?auto_201746 ?auto_201751 ) ) ( not ( = ?auto_201744 ?auto_201751 ) ) ( not ( = ?auto_201749 ?auto_201751 ) ) ( not ( = ?auto_201748 ?auto_201751 ) ) ( not ( = ?auto_201750 ?auto_201751 ) ) ( not ( = ?auto_201745 ?auto_201751 ) ) ( not ( = ?auto_201747 ?auto_201751 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_201743 ?auto_201751 )
      ( MAKE-1PILE ?auto_201743 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_201752 - BLOCK
    )
    :vars
    (
      ?auto_201760 - BLOCK
      ?auto_201757 - BLOCK
      ?auto_201755 - BLOCK
      ?auto_201754 - BLOCK
      ?auto_201758 - BLOCK
      ?auto_201759 - BLOCK
      ?auto_201753 - BLOCK
      ?auto_201756 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_201752 ?auto_201760 ) ) ( ON-TABLE ?auto_201757 ) ( ON ?auto_201755 ?auto_201757 ) ( ON ?auto_201754 ?auto_201755 ) ( ON ?auto_201758 ?auto_201754 ) ( ON ?auto_201759 ?auto_201758 ) ( ON ?auto_201753 ?auto_201759 ) ( not ( = ?auto_201757 ?auto_201755 ) ) ( not ( = ?auto_201757 ?auto_201754 ) ) ( not ( = ?auto_201757 ?auto_201758 ) ) ( not ( = ?auto_201757 ?auto_201759 ) ) ( not ( = ?auto_201757 ?auto_201753 ) ) ( not ( = ?auto_201757 ?auto_201760 ) ) ( not ( = ?auto_201757 ?auto_201752 ) ) ( not ( = ?auto_201755 ?auto_201754 ) ) ( not ( = ?auto_201755 ?auto_201758 ) ) ( not ( = ?auto_201755 ?auto_201759 ) ) ( not ( = ?auto_201755 ?auto_201753 ) ) ( not ( = ?auto_201755 ?auto_201760 ) ) ( not ( = ?auto_201755 ?auto_201752 ) ) ( not ( = ?auto_201754 ?auto_201758 ) ) ( not ( = ?auto_201754 ?auto_201759 ) ) ( not ( = ?auto_201754 ?auto_201753 ) ) ( not ( = ?auto_201754 ?auto_201760 ) ) ( not ( = ?auto_201754 ?auto_201752 ) ) ( not ( = ?auto_201758 ?auto_201759 ) ) ( not ( = ?auto_201758 ?auto_201753 ) ) ( not ( = ?auto_201758 ?auto_201760 ) ) ( not ( = ?auto_201758 ?auto_201752 ) ) ( not ( = ?auto_201759 ?auto_201753 ) ) ( not ( = ?auto_201759 ?auto_201760 ) ) ( not ( = ?auto_201759 ?auto_201752 ) ) ( not ( = ?auto_201753 ?auto_201760 ) ) ( not ( = ?auto_201753 ?auto_201752 ) ) ( ON ?auto_201752 ?auto_201756 ) ( CLEAR ?auto_201752 ) ( not ( = ?auto_201752 ?auto_201756 ) ) ( not ( = ?auto_201760 ?auto_201756 ) ) ( not ( = ?auto_201757 ?auto_201756 ) ) ( not ( = ?auto_201755 ?auto_201756 ) ) ( not ( = ?auto_201754 ?auto_201756 ) ) ( not ( = ?auto_201758 ?auto_201756 ) ) ( not ( = ?auto_201759 ?auto_201756 ) ) ( not ( = ?auto_201753 ?auto_201756 ) ) ( HOLDING ?auto_201760 ) ( CLEAR ?auto_201753 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_201757 ?auto_201755 ?auto_201754 ?auto_201758 ?auto_201759 ?auto_201753 ?auto_201760 )
      ( MAKE-1PILE ?auto_201752 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_201761 - BLOCK
    )
    :vars
    (
      ?auto_201763 - BLOCK
      ?auto_201762 - BLOCK
      ?auto_201769 - BLOCK
      ?auto_201766 - BLOCK
      ?auto_201764 - BLOCK
      ?auto_201768 - BLOCK
      ?auto_201767 - BLOCK
      ?auto_201765 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_201761 ?auto_201763 ) ) ( ON-TABLE ?auto_201762 ) ( ON ?auto_201769 ?auto_201762 ) ( ON ?auto_201766 ?auto_201769 ) ( ON ?auto_201764 ?auto_201766 ) ( ON ?auto_201768 ?auto_201764 ) ( ON ?auto_201767 ?auto_201768 ) ( not ( = ?auto_201762 ?auto_201769 ) ) ( not ( = ?auto_201762 ?auto_201766 ) ) ( not ( = ?auto_201762 ?auto_201764 ) ) ( not ( = ?auto_201762 ?auto_201768 ) ) ( not ( = ?auto_201762 ?auto_201767 ) ) ( not ( = ?auto_201762 ?auto_201763 ) ) ( not ( = ?auto_201762 ?auto_201761 ) ) ( not ( = ?auto_201769 ?auto_201766 ) ) ( not ( = ?auto_201769 ?auto_201764 ) ) ( not ( = ?auto_201769 ?auto_201768 ) ) ( not ( = ?auto_201769 ?auto_201767 ) ) ( not ( = ?auto_201769 ?auto_201763 ) ) ( not ( = ?auto_201769 ?auto_201761 ) ) ( not ( = ?auto_201766 ?auto_201764 ) ) ( not ( = ?auto_201766 ?auto_201768 ) ) ( not ( = ?auto_201766 ?auto_201767 ) ) ( not ( = ?auto_201766 ?auto_201763 ) ) ( not ( = ?auto_201766 ?auto_201761 ) ) ( not ( = ?auto_201764 ?auto_201768 ) ) ( not ( = ?auto_201764 ?auto_201767 ) ) ( not ( = ?auto_201764 ?auto_201763 ) ) ( not ( = ?auto_201764 ?auto_201761 ) ) ( not ( = ?auto_201768 ?auto_201767 ) ) ( not ( = ?auto_201768 ?auto_201763 ) ) ( not ( = ?auto_201768 ?auto_201761 ) ) ( not ( = ?auto_201767 ?auto_201763 ) ) ( not ( = ?auto_201767 ?auto_201761 ) ) ( ON ?auto_201761 ?auto_201765 ) ( not ( = ?auto_201761 ?auto_201765 ) ) ( not ( = ?auto_201763 ?auto_201765 ) ) ( not ( = ?auto_201762 ?auto_201765 ) ) ( not ( = ?auto_201769 ?auto_201765 ) ) ( not ( = ?auto_201766 ?auto_201765 ) ) ( not ( = ?auto_201764 ?auto_201765 ) ) ( not ( = ?auto_201768 ?auto_201765 ) ) ( not ( = ?auto_201767 ?auto_201765 ) ) ( CLEAR ?auto_201767 ) ( ON ?auto_201763 ?auto_201761 ) ( CLEAR ?auto_201763 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_201765 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_201765 ?auto_201761 )
      ( MAKE-1PILE ?auto_201761 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_201770 - BLOCK
    )
    :vars
    (
      ?auto_201774 - BLOCK
      ?auto_201776 - BLOCK
      ?auto_201778 - BLOCK
      ?auto_201772 - BLOCK
      ?auto_201773 - BLOCK
      ?auto_201771 - BLOCK
      ?auto_201775 - BLOCK
      ?auto_201777 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_201770 ?auto_201774 ) ) ( ON-TABLE ?auto_201776 ) ( ON ?auto_201778 ?auto_201776 ) ( ON ?auto_201772 ?auto_201778 ) ( ON ?auto_201773 ?auto_201772 ) ( ON ?auto_201771 ?auto_201773 ) ( not ( = ?auto_201776 ?auto_201778 ) ) ( not ( = ?auto_201776 ?auto_201772 ) ) ( not ( = ?auto_201776 ?auto_201773 ) ) ( not ( = ?auto_201776 ?auto_201771 ) ) ( not ( = ?auto_201776 ?auto_201775 ) ) ( not ( = ?auto_201776 ?auto_201774 ) ) ( not ( = ?auto_201776 ?auto_201770 ) ) ( not ( = ?auto_201778 ?auto_201772 ) ) ( not ( = ?auto_201778 ?auto_201773 ) ) ( not ( = ?auto_201778 ?auto_201771 ) ) ( not ( = ?auto_201778 ?auto_201775 ) ) ( not ( = ?auto_201778 ?auto_201774 ) ) ( not ( = ?auto_201778 ?auto_201770 ) ) ( not ( = ?auto_201772 ?auto_201773 ) ) ( not ( = ?auto_201772 ?auto_201771 ) ) ( not ( = ?auto_201772 ?auto_201775 ) ) ( not ( = ?auto_201772 ?auto_201774 ) ) ( not ( = ?auto_201772 ?auto_201770 ) ) ( not ( = ?auto_201773 ?auto_201771 ) ) ( not ( = ?auto_201773 ?auto_201775 ) ) ( not ( = ?auto_201773 ?auto_201774 ) ) ( not ( = ?auto_201773 ?auto_201770 ) ) ( not ( = ?auto_201771 ?auto_201775 ) ) ( not ( = ?auto_201771 ?auto_201774 ) ) ( not ( = ?auto_201771 ?auto_201770 ) ) ( not ( = ?auto_201775 ?auto_201774 ) ) ( not ( = ?auto_201775 ?auto_201770 ) ) ( ON ?auto_201770 ?auto_201777 ) ( not ( = ?auto_201770 ?auto_201777 ) ) ( not ( = ?auto_201774 ?auto_201777 ) ) ( not ( = ?auto_201776 ?auto_201777 ) ) ( not ( = ?auto_201778 ?auto_201777 ) ) ( not ( = ?auto_201772 ?auto_201777 ) ) ( not ( = ?auto_201773 ?auto_201777 ) ) ( not ( = ?auto_201771 ?auto_201777 ) ) ( not ( = ?auto_201775 ?auto_201777 ) ) ( ON ?auto_201774 ?auto_201770 ) ( CLEAR ?auto_201774 ) ( ON-TABLE ?auto_201777 ) ( HOLDING ?auto_201775 ) ( CLEAR ?auto_201771 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_201776 ?auto_201778 ?auto_201772 ?auto_201773 ?auto_201771 ?auto_201775 )
      ( MAKE-1PILE ?auto_201770 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_201779 - BLOCK
    )
    :vars
    (
      ?auto_201785 - BLOCK
      ?auto_201782 - BLOCK
      ?auto_201780 - BLOCK
      ?auto_201784 - BLOCK
      ?auto_201786 - BLOCK
      ?auto_201781 - BLOCK
      ?auto_201783 - BLOCK
      ?auto_201787 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_201779 ?auto_201785 ) ) ( ON-TABLE ?auto_201782 ) ( ON ?auto_201780 ?auto_201782 ) ( ON ?auto_201784 ?auto_201780 ) ( ON ?auto_201786 ?auto_201784 ) ( ON ?auto_201781 ?auto_201786 ) ( not ( = ?auto_201782 ?auto_201780 ) ) ( not ( = ?auto_201782 ?auto_201784 ) ) ( not ( = ?auto_201782 ?auto_201786 ) ) ( not ( = ?auto_201782 ?auto_201781 ) ) ( not ( = ?auto_201782 ?auto_201783 ) ) ( not ( = ?auto_201782 ?auto_201785 ) ) ( not ( = ?auto_201782 ?auto_201779 ) ) ( not ( = ?auto_201780 ?auto_201784 ) ) ( not ( = ?auto_201780 ?auto_201786 ) ) ( not ( = ?auto_201780 ?auto_201781 ) ) ( not ( = ?auto_201780 ?auto_201783 ) ) ( not ( = ?auto_201780 ?auto_201785 ) ) ( not ( = ?auto_201780 ?auto_201779 ) ) ( not ( = ?auto_201784 ?auto_201786 ) ) ( not ( = ?auto_201784 ?auto_201781 ) ) ( not ( = ?auto_201784 ?auto_201783 ) ) ( not ( = ?auto_201784 ?auto_201785 ) ) ( not ( = ?auto_201784 ?auto_201779 ) ) ( not ( = ?auto_201786 ?auto_201781 ) ) ( not ( = ?auto_201786 ?auto_201783 ) ) ( not ( = ?auto_201786 ?auto_201785 ) ) ( not ( = ?auto_201786 ?auto_201779 ) ) ( not ( = ?auto_201781 ?auto_201783 ) ) ( not ( = ?auto_201781 ?auto_201785 ) ) ( not ( = ?auto_201781 ?auto_201779 ) ) ( not ( = ?auto_201783 ?auto_201785 ) ) ( not ( = ?auto_201783 ?auto_201779 ) ) ( ON ?auto_201779 ?auto_201787 ) ( not ( = ?auto_201779 ?auto_201787 ) ) ( not ( = ?auto_201785 ?auto_201787 ) ) ( not ( = ?auto_201782 ?auto_201787 ) ) ( not ( = ?auto_201780 ?auto_201787 ) ) ( not ( = ?auto_201784 ?auto_201787 ) ) ( not ( = ?auto_201786 ?auto_201787 ) ) ( not ( = ?auto_201781 ?auto_201787 ) ) ( not ( = ?auto_201783 ?auto_201787 ) ) ( ON ?auto_201785 ?auto_201779 ) ( ON-TABLE ?auto_201787 ) ( CLEAR ?auto_201781 ) ( ON ?auto_201783 ?auto_201785 ) ( CLEAR ?auto_201783 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_201787 ?auto_201779 ?auto_201785 )
      ( MAKE-1PILE ?auto_201779 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_201788 - BLOCK
    )
    :vars
    (
      ?auto_201792 - BLOCK
      ?auto_201794 - BLOCK
      ?auto_201793 - BLOCK
      ?auto_201789 - BLOCK
      ?auto_201796 - BLOCK
      ?auto_201795 - BLOCK
      ?auto_201790 - BLOCK
      ?auto_201791 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_201788 ?auto_201792 ) ) ( ON-TABLE ?auto_201794 ) ( ON ?auto_201793 ?auto_201794 ) ( ON ?auto_201789 ?auto_201793 ) ( ON ?auto_201796 ?auto_201789 ) ( not ( = ?auto_201794 ?auto_201793 ) ) ( not ( = ?auto_201794 ?auto_201789 ) ) ( not ( = ?auto_201794 ?auto_201796 ) ) ( not ( = ?auto_201794 ?auto_201795 ) ) ( not ( = ?auto_201794 ?auto_201790 ) ) ( not ( = ?auto_201794 ?auto_201792 ) ) ( not ( = ?auto_201794 ?auto_201788 ) ) ( not ( = ?auto_201793 ?auto_201789 ) ) ( not ( = ?auto_201793 ?auto_201796 ) ) ( not ( = ?auto_201793 ?auto_201795 ) ) ( not ( = ?auto_201793 ?auto_201790 ) ) ( not ( = ?auto_201793 ?auto_201792 ) ) ( not ( = ?auto_201793 ?auto_201788 ) ) ( not ( = ?auto_201789 ?auto_201796 ) ) ( not ( = ?auto_201789 ?auto_201795 ) ) ( not ( = ?auto_201789 ?auto_201790 ) ) ( not ( = ?auto_201789 ?auto_201792 ) ) ( not ( = ?auto_201789 ?auto_201788 ) ) ( not ( = ?auto_201796 ?auto_201795 ) ) ( not ( = ?auto_201796 ?auto_201790 ) ) ( not ( = ?auto_201796 ?auto_201792 ) ) ( not ( = ?auto_201796 ?auto_201788 ) ) ( not ( = ?auto_201795 ?auto_201790 ) ) ( not ( = ?auto_201795 ?auto_201792 ) ) ( not ( = ?auto_201795 ?auto_201788 ) ) ( not ( = ?auto_201790 ?auto_201792 ) ) ( not ( = ?auto_201790 ?auto_201788 ) ) ( ON ?auto_201788 ?auto_201791 ) ( not ( = ?auto_201788 ?auto_201791 ) ) ( not ( = ?auto_201792 ?auto_201791 ) ) ( not ( = ?auto_201794 ?auto_201791 ) ) ( not ( = ?auto_201793 ?auto_201791 ) ) ( not ( = ?auto_201789 ?auto_201791 ) ) ( not ( = ?auto_201796 ?auto_201791 ) ) ( not ( = ?auto_201795 ?auto_201791 ) ) ( not ( = ?auto_201790 ?auto_201791 ) ) ( ON ?auto_201792 ?auto_201788 ) ( ON-TABLE ?auto_201791 ) ( ON ?auto_201790 ?auto_201792 ) ( CLEAR ?auto_201790 ) ( HOLDING ?auto_201795 ) ( CLEAR ?auto_201796 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_201794 ?auto_201793 ?auto_201789 ?auto_201796 ?auto_201795 )
      ( MAKE-1PILE ?auto_201788 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_201797 - BLOCK
    )
    :vars
    (
      ?auto_201804 - BLOCK
      ?auto_201801 - BLOCK
      ?auto_201799 - BLOCK
      ?auto_201798 - BLOCK
      ?auto_201802 - BLOCK
      ?auto_201803 - BLOCK
      ?auto_201800 - BLOCK
      ?auto_201805 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_201797 ?auto_201804 ) ) ( ON-TABLE ?auto_201801 ) ( ON ?auto_201799 ?auto_201801 ) ( ON ?auto_201798 ?auto_201799 ) ( ON ?auto_201802 ?auto_201798 ) ( not ( = ?auto_201801 ?auto_201799 ) ) ( not ( = ?auto_201801 ?auto_201798 ) ) ( not ( = ?auto_201801 ?auto_201802 ) ) ( not ( = ?auto_201801 ?auto_201803 ) ) ( not ( = ?auto_201801 ?auto_201800 ) ) ( not ( = ?auto_201801 ?auto_201804 ) ) ( not ( = ?auto_201801 ?auto_201797 ) ) ( not ( = ?auto_201799 ?auto_201798 ) ) ( not ( = ?auto_201799 ?auto_201802 ) ) ( not ( = ?auto_201799 ?auto_201803 ) ) ( not ( = ?auto_201799 ?auto_201800 ) ) ( not ( = ?auto_201799 ?auto_201804 ) ) ( not ( = ?auto_201799 ?auto_201797 ) ) ( not ( = ?auto_201798 ?auto_201802 ) ) ( not ( = ?auto_201798 ?auto_201803 ) ) ( not ( = ?auto_201798 ?auto_201800 ) ) ( not ( = ?auto_201798 ?auto_201804 ) ) ( not ( = ?auto_201798 ?auto_201797 ) ) ( not ( = ?auto_201802 ?auto_201803 ) ) ( not ( = ?auto_201802 ?auto_201800 ) ) ( not ( = ?auto_201802 ?auto_201804 ) ) ( not ( = ?auto_201802 ?auto_201797 ) ) ( not ( = ?auto_201803 ?auto_201800 ) ) ( not ( = ?auto_201803 ?auto_201804 ) ) ( not ( = ?auto_201803 ?auto_201797 ) ) ( not ( = ?auto_201800 ?auto_201804 ) ) ( not ( = ?auto_201800 ?auto_201797 ) ) ( ON ?auto_201797 ?auto_201805 ) ( not ( = ?auto_201797 ?auto_201805 ) ) ( not ( = ?auto_201804 ?auto_201805 ) ) ( not ( = ?auto_201801 ?auto_201805 ) ) ( not ( = ?auto_201799 ?auto_201805 ) ) ( not ( = ?auto_201798 ?auto_201805 ) ) ( not ( = ?auto_201802 ?auto_201805 ) ) ( not ( = ?auto_201803 ?auto_201805 ) ) ( not ( = ?auto_201800 ?auto_201805 ) ) ( ON ?auto_201804 ?auto_201797 ) ( ON-TABLE ?auto_201805 ) ( ON ?auto_201800 ?auto_201804 ) ( CLEAR ?auto_201802 ) ( ON ?auto_201803 ?auto_201800 ) ( CLEAR ?auto_201803 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_201805 ?auto_201797 ?auto_201804 ?auto_201800 )
      ( MAKE-1PILE ?auto_201797 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_201806 - BLOCK
    )
    :vars
    (
      ?auto_201808 - BLOCK
      ?auto_201811 - BLOCK
      ?auto_201809 - BLOCK
      ?auto_201813 - BLOCK
      ?auto_201810 - BLOCK
      ?auto_201814 - BLOCK
      ?auto_201812 - BLOCK
      ?auto_201807 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_201806 ?auto_201808 ) ) ( ON-TABLE ?auto_201811 ) ( ON ?auto_201809 ?auto_201811 ) ( ON ?auto_201813 ?auto_201809 ) ( not ( = ?auto_201811 ?auto_201809 ) ) ( not ( = ?auto_201811 ?auto_201813 ) ) ( not ( = ?auto_201811 ?auto_201810 ) ) ( not ( = ?auto_201811 ?auto_201814 ) ) ( not ( = ?auto_201811 ?auto_201812 ) ) ( not ( = ?auto_201811 ?auto_201808 ) ) ( not ( = ?auto_201811 ?auto_201806 ) ) ( not ( = ?auto_201809 ?auto_201813 ) ) ( not ( = ?auto_201809 ?auto_201810 ) ) ( not ( = ?auto_201809 ?auto_201814 ) ) ( not ( = ?auto_201809 ?auto_201812 ) ) ( not ( = ?auto_201809 ?auto_201808 ) ) ( not ( = ?auto_201809 ?auto_201806 ) ) ( not ( = ?auto_201813 ?auto_201810 ) ) ( not ( = ?auto_201813 ?auto_201814 ) ) ( not ( = ?auto_201813 ?auto_201812 ) ) ( not ( = ?auto_201813 ?auto_201808 ) ) ( not ( = ?auto_201813 ?auto_201806 ) ) ( not ( = ?auto_201810 ?auto_201814 ) ) ( not ( = ?auto_201810 ?auto_201812 ) ) ( not ( = ?auto_201810 ?auto_201808 ) ) ( not ( = ?auto_201810 ?auto_201806 ) ) ( not ( = ?auto_201814 ?auto_201812 ) ) ( not ( = ?auto_201814 ?auto_201808 ) ) ( not ( = ?auto_201814 ?auto_201806 ) ) ( not ( = ?auto_201812 ?auto_201808 ) ) ( not ( = ?auto_201812 ?auto_201806 ) ) ( ON ?auto_201806 ?auto_201807 ) ( not ( = ?auto_201806 ?auto_201807 ) ) ( not ( = ?auto_201808 ?auto_201807 ) ) ( not ( = ?auto_201811 ?auto_201807 ) ) ( not ( = ?auto_201809 ?auto_201807 ) ) ( not ( = ?auto_201813 ?auto_201807 ) ) ( not ( = ?auto_201810 ?auto_201807 ) ) ( not ( = ?auto_201814 ?auto_201807 ) ) ( not ( = ?auto_201812 ?auto_201807 ) ) ( ON ?auto_201808 ?auto_201806 ) ( ON-TABLE ?auto_201807 ) ( ON ?auto_201812 ?auto_201808 ) ( ON ?auto_201814 ?auto_201812 ) ( CLEAR ?auto_201814 ) ( HOLDING ?auto_201810 ) ( CLEAR ?auto_201813 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_201811 ?auto_201809 ?auto_201813 ?auto_201810 )
      ( MAKE-1PILE ?auto_201806 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_201815 - BLOCK
    )
    :vars
    (
      ?auto_201816 - BLOCK
      ?auto_201819 - BLOCK
      ?auto_201821 - BLOCK
      ?auto_201822 - BLOCK
      ?auto_201820 - BLOCK
      ?auto_201817 - BLOCK
      ?auto_201823 - BLOCK
      ?auto_201818 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_201815 ?auto_201816 ) ) ( ON-TABLE ?auto_201819 ) ( ON ?auto_201821 ?auto_201819 ) ( ON ?auto_201822 ?auto_201821 ) ( not ( = ?auto_201819 ?auto_201821 ) ) ( not ( = ?auto_201819 ?auto_201822 ) ) ( not ( = ?auto_201819 ?auto_201820 ) ) ( not ( = ?auto_201819 ?auto_201817 ) ) ( not ( = ?auto_201819 ?auto_201823 ) ) ( not ( = ?auto_201819 ?auto_201816 ) ) ( not ( = ?auto_201819 ?auto_201815 ) ) ( not ( = ?auto_201821 ?auto_201822 ) ) ( not ( = ?auto_201821 ?auto_201820 ) ) ( not ( = ?auto_201821 ?auto_201817 ) ) ( not ( = ?auto_201821 ?auto_201823 ) ) ( not ( = ?auto_201821 ?auto_201816 ) ) ( not ( = ?auto_201821 ?auto_201815 ) ) ( not ( = ?auto_201822 ?auto_201820 ) ) ( not ( = ?auto_201822 ?auto_201817 ) ) ( not ( = ?auto_201822 ?auto_201823 ) ) ( not ( = ?auto_201822 ?auto_201816 ) ) ( not ( = ?auto_201822 ?auto_201815 ) ) ( not ( = ?auto_201820 ?auto_201817 ) ) ( not ( = ?auto_201820 ?auto_201823 ) ) ( not ( = ?auto_201820 ?auto_201816 ) ) ( not ( = ?auto_201820 ?auto_201815 ) ) ( not ( = ?auto_201817 ?auto_201823 ) ) ( not ( = ?auto_201817 ?auto_201816 ) ) ( not ( = ?auto_201817 ?auto_201815 ) ) ( not ( = ?auto_201823 ?auto_201816 ) ) ( not ( = ?auto_201823 ?auto_201815 ) ) ( ON ?auto_201815 ?auto_201818 ) ( not ( = ?auto_201815 ?auto_201818 ) ) ( not ( = ?auto_201816 ?auto_201818 ) ) ( not ( = ?auto_201819 ?auto_201818 ) ) ( not ( = ?auto_201821 ?auto_201818 ) ) ( not ( = ?auto_201822 ?auto_201818 ) ) ( not ( = ?auto_201820 ?auto_201818 ) ) ( not ( = ?auto_201817 ?auto_201818 ) ) ( not ( = ?auto_201823 ?auto_201818 ) ) ( ON ?auto_201816 ?auto_201815 ) ( ON-TABLE ?auto_201818 ) ( ON ?auto_201823 ?auto_201816 ) ( ON ?auto_201817 ?auto_201823 ) ( CLEAR ?auto_201822 ) ( ON ?auto_201820 ?auto_201817 ) ( CLEAR ?auto_201820 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_201818 ?auto_201815 ?auto_201816 ?auto_201823 ?auto_201817 )
      ( MAKE-1PILE ?auto_201815 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_201824 - BLOCK
    )
    :vars
    (
      ?auto_201832 - BLOCK
      ?auto_201825 - BLOCK
      ?auto_201828 - BLOCK
      ?auto_201826 - BLOCK
      ?auto_201829 - BLOCK
      ?auto_201830 - BLOCK
      ?auto_201831 - BLOCK
      ?auto_201827 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_201824 ?auto_201832 ) ) ( ON-TABLE ?auto_201825 ) ( ON ?auto_201828 ?auto_201825 ) ( not ( = ?auto_201825 ?auto_201828 ) ) ( not ( = ?auto_201825 ?auto_201826 ) ) ( not ( = ?auto_201825 ?auto_201829 ) ) ( not ( = ?auto_201825 ?auto_201830 ) ) ( not ( = ?auto_201825 ?auto_201831 ) ) ( not ( = ?auto_201825 ?auto_201832 ) ) ( not ( = ?auto_201825 ?auto_201824 ) ) ( not ( = ?auto_201828 ?auto_201826 ) ) ( not ( = ?auto_201828 ?auto_201829 ) ) ( not ( = ?auto_201828 ?auto_201830 ) ) ( not ( = ?auto_201828 ?auto_201831 ) ) ( not ( = ?auto_201828 ?auto_201832 ) ) ( not ( = ?auto_201828 ?auto_201824 ) ) ( not ( = ?auto_201826 ?auto_201829 ) ) ( not ( = ?auto_201826 ?auto_201830 ) ) ( not ( = ?auto_201826 ?auto_201831 ) ) ( not ( = ?auto_201826 ?auto_201832 ) ) ( not ( = ?auto_201826 ?auto_201824 ) ) ( not ( = ?auto_201829 ?auto_201830 ) ) ( not ( = ?auto_201829 ?auto_201831 ) ) ( not ( = ?auto_201829 ?auto_201832 ) ) ( not ( = ?auto_201829 ?auto_201824 ) ) ( not ( = ?auto_201830 ?auto_201831 ) ) ( not ( = ?auto_201830 ?auto_201832 ) ) ( not ( = ?auto_201830 ?auto_201824 ) ) ( not ( = ?auto_201831 ?auto_201832 ) ) ( not ( = ?auto_201831 ?auto_201824 ) ) ( ON ?auto_201824 ?auto_201827 ) ( not ( = ?auto_201824 ?auto_201827 ) ) ( not ( = ?auto_201832 ?auto_201827 ) ) ( not ( = ?auto_201825 ?auto_201827 ) ) ( not ( = ?auto_201828 ?auto_201827 ) ) ( not ( = ?auto_201826 ?auto_201827 ) ) ( not ( = ?auto_201829 ?auto_201827 ) ) ( not ( = ?auto_201830 ?auto_201827 ) ) ( not ( = ?auto_201831 ?auto_201827 ) ) ( ON ?auto_201832 ?auto_201824 ) ( ON-TABLE ?auto_201827 ) ( ON ?auto_201831 ?auto_201832 ) ( ON ?auto_201830 ?auto_201831 ) ( ON ?auto_201829 ?auto_201830 ) ( CLEAR ?auto_201829 ) ( HOLDING ?auto_201826 ) ( CLEAR ?auto_201828 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_201825 ?auto_201828 ?auto_201826 )
      ( MAKE-1PILE ?auto_201824 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_201833 - BLOCK
    )
    :vars
    (
      ?auto_201837 - BLOCK
      ?auto_201838 - BLOCK
      ?auto_201839 - BLOCK
      ?auto_201835 - BLOCK
      ?auto_201841 - BLOCK
      ?auto_201834 - BLOCK
      ?auto_201836 - BLOCK
      ?auto_201840 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_201833 ?auto_201837 ) ) ( ON-TABLE ?auto_201838 ) ( ON ?auto_201839 ?auto_201838 ) ( not ( = ?auto_201838 ?auto_201839 ) ) ( not ( = ?auto_201838 ?auto_201835 ) ) ( not ( = ?auto_201838 ?auto_201841 ) ) ( not ( = ?auto_201838 ?auto_201834 ) ) ( not ( = ?auto_201838 ?auto_201836 ) ) ( not ( = ?auto_201838 ?auto_201837 ) ) ( not ( = ?auto_201838 ?auto_201833 ) ) ( not ( = ?auto_201839 ?auto_201835 ) ) ( not ( = ?auto_201839 ?auto_201841 ) ) ( not ( = ?auto_201839 ?auto_201834 ) ) ( not ( = ?auto_201839 ?auto_201836 ) ) ( not ( = ?auto_201839 ?auto_201837 ) ) ( not ( = ?auto_201839 ?auto_201833 ) ) ( not ( = ?auto_201835 ?auto_201841 ) ) ( not ( = ?auto_201835 ?auto_201834 ) ) ( not ( = ?auto_201835 ?auto_201836 ) ) ( not ( = ?auto_201835 ?auto_201837 ) ) ( not ( = ?auto_201835 ?auto_201833 ) ) ( not ( = ?auto_201841 ?auto_201834 ) ) ( not ( = ?auto_201841 ?auto_201836 ) ) ( not ( = ?auto_201841 ?auto_201837 ) ) ( not ( = ?auto_201841 ?auto_201833 ) ) ( not ( = ?auto_201834 ?auto_201836 ) ) ( not ( = ?auto_201834 ?auto_201837 ) ) ( not ( = ?auto_201834 ?auto_201833 ) ) ( not ( = ?auto_201836 ?auto_201837 ) ) ( not ( = ?auto_201836 ?auto_201833 ) ) ( ON ?auto_201833 ?auto_201840 ) ( not ( = ?auto_201833 ?auto_201840 ) ) ( not ( = ?auto_201837 ?auto_201840 ) ) ( not ( = ?auto_201838 ?auto_201840 ) ) ( not ( = ?auto_201839 ?auto_201840 ) ) ( not ( = ?auto_201835 ?auto_201840 ) ) ( not ( = ?auto_201841 ?auto_201840 ) ) ( not ( = ?auto_201834 ?auto_201840 ) ) ( not ( = ?auto_201836 ?auto_201840 ) ) ( ON ?auto_201837 ?auto_201833 ) ( ON-TABLE ?auto_201840 ) ( ON ?auto_201836 ?auto_201837 ) ( ON ?auto_201834 ?auto_201836 ) ( ON ?auto_201841 ?auto_201834 ) ( CLEAR ?auto_201839 ) ( ON ?auto_201835 ?auto_201841 ) ( CLEAR ?auto_201835 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_201840 ?auto_201833 ?auto_201837 ?auto_201836 ?auto_201834 ?auto_201841 )
      ( MAKE-1PILE ?auto_201833 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_201842 - BLOCK
    )
    :vars
    (
      ?auto_201849 - BLOCK
      ?auto_201846 - BLOCK
      ?auto_201850 - BLOCK
      ?auto_201848 - BLOCK
      ?auto_201844 - BLOCK
      ?auto_201845 - BLOCK
      ?auto_201847 - BLOCK
      ?auto_201843 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_201842 ?auto_201849 ) ) ( ON-TABLE ?auto_201846 ) ( not ( = ?auto_201846 ?auto_201850 ) ) ( not ( = ?auto_201846 ?auto_201848 ) ) ( not ( = ?auto_201846 ?auto_201844 ) ) ( not ( = ?auto_201846 ?auto_201845 ) ) ( not ( = ?auto_201846 ?auto_201847 ) ) ( not ( = ?auto_201846 ?auto_201849 ) ) ( not ( = ?auto_201846 ?auto_201842 ) ) ( not ( = ?auto_201850 ?auto_201848 ) ) ( not ( = ?auto_201850 ?auto_201844 ) ) ( not ( = ?auto_201850 ?auto_201845 ) ) ( not ( = ?auto_201850 ?auto_201847 ) ) ( not ( = ?auto_201850 ?auto_201849 ) ) ( not ( = ?auto_201850 ?auto_201842 ) ) ( not ( = ?auto_201848 ?auto_201844 ) ) ( not ( = ?auto_201848 ?auto_201845 ) ) ( not ( = ?auto_201848 ?auto_201847 ) ) ( not ( = ?auto_201848 ?auto_201849 ) ) ( not ( = ?auto_201848 ?auto_201842 ) ) ( not ( = ?auto_201844 ?auto_201845 ) ) ( not ( = ?auto_201844 ?auto_201847 ) ) ( not ( = ?auto_201844 ?auto_201849 ) ) ( not ( = ?auto_201844 ?auto_201842 ) ) ( not ( = ?auto_201845 ?auto_201847 ) ) ( not ( = ?auto_201845 ?auto_201849 ) ) ( not ( = ?auto_201845 ?auto_201842 ) ) ( not ( = ?auto_201847 ?auto_201849 ) ) ( not ( = ?auto_201847 ?auto_201842 ) ) ( ON ?auto_201842 ?auto_201843 ) ( not ( = ?auto_201842 ?auto_201843 ) ) ( not ( = ?auto_201849 ?auto_201843 ) ) ( not ( = ?auto_201846 ?auto_201843 ) ) ( not ( = ?auto_201850 ?auto_201843 ) ) ( not ( = ?auto_201848 ?auto_201843 ) ) ( not ( = ?auto_201844 ?auto_201843 ) ) ( not ( = ?auto_201845 ?auto_201843 ) ) ( not ( = ?auto_201847 ?auto_201843 ) ) ( ON ?auto_201849 ?auto_201842 ) ( ON-TABLE ?auto_201843 ) ( ON ?auto_201847 ?auto_201849 ) ( ON ?auto_201845 ?auto_201847 ) ( ON ?auto_201844 ?auto_201845 ) ( ON ?auto_201848 ?auto_201844 ) ( CLEAR ?auto_201848 ) ( HOLDING ?auto_201850 ) ( CLEAR ?auto_201846 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_201846 ?auto_201850 )
      ( MAKE-1PILE ?auto_201842 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_201851 - BLOCK
    )
    :vars
    (
      ?auto_201858 - BLOCK
      ?auto_201856 - BLOCK
      ?auto_201854 - BLOCK
      ?auto_201859 - BLOCK
      ?auto_201857 - BLOCK
      ?auto_201852 - BLOCK
      ?auto_201855 - BLOCK
      ?auto_201853 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_201851 ?auto_201858 ) ) ( ON-TABLE ?auto_201856 ) ( not ( = ?auto_201856 ?auto_201854 ) ) ( not ( = ?auto_201856 ?auto_201859 ) ) ( not ( = ?auto_201856 ?auto_201857 ) ) ( not ( = ?auto_201856 ?auto_201852 ) ) ( not ( = ?auto_201856 ?auto_201855 ) ) ( not ( = ?auto_201856 ?auto_201858 ) ) ( not ( = ?auto_201856 ?auto_201851 ) ) ( not ( = ?auto_201854 ?auto_201859 ) ) ( not ( = ?auto_201854 ?auto_201857 ) ) ( not ( = ?auto_201854 ?auto_201852 ) ) ( not ( = ?auto_201854 ?auto_201855 ) ) ( not ( = ?auto_201854 ?auto_201858 ) ) ( not ( = ?auto_201854 ?auto_201851 ) ) ( not ( = ?auto_201859 ?auto_201857 ) ) ( not ( = ?auto_201859 ?auto_201852 ) ) ( not ( = ?auto_201859 ?auto_201855 ) ) ( not ( = ?auto_201859 ?auto_201858 ) ) ( not ( = ?auto_201859 ?auto_201851 ) ) ( not ( = ?auto_201857 ?auto_201852 ) ) ( not ( = ?auto_201857 ?auto_201855 ) ) ( not ( = ?auto_201857 ?auto_201858 ) ) ( not ( = ?auto_201857 ?auto_201851 ) ) ( not ( = ?auto_201852 ?auto_201855 ) ) ( not ( = ?auto_201852 ?auto_201858 ) ) ( not ( = ?auto_201852 ?auto_201851 ) ) ( not ( = ?auto_201855 ?auto_201858 ) ) ( not ( = ?auto_201855 ?auto_201851 ) ) ( ON ?auto_201851 ?auto_201853 ) ( not ( = ?auto_201851 ?auto_201853 ) ) ( not ( = ?auto_201858 ?auto_201853 ) ) ( not ( = ?auto_201856 ?auto_201853 ) ) ( not ( = ?auto_201854 ?auto_201853 ) ) ( not ( = ?auto_201859 ?auto_201853 ) ) ( not ( = ?auto_201857 ?auto_201853 ) ) ( not ( = ?auto_201852 ?auto_201853 ) ) ( not ( = ?auto_201855 ?auto_201853 ) ) ( ON ?auto_201858 ?auto_201851 ) ( ON-TABLE ?auto_201853 ) ( ON ?auto_201855 ?auto_201858 ) ( ON ?auto_201852 ?auto_201855 ) ( ON ?auto_201857 ?auto_201852 ) ( ON ?auto_201859 ?auto_201857 ) ( CLEAR ?auto_201856 ) ( ON ?auto_201854 ?auto_201859 ) ( CLEAR ?auto_201854 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_201853 ?auto_201851 ?auto_201858 ?auto_201855 ?auto_201852 ?auto_201857 ?auto_201859 )
      ( MAKE-1PILE ?auto_201851 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_201860 - BLOCK
    )
    :vars
    (
      ?auto_201867 - BLOCK
      ?auto_201866 - BLOCK
      ?auto_201861 - BLOCK
      ?auto_201868 - BLOCK
      ?auto_201865 - BLOCK
      ?auto_201864 - BLOCK
      ?auto_201862 - BLOCK
      ?auto_201863 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_201860 ?auto_201867 ) ) ( not ( = ?auto_201866 ?auto_201861 ) ) ( not ( = ?auto_201866 ?auto_201868 ) ) ( not ( = ?auto_201866 ?auto_201865 ) ) ( not ( = ?auto_201866 ?auto_201864 ) ) ( not ( = ?auto_201866 ?auto_201862 ) ) ( not ( = ?auto_201866 ?auto_201867 ) ) ( not ( = ?auto_201866 ?auto_201860 ) ) ( not ( = ?auto_201861 ?auto_201868 ) ) ( not ( = ?auto_201861 ?auto_201865 ) ) ( not ( = ?auto_201861 ?auto_201864 ) ) ( not ( = ?auto_201861 ?auto_201862 ) ) ( not ( = ?auto_201861 ?auto_201867 ) ) ( not ( = ?auto_201861 ?auto_201860 ) ) ( not ( = ?auto_201868 ?auto_201865 ) ) ( not ( = ?auto_201868 ?auto_201864 ) ) ( not ( = ?auto_201868 ?auto_201862 ) ) ( not ( = ?auto_201868 ?auto_201867 ) ) ( not ( = ?auto_201868 ?auto_201860 ) ) ( not ( = ?auto_201865 ?auto_201864 ) ) ( not ( = ?auto_201865 ?auto_201862 ) ) ( not ( = ?auto_201865 ?auto_201867 ) ) ( not ( = ?auto_201865 ?auto_201860 ) ) ( not ( = ?auto_201864 ?auto_201862 ) ) ( not ( = ?auto_201864 ?auto_201867 ) ) ( not ( = ?auto_201864 ?auto_201860 ) ) ( not ( = ?auto_201862 ?auto_201867 ) ) ( not ( = ?auto_201862 ?auto_201860 ) ) ( ON ?auto_201860 ?auto_201863 ) ( not ( = ?auto_201860 ?auto_201863 ) ) ( not ( = ?auto_201867 ?auto_201863 ) ) ( not ( = ?auto_201866 ?auto_201863 ) ) ( not ( = ?auto_201861 ?auto_201863 ) ) ( not ( = ?auto_201868 ?auto_201863 ) ) ( not ( = ?auto_201865 ?auto_201863 ) ) ( not ( = ?auto_201864 ?auto_201863 ) ) ( not ( = ?auto_201862 ?auto_201863 ) ) ( ON ?auto_201867 ?auto_201860 ) ( ON-TABLE ?auto_201863 ) ( ON ?auto_201862 ?auto_201867 ) ( ON ?auto_201864 ?auto_201862 ) ( ON ?auto_201865 ?auto_201864 ) ( ON ?auto_201868 ?auto_201865 ) ( ON ?auto_201861 ?auto_201868 ) ( CLEAR ?auto_201861 ) ( HOLDING ?auto_201866 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_201866 )
      ( MAKE-1PILE ?auto_201860 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_201869 - BLOCK
    )
    :vars
    (
      ?auto_201873 - BLOCK
      ?auto_201877 - BLOCK
      ?auto_201870 - BLOCK
      ?auto_201874 - BLOCK
      ?auto_201875 - BLOCK
      ?auto_201872 - BLOCK
      ?auto_201876 - BLOCK
      ?auto_201871 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_201869 ?auto_201873 ) ) ( not ( = ?auto_201877 ?auto_201870 ) ) ( not ( = ?auto_201877 ?auto_201874 ) ) ( not ( = ?auto_201877 ?auto_201875 ) ) ( not ( = ?auto_201877 ?auto_201872 ) ) ( not ( = ?auto_201877 ?auto_201876 ) ) ( not ( = ?auto_201877 ?auto_201873 ) ) ( not ( = ?auto_201877 ?auto_201869 ) ) ( not ( = ?auto_201870 ?auto_201874 ) ) ( not ( = ?auto_201870 ?auto_201875 ) ) ( not ( = ?auto_201870 ?auto_201872 ) ) ( not ( = ?auto_201870 ?auto_201876 ) ) ( not ( = ?auto_201870 ?auto_201873 ) ) ( not ( = ?auto_201870 ?auto_201869 ) ) ( not ( = ?auto_201874 ?auto_201875 ) ) ( not ( = ?auto_201874 ?auto_201872 ) ) ( not ( = ?auto_201874 ?auto_201876 ) ) ( not ( = ?auto_201874 ?auto_201873 ) ) ( not ( = ?auto_201874 ?auto_201869 ) ) ( not ( = ?auto_201875 ?auto_201872 ) ) ( not ( = ?auto_201875 ?auto_201876 ) ) ( not ( = ?auto_201875 ?auto_201873 ) ) ( not ( = ?auto_201875 ?auto_201869 ) ) ( not ( = ?auto_201872 ?auto_201876 ) ) ( not ( = ?auto_201872 ?auto_201873 ) ) ( not ( = ?auto_201872 ?auto_201869 ) ) ( not ( = ?auto_201876 ?auto_201873 ) ) ( not ( = ?auto_201876 ?auto_201869 ) ) ( ON ?auto_201869 ?auto_201871 ) ( not ( = ?auto_201869 ?auto_201871 ) ) ( not ( = ?auto_201873 ?auto_201871 ) ) ( not ( = ?auto_201877 ?auto_201871 ) ) ( not ( = ?auto_201870 ?auto_201871 ) ) ( not ( = ?auto_201874 ?auto_201871 ) ) ( not ( = ?auto_201875 ?auto_201871 ) ) ( not ( = ?auto_201872 ?auto_201871 ) ) ( not ( = ?auto_201876 ?auto_201871 ) ) ( ON ?auto_201873 ?auto_201869 ) ( ON-TABLE ?auto_201871 ) ( ON ?auto_201876 ?auto_201873 ) ( ON ?auto_201872 ?auto_201876 ) ( ON ?auto_201875 ?auto_201872 ) ( ON ?auto_201874 ?auto_201875 ) ( ON ?auto_201870 ?auto_201874 ) ( ON ?auto_201877 ?auto_201870 ) ( CLEAR ?auto_201877 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_201871 ?auto_201869 ?auto_201873 ?auto_201876 ?auto_201872 ?auto_201875 ?auto_201874 ?auto_201870 )
      ( MAKE-1PILE ?auto_201869 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_201884 - BLOCK
      ?auto_201885 - BLOCK
      ?auto_201886 - BLOCK
      ?auto_201887 - BLOCK
      ?auto_201888 - BLOCK
      ?auto_201889 - BLOCK
    )
    :vars
    (
      ?auto_201890 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_201890 ?auto_201889 ) ( CLEAR ?auto_201890 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_201884 ) ( ON ?auto_201885 ?auto_201884 ) ( ON ?auto_201886 ?auto_201885 ) ( ON ?auto_201887 ?auto_201886 ) ( ON ?auto_201888 ?auto_201887 ) ( ON ?auto_201889 ?auto_201888 ) ( not ( = ?auto_201884 ?auto_201885 ) ) ( not ( = ?auto_201884 ?auto_201886 ) ) ( not ( = ?auto_201884 ?auto_201887 ) ) ( not ( = ?auto_201884 ?auto_201888 ) ) ( not ( = ?auto_201884 ?auto_201889 ) ) ( not ( = ?auto_201884 ?auto_201890 ) ) ( not ( = ?auto_201885 ?auto_201886 ) ) ( not ( = ?auto_201885 ?auto_201887 ) ) ( not ( = ?auto_201885 ?auto_201888 ) ) ( not ( = ?auto_201885 ?auto_201889 ) ) ( not ( = ?auto_201885 ?auto_201890 ) ) ( not ( = ?auto_201886 ?auto_201887 ) ) ( not ( = ?auto_201886 ?auto_201888 ) ) ( not ( = ?auto_201886 ?auto_201889 ) ) ( not ( = ?auto_201886 ?auto_201890 ) ) ( not ( = ?auto_201887 ?auto_201888 ) ) ( not ( = ?auto_201887 ?auto_201889 ) ) ( not ( = ?auto_201887 ?auto_201890 ) ) ( not ( = ?auto_201888 ?auto_201889 ) ) ( not ( = ?auto_201888 ?auto_201890 ) ) ( not ( = ?auto_201889 ?auto_201890 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_201890 ?auto_201889 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_201891 - BLOCK
      ?auto_201892 - BLOCK
      ?auto_201893 - BLOCK
      ?auto_201894 - BLOCK
      ?auto_201895 - BLOCK
      ?auto_201896 - BLOCK
    )
    :vars
    (
      ?auto_201897 - BLOCK
      ?auto_201898 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_201897 ?auto_201896 ) ( CLEAR ?auto_201897 ) ( ON-TABLE ?auto_201891 ) ( ON ?auto_201892 ?auto_201891 ) ( ON ?auto_201893 ?auto_201892 ) ( ON ?auto_201894 ?auto_201893 ) ( ON ?auto_201895 ?auto_201894 ) ( ON ?auto_201896 ?auto_201895 ) ( not ( = ?auto_201891 ?auto_201892 ) ) ( not ( = ?auto_201891 ?auto_201893 ) ) ( not ( = ?auto_201891 ?auto_201894 ) ) ( not ( = ?auto_201891 ?auto_201895 ) ) ( not ( = ?auto_201891 ?auto_201896 ) ) ( not ( = ?auto_201891 ?auto_201897 ) ) ( not ( = ?auto_201892 ?auto_201893 ) ) ( not ( = ?auto_201892 ?auto_201894 ) ) ( not ( = ?auto_201892 ?auto_201895 ) ) ( not ( = ?auto_201892 ?auto_201896 ) ) ( not ( = ?auto_201892 ?auto_201897 ) ) ( not ( = ?auto_201893 ?auto_201894 ) ) ( not ( = ?auto_201893 ?auto_201895 ) ) ( not ( = ?auto_201893 ?auto_201896 ) ) ( not ( = ?auto_201893 ?auto_201897 ) ) ( not ( = ?auto_201894 ?auto_201895 ) ) ( not ( = ?auto_201894 ?auto_201896 ) ) ( not ( = ?auto_201894 ?auto_201897 ) ) ( not ( = ?auto_201895 ?auto_201896 ) ) ( not ( = ?auto_201895 ?auto_201897 ) ) ( not ( = ?auto_201896 ?auto_201897 ) ) ( HOLDING ?auto_201898 ) ( not ( = ?auto_201891 ?auto_201898 ) ) ( not ( = ?auto_201892 ?auto_201898 ) ) ( not ( = ?auto_201893 ?auto_201898 ) ) ( not ( = ?auto_201894 ?auto_201898 ) ) ( not ( = ?auto_201895 ?auto_201898 ) ) ( not ( = ?auto_201896 ?auto_201898 ) ) ( not ( = ?auto_201897 ?auto_201898 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_201898 )
      ( MAKE-6PILE ?auto_201891 ?auto_201892 ?auto_201893 ?auto_201894 ?auto_201895 ?auto_201896 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_201899 - BLOCK
      ?auto_201900 - BLOCK
      ?auto_201901 - BLOCK
      ?auto_201902 - BLOCK
      ?auto_201903 - BLOCK
      ?auto_201904 - BLOCK
    )
    :vars
    (
      ?auto_201906 - BLOCK
      ?auto_201905 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_201906 ?auto_201904 ) ( ON-TABLE ?auto_201899 ) ( ON ?auto_201900 ?auto_201899 ) ( ON ?auto_201901 ?auto_201900 ) ( ON ?auto_201902 ?auto_201901 ) ( ON ?auto_201903 ?auto_201902 ) ( ON ?auto_201904 ?auto_201903 ) ( not ( = ?auto_201899 ?auto_201900 ) ) ( not ( = ?auto_201899 ?auto_201901 ) ) ( not ( = ?auto_201899 ?auto_201902 ) ) ( not ( = ?auto_201899 ?auto_201903 ) ) ( not ( = ?auto_201899 ?auto_201904 ) ) ( not ( = ?auto_201899 ?auto_201906 ) ) ( not ( = ?auto_201900 ?auto_201901 ) ) ( not ( = ?auto_201900 ?auto_201902 ) ) ( not ( = ?auto_201900 ?auto_201903 ) ) ( not ( = ?auto_201900 ?auto_201904 ) ) ( not ( = ?auto_201900 ?auto_201906 ) ) ( not ( = ?auto_201901 ?auto_201902 ) ) ( not ( = ?auto_201901 ?auto_201903 ) ) ( not ( = ?auto_201901 ?auto_201904 ) ) ( not ( = ?auto_201901 ?auto_201906 ) ) ( not ( = ?auto_201902 ?auto_201903 ) ) ( not ( = ?auto_201902 ?auto_201904 ) ) ( not ( = ?auto_201902 ?auto_201906 ) ) ( not ( = ?auto_201903 ?auto_201904 ) ) ( not ( = ?auto_201903 ?auto_201906 ) ) ( not ( = ?auto_201904 ?auto_201906 ) ) ( not ( = ?auto_201899 ?auto_201905 ) ) ( not ( = ?auto_201900 ?auto_201905 ) ) ( not ( = ?auto_201901 ?auto_201905 ) ) ( not ( = ?auto_201902 ?auto_201905 ) ) ( not ( = ?auto_201903 ?auto_201905 ) ) ( not ( = ?auto_201904 ?auto_201905 ) ) ( not ( = ?auto_201906 ?auto_201905 ) ) ( ON ?auto_201905 ?auto_201906 ) ( CLEAR ?auto_201905 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_201899 ?auto_201900 ?auto_201901 ?auto_201902 ?auto_201903 ?auto_201904 ?auto_201906 )
      ( MAKE-6PILE ?auto_201899 ?auto_201900 ?auto_201901 ?auto_201902 ?auto_201903 ?auto_201904 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_201907 - BLOCK
      ?auto_201908 - BLOCK
      ?auto_201909 - BLOCK
      ?auto_201910 - BLOCK
      ?auto_201911 - BLOCK
      ?auto_201912 - BLOCK
    )
    :vars
    (
      ?auto_201913 - BLOCK
      ?auto_201914 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_201913 ?auto_201912 ) ( ON-TABLE ?auto_201907 ) ( ON ?auto_201908 ?auto_201907 ) ( ON ?auto_201909 ?auto_201908 ) ( ON ?auto_201910 ?auto_201909 ) ( ON ?auto_201911 ?auto_201910 ) ( ON ?auto_201912 ?auto_201911 ) ( not ( = ?auto_201907 ?auto_201908 ) ) ( not ( = ?auto_201907 ?auto_201909 ) ) ( not ( = ?auto_201907 ?auto_201910 ) ) ( not ( = ?auto_201907 ?auto_201911 ) ) ( not ( = ?auto_201907 ?auto_201912 ) ) ( not ( = ?auto_201907 ?auto_201913 ) ) ( not ( = ?auto_201908 ?auto_201909 ) ) ( not ( = ?auto_201908 ?auto_201910 ) ) ( not ( = ?auto_201908 ?auto_201911 ) ) ( not ( = ?auto_201908 ?auto_201912 ) ) ( not ( = ?auto_201908 ?auto_201913 ) ) ( not ( = ?auto_201909 ?auto_201910 ) ) ( not ( = ?auto_201909 ?auto_201911 ) ) ( not ( = ?auto_201909 ?auto_201912 ) ) ( not ( = ?auto_201909 ?auto_201913 ) ) ( not ( = ?auto_201910 ?auto_201911 ) ) ( not ( = ?auto_201910 ?auto_201912 ) ) ( not ( = ?auto_201910 ?auto_201913 ) ) ( not ( = ?auto_201911 ?auto_201912 ) ) ( not ( = ?auto_201911 ?auto_201913 ) ) ( not ( = ?auto_201912 ?auto_201913 ) ) ( not ( = ?auto_201907 ?auto_201914 ) ) ( not ( = ?auto_201908 ?auto_201914 ) ) ( not ( = ?auto_201909 ?auto_201914 ) ) ( not ( = ?auto_201910 ?auto_201914 ) ) ( not ( = ?auto_201911 ?auto_201914 ) ) ( not ( = ?auto_201912 ?auto_201914 ) ) ( not ( = ?auto_201913 ?auto_201914 ) ) ( HOLDING ?auto_201914 ) ( CLEAR ?auto_201913 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_201907 ?auto_201908 ?auto_201909 ?auto_201910 ?auto_201911 ?auto_201912 ?auto_201913 ?auto_201914 )
      ( MAKE-6PILE ?auto_201907 ?auto_201908 ?auto_201909 ?auto_201910 ?auto_201911 ?auto_201912 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_201915 - BLOCK
      ?auto_201916 - BLOCK
      ?auto_201917 - BLOCK
      ?auto_201918 - BLOCK
      ?auto_201919 - BLOCK
      ?auto_201920 - BLOCK
    )
    :vars
    (
      ?auto_201922 - BLOCK
      ?auto_201921 - BLOCK
      ?auto_201923 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_201922 ?auto_201920 ) ( ON-TABLE ?auto_201915 ) ( ON ?auto_201916 ?auto_201915 ) ( ON ?auto_201917 ?auto_201916 ) ( ON ?auto_201918 ?auto_201917 ) ( ON ?auto_201919 ?auto_201918 ) ( ON ?auto_201920 ?auto_201919 ) ( not ( = ?auto_201915 ?auto_201916 ) ) ( not ( = ?auto_201915 ?auto_201917 ) ) ( not ( = ?auto_201915 ?auto_201918 ) ) ( not ( = ?auto_201915 ?auto_201919 ) ) ( not ( = ?auto_201915 ?auto_201920 ) ) ( not ( = ?auto_201915 ?auto_201922 ) ) ( not ( = ?auto_201916 ?auto_201917 ) ) ( not ( = ?auto_201916 ?auto_201918 ) ) ( not ( = ?auto_201916 ?auto_201919 ) ) ( not ( = ?auto_201916 ?auto_201920 ) ) ( not ( = ?auto_201916 ?auto_201922 ) ) ( not ( = ?auto_201917 ?auto_201918 ) ) ( not ( = ?auto_201917 ?auto_201919 ) ) ( not ( = ?auto_201917 ?auto_201920 ) ) ( not ( = ?auto_201917 ?auto_201922 ) ) ( not ( = ?auto_201918 ?auto_201919 ) ) ( not ( = ?auto_201918 ?auto_201920 ) ) ( not ( = ?auto_201918 ?auto_201922 ) ) ( not ( = ?auto_201919 ?auto_201920 ) ) ( not ( = ?auto_201919 ?auto_201922 ) ) ( not ( = ?auto_201920 ?auto_201922 ) ) ( not ( = ?auto_201915 ?auto_201921 ) ) ( not ( = ?auto_201916 ?auto_201921 ) ) ( not ( = ?auto_201917 ?auto_201921 ) ) ( not ( = ?auto_201918 ?auto_201921 ) ) ( not ( = ?auto_201919 ?auto_201921 ) ) ( not ( = ?auto_201920 ?auto_201921 ) ) ( not ( = ?auto_201922 ?auto_201921 ) ) ( CLEAR ?auto_201922 ) ( ON ?auto_201921 ?auto_201923 ) ( CLEAR ?auto_201921 ) ( HAND-EMPTY ) ( not ( = ?auto_201915 ?auto_201923 ) ) ( not ( = ?auto_201916 ?auto_201923 ) ) ( not ( = ?auto_201917 ?auto_201923 ) ) ( not ( = ?auto_201918 ?auto_201923 ) ) ( not ( = ?auto_201919 ?auto_201923 ) ) ( not ( = ?auto_201920 ?auto_201923 ) ) ( not ( = ?auto_201922 ?auto_201923 ) ) ( not ( = ?auto_201921 ?auto_201923 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_201921 ?auto_201923 )
      ( MAKE-6PILE ?auto_201915 ?auto_201916 ?auto_201917 ?auto_201918 ?auto_201919 ?auto_201920 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_201942 - BLOCK
      ?auto_201943 - BLOCK
      ?auto_201944 - BLOCK
      ?auto_201945 - BLOCK
      ?auto_201946 - BLOCK
      ?auto_201947 - BLOCK
    )
    :vars
    (
      ?auto_201948 - BLOCK
      ?auto_201950 - BLOCK
      ?auto_201949 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_201942 ) ( ON ?auto_201943 ?auto_201942 ) ( ON ?auto_201944 ?auto_201943 ) ( ON ?auto_201945 ?auto_201944 ) ( ON ?auto_201946 ?auto_201945 ) ( not ( = ?auto_201942 ?auto_201943 ) ) ( not ( = ?auto_201942 ?auto_201944 ) ) ( not ( = ?auto_201942 ?auto_201945 ) ) ( not ( = ?auto_201942 ?auto_201946 ) ) ( not ( = ?auto_201942 ?auto_201947 ) ) ( not ( = ?auto_201942 ?auto_201948 ) ) ( not ( = ?auto_201943 ?auto_201944 ) ) ( not ( = ?auto_201943 ?auto_201945 ) ) ( not ( = ?auto_201943 ?auto_201946 ) ) ( not ( = ?auto_201943 ?auto_201947 ) ) ( not ( = ?auto_201943 ?auto_201948 ) ) ( not ( = ?auto_201944 ?auto_201945 ) ) ( not ( = ?auto_201944 ?auto_201946 ) ) ( not ( = ?auto_201944 ?auto_201947 ) ) ( not ( = ?auto_201944 ?auto_201948 ) ) ( not ( = ?auto_201945 ?auto_201946 ) ) ( not ( = ?auto_201945 ?auto_201947 ) ) ( not ( = ?auto_201945 ?auto_201948 ) ) ( not ( = ?auto_201946 ?auto_201947 ) ) ( not ( = ?auto_201946 ?auto_201948 ) ) ( not ( = ?auto_201947 ?auto_201948 ) ) ( not ( = ?auto_201942 ?auto_201950 ) ) ( not ( = ?auto_201943 ?auto_201950 ) ) ( not ( = ?auto_201944 ?auto_201950 ) ) ( not ( = ?auto_201945 ?auto_201950 ) ) ( not ( = ?auto_201946 ?auto_201950 ) ) ( not ( = ?auto_201947 ?auto_201950 ) ) ( not ( = ?auto_201948 ?auto_201950 ) ) ( ON ?auto_201950 ?auto_201949 ) ( not ( = ?auto_201942 ?auto_201949 ) ) ( not ( = ?auto_201943 ?auto_201949 ) ) ( not ( = ?auto_201944 ?auto_201949 ) ) ( not ( = ?auto_201945 ?auto_201949 ) ) ( not ( = ?auto_201946 ?auto_201949 ) ) ( not ( = ?auto_201947 ?auto_201949 ) ) ( not ( = ?auto_201948 ?auto_201949 ) ) ( not ( = ?auto_201950 ?auto_201949 ) ) ( ON ?auto_201948 ?auto_201950 ) ( CLEAR ?auto_201948 ) ( HOLDING ?auto_201947 ) ( CLEAR ?auto_201946 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_201942 ?auto_201943 ?auto_201944 ?auto_201945 ?auto_201946 ?auto_201947 ?auto_201948 )
      ( MAKE-6PILE ?auto_201942 ?auto_201943 ?auto_201944 ?auto_201945 ?auto_201946 ?auto_201947 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_201951 - BLOCK
      ?auto_201952 - BLOCK
      ?auto_201953 - BLOCK
      ?auto_201954 - BLOCK
      ?auto_201955 - BLOCK
      ?auto_201956 - BLOCK
    )
    :vars
    (
      ?auto_201957 - BLOCK
      ?auto_201958 - BLOCK
      ?auto_201959 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_201951 ) ( ON ?auto_201952 ?auto_201951 ) ( ON ?auto_201953 ?auto_201952 ) ( ON ?auto_201954 ?auto_201953 ) ( ON ?auto_201955 ?auto_201954 ) ( not ( = ?auto_201951 ?auto_201952 ) ) ( not ( = ?auto_201951 ?auto_201953 ) ) ( not ( = ?auto_201951 ?auto_201954 ) ) ( not ( = ?auto_201951 ?auto_201955 ) ) ( not ( = ?auto_201951 ?auto_201956 ) ) ( not ( = ?auto_201951 ?auto_201957 ) ) ( not ( = ?auto_201952 ?auto_201953 ) ) ( not ( = ?auto_201952 ?auto_201954 ) ) ( not ( = ?auto_201952 ?auto_201955 ) ) ( not ( = ?auto_201952 ?auto_201956 ) ) ( not ( = ?auto_201952 ?auto_201957 ) ) ( not ( = ?auto_201953 ?auto_201954 ) ) ( not ( = ?auto_201953 ?auto_201955 ) ) ( not ( = ?auto_201953 ?auto_201956 ) ) ( not ( = ?auto_201953 ?auto_201957 ) ) ( not ( = ?auto_201954 ?auto_201955 ) ) ( not ( = ?auto_201954 ?auto_201956 ) ) ( not ( = ?auto_201954 ?auto_201957 ) ) ( not ( = ?auto_201955 ?auto_201956 ) ) ( not ( = ?auto_201955 ?auto_201957 ) ) ( not ( = ?auto_201956 ?auto_201957 ) ) ( not ( = ?auto_201951 ?auto_201958 ) ) ( not ( = ?auto_201952 ?auto_201958 ) ) ( not ( = ?auto_201953 ?auto_201958 ) ) ( not ( = ?auto_201954 ?auto_201958 ) ) ( not ( = ?auto_201955 ?auto_201958 ) ) ( not ( = ?auto_201956 ?auto_201958 ) ) ( not ( = ?auto_201957 ?auto_201958 ) ) ( ON ?auto_201958 ?auto_201959 ) ( not ( = ?auto_201951 ?auto_201959 ) ) ( not ( = ?auto_201952 ?auto_201959 ) ) ( not ( = ?auto_201953 ?auto_201959 ) ) ( not ( = ?auto_201954 ?auto_201959 ) ) ( not ( = ?auto_201955 ?auto_201959 ) ) ( not ( = ?auto_201956 ?auto_201959 ) ) ( not ( = ?auto_201957 ?auto_201959 ) ) ( not ( = ?auto_201958 ?auto_201959 ) ) ( ON ?auto_201957 ?auto_201958 ) ( CLEAR ?auto_201955 ) ( ON ?auto_201956 ?auto_201957 ) ( CLEAR ?auto_201956 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_201959 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_201959 ?auto_201958 ?auto_201957 )
      ( MAKE-6PILE ?auto_201951 ?auto_201952 ?auto_201953 ?auto_201954 ?auto_201955 ?auto_201956 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_201960 - BLOCK
      ?auto_201961 - BLOCK
      ?auto_201962 - BLOCK
      ?auto_201963 - BLOCK
      ?auto_201964 - BLOCK
      ?auto_201965 - BLOCK
    )
    :vars
    (
      ?auto_201966 - BLOCK
      ?auto_201968 - BLOCK
      ?auto_201967 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_201960 ) ( ON ?auto_201961 ?auto_201960 ) ( ON ?auto_201962 ?auto_201961 ) ( ON ?auto_201963 ?auto_201962 ) ( not ( = ?auto_201960 ?auto_201961 ) ) ( not ( = ?auto_201960 ?auto_201962 ) ) ( not ( = ?auto_201960 ?auto_201963 ) ) ( not ( = ?auto_201960 ?auto_201964 ) ) ( not ( = ?auto_201960 ?auto_201965 ) ) ( not ( = ?auto_201960 ?auto_201966 ) ) ( not ( = ?auto_201961 ?auto_201962 ) ) ( not ( = ?auto_201961 ?auto_201963 ) ) ( not ( = ?auto_201961 ?auto_201964 ) ) ( not ( = ?auto_201961 ?auto_201965 ) ) ( not ( = ?auto_201961 ?auto_201966 ) ) ( not ( = ?auto_201962 ?auto_201963 ) ) ( not ( = ?auto_201962 ?auto_201964 ) ) ( not ( = ?auto_201962 ?auto_201965 ) ) ( not ( = ?auto_201962 ?auto_201966 ) ) ( not ( = ?auto_201963 ?auto_201964 ) ) ( not ( = ?auto_201963 ?auto_201965 ) ) ( not ( = ?auto_201963 ?auto_201966 ) ) ( not ( = ?auto_201964 ?auto_201965 ) ) ( not ( = ?auto_201964 ?auto_201966 ) ) ( not ( = ?auto_201965 ?auto_201966 ) ) ( not ( = ?auto_201960 ?auto_201968 ) ) ( not ( = ?auto_201961 ?auto_201968 ) ) ( not ( = ?auto_201962 ?auto_201968 ) ) ( not ( = ?auto_201963 ?auto_201968 ) ) ( not ( = ?auto_201964 ?auto_201968 ) ) ( not ( = ?auto_201965 ?auto_201968 ) ) ( not ( = ?auto_201966 ?auto_201968 ) ) ( ON ?auto_201968 ?auto_201967 ) ( not ( = ?auto_201960 ?auto_201967 ) ) ( not ( = ?auto_201961 ?auto_201967 ) ) ( not ( = ?auto_201962 ?auto_201967 ) ) ( not ( = ?auto_201963 ?auto_201967 ) ) ( not ( = ?auto_201964 ?auto_201967 ) ) ( not ( = ?auto_201965 ?auto_201967 ) ) ( not ( = ?auto_201966 ?auto_201967 ) ) ( not ( = ?auto_201968 ?auto_201967 ) ) ( ON ?auto_201966 ?auto_201968 ) ( ON ?auto_201965 ?auto_201966 ) ( CLEAR ?auto_201965 ) ( ON-TABLE ?auto_201967 ) ( HOLDING ?auto_201964 ) ( CLEAR ?auto_201963 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_201960 ?auto_201961 ?auto_201962 ?auto_201963 ?auto_201964 )
      ( MAKE-6PILE ?auto_201960 ?auto_201961 ?auto_201962 ?auto_201963 ?auto_201964 ?auto_201965 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_201969 - BLOCK
      ?auto_201970 - BLOCK
      ?auto_201971 - BLOCK
      ?auto_201972 - BLOCK
      ?auto_201973 - BLOCK
      ?auto_201974 - BLOCK
    )
    :vars
    (
      ?auto_201976 - BLOCK
      ?auto_201977 - BLOCK
      ?auto_201975 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_201969 ) ( ON ?auto_201970 ?auto_201969 ) ( ON ?auto_201971 ?auto_201970 ) ( ON ?auto_201972 ?auto_201971 ) ( not ( = ?auto_201969 ?auto_201970 ) ) ( not ( = ?auto_201969 ?auto_201971 ) ) ( not ( = ?auto_201969 ?auto_201972 ) ) ( not ( = ?auto_201969 ?auto_201973 ) ) ( not ( = ?auto_201969 ?auto_201974 ) ) ( not ( = ?auto_201969 ?auto_201976 ) ) ( not ( = ?auto_201970 ?auto_201971 ) ) ( not ( = ?auto_201970 ?auto_201972 ) ) ( not ( = ?auto_201970 ?auto_201973 ) ) ( not ( = ?auto_201970 ?auto_201974 ) ) ( not ( = ?auto_201970 ?auto_201976 ) ) ( not ( = ?auto_201971 ?auto_201972 ) ) ( not ( = ?auto_201971 ?auto_201973 ) ) ( not ( = ?auto_201971 ?auto_201974 ) ) ( not ( = ?auto_201971 ?auto_201976 ) ) ( not ( = ?auto_201972 ?auto_201973 ) ) ( not ( = ?auto_201972 ?auto_201974 ) ) ( not ( = ?auto_201972 ?auto_201976 ) ) ( not ( = ?auto_201973 ?auto_201974 ) ) ( not ( = ?auto_201973 ?auto_201976 ) ) ( not ( = ?auto_201974 ?auto_201976 ) ) ( not ( = ?auto_201969 ?auto_201977 ) ) ( not ( = ?auto_201970 ?auto_201977 ) ) ( not ( = ?auto_201971 ?auto_201977 ) ) ( not ( = ?auto_201972 ?auto_201977 ) ) ( not ( = ?auto_201973 ?auto_201977 ) ) ( not ( = ?auto_201974 ?auto_201977 ) ) ( not ( = ?auto_201976 ?auto_201977 ) ) ( ON ?auto_201977 ?auto_201975 ) ( not ( = ?auto_201969 ?auto_201975 ) ) ( not ( = ?auto_201970 ?auto_201975 ) ) ( not ( = ?auto_201971 ?auto_201975 ) ) ( not ( = ?auto_201972 ?auto_201975 ) ) ( not ( = ?auto_201973 ?auto_201975 ) ) ( not ( = ?auto_201974 ?auto_201975 ) ) ( not ( = ?auto_201976 ?auto_201975 ) ) ( not ( = ?auto_201977 ?auto_201975 ) ) ( ON ?auto_201976 ?auto_201977 ) ( ON ?auto_201974 ?auto_201976 ) ( ON-TABLE ?auto_201975 ) ( CLEAR ?auto_201972 ) ( ON ?auto_201973 ?auto_201974 ) ( CLEAR ?auto_201973 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_201975 ?auto_201977 ?auto_201976 ?auto_201974 )
      ( MAKE-6PILE ?auto_201969 ?auto_201970 ?auto_201971 ?auto_201972 ?auto_201973 ?auto_201974 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_201978 - BLOCK
      ?auto_201979 - BLOCK
      ?auto_201980 - BLOCK
      ?auto_201981 - BLOCK
      ?auto_201982 - BLOCK
      ?auto_201983 - BLOCK
    )
    :vars
    (
      ?auto_201984 - BLOCK
      ?auto_201986 - BLOCK
      ?auto_201985 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_201978 ) ( ON ?auto_201979 ?auto_201978 ) ( ON ?auto_201980 ?auto_201979 ) ( not ( = ?auto_201978 ?auto_201979 ) ) ( not ( = ?auto_201978 ?auto_201980 ) ) ( not ( = ?auto_201978 ?auto_201981 ) ) ( not ( = ?auto_201978 ?auto_201982 ) ) ( not ( = ?auto_201978 ?auto_201983 ) ) ( not ( = ?auto_201978 ?auto_201984 ) ) ( not ( = ?auto_201979 ?auto_201980 ) ) ( not ( = ?auto_201979 ?auto_201981 ) ) ( not ( = ?auto_201979 ?auto_201982 ) ) ( not ( = ?auto_201979 ?auto_201983 ) ) ( not ( = ?auto_201979 ?auto_201984 ) ) ( not ( = ?auto_201980 ?auto_201981 ) ) ( not ( = ?auto_201980 ?auto_201982 ) ) ( not ( = ?auto_201980 ?auto_201983 ) ) ( not ( = ?auto_201980 ?auto_201984 ) ) ( not ( = ?auto_201981 ?auto_201982 ) ) ( not ( = ?auto_201981 ?auto_201983 ) ) ( not ( = ?auto_201981 ?auto_201984 ) ) ( not ( = ?auto_201982 ?auto_201983 ) ) ( not ( = ?auto_201982 ?auto_201984 ) ) ( not ( = ?auto_201983 ?auto_201984 ) ) ( not ( = ?auto_201978 ?auto_201986 ) ) ( not ( = ?auto_201979 ?auto_201986 ) ) ( not ( = ?auto_201980 ?auto_201986 ) ) ( not ( = ?auto_201981 ?auto_201986 ) ) ( not ( = ?auto_201982 ?auto_201986 ) ) ( not ( = ?auto_201983 ?auto_201986 ) ) ( not ( = ?auto_201984 ?auto_201986 ) ) ( ON ?auto_201986 ?auto_201985 ) ( not ( = ?auto_201978 ?auto_201985 ) ) ( not ( = ?auto_201979 ?auto_201985 ) ) ( not ( = ?auto_201980 ?auto_201985 ) ) ( not ( = ?auto_201981 ?auto_201985 ) ) ( not ( = ?auto_201982 ?auto_201985 ) ) ( not ( = ?auto_201983 ?auto_201985 ) ) ( not ( = ?auto_201984 ?auto_201985 ) ) ( not ( = ?auto_201986 ?auto_201985 ) ) ( ON ?auto_201984 ?auto_201986 ) ( ON ?auto_201983 ?auto_201984 ) ( ON-TABLE ?auto_201985 ) ( ON ?auto_201982 ?auto_201983 ) ( CLEAR ?auto_201982 ) ( HOLDING ?auto_201981 ) ( CLEAR ?auto_201980 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_201978 ?auto_201979 ?auto_201980 ?auto_201981 )
      ( MAKE-6PILE ?auto_201978 ?auto_201979 ?auto_201980 ?auto_201981 ?auto_201982 ?auto_201983 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_201987 - BLOCK
      ?auto_201988 - BLOCK
      ?auto_201989 - BLOCK
      ?auto_201990 - BLOCK
      ?auto_201991 - BLOCK
      ?auto_201992 - BLOCK
    )
    :vars
    (
      ?auto_201994 - BLOCK
      ?auto_201995 - BLOCK
      ?auto_201993 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_201987 ) ( ON ?auto_201988 ?auto_201987 ) ( ON ?auto_201989 ?auto_201988 ) ( not ( = ?auto_201987 ?auto_201988 ) ) ( not ( = ?auto_201987 ?auto_201989 ) ) ( not ( = ?auto_201987 ?auto_201990 ) ) ( not ( = ?auto_201987 ?auto_201991 ) ) ( not ( = ?auto_201987 ?auto_201992 ) ) ( not ( = ?auto_201987 ?auto_201994 ) ) ( not ( = ?auto_201988 ?auto_201989 ) ) ( not ( = ?auto_201988 ?auto_201990 ) ) ( not ( = ?auto_201988 ?auto_201991 ) ) ( not ( = ?auto_201988 ?auto_201992 ) ) ( not ( = ?auto_201988 ?auto_201994 ) ) ( not ( = ?auto_201989 ?auto_201990 ) ) ( not ( = ?auto_201989 ?auto_201991 ) ) ( not ( = ?auto_201989 ?auto_201992 ) ) ( not ( = ?auto_201989 ?auto_201994 ) ) ( not ( = ?auto_201990 ?auto_201991 ) ) ( not ( = ?auto_201990 ?auto_201992 ) ) ( not ( = ?auto_201990 ?auto_201994 ) ) ( not ( = ?auto_201991 ?auto_201992 ) ) ( not ( = ?auto_201991 ?auto_201994 ) ) ( not ( = ?auto_201992 ?auto_201994 ) ) ( not ( = ?auto_201987 ?auto_201995 ) ) ( not ( = ?auto_201988 ?auto_201995 ) ) ( not ( = ?auto_201989 ?auto_201995 ) ) ( not ( = ?auto_201990 ?auto_201995 ) ) ( not ( = ?auto_201991 ?auto_201995 ) ) ( not ( = ?auto_201992 ?auto_201995 ) ) ( not ( = ?auto_201994 ?auto_201995 ) ) ( ON ?auto_201995 ?auto_201993 ) ( not ( = ?auto_201987 ?auto_201993 ) ) ( not ( = ?auto_201988 ?auto_201993 ) ) ( not ( = ?auto_201989 ?auto_201993 ) ) ( not ( = ?auto_201990 ?auto_201993 ) ) ( not ( = ?auto_201991 ?auto_201993 ) ) ( not ( = ?auto_201992 ?auto_201993 ) ) ( not ( = ?auto_201994 ?auto_201993 ) ) ( not ( = ?auto_201995 ?auto_201993 ) ) ( ON ?auto_201994 ?auto_201995 ) ( ON ?auto_201992 ?auto_201994 ) ( ON-TABLE ?auto_201993 ) ( ON ?auto_201991 ?auto_201992 ) ( CLEAR ?auto_201989 ) ( ON ?auto_201990 ?auto_201991 ) ( CLEAR ?auto_201990 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_201993 ?auto_201995 ?auto_201994 ?auto_201992 ?auto_201991 )
      ( MAKE-6PILE ?auto_201987 ?auto_201988 ?auto_201989 ?auto_201990 ?auto_201991 ?auto_201992 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_201996 - BLOCK
      ?auto_201997 - BLOCK
      ?auto_201998 - BLOCK
      ?auto_201999 - BLOCK
      ?auto_202000 - BLOCK
      ?auto_202001 - BLOCK
    )
    :vars
    (
      ?auto_202004 - BLOCK
      ?auto_202002 - BLOCK
      ?auto_202003 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_201996 ) ( ON ?auto_201997 ?auto_201996 ) ( not ( = ?auto_201996 ?auto_201997 ) ) ( not ( = ?auto_201996 ?auto_201998 ) ) ( not ( = ?auto_201996 ?auto_201999 ) ) ( not ( = ?auto_201996 ?auto_202000 ) ) ( not ( = ?auto_201996 ?auto_202001 ) ) ( not ( = ?auto_201996 ?auto_202004 ) ) ( not ( = ?auto_201997 ?auto_201998 ) ) ( not ( = ?auto_201997 ?auto_201999 ) ) ( not ( = ?auto_201997 ?auto_202000 ) ) ( not ( = ?auto_201997 ?auto_202001 ) ) ( not ( = ?auto_201997 ?auto_202004 ) ) ( not ( = ?auto_201998 ?auto_201999 ) ) ( not ( = ?auto_201998 ?auto_202000 ) ) ( not ( = ?auto_201998 ?auto_202001 ) ) ( not ( = ?auto_201998 ?auto_202004 ) ) ( not ( = ?auto_201999 ?auto_202000 ) ) ( not ( = ?auto_201999 ?auto_202001 ) ) ( not ( = ?auto_201999 ?auto_202004 ) ) ( not ( = ?auto_202000 ?auto_202001 ) ) ( not ( = ?auto_202000 ?auto_202004 ) ) ( not ( = ?auto_202001 ?auto_202004 ) ) ( not ( = ?auto_201996 ?auto_202002 ) ) ( not ( = ?auto_201997 ?auto_202002 ) ) ( not ( = ?auto_201998 ?auto_202002 ) ) ( not ( = ?auto_201999 ?auto_202002 ) ) ( not ( = ?auto_202000 ?auto_202002 ) ) ( not ( = ?auto_202001 ?auto_202002 ) ) ( not ( = ?auto_202004 ?auto_202002 ) ) ( ON ?auto_202002 ?auto_202003 ) ( not ( = ?auto_201996 ?auto_202003 ) ) ( not ( = ?auto_201997 ?auto_202003 ) ) ( not ( = ?auto_201998 ?auto_202003 ) ) ( not ( = ?auto_201999 ?auto_202003 ) ) ( not ( = ?auto_202000 ?auto_202003 ) ) ( not ( = ?auto_202001 ?auto_202003 ) ) ( not ( = ?auto_202004 ?auto_202003 ) ) ( not ( = ?auto_202002 ?auto_202003 ) ) ( ON ?auto_202004 ?auto_202002 ) ( ON ?auto_202001 ?auto_202004 ) ( ON-TABLE ?auto_202003 ) ( ON ?auto_202000 ?auto_202001 ) ( ON ?auto_201999 ?auto_202000 ) ( CLEAR ?auto_201999 ) ( HOLDING ?auto_201998 ) ( CLEAR ?auto_201997 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_201996 ?auto_201997 ?auto_201998 )
      ( MAKE-6PILE ?auto_201996 ?auto_201997 ?auto_201998 ?auto_201999 ?auto_202000 ?auto_202001 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_202005 - BLOCK
      ?auto_202006 - BLOCK
      ?auto_202007 - BLOCK
      ?auto_202008 - BLOCK
      ?auto_202009 - BLOCK
      ?auto_202010 - BLOCK
    )
    :vars
    (
      ?auto_202011 - BLOCK
      ?auto_202013 - BLOCK
      ?auto_202012 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_202005 ) ( ON ?auto_202006 ?auto_202005 ) ( not ( = ?auto_202005 ?auto_202006 ) ) ( not ( = ?auto_202005 ?auto_202007 ) ) ( not ( = ?auto_202005 ?auto_202008 ) ) ( not ( = ?auto_202005 ?auto_202009 ) ) ( not ( = ?auto_202005 ?auto_202010 ) ) ( not ( = ?auto_202005 ?auto_202011 ) ) ( not ( = ?auto_202006 ?auto_202007 ) ) ( not ( = ?auto_202006 ?auto_202008 ) ) ( not ( = ?auto_202006 ?auto_202009 ) ) ( not ( = ?auto_202006 ?auto_202010 ) ) ( not ( = ?auto_202006 ?auto_202011 ) ) ( not ( = ?auto_202007 ?auto_202008 ) ) ( not ( = ?auto_202007 ?auto_202009 ) ) ( not ( = ?auto_202007 ?auto_202010 ) ) ( not ( = ?auto_202007 ?auto_202011 ) ) ( not ( = ?auto_202008 ?auto_202009 ) ) ( not ( = ?auto_202008 ?auto_202010 ) ) ( not ( = ?auto_202008 ?auto_202011 ) ) ( not ( = ?auto_202009 ?auto_202010 ) ) ( not ( = ?auto_202009 ?auto_202011 ) ) ( not ( = ?auto_202010 ?auto_202011 ) ) ( not ( = ?auto_202005 ?auto_202013 ) ) ( not ( = ?auto_202006 ?auto_202013 ) ) ( not ( = ?auto_202007 ?auto_202013 ) ) ( not ( = ?auto_202008 ?auto_202013 ) ) ( not ( = ?auto_202009 ?auto_202013 ) ) ( not ( = ?auto_202010 ?auto_202013 ) ) ( not ( = ?auto_202011 ?auto_202013 ) ) ( ON ?auto_202013 ?auto_202012 ) ( not ( = ?auto_202005 ?auto_202012 ) ) ( not ( = ?auto_202006 ?auto_202012 ) ) ( not ( = ?auto_202007 ?auto_202012 ) ) ( not ( = ?auto_202008 ?auto_202012 ) ) ( not ( = ?auto_202009 ?auto_202012 ) ) ( not ( = ?auto_202010 ?auto_202012 ) ) ( not ( = ?auto_202011 ?auto_202012 ) ) ( not ( = ?auto_202013 ?auto_202012 ) ) ( ON ?auto_202011 ?auto_202013 ) ( ON ?auto_202010 ?auto_202011 ) ( ON-TABLE ?auto_202012 ) ( ON ?auto_202009 ?auto_202010 ) ( ON ?auto_202008 ?auto_202009 ) ( CLEAR ?auto_202006 ) ( ON ?auto_202007 ?auto_202008 ) ( CLEAR ?auto_202007 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_202012 ?auto_202013 ?auto_202011 ?auto_202010 ?auto_202009 ?auto_202008 )
      ( MAKE-6PILE ?auto_202005 ?auto_202006 ?auto_202007 ?auto_202008 ?auto_202009 ?auto_202010 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_202014 - BLOCK
      ?auto_202015 - BLOCK
      ?auto_202016 - BLOCK
      ?auto_202017 - BLOCK
      ?auto_202018 - BLOCK
      ?auto_202019 - BLOCK
    )
    :vars
    (
      ?auto_202021 - BLOCK
      ?auto_202020 - BLOCK
      ?auto_202022 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_202014 ) ( not ( = ?auto_202014 ?auto_202015 ) ) ( not ( = ?auto_202014 ?auto_202016 ) ) ( not ( = ?auto_202014 ?auto_202017 ) ) ( not ( = ?auto_202014 ?auto_202018 ) ) ( not ( = ?auto_202014 ?auto_202019 ) ) ( not ( = ?auto_202014 ?auto_202021 ) ) ( not ( = ?auto_202015 ?auto_202016 ) ) ( not ( = ?auto_202015 ?auto_202017 ) ) ( not ( = ?auto_202015 ?auto_202018 ) ) ( not ( = ?auto_202015 ?auto_202019 ) ) ( not ( = ?auto_202015 ?auto_202021 ) ) ( not ( = ?auto_202016 ?auto_202017 ) ) ( not ( = ?auto_202016 ?auto_202018 ) ) ( not ( = ?auto_202016 ?auto_202019 ) ) ( not ( = ?auto_202016 ?auto_202021 ) ) ( not ( = ?auto_202017 ?auto_202018 ) ) ( not ( = ?auto_202017 ?auto_202019 ) ) ( not ( = ?auto_202017 ?auto_202021 ) ) ( not ( = ?auto_202018 ?auto_202019 ) ) ( not ( = ?auto_202018 ?auto_202021 ) ) ( not ( = ?auto_202019 ?auto_202021 ) ) ( not ( = ?auto_202014 ?auto_202020 ) ) ( not ( = ?auto_202015 ?auto_202020 ) ) ( not ( = ?auto_202016 ?auto_202020 ) ) ( not ( = ?auto_202017 ?auto_202020 ) ) ( not ( = ?auto_202018 ?auto_202020 ) ) ( not ( = ?auto_202019 ?auto_202020 ) ) ( not ( = ?auto_202021 ?auto_202020 ) ) ( ON ?auto_202020 ?auto_202022 ) ( not ( = ?auto_202014 ?auto_202022 ) ) ( not ( = ?auto_202015 ?auto_202022 ) ) ( not ( = ?auto_202016 ?auto_202022 ) ) ( not ( = ?auto_202017 ?auto_202022 ) ) ( not ( = ?auto_202018 ?auto_202022 ) ) ( not ( = ?auto_202019 ?auto_202022 ) ) ( not ( = ?auto_202021 ?auto_202022 ) ) ( not ( = ?auto_202020 ?auto_202022 ) ) ( ON ?auto_202021 ?auto_202020 ) ( ON ?auto_202019 ?auto_202021 ) ( ON-TABLE ?auto_202022 ) ( ON ?auto_202018 ?auto_202019 ) ( ON ?auto_202017 ?auto_202018 ) ( ON ?auto_202016 ?auto_202017 ) ( CLEAR ?auto_202016 ) ( HOLDING ?auto_202015 ) ( CLEAR ?auto_202014 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_202014 ?auto_202015 )
      ( MAKE-6PILE ?auto_202014 ?auto_202015 ?auto_202016 ?auto_202017 ?auto_202018 ?auto_202019 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_202023 - BLOCK
      ?auto_202024 - BLOCK
      ?auto_202025 - BLOCK
      ?auto_202026 - BLOCK
      ?auto_202027 - BLOCK
      ?auto_202028 - BLOCK
    )
    :vars
    (
      ?auto_202030 - BLOCK
      ?auto_202031 - BLOCK
      ?auto_202029 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_202023 ) ( not ( = ?auto_202023 ?auto_202024 ) ) ( not ( = ?auto_202023 ?auto_202025 ) ) ( not ( = ?auto_202023 ?auto_202026 ) ) ( not ( = ?auto_202023 ?auto_202027 ) ) ( not ( = ?auto_202023 ?auto_202028 ) ) ( not ( = ?auto_202023 ?auto_202030 ) ) ( not ( = ?auto_202024 ?auto_202025 ) ) ( not ( = ?auto_202024 ?auto_202026 ) ) ( not ( = ?auto_202024 ?auto_202027 ) ) ( not ( = ?auto_202024 ?auto_202028 ) ) ( not ( = ?auto_202024 ?auto_202030 ) ) ( not ( = ?auto_202025 ?auto_202026 ) ) ( not ( = ?auto_202025 ?auto_202027 ) ) ( not ( = ?auto_202025 ?auto_202028 ) ) ( not ( = ?auto_202025 ?auto_202030 ) ) ( not ( = ?auto_202026 ?auto_202027 ) ) ( not ( = ?auto_202026 ?auto_202028 ) ) ( not ( = ?auto_202026 ?auto_202030 ) ) ( not ( = ?auto_202027 ?auto_202028 ) ) ( not ( = ?auto_202027 ?auto_202030 ) ) ( not ( = ?auto_202028 ?auto_202030 ) ) ( not ( = ?auto_202023 ?auto_202031 ) ) ( not ( = ?auto_202024 ?auto_202031 ) ) ( not ( = ?auto_202025 ?auto_202031 ) ) ( not ( = ?auto_202026 ?auto_202031 ) ) ( not ( = ?auto_202027 ?auto_202031 ) ) ( not ( = ?auto_202028 ?auto_202031 ) ) ( not ( = ?auto_202030 ?auto_202031 ) ) ( ON ?auto_202031 ?auto_202029 ) ( not ( = ?auto_202023 ?auto_202029 ) ) ( not ( = ?auto_202024 ?auto_202029 ) ) ( not ( = ?auto_202025 ?auto_202029 ) ) ( not ( = ?auto_202026 ?auto_202029 ) ) ( not ( = ?auto_202027 ?auto_202029 ) ) ( not ( = ?auto_202028 ?auto_202029 ) ) ( not ( = ?auto_202030 ?auto_202029 ) ) ( not ( = ?auto_202031 ?auto_202029 ) ) ( ON ?auto_202030 ?auto_202031 ) ( ON ?auto_202028 ?auto_202030 ) ( ON-TABLE ?auto_202029 ) ( ON ?auto_202027 ?auto_202028 ) ( ON ?auto_202026 ?auto_202027 ) ( ON ?auto_202025 ?auto_202026 ) ( CLEAR ?auto_202023 ) ( ON ?auto_202024 ?auto_202025 ) ( CLEAR ?auto_202024 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_202029 ?auto_202031 ?auto_202030 ?auto_202028 ?auto_202027 ?auto_202026 ?auto_202025 )
      ( MAKE-6PILE ?auto_202023 ?auto_202024 ?auto_202025 ?auto_202026 ?auto_202027 ?auto_202028 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_202032 - BLOCK
      ?auto_202033 - BLOCK
      ?auto_202034 - BLOCK
      ?auto_202035 - BLOCK
      ?auto_202036 - BLOCK
      ?auto_202037 - BLOCK
    )
    :vars
    (
      ?auto_202039 - BLOCK
      ?auto_202038 - BLOCK
      ?auto_202040 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_202032 ?auto_202033 ) ) ( not ( = ?auto_202032 ?auto_202034 ) ) ( not ( = ?auto_202032 ?auto_202035 ) ) ( not ( = ?auto_202032 ?auto_202036 ) ) ( not ( = ?auto_202032 ?auto_202037 ) ) ( not ( = ?auto_202032 ?auto_202039 ) ) ( not ( = ?auto_202033 ?auto_202034 ) ) ( not ( = ?auto_202033 ?auto_202035 ) ) ( not ( = ?auto_202033 ?auto_202036 ) ) ( not ( = ?auto_202033 ?auto_202037 ) ) ( not ( = ?auto_202033 ?auto_202039 ) ) ( not ( = ?auto_202034 ?auto_202035 ) ) ( not ( = ?auto_202034 ?auto_202036 ) ) ( not ( = ?auto_202034 ?auto_202037 ) ) ( not ( = ?auto_202034 ?auto_202039 ) ) ( not ( = ?auto_202035 ?auto_202036 ) ) ( not ( = ?auto_202035 ?auto_202037 ) ) ( not ( = ?auto_202035 ?auto_202039 ) ) ( not ( = ?auto_202036 ?auto_202037 ) ) ( not ( = ?auto_202036 ?auto_202039 ) ) ( not ( = ?auto_202037 ?auto_202039 ) ) ( not ( = ?auto_202032 ?auto_202038 ) ) ( not ( = ?auto_202033 ?auto_202038 ) ) ( not ( = ?auto_202034 ?auto_202038 ) ) ( not ( = ?auto_202035 ?auto_202038 ) ) ( not ( = ?auto_202036 ?auto_202038 ) ) ( not ( = ?auto_202037 ?auto_202038 ) ) ( not ( = ?auto_202039 ?auto_202038 ) ) ( ON ?auto_202038 ?auto_202040 ) ( not ( = ?auto_202032 ?auto_202040 ) ) ( not ( = ?auto_202033 ?auto_202040 ) ) ( not ( = ?auto_202034 ?auto_202040 ) ) ( not ( = ?auto_202035 ?auto_202040 ) ) ( not ( = ?auto_202036 ?auto_202040 ) ) ( not ( = ?auto_202037 ?auto_202040 ) ) ( not ( = ?auto_202039 ?auto_202040 ) ) ( not ( = ?auto_202038 ?auto_202040 ) ) ( ON ?auto_202039 ?auto_202038 ) ( ON ?auto_202037 ?auto_202039 ) ( ON-TABLE ?auto_202040 ) ( ON ?auto_202036 ?auto_202037 ) ( ON ?auto_202035 ?auto_202036 ) ( ON ?auto_202034 ?auto_202035 ) ( ON ?auto_202033 ?auto_202034 ) ( CLEAR ?auto_202033 ) ( HOLDING ?auto_202032 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_202032 )
      ( MAKE-6PILE ?auto_202032 ?auto_202033 ?auto_202034 ?auto_202035 ?auto_202036 ?auto_202037 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_202041 - BLOCK
      ?auto_202042 - BLOCK
      ?auto_202043 - BLOCK
      ?auto_202044 - BLOCK
      ?auto_202045 - BLOCK
      ?auto_202046 - BLOCK
    )
    :vars
    (
      ?auto_202048 - BLOCK
      ?auto_202049 - BLOCK
      ?auto_202047 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_202041 ?auto_202042 ) ) ( not ( = ?auto_202041 ?auto_202043 ) ) ( not ( = ?auto_202041 ?auto_202044 ) ) ( not ( = ?auto_202041 ?auto_202045 ) ) ( not ( = ?auto_202041 ?auto_202046 ) ) ( not ( = ?auto_202041 ?auto_202048 ) ) ( not ( = ?auto_202042 ?auto_202043 ) ) ( not ( = ?auto_202042 ?auto_202044 ) ) ( not ( = ?auto_202042 ?auto_202045 ) ) ( not ( = ?auto_202042 ?auto_202046 ) ) ( not ( = ?auto_202042 ?auto_202048 ) ) ( not ( = ?auto_202043 ?auto_202044 ) ) ( not ( = ?auto_202043 ?auto_202045 ) ) ( not ( = ?auto_202043 ?auto_202046 ) ) ( not ( = ?auto_202043 ?auto_202048 ) ) ( not ( = ?auto_202044 ?auto_202045 ) ) ( not ( = ?auto_202044 ?auto_202046 ) ) ( not ( = ?auto_202044 ?auto_202048 ) ) ( not ( = ?auto_202045 ?auto_202046 ) ) ( not ( = ?auto_202045 ?auto_202048 ) ) ( not ( = ?auto_202046 ?auto_202048 ) ) ( not ( = ?auto_202041 ?auto_202049 ) ) ( not ( = ?auto_202042 ?auto_202049 ) ) ( not ( = ?auto_202043 ?auto_202049 ) ) ( not ( = ?auto_202044 ?auto_202049 ) ) ( not ( = ?auto_202045 ?auto_202049 ) ) ( not ( = ?auto_202046 ?auto_202049 ) ) ( not ( = ?auto_202048 ?auto_202049 ) ) ( ON ?auto_202049 ?auto_202047 ) ( not ( = ?auto_202041 ?auto_202047 ) ) ( not ( = ?auto_202042 ?auto_202047 ) ) ( not ( = ?auto_202043 ?auto_202047 ) ) ( not ( = ?auto_202044 ?auto_202047 ) ) ( not ( = ?auto_202045 ?auto_202047 ) ) ( not ( = ?auto_202046 ?auto_202047 ) ) ( not ( = ?auto_202048 ?auto_202047 ) ) ( not ( = ?auto_202049 ?auto_202047 ) ) ( ON ?auto_202048 ?auto_202049 ) ( ON ?auto_202046 ?auto_202048 ) ( ON-TABLE ?auto_202047 ) ( ON ?auto_202045 ?auto_202046 ) ( ON ?auto_202044 ?auto_202045 ) ( ON ?auto_202043 ?auto_202044 ) ( ON ?auto_202042 ?auto_202043 ) ( ON ?auto_202041 ?auto_202042 ) ( CLEAR ?auto_202041 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_202047 ?auto_202049 ?auto_202048 ?auto_202046 ?auto_202045 ?auto_202044 ?auto_202043 ?auto_202042 )
      ( MAKE-6PILE ?auto_202041 ?auto_202042 ?auto_202043 ?auto_202044 ?auto_202045 ?auto_202046 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_202052 - BLOCK
      ?auto_202053 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_202053 ) ( CLEAR ?auto_202052 ) ( ON-TABLE ?auto_202052 ) ( not ( = ?auto_202052 ?auto_202053 ) ) )
    :subtasks
    ( ( !STACK ?auto_202053 ?auto_202052 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_202054 - BLOCK
      ?auto_202055 - BLOCK
    )
    :vars
    (
      ?auto_202056 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_202054 ) ( ON-TABLE ?auto_202054 ) ( not ( = ?auto_202054 ?auto_202055 ) ) ( ON ?auto_202055 ?auto_202056 ) ( CLEAR ?auto_202055 ) ( HAND-EMPTY ) ( not ( = ?auto_202054 ?auto_202056 ) ) ( not ( = ?auto_202055 ?auto_202056 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_202055 ?auto_202056 )
      ( MAKE-2PILE ?auto_202054 ?auto_202055 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_202057 - BLOCK
      ?auto_202058 - BLOCK
    )
    :vars
    (
      ?auto_202059 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_202057 ?auto_202058 ) ) ( ON ?auto_202058 ?auto_202059 ) ( CLEAR ?auto_202058 ) ( not ( = ?auto_202057 ?auto_202059 ) ) ( not ( = ?auto_202058 ?auto_202059 ) ) ( HOLDING ?auto_202057 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_202057 )
      ( MAKE-2PILE ?auto_202057 ?auto_202058 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_202060 - BLOCK
      ?auto_202061 - BLOCK
    )
    :vars
    (
      ?auto_202062 - BLOCK
      ?auto_202063 - BLOCK
      ?auto_202067 - BLOCK
      ?auto_202064 - BLOCK
      ?auto_202065 - BLOCK
      ?auto_202066 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_202060 ?auto_202061 ) ) ( ON ?auto_202061 ?auto_202062 ) ( not ( = ?auto_202060 ?auto_202062 ) ) ( not ( = ?auto_202061 ?auto_202062 ) ) ( ON ?auto_202060 ?auto_202061 ) ( CLEAR ?auto_202060 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_202063 ) ( ON ?auto_202067 ?auto_202063 ) ( ON ?auto_202064 ?auto_202067 ) ( ON ?auto_202065 ?auto_202064 ) ( ON ?auto_202066 ?auto_202065 ) ( ON ?auto_202062 ?auto_202066 ) ( not ( = ?auto_202063 ?auto_202067 ) ) ( not ( = ?auto_202063 ?auto_202064 ) ) ( not ( = ?auto_202063 ?auto_202065 ) ) ( not ( = ?auto_202063 ?auto_202066 ) ) ( not ( = ?auto_202063 ?auto_202062 ) ) ( not ( = ?auto_202063 ?auto_202061 ) ) ( not ( = ?auto_202063 ?auto_202060 ) ) ( not ( = ?auto_202067 ?auto_202064 ) ) ( not ( = ?auto_202067 ?auto_202065 ) ) ( not ( = ?auto_202067 ?auto_202066 ) ) ( not ( = ?auto_202067 ?auto_202062 ) ) ( not ( = ?auto_202067 ?auto_202061 ) ) ( not ( = ?auto_202067 ?auto_202060 ) ) ( not ( = ?auto_202064 ?auto_202065 ) ) ( not ( = ?auto_202064 ?auto_202066 ) ) ( not ( = ?auto_202064 ?auto_202062 ) ) ( not ( = ?auto_202064 ?auto_202061 ) ) ( not ( = ?auto_202064 ?auto_202060 ) ) ( not ( = ?auto_202065 ?auto_202066 ) ) ( not ( = ?auto_202065 ?auto_202062 ) ) ( not ( = ?auto_202065 ?auto_202061 ) ) ( not ( = ?auto_202065 ?auto_202060 ) ) ( not ( = ?auto_202066 ?auto_202062 ) ) ( not ( = ?auto_202066 ?auto_202061 ) ) ( not ( = ?auto_202066 ?auto_202060 ) ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_202063 ?auto_202067 ?auto_202064 ?auto_202065 ?auto_202066 ?auto_202062 ?auto_202061 )
      ( MAKE-2PILE ?auto_202060 ?auto_202061 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_202068 - BLOCK
      ?auto_202069 - BLOCK
    )
    :vars
    (
      ?auto_202074 - BLOCK
      ?auto_202070 - BLOCK
      ?auto_202075 - BLOCK
      ?auto_202072 - BLOCK
      ?auto_202071 - BLOCK
      ?auto_202073 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_202068 ?auto_202069 ) ) ( ON ?auto_202069 ?auto_202074 ) ( not ( = ?auto_202068 ?auto_202074 ) ) ( not ( = ?auto_202069 ?auto_202074 ) ) ( ON-TABLE ?auto_202070 ) ( ON ?auto_202075 ?auto_202070 ) ( ON ?auto_202072 ?auto_202075 ) ( ON ?auto_202071 ?auto_202072 ) ( ON ?auto_202073 ?auto_202071 ) ( ON ?auto_202074 ?auto_202073 ) ( not ( = ?auto_202070 ?auto_202075 ) ) ( not ( = ?auto_202070 ?auto_202072 ) ) ( not ( = ?auto_202070 ?auto_202071 ) ) ( not ( = ?auto_202070 ?auto_202073 ) ) ( not ( = ?auto_202070 ?auto_202074 ) ) ( not ( = ?auto_202070 ?auto_202069 ) ) ( not ( = ?auto_202070 ?auto_202068 ) ) ( not ( = ?auto_202075 ?auto_202072 ) ) ( not ( = ?auto_202075 ?auto_202071 ) ) ( not ( = ?auto_202075 ?auto_202073 ) ) ( not ( = ?auto_202075 ?auto_202074 ) ) ( not ( = ?auto_202075 ?auto_202069 ) ) ( not ( = ?auto_202075 ?auto_202068 ) ) ( not ( = ?auto_202072 ?auto_202071 ) ) ( not ( = ?auto_202072 ?auto_202073 ) ) ( not ( = ?auto_202072 ?auto_202074 ) ) ( not ( = ?auto_202072 ?auto_202069 ) ) ( not ( = ?auto_202072 ?auto_202068 ) ) ( not ( = ?auto_202071 ?auto_202073 ) ) ( not ( = ?auto_202071 ?auto_202074 ) ) ( not ( = ?auto_202071 ?auto_202069 ) ) ( not ( = ?auto_202071 ?auto_202068 ) ) ( not ( = ?auto_202073 ?auto_202074 ) ) ( not ( = ?auto_202073 ?auto_202069 ) ) ( not ( = ?auto_202073 ?auto_202068 ) ) ( HOLDING ?auto_202068 ) ( CLEAR ?auto_202069 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_202070 ?auto_202075 ?auto_202072 ?auto_202071 ?auto_202073 ?auto_202074 ?auto_202069 ?auto_202068 )
      ( MAKE-2PILE ?auto_202068 ?auto_202069 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_202076 - BLOCK
      ?auto_202077 - BLOCK
    )
    :vars
    (
      ?auto_202082 - BLOCK
      ?auto_202080 - BLOCK
      ?auto_202083 - BLOCK
      ?auto_202081 - BLOCK
      ?auto_202078 - BLOCK
      ?auto_202079 - BLOCK
      ?auto_202084 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_202076 ?auto_202077 ) ) ( ON ?auto_202077 ?auto_202082 ) ( not ( = ?auto_202076 ?auto_202082 ) ) ( not ( = ?auto_202077 ?auto_202082 ) ) ( ON-TABLE ?auto_202080 ) ( ON ?auto_202083 ?auto_202080 ) ( ON ?auto_202081 ?auto_202083 ) ( ON ?auto_202078 ?auto_202081 ) ( ON ?auto_202079 ?auto_202078 ) ( ON ?auto_202082 ?auto_202079 ) ( not ( = ?auto_202080 ?auto_202083 ) ) ( not ( = ?auto_202080 ?auto_202081 ) ) ( not ( = ?auto_202080 ?auto_202078 ) ) ( not ( = ?auto_202080 ?auto_202079 ) ) ( not ( = ?auto_202080 ?auto_202082 ) ) ( not ( = ?auto_202080 ?auto_202077 ) ) ( not ( = ?auto_202080 ?auto_202076 ) ) ( not ( = ?auto_202083 ?auto_202081 ) ) ( not ( = ?auto_202083 ?auto_202078 ) ) ( not ( = ?auto_202083 ?auto_202079 ) ) ( not ( = ?auto_202083 ?auto_202082 ) ) ( not ( = ?auto_202083 ?auto_202077 ) ) ( not ( = ?auto_202083 ?auto_202076 ) ) ( not ( = ?auto_202081 ?auto_202078 ) ) ( not ( = ?auto_202081 ?auto_202079 ) ) ( not ( = ?auto_202081 ?auto_202082 ) ) ( not ( = ?auto_202081 ?auto_202077 ) ) ( not ( = ?auto_202081 ?auto_202076 ) ) ( not ( = ?auto_202078 ?auto_202079 ) ) ( not ( = ?auto_202078 ?auto_202082 ) ) ( not ( = ?auto_202078 ?auto_202077 ) ) ( not ( = ?auto_202078 ?auto_202076 ) ) ( not ( = ?auto_202079 ?auto_202082 ) ) ( not ( = ?auto_202079 ?auto_202077 ) ) ( not ( = ?auto_202079 ?auto_202076 ) ) ( CLEAR ?auto_202077 ) ( ON ?auto_202076 ?auto_202084 ) ( CLEAR ?auto_202076 ) ( HAND-EMPTY ) ( not ( = ?auto_202076 ?auto_202084 ) ) ( not ( = ?auto_202077 ?auto_202084 ) ) ( not ( = ?auto_202082 ?auto_202084 ) ) ( not ( = ?auto_202080 ?auto_202084 ) ) ( not ( = ?auto_202083 ?auto_202084 ) ) ( not ( = ?auto_202081 ?auto_202084 ) ) ( not ( = ?auto_202078 ?auto_202084 ) ) ( not ( = ?auto_202079 ?auto_202084 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_202076 ?auto_202084 )
      ( MAKE-2PILE ?auto_202076 ?auto_202077 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_202085 - BLOCK
      ?auto_202086 - BLOCK
    )
    :vars
    (
      ?auto_202092 - BLOCK
      ?auto_202090 - BLOCK
      ?auto_202089 - BLOCK
      ?auto_202091 - BLOCK
      ?auto_202093 - BLOCK
      ?auto_202087 - BLOCK
      ?auto_202088 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_202085 ?auto_202086 ) ) ( not ( = ?auto_202085 ?auto_202092 ) ) ( not ( = ?auto_202086 ?auto_202092 ) ) ( ON-TABLE ?auto_202090 ) ( ON ?auto_202089 ?auto_202090 ) ( ON ?auto_202091 ?auto_202089 ) ( ON ?auto_202093 ?auto_202091 ) ( ON ?auto_202087 ?auto_202093 ) ( ON ?auto_202092 ?auto_202087 ) ( not ( = ?auto_202090 ?auto_202089 ) ) ( not ( = ?auto_202090 ?auto_202091 ) ) ( not ( = ?auto_202090 ?auto_202093 ) ) ( not ( = ?auto_202090 ?auto_202087 ) ) ( not ( = ?auto_202090 ?auto_202092 ) ) ( not ( = ?auto_202090 ?auto_202086 ) ) ( not ( = ?auto_202090 ?auto_202085 ) ) ( not ( = ?auto_202089 ?auto_202091 ) ) ( not ( = ?auto_202089 ?auto_202093 ) ) ( not ( = ?auto_202089 ?auto_202087 ) ) ( not ( = ?auto_202089 ?auto_202092 ) ) ( not ( = ?auto_202089 ?auto_202086 ) ) ( not ( = ?auto_202089 ?auto_202085 ) ) ( not ( = ?auto_202091 ?auto_202093 ) ) ( not ( = ?auto_202091 ?auto_202087 ) ) ( not ( = ?auto_202091 ?auto_202092 ) ) ( not ( = ?auto_202091 ?auto_202086 ) ) ( not ( = ?auto_202091 ?auto_202085 ) ) ( not ( = ?auto_202093 ?auto_202087 ) ) ( not ( = ?auto_202093 ?auto_202092 ) ) ( not ( = ?auto_202093 ?auto_202086 ) ) ( not ( = ?auto_202093 ?auto_202085 ) ) ( not ( = ?auto_202087 ?auto_202092 ) ) ( not ( = ?auto_202087 ?auto_202086 ) ) ( not ( = ?auto_202087 ?auto_202085 ) ) ( ON ?auto_202085 ?auto_202088 ) ( CLEAR ?auto_202085 ) ( not ( = ?auto_202085 ?auto_202088 ) ) ( not ( = ?auto_202086 ?auto_202088 ) ) ( not ( = ?auto_202092 ?auto_202088 ) ) ( not ( = ?auto_202090 ?auto_202088 ) ) ( not ( = ?auto_202089 ?auto_202088 ) ) ( not ( = ?auto_202091 ?auto_202088 ) ) ( not ( = ?auto_202093 ?auto_202088 ) ) ( not ( = ?auto_202087 ?auto_202088 ) ) ( HOLDING ?auto_202086 ) ( CLEAR ?auto_202092 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_202090 ?auto_202089 ?auto_202091 ?auto_202093 ?auto_202087 ?auto_202092 ?auto_202086 )
      ( MAKE-2PILE ?auto_202085 ?auto_202086 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_202094 - BLOCK
      ?auto_202095 - BLOCK
    )
    :vars
    (
      ?auto_202098 - BLOCK
      ?auto_202099 - BLOCK
      ?auto_202100 - BLOCK
      ?auto_202102 - BLOCK
      ?auto_202097 - BLOCK
      ?auto_202101 - BLOCK
      ?auto_202096 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_202094 ?auto_202095 ) ) ( not ( = ?auto_202094 ?auto_202098 ) ) ( not ( = ?auto_202095 ?auto_202098 ) ) ( ON-TABLE ?auto_202099 ) ( ON ?auto_202100 ?auto_202099 ) ( ON ?auto_202102 ?auto_202100 ) ( ON ?auto_202097 ?auto_202102 ) ( ON ?auto_202101 ?auto_202097 ) ( ON ?auto_202098 ?auto_202101 ) ( not ( = ?auto_202099 ?auto_202100 ) ) ( not ( = ?auto_202099 ?auto_202102 ) ) ( not ( = ?auto_202099 ?auto_202097 ) ) ( not ( = ?auto_202099 ?auto_202101 ) ) ( not ( = ?auto_202099 ?auto_202098 ) ) ( not ( = ?auto_202099 ?auto_202095 ) ) ( not ( = ?auto_202099 ?auto_202094 ) ) ( not ( = ?auto_202100 ?auto_202102 ) ) ( not ( = ?auto_202100 ?auto_202097 ) ) ( not ( = ?auto_202100 ?auto_202101 ) ) ( not ( = ?auto_202100 ?auto_202098 ) ) ( not ( = ?auto_202100 ?auto_202095 ) ) ( not ( = ?auto_202100 ?auto_202094 ) ) ( not ( = ?auto_202102 ?auto_202097 ) ) ( not ( = ?auto_202102 ?auto_202101 ) ) ( not ( = ?auto_202102 ?auto_202098 ) ) ( not ( = ?auto_202102 ?auto_202095 ) ) ( not ( = ?auto_202102 ?auto_202094 ) ) ( not ( = ?auto_202097 ?auto_202101 ) ) ( not ( = ?auto_202097 ?auto_202098 ) ) ( not ( = ?auto_202097 ?auto_202095 ) ) ( not ( = ?auto_202097 ?auto_202094 ) ) ( not ( = ?auto_202101 ?auto_202098 ) ) ( not ( = ?auto_202101 ?auto_202095 ) ) ( not ( = ?auto_202101 ?auto_202094 ) ) ( ON ?auto_202094 ?auto_202096 ) ( not ( = ?auto_202094 ?auto_202096 ) ) ( not ( = ?auto_202095 ?auto_202096 ) ) ( not ( = ?auto_202098 ?auto_202096 ) ) ( not ( = ?auto_202099 ?auto_202096 ) ) ( not ( = ?auto_202100 ?auto_202096 ) ) ( not ( = ?auto_202102 ?auto_202096 ) ) ( not ( = ?auto_202097 ?auto_202096 ) ) ( not ( = ?auto_202101 ?auto_202096 ) ) ( CLEAR ?auto_202098 ) ( ON ?auto_202095 ?auto_202094 ) ( CLEAR ?auto_202095 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_202096 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_202096 ?auto_202094 )
      ( MAKE-2PILE ?auto_202094 ?auto_202095 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_202103 - BLOCK
      ?auto_202104 - BLOCK
    )
    :vars
    (
      ?auto_202110 - BLOCK
      ?auto_202106 - BLOCK
      ?auto_202111 - BLOCK
      ?auto_202108 - BLOCK
      ?auto_202105 - BLOCK
      ?auto_202109 - BLOCK
      ?auto_202107 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_202103 ?auto_202104 ) ) ( not ( = ?auto_202103 ?auto_202110 ) ) ( not ( = ?auto_202104 ?auto_202110 ) ) ( ON-TABLE ?auto_202106 ) ( ON ?auto_202111 ?auto_202106 ) ( ON ?auto_202108 ?auto_202111 ) ( ON ?auto_202105 ?auto_202108 ) ( ON ?auto_202109 ?auto_202105 ) ( not ( = ?auto_202106 ?auto_202111 ) ) ( not ( = ?auto_202106 ?auto_202108 ) ) ( not ( = ?auto_202106 ?auto_202105 ) ) ( not ( = ?auto_202106 ?auto_202109 ) ) ( not ( = ?auto_202106 ?auto_202110 ) ) ( not ( = ?auto_202106 ?auto_202104 ) ) ( not ( = ?auto_202106 ?auto_202103 ) ) ( not ( = ?auto_202111 ?auto_202108 ) ) ( not ( = ?auto_202111 ?auto_202105 ) ) ( not ( = ?auto_202111 ?auto_202109 ) ) ( not ( = ?auto_202111 ?auto_202110 ) ) ( not ( = ?auto_202111 ?auto_202104 ) ) ( not ( = ?auto_202111 ?auto_202103 ) ) ( not ( = ?auto_202108 ?auto_202105 ) ) ( not ( = ?auto_202108 ?auto_202109 ) ) ( not ( = ?auto_202108 ?auto_202110 ) ) ( not ( = ?auto_202108 ?auto_202104 ) ) ( not ( = ?auto_202108 ?auto_202103 ) ) ( not ( = ?auto_202105 ?auto_202109 ) ) ( not ( = ?auto_202105 ?auto_202110 ) ) ( not ( = ?auto_202105 ?auto_202104 ) ) ( not ( = ?auto_202105 ?auto_202103 ) ) ( not ( = ?auto_202109 ?auto_202110 ) ) ( not ( = ?auto_202109 ?auto_202104 ) ) ( not ( = ?auto_202109 ?auto_202103 ) ) ( ON ?auto_202103 ?auto_202107 ) ( not ( = ?auto_202103 ?auto_202107 ) ) ( not ( = ?auto_202104 ?auto_202107 ) ) ( not ( = ?auto_202110 ?auto_202107 ) ) ( not ( = ?auto_202106 ?auto_202107 ) ) ( not ( = ?auto_202111 ?auto_202107 ) ) ( not ( = ?auto_202108 ?auto_202107 ) ) ( not ( = ?auto_202105 ?auto_202107 ) ) ( not ( = ?auto_202109 ?auto_202107 ) ) ( ON ?auto_202104 ?auto_202103 ) ( CLEAR ?auto_202104 ) ( ON-TABLE ?auto_202107 ) ( HOLDING ?auto_202110 ) ( CLEAR ?auto_202109 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_202106 ?auto_202111 ?auto_202108 ?auto_202105 ?auto_202109 ?auto_202110 )
      ( MAKE-2PILE ?auto_202103 ?auto_202104 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_202112 - BLOCK
      ?auto_202113 - BLOCK
    )
    :vars
    (
      ?auto_202118 - BLOCK
      ?auto_202115 - BLOCK
      ?auto_202114 - BLOCK
      ?auto_202120 - BLOCK
      ?auto_202117 - BLOCK
      ?auto_202116 - BLOCK
      ?auto_202119 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_202112 ?auto_202113 ) ) ( not ( = ?auto_202112 ?auto_202118 ) ) ( not ( = ?auto_202113 ?auto_202118 ) ) ( ON-TABLE ?auto_202115 ) ( ON ?auto_202114 ?auto_202115 ) ( ON ?auto_202120 ?auto_202114 ) ( ON ?auto_202117 ?auto_202120 ) ( ON ?auto_202116 ?auto_202117 ) ( not ( = ?auto_202115 ?auto_202114 ) ) ( not ( = ?auto_202115 ?auto_202120 ) ) ( not ( = ?auto_202115 ?auto_202117 ) ) ( not ( = ?auto_202115 ?auto_202116 ) ) ( not ( = ?auto_202115 ?auto_202118 ) ) ( not ( = ?auto_202115 ?auto_202113 ) ) ( not ( = ?auto_202115 ?auto_202112 ) ) ( not ( = ?auto_202114 ?auto_202120 ) ) ( not ( = ?auto_202114 ?auto_202117 ) ) ( not ( = ?auto_202114 ?auto_202116 ) ) ( not ( = ?auto_202114 ?auto_202118 ) ) ( not ( = ?auto_202114 ?auto_202113 ) ) ( not ( = ?auto_202114 ?auto_202112 ) ) ( not ( = ?auto_202120 ?auto_202117 ) ) ( not ( = ?auto_202120 ?auto_202116 ) ) ( not ( = ?auto_202120 ?auto_202118 ) ) ( not ( = ?auto_202120 ?auto_202113 ) ) ( not ( = ?auto_202120 ?auto_202112 ) ) ( not ( = ?auto_202117 ?auto_202116 ) ) ( not ( = ?auto_202117 ?auto_202118 ) ) ( not ( = ?auto_202117 ?auto_202113 ) ) ( not ( = ?auto_202117 ?auto_202112 ) ) ( not ( = ?auto_202116 ?auto_202118 ) ) ( not ( = ?auto_202116 ?auto_202113 ) ) ( not ( = ?auto_202116 ?auto_202112 ) ) ( ON ?auto_202112 ?auto_202119 ) ( not ( = ?auto_202112 ?auto_202119 ) ) ( not ( = ?auto_202113 ?auto_202119 ) ) ( not ( = ?auto_202118 ?auto_202119 ) ) ( not ( = ?auto_202115 ?auto_202119 ) ) ( not ( = ?auto_202114 ?auto_202119 ) ) ( not ( = ?auto_202120 ?auto_202119 ) ) ( not ( = ?auto_202117 ?auto_202119 ) ) ( not ( = ?auto_202116 ?auto_202119 ) ) ( ON ?auto_202113 ?auto_202112 ) ( ON-TABLE ?auto_202119 ) ( CLEAR ?auto_202116 ) ( ON ?auto_202118 ?auto_202113 ) ( CLEAR ?auto_202118 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_202119 ?auto_202112 ?auto_202113 )
      ( MAKE-2PILE ?auto_202112 ?auto_202113 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_202121 - BLOCK
      ?auto_202122 - BLOCK
    )
    :vars
    (
      ?auto_202126 - BLOCK
      ?auto_202125 - BLOCK
      ?auto_202124 - BLOCK
      ?auto_202127 - BLOCK
      ?auto_202129 - BLOCK
      ?auto_202123 - BLOCK
      ?auto_202128 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_202121 ?auto_202122 ) ) ( not ( = ?auto_202121 ?auto_202126 ) ) ( not ( = ?auto_202122 ?auto_202126 ) ) ( ON-TABLE ?auto_202125 ) ( ON ?auto_202124 ?auto_202125 ) ( ON ?auto_202127 ?auto_202124 ) ( ON ?auto_202129 ?auto_202127 ) ( not ( = ?auto_202125 ?auto_202124 ) ) ( not ( = ?auto_202125 ?auto_202127 ) ) ( not ( = ?auto_202125 ?auto_202129 ) ) ( not ( = ?auto_202125 ?auto_202123 ) ) ( not ( = ?auto_202125 ?auto_202126 ) ) ( not ( = ?auto_202125 ?auto_202122 ) ) ( not ( = ?auto_202125 ?auto_202121 ) ) ( not ( = ?auto_202124 ?auto_202127 ) ) ( not ( = ?auto_202124 ?auto_202129 ) ) ( not ( = ?auto_202124 ?auto_202123 ) ) ( not ( = ?auto_202124 ?auto_202126 ) ) ( not ( = ?auto_202124 ?auto_202122 ) ) ( not ( = ?auto_202124 ?auto_202121 ) ) ( not ( = ?auto_202127 ?auto_202129 ) ) ( not ( = ?auto_202127 ?auto_202123 ) ) ( not ( = ?auto_202127 ?auto_202126 ) ) ( not ( = ?auto_202127 ?auto_202122 ) ) ( not ( = ?auto_202127 ?auto_202121 ) ) ( not ( = ?auto_202129 ?auto_202123 ) ) ( not ( = ?auto_202129 ?auto_202126 ) ) ( not ( = ?auto_202129 ?auto_202122 ) ) ( not ( = ?auto_202129 ?auto_202121 ) ) ( not ( = ?auto_202123 ?auto_202126 ) ) ( not ( = ?auto_202123 ?auto_202122 ) ) ( not ( = ?auto_202123 ?auto_202121 ) ) ( ON ?auto_202121 ?auto_202128 ) ( not ( = ?auto_202121 ?auto_202128 ) ) ( not ( = ?auto_202122 ?auto_202128 ) ) ( not ( = ?auto_202126 ?auto_202128 ) ) ( not ( = ?auto_202125 ?auto_202128 ) ) ( not ( = ?auto_202124 ?auto_202128 ) ) ( not ( = ?auto_202127 ?auto_202128 ) ) ( not ( = ?auto_202129 ?auto_202128 ) ) ( not ( = ?auto_202123 ?auto_202128 ) ) ( ON ?auto_202122 ?auto_202121 ) ( ON-TABLE ?auto_202128 ) ( ON ?auto_202126 ?auto_202122 ) ( CLEAR ?auto_202126 ) ( HOLDING ?auto_202123 ) ( CLEAR ?auto_202129 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_202125 ?auto_202124 ?auto_202127 ?auto_202129 ?auto_202123 )
      ( MAKE-2PILE ?auto_202121 ?auto_202122 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_202130 - BLOCK
      ?auto_202131 - BLOCK
    )
    :vars
    (
      ?auto_202134 - BLOCK
      ?auto_202133 - BLOCK
      ?auto_202135 - BLOCK
      ?auto_202132 - BLOCK
      ?auto_202136 - BLOCK
      ?auto_202138 - BLOCK
      ?auto_202137 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_202130 ?auto_202131 ) ) ( not ( = ?auto_202130 ?auto_202134 ) ) ( not ( = ?auto_202131 ?auto_202134 ) ) ( ON-TABLE ?auto_202133 ) ( ON ?auto_202135 ?auto_202133 ) ( ON ?auto_202132 ?auto_202135 ) ( ON ?auto_202136 ?auto_202132 ) ( not ( = ?auto_202133 ?auto_202135 ) ) ( not ( = ?auto_202133 ?auto_202132 ) ) ( not ( = ?auto_202133 ?auto_202136 ) ) ( not ( = ?auto_202133 ?auto_202138 ) ) ( not ( = ?auto_202133 ?auto_202134 ) ) ( not ( = ?auto_202133 ?auto_202131 ) ) ( not ( = ?auto_202133 ?auto_202130 ) ) ( not ( = ?auto_202135 ?auto_202132 ) ) ( not ( = ?auto_202135 ?auto_202136 ) ) ( not ( = ?auto_202135 ?auto_202138 ) ) ( not ( = ?auto_202135 ?auto_202134 ) ) ( not ( = ?auto_202135 ?auto_202131 ) ) ( not ( = ?auto_202135 ?auto_202130 ) ) ( not ( = ?auto_202132 ?auto_202136 ) ) ( not ( = ?auto_202132 ?auto_202138 ) ) ( not ( = ?auto_202132 ?auto_202134 ) ) ( not ( = ?auto_202132 ?auto_202131 ) ) ( not ( = ?auto_202132 ?auto_202130 ) ) ( not ( = ?auto_202136 ?auto_202138 ) ) ( not ( = ?auto_202136 ?auto_202134 ) ) ( not ( = ?auto_202136 ?auto_202131 ) ) ( not ( = ?auto_202136 ?auto_202130 ) ) ( not ( = ?auto_202138 ?auto_202134 ) ) ( not ( = ?auto_202138 ?auto_202131 ) ) ( not ( = ?auto_202138 ?auto_202130 ) ) ( ON ?auto_202130 ?auto_202137 ) ( not ( = ?auto_202130 ?auto_202137 ) ) ( not ( = ?auto_202131 ?auto_202137 ) ) ( not ( = ?auto_202134 ?auto_202137 ) ) ( not ( = ?auto_202133 ?auto_202137 ) ) ( not ( = ?auto_202135 ?auto_202137 ) ) ( not ( = ?auto_202132 ?auto_202137 ) ) ( not ( = ?auto_202136 ?auto_202137 ) ) ( not ( = ?auto_202138 ?auto_202137 ) ) ( ON ?auto_202131 ?auto_202130 ) ( ON-TABLE ?auto_202137 ) ( ON ?auto_202134 ?auto_202131 ) ( CLEAR ?auto_202136 ) ( ON ?auto_202138 ?auto_202134 ) ( CLEAR ?auto_202138 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_202137 ?auto_202130 ?auto_202131 ?auto_202134 )
      ( MAKE-2PILE ?auto_202130 ?auto_202131 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_202139 - BLOCK
      ?auto_202140 - BLOCK
    )
    :vars
    (
      ?auto_202143 - BLOCK
      ?auto_202142 - BLOCK
      ?auto_202144 - BLOCK
      ?auto_202146 - BLOCK
      ?auto_202141 - BLOCK
      ?auto_202147 - BLOCK
      ?auto_202145 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_202139 ?auto_202140 ) ) ( not ( = ?auto_202139 ?auto_202143 ) ) ( not ( = ?auto_202140 ?auto_202143 ) ) ( ON-TABLE ?auto_202142 ) ( ON ?auto_202144 ?auto_202142 ) ( ON ?auto_202146 ?auto_202144 ) ( not ( = ?auto_202142 ?auto_202144 ) ) ( not ( = ?auto_202142 ?auto_202146 ) ) ( not ( = ?auto_202142 ?auto_202141 ) ) ( not ( = ?auto_202142 ?auto_202147 ) ) ( not ( = ?auto_202142 ?auto_202143 ) ) ( not ( = ?auto_202142 ?auto_202140 ) ) ( not ( = ?auto_202142 ?auto_202139 ) ) ( not ( = ?auto_202144 ?auto_202146 ) ) ( not ( = ?auto_202144 ?auto_202141 ) ) ( not ( = ?auto_202144 ?auto_202147 ) ) ( not ( = ?auto_202144 ?auto_202143 ) ) ( not ( = ?auto_202144 ?auto_202140 ) ) ( not ( = ?auto_202144 ?auto_202139 ) ) ( not ( = ?auto_202146 ?auto_202141 ) ) ( not ( = ?auto_202146 ?auto_202147 ) ) ( not ( = ?auto_202146 ?auto_202143 ) ) ( not ( = ?auto_202146 ?auto_202140 ) ) ( not ( = ?auto_202146 ?auto_202139 ) ) ( not ( = ?auto_202141 ?auto_202147 ) ) ( not ( = ?auto_202141 ?auto_202143 ) ) ( not ( = ?auto_202141 ?auto_202140 ) ) ( not ( = ?auto_202141 ?auto_202139 ) ) ( not ( = ?auto_202147 ?auto_202143 ) ) ( not ( = ?auto_202147 ?auto_202140 ) ) ( not ( = ?auto_202147 ?auto_202139 ) ) ( ON ?auto_202139 ?auto_202145 ) ( not ( = ?auto_202139 ?auto_202145 ) ) ( not ( = ?auto_202140 ?auto_202145 ) ) ( not ( = ?auto_202143 ?auto_202145 ) ) ( not ( = ?auto_202142 ?auto_202145 ) ) ( not ( = ?auto_202144 ?auto_202145 ) ) ( not ( = ?auto_202146 ?auto_202145 ) ) ( not ( = ?auto_202141 ?auto_202145 ) ) ( not ( = ?auto_202147 ?auto_202145 ) ) ( ON ?auto_202140 ?auto_202139 ) ( ON-TABLE ?auto_202145 ) ( ON ?auto_202143 ?auto_202140 ) ( ON ?auto_202147 ?auto_202143 ) ( CLEAR ?auto_202147 ) ( HOLDING ?auto_202141 ) ( CLEAR ?auto_202146 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_202142 ?auto_202144 ?auto_202146 ?auto_202141 )
      ( MAKE-2PILE ?auto_202139 ?auto_202140 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_202148 - BLOCK
      ?auto_202149 - BLOCK
    )
    :vars
    (
      ?auto_202150 - BLOCK
      ?auto_202151 - BLOCK
      ?auto_202156 - BLOCK
      ?auto_202155 - BLOCK
      ?auto_202154 - BLOCK
      ?auto_202153 - BLOCK
      ?auto_202152 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_202148 ?auto_202149 ) ) ( not ( = ?auto_202148 ?auto_202150 ) ) ( not ( = ?auto_202149 ?auto_202150 ) ) ( ON-TABLE ?auto_202151 ) ( ON ?auto_202156 ?auto_202151 ) ( ON ?auto_202155 ?auto_202156 ) ( not ( = ?auto_202151 ?auto_202156 ) ) ( not ( = ?auto_202151 ?auto_202155 ) ) ( not ( = ?auto_202151 ?auto_202154 ) ) ( not ( = ?auto_202151 ?auto_202153 ) ) ( not ( = ?auto_202151 ?auto_202150 ) ) ( not ( = ?auto_202151 ?auto_202149 ) ) ( not ( = ?auto_202151 ?auto_202148 ) ) ( not ( = ?auto_202156 ?auto_202155 ) ) ( not ( = ?auto_202156 ?auto_202154 ) ) ( not ( = ?auto_202156 ?auto_202153 ) ) ( not ( = ?auto_202156 ?auto_202150 ) ) ( not ( = ?auto_202156 ?auto_202149 ) ) ( not ( = ?auto_202156 ?auto_202148 ) ) ( not ( = ?auto_202155 ?auto_202154 ) ) ( not ( = ?auto_202155 ?auto_202153 ) ) ( not ( = ?auto_202155 ?auto_202150 ) ) ( not ( = ?auto_202155 ?auto_202149 ) ) ( not ( = ?auto_202155 ?auto_202148 ) ) ( not ( = ?auto_202154 ?auto_202153 ) ) ( not ( = ?auto_202154 ?auto_202150 ) ) ( not ( = ?auto_202154 ?auto_202149 ) ) ( not ( = ?auto_202154 ?auto_202148 ) ) ( not ( = ?auto_202153 ?auto_202150 ) ) ( not ( = ?auto_202153 ?auto_202149 ) ) ( not ( = ?auto_202153 ?auto_202148 ) ) ( ON ?auto_202148 ?auto_202152 ) ( not ( = ?auto_202148 ?auto_202152 ) ) ( not ( = ?auto_202149 ?auto_202152 ) ) ( not ( = ?auto_202150 ?auto_202152 ) ) ( not ( = ?auto_202151 ?auto_202152 ) ) ( not ( = ?auto_202156 ?auto_202152 ) ) ( not ( = ?auto_202155 ?auto_202152 ) ) ( not ( = ?auto_202154 ?auto_202152 ) ) ( not ( = ?auto_202153 ?auto_202152 ) ) ( ON ?auto_202149 ?auto_202148 ) ( ON-TABLE ?auto_202152 ) ( ON ?auto_202150 ?auto_202149 ) ( ON ?auto_202153 ?auto_202150 ) ( CLEAR ?auto_202155 ) ( ON ?auto_202154 ?auto_202153 ) ( CLEAR ?auto_202154 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_202152 ?auto_202148 ?auto_202149 ?auto_202150 ?auto_202153 )
      ( MAKE-2PILE ?auto_202148 ?auto_202149 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_202157 - BLOCK
      ?auto_202158 - BLOCK
    )
    :vars
    (
      ?auto_202161 - BLOCK
      ?auto_202165 - BLOCK
      ?auto_202159 - BLOCK
      ?auto_202162 - BLOCK
      ?auto_202160 - BLOCK
      ?auto_202163 - BLOCK
      ?auto_202164 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_202157 ?auto_202158 ) ) ( not ( = ?auto_202157 ?auto_202161 ) ) ( not ( = ?auto_202158 ?auto_202161 ) ) ( ON-TABLE ?auto_202165 ) ( ON ?auto_202159 ?auto_202165 ) ( not ( = ?auto_202165 ?auto_202159 ) ) ( not ( = ?auto_202165 ?auto_202162 ) ) ( not ( = ?auto_202165 ?auto_202160 ) ) ( not ( = ?auto_202165 ?auto_202163 ) ) ( not ( = ?auto_202165 ?auto_202161 ) ) ( not ( = ?auto_202165 ?auto_202158 ) ) ( not ( = ?auto_202165 ?auto_202157 ) ) ( not ( = ?auto_202159 ?auto_202162 ) ) ( not ( = ?auto_202159 ?auto_202160 ) ) ( not ( = ?auto_202159 ?auto_202163 ) ) ( not ( = ?auto_202159 ?auto_202161 ) ) ( not ( = ?auto_202159 ?auto_202158 ) ) ( not ( = ?auto_202159 ?auto_202157 ) ) ( not ( = ?auto_202162 ?auto_202160 ) ) ( not ( = ?auto_202162 ?auto_202163 ) ) ( not ( = ?auto_202162 ?auto_202161 ) ) ( not ( = ?auto_202162 ?auto_202158 ) ) ( not ( = ?auto_202162 ?auto_202157 ) ) ( not ( = ?auto_202160 ?auto_202163 ) ) ( not ( = ?auto_202160 ?auto_202161 ) ) ( not ( = ?auto_202160 ?auto_202158 ) ) ( not ( = ?auto_202160 ?auto_202157 ) ) ( not ( = ?auto_202163 ?auto_202161 ) ) ( not ( = ?auto_202163 ?auto_202158 ) ) ( not ( = ?auto_202163 ?auto_202157 ) ) ( ON ?auto_202157 ?auto_202164 ) ( not ( = ?auto_202157 ?auto_202164 ) ) ( not ( = ?auto_202158 ?auto_202164 ) ) ( not ( = ?auto_202161 ?auto_202164 ) ) ( not ( = ?auto_202165 ?auto_202164 ) ) ( not ( = ?auto_202159 ?auto_202164 ) ) ( not ( = ?auto_202162 ?auto_202164 ) ) ( not ( = ?auto_202160 ?auto_202164 ) ) ( not ( = ?auto_202163 ?auto_202164 ) ) ( ON ?auto_202158 ?auto_202157 ) ( ON-TABLE ?auto_202164 ) ( ON ?auto_202161 ?auto_202158 ) ( ON ?auto_202163 ?auto_202161 ) ( ON ?auto_202160 ?auto_202163 ) ( CLEAR ?auto_202160 ) ( HOLDING ?auto_202162 ) ( CLEAR ?auto_202159 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_202165 ?auto_202159 ?auto_202162 )
      ( MAKE-2PILE ?auto_202157 ?auto_202158 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_202166 - BLOCK
      ?auto_202167 - BLOCK
    )
    :vars
    (
      ?auto_202172 - BLOCK
      ?auto_202173 - BLOCK
      ?auto_202171 - BLOCK
      ?auto_202174 - BLOCK
      ?auto_202169 - BLOCK
      ?auto_202168 - BLOCK
      ?auto_202170 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_202166 ?auto_202167 ) ) ( not ( = ?auto_202166 ?auto_202172 ) ) ( not ( = ?auto_202167 ?auto_202172 ) ) ( ON-TABLE ?auto_202173 ) ( ON ?auto_202171 ?auto_202173 ) ( not ( = ?auto_202173 ?auto_202171 ) ) ( not ( = ?auto_202173 ?auto_202174 ) ) ( not ( = ?auto_202173 ?auto_202169 ) ) ( not ( = ?auto_202173 ?auto_202168 ) ) ( not ( = ?auto_202173 ?auto_202172 ) ) ( not ( = ?auto_202173 ?auto_202167 ) ) ( not ( = ?auto_202173 ?auto_202166 ) ) ( not ( = ?auto_202171 ?auto_202174 ) ) ( not ( = ?auto_202171 ?auto_202169 ) ) ( not ( = ?auto_202171 ?auto_202168 ) ) ( not ( = ?auto_202171 ?auto_202172 ) ) ( not ( = ?auto_202171 ?auto_202167 ) ) ( not ( = ?auto_202171 ?auto_202166 ) ) ( not ( = ?auto_202174 ?auto_202169 ) ) ( not ( = ?auto_202174 ?auto_202168 ) ) ( not ( = ?auto_202174 ?auto_202172 ) ) ( not ( = ?auto_202174 ?auto_202167 ) ) ( not ( = ?auto_202174 ?auto_202166 ) ) ( not ( = ?auto_202169 ?auto_202168 ) ) ( not ( = ?auto_202169 ?auto_202172 ) ) ( not ( = ?auto_202169 ?auto_202167 ) ) ( not ( = ?auto_202169 ?auto_202166 ) ) ( not ( = ?auto_202168 ?auto_202172 ) ) ( not ( = ?auto_202168 ?auto_202167 ) ) ( not ( = ?auto_202168 ?auto_202166 ) ) ( ON ?auto_202166 ?auto_202170 ) ( not ( = ?auto_202166 ?auto_202170 ) ) ( not ( = ?auto_202167 ?auto_202170 ) ) ( not ( = ?auto_202172 ?auto_202170 ) ) ( not ( = ?auto_202173 ?auto_202170 ) ) ( not ( = ?auto_202171 ?auto_202170 ) ) ( not ( = ?auto_202174 ?auto_202170 ) ) ( not ( = ?auto_202169 ?auto_202170 ) ) ( not ( = ?auto_202168 ?auto_202170 ) ) ( ON ?auto_202167 ?auto_202166 ) ( ON-TABLE ?auto_202170 ) ( ON ?auto_202172 ?auto_202167 ) ( ON ?auto_202168 ?auto_202172 ) ( ON ?auto_202169 ?auto_202168 ) ( CLEAR ?auto_202171 ) ( ON ?auto_202174 ?auto_202169 ) ( CLEAR ?auto_202174 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_202170 ?auto_202166 ?auto_202167 ?auto_202172 ?auto_202168 ?auto_202169 )
      ( MAKE-2PILE ?auto_202166 ?auto_202167 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_202175 - BLOCK
      ?auto_202176 - BLOCK
    )
    :vars
    (
      ?auto_202179 - BLOCK
      ?auto_202180 - BLOCK
      ?auto_202178 - BLOCK
      ?auto_202183 - BLOCK
      ?auto_202177 - BLOCK
      ?auto_202181 - BLOCK
      ?auto_202182 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_202175 ?auto_202176 ) ) ( not ( = ?auto_202175 ?auto_202179 ) ) ( not ( = ?auto_202176 ?auto_202179 ) ) ( ON-TABLE ?auto_202180 ) ( not ( = ?auto_202180 ?auto_202178 ) ) ( not ( = ?auto_202180 ?auto_202183 ) ) ( not ( = ?auto_202180 ?auto_202177 ) ) ( not ( = ?auto_202180 ?auto_202181 ) ) ( not ( = ?auto_202180 ?auto_202179 ) ) ( not ( = ?auto_202180 ?auto_202176 ) ) ( not ( = ?auto_202180 ?auto_202175 ) ) ( not ( = ?auto_202178 ?auto_202183 ) ) ( not ( = ?auto_202178 ?auto_202177 ) ) ( not ( = ?auto_202178 ?auto_202181 ) ) ( not ( = ?auto_202178 ?auto_202179 ) ) ( not ( = ?auto_202178 ?auto_202176 ) ) ( not ( = ?auto_202178 ?auto_202175 ) ) ( not ( = ?auto_202183 ?auto_202177 ) ) ( not ( = ?auto_202183 ?auto_202181 ) ) ( not ( = ?auto_202183 ?auto_202179 ) ) ( not ( = ?auto_202183 ?auto_202176 ) ) ( not ( = ?auto_202183 ?auto_202175 ) ) ( not ( = ?auto_202177 ?auto_202181 ) ) ( not ( = ?auto_202177 ?auto_202179 ) ) ( not ( = ?auto_202177 ?auto_202176 ) ) ( not ( = ?auto_202177 ?auto_202175 ) ) ( not ( = ?auto_202181 ?auto_202179 ) ) ( not ( = ?auto_202181 ?auto_202176 ) ) ( not ( = ?auto_202181 ?auto_202175 ) ) ( ON ?auto_202175 ?auto_202182 ) ( not ( = ?auto_202175 ?auto_202182 ) ) ( not ( = ?auto_202176 ?auto_202182 ) ) ( not ( = ?auto_202179 ?auto_202182 ) ) ( not ( = ?auto_202180 ?auto_202182 ) ) ( not ( = ?auto_202178 ?auto_202182 ) ) ( not ( = ?auto_202183 ?auto_202182 ) ) ( not ( = ?auto_202177 ?auto_202182 ) ) ( not ( = ?auto_202181 ?auto_202182 ) ) ( ON ?auto_202176 ?auto_202175 ) ( ON-TABLE ?auto_202182 ) ( ON ?auto_202179 ?auto_202176 ) ( ON ?auto_202181 ?auto_202179 ) ( ON ?auto_202177 ?auto_202181 ) ( ON ?auto_202183 ?auto_202177 ) ( CLEAR ?auto_202183 ) ( HOLDING ?auto_202178 ) ( CLEAR ?auto_202180 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_202180 ?auto_202178 )
      ( MAKE-2PILE ?auto_202175 ?auto_202176 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_202184 - BLOCK
      ?auto_202185 - BLOCK
    )
    :vars
    (
      ?auto_202188 - BLOCK
      ?auto_202192 - BLOCK
      ?auto_202186 - BLOCK
      ?auto_202189 - BLOCK
      ?auto_202191 - BLOCK
      ?auto_202190 - BLOCK
      ?auto_202187 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_202184 ?auto_202185 ) ) ( not ( = ?auto_202184 ?auto_202188 ) ) ( not ( = ?auto_202185 ?auto_202188 ) ) ( ON-TABLE ?auto_202192 ) ( not ( = ?auto_202192 ?auto_202186 ) ) ( not ( = ?auto_202192 ?auto_202189 ) ) ( not ( = ?auto_202192 ?auto_202191 ) ) ( not ( = ?auto_202192 ?auto_202190 ) ) ( not ( = ?auto_202192 ?auto_202188 ) ) ( not ( = ?auto_202192 ?auto_202185 ) ) ( not ( = ?auto_202192 ?auto_202184 ) ) ( not ( = ?auto_202186 ?auto_202189 ) ) ( not ( = ?auto_202186 ?auto_202191 ) ) ( not ( = ?auto_202186 ?auto_202190 ) ) ( not ( = ?auto_202186 ?auto_202188 ) ) ( not ( = ?auto_202186 ?auto_202185 ) ) ( not ( = ?auto_202186 ?auto_202184 ) ) ( not ( = ?auto_202189 ?auto_202191 ) ) ( not ( = ?auto_202189 ?auto_202190 ) ) ( not ( = ?auto_202189 ?auto_202188 ) ) ( not ( = ?auto_202189 ?auto_202185 ) ) ( not ( = ?auto_202189 ?auto_202184 ) ) ( not ( = ?auto_202191 ?auto_202190 ) ) ( not ( = ?auto_202191 ?auto_202188 ) ) ( not ( = ?auto_202191 ?auto_202185 ) ) ( not ( = ?auto_202191 ?auto_202184 ) ) ( not ( = ?auto_202190 ?auto_202188 ) ) ( not ( = ?auto_202190 ?auto_202185 ) ) ( not ( = ?auto_202190 ?auto_202184 ) ) ( ON ?auto_202184 ?auto_202187 ) ( not ( = ?auto_202184 ?auto_202187 ) ) ( not ( = ?auto_202185 ?auto_202187 ) ) ( not ( = ?auto_202188 ?auto_202187 ) ) ( not ( = ?auto_202192 ?auto_202187 ) ) ( not ( = ?auto_202186 ?auto_202187 ) ) ( not ( = ?auto_202189 ?auto_202187 ) ) ( not ( = ?auto_202191 ?auto_202187 ) ) ( not ( = ?auto_202190 ?auto_202187 ) ) ( ON ?auto_202185 ?auto_202184 ) ( ON-TABLE ?auto_202187 ) ( ON ?auto_202188 ?auto_202185 ) ( ON ?auto_202190 ?auto_202188 ) ( ON ?auto_202191 ?auto_202190 ) ( ON ?auto_202189 ?auto_202191 ) ( CLEAR ?auto_202192 ) ( ON ?auto_202186 ?auto_202189 ) ( CLEAR ?auto_202186 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_202187 ?auto_202184 ?auto_202185 ?auto_202188 ?auto_202190 ?auto_202191 ?auto_202189 )
      ( MAKE-2PILE ?auto_202184 ?auto_202185 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_202193 - BLOCK
      ?auto_202194 - BLOCK
    )
    :vars
    (
      ?auto_202195 - BLOCK
      ?auto_202199 - BLOCK
      ?auto_202197 - BLOCK
      ?auto_202200 - BLOCK
      ?auto_202196 - BLOCK
      ?auto_202198 - BLOCK
      ?auto_202201 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_202193 ?auto_202194 ) ) ( not ( = ?auto_202193 ?auto_202195 ) ) ( not ( = ?auto_202194 ?auto_202195 ) ) ( not ( = ?auto_202199 ?auto_202197 ) ) ( not ( = ?auto_202199 ?auto_202200 ) ) ( not ( = ?auto_202199 ?auto_202196 ) ) ( not ( = ?auto_202199 ?auto_202198 ) ) ( not ( = ?auto_202199 ?auto_202195 ) ) ( not ( = ?auto_202199 ?auto_202194 ) ) ( not ( = ?auto_202199 ?auto_202193 ) ) ( not ( = ?auto_202197 ?auto_202200 ) ) ( not ( = ?auto_202197 ?auto_202196 ) ) ( not ( = ?auto_202197 ?auto_202198 ) ) ( not ( = ?auto_202197 ?auto_202195 ) ) ( not ( = ?auto_202197 ?auto_202194 ) ) ( not ( = ?auto_202197 ?auto_202193 ) ) ( not ( = ?auto_202200 ?auto_202196 ) ) ( not ( = ?auto_202200 ?auto_202198 ) ) ( not ( = ?auto_202200 ?auto_202195 ) ) ( not ( = ?auto_202200 ?auto_202194 ) ) ( not ( = ?auto_202200 ?auto_202193 ) ) ( not ( = ?auto_202196 ?auto_202198 ) ) ( not ( = ?auto_202196 ?auto_202195 ) ) ( not ( = ?auto_202196 ?auto_202194 ) ) ( not ( = ?auto_202196 ?auto_202193 ) ) ( not ( = ?auto_202198 ?auto_202195 ) ) ( not ( = ?auto_202198 ?auto_202194 ) ) ( not ( = ?auto_202198 ?auto_202193 ) ) ( ON ?auto_202193 ?auto_202201 ) ( not ( = ?auto_202193 ?auto_202201 ) ) ( not ( = ?auto_202194 ?auto_202201 ) ) ( not ( = ?auto_202195 ?auto_202201 ) ) ( not ( = ?auto_202199 ?auto_202201 ) ) ( not ( = ?auto_202197 ?auto_202201 ) ) ( not ( = ?auto_202200 ?auto_202201 ) ) ( not ( = ?auto_202196 ?auto_202201 ) ) ( not ( = ?auto_202198 ?auto_202201 ) ) ( ON ?auto_202194 ?auto_202193 ) ( ON-TABLE ?auto_202201 ) ( ON ?auto_202195 ?auto_202194 ) ( ON ?auto_202198 ?auto_202195 ) ( ON ?auto_202196 ?auto_202198 ) ( ON ?auto_202200 ?auto_202196 ) ( ON ?auto_202197 ?auto_202200 ) ( CLEAR ?auto_202197 ) ( HOLDING ?auto_202199 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_202199 )
      ( MAKE-2PILE ?auto_202193 ?auto_202194 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_202202 - BLOCK
      ?auto_202203 - BLOCK
    )
    :vars
    (
      ?auto_202207 - BLOCK
      ?auto_202208 - BLOCK
      ?auto_202204 - BLOCK
      ?auto_202205 - BLOCK
      ?auto_202209 - BLOCK
      ?auto_202210 - BLOCK
      ?auto_202206 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_202202 ?auto_202203 ) ) ( not ( = ?auto_202202 ?auto_202207 ) ) ( not ( = ?auto_202203 ?auto_202207 ) ) ( not ( = ?auto_202208 ?auto_202204 ) ) ( not ( = ?auto_202208 ?auto_202205 ) ) ( not ( = ?auto_202208 ?auto_202209 ) ) ( not ( = ?auto_202208 ?auto_202210 ) ) ( not ( = ?auto_202208 ?auto_202207 ) ) ( not ( = ?auto_202208 ?auto_202203 ) ) ( not ( = ?auto_202208 ?auto_202202 ) ) ( not ( = ?auto_202204 ?auto_202205 ) ) ( not ( = ?auto_202204 ?auto_202209 ) ) ( not ( = ?auto_202204 ?auto_202210 ) ) ( not ( = ?auto_202204 ?auto_202207 ) ) ( not ( = ?auto_202204 ?auto_202203 ) ) ( not ( = ?auto_202204 ?auto_202202 ) ) ( not ( = ?auto_202205 ?auto_202209 ) ) ( not ( = ?auto_202205 ?auto_202210 ) ) ( not ( = ?auto_202205 ?auto_202207 ) ) ( not ( = ?auto_202205 ?auto_202203 ) ) ( not ( = ?auto_202205 ?auto_202202 ) ) ( not ( = ?auto_202209 ?auto_202210 ) ) ( not ( = ?auto_202209 ?auto_202207 ) ) ( not ( = ?auto_202209 ?auto_202203 ) ) ( not ( = ?auto_202209 ?auto_202202 ) ) ( not ( = ?auto_202210 ?auto_202207 ) ) ( not ( = ?auto_202210 ?auto_202203 ) ) ( not ( = ?auto_202210 ?auto_202202 ) ) ( ON ?auto_202202 ?auto_202206 ) ( not ( = ?auto_202202 ?auto_202206 ) ) ( not ( = ?auto_202203 ?auto_202206 ) ) ( not ( = ?auto_202207 ?auto_202206 ) ) ( not ( = ?auto_202208 ?auto_202206 ) ) ( not ( = ?auto_202204 ?auto_202206 ) ) ( not ( = ?auto_202205 ?auto_202206 ) ) ( not ( = ?auto_202209 ?auto_202206 ) ) ( not ( = ?auto_202210 ?auto_202206 ) ) ( ON ?auto_202203 ?auto_202202 ) ( ON-TABLE ?auto_202206 ) ( ON ?auto_202207 ?auto_202203 ) ( ON ?auto_202210 ?auto_202207 ) ( ON ?auto_202209 ?auto_202210 ) ( ON ?auto_202205 ?auto_202209 ) ( ON ?auto_202204 ?auto_202205 ) ( ON ?auto_202208 ?auto_202204 ) ( CLEAR ?auto_202208 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_202206 ?auto_202202 ?auto_202203 ?auto_202207 ?auto_202210 ?auto_202209 ?auto_202205 ?auto_202204 )
      ( MAKE-2PILE ?auto_202202 ?auto_202203 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_202216 - BLOCK
      ?auto_202217 - BLOCK
      ?auto_202218 - BLOCK
      ?auto_202219 - BLOCK
      ?auto_202220 - BLOCK
    )
    :vars
    (
      ?auto_202221 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_202221 ?auto_202220 ) ( CLEAR ?auto_202221 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_202216 ) ( ON ?auto_202217 ?auto_202216 ) ( ON ?auto_202218 ?auto_202217 ) ( ON ?auto_202219 ?auto_202218 ) ( ON ?auto_202220 ?auto_202219 ) ( not ( = ?auto_202216 ?auto_202217 ) ) ( not ( = ?auto_202216 ?auto_202218 ) ) ( not ( = ?auto_202216 ?auto_202219 ) ) ( not ( = ?auto_202216 ?auto_202220 ) ) ( not ( = ?auto_202216 ?auto_202221 ) ) ( not ( = ?auto_202217 ?auto_202218 ) ) ( not ( = ?auto_202217 ?auto_202219 ) ) ( not ( = ?auto_202217 ?auto_202220 ) ) ( not ( = ?auto_202217 ?auto_202221 ) ) ( not ( = ?auto_202218 ?auto_202219 ) ) ( not ( = ?auto_202218 ?auto_202220 ) ) ( not ( = ?auto_202218 ?auto_202221 ) ) ( not ( = ?auto_202219 ?auto_202220 ) ) ( not ( = ?auto_202219 ?auto_202221 ) ) ( not ( = ?auto_202220 ?auto_202221 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_202221 ?auto_202220 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_202222 - BLOCK
      ?auto_202223 - BLOCK
      ?auto_202224 - BLOCK
      ?auto_202225 - BLOCK
      ?auto_202226 - BLOCK
    )
    :vars
    (
      ?auto_202227 - BLOCK
      ?auto_202228 - BLOCK
      ?auto_202229 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_202227 ?auto_202226 ) ( CLEAR ?auto_202227 ) ( ON-TABLE ?auto_202222 ) ( ON ?auto_202223 ?auto_202222 ) ( ON ?auto_202224 ?auto_202223 ) ( ON ?auto_202225 ?auto_202224 ) ( ON ?auto_202226 ?auto_202225 ) ( not ( = ?auto_202222 ?auto_202223 ) ) ( not ( = ?auto_202222 ?auto_202224 ) ) ( not ( = ?auto_202222 ?auto_202225 ) ) ( not ( = ?auto_202222 ?auto_202226 ) ) ( not ( = ?auto_202222 ?auto_202227 ) ) ( not ( = ?auto_202223 ?auto_202224 ) ) ( not ( = ?auto_202223 ?auto_202225 ) ) ( not ( = ?auto_202223 ?auto_202226 ) ) ( not ( = ?auto_202223 ?auto_202227 ) ) ( not ( = ?auto_202224 ?auto_202225 ) ) ( not ( = ?auto_202224 ?auto_202226 ) ) ( not ( = ?auto_202224 ?auto_202227 ) ) ( not ( = ?auto_202225 ?auto_202226 ) ) ( not ( = ?auto_202225 ?auto_202227 ) ) ( not ( = ?auto_202226 ?auto_202227 ) ) ( HOLDING ?auto_202228 ) ( CLEAR ?auto_202229 ) ( not ( = ?auto_202222 ?auto_202228 ) ) ( not ( = ?auto_202222 ?auto_202229 ) ) ( not ( = ?auto_202223 ?auto_202228 ) ) ( not ( = ?auto_202223 ?auto_202229 ) ) ( not ( = ?auto_202224 ?auto_202228 ) ) ( not ( = ?auto_202224 ?auto_202229 ) ) ( not ( = ?auto_202225 ?auto_202228 ) ) ( not ( = ?auto_202225 ?auto_202229 ) ) ( not ( = ?auto_202226 ?auto_202228 ) ) ( not ( = ?auto_202226 ?auto_202229 ) ) ( not ( = ?auto_202227 ?auto_202228 ) ) ( not ( = ?auto_202227 ?auto_202229 ) ) ( not ( = ?auto_202228 ?auto_202229 ) ) )
    :subtasks
    ( ( !STACK ?auto_202228 ?auto_202229 )
      ( MAKE-5PILE ?auto_202222 ?auto_202223 ?auto_202224 ?auto_202225 ?auto_202226 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_202230 - BLOCK
      ?auto_202231 - BLOCK
      ?auto_202232 - BLOCK
      ?auto_202233 - BLOCK
      ?auto_202234 - BLOCK
    )
    :vars
    (
      ?auto_202235 - BLOCK
      ?auto_202237 - BLOCK
      ?auto_202236 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_202235 ?auto_202234 ) ( ON-TABLE ?auto_202230 ) ( ON ?auto_202231 ?auto_202230 ) ( ON ?auto_202232 ?auto_202231 ) ( ON ?auto_202233 ?auto_202232 ) ( ON ?auto_202234 ?auto_202233 ) ( not ( = ?auto_202230 ?auto_202231 ) ) ( not ( = ?auto_202230 ?auto_202232 ) ) ( not ( = ?auto_202230 ?auto_202233 ) ) ( not ( = ?auto_202230 ?auto_202234 ) ) ( not ( = ?auto_202230 ?auto_202235 ) ) ( not ( = ?auto_202231 ?auto_202232 ) ) ( not ( = ?auto_202231 ?auto_202233 ) ) ( not ( = ?auto_202231 ?auto_202234 ) ) ( not ( = ?auto_202231 ?auto_202235 ) ) ( not ( = ?auto_202232 ?auto_202233 ) ) ( not ( = ?auto_202232 ?auto_202234 ) ) ( not ( = ?auto_202232 ?auto_202235 ) ) ( not ( = ?auto_202233 ?auto_202234 ) ) ( not ( = ?auto_202233 ?auto_202235 ) ) ( not ( = ?auto_202234 ?auto_202235 ) ) ( CLEAR ?auto_202237 ) ( not ( = ?auto_202230 ?auto_202236 ) ) ( not ( = ?auto_202230 ?auto_202237 ) ) ( not ( = ?auto_202231 ?auto_202236 ) ) ( not ( = ?auto_202231 ?auto_202237 ) ) ( not ( = ?auto_202232 ?auto_202236 ) ) ( not ( = ?auto_202232 ?auto_202237 ) ) ( not ( = ?auto_202233 ?auto_202236 ) ) ( not ( = ?auto_202233 ?auto_202237 ) ) ( not ( = ?auto_202234 ?auto_202236 ) ) ( not ( = ?auto_202234 ?auto_202237 ) ) ( not ( = ?auto_202235 ?auto_202236 ) ) ( not ( = ?auto_202235 ?auto_202237 ) ) ( not ( = ?auto_202236 ?auto_202237 ) ) ( ON ?auto_202236 ?auto_202235 ) ( CLEAR ?auto_202236 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_202230 ?auto_202231 ?auto_202232 ?auto_202233 ?auto_202234 ?auto_202235 )
      ( MAKE-5PILE ?auto_202230 ?auto_202231 ?auto_202232 ?auto_202233 ?auto_202234 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_202238 - BLOCK
      ?auto_202239 - BLOCK
      ?auto_202240 - BLOCK
      ?auto_202241 - BLOCK
      ?auto_202242 - BLOCK
    )
    :vars
    (
      ?auto_202243 - BLOCK
      ?auto_202245 - BLOCK
      ?auto_202244 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_202243 ?auto_202242 ) ( ON-TABLE ?auto_202238 ) ( ON ?auto_202239 ?auto_202238 ) ( ON ?auto_202240 ?auto_202239 ) ( ON ?auto_202241 ?auto_202240 ) ( ON ?auto_202242 ?auto_202241 ) ( not ( = ?auto_202238 ?auto_202239 ) ) ( not ( = ?auto_202238 ?auto_202240 ) ) ( not ( = ?auto_202238 ?auto_202241 ) ) ( not ( = ?auto_202238 ?auto_202242 ) ) ( not ( = ?auto_202238 ?auto_202243 ) ) ( not ( = ?auto_202239 ?auto_202240 ) ) ( not ( = ?auto_202239 ?auto_202241 ) ) ( not ( = ?auto_202239 ?auto_202242 ) ) ( not ( = ?auto_202239 ?auto_202243 ) ) ( not ( = ?auto_202240 ?auto_202241 ) ) ( not ( = ?auto_202240 ?auto_202242 ) ) ( not ( = ?auto_202240 ?auto_202243 ) ) ( not ( = ?auto_202241 ?auto_202242 ) ) ( not ( = ?auto_202241 ?auto_202243 ) ) ( not ( = ?auto_202242 ?auto_202243 ) ) ( not ( = ?auto_202238 ?auto_202245 ) ) ( not ( = ?auto_202238 ?auto_202244 ) ) ( not ( = ?auto_202239 ?auto_202245 ) ) ( not ( = ?auto_202239 ?auto_202244 ) ) ( not ( = ?auto_202240 ?auto_202245 ) ) ( not ( = ?auto_202240 ?auto_202244 ) ) ( not ( = ?auto_202241 ?auto_202245 ) ) ( not ( = ?auto_202241 ?auto_202244 ) ) ( not ( = ?auto_202242 ?auto_202245 ) ) ( not ( = ?auto_202242 ?auto_202244 ) ) ( not ( = ?auto_202243 ?auto_202245 ) ) ( not ( = ?auto_202243 ?auto_202244 ) ) ( not ( = ?auto_202245 ?auto_202244 ) ) ( ON ?auto_202245 ?auto_202243 ) ( CLEAR ?auto_202245 ) ( HOLDING ?auto_202244 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_202244 )
      ( MAKE-5PILE ?auto_202238 ?auto_202239 ?auto_202240 ?auto_202241 ?auto_202242 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_202246 - BLOCK
      ?auto_202247 - BLOCK
      ?auto_202248 - BLOCK
      ?auto_202249 - BLOCK
      ?auto_202250 - BLOCK
    )
    :vars
    (
      ?auto_202252 - BLOCK
      ?auto_202251 - BLOCK
      ?auto_202253 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_202252 ?auto_202250 ) ( ON-TABLE ?auto_202246 ) ( ON ?auto_202247 ?auto_202246 ) ( ON ?auto_202248 ?auto_202247 ) ( ON ?auto_202249 ?auto_202248 ) ( ON ?auto_202250 ?auto_202249 ) ( not ( = ?auto_202246 ?auto_202247 ) ) ( not ( = ?auto_202246 ?auto_202248 ) ) ( not ( = ?auto_202246 ?auto_202249 ) ) ( not ( = ?auto_202246 ?auto_202250 ) ) ( not ( = ?auto_202246 ?auto_202252 ) ) ( not ( = ?auto_202247 ?auto_202248 ) ) ( not ( = ?auto_202247 ?auto_202249 ) ) ( not ( = ?auto_202247 ?auto_202250 ) ) ( not ( = ?auto_202247 ?auto_202252 ) ) ( not ( = ?auto_202248 ?auto_202249 ) ) ( not ( = ?auto_202248 ?auto_202250 ) ) ( not ( = ?auto_202248 ?auto_202252 ) ) ( not ( = ?auto_202249 ?auto_202250 ) ) ( not ( = ?auto_202249 ?auto_202252 ) ) ( not ( = ?auto_202250 ?auto_202252 ) ) ( not ( = ?auto_202246 ?auto_202251 ) ) ( not ( = ?auto_202246 ?auto_202253 ) ) ( not ( = ?auto_202247 ?auto_202251 ) ) ( not ( = ?auto_202247 ?auto_202253 ) ) ( not ( = ?auto_202248 ?auto_202251 ) ) ( not ( = ?auto_202248 ?auto_202253 ) ) ( not ( = ?auto_202249 ?auto_202251 ) ) ( not ( = ?auto_202249 ?auto_202253 ) ) ( not ( = ?auto_202250 ?auto_202251 ) ) ( not ( = ?auto_202250 ?auto_202253 ) ) ( not ( = ?auto_202252 ?auto_202251 ) ) ( not ( = ?auto_202252 ?auto_202253 ) ) ( not ( = ?auto_202251 ?auto_202253 ) ) ( ON ?auto_202251 ?auto_202252 ) ( ON ?auto_202253 ?auto_202251 ) ( CLEAR ?auto_202253 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_202246 ?auto_202247 ?auto_202248 ?auto_202249 ?auto_202250 ?auto_202252 ?auto_202251 )
      ( MAKE-5PILE ?auto_202246 ?auto_202247 ?auto_202248 ?auto_202249 ?auto_202250 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_202254 - BLOCK
      ?auto_202255 - BLOCK
      ?auto_202256 - BLOCK
      ?auto_202257 - BLOCK
      ?auto_202258 - BLOCK
    )
    :vars
    (
      ?auto_202261 - BLOCK
      ?auto_202260 - BLOCK
      ?auto_202259 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_202261 ?auto_202258 ) ( ON-TABLE ?auto_202254 ) ( ON ?auto_202255 ?auto_202254 ) ( ON ?auto_202256 ?auto_202255 ) ( ON ?auto_202257 ?auto_202256 ) ( ON ?auto_202258 ?auto_202257 ) ( not ( = ?auto_202254 ?auto_202255 ) ) ( not ( = ?auto_202254 ?auto_202256 ) ) ( not ( = ?auto_202254 ?auto_202257 ) ) ( not ( = ?auto_202254 ?auto_202258 ) ) ( not ( = ?auto_202254 ?auto_202261 ) ) ( not ( = ?auto_202255 ?auto_202256 ) ) ( not ( = ?auto_202255 ?auto_202257 ) ) ( not ( = ?auto_202255 ?auto_202258 ) ) ( not ( = ?auto_202255 ?auto_202261 ) ) ( not ( = ?auto_202256 ?auto_202257 ) ) ( not ( = ?auto_202256 ?auto_202258 ) ) ( not ( = ?auto_202256 ?auto_202261 ) ) ( not ( = ?auto_202257 ?auto_202258 ) ) ( not ( = ?auto_202257 ?auto_202261 ) ) ( not ( = ?auto_202258 ?auto_202261 ) ) ( not ( = ?auto_202254 ?auto_202260 ) ) ( not ( = ?auto_202254 ?auto_202259 ) ) ( not ( = ?auto_202255 ?auto_202260 ) ) ( not ( = ?auto_202255 ?auto_202259 ) ) ( not ( = ?auto_202256 ?auto_202260 ) ) ( not ( = ?auto_202256 ?auto_202259 ) ) ( not ( = ?auto_202257 ?auto_202260 ) ) ( not ( = ?auto_202257 ?auto_202259 ) ) ( not ( = ?auto_202258 ?auto_202260 ) ) ( not ( = ?auto_202258 ?auto_202259 ) ) ( not ( = ?auto_202261 ?auto_202260 ) ) ( not ( = ?auto_202261 ?auto_202259 ) ) ( not ( = ?auto_202260 ?auto_202259 ) ) ( ON ?auto_202260 ?auto_202261 ) ( HOLDING ?auto_202259 ) ( CLEAR ?auto_202260 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_202254 ?auto_202255 ?auto_202256 ?auto_202257 ?auto_202258 ?auto_202261 ?auto_202260 ?auto_202259 )
      ( MAKE-5PILE ?auto_202254 ?auto_202255 ?auto_202256 ?auto_202257 ?auto_202258 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_202262 - BLOCK
      ?auto_202263 - BLOCK
      ?auto_202264 - BLOCK
      ?auto_202265 - BLOCK
      ?auto_202266 - BLOCK
    )
    :vars
    (
      ?auto_202268 - BLOCK
      ?auto_202267 - BLOCK
      ?auto_202269 - BLOCK
      ?auto_202270 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_202268 ?auto_202266 ) ( ON-TABLE ?auto_202262 ) ( ON ?auto_202263 ?auto_202262 ) ( ON ?auto_202264 ?auto_202263 ) ( ON ?auto_202265 ?auto_202264 ) ( ON ?auto_202266 ?auto_202265 ) ( not ( = ?auto_202262 ?auto_202263 ) ) ( not ( = ?auto_202262 ?auto_202264 ) ) ( not ( = ?auto_202262 ?auto_202265 ) ) ( not ( = ?auto_202262 ?auto_202266 ) ) ( not ( = ?auto_202262 ?auto_202268 ) ) ( not ( = ?auto_202263 ?auto_202264 ) ) ( not ( = ?auto_202263 ?auto_202265 ) ) ( not ( = ?auto_202263 ?auto_202266 ) ) ( not ( = ?auto_202263 ?auto_202268 ) ) ( not ( = ?auto_202264 ?auto_202265 ) ) ( not ( = ?auto_202264 ?auto_202266 ) ) ( not ( = ?auto_202264 ?auto_202268 ) ) ( not ( = ?auto_202265 ?auto_202266 ) ) ( not ( = ?auto_202265 ?auto_202268 ) ) ( not ( = ?auto_202266 ?auto_202268 ) ) ( not ( = ?auto_202262 ?auto_202267 ) ) ( not ( = ?auto_202262 ?auto_202269 ) ) ( not ( = ?auto_202263 ?auto_202267 ) ) ( not ( = ?auto_202263 ?auto_202269 ) ) ( not ( = ?auto_202264 ?auto_202267 ) ) ( not ( = ?auto_202264 ?auto_202269 ) ) ( not ( = ?auto_202265 ?auto_202267 ) ) ( not ( = ?auto_202265 ?auto_202269 ) ) ( not ( = ?auto_202266 ?auto_202267 ) ) ( not ( = ?auto_202266 ?auto_202269 ) ) ( not ( = ?auto_202268 ?auto_202267 ) ) ( not ( = ?auto_202268 ?auto_202269 ) ) ( not ( = ?auto_202267 ?auto_202269 ) ) ( ON ?auto_202267 ?auto_202268 ) ( CLEAR ?auto_202267 ) ( ON ?auto_202269 ?auto_202270 ) ( CLEAR ?auto_202269 ) ( HAND-EMPTY ) ( not ( = ?auto_202262 ?auto_202270 ) ) ( not ( = ?auto_202263 ?auto_202270 ) ) ( not ( = ?auto_202264 ?auto_202270 ) ) ( not ( = ?auto_202265 ?auto_202270 ) ) ( not ( = ?auto_202266 ?auto_202270 ) ) ( not ( = ?auto_202268 ?auto_202270 ) ) ( not ( = ?auto_202267 ?auto_202270 ) ) ( not ( = ?auto_202269 ?auto_202270 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_202269 ?auto_202270 )
      ( MAKE-5PILE ?auto_202262 ?auto_202263 ?auto_202264 ?auto_202265 ?auto_202266 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_202271 - BLOCK
      ?auto_202272 - BLOCK
      ?auto_202273 - BLOCK
      ?auto_202274 - BLOCK
      ?auto_202275 - BLOCK
    )
    :vars
    (
      ?auto_202279 - BLOCK
      ?auto_202276 - BLOCK
      ?auto_202278 - BLOCK
      ?auto_202277 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_202279 ?auto_202275 ) ( ON-TABLE ?auto_202271 ) ( ON ?auto_202272 ?auto_202271 ) ( ON ?auto_202273 ?auto_202272 ) ( ON ?auto_202274 ?auto_202273 ) ( ON ?auto_202275 ?auto_202274 ) ( not ( = ?auto_202271 ?auto_202272 ) ) ( not ( = ?auto_202271 ?auto_202273 ) ) ( not ( = ?auto_202271 ?auto_202274 ) ) ( not ( = ?auto_202271 ?auto_202275 ) ) ( not ( = ?auto_202271 ?auto_202279 ) ) ( not ( = ?auto_202272 ?auto_202273 ) ) ( not ( = ?auto_202272 ?auto_202274 ) ) ( not ( = ?auto_202272 ?auto_202275 ) ) ( not ( = ?auto_202272 ?auto_202279 ) ) ( not ( = ?auto_202273 ?auto_202274 ) ) ( not ( = ?auto_202273 ?auto_202275 ) ) ( not ( = ?auto_202273 ?auto_202279 ) ) ( not ( = ?auto_202274 ?auto_202275 ) ) ( not ( = ?auto_202274 ?auto_202279 ) ) ( not ( = ?auto_202275 ?auto_202279 ) ) ( not ( = ?auto_202271 ?auto_202276 ) ) ( not ( = ?auto_202271 ?auto_202278 ) ) ( not ( = ?auto_202272 ?auto_202276 ) ) ( not ( = ?auto_202272 ?auto_202278 ) ) ( not ( = ?auto_202273 ?auto_202276 ) ) ( not ( = ?auto_202273 ?auto_202278 ) ) ( not ( = ?auto_202274 ?auto_202276 ) ) ( not ( = ?auto_202274 ?auto_202278 ) ) ( not ( = ?auto_202275 ?auto_202276 ) ) ( not ( = ?auto_202275 ?auto_202278 ) ) ( not ( = ?auto_202279 ?auto_202276 ) ) ( not ( = ?auto_202279 ?auto_202278 ) ) ( not ( = ?auto_202276 ?auto_202278 ) ) ( ON ?auto_202278 ?auto_202277 ) ( CLEAR ?auto_202278 ) ( not ( = ?auto_202271 ?auto_202277 ) ) ( not ( = ?auto_202272 ?auto_202277 ) ) ( not ( = ?auto_202273 ?auto_202277 ) ) ( not ( = ?auto_202274 ?auto_202277 ) ) ( not ( = ?auto_202275 ?auto_202277 ) ) ( not ( = ?auto_202279 ?auto_202277 ) ) ( not ( = ?auto_202276 ?auto_202277 ) ) ( not ( = ?auto_202278 ?auto_202277 ) ) ( HOLDING ?auto_202276 ) ( CLEAR ?auto_202279 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_202271 ?auto_202272 ?auto_202273 ?auto_202274 ?auto_202275 ?auto_202279 ?auto_202276 )
      ( MAKE-5PILE ?auto_202271 ?auto_202272 ?auto_202273 ?auto_202274 ?auto_202275 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_202280 - BLOCK
      ?auto_202281 - BLOCK
      ?auto_202282 - BLOCK
      ?auto_202283 - BLOCK
      ?auto_202284 - BLOCK
    )
    :vars
    (
      ?auto_202285 - BLOCK
      ?auto_202287 - BLOCK
      ?auto_202286 - BLOCK
      ?auto_202288 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_202285 ?auto_202284 ) ( ON-TABLE ?auto_202280 ) ( ON ?auto_202281 ?auto_202280 ) ( ON ?auto_202282 ?auto_202281 ) ( ON ?auto_202283 ?auto_202282 ) ( ON ?auto_202284 ?auto_202283 ) ( not ( = ?auto_202280 ?auto_202281 ) ) ( not ( = ?auto_202280 ?auto_202282 ) ) ( not ( = ?auto_202280 ?auto_202283 ) ) ( not ( = ?auto_202280 ?auto_202284 ) ) ( not ( = ?auto_202280 ?auto_202285 ) ) ( not ( = ?auto_202281 ?auto_202282 ) ) ( not ( = ?auto_202281 ?auto_202283 ) ) ( not ( = ?auto_202281 ?auto_202284 ) ) ( not ( = ?auto_202281 ?auto_202285 ) ) ( not ( = ?auto_202282 ?auto_202283 ) ) ( not ( = ?auto_202282 ?auto_202284 ) ) ( not ( = ?auto_202282 ?auto_202285 ) ) ( not ( = ?auto_202283 ?auto_202284 ) ) ( not ( = ?auto_202283 ?auto_202285 ) ) ( not ( = ?auto_202284 ?auto_202285 ) ) ( not ( = ?auto_202280 ?auto_202287 ) ) ( not ( = ?auto_202280 ?auto_202286 ) ) ( not ( = ?auto_202281 ?auto_202287 ) ) ( not ( = ?auto_202281 ?auto_202286 ) ) ( not ( = ?auto_202282 ?auto_202287 ) ) ( not ( = ?auto_202282 ?auto_202286 ) ) ( not ( = ?auto_202283 ?auto_202287 ) ) ( not ( = ?auto_202283 ?auto_202286 ) ) ( not ( = ?auto_202284 ?auto_202287 ) ) ( not ( = ?auto_202284 ?auto_202286 ) ) ( not ( = ?auto_202285 ?auto_202287 ) ) ( not ( = ?auto_202285 ?auto_202286 ) ) ( not ( = ?auto_202287 ?auto_202286 ) ) ( ON ?auto_202286 ?auto_202288 ) ( not ( = ?auto_202280 ?auto_202288 ) ) ( not ( = ?auto_202281 ?auto_202288 ) ) ( not ( = ?auto_202282 ?auto_202288 ) ) ( not ( = ?auto_202283 ?auto_202288 ) ) ( not ( = ?auto_202284 ?auto_202288 ) ) ( not ( = ?auto_202285 ?auto_202288 ) ) ( not ( = ?auto_202287 ?auto_202288 ) ) ( not ( = ?auto_202286 ?auto_202288 ) ) ( CLEAR ?auto_202285 ) ( ON ?auto_202287 ?auto_202286 ) ( CLEAR ?auto_202287 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_202288 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_202288 ?auto_202286 )
      ( MAKE-5PILE ?auto_202280 ?auto_202281 ?auto_202282 ?auto_202283 ?auto_202284 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_202307 - BLOCK
      ?auto_202308 - BLOCK
      ?auto_202309 - BLOCK
      ?auto_202310 - BLOCK
      ?auto_202311 - BLOCK
    )
    :vars
    (
      ?auto_202313 - BLOCK
      ?auto_202312 - BLOCK
      ?auto_202315 - BLOCK
      ?auto_202314 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_202307 ) ( ON ?auto_202308 ?auto_202307 ) ( ON ?auto_202309 ?auto_202308 ) ( ON ?auto_202310 ?auto_202309 ) ( not ( = ?auto_202307 ?auto_202308 ) ) ( not ( = ?auto_202307 ?auto_202309 ) ) ( not ( = ?auto_202307 ?auto_202310 ) ) ( not ( = ?auto_202307 ?auto_202311 ) ) ( not ( = ?auto_202307 ?auto_202313 ) ) ( not ( = ?auto_202308 ?auto_202309 ) ) ( not ( = ?auto_202308 ?auto_202310 ) ) ( not ( = ?auto_202308 ?auto_202311 ) ) ( not ( = ?auto_202308 ?auto_202313 ) ) ( not ( = ?auto_202309 ?auto_202310 ) ) ( not ( = ?auto_202309 ?auto_202311 ) ) ( not ( = ?auto_202309 ?auto_202313 ) ) ( not ( = ?auto_202310 ?auto_202311 ) ) ( not ( = ?auto_202310 ?auto_202313 ) ) ( not ( = ?auto_202311 ?auto_202313 ) ) ( not ( = ?auto_202307 ?auto_202312 ) ) ( not ( = ?auto_202307 ?auto_202315 ) ) ( not ( = ?auto_202308 ?auto_202312 ) ) ( not ( = ?auto_202308 ?auto_202315 ) ) ( not ( = ?auto_202309 ?auto_202312 ) ) ( not ( = ?auto_202309 ?auto_202315 ) ) ( not ( = ?auto_202310 ?auto_202312 ) ) ( not ( = ?auto_202310 ?auto_202315 ) ) ( not ( = ?auto_202311 ?auto_202312 ) ) ( not ( = ?auto_202311 ?auto_202315 ) ) ( not ( = ?auto_202313 ?auto_202312 ) ) ( not ( = ?auto_202313 ?auto_202315 ) ) ( not ( = ?auto_202312 ?auto_202315 ) ) ( ON ?auto_202315 ?auto_202314 ) ( not ( = ?auto_202307 ?auto_202314 ) ) ( not ( = ?auto_202308 ?auto_202314 ) ) ( not ( = ?auto_202309 ?auto_202314 ) ) ( not ( = ?auto_202310 ?auto_202314 ) ) ( not ( = ?auto_202311 ?auto_202314 ) ) ( not ( = ?auto_202313 ?auto_202314 ) ) ( not ( = ?auto_202312 ?auto_202314 ) ) ( not ( = ?auto_202315 ?auto_202314 ) ) ( ON ?auto_202312 ?auto_202315 ) ( ON-TABLE ?auto_202314 ) ( ON ?auto_202313 ?auto_202312 ) ( CLEAR ?auto_202313 ) ( HOLDING ?auto_202311 ) ( CLEAR ?auto_202310 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_202307 ?auto_202308 ?auto_202309 ?auto_202310 ?auto_202311 ?auto_202313 )
      ( MAKE-5PILE ?auto_202307 ?auto_202308 ?auto_202309 ?auto_202310 ?auto_202311 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_202316 - BLOCK
      ?auto_202317 - BLOCK
      ?auto_202318 - BLOCK
      ?auto_202319 - BLOCK
      ?auto_202320 - BLOCK
    )
    :vars
    (
      ?auto_202322 - BLOCK
      ?auto_202321 - BLOCK
      ?auto_202324 - BLOCK
      ?auto_202323 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_202316 ) ( ON ?auto_202317 ?auto_202316 ) ( ON ?auto_202318 ?auto_202317 ) ( ON ?auto_202319 ?auto_202318 ) ( not ( = ?auto_202316 ?auto_202317 ) ) ( not ( = ?auto_202316 ?auto_202318 ) ) ( not ( = ?auto_202316 ?auto_202319 ) ) ( not ( = ?auto_202316 ?auto_202320 ) ) ( not ( = ?auto_202316 ?auto_202322 ) ) ( not ( = ?auto_202317 ?auto_202318 ) ) ( not ( = ?auto_202317 ?auto_202319 ) ) ( not ( = ?auto_202317 ?auto_202320 ) ) ( not ( = ?auto_202317 ?auto_202322 ) ) ( not ( = ?auto_202318 ?auto_202319 ) ) ( not ( = ?auto_202318 ?auto_202320 ) ) ( not ( = ?auto_202318 ?auto_202322 ) ) ( not ( = ?auto_202319 ?auto_202320 ) ) ( not ( = ?auto_202319 ?auto_202322 ) ) ( not ( = ?auto_202320 ?auto_202322 ) ) ( not ( = ?auto_202316 ?auto_202321 ) ) ( not ( = ?auto_202316 ?auto_202324 ) ) ( not ( = ?auto_202317 ?auto_202321 ) ) ( not ( = ?auto_202317 ?auto_202324 ) ) ( not ( = ?auto_202318 ?auto_202321 ) ) ( not ( = ?auto_202318 ?auto_202324 ) ) ( not ( = ?auto_202319 ?auto_202321 ) ) ( not ( = ?auto_202319 ?auto_202324 ) ) ( not ( = ?auto_202320 ?auto_202321 ) ) ( not ( = ?auto_202320 ?auto_202324 ) ) ( not ( = ?auto_202322 ?auto_202321 ) ) ( not ( = ?auto_202322 ?auto_202324 ) ) ( not ( = ?auto_202321 ?auto_202324 ) ) ( ON ?auto_202324 ?auto_202323 ) ( not ( = ?auto_202316 ?auto_202323 ) ) ( not ( = ?auto_202317 ?auto_202323 ) ) ( not ( = ?auto_202318 ?auto_202323 ) ) ( not ( = ?auto_202319 ?auto_202323 ) ) ( not ( = ?auto_202320 ?auto_202323 ) ) ( not ( = ?auto_202322 ?auto_202323 ) ) ( not ( = ?auto_202321 ?auto_202323 ) ) ( not ( = ?auto_202324 ?auto_202323 ) ) ( ON ?auto_202321 ?auto_202324 ) ( ON-TABLE ?auto_202323 ) ( ON ?auto_202322 ?auto_202321 ) ( CLEAR ?auto_202319 ) ( ON ?auto_202320 ?auto_202322 ) ( CLEAR ?auto_202320 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_202323 ?auto_202324 ?auto_202321 ?auto_202322 )
      ( MAKE-5PILE ?auto_202316 ?auto_202317 ?auto_202318 ?auto_202319 ?auto_202320 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_202325 - BLOCK
      ?auto_202326 - BLOCK
      ?auto_202327 - BLOCK
      ?auto_202328 - BLOCK
      ?auto_202329 - BLOCK
    )
    :vars
    (
      ?auto_202330 - BLOCK
      ?auto_202332 - BLOCK
      ?auto_202331 - BLOCK
      ?auto_202333 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_202325 ) ( ON ?auto_202326 ?auto_202325 ) ( ON ?auto_202327 ?auto_202326 ) ( not ( = ?auto_202325 ?auto_202326 ) ) ( not ( = ?auto_202325 ?auto_202327 ) ) ( not ( = ?auto_202325 ?auto_202328 ) ) ( not ( = ?auto_202325 ?auto_202329 ) ) ( not ( = ?auto_202325 ?auto_202330 ) ) ( not ( = ?auto_202326 ?auto_202327 ) ) ( not ( = ?auto_202326 ?auto_202328 ) ) ( not ( = ?auto_202326 ?auto_202329 ) ) ( not ( = ?auto_202326 ?auto_202330 ) ) ( not ( = ?auto_202327 ?auto_202328 ) ) ( not ( = ?auto_202327 ?auto_202329 ) ) ( not ( = ?auto_202327 ?auto_202330 ) ) ( not ( = ?auto_202328 ?auto_202329 ) ) ( not ( = ?auto_202328 ?auto_202330 ) ) ( not ( = ?auto_202329 ?auto_202330 ) ) ( not ( = ?auto_202325 ?auto_202332 ) ) ( not ( = ?auto_202325 ?auto_202331 ) ) ( not ( = ?auto_202326 ?auto_202332 ) ) ( not ( = ?auto_202326 ?auto_202331 ) ) ( not ( = ?auto_202327 ?auto_202332 ) ) ( not ( = ?auto_202327 ?auto_202331 ) ) ( not ( = ?auto_202328 ?auto_202332 ) ) ( not ( = ?auto_202328 ?auto_202331 ) ) ( not ( = ?auto_202329 ?auto_202332 ) ) ( not ( = ?auto_202329 ?auto_202331 ) ) ( not ( = ?auto_202330 ?auto_202332 ) ) ( not ( = ?auto_202330 ?auto_202331 ) ) ( not ( = ?auto_202332 ?auto_202331 ) ) ( ON ?auto_202331 ?auto_202333 ) ( not ( = ?auto_202325 ?auto_202333 ) ) ( not ( = ?auto_202326 ?auto_202333 ) ) ( not ( = ?auto_202327 ?auto_202333 ) ) ( not ( = ?auto_202328 ?auto_202333 ) ) ( not ( = ?auto_202329 ?auto_202333 ) ) ( not ( = ?auto_202330 ?auto_202333 ) ) ( not ( = ?auto_202332 ?auto_202333 ) ) ( not ( = ?auto_202331 ?auto_202333 ) ) ( ON ?auto_202332 ?auto_202331 ) ( ON-TABLE ?auto_202333 ) ( ON ?auto_202330 ?auto_202332 ) ( ON ?auto_202329 ?auto_202330 ) ( CLEAR ?auto_202329 ) ( HOLDING ?auto_202328 ) ( CLEAR ?auto_202327 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_202325 ?auto_202326 ?auto_202327 ?auto_202328 )
      ( MAKE-5PILE ?auto_202325 ?auto_202326 ?auto_202327 ?auto_202328 ?auto_202329 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_202334 - BLOCK
      ?auto_202335 - BLOCK
      ?auto_202336 - BLOCK
      ?auto_202337 - BLOCK
      ?auto_202338 - BLOCK
    )
    :vars
    (
      ?auto_202339 - BLOCK
      ?auto_202341 - BLOCK
      ?auto_202340 - BLOCK
      ?auto_202342 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_202334 ) ( ON ?auto_202335 ?auto_202334 ) ( ON ?auto_202336 ?auto_202335 ) ( not ( = ?auto_202334 ?auto_202335 ) ) ( not ( = ?auto_202334 ?auto_202336 ) ) ( not ( = ?auto_202334 ?auto_202337 ) ) ( not ( = ?auto_202334 ?auto_202338 ) ) ( not ( = ?auto_202334 ?auto_202339 ) ) ( not ( = ?auto_202335 ?auto_202336 ) ) ( not ( = ?auto_202335 ?auto_202337 ) ) ( not ( = ?auto_202335 ?auto_202338 ) ) ( not ( = ?auto_202335 ?auto_202339 ) ) ( not ( = ?auto_202336 ?auto_202337 ) ) ( not ( = ?auto_202336 ?auto_202338 ) ) ( not ( = ?auto_202336 ?auto_202339 ) ) ( not ( = ?auto_202337 ?auto_202338 ) ) ( not ( = ?auto_202337 ?auto_202339 ) ) ( not ( = ?auto_202338 ?auto_202339 ) ) ( not ( = ?auto_202334 ?auto_202341 ) ) ( not ( = ?auto_202334 ?auto_202340 ) ) ( not ( = ?auto_202335 ?auto_202341 ) ) ( not ( = ?auto_202335 ?auto_202340 ) ) ( not ( = ?auto_202336 ?auto_202341 ) ) ( not ( = ?auto_202336 ?auto_202340 ) ) ( not ( = ?auto_202337 ?auto_202341 ) ) ( not ( = ?auto_202337 ?auto_202340 ) ) ( not ( = ?auto_202338 ?auto_202341 ) ) ( not ( = ?auto_202338 ?auto_202340 ) ) ( not ( = ?auto_202339 ?auto_202341 ) ) ( not ( = ?auto_202339 ?auto_202340 ) ) ( not ( = ?auto_202341 ?auto_202340 ) ) ( ON ?auto_202340 ?auto_202342 ) ( not ( = ?auto_202334 ?auto_202342 ) ) ( not ( = ?auto_202335 ?auto_202342 ) ) ( not ( = ?auto_202336 ?auto_202342 ) ) ( not ( = ?auto_202337 ?auto_202342 ) ) ( not ( = ?auto_202338 ?auto_202342 ) ) ( not ( = ?auto_202339 ?auto_202342 ) ) ( not ( = ?auto_202341 ?auto_202342 ) ) ( not ( = ?auto_202340 ?auto_202342 ) ) ( ON ?auto_202341 ?auto_202340 ) ( ON-TABLE ?auto_202342 ) ( ON ?auto_202339 ?auto_202341 ) ( ON ?auto_202338 ?auto_202339 ) ( CLEAR ?auto_202336 ) ( ON ?auto_202337 ?auto_202338 ) ( CLEAR ?auto_202337 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_202342 ?auto_202340 ?auto_202341 ?auto_202339 ?auto_202338 )
      ( MAKE-5PILE ?auto_202334 ?auto_202335 ?auto_202336 ?auto_202337 ?auto_202338 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_202343 - BLOCK
      ?auto_202344 - BLOCK
      ?auto_202345 - BLOCK
      ?auto_202346 - BLOCK
      ?auto_202347 - BLOCK
    )
    :vars
    (
      ?auto_202351 - BLOCK
      ?auto_202348 - BLOCK
      ?auto_202350 - BLOCK
      ?auto_202349 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_202343 ) ( ON ?auto_202344 ?auto_202343 ) ( not ( = ?auto_202343 ?auto_202344 ) ) ( not ( = ?auto_202343 ?auto_202345 ) ) ( not ( = ?auto_202343 ?auto_202346 ) ) ( not ( = ?auto_202343 ?auto_202347 ) ) ( not ( = ?auto_202343 ?auto_202351 ) ) ( not ( = ?auto_202344 ?auto_202345 ) ) ( not ( = ?auto_202344 ?auto_202346 ) ) ( not ( = ?auto_202344 ?auto_202347 ) ) ( not ( = ?auto_202344 ?auto_202351 ) ) ( not ( = ?auto_202345 ?auto_202346 ) ) ( not ( = ?auto_202345 ?auto_202347 ) ) ( not ( = ?auto_202345 ?auto_202351 ) ) ( not ( = ?auto_202346 ?auto_202347 ) ) ( not ( = ?auto_202346 ?auto_202351 ) ) ( not ( = ?auto_202347 ?auto_202351 ) ) ( not ( = ?auto_202343 ?auto_202348 ) ) ( not ( = ?auto_202343 ?auto_202350 ) ) ( not ( = ?auto_202344 ?auto_202348 ) ) ( not ( = ?auto_202344 ?auto_202350 ) ) ( not ( = ?auto_202345 ?auto_202348 ) ) ( not ( = ?auto_202345 ?auto_202350 ) ) ( not ( = ?auto_202346 ?auto_202348 ) ) ( not ( = ?auto_202346 ?auto_202350 ) ) ( not ( = ?auto_202347 ?auto_202348 ) ) ( not ( = ?auto_202347 ?auto_202350 ) ) ( not ( = ?auto_202351 ?auto_202348 ) ) ( not ( = ?auto_202351 ?auto_202350 ) ) ( not ( = ?auto_202348 ?auto_202350 ) ) ( ON ?auto_202350 ?auto_202349 ) ( not ( = ?auto_202343 ?auto_202349 ) ) ( not ( = ?auto_202344 ?auto_202349 ) ) ( not ( = ?auto_202345 ?auto_202349 ) ) ( not ( = ?auto_202346 ?auto_202349 ) ) ( not ( = ?auto_202347 ?auto_202349 ) ) ( not ( = ?auto_202351 ?auto_202349 ) ) ( not ( = ?auto_202348 ?auto_202349 ) ) ( not ( = ?auto_202350 ?auto_202349 ) ) ( ON ?auto_202348 ?auto_202350 ) ( ON-TABLE ?auto_202349 ) ( ON ?auto_202351 ?auto_202348 ) ( ON ?auto_202347 ?auto_202351 ) ( ON ?auto_202346 ?auto_202347 ) ( CLEAR ?auto_202346 ) ( HOLDING ?auto_202345 ) ( CLEAR ?auto_202344 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_202343 ?auto_202344 ?auto_202345 )
      ( MAKE-5PILE ?auto_202343 ?auto_202344 ?auto_202345 ?auto_202346 ?auto_202347 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_202352 - BLOCK
      ?auto_202353 - BLOCK
      ?auto_202354 - BLOCK
      ?auto_202355 - BLOCK
      ?auto_202356 - BLOCK
    )
    :vars
    (
      ?auto_202357 - BLOCK
      ?auto_202359 - BLOCK
      ?auto_202358 - BLOCK
      ?auto_202360 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_202352 ) ( ON ?auto_202353 ?auto_202352 ) ( not ( = ?auto_202352 ?auto_202353 ) ) ( not ( = ?auto_202352 ?auto_202354 ) ) ( not ( = ?auto_202352 ?auto_202355 ) ) ( not ( = ?auto_202352 ?auto_202356 ) ) ( not ( = ?auto_202352 ?auto_202357 ) ) ( not ( = ?auto_202353 ?auto_202354 ) ) ( not ( = ?auto_202353 ?auto_202355 ) ) ( not ( = ?auto_202353 ?auto_202356 ) ) ( not ( = ?auto_202353 ?auto_202357 ) ) ( not ( = ?auto_202354 ?auto_202355 ) ) ( not ( = ?auto_202354 ?auto_202356 ) ) ( not ( = ?auto_202354 ?auto_202357 ) ) ( not ( = ?auto_202355 ?auto_202356 ) ) ( not ( = ?auto_202355 ?auto_202357 ) ) ( not ( = ?auto_202356 ?auto_202357 ) ) ( not ( = ?auto_202352 ?auto_202359 ) ) ( not ( = ?auto_202352 ?auto_202358 ) ) ( not ( = ?auto_202353 ?auto_202359 ) ) ( not ( = ?auto_202353 ?auto_202358 ) ) ( not ( = ?auto_202354 ?auto_202359 ) ) ( not ( = ?auto_202354 ?auto_202358 ) ) ( not ( = ?auto_202355 ?auto_202359 ) ) ( not ( = ?auto_202355 ?auto_202358 ) ) ( not ( = ?auto_202356 ?auto_202359 ) ) ( not ( = ?auto_202356 ?auto_202358 ) ) ( not ( = ?auto_202357 ?auto_202359 ) ) ( not ( = ?auto_202357 ?auto_202358 ) ) ( not ( = ?auto_202359 ?auto_202358 ) ) ( ON ?auto_202358 ?auto_202360 ) ( not ( = ?auto_202352 ?auto_202360 ) ) ( not ( = ?auto_202353 ?auto_202360 ) ) ( not ( = ?auto_202354 ?auto_202360 ) ) ( not ( = ?auto_202355 ?auto_202360 ) ) ( not ( = ?auto_202356 ?auto_202360 ) ) ( not ( = ?auto_202357 ?auto_202360 ) ) ( not ( = ?auto_202359 ?auto_202360 ) ) ( not ( = ?auto_202358 ?auto_202360 ) ) ( ON ?auto_202359 ?auto_202358 ) ( ON-TABLE ?auto_202360 ) ( ON ?auto_202357 ?auto_202359 ) ( ON ?auto_202356 ?auto_202357 ) ( ON ?auto_202355 ?auto_202356 ) ( CLEAR ?auto_202353 ) ( ON ?auto_202354 ?auto_202355 ) ( CLEAR ?auto_202354 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_202360 ?auto_202358 ?auto_202359 ?auto_202357 ?auto_202356 ?auto_202355 )
      ( MAKE-5PILE ?auto_202352 ?auto_202353 ?auto_202354 ?auto_202355 ?auto_202356 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_202361 - BLOCK
      ?auto_202362 - BLOCK
      ?auto_202363 - BLOCK
      ?auto_202364 - BLOCK
      ?auto_202365 - BLOCK
    )
    :vars
    (
      ?auto_202369 - BLOCK
      ?auto_202368 - BLOCK
      ?auto_202366 - BLOCK
      ?auto_202367 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_202361 ) ( not ( = ?auto_202361 ?auto_202362 ) ) ( not ( = ?auto_202361 ?auto_202363 ) ) ( not ( = ?auto_202361 ?auto_202364 ) ) ( not ( = ?auto_202361 ?auto_202365 ) ) ( not ( = ?auto_202361 ?auto_202369 ) ) ( not ( = ?auto_202362 ?auto_202363 ) ) ( not ( = ?auto_202362 ?auto_202364 ) ) ( not ( = ?auto_202362 ?auto_202365 ) ) ( not ( = ?auto_202362 ?auto_202369 ) ) ( not ( = ?auto_202363 ?auto_202364 ) ) ( not ( = ?auto_202363 ?auto_202365 ) ) ( not ( = ?auto_202363 ?auto_202369 ) ) ( not ( = ?auto_202364 ?auto_202365 ) ) ( not ( = ?auto_202364 ?auto_202369 ) ) ( not ( = ?auto_202365 ?auto_202369 ) ) ( not ( = ?auto_202361 ?auto_202368 ) ) ( not ( = ?auto_202361 ?auto_202366 ) ) ( not ( = ?auto_202362 ?auto_202368 ) ) ( not ( = ?auto_202362 ?auto_202366 ) ) ( not ( = ?auto_202363 ?auto_202368 ) ) ( not ( = ?auto_202363 ?auto_202366 ) ) ( not ( = ?auto_202364 ?auto_202368 ) ) ( not ( = ?auto_202364 ?auto_202366 ) ) ( not ( = ?auto_202365 ?auto_202368 ) ) ( not ( = ?auto_202365 ?auto_202366 ) ) ( not ( = ?auto_202369 ?auto_202368 ) ) ( not ( = ?auto_202369 ?auto_202366 ) ) ( not ( = ?auto_202368 ?auto_202366 ) ) ( ON ?auto_202366 ?auto_202367 ) ( not ( = ?auto_202361 ?auto_202367 ) ) ( not ( = ?auto_202362 ?auto_202367 ) ) ( not ( = ?auto_202363 ?auto_202367 ) ) ( not ( = ?auto_202364 ?auto_202367 ) ) ( not ( = ?auto_202365 ?auto_202367 ) ) ( not ( = ?auto_202369 ?auto_202367 ) ) ( not ( = ?auto_202368 ?auto_202367 ) ) ( not ( = ?auto_202366 ?auto_202367 ) ) ( ON ?auto_202368 ?auto_202366 ) ( ON-TABLE ?auto_202367 ) ( ON ?auto_202369 ?auto_202368 ) ( ON ?auto_202365 ?auto_202369 ) ( ON ?auto_202364 ?auto_202365 ) ( ON ?auto_202363 ?auto_202364 ) ( CLEAR ?auto_202363 ) ( HOLDING ?auto_202362 ) ( CLEAR ?auto_202361 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_202361 ?auto_202362 )
      ( MAKE-5PILE ?auto_202361 ?auto_202362 ?auto_202363 ?auto_202364 ?auto_202365 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_202370 - BLOCK
      ?auto_202371 - BLOCK
      ?auto_202372 - BLOCK
      ?auto_202373 - BLOCK
      ?auto_202374 - BLOCK
    )
    :vars
    (
      ?auto_202376 - BLOCK
      ?auto_202377 - BLOCK
      ?auto_202378 - BLOCK
      ?auto_202375 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_202370 ) ( not ( = ?auto_202370 ?auto_202371 ) ) ( not ( = ?auto_202370 ?auto_202372 ) ) ( not ( = ?auto_202370 ?auto_202373 ) ) ( not ( = ?auto_202370 ?auto_202374 ) ) ( not ( = ?auto_202370 ?auto_202376 ) ) ( not ( = ?auto_202371 ?auto_202372 ) ) ( not ( = ?auto_202371 ?auto_202373 ) ) ( not ( = ?auto_202371 ?auto_202374 ) ) ( not ( = ?auto_202371 ?auto_202376 ) ) ( not ( = ?auto_202372 ?auto_202373 ) ) ( not ( = ?auto_202372 ?auto_202374 ) ) ( not ( = ?auto_202372 ?auto_202376 ) ) ( not ( = ?auto_202373 ?auto_202374 ) ) ( not ( = ?auto_202373 ?auto_202376 ) ) ( not ( = ?auto_202374 ?auto_202376 ) ) ( not ( = ?auto_202370 ?auto_202377 ) ) ( not ( = ?auto_202370 ?auto_202378 ) ) ( not ( = ?auto_202371 ?auto_202377 ) ) ( not ( = ?auto_202371 ?auto_202378 ) ) ( not ( = ?auto_202372 ?auto_202377 ) ) ( not ( = ?auto_202372 ?auto_202378 ) ) ( not ( = ?auto_202373 ?auto_202377 ) ) ( not ( = ?auto_202373 ?auto_202378 ) ) ( not ( = ?auto_202374 ?auto_202377 ) ) ( not ( = ?auto_202374 ?auto_202378 ) ) ( not ( = ?auto_202376 ?auto_202377 ) ) ( not ( = ?auto_202376 ?auto_202378 ) ) ( not ( = ?auto_202377 ?auto_202378 ) ) ( ON ?auto_202378 ?auto_202375 ) ( not ( = ?auto_202370 ?auto_202375 ) ) ( not ( = ?auto_202371 ?auto_202375 ) ) ( not ( = ?auto_202372 ?auto_202375 ) ) ( not ( = ?auto_202373 ?auto_202375 ) ) ( not ( = ?auto_202374 ?auto_202375 ) ) ( not ( = ?auto_202376 ?auto_202375 ) ) ( not ( = ?auto_202377 ?auto_202375 ) ) ( not ( = ?auto_202378 ?auto_202375 ) ) ( ON ?auto_202377 ?auto_202378 ) ( ON-TABLE ?auto_202375 ) ( ON ?auto_202376 ?auto_202377 ) ( ON ?auto_202374 ?auto_202376 ) ( ON ?auto_202373 ?auto_202374 ) ( ON ?auto_202372 ?auto_202373 ) ( CLEAR ?auto_202370 ) ( ON ?auto_202371 ?auto_202372 ) ( CLEAR ?auto_202371 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_202375 ?auto_202378 ?auto_202377 ?auto_202376 ?auto_202374 ?auto_202373 ?auto_202372 )
      ( MAKE-5PILE ?auto_202370 ?auto_202371 ?auto_202372 ?auto_202373 ?auto_202374 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_202379 - BLOCK
      ?auto_202380 - BLOCK
      ?auto_202381 - BLOCK
      ?auto_202382 - BLOCK
      ?auto_202383 - BLOCK
    )
    :vars
    (
      ?auto_202387 - BLOCK
      ?auto_202385 - BLOCK
      ?auto_202386 - BLOCK
      ?auto_202384 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_202379 ?auto_202380 ) ) ( not ( = ?auto_202379 ?auto_202381 ) ) ( not ( = ?auto_202379 ?auto_202382 ) ) ( not ( = ?auto_202379 ?auto_202383 ) ) ( not ( = ?auto_202379 ?auto_202387 ) ) ( not ( = ?auto_202380 ?auto_202381 ) ) ( not ( = ?auto_202380 ?auto_202382 ) ) ( not ( = ?auto_202380 ?auto_202383 ) ) ( not ( = ?auto_202380 ?auto_202387 ) ) ( not ( = ?auto_202381 ?auto_202382 ) ) ( not ( = ?auto_202381 ?auto_202383 ) ) ( not ( = ?auto_202381 ?auto_202387 ) ) ( not ( = ?auto_202382 ?auto_202383 ) ) ( not ( = ?auto_202382 ?auto_202387 ) ) ( not ( = ?auto_202383 ?auto_202387 ) ) ( not ( = ?auto_202379 ?auto_202385 ) ) ( not ( = ?auto_202379 ?auto_202386 ) ) ( not ( = ?auto_202380 ?auto_202385 ) ) ( not ( = ?auto_202380 ?auto_202386 ) ) ( not ( = ?auto_202381 ?auto_202385 ) ) ( not ( = ?auto_202381 ?auto_202386 ) ) ( not ( = ?auto_202382 ?auto_202385 ) ) ( not ( = ?auto_202382 ?auto_202386 ) ) ( not ( = ?auto_202383 ?auto_202385 ) ) ( not ( = ?auto_202383 ?auto_202386 ) ) ( not ( = ?auto_202387 ?auto_202385 ) ) ( not ( = ?auto_202387 ?auto_202386 ) ) ( not ( = ?auto_202385 ?auto_202386 ) ) ( ON ?auto_202386 ?auto_202384 ) ( not ( = ?auto_202379 ?auto_202384 ) ) ( not ( = ?auto_202380 ?auto_202384 ) ) ( not ( = ?auto_202381 ?auto_202384 ) ) ( not ( = ?auto_202382 ?auto_202384 ) ) ( not ( = ?auto_202383 ?auto_202384 ) ) ( not ( = ?auto_202387 ?auto_202384 ) ) ( not ( = ?auto_202385 ?auto_202384 ) ) ( not ( = ?auto_202386 ?auto_202384 ) ) ( ON ?auto_202385 ?auto_202386 ) ( ON-TABLE ?auto_202384 ) ( ON ?auto_202387 ?auto_202385 ) ( ON ?auto_202383 ?auto_202387 ) ( ON ?auto_202382 ?auto_202383 ) ( ON ?auto_202381 ?auto_202382 ) ( ON ?auto_202380 ?auto_202381 ) ( CLEAR ?auto_202380 ) ( HOLDING ?auto_202379 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_202379 )
      ( MAKE-5PILE ?auto_202379 ?auto_202380 ?auto_202381 ?auto_202382 ?auto_202383 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_202388 - BLOCK
      ?auto_202389 - BLOCK
      ?auto_202390 - BLOCK
      ?auto_202391 - BLOCK
      ?auto_202392 - BLOCK
    )
    :vars
    (
      ?auto_202396 - BLOCK
      ?auto_202395 - BLOCK
      ?auto_202394 - BLOCK
      ?auto_202393 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_202388 ?auto_202389 ) ) ( not ( = ?auto_202388 ?auto_202390 ) ) ( not ( = ?auto_202388 ?auto_202391 ) ) ( not ( = ?auto_202388 ?auto_202392 ) ) ( not ( = ?auto_202388 ?auto_202396 ) ) ( not ( = ?auto_202389 ?auto_202390 ) ) ( not ( = ?auto_202389 ?auto_202391 ) ) ( not ( = ?auto_202389 ?auto_202392 ) ) ( not ( = ?auto_202389 ?auto_202396 ) ) ( not ( = ?auto_202390 ?auto_202391 ) ) ( not ( = ?auto_202390 ?auto_202392 ) ) ( not ( = ?auto_202390 ?auto_202396 ) ) ( not ( = ?auto_202391 ?auto_202392 ) ) ( not ( = ?auto_202391 ?auto_202396 ) ) ( not ( = ?auto_202392 ?auto_202396 ) ) ( not ( = ?auto_202388 ?auto_202395 ) ) ( not ( = ?auto_202388 ?auto_202394 ) ) ( not ( = ?auto_202389 ?auto_202395 ) ) ( not ( = ?auto_202389 ?auto_202394 ) ) ( not ( = ?auto_202390 ?auto_202395 ) ) ( not ( = ?auto_202390 ?auto_202394 ) ) ( not ( = ?auto_202391 ?auto_202395 ) ) ( not ( = ?auto_202391 ?auto_202394 ) ) ( not ( = ?auto_202392 ?auto_202395 ) ) ( not ( = ?auto_202392 ?auto_202394 ) ) ( not ( = ?auto_202396 ?auto_202395 ) ) ( not ( = ?auto_202396 ?auto_202394 ) ) ( not ( = ?auto_202395 ?auto_202394 ) ) ( ON ?auto_202394 ?auto_202393 ) ( not ( = ?auto_202388 ?auto_202393 ) ) ( not ( = ?auto_202389 ?auto_202393 ) ) ( not ( = ?auto_202390 ?auto_202393 ) ) ( not ( = ?auto_202391 ?auto_202393 ) ) ( not ( = ?auto_202392 ?auto_202393 ) ) ( not ( = ?auto_202396 ?auto_202393 ) ) ( not ( = ?auto_202395 ?auto_202393 ) ) ( not ( = ?auto_202394 ?auto_202393 ) ) ( ON ?auto_202395 ?auto_202394 ) ( ON-TABLE ?auto_202393 ) ( ON ?auto_202396 ?auto_202395 ) ( ON ?auto_202392 ?auto_202396 ) ( ON ?auto_202391 ?auto_202392 ) ( ON ?auto_202390 ?auto_202391 ) ( ON ?auto_202389 ?auto_202390 ) ( ON ?auto_202388 ?auto_202389 ) ( CLEAR ?auto_202388 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_202393 ?auto_202394 ?auto_202395 ?auto_202396 ?auto_202392 ?auto_202391 ?auto_202390 ?auto_202389 )
      ( MAKE-5PILE ?auto_202388 ?auto_202389 ?auto_202390 ?auto_202391 ?auto_202392 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_202400 - BLOCK
      ?auto_202401 - BLOCK
      ?auto_202402 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_202402 ) ( CLEAR ?auto_202401 ) ( ON-TABLE ?auto_202400 ) ( ON ?auto_202401 ?auto_202400 ) ( not ( = ?auto_202400 ?auto_202401 ) ) ( not ( = ?auto_202400 ?auto_202402 ) ) ( not ( = ?auto_202401 ?auto_202402 ) ) )
    :subtasks
    ( ( !STACK ?auto_202402 ?auto_202401 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_202403 - BLOCK
      ?auto_202404 - BLOCK
      ?auto_202405 - BLOCK
    )
    :vars
    (
      ?auto_202406 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_202404 ) ( ON-TABLE ?auto_202403 ) ( ON ?auto_202404 ?auto_202403 ) ( not ( = ?auto_202403 ?auto_202404 ) ) ( not ( = ?auto_202403 ?auto_202405 ) ) ( not ( = ?auto_202404 ?auto_202405 ) ) ( ON ?auto_202405 ?auto_202406 ) ( CLEAR ?auto_202405 ) ( HAND-EMPTY ) ( not ( = ?auto_202403 ?auto_202406 ) ) ( not ( = ?auto_202404 ?auto_202406 ) ) ( not ( = ?auto_202405 ?auto_202406 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_202405 ?auto_202406 )
      ( MAKE-3PILE ?auto_202403 ?auto_202404 ?auto_202405 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_202407 - BLOCK
      ?auto_202408 - BLOCK
      ?auto_202409 - BLOCK
    )
    :vars
    (
      ?auto_202410 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_202407 ) ( not ( = ?auto_202407 ?auto_202408 ) ) ( not ( = ?auto_202407 ?auto_202409 ) ) ( not ( = ?auto_202408 ?auto_202409 ) ) ( ON ?auto_202409 ?auto_202410 ) ( CLEAR ?auto_202409 ) ( not ( = ?auto_202407 ?auto_202410 ) ) ( not ( = ?auto_202408 ?auto_202410 ) ) ( not ( = ?auto_202409 ?auto_202410 ) ) ( HOLDING ?auto_202408 ) ( CLEAR ?auto_202407 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_202407 ?auto_202408 )
      ( MAKE-3PILE ?auto_202407 ?auto_202408 ?auto_202409 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_202411 - BLOCK
      ?auto_202412 - BLOCK
      ?auto_202413 - BLOCK
    )
    :vars
    (
      ?auto_202414 - BLOCK
      ?auto_202415 - BLOCK
      ?auto_202416 - BLOCK
      ?auto_202418 - BLOCK
      ?auto_202417 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_202411 ) ( not ( = ?auto_202411 ?auto_202412 ) ) ( not ( = ?auto_202411 ?auto_202413 ) ) ( not ( = ?auto_202412 ?auto_202413 ) ) ( ON ?auto_202413 ?auto_202414 ) ( not ( = ?auto_202411 ?auto_202414 ) ) ( not ( = ?auto_202412 ?auto_202414 ) ) ( not ( = ?auto_202413 ?auto_202414 ) ) ( CLEAR ?auto_202411 ) ( ON ?auto_202412 ?auto_202413 ) ( CLEAR ?auto_202412 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_202415 ) ( ON ?auto_202416 ?auto_202415 ) ( ON ?auto_202418 ?auto_202416 ) ( ON ?auto_202417 ?auto_202418 ) ( ON ?auto_202414 ?auto_202417 ) ( not ( = ?auto_202415 ?auto_202416 ) ) ( not ( = ?auto_202415 ?auto_202418 ) ) ( not ( = ?auto_202415 ?auto_202417 ) ) ( not ( = ?auto_202415 ?auto_202414 ) ) ( not ( = ?auto_202415 ?auto_202413 ) ) ( not ( = ?auto_202415 ?auto_202412 ) ) ( not ( = ?auto_202416 ?auto_202418 ) ) ( not ( = ?auto_202416 ?auto_202417 ) ) ( not ( = ?auto_202416 ?auto_202414 ) ) ( not ( = ?auto_202416 ?auto_202413 ) ) ( not ( = ?auto_202416 ?auto_202412 ) ) ( not ( = ?auto_202418 ?auto_202417 ) ) ( not ( = ?auto_202418 ?auto_202414 ) ) ( not ( = ?auto_202418 ?auto_202413 ) ) ( not ( = ?auto_202418 ?auto_202412 ) ) ( not ( = ?auto_202417 ?auto_202414 ) ) ( not ( = ?auto_202417 ?auto_202413 ) ) ( not ( = ?auto_202417 ?auto_202412 ) ) ( not ( = ?auto_202411 ?auto_202415 ) ) ( not ( = ?auto_202411 ?auto_202416 ) ) ( not ( = ?auto_202411 ?auto_202418 ) ) ( not ( = ?auto_202411 ?auto_202417 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_202415 ?auto_202416 ?auto_202418 ?auto_202417 ?auto_202414 ?auto_202413 )
      ( MAKE-3PILE ?auto_202411 ?auto_202412 ?auto_202413 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_202419 - BLOCK
      ?auto_202420 - BLOCK
      ?auto_202421 - BLOCK
    )
    :vars
    (
      ?auto_202423 - BLOCK
      ?auto_202426 - BLOCK
      ?auto_202424 - BLOCK
      ?auto_202422 - BLOCK
      ?auto_202425 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_202419 ?auto_202420 ) ) ( not ( = ?auto_202419 ?auto_202421 ) ) ( not ( = ?auto_202420 ?auto_202421 ) ) ( ON ?auto_202421 ?auto_202423 ) ( not ( = ?auto_202419 ?auto_202423 ) ) ( not ( = ?auto_202420 ?auto_202423 ) ) ( not ( = ?auto_202421 ?auto_202423 ) ) ( ON ?auto_202420 ?auto_202421 ) ( CLEAR ?auto_202420 ) ( ON-TABLE ?auto_202426 ) ( ON ?auto_202424 ?auto_202426 ) ( ON ?auto_202422 ?auto_202424 ) ( ON ?auto_202425 ?auto_202422 ) ( ON ?auto_202423 ?auto_202425 ) ( not ( = ?auto_202426 ?auto_202424 ) ) ( not ( = ?auto_202426 ?auto_202422 ) ) ( not ( = ?auto_202426 ?auto_202425 ) ) ( not ( = ?auto_202426 ?auto_202423 ) ) ( not ( = ?auto_202426 ?auto_202421 ) ) ( not ( = ?auto_202426 ?auto_202420 ) ) ( not ( = ?auto_202424 ?auto_202422 ) ) ( not ( = ?auto_202424 ?auto_202425 ) ) ( not ( = ?auto_202424 ?auto_202423 ) ) ( not ( = ?auto_202424 ?auto_202421 ) ) ( not ( = ?auto_202424 ?auto_202420 ) ) ( not ( = ?auto_202422 ?auto_202425 ) ) ( not ( = ?auto_202422 ?auto_202423 ) ) ( not ( = ?auto_202422 ?auto_202421 ) ) ( not ( = ?auto_202422 ?auto_202420 ) ) ( not ( = ?auto_202425 ?auto_202423 ) ) ( not ( = ?auto_202425 ?auto_202421 ) ) ( not ( = ?auto_202425 ?auto_202420 ) ) ( not ( = ?auto_202419 ?auto_202426 ) ) ( not ( = ?auto_202419 ?auto_202424 ) ) ( not ( = ?auto_202419 ?auto_202422 ) ) ( not ( = ?auto_202419 ?auto_202425 ) ) ( HOLDING ?auto_202419 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_202419 )
      ( MAKE-3PILE ?auto_202419 ?auto_202420 ?auto_202421 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_202427 - BLOCK
      ?auto_202428 - BLOCK
      ?auto_202429 - BLOCK
    )
    :vars
    (
      ?auto_202430 - BLOCK
      ?auto_202432 - BLOCK
      ?auto_202433 - BLOCK
      ?auto_202434 - BLOCK
      ?auto_202431 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_202427 ?auto_202428 ) ) ( not ( = ?auto_202427 ?auto_202429 ) ) ( not ( = ?auto_202428 ?auto_202429 ) ) ( ON ?auto_202429 ?auto_202430 ) ( not ( = ?auto_202427 ?auto_202430 ) ) ( not ( = ?auto_202428 ?auto_202430 ) ) ( not ( = ?auto_202429 ?auto_202430 ) ) ( ON ?auto_202428 ?auto_202429 ) ( ON-TABLE ?auto_202432 ) ( ON ?auto_202433 ?auto_202432 ) ( ON ?auto_202434 ?auto_202433 ) ( ON ?auto_202431 ?auto_202434 ) ( ON ?auto_202430 ?auto_202431 ) ( not ( = ?auto_202432 ?auto_202433 ) ) ( not ( = ?auto_202432 ?auto_202434 ) ) ( not ( = ?auto_202432 ?auto_202431 ) ) ( not ( = ?auto_202432 ?auto_202430 ) ) ( not ( = ?auto_202432 ?auto_202429 ) ) ( not ( = ?auto_202432 ?auto_202428 ) ) ( not ( = ?auto_202433 ?auto_202434 ) ) ( not ( = ?auto_202433 ?auto_202431 ) ) ( not ( = ?auto_202433 ?auto_202430 ) ) ( not ( = ?auto_202433 ?auto_202429 ) ) ( not ( = ?auto_202433 ?auto_202428 ) ) ( not ( = ?auto_202434 ?auto_202431 ) ) ( not ( = ?auto_202434 ?auto_202430 ) ) ( not ( = ?auto_202434 ?auto_202429 ) ) ( not ( = ?auto_202434 ?auto_202428 ) ) ( not ( = ?auto_202431 ?auto_202430 ) ) ( not ( = ?auto_202431 ?auto_202429 ) ) ( not ( = ?auto_202431 ?auto_202428 ) ) ( not ( = ?auto_202427 ?auto_202432 ) ) ( not ( = ?auto_202427 ?auto_202433 ) ) ( not ( = ?auto_202427 ?auto_202434 ) ) ( not ( = ?auto_202427 ?auto_202431 ) ) ( ON ?auto_202427 ?auto_202428 ) ( CLEAR ?auto_202427 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_202432 ?auto_202433 ?auto_202434 ?auto_202431 ?auto_202430 ?auto_202429 ?auto_202428 )
      ( MAKE-3PILE ?auto_202427 ?auto_202428 ?auto_202429 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_202435 - BLOCK
      ?auto_202436 - BLOCK
      ?auto_202437 - BLOCK
    )
    :vars
    (
      ?auto_202441 - BLOCK
      ?auto_202442 - BLOCK
      ?auto_202439 - BLOCK
      ?auto_202438 - BLOCK
      ?auto_202440 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_202435 ?auto_202436 ) ) ( not ( = ?auto_202435 ?auto_202437 ) ) ( not ( = ?auto_202436 ?auto_202437 ) ) ( ON ?auto_202437 ?auto_202441 ) ( not ( = ?auto_202435 ?auto_202441 ) ) ( not ( = ?auto_202436 ?auto_202441 ) ) ( not ( = ?auto_202437 ?auto_202441 ) ) ( ON ?auto_202436 ?auto_202437 ) ( ON-TABLE ?auto_202442 ) ( ON ?auto_202439 ?auto_202442 ) ( ON ?auto_202438 ?auto_202439 ) ( ON ?auto_202440 ?auto_202438 ) ( ON ?auto_202441 ?auto_202440 ) ( not ( = ?auto_202442 ?auto_202439 ) ) ( not ( = ?auto_202442 ?auto_202438 ) ) ( not ( = ?auto_202442 ?auto_202440 ) ) ( not ( = ?auto_202442 ?auto_202441 ) ) ( not ( = ?auto_202442 ?auto_202437 ) ) ( not ( = ?auto_202442 ?auto_202436 ) ) ( not ( = ?auto_202439 ?auto_202438 ) ) ( not ( = ?auto_202439 ?auto_202440 ) ) ( not ( = ?auto_202439 ?auto_202441 ) ) ( not ( = ?auto_202439 ?auto_202437 ) ) ( not ( = ?auto_202439 ?auto_202436 ) ) ( not ( = ?auto_202438 ?auto_202440 ) ) ( not ( = ?auto_202438 ?auto_202441 ) ) ( not ( = ?auto_202438 ?auto_202437 ) ) ( not ( = ?auto_202438 ?auto_202436 ) ) ( not ( = ?auto_202440 ?auto_202441 ) ) ( not ( = ?auto_202440 ?auto_202437 ) ) ( not ( = ?auto_202440 ?auto_202436 ) ) ( not ( = ?auto_202435 ?auto_202442 ) ) ( not ( = ?auto_202435 ?auto_202439 ) ) ( not ( = ?auto_202435 ?auto_202438 ) ) ( not ( = ?auto_202435 ?auto_202440 ) ) ( HOLDING ?auto_202435 ) ( CLEAR ?auto_202436 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_202442 ?auto_202439 ?auto_202438 ?auto_202440 ?auto_202441 ?auto_202437 ?auto_202436 ?auto_202435 )
      ( MAKE-3PILE ?auto_202435 ?auto_202436 ?auto_202437 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_202443 - BLOCK
      ?auto_202444 - BLOCK
      ?auto_202445 - BLOCK
    )
    :vars
    (
      ?auto_202447 - BLOCK
      ?auto_202448 - BLOCK
      ?auto_202446 - BLOCK
      ?auto_202449 - BLOCK
      ?auto_202450 - BLOCK
      ?auto_202451 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_202443 ?auto_202444 ) ) ( not ( = ?auto_202443 ?auto_202445 ) ) ( not ( = ?auto_202444 ?auto_202445 ) ) ( ON ?auto_202445 ?auto_202447 ) ( not ( = ?auto_202443 ?auto_202447 ) ) ( not ( = ?auto_202444 ?auto_202447 ) ) ( not ( = ?auto_202445 ?auto_202447 ) ) ( ON ?auto_202444 ?auto_202445 ) ( ON-TABLE ?auto_202448 ) ( ON ?auto_202446 ?auto_202448 ) ( ON ?auto_202449 ?auto_202446 ) ( ON ?auto_202450 ?auto_202449 ) ( ON ?auto_202447 ?auto_202450 ) ( not ( = ?auto_202448 ?auto_202446 ) ) ( not ( = ?auto_202448 ?auto_202449 ) ) ( not ( = ?auto_202448 ?auto_202450 ) ) ( not ( = ?auto_202448 ?auto_202447 ) ) ( not ( = ?auto_202448 ?auto_202445 ) ) ( not ( = ?auto_202448 ?auto_202444 ) ) ( not ( = ?auto_202446 ?auto_202449 ) ) ( not ( = ?auto_202446 ?auto_202450 ) ) ( not ( = ?auto_202446 ?auto_202447 ) ) ( not ( = ?auto_202446 ?auto_202445 ) ) ( not ( = ?auto_202446 ?auto_202444 ) ) ( not ( = ?auto_202449 ?auto_202450 ) ) ( not ( = ?auto_202449 ?auto_202447 ) ) ( not ( = ?auto_202449 ?auto_202445 ) ) ( not ( = ?auto_202449 ?auto_202444 ) ) ( not ( = ?auto_202450 ?auto_202447 ) ) ( not ( = ?auto_202450 ?auto_202445 ) ) ( not ( = ?auto_202450 ?auto_202444 ) ) ( not ( = ?auto_202443 ?auto_202448 ) ) ( not ( = ?auto_202443 ?auto_202446 ) ) ( not ( = ?auto_202443 ?auto_202449 ) ) ( not ( = ?auto_202443 ?auto_202450 ) ) ( CLEAR ?auto_202444 ) ( ON ?auto_202443 ?auto_202451 ) ( CLEAR ?auto_202443 ) ( HAND-EMPTY ) ( not ( = ?auto_202443 ?auto_202451 ) ) ( not ( = ?auto_202444 ?auto_202451 ) ) ( not ( = ?auto_202445 ?auto_202451 ) ) ( not ( = ?auto_202447 ?auto_202451 ) ) ( not ( = ?auto_202448 ?auto_202451 ) ) ( not ( = ?auto_202446 ?auto_202451 ) ) ( not ( = ?auto_202449 ?auto_202451 ) ) ( not ( = ?auto_202450 ?auto_202451 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_202443 ?auto_202451 )
      ( MAKE-3PILE ?auto_202443 ?auto_202444 ?auto_202445 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_202452 - BLOCK
      ?auto_202453 - BLOCK
      ?auto_202454 - BLOCK
    )
    :vars
    (
      ?auto_202457 - BLOCK
      ?auto_202459 - BLOCK
      ?auto_202460 - BLOCK
      ?auto_202455 - BLOCK
      ?auto_202458 - BLOCK
      ?auto_202456 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_202452 ?auto_202453 ) ) ( not ( = ?auto_202452 ?auto_202454 ) ) ( not ( = ?auto_202453 ?auto_202454 ) ) ( ON ?auto_202454 ?auto_202457 ) ( not ( = ?auto_202452 ?auto_202457 ) ) ( not ( = ?auto_202453 ?auto_202457 ) ) ( not ( = ?auto_202454 ?auto_202457 ) ) ( ON-TABLE ?auto_202459 ) ( ON ?auto_202460 ?auto_202459 ) ( ON ?auto_202455 ?auto_202460 ) ( ON ?auto_202458 ?auto_202455 ) ( ON ?auto_202457 ?auto_202458 ) ( not ( = ?auto_202459 ?auto_202460 ) ) ( not ( = ?auto_202459 ?auto_202455 ) ) ( not ( = ?auto_202459 ?auto_202458 ) ) ( not ( = ?auto_202459 ?auto_202457 ) ) ( not ( = ?auto_202459 ?auto_202454 ) ) ( not ( = ?auto_202459 ?auto_202453 ) ) ( not ( = ?auto_202460 ?auto_202455 ) ) ( not ( = ?auto_202460 ?auto_202458 ) ) ( not ( = ?auto_202460 ?auto_202457 ) ) ( not ( = ?auto_202460 ?auto_202454 ) ) ( not ( = ?auto_202460 ?auto_202453 ) ) ( not ( = ?auto_202455 ?auto_202458 ) ) ( not ( = ?auto_202455 ?auto_202457 ) ) ( not ( = ?auto_202455 ?auto_202454 ) ) ( not ( = ?auto_202455 ?auto_202453 ) ) ( not ( = ?auto_202458 ?auto_202457 ) ) ( not ( = ?auto_202458 ?auto_202454 ) ) ( not ( = ?auto_202458 ?auto_202453 ) ) ( not ( = ?auto_202452 ?auto_202459 ) ) ( not ( = ?auto_202452 ?auto_202460 ) ) ( not ( = ?auto_202452 ?auto_202455 ) ) ( not ( = ?auto_202452 ?auto_202458 ) ) ( ON ?auto_202452 ?auto_202456 ) ( CLEAR ?auto_202452 ) ( not ( = ?auto_202452 ?auto_202456 ) ) ( not ( = ?auto_202453 ?auto_202456 ) ) ( not ( = ?auto_202454 ?auto_202456 ) ) ( not ( = ?auto_202457 ?auto_202456 ) ) ( not ( = ?auto_202459 ?auto_202456 ) ) ( not ( = ?auto_202460 ?auto_202456 ) ) ( not ( = ?auto_202455 ?auto_202456 ) ) ( not ( = ?auto_202458 ?auto_202456 ) ) ( HOLDING ?auto_202453 ) ( CLEAR ?auto_202454 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_202459 ?auto_202460 ?auto_202455 ?auto_202458 ?auto_202457 ?auto_202454 ?auto_202453 )
      ( MAKE-3PILE ?auto_202452 ?auto_202453 ?auto_202454 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_202461 - BLOCK
      ?auto_202462 - BLOCK
      ?auto_202463 - BLOCK
    )
    :vars
    (
      ?auto_202465 - BLOCK
      ?auto_202469 - BLOCK
      ?auto_202468 - BLOCK
      ?auto_202464 - BLOCK
      ?auto_202467 - BLOCK
      ?auto_202466 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_202461 ?auto_202462 ) ) ( not ( = ?auto_202461 ?auto_202463 ) ) ( not ( = ?auto_202462 ?auto_202463 ) ) ( ON ?auto_202463 ?auto_202465 ) ( not ( = ?auto_202461 ?auto_202465 ) ) ( not ( = ?auto_202462 ?auto_202465 ) ) ( not ( = ?auto_202463 ?auto_202465 ) ) ( ON-TABLE ?auto_202469 ) ( ON ?auto_202468 ?auto_202469 ) ( ON ?auto_202464 ?auto_202468 ) ( ON ?auto_202467 ?auto_202464 ) ( ON ?auto_202465 ?auto_202467 ) ( not ( = ?auto_202469 ?auto_202468 ) ) ( not ( = ?auto_202469 ?auto_202464 ) ) ( not ( = ?auto_202469 ?auto_202467 ) ) ( not ( = ?auto_202469 ?auto_202465 ) ) ( not ( = ?auto_202469 ?auto_202463 ) ) ( not ( = ?auto_202469 ?auto_202462 ) ) ( not ( = ?auto_202468 ?auto_202464 ) ) ( not ( = ?auto_202468 ?auto_202467 ) ) ( not ( = ?auto_202468 ?auto_202465 ) ) ( not ( = ?auto_202468 ?auto_202463 ) ) ( not ( = ?auto_202468 ?auto_202462 ) ) ( not ( = ?auto_202464 ?auto_202467 ) ) ( not ( = ?auto_202464 ?auto_202465 ) ) ( not ( = ?auto_202464 ?auto_202463 ) ) ( not ( = ?auto_202464 ?auto_202462 ) ) ( not ( = ?auto_202467 ?auto_202465 ) ) ( not ( = ?auto_202467 ?auto_202463 ) ) ( not ( = ?auto_202467 ?auto_202462 ) ) ( not ( = ?auto_202461 ?auto_202469 ) ) ( not ( = ?auto_202461 ?auto_202468 ) ) ( not ( = ?auto_202461 ?auto_202464 ) ) ( not ( = ?auto_202461 ?auto_202467 ) ) ( ON ?auto_202461 ?auto_202466 ) ( not ( = ?auto_202461 ?auto_202466 ) ) ( not ( = ?auto_202462 ?auto_202466 ) ) ( not ( = ?auto_202463 ?auto_202466 ) ) ( not ( = ?auto_202465 ?auto_202466 ) ) ( not ( = ?auto_202469 ?auto_202466 ) ) ( not ( = ?auto_202468 ?auto_202466 ) ) ( not ( = ?auto_202464 ?auto_202466 ) ) ( not ( = ?auto_202467 ?auto_202466 ) ) ( CLEAR ?auto_202463 ) ( ON ?auto_202462 ?auto_202461 ) ( CLEAR ?auto_202462 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_202466 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_202466 ?auto_202461 )
      ( MAKE-3PILE ?auto_202461 ?auto_202462 ?auto_202463 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_202470 - BLOCK
      ?auto_202471 - BLOCK
      ?auto_202472 - BLOCK
    )
    :vars
    (
      ?auto_202478 - BLOCK
      ?auto_202474 - BLOCK
      ?auto_202476 - BLOCK
      ?auto_202477 - BLOCK
      ?auto_202473 - BLOCK
      ?auto_202475 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_202470 ?auto_202471 ) ) ( not ( = ?auto_202470 ?auto_202472 ) ) ( not ( = ?auto_202471 ?auto_202472 ) ) ( not ( = ?auto_202470 ?auto_202478 ) ) ( not ( = ?auto_202471 ?auto_202478 ) ) ( not ( = ?auto_202472 ?auto_202478 ) ) ( ON-TABLE ?auto_202474 ) ( ON ?auto_202476 ?auto_202474 ) ( ON ?auto_202477 ?auto_202476 ) ( ON ?auto_202473 ?auto_202477 ) ( ON ?auto_202478 ?auto_202473 ) ( not ( = ?auto_202474 ?auto_202476 ) ) ( not ( = ?auto_202474 ?auto_202477 ) ) ( not ( = ?auto_202474 ?auto_202473 ) ) ( not ( = ?auto_202474 ?auto_202478 ) ) ( not ( = ?auto_202474 ?auto_202472 ) ) ( not ( = ?auto_202474 ?auto_202471 ) ) ( not ( = ?auto_202476 ?auto_202477 ) ) ( not ( = ?auto_202476 ?auto_202473 ) ) ( not ( = ?auto_202476 ?auto_202478 ) ) ( not ( = ?auto_202476 ?auto_202472 ) ) ( not ( = ?auto_202476 ?auto_202471 ) ) ( not ( = ?auto_202477 ?auto_202473 ) ) ( not ( = ?auto_202477 ?auto_202478 ) ) ( not ( = ?auto_202477 ?auto_202472 ) ) ( not ( = ?auto_202477 ?auto_202471 ) ) ( not ( = ?auto_202473 ?auto_202478 ) ) ( not ( = ?auto_202473 ?auto_202472 ) ) ( not ( = ?auto_202473 ?auto_202471 ) ) ( not ( = ?auto_202470 ?auto_202474 ) ) ( not ( = ?auto_202470 ?auto_202476 ) ) ( not ( = ?auto_202470 ?auto_202477 ) ) ( not ( = ?auto_202470 ?auto_202473 ) ) ( ON ?auto_202470 ?auto_202475 ) ( not ( = ?auto_202470 ?auto_202475 ) ) ( not ( = ?auto_202471 ?auto_202475 ) ) ( not ( = ?auto_202472 ?auto_202475 ) ) ( not ( = ?auto_202478 ?auto_202475 ) ) ( not ( = ?auto_202474 ?auto_202475 ) ) ( not ( = ?auto_202476 ?auto_202475 ) ) ( not ( = ?auto_202477 ?auto_202475 ) ) ( not ( = ?auto_202473 ?auto_202475 ) ) ( ON ?auto_202471 ?auto_202470 ) ( CLEAR ?auto_202471 ) ( ON-TABLE ?auto_202475 ) ( HOLDING ?auto_202472 ) ( CLEAR ?auto_202478 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_202474 ?auto_202476 ?auto_202477 ?auto_202473 ?auto_202478 ?auto_202472 )
      ( MAKE-3PILE ?auto_202470 ?auto_202471 ?auto_202472 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_202479 - BLOCK
      ?auto_202480 - BLOCK
      ?auto_202481 - BLOCK
    )
    :vars
    (
      ?auto_202487 - BLOCK
      ?auto_202485 - BLOCK
      ?auto_202482 - BLOCK
      ?auto_202484 - BLOCK
      ?auto_202483 - BLOCK
      ?auto_202486 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_202479 ?auto_202480 ) ) ( not ( = ?auto_202479 ?auto_202481 ) ) ( not ( = ?auto_202480 ?auto_202481 ) ) ( not ( = ?auto_202479 ?auto_202487 ) ) ( not ( = ?auto_202480 ?auto_202487 ) ) ( not ( = ?auto_202481 ?auto_202487 ) ) ( ON-TABLE ?auto_202485 ) ( ON ?auto_202482 ?auto_202485 ) ( ON ?auto_202484 ?auto_202482 ) ( ON ?auto_202483 ?auto_202484 ) ( ON ?auto_202487 ?auto_202483 ) ( not ( = ?auto_202485 ?auto_202482 ) ) ( not ( = ?auto_202485 ?auto_202484 ) ) ( not ( = ?auto_202485 ?auto_202483 ) ) ( not ( = ?auto_202485 ?auto_202487 ) ) ( not ( = ?auto_202485 ?auto_202481 ) ) ( not ( = ?auto_202485 ?auto_202480 ) ) ( not ( = ?auto_202482 ?auto_202484 ) ) ( not ( = ?auto_202482 ?auto_202483 ) ) ( not ( = ?auto_202482 ?auto_202487 ) ) ( not ( = ?auto_202482 ?auto_202481 ) ) ( not ( = ?auto_202482 ?auto_202480 ) ) ( not ( = ?auto_202484 ?auto_202483 ) ) ( not ( = ?auto_202484 ?auto_202487 ) ) ( not ( = ?auto_202484 ?auto_202481 ) ) ( not ( = ?auto_202484 ?auto_202480 ) ) ( not ( = ?auto_202483 ?auto_202487 ) ) ( not ( = ?auto_202483 ?auto_202481 ) ) ( not ( = ?auto_202483 ?auto_202480 ) ) ( not ( = ?auto_202479 ?auto_202485 ) ) ( not ( = ?auto_202479 ?auto_202482 ) ) ( not ( = ?auto_202479 ?auto_202484 ) ) ( not ( = ?auto_202479 ?auto_202483 ) ) ( ON ?auto_202479 ?auto_202486 ) ( not ( = ?auto_202479 ?auto_202486 ) ) ( not ( = ?auto_202480 ?auto_202486 ) ) ( not ( = ?auto_202481 ?auto_202486 ) ) ( not ( = ?auto_202487 ?auto_202486 ) ) ( not ( = ?auto_202485 ?auto_202486 ) ) ( not ( = ?auto_202482 ?auto_202486 ) ) ( not ( = ?auto_202484 ?auto_202486 ) ) ( not ( = ?auto_202483 ?auto_202486 ) ) ( ON ?auto_202480 ?auto_202479 ) ( ON-TABLE ?auto_202486 ) ( CLEAR ?auto_202487 ) ( ON ?auto_202481 ?auto_202480 ) ( CLEAR ?auto_202481 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_202486 ?auto_202479 ?auto_202480 )
      ( MAKE-3PILE ?auto_202479 ?auto_202480 ?auto_202481 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_202488 - BLOCK
      ?auto_202489 - BLOCK
      ?auto_202490 - BLOCK
    )
    :vars
    (
      ?auto_202496 - BLOCK
      ?auto_202492 - BLOCK
      ?auto_202491 - BLOCK
      ?auto_202494 - BLOCK
      ?auto_202495 - BLOCK
      ?auto_202493 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_202488 ?auto_202489 ) ) ( not ( = ?auto_202488 ?auto_202490 ) ) ( not ( = ?auto_202489 ?auto_202490 ) ) ( not ( = ?auto_202488 ?auto_202496 ) ) ( not ( = ?auto_202489 ?auto_202496 ) ) ( not ( = ?auto_202490 ?auto_202496 ) ) ( ON-TABLE ?auto_202492 ) ( ON ?auto_202491 ?auto_202492 ) ( ON ?auto_202494 ?auto_202491 ) ( ON ?auto_202495 ?auto_202494 ) ( not ( = ?auto_202492 ?auto_202491 ) ) ( not ( = ?auto_202492 ?auto_202494 ) ) ( not ( = ?auto_202492 ?auto_202495 ) ) ( not ( = ?auto_202492 ?auto_202496 ) ) ( not ( = ?auto_202492 ?auto_202490 ) ) ( not ( = ?auto_202492 ?auto_202489 ) ) ( not ( = ?auto_202491 ?auto_202494 ) ) ( not ( = ?auto_202491 ?auto_202495 ) ) ( not ( = ?auto_202491 ?auto_202496 ) ) ( not ( = ?auto_202491 ?auto_202490 ) ) ( not ( = ?auto_202491 ?auto_202489 ) ) ( not ( = ?auto_202494 ?auto_202495 ) ) ( not ( = ?auto_202494 ?auto_202496 ) ) ( not ( = ?auto_202494 ?auto_202490 ) ) ( not ( = ?auto_202494 ?auto_202489 ) ) ( not ( = ?auto_202495 ?auto_202496 ) ) ( not ( = ?auto_202495 ?auto_202490 ) ) ( not ( = ?auto_202495 ?auto_202489 ) ) ( not ( = ?auto_202488 ?auto_202492 ) ) ( not ( = ?auto_202488 ?auto_202491 ) ) ( not ( = ?auto_202488 ?auto_202494 ) ) ( not ( = ?auto_202488 ?auto_202495 ) ) ( ON ?auto_202488 ?auto_202493 ) ( not ( = ?auto_202488 ?auto_202493 ) ) ( not ( = ?auto_202489 ?auto_202493 ) ) ( not ( = ?auto_202490 ?auto_202493 ) ) ( not ( = ?auto_202496 ?auto_202493 ) ) ( not ( = ?auto_202492 ?auto_202493 ) ) ( not ( = ?auto_202491 ?auto_202493 ) ) ( not ( = ?auto_202494 ?auto_202493 ) ) ( not ( = ?auto_202495 ?auto_202493 ) ) ( ON ?auto_202489 ?auto_202488 ) ( ON-TABLE ?auto_202493 ) ( ON ?auto_202490 ?auto_202489 ) ( CLEAR ?auto_202490 ) ( HOLDING ?auto_202496 ) ( CLEAR ?auto_202495 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_202492 ?auto_202491 ?auto_202494 ?auto_202495 ?auto_202496 )
      ( MAKE-3PILE ?auto_202488 ?auto_202489 ?auto_202490 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_202497 - BLOCK
      ?auto_202498 - BLOCK
      ?auto_202499 - BLOCK
    )
    :vars
    (
      ?auto_202502 - BLOCK
      ?auto_202504 - BLOCK
      ?auto_202505 - BLOCK
      ?auto_202501 - BLOCK
      ?auto_202503 - BLOCK
      ?auto_202500 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_202497 ?auto_202498 ) ) ( not ( = ?auto_202497 ?auto_202499 ) ) ( not ( = ?auto_202498 ?auto_202499 ) ) ( not ( = ?auto_202497 ?auto_202502 ) ) ( not ( = ?auto_202498 ?auto_202502 ) ) ( not ( = ?auto_202499 ?auto_202502 ) ) ( ON-TABLE ?auto_202504 ) ( ON ?auto_202505 ?auto_202504 ) ( ON ?auto_202501 ?auto_202505 ) ( ON ?auto_202503 ?auto_202501 ) ( not ( = ?auto_202504 ?auto_202505 ) ) ( not ( = ?auto_202504 ?auto_202501 ) ) ( not ( = ?auto_202504 ?auto_202503 ) ) ( not ( = ?auto_202504 ?auto_202502 ) ) ( not ( = ?auto_202504 ?auto_202499 ) ) ( not ( = ?auto_202504 ?auto_202498 ) ) ( not ( = ?auto_202505 ?auto_202501 ) ) ( not ( = ?auto_202505 ?auto_202503 ) ) ( not ( = ?auto_202505 ?auto_202502 ) ) ( not ( = ?auto_202505 ?auto_202499 ) ) ( not ( = ?auto_202505 ?auto_202498 ) ) ( not ( = ?auto_202501 ?auto_202503 ) ) ( not ( = ?auto_202501 ?auto_202502 ) ) ( not ( = ?auto_202501 ?auto_202499 ) ) ( not ( = ?auto_202501 ?auto_202498 ) ) ( not ( = ?auto_202503 ?auto_202502 ) ) ( not ( = ?auto_202503 ?auto_202499 ) ) ( not ( = ?auto_202503 ?auto_202498 ) ) ( not ( = ?auto_202497 ?auto_202504 ) ) ( not ( = ?auto_202497 ?auto_202505 ) ) ( not ( = ?auto_202497 ?auto_202501 ) ) ( not ( = ?auto_202497 ?auto_202503 ) ) ( ON ?auto_202497 ?auto_202500 ) ( not ( = ?auto_202497 ?auto_202500 ) ) ( not ( = ?auto_202498 ?auto_202500 ) ) ( not ( = ?auto_202499 ?auto_202500 ) ) ( not ( = ?auto_202502 ?auto_202500 ) ) ( not ( = ?auto_202504 ?auto_202500 ) ) ( not ( = ?auto_202505 ?auto_202500 ) ) ( not ( = ?auto_202501 ?auto_202500 ) ) ( not ( = ?auto_202503 ?auto_202500 ) ) ( ON ?auto_202498 ?auto_202497 ) ( ON-TABLE ?auto_202500 ) ( ON ?auto_202499 ?auto_202498 ) ( CLEAR ?auto_202503 ) ( ON ?auto_202502 ?auto_202499 ) ( CLEAR ?auto_202502 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_202500 ?auto_202497 ?auto_202498 ?auto_202499 )
      ( MAKE-3PILE ?auto_202497 ?auto_202498 ?auto_202499 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_202506 - BLOCK
      ?auto_202507 - BLOCK
      ?auto_202508 - BLOCK
    )
    :vars
    (
      ?auto_202514 - BLOCK
      ?auto_202510 - BLOCK
      ?auto_202511 - BLOCK
      ?auto_202512 - BLOCK
      ?auto_202513 - BLOCK
      ?auto_202509 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_202506 ?auto_202507 ) ) ( not ( = ?auto_202506 ?auto_202508 ) ) ( not ( = ?auto_202507 ?auto_202508 ) ) ( not ( = ?auto_202506 ?auto_202514 ) ) ( not ( = ?auto_202507 ?auto_202514 ) ) ( not ( = ?auto_202508 ?auto_202514 ) ) ( ON-TABLE ?auto_202510 ) ( ON ?auto_202511 ?auto_202510 ) ( ON ?auto_202512 ?auto_202511 ) ( not ( = ?auto_202510 ?auto_202511 ) ) ( not ( = ?auto_202510 ?auto_202512 ) ) ( not ( = ?auto_202510 ?auto_202513 ) ) ( not ( = ?auto_202510 ?auto_202514 ) ) ( not ( = ?auto_202510 ?auto_202508 ) ) ( not ( = ?auto_202510 ?auto_202507 ) ) ( not ( = ?auto_202511 ?auto_202512 ) ) ( not ( = ?auto_202511 ?auto_202513 ) ) ( not ( = ?auto_202511 ?auto_202514 ) ) ( not ( = ?auto_202511 ?auto_202508 ) ) ( not ( = ?auto_202511 ?auto_202507 ) ) ( not ( = ?auto_202512 ?auto_202513 ) ) ( not ( = ?auto_202512 ?auto_202514 ) ) ( not ( = ?auto_202512 ?auto_202508 ) ) ( not ( = ?auto_202512 ?auto_202507 ) ) ( not ( = ?auto_202513 ?auto_202514 ) ) ( not ( = ?auto_202513 ?auto_202508 ) ) ( not ( = ?auto_202513 ?auto_202507 ) ) ( not ( = ?auto_202506 ?auto_202510 ) ) ( not ( = ?auto_202506 ?auto_202511 ) ) ( not ( = ?auto_202506 ?auto_202512 ) ) ( not ( = ?auto_202506 ?auto_202513 ) ) ( ON ?auto_202506 ?auto_202509 ) ( not ( = ?auto_202506 ?auto_202509 ) ) ( not ( = ?auto_202507 ?auto_202509 ) ) ( not ( = ?auto_202508 ?auto_202509 ) ) ( not ( = ?auto_202514 ?auto_202509 ) ) ( not ( = ?auto_202510 ?auto_202509 ) ) ( not ( = ?auto_202511 ?auto_202509 ) ) ( not ( = ?auto_202512 ?auto_202509 ) ) ( not ( = ?auto_202513 ?auto_202509 ) ) ( ON ?auto_202507 ?auto_202506 ) ( ON-TABLE ?auto_202509 ) ( ON ?auto_202508 ?auto_202507 ) ( ON ?auto_202514 ?auto_202508 ) ( CLEAR ?auto_202514 ) ( HOLDING ?auto_202513 ) ( CLEAR ?auto_202512 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_202510 ?auto_202511 ?auto_202512 ?auto_202513 )
      ( MAKE-3PILE ?auto_202506 ?auto_202507 ?auto_202508 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_202515 - BLOCK
      ?auto_202516 - BLOCK
      ?auto_202517 - BLOCK
    )
    :vars
    (
      ?auto_202521 - BLOCK
      ?auto_202523 - BLOCK
      ?auto_202522 - BLOCK
      ?auto_202520 - BLOCK
      ?auto_202519 - BLOCK
      ?auto_202518 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_202515 ?auto_202516 ) ) ( not ( = ?auto_202515 ?auto_202517 ) ) ( not ( = ?auto_202516 ?auto_202517 ) ) ( not ( = ?auto_202515 ?auto_202521 ) ) ( not ( = ?auto_202516 ?auto_202521 ) ) ( not ( = ?auto_202517 ?auto_202521 ) ) ( ON-TABLE ?auto_202523 ) ( ON ?auto_202522 ?auto_202523 ) ( ON ?auto_202520 ?auto_202522 ) ( not ( = ?auto_202523 ?auto_202522 ) ) ( not ( = ?auto_202523 ?auto_202520 ) ) ( not ( = ?auto_202523 ?auto_202519 ) ) ( not ( = ?auto_202523 ?auto_202521 ) ) ( not ( = ?auto_202523 ?auto_202517 ) ) ( not ( = ?auto_202523 ?auto_202516 ) ) ( not ( = ?auto_202522 ?auto_202520 ) ) ( not ( = ?auto_202522 ?auto_202519 ) ) ( not ( = ?auto_202522 ?auto_202521 ) ) ( not ( = ?auto_202522 ?auto_202517 ) ) ( not ( = ?auto_202522 ?auto_202516 ) ) ( not ( = ?auto_202520 ?auto_202519 ) ) ( not ( = ?auto_202520 ?auto_202521 ) ) ( not ( = ?auto_202520 ?auto_202517 ) ) ( not ( = ?auto_202520 ?auto_202516 ) ) ( not ( = ?auto_202519 ?auto_202521 ) ) ( not ( = ?auto_202519 ?auto_202517 ) ) ( not ( = ?auto_202519 ?auto_202516 ) ) ( not ( = ?auto_202515 ?auto_202523 ) ) ( not ( = ?auto_202515 ?auto_202522 ) ) ( not ( = ?auto_202515 ?auto_202520 ) ) ( not ( = ?auto_202515 ?auto_202519 ) ) ( ON ?auto_202515 ?auto_202518 ) ( not ( = ?auto_202515 ?auto_202518 ) ) ( not ( = ?auto_202516 ?auto_202518 ) ) ( not ( = ?auto_202517 ?auto_202518 ) ) ( not ( = ?auto_202521 ?auto_202518 ) ) ( not ( = ?auto_202523 ?auto_202518 ) ) ( not ( = ?auto_202522 ?auto_202518 ) ) ( not ( = ?auto_202520 ?auto_202518 ) ) ( not ( = ?auto_202519 ?auto_202518 ) ) ( ON ?auto_202516 ?auto_202515 ) ( ON-TABLE ?auto_202518 ) ( ON ?auto_202517 ?auto_202516 ) ( ON ?auto_202521 ?auto_202517 ) ( CLEAR ?auto_202520 ) ( ON ?auto_202519 ?auto_202521 ) ( CLEAR ?auto_202519 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_202518 ?auto_202515 ?auto_202516 ?auto_202517 ?auto_202521 )
      ( MAKE-3PILE ?auto_202515 ?auto_202516 ?auto_202517 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_202524 - BLOCK
      ?auto_202525 - BLOCK
      ?auto_202526 - BLOCK
    )
    :vars
    (
      ?auto_202531 - BLOCK
      ?auto_202530 - BLOCK
      ?auto_202532 - BLOCK
      ?auto_202529 - BLOCK
      ?auto_202527 - BLOCK
      ?auto_202528 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_202524 ?auto_202525 ) ) ( not ( = ?auto_202524 ?auto_202526 ) ) ( not ( = ?auto_202525 ?auto_202526 ) ) ( not ( = ?auto_202524 ?auto_202531 ) ) ( not ( = ?auto_202525 ?auto_202531 ) ) ( not ( = ?auto_202526 ?auto_202531 ) ) ( ON-TABLE ?auto_202530 ) ( ON ?auto_202532 ?auto_202530 ) ( not ( = ?auto_202530 ?auto_202532 ) ) ( not ( = ?auto_202530 ?auto_202529 ) ) ( not ( = ?auto_202530 ?auto_202527 ) ) ( not ( = ?auto_202530 ?auto_202531 ) ) ( not ( = ?auto_202530 ?auto_202526 ) ) ( not ( = ?auto_202530 ?auto_202525 ) ) ( not ( = ?auto_202532 ?auto_202529 ) ) ( not ( = ?auto_202532 ?auto_202527 ) ) ( not ( = ?auto_202532 ?auto_202531 ) ) ( not ( = ?auto_202532 ?auto_202526 ) ) ( not ( = ?auto_202532 ?auto_202525 ) ) ( not ( = ?auto_202529 ?auto_202527 ) ) ( not ( = ?auto_202529 ?auto_202531 ) ) ( not ( = ?auto_202529 ?auto_202526 ) ) ( not ( = ?auto_202529 ?auto_202525 ) ) ( not ( = ?auto_202527 ?auto_202531 ) ) ( not ( = ?auto_202527 ?auto_202526 ) ) ( not ( = ?auto_202527 ?auto_202525 ) ) ( not ( = ?auto_202524 ?auto_202530 ) ) ( not ( = ?auto_202524 ?auto_202532 ) ) ( not ( = ?auto_202524 ?auto_202529 ) ) ( not ( = ?auto_202524 ?auto_202527 ) ) ( ON ?auto_202524 ?auto_202528 ) ( not ( = ?auto_202524 ?auto_202528 ) ) ( not ( = ?auto_202525 ?auto_202528 ) ) ( not ( = ?auto_202526 ?auto_202528 ) ) ( not ( = ?auto_202531 ?auto_202528 ) ) ( not ( = ?auto_202530 ?auto_202528 ) ) ( not ( = ?auto_202532 ?auto_202528 ) ) ( not ( = ?auto_202529 ?auto_202528 ) ) ( not ( = ?auto_202527 ?auto_202528 ) ) ( ON ?auto_202525 ?auto_202524 ) ( ON-TABLE ?auto_202528 ) ( ON ?auto_202526 ?auto_202525 ) ( ON ?auto_202531 ?auto_202526 ) ( ON ?auto_202527 ?auto_202531 ) ( CLEAR ?auto_202527 ) ( HOLDING ?auto_202529 ) ( CLEAR ?auto_202532 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_202530 ?auto_202532 ?auto_202529 )
      ( MAKE-3PILE ?auto_202524 ?auto_202525 ?auto_202526 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_202533 - BLOCK
      ?auto_202534 - BLOCK
      ?auto_202535 - BLOCK
    )
    :vars
    (
      ?auto_202539 - BLOCK
      ?auto_202536 - BLOCK
      ?auto_202537 - BLOCK
      ?auto_202541 - BLOCK
      ?auto_202538 - BLOCK
      ?auto_202540 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_202533 ?auto_202534 ) ) ( not ( = ?auto_202533 ?auto_202535 ) ) ( not ( = ?auto_202534 ?auto_202535 ) ) ( not ( = ?auto_202533 ?auto_202539 ) ) ( not ( = ?auto_202534 ?auto_202539 ) ) ( not ( = ?auto_202535 ?auto_202539 ) ) ( ON-TABLE ?auto_202536 ) ( ON ?auto_202537 ?auto_202536 ) ( not ( = ?auto_202536 ?auto_202537 ) ) ( not ( = ?auto_202536 ?auto_202541 ) ) ( not ( = ?auto_202536 ?auto_202538 ) ) ( not ( = ?auto_202536 ?auto_202539 ) ) ( not ( = ?auto_202536 ?auto_202535 ) ) ( not ( = ?auto_202536 ?auto_202534 ) ) ( not ( = ?auto_202537 ?auto_202541 ) ) ( not ( = ?auto_202537 ?auto_202538 ) ) ( not ( = ?auto_202537 ?auto_202539 ) ) ( not ( = ?auto_202537 ?auto_202535 ) ) ( not ( = ?auto_202537 ?auto_202534 ) ) ( not ( = ?auto_202541 ?auto_202538 ) ) ( not ( = ?auto_202541 ?auto_202539 ) ) ( not ( = ?auto_202541 ?auto_202535 ) ) ( not ( = ?auto_202541 ?auto_202534 ) ) ( not ( = ?auto_202538 ?auto_202539 ) ) ( not ( = ?auto_202538 ?auto_202535 ) ) ( not ( = ?auto_202538 ?auto_202534 ) ) ( not ( = ?auto_202533 ?auto_202536 ) ) ( not ( = ?auto_202533 ?auto_202537 ) ) ( not ( = ?auto_202533 ?auto_202541 ) ) ( not ( = ?auto_202533 ?auto_202538 ) ) ( ON ?auto_202533 ?auto_202540 ) ( not ( = ?auto_202533 ?auto_202540 ) ) ( not ( = ?auto_202534 ?auto_202540 ) ) ( not ( = ?auto_202535 ?auto_202540 ) ) ( not ( = ?auto_202539 ?auto_202540 ) ) ( not ( = ?auto_202536 ?auto_202540 ) ) ( not ( = ?auto_202537 ?auto_202540 ) ) ( not ( = ?auto_202541 ?auto_202540 ) ) ( not ( = ?auto_202538 ?auto_202540 ) ) ( ON ?auto_202534 ?auto_202533 ) ( ON-TABLE ?auto_202540 ) ( ON ?auto_202535 ?auto_202534 ) ( ON ?auto_202539 ?auto_202535 ) ( ON ?auto_202538 ?auto_202539 ) ( CLEAR ?auto_202537 ) ( ON ?auto_202541 ?auto_202538 ) ( CLEAR ?auto_202541 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_202540 ?auto_202533 ?auto_202534 ?auto_202535 ?auto_202539 ?auto_202538 )
      ( MAKE-3PILE ?auto_202533 ?auto_202534 ?auto_202535 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_202542 - BLOCK
      ?auto_202543 - BLOCK
      ?auto_202544 - BLOCK
    )
    :vars
    (
      ?auto_202545 - BLOCK
      ?auto_202548 - BLOCK
      ?auto_202547 - BLOCK
      ?auto_202549 - BLOCK
      ?auto_202550 - BLOCK
      ?auto_202546 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_202542 ?auto_202543 ) ) ( not ( = ?auto_202542 ?auto_202544 ) ) ( not ( = ?auto_202543 ?auto_202544 ) ) ( not ( = ?auto_202542 ?auto_202545 ) ) ( not ( = ?auto_202543 ?auto_202545 ) ) ( not ( = ?auto_202544 ?auto_202545 ) ) ( ON-TABLE ?auto_202548 ) ( not ( = ?auto_202548 ?auto_202547 ) ) ( not ( = ?auto_202548 ?auto_202549 ) ) ( not ( = ?auto_202548 ?auto_202550 ) ) ( not ( = ?auto_202548 ?auto_202545 ) ) ( not ( = ?auto_202548 ?auto_202544 ) ) ( not ( = ?auto_202548 ?auto_202543 ) ) ( not ( = ?auto_202547 ?auto_202549 ) ) ( not ( = ?auto_202547 ?auto_202550 ) ) ( not ( = ?auto_202547 ?auto_202545 ) ) ( not ( = ?auto_202547 ?auto_202544 ) ) ( not ( = ?auto_202547 ?auto_202543 ) ) ( not ( = ?auto_202549 ?auto_202550 ) ) ( not ( = ?auto_202549 ?auto_202545 ) ) ( not ( = ?auto_202549 ?auto_202544 ) ) ( not ( = ?auto_202549 ?auto_202543 ) ) ( not ( = ?auto_202550 ?auto_202545 ) ) ( not ( = ?auto_202550 ?auto_202544 ) ) ( not ( = ?auto_202550 ?auto_202543 ) ) ( not ( = ?auto_202542 ?auto_202548 ) ) ( not ( = ?auto_202542 ?auto_202547 ) ) ( not ( = ?auto_202542 ?auto_202549 ) ) ( not ( = ?auto_202542 ?auto_202550 ) ) ( ON ?auto_202542 ?auto_202546 ) ( not ( = ?auto_202542 ?auto_202546 ) ) ( not ( = ?auto_202543 ?auto_202546 ) ) ( not ( = ?auto_202544 ?auto_202546 ) ) ( not ( = ?auto_202545 ?auto_202546 ) ) ( not ( = ?auto_202548 ?auto_202546 ) ) ( not ( = ?auto_202547 ?auto_202546 ) ) ( not ( = ?auto_202549 ?auto_202546 ) ) ( not ( = ?auto_202550 ?auto_202546 ) ) ( ON ?auto_202543 ?auto_202542 ) ( ON-TABLE ?auto_202546 ) ( ON ?auto_202544 ?auto_202543 ) ( ON ?auto_202545 ?auto_202544 ) ( ON ?auto_202550 ?auto_202545 ) ( ON ?auto_202549 ?auto_202550 ) ( CLEAR ?auto_202549 ) ( HOLDING ?auto_202547 ) ( CLEAR ?auto_202548 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_202548 ?auto_202547 )
      ( MAKE-3PILE ?auto_202542 ?auto_202543 ?auto_202544 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_202551 - BLOCK
      ?auto_202552 - BLOCK
      ?auto_202553 - BLOCK
    )
    :vars
    (
      ?auto_202555 - BLOCK
      ?auto_202554 - BLOCK
      ?auto_202557 - BLOCK
      ?auto_202556 - BLOCK
      ?auto_202558 - BLOCK
      ?auto_202559 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_202551 ?auto_202552 ) ) ( not ( = ?auto_202551 ?auto_202553 ) ) ( not ( = ?auto_202552 ?auto_202553 ) ) ( not ( = ?auto_202551 ?auto_202555 ) ) ( not ( = ?auto_202552 ?auto_202555 ) ) ( not ( = ?auto_202553 ?auto_202555 ) ) ( ON-TABLE ?auto_202554 ) ( not ( = ?auto_202554 ?auto_202557 ) ) ( not ( = ?auto_202554 ?auto_202556 ) ) ( not ( = ?auto_202554 ?auto_202558 ) ) ( not ( = ?auto_202554 ?auto_202555 ) ) ( not ( = ?auto_202554 ?auto_202553 ) ) ( not ( = ?auto_202554 ?auto_202552 ) ) ( not ( = ?auto_202557 ?auto_202556 ) ) ( not ( = ?auto_202557 ?auto_202558 ) ) ( not ( = ?auto_202557 ?auto_202555 ) ) ( not ( = ?auto_202557 ?auto_202553 ) ) ( not ( = ?auto_202557 ?auto_202552 ) ) ( not ( = ?auto_202556 ?auto_202558 ) ) ( not ( = ?auto_202556 ?auto_202555 ) ) ( not ( = ?auto_202556 ?auto_202553 ) ) ( not ( = ?auto_202556 ?auto_202552 ) ) ( not ( = ?auto_202558 ?auto_202555 ) ) ( not ( = ?auto_202558 ?auto_202553 ) ) ( not ( = ?auto_202558 ?auto_202552 ) ) ( not ( = ?auto_202551 ?auto_202554 ) ) ( not ( = ?auto_202551 ?auto_202557 ) ) ( not ( = ?auto_202551 ?auto_202556 ) ) ( not ( = ?auto_202551 ?auto_202558 ) ) ( ON ?auto_202551 ?auto_202559 ) ( not ( = ?auto_202551 ?auto_202559 ) ) ( not ( = ?auto_202552 ?auto_202559 ) ) ( not ( = ?auto_202553 ?auto_202559 ) ) ( not ( = ?auto_202555 ?auto_202559 ) ) ( not ( = ?auto_202554 ?auto_202559 ) ) ( not ( = ?auto_202557 ?auto_202559 ) ) ( not ( = ?auto_202556 ?auto_202559 ) ) ( not ( = ?auto_202558 ?auto_202559 ) ) ( ON ?auto_202552 ?auto_202551 ) ( ON-TABLE ?auto_202559 ) ( ON ?auto_202553 ?auto_202552 ) ( ON ?auto_202555 ?auto_202553 ) ( ON ?auto_202558 ?auto_202555 ) ( ON ?auto_202556 ?auto_202558 ) ( CLEAR ?auto_202554 ) ( ON ?auto_202557 ?auto_202556 ) ( CLEAR ?auto_202557 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_202559 ?auto_202551 ?auto_202552 ?auto_202553 ?auto_202555 ?auto_202558 ?auto_202556 )
      ( MAKE-3PILE ?auto_202551 ?auto_202552 ?auto_202553 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_202560 - BLOCK
      ?auto_202561 - BLOCK
      ?auto_202562 - BLOCK
    )
    :vars
    (
      ?auto_202566 - BLOCK
      ?auto_202565 - BLOCK
      ?auto_202563 - BLOCK
      ?auto_202568 - BLOCK
      ?auto_202564 - BLOCK
      ?auto_202567 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_202560 ?auto_202561 ) ) ( not ( = ?auto_202560 ?auto_202562 ) ) ( not ( = ?auto_202561 ?auto_202562 ) ) ( not ( = ?auto_202560 ?auto_202566 ) ) ( not ( = ?auto_202561 ?auto_202566 ) ) ( not ( = ?auto_202562 ?auto_202566 ) ) ( not ( = ?auto_202565 ?auto_202563 ) ) ( not ( = ?auto_202565 ?auto_202568 ) ) ( not ( = ?auto_202565 ?auto_202564 ) ) ( not ( = ?auto_202565 ?auto_202566 ) ) ( not ( = ?auto_202565 ?auto_202562 ) ) ( not ( = ?auto_202565 ?auto_202561 ) ) ( not ( = ?auto_202563 ?auto_202568 ) ) ( not ( = ?auto_202563 ?auto_202564 ) ) ( not ( = ?auto_202563 ?auto_202566 ) ) ( not ( = ?auto_202563 ?auto_202562 ) ) ( not ( = ?auto_202563 ?auto_202561 ) ) ( not ( = ?auto_202568 ?auto_202564 ) ) ( not ( = ?auto_202568 ?auto_202566 ) ) ( not ( = ?auto_202568 ?auto_202562 ) ) ( not ( = ?auto_202568 ?auto_202561 ) ) ( not ( = ?auto_202564 ?auto_202566 ) ) ( not ( = ?auto_202564 ?auto_202562 ) ) ( not ( = ?auto_202564 ?auto_202561 ) ) ( not ( = ?auto_202560 ?auto_202565 ) ) ( not ( = ?auto_202560 ?auto_202563 ) ) ( not ( = ?auto_202560 ?auto_202568 ) ) ( not ( = ?auto_202560 ?auto_202564 ) ) ( ON ?auto_202560 ?auto_202567 ) ( not ( = ?auto_202560 ?auto_202567 ) ) ( not ( = ?auto_202561 ?auto_202567 ) ) ( not ( = ?auto_202562 ?auto_202567 ) ) ( not ( = ?auto_202566 ?auto_202567 ) ) ( not ( = ?auto_202565 ?auto_202567 ) ) ( not ( = ?auto_202563 ?auto_202567 ) ) ( not ( = ?auto_202568 ?auto_202567 ) ) ( not ( = ?auto_202564 ?auto_202567 ) ) ( ON ?auto_202561 ?auto_202560 ) ( ON-TABLE ?auto_202567 ) ( ON ?auto_202562 ?auto_202561 ) ( ON ?auto_202566 ?auto_202562 ) ( ON ?auto_202564 ?auto_202566 ) ( ON ?auto_202568 ?auto_202564 ) ( ON ?auto_202563 ?auto_202568 ) ( CLEAR ?auto_202563 ) ( HOLDING ?auto_202565 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_202565 )
      ( MAKE-3PILE ?auto_202560 ?auto_202561 ?auto_202562 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_202569 - BLOCK
      ?auto_202570 - BLOCK
      ?auto_202571 - BLOCK
    )
    :vars
    (
      ?auto_202572 - BLOCK
      ?auto_202573 - BLOCK
      ?auto_202575 - BLOCK
      ?auto_202576 - BLOCK
      ?auto_202574 - BLOCK
      ?auto_202577 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_202569 ?auto_202570 ) ) ( not ( = ?auto_202569 ?auto_202571 ) ) ( not ( = ?auto_202570 ?auto_202571 ) ) ( not ( = ?auto_202569 ?auto_202572 ) ) ( not ( = ?auto_202570 ?auto_202572 ) ) ( not ( = ?auto_202571 ?auto_202572 ) ) ( not ( = ?auto_202573 ?auto_202575 ) ) ( not ( = ?auto_202573 ?auto_202576 ) ) ( not ( = ?auto_202573 ?auto_202574 ) ) ( not ( = ?auto_202573 ?auto_202572 ) ) ( not ( = ?auto_202573 ?auto_202571 ) ) ( not ( = ?auto_202573 ?auto_202570 ) ) ( not ( = ?auto_202575 ?auto_202576 ) ) ( not ( = ?auto_202575 ?auto_202574 ) ) ( not ( = ?auto_202575 ?auto_202572 ) ) ( not ( = ?auto_202575 ?auto_202571 ) ) ( not ( = ?auto_202575 ?auto_202570 ) ) ( not ( = ?auto_202576 ?auto_202574 ) ) ( not ( = ?auto_202576 ?auto_202572 ) ) ( not ( = ?auto_202576 ?auto_202571 ) ) ( not ( = ?auto_202576 ?auto_202570 ) ) ( not ( = ?auto_202574 ?auto_202572 ) ) ( not ( = ?auto_202574 ?auto_202571 ) ) ( not ( = ?auto_202574 ?auto_202570 ) ) ( not ( = ?auto_202569 ?auto_202573 ) ) ( not ( = ?auto_202569 ?auto_202575 ) ) ( not ( = ?auto_202569 ?auto_202576 ) ) ( not ( = ?auto_202569 ?auto_202574 ) ) ( ON ?auto_202569 ?auto_202577 ) ( not ( = ?auto_202569 ?auto_202577 ) ) ( not ( = ?auto_202570 ?auto_202577 ) ) ( not ( = ?auto_202571 ?auto_202577 ) ) ( not ( = ?auto_202572 ?auto_202577 ) ) ( not ( = ?auto_202573 ?auto_202577 ) ) ( not ( = ?auto_202575 ?auto_202577 ) ) ( not ( = ?auto_202576 ?auto_202577 ) ) ( not ( = ?auto_202574 ?auto_202577 ) ) ( ON ?auto_202570 ?auto_202569 ) ( ON-TABLE ?auto_202577 ) ( ON ?auto_202571 ?auto_202570 ) ( ON ?auto_202572 ?auto_202571 ) ( ON ?auto_202574 ?auto_202572 ) ( ON ?auto_202576 ?auto_202574 ) ( ON ?auto_202575 ?auto_202576 ) ( ON ?auto_202573 ?auto_202575 ) ( CLEAR ?auto_202573 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_202577 ?auto_202569 ?auto_202570 ?auto_202571 ?auto_202572 ?auto_202574 ?auto_202576 ?auto_202575 )
      ( MAKE-3PILE ?auto_202569 ?auto_202570 ?auto_202571 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_202582 - BLOCK
      ?auto_202583 - BLOCK
      ?auto_202584 - BLOCK
      ?auto_202585 - BLOCK
    )
    :vars
    (
      ?auto_202586 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_202586 ?auto_202585 ) ( CLEAR ?auto_202586 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_202582 ) ( ON ?auto_202583 ?auto_202582 ) ( ON ?auto_202584 ?auto_202583 ) ( ON ?auto_202585 ?auto_202584 ) ( not ( = ?auto_202582 ?auto_202583 ) ) ( not ( = ?auto_202582 ?auto_202584 ) ) ( not ( = ?auto_202582 ?auto_202585 ) ) ( not ( = ?auto_202582 ?auto_202586 ) ) ( not ( = ?auto_202583 ?auto_202584 ) ) ( not ( = ?auto_202583 ?auto_202585 ) ) ( not ( = ?auto_202583 ?auto_202586 ) ) ( not ( = ?auto_202584 ?auto_202585 ) ) ( not ( = ?auto_202584 ?auto_202586 ) ) ( not ( = ?auto_202585 ?auto_202586 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_202586 ?auto_202585 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_202587 - BLOCK
      ?auto_202588 - BLOCK
      ?auto_202589 - BLOCK
      ?auto_202590 - BLOCK
    )
    :vars
    (
      ?auto_202591 - BLOCK
      ?auto_202592 - BLOCK
      ?auto_202593 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_202591 ?auto_202590 ) ( CLEAR ?auto_202591 ) ( ON-TABLE ?auto_202587 ) ( ON ?auto_202588 ?auto_202587 ) ( ON ?auto_202589 ?auto_202588 ) ( ON ?auto_202590 ?auto_202589 ) ( not ( = ?auto_202587 ?auto_202588 ) ) ( not ( = ?auto_202587 ?auto_202589 ) ) ( not ( = ?auto_202587 ?auto_202590 ) ) ( not ( = ?auto_202587 ?auto_202591 ) ) ( not ( = ?auto_202588 ?auto_202589 ) ) ( not ( = ?auto_202588 ?auto_202590 ) ) ( not ( = ?auto_202588 ?auto_202591 ) ) ( not ( = ?auto_202589 ?auto_202590 ) ) ( not ( = ?auto_202589 ?auto_202591 ) ) ( not ( = ?auto_202590 ?auto_202591 ) ) ( HOLDING ?auto_202592 ) ( CLEAR ?auto_202593 ) ( not ( = ?auto_202587 ?auto_202592 ) ) ( not ( = ?auto_202587 ?auto_202593 ) ) ( not ( = ?auto_202588 ?auto_202592 ) ) ( not ( = ?auto_202588 ?auto_202593 ) ) ( not ( = ?auto_202589 ?auto_202592 ) ) ( not ( = ?auto_202589 ?auto_202593 ) ) ( not ( = ?auto_202590 ?auto_202592 ) ) ( not ( = ?auto_202590 ?auto_202593 ) ) ( not ( = ?auto_202591 ?auto_202592 ) ) ( not ( = ?auto_202591 ?auto_202593 ) ) ( not ( = ?auto_202592 ?auto_202593 ) ) )
    :subtasks
    ( ( !STACK ?auto_202592 ?auto_202593 )
      ( MAKE-4PILE ?auto_202587 ?auto_202588 ?auto_202589 ?auto_202590 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_202594 - BLOCK
      ?auto_202595 - BLOCK
      ?auto_202596 - BLOCK
      ?auto_202597 - BLOCK
    )
    :vars
    (
      ?auto_202598 - BLOCK
      ?auto_202599 - BLOCK
      ?auto_202600 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_202598 ?auto_202597 ) ( ON-TABLE ?auto_202594 ) ( ON ?auto_202595 ?auto_202594 ) ( ON ?auto_202596 ?auto_202595 ) ( ON ?auto_202597 ?auto_202596 ) ( not ( = ?auto_202594 ?auto_202595 ) ) ( not ( = ?auto_202594 ?auto_202596 ) ) ( not ( = ?auto_202594 ?auto_202597 ) ) ( not ( = ?auto_202594 ?auto_202598 ) ) ( not ( = ?auto_202595 ?auto_202596 ) ) ( not ( = ?auto_202595 ?auto_202597 ) ) ( not ( = ?auto_202595 ?auto_202598 ) ) ( not ( = ?auto_202596 ?auto_202597 ) ) ( not ( = ?auto_202596 ?auto_202598 ) ) ( not ( = ?auto_202597 ?auto_202598 ) ) ( CLEAR ?auto_202599 ) ( not ( = ?auto_202594 ?auto_202600 ) ) ( not ( = ?auto_202594 ?auto_202599 ) ) ( not ( = ?auto_202595 ?auto_202600 ) ) ( not ( = ?auto_202595 ?auto_202599 ) ) ( not ( = ?auto_202596 ?auto_202600 ) ) ( not ( = ?auto_202596 ?auto_202599 ) ) ( not ( = ?auto_202597 ?auto_202600 ) ) ( not ( = ?auto_202597 ?auto_202599 ) ) ( not ( = ?auto_202598 ?auto_202600 ) ) ( not ( = ?auto_202598 ?auto_202599 ) ) ( not ( = ?auto_202600 ?auto_202599 ) ) ( ON ?auto_202600 ?auto_202598 ) ( CLEAR ?auto_202600 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_202594 ?auto_202595 ?auto_202596 ?auto_202597 ?auto_202598 )
      ( MAKE-4PILE ?auto_202594 ?auto_202595 ?auto_202596 ?auto_202597 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_202601 - BLOCK
      ?auto_202602 - BLOCK
      ?auto_202603 - BLOCK
      ?auto_202604 - BLOCK
    )
    :vars
    (
      ?auto_202607 - BLOCK
      ?auto_202605 - BLOCK
      ?auto_202606 - BLOCK
      ?auto_202608 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_202607 ?auto_202604 ) ( ON-TABLE ?auto_202601 ) ( ON ?auto_202602 ?auto_202601 ) ( ON ?auto_202603 ?auto_202602 ) ( ON ?auto_202604 ?auto_202603 ) ( not ( = ?auto_202601 ?auto_202602 ) ) ( not ( = ?auto_202601 ?auto_202603 ) ) ( not ( = ?auto_202601 ?auto_202604 ) ) ( not ( = ?auto_202601 ?auto_202607 ) ) ( not ( = ?auto_202602 ?auto_202603 ) ) ( not ( = ?auto_202602 ?auto_202604 ) ) ( not ( = ?auto_202602 ?auto_202607 ) ) ( not ( = ?auto_202603 ?auto_202604 ) ) ( not ( = ?auto_202603 ?auto_202607 ) ) ( not ( = ?auto_202604 ?auto_202607 ) ) ( not ( = ?auto_202601 ?auto_202605 ) ) ( not ( = ?auto_202601 ?auto_202606 ) ) ( not ( = ?auto_202602 ?auto_202605 ) ) ( not ( = ?auto_202602 ?auto_202606 ) ) ( not ( = ?auto_202603 ?auto_202605 ) ) ( not ( = ?auto_202603 ?auto_202606 ) ) ( not ( = ?auto_202604 ?auto_202605 ) ) ( not ( = ?auto_202604 ?auto_202606 ) ) ( not ( = ?auto_202607 ?auto_202605 ) ) ( not ( = ?auto_202607 ?auto_202606 ) ) ( not ( = ?auto_202605 ?auto_202606 ) ) ( ON ?auto_202605 ?auto_202607 ) ( CLEAR ?auto_202605 ) ( HOLDING ?auto_202606 ) ( CLEAR ?auto_202608 ) ( ON-TABLE ?auto_202608 ) ( not ( = ?auto_202608 ?auto_202606 ) ) ( not ( = ?auto_202601 ?auto_202608 ) ) ( not ( = ?auto_202602 ?auto_202608 ) ) ( not ( = ?auto_202603 ?auto_202608 ) ) ( not ( = ?auto_202604 ?auto_202608 ) ) ( not ( = ?auto_202607 ?auto_202608 ) ) ( not ( = ?auto_202605 ?auto_202608 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_202608 ?auto_202606 )
      ( MAKE-4PILE ?auto_202601 ?auto_202602 ?auto_202603 ?auto_202604 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_202609 - BLOCK
      ?auto_202610 - BLOCK
      ?auto_202611 - BLOCK
      ?auto_202612 - BLOCK
    )
    :vars
    (
      ?auto_202613 - BLOCK
      ?auto_202614 - BLOCK
      ?auto_202616 - BLOCK
      ?auto_202615 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_202613 ?auto_202612 ) ( ON-TABLE ?auto_202609 ) ( ON ?auto_202610 ?auto_202609 ) ( ON ?auto_202611 ?auto_202610 ) ( ON ?auto_202612 ?auto_202611 ) ( not ( = ?auto_202609 ?auto_202610 ) ) ( not ( = ?auto_202609 ?auto_202611 ) ) ( not ( = ?auto_202609 ?auto_202612 ) ) ( not ( = ?auto_202609 ?auto_202613 ) ) ( not ( = ?auto_202610 ?auto_202611 ) ) ( not ( = ?auto_202610 ?auto_202612 ) ) ( not ( = ?auto_202610 ?auto_202613 ) ) ( not ( = ?auto_202611 ?auto_202612 ) ) ( not ( = ?auto_202611 ?auto_202613 ) ) ( not ( = ?auto_202612 ?auto_202613 ) ) ( not ( = ?auto_202609 ?auto_202614 ) ) ( not ( = ?auto_202609 ?auto_202616 ) ) ( not ( = ?auto_202610 ?auto_202614 ) ) ( not ( = ?auto_202610 ?auto_202616 ) ) ( not ( = ?auto_202611 ?auto_202614 ) ) ( not ( = ?auto_202611 ?auto_202616 ) ) ( not ( = ?auto_202612 ?auto_202614 ) ) ( not ( = ?auto_202612 ?auto_202616 ) ) ( not ( = ?auto_202613 ?auto_202614 ) ) ( not ( = ?auto_202613 ?auto_202616 ) ) ( not ( = ?auto_202614 ?auto_202616 ) ) ( ON ?auto_202614 ?auto_202613 ) ( CLEAR ?auto_202615 ) ( ON-TABLE ?auto_202615 ) ( not ( = ?auto_202615 ?auto_202616 ) ) ( not ( = ?auto_202609 ?auto_202615 ) ) ( not ( = ?auto_202610 ?auto_202615 ) ) ( not ( = ?auto_202611 ?auto_202615 ) ) ( not ( = ?auto_202612 ?auto_202615 ) ) ( not ( = ?auto_202613 ?auto_202615 ) ) ( not ( = ?auto_202614 ?auto_202615 ) ) ( ON ?auto_202616 ?auto_202614 ) ( CLEAR ?auto_202616 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_202609 ?auto_202610 ?auto_202611 ?auto_202612 ?auto_202613 ?auto_202614 )
      ( MAKE-4PILE ?auto_202609 ?auto_202610 ?auto_202611 ?auto_202612 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_202617 - BLOCK
      ?auto_202618 - BLOCK
      ?auto_202619 - BLOCK
      ?auto_202620 - BLOCK
    )
    :vars
    (
      ?auto_202623 - BLOCK
      ?auto_202624 - BLOCK
      ?auto_202621 - BLOCK
      ?auto_202622 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_202623 ?auto_202620 ) ( ON-TABLE ?auto_202617 ) ( ON ?auto_202618 ?auto_202617 ) ( ON ?auto_202619 ?auto_202618 ) ( ON ?auto_202620 ?auto_202619 ) ( not ( = ?auto_202617 ?auto_202618 ) ) ( not ( = ?auto_202617 ?auto_202619 ) ) ( not ( = ?auto_202617 ?auto_202620 ) ) ( not ( = ?auto_202617 ?auto_202623 ) ) ( not ( = ?auto_202618 ?auto_202619 ) ) ( not ( = ?auto_202618 ?auto_202620 ) ) ( not ( = ?auto_202618 ?auto_202623 ) ) ( not ( = ?auto_202619 ?auto_202620 ) ) ( not ( = ?auto_202619 ?auto_202623 ) ) ( not ( = ?auto_202620 ?auto_202623 ) ) ( not ( = ?auto_202617 ?auto_202624 ) ) ( not ( = ?auto_202617 ?auto_202621 ) ) ( not ( = ?auto_202618 ?auto_202624 ) ) ( not ( = ?auto_202618 ?auto_202621 ) ) ( not ( = ?auto_202619 ?auto_202624 ) ) ( not ( = ?auto_202619 ?auto_202621 ) ) ( not ( = ?auto_202620 ?auto_202624 ) ) ( not ( = ?auto_202620 ?auto_202621 ) ) ( not ( = ?auto_202623 ?auto_202624 ) ) ( not ( = ?auto_202623 ?auto_202621 ) ) ( not ( = ?auto_202624 ?auto_202621 ) ) ( ON ?auto_202624 ?auto_202623 ) ( not ( = ?auto_202622 ?auto_202621 ) ) ( not ( = ?auto_202617 ?auto_202622 ) ) ( not ( = ?auto_202618 ?auto_202622 ) ) ( not ( = ?auto_202619 ?auto_202622 ) ) ( not ( = ?auto_202620 ?auto_202622 ) ) ( not ( = ?auto_202623 ?auto_202622 ) ) ( not ( = ?auto_202624 ?auto_202622 ) ) ( ON ?auto_202621 ?auto_202624 ) ( CLEAR ?auto_202621 ) ( HOLDING ?auto_202622 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_202622 )
      ( MAKE-4PILE ?auto_202617 ?auto_202618 ?auto_202619 ?auto_202620 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_202625 - BLOCK
      ?auto_202626 - BLOCK
      ?auto_202627 - BLOCK
      ?auto_202628 - BLOCK
    )
    :vars
    (
      ?auto_202629 - BLOCK
      ?auto_202632 - BLOCK
      ?auto_202630 - BLOCK
      ?auto_202631 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_202629 ?auto_202628 ) ( ON-TABLE ?auto_202625 ) ( ON ?auto_202626 ?auto_202625 ) ( ON ?auto_202627 ?auto_202626 ) ( ON ?auto_202628 ?auto_202627 ) ( not ( = ?auto_202625 ?auto_202626 ) ) ( not ( = ?auto_202625 ?auto_202627 ) ) ( not ( = ?auto_202625 ?auto_202628 ) ) ( not ( = ?auto_202625 ?auto_202629 ) ) ( not ( = ?auto_202626 ?auto_202627 ) ) ( not ( = ?auto_202626 ?auto_202628 ) ) ( not ( = ?auto_202626 ?auto_202629 ) ) ( not ( = ?auto_202627 ?auto_202628 ) ) ( not ( = ?auto_202627 ?auto_202629 ) ) ( not ( = ?auto_202628 ?auto_202629 ) ) ( not ( = ?auto_202625 ?auto_202632 ) ) ( not ( = ?auto_202625 ?auto_202630 ) ) ( not ( = ?auto_202626 ?auto_202632 ) ) ( not ( = ?auto_202626 ?auto_202630 ) ) ( not ( = ?auto_202627 ?auto_202632 ) ) ( not ( = ?auto_202627 ?auto_202630 ) ) ( not ( = ?auto_202628 ?auto_202632 ) ) ( not ( = ?auto_202628 ?auto_202630 ) ) ( not ( = ?auto_202629 ?auto_202632 ) ) ( not ( = ?auto_202629 ?auto_202630 ) ) ( not ( = ?auto_202632 ?auto_202630 ) ) ( ON ?auto_202632 ?auto_202629 ) ( not ( = ?auto_202631 ?auto_202630 ) ) ( not ( = ?auto_202625 ?auto_202631 ) ) ( not ( = ?auto_202626 ?auto_202631 ) ) ( not ( = ?auto_202627 ?auto_202631 ) ) ( not ( = ?auto_202628 ?auto_202631 ) ) ( not ( = ?auto_202629 ?auto_202631 ) ) ( not ( = ?auto_202632 ?auto_202631 ) ) ( ON ?auto_202630 ?auto_202632 ) ( ON ?auto_202631 ?auto_202630 ) ( CLEAR ?auto_202631 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_202625 ?auto_202626 ?auto_202627 ?auto_202628 ?auto_202629 ?auto_202632 ?auto_202630 )
      ( MAKE-4PILE ?auto_202625 ?auto_202626 ?auto_202627 ?auto_202628 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_202633 - BLOCK
      ?auto_202634 - BLOCK
      ?auto_202635 - BLOCK
      ?auto_202636 - BLOCK
    )
    :vars
    (
      ?auto_202637 - BLOCK
      ?auto_202640 - BLOCK
      ?auto_202639 - BLOCK
      ?auto_202638 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_202637 ?auto_202636 ) ( ON-TABLE ?auto_202633 ) ( ON ?auto_202634 ?auto_202633 ) ( ON ?auto_202635 ?auto_202634 ) ( ON ?auto_202636 ?auto_202635 ) ( not ( = ?auto_202633 ?auto_202634 ) ) ( not ( = ?auto_202633 ?auto_202635 ) ) ( not ( = ?auto_202633 ?auto_202636 ) ) ( not ( = ?auto_202633 ?auto_202637 ) ) ( not ( = ?auto_202634 ?auto_202635 ) ) ( not ( = ?auto_202634 ?auto_202636 ) ) ( not ( = ?auto_202634 ?auto_202637 ) ) ( not ( = ?auto_202635 ?auto_202636 ) ) ( not ( = ?auto_202635 ?auto_202637 ) ) ( not ( = ?auto_202636 ?auto_202637 ) ) ( not ( = ?auto_202633 ?auto_202640 ) ) ( not ( = ?auto_202633 ?auto_202639 ) ) ( not ( = ?auto_202634 ?auto_202640 ) ) ( not ( = ?auto_202634 ?auto_202639 ) ) ( not ( = ?auto_202635 ?auto_202640 ) ) ( not ( = ?auto_202635 ?auto_202639 ) ) ( not ( = ?auto_202636 ?auto_202640 ) ) ( not ( = ?auto_202636 ?auto_202639 ) ) ( not ( = ?auto_202637 ?auto_202640 ) ) ( not ( = ?auto_202637 ?auto_202639 ) ) ( not ( = ?auto_202640 ?auto_202639 ) ) ( ON ?auto_202640 ?auto_202637 ) ( not ( = ?auto_202638 ?auto_202639 ) ) ( not ( = ?auto_202633 ?auto_202638 ) ) ( not ( = ?auto_202634 ?auto_202638 ) ) ( not ( = ?auto_202635 ?auto_202638 ) ) ( not ( = ?auto_202636 ?auto_202638 ) ) ( not ( = ?auto_202637 ?auto_202638 ) ) ( not ( = ?auto_202640 ?auto_202638 ) ) ( ON ?auto_202639 ?auto_202640 ) ( HOLDING ?auto_202638 ) ( CLEAR ?auto_202639 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_202633 ?auto_202634 ?auto_202635 ?auto_202636 ?auto_202637 ?auto_202640 ?auto_202639 ?auto_202638 )
      ( MAKE-4PILE ?auto_202633 ?auto_202634 ?auto_202635 ?auto_202636 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_202641 - BLOCK
      ?auto_202642 - BLOCK
      ?auto_202643 - BLOCK
      ?auto_202644 - BLOCK
    )
    :vars
    (
      ?auto_202646 - BLOCK
      ?auto_202648 - BLOCK
      ?auto_202647 - BLOCK
      ?auto_202645 - BLOCK
      ?auto_202649 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_202646 ?auto_202644 ) ( ON-TABLE ?auto_202641 ) ( ON ?auto_202642 ?auto_202641 ) ( ON ?auto_202643 ?auto_202642 ) ( ON ?auto_202644 ?auto_202643 ) ( not ( = ?auto_202641 ?auto_202642 ) ) ( not ( = ?auto_202641 ?auto_202643 ) ) ( not ( = ?auto_202641 ?auto_202644 ) ) ( not ( = ?auto_202641 ?auto_202646 ) ) ( not ( = ?auto_202642 ?auto_202643 ) ) ( not ( = ?auto_202642 ?auto_202644 ) ) ( not ( = ?auto_202642 ?auto_202646 ) ) ( not ( = ?auto_202643 ?auto_202644 ) ) ( not ( = ?auto_202643 ?auto_202646 ) ) ( not ( = ?auto_202644 ?auto_202646 ) ) ( not ( = ?auto_202641 ?auto_202648 ) ) ( not ( = ?auto_202641 ?auto_202647 ) ) ( not ( = ?auto_202642 ?auto_202648 ) ) ( not ( = ?auto_202642 ?auto_202647 ) ) ( not ( = ?auto_202643 ?auto_202648 ) ) ( not ( = ?auto_202643 ?auto_202647 ) ) ( not ( = ?auto_202644 ?auto_202648 ) ) ( not ( = ?auto_202644 ?auto_202647 ) ) ( not ( = ?auto_202646 ?auto_202648 ) ) ( not ( = ?auto_202646 ?auto_202647 ) ) ( not ( = ?auto_202648 ?auto_202647 ) ) ( ON ?auto_202648 ?auto_202646 ) ( not ( = ?auto_202645 ?auto_202647 ) ) ( not ( = ?auto_202641 ?auto_202645 ) ) ( not ( = ?auto_202642 ?auto_202645 ) ) ( not ( = ?auto_202643 ?auto_202645 ) ) ( not ( = ?auto_202644 ?auto_202645 ) ) ( not ( = ?auto_202646 ?auto_202645 ) ) ( not ( = ?auto_202648 ?auto_202645 ) ) ( ON ?auto_202647 ?auto_202648 ) ( CLEAR ?auto_202647 ) ( ON ?auto_202645 ?auto_202649 ) ( CLEAR ?auto_202645 ) ( HAND-EMPTY ) ( not ( = ?auto_202641 ?auto_202649 ) ) ( not ( = ?auto_202642 ?auto_202649 ) ) ( not ( = ?auto_202643 ?auto_202649 ) ) ( not ( = ?auto_202644 ?auto_202649 ) ) ( not ( = ?auto_202646 ?auto_202649 ) ) ( not ( = ?auto_202648 ?auto_202649 ) ) ( not ( = ?auto_202647 ?auto_202649 ) ) ( not ( = ?auto_202645 ?auto_202649 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_202645 ?auto_202649 )
      ( MAKE-4PILE ?auto_202641 ?auto_202642 ?auto_202643 ?auto_202644 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_202650 - BLOCK
      ?auto_202651 - BLOCK
      ?auto_202652 - BLOCK
      ?auto_202653 - BLOCK
    )
    :vars
    (
      ?auto_202657 - BLOCK
      ?auto_202654 - BLOCK
      ?auto_202656 - BLOCK
      ?auto_202655 - BLOCK
      ?auto_202658 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_202657 ?auto_202653 ) ( ON-TABLE ?auto_202650 ) ( ON ?auto_202651 ?auto_202650 ) ( ON ?auto_202652 ?auto_202651 ) ( ON ?auto_202653 ?auto_202652 ) ( not ( = ?auto_202650 ?auto_202651 ) ) ( not ( = ?auto_202650 ?auto_202652 ) ) ( not ( = ?auto_202650 ?auto_202653 ) ) ( not ( = ?auto_202650 ?auto_202657 ) ) ( not ( = ?auto_202651 ?auto_202652 ) ) ( not ( = ?auto_202651 ?auto_202653 ) ) ( not ( = ?auto_202651 ?auto_202657 ) ) ( not ( = ?auto_202652 ?auto_202653 ) ) ( not ( = ?auto_202652 ?auto_202657 ) ) ( not ( = ?auto_202653 ?auto_202657 ) ) ( not ( = ?auto_202650 ?auto_202654 ) ) ( not ( = ?auto_202650 ?auto_202656 ) ) ( not ( = ?auto_202651 ?auto_202654 ) ) ( not ( = ?auto_202651 ?auto_202656 ) ) ( not ( = ?auto_202652 ?auto_202654 ) ) ( not ( = ?auto_202652 ?auto_202656 ) ) ( not ( = ?auto_202653 ?auto_202654 ) ) ( not ( = ?auto_202653 ?auto_202656 ) ) ( not ( = ?auto_202657 ?auto_202654 ) ) ( not ( = ?auto_202657 ?auto_202656 ) ) ( not ( = ?auto_202654 ?auto_202656 ) ) ( ON ?auto_202654 ?auto_202657 ) ( not ( = ?auto_202655 ?auto_202656 ) ) ( not ( = ?auto_202650 ?auto_202655 ) ) ( not ( = ?auto_202651 ?auto_202655 ) ) ( not ( = ?auto_202652 ?auto_202655 ) ) ( not ( = ?auto_202653 ?auto_202655 ) ) ( not ( = ?auto_202657 ?auto_202655 ) ) ( not ( = ?auto_202654 ?auto_202655 ) ) ( ON ?auto_202655 ?auto_202658 ) ( CLEAR ?auto_202655 ) ( not ( = ?auto_202650 ?auto_202658 ) ) ( not ( = ?auto_202651 ?auto_202658 ) ) ( not ( = ?auto_202652 ?auto_202658 ) ) ( not ( = ?auto_202653 ?auto_202658 ) ) ( not ( = ?auto_202657 ?auto_202658 ) ) ( not ( = ?auto_202654 ?auto_202658 ) ) ( not ( = ?auto_202656 ?auto_202658 ) ) ( not ( = ?auto_202655 ?auto_202658 ) ) ( HOLDING ?auto_202656 ) ( CLEAR ?auto_202654 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_202650 ?auto_202651 ?auto_202652 ?auto_202653 ?auto_202657 ?auto_202654 ?auto_202656 )
      ( MAKE-4PILE ?auto_202650 ?auto_202651 ?auto_202652 ?auto_202653 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_202659 - BLOCK
      ?auto_202660 - BLOCK
      ?auto_202661 - BLOCK
      ?auto_202662 - BLOCK
    )
    :vars
    (
      ?auto_202667 - BLOCK
      ?auto_202664 - BLOCK
      ?auto_202665 - BLOCK
      ?auto_202666 - BLOCK
      ?auto_202663 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_202667 ?auto_202662 ) ( ON-TABLE ?auto_202659 ) ( ON ?auto_202660 ?auto_202659 ) ( ON ?auto_202661 ?auto_202660 ) ( ON ?auto_202662 ?auto_202661 ) ( not ( = ?auto_202659 ?auto_202660 ) ) ( not ( = ?auto_202659 ?auto_202661 ) ) ( not ( = ?auto_202659 ?auto_202662 ) ) ( not ( = ?auto_202659 ?auto_202667 ) ) ( not ( = ?auto_202660 ?auto_202661 ) ) ( not ( = ?auto_202660 ?auto_202662 ) ) ( not ( = ?auto_202660 ?auto_202667 ) ) ( not ( = ?auto_202661 ?auto_202662 ) ) ( not ( = ?auto_202661 ?auto_202667 ) ) ( not ( = ?auto_202662 ?auto_202667 ) ) ( not ( = ?auto_202659 ?auto_202664 ) ) ( not ( = ?auto_202659 ?auto_202665 ) ) ( not ( = ?auto_202660 ?auto_202664 ) ) ( not ( = ?auto_202660 ?auto_202665 ) ) ( not ( = ?auto_202661 ?auto_202664 ) ) ( not ( = ?auto_202661 ?auto_202665 ) ) ( not ( = ?auto_202662 ?auto_202664 ) ) ( not ( = ?auto_202662 ?auto_202665 ) ) ( not ( = ?auto_202667 ?auto_202664 ) ) ( not ( = ?auto_202667 ?auto_202665 ) ) ( not ( = ?auto_202664 ?auto_202665 ) ) ( ON ?auto_202664 ?auto_202667 ) ( not ( = ?auto_202666 ?auto_202665 ) ) ( not ( = ?auto_202659 ?auto_202666 ) ) ( not ( = ?auto_202660 ?auto_202666 ) ) ( not ( = ?auto_202661 ?auto_202666 ) ) ( not ( = ?auto_202662 ?auto_202666 ) ) ( not ( = ?auto_202667 ?auto_202666 ) ) ( not ( = ?auto_202664 ?auto_202666 ) ) ( ON ?auto_202666 ?auto_202663 ) ( not ( = ?auto_202659 ?auto_202663 ) ) ( not ( = ?auto_202660 ?auto_202663 ) ) ( not ( = ?auto_202661 ?auto_202663 ) ) ( not ( = ?auto_202662 ?auto_202663 ) ) ( not ( = ?auto_202667 ?auto_202663 ) ) ( not ( = ?auto_202664 ?auto_202663 ) ) ( not ( = ?auto_202665 ?auto_202663 ) ) ( not ( = ?auto_202666 ?auto_202663 ) ) ( CLEAR ?auto_202664 ) ( ON ?auto_202665 ?auto_202666 ) ( CLEAR ?auto_202665 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_202663 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_202663 ?auto_202666 )
      ( MAKE-4PILE ?auto_202659 ?auto_202660 ?auto_202661 ?auto_202662 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_202668 - BLOCK
      ?auto_202669 - BLOCK
      ?auto_202670 - BLOCK
      ?auto_202671 - BLOCK
    )
    :vars
    (
      ?auto_202675 - BLOCK
      ?auto_202673 - BLOCK
      ?auto_202672 - BLOCK
      ?auto_202676 - BLOCK
      ?auto_202674 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_202675 ?auto_202671 ) ( ON-TABLE ?auto_202668 ) ( ON ?auto_202669 ?auto_202668 ) ( ON ?auto_202670 ?auto_202669 ) ( ON ?auto_202671 ?auto_202670 ) ( not ( = ?auto_202668 ?auto_202669 ) ) ( not ( = ?auto_202668 ?auto_202670 ) ) ( not ( = ?auto_202668 ?auto_202671 ) ) ( not ( = ?auto_202668 ?auto_202675 ) ) ( not ( = ?auto_202669 ?auto_202670 ) ) ( not ( = ?auto_202669 ?auto_202671 ) ) ( not ( = ?auto_202669 ?auto_202675 ) ) ( not ( = ?auto_202670 ?auto_202671 ) ) ( not ( = ?auto_202670 ?auto_202675 ) ) ( not ( = ?auto_202671 ?auto_202675 ) ) ( not ( = ?auto_202668 ?auto_202673 ) ) ( not ( = ?auto_202668 ?auto_202672 ) ) ( not ( = ?auto_202669 ?auto_202673 ) ) ( not ( = ?auto_202669 ?auto_202672 ) ) ( not ( = ?auto_202670 ?auto_202673 ) ) ( not ( = ?auto_202670 ?auto_202672 ) ) ( not ( = ?auto_202671 ?auto_202673 ) ) ( not ( = ?auto_202671 ?auto_202672 ) ) ( not ( = ?auto_202675 ?auto_202673 ) ) ( not ( = ?auto_202675 ?auto_202672 ) ) ( not ( = ?auto_202673 ?auto_202672 ) ) ( not ( = ?auto_202676 ?auto_202672 ) ) ( not ( = ?auto_202668 ?auto_202676 ) ) ( not ( = ?auto_202669 ?auto_202676 ) ) ( not ( = ?auto_202670 ?auto_202676 ) ) ( not ( = ?auto_202671 ?auto_202676 ) ) ( not ( = ?auto_202675 ?auto_202676 ) ) ( not ( = ?auto_202673 ?auto_202676 ) ) ( ON ?auto_202676 ?auto_202674 ) ( not ( = ?auto_202668 ?auto_202674 ) ) ( not ( = ?auto_202669 ?auto_202674 ) ) ( not ( = ?auto_202670 ?auto_202674 ) ) ( not ( = ?auto_202671 ?auto_202674 ) ) ( not ( = ?auto_202675 ?auto_202674 ) ) ( not ( = ?auto_202673 ?auto_202674 ) ) ( not ( = ?auto_202672 ?auto_202674 ) ) ( not ( = ?auto_202676 ?auto_202674 ) ) ( ON ?auto_202672 ?auto_202676 ) ( CLEAR ?auto_202672 ) ( ON-TABLE ?auto_202674 ) ( HOLDING ?auto_202673 ) ( CLEAR ?auto_202675 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_202668 ?auto_202669 ?auto_202670 ?auto_202671 ?auto_202675 ?auto_202673 )
      ( MAKE-4PILE ?auto_202668 ?auto_202669 ?auto_202670 ?auto_202671 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_202677 - BLOCK
      ?auto_202678 - BLOCK
      ?auto_202679 - BLOCK
      ?auto_202680 - BLOCK
    )
    :vars
    (
      ?auto_202683 - BLOCK
      ?auto_202684 - BLOCK
      ?auto_202681 - BLOCK
      ?auto_202685 - BLOCK
      ?auto_202682 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_202683 ?auto_202680 ) ( ON-TABLE ?auto_202677 ) ( ON ?auto_202678 ?auto_202677 ) ( ON ?auto_202679 ?auto_202678 ) ( ON ?auto_202680 ?auto_202679 ) ( not ( = ?auto_202677 ?auto_202678 ) ) ( not ( = ?auto_202677 ?auto_202679 ) ) ( not ( = ?auto_202677 ?auto_202680 ) ) ( not ( = ?auto_202677 ?auto_202683 ) ) ( not ( = ?auto_202678 ?auto_202679 ) ) ( not ( = ?auto_202678 ?auto_202680 ) ) ( not ( = ?auto_202678 ?auto_202683 ) ) ( not ( = ?auto_202679 ?auto_202680 ) ) ( not ( = ?auto_202679 ?auto_202683 ) ) ( not ( = ?auto_202680 ?auto_202683 ) ) ( not ( = ?auto_202677 ?auto_202684 ) ) ( not ( = ?auto_202677 ?auto_202681 ) ) ( not ( = ?auto_202678 ?auto_202684 ) ) ( not ( = ?auto_202678 ?auto_202681 ) ) ( not ( = ?auto_202679 ?auto_202684 ) ) ( not ( = ?auto_202679 ?auto_202681 ) ) ( not ( = ?auto_202680 ?auto_202684 ) ) ( not ( = ?auto_202680 ?auto_202681 ) ) ( not ( = ?auto_202683 ?auto_202684 ) ) ( not ( = ?auto_202683 ?auto_202681 ) ) ( not ( = ?auto_202684 ?auto_202681 ) ) ( not ( = ?auto_202685 ?auto_202681 ) ) ( not ( = ?auto_202677 ?auto_202685 ) ) ( not ( = ?auto_202678 ?auto_202685 ) ) ( not ( = ?auto_202679 ?auto_202685 ) ) ( not ( = ?auto_202680 ?auto_202685 ) ) ( not ( = ?auto_202683 ?auto_202685 ) ) ( not ( = ?auto_202684 ?auto_202685 ) ) ( ON ?auto_202685 ?auto_202682 ) ( not ( = ?auto_202677 ?auto_202682 ) ) ( not ( = ?auto_202678 ?auto_202682 ) ) ( not ( = ?auto_202679 ?auto_202682 ) ) ( not ( = ?auto_202680 ?auto_202682 ) ) ( not ( = ?auto_202683 ?auto_202682 ) ) ( not ( = ?auto_202684 ?auto_202682 ) ) ( not ( = ?auto_202681 ?auto_202682 ) ) ( not ( = ?auto_202685 ?auto_202682 ) ) ( ON ?auto_202681 ?auto_202685 ) ( ON-TABLE ?auto_202682 ) ( CLEAR ?auto_202683 ) ( ON ?auto_202684 ?auto_202681 ) ( CLEAR ?auto_202684 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_202682 ?auto_202685 ?auto_202681 )
      ( MAKE-4PILE ?auto_202677 ?auto_202678 ?auto_202679 ?auto_202680 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_202704 - BLOCK
      ?auto_202705 - BLOCK
      ?auto_202706 - BLOCK
      ?auto_202707 - BLOCK
    )
    :vars
    (
      ?auto_202712 - BLOCK
      ?auto_202708 - BLOCK
      ?auto_202709 - BLOCK
      ?auto_202710 - BLOCK
      ?auto_202711 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_202704 ) ( ON ?auto_202705 ?auto_202704 ) ( ON ?auto_202706 ?auto_202705 ) ( not ( = ?auto_202704 ?auto_202705 ) ) ( not ( = ?auto_202704 ?auto_202706 ) ) ( not ( = ?auto_202704 ?auto_202707 ) ) ( not ( = ?auto_202704 ?auto_202712 ) ) ( not ( = ?auto_202705 ?auto_202706 ) ) ( not ( = ?auto_202705 ?auto_202707 ) ) ( not ( = ?auto_202705 ?auto_202712 ) ) ( not ( = ?auto_202706 ?auto_202707 ) ) ( not ( = ?auto_202706 ?auto_202712 ) ) ( not ( = ?auto_202707 ?auto_202712 ) ) ( not ( = ?auto_202704 ?auto_202708 ) ) ( not ( = ?auto_202704 ?auto_202709 ) ) ( not ( = ?auto_202705 ?auto_202708 ) ) ( not ( = ?auto_202705 ?auto_202709 ) ) ( not ( = ?auto_202706 ?auto_202708 ) ) ( not ( = ?auto_202706 ?auto_202709 ) ) ( not ( = ?auto_202707 ?auto_202708 ) ) ( not ( = ?auto_202707 ?auto_202709 ) ) ( not ( = ?auto_202712 ?auto_202708 ) ) ( not ( = ?auto_202712 ?auto_202709 ) ) ( not ( = ?auto_202708 ?auto_202709 ) ) ( not ( = ?auto_202710 ?auto_202709 ) ) ( not ( = ?auto_202704 ?auto_202710 ) ) ( not ( = ?auto_202705 ?auto_202710 ) ) ( not ( = ?auto_202706 ?auto_202710 ) ) ( not ( = ?auto_202707 ?auto_202710 ) ) ( not ( = ?auto_202712 ?auto_202710 ) ) ( not ( = ?auto_202708 ?auto_202710 ) ) ( ON ?auto_202710 ?auto_202711 ) ( not ( = ?auto_202704 ?auto_202711 ) ) ( not ( = ?auto_202705 ?auto_202711 ) ) ( not ( = ?auto_202706 ?auto_202711 ) ) ( not ( = ?auto_202707 ?auto_202711 ) ) ( not ( = ?auto_202712 ?auto_202711 ) ) ( not ( = ?auto_202708 ?auto_202711 ) ) ( not ( = ?auto_202709 ?auto_202711 ) ) ( not ( = ?auto_202710 ?auto_202711 ) ) ( ON ?auto_202709 ?auto_202710 ) ( ON-TABLE ?auto_202711 ) ( ON ?auto_202708 ?auto_202709 ) ( ON ?auto_202712 ?auto_202708 ) ( CLEAR ?auto_202712 ) ( HOLDING ?auto_202707 ) ( CLEAR ?auto_202706 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_202704 ?auto_202705 ?auto_202706 ?auto_202707 ?auto_202712 )
      ( MAKE-4PILE ?auto_202704 ?auto_202705 ?auto_202706 ?auto_202707 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_202713 - BLOCK
      ?auto_202714 - BLOCK
      ?auto_202715 - BLOCK
      ?auto_202716 - BLOCK
    )
    :vars
    (
      ?auto_202721 - BLOCK
      ?auto_202719 - BLOCK
      ?auto_202720 - BLOCK
      ?auto_202717 - BLOCK
      ?auto_202718 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_202713 ) ( ON ?auto_202714 ?auto_202713 ) ( ON ?auto_202715 ?auto_202714 ) ( not ( = ?auto_202713 ?auto_202714 ) ) ( not ( = ?auto_202713 ?auto_202715 ) ) ( not ( = ?auto_202713 ?auto_202716 ) ) ( not ( = ?auto_202713 ?auto_202721 ) ) ( not ( = ?auto_202714 ?auto_202715 ) ) ( not ( = ?auto_202714 ?auto_202716 ) ) ( not ( = ?auto_202714 ?auto_202721 ) ) ( not ( = ?auto_202715 ?auto_202716 ) ) ( not ( = ?auto_202715 ?auto_202721 ) ) ( not ( = ?auto_202716 ?auto_202721 ) ) ( not ( = ?auto_202713 ?auto_202719 ) ) ( not ( = ?auto_202713 ?auto_202720 ) ) ( not ( = ?auto_202714 ?auto_202719 ) ) ( not ( = ?auto_202714 ?auto_202720 ) ) ( not ( = ?auto_202715 ?auto_202719 ) ) ( not ( = ?auto_202715 ?auto_202720 ) ) ( not ( = ?auto_202716 ?auto_202719 ) ) ( not ( = ?auto_202716 ?auto_202720 ) ) ( not ( = ?auto_202721 ?auto_202719 ) ) ( not ( = ?auto_202721 ?auto_202720 ) ) ( not ( = ?auto_202719 ?auto_202720 ) ) ( not ( = ?auto_202717 ?auto_202720 ) ) ( not ( = ?auto_202713 ?auto_202717 ) ) ( not ( = ?auto_202714 ?auto_202717 ) ) ( not ( = ?auto_202715 ?auto_202717 ) ) ( not ( = ?auto_202716 ?auto_202717 ) ) ( not ( = ?auto_202721 ?auto_202717 ) ) ( not ( = ?auto_202719 ?auto_202717 ) ) ( ON ?auto_202717 ?auto_202718 ) ( not ( = ?auto_202713 ?auto_202718 ) ) ( not ( = ?auto_202714 ?auto_202718 ) ) ( not ( = ?auto_202715 ?auto_202718 ) ) ( not ( = ?auto_202716 ?auto_202718 ) ) ( not ( = ?auto_202721 ?auto_202718 ) ) ( not ( = ?auto_202719 ?auto_202718 ) ) ( not ( = ?auto_202720 ?auto_202718 ) ) ( not ( = ?auto_202717 ?auto_202718 ) ) ( ON ?auto_202720 ?auto_202717 ) ( ON-TABLE ?auto_202718 ) ( ON ?auto_202719 ?auto_202720 ) ( ON ?auto_202721 ?auto_202719 ) ( CLEAR ?auto_202715 ) ( ON ?auto_202716 ?auto_202721 ) ( CLEAR ?auto_202716 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_202718 ?auto_202717 ?auto_202720 ?auto_202719 ?auto_202721 )
      ( MAKE-4PILE ?auto_202713 ?auto_202714 ?auto_202715 ?auto_202716 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_202722 - BLOCK
      ?auto_202723 - BLOCK
      ?auto_202724 - BLOCK
      ?auto_202725 - BLOCK
    )
    :vars
    (
      ?auto_202729 - BLOCK
      ?auto_202728 - BLOCK
      ?auto_202730 - BLOCK
      ?auto_202726 - BLOCK
      ?auto_202727 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_202722 ) ( ON ?auto_202723 ?auto_202722 ) ( not ( = ?auto_202722 ?auto_202723 ) ) ( not ( = ?auto_202722 ?auto_202724 ) ) ( not ( = ?auto_202722 ?auto_202725 ) ) ( not ( = ?auto_202722 ?auto_202729 ) ) ( not ( = ?auto_202723 ?auto_202724 ) ) ( not ( = ?auto_202723 ?auto_202725 ) ) ( not ( = ?auto_202723 ?auto_202729 ) ) ( not ( = ?auto_202724 ?auto_202725 ) ) ( not ( = ?auto_202724 ?auto_202729 ) ) ( not ( = ?auto_202725 ?auto_202729 ) ) ( not ( = ?auto_202722 ?auto_202728 ) ) ( not ( = ?auto_202722 ?auto_202730 ) ) ( not ( = ?auto_202723 ?auto_202728 ) ) ( not ( = ?auto_202723 ?auto_202730 ) ) ( not ( = ?auto_202724 ?auto_202728 ) ) ( not ( = ?auto_202724 ?auto_202730 ) ) ( not ( = ?auto_202725 ?auto_202728 ) ) ( not ( = ?auto_202725 ?auto_202730 ) ) ( not ( = ?auto_202729 ?auto_202728 ) ) ( not ( = ?auto_202729 ?auto_202730 ) ) ( not ( = ?auto_202728 ?auto_202730 ) ) ( not ( = ?auto_202726 ?auto_202730 ) ) ( not ( = ?auto_202722 ?auto_202726 ) ) ( not ( = ?auto_202723 ?auto_202726 ) ) ( not ( = ?auto_202724 ?auto_202726 ) ) ( not ( = ?auto_202725 ?auto_202726 ) ) ( not ( = ?auto_202729 ?auto_202726 ) ) ( not ( = ?auto_202728 ?auto_202726 ) ) ( ON ?auto_202726 ?auto_202727 ) ( not ( = ?auto_202722 ?auto_202727 ) ) ( not ( = ?auto_202723 ?auto_202727 ) ) ( not ( = ?auto_202724 ?auto_202727 ) ) ( not ( = ?auto_202725 ?auto_202727 ) ) ( not ( = ?auto_202729 ?auto_202727 ) ) ( not ( = ?auto_202728 ?auto_202727 ) ) ( not ( = ?auto_202730 ?auto_202727 ) ) ( not ( = ?auto_202726 ?auto_202727 ) ) ( ON ?auto_202730 ?auto_202726 ) ( ON-TABLE ?auto_202727 ) ( ON ?auto_202728 ?auto_202730 ) ( ON ?auto_202729 ?auto_202728 ) ( ON ?auto_202725 ?auto_202729 ) ( CLEAR ?auto_202725 ) ( HOLDING ?auto_202724 ) ( CLEAR ?auto_202723 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_202722 ?auto_202723 ?auto_202724 )
      ( MAKE-4PILE ?auto_202722 ?auto_202723 ?auto_202724 ?auto_202725 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_202731 - BLOCK
      ?auto_202732 - BLOCK
      ?auto_202733 - BLOCK
      ?auto_202734 - BLOCK
    )
    :vars
    (
      ?auto_202738 - BLOCK
      ?auto_202739 - BLOCK
      ?auto_202737 - BLOCK
      ?auto_202735 - BLOCK
      ?auto_202736 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_202731 ) ( ON ?auto_202732 ?auto_202731 ) ( not ( = ?auto_202731 ?auto_202732 ) ) ( not ( = ?auto_202731 ?auto_202733 ) ) ( not ( = ?auto_202731 ?auto_202734 ) ) ( not ( = ?auto_202731 ?auto_202738 ) ) ( not ( = ?auto_202732 ?auto_202733 ) ) ( not ( = ?auto_202732 ?auto_202734 ) ) ( not ( = ?auto_202732 ?auto_202738 ) ) ( not ( = ?auto_202733 ?auto_202734 ) ) ( not ( = ?auto_202733 ?auto_202738 ) ) ( not ( = ?auto_202734 ?auto_202738 ) ) ( not ( = ?auto_202731 ?auto_202739 ) ) ( not ( = ?auto_202731 ?auto_202737 ) ) ( not ( = ?auto_202732 ?auto_202739 ) ) ( not ( = ?auto_202732 ?auto_202737 ) ) ( not ( = ?auto_202733 ?auto_202739 ) ) ( not ( = ?auto_202733 ?auto_202737 ) ) ( not ( = ?auto_202734 ?auto_202739 ) ) ( not ( = ?auto_202734 ?auto_202737 ) ) ( not ( = ?auto_202738 ?auto_202739 ) ) ( not ( = ?auto_202738 ?auto_202737 ) ) ( not ( = ?auto_202739 ?auto_202737 ) ) ( not ( = ?auto_202735 ?auto_202737 ) ) ( not ( = ?auto_202731 ?auto_202735 ) ) ( not ( = ?auto_202732 ?auto_202735 ) ) ( not ( = ?auto_202733 ?auto_202735 ) ) ( not ( = ?auto_202734 ?auto_202735 ) ) ( not ( = ?auto_202738 ?auto_202735 ) ) ( not ( = ?auto_202739 ?auto_202735 ) ) ( ON ?auto_202735 ?auto_202736 ) ( not ( = ?auto_202731 ?auto_202736 ) ) ( not ( = ?auto_202732 ?auto_202736 ) ) ( not ( = ?auto_202733 ?auto_202736 ) ) ( not ( = ?auto_202734 ?auto_202736 ) ) ( not ( = ?auto_202738 ?auto_202736 ) ) ( not ( = ?auto_202739 ?auto_202736 ) ) ( not ( = ?auto_202737 ?auto_202736 ) ) ( not ( = ?auto_202735 ?auto_202736 ) ) ( ON ?auto_202737 ?auto_202735 ) ( ON-TABLE ?auto_202736 ) ( ON ?auto_202739 ?auto_202737 ) ( ON ?auto_202738 ?auto_202739 ) ( ON ?auto_202734 ?auto_202738 ) ( CLEAR ?auto_202732 ) ( ON ?auto_202733 ?auto_202734 ) ( CLEAR ?auto_202733 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_202736 ?auto_202735 ?auto_202737 ?auto_202739 ?auto_202738 ?auto_202734 )
      ( MAKE-4PILE ?auto_202731 ?auto_202732 ?auto_202733 ?auto_202734 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_202740 - BLOCK
      ?auto_202741 - BLOCK
      ?auto_202742 - BLOCK
      ?auto_202743 - BLOCK
    )
    :vars
    (
      ?auto_202744 - BLOCK
      ?auto_202748 - BLOCK
      ?auto_202745 - BLOCK
      ?auto_202747 - BLOCK
      ?auto_202746 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_202740 ) ( not ( = ?auto_202740 ?auto_202741 ) ) ( not ( = ?auto_202740 ?auto_202742 ) ) ( not ( = ?auto_202740 ?auto_202743 ) ) ( not ( = ?auto_202740 ?auto_202744 ) ) ( not ( = ?auto_202741 ?auto_202742 ) ) ( not ( = ?auto_202741 ?auto_202743 ) ) ( not ( = ?auto_202741 ?auto_202744 ) ) ( not ( = ?auto_202742 ?auto_202743 ) ) ( not ( = ?auto_202742 ?auto_202744 ) ) ( not ( = ?auto_202743 ?auto_202744 ) ) ( not ( = ?auto_202740 ?auto_202748 ) ) ( not ( = ?auto_202740 ?auto_202745 ) ) ( not ( = ?auto_202741 ?auto_202748 ) ) ( not ( = ?auto_202741 ?auto_202745 ) ) ( not ( = ?auto_202742 ?auto_202748 ) ) ( not ( = ?auto_202742 ?auto_202745 ) ) ( not ( = ?auto_202743 ?auto_202748 ) ) ( not ( = ?auto_202743 ?auto_202745 ) ) ( not ( = ?auto_202744 ?auto_202748 ) ) ( not ( = ?auto_202744 ?auto_202745 ) ) ( not ( = ?auto_202748 ?auto_202745 ) ) ( not ( = ?auto_202747 ?auto_202745 ) ) ( not ( = ?auto_202740 ?auto_202747 ) ) ( not ( = ?auto_202741 ?auto_202747 ) ) ( not ( = ?auto_202742 ?auto_202747 ) ) ( not ( = ?auto_202743 ?auto_202747 ) ) ( not ( = ?auto_202744 ?auto_202747 ) ) ( not ( = ?auto_202748 ?auto_202747 ) ) ( ON ?auto_202747 ?auto_202746 ) ( not ( = ?auto_202740 ?auto_202746 ) ) ( not ( = ?auto_202741 ?auto_202746 ) ) ( not ( = ?auto_202742 ?auto_202746 ) ) ( not ( = ?auto_202743 ?auto_202746 ) ) ( not ( = ?auto_202744 ?auto_202746 ) ) ( not ( = ?auto_202748 ?auto_202746 ) ) ( not ( = ?auto_202745 ?auto_202746 ) ) ( not ( = ?auto_202747 ?auto_202746 ) ) ( ON ?auto_202745 ?auto_202747 ) ( ON-TABLE ?auto_202746 ) ( ON ?auto_202748 ?auto_202745 ) ( ON ?auto_202744 ?auto_202748 ) ( ON ?auto_202743 ?auto_202744 ) ( ON ?auto_202742 ?auto_202743 ) ( CLEAR ?auto_202742 ) ( HOLDING ?auto_202741 ) ( CLEAR ?auto_202740 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_202740 ?auto_202741 )
      ( MAKE-4PILE ?auto_202740 ?auto_202741 ?auto_202742 ?auto_202743 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_202749 - BLOCK
      ?auto_202750 - BLOCK
      ?auto_202751 - BLOCK
      ?auto_202752 - BLOCK
    )
    :vars
    (
      ?auto_202754 - BLOCK
      ?auto_202753 - BLOCK
      ?auto_202757 - BLOCK
      ?auto_202755 - BLOCK
      ?auto_202756 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_202749 ) ( not ( = ?auto_202749 ?auto_202750 ) ) ( not ( = ?auto_202749 ?auto_202751 ) ) ( not ( = ?auto_202749 ?auto_202752 ) ) ( not ( = ?auto_202749 ?auto_202754 ) ) ( not ( = ?auto_202750 ?auto_202751 ) ) ( not ( = ?auto_202750 ?auto_202752 ) ) ( not ( = ?auto_202750 ?auto_202754 ) ) ( not ( = ?auto_202751 ?auto_202752 ) ) ( not ( = ?auto_202751 ?auto_202754 ) ) ( not ( = ?auto_202752 ?auto_202754 ) ) ( not ( = ?auto_202749 ?auto_202753 ) ) ( not ( = ?auto_202749 ?auto_202757 ) ) ( not ( = ?auto_202750 ?auto_202753 ) ) ( not ( = ?auto_202750 ?auto_202757 ) ) ( not ( = ?auto_202751 ?auto_202753 ) ) ( not ( = ?auto_202751 ?auto_202757 ) ) ( not ( = ?auto_202752 ?auto_202753 ) ) ( not ( = ?auto_202752 ?auto_202757 ) ) ( not ( = ?auto_202754 ?auto_202753 ) ) ( not ( = ?auto_202754 ?auto_202757 ) ) ( not ( = ?auto_202753 ?auto_202757 ) ) ( not ( = ?auto_202755 ?auto_202757 ) ) ( not ( = ?auto_202749 ?auto_202755 ) ) ( not ( = ?auto_202750 ?auto_202755 ) ) ( not ( = ?auto_202751 ?auto_202755 ) ) ( not ( = ?auto_202752 ?auto_202755 ) ) ( not ( = ?auto_202754 ?auto_202755 ) ) ( not ( = ?auto_202753 ?auto_202755 ) ) ( ON ?auto_202755 ?auto_202756 ) ( not ( = ?auto_202749 ?auto_202756 ) ) ( not ( = ?auto_202750 ?auto_202756 ) ) ( not ( = ?auto_202751 ?auto_202756 ) ) ( not ( = ?auto_202752 ?auto_202756 ) ) ( not ( = ?auto_202754 ?auto_202756 ) ) ( not ( = ?auto_202753 ?auto_202756 ) ) ( not ( = ?auto_202757 ?auto_202756 ) ) ( not ( = ?auto_202755 ?auto_202756 ) ) ( ON ?auto_202757 ?auto_202755 ) ( ON-TABLE ?auto_202756 ) ( ON ?auto_202753 ?auto_202757 ) ( ON ?auto_202754 ?auto_202753 ) ( ON ?auto_202752 ?auto_202754 ) ( ON ?auto_202751 ?auto_202752 ) ( CLEAR ?auto_202749 ) ( ON ?auto_202750 ?auto_202751 ) ( CLEAR ?auto_202750 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_202756 ?auto_202755 ?auto_202757 ?auto_202753 ?auto_202754 ?auto_202752 ?auto_202751 )
      ( MAKE-4PILE ?auto_202749 ?auto_202750 ?auto_202751 ?auto_202752 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_202758 - BLOCK
      ?auto_202759 - BLOCK
      ?auto_202760 - BLOCK
      ?auto_202761 - BLOCK
    )
    :vars
    (
      ?auto_202762 - BLOCK
      ?auto_202764 - BLOCK
      ?auto_202765 - BLOCK
      ?auto_202766 - BLOCK
      ?auto_202763 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_202758 ?auto_202759 ) ) ( not ( = ?auto_202758 ?auto_202760 ) ) ( not ( = ?auto_202758 ?auto_202761 ) ) ( not ( = ?auto_202758 ?auto_202762 ) ) ( not ( = ?auto_202759 ?auto_202760 ) ) ( not ( = ?auto_202759 ?auto_202761 ) ) ( not ( = ?auto_202759 ?auto_202762 ) ) ( not ( = ?auto_202760 ?auto_202761 ) ) ( not ( = ?auto_202760 ?auto_202762 ) ) ( not ( = ?auto_202761 ?auto_202762 ) ) ( not ( = ?auto_202758 ?auto_202764 ) ) ( not ( = ?auto_202758 ?auto_202765 ) ) ( not ( = ?auto_202759 ?auto_202764 ) ) ( not ( = ?auto_202759 ?auto_202765 ) ) ( not ( = ?auto_202760 ?auto_202764 ) ) ( not ( = ?auto_202760 ?auto_202765 ) ) ( not ( = ?auto_202761 ?auto_202764 ) ) ( not ( = ?auto_202761 ?auto_202765 ) ) ( not ( = ?auto_202762 ?auto_202764 ) ) ( not ( = ?auto_202762 ?auto_202765 ) ) ( not ( = ?auto_202764 ?auto_202765 ) ) ( not ( = ?auto_202766 ?auto_202765 ) ) ( not ( = ?auto_202758 ?auto_202766 ) ) ( not ( = ?auto_202759 ?auto_202766 ) ) ( not ( = ?auto_202760 ?auto_202766 ) ) ( not ( = ?auto_202761 ?auto_202766 ) ) ( not ( = ?auto_202762 ?auto_202766 ) ) ( not ( = ?auto_202764 ?auto_202766 ) ) ( ON ?auto_202766 ?auto_202763 ) ( not ( = ?auto_202758 ?auto_202763 ) ) ( not ( = ?auto_202759 ?auto_202763 ) ) ( not ( = ?auto_202760 ?auto_202763 ) ) ( not ( = ?auto_202761 ?auto_202763 ) ) ( not ( = ?auto_202762 ?auto_202763 ) ) ( not ( = ?auto_202764 ?auto_202763 ) ) ( not ( = ?auto_202765 ?auto_202763 ) ) ( not ( = ?auto_202766 ?auto_202763 ) ) ( ON ?auto_202765 ?auto_202766 ) ( ON-TABLE ?auto_202763 ) ( ON ?auto_202764 ?auto_202765 ) ( ON ?auto_202762 ?auto_202764 ) ( ON ?auto_202761 ?auto_202762 ) ( ON ?auto_202760 ?auto_202761 ) ( ON ?auto_202759 ?auto_202760 ) ( CLEAR ?auto_202759 ) ( HOLDING ?auto_202758 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_202758 )
      ( MAKE-4PILE ?auto_202758 ?auto_202759 ?auto_202760 ?auto_202761 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_202767 - BLOCK
      ?auto_202768 - BLOCK
      ?auto_202769 - BLOCK
      ?auto_202770 - BLOCK
    )
    :vars
    (
      ?auto_202775 - BLOCK
      ?auto_202773 - BLOCK
      ?auto_202771 - BLOCK
      ?auto_202772 - BLOCK
      ?auto_202774 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_202767 ?auto_202768 ) ) ( not ( = ?auto_202767 ?auto_202769 ) ) ( not ( = ?auto_202767 ?auto_202770 ) ) ( not ( = ?auto_202767 ?auto_202775 ) ) ( not ( = ?auto_202768 ?auto_202769 ) ) ( not ( = ?auto_202768 ?auto_202770 ) ) ( not ( = ?auto_202768 ?auto_202775 ) ) ( not ( = ?auto_202769 ?auto_202770 ) ) ( not ( = ?auto_202769 ?auto_202775 ) ) ( not ( = ?auto_202770 ?auto_202775 ) ) ( not ( = ?auto_202767 ?auto_202773 ) ) ( not ( = ?auto_202767 ?auto_202771 ) ) ( not ( = ?auto_202768 ?auto_202773 ) ) ( not ( = ?auto_202768 ?auto_202771 ) ) ( not ( = ?auto_202769 ?auto_202773 ) ) ( not ( = ?auto_202769 ?auto_202771 ) ) ( not ( = ?auto_202770 ?auto_202773 ) ) ( not ( = ?auto_202770 ?auto_202771 ) ) ( not ( = ?auto_202775 ?auto_202773 ) ) ( not ( = ?auto_202775 ?auto_202771 ) ) ( not ( = ?auto_202773 ?auto_202771 ) ) ( not ( = ?auto_202772 ?auto_202771 ) ) ( not ( = ?auto_202767 ?auto_202772 ) ) ( not ( = ?auto_202768 ?auto_202772 ) ) ( not ( = ?auto_202769 ?auto_202772 ) ) ( not ( = ?auto_202770 ?auto_202772 ) ) ( not ( = ?auto_202775 ?auto_202772 ) ) ( not ( = ?auto_202773 ?auto_202772 ) ) ( ON ?auto_202772 ?auto_202774 ) ( not ( = ?auto_202767 ?auto_202774 ) ) ( not ( = ?auto_202768 ?auto_202774 ) ) ( not ( = ?auto_202769 ?auto_202774 ) ) ( not ( = ?auto_202770 ?auto_202774 ) ) ( not ( = ?auto_202775 ?auto_202774 ) ) ( not ( = ?auto_202773 ?auto_202774 ) ) ( not ( = ?auto_202771 ?auto_202774 ) ) ( not ( = ?auto_202772 ?auto_202774 ) ) ( ON ?auto_202771 ?auto_202772 ) ( ON-TABLE ?auto_202774 ) ( ON ?auto_202773 ?auto_202771 ) ( ON ?auto_202775 ?auto_202773 ) ( ON ?auto_202770 ?auto_202775 ) ( ON ?auto_202769 ?auto_202770 ) ( ON ?auto_202768 ?auto_202769 ) ( ON ?auto_202767 ?auto_202768 ) ( CLEAR ?auto_202767 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_202774 ?auto_202772 ?auto_202771 ?auto_202773 ?auto_202775 ?auto_202770 ?auto_202769 ?auto_202768 )
      ( MAKE-4PILE ?auto_202767 ?auto_202768 ?auto_202769 ?auto_202770 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_202780 - BLOCK
      ?auto_202781 - BLOCK
      ?auto_202782 - BLOCK
      ?auto_202783 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_202783 ) ( CLEAR ?auto_202782 ) ( ON-TABLE ?auto_202780 ) ( ON ?auto_202781 ?auto_202780 ) ( ON ?auto_202782 ?auto_202781 ) ( not ( = ?auto_202780 ?auto_202781 ) ) ( not ( = ?auto_202780 ?auto_202782 ) ) ( not ( = ?auto_202780 ?auto_202783 ) ) ( not ( = ?auto_202781 ?auto_202782 ) ) ( not ( = ?auto_202781 ?auto_202783 ) ) ( not ( = ?auto_202782 ?auto_202783 ) ) )
    :subtasks
    ( ( !STACK ?auto_202783 ?auto_202782 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_202784 - BLOCK
      ?auto_202785 - BLOCK
      ?auto_202786 - BLOCK
      ?auto_202787 - BLOCK
    )
    :vars
    (
      ?auto_202788 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_202786 ) ( ON-TABLE ?auto_202784 ) ( ON ?auto_202785 ?auto_202784 ) ( ON ?auto_202786 ?auto_202785 ) ( not ( = ?auto_202784 ?auto_202785 ) ) ( not ( = ?auto_202784 ?auto_202786 ) ) ( not ( = ?auto_202784 ?auto_202787 ) ) ( not ( = ?auto_202785 ?auto_202786 ) ) ( not ( = ?auto_202785 ?auto_202787 ) ) ( not ( = ?auto_202786 ?auto_202787 ) ) ( ON ?auto_202787 ?auto_202788 ) ( CLEAR ?auto_202787 ) ( HAND-EMPTY ) ( not ( = ?auto_202784 ?auto_202788 ) ) ( not ( = ?auto_202785 ?auto_202788 ) ) ( not ( = ?auto_202786 ?auto_202788 ) ) ( not ( = ?auto_202787 ?auto_202788 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_202787 ?auto_202788 )
      ( MAKE-4PILE ?auto_202784 ?auto_202785 ?auto_202786 ?auto_202787 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_202789 - BLOCK
      ?auto_202790 - BLOCK
      ?auto_202791 - BLOCK
      ?auto_202792 - BLOCK
    )
    :vars
    (
      ?auto_202793 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_202789 ) ( ON ?auto_202790 ?auto_202789 ) ( not ( = ?auto_202789 ?auto_202790 ) ) ( not ( = ?auto_202789 ?auto_202791 ) ) ( not ( = ?auto_202789 ?auto_202792 ) ) ( not ( = ?auto_202790 ?auto_202791 ) ) ( not ( = ?auto_202790 ?auto_202792 ) ) ( not ( = ?auto_202791 ?auto_202792 ) ) ( ON ?auto_202792 ?auto_202793 ) ( CLEAR ?auto_202792 ) ( not ( = ?auto_202789 ?auto_202793 ) ) ( not ( = ?auto_202790 ?auto_202793 ) ) ( not ( = ?auto_202791 ?auto_202793 ) ) ( not ( = ?auto_202792 ?auto_202793 ) ) ( HOLDING ?auto_202791 ) ( CLEAR ?auto_202790 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_202789 ?auto_202790 ?auto_202791 )
      ( MAKE-4PILE ?auto_202789 ?auto_202790 ?auto_202791 ?auto_202792 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_202794 - BLOCK
      ?auto_202795 - BLOCK
      ?auto_202796 - BLOCK
      ?auto_202797 - BLOCK
    )
    :vars
    (
      ?auto_202798 - BLOCK
      ?auto_202799 - BLOCK
      ?auto_202800 - BLOCK
      ?auto_202801 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_202794 ) ( ON ?auto_202795 ?auto_202794 ) ( not ( = ?auto_202794 ?auto_202795 ) ) ( not ( = ?auto_202794 ?auto_202796 ) ) ( not ( = ?auto_202794 ?auto_202797 ) ) ( not ( = ?auto_202795 ?auto_202796 ) ) ( not ( = ?auto_202795 ?auto_202797 ) ) ( not ( = ?auto_202796 ?auto_202797 ) ) ( ON ?auto_202797 ?auto_202798 ) ( not ( = ?auto_202794 ?auto_202798 ) ) ( not ( = ?auto_202795 ?auto_202798 ) ) ( not ( = ?auto_202796 ?auto_202798 ) ) ( not ( = ?auto_202797 ?auto_202798 ) ) ( CLEAR ?auto_202795 ) ( ON ?auto_202796 ?auto_202797 ) ( CLEAR ?auto_202796 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_202799 ) ( ON ?auto_202800 ?auto_202799 ) ( ON ?auto_202801 ?auto_202800 ) ( ON ?auto_202798 ?auto_202801 ) ( not ( = ?auto_202799 ?auto_202800 ) ) ( not ( = ?auto_202799 ?auto_202801 ) ) ( not ( = ?auto_202799 ?auto_202798 ) ) ( not ( = ?auto_202799 ?auto_202797 ) ) ( not ( = ?auto_202799 ?auto_202796 ) ) ( not ( = ?auto_202800 ?auto_202801 ) ) ( not ( = ?auto_202800 ?auto_202798 ) ) ( not ( = ?auto_202800 ?auto_202797 ) ) ( not ( = ?auto_202800 ?auto_202796 ) ) ( not ( = ?auto_202801 ?auto_202798 ) ) ( not ( = ?auto_202801 ?auto_202797 ) ) ( not ( = ?auto_202801 ?auto_202796 ) ) ( not ( = ?auto_202794 ?auto_202799 ) ) ( not ( = ?auto_202794 ?auto_202800 ) ) ( not ( = ?auto_202794 ?auto_202801 ) ) ( not ( = ?auto_202795 ?auto_202799 ) ) ( not ( = ?auto_202795 ?auto_202800 ) ) ( not ( = ?auto_202795 ?auto_202801 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_202799 ?auto_202800 ?auto_202801 ?auto_202798 ?auto_202797 )
      ( MAKE-4PILE ?auto_202794 ?auto_202795 ?auto_202796 ?auto_202797 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_202802 - BLOCK
      ?auto_202803 - BLOCK
      ?auto_202804 - BLOCK
      ?auto_202805 - BLOCK
    )
    :vars
    (
      ?auto_202808 - BLOCK
      ?auto_202806 - BLOCK
      ?auto_202807 - BLOCK
      ?auto_202809 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_202802 ) ( not ( = ?auto_202802 ?auto_202803 ) ) ( not ( = ?auto_202802 ?auto_202804 ) ) ( not ( = ?auto_202802 ?auto_202805 ) ) ( not ( = ?auto_202803 ?auto_202804 ) ) ( not ( = ?auto_202803 ?auto_202805 ) ) ( not ( = ?auto_202804 ?auto_202805 ) ) ( ON ?auto_202805 ?auto_202808 ) ( not ( = ?auto_202802 ?auto_202808 ) ) ( not ( = ?auto_202803 ?auto_202808 ) ) ( not ( = ?auto_202804 ?auto_202808 ) ) ( not ( = ?auto_202805 ?auto_202808 ) ) ( ON ?auto_202804 ?auto_202805 ) ( CLEAR ?auto_202804 ) ( ON-TABLE ?auto_202806 ) ( ON ?auto_202807 ?auto_202806 ) ( ON ?auto_202809 ?auto_202807 ) ( ON ?auto_202808 ?auto_202809 ) ( not ( = ?auto_202806 ?auto_202807 ) ) ( not ( = ?auto_202806 ?auto_202809 ) ) ( not ( = ?auto_202806 ?auto_202808 ) ) ( not ( = ?auto_202806 ?auto_202805 ) ) ( not ( = ?auto_202806 ?auto_202804 ) ) ( not ( = ?auto_202807 ?auto_202809 ) ) ( not ( = ?auto_202807 ?auto_202808 ) ) ( not ( = ?auto_202807 ?auto_202805 ) ) ( not ( = ?auto_202807 ?auto_202804 ) ) ( not ( = ?auto_202809 ?auto_202808 ) ) ( not ( = ?auto_202809 ?auto_202805 ) ) ( not ( = ?auto_202809 ?auto_202804 ) ) ( not ( = ?auto_202802 ?auto_202806 ) ) ( not ( = ?auto_202802 ?auto_202807 ) ) ( not ( = ?auto_202802 ?auto_202809 ) ) ( not ( = ?auto_202803 ?auto_202806 ) ) ( not ( = ?auto_202803 ?auto_202807 ) ) ( not ( = ?auto_202803 ?auto_202809 ) ) ( HOLDING ?auto_202803 ) ( CLEAR ?auto_202802 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_202802 ?auto_202803 )
      ( MAKE-4PILE ?auto_202802 ?auto_202803 ?auto_202804 ?auto_202805 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_202810 - BLOCK
      ?auto_202811 - BLOCK
      ?auto_202812 - BLOCK
      ?auto_202813 - BLOCK
    )
    :vars
    (
      ?auto_202817 - BLOCK
      ?auto_202815 - BLOCK
      ?auto_202816 - BLOCK
      ?auto_202814 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_202810 ) ( not ( = ?auto_202810 ?auto_202811 ) ) ( not ( = ?auto_202810 ?auto_202812 ) ) ( not ( = ?auto_202810 ?auto_202813 ) ) ( not ( = ?auto_202811 ?auto_202812 ) ) ( not ( = ?auto_202811 ?auto_202813 ) ) ( not ( = ?auto_202812 ?auto_202813 ) ) ( ON ?auto_202813 ?auto_202817 ) ( not ( = ?auto_202810 ?auto_202817 ) ) ( not ( = ?auto_202811 ?auto_202817 ) ) ( not ( = ?auto_202812 ?auto_202817 ) ) ( not ( = ?auto_202813 ?auto_202817 ) ) ( ON ?auto_202812 ?auto_202813 ) ( ON-TABLE ?auto_202815 ) ( ON ?auto_202816 ?auto_202815 ) ( ON ?auto_202814 ?auto_202816 ) ( ON ?auto_202817 ?auto_202814 ) ( not ( = ?auto_202815 ?auto_202816 ) ) ( not ( = ?auto_202815 ?auto_202814 ) ) ( not ( = ?auto_202815 ?auto_202817 ) ) ( not ( = ?auto_202815 ?auto_202813 ) ) ( not ( = ?auto_202815 ?auto_202812 ) ) ( not ( = ?auto_202816 ?auto_202814 ) ) ( not ( = ?auto_202816 ?auto_202817 ) ) ( not ( = ?auto_202816 ?auto_202813 ) ) ( not ( = ?auto_202816 ?auto_202812 ) ) ( not ( = ?auto_202814 ?auto_202817 ) ) ( not ( = ?auto_202814 ?auto_202813 ) ) ( not ( = ?auto_202814 ?auto_202812 ) ) ( not ( = ?auto_202810 ?auto_202815 ) ) ( not ( = ?auto_202810 ?auto_202816 ) ) ( not ( = ?auto_202810 ?auto_202814 ) ) ( not ( = ?auto_202811 ?auto_202815 ) ) ( not ( = ?auto_202811 ?auto_202816 ) ) ( not ( = ?auto_202811 ?auto_202814 ) ) ( CLEAR ?auto_202810 ) ( ON ?auto_202811 ?auto_202812 ) ( CLEAR ?auto_202811 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_202815 ?auto_202816 ?auto_202814 ?auto_202817 ?auto_202813 ?auto_202812 )
      ( MAKE-4PILE ?auto_202810 ?auto_202811 ?auto_202812 ?auto_202813 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_202818 - BLOCK
      ?auto_202819 - BLOCK
      ?auto_202820 - BLOCK
      ?auto_202821 - BLOCK
    )
    :vars
    (
      ?auto_202825 - BLOCK
      ?auto_202823 - BLOCK
      ?auto_202822 - BLOCK
      ?auto_202824 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_202818 ?auto_202819 ) ) ( not ( = ?auto_202818 ?auto_202820 ) ) ( not ( = ?auto_202818 ?auto_202821 ) ) ( not ( = ?auto_202819 ?auto_202820 ) ) ( not ( = ?auto_202819 ?auto_202821 ) ) ( not ( = ?auto_202820 ?auto_202821 ) ) ( ON ?auto_202821 ?auto_202825 ) ( not ( = ?auto_202818 ?auto_202825 ) ) ( not ( = ?auto_202819 ?auto_202825 ) ) ( not ( = ?auto_202820 ?auto_202825 ) ) ( not ( = ?auto_202821 ?auto_202825 ) ) ( ON ?auto_202820 ?auto_202821 ) ( ON-TABLE ?auto_202823 ) ( ON ?auto_202822 ?auto_202823 ) ( ON ?auto_202824 ?auto_202822 ) ( ON ?auto_202825 ?auto_202824 ) ( not ( = ?auto_202823 ?auto_202822 ) ) ( not ( = ?auto_202823 ?auto_202824 ) ) ( not ( = ?auto_202823 ?auto_202825 ) ) ( not ( = ?auto_202823 ?auto_202821 ) ) ( not ( = ?auto_202823 ?auto_202820 ) ) ( not ( = ?auto_202822 ?auto_202824 ) ) ( not ( = ?auto_202822 ?auto_202825 ) ) ( not ( = ?auto_202822 ?auto_202821 ) ) ( not ( = ?auto_202822 ?auto_202820 ) ) ( not ( = ?auto_202824 ?auto_202825 ) ) ( not ( = ?auto_202824 ?auto_202821 ) ) ( not ( = ?auto_202824 ?auto_202820 ) ) ( not ( = ?auto_202818 ?auto_202823 ) ) ( not ( = ?auto_202818 ?auto_202822 ) ) ( not ( = ?auto_202818 ?auto_202824 ) ) ( not ( = ?auto_202819 ?auto_202823 ) ) ( not ( = ?auto_202819 ?auto_202822 ) ) ( not ( = ?auto_202819 ?auto_202824 ) ) ( ON ?auto_202819 ?auto_202820 ) ( CLEAR ?auto_202819 ) ( HOLDING ?auto_202818 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_202818 )
      ( MAKE-4PILE ?auto_202818 ?auto_202819 ?auto_202820 ?auto_202821 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_202826 - BLOCK
      ?auto_202827 - BLOCK
      ?auto_202828 - BLOCK
      ?auto_202829 - BLOCK
    )
    :vars
    (
      ?auto_202830 - BLOCK
      ?auto_202833 - BLOCK
      ?auto_202831 - BLOCK
      ?auto_202832 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_202826 ?auto_202827 ) ) ( not ( = ?auto_202826 ?auto_202828 ) ) ( not ( = ?auto_202826 ?auto_202829 ) ) ( not ( = ?auto_202827 ?auto_202828 ) ) ( not ( = ?auto_202827 ?auto_202829 ) ) ( not ( = ?auto_202828 ?auto_202829 ) ) ( ON ?auto_202829 ?auto_202830 ) ( not ( = ?auto_202826 ?auto_202830 ) ) ( not ( = ?auto_202827 ?auto_202830 ) ) ( not ( = ?auto_202828 ?auto_202830 ) ) ( not ( = ?auto_202829 ?auto_202830 ) ) ( ON ?auto_202828 ?auto_202829 ) ( ON-TABLE ?auto_202833 ) ( ON ?auto_202831 ?auto_202833 ) ( ON ?auto_202832 ?auto_202831 ) ( ON ?auto_202830 ?auto_202832 ) ( not ( = ?auto_202833 ?auto_202831 ) ) ( not ( = ?auto_202833 ?auto_202832 ) ) ( not ( = ?auto_202833 ?auto_202830 ) ) ( not ( = ?auto_202833 ?auto_202829 ) ) ( not ( = ?auto_202833 ?auto_202828 ) ) ( not ( = ?auto_202831 ?auto_202832 ) ) ( not ( = ?auto_202831 ?auto_202830 ) ) ( not ( = ?auto_202831 ?auto_202829 ) ) ( not ( = ?auto_202831 ?auto_202828 ) ) ( not ( = ?auto_202832 ?auto_202830 ) ) ( not ( = ?auto_202832 ?auto_202829 ) ) ( not ( = ?auto_202832 ?auto_202828 ) ) ( not ( = ?auto_202826 ?auto_202833 ) ) ( not ( = ?auto_202826 ?auto_202831 ) ) ( not ( = ?auto_202826 ?auto_202832 ) ) ( not ( = ?auto_202827 ?auto_202833 ) ) ( not ( = ?auto_202827 ?auto_202831 ) ) ( not ( = ?auto_202827 ?auto_202832 ) ) ( ON ?auto_202827 ?auto_202828 ) ( ON ?auto_202826 ?auto_202827 ) ( CLEAR ?auto_202826 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_202833 ?auto_202831 ?auto_202832 ?auto_202830 ?auto_202829 ?auto_202828 ?auto_202827 )
      ( MAKE-4PILE ?auto_202826 ?auto_202827 ?auto_202828 ?auto_202829 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_202834 - BLOCK
      ?auto_202835 - BLOCK
      ?auto_202836 - BLOCK
      ?auto_202837 - BLOCK
    )
    :vars
    (
      ?auto_202841 - BLOCK
      ?auto_202840 - BLOCK
      ?auto_202839 - BLOCK
      ?auto_202838 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_202834 ?auto_202835 ) ) ( not ( = ?auto_202834 ?auto_202836 ) ) ( not ( = ?auto_202834 ?auto_202837 ) ) ( not ( = ?auto_202835 ?auto_202836 ) ) ( not ( = ?auto_202835 ?auto_202837 ) ) ( not ( = ?auto_202836 ?auto_202837 ) ) ( ON ?auto_202837 ?auto_202841 ) ( not ( = ?auto_202834 ?auto_202841 ) ) ( not ( = ?auto_202835 ?auto_202841 ) ) ( not ( = ?auto_202836 ?auto_202841 ) ) ( not ( = ?auto_202837 ?auto_202841 ) ) ( ON ?auto_202836 ?auto_202837 ) ( ON-TABLE ?auto_202840 ) ( ON ?auto_202839 ?auto_202840 ) ( ON ?auto_202838 ?auto_202839 ) ( ON ?auto_202841 ?auto_202838 ) ( not ( = ?auto_202840 ?auto_202839 ) ) ( not ( = ?auto_202840 ?auto_202838 ) ) ( not ( = ?auto_202840 ?auto_202841 ) ) ( not ( = ?auto_202840 ?auto_202837 ) ) ( not ( = ?auto_202840 ?auto_202836 ) ) ( not ( = ?auto_202839 ?auto_202838 ) ) ( not ( = ?auto_202839 ?auto_202841 ) ) ( not ( = ?auto_202839 ?auto_202837 ) ) ( not ( = ?auto_202839 ?auto_202836 ) ) ( not ( = ?auto_202838 ?auto_202841 ) ) ( not ( = ?auto_202838 ?auto_202837 ) ) ( not ( = ?auto_202838 ?auto_202836 ) ) ( not ( = ?auto_202834 ?auto_202840 ) ) ( not ( = ?auto_202834 ?auto_202839 ) ) ( not ( = ?auto_202834 ?auto_202838 ) ) ( not ( = ?auto_202835 ?auto_202840 ) ) ( not ( = ?auto_202835 ?auto_202839 ) ) ( not ( = ?auto_202835 ?auto_202838 ) ) ( ON ?auto_202835 ?auto_202836 ) ( HOLDING ?auto_202834 ) ( CLEAR ?auto_202835 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_202840 ?auto_202839 ?auto_202838 ?auto_202841 ?auto_202837 ?auto_202836 ?auto_202835 ?auto_202834 )
      ( MAKE-4PILE ?auto_202834 ?auto_202835 ?auto_202836 ?auto_202837 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_202842 - BLOCK
      ?auto_202843 - BLOCK
      ?auto_202844 - BLOCK
      ?auto_202845 - BLOCK
    )
    :vars
    (
      ?auto_202847 - BLOCK
      ?auto_202849 - BLOCK
      ?auto_202846 - BLOCK
      ?auto_202848 - BLOCK
      ?auto_202850 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_202842 ?auto_202843 ) ) ( not ( = ?auto_202842 ?auto_202844 ) ) ( not ( = ?auto_202842 ?auto_202845 ) ) ( not ( = ?auto_202843 ?auto_202844 ) ) ( not ( = ?auto_202843 ?auto_202845 ) ) ( not ( = ?auto_202844 ?auto_202845 ) ) ( ON ?auto_202845 ?auto_202847 ) ( not ( = ?auto_202842 ?auto_202847 ) ) ( not ( = ?auto_202843 ?auto_202847 ) ) ( not ( = ?auto_202844 ?auto_202847 ) ) ( not ( = ?auto_202845 ?auto_202847 ) ) ( ON ?auto_202844 ?auto_202845 ) ( ON-TABLE ?auto_202849 ) ( ON ?auto_202846 ?auto_202849 ) ( ON ?auto_202848 ?auto_202846 ) ( ON ?auto_202847 ?auto_202848 ) ( not ( = ?auto_202849 ?auto_202846 ) ) ( not ( = ?auto_202849 ?auto_202848 ) ) ( not ( = ?auto_202849 ?auto_202847 ) ) ( not ( = ?auto_202849 ?auto_202845 ) ) ( not ( = ?auto_202849 ?auto_202844 ) ) ( not ( = ?auto_202846 ?auto_202848 ) ) ( not ( = ?auto_202846 ?auto_202847 ) ) ( not ( = ?auto_202846 ?auto_202845 ) ) ( not ( = ?auto_202846 ?auto_202844 ) ) ( not ( = ?auto_202848 ?auto_202847 ) ) ( not ( = ?auto_202848 ?auto_202845 ) ) ( not ( = ?auto_202848 ?auto_202844 ) ) ( not ( = ?auto_202842 ?auto_202849 ) ) ( not ( = ?auto_202842 ?auto_202846 ) ) ( not ( = ?auto_202842 ?auto_202848 ) ) ( not ( = ?auto_202843 ?auto_202849 ) ) ( not ( = ?auto_202843 ?auto_202846 ) ) ( not ( = ?auto_202843 ?auto_202848 ) ) ( ON ?auto_202843 ?auto_202844 ) ( CLEAR ?auto_202843 ) ( ON ?auto_202842 ?auto_202850 ) ( CLEAR ?auto_202842 ) ( HAND-EMPTY ) ( not ( = ?auto_202842 ?auto_202850 ) ) ( not ( = ?auto_202843 ?auto_202850 ) ) ( not ( = ?auto_202844 ?auto_202850 ) ) ( not ( = ?auto_202845 ?auto_202850 ) ) ( not ( = ?auto_202847 ?auto_202850 ) ) ( not ( = ?auto_202849 ?auto_202850 ) ) ( not ( = ?auto_202846 ?auto_202850 ) ) ( not ( = ?auto_202848 ?auto_202850 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_202842 ?auto_202850 )
      ( MAKE-4PILE ?auto_202842 ?auto_202843 ?auto_202844 ?auto_202845 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_202851 - BLOCK
      ?auto_202852 - BLOCK
      ?auto_202853 - BLOCK
      ?auto_202854 - BLOCK
    )
    :vars
    (
      ?auto_202859 - BLOCK
      ?auto_202855 - BLOCK
      ?auto_202857 - BLOCK
      ?auto_202858 - BLOCK
      ?auto_202856 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_202851 ?auto_202852 ) ) ( not ( = ?auto_202851 ?auto_202853 ) ) ( not ( = ?auto_202851 ?auto_202854 ) ) ( not ( = ?auto_202852 ?auto_202853 ) ) ( not ( = ?auto_202852 ?auto_202854 ) ) ( not ( = ?auto_202853 ?auto_202854 ) ) ( ON ?auto_202854 ?auto_202859 ) ( not ( = ?auto_202851 ?auto_202859 ) ) ( not ( = ?auto_202852 ?auto_202859 ) ) ( not ( = ?auto_202853 ?auto_202859 ) ) ( not ( = ?auto_202854 ?auto_202859 ) ) ( ON ?auto_202853 ?auto_202854 ) ( ON-TABLE ?auto_202855 ) ( ON ?auto_202857 ?auto_202855 ) ( ON ?auto_202858 ?auto_202857 ) ( ON ?auto_202859 ?auto_202858 ) ( not ( = ?auto_202855 ?auto_202857 ) ) ( not ( = ?auto_202855 ?auto_202858 ) ) ( not ( = ?auto_202855 ?auto_202859 ) ) ( not ( = ?auto_202855 ?auto_202854 ) ) ( not ( = ?auto_202855 ?auto_202853 ) ) ( not ( = ?auto_202857 ?auto_202858 ) ) ( not ( = ?auto_202857 ?auto_202859 ) ) ( not ( = ?auto_202857 ?auto_202854 ) ) ( not ( = ?auto_202857 ?auto_202853 ) ) ( not ( = ?auto_202858 ?auto_202859 ) ) ( not ( = ?auto_202858 ?auto_202854 ) ) ( not ( = ?auto_202858 ?auto_202853 ) ) ( not ( = ?auto_202851 ?auto_202855 ) ) ( not ( = ?auto_202851 ?auto_202857 ) ) ( not ( = ?auto_202851 ?auto_202858 ) ) ( not ( = ?auto_202852 ?auto_202855 ) ) ( not ( = ?auto_202852 ?auto_202857 ) ) ( not ( = ?auto_202852 ?auto_202858 ) ) ( ON ?auto_202851 ?auto_202856 ) ( CLEAR ?auto_202851 ) ( not ( = ?auto_202851 ?auto_202856 ) ) ( not ( = ?auto_202852 ?auto_202856 ) ) ( not ( = ?auto_202853 ?auto_202856 ) ) ( not ( = ?auto_202854 ?auto_202856 ) ) ( not ( = ?auto_202859 ?auto_202856 ) ) ( not ( = ?auto_202855 ?auto_202856 ) ) ( not ( = ?auto_202857 ?auto_202856 ) ) ( not ( = ?auto_202858 ?auto_202856 ) ) ( HOLDING ?auto_202852 ) ( CLEAR ?auto_202853 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_202855 ?auto_202857 ?auto_202858 ?auto_202859 ?auto_202854 ?auto_202853 ?auto_202852 )
      ( MAKE-4PILE ?auto_202851 ?auto_202852 ?auto_202853 ?auto_202854 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_202860 - BLOCK
      ?auto_202861 - BLOCK
      ?auto_202862 - BLOCK
      ?auto_202863 - BLOCK
    )
    :vars
    (
      ?auto_202868 - BLOCK
      ?auto_202867 - BLOCK
      ?auto_202866 - BLOCK
      ?auto_202865 - BLOCK
      ?auto_202864 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_202860 ?auto_202861 ) ) ( not ( = ?auto_202860 ?auto_202862 ) ) ( not ( = ?auto_202860 ?auto_202863 ) ) ( not ( = ?auto_202861 ?auto_202862 ) ) ( not ( = ?auto_202861 ?auto_202863 ) ) ( not ( = ?auto_202862 ?auto_202863 ) ) ( ON ?auto_202863 ?auto_202868 ) ( not ( = ?auto_202860 ?auto_202868 ) ) ( not ( = ?auto_202861 ?auto_202868 ) ) ( not ( = ?auto_202862 ?auto_202868 ) ) ( not ( = ?auto_202863 ?auto_202868 ) ) ( ON ?auto_202862 ?auto_202863 ) ( ON-TABLE ?auto_202867 ) ( ON ?auto_202866 ?auto_202867 ) ( ON ?auto_202865 ?auto_202866 ) ( ON ?auto_202868 ?auto_202865 ) ( not ( = ?auto_202867 ?auto_202866 ) ) ( not ( = ?auto_202867 ?auto_202865 ) ) ( not ( = ?auto_202867 ?auto_202868 ) ) ( not ( = ?auto_202867 ?auto_202863 ) ) ( not ( = ?auto_202867 ?auto_202862 ) ) ( not ( = ?auto_202866 ?auto_202865 ) ) ( not ( = ?auto_202866 ?auto_202868 ) ) ( not ( = ?auto_202866 ?auto_202863 ) ) ( not ( = ?auto_202866 ?auto_202862 ) ) ( not ( = ?auto_202865 ?auto_202868 ) ) ( not ( = ?auto_202865 ?auto_202863 ) ) ( not ( = ?auto_202865 ?auto_202862 ) ) ( not ( = ?auto_202860 ?auto_202867 ) ) ( not ( = ?auto_202860 ?auto_202866 ) ) ( not ( = ?auto_202860 ?auto_202865 ) ) ( not ( = ?auto_202861 ?auto_202867 ) ) ( not ( = ?auto_202861 ?auto_202866 ) ) ( not ( = ?auto_202861 ?auto_202865 ) ) ( ON ?auto_202860 ?auto_202864 ) ( not ( = ?auto_202860 ?auto_202864 ) ) ( not ( = ?auto_202861 ?auto_202864 ) ) ( not ( = ?auto_202862 ?auto_202864 ) ) ( not ( = ?auto_202863 ?auto_202864 ) ) ( not ( = ?auto_202868 ?auto_202864 ) ) ( not ( = ?auto_202867 ?auto_202864 ) ) ( not ( = ?auto_202866 ?auto_202864 ) ) ( not ( = ?auto_202865 ?auto_202864 ) ) ( CLEAR ?auto_202862 ) ( ON ?auto_202861 ?auto_202860 ) ( CLEAR ?auto_202861 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_202864 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_202864 ?auto_202860 )
      ( MAKE-4PILE ?auto_202860 ?auto_202861 ?auto_202862 ?auto_202863 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_202869 - BLOCK
      ?auto_202870 - BLOCK
      ?auto_202871 - BLOCK
      ?auto_202872 - BLOCK
    )
    :vars
    (
      ?auto_202875 - BLOCK
      ?auto_202874 - BLOCK
      ?auto_202877 - BLOCK
      ?auto_202873 - BLOCK
      ?auto_202876 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_202869 ?auto_202870 ) ) ( not ( = ?auto_202869 ?auto_202871 ) ) ( not ( = ?auto_202869 ?auto_202872 ) ) ( not ( = ?auto_202870 ?auto_202871 ) ) ( not ( = ?auto_202870 ?auto_202872 ) ) ( not ( = ?auto_202871 ?auto_202872 ) ) ( ON ?auto_202872 ?auto_202875 ) ( not ( = ?auto_202869 ?auto_202875 ) ) ( not ( = ?auto_202870 ?auto_202875 ) ) ( not ( = ?auto_202871 ?auto_202875 ) ) ( not ( = ?auto_202872 ?auto_202875 ) ) ( ON-TABLE ?auto_202874 ) ( ON ?auto_202877 ?auto_202874 ) ( ON ?auto_202873 ?auto_202877 ) ( ON ?auto_202875 ?auto_202873 ) ( not ( = ?auto_202874 ?auto_202877 ) ) ( not ( = ?auto_202874 ?auto_202873 ) ) ( not ( = ?auto_202874 ?auto_202875 ) ) ( not ( = ?auto_202874 ?auto_202872 ) ) ( not ( = ?auto_202874 ?auto_202871 ) ) ( not ( = ?auto_202877 ?auto_202873 ) ) ( not ( = ?auto_202877 ?auto_202875 ) ) ( not ( = ?auto_202877 ?auto_202872 ) ) ( not ( = ?auto_202877 ?auto_202871 ) ) ( not ( = ?auto_202873 ?auto_202875 ) ) ( not ( = ?auto_202873 ?auto_202872 ) ) ( not ( = ?auto_202873 ?auto_202871 ) ) ( not ( = ?auto_202869 ?auto_202874 ) ) ( not ( = ?auto_202869 ?auto_202877 ) ) ( not ( = ?auto_202869 ?auto_202873 ) ) ( not ( = ?auto_202870 ?auto_202874 ) ) ( not ( = ?auto_202870 ?auto_202877 ) ) ( not ( = ?auto_202870 ?auto_202873 ) ) ( ON ?auto_202869 ?auto_202876 ) ( not ( = ?auto_202869 ?auto_202876 ) ) ( not ( = ?auto_202870 ?auto_202876 ) ) ( not ( = ?auto_202871 ?auto_202876 ) ) ( not ( = ?auto_202872 ?auto_202876 ) ) ( not ( = ?auto_202875 ?auto_202876 ) ) ( not ( = ?auto_202874 ?auto_202876 ) ) ( not ( = ?auto_202877 ?auto_202876 ) ) ( not ( = ?auto_202873 ?auto_202876 ) ) ( ON ?auto_202870 ?auto_202869 ) ( CLEAR ?auto_202870 ) ( ON-TABLE ?auto_202876 ) ( HOLDING ?auto_202871 ) ( CLEAR ?auto_202872 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_202874 ?auto_202877 ?auto_202873 ?auto_202875 ?auto_202872 ?auto_202871 )
      ( MAKE-4PILE ?auto_202869 ?auto_202870 ?auto_202871 ?auto_202872 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_202878 - BLOCK
      ?auto_202879 - BLOCK
      ?auto_202880 - BLOCK
      ?auto_202881 - BLOCK
    )
    :vars
    (
      ?auto_202885 - BLOCK
      ?auto_202882 - BLOCK
      ?auto_202884 - BLOCK
      ?auto_202886 - BLOCK
      ?auto_202883 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_202878 ?auto_202879 ) ) ( not ( = ?auto_202878 ?auto_202880 ) ) ( not ( = ?auto_202878 ?auto_202881 ) ) ( not ( = ?auto_202879 ?auto_202880 ) ) ( not ( = ?auto_202879 ?auto_202881 ) ) ( not ( = ?auto_202880 ?auto_202881 ) ) ( ON ?auto_202881 ?auto_202885 ) ( not ( = ?auto_202878 ?auto_202885 ) ) ( not ( = ?auto_202879 ?auto_202885 ) ) ( not ( = ?auto_202880 ?auto_202885 ) ) ( not ( = ?auto_202881 ?auto_202885 ) ) ( ON-TABLE ?auto_202882 ) ( ON ?auto_202884 ?auto_202882 ) ( ON ?auto_202886 ?auto_202884 ) ( ON ?auto_202885 ?auto_202886 ) ( not ( = ?auto_202882 ?auto_202884 ) ) ( not ( = ?auto_202882 ?auto_202886 ) ) ( not ( = ?auto_202882 ?auto_202885 ) ) ( not ( = ?auto_202882 ?auto_202881 ) ) ( not ( = ?auto_202882 ?auto_202880 ) ) ( not ( = ?auto_202884 ?auto_202886 ) ) ( not ( = ?auto_202884 ?auto_202885 ) ) ( not ( = ?auto_202884 ?auto_202881 ) ) ( not ( = ?auto_202884 ?auto_202880 ) ) ( not ( = ?auto_202886 ?auto_202885 ) ) ( not ( = ?auto_202886 ?auto_202881 ) ) ( not ( = ?auto_202886 ?auto_202880 ) ) ( not ( = ?auto_202878 ?auto_202882 ) ) ( not ( = ?auto_202878 ?auto_202884 ) ) ( not ( = ?auto_202878 ?auto_202886 ) ) ( not ( = ?auto_202879 ?auto_202882 ) ) ( not ( = ?auto_202879 ?auto_202884 ) ) ( not ( = ?auto_202879 ?auto_202886 ) ) ( ON ?auto_202878 ?auto_202883 ) ( not ( = ?auto_202878 ?auto_202883 ) ) ( not ( = ?auto_202879 ?auto_202883 ) ) ( not ( = ?auto_202880 ?auto_202883 ) ) ( not ( = ?auto_202881 ?auto_202883 ) ) ( not ( = ?auto_202885 ?auto_202883 ) ) ( not ( = ?auto_202882 ?auto_202883 ) ) ( not ( = ?auto_202884 ?auto_202883 ) ) ( not ( = ?auto_202886 ?auto_202883 ) ) ( ON ?auto_202879 ?auto_202878 ) ( ON-TABLE ?auto_202883 ) ( CLEAR ?auto_202881 ) ( ON ?auto_202880 ?auto_202879 ) ( CLEAR ?auto_202880 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_202883 ?auto_202878 ?auto_202879 )
      ( MAKE-4PILE ?auto_202878 ?auto_202879 ?auto_202880 ?auto_202881 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_202887 - BLOCK
      ?auto_202888 - BLOCK
      ?auto_202889 - BLOCK
      ?auto_202890 - BLOCK
    )
    :vars
    (
      ?auto_202893 - BLOCK
      ?auto_202891 - BLOCK
      ?auto_202892 - BLOCK
      ?auto_202895 - BLOCK
      ?auto_202894 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_202887 ?auto_202888 ) ) ( not ( = ?auto_202887 ?auto_202889 ) ) ( not ( = ?auto_202887 ?auto_202890 ) ) ( not ( = ?auto_202888 ?auto_202889 ) ) ( not ( = ?auto_202888 ?auto_202890 ) ) ( not ( = ?auto_202889 ?auto_202890 ) ) ( not ( = ?auto_202887 ?auto_202893 ) ) ( not ( = ?auto_202888 ?auto_202893 ) ) ( not ( = ?auto_202889 ?auto_202893 ) ) ( not ( = ?auto_202890 ?auto_202893 ) ) ( ON-TABLE ?auto_202891 ) ( ON ?auto_202892 ?auto_202891 ) ( ON ?auto_202895 ?auto_202892 ) ( ON ?auto_202893 ?auto_202895 ) ( not ( = ?auto_202891 ?auto_202892 ) ) ( not ( = ?auto_202891 ?auto_202895 ) ) ( not ( = ?auto_202891 ?auto_202893 ) ) ( not ( = ?auto_202891 ?auto_202890 ) ) ( not ( = ?auto_202891 ?auto_202889 ) ) ( not ( = ?auto_202892 ?auto_202895 ) ) ( not ( = ?auto_202892 ?auto_202893 ) ) ( not ( = ?auto_202892 ?auto_202890 ) ) ( not ( = ?auto_202892 ?auto_202889 ) ) ( not ( = ?auto_202895 ?auto_202893 ) ) ( not ( = ?auto_202895 ?auto_202890 ) ) ( not ( = ?auto_202895 ?auto_202889 ) ) ( not ( = ?auto_202887 ?auto_202891 ) ) ( not ( = ?auto_202887 ?auto_202892 ) ) ( not ( = ?auto_202887 ?auto_202895 ) ) ( not ( = ?auto_202888 ?auto_202891 ) ) ( not ( = ?auto_202888 ?auto_202892 ) ) ( not ( = ?auto_202888 ?auto_202895 ) ) ( ON ?auto_202887 ?auto_202894 ) ( not ( = ?auto_202887 ?auto_202894 ) ) ( not ( = ?auto_202888 ?auto_202894 ) ) ( not ( = ?auto_202889 ?auto_202894 ) ) ( not ( = ?auto_202890 ?auto_202894 ) ) ( not ( = ?auto_202893 ?auto_202894 ) ) ( not ( = ?auto_202891 ?auto_202894 ) ) ( not ( = ?auto_202892 ?auto_202894 ) ) ( not ( = ?auto_202895 ?auto_202894 ) ) ( ON ?auto_202888 ?auto_202887 ) ( ON-TABLE ?auto_202894 ) ( ON ?auto_202889 ?auto_202888 ) ( CLEAR ?auto_202889 ) ( HOLDING ?auto_202890 ) ( CLEAR ?auto_202893 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_202891 ?auto_202892 ?auto_202895 ?auto_202893 ?auto_202890 )
      ( MAKE-4PILE ?auto_202887 ?auto_202888 ?auto_202889 ?auto_202890 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_202896 - BLOCK
      ?auto_202897 - BLOCK
      ?auto_202898 - BLOCK
      ?auto_202899 - BLOCK
    )
    :vars
    (
      ?auto_202904 - BLOCK
      ?auto_202901 - BLOCK
      ?auto_202903 - BLOCK
      ?auto_202902 - BLOCK
      ?auto_202900 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_202896 ?auto_202897 ) ) ( not ( = ?auto_202896 ?auto_202898 ) ) ( not ( = ?auto_202896 ?auto_202899 ) ) ( not ( = ?auto_202897 ?auto_202898 ) ) ( not ( = ?auto_202897 ?auto_202899 ) ) ( not ( = ?auto_202898 ?auto_202899 ) ) ( not ( = ?auto_202896 ?auto_202904 ) ) ( not ( = ?auto_202897 ?auto_202904 ) ) ( not ( = ?auto_202898 ?auto_202904 ) ) ( not ( = ?auto_202899 ?auto_202904 ) ) ( ON-TABLE ?auto_202901 ) ( ON ?auto_202903 ?auto_202901 ) ( ON ?auto_202902 ?auto_202903 ) ( ON ?auto_202904 ?auto_202902 ) ( not ( = ?auto_202901 ?auto_202903 ) ) ( not ( = ?auto_202901 ?auto_202902 ) ) ( not ( = ?auto_202901 ?auto_202904 ) ) ( not ( = ?auto_202901 ?auto_202899 ) ) ( not ( = ?auto_202901 ?auto_202898 ) ) ( not ( = ?auto_202903 ?auto_202902 ) ) ( not ( = ?auto_202903 ?auto_202904 ) ) ( not ( = ?auto_202903 ?auto_202899 ) ) ( not ( = ?auto_202903 ?auto_202898 ) ) ( not ( = ?auto_202902 ?auto_202904 ) ) ( not ( = ?auto_202902 ?auto_202899 ) ) ( not ( = ?auto_202902 ?auto_202898 ) ) ( not ( = ?auto_202896 ?auto_202901 ) ) ( not ( = ?auto_202896 ?auto_202903 ) ) ( not ( = ?auto_202896 ?auto_202902 ) ) ( not ( = ?auto_202897 ?auto_202901 ) ) ( not ( = ?auto_202897 ?auto_202903 ) ) ( not ( = ?auto_202897 ?auto_202902 ) ) ( ON ?auto_202896 ?auto_202900 ) ( not ( = ?auto_202896 ?auto_202900 ) ) ( not ( = ?auto_202897 ?auto_202900 ) ) ( not ( = ?auto_202898 ?auto_202900 ) ) ( not ( = ?auto_202899 ?auto_202900 ) ) ( not ( = ?auto_202904 ?auto_202900 ) ) ( not ( = ?auto_202901 ?auto_202900 ) ) ( not ( = ?auto_202903 ?auto_202900 ) ) ( not ( = ?auto_202902 ?auto_202900 ) ) ( ON ?auto_202897 ?auto_202896 ) ( ON-TABLE ?auto_202900 ) ( ON ?auto_202898 ?auto_202897 ) ( CLEAR ?auto_202904 ) ( ON ?auto_202899 ?auto_202898 ) ( CLEAR ?auto_202899 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_202900 ?auto_202896 ?auto_202897 ?auto_202898 )
      ( MAKE-4PILE ?auto_202896 ?auto_202897 ?auto_202898 ?auto_202899 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_202905 - BLOCK
      ?auto_202906 - BLOCK
      ?auto_202907 - BLOCK
      ?auto_202908 - BLOCK
    )
    :vars
    (
      ?auto_202910 - BLOCK
      ?auto_202909 - BLOCK
      ?auto_202913 - BLOCK
      ?auto_202912 - BLOCK
      ?auto_202911 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_202905 ?auto_202906 ) ) ( not ( = ?auto_202905 ?auto_202907 ) ) ( not ( = ?auto_202905 ?auto_202908 ) ) ( not ( = ?auto_202906 ?auto_202907 ) ) ( not ( = ?auto_202906 ?auto_202908 ) ) ( not ( = ?auto_202907 ?auto_202908 ) ) ( not ( = ?auto_202905 ?auto_202910 ) ) ( not ( = ?auto_202906 ?auto_202910 ) ) ( not ( = ?auto_202907 ?auto_202910 ) ) ( not ( = ?auto_202908 ?auto_202910 ) ) ( ON-TABLE ?auto_202909 ) ( ON ?auto_202913 ?auto_202909 ) ( ON ?auto_202912 ?auto_202913 ) ( not ( = ?auto_202909 ?auto_202913 ) ) ( not ( = ?auto_202909 ?auto_202912 ) ) ( not ( = ?auto_202909 ?auto_202910 ) ) ( not ( = ?auto_202909 ?auto_202908 ) ) ( not ( = ?auto_202909 ?auto_202907 ) ) ( not ( = ?auto_202913 ?auto_202912 ) ) ( not ( = ?auto_202913 ?auto_202910 ) ) ( not ( = ?auto_202913 ?auto_202908 ) ) ( not ( = ?auto_202913 ?auto_202907 ) ) ( not ( = ?auto_202912 ?auto_202910 ) ) ( not ( = ?auto_202912 ?auto_202908 ) ) ( not ( = ?auto_202912 ?auto_202907 ) ) ( not ( = ?auto_202905 ?auto_202909 ) ) ( not ( = ?auto_202905 ?auto_202913 ) ) ( not ( = ?auto_202905 ?auto_202912 ) ) ( not ( = ?auto_202906 ?auto_202909 ) ) ( not ( = ?auto_202906 ?auto_202913 ) ) ( not ( = ?auto_202906 ?auto_202912 ) ) ( ON ?auto_202905 ?auto_202911 ) ( not ( = ?auto_202905 ?auto_202911 ) ) ( not ( = ?auto_202906 ?auto_202911 ) ) ( not ( = ?auto_202907 ?auto_202911 ) ) ( not ( = ?auto_202908 ?auto_202911 ) ) ( not ( = ?auto_202910 ?auto_202911 ) ) ( not ( = ?auto_202909 ?auto_202911 ) ) ( not ( = ?auto_202913 ?auto_202911 ) ) ( not ( = ?auto_202912 ?auto_202911 ) ) ( ON ?auto_202906 ?auto_202905 ) ( ON-TABLE ?auto_202911 ) ( ON ?auto_202907 ?auto_202906 ) ( ON ?auto_202908 ?auto_202907 ) ( CLEAR ?auto_202908 ) ( HOLDING ?auto_202910 ) ( CLEAR ?auto_202912 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_202909 ?auto_202913 ?auto_202912 ?auto_202910 )
      ( MAKE-4PILE ?auto_202905 ?auto_202906 ?auto_202907 ?auto_202908 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_202914 - BLOCK
      ?auto_202915 - BLOCK
      ?auto_202916 - BLOCK
      ?auto_202917 - BLOCK
    )
    :vars
    (
      ?auto_202920 - BLOCK
      ?auto_202922 - BLOCK
      ?auto_202919 - BLOCK
      ?auto_202918 - BLOCK
      ?auto_202921 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_202914 ?auto_202915 ) ) ( not ( = ?auto_202914 ?auto_202916 ) ) ( not ( = ?auto_202914 ?auto_202917 ) ) ( not ( = ?auto_202915 ?auto_202916 ) ) ( not ( = ?auto_202915 ?auto_202917 ) ) ( not ( = ?auto_202916 ?auto_202917 ) ) ( not ( = ?auto_202914 ?auto_202920 ) ) ( not ( = ?auto_202915 ?auto_202920 ) ) ( not ( = ?auto_202916 ?auto_202920 ) ) ( not ( = ?auto_202917 ?auto_202920 ) ) ( ON-TABLE ?auto_202922 ) ( ON ?auto_202919 ?auto_202922 ) ( ON ?auto_202918 ?auto_202919 ) ( not ( = ?auto_202922 ?auto_202919 ) ) ( not ( = ?auto_202922 ?auto_202918 ) ) ( not ( = ?auto_202922 ?auto_202920 ) ) ( not ( = ?auto_202922 ?auto_202917 ) ) ( not ( = ?auto_202922 ?auto_202916 ) ) ( not ( = ?auto_202919 ?auto_202918 ) ) ( not ( = ?auto_202919 ?auto_202920 ) ) ( not ( = ?auto_202919 ?auto_202917 ) ) ( not ( = ?auto_202919 ?auto_202916 ) ) ( not ( = ?auto_202918 ?auto_202920 ) ) ( not ( = ?auto_202918 ?auto_202917 ) ) ( not ( = ?auto_202918 ?auto_202916 ) ) ( not ( = ?auto_202914 ?auto_202922 ) ) ( not ( = ?auto_202914 ?auto_202919 ) ) ( not ( = ?auto_202914 ?auto_202918 ) ) ( not ( = ?auto_202915 ?auto_202922 ) ) ( not ( = ?auto_202915 ?auto_202919 ) ) ( not ( = ?auto_202915 ?auto_202918 ) ) ( ON ?auto_202914 ?auto_202921 ) ( not ( = ?auto_202914 ?auto_202921 ) ) ( not ( = ?auto_202915 ?auto_202921 ) ) ( not ( = ?auto_202916 ?auto_202921 ) ) ( not ( = ?auto_202917 ?auto_202921 ) ) ( not ( = ?auto_202920 ?auto_202921 ) ) ( not ( = ?auto_202922 ?auto_202921 ) ) ( not ( = ?auto_202919 ?auto_202921 ) ) ( not ( = ?auto_202918 ?auto_202921 ) ) ( ON ?auto_202915 ?auto_202914 ) ( ON-TABLE ?auto_202921 ) ( ON ?auto_202916 ?auto_202915 ) ( ON ?auto_202917 ?auto_202916 ) ( CLEAR ?auto_202918 ) ( ON ?auto_202920 ?auto_202917 ) ( CLEAR ?auto_202920 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_202921 ?auto_202914 ?auto_202915 ?auto_202916 ?auto_202917 )
      ( MAKE-4PILE ?auto_202914 ?auto_202915 ?auto_202916 ?auto_202917 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_202923 - BLOCK
      ?auto_202924 - BLOCK
      ?auto_202925 - BLOCK
      ?auto_202926 - BLOCK
    )
    :vars
    (
      ?auto_202927 - BLOCK
      ?auto_202931 - BLOCK
      ?auto_202930 - BLOCK
      ?auto_202929 - BLOCK
      ?auto_202928 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_202923 ?auto_202924 ) ) ( not ( = ?auto_202923 ?auto_202925 ) ) ( not ( = ?auto_202923 ?auto_202926 ) ) ( not ( = ?auto_202924 ?auto_202925 ) ) ( not ( = ?auto_202924 ?auto_202926 ) ) ( not ( = ?auto_202925 ?auto_202926 ) ) ( not ( = ?auto_202923 ?auto_202927 ) ) ( not ( = ?auto_202924 ?auto_202927 ) ) ( not ( = ?auto_202925 ?auto_202927 ) ) ( not ( = ?auto_202926 ?auto_202927 ) ) ( ON-TABLE ?auto_202931 ) ( ON ?auto_202930 ?auto_202931 ) ( not ( = ?auto_202931 ?auto_202930 ) ) ( not ( = ?auto_202931 ?auto_202929 ) ) ( not ( = ?auto_202931 ?auto_202927 ) ) ( not ( = ?auto_202931 ?auto_202926 ) ) ( not ( = ?auto_202931 ?auto_202925 ) ) ( not ( = ?auto_202930 ?auto_202929 ) ) ( not ( = ?auto_202930 ?auto_202927 ) ) ( not ( = ?auto_202930 ?auto_202926 ) ) ( not ( = ?auto_202930 ?auto_202925 ) ) ( not ( = ?auto_202929 ?auto_202927 ) ) ( not ( = ?auto_202929 ?auto_202926 ) ) ( not ( = ?auto_202929 ?auto_202925 ) ) ( not ( = ?auto_202923 ?auto_202931 ) ) ( not ( = ?auto_202923 ?auto_202930 ) ) ( not ( = ?auto_202923 ?auto_202929 ) ) ( not ( = ?auto_202924 ?auto_202931 ) ) ( not ( = ?auto_202924 ?auto_202930 ) ) ( not ( = ?auto_202924 ?auto_202929 ) ) ( ON ?auto_202923 ?auto_202928 ) ( not ( = ?auto_202923 ?auto_202928 ) ) ( not ( = ?auto_202924 ?auto_202928 ) ) ( not ( = ?auto_202925 ?auto_202928 ) ) ( not ( = ?auto_202926 ?auto_202928 ) ) ( not ( = ?auto_202927 ?auto_202928 ) ) ( not ( = ?auto_202931 ?auto_202928 ) ) ( not ( = ?auto_202930 ?auto_202928 ) ) ( not ( = ?auto_202929 ?auto_202928 ) ) ( ON ?auto_202924 ?auto_202923 ) ( ON-TABLE ?auto_202928 ) ( ON ?auto_202925 ?auto_202924 ) ( ON ?auto_202926 ?auto_202925 ) ( ON ?auto_202927 ?auto_202926 ) ( CLEAR ?auto_202927 ) ( HOLDING ?auto_202929 ) ( CLEAR ?auto_202930 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_202931 ?auto_202930 ?auto_202929 )
      ( MAKE-4PILE ?auto_202923 ?auto_202924 ?auto_202925 ?auto_202926 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_202932 - BLOCK
      ?auto_202933 - BLOCK
      ?auto_202934 - BLOCK
      ?auto_202935 - BLOCK
    )
    :vars
    (
      ?auto_202938 - BLOCK
      ?auto_202940 - BLOCK
      ?auto_202937 - BLOCK
      ?auto_202936 - BLOCK
      ?auto_202939 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_202932 ?auto_202933 ) ) ( not ( = ?auto_202932 ?auto_202934 ) ) ( not ( = ?auto_202932 ?auto_202935 ) ) ( not ( = ?auto_202933 ?auto_202934 ) ) ( not ( = ?auto_202933 ?auto_202935 ) ) ( not ( = ?auto_202934 ?auto_202935 ) ) ( not ( = ?auto_202932 ?auto_202938 ) ) ( not ( = ?auto_202933 ?auto_202938 ) ) ( not ( = ?auto_202934 ?auto_202938 ) ) ( not ( = ?auto_202935 ?auto_202938 ) ) ( ON-TABLE ?auto_202940 ) ( ON ?auto_202937 ?auto_202940 ) ( not ( = ?auto_202940 ?auto_202937 ) ) ( not ( = ?auto_202940 ?auto_202936 ) ) ( not ( = ?auto_202940 ?auto_202938 ) ) ( not ( = ?auto_202940 ?auto_202935 ) ) ( not ( = ?auto_202940 ?auto_202934 ) ) ( not ( = ?auto_202937 ?auto_202936 ) ) ( not ( = ?auto_202937 ?auto_202938 ) ) ( not ( = ?auto_202937 ?auto_202935 ) ) ( not ( = ?auto_202937 ?auto_202934 ) ) ( not ( = ?auto_202936 ?auto_202938 ) ) ( not ( = ?auto_202936 ?auto_202935 ) ) ( not ( = ?auto_202936 ?auto_202934 ) ) ( not ( = ?auto_202932 ?auto_202940 ) ) ( not ( = ?auto_202932 ?auto_202937 ) ) ( not ( = ?auto_202932 ?auto_202936 ) ) ( not ( = ?auto_202933 ?auto_202940 ) ) ( not ( = ?auto_202933 ?auto_202937 ) ) ( not ( = ?auto_202933 ?auto_202936 ) ) ( ON ?auto_202932 ?auto_202939 ) ( not ( = ?auto_202932 ?auto_202939 ) ) ( not ( = ?auto_202933 ?auto_202939 ) ) ( not ( = ?auto_202934 ?auto_202939 ) ) ( not ( = ?auto_202935 ?auto_202939 ) ) ( not ( = ?auto_202938 ?auto_202939 ) ) ( not ( = ?auto_202940 ?auto_202939 ) ) ( not ( = ?auto_202937 ?auto_202939 ) ) ( not ( = ?auto_202936 ?auto_202939 ) ) ( ON ?auto_202933 ?auto_202932 ) ( ON-TABLE ?auto_202939 ) ( ON ?auto_202934 ?auto_202933 ) ( ON ?auto_202935 ?auto_202934 ) ( ON ?auto_202938 ?auto_202935 ) ( CLEAR ?auto_202937 ) ( ON ?auto_202936 ?auto_202938 ) ( CLEAR ?auto_202936 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_202939 ?auto_202932 ?auto_202933 ?auto_202934 ?auto_202935 ?auto_202938 )
      ( MAKE-4PILE ?auto_202932 ?auto_202933 ?auto_202934 ?auto_202935 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_202941 - BLOCK
      ?auto_202942 - BLOCK
      ?auto_202943 - BLOCK
      ?auto_202944 - BLOCK
    )
    :vars
    (
      ?auto_202949 - BLOCK
      ?auto_202946 - BLOCK
      ?auto_202948 - BLOCK
      ?auto_202945 - BLOCK
      ?auto_202947 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_202941 ?auto_202942 ) ) ( not ( = ?auto_202941 ?auto_202943 ) ) ( not ( = ?auto_202941 ?auto_202944 ) ) ( not ( = ?auto_202942 ?auto_202943 ) ) ( not ( = ?auto_202942 ?auto_202944 ) ) ( not ( = ?auto_202943 ?auto_202944 ) ) ( not ( = ?auto_202941 ?auto_202949 ) ) ( not ( = ?auto_202942 ?auto_202949 ) ) ( not ( = ?auto_202943 ?auto_202949 ) ) ( not ( = ?auto_202944 ?auto_202949 ) ) ( ON-TABLE ?auto_202946 ) ( not ( = ?auto_202946 ?auto_202948 ) ) ( not ( = ?auto_202946 ?auto_202945 ) ) ( not ( = ?auto_202946 ?auto_202949 ) ) ( not ( = ?auto_202946 ?auto_202944 ) ) ( not ( = ?auto_202946 ?auto_202943 ) ) ( not ( = ?auto_202948 ?auto_202945 ) ) ( not ( = ?auto_202948 ?auto_202949 ) ) ( not ( = ?auto_202948 ?auto_202944 ) ) ( not ( = ?auto_202948 ?auto_202943 ) ) ( not ( = ?auto_202945 ?auto_202949 ) ) ( not ( = ?auto_202945 ?auto_202944 ) ) ( not ( = ?auto_202945 ?auto_202943 ) ) ( not ( = ?auto_202941 ?auto_202946 ) ) ( not ( = ?auto_202941 ?auto_202948 ) ) ( not ( = ?auto_202941 ?auto_202945 ) ) ( not ( = ?auto_202942 ?auto_202946 ) ) ( not ( = ?auto_202942 ?auto_202948 ) ) ( not ( = ?auto_202942 ?auto_202945 ) ) ( ON ?auto_202941 ?auto_202947 ) ( not ( = ?auto_202941 ?auto_202947 ) ) ( not ( = ?auto_202942 ?auto_202947 ) ) ( not ( = ?auto_202943 ?auto_202947 ) ) ( not ( = ?auto_202944 ?auto_202947 ) ) ( not ( = ?auto_202949 ?auto_202947 ) ) ( not ( = ?auto_202946 ?auto_202947 ) ) ( not ( = ?auto_202948 ?auto_202947 ) ) ( not ( = ?auto_202945 ?auto_202947 ) ) ( ON ?auto_202942 ?auto_202941 ) ( ON-TABLE ?auto_202947 ) ( ON ?auto_202943 ?auto_202942 ) ( ON ?auto_202944 ?auto_202943 ) ( ON ?auto_202949 ?auto_202944 ) ( ON ?auto_202945 ?auto_202949 ) ( CLEAR ?auto_202945 ) ( HOLDING ?auto_202948 ) ( CLEAR ?auto_202946 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_202946 ?auto_202948 )
      ( MAKE-4PILE ?auto_202941 ?auto_202942 ?auto_202943 ?auto_202944 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_202950 - BLOCK
      ?auto_202951 - BLOCK
      ?auto_202952 - BLOCK
      ?auto_202953 - BLOCK
    )
    :vars
    (
      ?auto_202958 - BLOCK
      ?auto_202957 - BLOCK
      ?auto_202956 - BLOCK
      ?auto_202955 - BLOCK
      ?auto_202954 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_202950 ?auto_202951 ) ) ( not ( = ?auto_202950 ?auto_202952 ) ) ( not ( = ?auto_202950 ?auto_202953 ) ) ( not ( = ?auto_202951 ?auto_202952 ) ) ( not ( = ?auto_202951 ?auto_202953 ) ) ( not ( = ?auto_202952 ?auto_202953 ) ) ( not ( = ?auto_202950 ?auto_202958 ) ) ( not ( = ?auto_202951 ?auto_202958 ) ) ( not ( = ?auto_202952 ?auto_202958 ) ) ( not ( = ?auto_202953 ?auto_202958 ) ) ( ON-TABLE ?auto_202957 ) ( not ( = ?auto_202957 ?auto_202956 ) ) ( not ( = ?auto_202957 ?auto_202955 ) ) ( not ( = ?auto_202957 ?auto_202958 ) ) ( not ( = ?auto_202957 ?auto_202953 ) ) ( not ( = ?auto_202957 ?auto_202952 ) ) ( not ( = ?auto_202956 ?auto_202955 ) ) ( not ( = ?auto_202956 ?auto_202958 ) ) ( not ( = ?auto_202956 ?auto_202953 ) ) ( not ( = ?auto_202956 ?auto_202952 ) ) ( not ( = ?auto_202955 ?auto_202958 ) ) ( not ( = ?auto_202955 ?auto_202953 ) ) ( not ( = ?auto_202955 ?auto_202952 ) ) ( not ( = ?auto_202950 ?auto_202957 ) ) ( not ( = ?auto_202950 ?auto_202956 ) ) ( not ( = ?auto_202950 ?auto_202955 ) ) ( not ( = ?auto_202951 ?auto_202957 ) ) ( not ( = ?auto_202951 ?auto_202956 ) ) ( not ( = ?auto_202951 ?auto_202955 ) ) ( ON ?auto_202950 ?auto_202954 ) ( not ( = ?auto_202950 ?auto_202954 ) ) ( not ( = ?auto_202951 ?auto_202954 ) ) ( not ( = ?auto_202952 ?auto_202954 ) ) ( not ( = ?auto_202953 ?auto_202954 ) ) ( not ( = ?auto_202958 ?auto_202954 ) ) ( not ( = ?auto_202957 ?auto_202954 ) ) ( not ( = ?auto_202956 ?auto_202954 ) ) ( not ( = ?auto_202955 ?auto_202954 ) ) ( ON ?auto_202951 ?auto_202950 ) ( ON-TABLE ?auto_202954 ) ( ON ?auto_202952 ?auto_202951 ) ( ON ?auto_202953 ?auto_202952 ) ( ON ?auto_202958 ?auto_202953 ) ( ON ?auto_202955 ?auto_202958 ) ( CLEAR ?auto_202957 ) ( ON ?auto_202956 ?auto_202955 ) ( CLEAR ?auto_202956 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_202954 ?auto_202950 ?auto_202951 ?auto_202952 ?auto_202953 ?auto_202958 ?auto_202955 )
      ( MAKE-4PILE ?auto_202950 ?auto_202951 ?auto_202952 ?auto_202953 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_202959 - BLOCK
      ?auto_202960 - BLOCK
      ?auto_202961 - BLOCK
      ?auto_202962 - BLOCK
    )
    :vars
    (
      ?auto_202967 - BLOCK
      ?auto_202965 - BLOCK
      ?auto_202964 - BLOCK
      ?auto_202963 - BLOCK
      ?auto_202966 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_202959 ?auto_202960 ) ) ( not ( = ?auto_202959 ?auto_202961 ) ) ( not ( = ?auto_202959 ?auto_202962 ) ) ( not ( = ?auto_202960 ?auto_202961 ) ) ( not ( = ?auto_202960 ?auto_202962 ) ) ( not ( = ?auto_202961 ?auto_202962 ) ) ( not ( = ?auto_202959 ?auto_202967 ) ) ( not ( = ?auto_202960 ?auto_202967 ) ) ( not ( = ?auto_202961 ?auto_202967 ) ) ( not ( = ?auto_202962 ?auto_202967 ) ) ( not ( = ?auto_202965 ?auto_202964 ) ) ( not ( = ?auto_202965 ?auto_202963 ) ) ( not ( = ?auto_202965 ?auto_202967 ) ) ( not ( = ?auto_202965 ?auto_202962 ) ) ( not ( = ?auto_202965 ?auto_202961 ) ) ( not ( = ?auto_202964 ?auto_202963 ) ) ( not ( = ?auto_202964 ?auto_202967 ) ) ( not ( = ?auto_202964 ?auto_202962 ) ) ( not ( = ?auto_202964 ?auto_202961 ) ) ( not ( = ?auto_202963 ?auto_202967 ) ) ( not ( = ?auto_202963 ?auto_202962 ) ) ( not ( = ?auto_202963 ?auto_202961 ) ) ( not ( = ?auto_202959 ?auto_202965 ) ) ( not ( = ?auto_202959 ?auto_202964 ) ) ( not ( = ?auto_202959 ?auto_202963 ) ) ( not ( = ?auto_202960 ?auto_202965 ) ) ( not ( = ?auto_202960 ?auto_202964 ) ) ( not ( = ?auto_202960 ?auto_202963 ) ) ( ON ?auto_202959 ?auto_202966 ) ( not ( = ?auto_202959 ?auto_202966 ) ) ( not ( = ?auto_202960 ?auto_202966 ) ) ( not ( = ?auto_202961 ?auto_202966 ) ) ( not ( = ?auto_202962 ?auto_202966 ) ) ( not ( = ?auto_202967 ?auto_202966 ) ) ( not ( = ?auto_202965 ?auto_202966 ) ) ( not ( = ?auto_202964 ?auto_202966 ) ) ( not ( = ?auto_202963 ?auto_202966 ) ) ( ON ?auto_202960 ?auto_202959 ) ( ON-TABLE ?auto_202966 ) ( ON ?auto_202961 ?auto_202960 ) ( ON ?auto_202962 ?auto_202961 ) ( ON ?auto_202967 ?auto_202962 ) ( ON ?auto_202963 ?auto_202967 ) ( ON ?auto_202964 ?auto_202963 ) ( CLEAR ?auto_202964 ) ( HOLDING ?auto_202965 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_202965 )
      ( MAKE-4PILE ?auto_202959 ?auto_202960 ?auto_202961 ?auto_202962 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_202968 - BLOCK
      ?auto_202969 - BLOCK
      ?auto_202970 - BLOCK
      ?auto_202971 - BLOCK
    )
    :vars
    (
      ?auto_202975 - BLOCK
      ?auto_202972 - BLOCK
      ?auto_202976 - BLOCK
      ?auto_202973 - BLOCK
      ?auto_202974 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_202968 ?auto_202969 ) ) ( not ( = ?auto_202968 ?auto_202970 ) ) ( not ( = ?auto_202968 ?auto_202971 ) ) ( not ( = ?auto_202969 ?auto_202970 ) ) ( not ( = ?auto_202969 ?auto_202971 ) ) ( not ( = ?auto_202970 ?auto_202971 ) ) ( not ( = ?auto_202968 ?auto_202975 ) ) ( not ( = ?auto_202969 ?auto_202975 ) ) ( not ( = ?auto_202970 ?auto_202975 ) ) ( not ( = ?auto_202971 ?auto_202975 ) ) ( not ( = ?auto_202972 ?auto_202976 ) ) ( not ( = ?auto_202972 ?auto_202973 ) ) ( not ( = ?auto_202972 ?auto_202975 ) ) ( not ( = ?auto_202972 ?auto_202971 ) ) ( not ( = ?auto_202972 ?auto_202970 ) ) ( not ( = ?auto_202976 ?auto_202973 ) ) ( not ( = ?auto_202976 ?auto_202975 ) ) ( not ( = ?auto_202976 ?auto_202971 ) ) ( not ( = ?auto_202976 ?auto_202970 ) ) ( not ( = ?auto_202973 ?auto_202975 ) ) ( not ( = ?auto_202973 ?auto_202971 ) ) ( not ( = ?auto_202973 ?auto_202970 ) ) ( not ( = ?auto_202968 ?auto_202972 ) ) ( not ( = ?auto_202968 ?auto_202976 ) ) ( not ( = ?auto_202968 ?auto_202973 ) ) ( not ( = ?auto_202969 ?auto_202972 ) ) ( not ( = ?auto_202969 ?auto_202976 ) ) ( not ( = ?auto_202969 ?auto_202973 ) ) ( ON ?auto_202968 ?auto_202974 ) ( not ( = ?auto_202968 ?auto_202974 ) ) ( not ( = ?auto_202969 ?auto_202974 ) ) ( not ( = ?auto_202970 ?auto_202974 ) ) ( not ( = ?auto_202971 ?auto_202974 ) ) ( not ( = ?auto_202975 ?auto_202974 ) ) ( not ( = ?auto_202972 ?auto_202974 ) ) ( not ( = ?auto_202976 ?auto_202974 ) ) ( not ( = ?auto_202973 ?auto_202974 ) ) ( ON ?auto_202969 ?auto_202968 ) ( ON-TABLE ?auto_202974 ) ( ON ?auto_202970 ?auto_202969 ) ( ON ?auto_202971 ?auto_202970 ) ( ON ?auto_202975 ?auto_202971 ) ( ON ?auto_202973 ?auto_202975 ) ( ON ?auto_202976 ?auto_202973 ) ( ON ?auto_202972 ?auto_202976 ) ( CLEAR ?auto_202972 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_202974 ?auto_202968 ?auto_202969 ?auto_202970 ?auto_202971 ?auto_202975 ?auto_202973 ?auto_202976 )
      ( MAKE-4PILE ?auto_202968 ?auto_202969 ?auto_202970 ?auto_202971 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_202980 - BLOCK
      ?auto_202981 - BLOCK
      ?auto_202982 - BLOCK
    )
    :vars
    (
      ?auto_202983 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_202983 ?auto_202982 ) ( CLEAR ?auto_202983 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_202980 ) ( ON ?auto_202981 ?auto_202980 ) ( ON ?auto_202982 ?auto_202981 ) ( not ( = ?auto_202980 ?auto_202981 ) ) ( not ( = ?auto_202980 ?auto_202982 ) ) ( not ( = ?auto_202980 ?auto_202983 ) ) ( not ( = ?auto_202981 ?auto_202982 ) ) ( not ( = ?auto_202981 ?auto_202983 ) ) ( not ( = ?auto_202982 ?auto_202983 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_202983 ?auto_202982 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_202984 - BLOCK
      ?auto_202985 - BLOCK
      ?auto_202986 - BLOCK
    )
    :vars
    (
      ?auto_202987 - BLOCK
      ?auto_202988 - BLOCK
      ?auto_202989 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_202987 ?auto_202986 ) ( CLEAR ?auto_202987 ) ( ON-TABLE ?auto_202984 ) ( ON ?auto_202985 ?auto_202984 ) ( ON ?auto_202986 ?auto_202985 ) ( not ( = ?auto_202984 ?auto_202985 ) ) ( not ( = ?auto_202984 ?auto_202986 ) ) ( not ( = ?auto_202984 ?auto_202987 ) ) ( not ( = ?auto_202985 ?auto_202986 ) ) ( not ( = ?auto_202985 ?auto_202987 ) ) ( not ( = ?auto_202986 ?auto_202987 ) ) ( HOLDING ?auto_202988 ) ( CLEAR ?auto_202989 ) ( not ( = ?auto_202984 ?auto_202988 ) ) ( not ( = ?auto_202984 ?auto_202989 ) ) ( not ( = ?auto_202985 ?auto_202988 ) ) ( not ( = ?auto_202985 ?auto_202989 ) ) ( not ( = ?auto_202986 ?auto_202988 ) ) ( not ( = ?auto_202986 ?auto_202989 ) ) ( not ( = ?auto_202987 ?auto_202988 ) ) ( not ( = ?auto_202987 ?auto_202989 ) ) ( not ( = ?auto_202988 ?auto_202989 ) ) )
    :subtasks
    ( ( !STACK ?auto_202988 ?auto_202989 )
      ( MAKE-3PILE ?auto_202984 ?auto_202985 ?auto_202986 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_202990 - BLOCK
      ?auto_202991 - BLOCK
      ?auto_202992 - BLOCK
    )
    :vars
    (
      ?auto_202993 - BLOCK
      ?auto_202994 - BLOCK
      ?auto_202995 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_202993 ?auto_202992 ) ( ON-TABLE ?auto_202990 ) ( ON ?auto_202991 ?auto_202990 ) ( ON ?auto_202992 ?auto_202991 ) ( not ( = ?auto_202990 ?auto_202991 ) ) ( not ( = ?auto_202990 ?auto_202992 ) ) ( not ( = ?auto_202990 ?auto_202993 ) ) ( not ( = ?auto_202991 ?auto_202992 ) ) ( not ( = ?auto_202991 ?auto_202993 ) ) ( not ( = ?auto_202992 ?auto_202993 ) ) ( CLEAR ?auto_202994 ) ( not ( = ?auto_202990 ?auto_202995 ) ) ( not ( = ?auto_202990 ?auto_202994 ) ) ( not ( = ?auto_202991 ?auto_202995 ) ) ( not ( = ?auto_202991 ?auto_202994 ) ) ( not ( = ?auto_202992 ?auto_202995 ) ) ( not ( = ?auto_202992 ?auto_202994 ) ) ( not ( = ?auto_202993 ?auto_202995 ) ) ( not ( = ?auto_202993 ?auto_202994 ) ) ( not ( = ?auto_202995 ?auto_202994 ) ) ( ON ?auto_202995 ?auto_202993 ) ( CLEAR ?auto_202995 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_202990 ?auto_202991 ?auto_202992 ?auto_202993 )
      ( MAKE-3PILE ?auto_202990 ?auto_202991 ?auto_202992 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_202996 - BLOCK
      ?auto_202997 - BLOCK
      ?auto_202998 - BLOCK
    )
    :vars
    (
      ?auto_203001 - BLOCK
      ?auto_203000 - BLOCK
      ?auto_202999 - BLOCK
      ?auto_203003 - BLOCK
      ?auto_203002 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_203001 ?auto_202998 ) ( ON-TABLE ?auto_202996 ) ( ON ?auto_202997 ?auto_202996 ) ( ON ?auto_202998 ?auto_202997 ) ( not ( = ?auto_202996 ?auto_202997 ) ) ( not ( = ?auto_202996 ?auto_202998 ) ) ( not ( = ?auto_202996 ?auto_203001 ) ) ( not ( = ?auto_202997 ?auto_202998 ) ) ( not ( = ?auto_202997 ?auto_203001 ) ) ( not ( = ?auto_202998 ?auto_203001 ) ) ( not ( = ?auto_202996 ?auto_203000 ) ) ( not ( = ?auto_202996 ?auto_202999 ) ) ( not ( = ?auto_202997 ?auto_203000 ) ) ( not ( = ?auto_202997 ?auto_202999 ) ) ( not ( = ?auto_202998 ?auto_203000 ) ) ( not ( = ?auto_202998 ?auto_202999 ) ) ( not ( = ?auto_203001 ?auto_203000 ) ) ( not ( = ?auto_203001 ?auto_202999 ) ) ( not ( = ?auto_203000 ?auto_202999 ) ) ( ON ?auto_203000 ?auto_203001 ) ( CLEAR ?auto_203000 ) ( HOLDING ?auto_202999 ) ( CLEAR ?auto_203003 ) ( ON-TABLE ?auto_203002 ) ( ON ?auto_203003 ?auto_203002 ) ( not ( = ?auto_203002 ?auto_203003 ) ) ( not ( = ?auto_203002 ?auto_202999 ) ) ( not ( = ?auto_203003 ?auto_202999 ) ) ( not ( = ?auto_202996 ?auto_203003 ) ) ( not ( = ?auto_202996 ?auto_203002 ) ) ( not ( = ?auto_202997 ?auto_203003 ) ) ( not ( = ?auto_202997 ?auto_203002 ) ) ( not ( = ?auto_202998 ?auto_203003 ) ) ( not ( = ?auto_202998 ?auto_203002 ) ) ( not ( = ?auto_203001 ?auto_203003 ) ) ( not ( = ?auto_203001 ?auto_203002 ) ) ( not ( = ?auto_203000 ?auto_203003 ) ) ( not ( = ?auto_203000 ?auto_203002 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_203002 ?auto_203003 ?auto_202999 )
      ( MAKE-3PILE ?auto_202996 ?auto_202997 ?auto_202998 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_203004 - BLOCK
      ?auto_203005 - BLOCK
      ?auto_203006 - BLOCK
    )
    :vars
    (
      ?auto_203008 - BLOCK
      ?auto_203009 - BLOCK
      ?auto_203010 - BLOCK
      ?auto_203011 - BLOCK
      ?auto_203007 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_203008 ?auto_203006 ) ( ON-TABLE ?auto_203004 ) ( ON ?auto_203005 ?auto_203004 ) ( ON ?auto_203006 ?auto_203005 ) ( not ( = ?auto_203004 ?auto_203005 ) ) ( not ( = ?auto_203004 ?auto_203006 ) ) ( not ( = ?auto_203004 ?auto_203008 ) ) ( not ( = ?auto_203005 ?auto_203006 ) ) ( not ( = ?auto_203005 ?auto_203008 ) ) ( not ( = ?auto_203006 ?auto_203008 ) ) ( not ( = ?auto_203004 ?auto_203009 ) ) ( not ( = ?auto_203004 ?auto_203010 ) ) ( not ( = ?auto_203005 ?auto_203009 ) ) ( not ( = ?auto_203005 ?auto_203010 ) ) ( not ( = ?auto_203006 ?auto_203009 ) ) ( not ( = ?auto_203006 ?auto_203010 ) ) ( not ( = ?auto_203008 ?auto_203009 ) ) ( not ( = ?auto_203008 ?auto_203010 ) ) ( not ( = ?auto_203009 ?auto_203010 ) ) ( ON ?auto_203009 ?auto_203008 ) ( CLEAR ?auto_203011 ) ( ON-TABLE ?auto_203007 ) ( ON ?auto_203011 ?auto_203007 ) ( not ( = ?auto_203007 ?auto_203011 ) ) ( not ( = ?auto_203007 ?auto_203010 ) ) ( not ( = ?auto_203011 ?auto_203010 ) ) ( not ( = ?auto_203004 ?auto_203011 ) ) ( not ( = ?auto_203004 ?auto_203007 ) ) ( not ( = ?auto_203005 ?auto_203011 ) ) ( not ( = ?auto_203005 ?auto_203007 ) ) ( not ( = ?auto_203006 ?auto_203011 ) ) ( not ( = ?auto_203006 ?auto_203007 ) ) ( not ( = ?auto_203008 ?auto_203011 ) ) ( not ( = ?auto_203008 ?auto_203007 ) ) ( not ( = ?auto_203009 ?auto_203011 ) ) ( not ( = ?auto_203009 ?auto_203007 ) ) ( ON ?auto_203010 ?auto_203009 ) ( CLEAR ?auto_203010 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_203004 ?auto_203005 ?auto_203006 ?auto_203008 ?auto_203009 )
      ( MAKE-3PILE ?auto_203004 ?auto_203005 ?auto_203006 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_203012 - BLOCK
      ?auto_203013 - BLOCK
      ?auto_203014 - BLOCK
    )
    :vars
    (
      ?auto_203015 - BLOCK
      ?auto_203016 - BLOCK
      ?auto_203018 - BLOCK
      ?auto_203019 - BLOCK
      ?auto_203017 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_203015 ?auto_203014 ) ( ON-TABLE ?auto_203012 ) ( ON ?auto_203013 ?auto_203012 ) ( ON ?auto_203014 ?auto_203013 ) ( not ( = ?auto_203012 ?auto_203013 ) ) ( not ( = ?auto_203012 ?auto_203014 ) ) ( not ( = ?auto_203012 ?auto_203015 ) ) ( not ( = ?auto_203013 ?auto_203014 ) ) ( not ( = ?auto_203013 ?auto_203015 ) ) ( not ( = ?auto_203014 ?auto_203015 ) ) ( not ( = ?auto_203012 ?auto_203016 ) ) ( not ( = ?auto_203012 ?auto_203018 ) ) ( not ( = ?auto_203013 ?auto_203016 ) ) ( not ( = ?auto_203013 ?auto_203018 ) ) ( not ( = ?auto_203014 ?auto_203016 ) ) ( not ( = ?auto_203014 ?auto_203018 ) ) ( not ( = ?auto_203015 ?auto_203016 ) ) ( not ( = ?auto_203015 ?auto_203018 ) ) ( not ( = ?auto_203016 ?auto_203018 ) ) ( ON ?auto_203016 ?auto_203015 ) ( ON-TABLE ?auto_203019 ) ( not ( = ?auto_203019 ?auto_203017 ) ) ( not ( = ?auto_203019 ?auto_203018 ) ) ( not ( = ?auto_203017 ?auto_203018 ) ) ( not ( = ?auto_203012 ?auto_203017 ) ) ( not ( = ?auto_203012 ?auto_203019 ) ) ( not ( = ?auto_203013 ?auto_203017 ) ) ( not ( = ?auto_203013 ?auto_203019 ) ) ( not ( = ?auto_203014 ?auto_203017 ) ) ( not ( = ?auto_203014 ?auto_203019 ) ) ( not ( = ?auto_203015 ?auto_203017 ) ) ( not ( = ?auto_203015 ?auto_203019 ) ) ( not ( = ?auto_203016 ?auto_203017 ) ) ( not ( = ?auto_203016 ?auto_203019 ) ) ( ON ?auto_203018 ?auto_203016 ) ( CLEAR ?auto_203018 ) ( HOLDING ?auto_203017 ) ( CLEAR ?auto_203019 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_203019 ?auto_203017 )
      ( MAKE-3PILE ?auto_203012 ?auto_203013 ?auto_203014 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_203020 - BLOCK
      ?auto_203021 - BLOCK
      ?auto_203022 - BLOCK
    )
    :vars
    (
      ?auto_203023 - BLOCK
      ?auto_203026 - BLOCK
      ?auto_203027 - BLOCK
      ?auto_203025 - BLOCK
      ?auto_203024 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_203023 ?auto_203022 ) ( ON-TABLE ?auto_203020 ) ( ON ?auto_203021 ?auto_203020 ) ( ON ?auto_203022 ?auto_203021 ) ( not ( = ?auto_203020 ?auto_203021 ) ) ( not ( = ?auto_203020 ?auto_203022 ) ) ( not ( = ?auto_203020 ?auto_203023 ) ) ( not ( = ?auto_203021 ?auto_203022 ) ) ( not ( = ?auto_203021 ?auto_203023 ) ) ( not ( = ?auto_203022 ?auto_203023 ) ) ( not ( = ?auto_203020 ?auto_203026 ) ) ( not ( = ?auto_203020 ?auto_203027 ) ) ( not ( = ?auto_203021 ?auto_203026 ) ) ( not ( = ?auto_203021 ?auto_203027 ) ) ( not ( = ?auto_203022 ?auto_203026 ) ) ( not ( = ?auto_203022 ?auto_203027 ) ) ( not ( = ?auto_203023 ?auto_203026 ) ) ( not ( = ?auto_203023 ?auto_203027 ) ) ( not ( = ?auto_203026 ?auto_203027 ) ) ( ON ?auto_203026 ?auto_203023 ) ( ON-TABLE ?auto_203025 ) ( not ( = ?auto_203025 ?auto_203024 ) ) ( not ( = ?auto_203025 ?auto_203027 ) ) ( not ( = ?auto_203024 ?auto_203027 ) ) ( not ( = ?auto_203020 ?auto_203024 ) ) ( not ( = ?auto_203020 ?auto_203025 ) ) ( not ( = ?auto_203021 ?auto_203024 ) ) ( not ( = ?auto_203021 ?auto_203025 ) ) ( not ( = ?auto_203022 ?auto_203024 ) ) ( not ( = ?auto_203022 ?auto_203025 ) ) ( not ( = ?auto_203023 ?auto_203024 ) ) ( not ( = ?auto_203023 ?auto_203025 ) ) ( not ( = ?auto_203026 ?auto_203024 ) ) ( not ( = ?auto_203026 ?auto_203025 ) ) ( ON ?auto_203027 ?auto_203026 ) ( CLEAR ?auto_203025 ) ( ON ?auto_203024 ?auto_203027 ) ( CLEAR ?auto_203024 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_203020 ?auto_203021 ?auto_203022 ?auto_203023 ?auto_203026 ?auto_203027 )
      ( MAKE-3PILE ?auto_203020 ?auto_203021 ?auto_203022 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_203028 - BLOCK
      ?auto_203029 - BLOCK
      ?auto_203030 - BLOCK
    )
    :vars
    (
      ?auto_203032 - BLOCK
      ?auto_203035 - BLOCK
      ?auto_203031 - BLOCK
      ?auto_203033 - BLOCK
      ?auto_203034 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_203032 ?auto_203030 ) ( ON-TABLE ?auto_203028 ) ( ON ?auto_203029 ?auto_203028 ) ( ON ?auto_203030 ?auto_203029 ) ( not ( = ?auto_203028 ?auto_203029 ) ) ( not ( = ?auto_203028 ?auto_203030 ) ) ( not ( = ?auto_203028 ?auto_203032 ) ) ( not ( = ?auto_203029 ?auto_203030 ) ) ( not ( = ?auto_203029 ?auto_203032 ) ) ( not ( = ?auto_203030 ?auto_203032 ) ) ( not ( = ?auto_203028 ?auto_203035 ) ) ( not ( = ?auto_203028 ?auto_203031 ) ) ( not ( = ?auto_203029 ?auto_203035 ) ) ( not ( = ?auto_203029 ?auto_203031 ) ) ( not ( = ?auto_203030 ?auto_203035 ) ) ( not ( = ?auto_203030 ?auto_203031 ) ) ( not ( = ?auto_203032 ?auto_203035 ) ) ( not ( = ?auto_203032 ?auto_203031 ) ) ( not ( = ?auto_203035 ?auto_203031 ) ) ( ON ?auto_203035 ?auto_203032 ) ( not ( = ?auto_203033 ?auto_203034 ) ) ( not ( = ?auto_203033 ?auto_203031 ) ) ( not ( = ?auto_203034 ?auto_203031 ) ) ( not ( = ?auto_203028 ?auto_203034 ) ) ( not ( = ?auto_203028 ?auto_203033 ) ) ( not ( = ?auto_203029 ?auto_203034 ) ) ( not ( = ?auto_203029 ?auto_203033 ) ) ( not ( = ?auto_203030 ?auto_203034 ) ) ( not ( = ?auto_203030 ?auto_203033 ) ) ( not ( = ?auto_203032 ?auto_203034 ) ) ( not ( = ?auto_203032 ?auto_203033 ) ) ( not ( = ?auto_203035 ?auto_203034 ) ) ( not ( = ?auto_203035 ?auto_203033 ) ) ( ON ?auto_203031 ?auto_203035 ) ( ON ?auto_203034 ?auto_203031 ) ( CLEAR ?auto_203034 ) ( HOLDING ?auto_203033 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_203033 )
      ( MAKE-3PILE ?auto_203028 ?auto_203029 ?auto_203030 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_203036 - BLOCK
      ?auto_203037 - BLOCK
      ?auto_203038 - BLOCK
    )
    :vars
    (
      ?auto_203040 - BLOCK
      ?auto_203043 - BLOCK
      ?auto_203042 - BLOCK
      ?auto_203039 - BLOCK
      ?auto_203041 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_203040 ?auto_203038 ) ( ON-TABLE ?auto_203036 ) ( ON ?auto_203037 ?auto_203036 ) ( ON ?auto_203038 ?auto_203037 ) ( not ( = ?auto_203036 ?auto_203037 ) ) ( not ( = ?auto_203036 ?auto_203038 ) ) ( not ( = ?auto_203036 ?auto_203040 ) ) ( not ( = ?auto_203037 ?auto_203038 ) ) ( not ( = ?auto_203037 ?auto_203040 ) ) ( not ( = ?auto_203038 ?auto_203040 ) ) ( not ( = ?auto_203036 ?auto_203043 ) ) ( not ( = ?auto_203036 ?auto_203042 ) ) ( not ( = ?auto_203037 ?auto_203043 ) ) ( not ( = ?auto_203037 ?auto_203042 ) ) ( not ( = ?auto_203038 ?auto_203043 ) ) ( not ( = ?auto_203038 ?auto_203042 ) ) ( not ( = ?auto_203040 ?auto_203043 ) ) ( not ( = ?auto_203040 ?auto_203042 ) ) ( not ( = ?auto_203043 ?auto_203042 ) ) ( ON ?auto_203043 ?auto_203040 ) ( not ( = ?auto_203039 ?auto_203041 ) ) ( not ( = ?auto_203039 ?auto_203042 ) ) ( not ( = ?auto_203041 ?auto_203042 ) ) ( not ( = ?auto_203036 ?auto_203041 ) ) ( not ( = ?auto_203036 ?auto_203039 ) ) ( not ( = ?auto_203037 ?auto_203041 ) ) ( not ( = ?auto_203037 ?auto_203039 ) ) ( not ( = ?auto_203038 ?auto_203041 ) ) ( not ( = ?auto_203038 ?auto_203039 ) ) ( not ( = ?auto_203040 ?auto_203041 ) ) ( not ( = ?auto_203040 ?auto_203039 ) ) ( not ( = ?auto_203043 ?auto_203041 ) ) ( not ( = ?auto_203043 ?auto_203039 ) ) ( ON ?auto_203042 ?auto_203043 ) ( ON ?auto_203041 ?auto_203042 ) ( ON ?auto_203039 ?auto_203041 ) ( CLEAR ?auto_203039 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_203036 ?auto_203037 ?auto_203038 ?auto_203040 ?auto_203043 ?auto_203042 ?auto_203041 )
      ( MAKE-3PILE ?auto_203036 ?auto_203037 ?auto_203038 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_203044 - BLOCK
      ?auto_203045 - BLOCK
      ?auto_203046 - BLOCK
    )
    :vars
    (
      ?auto_203051 - BLOCK
      ?auto_203047 - BLOCK
      ?auto_203049 - BLOCK
      ?auto_203050 - BLOCK
      ?auto_203048 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_203051 ?auto_203046 ) ( ON-TABLE ?auto_203044 ) ( ON ?auto_203045 ?auto_203044 ) ( ON ?auto_203046 ?auto_203045 ) ( not ( = ?auto_203044 ?auto_203045 ) ) ( not ( = ?auto_203044 ?auto_203046 ) ) ( not ( = ?auto_203044 ?auto_203051 ) ) ( not ( = ?auto_203045 ?auto_203046 ) ) ( not ( = ?auto_203045 ?auto_203051 ) ) ( not ( = ?auto_203046 ?auto_203051 ) ) ( not ( = ?auto_203044 ?auto_203047 ) ) ( not ( = ?auto_203044 ?auto_203049 ) ) ( not ( = ?auto_203045 ?auto_203047 ) ) ( not ( = ?auto_203045 ?auto_203049 ) ) ( not ( = ?auto_203046 ?auto_203047 ) ) ( not ( = ?auto_203046 ?auto_203049 ) ) ( not ( = ?auto_203051 ?auto_203047 ) ) ( not ( = ?auto_203051 ?auto_203049 ) ) ( not ( = ?auto_203047 ?auto_203049 ) ) ( ON ?auto_203047 ?auto_203051 ) ( not ( = ?auto_203050 ?auto_203048 ) ) ( not ( = ?auto_203050 ?auto_203049 ) ) ( not ( = ?auto_203048 ?auto_203049 ) ) ( not ( = ?auto_203044 ?auto_203048 ) ) ( not ( = ?auto_203044 ?auto_203050 ) ) ( not ( = ?auto_203045 ?auto_203048 ) ) ( not ( = ?auto_203045 ?auto_203050 ) ) ( not ( = ?auto_203046 ?auto_203048 ) ) ( not ( = ?auto_203046 ?auto_203050 ) ) ( not ( = ?auto_203051 ?auto_203048 ) ) ( not ( = ?auto_203051 ?auto_203050 ) ) ( not ( = ?auto_203047 ?auto_203048 ) ) ( not ( = ?auto_203047 ?auto_203050 ) ) ( ON ?auto_203049 ?auto_203047 ) ( ON ?auto_203048 ?auto_203049 ) ( HOLDING ?auto_203050 ) ( CLEAR ?auto_203048 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_203044 ?auto_203045 ?auto_203046 ?auto_203051 ?auto_203047 ?auto_203049 ?auto_203048 ?auto_203050 )
      ( MAKE-3PILE ?auto_203044 ?auto_203045 ?auto_203046 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_203052 - BLOCK
      ?auto_203053 - BLOCK
      ?auto_203054 - BLOCK
    )
    :vars
    (
      ?auto_203057 - BLOCK
      ?auto_203058 - BLOCK
      ?auto_203055 - BLOCK
      ?auto_203059 - BLOCK
      ?auto_203056 - BLOCK
      ?auto_203060 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_203057 ?auto_203054 ) ( ON-TABLE ?auto_203052 ) ( ON ?auto_203053 ?auto_203052 ) ( ON ?auto_203054 ?auto_203053 ) ( not ( = ?auto_203052 ?auto_203053 ) ) ( not ( = ?auto_203052 ?auto_203054 ) ) ( not ( = ?auto_203052 ?auto_203057 ) ) ( not ( = ?auto_203053 ?auto_203054 ) ) ( not ( = ?auto_203053 ?auto_203057 ) ) ( not ( = ?auto_203054 ?auto_203057 ) ) ( not ( = ?auto_203052 ?auto_203058 ) ) ( not ( = ?auto_203052 ?auto_203055 ) ) ( not ( = ?auto_203053 ?auto_203058 ) ) ( not ( = ?auto_203053 ?auto_203055 ) ) ( not ( = ?auto_203054 ?auto_203058 ) ) ( not ( = ?auto_203054 ?auto_203055 ) ) ( not ( = ?auto_203057 ?auto_203058 ) ) ( not ( = ?auto_203057 ?auto_203055 ) ) ( not ( = ?auto_203058 ?auto_203055 ) ) ( ON ?auto_203058 ?auto_203057 ) ( not ( = ?auto_203059 ?auto_203056 ) ) ( not ( = ?auto_203059 ?auto_203055 ) ) ( not ( = ?auto_203056 ?auto_203055 ) ) ( not ( = ?auto_203052 ?auto_203056 ) ) ( not ( = ?auto_203052 ?auto_203059 ) ) ( not ( = ?auto_203053 ?auto_203056 ) ) ( not ( = ?auto_203053 ?auto_203059 ) ) ( not ( = ?auto_203054 ?auto_203056 ) ) ( not ( = ?auto_203054 ?auto_203059 ) ) ( not ( = ?auto_203057 ?auto_203056 ) ) ( not ( = ?auto_203057 ?auto_203059 ) ) ( not ( = ?auto_203058 ?auto_203056 ) ) ( not ( = ?auto_203058 ?auto_203059 ) ) ( ON ?auto_203055 ?auto_203058 ) ( ON ?auto_203056 ?auto_203055 ) ( CLEAR ?auto_203056 ) ( ON ?auto_203059 ?auto_203060 ) ( CLEAR ?auto_203059 ) ( HAND-EMPTY ) ( not ( = ?auto_203052 ?auto_203060 ) ) ( not ( = ?auto_203053 ?auto_203060 ) ) ( not ( = ?auto_203054 ?auto_203060 ) ) ( not ( = ?auto_203057 ?auto_203060 ) ) ( not ( = ?auto_203058 ?auto_203060 ) ) ( not ( = ?auto_203055 ?auto_203060 ) ) ( not ( = ?auto_203059 ?auto_203060 ) ) ( not ( = ?auto_203056 ?auto_203060 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_203059 ?auto_203060 )
      ( MAKE-3PILE ?auto_203052 ?auto_203053 ?auto_203054 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_203061 - BLOCK
      ?auto_203062 - BLOCK
      ?auto_203063 - BLOCK
    )
    :vars
    (
      ?auto_203067 - BLOCK
      ?auto_203066 - BLOCK
      ?auto_203069 - BLOCK
      ?auto_203068 - BLOCK
      ?auto_203064 - BLOCK
      ?auto_203065 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_203067 ?auto_203063 ) ( ON-TABLE ?auto_203061 ) ( ON ?auto_203062 ?auto_203061 ) ( ON ?auto_203063 ?auto_203062 ) ( not ( = ?auto_203061 ?auto_203062 ) ) ( not ( = ?auto_203061 ?auto_203063 ) ) ( not ( = ?auto_203061 ?auto_203067 ) ) ( not ( = ?auto_203062 ?auto_203063 ) ) ( not ( = ?auto_203062 ?auto_203067 ) ) ( not ( = ?auto_203063 ?auto_203067 ) ) ( not ( = ?auto_203061 ?auto_203066 ) ) ( not ( = ?auto_203061 ?auto_203069 ) ) ( not ( = ?auto_203062 ?auto_203066 ) ) ( not ( = ?auto_203062 ?auto_203069 ) ) ( not ( = ?auto_203063 ?auto_203066 ) ) ( not ( = ?auto_203063 ?auto_203069 ) ) ( not ( = ?auto_203067 ?auto_203066 ) ) ( not ( = ?auto_203067 ?auto_203069 ) ) ( not ( = ?auto_203066 ?auto_203069 ) ) ( ON ?auto_203066 ?auto_203067 ) ( not ( = ?auto_203068 ?auto_203064 ) ) ( not ( = ?auto_203068 ?auto_203069 ) ) ( not ( = ?auto_203064 ?auto_203069 ) ) ( not ( = ?auto_203061 ?auto_203064 ) ) ( not ( = ?auto_203061 ?auto_203068 ) ) ( not ( = ?auto_203062 ?auto_203064 ) ) ( not ( = ?auto_203062 ?auto_203068 ) ) ( not ( = ?auto_203063 ?auto_203064 ) ) ( not ( = ?auto_203063 ?auto_203068 ) ) ( not ( = ?auto_203067 ?auto_203064 ) ) ( not ( = ?auto_203067 ?auto_203068 ) ) ( not ( = ?auto_203066 ?auto_203064 ) ) ( not ( = ?auto_203066 ?auto_203068 ) ) ( ON ?auto_203069 ?auto_203066 ) ( ON ?auto_203068 ?auto_203065 ) ( CLEAR ?auto_203068 ) ( not ( = ?auto_203061 ?auto_203065 ) ) ( not ( = ?auto_203062 ?auto_203065 ) ) ( not ( = ?auto_203063 ?auto_203065 ) ) ( not ( = ?auto_203067 ?auto_203065 ) ) ( not ( = ?auto_203066 ?auto_203065 ) ) ( not ( = ?auto_203069 ?auto_203065 ) ) ( not ( = ?auto_203068 ?auto_203065 ) ) ( not ( = ?auto_203064 ?auto_203065 ) ) ( HOLDING ?auto_203064 ) ( CLEAR ?auto_203069 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_203061 ?auto_203062 ?auto_203063 ?auto_203067 ?auto_203066 ?auto_203069 ?auto_203064 )
      ( MAKE-3PILE ?auto_203061 ?auto_203062 ?auto_203063 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_203070 - BLOCK
      ?auto_203071 - BLOCK
      ?auto_203072 - BLOCK
    )
    :vars
    (
      ?auto_203076 - BLOCK
      ?auto_203074 - BLOCK
      ?auto_203077 - BLOCK
      ?auto_203075 - BLOCK
      ?auto_203078 - BLOCK
      ?auto_203073 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_203076 ?auto_203072 ) ( ON-TABLE ?auto_203070 ) ( ON ?auto_203071 ?auto_203070 ) ( ON ?auto_203072 ?auto_203071 ) ( not ( = ?auto_203070 ?auto_203071 ) ) ( not ( = ?auto_203070 ?auto_203072 ) ) ( not ( = ?auto_203070 ?auto_203076 ) ) ( not ( = ?auto_203071 ?auto_203072 ) ) ( not ( = ?auto_203071 ?auto_203076 ) ) ( not ( = ?auto_203072 ?auto_203076 ) ) ( not ( = ?auto_203070 ?auto_203074 ) ) ( not ( = ?auto_203070 ?auto_203077 ) ) ( not ( = ?auto_203071 ?auto_203074 ) ) ( not ( = ?auto_203071 ?auto_203077 ) ) ( not ( = ?auto_203072 ?auto_203074 ) ) ( not ( = ?auto_203072 ?auto_203077 ) ) ( not ( = ?auto_203076 ?auto_203074 ) ) ( not ( = ?auto_203076 ?auto_203077 ) ) ( not ( = ?auto_203074 ?auto_203077 ) ) ( ON ?auto_203074 ?auto_203076 ) ( not ( = ?auto_203075 ?auto_203078 ) ) ( not ( = ?auto_203075 ?auto_203077 ) ) ( not ( = ?auto_203078 ?auto_203077 ) ) ( not ( = ?auto_203070 ?auto_203078 ) ) ( not ( = ?auto_203070 ?auto_203075 ) ) ( not ( = ?auto_203071 ?auto_203078 ) ) ( not ( = ?auto_203071 ?auto_203075 ) ) ( not ( = ?auto_203072 ?auto_203078 ) ) ( not ( = ?auto_203072 ?auto_203075 ) ) ( not ( = ?auto_203076 ?auto_203078 ) ) ( not ( = ?auto_203076 ?auto_203075 ) ) ( not ( = ?auto_203074 ?auto_203078 ) ) ( not ( = ?auto_203074 ?auto_203075 ) ) ( ON ?auto_203077 ?auto_203074 ) ( ON ?auto_203075 ?auto_203073 ) ( not ( = ?auto_203070 ?auto_203073 ) ) ( not ( = ?auto_203071 ?auto_203073 ) ) ( not ( = ?auto_203072 ?auto_203073 ) ) ( not ( = ?auto_203076 ?auto_203073 ) ) ( not ( = ?auto_203074 ?auto_203073 ) ) ( not ( = ?auto_203077 ?auto_203073 ) ) ( not ( = ?auto_203075 ?auto_203073 ) ) ( not ( = ?auto_203078 ?auto_203073 ) ) ( CLEAR ?auto_203077 ) ( ON ?auto_203078 ?auto_203075 ) ( CLEAR ?auto_203078 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_203073 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_203073 ?auto_203075 )
      ( MAKE-3PILE ?auto_203070 ?auto_203071 ?auto_203072 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_203079 - BLOCK
      ?auto_203080 - BLOCK
      ?auto_203081 - BLOCK
    )
    :vars
    (
      ?auto_203087 - BLOCK
      ?auto_203083 - BLOCK
      ?auto_203082 - BLOCK
      ?auto_203086 - BLOCK
      ?auto_203085 - BLOCK
      ?auto_203084 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_203087 ?auto_203081 ) ( ON-TABLE ?auto_203079 ) ( ON ?auto_203080 ?auto_203079 ) ( ON ?auto_203081 ?auto_203080 ) ( not ( = ?auto_203079 ?auto_203080 ) ) ( not ( = ?auto_203079 ?auto_203081 ) ) ( not ( = ?auto_203079 ?auto_203087 ) ) ( not ( = ?auto_203080 ?auto_203081 ) ) ( not ( = ?auto_203080 ?auto_203087 ) ) ( not ( = ?auto_203081 ?auto_203087 ) ) ( not ( = ?auto_203079 ?auto_203083 ) ) ( not ( = ?auto_203079 ?auto_203082 ) ) ( not ( = ?auto_203080 ?auto_203083 ) ) ( not ( = ?auto_203080 ?auto_203082 ) ) ( not ( = ?auto_203081 ?auto_203083 ) ) ( not ( = ?auto_203081 ?auto_203082 ) ) ( not ( = ?auto_203087 ?auto_203083 ) ) ( not ( = ?auto_203087 ?auto_203082 ) ) ( not ( = ?auto_203083 ?auto_203082 ) ) ( ON ?auto_203083 ?auto_203087 ) ( not ( = ?auto_203086 ?auto_203085 ) ) ( not ( = ?auto_203086 ?auto_203082 ) ) ( not ( = ?auto_203085 ?auto_203082 ) ) ( not ( = ?auto_203079 ?auto_203085 ) ) ( not ( = ?auto_203079 ?auto_203086 ) ) ( not ( = ?auto_203080 ?auto_203085 ) ) ( not ( = ?auto_203080 ?auto_203086 ) ) ( not ( = ?auto_203081 ?auto_203085 ) ) ( not ( = ?auto_203081 ?auto_203086 ) ) ( not ( = ?auto_203087 ?auto_203085 ) ) ( not ( = ?auto_203087 ?auto_203086 ) ) ( not ( = ?auto_203083 ?auto_203085 ) ) ( not ( = ?auto_203083 ?auto_203086 ) ) ( ON ?auto_203086 ?auto_203084 ) ( not ( = ?auto_203079 ?auto_203084 ) ) ( not ( = ?auto_203080 ?auto_203084 ) ) ( not ( = ?auto_203081 ?auto_203084 ) ) ( not ( = ?auto_203087 ?auto_203084 ) ) ( not ( = ?auto_203083 ?auto_203084 ) ) ( not ( = ?auto_203082 ?auto_203084 ) ) ( not ( = ?auto_203086 ?auto_203084 ) ) ( not ( = ?auto_203085 ?auto_203084 ) ) ( ON ?auto_203085 ?auto_203086 ) ( CLEAR ?auto_203085 ) ( ON-TABLE ?auto_203084 ) ( HOLDING ?auto_203082 ) ( CLEAR ?auto_203083 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_203079 ?auto_203080 ?auto_203081 ?auto_203087 ?auto_203083 ?auto_203082 )
      ( MAKE-3PILE ?auto_203079 ?auto_203080 ?auto_203081 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_203088 - BLOCK
      ?auto_203089 - BLOCK
      ?auto_203090 - BLOCK
    )
    :vars
    (
      ?auto_203094 - BLOCK
      ?auto_203091 - BLOCK
      ?auto_203096 - BLOCK
      ?auto_203095 - BLOCK
      ?auto_203093 - BLOCK
      ?auto_203092 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_203094 ?auto_203090 ) ( ON-TABLE ?auto_203088 ) ( ON ?auto_203089 ?auto_203088 ) ( ON ?auto_203090 ?auto_203089 ) ( not ( = ?auto_203088 ?auto_203089 ) ) ( not ( = ?auto_203088 ?auto_203090 ) ) ( not ( = ?auto_203088 ?auto_203094 ) ) ( not ( = ?auto_203089 ?auto_203090 ) ) ( not ( = ?auto_203089 ?auto_203094 ) ) ( not ( = ?auto_203090 ?auto_203094 ) ) ( not ( = ?auto_203088 ?auto_203091 ) ) ( not ( = ?auto_203088 ?auto_203096 ) ) ( not ( = ?auto_203089 ?auto_203091 ) ) ( not ( = ?auto_203089 ?auto_203096 ) ) ( not ( = ?auto_203090 ?auto_203091 ) ) ( not ( = ?auto_203090 ?auto_203096 ) ) ( not ( = ?auto_203094 ?auto_203091 ) ) ( not ( = ?auto_203094 ?auto_203096 ) ) ( not ( = ?auto_203091 ?auto_203096 ) ) ( ON ?auto_203091 ?auto_203094 ) ( not ( = ?auto_203095 ?auto_203093 ) ) ( not ( = ?auto_203095 ?auto_203096 ) ) ( not ( = ?auto_203093 ?auto_203096 ) ) ( not ( = ?auto_203088 ?auto_203093 ) ) ( not ( = ?auto_203088 ?auto_203095 ) ) ( not ( = ?auto_203089 ?auto_203093 ) ) ( not ( = ?auto_203089 ?auto_203095 ) ) ( not ( = ?auto_203090 ?auto_203093 ) ) ( not ( = ?auto_203090 ?auto_203095 ) ) ( not ( = ?auto_203094 ?auto_203093 ) ) ( not ( = ?auto_203094 ?auto_203095 ) ) ( not ( = ?auto_203091 ?auto_203093 ) ) ( not ( = ?auto_203091 ?auto_203095 ) ) ( ON ?auto_203095 ?auto_203092 ) ( not ( = ?auto_203088 ?auto_203092 ) ) ( not ( = ?auto_203089 ?auto_203092 ) ) ( not ( = ?auto_203090 ?auto_203092 ) ) ( not ( = ?auto_203094 ?auto_203092 ) ) ( not ( = ?auto_203091 ?auto_203092 ) ) ( not ( = ?auto_203096 ?auto_203092 ) ) ( not ( = ?auto_203095 ?auto_203092 ) ) ( not ( = ?auto_203093 ?auto_203092 ) ) ( ON ?auto_203093 ?auto_203095 ) ( ON-TABLE ?auto_203092 ) ( CLEAR ?auto_203091 ) ( ON ?auto_203096 ?auto_203093 ) ( CLEAR ?auto_203096 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_203092 ?auto_203095 ?auto_203093 )
      ( MAKE-3PILE ?auto_203088 ?auto_203089 ?auto_203090 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_203097 - BLOCK
      ?auto_203098 - BLOCK
      ?auto_203099 - BLOCK
    )
    :vars
    (
      ?auto_203103 - BLOCK
      ?auto_203105 - BLOCK
      ?auto_203104 - BLOCK
      ?auto_203101 - BLOCK
      ?auto_203102 - BLOCK
      ?auto_203100 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_203103 ?auto_203099 ) ( ON-TABLE ?auto_203097 ) ( ON ?auto_203098 ?auto_203097 ) ( ON ?auto_203099 ?auto_203098 ) ( not ( = ?auto_203097 ?auto_203098 ) ) ( not ( = ?auto_203097 ?auto_203099 ) ) ( not ( = ?auto_203097 ?auto_203103 ) ) ( not ( = ?auto_203098 ?auto_203099 ) ) ( not ( = ?auto_203098 ?auto_203103 ) ) ( not ( = ?auto_203099 ?auto_203103 ) ) ( not ( = ?auto_203097 ?auto_203105 ) ) ( not ( = ?auto_203097 ?auto_203104 ) ) ( not ( = ?auto_203098 ?auto_203105 ) ) ( not ( = ?auto_203098 ?auto_203104 ) ) ( not ( = ?auto_203099 ?auto_203105 ) ) ( not ( = ?auto_203099 ?auto_203104 ) ) ( not ( = ?auto_203103 ?auto_203105 ) ) ( not ( = ?auto_203103 ?auto_203104 ) ) ( not ( = ?auto_203105 ?auto_203104 ) ) ( not ( = ?auto_203101 ?auto_203102 ) ) ( not ( = ?auto_203101 ?auto_203104 ) ) ( not ( = ?auto_203102 ?auto_203104 ) ) ( not ( = ?auto_203097 ?auto_203102 ) ) ( not ( = ?auto_203097 ?auto_203101 ) ) ( not ( = ?auto_203098 ?auto_203102 ) ) ( not ( = ?auto_203098 ?auto_203101 ) ) ( not ( = ?auto_203099 ?auto_203102 ) ) ( not ( = ?auto_203099 ?auto_203101 ) ) ( not ( = ?auto_203103 ?auto_203102 ) ) ( not ( = ?auto_203103 ?auto_203101 ) ) ( not ( = ?auto_203105 ?auto_203102 ) ) ( not ( = ?auto_203105 ?auto_203101 ) ) ( ON ?auto_203101 ?auto_203100 ) ( not ( = ?auto_203097 ?auto_203100 ) ) ( not ( = ?auto_203098 ?auto_203100 ) ) ( not ( = ?auto_203099 ?auto_203100 ) ) ( not ( = ?auto_203103 ?auto_203100 ) ) ( not ( = ?auto_203105 ?auto_203100 ) ) ( not ( = ?auto_203104 ?auto_203100 ) ) ( not ( = ?auto_203101 ?auto_203100 ) ) ( not ( = ?auto_203102 ?auto_203100 ) ) ( ON ?auto_203102 ?auto_203101 ) ( ON-TABLE ?auto_203100 ) ( ON ?auto_203104 ?auto_203102 ) ( CLEAR ?auto_203104 ) ( HOLDING ?auto_203105 ) ( CLEAR ?auto_203103 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_203097 ?auto_203098 ?auto_203099 ?auto_203103 ?auto_203105 )
      ( MAKE-3PILE ?auto_203097 ?auto_203098 ?auto_203099 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_203106 - BLOCK
      ?auto_203107 - BLOCK
      ?auto_203108 - BLOCK
    )
    :vars
    (
      ?auto_203114 - BLOCK
      ?auto_203111 - BLOCK
      ?auto_203113 - BLOCK
      ?auto_203110 - BLOCK
      ?auto_203109 - BLOCK
      ?auto_203112 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_203114 ?auto_203108 ) ( ON-TABLE ?auto_203106 ) ( ON ?auto_203107 ?auto_203106 ) ( ON ?auto_203108 ?auto_203107 ) ( not ( = ?auto_203106 ?auto_203107 ) ) ( not ( = ?auto_203106 ?auto_203108 ) ) ( not ( = ?auto_203106 ?auto_203114 ) ) ( not ( = ?auto_203107 ?auto_203108 ) ) ( not ( = ?auto_203107 ?auto_203114 ) ) ( not ( = ?auto_203108 ?auto_203114 ) ) ( not ( = ?auto_203106 ?auto_203111 ) ) ( not ( = ?auto_203106 ?auto_203113 ) ) ( not ( = ?auto_203107 ?auto_203111 ) ) ( not ( = ?auto_203107 ?auto_203113 ) ) ( not ( = ?auto_203108 ?auto_203111 ) ) ( not ( = ?auto_203108 ?auto_203113 ) ) ( not ( = ?auto_203114 ?auto_203111 ) ) ( not ( = ?auto_203114 ?auto_203113 ) ) ( not ( = ?auto_203111 ?auto_203113 ) ) ( not ( = ?auto_203110 ?auto_203109 ) ) ( not ( = ?auto_203110 ?auto_203113 ) ) ( not ( = ?auto_203109 ?auto_203113 ) ) ( not ( = ?auto_203106 ?auto_203109 ) ) ( not ( = ?auto_203106 ?auto_203110 ) ) ( not ( = ?auto_203107 ?auto_203109 ) ) ( not ( = ?auto_203107 ?auto_203110 ) ) ( not ( = ?auto_203108 ?auto_203109 ) ) ( not ( = ?auto_203108 ?auto_203110 ) ) ( not ( = ?auto_203114 ?auto_203109 ) ) ( not ( = ?auto_203114 ?auto_203110 ) ) ( not ( = ?auto_203111 ?auto_203109 ) ) ( not ( = ?auto_203111 ?auto_203110 ) ) ( ON ?auto_203110 ?auto_203112 ) ( not ( = ?auto_203106 ?auto_203112 ) ) ( not ( = ?auto_203107 ?auto_203112 ) ) ( not ( = ?auto_203108 ?auto_203112 ) ) ( not ( = ?auto_203114 ?auto_203112 ) ) ( not ( = ?auto_203111 ?auto_203112 ) ) ( not ( = ?auto_203113 ?auto_203112 ) ) ( not ( = ?auto_203110 ?auto_203112 ) ) ( not ( = ?auto_203109 ?auto_203112 ) ) ( ON ?auto_203109 ?auto_203110 ) ( ON-TABLE ?auto_203112 ) ( ON ?auto_203113 ?auto_203109 ) ( CLEAR ?auto_203114 ) ( ON ?auto_203111 ?auto_203113 ) ( CLEAR ?auto_203111 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_203112 ?auto_203110 ?auto_203109 ?auto_203113 )
      ( MAKE-3PILE ?auto_203106 ?auto_203107 ?auto_203108 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_203133 - BLOCK
      ?auto_203134 - BLOCK
      ?auto_203135 - BLOCK
    )
    :vars
    (
      ?auto_203136 - BLOCK
      ?auto_203141 - BLOCK
      ?auto_203138 - BLOCK
      ?auto_203140 - BLOCK
      ?auto_203137 - BLOCK
      ?auto_203139 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_203133 ) ( ON ?auto_203134 ?auto_203133 ) ( not ( = ?auto_203133 ?auto_203134 ) ) ( not ( = ?auto_203133 ?auto_203135 ) ) ( not ( = ?auto_203133 ?auto_203136 ) ) ( not ( = ?auto_203134 ?auto_203135 ) ) ( not ( = ?auto_203134 ?auto_203136 ) ) ( not ( = ?auto_203135 ?auto_203136 ) ) ( not ( = ?auto_203133 ?auto_203141 ) ) ( not ( = ?auto_203133 ?auto_203138 ) ) ( not ( = ?auto_203134 ?auto_203141 ) ) ( not ( = ?auto_203134 ?auto_203138 ) ) ( not ( = ?auto_203135 ?auto_203141 ) ) ( not ( = ?auto_203135 ?auto_203138 ) ) ( not ( = ?auto_203136 ?auto_203141 ) ) ( not ( = ?auto_203136 ?auto_203138 ) ) ( not ( = ?auto_203141 ?auto_203138 ) ) ( not ( = ?auto_203140 ?auto_203137 ) ) ( not ( = ?auto_203140 ?auto_203138 ) ) ( not ( = ?auto_203137 ?auto_203138 ) ) ( not ( = ?auto_203133 ?auto_203137 ) ) ( not ( = ?auto_203133 ?auto_203140 ) ) ( not ( = ?auto_203134 ?auto_203137 ) ) ( not ( = ?auto_203134 ?auto_203140 ) ) ( not ( = ?auto_203135 ?auto_203137 ) ) ( not ( = ?auto_203135 ?auto_203140 ) ) ( not ( = ?auto_203136 ?auto_203137 ) ) ( not ( = ?auto_203136 ?auto_203140 ) ) ( not ( = ?auto_203141 ?auto_203137 ) ) ( not ( = ?auto_203141 ?auto_203140 ) ) ( ON ?auto_203140 ?auto_203139 ) ( not ( = ?auto_203133 ?auto_203139 ) ) ( not ( = ?auto_203134 ?auto_203139 ) ) ( not ( = ?auto_203135 ?auto_203139 ) ) ( not ( = ?auto_203136 ?auto_203139 ) ) ( not ( = ?auto_203141 ?auto_203139 ) ) ( not ( = ?auto_203138 ?auto_203139 ) ) ( not ( = ?auto_203140 ?auto_203139 ) ) ( not ( = ?auto_203137 ?auto_203139 ) ) ( ON ?auto_203137 ?auto_203140 ) ( ON-TABLE ?auto_203139 ) ( ON ?auto_203138 ?auto_203137 ) ( ON ?auto_203141 ?auto_203138 ) ( ON ?auto_203136 ?auto_203141 ) ( CLEAR ?auto_203136 ) ( HOLDING ?auto_203135 ) ( CLEAR ?auto_203134 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_203133 ?auto_203134 ?auto_203135 ?auto_203136 )
      ( MAKE-3PILE ?auto_203133 ?auto_203134 ?auto_203135 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_203142 - BLOCK
      ?auto_203143 - BLOCK
      ?auto_203144 - BLOCK
    )
    :vars
    (
      ?auto_203148 - BLOCK
      ?auto_203146 - BLOCK
      ?auto_203150 - BLOCK
      ?auto_203149 - BLOCK
      ?auto_203145 - BLOCK
      ?auto_203147 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_203142 ) ( ON ?auto_203143 ?auto_203142 ) ( not ( = ?auto_203142 ?auto_203143 ) ) ( not ( = ?auto_203142 ?auto_203144 ) ) ( not ( = ?auto_203142 ?auto_203148 ) ) ( not ( = ?auto_203143 ?auto_203144 ) ) ( not ( = ?auto_203143 ?auto_203148 ) ) ( not ( = ?auto_203144 ?auto_203148 ) ) ( not ( = ?auto_203142 ?auto_203146 ) ) ( not ( = ?auto_203142 ?auto_203150 ) ) ( not ( = ?auto_203143 ?auto_203146 ) ) ( not ( = ?auto_203143 ?auto_203150 ) ) ( not ( = ?auto_203144 ?auto_203146 ) ) ( not ( = ?auto_203144 ?auto_203150 ) ) ( not ( = ?auto_203148 ?auto_203146 ) ) ( not ( = ?auto_203148 ?auto_203150 ) ) ( not ( = ?auto_203146 ?auto_203150 ) ) ( not ( = ?auto_203149 ?auto_203145 ) ) ( not ( = ?auto_203149 ?auto_203150 ) ) ( not ( = ?auto_203145 ?auto_203150 ) ) ( not ( = ?auto_203142 ?auto_203145 ) ) ( not ( = ?auto_203142 ?auto_203149 ) ) ( not ( = ?auto_203143 ?auto_203145 ) ) ( not ( = ?auto_203143 ?auto_203149 ) ) ( not ( = ?auto_203144 ?auto_203145 ) ) ( not ( = ?auto_203144 ?auto_203149 ) ) ( not ( = ?auto_203148 ?auto_203145 ) ) ( not ( = ?auto_203148 ?auto_203149 ) ) ( not ( = ?auto_203146 ?auto_203145 ) ) ( not ( = ?auto_203146 ?auto_203149 ) ) ( ON ?auto_203149 ?auto_203147 ) ( not ( = ?auto_203142 ?auto_203147 ) ) ( not ( = ?auto_203143 ?auto_203147 ) ) ( not ( = ?auto_203144 ?auto_203147 ) ) ( not ( = ?auto_203148 ?auto_203147 ) ) ( not ( = ?auto_203146 ?auto_203147 ) ) ( not ( = ?auto_203150 ?auto_203147 ) ) ( not ( = ?auto_203149 ?auto_203147 ) ) ( not ( = ?auto_203145 ?auto_203147 ) ) ( ON ?auto_203145 ?auto_203149 ) ( ON-TABLE ?auto_203147 ) ( ON ?auto_203150 ?auto_203145 ) ( ON ?auto_203146 ?auto_203150 ) ( ON ?auto_203148 ?auto_203146 ) ( CLEAR ?auto_203143 ) ( ON ?auto_203144 ?auto_203148 ) ( CLEAR ?auto_203144 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_203147 ?auto_203149 ?auto_203145 ?auto_203150 ?auto_203146 ?auto_203148 )
      ( MAKE-3PILE ?auto_203142 ?auto_203143 ?auto_203144 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_203151 - BLOCK
      ?auto_203152 - BLOCK
      ?auto_203153 - BLOCK
    )
    :vars
    (
      ?auto_203155 - BLOCK
      ?auto_203159 - BLOCK
      ?auto_203157 - BLOCK
      ?auto_203158 - BLOCK
      ?auto_203154 - BLOCK
      ?auto_203156 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_203151 ) ( not ( = ?auto_203151 ?auto_203152 ) ) ( not ( = ?auto_203151 ?auto_203153 ) ) ( not ( = ?auto_203151 ?auto_203155 ) ) ( not ( = ?auto_203152 ?auto_203153 ) ) ( not ( = ?auto_203152 ?auto_203155 ) ) ( not ( = ?auto_203153 ?auto_203155 ) ) ( not ( = ?auto_203151 ?auto_203159 ) ) ( not ( = ?auto_203151 ?auto_203157 ) ) ( not ( = ?auto_203152 ?auto_203159 ) ) ( not ( = ?auto_203152 ?auto_203157 ) ) ( not ( = ?auto_203153 ?auto_203159 ) ) ( not ( = ?auto_203153 ?auto_203157 ) ) ( not ( = ?auto_203155 ?auto_203159 ) ) ( not ( = ?auto_203155 ?auto_203157 ) ) ( not ( = ?auto_203159 ?auto_203157 ) ) ( not ( = ?auto_203158 ?auto_203154 ) ) ( not ( = ?auto_203158 ?auto_203157 ) ) ( not ( = ?auto_203154 ?auto_203157 ) ) ( not ( = ?auto_203151 ?auto_203154 ) ) ( not ( = ?auto_203151 ?auto_203158 ) ) ( not ( = ?auto_203152 ?auto_203154 ) ) ( not ( = ?auto_203152 ?auto_203158 ) ) ( not ( = ?auto_203153 ?auto_203154 ) ) ( not ( = ?auto_203153 ?auto_203158 ) ) ( not ( = ?auto_203155 ?auto_203154 ) ) ( not ( = ?auto_203155 ?auto_203158 ) ) ( not ( = ?auto_203159 ?auto_203154 ) ) ( not ( = ?auto_203159 ?auto_203158 ) ) ( ON ?auto_203158 ?auto_203156 ) ( not ( = ?auto_203151 ?auto_203156 ) ) ( not ( = ?auto_203152 ?auto_203156 ) ) ( not ( = ?auto_203153 ?auto_203156 ) ) ( not ( = ?auto_203155 ?auto_203156 ) ) ( not ( = ?auto_203159 ?auto_203156 ) ) ( not ( = ?auto_203157 ?auto_203156 ) ) ( not ( = ?auto_203158 ?auto_203156 ) ) ( not ( = ?auto_203154 ?auto_203156 ) ) ( ON ?auto_203154 ?auto_203158 ) ( ON-TABLE ?auto_203156 ) ( ON ?auto_203157 ?auto_203154 ) ( ON ?auto_203159 ?auto_203157 ) ( ON ?auto_203155 ?auto_203159 ) ( ON ?auto_203153 ?auto_203155 ) ( CLEAR ?auto_203153 ) ( HOLDING ?auto_203152 ) ( CLEAR ?auto_203151 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_203151 ?auto_203152 )
      ( MAKE-3PILE ?auto_203151 ?auto_203152 ?auto_203153 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_203160 - BLOCK
      ?auto_203161 - BLOCK
      ?auto_203162 - BLOCK
    )
    :vars
    (
      ?auto_203167 - BLOCK
      ?auto_203165 - BLOCK
      ?auto_203168 - BLOCK
      ?auto_203164 - BLOCK
      ?auto_203163 - BLOCK
      ?auto_203166 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_203160 ) ( not ( = ?auto_203160 ?auto_203161 ) ) ( not ( = ?auto_203160 ?auto_203162 ) ) ( not ( = ?auto_203160 ?auto_203167 ) ) ( not ( = ?auto_203161 ?auto_203162 ) ) ( not ( = ?auto_203161 ?auto_203167 ) ) ( not ( = ?auto_203162 ?auto_203167 ) ) ( not ( = ?auto_203160 ?auto_203165 ) ) ( not ( = ?auto_203160 ?auto_203168 ) ) ( not ( = ?auto_203161 ?auto_203165 ) ) ( not ( = ?auto_203161 ?auto_203168 ) ) ( not ( = ?auto_203162 ?auto_203165 ) ) ( not ( = ?auto_203162 ?auto_203168 ) ) ( not ( = ?auto_203167 ?auto_203165 ) ) ( not ( = ?auto_203167 ?auto_203168 ) ) ( not ( = ?auto_203165 ?auto_203168 ) ) ( not ( = ?auto_203164 ?auto_203163 ) ) ( not ( = ?auto_203164 ?auto_203168 ) ) ( not ( = ?auto_203163 ?auto_203168 ) ) ( not ( = ?auto_203160 ?auto_203163 ) ) ( not ( = ?auto_203160 ?auto_203164 ) ) ( not ( = ?auto_203161 ?auto_203163 ) ) ( not ( = ?auto_203161 ?auto_203164 ) ) ( not ( = ?auto_203162 ?auto_203163 ) ) ( not ( = ?auto_203162 ?auto_203164 ) ) ( not ( = ?auto_203167 ?auto_203163 ) ) ( not ( = ?auto_203167 ?auto_203164 ) ) ( not ( = ?auto_203165 ?auto_203163 ) ) ( not ( = ?auto_203165 ?auto_203164 ) ) ( ON ?auto_203164 ?auto_203166 ) ( not ( = ?auto_203160 ?auto_203166 ) ) ( not ( = ?auto_203161 ?auto_203166 ) ) ( not ( = ?auto_203162 ?auto_203166 ) ) ( not ( = ?auto_203167 ?auto_203166 ) ) ( not ( = ?auto_203165 ?auto_203166 ) ) ( not ( = ?auto_203168 ?auto_203166 ) ) ( not ( = ?auto_203164 ?auto_203166 ) ) ( not ( = ?auto_203163 ?auto_203166 ) ) ( ON ?auto_203163 ?auto_203164 ) ( ON-TABLE ?auto_203166 ) ( ON ?auto_203168 ?auto_203163 ) ( ON ?auto_203165 ?auto_203168 ) ( ON ?auto_203167 ?auto_203165 ) ( ON ?auto_203162 ?auto_203167 ) ( CLEAR ?auto_203160 ) ( ON ?auto_203161 ?auto_203162 ) ( CLEAR ?auto_203161 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_203166 ?auto_203164 ?auto_203163 ?auto_203168 ?auto_203165 ?auto_203167 ?auto_203162 )
      ( MAKE-3PILE ?auto_203160 ?auto_203161 ?auto_203162 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_203169 - BLOCK
      ?auto_203170 - BLOCK
      ?auto_203171 - BLOCK
    )
    :vars
    (
      ?auto_203177 - BLOCK
      ?auto_203175 - BLOCK
      ?auto_203173 - BLOCK
      ?auto_203176 - BLOCK
      ?auto_203172 - BLOCK
      ?auto_203174 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_203169 ?auto_203170 ) ) ( not ( = ?auto_203169 ?auto_203171 ) ) ( not ( = ?auto_203169 ?auto_203177 ) ) ( not ( = ?auto_203170 ?auto_203171 ) ) ( not ( = ?auto_203170 ?auto_203177 ) ) ( not ( = ?auto_203171 ?auto_203177 ) ) ( not ( = ?auto_203169 ?auto_203175 ) ) ( not ( = ?auto_203169 ?auto_203173 ) ) ( not ( = ?auto_203170 ?auto_203175 ) ) ( not ( = ?auto_203170 ?auto_203173 ) ) ( not ( = ?auto_203171 ?auto_203175 ) ) ( not ( = ?auto_203171 ?auto_203173 ) ) ( not ( = ?auto_203177 ?auto_203175 ) ) ( not ( = ?auto_203177 ?auto_203173 ) ) ( not ( = ?auto_203175 ?auto_203173 ) ) ( not ( = ?auto_203176 ?auto_203172 ) ) ( not ( = ?auto_203176 ?auto_203173 ) ) ( not ( = ?auto_203172 ?auto_203173 ) ) ( not ( = ?auto_203169 ?auto_203172 ) ) ( not ( = ?auto_203169 ?auto_203176 ) ) ( not ( = ?auto_203170 ?auto_203172 ) ) ( not ( = ?auto_203170 ?auto_203176 ) ) ( not ( = ?auto_203171 ?auto_203172 ) ) ( not ( = ?auto_203171 ?auto_203176 ) ) ( not ( = ?auto_203177 ?auto_203172 ) ) ( not ( = ?auto_203177 ?auto_203176 ) ) ( not ( = ?auto_203175 ?auto_203172 ) ) ( not ( = ?auto_203175 ?auto_203176 ) ) ( ON ?auto_203176 ?auto_203174 ) ( not ( = ?auto_203169 ?auto_203174 ) ) ( not ( = ?auto_203170 ?auto_203174 ) ) ( not ( = ?auto_203171 ?auto_203174 ) ) ( not ( = ?auto_203177 ?auto_203174 ) ) ( not ( = ?auto_203175 ?auto_203174 ) ) ( not ( = ?auto_203173 ?auto_203174 ) ) ( not ( = ?auto_203176 ?auto_203174 ) ) ( not ( = ?auto_203172 ?auto_203174 ) ) ( ON ?auto_203172 ?auto_203176 ) ( ON-TABLE ?auto_203174 ) ( ON ?auto_203173 ?auto_203172 ) ( ON ?auto_203175 ?auto_203173 ) ( ON ?auto_203177 ?auto_203175 ) ( ON ?auto_203171 ?auto_203177 ) ( ON ?auto_203170 ?auto_203171 ) ( CLEAR ?auto_203170 ) ( HOLDING ?auto_203169 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_203169 )
      ( MAKE-3PILE ?auto_203169 ?auto_203170 ?auto_203171 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_203178 - BLOCK
      ?auto_203179 - BLOCK
      ?auto_203180 - BLOCK
    )
    :vars
    (
      ?auto_203182 - BLOCK
      ?auto_203186 - BLOCK
      ?auto_203185 - BLOCK
      ?auto_203184 - BLOCK
      ?auto_203183 - BLOCK
      ?auto_203181 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_203178 ?auto_203179 ) ) ( not ( = ?auto_203178 ?auto_203180 ) ) ( not ( = ?auto_203178 ?auto_203182 ) ) ( not ( = ?auto_203179 ?auto_203180 ) ) ( not ( = ?auto_203179 ?auto_203182 ) ) ( not ( = ?auto_203180 ?auto_203182 ) ) ( not ( = ?auto_203178 ?auto_203186 ) ) ( not ( = ?auto_203178 ?auto_203185 ) ) ( not ( = ?auto_203179 ?auto_203186 ) ) ( not ( = ?auto_203179 ?auto_203185 ) ) ( not ( = ?auto_203180 ?auto_203186 ) ) ( not ( = ?auto_203180 ?auto_203185 ) ) ( not ( = ?auto_203182 ?auto_203186 ) ) ( not ( = ?auto_203182 ?auto_203185 ) ) ( not ( = ?auto_203186 ?auto_203185 ) ) ( not ( = ?auto_203184 ?auto_203183 ) ) ( not ( = ?auto_203184 ?auto_203185 ) ) ( not ( = ?auto_203183 ?auto_203185 ) ) ( not ( = ?auto_203178 ?auto_203183 ) ) ( not ( = ?auto_203178 ?auto_203184 ) ) ( not ( = ?auto_203179 ?auto_203183 ) ) ( not ( = ?auto_203179 ?auto_203184 ) ) ( not ( = ?auto_203180 ?auto_203183 ) ) ( not ( = ?auto_203180 ?auto_203184 ) ) ( not ( = ?auto_203182 ?auto_203183 ) ) ( not ( = ?auto_203182 ?auto_203184 ) ) ( not ( = ?auto_203186 ?auto_203183 ) ) ( not ( = ?auto_203186 ?auto_203184 ) ) ( ON ?auto_203184 ?auto_203181 ) ( not ( = ?auto_203178 ?auto_203181 ) ) ( not ( = ?auto_203179 ?auto_203181 ) ) ( not ( = ?auto_203180 ?auto_203181 ) ) ( not ( = ?auto_203182 ?auto_203181 ) ) ( not ( = ?auto_203186 ?auto_203181 ) ) ( not ( = ?auto_203185 ?auto_203181 ) ) ( not ( = ?auto_203184 ?auto_203181 ) ) ( not ( = ?auto_203183 ?auto_203181 ) ) ( ON ?auto_203183 ?auto_203184 ) ( ON-TABLE ?auto_203181 ) ( ON ?auto_203185 ?auto_203183 ) ( ON ?auto_203186 ?auto_203185 ) ( ON ?auto_203182 ?auto_203186 ) ( ON ?auto_203180 ?auto_203182 ) ( ON ?auto_203179 ?auto_203180 ) ( ON ?auto_203178 ?auto_203179 ) ( CLEAR ?auto_203178 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_203181 ?auto_203184 ?auto_203183 ?auto_203185 ?auto_203186 ?auto_203182 ?auto_203180 ?auto_203179 )
      ( MAKE-3PILE ?auto_203178 ?auto_203179 ?auto_203180 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_203192 - BLOCK
      ?auto_203193 - BLOCK
      ?auto_203194 - BLOCK
      ?auto_203195 - BLOCK
      ?auto_203196 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_203196 ) ( CLEAR ?auto_203195 ) ( ON-TABLE ?auto_203192 ) ( ON ?auto_203193 ?auto_203192 ) ( ON ?auto_203194 ?auto_203193 ) ( ON ?auto_203195 ?auto_203194 ) ( not ( = ?auto_203192 ?auto_203193 ) ) ( not ( = ?auto_203192 ?auto_203194 ) ) ( not ( = ?auto_203192 ?auto_203195 ) ) ( not ( = ?auto_203192 ?auto_203196 ) ) ( not ( = ?auto_203193 ?auto_203194 ) ) ( not ( = ?auto_203193 ?auto_203195 ) ) ( not ( = ?auto_203193 ?auto_203196 ) ) ( not ( = ?auto_203194 ?auto_203195 ) ) ( not ( = ?auto_203194 ?auto_203196 ) ) ( not ( = ?auto_203195 ?auto_203196 ) ) )
    :subtasks
    ( ( !STACK ?auto_203196 ?auto_203195 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_203197 - BLOCK
      ?auto_203198 - BLOCK
      ?auto_203199 - BLOCK
      ?auto_203200 - BLOCK
      ?auto_203201 - BLOCK
    )
    :vars
    (
      ?auto_203202 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_203200 ) ( ON-TABLE ?auto_203197 ) ( ON ?auto_203198 ?auto_203197 ) ( ON ?auto_203199 ?auto_203198 ) ( ON ?auto_203200 ?auto_203199 ) ( not ( = ?auto_203197 ?auto_203198 ) ) ( not ( = ?auto_203197 ?auto_203199 ) ) ( not ( = ?auto_203197 ?auto_203200 ) ) ( not ( = ?auto_203197 ?auto_203201 ) ) ( not ( = ?auto_203198 ?auto_203199 ) ) ( not ( = ?auto_203198 ?auto_203200 ) ) ( not ( = ?auto_203198 ?auto_203201 ) ) ( not ( = ?auto_203199 ?auto_203200 ) ) ( not ( = ?auto_203199 ?auto_203201 ) ) ( not ( = ?auto_203200 ?auto_203201 ) ) ( ON ?auto_203201 ?auto_203202 ) ( CLEAR ?auto_203201 ) ( HAND-EMPTY ) ( not ( = ?auto_203197 ?auto_203202 ) ) ( not ( = ?auto_203198 ?auto_203202 ) ) ( not ( = ?auto_203199 ?auto_203202 ) ) ( not ( = ?auto_203200 ?auto_203202 ) ) ( not ( = ?auto_203201 ?auto_203202 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_203201 ?auto_203202 )
      ( MAKE-5PILE ?auto_203197 ?auto_203198 ?auto_203199 ?auto_203200 ?auto_203201 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_203203 - BLOCK
      ?auto_203204 - BLOCK
      ?auto_203205 - BLOCK
      ?auto_203206 - BLOCK
      ?auto_203207 - BLOCK
    )
    :vars
    (
      ?auto_203208 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_203203 ) ( ON ?auto_203204 ?auto_203203 ) ( ON ?auto_203205 ?auto_203204 ) ( not ( = ?auto_203203 ?auto_203204 ) ) ( not ( = ?auto_203203 ?auto_203205 ) ) ( not ( = ?auto_203203 ?auto_203206 ) ) ( not ( = ?auto_203203 ?auto_203207 ) ) ( not ( = ?auto_203204 ?auto_203205 ) ) ( not ( = ?auto_203204 ?auto_203206 ) ) ( not ( = ?auto_203204 ?auto_203207 ) ) ( not ( = ?auto_203205 ?auto_203206 ) ) ( not ( = ?auto_203205 ?auto_203207 ) ) ( not ( = ?auto_203206 ?auto_203207 ) ) ( ON ?auto_203207 ?auto_203208 ) ( CLEAR ?auto_203207 ) ( not ( = ?auto_203203 ?auto_203208 ) ) ( not ( = ?auto_203204 ?auto_203208 ) ) ( not ( = ?auto_203205 ?auto_203208 ) ) ( not ( = ?auto_203206 ?auto_203208 ) ) ( not ( = ?auto_203207 ?auto_203208 ) ) ( HOLDING ?auto_203206 ) ( CLEAR ?auto_203205 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_203203 ?auto_203204 ?auto_203205 ?auto_203206 )
      ( MAKE-5PILE ?auto_203203 ?auto_203204 ?auto_203205 ?auto_203206 ?auto_203207 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_203209 - BLOCK
      ?auto_203210 - BLOCK
      ?auto_203211 - BLOCK
      ?auto_203212 - BLOCK
      ?auto_203213 - BLOCK
    )
    :vars
    (
      ?auto_203214 - BLOCK
      ?auto_203215 - BLOCK
      ?auto_203216 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_203209 ) ( ON ?auto_203210 ?auto_203209 ) ( ON ?auto_203211 ?auto_203210 ) ( not ( = ?auto_203209 ?auto_203210 ) ) ( not ( = ?auto_203209 ?auto_203211 ) ) ( not ( = ?auto_203209 ?auto_203212 ) ) ( not ( = ?auto_203209 ?auto_203213 ) ) ( not ( = ?auto_203210 ?auto_203211 ) ) ( not ( = ?auto_203210 ?auto_203212 ) ) ( not ( = ?auto_203210 ?auto_203213 ) ) ( not ( = ?auto_203211 ?auto_203212 ) ) ( not ( = ?auto_203211 ?auto_203213 ) ) ( not ( = ?auto_203212 ?auto_203213 ) ) ( ON ?auto_203213 ?auto_203214 ) ( not ( = ?auto_203209 ?auto_203214 ) ) ( not ( = ?auto_203210 ?auto_203214 ) ) ( not ( = ?auto_203211 ?auto_203214 ) ) ( not ( = ?auto_203212 ?auto_203214 ) ) ( not ( = ?auto_203213 ?auto_203214 ) ) ( CLEAR ?auto_203211 ) ( ON ?auto_203212 ?auto_203213 ) ( CLEAR ?auto_203212 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_203215 ) ( ON ?auto_203216 ?auto_203215 ) ( ON ?auto_203214 ?auto_203216 ) ( not ( = ?auto_203215 ?auto_203216 ) ) ( not ( = ?auto_203215 ?auto_203214 ) ) ( not ( = ?auto_203215 ?auto_203213 ) ) ( not ( = ?auto_203215 ?auto_203212 ) ) ( not ( = ?auto_203216 ?auto_203214 ) ) ( not ( = ?auto_203216 ?auto_203213 ) ) ( not ( = ?auto_203216 ?auto_203212 ) ) ( not ( = ?auto_203209 ?auto_203215 ) ) ( not ( = ?auto_203209 ?auto_203216 ) ) ( not ( = ?auto_203210 ?auto_203215 ) ) ( not ( = ?auto_203210 ?auto_203216 ) ) ( not ( = ?auto_203211 ?auto_203215 ) ) ( not ( = ?auto_203211 ?auto_203216 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_203215 ?auto_203216 ?auto_203214 ?auto_203213 )
      ( MAKE-5PILE ?auto_203209 ?auto_203210 ?auto_203211 ?auto_203212 ?auto_203213 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_203217 - BLOCK
      ?auto_203218 - BLOCK
      ?auto_203219 - BLOCK
      ?auto_203220 - BLOCK
      ?auto_203221 - BLOCK
    )
    :vars
    (
      ?auto_203224 - BLOCK
      ?auto_203223 - BLOCK
      ?auto_203222 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_203217 ) ( ON ?auto_203218 ?auto_203217 ) ( not ( = ?auto_203217 ?auto_203218 ) ) ( not ( = ?auto_203217 ?auto_203219 ) ) ( not ( = ?auto_203217 ?auto_203220 ) ) ( not ( = ?auto_203217 ?auto_203221 ) ) ( not ( = ?auto_203218 ?auto_203219 ) ) ( not ( = ?auto_203218 ?auto_203220 ) ) ( not ( = ?auto_203218 ?auto_203221 ) ) ( not ( = ?auto_203219 ?auto_203220 ) ) ( not ( = ?auto_203219 ?auto_203221 ) ) ( not ( = ?auto_203220 ?auto_203221 ) ) ( ON ?auto_203221 ?auto_203224 ) ( not ( = ?auto_203217 ?auto_203224 ) ) ( not ( = ?auto_203218 ?auto_203224 ) ) ( not ( = ?auto_203219 ?auto_203224 ) ) ( not ( = ?auto_203220 ?auto_203224 ) ) ( not ( = ?auto_203221 ?auto_203224 ) ) ( ON ?auto_203220 ?auto_203221 ) ( CLEAR ?auto_203220 ) ( ON-TABLE ?auto_203223 ) ( ON ?auto_203222 ?auto_203223 ) ( ON ?auto_203224 ?auto_203222 ) ( not ( = ?auto_203223 ?auto_203222 ) ) ( not ( = ?auto_203223 ?auto_203224 ) ) ( not ( = ?auto_203223 ?auto_203221 ) ) ( not ( = ?auto_203223 ?auto_203220 ) ) ( not ( = ?auto_203222 ?auto_203224 ) ) ( not ( = ?auto_203222 ?auto_203221 ) ) ( not ( = ?auto_203222 ?auto_203220 ) ) ( not ( = ?auto_203217 ?auto_203223 ) ) ( not ( = ?auto_203217 ?auto_203222 ) ) ( not ( = ?auto_203218 ?auto_203223 ) ) ( not ( = ?auto_203218 ?auto_203222 ) ) ( not ( = ?auto_203219 ?auto_203223 ) ) ( not ( = ?auto_203219 ?auto_203222 ) ) ( HOLDING ?auto_203219 ) ( CLEAR ?auto_203218 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_203217 ?auto_203218 ?auto_203219 )
      ( MAKE-5PILE ?auto_203217 ?auto_203218 ?auto_203219 ?auto_203220 ?auto_203221 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_203225 - BLOCK
      ?auto_203226 - BLOCK
      ?auto_203227 - BLOCK
      ?auto_203228 - BLOCK
      ?auto_203229 - BLOCK
    )
    :vars
    (
      ?auto_203231 - BLOCK
      ?auto_203232 - BLOCK
      ?auto_203230 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_203225 ) ( ON ?auto_203226 ?auto_203225 ) ( not ( = ?auto_203225 ?auto_203226 ) ) ( not ( = ?auto_203225 ?auto_203227 ) ) ( not ( = ?auto_203225 ?auto_203228 ) ) ( not ( = ?auto_203225 ?auto_203229 ) ) ( not ( = ?auto_203226 ?auto_203227 ) ) ( not ( = ?auto_203226 ?auto_203228 ) ) ( not ( = ?auto_203226 ?auto_203229 ) ) ( not ( = ?auto_203227 ?auto_203228 ) ) ( not ( = ?auto_203227 ?auto_203229 ) ) ( not ( = ?auto_203228 ?auto_203229 ) ) ( ON ?auto_203229 ?auto_203231 ) ( not ( = ?auto_203225 ?auto_203231 ) ) ( not ( = ?auto_203226 ?auto_203231 ) ) ( not ( = ?auto_203227 ?auto_203231 ) ) ( not ( = ?auto_203228 ?auto_203231 ) ) ( not ( = ?auto_203229 ?auto_203231 ) ) ( ON ?auto_203228 ?auto_203229 ) ( ON-TABLE ?auto_203232 ) ( ON ?auto_203230 ?auto_203232 ) ( ON ?auto_203231 ?auto_203230 ) ( not ( = ?auto_203232 ?auto_203230 ) ) ( not ( = ?auto_203232 ?auto_203231 ) ) ( not ( = ?auto_203232 ?auto_203229 ) ) ( not ( = ?auto_203232 ?auto_203228 ) ) ( not ( = ?auto_203230 ?auto_203231 ) ) ( not ( = ?auto_203230 ?auto_203229 ) ) ( not ( = ?auto_203230 ?auto_203228 ) ) ( not ( = ?auto_203225 ?auto_203232 ) ) ( not ( = ?auto_203225 ?auto_203230 ) ) ( not ( = ?auto_203226 ?auto_203232 ) ) ( not ( = ?auto_203226 ?auto_203230 ) ) ( not ( = ?auto_203227 ?auto_203232 ) ) ( not ( = ?auto_203227 ?auto_203230 ) ) ( CLEAR ?auto_203226 ) ( ON ?auto_203227 ?auto_203228 ) ( CLEAR ?auto_203227 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_203232 ?auto_203230 ?auto_203231 ?auto_203229 ?auto_203228 )
      ( MAKE-5PILE ?auto_203225 ?auto_203226 ?auto_203227 ?auto_203228 ?auto_203229 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_203233 - BLOCK
      ?auto_203234 - BLOCK
      ?auto_203235 - BLOCK
      ?auto_203236 - BLOCK
      ?auto_203237 - BLOCK
    )
    :vars
    (
      ?auto_203240 - BLOCK
      ?auto_203238 - BLOCK
      ?auto_203239 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_203233 ) ( not ( = ?auto_203233 ?auto_203234 ) ) ( not ( = ?auto_203233 ?auto_203235 ) ) ( not ( = ?auto_203233 ?auto_203236 ) ) ( not ( = ?auto_203233 ?auto_203237 ) ) ( not ( = ?auto_203234 ?auto_203235 ) ) ( not ( = ?auto_203234 ?auto_203236 ) ) ( not ( = ?auto_203234 ?auto_203237 ) ) ( not ( = ?auto_203235 ?auto_203236 ) ) ( not ( = ?auto_203235 ?auto_203237 ) ) ( not ( = ?auto_203236 ?auto_203237 ) ) ( ON ?auto_203237 ?auto_203240 ) ( not ( = ?auto_203233 ?auto_203240 ) ) ( not ( = ?auto_203234 ?auto_203240 ) ) ( not ( = ?auto_203235 ?auto_203240 ) ) ( not ( = ?auto_203236 ?auto_203240 ) ) ( not ( = ?auto_203237 ?auto_203240 ) ) ( ON ?auto_203236 ?auto_203237 ) ( ON-TABLE ?auto_203238 ) ( ON ?auto_203239 ?auto_203238 ) ( ON ?auto_203240 ?auto_203239 ) ( not ( = ?auto_203238 ?auto_203239 ) ) ( not ( = ?auto_203238 ?auto_203240 ) ) ( not ( = ?auto_203238 ?auto_203237 ) ) ( not ( = ?auto_203238 ?auto_203236 ) ) ( not ( = ?auto_203239 ?auto_203240 ) ) ( not ( = ?auto_203239 ?auto_203237 ) ) ( not ( = ?auto_203239 ?auto_203236 ) ) ( not ( = ?auto_203233 ?auto_203238 ) ) ( not ( = ?auto_203233 ?auto_203239 ) ) ( not ( = ?auto_203234 ?auto_203238 ) ) ( not ( = ?auto_203234 ?auto_203239 ) ) ( not ( = ?auto_203235 ?auto_203238 ) ) ( not ( = ?auto_203235 ?auto_203239 ) ) ( ON ?auto_203235 ?auto_203236 ) ( CLEAR ?auto_203235 ) ( HOLDING ?auto_203234 ) ( CLEAR ?auto_203233 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_203233 ?auto_203234 )
      ( MAKE-5PILE ?auto_203233 ?auto_203234 ?auto_203235 ?auto_203236 ?auto_203237 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_203241 - BLOCK
      ?auto_203242 - BLOCK
      ?auto_203243 - BLOCK
      ?auto_203244 - BLOCK
      ?auto_203245 - BLOCK
    )
    :vars
    (
      ?auto_203246 - BLOCK
      ?auto_203248 - BLOCK
      ?auto_203247 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_203241 ) ( not ( = ?auto_203241 ?auto_203242 ) ) ( not ( = ?auto_203241 ?auto_203243 ) ) ( not ( = ?auto_203241 ?auto_203244 ) ) ( not ( = ?auto_203241 ?auto_203245 ) ) ( not ( = ?auto_203242 ?auto_203243 ) ) ( not ( = ?auto_203242 ?auto_203244 ) ) ( not ( = ?auto_203242 ?auto_203245 ) ) ( not ( = ?auto_203243 ?auto_203244 ) ) ( not ( = ?auto_203243 ?auto_203245 ) ) ( not ( = ?auto_203244 ?auto_203245 ) ) ( ON ?auto_203245 ?auto_203246 ) ( not ( = ?auto_203241 ?auto_203246 ) ) ( not ( = ?auto_203242 ?auto_203246 ) ) ( not ( = ?auto_203243 ?auto_203246 ) ) ( not ( = ?auto_203244 ?auto_203246 ) ) ( not ( = ?auto_203245 ?auto_203246 ) ) ( ON ?auto_203244 ?auto_203245 ) ( ON-TABLE ?auto_203248 ) ( ON ?auto_203247 ?auto_203248 ) ( ON ?auto_203246 ?auto_203247 ) ( not ( = ?auto_203248 ?auto_203247 ) ) ( not ( = ?auto_203248 ?auto_203246 ) ) ( not ( = ?auto_203248 ?auto_203245 ) ) ( not ( = ?auto_203248 ?auto_203244 ) ) ( not ( = ?auto_203247 ?auto_203246 ) ) ( not ( = ?auto_203247 ?auto_203245 ) ) ( not ( = ?auto_203247 ?auto_203244 ) ) ( not ( = ?auto_203241 ?auto_203248 ) ) ( not ( = ?auto_203241 ?auto_203247 ) ) ( not ( = ?auto_203242 ?auto_203248 ) ) ( not ( = ?auto_203242 ?auto_203247 ) ) ( not ( = ?auto_203243 ?auto_203248 ) ) ( not ( = ?auto_203243 ?auto_203247 ) ) ( ON ?auto_203243 ?auto_203244 ) ( CLEAR ?auto_203241 ) ( ON ?auto_203242 ?auto_203243 ) ( CLEAR ?auto_203242 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_203248 ?auto_203247 ?auto_203246 ?auto_203245 ?auto_203244 ?auto_203243 )
      ( MAKE-5PILE ?auto_203241 ?auto_203242 ?auto_203243 ?auto_203244 ?auto_203245 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_203249 - BLOCK
      ?auto_203250 - BLOCK
      ?auto_203251 - BLOCK
      ?auto_203252 - BLOCK
      ?auto_203253 - BLOCK
    )
    :vars
    (
      ?auto_203256 - BLOCK
      ?auto_203255 - BLOCK
      ?auto_203254 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_203249 ?auto_203250 ) ) ( not ( = ?auto_203249 ?auto_203251 ) ) ( not ( = ?auto_203249 ?auto_203252 ) ) ( not ( = ?auto_203249 ?auto_203253 ) ) ( not ( = ?auto_203250 ?auto_203251 ) ) ( not ( = ?auto_203250 ?auto_203252 ) ) ( not ( = ?auto_203250 ?auto_203253 ) ) ( not ( = ?auto_203251 ?auto_203252 ) ) ( not ( = ?auto_203251 ?auto_203253 ) ) ( not ( = ?auto_203252 ?auto_203253 ) ) ( ON ?auto_203253 ?auto_203256 ) ( not ( = ?auto_203249 ?auto_203256 ) ) ( not ( = ?auto_203250 ?auto_203256 ) ) ( not ( = ?auto_203251 ?auto_203256 ) ) ( not ( = ?auto_203252 ?auto_203256 ) ) ( not ( = ?auto_203253 ?auto_203256 ) ) ( ON ?auto_203252 ?auto_203253 ) ( ON-TABLE ?auto_203255 ) ( ON ?auto_203254 ?auto_203255 ) ( ON ?auto_203256 ?auto_203254 ) ( not ( = ?auto_203255 ?auto_203254 ) ) ( not ( = ?auto_203255 ?auto_203256 ) ) ( not ( = ?auto_203255 ?auto_203253 ) ) ( not ( = ?auto_203255 ?auto_203252 ) ) ( not ( = ?auto_203254 ?auto_203256 ) ) ( not ( = ?auto_203254 ?auto_203253 ) ) ( not ( = ?auto_203254 ?auto_203252 ) ) ( not ( = ?auto_203249 ?auto_203255 ) ) ( not ( = ?auto_203249 ?auto_203254 ) ) ( not ( = ?auto_203250 ?auto_203255 ) ) ( not ( = ?auto_203250 ?auto_203254 ) ) ( not ( = ?auto_203251 ?auto_203255 ) ) ( not ( = ?auto_203251 ?auto_203254 ) ) ( ON ?auto_203251 ?auto_203252 ) ( ON ?auto_203250 ?auto_203251 ) ( CLEAR ?auto_203250 ) ( HOLDING ?auto_203249 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_203249 )
      ( MAKE-5PILE ?auto_203249 ?auto_203250 ?auto_203251 ?auto_203252 ?auto_203253 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_203257 - BLOCK
      ?auto_203258 - BLOCK
      ?auto_203259 - BLOCK
      ?auto_203260 - BLOCK
      ?auto_203261 - BLOCK
    )
    :vars
    (
      ?auto_203262 - BLOCK
      ?auto_203264 - BLOCK
      ?auto_203263 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_203257 ?auto_203258 ) ) ( not ( = ?auto_203257 ?auto_203259 ) ) ( not ( = ?auto_203257 ?auto_203260 ) ) ( not ( = ?auto_203257 ?auto_203261 ) ) ( not ( = ?auto_203258 ?auto_203259 ) ) ( not ( = ?auto_203258 ?auto_203260 ) ) ( not ( = ?auto_203258 ?auto_203261 ) ) ( not ( = ?auto_203259 ?auto_203260 ) ) ( not ( = ?auto_203259 ?auto_203261 ) ) ( not ( = ?auto_203260 ?auto_203261 ) ) ( ON ?auto_203261 ?auto_203262 ) ( not ( = ?auto_203257 ?auto_203262 ) ) ( not ( = ?auto_203258 ?auto_203262 ) ) ( not ( = ?auto_203259 ?auto_203262 ) ) ( not ( = ?auto_203260 ?auto_203262 ) ) ( not ( = ?auto_203261 ?auto_203262 ) ) ( ON ?auto_203260 ?auto_203261 ) ( ON-TABLE ?auto_203264 ) ( ON ?auto_203263 ?auto_203264 ) ( ON ?auto_203262 ?auto_203263 ) ( not ( = ?auto_203264 ?auto_203263 ) ) ( not ( = ?auto_203264 ?auto_203262 ) ) ( not ( = ?auto_203264 ?auto_203261 ) ) ( not ( = ?auto_203264 ?auto_203260 ) ) ( not ( = ?auto_203263 ?auto_203262 ) ) ( not ( = ?auto_203263 ?auto_203261 ) ) ( not ( = ?auto_203263 ?auto_203260 ) ) ( not ( = ?auto_203257 ?auto_203264 ) ) ( not ( = ?auto_203257 ?auto_203263 ) ) ( not ( = ?auto_203258 ?auto_203264 ) ) ( not ( = ?auto_203258 ?auto_203263 ) ) ( not ( = ?auto_203259 ?auto_203264 ) ) ( not ( = ?auto_203259 ?auto_203263 ) ) ( ON ?auto_203259 ?auto_203260 ) ( ON ?auto_203258 ?auto_203259 ) ( ON ?auto_203257 ?auto_203258 ) ( CLEAR ?auto_203257 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_203264 ?auto_203263 ?auto_203262 ?auto_203261 ?auto_203260 ?auto_203259 ?auto_203258 )
      ( MAKE-5PILE ?auto_203257 ?auto_203258 ?auto_203259 ?auto_203260 ?auto_203261 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_203265 - BLOCK
      ?auto_203266 - BLOCK
      ?auto_203267 - BLOCK
      ?auto_203268 - BLOCK
      ?auto_203269 - BLOCK
    )
    :vars
    (
      ?auto_203270 - BLOCK
      ?auto_203272 - BLOCK
      ?auto_203271 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_203265 ?auto_203266 ) ) ( not ( = ?auto_203265 ?auto_203267 ) ) ( not ( = ?auto_203265 ?auto_203268 ) ) ( not ( = ?auto_203265 ?auto_203269 ) ) ( not ( = ?auto_203266 ?auto_203267 ) ) ( not ( = ?auto_203266 ?auto_203268 ) ) ( not ( = ?auto_203266 ?auto_203269 ) ) ( not ( = ?auto_203267 ?auto_203268 ) ) ( not ( = ?auto_203267 ?auto_203269 ) ) ( not ( = ?auto_203268 ?auto_203269 ) ) ( ON ?auto_203269 ?auto_203270 ) ( not ( = ?auto_203265 ?auto_203270 ) ) ( not ( = ?auto_203266 ?auto_203270 ) ) ( not ( = ?auto_203267 ?auto_203270 ) ) ( not ( = ?auto_203268 ?auto_203270 ) ) ( not ( = ?auto_203269 ?auto_203270 ) ) ( ON ?auto_203268 ?auto_203269 ) ( ON-TABLE ?auto_203272 ) ( ON ?auto_203271 ?auto_203272 ) ( ON ?auto_203270 ?auto_203271 ) ( not ( = ?auto_203272 ?auto_203271 ) ) ( not ( = ?auto_203272 ?auto_203270 ) ) ( not ( = ?auto_203272 ?auto_203269 ) ) ( not ( = ?auto_203272 ?auto_203268 ) ) ( not ( = ?auto_203271 ?auto_203270 ) ) ( not ( = ?auto_203271 ?auto_203269 ) ) ( not ( = ?auto_203271 ?auto_203268 ) ) ( not ( = ?auto_203265 ?auto_203272 ) ) ( not ( = ?auto_203265 ?auto_203271 ) ) ( not ( = ?auto_203266 ?auto_203272 ) ) ( not ( = ?auto_203266 ?auto_203271 ) ) ( not ( = ?auto_203267 ?auto_203272 ) ) ( not ( = ?auto_203267 ?auto_203271 ) ) ( ON ?auto_203267 ?auto_203268 ) ( ON ?auto_203266 ?auto_203267 ) ( HOLDING ?auto_203265 ) ( CLEAR ?auto_203266 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_203272 ?auto_203271 ?auto_203270 ?auto_203269 ?auto_203268 ?auto_203267 ?auto_203266 ?auto_203265 )
      ( MAKE-5PILE ?auto_203265 ?auto_203266 ?auto_203267 ?auto_203268 ?auto_203269 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_203273 - BLOCK
      ?auto_203274 - BLOCK
      ?auto_203275 - BLOCK
      ?auto_203276 - BLOCK
      ?auto_203277 - BLOCK
    )
    :vars
    (
      ?auto_203279 - BLOCK
      ?auto_203280 - BLOCK
      ?auto_203278 - BLOCK
      ?auto_203281 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_203273 ?auto_203274 ) ) ( not ( = ?auto_203273 ?auto_203275 ) ) ( not ( = ?auto_203273 ?auto_203276 ) ) ( not ( = ?auto_203273 ?auto_203277 ) ) ( not ( = ?auto_203274 ?auto_203275 ) ) ( not ( = ?auto_203274 ?auto_203276 ) ) ( not ( = ?auto_203274 ?auto_203277 ) ) ( not ( = ?auto_203275 ?auto_203276 ) ) ( not ( = ?auto_203275 ?auto_203277 ) ) ( not ( = ?auto_203276 ?auto_203277 ) ) ( ON ?auto_203277 ?auto_203279 ) ( not ( = ?auto_203273 ?auto_203279 ) ) ( not ( = ?auto_203274 ?auto_203279 ) ) ( not ( = ?auto_203275 ?auto_203279 ) ) ( not ( = ?auto_203276 ?auto_203279 ) ) ( not ( = ?auto_203277 ?auto_203279 ) ) ( ON ?auto_203276 ?auto_203277 ) ( ON-TABLE ?auto_203280 ) ( ON ?auto_203278 ?auto_203280 ) ( ON ?auto_203279 ?auto_203278 ) ( not ( = ?auto_203280 ?auto_203278 ) ) ( not ( = ?auto_203280 ?auto_203279 ) ) ( not ( = ?auto_203280 ?auto_203277 ) ) ( not ( = ?auto_203280 ?auto_203276 ) ) ( not ( = ?auto_203278 ?auto_203279 ) ) ( not ( = ?auto_203278 ?auto_203277 ) ) ( not ( = ?auto_203278 ?auto_203276 ) ) ( not ( = ?auto_203273 ?auto_203280 ) ) ( not ( = ?auto_203273 ?auto_203278 ) ) ( not ( = ?auto_203274 ?auto_203280 ) ) ( not ( = ?auto_203274 ?auto_203278 ) ) ( not ( = ?auto_203275 ?auto_203280 ) ) ( not ( = ?auto_203275 ?auto_203278 ) ) ( ON ?auto_203275 ?auto_203276 ) ( ON ?auto_203274 ?auto_203275 ) ( CLEAR ?auto_203274 ) ( ON ?auto_203273 ?auto_203281 ) ( CLEAR ?auto_203273 ) ( HAND-EMPTY ) ( not ( = ?auto_203273 ?auto_203281 ) ) ( not ( = ?auto_203274 ?auto_203281 ) ) ( not ( = ?auto_203275 ?auto_203281 ) ) ( not ( = ?auto_203276 ?auto_203281 ) ) ( not ( = ?auto_203277 ?auto_203281 ) ) ( not ( = ?auto_203279 ?auto_203281 ) ) ( not ( = ?auto_203280 ?auto_203281 ) ) ( not ( = ?auto_203278 ?auto_203281 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_203273 ?auto_203281 )
      ( MAKE-5PILE ?auto_203273 ?auto_203274 ?auto_203275 ?auto_203276 ?auto_203277 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_203282 - BLOCK
      ?auto_203283 - BLOCK
      ?auto_203284 - BLOCK
      ?auto_203285 - BLOCK
      ?auto_203286 - BLOCK
    )
    :vars
    (
      ?auto_203289 - BLOCK
      ?auto_203288 - BLOCK
      ?auto_203290 - BLOCK
      ?auto_203287 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_203282 ?auto_203283 ) ) ( not ( = ?auto_203282 ?auto_203284 ) ) ( not ( = ?auto_203282 ?auto_203285 ) ) ( not ( = ?auto_203282 ?auto_203286 ) ) ( not ( = ?auto_203283 ?auto_203284 ) ) ( not ( = ?auto_203283 ?auto_203285 ) ) ( not ( = ?auto_203283 ?auto_203286 ) ) ( not ( = ?auto_203284 ?auto_203285 ) ) ( not ( = ?auto_203284 ?auto_203286 ) ) ( not ( = ?auto_203285 ?auto_203286 ) ) ( ON ?auto_203286 ?auto_203289 ) ( not ( = ?auto_203282 ?auto_203289 ) ) ( not ( = ?auto_203283 ?auto_203289 ) ) ( not ( = ?auto_203284 ?auto_203289 ) ) ( not ( = ?auto_203285 ?auto_203289 ) ) ( not ( = ?auto_203286 ?auto_203289 ) ) ( ON ?auto_203285 ?auto_203286 ) ( ON-TABLE ?auto_203288 ) ( ON ?auto_203290 ?auto_203288 ) ( ON ?auto_203289 ?auto_203290 ) ( not ( = ?auto_203288 ?auto_203290 ) ) ( not ( = ?auto_203288 ?auto_203289 ) ) ( not ( = ?auto_203288 ?auto_203286 ) ) ( not ( = ?auto_203288 ?auto_203285 ) ) ( not ( = ?auto_203290 ?auto_203289 ) ) ( not ( = ?auto_203290 ?auto_203286 ) ) ( not ( = ?auto_203290 ?auto_203285 ) ) ( not ( = ?auto_203282 ?auto_203288 ) ) ( not ( = ?auto_203282 ?auto_203290 ) ) ( not ( = ?auto_203283 ?auto_203288 ) ) ( not ( = ?auto_203283 ?auto_203290 ) ) ( not ( = ?auto_203284 ?auto_203288 ) ) ( not ( = ?auto_203284 ?auto_203290 ) ) ( ON ?auto_203284 ?auto_203285 ) ( ON ?auto_203282 ?auto_203287 ) ( CLEAR ?auto_203282 ) ( not ( = ?auto_203282 ?auto_203287 ) ) ( not ( = ?auto_203283 ?auto_203287 ) ) ( not ( = ?auto_203284 ?auto_203287 ) ) ( not ( = ?auto_203285 ?auto_203287 ) ) ( not ( = ?auto_203286 ?auto_203287 ) ) ( not ( = ?auto_203289 ?auto_203287 ) ) ( not ( = ?auto_203288 ?auto_203287 ) ) ( not ( = ?auto_203290 ?auto_203287 ) ) ( HOLDING ?auto_203283 ) ( CLEAR ?auto_203284 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_203288 ?auto_203290 ?auto_203289 ?auto_203286 ?auto_203285 ?auto_203284 ?auto_203283 )
      ( MAKE-5PILE ?auto_203282 ?auto_203283 ?auto_203284 ?auto_203285 ?auto_203286 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_203291 - BLOCK
      ?auto_203292 - BLOCK
      ?auto_203293 - BLOCK
      ?auto_203294 - BLOCK
      ?auto_203295 - BLOCK
    )
    :vars
    (
      ?auto_203299 - BLOCK
      ?auto_203296 - BLOCK
      ?auto_203297 - BLOCK
      ?auto_203298 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_203291 ?auto_203292 ) ) ( not ( = ?auto_203291 ?auto_203293 ) ) ( not ( = ?auto_203291 ?auto_203294 ) ) ( not ( = ?auto_203291 ?auto_203295 ) ) ( not ( = ?auto_203292 ?auto_203293 ) ) ( not ( = ?auto_203292 ?auto_203294 ) ) ( not ( = ?auto_203292 ?auto_203295 ) ) ( not ( = ?auto_203293 ?auto_203294 ) ) ( not ( = ?auto_203293 ?auto_203295 ) ) ( not ( = ?auto_203294 ?auto_203295 ) ) ( ON ?auto_203295 ?auto_203299 ) ( not ( = ?auto_203291 ?auto_203299 ) ) ( not ( = ?auto_203292 ?auto_203299 ) ) ( not ( = ?auto_203293 ?auto_203299 ) ) ( not ( = ?auto_203294 ?auto_203299 ) ) ( not ( = ?auto_203295 ?auto_203299 ) ) ( ON ?auto_203294 ?auto_203295 ) ( ON-TABLE ?auto_203296 ) ( ON ?auto_203297 ?auto_203296 ) ( ON ?auto_203299 ?auto_203297 ) ( not ( = ?auto_203296 ?auto_203297 ) ) ( not ( = ?auto_203296 ?auto_203299 ) ) ( not ( = ?auto_203296 ?auto_203295 ) ) ( not ( = ?auto_203296 ?auto_203294 ) ) ( not ( = ?auto_203297 ?auto_203299 ) ) ( not ( = ?auto_203297 ?auto_203295 ) ) ( not ( = ?auto_203297 ?auto_203294 ) ) ( not ( = ?auto_203291 ?auto_203296 ) ) ( not ( = ?auto_203291 ?auto_203297 ) ) ( not ( = ?auto_203292 ?auto_203296 ) ) ( not ( = ?auto_203292 ?auto_203297 ) ) ( not ( = ?auto_203293 ?auto_203296 ) ) ( not ( = ?auto_203293 ?auto_203297 ) ) ( ON ?auto_203293 ?auto_203294 ) ( ON ?auto_203291 ?auto_203298 ) ( not ( = ?auto_203291 ?auto_203298 ) ) ( not ( = ?auto_203292 ?auto_203298 ) ) ( not ( = ?auto_203293 ?auto_203298 ) ) ( not ( = ?auto_203294 ?auto_203298 ) ) ( not ( = ?auto_203295 ?auto_203298 ) ) ( not ( = ?auto_203299 ?auto_203298 ) ) ( not ( = ?auto_203296 ?auto_203298 ) ) ( not ( = ?auto_203297 ?auto_203298 ) ) ( CLEAR ?auto_203293 ) ( ON ?auto_203292 ?auto_203291 ) ( CLEAR ?auto_203292 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_203298 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_203298 ?auto_203291 )
      ( MAKE-5PILE ?auto_203291 ?auto_203292 ?auto_203293 ?auto_203294 ?auto_203295 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_203300 - BLOCK
      ?auto_203301 - BLOCK
      ?auto_203302 - BLOCK
      ?auto_203303 - BLOCK
      ?auto_203304 - BLOCK
    )
    :vars
    (
      ?auto_203306 - BLOCK
      ?auto_203307 - BLOCK
      ?auto_203305 - BLOCK
      ?auto_203308 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_203300 ?auto_203301 ) ) ( not ( = ?auto_203300 ?auto_203302 ) ) ( not ( = ?auto_203300 ?auto_203303 ) ) ( not ( = ?auto_203300 ?auto_203304 ) ) ( not ( = ?auto_203301 ?auto_203302 ) ) ( not ( = ?auto_203301 ?auto_203303 ) ) ( not ( = ?auto_203301 ?auto_203304 ) ) ( not ( = ?auto_203302 ?auto_203303 ) ) ( not ( = ?auto_203302 ?auto_203304 ) ) ( not ( = ?auto_203303 ?auto_203304 ) ) ( ON ?auto_203304 ?auto_203306 ) ( not ( = ?auto_203300 ?auto_203306 ) ) ( not ( = ?auto_203301 ?auto_203306 ) ) ( not ( = ?auto_203302 ?auto_203306 ) ) ( not ( = ?auto_203303 ?auto_203306 ) ) ( not ( = ?auto_203304 ?auto_203306 ) ) ( ON ?auto_203303 ?auto_203304 ) ( ON-TABLE ?auto_203307 ) ( ON ?auto_203305 ?auto_203307 ) ( ON ?auto_203306 ?auto_203305 ) ( not ( = ?auto_203307 ?auto_203305 ) ) ( not ( = ?auto_203307 ?auto_203306 ) ) ( not ( = ?auto_203307 ?auto_203304 ) ) ( not ( = ?auto_203307 ?auto_203303 ) ) ( not ( = ?auto_203305 ?auto_203306 ) ) ( not ( = ?auto_203305 ?auto_203304 ) ) ( not ( = ?auto_203305 ?auto_203303 ) ) ( not ( = ?auto_203300 ?auto_203307 ) ) ( not ( = ?auto_203300 ?auto_203305 ) ) ( not ( = ?auto_203301 ?auto_203307 ) ) ( not ( = ?auto_203301 ?auto_203305 ) ) ( not ( = ?auto_203302 ?auto_203307 ) ) ( not ( = ?auto_203302 ?auto_203305 ) ) ( ON ?auto_203300 ?auto_203308 ) ( not ( = ?auto_203300 ?auto_203308 ) ) ( not ( = ?auto_203301 ?auto_203308 ) ) ( not ( = ?auto_203302 ?auto_203308 ) ) ( not ( = ?auto_203303 ?auto_203308 ) ) ( not ( = ?auto_203304 ?auto_203308 ) ) ( not ( = ?auto_203306 ?auto_203308 ) ) ( not ( = ?auto_203307 ?auto_203308 ) ) ( not ( = ?auto_203305 ?auto_203308 ) ) ( ON ?auto_203301 ?auto_203300 ) ( CLEAR ?auto_203301 ) ( ON-TABLE ?auto_203308 ) ( HOLDING ?auto_203302 ) ( CLEAR ?auto_203303 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_203307 ?auto_203305 ?auto_203306 ?auto_203304 ?auto_203303 ?auto_203302 )
      ( MAKE-5PILE ?auto_203300 ?auto_203301 ?auto_203302 ?auto_203303 ?auto_203304 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_203309 - BLOCK
      ?auto_203310 - BLOCK
      ?auto_203311 - BLOCK
      ?auto_203312 - BLOCK
      ?auto_203313 - BLOCK
    )
    :vars
    (
      ?auto_203315 - BLOCK
      ?auto_203317 - BLOCK
      ?auto_203314 - BLOCK
      ?auto_203316 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_203309 ?auto_203310 ) ) ( not ( = ?auto_203309 ?auto_203311 ) ) ( not ( = ?auto_203309 ?auto_203312 ) ) ( not ( = ?auto_203309 ?auto_203313 ) ) ( not ( = ?auto_203310 ?auto_203311 ) ) ( not ( = ?auto_203310 ?auto_203312 ) ) ( not ( = ?auto_203310 ?auto_203313 ) ) ( not ( = ?auto_203311 ?auto_203312 ) ) ( not ( = ?auto_203311 ?auto_203313 ) ) ( not ( = ?auto_203312 ?auto_203313 ) ) ( ON ?auto_203313 ?auto_203315 ) ( not ( = ?auto_203309 ?auto_203315 ) ) ( not ( = ?auto_203310 ?auto_203315 ) ) ( not ( = ?auto_203311 ?auto_203315 ) ) ( not ( = ?auto_203312 ?auto_203315 ) ) ( not ( = ?auto_203313 ?auto_203315 ) ) ( ON ?auto_203312 ?auto_203313 ) ( ON-TABLE ?auto_203317 ) ( ON ?auto_203314 ?auto_203317 ) ( ON ?auto_203315 ?auto_203314 ) ( not ( = ?auto_203317 ?auto_203314 ) ) ( not ( = ?auto_203317 ?auto_203315 ) ) ( not ( = ?auto_203317 ?auto_203313 ) ) ( not ( = ?auto_203317 ?auto_203312 ) ) ( not ( = ?auto_203314 ?auto_203315 ) ) ( not ( = ?auto_203314 ?auto_203313 ) ) ( not ( = ?auto_203314 ?auto_203312 ) ) ( not ( = ?auto_203309 ?auto_203317 ) ) ( not ( = ?auto_203309 ?auto_203314 ) ) ( not ( = ?auto_203310 ?auto_203317 ) ) ( not ( = ?auto_203310 ?auto_203314 ) ) ( not ( = ?auto_203311 ?auto_203317 ) ) ( not ( = ?auto_203311 ?auto_203314 ) ) ( ON ?auto_203309 ?auto_203316 ) ( not ( = ?auto_203309 ?auto_203316 ) ) ( not ( = ?auto_203310 ?auto_203316 ) ) ( not ( = ?auto_203311 ?auto_203316 ) ) ( not ( = ?auto_203312 ?auto_203316 ) ) ( not ( = ?auto_203313 ?auto_203316 ) ) ( not ( = ?auto_203315 ?auto_203316 ) ) ( not ( = ?auto_203317 ?auto_203316 ) ) ( not ( = ?auto_203314 ?auto_203316 ) ) ( ON ?auto_203310 ?auto_203309 ) ( ON-TABLE ?auto_203316 ) ( CLEAR ?auto_203312 ) ( ON ?auto_203311 ?auto_203310 ) ( CLEAR ?auto_203311 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_203316 ?auto_203309 ?auto_203310 )
      ( MAKE-5PILE ?auto_203309 ?auto_203310 ?auto_203311 ?auto_203312 ?auto_203313 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_203318 - BLOCK
      ?auto_203319 - BLOCK
      ?auto_203320 - BLOCK
      ?auto_203321 - BLOCK
      ?auto_203322 - BLOCK
    )
    :vars
    (
      ?auto_203326 - BLOCK
      ?auto_203324 - BLOCK
      ?auto_203323 - BLOCK
      ?auto_203325 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_203318 ?auto_203319 ) ) ( not ( = ?auto_203318 ?auto_203320 ) ) ( not ( = ?auto_203318 ?auto_203321 ) ) ( not ( = ?auto_203318 ?auto_203322 ) ) ( not ( = ?auto_203319 ?auto_203320 ) ) ( not ( = ?auto_203319 ?auto_203321 ) ) ( not ( = ?auto_203319 ?auto_203322 ) ) ( not ( = ?auto_203320 ?auto_203321 ) ) ( not ( = ?auto_203320 ?auto_203322 ) ) ( not ( = ?auto_203321 ?auto_203322 ) ) ( ON ?auto_203322 ?auto_203326 ) ( not ( = ?auto_203318 ?auto_203326 ) ) ( not ( = ?auto_203319 ?auto_203326 ) ) ( not ( = ?auto_203320 ?auto_203326 ) ) ( not ( = ?auto_203321 ?auto_203326 ) ) ( not ( = ?auto_203322 ?auto_203326 ) ) ( ON-TABLE ?auto_203324 ) ( ON ?auto_203323 ?auto_203324 ) ( ON ?auto_203326 ?auto_203323 ) ( not ( = ?auto_203324 ?auto_203323 ) ) ( not ( = ?auto_203324 ?auto_203326 ) ) ( not ( = ?auto_203324 ?auto_203322 ) ) ( not ( = ?auto_203324 ?auto_203321 ) ) ( not ( = ?auto_203323 ?auto_203326 ) ) ( not ( = ?auto_203323 ?auto_203322 ) ) ( not ( = ?auto_203323 ?auto_203321 ) ) ( not ( = ?auto_203318 ?auto_203324 ) ) ( not ( = ?auto_203318 ?auto_203323 ) ) ( not ( = ?auto_203319 ?auto_203324 ) ) ( not ( = ?auto_203319 ?auto_203323 ) ) ( not ( = ?auto_203320 ?auto_203324 ) ) ( not ( = ?auto_203320 ?auto_203323 ) ) ( ON ?auto_203318 ?auto_203325 ) ( not ( = ?auto_203318 ?auto_203325 ) ) ( not ( = ?auto_203319 ?auto_203325 ) ) ( not ( = ?auto_203320 ?auto_203325 ) ) ( not ( = ?auto_203321 ?auto_203325 ) ) ( not ( = ?auto_203322 ?auto_203325 ) ) ( not ( = ?auto_203326 ?auto_203325 ) ) ( not ( = ?auto_203324 ?auto_203325 ) ) ( not ( = ?auto_203323 ?auto_203325 ) ) ( ON ?auto_203319 ?auto_203318 ) ( ON-TABLE ?auto_203325 ) ( ON ?auto_203320 ?auto_203319 ) ( CLEAR ?auto_203320 ) ( HOLDING ?auto_203321 ) ( CLEAR ?auto_203322 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_203324 ?auto_203323 ?auto_203326 ?auto_203322 ?auto_203321 )
      ( MAKE-5PILE ?auto_203318 ?auto_203319 ?auto_203320 ?auto_203321 ?auto_203322 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_203327 - BLOCK
      ?auto_203328 - BLOCK
      ?auto_203329 - BLOCK
      ?auto_203330 - BLOCK
      ?auto_203331 - BLOCK
    )
    :vars
    (
      ?auto_203334 - BLOCK
      ?auto_203335 - BLOCK
      ?auto_203333 - BLOCK
      ?auto_203332 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_203327 ?auto_203328 ) ) ( not ( = ?auto_203327 ?auto_203329 ) ) ( not ( = ?auto_203327 ?auto_203330 ) ) ( not ( = ?auto_203327 ?auto_203331 ) ) ( not ( = ?auto_203328 ?auto_203329 ) ) ( not ( = ?auto_203328 ?auto_203330 ) ) ( not ( = ?auto_203328 ?auto_203331 ) ) ( not ( = ?auto_203329 ?auto_203330 ) ) ( not ( = ?auto_203329 ?auto_203331 ) ) ( not ( = ?auto_203330 ?auto_203331 ) ) ( ON ?auto_203331 ?auto_203334 ) ( not ( = ?auto_203327 ?auto_203334 ) ) ( not ( = ?auto_203328 ?auto_203334 ) ) ( not ( = ?auto_203329 ?auto_203334 ) ) ( not ( = ?auto_203330 ?auto_203334 ) ) ( not ( = ?auto_203331 ?auto_203334 ) ) ( ON-TABLE ?auto_203335 ) ( ON ?auto_203333 ?auto_203335 ) ( ON ?auto_203334 ?auto_203333 ) ( not ( = ?auto_203335 ?auto_203333 ) ) ( not ( = ?auto_203335 ?auto_203334 ) ) ( not ( = ?auto_203335 ?auto_203331 ) ) ( not ( = ?auto_203335 ?auto_203330 ) ) ( not ( = ?auto_203333 ?auto_203334 ) ) ( not ( = ?auto_203333 ?auto_203331 ) ) ( not ( = ?auto_203333 ?auto_203330 ) ) ( not ( = ?auto_203327 ?auto_203335 ) ) ( not ( = ?auto_203327 ?auto_203333 ) ) ( not ( = ?auto_203328 ?auto_203335 ) ) ( not ( = ?auto_203328 ?auto_203333 ) ) ( not ( = ?auto_203329 ?auto_203335 ) ) ( not ( = ?auto_203329 ?auto_203333 ) ) ( ON ?auto_203327 ?auto_203332 ) ( not ( = ?auto_203327 ?auto_203332 ) ) ( not ( = ?auto_203328 ?auto_203332 ) ) ( not ( = ?auto_203329 ?auto_203332 ) ) ( not ( = ?auto_203330 ?auto_203332 ) ) ( not ( = ?auto_203331 ?auto_203332 ) ) ( not ( = ?auto_203334 ?auto_203332 ) ) ( not ( = ?auto_203335 ?auto_203332 ) ) ( not ( = ?auto_203333 ?auto_203332 ) ) ( ON ?auto_203328 ?auto_203327 ) ( ON-TABLE ?auto_203332 ) ( ON ?auto_203329 ?auto_203328 ) ( CLEAR ?auto_203331 ) ( ON ?auto_203330 ?auto_203329 ) ( CLEAR ?auto_203330 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_203332 ?auto_203327 ?auto_203328 ?auto_203329 )
      ( MAKE-5PILE ?auto_203327 ?auto_203328 ?auto_203329 ?auto_203330 ?auto_203331 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_203336 - BLOCK
      ?auto_203337 - BLOCK
      ?auto_203338 - BLOCK
      ?auto_203339 - BLOCK
      ?auto_203340 - BLOCK
    )
    :vars
    (
      ?auto_203341 - BLOCK
      ?auto_203342 - BLOCK
      ?auto_203343 - BLOCK
      ?auto_203344 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_203336 ?auto_203337 ) ) ( not ( = ?auto_203336 ?auto_203338 ) ) ( not ( = ?auto_203336 ?auto_203339 ) ) ( not ( = ?auto_203336 ?auto_203340 ) ) ( not ( = ?auto_203337 ?auto_203338 ) ) ( not ( = ?auto_203337 ?auto_203339 ) ) ( not ( = ?auto_203337 ?auto_203340 ) ) ( not ( = ?auto_203338 ?auto_203339 ) ) ( not ( = ?auto_203338 ?auto_203340 ) ) ( not ( = ?auto_203339 ?auto_203340 ) ) ( not ( = ?auto_203336 ?auto_203341 ) ) ( not ( = ?auto_203337 ?auto_203341 ) ) ( not ( = ?auto_203338 ?auto_203341 ) ) ( not ( = ?auto_203339 ?auto_203341 ) ) ( not ( = ?auto_203340 ?auto_203341 ) ) ( ON-TABLE ?auto_203342 ) ( ON ?auto_203343 ?auto_203342 ) ( ON ?auto_203341 ?auto_203343 ) ( not ( = ?auto_203342 ?auto_203343 ) ) ( not ( = ?auto_203342 ?auto_203341 ) ) ( not ( = ?auto_203342 ?auto_203340 ) ) ( not ( = ?auto_203342 ?auto_203339 ) ) ( not ( = ?auto_203343 ?auto_203341 ) ) ( not ( = ?auto_203343 ?auto_203340 ) ) ( not ( = ?auto_203343 ?auto_203339 ) ) ( not ( = ?auto_203336 ?auto_203342 ) ) ( not ( = ?auto_203336 ?auto_203343 ) ) ( not ( = ?auto_203337 ?auto_203342 ) ) ( not ( = ?auto_203337 ?auto_203343 ) ) ( not ( = ?auto_203338 ?auto_203342 ) ) ( not ( = ?auto_203338 ?auto_203343 ) ) ( ON ?auto_203336 ?auto_203344 ) ( not ( = ?auto_203336 ?auto_203344 ) ) ( not ( = ?auto_203337 ?auto_203344 ) ) ( not ( = ?auto_203338 ?auto_203344 ) ) ( not ( = ?auto_203339 ?auto_203344 ) ) ( not ( = ?auto_203340 ?auto_203344 ) ) ( not ( = ?auto_203341 ?auto_203344 ) ) ( not ( = ?auto_203342 ?auto_203344 ) ) ( not ( = ?auto_203343 ?auto_203344 ) ) ( ON ?auto_203337 ?auto_203336 ) ( ON-TABLE ?auto_203344 ) ( ON ?auto_203338 ?auto_203337 ) ( ON ?auto_203339 ?auto_203338 ) ( CLEAR ?auto_203339 ) ( HOLDING ?auto_203340 ) ( CLEAR ?auto_203341 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_203342 ?auto_203343 ?auto_203341 ?auto_203340 )
      ( MAKE-5PILE ?auto_203336 ?auto_203337 ?auto_203338 ?auto_203339 ?auto_203340 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_203345 - BLOCK
      ?auto_203346 - BLOCK
      ?auto_203347 - BLOCK
      ?auto_203348 - BLOCK
      ?auto_203349 - BLOCK
    )
    :vars
    (
      ?auto_203350 - BLOCK
      ?auto_203353 - BLOCK
      ?auto_203352 - BLOCK
      ?auto_203351 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_203345 ?auto_203346 ) ) ( not ( = ?auto_203345 ?auto_203347 ) ) ( not ( = ?auto_203345 ?auto_203348 ) ) ( not ( = ?auto_203345 ?auto_203349 ) ) ( not ( = ?auto_203346 ?auto_203347 ) ) ( not ( = ?auto_203346 ?auto_203348 ) ) ( not ( = ?auto_203346 ?auto_203349 ) ) ( not ( = ?auto_203347 ?auto_203348 ) ) ( not ( = ?auto_203347 ?auto_203349 ) ) ( not ( = ?auto_203348 ?auto_203349 ) ) ( not ( = ?auto_203345 ?auto_203350 ) ) ( not ( = ?auto_203346 ?auto_203350 ) ) ( not ( = ?auto_203347 ?auto_203350 ) ) ( not ( = ?auto_203348 ?auto_203350 ) ) ( not ( = ?auto_203349 ?auto_203350 ) ) ( ON-TABLE ?auto_203353 ) ( ON ?auto_203352 ?auto_203353 ) ( ON ?auto_203350 ?auto_203352 ) ( not ( = ?auto_203353 ?auto_203352 ) ) ( not ( = ?auto_203353 ?auto_203350 ) ) ( not ( = ?auto_203353 ?auto_203349 ) ) ( not ( = ?auto_203353 ?auto_203348 ) ) ( not ( = ?auto_203352 ?auto_203350 ) ) ( not ( = ?auto_203352 ?auto_203349 ) ) ( not ( = ?auto_203352 ?auto_203348 ) ) ( not ( = ?auto_203345 ?auto_203353 ) ) ( not ( = ?auto_203345 ?auto_203352 ) ) ( not ( = ?auto_203346 ?auto_203353 ) ) ( not ( = ?auto_203346 ?auto_203352 ) ) ( not ( = ?auto_203347 ?auto_203353 ) ) ( not ( = ?auto_203347 ?auto_203352 ) ) ( ON ?auto_203345 ?auto_203351 ) ( not ( = ?auto_203345 ?auto_203351 ) ) ( not ( = ?auto_203346 ?auto_203351 ) ) ( not ( = ?auto_203347 ?auto_203351 ) ) ( not ( = ?auto_203348 ?auto_203351 ) ) ( not ( = ?auto_203349 ?auto_203351 ) ) ( not ( = ?auto_203350 ?auto_203351 ) ) ( not ( = ?auto_203353 ?auto_203351 ) ) ( not ( = ?auto_203352 ?auto_203351 ) ) ( ON ?auto_203346 ?auto_203345 ) ( ON-TABLE ?auto_203351 ) ( ON ?auto_203347 ?auto_203346 ) ( ON ?auto_203348 ?auto_203347 ) ( CLEAR ?auto_203350 ) ( ON ?auto_203349 ?auto_203348 ) ( CLEAR ?auto_203349 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_203351 ?auto_203345 ?auto_203346 ?auto_203347 ?auto_203348 )
      ( MAKE-5PILE ?auto_203345 ?auto_203346 ?auto_203347 ?auto_203348 ?auto_203349 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_203354 - BLOCK
      ?auto_203355 - BLOCK
      ?auto_203356 - BLOCK
      ?auto_203357 - BLOCK
      ?auto_203358 - BLOCK
    )
    :vars
    (
      ?auto_203362 - BLOCK
      ?auto_203361 - BLOCK
      ?auto_203360 - BLOCK
      ?auto_203359 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_203354 ?auto_203355 ) ) ( not ( = ?auto_203354 ?auto_203356 ) ) ( not ( = ?auto_203354 ?auto_203357 ) ) ( not ( = ?auto_203354 ?auto_203358 ) ) ( not ( = ?auto_203355 ?auto_203356 ) ) ( not ( = ?auto_203355 ?auto_203357 ) ) ( not ( = ?auto_203355 ?auto_203358 ) ) ( not ( = ?auto_203356 ?auto_203357 ) ) ( not ( = ?auto_203356 ?auto_203358 ) ) ( not ( = ?auto_203357 ?auto_203358 ) ) ( not ( = ?auto_203354 ?auto_203362 ) ) ( not ( = ?auto_203355 ?auto_203362 ) ) ( not ( = ?auto_203356 ?auto_203362 ) ) ( not ( = ?auto_203357 ?auto_203362 ) ) ( not ( = ?auto_203358 ?auto_203362 ) ) ( ON-TABLE ?auto_203361 ) ( ON ?auto_203360 ?auto_203361 ) ( not ( = ?auto_203361 ?auto_203360 ) ) ( not ( = ?auto_203361 ?auto_203362 ) ) ( not ( = ?auto_203361 ?auto_203358 ) ) ( not ( = ?auto_203361 ?auto_203357 ) ) ( not ( = ?auto_203360 ?auto_203362 ) ) ( not ( = ?auto_203360 ?auto_203358 ) ) ( not ( = ?auto_203360 ?auto_203357 ) ) ( not ( = ?auto_203354 ?auto_203361 ) ) ( not ( = ?auto_203354 ?auto_203360 ) ) ( not ( = ?auto_203355 ?auto_203361 ) ) ( not ( = ?auto_203355 ?auto_203360 ) ) ( not ( = ?auto_203356 ?auto_203361 ) ) ( not ( = ?auto_203356 ?auto_203360 ) ) ( ON ?auto_203354 ?auto_203359 ) ( not ( = ?auto_203354 ?auto_203359 ) ) ( not ( = ?auto_203355 ?auto_203359 ) ) ( not ( = ?auto_203356 ?auto_203359 ) ) ( not ( = ?auto_203357 ?auto_203359 ) ) ( not ( = ?auto_203358 ?auto_203359 ) ) ( not ( = ?auto_203362 ?auto_203359 ) ) ( not ( = ?auto_203361 ?auto_203359 ) ) ( not ( = ?auto_203360 ?auto_203359 ) ) ( ON ?auto_203355 ?auto_203354 ) ( ON-TABLE ?auto_203359 ) ( ON ?auto_203356 ?auto_203355 ) ( ON ?auto_203357 ?auto_203356 ) ( ON ?auto_203358 ?auto_203357 ) ( CLEAR ?auto_203358 ) ( HOLDING ?auto_203362 ) ( CLEAR ?auto_203360 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_203361 ?auto_203360 ?auto_203362 )
      ( MAKE-5PILE ?auto_203354 ?auto_203355 ?auto_203356 ?auto_203357 ?auto_203358 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_203363 - BLOCK
      ?auto_203364 - BLOCK
      ?auto_203365 - BLOCK
      ?auto_203366 - BLOCK
      ?auto_203367 - BLOCK
    )
    :vars
    (
      ?auto_203370 - BLOCK
      ?auto_203368 - BLOCK
      ?auto_203371 - BLOCK
      ?auto_203369 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_203363 ?auto_203364 ) ) ( not ( = ?auto_203363 ?auto_203365 ) ) ( not ( = ?auto_203363 ?auto_203366 ) ) ( not ( = ?auto_203363 ?auto_203367 ) ) ( not ( = ?auto_203364 ?auto_203365 ) ) ( not ( = ?auto_203364 ?auto_203366 ) ) ( not ( = ?auto_203364 ?auto_203367 ) ) ( not ( = ?auto_203365 ?auto_203366 ) ) ( not ( = ?auto_203365 ?auto_203367 ) ) ( not ( = ?auto_203366 ?auto_203367 ) ) ( not ( = ?auto_203363 ?auto_203370 ) ) ( not ( = ?auto_203364 ?auto_203370 ) ) ( not ( = ?auto_203365 ?auto_203370 ) ) ( not ( = ?auto_203366 ?auto_203370 ) ) ( not ( = ?auto_203367 ?auto_203370 ) ) ( ON-TABLE ?auto_203368 ) ( ON ?auto_203371 ?auto_203368 ) ( not ( = ?auto_203368 ?auto_203371 ) ) ( not ( = ?auto_203368 ?auto_203370 ) ) ( not ( = ?auto_203368 ?auto_203367 ) ) ( not ( = ?auto_203368 ?auto_203366 ) ) ( not ( = ?auto_203371 ?auto_203370 ) ) ( not ( = ?auto_203371 ?auto_203367 ) ) ( not ( = ?auto_203371 ?auto_203366 ) ) ( not ( = ?auto_203363 ?auto_203368 ) ) ( not ( = ?auto_203363 ?auto_203371 ) ) ( not ( = ?auto_203364 ?auto_203368 ) ) ( not ( = ?auto_203364 ?auto_203371 ) ) ( not ( = ?auto_203365 ?auto_203368 ) ) ( not ( = ?auto_203365 ?auto_203371 ) ) ( ON ?auto_203363 ?auto_203369 ) ( not ( = ?auto_203363 ?auto_203369 ) ) ( not ( = ?auto_203364 ?auto_203369 ) ) ( not ( = ?auto_203365 ?auto_203369 ) ) ( not ( = ?auto_203366 ?auto_203369 ) ) ( not ( = ?auto_203367 ?auto_203369 ) ) ( not ( = ?auto_203370 ?auto_203369 ) ) ( not ( = ?auto_203368 ?auto_203369 ) ) ( not ( = ?auto_203371 ?auto_203369 ) ) ( ON ?auto_203364 ?auto_203363 ) ( ON-TABLE ?auto_203369 ) ( ON ?auto_203365 ?auto_203364 ) ( ON ?auto_203366 ?auto_203365 ) ( ON ?auto_203367 ?auto_203366 ) ( CLEAR ?auto_203371 ) ( ON ?auto_203370 ?auto_203367 ) ( CLEAR ?auto_203370 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_203369 ?auto_203363 ?auto_203364 ?auto_203365 ?auto_203366 ?auto_203367 )
      ( MAKE-5PILE ?auto_203363 ?auto_203364 ?auto_203365 ?auto_203366 ?auto_203367 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_203372 - BLOCK
      ?auto_203373 - BLOCK
      ?auto_203374 - BLOCK
      ?auto_203375 - BLOCK
      ?auto_203376 - BLOCK
    )
    :vars
    (
      ?auto_203379 - BLOCK
      ?auto_203378 - BLOCK
      ?auto_203377 - BLOCK
      ?auto_203380 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_203372 ?auto_203373 ) ) ( not ( = ?auto_203372 ?auto_203374 ) ) ( not ( = ?auto_203372 ?auto_203375 ) ) ( not ( = ?auto_203372 ?auto_203376 ) ) ( not ( = ?auto_203373 ?auto_203374 ) ) ( not ( = ?auto_203373 ?auto_203375 ) ) ( not ( = ?auto_203373 ?auto_203376 ) ) ( not ( = ?auto_203374 ?auto_203375 ) ) ( not ( = ?auto_203374 ?auto_203376 ) ) ( not ( = ?auto_203375 ?auto_203376 ) ) ( not ( = ?auto_203372 ?auto_203379 ) ) ( not ( = ?auto_203373 ?auto_203379 ) ) ( not ( = ?auto_203374 ?auto_203379 ) ) ( not ( = ?auto_203375 ?auto_203379 ) ) ( not ( = ?auto_203376 ?auto_203379 ) ) ( ON-TABLE ?auto_203378 ) ( not ( = ?auto_203378 ?auto_203377 ) ) ( not ( = ?auto_203378 ?auto_203379 ) ) ( not ( = ?auto_203378 ?auto_203376 ) ) ( not ( = ?auto_203378 ?auto_203375 ) ) ( not ( = ?auto_203377 ?auto_203379 ) ) ( not ( = ?auto_203377 ?auto_203376 ) ) ( not ( = ?auto_203377 ?auto_203375 ) ) ( not ( = ?auto_203372 ?auto_203378 ) ) ( not ( = ?auto_203372 ?auto_203377 ) ) ( not ( = ?auto_203373 ?auto_203378 ) ) ( not ( = ?auto_203373 ?auto_203377 ) ) ( not ( = ?auto_203374 ?auto_203378 ) ) ( not ( = ?auto_203374 ?auto_203377 ) ) ( ON ?auto_203372 ?auto_203380 ) ( not ( = ?auto_203372 ?auto_203380 ) ) ( not ( = ?auto_203373 ?auto_203380 ) ) ( not ( = ?auto_203374 ?auto_203380 ) ) ( not ( = ?auto_203375 ?auto_203380 ) ) ( not ( = ?auto_203376 ?auto_203380 ) ) ( not ( = ?auto_203379 ?auto_203380 ) ) ( not ( = ?auto_203378 ?auto_203380 ) ) ( not ( = ?auto_203377 ?auto_203380 ) ) ( ON ?auto_203373 ?auto_203372 ) ( ON-TABLE ?auto_203380 ) ( ON ?auto_203374 ?auto_203373 ) ( ON ?auto_203375 ?auto_203374 ) ( ON ?auto_203376 ?auto_203375 ) ( ON ?auto_203379 ?auto_203376 ) ( CLEAR ?auto_203379 ) ( HOLDING ?auto_203377 ) ( CLEAR ?auto_203378 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_203378 ?auto_203377 )
      ( MAKE-5PILE ?auto_203372 ?auto_203373 ?auto_203374 ?auto_203375 ?auto_203376 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_203381 - BLOCK
      ?auto_203382 - BLOCK
      ?auto_203383 - BLOCK
      ?auto_203384 - BLOCK
      ?auto_203385 - BLOCK
    )
    :vars
    (
      ?auto_203389 - BLOCK
      ?auto_203388 - BLOCK
      ?auto_203386 - BLOCK
      ?auto_203387 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_203381 ?auto_203382 ) ) ( not ( = ?auto_203381 ?auto_203383 ) ) ( not ( = ?auto_203381 ?auto_203384 ) ) ( not ( = ?auto_203381 ?auto_203385 ) ) ( not ( = ?auto_203382 ?auto_203383 ) ) ( not ( = ?auto_203382 ?auto_203384 ) ) ( not ( = ?auto_203382 ?auto_203385 ) ) ( not ( = ?auto_203383 ?auto_203384 ) ) ( not ( = ?auto_203383 ?auto_203385 ) ) ( not ( = ?auto_203384 ?auto_203385 ) ) ( not ( = ?auto_203381 ?auto_203389 ) ) ( not ( = ?auto_203382 ?auto_203389 ) ) ( not ( = ?auto_203383 ?auto_203389 ) ) ( not ( = ?auto_203384 ?auto_203389 ) ) ( not ( = ?auto_203385 ?auto_203389 ) ) ( ON-TABLE ?auto_203388 ) ( not ( = ?auto_203388 ?auto_203386 ) ) ( not ( = ?auto_203388 ?auto_203389 ) ) ( not ( = ?auto_203388 ?auto_203385 ) ) ( not ( = ?auto_203388 ?auto_203384 ) ) ( not ( = ?auto_203386 ?auto_203389 ) ) ( not ( = ?auto_203386 ?auto_203385 ) ) ( not ( = ?auto_203386 ?auto_203384 ) ) ( not ( = ?auto_203381 ?auto_203388 ) ) ( not ( = ?auto_203381 ?auto_203386 ) ) ( not ( = ?auto_203382 ?auto_203388 ) ) ( not ( = ?auto_203382 ?auto_203386 ) ) ( not ( = ?auto_203383 ?auto_203388 ) ) ( not ( = ?auto_203383 ?auto_203386 ) ) ( ON ?auto_203381 ?auto_203387 ) ( not ( = ?auto_203381 ?auto_203387 ) ) ( not ( = ?auto_203382 ?auto_203387 ) ) ( not ( = ?auto_203383 ?auto_203387 ) ) ( not ( = ?auto_203384 ?auto_203387 ) ) ( not ( = ?auto_203385 ?auto_203387 ) ) ( not ( = ?auto_203389 ?auto_203387 ) ) ( not ( = ?auto_203388 ?auto_203387 ) ) ( not ( = ?auto_203386 ?auto_203387 ) ) ( ON ?auto_203382 ?auto_203381 ) ( ON-TABLE ?auto_203387 ) ( ON ?auto_203383 ?auto_203382 ) ( ON ?auto_203384 ?auto_203383 ) ( ON ?auto_203385 ?auto_203384 ) ( ON ?auto_203389 ?auto_203385 ) ( CLEAR ?auto_203388 ) ( ON ?auto_203386 ?auto_203389 ) ( CLEAR ?auto_203386 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_203387 ?auto_203381 ?auto_203382 ?auto_203383 ?auto_203384 ?auto_203385 ?auto_203389 )
      ( MAKE-5PILE ?auto_203381 ?auto_203382 ?auto_203383 ?auto_203384 ?auto_203385 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_203390 - BLOCK
      ?auto_203391 - BLOCK
      ?auto_203392 - BLOCK
      ?auto_203393 - BLOCK
      ?auto_203394 - BLOCK
    )
    :vars
    (
      ?auto_203398 - BLOCK
      ?auto_203395 - BLOCK
      ?auto_203396 - BLOCK
      ?auto_203397 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_203390 ?auto_203391 ) ) ( not ( = ?auto_203390 ?auto_203392 ) ) ( not ( = ?auto_203390 ?auto_203393 ) ) ( not ( = ?auto_203390 ?auto_203394 ) ) ( not ( = ?auto_203391 ?auto_203392 ) ) ( not ( = ?auto_203391 ?auto_203393 ) ) ( not ( = ?auto_203391 ?auto_203394 ) ) ( not ( = ?auto_203392 ?auto_203393 ) ) ( not ( = ?auto_203392 ?auto_203394 ) ) ( not ( = ?auto_203393 ?auto_203394 ) ) ( not ( = ?auto_203390 ?auto_203398 ) ) ( not ( = ?auto_203391 ?auto_203398 ) ) ( not ( = ?auto_203392 ?auto_203398 ) ) ( not ( = ?auto_203393 ?auto_203398 ) ) ( not ( = ?auto_203394 ?auto_203398 ) ) ( not ( = ?auto_203395 ?auto_203396 ) ) ( not ( = ?auto_203395 ?auto_203398 ) ) ( not ( = ?auto_203395 ?auto_203394 ) ) ( not ( = ?auto_203395 ?auto_203393 ) ) ( not ( = ?auto_203396 ?auto_203398 ) ) ( not ( = ?auto_203396 ?auto_203394 ) ) ( not ( = ?auto_203396 ?auto_203393 ) ) ( not ( = ?auto_203390 ?auto_203395 ) ) ( not ( = ?auto_203390 ?auto_203396 ) ) ( not ( = ?auto_203391 ?auto_203395 ) ) ( not ( = ?auto_203391 ?auto_203396 ) ) ( not ( = ?auto_203392 ?auto_203395 ) ) ( not ( = ?auto_203392 ?auto_203396 ) ) ( ON ?auto_203390 ?auto_203397 ) ( not ( = ?auto_203390 ?auto_203397 ) ) ( not ( = ?auto_203391 ?auto_203397 ) ) ( not ( = ?auto_203392 ?auto_203397 ) ) ( not ( = ?auto_203393 ?auto_203397 ) ) ( not ( = ?auto_203394 ?auto_203397 ) ) ( not ( = ?auto_203398 ?auto_203397 ) ) ( not ( = ?auto_203395 ?auto_203397 ) ) ( not ( = ?auto_203396 ?auto_203397 ) ) ( ON ?auto_203391 ?auto_203390 ) ( ON-TABLE ?auto_203397 ) ( ON ?auto_203392 ?auto_203391 ) ( ON ?auto_203393 ?auto_203392 ) ( ON ?auto_203394 ?auto_203393 ) ( ON ?auto_203398 ?auto_203394 ) ( ON ?auto_203396 ?auto_203398 ) ( CLEAR ?auto_203396 ) ( HOLDING ?auto_203395 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_203395 )
      ( MAKE-5PILE ?auto_203390 ?auto_203391 ?auto_203392 ?auto_203393 ?auto_203394 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_203399 - BLOCK
      ?auto_203400 - BLOCK
      ?auto_203401 - BLOCK
      ?auto_203402 - BLOCK
      ?auto_203403 - BLOCK
    )
    :vars
    (
      ?auto_203404 - BLOCK
      ?auto_203406 - BLOCK
      ?auto_203407 - BLOCK
      ?auto_203405 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_203399 ?auto_203400 ) ) ( not ( = ?auto_203399 ?auto_203401 ) ) ( not ( = ?auto_203399 ?auto_203402 ) ) ( not ( = ?auto_203399 ?auto_203403 ) ) ( not ( = ?auto_203400 ?auto_203401 ) ) ( not ( = ?auto_203400 ?auto_203402 ) ) ( not ( = ?auto_203400 ?auto_203403 ) ) ( not ( = ?auto_203401 ?auto_203402 ) ) ( not ( = ?auto_203401 ?auto_203403 ) ) ( not ( = ?auto_203402 ?auto_203403 ) ) ( not ( = ?auto_203399 ?auto_203404 ) ) ( not ( = ?auto_203400 ?auto_203404 ) ) ( not ( = ?auto_203401 ?auto_203404 ) ) ( not ( = ?auto_203402 ?auto_203404 ) ) ( not ( = ?auto_203403 ?auto_203404 ) ) ( not ( = ?auto_203406 ?auto_203407 ) ) ( not ( = ?auto_203406 ?auto_203404 ) ) ( not ( = ?auto_203406 ?auto_203403 ) ) ( not ( = ?auto_203406 ?auto_203402 ) ) ( not ( = ?auto_203407 ?auto_203404 ) ) ( not ( = ?auto_203407 ?auto_203403 ) ) ( not ( = ?auto_203407 ?auto_203402 ) ) ( not ( = ?auto_203399 ?auto_203406 ) ) ( not ( = ?auto_203399 ?auto_203407 ) ) ( not ( = ?auto_203400 ?auto_203406 ) ) ( not ( = ?auto_203400 ?auto_203407 ) ) ( not ( = ?auto_203401 ?auto_203406 ) ) ( not ( = ?auto_203401 ?auto_203407 ) ) ( ON ?auto_203399 ?auto_203405 ) ( not ( = ?auto_203399 ?auto_203405 ) ) ( not ( = ?auto_203400 ?auto_203405 ) ) ( not ( = ?auto_203401 ?auto_203405 ) ) ( not ( = ?auto_203402 ?auto_203405 ) ) ( not ( = ?auto_203403 ?auto_203405 ) ) ( not ( = ?auto_203404 ?auto_203405 ) ) ( not ( = ?auto_203406 ?auto_203405 ) ) ( not ( = ?auto_203407 ?auto_203405 ) ) ( ON ?auto_203400 ?auto_203399 ) ( ON-TABLE ?auto_203405 ) ( ON ?auto_203401 ?auto_203400 ) ( ON ?auto_203402 ?auto_203401 ) ( ON ?auto_203403 ?auto_203402 ) ( ON ?auto_203404 ?auto_203403 ) ( ON ?auto_203407 ?auto_203404 ) ( ON ?auto_203406 ?auto_203407 ) ( CLEAR ?auto_203406 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_203405 ?auto_203399 ?auto_203400 ?auto_203401 ?auto_203402 ?auto_203403 ?auto_203404 ?auto_203407 )
      ( MAKE-5PILE ?auto_203399 ?auto_203400 ?auto_203401 ?auto_203402 ?auto_203403 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_203410 - BLOCK
      ?auto_203411 - BLOCK
    )
    :vars
    (
      ?auto_203412 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_203412 ?auto_203411 ) ( CLEAR ?auto_203412 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_203410 ) ( ON ?auto_203411 ?auto_203410 ) ( not ( = ?auto_203410 ?auto_203411 ) ) ( not ( = ?auto_203410 ?auto_203412 ) ) ( not ( = ?auto_203411 ?auto_203412 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_203412 ?auto_203411 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_203413 - BLOCK
      ?auto_203414 - BLOCK
    )
    :vars
    (
      ?auto_203415 - BLOCK
      ?auto_203416 - BLOCK
      ?auto_203417 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_203415 ?auto_203414 ) ( CLEAR ?auto_203415 ) ( ON-TABLE ?auto_203413 ) ( ON ?auto_203414 ?auto_203413 ) ( not ( = ?auto_203413 ?auto_203414 ) ) ( not ( = ?auto_203413 ?auto_203415 ) ) ( not ( = ?auto_203414 ?auto_203415 ) ) ( HOLDING ?auto_203416 ) ( CLEAR ?auto_203417 ) ( not ( = ?auto_203413 ?auto_203416 ) ) ( not ( = ?auto_203413 ?auto_203417 ) ) ( not ( = ?auto_203414 ?auto_203416 ) ) ( not ( = ?auto_203414 ?auto_203417 ) ) ( not ( = ?auto_203415 ?auto_203416 ) ) ( not ( = ?auto_203415 ?auto_203417 ) ) ( not ( = ?auto_203416 ?auto_203417 ) ) )
    :subtasks
    ( ( !STACK ?auto_203416 ?auto_203417 )
      ( MAKE-2PILE ?auto_203413 ?auto_203414 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_203418 - BLOCK
      ?auto_203419 - BLOCK
    )
    :vars
    (
      ?auto_203422 - BLOCK
      ?auto_203420 - BLOCK
      ?auto_203421 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_203422 ?auto_203419 ) ( ON-TABLE ?auto_203418 ) ( ON ?auto_203419 ?auto_203418 ) ( not ( = ?auto_203418 ?auto_203419 ) ) ( not ( = ?auto_203418 ?auto_203422 ) ) ( not ( = ?auto_203419 ?auto_203422 ) ) ( CLEAR ?auto_203420 ) ( not ( = ?auto_203418 ?auto_203421 ) ) ( not ( = ?auto_203418 ?auto_203420 ) ) ( not ( = ?auto_203419 ?auto_203421 ) ) ( not ( = ?auto_203419 ?auto_203420 ) ) ( not ( = ?auto_203422 ?auto_203421 ) ) ( not ( = ?auto_203422 ?auto_203420 ) ) ( not ( = ?auto_203421 ?auto_203420 ) ) ( ON ?auto_203421 ?auto_203422 ) ( CLEAR ?auto_203421 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_203418 ?auto_203419 ?auto_203422 )
      ( MAKE-2PILE ?auto_203418 ?auto_203419 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_203423 - BLOCK
      ?auto_203424 - BLOCK
    )
    :vars
    (
      ?auto_203427 - BLOCK
      ?auto_203426 - BLOCK
      ?auto_203425 - BLOCK
      ?auto_203428 - BLOCK
      ?auto_203430 - BLOCK
      ?auto_203429 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_203427 ?auto_203424 ) ( ON-TABLE ?auto_203423 ) ( ON ?auto_203424 ?auto_203423 ) ( not ( = ?auto_203423 ?auto_203424 ) ) ( not ( = ?auto_203423 ?auto_203427 ) ) ( not ( = ?auto_203424 ?auto_203427 ) ) ( not ( = ?auto_203423 ?auto_203426 ) ) ( not ( = ?auto_203423 ?auto_203425 ) ) ( not ( = ?auto_203424 ?auto_203426 ) ) ( not ( = ?auto_203424 ?auto_203425 ) ) ( not ( = ?auto_203427 ?auto_203426 ) ) ( not ( = ?auto_203427 ?auto_203425 ) ) ( not ( = ?auto_203426 ?auto_203425 ) ) ( ON ?auto_203426 ?auto_203427 ) ( CLEAR ?auto_203426 ) ( HOLDING ?auto_203425 ) ( CLEAR ?auto_203428 ) ( ON-TABLE ?auto_203430 ) ( ON ?auto_203429 ?auto_203430 ) ( ON ?auto_203428 ?auto_203429 ) ( not ( = ?auto_203430 ?auto_203429 ) ) ( not ( = ?auto_203430 ?auto_203428 ) ) ( not ( = ?auto_203430 ?auto_203425 ) ) ( not ( = ?auto_203429 ?auto_203428 ) ) ( not ( = ?auto_203429 ?auto_203425 ) ) ( not ( = ?auto_203428 ?auto_203425 ) ) ( not ( = ?auto_203423 ?auto_203428 ) ) ( not ( = ?auto_203423 ?auto_203430 ) ) ( not ( = ?auto_203423 ?auto_203429 ) ) ( not ( = ?auto_203424 ?auto_203428 ) ) ( not ( = ?auto_203424 ?auto_203430 ) ) ( not ( = ?auto_203424 ?auto_203429 ) ) ( not ( = ?auto_203427 ?auto_203428 ) ) ( not ( = ?auto_203427 ?auto_203430 ) ) ( not ( = ?auto_203427 ?auto_203429 ) ) ( not ( = ?auto_203426 ?auto_203428 ) ) ( not ( = ?auto_203426 ?auto_203430 ) ) ( not ( = ?auto_203426 ?auto_203429 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_203430 ?auto_203429 ?auto_203428 ?auto_203425 )
      ( MAKE-2PILE ?auto_203423 ?auto_203424 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_203431 - BLOCK
      ?auto_203432 - BLOCK
    )
    :vars
    (
      ?auto_203437 - BLOCK
      ?auto_203433 - BLOCK
      ?auto_203434 - BLOCK
      ?auto_203435 - BLOCK
      ?auto_203436 - BLOCK
      ?auto_203438 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_203437 ?auto_203432 ) ( ON-TABLE ?auto_203431 ) ( ON ?auto_203432 ?auto_203431 ) ( not ( = ?auto_203431 ?auto_203432 ) ) ( not ( = ?auto_203431 ?auto_203437 ) ) ( not ( = ?auto_203432 ?auto_203437 ) ) ( not ( = ?auto_203431 ?auto_203433 ) ) ( not ( = ?auto_203431 ?auto_203434 ) ) ( not ( = ?auto_203432 ?auto_203433 ) ) ( not ( = ?auto_203432 ?auto_203434 ) ) ( not ( = ?auto_203437 ?auto_203433 ) ) ( not ( = ?auto_203437 ?auto_203434 ) ) ( not ( = ?auto_203433 ?auto_203434 ) ) ( ON ?auto_203433 ?auto_203437 ) ( CLEAR ?auto_203435 ) ( ON-TABLE ?auto_203436 ) ( ON ?auto_203438 ?auto_203436 ) ( ON ?auto_203435 ?auto_203438 ) ( not ( = ?auto_203436 ?auto_203438 ) ) ( not ( = ?auto_203436 ?auto_203435 ) ) ( not ( = ?auto_203436 ?auto_203434 ) ) ( not ( = ?auto_203438 ?auto_203435 ) ) ( not ( = ?auto_203438 ?auto_203434 ) ) ( not ( = ?auto_203435 ?auto_203434 ) ) ( not ( = ?auto_203431 ?auto_203435 ) ) ( not ( = ?auto_203431 ?auto_203436 ) ) ( not ( = ?auto_203431 ?auto_203438 ) ) ( not ( = ?auto_203432 ?auto_203435 ) ) ( not ( = ?auto_203432 ?auto_203436 ) ) ( not ( = ?auto_203432 ?auto_203438 ) ) ( not ( = ?auto_203437 ?auto_203435 ) ) ( not ( = ?auto_203437 ?auto_203436 ) ) ( not ( = ?auto_203437 ?auto_203438 ) ) ( not ( = ?auto_203433 ?auto_203435 ) ) ( not ( = ?auto_203433 ?auto_203436 ) ) ( not ( = ?auto_203433 ?auto_203438 ) ) ( ON ?auto_203434 ?auto_203433 ) ( CLEAR ?auto_203434 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_203431 ?auto_203432 ?auto_203437 ?auto_203433 )
      ( MAKE-2PILE ?auto_203431 ?auto_203432 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_203439 - BLOCK
      ?auto_203440 - BLOCK
    )
    :vars
    (
      ?auto_203442 - BLOCK
      ?auto_203444 - BLOCK
      ?auto_203443 - BLOCK
      ?auto_203441 - BLOCK
      ?auto_203446 - BLOCK
      ?auto_203445 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_203442 ?auto_203440 ) ( ON-TABLE ?auto_203439 ) ( ON ?auto_203440 ?auto_203439 ) ( not ( = ?auto_203439 ?auto_203440 ) ) ( not ( = ?auto_203439 ?auto_203442 ) ) ( not ( = ?auto_203440 ?auto_203442 ) ) ( not ( = ?auto_203439 ?auto_203444 ) ) ( not ( = ?auto_203439 ?auto_203443 ) ) ( not ( = ?auto_203440 ?auto_203444 ) ) ( not ( = ?auto_203440 ?auto_203443 ) ) ( not ( = ?auto_203442 ?auto_203444 ) ) ( not ( = ?auto_203442 ?auto_203443 ) ) ( not ( = ?auto_203444 ?auto_203443 ) ) ( ON ?auto_203444 ?auto_203442 ) ( ON-TABLE ?auto_203441 ) ( ON ?auto_203446 ?auto_203441 ) ( not ( = ?auto_203441 ?auto_203446 ) ) ( not ( = ?auto_203441 ?auto_203445 ) ) ( not ( = ?auto_203441 ?auto_203443 ) ) ( not ( = ?auto_203446 ?auto_203445 ) ) ( not ( = ?auto_203446 ?auto_203443 ) ) ( not ( = ?auto_203445 ?auto_203443 ) ) ( not ( = ?auto_203439 ?auto_203445 ) ) ( not ( = ?auto_203439 ?auto_203441 ) ) ( not ( = ?auto_203439 ?auto_203446 ) ) ( not ( = ?auto_203440 ?auto_203445 ) ) ( not ( = ?auto_203440 ?auto_203441 ) ) ( not ( = ?auto_203440 ?auto_203446 ) ) ( not ( = ?auto_203442 ?auto_203445 ) ) ( not ( = ?auto_203442 ?auto_203441 ) ) ( not ( = ?auto_203442 ?auto_203446 ) ) ( not ( = ?auto_203444 ?auto_203445 ) ) ( not ( = ?auto_203444 ?auto_203441 ) ) ( not ( = ?auto_203444 ?auto_203446 ) ) ( ON ?auto_203443 ?auto_203444 ) ( CLEAR ?auto_203443 ) ( HOLDING ?auto_203445 ) ( CLEAR ?auto_203446 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_203441 ?auto_203446 ?auto_203445 )
      ( MAKE-2PILE ?auto_203439 ?auto_203440 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_203447 - BLOCK
      ?auto_203448 - BLOCK
    )
    :vars
    (
      ?auto_203450 - BLOCK
      ?auto_203453 - BLOCK
      ?auto_203452 - BLOCK
      ?auto_203449 - BLOCK
      ?auto_203454 - BLOCK
      ?auto_203451 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_203450 ?auto_203448 ) ( ON-TABLE ?auto_203447 ) ( ON ?auto_203448 ?auto_203447 ) ( not ( = ?auto_203447 ?auto_203448 ) ) ( not ( = ?auto_203447 ?auto_203450 ) ) ( not ( = ?auto_203448 ?auto_203450 ) ) ( not ( = ?auto_203447 ?auto_203453 ) ) ( not ( = ?auto_203447 ?auto_203452 ) ) ( not ( = ?auto_203448 ?auto_203453 ) ) ( not ( = ?auto_203448 ?auto_203452 ) ) ( not ( = ?auto_203450 ?auto_203453 ) ) ( not ( = ?auto_203450 ?auto_203452 ) ) ( not ( = ?auto_203453 ?auto_203452 ) ) ( ON ?auto_203453 ?auto_203450 ) ( ON-TABLE ?auto_203449 ) ( ON ?auto_203454 ?auto_203449 ) ( not ( = ?auto_203449 ?auto_203454 ) ) ( not ( = ?auto_203449 ?auto_203451 ) ) ( not ( = ?auto_203449 ?auto_203452 ) ) ( not ( = ?auto_203454 ?auto_203451 ) ) ( not ( = ?auto_203454 ?auto_203452 ) ) ( not ( = ?auto_203451 ?auto_203452 ) ) ( not ( = ?auto_203447 ?auto_203451 ) ) ( not ( = ?auto_203447 ?auto_203449 ) ) ( not ( = ?auto_203447 ?auto_203454 ) ) ( not ( = ?auto_203448 ?auto_203451 ) ) ( not ( = ?auto_203448 ?auto_203449 ) ) ( not ( = ?auto_203448 ?auto_203454 ) ) ( not ( = ?auto_203450 ?auto_203451 ) ) ( not ( = ?auto_203450 ?auto_203449 ) ) ( not ( = ?auto_203450 ?auto_203454 ) ) ( not ( = ?auto_203453 ?auto_203451 ) ) ( not ( = ?auto_203453 ?auto_203449 ) ) ( not ( = ?auto_203453 ?auto_203454 ) ) ( ON ?auto_203452 ?auto_203453 ) ( CLEAR ?auto_203454 ) ( ON ?auto_203451 ?auto_203452 ) ( CLEAR ?auto_203451 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_203447 ?auto_203448 ?auto_203450 ?auto_203453 ?auto_203452 )
      ( MAKE-2PILE ?auto_203447 ?auto_203448 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_203455 - BLOCK
      ?auto_203456 - BLOCK
    )
    :vars
    (
      ?auto_203458 - BLOCK
      ?auto_203459 - BLOCK
      ?auto_203457 - BLOCK
      ?auto_203461 - BLOCK
      ?auto_203462 - BLOCK
      ?auto_203460 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_203458 ?auto_203456 ) ( ON-TABLE ?auto_203455 ) ( ON ?auto_203456 ?auto_203455 ) ( not ( = ?auto_203455 ?auto_203456 ) ) ( not ( = ?auto_203455 ?auto_203458 ) ) ( not ( = ?auto_203456 ?auto_203458 ) ) ( not ( = ?auto_203455 ?auto_203459 ) ) ( not ( = ?auto_203455 ?auto_203457 ) ) ( not ( = ?auto_203456 ?auto_203459 ) ) ( not ( = ?auto_203456 ?auto_203457 ) ) ( not ( = ?auto_203458 ?auto_203459 ) ) ( not ( = ?auto_203458 ?auto_203457 ) ) ( not ( = ?auto_203459 ?auto_203457 ) ) ( ON ?auto_203459 ?auto_203458 ) ( ON-TABLE ?auto_203461 ) ( not ( = ?auto_203461 ?auto_203462 ) ) ( not ( = ?auto_203461 ?auto_203460 ) ) ( not ( = ?auto_203461 ?auto_203457 ) ) ( not ( = ?auto_203462 ?auto_203460 ) ) ( not ( = ?auto_203462 ?auto_203457 ) ) ( not ( = ?auto_203460 ?auto_203457 ) ) ( not ( = ?auto_203455 ?auto_203460 ) ) ( not ( = ?auto_203455 ?auto_203461 ) ) ( not ( = ?auto_203455 ?auto_203462 ) ) ( not ( = ?auto_203456 ?auto_203460 ) ) ( not ( = ?auto_203456 ?auto_203461 ) ) ( not ( = ?auto_203456 ?auto_203462 ) ) ( not ( = ?auto_203458 ?auto_203460 ) ) ( not ( = ?auto_203458 ?auto_203461 ) ) ( not ( = ?auto_203458 ?auto_203462 ) ) ( not ( = ?auto_203459 ?auto_203460 ) ) ( not ( = ?auto_203459 ?auto_203461 ) ) ( not ( = ?auto_203459 ?auto_203462 ) ) ( ON ?auto_203457 ?auto_203459 ) ( ON ?auto_203460 ?auto_203457 ) ( CLEAR ?auto_203460 ) ( HOLDING ?auto_203462 ) ( CLEAR ?auto_203461 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_203461 ?auto_203462 )
      ( MAKE-2PILE ?auto_203455 ?auto_203456 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_203463 - BLOCK
      ?auto_203464 - BLOCK
    )
    :vars
    (
      ?auto_203468 - BLOCK
      ?auto_203470 - BLOCK
      ?auto_203467 - BLOCK
      ?auto_203466 - BLOCK
      ?auto_203469 - BLOCK
      ?auto_203465 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_203468 ?auto_203464 ) ( ON-TABLE ?auto_203463 ) ( ON ?auto_203464 ?auto_203463 ) ( not ( = ?auto_203463 ?auto_203464 ) ) ( not ( = ?auto_203463 ?auto_203468 ) ) ( not ( = ?auto_203464 ?auto_203468 ) ) ( not ( = ?auto_203463 ?auto_203470 ) ) ( not ( = ?auto_203463 ?auto_203467 ) ) ( not ( = ?auto_203464 ?auto_203470 ) ) ( not ( = ?auto_203464 ?auto_203467 ) ) ( not ( = ?auto_203468 ?auto_203470 ) ) ( not ( = ?auto_203468 ?auto_203467 ) ) ( not ( = ?auto_203470 ?auto_203467 ) ) ( ON ?auto_203470 ?auto_203468 ) ( ON-TABLE ?auto_203466 ) ( not ( = ?auto_203466 ?auto_203469 ) ) ( not ( = ?auto_203466 ?auto_203465 ) ) ( not ( = ?auto_203466 ?auto_203467 ) ) ( not ( = ?auto_203469 ?auto_203465 ) ) ( not ( = ?auto_203469 ?auto_203467 ) ) ( not ( = ?auto_203465 ?auto_203467 ) ) ( not ( = ?auto_203463 ?auto_203465 ) ) ( not ( = ?auto_203463 ?auto_203466 ) ) ( not ( = ?auto_203463 ?auto_203469 ) ) ( not ( = ?auto_203464 ?auto_203465 ) ) ( not ( = ?auto_203464 ?auto_203466 ) ) ( not ( = ?auto_203464 ?auto_203469 ) ) ( not ( = ?auto_203468 ?auto_203465 ) ) ( not ( = ?auto_203468 ?auto_203466 ) ) ( not ( = ?auto_203468 ?auto_203469 ) ) ( not ( = ?auto_203470 ?auto_203465 ) ) ( not ( = ?auto_203470 ?auto_203466 ) ) ( not ( = ?auto_203470 ?auto_203469 ) ) ( ON ?auto_203467 ?auto_203470 ) ( ON ?auto_203465 ?auto_203467 ) ( CLEAR ?auto_203466 ) ( ON ?auto_203469 ?auto_203465 ) ( CLEAR ?auto_203469 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_203463 ?auto_203464 ?auto_203468 ?auto_203470 ?auto_203467 ?auto_203465 )
      ( MAKE-2PILE ?auto_203463 ?auto_203464 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_203471 - BLOCK
      ?auto_203472 - BLOCK
    )
    :vars
    (
      ?auto_203475 - BLOCK
      ?auto_203478 - BLOCK
      ?auto_203477 - BLOCK
      ?auto_203474 - BLOCK
      ?auto_203476 - BLOCK
      ?auto_203473 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_203475 ?auto_203472 ) ( ON-TABLE ?auto_203471 ) ( ON ?auto_203472 ?auto_203471 ) ( not ( = ?auto_203471 ?auto_203472 ) ) ( not ( = ?auto_203471 ?auto_203475 ) ) ( not ( = ?auto_203472 ?auto_203475 ) ) ( not ( = ?auto_203471 ?auto_203478 ) ) ( not ( = ?auto_203471 ?auto_203477 ) ) ( not ( = ?auto_203472 ?auto_203478 ) ) ( not ( = ?auto_203472 ?auto_203477 ) ) ( not ( = ?auto_203475 ?auto_203478 ) ) ( not ( = ?auto_203475 ?auto_203477 ) ) ( not ( = ?auto_203478 ?auto_203477 ) ) ( ON ?auto_203478 ?auto_203475 ) ( not ( = ?auto_203474 ?auto_203476 ) ) ( not ( = ?auto_203474 ?auto_203473 ) ) ( not ( = ?auto_203474 ?auto_203477 ) ) ( not ( = ?auto_203476 ?auto_203473 ) ) ( not ( = ?auto_203476 ?auto_203477 ) ) ( not ( = ?auto_203473 ?auto_203477 ) ) ( not ( = ?auto_203471 ?auto_203473 ) ) ( not ( = ?auto_203471 ?auto_203474 ) ) ( not ( = ?auto_203471 ?auto_203476 ) ) ( not ( = ?auto_203472 ?auto_203473 ) ) ( not ( = ?auto_203472 ?auto_203474 ) ) ( not ( = ?auto_203472 ?auto_203476 ) ) ( not ( = ?auto_203475 ?auto_203473 ) ) ( not ( = ?auto_203475 ?auto_203474 ) ) ( not ( = ?auto_203475 ?auto_203476 ) ) ( not ( = ?auto_203478 ?auto_203473 ) ) ( not ( = ?auto_203478 ?auto_203474 ) ) ( not ( = ?auto_203478 ?auto_203476 ) ) ( ON ?auto_203477 ?auto_203478 ) ( ON ?auto_203473 ?auto_203477 ) ( ON ?auto_203476 ?auto_203473 ) ( CLEAR ?auto_203476 ) ( HOLDING ?auto_203474 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_203474 )
      ( MAKE-2PILE ?auto_203471 ?auto_203472 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_203479 - BLOCK
      ?auto_203480 - BLOCK
    )
    :vars
    (
      ?auto_203482 - BLOCK
      ?auto_203486 - BLOCK
      ?auto_203481 - BLOCK
      ?auto_203483 - BLOCK
      ?auto_203485 - BLOCK
      ?auto_203484 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_203482 ?auto_203480 ) ( ON-TABLE ?auto_203479 ) ( ON ?auto_203480 ?auto_203479 ) ( not ( = ?auto_203479 ?auto_203480 ) ) ( not ( = ?auto_203479 ?auto_203482 ) ) ( not ( = ?auto_203480 ?auto_203482 ) ) ( not ( = ?auto_203479 ?auto_203486 ) ) ( not ( = ?auto_203479 ?auto_203481 ) ) ( not ( = ?auto_203480 ?auto_203486 ) ) ( not ( = ?auto_203480 ?auto_203481 ) ) ( not ( = ?auto_203482 ?auto_203486 ) ) ( not ( = ?auto_203482 ?auto_203481 ) ) ( not ( = ?auto_203486 ?auto_203481 ) ) ( ON ?auto_203486 ?auto_203482 ) ( not ( = ?auto_203483 ?auto_203485 ) ) ( not ( = ?auto_203483 ?auto_203484 ) ) ( not ( = ?auto_203483 ?auto_203481 ) ) ( not ( = ?auto_203485 ?auto_203484 ) ) ( not ( = ?auto_203485 ?auto_203481 ) ) ( not ( = ?auto_203484 ?auto_203481 ) ) ( not ( = ?auto_203479 ?auto_203484 ) ) ( not ( = ?auto_203479 ?auto_203483 ) ) ( not ( = ?auto_203479 ?auto_203485 ) ) ( not ( = ?auto_203480 ?auto_203484 ) ) ( not ( = ?auto_203480 ?auto_203483 ) ) ( not ( = ?auto_203480 ?auto_203485 ) ) ( not ( = ?auto_203482 ?auto_203484 ) ) ( not ( = ?auto_203482 ?auto_203483 ) ) ( not ( = ?auto_203482 ?auto_203485 ) ) ( not ( = ?auto_203486 ?auto_203484 ) ) ( not ( = ?auto_203486 ?auto_203483 ) ) ( not ( = ?auto_203486 ?auto_203485 ) ) ( ON ?auto_203481 ?auto_203486 ) ( ON ?auto_203484 ?auto_203481 ) ( ON ?auto_203485 ?auto_203484 ) ( ON ?auto_203483 ?auto_203485 ) ( CLEAR ?auto_203483 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_203479 ?auto_203480 ?auto_203482 ?auto_203486 ?auto_203481 ?auto_203484 ?auto_203485 )
      ( MAKE-2PILE ?auto_203479 ?auto_203480 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_203487 - BLOCK
      ?auto_203488 - BLOCK
    )
    :vars
    (
      ?auto_203494 - BLOCK
      ?auto_203493 - BLOCK
      ?auto_203492 - BLOCK
      ?auto_203490 - BLOCK
      ?auto_203491 - BLOCK
      ?auto_203489 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_203494 ?auto_203488 ) ( ON-TABLE ?auto_203487 ) ( ON ?auto_203488 ?auto_203487 ) ( not ( = ?auto_203487 ?auto_203488 ) ) ( not ( = ?auto_203487 ?auto_203494 ) ) ( not ( = ?auto_203488 ?auto_203494 ) ) ( not ( = ?auto_203487 ?auto_203493 ) ) ( not ( = ?auto_203487 ?auto_203492 ) ) ( not ( = ?auto_203488 ?auto_203493 ) ) ( not ( = ?auto_203488 ?auto_203492 ) ) ( not ( = ?auto_203494 ?auto_203493 ) ) ( not ( = ?auto_203494 ?auto_203492 ) ) ( not ( = ?auto_203493 ?auto_203492 ) ) ( ON ?auto_203493 ?auto_203494 ) ( not ( = ?auto_203490 ?auto_203491 ) ) ( not ( = ?auto_203490 ?auto_203489 ) ) ( not ( = ?auto_203490 ?auto_203492 ) ) ( not ( = ?auto_203491 ?auto_203489 ) ) ( not ( = ?auto_203491 ?auto_203492 ) ) ( not ( = ?auto_203489 ?auto_203492 ) ) ( not ( = ?auto_203487 ?auto_203489 ) ) ( not ( = ?auto_203487 ?auto_203490 ) ) ( not ( = ?auto_203487 ?auto_203491 ) ) ( not ( = ?auto_203488 ?auto_203489 ) ) ( not ( = ?auto_203488 ?auto_203490 ) ) ( not ( = ?auto_203488 ?auto_203491 ) ) ( not ( = ?auto_203494 ?auto_203489 ) ) ( not ( = ?auto_203494 ?auto_203490 ) ) ( not ( = ?auto_203494 ?auto_203491 ) ) ( not ( = ?auto_203493 ?auto_203489 ) ) ( not ( = ?auto_203493 ?auto_203490 ) ) ( not ( = ?auto_203493 ?auto_203491 ) ) ( ON ?auto_203492 ?auto_203493 ) ( ON ?auto_203489 ?auto_203492 ) ( ON ?auto_203491 ?auto_203489 ) ( HOLDING ?auto_203490 ) ( CLEAR ?auto_203491 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_203487 ?auto_203488 ?auto_203494 ?auto_203493 ?auto_203492 ?auto_203489 ?auto_203491 ?auto_203490 )
      ( MAKE-2PILE ?auto_203487 ?auto_203488 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_203495 - BLOCK
      ?auto_203496 - BLOCK
    )
    :vars
    (
      ?auto_203501 - BLOCK
      ?auto_203500 - BLOCK
      ?auto_203499 - BLOCK
      ?auto_203498 - BLOCK
      ?auto_203502 - BLOCK
      ?auto_203497 - BLOCK
      ?auto_203503 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_203501 ?auto_203496 ) ( ON-TABLE ?auto_203495 ) ( ON ?auto_203496 ?auto_203495 ) ( not ( = ?auto_203495 ?auto_203496 ) ) ( not ( = ?auto_203495 ?auto_203501 ) ) ( not ( = ?auto_203496 ?auto_203501 ) ) ( not ( = ?auto_203495 ?auto_203500 ) ) ( not ( = ?auto_203495 ?auto_203499 ) ) ( not ( = ?auto_203496 ?auto_203500 ) ) ( not ( = ?auto_203496 ?auto_203499 ) ) ( not ( = ?auto_203501 ?auto_203500 ) ) ( not ( = ?auto_203501 ?auto_203499 ) ) ( not ( = ?auto_203500 ?auto_203499 ) ) ( ON ?auto_203500 ?auto_203501 ) ( not ( = ?auto_203498 ?auto_203502 ) ) ( not ( = ?auto_203498 ?auto_203497 ) ) ( not ( = ?auto_203498 ?auto_203499 ) ) ( not ( = ?auto_203502 ?auto_203497 ) ) ( not ( = ?auto_203502 ?auto_203499 ) ) ( not ( = ?auto_203497 ?auto_203499 ) ) ( not ( = ?auto_203495 ?auto_203497 ) ) ( not ( = ?auto_203495 ?auto_203498 ) ) ( not ( = ?auto_203495 ?auto_203502 ) ) ( not ( = ?auto_203496 ?auto_203497 ) ) ( not ( = ?auto_203496 ?auto_203498 ) ) ( not ( = ?auto_203496 ?auto_203502 ) ) ( not ( = ?auto_203501 ?auto_203497 ) ) ( not ( = ?auto_203501 ?auto_203498 ) ) ( not ( = ?auto_203501 ?auto_203502 ) ) ( not ( = ?auto_203500 ?auto_203497 ) ) ( not ( = ?auto_203500 ?auto_203498 ) ) ( not ( = ?auto_203500 ?auto_203502 ) ) ( ON ?auto_203499 ?auto_203500 ) ( ON ?auto_203497 ?auto_203499 ) ( ON ?auto_203502 ?auto_203497 ) ( CLEAR ?auto_203502 ) ( ON ?auto_203498 ?auto_203503 ) ( CLEAR ?auto_203498 ) ( HAND-EMPTY ) ( not ( = ?auto_203495 ?auto_203503 ) ) ( not ( = ?auto_203496 ?auto_203503 ) ) ( not ( = ?auto_203501 ?auto_203503 ) ) ( not ( = ?auto_203500 ?auto_203503 ) ) ( not ( = ?auto_203499 ?auto_203503 ) ) ( not ( = ?auto_203498 ?auto_203503 ) ) ( not ( = ?auto_203502 ?auto_203503 ) ) ( not ( = ?auto_203497 ?auto_203503 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_203498 ?auto_203503 )
      ( MAKE-2PILE ?auto_203495 ?auto_203496 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_203504 - BLOCK
      ?auto_203505 - BLOCK
    )
    :vars
    (
      ?auto_203509 - BLOCK
      ?auto_203512 - BLOCK
      ?auto_203506 - BLOCK
      ?auto_203510 - BLOCK
      ?auto_203507 - BLOCK
      ?auto_203511 - BLOCK
      ?auto_203508 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_203509 ?auto_203505 ) ( ON-TABLE ?auto_203504 ) ( ON ?auto_203505 ?auto_203504 ) ( not ( = ?auto_203504 ?auto_203505 ) ) ( not ( = ?auto_203504 ?auto_203509 ) ) ( not ( = ?auto_203505 ?auto_203509 ) ) ( not ( = ?auto_203504 ?auto_203512 ) ) ( not ( = ?auto_203504 ?auto_203506 ) ) ( not ( = ?auto_203505 ?auto_203512 ) ) ( not ( = ?auto_203505 ?auto_203506 ) ) ( not ( = ?auto_203509 ?auto_203512 ) ) ( not ( = ?auto_203509 ?auto_203506 ) ) ( not ( = ?auto_203512 ?auto_203506 ) ) ( ON ?auto_203512 ?auto_203509 ) ( not ( = ?auto_203510 ?auto_203507 ) ) ( not ( = ?auto_203510 ?auto_203511 ) ) ( not ( = ?auto_203510 ?auto_203506 ) ) ( not ( = ?auto_203507 ?auto_203511 ) ) ( not ( = ?auto_203507 ?auto_203506 ) ) ( not ( = ?auto_203511 ?auto_203506 ) ) ( not ( = ?auto_203504 ?auto_203511 ) ) ( not ( = ?auto_203504 ?auto_203510 ) ) ( not ( = ?auto_203504 ?auto_203507 ) ) ( not ( = ?auto_203505 ?auto_203511 ) ) ( not ( = ?auto_203505 ?auto_203510 ) ) ( not ( = ?auto_203505 ?auto_203507 ) ) ( not ( = ?auto_203509 ?auto_203511 ) ) ( not ( = ?auto_203509 ?auto_203510 ) ) ( not ( = ?auto_203509 ?auto_203507 ) ) ( not ( = ?auto_203512 ?auto_203511 ) ) ( not ( = ?auto_203512 ?auto_203510 ) ) ( not ( = ?auto_203512 ?auto_203507 ) ) ( ON ?auto_203506 ?auto_203512 ) ( ON ?auto_203511 ?auto_203506 ) ( ON ?auto_203510 ?auto_203508 ) ( CLEAR ?auto_203510 ) ( not ( = ?auto_203504 ?auto_203508 ) ) ( not ( = ?auto_203505 ?auto_203508 ) ) ( not ( = ?auto_203509 ?auto_203508 ) ) ( not ( = ?auto_203512 ?auto_203508 ) ) ( not ( = ?auto_203506 ?auto_203508 ) ) ( not ( = ?auto_203510 ?auto_203508 ) ) ( not ( = ?auto_203507 ?auto_203508 ) ) ( not ( = ?auto_203511 ?auto_203508 ) ) ( HOLDING ?auto_203507 ) ( CLEAR ?auto_203511 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_203504 ?auto_203505 ?auto_203509 ?auto_203512 ?auto_203506 ?auto_203511 ?auto_203507 )
      ( MAKE-2PILE ?auto_203504 ?auto_203505 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_203513 - BLOCK
      ?auto_203514 - BLOCK
    )
    :vars
    (
      ?auto_203521 - BLOCK
      ?auto_203519 - BLOCK
      ?auto_203516 - BLOCK
      ?auto_203520 - BLOCK
      ?auto_203518 - BLOCK
      ?auto_203515 - BLOCK
      ?auto_203517 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_203521 ?auto_203514 ) ( ON-TABLE ?auto_203513 ) ( ON ?auto_203514 ?auto_203513 ) ( not ( = ?auto_203513 ?auto_203514 ) ) ( not ( = ?auto_203513 ?auto_203521 ) ) ( not ( = ?auto_203514 ?auto_203521 ) ) ( not ( = ?auto_203513 ?auto_203519 ) ) ( not ( = ?auto_203513 ?auto_203516 ) ) ( not ( = ?auto_203514 ?auto_203519 ) ) ( not ( = ?auto_203514 ?auto_203516 ) ) ( not ( = ?auto_203521 ?auto_203519 ) ) ( not ( = ?auto_203521 ?auto_203516 ) ) ( not ( = ?auto_203519 ?auto_203516 ) ) ( ON ?auto_203519 ?auto_203521 ) ( not ( = ?auto_203520 ?auto_203518 ) ) ( not ( = ?auto_203520 ?auto_203515 ) ) ( not ( = ?auto_203520 ?auto_203516 ) ) ( not ( = ?auto_203518 ?auto_203515 ) ) ( not ( = ?auto_203518 ?auto_203516 ) ) ( not ( = ?auto_203515 ?auto_203516 ) ) ( not ( = ?auto_203513 ?auto_203515 ) ) ( not ( = ?auto_203513 ?auto_203520 ) ) ( not ( = ?auto_203513 ?auto_203518 ) ) ( not ( = ?auto_203514 ?auto_203515 ) ) ( not ( = ?auto_203514 ?auto_203520 ) ) ( not ( = ?auto_203514 ?auto_203518 ) ) ( not ( = ?auto_203521 ?auto_203515 ) ) ( not ( = ?auto_203521 ?auto_203520 ) ) ( not ( = ?auto_203521 ?auto_203518 ) ) ( not ( = ?auto_203519 ?auto_203515 ) ) ( not ( = ?auto_203519 ?auto_203520 ) ) ( not ( = ?auto_203519 ?auto_203518 ) ) ( ON ?auto_203516 ?auto_203519 ) ( ON ?auto_203515 ?auto_203516 ) ( ON ?auto_203520 ?auto_203517 ) ( not ( = ?auto_203513 ?auto_203517 ) ) ( not ( = ?auto_203514 ?auto_203517 ) ) ( not ( = ?auto_203521 ?auto_203517 ) ) ( not ( = ?auto_203519 ?auto_203517 ) ) ( not ( = ?auto_203516 ?auto_203517 ) ) ( not ( = ?auto_203520 ?auto_203517 ) ) ( not ( = ?auto_203518 ?auto_203517 ) ) ( not ( = ?auto_203515 ?auto_203517 ) ) ( CLEAR ?auto_203515 ) ( ON ?auto_203518 ?auto_203520 ) ( CLEAR ?auto_203518 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_203517 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_203517 ?auto_203520 )
      ( MAKE-2PILE ?auto_203513 ?auto_203514 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_203522 - BLOCK
      ?auto_203523 - BLOCK
    )
    :vars
    (
      ?auto_203526 - BLOCK
      ?auto_203530 - BLOCK
      ?auto_203525 - BLOCK
      ?auto_203524 - BLOCK
      ?auto_203527 - BLOCK
      ?auto_203529 - BLOCK
      ?auto_203528 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_203526 ?auto_203523 ) ( ON-TABLE ?auto_203522 ) ( ON ?auto_203523 ?auto_203522 ) ( not ( = ?auto_203522 ?auto_203523 ) ) ( not ( = ?auto_203522 ?auto_203526 ) ) ( not ( = ?auto_203523 ?auto_203526 ) ) ( not ( = ?auto_203522 ?auto_203530 ) ) ( not ( = ?auto_203522 ?auto_203525 ) ) ( not ( = ?auto_203523 ?auto_203530 ) ) ( not ( = ?auto_203523 ?auto_203525 ) ) ( not ( = ?auto_203526 ?auto_203530 ) ) ( not ( = ?auto_203526 ?auto_203525 ) ) ( not ( = ?auto_203530 ?auto_203525 ) ) ( ON ?auto_203530 ?auto_203526 ) ( not ( = ?auto_203524 ?auto_203527 ) ) ( not ( = ?auto_203524 ?auto_203529 ) ) ( not ( = ?auto_203524 ?auto_203525 ) ) ( not ( = ?auto_203527 ?auto_203529 ) ) ( not ( = ?auto_203527 ?auto_203525 ) ) ( not ( = ?auto_203529 ?auto_203525 ) ) ( not ( = ?auto_203522 ?auto_203529 ) ) ( not ( = ?auto_203522 ?auto_203524 ) ) ( not ( = ?auto_203522 ?auto_203527 ) ) ( not ( = ?auto_203523 ?auto_203529 ) ) ( not ( = ?auto_203523 ?auto_203524 ) ) ( not ( = ?auto_203523 ?auto_203527 ) ) ( not ( = ?auto_203526 ?auto_203529 ) ) ( not ( = ?auto_203526 ?auto_203524 ) ) ( not ( = ?auto_203526 ?auto_203527 ) ) ( not ( = ?auto_203530 ?auto_203529 ) ) ( not ( = ?auto_203530 ?auto_203524 ) ) ( not ( = ?auto_203530 ?auto_203527 ) ) ( ON ?auto_203525 ?auto_203530 ) ( ON ?auto_203524 ?auto_203528 ) ( not ( = ?auto_203522 ?auto_203528 ) ) ( not ( = ?auto_203523 ?auto_203528 ) ) ( not ( = ?auto_203526 ?auto_203528 ) ) ( not ( = ?auto_203530 ?auto_203528 ) ) ( not ( = ?auto_203525 ?auto_203528 ) ) ( not ( = ?auto_203524 ?auto_203528 ) ) ( not ( = ?auto_203527 ?auto_203528 ) ) ( not ( = ?auto_203529 ?auto_203528 ) ) ( ON ?auto_203527 ?auto_203524 ) ( CLEAR ?auto_203527 ) ( ON-TABLE ?auto_203528 ) ( HOLDING ?auto_203529 ) ( CLEAR ?auto_203525 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_203522 ?auto_203523 ?auto_203526 ?auto_203530 ?auto_203525 ?auto_203529 )
      ( MAKE-2PILE ?auto_203522 ?auto_203523 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_203531 - BLOCK
      ?auto_203532 - BLOCK
    )
    :vars
    (
      ?auto_203535 - BLOCK
      ?auto_203533 - BLOCK
      ?auto_203538 - BLOCK
      ?auto_203534 - BLOCK
      ?auto_203537 - BLOCK
      ?auto_203536 - BLOCK
      ?auto_203539 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_203535 ?auto_203532 ) ( ON-TABLE ?auto_203531 ) ( ON ?auto_203532 ?auto_203531 ) ( not ( = ?auto_203531 ?auto_203532 ) ) ( not ( = ?auto_203531 ?auto_203535 ) ) ( not ( = ?auto_203532 ?auto_203535 ) ) ( not ( = ?auto_203531 ?auto_203533 ) ) ( not ( = ?auto_203531 ?auto_203538 ) ) ( not ( = ?auto_203532 ?auto_203533 ) ) ( not ( = ?auto_203532 ?auto_203538 ) ) ( not ( = ?auto_203535 ?auto_203533 ) ) ( not ( = ?auto_203535 ?auto_203538 ) ) ( not ( = ?auto_203533 ?auto_203538 ) ) ( ON ?auto_203533 ?auto_203535 ) ( not ( = ?auto_203534 ?auto_203537 ) ) ( not ( = ?auto_203534 ?auto_203536 ) ) ( not ( = ?auto_203534 ?auto_203538 ) ) ( not ( = ?auto_203537 ?auto_203536 ) ) ( not ( = ?auto_203537 ?auto_203538 ) ) ( not ( = ?auto_203536 ?auto_203538 ) ) ( not ( = ?auto_203531 ?auto_203536 ) ) ( not ( = ?auto_203531 ?auto_203534 ) ) ( not ( = ?auto_203531 ?auto_203537 ) ) ( not ( = ?auto_203532 ?auto_203536 ) ) ( not ( = ?auto_203532 ?auto_203534 ) ) ( not ( = ?auto_203532 ?auto_203537 ) ) ( not ( = ?auto_203535 ?auto_203536 ) ) ( not ( = ?auto_203535 ?auto_203534 ) ) ( not ( = ?auto_203535 ?auto_203537 ) ) ( not ( = ?auto_203533 ?auto_203536 ) ) ( not ( = ?auto_203533 ?auto_203534 ) ) ( not ( = ?auto_203533 ?auto_203537 ) ) ( ON ?auto_203538 ?auto_203533 ) ( ON ?auto_203534 ?auto_203539 ) ( not ( = ?auto_203531 ?auto_203539 ) ) ( not ( = ?auto_203532 ?auto_203539 ) ) ( not ( = ?auto_203535 ?auto_203539 ) ) ( not ( = ?auto_203533 ?auto_203539 ) ) ( not ( = ?auto_203538 ?auto_203539 ) ) ( not ( = ?auto_203534 ?auto_203539 ) ) ( not ( = ?auto_203537 ?auto_203539 ) ) ( not ( = ?auto_203536 ?auto_203539 ) ) ( ON ?auto_203537 ?auto_203534 ) ( ON-TABLE ?auto_203539 ) ( CLEAR ?auto_203538 ) ( ON ?auto_203536 ?auto_203537 ) ( CLEAR ?auto_203536 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_203539 ?auto_203534 ?auto_203537 )
      ( MAKE-2PILE ?auto_203531 ?auto_203532 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_203540 - BLOCK
      ?auto_203541 - BLOCK
    )
    :vars
    (
      ?auto_203546 - BLOCK
      ?auto_203543 - BLOCK
      ?auto_203542 - BLOCK
      ?auto_203544 - BLOCK
      ?auto_203547 - BLOCK
      ?auto_203545 - BLOCK
      ?auto_203548 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_203546 ?auto_203541 ) ( ON-TABLE ?auto_203540 ) ( ON ?auto_203541 ?auto_203540 ) ( not ( = ?auto_203540 ?auto_203541 ) ) ( not ( = ?auto_203540 ?auto_203546 ) ) ( not ( = ?auto_203541 ?auto_203546 ) ) ( not ( = ?auto_203540 ?auto_203543 ) ) ( not ( = ?auto_203540 ?auto_203542 ) ) ( not ( = ?auto_203541 ?auto_203543 ) ) ( not ( = ?auto_203541 ?auto_203542 ) ) ( not ( = ?auto_203546 ?auto_203543 ) ) ( not ( = ?auto_203546 ?auto_203542 ) ) ( not ( = ?auto_203543 ?auto_203542 ) ) ( ON ?auto_203543 ?auto_203546 ) ( not ( = ?auto_203544 ?auto_203547 ) ) ( not ( = ?auto_203544 ?auto_203545 ) ) ( not ( = ?auto_203544 ?auto_203542 ) ) ( not ( = ?auto_203547 ?auto_203545 ) ) ( not ( = ?auto_203547 ?auto_203542 ) ) ( not ( = ?auto_203545 ?auto_203542 ) ) ( not ( = ?auto_203540 ?auto_203545 ) ) ( not ( = ?auto_203540 ?auto_203544 ) ) ( not ( = ?auto_203540 ?auto_203547 ) ) ( not ( = ?auto_203541 ?auto_203545 ) ) ( not ( = ?auto_203541 ?auto_203544 ) ) ( not ( = ?auto_203541 ?auto_203547 ) ) ( not ( = ?auto_203546 ?auto_203545 ) ) ( not ( = ?auto_203546 ?auto_203544 ) ) ( not ( = ?auto_203546 ?auto_203547 ) ) ( not ( = ?auto_203543 ?auto_203545 ) ) ( not ( = ?auto_203543 ?auto_203544 ) ) ( not ( = ?auto_203543 ?auto_203547 ) ) ( ON ?auto_203544 ?auto_203548 ) ( not ( = ?auto_203540 ?auto_203548 ) ) ( not ( = ?auto_203541 ?auto_203548 ) ) ( not ( = ?auto_203546 ?auto_203548 ) ) ( not ( = ?auto_203543 ?auto_203548 ) ) ( not ( = ?auto_203542 ?auto_203548 ) ) ( not ( = ?auto_203544 ?auto_203548 ) ) ( not ( = ?auto_203547 ?auto_203548 ) ) ( not ( = ?auto_203545 ?auto_203548 ) ) ( ON ?auto_203547 ?auto_203544 ) ( ON-TABLE ?auto_203548 ) ( ON ?auto_203545 ?auto_203547 ) ( CLEAR ?auto_203545 ) ( HOLDING ?auto_203542 ) ( CLEAR ?auto_203543 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_203540 ?auto_203541 ?auto_203546 ?auto_203543 ?auto_203542 )
      ( MAKE-2PILE ?auto_203540 ?auto_203541 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_203549 - BLOCK
      ?auto_203550 - BLOCK
    )
    :vars
    (
      ?auto_203556 - BLOCK
      ?auto_203557 - BLOCK
      ?auto_203552 - BLOCK
      ?auto_203553 - BLOCK
      ?auto_203554 - BLOCK
      ?auto_203551 - BLOCK
      ?auto_203555 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_203556 ?auto_203550 ) ( ON-TABLE ?auto_203549 ) ( ON ?auto_203550 ?auto_203549 ) ( not ( = ?auto_203549 ?auto_203550 ) ) ( not ( = ?auto_203549 ?auto_203556 ) ) ( not ( = ?auto_203550 ?auto_203556 ) ) ( not ( = ?auto_203549 ?auto_203557 ) ) ( not ( = ?auto_203549 ?auto_203552 ) ) ( not ( = ?auto_203550 ?auto_203557 ) ) ( not ( = ?auto_203550 ?auto_203552 ) ) ( not ( = ?auto_203556 ?auto_203557 ) ) ( not ( = ?auto_203556 ?auto_203552 ) ) ( not ( = ?auto_203557 ?auto_203552 ) ) ( ON ?auto_203557 ?auto_203556 ) ( not ( = ?auto_203553 ?auto_203554 ) ) ( not ( = ?auto_203553 ?auto_203551 ) ) ( not ( = ?auto_203553 ?auto_203552 ) ) ( not ( = ?auto_203554 ?auto_203551 ) ) ( not ( = ?auto_203554 ?auto_203552 ) ) ( not ( = ?auto_203551 ?auto_203552 ) ) ( not ( = ?auto_203549 ?auto_203551 ) ) ( not ( = ?auto_203549 ?auto_203553 ) ) ( not ( = ?auto_203549 ?auto_203554 ) ) ( not ( = ?auto_203550 ?auto_203551 ) ) ( not ( = ?auto_203550 ?auto_203553 ) ) ( not ( = ?auto_203550 ?auto_203554 ) ) ( not ( = ?auto_203556 ?auto_203551 ) ) ( not ( = ?auto_203556 ?auto_203553 ) ) ( not ( = ?auto_203556 ?auto_203554 ) ) ( not ( = ?auto_203557 ?auto_203551 ) ) ( not ( = ?auto_203557 ?auto_203553 ) ) ( not ( = ?auto_203557 ?auto_203554 ) ) ( ON ?auto_203553 ?auto_203555 ) ( not ( = ?auto_203549 ?auto_203555 ) ) ( not ( = ?auto_203550 ?auto_203555 ) ) ( not ( = ?auto_203556 ?auto_203555 ) ) ( not ( = ?auto_203557 ?auto_203555 ) ) ( not ( = ?auto_203552 ?auto_203555 ) ) ( not ( = ?auto_203553 ?auto_203555 ) ) ( not ( = ?auto_203554 ?auto_203555 ) ) ( not ( = ?auto_203551 ?auto_203555 ) ) ( ON ?auto_203554 ?auto_203553 ) ( ON-TABLE ?auto_203555 ) ( ON ?auto_203551 ?auto_203554 ) ( CLEAR ?auto_203557 ) ( ON ?auto_203552 ?auto_203551 ) ( CLEAR ?auto_203552 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_203555 ?auto_203553 ?auto_203554 ?auto_203551 )
      ( MAKE-2PILE ?auto_203549 ?auto_203550 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_203558 - BLOCK
      ?auto_203559 - BLOCK
    )
    :vars
    (
      ?auto_203563 - BLOCK
      ?auto_203565 - BLOCK
      ?auto_203564 - BLOCK
      ?auto_203566 - BLOCK
      ?auto_203562 - BLOCK
      ?auto_203561 - BLOCK
      ?auto_203560 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_203563 ?auto_203559 ) ( ON-TABLE ?auto_203558 ) ( ON ?auto_203559 ?auto_203558 ) ( not ( = ?auto_203558 ?auto_203559 ) ) ( not ( = ?auto_203558 ?auto_203563 ) ) ( not ( = ?auto_203559 ?auto_203563 ) ) ( not ( = ?auto_203558 ?auto_203565 ) ) ( not ( = ?auto_203558 ?auto_203564 ) ) ( not ( = ?auto_203559 ?auto_203565 ) ) ( not ( = ?auto_203559 ?auto_203564 ) ) ( not ( = ?auto_203563 ?auto_203565 ) ) ( not ( = ?auto_203563 ?auto_203564 ) ) ( not ( = ?auto_203565 ?auto_203564 ) ) ( not ( = ?auto_203566 ?auto_203562 ) ) ( not ( = ?auto_203566 ?auto_203561 ) ) ( not ( = ?auto_203566 ?auto_203564 ) ) ( not ( = ?auto_203562 ?auto_203561 ) ) ( not ( = ?auto_203562 ?auto_203564 ) ) ( not ( = ?auto_203561 ?auto_203564 ) ) ( not ( = ?auto_203558 ?auto_203561 ) ) ( not ( = ?auto_203558 ?auto_203566 ) ) ( not ( = ?auto_203558 ?auto_203562 ) ) ( not ( = ?auto_203559 ?auto_203561 ) ) ( not ( = ?auto_203559 ?auto_203566 ) ) ( not ( = ?auto_203559 ?auto_203562 ) ) ( not ( = ?auto_203563 ?auto_203561 ) ) ( not ( = ?auto_203563 ?auto_203566 ) ) ( not ( = ?auto_203563 ?auto_203562 ) ) ( not ( = ?auto_203565 ?auto_203561 ) ) ( not ( = ?auto_203565 ?auto_203566 ) ) ( not ( = ?auto_203565 ?auto_203562 ) ) ( ON ?auto_203566 ?auto_203560 ) ( not ( = ?auto_203558 ?auto_203560 ) ) ( not ( = ?auto_203559 ?auto_203560 ) ) ( not ( = ?auto_203563 ?auto_203560 ) ) ( not ( = ?auto_203565 ?auto_203560 ) ) ( not ( = ?auto_203564 ?auto_203560 ) ) ( not ( = ?auto_203566 ?auto_203560 ) ) ( not ( = ?auto_203562 ?auto_203560 ) ) ( not ( = ?auto_203561 ?auto_203560 ) ) ( ON ?auto_203562 ?auto_203566 ) ( ON-TABLE ?auto_203560 ) ( ON ?auto_203561 ?auto_203562 ) ( ON ?auto_203564 ?auto_203561 ) ( CLEAR ?auto_203564 ) ( HOLDING ?auto_203565 ) ( CLEAR ?auto_203563 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_203558 ?auto_203559 ?auto_203563 ?auto_203565 )
      ( MAKE-2PILE ?auto_203558 ?auto_203559 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_203567 - BLOCK
      ?auto_203568 - BLOCK
    )
    :vars
    (
      ?auto_203574 - BLOCK
      ?auto_203570 - BLOCK
      ?auto_203569 - BLOCK
      ?auto_203571 - BLOCK
      ?auto_203572 - BLOCK
      ?auto_203575 - BLOCK
      ?auto_203573 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_203574 ?auto_203568 ) ( ON-TABLE ?auto_203567 ) ( ON ?auto_203568 ?auto_203567 ) ( not ( = ?auto_203567 ?auto_203568 ) ) ( not ( = ?auto_203567 ?auto_203574 ) ) ( not ( = ?auto_203568 ?auto_203574 ) ) ( not ( = ?auto_203567 ?auto_203570 ) ) ( not ( = ?auto_203567 ?auto_203569 ) ) ( not ( = ?auto_203568 ?auto_203570 ) ) ( not ( = ?auto_203568 ?auto_203569 ) ) ( not ( = ?auto_203574 ?auto_203570 ) ) ( not ( = ?auto_203574 ?auto_203569 ) ) ( not ( = ?auto_203570 ?auto_203569 ) ) ( not ( = ?auto_203571 ?auto_203572 ) ) ( not ( = ?auto_203571 ?auto_203575 ) ) ( not ( = ?auto_203571 ?auto_203569 ) ) ( not ( = ?auto_203572 ?auto_203575 ) ) ( not ( = ?auto_203572 ?auto_203569 ) ) ( not ( = ?auto_203575 ?auto_203569 ) ) ( not ( = ?auto_203567 ?auto_203575 ) ) ( not ( = ?auto_203567 ?auto_203571 ) ) ( not ( = ?auto_203567 ?auto_203572 ) ) ( not ( = ?auto_203568 ?auto_203575 ) ) ( not ( = ?auto_203568 ?auto_203571 ) ) ( not ( = ?auto_203568 ?auto_203572 ) ) ( not ( = ?auto_203574 ?auto_203575 ) ) ( not ( = ?auto_203574 ?auto_203571 ) ) ( not ( = ?auto_203574 ?auto_203572 ) ) ( not ( = ?auto_203570 ?auto_203575 ) ) ( not ( = ?auto_203570 ?auto_203571 ) ) ( not ( = ?auto_203570 ?auto_203572 ) ) ( ON ?auto_203571 ?auto_203573 ) ( not ( = ?auto_203567 ?auto_203573 ) ) ( not ( = ?auto_203568 ?auto_203573 ) ) ( not ( = ?auto_203574 ?auto_203573 ) ) ( not ( = ?auto_203570 ?auto_203573 ) ) ( not ( = ?auto_203569 ?auto_203573 ) ) ( not ( = ?auto_203571 ?auto_203573 ) ) ( not ( = ?auto_203572 ?auto_203573 ) ) ( not ( = ?auto_203575 ?auto_203573 ) ) ( ON ?auto_203572 ?auto_203571 ) ( ON-TABLE ?auto_203573 ) ( ON ?auto_203575 ?auto_203572 ) ( ON ?auto_203569 ?auto_203575 ) ( CLEAR ?auto_203574 ) ( ON ?auto_203570 ?auto_203569 ) ( CLEAR ?auto_203570 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_203573 ?auto_203571 ?auto_203572 ?auto_203575 ?auto_203569 )
      ( MAKE-2PILE ?auto_203567 ?auto_203568 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_203594 - BLOCK
      ?auto_203595 - BLOCK
    )
    :vars
    (
      ?auto_203599 - BLOCK
      ?auto_203601 - BLOCK
      ?auto_203597 - BLOCK
      ?auto_203600 - BLOCK
      ?auto_203598 - BLOCK
      ?auto_203596 - BLOCK
      ?auto_203602 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_203594 ) ( not ( = ?auto_203594 ?auto_203595 ) ) ( not ( = ?auto_203594 ?auto_203599 ) ) ( not ( = ?auto_203595 ?auto_203599 ) ) ( not ( = ?auto_203594 ?auto_203601 ) ) ( not ( = ?auto_203594 ?auto_203597 ) ) ( not ( = ?auto_203595 ?auto_203601 ) ) ( not ( = ?auto_203595 ?auto_203597 ) ) ( not ( = ?auto_203599 ?auto_203601 ) ) ( not ( = ?auto_203599 ?auto_203597 ) ) ( not ( = ?auto_203601 ?auto_203597 ) ) ( not ( = ?auto_203600 ?auto_203598 ) ) ( not ( = ?auto_203600 ?auto_203596 ) ) ( not ( = ?auto_203600 ?auto_203597 ) ) ( not ( = ?auto_203598 ?auto_203596 ) ) ( not ( = ?auto_203598 ?auto_203597 ) ) ( not ( = ?auto_203596 ?auto_203597 ) ) ( not ( = ?auto_203594 ?auto_203596 ) ) ( not ( = ?auto_203594 ?auto_203600 ) ) ( not ( = ?auto_203594 ?auto_203598 ) ) ( not ( = ?auto_203595 ?auto_203596 ) ) ( not ( = ?auto_203595 ?auto_203600 ) ) ( not ( = ?auto_203595 ?auto_203598 ) ) ( not ( = ?auto_203599 ?auto_203596 ) ) ( not ( = ?auto_203599 ?auto_203600 ) ) ( not ( = ?auto_203599 ?auto_203598 ) ) ( not ( = ?auto_203601 ?auto_203596 ) ) ( not ( = ?auto_203601 ?auto_203600 ) ) ( not ( = ?auto_203601 ?auto_203598 ) ) ( ON ?auto_203600 ?auto_203602 ) ( not ( = ?auto_203594 ?auto_203602 ) ) ( not ( = ?auto_203595 ?auto_203602 ) ) ( not ( = ?auto_203599 ?auto_203602 ) ) ( not ( = ?auto_203601 ?auto_203602 ) ) ( not ( = ?auto_203597 ?auto_203602 ) ) ( not ( = ?auto_203600 ?auto_203602 ) ) ( not ( = ?auto_203598 ?auto_203602 ) ) ( not ( = ?auto_203596 ?auto_203602 ) ) ( ON ?auto_203598 ?auto_203600 ) ( ON-TABLE ?auto_203602 ) ( ON ?auto_203596 ?auto_203598 ) ( ON ?auto_203597 ?auto_203596 ) ( ON ?auto_203601 ?auto_203597 ) ( ON ?auto_203599 ?auto_203601 ) ( CLEAR ?auto_203599 ) ( HOLDING ?auto_203595 ) ( CLEAR ?auto_203594 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_203594 ?auto_203595 ?auto_203599 )
      ( MAKE-2PILE ?auto_203594 ?auto_203595 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_203603 - BLOCK
      ?auto_203604 - BLOCK
    )
    :vars
    (
      ?auto_203609 - BLOCK
      ?auto_203606 - BLOCK
      ?auto_203607 - BLOCK
      ?auto_203605 - BLOCK
      ?auto_203611 - BLOCK
      ?auto_203608 - BLOCK
      ?auto_203610 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_203603 ) ( not ( = ?auto_203603 ?auto_203604 ) ) ( not ( = ?auto_203603 ?auto_203609 ) ) ( not ( = ?auto_203604 ?auto_203609 ) ) ( not ( = ?auto_203603 ?auto_203606 ) ) ( not ( = ?auto_203603 ?auto_203607 ) ) ( not ( = ?auto_203604 ?auto_203606 ) ) ( not ( = ?auto_203604 ?auto_203607 ) ) ( not ( = ?auto_203609 ?auto_203606 ) ) ( not ( = ?auto_203609 ?auto_203607 ) ) ( not ( = ?auto_203606 ?auto_203607 ) ) ( not ( = ?auto_203605 ?auto_203611 ) ) ( not ( = ?auto_203605 ?auto_203608 ) ) ( not ( = ?auto_203605 ?auto_203607 ) ) ( not ( = ?auto_203611 ?auto_203608 ) ) ( not ( = ?auto_203611 ?auto_203607 ) ) ( not ( = ?auto_203608 ?auto_203607 ) ) ( not ( = ?auto_203603 ?auto_203608 ) ) ( not ( = ?auto_203603 ?auto_203605 ) ) ( not ( = ?auto_203603 ?auto_203611 ) ) ( not ( = ?auto_203604 ?auto_203608 ) ) ( not ( = ?auto_203604 ?auto_203605 ) ) ( not ( = ?auto_203604 ?auto_203611 ) ) ( not ( = ?auto_203609 ?auto_203608 ) ) ( not ( = ?auto_203609 ?auto_203605 ) ) ( not ( = ?auto_203609 ?auto_203611 ) ) ( not ( = ?auto_203606 ?auto_203608 ) ) ( not ( = ?auto_203606 ?auto_203605 ) ) ( not ( = ?auto_203606 ?auto_203611 ) ) ( ON ?auto_203605 ?auto_203610 ) ( not ( = ?auto_203603 ?auto_203610 ) ) ( not ( = ?auto_203604 ?auto_203610 ) ) ( not ( = ?auto_203609 ?auto_203610 ) ) ( not ( = ?auto_203606 ?auto_203610 ) ) ( not ( = ?auto_203607 ?auto_203610 ) ) ( not ( = ?auto_203605 ?auto_203610 ) ) ( not ( = ?auto_203611 ?auto_203610 ) ) ( not ( = ?auto_203608 ?auto_203610 ) ) ( ON ?auto_203611 ?auto_203605 ) ( ON-TABLE ?auto_203610 ) ( ON ?auto_203608 ?auto_203611 ) ( ON ?auto_203607 ?auto_203608 ) ( ON ?auto_203606 ?auto_203607 ) ( ON ?auto_203609 ?auto_203606 ) ( CLEAR ?auto_203603 ) ( ON ?auto_203604 ?auto_203609 ) ( CLEAR ?auto_203604 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_203610 ?auto_203605 ?auto_203611 ?auto_203608 ?auto_203607 ?auto_203606 ?auto_203609 )
      ( MAKE-2PILE ?auto_203603 ?auto_203604 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_203612 - BLOCK
      ?auto_203613 - BLOCK
    )
    :vars
    (
      ?auto_203617 - BLOCK
      ?auto_203619 - BLOCK
      ?auto_203615 - BLOCK
      ?auto_203620 - BLOCK
      ?auto_203614 - BLOCK
      ?auto_203616 - BLOCK
      ?auto_203618 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_203612 ?auto_203613 ) ) ( not ( = ?auto_203612 ?auto_203617 ) ) ( not ( = ?auto_203613 ?auto_203617 ) ) ( not ( = ?auto_203612 ?auto_203619 ) ) ( not ( = ?auto_203612 ?auto_203615 ) ) ( not ( = ?auto_203613 ?auto_203619 ) ) ( not ( = ?auto_203613 ?auto_203615 ) ) ( not ( = ?auto_203617 ?auto_203619 ) ) ( not ( = ?auto_203617 ?auto_203615 ) ) ( not ( = ?auto_203619 ?auto_203615 ) ) ( not ( = ?auto_203620 ?auto_203614 ) ) ( not ( = ?auto_203620 ?auto_203616 ) ) ( not ( = ?auto_203620 ?auto_203615 ) ) ( not ( = ?auto_203614 ?auto_203616 ) ) ( not ( = ?auto_203614 ?auto_203615 ) ) ( not ( = ?auto_203616 ?auto_203615 ) ) ( not ( = ?auto_203612 ?auto_203616 ) ) ( not ( = ?auto_203612 ?auto_203620 ) ) ( not ( = ?auto_203612 ?auto_203614 ) ) ( not ( = ?auto_203613 ?auto_203616 ) ) ( not ( = ?auto_203613 ?auto_203620 ) ) ( not ( = ?auto_203613 ?auto_203614 ) ) ( not ( = ?auto_203617 ?auto_203616 ) ) ( not ( = ?auto_203617 ?auto_203620 ) ) ( not ( = ?auto_203617 ?auto_203614 ) ) ( not ( = ?auto_203619 ?auto_203616 ) ) ( not ( = ?auto_203619 ?auto_203620 ) ) ( not ( = ?auto_203619 ?auto_203614 ) ) ( ON ?auto_203620 ?auto_203618 ) ( not ( = ?auto_203612 ?auto_203618 ) ) ( not ( = ?auto_203613 ?auto_203618 ) ) ( not ( = ?auto_203617 ?auto_203618 ) ) ( not ( = ?auto_203619 ?auto_203618 ) ) ( not ( = ?auto_203615 ?auto_203618 ) ) ( not ( = ?auto_203620 ?auto_203618 ) ) ( not ( = ?auto_203614 ?auto_203618 ) ) ( not ( = ?auto_203616 ?auto_203618 ) ) ( ON ?auto_203614 ?auto_203620 ) ( ON-TABLE ?auto_203618 ) ( ON ?auto_203616 ?auto_203614 ) ( ON ?auto_203615 ?auto_203616 ) ( ON ?auto_203619 ?auto_203615 ) ( ON ?auto_203617 ?auto_203619 ) ( ON ?auto_203613 ?auto_203617 ) ( CLEAR ?auto_203613 ) ( HOLDING ?auto_203612 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_203612 )
      ( MAKE-2PILE ?auto_203612 ?auto_203613 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_203621 - BLOCK
      ?auto_203622 - BLOCK
    )
    :vars
    (
      ?auto_203623 - BLOCK
      ?auto_203628 - BLOCK
      ?auto_203625 - BLOCK
      ?auto_203624 - BLOCK
      ?auto_203627 - BLOCK
      ?auto_203626 - BLOCK
      ?auto_203629 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_203621 ?auto_203622 ) ) ( not ( = ?auto_203621 ?auto_203623 ) ) ( not ( = ?auto_203622 ?auto_203623 ) ) ( not ( = ?auto_203621 ?auto_203628 ) ) ( not ( = ?auto_203621 ?auto_203625 ) ) ( not ( = ?auto_203622 ?auto_203628 ) ) ( not ( = ?auto_203622 ?auto_203625 ) ) ( not ( = ?auto_203623 ?auto_203628 ) ) ( not ( = ?auto_203623 ?auto_203625 ) ) ( not ( = ?auto_203628 ?auto_203625 ) ) ( not ( = ?auto_203624 ?auto_203627 ) ) ( not ( = ?auto_203624 ?auto_203626 ) ) ( not ( = ?auto_203624 ?auto_203625 ) ) ( not ( = ?auto_203627 ?auto_203626 ) ) ( not ( = ?auto_203627 ?auto_203625 ) ) ( not ( = ?auto_203626 ?auto_203625 ) ) ( not ( = ?auto_203621 ?auto_203626 ) ) ( not ( = ?auto_203621 ?auto_203624 ) ) ( not ( = ?auto_203621 ?auto_203627 ) ) ( not ( = ?auto_203622 ?auto_203626 ) ) ( not ( = ?auto_203622 ?auto_203624 ) ) ( not ( = ?auto_203622 ?auto_203627 ) ) ( not ( = ?auto_203623 ?auto_203626 ) ) ( not ( = ?auto_203623 ?auto_203624 ) ) ( not ( = ?auto_203623 ?auto_203627 ) ) ( not ( = ?auto_203628 ?auto_203626 ) ) ( not ( = ?auto_203628 ?auto_203624 ) ) ( not ( = ?auto_203628 ?auto_203627 ) ) ( ON ?auto_203624 ?auto_203629 ) ( not ( = ?auto_203621 ?auto_203629 ) ) ( not ( = ?auto_203622 ?auto_203629 ) ) ( not ( = ?auto_203623 ?auto_203629 ) ) ( not ( = ?auto_203628 ?auto_203629 ) ) ( not ( = ?auto_203625 ?auto_203629 ) ) ( not ( = ?auto_203624 ?auto_203629 ) ) ( not ( = ?auto_203627 ?auto_203629 ) ) ( not ( = ?auto_203626 ?auto_203629 ) ) ( ON ?auto_203627 ?auto_203624 ) ( ON-TABLE ?auto_203629 ) ( ON ?auto_203626 ?auto_203627 ) ( ON ?auto_203625 ?auto_203626 ) ( ON ?auto_203628 ?auto_203625 ) ( ON ?auto_203623 ?auto_203628 ) ( ON ?auto_203622 ?auto_203623 ) ( ON ?auto_203621 ?auto_203622 ) ( CLEAR ?auto_203621 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_203629 ?auto_203624 ?auto_203627 ?auto_203626 ?auto_203625 ?auto_203628 ?auto_203623 ?auto_203622 )
      ( MAKE-2PILE ?auto_203621 ?auto_203622 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_203636 - BLOCK
      ?auto_203637 - BLOCK
      ?auto_203638 - BLOCK
      ?auto_203639 - BLOCK
      ?auto_203640 - BLOCK
      ?auto_203641 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_203641 ) ( CLEAR ?auto_203640 ) ( ON-TABLE ?auto_203636 ) ( ON ?auto_203637 ?auto_203636 ) ( ON ?auto_203638 ?auto_203637 ) ( ON ?auto_203639 ?auto_203638 ) ( ON ?auto_203640 ?auto_203639 ) ( not ( = ?auto_203636 ?auto_203637 ) ) ( not ( = ?auto_203636 ?auto_203638 ) ) ( not ( = ?auto_203636 ?auto_203639 ) ) ( not ( = ?auto_203636 ?auto_203640 ) ) ( not ( = ?auto_203636 ?auto_203641 ) ) ( not ( = ?auto_203637 ?auto_203638 ) ) ( not ( = ?auto_203637 ?auto_203639 ) ) ( not ( = ?auto_203637 ?auto_203640 ) ) ( not ( = ?auto_203637 ?auto_203641 ) ) ( not ( = ?auto_203638 ?auto_203639 ) ) ( not ( = ?auto_203638 ?auto_203640 ) ) ( not ( = ?auto_203638 ?auto_203641 ) ) ( not ( = ?auto_203639 ?auto_203640 ) ) ( not ( = ?auto_203639 ?auto_203641 ) ) ( not ( = ?auto_203640 ?auto_203641 ) ) )
    :subtasks
    ( ( !STACK ?auto_203641 ?auto_203640 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_203642 - BLOCK
      ?auto_203643 - BLOCK
      ?auto_203644 - BLOCK
      ?auto_203645 - BLOCK
      ?auto_203646 - BLOCK
      ?auto_203647 - BLOCK
    )
    :vars
    (
      ?auto_203648 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_203646 ) ( ON-TABLE ?auto_203642 ) ( ON ?auto_203643 ?auto_203642 ) ( ON ?auto_203644 ?auto_203643 ) ( ON ?auto_203645 ?auto_203644 ) ( ON ?auto_203646 ?auto_203645 ) ( not ( = ?auto_203642 ?auto_203643 ) ) ( not ( = ?auto_203642 ?auto_203644 ) ) ( not ( = ?auto_203642 ?auto_203645 ) ) ( not ( = ?auto_203642 ?auto_203646 ) ) ( not ( = ?auto_203642 ?auto_203647 ) ) ( not ( = ?auto_203643 ?auto_203644 ) ) ( not ( = ?auto_203643 ?auto_203645 ) ) ( not ( = ?auto_203643 ?auto_203646 ) ) ( not ( = ?auto_203643 ?auto_203647 ) ) ( not ( = ?auto_203644 ?auto_203645 ) ) ( not ( = ?auto_203644 ?auto_203646 ) ) ( not ( = ?auto_203644 ?auto_203647 ) ) ( not ( = ?auto_203645 ?auto_203646 ) ) ( not ( = ?auto_203645 ?auto_203647 ) ) ( not ( = ?auto_203646 ?auto_203647 ) ) ( ON ?auto_203647 ?auto_203648 ) ( CLEAR ?auto_203647 ) ( HAND-EMPTY ) ( not ( = ?auto_203642 ?auto_203648 ) ) ( not ( = ?auto_203643 ?auto_203648 ) ) ( not ( = ?auto_203644 ?auto_203648 ) ) ( not ( = ?auto_203645 ?auto_203648 ) ) ( not ( = ?auto_203646 ?auto_203648 ) ) ( not ( = ?auto_203647 ?auto_203648 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_203647 ?auto_203648 )
      ( MAKE-6PILE ?auto_203642 ?auto_203643 ?auto_203644 ?auto_203645 ?auto_203646 ?auto_203647 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_203649 - BLOCK
      ?auto_203650 - BLOCK
      ?auto_203651 - BLOCK
      ?auto_203652 - BLOCK
      ?auto_203653 - BLOCK
      ?auto_203654 - BLOCK
    )
    :vars
    (
      ?auto_203655 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_203649 ) ( ON ?auto_203650 ?auto_203649 ) ( ON ?auto_203651 ?auto_203650 ) ( ON ?auto_203652 ?auto_203651 ) ( not ( = ?auto_203649 ?auto_203650 ) ) ( not ( = ?auto_203649 ?auto_203651 ) ) ( not ( = ?auto_203649 ?auto_203652 ) ) ( not ( = ?auto_203649 ?auto_203653 ) ) ( not ( = ?auto_203649 ?auto_203654 ) ) ( not ( = ?auto_203650 ?auto_203651 ) ) ( not ( = ?auto_203650 ?auto_203652 ) ) ( not ( = ?auto_203650 ?auto_203653 ) ) ( not ( = ?auto_203650 ?auto_203654 ) ) ( not ( = ?auto_203651 ?auto_203652 ) ) ( not ( = ?auto_203651 ?auto_203653 ) ) ( not ( = ?auto_203651 ?auto_203654 ) ) ( not ( = ?auto_203652 ?auto_203653 ) ) ( not ( = ?auto_203652 ?auto_203654 ) ) ( not ( = ?auto_203653 ?auto_203654 ) ) ( ON ?auto_203654 ?auto_203655 ) ( CLEAR ?auto_203654 ) ( not ( = ?auto_203649 ?auto_203655 ) ) ( not ( = ?auto_203650 ?auto_203655 ) ) ( not ( = ?auto_203651 ?auto_203655 ) ) ( not ( = ?auto_203652 ?auto_203655 ) ) ( not ( = ?auto_203653 ?auto_203655 ) ) ( not ( = ?auto_203654 ?auto_203655 ) ) ( HOLDING ?auto_203653 ) ( CLEAR ?auto_203652 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_203649 ?auto_203650 ?auto_203651 ?auto_203652 ?auto_203653 )
      ( MAKE-6PILE ?auto_203649 ?auto_203650 ?auto_203651 ?auto_203652 ?auto_203653 ?auto_203654 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_203656 - BLOCK
      ?auto_203657 - BLOCK
      ?auto_203658 - BLOCK
      ?auto_203659 - BLOCK
      ?auto_203660 - BLOCK
      ?auto_203661 - BLOCK
    )
    :vars
    (
      ?auto_203662 - BLOCK
      ?auto_203663 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_203656 ) ( ON ?auto_203657 ?auto_203656 ) ( ON ?auto_203658 ?auto_203657 ) ( ON ?auto_203659 ?auto_203658 ) ( not ( = ?auto_203656 ?auto_203657 ) ) ( not ( = ?auto_203656 ?auto_203658 ) ) ( not ( = ?auto_203656 ?auto_203659 ) ) ( not ( = ?auto_203656 ?auto_203660 ) ) ( not ( = ?auto_203656 ?auto_203661 ) ) ( not ( = ?auto_203657 ?auto_203658 ) ) ( not ( = ?auto_203657 ?auto_203659 ) ) ( not ( = ?auto_203657 ?auto_203660 ) ) ( not ( = ?auto_203657 ?auto_203661 ) ) ( not ( = ?auto_203658 ?auto_203659 ) ) ( not ( = ?auto_203658 ?auto_203660 ) ) ( not ( = ?auto_203658 ?auto_203661 ) ) ( not ( = ?auto_203659 ?auto_203660 ) ) ( not ( = ?auto_203659 ?auto_203661 ) ) ( not ( = ?auto_203660 ?auto_203661 ) ) ( ON ?auto_203661 ?auto_203662 ) ( not ( = ?auto_203656 ?auto_203662 ) ) ( not ( = ?auto_203657 ?auto_203662 ) ) ( not ( = ?auto_203658 ?auto_203662 ) ) ( not ( = ?auto_203659 ?auto_203662 ) ) ( not ( = ?auto_203660 ?auto_203662 ) ) ( not ( = ?auto_203661 ?auto_203662 ) ) ( CLEAR ?auto_203659 ) ( ON ?auto_203660 ?auto_203661 ) ( CLEAR ?auto_203660 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_203663 ) ( ON ?auto_203662 ?auto_203663 ) ( not ( = ?auto_203663 ?auto_203662 ) ) ( not ( = ?auto_203663 ?auto_203661 ) ) ( not ( = ?auto_203663 ?auto_203660 ) ) ( not ( = ?auto_203656 ?auto_203663 ) ) ( not ( = ?auto_203657 ?auto_203663 ) ) ( not ( = ?auto_203658 ?auto_203663 ) ) ( not ( = ?auto_203659 ?auto_203663 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_203663 ?auto_203662 ?auto_203661 )
      ( MAKE-6PILE ?auto_203656 ?auto_203657 ?auto_203658 ?auto_203659 ?auto_203660 ?auto_203661 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_203664 - BLOCK
      ?auto_203665 - BLOCK
      ?auto_203666 - BLOCK
      ?auto_203667 - BLOCK
      ?auto_203668 - BLOCK
      ?auto_203669 - BLOCK
    )
    :vars
    (
      ?auto_203670 - BLOCK
      ?auto_203671 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_203664 ) ( ON ?auto_203665 ?auto_203664 ) ( ON ?auto_203666 ?auto_203665 ) ( not ( = ?auto_203664 ?auto_203665 ) ) ( not ( = ?auto_203664 ?auto_203666 ) ) ( not ( = ?auto_203664 ?auto_203667 ) ) ( not ( = ?auto_203664 ?auto_203668 ) ) ( not ( = ?auto_203664 ?auto_203669 ) ) ( not ( = ?auto_203665 ?auto_203666 ) ) ( not ( = ?auto_203665 ?auto_203667 ) ) ( not ( = ?auto_203665 ?auto_203668 ) ) ( not ( = ?auto_203665 ?auto_203669 ) ) ( not ( = ?auto_203666 ?auto_203667 ) ) ( not ( = ?auto_203666 ?auto_203668 ) ) ( not ( = ?auto_203666 ?auto_203669 ) ) ( not ( = ?auto_203667 ?auto_203668 ) ) ( not ( = ?auto_203667 ?auto_203669 ) ) ( not ( = ?auto_203668 ?auto_203669 ) ) ( ON ?auto_203669 ?auto_203670 ) ( not ( = ?auto_203664 ?auto_203670 ) ) ( not ( = ?auto_203665 ?auto_203670 ) ) ( not ( = ?auto_203666 ?auto_203670 ) ) ( not ( = ?auto_203667 ?auto_203670 ) ) ( not ( = ?auto_203668 ?auto_203670 ) ) ( not ( = ?auto_203669 ?auto_203670 ) ) ( ON ?auto_203668 ?auto_203669 ) ( CLEAR ?auto_203668 ) ( ON-TABLE ?auto_203671 ) ( ON ?auto_203670 ?auto_203671 ) ( not ( = ?auto_203671 ?auto_203670 ) ) ( not ( = ?auto_203671 ?auto_203669 ) ) ( not ( = ?auto_203671 ?auto_203668 ) ) ( not ( = ?auto_203664 ?auto_203671 ) ) ( not ( = ?auto_203665 ?auto_203671 ) ) ( not ( = ?auto_203666 ?auto_203671 ) ) ( not ( = ?auto_203667 ?auto_203671 ) ) ( HOLDING ?auto_203667 ) ( CLEAR ?auto_203666 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_203664 ?auto_203665 ?auto_203666 ?auto_203667 )
      ( MAKE-6PILE ?auto_203664 ?auto_203665 ?auto_203666 ?auto_203667 ?auto_203668 ?auto_203669 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_203672 - BLOCK
      ?auto_203673 - BLOCK
      ?auto_203674 - BLOCK
      ?auto_203675 - BLOCK
      ?auto_203676 - BLOCK
      ?auto_203677 - BLOCK
    )
    :vars
    (
      ?auto_203679 - BLOCK
      ?auto_203678 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_203672 ) ( ON ?auto_203673 ?auto_203672 ) ( ON ?auto_203674 ?auto_203673 ) ( not ( = ?auto_203672 ?auto_203673 ) ) ( not ( = ?auto_203672 ?auto_203674 ) ) ( not ( = ?auto_203672 ?auto_203675 ) ) ( not ( = ?auto_203672 ?auto_203676 ) ) ( not ( = ?auto_203672 ?auto_203677 ) ) ( not ( = ?auto_203673 ?auto_203674 ) ) ( not ( = ?auto_203673 ?auto_203675 ) ) ( not ( = ?auto_203673 ?auto_203676 ) ) ( not ( = ?auto_203673 ?auto_203677 ) ) ( not ( = ?auto_203674 ?auto_203675 ) ) ( not ( = ?auto_203674 ?auto_203676 ) ) ( not ( = ?auto_203674 ?auto_203677 ) ) ( not ( = ?auto_203675 ?auto_203676 ) ) ( not ( = ?auto_203675 ?auto_203677 ) ) ( not ( = ?auto_203676 ?auto_203677 ) ) ( ON ?auto_203677 ?auto_203679 ) ( not ( = ?auto_203672 ?auto_203679 ) ) ( not ( = ?auto_203673 ?auto_203679 ) ) ( not ( = ?auto_203674 ?auto_203679 ) ) ( not ( = ?auto_203675 ?auto_203679 ) ) ( not ( = ?auto_203676 ?auto_203679 ) ) ( not ( = ?auto_203677 ?auto_203679 ) ) ( ON ?auto_203676 ?auto_203677 ) ( ON-TABLE ?auto_203678 ) ( ON ?auto_203679 ?auto_203678 ) ( not ( = ?auto_203678 ?auto_203679 ) ) ( not ( = ?auto_203678 ?auto_203677 ) ) ( not ( = ?auto_203678 ?auto_203676 ) ) ( not ( = ?auto_203672 ?auto_203678 ) ) ( not ( = ?auto_203673 ?auto_203678 ) ) ( not ( = ?auto_203674 ?auto_203678 ) ) ( not ( = ?auto_203675 ?auto_203678 ) ) ( CLEAR ?auto_203674 ) ( ON ?auto_203675 ?auto_203676 ) ( CLEAR ?auto_203675 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_203678 ?auto_203679 ?auto_203677 ?auto_203676 )
      ( MAKE-6PILE ?auto_203672 ?auto_203673 ?auto_203674 ?auto_203675 ?auto_203676 ?auto_203677 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_203680 - BLOCK
      ?auto_203681 - BLOCK
      ?auto_203682 - BLOCK
      ?auto_203683 - BLOCK
      ?auto_203684 - BLOCK
      ?auto_203685 - BLOCK
    )
    :vars
    (
      ?auto_203686 - BLOCK
      ?auto_203687 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_203680 ) ( ON ?auto_203681 ?auto_203680 ) ( not ( = ?auto_203680 ?auto_203681 ) ) ( not ( = ?auto_203680 ?auto_203682 ) ) ( not ( = ?auto_203680 ?auto_203683 ) ) ( not ( = ?auto_203680 ?auto_203684 ) ) ( not ( = ?auto_203680 ?auto_203685 ) ) ( not ( = ?auto_203681 ?auto_203682 ) ) ( not ( = ?auto_203681 ?auto_203683 ) ) ( not ( = ?auto_203681 ?auto_203684 ) ) ( not ( = ?auto_203681 ?auto_203685 ) ) ( not ( = ?auto_203682 ?auto_203683 ) ) ( not ( = ?auto_203682 ?auto_203684 ) ) ( not ( = ?auto_203682 ?auto_203685 ) ) ( not ( = ?auto_203683 ?auto_203684 ) ) ( not ( = ?auto_203683 ?auto_203685 ) ) ( not ( = ?auto_203684 ?auto_203685 ) ) ( ON ?auto_203685 ?auto_203686 ) ( not ( = ?auto_203680 ?auto_203686 ) ) ( not ( = ?auto_203681 ?auto_203686 ) ) ( not ( = ?auto_203682 ?auto_203686 ) ) ( not ( = ?auto_203683 ?auto_203686 ) ) ( not ( = ?auto_203684 ?auto_203686 ) ) ( not ( = ?auto_203685 ?auto_203686 ) ) ( ON ?auto_203684 ?auto_203685 ) ( ON-TABLE ?auto_203687 ) ( ON ?auto_203686 ?auto_203687 ) ( not ( = ?auto_203687 ?auto_203686 ) ) ( not ( = ?auto_203687 ?auto_203685 ) ) ( not ( = ?auto_203687 ?auto_203684 ) ) ( not ( = ?auto_203680 ?auto_203687 ) ) ( not ( = ?auto_203681 ?auto_203687 ) ) ( not ( = ?auto_203682 ?auto_203687 ) ) ( not ( = ?auto_203683 ?auto_203687 ) ) ( ON ?auto_203683 ?auto_203684 ) ( CLEAR ?auto_203683 ) ( HOLDING ?auto_203682 ) ( CLEAR ?auto_203681 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_203680 ?auto_203681 ?auto_203682 )
      ( MAKE-6PILE ?auto_203680 ?auto_203681 ?auto_203682 ?auto_203683 ?auto_203684 ?auto_203685 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_203688 - BLOCK
      ?auto_203689 - BLOCK
      ?auto_203690 - BLOCK
      ?auto_203691 - BLOCK
      ?auto_203692 - BLOCK
      ?auto_203693 - BLOCK
    )
    :vars
    (
      ?auto_203694 - BLOCK
      ?auto_203695 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_203688 ) ( ON ?auto_203689 ?auto_203688 ) ( not ( = ?auto_203688 ?auto_203689 ) ) ( not ( = ?auto_203688 ?auto_203690 ) ) ( not ( = ?auto_203688 ?auto_203691 ) ) ( not ( = ?auto_203688 ?auto_203692 ) ) ( not ( = ?auto_203688 ?auto_203693 ) ) ( not ( = ?auto_203689 ?auto_203690 ) ) ( not ( = ?auto_203689 ?auto_203691 ) ) ( not ( = ?auto_203689 ?auto_203692 ) ) ( not ( = ?auto_203689 ?auto_203693 ) ) ( not ( = ?auto_203690 ?auto_203691 ) ) ( not ( = ?auto_203690 ?auto_203692 ) ) ( not ( = ?auto_203690 ?auto_203693 ) ) ( not ( = ?auto_203691 ?auto_203692 ) ) ( not ( = ?auto_203691 ?auto_203693 ) ) ( not ( = ?auto_203692 ?auto_203693 ) ) ( ON ?auto_203693 ?auto_203694 ) ( not ( = ?auto_203688 ?auto_203694 ) ) ( not ( = ?auto_203689 ?auto_203694 ) ) ( not ( = ?auto_203690 ?auto_203694 ) ) ( not ( = ?auto_203691 ?auto_203694 ) ) ( not ( = ?auto_203692 ?auto_203694 ) ) ( not ( = ?auto_203693 ?auto_203694 ) ) ( ON ?auto_203692 ?auto_203693 ) ( ON-TABLE ?auto_203695 ) ( ON ?auto_203694 ?auto_203695 ) ( not ( = ?auto_203695 ?auto_203694 ) ) ( not ( = ?auto_203695 ?auto_203693 ) ) ( not ( = ?auto_203695 ?auto_203692 ) ) ( not ( = ?auto_203688 ?auto_203695 ) ) ( not ( = ?auto_203689 ?auto_203695 ) ) ( not ( = ?auto_203690 ?auto_203695 ) ) ( not ( = ?auto_203691 ?auto_203695 ) ) ( ON ?auto_203691 ?auto_203692 ) ( CLEAR ?auto_203689 ) ( ON ?auto_203690 ?auto_203691 ) ( CLEAR ?auto_203690 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_203695 ?auto_203694 ?auto_203693 ?auto_203692 ?auto_203691 )
      ( MAKE-6PILE ?auto_203688 ?auto_203689 ?auto_203690 ?auto_203691 ?auto_203692 ?auto_203693 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_203696 - BLOCK
      ?auto_203697 - BLOCK
      ?auto_203698 - BLOCK
      ?auto_203699 - BLOCK
      ?auto_203700 - BLOCK
      ?auto_203701 - BLOCK
    )
    :vars
    (
      ?auto_203702 - BLOCK
      ?auto_203703 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_203696 ) ( not ( = ?auto_203696 ?auto_203697 ) ) ( not ( = ?auto_203696 ?auto_203698 ) ) ( not ( = ?auto_203696 ?auto_203699 ) ) ( not ( = ?auto_203696 ?auto_203700 ) ) ( not ( = ?auto_203696 ?auto_203701 ) ) ( not ( = ?auto_203697 ?auto_203698 ) ) ( not ( = ?auto_203697 ?auto_203699 ) ) ( not ( = ?auto_203697 ?auto_203700 ) ) ( not ( = ?auto_203697 ?auto_203701 ) ) ( not ( = ?auto_203698 ?auto_203699 ) ) ( not ( = ?auto_203698 ?auto_203700 ) ) ( not ( = ?auto_203698 ?auto_203701 ) ) ( not ( = ?auto_203699 ?auto_203700 ) ) ( not ( = ?auto_203699 ?auto_203701 ) ) ( not ( = ?auto_203700 ?auto_203701 ) ) ( ON ?auto_203701 ?auto_203702 ) ( not ( = ?auto_203696 ?auto_203702 ) ) ( not ( = ?auto_203697 ?auto_203702 ) ) ( not ( = ?auto_203698 ?auto_203702 ) ) ( not ( = ?auto_203699 ?auto_203702 ) ) ( not ( = ?auto_203700 ?auto_203702 ) ) ( not ( = ?auto_203701 ?auto_203702 ) ) ( ON ?auto_203700 ?auto_203701 ) ( ON-TABLE ?auto_203703 ) ( ON ?auto_203702 ?auto_203703 ) ( not ( = ?auto_203703 ?auto_203702 ) ) ( not ( = ?auto_203703 ?auto_203701 ) ) ( not ( = ?auto_203703 ?auto_203700 ) ) ( not ( = ?auto_203696 ?auto_203703 ) ) ( not ( = ?auto_203697 ?auto_203703 ) ) ( not ( = ?auto_203698 ?auto_203703 ) ) ( not ( = ?auto_203699 ?auto_203703 ) ) ( ON ?auto_203699 ?auto_203700 ) ( ON ?auto_203698 ?auto_203699 ) ( CLEAR ?auto_203698 ) ( HOLDING ?auto_203697 ) ( CLEAR ?auto_203696 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_203696 ?auto_203697 )
      ( MAKE-6PILE ?auto_203696 ?auto_203697 ?auto_203698 ?auto_203699 ?auto_203700 ?auto_203701 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_203704 - BLOCK
      ?auto_203705 - BLOCK
      ?auto_203706 - BLOCK
      ?auto_203707 - BLOCK
      ?auto_203708 - BLOCK
      ?auto_203709 - BLOCK
    )
    :vars
    (
      ?auto_203710 - BLOCK
      ?auto_203711 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_203704 ) ( not ( = ?auto_203704 ?auto_203705 ) ) ( not ( = ?auto_203704 ?auto_203706 ) ) ( not ( = ?auto_203704 ?auto_203707 ) ) ( not ( = ?auto_203704 ?auto_203708 ) ) ( not ( = ?auto_203704 ?auto_203709 ) ) ( not ( = ?auto_203705 ?auto_203706 ) ) ( not ( = ?auto_203705 ?auto_203707 ) ) ( not ( = ?auto_203705 ?auto_203708 ) ) ( not ( = ?auto_203705 ?auto_203709 ) ) ( not ( = ?auto_203706 ?auto_203707 ) ) ( not ( = ?auto_203706 ?auto_203708 ) ) ( not ( = ?auto_203706 ?auto_203709 ) ) ( not ( = ?auto_203707 ?auto_203708 ) ) ( not ( = ?auto_203707 ?auto_203709 ) ) ( not ( = ?auto_203708 ?auto_203709 ) ) ( ON ?auto_203709 ?auto_203710 ) ( not ( = ?auto_203704 ?auto_203710 ) ) ( not ( = ?auto_203705 ?auto_203710 ) ) ( not ( = ?auto_203706 ?auto_203710 ) ) ( not ( = ?auto_203707 ?auto_203710 ) ) ( not ( = ?auto_203708 ?auto_203710 ) ) ( not ( = ?auto_203709 ?auto_203710 ) ) ( ON ?auto_203708 ?auto_203709 ) ( ON-TABLE ?auto_203711 ) ( ON ?auto_203710 ?auto_203711 ) ( not ( = ?auto_203711 ?auto_203710 ) ) ( not ( = ?auto_203711 ?auto_203709 ) ) ( not ( = ?auto_203711 ?auto_203708 ) ) ( not ( = ?auto_203704 ?auto_203711 ) ) ( not ( = ?auto_203705 ?auto_203711 ) ) ( not ( = ?auto_203706 ?auto_203711 ) ) ( not ( = ?auto_203707 ?auto_203711 ) ) ( ON ?auto_203707 ?auto_203708 ) ( ON ?auto_203706 ?auto_203707 ) ( CLEAR ?auto_203704 ) ( ON ?auto_203705 ?auto_203706 ) ( CLEAR ?auto_203705 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_203711 ?auto_203710 ?auto_203709 ?auto_203708 ?auto_203707 ?auto_203706 )
      ( MAKE-6PILE ?auto_203704 ?auto_203705 ?auto_203706 ?auto_203707 ?auto_203708 ?auto_203709 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_203712 - BLOCK
      ?auto_203713 - BLOCK
      ?auto_203714 - BLOCK
      ?auto_203715 - BLOCK
      ?auto_203716 - BLOCK
      ?auto_203717 - BLOCK
    )
    :vars
    (
      ?auto_203718 - BLOCK
      ?auto_203719 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_203712 ?auto_203713 ) ) ( not ( = ?auto_203712 ?auto_203714 ) ) ( not ( = ?auto_203712 ?auto_203715 ) ) ( not ( = ?auto_203712 ?auto_203716 ) ) ( not ( = ?auto_203712 ?auto_203717 ) ) ( not ( = ?auto_203713 ?auto_203714 ) ) ( not ( = ?auto_203713 ?auto_203715 ) ) ( not ( = ?auto_203713 ?auto_203716 ) ) ( not ( = ?auto_203713 ?auto_203717 ) ) ( not ( = ?auto_203714 ?auto_203715 ) ) ( not ( = ?auto_203714 ?auto_203716 ) ) ( not ( = ?auto_203714 ?auto_203717 ) ) ( not ( = ?auto_203715 ?auto_203716 ) ) ( not ( = ?auto_203715 ?auto_203717 ) ) ( not ( = ?auto_203716 ?auto_203717 ) ) ( ON ?auto_203717 ?auto_203718 ) ( not ( = ?auto_203712 ?auto_203718 ) ) ( not ( = ?auto_203713 ?auto_203718 ) ) ( not ( = ?auto_203714 ?auto_203718 ) ) ( not ( = ?auto_203715 ?auto_203718 ) ) ( not ( = ?auto_203716 ?auto_203718 ) ) ( not ( = ?auto_203717 ?auto_203718 ) ) ( ON ?auto_203716 ?auto_203717 ) ( ON-TABLE ?auto_203719 ) ( ON ?auto_203718 ?auto_203719 ) ( not ( = ?auto_203719 ?auto_203718 ) ) ( not ( = ?auto_203719 ?auto_203717 ) ) ( not ( = ?auto_203719 ?auto_203716 ) ) ( not ( = ?auto_203712 ?auto_203719 ) ) ( not ( = ?auto_203713 ?auto_203719 ) ) ( not ( = ?auto_203714 ?auto_203719 ) ) ( not ( = ?auto_203715 ?auto_203719 ) ) ( ON ?auto_203715 ?auto_203716 ) ( ON ?auto_203714 ?auto_203715 ) ( ON ?auto_203713 ?auto_203714 ) ( CLEAR ?auto_203713 ) ( HOLDING ?auto_203712 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_203712 )
      ( MAKE-6PILE ?auto_203712 ?auto_203713 ?auto_203714 ?auto_203715 ?auto_203716 ?auto_203717 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_203720 - BLOCK
      ?auto_203721 - BLOCK
      ?auto_203722 - BLOCK
      ?auto_203723 - BLOCK
      ?auto_203724 - BLOCK
      ?auto_203725 - BLOCK
    )
    :vars
    (
      ?auto_203727 - BLOCK
      ?auto_203726 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_203720 ?auto_203721 ) ) ( not ( = ?auto_203720 ?auto_203722 ) ) ( not ( = ?auto_203720 ?auto_203723 ) ) ( not ( = ?auto_203720 ?auto_203724 ) ) ( not ( = ?auto_203720 ?auto_203725 ) ) ( not ( = ?auto_203721 ?auto_203722 ) ) ( not ( = ?auto_203721 ?auto_203723 ) ) ( not ( = ?auto_203721 ?auto_203724 ) ) ( not ( = ?auto_203721 ?auto_203725 ) ) ( not ( = ?auto_203722 ?auto_203723 ) ) ( not ( = ?auto_203722 ?auto_203724 ) ) ( not ( = ?auto_203722 ?auto_203725 ) ) ( not ( = ?auto_203723 ?auto_203724 ) ) ( not ( = ?auto_203723 ?auto_203725 ) ) ( not ( = ?auto_203724 ?auto_203725 ) ) ( ON ?auto_203725 ?auto_203727 ) ( not ( = ?auto_203720 ?auto_203727 ) ) ( not ( = ?auto_203721 ?auto_203727 ) ) ( not ( = ?auto_203722 ?auto_203727 ) ) ( not ( = ?auto_203723 ?auto_203727 ) ) ( not ( = ?auto_203724 ?auto_203727 ) ) ( not ( = ?auto_203725 ?auto_203727 ) ) ( ON ?auto_203724 ?auto_203725 ) ( ON-TABLE ?auto_203726 ) ( ON ?auto_203727 ?auto_203726 ) ( not ( = ?auto_203726 ?auto_203727 ) ) ( not ( = ?auto_203726 ?auto_203725 ) ) ( not ( = ?auto_203726 ?auto_203724 ) ) ( not ( = ?auto_203720 ?auto_203726 ) ) ( not ( = ?auto_203721 ?auto_203726 ) ) ( not ( = ?auto_203722 ?auto_203726 ) ) ( not ( = ?auto_203723 ?auto_203726 ) ) ( ON ?auto_203723 ?auto_203724 ) ( ON ?auto_203722 ?auto_203723 ) ( ON ?auto_203721 ?auto_203722 ) ( ON ?auto_203720 ?auto_203721 ) ( CLEAR ?auto_203720 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_203726 ?auto_203727 ?auto_203725 ?auto_203724 ?auto_203723 ?auto_203722 ?auto_203721 )
      ( MAKE-6PILE ?auto_203720 ?auto_203721 ?auto_203722 ?auto_203723 ?auto_203724 ?auto_203725 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_203728 - BLOCK
      ?auto_203729 - BLOCK
      ?auto_203730 - BLOCK
      ?auto_203731 - BLOCK
      ?auto_203732 - BLOCK
      ?auto_203733 - BLOCK
    )
    :vars
    (
      ?auto_203735 - BLOCK
      ?auto_203734 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_203728 ?auto_203729 ) ) ( not ( = ?auto_203728 ?auto_203730 ) ) ( not ( = ?auto_203728 ?auto_203731 ) ) ( not ( = ?auto_203728 ?auto_203732 ) ) ( not ( = ?auto_203728 ?auto_203733 ) ) ( not ( = ?auto_203729 ?auto_203730 ) ) ( not ( = ?auto_203729 ?auto_203731 ) ) ( not ( = ?auto_203729 ?auto_203732 ) ) ( not ( = ?auto_203729 ?auto_203733 ) ) ( not ( = ?auto_203730 ?auto_203731 ) ) ( not ( = ?auto_203730 ?auto_203732 ) ) ( not ( = ?auto_203730 ?auto_203733 ) ) ( not ( = ?auto_203731 ?auto_203732 ) ) ( not ( = ?auto_203731 ?auto_203733 ) ) ( not ( = ?auto_203732 ?auto_203733 ) ) ( ON ?auto_203733 ?auto_203735 ) ( not ( = ?auto_203728 ?auto_203735 ) ) ( not ( = ?auto_203729 ?auto_203735 ) ) ( not ( = ?auto_203730 ?auto_203735 ) ) ( not ( = ?auto_203731 ?auto_203735 ) ) ( not ( = ?auto_203732 ?auto_203735 ) ) ( not ( = ?auto_203733 ?auto_203735 ) ) ( ON ?auto_203732 ?auto_203733 ) ( ON-TABLE ?auto_203734 ) ( ON ?auto_203735 ?auto_203734 ) ( not ( = ?auto_203734 ?auto_203735 ) ) ( not ( = ?auto_203734 ?auto_203733 ) ) ( not ( = ?auto_203734 ?auto_203732 ) ) ( not ( = ?auto_203728 ?auto_203734 ) ) ( not ( = ?auto_203729 ?auto_203734 ) ) ( not ( = ?auto_203730 ?auto_203734 ) ) ( not ( = ?auto_203731 ?auto_203734 ) ) ( ON ?auto_203731 ?auto_203732 ) ( ON ?auto_203730 ?auto_203731 ) ( ON ?auto_203729 ?auto_203730 ) ( HOLDING ?auto_203728 ) ( CLEAR ?auto_203729 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_203734 ?auto_203735 ?auto_203733 ?auto_203732 ?auto_203731 ?auto_203730 ?auto_203729 ?auto_203728 )
      ( MAKE-6PILE ?auto_203728 ?auto_203729 ?auto_203730 ?auto_203731 ?auto_203732 ?auto_203733 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_203736 - BLOCK
      ?auto_203737 - BLOCK
      ?auto_203738 - BLOCK
      ?auto_203739 - BLOCK
      ?auto_203740 - BLOCK
      ?auto_203741 - BLOCK
    )
    :vars
    (
      ?auto_203742 - BLOCK
      ?auto_203743 - BLOCK
      ?auto_203744 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_203736 ?auto_203737 ) ) ( not ( = ?auto_203736 ?auto_203738 ) ) ( not ( = ?auto_203736 ?auto_203739 ) ) ( not ( = ?auto_203736 ?auto_203740 ) ) ( not ( = ?auto_203736 ?auto_203741 ) ) ( not ( = ?auto_203737 ?auto_203738 ) ) ( not ( = ?auto_203737 ?auto_203739 ) ) ( not ( = ?auto_203737 ?auto_203740 ) ) ( not ( = ?auto_203737 ?auto_203741 ) ) ( not ( = ?auto_203738 ?auto_203739 ) ) ( not ( = ?auto_203738 ?auto_203740 ) ) ( not ( = ?auto_203738 ?auto_203741 ) ) ( not ( = ?auto_203739 ?auto_203740 ) ) ( not ( = ?auto_203739 ?auto_203741 ) ) ( not ( = ?auto_203740 ?auto_203741 ) ) ( ON ?auto_203741 ?auto_203742 ) ( not ( = ?auto_203736 ?auto_203742 ) ) ( not ( = ?auto_203737 ?auto_203742 ) ) ( not ( = ?auto_203738 ?auto_203742 ) ) ( not ( = ?auto_203739 ?auto_203742 ) ) ( not ( = ?auto_203740 ?auto_203742 ) ) ( not ( = ?auto_203741 ?auto_203742 ) ) ( ON ?auto_203740 ?auto_203741 ) ( ON-TABLE ?auto_203743 ) ( ON ?auto_203742 ?auto_203743 ) ( not ( = ?auto_203743 ?auto_203742 ) ) ( not ( = ?auto_203743 ?auto_203741 ) ) ( not ( = ?auto_203743 ?auto_203740 ) ) ( not ( = ?auto_203736 ?auto_203743 ) ) ( not ( = ?auto_203737 ?auto_203743 ) ) ( not ( = ?auto_203738 ?auto_203743 ) ) ( not ( = ?auto_203739 ?auto_203743 ) ) ( ON ?auto_203739 ?auto_203740 ) ( ON ?auto_203738 ?auto_203739 ) ( ON ?auto_203737 ?auto_203738 ) ( CLEAR ?auto_203737 ) ( ON ?auto_203736 ?auto_203744 ) ( CLEAR ?auto_203736 ) ( HAND-EMPTY ) ( not ( = ?auto_203736 ?auto_203744 ) ) ( not ( = ?auto_203737 ?auto_203744 ) ) ( not ( = ?auto_203738 ?auto_203744 ) ) ( not ( = ?auto_203739 ?auto_203744 ) ) ( not ( = ?auto_203740 ?auto_203744 ) ) ( not ( = ?auto_203741 ?auto_203744 ) ) ( not ( = ?auto_203742 ?auto_203744 ) ) ( not ( = ?auto_203743 ?auto_203744 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_203736 ?auto_203744 )
      ( MAKE-6PILE ?auto_203736 ?auto_203737 ?auto_203738 ?auto_203739 ?auto_203740 ?auto_203741 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_203745 - BLOCK
      ?auto_203746 - BLOCK
      ?auto_203747 - BLOCK
      ?auto_203748 - BLOCK
      ?auto_203749 - BLOCK
      ?auto_203750 - BLOCK
    )
    :vars
    (
      ?auto_203752 - BLOCK
      ?auto_203753 - BLOCK
      ?auto_203751 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_203745 ?auto_203746 ) ) ( not ( = ?auto_203745 ?auto_203747 ) ) ( not ( = ?auto_203745 ?auto_203748 ) ) ( not ( = ?auto_203745 ?auto_203749 ) ) ( not ( = ?auto_203745 ?auto_203750 ) ) ( not ( = ?auto_203746 ?auto_203747 ) ) ( not ( = ?auto_203746 ?auto_203748 ) ) ( not ( = ?auto_203746 ?auto_203749 ) ) ( not ( = ?auto_203746 ?auto_203750 ) ) ( not ( = ?auto_203747 ?auto_203748 ) ) ( not ( = ?auto_203747 ?auto_203749 ) ) ( not ( = ?auto_203747 ?auto_203750 ) ) ( not ( = ?auto_203748 ?auto_203749 ) ) ( not ( = ?auto_203748 ?auto_203750 ) ) ( not ( = ?auto_203749 ?auto_203750 ) ) ( ON ?auto_203750 ?auto_203752 ) ( not ( = ?auto_203745 ?auto_203752 ) ) ( not ( = ?auto_203746 ?auto_203752 ) ) ( not ( = ?auto_203747 ?auto_203752 ) ) ( not ( = ?auto_203748 ?auto_203752 ) ) ( not ( = ?auto_203749 ?auto_203752 ) ) ( not ( = ?auto_203750 ?auto_203752 ) ) ( ON ?auto_203749 ?auto_203750 ) ( ON-TABLE ?auto_203753 ) ( ON ?auto_203752 ?auto_203753 ) ( not ( = ?auto_203753 ?auto_203752 ) ) ( not ( = ?auto_203753 ?auto_203750 ) ) ( not ( = ?auto_203753 ?auto_203749 ) ) ( not ( = ?auto_203745 ?auto_203753 ) ) ( not ( = ?auto_203746 ?auto_203753 ) ) ( not ( = ?auto_203747 ?auto_203753 ) ) ( not ( = ?auto_203748 ?auto_203753 ) ) ( ON ?auto_203748 ?auto_203749 ) ( ON ?auto_203747 ?auto_203748 ) ( ON ?auto_203745 ?auto_203751 ) ( CLEAR ?auto_203745 ) ( not ( = ?auto_203745 ?auto_203751 ) ) ( not ( = ?auto_203746 ?auto_203751 ) ) ( not ( = ?auto_203747 ?auto_203751 ) ) ( not ( = ?auto_203748 ?auto_203751 ) ) ( not ( = ?auto_203749 ?auto_203751 ) ) ( not ( = ?auto_203750 ?auto_203751 ) ) ( not ( = ?auto_203752 ?auto_203751 ) ) ( not ( = ?auto_203753 ?auto_203751 ) ) ( HOLDING ?auto_203746 ) ( CLEAR ?auto_203747 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_203753 ?auto_203752 ?auto_203750 ?auto_203749 ?auto_203748 ?auto_203747 ?auto_203746 )
      ( MAKE-6PILE ?auto_203745 ?auto_203746 ?auto_203747 ?auto_203748 ?auto_203749 ?auto_203750 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_203754 - BLOCK
      ?auto_203755 - BLOCK
      ?auto_203756 - BLOCK
      ?auto_203757 - BLOCK
      ?auto_203758 - BLOCK
      ?auto_203759 - BLOCK
    )
    :vars
    (
      ?auto_203761 - BLOCK
      ?auto_203762 - BLOCK
      ?auto_203760 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_203754 ?auto_203755 ) ) ( not ( = ?auto_203754 ?auto_203756 ) ) ( not ( = ?auto_203754 ?auto_203757 ) ) ( not ( = ?auto_203754 ?auto_203758 ) ) ( not ( = ?auto_203754 ?auto_203759 ) ) ( not ( = ?auto_203755 ?auto_203756 ) ) ( not ( = ?auto_203755 ?auto_203757 ) ) ( not ( = ?auto_203755 ?auto_203758 ) ) ( not ( = ?auto_203755 ?auto_203759 ) ) ( not ( = ?auto_203756 ?auto_203757 ) ) ( not ( = ?auto_203756 ?auto_203758 ) ) ( not ( = ?auto_203756 ?auto_203759 ) ) ( not ( = ?auto_203757 ?auto_203758 ) ) ( not ( = ?auto_203757 ?auto_203759 ) ) ( not ( = ?auto_203758 ?auto_203759 ) ) ( ON ?auto_203759 ?auto_203761 ) ( not ( = ?auto_203754 ?auto_203761 ) ) ( not ( = ?auto_203755 ?auto_203761 ) ) ( not ( = ?auto_203756 ?auto_203761 ) ) ( not ( = ?auto_203757 ?auto_203761 ) ) ( not ( = ?auto_203758 ?auto_203761 ) ) ( not ( = ?auto_203759 ?auto_203761 ) ) ( ON ?auto_203758 ?auto_203759 ) ( ON-TABLE ?auto_203762 ) ( ON ?auto_203761 ?auto_203762 ) ( not ( = ?auto_203762 ?auto_203761 ) ) ( not ( = ?auto_203762 ?auto_203759 ) ) ( not ( = ?auto_203762 ?auto_203758 ) ) ( not ( = ?auto_203754 ?auto_203762 ) ) ( not ( = ?auto_203755 ?auto_203762 ) ) ( not ( = ?auto_203756 ?auto_203762 ) ) ( not ( = ?auto_203757 ?auto_203762 ) ) ( ON ?auto_203757 ?auto_203758 ) ( ON ?auto_203756 ?auto_203757 ) ( ON ?auto_203754 ?auto_203760 ) ( not ( = ?auto_203754 ?auto_203760 ) ) ( not ( = ?auto_203755 ?auto_203760 ) ) ( not ( = ?auto_203756 ?auto_203760 ) ) ( not ( = ?auto_203757 ?auto_203760 ) ) ( not ( = ?auto_203758 ?auto_203760 ) ) ( not ( = ?auto_203759 ?auto_203760 ) ) ( not ( = ?auto_203761 ?auto_203760 ) ) ( not ( = ?auto_203762 ?auto_203760 ) ) ( CLEAR ?auto_203756 ) ( ON ?auto_203755 ?auto_203754 ) ( CLEAR ?auto_203755 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_203760 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_203760 ?auto_203754 )
      ( MAKE-6PILE ?auto_203754 ?auto_203755 ?auto_203756 ?auto_203757 ?auto_203758 ?auto_203759 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_203763 - BLOCK
      ?auto_203764 - BLOCK
      ?auto_203765 - BLOCK
      ?auto_203766 - BLOCK
      ?auto_203767 - BLOCK
      ?auto_203768 - BLOCK
    )
    :vars
    (
      ?auto_203770 - BLOCK
      ?auto_203769 - BLOCK
      ?auto_203771 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_203763 ?auto_203764 ) ) ( not ( = ?auto_203763 ?auto_203765 ) ) ( not ( = ?auto_203763 ?auto_203766 ) ) ( not ( = ?auto_203763 ?auto_203767 ) ) ( not ( = ?auto_203763 ?auto_203768 ) ) ( not ( = ?auto_203764 ?auto_203765 ) ) ( not ( = ?auto_203764 ?auto_203766 ) ) ( not ( = ?auto_203764 ?auto_203767 ) ) ( not ( = ?auto_203764 ?auto_203768 ) ) ( not ( = ?auto_203765 ?auto_203766 ) ) ( not ( = ?auto_203765 ?auto_203767 ) ) ( not ( = ?auto_203765 ?auto_203768 ) ) ( not ( = ?auto_203766 ?auto_203767 ) ) ( not ( = ?auto_203766 ?auto_203768 ) ) ( not ( = ?auto_203767 ?auto_203768 ) ) ( ON ?auto_203768 ?auto_203770 ) ( not ( = ?auto_203763 ?auto_203770 ) ) ( not ( = ?auto_203764 ?auto_203770 ) ) ( not ( = ?auto_203765 ?auto_203770 ) ) ( not ( = ?auto_203766 ?auto_203770 ) ) ( not ( = ?auto_203767 ?auto_203770 ) ) ( not ( = ?auto_203768 ?auto_203770 ) ) ( ON ?auto_203767 ?auto_203768 ) ( ON-TABLE ?auto_203769 ) ( ON ?auto_203770 ?auto_203769 ) ( not ( = ?auto_203769 ?auto_203770 ) ) ( not ( = ?auto_203769 ?auto_203768 ) ) ( not ( = ?auto_203769 ?auto_203767 ) ) ( not ( = ?auto_203763 ?auto_203769 ) ) ( not ( = ?auto_203764 ?auto_203769 ) ) ( not ( = ?auto_203765 ?auto_203769 ) ) ( not ( = ?auto_203766 ?auto_203769 ) ) ( ON ?auto_203766 ?auto_203767 ) ( ON ?auto_203763 ?auto_203771 ) ( not ( = ?auto_203763 ?auto_203771 ) ) ( not ( = ?auto_203764 ?auto_203771 ) ) ( not ( = ?auto_203765 ?auto_203771 ) ) ( not ( = ?auto_203766 ?auto_203771 ) ) ( not ( = ?auto_203767 ?auto_203771 ) ) ( not ( = ?auto_203768 ?auto_203771 ) ) ( not ( = ?auto_203770 ?auto_203771 ) ) ( not ( = ?auto_203769 ?auto_203771 ) ) ( ON ?auto_203764 ?auto_203763 ) ( CLEAR ?auto_203764 ) ( ON-TABLE ?auto_203771 ) ( HOLDING ?auto_203765 ) ( CLEAR ?auto_203766 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_203769 ?auto_203770 ?auto_203768 ?auto_203767 ?auto_203766 ?auto_203765 )
      ( MAKE-6PILE ?auto_203763 ?auto_203764 ?auto_203765 ?auto_203766 ?auto_203767 ?auto_203768 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_203772 - BLOCK
      ?auto_203773 - BLOCK
      ?auto_203774 - BLOCK
      ?auto_203775 - BLOCK
      ?auto_203776 - BLOCK
      ?auto_203777 - BLOCK
    )
    :vars
    (
      ?auto_203780 - BLOCK
      ?auto_203779 - BLOCK
      ?auto_203778 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_203772 ?auto_203773 ) ) ( not ( = ?auto_203772 ?auto_203774 ) ) ( not ( = ?auto_203772 ?auto_203775 ) ) ( not ( = ?auto_203772 ?auto_203776 ) ) ( not ( = ?auto_203772 ?auto_203777 ) ) ( not ( = ?auto_203773 ?auto_203774 ) ) ( not ( = ?auto_203773 ?auto_203775 ) ) ( not ( = ?auto_203773 ?auto_203776 ) ) ( not ( = ?auto_203773 ?auto_203777 ) ) ( not ( = ?auto_203774 ?auto_203775 ) ) ( not ( = ?auto_203774 ?auto_203776 ) ) ( not ( = ?auto_203774 ?auto_203777 ) ) ( not ( = ?auto_203775 ?auto_203776 ) ) ( not ( = ?auto_203775 ?auto_203777 ) ) ( not ( = ?auto_203776 ?auto_203777 ) ) ( ON ?auto_203777 ?auto_203780 ) ( not ( = ?auto_203772 ?auto_203780 ) ) ( not ( = ?auto_203773 ?auto_203780 ) ) ( not ( = ?auto_203774 ?auto_203780 ) ) ( not ( = ?auto_203775 ?auto_203780 ) ) ( not ( = ?auto_203776 ?auto_203780 ) ) ( not ( = ?auto_203777 ?auto_203780 ) ) ( ON ?auto_203776 ?auto_203777 ) ( ON-TABLE ?auto_203779 ) ( ON ?auto_203780 ?auto_203779 ) ( not ( = ?auto_203779 ?auto_203780 ) ) ( not ( = ?auto_203779 ?auto_203777 ) ) ( not ( = ?auto_203779 ?auto_203776 ) ) ( not ( = ?auto_203772 ?auto_203779 ) ) ( not ( = ?auto_203773 ?auto_203779 ) ) ( not ( = ?auto_203774 ?auto_203779 ) ) ( not ( = ?auto_203775 ?auto_203779 ) ) ( ON ?auto_203775 ?auto_203776 ) ( ON ?auto_203772 ?auto_203778 ) ( not ( = ?auto_203772 ?auto_203778 ) ) ( not ( = ?auto_203773 ?auto_203778 ) ) ( not ( = ?auto_203774 ?auto_203778 ) ) ( not ( = ?auto_203775 ?auto_203778 ) ) ( not ( = ?auto_203776 ?auto_203778 ) ) ( not ( = ?auto_203777 ?auto_203778 ) ) ( not ( = ?auto_203780 ?auto_203778 ) ) ( not ( = ?auto_203779 ?auto_203778 ) ) ( ON ?auto_203773 ?auto_203772 ) ( ON-TABLE ?auto_203778 ) ( CLEAR ?auto_203775 ) ( ON ?auto_203774 ?auto_203773 ) ( CLEAR ?auto_203774 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_203778 ?auto_203772 ?auto_203773 )
      ( MAKE-6PILE ?auto_203772 ?auto_203773 ?auto_203774 ?auto_203775 ?auto_203776 ?auto_203777 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_203781 - BLOCK
      ?auto_203782 - BLOCK
      ?auto_203783 - BLOCK
      ?auto_203784 - BLOCK
      ?auto_203785 - BLOCK
      ?auto_203786 - BLOCK
    )
    :vars
    (
      ?auto_203789 - BLOCK
      ?auto_203788 - BLOCK
      ?auto_203787 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_203781 ?auto_203782 ) ) ( not ( = ?auto_203781 ?auto_203783 ) ) ( not ( = ?auto_203781 ?auto_203784 ) ) ( not ( = ?auto_203781 ?auto_203785 ) ) ( not ( = ?auto_203781 ?auto_203786 ) ) ( not ( = ?auto_203782 ?auto_203783 ) ) ( not ( = ?auto_203782 ?auto_203784 ) ) ( not ( = ?auto_203782 ?auto_203785 ) ) ( not ( = ?auto_203782 ?auto_203786 ) ) ( not ( = ?auto_203783 ?auto_203784 ) ) ( not ( = ?auto_203783 ?auto_203785 ) ) ( not ( = ?auto_203783 ?auto_203786 ) ) ( not ( = ?auto_203784 ?auto_203785 ) ) ( not ( = ?auto_203784 ?auto_203786 ) ) ( not ( = ?auto_203785 ?auto_203786 ) ) ( ON ?auto_203786 ?auto_203789 ) ( not ( = ?auto_203781 ?auto_203789 ) ) ( not ( = ?auto_203782 ?auto_203789 ) ) ( not ( = ?auto_203783 ?auto_203789 ) ) ( not ( = ?auto_203784 ?auto_203789 ) ) ( not ( = ?auto_203785 ?auto_203789 ) ) ( not ( = ?auto_203786 ?auto_203789 ) ) ( ON ?auto_203785 ?auto_203786 ) ( ON-TABLE ?auto_203788 ) ( ON ?auto_203789 ?auto_203788 ) ( not ( = ?auto_203788 ?auto_203789 ) ) ( not ( = ?auto_203788 ?auto_203786 ) ) ( not ( = ?auto_203788 ?auto_203785 ) ) ( not ( = ?auto_203781 ?auto_203788 ) ) ( not ( = ?auto_203782 ?auto_203788 ) ) ( not ( = ?auto_203783 ?auto_203788 ) ) ( not ( = ?auto_203784 ?auto_203788 ) ) ( ON ?auto_203781 ?auto_203787 ) ( not ( = ?auto_203781 ?auto_203787 ) ) ( not ( = ?auto_203782 ?auto_203787 ) ) ( not ( = ?auto_203783 ?auto_203787 ) ) ( not ( = ?auto_203784 ?auto_203787 ) ) ( not ( = ?auto_203785 ?auto_203787 ) ) ( not ( = ?auto_203786 ?auto_203787 ) ) ( not ( = ?auto_203789 ?auto_203787 ) ) ( not ( = ?auto_203788 ?auto_203787 ) ) ( ON ?auto_203782 ?auto_203781 ) ( ON-TABLE ?auto_203787 ) ( ON ?auto_203783 ?auto_203782 ) ( CLEAR ?auto_203783 ) ( HOLDING ?auto_203784 ) ( CLEAR ?auto_203785 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_203788 ?auto_203789 ?auto_203786 ?auto_203785 ?auto_203784 )
      ( MAKE-6PILE ?auto_203781 ?auto_203782 ?auto_203783 ?auto_203784 ?auto_203785 ?auto_203786 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_203790 - BLOCK
      ?auto_203791 - BLOCK
      ?auto_203792 - BLOCK
      ?auto_203793 - BLOCK
      ?auto_203794 - BLOCK
      ?auto_203795 - BLOCK
    )
    :vars
    (
      ?auto_203796 - BLOCK
      ?auto_203797 - BLOCK
      ?auto_203798 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_203790 ?auto_203791 ) ) ( not ( = ?auto_203790 ?auto_203792 ) ) ( not ( = ?auto_203790 ?auto_203793 ) ) ( not ( = ?auto_203790 ?auto_203794 ) ) ( not ( = ?auto_203790 ?auto_203795 ) ) ( not ( = ?auto_203791 ?auto_203792 ) ) ( not ( = ?auto_203791 ?auto_203793 ) ) ( not ( = ?auto_203791 ?auto_203794 ) ) ( not ( = ?auto_203791 ?auto_203795 ) ) ( not ( = ?auto_203792 ?auto_203793 ) ) ( not ( = ?auto_203792 ?auto_203794 ) ) ( not ( = ?auto_203792 ?auto_203795 ) ) ( not ( = ?auto_203793 ?auto_203794 ) ) ( not ( = ?auto_203793 ?auto_203795 ) ) ( not ( = ?auto_203794 ?auto_203795 ) ) ( ON ?auto_203795 ?auto_203796 ) ( not ( = ?auto_203790 ?auto_203796 ) ) ( not ( = ?auto_203791 ?auto_203796 ) ) ( not ( = ?auto_203792 ?auto_203796 ) ) ( not ( = ?auto_203793 ?auto_203796 ) ) ( not ( = ?auto_203794 ?auto_203796 ) ) ( not ( = ?auto_203795 ?auto_203796 ) ) ( ON ?auto_203794 ?auto_203795 ) ( ON-TABLE ?auto_203797 ) ( ON ?auto_203796 ?auto_203797 ) ( not ( = ?auto_203797 ?auto_203796 ) ) ( not ( = ?auto_203797 ?auto_203795 ) ) ( not ( = ?auto_203797 ?auto_203794 ) ) ( not ( = ?auto_203790 ?auto_203797 ) ) ( not ( = ?auto_203791 ?auto_203797 ) ) ( not ( = ?auto_203792 ?auto_203797 ) ) ( not ( = ?auto_203793 ?auto_203797 ) ) ( ON ?auto_203790 ?auto_203798 ) ( not ( = ?auto_203790 ?auto_203798 ) ) ( not ( = ?auto_203791 ?auto_203798 ) ) ( not ( = ?auto_203792 ?auto_203798 ) ) ( not ( = ?auto_203793 ?auto_203798 ) ) ( not ( = ?auto_203794 ?auto_203798 ) ) ( not ( = ?auto_203795 ?auto_203798 ) ) ( not ( = ?auto_203796 ?auto_203798 ) ) ( not ( = ?auto_203797 ?auto_203798 ) ) ( ON ?auto_203791 ?auto_203790 ) ( ON-TABLE ?auto_203798 ) ( ON ?auto_203792 ?auto_203791 ) ( CLEAR ?auto_203794 ) ( ON ?auto_203793 ?auto_203792 ) ( CLEAR ?auto_203793 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_203798 ?auto_203790 ?auto_203791 ?auto_203792 )
      ( MAKE-6PILE ?auto_203790 ?auto_203791 ?auto_203792 ?auto_203793 ?auto_203794 ?auto_203795 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_203799 - BLOCK
      ?auto_203800 - BLOCK
      ?auto_203801 - BLOCK
      ?auto_203802 - BLOCK
      ?auto_203803 - BLOCK
      ?auto_203804 - BLOCK
    )
    :vars
    (
      ?auto_203807 - BLOCK
      ?auto_203806 - BLOCK
      ?auto_203805 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_203799 ?auto_203800 ) ) ( not ( = ?auto_203799 ?auto_203801 ) ) ( not ( = ?auto_203799 ?auto_203802 ) ) ( not ( = ?auto_203799 ?auto_203803 ) ) ( not ( = ?auto_203799 ?auto_203804 ) ) ( not ( = ?auto_203800 ?auto_203801 ) ) ( not ( = ?auto_203800 ?auto_203802 ) ) ( not ( = ?auto_203800 ?auto_203803 ) ) ( not ( = ?auto_203800 ?auto_203804 ) ) ( not ( = ?auto_203801 ?auto_203802 ) ) ( not ( = ?auto_203801 ?auto_203803 ) ) ( not ( = ?auto_203801 ?auto_203804 ) ) ( not ( = ?auto_203802 ?auto_203803 ) ) ( not ( = ?auto_203802 ?auto_203804 ) ) ( not ( = ?auto_203803 ?auto_203804 ) ) ( ON ?auto_203804 ?auto_203807 ) ( not ( = ?auto_203799 ?auto_203807 ) ) ( not ( = ?auto_203800 ?auto_203807 ) ) ( not ( = ?auto_203801 ?auto_203807 ) ) ( not ( = ?auto_203802 ?auto_203807 ) ) ( not ( = ?auto_203803 ?auto_203807 ) ) ( not ( = ?auto_203804 ?auto_203807 ) ) ( ON-TABLE ?auto_203806 ) ( ON ?auto_203807 ?auto_203806 ) ( not ( = ?auto_203806 ?auto_203807 ) ) ( not ( = ?auto_203806 ?auto_203804 ) ) ( not ( = ?auto_203806 ?auto_203803 ) ) ( not ( = ?auto_203799 ?auto_203806 ) ) ( not ( = ?auto_203800 ?auto_203806 ) ) ( not ( = ?auto_203801 ?auto_203806 ) ) ( not ( = ?auto_203802 ?auto_203806 ) ) ( ON ?auto_203799 ?auto_203805 ) ( not ( = ?auto_203799 ?auto_203805 ) ) ( not ( = ?auto_203800 ?auto_203805 ) ) ( not ( = ?auto_203801 ?auto_203805 ) ) ( not ( = ?auto_203802 ?auto_203805 ) ) ( not ( = ?auto_203803 ?auto_203805 ) ) ( not ( = ?auto_203804 ?auto_203805 ) ) ( not ( = ?auto_203807 ?auto_203805 ) ) ( not ( = ?auto_203806 ?auto_203805 ) ) ( ON ?auto_203800 ?auto_203799 ) ( ON-TABLE ?auto_203805 ) ( ON ?auto_203801 ?auto_203800 ) ( ON ?auto_203802 ?auto_203801 ) ( CLEAR ?auto_203802 ) ( HOLDING ?auto_203803 ) ( CLEAR ?auto_203804 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_203806 ?auto_203807 ?auto_203804 ?auto_203803 )
      ( MAKE-6PILE ?auto_203799 ?auto_203800 ?auto_203801 ?auto_203802 ?auto_203803 ?auto_203804 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_203808 - BLOCK
      ?auto_203809 - BLOCK
      ?auto_203810 - BLOCK
      ?auto_203811 - BLOCK
      ?auto_203812 - BLOCK
      ?auto_203813 - BLOCK
    )
    :vars
    (
      ?auto_203814 - BLOCK
      ?auto_203815 - BLOCK
      ?auto_203816 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_203808 ?auto_203809 ) ) ( not ( = ?auto_203808 ?auto_203810 ) ) ( not ( = ?auto_203808 ?auto_203811 ) ) ( not ( = ?auto_203808 ?auto_203812 ) ) ( not ( = ?auto_203808 ?auto_203813 ) ) ( not ( = ?auto_203809 ?auto_203810 ) ) ( not ( = ?auto_203809 ?auto_203811 ) ) ( not ( = ?auto_203809 ?auto_203812 ) ) ( not ( = ?auto_203809 ?auto_203813 ) ) ( not ( = ?auto_203810 ?auto_203811 ) ) ( not ( = ?auto_203810 ?auto_203812 ) ) ( not ( = ?auto_203810 ?auto_203813 ) ) ( not ( = ?auto_203811 ?auto_203812 ) ) ( not ( = ?auto_203811 ?auto_203813 ) ) ( not ( = ?auto_203812 ?auto_203813 ) ) ( ON ?auto_203813 ?auto_203814 ) ( not ( = ?auto_203808 ?auto_203814 ) ) ( not ( = ?auto_203809 ?auto_203814 ) ) ( not ( = ?auto_203810 ?auto_203814 ) ) ( not ( = ?auto_203811 ?auto_203814 ) ) ( not ( = ?auto_203812 ?auto_203814 ) ) ( not ( = ?auto_203813 ?auto_203814 ) ) ( ON-TABLE ?auto_203815 ) ( ON ?auto_203814 ?auto_203815 ) ( not ( = ?auto_203815 ?auto_203814 ) ) ( not ( = ?auto_203815 ?auto_203813 ) ) ( not ( = ?auto_203815 ?auto_203812 ) ) ( not ( = ?auto_203808 ?auto_203815 ) ) ( not ( = ?auto_203809 ?auto_203815 ) ) ( not ( = ?auto_203810 ?auto_203815 ) ) ( not ( = ?auto_203811 ?auto_203815 ) ) ( ON ?auto_203808 ?auto_203816 ) ( not ( = ?auto_203808 ?auto_203816 ) ) ( not ( = ?auto_203809 ?auto_203816 ) ) ( not ( = ?auto_203810 ?auto_203816 ) ) ( not ( = ?auto_203811 ?auto_203816 ) ) ( not ( = ?auto_203812 ?auto_203816 ) ) ( not ( = ?auto_203813 ?auto_203816 ) ) ( not ( = ?auto_203814 ?auto_203816 ) ) ( not ( = ?auto_203815 ?auto_203816 ) ) ( ON ?auto_203809 ?auto_203808 ) ( ON-TABLE ?auto_203816 ) ( ON ?auto_203810 ?auto_203809 ) ( ON ?auto_203811 ?auto_203810 ) ( CLEAR ?auto_203813 ) ( ON ?auto_203812 ?auto_203811 ) ( CLEAR ?auto_203812 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_203816 ?auto_203808 ?auto_203809 ?auto_203810 ?auto_203811 )
      ( MAKE-6PILE ?auto_203808 ?auto_203809 ?auto_203810 ?auto_203811 ?auto_203812 ?auto_203813 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_203817 - BLOCK
      ?auto_203818 - BLOCK
      ?auto_203819 - BLOCK
      ?auto_203820 - BLOCK
      ?auto_203821 - BLOCK
      ?auto_203822 - BLOCK
    )
    :vars
    (
      ?auto_203824 - BLOCK
      ?auto_203823 - BLOCK
      ?auto_203825 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_203817 ?auto_203818 ) ) ( not ( = ?auto_203817 ?auto_203819 ) ) ( not ( = ?auto_203817 ?auto_203820 ) ) ( not ( = ?auto_203817 ?auto_203821 ) ) ( not ( = ?auto_203817 ?auto_203822 ) ) ( not ( = ?auto_203818 ?auto_203819 ) ) ( not ( = ?auto_203818 ?auto_203820 ) ) ( not ( = ?auto_203818 ?auto_203821 ) ) ( not ( = ?auto_203818 ?auto_203822 ) ) ( not ( = ?auto_203819 ?auto_203820 ) ) ( not ( = ?auto_203819 ?auto_203821 ) ) ( not ( = ?auto_203819 ?auto_203822 ) ) ( not ( = ?auto_203820 ?auto_203821 ) ) ( not ( = ?auto_203820 ?auto_203822 ) ) ( not ( = ?auto_203821 ?auto_203822 ) ) ( not ( = ?auto_203817 ?auto_203824 ) ) ( not ( = ?auto_203818 ?auto_203824 ) ) ( not ( = ?auto_203819 ?auto_203824 ) ) ( not ( = ?auto_203820 ?auto_203824 ) ) ( not ( = ?auto_203821 ?auto_203824 ) ) ( not ( = ?auto_203822 ?auto_203824 ) ) ( ON-TABLE ?auto_203823 ) ( ON ?auto_203824 ?auto_203823 ) ( not ( = ?auto_203823 ?auto_203824 ) ) ( not ( = ?auto_203823 ?auto_203822 ) ) ( not ( = ?auto_203823 ?auto_203821 ) ) ( not ( = ?auto_203817 ?auto_203823 ) ) ( not ( = ?auto_203818 ?auto_203823 ) ) ( not ( = ?auto_203819 ?auto_203823 ) ) ( not ( = ?auto_203820 ?auto_203823 ) ) ( ON ?auto_203817 ?auto_203825 ) ( not ( = ?auto_203817 ?auto_203825 ) ) ( not ( = ?auto_203818 ?auto_203825 ) ) ( not ( = ?auto_203819 ?auto_203825 ) ) ( not ( = ?auto_203820 ?auto_203825 ) ) ( not ( = ?auto_203821 ?auto_203825 ) ) ( not ( = ?auto_203822 ?auto_203825 ) ) ( not ( = ?auto_203824 ?auto_203825 ) ) ( not ( = ?auto_203823 ?auto_203825 ) ) ( ON ?auto_203818 ?auto_203817 ) ( ON-TABLE ?auto_203825 ) ( ON ?auto_203819 ?auto_203818 ) ( ON ?auto_203820 ?auto_203819 ) ( ON ?auto_203821 ?auto_203820 ) ( CLEAR ?auto_203821 ) ( HOLDING ?auto_203822 ) ( CLEAR ?auto_203824 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_203823 ?auto_203824 ?auto_203822 )
      ( MAKE-6PILE ?auto_203817 ?auto_203818 ?auto_203819 ?auto_203820 ?auto_203821 ?auto_203822 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_203826 - BLOCK
      ?auto_203827 - BLOCK
      ?auto_203828 - BLOCK
      ?auto_203829 - BLOCK
      ?auto_203830 - BLOCK
      ?auto_203831 - BLOCK
    )
    :vars
    (
      ?auto_203832 - BLOCK
      ?auto_203833 - BLOCK
      ?auto_203834 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_203826 ?auto_203827 ) ) ( not ( = ?auto_203826 ?auto_203828 ) ) ( not ( = ?auto_203826 ?auto_203829 ) ) ( not ( = ?auto_203826 ?auto_203830 ) ) ( not ( = ?auto_203826 ?auto_203831 ) ) ( not ( = ?auto_203827 ?auto_203828 ) ) ( not ( = ?auto_203827 ?auto_203829 ) ) ( not ( = ?auto_203827 ?auto_203830 ) ) ( not ( = ?auto_203827 ?auto_203831 ) ) ( not ( = ?auto_203828 ?auto_203829 ) ) ( not ( = ?auto_203828 ?auto_203830 ) ) ( not ( = ?auto_203828 ?auto_203831 ) ) ( not ( = ?auto_203829 ?auto_203830 ) ) ( not ( = ?auto_203829 ?auto_203831 ) ) ( not ( = ?auto_203830 ?auto_203831 ) ) ( not ( = ?auto_203826 ?auto_203832 ) ) ( not ( = ?auto_203827 ?auto_203832 ) ) ( not ( = ?auto_203828 ?auto_203832 ) ) ( not ( = ?auto_203829 ?auto_203832 ) ) ( not ( = ?auto_203830 ?auto_203832 ) ) ( not ( = ?auto_203831 ?auto_203832 ) ) ( ON-TABLE ?auto_203833 ) ( ON ?auto_203832 ?auto_203833 ) ( not ( = ?auto_203833 ?auto_203832 ) ) ( not ( = ?auto_203833 ?auto_203831 ) ) ( not ( = ?auto_203833 ?auto_203830 ) ) ( not ( = ?auto_203826 ?auto_203833 ) ) ( not ( = ?auto_203827 ?auto_203833 ) ) ( not ( = ?auto_203828 ?auto_203833 ) ) ( not ( = ?auto_203829 ?auto_203833 ) ) ( ON ?auto_203826 ?auto_203834 ) ( not ( = ?auto_203826 ?auto_203834 ) ) ( not ( = ?auto_203827 ?auto_203834 ) ) ( not ( = ?auto_203828 ?auto_203834 ) ) ( not ( = ?auto_203829 ?auto_203834 ) ) ( not ( = ?auto_203830 ?auto_203834 ) ) ( not ( = ?auto_203831 ?auto_203834 ) ) ( not ( = ?auto_203832 ?auto_203834 ) ) ( not ( = ?auto_203833 ?auto_203834 ) ) ( ON ?auto_203827 ?auto_203826 ) ( ON-TABLE ?auto_203834 ) ( ON ?auto_203828 ?auto_203827 ) ( ON ?auto_203829 ?auto_203828 ) ( ON ?auto_203830 ?auto_203829 ) ( CLEAR ?auto_203832 ) ( ON ?auto_203831 ?auto_203830 ) ( CLEAR ?auto_203831 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_203834 ?auto_203826 ?auto_203827 ?auto_203828 ?auto_203829 ?auto_203830 )
      ( MAKE-6PILE ?auto_203826 ?auto_203827 ?auto_203828 ?auto_203829 ?auto_203830 ?auto_203831 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_203835 - BLOCK
      ?auto_203836 - BLOCK
      ?auto_203837 - BLOCK
      ?auto_203838 - BLOCK
      ?auto_203839 - BLOCK
      ?auto_203840 - BLOCK
    )
    :vars
    (
      ?auto_203843 - BLOCK
      ?auto_203842 - BLOCK
      ?auto_203841 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_203835 ?auto_203836 ) ) ( not ( = ?auto_203835 ?auto_203837 ) ) ( not ( = ?auto_203835 ?auto_203838 ) ) ( not ( = ?auto_203835 ?auto_203839 ) ) ( not ( = ?auto_203835 ?auto_203840 ) ) ( not ( = ?auto_203836 ?auto_203837 ) ) ( not ( = ?auto_203836 ?auto_203838 ) ) ( not ( = ?auto_203836 ?auto_203839 ) ) ( not ( = ?auto_203836 ?auto_203840 ) ) ( not ( = ?auto_203837 ?auto_203838 ) ) ( not ( = ?auto_203837 ?auto_203839 ) ) ( not ( = ?auto_203837 ?auto_203840 ) ) ( not ( = ?auto_203838 ?auto_203839 ) ) ( not ( = ?auto_203838 ?auto_203840 ) ) ( not ( = ?auto_203839 ?auto_203840 ) ) ( not ( = ?auto_203835 ?auto_203843 ) ) ( not ( = ?auto_203836 ?auto_203843 ) ) ( not ( = ?auto_203837 ?auto_203843 ) ) ( not ( = ?auto_203838 ?auto_203843 ) ) ( not ( = ?auto_203839 ?auto_203843 ) ) ( not ( = ?auto_203840 ?auto_203843 ) ) ( ON-TABLE ?auto_203842 ) ( not ( = ?auto_203842 ?auto_203843 ) ) ( not ( = ?auto_203842 ?auto_203840 ) ) ( not ( = ?auto_203842 ?auto_203839 ) ) ( not ( = ?auto_203835 ?auto_203842 ) ) ( not ( = ?auto_203836 ?auto_203842 ) ) ( not ( = ?auto_203837 ?auto_203842 ) ) ( not ( = ?auto_203838 ?auto_203842 ) ) ( ON ?auto_203835 ?auto_203841 ) ( not ( = ?auto_203835 ?auto_203841 ) ) ( not ( = ?auto_203836 ?auto_203841 ) ) ( not ( = ?auto_203837 ?auto_203841 ) ) ( not ( = ?auto_203838 ?auto_203841 ) ) ( not ( = ?auto_203839 ?auto_203841 ) ) ( not ( = ?auto_203840 ?auto_203841 ) ) ( not ( = ?auto_203843 ?auto_203841 ) ) ( not ( = ?auto_203842 ?auto_203841 ) ) ( ON ?auto_203836 ?auto_203835 ) ( ON-TABLE ?auto_203841 ) ( ON ?auto_203837 ?auto_203836 ) ( ON ?auto_203838 ?auto_203837 ) ( ON ?auto_203839 ?auto_203838 ) ( ON ?auto_203840 ?auto_203839 ) ( CLEAR ?auto_203840 ) ( HOLDING ?auto_203843 ) ( CLEAR ?auto_203842 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_203842 ?auto_203843 )
      ( MAKE-6PILE ?auto_203835 ?auto_203836 ?auto_203837 ?auto_203838 ?auto_203839 ?auto_203840 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_203844 - BLOCK
      ?auto_203845 - BLOCK
      ?auto_203846 - BLOCK
      ?auto_203847 - BLOCK
      ?auto_203848 - BLOCK
      ?auto_203849 - BLOCK
    )
    :vars
    (
      ?auto_203852 - BLOCK
      ?auto_203851 - BLOCK
      ?auto_203850 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_203844 ?auto_203845 ) ) ( not ( = ?auto_203844 ?auto_203846 ) ) ( not ( = ?auto_203844 ?auto_203847 ) ) ( not ( = ?auto_203844 ?auto_203848 ) ) ( not ( = ?auto_203844 ?auto_203849 ) ) ( not ( = ?auto_203845 ?auto_203846 ) ) ( not ( = ?auto_203845 ?auto_203847 ) ) ( not ( = ?auto_203845 ?auto_203848 ) ) ( not ( = ?auto_203845 ?auto_203849 ) ) ( not ( = ?auto_203846 ?auto_203847 ) ) ( not ( = ?auto_203846 ?auto_203848 ) ) ( not ( = ?auto_203846 ?auto_203849 ) ) ( not ( = ?auto_203847 ?auto_203848 ) ) ( not ( = ?auto_203847 ?auto_203849 ) ) ( not ( = ?auto_203848 ?auto_203849 ) ) ( not ( = ?auto_203844 ?auto_203852 ) ) ( not ( = ?auto_203845 ?auto_203852 ) ) ( not ( = ?auto_203846 ?auto_203852 ) ) ( not ( = ?auto_203847 ?auto_203852 ) ) ( not ( = ?auto_203848 ?auto_203852 ) ) ( not ( = ?auto_203849 ?auto_203852 ) ) ( ON-TABLE ?auto_203851 ) ( not ( = ?auto_203851 ?auto_203852 ) ) ( not ( = ?auto_203851 ?auto_203849 ) ) ( not ( = ?auto_203851 ?auto_203848 ) ) ( not ( = ?auto_203844 ?auto_203851 ) ) ( not ( = ?auto_203845 ?auto_203851 ) ) ( not ( = ?auto_203846 ?auto_203851 ) ) ( not ( = ?auto_203847 ?auto_203851 ) ) ( ON ?auto_203844 ?auto_203850 ) ( not ( = ?auto_203844 ?auto_203850 ) ) ( not ( = ?auto_203845 ?auto_203850 ) ) ( not ( = ?auto_203846 ?auto_203850 ) ) ( not ( = ?auto_203847 ?auto_203850 ) ) ( not ( = ?auto_203848 ?auto_203850 ) ) ( not ( = ?auto_203849 ?auto_203850 ) ) ( not ( = ?auto_203852 ?auto_203850 ) ) ( not ( = ?auto_203851 ?auto_203850 ) ) ( ON ?auto_203845 ?auto_203844 ) ( ON-TABLE ?auto_203850 ) ( ON ?auto_203846 ?auto_203845 ) ( ON ?auto_203847 ?auto_203846 ) ( ON ?auto_203848 ?auto_203847 ) ( ON ?auto_203849 ?auto_203848 ) ( CLEAR ?auto_203851 ) ( ON ?auto_203852 ?auto_203849 ) ( CLEAR ?auto_203852 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_203850 ?auto_203844 ?auto_203845 ?auto_203846 ?auto_203847 ?auto_203848 ?auto_203849 )
      ( MAKE-6PILE ?auto_203844 ?auto_203845 ?auto_203846 ?auto_203847 ?auto_203848 ?auto_203849 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_203853 - BLOCK
      ?auto_203854 - BLOCK
      ?auto_203855 - BLOCK
      ?auto_203856 - BLOCK
      ?auto_203857 - BLOCK
      ?auto_203858 - BLOCK
    )
    :vars
    (
      ?auto_203860 - BLOCK
      ?auto_203861 - BLOCK
      ?auto_203859 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_203853 ?auto_203854 ) ) ( not ( = ?auto_203853 ?auto_203855 ) ) ( not ( = ?auto_203853 ?auto_203856 ) ) ( not ( = ?auto_203853 ?auto_203857 ) ) ( not ( = ?auto_203853 ?auto_203858 ) ) ( not ( = ?auto_203854 ?auto_203855 ) ) ( not ( = ?auto_203854 ?auto_203856 ) ) ( not ( = ?auto_203854 ?auto_203857 ) ) ( not ( = ?auto_203854 ?auto_203858 ) ) ( not ( = ?auto_203855 ?auto_203856 ) ) ( not ( = ?auto_203855 ?auto_203857 ) ) ( not ( = ?auto_203855 ?auto_203858 ) ) ( not ( = ?auto_203856 ?auto_203857 ) ) ( not ( = ?auto_203856 ?auto_203858 ) ) ( not ( = ?auto_203857 ?auto_203858 ) ) ( not ( = ?auto_203853 ?auto_203860 ) ) ( not ( = ?auto_203854 ?auto_203860 ) ) ( not ( = ?auto_203855 ?auto_203860 ) ) ( not ( = ?auto_203856 ?auto_203860 ) ) ( not ( = ?auto_203857 ?auto_203860 ) ) ( not ( = ?auto_203858 ?auto_203860 ) ) ( not ( = ?auto_203861 ?auto_203860 ) ) ( not ( = ?auto_203861 ?auto_203858 ) ) ( not ( = ?auto_203861 ?auto_203857 ) ) ( not ( = ?auto_203853 ?auto_203861 ) ) ( not ( = ?auto_203854 ?auto_203861 ) ) ( not ( = ?auto_203855 ?auto_203861 ) ) ( not ( = ?auto_203856 ?auto_203861 ) ) ( ON ?auto_203853 ?auto_203859 ) ( not ( = ?auto_203853 ?auto_203859 ) ) ( not ( = ?auto_203854 ?auto_203859 ) ) ( not ( = ?auto_203855 ?auto_203859 ) ) ( not ( = ?auto_203856 ?auto_203859 ) ) ( not ( = ?auto_203857 ?auto_203859 ) ) ( not ( = ?auto_203858 ?auto_203859 ) ) ( not ( = ?auto_203860 ?auto_203859 ) ) ( not ( = ?auto_203861 ?auto_203859 ) ) ( ON ?auto_203854 ?auto_203853 ) ( ON-TABLE ?auto_203859 ) ( ON ?auto_203855 ?auto_203854 ) ( ON ?auto_203856 ?auto_203855 ) ( ON ?auto_203857 ?auto_203856 ) ( ON ?auto_203858 ?auto_203857 ) ( ON ?auto_203860 ?auto_203858 ) ( CLEAR ?auto_203860 ) ( HOLDING ?auto_203861 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_203861 )
      ( MAKE-6PILE ?auto_203853 ?auto_203854 ?auto_203855 ?auto_203856 ?auto_203857 ?auto_203858 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_203862 - BLOCK
      ?auto_203863 - BLOCK
      ?auto_203864 - BLOCK
      ?auto_203865 - BLOCK
      ?auto_203866 - BLOCK
      ?auto_203867 - BLOCK
    )
    :vars
    (
      ?auto_203868 - BLOCK
      ?auto_203870 - BLOCK
      ?auto_203869 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_203862 ?auto_203863 ) ) ( not ( = ?auto_203862 ?auto_203864 ) ) ( not ( = ?auto_203862 ?auto_203865 ) ) ( not ( = ?auto_203862 ?auto_203866 ) ) ( not ( = ?auto_203862 ?auto_203867 ) ) ( not ( = ?auto_203863 ?auto_203864 ) ) ( not ( = ?auto_203863 ?auto_203865 ) ) ( not ( = ?auto_203863 ?auto_203866 ) ) ( not ( = ?auto_203863 ?auto_203867 ) ) ( not ( = ?auto_203864 ?auto_203865 ) ) ( not ( = ?auto_203864 ?auto_203866 ) ) ( not ( = ?auto_203864 ?auto_203867 ) ) ( not ( = ?auto_203865 ?auto_203866 ) ) ( not ( = ?auto_203865 ?auto_203867 ) ) ( not ( = ?auto_203866 ?auto_203867 ) ) ( not ( = ?auto_203862 ?auto_203868 ) ) ( not ( = ?auto_203863 ?auto_203868 ) ) ( not ( = ?auto_203864 ?auto_203868 ) ) ( not ( = ?auto_203865 ?auto_203868 ) ) ( not ( = ?auto_203866 ?auto_203868 ) ) ( not ( = ?auto_203867 ?auto_203868 ) ) ( not ( = ?auto_203870 ?auto_203868 ) ) ( not ( = ?auto_203870 ?auto_203867 ) ) ( not ( = ?auto_203870 ?auto_203866 ) ) ( not ( = ?auto_203862 ?auto_203870 ) ) ( not ( = ?auto_203863 ?auto_203870 ) ) ( not ( = ?auto_203864 ?auto_203870 ) ) ( not ( = ?auto_203865 ?auto_203870 ) ) ( ON ?auto_203862 ?auto_203869 ) ( not ( = ?auto_203862 ?auto_203869 ) ) ( not ( = ?auto_203863 ?auto_203869 ) ) ( not ( = ?auto_203864 ?auto_203869 ) ) ( not ( = ?auto_203865 ?auto_203869 ) ) ( not ( = ?auto_203866 ?auto_203869 ) ) ( not ( = ?auto_203867 ?auto_203869 ) ) ( not ( = ?auto_203868 ?auto_203869 ) ) ( not ( = ?auto_203870 ?auto_203869 ) ) ( ON ?auto_203863 ?auto_203862 ) ( ON-TABLE ?auto_203869 ) ( ON ?auto_203864 ?auto_203863 ) ( ON ?auto_203865 ?auto_203864 ) ( ON ?auto_203866 ?auto_203865 ) ( ON ?auto_203867 ?auto_203866 ) ( ON ?auto_203868 ?auto_203867 ) ( ON ?auto_203870 ?auto_203868 ) ( CLEAR ?auto_203870 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_203869 ?auto_203862 ?auto_203863 ?auto_203864 ?auto_203865 ?auto_203866 ?auto_203867 ?auto_203868 )
      ( MAKE-6PILE ?auto_203862 ?auto_203863 ?auto_203864 ?auto_203865 ?auto_203866 ?auto_203867 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_203872 - BLOCK
    )
    :vars
    (
      ?auto_203873 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_203873 ?auto_203872 ) ( CLEAR ?auto_203873 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_203872 ) ( not ( = ?auto_203872 ?auto_203873 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_203873 ?auto_203872 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_203874 - BLOCK
    )
    :vars
    (
      ?auto_203875 - BLOCK
      ?auto_203876 - BLOCK
      ?auto_203877 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_203875 ?auto_203874 ) ( CLEAR ?auto_203875 ) ( ON-TABLE ?auto_203874 ) ( not ( = ?auto_203874 ?auto_203875 ) ) ( HOLDING ?auto_203876 ) ( CLEAR ?auto_203877 ) ( not ( = ?auto_203874 ?auto_203876 ) ) ( not ( = ?auto_203874 ?auto_203877 ) ) ( not ( = ?auto_203875 ?auto_203876 ) ) ( not ( = ?auto_203875 ?auto_203877 ) ) ( not ( = ?auto_203876 ?auto_203877 ) ) )
    :subtasks
    ( ( !STACK ?auto_203876 ?auto_203877 )
      ( MAKE-1PILE ?auto_203874 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_203878 - BLOCK
    )
    :vars
    (
      ?auto_203881 - BLOCK
      ?auto_203879 - BLOCK
      ?auto_203880 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_203881 ?auto_203878 ) ( ON-TABLE ?auto_203878 ) ( not ( = ?auto_203878 ?auto_203881 ) ) ( CLEAR ?auto_203879 ) ( not ( = ?auto_203878 ?auto_203880 ) ) ( not ( = ?auto_203878 ?auto_203879 ) ) ( not ( = ?auto_203881 ?auto_203880 ) ) ( not ( = ?auto_203881 ?auto_203879 ) ) ( not ( = ?auto_203880 ?auto_203879 ) ) ( ON ?auto_203880 ?auto_203881 ) ( CLEAR ?auto_203880 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_203878 ?auto_203881 )
      ( MAKE-1PILE ?auto_203878 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_203882 - BLOCK
    )
    :vars
    (
      ?auto_203885 - BLOCK
      ?auto_203883 - BLOCK
      ?auto_203884 - BLOCK
      ?auto_203887 - BLOCK
      ?auto_203888 - BLOCK
      ?auto_203889 - BLOCK
      ?auto_203886 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_203885 ?auto_203882 ) ( ON-TABLE ?auto_203882 ) ( not ( = ?auto_203882 ?auto_203885 ) ) ( not ( = ?auto_203882 ?auto_203883 ) ) ( not ( = ?auto_203882 ?auto_203884 ) ) ( not ( = ?auto_203885 ?auto_203883 ) ) ( not ( = ?auto_203885 ?auto_203884 ) ) ( not ( = ?auto_203883 ?auto_203884 ) ) ( ON ?auto_203883 ?auto_203885 ) ( CLEAR ?auto_203883 ) ( HOLDING ?auto_203884 ) ( CLEAR ?auto_203887 ) ( ON-TABLE ?auto_203888 ) ( ON ?auto_203889 ?auto_203888 ) ( ON ?auto_203886 ?auto_203889 ) ( ON ?auto_203887 ?auto_203886 ) ( not ( = ?auto_203888 ?auto_203889 ) ) ( not ( = ?auto_203888 ?auto_203886 ) ) ( not ( = ?auto_203888 ?auto_203887 ) ) ( not ( = ?auto_203888 ?auto_203884 ) ) ( not ( = ?auto_203889 ?auto_203886 ) ) ( not ( = ?auto_203889 ?auto_203887 ) ) ( not ( = ?auto_203889 ?auto_203884 ) ) ( not ( = ?auto_203886 ?auto_203887 ) ) ( not ( = ?auto_203886 ?auto_203884 ) ) ( not ( = ?auto_203887 ?auto_203884 ) ) ( not ( = ?auto_203882 ?auto_203887 ) ) ( not ( = ?auto_203882 ?auto_203888 ) ) ( not ( = ?auto_203882 ?auto_203889 ) ) ( not ( = ?auto_203882 ?auto_203886 ) ) ( not ( = ?auto_203885 ?auto_203887 ) ) ( not ( = ?auto_203885 ?auto_203888 ) ) ( not ( = ?auto_203885 ?auto_203889 ) ) ( not ( = ?auto_203885 ?auto_203886 ) ) ( not ( = ?auto_203883 ?auto_203887 ) ) ( not ( = ?auto_203883 ?auto_203888 ) ) ( not ( = ?auto_203883 ?auto_203889 ) ) ( not ( = ?auto_203883 ?auto_203886 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_203888 ?auto_203889 ?auto_203886 ?auto_203887 ?auto_203884 )
      ( MAKE-1PILE ?auto_203882 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_203890 - BLOCK
    )
    :vars
    (
      ?auto_203894 - BLOCK
      ?auto_203897 - BLOCK
      ?auto_203895 - BLOCK
      ?auto_203893 - BLOCK
      ?auto_203896 - BLOCK
      ?auto_203891 - BLOCK
      ?auto_203892 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_203894 ?auto_203890 ) ( ON-TABLE ?auto_203890 ) ( not ( = ?auto_203890 ?auto_203894 ) ) ( not ( = ?auto_203890 ?auto_203897 ) ) ( not ( = ?auto_203890 ?auto_203895 ) ) ( not ( = ?auto_203894 ?auto_203897 ) ) ( not ( = ?auto_203894 ?auto_203895 ) ) ( not ( = ?auto_203897 ?auto_203895 ) ) ( ON ?auto_203897 ?auto_203894 ) ( CLEAR ?auto_203893 ) ( ON-TABLE ?auto_203896 ) ( ON ?auto_203891 ?auto_203896 ) ( ON ?auto_203892 ?auto_203891 ) ( ON ?auto_203893 ?auto_203892 ) ( not ( = ?auto_203896 ?auto_203891 ) ) ( not ( = ?auto_203896 ?auto_203892 ) ) ( not ( = ?auto_203896 ?auto_203893 ) ) ( not ( = ?auto_203896 ?auto_203895 ) ) ( not ( = ?auto_203891 ?auto_203892 ) ) ( not ( = ?auto_203891 ?auto_203893 ) ) ( not ( = ?auto_203891 ?auto_203895 ) ) ( not ( = ?auto_203892 ?auto_203893 ) ) ( not ( = ?auto_203892 ?auto_203895 ) ) ( not ( = ?auto_203893 ?auto_203895 ) ) ( not ( = ?auto_203890 ?auto_203893 ) ) ( not ( = ?auto_203890 ?auto_203896 ) ) ( not ( = ?auto_203890 ?auto_203891 ) ) ( not ( = ?auto_203890 ?auto_203892 ) ) ( not ( = ?auto_203894 ?auto_203893 ) ) ( not ( = ?auto_203894 ?auto_203896 ) ) ( not ( = ?auto_203894 ?auto_203891 ) ) ( not ( = ?auto_203894 ?auto_203892 ) ) ( not ( = ?auto_203897 ?auto_203893 ) ) ( not ( = ?auto_203897 ?auto_203896 ) ) ( not ( = ?auto_203897 ?auto_203891 ) ) ( not ( = ?auto_203897 ?auto_203892 ) ) ( ON ?auto_203895 ?auto_203897 ) ( CLEAR ?auto_203895 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_203890 ?auto_203894 ?auto_203897 )
      ( MAKE-1PILE ?auto_203890 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_203898 - BLOCK
    )
    :vars
    (
      ?auto_203899 - BLOCK
      ?auto_203903 - BLOCK
      ?auto_203905 - BLOCK
      ?auto_203902 - BLOCK
      ?auto_203904 - BLOCK
      ?auto_203901 - BLOCK
      ?auto_203900 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_203899 ?auto_203898 ) ( ON-TABLE ?auto_203898 ) ( not ( = ?auto_203898 ?auto_203899 ) ) ( not ( = ?auto_203898 ?auto_203903 ) ) ( not ( = ?auto_203898 ?auto_203905 ) ) ( not ( = ?auto_203899 ?auto_203903 ) ) ( not ( = ?auto_203899 ?auto_203905 ) ) ( not ( = ?auto_203903 ?auto_203905 ) ) ( ON ?auto_203903 ?auto_203899 ) ( ON-TABLE ?auto_203902 ) ( ON ?auto_203904 ?auto_203902 ) ( ON ?auto_203901 ?auto_203904 ) ( not ( = ?auto_203902 ?auto_203904 ) ) ( not ( = ?auto_203902 ?auto_203901 ) ) ( not ( = ?auto_203902 ?auto_203900 ) ) ( not ( = ?auto_203902 ?auto_203905 ) ) ( not ( = ?auto_203904 ?auto_203901 ) ) ( not ( = ?auto_203904 ?auto_203900 ) ) ( not ( = ?auto_203904 ?auto_203905 ) ) ( not ( = ?auto_203901 ?auto_203900 ) ) ( not ( = ?auto_203901 ?auto_203905 ) ) ( not ( = ?auto_203900 ?auto_203905 ) ) ( not ( = ?auto_203898 ?auto_203900 ) ) ( not ( = ?auto_203898 ?auto_203902 ) ) ( not ( = ?auto_203898 ?auto_203904 ) ) ( not ( = ?auto_203898 ?auto_203901 ) ) ( not ( = ?auto_203899 ?auto_203900 ) ) ( not ( = ?auto_203899 ?auto_203902 ) ) ( not ( = ?auto_203899 ?auto_203904 ) ) ( not ( = ?auto_203899 ?auto_203901 ) ) ( not ( = ?auto_203903 ?auto_203900 ) ) ( not ( = ?auto_203903 ?auto_203902 ) ) ( not ( = ?auto_203903 ?auto_203904 ) ) ( not ( = ?auto_203903 ?auto_203901 ) ) ( ON ?auto_203905 ?auto_203903 ) ( CLEAR ?auto_203905 ) ( HOLDING ?auto_203900 ) ( CLEAR ?auto_203901 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_203902 ?auto_203904 ?auto_203901 ?auto_203900 )
      ( MAKE-1PILE ?auto_203898 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_203906 - BLOCK
    )
    :vars
    (
      ?auto_203912 - BLOCK
      ?auto_203908 - BLOCK
      ?auto_203909 - BLOCK
      ?auto_203911 - BLOCK
      ?auto_203910 - BLOCK
      ?auto_203907 - BLOCK
      ?auto_203913 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_203912 ?auto_203906 ) ( ON-TABLE ?auto_203906 ) ( not ( = ?auto_203906 ?auto_203912 ) ) ( not ( = ?auto_203906 ?auto_203908 ) ) ( not ( = ?auto_203906 ?auto_203909 ) ) ( not ( = ?auto_203912 ?auto_203908 ) ) ( not ( = ?auto_203912 ?auto_203909 ) ) ( not ( = ?auto_203908 ?auto_203909 ) ) ( ON ?auto_203908 ?auto_203912 ) ( ON-TABLE ?auto_203911 ) ( ON ?auto_203910 ?auto_203911 ) ( ON ?auto_203907 ?auto_203910 ) ( not ( = ?auto_203911 ?auto_203910 ) ) ( not ( = ?auto_203911 ?auto_203907 ) ) ( not ( = ?auto_203911 ?auto_203913 ) ) ( not ( = ?auto_203911 ?auto_203909 ) ) ( not ( = ?auto_203910 ?auto_203907 ) ) ( not ( = ?auto_203910 ?auto_203913 ) ) ( not ( = ?auto_203910 ?auto_203909 ) ) ( not ( = ?auto_203907 ?auto_203913 ) ) ( not ( = ?auto_203907 ?auto_203909 ) ) ( not ( = ?auto_203913 ?auto_203909 ) ) ( not ( = ?auto_203906 ?auto_203913 ) ) ( not ( = ?auto_203906 ?auto_203911 ) ) ( not ( = ?auto_203906 ?auto_203910 ) ) ( not ( = ?auto_203906 ?auto_203907 ) ) ( not ( = ?auto_203912 ?auto_203913 ) ) ( not ( = ?auto_203912 ?auto_203911 ) ) ( not ( = ?auto_203912 ?auto_203910 ) ) ( not ( = ?auto_203912 ?auto_203907 ) ) ( not ( = ?auto_203908 ?auto_203913 ) ) ( not ( = ?auto_203908 ?auto_203911 ) ) ( not ( = ?auto_203908 ?auto_203910 ) ) ( not ( = ?auto_203908 ?auto_203907 ) ) ( ON ?auto_203909 ?auto_203908 ) ( CLEAR ?auto_203907 ) ( ON ?auto_203913 ?auto_203909 ) ( CLEAR ?auto_203913 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_203906 ?auto_203912 ?auto_203908 ?auto_203909 )
      ( MAKE-1PILE ?auto_203906 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_203914 - BLOCK
    )
    :vars
    (
      ?auto_203918 - BLOCK
      ?auto_203915 - BLOCK
      ?auto_203917 - BLOCK
      ?auto_203916 - BLOCK
      ?auto_203919 - BLOCK
      ?auto_203920 - BLOCK
      ?auto_203921 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_203918 ?auto_203914 ) ( ON-TABLE ?auto_203914 ) ( not ( = ?auto_203914 ?auto_203918 ) ) ( not ( = ?auto_203914 ?auto_203915 ) ) ( not ( = ?auto_203914 ?auto_203917 ) ) ( not ( = ?auto_203918 ?auto_203915 ) ) ( not ( = ?auto_203918 ?auto_203917 ) ) ( not ( = ?auto_203915 ?auto_203917 ) ) ( ON ?auto_203915 ?auto_203918 ) ( ON-TABLE ?auto_203916 ) ( ON ?auto_203919 ?auto_203916 ) ( not ( = ?auto_203916 ?auto_203919 ) ) ( not ( = ?auto_203916 ?auto_203920 ) ) ( not ( = ?auto_203916 ?auto_203921 ) ) ( not ( = ?auto_203916 ?auto_203917 ) ) ( not ( = ?auto_203919 ?auto_203920 ) ) ( not ( = ?auto_203919 ?auto_203921 ) ) ( not ( = ?auto_203919 ?auto_203917 ) ) ( not ( = ?auto_203920 ?auto_203921 ) ) ( not ( = ?auto_203920 ?auto_203917 ) ) ( not ( = ?auto_203921 ?auto_203917 ) ) ( not ( = ?auto_203914 ?auto_203921 ) ) ( not ( = ?auto_203914 ?auto_203916 ) ) ( not ( = ?auto_203914 ?auto_203919 ) ) ( not ( = ?auto_203914 ?auto_203920 ) ) ( not ( = ?auto_203918 ?auto_203921 ) ) ( not ( = ?auto_203918 ?auto_203916 ) ) ( not ( = ?auto_203918 ?auto_203919 ) ) ( not ( = ?auto_203918 ?auto_203920 ) ) ( not ( = ?auto_203915 ?auto_203921 ) ) ( not ( = ?auto_203915 ?auto_203916 ) ) ( not ( = ?auto_203915 ?auto_203919 ) ) ( not ( = ?auto_203915 ?auto_203920 ) ) ( ON ?auto_203917 ?auto_203915 ) ( ON ?auto_203921 ?auto_203917 ) ( CLEAR ?auto_203921 ) ( HOLDING ?auto_203920 ) ( CLEAR ?auto_203919 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_203916 ?auto_203919 ?auto_203920 )
      ( MAKE-1PILE ?auto_203914 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_203922 - BLOCK
    )
    :vars
    (
      ?auto_203923 - BLOCK
      ?auto_203928 - BLOCK
      ?auto_203927 - BLOCK
      ?auto_203926 - BLOCK
      ?auto_203929 - BLOCK
      ?auto_203924 - BLOCK
      ?auto_203925 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_203923 ?auto_203922 ) ( ON-TABLE ?auto_203922 ) ( not ( = ?auto_203922 ?auto_203923 ) ) ( not ( = ?auto_203922 ?auto_203928 ) ) ( not ( = ?auto_203922 ?auto_203927 ) ) ( not ( = ?auto_203923 ?auto_203928 ) ) ( not ( = ?auto_203923 ?auto_203927 ) ) ( not ( = ?auto_203928 ?auto_203927 ) ) ( ON ?auto_203928 ?auto_203923 ) ( ON-TABLE ?auto_203926 ) ( ON ?auto_203929 ?auto_203926 ) ( not ( = ?auto_203926 ?auto_203929 ) ) ( not ( = ?auto_203926 ?auto_203924 ) ) ( not ( = ?auto_203926 ?auto_203925 ) ) ( not ( = ?auto_203926 ?auto_203927 ) ) ( not ( = ?auto_203929 ?auto_203924 ) ) ( not ( = ?auto_203929 ?auto_203925 ) ) ( not ( = ?auto_203929 ?auto_203927 ) ) ( not ( = ?auto_203924 ?auto_203925 ) ) ( not ( = ?auto_203924 ?auto_203927 ) ) ( not ( = ?auto_203925 ?auto_203927 ) ) ( not ( = ?auto_203922 ?auto_203925 ) ) ( not ( = ?auto_203922 ?auto_203926 ) ) ( not ( = ?auto_203922 ?auto_203929 ) ) ( not ( = ?auto_203922 ?auto_203924 ) ) ( not ( = ?auto_203923 ?auto_203925 ) ) ( not ( = ?auto_203923 ?auto_203926 ) ) ( not ( = ?auto_203923 ?auto_203929 ) ) ( not ( = ?auto_203923 ?auto_203924 ) ) ( not ( = ?auto_203928 ?auto_203925 ) ) ( not ( = ?auto_203928 ?auto_203926 ) ) ( not ( = ?auto_203928 ?auto_203929 ) ) ( not ( = ?auto_203928 ?auto_203924 ) ) ( ON ?auto_203927 ?auto_203928 ) ( ON ?auto_203925 ?auto_203927 ) ( CLEAR ?auto_203929 ) ( ON ?auto_203924 ?auto_203925 ) ( CLEAR ?auto_203924 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_203922 ?auto_203923 ?auto_203928 ?auto_203927 ?auto_203925 )
      ( MAKE-1PILE ?auto_203922 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_203930 - BLOCK
    )
    :vars
    (
      ?auto_203936 - BLOCK
      ?auto_203931 - BLOCK
      ?auto_203935 - BLOCK
      ?auto_203933 - BLOCK
      ?auto_203937 - BLOCK
      ?auto_203932 - BLOCK
      ?auto_203934 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_203936 ?auto_203930 ) ( ON-TABLE ?auto_203930 ) ( not ( = ?auto_203930 ?auto_203936 ) ) ( not ( = ?auto_203930 ?auto_203931 ) ) ( not ( = ?auto_203930 ?auto_203935 ) ) ( not ( = ?auto_203936 ?auto_203931 ) ) ( not ( = ?auto_203936 ?auto_203935 ) ) ( not ( = ?auto_203931 ?auto_203935 ) ) ( ON ?auto_203931 ?auto_203936 ) ( ON-TABLE ?auto_203933 ) ( not ( = ?auto_203933 ?auto_203937 ) ) ( not ( = ?auto_203933 ?auto_203932 ) ) ( not ( = ?auto_203933 ?auto_203934 ) ) ( not ( = ?auto_203933 ?auto_203935 ) ) ( not ( = ?auto_203937 ?auto_203932 ) ) ( not ( = ?auto_203937 ?auto_203934 ) ) ( not ( = ?auto_203937 ?auto_203935 ) ) ( not ( = ?auto_203932 ?auto_203934 ) ) ( not ( = ?auto_203932 ?auto_203935 ) ) ( not ( = ?auto_203934 ?auto_203935 ) ) ( not ( = ?auto_203930 ?auto_203934 ) ) ( not ( = ?auto_203930 ?auto_203933 ) ) ( not ( = ?auto_203930 ?auto_203937 ) ) ( not ( = ?auto_203930 ?auto_203932 ) ) ( not ( = ?auto_203936 ?auto_203934 ) ) ( not ( = ?auto_203936 ?auto_203933 ) ) ( not ( = ?auto_203936 ?auto_203937 ) ) ( not ( = ?auto_203936 ?auto_203932 ) ) ( not ( = ?auto_203931 ?auto_203934 ) ) ( not ( = ?auto_203931 ?auto_203933 ) ) ( not ( = ?auto_203931 ?auto_203937 ) ) ( not ( = ?auto_203931 ?auto_203932 ) ) ( ON ?auto_203935 ?auto_203931 ) ( ON ?auto_203934 ?auto_203935 ) ( ON ?auto_203932 ?auto_203934 ) ( CLEAR ?auto_203932 ) ( HOLDING ?auto_203937 ) ( CLEAR ?auto_203933 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_203933 ?auto_203937 )
      ( MAKE-1PILE ?auto_203930 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_203938 - BLOCK
    )
    :vars
    (
      ?auto_203943 - BLOCK
      ?auto_203944 - BLOCK
      ?auto_203940 - BLOCK
      ?auto_203941 - BLOCK
      ?auto_203939 - BLOCK
      ?auto_203945 - BLOCK
      ?auto_203942 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_203943 ?auto_203938 ) ( ON-TABLE ?auto_203938 ) ( not ( = ?auto_203938 ?auto_203943 ) ) ( not ( = ?auto_203938 ?auto_203944 ) ) ( not ( = ?auto_203938 ?auto_203940 ) ) ( not ( = ?auto_203943 ?auto_203944 ) ) ( not ( = ?auto_203943 ?auto_203940 ) ) ( not ( = ?auto_203944 ?auto_203940 ) ) ( ON ?auto_203944 ?auto_203943 ) ( ON-TABLE ?auto_203941 ) ( not ( = ?auto_203941 ?auto_203939 ) ) ( not ( = ?auto_203941 ?auto_203945 ) ) ( not ( = ?auto_203941 ?auto_203942 ) ) ( not ( = ?auto_203941 ?auto_203940 ) ) ( not ( = ?auto_203939 ?auto_203945 ) ) ( not ( = ?auto_203939 ?auto_203942 ) ) ( not ( = ?auto_203939 ?auto_203940 ) ) ( not ( = ?auto_203945 ?auto_203942 ) ) ( not ( = ?auto_203945 ?auto_203940 ) ) ( not ( = ?auto_203942 ?auto_203940 ) ) ( not ( = ?auto_203938 ?auto_203942 ) ) ( not ( = ?auto_203938 ?auto_203941 ) ) ( not ( = ?auto_203938 ?auto_203939 ) ) ( not ( = ?auto_203938 ?auto_203945 ) ) ( not ( = ?auto_203943 ?auto_203942 ) ) ( not ( = ?auto_203943 ?auto_203941 ) ) ( not ( = ?auto_203943 ?auto_203939 ) ) ( not ( = ?auto_203943 ?auto_203945 ) ) ( not ( = ?auto_203944 ?auto_203942 ) ) ( not ( = ?auto_203944 ?auto_203941 ) ) ( not ( = ?auto_203944 ?auto_203939 ) ) ( not ( = ?auto_203944 ?auto_203945 ) ) ( ON ?auto_203940 ?auto_203944 ) ( ON ?auto_203942 ?auto_203940 ) ( ON ?auto_203945 ?auto_203942 ) ( CLEAR ?auto_203941 ) ( ON ?auto_203939 ?auto_203945 ) ( CLEAR ?auto_203939 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_203938 ?auto_203943 ?auto_203944 ?auto_203940 ?auto_203942 ?auto_203945 )
      ( MAKE-1PILE ?auto_203938 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_203946 - BLOCK
    )
    :vars
    (
      ?auto_203949 - BLOCK
      ?auto_203953 - BLOCK
      ?auto_203948 - BLOCK
      ?auto_203947 - BLOCK
      ?auto_203950 - BLOCK
      ?auto_203952 - BLOCK
      ?auto_203951 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_203949 ?auto_203946 ) ( ON-TABLE ?auto_203946 ) ( not ( = ?auto_203946 ?auto_203949 ) ) ( not ( = ?auto_203946 ?auto_203953 ) ) ( not ( = ?auto_203946 ?auto_203948 ) ) ( not ( = ?auto_203949 ?auto_203953 ) ) ( not ( = ?auto_203949 ?auto_203948 ) ) ( not ( = ?auto_203953 ?auto_203948 ) ) ( ON ?auto_203953 ?auto_203949 ) ( not ( = ?auto_203947 ?auto_203950 ) ) ( not ( = ?auto_203947 ?auto_203952 ) ) ( not ( = ?auto_203947 ?auto_203951 ) ) ( not ( = ?auto_203947 ?auto_203948 ) ) ( not ( = ?auto_203950 ?auto_203952 ) ) ( not ( = ?auto_203950 ?auto_203951 ) ) ( not ( = ?auto_203950 ?auto_203948 ) ) ( not ( = ?auto_203952 ?auto_203951 ) ) ( not ( = ?auto_203952 ?auto_203948 ) ) ( not ( = ?auto_203951 ?auto_203948 ) ) ( not ( = ?auto_203946 ?auto_203951 ) ) ( not ( = ?auto_203946 ?auto_203947 ) ) ( not ( = ?auto_203946 ?auto_203950 ) ) ( not ( = ?auto_203946 ?auto_203952 ) ) ( not ( = ?auto_203949 ?auto_203951 ) ) ( not ( = ?auto_203949 ?auto_203947 ) ) ( not ( = ?auto_203949 ?auto_203950 ) ) ( not ( = ?auto_203949 ?auto_203952 ) ) ( not ( = ?auto_203953 ?auto_203951 ) ) ( not ( = ?auto_203953 ?auto_203947 ) ) ( not ( = ?auto_203953 ?auto_203950 ) ) ( not ( = ?auto_203953 ?auto_203952 ) ) ( ON ?auto_203948 ?auto_203953 ) ( ON ?auto_203951 ?auto_203948 ) ( ON ?auto_203952 ?auto_203951 ) ( ON ?auto_203950 ?auto_203952 ) ( CLEAR ?auto_203950 ) ( HOLDING ?auto_203947 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_203947 )
      ( MAKE-1PILE ?auto_203946 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_203954 - BLOCK
    )
    :vars
    (
      ?auto_203959 - BLOCK
      ?auto_203955 - BLOCK
      ?auto_203961 - BLOCK
      ?auto_203957 - BLOCK
      ?auto_203960 - BLOCK
      ?auto_203956 - BLOCK
      ?auto_203958 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_203959 ?auto_203954 ) ( ON-TABLE ?auto_203954 ) ( not ( = ?auto_203954 ?auto_203959 ) ) ( not ( = ?auto_203954 ?auto_203955 ) ) ( not ( = ?auto_203954 ?auto_203961 ) ) ( not ( = ?auto_203959 ?auto_203955 ) ) ( not ( = ?auto_203959 ?auto_203961 ) ) ( not ( = ?auto_203955 ?auto_203961 ) ) ( ON ?auto_203955 ?auto_203959 ) ( not ( = ?auto_203957 ?auto_203960 ) ) ( not ( = ?auto_203957 ?auto_203956 ) ) ( not ( = ?auto_203957 ?auto_203958 ) ) ( not ( = ?auto_203957 ?auto_203961 ) ) ( not ( = ?auto_203960 ?auto_203956 ) ) ( not ( = ?auto_203960 ?auto_203958 ) ) ( not ( = ?auto_203960 ?auto_203961 ) ) ( not ( = ?auto_203956 ?auto_203958 ) ) ( not ( = ?auto_203956 ?auto_203961 ) ) ( not ( = ?auto_203958 ?auto_203961 ) ) ( not ( = ?auto_203954 ?auto_203958 ) ) ( not ( = ?auto_203954 ?auto_203957 ) ) ( not ( = ?auto_203954 ?auto_203960 ) ) ( not ( = ?auto_203954 ?auto_203956 ) ) ( not ( = ?auto_203959 ?auto_203958 ) ) ( not ( = ?auto_203959 ?auto_203957 ) ) ( not ( = ?auto_203959 ?auto_203960 ) ) ( not ( = ?auto_203959 ?auto_203956 ) ) ( not ( = ?auto_203955 ?auto_203958 ) ) ( not ( = ?auto_203955 ?auto_203957 ) ) ( not ( = ?auto_203955 ?auto_203960 ) ) ( not ( = ?auto_203955 ?auto_203956 ) ) ( ON ?auto_203961 ?auto_203955 ) ( ON ?auto_203958 ?auto_203961 ) ( ON ?auto_203956 ?auto_203958 ) ( ON ?auto_203960 ?auto_203956 ) ( ON ?auto_203957 ?auto_203960 ) ( CLEAR ?auto_203957 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_203954 ?auto_203959 ?auto_203955 ?auto_203961 ?auto_203958 ?auto_203956 ?auto_203960 )
      ( MAKE-1PILE ?auto_203954 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_203962 - BLOCK
    )
    :vars
    (
      ?auto_203965 - BLOCK
      ?auto_203966 - BLOCK
      ?auto_203969 - BLOCK
      ?auto_203963 - BLOCK
      ?auto_203968 - BLOCK
      ?auto_203967 - BLOCK
      ?auto_203964 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_203965 ?auto_203962 ) ( ON-TABLE ?auto_203962 ) ( not ( = ?auto_203962 ?auto_203965 ) ) ( not ( = ?auto_203962 ?auto_203966 ) ) ( not ( = ?auto_203962 ?auto_203969 ) ) ( not ( = ?auto_203965 ?auto_203966 ) ) ( not ( = ?auto_203965 ?auto_203969 ) ) ( not ( = ?auto_203966 ?auto_203969 ) ) ( ON ?auto_203966 ?auto_203965 ) ( not ( = ?auto_203963 ?auto_203968 ) ) ( not ( = ?auto_203963 ?auto_203967 ) ) ( not ( = ?auto_203963 ?auto_203964 ) ) ( not ( = ?auto_203963 ?auto_203969 ) ) ( not ( = ?auto_203968 ?auto_203967 ) ) ( not ( = ?auto_203968 ?auto_203964 ) ) ( not ( = ?auto_203968 ?auto_203969 ) ) ( not ( = ?auto_203967 ?auto_203964 ) ) ( not ( = ?auto_203967 ?auto_203969 ) ) ( not ( = ?auto_203964 ?auto_203969 ) ) ( not ( = ?auto_203962 ?auto_203964 ) ) ( not ( = ?auto_203962 ?auto_203963 ) ) ( not ( = ?auto_203962 ?auto_203968 ) ) ( not ( = ?auto_203962 ?auto_203967 ) ) ( not ( = ?auto_203965 ?auto_203964 ) ) ( not ( = ?auto_203965 ?auto_203963 ) ) ( not ( = ?auto_203965 ?auto_203968 ) ) ( not ( = ?auto_203965 ?auto_203967 ) ) ( not ( = ?auto_203966 ?auto_203964 ) ) ( not ( = ?auto_203966 ?auto_203963 ) ) ( not ( = ?auto_203966 ?auto_203968 ) ) ( not ( = ?auto_203966 ?auto_203967 ) ) ( ON ?auto_203969 ?auto_203966 ) ( ON ?auto_203964 ?auto_203969 ) ( ON ?auto_203967 ?auto_203964 ) ( ON ?auto_203968 ?auto_203967 ) ( HOLDING ?auto_203963 ) ( CLEAR ?auto_203968 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_203962 ?auto_203965 ?auto_203966 ?auto_203969 ?auto_203964 ?auto_203967 ?auto_203968 ?auto_203963 )
      ( MAKE-1PILE ?auto_203962 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_203970 - BLOCK
    )
    :vars
    (
      ?auto_203977 - BLOCK
      ?auto_203971 - BLOCK
      ?auto_203972 - BLOCK
      ?auto_203975 - BLOCK
      ?auto_203974 - BLOCK
      ?auto_203973 - BLOCK
      ?auto_203976 - BLOCK
      ?auto_203978 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_203977 ?auto_203970 ) ( ON-TABLE ?auto_203970 ) ( not ( = ?auto_203970 ?auto_203977 ) ) ( not ( = ?auto_203970 ?auto_203971 ) ) ( not ( = ?auto_203970 ?auto_203972 ) ) ( not ( = ?auto_203977 ?auto_203971 ) ) ( not ( = ?auto_203977 ?auto_203972 ) ) ( not ( = ?auto_203971 ?auto_203972 ) ) ( ON ?auto_203971 ?auto_203977 ) ( not ( = ?auto_203975 ?auto_203974 ) ) ( not ( = ?auto_203975 ?auto_203973 ) ) ( not ( = ?auto_203975 ?auto_203976 ) ) ( not ( = ?auto_203975 ?auto_203972 ) ) ( not ( = ?auto_203974 ?auto_203973 ) ) ( not ( = ?auto_203974 ?auto_203976 ) ) ( not ( = ?auto_203974 ?auto_203972 ) ) ( not ( = ?auto_203973 ?auto_203976 ) ) ( not ( = ?auto_203973 ?auto_203972 ) ) ( not ( = ?auto_203976 ?auto_203972 ) ) ( not ( = ?auto_203970 ?auto_203976 ) ) ( not ( = ?auto_203970 ?auto_203975 ) ) ( not ( = ?auto_203970 ?auto_203974 ) ) ( not ( = ?auto_203970 ?auto_203973 ) ) ( not ( = ?auto_203977 ?auto_203976 ) ) ( not ( = ?auto_203977 ?auto_203975 ) ) ( not ( = ?auto_203977 ?auto_203974 ) ) ( not ( = ?auto_203977 ?auto_203973 ) ) ( not ( = ?auto_203971 ?auto_203976 ) ) ( not ( = ?auto_203971 ?auto_203975 ) ) ( not ( = ?auto_203971 ?auto_203974 ) ) ( not ( = ?auto_203971 ?auto_203973 ) ) ( ON ?auto_203972 ?auto_203971 ) ( ON ?auto_203976 ?auto_203972 ) ( ON ?auto_203973 ?auto_203976 ) ( ON ?auto_203974 ?auto_203973 ) ( CLEAR ?auto_203974 ) ( ON ?auto_203975 ?auto_203978 ) ( CLEAR ?auto_203975 ) ( HAND-EMPTY ) ( not ( = ?auto_203970 ?auto_203978 ) ) ( not ( = ?auto_203977 ?auto_203978 ) ) ( not ( = ?auto_203971 ?auto_203978 ) ) ( not ( = ?auto_203972 ?auto_203978 ) ) ( not ( = ?auto_203975 ?auto_203978 ) ) ( not ( = ?auto_203974 ?auto_203978 ) ) ( not ( = ?auto_203973 ?auto_203978 ) ) ( not ( = ?auto_203976 ?auto_203978 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_203975 ?auto_203978 )
      ( MAKE-1PILE ?auto_203970 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_203979 - BLOCK
    )
    :vars
    (
      ?auto_203986 - BLOCK
      ?auto_203980 - BLOCK
      ?auto_203981 - BLOCK
      ?auto_203985 - BLOCK
      ?auto_203983 - BLOCK
      ?auto_203984 - BLOCK
      ?auto_203982 - BLOCK
      ?auto_203987 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_203986 ?auto_203979 ) ( ON-TABLE ?auto_203979 ) ( not ( = ?auto_203979 ?auto_203986 ) ) ( not ( = ?auto_203979 ?auto_203980 ) ) ( not ( = ?auto_203979 ?auto_203981 ) ) ( not ( = ?auto_203986 ?auto_203980 ) ) ( not ( = ?auto_203986 ?auto_203981 ) ) ( not ( = ?auto_203980 ?auto_203981 ) ) ( ON ?auto_203980 ?auto_203986 ) ( not ( = ?auto_203985 ?auto_203983 ) ) ( not ( = ?auto_203985 ?auto_203984 ) ) ( not ( = ?auto_203985 ?auto_203982 ) ) ( not ( = ?auto_203985 ?auto_203981 ) ) ( not ( = ?auto_203983 ?auto_203984 ) ) ( not ( = ?auto_203983 ?auto_203982 ) ) ( not ( = ?auto_203983 ?auto_203981 ) ) ( not ( = ?auto_203984 ?auto_203982 ) ) ( not ( = ?auto_203984 ?auto_203981 ) ) ( not ( = ?auto_203982 ?auto_203981 ) ) ( not ( = ?auto_203979 ?auto_203982 ) ) ( not ( = ?auto_203979 ?auto_203985 ) ) ( not ( = ?auto_203979 ?auto_203983 ) ) ( not ( = ?auto_203979 ?auto_203984 ) ) ( not ( = ?auto_203986 ?auto_203982 ) ) ( not ( = ?auto_203986 ?auto_203985 ) ) ( not ( = ?auto_203986 ?auto_203983 ) ) ( not ( = ?auto_203986 ?auto_203984 ) ) ( not ( = ?auto_203980 ?auto_203982 ) ) ( not ( = ?auto_203980 ?auto_203985 ) ) ( not ( = ?auto_203980 ?auto_203983 ) ) ( not ( = ?auto_203980 ?auto_203984 ) ) ( ON ?auto_203981 ?auto_203980 ) ( ON ?auto_203982 ?auto_203981 ) ( ON ?auto_203984 ?auto_203982 ) ( ON ?auto_203985 ?auto_203987 ) ( CLEAR ?auto_203985 ) ( not ( = ?auto_203979 ?auto_203987 ) ) ( not ( = ?auto_203986 ?auto_203987 ) ) ( not ( = ?auto_203980 ?auto_203987 ) ) ( not ( = ?auto_203981 ?auto_203987 ) ) ( not ( = ?auto_203985 ?auto_203987 ) ) ( not ( = ?auto_203983 ?auto_203987 ) ) ( not ( = ?auto_203984 ?auto_203987 ) ) ( not ( = ?auto_203982 ?auto_203987 ) ) ( HOLDING ?auto_203983 ) ( CLEAR ?auto_203984 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_203979 ?auto_203986 ?auto_203980 ?auto_203981 ?auto_203982 ?auto_203984 ?auto_203983 )
      ( MAKE-1PILE ?auto_203979 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_203988 - BLOCK
    )
    :vars
    (
      ?auto_203992 - BLOCK
      ?auto_203989 - BLOCK
      ?auto_203991 - BLOCK
      ?auto_203990 - BLOCK
      ?auto_203994 - BLOCK
      ?auto_203996 - BLOCK
      ?auto_203993 - BLOCK
      ?auto_203995 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_203992 ?auto_203988 ) ( ON-TABLE ?auto_203988 ) ( not ( = ?auto_203988 ?auto_203992 ) ) ( not ( = ?auto_203988 ?auto_203989 ) ) ( not ( = ?auto_203988 ?auto_203991 ) ) ( not ( = ?auto_203992 ?auto_203989 ) ) ( not ( = ?auto_203992 ?auto_203991 ) ) ( not ( = ?auto_203989 ?auto_203991 ) ) ( ON ?auto_203989 ?auto_203992 ) ( not ( = ?auto_203990 ?auto_203994 ) ) ( not ( = ?auto_203990 ?auto_203996 ) ) ( not ( = ?auto_203990 ?auto_203993 ) ) ( not ( = ?auto_203990 ?auto_203991 ) ) ( not ( = ?auto_203994 ?auto_203996 ) ) ( not ( = ?auto_203994 ?auto_203993 ) ) ( not ( = ?auto_203994 ?auto_203991 ) ) ( not ( = ?auto_203996 ?auto_203993 ) ) ( not ( = ?auto_203996 ?auto_203991 ) ) ( not ( = ?auto_203993 ?auto_203991 ) ) ( not ( = ?auto_203988 ?auto_203993 ) ) ( not ( = ?auto_203988 ?auto_203990 ) ) ( not ( = ?auto_203988 ?auto_203994 ) ) ( not ( = ?auto_203988 ?auto_203996 ) ) ( not ( = ?auto_203992 ?auto_203993 ) ) ( not ( = ?auto_203992 ?auto_203990 ) ) ( not ( = ?auto_203992 ?auto_203994 ) ) ( not ( = ?auto_203992 ?auto_203996 ) ) ( not ( = ?auto_203989 ?auto_203993 ) ) ( not ( = ?auto_203989 ?auto_203990 ) ) ( not ( = ?auto_203989 ?auto_203994 ) ) ( not ( = ?auto_203989 ?auto_203996 ) ) ( ON ?auto_203991 ?auto_203989 ) ( ON ?auto_203993 ?auto_203991 ) ( ON ?auto_203996 ?auto_203993 ) ( ON ?auto_203990 ?auto_203995 ) ( not ( = ?auto_203988 ?auto_203995 ) ) ( not ( = ?auto_203992 ?auto_203995 ) ) ( not ( = ?auto_203989 ?auto_203995 ) ) ( not ( = ?auto_203991 ?auto_203995 ) ) ( not ( = ?auto_203990 ?auto_203995 ) ) ( not ( = ?auto_203994 ?auto_203995 ) ) ( not ( = ?auto_203996 ?auto_203995 ) ) ( not ( = ?auto_203993 ?auto_203995 ) ) ( CLEAR ?auto_203996 ) ( ON ?auto_203994 ?auto_203990 ) ( CLEAR ?auto_203994 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_203995 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_203995 ?auto_203990 )
      ( MAKE-1PILE ?auto_203988 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_203997 - BLOCK
    )
    :vars
    (
      ?auto_204005 - BLOCK
      ?auto_204004 - BLOCK
      ?auto_204003 - BLOCK
      ?auto_203998 - BLOCK
      ?auto_203999 - BLOCK
      ?auto_204002 - BLOCK
      ?auto_204001 - BLOCK
      ?auto_204000 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_204005 ?auto_203997 ) ( ON-TABLE ?auto_203997 ) ( not ( = ?auto_203997 ?auto_204005 ) ) ( not ( = ?auto_203997 ?auto_204004 ) ) ( not ( = ?auto_203997 ?auto_204003 ) ) ( not ( = ?auto_204005 ?auto_204004 ) ) ( not ( = ?auto_204005 ?auto_204003 ) ) ( not ( = ?auto_204004 ?auto_204003 ) ) ( ON ?auto_204004 ?auto_204005 ) ( not ( = ?auto_203998 ?auto_203999 ) ) ( not ( = ?auto_203998 ?auto_204002 ) ) ( not ( = ?auto_203998 ?auto_204001 ) ) ( not ( = ?auto_203998 ?auto_204003 ) ) ( not ( = ?auto_203999 ?auto_204002 ) ) ( not ( = ?auto_203999 ?auto_204001 ) ) ( not ( = ?auto_203999 ?auto_204003 ) ) ( not ( = ?auto_204002 ?auto_204001 ) ) ( not ( = ?auto_204002 ?auto_204003 ) ) ( not ( = ?auto_204001 ?auto_204003 ) ) ( not ( = ?auto_203997 ?auto_204001 ) ) ( not ( = ?auto_203997 ?auto_203998 ) ) ( not ( = ?auto_203997 ?auto_203999 ) ) ( not ( = ?auto_203997 ?auto_204002 ) ) ( not ( = ?auto_204005 ?auto_204001 ) ) ( not ( = ?auto_204005 ?auto_203998 ) ) ( not ( = ?auto_204005 ?auto_203999 ) ) ( not ( = ?auto_204005 ?auto_204002 ) ) ( not ( = ?auto_204004 ?auto_204001 ) ) ( not ( = ?auto_204004 ?auto_203998 ) ) ( not ( = ?auto_204004 ?auto_203999 ) ) ( not ( = ?auto_204004 ?auto_204002 ) ) ( ON ?auto_204003 ?auto_204004 ) ( ON ?auto_204001 ?auto_204003 ) ( ON ?auto_203998 ?auto_204000 ) ( not ( = ?auto_203997 ?auto_204000 ) ) ( not ( = ?auto_204005 ?auto_204000 ) ) ( not ( = ?auto_204004 ?auto_204000 ) ) ( not ( = ?auto_204003 ?auto_204000 ) ) ( not ( = ?auto_203998 ?auto_204000 ) ) ( not ( = ?auto_203999 ?auto_204000 ) ) ( not ( = ?auto_204002 ?auto_204000 ) ) ( not ( = ?auto_204001 ?auto_204000 ) ) ( ON ?auto_203999 ?auto_203998 ) ( CLEAR ?auto_203999 ) ( ON-TABLE ?auto_204000 ) ( HOLDING ?auto_204002 ) ( CLEAR ?auto_204001 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_203997 ?auto_204005 ?auto_204004 ?auto_204003 ?auto_204001 ?auto_204002 )
      ( MAKE-1PILE ?auto_203997 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_204006 - BLOCK
    )
    :vars
    (
      ?auto_204011 - BLOCK
      ?auto_204014 - BLOCK
      ?auto_204007 - BLOCK
      ?auto_204013 - BLOCK
      ?auto_204008 - BLOCK
      ?auto_204012 - BLOCK
      ?auto_204009 - BLOCK
      ?auto_204010 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_204011 ?auto_204006 ) ( ON-TABLE ?auto_204006 ) ( not ( = ?auto_204006 ?auto_204011 ) ) ( not ( = ?auto_204006 ?auto_204014 ) ) ( not ( = ?auto_204006 ?auto_204007 ) ) ( not ( = ?auto_204011 ?auto_204014 ) ) ( not ( = ?auto_204011 ?auto_204007 ) ) ( not ( = ?auto_204014 ?auto_204007 ) ) ( ON ?auto_204014 ?auto_204011 ) ( not ( = ?auto_204013 ?auto_204008 ) ) ( not ( = ?auto_204013 ?auto_204012 ) ) ( not ( = ?auto_204013 ?auto_204009 ) ) ( not ( = ?auto_204013 ?auto_204007 ) ) ( not ( = ?auto_204008 ?auto_204012 ) ) ( not ( = ?auto_204008 ?auto_204009 ) ) ( not ( = ?auto_204008 ?auto_204007 ) ) ( not ( = ?auto_204012 ?auto_204009 ) ) ( not ( = ?auto_204012 ?auto_204007 ) ) ( not ( = ?auto_204009 ?auto_204007 ) ) ( not ( = ?auto_204006 ?auto_204009 ) ) ( not ( = ?auto_204006 ?auto_204013 ) ) ( not ( = ?auto_204006 ?auto_204008 ) ) ( not ( = ?auto_204006 ?auto_204012 ) ) ( not ( = ?auto_204011 ?auto_204009 ) ) ( not ( = ?auto_204011 ?auto_204013 ) ) ( not ( = ?auto_204011 ?auto_204008 ) ) ( not ( = ?auto_204011 ?auto_204012 ) ) ( not ( = ?auto_204014 ?auto_204009 ) ) ( not ( = ?auto_204014 ?auto_204013 ) ) ( not ( = ?auto_204014 ?auto_204008 ) ) ( not ( = ?auto_204014 ?auto_204012 ) ) ( ON ?auto_204007 ?auto_204014 ) ( ON ?auto_204009 ?auto_204007 ) ( ON ?auto_204013 ?auto_204010 ) ( not ( = ?auto_204006 ?auto_204010 ) ) ( not ( = ?auto_204011 ?auto_204010 ) ) ( not ( = ?auto_204014 ?auto_204010 ) ) ( not ( = ?auto_204007 ?auto_204010 ) ) ( not ( = ?auto_204013 ?auto_204010 ) ) ( not ( = ?auto_204008 ?auto_204010 ) ) ( not ( = ?auto_204012 ?auto_204010 ) ) ( not ( = ?auto_204009 ?auto_204010 ) ) ( ON ?auto_204008 ?auto_204013 ) ( ON-TABLE ?auto_204010 ) ( CLEAR ?auto_204009 ) ( ON ?auto_204012 ?auto_204008 ) ( CLEAR ?auto_204012 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_204010 ?auto_204013 ?auto_204008 )
      ( MAKE-1PILE ?auto_204006 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_204015 - BLOCK
    )
    :vars
    (
      ?auto_204016 - BLOCK
      ?auto_204023 - BLOCK
      ?auto_204018 - BLOCK
      ?auto_204019 - BLOCK
      ?auto_204017 - BLOCK
      ?auto_204020 - BLOCK
      ?auto_204021 - BLOCK
      ?auto_204022 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_204016 ?auto_204015 ) ( ON-TABLE ?auto_204015 ) ( not ( = ?auto_204015 ?auto_204016 ) ) ( not ( = ?auto_204015 ?auto_204023 ) ) ( not ( = ?auto_204015 ?auto_204018 ) ) ( not ( = ?auto_204016 ?auto_204023 ) ) ( not ( = ?auto_204016 ?auto_204018 ) ) ( not ( = ?auto_204023 ?auto_204018 ) ) ( ON ?auto_204023 ?auto_204016 ) ( not ( = ?auto_204019 ?auto_204017 ) ) ( not ( = ?auto_204019 ?auto_204020 ) ) ( not ( = ?auto_204019 ?auto_204021 ) ) ( not ( = ?auto_204019 ?auto_204018 ) ) ( not ( = ?auto_204017 ?auto_204020 ) ) ( not ( = ?auto_204017 ?auto_204021 ) ) ( not ( = ?auto_204017 ?auto_204018 ) ) ( not ( = ?auto_204020 ?auto_204021 ) ) ( not ( = ?auto_204020 ?auto_204018 ) ) ( not ( = ?auto_204021 ?auto_204018 ) ) ( not ( = ?auto_204015 ?auto_204021 ) ) ( not ( = ?auto_204015 ?auto_204019 ) ) ( not ( = ?auto_204015 ?auto_204017 ) ) ( not ( = ?auto_204015 ?auto_204020 ) ) ( not ( = ?auto_204016 ?auto_204021 ) ) ( not ( = ?auto_204016 ?auto_204019 ) ) ( not ( = ?auto_204016 ?auto_204017 ) ) ( not ( = ?auto_204016 ?auto_204020 ) ) ( not ( = ?auto_204023 ?auto_204021 ) ) ( not ( = ?auto_204023 ?auto_204019 ) ) ( not ( = ?auto_204023 ?auto_204017 ) ) ( not ( = ?auto_204023 ?auto_204020 ) ) ( ON ?auto_204018 ?auto_204023 ) ( ON ?auto_204019 ?auto_204022 ) ( not ( = ?auto_204015 ?auto_204022 ) ) ( not ( = ?auto_204016 ?auto_204022 ) ) ( not ( = ?auto_204023 ?auto_204022 ) ) ( not ( = ?auto_204018 ?auto_204022 ) ) ( not ( = ?auto_204019 ?auto_204022 ) ) ( not ( = ?auto_204017 ?auto_204022 ) ) ( not ( = ?auto_204020 ?auto_204022 ) ) ( not ( = ?auto_204021 ?auto_204022 ) ) ( ON ?auto_204017 ?auto_204019 ) ( ON-TABLE ?auto_204022 ) ( ON ?auto_204020 ?auto_204017 ) ( CLEAR ?auto_204020 ) ( HOLDING ?auto_204021 ) ( CLEAR ?auto_204018 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_204015 ?auto_204016 ?auto_204023 ?auto_204018 ?auto_204021 )
      ( MAKE-1PILE ?auto_204015 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_204024 - BLOCK
    )
    :vars
    (
      ?auto_204027 - BLOCK
      ?auto_204032 - BLOCK
      ?auto_204031 - BLOCK
      ?auto_204025 - BLOCK
      ?auto_204029 - BLOCK
      ?auto_204026 - BLOCK
      ?auto_204028 - BLOCK
      ?auto_204030 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_204027 ?auto_204024 ) ( ON-TABLE ?auto_204024 ) ( not ( = ?auto_204024 ?auto_204027 ) ) ( not ( = ?auto_204024 ?auto_204032 ) ) ( not ( = ?auto_204024 ?auto_204031 ) ) ( not ( = ?auto_204027 ?auto_204032 ) ) ( not ( = ?auto_204027 ?auto_204031 ) ) ( not ( = ?auto_204032 ?auto_204031 ) ) ( ON ?auto_204032 ?auto_204027 ) ( not ( = ?auto_204025 ?auto_204029 ) ) ( not ( = ?auto_204025 ?auto_204026 ) ) ( not ( = ?auto_204025 ?auto_204028 ) ) ( not ( = ?auto_204025 ?auto_204031 ) ) ( not ( = ?auto_204029 ?auto_204026 ) ) ( not ( = ?auto_204029 ?auto_204028 ) ) ( not ( = ?auto_204029 ?auto_204031 ) ) ( not ( = ?auto_204026 ?auto_204028 ) ) ( not ( = ?auto_204026 ?auto_204031 ) ) ( not ( = ?auto_204028 ?auto_204031 ) ) ( not ( = ?auto_204024 ?auto_204028 ) ) ( not ( = ?auto_204024 ?auto_204025 ) ) ( not ( = ?auto_204024 ?auto_204029 ) ) ( not ( = ?auto_204024 ?auto_204026 ) ) ( not ( = ?auto_204027 ?auto_204028 ) ) ( not ( = ?auto_204027 ?auto_204025 ) ) ( not ( = ?auto_204027 ?auto_204029 ) ) ( not ( = ?auto_204027 ?auto_204026 ) ) ( not ( = ?auto_204032 ?auto_204028 ) ) ( not ( = ?auto_204032 ?auto_204025 ) ) ( not ( = ?auto_204032 ?auto_204029 ) ) ( not ( = ?auto_204032 ?auto_204026 ) ) ( ON ?auto_204031 ?auto_204032 ) ( ON ?auto_204025 ?auto_204030 ) ( not ( = ?auto_204024 ?auto_204030 ) ) ( not ( = ?auto_204027 ?auto_204030 ) ) ( not ( = ?auto_204032 ?auto_204030 ) ) ( not ( = ?auto_204031 ?auto_204030 ) ) ( not ( = ?auto_204025 ?auto_204030 ) ) ( not ( = ?auto_204029 ?auto_204030 ) ) ( not ( = ?auto_204026 ?auto_204030 ) ) ( not ( = ?auto_204028 ?auto_204030 ) ) ( ON ?auto_204029 ?auto_204025 ) ( ON-TABLE ?auto_204030 ) ( ON ?auto_204026 ?auto_204029 ) ( CLEAR ?auto_204031 ) ( ON ?auto_204028 ?auto_204026 ) ( CLEAR ?auto_204028 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_204030 ?auto_204025 ?auto_204029 ?auto_204026 )
      ( MAKE-1PILE ?auto_204024 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_204033 - BLOCK
    )
    :vars
    (
      ?auto_204036 - BLOCK
      ?auto_204040 - BLOCK
      ?auto_204034 - BLOCK
      ?auto_204039 - BLOCK
      ?auto_204035 - BLOCK
      ?auto_204041 - BLOCK
      ?auto_204038 - BLOCK
      ?auto_204037 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_204036 ?auto_204033 ) ( ON-TABLE ?auto_204033 ) ( not ( = ?auto_204033 ?auto_204036 ) ) ( not ( = ?auto_204033 ?auto_204040 ) ) ( not ( = ?auto_204033 ?auto_204034 ) ) ( not ( = ?auto_204036 ?auto_204040 ) ) ( not ( = ?auto_204036 ?auto_204034 ) ) ( not ( = ?auto_204040 ?auto_204034 ) ) ( ON ?auto_204040 ?auto_204036 ) ( not ( = ?auto_204039 ?auto_204035 ) ) ( not ( = ?auto_204039 ?auto_204041 ) ) ( not ( = ?auto_204039 ?auto_204038 ) ) ( not ( = ?auto_204039 ?auto_204034 ) ) ( not ( = ?auto_204035 ?auto_204041 ) ) ( not ( = ?auto_204035 ?auto_204038 ) ) ( not ( = ?auto_204035 ?auto_204034 ) ) ( not ( = ?auto_204041 ?auto_204038 ) ) ( not ( = ?auto_204041 ?auto_204034 ) ) ( not ( = ?auto_204038 ?auto_204034 ) ) ( not ( = ?auto_204033 ?auto_204038 ) ) ( not ( = ?auto_204033 ?auto_204039 ) ) ( not ( = ?auto_204033 ?auto_204035 ) ) ( not ( = ?auto_204033 ?auto_204041 ) ) ( not ( = ?auto_204036 ?auto_204038 ) ) ( not ( = ?auto_204036 ?auto_204039 ) ) ( not ( = ?auto_204036 ?auto_204035 ) ) ( not ( = ?auto_204036 ?auto_204041 ) ) ( not ( = ?auto_204040 ?auto_204038 ) ) ( not ( = ?auto_204040 ?auto_204039 ) ) ( not ( = ?auto_204040 ?auto_204035 ) ) ( not ( = ?auto_204040 ?auto_204041 ) ) ( ON ?auto_204039 ?auto_204037 ) ( not ( = ?auto_204033 ?auto_204037 ) ) ( not ( = ?auto_204036 ?auto_204037 ) ) ( not ( = ?auto_204040 ?auto_204037 ) ) ( not ( = ?auto_204034 ?auto_204037 ) ) ( not ( = ?auto_204039 ?auto_204037 ) ) ( not ( = ?auto_204035 ?auto_204037 ) ) ( not ( = ?auto_204041 ?auto_204037 ) ) ( not ( = ?auto_204038 ?auto_204037 ) ) ( ON ?auto_204035 ?auto_204039 ) ( ON-TABLE ?auto_204037 ) ( ON ?auto_204041 ?auto_204035 ) ( ON ?auto_204038 ?auto_204041 ) ( CLEAR ?auto_204038 ) ( HOLDING ?auto_204034 ) ( CLEAR ?auto_204040 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_204033 ?auto_204036 ?auto_204040 ?auto_204034 )
      ( MAKE-1PILE ?auto_204033 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_204042 - BLOCK
    )
    :vars
    (
      ?auto_204046 - BLOCK
      ?auto_204049 - BLOCK
      ?auto_204045 - BLOCK
      ?auto_204050 - BLOCK
      ?auto_204044 - BLOCK
      ?auto_204043 - BLOCK
      ?auto_204047 - BLOCK
      ?auto_204048 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_204046 ?auto_204042 ) ( ON-TABLE ?auto_204042 ) ( not ( = ?auto_204042 ?auto_204046 ) ) ( not ( = ?auto_204042 ?auto_204049 ) ) ( not ( = ?auto_204042 ?auto_204045 ) ) ( not ( = ?auto_204046 ?auto_204049 ) ) ( not ( = ?auto_204046 ?auto_204045 ) ) ( not ( = ?auto_204049 ?auto_204045 ) ) ( ON ?auto_204049 ?auto_204046 ) ( not ( = ?auto_204050 ?auto_204044 ) ) ( not ( = ?auto_204050 ?auto_204043 ) ) ( not ( = ?auto_204050 ?auto_204047 ) ) ( not ( = ?auto_204050 ?auto_204045 ) ) ( not ( = ?auto_204044 ?auto_204043 ) ) ( not ( = ?auto_204044 ?auto_204047 ) ) ( not ( = ?auto_204044 ?auto_204045 ) ) ( not ( = ?auto_204043 ?auto_204047 ) ) ( not ( = ?auto_204043 ?auto_204045 ) ) ( not ( = ?auto_204047 ?auto_204045 ) ) ( not ( = ?auto_204042 ?auto_204047 ) ) ( not ( = ?auto_204042 ?auto_204050 ) ) ( not ( = ?auto_204042 ?auto_204044 ) ) ( not ( = ?auto_204042 ?auto_204043 ) ) ( not ( = ?auto_204046 ?auto_204047 ) ) ( not ( = ?auto_204046 ?auto_204050 ) ) ( not ( = ?auto_204046 ?auto_204044 ) ) ( not ( = ?auto_204046 ?auto_204043 ) ) ( not ( = ?auto_204049 ?auto_204047 ) ) ( not ( = ?auto_204049 ?auto_204050 ) ) ( not ( = ?auto_204049 ?auto_204044 ) ) ( not ( = ?auto_204049 ?auto_204043 ) ) ( ON ?auto_204050 ?auto_204048 ) ( not ( = ?auto_204042 ?auto_204048 ) ) ( not ( = ?auto_204046 ?auto_204048 ) ) ( not ( = ?auto_204049 ?auto_204048 ) ) ( not ( = ?auto_204045 ?auto_204048 ) ) ( not ( = ?auto_204050 ?auto_204048 ) ) ( not ( = ?auto_204044 ?auto_204048 ) ) ( not ( = ?auto_204043 ?auto_204048 ) ) ( not ( = ?auto_204047 ?auto_204048 ) ) ( ON ?auto_204044 ?auto_204050 ) ( ON-TABLE ?auto_204048 ) ( ON ?auto_204043 ?auto_204044 ) ( ON ?auto_204047 ?auto_204043 ) ( CLEAR ?auto_204049 ) ( ON ?auto_204045 ?auto_204047 ) ( CLEAR ?auto_204045 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_204048 ?auto_204050 ?auto_204044 ?auto_204043 ?auto_204047 )
      ( MAKE-1PILE ?auto_204042 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_204051 - BLOCK
    )
    :vars
    (
      ?auto_204052 - BLOCK
      ?auto_204059 - BLOCK
      ?auto_204053 - BLOCK
      ?auto_204057 - BLOCK
      ?auto_204055 - BLOCK
      ?auto_204056 - BLOCK
      ?auto_204058 - BLOCK
      ?auto_204054 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_204052 ?auto_204051 ) ( ON-TABLE ?auto_204051 ) ( not ( = ?auto_204051 ?auto_204052 ) ) ( not ( = ?auto_204051 ?auto_204059 ) ) ( not ( = ?auto_204051 ?auto_204053 ) ) ( not ( = ?auto_204052 ?auto_204059 ) ) ( not ( = ?auto_204052 ?auto_204053 ) ) ( not ( = ?auto_204059 ?auto_204053 ) ) ( not ( = ?auto_204057 ?auto_204055 ) ) ( not ( = ?auto_204057 ?auto_204056 ) ) ( not ( = ?auto_204057 ?auto_204058 ) ) ( not ( = ?auto_204057 ?auto_204053 ) ) ( not ( = ?auto_204055 ?auto_204056 ) ) ( not ( = ?auto_204055 ?auto_204058 ) ) ( not ( = ?auto_204055 ?auto_204053 ) ) ( not ( = ?auto_204056 ?auto_204058 ) ) ( not ( = ?auto_204056 ?auto_204053 ) ) ( not ( = ?auto_204058 ?auto_204053 ) ) ( not ( = ?auto_204051 ?auto_204058 ) ) ( not ( = ?auto_204051 ?auto_204057 ) ) ( not ( = ?auto_204051 ?auto_204055 ) ) ( not ( = ?auto_204051 ?auto_204056 ) ) ( not ( = ?auto_204052 ?auto_204058 ) ) ( not ( = ?auto_204052 ?auto_204057 ) ) ( not ( = ?auto_204052 ?auto_204055 ) ) ( not ( = ?auto_204052 ?auto_204056 ) ) ( not ( = ?auto_204059 ?auto_204058 ) ) ( not ( = ?auto_204059 ?auto_204057 ) ) ( not ( = ?auto_204059 ?auto_204055 ) ) ( not ( = ?auto_204059 ?auto_204056 ) ) ( ON ?auto_204057 ?auto_204054 ) ( not ( = ?auto_204051 ?auto_204054 ) ) ( not ( = ?auto_204052 ?auto_204054 ) ) ( not ( = ?auto_204059 ?auto_204054 ) ) ( not ( = ?auto_204053 ?auto_204054 ) ) ( not ( = ?auto_204057 ?auto_204054 ) ) ( not ( = ?auto_204055 ?auto_204054 ) ) ( not ( = ?auto_204056 ?auto_204054 ) ) ( not ( = ?auto_204058 ?auto_204054 ) ) ( ON ?auto_204055 ?auto_204057 ) ( ON-TABLE ?auto_204054 ) ( ON ?auto_204056 ?auto_204055 ) ( ON ?auto_204058 ?auto_204056 ) ( ON ?auto_204053 ?auto_204058 ) ( CLEAR ?auto_204053 ) ( HOLDING ?auto_204059 ) ( CLEAR ?auto_204052 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_204051 ?auto_204052 ?auto_204059 )
      ( MAKE-1PILE ?auto_204051 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_204060 - BLOCK
    )
    :vars
    (
      ?auto_204068 - BLOCK
      ?auto_204067 - BLOCK
      ?auto_204064 - BLOCK
      ?auto_204061 - BLOCK
      ?auto_204065 - BLOCK
      ?auto_204066 - BLOCK
      ?auto_204063 - BLOCK
      ?auto_204062 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_204068 ?auto_204060 ) ( ON-TABLE ?auto_204060 ) ( not ( = ?auto_204060 ?auto_204068 ) ) ( not ( = ?auto_204060 ?auto_204067 ) ) ( not ( = ?auto_204060 ?auto_204064 ) ) ( not ( = ?auto_204068 ?auto_204067 ) ) ( not ( = ?auto_204068 ?auto_204064 ) ) ( not ( = ?auto_204067 ?auto_204064 ) ) ( not ( = ?auto_204061 ?auto_204065 ) ) ( not ( = ?auto_204061 ?auto_204066 ) ) ( not ( = ?auto_204061 ?auto_204063 ) ) ( not ( = ?auto_204061 ?auto_204064 ) ) ( not ( = ?auto_204065 ?auto_204066 ) ) ( not ( = ?auto_204065 ?auto_204063 ) ) ( not ( = ?auto_204065 ?auto_204064 ) ) ( not ( = ?auto_204066 ?auto_204063 ) ) ( not ( = ?auto_204066 ?auto_204064 ) ) ( not ( = ?auto_204063 ?auto_204064 ) ) ( not ( = ?auto_204060 ?auto_204063 ) ) ( not ( = ?auto_204060 ?auto_204061 ) ) ( not ( = ?auto_204060 ?auto_204065 ) ) ( not ( = ?auto_204060 ?auto_204066 ) ) ( not ( = ?auto_204068 ?auto_204063 ) ) ( not ( = ?auto_204068 ?auto_204061 ) ) ( not ( = ?auto_204068 ?auto_204065 ) ) ( not ( = ?auto_204068 ?auto_204066 ) ) ( not ( = ?auto_204067 ?auto_204063 ) ) ( not ( = ?auto_204067 ?auto_204061 ) ) ( not ( = ?auto_204067 ?auto_204065 ) ) ( not ( = ?auto_204067 ?auto_204066 ) ) ( ON ?auto_204061 ?auto_204062 ) ( not ( = ?auto_204060 ?auto_204062 ) ) ( not ( = ?auto_204068 ?auto_204062 ) ) ( not ( = ?auto_204067 ?auto_204062 ) ) ( not ( = ?auto_204064 ?auto_204062 ) ) ( not ( = ?auto_204061 ?auto_204062 ) ) ( not ( = ?auto_204065 ?auto_204062 ) ) ( not ( = ?auto_204066 ?auto_204062 ) ) ( not ( = ?auto_204063 ?auto_204062 ) ) ( ON ?auto_204065 ?auto_204061 ) ( ON-TABLE ?auto_204062 ) ( ON ?auto_204066 ?auto_204065 ) ( ON ?auto_204063 ?auto_204066 ) ( ON ?auto_204064 ?auto_204063 ) ( CLEAR ?auto_204068 ) ( ON ?auto_204067 ?auto_204064 ) ( CLEAR ?auto_204067 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_204062 ?auto_204061 ?auto_204065 ?auto_204066 ?auto_204063 ?auto_204064 )
      ( MAKE-1PILE ?auto_204060 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_204087 - BLOCK
    )
    :vars
    (
      ?auto_204091 - BLOCK
      ?auto_204092 - BLOCK
      ?auto_204088 - BLOCK
      ?auto_204093 - BLOCK
      ?auto_204095 - BLOCK
      ?auto_204089 - BLOCK
      ?auto_204090 - BLOCK
      ?auto_204094 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_204087 ?auto_204091 ) ) ( not ( = ?auto_204087 ?auto_204092 ) ) ( not ( = ?auto_204087 ?auto_204088 ) ) ( not ( = ?auto_204091 ?auto_204092 ) ) ( not ( = ?auto_204091 ?auto_204088 ) ) ( not ( = ?auto_204092 ?auto_204088 ) ) ( not ( = ?auto_204093 ?auto_204095 ) ) ( not ( = ?auto_204093 ?auto_204089 ) ) ( not ( = ?auto_204093 ?auto_204090 ) ) ( not ( = ?auto_204093 ?auto_204088 ) ) ( not ( = ?auto_204095 ?auto_204089 ) ) ( not ( = ?auto_204095 ?auto_204090 ) ) ( not ( = ?auto_204095 ?auto_204088 ) ) ( not ( = ?auto_204089 ?auto_204090 ) ) ( not ( = ?auto_204089 ?auto_204088 ) ) ( not ( = ?auto_204090 ?auto_204088 ) ) ( not ( = ?auto_204087 ?auto_204090 ) ) ( not ( = ?auto_204087 ?auto_204093 ) ) ( not ( = ?auto_204087 ?auto_204095 ) ) ( not ( = ?auto_204087 ?auto_204089 ) ) ( not ( = ?auto_204091 ?auto_204090 ) ) ( not ( = ?auto_204091 ?auto_204093 ) ) ( not ( = ?auto_204091 ?auto_204095 ) ) ( not ( = ?auto_204091 ?auto_204089 ) ) ( not ( = ?auto_204092 ?auto_204090 ) ) ( not ( = ?auto_204092 ?auto_204093 ) ) ( not ( = ?auto_204092 ?auto_204095 ) ) ( not ( = ?auto_204092 ?auto_204089 ) ) ( ON ?auto_204093 ?auto_204094 ) ( not ( = ?auto_204087 ?auto_204094 ) ) ( not ( = ?auto_204091 ?auto_204094 ) ) ( not ( = ?auto_204092 ?auto_204094 ) ) ( not ( = ?auto_204088 ?auto_204094 ) ) ( not ( = ?auto_204093 ?auto_204094 ) ) ( not ( = ?auto_204095 ?auto_204094 ) ) ( not ( = ?auto_204089 ?auto_204094 ) ) ( not ( = ?auto_204090 ?auto_204094 ) ) ( ON ?auto_204095 ?auto_204093 ) ( ON-TABLE ?auto_204094 ) ( ON ?auto_204089 ?auto_204095 ) ( ON ?auto_204090 ?auto_204089 ) ( ON ?auto_204088 ?auto_204090 ) ( ON ?auto_204092 ?auto_204088 ) ( ON ?auto_204091 ?auto_204092 ) ( CLEAR ?auto_204091 ) ( HOLDING ?auto_204087 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_204087 ?auto_204091 )
      ( MAKE-1PILE ?auto_204087 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_204096 - BLOCK
    )
    :vars
    (
      ?auto_204098 - BLOCK
      ?auto_204099 - BLOCK
      ?auto_204104 - BLOCK
      ?auto_204103 - BLOCK
      ?auto_204102 - BLOCK
      ?auto_204097 - BLOCK
      ?auto_204100 - BLOCK
      ?auto_204101 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_204096 ?auto_204098 ) ) ( not ( = ?auto_204096 ?auto_204099 ) ) ( not ( = ?auto_204096 ?auto_204104 ) ) ( not ( = ?auto_204098 ?auto_204099 ) ) ( not ( = ?auto_204098 ?auto_204104 ) ) ( not ( = ?auto_204099 ?auto_204104 ) ) ( not ( = ?auto_204103 ?auto_204102 ) ) ( not ( = ?auto_204103 ?auto_204097 ) ) ( not ( = ?auto_204103 ?auto_204100 ) ) ( not ( = ?auto_204103 ?auto_204104 ) ) ( not ( = ?auto_204102 ?auto_204097 ) ) ( not ( = ?auto_204102 ?auto_204100 ) ) ( not ( = ?auto_204102 ?auto_204104 ) ) ( not ( = ?auto_204097 ?auto_204100 ) ) ( not ( = ?auto_204097 ?auto_204104 ) ) ( not ( = ?auto_204100 ?auto_204104 ) ) ( not ( = ?auto_204096 ?auto_204100 ) ) ( not ( = ?auto_204096 ?auto_204103 ) ) ( not ( = ?auto_204096 ?auto_204102 ) ) ( not ( = ?auto_204096 ?auto_204097 ) ) ( not ( = ?auto_204098 ?auto_204100 ) ) ( not ( = ?auto_204098 ?auto_204103 ) ) ( not ( = ?auto_204098 ?auto_204102 ) ) ( not ( = ?auto_204098 ?auto_204097 ) ) ( not ( = ?auto_204099 ?auto_204100 ) ) ( not ( = ?auto_204099 ?auto_204103 ) ) ( not ( = ?auto_204099 ?auto_204102 ) ) ( not ( = ?auto_204099 ?auto_204097 ) ) ( ON ?auto_204103 ?auto_204101 ) ( not ( = ?auto_204096 ?auto_204101 ) ) ( not ( = ?auto_204098 ?auto_204101 ) ) ( not ( = ?auto_204099 ?auto_204101 ) ) ( not ( = ?auto_204104 ?auto_204101 ) ) ( not ( = ?auto_204103 ?auto_204101 ) ) ( not ( = ?auto_204102 ?auto_204101 ) ) ( not ( = ?auto_204097 ?auto_204101 ) ) ( not ( = ?auto_204100 ?auto_204101 ) ) ( ON ?auto_204102 ?auto_204103 ) ( ON-TABLE ?auto_204101 ) ( ON ?auto_204097 ?auto_204102 ) ( ON ?auto_204100 ?auto_204097 ) ( ON ?auto_204104 ?auto_204100 ) ( ON ?auto_204099 ?auto_204104 ) ( ON ?auto_204098 ?auto_204099 ) ( ON ?auto_204096 ?auto_204098 ) ( CLEAR ?auto_204096 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_204101 ?auto_204103 ?auto_204102 ?auto_204097 ?auto_204100 ?auto_204104 ?auto_204099 ?auto_204098 )
      ( MAKE-1PILE ?auto_204096 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_204112 - BLOCK
      ?auto_204113 - BLOCK
      ?auto_204114 - BLOCK
      ?auto_204115 - BLOCK
      ?auto_204116 - BLOCK
      ?auto_204117 - BLOCK
      ?auto_204118 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_204118 ) ( CLEAR ?auto_204117 ) ( ON-TABLE ?auto_204112 ) ( ON ?auto_204113 ?auto_204112 ) ( ON ?auto_204114 ?auto_204113 ) ( ON ?auto_204115 ?auto_204114 ) ( ON ?auto_204116 ?auto_204115 ) ( ON ?auto_204117 ?auto_204116 ) ( not ( = ?auto_204112 ?auto_204113 ) ) ( not ( = ?auto_204112 ?auto_204114 ) ) ( not ( = ?auto_204112 ?auto_204115 ) ) ( not ( = ?auto_204112 ?auto_204116 ) ) ( not ( = ?auto_204112 ?auto_204117 ) ) ( not ( = ?auto_204112 ?auto_204118 ) ) ( not ( = ?auto_204113 ?auto_204114 ) ) ( not ( = ?auto_204113 ?auto_204115 ) ) ( not ( = ?auto_204113 ?auto_204116 ) ) ( not ( = ?auto_204113 ?auto_204117 ) ) ( not ( = ?auto_204113 ?auto_204118 ) ) ( not ( = ?auto_204114 ?auto_204115 ) ) ( not ( = ?auto_204114 ?auto_204116 ) ) ( not ( = ?auto_204114 ?auto_204117 ) ) ( not ( = ?auto_204114 ?auto_204118 ) ) ( not ( = ?auto_204115 ?auto_204116 ) ) ( not ( = ?auto_204115 ?auto_204117 ) ) ( not ( = ?auto_204115 ?auto_204118 ) ) ( not ( = ?auto_204116 ?auto_204117 ) ) ( not ( = ?auto_204116 ?auto_204118 ) ) ( not ( = ?auto_204117 ?auto_204118 ) ) )
    :subtasks
    ( ( !STACK ?auto_204118 ?auto_204117 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_204119 - BLOCK
      ?auto_204120 - BLOCK
      ?auto_204121 - BLOCK
      ?auto_204122 - BLOCK
      ?auto_204123 - BLOCK
      ?auto_204124 - BLOCK
      ?auto_204125 - BLOCK
    )
    :vars
    (
      ?auto_204126 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_204124 ) ( ON-TABLE ?auto_204119 ) ( ON ?auto_204120 ?auto_204119 ) ( ON ?auto_204121 ?auto_204120 ) ( ON ?auto_204122 ?auto_204121 ) ( ON ?auto_204123 ?auto_204122 ) ( ON ?auto_204124 ?auto_204123 ) ( not ( = ?auto_204119 ?auto_204120 ) ) ( not ( = ?auto_204119 ?auto_204121 ) ) ( not ( = ?auto_204119 ?auto_204122 ) ) ( not ( = ?auto_204119 ?auto_204123 ) ) ( not ( = ?auto_204119 ?auto_204124 ) ) ( not ( = ?auto_204119 ?auto_204125 ) ) ( not ( = ?auto_204120 ?auto_204121 ) ) ( not ( = ?auto_204120 ?auto_204122 ) ) ( not ( = ?auto_204120 ?auto_204123 ) ) ( not ( = ?auto_204120 ?auto_204124 ) ) ( not ( = ?auto_204120 ?auto_204125 ) ) ( not ( = ?auto_204121 ?auto_204122 ) ) ( not ( = ?auto_204121 ?auto_204123 ) ) ( not ( = ?auto_204121 ?auto_204124 ) ) ( not ( = ?auto_204121 ?auto_204125 ) ) ( not ( = ?auto_204122 ?auto_204123 ) ) ( not ( = ?auto_204122 ?auto_204124 ) ) ( not ( = ?auto_204122 ?auto_204125 ) ) ( not ( = ?auto_204123 ?auto_204124 ) ) ( not ( = ?auto_204123 ?auto_204125 ) ) ( not ( = ?auto_204124 ?auto_204125 ) ) ( ON ?auto_204125 ?auto_204126 ) ( CLEAR ?auto_204125 ) ( HAND-EMPTY ) ( not ( = ?auto_204119 ?auto_204126 ) ) ( not ( = ?auto_204120 ?auto_204126 ) ) ( not ( = ?auto_204121 ?auto_204126 ) ) ( not ( = ?auto_204122 ?auto_204126 ) ) ( not ( = ?auto_204123 ?auto_204126 ) ) ( not ( = ?auto_204124 ?auto_204126 ) ) ( not ( = ?auto_204125 ?auto_204126 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_204125 ?auto_204126 )
      ( MAKE-7PILE ?auto_204119 ?auto_204120 ?auto_204121 ?auto_204122 ?auto_204123 ?auto_204124 ?auto_204125 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_204127 - BLOCK
      ?auto_204128 - BLOCK
      ?auto_204129 - BLOCK
      ?auto_204130 - BLOCK
      ?auto_204131 - BLOCK
      ?auto_204132 - BLOCK
      ?auto_204133 - BLOCK
    )
    :vars
    (
      ?auto_204134 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_204127 ) ( ON ?auto_204128 ?auto_204127 ) ( ON ?auto_204129 ?auto_204128 ) ( ON ?auto_204130 ?auto_204129 ) ( ON ?auto_204131 ?auto_204130 ) ( not ( = ?auto_204127 ?auto_204128 ) ) ( not ( = ?auto_204127 ?auto_204129 ) ) ( not ( = ?auto_204127 ?auto_204130 ) ) ( not ( = ?auto_204127 ?auto_204131 ) ) ( not ( = ?auto_204127 ?auto_204132 ) ) ( not ( = ?auto_204127 ?auto_204133 ) ) ( not ( = ?auto_204128 ?auto_204129 ) ) ( not ( = ?auto_204128 ?auto_204130 ) ) ( not ( = ?auto_204128 ?auto_204131 ) ) ( not ( = ?auto_204128 ?auto_204132 ) ) ( not ( = ?auto_204128 ?auto_204133 ) ) ( not ( = ?auto_204129 ?auto_204130 ) ) ( not ( = ?auto_204129 ?auto_204131 ) ) ( not ( = ?auto_204129 ?auto_204132 ) ) ( not ( = ?auto_204129 ?auto_204133 ) ) ( not ( = ?auto_204130 ?auto_204131 ) ) ( not ( = ?auto_204130 ?auto_204132 ) ) ( not ( = ?auto_204130 ?auto_204133 ) ) ( not ( = ?auto_204131 ?auto_204132 ) ) ( not ( = ?auto_204131 ?auto_204133 ) ) ( not ( = ?auto_204132 ?auto_204133 ) ) ( ON ?auto_204133 ?auto_204134 ) ( CLEAR ?auto_204133 ) ( not ( = ?auto_204127 ?auto_204134 ) ) ( not ( = ?auto_204128 ?auto_204134 ) ) ( not ( = ?auto_204129 ?auto_204134 ) ) ( not ( = ?auto_204130 ?auto_204134 ) ) ( not ( = ?auto_204131 ?auto_204134 ) ) ( not ( = ?auto_204132 ?auto_204134 ) ) ( not ( = ?auto_204133 ?auto_204134 ) ) ( HOLDING ?auto_204132 ) ( CLEAR ?auto_204131 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_204127 ?auto_204128 ?auto_204129 ?auto_204130 ?auto_204131 ?auto_204132 )
      ( MAKE-7PILE ?auto_204127 ?auto_204128 ?auto_204129 ?auto_204130 ?auto_204131 ?auto_204132 ?auto_204133 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_204135 - BLOCK
      ?auto_204136 - BLOCK
      ?auto_204137 - BLOCK
      ?auto_204138 - BLOCK
      ?auto_204139 - BLOCK
      ?auto_204140 - BLOCK
      ?auto_204141 - BLOCK
    )
    :vars
    (
      ?auto_204142 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_204135 ) ( ON ?auto_204136 ?auto_204135 ) ( ON ?auto_204137 ?auto_204136 ) ( ON ?auto_204138 ?auto_204137 ) ( ON ?auto_204139 ?auto_204138 ) ( not ( = ?auto_204135 ?auto_204136 ) ) ( not ( = ?auto_204135 ?auto_204137 ) ) ( not ( = ?auto_204135 ?auto_204138 ) ) ( not ( = ?auto_204135 ?auto_204139 ) ) ( not ( = ?auto_204135 ?auto_204140 ) ) ( not ( = ?auto_204135 ?auto_204141 ) ) ( not ( = ?auto_204136 ?auto_204137 ) ) ( not ( = ?auto_204136 ?auto_204138 ) ) ( not ( = ?auto_204136 ?auto_204139 ) ) ( not ( = ?auto_204136 ?auto_204140 ) ) ( not ( = ?auto_204136 ?auto_204141 ) ) ( not ( = ?auto_204137 ?auto_204138 ) ) ( not ( = ?auto_204137 ?auto_204139 ) ) ( not ( = ?auto_204137 ?auto_204140 ) ) ( not ( = ?auto_204137 ?auto_204141 ) ) ( not ( = ?auto_204138 ?auto_204139 ) ) ( not ( = ?auto_204138 ?auto_204140 ) ) ( not ( = ?auto_204138 ?auto_204141 ) ) ( not ( = ?auto_204139 ?auto_204140 ) ) ( not ( = ?auto_204139 ?auto_204141 ) ) ( not ( = ?auto_204140 ?auto_204141 ) ) ( ON ?auto_204141 ?auto_204142 ) ( not ( = ?auto_204135 ?auto_204142 ) ) ( not ( = ?auto_204136 ?auto_204142 ) ) ( not ( = ?auto_204137 ?auto_204142 ) ) ( not ( = ?auto_204138 ?auto_204142 ) ) ( not ( = ?auto_204139 ?auto_204142 ) ) ( not ( = ?auto_204140 ?auto_204142 ) ) ( not ( = ?auto_204141 ?auto_204142 ) ) ( CLEAR ?auto_204139 ) ( ON ?auto_204140 ?auto_204141 ) ( CLEAR ?auto_204140 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_204142 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_204142 ?auto_204141 )
      ( MAKE-7PILE ?auto_204135 ?auto_204136 ?auto_204137 ?auto_204138 ?auto_204139 ?auto_204140 ?auto_204141 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_204143 - BLOCK
      ?auto_204144 - BLOCK
      ?auto_204145 - BLOCK
      ?auto_204146 - BLOCK
      ?auto_204147 - BLOCK
      ?auto_204148 - BLOCK
      ?auto_204149 - BLOCK
    )
    :vars
    (
      ?auto_204150 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_204143 ) ( ON ?auto_204144 ?auto_204143 ) ( ON ?auto_204145 ?auto_204144 ) ( ON ?auto_204146 ?auto_204145 ) ( not ( = ?auto_204143 ?auto_204144 ) ) ( not ( = ?auto_204143 ?auto_204145 ) ) ( not ( = ?auto_204143 ?auto_204146 ) ) ( not ( = ?auto_204143 ?auto_204147 ) ) ( not ( = ?auto_204143 ?auto_204148 ) ) ( not ( = ?auto_204143 ?auto_204149 ) ) ( not ( = ?auto_204144 ?auto_204145 ) ) ( not ( = ?auto_204144 ?auto_204146 ) ) ( not ( = ?auto_204144 ?auto_204147 ) ) ( not ( = ?auto_204144 ?auto_204148 ) ) ( not ( = ?auto_204144 ?auto_204149 ) ) ( not ( = ?auto_204145 ?auto_204146 ) ) ( not ( = ?auto_204145 ?auto_204147 ) ) ( not ( = ?auto_204145 ?auto_204148 ) ) ( not ( = ?auto_204145 ?auto_204149 ) ) ( not ( = ?auto_204146 ?auto_204147 ) ) ( not ( = ?auto_204146 ?auto_204148 ) ) ( not ( = ?auto_204146 ?auto_204149 ) ) ( not ( = ?auto_204147 ?auto_204148 ) ) ( not ( = ?auto_204147 ?auto_204149 ) ) ( not ( = ?auto_204148 ?auto_204149 ) ) ( ON ?auto_204149 ?auto_204150 ) ( not ( = ?auto_204143 ?auto_204150 ) ) ( not ( = ?auto_204144 ?auto_204150 ) ) ( not ( = ?auto_204145 ?auto_204150 ) ) ( not ( = ?auto_204146 ?auto_204150 ) ) ( not ( = ?auto_204147 ?auto_204150 ) ) ( not ( = ?auto_204148 ?auto_204150 ) ) ( not ( = ?auto_204149 ?auto_204150 ) ) ( ON ?auto_204148 ?auto_204149 ) ( CLEAR ?auto_204148 ) ( ON-TABLE ?auto_204150 ) ( HOLDING ?auto_204147 ) ( CLEAR ?auto_204146 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_204143 ?auto_204144 ?auto_204145 ?auto_204146 ?auto_204147 )
      ( MAKE-7PILE ?auto_204143 ?auto_204144 ?auto_204145 ?auto_204146 ?auto_204147 ?auto_204148 ?auto_204149 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_204151 - BLOCK
      ?auto_204152 - BLOCK
      ?auto_204153 - BLOCK
      ?auto_204154 - BLOCK
      ?auto_204155 - BLOCK
      ?auto_204156 - BLOCK
      ?auto_204157 - BLOCK
    )
    :vars
    (
      ?auto_204158 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_204151 ) ( ON ?auto_204152 ?auto_204151 ) ( ON ?auto_204153 ?auto_204152 ) ( ON ?auto_204154 ?auto_204153 ) ( not ( = ?auto_204151 ?auto_204152 ) ) ( not ( = ?auto_204151 ?auto_204153 ) ) ( not ( = ?auto_204151 ?auto_204154 ) ) ( not ( = ?auto_204151 ?auto_204155 ) ) ( not ( = ?auto_204151 ?auto_204156 ) ) ( not ( = ?auto_204151 ?auto_204157 ) ) ( not ( = ?auto_204152 ?auto_204153 ) ) ( not ( = ?auto_204152 ?auto_204154 ) ) ( not ( = ?auto_204152 ?auto_204155 ) ) ( not ( = ?auto_204152 ?auto_204156 ) ) ( not ( = ?auto_204152 ?auto_204157 ) ) ( not ( = ?auto_204153 ?auto_204154 ) ) ( not ( = ?auto_204153 ?auto_204155 ) ) ( not ( = ?auto_204153 ?auto_204156 ) ) ( not ( = ?auto_204153 ?auto_204157 ) ) ( not ( = ?auto_204154 ?auto_204155 ) ) ( not ( = ?auto_204154 ?auto_204156 ) ) ( not ( = ?auto_204154 ?auto_204157 ) ) ( not ( = ?auto_204155 ?auto_204156 ) ) ( not ( = ?auto_204155 ?auto_204157 ) ) ( not ( = ?auto_204156 ?auto_204157 ) ) ( ON ?auto_204157 ?auto_204158 ) ( not ( = ?auto_204151 ?auto_204158 ) ) ( not ( = ?auto_204152 ?auto_204158 ) ) ( not ( = ?auto_204153 ?auto_204158 ) ) ( not ( = ?auto_204154 ?auto_204158 ) ) ( not ( = ?auto_204155 ?auto_204158 ) ) ( not ( = ?auto_204156 ?auto_204158 ) ) ( not ( = ?auto_204157 ?auto_204158 ) ) ( ON ?auto_204156 ?auto_204157 ) ( ON-TABLE ?auto_204158 ) ( CLEAR ?auto_204154 ) ( ON ?auto_204155 ?auto_204156 ) ( CLEAR ?auto_204155 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_204158 ?auto_204157 ?auto_204156 )
      ( MAKE-7PILE ?auto_204151 ?auto_204152 ?auto_204153 ?auto_204154 ?auto_204155 ?auto_204156 ?auto_204157 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_204159 - BLOCK
      ?auto_204160 - BLOCK
      ?auto_204161 - BLOCK
      ?auto_204162 - BLOCK
      ?auto_204163 - BLOCK
      ?auto_204164 - BLOCK
      ?auto_204165 - BLOCK
    )
    :vars
    (
      ?auto_204166 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_204159 ) ( ON ?auto_204160 ?auto_204159 ) ( ON ?auto_204161 ?auto_204160 ) ( not ( = ?auto_204159 ?auto_204160 ) ) ( not ( = ?auto_204159 ?auto_204161 ) ) ( not ( = ?auto_204159 ?auto_204162 ) ) ( not ( = ?auto_204159 ?auto_204163 ) ) ( not ( = ?auto_204159 ?auto_204164 ) ) ( not ( = ?auto_204159 ?auto_204165 ) ) ( not ( = ?auto_204160 ?auto_204161 ) ) ( not ( = ?auto_204160 ?auto_204162 ) ) ( not ( = ?auto_204160 ?auto_204163 ) ) ( not ( = ?auto_204160 ?auto_204164 ) ) ( not ( = ?auto_204160 ?auto_204165 ) ) ( not ( = ?auto_204161 ?auto_204162 ) ) ( not ( = ?auto_204161 ?auto_204163 ) ) ( not ( = ?auto_204161 ?auto_204164 ) ) ( not ( = ?auto_204161 ?auto_204165 ) ) ( not ( = ?auto_204162 ?auto_204163 ) ) ( not ( = ?auto_204162 ?auto_204164 ) ) ( not ( = ?auto_204162 ?auto_204165 ) ) ( not ( = ?auto_204163 ?auto_204164 ) ) ( not ( = ?auto_204163 ?auto_204165 ) ) ( not ( = ?auto_204164 ?auto_204165 ) ) ( ON ?auto_204165 ?auto_204166 ) ( not ( = ?auto_204159 ?auto_204166 ) ) ( not ( = ?auto_204160 ?auto_204166 ) ) ( not ( = ?auto_204161 ?auto_204166 ) ) ( not ( = ?auto_204162 ?auto_204166 ) ) ( not ( = ?auto_204163 ?auto_204166 ) ) ( not ( = ?auto_204164 ?auto_204166 ) ) ( not ( = ?auto_204165 ?auto_204166 ) ) ( ON ?auto_204164 ?auto_204165 ) ( ON-TABLE ?auto_204166 ) ( ON ?auto_204163 ?auto_204164 ) ( CLEAR ?auto_204163 ) ( HOLDING ?auto_204162 ) ( CLEAR ?auto_204161 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_204159 ?auto_204160 ?auto_204161 ?auto_204162 )
      ( MAKE-7PILE ?auto_204159 ?auto_204160 ?auto_204161 ?auto_204162 ?auto_204163 ?auto_204164 ?auto_204165 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_204167 - BLOCK
      ?auto_204168 - BLOCK
      ?auto_204169 - BLOCK
      ?auto_204170 - BLOCK
      ?auto_204171 - BLOCK
      ?auto_204172 - BLOCK
      ?auto_204173 - BLOCK
    )
    :vars
    (
      ?auto_204174 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_204167 ) ( ON ?auto_204168 ?auto_204167 ) ( ON ?auto_204169 ?auto_204168 ) ( not ( = ?auto_204167 ?auto_204168 ) ) ( not ( = ?auto_204167 ?auto_204169 ) ) ( not ( = ?auto_204167 ?auto_204170 ) ) ( not ( = ?auto_204167 ?auto_204171 ) ) ( not ( = ?auto_204167 ?auto_204172 ) ) ( not ( = ?auto_204167 ?auto_204173 ) ) ( not ( = ?auto_204168 ?auto_204169 ) ) ( not ( = ?auto_204168 ?auto_204170 ) ) ( not ( = ?auto_204168 ?auto_204171 ) ) ( not ( = ?auto_204168 ?auto_204172 ) ) ( not ( = ?auto_204168 ?auto_204173 ) ) ( not ( = ?auto_204169 ?auto_204170 ) ) ( not ( = ?auto_204169 ?auto_204171 ) ) ( not ( = ?auto_204169 ?auto_204172 ) ) ( not ( = ?auto_204169 ?auto_204173 ) ) ( not ( = ?auto_204170 ?auto_204171 ) ) ( not ( = ?auto_204170 ?auto_204172 ) ) ( not ( = ?auto_204170 ?auto_204173 ) ) ( not ( = ?auto_204171 ?auto_204172 ) ) ( not ( = ?auto_204171 ?auto_204173 ) ) ( not ( = ?auto_204172 ?auto_204173 ) ) ( ON ?auto_204173 ?auto_204174 ) ( not ( = ?auto_204167 ?auto_204174 ) ) ( not ( = ?auto_204168 ?auto_204174 ) ) ( not ( = ?auto_204169 ?auto_204174 ) ) ( not ( = ?auto_204170 ?auto_204174 ) ) ( not ( = ?auto_204171 ?auto_204174 ) ) ( not ( = ?auto_204172 ?auto_204174 ) ) ( not ( = ?auto_204173 ?auto_204174 ) ) ( ON ?auto_204172 ?auto_204173 ) ( ON-TABLE ?auto_204174 ) ( ON ?auto_204171 ?auto_204172 ) ( CLEAR ?auto_204169 ) ( ON ?auto_204170 ?auto_204171 ) ( CLEAR ?auto_204170 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_204174 ?auto_204173 ?auto_204172 ?auto_204171 )
      ( MAKE-7PILE ?auto_204167 ?auto_204168 ?auto_204169 ?auto_204170 ?auto_204171 ?auto_204172 ?auto_204173 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_204175 - BLOCK
      ?auto_204176 - BLOCK
      ?auto_204177 - BLOCK
      ?auto_204178 - BLOCK
      ?auto_204179 - BLOCK
      ?auto_204180 - BLOCK
      ?auto_204181 - BLOCK
    )
    :vars
    (
      ?auto_204182 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_204175 ) ( ON ?auto_204176 ?auto_204175 ) ( not ( = ?auto_204175 ?auto_204176 ) ) ( not ( = ?auto_204175 ?auto_204177 ) ) ( not ( = ?auto_204175 ?auto_204178 ) ) ( not ( = ?auto_204175 ?auto_204179 ) ) ( not ( = ?auto_204175 ?auto_204180 ) ) ( not ( = ?auto_204175 ?auto_204181 ) ) ( not ( = ?auto_204176 ?auto_204177 ) ) ( not ( = ?auto_204176 ?auto_204178 ) ) ( not ( = ?auto_204176 ?auto_204179 ) ) ( not ( = ?auto_204176 ?auto_204180 ) ) ( not ( = ?auto_204176 ?auto_204181 ) ) ( not ( = ?auto_204177 ?auto_204178 ) ) ( not ( = ?auto_204177 ?auto_204179 ) ) ( not ( = ?auto_204177 ?auto_204180 ) ) ( not ( = ?auto_204177 ?auto_204181 ) ) ( not ( = ?auto_204178 ?auto_204179 ) ) ( not ( = ?auto_204178 ?auto_204180 ) ) ( not ( = ?auto_204178 ?auto_204181 ) ) ( not ( = ?auto_204179 ?auto_204180 ) ) ( not ( = ?auto_204179 ?auto_204181 ) ) ( not ( = ?auto_204180 ?auto_204181 ) ) ( ON ?auto_204181 ?auto_204182 ) ( not ( = ?auto_204175 ?auto_204182 ) ) ( not ( = ?auto_204176 ?auto_204182 ) ) ( not ( = ?auto_204177 ?auto_204182 ) ) ( not ( = ?auto_204178 ?auto_204182 ) ) ( not ( = ?auto_204179 ?auto_204182 ) ) ( not ( = ?auto_204180 ?auto_204182 ) ) ( not ( = ?auto_204181 ?auto_204182 ) ) ( ON ?auto_204180 ?auto_204181 ) ( ON-TABLE ?auto_204182 ) ( ON ?auto_204179 ?auto_204180 ) ( ON ?auto_204178 ?auto_204179 ) ( CLEAR ?auto_204178 ) ( HOLDING ?auto_204177 ) ( CLEAR ?auto_204176 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_204175 ?auto_204176 ?auto_204177 )
      ( MAKE-7PILE ?auto_204175 ?auto_204176 ?auto_204177 ?auto_204178 ?auto_204179 ?auto_204180 ?auto_204181 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_204183 - BLOCK
      ?auto_204184 - BLOCK
      ?auto_204185 - BLOCK
      ?auto_204186 - BLOCK
      ?auto_204187 - BLOCK
      ?auto_204188 - BLOCK
      ?auto_204189 - BLOCK
    )
    :vars
    (
      ?auto_204190 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_204183 ) ( ON ?auto_204184 ?auto_204183 ) ( not ( = ?auto_204183 ?auto_204184 ) ) ( not ( = ?auto_204183 ?auto_204185 ) ) ( not ( = ?auto_204183 ?auto_204186 ) ) ( not ( = ?auto_204183 ?auto_204187 ) ) ( not ( = ?auto_204183 ?auto_204188 ) ) ( not ( = ?auto_204183 ?auto_204189 ) ) ( not ( = ?auto_204184 ?auto_204185 ) ) ( not ( = ?auto_204184 ?auto_204186 ) ) ( not ( = ?auto_204184 ?auto_204187 ) ) ( not ( = ?auto_204184 ?auto_204188 ) ) ( not ( = ?auto_204184 ?auto_204189 ) ) ( not ( = ?auto_204185 ?auto_204186 ) ) ( not ( = ?auto_204185 ?auto_204187 ) ) ( not ( = ?auto_204185 ?auto_204188 ) ) ( not ( = ?auto_204185 ?auto_204189 ) ) ( not ( = ?auto_204186 ?auto_204187 ) ) ( not ( = ?auto_204186 ?auto_204188 ) ) ( not ( = ?auto_204186 ?auto_204189 ) ) ( not ( = ?auto_204187 ?auto_204188 ) ) ( not ( = ?auto_204187 ?auto_204189 ) ) ( not ( = ?auto_204188 ?auto_204189 ) ) ( ON ?auto_204189 ?auto_204190 ) ( not ( = ?auto_204183 ?auto_204190 ) ) ( not ( = ?auto_204184 ?auto_204190 ) ) ( not ( = ?auto_204185 ?auto_204190 ) ) ( not ( = ?auto_204186 ?auto_204190 ) ) ( not ( = ?auto_204187 ?auto_204190 ) ) ( not ( = ?auto_204188 ?auto_204190 ) ) ( not ( = ?auto_204189 ?auto_204190 ) ) ( ON ?auto_204188 ?auto_204189 ) ( ON-TABLE ?auto_204190 ) ( ON ?auto_204187 ?auto_204188 ) ( ON ?auto_204186 ?auto_204187 ) ( CLEAR ?auto_204184 ) ( ON ?auto_204185 ?auto_204186 ) ( CLEAR ?auto_204185 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_204190 ?auto_204189 ?auto_204188 ?auto_204187 ?auto_204186 )
      ( MAKE-7PILE ?auto_204183 ?auto_204184 ?auto_204185 ?auto_204186 ?auto_204187 ?auto_204188 ?auto_204189 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_204191 - BLOCK
      ?auto_204192 - BLOCK
      ?auto_204193 - BLOCK
      ?auto_204194 - BLOCK
      ?auto_204195 - BLOCK
      ?auto_204196 - BLOCK
      ?auto_204197 - BLOCK
    )
    :vars
    (
      ?auto_204198 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_204191 ) ( not ( = ?auto_204191 ?auto_204192 ) ) ( not ( = ?auto_204191 ?auto_204193 ) ) ( not ( = ?auto_204191 ?auto_204194 ) ) ( not ( = ?auto_204191 ?auto_204195 ) ) ( not ( = ?auto_204191 ?auto_204196 ) ) ( not ( = ?auto_204191 ?auto_204197 ) ) ( not ( = ?auto_204192 ?auto_204193 ) ) ( not ( = ?auto_204192 ?auto_204194 ) ) ( not ( = ?auto_204192 ?auto_204195 ) ) ( not ( = ?auto_204192 ?auto_204196 ) ) ( not ( = ?auto_204192 ?auto_204197 ) ) ( not ( = ?auto_204193 ?auto_204194 ) ) ( not ( = ?auto_204193 ?auto_204195 ) ) ( not ( = ?auto_204193 ?auto_204196 ) ) ( not ( = ?auto_204193 ?auto_204197 ) ) ( not ( = ?auto_204194 ?auto_204195 ) ) ( not ( = ?auto_204194 ?auto_204196 ) ) ( not ( = ?auto_204194 ?auto_204197 ) ) ( not ( = ?auto_204195 ?auto_204196 ) ) ( not ( = ?auto_204195 ?auto_204197 ) ) ( not ( = ?auto_204196 ?auto_204197 ) ) ( ON ?auto_204197 ?auto_204198 ) ( not ( = ?auto_204191 ?auto_204198 ) ) ( not ( = ?auto_204192 ?auto_204198 ) ) ( not ( = ?auto_204193 ?auto_204198 ) ) ( not ( = ?auto_204194 ?auto_204198 ) ) ( not ( = ?auto_204195 ?auto_204198 ) ) ( not ( = ?auto_204196 ?auto_204198 ) ) ( not ( = ?auto_204197 ?auto_204198 ) ) ( ON ?auto_204196 ?auto_204197 ) ( ON-TABLE ?auto_204198 ) ( ON ?auto_204195 ?auto_204196 ) ( ON ?auto_204194 ?auto_204195 ) ( ON ?auto_204193 ?auto_204194 ) ( CLEAR ?auto_204193 ) ( HOLDING ?auto_204192 ) ( CLEAR ?auto_204191 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_204191 ?auto_204192 )
      ( MAKE-7PILE ?auto_204191 ?auto_204192 ?auto_204193 ?auto_204194 ?auto_204195 ?auto_204196 ?auto_204197 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_204199 - BLOCK
      ?auto_204200 - BLOCK
      ?auto_204201 - BLOCK
      ?auto_204202 - BLOCK
      ?auto_204203 - BLOCK
      ?auto_204204 - BLOCK
      ?auto_204205 - BLOCK
    )
    :vars
    (
      ?auto_204206 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_204199 ) ( not ( = ?auto_204199 ?auto_204200 ) ) ( not ( = ?auto_204199 ?auto_204201 ) ) ( not ( = ?auto_204199 ?auto_204202 ) ) ( not ( = ?auto_204199 ?auto_204203 ) ) ( not ( = ?auto_204199 ?auto_204204 ) ) ( not ( = ?auto_204199 ?auto_204205 ) ) ( not ( = ?auto_204200 ?auto_204201 ) ) ( not ( = ?auto_204200 ?auto_204202 ) ) ( not ( = ?auto_204200 ?auto_204203 ) ) ( not ( = ?auto_204200 ?auto_204204 ) ) ( not ( = ?auto_204200 ?auto_204205 ) ) ( not ( = ?auto_204201 ?auto_204202 ) ) ( not ( = ?auto_204201 ?auto_204203 ) ) ( not ( = ?auto_204201 ?auto_204204 ) ) ( not ( = ?auto_204201 ?auto_204205 ) ) ( not ( = ?auto_204202 ?auto_204203 ) ) ( not ( = ?auto_204202 ?auto_204204 ) ) ( not ( = ?auto_204202 ?auto_204205 ) ) ( not ( = ?auto_204203 ?auto_204204 ) ) ( not ( = ?auto_204203 ?auto_204205 ) ) ( not ( = ?auto_204204 ?auto_204205 ) ) ( ON ?auto_204205 ?auto_204206 ) ( not ( = ?auto_204199 ?auto_204206 ) ) ( not ( = ?auto_204200 ?auto_204206 ) ) ( not ( = ?auto_204201 ?auto_204206 ) ) ( not ( = ?auto_204202 ?auto_204206 ) ) ( not ( = ?auto_204203 ?auto_204206 ) ) ( not ( = ?auto_204204 ?auto_204206 ) ) ( not ( = ?auto_204205 ?auto_204206 ) ) ( ON ?auto_204204 ?auto_204205 ) ( ON-TABLE ?auto_204206 ) ( ON ?auto_204203 ?auto_204204 ) ( ON ?auto_204202 ?auto_204203 ) ( ON ?auto_204201 ?auto_204202 ) ( CLEAR ?auto_204199 ) ( ON ?auto_204200 ?auto_204201 ) ( CLEAR ?auto_204200 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_204206 ?auto_204205 ?auto_204204 ?auto_204203 ?auto_204202 ?auto_204201 )
      ( MAKE-7PILE ?auto_204199 ?auto_204200 ?auto_204201 ?auto_204202 ?auto_204203 ?auto_204204 ?auto_204205 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_204207 - BLOCK
      ?auto_204208 - BLOCK
      ?auto_204209 - BLOCK
      ?auto_204210 - BLOCK
      ?auto_204211 - BLOCK
      ?auto_204212 - BLOCK
      ?auto_204213 - BLOCK
    )
    :vars
    (
      ?auto_204214 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_204207 ?auto_204208 ) ) ( not ( = ?auto_204207 ?auto_204209 ) ) ( not ( = ?auto_204207 ?auto_204210 ) ) ( not ( = ?auto_204207 ?auto_204211 ) ) ( not ( = ?auto_204207 ?auto_204212 ) ) ( not ( = ?auto_204207 ?auto_204213 ) ) ( not ( = ?auto_204208 ?auto_204209 ) ) ( not ( = ?auto_204208 ?auto_204210 ) ) ( not ( = ?auto_204208 ?auto_204211 ) ) ( not ( = ?auto_204208 ?auto_204212 ) ) ( not ( = ?auto_204208 ?auto_204213 ) ) ( not ( = ?auto_204209 ?auto_204210 ) ) ( not ( = ?auto_204209 ?auto_204211 ) ) ( not ( = ?auto_204209 ?auto_204212 ) ) ( not ( = ?auto_204209 ?auto_204213 ) ) ( not ( = ?auto_204210 ?auto_204211 ) ) ( not ( = ?auto_204210 ?auto_204212 ) ) ( not ( = ?auto_204210 ?auto_204213 ) ) ( not ( = ?auto_204211 ?auto_204212 ) ) ( not ( = ?auto_204211 ?auto_204213 ) ) ( not ( = ?auto_204212 ?auto_204213 ) ) ( ON ?auto_204213 ?auto_204214 ) ( not ( = ?auto_204207 ?auto_204214 ) ) ( not ( = ?auto_204208 ?auto_204214 ) ) ( not ( = ?auto_204209 ?auto_204214 ) ) ( not ( = ?auto_204210 ?auto_204214 ) ) ( not ( = ?auto_204211 ?auto_204214 ) ) ( not ( = ?auto_204212 ?auto_204214 ) ) ( not ( = ?auto_204213 ?auto_204214 ) ) ( ON ?auto_204212 ?auto_204213 ) ( ON-TABLE ?auto_204214 ) ( ON ?auto_204211 ?auto_204212 ) ( ON ?auto_204210 ?auto_204211 ) ( ON ?auto_204209 ?auto_204210 ) ( ON ?auto_204208 ?auto_204209 ) ( CLEAR ?auto_204208 ) ( HOLDING ?auto_204207 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_204207 )
      ( MAKE-7PILE ?auto_204207 ?auto_204208 ?auto_204209 ?auto_204210 ?auto_204211 ?auto_204212 ?auto_204213 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_204215 - BLOCK
      ?auto_204216 - BLOCK
      ?auto_204217 - BLOCK
      ?auto_204218 - BLOCK
      ?auto_204219 - BLOCK
      ?auto_204220 - BLOCK
      ?auto_204221 - BLOCK
    )
    :vars
    (
      ?auto_204222 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_204215 ?auto_204216 ) ) ( not ( = ?auto_204215 ?auto_204217 ) ) ( not ( = ?auto_204215 ?auto_204218 ) ) ( not ( = ?auto_204215 ?auto_204219 ) ) ( not ( = ?auto_204215 ?auto_204220 ) ) ( not ( = ?auto_204215 ?auto_204221 ) ) ( not ( = ?auto_204216 ?auto_204217 ) ) ( not ( = ?auto_204216 ?auto_204218 ) ) ( not ( = ?auto_204216 ?auto_204219 ) ) ( not ( = ?auto_204216 ?auto_204220 ) ) ( not ( = ?auto_204216 ?auto_204221 ) ) ( not ( = ?auto_204217 ?auto_204218 ) ) ( not ( = ?auto_204217 ?auto_204219 ) ) ( not ( = ?auto_204217 ?auto_204220 ) ) ( not ( = ?auto_204217 ?auto_204221 ) ) ( not ( = ?auto_204218 ?auto_204219 ) ) ( not ( = ?auto_204218 ?auto_204220 ) ) ( not ( = ?auto_204218 ?auto_204221 ) ) ( not ( = ?auto_204219 ?auto_204220 ) ) ( not ( = ?auto_204219 ?auto_204221 ) ) ( not ( = ?auto_204220 ?auto_204221 ) ) ( ON ?auto_204221 ?auto_204222 ) ( not ( = ?auto_204215 ?auto_204222 ) ) ( not ( = ?auto_204216 ?auto_204222 ) ) ( not ( = ?auto_204217 ?auto_204222 ) ) ( not ( = ?auto_204218 ?auto_204222 ) ) ( not ( = ?auto_204219 ?auto_204222 ) ) ( not ( = ?auto_204220 ?auto_204222 ) ) ( not ( = ?auto_204221 ?auto_204222 ) ) ( ON ?auto_204220 ?auto_204221 ) ( ON-TABLE ?auto_204222 ) ( ON ?auto_204219 ?auto_204220 ) ( ON ?auto_204218 ?auto_204219 ) ( ON ?auto_204217 ?auto_204218 ) ( ON ?auto_204216 ?auto_204217 ) ( ON ?auto_204215 ?auto_204216 ) ( CLEAR ?auto_204215 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_204222 ?auto_204221 ?auto_204220 ?auto_204219 ?auto_204218 ?auto_204217 ?auto_204216 )
      ( MAKE-7PILE ?auto_204215 ?auto_204216 ?auto_204217 ?auto_204218 ?auto_204219 ?auto_204220 ?auto_204221 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_204223 - BLOCK
      ?auto_204224 - BLOCK
      ?auto_204225 - BLOCK
      ?auto_204226 - BLOCK
      ?auto_204227 - BLOCK
      ?auto_204228 - BLOCK
      ?auto_204229 - BLOCK
    )
    :vars
    (
      ?auto_204230 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_204223 ?auto_204224 ) ) ( not ( = ?auto_204223 ?auto_204225 ) ) ( not ( = ?auto_204223 ?auto_204226 ) ) ( not ( = ?auto_204223 ?auto_204227 ) ) ( not ( = ?auto_204223 ?auto_204228 ) ) ( not ( = ?auto_204223 ?auto_204229 ) ) ( not ( = ?auto_204224 ?auto_204225 ) ) ( not ( = ?auto_204224 ?auto_204226 ) ) ( not ( = ?auto_204224 ?auto_204227 ) ) ( not ( = ?auto_204224 ?auto_204228 ) ) ( not ( = ?auto_204224 ?auto_204229 ) ) ( not ( = ?auto_204225 ?auto_204226 ) ) ( not ( = ?auto_204225 ?auto_204227 ) ) ( not ( = ?auto_204225 ?auto_204228 ) ) ( not ( = ?auto_204225 ?auto_204229 ) ) ( not ( = ?auto_204226 ?auto_204227 ) ) ( not ( = ?auto_204226 ?auto_204228 ) ) ( not ( = ?auto_204226 ?auto_204229 ) ) ( not ( = ?auto_204227 ?auto_204228 ) ) ( not ( = ?auto_204227 ?auto_204229 ) ) ( not ( = ?auto_204228 ?auto_204229 ) ) ( ON ?auto_204229 ?auto_204230 ) ( not ( = ?auto_204223 ?auto_204230 ) ) ( not ( = ?auto_204224 ?auto_204230 ) ) ( not ( = ?auto_204225 ?auto_204230 ) ) ( not ( = ?auto_204226 ?auto_204230 ) ) ( not ( = ?auto_204227 ?auto_204230 ) ) ( not ( = ?auto_204228 ?auto_204230 ) ) ( not ( = ?auto_204229 ?auto_204230 ) ) ( ON ?auto_204228 ?auto_204229 ) ( ON-TABLE ?auto_204230 ) ( ON ?auto_204227 ?auto_204228 ) ( ON ?auto_204226 ?auto_204227 ) ( ON ?auto_204225 ?auto_204226 ) ( ON ?auto_204224 ?auto_204225 ) ( HOLDING ?auto_204223 ) ( CLEAR ?auto_204224 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_204230 ?auto_204229 ?auto_204228 ?auto_204227 ?auto_204226 ?auto_204225 ?auto_204224 ?auto_204223 )
      ( MAKE-7PILE ?auto_204223 ?auto_204224 ?auto_204225 ?auto_204226 ?auto_204227 ?auto_204228 ?auto_204229 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_204231 - BLOCK
      ?auto_204232 - BLOCK
      ?auto_204233 - BLOCK
      ?auto_204234 - BLOCK
      ?auto_204235 - BLOCK
      ?auto_204236 - BLOCK
      ?auto_204237 - BLOCK
    )
    :vars
    (
      ?auto_204238 - BLOCK
      ?auto_204239 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_204231 ?auto_204232 ) ) ( not ( = ?auto_204231 ?auto_204233 ) ) ( not ( = ?auto_204231 ?auto_204234 ) ) ( not ( = ?auto_204231 ?auto_204235 ) ) ( not ( = ?auto_204231 ?auto_204236 ) ) ( not ( = ?auto_204231 ?auto_204237 ) ) ( not ( = ?auto_204232 ?auto_204233 ) ) ( not ( = ?auto_204232 ?auto_204234 ) ) ( not ( = ?auto_204232 ?auto_204235 ) ) ( not ( = ?auto_204232 ?auto_204236 ) ) ( not ( = ?auto_204232 ?auto_204237 ) ) ( not ( = ?auto_204233 ?auto_204234 ) ) ( not ( = ?auto_204233 ?auto_204235 ) ) ( not ( = ?auto_204233 ?auto_204236 ) ) ( not ( = ?auto_204233 ?auto_204237 ) ) ( not ( = ?auto_204234 ?auto_204235 ) ) ( not ( = ?auto_204234 ?auto_204236 ) ) ( not ( = ?auto_204234 ?auto_204237 ) ) ( not ( = ?auto_204235 ?auto_204236 ) ) ( not ( = ?auto_204235 ?auto_204237 ) ) ( not ( = ?auto_204236 ?auto_204237 ) ) ( ON ?auto_204237 ?auto_204238 ) ( not ( = ?auto_204231 ?auto_204238 ) ) ( not ( = ?auto_204232 ?auto_204238 ) ) ( not ( = ?auto_204233 ?auto_204238 ) ) ( not ( = ?auto_204234 ?auto_204238 ) ) ( not ( = ?auto_204235 ?auto_204238 ) ) ( not ( = ?auto_204236 ?auto_204238 ) ) ( not ( = ?auto_204237 ?auto_204238 ) ) ( ON ?auto_204236 ?auto_204237 ) ( ON-TABLE ?auto_204238 ) ( ON ?auto_204235 ?auto_204236 ) ( ON ?auto_204234 ?auto_204235 ) ( ON ?auto_204233 ?auto_204234 ) ( ON ?auto_204232 ?auto_204233 ) ( CLEAR ?auto_204232 ) ( ON ?auto_204231 ?auto_204239 ) ( CLEAR ?auto_204231 ) ( HAND-EMPTY ) ( not ( = ?auto_204231 ?auto_204239 ) ) ( not ( = ?auto_204232 ?auto_204239 ) ) ( not ( = ?auto_204233 ?auto_204239 ) ) ( not ( = ?auto_204234 ?auto_204239 ) ) ( not ( = ?auto_204235 ?auto_204239 ) ) ( not ( = ?auto_204236 ?auto_204239 ) ) ( not ( = ?auto_204237 ?auto_204239 ) ) ( not ( = ?auto_204238 ?auto_204239 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_204231 ?auto_204239 )
      ( MAKE-7PILE ?auto_204231 ?auto_204232 ?auto_204233 ?auto_204234 ?auto_204235 ?auto_204236 ?auto_204237 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_204240 - BLOCK
      ?auto_204241 - BLOCK
      ?auto_204242 - BLOCK
      ?auto_204243 - BLOCK
      ?auto_204244 - BLOCK
      ?auto_204245 - BLOCK
      ?auto_204246 - BLOCK
    )
    :vars
    (
      ?auto_204248 - BLOCK
      ?auto_204247 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_204240 ?auto_204241 ) ) ( not ( = ?auto_204240 ?auto_204242 ) ) ( not ( = ?auto_204240 ?auto_204243 ) ) ( not ( = ?auto_204240 ?auto_204244 ) ) ( not ( = ?auto_204240 ?auto_204245 ) ) ( not ( = ?auto_204240 ?auto_204246 ) ) ( not ( = ?auto_204241 ?auto_204242 ) ) ( not ( = ?auto_204241 ?auto_204243 ) ) ( not ( = ?auto_204241 ?auto_204244 ) ) ( not ( = ?auto_204241 ?auto_204245 ) ) ( not ( = ?auto_204241 ?auto_204246 ) ) ( not ( = ?auto_204242 ?auto_204243 ) ) ( not ( = ?auto_204242 ?auto_204244 ) ) ( not ( = ?auto_204242 ?auto_204245 ) ) ( not ( = ?auto_204242 ?auto_204246 ) ) ( not ( = ?auto_204243 ?auto_204244 ) ) ( not ( = ?auto_204243 ?auto_204245 ) ) ( not ( = ?auto_204243 ?auto_204246 ) ) ( not ( = ?auto_204244 ?auto_204245 ) ) ( not ( = ?auto_204244 ?auto_204246 ) ) ( not ( = ?auto_204245 ?auto_204246 ) ) ( ON ?auto_204246 ?auto_204248 ) ( not ( = ?auto_204240 ?auto_204248 ) ) ( not ( = ?auto_204241 ?auto_204248 ) ) ( not ( = ?auto_204242 ?auto_204248 ) ) ( not ( = ?auto_204243 ?auto_204248 ) ) ( not ( = ?auto_204244 ?auto_204248 ) ) ( not ( = ?auto_204245 ?auto_204248 ) ) ( not ( = ?auto_204246 ?auto_204248 ) ) ( ON ?auto_204245 ?auto_204246 ) ( ON-TABLE ?auto_204248 ) ( ON ?auto_204244 ?auto_204245 ) ( ON ?auto_204243 ?auto_204244 ) ( ON ?auto_204242 ?auto_204243 ) ( ON ?auto_204240 ?auto_204247 ) ( CLEAR ?auto_204240 ) ( not ( = ?auto_204240 ?auto_204247 ) ) ( not ( = ?auto_204241 ?auto_204247 ) ) ( not ( = ?auto_204242 ?auto_204247 ) ) ( not ( = ?auto_204243 ?auto_204247 ) ) ( not ( = ?auto_204244 ?auto_204247 ) ) ( not ( = ?auto_204245 ?auto_204247 ) ) ( not ( = ?auto_204246 ?auto_204247 ) ) ( not ( = ?auto_204248 ?auto_204247 ) ) ( HOLDING ?auto_204241 ) ( CLEAR ?auto_204242 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_204248 ?auto_204246 ?auto_204245 ?auto_204244 ?auto_204243 ?auto_204242 ?auto_204241 )
      ( MAKE-7PILE ?auto_204240 ?auto_204241 ?auto_204242 ?auto_204243 ?auto_204244 ?auto_204245 ?auto_204246 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_204249 - BLOCK
      ?auto_204250 - BLOCK
      ?auto_204251 - BLOCK
      ?auto_204252 - BLOCK
      ?auto_204253 - BLOCK
      ?auto_204254 - BLOCK
      ?auto_204255 - BLOCK
    )
    :vars
    (
      ?auto_204256 - BLOCK
      ?auto_204257 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_204249 ?auto_204250 ) ) ( not ( = ?auto_204249 ?auto_204251 ) ) ( not ( = ?auto_204249 ?auto_204252 ) ) ( not ( = ?auto_204249 ?auto_204253 ) ) ( not ( = ?auto_204249 ?auto_204254 ) ) ( not ( = ?auto_204249 ?auto_204255 ) ) ( not ( = ?auto_204250 ?auto_204251 ) ) ( not ( = ?auto_204250 ?auto_204252 ) ) ( not ( = ?auto_204250 ?auto_204253 ) ) ( not ( = ?auto_204250 ?auto_204254 ) ) ( not ( = ?auto_204250 ?auto_204255 ) ) ( not ( = ?auto_204251 ?auto_204252 ) ) ( not ( = ?auto_204251 ?auto_204253 ) ) ( not ( = ?auto_204251 ?auto_204254 ) ) ( not ( = ?auto_204251 ?auto_204255 ) ) ( not ( = ?auto_204252 ?auto_204253 ) ) ( not ( = ?auto_204252 ?auto_204254 ) ) ( not ( = ?auto_204252 ?auto_204255 ) ) ( not ( = ?auto_204253 ?auto_204254 ) ) ( not ( = ?auto_204253 ?auto_204255 ) ) ( not ( = ?auto_204254 ?auto_204255 ) ) ( ON ?auto_204255 ?auto_204256 ) ( not ( = ?auto_204249 ?auto_204256 ) ) ( not ( = ?auto_204250 ?auto_204256 ) ) ( not ( = ?auto_204251 ?auto_204256 ) ) ( not ( = ?auto_204252 ?auto_204256 ) ) ( not ( = ?auto_204253 ?auto_204256 ) ) ( not ( = ?auto_204254 ?auto_204256 ) ) ( not ( = ?auto_204255 ?auto_204256 ) ) ( ON ?auto_204254 ?auto_204255 ) ( ON-TABLE ?auto_204256 ) ( ON ?auto_204253 ?auto_204254 ) ( ON ?auto_204252 ?auto_204253 ) ( ON ?auto_204251 ?auto_204252 ) ( ON ?auto_204249 ?auto_204257 ) ( not ( = ?auto_204249 ?auto_204257 ) ) ( not ( = ?auto_204250 ?auto_204257 ) ) ( not ( = ?auto_204251 ?auto_204257 ) ) ( not ( = ?auto_204252 ?auto_204257 ) ) ( not ( = ?auto_204253 ?auto_204257 ) ) ( not ( = ?auto_204254 ?auto_204257 ) ) ( not ( = ?auto_204255 ?auto_204257 ) ) ( not ( = ?auto_204256 ?auto_204257 ) ) ( CLEAR ?auto_204251 ) ( ON ?auto_204250 ?auto_204249 ) ( CLEAR ?auto_204250 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_204257 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_204257 ?auto_204249 )
      ( MAKE-7PILE ?auto_204249 ?auto_204250 ?auto_204251 ?auto_204252 ?auto_204253 ?auto_204254 ?auto_204255 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_204258 - BLOCK
      ?auto_204259 - BLOCK
      ?auto_204260 - BLOCK
      ?auto_204261 - BLOCK
      ?auto_204262 - BLOCK
      ?auto_204263 - BLOCK
      ?auto_204264 - BLOCK
    )
    :vars
    (
      ?auto_204266 - BLOCK
      ?auto_204265 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_204258 ?auto_204259 ) ) ( not ( = ?auto_204258 ?auto_204260 ) ) ( not ( = ?auto_204258 ?auto_204261 ) ) ( not ( = ?auto_204258 ?auto_204262 ) ) ( not ( = ?auto_204258 ?auto_204263 ) ) ( not ( = ?auto_204258 ?auto_204264 ) ) ( not ( = ?auto_204259 ?auto_204260 ) ) ( not ( = ?auto_204259 ?auto_204261 ) ) ( not ( = ?auto_204259 ?auto_204262 ) ) ( not ( = ?auto_204259 ?auto_204263 ) ) ( not ( = ?auto_204259 ?auto_204264 ) ) ( not ( = ?auto_204260 ?auto_204261 ) ) ( not ( = ?auto_204260 ?auto_204262 ) ) ( not ( = ?auto_204260 ?auto_204263 ) ) ( not ( = ?auto_204260 ?auto_204264 ) ) ( not ( = ?auto_204261 ?auto_204262 ) ) ( not ( = ?auto_204261 ?auto_204263 ) ) ( not ( = ?auto_204261 ?auto_204264 ) ) ( not ( = ?auto_204262 ?auto_204263 ) ) ( not ( = ?auto_204262 ?auto_204264 ) ) ( not ( = ?auto_204263 ?auto_204264 ) ) ( ON ?auto_204264 ?auto_204266 ) ( not ( = ?auto_204258 ?auto_204266 ) ) ( not ( = ?auto_204259 ?auto_204266 ) ) ( not ( = ?auto_204260 ?auto_204266 ) ) ( not ( = ?auto_204261 ?auto_204266 ) ) ( not ( = ?auto_204262 ?auto_204266 ) ) ( not ( = ?auto_204263 ?auto_204266 ) ) ( not ( = ?auto_204264 ?auto_204266 ) ) ( ON ?auto_204263 ?auto_204264 ) ( ON-TABLE ?auto_204266 ) ( ON ?auto_204262 ?auto_204263 ) ( ON ?auto_204261 ?auto_204262 ) ( ON ?auto_204258 ?auto_204265 ) ( not ( = ?auto_204258 ?auto_204265 ) ) ( not ( = ?auto_204259 ?auto_204265 ) ) ( not ( = ?auto_204260 ?auto_204265 ) ) ( not ( = ?auto_204261 ?auto_204265 ) ) ( not ( = ?auto_204262 ?auto_204265 ) ) ( not ( = ?auto_204263 ?auto_204265 ) ) ( not ( = ?auto_204264 ?auto_204265 ) ) ( not ( = ?auto_204266 ?auto_204265 ) ) ( ON ?auto_204259 ?auto_204258 ) ( CLEAR ?auto_204259 ) ( ON-TABLE ?auto_204265 ) ( HOLDING ?auto_204260 ) ( CLEAR ?auto_204261 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_204266 ?auto_204264 ?auto_204263 ?auto_204262 ?auto_204261 ?auto_204260 )
      ( MAKE-7PILE ?auto_204258 ?auto_204259 ?auto_204260 ?auto_204261 ?auto_204262 ?auto_204263 ?auto_204264 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_204267 - BLOCK
      ?auto_204268 - BLOCK
      ?auto_204269 - BLOCK
      ?auto_204270 - BLOCK
      ?auto_204271 - BLOCK
      ?auto_204272 - BLOCK
      ?auto_204273 - BLOCK
    )
    :vars
    (
      ?auto_204274 - BLOCK
      ?auto_204275 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_204267 ?auto_204268 ) ) ( not ( = ?auto_204267 ?auto_204269 ) ) ( not ( = ?auto_204267 ?auto_204270 ) ) ( not ( = ?auto_204267 ?auto_204271 ) ) ( not ( = ?auto_204267 ?auto_204272 ) ) ( not ( = ?auto_204267 ?auto_204273 ) ) ( not ( = ?auto_204268 ?auto_204269 ) ) ( not ( = ?auto_204268 ?auto_204270 ) ) ( not ( = ?auto_204268 ?auto_204271 ) ) ( not ( = ?auto_204268 ?auto_204272 ) ) ( not ( = ?auto_204268 ?auto_204273 ) ) ( not ( = ?auto_204269 ?auto_204270 ) ) ( not ( = ?auto_204269 ?auto_204271 ) ) ( not ( = ?auto_204269 ?auto_204272 ) ) ( not ( = ?auto_204269 ?auto_204273 ) ) ( not ( = ?auto_204270 ?auto_204271 ) ) ( not ( = ?auto_204270 ?auto_204272 ) ) ( not ( = ?auto_204270 ?auto_204273 ) ) ( not ( = ?auto_204271 ?auto_204272 ) ) ( not ( = ?auto_204271 ?auto_204273 ) ) ( not ( = ?auto_204272 ?auto_204273 ) ) ( ON ?auto_204273 ?auto_204274 ) ( not ( = ?auto_204267 ?auto_204274 ) ) ( not ( = ?auto_204268 ?auto_204274 ) ) ( not ( = ?auto_204269 ?auto_204274 ) ) ( not ( = ?auto_204270 ?auto_204274 ) ) ( not ( = ?auto_204271 ?auto_204274 ) ) ( not ( = ?auto_204272 ?auto_204274 ) ) ( not ( = ?auto_204273 ?auto_204274 ) ) ( ON ?auto_204272 ?auto_204273 ) ( ON-TABLE ?auto_204274 ) ( ON ?auto_204271 ?auto_204272 ) ( ON ?auto_204270 ?auto_204271 ) ( ON ?auto_204267 ?auto_204275 ) ( not ( = ?auto_204267 ?auto_204275 ) ) ( not ( = ?auto_204268 ?auto_204275 ) ) ( not ( = ?auto_204269 ?auto_204275 ) ) ( not ( = ?auto_204270 ?auto_204275 ) ) ( not ( = ?auto_204271 ?auto_204275 ) ) ( not ( = ?auto_204272 ?auto_204275 ) ) ( not ( = ?auto_204273 ?auto_204275 ) ) ( not ( = ?auto_204274 ?auto_204275 ) ) ( ON ?auto_204268 ?auto_204267 ) ( ON-TABLE ?auto_204275 ) ( CLEAR ?auto_204270 ) ( ON ?auto_204269 ?auto_204268 ) ( CLEAR ?auto_204269 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_204275 ?auto_204267 ?auto_204268 )
      ( MAKE-7PILE ?auto_204267 ?auto_204268 ?auto_204269 ?auto_204270 ?auto_204271 ?auto_204272 ?auto_204273 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_204276 - BLOCK
      ?auto_204277 - BLOCK
      ?auto_204278 - BLOCK
      ?auto_204279 - BLOCK
      ?auto_204280 - BLOCK
      ?auto_204281 - BLOCK
      ?auto_204282 - BLOCK
    )
    :vars
    (
      ?auto_204284 - BLOCK
      ?auto_204283 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_204276 ?auto_204277 ) ) ( not ( = ?auto_204276 ?auto_204278 ) ) ( not ( = ?auto_204276 ?auto_204279 ) ) ( not ( = ?auto_204276 ?auto_204280 ) ) ( not ( = ?auto_204276 ?auto_204281 ) ) ( not ( = ?auto_204276 ?auto_204282 ) ) ( not ( = ?auto_204277 ?auto_204278 ) ) ( not ( = ?auto_204277 ?auto_204279 ) ) ( not ( = ?auto_204277 ?auto_204280 ) ) ( not ( = ?auto_204277 ?auto_204281 ) ) ( not ( = ?auto_204277 ?auto_204282 ) ) ( not ( = ?auto_204278 ?auto_204279 ) ) ( not ( = ?auto_204278 ?auto_204280 ) ) ( not ( = ?auto_204278 ?auto_204281 ) ) ( not ( = ?auto_204278 ?auto_204282 ) ) ( not ( = ?auto_204279 ?auto_204280 ) ) ( not ( = ?auto_204279 ?auto_204281 ) ) ( not ( = ?auto_204279 ?auto_204282 ) ) ( not ( = ?auto_204280 ?auto_204281 ) ) ( not ( = ?auto_204280 ?auto_204282 ) ) ( not ( = ?auto_204281 ?auto_204282 ) ) ( ON ?auto_204282 ?auto_204284 ) ( not ( = ?auto_204276 ?auto_204284 ) ) ( not ( = ?auto_204277 ?auto_204284 ) ) ( not ( = ?auto_204278 ?auto_204284 ) ) ( not ( = ?auto_204279 ?auto_204284 ) ) ( not ( = ?auto_204280 ?auto_204284 ) ) ( not ( = ?auto_204281 ?auto_204284 ) ) ( not ( = ?auto_204282 ?auto_204284 ) ) ( ON ?auto_204281 ?auto_204282 ) ( ON-TABLE ?auto_204284 ) ( ON ?auto_204280 ?auto_204281 ) ( ON ?auto_204276 ?auto_204283 ) ( not ( = ?auto_204276 ?auto_204283 ) ) ( not ( = ?auto_204277 ?auto_204283 ) ) ( not ( = ?auto_204278 ?auto_204283 ) ) ( not ( = ?auto_204279 ?auto_204283 ) ) ( not ( = ?auto_204280 ?auto_204283 ) ) ( not ( = ?auto_204281 ?auto_204283 ) ) ( not ( = ?auto_204282 ?auto_204283 ) ) ( not ( = ?auto_204284 ?auto_204283 ) ) ( ON ?auto_204277 ?auto_204276 ) ( ON-TABLE ?auto_204283 ) ( ON ?auto_204278 ?auto_204277 ) ( CLEAR ?auto_204278 ) ( HOLDING ?auto_204279 ) ( CLEAR ?auto_204280 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_204284 ?auto_204282 ?auto_204281 ?auto_204280 ?auto_204279 )
      ( MAKE-7PILE ?auto_204276 ?auto_204277 ?auto_204278 ?auto_204279 ?auto_204280 ?auto_204281 ?auto_204282 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_204285 - BLOCK
      ?auto_204286 - BLOCK
      ?auto_204287 - BLOCK
      ?auto_204288 - BLOCK
      ?auto_204289 - BLOCK
      ?auto_204290 - BLOCK
      ?auto_204291 - BLOCK
    )
    :vars
    (
      ?auto_204292 - BLOCK
      ?auto_204293 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_204285 ?auto_204286 ) ) ( not ( = ?auto_204285 ?auto_204287 ) ) ( not ( = ?auto_204285 ?auto_204288 ) ) ( not ( = ?auto_204285 ?auto_204289 ) ) ( not ( = ?auto_204285 ?auto_204290 ) ) ( not ( = ?auto_204285 ?auto_204291 ) ) ( not ( = ?auto_204286 ?auto_204287 ) ) ( not ( = ?auto_204286 ?auto_204288 ) ) ( not ( = ?auto_204286 ?auto_204289 ) ) ( not ( = ?auto_204286 ?auto_204290 ) ) ( not ( = ?auto_204286 ?auto_204291 ) ) ( not ( = ?auto_204287 ?auto_204288 ) ) ( not ( = ?auto_204287 ?auto_204289 ) ) ( not ( = ?auto_204287 ?auto_204290 ) ) ( not ( = ?auto_204287 ?auto_204291 ) ) ( not ( = ?auto_204288 ?auto_204289 ) ) ( not ( = ?auto_204288 ?auto_204290 ) ) ( not ( = ?auto_204288 ?auto_204291 ) ) ( not ( = ?auto_204289 ?auto_204290 ) ) ( not ( = ?auto_204289 ?auto_204291 ) ) ( not ( = ?auto_204290 ?auto_204291 ) ) ( ON ?auto_204291 ?auto_204292 ) ( not ( = ?auto_204285 ?auto_204292 ) ) ( not ( = ?auto_204286 ?auto_204292 ) ) ( not ( = ?auto_204287 ?auto_204292 ) ) ( not ( = ?auto_204288 ?auto_204292 ) ) ( not ( = ?auto_204289 ?auto_204292 ) ) ( not ( = ?auto_204290 ?auto_204292 ) ) ( not ( = ?auto_204291 ?auto_204292 ) ) ( ON ?auto_204290 ?auto_204291 ) ( ON-TABLE ?auto_204292 ) ( ON ?auto_204289 ?auto_204290 ) ( ON ?auto_204285 ?auto_204293 ) ( not ( = ?auto_204285 ?auto_204293 ) ) ( not ( = ?auto_204286 ?auto_204293 ) ) ( not ( = ?auto_204287 ?auto_204293 ) ) ( not ( = ?auto_204288 ?auto_204293 ) ) ( not ( = ?auto_204289 ?auto_204293 ) ) ( not ( = ?auto_204290 ?auto_204293 ) ) ( not ( = ?auto_204291 ?auto_204293 ) ) ( not ( = ?auto_204292 ?auto_204293 ) ) ( ON ?auto_204286 ?auto_204285 ) ( ON-TABLE ?auto_204293 ) ( ON ?auto_204287 ?auto_204286 ) ( CLEAR ?auto_204289 ) ( ON ?auto_204288 ?auto_204287 ) ( CLEAR ?auto_204288 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_204293 ?auto_204285 ?auto_204286 ?auto_204287 )
      ( MAKE-7PILE ?auto_204285 ?auto_204286 ?auto_204287 ?auto_204288 ?auto_204289 ?auto_204290 ?auto_204291 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_204294 - BLOCK
      ?auto_204295 - BLOCK
      ?auto_204296 - BLOCK
      ?auto_204297 - BLOCK
      ?auto_204298 - BLOCK
      ?auto_204299 - BLOCK
      ?auto_204300 - BLOCK
    )
    :vars
    (
      ?auto_204302 - BLOCK
      ?auto_204301 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_204294 ?auto_204295 ) ) ( not ( = ?auto_204294 ?auto_204296 ) ) ( not ( = ?auto_204294 ?auto_204297 ) ) ( not ( = ?auto_204294 ?auto_204298 ) ) ( not ( = ?auto_204294 ?auto_204299 ) ) ( not ( = ?auto_204294 ?auto_204300 ) ) ( not ( = ?auto_204295 ?auto_204296 ) ) ( not ( = ?auto_204295 ?auto_204297 ) ) ( not ( = ?auto_204295 ?auto_204298 ) ) ( not ( = ?auto_204295 ?auto_204299 ) ) ( not ( = ?auto_204295 ?auto_204300 ) ) ( not ( = ?auto_204296 ?auto_204297 ) ) ( not ( = ?auto_204296 ?auto_204298 ) ) ( not ( = ?auto_204296 ?auto_204299 ) ) ( not ( = ?auto_204296 ?auto_204300 ) ) ( not ( = ?auto_204297 ?auto_204298 ) ) ( not ( = ?auto_204297 ?auto_204299 ) ) ( not ( = ?auto_204297 ?auto_204300 ) ) ( not ( = ?auto_204298 ?auto_204299 ) ) ( not ( = ?auto_204298 ?auto_204300 ) ) ( not ( = ?auto_204299 ?auto_204300 ) ) ( ON ?auto_204300 ?auto_204302 ) ( not ( = ?auto_204294 ?auto_204302 ) ) ( not ( = ?auto_204295 ?auto_204302 ) ) ( not ( = ?auto_204296 ?auto_204302 ) ) ( not ( = ?auto_204297 ?auto_204302 ) ) ( not ( = ?auto_204298 ?auto_204302 ) ) ( not ( = ?auto_204299 ?auto_204302 ) ) ( not ( = ?auto_204300 ?auto_204302 ) ) ( ON ?auto_204299 ?auto_204300 ) ( ON-TABLE ?auto_204302 ) ( ON ?auto_204294 ?auto_204301 ) ( not ( = ?auto_204294 ?auto_204301 ) ) ( not ( = ?auto_204295 ?auto_204301 ) ) ( not ( = ?auto_204296 ?auto_204301 ) ) ( not ( = ?auto_204297 ?auto_204301 ) ) ( not ( = ?auto_204298 ?auto_204301 ) ) ( not ( = ?auto_204299 ?auto_204301 ) ) ( not ( = ?auto_204300 ?auto_204301 ) ) ( not ( = ?auto_204302 ?auto_204301 ) ) ( ON ?auto_204295 ?auto_204294 ) ( ON-TABLE ?auto_204301 ) ( ON ?auto_204296 ?auto_204295 ) ( ON ?auto_204297 ?auto_204296 ) ( CLEAR ?auto_204297 ) ( HOLDING ?auto_204298 ) ( CLEAR ?auto_204299 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_204302 ?auto_204300 ?auto_204299 ?auto_204298 )
      ( MAKE-7PILE ?auto_204294 ?auto_204295 ?auto_204296 ?auto_204297 ?auto_204298 ?auto_204299 ?auto_204300 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_204303 - BLOCK
      ?auto_204304 - BLOCK
      ?auto_204305 - BLOCK
      ?auto_204306 - BLOCK
      ?auto_204307 - BLOCK
      ?auto_204308 - BLOCK
      ?auto_204309 - BLOCK
    )
    :vars
    (
      ?auto_204310 - BLOCK
      ?auto_204311 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_204303 ?auto_204304 ) ) ( not ( = ?auto_204303 ?auto_204305 ) ) ( not ( = ?auto_204303 ?auto_204306 ) ) ( not ( = ?auto_204303 ?auto_204307 ) ) ( not ( = ?auto_204303 ?auto_204308 ) ) ( not ( = ?auto_204303 ?auto_204309 ) ) ( not ( = ?auto_204304 ?auto_204305 ) ) ( not ( = ?auto_204304 ?auto_204306 ) ) ( not ( = ?auto_204304 ?auto_204307 ) ) ( not ( = ?auto_204304 ?auto_204308 ) ) ( not ( = ?auto_204304 ?auto_204309 ) ) ( not ( = ?auto_204305 ?auto_204306 ) ) ( not ( = ?auto_204305 ?auto_204307 ) ) ( not ( = ?auto_204305 ?auto_204308 ) ) ( not ( = ?auto_204305 ?auto_204309 ) ) ( not ( = ?auto_204306 ?auto_204307 ) ) ( not ( = ?auto_204306 ?auto_204308 ) ) ( not ( = ?auto_204306 ?auto_204309 ) ) ( not ( = ?auto_204307 ?auto_204308 ) ) ( not ( = ?auto_204307 ?auto_204309 ) ) ( not ( = ?auto_204308 ?auto_204309 ) ) ( ON ?auto_204309 ?auto_204310 ) ( not ( = ?auto_204303 ?auto_204310 ) ) ( not ( = ?auto_204304 ?auto_204310 ) ) ( not ( = ?auto_204305 ?auto_204310 ) ) ( not ( = ?auto_204306 ?auto_204310 ) ) ( not ( = ?auto_204307 ?auto_204310 ) ) ( not ( = ?auto_204308 ?auto_204310 ) ) ( not ( = ?auto_204309 ?auto_204310 ) ) ( ON ?auto_204308 ?auto_204309 ) ( ON-TABLE ?auto_204310 ) ( ON ?auto_204303 ?auto_204311 ) ( not ( = ?auto_204303 ?auto_204311 ) ) ( not ( = ?auto_204304 ?auto_204311 ) ) ( not ( = ?auto_204305 ?auto_204311 ) ) ( not ( = ?auto_204306 ?auto_204311 ) ) ( not ( = ?auto_204307 ?auto_204311 ) ) ( not ( = ?auto_204308 ?auto_204311 ) ) ( not ( = ?auto_204309 ?auto_204311 ) ) ( not ( = ?auto_204310 ?auto_204311 ) ) ( ON ?auto_204304 ?auto_204303 ) ( ON-TABLE ?auto_204311 ) ( ON ?auto_204305 ?auto_204304 ) ( ON ?auto_204306 ?auto_204305 ) ( CLEAR ?auto_204308 ) ( ON ?auto_204307 ?auto_204306 ) ( CLEAR ?auto_204307 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_204311 ?auto_204303 ?auto_204304 ?auto_204305 ?auto_204306 )
      ( MAKE-7PILE ?auto_204303 ?auto_204304 ?auto_204305 ?auto_204306 ?auto_204307 ?auto_204308 ?auto_204309 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_204312 - BLOCK
      ?auto_204313 - BLOCK
      ?auto_204314 - BLOCK
      ?auto_204315 - BLOCK
      ?auto_204316 - BLOCK
      ?auto_204317 - BLOCK
      ?auto_204318 - BLOCK
    )
    :vars
    (
      ?auto_204319 - BLOCK
      ?auto_204320 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_204312 ?auto_204313 ) ) ( not ( = ?auto_204312 ?auto_204314 ) ) ( not ( = ?auto_204312 ?auto_204315 ) ) ( not ( = ?auto_204312 ?auto_204316 ) ) ( not ( = ?auto_204312 ?auto_204317 ) ) ( not ( = ?auto_204312 ?auto_204318 ) ) ( not ( = ?auto_204313 ?auto_204314 ) ) ( not ( = ?auto_204313 ?auto_204315 ) ) ( not ( = ?auto_204313 ?auto_204316 ) ) ( not ( = ?auto_204313 ?auto_204317 ) ) ( not ( = ?auto_204313 ?auto_204318 ) ) ( not ( = ?auto_204314 ?auto_204315 ) ) ( not ( = ?auto_204314 ?auto_204316 ) ) ( not ( = ?auto_204314 ?auto_204317 ) ) ( not ( = ?auto_204314 ?auto_204318 ) ) ( not ( = ?auto_204315 ?auto_204316 ) ) ( not ( = ?auto_204315 ?auto_204317 ) ) ( not ( = ?auto_204315 ?auto_204318 ) ) ( not ( = ?auto_204316 ?auto_204317 ) ) ( not ( = ?auto_204316 ?auto_204318 ) ) ( not ( = ?auto_204317 ?auto_204318 ) ) ( ON ?auto_204318 ?auto_204319 ) ( not ( = ?auto_204312 ?auto_204319 ) ) ( not ( = ?auto_204313 ?auto_204319 ) ) ( not ( = ?auto_204314 ?auto_204319 ) ) ( not ( = ?auto_204315 ?auto_204319 ) ) ( not ( = ?auto_204316 ?auto_204319 ) ) ( not ( = ?auto_204317 ?auto_204319 ) ) ( not ( = ?auto_204318 ?auto_204319 ) ) ( ON-TABLE ?auto_204319 ) ( ON ?auto_204312 ?auto_204320 ) ( not ( = ?auto_204312 ?auto_204320 ) ) ( not ( = ?auto_204313 ?auto_204320 ) ) ( not ( = ?auto_204314 ?auto_204320 ) ) ( not ( = ?auto_204315 ?auto_204320 ) ) ( not ( = ?auto_204316 ?auto_204320 ) ) ( not ( = ?auto_204317 ?auto_204320 ) ) ( not ( = ?auto_204318 ?auto_204320 ) ) ( not ( = ?auto_204319 ?auto_204320 ) ) ( ON ?auto_204313 ?auto_204312 ) ( ON-TABLE ?auto_204320 ) ( ON ?auto_204314 ?auto_204313 ) ( ON ?auto_204315 ?auto_204314 ) ( ON ?auto_204316 ?auto_204315 ) ( CLEAR ?auto_204316 ) ( HOLDING ?auto_204317 ) ( CLEAR ?auto_204318 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_204319 ?auto_204318 ?auto_204317 )
      ( MAKE-7PILE ?auto_204312 ?auto_204313 ?auto_204314 ?auto_204315 ?auto_204316 ?auto_204317 ?auto_204318 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_204321 - BLOCK
      ?auto_204322 - BLOCK
      ?auto_204323 - BLOCK
      ?auto_204324 - BLOCK
      ?auto_204325 - BLOCK
      ?auto_204326 - BLOCK
      ?auto_204327 - BLOCK
    )
    :vars
    (
      ?auto_204328 - BLOCK
      ?auto_204329 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_204321 ?auto_204322 ) ) ( not ( = ?auto_204321 ?auto_204323 ) ) ( not ( = ?auto_204321 ?auto_204324 ) ) ( not ( = ?auto_204321 ?auto_204325 ) ) ( not ( = ?auto_204321 ?auto_204326 ) ) ( not ( = ?auto_204321 ?auto_204327 ) ) ( not ( = ?auto_204322 ?auto_204323 ) ) ( not ( = ?auto_204322 ?auto_204324 ) ) ( not ( = ?auto_204322 ?auto_204325 ) ) ( not ( = ?auto_204322 ?auto_204326 ) ) ( not ( = ?auto_204322 ?auto_204327 ) ) ( not ( = ?auto_204323 ?auto_204324 ) ) ( not ( = ?auto_204323 ?auto_204325 ) ) ( not ( = ?auto_204323 ?auto_204326 ) ) ( not ( = ?auto_204323 ?auto_204327 ) ) ( not ( = ?auto_204324 ?auto_204325 ) ) ( not ( = ?auto_204324 ?auto_204326 ) ) ( not ( = ?auto_204324 ?auto_204327 ) ) ( not ( = ?auto_204325 ?auto_204326 ) ) ( not ( = ?auto_204325 ?auto_204327 ) ) ( not ( = ?auto_204326 ?auto_204327 ) ) ( ON ?auto_204327 ?auto_204328 ) ( not ( = ?auto_204321 ?auto_204328 ) ) ( not ( = ?auto_204322 ?auto_204328 ) ) ( not ( = ?auto_204323 ?auto_204328 ) ) ( not ( = ?auto_204324 ?auto_204328 ) ) ( not ( = ?auto_204325 ?auto_204328 ) ) ( not ( = ?auto_204326 ?auto_204328 ) ) ( not ( = ?auto_204327 ?auto_204328 ) ) ( ON-TABLE ?auto_204328 ) ( ON ?auto_204321 ?auto_204329 ) ( not ( = ?auto_204321 ?auto_204329 ) ) ( not ( = ?auto_204322 ?auto_204329 ) ) ( not ( = ?auto_204323 ?auto_204329 ) ) ( not ( = ?auto_204324 ?auto_204329 ) ) ( not ( = ?auto_204325 ?auto_204329 ) ) ( not ( = ?auto_204326 ?auto_204329 ) ) ( not ( = ?auto_204327 ?auto_204329 ) ) ( not ( = ?auto_204328 ?auto_204329 ) ) ( ON ?auto_204322 ?auto_204321 ) ( ON-TABLE ?auto_204329 ) ( ON ?auto_204323 ?auto_204322 ) ( ON ?auto_204324 ?auto_204323 ) ( ON ?auto_204325 ?auto_204324 ) ( CLEAR ?auto_204327 ) ( ON ?auto_204326 ?auto_204325 ) ( CLEAR ?auto_204326 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_204329 ?auto_204321 ?auto_204322 ?auto_204323 ?auto_204324 ?auto_204325 )
      ( MAKE-7PILE ?auto_204321 ?auto_204322 ?auto_204323 ?auto_204324 ?auto_204325 ?auto_204326 ?auto_204327 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_204330 - BLOCK
      ?auto_204331 - BLOCK
      ?auto_204332 - BLOCK
      ?auto_204333 - BLOCK
      ?auto_204334 - BLOCK
      ?auto_204335 - BLOCK
      ?auto_204336 - BLOCK
    )
    :vars
    (
      ?auto_204338 - BLOCK
      ?auto_204337 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_204330 ?auto_204331 ) ) ( not ( = ?auto_204330 ?auto_204332 ) ) ( not ( = ?auto_204330 ?auto_204333 ) ) ( not ( = ?auto_204330 ?auto_204334 ) ) ( not ( = ?auto_204330 ?auto_204335 ) ) ( not ( = ?auto_204330 ?auto_204336 ) ) ( not ( = ?auto_204331 ?auto_204332 ) ) ( not ( = ?auto_204331 ?auto_204333 ) ) ( not ( = ?auto_204331 ?auto_204334 ) ) ( not ( = ?auto_204331 ?auto_204335 ) ) ( not ( = ?auto_204331 ?auto_204336 ) ) ( not ( = ?auto_204332 ?auto_204333 ) ) ( not ( = ?auto_204332 ?auto_204334 ) ) ( not ( = ?auto_204332 ?auto_204335 ) ) ( not ( = ?auto_204332 ?auto_204336 ) ) ( not ( = ?auto_204333 ?auto_204334 ) ) ( not ( = ?auto_204333 ?auto_204335 ) ) ( not ( = ?auto_204333 ?auto_204336 ) ) ( not ( = ?auto_204334 ?auto_204335 ) ) ( not ( = ?auto_204334 ?auto_204336 ) ) ( not ( = ?auto_204335 ?auto_204336 ) ) ( not ( = ?auto_204330 ?auto_204338 ) ) ( not ( = ?auto_204331 ?auto_204338 ) ) ( not ( = ?auto_204332 ?auto_204338 ) ) ( not ( = ?auto_204333 ?auto_204338 ) ) ( not ( = ?auto_204334 ?auto_204338 ) ) ( not ( = ?auto_204335 ?auto_204338 ) ) ( not ( = ?auto_204336 ?auto_204338 ) ) ( ON-TABLE ?auto_204338 ) ( ON ?auto_204330 ?auto_204337 ) ( not ( = ?auto_204330 ?auto_204337 ) ) ( not ( = ?auto_204331 ?auto_204337 ) ) ( not ( = ?auto_204332 ?auto_204337 ) ) ( not ( = ?auto_204333 ?auto_204337 ) ) ( not ( = ?auto_204334 ?auto_204337 ) ) ( not ( = ?auto_204335 ?auto_204337 ) ) ( not ( = ?auto_204336 ?auto_204337 ) ) ( not ( = ?auto_204338 ?auto_204337 ) ) ( ON ?auto_204331 ?auto_204330 ) ( ON-TABLE ?auto_204337 ) ( ON ?auto_204332 ?auto_204331 ) ( ON ?auto_204333 ?auto_204332 ) ( ON ?auto_204334 ?auto_204333 ) ( ON ?auto_204335 ?auto_204334 ) ( CLEAR ?auto_204335 ) ( HOLDING ?auto_204336 ) ( CLEAR ?auto_204338 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_204338 ?auto_204336 )
      ( MAKE-7PILE ?auto_204330 ?auto_204331 ?auto_204332 ?auto_204333 ?auto_204334 ?auto_204335 ?auto_204336 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_204339 - BLOCK
      ?auto_204340 - BLOCK
      ?auto_204341 - BLOCK
      ?auto_204342 - BLOCK
      ?auto_204343 - BLOCK
      ?auto_204344 - BLOCK
      ?auto_204345 - BLOCK
    )
    :vars
    (
      ?auto_204347 - BLOCK
      ?auto_204346 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_204339 ?auto_204340 ) ) ( not ( = ?auto_204339 ?auto_204341 ) ) ( not ( = ?auto_204339 ?auto_204342 ) ) ( not ( = ?auto_204339 ?auto_204343 ) ) ( not ( = ?auto_204339 ?auto_204344 ) ) ( not ( = ?auto_204339 ?auto_204345 ) ) ( not ( = ?auto_204340 ?auto_204341 ) ) ( not ( = ?auto_204340 ?auto_204342 ) ) ( not ( = ?auto_204340 ?auto_204343 ) ) ( not ( = ?auto_204340 ?auto_204344 ) ) ( not ( = ?auto_204340 ?auto_204345 ) ) ( not ( = ?auto_204341 ?auto_204342 ) ) ( not ( = ?auto_204341 ?auto_204343 ) ) ( not ( = ?auto_204341 ?auto_204344 ) ) ( not ( = ?auto_204341 ?auto_204345 ) ) ( not ( = ?auto_204342 ?auto_204343 ) ) ( not ( = ?auto_204342 ?auto_204344 ) ) ( not ( = ?auto_204342 ?auto_204345 ) ) ( not ( = ?auto_204343 ?auto_204344 ) ) ( not ( = ?auto_204343 ?auto_204345 ) ) ( not ( = ?auto_204344 ?auto_204345 ) ) ( not ( = ?auto_204339 ?auto_204347 ) ) ( not ( = ?auto_204340 ?auto_204347 ) ) ( not ( = ?auto_204341 ?auto_204347 ) ) ( not ( = ?auto_204342 ?auto_204347 ) ) ( not ( = ?auto_204343 ?auto_204347 ) ) ( not ( = ?auto_204344 ?auto_204347 ) ) ( not ( = ?auto_204345 ?auto_204347 ) ) ( ON-TABLE ?auto_204347 ) ( ON ?auto_204339 ?auto_204346 ) ( not ( = ?auto_204339 ?auto_204346 ) ) ( not ( = ?auto_204340 ?auto_204346 ) ) ( not ( = ?auto_204341 ?auto_204346 ) ) ( not ( = ?auto_204342 ?auto_204346 ) ) ( not ( = ?auto_204343 ?auto_204346 ) ) ( not ( = ?auto_204344 ?auto_204346 ) ) ( not ( = ?auto_204345 ?auto_204346 ) ) ( not ( = ?auto_204347 ?auto_204346 ) ) ( ON ?auto_204340 ?auto_204339 ) ( ON-TABLE ?auto_204346 ) ( ON ?auto_204341 ?auto_204340 ) ( ON ?auto_204342 ?auto_204341 ) ( ON ?auto_204343 ?auto_204342 ) ( ON ?auto_204344 ?auto_204343 ) ( CLEAR ?auto_204347 ) ( ON ?auto_204345 ?auto_204344 ) ( CLEAR ?auto_204345 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_204346 ?auto_204339 ?auto_204340 ?auto_204341 ?auto_204342 ?auto_204343 ?auto_204344 )
      ( MAKE-7PILE ?auto_204339 ?auto_204340 ?auto_204341 ?auto_204342 ?auto_204343 ?auto_204344 ?auto_204345 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_204348 - BLOCK
      ?auto_204349 - BLOCK
      ?auto_204350 - BLOCK
      ?auto_204351 - BLOCK
      ?auto_204352 - BLOCK
      ?auto_204353 - BLOCK
      ?auto_204354 - BLOCK
    )
    :vars
    (
      ?auto_204356 - BLOCK
      ?auto_204355 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_204348 ?auto_204349 ) ) ( not ( = ?auto_204348 ?auto_204350 ) ) ( not ( = ?auto_204348 ?auto_204351 ) ) ( not ( = ?auto_204348 ?auto_204352 ) ) ( not ( = ?auto_204348 ?auto_204353 ) ) ( not ( = ?auto_204348 ?auto_204354 ) ) ( not ( = ?auto_204349 ?auto_204350 ) ) ( not ( = ?auto_204349 ?auto_204351 ) ) ( not ( = ?auto_204349 ?auto_204352 ) ) ( not ( = ?auto_204349 ?auto_204353 ) ) ( not ( = ?auto_204349 ?auto_204354 ) ) ( not ( = ?auto_204350 ?auto_204351 ) ) ( not ( = ?auto_204350 ?auto_204352 ) ) ( not ( = ?auto_204350 ?auto_204353 ) ) ( not ( = ?auto_204350 ?auto_204354 ) ) ( not ( = ?auto_204351 ?auto_204352 ) ) ( not ( = ?auto_204351 ?auto_204353 ) ) ( not ( = ?auto_204351 ?auto_204354 ) ) ( not ( = ?auto_204352 ?auto_204353 ) ) ( not ( = ?auto_204352 ?auto_204354 ) ) ( not ( = ?auto_204353 ?auto_204354 ) ) ( not ( = ?auto_204348 ?auto_204356 ) ) ( not ( = ?auto_204349 ?auto_204356 ) ) ( not ( = ?auto_204350 ?auto_204356 ) ) ( not ( = ?auto_204351 ?auto_204356 ) ) ( not ( = ?auto_204352 ?auto_204356 ) ) ( not ( = ?auto_204353 ?auto_204356 ) ) ( not ( = ?auto_204354 ?auto_204356 ) ) ( ON ?auto_204348 ?auto_204355 ) ( not ( = ?auto_204348 ?auto_204355 ) ) ( not ( = ?auto_204349 ?auto_204355 ) ) ( not ( = ?auto_204350 ?auto_204355 ) ) ( not ( = ?auto_204351 ?auto_204355 ) ) ( not ( = ?auto_204352 ?auto_204355 ) ) ( not ( = ?auto_204353 ?auto_204355 ) ) ( not ( = ?auto_204354 ?auto_204355 ) ) ( not ( = ?auto_204356 ?auto_204355 ) ) ( ON ?auto_204349 ?auto_204348 ) ( ON-TABLE ?auto_204355 ) ( ON ?auto_204350 ?auto_204349 ) ( ON ?auto_204351 ?auto_204350 ) ( ON ?auto_204352 ?auto_204351 ) ( ON ?auto_204353 ?auto_204352 ) ( ON ?auto_204354 ?auto_204353 ) ( CLEAR ?auto_204354 ) ( HOLDING ?auto_204356 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_204356 )
      ( MAKE-7PILE ?auto_204348 ?auto_204349 ?auto_204350 ?auto_204351 ?auto_204352 ?auto_204353 ?auto_204354 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_204357 - BLOCK
      ?auto_204358 - BLOCK
      ?auto_204359 - BLOCK
      ?auto_204360 - BLOCK
      ?auto_204361 - BLOCK
      ?auto_204362 - BLOCK
      ?auto_204363 - BLOCK
    )
    :vars
    (
      ?auto_204365 - BLOCK
      ?auto_204364 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_204357 ?auto_204358 ) ) ( not ( = ?auto_204357 ?auto_204359 ) ) ( not ( = ?auto_204357 ?auto_204360 ) ) ( not ( = ?auto_204357 ?auto_204361 ) ) ( not ( = ?auto_204357 ?auto_204362 ) ) ( not ( = ?auto_204357 ?auto_204363 ) ) ( not ( = ?auto_204358 ?auto_204359 ) ) ( not ( = ?auto_204358 ?auto_204360 ) ) ( not ( = ?auto_204358 ?auto_204361 ) ) ( not ( = ?auto_204358 ?auto_204362 ) ) ( not ( = ?auto_204358 ?auto_204363 ) ) ( not ( = ?auto_204359 ?auto_204360 ) ) ( not ( = ?auto_204359 ?auto_204361 ) ) ( not ( = ?auto_204359 ?auto_204362 ) ) ( not ( = ?auto_204359 ?auto_204363 ) ) ( not ( = ?auto_204360 ?auto_204361 ) ) ( not ( = ?auto_204360 ?auto_204362 ) ) ( not ( = ?auto_204360 ?auto_204363 ) ) ( not ( = ?auto_204361 ?auto_204362 ) ) ( not ( = ?auto_204361 ?auto_204363 ) ) ( not ( = ?auto_204362 ?auto_204363 ) ) ( not ( = ?auto_204357 ?auto_204365 ) ) ( not ( = ?auto_204358 ?auto_204365 ) ) ( not ( = ?auto_204359 ?auto_204365 ) ) ( not ( = ?auto_204360 ?auto_204365 ) ) ( not ( = ?auto_204361 ?auto_204365 ) ) ( not ( = ?auto_204362 ?auto_204365 ) ) ( not ( = ?auto_204363 ?auto_204365 ) ) ( ON ?auto_204357 ?auto_204364 ) ( not ( = ?auto_204357 ?auto_204364 ) ) ( not ( = ?auto_204358 ?auto_204364 ) ) ( not ( = ?auto_204359 ?auto_204364 ) ) ( not ( = ?auto_204360 ?auto_204364 ) ) ( not ( = ?auto_204361 ?auto_204364 ) ) ( not ( = ?auto_204362 ?auto_204364 ) ) ( not ( = ?auto_204363 ?auto_204364 ) ) ( not ( = ?auto_204365 ?auto_204364 ) ) ( ON ?auto_204358 ?auto_204357 ) ( ON-TABLE ?auto_204364 ) ( ON ?auto_204359 ?auto_204358 ) ( ON ?auto_204360 ?auto_204359 ) ( ON ?auto_204361 ?auto_204360 ) ( ON ?auto_204362 ?auto_204361 ) ( ON ?auto_204363 ?auto_204362 ) ( ON ?auto_204365 ?auto_204363 ) ( CLEAR ?auto_204365 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_204364 ?auto_204357 ?auto_204358 ?auto_204359 ?auto_204360 ?auto_204361 ?auto_204362 ?auto_204363 )
      ( MAKE-7PILE ?auto_204357 ?auto_204358 ?auto_204359 ?auto_204360 ?auto_204361 ?auto_204362 ?auto_204363 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_204374 - BLOCK
      ?auto_204375 - BLOCK
      ?auto_204376 - BLOCK
      ?auto_204377 - BLOCK
      ?auto_204378 - BLOCK
      ?auto_204379 - BLOCK
      ?auto_204380 - BLOCK
      ?auto_204381 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_204381 ) ( CLEAR ?auto_204380 ) ( ON-TABLE ?auto_204374 ) ( ON ?auto_204375 ?auto_204374 ) ( ON ?auto_204376 ?auto_204375 ) ( ON ?auto_204377 ?auto_204376 ) ( ON ?auto_204378 ?auto_204377 ) ( ON ?auto_204379 ?auto_204378 ) ( ON ?auto_204380 ?auto_204379 ) ( not ( = ?auto_204374 ?auto_204375 ) ) ( not ( = ?auto_204374 ?auto_204376 ) ) ( not ( = ?auto_204374 ?auto_204377 ) ) ( not ( = ?auto_204374 ?auto_204378 ) ) ( not ( = ?auto_204374 ?auto_204379 ) ) ( not ( = ?auto_204374 ?auto_204380 ) ) ( not ( = ?auto_204374 ?auto_204381 ) ) ( not ( = ?auto_204375 ?auto_204376 ) ) ( not ( = ?auto_204375 ?auto_204377 ) ) ( not ( = ?auto_204375 ?auto_204378 ) ) ( not ( = ?auto_204375 ?auto_204379 ) ) ( not ( = ?auto_204375 ?auto_204380 ) ) ( not ( = ?auto_204375 ?auto_204381 ) ) ( not ( = ?auto_204376 ?auto_204377 ) ) ( not ( = ?auto_204376 ?auto_204378 ) ) ( not ( = ?auto_204376 ?auto_204379 ) ) ( not ( = ?auto_204376 ?auto_204380 ) ) ( not ( = ?auto_204376 ?auto_204381 ) ) ( not ( = ?auto_204377 ?auto_204378 ) ) ( not ( = ?auto_204377 ?auto_204379 ) ) ( not ( = ?auto_204377 ?auto_204380 ) ) ( not ( = ?auto_204377 ?auto_204381 ) ) ( not ( = ?auto_204378 ?auto_204379 ) ) ( not ( = ?auto_204378 ?auto_204380 ) ) ( not ( = ?auto_204378 ?auto_204381 ) ) ( not ( = ?auto_204379 ?auto_204380 ) ) ( not ( = ?auto_204379 ?auto_204381 ) ) ( not ( = ?auto_204380 ?auto_204381 ) ) )
    :subtasks
    ( ( !STACK ?auto_204381 ?auto_204380 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_204382 - BLOCK
      ?auto_204383 - BLOCK
      ?auto_204384 - BLOCK
      ?auto_204385 - BLOCK
      ?auto_204386 - BLOCK
      ?auto_204387 - BLOCK
      ?auto_204388 - BLOCK
      ?auto_204389 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_204388 ) ( ON-TABLE ?auto_204382 ) ( ON ?auto_204383 ?auto_204382 ) ( ON ?auto_204384 ?auto_204383 ) ( ON ?auto_204385 ?auto_204384 ) ( ON ?auto_204386 ?auto_204385 ) ( ON ?auto_204387 ?auto_204386 ) ( ON ?auto_204388 ?auto_204387 ) ( not ( = ?auto_204382 ?auto_204383 ) ) ( not ( = ?auto_204382 ?auto_204384 ) ) ( not ( = ?auto_204382 ?auto_204385 ) ) ( not ( = ?auto_204382 ?auto_204386 ) ) ( not ( = ?auto_204382 ?auto_204387 ) ) ( not ( = ?auto_204382 ?auto_204388 ) ) ( not ( = ?auto_204382 ?auto_204389 ) ) ( not ( = ?auto_204383 ?auto_204384 ) ) ( not ( = ?auto_204383 ?auto_204385 ) ) ( not ( = ?auto_204383 ?auto_204386 ) ) ( not ( = ?auto_204383 ?auto_204387 ) ) ( not ( = ?auto_204383 ?auto_204388 ) ) ( not ( = ?auto_204383 ?auto_204389 ) ) ( not ( = ?auto_204384 ?auto_204385 ) ) ( not ( = ?auto_204384 ?auto_204386 ) ) ( not ( = ?auto_204384 ?auto_204387 ) ) ( not ( = ?auto_204384 ?auto_204388 ) ) ( not ( = ?auto_204384 ?auto_204389 ) ) ( not ( = ?auto_204385 ?auto_204386 ) ) ( not ( = ?auto_204385 ?auto_204387 ) ) ( not ( = ?auto_204385 ?auto_204388 ) ) ( not ( = ?auto_204385 ?auto_204389 ) ) ( not ( = ?auto_204386 ?auto_204387 ) ) ( not ( = ?auto_204386 ?auto_204388 ) ) ( not ( = ?auto_204386 ?auto_204389 ) ) ( not ( = ?auto_204387 ?auto_204388 ) ) ( not ( = ?auto_204387 ?auto_204389 ) ) ( not ( = ?auto_204388 ?auto_204389 ) ) ( ON-TABLE ?auto_204389 ) ( CLEAR ?auto_204389 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_204389 )
      ( MAKE-8PILE ?auto_204382 ?auto_204383 ?auto_204384 ?auto_204385 ?auto_204386 ?auto_204387 ?auto_204388 ?auto_204389 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_204390 - BLOCK
      ?auto_204391 - BLOCK
      ?auto_204392 - BLOCK
      ?auto_204393 - BLOCK
      ?auto_204394 - BLOCK
      ?auto_204395 - BLOCK
      ?auto_204396 - BLOCK
      ?auto_204397 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_204390 ) ( ON ?auto_204391 ?auto_204390 ) ( ON ?auto_204392 ?auto_204391 ) ( ON ?auto_204393 ?auto_204392 ) ( ON ?auto_204394 ?auto_204393 ) ( ON ?auto_204395 ?auto_204394 ) ( not ( = ?auto_204390 ?auto_204391 ) ) ( not ( = ?auto_204390 ?auto_204392 ) ) ( not ( = ?auto_204390 ?auto_204393 ) ) ( not ( = ?auto_204390 ?auto_204394 ) ) ( not ( = ?auto_204390 ?auto_204395 ) ) ( not ( = ?auto_204390 ?auto_204396 ) ) ( not ( = ?auto_204390 ?auto_204397 ) ) ( not ( = ?auto_204391 ?auto_204392 ) ) ( not ( = ?auto_204391 ?auto_204393 ) ) ( not ( = ?auto_204391 ?auto_204394 ) ) ( not ( = ?auto_204391 ?auto_204395 ) ) ( not ( = ?auto_204391 ?auto_204396 ) ) ( not ( = ?auto_204391 ?auto_204397 ) ) ( not ( = ?auto_204392 ?auto_204393 ) ) ( not ( = ?auto_204392 ?auto_204394 ) ) ( not ( = ?auto_204392 ?auto_204395 ) ) ( not ( = ?auto_204392 ?auto_204396 ) ) ( not ( = ?auto_204392 ?auto_204397 ) ) ( not ( = ?auto_204393 ?auto_204394 ) ) ( not ( = ?auto_204393 ?auto_204395 ) ) ( not ( = ?auto_204393 ?auto_204396 ) ) ( not ( = ?auto_204393 ?auto_204397 ) ) ( not ( = ?auto_204394 ?auto_204395 ) ) ( not ( = ?auto_204394 ?auto_204396 ) ) ( not ( = ?auto_204394 ?auto_204397 ) ) ( not ( = ?auto_204395 ?auto_204396 ) ) ( not ( = ?auto_204395 ?auto_204397 ) ) ( not ( = ?auto_204396 ?auto_204397 ) ) ( ON-TABLE ?auto_204397 ) ( CLEAR ?auto_204397 ) ( HOLDING ?auto_204396 ) ( CLEAR ?auto_204395 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_204390 ?auto_204391 ?auto_204392 ?auto_204393 ?auto_204394 ?auto_204395 ?auto_204396 )
      ( MAKE-8PILE ?auto_204390 ?auto_204391 ?auto_204392 ?auto_204393 ?auto_204394 ?auto_204395 ?auto_204396 ?auto_204397 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_204398 - BLOCK
      ?auto_204399 - BLOCK
      ?auto_204400 - BLOCK
      ?auto_204401 - BLOCK
      ?auto_204402 - BLOCK
      ?auto_204403 - BLOCK
      ?auto_204404 - BLOCK
      ?auto_204405 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_204398 ) ( ON ?auto_204399 ?auto_204398 ) ( ON ?auto_204400 ?auto_204399 ) ( ON ?auto_204401 ?auto_204400 ) ( ON ?auto_204402 ?auto_204401 ) ( ON ?auto_204403 ?auto_204402 ) ( not ( = ?auto_204398 ?auto_204399 ) ) ( not ( = ?auto_204398 ?auto_204400 ) ) ( not ( = ?auto_204398 ?auto_204401 ) ) ( not ( = ?auto_204398 ?auto_204402 ) ) ( not ( = ?auto_204398 ?auto_204403 ) ) ( not ( = ?auto_204398 ?auto_204404 ) ) ( not ( = ?auto_204398 ?auto_204405 ) ) ( not ( = ?auto_204399 ?auto_204400 ) ) ( not ( = ?auto_204399 ?auto_204401 ) ) ( not ( = ?auto_204399 ?auto_204402 ) ) ( not ( = ?auto_204399 ?auto_204403 ) ) ( not ( = ?auto_204399 ?auto_204404 ) ) ( not ( = ?auto_204399 ?auto_204405 ) ) ( not ( = ?auto_204400 ?auto_204401 ) ) ( not ( = ?auto_204400 ?auto_204402 ) ) ( not ( = ?auto_204400 ?auto_204403 ) ) ( not ( = ?auto_204400 ?auto_204404 ) ) ( not ( = ?auto_204400 ?auto_204405 ) ) ( not ( = ?auto_204401 ?auto_204402 ) ) ( not ( = ?auto_204401 ?auto_204403 ) ) ( not ( = ?auto_204401 ?auto_204404 ) ) ( not ( = ?auto_204401 ?auto_204405 ) ) ( not ( = ?auto_204402 ?auto_204403 ) ) ( not ( = ?auto_204402 ?auto_204404 ) ) ( not ( = ?auto_204402 ?auto_204405 ) ) ( not ( = ?auto_204403 ?auto_204404 ) ) ( not ( = ?auto_204403 ?auto_204405 ) ) ( not ( = ?auto_204404 ?auto_204405 ) ) ( ON-TABLE ?auto_204405 ) ( CLEAR ?auto_204403 ) ( ON ?auto_204404 ?auto_204405 ) ( CLEAR ?auto_204404 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_204405 )
      ( MAKE-8PILE ?auto_204398 ?auto_204399 ?auto_204400 ?auto_204401 ?auto_204402 ?auto_204403 ?auto_204404 ?auto_204405 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_204406 - BLOCK
      ?auto_204407 - BLOCK
      ?auto_204408 - BLOCK
      ?auto_204409 - BLOCK
      ?auto_204410 - BLOCK
      ?auto_204411 - BLOCK
      ?auto_204412 - BLOCK
      ?auto_204413 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_204406 ) ( ON ?auto_204407 ?auto_204406 ) ( ON ?auto_204408 ?auto_204407 ) ( ON ?auto_204409 ?auto_204408 ) ( ON ?auto_204410 ?auto_204409 ) ( not ( = ?auto_204406 ?auto_204407 ) ) ( not ( = ?auto_204406 ?auto_204408 ) ) ( not ( = ?auto_204406 ?auto_204409 ) ) ( not ( = ?auto_204406 ?auto_204410 ) ) ( not ( = ?auto_204406 ?auto_204411 ) ) ( not ( = ?auto_204406 ?auto_204412 ) ) ( not ( = ?auto_204406 ?auto_204413 ) ) ( not ( = ?auto_204407 ?auto_204408 ) ) ( not ( = ?auto_204407 ?auto_204409 ) ) ( not ( = ?auto_204407 ?auto_204410 ) ) ( not ( = ?auto_204407 ?auto_204411 ) ) ( not ( = ?auto_204407 ?auto_204412 ) ) ( not ( = ?auto_204407 ?auto_204413 ) ) ( not ( = ?auto_204408 ?auto_204409 ) ) ( not ( = ?auto_204408 ?auto_204410 ) ) ( not ( = ?auto_204408 ?auto_204411 ) ) ( not ( = ?auto_204408 ?auto_204412 ) ) ( not ( = ?auto_204408 ?auto_204413 ) ) ( not ( = ?auto_204409 ?auto_204410 ) ) ( not ( = ?auto_204409 ?auto_204411 ) ) ( not ( = ?auto_204409 ?auto_204412 ) ) ( not ( = ?auto_204409 ?auto_204413 ) ) ( not ( = ?auto_204410 ?auto_204411 ) ) ( not ( = ?auto_204410 ?auto_204412 ) ) ( not ( = ?auto_204410 ?auto_204413 ) ) ( not ( = ?auto_204411 ?auto_204412 ) ) ( not ( = ?auto_204411 ?auto_204413 ) ) ( not ( = ?auto_204412 ?auto_204413 ) ) ( ON-TABLE ?auto_204413 ) ( ON ?auto_204412 ?auto_204413 ) ( CLEAR ?auto_204412 ) ( HOLDING ?auto_204411 ) ( CLEAR ?auto_204410 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_204406 ?auto_204407 ?auto_204408 ?auto_204409 ?auto_204410 ?auto_204411 )
      ( MAKE-8PILE ?auto_204406 ?auto_204407 ?auto_204408 ?auto_204409 ?auto_204410 ?auto_204411 ?auto_204412 ?auto_204413 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_204414 - BLOCK
      ?auto_204415 - BLOCK
      ?auto_204416 - BLOCK
      ?auto_204417 - BLOCK
      ?auto_204418 - BLOCK
      ?auto_204419 - BLOCK
      ?auto_204420 - BLOCK
      ?auto_204421 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_204414 ) ( ON ?auto_204415 ?auto_204414 ) ( ON ?auto_204416 ?auto_204415 ) ( ON ?auto_204417 ?auto_204416 ) ( ON ?auto_204418 ?auto_204417 ) ( not ( = ?auto_204414 ?auto_204415 ) ) ( not ( = ?auto_204414 ?auto_204416 ) ) ( not ( = ?auto_204414 ?auto_204417 ) ) ( not ( = ?auto_204414 ?auto_204418 ) ) ( not ( = ?auto_204414 ?auto_204419 ) ) ( not ( = ?auto_204414 ?auto_204420 ) ) ( not ( = ?auto_204414 ?auto_204421 ) ) ( not ( = ?auto_204415 ?auto_204416 ) ) ( not ( = ?auto_204415 ?auto_204417 ) ) ( not ( = ?auto_204415 ?auto_204418 ) ) ( not ( = ?auto_204415 ?auto_204419 ) ) ( not ( = ?auto_204415 ?auto_204420 ) ) ( not ( = ?auto_204415 ?auto_204421 ) ) ( not ( = ?auto_204416 ?auto_204417 ) ) ( not ( = ?auto_204416 ?auto_204418 ) ) ( not ( = ?auto_204416 ?auto_204419 ) ) ( not ( = ?auto_204416 ?auto_204420 ) ) ( not ( = ?auto_204416 ?auto_204421 ) ) ( not ( = ?auto_204417 ?auto_204418 ) ) ( not ( = ?auto_204417 ?auto_204419 ) ) ( not ( = ?auto_204417 ?auto_204420 ) ) ( not ( = ?auto_204417 ?auto_204421 ) ) ( not ( = ?auto_204418 ?auto_204419 ) ) ( not ( = ?auto_204418 ?auto_204420 ) ) ( not ( = ?auto_204418 ?auto_204421 ) ) ( not ( = ?auto_204419 ?auto_204420 ) ) ( not ( = ?auto_204419 ?auto_204421 ) ) ( not ( = ?auto_204420 ?auto_204421 ) ) ( ON-TABLE ?auto_204421 ) ( ON ?auto_204420 ?auto_204421 ) ( CLEAR ?auto_204418 ) ( ON ?auto_204419 ?auto_204420 ) ( CLEAR ?auto_204419 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_204421 ?auto_204420 )
      ( MAKE-8PILE ?auto_204414 ?auto_204415 ?auto_204416 ?auto_204417 ?auto_204418 ?auto_204419 ?auto_204420 ?auto_204421 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_204422 - BLOCK
      ?auto_204423 - BLOCK
      ?auto_204424 - BLOCK
      ?auto_204425 - BLOCK
      ?auto_204426 - BLOCK
      ?auto_204427 - BLOCK
      ?auto_204428 - BLOCK
      ?auto_204429 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_204422 ) ( ON ?auto_204423 ?auto_204422 ) ( ON ?auto_204424 ?auto_204423 ) ( ON ?auto_204425 ?auto_204424 ) ( not ( = ?auto_204422 ?auto_204423 ) ) ( not ( = ?auto_204422 ?auto_204424 ) ) ( not ( = ?auto_204422 ?auto_204425 ) ) ( not ( = ?auto_204422 ?auto_204426 ) ) ( not ( = ?auto_204422 ?auto_204427 ) ) ( not ( = ?auto_204422 ?auto_204428 ) ) ( not ( = ?auto_204422 ?auto_204429 ) ) ( not ( = ?auto_204423 ?auto_204424 ) ) ( not ( = ?auto_204423 ?auto_204425 ) ) ( not ( = ?auto_204423 ?auto_204426 ) ) ( not ( = ?auto_204423 ?auto_204427 ) ) ( not ( = ?auto_204423 ?auto_204428 ) ) ( not ( = ?auto_204423 ?auto_204429 ) ) ( not ( = ?auto_204424 ?auto_204425 ) ) ( not ( = ?auto_204424 ?auto_204426 ) ) ( not ( = ?auto_204424 ?auto_204427 ) ) ( not ( = ?auto_204424 ?auto_204428 ) ) ( not ( = ?auto_204424 ?auto_204429 ) ) ( not ( = ?auto_204425 ?auto_204426 ) ) ( not ( = ?auto_204425 ?auto_204427 ) ) ( not ( = ?auto_204425 ?auto_204428 ) ) ( not ( = ?auto_204425 ?auto_204429 ) ) ( not ( = ?auto_204426 ?auto_204427 ) ) ( not ( = ?auto_204426 ?auto_204428 ) ) ( not ( = ?auto_204426 ?auto_204429 ) ) ( not ( = ?auto_204427 ?auto_204428 ) ) ( not ( = ?auto_204427 ?auto_204429 ) ) ( not ( = ?auto_204428 ?auto_204429 ) ) ( ON-TABLE ?auto_204429 ) ( ON ?auto_204428 ?auto_204429 ) ( ON ?auto_204427 ?auto_204428 ) ( CLEAR ?auto_204427 ) ( HOLDING ?auto_204426 ) ( CLEAR ?auto_204425 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_204422 ?auto_204423 ?auto_204424 ?auto_204425 ?auto_204426 )
      ( MAKE-8PILE ?auto_204422 ?auto_204423 ?auto_204424 ?auto_204425 ?auto_204426 ?auto_204427 ?auto_204428 ?auto_204429 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_204430 - BLOCK
      ?auto_204431 - BLOCK
      ?auto_204432 - BLOCK
      ?auto_204433 - BLOCK
      ?auto_204434 - BLOCK
      ?auto_204435 - BLOCK
      ?auto_204436 - BLOCK
      ?auto_204437 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_204430 ) ( ON ?auto_204431 ?auto_204430 ) ( ON ?auto_204432 ?auto_204431 ) ( ON ?auto_204433 ?auto_204432 ) ( not ( = ?auto_204430 ?auto_204431 ) ) ( not ( = ?auto_204430 ?auto_204432 ) ) ( not ( = ?auto_204430 ?auto_204433 ) ) ( not ( = ?auto_204430 ?auto_204434 ) ) ( not ( = ?auto_204430 ?auto_204435 ) ) ( not ( = ?auto_204430 ?auto_204436 ) ) ( not ( = ?auto_204430 ?auto_204437 ) ) ( not ( = ?auto_204431 ?auto_204432 ) ) ( not ( = ?auto_204431 ?auto_204433 ) ) ( not ( = ?auto_204431 ?auto_204434 ) ) ( not ( = ?auto_204431 ?auto_204435 ) ) ( not ( = ?auto_204431 ?auto_204436 ) ) ( not ( = ?auto_204431 ?auto_204437 ) ) ( not ( = ?auto_204432 ?auto_204433 ) ) ( not ( = ?auto_204432 ?auto_204434 ) ) ( not ( = ?auto_204432 ?auto_204435 ) ) ( not ( = ?auto_204432 ?auto_204436 ) ) ( not ( = ?auto_204432 ?auto_204437 ) ) ( not ( = ?auto_204433 ?auto_204434 ) ) ( not ( = ?auto_204433 ?auto_204435 ) ) ( not ( = ?auto_204433 ?auto_204436 ) ) ( not ( = ?auto_204433 ?auto_204437 ) ) ( not ( = ?auto_204434 ?auto_204435 ) ) ( not ( = ?auto_204434 ?auto_204436 ) ) ( not ( = ?auto_204434 ?auto_204437 ) ) ( not ( = ?auto_204435 ?auto_204436 ) ) ( not ( = ?auto_204435 ?auto_204437 ) ) ( not ( = ?auto_204436 ?auto_204437 ) ) ( ON-TABLE ?auto_204437 ) ( ON ?auto_204436 ?auto_204437 ) ( ON ?auto_204435 ?auto_204436 ) ( CLEAR ?auto_204433 ) ( ON ?auto_204434 ?auto_204435 ) ( CLEAR ?auto_204434 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_204437 ?auto_204436 ?auto_204435 )
      ( MAKE-8PILE ?auto_204430 ?auto_204431 ?auto_204432 ?auto_204433 ?auto_204434 ?auto_204435 ?auto_204436 ?auto_204437 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_204438 - BLOCK
      ?auto_204439 - BLOCK
      ?auto_204440 - BLOCK
      ?auto_204441 - BLOCK
      ?auto_204442 - BLOCK
      ?auto_204443 - BLOCK
      ?auto_204444 - BLOCK
      ?auto_204445 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_204438 ) ( ON ?auto_204439 ?auto_204438 ) ( ON ?auto_204440 ?auto_204439 ) ( not ( = ?auto_204438 ?auto_204439 ) ) ( not ( = ?auto_204438 ?auto_204440 ) ) ( not ( = ?auto_204438 ?auto_204441 ) ) ( not ( = ?auto_204438 ?auto_204442 ) ) ( not ( = ?auto_204438 ?auto_204443 ) ) ( not ( = ?auto_204438 ?auto_204444 ) ) ( not ( = ?auto_204438 ?auto_204445 ) ) ( not ( = ?auto_204439 ?auto_204440 ) ) ( not ( = ?auto_204439 ?auto_204441 ) ) ( not ( = ?auto_204439 ?auto_204442 ) ) ( not ( = ?auto_204439 ?auto_204443 ) ) ( not ( = ?auto_204439 ?auto_204444 ) ) ( not ( = ?auto_204439 ?auto_204445 ) ) ( not ( = ?auto_204440 ?auto_204441 ) ) ( not ( = ?auto_204440 ?auto_204442 ) ) ( not ( = ?auto_204440 ?auto_204443 ) ) ( not ( = ?auto_204440 ?auto_204444 ) ) ( not ( = ?auto_204440 ?auto_204445 ) ) ( not ( = ?auto_204441 ?auto_204442 ) ) ( not ( = ?auto_204441 ?auto_204443 ) ) ( not ( = ?auto_204441 ?auto_204444 ) ) ( not ( = ?auto_204441 ?auto_204445 ) ) ( not ( = ?auto_204442 ?auto_204443 ) ) ( not ( = ?auto_204442 ?auto_204444 ) ) ( not ( = ?auto_204442 ?auto_204445 ) ) ( not ( = ?auto_204443 ?auto_204444 ) ) ( not ( = ?auto_204443 ?auto_204445 ) ) ( not ( = ?auto_204444 ?auto_204445 ) ) ( ON-TABLE ?auto_204445 ) ( ON ?auto_204444 ?auto_204445 ) ( ON ?auto_204443 ?auto_204444 ) ( ON ?auto_204442 ?auto_204443 ) ( CLEAR ?auto_204442 ) ( HOLDING ?auto_204441 ) ( CLEAR ?auto_204440 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_204438 ?auto_204439 ?auto_204440 ?auto_204441 )
      ( MAKE-8PILE ?auto_204438 ?auto_204439 ?auto_204440 ?auto_204441 ?auto_204442 ?auto_204443 ?auto_204444 ?auto_204445 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_204446 - BLOCK
      ?auto_204447 - BLOCK
      ?auto_204448 - BLOCK
      ?auto_204449 - BLOCK
      ?auto_204450 - BLOCK
      ?auto_204451 - BLOCK
      ?auto_204452 - BLOCK
      ?auto_204453 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_204446 ) ( ON ?auto_204447 ?auto_204446 ) ( ON ?auto_204448 ?auto_204447 ) ( not ( = ?auto_204446 ?auto_204447 ) ) ( not ( = ?auto_204446 ?auto_204448 ) ) ( not ( = ?auto_204446 ?auto_204449 ) ) ( not ( = ?auto_204446 ?auto_204450 ) ) ( not ( = ?auto_204446 ?auto_204451 ) ) ( not ( = ?auto_204446 ?auto_204452 ) ) ( not ( = ?auto_204446 ?auto_204453 ) ) ( not ( = ?auto_204447 ?auto_204448 ) ) ( not ( = ?auto_204447 ?auto_204449 ) ) ( not ( = ?auto_204447 ?auto_204450 ) ) ( not ( = ?auto_204447 ?auto_204451 ) ) ( not ( = ?auto_204447 ?auto_204452 ) ) ( not ( = ?auto_204447 ?auto_204453 ) ) ( not ( = ?auto_204448 ?auto_204449 ) ) ( not ( = ?auto_204448 ?auto_204450 ) ) ( not ( = ?auto_204448 ?auto_204451 ) ) ( not ( = ?auto_204448 ?auto_204452 ) ) ( not ( = ?auto_204448 ?auto_204453 ) ) ( not ( = ?auto_204449 ?auto_204450 ) ) ( not ( = ?auto_204449 ?auto_204451 ) ) ( not ( = ?auto_204449 ?auto_204452 ) ) ( not ( = ?auto_204449 ?auto_204453 ) ) ( not ( = ?auto_204450 ?auto_204451 ) ) ( not ( = ?auto_204450 ?auto_204452 ) ) ( not ( = ?auto_204450 ?auto_204453 ) ) ( not ( = ?auto_204451 ?auto_204452 ) ) ( not ( = ?auto_204451 ?auto_204453 ) ) ( not ( = ?auto_204452 ?auto_204453 ) ) ( ON-TABLE ?auto_204453 ) ( ON ?auto_204452 ?auto_204453 ) ( ON ?auto_204451 ?auto_204452 ) ( ON ?auto_204450 ?auto_204451 ) ( CLEAR ?auto_204448 ) ( ON ?auto_204449 ?auto_204450 ) ( CLEAR ?auto_204449 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_204453 ?auto_204452 ?auto_204451 ?auto_204450 )
      ( MAKE-8PILE ?auto_204446 ?auto_204447 ?auto_204448 ?auto_204449 ?auto_204450 ?auto_204451 ?auto_204452 ?auto_204453 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_204454 - BLOCK
      ?auto_204455 - BLOCK
      ?auto_204456 - BLOCK
      ?auto_204457 - BLOCK
      ?auto_204458 - BLOCK
      ?auto_204459 - BLOCK
      ?auto_204460 - BLOCK
      ?auto_204461 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_204454 ) ( ON ?auto_204455 ?auto_204454 ) ( not ( = ?auto_204454 ?auto_204455 ) ) ( not ( = ?auto_204454 ?auto_204456 ) ) ( not ( = ?auto_204454 ?auto_204457 ) ) ( not ( = ?auto_204454 ?auto_204458 ) ) ( not ( = ?auto_204454 ?auto_204459 ) ) ( not ( = ?auto_204454 ?auto_204460 ) ) ( not ( = ?auto_204454 ?auto_204461 ) ) ( not ( = ?auto_204455 ?auto_204456 ) ) ( not ( = ?auto_204455 ?auto_204457 ) ) ( not ( = ?auto_204455 ?auto_204458 ) ) ( not ( = ?auto_204455 ?auto_204459 ) ) ( not ( = ?auto_204455 ?auto_204460 ) ) ( not ( = ?auto_204455 ?auto_204461 ) ) ( not ( = ?auto_204456 ?auto_204457 ) ) ( not ( = ?auto_204456 ?auto_204458 ) ) ( not ( = ?auto_204456 ?auto_204459 ) ) ( not ( = ?auto_204456 ?auto_204460 ) ) ( not ( = ?auto_204456 ?auto_204461 ) ) ( not ( = ?auto_204457 ?auto_204458 ) ) ( not ( = ?auto_204457 ?auto_204459 ) ) ( not ( = ?auto_204457 ?auto_204460 ) ) ( not ( = ?auto_204457 ?auto_204461 ) ) ( not ( = ?auto_204458 ?auto_204459 ) ) ( not ( = ?auto_204458 ?auto_204460 ) ) ( not ( = ?auto_204458 ?auto_204461 ) ) ( not ( = ?auto_204459 ?auto_204460 ) ) ( not ( = ?auto_204459 ?auto_204461 ) ) ( not ( = ?auto_204460 ?auto_204461 ) ) ( ON-TABLE ?auto_204461 ) ( ON ?auto_204460 ?auto_204461 ) ( ON ?auto_204459 ?auto_204460 ) ( ON ?auto_204458 ?auto_204459 ) ( ON ?auto_204457 ?auto_204458 ) ( CLEAR ?auto_204457 ) ( HOLDING ?auto_204456 ) ( CLEAR ?auto_204455 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_204454 ?auto_204455 ?auto_204456 )
      ( MAKE-8PILE ?auto_204454 ?auto_204455 ?auto_204456 ?auto_204457 ?auto_204458 ?auto_204459 ?auto_204460 ?auto_204461 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_204462 - BLOCK
      ?auto_204463 - BLOCK
      ?auto_204464 - BLOCK
      ?auto_204465 - BLOCK
      ?auto_204466 - BLOCK
      ?auto_204467 - BLOCK
      ?auto_204468 - BLOCK
      ?auto_204469 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_204462 ) ( ON ?auto_204463 ?auto_204462 ) ( not ( = ?auto_204462 ?auto_204463 ) ) ( not ( = ?auto_204462 ?auto_204464 ) ) ( not ( = ?auto_204462 ?auto_204465 ) ) ( not ( = ?auto_204462 ?auto_204466 ) ) ( not ( = ?auto_204462 ?auto_204467 ) ) ( not ( = ?auto_204462 ?auto_204468 ) ) ( not ( = ?auto_204462 ?auto_204469 ) ) ( not ( = ?auto_204463 ?auto_204464 ) ) ( not ( = ?auto_204463 ?auto_204465 ) ) ( not ( = ?auto_204463 ?auto_204466 ) ) ( not ( = ?auto_204463 ?auto_204467 ) ) ( not ( = ?auto_204463 ?auto_204468 ) ) ( not ( = ?auto_204463 ?auto_204469 ) ) ( not ( = ?auto_204464 ?auto_204465 ) ) ( not ( = ?auto_204464 ?auto_204466 ) ) ( not ( = ?auto_204464 ?auto_204467 ) ) ( not ( = ?auto_204464 ?auto_204468 ) ) ( not ( = ?auto_204464 ?auto_204469 ) ) ( not ( = ?auto_204465 ?auto_204466 ) ) ( not ( = ?auto_204465 ?auto_204467 ) ) ( not ( = ?auto_204465 ?auto_204468 ) ) ( not ( = ?auto_204465 ?auto_204469 ) ) ( not ( = ?auto_204466 ?auto_204467 ) ) ( not ( = ?auto_204466 ?auto_204468 ) ) ( not ( = ?auto_204466 ?auto_204469 ) ) ( not ( = ?auto_204467 ?auto_204468 ) ) ( not ( = ?auto_204467 ?auto_204469 ) ) ( not ( = ?auto_204468 ?auto_204469 ) ) ( ON-TABLE ?auto_204469 ) ( ON ?auto_204468 ?auto_204469 ) ( ON ?auto_204467 ?auto_204468 ) ( ON ?auto_204466 ?auto_204467 ) ( ON ?auto_204465 ?auto_204466 ) ( CLEAR ?auto_204463 ) ( ON ?auto_204464 ?auto_204465 ) ( CLEAR ?auto_204464 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_204469 ?auto_204468 ?auto_204467 ?auto_204466 ?auto_204465 )
      ( MAKE-8PILE ?auto_204462 ?auto_204463 ?auto_204464 ?auto_204465 ?auto_204466 ?auto_204467 ?auto_204468 ?auto_204469 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_204470 - BLOCK
      ?auto_204471 - BLOCK
      ?auto_204472 - BLOCK
      ?auto_204473 - BLOCK
      ?auto_204474 - BLOCK
      ?auto_204475 - BLOCK
      ?auto_204476 - BLOCK
      ?auto_204477 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_204470 ) ( not ( = ?auto_204470 ?auto_204471 ) ) ( not ( = ?auto_204470 ?auto_204472 ) ) ( not ( = ?auto_204470 ?auto_204473 ) ) ( not ( = ?auto_204470 ?auto_204474 ) ) ( not ( = ?auto_204470 ?auto_204475 ) ) ( not ( = ?auto_204470 ?auto_204476 ) ) ( not ( = ?auto_204470 ?auto_204477 ) ) ( not ( = ?auto_204471 ?auto_204472 ) ) ( not ( = ?auto_204471 ?auto_204473 ) ) ( not ( = ?auto_204471 ?auto_204474 ) ) ( not ( = ?auto_204471 ?auto_204475 ) ) ( not ( = ?auto_204471 ?auto_204476 ) ) ( not ( = ?auto_204471 ?auto_204477 ) ) ( not ( = ?auto_204472 ?auto_204473 ) ) ( not ( = ?auto_204472 ?auto_204474 ) ) ( not ( = ?auto_204472 ?auto_204475 ) ) ( not ( = ?auto_204472 ?auto_204476 ) ) ( not ( = ?auto_204472 ?auto_204477 ) ) ( not ( = ?auto_204473 ?auto_204474 ) ) ( not ( = ?auto_204473 ?auto_204475 ) ) ( not ( = ?auto_204473 ?auto_204476 ) ) ( not ( = ?auto_204473 ?auto_204477 ) ) ( not ( = ?auto_204474 ?auto_204475 ) ) ( not ( = ?auto_204474 ?auto_204476 ) ) ( not ( = ?auto_204474 ?auto_204477 ) ) ( not ( = ?auto_204475 ?auto_204476 ) ) ( not ( = ?auto_204475 ?auto_204477 ) ) ( not ( = ?auto_204476 ?auto_204477 ) ) ( ON-TABLE ?auto_204477 ) ( ON ?auto_204476 ?auto_204477 ) ( ON ?auto_204475 ?auto_204476 ) ( ON ?auto_204474 ?auto_204475 ) ( ON ?auto_204473 ?auto_204474 ) ( ON ?auto_204472 ?auto_204473 ) ( CLEAR ?auto_204472 ) ( HOLDING ?auto_204471 ) ( CLEAR ?auto_204470 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_204470 ?auto_204471 )
      ( MAKE-8PILE ?auto_204470 ?auto_204471 ?auto_204472 ?auto_204473 ?auto_204474 ?auto_204475 ?auto_204476 ?auto_204477 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_204478 - BLOCK
      ?auto_204479 - BLOCK
      ?auto_204480 - BLOCK
      ?auto_204481 - BLOCK
      ?auto_204482 - BLOCK
      ?auto_204483 - BLOCK
      ?auto_204484 - BLOCK
      ?auto_204485 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_204478 ) ( not ( = ?auto_204478 ?auto_204479 ) ) ( not ( = ?auto_204478 ?auto_204480 ) ) ( not ( = ?auto_204478 ?auto_204481 ) ) ( not ( = ?auto_204478 ?auto_204482 ) ) ( not ( = ?auto_204478 ?auto_204483 ) ) ( not ( = ?auto_204478 ?auto_204484 ) ) ( not ( = ?auto_204478 ?auto_204485 ) ) ( not ( = ?auto_204479 ?auto_204480 ) ) ( not ( = ?auto_204479 ?auto_204481 ) ) ( not ( = ?auto_204479 ?auto_204482 ) ) ( not ( = ?auto_204479 ?auto_204483 ) ) ( not ( = ?auto_204479 ?auto_204484 ) ) ( not ( = ?auto_204479 ?auto_204485 ) ) ( not ( = ?auto_204480 ?auto_204481 ) ) ( not ( = ?auto_204480 ?auto_204482 ) ) ( not ( = ?auto_204480 ?auto_204483 ) ) ( not ( = ?auto_204480 ?auto_204484 ) ) ( not ( = ?auto_204480 ?auto_204485 ) ) ( not ( = ?auto_204481 ?auto_204482 ) ) ( not ( = ?auto_204481 ?auto_204483 ) ) ( not ( = ?auto_204481 ?auto_204484 ) ) ( not ( = ?auto_204481 ?auto_204485 ) ) ( not ( = ?auto_204482 ?auto_204483 ) ) ( not ( = ?auto_204482 ?auto_204484 ) ) ( not ( = ?auto_204482 ?auto_204485 ) ) ( not ( = ?auto_204483 ?auto_204484 ) ) ( not ( = ?auto_204483 ?auto_204485 ) ) ( not ( = ?auto_204484 ?auto_204485 ) ) ( ON-TABLE ?auto_204485 ) ( ON ?auto_204484 ?auto_204485 ) ( ON ?auto_204483 ?auto_204484 ) ( ON ?auto_204482 ?auto_204483 ) ( ON ?auto_204481 ?auto_204482 ) ( ON ?auto_204480 ?auto_204481 ) ( CLEAR ?auto_204478 ) ( ON ?auto_204479 ?auto_204480 ) ( CLEAR ?auto_204479 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_204485 ?auto_204484 ?auto_204483 ?auto_204482 ?auto_204481 ?auto_204480 )
      ( MAKE-8PILE ?auto_204478 ?auto_204479 ?auto_204480 ?auto_204481 ?auto_204482 ?auto_204483 ?auto_204484 ?auto_204485 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_204486 - BLOCK
      ?auto_204487 - BLOCK
      ?auto_204488 - BLOCK
      ?auto_204489 - BLOCK
      ?auto_204490 - BLOCK
      ?auto_204491 - BLOCK
      ?auto_204492 - BLOCK
      ?auto_204493 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_204486 ?auto_204487 ) ) ( not ( = ?auto_204486 ?auto_204488 ) ) ( not ( = ?auto_204486 ?auto_204489 ) ) ( not ( = ?auto_204486 ?auto_204490 ) ) ( not ( = ?auto_204486 ?auto_204491 ) ) ( not ( = ?auto_204486 ?auto_204492 ) ) ( not ( = ?auto_204486 ?auto_204493 ) ) ( not ( = ?auto_204487 ?auto_204488 ) ) ( not ( = ?auto_204487 ?auto_204489 ) ) ( not ( = ?auto_204487 ?auto_204490 ) ) ( not ( = ?auto_204487 ?auto_204491 ) ) ( not ( = ?auto_204487 ?auto_204492 ) ) ( not ( = ?auto_204487 ?auto_204493 ) ) ( not ( = ?auto_204488 ?auto_204489 ) ) ( not ( = ?auto_204488 ?auto_204490 ) ) ( not ( = ?auto_204488 ?auto_204491 ) ) ( not ( = ?auto_204488 ?auto_204492 ) ) ( not ( = ?auto_204488 ?auto_204493 ) ) ( not ( = ?auto_204489 ?auto_204490 ) ) ( not ( = ?auto_204489 ?auto_204491 ) ) ( not ( = ?auto_204489 ?auto_204492 ) ) ( not ( = ?auto_204489 ?auto_204493 ) ) ( not ( = ?auto_204490 ?auto_204491 ) ) ( not ( = ?auto_204490 ?auto_204492 ) ) ( not ( = ?auto_204490 ?auto_204493 ) ) ( not ( = ?auto_204491 ?auto_204492 ) ) ( not ( = ?auto_204491 ?auto_204493 ) ) ( not ( = ?auto_204492 ?auto_204493 ) ) ( ON-TABLE ?auto_204493 ) ( ON ?auto_204492 ?auto_204493 ) ( ON ?auto_204491 ?auto_204492 ) ( ON ?auto_204490 ?auto_204491 ) ( ON ?auto_204489 ?auto_204490 ) ( ON ?auto_204488 ?auto_204489 ) ( ON ?auto_204487 ?auto_204488 ) ( CLEAR ?auto_204487 ) ( HOLDING ?auto_204486 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_204486 )
      ( MAKE-8PILE ?auto_204486 ?auto_204487 ?auto_204488 ?auto_204489 ?auto_204490 ?auto_204491 ?auto_204492 ?auto_204493 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_204494 - BLOCK
      ?auto_204495 - BLOCK
      ?auto_204496 - BLOCK
      ?auto_204497 - BLOCK
      ?auto_204498 - BLOCK
      ?auto_204499 - BLOCK
      ?auto_204500 - BLOCK
      ?auto_204501 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_204494 ?auto_204495 ) ) ( not ( = ?auto_204494 ?auto_204496 ) ) ( not ( = ?auto_204494 ?auto_204497 ) ) ( not ( = ?auto_204494 ?auto_204498 ) ) ( not ( = ?auto_204494 ?auto_204499 ) ) ( not ( = ?auto_204494 ?auto_204500 ) ) ( not ( = ?auto_204494 ?auto_204501 ) ) ( not ( = ?auto_204495 ?auto_204496 ) ) ( not ( = ?auto_204495 ?auto_204497 ) ) ( not ( = ?auto_204495 ?auto_204498 ) ) ( not ( = ?auto_204495 ?auto_204499 ) ) ( not ( = ?auto_204495 ?auto_204500 ) ) ( not ( = ?auto_204495 ?auto_204501 ) ) ( not ( = ?auto_204496 ?auto_204497 ) ) ( not ( = ?auto_204496 ?auto_204498 ) ) ( not ( = ?auto_204496 ?auto_204499 ) ) ( not ( = ?auto_204496 ?auto_204500 ) ) ( not ( = ?auto_204496 ?auto_204501 ) ) ( not ( = ?auto_204497 ?auto_204498 ) ) ( not ( = ?auto_204497 ?auto_204499 ) ) ( not ( = ?auto_204497 ?auto_204500 ) ) ( not ( = ?auto_204497 ?auto_204501 ) ) ( not ( = ?auto_204498 ?auto_204499 ) ) ( not ( = ?auto_204498 ?auto_204500 ) ) ( not ( = ?auto_204498 ?auto_204501 ) ) ( not ( = ?auto_204499 ?auto_204500 ) ) ( not ( = ?auto_204499 ?auto_204501 ) ) ( not ( = ?auto_204500 ?auto_204501 ) ) ( ON-TABLE ?auto_204501 ) ( ON ?auto_204500 ?auto_204501 ) ( ON ?auto_204499 ?auto_204500 ) ( ON ?auto_204498 ?auto_204499 ) ( ON ?auto_204497 ?auto_204498 ) ( ON ?auto_204496 ?auto_204497 ) ( ON ?auto_204495 ?auto_204496 ) ( ON ?auto_204494 ?auto_204495 ) ( CLEAR ?auto_204494 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_204501 ?auto_204500 ?auto_204499 ?auto_204498 ?auto_204497 ?auto_204496 ?auto_204495 )
      ( MAKE-8PILE ?auto_204494 ?auto_204495 ?auto_204496 ?auto_204497 ?auto_204498 ?auto_204499 ?auto_204500 ?auto_204501 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_204502 - BLOCK
      ?auto_204503 - BLOCK
      ?auto_204504 - BLOCK
      ?auto_204505 - BLOCK
      ?auto_204506 - BLOCK
      ?auto_204507 - BLOCK
      ?auto_204508 - BLOCK
      ?auto_204509 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_204502 ?auto_204503 ) ) ( not ( = ?auto_204502 ?auto_204504 ) ) ( not ( = ?auto_204502 ?auto_204505 ) ) ( not ( = ?auto_204502 ?auto_204506 ) ) ( not ( = ?auto_204502 ?auto_204507 ) ) ( not ( = ?auto_204502 ?auto_204508 ) ) ( not ( = ?auto_204502 ?auto_204509 ) ) ( not ( = ?auto_204503 ?auto_204504 ) ) ( not ( = ?auto_204503 ?auto_204505 ) ) ( not ( = ?auto_204503 ?auto_204506 ) ) ( not ( = ?auto_204503 ?auto_204507 ) ) ( not ( = ?auto_204503 ?auto_204508 ) ) ( not ( = ?auto_204503 ?auto_204509 ) ) ( not ( = ?auto_204504 ?auto_204505 ) ) ( not ( = ?auto_204504 ?auto_204506 ) ) ( not ( = ?auto_204504 ?auto_204507 ) ) ( not ( = ?auto_204504 ?auto_204508 ) ) ( not ( = ?auto_204504 ?auto_204509 ) ) ( not ( = ?auto_204505 ?auto_204506 ) ) ( not ( = ?auto_204505 ?auto_204507 ) ) ( not ( = ?auto_204505 ?auto_204508 ) ) ( not ( = ?auto_204505 ?auto_204509 ) ) ( not ( = ?auto_204506 ?auto_204507 ) ) ( not ( = ?auto_204506 ?auto_204508 ) ) ( not ( = ?auto_204506 ?auto_204509 ) ) ( not ( = ?auto_204507 ?auto_204508 ) ) ( not ( = ?auto_204507 ?auto_204509 ) ) ( not ( = ?auto_204508 ?auto_204509 ) ) ( ON-TABLE ?auto_204509 ) ( ON ?auto_204508 ?auto_204509 ) ( ON ?auto_204507 ?auto_204508 ) ( ON ?auto_204506 ?auto_204507 ) ( ON ?auto_204505 ?auto_204506 ) ( ON ?auto_204504 ?auto_204505 ) ( ON ?auto_204503 ?auto_204504 ) ( HOLDING ?auto_204502 ) ( CLEAR ?auto_204503 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_204509 ?auto_204508 ?auto_204507 ?auto_204506 ?auto_204505 ?auto_204504 ?auto_204503 ?auto_204502 )
      ( MAKE-8PILE ?auto_204502 ?auto_204503 ?auto_204504 ?auto_204505 ?auto_204506 ?auto_204507 ?auto_204508 ?auto_204509 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_204510 - BLOCK
      ?auto_204511 - BLOCK
      ?auto_204512 - BLOCK
      ?auto_204513 - BLOCK
      ?auto_204514 - BLOCK
      ?auto_204515 - BLOCK
      ?auto_204516 - BLOCK
      ?auto_204517 - BLOCK
    )
    :vars
    (
      ?auto_204518 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_204510 ?auto_204511 ) ) ( not ( = ?auto_204510 ?auto_204512 ) ) ( not ( = ?auto_204510 ?auto_204513 ) ) ( not ( = ?auto_204510 ?auto_204514 ) ) ( not ( = ?auto_204510 ?auto_204515 ) ) ( not ( = ?auto_204510 ?auto_204516 ) ) ( not ( = ?auto_204510 ?auto_204517 ) ) ( not ( = ?auto_204511 ?auto_204512 ) ) ( not ( = ?auto_204511 ?auto_204513 ) ) ( not ( = ?auto_204511 ?auto_204514 ) ) ( not ( = ?auto_204511 ?auto_204515 ) ) ( not ( = ?auto_204511 ?auto_204516 ) ) ( not ( = ?auto_204511 ?auto_204517 ) ) ( not ( = ?auto_204512 ?auto_204513 ) ) ( not ( = ?auto_204512 ?auto_204514 ) ) ( not ( = ?auto_204512 ?auto_204515 ) ) ( not ( = ?auto_204512 ?auto_204516 ) ) ( not ( = ?auto_204512 ?auto_204517 ) ) ( not ( = ?auto_204513 ?auto_204514 ) ) ( not ( = ?auto_204513 ?auto_204515 ) ) ( not ( = ?auto_204513 ?auto_204516 ) ) ( not ( = ?auto_204513 ?auto_204517 ) ) ( not ( = ?auto_204514 ?auto_204515 ) ) ( not ( = ?auto_204514 ?auto_204516 ) ) ( not ( = ?auto_204514 ?auto_204517 ) ) ( not ( = ?auto_204515 ?auto_204516 ) ) ( not ( = ?auto_204515 ?auto_204517 ) ) ( not ( = ?auto_204516 ?auto_204517 ) ) ( ON-TABLE ?auto_204517 ) ( ON ?auto_204516 ?auto_204517 ) ( ON ?auto_204515 ?auto_204516 ) ( ON ?auto_204514 ?auto_204515 ) ( ON ?auto_204513 ?auto_204514 ) ( ON ?auto_204512 ?auto_204513 ) ( ON ?auto_204511 ?auto_204512 ) ( CLEAR ?auto_204511 ) ( ON ?auto_204510 ?auto_204518 ) ( CLEAR ?auto_204510 ) ( HAND-EMPTY ) ( not ( = ?auto_204510 ?auto_204518 ) ) ( not ( = ?auto_204511 ?auto_204518 ) ) ( not ( = ?auto_204512 ?auto_204518 ) ) ( not ( = ?auto_204513 ?auto_204518 ) ) ( not ( = ?auto_204514 ?auto_204518 ) ) ( not ( = ?auto_204515 ?auto_204518 ) ) ( not ( = ?auto_204516 ?auto_204518 ) ) ( not ( = ?auto_204517 ?auto_204518 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_204510 ?auto_204518 )
      ( MAKE-8PILE ?auto_204510 ?auto_204511 ?auto_204512 ?auto_204513 ?auto_204514 ?auto_204515 ?auto_204516 ?auto_204517 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_204519 - BLOCK
      ?auto_204520 - BLOCK
      ?auto_204521 - BLOCK
      ?auto_204522 - BLOCK
      ?auto_204523 - BLOCK
      ?auto_204524 - BLOCK
      ?auto_204525 - BLOCK
      ?auto_204526 - BLOCK
    )
    :vars
    (
      ?auto_204527 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_204519 ?auto_204520 ) ) ( not ( = ?auto_204519 ?auto_204521 ) ) ( not ( = ?auto_204519 ?auto_204522 ) ) ( not ( = ?auto_204519 ?auto_204523 ) ) ( not ( = ?auto_204519 ?auto_204524 ) ) ( not ( = ?auto_204519 ?auto_204525 ) ) ( not ( = ?auto_204519 ?auto_204526 ) ) ( not ( = ?auto_204520 ?auto_204521 ) ) ( not ( = ?auto_204520 ?auto_204522 ) ) ( not ( = ?auto_204520 ?auto_204523 ) ) ( not ( = ?auto_204520 ?auto_204524 ) ) ( not ( = ?auto_204520 ?auto_204525 ) ) ( not ( = ?auto_204520 ?auto_204526 ) ) ( not ( = ?auto_204521 ?auto_204522 ) ) ( not ( = ?auto_204521 ?auto_204523 ) ) ( not ( = ?auto_204521 ?auto_204524 ) ) ( not ( = ?auto_204521 ?auto_204525 ) ) ( not ( = ?auto_204521 ?auto_204526 ) ) ( not ( = ?auto_204522 ?auto_204523 ) ) ( not ( = ?auto_204522 ?auto_204524 ) ) ( not ( = ?auto_204522 ?auto_204525 ) ) ( not ( = ?auto_204522 ?auto_204526 ) ) ( not ( = ?auto_204523 ?auto_204524 ) ) ( not ( = ?auto_204523 ?auto_204525 ) ) ( not ( = ?auto_204523 ?auto_204526 ) ) ( not ( = ?auto_204524 ?auto_204525 ) ) ( not ( = ?auto_204524 ?auto_204526 ) ) ( not ( = ?auto_204525 ?auto_204526 ) ) ( ON-TABLE ?auto_204526 ) ( ON ?auto_204525 ?auto_204526 ) ( ON ?auto_204524 ?auto_204525 ) ( ON ?auto_204523 ?auto_204524 ) ( ON ?auto_204522 ?auto_204523 ) ( ON ?auto_204521 ?auto_204522 ) ( ON ?auto_204519 ?auto_204527 ) ( CLEAR ?auto_204519 ) ( not ( = ?auto_204519 ?auto_204527 ) ) ( not ( = ?auto_204520 ?auto_204527 ) ) ( not ( = ?auto_204521 ?auto_204527 ) ) ( not ( = ?auto_204522 ?auto_204527 ) ) ( not ( = ?auto_204523 ?auto_204527 ) ) ( not ( = ?auto_204524 ?auto_204527 ) ) ( not ( = ?auto_204525 ?auto_204527 ) ) ( not ( = ?auto_204526 ?auto_204527 ) ) ( HOLDING ?auto_204520 ) ( CLEAR ?auto_204521 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_204526 ?auto_204525 ?auto_204524 ?auto_204523 ?auto_204522 ?auto_204521 ?auto_204520 )
      ( MAKE-8PILE ?auto_204519 ?auto_204520 ?auto_204521 ?auto_204522 ?auto_204523 ?auto_204524 ?auto_204525 ?auto_204526 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_204528 - BLOCK
      ?auto_204529 - BLOCK
      ?auto_204530 - BLOCK
      ?auto_204531 - BLOCK
      ?auto_204532 - BLOCK
      ?auto_204533 - BLOCK
      ?auto_204534 - BLOCK
      ?auto_204535 - BLOCK
    )
    :vars
    (
      ?auto_204536 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_204528 ?auto_204529 ) ) ( not ( = ?auto_204528 ?auto_204530 ) ) ( not ( = ?auto_204528 ?auto_204531 ) ) ( not ( = ?auto_204528 ?auto_204532 ) ) ( not ( = ?auto_204528 ?auto_204533 ) ) ( not ( = ?auto_204528 ?auto_204534 ) ) ( not ( = ?auto_204528 ?auto_204535 ) ) ( not ( = ?auto_204529 ?auto_204530 ) ) ( not ( = ?auto_204529 ?auto_204531 ) ) ( not ( = ?auto_204529 ?auto_204532 ) ) ( not ( = ?auto_204529 ?auto_204533 ) ) ( not ( = ?auto_204529 ?auto_204534 ) ) ( not ( = ?auto_204529 ?auto_204535 ) ) ( not ( = ?auto_204530 ?auto_204531 ) ) ( not ( = ?auto_204530 ?auto_204532 ) ) ( not ( = ?auto_204530 ?auto_204533 ) ) ( not ( = ?auto_204530 ?auto_204534 ) ) ( not ( = ?auto_204530 ?auto_204535 ) ) ( not ( = ?auto_204531 ?auto_204532 ) ) ( not ( = ?auto_204531 ?auto_204533 ) ) ( not ( = ?auto_204531 ?auto_204534 ) ) ( not ( = ?auto_204531 ?auto_204535 ) ) ( not ( = ?auto_204532 ?auto_204533 ) ) ( not ( = ?auto_204532 ?auto_204534 ) ) ( not ( = ?auto_204532 ?auto_204535 ) ) ( not ( = ?auto_204533 ?auto_204534 ) ) ( not ( = ?auto_204533 ?auto_204535 ) ) ( not ( = ?auto_204534 ?auto_204535 ) ) ( ON-TABLE ?auto_204535 ) ( ON ?auto_204534 ?auto_204535 ) ( ON ?auto_204533 ?auto_204534 ) ( ON ?auto_204532 ?auto_204533 ) ( ON ?auto_204531 ?auto_204532 ) ( ON ?auto_204530 ?auto_204531 ) ( ON ?auto_204528 ?auto_204536 ) ( not ( = ?auto_204528 ?auto_204536 ) ) ( not ( = ?auto_204529 ?auto_204536 ) ) ( not ( = ?auto_204530 ?auto_204536 ) ) ( not ( = ?auto_204531 ?auto_204536 ) ) ( not ( = ?auto_204532 ?auto_204536 ) ) ( not ( = ?auto_204533 ?auto_204536 ) ) ( not ( = ?auto_204534 ?auto_204536 ) ) ( not ( = ?auto_204535 ?auto_204536 ) ) ( CLEAR ?auto_204530 ) ( ON ?auto_204529 ?auto_204528 ) ( CLEAR ?auto_204529 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_204536 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_204536 ?auto_204528 )
      ( MAKE-8PILE ?auto_204528 ?auto_204529 ?auto_204530 ?auto_204531 ?auto_204532 ?auto_204533 ?auto_204534 ?auto_204535 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_204537 - BLOCK
      ?auto_204538 - BLOCK
      ?auto_204539 - BLOCK
      ?auto_204540 - BLOCK
      ?auto_204541 - BLOCK
      ?auto_204542 - BLOCK
      ?auto_204543 - BLOCK
      ?auto_204544 - BLOCK
    )
    :vars
    (
      ?auto_204545 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_204537 ?auto_204538 ) ) ( not ( = ?auto_204537 ?auto_204539 ) ) ( not ( = ?auto_204537 ?auto_204540 ) ) ( not ( = ?auto_204537 ?auto_204541 ) ) ( not ( = ?auto_204537 ?auto_204542 ) ) ( not ( = ?auto_204537 ?auto_204543 ) ) ( not ( = ?auto_204537 ?auto_204544 ) ) ( not ( = ?auto_204538 ?auto_204539 ) ) ( not ( = ?auto_204538 ?auto_204540 ) ) ( not ( = ?auto_204538 ?auto_204541 ) ) ( not ( = ?auto_204538 ?auto_204542 ) ) ( not ( = ?auto_204538 ?auto_204543 ) ) ( not ( = ?auto_204538 ?auto_204544 ) ) ( not ( = ?auto_204539 ?auto_204540 ) ) ( not ( = ?auto_204539 ?auto_204541 ) ) ( not ( = ?auto_204539 ?auto_204542 ) ) ( not ( = ?auto_204539 ?auto_204543 ) ) ( not ( = ?auto_204539 ?auto_204544 ) ) ( not ( = ?auto_204540 ?auto_204541 ) ) ( not ( = ?auto_204540 ?auto_204542 ) ) ( not ( = ?auto_204540 ?auto_204543 ) ) ( not ( = ?auto_204540 ?auto_204544 ) ) ( not ( = ?auto_204541 ?auto_204542 ) ) ( not ( = ?auto_204541 ?auto_204543 ) ) ( not ( = ?auto_204541 ?auto_204544 ) ) ( not ( = ?auto_204542 ?auto_204543 ) ) ( not ( = ?auto_204542 ?auto_204544 ) ) ( not ( = ?auto_204543 ?auto_204544 ) ) ( ON-TABLE ?auto_204544 ) ( ON ?auto_204543 ?auto_204544 ) ( ON ?auto_204542 ?auto_204543 ) ( ON ?auto_204541 ?auto_204542 ) ( ON ?auto_204540 ?auto_204541 ) ( ON ?auto_204537 ?auto_204545 ) ( not ( = ?auto_204537 ?auto_204545 ) ) ( not ( = ?auto_204538 ?auto_204545 ) ) ( not ( = ?auto_204539 ?auto_204545 ) ) ( not ( = ?auto_204540 ?auto_204545 ) ) ( not ( = ?auto_204541 ?auto_204545 ) ) ( not ( = ?auto_204542 ?auto_204545 ) ) ( not ( = ?auto_204543 ?auto_204545 ) ) ( not ( = ?auto_204544 ?auto_204545 ) ) ( ON ?auto_204538 ?auto_204537 ) ( CLEAR ?auto_204538 ) ( ON-TABLE ?auto_204545 ) ( HOLDING ?auto_204539 ) ( CLEAR ?auto_204540 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_204544 ?auto_204543 ?auto_204542 ?auto_204541 ?auto_204540 ?auto_204539 )
      ( MAKE-8PILE ?auto_204537 ?auto_204538 ?auto_204539 ?auto_204540 ?auto_204541 ?auto_204542 ?auto_204543 ?auto_204544 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_204546 - BLOCK
      ?auto_204547 - BLOCK
      ?auto_204548 - BLOCK
      ?auto_204549 - BLOCK
      ?auto_204550 - BLOCK
      ?auto_204551 - BLOCK
      ?auto_204552 - BLOCK
      ?auto_204553 - BLOCK
    )
    :vars
    (
      ?auto_204554 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_204546 ?auto_204547 ) ) ( not ( = ?auto_204546 ?auto_204548 ) ) ( not ( = ?auto_204546 ?auto_204549 ) ) ( not ( = ?auto_204546 ?auto_204550 ) ) ( not ( = ?auto_204546 ?auto_204551 ) ) ( not ( = ?auto_204546 ?auto_204552 ) ) ( not ( = ?auto_204546 ?auto_204553 ) ) ( not ( = ?auto_204547 ?auto_204548 ) ) ( not ( = ?auto_204547 ?auto_204549 ) ) ( not ( = ?auto_204547 ?auto_204550 ) ) ( not ( = ?auto_204547 ?auto_204551 ) ) ( not ( = ?auto_204547 ?auto_204552 ) ) ( not ( = ?auto_204547 ?auto_204553 ) ) ( not ( = ?auto_204548 ?auto_204549 ) ) ( not ( = ?auto_204548 ?auto_204550 ) ) ( not ( = ?auto_204548 ?auto_204551 ) ) ( not ( = ?auto_204548 ?auto_204552 ) ) ( not ( = ?auto_204548 ?auto_204553 ) ) ( not ( = ?auto_204549 ?auto_204550 ) ) ( not ( = ?auto_204549 ?auto_204551 ) ) ( not ( = ?auto_204549 ?auto_204552 ) ) ( not ( = ?auto_204549 ?auto_204553 ) ) ( not ( = ?auto_204550 ?auto_204551 ) ) ( not ( = ?auto_204550 ?auto_204552 ) ) ( not ( = ?auto_204550 ?auto_204553 ) ) ( not ( = ?auto_204551 ?auto_204552 ) ) ( not ( = ?auto_204551 ?auto_204553 ) ) ( not ( = ?auto_204552 ?auto_204553 ) ) ( ON-TABLE ?auto_204553 ) ( ON ?auto_204552 ?auto_204553 ) ( ON ?auto_204551 ?auto_204552 ) ( ON ?auto_204550 ?auto_204551 ) ( ON ?auto_204549 ?auto_204550 ) ( ON ?auto_204546 ?auto_204554 ) ( not ( = ?auto_204546 ?auto_204554 ) ) ( not ( = ?auto_204547 ?auto_204554 ) ) ( not ( = ?auto_204548 ?auto_204554 ) ) ( not ( = ?auto_204549 ?auto_204554 ) ) ( not ( = ?auto_204550 ?auto_204554 ) ) ( not ( = ?auto_204551 ?auto_204554 ) ) ( not ( = ?auto_204552 ?auto_204554 ) ) ( not ( = ?auto_204553 ?auto_204554 ) ) ( ON ?auto_204547 ?auto_204546 ) ( ON-TABLE ?auto_204554 ) ( CLEAR ?auto_204549 ) ( ON ?auto_204548 ?auto_204547 ) ( CLEAR ?auto_204548 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_204554 ?auto_204546 ?auto_204547 )
      ( MAKE-8PILE ?auto_204546 ?auto_204547 ?auto_204548 ?auto_204549 ?auto_204550 ?auto_204551 ?auto_204552 ?auto_204553 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_204555 - BLOCK
      ?auto_204556 - BLOCK
      ?auto_204557 - BLOCK
      ?auto_204558 - BLOCK
      ?auto_204559 - BLOCK
      ?auto_204560 - BLOCK
      ?auto_204561 - BLOCK
      ?auto_204562 - BLOCK
    )
    :vars
    (
      ?auto_204563 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_204555 ?auto_204556 ) ) ( not ( = ?auto_204555 ?auto_204557 ) ) ( not ( = ?auto_204555 ?auto_204558 ) ) ( not ( = ?auto_204555 ?auto_204559 ) ) ( not ( = ?auto_204555 ?auto_204560 ) ) ( not ( = ?auto_204555 ?auto_204561 ) ) ( not ( = ?auto_204555 ?auto_204562 ) ) ( not ( = ?auto_204556 ?auto_204557 ) ) ( not ( = ?auto_204556 ?auto_204558 ) ) ( not ( = ?auto_204556 ?auto_204559 ) ) ( not ( = ?auto_204556 ?auto_204560 ) ) ( not ( = ?auto_204556 ?auto_204561 ) ) ( not ( = ?auto_204556 ?auto_204562 ) ) ( not ( = ?auto_204557 ?auto_204558 ) ) ( not ( = ?auto_204557 ?auto_204559 ) ) ( not ( = ?auto_204557 ?auto_204560 ) ) ( not ( = ?auto_204557 ?auto_204561 ) ) ( not ( = ?auto_204557 ?auto_204562 ) ) ( not ( = ?auto_204558 ?auto_204559 ) ) ( not ( = ?auto_204558 ?auto_204560 ) ) ( not ( = ?auto_204558 ?auto_204561 ) ) ( not ( = ?auto_204558 ?auto_204562 ) ) ( not ( = ?auto_204559 ?auto_204560 ) ) ( not ( = ?auto_204559 ?auto_204561 ) ) ( not ( = ?auto_204559 ?auto_204562 ) ) ( not ( = ?auto_204560 ?auto_204561 ) ) ( not ( = ?auto_204560 ?auto_204562 ) ) ( not ( = ?auto_204561 ?auto_204562 ) ) ( ON-TABLE ?auto_204562 ) ( ON ?auto_204561 ?auto_204562 ) ( ON ?auto_204560 ?auto_204561 ) ( ON ?auto_204559 ?auto_204560 ) ( ON ?auto_204555 ?auto_204563 ) ( not ( = ?auto_204555 ?auto_204563 ) ) ( not ( = ?auto_204556 ?auto_204563 ) ) ( not ( = ?auto_204557 ?auto_204563 ) ) ( not ( = ?auto_204558 ?auto_204563 ) ) ( not ( = ?auto_204559 ?auto_204563 ) ) ( not ( = ?auto_204560 ?auto_204563 ) ) ( not ( = ?auto_204561 ?auto_204563 ) ) ( not ( = ?auto_204562 ?auto_204563 ) ) ( ON ?auto_204556 ?auto_204555 ) ( ON-TABLE ?auto_204563 ) ( ON ?auto_204557 ?auto_204556 ) ( CLEAR ?auto_204557 ) ( HOLDING ?auto_204558 ) ( CLEAR ?auto_204559 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_204562 ?auto_204561 ?auto_204560 ?auto_204559 ?auto_204558 )
      ( MAKE-8PILE ?auto_204555 ?auto_204556 ?auto_204557 ?auto_204558 ?auto_204559 ?auto_204560 ?auto_204561 ?auto_204562 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_204564 - BLOCK
      ?auto_204565 - BLOCK
      ?auto_204566 - BLOCK
      ?auto_204567 - BLOCK
      ?auto_204568 - BLOCK
      ?auto_204569 - BLOCK
      ?auto_204570 - BLOCK
      ?auto_204571 - BLOCK
    )
    :vars
    (
      ?auto_204572 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_204564 ?auto_204565 ) ) ( not ( = ?auto_204564 ?auto_204566 ) ) ( not ( = ?auto_204564 ?auto_204567 ) ) ( not ( = ?auto_204564 ?auto_204568 ) ) ( not ( = ?auto_204564 ?auto_204569 ) ) ( not ( = ?auto_204564 ?auto_204570 ) ) ( not ( = ?auto_204564 ?auto_204571 ) ) ( not ( = ?auto_204565 ?auto_204566 ) ) ( not ( = ?auto_204565 ?auto_204567 ) ) ( not ( = ?auto_204565 ?auto_204568 ) ) ( not ( = ?auto_204565 ?auto_204569 ) ) ( not ( = ?auto_204565 ?auto_204570 ) ) ( not ( = ?auto_204565 ?auto_204571 ) ) ( not ( = ?auto_204566 ?auto_204567 ) ) ( not ( = ?auto_204566 ?auto_204568 ) ) ( not ( = ?auto_204566 ?auto_204569 ) ) ( not ( = ?auto_204566 ?auto_204570 ) ) ( not ( = ?auto_204566 ?auto_204571 ) ) ( not ( = ?auto_204567 ?auto_204568 ) ) ( not ( = ?auto_204567 ?auto_204569 ) ) ( not ( = ?auto_204567 ?auto_204570 ) ) ( not ( = ?auto_204567 ?auto_204571 ) ) ( not ( = ?auto_204568 ?auto_204569 ) ) ( not ( = ?auto_204568 ?auto_204570 ) ) ( not ( = ?auto_204568 ?auto_204571 ) ) ( not ( = ?auto_204569 ?auto_204570 ) ) ( not ( = ?auto_204569 ?auto_204571 ) ) ( not ( = ?auto_204570 ?auto_204571 ) ) ( ON-TABLE ?auto_204571 ) ( ON ?auto_204570 ?auto_204571 ) ( ON ?auto_204569 ?auto_204570 ) ( ON ?auto_204568 ?auto_204569 ) ( ON ?auto_204564 ?auto_204572 ) ( not ( = ?auto_204564 ?auto_204572 ) ) ( not ( = ?auto_204565 ?auto_204572 ) ) ( not ( = ?auto_204566 ?auto_204572 ) ) ( not ( = ?auto_204567 ?auto_204572 ) ) ( not ( = ?auto_204568 ?auto_204572 ) ) ( not ( = ?auto_204569 ?auto_204572 ) ) ( not ( = ?auto_204570 ?auto_204572 ) ) ( not ( = ?auto_204571 ?auto_204572 ) ) ( ON ?auto_204565 ?auto_204564 ) ( ON-TABLE ?auto_204572 ) ( ON ?auto_204566 ?auto_204565 ) ( CLEAR ?auto_204568 ) ( ON ?auto_204567 ?auto_204566 ) ( CLEAR ?auto_204567 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_204572 ?auto_204564 ?auto_204565 ?auto_204566 )
      ( MAKE-8PILE ?auto_204564 ?auto_204565 ?auto_204566 ?auto_204567 ?auto_204568 ?auto_204569 ?auto_204570 ?auto_204571 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_204573 - BLOCK
      ?auto_204574 - BLOCK
      ?auto_204575 - BLOCK
      ?auto_204576 - BLOCK
      ?auto_204577 - BLOCK
      ?auto_204578 - BLOCK
      ?auto_204579 - BLOCK
      ?auto_204580 - BLOCK
    )
    :vars
    (
      ?auto_204581 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_204573 ?auto_204574 ) ) ( not ( = ?auto_204573 ?auto_204575 ) ) ( not ( = ?auto_204573 ?auto_204576 ) ) ( not ( = ?auto_204573 ?auto_204577 ) ) ( not ( = ?auto_204573 ?auto_204578 ) ) ( not ( = ?auto_204573 ?auto_204579 ) ) ( not ( = ?auto_204573 ?auto_204580 ) ) ( not ( = ?auto_204574 ?auto_204575 ) ) ( not ( = ?auto_204574 ?auto_204576 ) ) ( not ( = ?auto_204574 ?auto_204577 ) ) ( not ( = ?auto_204574 ?auto_204578 ) ) ( not ( = ?auto_204574 ?auto_204579 ) ) ( not ( = ?auto_204574 ?auto_204580 ) ) ( not ( = ?auto_204575 ?auto_204576 ) ) ( not ( = ?auto_204575 ?auto_204577 ) ) ( not ( = ?auto_204575 ?auto_204578 ) ) ( not ( = ?auto_204575 ?auto_204579 ) ) ( not ( = ?auto_204575 ?auto_204580 ) ) ( not ( = ?auto_204576 ?auto_204577 ) ) ( not ( = ?auto_204576 ?auto_204578 ) ) ( not ( = ?auto_204576 ?auto_204579 ) ) ( not ( = ?auto_204576 ?auto_204580 ) ) ( not ( = ?auto_204577 ?auto_204578 ) ) ( not ( = ?auto_204577 ?auto_204579 ) ) ( not ( = ?auto_204577 ?auto_204580 ) ) ( not ( = ?auto_204578 ?auto_204579 ) ) ( not ( = ?auto_204578 ?auto_204580 ) ) ( not ( = ?auto_204579 ?auto_204580 ) ) ( ON-TABLE ?auto_204580 ) ( ON ?auto_204579 ?auto_204580 ) ( ON ?auto_204578 ?auto_204579 ) ( ON ?auto_204573 ?auto_204581 ) ( not ( = ?auto_204573 ?auto_204581 ) ) ( not ( = ?auto_204574 ?auto_204581 ) ) ( not ( = ?auto_204575 ?auto_204581 ) ) ( not ( = ?auto_204576 ?auto_204581 ) ) ( not ( = ?auto_204577 ?auto_204581 ) ) ( not ( = ?auto_204578 ?auto_204581 ) ) ( not ( = ?auto_204579 ?auto_204581 ) ) ( not ( = ?auto_204580 ?auto_204581 ) ) ( ON ?auto_204574 ?auto_204573 ) ( ON-TABLE ?auto_204581 ) ( ON ?auto_204575 ?auto_204574 ) ( ON ?auto_204576 ?auto_204575 ) ( CLEAR ?auto_204576 ) ( HOLDING ?auto_204577 ) ( CLEAR ?auto_204578 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_204580 ?auto_204579 ?auto_204578 ?auto_204577 )
      ( MAKE-8PILE ?auto_204573 ?auto_204574 ?auto_204575 ?auto_204576 ?auto_204577 ?auto_204578 ?auto_204579 ?auto_204580 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_204582 - BLOCK
      ?auto_204583 - BLOCK
      ?auto_204584 - BLOCK
      ?auto_204585 - BLOCK
      ?auto_204586 - BLOCK
      ?auto_204587 - BLOCK
      ?auto_204588 - BLOCK
      ?auto_204589 - BLOCK
    )
    :vars
    (
      ?auto_204590 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_204582 ?auto_204583 ) ) ( not ( = ?auto_204582 ?auto_204584 ) ) ( not ( = ?auto_204582 ?auto_204585 ) ) ( not ( = ?auto_204582 ?auto_204586 ) ) ( not ( = ?auto_204582 ?auto_204587 ) ) ( not ( = ?auto_204582 ?auto_204588 ) ) ( not ( = ?auto_204582 ?auto_204589 ) ) ( not ( = ?auto_204583 ?auto_204584 ) ) ( not ( = ?auto_204583 ?auto_204585 ) ) ( not ( = ?auto_204583 ?auto_204586 ) ) ( not ( = ?auto_204583 ?auto_204587 ) ) ( not ( = ?auto_204583 ?auto_204588 ) ) ( not ( = ?auto_204583 ?auto_204589 ) ) ( not ( = ?auto_204584 ?auto_204585 ) ) ( not ( = ?auto_204584 ?auto_204586 ) ) ( not ( = ?auto_204584 ?auto_204587 ) ) ( not ( = ?auto_204584 ?auto_204588 ) ) ( not ( = ?auto_204584 ?auto_204589 ) ) ( not ( = ?auto_204585 ?auto_204586 ) ) ( not ( = ?auto_204585 ?auto_204587 ) ) ( not ( = ?auto_204585 ?auto_204588 ) ) ( not ( = ?auto_204585 ?auto_204589 ) ) ( not ( = ?auto_204586 ?auto_204587 ) ) ( not ( = ?auto_204586 ?auto_204588 ) ) ( not ( = ?auto_204586 ?auto_204589 ) ) ( not ( = ?auto_204587 ?auto_204588 ) ) ( not ( = ?auto_204587 ?auto_204589 ) ) ( not ( = ?auto_204588 ?auto_204589 ) ) ( ON-TABLE ?auto_204589 ) ( ON ?auto_204588 ?auto_204589 ) ( ON ?auto_204587 ?auto_204588 ) ( ON ?auto_204582 ?auto_204590 ) ( not ( = ?auto_204582 ?auto_204590 ) ) ( not ( = ?auto_204583 ?auto_204590 ) ) ( not ( = ?auto_204584 ?auto_204590 ) ) ( not ( = ?auto_204585 ?auto_204590 ) ) ( not ( = ?auto_204586 ?auto_204590 ) ) ( not ( = ?auto_204587 ?auto_204590 ) ) ( not ( = ?auto_204588 ?auto_204590 ) ) ( not ( = ?auto_204589 ?auto_204590 ) ) ( ON ?auto_204583 ?auto_204582 ) ( ON-TABLE ?auto_204590 ) ( ON ?auto_204584 ?auto_204583 ) ( ON ?auto_204585 ?auto_204584 ) ( CLEAR ?auto_204587 ) ( ON ?auto_204586 ?auto_204585 ) ( CLEAR ?auto_204586 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_204590 ?auto_204582 ?auto_204583 ?auto_204584 ?auto_204585 )
      ( MAKE-8PILE ?auto_204582 ?auto_204583 ?auto_204584 ?auto_204585 ?auto_204586 ?auto_204587 ?auto_204588 ?auto_204589 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_204591 - BLOCK
      ?auto_204592 - BLOCK
      ?auto_204593 - BLOCK
      ?auto_204594 - BLOCK
      ?auto_204595 - BLOCK
      ?auto_204596 - BLOCK
      ?auto_204597 - BLOCK
      ?auto_204598 - BLOCK
    )
    :vars
    (
      ?auto_204599 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_204591 ?auto_204592 ) ) ( not ( = ?auto_204591 ?auto_204593 ) ) ( not ( = ?auto_204591 ?auto_204594 ) ) ( not ( = ?auto_204591 ?auto_204595 ) ) ( not ( = ?auto_204591 ?auto_204596 ) ) ( not ( = ?auto_204591 ?auto_204597 ) ) ( not ( = ?auto_204591 ?auto_204598 ) ) ( not ( = ?auto_204592 ?auto_204593 ) ) ( not ( = ?auto_204592 ?auto_204594 ) ) ( not ( = ?auto_204592 ?auto_204595 ) ) ( not ( = ?auto_204592 ?auto_204596 ) ) ( not ( = ?auto_204592 ?auto_204597 ) ) ( not ( = ?auto_204592 ?auto_204598 ) ) ( not ( = ?auto_204593 ?auto_204594 ) ) ( not ( = ?auto_204593 ?auto_204595 ) ) ( not ( = ?auto_204593 ?auto_204596 ) ) ( not ( = ?auto_204593 ?auto_204597 ) ) ( not ( = ?auto_204593 ?auto_204598 ) ) ( not ( = ?auto_204594 ?auto_204595 ) ) ( not ( = ?auto_204594 ?auto_204596 ) ) ( not ( = ?auto_204594 ?auto_204597 ) ) ( not ( = ?auto_204594 ?auto_204598 ) ) ( not ( = ?auto_204595 ?auto_204596 ) ) ( not ( = ?auto_204595 ?auto_204597 ) ) ( not ( = ?auto_204595 ?auto_204598 ) ) ( not ( = ?auto_204596 ?auto_204597 ) ) ( not ( = ?auto_204596 ?auto_204598 ) ) ( not ( = ?auto_204597 ?auto_204598 ) ) ( ON-TABLE ?auto_204598 ) ( ON ?auto_204597 ?auto_204598 ) ( ON ?auto_204591 ?auto_204599 ) ( not ( = ?auto_204591 ?auto_204599 ) ) ( not ( = ?auto_204592 ?auto_204599 ) ) ( not ( = ?auto_204593 ?auto_204599 ) ) ( not ( = ?auto_204594 ?auto_204599 ) ) ( not ( = ?auto_204595 ?auto_204599 ) ) ( not ( = ?auto_204596 ?auto_204599 ) ) ( not ( = ?auto_204597 ?auto_204599 ) ) ( not ( = ?auto_204598 ?auto_204599 ) ) ( ON ?auto_204592 ?auto_204591 ) ( ON-TABLE ?auto_204599 ) ( ON ?auto_204593 ?auto_204592 ) ( ON ?auto_204594 ?auto_204593 ) ( ON ?auto_204595 ?auto_204594 ) ( CLEAR ?auto_204595 ) ( HOLDING ?auto_204596 ) ( CLEAR ?auto_204597 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_204598 ?auto_204597 ?auto_204596 )
      ( MAKE-8PILE ?auto_204591 ?auto_204592 ?auto_204593 ?auto_204594 ?auto_204595 ?auto_204596 ?auto_204597 ?auto_204598 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_204600 - BLOCK
      ?auto_204601 - BLOCK
      ?auto_204602 - BLOCK
      ?auto_204603 - BLOCK
      ?auto_204604 - BLOCK
      ?auto_204605 - BLOCK
      ?auto_204606 - BLOCK
      ?auto_204607 - BLOCK
    )
    :vars
    (
      ?auto_204608 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_204600 ?auto_204601 ) ) ( not ( = ?auto_204600 ?auto_204602 ) ) ( not ( = ?auto_204600 ?auto_204603 ) ) ( not ( = ?auto_204600 ?auto_204604 ) ) ( not ( = ?auto_204600 ?auto_204605 ) ) ( not ( = ?auto_204600 ?auto_204606 ) ) ( not ( = ?auto_204600 ?auto_204607 ) ) ( not ( = ?auto_204601 ?auto_204602 ) ) ( not ( = ?auto_204601 ?auto_204603 ) ) ( not ( = ?auto_204601 ?auto_204604 ) ) ( not ( = ?auto_204601 ?auto_204605 ) ) ( not ( = ?auto_204601 ?auto_204606 ) ) ( not ( = ?auto_204601 ?auto_204607 ) ) ( not ( = ?auto_204602 ?auto_204603 ) ) ( not ( = ?auto_204602 ?auto_204604 ) ) ( not ( = ?auto_204602 ?auto_204605 ) ) ( not ( = ?auto_204602 ?auto_204606 ) ) ( not ( = ?auto_204602 ?auto_204607 ) ) ( not ( = ?auto_204603 ?auto_204604 ) ) ( not ( = ?auto_204603 ?auto_204605 ) ) ( not ( = ?auto_204603 ?auto_204606 ) ) ( not ( = ?auto_204603 ?auto_204607 ) ) ( not ( = ?auto_204604 ?auto_204605 ) ) ( not ( = ?auto_204604 ?auto_204606 ) ) ( not ( = ?auto_204604 ?auto_204607 ) ) ( not ( = ?auto_204605 ?auto_204606 ) ) ( not ( = ?auto_204605 ?auto_204607 ) ) ( not ( = ?auto_204606 ?auto_204607 ) ) ( ON-TABLE ?auto_204607 ) ( ON ?auto_204606 ?auto_204607 ) ( ON ?auto_204600 ?auto_204608 ) ( not ( = ?auto_204600 ?auto_204608 ) ) ( not ( = ?auto_204601 ?auto_204608 ) ) ( not ( = ?auto_204602 ?auto_204608 ) ) ( not ( = ?auto_204603 ?auto_204608 ) ) ( not ( = ?auto_204604 ?auto_204608 ) ) ( not ( = ?auto_204605 ?auto_204608 ) ) ( not ( = ?auto_204606 ?auto_204608 ) ) ( not ( = ?auto_204607 ?auto_204608 ) ) ( ON ?auto_204601 ?auto_204600 ) ( ON-TABLE ?auto_204608 ) ( ON ?auto_204602 ?auto_204601 ) ( ON ?auto_204603 ?auto_204602 ) ( ON ?auto_204604 ?auto_204603 ) ( CLEAR ?auto_204606 ) ( ON ?auto_204605 ?auto_204604 ) ( CLEAR ?auto_204605 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_204608 ?auto_204600 ?auto_204601 ?auto_204602 ?auto_204603 ?auto_204604 )
      ( MAKE-8PILE ?auto_204600 ?auto_204601 ?auto_204602 ?auto_204603 ?auto_204604 ?auto_204605 ?auto_204606 ?auto_204607 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_204609 - BLOCK
      ?auto_204610 - BLOCK
      ?auto_204611 - BLOCK
      ?auto_204612 - BLOCK
      ?auto_204613 - BLOCK
      ?auto_204614 - BLOCK
      ?auto_204615 - BLOCK
      ?auto_204616 - BLOCK
    )
    :vars
    (
      ?auto_204617 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_204609 ?auto_204610 ) ) ( not ( = ?auto_204609 ?auto_204611 ) ) ( not ( = ?auto_204609 ?auto_204612 ) ) ( not ( = ?auto_204609 ?auto_204613 ) ) ( not ( = ?auto_204609 ?auto_204614 ) ) ( not ( = ?auto_204609 ?auto_204615 ) ) ( not ( = ?auto_204609 ?auto_204616 ) ) ( not ( = ?auto_204610 ?auto_204611 ) ) ( not ( = ?auto_204610 ?auto_204612 ) ) ( not ( = ?auto_204610 ?auto_204613 ) ) ( not ( = ?auto_204610 ?auto_204614 ) ) ( not ( = ?auto_204610 ?auto_204615 ) ) ( not ( = ?auto_204610 ?auto_204616 ) ) ( not ( = ?auto_204611 ?auto_204612 ) ) ( not ( = ?auto_204611 ?auto_204613 ) ) ( not ( = ?auto_204611 ?auto_204614 ) ) ( not ( = ?auto_204611 ?auto_204615 ) ) ( not ( = ?auto_204611 ?auto_204616 ) ) ( not ( = ?auto_204612 ?auto_204613 ) ) ( not ( = ?auto_204612 ?auto_204614 ) ) ( not ( = ?auto_204612 ?auto_204615 ) ) ( not ( = ?auto_204612 ?auto_204616 ) ) ( not ( = ?auto_204613 ?auto_204614 ) ) ( not ( = ?auto_204613 ?auto_204615 ) ) ( not ( = ?auto_204613 ?auto_204616 ) ) ( not ( = ?auto_204614 ?auto_204615 ) ) ( not ( = ?auto_204614 ?auto_204616 ) ) ( not ( = ?auto_204615 ?auto_204616 ) ) ( ON-TABLE ?auto_204616 ) ( ON ?auto_204609 ?auto_204617 ) ( not ( = ?auto_204609 ?auto_204617 ) ) ( not ( = ?auto_204610 ?auto_204617 ) ) ( not ( = ?auto_204611 ?auto_204617 ) ) ( not ( = ?auto_204612 ?auto_204617 ) ) ( not ( = ?auto_204613 ?auto_204617 ) ) ( not ( = ?auto_204614 ?auto_204617 ) ) ( not ( = ?auto_204615 ?auto_204617 ) ) ( not ( = ?auto_204616 ?auto_204617 ) ) ( ON ?auto_204610 ?auto_204609 ) ( ON-TABLE ?auto_204617 ) ( ON ?auto_204611 ?auto_204610 ) ( ON ?auto_204612 ?auto_204611 ) ( ON ?auto_204613 ?auto_204612 ) ( ON ?auto_204614 ?auto_204613 ) ( CLEAR ?auto_204614 ) ( HOLDING ?auto_204615 ) ( CLEAR ?auto_204616 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_204616 ?auto_204615 )
      ( MAKE-8PILE ?auto_204609 ?auto_204610 ?auto_204611 ?auto_204612 ?auto_204613 ?auto_204614 ?auto_204615 ?auto_204616 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_204618 - BLOCK
      ?auto_204619 - BLOCK
      ?auto_204620 - BLOCK
      ?auto_204621 - BLOCK
      ?auto_204622 - BLOCK
      ?auto_204623 - BLOCK
      ?auto_204624 - BLOCK
      ?auto_204625 - BLOCK
    )
    :vars
    (
      ?auto_204626 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_204618 ?auto_204619 ) ) ( not ( = ?auto_204618 ?auto_204620 ) ) ( not ( = ?auto_204618 ?auto_204621 ) ) ( not ( = ?auto_204618 ?auto_204622 ) ) ( not ( = ?auto_204618 ?auto_204623 ) ) ( not ( = ?auto_204618 ?auto_204624 ) ) ( not ( = ?auto_204618 ?auto_204625 ) ) ( not ( = ?auto_204619 ?auto_204620 ) ) ( not ( = ?auto_204619 ?auto_204621 ) ) ( not ( = ?auto_204619 ?auto_204622 ) ) ( not ( = ?auto_204619 ?auto_204623 ) ) ( not ( = ?auto_204619 ?auto_204624 ) ) ( not ( = ?auto_204619 ?auto_204625 ) ) ( not ( = ?auto_204620 ?auto_204621 ) ) ( not ( = ?auto_204620 ?auto_204622 ) ) ( not ( = ?auto_204620 ?auto_204623 ) ) ( not ( = ?auto_204620 ?auto_204624 ) ) ( not ( = ?auto_204620 ?auto_204625 ) ) ( not ( = ?auto_204621 ?auto_204622 ) ) ( not ( = ?auto_204621 ?auto_204623 ) ) ( not ( = ?auto_204621 ?auto_204624 ) ) ( not ( = ?auto_204621 ?auto_204625 ) ) ( not ( = ?auto_204622 ?auto_204623 ) ) ( not ( = ?auto_204622 ?auto_204624 ) ) ( not ( = ?auto_204622 ?auto_204625 ) ) ( not ( = ?auto_204623 ?auto_204624 ) ) ( not ( = ?auto_204623 ?auto_204625 ) ) ( not ( = ?auto_204624 ?auto_204625 ) ) ( ON-TABLE ?auto_204625 ) ( ON ?auto_204618 ?auto_204626 ) ( not ( = ?auto_204618 ?auto_204626 ) ) ( not ( = ?auto_204619 ?auto_204626 ) ) ( not ( = ?auto_204620 ?auto_204626 ) ) ( not ( = ?auto_204621 ?auto_204626 ) ) ( not ( = ?auto_204622 ?auto_204626 ) ) ( not ( = ?auto_204623 ?auto_204626 ) ) ( not ( = ?auto_204624 ?auto_204626 ) ) ( not ( = ?auto_204625 ?auto_204626 ) ) ( ON ?auto_204619 ?auto_204618 ) ( ON-TABLE ?auto_204626 ) ( ON ?auto_204620 ?auto_204619 ) ( ON ?auto_204621 ?auto_204620 ) ( ON ?auto_204622 ?auto_204621 ) ( ON ?auto_204623 ?auto_204622 ) ( CLEAR ?auto_204625 ) ( ON ?auto_204624 ?auto_204623 ) ( CLEAR ?auto_204624 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_204626 ?auto_204618 ?auto_204619 ?auto_204620 ?auto_204621 ?auto_204622 ?auto_204623 )
      ( MAKE-8PILE ?auto_204618 ?auto_204619 ?auto_204620 ?auto_204621 ?auto_204622 ?auto_204623 ?auto_204624 ?auto_204625 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_204627 - BLOCK
      ?auto_204628 - BLOCK
      ?auto_204629 - BLOCK
      ?auto_204630 - BLOCK
      ?auto_204631 - BLOCK
      ?auto_204632 - BLOCK
      ?auto_204633 - BLOCK
      ?auto_204634 - BLOCK
    )
    :vars
    (
      ?auto_204635 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_204627 ?auto_204628 ) ) ( not ( = ?auto_204627 ?auto_204629 ) ) ( not ( = ?auto_204627 ?auto_204630 ) ) ( not ( = ?auto_204627 ?auto_204631 ) ) ( not ( = ?auto_204627 ?auto_204632 ) ) ( not ( = ?auto_204627 ?auto_204633 ) ) ( not ( = ?auto_204627 ?auto_204634 ) ) ( not ( = ?auto_204628 ?auto_204629 ) ) ( not ( = ?auto_204628 ?auto_204630 ) ) ( not ( = ?auto_204628 ?auto_204631 ) ) ( not ( = ?auto_204628 ?auto_204632 ) ) ( not ( = ?auto_204628 ?auto_204633 ) ) ( not ( = ?auto_204628 ?auto_204634 ) ) ( not ( = ?auto_204629 ?auto_204630 ) ) ( not ( = ?auto_204629 ?auto_204631 ) ) ( not ( = ?auto_204629 ?auto_204632 ) ) ( not ( = ?auto_204629 ?auto_204633 ) ) ( not ( = ?auto_204629 ?auto_204634 ) ) ( not ( = ?auto_204630 ?auto_204631 ) ) ( not ( = ?auto_204630 ?auto_204632 ) ) ( not ( = ?auto_204630 ?auto_204633 ) ) ( not ( = ?auto_204630 ?auto_204634 ) ) ( not ( = ?auto_204631 ?auto_204632 ) ) ( not ( = ?auto_204631 ?auto_204633 ) ) ( not ( = ?auto_204631 ?auto_204634 ) ) ( not ( = ?auto_204632 ?auto_204633 ) ) ( not ( = ?auto_204632 ?auto_204634 ) ) ( not ( = ?auto_204633 ?auto_204634 ) ) ( ON ?auto_204627 ?auto_204635 ) ( not ( = ?auto_204627 ?auto_204635 ) ) ( not ( = ?auto_204628 ?auto_204635 ) ) ( not ( = ?auto_204629 ?auto_204635 ) ) ( not ( = ?auto_204630 ?auto_204635 ) ) ( not ( = ?auto_204631 ?auto_204635 ) ) ( not ( = ?auto_204632 ?auto_204635 ) ) ( not ( = ?auto_204633 ?auto_204635 ) ) ( not ( = ?auto_204634 ?auto_204635 ) ) ( ON ?auto_204628 ?auto_204627 ) ( ON-TABLE ?auto_204635 ) ( ON ?auto_204629 ?auto_204628 ) ( ON ?auto_204630 ?auto_204629 ) ( ON ?auto_204631 ?auto_204630 ) ( ON ?auto_204632 ?auto_204631 ) ( ON ?auto_204633 ?auto_204632 ) ( CLEAR ?auto_204633 ) ( HOLDING ?auto_204634 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_204634 )
      ( MAKE-8PILE ?auto_204627 ?auto_204628 ?auto_204629 ?auto_204630 ?auto_204631 ?auto_204632 ?auto_204633 ?auto_204634 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_204636 - BLOCK
      ?auto_204637 - BLOCK
      ?auto_204638 - BLOCK
      ?auto_204639 - BLOCK
      ?auto_204640 - BLOCK
      ?auto_204641 - BLOCK
      ?auto_204642 - BLOCK
      ?auto_204643 - BLOCK
    )
    :vars
    (
      ?auto_204644 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_204636 ?auto_204637 ) ) ( not ( = ?auto_204636 ?auto_204638 ) ) ( not ( = ?auto_204636 ?auto_204639 ) ) ( not ( = ?auto_204636 ?auto_204640 ) ) ( not ( = ?auto_204636 ?auto_204641 ) ) ( not ( = ?auto_204636 ?auto_204642 ) ) ( not ( = ?auto_204636 ?auto_204643 ) ) ( not ( = ?auto_204637 ?auto_204638 ) ) ( not ( = ?auto_204637 ?auto_204639 ) ) ( not ( = ?auto_204637 ?auto_204640 ) ) ( not ( = ?auto_204637 ?auto_204641 ) ) ( not ( = ?auto_204637 ?auto_204642 ) ) ( not ( = ?auto_204637 ?auto_204643 ) ) ( not ( = ?auto_204638 ?auto_204639 ) ) ( not ( = ?auto_204638 ?auto_204640 ) ) ( not ( = ?auto_204638 ?auto_204641 ) ) ( not ( = ?auto_204638 ?auto_204642 ) ) ( not ( = ?auto_204638 ?auto_204643 ) ) ( not ( = ?auto_204639 ?auto_204640 ) ) ( not ( = ?auto_204639 ?auto_204641 ) ) ( not ( = ?auto_204639 ?auto_204642 ) ) ( not ( = ?auto_204639 ?auto_204643 ) ) ( not ( = ?auto_204640 ?auto_204641 ) ) ( not ( = ?auto_204640 ?auto_204642 ) ) ( not ( = ?auto_204640 ?auto_204643 ) ) ( not ( = ?auto_204641 ?auto_204642 ) ) ( not ( = ?auto_204641 ?auto_204643 ) ) ( not ( = ?auto_204642 ?auto_204643 ) ) ( ON ?auto_204636 ?auto_204644 ) ( not ( = ?auto_204636 ?auto_204644 ) ) ( not ( = ?auto_204637 ?auto_204644 ) ) ( not ( = ?auto_204638 ?auto_204644 ) ) ( not ( = ?auto_204639 ?auto_204644 ) ) ( not ( = ?auto_204640 ?auto_204644 ) ) ( not ( = ?auto_204641 ?auto_204644 ) ) ( not ( = ?auto_204642 ?auto_204644 ) ) ( not ( = ?auto_204643 ?auto_204644 ) ) ( ON ?auto_204637 ?auto_204636 ) ( ON-TABLE ?auto_204644 ) ( ON ?auto_204638 ?auto_204637 ) ( ON ?auto_204639 ?auto_204638 ) ( ON ?auto_204640 ?auto_204639 ) ( ON ?auto_204641 ?auto_204640 ) ( ON ?auto_204642 ?auto_204641 ) ( ON ?auto_204643 ?auto_204642 ) ( CLEAR ?auto_204643 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_204644 ?auto_204636 ?auto_204637 ?auto_204638 ?auto_204639 ?auto_204640 ?auto_204641 ?auto_204642 )
      ( MAKE-8PILE ?auto_204636 ?auto_204637 ?auto_204638 ?auto_204639 ?auto_204640 ?auto_204641 ?auto_204642 ?auto_204643 ) )
  )

)

