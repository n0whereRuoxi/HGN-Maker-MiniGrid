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
      ?auto_313486 - BLOCK
    )
    :vars
    (
      ?auto_313487 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_313486 ?auto_313487 ) ( CLEAR ?auto_313486 ) ( HAND-EMPTY ) ( not ( = ?auto_313486 ?auto_313487 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_313486 ?auto_313487 )
      ( !PUTDOWN ?auto_313486 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_313489 - BLOCK
    )
    :vars
    (
      ?auto_313490 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_313489 ?auto_313490 ) ( CLEAR ?auto_313489 ) ( HAND-EMPTY ) ( not ( = ?auto_313489 ?auto_313490 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_313489 ?auto_313490 )
      ( !PUTDOWN ?auto_313489 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_313493 - BLOCK
      ?auto_313494 - BLOCK
    )
    :vars
    (
      ?auto_313495 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_313493 ) ( ON ?auto_313494 ?auto_313495 ) ( CLEAR ?auto_313494 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_313493 ) ( not ( = ?auto_313493 ?auto_313494 ) ) ( not ( = ?auto_313493 ?auto_313495 ) ) ( not ( = ?auto_313494 ?auto_313495 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_313494 ?auto_313495 )
      ( !STACK ?auto_313494 ?auto_313493 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_313498 - BLOCK
      ?auto_313499 - BLOCK
    )
    :vars
    (
      ?auto_313500 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_313498 ) ( ON ?auto_313499 ?auto_313500 ) ( CLEAR ?auto_313499 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_313498 ) ( not ( = ?auto_313498 ?auto_313499 ) ) ( not ( = ?auto_313498 ?auto_313500 ) ) ( not ( = ?auto_313499 ?auto_313500 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_313499 ?auto_313500 )
      ( !STACK ?auto_313499 ?auto_313498 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_313503 - BLOCK
      ?auto_313504 - BLOCK
    )
    :vars
    (
      ?auto_313505 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_313504 ?auto_313505 ) ( not ( = ?auto_313503 ?auto_313504 ) ) ( not ( = ?auto_313503 ?auto_313505 ) ) ( not ( = ?auto_313504 ?auto_313505 ) ) ( ON ?auto_313503 ?auto_313504 ) ( CLEAR ?auto_313503 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_313503 )
      ( MAKE-2PILE ?auto_313503 ?auto_313504 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_313508 - BLOCK
      ?auto_313509 - BLOCK
    )
    :vars
    (
      ?auto_313510 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_313509 ?auto_313510 ) ( not ( = ?auto_313508 ?auto_313509 ) ) ( not ( = ?auto_313508 ?auto_313510 ) ) ( not ( = ?auto_313509 ?auto_313510 ) ) ( ON ?auto_313508 ?auto_313509 ) ( CLEAR ?auto_313508 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_313508 )
      ( MAKE-2PILE ?auto_313508 ?auto_313509 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_313514 - BLOCK
      ?auto_313515 - BLOCK
      ?auto_313516 - BLOCK
    )
    :vars
    (
      ?auto_313517 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_313515 ) ( ON ?auto_313516 ?auto_313517 ) ( CLEAR ?auto_313516 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_313514 ) ( ON ?auto_313515 ?auto_313514 ) ( not ( = ?auto_313514 ?auto_313515 ) ) ( not ( = ?auto_313514 ?auto_313516 ) ) ( not ( = ?auto_313514 ?auto_313517 ) ) ( not ( = ?auto_313515 ?auto_313516 ) ) ( not ( = ?auto_313515 ?auto_313517 ) ) ( not ( = ?auto_313516 ?auto_313517 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_313516 ?auto_313517 )
      ( !STACK ?auto_313516 ?auto_313515 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_313521 - BLOCK
      ?auto_313522 - BLOCK
      ?auto_313523 - BLOCK
    )
    :vars
    (
      ?auto_313524 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_313522 ) ( ON ?auto_313523 ?auto_313524 ) ( CLEAR ?auto_313523 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_313521 ) ( ON ?auto_313522 ?auto_313521 ) ( not ( = ?auto_313521 ?auto_313522 ) ) ( not ( = ?auto_313521 ?auto_313523 ) ) ( not ( = ?auto_313521 ?auto_313524 ) ) ( not ( = ?auto_313522 ?auto_313523 ) ) ( not ( = ?auto_313522 ?auto_313524 ) ) ( not ( = ?auto_313523 ?auto_313524 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_313523 ?auto_313524 )
      ( !STACK ?auto_313523 ?auto_313522 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_313528 - BLOCK
      ?auto_313529 - BLOCK
      ?auto_313530 - BLOCK
    )
    :vars
    (
      ?auto_313531 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_313530 ?auto_313531 ) ( ON-TABLE ?auto_313528 ) ( not ( = ?auto_313528 ?auto_313529 ) ) ( not ( = ?auto_313528 ?auto_313530 ) ) ( not ( = ?auto_313528 ?auto_313531 ) ) ( not ( = ?auto_313529 ?auto_313530 ) ) ( not ( = ?auto_313529 ?auto_313531 ) ) ( not ( = ?auto_313530 ?auto_313531 ) ) ( CLEAR ?auto_313528 ) ( ON ?auto_313529 ?auto_313530 ) ( CLEAR ?auto_313529 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_313528 ?auto_313529 )
      ( MAKE-3PILE ?auto_313528 ?auto_313529 ?auto_313530 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_313535 - BLOCK
      ?auto_313536 - BLOCK
      ?auto_313537 - BLOCK
    )
    :vars
    (
      ?auto_313538 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_313537 ?auto_313538 ) ( ON-TABLE ?auto_313535 ) ( not ( = ?auto_313535 ?auto_313536 ) ) ( not ( = ?auto_313535 ?auto_313537 ) ) ( not ( = ?auto_313535 ?auto_313538 ) ) ( not ( = ?auto_313536 ?auto_313537 ) ) ( not ( = ?auto_313536 ?auto_313538 ) ) ( not ( = ?auto_313537 ?auto_313538 ) ) ( CLEAR ?auto_313535 ) ( ON ?auto_313536 ?auto_313537 ) ( CLEAR ?auto_313536 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_313535 ?auto_313536 )
      ( MAKE-3PILE ?auto_313535 ?auto_313536 ?auto_313537 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_313542 - BLOCK
      ?auto_313543 - BLOCK
      ?auto_313544 - BLOCK
    )
    :vars
    (
      ?auto_313545 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_313544 ?auto_313545 ) ( not ( = ?auto_313542 ?auto_313543 ) ) ( not ( = ?auto_313542 ?auto_313544 ) ) ( not ( = ?auto_313542 ?auto_313545 ) ) ( not ( = ?auto_313543 ?auto_313544 ) ) ( not ( = ?auto_313543 ?auto_313545 ) ) ( not ( = ?auto_313544 ?auto_313545 ) ) ( ON ?auto_313543 ?auto_313544 ) ( ON ?auto_313542 ?auto_313543 ) ( CLEAR ?auto_313542 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_313542 )
      ( MAKE-3PILE ?auto_313542 ?auto_313543 ?auto_313544 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_313549 - BLOCK
      ?auto_313550 - BLOCK
      ?auto_313551 - BLOCK
    )
    :vars
    (
      ?auto_313552 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_313551 ?auto_313552 ) ( not ( = ?auto_313549 ?auto_313550 ) ) ( not ( = ?auto_313549 ?auto_313551 ) ) ( not ( = ?auto_313549 ?auto_313552 ) ) ( not ( = ?auto_313550 ?auto_313551 ) ) ( not ( = ?auto_313550 ?auto_313552 ) ) ( not ( = ?auto_313551 ?auto_313552 ) ) ( ON ?auto_313550 ?auto_313551 ) ( ON ?auto_313549 ?auto_313550 ) ( CLEAR ?auto_313549 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_313549 )
      ( MAKE-3PILE ?auto_313549 ?auto_313550 ?auto_313551 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_313557 - BLOCK
      ?auto_313558 - BLOCK
      ?auto_313559 - BLOCK
      ?auto_313560 - BLOCK
    )
    :vars
    (
      ?auto_313561 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_313559 ) ( ON ?auto_313560 ?auto_313561 ) ( CLEAR ?auto_313560 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_313557 ) ( ON ?auto_313558 ?auto_313557 ) ( ON ?auto_313559 ?auto_313558 ) ( not ( = ?auto_313557 ?auto_313558 ) ) ( not ( = ?auto_313557 ?auto_313559 ) ) ( not ( = ?auto_313557 ?auto_313560 ) ) ( not ( = ?auto_313557 ?auto_313561 ) ) ( not ( = ?auto_313558 ?auto_313559 ) ) ( not ( = ?auto_313558 ?auto_313560 ) ) ( not ( = ?auto_313558 ?auto_313561 ) ) ( not ( = ?auto_313559 ?auto_313560 ) ) ( not ( = ?auto_313559 ?auto_313561 ) ) ( not ( = ?auto_313560 ?auto_313561 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_313560 ?auto_313561 )
      ( !STACK ?auto_313560 ?auto_313559 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_313566 - BLOCK
      ?auto_313567 - BLOCK
      ?auto_313568 - BLOCK
      ?auto_313569 - BLOCK
    )
    :vars
    (
      ?auto_313570 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_313568 ) ( ON ?auto_313569 ?auto_313570 ) ( CLEAR ?auto_313569 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_313566 ) ( ON ?auto_313567 ?auto_313566 ) ( ON ?auto_313568 ?auto_313567 ) ( not ( = ?auto_313566 ?auto_313567 ) ) ( not ( = ?auto_313566 ?auto_313568 ) ) ( not ( = ?auto_313566 ?auto_313569 ) ) ( not ( = ?auto_313566 ?auto_313570 ) ) ( not ( = ?auto_313567 ?auto_313568 ) ) ( not ( = ?auto_313567 ?auto_313569 ) ) ( not ( = ?auto_313567 ?auto_313570 ) ) ( not ( = ?auto_313568 ?auto_313569 ) ) ( not ( = ?auto_313568 ?auto_313570 ) ) ( not ( = ?auto_313569 ?auto_313570 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_313569 ?auto_313570 )
      ( !STACK ?auto_313569 ?auto_313568 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_313575 - BLOCK
      ?auto_313576 - BLOCK
      ?auto_313577 - BLOCK
      ?auto_313578 - BLOCK
    )
    :vars
    (
      ?auto_313579 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_313578 ?auto_313579 ) ( ON-TABLE ?auto_313575 ) ( ON ?auto_313576 ?auto_313575 ) ( not ( = ?auto_313575 ?auto_313576 ) ) ( not ( = ?auto_313575 ?auto_313577 ) ) ( not ( = ?auto_313575 ?auto_313578 ) ) ( not ( = ?auto_313575 ?auto_313579 ) ) ( not ( = ?auto_313576 ?auto_313577 ) ) ( not ( = ?auto_313576 ?auto_313578 ) ) ( not ( = ?auto_313576 ?auto_313579 ) ) ( not ( = ?auto_313577 ?auto_313578 ) ) ( not ( = ?auto_313577 ?auto_313579 ) ) ( not ( = ?auto_313578 ?auto_313579 ) ) ( CLEAR ?auto_313576 ) ( ON ?auto_313577 ?auto_313578 ) ( CLEAR ?auto_313577 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_313575 ?auto_313576 ?auto_313577 )
      ( MAKE-4PILE ?auto_313575 ?auto_313576 ?auto_313577 ?auto_313578 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_313584 - BLOCK
      ?auto_313585 - BLOCK
      ?auto_313586 - BLOCK
      ?auto_313587 - BLOCK
    )
    :vars
    (
      ?auto_313588 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_313587 ?auto_313588 ) ( ON-TABLE ?auto_313584 ) ( ON ?auto_313585 ?auto_313584 ) ( not ( = ?auto_313584 ?auto_313585 ) ) ( not ( = ?auto_313584 ?auto_313586 ) ) ( not ( = ?auto_313584 ?auto_313587 ) ) ( not ( = ?auto_313584 ?auto_313588 ) ) ( not ( = ?auto_313585 ?auto_313586 ) ) ( not ( = ?auto_313585 ?auto_313587 ) ) ( not ( = ?auto_313585 ?auto_313588 ) ) ( not ( = ?auto_313586 ?auto_313587 ) ) ( not ( = ?auto_313586 ?auto_313588 ) ) ( not ( = ?auto_313587 ?auto_313588 ) ) ( CLEAR ?auto_313585 ) ( ON ?auto_313586 ?auto_313587 ) ( CLEAR ?auto_313586 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_313584 ?auto_313585 ?auto_313586 )
      ( MAKE-4PILE ?auto_313584 ?auto_313585 ?auto_313586 ?auto_313587 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_313593 - BLOCK
      ?auto_313594 - BLOCK
      ?auto_313595 - BLOCK
      ?auto_313596 - BLOCK
    )
    :vars
    (
      ?auto_313597 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_313596 ?auto_313597 ) ( ON-TABLE ?auto_313593 ) ( not ( = ?auto_313593 ?auto_313594 ) ) ( not ( = ?auto_313593 ?auto_313595 ) ) ( not ( = ?auto_313593 ?auto_313596 ) ) ( not ( = ?auto_313593 ?auto_313597 ) ) ( not ( = ?auto_313594 ?auto_313595 ) ) ( not ( = ?auto_313594 ?auto_313596 ) ) ( not ( = ?auto_313594 ?auto_313597 ) ) ( not ( = ?auto_313595 ?auto_313596 ) ) ( not ( = ?auto_313595 ?auto_313597 ) ) ( not ( = ?auto_313596 ?auto_313597 ) ) ( ON ?auto_313595 ?auto_313596 ) ( CLEAR ?auto_313593 ) ( ON ?auto_313594 ?auto_313595 ) ( CLEAR ?auto_313594 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_313593 ?auto_313594 )
      ( MAKE-4PILE ?auto_313593 ?auto_313594 ?auto_313595 ?auto_313596 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_313602 - BLOCK
      ?auto_313603 - BLOCK
      ?auto_313604 - BLOCK
      ?auto_313605 - BLOCK
    )
    :vars
    (
      ?auto_313606 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_313605 ?auto_313606 ) ( ON-TABLE ?auto_313602 ) ( not ( = ?auto_313602 ?auto_313603 ) ) ( not ( = ?auto_313602 ?auto_313604 ) ) ( not ( = ?auto_313602 ?auto_313605 ) ) ( not ( = ?auto_313602 ?auto_313606 ) ) ( not ( = ?auto_313603 ?auto_313604 ) ) ( not ( = ?auto_313603 ?auto_313605 ) ) ( not ( = ?auto_313603 ?auto_313606 ) ) ( not ( = ?auto_313604 ?auto_313605 ) ) ( not ( = ?auto_313604 ?auto_313606 ) ) ( not ( = ?auto_313605 ?auto_313606 ) ) ( ON ?auto_313604 ?auto_313605 ) ( CLEAR ?auto_313602 ) ( ON ?auto_313603 ?auto_313604 ) ( CLEAR ?auto_313603 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_313602 ?auto_313603 )
      ( MAKE-4PILE ?auto_313602 ?auto_313603 ?auto_313604 ?auto_313605 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_313611 - BLOCK
      ?auto_313612 - BLOCK
      ?auto_313613 - BLOCK
      ?auto_313614 - BLOCK
    )
    :vars
    (
      ?auto_313615 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_313614 ?auto_313615 ) ( not ( = ?auto_313611 ?auto_313612 ) ) ( not ( = ?auto_313611 ?auto_313613 ) ) ( not ( = ?auto_313611 ?auto_313614 ) ) ( not ( = ?auto_313611 ?auto_313615 ) ) ( not ( = ?auto_313612 ?auto_313613 ) ) ( not ( = ?auto_313612 ?auto_313614 ) ) ( not ( = ?auto_313612 ?auto_313615 ) ) ( not ( = ?auto_313613 ?auto_313614 ) ) ( not ( = ?auto_313613 ?auto_313615 ) ) ( not ( = ?auto_313614 ?auto_313615 ) ) ( ON ?auto_313613 ?auto_313614 ) ( ON ?auto_313612 ?auto_313613 ) ( ON ?auto_313611 ?auto_313612 ) ( CLEAR ?auto_313611 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_313611 )
      ( MAKE-4PILE ?auto_313611 ?auto_313612 ?auto_313613 ?auto_313614 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_313620 - BLOCK
      ?auto_313621 - BLOCK
      ?auto_313622 - BLOCK
      ?auto_313623 - BLOCK
    )
    :vars
    (
      ?auto_313624 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_313623 ?auto_313624 ) ( not ( = ?auto_313620 ?auto_313621 ) ) ( not ( = ?auto_313620 ?auto_313622 ) ) ( not ( = ?auto_313620 ?auto_313623 ) ) ( not ( = ?auto_313620 ?auto_313624 ) ) ( not ( = ?auto_313621 ?auto_313622 ) ) ( not ( = ?auto_313621 ?auto_313623 ) ) ( not ( = ?auto_313621 ?auto_313624 ) ) ( not ( = ?auto_313622 ?auto_313623 ) ) ( not ( = ?auto_313622 ?auto_313624 ) ) ( not ( = ?auto_313623 ?auto_313624 ) ) ( ON ?auto_313622 ?auto_313623 ) ( ON ?auto_313621 ?auto_313622 ) ( ON ?auto_313620 ?auto_313621 ) ( CLEAR ?auto_313620 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_313620 )
      ( MAKE-4PILE ?auto_313620 ?auto_313621 ?auto_313622 ?auto_313623 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_313630 - BLOCK
      ?auto_313631 - BLOCK
      ?auto_313632 - BLOCK
      ?auto_313633 - BLOCK
      ?auto_313634 - BLOCK
    )
    :vars
    (
      ?auto_313635 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_313633 ) ( ON ?auto_313634 ?auto_313635 ) ( CLEAR ?auto_313634 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_313630 ) ( ON ?auto_313631 ?auto_313630 ) ( ON ?auto_313632 ?auto_313631 ) ( ON ?auto_313633 ?auto_313632 ) ( not ( = ?auto_313630 ?auto_313631 ) ) ( not ( = ?auto_313630 ?auto_313632 ) ) ( not ( = ?auto_313630 ?auto_313633 ) ) ( not ( = ?auto_313630 ?auto_313634 ) ) ( not ( = ?auto_313630 ?auto_313635 ) ) ( not ( = ?auto_313631 ?auto_313632 ) ) ( not ( = ?auto_313631 ?auto_313633 ) ) ( not ( = ?auto_313631 ?auto_313634 ) ) ( not ( = ?auto_313631 ?auto_313635 ) ) ( not ( = ?auto_313632 ?auto_313633 ) ) ( not ( = ?auto_313632 ?auto_313634 ) ) ( not ( = ?auto_313632 ?auto_313635 ) ) ( not ( = ?auto_313633 ?auto_313634 ) ) ( not ( = ?auto_313633 ?auto_313635 ) ) ( not ( = ?auto_313634 ?auto_313635 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_313634 ?auto_313635 )
      ( !STACK ?auto_313634 ?auto_313633 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_313641 - BLOCK
      ?auto_313642 - BLOCK
      ?auto_313643 - BLOCK
      ?auto_313644 - BLOCK
      ?auto_313645 - BLOCK
    )
    :vars
    (
      ?auto_313646 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_313644 ) ( ON ?auto_313645 ?auto_313646 ) ( CLEAR ?auto_313645 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_313641 ) ( ON ?auto_313642 ?auto_313641 ) ( ON ?auto_313643 ?auto_313642 ) ( ON ?auto_313644 ?auto_313643 ) ( not ( = ?auto_313641 ?auto_313642 ) ) ( not ( = ?auto_313641 ?auto_313643 ) ) ( not ( = ?auto_313641 ?auto_313644 ) ) ( not ( = ?auto_313641 ?auto_313645 ) ) ( not ( = ?auto_313641 ?auto_313646 ) ) ( not ( = ?auto_313642 ?auto_313643 ) ) ( not ( = ?auto_313642 ?auto_313644 ) ) ( not ( = ?auto_313642 ?auto_313645 ) ) ( not ( = ?auto_313642 ?auto_313646 ) ) ( not ( = ?auto_313643 ?auto_313644 ) ) ( not ( = ?auto_313643 ?auto_313645 ) ) ( not ( = ?auto_313643 ?auto_313646 ) ) ( not ( = ?auto_313644 ?auto_313645 ) ) ( not ( = ?auto_313644 ?auto_313646 ) ) ( not ( = ?auto_313645 ?auto_313646 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_313645 ?auto_313646 )
      ( !STACK ?auto_313645 ?auto_313644 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_313652 - BLOCK
      ?auto_313653 - BLOCK
      ?auto_313654 - BLOCK
      ?auto_313655 - BLOCK
      ?auto_313656 - BLOCK
    )
    :vars
    (
      ?auto_313657 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_313656 ?auto_313657 ) ( ON-TABLE ?auto_313652 ) ( ON ?auto_313653 ?auto_313652 ) ( ON ?auto_313654 ?auto_313653 ) ( not ( = ?auto_313652 ?auto_313653 ) ) ( not ( = ?auto_313652 ?auto_313654 ) ) ( not ( = ?auto_313652 ?auto_313655 ) ) ( not ( = ?auto_313652 ?auto_313656 ) ) ( not ( = ?auto_313652 ?auto_313657 ) ) ( not ( = ?auto_313653 ?auto_313654 ) ) ( not ( = ?auto_313653 ?auto_313655 ) ) ( not ( = ?auto_313653 ?auto_313656 ) ) ( not ( = ?auto_313653 ?auto_313657 ) ) ( not ( = ?auto_313654 ?auto_313655 ) ) ( not ( = ?auto_313654 ?auto_313656 ) ) ( not ( = ?auto_313654 ?auto_313657 ) ) ( not ( = ?auto_313655 ?auto_313656 ) ) ( not ( = ?auto_313655 ?auto_313657 ) ) ( not ( = ?auto_313656 ?auto_313657 ) ) ( CLEAR ?auto_313654 ) ( ON ?auto_313655 ?auto_313656 ) ( CLEAR ?auto_313655 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_313652 ?auto_313653 ?auto_313654 ?auto_313655 )
      ( MAKE-5PILE ?auto_313652 ?auto_313653 ?auto_313654 ?auto_313655 ?auto_313656 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_313663 - BLOCK
      ?auto_313664 - BLOCK
      ?auto_313665 - BLOCK
      ?auto_313666 - BLOCK
      ?auto_313667 - BLOCK
    )
    :vars
    (
      ?auto_313668 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_313667 ?auto_313668 ) ( ON-TABLE ?auto_313663 ) ( ON ?auto_313664 ?auto_313663 ) ( ON ?auto_313665 ?auto_313664 ) ( not ( = ?auto_313663 ?auto_313664 ) ) ( not ( = ?auto_313663 ?auto_313665 ) ) ( not ( = ?auto_313663 ?auto_313666 ) ) ( not ( = ?auto_313663 ?auto_313667 ) ) ( not ( = ?auto_313663 ?auto_313668 ) ) ( not ( = ?auto_313664 ?auto_313665 ) ) ( not ( = ?auto_313664 ?auto_313666 ) ) ( not ( = ?auto_313664 ?auto_313667 ) ) ( not ( = ?auto_313664 ?auto_313668 ) ) ( not ( = ?auto_313665 ?auto_313666 ) ) ( not ( = ?auto_313665 ?auto_313667 ) ) ( not ( = ?auto_313665 ?auto_313668 ) ) ( not ( = ?auto_313666 ?auto_313667 ) ) ( not ( = ?auto_313666 ?auto_313668 ) ) ( not ( = ?auto_313667 ?auto_313668 ) ) ( CLEAR ?auto_313665 ) ( ON ?auto_313666 ?auto_313667 ) ( CLEAR ?auto_313666 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_313663 ?auto_313664 ?auto_313665 ?auto_313666 )
      ( MAKE-5PILE ?auto_313663 ?auto_313664 ?auto_313665 ?auto_313666 ?auto_313667 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_313674 - BLOCK
      ?auto_313675 - BLOCK
      ?auto_313676 - BLOCK
      ?auto_313677 - BLOCK
      ?auto_313678 - BLOCK
    )
    :vars
    (
      ?auto_313679 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_313678 ?auto_313679 ) ( ON-TABLE ?auto_313674 ) ( ON ?auto_313675 ?auto_313674 ) ( not ( = ?auto_313674 ?auto_313675 ) ) ( not ( = ?auto_313674 ?auto_313676 ) ) ( not ( = ?auto_313674 ?auto_313677 ) ) ( not ( = ?auto_313674 ?auto_313678 ) ) ( not ( = ?auto_313674 ?auto_313679 ) ) ( not ( = ?auto_313675 ?auto_313676 ) ) ( not ( = ?auto_313675 ?auto_313677 ) ) ( not ( = ?auto_313675 ?auto_313678 ) ) ( not ( = ?auto_313675 ?auto_313679 ) ) ( not ( = ?auto_313676 ?auto_313677 ) ) ( not ( = ?auto_313676 ?auto_313678 ) ) ( not ( = ?auto_313676 ?auto_313679 ) ) ( not ( = ?auto_313677 ?auto_313678 ) ) ( not ( = ?auto_313677 ?auto_313679 ) ) ( not ( = ?auto_313678 ?auto_313679 ) ) ( ON ?auto_313677 ?auto_313678 ) ( CLEAR ?auto_313675 ) ( ON ?auto_313676 ?auto_313677 ) ( CLEAR ?auto_313676 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_313674 ?auto_313675 ?auto_313676 )
      ( MAKE-5PILE ?auto_313674 ?auto_313675 ?auto_313676 ?auto_313677 ?auto_313678 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_313685 - BLOCK
      ?auto_313686 - BLOCK
      ?auto_313687 - BLOCK
      ?auto_313688 - BLOCK
      ?auto_313689 - BLOCK
    )
    :vars
    (
      ?auto_313690 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_313689 ?auto_313690 ) ( ON-TABLE ?auto_313685 ) ( ON ?auto_313686 ?auto_313685 ) ( not ( = ?auto_313685 ?auto_313686 ) ) ( not ( = ?auto_313685 ?auto_313687 ) ) ( not ( = ?auto_313685 ?auto_313688 ) ) ( not ( = ?auto_313685 ?auto_313689 ) ) ( not ( = ?auto_313685 ?auto_313690 ) ) ( not ( = ?auto_313686 ?auto_313687 ) ) ( not ( = ?auto_313686 ?auto_313688 ) ) ( not ( = ?auto_313686 ?auto_313689 ) ) ( not ( = ?auto_313686 ?auto_313690 ) ) ( not ( = ?auto_313687 ?auto_313688 ) ) ( not ( = ?auto_313687 ?auto_313689 ) ) ( not ( = ?auto_313687 ?auto_313690 ) ) ( not ( = ?auto_313688 ?auto_313689 ) ) ( not ( = ?auto_313688 ?auto_313690 ) ) ( not ( = ?auto_313689 ?auto_313690 ) ) ( ON ?auto_313688 ?auto_313689 ) ( CLEAR ?auto_313686 ) ( ON ?auto_313687 ?auto_313688 ) ( CLEAR ?auto_313687 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_313685 ?auto_313686 ?auto_313687 )
      ( MAKE-5PILE ?auto_313685 ?auto_313686 ?auto_313687 ?auto_313688 ?auto_313689 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_313696 - BLOCK
      ?auto_313697 - BLOCK
      ?auto_313698 - BLOCK
      ?auto_313699 - BLOCK
      ?auto_313700 - BLOCK
    )
    :vars
    (
      ?auto_313701 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_313700 ?auto_313701 ) ( ON-TABLE ?auto_313696 ) ( not ( = ?auto_313696 ?auto_313697 ) ) ( not ( = ?auto_313696 ?auto_313698 ) ) ( not ( = ?auto_313696 ?auto_313699 ) ) ( not ( = ?auto_313696 ?auto_313700 ) ) ( not ( = ?auto_313696 ?auto_313701 ) ) ( not ( = ?auto_313697 ?auto_313698 ) ) ( not ( = ?auto_313697 ?auto_313699 ) ) ( not ( = ?auto_313697 ?auto_313700 ) ) ( not ( = ?auto_313697 ?auto_313701 ) ) ( not ( = ?auto_313698 ?auto_313699 ) ) ( not ( = ?auto_313698 ?auto_313700 ) ) ( not ( = ?auto_313698 ?auto_313701 ) ) ( not ( = ?auto_313699 ?auto_313700 ) ) ( not ( = ?auto_313699 ?auto_313701 ) ) ( not ( = ?auto_313700 ?auto_313701 ) ) ( ON ?auto_313699 ?auto_313700 ) ( ON ?auto_313698 ?auto_313699 ) ( CLEAR ?auto_313696 ) ( ON ?auto_313697 ?auto_313698 ) ( CLEAR ?auto_313697 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_313696 ?auto_313697 )
      ( MAKE-5PILE ?auto_313696 ?auto_313697 ?auto_313698 ?auto_313699 ?auto_313700 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_313707 - BLOCK
      ?auto_313708 - BLOCK
      ?auto_313709 - BLOCK
      ?auto_313710 - BLOCK
      ?auto_313711 - BLOCK
    )
    :vars
    (
      ?auto_313712 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_313711 ?auto_313712 ) ( ON-TABLE ?auto_313707 ) ( not ( = ?auto_313707 ?auto_313708 ) ) ( not ( = ?auto_313707 ?auto_313709 ) ) ( not ( = ?auto_313707 ?auto_313710 ) ) ( not ( = ?auto_313707 ?auto_313711 ) ) ( not ( = ?auto_313707 ?auto_313712 ) ) ( not ( = ?auto_313708 ?auto_313709 ) ) ( not ( = ?auto_313708 ?auto_313710 ) ) ( not ( = ?auto_313708 ?auto_313711 ) ) ( not ( = ?auto_313708 ?auto_313712 ) ) ( not ( = ?auto_313709 ?auto_313710 ) ) ( not ( = ?auto_313709 ?auto_313711 ) ) ( not ( = ?auto_313709 ?auto_313712 ) ) ( not ( = ?auto_313710 ?auto_313711 ) ) ( not ( = ?auto_313710 ?auto_313712 ) ) ( not ( = ?auto_313711 ?auto_313712 ) ) ( ON ?auto_313710 ?auto_313711 ) ( ON ?auto_313709 ?auto_313710 ) ( CLEAR ?auto_313707 ) ( ON ?auto_313708 ?auto_313709 ) ( CLEAR ?auto_313708 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_313707 ?auto_313708 )
      ( MAKE-5PILE ?auto_313707 ?auto_313708 ?auto_313709 ?auto_313710 ?auto_313711 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_313718 - BLOCK
      ?auto_313719 - BLOCK
      ?auto_313720 - BLOCK
      ?auto_313721 - BLOCK
      ?auto_313722 - BLOCK
    )
    :vars
    (
      ?auto_313723 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_313722 ?auto_313723 ) ( not ( = ?auto_313718 ?auto_313719 ) ) ( not ( = ?auto_313718 ?auto_313720 ) ) ( not ( = ?auto_313718 ?auto_313721 ) ) ( not ( = ?auto_313718 ?auto_313722 ) ) ( not ( = ?auto_313718 ?auto_313723 ) ) ( not ( = ?auto_313719 ?auto_313720 ) ) ( not ( = ?auto_313719 ?auto_313721 ) ) ( not ( = ?auto_313719 ?auto_313722 ) ) ( not ( = ?auto_313719 ?auto_313723 ) ) ( not ( = ?auto_313720 ?auto_313721 ) ) ( not ( = ?auto_313720 ?auto_313722 ) ) ( not ( = ?auto_313720 ?auto_313723 ) ) ( not ( = ?auto_313721 ?auto_313722 ) ) ( not ( = ?auto_313721 ?auto_313723 ) ) ( not ( = ?auto_313722 ?auto_313723 ) ) ( ON ?auto_313721 ?auto_313722 ) ( ON ?auto_313720 ?auto_313721 ) ( ON ?auto_313719 ?auto_313720 ) ( ON ?auto_313718 ?auto_313719 ) ( CLEAR ?auto_313718 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_313718 )
      ( MAKE-5PILE ?auto_313718 ?auto_313719 ?auto_313720 ?auto_313721 ?auto_313722 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_313729 - BLOCK
      ?auto_313730 - BLOCK
      ?auto_313731 - BLOCK
      ?auto_313732 - BLOCK
      ?auto_313733 - BLOCK
    )
    :vars
    (
      ?auto_313734 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_313733 ?auto_313734 ) ( not ( = ?auto_313729 ?auto_313730 ) ) ( not ( = ?auto_313729 ?auto_313731 ) ) ( not ( = ?auto_313729 ?auto_313732 ) ) ( not ( = ?auto_313729 ?auto_313733 ) ) ( not ( = ?auto_313729 ?auto_313734 ) ) ( not ( = ?auto_313730 ?auto_313731 ) ) ( not ( = ?auto_313730 ?auto_313732 ) ) ( not ( = ?auto_313730 ?auto_313733 ) ) ( not ( = ?auto_313730 ?auto_313734 ) ) ( not ( = ?auto_313731 ?auto_313732 ) ) ( not ( = ?auto_313731 ?auto_313733 ) ) ( not ( = ?auto_313731 ?auto_313734 ) ) ( not ( = ?auto_313732 ?auto_313733 ) ) ( not ( = ?auto_313732 ?auto_313734 ) ) ( not ( = ?auto_313733 ?auto_313734 ) ) ( ON ?auto_313732 ?auto_313733 ) ( ON ?auto_313731 ?auto_313732 ) ( ON ?auto_313730 ?auto_313731 ) ( ON ?auto_313729 ?auto_313730 ) ( CLEAR ?auto_313729 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_313729 )
      ( MAKE-5PILE ?auto_313729 ?auto_313730 ?auto_313731 ?auto_313732 ?auto_313733 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_313741 - BLOCK
      ?auto_313742 - BLOCK
      ?auto_313743 - BLOCK
      ?auto_313744 - BLOCK
      ?auto_313745 - BLOCK
      ?auto_313746 - BLOCK
    )
    :vars
    (
      ?auto_313747 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_313745 ) ( ON ?auto_313746 ?auto_313747 ) ( CLEAR ?auto_313746 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_313741 ) ( ON ?auto_313742 ?auto_313741 ) ( ON ?auto_313743 ?auto_313742 ) ( ON ?auto_313744 ?auto_313743 ) ( ON ?auto_313745 ?auto_313744 ) ( not ( = ?auto_313741 ?auto_313742 ) ) ( not ( = ?auto_313741 ?auto_313743 ) ) ( not ( = ?auto_313741 ?auto_313744 ) ) ( not ( = ?auto_313741 ?auto_313745 ) ) ( not ( = ?auto_313741 ?auto_313746 ) ) ( not ( = ?auto_313741 ?auto_313747 ) ) ( not ( = ?auto_313742 ?auto_313743 ) ) ( not ( = ?auto_313742 ?auto_313744 ) ) ( not ( = ?auto_313742 ?auto_313745 ) ) ( not ( = ?auto_313742 ?auto_313746 ) ) ( not ( = ?auto_313742 ?auto_313747 ) ) ( not ( = ?auto_313743 ?auto_313744 ) ) ( not ( = ?auto_313743 ?auto_313745 ) ) ( not ( = ?auto_313743 ?auto_313746 ) ) ( not ( = ?auto_313743 ?auto_313747 ) ) ( not ( = ?auto_313744 ?auto_313745 ) ) ( not ( = ?auto_313744 ?auto_313746 ) ) ( not ( = ?auto_313744 ?auto_313747 ) ) ( not ( = ?auto_313745 ?auto_313746 ) ) ( not ( = ?auto_313745 ?auto_313747 ) ) ( not ( = ?auto_313746 ?auto_313747 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_313746 ?auto_313747 )
      ( !STACK ?auto_313746 ?auto_313745 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_313754 - BLOCK
      ?auto_313755 - BLOCK
      ?auto_313756 - BLOCK
      ?auto_313757 - BLOCK
      ?auto_313758 - BLOCK
      ?auto_313759 - BLOCK
    )
    :vars
    (
      ?auto_313760 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_313758 ) ( ON ?auto_313759 ?auto_313760 ) ( CLEAR ?auto_313759 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_313754 ) ( ON ?auto_313755 ?auto_313754 ) ( ON ?auto_313756 ?auto_313755 ) ( ON ?auto_313757 ?auto_313756 ) ( ON ?auto_313758 ?auto_313757 ) ( not ( = ?auto_313754 ?auto_313755 ) ) ( not ( = ?auto_313754 ?auto_313756 ) ) ( not ( = ?auto_313754 ?auto_313757 ) ) ( not ( = ?auto_313754 ?auto_313758 ) ) ( not ( = ?auto_313754 ?auto_313759 ) ) ( not ( = ?auto_313754 ?auto_313760 ) ) ( not ( = ?auto_313755 ?auto_313756 ) ) ( not ( = ?auto_313755 ?auto_313757 ) ) ( not ( = ?auto_313755 ?auto_313758 ) ) ( not ( = ?auto_313755 ?auto_313759 ) ) ( not ( = ?auto_313755 ?auto_313760 ) ) ( not ( = ?auto_313756 ?auto_313757 ) ) ( not ( = ?auto_313756 ?auto_313758 ) ) ( not ( = ?auto_313756 ?auto_313759 ) ) ( not ( = ?auto_313756 ?auto_313760 ) ) ( not ( = ?auto_313757 ?auto_313758 ) ) ( not ( = ?auto_313757 ?auto_313759 ) ) ( not ( = ?auto_313757 ?auto_313760 ) ) ( not ( = ?auto_313758 ?auto_313759 ) ) ( not ( = ?auto_313758 ?auto_313760 ) ) ( not ( = ?auto_313759 ?auto_313760 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_313759 ?auto_313760 )
      ( !STACK ?auto_313759 ?auto_313758 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_313767 - BLOCK
      ?auto_313768 - BLOCK
      ?auto_313769 - BLOCK
      ?auto_313770 - BLOCK
      ?auto_313771 - BLOCK
      ?auto_313772 - BLOCK
    )
    :vars
    (
      ?auto_313773 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_313772 ?auto_313773 ) ( ON-TABLE ?auto_313767 ) ( ON ?auto_313768 ?auto_313767 ) ( ON ?auto_313769 ?auto_313768 ) ( ON ?auto_313770 ?auto_313769 ) ( not ( = ?auto_313767 ?auto_313768 ) ) ( not ( = ?auto_313767 ?auto_313769 ) ) ( not ( = ?auto_313767 ?auto_313770 ) ) ( not ( = ?auto_313767 ?auto_313771 ) ) ( not ( = ?auto_313767 ?auto_313772 ) ) ( not ( = ?auto_313767 ?auto_313773 ) ) ( not ( = ?auto_313768 ?auto_313769 ) ) ( not ( = ?auto_313768 ?auto_313770 ) ) ( not ( = ?auto_313768 ?auto_313771 ) ) ( not ( = ?auto_313768 ?auto_313772 ) ) ( not ( = ?auto_313768 ?auto_313773 ) ) ( not ( = ?auto_313769 ?auto_313770 ) ) ( not ( = ?auto_313769 ?auto_313771 ) ) ( not ( = ?auto_313769 ?auto_313772 ) ) ( not ( = ?auto_313769 ?auto_313773 ) ) ( not ( = ?auto_313770 ?auto_313771 ) ) ( not ( = ?auto_313770 ?auto_313772 ) ) ( not ( = ?auto_313770 ?auto_313773 ) ) ( not ( = ?auto_313771 ?auto_313772 ) ) ( not ( = ?auto_313771 ?auto_313773 ) ) ( not ( = ?auto_313772 ?auto_313773 ) ) ( CLEAR ?auto_313770 ) ( ON ?auto_313771 ?auto_313772 ) ( CLEAR ?auto_313771 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_313767 ?auto_313768 ?auto_313769 ?auto_313770 ?auto_313771 )
      ( MAKE-6PILE ?auto_313767 ?auto_313768 ?auto_313769 ?auto_313770 ?auto_313771 ?auto_313772 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_313780 - BLOCK
      ?auto_313781 - BLOCK
      ?auto_313782 - BLOCK
      ?auto_313783 - BLOCK
      ?auto_313784 - BLOCK
      ?auto_313785 - BLOCK
    )
    :vars
    (
      ?auto_313786 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_313785 ?auto_313786 ) ( ON-TABLE ?auto_313780 ) ( ON ?auto_313781 ?auto_313780 ) ( ON ?auto_313782 ?auto_313781 ) ( ON ?auto_313783 ?auto_313782 ) ( not ( = ?auto_313780 ?auto_313781 ) ) ( not ( = ?auto_313780 ?auto_313782 ) ) ( not ( = ?auto_313780 ?auto_313783 ) ) ( not ( = ?auto_313780 ?auto_313784 ) ) ( not ( = ?auto_313780 ?auto_313785 ) ) ( not ( = ?auto_313780 ?auto_313786 ) ) ( not ( = ?auto_313781 ?auto_313782 ) ) ( not ( = ?auto_313781 ?auto_313783 ) ) ( not ( = ?auto_313781 ?auto_313784 ) ) ( not ( = ?auto_313781 ?auto_313785 ) ) ( not ( = ?auto_313781 ?auto_313786 ) ) ( not ( = ?auto_313782 ?auto_313783 ) ) ( not ( = ?auto_313782 ?auto_313784 ) ) ( not ( = ?auto_313782 ?auto_313785 ) ) ( not ( = ?auto_313782 ?auto_313786 ) ) ( not ( = ?auto_313783 ?auto_313784 ) ) ( not ( = ?auto_313783 ?auto_313785 ) ) ( not ( = ?auto_313783 ?auto_313786 ) ) ( not ( = ?auto_313784 ?auto_313785 ) ) ( not ( = ?auto_313784 ?auto_313786 ) ) ( not ( = ?auto_313785 ?auto_313786 ) ) ( CLEAR ?auto_313783 ) ( ON ?auto_313784 ?auto_313785 ) ( CLEAR ?auto_313784 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_313780 ?auto_313781 ?auto_313782 ?auto_313783 ?auto_313784 )
      ( MAKE-6PILE ?auto_313780 ?auto_313781 ?auto_313782 ?auto_313783 ?auto_313784 ?auto_313785 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_313793 - BLOCK
      ?auto_313794 - BLOCK
      ?auto_313795 - BLOCK
      ?auto_313796 - BLOCK
      ?auto_313797 - BLOCK
      ?auto_313798 - BLOCK
    )
    :vars
    (
      ?auto_313799 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_313798 ?auto_313799 ) ( ON-TABLE ?auto_313793 ) ( ON ?auto_313794 ?auto_313793 ) ( ON ?auto_313795 ?auto_313794 ) ( not ( = ?auto_313793 ?auto_313794 ) ) ( not ( = ?auto_313793 ?auto_313795 ) ) ( not ( = ?auto_313793 ?auto_313796 ) ) ( not ( = ?auto_313793 ?auto_313797 ) ) ( not ( = ?auto_313793 ?auto_313798 ) ) ( not ( = ?auto_313793 ?auto_313799 ) ) ( not ( = ?auto_313794 ?auto_313795 ) ) ( not ( = ?auto_313794 ?auto_313796 ) ) ( not ( = ?auto_313794 ?auto_313797 ) ) ( not ( = ?auto_313794 ?auto_313798 ) ) ( not ( = ?auto_313794 ?auto_313799 ) ) ( not ( = ?auto_313795 ?auto_313796 ) ) ( not ( = ?auto_313795 ?auto_313797 ) ) ( not ( = ?auto_313795 ?auto_313798 ) ) ( not ( = ?auto_313795 ?auto_313799 ) ) ( not ( = ?auto_313796 ?auto_313797 ) ) ( not ( = ?auto_313796 ?auto_313798 ) ) ( not ( = ?auto_313796 ?auto_313799 ) ) ( not ( = ?auto_313797 ?auto_313798 ) ) ( not ( = ?auto_313797 ?auto_313799 ) ) ( not ( = ?auto_313798 ?auto_313799 ) ) ( ON ?auto_313797 ?auto_313798 ) ( CLEAR ?auto_313795 ) ( ON ?auto_313796 ?auto_313797 ) ( CLEAR ?auto_313796 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_313793 ?auto_313794 ?auto_313795 ?auto_313796 )
      ( MAKE-6PILE ?auto_313793 ?auto_313794 ?auto_313795 ?auto_313796 ?auto_313797 ?auto_313798 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_313806 - BLOCK
      ?auto_313807 - BLOCK
      ?auto_313808 - BLOCK
      ?auto_313809 - BLOCK
      ?auto_313810 - BLOCK
      ?auto_313811 - BLOCK
    )
    :vars
    (
      ?auto_313812 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_313811 ?auto_313812 ) ( ON-TABLE ?auto_313806 ) ( ON ?auto_313807 ?auto_313806 ) ( ON ?auto_313808 ?auto_313807 ) ( not ( = ?auto_313806 ?auto_313807 ) ) ( not ( = ?auto_313806 ?auto_313808 ) ) ( not ( = ?auto_313806 ?auto_313809 ) ) ( not ( = ?auto_313806 ?auto_313810 ) ) ( not ( = ?auto_313806 ?auto_313811 ) ) ( not ( = ?auto_313806 ?auto_313812 ) ) ( not ( = ?auto_313807 ?auto_313808 ) ) ( not ( = ?auto_313807 ?auto_313809 ) ) ( not ( = ?auto_313807 ?auto_313810 ) ) ( not ( = ?auto_313807 ?auto_313811 ) ) ( not ( = ?auto_313807 ?auto_313812 ) ) ( not ( = ?auto_313808 ?auto_313809 ) ) ( not ( = ?auto_313808 ?auto_313810 ) ) ( not ( = ?auto_313808 ?auto_313811 ) ) ( not ( = ?auto_313808 ?auto_313812 ) ) ( not ( = ?auto_313809 ?auto_313810 ) ) ( not ( = ?auto_313809 ?auto_313811 ) ) ( not ( = ?auto_313809 ?auto_313812 ) ) ( not ( = ?auto_313810 ?auto_313811 ) ) ( not ( = ?auto_313810 ?auto_313812 ) ) ( not ( = ?auto_313811 ?auto_313812 ) ) ( ON ?auto_313810 ?auto_313811 ) ( CLEAR ?auto_313808 ) ( ON ?auto_313809 ?auto_313810 ) ( CLEAR ?auto_313809 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_313806 ?auto_313807 ?auto_313808 ?auto_313809 )
      ( MAKE-6PILE ?auto_313806 ?auto_313807 ?auto_313808 ?auto_313809 ?auto_313810 ?auto_313811 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_313819 - BLOCK
      ?auto_313820 - BLOCK
      ?auto_313821 - BLOCK
      ?auto_313822 - BLOCK
      ?auto_313823 - BLOCK
      ?auto_313824 - BLOCK
    )
    :vars
    (
      ?auto_313825 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_313824 ?auto_313825 ) ( ON-TABLE ?auto_313819 ) ( ON ?auto_313820 ?auto_313819 ) ( not ( = ?auto_313819 ?auto_313820 ) ) ( not ( = ?auto_313819 ?auto_313821 ) ) ( not ( = ?auto_313819 ?auto_313822 ) ) ( not ( = ?auto_313819 ?auto_313823 ) ) ( not ( = ?auto_313819 ?auto_313824 ) ) ( not ( = ?auto_313819 ?auto_313825 ) ) ( not ( = ?auto_313820 ?auto_313821 ) ) ( not ( = ?auto_313820 ?auto_313822 ) ) ( not ( = ?auto_313820 ?auto_313823 ) ) ( not ( = ?auto_313820 ?auto_313824 ) ) ( not ( = ?auto_313820 ?auto_313825 ) ) ( not ( = ?auto_313821 ?auto_313822 ) ) ( not ( = ?auto_313821 ?auto_313823 ) ) ( not ( = ?auto_313821 ?auto_313824 ) ) ( not ( = ?auto_313821 ?auto_313825 ) ) ( not ( = ?auto_313822 ?auto_313823 ) ) ( not ( = ?auto_313822 ?auto_313824 ) ) ( not ( = ?auto_313822 ?auto_313825 ) ) ( not ( = ?auto_313823 ?auto_313824 ) ) ( not ( = ?auto_313823 ?auto_313825 ) ) ( not ( = ?auto_313824 ?auto_313825 ) ) ( ON ?auto_313823 ?auto_313824 ) ( ON ?auto_313822 ?auto_313823 ) ( CLEAR ?auto_313820 ) ( ON ?auto_313821 ?auto_313822 ) ( CLEAR ?auto_313821 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_313819 ?auto_313820 ?auto_313821 )
      ( MAKE-6PILE ?auto_313819 ?auto_313820 ?auto_313821 ?auto_313822 ?auto_313823 ?auto_313824 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_313832 - BLOCK
      ?auto_313833 - BLOCK
      ?auto_313834 - BLOCK
      ?auto_313835 - BLOCK
      ?auto_313836 - BLOCK
      ?auto_313837 - BLOCK
    )
    :vars
    (
      ?auto_313838 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_313837 ?auto_313838 ) ( ON-TABLE ?auto_313832 ) ( ON ?auto_313833 ?auto_313832 ) ( not ( = ?auto_313832 ?auto_313833 ) ) ( not ( = ?auto_313832 ?auto_313834 ) ) ( not ( = ?auto_313832 ?auto_313835 ) ) ( not ( = ?auto_313832 ?auto_313836 ) ) ( not ( = ?auto_313832 ?auto_313837 ) ) ( not ( = ?auto_313832 ?auto_313838 ) ) ( not ( = ?auto_313833 ?auto_313834 ) ) ( not ( = ?auto_313833 ?auto_313835 ) ) ( not ( = ?auto_313833 ?auto_313836 ) ) ( not ( = ?auto_313833 ?auto_313837 ) ) ( not ( = ?auto_313833 ?auto_313838 ) ) ( not ( = ?auto_313834 ?auto_313835 ) ) ( not ( = ?auto_313834 ?auto_313836 ) ) ( not ( = ?auto_313834 ?auto_313837 ) ) ( not ( = ?auto_313834 ?auto_313838 ) ) ( not ( = ?auto_313835 ?auto_313836 ) ) ( not ( = ?auto_313835 ?auto_313837 ) ) ( not ( = ?auto_313835 ?auto_313838 ) ) ( not ( = ?auto_313836 ?auto_313837 ) ) ( not ( = ?auto_313836 ?auto_313838 ) ) ( not ( = ?auto_313837 ?auto_313838 ) ) ( ON ?auto_313836 ?auto_313837 ) ( ON ?auto_313835 ?auto_313836 ) ( CLEAR ?auto_313833 ) ( ON ?auto_313834 ?auto_313835 ) ( CLEAR ?auto_313834 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_313832 ?auto_313833 ?auto_313834 )
      ( MAKE-6PILE ?auto_313832 ?auto_313833 ?auto_313834 ?auto_313835 ?auto_313836 ?auto_313837 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_313845 - BLOCK
      ?auto_313846 - BLOCK
      ?auto_313847 - BLOCK
      ?auto_313848 - BLOCK
      ?auto_313849 - BLOCK
      ?auto_313850 - BLOCK
    )
    :vars
    (
      ?auto_313851 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_313850 ?auto_313851 ) ( ON-TABLE ?auto_313845 ) ( not ( = ?auto_313845 ?auto_313846 ) ) ( not ( = ?auto_313845 ?auto_313847 ) ) ( not ( = ?auto_313845 ?auto_313848 ) ) ( not ( = ?auto_313845 ?auto_313849 ) ) ( not ( = ?auto_313845 ?auto_313850 ) ) ( not ( = ?auto_313845 ?auto_313851 ) ) ( not ( = ?auto_313846 ?auto_313847 ) ) ( not ( = ?auto_313846 ?auto_313848 ) ) ( not ( = ?auto_313846 ?auto_313849 ) ) ( not ( = ?auto_313846 ?auto_313850 ) ) ( not ( = ?auto_313846 ?auto_313851 ) ) ( not ( = ?auto_313847 ?auto_313848 ) ) ( not ( = ?auto_313847 ?auto_313849 ) ) ( not ( = ?auto_313847 ?auto_313850 ) ) ( not ( = ?auto_313847 ?auto_313851 ) ) ( not ( = ?auto_313848 ?auto_313849 ) ) ( not ( = ?auto_313848 ?auto_313850 ) ) ( not ( = ?auto_313848 ?auto_313851 ) ) ( not ( = ?auto_313849 ?auto_313850 ) ) ( not ( = ?auto_313849 ?auto_313851 ) ) ( not ( = ?auto_313850 ?auto_313851 ) ) ( ON ?auto_313849 ?auto_313850 ) ( ON ?auto_313848 ?auto_313849 ) ( ON ?auto_313847 ?auto_313848 ) ( CLEAR ?auto_313845 ) ( ON ?auto_313846 ?auto_313847 ) ( CLEAR ?auto_313846 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_313845 ?auto_313846 )
      ( MAKE-6PILE ?auto_313845 ?auto_313846 ?auto_313847 ?auto_313848 ?auto_313849 ?auto_313850 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_313858 - BLOCK
      ?auto_313859 - BLOCK
      ?auto_313860 - BLOCK
      ?auto_313861 - BLOCK
      ?auto_313862 - BLOCK
      ?auto_313863 - BLOCK
    )
    :vars
    (
      ?auto_313864 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_313863 ?auto_313864 ) ( ON-TABLE ?auto_313858 ) ( not ( = ?auto_313858 ?auto_313859 ) ) ( not ( = ?auto_313858 ?auto_313860 ) ) ( not ( = ?auto_313858 ?auto_313861 ) ) ( not ( = ?auto_313858 ?auto_313862 ) ) ( not ( = ?auto_313858 ?auto_313863 ) ) ( not ( = ?auto_313858 ?auto_313864 ) ) ( not ( = ?auto_313859 ?auto_313860 ) ) ( not ( = ?auto_313859 ?auto_313861 ) ) ( not ( = ?auto_313859 ?auto_313862 ) ) ( not ( = ?auto_313859 ?auto_313863 ) ) ( not ( = ?auto_313859 ?auto_313864 ) ) ( not ( = ?auto_313860 ?auto_313861 ) ) ( not ( = ?auto_313860 ?auto_313862 ) ) ( not ( = ?auto_313860 ?auto_313863 ) ) ( not ( = ?auto_313860 ?auto_313864 ) ) ( not ( = ?auto_313861 ?auto_313862 ) ) ( not ( = ?auto_313861 ?auto_313863 ) ) ( not ( = ?auto_313861 ?auto_313864 ) ) ( not ( = ?auto_313862 ?auto_313863 ) ) ( not ( = ?auto_313862 ?auto_313864 ) ) ( not ( = ?auto_313863 ?auto_313864 ) ) ( ON ?auto_313862 ?auto_313863 ) ( ON ?auto_313861 ?auto_313862 ) ( ON ?auto_313860 ?auto_313861 ) ( CLEAR ?auto_313858 ) ( ON ?auto_313859 ?auto_313860 ) ( CLEAR ?auto_313859 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_313858 ?auto_313859 )
      ( MAKE-6PILE ?auto_313858 ?auto_313859 ?auto_313860 ?auto_313861 ?auto_313862 ?auto_313863 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_313871 - BLOCK
      ?auto_313872 - BLOCK
      ?auto_313873 - BLOCK
      ?auto_313874 - BLOCK
      ?auto_313875 - BLOCK
      ?auto_313876 - BLOCK
    )
    :vars
    (
      ?auto_313877 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_313876 ?auto_313877 ) ( not ( = ?auto_313871 ?auto_313872 ) ) ( not ( = ?auto_313871 ?auto_313873 ) ) ( not ( = ?auto_313871 ?auto_313874 ) ) ( not ( = ?auto_313871 ?auto_313875 ) ) ( not ( = ?auto_313871 ?auto_313876 ) ) ( not ( = ?auto_313871 ?auto_313877 ) ) ( not ( = ?auto_313872 ?auto_313873 ) ) ( not ( = ?auto_313872 ?auto_313874 ) ) ( not ( = ?auto_313872 ?auto_313875 ) ) ( not ( = ?auto_313872 ?auto_313876 ) ) ( not ( = ?auto_313872 ?auto_313877 ) ) ( not ( = ?auto_313873 ?auto_313874 ) ) ( not ( = ?auto_313873 ?auto_313875 ) ) ( not ( = ?auto_313873 ?auto_313876 ) ) ( not ( = ?auto_313873 ?auto_313877 ) ) ( not ( = ?auto_313874 ?auto_313875 ) ) ( not ( = ?auto_313874 ?auto_313876 ) ) ( not ( = ?auto_313874 ?auto_313877 ) ) ( not ( = ?auto_313875 ?auto_313876 ) ) ( not ( = ?auto_313875 ?auto_313877 ) ) ( not ( = ?auto_313876 ?auto_313877 ) ) ( ON ?auto_313875 ?auto_313876 ) ( ON ?auto_313874 ?auto_313875 ) ( ON ?auto_313873 ?auto_313874 ) ( ON ?auto_313872 ?auto_313873 ) ( ON ?auto_313871 ?auto_313872 ) ( CLEAR ?auto_313871 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_313871 )
      ( MAKE-6PILE ?auto_313871 ?auto_313872 ?auto_313873 ?auto_313874 ?auto_313875 ?auto_313876 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_313884 - BLOCK
      ?auto_313885 - BLOCK
      ?auto_313886 - BLOCK
      ?auto_313887 - BLOCK
      ?auto_313888 - BLOCK
      ?auto_313889 - BLOCK
    )
    :vars
    (
      ?auto_313890 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_313889 ?auto_313890 ) ( not ( = ?auto_313884 ?auto_313885 ) ) ( not ( = ?auto_313884 ?auto_313886 ) ) ( not ( = ?auto_313884 ?auto_313887 ) ) ( not ( = ?auto_313884 ?auto_313888 ) ) ( not ( = ?auto_313884 ?auto_313889 ) ) ( not ( = ?auto_313884 ?auto_313890 ) ) ( not ( = ?auto_313885 ?auto_313886 ) ) ( not ( = ?auto_313885 ?auto_313887 ) ) ( not ( = ?auto_313885 ?auto_313888 ) ) ( not ( = ?auto_313885 ?auto_313889 ) ) ( not ( = ?auto_313885 ?auto_313890 ) ) ( not ( = ?auto_313886 ?auto_313887 ) ) ( not ( = ?auto_313886 ?auto_313888 ) ) ( not ( = ?auto_313886 ?auto_313889 ) ) ( not ( = ?auto_313886 ?auto_313890 ) ) ( not ( = ?auto_313887 ?auto_313888 ) ) ( not ( = ?auto_313887 ?auto_313889 ) ) ( not ( = ?auto_313887 ?auto_313890 ) ) ( not ( = ?auto_313888 ?auto_313889 ) ) ( not ( = ?auto_313888 ?auto_313890 ) ) ( not ( = ?auto_313889 ?auto_313890 ) ) ( ON ?auto_313888 ?auto_313889 ) ( ON ?auto_313887 ?auto_313888 ) ( ON ?auto_313886 ?auto_313887 ) ( ON ?auto_313885 ?auto_313886 ) ( ON ?auto_313884 ?auto_313885 ) ( CLEAR ?auto_313884 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_313884 )
      ( MAKE-6PILE ?auto_313884 ?auto_313885 ?auto_313886 ?auto_313887 ?auto_313888 ?auto_313889 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_313898 - BLOCK
      ?auto_313899 - BLOCK
      ?auto_313900 - BLOCK
      ?auto_313901 - BLOCK
      ?auto_313902 - BLOCK
      ?auto_313903 - BLOCK
      ?auto_313904 - BLOCK
    )
    :vars
    (
      ?auto_313905 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_313903 ) ( ON ?auto_313904 ?auto_313905 ) ( CLEAR ?auto_313904 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_313898 ) ( ON ?auto_313899 ?auto_313898 ) ( ON ?auto_313900 ?auto_313899 ) ( ON ?auto_313901 ?auto_313900 ) ( ON ?auto_313902 ?auto_313901 ) ( ON ?auto_313903 ?auto_313902 ) ( not ( = ?auto_313898 ?auto_313899 ) ) ( not ( = ?auto_313898 ?auto_313900 ) ) ( not ( = ?auto_313898 ?auto_313901 ) ) ( not ( = ?auto_313898 ?auto_313902 ) ) ( not ( = ?auto_313898 ?auto_313903 ) ) ( not ( = ?auto_313898 ?auto_313904 ) ) ( not ( = ?auto_313898 ?auto_313905 ) ) ( not ( = ?auto_313899 ?auto_313900 ) ) ( not ( = ?auto_313899 ?auto_313901 ) ) ( not ( = ?auto_313899 ?auto_313902 ) ) ( not ( = ?auto_313899 ?auto_313903 ) ) ( not ( = ?auto_313899 ?auto_313904 ) ) ( not ( = ?auto_313899 ?auto_313905 ) ) ( not ( = ?auto_313900 ?auto_313901 ) ) ( not ( = ?auto_313900 ?auto_313902 ) ) ( not ( = ?auto_313900 ?auto_313903 ) ) ( not ( = ?auto_313900 ?auto_313904 ) ) ( not ( = ?auto_313900 ?auto_313905 ) ) ( not ( = ?auto_313901 ?auto_313902 ) ) ( not ( = ?auto_313901 ?auto_313903 ) ) ( not ( = ?auto_313901 ?auto_313904 ) ) ( not ( = ?auto_313901 ?auto_313905 ) ) ( not ( = ?auto_313902 ?auto_313903 ) ) ( not ( = ?auto_313902 ?auto_313904 ) ) ( not ( = ?auto_313902 ?auto_313905 ) ) ( not ( = ?auto_313903 ?auto_313904 ) ) ( not ( = ?auto_313903 ?auto_313905 ) ) ( not ( = ?auto_313904 ?auto_313905 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_313904 ?auto_313905 )
      ( !STACK ?auto_313904 ?auto_313903 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_313913 - BLOCK
      ?auto_313914 - BLOCK
      ?auto_313915 - BLOCK
      ?auto_313916 - BLOCK
      ?auto_313917 - BLOCK
      ?auto_313918 - BLOCK
      ?auto_313919 - BLOCK
    )
    :vars
    (
      ?auto_313920 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_313918 ) ( ON ?auto_313919 ?auto_313920 ) ( CLEAR ?auto_313919 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_313913 ) ( ON ?auto_313914 ?auto_313913 ) ( ON ?auto_313915 ?auto_313914 ) ( ON ?auto_313916 ?auto_313915 ) ( ON ?auto_313917 ?auto_313916 ) ( ON ?auto_313918 ?auto_313917 ) ( not ( = ?auto_313913 ?auto_313914 ) ) ( not ( = ?auto_313913 ?auto_313915 ) ) ( not ( = ?auto_313913 ?auto_313916 ) ) ( not ( = ?auto_313913 ?auto_313917 ) ) ( not ( = ?auto_313913 ?auto_313918 ) ) ( not ( = ?auto_313913 ?auto_313919 ) ) ( not ( = ?auto_313913 ?auto_313920 ) ) ( not ( = ?auto_313914 ?auto_313915 ) ) ( not ( = ?auto_313914 ?auto_313916 ) ) ( not ( = ?auto_313914 ?auto_313917 ) ) ( not ( = ?auto_313914 ?auto_313918 ) ) ( not ( = ?auto_313914 ?auto_313919 ) ) ( not ( = ?auto_313914 ?auto_313920 ) ) ( not ( = ?auto_313915 ?auto_313916 ) ) ( not ( = ?auto_313915 ?auto_313917 ) ) ( not ( = ?auto_313915 ?auto_313918 ) ) ( not ( = ?auto_313915 ?auto_313919 ) ) ( not ( = ?auto_313915 ?auto_313920 ) ) ( not ( = ?auto_313916 ?auto_313917 ) ) ( not ( = ?auto_313916 ?auto_313918 ) ) ( not ( = ?auto_313916 ?auto_313919 ) ) ( not ( = ?auto_313916 ?auto_313920 ) ) ( not ( = ?auto_313917 ?auto_313918 ) ) ( not ( = ?auto_313917 ?auto_313919 ) ) ( not ( = ?auto_313917 ?auto_313920 ) ) ( not ( = ?auto_313918 ?auto_313919 ) ) ( not ( = ?auto_313918 ?auto_313920 ) ) ( not ( = ?auto_313919 ?auto_313920 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_313919 ?auto_313920 )
      ( !STACK ?auto_313919 ?auto_313918 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_313928 - BLOCK
      ?auto_313929 - BLOCK
      ?auto_313930 - BLOCK
      ?auto_313931 - BLOCK
      ?auto_313932 - BLOCK
      ?auto_313933 - BLOCK
      ?auto_313934 - BLOCK
    )
    :vars
    (
      ?auto_313935 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_313934 ?auto_313935 ) ( ON-TABLE ?auto_313928 ) ( ON ?auto_313929 ?auto_313928 ) ( ON ?auto_313930 ?auto_313929 ) ( ON ?auto_313931 ?auto_313930 ) ( ON ?auto_313932 ?auto_313931 ) ( not ( = ?auto_313928 ?auto_313929 ) ) ( not ( = ?auto_313928 ?auto_313930 ) ) ( not ( = ?auto_313928 ?auto_313931 ) ) ( not ( = ?auto_313928 ?auto_313932 ) ) ( not ( = ?auto_313928 ?auto_313933 ) ) ( not ( = ?auto_313928 ?auto_313934 ) ) ( not ( = ?auto_313928 ?auto_313935 ) ) ( not ( = ?auto_313929 ?auto_313930 ) ) ( not ( = ?auto_313929 ?auto_313931 ) ) ( not ( = ?auto_313929 ?auto_313932 ) ) ( not ( = ?auto_313929 ?auto_313933 ) ) ( not ( = ?auto_313929 ?auto_313934 ) ) ( not ( = ?auto_313929 ?auto_313935 ) ) ( not ( = ?auto_313930 ?auto_313931 ) ) ( not ( = ?auto_313930 ?auto_313932 ) ) ( not ( = ?auto_313930 ?auto_313933 ) ) ( not ( = ?auto_313930 ?auto_313934 ) ) ( not ( = ?auto_313930 ?auto_313935 ) ) ( not ( = ?auto_313931 ?auto_313932 ) ) ( not ( = ?auto_313931 ?auto_313933 ) ) ( not ( = ?auto_313931 ?auto_313934 ) ) ( not ( = ?auto_313931 ?auto_313935 ) ) ( not ( = ?auto_313932 ?auto_313933 ) ) ( not ( = ?auto_313932 ?auto_313934 ) ) ( not ( = ?auto_313932 ?auto_313935 ) ) ( not ( = ?auto_313933 ?auto_313934 ) ) ( not ( = ?auto_313933 ?auto_313935 ) ) ( not ( = ?auto_313934 ?auto_313935 ) ) ( CLEAR ?auto_313932 ) ( ON ?auto_313933 ?auto_313934 ) ( CLEAR ?auto_313933 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_313928 ?auto_313929 ?auto_313930 ?auto_313931 ?auto_313932 ?auto_313933 )
      ( MAKE-7PILE ?auto_313928 ?auto_313929 ?auto_313930 ?auto_313931 ?auto_313932 ?auto_313933 ?auto_313934 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_313943 - BLOCK
      ?auto_313944 - BLOCK
      ?auto_313945 - BLOCK
      ?auto_313946 - BLOCK
      ?auto_313947 - BLOCK
      ?auto_313948 - BLOCK
      ?auto_313949 - BLOCK
    )
    :vars
    (
      ?auto_313950 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_313949 ?auto_313950 ) ( ON-TABLE ?auto_313943 ) ( ON ?auto_313944 ?auto_313943 ) ( ON ?auto_313945 ?auto_313944 ) ( ON ?auto_313946 ?auto_313945 ) ( ON ?auto_313947 ?auto_313946 ) ( not ( = ?auto_313943 ?auto_313944 ) ) ( not ( = ?auto_313943 ?auto_313945 ) ) ( not ( = ?auto_313943 ?auto_313946 ) ) ( not ( = ?auto_313943 ?auto_313947 ) ) ( not ( = ?auto_313943 ?auto_313948 ) ) ( not ( = ?auto_313943 ?auto_313949 ) ) ( not ( = ?auto_313943 ?auto_313950 ) ) ( not ( = ?auto_313944 ?auto_313945 ) ) ( not ( = ?auto_313944 ?auto_313946 ) ) ( not ( = ?auto_313944 ?auto_313947 ) ) ( not ( = ?auto_313944 ?auto_313948 ) ) ( not ( = ?auto_313944 ?auto_313949 ) ) ( not ( = ?auto_313944 ?auto_313950 ) ) ( not ( = ?auto_313945 ?auto_313946 ) ) ( not ( = ?auto_313945 ?auto_313947 ) ) ( not ( = ?auto_313945 ?auto_313948 ) ) ( not ( = ?auto_313945 ?auto_313949 ) ) ( not ( = ?auto_313945 ?auto_313950 ) ) ( not ( = ?auto_313946 ?auto_313947 ) ) ( not ( = ?auto_313946 ?auto_313948 ) ) ( not ( = ?auto_313946 ?auto_313949 ) ) ( not ( = ?auto_313946 ?auto_313950 ) ) ( not ( = ?auto_313947 ?auto_313948 ) ) ( not ( = ?auto_313947 ?auto_313949 ) ) ( not ( = ?auto_313947 ?auto_313950 ) ) ( not ( = ?auto_313948 ?auto_313949 ) ) ( not ( = ?auto_313948 ?auto_313950 ) ) ( not ( = ?auto_313949 ?auto_313950 ) ) ( CLEAR ?auto_313947 ) ( ON ?auto_313948 ?auto_313949 ) ( CLEAR ?auto_313948 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_313943 ?auto_313944 ?auto_313945 ?auto_313946 ?auto_313947 ?auto_313948 )
      ( MAKE-7PILE ?auto_313943 ?auto_313944 ?auto_313945 ?auto_313946 ?auto_313947 ?auto_313948 ?auto_313949 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_313958 - BLOCK
      ?auto_313959 - BLOCK
      ?auto_313960 - BLOCK
      ?auto_313961 - BLOCK
      ?auto_313962 - BLOCK
      ?auto_313963 - BLOCK
      ?auto_313964 - BLOCK
    )
    :vars
    (
      ?auto_313965 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_313964 ?auto_313965 ) ( ON-TABLE ?auto_313958 ) ( ON ?auto_313959 ?auto_313958 ) ( ON ?auto_313960 ?auto_313959 ) ( ON ?auto_313961 ?auto_313960 ) ( not ( = ?auto_313958 ?auto_313959 ) ) ( not ( = ?auto_313958 ?auto_313960 ) ) ( not ( = ?auto_313958 ?auto_313961 ) ) ( not ( = ?auto_313958 ?auto_313962 ) ) ( not ( = ?auto_313958 ?auto_313963 ) ) ( not ( = ?auto_313958 ?auto_313964 ) ) ( not ( = ?auto_313958 ?auto_313965 ) ) ( not ( = ?auto_313959 ?auto_313960 ) ) ( not ( = ?auto_313959 ?auto_313961 ) ) ( not ( = ?auto_313959 ?auto_313962 ) ) ( not ( = ?auto_313959 ?auto_313963 ) ) ( not ( = ?auto_313959 ?auto_313964 ) ) ( not ( = ?auto_313959 ?auto_313965 ) ) ( not ( = ?auto_313960 ?auto_313961 ) ) ( not ( = ?auto_313960 ?auto_313962 ) ) ( not ( = ?auto_313960 ?auto_313963 ) ) ( not ( = ?auto_313960 ?auto_313964 ) ) ( not ( = ?auto_313960 ?auto_313965 ) ) ( not ( = ?auto_313961 ?auto_313962 ) ) ( not ( = ?auto_313961 ?auto_313963 ) ) ( not ( = ?auto_313961 ?auto_313964 ) ) ( not ( = ?auto_313961 ?auto_313965 ) ) ( not ( = ?auto_313962 ?auto_313963 ) ) ( not ( = ?auto_313962 ?auto_313964 ) ) ( not ( = ?auto_313962 ?auto_313965 ) ) ( not ( = ?auto_313963 ?auto_313964 ) ) ( not ( = ?auto_313963 ?auto_313965 ) ) ( not ( = ?auto_313964 ?auto_313965 ) ) ( ON ?auto_313963 ?auto_313964 ) ( CLEAR ?auto_313961 ) ( ON ?auto_313962 ?auto_313963 ) ( CLEAR ?auto_313962 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_313958 ?auto_313959 ?auto_313960 ?auto_313961 ?auto_313962 )
      ( MAKE-7PILE ?auto_313958 ?auto_313959 ?auto_313960 ?auto_313961 ?auto_313962 ?auto_313963 ?auto_313964 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_313973 - BLOCK
      ?auto_313974 - BLOCK
      ?auto_313975 - BLOCK
      ?auto_313976 - BLOCK
      ?auto_313977 - BLOCK
      ?auto_313978 - BLOCK
      ?auto_313979 - BLOCK
    )
    :vars
    (
      ?auto_313980 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_313979 ?auto_313980 ) ( ON-TABLE ?auto_313973 ) ( ON ?auto_313974 ?auto_313973 ) ( ON ?auto_313975 ?auto_313974 ) ( ON ?auto_313976 ?auto_313975 ) ( not ( = ?auto_313973 ?auto_313974 ) ) ( not ( = ?auto_313973 ?auto_313975 ) ) ( not ( = ?auto_313973 ?auto_313976 ) ) ( not ( = ?auto_313973 ?auto_313977 ) ) ( not ( = ?auto_313973 ?auto_313978 ) ) ( not ( = ?auto_313973 ?auto_313979 ) ) ( not ( = ?auto_313973 ?auto_313980 ) ) ( not ( = ?auto_313974 ?auto_313975 ) ) ( not ( = ?auto_313974 ?auto_313976 ) ) ( not ( = ?auto_313974 ?auto_313977 ) ) ( not ( = ?auto_313974 ?auto_313978 ) ) ( not ( = ?auto_313974 ?auto_313979 ) ) ( not ( = ?auto_313974 ?auto_313980 ) ) ( not ( = ?auto_313975 ?auto_313976 ) ) ( not ( = ?auto_313975 ?auto_313977 ) ) ( not ( = ?auto_313975 ?auto_313978 ) ) ( not ( = ?auto_313975 ?auto_313979 ) ) ( not ( = ?auto_313975 ?auto_313980 ) ) ( not ( = ?auto_313976 ?auto_313977 ) ) ( not ( = ?auto_313976 ?auto_313978 ) ) ( not ( = ?auto_313976 ?auto_313979 ) ) ( not ( = ?auto_313976 ?auto_313980 ) ) ( not ( = ?auto_313977 ?auto_313978 ) ) ( not ( = ?auto_313977 ?auto_313979 ) ) ( not ( = ?auto_313977 ?auto_313980 ) ) ( not ( = ?auto_313978 ?auto_313979 ) ) ( not ( = ?auto_313978 ?auto_313980 ) ) ( not ( = ?auto_313979 ?auto_313980 ) ) ( ON ?auto_313978 ?auto_313979 ) ( CLEAR ?auto_313976 ) ( ON ?auto_313977 ?auto_313978 ) ( CLEAR ?auto_313977 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_313973 ?auto_313974 ?auto_313975 ?auto_313976 ?auto_313977 )
      ( MAKE-7PILE ?auto_313973 ?auto_313974 ?auto_313975 ?auto_313976 ?auto_313977 ?auto_313978 ?auto_313979 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_313988 - BLOCK
      ?auto_313989 - BLOCK
      ?auto_313990 - BLOCK
      ?auto_313991 - BLOCK
      ?auto_313992 - BLOCK
      ?auto_313993 - BLOCK
      ?auto_313994 - BLOCK
    )
    :vars
    (
      ?auto_313995 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_313994 ?auto_313995 ) ( ON-TABLE ?auto_313988 ) ( ON ?auto_313989 ?auto_313988 ) ( ON ?auto_313990 ?auto_313989 ) ( not ( = ?auto_313988 ?auto_313989 ) ) ( not ( = ?auto_313988 ?auto_313990 ) ) ( not ( = ?auto_313988 ?auto_313991 ) ) ( not ( = ?auto_313988 ?auto_313992 ) ) ( not ( = ?auto_313988 ?auto_313993 ) ) ( not ( = ?auto_313988 ?auto_313994 ) ) ( not ( = ?auto_313988 ?auto_313995 ) ) ( not ( = ?auto_313989 ?auto_313990 ) ) ( not ( = ?auto_313989 ?auto_313991 ) ) ( not ( = ?auto_313989 ?auto_313992 ) ) ( not ( = ?auto_313989 ?auto_313993 ) ) ( not ( = ?auto_313989 ?auto_313994 ) ) ( not ( = ?auto_313989 ?auto_313995 ) ) ( not ( = ?auto_313990 ?auto_313991 ) ) ( not ( = ?auto_313990 ?auto_313992 ) ) ( not ( = ?auto_313990 ?auto_313993 ) ) ( not ( = ?auto_313990 ?auto_313994 ) ) ( not ( = ?auto_313990 ?auto_313995 ) ) ( not ( = ?auto_313991 ?auto_313992 ) ) ( not ( = ?auto_313991 ?auto_313993 ) ) ( not ( = ?auto_313991 ?auto_313994 ) ) ( not ( = ?auto_313991 ?auto_313995 ) ) ( not ( = ?auto_313992 ?auto_313993 ) ) ( not ( = ?auto_313992 ?auto_313994 ) ) ( not ( = ?auto_313992 ?auto_313995 ) ) ( not ( = ?auto_313993 ?auto_313994 ) ) ( not ( = ?auto_313993 ?auto_313995 ) ) ( not ( = ?auto_313994 ?auto_313995 ) ) ( ON ?auto_313993 ?auto_313994 ) ( ON ?auto_313992 ?auto_313993 ) ( CLEAR ?auto_313990 ) ( ON ?auto_313991 ?auto_313992 ) ( CLEAR ?auto_313991 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_313988 ?auto_313989 ?auto_313990 ?auto_313991 )
      ( MAKE-7PILE ?auto_313988 ?auto_313989 ?auto_313990 ?auto_313991 ?auto_313992 ?auto_313993 ?auto_313994 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_314003 - BLOCK
      ?auto_314004 - BLOCK
      ?auto_314005 - BLOCK
      ?auto_314006 - BLOCK
      ?auto_314007 - BLOCK
      ?auto_314008 - BLOCK
      ?auto_314009 - BLOCK
    )
    :vars
    (
      ?auto_314010 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_314009 ?auto_314010 ) ( ON-TABLE ?auto_314003 ) ( ON ?auto_314004 ?auto_314003 ) ( ON ?auto_314005 ?auto_314004 ) ( not ( = ?auto_314003 ?auto_314004 ) ) ( not ( = ?auto_314003 ?auto_314005 ) ) ( not ( = ?auto_314003 ?auto_314006 ) ) ( not ( = ?auto_314003 ?auto_314007 ) ) ( not ( = ?auto_314003 ?auto_314008 ) ) ( not ( = ?auto_314003 ?auto_314009 ) ) ( not ( = ?auto_314003 ?auto_314010 ) ) ( not ( = ?auto_314004 ?auto_314005 ) ) ( not ( = ?auto_314004 ?auto_314006 ) ) ( not ( = ?auto_314004 ?auto_314007 ) ) ( not ( = ?auto_314004 ?auto_314008 ) ) ( not ( = ?auto_314004 ?auto_314009 ) ) ( not ( = ?auto_314004 ?auto_314010 ) ) ( not ( = ?auto_314005 ?auto_314006 ) ) ( not ( = ?auto_314005 ?auto_314007 ) ) ( not ( = ?auto_314005 ?auto_314008 ) ) ( not ( = ?auto_314005 ?auto_314009 ) ) ( not ( = ?auto_314005 ?auto_314010 ) ) ( not ( = ?auto_314006 ?auto_314007 ) ) ( not ( = ?auto_314006 ?auto_314008 ) ) ( not ( = ?auto_314006 ?auto_314009 ) ) ( not ( = ?auto_314006 ?auto_314010 ) ) ( not ( = ?auto_314007 ?auto_314008 ) ) ( not ( = ?auto_314007 ?auto_314009 ) ) ( not ( = ?auto_314007 ?auto_314010 ) ) ( not ( = ?auto_314008 ?auto_314009 ) ) ( not ( = ?auto_314008 ?auto_314010 ) ) ( not ( = ?auto_314009 ?auto_314010 ) ) ( ON ?auto_314008 ?auto_314009 ) ( ON ?auto_314007 ?auto_314008 ) ( CLEAR ?auto_314005 ) ( ON ?auto_314006 ?auto_314007 ) ( CLEAR ?auto_314006 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_314003 ?auto_314004 ?auto_314005 ?auto_314006 )
      ( MAKE-7PILE ?auto_314003 ?auto_314004 ?auto_314005 ?auto_314006 ?auto_314007 ?auto_314008 ?auto_314009 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_314018 - BLOCK
      ?auto_314019 - BLOCK
      ?auto_314020 - BLOCK
      ?auto_314021 - BLOCK
      ?auto_314022 - BLOCK
      ?auto_314023 - BLOCK
      ?auto_314024 - BLOCK
    )
    :vars
    (
      ?auto_314025 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_314024 ?auto_314025 ) ( ON-TABLE ?auto_314018 ) ( ON ?auto_314019 ?auto_314018 ) ( not ( = ?auto_314018 ?auto_314019 ) ) ( not ( = ?auto_314018 ?auto_314020 ) ) ( not ( = ?auto_314018 ?auto_314021 ) ) ( not ( = ?auto_314018 ?auto_314022 ) ) ( not ( = ?auto_314018 ?auto_314023 ) ) ( not ( = ?auto_314018 ?auto_314024 ) ) ( not ( = ?auto_314018 ?auto_314025 ) ) ( not ( = ?auto_314019 ?auto_314020 ) ) ( not ( = ?auto_314019 ?auto_314021 ) ) ( not ( = ?auto_314019 ?auto_314022 ) ) ( not ( = ?auto_314019 ?auto_314023 ) ) ( not ( = ?auto_314019 ?auto_314024 ) ) ( not ( = ?auto_314019 ?auto_314025 ) ) ( not ( = ?auto_314020 ?auto_314021 ) ) ( not ( = ?auto_314020 ?auto_314022 ) ) ( not ( = ?auto_314020 ?auto_314023 ) ) ( not ( = ?auto_314020 ?auto_314024 ) ) ( not ( = ?auto_314020 ?auto_314025 ) ) ( not ( = ?auto_314021 ?auto_314022 ) ) ( not ( = ?auto_314021 ?auto_314023 ) ) ( not ( = ?auto_314021 ?auto_314024 ) ) ( not ( = ?auto_314021 ?auto_314025 ) ) ( not ( = ?auto_314022 ?auto_314023 ) ) ( not ( = ?auto_314022 ?auto_314024 ) ) ( not ( = ?auto_314022 ?auto_314025 ) ) ( not ( = ?auto_314023 ?auto_314024 ) ) ( not ( = ?auto_314023 ?auto_314025 ) ) ( not ( = ?auto_314024 ?auto_314025 ) ) ( ON ?auto_314023 ?auto_314024 ) ( ON ?auto_314022 ?auto_314023 ) ( ON ?auto_314021 ?auto_314022 ) ( CLEAR ?auto_314019 ) ( ON ?auto_314020 ?auto_314021 ) ( CLEAR ?auto_314020 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_314018 ?auto_314019 ?auto_314020 )
      ( MAKE-7PILE ?auto_314018 ?auto_314019 ?auto_314020 ?auto_314021 ?auto_314022 ?auto_314023 ?auto_314024 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_314033 - BLOCK
      ?auto_314034 - BLOCK
      ?auto_314035 - BLOCK
      ?auto_314036 - BLOCK
      ?auto_314037 - BLOCK
      ?auto_314038 - BLOCK
      ?auto_314039 - BLOCK
    )
    :vars
    (
      ?auto_314040 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_314039 ?auto_314040 ) ( ON-TABLE ?auto_314033 ) ( ON ?auto_314034 ?auto_314033 ) ( not ( = ?auto_314033 ?auto_314034 ) ) ( not ( = ?auto_314033 ?auto_314035 ) ) ( not ( = ?auto_314033 ?auto_314036 ) ) ( not ( = ?auto_314033 ?auto_314037 ) ) ( not ( = ?auto_314033 ?auto_314038 ) ) ( not ( = ?auto_314033 ?auto_314039 ) ) ( not ( = ?auto_314033 ?auto_314040 ) ) ( not ( = ?auto_314034 ?auto_314035 ) ) ( not ( = ?auto_314034 ?auto_314036 ) ) ( not ( = ?auto_314034 ?auto_314037 ) ) ( not ( = ?auto_314034 ?auto_314038 ) ) ( not ( = ?auto_314034 ?auto_314039 ) ) ( not ( = ?auto_314034 ?auto_314040 ) ) ( not ( = ?auto_314035 ?auto_314036 ) ) ( not ( = ?auto_314035 ?auto_314037 ) ) ( not ( = ?auto_314035 ?auto_314038 ) ) ( not ( = ?auto_314035 ?auto_314039 ) ) ( not ( = ?auto_314035 ?auto_314040 ) ) ( not ( = ?auto_314036 ?auto_314037 ) ) ( not ( = ?auto_314036 ?auto_314038 ) ) ( not ( = ?auto_314036 ?auto_314039 ) ) ( not ( = ?auto_314036 ?auto_314040 ) ) ( not ( = ?auto_314037 ?auto_314038 ) ) ( not ( = ?auto_314037 ?auto_314039 ) ) ( not ( = ?auto_314037 ?auto_314040 ) ) ( not ( = ?auto_314038 ?auto_314039 ) ) ( not ( = ?auto_314038 ?auto_314040 ) ) ( not ( = ?auto_314039 ?auto_314040 ) ) ( ON ?auto_314038 ?auto_314039 ) ( ON ?auto_314037 ?auto_314038 ) ( ON ?auto_314036 ?auto_314037 ) ( CLEAR ?auto_314034 ) ( ON ?auto_314035 ?auto_314036 ) ( CLEAR ?auto_314035 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_314033 ?auto_314034 ?auto_314035 )
      ( MAKE-7PILE ?auto_314033 ?auto_314034 ?auto_314035 ?auto_314036 ?auto_314037 ?auto_314038 ?auto_314039 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_314048 - BLOCK
      ?auto_314049 - BLOCK
      ?auto_314050 - BLOCK
      ?auto_314051 - BLOCK
      ?auto_314052 - BLOCK
      ?auto_314053 - BLOCK
      ?auto_314054 - BLOCK
    )
    :vars
    (
      ?auto_314055 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_314054 ?auto_314055 ) ( ON-TABLE ?auto_314048 ) ( not ( = ?auto_314048 ?auto_314049 ) ) ( not ( = ?auto_314048 ?auto_314050 ) ) ( not ( = ?auto_314048 ?auto_314051 ) ) ( not ( = ?auto_314048 ?auto_314052 ) ) ( not ( = ?auto_314048 ?auto_314053 ) ) ( not ( = ?auto_314048 ?auto_314054 ) ) ( not ( = ?auto_314048 ?auto_314055 ) ) ( not ( = ?auto_314049 ?auto_314050 ) ) ( not ( = ?auto_314049 ?auto_314051 ) ) ( not ( = ?auto_314049 ?auto_314052 ) ) ( not ( = ?auto_314049 ?auto_314053 ) ) ( not ( = ?auto_314049 ?auto_314054 ) ) ( not ( = ?auto_314049 ?auto_314055 ) ) ( not ( = ?auto_314050 ?auto_314051 ) ) ( not ( = ?auto_314050 ?auto_314052 ) ) ( not ( = ?auto_314050 ?auto_314053 ) ) ( not ( = ?auto_314050 ?auto_314054 ) ) ( not ( = ?auto_314050 ?auto_314055 ) ) ( not ( = ?auto_314051 ?auto_314052 ) ) ( not ( = ?auto_314051 ?auto_314053 ) ) ( not ( = ?auto_314051 ?auto_314054 ) ) ( not ( = ?auto_314051 ?auto_314055 ) ) ( not ( = ?auto_314052 ?auto_314053 ) ) ( not ( = ?auto_314052 ?auto_314054 ) ) ( not ( = ?auto_314052 ?auto_314055 ) ) ( not ( = ?auto_314053 ?auto_314054 ) ) ( not ( = ?auto_314053 ?auto_314055 ) ) ( not ( = ?auto_314054 ?auto_314055 ) ) ( ON ?auto_314053 ?auto_314054 ) ( ON ?auto_314052 ?auto_314053 ) ( ON ?auto_314051 ?auto_314052 ) ( ON ?auto_314050 ?auto_314051 ) ( CLEAR ?auto_314048 ) ( ON ?auto_314049 ?auto_314050 ) ( CLEAR ?auto_314049 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_314048 ?auto_314049 )
      ( MAKE-7PILE ?auto_314048 ?auto_314049 ?auto_314050 ?auto_314051 ?auto_314052 ?auto_314053 ?auto_314054 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_314063 - BLOCK
      ?auto_314064 - BLOCK
      ?auto_314065 - BLOCK
      ?auto_314066 - BLOCK
      ?auto_314067 - BLOCK
      ?auto_314068 - BLOCK
      ?auto_314069 - BLOCK
    )
    :vars
    (
      ?auto_314070 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_314069 ?auto_314070 ) ( ON-TABLE ?auto_314063 ) ( not ( = ?auto_314063 ?auto_314064 ) ) ( not ( = ?auto_314063 ?auto_314065 ) ) ( not ( = ?auto_314063 ?auto_314066 ) ) ( not ( = ?auto_314063 ?auto_314067 ) ) ( not ( = ?auto_314063 ?auto_314068 ) ) ( not ( = ?auto_314063 ?auto_314069 ) ) ( not ( = ?auto_314063 ?auto_314070 ) ) ( not ( = ?auto_314064 ?auto_314065 ) ) ( not ( = ?auto_314064 ?auto_314066 ) ) ( not ( = ?auto_314064 ?auto_314067 ) ) ( not ( = ?auto_314064 ?auto_314068 ) ) ( not ( = ?auto_314064 ?auto_314069 ) ) ( not ( = ?auto_314064 ?auto_314070 ) ) ( not ( = ?auto_314065 ?auto_314066 ) ) ( not ( = ?auto_314065 ?auto_314067 ) ) ( not ( = ?auto_314065 ?auto_314068 ) ) ( not ( = ?auto_314065 ?auto_314069 ) ) ( not ( = ?auto_314065 ?auto_314070 ) ) ( not ( = ?auto_314066 ?auto_314067 ) ) ( not ( = ?auto_314066 ?auto_314068 ) ) ( not ( = ?auto_314066 ?auto_314069 ) ) ( not ( = ?auto_314066 ?auto_314070 ) ) ( not ( = ?auto_314067 ?auto_314068 ) ) ( not ( = ?auto_314067 ?auto_314069 ) ) ( not ( = ?auto_314067 ?auto_314070 ) ) ( not ( = ?auto_314068 ?auto_314069 ) ) ( not ( = ?auto_314068 ?auto_314070 ) ) ( not ( = ?auto_314069 ?auto_314070 ) ) ( ON ?auto_314068 ?auto_314069 ) ( ON ?auto_314067 ?auto_314068 ) ( ON ?auto_314066 ?auto_314067 ) ( ON ?auto_314065 ?auto_314066 ) ( CLEAR ?auto_314063 ) ( ON ?auto_314064 ?auto_314065 ) ( CLEAR ?auto_314064 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_314063 ?auto_314064 )
      ( MAKE-7PILE ?auto_314063 ?auto_314064 ?auto_314065 ?auto_314066 ?auto_314067 ?auto_314068 ?auto_314069 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_314078 - BLOCK
      ?auto_314079 - BLOCK
      ?auto_314080 - BLOCK
      ?auto_314081 - BLOCK
      ?auto_314082 - BLOCK
      ?auto_314083 - BLOCK
      ?auto_314084 - BLOCK
    )
    :vars
    (
      ?auto_314085 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_314084 ?auto_314085 ) ( not ( = ?auto_314078 ?auto_314079 ) ) ( not ( = ?auto_314078 ?auto_314080 ) ) ( not ( = ?auto_314078 ?auto_314081 ) ) ( not ( = ?auto_314078 ?auto_314082 ) ) ( not ( = ?auto_314078 ?auto_314083 ) ) ( not ( = ?auto_314078 ?auto_314084 ) ) ( not ( = ?auto_314078 ?auto_314085 ) ) ( not ( = ?auto_314079 ?auto_314080 ) ) ( not ( = ?auto_314079 ?auto_314081 ) ) ( not ( = ?auto_314079 ?auto_314082 ) ) ( not ( = ?auto_314079 ?auto_314083 ) ) ( not ( = ?auto_314079 ?auto_314084 ) ) ( not ( = ?auto_314079 ?auto_314085 ) ) ( not ( = ?auto_314080 ?auto_314081 ) ) ( not ( = ?auto_314080 ?auto_314082 ) ) ( not ( = ?auto_314080 ?auto_314083 ) ) ( not ( = ?auto_314080 ?auto_314084 ) ) ( not ( = ?auto_314080 ?auto_314085 ) ) ( not ( = ?auto_314081 ?auto_314082 ) ) ( not ( = ?auto_314081 ?auto_314083 ) ) ( not ( = ?auto_314081 ?auto_314084 ) ) ( not ( = ?auto_314081 ?auto_314085 ) ) ( not ( = ?auto_314082 ?auto_314083 ) ) ( not ( = ?auto_314082 ?auto_314084 ) ) ( not ( = ?auto_314082 ?auto_314085 ) ) ( not ( = ?auto_314083 ?auto_314084 ) ) ( not ( = ?auto_314083 ?auto_314085 ) ) ( not ( = ?auto_314084 ?auto_314085 ) ) ( ON ?auto_314083 ?auto_314084 ) ( ON ?auto_314082 ?auto_314083 ) ( ON ?auto_314081 ?auto_314082 ) ( ON ?auto_314080 ?auto_314081 ) ( ON ?auto_314079 ?auto_314080 ) ( ON ?auto_314078 ?auto_314079 ) ( CLEAR ?auto_314078 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_314078 )
      ( MAKE-7PILE ?auto_314078 ?auto_314079 ?auto_314080 ?auto_314081 ?auto_314082 ?auto_314083 ?auto_314084 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_314093 - BLOCK
      ?auto_314094 - BLOCK
      ?auto_314095 - BLOCK
      ?auto_314096 - BLOCK
      ?auto_314097 - BLOCK
      ?auto_314098 - BLOCK
      ?auto_314099 - BLOCK
    )
    :vars
    (
      ?auto_314100 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_314099 ?auto_314100 ) ( not ( = ?auto_314093 ?auto_314094 ) ) ( not ( = ?auto_314093 ?auto_314095 ) ) ( not ( = ?auto_314093 ?auto_314096 ) ) ( not ( = ?auto_314093 ?auto_314097 ) ) ( not ( = ?auto_314093 ?auto_314098 ) ) ( not ( = ?auto_314093 ?auto_314099 ) ) ( not ( = ?auto_314093 ?auto_314100 ) ) ( not ( = ?auto_314094 ?auto_314095 ) ) ( not ( = ?auto_314094 ?auto_314096 ) ) ( not ( = ?auto_314094 ?auto_314097 ) ) ( not ( = ?auto_314094 ?auto_314098 ) ) ( not ( = ?auto_314094 ?auto_314099 ) ) ( not ( = ?auto_314094 ?auto_314100 ) ) ( not ( = ?auto_314095 ?auto_314096 ) ) ( not ( = ?auto_314095 ?auto_314097 ) ) ( not ( = ?auto_314095 ?auto_314098 ) ) ( not ( = ?auto_314095 ?auto_314099 ) ) ( not ( = ?auto_314095 ?auto_314100 ) ) ( not ( = ?auto_314096 ?auto_314097 ) ) ( not ( = ?auto_314096 ?auto_314098 ) ) ( not ( = ?auto_314096 ?auto_314099 ) ) ( not ( = ?auto_314096 ?auto_314100 ) ) ( not ( = ?auto_314097 ?auto_314098 ) ) ( not ( = ?auto_314097 ?auto_314099 ) ) ( not ( = ?auto_314097 ?auto_314100 ) ) ( not ( = ?auto_314098 ?auto_314099 ) ) ( not ( = ?auto_314098 ?auto_314100 ) ) ( not ( = ?auto_314099 ?auto_314100 ) ) ( ON ?auto_314098 ?auto_314099 ) ( ON ?auto_314097 ?auto_314098 ) ( ON ?auto_314096 ?auto_314097 ) ( ON ?auto_314095 ?auto_314096 ) ( ON ?auto_314094 ?auto_314095 ) ( ON ?auto_314093 ?auto_314094 ) ( CLEAR ?auto_314093 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_314093 )
      ( MAKE-7PILE ?auto_314093 ?auto_314094 ?auto_314095 ?auto_314096 ?auto_314097 ?auto_314098 ?auto_314099 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_314109 - BLOCK
      ?auto_314110 - BLOCK
      ?auto_314111 - BLOCK
      ?auto_314112 - BLOCK
      ?auto_314113 - BLOCK
      ?auto_314114 - BLOCK
      ?auto_314115 - BLOCK
      ?auto_314116 - BLOCK
    )
    :vars
    (
      ?auto_314117 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_314115 ) ( ON ?auto_314116 ?auto_314117 ) ( CLEAR ?auto_314116 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_314109 ) ( ON ?auto_314110 ?auto_314109 ) ( ON ?auto_314111 ?auto_314110 ) ( ON ?auto_314112 ?auto_314111 ) ( ON ?auto_314113 ?auto_314112 ) ( ON ?auto_314114 ?auto_314113 ) ( ON ?auto_314115 ?auto_314114 ) ( not ( = ?auto_314109 ?auto_314110 ) ) ( not ( = ?auto_314109 ?auto_314111 ) ) ( not ( = ?auto_314109 ?auto_314112 ) ) ( not ( = ?auto_314109 ?auto_314113 ) ) ( not ( = ?auto_314109 ?auto_314114 ) ) ( not ( = ?auto_314109 ?auto_314115 ) ) ( not ( = ?auto_314109 ?auto_314116 ) ) ( not ( = ?auto_314109 ?auto_314117 ) ) ( not ( = ?auto_314110 ?auto_314111 ) ) ( not ( = ?auto_314110 ?auto_314112 ) ) ( not ( = ?auto_314110 ?auto_314113 ) ) ( not ( = ?auto_314110 ?auto_314114 ) ) ( not ( = ?auto_314110 ?auto_314115 ) ) ( not ( = ?auto_314110 ?auto_314116 ) ) ( not ( = ?auto_314110 ?auto_314117 ) ) ( not ( = ?auto_314111 ?auto_314112 ) ) ( not ( = ?auto_314111 ?auto_314113 ) ) ( not ( = ?auto_314111 ?auto_314114 ) ) ( not ( = ?auto_314111 ?auto_314115 ) ) ( not ( = ?auto_314111 ?auto_314116 ) ) ( not ( = ?auto_314111 ?auto_314117 ) ) ( not ( = ?auto_314112 ?auto_314113 ) ) ( not ( = ?auto_314112 ?auto_314114 ) ) ( not ( = ?auto_314112 ?auto_314115 ) ) ( not ( = ?auto_314112 ?auto_314116 ) ) ( not ( = ?auto_314112 ?auto_314117 ) ) ( not ( = ?auto_314113 ?auto_314114 ) ) ( not ( = ?auto_314113 ?auto_314115 ) ) ( not ( = ?auto_314113 ?auto_314116 ) ) ( not ( = ?auto_314113 ?auto_314117 ) ) ( not ( = ?auto_314114 ?auto_314115 ) ) ( not ( = ?auto_314114 ?auto_314116 ) ) ( not ( = ?auto_314114 ?auto_314117 ) ) ( not ( = ?auto_314115 ?auto_314116 ) ) ( not ( = ?auto_314115 ?auto_314117 ) ) ( not ( = ?auto_314116 ?auto_314117 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_314116 ?auto_314117 )
      ( !STACK ?auto_314116 ?auto_314115 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_314126 - BLOCK
      ?auto_314127 - BLOCK
      ?auto_314128 - BLOCK
      ?auto_314129 - BLOCK
      ?auto_314130 - BLOCK
      ?auto_314131 - BLOCK
      ?auto_314132 - BLOCK
      ?auto_314133 - BLOCK
    )
    :vars
    (
      ?auto_314134 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_314132 ) ( ON ?auto_314133 ?auto_314134 ) ( CLEAR ?auto_314133 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_314126 ) ( ON ?auto_314127 ?auto_314126 ) ( ON ?auto_314128 ?auto_314127 ) ( ON ?auto_314129 ?auto_314128 ) ( ON ?auto_314130 ?auto_314129 ) ( ON ?auto_314131 ?auto_314130 ) ( ON ?auto_314132 ?auto_314131 ) ( not ( = ?auto_314126 ?auto_314127 ) ) ( not ( = ?auto_314126 ?auto_314128 ) ) ( not ( = ?auto_314126 ?auto_314129 ) ) ( not ( = ?auto_314126 ?auto_314130 ) ) ( not ( = ?auto_314126 ?auto_314131 ) ) ( not ( = ?auto_314126 ?auto_314132 ) ) ( not ( = ?auto_314126 ?auto_314133 ) ) ( not ( = ?auto_314126 ?auto_314134 ) ) ( not ( = ?auto_314127 ?auto_314128 ) ) ( not ( = ?auto_314127 ?auto_314129 ) ) ( not ( = ?auto_314127 ?auto_314130 ) ) ( not ( = ?auto_314127 ?auto_314131 ) ) ( not ( = ?auto_314127 ?auto_314132 ) ) ( not ( = ?auto_314127 ?auto_314133 ) ) ( not ( = ?auto_314127 ?auto_314134 ) ) ( not ( = ?auto_314128 ?auto_314129 ) ) ( not ( = ?auto_314128 ?auto_314130 ) ) ( not ( = ?auto_314128 ?auto_314131 ) ) ( not ( = ?auto_314128 ?auto_314132 ) ) ( not ( = ?auto_314128 ?auto_314133 ) ) ( not ( = ?auto_314128 ?auto_314134 ) ) ( not ( = ?auto_314129 ?auto_314130 ) ) ( not ( = ?auto_314129 ?auto_314131 ) ) ( not ( = ?auto_314129 ?auto_314132 ) ) ( not ( = ?auto_314129 ?auto_314133 ) ) ( not ( = ?auto_314129 ?auto_314134 ) ) ( not ( = ?auto_314130 ?auto_314131 ) ) ( not ( = ?auto_314130 ?auto_314132 ) ) ( not ( = ?auto_314130 ?auto_314133 ) ) ( not ( = ?auto_314130 ?auto_314134 ) ) ( not ( = ?auto_314131 ?auto_314132 ) ) ( not ( = ?auto_314131 ?auto_314133 ) ) ( not ( = ?auto_314131 ?auto_314134 ) ) ( not ( = ?auto_314132 ?auto_314133 ) ) ( not ( = ?auto_314132 ?auto_314134 ) ) ( not ( = ?auto_314133 ?auto_314134 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_314133 ?auto_314134 )
      ( !STACK ?auto_314133 ?auto_314132 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_314143 - BLOCK
      ?auto_314144 - BLOCK
      ?auto_314145 - BLOCK
      ?auto_314146 - BLOCK
      ?auto_314147 - BLOCK
      ?auto_314148 - BLOCK
      ?auto_314149 - BLOCK
      ?auto_314150 - BLOCK
    )
    :vars
    (
      ?auto_314151 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_314150 ?auto_314151 ) ( ON-TABLE ?auto_314143 ) ( ON ?auto_314144 ?auto_314143 ) ( ON ?auto_314145 ?auto_314144 ) ( ON ?auto_314146 ?auto_314145 ) ( ON ?auto_314147 ?auto_314146 ) ( ON ?auto_314148 ?auto_314147 ) ( not ( = ?auto_314143 ?auto_314144 ) ) ( not ( = ?auto_314143 ?auto_314145 ) ) ( not ( = ?auto_314143 ?auto_314146 ) ) ( not ( = ?auto_314143 ?auto_314147 ) ) ( not ( = ?auto_314143 ?auto_314148 ) ) ( not ( = ?auto_314143 ?auto_314149 ) ) ( not ( = ?auto_314143 ?auto_314150 ) ) ( not ( = ?auto_314143 ?auto_314151 ) ) ( not ( = ?auto_314144 ?auto_314145 ) ) ( not ( = ?auto_314144 ?auto_314146 ) ) ( not ( = ?auto_314144 ?auto_314147 ) ) ( not ( = ?auto_314144 ?auto_314148 ) ) ( not ( = ?auto_314144 ?auto_314149 ) ) ( not ( = ?auto_314144 ?auto_314150 ) ) ( not ( = ?auto_314144 ?auto_314151 ) ) ( not ( = ?auto_314145 ?auto_314146 ) ) ( not ( = ?auto_314145 ?auto_314147 ) ) ( not ( = ?auto_314145 ?auto_314148 ) ) ( not ( = ?auto_314145 ?auto_314149 ) ) ( not ( = ?auto_314145 ?auto_314150 ) ) ( not ( = ?auto_314145 ?auto_314151 ) ) ( not ( = ?auto_314146 ?auto_314147 ) ) ( not ( = ?auto_314146 ?auto_314148 ) ) ( not ( = ?auto_314146 ?auto_314149 ) ) ( not ( = ?auto_314146 ?auto_314150 ) ) ( not ( = ?auto_314146 ?auto_314151 ) ) ( not ( = ?auto_314147 ?auto_314148 ) ) ( not ( = ?auto_314147 ?auto_314149 ) ) ( not ( = ?auto_314147 ?auto_314150 ) ) ( not ( = ?auto_314147 ?auto_314151 ) ) ( not ( = ?auto_314148 ?auto_314149 ) ) ( not ( = ?auto_314148 ?auto_314150 ) ) ( not ( = ?auto_314148 ?auto_314151 ) ) ( not ( = ?auto_314149 ?auto_314150 ) ) ( not ( = ?auto_314149 ?auto_314151 ) ) ( not ( = ?auto_314150 ?auto_314151 ) ) ( CLEAR ?auto_314148 ) ( ON ?auto_314149 ?auto_314150 ) ( CLEAR ?auto_314149 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_314143 ?auto_314144 ?auto_314145 ?auto_314146 ?auto_314147 ?auto_314148 ?auto_314149 )
      ( MAKE-8PILE ?auto_314143 ?auto_314144 ?auto_314145 ?auto_314146 ?auto_314147 ?auto_314148 ?auto_314149 ?auto_314150 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_314160 - BLOCK
      ?auto_314161 - BLOCK
      ?auto_314162 - BLOCK
      ?auto_314163 - BLOCK
      ?auto_314164 - BLOCK
      ?auto_314165 - BLOCK
      ?auto_314166 - BLOCK
      ?auto_314167 - BLOCK
    )
    :vars
    (
      ?auto_314168 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_314167 ?auto_314168 ) ( ON-TABLE ?auto_314160 ) ( ON ?auto_314161 ?auto_314160 ) ( ON ?auto_314162 ?auto_314161 ) ( ON ?auto_314163 ?auto_314162 ) ( ON ?auto_314164 ?auto_314163 ) ( ON ?auto_314165 ?auto_314164 ) ( not ( = ?auto_314160 ?auto_314161 ) ) ( not ( = ?auto_314160 ?auto_314162 ) ) ( not ( = ?auto_314160 ?auto_314163 ) ) ( not ( = ?auto_314160 ?auto_314164 ) ) ( not ( = ?auto_314160 ?auto_314165 ) ) ( not ( = ?auto_314160 ?auto_314166 ) ) ( not ( = ?auto_314160 ?auto_314167 ) ) ( not ( = ?auto_314160 ?auto_314168 ) ) ( not ( = ?auto_314161 ?auto_314162 ) ) ( not ( = ?auto_314161 ?auto_314163 ) ) ( not ( = ?auto_314161 ?auto_314164 ) ) ( not ( = ?auto_314161 ?auto_314165 ) ) ( not ( = ?auto_314161 ?auto_314166 ) ) ( not ( = ?auto_314161 ?auto_314167 ) ) ( not ( = ?auto_314161 ?auto_314168 ) ) ( not ( = ?auto_314162 ?auto_314163 ) ) ( not ( = ?auto_314162 ?auto_314164 ) ) ( not ( = ?auto_314162 ?auto_314165 ) ) ( not ( = ?auto_314162 ?auto_314166 ) ) ( not ( = ?auto_314162 ?auto_314167 ) ) ( not ( = ?auto_314162 ?auto_314168 ) ) ( not ( = ?auto_314163 ?auto_314164 ) ) ( not ( = ?auto_314163 ?auto_314165 ) ) ( not ( = ?auto_314163 ?auto_314166 ) ) ( not ( = ?auto_314163 ?auto_314167 ) ) ( not ( = ?auto_314163 ?auto_314168 ) ) ( not ( = ?auto_314164 ?auto_314165 ) ) ( not ( = ?auto_314164 ?auto_314166 ) ) ( not ( = ?auto_314164 ?auto_314167 ) ) ( not ( = ?auto_314164 ?auto_314168 ) ) ( not ( = ?auto_314165 ?auto_314166 ) ) ( not ( = ?auto_314165 ?auto_314167 ) ) ( not ( = ?auto_314165 ?auto_314168 ) ) ( not ( = ?auto_314166 ?auto_314167 ) ) ( not ( = ?auto_314166 ?auto_314168 ) ) ( not ( = ?auto_314167 ?auto_314168 ) ) ( CLEAR ?auto_314165 ) ( ON ?auto_314166 ?auto_314167 ) ( CLEAR ?auto_314166 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_314160 ?auto_314161 ?auto_314162 ?auto_314163 ?auto_314164 ?auto_314165 ?auto_314166 )
      ( MAKE-8PILE ?auto_314160 ?auto_314161 ?auto_314162 ?auto_314163 ?auto_314164 ?auto_314165 ?auto_314166 ?auto_314167 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_314177 - BLOCK
      ?auto_314178 - BLOCK
      ?auto_314179 - BLOCK
      ?auto_314180 - BLOCK
      ?auto_314181 - BLOCK
      ?auto_314182 - BLOCK
      ?auto_314183 - BLOCK
      ?auto_314184 - BLOCK
    )
    :vars
    (
      ?auto_314185 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_314184 ?auto_314185 ) ( ON-TABLE ?auto_314177 ) ( ON ?auto_314178 ?auto_314177 ) ( ON ?auto_314179 ?auto_314178 ) ( ON ?auto_314180 ?auto_314179 ) ( ON ?auto_314181 ?auto_314180 ) ( not ( = ?auto_314177 ?auto_314178 ) ) ( not ( = ?auto_314177 ?auto_314179 ) ) ( not ( = ?auto_314177 ?auto_314180 ) ) ( not ( = ?auto_314177 ?auto_314181 ) ) ( not ( = ?auto_314177 ?auto_314182 ) ) ( not ( = ?auto_314177 ?auto_314183 ) ) ( not ( = ?auto_314177 ?auto_314184 ) ) ( not ( = ?auto_314177 ?auto_314185 ) ) ( not ( = ?auto_314178 ?auto_314179 ) ) ( not ( = ?auto_314178 ?auto_314180 ) ) ( not ( = ?auto_314178 ?auto_314181 ) ) ( not ( = ?auto_314178 ?auto_314182 ) ) ( not ( = ?auto_314178 ?auto_314183 ) ) ( not ( = ?auto_314178 ?auto_314184 ) ) ( not ( = ?auto_314178 ?auto_314185 ) ) ( not ( = ?auto_314179 ?auto_314180 ) ) ( not ( = ?auto_314179 ?auto_314181 ) ) ( not ( = ?auto_314179 ?auto_314182 ) ) ( not ( = ?auto_314179 ?auto_314183 ) ) ( not ( = ?auto_314179 ?auto_314184 ) ) ( not ( = ?auto_314179 ?auto_314185 ) ) ( not ( = ?auto_314180 ?auto_314181 ) ) ( not ( = ?auto_314180 ?auto_314182 ) ) ( not ( = ?auto_314180 ?auto_314183 ) ) ( not ( = ?auto_314180 ?auto_314184 ) ) ( not ( = ?auto_314180 ?auto_314185 ) ) ( not ( = ?auto_314181 ?auto_314182 ) ) ( not ( = ?auto_314181 ?auto_314183 ) ) ( not ( = ?auto_314181 ?auto_314184 ) ) ( not ( = ?auto_314181 ?auto_314185 ) ) ( not ( = ?auto_314182 ?auto_314183 ) ) ( not ( = ?auto_314182 ?auto_314184 ) ) ( not ( = ?auto_314182 ?auto_314185 ) ) ( not ( = ?auto_314183 ?auto_314184 ) ) ( not ( = ?auto_314183 ?auto_314185 ) ) ( not ( = ?auto_314184 ?auto_314185 ) ) ( ON ?auto_314183 ?auto_314184 ) ( CLEAR ?auto_314181 ) ( ON ?auto_314182 ?auto_314183 ) ( CLEAR ?auto_314182 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_314177 ?auto_314178 ?auto_314179 ?auto_314180 ?auto_314181 ?auto_314182 )
      ( MAKE-8PILE ?auto_314177 ?auto_314178 ?auto_314179 ?auto_314180 ?auto_314181 ?auto_314182 ?auto_314183 ?auto_314184 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_314194 - BLOCK
      ?auto_314195 - BLOCK
      ?auto_314196 - BLOCK
      ?auto_314197 - BLOCK
      ?auto_314198 - BLOCK
      ?auto_314199 - BLOCK
      ?auto_314200 - BLOCK
      ?auto_314201 - BLOCK
    )
    :vars
    (
      ?auto_314202 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_314201 ?auto_314202 ) ( ON-TABLE ?auto_314194 ) ( ON ?auto_314195 ?auto_314194 ) ( ON ?auto_314196 ?auto_314195 ) ( ON ?auto_314197 ?auto_314196 ) ( ON ?auto_314198 ?auto_314197 ) ( not ( = ?auto_314194 ?auto_314195 ) ) ( not ( = ?auto_314194 ?auto_314196 ) ) ( not ( = ?auto_314194 ?auto_314197 ) ) ( not ( = ?auto_314194 ?auto_314198 ) ) ( not ( = ?auto_314194 ?auto_314199 ) ) ( not ( = ?auto_314194 ?auto_314200 ) ) ( not ( = ?auto_314194 ?auto_314201 ) ) ( not ( = ?auto_314194 ?auto_314202 ) ) ( not ( = ?auto_314195 ?auto_314196 ) ) ( not ( = ?auto_314195 ?auto_314197 ) ) ( not ( = ?auto_314195 ?auto_314198 ) ) ( not ( = ?auto_314195 ?auto_314199 ) ) ( not ( = ?auto_314195 ?auto_314200 ) ) ( not ( = ?auto_314195 ?auto_314201 ) ) ( not ( = ?auto_314195 ?auto_314202 ) ) ( not ( = ?auto_314196 ?auto_314197 ) ) ( not ( = ?auto_314196 ?auto_314198 ) ) ( not ( = ?auto_314196 ?auto_314199 ) ) ( not ( = ?auto_314196 ?auto_314200 ) ) ( not ( = ?auto_314196 ?auto_314201 ) ) ( not ( = ?auto_314196 ?auto_314202 ) ) ( not ( = ?auto_314197 ?auto_314198 ) ) ( not ( = ?auto_314197 ?auto_314199 ) ) ( not ( = ?auto_314197 ?auto_314200 ) ) ( not ( = ?auto_314197 ?auto_314201 ) ) ( not ( = ?auto_314197 ?auto_314202 ) ) ( not ( = ?auto_314198 ?auto_314199 ) ) ( not ( = ?auto_314198 ?auto_314200 ) ) ( not ( = ?auto_314198 ?auto_314201 ) ) ( not ( = ?auto_314198 ?auto_314202 ) ) ( not ( = ?auto_314199 ?auto_314200 ) ) ( not ( = ?auto_314199 ?auto_314201 ) ) ( not ( = ?auto_314199 ?auto_314202 ) ) ( not ( = ?auto_314200 ?auto_314201 ) ) ( not ( = ?auto_314200 ?auto_314202 ) ) ( not ( = ?auto_314201 ?auto_314202 ) ) ( ON ?auto_314200 ?auto_314201 ) ( CLEAR ?auto_314198 ) ( ON ?auto_314199 ?auto_314200 ) ( CLEAR ?auto_314199 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_314194 ?auto_314195 ?auto_314196 ?auto_314197 ?auto_314198 ?auto_314199 )
      ( MAKE-8PILE ?auto_314194 ?auto_314195 ?auto_314196 ?auto_314197 ?auto_314198 ?auto_314199 ?auto_314200 ?auto_314201 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_314211 - BLOCK
      ?auto_314212 - BLOCK
      ?auto_314213 - BLOCK
      ?auto_314214 - BLOCK
      ?auto_314215 - BLOCK
      ?auto_314216 - BLOCK
      ?auto_314217 - BLOCK
      ?auto_314218 - BLOCK
    )
    :vars
    (
      ?auto_314219 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_314218 ?auto_314219 ) ( ON-TABLE ?auto_314211 ) ( ON ?auto_314212 ?auto_314211 ) ( ON ?auto_314213 ?auto_314212 ) ( ON ?auto_314214 ?auto_314213 ) ( not ( = ?auto_314211 ?auto_314212 ) ) ( not ( = ?auto_314211 ?auto_314213 ) ) ( not ( = ?auto_314211 ?auto_314214 ) ) ( not ( = ?auto_314211 ?auto_314215 ) ) ( not ( = ?auto_314211 ?auto_314216 ) ) ( not ( = ?auto_314211 ?auto_314217 ) ) ( not ( = ?auto_314211 ?auto_314218 ) ) ( not ( = ?auto_314211 ?auto_314219 ) ) ( not ( = ?auto_314212 ?auto_314213 ) ) ( not ( = ?auto_314212 ?auto_314214 ) ) ( not ( = ?auto_314212 ?auto_314215 ) ) ( not ( = ?auto_314212 ?auto_314216 ) ) ( not ( = ?auto_314212 ?auto_314217 ) ) ( not ( = ?auto_314212 ?auto_314218 ) ) ( not ( = ?auto_314212 ?auto_314219 ) ) ( not ( = ?auto_314213 ?auto_314214 ) ) ( not ( = ?auto_314213 ?auto_314215 ) ) ( not ( = ?auto_314213 ?auto_314216 ) ) ( not ( = ?auto_314213 ?auto_314217 ) ) ( not ( = ?auto_314213 ?auto_314218 ) ) ( not ( = ?auto_314213 ?auto_314219 ) ) ( not ( = ?auto_314214 ?auto_314215 ) ) ( not ( = ?auto_314214 ?auto_314216 ) ) ( not ( = ?auto_314214 ?auto_314217 ) ) ( not ( = ?auto_314214 ?auto_314218 ) ) ( not ( = ?auto_314214 ?auto_314219 ) ) ( not ( = ?auto_314215 ?auto_314216 ) ) ( not ( = ?auto_314215 ?auto_314217 ) ) ( not ( = ?auto_314215 ?auto_314218 ) ) ( not ( = ?auto_314215 ?auto_314219 ) ) ( not ( = ?auto_314216 ?auto_314217 ) ) ( not ( = ?auto_314216 ?auto_314218 ) ) ( not ( = ?auto_314216 ?auto_314219 ) ) ( not ( = ?auto_314217 ?auto_314218 ) ) ( not ( = ?auto_314217 ?auto_314219 ) ) ( not ( = ?auto_314218 ?auto_314219 ) ) ( ON ?auto_314217 ?auto_314218 ) ( ON ?auto_314216 ?auto_314217 ) ( CLEAR ?auto_314214 ) ( ON ?auto_314215 ?auto_314216 ) ( CLEAR ?auto_314215 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_314211 ?auto_314212 ?auto_314213 ?auto_314214 ?auto_314215 )
      ( MAKE-8PILE ?auto_314211 ?auto_314212 ?auto_314213 ?auto_314214 ?auto_314215 ?auto_314216 ?auto_314217 ?auto_314218 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_314228 - BLOCK
      ?auto_314229 - BLOCK
      ?auto_314230 - BLOCK
      ?auto_314231 - BLOCK
      ?auto_314232 - BLOCK
      ?auto_314233 - BLOCK
      ?auto_314234 - BLOCK
      ?auto_314235 - BLOCK
    )
    :vars
    (
      ?auto_314236 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_314235 ?auto_314236 ) ( ON-TABLE ?auto_314228 ) ( ON ?auto_314229 ?auto_314228 ) ( ON ?auto_314230 ?auto_314229 ) ( ON ?auto_314231 ?auto_314230 ) ( not ( = ?auto_314228 ?auto_314229 ) ) ( not ( = ?auto_314228 ?auto_314230 ) ) ( not ( = ?auto_314228 ?auto_314231 ) ) ( not ( = ?auto_314228 ?auto_314232 ) ) ( not ( = ?auto_314228 ?auto_314233 ) ) ( not ( = ?auto_314228 ?auto_314234 ) ) ( not ( = ?auto_314228 ?auto_314235 ) ) ( not ( = ?auto_314228 ?auto_314236 ) ) ( not ( = ?auto_314229 ?auto_314230 ) ) ( not ( = ?auto_314229 ?auto_314231 ) ) ( not ( = ?auto_314229 ?auto_314232 ) ) ( not ( = ?auto_314229 ?auto_314233 ) ) ( not ( = ?auto_314229 ?auto_314234 ) ) ( not ( = ?auto_314229 ?auto_314235 ) ) ( not ( = ?auto_314229 ?auto_314236 ) ) ( not ( = ?auto_314230 ?auto_314231 ) ) ( not ( = ?auto_314230 ?auto_314232 ) ) ( not ( = ?auto_314230 ?auto_314233 ) ) ( not ( = ?auto_314230 ?auto_314234 ) ) ( not ( = ?auto_314230 ?auto_314235 ) ) ( not ( = ?auto_314230 ?auto_314236 ) ) ( not ( = ?auto_314231 ?auto_314232 ) ) ( not ( = ?auto_314231 ?auto_314233 ) ) ( not ( = ?auto_314231 ?auto_314234 ) ) ( not ( = ?auto_314231 ?auto_314235 ) ) ( not ( = ?auto_314231 ?auto_314236 ) ) ( not ( = ?auto_314232 ?auto_314233 ) ) ( not ( = ?auto_314232 ?auto_314234 ) ) ( not ( = ?auto_314232 ?auto_314235 ) ) ( not ( = ?auto_314232 ?auto_314236 ) ) ( not ( = ?auto_314233 ?auto_314234 ) ) ( not ( = ?auto_314233 ?auto_314235 ) ) ( not ( = ?auto_314233 ?auto_314236 ) ) ( not ( = ?auto_314234 ?auto_314235 ) ) ( not ( = ?auto_314234 ?auto_314236 ) ) ( not ( = ?auto_314235 ?auto_314236 ) ) ( ON ?auto_314234 ?auto_314235 ) ( ON ?auto_314233 ?auto_314234 ) ( CLEAR ?auto_314231 ) ( ON ?auto_314232 ?auto_314233 ) ( CLEAR ?auto_314232 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_314228 ?auto_314229 ?auto_314230 ?auto_314231 ?auto_314232 )
      ( MAKE-8PILE ?auto_314228 ?auto_314229 ?auto_314230 ?auto_314231 ?auto_314232 ?auto_314233 ?auto_314234 ?auto_314235 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_314245 - BLOCK
      ?auto_314246 - BLOCK
      ?auto_314247 - BLOCK
      ?auto_314248 - BLOCK
      ?auto_314249 - BLOCK
      ?auto_314250 - BLOCK
      ?auto_314251 - BLOCK
      ?auto_314252 - BLOCK
    )
    :vars
    (
      ?auto_314253 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_314252 ?auto_314253 ) ( ON-TABLE ?auto_314245 ) ( ON ?auto_314246 ?auto_314245 ) ( ON ?auto_314247 ?auto_314246 ) ( not ( = ?auto_314245 ?auto_314246 ) ) ( not ( = ?auto_314245 ?auto_314247 ) ) ( not ( = ?auto_314245 ?auto_314248 ) ) ( not ( = ?auto_314245 ?auto_314249 ) ) ( not ( = ?auto_314245 ?auto_314250 ) ) ( not ( = ?auto_314245 ?auto_314251 ) ) ( not ( = ?auto_314245 ?auto_314252 ) ) ( not ( = ?auto_314245 ?auto_314253 ) ) ( not ( = ?auto_314246 ?auto_314247 ) ) ( not ( = ?auto_314246 ?auto_314248 ) ) ( not ( = ?auto_314246 ?auto_314249 ) ) ( not ( = ?auto_314246 ?auto_314250 ) ) ( not ( = ?auto_314246 ?auto_314251 ) ) ( not ( = ?auto_314246 ?auto_314252 ) ) ( not ( = ?auto_314246 ?auto_314253 ) ) ( not ( = ?auto_314247 ?auto_314248 ) ) ( not ( = ?auto_314247 ?auto_314249 ) ) ( not ( = ?auto_314247 ?auto_314250 ) ) ( not ( = ?auto_314247 ?auto_314251 ) ) ( not ( = ?auto_314247 ?auto_314252 ) ) ( not ( = ?auto_314247 ?auto_314253 ) ) ( not ( = ?auto_314248 ?auto_314249 ) ) ( not ( = ?auto_314248 ?auto_314250 ) ) ( not ( = ?auto_314248 ?auto_314251 ) ) ( not ( = ?auto_314248 ?auto_314252 ) ) ( not ( = ?auto_314248 ?auto_314253 ) ) ( not ( = ?auto_314249 ?auto_314250 ) ) ( not ( = ?auto_314249 ?auto_314251 ) ) ( not ( = ?auto_314249 ?auto_314252 ) ) ( not ( = ?auto_314249 ?auto_314253 ) ) ( not ( = ?auto_314250 ?auto_314251 ) ) ( not ( = ?auto_314250 ?auto_314252 ) ) ( not ( = ?auto_314250 ?auto_314253 ) ) ( not ( = ?auto_314251 ?auto_314252 ) ) ( not ( = ?auto_314251 ?auto_314253 ) ) ( not ( = ?auto_314252 ?auto_314253 ) ) ( ON ?auto_314251 ?auto_314252 ) ( ON ?auto_314250 ?auto_314251 ) ( ON ?auto_314249 ?auto_314250 ) ( CLEAR ?auto_314247 ) ( ON ?auto_314248 ?auto_314249 ) ( CLEAR ?auto_314248 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_314245 ?auto_314246 ?auto_314247 ?auto_314248 )
      ( MAKE-8PILE ?auto_314245 ?auto_314246 ?auto_314247 ?auto_314248 ?auto_314249 ?auto_314250 ?auto_314251 ?auto_314252 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_314262 - BLOCK
      ?auto_314263 - BLOCK
      ?auto_314264 - BLOCK
      ?auto_314265 - BLOCK
      ?auto_314266 - BLOCK
      ?auto_314267 - BLOCK
      ?auto_314268 - BLOCK
      ?auto_314269 - BLOCK
    )
    :vars
    (
      ?auto_314270 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_314269 ?auto_314270 ) ( ON-TABLE ?auto_314262 ) ( ON ?auto_314263 ?auto_314262 ) ( ON ?auto_314264 ?auto_314263 ) ( not ( = ?auto_314262 ?auto_314263 ) ) ( not ( = ?auto_314262 ?auto_314264 ) ) ( not ( = ?auto_314262 ?auto_314265 ) ) ( not ( = ?auto_314262 ?auto_314266 ) ) ( not ( = ?auto_314262 ?auto_314267 ) ) ( not ( = ?auto_314262 ?auto_314268 ) ) ( not ( = ?auto_314262 ?auto_314269 ) ) ( not ( = ?auto_314262 ?auto_314270 ) ) ( not ( = ?auto_314263 ?auto_314264 ) ) ( not ( = ?auto_314263 ?auto_314265 ) ) ( not ( = ?auto_314263 ?auto_314266 ) ) ( not ( = ?auto_314263 ?auto_314267 ) ) ( not ( = ?auto_314263 ?auto_314268 ) ) ( not ( = ?auto_314263 ?auto_314269 ) ) ( not ( = ?auto_314263 ?auto_314270 ) ) ( not ( = ?auto_314264 ?auto_314265 ) ) ( not ( = ?auto_314264 ?auto_314266 ) ) ( not ( = ?auto_314264 ?auto_314267 ) ) ( not ( = ?auto_314264 ?auto_314268 ) ) ( not ( = ?auto_314264 ?auto_314269 ) ) ( not ( = ?auto_314264 ?auto_314270 ) ) ( not ( = ?auto_314265 ?auto_314266 ) ) ( not ( = ?auto_314265 ?auto_314267 ) ) ( not ( = ?auto_314265 ?auto_314268 ) ) ( not ( = ?auto_314265 ?auto_314269 ) ) ( not ( = ?auto_314265 ?auto_314270 ) ) ( not ( = ?auto_314266 ?auto_314267 ) ) ( not ( = ?auto_314266 ?auto_314268 ) ) ( not ( = ?auto_314266 ?auto_314269 ) ) ( not ( = ?auto_314266 ?auto_314270 ) ) ( not ( = ?auto_314267 ?auto_314268 ) ) ( not ( = ?auto_314267 ?auto_314269 ) ) ( not ( = ?auto_314267 ?auto_314270 ) ) ( not ( = ?auto_314268 ?auto_314269 ) ) ( not ( = ?auto_314268 ?auto_314270 ) ) ( not ( = ?auto_314269 ?auto_314270 ) ) ( ON ?auto_314268 ?auto_314269 ) ( ON ?auto_314267 ?auto_314268 ) ( ON ?auto_314266 ?auto_314267 ) ( CLEAR ?auto_314264 ) ( ON ?auto_314265 ?auto_314266 ) ( CLEAR ?auto_314265 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_314262 ?auto_314263 ?auto_314264 ?auto_314265 )
      ( MAKE-8PILE ?auto_314262 ?auto_314263 ?auto_314264 ?auto_314265 ?auto_314266 ?auto_314267 ?auto_314268 ?auto_314269 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_314279 - BLOCK
      ?auto_314280 - BLOCK
      ?auto_314281 - BLOCK
      ?auto_314282 - BLOCK
      ?auto_314283 - BLOCK
      ?auto_314284 - BLOCK
      ?auto_314285 - BLOCK
      ?auto_314286 - BLOCK
    )
    :vars
    (
      ?auto_314287 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_314286 ?auto_314287 ) ( ON-TABLE ?auto_314279 ) ( ON ?auto_314280 ?auto_314279 ) ( not ( = ?auto_314279 ?auto_314280 ) ) ( not ( = ?auto_314279 ?auto_314281 ) ) ( not ( = ?auto_314279 ?auto_314282 ) ) ( not ( = ?auto_314279 ?auto_314283 ) ) ( not ( = ?auto_314279 ?auto_314284 ) ) ( not ( = ?auto_314279 ?auto_314285 ) ) ( not ( = ?auto_314279 ?auto_314286 ) ) ( not ( = ?auto_314279 ?auto_314287 ) ) ( not ( = ?auto_314280 ?auto_314281 ) ) ( not ( = ?auto_314280 ?auto_314282 ) ) ( not ( = ?auto_314280 ?auto_314283 ) ) ( not ( = ?auto_314280 ?auto_314284 ) ) ( not ( = ?auto_314280 ?auto_314285 ) ) ( not ( = ?auto_314280 ?auto_314286 ) ) ( not ( = ?auto_314280 ?auto_314287 ) ) ( not ( = ?auto_314281 ?auto_314282 ) ) ( not ( = ?auto_314281 ?auto_314283 ) ) ( not ( = ?auto_314281 ?auto_314284 ) ) ( not ( = ?auto_314281 ?auto_314285 ) ) ( not ( = ?auto_314281 ?auto_314286 ) ) ( not ( = ?auto_314281 ?auto_314287 ) ) ( not ( = ?auto_314282 ?auto_314283 ) ) ( not ( = ?auto_314282 ?auto_314284 ) ) ( not ( = ?auto_314282 ?auto_314285 ) ) ( not ( = ?auto_314282 ?auto_314286 ) ) ( not ( = ?auto_314282 ?auto_314287 ) ) ( not ( = ?auto_314283 ?auto_314284 ) ) ( not ( = ?auto_314283 ?auto_314285 ) ) ( not ( = ?auto_314283 ?auto_314286 ) ) ( not ( = ?auto_314283 ?auto_314287 ) ) ( not ( = ?auto_314284 ?auto_314285 ) ) ( not ( = ?auto_314284 ?auto_314286 ) ) ( not ( = ?auto_314284 ?auto_314287 ) ) ( not ( = ?auto_314285 ?auto_314286 ) ) ( not ( = ?auto_314285 ?auto_314287 ) ) ( not ( = ?auto_314286 ?auto_314287 ) ) ( ON ?auto_314285 ?auto_314286 ) ( ON ?auto_314284 ?auto_314285 ) ( ON ?auto_314283 ?auto_314284 ) ( ON ?auto_314282 ?auto_314283 ) ( CLEAR ?auto_314280 ) ( ON ?auto_314281 ?auto_314282 ) ( CLEAR ?auto_314281 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_314279 ?auto_314280 ?auto_314281 )
      ( MAKE-8PILE ?auto_314279 ?auto_314280 ?auto_314281 ?auto_314282 ?auto_314283 ?auto_314284 ?auto_314285 ?auto_314286 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_314296 - BLOCK
      ?auto_314297 - BLOCK
      ?auto_314298 - BLOCK
      ?auto_314299 - BLOCK
      ?auto_314300 - BLOCK
      ?auto_314301 - BLOCK
      ?auto_314302 - BLOCK
      ?auto_314303 - BLOCK
    )
    :vars
    (
      ?auto_314304 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_314303 ?auto_314304 ) ( ON-TABLE ?auto_314296 ) ( ON ?auto_314297 ?auto_314296 ) ( not ( = ?auto_314296 ?auto_314297 ) ) ( not ( = ?auto_314296 ?auto_314298 ) ) ( not ( = ?auto_314296 ?auto_314299 ) ) ( not ( = ?auto_314296 ?auto_314300 ) ) ( not ( = ?auto_314296 ?auto_314301 ) ) ( not ( = ?auto_314296 ?auto_314302 ) ) ( not ( = ?auto_314296 ?auto_314303 ) ) ( not ( = ?auto_314296 ?auto_314304 ) ) ( not ( = ?auto_314297 ?auto_314298 ) ) ( not ( = ?auto_314297 ?auto_314299 ) ) ( not ( = ?auto_314297 ?auto_314300 ) ) ( not ( = ?auto_314297 ?auto_314301 ) ) ( not ( = ?auto_314297 ?auto_314302 ) ) ( not ( = ?auto_314297 ?auto_314303 ) ) ( not ( = ?auto_314297 ?auto_314304 ) ) ( not ( = ?auto_314298 ?auto_314299 ) ) ( not ( = ?auto_314298 ?auto_314300 ) ) ( not ( = ?auto_314298 ?auto_314301 ) ) ( not ( = ?auto_314298 ?auto_314302 ) ) ( not ( = ?auto_314298 ?auto_314303 ) ) ( not ( = ?auto_314298 ?auto_314304 ) ) ( not ( = ?auto_314299 ?auto_314300 ) ) ( not ( = ?auto_314299 ?auto_314301 ) ) ( not ( = ?auto_314299 ?auto_314302 ) ) ( not ( = ?auto_314299 ?auto_314303 ) ) ( not ( = ?auto_314299 ?auto_314304 ) ) ( not ( = ?auto_314300 ?auto_314301 ) ) ( not ( = ?auto_314300 ?auto_314302 ) ) ( not ( = ?auto_314300 ?auto_314303 ) ) ( not ( = ?auto_314300 ?auto_314304 ) ) ( not ( = ?auto_314301 ?auto_314302 ) ) ( not ( = ?auto_314301 ?auto_314303 ) ) ( not ( = ?auto_314301 ?auto_314304 ) ) ( not ( = ?auto_314302 ?auto_314303 ) ) ( not ( = ?auto_314302 ?auto_314304 ) ) ( not ( = ?auto_314303 ?auto_314304 ) ) ( ON ?auto_314302 ?auto_314303 ) ( ON ?auto_314301 ?auto_314302 ) ( ON ?auto_314300 ?auto_314301 ) ( ON ?auto_314299 ?auto_314300 ) ( CLEAR ?auto_314297 ) ( ON ?auto_314298 ?auto_314299 ) ( CLEAR ?auto_314298 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_314296 ?auto_314297 ?auto_314298 )
      ( MAKE-8PILE ?auto_314296 ?auto_314297 ?auto_314298 ?auto_314299 ?auto_314300 ?auto_314301 ?auto_314302 ?auto_314303 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_314313 - BLOCK
      ?auto_314314 - BLOCK
      ?auto_314315 - BLOCK
      ?auto_314316 - BLOCK
      ?auto_314317 - BLOCK
      ?auto_314318 - BLOCK
      ?auto_314319 - BLOCK
      ?auto_314320 - BLOCK
    )
    :vars
    (
      ?auto_314321 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_314320 ?auto_314321 ) ( ON-TABLE ?auto_314313 ) ( not ( = ?auto_314313 ?auto_314314 ) ) ( not ( = ?auto_314313 ?auto_314315 ) ) ( not ( = ?auto_314313 ?auto_314316 ) ) ( not ( = ?auto_314313 ?auto_314317 ) ) ( not ( = ?auto_314313 ?auto_314318 ) ) ( not ( = ?auto_314313 ?auto_314319 ) ) ( not ( = ?auto_314313 ?auto_314320 ) ) ( not ( = ?auto_314313 ?auto_314321 ) ) ( not ( = ?auto_314314 ?auto_314315 ) ) ( not ( = ?auto_314314 ?auto_314316 ) ) ( not ( = ?auto_314314 ?auto_314317 ) ) ( not ( = ?auto_314314 ?auto_314318 ) ) ( not ( = ?auto_314314 ?auto_314319 ) ) ( not ( = ?auto_314314 ?auto_314320 ) ) ( not ( = ?auto_314314 ?auto_314321 ) ) ( not ( = ?auto_314315 ?auto_314316 ) ) ( not ( = ?auto_314315 ?auto_314317 ) ) ( not ( = ?auto_314315 ?auto_314318 ) ) ( not ( = ?auto_314315 ?auto_314319 ) ) ( not ( = ?auto_314315 ?auto_314320 ) ) ( not ( = ?auto_314315 ?auto_314321 ) ) ( not ( = ?auto_314316 ?auto_314317 ) ) ( not ( = ?auto_314316 ?auto_314318 ) ) ( not ( = ?auto_314316 ?auto_314319 ) ) ( not ( = ?auto_314316 ?auto_314320 ) ) ( not ( = ?auto_314316 ?auto_314321 ) ) ( not ( = ?auto_314317 ?auto_314318 ) ) ( not ( = ?auto_314317 ?auto_314319 ) ) ( not ( = ?auto_314317 ?auto_314320 ) ) ( not ( = ?auto_314317 ?auto_314321 ) ) ( not ( = ?auto_314318 ?auto_314319 ) ) ( not ( = ?auto_314318 ?auto_314320 ) ) ( not ( = ?auto_314318 ?auto_314321 ) ) ( not ( = ?auto_314319 ?auto_314320 ) ) ( not ( = ?auto_314319 ?auto_314321 ) ) ( not ( = ?auto_314320 ?auto_314321 ) ) ( ON ?auto_314319 ?auto_314320 ) ( ON ?auto_314318 ?auto_314319 ) ( ON ?auto_314317 ?auto_314318 ) ( ON ?auto_314316 ?auto_314317 ) ( ON ?auto_314315 ?auto_314316 ) ( CLEAR ?auto_314313 ) ( ON ?auto_314314 ?auto_314315 ) ( CLEAR ?auto_314314 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_314313 ?auto_314314 )
      ( MAKE-8PILE ?auto_314313 ?auto_314314 ?auto_314315 ?auto_314316 ?auto_314317 ?auto_314318 ?auto_314319 ?auto_314320 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_314330 - BLOCK
      ?auto_314331 - BLOCK
      ?auto_314332 - BLOCK
      ?auto_314333 - BLOCK
      ?auto_314334 - BLOCK
      ?auto_314335 - BLOCK
      ?auto_314336 - BLOCK
      ?auto_314337 - BLOCK
    )
    :vars
    (
      ?auto_314338 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_314337 ?auto_314338 ) ( ON-TABLE ?auto_314330 ) ( not ( = ?auto_314330 ?auto_314331 ) ) ( not ( = ?auto_314330 ?auto_314332 ) ) ( not ( = ?auto_314330 ?auto_314333 ) ) ( not ( = ?auto_314330 ?auto_314334 ) ) ( not ( = ?auto_314330 ?auto_314335 ) ) ( not ( = ?auto_314330 ?auto_314336 ) ) ( not ( = ?auto_314330 ?auto_314337 ) ) ( not ( = ?auto_314330 ?auto_314338 ) ) ( not ( = ?auto_314331 ?auto_314332 ) ) ( not ( = ?auto_314331 ?auto_314333 ) ) ( not ( = ?auto_314331 ?auto_314334 ) ) ( not ( = ?auto_314331 ?auto_314335 ) ) ( not ( = ?auto_314331 ?auto_314336 ) ) ( not ( = ?auto_314331 ?auto_314337 ) ) ( not ( = ?auto_314331 ?auto_314338 ) ) ( not ( = ?auto_314332 ?auto_314333 ) ) ( not ( = ?auto_314332 ?auto_314334 ) ) ( not ( = ?auto_314332 ?auto_314335 ) ) ( not ( = ?auto_314332 ?auto_314336 ) ) ( not ( = ?auto_314332 ?auto_314337 ) ) ( not ( = ?auto_314332 ?auto_314338 ) ) ( not ( = ?auto_314333 ?auto_314334 ) ) ( not ( = ?auto_314333 ?auto_314335 ) ) ( not ( = ?auto_314333 ?auto_314336 ) ) ( not ( = ?auto_314333 ?auto_314337 ) ) ( not ( = ?auto_314333 ?auto_314338 ) ) ( not ( = ?auto_314334 ?auto_314335 ) ) ( not ( = ?auto_314334 ?auto_314336 ) ) ( not ( = ?auto_314334 ?auto_314337 ) ) ( not ( = ?auto_314334 ?auto_314338 ) ) ( not ( = ?auto_314335 ?auto_314336 ) ) ( not ( = ?auto_314335 ?auto_314337 ) ) ( not ( = ?auto_314335 ?auto_314338 ) ) ( not ( = ?auto_314336 ?auto_314337 ) ) ( not ( = ?auto_314336 ?auto_314338 ) ) ( not ( = ?auto_314337 ?auto_314338 ) ) ( ON ?auto_314336 ?auto_314337 ) ( ON ?auto_314335 ?auto_314336 ) ( ON ?auto_314334 ?auto_314335 ) ( ON ?auto_314333 ?auto_314334 ) ( ON ?auto_314332 ?auto_314333 ) ( CLEAR ?auto_314330 ) ( ON ?auto_314331 ?auto_314332 ) ( CLEAR ?auto_314331 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_314330 ?auto_314331 )
      ( MAKE-8PILE ?auto_314330 ?auto_314331 ?auto_314332 ?auto_314333 ?auto_314334 ?auto_314335 ?auto_314336 ?auto_314337 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_314347 - BLOCK
      ?auto_314348 - BLOCK
      ?auto_314349 - BLOCK
      ?auto_314350 - BLOCK
      ?auto_314351 - BLOCK
      ?auto_314352 - BLOCK
      ?auto_314353 - BLOCK
      ?auto_314354 - BLOCK
    )
    :vars
    (
      ?auto_314355 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_314354 ?auto_314355 ) ( not ( = ?auto_314347 ?auto_314348 ) ) ( not ( = ?auto_314347 ?auto_314349 ) ) ( not ( = ?auto_314347 ?auto_314350 ) ) ( not ( = ?auto_314347 ?auto_314351 ) ) ( not ( = ?auto_314347 ?auto_314352 ) ) ( not ( = ?auto_314347 ?auto_314353 ) ) ( not ( = ?auto_314347 ?auto_314354 ) ) ( not ( = ?auto_314347 ?auto_314355 ) ) ( not ( = ?auto_314348 ?auto_314349 ) ) ( not ( = ?auto_314348 ?auto_314350 ) ) ( not ( = ?auto_314348 ?auto_314351 ) ) ( not ( = ?auto_314348 ?auto_314352 ) ) ( not ( = ?auto_314348 ?auto_314353 ) ) ( not ( = ?auto_314348 ?auto_314354 ) ) ( not ( = ?auto_314348 ?auto_314355 ) ) ( not ( = ?auto_314349 ?auto_314350 ) ) ( not ( = ?auto_314349 ?auto_314351 ) ) ( not ( = ?auto_314349 ?auto_314352 ) ) ( not ( = ?auto_314349 ?auto_314353 ) ) ( not ( = ?auto_314349 ?auto_314354 ) ) ( not ( = ?auto_314349 ?auto_314355 ) ) ( not ( = ?auto_314350 ?auto_314351 ) ) ( not ( = ?auto_314350 ?auto_314352 ) ) ( not ( = ?auto_314350 ?auto_314353 ) ) ( not ( = ?auto_314350 ?auto_314354 ) ) ( not ( = ?auto_314350 ?auto_314355 ) ) ( not ( = ?auto_314351 ?auto_314352 ) ) ( not ( = ?auto_314351 ?auto_314353 ) ) ( not ( = ?auto_314351 ?auto_314354 ) ) ( not ( = ?auto_314351 ?auto_314355 ) ) ( not ( = ?auto_314352 ?auto_314353 ) ) ( not ( = ?auto_314352 ?auto_314354 ) ) ( not ( = ?auto_314352 ?auto_314355 ) ) ( not ( = ?auto_314353 ?auto_314354 ) ) ( not ( = ?auto_314353 ?auto_314355 ) ) ( not ( = ?auto_314354 ?auto_314355 ) ) ( ON ?auto_314353 ?auto_314354 ) ( ON ?auto_314352 ?auto_314353 ) ( ON ?auto_314351 ?auto_314352 ) ( ON ?auto_314350 ?auto_314351 ) ( ON ?auto_314349 ?auto_314350 ) ( ON ?auto_314348 ?auto_314349 ) ( ON ?auto_314347 ?auto_314348 ) ( CLEAR ?auto_314347 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_314347 )
      ( MAKE-8PILE ?auto_314347 ?auto_314348 ?auto_314349 ?auto_314350 ?auto_314351 ?auto_314352 ?auto_314353 ?auto_314354 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_314364 - BLOCK
      ?auto_314365 - BLOCK
      ?auto_314366 - BLOCK
      ?auto_314367 - BLOCK
      ?auto_314368 - BLOCK
      ?auto_314369 - BLOCK
      ?auto_314370 - BLOCK
      ?auto_314371 - BLOCK
    )
    :vars
    (
      ?auto_314372 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_314371 ?auto_314372 ) ( not ( = ?auto_314364 ?auto_314365 ) ) ( not ( = ?auto_314364 ?auto_314366 ) ) ( not ( = ?auto_314364 ?auto_314367 ) ) ( not ( = ?auto_314364 ?auto_314368 ) ) ( not ( = ?auto_314364 ?auto_314369 ) ) ( not ( = ?auto_314364 ?auto_314370 ) ) ( not ( = ?auto_314364 ?auto_314371 ) ) ( not ( = ?auto_314364 ?auto_314372 ) ) ( not ( = ?auto_314365 ?auto_314366 ) ) ( not ( = ?auto_314365 ?auto_314367 ) ) ( not ( = ?auto_314365 ?auto_314368 ) ) ( not ( = ?auto_314365 ?auto_314369 ) ) ( not ( = ?auto_314365 ?auto_314370 ) ) ( not ( = ?auto_314365 ?auto_314371 ) ) ( not ( = ?auto_314365 ?auto_314372 ) ) ( not ( = ?auto_314366 ?auto_314367 ) ) ( not ( = ?auto_314366 ?auto_314368 ) ) ( not ( = ?auto_314366 ?auto_314369 ) ) ( not ( = ?auto_314366 ?auto_314370 ) ) ( not ( = ?auto_314366 ?auto_314371 ) ) ( not ( = ?auto_314366 ?auto_314372 ) ) ( not ( = ?auto_314367 ?auto_314368 ) ) ( not ( = ?auto_314367 ?auto_314369 ) ) ( not ( = ?auto_314367 ?auto_314370 ) ) ( not ( = ?auto_314367 ?auto_314371 ) ) ( not ( = ?auto_314367 ?auto_314372 ) ) ( not ( = ?auto_314368 ?auto_314369 ) ) ( not ( = ?auto_314368 ?auto_314370 ) ) ( not ( = ?auto_314368 ?auto_314371 ) ) ( not ( = ?auto_314368 ?auto_314372 ) ) ( not ( = ?auto_314369 ?auto_314370 ) ) ( not ( = ?auto_314369 ?auto_314371 ) ) ( not ( = ?auto_314369 ?auto_314372 ) ) ( not ( = ?auto_314370 ?auto_314371 ) ) ( not ( = ?auto_314370 ?auto_314372 ) ) ( not ( = ?auto_314371 ?auto_314372 ) ) ( ON ?auto_314370 ?auto_314371 ) ( ON ?auto_314369 ?auto_314370 ) ( ON ?auto_314368 ?auto_314369 ) ( ON ?auto_314367 ?auto_314368 ) ( ON ?auto_314366 ?auto_314367 ) ( ON ?auto_314365 ?auto_314366 ) ( ON ?auto_314364 ?auto_314365 ) ( CLEAR ?auto_314364 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_314364 )
      ( MAKE-8PILE ?auto_314364 ?auto_314365 ?auto_314366 ?auto_314367 ?auto_314368 ?auto_314369 ?auto_314370 ?auto_314371 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_314382 - BLOCK
      ?auto_314383 - BLOCK
      ?auto_314384 - BLOCK
      ?auto_314385 - BLOCK
      ?auto_314386 - BLOCK
      ?auto_314387 - BLOCK
      ?auto_314388 - BLOCK
      ?auto_314389 - BLOCK
      ?auto_314390 - BLOCK
    )
    :vars
    (
      ?auto_314391 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_314389 ) ( ON ?auto_314390 ?auto_314391 ) ( CLEAR ?auto_314390 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_314382 ) ( ON ?auto_314383 ?auto_314382 ) ( ON ?auto_314384 ?auto_314383 ) ( ON ?auto_314385 ?auto_314384 ) ( ON ?auto_314386 ?auto_314385 ) ( ON ?auto_314387 ?auto_314386 ) ( ON ?auto_314388 ?auto_314387 ) ( ON ?auto_314389 ?auto_314388 ) ( not ( = ?auto_314382 ?auto_314383 ) ) ( not ( = ?auto_314382 ?auto_314384 ) ) ( not ( = ?auto_314382 ?auto_314385 ) ) ( not ( = ?auto_314382 ?auto_314386 ) ) ( not ( = ?auto_314382 ?auto_314387 ) ) ( not ( = ?auto_314382 ?auto_314388 ) ) ( not ( = ?auto_314382 ?auto_314389 ) ) ( not ( = ?auto_314382 ?auto_314390 ) ) ( not ( = ?auto_314382 ?auto_314391 ) ) ( not ( = ?auto_314383 ?auto_314384 ) ) ( not ( = ?auto_314383 ?auto_314385 ) ) ( not ( = ?auto_314383 ?auto_314386 ) ) ( not ( = ?auto_314383 ?auto_314387 ) ) ( not ( = ?auto_314383 ?auto_314388 ) ) ( not ( = ?auto_314383 ?auto_314389 ) ) ( not ( = ?auto_314383 ?auto_314390 ) ) ( not ( = ?auto_314383 ?auto_314391 ) ) ( not ( = ?auto_314384 ?auto_314385 ) ) ( not ( = ?auto_314384 ?auto_314386 ) ) ( not ( = ?auto_314384 ?auto_314387 ) ) ( not ( = ?auto_314384 ?auto_314388 ) ) ( not ( = ?auto_314384 ?auto_314389 ) ) ( not ( = ?auto_314384 ?auto_314390 ) ) ( not ( = ?auto_314384 ?auto_314391 ) ) ( not ( = ?auto_314385 ?auto_314386 ) ) ( not ( = ?auto_314385 ?auto_314387 ) ) ( not ( = ?auto_314385 ?auto_314388 ) ) ( not ( = ?auto_314385 ?auto_314389 ) ) ( not ( = ?auto_314385 ?auto_314390 ) ) ( not ( = ?auto_314385 ?auto_314391 ) ) ( not ( = ?auto_314386 ?auto_314387 ) ) ( not ( = ?auto_314386 ?auto_314388 ) ) ( not ( = ?auto_314386 ?auto_314389 ) ) ( not ( = ?auto_314386 ?auto_314390 ) ) ( not ( = ?auto_314386 ?auto_314391 ) ) ( not ( = ?auto_314387 ?auto_314388 ) ) ( not ( = ?auto_314387 ?auto_314389 ) ) ( not ( = ?auto_314387 ?auto_314390 ) ) ( not ( = ?auto_314387 ?auto_314391 ) ) ( not ( = ?auto_314388 ?auto_314389 ) ) ( not ( = ?auto_314388 ?auto_314390 ) ) ( not ( = ?auto_314388 ?auto_314391 ) ) ( not ( = ?auto_314389 ?auto_314390 ) ) ( not ( = ?auto_314389 ?auto_314391 ) ) ( not ( = ?auto_314390 ?auto_314391 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_314390 ?auto_314391 )
      ( !STACK ?auto_314390 ?auto_314389 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_314401 - BLOCK
      ?auto_314402 - BLOCK
      ?auto_314403 - BLOCK
      ?auto_314404 - BLOCK
      ?auto_314405 - BLOCK
      ?auto_314406 - BLOCK
      ?auto_314407 - BLOCK
      ?auto_314408 - BLOCK
      ?auto_314409 - BLOCK
    )
    :vars
    (
      ?auto_314410 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_314408 ) ( ON ?auto_314409 ?auto_314410 ) ( CLEAR ?auto_314409 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_314401 ) ( ON ?auto_314402 ?auto_314401 ) ( ON ?auto_314403 ?auto_314402 ) ( ON ?auto_314404 ?auto_314403 ) ( ON ?auto_314405 ?auto_314404 ) ( ON ?auto_314406 ?auto_314405 ) ( ON ?auto_314407 ?auto_314406 ) ( ON ?auto_314408 ?auto_314407 ) ( not ( = ?auto_314401 ?auto_314402 ) ) ( not ( = ?auto_314401 ?auto_314403 ) ) ( not ( = ?auto_314401 ?auto_314404 ) ) ( not ( = ?auto_314401 ?auto_314405 ) ) ( not ( = ?auto_314401 ?auto_314406 ) ) ( not ( = ?auto_314401 ?auto_314407 ) ) ( not ( = ?auto_314401 ?auto_314408 ) ) ( not ( = ?auto_314401 ?auto_314409 ) ) ( not ( = ?auto_314401 ?auto_314410 ) ) ( not ( = ?auto_314402 ?auto_314403 ) ) ( not ( = ?auto_314402 ?auto_314404 ) ) ( not ( = ?auto_314402 ?auto_314405 ) ) ( not ( = ?auto_314402 ?auto_314406 ) ) ( not ( = ?auto_314402 ?auto_314407 ) ) ( not ( = ?auto_314402 ?auto_314408 ) ) ( not ( = ?auto_314402 ?auto_314409 ) ) ( not ( = ?auto_314402 ?auto_314410 ) ) ( not ( = ?auto_314403 ?auto_314404 ) ) ( not ( = ?auto_314403 ?auto_314405 ) ) ( not ( = ?auto_314403 ?auto_314406 ) ) ( not ( = ?auto_314403 ?auto_314407 ) ) ( not ( = ?auto_314403 ?auto_314408 ) ) ( not ( = ?auto_314403 ?auto_314409 ) ) ( not ( = ?auto_314403 ?auto_314410 ) ) ( not ( = ?auto_314404 ?auto_314405 ) ) ( not ( = ?auto_314404 ?auto_314406 ) ) ( not ( = ?auto_314404 ?auto_314407 ) ) ( not ( = ?auto_314404 ?auto_314408 ) ) ( not ( = ?auto_314404 ?auto_314409 ) ) ( not ( = ?auto_314404 ?auto_314410 ) ) ( not ( = ?auto_314405 ?auto_314406 ) ) ( not ( = ?auto_314405 ?auto_314407 ) ) ( not ( = ?auto_314405 ?auto_314408 ) ) ( not ( = ?auto_314405 ?auto_314409 ) ) ( not ( = ?auto_314405 ?auto_314410 ) ) ( not ( = ?auto_314406 ?auto_314407 ) ) ( not ( = ?auto_314406 ?auto_314408 ) ) ( not ( = ?auto_314406 ?auto_314409 ) ) ( not ( = ?auto_314406 ?auto_314410 ) ) ( not ( = ?auto_314407 ?auto_314408 ) ) ( not ( = ?auto_314407 ?auto_314409 ) ) ( not ( = ?auto_314407 ?auto_314410 ) ) ( not ( = ?auto_314408 ?auto_314409 ) ) ( not ( = ?auto_314408 ?auto_314410 ) ) ( not ( = ?auto_314409 ?auto_314410 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_314409 ?auto_314410 )
      ( !STACK ?auto_314409 ?auto_314408 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_314420 - BLOCK
      ?auto_314421 - BLOCK
      ?auto_314422 - BLOCK
      ?auto_314423 - BLOCK
      ?auto_314424 - BLOCK
      ?auto_314425 - BLOCK
      ?auto_314426 - BLOCK
      ?auto_314427 - BLOCK
      ?auto_314428 - BLOCK
    )
    :vars
    (
      ?auto_314429 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_314428 ?auto_314429 ) ( ON-TABLE ?auto_314420 ) ( ON ?auto_314421 ?auto_314420 ) ( ON ?auto_314422 ?auto_314421 ) ( ON ?auto_314423 ?auto_314422 ) ( ON ?auto_314424 ?auto_314423 ) ( ON ?auto_314425 ?auto_314424 ) ( ON ?auto_314426 ?auto_314425 ) ( not ( = ?auto_314420 ?auto_314421 ) ) ( not ( = ?auto_314420 ?auto_314422 ) ) ( not ( = ?auto_314420 ?auto_314423 ) ) ( not ( = ?auto_314420 ?auto_314424 ) ) ( not ( = ?auto_314420 ?auto_314425 ) ) ( not ( = ?auto_314420 ?auto_314426 ) ) ( not ( = ?auto_314420 ?auto_314427 ) ) ( not ( = ?auto_314420 ?auto_314428 ) ) ( not ( = ?auto_314420 ?auto_314429 ) ) ( not ( = ?auto_314421 ?auto_314422 ) ) ( not ( = ?auto_314421 ?auto_314423 ) ) ( not ( = ?auto_314421 ?auto_314424 ) ) ( not ( = ?auto_314421 ?auto_314425 ) ) ( not ( = ?auto_314421 ?auto_314426 ) ) ( not ( = ?auto_314421 ?auto_314427 ) ) ( not ( = ?auto_314421 ?auto_314428 ) ) ( not ( = ?auto_314421 ?auto_314429 ) ) ( not ( = ?auto_314422 ?auto_314423 ) ) ( not ( = ?auto_314422 ?auto_314424 ) ) ( not ( = ?auto_314422 ?auto_314425 ) ) ( not ( = ?auto_314422 ?auto_314426 ) ) ( not ( = ?auto_314422 ?auto_314427 ) ) ( not ( = ?auto_314422 ?auto_314428 ) ) ( not ( = ?auto_314422 ?auto_314429 ) ) ( not ( = ?auto_314423 ?auto_314424 ) ) ( not ( = ?auto_314423 ?auto_314425 ) ) ( not ( = ?auto_314423 ?auto_314426 ) ) ( not ( = ?auto_314423 ?auto_314427 ) ) ( not ( = ?auto_314423 ?auto_314428 ) ) ( not ( = ?auto_314423 ?auto_314429 ) ) ( not ( = ?auto_314424 ?auto_314425 ) ) ( not ( = ?auto_314424 ?auto_314426 ) ) ( not ( = ?auto_314424 ?auto_314427 ) ) ( not ( = ?auto_314424 ?auto_314428 ) ) ( not ( = ?auto_314424 ?auto_314429 ) ) ( not ( = ?auto_314425 ?auto_314426 ) ) ( not ( = ?auto_314425 ?auto_314427 ) ) ( not ( = ?auto_314425 ?auto_314428 ) ) ( not ( = ?auto_314425 ?auto_314429 ) ) ( not ( = ?auto_314426 ?auto_314427 ) ) ( not ( = ?auto_314426 ?auto_314428 ) ) ( not ( = ?auto_314426 ?auto_314429 ) ) ( not ( = ?auto_314427 ?auto_314428 ) ) ( not ( = ?auto_314427 ?auto_314429 ) ) ( not ( = ?auto_314428 ?auto_314429 ) ) ( CLEAR ?auto_314426 ) ( ON ?auto_314427 ?auto_314428 ) ( CLEAR ?auto_314427 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_314420 ?auto_314421 ?auto_314422 ?auto_314423 ?auto_314424 ?auto_314425 ?auto_314426 ?auto_314427 )
      ( MAKE-9PILE ?auto_314420 ?auto_314421 ?auto_314422 ?auto_314423 ?auto_314424 ?auto_314425 ?auto_314426 ?auto_314427 ?auto_314428 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_314439 - BLOCK
      ?auto_314440 - BLOCK
      ?auto_314441 - BLOCK
      ?auto_314442 - BLOCK
      ?auto_314443 - BLOCK
      ?auto_314444 - BLOCK
      ?auto_314445 - BLOCK
      ?auto_314446 - BLOCK
      ?auto_314447 - BLOCK
    )
    :vars
    (
      ?auto_314448 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_314447 ?auto_314448 ) ( ON-TABLE ?auto_314439 ) ( ON ?auto_314440 ?auto_314439 ) ( ON ?auto_314441 ?auto_314440 ) ( ON ?auto_314442 ?auto_314441 ) ( ON ?auto_314443 ?auto_314442 ) ( ON ?auto_314444 ?auto_314443 ) ( ON ?auto_314445 ?auto_314444 ) ( not ( = ?auto_314439 ?auto_314440 ) ) ( not ( = ?auto_314439 ?auto_314441 ) ) ( not ( = ?auto_314439 ?auto_314442 ) ) ( not ( = ?auto_314439 ?auto_314443 ) ) ( not ( = ?auto_314439 ?auto_314444 ) ) ( not ( = ?auto_314439 ?auto_314445 ) ) ( not ( = ?auto_314439 ?auto_314446 ) ) ( not ( = ?auto_314439 ?auto_314447 ) ) ( not ( = ?auto_314439 ?auto_314448 ) ) ( not ( = ?auto_314440 ?auto_314441 ) ) ( not ( = ?auto_314440 ?auto_314442 ) ) ( not ( = ?auto_314440 ?auto_314443 ) ) ( not ( = ?auto_314440 ?auto_314444 ) ) ( not ( = ?auto_314440 ?auto_314445 ) ) ( not ( = ?auto_314440 ?auto_314446 ) ) ( not ( = ?auto_314440 ?auto_314447 ) ) ( not ( = ?auto_314440 ?auto_314448 ) ) ( not ( = ?auto_314441 ?auto_314442 ) ) ( not ( = ?auto_314441 ?auto_314443 ) ) ( not ( = ?auto_314441 ?auto_314444 ) ) ( not ( = ?auto_314441 ?auto_314445 ) ) ( not ( = ?auto_314441 ?auto_314446 ) ) ( not ( = ?auto_314441 ?auto_314447 ) ) ( not ( = ?auto_314441 ?auto_314448 ) ) ( not ( = ?auto_314442 ?auto_314443 ) ) ( not ( = ?auto_314442 ?auto_314444 ) ) ( not ( = ?auto_314442 ?auto_314445 ) ) ( not ( = ?auto_314442 ?auto_314446 ) ) ( not ( = ?auto_314442 ?auto_314447 ) ) ( not ( = ?auto_314442 ?auto_314448 ) ) ( not ( = ?auto_314443 ?auto_314444 ) ) ( not ( = ?auto_314443 ?auto_314445 ) ) ( not ( = ?auto_314443 ?auto_314446 ) ) ( not ( = ?auto_314443 ?auto_314447 ) ) ( not ( = ?auto_314443 ?auto_314448 ) ) ( not ( = ?auto_314444 ?auto_314445 ) ) ( not ( = ?auto_314444 ?auto_314446 ) ) ( not ( = ?auto_314444 ?auto_314447 ) ) ( not ( = ?auto_314444 ?auto_314448 ) ) ( not ( = ?auto_314445 ?auto_314446 ) ) ( not ( = ?auto_314445 ?auto_314447 ) ) ( not ( = ?auto_314445 ?auto_314448 ) ) ( not ( = ?auto_314446 ?auto_314447 ) ) ( not ( = ?auto_314446 ?auto_314448 ) ) ( not ( = ?auto_314447 ?auto_314448 ) ) ( CLEAR ?auto_314445 ) ( ON ?auto_314446 ?auto_314447 ) ( CLEAR ?auto_314446 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_314439 ?auto_314440 ?auto_314441 ?auto_314442 ?auto_314443 ?auto_314444 ?auto_314445 ?auto_314446 )
      ( MAKE-9PILE ?auto_314439 ?auto_314440 ?auto_314441 ?auto_314442 ?auto_314443 ?auto_314444 ?auto_314445 ?auto_314446 ?auto_314447 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_314458 - BLOCK
      ?auto_314459 - BLOCK
      ?auto_314460 - BLOCK
      ?auto_314461 - BLOCK
      ?auto_314462 - BLOCK
      ?auto_314463 - BLOCK
      ?auto_314464 - BLOCK
      ?auto_314465 - BLOCK
      ?auto_314466 - BLOCK
    )
    :vars
    (
      ?auto_314467 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_314466 ?auto_314467 ) ( ON-TABLE ?auto_314458 ) ( ON ?auto_314459 ?auto_314458 ) ( ON ?auto_314460 ?auto_314459 ) ( ON ?auto_314461 ?auto_314460 ) ( ON ?auto_314462 ?auto_314461 ) ( ON ?auto_314463 ?auto_314462 ) ( not ( = ?auto_314458 ?auto_314459 ) ) ( not ( = ?auto_314458 ?auto_314460 ) ) ( not ( = ?auto_314458 ?auto_314461 ) ) ( not ( = ?auto_314458 ?auto_314462 ) ) ( not ( = ?auto_314458 ?auto_314463 ) ) ( not ( = ?auto_314458 ?auto_314464 ) ) ( not ( = ?auto_314458 ?auto_314465 ) ) ( not ( = ?auto_314458 ?auto_314466 ) ) ( not ( = ?auto_314458 ?auto_314467 ) ) ( not ( = ?auto_314459 ?auto_314460 ) ) ( not ( = ?auto_314459 ?auto_314461 ) ) ( not ( = ?auto_314459 ?auto_314462 ) ) ( not ( = ?auto_314459 ?auto_314463 ) ) ( not ( = ?auto_314459 ?auto_314464 ) ) ( not ( = ?auto_314459 ?auto_314465 ) ) ( not ( = ?auto_314459 ?auto_314466 ) ) ( not ( = ?auto_314459 ?auto_314467 ) ) ( not ( = ?auto_314460 ?auto_314461 ) ) ( not ( = ?auto_314460 ?auto_314462 ) ) ( not ( = ?auto_314460 ?auto_314463 ) ) ( not ( = ?auto_314460 ?auto_314464 ) ) ( not ( = ?auto_314460 ?auto_314465 ) ) ( not ( = ?auto_314460 ?auto_314466 ) ) ( not ( = ?auto_314460 ?auto_314467 ) ) ( not ( = ?auto_314461 ?auto_314462 ) ) ( not ( = ?auto_314461 ?auto_314463 ) ) ( not ( = ?auto_314461 ?auto_314464 ) ) ( not ( = ?auto_314461 ?auto_314465 ) ) ( not ( = ?auto_314461 ?auto_314466 ) ) ( not ( = ?auto_314461 ?auto_314467 ) ) ( not ( = ?auto_314462 ?auto_314463 ) ) ( not ( = ?auto_314462 ?auto_314464 ) ) ( not ( = ?auto_314462 ?auto_314465 ) ) ( not ( = ?auto_314462 ?auto_314466 ) ) ( not ( = ?auto_314462 ?auto_314467 ) ) ( not ( = ?auto_314463 ?auto_314464 ) ) ( not ( = ?auto_314463 ?auto_314465 ) ) ( not ( = ?auto_314463 ?auto_314466 ) ) ( not ( = ?auto_314463 ?auto_314467 ) ) ( not ( = ?auto_314464 ?auto_314465 ) ) ( not ( = ?auto_314464 ?auto_314466 ) ) ( not ( = ?auto_314464 ?auto_314467 ) ) ( not ( = ?auto_314465 ?auto_314466 ) ) ( not ( = ?auto_314465 ?auto_314467 ) ) ( not ( = ?auto_314466 ?auto_314467 ) ) ( ON ?auto_314465 ?auto_314466 ) ( CLEAR ?auto_314463 ) ( ON ?auto_314464 ?auto_314465 ) ( CLEAR ?auto_314464 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_314458 ?auto_314459 ?auto_314460 ?auto_314461 ?auto_314462 ?auto_314463 ?auto_314464 )
      ( MAKE-9PILE ?auto_314458 ?auto_314459 ?auto_314460 ?auto_314461 ?auto_314462 ?auto_314463 ?auto_314464 ?auto_314465 ?auto_314466 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_314477 - BLOCK
      ?auto_314478 - BLOCK
      ?auto_314479 - BLOCK
      ?auto_314480 - BLOCK
      ?auto_314481 - BLOCK
      ?auto_314482 - BLOCK
      ?auto_314483 - BLOCK
      ?auto_314484 - BLOCK
      ?auto_314485 - BLOCK
    )
    :vars
    (
      ?auto_314486 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_314485 ?auto_314486 ) ( ON-TABLE ?auto_314477 ) ( ON ?auto_314478 ?auto_314477 ) ( ON ?auto_314479 ?auto_314478 ) ( ON ?auto_314480 ?auto_314479 ) ( ON ?auto_314481 ?auto_314480 ) ( ON ?auto_314482 ?auto_314481 ) ( not ( = ?auto_314477 ?auto_314478 ) ) ( not ( = ?auto_314477 ?auto_314479 ) ) ( not ( = ?auto_314477 ?auto_314480 ) ) ( not ( = ?auto_314477 ?auto_314481 ) ) ( not ( = ?auto_314477 ?auto_314482 ) ) ( not ( = ?auto_314477 ?auto_314483 ) ) ( not ( = ?auto_314477 ?auto_314484 ) ) ( not ( = ?auto_314477 ?auto_314485 ) ) ( not ( = ?auto_314477 ?auto_314486 ) ) ( not ( = ?auto_314478 ?auto_314479 ) ) ( not ( = ?auto_314478 ?auto_314480 ) ) ( not ( = ?auto_314478 ?auto_314481 ) ) ( not ( = ?auto_314478 ?auto_314482 ) ) ( not ( = ?auto_314478 ?auto_314483 ) ) ( not ( = ?auto_314478 ?auto_314484 ) ) ( not ( = ?auto_314478 ?auto_314485 ) ) ( not ( = ?auto_314478 ?auto_314486 ) ) ( not ( = ?auto_314479 ?auto_314480 ) ) ( not ( = ?auto_314479 ?auto_314481 ) ) ( not ( = ?auto_314479 ?auto_314482 ) ) ( not ( = ?auto_314479 ?auto_314483 ) ) ( not ( = ?auto_314479 ?auto_314484 ) ) ( not ( = ?auto_314479 ?auto_314485 ) ) ( not ( = ?auto_314479 ?auto_314486 ) ) ( not ( = ?auto_314480 ?auto_314481 ) ) ( not ( = ?auto_314480 ?auto_314482 ) ) ( not ( = ?auto_314480 ?auto_314483 ) ) ( not ( = ?auto_314480 ?auto_314484 ) ) ( not ( = ?auto_314480 ?auto_314485 ) ) ( not ( = ?auto_314480 ?auto_314486 ) ) ( not ( = ?auto_314481 ?auto_314482 ) ) ( not ( = ?auto_314481 ?auto_314483 ) ) ( not ( = ?auto_314481 ?auto_314484 ) ) ( not ( = ?auto_314481 ?auto_314485 ) ) ( not ( = ?auto_314481 ?auto_314486 ) ) ( not ( = ?auto_314482 ?auto_314483 ) ) ( not ( = ?auto_314482 ?auto_314484 ) ) ( not ( = ?auto_314482 ?auto_314485 ) ) ( not ( = ?auto_314482 ?auto_314486 ) ) ( not ( = ?auto_314483 ?auto_314484 ) ) ( not ( = ?auto_314483 ?auto_314485 ) ) ( not ( = ?auto_314483 ?auto_314486 ) ) ( not ( = ?auto_314484 ?auto_314485 ) ) ( not ( = ?auto_314484 ?auto_314486 ) ) ( not ( = ?auto_314485 ?auto_314486 ) ) ( ON ?auto_314484 ?auto_314485 ) ( CLEAR ?auto_314482 ) ( ON ?auto_314483 ?auto_314484 ) ( CLEAR ?auto_314483 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_314477 ?auto_314478 ?auto_314479 ?auto_314480 ?auto_314481 ?auto_314482 ?auto_314483 )
      ( MAKE-9PILE ?auto_314477 ?auto_314478 ?auto_314479 ?auto_314480 ?auto_314481 ?auto_314482 ?auto_314483 ?auto_314484 ?auto_314485 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_314496 - BLOCK
      ?auto_314497 - BLOCK
      ?auto_314498 - BLOCK
      ?auto_314499 - BLOCK
      ?auto_314500 - BLOCK
      ?auto_314501 - BLOCK
      ?auto_314502 - BLOCK
      ?auto_314503 - BLOCK
      ?auto_314504 - BLOCK
    )
    :vars
    (
      ?auto_314505 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_314504 ?auto_314505 ) ( ON-TABLE ?auto_314496 ) ( ON ?auto_314497 ?auto_314496 ) ( ON ?auto_314498 ?auto_314497 ) ( ON ?auto_314499 ?auto_314498 ) ( ON ?auto_314500 ?auto_314499 ) ( not ( = ?auto_314496 ?auto_314497 ) ) ( not ( = ?auto_314496 ?auto_314498 ) ) ( not ( = ?auto_314496 ?auto_314499 ) ) ( not ( = ?auto_314496 ?auto_314500 ) ) ( not ( = ?auto_314496 ?auto_314501 ) ) ( not ( = ?auto_314496 ?auto_314502 ) ) ( not ( = ?auto_314496 ?auto_314503 ) ) ( not ( = ?auto_314496 ?auto_314504 ) ) ( not ( = ?auto_314496 ?auto_314505 ) ) ( not ( = ?auto_314497 ?auto_314498 ) ) ( not ( = ?auto_314497 ?auto_314499 ) ) ( not ( = ?auto_314497 ?auto_314500 ) ) ( not ( = ?auto_314497 ?auto_314501 ) ) ( not ( = ?auto_314497 ?auto_314502 ) ) ( not ( = ?auto_314497 ?auto_314503 ) ) ( not ( = ?auto_314497 ?auto_314504 ) ) ( not ( = ?auto_314497 ?auto_314505 ) ) ( not ( = ?auto_314498 ?auto_314499 ) ) ( not ( = ?auto_314498 ?auto_314500 ) ) ( not ( = ?auto_314498 ?auto_314501 ) ) ( not ( = ?auto_314498 ?auto_314502 ) ) ( not ( = ?auto_314498 ?auto_314503 ) ) ( not ( = ?auto_314498 ?auto_314504 ) ) ( not ( = ?auto_314498 ?auto_314505 ) ) ( not ( = ?auto_314499 ?auto_314500 ) ) ( not ( = ?auto_314499 ?auto_314501 ) ) ( not ( = ?auto_314499 ?auto_314502 ) ) ( not ( = ?auto_314499 ?auto_314503 ) ) ( not ( = ?auto_314499 ?auto_314504 ) ) ( not ( = ?auto_314499 ?auto_314505 ) ) ( not ( = ?auto_314500 ?auto_314501 ) ) ( not ( = ?auto_314500 ?auto_314502 ) ) ( not ( = ?auto_314500 ?auto_314503 ) ) ( not ( = ?auto_314500 ?auto_314504 ) ) ( not ( = ?auto_314500 ?auto_314505 ) ) ( not ( = ?auto_314501 ?auto_314502 ) ) ( not ( = ?auto_314501 ?auto_314503 ) ) ( not ( = ?auto_314501 ?auto_314504 ) ) ( not ( = ?auto_314501 ?auto_314505 ) ) ( not ( = ?auto_314502 ?auto_314503 ) ) ( not ( = ?auto_314502 ?auto_314504 ) ) ( not ( = ?auto_314502 ?auto_314505 ) ) ( not ( = ?auto_314503 ?auto_314504 ) ) ( not ( = ?auto_314503 ?auto_314505 ) ) ( not ( = ?auto_314504 ?auto_314505 ) ) ( ON ?auto_314503 ?auto_314504 ) ( ON ?auto_314502 ?auto_314503 ) ( CLEAR ?auto_314500 ) ( ON ?auto_314501 ?auto_314502 ) ( CLEAR ?auto_314501 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_314496 ?auto_314497 ?auto_314498 ?auto_314499 ?auto_314500 ?auto_314501 )
      ( MAKE-9PILE ?auto_314496 ?auto_314497 ?auto_314498 ?auto_314499 ?auto_314500 ?auto_314501 ?auto_314502 ?auto_314503 ?auto_314504 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_314515 - BLOCK
      ?auto_314516 - BLOCK
      ?auto_314517 - BLOCK
      ?auto_314518 - BLOCK
      ?auto_314519 - BLOCK
      ?auto_314520 - BLOCK
      ?auto_314521 - BLOCK
      ?auto_314522 - BLOCK
      ?auto_314523 - BLOCK
    )
    :vars
    (
      ?auto_314524 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_314523 ?auto_314524 ) ( ON-TABLE ?auto_314515 ) ( ON ?auto_314516 ?auto_314515 ) ( ON ?auto_314517 ?auto_314516 ) ( ON ?auto_314518 ?auto_314517 ) ( ON ?auto_314519 ?auto_314518 ) ( not ( = ?auto_314515 ?auto_314516 ) ) ( not ( = ?auto_314515 ?auto_314517 ) ) ( not ( = ?auto_314515 ?auto_314518 ) ) ( not ( = ?auto_314515 ?auto_314519 ) ) ( not ( = ?auto_314515 ?auto_314520 ) ) ( not ( = ?auto_314515 ?auto_314521 ) ) ( not ( = ?auto_314515 ?auto_314522 ) ) ( not ( = ?auto_314515 ?auto_314523 ) ) ( not ( = ?auto_314515 ?auto_314524 ) ) ( not ( = ?auto_314516 ?auto_314517 ) ) ( not ( = ?auto_314516 ?auto_314518 ) ) ( not ( = ?auto_314516 ?auto_314519 ) ) ( not ( = ?auto_314516 ?auto_314520 ) ) ( not ( = ?auto_314516 ?auto_314521 ) ) ( not ( = ?auto_314516 ?auto_314522 ) ) ( not ( = ?auto_314516 ?auto_314523 ) ) ( not ( = ?auto_314516 ?auto_314524 ) ) ( not ( = ?auto_314517 ?auto_314518 ) ) ( not ( = ?auto_314517 ?auto_314519 ) ) ( not ( = ?auto_314517 ?auto_314520 ) ) ( not ( = ?auto_314517 ?auto_314521 ) ) ( not ( = ?auto_314517 ?auto_314522 ) ) ( not ( = ?auto_314517 ?auto_314523 ) ) ( not ( = ?auto_314517 ?auto_314524 ) ) ( not ( = ?auto_314518 ?auto_314519 ) ) ( not ( = ?auto_314518 ?auto_314520 ) ) ( not ( = ?auto_314518 ?auto_314521 ) ) ( not ( = ?auto_314518 ?auto_314522 ) ) ( not ( = ?auto_314518 ?auto_314523 ) ) ( not ( = ?auto_314518 ?auto_314524 ) ) ( not ( = ?auto_314519 ?auto_314520 ) ) ( not ( = ?auto_314519 ?auto_314521 ) ) ( not ( = ?auto_314519 ?auto_314522 ) ) ( not ( = ?auto_314519 ?auto_314523 ) ) ( not ( = ?auto_314519 ?auto_314524 ) ) ( not ( = ?auto_314520 ?auto_314521 ) ) ( not ( = ?auto_314520 ?auto_314522 ) ) ( not ( = ?auto_314520 ?auto_314523 ) ) ( not ( = ?auto_314520 ?auto_314524 ) ) ( not ( = ?auto_314521 ?auto_314522 ) ) ( not ( = ?auto_314521 ?auto_314523 ) ) ( not ( = ?auto_314521 ?auto_314524 ) ) ( not ( = ?auto_314522 ?auto_314523 ) ) ( not ( = ?auto_314522 ?auto_314524 ) ) ( not ( = ?auto_314523 ?auto_314524 ) ) ( ON ?auto_314522 ?auto_314523 ) ( ON ?auto_314521 ?auto_314522 ) ( CLEAR ?auto_314519 ) ( ON ?auto_314520 ?auto_314521 ) ( CLEAR ?auto_314520 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_314515 ?auto_314516 ?auto_314517 ?auto_314518 ?auto_314519 ?auto_314520 )
      ( MAKE-9PILE ?auto_314515 ?auto_314516 ?auto_314517 ?auto_314518 ?auto_314519 ?auto_314520 ?auto_314521 ?auto_314522 ?auto_314523 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_314534 - BLOCK
      ?auto_314535 - BLOCK
      ?auto_314536 - BLOCK
      ?auto_314537 - BLOCK
      ?auto_314538 - BLOCK
      ?auto_314539 - BLOCK
      ?auto_314540 - BLOCK
      ?auto_314541 - BLOCK
      ?auto_314542 - BLOCK
    )
    :vars
    (
      ?auto_314543 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_314542 ?auto_314543 ) ( ON-TABLE ?auto_314534 ) ( ON ?auto_314535 ?auto_314534 ) ( ON ?auto_314536 ?auto_314535 ) ( ON ?auto_314537 ?auto_314536 ) ( not ( = ?auto_314534 ?auto_314535 ) ) ( not ( = ?auto_314534 ?auto_314536 ) ) ( not ( = ?auto_314534 ?auto_314537 ) ) ( not ( = ?auto_314534 ?auto_314538 ) ) ( not ( = ?auto_314534 ?auto_314539 ) ) ( not ( = ?auto_314534 ?auto_314540 ) ) ( not ( = ?auto_314534 ?auto_314541 ) ) ( not ( = ?auto_314534 ?auto_314542 ) ) ( not ( = ?auto_314534 ?auto_314543 ) ) ( not ( = ?auto_314535 ?auto_314536 ) ) ( not ( = ?auto_314535 ?auto_314537 ) ) ( not ( = ?auto_314535 ?auto_314538 ) ) ( not ( = ?auto_314535 ?auto_314539 ) ) ( not ( = ?auto_314535 ?auto_314540 ) ) ( not ( = ?auto_314535 ?auto_314541 ) ) ( not ( = ?auto_314535 ?auto_314542 ) ) ( not ( = ?auto_314535 ?auto_314543 ) ) ( not ( = ?auto_314536 ?auto_314537 ) ) ( not ( = ?auto_314536 ?auto_314538 ) ) ( not ( = ?auto_314536 ?auto_314539 ) ) ( not ( = ?auto_314536 ?auto_314540 ) ) ( not ( = ?auto_314536 ?auto_314541 ) ) ( not ( = ?auto_314536 ?auto_314542 ) ) ( not ( = ?auto_314536 ?auto_314543 ) ) ( not ( = ?auto_314537 ?auto_314538 ) ) ( not ( = ?auto_314537 ?auto_314539 ) ) ( not ( = ?auto_314537 ?auto_314540 ) ) ( not ( = ?auto_314537 ?auto_314541 ) ) ( not ( = ?auto_314537 ?auto_314542 ) ) ( not ( = ?auto_314537 ?auto_314543 ) ) ( not ( = ?auto_314538 ?auto_314539 ) ) ( not ( = ?auto_314538 ?auto_314540 ) ) ( not ( = ?auto_314538 ?auto_314541 ) ) ( not ( = ?auto_314538 ?auto_314542 ) ) ( not ( = ?auto_314538 ?auto_314543 ) ) ( not ( = ?auto_314539 ?auto_314540 ) ) ( not ( = ?auto_314539 ?auto_314541 ) ) ( not ( = ?auto_314539 ?auto_314542 ) ) ( not ( = ?auto_314539 ?auto_314543 ) ) ( not ( = ?auto_314540 ?auto_314541 ) ) ( not ( = ?auto_314540 ?auto_314542 ) ) ( not ( = ?auto_314540 ?auto_314543 ) ) ( not ( = ?auto_314541 ?auto_314542 ) ) ( not ( = ?auto_314541 ?auto_314543 ) ) ( not ( = ?auto_314542 ?auto_314543 ) ) ( ON ?auto_314541 ?auto_314542 ) ( ON ?auto_314540 ?auto_314541 ) ( ON ?auto_314539 ?auto_314540 ) ( CLEAR ?auto_314537 ) ( ON ?auto_314538 ?auto_314539 ) ( CLEAR ?auto_314538 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_314534 ?auto_314535 ?auto_314536 ?auto_314537 ?auto_314538 )
      ( MAKE-9PILE ?auto_314534 ?auto_314535 ?auto_314536 ?auto_314537 ?auto_314538 ?auto_314539 ?auto_314540 ?auto_314541 ?auto_314542 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_314553 - BLOCK
      ?auto_314554 - BLOCK
      ?auto_314555 - BLOCK
      ?auto_314556 - BLOCK
      ?auto_314557 - BLOCK
      ?auto_314558 - BLOCK
      ?auto_314559 - BLOCK
      ?auto_314560 - BLOCK
      ?auto_314561 - BLOCK
    )
    :vars
    (
      ?auto_314562 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_314561 ?auto_314562 ) ( ON-TABLE ?auto_314553 ) ( ON ?auto_314554 ?auto_314553 ) ( ON ?auto_314555 ?auto_314554 ) ( ON ?auto_314556 ?auto_314555 ) ( not ( = ?auto_314553 ?auto_314554 ) ) ( not ( = ?auto_314553 ?auto_314555 ) ) ( not ( = ?auto_314553 ?auto_314556 ) ) ( not ( = ?auto_314553 ?auto_314557 ) ) ( not ( = ?auto_314553 ?auto_314558 ) ) ( not ( = ?auto_314553 ?auto_314559 ) ) ( not ( = ?auto_314553 ?auto_314560 ) ) ( not ( = ?auto_314553 ?auto_314561 ) ) ( not ( = ?auto_314553 ?auto_314562 ) ) ( not ( = ?auto_314554 ?auto_314555 ) ) ( not ( = ?auto_314554 ?auto_314556 ) ) ( not ( = ?auto_314554 ?auto_314557 ) ) ( not ( = ?auto_314554 ?auto_314558 ) ) ( not ( = ?auto_314554 ?auto_314559 ) ) ( not ( = ?auto_314554 ?auto_314560 ) ) ( not ( = ?auto_314554 ?auto_314561 ) ) ( not ( = ?auto_314554 ?auto_314562 ) ) ( not ( = ?auto_314555 ?auto_314556 ) ) ( not ( = ?auto_314555 ?auto_314557 ) ) ( not ( = ?auto_314555 ?auto_314558 ) ) ( not ( = ?auto_314555 ?auto_314559 ) ) ( not ( = ?auto_314555 ?auto_314560 ) ) ( not ( = ?auto_314555 ?auto_314561 ) ) ( not ( = ?auto_314555 ?auto_314562 ) ) ( not ( = ?auto_314556 ?auto_314557 ) ) ( not ( = ?auto_314556 ?auto_314558 ) ) ( not ( = ?auto_314556 ?auto_314559 ) ) ( not ( = ?auto_314556 ?auto_314560 ) ) ( not ( = ?auto_314556 ?auto_314561 ) ) ( not ( = ?auto_314556 ?auto_314562 ) ) ( not ( = ?auto_314557 ?auto_314558 ) ) ( not ( = ?auto_314557 ?auto_314559 ) ) ( not ( = ?auto_314557 ?auto_314560 ) ) ( not ( = ?auto_314557 ?auto_314561 ) ) ( not ( = ?auto_314557 ?auto_314562 ) ) ( not ( = ?auto_314558 ?auto_314559 ) ) ( not ( = ?auto_314558 ?auto_314560 ) ) ( not ( = ?auto_314558 ?auto_314561 ) ) ( not ( = ?auto_314558 ?auto_314562 ) ) ( not ( = ?auto_314559 ?auto_314560 ) ) ( not ( = ?auto_314559 ?auto_314561 ) ) ( not ( = ?auto_314559 ?auto_314562 ) ) ( not ( = ?auto_314560 ?auto_314561 ) ) ( not ( = ?auto_314560 ?auto_314562 ) ) ( not ( = ?auto_314561 ?auto_314562 ) ) ( ON ?auto_314560 ?auto_314561 ) ( ON ?auto_314559 ?auto_314560 ) ( ON ?auto_314558 ?auto_314559 ) ( CLEAR ?auto_314556 ) ( ON ?auto_314557 ?auto_314558 ) ( CLEAR ?auto_314557 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_314553 ?auto_314554 ?auto_314555 ?auto_314556 ?auto_314557 )
      ( MAKE-9PILE ?auto_314553 ?auto_314554 ?auto_314555 ?auto_314556 ?auto_314557 ?auto_314558 ?auto_314559 ?auto_314560 ?auto_314561 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_314572 - BLOCK
      ?auto_314573 - BLOCK
      ?auto_314574 - BLOCK
      ?auto_314575 - BLOCK
      ?auto_314576 - BLOCK
      ?auto_314577 - BLOCK
      ?auto_314578 - BLOCK
      ?auto_314579 - BLOCK
      ?auto_314580 - BLOCK
    )
    :vars
    (
      ?auto_314581 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_314580 ?auto_314581 ) ( ON-TABLE ?auto_314572 ) ( ON ?auto_314573 ?auto_314572 ) ( ON ?auto_314574 ?auto_314573 ) ( not ( = ?auto_314572 ?auto_314573 ) ) ( not ( = ?auto_314572 ?auto_314574 ) ) ( not ( = ?auto_314572 ?auto_314575 ) ) ( not ( = ?auto_314572 ?auto_314576 ) ) ( not ( = ?auto_314572 ?auto_314577 ) ) ( not ( = ?auto_314572 ?auto_314578 ) ) ( not ( = ?auto_314572 ?auto_314579 ) ) ( not ( = ?auto_314572 ?auto_314580 ) ) ( not ( = ?auto_314572 ?auto_314581 ) ) ( not ( = ?auto_314573 ?auto_314574 ) ) ( not ( = ?auto_314573 ?auto_314575 ) ) ( not ( = ?auto_314573 ?auto_314576 ) ) ( not ( = ?auto_314573 ?auto_314577 ) ) ( not ( = ?auto_314573 ?auto_314578 ) ) ( not ( = ?auto_314573 ?auto_314579 ) ) ( not ( = ?auto_314573 ?auto_314580 ) ) ( not ( = ?auto_314573 ?auto_314581 ) ) ( not ( = ?auto_314574 ?auto_314575 ) ) ( not ( = ?auto_314574 ?auto_314576 ) ) ( not ( = ?auto_314574 ?auto_314577 ) ) ( not ( = ?auto_314574 ?auto_314578 ) ) ( not ( = ?auto_314574 ?auto_314579 ) ) ( not ( = ?auto_314574 ?auto_314580 ) ) ( not ( = ?auto_314574 ?auto_314581 ) ) ( not ( = ?auto_314575 ?auto_314576 ) ) ( not ( = ?auto_314575 ?auto_314577 ) ) ( not ( = ?auto_314575 ?auto_314578 ) ) ( not ( = ?auto_314575 ?auto_314579 ) ) ( not ( = ?auto_314575 ?auto_314580 ) ) ( not ( = ?auto_314575 ?auto_314581 ) ) ( not ( = ?auto_314576 ?auto_314577 ) ) ( not ( = ?auto_314576 ?auto_314578 ) ) ( not ( = ?auto_314576 ?auto_314579 ) ) ( not ( = ?auto_314576 ?auto_314580 ) ) ( not ( = ?auto_314576 ?auto_314581 ) ) ( not ( = ?auto_314577 ?auto_314578 ) ) ( not ( = ?auto_314577 ?auto_314579 ) ) ( not ( = ?auto_314577 ?auto_314580 ) ) ( not ( = ?auto_314577 ?auto_314581 ) ) ( not ( = ?auto_314578 ?auto_314579 ) ) ( not ( = ?auto_314578 ?auto_314580 ) ) ( not ( = ?auto_314578 ?auto_314581 ) ) ( not ( = ?auto_314579 ?auto_314580 ) ) ( not ( = ?auto_314579 ?auto_314581 ) ) ( not ( = ?auto_314580 ?auto_314581 ) ) ( ON ?auto_314579 ?auto_314580 ) ( ON ?auto_314578 ?auto_314579 ) ( ON ?auto_314577 ?auto_314578 ) ( ON ?auto_314576 ?auto_314577 ) ( CLEAR ?auto_314574 ) ( ON ?auto_314575 ?auto_314576 ) ( CLEAR ?auto_314575 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_314572 ?auto_314573 ?auto_314574 ?auto_314575 )
      ( MAKE-9PILE ?auto_314572 ?auto_314573 ?auto_314574 ?auto_314575 ?auto_314576 ?auto_314577 ?auto_314578 ?auto_314579 ?auto_314580 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_314591 - BLOCK
      ?auto_314592 - BLOCK
      ?auto_314593 - BLOCK
      ?auto_314594 - BLOCK
      ?auto_314595 - BLOCK
      ?auto_314596 - BLOCK
      ?auto_314597 - BLOCK
      ?auto_314598 - BLOCK
      ?auto_314599 - BLOCK
    )
    :vars
    (
      ?auto_314600 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_314599 ?auto_314600 ) ( ON-TABLE ?auto_314591 ) ( ON ?auto_314592 ?auto_314591 ) ( ON ?auto_314593 ?auto_314592 ) ( not ( = ?auto_314591 ?auto_314592 ) ) ( not ( = ?auto_314591 ?auto_314593 ) ) ( not ( = ?auto_314591 ?auto_314594 ) ) ( not ( = ?auto_314591 ?auto_314595 ) ) ( not ( = ?auto_314591 ?auto_314596 ) ) ( not ( = ?auto_314591 ?auto_314597 ) ) ( not ( = ?auto_314591 ?auto_314598 ) ) ( not ( = ?auto_314591 ?auto_314599 ) ) ( not ( = ?auto_314591 ?auto_314600 ) ) ( not ( = ?auto_314592 ?auto_314593 ) ) ( not ( = ?auto_314592 ?auto_314594 ) ) ( not ( = ?auto_314592 ?auto_314595 ) ) ( not ( = ?auto_314592 ?auto_314596 ) ) ( not ( = ?auto_314592 ?auto_314597 ) ) ( not ( = ?auto_314592 ?auto_314598 ) ) ( not ( = ?auto_314592 ?auto_314599 ) ) ( not ( = ?auto_314592 ?auto_314600 ) ) ( not ( = ?auto_314593 ?auto_314594 ) ) ( not ( = ?auto_314593 ?auto_314595 ) ) ( not ( = ?auto_314593 ?auto_314596 ) ) ( not ( = ?auto_314593 ?auto_314597 ) ) ( not ( = ?auto_314593 ?auto_314598 ) ) ( not ( = ?auto_314593 ?auto_314599 ) ) ( not ( = ?auto_314593 ?auto_314600 ) ) ( not ( = ?auto_314594 ?auto_314595 ) ) ( not ( = ?auto_314594 ?auto_314596 ) ) ( not ( = ?auto_314594 ?auto_314597 ) ) ( not ( = ?auto_314594 ?auto_314598 ) ) ( not ( = ?auto_314594 ?auto_314599 ) ) ( not ( = ?auto_314594 ?auto_314600 ) ) ( not ( = ?auto_314595 ?auto_314596 ) ) ( not ( = ?auto_314595 ?auto_314597 ) ) ( not ( = ?auto_314595 ?auto_314598 ) ) ( not ( = ?auto_314595 ?auto_314599 ) ) ( not ( = ?auto_314595 ?auto_314600 ) ) ( not ( = ?auto_314596 ?auto_314597 ) ) ( not ( = ?auto_314596 ?auto_314598 ) ) ( not ( = ?auto_314596 ?auto_314599 ) ) ( not ( = ?auto_314596 ?auto_314600 ) ) ( not ( = ?auto_314597 ?auto_314598 ) ) ( not ( = ?auto_314597 ?auto_314599 ) ) ( not ( = ?auto_314597 ?auto_314600 ) ) ( not ( = ?auto_314598 ?auto_314599 ) ) ( not ( = ?auto_314598 ?auto_314600 ) ) ( not ( = ?auto_314599 ?auto_314600 ) ) ( ON ?auto_314598 ?auto_314599 ) ( ON ?auto_314597 ?auto_314598 ) ( ON ?auto_314596 ?auto_314597 ) ( ON ?auto_314595 ?auto_314596 ) ( CLEAR ?auto_314593 ) ( ON ?auto_314594 ?auto_314595 ) ( CLEAR ?auto_314594 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_314591 ?auto_314592 ?auto_314593 ?auto_314594 )
      ( MAKE-9PILE ?auto_314591 ?auto_314592 ?auto_314593 ?auto_314594 ?auto_314595 ?auto_314596 ?auto_314597 ?auto_314598 ?auto_314599 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_314610 - BLOCK
      ?auto_314611 - BLOCK
      ?auto_314612 - BLOCK
      ?auto_314613 - BLOCK
      ?auto_314614 - BLOCK
      ?auto_314615 - BLOCK
      ?auto_314616 - BLOCK
      ?auto_314617 - BLOCK
      ?auto_314618 - BLOCK
    )
    :vars
    (
      ?auto_314619 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_314618 ?auto_314619 ) ( ON-TABLE ?auto_314610 ) ( ON ?auto_314611 ?auto_314610 ) ( not ( = ?auto_314610 ?auto_314611 ) ) ( not ( = ?auto_314610 ?auto_314612 ) ) ( not ( = ?auto_314610 ?auto_314613 ) ) ( not ( = ?auto_314610 ?auto_314614 ) ) ( not ( = ?auto_314610 ?auto_314615 ) ) ( not ( = ?auto_314610 ?auto_314616 ) ) ( not ( = ?auto_314610 ?auto_314617 ) ) ( not ( = ?auto_314610 ?auto_314618 ) ) ( not ( = ?auto_314610 ?auto_314619 ) ) ( not ( = ?auto_314611 ?auto_314612 ) ) ( not ( = ?auto_314611 ?auto_314613 ) ) ( not ( = ?auto_314611 ?auto_314614 ) ) ( not ( = ?auto_314611 ?auto_314615 ) ) ( not ( = ?auto_314611 ?auto_314616 ) ) ( not ( = ?auto_314611 ?auto_314617 ) ) ( not ( = ?auto_314611 ?auto_314618 ) ) ( not ( = ?auto_314611 ?auto_314619 ) ) ( not ( = ?auto_314612 ?auto_314613 ) ) ( not ( = ?auto_314612 ?auto_314614 ) ) ( not ( = ?auto_314612 ?auto_314615 ) ) ( not ( = ?auto_314612 ?auto_314616 ) ) ( not ( = ?auto_314612 ?auto_314617 ) ) ( not ( = ?auto_314612 ?auto_314618 ) ) ( not ( = ?auto_314612 ?auto_314619 ) ) ( not ( = ?auto_314613 ?auto_314614 ) ) ( not ( = ?auto_314613 ?auto_314615 ) ) ( not ( = ?auto_314613 ?auto_314616 ) ) ( not ( = ?auto_314613 ?auto_314617 ) ) ( not ( = ?auto_314613 ?auto_314618 ) ) ( not ( = ?auto_314613 ?auto_314619 ) ) ( not ( = ?auto_314614 ?auto_314615 ) ) ( not ( = ?auto_314614 ?auto_314616 ) ) ( not ( = ?auto_314614 ?auto_314617 ) ) ( not ( = ?auto_314614 ?auto_314618 ) ) ( not ( = ?auto_314614 ?auto_314619 ) ) ( not ( = ?auto_314615 ?auto_314616 ) ) ( not ( = ?auto_314615 ?auto_314617 ) ) ( not ( = ?auto_314615 ?auto_314618 ) ) ( not ( = ?auto_314615 ?auto_314619 ) ) ( not ( = ?auto_314616 ?auto_314617 ) ) ( not ( = ?auto_314616 ?auto_314618 ) ) ( not ( = ?auto_314616 ?auto_314619 ) ) ( not ( = ?auto_314617 ?auto_314618 ) ) ( not ( = ?auto_314617 ?auto_314619 ) ) ( not ( = ?auto_314618 ?auto_314619 ) ) ( ON ?auto_314617 ?auto_314618 ) ( ON ?auto_314616 ?auto_314617 ) ( ON ?auto_314615 ?auto_314616 ) ( ON ?auto_314614 ?auto_314615 ) ( ON ?auto_314613 ?auto_314614 ) ( CLEAR ?auto_314611 ) ( ON ?auto_314612 ?auto_314613 ) ( CLEAR ?auto_314612 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_314610 ?auto_314611 ?auto_314612 )
      ( MAKE-9PILE ?auto_314610 ?auto_314611 ?auto_314612 ?auto_314613 ?auto_314614 ?auto_314615 ?auto_314616 ?auto_314617 ?auto_314618 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_314629 - BLOCK
      ?auto_314630 - BLOCK
      ?auto_314631 - BLOCK
      ?auto_314632 - BLOCK
      ?auto_314633 - BLOCK
      ?auto_314634 - BLOCK
      ?auto_314635 - BLOCK
      ?auto_314636 - BLOCK
      ?auto_314637 - BLOCK
    )
    :vars
    (
      ?auto_314638 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_314637 ?auto_314638 ) ( ON-TABLE ?auto_314629 ) ( ON ?auto_314630 ?auto_314629 ) ( not ( = ?auto_314629 ?auto_314630 ) ) ( not ( = ?auto_314629 ?auto_314631 ) ) ( not ( = ?auto_314629 ?auto_314632 ) ) ( not ( = ?auto_314629 ?auto_314633 ) ) ( not ( = ?auto_314629 ?auto_314634 ) ) ( not ( = ?auto_314629 ?auto_314635 ) ) ( not ( = ?auto_314629 ?auto_314636 ) ) ( not ( = ?auto_314629 ?auto_314637 ) ) ( not ( = ?auto_314629 ?auto_314638 ) ) ( not ( = ?auto_314630 ?auto_314631 ) ) ( not ( = ?auto_314630 ?auto_314632 ) ) ( not ( = ?auto_314630 ?auto_314633 ) ) ( not ( = ?auto_314630 ?auto_314634 ) ) ( not ( = ?auto_314630 ?auto_314635 ) ) ( not ( = ?auto_314630 ?auto_314636 ) ) ( not ( = ?auto_314630 ?auto_314637 ) ) ( not ( = ?auto_314630 ?auto_314638 ) ) ( not ( = ?auto_314631 ?auto_314632 ) ) ( not ( = ?auto_314631 ?auto_314633 ) ) ( not ( = ?auto_314631 ?auto_314634 ) ) ( not ( = ?auto_314631 ?auto_314635 ) ) ( not ( = ?auto_314631 ?auto_314636 ) ) ( not ( = ?auto_314631 ?auto_314637 ) ) ( not ( = ?auto_314631 ?auto_314638 ) ) ( not ( = ?auto_314632 ?auto_314633 ) ) ( not ( = ?auto_314632 ?auto_314634 ) ) ( not ( = ?auto_314632 ?auto_314635 ) ) ( not ( = ?auto_314632 ?auto_314636 ) ) ( not ( = ?auto_314632 ?auto_314637 ) ) ( not ( = ?auto_314632 ?auto_314638 ) ) ( not ( = ?auto_314633 ?auto_314634 ) ) ( not ( = ?auto_314633 ?auto_314635 ) ) ( not ( = ?auto_314633 ?auto_314636 ) ) ( not ( = ?auto_314633 ?auto_314637 ) ) ( not ( = ?auto_314633 ?auto_314638 ) ) ( not ( = ?auto_314634 ?auto_314635 ) ) ( not ( = ?auto_314634 ?auto_314636 ) ) ( not ( = ?auto_314634 ?auto_314637 ) ) ( not ( = ?auto_314634 ?auto_314638 ) ) ( not ( = ?auto_314635 ?auto_314636 ) ) ( not ( = ?auto_314635 ?auto_314637 ) ) ( not ( = ?auto_314635 ?auto_314638 ) ) ( not ( = ?auto_314636 ?auto_314637 ) ) ( not ( = ?auto_314636 ?auto_314638 ) ) ( not ( = ?auto_314637 ?auto_314638 ) ) ( ON ?auto_314636 ?auto_314637 ) ( ON ?auto_314635 ?auto_314636 ) ( ON ?auto_314634 ?auto_314635 ) ( ON ?auto_314633 ?auto_314634 ) ( ON ?auto_314632 ?auto_314633 ) ( CLEAR ?auto_314630 ) ( ON ?auto_314631 ?auto_314632 ) ( CLEAR ?auto_314631 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_314629 ?auto_314630 ?auto_314631 )
      ( MAKE-9PILE ?auto_314629 ?auto_314630 ?auto_314631 ?auto_314632 ?auto_314633 ?auto_314634 ?auto_314635 ?auto_314636 ?auto_314637 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_314648 - BLOCK
      ?auto_314649 - BLOCK
      ?auto_314650 - BLOCK
      ?auto_314651 - BLOCK
      ?auto_314652 - BLOCK
      ?auto_314653 - BLOCK
      ?auto_314654 - BLOCK
      ?auto_314655 - BLOCK
      ?auto_314656 - BLOCK
    )
    :vars
    (
      ?auto_314657 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_314656 ?auto_314657 ) ( ON-TABLE ?auto_314648 ) ( not ( = ?auto_314648 ?auto_314649 ) ) ( not ( = ?auto_314648 ?auto_314650 ) ) ( not ( = ?auto_314648 ?auto_314651 ) ) ( not ( = ?auto_314648 ?auto_314652 ) ) ( not ( = ?auto_314648 ?auto_314653 ) ) ( not ( = ?auto_314648 ?auto_314654 ) ) ( not ( = ?auto_314648 ?auto_314655 ) ) ( not ( = ?auto_314648 ?auto_314656 ) ) ( not ( = ?auto_314648 ?auto_314657 ) ) ( not ( = ?auto_314649 ?auto_314650 ) ) ( not ( = ?auto_314649 ?auto_314651 ) ) ( not ( = ?auto_314649 ?auto_314652 ) ) ( not ( = ?auto_314649 ?auto_314653 ) ) ( not ( = ?auto_314649 ?auto_314654 ) ) ( not ( = ?auto_314649 ?auto_314655 ) ) ( not ( = ?auto_314649 ?auto_314656 ) ) ( not ( = ?auto_314649 ?auto_314657 ) ) ( not ( = ?auto_314650 ?auto_314651 ) ) ( not ( = ?auto_314650 ?auto_314652 ) ) ( not ( = ?auto_314650 ?auto_314653 ) ) ( not ( = ?auto_314650 ?auto_314654 ) ) ( not ( = ?auto_314650 ?auto_314655 ) ) ( not ( = ?auto_314650 ?auto_314656 ) ) ( not ( = ?auto_314650 ?auto_314657 ) ) ( not ( = ?auto_314651 ?auto_314652 ) ) ( not ( = ?auto_314651 ?auto_314653 ) ) ( not ( = ?auto_314651 ?auto_314654 ) ) ( not ( = ?auto_314651 ?auto_314655 ) ) ( not ( = ?auto_314651 ?auto_314656 ) ) ( not ( = ?auto_314651 ?auto_314657 ) ) ( not ( = ?auto_314652 ?auto_314653 ) ) ( not ( = ?auto_314652 ?auto_314654 ) ) ( not ( = ?auto_314652 ?auto_314655 ) ) ( not ( = ?auto_314652 ?auto_314656 ) ) ( not ( = ?auto_314652 ?auto_314657 ) ) ( not ( = ?auto_314653 ?auto_314654 ) ) ( not ( = ?auto_314653 ?auto_314655 ) ) ( not ( = ?auto_314653 ?auto_314656 ) ) ( not ( = ?auto_314653 ?auto_314657 ) ) ( not ( = ?auto_314654 ?auto_314655 ) ) ( not ( = ?auto_314654 ?auto_314656 ) ) ( not ( = ?auto_314654 ?auto_314657 ) ) ( not ( = ?auto_314655 ?auto_314656 ) ) ( not ( = ?auto_314655 ?auto_314657 ) ) ( not ( = ?auto_314656 ?auto_314657 ) ) ( ON ?auto_314655 ?auto_314656 ) ( ON ?auto_314654 ?auto_314655 ) ( ON ?auto_314653 ?auto_314654 ) ( ON ?auto_314652 ?auto_314653 ) ( ON ?auto_314651 ?auto_314652 ) ( ON ?auto_314650 ?auto_314651 ) ( CLEAR ?auto_314648 ) ( ON ?auto_314649 ?auto_314650 ) ( CLEAR ?auto_314649 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_314648 ?auto_314649 )
      ( MAKE-9PILE ?auto_314648 ?auto_314649 ?auto_314650 ?auto_314651 ?auto_314652 ?auto_314653 ?auto_314654 ?auto_314655 ?auto_314656 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_314667 - BLOCK
      ?auto_314668 - BLOCK
      ?auto_314669 - BLOCK
      ?auto_314670 - BLOCK
      ?auto_314671 - BLOCK
      ?auto_314672 - BLOCK
      ?auto_314673 - BLOCK
      ?auto_314674 - BLOCK
      ?auto_314675 - BLOCK
    )
    :vars
    (
      ?auto_314676 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_314675 ?auto_314676 ) ( ON-TABLE ?auto_314667 ) ( not ( = ?auto_314667 ?auto_314668 ) ) ( not ( = ?auto_314667 ?auto_314669 ) ) ( not ( = ?auto_314667 ?auto_314670 ) ) ( not ( = ?auto_314667 ?auto_314671 ) ) ( not ( = ?auto_314667 ?auto_314672 ) ) ( not ( = ?auto_314667 ?auto_314673 ) ) ( not ( = ?auto_314667 ?auto_314674 ) ) ( not ( = ?auto_314667 ?auto_314675 ) ) ( not ( = ?auto_314667 ?auto_314676 ) ) ( not ( = ?auto_314668 ?auto_314669 ) ) ( not ( = ?auto_314668 ?auto_314670 ) ) ( not ( = ?auto_314668 ?auto_314671 ) ) ( not ( = ?auto_314668 ?auto_314672 ) ) ( not ( = ?auto_314668 ?auto_314673 ) ) ( not ( = ?auto_314668 ?auto_314674 ) ) ( not ( = ?auto_314668 ?auto_314675 ) ) ( not ( = ?auto_314668 ?auto_314676 ) ) ( not ( = ?auto_314669 ?auto_314670 ) ) ( not ( = ?auto_314669 ?auto_314671 ) ) ( not ( = ?auto_314669 ?auto_314672 ) ) ( not ( = ?auto_314669 ?auto_314673 ) ) ( not ( = ?auto_314669 ?auto_314674 ) ) ( not ( = ?auto_314669 ?auto_314675 ) ) ( not ( = ?auto_314669 ?auto_314676 ) ) ( not ( = ?auto_314670 ?auto_314671 ) ) ( not ( = ?auto_314670 ?auto_314672 ) ) ( not ( = ?auto_314670 ?auto_314673 ) ) ( not ( = ?auto_314670 ?auto_314674 ) ) ( not ( = ?auto_314670 ?auto_314675 ) ) ( not ( = ?auto_314670 ?auto_314676 ) ) ( not ( = ?auto_314671 ?auto_314672 ) ) ( not ( = ?auto_314671 ?auto_314673 ) ) ( not ( = ?auto_314671 ?auto_314674 ) ) ( not ( = ?auto_314671 ?auto_314675 ) ) ( not ( = ?auto_314671 ?auto_314676 ) ) ( not ( = ?auto_314672 ?auto_314673 ) ) ( not ( = ?auto_314672 ?auto_314674 ) ) ( not ( = ?auto_314672 ?auto_314675 ) ) ( not ( = ?auto_314672 ?auto_314676 ) ) ( not ( = ?auto_314673 ?auto_314674 ) ) ( not ( = ?auto_314673 ?auto_314675 ) ) ( not ( = ?auto_314673 ?auto_314676 ) ) ( not ( = ?auto_314674 ?auto_314675 ) ) ( not ( = ?auto_314674 ?auto_314676 ) ) ( not ( = ?auto_314675 ?auto_314676 ) ) ( ON ?auto_314674 ?auto_314675 ) ( ON ?auto_314673 ?auto_314674 ) ( ON ?auto_314672 ?auto_314673 ) ( ON ?auto_314671 ?auto_314672 ) ( ON ?auto_314670 ?auto_314671 ) ( ON ?auto_314669 ?auto_314670 ) ( CLEAR ?auto_314667 ) ( ON ?auto_314668 ?auto_314669 ) ( CLEAR ?auto_314668 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_314667 ?auto_314668 )
      ( MAKE-9PILE ?auto_314667 ?auto_314668 ?auto_314669 ?auto_314670 ?auto_314671 ?auto_314672 ?auto_314673 ?auto_314674 ?auto_314675 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_314686 - BLOCK
      ?auto_314687 - BLOCK
      ?auto_314688 - BLOCK
      ?auto_314689 - BLOCK
      ?auto_314690 - BLOCK
      ?auto_314691 - BLOCK
      ?auto_314692 - BLOCK
      ?auto_314693 - BLOCK
      ?auto_314694 - BLOCK
    )
    :vars
    (
      ?auto_314695 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_314694 ?auto_314695 ) ( not ( = ?auto_314686 ?auto_314687 ) ) ( not ( = ?auto_314686 ?auto_314688 ) ) ( not ( = ?auto_314686 ?auto_314689 ) ) ( not ( = ?auto_314686 ?auto_314690 ) ) ( not ( = ?auto_314686 ?auto_314691 ) ) ( not ( = ?auto_314686 ?auto_314692 ) ) ( not ( = ?auto_314686 ?auto_314693 ) ) ( not ( = ?auto_314686 ?auto_314694 ) ) ( not ( = ?auto_314686 ?auto_314695 ) ) ( not ( = ?auto_314687 ?auto_314688 ) ) ( not ( = ?auto_314687 ?auto_314689 ) ) ( not ( = ?auto_314687 ?auto_314690 ) ) ( not ( = ?auto_314687 ?auto_314691 ) ) ( not ( = ?auto_314687 ?auto_314692 ) ) ( not ( = ?auto_314687 ?auto_314693 ) ) ( not ( = ?auto_314687 ?auto_314694 ) ) ( not ( = ?auto_314687 ?auto_314695 ) ) ( not ( = ?auto_314688 ?auto_314689 ) ) ( not ( = ?auto_314688 ?auto_314690 ) ) ( not ( = ?auto_314688 ?auto_314691 ) ) ( not ( = ?auto_314688 ?auto_314692 ) ) ( not ( = ?auto_314688 ?auto_314693 ) ) ( not ( = ?auto_314688 ?auto_314694 ) ) ( not ( = ?auto_314688 ?auto_314695 ) ) ( not ( = ?auto_314689 ?auto_314690 ) ) ( not ( = ?auto_314689 ?auto_314691 ) ) ( not ( = ?auto_314689 ?auto_314692 ) ) ( not ( = ?auto_314689 ?auto_314693 ) ) ( not ( = ?auto_314689 ?auto_314694 ) ) ( not ( = ?auto_314689 ?auto_314695 ) ) ( not ( = ?auto_314690 ?auto_314691 ) ) ( not ( = ?auto_314690 ?auto_314692 ) ) ( not ( = ?auto_314690 ?auto_314693 ) ) ( not ( = ?auto_314690 ?auto_314694 ) ) ( not ( = ?auto_314690 ?auto_314695 ) ) ( not ( = ?auto_314691 ?auto_314692 ) ) ( not ( = ?auto_314691 ?auto_314693 ) ) ( not ( = ?auto_314691 ?auto_314694 ) ) ( not ( = ?auto_314691 ?auto_314695 ) ) ( not ( = ?auto_314692 ?auto_314693 ) ) ( not ( = ?auto_314692 ?auto_314694 ) ) ( not ( = ?auto_314692 ?auto_314695 ) ) ( not ( = ?auto_314693 ?auto_314694 ) ) ( not ( = ?auto_314693 ?auto_314695 ) ) ( not ( = ?auto_314694 ?auto_314695 ) ) ( ON ?auto_314693 ?auto_314694 ) ( ON ?auto_314692 ?auto_314693 ) ( ON ?auto_314691 ?auto_314692 ) ( ON ?auto_314690 ?auto_314691 ) ( ON ?auto_314689 ?auto_314690 ) ( ON ?auto_314688 ?auto_314689 ) ( ON ?auto_314687 ?auto_314688 ) ( ON ?auto_314686 ?auto_314687 ) ( CLEAR ?auto_314686 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_314686 )
      ( MAKE-9PILE ?auto_314686 ?auto_314687 ?auto_314688 ?auto_314689 ?auto_314690 ?auto_314691 ?auto_314692 ?auto_314693 ?auto_314694 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_314705 - BLOCK
      ?auto_314706 - BLOCK
      ?auto_314707 - BLOCK
      ?auto_314708 - BLOCK
      ?auto_314709 - BLOCK
      ?auto_314710 - BLOCK
      ?auto_314711 - BLOCK
      ?auto_314712 - BLOCK
      ?auto_314713 - BLOCK
    )
    :vars
    (
      ?auto_314714 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_314713 ?auto_314714 ) ( not ( = ?auto_314705 ?auto_314706 ) ) ( not ( = ?auto_314705 ?auto_314707 ) ) ( not ( = ?auto_314705 ?auto_314708 ) ) ( not ( = ?auto_314705 ?auto_314709 ) ) ( not ( = ?auto_314705 ?auto_314710 ) ) ( not ( = ?auto_314705 ?auto_314711 ) ) ( not ( = ?auto_314705 ?auto_314712 ) ) ( not ( = ?auto_314705 ?auto_314713 ) ) ( not ( = ?auto_314705 ?auto_314714 ) ) ( not ( = ?auto_314706 ?auto_314707 ) ) ( not ( = ?auto_314706 ?auto_314708 ) ) ( not ( = ?auto_314706 ?auto_314709 ) ) ( not ( = ?auto_314706 ?auto_314710 ) ) ( not ( = ?auto_314706 ?auto_314711 ) ) ( not ( = ?auto_314706 ?auto_314712 ) ) ( not ( = ?auto_314706 ?auto_314713 ) ) ( not ( = ?auto_314706 ?auto_314714 ) ) ( not ( = ?auto_314707 ?auto_314708 ) ) ( not ( = ?auto_314707 ?auto_314709 ) ) ( not ( = ?auto_314707 ?auto_314710 ) ) ( not ( = ?auto_314707 ?auto_314711 ) ) ( not ( = ?auto_314707 ?auto_314712 ) ) ( not ( = ?auto_314707 ?auto_314713 ) ) ( not ( = ?auto_314707 ?auto_314714 ) ) ( not ( = ?auto_314708 ?auto_314709 ) ) ( not ( = ?auto_314708 ?auto_314710 ) ) ( not ( = ?auto_314708 ?auto_314711 ) ) ( not ( = ?auto_314708 ?auto_314712 ) ) ( not ( = ?auto_314708 ?auto_314713 ) ) ( not ( = ?auto_314708 ?auto_314714 ) ) ( not ( = ?auto_314709 ?auto_314710 ) ) ( not ( = ?auto_314709 ?auto_314711 ) ) ( not ( = ?auto_314709 ?auto_314712 ) ) ( not ( = ?auto_314709 ?auto_314713 ) ) ( not ( = ?auto_314709 ?auto_314714 ) ) ( not ( = ?auto_314710 ?auto_314711 ) ) ( not ( = ?auto_314710 ?auto_314712 ) ) ( not ( = ?auto_314710 ?auto_314713 ) ) ( not ( = ?auto_314710 ?auto_314714 ) ) ( not ( = ?auto_314711 ?auto_314712 ) ) ( not ( = ?auto_314711 ?auto_314713 ) ) ( not ( = ?auto_314711 ?auto_314714 ) ) ( not ( = ?auto_314712 ?auto_314713 ) ) ( not ( = ?auto_314712 ?auto_314714 ) ) ( not ( = ?auto_314713 ?auto_314714 ) ) ( ON ?auto_314712 ?auto_314713 ) ( ON ?auto_314711 ?auto_314712 ) ( ON ?auto_314710 ?auto_314711 ) ( ON ?auto_314709 ?auto_314710 ) ( ON ?auto_314708 ?auto_314709 ) ( ON ?auto_314707 ?auto_314708 ) ( ON ?auto_314706 ?auto_314707 ) ( ON ?auto_314705 ?auto_314706 ) ( CLEAR ?auto_314705 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_314705 )
      ( MAKE-9PILE ?auto_314705 ?auto_314706 ?auto_314707 ?auto_314708 ?auto_314709 ?auto_314710 ?auto_314711 ?auto_314712 ?auto_314713 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_314725 - BLOCK
      ?auto_314726 - BLOCK
      ?auto_314727 - BLOCK
      ?auto_314728 - BLOCK
      ?auto_314729 - BLOCK
      ?auto_314730 - BLOCK
      ?auto_314731 - BLOCK
      ?auto_314732 - BLOCK
      ?auto_314733 - BLOCK
      ?auto_314734 - BLOCK
    )
    :vars
    (
      ?auto_314735 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_314733 ) ( ON ?auto_314734 ?auto_314735 ) ( CLEAR ?auto_314734 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_314725 ) ( ON ?auto_314726 ?auto_314725 ) ( ON ?auto_314727 ?auto_314726 ) ( ON ?auto_314728 ?auto_314727 ) ( ON ?auto_314729 ?auto_314728 ) ( ON ?auto_314730 ?auto_314729 ) ( ON ?auto_314731 ?auto_314730 ) ( ON ?auto_314732 ?auto_314731 ) ( ON ?auto_314733 ?auto_314732 ) ( not ( = ?auto_314725 ?auto_314726 ) ) ( not ( = ?auto_314725 ?auto_314727 ) ) ( not ( = ?auto_314725 ?auto_314728 ) ) ( not ( = ?auto_314725 ?auto_314729 ) ) ( not ( = ?auto_314725 ?auto_314730 ) ) ( not ( = ?auto_314725 ?auto_314731 ) ) ( not ( = ?auto_314725 ?auto_314732 ) ) ( not ( = ?auto_314725 ?auto_314733 ) ) ( not ( = ?auto_314725 ?auto_314734 ) ) ( not ( = ?auto_314725 ?auto_314735 ) ) ( not ( = ?auto_314726 ?auto_314727 ) ) ( not ( = ?auto_314726 ?auto_314728 ) ) ( not ( = ?auto_314726 ?auto_314729 ) ) ( not ( = ?auto_314726 ?auto_314730 ) ) ( not ( = ?auto_314726 ?auto_314731 ) ) ( not ( = ?auto_314726 ?auto_314732 ) ) ( not ( = ?auto_314726 ?auto_314733 ) ) ( not ( = ?auto_314726 ?auto_314734 ) ) ( not ( = ?auto_314726 ?auto_314735 ) ) ( not ( = ?auto_314727 ?auto_314728 ) ) ( not ( = ?auto_314727 ?auto_314729 ) ) ( not ( = ?auto_314727 ?auto_314730 ) ) ( not ( = ?auto_314727 ?auto_314731 ) ) ( not ( = ?auto_314727 ?auto_314732 ) ) ( not ( = ?auto_314727 ?auto_314733 ) ) ( not ( = ?auto_314727 ?auto_314734 ) ) ( not ( = ?auto_314727 ?auto_314735 ) ) ( not ( = ?auto_314728 ?auto_314729 ) ) ( not ( = ?auto_314728 ?auto_314730 ) ) ( not ( = ?auto_314728 ?auto_314731 ) ) ( not ( = ?auto_314728 ?auto_314732 ) ) ( not ( = ?auto_314728 ?auto_314733 ) ) ( not ( = ?auto_314728 ?auto_314734 ) ) ( not ( = ?auto_314728 ?auto_314735 ) ) ( not ( = ?auto_314729 ?auto_314730 ) ) ( not ( = ?auto_314729 ?auto_314731 ) ) ( not ( = ?auto_314729 ?auto_314732 ) ) ( not ( = ?auto_314729 ?auto_314733 ) ) ( not ( = ?auto_314729 ?auto_314734 ) ) ( not ( = ?auto_314729 ?auto_314735 ) ) ( not ( = ?auto_314730 ?auto_314731 ) ) ( not ( = ?auto_314730 ?auto_314732 ) ) ( not ( = ?auto_314730 ?auto_314733 ) ) ( not ( = ?auto_314730 ?auto_314734 ) ) ( not ( = ?auto_314730 ?auto_314735 ) ) ( not ( = ?auto_314731 ?auto_314732 ) ) ( not ( = ?auto_314731 ?auto_314733 ) ) ( not ( = ?auto_314731 ?auto_314734 ) ) ( not ( = ?auto_314731 ?auto_314735 ) ) ( not ( = ?auto_314732 ?auto_314733 ) ) ( not ( = ?auto_314732 ?auto_314734 ) ) ( not ( = ?auto_314732 ?auto_314735 ) ) ( not ( = ?auto_314733 ?auto_314734 ) ) ( not ( = ?auto_314733 ?auto_314735 ) ) ( not ( = ?auto_314734 ?auto_314735 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_314734 ?auto_314735 )
      ( !STACK ?auto_314734 ?auto_314733 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_314746 - BLOCK
      ?auto_314747 - BLOCK
      ?auto_314748 - BLOCK
      ?auto_314749 - BLOCK
      ?auto_314750 - BLOCK
      ?auto_314751 - BLOCK
      ?auto_314752 - BLOCK
      ?auto_314753 - BLOCK
      ?auto_314754 - BLOCK
      ?auto_314755 - BLOCK
    )
    :vars
    (
      ?auto_314756 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_314754 ) ( ON ?auto_314755 ?auto_314756 ) ( CLEAR ?auto_314755 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_314746 ) ( ON ?auto_314747 ?auto_314746 ) ( ON ?auto_314748 ?auto_314747 ) ( ON ?auto_314749 ?auto_314748 ) ( ON ?auto_314750 ?auto_314749 ) ( ON ?auto_314751 ?auto_314750 ) ( ON ?auto_314752 ?auto_314751 ) ( ON ?auto_314753 ?auto_314752 ) ( ON ?auto_314754 ?auto_314753 ) ( not ( = ?auto_314746 ?auto_314747 ) ) ( not ( = ?auto_314746 ?auto_314748 ) ) ( not ( = ?auto_314746 ?auto_314749 ) ) ( not ( = ?auto_314746 ?auto_314750 ) ) ( not ( = ?auto_314746 ?auto_314751 ) ) ( not ( = ?auto_314746 ?auto_314752 ) ) ( not ( = ?auto_314746 ?auto_314753 ) ) ( not ( = ?auto_314746 ?auto_314754 ) ) ( not ( = ?auto_314746 ?auto_314755 ) ) ( not ( = ?auto_314746 ?auto_314756 ) ) ( not ( = ?auto_314747 ?auto_314748 ) ) ( not ( = ?auto_314747 ?auto_314749 ) ) ( not ( = ?auto_314747 ?auto_314750 ) ) ( not ( = ?auto_314747 ?auto_314751 ) ) ( not ( = ?auto_314747 ?auto_314752 ) ) ( not ( = ?auto_314747 ?auto_314753 ) ) ( not ( = ?auto_314747 ?auto_314754 ) ) ( not ( = ?auto_314747 ?auto_314755 ) ) ( not ( = ?auto_314747 ?auto_314756 ) ) ( not ( = ?auto_314748 ?auto_314749 ) ) ( not ( = ?auto_314748 ?auto_314750 ) ) ( not ( = ?auto_314748 ?auto_314751 ) ) ( not ( = ?auto_314748 ?auto_314752 ) ) ( not ( = ?auto_314748 ?auto_314753 ) ) ( not ( = ?auto_314748 ?auto_314754 ) ) ( not ( = ?auto_314748 ?auto_314755 ) ) ( not ( = ?auto_314748 ?auto_314756 ) ) ( not ( = ?auto_314749 ?auto_314750 ) ) ( not ( = ?auto_314749 ?auto_314751 ) ) ( not ( = ?auto_314749 ?auto_314752 ) ) ( not ( = ?auto_314749 ?auto_314753 ) ) ( not ( = ?auto_314749 ?auto_314754 ) ) ( not ( = ?auto_314749 ?auto_314755 ) ) ( not ( = ?auto_314749 ?auto_314756 ) ) ( not ( = ?auto_314750 ?auto_314751 ) ) ( not ( = ?auto_314750 ?auto_314752 ) ) ( not ( = ?auto_314750 ?auto_314753 ) ) ( not ( = ?auto_314750 ?auto_314754 ) ) ( not ( = ?auto_314750 ?auto_314755 ) ) ( not ( = ?auto_314750 ?auto_314756 ) ) ( not ( = ?auto_314751 ?auto_314752 ) ) ( not ( = ?auto_314751 ?auto_314753 ) ) ( not ( = ?auto_314751 ?auto_314754 ) ) ( not ( = ?auto_314751 ?auto_314755 ) ) ( not ( = ?auto_314751 ?auto_314756 ) ) ( not ( = ?auto_314752 ?auto_314753 ) ) ( not ( = ?auto_314752 ?auto_314754 ) ) ( not ( = ?auto_314752 ?auto_314755 ) ) ( not ( = ?auto_314752 ?auto_314756 ) ) ( not ( = ?auto_314753 ?auto_314754 ) ) ( not ( = ?auto_314753 ?auto_314755 ) ) ( not ( = ?auto_314753 ?auto_314756 ) ) ( not ( = ?auto_314754 ?auto_314755 ) ) ( not ( = ?auto_314754 ?auto_314756 ) ) ( not ( = ?auto_314755 ?auto_314756 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_314755 ?auto_314756 )
      ( !STACK ?auto_314755 ?auto_314754 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_314767 - BLOCK
      ?auto_314768 - BLOCK
      ?auto_314769 - BLOCK
      ?auto_314770 - BLOCK
      ?auto_314771 - BLOCK
      ?auto_314772 - BLOCK
      ?auto_314773 - BLOCK
      ?auto_314774 - BLOCK
      ?auto_314775 - BLOCK
      ?auto_314776 - BLOCK
    )
    :vars
    (
      ?auto_314777 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_314776 ?auto_314777 ) ( ON-TABLE ?auto_314767 ) ( ON ?auto_314768 ?auto_314767 ) ( ON ?auto_314769 ?auto_314768 ) ( ON ?auto_314770 ?auto_314769 ) ( ON ?auto_314771 ?auto_314770 ) ( ON ?auto_314772 ?auto_314771 ) ( ON ?auto_314773 ?auto_314772 ) ( ON ?auto_314774 ?auto_314773 ) ( not ( = ?auto_314767 ?auto_314768 ) ) ( not ( = ?auto_314767 ?auto_314769 ) ) ( not ( = ?auto_314767 ?auto_314770 ) ) ( not ( = ?auto_314767 ?auto_314771 ) ) ( not ( = ?auto_314767 ?auto_314772 ) ) ( not ( = ?auto_314767 ?auto_314773 ) ) ( not ( = ?auto_314767 ?auto_314774 ) ) ( not ( = ?auto_314767 ?auto_314775 ) ) ( not ( = ?auto_314767 ?auto_314776 ) ) ( not ( = ?auto_314767 ?auto_314777 ) ) ( not ( = ?auto_314768 ?auto_314769 ) ) ( not ( = ?auto_314768 ?auto_314770 ) ) ( not ( = ?auto_314768 ?auto_314771 ) ) ( not ( = ?auto_314768 ?auto_314772 ) ) ( not ( = ?auto_314768 ?auto_314773 ) ) ( not ( = ?auto_314768 ?auto_314774 ) ) ( not ( = ?auto_314768 ?auto_314775 ) ) ( not ( = ?auto_314768 ?auto_314776 ) ) ( not ( = ?auto_314768 ?auto_314777 ) ) ( not ( = ?auto_314769 ?auto_314770 ) ) ( not ( = ?auto_314769 ?auto_314771 ) ) ( not ( = ?auto_314769 ?auto_314772 ) ) ( not ( = ?auto_314769 ?auto_314773 ) ) ( not ( = ?auto_314769 ?auto_314774 ) ) ( not ( = ?auto_314769 ?auto_314775 ) ) ( not ( = ?auto_314769 ?auto_314776 ) ) ( not ( = ?auto_314769 ?auto_314777 ) ) ( not ( = ?auto_314770 ?auto_314771 ) ) ( not ( = ?auto_314770 ?auto_314772 ) ) ( not ( = ?auto_314770 ?auto_314773 ) ) ( not ( = ?auto_314770 ?auto_314774 ) ) ( not ( = ?auto_314770 ?auto_314775 ) ) ( not ( = ?auto_314770 ?auto_314776 ) ) ( not ( = ?auto_314770 ?auto_314777 ) ) ( not ( = ?auto_314771 ?auto_314772 ) ) ( not ( = ?auto_314771 ?auto_314773 ) ) ( not ( = ?auto_314771 ?auto_314774 ) ) ( not ( = ?auto_314771 ?auto_314775 ) ) ( not ( = ?auto_314771 ?auto_314776 ) ) ( not ( = ?auto_314771 ?auto_314777 ) ) ( not ( = ?auto_314772 ?auto_314773 ) ) ( not ( = ?auto_314772 ?auto_314774 ) ) ( not ( = ?auto_314772 ?auto_314775 ) ) ( not ( = ?auto_314772 ?auto_314776 ) ) ( not ( = ?auto_314772 ?auto_314777 ) ) ( not ( = ?auto_314773 ?auto_314774 ) ) ( not ( = ?auto_314773 ?auto_314775 ) ) ( not ( = ?auto_314773 ?auto_314776 ) ) ( not ( = ?auto_314773 ?auto_314777 ) ) ( not ( = ?auto_314774 ?auto_314775 ) ) ( not ( = ?auto_314774 ?auto_314776 ) ) ( not ( = ?auto_314774 ?auto_314777 ) ) ( not ( = ?auto_314775 ?auto_314776 ) ) ( not ( = ?auto_314775 ?auto_314777 ) ) ( not ( = ?auto_314776 ?auto_314777 ) ) ( CLEAR ?auto_314774 ) ( ON ?auto_314775 ?auto_314776 ) ( CLEAR ?auto_314775 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_314767 ?auto_314768 ?auto_314769 ?auto_314770 ?auto_314771 ?auto_314772 ?auto_314773 ?auto_314774 ?auto_314775 )
      ( MAKE-10PILE ?auto_314767 ?auto_314768 ?auto_314769 ?auto_314770 ?auto_314771 ?auto_314772 ?auto_314773 ?auto_314774 ?auto_314775 ?auto_314776 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_314788 - BLOCK
      ?auto_314789 - BLOCK
      ?auto_314790 - BLOCK
      ?auto_314791 - BLOCK
      ?auto_314792 - BLOCK
      ?auto_314793 - BLOCK
      ?auto_314794 - BLOCK
      ?auto_314795 - BLOCK
      ?auto_314796 - BLOCK
      ?auto_314797 - BLOCK
    )
    :vars
    (
      ?auto_314798 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_314797 ?auto_314798 ) ( ON-TABLE ?auto_314788 ) ( ON ?auto_314789 ?auto_314788 ) ( ON ?auto_314790 ?auto_314789 ) ( ON ?auto_314791 ?auto_314790 ) ( ON ?auto_314792 ?auto_314791 ) ( ON ?auto_314793 ?auto_314792 ) ( ON ?auto_314794 ?auto_314793 ) ( ON ?auto_314795 ?auto_314794 ) ( not ( = ?auto_314788 ?auto_314789 ) ) ( not ( = ?auto_314788 ?auto_314790 ) ) ( not ( = ?auto_314788 ?auto_314791 ) ) ( not ( = ?auto_314788 ?auto_314792 ) ) ( not ( = ?auto_314788 ?auto_314793 ) ) ( not ( = ?auto_314788 ?auto_314794 ) ) ( not ( = ?auto_314788 ?auto_314795 ) ) ( not ( = ?auto_314788 ?auto_314796 ) ) ( not ( = ?auto_314788 ?auto_314797 ) ) ( not ( = ?auto_314788 ?auto_314798 ) ) ( not ( = ?auto_314789 ?auto_314790 ) ) ( not ( = ?auto_314789 ?auto_314791 ) ) ( not ( = ?auto_314789 ?auto_314792 ) ) ( not ( = ?auto_314789 ?auto_314793 ) ) ( not ( = ?auto_314789 ?auto_314794 ) ) ( not ( = ?auto_314789 ?auto_314795 ) ) ( not ( = ?auto_314789 ?auto_314796 ) ) ( not ( = ?auto_314789 ?auto_314797 ) ) ( not ( = ?auto_314789 ?auto_314798 ) ) ( not ( = ?auto_314790 ?auto_314791 ) ) ( not ( = ?auto_314790 ?auto_314792 ) ) ( not ( = ?auto_314790 ?auto_314793 ) ) ( not ( = ?auto_314790 ?auto_314794 ) ) ( not ( = ?auto_314790 ?auto_314795 ) ) ( not ( = ?auto_314790 ?auto_314796 ) ) ( not ( = ?auto_314790 ?auto_314797 ) ) ( not ( = ?auto_314790 ?auto_314798 ) ) ( not ( = ?auto_314791 ?auto_314792 ) ) ( not ( = ?auto_314791 ?auto_314793 ) ) ( not ( = ?auto_314791 ?auto_314794 ) ) ( not ( = ?auto_314791 ?auto_314795 ) ) ( not ( = ?auto_314791 ?auto_314796 ) ) ( not ( = ?auto_314791 ?auto_314797 ) ) ( not ( = ?auto_314791 ?auto_314798 ) ) ( not ( = ?auto_314792 ?auto_314793 ) ) ( not ( = ?auto_314792 ?auto_314794 ) ) ( not ( = ?auto_314792 ?auto_314795 ) ) ( not ( = ?auto_314792 ?auto_314796 ) ) ( not ( = ?auto_314792 ?auto_314797 ) ) ( not ( = ?auto_314792 ?auto_314798 ) ) ( not ( = ?auto_314793 ?auto_314794 ) ) ( not ( = ?auto_314793 ?auto_314795 ) ) ( not ( = ?auto_314793 ?auto_314796 ) ) ( not ( = ?auto_314793 ?auto_314797 ) ) ( not ( = ?auto_314793 ?auto_314798 ) ) ( not ( = ?auto_314794 ?auto_314795 ) ) ( not ( = ?auto_314794 ?auto_314796 ) ) ( not ( = ?auto_314794 ?auto_314797 ) ) ( not ( = ?auto_314794 ?auto_314798 ) ) ( not ( = ?auto_314795 ?auto_314796 ) ) ( not ( = ?auto_314795 ?auto_314797 ) ) ( not ( = ?auto_314795 ?auto_314798 ) ) ( not ( = ?auto_314796 ?auto_314797 ) ) ( not ( = ?auto_314796 ?auto_314798 ) ) ( not ( = ?auto_314797 ?auto_314798 ) ) ( CLEAR ?auto_314795 ) ( ON ?auto_314796 ?auto_314797 ) ( CLEAR ?auto_314796 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_314788 ?auto_314789 ?auto_314790 ?auto_314791 ?auto_314792 ?auto_314793 ?auto_314794 ?auto_314795 ?auto_314796 )
      ( MAKE-10PILE ?auto_314788 ?auto_314789 ?auto_314790 ?auto_314791 ?auto_314792 ?auto_314793 ?auto_314794 ?auto_314795 ?auto_314796 ?auto_314797 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_314809 - BLOCK
      ?auto_314810 - BLOCK
      ?auto_314811 - BLOCK
      ?auto_314812 - BLOCK
      ?auto_314813 - BLOCK
      ?auto_314814 - BLOCK
      ?auto_314815 - BLOCK
      ?auto_314816 - BLOCK
      ?auto_314817 - BLOCK
      ?auto_314818 - BLOCK
    )
    :vars
    (
      ?auto_314819 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_314818 ?auto_314819 ) ( ON-TABLE ?auto_314809 ) ( ON ?auto_314810 ?auto_314809 ) ( ON ?auto_314811 ?auto_314810 ) ( ON ?auto_314812 ?auto_314811 ) ( ON ?auto_314813 ?auto_314812 ) ( ON ?auto_314814 ?auto_314813 ) ( ON ?auto_314815 ?auto_314814 ) ( not ( = ?auto_314809 ?auto_314810 ) ) ( not ( = ?auto_314809 ?auto_314811 ) ) ( not ( = ?auto_314809 ?auto_314812 ) ) ( not ( = ?auto_314809 ?auto_314813 ) ) ( not ( = ?auto_314809 ?auto_314814 ) ) ( not ( = ?auto_314809 ?auto_314815 ) ) ( not ( = ?auto_314809 ?auto_314816 ) ) ( not ( = ?auto_314809 ?auto_314817 ) ) ( not ( = ?auto_314809 ?auto_314818 ) ) ( not ( = ?auto_314809 ?auto_314819 ) ) ( not ( = ?auto_314810 ?auto_314811 ) ) ( not ( = ?auto_314810 ?auto_314812 ) ) ( not ( = ?auto_314810 ?auto_314813 ) ) ( not ( = ?auto_314810 ?auto_314814 ) ) ( not ( = ?auto_314810 ?auto_314815 ) ) ( not ( = ?auto_314810 ?auto_314816 ) ) ( not ( = ?auto_314810 ?auto_314817 ) ) ( not ( = ?auto_314810 ?auto_314818 ) ) ( not ( = ?auto_314810 ?auto_314819 ) ) ( not ( = ?auto_314811 ?auto_314812 ) ) ( not ( = ?auto_314811 ?auto_314813 ) ) ( not ( = ?auto_314811 ?auto_314814 ) ) ( not ( = ?auto_314811 ?auto_314815 ) ) ( not ( = ?auto_314811 ?auto_314816 ) ) ( not ( = ?auto_314811 ?auto_314817 ) ) ( not ( = ?auto_314811 ?auto_314818 ) ) ( not ( = ?auto_314811 ?auto_314819 ) ) ( not ( = ?auto_314812 ?auto_314813 ) ) ( not ( = ?auto_314812 ?auto_314814 ) ) ( not ( = ?auto_314812 ?auto_314815 ) ) ( not ( = ?auto_314812 ?auto_314816 ) ) ( not ( = ?auto_314812 ?auto_314817 ) ) ( not ( = ?auto_314812 ?auto_314818 ) ) ( not ( = ?auto_314812 ?auto_314819 ) ) ( not ( = ?auto_314813 ?auto_314814 ) ) ( not ( = ?auto_314813 ?auto_314815 ) ) ( not ( = ?auto_314813 ?auto_314816 ) ) ( not ( = ?auto_314813 ?auto_314817 ) ) ( not ( = ?auto_314813 ?auto_314818 ) ) ( not ( = ?auto_314813 ?auto_314819 ) ) ( not ( = ?auto_314814 ?auto_314815 ) ) ( not ( = ?auto_314814 ?auto_314816 ) ) ( not ( = ?auto_314814 ?auto_314817 ) ) ( not ( = ?auto_314814 ?auto_314818 ) ) ( not ( = ?auto_314814 ?auto_314819 ) ) ( not ( = ?auto_314815 ?auto_314816 ) ) ( not ( = ?auto_314815 ?auto_314817 ) ) ( not ( = ?auto_314815 ?auto_314818 ) ) ( not ( = ?auto_314815 ?auto_314819 ) ) ( not ( = ?auto_314816 ?auto_314817 ) ) ( not ( = ?auto_314816 ?auto_314818 ) ) ( not ( = ?auto_314816 ?auto_314819 ) ) ( not ( = ?auto_314817 ?auto_314818 ) ) ( not ( = ?auto_314817 ?auto_314819 ) ) ( not ( = ?auto_314818 ?auto_314819 ) ) ( ON ?auto_314817 ?auto_314818 ) ( CLEAR ?auto_314815 ) ( ON ?auto_314816 ?auto_314817 ) ( CLEAR ?auto_314816 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_314809 ?auto_314810 ?auto_314811 ?auto_314812 ?auto_314813 ?auto_314814 ?auto_314815 ?auto_314816 )
      ( MAKE-10PILE ?auto_314809 ?auto_314810 ?auto_314811 ?auto_314812 ?auto_314813 ?auto_314814 ?auto_314815 ?auto_314816 ?auto_314817 ?auto_314818 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_314830 - BLOCK
      ?auto_314831 - BLOCK
      ?auto_314832 - BLOCK
      ?auto_314833 - BLOCK
      ?auto_314834 - BLOCK
      ?auto_314835 - BLOCK
      ?auto_314836 - BLOCK
      ?auto_314837 - BLOCK
      ?auto_314838 - BLOCK
      ?auto_314839 - BLOCK
    )
    :vars
    (
      ?auto_314840 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_314839 ?auto_314840 ) ( ON-TABLE ?auto_314830 ) ( ON ?auto_314831 ?auto_314830 ) ( ON ?auto_314832 ?auto_314831 ) ( ON ?auto_314833 ?auto_314832 ) ( ON ?auto_314834 ?auto_314833 ) ( ON ?auto_314835 ?auto_314834 ) ( ON ?auto_314836 ?auto_314835 ) ( not ( = ?auto_314830 ?auto_314831 ) ) ( not ( = ?auto_314830 ?auto_314832 ) ) ( not ( = ?auto_314830 ?auto_314833 ) ) ( not ( = ?auto_314830 ?auto_314834 ) ) ( not ( = ?auto_314830 ?auto_314835 ) ) ( not ( = ?auto_314830 ?auto_314836 ) ) ( not ( = ?auto_314830 ?auto_314837 ) ) ( not ( = ?auto_314830 ?auto_314838 ) ) ( not ( = ?auto_314830 ?auto_314839 ) ) ( not ( = ?auto_314830 ?auto_314840 ) ) ( not ( = ?auto_314831 ?auto_314832 ) ) ( not ( = ?auto_314831 ?auto_314833 ) ) ( not ( = ?auto_314831 ?auto_314834 ) ) ( not ( = ?auto_314831 ?auto_314835 ) ) ( not ( = ?auto_314831 ?auto_314836 ) ) ( not ( = ?auto_314831 ?auto_314837 ) ) ( not ( = ?auto_314831 ?auto_314838 ) ) ( not ( = ?auto_314831 ?auto_314839 ) ) ( not ( = ?auto_314831 ?auto_314840 ) ) ( not ( = ?auto_314832 ?auto_314833 ) ) ( not ( = ?auto_314832 ?auto_314834 ) ) ( not ( = ?auto_314832 ?auto_314835 ) ) ( not ( = ?auto_314832 ?auto_314836 ) ) ( not ( = ?auto_314832 ?auto_314837 ) ) ( not ( = ?auto_314832 ?auto_314838 ) ) ( not ( = ?auto_314832 ?auto_314839 ) ) ( not ( = ?auto_314832 ?auto_314840 ) ) ( not ( = ?auto_314833 ?auto_314834 ) ) ( not ( = ?auto_314833 ?auto_314835 ) ) ( not ( = ?auto_314833 ?auto_314836 ) ) ( not ( = ?auto_314833 ?auto_314837 ) ) ( not ( = ?auto_314833 ?auto_314838 ) ) ( not ( = ?auto_314833 ?auto_314839 ) ) ( not ( = ?auto_314833 ?auto_314840 ) ) ( not ( = ?auto_314834 ?auto_314835 ) ) ( not ( = ?auto_314834 ?auto_314836 ) ) ( not ( = ?auto_314834 ?auto_314837 ) ) ( not ( = ?auto_314834 ?auto_314838 ) ) ( not ( = ?auto_314834 ?auto_314839 ) ) ( not ( = ?auto_314834 ?auto_314840 ) ) ( not ( = ?auto_314835 ?auto_314836 ) ) ( not ( = ?auto_314835 ?auto_314837 ) ) ( not ( = ?auto_314835 ?auto_314838 ) ) ( not ( = ?auto_314835 ?auto_314839 ) ) ( not ( = ?auto_314835 ?auto_314840 ) ) ( not ( = ?auto_314836 ?auto_314837 ) ) ( not ( = ?auto_314836 ?auto_314838 ) ) ( not ( = ?auto_314836 ?auto_314839 ) ) ( not ( = ?auto_314836 ?auto_314840 ) ) ( not ( = ?auto_314837 ?auto_314838 ) ) ( not ( = ?auto_314837 ?auto_314839 ) ) ( not ( = ?auto_314837 ?auto_314840 ) ) ( not ( = ?auto_314838 ?auto_314839 ) ) ( not ( = ?auto_314838 ?auto_314840 ) ) ( not ( = ?auto_314839 ?auto_314840 ) ) ( ON ?auto_314838 ?auto_314839 ) ( CLEAR ?auto_314836 ) ( ON ?auto_314837 ?auto_314838 ) ( CLEAR ?auto_314837 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_314830 ?auto_314831 ?auto_314832 ?auto_314833 ?auto_314834 ?auto_314835 ?auto_314836 ?auto_314837 )
      ( MAKE-10PILE ?auto_314830 ?auto_314831 ?auto_314832 ?auto_314833 ?auto_314834 ?auto_314835 ?auto_314836 ?auto_314837 ?auto_314838 ?auto_314839 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_314851 - BLOCK
      ?auto_314852 - BLOCK
      ?auto_314853 - BLOCK
      ?auto_314854 - BLOCK
      ?auto_314855 - BLOCK
      ?auto_314856 - BLOCK
      ?auto_314857 - BLOCK
      ?auto_314858 - BLOCK
      ?auto_314859 - BLOCK
      ?auto_314860 - BLOCK
    )
    :vars
    (
      ?auto_314861 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_314860 ?auto_314861 ) ( ON-TABLE ?auto_314851 ) ( ON ?auto_314852 ?auto_314851 ) ( ON ?auto_314853 ?auto_314852 ) ( ON ?auto_314854 ?auto_314853 ) ( ON ?auto_314855 ?auto_314854 ) ( ON ?auto_314856 ?auto_314855 ) ( not ( = ?auto_314851 ?auto_314852 ) ) ( not ( = ?auto_314851 ?auto_314853 ) ) ( not ( = ?auto_314851 ?auto_314854 ) ) ( not ( = ?auto_314851 ?auto_314855 ) ) ( not ( = ?auto_314851 ?auto_314856 ) ) ( not ( = ?auto_314851 ?auto_314857 ) ) ( not ( = ?auto_314851 ?auto_314858 ) ) ( not ( = ?auto_314851 ?auto_314859 ) ) ( not ( = ?auto_314851 ?auto_314860 ) ) ( not ( = ?auto_314851 ?auto_314861 ) ) ( not ( = ?auto_314852 ?auto_314853 ) ) ( not ( = ?auto_314852 ?auto_314854 ) ) ( not ( = ?auto_314852 ?auto_314855 ) ) ( not ( = ?auto_314852 ?auto_314856 ) ) ( not ( = ?auto_314852 ?auto_314857 ) ) ( not ( = ?auto_314852 ?auto_314858 ) ) ( not ( = ?auto_314852 ?auto_314859 ) ) ( not ( = ?auto_314852 ?auto_314860 ) ) ( not ( = ?auto_314852 ?auto_314861 ) ) ( not ( = ?auto_314853 ?auto_314854 ) ) ( not ( = ?auto_314853 ?auto_314855 ) ) ( not ( = ?auto_314853 ?auto_314856 ) ) ( not ( = ?auto_314853 ?auto_314857 ) ) ( not ( = ?auto_314853 ?auto_314858 ) ) ( not ( = ?auto_314853 ?auto_314859 ) ) ( not ( = ?auto_314853 ?auto_314860 ) ) ( not ( = ?auto_314853 ?auto_314861 ) ) ( not ( = ?auto_314854 ?auto_314855 ) ) ( not ( = ?auto_314854 ?auto_314856 ) ) ( not ( = ?auto_314854 ?auto_314857 ) ) ( not ( = ?auto_314854 ?auto_314858 ) ) ( not ( = ?auto_314854 ?auto_314859 ) ) ( not ( = ?auto_314854 ?auto_314860 ) ) ( not ( = ?auto_314854 ?auto_314861 ) ) ( not ( = ?auto_314855 ?auto_314856 ) ) ( not ( = ?auto_314855 ?auto_314857 ) ) ( not ( = ?auto_314855 ?auto_314858 ) ) ( not ( = ?auto_314855 ?auto_314859 ) ) ( not ( = ?auto_314855 ?auto_314860 ) ) ( not ( = ?auto_314855 ?auto_314861 ) ) ( not ( = ?auto_314856 ?auto_314857 ) ) ( not ( = ?auto_314856 ?auto_314858 ) ) ( not ( = ?auto_314856 ?auto_314859 ) ) ( not ( = ?auto_314856 ?auto_314860 ) ) ( not ( = ?auto_314856 ?auto_314861 ) ) ( not ( = ?auto_314857 ?auto_314858 ) ) ( not ( = ?auto_314857 ?auto_314859 ) ) ( not ( = ?auto_314857 ?auto_314860 ) ) ( not ( = ?auto_314857 ?auto_314861 ) ) ( not ( = ?auto_314858 ?auto_314859 ) ) ( not ( = ?auto_314858 ?auto_314860 ) ) ( not ( = ?auto_314858 ?auto_314861 ) ) ( not ( = ?auto_314859 ?auto_314860 ) ) ( not ( = ?auto_314859 ?auto_314861 ) ) ( not ( = ?auto_314860 ?auto_314861 ) ) ( ON ?auto_314859 ?auto_314860 ) ( ON ?auto_314858 ?auto_314859 ) ( CLEAR ?auto_314856 ) ( ON ?auto_314857 ?auto_314858 ) ( CLEAR ?auto_314857 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_314851 ?auto_314852 ?auto_314853 ?auto_314854 ?auto_314855 ?auto_314856 ?auto_314857 )
      ( MAKE-10PILE ?auto_314851 ?auto_314852 ?auto_314853 ?auto_314854 ?auto_314855 ?auto_314856 ?auto_314857 ?auto_314858 ?auto_314859 ?auto_314860 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_314872 - BLOCK
      ?auto_314873 - BLOCK
      ?auto_314874 - BLOCK
      ?auto_314875 - BLOCK
      ?auto_314876 - BLOCK
      ?auto_314877 - BLOCK
      ?auto_314878 - BLOCK
      ?auto_314879 - BLOCK
      ?auto_314880 - BLOCK
      ?auto_314881 - BLOCK
    )
    :vars
    (
      ?auto_314882 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_314881 ?auto_314882 ) ( ON-TABLE ?auto_314872 ) ( ON ?auto_314873 ?auto_314872 ) ( ON ?auto_314874 ?auto_314873 ) ( ON ?auto_314875 ?auto_314874 ) ( ON ?auto_314876 ?auto_314875 ) ( ON ?auto_314877 ?auto_314876 ) ( not ( = ?auto_314872 ?auto_314873 ) ) ( not ( = ?auto_314872 ?auto_314874 ) ) ( not ( = ?auto_314872 ?auto_314875 ) ) ( not ( = ?auto_314872 ?auto_314876 ) ) ( not ( = ?auto_314872 ?auto_314877 ) ) ( not ( = ?auto_314872 ?auto_314878 ) ) ( not ( = ?auto_314872 ?auto_314879 ) ) ( not ( = ?auto_314872 ?auto_314880 ) ) ( not ( = ?auto_314872 ?auto_314881 ) ) ( not ( = ?auto_314872 ?auto_314882 ) ) ( not ( = ?auto_314873 ?auto_314874 ) ) ( not ( = ?auto_314873 ?auto_314875 ) ) ( not ( = ?auto_314873 ?auto_314876 ) ) ( not ( = ?auto_314873 ?auto_314877 ) ) ( not ( = ?auto_314873 ?auto_314878 ) ) ( not ( = ?auto_314873 ?auto_314879 ) ) ( not ( = ?auto_314873 ?auto_314880 ) ) ( not ( = ?auto_314873 ?auto_314881 ) ) ( not ( = ?auto_314873 ?auto_314882 ) ) ( not ( = ?auto_314874 ?auto_314875 ) ) ( not ( = ?auto_314874 ?auto_314876 ) ) ( not ( = ?auto_314874 ?auto_314877 ) ) ( not ( = ?auto_314874 ?auto_314878 ) ) ( not ( = ?auto_314874 ?auto_314879 ) ) ( not ( = ?auto_314874 ?auto_314880 ) ) ( not ( = ?auto_314874 ?auto_314881 ) ) ( not ( = ?auto_314874 ?auto_314882 ) ) ( not ( = ?auto_314875 ?auto_314876 ) ) ( not ( = ?auto_314875 ?auto_314877 ) ) ( not ( = ?auto_314875 ?auto_314878 ) ) ( not ( = ?auto_314875 ?auto_314879 ) ) ( not ( = ?auto_314875 ?auto_314880 ) ) ( not ( = ?auto_314875 ?auto_314881 ) ) ( not ( = ?auto_314875 ?auto_314882 ) ) ( not ( = ?auto_314876 ?auto_314877 ) ) ( not ( = ?auto_314876 ?auto_314878 ) ) ( not ( = ?auto_314876 ?auto_314879 ) ) ( not ( = ?auto_314876 ?auto_314880 ) ) ( not ( = ?auto_314876 ?auto_314881 ) ) ( not ( = ?auto_314876 ?auto_314882 ) ) ( not ( = ?auto_314877 ?auto_314878 ) ) ( not ( = ?auto_314877 ?auto_314879 ) ) ( not ( = ?auto_314877 ?auto_314880 ) ) ( not ( = ?auto_314877 ?auto_314881 ) ) ( not ( = ?auto_314877 ?auto_314882 ) ) ( not ( = ?auto_314878 ?auto_314879 ) ) ( not ( = ?auto_314878 ?auto_314880 ) ) ( not ( = ?auto_314878 ?auto_314881 ) ) ( not ( = ?auto_314878 ?auto_314882 ) ) ( not ( = ?auto_314879 ?auto_314880 ) ) ( not ( = ?auto_314879 ?auto_314881 ) ) ( not ( = ?auto_314879 ?auto_314882 ) ) ( not ( = ?auto_314880 ?auto_314881 ) ) ( not ( = ?auto_314880 ?auto_314882 ) ) ( not ( = ?auto_314881 ?auto_314882 ) ) ( ON ?auto_314880 ?auto_314881 ) ( ON ?auto_314879 ?auto_314880 ) ( CLEAR ?auto_314877 ) ( ON ?auto_314878 ?auto_314879 ) ( CLEAR ?auto_314878 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_314872 ?auto_314873 ?auto_314874 ?auto_314875 ?auto_314876 ?auto_314877 ?auto_314878 )
      ( MAKE-10PILE ?auto_314872 ?auto_314873 ?auto_314874 ?auto_314875 ?auto_314876 ?auto_314877 ?auto_314878 ?auto_314879 ?auto_314880 ?auto_314881 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_314893 - BLOCK
      ?auto_314894 - BLOCK
      ?auto_314895 - BLOCK
      ?auto_314896 - BLOCK
      ?auto_314897 - BLOCK
      ?auto_314898 - BLOCK
      ?auto_314899 - BLOCK
      ?auto_314900 - BLOCK
      ?auto_314901 - BLOCK
      ?auto_314902 - BLOCK
    )
    :vars
    (
      ?auto_314903 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_314902 ?auto_314903 ) ( ON-TABLE ?auto_314893 ) ( ON ?auto_314894 ?auto_314893 ) ( ON ?auto_314895 ?auto_314894 ) ( ON ?auto_314896 ?auto_314895 ) ( ON ?auto_314897 ?auto_314896 ) ( not ( = ?auto_314893 ?auto_314894 ) ) ( not ( = ?auto_314893 ?auto_314895 ) ) ( not ( = ?auto_314893 ?auto_314896 ) ) ( not ( = ?auto_314893 ?auto_314897 ) ) ( not ( = ?auto_314893 ?auto_314898 ) ) ( not ( = ?auto_314893 ?auto_314899 ) ) ( not ( = ?auto_314893 ?auto_314900 ) ) ( not ( = ?auto_314893 ?auto_314901 ) ) ( not ( = ?auto_314893 ?auto_314902 ) ) ( not ( = ?auto_314893 ?auto_314903 ) ) ( not ( = ?auto_314894 ?auto_314895 ) ) ( not ( = ?auto_314894 ?auto_314896 ) ) ( not ( = ?auto_314894 ?auto_314897 ) ) ( not ( = ?auto_314894 ?auto_314898 ) ) ( not ( = ?auto_314894 ?auto_314899 ) ) ( not ( = ?auto_314894 ?auto_314900 ) ) ( not ( = ?auto_314894 ?auto_314901 ) ) ( not ( = ?auto_314894 ?auto_314902 ) ) ( not ( = ?auto_314894 ?auto_314903 ) ) ( not ( = ?auto_314895 ?auto_314896 ) ) ( not ( = ?auto_314895 ?auto_314897 ) ) ( not ( = ?auto_314895 ?auto_314898 ) ) ( not ( = ?auto_314895 ?auto_314899 ) ) ( not ( = ?auto_314895 ?auto_314900 ) ) ( not ( = ?auto_314895 ?auto_314901 ) ) ( not ( = ?auto_314895 ?auto_314902 ) ) ( not ( = ?auto_314895 ?auto_314903 ) ) ( not ( = ?auto_314896 ?auto_314897 ) ) ( not ( = ?auto_314896 ?auto_314898 ) ) ( not ( = ?auto_314896 ?auto_314899 ) ) ( not ( = ?auto_314896 ?auto_314900 ) ) ( not ( = ?auto_314896 ?auto_314901 ) ) ( not ( = ?auto_314896 ?auto_314902 ) ) ( not ( = ?auto_314896 ?auto_314903 ) ) ( not ( = ?auto_314897 ?auto_314898 ) ) ( not ( = ?auto_314897 ?auto_314899 ) ) ( not ( = ?auto_314897 ?auto_314900 ) ) ( not ( = ?auto_314897 ?auto_314901 ) ) ( not ( = ?auto_314897 ?auto_314902 ) ) ( not ( = ?auto_314897 ?auto_314903 ) ) ( not ( = ?auto_314898 ?auto_314899 ) ) ( not ( = ?auto_314898 ?auto_314900 ) ) ( not ( = ?auto_314898 ?auto_314901 ) ) ( not ( = ?auto_314898 ?auto_314902 ) ) ( not ( = ?auto_314898 ?auto_314903 ) ) ( not ( = ?auto_314899 ?auto_314900 ) ) ( not ( = ?auto_314899 ?auto_314901 ) ) ( not ( = ?auto_314899 ?auto_314902 ) ) ( not ( = ?auto_314899 ?auto_314903 ) ) ( not ( = ?auto_314900 ?auto_314901 ) ) ( not ( = ?auto_314900 ?auto_314902 ) ) ( not ( = ?auto_314900 ?auto_314903 ) ) ( not ( = ?auto_314901 ?auto_314902 ) ) ( not ( = ?auto_314901 ?auto_314903 ) ) ( not ( = ?auto_314902 ?auto_314903 ) ) ( ON ?auto_314901 ?auto_314902 ) ( ON ?auto_314900 ?auto_314901 ) ( ON ?auto_314899 ?auto_314900 ) ( CLEAR ?auto_314897 ) ( ON ?auto_314898 ?auto_314899 ) ( CLEAR ?auto_314898 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_314893 ?auto_314894 ?auto_314895 ?auto_314896 ?auto_314897 ?auto_314898 )
      ( MAKE-10PILE ?auto_314893 ?auto_314894 ?auto_314895 ?auto_314896 ?auto_314897 ?auto_314898 ?auto_314899 ?auto_314900 ?auto_314901 ?auto_314902 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_314914 - BLOCK
      ?auto_314915 - BLOCK
      ?auto_314916 - BLOCK
      ?auto_314917 - BLOCK
      ?auto_314918 - BLOCK
      ?auto_314919 - BLOCK
      ?auto_314920 - BLOCK
      ?auto_314921 - BLOCK
      ?auto_314922 - BLOCK
      ?auto_314923 - BLOCK
    )
    :vars
    (
      ?auto_314924 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_314923 ?auto_314924 ) ( ON-TABLE ?auto_314914 ) ( ON ?auto_314915 ?auto_314914 ) ( ON ?auto_314916 ?auto_314915 ) ( ON ?auto_314917 ?auto_314916 ) ( ON ?auto_314918 ?auto_314917 ) ( not ( = ?auto_314914 ?auto_314915 ) ) ( not ( = ?auto_314914 ?auto_314916 ) ) ( not ( = ?auto_314914 ?auto_314917 ) ) ( not ( = ?auto_314914 ?auto_314918 ) ) ( not ( = ?auto_314914 ?auto_314919 ) ) ( not ( = ?auto_314914 ?auto_314920 ) ) ( not ( = ?auto_314914 ?auto_314921 ) ) ( not ( = ?auto_314914 ?auto_314922 ) ) ( not ( = ?auto_314914 ?auto_314923 ) ) ( not ( = ?auto_314914 ?auto_314924 ) ) ( not ( = ?auto_314915 ?auto_314916 ) ) ( not ( = ?auto_314915 ?auto_314917 ) ) ( not ( = ?auto_314915 ?auto_314918 ) ) ( not ( = ?auto_314915 ?auto_314919 ) ) ( not ( = ?auto_314915 ?auto_314920 ) ) ( not ( = ?auto_314915 ?auto_314921 ) ) ( not ( = ?auto_314915 ?auto_314922 ) ) ( not ( = ?auto_314915 ?auto_314923 ) ) ( not ( = ?auto_314915 ?auto_314924 ) ) ( not ( = ?auto_314916 ?auto_314917 ) ) ( not ( = ?auto_314916 ?auto_314918 ) ) ( not ( = ?auto_314916 ?auto_314919 ) ) ( not ( = ?auto_314916 ?auto_314920 ) ) ( not ( = ?auto_314916 ?auto_314921 ) ) ( not ( = ?auto_314916 ?auto_314922 ) ) ( not ( = ?auto_314916 ?auto_314923 ) ) ( not ( = ?auto_314916 ?auto_314924 ) ) ( not ( = ?auto_314917 ?auto_314918 ) ) ( not ( = ?auto_314917 ?auto_314919 ) ) ( not ( = ?auto_314917 ?auto_314920 ) ) ( not ( = ?auto_314917 ?auto_314921 ) ) ( not ( = ?auto_314917 ?auto_314922 ) ) ( not ( = ?auto_314917 ?auto_314923 ) ) ( not ( = ?auto_314917 ?auto_314924 ) ) ( not ( = ?auto_314918 ?auto_314919 ) ) ( not ( = ?auto_314918 ?auto_314920 ) ) ( not ( = ?auto_314918 ?auto_314921 ) ) ( not ( = ?auto_314918 ?auto_314922 ) ) ( not ( = ?auto_314918 ?auto_314923 ) ) ( not ( = ?auto_314918 ?auto_314924 ) ) ( not ( = ?auto_314919 ?auto_314920 ) ) ( not ( = ?auto_314919 ?auto_314921 ) ) ( not ( = ?auto_314919 ?auto_314922 ) ) ( not ( = ?auto_314919 ?auto_314923 ) ) ( not ( = ?auto_314919 ?auto_314924 ) ) ( not ( = ?auto_314920 ?auto_314921 ) ) ( not ( = ?auto_314920 ?auto_314922 ) ) ( not ( = ?auto_314920 ?auto_314923 ) ) ( not ( = ?auto_314920 ?auto_314924 ) ) ( not ( = ?auto_314921 ?auto_314922 ) ) ( not ( = ?auto_314921 ?auto_314923 ) ) ( not ( = ?auto_314921 ?auto_314924 ) ) ( not ( = ?auto_314922 ?auto_314923 ) ) ( not ( = ?auto_314922 ?auto_314924 ) ) ( not ( = ?auto_314923 ?auto_314924 ) ) ( ON ?auto_314922 ?auto_314923 ) ( ON ?auto_314921 ?auto_314922 ) ( ON ?auto_314920 ?auto_314921 ) ( CLEAR ?auto_314918 ) ( ON ?auto_314919 ?auto_314920 ) ( CLEAR ?auto_314919 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_314914 ?auto_314915 ?auto_314916 ?auto_314917 ?auto_314918 ?auto_314919 )
      ( MAKE-10PILE ?auto_314914 ?auto_314915 ?auto_314916 ?auto_314917 ?auto_314918 ?auto_314919 ?auto_314920 ?auto_314921 ?auto_314922 ?auto_314923 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_314935 - BLOCK
      ?auto_314936 - BLOCK
      ?auto_314937 - BLOCK
      ?auto_314938 - BLOCK
      ?auto_314939 - BLOCK
      ?auto_314940 - BLOCK
      ?auto_314941 - BLOCK
      ?auto_314942 - BLOCK
      ?auto_314943 - BLOCK
      ?auto_314944 - BLOCK
    )
    :vars
    (
      ?auto_314945 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_314944 ?auto_314945 ) ( ON-TABLE ?auto_314935 ) ( ON ?auto_314936 ?auto_314935 ) ( ON ?auto_314937 ?auto_314936 ) ( ON ?auto_314938 ?auto_314937 ) ( not ( = ?auto_314935 ?auto_314936 ) ) ( not ( = ?auto_314935 ?auto_314937 ) ) ( not ( = ?auto_314935 ?auto_314938 ) ) ( not ( = ?auto_314935 ?auto_314939 ) ) ( not ( = ?auto_314935 ?auto_314940 ) ) ( not ( = ?auto_314935 ?auto_314941 ) ) ( not ( = ?auto_314935 ?auto_314942 ) ) ( not ( = ?auto_314935 ?auto_314943 ) ) ( not ( = ?auto_314935 ?auto_314944 ) ) ( not ( = ?auto_314935 ?auto_314945 ) ) ( not ( = ?auto_314936 ?auto_314937 ) ) ( not ( = ?auto_314936 ?auto_314938 ) ) ( not ( = ?auto_314936 ?auto_314939 ) ) ( not ( = ?auto_314936 ?auto_314940 ) ) ( not ( = ?auto_314936 ?auto_314941 ) ) ( not ( = ?auto_314936 ?auto_314942 ) ) ( not ( = ?auto_314936 ?auto_314943 ) ) ( not ( = ?auto_314936 ?auto_314944 ) ) ( not ( = ?auto_314936 ?auto_314945 ) ) ( not ( = ?auto_314937 ?auto_314938 ) ) ( not ( = ?auto_314937 ?auto_314939 ) ) ( not ( = ?auto_314937 ?auto_314940 ) ) ( not ( = ?auto_314937 ?auto_314941 ) ) ( not ( = ?auto_314937 ?auto_314942 ) ) ( not ( = ?auto_314937 ?auto_314943 ) ) ( not ( = ?auto_314937 ?auto_314944 ) ) ( not ( = ?auto_314937 ?auto_314945 ) ) ( not ( = ?auto_314938 ?auto_314939 ) ) ( not ( = ?auto_314938 ?auto_314940 ) ) ( not ( = ?auto_314938 ?auto_314941 ) ) ( not ( = ?auto_314938 ?auto_314942 ) ) ( not ( = ?auto_314938 ?auto_314943 ) ) ( not ( = ?auto_314938 ?auto_314944 ) ) ( not ( = ?auto_314938 ?auto_314945 ) ) ( not ( = ?auto_314939 ?auto_314940 ) ) ( not ( = ?auto_314939 ?auto_314941 ) ) ( not ( = ?auto_314939 ?auto_314942 ) ) ( not ( = ?auto_314939 ?auto_314943 ) ) ( not ( = ?auto_314939 ?auto_314944 ) ) ( not ( = ?auto_314939 ?auto_314945 ) ) ( not ( = ?auto_314940 ?auto_314941 ) ) ( not ( = ?auto_314940 ?auto_314942 ) ) ( not ( = ?auto_314940 ?auto_314943 ) ) ( not ( = ?auto_314940 ?auto_314944 ) ) ( not ( = ?auto_314940 ?auto_314945 ) ) ( not ( = ?auto_314941 ?auto_314942 ) ) ( not ( = ?auto_314941 ?auto_314943 ) ) ( not ( = ?auto_314941 ?auto_314944 ) ) ( not ( = ?auto_314941 ?auto_314945 ) ) ( not ( = ?auto_314942 ?auto_314943 ) ) ( not ( = ?auto_314942 ?auto_314944 ) ) ( not ( = ?auto_314942 ?auto_314945 ) ) ( not ( = ?auto_314943 ?auto_314944 ) ) ( not ( = ?auto_314943 ?auto_314945 ) ) ( not ( = ?auto_314944 ?auto_314945 ) ) ( ON ?auto_314943 ?auto_314944 ) ( ON ?auto_314942 ?auto_314943 ) ( ON ?auto_314941 ?auto_314942 ) ( ON ?auto_314940 ?auto_314941 ) ( CLEAR ?auto_314938 ) ( ON ?auto_314939 ?auto_314940 ) ( CLEAR ?auto_314939 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_314935 ?auto_314936 ?auto_314937 ?auto_314938 ?auto_314939 )
      ( MAKE-10PILE ?auto_314935 ?auto_314936 ?auto_314937 ?auto_314938 ?auto_314939 ?auto_314940 ?auto_314941 ?auto_314942 ?auto_314943 ?auto_314944 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_314956 - BLOCK
      ?auto_314957 - BLOCK
      ?auto_314958 - BLOCK
      ?auto_314959 - BLOCK
      ?auto_314960 - BLOCK
      ?auto_314961 - BLOCK
      ?auto_314962 - BLOCK
      ?auto_314963 - BLOCK
      ?auto_314964 - BLOCK
      ?auto_314965 - BLOCK
    )
    :vars
    (
      ?auto_314966 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_314965 ?auto_314966 ) ( ON-TABLE ?auto_314956 ) ( ON ?auto_314957 ?auto_314956 ) ( ON ?auto_314958 ?auto_314957 ) ( ON ?auto_314959 ?auto_314958 ) ( not ( = ?auto_314956 ?auto_314957 ) ) ( not ( = ?auto_314956 ?auto_314958 ) ) ( not ( = ?auto_314956 ?auto_314959 ) ) ( not ( = ?auto_314956 ?auto_314960 ) ) ( not ( = ?auto_314956 ?auto_314961 ) ) ( not ( = ?auto_314956 ?auto_314962 ) ) ( not ( = ?auto_314956 ?auto_314963 ) ) ( not ( = ?auto_314956 ?auto_314964 ) ) ( not ( = ?auto_314956 ?auto_314965 ) ) ( not ( = ?auto_314956 ?auto_314966 ) ) ( not ( = ?auto_314957 ?auto_314958 ) ) ( not ( = ?auto_314957 ?auto_314959 ) ) ( not ( = ?auto_314957 ?auto_314960 ) ) ( not ( = ?auto_314957 ?auto_314961 ) ) ( not ( = ?auto_314957 ?auto_314962 ) ) ( not ( = ?auto_314957 ?auto_314963 ) ) ( not ( = ?auto_314957 ?auto_314964 ) ) ( not ( = ?auto_314957 ?auto_314965 ) ) ( not ( = ?auto_314957 ?auto_314966 ) ) ( not ( = ?auto_314958 ?auto_314959 ) ) ( not ( = ?auto_314958 ?auto_314960 ) ) ( not ( = ?auto_314958 ?auto_314961 ) ) ( not ( = ?auto_314958 ?auto_314962 ) ) ( not ( = ?auto_314958 ?auto_314963 ) ) ( not ( = ?auto_314958 ?auto_314964 ) ) ( not ( = ?auto_314958 ?auto_314965 ) ) ( not ( = ?auto_314958 ?auto_314966 ) ) ( not ( = ?auto_314959 ?auto_314960 ) ) ( not ( = ?auto_314959 ?auto_314961 ) ) ( not ( = ?auto_314959 ?auto_314962 ) ) ( not ( = ?auto_314959 ?auto_314963 ) ) ( not ( = ?auto_314959 ?auto_314964 ) ) ( not ( = ?auto_314959 ?auto_314965 ) ) ( not ( = ?auto_314959 ?auto_314966 ) ) ( not ( = ?auto_314960 ?auto_314961 ) ) ( not ( = ?auto_314960 ?auto_314962 ) ) ( not ( = ?auto_314960 ?auto_314963 ) ) ( not ( = ?auto_314960 ?auto_314964 ) ) ( not ( = ?auto_314960 ?auto_314965 ) ) ( not ( = ?auto_314960 ?auto_314966 ) ) ( not ( = ?auto_314961 ?auto_314962 ) ) ( not ( = ?auto_314961 ?auto_314963 ) ) ( not ( = ?auto_314961 ?auto_314964 ) ) ( not ( = ?auto_314961 ?auto_314965 ) ) ( not ( = ?auto_314961 ?auto_314966 ) ) ( not ( = ?auto_314962 ?auto_314963 ) ) ( not ( = ?auto_314962 ?auto_314964 ) ) ( not ( = ?auto_314962 ?auto_314965 ) ) ( not ( = ?auto_314962 ?auto_314966 ) ) ( not ( = ?auto_314963 ?auto_314964 ) ) ( not ( = ?auto_314963 ?auto_314965 ) ) ( not ( = ?auto_314963 ?auto_314966 ) ) ( not ( = ?auto_314964 ?auto_314965 ) ) ( not ( = ?auto_314964 ?auto_314966 ) ) ( not ( = ?auto_314965 ?auto_314966 ) ) ( ON ?auto_314964 ?auto_314965 ) ( ON ?auto_314963 ?auto_314964 ) ( ON ?auto_314962 ?auto_314963 ) ( ON ?auto_314961 ?auto_314962 ) ( CLEAR ?auto_314959 ) ( ON ?auto_314960 ?auto_314961 ) ( CLEAR ?auto_314960 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_314956 ?auto_314957 ?auto_314958 ?auto_314959 ?auto_314960 )
      ( MAKE-10PILE ?auto_314956 ?auto_314957 ?auto_314958 ?auto_314959 ?auto_314960 ?auto_314961 ?auto_314962 ?auto_314963 ?auto_314964 ?auto_314965 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_314977 - BLOCK
      ?auto_314978 - BLOCK
      ?auto_314979 - BLOCK
      ?auto_314980 - BLOCK
      ?auto_314981 - BLOCK
      ?auto_314982 - BLOCK
      ?auto_314983 - BLOCK
      ?auto_314984 - BLOCK
      ?auto_314985 - BLOCK
      ?auto_314986 - BLOCK
    )
    :vars
    (
      ?auto_314987 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_314986 ?auto_314987 ) ( ON-TABLE ?auto_314977 ) ( ON ?auto_314978 ?auto_314977 ) ( ON ?auto_314979 ?auto_314978 ) ( not ( = ?auto_314977 ?auto_314978 ) ) ( not ( = ?auto_314977 ?auto_314979 ) ) ( not ( = ?auto_314977 ?auto_314980 ) ) ( not ( = ?auto_314977 ?auto_314981 ) ) ( not ( = ?auto_314977 ?auto_314982 ) ) ( not ( = ?auto_314977 ?auto_314983 ) ) ( not ( = ?auto_314977 ?auto_314984 ) ) ( not ( = ?auto_314977 ?auto_314985 ) ) ( not ( = ?auto_314977 ?auto_314986 ) ) ( not ( = ?auto_314977 ?auto_314987 ) ) ( not ( = ?auto_314978 ?auto_314979 ) ) ( not ( = ?auto_314978 ?auto_314980 ) ) ( not ( = ?auto_314978 ?auto_314981 ) ) ( not ( = ?auto_314978 ?auto_314982 ) ) ( not ( = ?auto_314978 ?auto_314983 ) ) ( not ( = ?auto_314978 ?auto_314984 ) ) ( not ( = ?auto_314978 ?auto_314985 ) ) ( not ( = ?auto_314978 ?auto_314986 ) ) ( not ( = ?auto_314978 ?auto_314987 ) ) ( not ( = ?auto_314979 ?auto_314980 ) ) ( not ( = ?auto_314979 ?auto_314981 ) ) ( not ( = ?auto_314979 ?auto_314982 ) ) ( not ( = ?auto_314979 ?auto_314983 ) ) ( not ( = ?auto_314979 ?auto_314984 ) ) ( not ( = ?auto_314979 ?auto_314985 ) ) ( not ( = ?auto_314979 ?auto_314986 ) ) ( not ( = ?auto_314979 ?auto_314987 ) ) ( not ( = ?auto_314980 ?auto_314981 ) ) ( not ( = ?auto_314980 ?auto_314982 ) ) ( not ( = ?auto_314980 ?auto_314983 ) ) ( not ( = ?auto_314980 ?auto_314984 ) ) ( not ( = ?auto_314980 ?auto_314985 ) ) ( not ( = ?auto_314980 ?auto_314986 ) ) ( not ( = ?auto_314980 ?auto_314987 ) ) ( not ( = ?auto_314981 ?auto_314982 ) ) ( not ( = ?auto_314981 ?auto_314983 ) ) ( not ( = ?auto_314981 ?auto_314984 ) ) ( not ( = ?auto_314981 ?auto_314985 ) ) ( not ( = ?auto_314981 ?auto_314986 ) ) ( not ( = ?auto_314981 ?auto_314987 ) ) ( not ( = ?auto_314982 ?auto_314983 ) ) ( not ( = ?auto_314982 ?auto_314984 ) ) ( not ( = ?auto_314982 ?auto_314985 ) ) ( not ( = ?auto_314982 ?auto_314986 ) ) ( not ( = ?auto_314982 ?auto_314987 ) ) ( not ( = ?auto_314983 ?auto_314984 ) ) ( not ( = ?auto_314983 ?auto_314985 ) ) ( not ( = ?auto_314983 ?auto_314986 ) ) ( not ( = ?auto_314983 ?auto_314987 ) ) ( not ( = ?auto_314984 ?auto_314985 ) ) ( not ( = ?auto_314984 ?auto_314986 ) ) ( not ( = ?auto_314984 ?auto_314987 ) ) ( not ( = ?auto_314985 ?auto_314986 ) ) ( not ( = ?auto_314985 ?auto_314987 ) ) ( not ( = ?auto_314986 ?auto_314987 ) ) ( ON ?auto_314985 ?auto_314986 ) ( ON ?auto_314984 ?auto_314985 ) ( ON ?auto_314983 ?auto_314984 ) ( ON ?auto_314982 ?auto_314983 ) ( ON ?auto_314981 ?auto_314982 ) ( CLEAR ?auto_314979 ) ( ON ?auto_314980 ?auto_314981 ) ( CLEAR ?auto_314980 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_314977 ?auto_314978 ?auto_314979 ?auto_314980 )
      ( MAKE-10PILE ?auto_314977 ?auto_314978 ?auto_314979 ?auto_314980 ?auto_314981 ?auto_314982 ?auto_314983 ?auto_314984 ?auto_314985 ?auto_314986 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_314998 - BLOCK
      ?auto_314999 - BLOCK
      ?auto_315000 - BLOCK
      ?auto_315001 - BLOCK
      ?auto_315002 - BLOCK
      ?auto_315003 - BLOCK
      ?auto_315004 - BLOCK
      ?auto_315005 - BLOCK
      ?auto_315006 - BLOCK
      ?auto_315007 - BLOCK
    )
    :vars
    (
      ?auto_315008 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_315007 ?auto_315008 ) ( ON-TABLE ?auto_314998 ) ( ON ?auto_314999 ?auto_314998 ) ( ON ?auto_315000 ?auto_314999 ) ( not ( = ?auto_314998 ?auto_314999 ) ) ( not ( = ?auto_314998 ?auto_315000 ) ) ( not ( = ?auto_314998 ?auto_315001 ) ) ( not ( = ?auto_314998 ?auto_315002 ) ) ( not ( = ?auto_314998 ?auto_315003 ) ) ( not ( = ?auto_314998 ?auto_315004 ) ) ( not ( = ?auto_314998 ?auto_315005 ) ) ( not ( = ?auto_314998 ?auto_315006 ) ) ( not ( = ?auto_314998 ?auto_315007 ) ) ( not ( = ?auto_314998 ?auto_315008 ) ) ( not ( = ?auto_314999 ?auto_315000 ) ) ( not ( = ?auto_314999 ?auto_315001 ) ) ( not ( = ?auto_314999 ?auto_315002 ) ) ( not ( = ?auto_314999 ?auto_315003 ) ) ( not ( = ?auto_314999 ?auto_315004 ) ) ( not ( = ?auto_314999 ?auto_315005 ) ) ( not ( = ?auto_314999 ?auto_315006 ) ) ( not ( = ?auto_314999 ?auto_315007 ) ) ( not ( = ?auto_314999 ?auto_315008 ) ) ( not ( = ?auto_315000 ?auto_315001 ) ) ( not ( = ?auto_315000 ?auto_315002 ) ) ( not ( = ?auto_315000 ?auto_315003 ) ) ( not ( = ?auto_315000 ?auto_315004 ) ) ( not ( = ?auto_315000 ?auto_315005 ) ) ( not ( = ?auto_315000 ?auto_315006 ) ) ( not ( = ?auto_315000 ?auto_315007 ) ) ( not ( = ?auto_315000 ?auto_315008 ) ) ( not ( = ?auto_315001 ?auto_315002 ) ) ( not ( = ?auto_315001 ?auto_315003 ) ) ( not ( = ?auto_315001 ?auto_315004 ) ) ( not ( = ?auto_315001 ?auto_315005 ) ) ( not ( = ?auto_315001 ?auto_315006 ) ) ( not ( = ?auto_315001 ?auto_315007 ) ) ( not ( = ?auto_315001 ?auto_315008 ) ) ( not ( = ?auto_315002 ?auto_315003 ) ) ( not ( = ?auto_315002 ?auto_315004 ) ) ( not ( = ?auto_315002 ?auto_315005 ) ) ( not ( = ?auto_315002 ?auto_315006 ) ) ( not ( = ?auto_315002 ?auto_315007 ) ) ( not ( = ?auto_315002 ?auto_315008 ) ) ( not ( = ?auto_315003 ?auto_315004 ) ) ( not ( = ?auto_315003 ?auto_315005 ) ) ( not ( = ?auto_315003 ?auto_315006 ) ) ( not ( = ?auto_315003 ?auto_315007 ) ) ( not ( = ?auto_315003 ?auto_315008 ) ) ( not ( = ?auto_315004 ?auto_315005 ) ) ( not ( = ?auto_315004 ?auto_315006 ) ) ( not ( = ?auto_315004 ?auto_315007 ) ) ( not ( = ?auto_315004 ?auto_315008 ) ) ( not ( = ?auto_315005 ?auto_315006 ) ) ( not ( = ?auto_315005 ?auto_315007 ) ) ( not ( = ?auto_315005 ?auto_315008 ) ) ( not ( = ?auto_315006 ?auto_315007 ) ) ( not ( = ?auto_315006 ?auto_315008 ) ) ( not ( = ?auto_315007 ?auto_315008 ) ) ( ON ?auto_315006 ?auto_315007 ) ( ON ?auto_315005 ?auto_315006 ) ( ON ?auto_315004 ?auto_315005 ) ( ON ?auto_315003 ?auto_315004 ) ( ON ?auto_315002 ?auto_315003 ) ( CLEAR ?auto_315000 ) ( ON ?auto_315001 ?auto_315002 ) ( CLEAR ?auto_315001 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_314998 ?auto_314999 ?auto_315000 ?auto_315001 )
      ( MAKE-10PILE ?auto_314998 ?auto_314999 ?auto_315000 ?auto_315001 ?auto_315002 ?auto_315003 ?auto_315004 ?auto_315005 ?auto_315006 ?auto_315007 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_315019 - BLOCK
      ?auto_315020 - BLOCK
      ?auto_315021 - BLOCK
      ?auto_315022 - BLOCK
      ?auto_315023 - BLOCK
      ?auto_315024 - BLOCK
      ?auto_315025 - BLOCK
      ?auto_315026 - BLOCK
      ?auto_315027 - BLOCK
      ?auto_315028 - BLOCK
    )
    :vars
    (
      ?auto_315029 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_315028 ?auto_315029 ) ( ON-TABLE ?auto_315019 ) ( ON ?auto_315020 ?auto_315019 ) ( not ( = ?auto_315019 ?auto_315020 ) ) ( not ( = ?auto_315019 ?auto_315021 ) ) ( not ( = ?auto_315019 ?auto_315022 ) ) ( not ( = ?auto_315019 ?auto_315023 ) ) ( not ( = ?auto_315019 ?auto_315024 ) ) ( not ( = ?auto_315019 ?auto_315025 ) ) ( not ( = ?auto_315019 ?auto_315026 ) ) ( not ( = ?auto_315019 ?auto_315027 ) ) ( not ( = ?auto_315019 ?auto_315028 ) ) ( not ( = ?auto_315019 ?auto_315029 ) ) ( not ( = ?auto_315020 ?auto_315021 ) ) ( not ( = ?auto_315020 ?auto_315022 ) ) ( not ( = ?auto_315020 ?auto_315023 ) ) ( not ( = ?auto_315020 ?auto_315024 ) ) ( not ( = ?auto_315020 ?auto_315025 ) ) ( not ( = ?auto_315020 ?auto_315026 ) ) ( not ( = ?auto_315020 ?auto_315027 ) ) ( not ( = ?auto_315020 ?auto_315028 ) ) ( not ( = ?auto_315020 ?auto_315029 ) ) ( not ( = ?auto_315021 ?auto_315022 ) ) ( not ( = ?auto_315021 ?auto_315023 ) ) ( not ( = ?auto_315021 ?auto_315024 ) ) ( not ( = ?auto_315021 ?auto_315025 ) ) ( not ( = ?auto_315021 ?auto_315026 ) ) ( not ( = ?auto_315021 ?auto_315027 ) ) ( not ( = ?auto_315021 ?auto_315028 ) ) ( not ( = ?auto_315021 ?auto_315029 ) ) ( not ( = ?auto_315022 ?auto_315023 ) ) ( not ( = ?auto_315022 ?auto_315024 ) ) ( not ( = ?auto_315022 ?auto_315025 ) ) ( not ( = ?auto_315022 ?auto_315026 ) ) ( not ( = ?auto_315022 ?auto_315027 ) ) ( not ( = ?auto_315022 ?auto_315028 ) ) ( not ( = ?auto_315022 ?auto_315029 ) ) ( not ( = ?auto_315023 ?auto_315024 ) ) ( not ( = ?auto_315023 ?auto_315025 ) ) ( not ( = ?auto_315023 ?auto_315026 ) ) ( not ( = ?auto_315023 ?auto_315027 ) ) ( not ( = ?auto_315023 ?auto_315028 ) ) ( not ( = ?auto_315023 ?auto_315029 ) ) ( not ( = ?auto_315024 ?auto_315025 ) ) ( not ( = ?auto_315024 ?auto_315026 ) ) ( not ( = ?auto_315024 ?auto_315027 ) ) ( not ( = ?auto_315024 ?auto_315028 ) ) ( not ( = ?auto_315024 ?auto_315029 ) ) ( not ( = ?auto_315025 ?auto_315026 ) ) ( not ( = ?auto_315025 ?auto_315027 ) ) ( not ( = ?auto_315025 ?auto_315028 ) ) ( not ( = ?auto_315025 ?auto_315029 ) ) ( not ( = ?auto_315026 ?auto_315027 ) ) ( not ( = ?auto_315026 ?auto_315028 ) ) ( not ( = ?auto_315026 ?auto_315029 ) ) ( not ( = ?auto_315027 ?auto_315028 ) ) ( not ( = ?auto_315027 ?auto_315029 ) ) ( not ( = ?auto_315028 ?auto_315029 ) ) ( ON ?auto_315027 ?auto_315028 ) ( ON ?auto_315026 ?auto_315027 ) ( ON ?auto_315025 ?auto_315026 ) ( ON ?auto_315024 ?auto_315025 ) ( ON ?auto_315023 ?auto_315024 ) ( ON ?auto_315022 ?auto_315023 ) ( CLEAR ?auto_315020 ) ( ON ?auto_315021 ?auto_315022 ) ( CLEAR ?auto_315021 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_315019 ?auto_315020 ?auto_315021 )
      ( MAKE-10PILE ?auto_315019 ?auto_315020 ?auto_315021 ?auto_315022 ?auto_315023 ?auto_315024 ?auto_315025 ?auto_315026 ?auto_315027 ?auto_315028 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_315040 - BLOCK
      ?auto_315041 - BLOCK
      ?auto_315042 - BLOCK
      ?auto_315043 - BLOCK
      ?auto_315044 - BLOCK
      ?auto_315045 - BLOCK
      ?auto_315046 - BLOCK
      ?auto_315047 - BLOCK
      ?auto_315048 - BLOCK
      ?auto_315049 - BLOCK
    )
    :vars
    (
      ?auto_315050 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_315049 ?auto_315050 ) ( ON-TABLE ?auto_315040 ) ( ON ?auto_315041 ?auto_315040 ) ( not ( = ?auto_315040 ?auto_315041 ) ) ( not ( = ?auto_315040 ?auto_315042 ) ) ( not ( = ?auto_315040 ?auto_315043 ) ) ( not ( = ?auto_315040 ?auto_315044 ) ) ( not ( = ?auto_315040 ?auto_315045 ) ) ( not ( = ?auto_315040 ?auto_315046 ) ) ( not ( = ?auto_315040 ?auto_315047 ) ) ( not ( = ?auto_315040 ?auto_315048 ) ) ( not ( = ?auto_315040 ?auto_315049 ) ) ( not ( = ?auto_315040 ?auto_315050 ) ) ( not ( = ?auto_315041 ?auto_315042 ) ) ( not ( = ?auto_315041 ?auto_315043 ) ) ( not ( = ?auto_315041 ?auto_315044 ) ) ( not ( = ?auto_315041 ?auto_315045 ) ) ( not ( = ?auto_315041 ?auto_315046 ) ) ( not ( = ?auto_315041 ?auto_315047 ) ) ( not ( = ?auto_315041 ?auto_315048 ) ) ( not ( = ?auto_315041 ?auto_315049 ) ) ( not ( = ?auto_315041 ?auto_315050 ) ) ( not ( = ?auto_315042 ?auto_315043 ) ) ( not ( = ?auto_315042 ?auto_315044 ) ) ( not ( = ?auto_315042 ?auto_315045 ) ) ( not ( = ?auto_315042 ?auto_315046 ) ) ( not ( = ?auto_315042 ?auto_315047 ) ) ( not ( = ?auto_315042 ?auto_315048 ) ) ( not ( = ?auto_315042 ?auto_315049 ) ) ( not ( = ?auto_315042 ?auto_315050 ) ) ( not ( = ?auto_315043 ?auto_315044 ) ) ( not ( = ?auto_315043 ?auto_315045 ) ) ( not ( = ?auto_315043 ?auto_315046 ) ) ( not ( = ?auto_315043 ?auto_315047 ) ) ( not ( = ?auto_315043 ?auto_315048 ) ) ( not ( = ?auto_315043 ?auto_315049 ) ) ( not ( = ?auto_315043 ?auto_315050 ) ) ( not ( = ?auto_315044 ?auto_315045 ) ) ( not ( = ?auto_315044 ?auto_315046 ) ) ( not ( = ?auto_315044 ?auto_315047 ) ) ( not ( = ?auto_315044 ?auto_315048 ) ) ( not ( = ?auto_315044 ?auto_315049 ) ) ( not ( = ?auto_315044 ?auto_315050 ) ) ( not ( = ?auto_315045 ?auto_315046 ) ) ( not ( = ?auto_315045 ?auto_315047 ) ) ( not ( = ?auto_315045 ?auto_315048 ) ) ( not ( = ?auto_315045 ?auto_315049 ) ) ( not ( = ?auto_315045 ?auto_315050 ) ) ( not ( = ?auto_315046 ?auto_315047 ) ) ( not ( = ?auto_315046 ?auto_315048 ) ) ( not ( = ?auto_315046 ?auto_315049 ) ) ( not ( = ?auto_315046 ?auto_315050 ) ) ( not ( = ?auto_315047 ?auto_315048 ) ) ( not ( = ?auto_315047 ?auto_315049 ) ) ( not ( = ?auto_315047 ?auto_315050 ) ) ( not ( = ?auto_315048 ?auto_315049 ) ) ( not ( = ?auto_315048 ?auto_315050 ) ) ( not ( = ?auto_315049 ?auto_315050 ) ) ( ON ?auto_315048 ?auto_315049 ) ( ON ?auto_315047 ?auto_315048 ) ( ON ?auto_315046 ?auto_315047 ) ( ON ?auto_315045 ?auto_315046 ) ( ON ?auto_315044 ?auto_315045 ) ( ON ?auto_315043 ?auto_315044 ) ( CLEAR ?auto_315041 ) ( ON ?auto_315042 ?auto_315043 ) ( CLEAR ?auto_315042 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_315040 ?auto_315041 ?auto_315042 )
      ( MAKE-10PILE ?auto_315040 ?auto_315041 ?auto_315042 ?auto_315043 ?auto_315044 ?auto_315045 ?auto_315046 ?auto_315047 ?auto_315048 ?auto_315049 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_315061 - BLOCK
      ?auto_315062 - BLOCK
      ?auto_315063 - BLOCK
      ?auto_315064 - BLOCK
      ?auto_315065 - BLOCK
      ?auto_315066 - BLOCK
      ?auto_315067 - BLOCK
      ?auto_315068 - BLOCK
      ?auto_315069 - BLOCK
      ?auto_315070 - BLOCK
    )
    :vars
    (
      ?auto_315071 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_315070 ?auto_315071 ) ( ON-TABLE ?auto_315061 ) ( not ( = ?auto_315061 ?auto_315062 ) ) ( not ( = ?auto_315061 ?auto_315063 ) ) ( not ( = ?auto_315061 ?auto_315064 ) ) ( not ( = ?auto_315061 ?auto_315065 ) ) ( not ( = ?auto_315061 ?auto_315066 ) ) ( not ( = ?auto_315061 ?auto_315067 ) ) ( not ( = ?auto_315061 ?auto_315068 ) ) ( not ( = ?auto_315061 ?auto_315069 ) ) ( not ( = ?auto_315061 ?auto_315070 ) ) ( not ( = ?auto_315061 ?auto_315071 ) ) ( not ( = ?auto_315062 ?auto_315063 ) ) ( not ( = ?auto_315062 ?auto_315064 ) ) ( not ( = ?auto_315062 ?auto_315065 ) ) ( not ( = ?auto_315062 ?auto_315066 ) ) ( not ( = ?auto_315062 ?auto_315067 ) ) ( not ( = ?auto_315062 ?auto_315068 ) ) ( not ( = ?auto_315062 ?auto_315069 ) ) ( not ( = ?auto_315062 ?auto_315070 ) ) ( not ( = ?auto_315062 ?auto_315071 ) ) ( not ( = ?auto_315063 ?auto_315064 ) ) ( not ( = ?auto_315063 ?auto_315065 ) ) ( not ( = ?auto_315063 ?auto_315066 ) ) ( not ( = ?auto_315063 ?auto_315067 ) ) ( not ( = ?auto_315063 ?auto_315068 ) ) ( not ( = ?auto_315063 ?auto_315069 ) ) ( not ( = ?auto_315063 ?auto_315070 ) ) ( not ( = ?auto_315063 ?auto_315071 ) ) ( not ( = ?auto_315064 ?auto_315065 ) ) ( not ( = ?auto_315064 ?auto_315066 ) ) ( not ( = ?auto_315064 ?auto_315067 ) ) ( not ( = ?auto_315064 ?auto_315068 ) ) ( not ( = ?auto_315064 ?auto_315069 ) ) ( not ( = ?auto_315064 ?auto_315070 ) ) ( not ( = ?auto_315064 ?auto_315071 ) ) ( not ( = ?auto_315065 ?auto_315066 ) ) ( not ( = ?auto_315065 ?auto_315067 ) ) ( not ( = ?auto_315065 ?auto_315068 ) ) ( not ( = ?auto_315065 ?auto_315069 ) ) ( not ( = ?auto_315065 ?auto_315070 ) ) ( not ( = ?auto_315065 ?auto_315071 ) ) ( not ( = ?auto_315066 ?auto_315067 ) ) ( not ( = ?auto_315066 ?auto_315068 ) ) ( not ( = ?auto_315066 ?auto_315069 ) ) ( not ( = ?auto_315066 ?auto_315070 ) ) ( not ( = ?auto_315066 ?auto_315071 ) ) ( not ( = ?auto_315067 ?auto_315068 ) ) ( not ( = ?auto_315067 ?auto_315069 ) ) ( not ( = ?auto_315067 ?auto_315070 ) ) ( not ( = ?auto_315067 ?auto_315071 ) ) ( not ( = ?auto_315068 ?auto_315069 ) ) ( not ( = ?auto_315068 ?auto_315070 ) ) ( not ( = ?auto_315068 ?auto_315071 ) ) ( not ( = ?auto_315069 ?auto_315070 ) ) ( not ( = ?auto_315069 ?auto_315071 ) ) ( not ( = ?auto_315070 ?auto_315071 ) ) ( ON ?auto_315069 ?auto_315070 ) ( ON ?auto_315068 ?auto_315069 ) ( ON ?auto_315067 ?auto_315068 ) ( ON ?auto_315066 ?auto_315067 ) ( ON ?auto_315065 ?auto_315066 ) ( ON ?auto_315064 ?auto_315065 ) ( ON ?auto_315063 ?auto_315064 ) ( CLEAR ?auto_315061 ) ( ON ?auto_315062 ?auto_315063 ) ( CLEAR ?auto_315062 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_315061 ?auto_315062 )
      ( MAKE-10PILE ?auto_315061 ?auto_315062 ?auto_315063 ?auto_315064 ?auto_315065 ?auto_315066 ?auto_315067 ?auto_315068 ?auto_315069 ?auto_315070 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_315082 - BLOCK
      ?auto_315083 - BLOCK
      ?auto_315084 - BLOCK
      ?auto_315085 - BLOCK
      ?auto_315086 - BLOCK
      ?auto_315087 - BLOCK
      ?auto_315088 - BLOCK
      ?auto_315089 - BLOCK
      ?auto_315090 - BLOCK
      ?auto_315091 - BLOCK
    )
    :vars
    (
      ?auto_315092 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_315091 ?auto_315092 ) ( ON-TABLE ?auto_315082 ) ( not ( = ?auto_315082 ?auto_315083 ) ) ( not ( = ?auto_315082 ?auto_315084 ) ) ( not ( = ?auto_315082 ?auto_315085 ) ) ( not ( = ?auto_315082 ?auto_315086 ) ) ( not ( = ?auto_315082 ?auto_315087 ) ) ( not ( = ?auto_315082 ?auto_315088 ) ) ( not ( = ?auto_315082 ?auto_315089 ) ) ( not ( = ?auto_315082 ?auto_315090 ) ) ( not ( = ?auto_315082 ?auto_315091 ) ) ( not ( = ?auto_315082 ?auto_315092 ) ) ( not ( = ?auto_315083 ?auto_315084 ) ) ( not ( = ?auto_315083 ?auto_315085 ) ) ( not ( = ?auto_315083 ?auto_315086 ) ) ( not ( = ?auto_315083 ?auto_315087 ) ) ( not ( = ?auto_315083 ?auto_315088 ) ) ( not ( = ?auto_315083 ?auto_315089 ) ) ( not ( = ?auto_315083 ?auto_315090 ) ) ( not ( = ?auto_315083 ?auto_315091 ) ) ( not ( = ?auto_315083 ?auto_315092 ) ) ( not ( = ?auto_315084 ?auto_315085 ) ) ( not ( = ?auto_315084 ?auto_315086 ) ) ( not ( = ?auto_315084 ?auto_315087 ) ) ( not ( = ?auto_315084 ?auto_315088 ) ) ( not ( = ?auto_315084 ?auto_315089 ) ) ( not ( = ?auto_315084 ?auto_315090 ) ) ( not ( = ?auto_315084 ?auto_315091 ) ) ( not ( = ?auto_315084 ?auto_315092 ) ) ( not ( = ?auto_315085 ?auto_315086 ) ) ( not ( = ?auto_315085 ?auto_315087 ) ) ( not ( = ?auto_315085 ?auto_315088 ) ) ( not ( = ?auto_315085 ?auto_315089 ) ) ( not ( = ?auto_315085 ?auto_315090 ) ) ( not ( = ?auto_315085 ?auto_315091 ) ) ( not ( = ?auto_315085 ?auto_315092 ) ) ( not ( = ?auto_315086 ?auto_315087 ) ) ( not ( = ?auto_315086 ?auto_315088 ) ) ( not ( = ?auto_315086 ?auto_315089 ) ) ( not ( = ?auto_315086 ?auto_315090 ) ) ( not ( = ?auto_315086 ?auto_315091 ) ) ( not ( = ?auto_315086 ?auto_315092 ) ) ( not ( = ?auto_315087 ?auto_315088 ) ) ( not ( = ?auto_315087 ?auto_315089 ) ) ( not ( = ?auto_315087 ?auto_315090 ) ) ( not ( = ?auto_315087 ?auto_315091 ) ) ( not ( = ?auto_315087 ?auto_315092 ) ) ( not ( = ?auto_315088 ?auto_315089 ) ) ( not ( = ?auto_315088 ?auto_315090 ) ) ( not ( = ?auto_315088 ?auto_315091 ) ) ( not ( = ?auto_315088 ?auto_315092 ) ) ( not ( = ?auto_315089 ?auto_315090 ) ) ( not ( = ?auto_315089 ?auto_315091 ) ) ( not ( = ?auto_315089 ?auto_315092 ) ) ( not ( = ?auto_315090 ?auto_315091 ) ) ( not ( = ?auto_315090 ?auto_315092 ) ) ( not ( = ?auto_315091 ?auto_315092 ) ) ( ON ?auto_315090 ?auto_315091 ) ( ON ?auto_315089 ?auto_315090 ) ( ON ?auto_315088 ?auto_315089 ) ( ON ?auto_315087 ?auto_315088 ) ( ON ?auto_315086 ?auto_315087 ) ( ON ?auto_315085 ?auto_315086 ) ( ON ?auto_315084 ?auto_315085 ) ( CLEAR ?auto_315082 ) ( ON ?auto_315083 ?auto_315084 ) ( CLEAR ?auto_315083 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_315082 ?auto_315083 )
      ( MAKE-10PILE ?auto_315082 ?auto_315083 ?auto_315084 ?auto_315085 ?auto_315086 ?auto_315087 ?auto_315088 ?auto_315089 ?auto_315090 ?auto_315091 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_315103 - BLOCK
      ?auto_315104 - BLOCK
      ?auto_315105 - BLOCK
      ?auto_315106 - BLOCK
      ?auto_315107 - BLOCK
      ?auto_315108 - BLOCK
      ?auto_315109 - BLOCK
      ?auto_315110 - BLOCK
      ?auto_315111 - BLOCK
      ?auto_315112 - BLOCK
    )
    :vars
    (
      ?auto_315113 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_315112 ?auto_315113 ) ( not ( = ?auto_315103 ?auto_315104 ) ) ( not ( = ?auto_315103 ?auto_315105 ) ) ( not ( = ?auto_315103 ?auto_315106 ) ) ( not ( = ?auto_315103 ?auto_315107 ) ) ( not ( = ?auto_315103 ?auto_315108 ) ) ( not ( = ?auto_315103 ?auto_315109 ) ) ( not ( = ?auto_315103 ?auto_315110 ) ) ( not ( = ?auto_315103 ?auto_315111 ) ) ( not ( = ?auto_315103 ?auto_315112 ) ) ( not ( = ?auto_315103 ?auto_315113 ) ) ( not ( = ?auto_315104 ?auto_315105 ) ) ( not ( = ?auto_315104 ?auto_315106 ) ) ( not ( = ?auto_315104 ?auto_315107 ) ) ( not ( = ?auto_315104 ?auto_315108 ) ) ( not ( = ?auto_315104 ?auto_315109 ) ) ( not ( = ?auto_315104 ?auto_315110 ) ) ( not ( = ?auto_315104 ?auto_315111 ) ) ( not ( = ?auto_315104 ?auto_315112 ) ) ( not ( = ?auto_315104 ?auto_315113 ) ) ( not ( = ?auto_315105 ?auto_315106 ) ) ( not ( = ?auto_315105 ?auto_315107 ) ) ( not ( = ?auto_315105 ?auto_315108 ) ) ( not ( = ?auto_315105 ?auto_315109 ) ) ( not ( = ?auto_315105 ?auto_315110 ) ) ( not ( = ?auto_315105 ?auto_315111 ) ) ( not ( = ?auto_315105 ?auto_315112 ) ) ( not ( = ?auto_315105 ?auto_315113 ) ) ( not ( = ?auto_315106 ?auto_315107 ) ) ( not ( = ?auto_315106 ?auto_315108 ) ) ( not ( = ?auto_315106 ?auto_315109 ) ) ( not ( = ?auto_315106 ?auto_315110 ) ) ( not ( = ?auto_315106 ?auto_315111 ) ) ( not ( = ?auto_315106 ?auto_315112 ) ) ( not ( = ?auto_315106 ?auto_315113 ) ) ( not ( = ?auto_315107 ?auto_315108 ) ) ( not ( = ?auto_315107 ?auto_315109 ) ) ( not ( = ?auto_315107 ?auto_315110 ) ) ( not ( = ?auto_315107 ?auto_315111 ) ) ( not ( = ?auto_315107 ?auto_315112 ) ) ( not ( = ?auto_315107 ?auto_315113 ) ) ( not ( = ?auto_315108 ?auto_315109 ) ) ( not ( = ?auto_315108 ?auto_315110 ) ) ( not ( = ?auto_315108 ?auto_315111 ) ) ( not ( = ?auto_315108 ?auto_315112 ) ) ( not ( = ?auto_315108 ?auto_315113 ) ) ( not ( = ?auto_315109 ?auto_315110 ) ) ( not ( = ?auto_315109 ?auto_315111 ) ) ( not ( = ?auto_315109 ?auto_315112 ) ) ( not ( = ?auto_315109 ?auto_315113 ) ) ( not ( = ?auto_315110 ?auto_315111 ) ) ( not ( = ?auto_315110 ?auto_315112 ) ) ( not ( = ?auto_315110 ?auto_315113 ) ) ( not ( = ?auto_315111 ?auto_315112 ) ) ( not ( = ?auto_315111 ?auto_315113 ) ) ( not ( = ?auto_315112 ?auto_315113 ) ) ( ON ?auto_315111 ?auto_315112 ) ( ON ?auto_315110 ?auto_315111 ) ( ON ?auto_315109 ?auto_315110 ) ( ON ?auto_315108 ?auto_315109 ) ( ON ?auto_315107 ?auto_315108 ) ( ON ?auto_315106 ?auto_315107 ) ( ON ?auto_315105 ?auto_315106 ) ( ON ?auto_315104 ?auto_315105 ) ( ON ?auto_315103 ?auto_315104 ) ( CLEAR ?auto_315103 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_315103 )
      ( MAKE-10PILE ?auto_315103 ?auto_315104 ?auto_315105 ?auto_315106 ?auto_315107 ?auto_315108 ?auto_315109 ?auto_315110 ?auto_315111 ?auto_315112 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_315124 - BLOCK
      ?auto_315125 - BLOCK
      ?auto_315126 - BLOCK
      ?auto_315127 - BLOCK
      ?auto_315128 - BLOCK
      ?auto_315129 - BLOCK
      ?auto_315130 - BLOCK
      ?auto_315131 - BLOCK
      ?auto_315132 - BLOCK
      ?auto_315133 - BLOCK
    )
    :vars
    (
      ?auto_315134 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_315133 ?auto_315134 ) ( not ( = ?auto_315124 ?auto_315125 ) ) ( not ( = ?auto_315124 ?auto_315126 ) ) ( not ( = ?auto_315124 ?auto_315127 ) ) ( not ( = ?auto_315124 ?auto_315128 ) ) ( not ( = ?auto_315124 ?auto_315129 ) ) ( not ( = ?auto_315124 ?auto_315130 ) ) ( not ( = ?auto_315124 ?auto_315131 ) ) ( not ( = ?auto_315124 ?auto_315132 ) ) ( not ( = ?auto_315124 ?auto_315133 ) ) ( not ( = ?auto_315124 ?auto_315134 ) ) ( not ( = ?auto_315125 ?auto_315126 ) ) ( not ( = ?auto_315125 ?auto_315127 ) ) ( not ( = ?auto_315125 ?auto_315128 ) ) ( not ( = ?auto_315125 ?auto_315129 ) ) ( not ( = ?auto_315125 ?auto_315130 ) ) ( not ( = ?auto_315125 ?auto_315131 ) ) ( not ( = ?auto_315125 ?auto_315132 ) ) ( not ( = ?auto_315125 ?auto_315133 ) ) ( not ( = ?auto_315125 ?auto_315134 ) ) ( not ( = ?auto_315126 ?auto_315127 ) ) ( not ( = ?auto_315126 ?auto_315128 ) ) ( not ( = ?auto_315126 ?auto_315129 ) ) ( not ( = ?auto_315126 ?auto_315130 ) ) ( not ( = ?auto_315126 ?auto_315131 ) ) ( not ( = ?auto_315126 ?auto_315132 ) ) ( not ( = ?auto_315126 ?auto_315133 ) ) ( not ( = ?auto_315126 ?auto_315134 ) ) ( not ( = ?auto_315127 ?auto_315128 ) ) ( not ( = ?auto_315127 ?auto_315129 ) ) ( not ( = ?auto_315127 ?auto_315130 ) ) ( not ( = ?auto_315127 ?auto_315131 ) ) ( not ( = ?auto_315127 ?auto_315132 ) ) ( not ( = ?auto_315127 ?auto_315133 ) ) ( not ( = ?auto_315127 ?auto_315134 ) ) ( not ( = ?auto_315128 ?auto_315129 ) ) ( not ( = ?auto_315128 ?auto_315130 ) ) ( not ( = ?auto_315128 ?auto_315131 ) ) ( not ( = ?auto_315128 ?auto_315132 ) ) ( not ( = ?auto_315128 ?auto_315133 ) ) ( not ( = ?auto_315128 ?auto_315134 ) ) ( not ( = ?auto_315129 ?auto_315130 ) ) ( not ( = ?auto_315129 ?auto_315131 ) ) ( not ( = ?auto_315129 ?auto_315132 ) ) ( not ( = ?auto_315129 ?auto_315133 ) ) ( not ( = ?auto_315129 ?auto_315134 ) ) ( not ( = ?auto_315130 ?auto_315131 ) ) ( not ( = ?auto_315130 ?auto_315132 ) ) ( not ( = ?auto_315130 ?auto_315133 ) ) ( not ( = ?auto_315130 ?auto_315134 ) ) ( not ( = ?auto_315131 ?auto_315132 ) ) ( not ( = ?auto_315131 ?auto_315133 ) ) ( not ( = ?auto_315131 ?auto_315134 ) ) ( not ( = ?auto_315132 ?auto_315133 ) ) ( not ( = ?auto_315132 ?auto_315134 ) ) ( not ( = ?auto_315133 ?auto_315134 ) ) ( ON ?auto_315132 ?auto_315133 ) ( ON ?auto_315131 ?auto_315132 ) ( ON ?auto_315130 ?auto_315131 ) ( ON ?auto_315129 ?auto_315130 ) ( ON ?auto_315128 ?auto_315129 ) ( ON ?auto_315127 ?auto_315128 ) ( ON ?auto_315126 ?auto_315127 ) ( ON ?auto_315125 ?auto_315126 ) ( ON ?auto_315124 ?auto_315125 ) ( CLEAR ?auto_315124 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_315124 )
      ( MAKE-10PILE ?auto_315124 ?auto_315125 ?auto_315126 ?auto_315127 ?auto_315128 ?auto_315129 ?auto_315130 ?auto_315131 ?auto_315132 ?auto_315133 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_315146 - BLOCK
      ?auto_315147 - BLOCK
      ?auto_315148 - BLOCK
      ?auto_315149 - BLOCK
      ?auto_315150 - BLOCK
      ?auto_315151 - BLOCK
      ?auto_315152 - BLOCK
      ?auto_315153 - BLOCK
      ?auto_315154 - BLOCK
      ?auto_315155 - BLOCK
      ?auto_315156 - BLOCK
    )
    :vars
    (
      ?auto_315157 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_315155 ) ( ON ?auto_315156 ?auto_315157 ) ( CLEAR ?auto_315156 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_315146 ) ( ON ?auto_315147 ?auto_315146 ) ( ON ?auto_315148 ?auto_315147 ) ( ON ?auto_315149 ?auto_315148 ) ( ON ?auto_315150 ?auto_315149 ) ( ON ?auto_315151 ?auto_315150 ) ( ON ?auto_315152 ?auto_315151 ) ( ON ?auto_315153 ?auto_315152 ) ( ON ?auto_315154 ?auto_315153 ) ( ON ?auto_315155 ?auto_315154 ) ( not ( = ?auto_315146 ?auto_315147 ) ) ( not ( = ?auto_315146 ?auto_315148 ) ) ( not ( = ?auto_315146 ?auto_315149 ) ) ( not ( = ?auto_315146 ?auto_315150 ) ) ( not ( = ?auto_315146 ?auto_315151 ) ) ( not ( = ?auto_315146 ?auto_315152 ) ) ( not ( = ?auto_315146 ?auto_315153 ) ) ( not ( = ?auto_315146 ?auto_315154 ) ) ( not ( = ?auto_315146 ?auto_315155 ) ) ( not ( = ?auto_315146 ?auto_315156 ) ) ( not ( = ?auto_315146 ?auto_315157 ) ) ( not ( = ?auto_315147 ?auto_315148 ) ) ( not ( = ?auto_315147 ?auto_315149 ) ) ( not ( = ?auto_315147 ?auto_315150 ) ) ( not ( = ?auto_315147 ?auto_315151 ) ) ( not ( = ?auto_315147 ?auto_315152 ) ) ( not ( = ?auto_315147 ?auto_315153 ) ) ( not ( = ?auto_315147 ?auto_315154 ) ) ( not ( = ?auto_315147 ?auto_315155 ) ) ( not ( = ?auto_315147 ?auto_315156 ) ) ( not ( = ?auto_315147 ?auto_315157 ) ) ( not ( = ?auto_315148 ?auto_315149 ) ) ( not ( = ?auto_315148 ?auto_315150 ) ) ( not ( = ?auto_315148 ?auto_315151 ) ) ( not ( = ?auto_315148 ?auto_315152 ) ) ( not ( = ?auto_315148 ?auto_315153 ) ) ( not ( = ?auto_315148 ?auto_315154 ) ) ( not ( = ?auto_315148 ?auto_315155 ) ) ( not ( = ?auto_315148 ?auto_315156 ) ) ( not ( = ?auto_315148 ?auto_315157 ) ) ( not ( = ?auto_315149 ?auto_315150 ) ) ( not ( = ?auto_315149 ?auto_315151 ) ) ( not ( = ?auto_315149 ?auto_315152 ) ) ( not ( = ?auto_315149 ?auto_315153 ) ) ( not ( = ?auto_315149 ?auto_315154 ) ) ( not ( = ?auto_315149 ?auto_315155 ) ) ( not ( = ?auto_315149 ?auto_315156 ) ) ( not ( = ?auto_315149 ?auto_315157 ) ) ( not ( = ?auto_315150 ?auto_315151 ) ) ( not ( = ?auto_315150 ?auto_315152 ) ) ( not ( = ?auto_315150 ?auto_315153 ) ) ( not ( = ?auto_315150 ?auto_315154 ) ) ( not ( = ?auto_315150 ?auto_315155 ) ) ( not ( = ?auto_315150 ?auto_315156 ) ) ( not ( = ?auto_315150 ?auto_315157 ) ) ( not ( = ?auto_315151 ?auto_315152 ) ) ( not ( = ?auto_315151 ?auto_315153 ) ) ( not ( = ?auto_315151 ?auto_315154 ) ) ( not ( = ?auto_315151 ?auto_315155 ) ) ( not ( = ?auto_315151 ?auto_315156 ) ) ( not ( = ?auto_315151 ?auto_315157 ) ) ( not ( = ?auto_315152 ?auto_315153 ) ) ( not ( = ?auto_315152 ?auto_315154 ) ) ( not ( = ?auto_315152 ?auto_315155 ) ) ( not ( = ?auto_315152 ?auto_315156 ) ) ( not ( = ?auto_315152 ?auto_315157 ) ) ( not ( = ?auto_315153 ?auto_315154 ) ) ( not ( = ?auto_315153 ?auto_315155 ) ) ( not ( = ?auto_315153 ?auto_315156 ) ) ( not ( = ?auto_315153 ?auto_315157 ) ) ( not ( = ?auto_315154 ?auto_315155 ) ) ( not ( = ?auto_315154 ?auto_315156 ) ) ( not ( = ?auto_315154 ?auto_315157 ) ) ( not ( = ?auto_315155 ?auto_315156 ) ) ( not ( = ?auto_315155 ?auto_315157 ) ) ( not ( = ?auto_315156 ?auto_315157 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_315156 ?auto_315157 )
      ( !STACK ?auto_315156 ?auto_315155 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_315169 - BLOCK
      ?auto_315170 - BLOCK
      ?auto_315171 - BLOCK
      ?auto_315172 - BLOCK
      ?auto_315173 - BLOCK
      ?auto_315174 - BLOCK
      ?auto_315175 - BLOCK
      ?auto_315176 - BLOCK
      ?auto_315177 - BLOCK
      ?auto_315178 - BLOCK
      ?auto_315179 - BLOCK
    )
    :vars
    (
      ?auto_315180 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_315178 ) ( ON ?auto_315179 ?auto_315180 ) ( CLEAR ?auto_315179 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_315169 ) ( ON ?auto_315170 ?auto_315169 ) ( ON ?auto_315171 ?auto_315170 ) ( ON ?auto_315172 ?auto_315171 ) ( ON ?auto_315173 ?auto_315172 ) ( ON ?auto_315174 ?auto_315173 ) ( ON ?auto_315175 ?auto_315174 ) ( ON ?auto_315176 ?auto_315175 ) ( ON ?auto_315177 ?auto_315176 ) ( ON ?auto_315178 ?auto_315177 ) ( not ( = ?auto_315169 ?auto_315170 ) ) ( not ( = ?auto_315169 ?auto_315171 ) ) ( not ( = ?auto_315169 ?auto_315172 ) ) ( not ( = ?auto_315169 ?auto_315173 ) ) ( not ( = ?auto_315169 ?auto_315174 ) ) ( not ( = ?auto_315169 ?auto_315175 ) ) ( not ( = ?auto_315169 ?auto_315176 ) ) ( not ( = ?auto_315169 ?auto_315177 ) ) ( not ( = ?auto_315169 ?auto_315178 ) ) ( not ( = ?auto_315169 ?auto_315179 ) ) ( not ( = ?auto_315169 ?auto_315180 ) ) ( not ( = ?auto_315170 ?auto_315171 ) ) ( not ( = ?auto_315170 ?auto_315172 ) ) ( not ( = ?auto_315170 ?auto_315173 ) ) ( not ( = ?auto_315170 ?auto_315174 ) ) ( not ( = ?auto_315170 ?auto_315175 ) ) ( not ( = ?auto_315170 ?auto_315176 ) ) ( not ( = ?auto_315170 ?auto_315177 ) ) ( not ( = ?auto_315170 ?auto_315178 ) ) ( not ( = ?auto_315170 ?auto_315179 ) ) ( not ( = ?auto_315170 ?auto_315180 ) ) ( not ( = ?auto_315171 ?auto_315172 ) ) ( not ( = ?auto_315171 ?auto_315173 ) ) ( not ( = ?auto_315171 ?auto_315174 ) ) ( not ( = ?auto_315171 ?auto_315175 ) ) ( not ( = ?auto_315171 ?auto_315176 ) ) ( not ( = ?auto_315171 ?auto_315177 ) ) ( not ( = ?auto_315171 ?auto_315178 ) ) ( not ( = ?auto_315171 ?auto_315179 ) ) ( not ( = ?auto_315171 ?auto_315180 ) ) ( not ( = ?auto_315172 ?auto_315173 ) ) ( not ( = ?auto_315172 ?auto_315174 ) ) ( not ( = ?auto_315172 ?auto_315175 ) ) ( not ( = ?auto_315172 ?auto_315176 ) ) ( not ( = ?auto_315172 ?auto_315177 ) ) ( not ( = ?auto_315172 ?auto_315178 ) ) ( not ( = ?auto_315172 ?auto_315179 ) ) ( not ( = ?auto_315172 ?auto_315180 ) ) ( not ( = ?auto_315173 ?auto_315174 ) ) ( not ( = ?auto_315173 ?auto_315175 ) ) ( not ( = ?auto_315173 ?auto_315176 ) ) ( not ( = ?auto_315173 ?auto_315177 ) ) ( not ( = ?auto_315173 ?auto_315178 ) ) ( not ( = ?auto_315173 ?auto_315179 ) ) ( not ( = ?auto_315173 ?auto_315180 ) ) ( not ( = ?auto_315174 ?auto_315175 ) ) ( not ( = ?auto_315174 ?auto_315176 ) ) ( not ( = ?auto_315174 ?auto_315177 ) ) ( not ( = ?auto_315174 ?auto_315178 ) ) ( not ( = ?auto_315174 ?auto_315179 ) ) ( not ( = ?auto_315174 ?auto_315180 ) ) ( not ( = ?auto_315175 ?auto_315176 ) ) ( not ( = ?auto_315175 ?auto_315177 ) ) ( not ( = ?auto_315175 ?auto_315178 ) ) ( not ( = ?auto_315175 ?auto_315179 ) ) ( not ( = ?auto_315175 ?auto_315180 ) ) ( not ( = ?auto_315176 ?auto_315177 ) ) ( not ( = ?auto_315176 ?auto_315178 ) ) ( not ( = ?auto_315176 ?auto_315179 ) ) ( not ( = ?auto_315176 ?auto_315180 ) ) ( not ( = ?auto_315177 ?auto_315178 ) ) ( not ( = ?auto_315177 ?auto_315179 ) ) ( not ( = ?auto_315177 ?auto_315180 ) ) ( not ( = ?auto_315178 ?auto_315179 ) ) ( not ( = ?auto_315178 ?auto_315180 ) ) ( not ( = ?auto_315179 ?auto_315180 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_315179 ?auto_315180 )
      ( !STACK ?auto_315179 ?auto_315178 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_315192 - BLOCK
      ?auto_315193 - BLOCK
      ?auto_315194 - BLOCK
      ?auto_315195 - BLOCK
      ?auto_315196 - BLOCK
      ?auto_315197 - BLOCK
      ?auto_315198 - BLOCK
      ?auto_315199 - BLOCK
      ?auto_315200 - BLOCK
      ?auto_315201 - BLOCK
      ?auto_315202 - BLOCK
    )
    :vars
    (
      ?auto_315203 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_315202 ?auto_315203 ) ( ON-TABLE ?auto_315192 ) ( ON ?auto_315193 ?auto_315192 ) ( ON ?auto_315194 ?auto_315193 ) ( ON ?auto_315195 ?auto_315194 ) ( ON ?auto_315196 ?auto_315195 ) ( ON ?auto_315197 ?auto_315196 ) ( ON ?auto_315198 ?auto_315197 ) ( ON ?auto_315199 ?auto_315198 ) ( ON ?auto_315200 ?auto_315199 ) ( not ( = ?auto_315192 ?auto_315193 ) ) ( not ( = ?auto_315192 ?auto_315194 ) ) ( not ( = ?auto_315192 ?auto_315195 ) ) ( not ( = ?auto_315192 ?auto_315196 ) ) ( not ( = ?auto_315192 ?auto_315197 ) ) ( not ( = ?auto_315192 ?auto_315198 ) ) ( not ( = ?auto_315192 ?auto_315199 ) ) ( not ( = ?auto_315192 ?auto_315200 ) ) ( not ( = ?auto_315192 ?auto_315201 ) ) ( not ( = ?auto_315192 ?auto_315202 ) ) ( not ( = ?auto_315192 ?auto_315203 ) ) ( not ( = ?auto_315193 ?auto_315194 ) ) ( not ( = ?auto_315193 ?auto_315195 ) ) ( not ( = ?auto_315193 ?auto_315196 ) ) ( not ( = ?auto_315193 ?auto_315197 ) ) ( not ( = ?auto_315193 ?auto_315198 ) ) ( not ( = ?auto_315193 ?auto_315199 ) ) ( not ( = ?auto_315193 ?auto_315200 ) ) ( not ( = ?auto_315193 ?auto_315201 ) ) ( not ( = ?auto_315193 ?auto_315202 ) ) ( not ( = ?auto_315193 ?auto_315203 ) ) ( not ( = ?auto_315194 ?auto_315195 ) ) ( not ( = ?auto_315194 ?auto_315196 ) ) ( not ( = ?auto_315194 ?auto_315197 ) ) ( not ( = ?auto_315194 ?auto_315198 ) ) ( not ( = ?auto_315194 ?auto_315199 ) ) ( not ( = ?auto_315194 ?auto_315200 ) ) ( not ( = ?auto_315194 ?auto_315201 ) ) ( not ( = ?auto_315194 ?auto_315202 ) ) ( not ( = ?auto_315194 ?auto_315203 ) ) ( not ( = ?auto_315195 ?auto_315196 ) ) ( not ( = ?auto_315195 ?auto_315197 ) ) ( not ( = ?auto_315195 ?auto_315198 ) ) ( not ( = ?auto_315195 ?auto_315199 ) ) ( not ( = ?auto_315195 ?auto_315200 ) ) ( not ( = ?auto_315195 ?auto_315201 ) ) ( not ( = ?auto_315195 ?auto_315202 ) ) ( not ( = ?auto_315195 ?auto_315203 ) ) ( not ( = ?auto_315196 ?auto_315197 ) ) ( not ( = ?auto_315196 ?auto_315198 ) ) ( not ( = ?auto_315196 ?auto_315199 ) ) ( not ( = ?auto_315196 ?auto_315200 ) ) ( not ( = ?auto_315196 ?auto_315201 ) ) ( not ( = ?auto_315196 ?auto_315202 ) ) ( not ( = ?auto_315196 ?auto_315203 ) ) ( not ( = ?auto_315197 ?auto_315198 ) ) ( not ( = ?auto_315197 ?auto_315199 ) ) ( not ( = ?auto_315197 ?auto_315200 ) ) ( not ( = ?auto_315197 ?auto_315201 ) ) ( not ( = ?auto_315197 ?auto_315202 ) ) ( not ( = ?auto_315197 ?auto_315203 ) ) ( not ( = ?auto_315198 ?auto_315199 ) ) ( not ( = ?auto_315198 ?auto_315200 ) ) ( not ( = ?auto_315198 ?auto_315201 ) ) ( not ( = ?auto_315198 ?auto_315202 ) ) ( not ( = ?auto_315198 ?auto_315203 ) ) ( not ( = ?auto_315199 ?auto_315200 ) ) ( not ( = ?auto_315199 ?auto_315201 ) ) ( not ( = ?auto_315199 ?auto_315202 ) ) ( not ( = ?auto_315199 ?auto_315203 ) ) ( not ( = ?auto_315200 ?auto_315201 ) ) ( not ( = ?auto_315200 ?auto_315202 ) ) ( not ( = ?auto_315200 ?auto_315203 ) ) ( not ( = ?auto_315201 ?auto_315202 ) ) ( not ( = ?auto_315201 ?auto_315203 ) ) ( not ( = ?auto_315202 ?auto_315203 ) ) ( CLEAR ?auto_315200 ) ( ON ?auto_315201 ?auto_315202 ) ( CLEAR ?auto_315201 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_315192 ?auto_315193 ?auto_315194 ?auto_315195 ?auto_315196 ?auto_315197 ?auto_315198 ?auto_315199 ?auto_315200 ?auto_315201 )
      ( MAKE-11PILE ?auto_315192 ?auto_315193 ?auto_315194 ?auto_315195 ?auto_315196 ?auto_315197 ?auto_315198 ?auto_315199 ?auto_315200 ?auto_315201 ?auto_315202 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_315215 - BLOCK
      ?auto_315216 - BLOCK
      ?auto_315217 - BLOCK
      ?auto_315218 - BLOCK
      ?auto_315219 - BLOCK
      ?auto_315220 - BLOCK
      ?auto_315221 - BLOCK
      ?auto_315222 - BLOCK
      ?auto_315223 - BLOCK
      ?auto_315224 - BLOCK
      ?auto_315225 - BLOCK
    )
    :vars
    (
      ?auto_315226 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_315225 ?auto_315226 ) ( ON-TABLE ?auto_315215 ) ( ON ?auto_315216 ?auto_315215 ) ( ON ?auto_315217 ?auto_315216 ) ( ON ?auto_315218 ?auto_315217 ) ( ON ?auto_315219 ?auto_315218 ) ( ON ?auto_315220 ?auto_315219 ) ( ON ?auto_315221 ?auto_315220 ) ( ON ?auto_315222 ?auto_315221 ) ( ON ?auto_315223 ?auto_315222 ) ( not ( = ?auto_315215 ?auto_315216 ) ) ( not ( = ?auto_315215 ?auto_315217 ) ) ( not ( = ?auto_315215 ?auto_315218 ) ) ( not ( = ?auto_315215 ?auto_315219 ) ) ( not ( = ?auto_315215 ?auto_315220 ) ) ( not ( = ?auto_315215 ?auto_315221 ) ) ( not ( = ?auto_315215 ?auto_315222 ) ) ( not ( = ?auto_315215 ?auto_315223 ) ) ( not ( = ?auto_315215 ?auto_315224 ) ) ( not ( = ?auto_315215 ?auto_315225 ) ) ( not ( = ?auto_315215 ?auto_315226 ) ) ( not ( = ?auto_315216 ?auto_315217 ) ) ( not ( = ?auto_315216 ?auto_315218 ) ) ( not ( = ?auto_315216 ?auto_315219 ) ) ( not ( = ?auto_315216 ?auto_315220 ) ) ( not ( = ?auto_315216 ?auto_315221 ) ) ( not ( = ?auto_315216 ?auto_315222 ) ) ( not ( = ?auto_315216 ?auto_315223 ) ) ( not ( = ?auto_315216 ?auto_315224 ) ) ( not ( = ?auto_315216 ?auto_315225 ) ) ( not ( = ?auto_315216 ?auto_315226 ) ) ( not ( = ?auto_315217 ?auto_315218 ) ) ( not ( = ?auto_315217 ?auto_315219 ) ) ( not ( = ?auto_315217 ?auto_315220 ) ) ( not ( = ?auto_315217 ?auto_315221 ) ) ( not ( = ?auto_315217 ?auto_315222 ) ) ( not ( = ?auto_315217 ?auto_315223 ) ) ( not ( = ?auto_315217 ?auto_315224 ) ) ( not ( = ?auto_315217 ?auto_315225 ) ) ( not ( = ?auto_315217 ?auto_315226 ) ) ( not ( = ?auto_315218 ?auto_315219 ) ) ( not ( = ?auto_315218 ?auto_315220 ) ) ( not ( = ?auto_315218 ?auto_315221 ) ) ( not ( = ?auto_315218 ?auto_315222 ) ) ( not ( = ?auto_315218 ?auto_315223 ) ) ( not ( = ?auto_315218 ?auto_315224 ) ) ( not ( = ?auto_315218 ?auto_315225 ) ) ( not ( = ?auto_315218 ?auto_315226 ) ) ( not ( = ?auto_315219 ?auto_315220 ) ) ( not ( = ?auto_315219 ?auto_315221 ) ) ( not ( = ?auto_315219 ?auto_315222 ) ) ( not ( = ?auto_315219 ?auto_315223 ) ) ( not ( = ?auto_315219 ?auto_315224 ) ) ( not ( = ?auto_315219 ?auto_315225 ) ) ( not ( = ?auto_315219 ?auto_315226 ) ) ( not ( = ?auto_315220 ?auto_315221 ) ) ( not ( = ?auto_315220 ?auto_315222 ) ) ( not ( = ?auto_315220 ?auto_315223 ) ) ( not ( = ?auto_315220 ?auto_315224 ) ) ( not ( = ?auto_315220 ?auto_315225 ) ) ( not ( = ?auto_315220 ?auto_315226 ) ) ( not ( = ?auto_315221 ?auto_315222 ) ) ( not ( = ?auto_315221 ?auto_315223 ) ) ( not ( = ?auto_315221 ?auto_315224 ) ) ( not ( = ?auto_315221 ?auto_315225 ) ) ( not ( = ?auto_315221 ?auto_315226 ) ) ( not ( = ?auto_315222 ?auto_315223 ) ) ( not ( = ?auto_315222 ?auto_315224 ) ) ( not ( = ?auto_315222 ?auto_315225 ) ) ( not ( = ?auto_315222 ?auto_315226 ) ) ( not ( = ?auto_315223 ?auto_315224 ) ) ( not ( = ?auto_315223 ?auto_315225 ) ) ( not ( = ?auto_315223 ?auto_315226 ) ) ( not ( = ?auto_315224 ?auto_315225 ) ) ( not ( = ?auto_315224 ?auto_315226 ) ) ( not ( = ?auto_315225 ?auto_315226 ) ) ( CLEAR ?auto_315223 ) ( ON ?auto_315224 ?auto_315225 ) ( CLEAR ?auto_315224 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_315215 ?auto_315216 ?auto_315217 ?auto_315218 ?auto_315219 ?auto_315220 ?auto_315221 ?auto_315222 ?auto_315223 ?auto_315224 )
      ( MAKE-11PILE ?auto_315215 ?auto_315216 ?auto_315217 ?auto_315218 ?auto_315219 ?auto_315220 ?auto_315221 ?auto_315222 ?auto_315223 ?auto_315224 ?auto_315225 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_315238 - BLOCK
      ?auto_315239 - BLOCK
      ?auto_315240 - BLOCK
      ?auto_315241 - BLOCK
      ?auto_315242 - BLOCK
      ?auto_315243 - BLOCK
      ?auto_315244 - BLOCK
      ?auto_315245 - BLOCK
      ?auto_315246 - BLOCK
      ?auto_315247 - BLOCK
      ?auto_315248 - BLOCK
    )
    :vars
    (
      ?auto_315249 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_315248 ?auto_315249 ) ( ON-TABLE ?auto_315238 ) ( ON ?auto_315239 ?auto_315238 ) ( ON ?auto_315240 ?auto_315239 ) ( ON ?auto_315241 ?auto_315240 ) ( ON ?auto_315242 ?auto_315241 ) ( ON ?auto_315243 ?auto_315242 ) ( ON ?auto_315244 ?auto_315243 ) ( ON ?auto_315245 ?auto_315244 ) ( not ( = ?auto_315238 ?auto_315239 ) ) ( not ( = ?auto_315238 ?auto_315240 ) ) ( not ( = ?auto_315238 ?auto_315241 ) ) ( not ( = ?auto_315238 ?auto_315242 ) ) ( not ( = ?auto_315238 ?auto_315243 ) ) ( not ( = ?auto_315238 ?auto_315244 ) ) ( not ( = ?auto_315238 ?auto_315245 ) ) ( not ( = ?auto_315238 ?auto_315246 ) ) ( not ( = ?auto_315238 ?auto_315247 ) ) ( not ( = ?auto_315238 ?auto_315248 ) ) ( not ( = ?auto_315238 ?auto_315249 ) ) ( not ( = ?auto_315239 ?auto_315240 ) ) ( not ( = ?auto_315239 ?auto_315241 ) ) ( not ( = ?auto_315239 ?auto_315242 ) ) ( not ( = ?auto_315239 ?auto_315243 ) ) ( not ( = ?auto_315239 ?auto_315244 ) ) ( not ( = ?auto_315239 ?auto_315245 ) ) ( not ( = ?auto_315239 ?auto_315246 ) ) ( not ( = ?auto_315239 ?auto_315247 ) ) ( not ( = ?auto_315239 ?auto_315248 ) ) ( not ( = ?auto_315239 ?auto_315249 ) ) ( not ( = ?auto_315240 ?auto_315241 ) ) ( not ( = ?auto_315240 ?auto_315242 ) ) ( not ( = ?auto_315240 ?auto_315243 ) ) ( not ( = ?auto_315240 ?auto_315244 ) ) ( not ( = ?auto_315240 ?auto_315245 ) ) ( not ( = ?auto_315240 ?auto_315246 ) ) ( not ( = ?auto_315240 ?auto_315247 ) ) ( not ( = ?auto_315240 ?auto_315248 ) ) ( not ( = ?auto_315240 ?auto_315249 ) ) ( not ( = ?auto_315241 ?auto_315242 ) ) ( not ( = ?auto_315241 ?auto_315243 ) ) ( not ( = ?auto_315241 ?auto_315244 ) ) ( not ( = ?auto_315241 ?auto_315245 ) ) ( not ( = ?auto_315241 ?auto_315246 ) ) ( not ( = ?auto_315241 ?auto_315247 ) ) ( not ( = ?auto_315241 ?auto_315248 ) ) ( not ( = ?auto_315241 ?auto_315249 ) ) ( not ( = ?auto_315242 ?auto_315243 ) ) ( not ( = ?auto_315242 ?auto_315244 ) ) ( not ( = ?auto_315242 ?auto_315245 ) ) ( not ( = ?auto_315242 ?auto_315246 ) ) ( not ( = ?auto_315242 ?auto_315247 ) ) ( not ( = ?auto_315242 ?auto_315248 ) ) ( not ( = ?auto_315242 ?auto_315249 ) ) ( not ( = ?auto_315243 ?auto_315244 ) ) ( not ( = ?auto_315243 ?auto_315245 ) ) ( not ( = ?auto_315243 ?auto_315246 ) ) ( not ( = ?auto_315243 ?auto_315247 ) ) ( not ( = ?auto_315243 ?auto_315248 ) ) ( not ( = ?auto_315243 ?auto_315249 ) ) ( not ( = ?auto_315244 ?auto_315245 ) ) ( not ( = ?auto_315244 ?auto_315246 ) ) ( not ( = ?auto_315244 ?auto_315247 ) ) ( not ( = ?auto_315244 ?auto_315248 ) ) ( not ( = ?auto_315244 ?auto_315249 ) ) ( not ( = ?auto_315245 ?auto_315246 ) ) ( not ( = ?auto_315245 ?auto_315247 ) ) ( not ( = ?auto_315245 ?auto_315248 ) ) ( not ( = ?auto_315245 ?auto_315249 ) ) ( not ( = ?auto_315246 ?auto_315247 ) ) ( not ( = ?auto_315246 ?auto_315248 ) ) ( not ( = ?auto_315246 ?auto_315249 ) ) ( not ( = ?auto_315247 ?auto_315248 ) ) ( not ( = ?auto_315247 ?auto_315249 ) ) ( not ( = ?auto_315248 ?auto_315249 ) ) ( ON ?auto_315247 ?auto_315248 ) ( CLEAR ?auto_315245 ) ( ON ?auto_315246 ?auto_315247 ) ( CLEAR ?auto_315246 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_315238 ?auto_315239 ?auto_315240 ?auto_315241 ?auto_315242 ?auto_315243 ?auto_315244 ?auto_315245 ?auto_315246 )
      ( MAKE-11PILE ?auto_315238 ?auto_315239 ?auto_315240 ?auto_315241 ?auto_315242 ?auto_315243 ?auto_315244 ?auto_315245 ?auto_315246 ?auto_315247 ?auto_315248 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_315261 - BLOCK
      ?auto_315262 - BLOCK
      ?auto_315263 - BLOCK
      ?auto_315264 - BLOCK
      ?auto_315265 - BLOCK
      ?auto_315266 - BLOCK
      ?auto_315267 - BLOCK
      ?auto_315268 - BLOCK
      ?auto_315269 - BLOCK
      ?auto_315270 - BLOCK
      ?auto_315271 - BLOCK
    )
    :vars
    (
      ?auto_315272 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_315271 ?auto_315272 ) ( ON-TABLE ?auto_315261 ) ( ON ?auto_315262 ?auto_315261 ) ( ON ?auto_315263 ?auto_315262 ) ( ON ?auto_315264 ?auto_315263 ) ( ON ?auto_315265 ?auto_315264 ) ( ON ?auto_315266 ?auto_315265 ) ( ON ?auto_315267 ?auto_315266 ) ( ON ?auto_315268 ?auto_315267 ) ( not ( = ?auto_315261 ?auto_315262 ) ) ( not ( = ?auto_315261 ?auto_315263 ) ) ( not ( = ?auto_315261 ?auto_315264 ) ) ( not ( = ?auto_315261 ?auto_315265 ) ) ( not ( = ?auto_315261 ?auto_315266 ) ) ( not ( = ?auto_315261 ?auto_315267 ) ) ( not ( = ?auto_315261 ?auto_315268 ) ) ( not ( = ?auto_315261 ?auto_315269 ) ) ( not ( = ?auto_315261 ?auto_315270 ) ) ( not ( = ?auto_315261 ?auto_315271 ) ) ( not ( = ?auto_315261 ?auto_315272 ) ) ( not ( = ?auto_315262 ?auto_315263 ) ) ( not ( = ?auto_315262 ?auto_315264 ) ) ( not ( = ?auto_315262 ?auto_315265 ) ) ( not ( = ?auto_315262 ?auto_315266 ) ) ( not ( = ?auto_315262 ?auto_315267 ) ) ( not ( = ?auto_315262 ?auto_315268 ) ) ( not ( = ?auto_315262 ?auto_315269 ) ) ( not ( = ?auto_315262 ?auto_315270 ) ) ( not ( = ?auto_315262 ?auto_315271 ) ) ( not ( = ?auto_315262 ?auto_315272 ) ) ( not ( = ?auto_315263 ?auto_315264 ) ) ( not ( = ?auto_315263 ?auto_315265 ) ) ( not ( = ?auto_315263 ?auto_315266 ) ) ( not ( = ?auto_315263 ?auto_315267 ) ) ( not ( = ?auto_315263 ?auto_315268 ) ) ( not ( = ?auto_315263 ?auto_315269 ) ) ( not ( = ?auto_315263 ?auto_315270 ) ) ( not ( = ?auto_315263 ?auto_315271 ) ) ( not ( = ?auto_315263 ?auto_315272 ) ) ( not ( = ?auto_315264 ?auto_315265 ) ) ( not ( = ?auto_315264 ?auto_315266 ) ) ( not ( = ?auto_315264 ?auto_315267 ) ) ( not ( = ?auto_315264 ?auto_315268 ) ) ( not ( = ?auto_315264 ?auto_315269 ) ) ( not ( = ?auto_315264 ?auto_315270 ) ) ( not ( = ?auto_315264 ?auto_315271 ) ) ( not ( = ?auto_315264 ?auto_315272 ) ) ( not ( = ?auto_315265 ?auto_315266 ) ) ( not ( = ?auto_315265 ?auto_315267 ) ) ( not ( = ?auto_315265 ?auto_315268 ) ) ( not ( = ?auto_315265 ?auto_315269 ) ) ( not ( = ?auto_315265 ?auto_315270 ) ) ( not ( = ?auto_315265 ?auto_315271 ) ) ( not ( = ?auto_315265 ?auto_315272 ) ) ( not ( = ?auto_315266 ?auto_315267 ) ) ( not ( = ?auto_315266 ?auto_315268 ) ) ( not ( = ?auto_315266 ?auto_315269 ) ) ( not ( = ?auto_315266 ?auto_315270 ) ) ( not ( = ?auto_315266 ?auto_315271 ) ) ( not ( = ?auto_315266 ?auto_315272 ) ) ( not ( = ?auto_315267 ?auto_315268 ) ) ( not ( = ?auto_315267 ?auto_315269 ) ) ( not ( = ?auto_315267 ?auto_315270 ) ) ( not ( = ?auto_315267 ?auto_315271 ) ) ( not ( = ?auto_315267 ?auto_315272 ) ) ( not ( = ?auto_315268 ?auto_315269 ) ) ( not ( = ?auto_315268 ?auto_315270 ) ) ( not ( = ?auto_315268 ?auto_315271 ) ) ( not ( = ?auto_315268 ?auto_315272 ) ) ( not ( = ?auto_315269 ?auto_315270 ) ) ( not ( = ?auto_315269 ?auto_315271 ) ) ( not ( = ?auto_315269 ?auto_315272 ) ) ( not ( = ?auto_315270 ?auto_315271 ) ) ( not ( = ?auto_315270 ?auto_315272 ) ) ( not ( = ?auto_315271 ?auto_315272 ) ) ( ON ?auto_315270 ?auto_315271 ) ( CLEAR ?auto_315268 ) ( ON ?auto_315269 ?auto_315270 ) ( CLEAR ?auto_315269 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_315261 ?auto_315262 ?auto_315263 ?auto_315264 ?auto_315265 ?auto_315266 ?auto_315267 ?auto_315268 ?auto_315269 )
      ( MAKE-11PILE ?auto_315261 ?auto_315262 ?auto_315263 ?auto_315264 ?auto_315265 ?auto_315266 ?auto_315267 ?auto_315268 ?auto_315269 ?auto_315270 ?auto_315271 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_315284 - BLOCK
      ?auto_315285 - BLOCK
      ?auto_315286 - BLOCK
      ?auto_315287 - BLOCK
      ?auto_315288 - BLOCK
      ?auto_315289 - BLOCK
      ?auto_315290 - BLOCK
      ?auto_315291 - BLOCK
      ?auto_315292 - BLOCK
      ?auto_315293 - BLOCK
      ?auto_315294 - BLOCK
    )
    :vars
    (
      ?auto_315295 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_315294 ?auto_315295 ) ( ON-TABLE ?auto_315284 ) ( ON ?auto_315285 ?auto_315284 ) ( ON ?auto_315286 ?auto_315285 ) ( ON ?auto_315287 ?auto_315286 ) ( ON ?auto_315288 ?auto_315287 ) ( ON ?auto_315289 ?auto_315288 ) ( ON ?auto_315290 ?auto_315289 ) ( not ( = ?auto_315284 ?auto_315285 ) ) ( not ( = ?auto_315284 ?auto_315286 ) ) ( not ( = ?auto_315284 ?auto_315287 ) ) ( not ( = ?auto_315284 ?auto_315288 ) ) ( not ( = ?auto_315284 ?auto_315289 ) ) ( not ( = ?auto_315284 ?auto_315290 ) ) ( not ( = ?auto_315284 ?auto_315291 ) ) ( not ( = ?auto_315284 ?auto_315292 ) ) ( not ( = ?auto_315284 ?auto_315293 ) ) ( not ( = ?auto_315284 ?auto_315294 ) ) ( not ( = ?auto_315284 ?auto_315295 ) ) ( not ( = ?auto_315285 ?auto_315286 ) ) ( not ( = ?auto_315285 ?auto_315287 ) ) ( not ( = ?auto_315285 ?auto_315288 ) ) ( not ( = ?auto_315285 ?auto_315289 ) ) ( not ( = ?auto_315285 ?auto_315290 ) ) ( not ( = ?auto_315285 ?auto_315291 ) ) ( not ( = ?auto_315285 ?auto_315292 ) ) ( not ( = ?auto_315285 ?auto_315293 ) ) ( not ( = ?auto_315285 ?auto_315294 ) ) ( not ( = ?auto_315285 ?auto_315295 ) ) ( not ( = ?auto_315286 ?auto_315287 ) ) ( not ( = ?auto_315286 ?auto_315288 ) ) ( not ( = ?auto_315286 ?auto_315289 ) ) ( not ( = ?auto_315286 ?auto_315290 ) ) ( not ( = ?auto_315286 ?auto_315291 ) ) ( not ( = ?auto_315286 ?auto_315292 ) ) ( not ( = ?auto_315286 ?auto_315293 ) ) ( not ( = ?auto_315286 ?auto_315294 ) ) ( not ( = ?auto_315286 ?auto_315295 ) ) ( not ( = ?auto_315287 ?auto_315288 ) ) ( not ( = ?auto_315287 ?auto_315289 ) ) ( not ( = ?auto_315287 ?auto_315290 ) ) ( not ( = ?auto_315287 ?auto_315291 ) ) ( not ( = ?auto_315287 ?auto_315292 ) ) ( not ( = ?auto_315287 ?auto_315293 ) ) ( not ( = ?auto_315287 ?auto_315294 ) ) ( not ( = ?auto_315287 ?auto_315295 ) ) ( not ( = ?auto_315288 ?auto_315289 ) ) ( not ( = ?auto_315288 ?auto_315290 ) ) ( not ( = ?auto_315288 ?auto_315291 ) ) ( not ( = ?auto_315288 ?auto_315292 ) ) ( not ( = ?auto_315288 ?auto_315293 ) ) ( not ( = ?auto_315288 ?auto_315294 ) ) ( not ( = ?auto_315288 ?auto_315295 ) ) ( not ( = ?auto_315289 ?auto_315290 ) ) ( not ( = ?auto_315289 ?auto_315291 ) ) ( not ( = ?auto_315289 ?auto_315292 ) ) ( not ( = ?auto_315289 ?auto_315293 ) ) ( not ( = ?auto_315289 ?auto_315294 ) ) ( not ( = ?auto_315289 ?auto_315295 ) ) ( not ( = ?auto_315290 ?auto_315291 ) ) ( not ( = ?auto_315290 ?auto_315292 ) ) ( not ( = ?auto_315290 ?auto_315293 ) ) ( not ( = ?auto_315290 ?auto_315294 ) ) ( not ( = ?auto_315290 ?auto_315295 ) ) ( not ( = ?auto_315291 ?auto_315292 ) ) ( not ( = ?auto_315291 ?auto_315293 ) ) ( not ( = ?auto_315291 ?auto_315294 ) ) ( not ( = ?auto_315291 ?auto_315295 ) ) ( not ( = ?auto_315292 ?auto_315293 ) ) ( not ( = ?auto_315292 ?auto_315294 ) ) ( not ( = ?auto_315292 ?auto_315295 ) ) ( not ( = ?auto_315293 ?auto_315294 ) ) ( not ( = ?auto_315293 ?auto_315295 ) ) ( not ( = ?auto_315294 ?auto_315295 ) ) ( ON ?auto_315293 ?auto_315294 ) ( ON ?auto_315292 ?auto_315293 ) ( CLEAR ?auto_315290 ) ( ON ?auto_315291 ?auto_315292 ) ( CLEAR ?auto_315291 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_315284 ?auto_315285 ?auto_315286 ?auto_315287 ?auto_315288 ?auto_315289 ?auto_315290 ?auto_315291 )
      ( MAKE-11PILE ?auto_315284 ?auto_315285 ?auto_315286 ?auto_315287 ?auto_315288 ?auto_315289 ?auto_315290 ?auto_315291 ?auto_315292 ?auto_315293 ?auto_315294 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_315307 - BLOCK
      ?auto_315308 - BLOCK
      ?auto_315309 - BLOCK
      ?auto_315310 - BLOCK
      ?auto_315311 - BLOCK
      ?auto_315312 - BLOCK
      ?auto_315313 - BLOCK
      ?auto_315314 - BLOCK
      ?auto_315315 - BLOCK
      ?auto_315316 - BLOCK
      ?auto_315317 - BLOCK
    )
    :vars
    (
      ?auto_315318 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_315317 ?auto_315318 ) ( ON-TABLE ?auto_315307 ) ( ON ?auto_315308 ?auto_315307 ) ( ON ?auto_315309 ?auto_315308 ) ( ON ?auto_315310 ?auto_315309 ) ( ON ?auto_315311 ?auto_315310 ) ( ON ?auto_315312 ?auto_315311 ) ( ON ?auto_315313 ?auto_315312 ) ( not ( = ?auto_315307 ?auto_315308 ) ) ( not ( = ?auto_315307 ?auto_315309 ) ) ( not ( = ?auto_315307 ?auto_315310 ) ) ( not ( = ?auto_315307 ?auto_315311 ) ) ( not ( = ?auto_315307 ?auto_315312 ) ) ( not ( = ?auto_315307 ?auto_315313 ) ) ( not ( = ?auto_315307 ?auto_315314 ) ) ( not ( = ?auto_315307 ?auto_315315 ) ) ( not ( = ?auto_315307 ?auto_315316 ) ) ( not ( = ?auto_315307 ?auto_315317 ) ) ( not ( = ?auto_315307 ?auto_315318 ) ) ( not ( = ?auto_315308 ?auto_315309 ) ) ( not ( = ?auto_315308 ?auto_315310 ) ) ( not ( = ?auto_315308 ?auto_315311 ) ) ( not ( = ?auto_315308 ?auto_315312 ) ) ( not ( = ?auto_315308 ?auto_315313 ) ) ( not ( = ?auto_315308 ?auto_315314 ) ) ( not ( = ?auto_315308 ?auto_315315 ) ) ( not ( = ?auto_315308 ?auto_315316 ) ) ( not ( = ?auto_315308 ?auto_315317 ) ) ( not ( = ?auto_315308 ?auto_315318 ) ) ( not ( = ?auto_315309 ?auto_315310 ) ) ( not ( = ?auto_315309 ?auto_315311 ) ) ( not ( = ?auto_315309 ?auto_315312 ) ) ( not ( = ?auto_315309 ?auto_315313 ) ) ( not ( = ?auto_315309 ?auto_315314 ) ) ( not ( = ?auto_315309 ?auto_315315 ) ) ( not ( = ?auto_315309 ?auto_315316 ) ) ( not ( = ?auto_315309 ?auto_315317 ) ) ( not ( = ?auto_315309 ?auto_315318 ) ) ( not ( = ?auto_315310 ?auto_315311 ) ) ( not ( = ?auto_315310 ?auto_315312 ) ) ( not ( = ?auto_315310 ?auto_315313 ) ) ( not ( = ?auto_315310 ?auto_315314 ) ) ( not ( = ?auto_315310 ?auto_315315 ) ) ( not ( = ?auto_315310 ?auto_315316 ) ) ( not ( = ?auto_315310 ?auto_315317 ) ) ( not ( = ?auto_315310 ?auto_315318 ) ) ( not ( = ?auto_315311 ?auto_315312 ) ) ( not ( = ?auto_315311 ?auto_315313 ) ) ( not ( = ?auto_315311 ?auto_315314 ) ) ( not ( = ?auto_315311 ?auto_315315 ) ) ( not ( = ?auto_315311 ?auto_315316 ) ) ( not ( = ?auto_315311 ?auto_315317 ) ) ( not ( = ?auto_315311 ?auto_315318 ) ) ( not ( = ?auto_315312 ?auto_315313 ) ) ( not ( = ?auto_315312 ?auto_315314 ) ) ( not ( = ?auto_315312 ?auto_315315 ) ) ( not ( = ?auto_315312 ?auto_315316 ) ) ( not ( = ?auto_315312 ?auto_315317 ) ) ( not ( = ?auto_315312 ?auto_315318 ) ) ( not ( = ?auto_315313 ?auto_315314 ) ) ( not ( = ?auto_315313 ?auto_315315 ) ) ( not ( = ?auto_315313 ?auto_315316 ) ) ( not ( = ?auto_315313 ?auto_315317 ) ) ( not ( = ?auto_315313 ?auto_315318 ) ) ( not ( = ?auto_315314 ?auto_315315 ) ) ( not ( = ?auto_315314 ?auto_315316 ) ) ( not ( = ?auto_315314 ?auto_315317 ) ) ( not ( = ?auto_315314 ?auto_315318 ) ) ( not ( = ?auto_315315 ?auto_315316 ) ) ( not ( = ?auto_315315 ?auto_315317 ) ) ( not ( = ?auto_315315 ?auto_315318 ) ) ( not ( = ?auto_315316 ?auto_315317 ) ) ( not ( = ?auto_315316 ?auto_315318 ) ) ( not ( = ?auto_315317 ?auto_315318 ) ) ( ON ?auto_315316 ?auto_315317 ) ( ON ?auto_315315 ?auto_315316 ) ( CLEAR ?auto_315313 ) ( ON ?auto_315314 ?auto_315315 ) ( CLEAR ?auto_315314 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_315307 ?auto_315308 ?auto_315309 ?auto_315310 ?auto_315311 ?auto_315312 ?auto_315313 ?auto_315314 )
      ( MAKE-11PILE ?auto_315307 ?auto_315308 ?auto_315309 ?auto_315310 ?auto_315311 ?auto_315312 ?auto_315313 ?auto_315314 ?auto_315315 ?auto_315316 ?auto_315317 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_315330 - BLOCK
      ?auto_315331 - BLOCK
      ?auto_315332 - BLOCK
      ?auto_315333 - BLOCK
      ?auto_315334 - BLOCK
      ?auto_315335 - BLOCK
      ?auto_315336 - BLOCK
      ?auto_315337 - BLOCK
      ?auto_315338 - BLOCK
      ?auto_315339 - BLOCK
      ?auto_315340 - BLOCK
    )
    :vars
    (
      ?auto_315341 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_315340 ?auto_315341 ) ( ON-TABLE ?auto_315330 ) ( ON ?auto_315331 ?auto_315330 ) ( ON ?auto_315332 ?auto_315331 ) ( ON ?auto_315333 ?auto_315332 ) ( ON ?auto_315334 ?auto_315333 ) ( ON ?auto_315335 ?auto_315334 ) ( not ( = ?auto_315330 ?auto_315331 ) ) ( not ( = ?auto_315330 ?auto_315332 ) ) ( not ( = ?auto_315330 ?auto_315333 ) ) ( not ( = ?auto_315330 ?auto_315334 ) ) ( not ( = ?auto_315330 ?auto_315335 ) ) ( not ( = ?auto_315330 ?auto_315336 ) ) ( not ( = ?auto_315330 ?auto_315337 ) ) ( not ( = ?auto_315330 ?auto_315338 ) ) ( not ( = ?auto_315330 ?auto_315339 ) ) ( not ( = ?auto_315330 ?auto_315340 ) ) ( not ( = ?auto_315330 ?auto_315341 ) ) ( not ( = ?auto_315331 ?auto_315332 ) ) ( not ( = ?auto_315331 ?auto_315333 ) ) ( not ( = ?auto_315331 ?auto_315334 ) ) ( not ( = ?auto_315331 ?auto_315335 ) ) ( not ( = ?auto_315331 ?auto_315336 ) ) ( not ( = ?auto_315331 ?auto_315337 ) ) ( not ( = ?auto_315331 ?auto_315338 ) ) ( not ( = ?auto_315331 ?auto_315339 ) ) ( not ( = ?auto_315331 ?auto_315340 ) ) ( not ( = ?auto_315331 ?auto_315341 ) ) ( not ( = ?auto_315332 ?auto_315333 ) ) ( not ( = ?auto_315332 ?auto_315334 ) ) ( not ( = ?auto_315332 ?auto_315335 ) ) ( not ( = ?auto_315332 ?auto_315336 ) ) ( not ( = ?auto_315332 ?auto_315337 ) ) ( not ( = ?auto_315332 ?auto_315338 ) ) ( not ( = ?auto_315332 ?auto_315339 ) ) ( not ( = ?auto_315332 ?auto_315340 ) ) ( not ( = ?auto_315332 ?auto_315341 ) ) ( not ( = ?auto_315333 ?auto_315334 ) ) ( not ( = ?auto_315333 ?auto_315335 ) ) ( not ( = ?auto_315333 ?auto_315336 ) ) ( not ( = ?auto_315333 ?auto_315337 ) ) ( not ( = ?auto_315333 ?auto_315338 ) ) ( not ( = ?auto_315333 ?auto_315339 ) ) ( not ( = ?auto_315333 ?auto_315340 ) ) ( not ( = ?auto_315333 ?auto_315341 ) ) ( not ( = ?auto_315334 ?auto_315335 ) ) ( not ( = ?auto_315334 ?auto_315336 ) ) ( not ( = ?auto_315334 ?auto_315337 ) ) ( not ( = ?auto_315334 ?auto_315338 ) ) ( not ( = ?auto_315334 ?auto_315339 ) ) ( not ( = ?auto_315334 ?auto_315340 ) ) ( not ( = ?auto_315334 ?auto_315341 ) ) ( not ( = ?auto_315335 ?auto_315336 ) ) ( not ( = ?auto_315335 ?auto_315337 ) ) ( not ( = ?auto_315335 ?auto_315338 ) ) ( not ( = ?auto_315335 ?auto_315339 ) ) ( not ( = ?auto_315335 ?auto_315340 ) ) ( not ( = ?auto_315335 ?auto_315341 ) ) ( not ( = ?auto_315336 ?auto_315337 ) ) ( not ( = ?auto_315336 ?auto_315338 ) ) ( not ( = ?auto_315336 ?auto_315339 ) ) ( not ( = ?auto_315336 ?auto_315340 ) ) ( not ( = ?auto_315336 ?auto_315341 ) ) ( not ( = ?auto_315337 ?auto_315338 ) ) ( not ( = ?auto_315337 ?auto_315339 ) ) ( not ( = ?auto_315337 ?auto_315340 ) ) ( not ( = ?auto_315337 ?auto_315341 ) ) ( not ( = ?auto_315338 ?auto_315339 ) ) ( not ( = ?auto_315338 ?auto_315340 ) ) ( not ( = ?auto_315338 ?auto_315341 ) ) ( not ( = ?auto_315339 ?auto_315340 ) ) ( not ( = ?auto_315339 ?auto_315341 ) ) ( not ( = ?auto_315340 ?auto_315341 ) ) ( ON ?auto_315339 ?auto_315340 ) ( ON ?auto_315338 ?auto_315339 ) ( ON ?auto_315337 ?auto_315338 ) ( CLEAR ?auto_315335 ) ( ON ?auto_315336 ?auto_315337 ) ( CLEAR ?auto_315336 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_315330 ?auto_315331 ?auto_315332 ?auto_315333 ?auto_315334 ?auto_315335 ?auto_315336 )
      ( MAKE-11PILE ?auto_315330 ?auto_315331 ?auto_315332 ?auto_315333 ?auto_315334 ?auto_315335 ?auto_315336 ?auto_315337 ?auto_315338 ?auto_315339 ?auto_315340 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_315353 - BLOCK
      ?auto_315354 - BLOCK
      ?auto_315355 - BLOCK
      ?auto_315356 - BLOCK
      ?auto_315357 - BLOCK
      ?auto_315358 - BLOCK
      ?auto_315359 - BLOCK
      ?auto_315360 - BLOCK
      ?auto_315361 - BLOCK
      ?auto_315362 - BLOCK
      ?auto_315363 - BLOCK
    )
    :vars
    (
      ?auto_315364 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_315363 ?auto_315364 ) ( ON-TABLE ?auto_315353 ) ( ON ?auto_315354 ?auto_315353 ) ( ON ?auto_315355 ?auto_315354 ) ( ON ?auto_315356 ?auto_315355 ) ( ON ?auto_315357 ?auto_315356 ) ( ON ?auto_315358 ?auto_315357 ) ( not ( = ?auto_315353 ?auto_315354 ) ) ( not ( = ?auto_315353 ?auto_315355 ) ) ( not ( = ?auto_315353 ?auto_315356 ) ) ( not ( = ?auto_315353 ?auto_315357 ) ) ( not ( = ?auto_315353 ?auto_315358 ) ) ( not ( = ?auto_315353 ?auto_315359 ) ) ( not ( = ?auto_315353 ?auto_315360 ) ) ( not ( = ?auto_315353 ?auto_315361 ) ) ( not ( = ?auto_315353 ?auto_315362 ) ) ( not ( = ?auto_315353 ?auto_315363 ) ) ( not ( = ?auto_315353 ?auto_315364 ) ) ( not ( = ?auto_315354 ?auto_315355 ) ) ( not ( = ?auto_315354 ?auto_315356 ) ) ( not ( = ?auto_315354 ?auto_315357 ) ) ( not ( = ?auto_315354 ?auto_315358 ) ) ( not ( = ?auto_315354 ?auto_315359 ) ) ( not ( = ?auto_315354 ?auto_315360 ) ) ( not ( = ?auto_315354 ?auto_315361 ) ) ( not ( = ?auto_315354 ?auto_315362 ) ) ( not ( = ?auto_315354 ?auto_315363 ) ) ( not ( = ?auto_315354 ?auto_315364 ) ) ( not ( = ?auto_315355 ?auto_315356 ) ) ( not ( = ?auto_315355 ?auto_315357 ) ) ( not ( = ?auto_315355 ?auto_315358 ) ) ( not ( = ?auto_315355 ?auto_315359 ) ) ( not ( = ?auto_315355 ?auto_315360 ) ) ( not ( = ?auto_315355 ?auto_315361 ) ) ( not ( = ?auto_315355 ?auto_315362 ) ) ( not ( = ?auto_315355 ?auto_315363 ) ) ( not ( = ?auto_315355 ?auto_315364 ) ) ( not ( = ?auto_315356 ?auto_315357 ) ) ( not ( = ?auto_315356 ?auto_315358 ) ) ( not ( = ?auto_315356 ?auto_315359 ) ) ( not ( = ?auto_315356 ?auto_315360 ) ) ( not ( = ?auto_315356 ?auto_315361 ) ) ( not ( = ?auto_315356 ?auto_315362 ) ) ( not ( = ?auto_315356 ?auto_315363 ) ) ( not ( = ?auto_315356 ?auto_315364 ) ) ( not ( = ?auto_315357 ?auto_315358 ) ) ( not ( = ?auto_315357 ?auto_315359 ) ) ( not ( = ?auto_315357 ?auto_315360 ) ) ( not ( = ?auto_315357 ?auto_315361 ) ) ( not ( = ?auto_315357 ?auto_315362 ) ) ( not ( = ?auto_315357 ?auto_315363 ) ) ( not ( = ?auto_315357 ?auto_315364 ) ) ( not ( = ?auto_315358 ?auto_315359 ) ) ( not ( = ?auto_315358 ?auto_315360 ) ) ( not ( = ?auto_315358 ?auto_315361 ) ) ( not ( = ?auto_315358 ?auto_315362 ) ) ( not ( = ?auto_315358 ?auto_315363 ) ) ( not ( = ?auto_315358 ?auto_315364 ) ) ( not ( = ?auto_315359 ?auto_315360 ) ) ( not ( = ?auto_315359 ?auto_315361 ) ) ( not ( = ?auto_315359 ?auto_315362 ) ) ( not ( = ?auto_315359 ?auto_315363 ) ) ( not ( = ?auto_315359 ?auto_315364 ) ) ( not ( = ?auto_315360 ?auto_315361 ) ) ( not ( = ?auto_315360 ?auto_315362 ) ) ( not ( = ?auto_315360 ?auto_315363 ) ) ( not ( = ?auto_315360 ?auto_315364 ) ) ( not ( = ?auto_315361 ?auto_315362 ) ) ( not ( = ?auto_315361 ?auto_315363 ) ) ( not ( = ?auto_315361 ?auto_315364 ) ) ( not ( = ?auto_315362 ?auto_315363 ) ) ( not ( = ?auto_315362 ?auto_315364 ) ) ( not ( = ?auto_315363 ?auto_315364 ) ) ( ON ?auto_315362 ?auto_315363 ) ( ON ?auto_315361 ?auto_315362 ) ( ON ?auto_315360 ?auto_315361 ) ( CLEAR ?auto_315358 ) ( ON ?auto_315359 ?auto_315360 ) ( CLEAR ?auto_315359 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_315353 ?auto_315354 ?auto_315355 ?auto_315356 ?auto_315357 ?auto_315358 ?auto_315359 )
      ( MAKE-11PILE ?auto_315353 ?auto_315354 ?auto_315355 ?auto_315356 ?auto_315357 ?auto_315358 ?auto_315359 ?auto_315360 ?auto_315361 ?auto_315362 ?auto_315363 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_315376 - BLOCK
      ?auto_315377 - BLOCK
      ?auto_315378 - BLOCK
      ?auto_315379 - BLOCK
      ?auto_315380 - BLOCK
      ?auto_315381 - BLOCK
      ?auto_315382 - BLOCK
      ?auto_315383 - BLOCK
      ?auto_315384 - BLOCK
      ?auto_315385 - BLOCK
      ?auto_315386 - BLOCK
    )
    :vars
    (
      ?auto_315387 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_315386 ?auto_315387 ) ( ON-TABLE ?auto_315376 ) ( ON ?auto_315377 ?auto_315376 ) ( ON ?auto_315378 ?auto_315377 ) ( ON ?auto_315379 ?auto_315378 ) ( ON ?auto_315380 ?auto_315379 ) ( not ( = ?auto_315376 ?auto_315377 ) ) ( not ( = ?auto_315376 ?auto_315378 ) ) ( not ( = ?auto_315376 ?auto_315379 ) ) ( not ( = ?auto_315376 ?auto_315380 ) ) ( not ( = ?auto_315376 ?auto_315381 ) ) ( not ( = ?auto_315376 ?auto_315382 ) ) ( not ( = ?auto_315376 ?auto_315383 ) ) ( not ( = ?auto_315376 ?auto_315384 ) ) ( not ( = ?auto_315376 ?auto_315385 ) ) ( not ( = ?auto_315376 ?auto_315386 ) ) ( not ( = ?auto_315376 ?auto_315387 ) ) ( not ( = ?auto_315377 ?auto_315378 ) ) ( not ( = ?auto_315377 ?auto_315379 ) ) ( not ( = ?auto_315377 ?auto_315380 ) ) ( not ( = ?auto_315377 ?auto_315381 ) ) ( not ( = ?auto_315377 ?auto_315382 ) ) ( not ( = ?auto_315377 ?auto_315383 ) ) ( not ( = ?auto_315377 ?auto_315384 ) ) ( not ( = ?auto_315377 ?auto_315385 ) ) ( not ( = ?auto_315377 ?auto_315386 ) ) ( not ( = ?auto_315377 ?auto_315387 ) ) ( not ( = ?auto_315378 ?auto_315379 ) ) ( not ( = ?auto_315378 ?auto_315380 ) ) ( not ( = ?auto_315378 ?auto_315381 ) ) ( not ( = ?auto_315378 ?auto_315382 ) ) ( not ( = ?auto_315378 ?auto_315383 ) ) ( not ( = ?auto_315378 ?auto_315384 ) ) ( not ( = ?auto_315378 ?auto_315385 ) ) ( not ( = ?auto_315378 ?auto_315386 ) ) ( not ( = ?auto_315378 ?auto_315387 ) ) ( not ( = ?auto_315379 ?auto_315380 ) ) ( not ( = ?auto_315379 ?auto_315381 ) ) ( not ( = ?auto_315379 ?auto_315382 ) ) ( not ( = ?auto_315379 ?auto_315383 ) ) ( not ( = ?auto_315379 ?auto_315384 ) ) ( not ( = ?auto_315379 ?auto_315385 ) ) ( not ( = ?auto_315379 ?auto_315386 ) ) ( not ( = ?auto_315379 ?auto_315387 ) ) ( not ( = ?auto_315380 ?auto_315381 ) ) ( not ( = ?auto_315380 ?auto_315382 ) ) ( not ( = ?auto_315380 ?auto_315383 ) ) ( not ( = ?auto_315380 ?auto_315384 ) ) ( not ( = ?auto_315380 ?auto_315385 ) ) ( not ( = ?auto_315380 ?auto_315386 ) ) ( not ( = ?auto_315380 ?auto_315387 ) ) ( not ( = ?auto_315381 ?auto_315382 ) ) ( not ( = ?auto_315381 ?auto_315383 ) ) ( not ( = ?auto_315381 ?auto_315384 ) ) ( not ( = ?auto_315381 ?auto_315385 ) ) ( not ( = ?auto_315381 ?auto_315386 ) ) ( not ( = ?auto_315381 ?auto_315387 ) ) ( not ( = ?auto_315382 ?auto_315383 ) ) ( not ( = ?auto_315382 ?auto_315384 ) ) ( not ( = ?auto_315382 ?auto_315385 ) ) ( not ( = ?auto_315382 ?auto_315386 ) ) ( not ( = ?auto_315382 ?auto_315387 ) ) ( not ( = ?auto_315383 ?auto_315384 ) ) ( not ( = ?auto_315383 ?auto_315385 ) ) ( not ( = ?auto_315383 ?auto_315386 ) ) ( not ( = ?auto_315383 ?auto_315387 ) ) ( not ( = ?auto_315384 ?auto_315385 ) ) ( not ( = ?auto_315384 ?auto_315386 ) ) ( not ( = ?auto_315384 ?auto_315387 ) ) ( not ( = ?auto_315385 ?auto_315386 ) ) ( not ( = ?auto_315385 ?auto_315387 ) ) ( not ( = ?auto_315386 ?auto_315387 ) ) ( ON ?auto_315385 ?auto_315386 ) ( ON ?auto_315384 ?auto_315385 ) ( ON ?auto_315383 ?auto_315384 ) ( ON ?auto_315382 ?auto_315383 ) ( CLEAR ?auto_315380 ) ( ON ?auto_315381 ?auto_315382 ) ( CLEAR ?auto_315381 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_315376 ?auto_315377 ?auto_315378 ?auto_315379 ?auto_315380 ?auto_315381 )
      ( MAKE-11PILE ?auto_315376 ?auto_315377 ?auto_315378 ?auto_315379 ?auto_315380 ?auto_315381 ?auto_315382 ?auto_315383 ?auto_315384 ?auto_315385 ?auto_315386 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_315399 - BLOCK
      ?auto_315400 - BLOCK
      ?auto_315401 - BLOCK
      ?auto_315402 - BLOCK
      ?auto_315403 - BLOCK
      ?auto_315404 - BLOCK
      ?auto_315405 - BLOCK
      ?auto_315406 - BLOCK
      ?auto_315407 - BLOCK
      ?auto_315408 - BLOCK
      ?auto_315409 - BLOCK
    )
    :vars
    (
      ?auto_315410 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_315409 ?auto_315410 ) ( ON-TABLE ?auto_315399 ) ( ON ?auto_315400 ?auto_315399 ) ( ON ?auto_315401 ?auto_315400 ) ( ON ?auto_315402 ?auto_315401 ) ( ON ?auto_315403 ?auto_315402 ) ( not ( = ?auto_315399 ?auto_315400 ) ) ( not ( = ?auto_315399 ?auto_315401 ) ) ( not ( = ?auto_315399 ?auto_315402 ) ) ( not ( = ?auto_315399 ?auto_315403 ) ) ( not ( = ?auto_315399 ?auto_315404 ) ) ( not ( = ?auto_315399 ?auto_315405 ) ) ( not ( = ?auto_315399 ?auto_315406 ) ) ( not ( = ?auto_315399 ?auto_315407 ) ) ( not ( = ?auto_315399 ?auto_315408 ) ) ( not ( = ?auto_315399 ?auto_315409 ) ) ( not ( = ?auto_315399 ?auto_315410 ) ) ( not ( = ?auto_315400 ?auto_315401 ) ) ( not ( = ?auto_315400 ?auto_315402 ) ) ( not ( = ?auto_315400 ?auto_315403 ) ) ( not ( = ?auto_315400 ?auto_315404 ) ) ( not ( = ?auto_315400 ?auto_315405 ) ) ( not ( = ?auto_315400 ?auto_315406 ) ) ( not ( = ?auto_315400 ?auto_315407 ) ) ( not ( = ?auto_315400 ?auto_315408 ) ) ( not ( = ?auto_315400 ?auto_315409 ) ) ( not ( = ?auto_315400 ?auto_315410 ) ) ( not ( = ?auto_315401 ?auto_315402 ) ) ( not ( = ?auto_315401 ?auto_315403 ) ) ( not ( = ?auto_315401 ?auto_315404 ) ) ( not ( = ?auto_315401 ?auto_315405 ) ) ( not ( = ?auto_315401 ?auto_315406 ) ) ( not ( = ?auto_315401 ?auto_315407 ) ) ( not ( = ?auto_315401 ?auto_315408 ) ) ( not ( = ?auto_315401 ?auto_315409 ) ) ( not ( = ?auto_315401 ?auto_315410 ) ) ( not ( = ?auto_315402 ?auto_315403 ) ) ( not ( = ?auto_315402 ?auto_315404 ) ) ( not ( = ?auto_315402 ?auto_315405 ) ) ( not ( = ?auto_315402 ?auto_315406 ) ) ( not ( = ?auto_315402 ?auto_315407 ) ) ( not ( = ?auto_315402 ?auto_315408 ) ) ( not ( = ?auto_315402 ?auto_315409 ) ) ( not ( = ?auto_315402 ?auto_315410 ) ) ( not ( = ?auto_315403 ?auto_315404 ) ) ( not ( = ?auto_315403 ?auto_315405 ) ) ( not ( = ?auto_315403 ?auto_315406 ) ) ( not ( = ?auto_315403 ?auto_315407 ) ) ( not ( = ?auto_315403 ?auto_315408 ) ) ( not ( = ?auto_315403 ?auto_315409 ) ) ( not ( = ?auto_315403 ?auto_315410 ) ) ( not ( = ?auto_315404 ?auto_315405 ) ) ( not ( = ?auto_315404 ?auto_315406 ) ) ( not ( = ?auto_315404 ?auto_315407 ) ) ( not ( = ?auto_315404 ?auto_315408 ) ) ( not ( = ?auto_315404 ?auto_315409 ) ) ( not ( = ?auto_315404 ?auto_315410 ) ) ( not ( = ?auto_315405 ?auto_315406 ) ) ( not ( = ?auto_315405 ?auto_315407 ) ) ( not ( = ?auto_315405 ?auto_315408 ) ) ( not ( = ?auto_315405 ?auto_315409 ) ) ( not ( = ?auto_315405 ?auto_315410 ) ) ( not ( = ?auto_315406 ?auto_315407 ) ) ( not ( = ?auto_315406 ?auto_315408 ) ) ( not ( = ?auto_315406 ?auto_315409 ) ) ( not ( = ?auto_315406 ?auto_315410 ) ) ( not ( = ?auto_315407 ?auto_315408 ) ) ( not ( = ?auto_315407 ?auto_315409 ) ) ( not ( = ?auto_315407 ?auto_315410 ) ) ( not ( = ?auto_315408 ?auto_315409 ) ) ( not ( = ?auto_315408 ?auto_315410 ) ) ( not ( = ?auto_315409 ?auto_315410 ) ) ( ON ?auto_315408 ?auto_315409 ) ( ON ?auto_315407 ?auto_315408 ) ( ON ?auto_315406 ?auto_315407 ) ( ON ?auto_315405 ?auto_315406 ) ( CLEAR ?auto_315403 ) ( ON ?auto_315404 ?auto_315405 ) ( CLEAR ?auto_315404 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_315399 ?auto_315400 ?auto_315401 ?auto_315402 ?auto_315403 ?auto_315404 )
      ( MAKE-11PILE ?auto_315399 ?auto_315400 ?auto_315401 ?auto_315402 ?auto_315403 ?auto_315404 ?auto_315405 ?auto_315406 ?auto_315407 ?auto_315408 ?auto_315409 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_315422 - BLOCK
      ?auto_315423 - BLOCK
      ?auto_315424 - BLOCK
      ?auto_315425 - BLOCK
      ?auto_315426 - BLOCK
      ?auto_315427 - BLOCK
      ?auto_315428 - BLOCK
      ?auto_315429 - BLOCK
      ?auto_315430 - BLOCK
      ?auto_315431 - BLOCK
      ?auto_315432 - BLOCK
    )
    :vars
    (
      ?auto_315433 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_315432 ?auto_315433 ) ( ON-TABLE ?auto_315422 ) ( ON ?auto_315423 ?auto_315422 ) ( ON ?auto_315424 ?auto_315423 ) ( ON ?auto_315425 ?auto_315424 ) ( not ( = ?auto_315422 ?auto_315423 ) ) ( not ( = ?auto_315422 ?auto_315424 ) ) ( not ( = ?auto_315422 ?auto_315425 ) ) ( not ( = ?auto_315422 ?auto_315426 ) ) ( not ( = ?auto_315422 ?auto_315427 ) ) ( not ( = ?auto_315422 ?auto_315428 ) ) ( not ( = ?auto_315422 ?auto_315429 ) ) ( not ( = ?auto_315422 ?auto_315430 ) ) ( not ( = ?auto_315422 ?auto_315431 ) ) ( not ( = ?auto_315422 ?auto_315432 ) ) ( not ( = ?auto_315422 ?auto_315433 ) ) ( not ( = ?auto_315423 ?auto_315424 ) ) ( not ( = ?auto_315423 ?auto_315425 ) ) ( not ( = ?auto_315423 ?auto_315426 ) ) ( not ( = ?auto_315423 ?auto_315427 ) ) ( not ( = ?auto_315423 ?auto_315428 ) ) ( not ( = ?auto_315423 ?auto_315429 ) ) ( not ( = ?auto_315423 ?auto_315430 ) ) ( not ( = ?auto_315423 ?auto_315431 ) ) ( not ( = ?auto_315423 ?auto_315432 ) ) ( not ( = ?auto_315423 ?auto_315433 ) ) ( not ( = ?auto_315424 ?auto_315425 ) ) ( not ( = ?auto_315424 ?auto_315426 ) ) ( not ( = ?auto_315424 ?auto_315427 ) ) ( not ( = ?auto_315424 ?auto_315428 ) ) ( not ( = ?auto_315424 ?auto_315429 ) ) ( not ( = ?auto_315424 ?auto_315430 ) ) ( not ( = ?auto_315424 ?auto_315431 ) ) ( not ( = ?auto_315424 ?auto_315432 ) ) ( not ( = ?auto_315424 ?auto_315433 ) ) ( not ( = ?auto_315425 ?auto_315426 ) ) ( not ( = ?auto_315425 ?auto_315427 ) ) ( not ( = ?auto_315425 ?auto_315428 ) ) ( not ( = ?auto_315425 ?auto_315429 ) ) ( not ( = ?auto_315425 ?auto_315430 ) ) ( not ( = ?auto_315425 ?auto_315431 ) ) ( not ( = ?auto_315425 ?auto_315432 ) ) ( not ( = ?auto_315425 ?auto_315433 ) ) ( not ( = ?auto_315426 ?auto_315427 ) ) ( not ( = ?auto_315426 ?auto_315428 ) ) ( not ( = ?auto_315426 ?auto_315429 ) ) ( not ( = ?auto_315426 ?auto_315430 ) ) ( not ( = ?auto_315426 ?auto_315431 ) ) ( not ( = ?auto_315426 ?auto_315432 ) ) ( not ( = ?auto_315426 ?auto_315433 ) ) ( not ( = ?auto_315427 ?auto_315428 ) ) ( not ( = ?auto_315427 ?auto_315429 ) ) ( not ( = ?auto_315427 ?auto_315430 ) ) ( not ( = ?auto_315427 ?auto_315431 ) ) ( not ( = ?auto_315427 ?auto_315432 ) ) ( not ( = ?auto_315427 ?auto_315433 ) ) ( not ( = ?auto_315428 ?auto_315429 ) ) ( not ( = ?auto_315428 ?auto_315430 ) ) ( not ( = ?auto_315428 ?auto_315431 ) ) ( not ( = ?auto_315428 ?auto_315432 ) ) ( not ( = ?auto_315428 ?auto_315433 ) ) ( not ( = ?auto_315429 ?auto_315430 ) ) ( not ( = ?auto_315429 ?auto_315431 ) ) ( not ( = ?auto_315429 ?auto_315432 ) ) ( not ( = ?auto_315429 ?auto_315433 ) ) ( not ( = ?auto_315430 ?auto_315431 ) ) ( not ( = ?auto_315430 ?auto_315432 ) ) ( not ( = ?auto_315430 ?auto_315433 ) ) ( not ( = ?auto_315431 ?auto_315432 ) ) ( not ( = ?auto_315431 ?auto_315433 ) ) ( not ( = ?auto_315432 ?auto_315433 ) ) ( ON ?auto_315431 ?auto_315432 ) ( ON ?auto_315430 ?auto_315431 ) ( ON ?auto_315429 ?auto_315430 ) ( ON ?auto_315428 ?auto_315429 ) ( ON ?auto_315427 ?auto_315428 ) ( CLEAR ?auto_315425 ) ( ON ?auto_315426 ?auto_315427 ) ( CLEAR ?auto_315426 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_315422 ?auto_315423 ?auto_315424 ?auto_315425 ?auto_315426 )
      ( MAKE-11PILE ?auto_315422 ?auto_315423 ?auto_315424 ?auto_315425 ?auto_315426 ?auto_315427 ?auto_315428 ?auto_315429 ?auto_315430 ?auto_315431 ?auto_315432 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_315445 - BLOCK
      ?auto_315446 - BLOCK
      ?auto_315447 - BLOCK
      ?auto_315448 - BLOCK
      ?auto_315449 - BLOCK
      ?auto_315450 - BLOCK
      ?auto_315451 - BLOCK
      ?auto_315452 - BLOCK
      ?auto_315453 - BLOCK
      ?auto_315454 - BLOCK
      ?auto_315455 - BLOCK
    )
    :vars
    (
      ?auto_315456 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_315455 ?auto_315456 ) ( ON-TABLE ?auto_315445 ) ( ON ?auto_315446 ?auto_315445 ) ( ON ?auto_315447 ?auto_315446 ) ( ON ?auto_315448 ?auto_315447 ) ( not ( = ?auto_315445 ?auto_315446 ) ) ( not ( = ?auto_315445 ?auto_315447 ) ) ( not ( = ?auto_315445 ?auto_315448 ) ) ( not ( = ?auto_315445 ?auto_315449 ) ) ( not ( = ?auto_315445 ?auto_315450 ) ) ( not ( = ?auto_315445 ?auto_315451 ) ) ( not ( = ?auto_315445 ?auto_315452 ) ) ( not ( = ?auto_315445 ?auto_315453 ) ) ( not ( = ?auto_315445 ?auto_315454 ) ) ( not ( = ?auto_315445 ?auto_315455 ) ) ( not ( = ?auto_315445 ?auto_315456 ) ) ( not ( = ?auto_315446 ?auto_315447 ) ) ( not ( = ?auto_315446 ?auto_315448 ) ) ( not ( = ?auto_315446 ?auto_315449 ) ) ( not ( = ?auto_315446 ?auto_315450 ) ) ( not ( = ?auto_315446 ?auto_315451 ) ) ( not ( = ?auto_315446 ?auto_315452 ) ) ( not ( = ?auto_315446 ?auto_315453 ) ) ( not ( = ?auto_315446 ?auto_315454 ) ) ( not ( = ?auto_315446 ?auto_315455 ) ) ( not ( = ?auto_315446 ?auto_315456 ) ) ( not ( = ?auto_315447 ?auto_315448 ) ) ( not ( = ?auto_315447 ?auto_315449 ) ) ( not ( = ?auto_315447 ?auto_315450 ) ) ( not ( = ?auto_315447 ?auto_315451 ) ) ( not ( = ?auto_315447 ?auto_315452 ) ) ( not ( = ?auto_315447 ?auto_315453 ) ) ( not ( = ?auto_315447 ?auto_315454 ) ) ( not ( = ?auto_315447 ?auto_315455 ) ) ( not ( = ?auto_315447 ?auto_315456 ) ) ( not ( = ?auto_315448 ?auto_315449 ) ) ( not ( = ?auto_315448 ?auto_315450 ) ) ( not ( = ?auto_315448 ?auto_315451 ) ) ( not ( = ?auto_315448 ?auto_315452 ) ) ( not ( = ?auto_315448 ?auto_315453 ) ) ( not ( = ?auto_315448 ?auto_315454 ) ) ( not ( = ?auto_315448 ?auto_315455 ) ) ( not ( = ?auto_315448 ?auto_315456 ) ) ( not ( = ?auto_315449 ?auto_315450 ) ) ( not ( = ?auto_315449 ?auto_315451 ) ) ( not ( = ?auto_315449 ?auto_315452 ) ) ( not ( = ?auto_315449 ?auto_315453 ) ) ( not ( = ?auto_315449 ?auto_315454 ) ) ( not ( = ?auto_315449 ?auto_315455 ) ) ( not ( = ?auto_315449 ?auto_315456 ) ) ( not ( = ?auto_315450 ?auto_315451 ) ) ( not ( = ?auto_315450 ?auto_315452 ) ) ( not ( = ?auto_315450 ?auto_315453 ) ) ( not ( = ?auto_315450 ?auto_315454 ) ) ( not ( = ?auto_315450 ?auto_315455 ) ) ( not ( = ?auto_315450 ?auto_315456 ) ) ( not ( = ?auto_315451 ?auto_315452 ) ) ( not ( = ?auto_315451 ?auto_315453 ) ) ( not ( = ?auto_315451 ?auto_315454 ) ) ( not ( = ?auto_315451 ?auto_315455 ) ) ( not ( = ?auto_315451 ?auto_315456 ) ) ( not ( = ?auto_315452 ?auto_315453 ) ) ( not ( = ?auto_315452 ?auto_315454 ) ) ( not ( = ?auto_315452 ?auto_315455 ) ) ( not ( = ?auto_315452 ?auto_315456 ) ) ( not ( = ?auto_315453 ?auto_315454 ) ) ( not ( = ?auto_315453 ?auto_315455 ) ) ( not ( = ?auto_315453 ?auto_315456 ) ) ( not ( = ?auto_315454 ?auto_315455 ) ) ( not ( = ?auto_315454 ?auto_315456 ) ) ( not ( = ?auto_315455 ?auto_315456 ) ) ( ON ?auto_315454 ?auto_315455 ) ( ON ?auto_315453 ?auto_315454 ) ( ON ?auto_315452 ?auto_315453 ) ( ON ?auto_315451 ?auto_315452 ) ( ON ?auto_315450 ?auto_315451 ) ( CLEAR ?auto_315448 ) ( ON ?auto_315449 ?auto_315450 ) ( CLEAR ?auto_315449 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_315445 ?auto_315446 ?auto_315447 ?auto_315448 ?auto_315449 )
      ( MAKE-11PILE ?auto_315445 ?auto_315446 ?auto_315447 ?auto_315448 ?auto_315449 ?auto_315450 ?auto_315451 ?auto_315452 ?auto_315453 ?auto_315454 ?auto_315455 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_315468 - BLOCK
      ?auto_315469 - BLOCK
      ?auto_315470 - BLOCK
      ?auto_315471 - BLOCK
      ?auto_315472 - BLOCK
      ?auto_315473 - BLOCK
      ?auto_315474 - BLOCK
      ?auto_315475 - BLOCK
      ?auto_315476 - BLOCK
      ?auto_315477 - BLOCK
      ?auto_315478 - BLOCK
    )
    :vars
    (
      ?auto_315479 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_315478 ?auto_315479 ) ( ON-TABLE ?auto_315468 ) ( ON ?auto_315469 ?auto_315468 ) ( ON ?auto_315470 ?auto_315469 ) ( not ( = ?auto_315468 ?auto_315469 ) ) ( not ( = ?auto_315468 ?auto_315470 ) ) ( not ( = ?auto_315468 ?auto_315471 ) ) ( not ( = ?auto_315468 ?auto_315472 ) ) ( not ( = ?auto_315468 ?auto_315473 ) ) ( not ( = ?auto_315468 ?auto_315474 ) ) ( not ( = ?auto_315468 ?auto_315475 ) ) ( not ( = ?auto_315468 ?auto_315476 ) ) ( not ( = ?auto_315468 ?auto_315477 ) ) ( not ( = ?auto_315468 ?auto_315478 ) ) ( not ( = ?auto_315468 ?auto_315479 ) ) ( not ( = ?auto_315469 ?auto_315470 ) ) ( not ( = ?auto_315469 ?auto_315471 ) ) ( not ( = ?auto_315469 ?auto_315472 ) ) ( not ( = ?auto_315469 ?auto_315473 ) ) ( not ( = ?auto_315469 ?auto_315474 ) ) ( not ( = ?auto_315469 ?auto_315475 ) ) ( not ( = ?auto_315469 ?auto_315476 ) ) ( not ( = ?auto_315469 ?auto_315477 ) ) ( not ( = ?auto_315469 ?auto_315478 ) ) ( not ( = ?auto_315469 ?auto_315479 ) ) ( not ( = ?auto_315470 ?auto_315471 ) ) ( not ( = ?auto_315470 ?auto_315472 ) ) ( not ( = ?auto_315470 ?auto_315473 ) ) ( not ( = ?auto_315470 ?auto_315474 ) ) ( not ( = ?auto_315470 ?auto_315475 ) ) ( not ( = ?auto_315470 ?auto_315476 ) ) ( not ( = ?auto_315470 ?auto_315477 ) ) ( not ( = ?auto_315470 ?auto_315478 ) ) ( not ( = ?auto_315470 ?auto_315479 ) ) ( not ( = ?auto_315471 ?auto_315472 ) ) ( not ( = ?auto_315471 ?auto_315473 ) ) ( not ( = ?auto_315471 ?auto_315474 ) ) ( not ( = ?auto_315471 ?auto_315475 ) ) ( not ( = ?auto_315471 ?auto_315476 ) ) ( not ( = ?auto_315471 ?auto_315477 ) ) ( not ( = ?auto_315471 ?auto_315478 ) ) ( not ( = ?auto_315471 ?auto_315479 ) ) ( not ( = ?auto_315472 ?auto_315473 ) ) ( not ( = ?auto_315472 ?auto_315474 ) ) ( not ( = ?auto_315472 ?auto_315475 ) ) ( not ( = ?auto_315472 ?auto_315476 ) ) ( not ( = ?auto_315472 ?auto_315477 ) ) ( not ( = ?auto_315472 ?auto_315478 ) ) ( not ( = ?auto_315472 ?auto_315479 ) ) ( not ( = ?auto_315473 ?auto_315474 ) ) ( not ( = ?auto_315473 ?auto_315475 ) ) ( not ( = ?auto_315473 ?auto_315476 ) ) ( not ( = ?auto_315473 ?auto_315477 ) ) ( not ( = ?auto_315473 ?auto_315478 ) ) ( not ( = ?auto_315473 ?auto_315479 ) ) ( not ( = ?auto_315474 ?auto_315475 ) ) ( not ( = ?auto_315474 ?auto_315476 ) ) ( not ( = ?auto_315474 ?auto_315477 ) ) ( not ( = ?auto_315474 ?auto_315478 ) ) ( not ( = ?auto_315474 ?auto_315479 ) ) ( not ( = ?auto_315475 ?auto_315476 ) ) ( not ( = ?auto_315475 ?auto_315477 ) ) ( not ( = ?auto_315475 ?auto_315478 ) ) ( not ( = ?auto_315475 ?auto_315479 ) ) ( not ( = ?auto_315476 ?auto_315477 ) ) ( not ( = ?auto_315476 ?auto_315478 ) ) ( not ( = ?auto_315476 ?auto_315479 ) ) ( not ( = ?auto_315477 ?auto_315478 ) ) ( not ( = ?auto_315477 ?auto_315479 ) ) ( not ( = ?auto_315478 ?auto_315479 ) ) ( ON ?auto_315477 ?auto_315478 ) ( ON ?auto_315476 ?auto_315477 ) ( ON ?auto_315475 ?auto_315476 ) ( ON ?auto_315474 ?auto_315475 ) ( ON ?auto_315473 ?auto_315474 ) ( ON ?auto_315472 ?auto_315473 ) ( CLEAR ?auto_315470 ) ( ON ?auto_315471 ?auto_315472 ) ( CLEAR ?auto_315471 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_315468 ?auto_315469 ?auto_315470 ?auto_315471 )
      ( MAKE-11PILE ?auto_315468 ?auto_315469 ?auto_315470 ?auto_315471 ?auto_315472 ?auto_315473 ?auto_315474 ?auto_315475 ?auto_315476 ?auto_315477 ?auto_315478 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_315491 - BLOCK
      ?auto_315492 - BLOCK
      ?auto_315493 - BLOCK
      ?auto_315494 - BLOCK
      ?auto_315495 - BLOCK
      ?auto_315496 - BLOCK
      ?auto_315497 - BLOCK
      ?auto_315498 - BLOCK
      ?auto_315499 - BLOCK
      ?auto_315500 - BLOCK
      ?auto_315501 - BLOCK
    )
    :vars
    (
      ?auto_315502 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_315501 ?auto_315502 ) ( ON-TABLE ?auto_315491 ) ( ON ?auto_315492 ?auto_315491 ) ( ON ?auto_315493 ?auto_315492 ) ( not ( = ?auto_315491 ?auto_315492 ) ) ( not ( = ?auto_315491 ?auto_315493 ) ) ( not ( = ?auto_315491 ?auto_315494 ) ) ( not ( = ?auto_315491 ?auto_315495 ) ) ( not ( = ?auto_315491 ?auto_315496 ) ) ( not ( = ?auto_315491 ?auto_315497 ) ) ( not ( = ?auto_315491 ?auto_315498 ) ) ( not ( = ?auto_315491 ?auto_315499 ) ) ( not ( = ?auto_315491 ?auto_315500 ) ) ( not ( = ?auto_315491 ?auto_315501 ) ) ( not ( = ?auto_315491 ?auto_315502 ) ) ( not ( = ?auto_315492 ?auto_315493 ) ) ( not ( = ?auto_315492 ?auto_315494 ) ) ( not ( = ?auto_315492 ?auto_315495 ) ) ( not ( = ?auto_315492 ?auto_315496 ) ) ( not ( = ?auto_315492 ?auto_315497 ) ) ( not ( = ?auto_315492 ?auto_315498 ) ) ( not ( = ?auto_315492 ?auto_315499 ) ) ( not ( = ?auto_315492 ?auto_315500 ) ) ( not ( = ?auto_315492 ?auto_315501 ) ) ( not ( = ?auto_315492 ?auto_315502 ) ) ( not ( = ?auto_315493 ?auto_315494 ) ) ( not ( = ?auto_315493 ?auto_315495 ) ) ( not ( = ?auto_315493 ?auto_315496 ) ) ( not ( = ?auto_315493 ?auto_315497 ) ) ( not ( = ?auto_315493 ?auto_315498 ) ) ( not ( = ?auto_315493 ?auto_315499 ) ) ( not ( = ?auto_315493 ?auto_315500 ) ) ( not ( = ?auto_315493 ?auto_315501 ) ) ( not ( = ?auto_315493 ?auto_315502 ) ) ( not ( = ?auto_315494 ?auto_315495 ) ) ( not ( = ?auto_315494 ?auto_315496 ) ) ( not ( = ?auto_315494 ?auto_315497 ) ) ( not ( = ?auto_315494 ?auto_315498 ) ) ( not ( = ?auto_315494 ?auto_315499 ) ) ( not ( = ?auto_315494 ?auto_315500 ) ) ( not ( = ?auto_315494 ?auto_315501 ) ) ( not ( = ?auto_315494 ?auto_315502 ) ) ( not ( = ?auto_315495 ?auto_315496 ) ) ( not ( = ?auto_315495 ?auto_315497 ) ) ( not ( = ?auto_315495 ?auto_315498 ) ) ( not ( = ?auto_315495 ?auto_315499 ) ) ( not ( = ?auto_315495 ?auto_315500 ) ) ( not ( = ?auto_315495 ?auto_315501 ) ) ( not ( = ?auto_315495 ?auto_315502 ) ) ( not ( = ?auto_315496 ?auto_315497 ) ) ( not ( = ?auto_315496 ?auto_315498 ) ) ( not ( = ?auto_315496 ?auto_315499 ) ) ( not ( = ?auto_315496 ?auto_315500 ) ) ( not ( = ?auto_315496 ?auto_315501 ) ) ( not ( = ?auto_315496 ?auto_315502 ) ) ( not ( = ?auto_315497 ?auto_315498 ) ) ( not ( = ?auto_315497 ?auto_315499 ) ) ( not ( = ?auto_315497 ?auto_315500 ) ) ( not ( = ?auto_315497 ?auto_315501 ) ) ( not ( = ?auto_315497 ?auto_315502 ) ) ( not ( = ?auto_315498 ?auto_315499 ) ) ( not ( = ?auto_315498 ?auto_315500 ) ) ( not ( = ?auto_315498 ?auto_315501 ) ) ( not ( = ?auto_315498 ?auto_315502 ) ) ( not ( = ?auto_315499 ?auto_315500 ) ) ( not ( = ?auto_315499 ?auto_315501 ) ) ( not ( = ?auto_315499 ?auto_315502 ) ) ( not ( = ?auto_315500 ?auto_315501 ) ) ( not ( = ?auto_315500 ?auto_315502 ) ) ( not ( = ?auto_315501 ?auto_315502 ) ) ( ON ?auto_315500 ?auto_315501 ) ( ON ?auto_315499 ?auto_315500 ) ( ON ?auto_315498 ?auto_315499 ) ( ON ?auto_315497 ?auto_315498 ) ( ON ?auto_315496 ?auto_315497 ) ( ON ?auto_315495 ?auto_315496 ) ( CLEAR ?auto_315493 ) ( ON ?auto_315494 ?auto_315495 ) ( CLEAR ?auto_315494 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_315491 ?auto_315492 ?auto_315493 ?auto_315494 )
      ( MAKE-11PILE ?auto_315491 ?auto_315492 ?auto_315493 ?auto_315494 ?auto_315495 ?auto_315496 ?auto_315497 ?auto_315498 ?auto_315499 ?auto_315500 ?auto_315501 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_315514 - BLOCK
      ?auto_315515 - BLOCK
      ?auto_315516 - BLOCK
      ?auto_315517 - BLOCK
      ?auto_315518 - BLOCK
      ?auto_315519 - BLOCK
      ?auto_315520 - BLOCK
      ?auto_315521 - BLOCK
      ?auto_315522 - BLOCK
      ?auto_315523 - BLOCK
      ?auto_315524 - BLOCK
    )
    :vars
    (
      ?auto_315525 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_315524 ?auto_315525 ) ( ON-TABLE ?auto_315514 ) ( ON ?auto_315515 ?auto_315514 ) ( not ( = ?auto_315514 ?auto_315515 ) ) ( not ( = ?auto_315514 ?auto_315516 ) ) ( not ( = ?auto_315514 ?auto_315517 ) ) ( not ( = ?auto_315514 ?auto_315518 ) ) ( not ( = ?auto_315514 ?auto_315519 ) ) ( not ( = ?auto_315514 ?auto_315520 ) ) ( not ( = ?auto_315514 ?auto_315521 ) ) ( not ( = ?auto_315514 ?auto_315522 ) ) ( not ( = ?auto_315514 ?auto_315523 ) ) ( not ( = ?auto_315514 ?auto_315524 ) ) ( not ( = ?auto_315514 ?auto_315525 ) ) ( not ( = ?auto_315515 ?auto_315516 ) ) ( not ( = ?auto_315515 ?auto_315517 ) ) ( not ( = ?auto_315515 ?auto_315518 ) ) ( not ( = ?auto_315515 ?auto_315519 ) ) ( not ( = ?auto_315515 ?auto_315520 ) ) ( not ( = ?auto_315515 ?auto_315521 ) ) ( not ( = ?auto_315515 ?auto_315522 ) ) ( not ( = ?auto_315515 ?auto_315523 ) ) ( not ( = ?auto_315515 ?auto_315524 ) ) ( not ( = ?auto_315515 ?auto_315525 ) ) ( not ( = ?auto_315516 ?auto_315517 ) ) ( not ( = ?auto_315516 ?auto_315518 ) ) ( not ( = ?auto_315516 ?auto_315519 ) ) ( not ( = ?auto_315516 ?auto_315520 ) ) ( not ( = ?auto_315516 ?auto_315521 ) ) ( not ( = ?auto_315516 ?auto_315522 ) ) ( not ( = ?auto_315516 ?auto_315523 ) ) ( not ( = ?auto_315516 ?auto_315524 ) ) ( not ( = ?auto_315516 ?auto_315525 ) ) ( not ( = ?auto_315517 ?auto_315518 ) ) ( not ( = ?auto_315517 ?auto_315519 ) ) ( not ( = ?auto_315517 ?auto_315520 ) ) ( not ( = ?auto_315517 ?auto_315521 ) ) ( not ( = ?auto_315517 ?auto_315522 ) ) ( not ( = ?auto_315517 ?auto_315523 ) ) ( not ( = ?auto_315517 ?auto_315524 ) ) ( not ( = ?auto_315517 ?auto_315525 ) ) ( not ( = ?auto_315518 ?auto_315519 ) ) ( not ( = ?auto_315518 ?auto_315520 ) ) ( not ( = ?auto_315518 ?auto_315521 ) ) ( not ( = ?auto_315518 ?auto_315522 ) ) ( not ( = ?auto_315518 ?auto_315523 ) ) ( not ( = ?auto_315518 ?auto_315524 ) ) ( not ( = ?auto_315518 ?auto_315525 ) ) ( not ( = ?auto_315519 ?auto_315520 ) ) ( not ( = ?auto_315519 ?auto_315521 ) ) ( not ( = ?auto_315519 ?auto_315522 ) ) ( not ( = ?auto_315519 ?auto_315523 ) ) ( not ( = ?auto_315519 ?auto_315524 ) ) ( not ( = ?auto_315519 ?auto_315525 ) ) ( not ( = ?auto_315520 ?auto_315521 ) ) ( not ( = ?auto_315520 ?auto_315522 ) ) ( not ( = ?auto_315520 ?auto_315523 ) ) ( not ( = ?auto_315520 ?auto_315524 ) ) ( not ( = ?auto_315520 ?auto_315525 ) ) ( not ( = ?auto_315521 ?auto_315522 ) ) ( not ( = ?auto_315521 ?auto_315523 ) ) ( not ( = ?auto_315521 ?auto_315524 ) ) ( not ( = ?auto_315521 ?auto_315525 ) ) ( not ( = ?auto_315522 ?auto_315523 ) ) ( not ( = ?auto_315522 ?auto_315524 ) ) ( not ( = ?auto_315522 ?auto_315525 ) ) ( not ( = ?auto_315523 ?auto_315524 ) ) ( not ( = ?auto_315523 ?auto_315525 ) ) ( not ( = ?auto_315524 ?auto_315525 ) ) ( ON ?auto_315523 ?auto_315524 ) ( ON ?auto_315522 ?auto_315523 ) ( ON ?auto_315521 ?auto_315522 ) ( ON ?auto_315520 ?auto_315521 ) ( ON ?auto_315519 ?auto_315520 ) ( ON ?auto_315518 ?auto_315519 ) ( ON ?auto_315517 ?auto_315518 ) ( CLEAR ?auto_315515 ) ( ON ?auto_315516 ?auto_315517 ) ( CLEAR ?auto_315516 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_315514 ?auto_315515 ?auto_315516 )
      ( MAKE-11PILE ?auto_315514 ?auto_315515 ?auto_315516 ?auto_315517 ?auto_315518 ?auto_315519 ?auto_315520 ?auto_315521 ?auto_315522 ?auto_315523 ?auto_315524 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_315537 - BLOCK
      ?auto_315538 - BLOCK
      ?auto_315539 - BLOCK
      ?auto_315540 - BLOCK
      ?auto_315541 - BLOCK
      ?auto_315542 - BLOCK
      ?auto_315543 - BLOCK
      ?auto_315544 - BLOCK
      ?auto_315545 - BLOCK
      ?auto_315546 - BLOCK
      ?auto_315547 - BLOCK
    )
    :vars
    (
      ?auto_315548 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_315547 ?auto_315548 ) ( ON-TABLE ?auto_315537 ) ( ON ?auto_315538 ?auto_315537 ) ( not ( = ?auto_315537 ?auto_315538 ) ) ( not ( = ?auto_315537 ?auto_315539 ) ) ( not ( = ?auto_315537 ?auto_315540 ) ) ( not ( = ?auto_315537 ?auto_315541 ) ) ( not ( = ?auto_315537 ?auto_315542 ) ) ( not ( = ?auto_315537 ?auto_315543 ) ) ( not ( = ?auto_315537 ?auto_315544 ) ) ( not ( = ?auto_315537 ?auto_315545 ) ) ( not ( = ?auto_315537 ?auto_315546 ) ) ( not ( = ?auto_315537 ?auto_315547 ) ) ( not ( = ?auto_315537 ?auto_315548 ) ) ( not ( = ?auto_315538 ?auto_315539 ) ) ( not ( = ?auto_315538 ?auto_315540 ) ) ( not ( = ?auto_315538 ?auto_315541 ) ) ( not ( = ?auto_315538 ?auto_315542 ) ) ( not ( = ?auto_315538 ?auto_315543 ) ) ( not ( = ?auto_315538 ?auto_315544 ) ) ( not ( = ?auto_315538 ?auto_315545 ) ) ( not ( = ?auto_315538 ?auto_315546 ) ) ( not ( = ?auto_315538 ?auto_315547 ) ) ( not ( = ?auto_315538 ?auto_315548 ) ) ( not ( = ?auto_315539 ?auto_315540 ) ) ( not ( = ?auto_315539 ?auto_315541 ) ) ( not ( = ?auto_315539 ?auto_315542 ) ) ( not ( = ?auto_315539 ?auto_315543 ) ) ( not ( = ?auto_315539 ?auto_315544 ) ) ( not ( = ?auto_315539 ?auto_315545 ) ) ( not ( = ?auto_315539 ?auto_315546 ) ) ( not ( = ?auto_315539 ?auto_315547 ) ) ( not ( = ?auto_315539 ?auto_315548 ) ) ( not ( = ?auto_315540 ?auto_315541 ) ) ( not ( = ?auto_315540 ?auto_315542 ) ) ( not ( = ?auto_315540 ?auto_315543 ) ) ( not ( = ?auto_315540 ?auto_315544 ) ) ( not ( = ?auto_315540 ?auto_315545 ) ) ( not ( = ?auto_315540 ?auto_315546 ) ) ( not ( = ?auto_315540 ?auto_315547 ) ) ( not ( = ?auto_315540 ?auto_315548 ) ) ( not ( = ?auto_315541 ?auto_315542 ) ) ( not ( = ?auto_315541 ?auto_315543 ) ) ( not ( = ?auto_315541 ?auto_315544 ) ) ( not ( = ?auto_315541 ?auto_315545 ) ) ( not ( = ?auto_315541 ?auto_315546 ) ) ( not ( = ?auto_315541 ?auto_315547 ) ) ( not ( = ?auto_315541 ?auto_315548 ) ) ( not ( = ?auto_315542 ?auto_315543 ) ) ( not ( = ?auto_315542 ?auto_315544 ) ) ( not ( = ?auto_315542 ?auto_315545 ) ) ( not ( = ?auto_315542 ?auto_315546 ) ) ( not ( = ?auto_315542 ?auto_315547 ) ) ( not ( = ?auto_315542 ?auto_315548 ) ) ( not ( = ?auto_315543 ?auto_315544 ) ) ( not ( = ?auto_315543 ?auto_315545 ) ) ( not ( = ?auto_315543 ?auto_315546 ) ) ( not ( = ?auto_315543 ?auto_315547 ) ) ( not ( = ?auto_315543 ?auto_315548 ) ) ( not ( = ?auto_315544 ?auto_315545 ) ) ( not ( = ?auto_315544 ?auto_315546 ) ) ( not ( = ?auto_315544 ?auto_315547 ) ) ( not ( = ?auto_315544 ?auto_315548 ) ) ( not ( = ?auto_315545 ?auto_315546 ) ) ( not ( = ?auto_315545 ?auto_315547 ) ) ( not ( = ?auto_315545 ?auto_315548 ) ) ( not ( = ?auto_315546 ?auto_315547 ) ) ( not ( = ?auto_315546 ?auto_315548 ) ) ( not ( = ?auto_315547 ?auto_315548 ) ) ( ON ?auto_315546 ?auto_315547 ) ( ON ?auto_315545 ?auto_315546 ) ( ON ?auto_315544 ?auto_315545 ) ( ON ?auto_315543 ?auto_315544 ) ( ON ?auto_315542 ?auto_315543 ) ( ON ?auto_315541 ?auto_315542 ) ( ON ?auto_315540 ?auto_315541 ) ( CLEAR ?auto_315538 ) ( ON ?auto_315539 ?auto_315540 ) ( CLEAR ?auto_315539 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_315537 ?auto_315538 ?auto_315539 )
      ( MAKE-11PILE ?auto_315537 ?auto_315538 ?auto_315539 ?auto_315540 ?auto_315541 ?auto_315542 ?auto_315543 ?auto_315544 ?auto_315545 ?auto_315546 ?auto_315547 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_315560 - BLOCK
      ?auto_315561 - BLOCK
      ?auto_315562 - BLOCK
      ?auto_315563 - BLOCK
      ?auto_315564 - BLOCK
      ?auto_315565 - BLOCK
      ?auto_315566 - BLOCK
      ?auto_315567 - BLOCK
      ?auto_315568 - BLOCK
      ?auto_315569 - BLOCK
      ?auto_315570 - BLOCK
    )
    :vars
    (
      ?auto_315571 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_315570 ?auto_315571 ) ( ON-TABLE ?auto_315560 ) ( not ( = ?auto_315560 ?auto_315561 ) ) ( not ( = ?auto_315560 ?auto_315562 ) ) ( not ( = ?auto_315560 ?auto_315563 ) ) ( not ( = ?auto_315560 ?auto_315564 ) ) ( not ( = ?auto_315560 ?auto_315565 ) ) ( not ( = ?auto_315560 ?auto_315566 ) ) ( not ( = ?auto_315560 ?auto_315567 ) ) ( not ( = ?auto_315560 ?auto_315568 ) ) ( not ( = ?auto_315560 ?auto_315569 ) ) ( not ( = ?auto_315560 ?auto_315570 ) ) ( not ( = ?auto_315560 ?auto_315571 ) ) ( not ( = ?auto_315561 ?auto_315562 ) ) ( not ( = ?auto_315561 ?auto_315563 ) ) ( not ( = ?auto_315561 ?auto_315564 ) ) ( not ( = ?auto_315561 ?auto_315565 ) ) ( not ( = ?auto_315561 ?auto_315566 ) ) ( not ( = ?auto_315561 ?auto_315567 ) ) ( not ( = ?auto_315561 ?auto_315568 ) ) ( not ( = ?auto_315561 ?auto_315569 ) ) ( not ( = ?auto_315561 ?auto_315570 ) ) ( not ( = ?auto_315561 ?auto_315571 ) ) ( not ( = ?auto_315562 ?auto_315563 ) ) ( not ( = ?auto_315562 ?auto_315564 ) ) ( not ( = ?auto_315562 ?auto_315565 ) ) ( not ( = ?auto_315562 ?auto_315566 ) ) ( not ( = ?auto_315562 ?auto_315567 ) ) ( not ( = ?auto_315562 ?auto_315568 ) ) ( not ( = ?auto_315562 ?auto_315569 ) ) ( not ( = ?auto_315562 ?auto_315570 ) ) ( not ( = ?auto_315562 ?auto_315571 ) ) ( not ( = ?auto_315563 ?auto_315564 ) ) ( not ( = ?auto_315563 ?auto_315565 ) ) ( not ( = ?auto_315563 ?auto_315566 ) ) ( not ( = ?auto_315563 ?auto_315567 ) ) ( not ( = ?auto_315563 ?auto_315568 ) ) ( not ( = ?auto_315563 ?auto_315569 ) ) ( not ( = ?auto_315563 ?auto_315570 ) ) ( not ( = ?auto_315563 ?auto_315571 ) ) ( not ( = ?auto_315564 ?auto_315565 ) ) ( not ( = ?auto_315564 ?auto_315566 ) ) ( not ( = ?auto_315564 ?auto_315567 ) ) ( not ( = ?auto_315564 ?auto_315568 ) ) ( not ( = ?auto_315564 ?auto_315569 ) ) ( not ( = ?auto_315564 ?auto_315570 ) ) ( not ( = ?auto_315564 ?auto_315571 ) ) ( not ( = ?auto_315565 ?auto_315566 ) ) ( not ( = ?auto_315565 ?auto_315567 ) ) ( not ( = ?auto_315565 ?auto_315568 ) ) ( not ( = ?auto_315565 ?auto_315569 ) ) ( not ( = ?auto_315565 ?auto_315570 ) ) ( not ( = ?auto_315565 ?auto_315571 ) ) ( not ( = ?auto_315566 ?auto_315567 ) ) ( not ( = ?auto_315566 ?auto_315568 ) ) ( not ( = ?auto_315566 ?auto_315569 ) ) ( not ( = ?auto_315566 ?auto_315570 ) ) ( not ( = ?auto_315566 ?auto_315571 ) ) ( not ( = ?auto_315567 ?auto_315568 ) ) ( not ( = ?auto_315567 ?auto_315569 ) ) ( not ( = ?auto_315567 ?auto_315570 ) ) ( not ( = ?auto_315567 ?auto_315571 ) ) ( not ( = ?auto_315568 ?auto_315569 ) ) ( not ( = ?auto_315568 ?auto_315570 ) ) ( not ( = ?auto_315568 ?auto_315571 ) ) ( not ( = ?auto_315569 ?auto_315570 ) ) ( not ( = ?auto_315569 ?auto_315571 ) ) ( not ( = ?auto_315570 ?auto_315571 ) ) ( ON ?auto_315569 ?auto_315570 ) ( ON ?auto_315568 ?auto_315569 ) ( ON ?auto_315567 ?auto_315568 ) ( ON ?auto_315566 ?auto_315567 ) ( ON ?auto_315565 ?auto_315566 ) ( ON ?auto_315564 ?auto_315565 ) ( ON ?auto_315563 ?auto_315564 ) ( ON ?auto_315562 ?auto_315563 ) ( CLEAR ?auto_315560 ) ( ON ?auto_315561 ?auto_315562 ) ( CLEAR ?auto_315561 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_315560 ?auto_315561 )
      ( MAKE-11PILE ?auto_315560 ?auto_315561 ?auto_315562 ?auto_315563 ?auto_315564 ?auto_315565 ?auto_315566 ?auto_315567 ?auto_315568 ?auto_315569 ?auto_315570 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_315583 - BLOCK
      ?auto_315584 - BLOCK
      ?auto_315585 - BLOCK
      ?auto_315586 - BLOCK
      ?auto_315587 - BLOCK
      ?auto_315588 - BLOCK
      ?auto_315589 - BLOCK
      ?auto_315590 - BLOCK
      ?auto_315591 - BLOCK
      ?auto_315592 - BLOCK
      ?auto_315593 - BLOCK
    )
    :vars
    (
      ?auto_315594 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_315593 ?auto_315594 ) ( ON-TABLE ?auto_315583 ) ( not ( = ?auto_315583 ?auto_315584 ) ) ( not ( = ?auto_315583 ?auto_315585 ) ) ( not ( = ?auto_315583 ?auto_315586 ) ) ( not ( = ?auto_315583 ?auto_315587 ) ) ( not ( = ?auto_315583 ?auto_315588 ) ) ( not ( = ?auto_315583 ?auto_315589 ) ) ( not ( = ?auto_315583 ?auto_315590 ) ) ( not ( = ?auto_315583 ?auto_315591 ) ) ( not ( = ?auto_315583 ?auto_315592 ) ) ( not ( = ?auto_315583 ?auto_315593 ) ) ( not ( = ?auto_315583 ?auto_315594 ) ) ( not ( = ?auto_315584 ?auto_315585 ) ) ( not ( = ?auto_315584 ?auto_315586 ) ) ( not ( = ?auto_315584 ?auto_315587 ) ) ( not ( = ?auto_315584 ?auto_315588 ) ) ( not ( = ?auto_315584 ?auto_315589 ) ) ( not ( = ?auto_315584 ?auto_315590 ) ) ( not ( = ?auto_315584 ?auto_315591 ) ) ( not ( = ?auto_315584 ?auto_315592 ) ) ( not ( = ?auto_315584 ?auto_315593 ) ) ( not ( = ?auto_315584 ?auto_315594 ) ) ( not ( = ?auto_315585 ?auto_315586 ) ) ( not ( = ?auto_315585 ?auto_315587 ) ) ( not ( = ?auto_315585 ?auto_315588 ) ) ( not ( = ?auto_315585 ?auto_315589 ) ) ( not ( = ?auto_315585 ?auto_315590 ) ) ( not ( = ?auto_315585 ?auto_315591 ) ) ( not ( = ?auto_315585 ?auto_315592 ) ) ( not ( = ?auto_315585 ?auto_315593 ) ) ( not ( = ?auto_315585 ?auto_315594 ) ) ( not ( = ?auto_315586 ?auto_315587 ) ) ( not ( = ?auto_315586 ?auto_315588 ) ) ( not ( = ?auto_315586 ?auto_315589 ) ) ( not ( = ?auto_315586 ?auto_315590 ) ) ( not ( = ?auto_315586 ?auto_315591 ) ) ( not ( = ?auto_315586 ?auto_315592 ) ) ( not ( = ?auto_315586 ?auto_315593 ) ) ( not ( = ?auto_315586 ?auto_315594 ) ) ( not ( = ?auto_315587 ?auto_315588 ) ) ( not ( = ?auto_315587 ?auto_315589 ) ) ( not ( = ?auto_315587 ?auto_315590 ) ) ( not ( = ?auto_315587 ?auto_315591 ) ) ( not ( = ?auto_315587 ?auto_315592 ) ) ( not ( = ?auto_315587 ?auto_315593 ) ) ( not ( = ?auto_315587 ?auto_315594 ) ) ( not ( = ?auto_315588 ?auto_315589 ) ) ( not ( = ?auto_315588 ?auto_315590 ) ) ( not ( = ?auto_315588 ?auto_315591 ) ) ( not ( = ?auto_315588 ?auto_315592 ) ) ( not ( = ?auto_315588 ?auto_315593 ) ) ( not ( = ?auto_315588 ?auto_315594 ) ) ( not ( = ?auto_315589 ?auto_315590 ) ) ( not ( = ?auto_315589 ?auto_315591 ) ) ( not ( = ?auto_315589 ?auto_315592 ) ) ( not ( = ?auto_315589 ?auto_315593 ) ) ( not ( = ?auto_315589 ?auto_315594 ) ) ( not ( = ?auto_315590 ?auto_315591 ) ) ( not ( = ?auto_315590 ?auto_315592 ) ) ( not ( = ?auto_315590 ?auto_315593 ) ) ( not ( = ?auto_315590 ?auto_315594 ) ) ( not ( = ?auto_315591 ?auto_315592 ) ) ( not ( = ?auto_315591 ?auto_315593 ) ) ( not ( = ?auto_315591 ?auto_315594 ) ) ( not ( = ?auto_315592 ?auto_315593 ) ) ( not ( = ?auto_315592 ?auto_315594 ) ) ( not ( = ?auto_315593 ?auto_315594 ) ) ( ON ?auto_315592 ?auto_315593 ) ( ON ?auto_315591 ?auto_315592 ) ( ON ?auto_315590 ?auto_315591 ) ( ON ?auto_315589 ?auto_315590 ) ( ON ?auto_315588 ?auto_315589 ) ( ON ?auto_315587 ?auto_315588 ) ( ON ?auto_315586 ?auto_315587 ) ( ON ?auto_315585 ?auto_315586 ) ( CLEAR ?auto_315583 ) ( ON ?auto_315584 ?auto_315585 ) ( CLEAR ?auto_315584 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_315583 ?auto_315584 )
      ( MAKE-11PILE ?auto_315583 ?auto_315584 ?auto_315585 ?auto_315586 ?auto_315587 ?auto_315588 ?auto_315589 ?auto_315590 ?auto_315591 ?auto_315592 ?auto_315593 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_315606 - BLOCK
      ?auto_315607 - BLOCK
      ?auto_315608 - BLOCK
      ?auto_315609 - BLOCK
      ?auto_315610 - BLOCK
      ?auto_315611 - BLOCK
      ?auto_315612 - BLOCK
      ?auto_315613 - BLOCK
      ?auto_315614 - BLOCK
      ?auto_315615 - BLOCK
      ?auto_315616 - BLOCK
    )
    :vars
    (
      ?auto_315617 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_315616 ?auto_315617 ) ( not ( = ?auto_315606 ?auto_315607 ) ) ( not ( = ?auto_315606 ?auto_315608 ) ) ( not ( = ?auto_315606 ?auto_315609 ) ) ( not ( = ?auto_315606 ?auto_315610 ) ) ( not ( = ?auto_315606 ?auto_315611 ) ) ( not ( = ?auto_315606 ?auto_315612 ) ) ( not ( = ?auto_315606 ?auto_315613 ) ) ( not ( = ?auto_315606 ?auto_315614 ) ) ( not ( = ?auto_315606 ?auto_315615 ) ) ( not ( = ?auto_315606 ?auto_315616 ) ) ( not ( = ?auto_315606 ?auto_315617 ) ) ( not ( = ?auto_315607 ?auto_315608 ) ) ( not ( = ?auto_315607 ?auto_315609 ) ) ( not ( = ?auto_315607 ?auto_315610 ) ) ( not ( = ?auto_315607 ?auto_315611 ) ) ( not ( = ?auto_315607 ?auto_315612 ) ) ( not ( = ?auto_315607 ?auto_315613 ) ) ( not ( = ?auto_315607 ?auto_315614 ) ) ( not ( = ?auto_315607 ?auto_315615 ) ) ( not ( = ?auto_315607 ?auto_315616 ) ) ( not ( = ?auto_315607 ?auto_315617 ) ) ( not ( = ?auto_315608 ?auto_315609 ) ) ( not ( = ?auto_315608 ?auto_315610 ) ) ( not ( = ?auto_315608 ?auto_315611 ) ) ( not ( = ?auto_315608 ?auto_315612 ) ) ( not ( = ?auto_315608 ?auto_315613 ) ) ( not ( = ?auto_315608 ?auto_315614 ) ) ( not ( = ?auto_315608 ?auto_315615 ) ) ( not ( = ?auto_315608 ?auto_315616 ) ) ( not ( = ?auto_315608 ?auto_315617 ) ) ( not ( = ?auto_315609 ?auto_315610 ) ) ( not ( = ?auto_315609 ?auto_315611 ) ) ( not ( = ?auto_315609 ?auto_315612 ) ) ( not ( = ?auto_315609 ?auto_315613 ) ) ( not ( = ?auto_315609 ?auto_315614 ) ) ( not ( = ?auto_315609 ?auto_315615 ) ) ( not ( = ?auto_315609 ?auto_315616 ) ) ( not ( = ?auto_315609 ?auto_315617 ) ) ( not ( = ?auto_315610 ?auto_315611 ) ) ( not ( = ?auto_315610 ?auto_315612 ) ) ( not ( = ?auto_315610 ?auto_315613 ) ) ( not ( = ?auto_315610 ?auto_315614 ) ) ( not ( = ?auto_315610 ?auto_315615 ) ) ( not ( = ?auto_315610 ?auto_315616 ) ) ( not ( = ?auto_315610 ?auto_315617 ) ) ( not ( = ?auto_315611 ?auto_315612 ) ) ( not ( = ?auto_315611 ?auto_315613 ) ) ( not ( = ?auto_315611 ?auto_315614 ) ) ( not ( = ?auto_315611 ?auto_315615 ) ) ( not ( = ?auto_315611 ?auto_315616 ) ) ( not ( = ?auto_315611 ?auto_315617 ) ) ( not ( = ?auto_315612 ?auto_315613 ) ) ( not ( = ?auto_315612 ?auto_315614 ) ) ( not ( = ?auto_315612 ?auto_315615 ) ) ( not ( = ?auto_315612 ?auto_315616 ) ) ( not ( = ?auto_315612 ?auto_315617 ) ) ( not ( = ?auto_315613 ?auto_315614 ) ) ( not ( = ?auto_315613 ?auto_315615 ) ) ( not ( = ?auto_315613 ?auto_315616 ) ) ( not ( = ?auto_315613 ?auto_315617 ) ) ( not ( = ?auto_315614 ?auto_315615 ) ) ( not ( = ?auto_315614 ?auto_315616 ) ) ( not ( = ?auto_315614 ?auto_315617 ) ) ( not ( = ?auto_315615 ?auto_315616 ) ) ( not ( = ?auto_315615 ?auto_315617 ) ) ( not ( = ?auto_315616 ?auto_315617 ) ) ( ON ?auto_315615 ?auto_315616 ) ( ON ?auto_315614 ?auto_315615 ) ( ON ?auto_315613 ?auto_315614 ) ( ON ?auto_315612 ?auto_315613 ) ( ON ?auto_315611 ?auto_315612 ) ( ON ?auto_315610 ?auto_315611 ) ( ON ?auto_315609 ?auto_315610 ) ( ON ?auto_315608 ?auto_315609 ) ( ON ?auto_315607 ?auto_315608 ) ( ON ?auto_315606 ?auto_315607 ) ( CLEAR ?auto_315606 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_315606 )
      ( MAKE-11PILE ?auto_315606 ?auto_315607 ?auto_315608 ?auto_315609 ?auto_315610 ?auto_315611 ?auto_315612 ?auto_315613 ?auto_315614 ?auto_315615 ?auto_315616 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_315629 - BLOCK
      ?auto_315630 - BLOCK
      ?auto_315631 - BLOCK
      ?auto_315632 - BLOCK
      ?auto_315633 - BLOCK
      ?auto_315634 - BLOCK
      ?auto_315635 - BLOCK
      ?auto_315636 - BLOCK
      ?auto_315637 - BLOCK
      ?auto_315638 - BLOCK
      ?auto_315639 - BLOCK
    )
    :vars
    (
      ?auto_315640 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_315639 ?auto_315640 ) ( not ( = ?auto_315629 ?auto_315630 ) ) ( not ( = ?auto_315629 ?auto_315631 ) ) ( not ( = ?auto_315629 ?auto_315632 ) ) ( not ( = ?auto_315629 ?auto_315633 ) ) ( not ( = ?auto_315629 ?auto_315634 ) ) ( not ( = ?auto_315629 ?auto_315635 ) ) ( not ( = ?auto_315629 ?auto_315636 ) ) ( not ( = ?auto_315629 ?auto_315637 ) ) ( not ( = ?auto_315629 ?auto_315638 ) ) ( not ( = ?auto_315629 ?auto_315639 ) ) ( not ( = ?auto_315629 ?auto_315640 ) ) ( not ( = ?auto_315630 ?auto_315631 ) ) ( not ( = ?auto_315630 ?auto_315632 ) ) ( not ( = ?auto_315630 ?auto_315633 ) ) ( not ( = ?auto_315630 ?auto_315634 ) ) ( not ( = ?auto_315630 ?auto_315635 ) ) ( not ( = ?auto_315630 ?auto_315636 ) ) ( not ( = ?auto_315630 ?auto_315637 ) ) ( not ( = ?auto_315630 ?auto_315638 ) ) ( not ( = ?auto_315630 ?auto_315639 ) ) ( not ( = ?auto_315630 ?auto_315640 ) ) ( not ( = ?auto_315631 ?auto_315632 ) ) ( not ( = ?auto_315631 ?auto_315633 ) ) ( not ( = ?auto_315631 ?auto_315634 ) ) ( not ( = ?auto_315631 ?auto_315635 ) ) ( not ( = ?auto_315631 ?auto_315636 ) ) ( not ( = ?auto_315631 ?auto_315637 ) ) ( not ( = ?auto_315631 ?auto_315638 ) ) ( not ( = ?auto_315631 ?auto_315639 ) ) ( not ( = ?auto_315631 ?auto_315640 ) ) ( not ( = ?auto_315632 ?auto_315633 ) ) ( not ( = ?auto_315632 ?auto_315634 ) ) ( not ( = ?auto_315632 ?auto_315635 ) ) ( not ( = ?auto_315632 ?auto_315636 ) ) ( not ( = ?auto_315632 ?auto_315637 ) ) ( not ( = ?auto_315632 ?auto_315638 ) ) ( not ( = ?auto_315632 ?auto_315639 ) ) ( not ( = ?auto_315632 ?auto_315640 ) ) ( not ( = ?auto_315633 ?auto_315634 ) ) ( not ( = ?auto_315633 ?auto_315635 ) ) ( not ( = ?auto_315633 ?auto_315636 ) ) ( not ( = ?auto_315633 ?auto_315637 ) ) ( not ( = ?auto_315633 ?auto_315638 ) ) ( not ( = ?auto_315633 ?auto_315639 ) ) ( not ( = ?auto_315633 ?auto_315640 ) ) ( not ( = ?auto_315634 ?auto_315635 ) ) ( not ( = ?auto_315634 ?auto_315636 ) ) ( not ( = ?auto_315634 ?auto_315637 ) ) ( not ( = ?auto_315634 ?auto_315638 ) ) ( not ( = ?auto_315634 ?auto_315639 ) ) ( not ( = ?auto_315634 ?auto_315640 ) ) ( not ( = ?auto_315635 ?auto_315636 ) ) ( not ( = ?auto_315635 ?auto_315637 ) ) ( not ( = ?auto_315635 ?auto_315638 ) ) ( not ( = ?auto_315635 ?auto_315639 ) ) ( not ( = ?auto_315635 ?auto_315640 ) ) ( not ( = ?auto_315636 ?auto_315637 ) ) ( not ( = ?auto_315636 ?auto_315638 ) ) ( not ( = ?auto_315636 ?auto_315639 ) ) ( not ( = ?auto_315636 ?auto_315640 ) ) ( not ( = ?auto_315637 ?auto_315638 ) ) ( not ( = ?auto_315637 ?auto_315639 ) ) ( not ( = ?auto_315637 ?auto_315640 ) ) ( not ( = ?auto_315638 ?auto_315639 ) ) ( not ( = ?auto_315638 ?auto_315640 ) ) ( not ( = ?auto_315639 ?auto_315640 ) ) ( ON ?auto_315638 ?auto_315639 ) ( ON ?auto_315637 ?auto_315638 ) ( ON ?auto_315636 ?auto_315637 ) ( ON ?auto_315635 ?auto_315636 ) ( ON ?auto_315634 ?auto_315635 ) ( ON ?auto_315633 ?auto_315634 ) ( ON ?auto_315632 ?auto_315633 ) ( ON ?auto_315631 ?auto_315632 ) ( ON ?auto_315630 ?auto_315631 ) ( ON ?auto_315629 ?auto_315630 ) ( CLEAR ?auto_315629 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_315629 )
      ( MAKE-11PILE ?auto_315629 ?auto_315630 ?auto_315631 ?auto_315632 ?auto_315633 ?auto_315634 ?auto_315635 ?auto_315636 ?auto_315637 ?auto_315638 ?auto_315639 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_315653 - BLOCK
      ?auto_315654 - BLOCK
      ?auto_315655 - BLOCK
      ?auto_315656 - BLOCK
      ?auto_315657 - BLOCK
      ?auto_315658 - BLOCK
      ?auto_315659 - BLOCK
      ?auto_315660 - BLOCK
      ?auto_315661 - BLOCK
      ?auto_315662 - BLOCK
      ?auto_315663 - BLOCK
      ?auto_315664 - BLOCK
    )
    :vars
    (
      ?auto_315665 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_315663 ) ( ON ?auto_315664 ?auto_315665 ) ( CLEAR ?auto_315664 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_315653 ) ( ON ?auto_315654 ?auto_315653 ) ( ON ?auto_315655 ?auto_315654 ) ( ON ?auto_315656 ?auto_315655 ) ( ON ?auto_315657 ?auto_315656 ) ( ON ?auto_315658 ?auto_315657 ) ( ON ?auto_315659 ?auto_315658 ) ( ON ?auto_315660 ?auto_315659 ) ( ON ?auto_315661 ?auto_315660 ) ( ON ?auto_315662 ?auto_315661 ) ( ON ?auto_315663 ?auto_315662 ) ( not ( = ?auto_315653 ?auto_315654 ) ) ( not ( = ?auto_315653 ?auto_315655 ) ) ( not ( = ?auto_315653 ?auto_315656 ) ) ( not ( = ?auto_315653 ?auto_315657 ) ) ( not ( = ?auto_315653 ?auto_315658 ) ) ( not ( = ?auto_315653 ?auto_315659 ) ) ( not ( = ?auto_315653 ?auto_315660 ) ) ( not ( = ?auto_315653 ?auto_315661 ) ) ( not ( = ?auto_315653 ?auto_315662 ) ) ( not ( = ?auto_315653 ?auto_315663 ) ) ( not ( = ?auto_315653 ?auto_315664 ) ) ( not ( = ?auto_315653 ?auto_315665 ) ) ( not ( = ?auto_315654 ?auto_315655 ) ) ( not ( = ?auto_315654 ?auto_315656 ) ) ( not ( = ?auto_315654 ?auto_315657 ) ) ( not ( = ?auto_315654 ?auto_315658 ) ) ( not ( = ?auto_315654 ?auto_315659 ) ) ( not ( = ?auto_315654 ?auto_315660 ) ) ( not ( = ?auto_315654 ?auto_315661 ) ) ( not ( = ?auto_315654 ?auto_315662 ) ) ( not ( = ?auto_315654 ?auto_315663 ) ) ( not ( = ?auto_315654 ?auto_315664 ) ) ( not ( = ?auto_315654 ?auto_315665 ) ) ( not ( = ?auto_315655 ?auto_315656 ) ) ( not ( = ?auto_315655 ?auto_315657 ) ) ( not ( = ?auto_315655 ?auto_315658 ) ) ( not ( = ?auto_315655 ?auto_315659 ) ) ( not ( = ?auto_315655 ?auto_315660 ) ) ( not ( = ?auto_315655 ?auto_315661 ) ) ( not ( = ?auto_315655 ?auto_315662 ) ) ( not ( = ?auto_315655 ?auto_315663 ) ) ( not ( = ?auto_315655 ?auto_315664 ) ) ( not ( = ?auto_315655 ?auto_315665 ) ) ( not ( = ?auto_315656 ?auto_315657 ) ) ( not ( = ?auto_315656 ?auto_315658 ) ) ( not ( = ?auto_315656 ?auto_315659 ) ) ( not ( = ?auto_315656 ?auto_315660 ) ) ( not ( = ?auto_315656 ?auto_315661 ) ) ( not ( = ?auto_315656 ?auto_315662 ) ) ( not ( = ?auto_315656 ?auto_315663 ) ) ( not ( = ?auto_315656 ?auto_315664 ) ) ( not ( = ?auto_315656 ?auto_315665 ) ) ( not ( = ?auto_315657 ?auto_315658 ) ) ( not ( = ?auto_315657 ?auto_315659 ) ) ( not ( = ?auto_315657 ?auto_315660 ) ) ( not ( = ?auto_315657 ?auto_315661 ) ) ( not ( = ?auto_315657 ?auto_315662 ) ) ( not ( = ?auto_315657 ?auto_315663 ) ) ( not ( = ?auto_315657 ?auto_315664 ) ) ( not ( = ?auto_315657 ?auto_315665 ) ) ( not ( = ?auto_315658 ?auto_315659 ) ) ( not ( = ?auto_315658 ?auto_315660 ) ) ( not ( = ?auto_315658 ?auto_315661 ) ) ( not ( = ?auto_315658 ?auto_315662 ) ) ( not ( = ?auto_315658 ?auto_315663 ) ) ( not ( = ?auto_315658 ?auto_315664 ) ) ( not ( = ?auto_315658 ?auto_315665 ) ) ( not ( = ?auto_315659 ?auto_315660 ) ) ( not ( = ?auto_315659 ?auto_315661 ) ) ( not ( = ?auto_315659 ?auto_315662 ) ) ( not ( = ?auto_315659 ?auto_315663 ) ) ( not ( = ?auto_315659 ?auto_315664 ) ) ( not ( = ?auto_315659 ?auto_315665 ) ) ( not ( = ?auto_315660 ?auto_315661 ) ) ( not ( = ?auto_315660 ?auto_315662 ) ) ( not ( = ?auto_315660 ?auto_315663 ) ) ( not ( = ?auto_315660 ?auto_315664 ) ) ( not ( = ?auto_315660 ?auto_315665 ) ) ( not ( = ?auto_315661 ?auto_315662 ) ) ( not ( = ?auto_315661 ?auto_315663 ) ) ( not ( = ?auto_315661 ?auto_315664 ) ) ( not ( = ?auto_315661 ?auto_315665 ) ) ( not ( = ?auto_315662 ?auto_315663 ) ) ( not ( = ?auto_315662 ?auto_315664 ) ) ( not ( = ?auto_315662 ?auto_315665 ) ) ( not ( = ?auto_315663 ?auto_315664 ) ) ( not ( = ?auto_315663 ?auto_315665 ) ) ( not ( = ?auto_315664 ?auto_315665 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_315664 ?auto_315665 )
      ( !STACK ?auto_315664 ?auto_315663 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_315678 - BLOCK
      ?auto_315679 - BLOCK
      ?auto_315680 - BLOCK
      ?auto_315681 - BLOCK
      ?auto_315682 - BLOCK
      ?auto_315683 - BLOCK
      ?auto_315684 - BLOCK
      ?auto_315685 - BLOCK
      ?auto_315686 - BLOCK
      ?auto_315687 - BLOCK
      ?auto_315688 - BLOCK
      ?auto_315689 - BLOCK
    )
    :vars
    (
      ?auto_315690 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_315688 ) ( ON ?auto_315689 ?auto_315690 ) ( CLEAR ?auto_315689 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_315678 ) ( ON ?auto_315679 ?auto_315678 ) ( ON ?auto_315680 ?auto_315679 ) ( ON ?auto_315681 ?auto_315680 ) ( ON ?auto_315682 ?auto_315681 ) ( ON ?auto_315683 ?auto_315682 ) ( ON ?auto_315684 ?auto_315683 ) ( ON ?auto_315685 ?auto_315684 ) ( ON ?auto_315686 ?auto_315685 ) ( ON ?auto_315687 ?auto_315686 ) ( ON ?auto_315688 ?auto_315687 ) ( not ( = ?auto_315678 ?auto_315679 ) ) ( not ( = ?auto_315678 ?auto_315680 ) ) ( not ( = ?auto_315678 ?auto_315681 ) ) ( not ( = ?auto_315678 ?auto_315682 ) ) ( not ( = ?auto_315678 ?auto_315683 ) ) ( not ( = ?auto_315678 ?auto_315684 ) ) ( not ( = ?auto_315678 ?auto_315685 ) ) ( not ( = ?auto_315678 ?auto_315686 ) ) ( not ( = ?auto_315678 ?auto_315687 ) ) ( not ( = ?auto_315678 ?auto_315688 ) ) ( not ( = ?auto_315678 ?auto_315689 ) ) ( not ( = ?auto_315678 ?auto_315690 ) ) ( not ( = ?auto_315679 ?auto_315680 ) ) ( not ( = ?auto_315679 ?auto_315681 ) ) ( not ( = ?auto_315679 ?auto_315682 ) ) ( not ( = ?auto_315679 ?auto_315683 ) ) ( not ( = ?auto_315679 ?auto_315684 ) ) ( not ( = ?auto_315679 ?auto_315685 ) ) ( not ( = ?auto_315679 ?auto_315686 ) ) ( not ( = ?auto_315679 ?auto_315687 ) ) ( not ( = ?auto_315679 ?auto_315688 ) ) ( not ( = ?auto_315679 ?auto_315689 ) ) ( not ( = ?auto_315679 ?auto_315690 ) ) ( not ( = ?auto_315680 ?auto_315681 ) ) ( not ( = ?auto_315680 ?auto_315682 ) ) ( not ( = ?auto_315680 ?auto_315683 ) ) ( not ( = ?auto_315680 ?auto_315684 ) ) ( not ( = ?auto_315680 ?auto_315685 ) ) ( not ( = ?auto_315680 ?auto_315686 ) ) ( not ( = ?auto_315680 ?auto_315687 ) ) ( not ( = ?auto_315680 ?auto_315688 ) ) ( not ( = ?auto_315680 ?auto_315689 ) ) ( not ( = ?auto_315680 ?auto_315690 ) ) ( not ( = ?auto_315681 ?auto_315682 ) ) ( not ( = ?auto_315681 ?auto_315683 ) ) ( not ( = ?auto_315681 ?auto_315684 ) ) ( not ( = ?auto_315681 ?auto_315685 ) ) ( not ( = ?auto_315681 ?auto_315686 ) ) ( not ( = ?auto_315681 ?auto_315687 ) ) ( not ( = ?auto_315681 ?auto_315688 ) ) ( not ( = ?auto_315681 ?auto_315689 ) ) ( not ( = ?auto_315681 ?auto_315690 ) ) ( not ( = ?auto_315682 ?auto_315683 ) ) ( not ( = ?auto_315682 ?auto_315684 ) ) ( not ( = ?auto_315682 ?auto_315685 ) ) ( not ( = ?auto_315682 ?auto_315686 ) ) ( not ( = ?auto_315682 ?auto_315687 ) ) ( not ( = ?auto_315682 ?auto_315688 ) ) ( not ( = ?auto_315682 ?auto_315689 ) ) ( not ( = ?auto_315682 ?auto_315690 ) ) ( not ( = ?auto_315683 ?auto_315684 ) ) ( not ( = ?auto_315683 ?auto_315685 ) ) ( not ( = ?auto_315683 ?auto_315686 ) ) ( not ( = ?auto_315683 ?auto_315687 ) ) ( not ( = ?auto_315683 ?auto_315688 ) ) ( not ( = ?auto_315683 ?auto_315689 ) ) ( not ( = ?auto_315683 ?auto_315690 ) ) ( not ( = ?auto_315684 ?auto_315685 ) ) ( not ( = ?auto_315684 ?auto_315686 ) ) ( not ( = ?auto_315684 ?auto_315687 ) ) ( not ( = ?auto_315684 ?auto_315688 ) ) ( not ( = ?auto_315684 ?auto_315689 ) ) ( not ( = ?auto_315684 ?auto_315690 ) ) ( not ( = ?auto_315685 ?auto_315686 ) ) ( not ( = ?auto_315685 ?auto_315687 ) ) ( not ( = ?auto_315685 ?auto_315688 ) ) ( not ( = ?auto_315685 ?auto_315689 ) ) ( not ( = ?auto_315685 ?auto_315690 ) ) ( not ( = ?auto_315686 ?auto_315687 ) ) ( not ( = ?auto_315686 ?auto_315688 ) ) ( not ( = ?auto_315686 ?auto_315689 ) ) ( not ( = ?auto_315686 ?auto_315690 ) ) ( not ( = ?auto_315687 ?auto_315688 ) ) ( not ( = ?auto_315687 ?auto_315689 ) ) ( not ( = ?auto_315687 ?auto_315690 ) ) ( not ( = ?auto_315688 ?auto_315689 ) ) ( not ( = ?auto_315688 ?auto_315690 ) ) ( not ( = ?auto_315689 ?auto_315690 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_315689 ?auto_315690 )
      ( !STACK ?auto_315689 ?auto_315688 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_315703 - BLOCK
      ?auto_315704 - BLOCK
      ?auto_315705 - BLOCK
      ?auto_315706 - BLOCK
      ?auto_315707 - BLOCK
      ?auto_315708 - BLOCK
      ?auto_315709 - BLOCK
      ?auto_315710 - BLOCK
      ?auto_315711 - BLOCK
      ?auto_315712 - BLOCK
      ?auto_315713 - BLOCK
      ?auto_315714 - BLOCK
    )
    :vars
    (
      ?auto_315715 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_315714 ?auto_315715 ) ( ON-TABLE ?auto_315703 ) ( ON ?auto_315704 ?auto_315703 ) ( ON ?auto_315705 ?auto_315704 ) ( ON ?auto_315706 ?auto_315705 ) ( ON ?auto_315707 ?auto_315706 ) ( ON ?auto_315708 ?auto_315707 ) ( ON ?auto_315709 ?auto_315708 ) ( ON ?auto_315710 ?auto_315709 ) ( ON ?auto_315711 ?auto_315710 ) ( ON ?auto_315712 ?auto_315711 ) ( not ( = ?auto_315703 ?auto_315704 ) ) ( not ( = ?auto_315703 ?auto_315705 ) ) ( not ( = ?auto_315703 ?auto_315706 ) ) ( not ( = ?auto_315703 ?auto_315707 ) ) ( not ( = ?auto_315703 ?auto_315708 ) ) ( not ( = ?auto_315703 ?auto_315709 ) ) ( not ( = ?auto_315703 ?auto_315710 ) ) ( not ( = ?auto_315703 ?auto_315711 ) ) ( not ( = ?auto_315703 ?auto_315712 ) ) ( not ( = ?auto_315703 ?auto_315713 ) ) ( not ( = ?auto_315703 ?auto_315714 ) ) ( not ( = ?auto_315703 ?auto_315715 ) ) ( not ( = ?auto_315704 ?auto_315705 ) ) ( not ( = ?auto_315704 ?auto_315706 ) ) ( not ( = ?auto_315704 ?auto_315707 ) ) ( not ( = ?auto_315704 ?auto_315708 ) ) ( not ( = ?auto_315704 ?auto_315709 ) ) ( not ( = ?auto_315704 ?auto_315710 ) ) ( not ( = ?auto_315704 ?auto_315711 ) ) ( not ( = ?auto_315704 ?auto_315712 ) ) ( not ( = ?auto_315704 ?auto_315713 ) ) ( not ( = ?auto_315704 ?auto_315714 ) ) ( not ( = ?auto_315704 ?auto_315715 ) ) ( not ( = ?auto_315705 ?auto_315706 ) ) ( not ( = ?auto_315705 ?auto_315707 ) ) ( not ( = ?auto_315705 ?auto_315708 ) ) ( not ( = ?auto_315705 ?auto_315709 ) ) ( not ( = ?auto_315705 ?auto_315710 ) ) ( not ( = ?auto_315705 ?auto_315711 ) ) ( not ( = ?auto_315705 ?auto_315712 ) ) ( not ( = ?auto_315705 ?auto_315713 ) ) ( not ( = ?auto_315705 ?auto_315714 ) ) ( not ( = ?auto_315705 ?auto_315715 ) ) ( not ( = ?auto_315706 ?auto_315707 ) ) ( not ( = ?auto_315706 ?auto_315708 ) ) ( not ( = ?auto_315706 ?auto_315709 ) ) ( not ( = ?auto_315706 ?auto_315710 ) ) ( not ( = ?auto_315706 ?auto_315711 ) ) ( not ( = ?auto_315706 ?auto_315712 ) ) ( not ( = ?auto_315706 ?auto_315713 ) ) ( not ( = ?auto_315706 ?auto_315714 ) ) ( not ( = ?auto_315706 ?auto_315715 ) ) ( not ( = ?auto_315707 ?auto_315708 ) ) ( not ( = ?auto_315707 ?auto_315709 ) ) ( not ( = ?auto_315707 ?auto_315710 ) ) ( not ( = ?auto_315707 ?auto_315711 ) ) ( not ( = ?auto_315707 ?auto_315712 ) ) ( not ( = ?auto_315707 ?auto_315713 ) ) ( not ( = ?auto_315707 ?auto_315714 ) ) ( not ( = ?auto_315707 ?auto_315715 ) ) ( not ( = ?auto_315708 ?auto_315709 ) ) ( not ( = ?auto_315708 ?auto_315710 ) ) ( not ( = ?auto_315708 ?auto_315711 ) ) ( not ( = ?auto_315708 ?auto_315712 ) ) ( not ( = ?auto_315708 ?auto_315713 ) ) ( not ( = ?auto_315708 ?auto_315714 ) ) ( not ( = ?auto_315708 ?auto_315715 ) ) ( not ( = ?auto_315709 ?auto_315710 ) ) ( not ( = ?auto_315709 ?auto_315711 ) ) ( not ( = ?auto_315709 ?auto_315712 ) ) ( not ( = ?auto_315709 ?auto_315713 ) ) ( not ( = ?auto_315709 ?auto_315714 ) ) ( not ( = ?auto_315709 ?auto_315715 ) ) ( not ( = ?auto_315710 ?auto_315711 ) ) ( not ( = ?auto_315710 ?auto_315712 ) ) ( not ( = ?auto_315710 ?auto_315713 ) ) ( not ( = ?auto_315710 ?auto_315714 ) ) ( not ( = ?auto_315710 ?auto_315715 ) ) ( not ( = ?auto_315711 ?auto_315712 ) ) ( not ( = ?auto_315711 ?auto_315713 ) ) ( not ( = ?auto_315711 ?auto_315714 ) ) ( not ( = ?auto_315711 ?auto_315715 ) ) ( not ( = ?auto_315712 ?auto_315713 ) ) ( not ( = ?auto_315712 ?auto_315714 ) ) ( not ( = ?auto_315712 ?auto_315715 ) ) ( not ( = ?auto_315713 ?auto_315714 ) ) ( not ( = ?auto_315713 ?auto_315715 ) ) ( not ( = ?auto_315714 ?auto_315715 ) ) ( CLEAR ?auto_315712 ) ( ON ?auto_315713 ?auto_315714 ) ( CLEAR ?auto_315713 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_315703 ?auto_315704 ?auto_315705 ?auto_315706 ?auto_315707 ?auto_315708 ?auto_315709 ?auto_315710 ?auto_315711 ?auto_315712 ?auto_315713 )
      ( MAKE-12PILE ?auto_315703 ?auto_315704 ?auto_315705 ?auto_315706 ?auto_315707 ?auto_315708 ?auto_315709 ?auto_315710 ?auto_315711 ?auto_315712 ?auto_315713 ?auto_315714 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_315728 - BLOCK
      ?auto_315729 - BLOCK
      ?auto_315730 - BLOCK
      ?auto_315731 - BLOCK
      ?auto_315732 - BLOCK
      ?auto_315733 - BLOCK
      ?auto_315734 - BLOCK
      ?auto_315735 - BLOCK
      ?auto_315736 - BLOCK
      ?auto_315737 - BLOCK
      ?auto_315738 - BLOCK
      ?auto_315739 - BLOCK
    )
    :vars
    (
      ?auto_315740 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_315739 ?auto_315740 ) ( ON-TABLE ?auto_315728 ) ( ON ?auto_315729 ?auto_315728 ) ( ON ?auto_315730 ?auto_315729 ) ( ON ?auto_315731 ?auto_315730 ) ( ON ?auto_315732 ?auto_315731 ) ( ON ?auto_315733 ?auto_315732 ) ( ON ?auto_315734 ?auto_315733 ) ( ON ?auto_315735 ?auto_315734 ) ( ON ?auto_315736 ?auto_315735 ) ( ON ?auto_315737 ?auto_315736 ) ( not ( = ?auto_315728 ?auto_315729 ) ) ( not ( = ?auto_315728 ?auto_315730 ) ) ( not ( = ?auto_315728 ?auto_315731 ) ) ( not ( = ?auto_315728 ?auto_315732 ) ) ( not ( = ?auto_315728 ?auto_315733 ) ) ( not ( = ?auto_315728 ?auto_315734 ) ) ( not ( = ?auto_315728 ?auto_315735 ) ) ( not ( = ?auto_315728 ?auto_315736 ) ) ( not ( = ?auto_315728 ?auto_315737 ) ) ( not ( = ?auto_315728 ?auto_315738 ) ) ( not ( = ?auto_315728 ?auto_315739 ) ) ( not ( = ?auto_315728 ?auto_315740 ) ) ( not ( = ?auto_315729 ?auto_315730 ) ) ( not ( = ?auto_315729 ?auto_315731 ) ) ( not ( = ?auto_315729 ?auto_315732 ) ) ( not ( = ?auto_315729 ?auto_315733 ) ) ( not ( = ?auto_315729 ?auto_315734 ) ) ( not ( = ?auto_315729 ?auto_315735 ) ) ( not ( = ?auto_315729 ?auto_315736 ) ) ( not ( = ?auto_315729 ?auto_315737 ) ) ( not ( = ?auto_315729 ?auto_315738 ) ) ( not ( = ?auto_315729 ?auto_315739 ) ) ( not ( = ?auto_315729 ?auto_315740 ) ) ( not ( = ?auto_315730 ?auto_315731 ) ) ( not ( = ?auto_315730 ?auto_315732 ) ) ( not ( = ?auto_315730 ?auto_315733 ) ) ( not ( = ?auto_315730 ?auto_315734 ) ) ( not ( = ?auto_315730 ?auto_315735 ) ) ( not ( = ?auto_315730 ?auto_315736 ) ) ( not ( = ?auto_315730 ?auto_315737 ) ) ( not ( = ?auto_315730 ?auto_315738 ) ) ( not ( = ?auto_315730 ?auto_315739 ) ) ( not ( = ?auto_315730 ?auto_315740 ) ) ( not ( = ?auto_315731 ?auto_315732 ) ) ( not ( = ?auto_315731 ?auto_315733 ) ) ( not ( = ?auto_315731 ?auto_315734 ) ) ( not ( = ?auto_315731 ?auto_315735 ) ) ( not ( = ?auto_315731 ?auto_315736 ) ) ( not ( = ?auto_315731 ?auto_315737 ) ) ( not ( = ?auto_315731 ?auto_315738 ) ) ( not ( = ?auto_315731 ?auto_315739 ) ) ( not ( = ?auto_315731 ?auto_315740 ) ) ( not ( = ?auto_315732 ?auto_315733 ) ) ( not ( = ?auto_315732 ?auto_315734 ) ) ( not ( = ?auto_315732 ?auto_315735 ) ) ( not ( = ?auto_315732 ?auto_315736 ) ) ( not ( = ?auto_315732 ?auto_315737 ) ) ( not ( = ?auto_315732 ?auto_315738 ) ) ( not ( = ?auto_315732 ?auto_315739 ) ) ( not ( = ?auto_315732 ?auto_315740 ) ) ( not ( = ?auto_315733 ?auto_315734 ) ) ( not ( = ?auto_315733 ?auto_315735 ) ) ( not ( = ?auto_315733 ?auto_315736 ) ) ( not ( = ?auto_315733 ?auto_315737 ) ) ( not ( = ?auto_315733 ?auto_315738 ) ) ( not ( = ?auto_315733 ?auto_315739 ) ) ( not ( = ?auto_315733 ?auto_315740 ) ) ( not ( = ?auto_315734 ?auto_315735 ) ) ( not ( = ?auto_315734 ?auto_315736 ) ) ( not ( = ?auto_315734 ?auto_315737 ) ) ( not ( = ?auto_315734 ?auto_315738 ) ) ( not ( = ?auto_315734 ?auto_315739 ) ) ( not ( = ?auto_315734 ?auto_315740 ) ) ( not ( = ?auto_315735 ?auto_315736 ) ) ( not ( = ?auto_315735 ?auto_315737 ) ) ( not ( = ?auto_315735 ?auto_315738 ) ) ( not ( = ?auto_315735 ?auto_315739 ) ) ( not ( = ?auto_315735 ?auto_315740 ) ) ( not ( = ?auto_315736 ?auto_315737 ) ) ( not ( = ?auto_315736 ?auto_315738 ) ) ( not ( = ?auto_315736 ?auto_315739 ) ) ( not ( = ?auto_315736 ?auto_315740 ) ) ( not ( = ?auto_315737 ?auto_315738 ) ) ( not ( = ?auto_315737 ?auto_315739 ) ) ( not ( = ?auto_315737 ?auto_315740 ) ) ( not ( = ?auto_315738 ?auto_315739 ) ) ( not ( = ?auto_315738 ?auto_315740 ) ) ( not ( = ?auto_315739 ?auto_315740 ) ) ( CLEAR ?auto_315737 ) ( ON ?auto_315738 ?auto_315739 ) ( CLEAR ?auto_315738 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_315728 ?auto_315729 ?auto_315730 ?auto_315731 ?auto_315732 ?auto_315733 ?auto_315734 ?auto_315735 ?auto_315736 ?auto_315737 ?auto_315738 )
      ( MAKE-12PILE ?auto_315728 ?auto_315729 ?auto_315730 ?auto_315731 ?auto_315732 ?auto_315733 ?auto_315734 ?auto_315735 ?auto_315736 ?auto_315737 ?auto_315738 ?auto_315739 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_315753 - BLOCK
      ?auto_315754 - BLOCK
      ?auto_315755 - BLOCK
      ?auto_315756 - BLOCK
      ?auto_315757 - BLOCK
      ?auto_315758 - BLOCK
      ?auto_315759 - BLOCK
      ?auto_315760 - BLOCK
      ?auto_315761 - BLOCK
      ?auto_315762 - BLOCK
      ?auto_315763 - BLOCK
      ?auto_315764 - BLOCK
    )
    :vars
    (
      ?auto_315765 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_315764 ?auto_315765 ) ( ON-TABLE ?auto_315753 ) ( ON ?auto_315754 ?auto_315753 ) ( ON ?auto_315755 ?auto_315754 ) ( ON ?auto_315756 ?auto_315755 ) ( ON ?auto_315757 ?auto_315756 ) ( ON ?auto_315758 ?auto_315757 ) ( ON ?auto_315759 ?auto_315758 ) ( ON ?auto_315760 ?auto_315759 ) ( ON ?auto_315761 ?auto_315760 ) ( not ( = ?auto_315753 ?auto_315754 ) ) ( not ( = ?auto_315753 ?auto_315755 ) ) ( not ( = ?auto_315753 ?auto_315756 ) ) ( not ( = ?auto_315753 ?auto_315757 ) ) ( not ( = ?auto_315753 ?auto_315758 ) ) ( not ( = ?auto_315753 ?auto_315759 ) ) ( not ( = ?auto_315753 ?auto_315760 ) ) ( not ( = ?auto_315753 ?auto_315761 ) ) ( not ( = ?auto_315753 ?auto_315762 ) ) ( not ( = ?auto_315753 ?auto_315763 ) ) ( not ( = ?auto_315753 ?auto_315764 ) ) ( not ( = ?auto_315753 ?auto_315765 ) ) ( not ( = ?auto_315754 ?auto_315755 ) ) ( not ( = ?auto_315754 ?auto_315756 ) ) ( not ( = ?auto_315754 ?auto_315757 ) ) ( not ( = ?auto_315754 ?auto_315758 ) ) ( not ( = ?auto_315754 ?auto_315759 ) ) ( not ( = ?auto_315754 ?auto_315760 ) ) ( not ( = ?auto_315754 ?auto_315761 ) ) ( not ( = ?auto_315754 ?auto_315762 ) ) ( not ( = ?auto_315754 ?auto_315763 ) ) ( not ( = ?auto_315754 ?auto_315764 ) ) ( not ( = ?auto_315754 ?auto_315765 ) ) ( not ( = ?auto_315755 ?auto_315756 ) ) ( not ( = ?auto_315755 ?auto_315757 ) ) ( not ( = ?auto_315755 ?auto_315758 ) ) ( not ( = ?auto_315755 ?auto_315759 ) ) ( not ( = ?auto_315755 ?auto_315760 ) ) ( not ( = ?auto_315755 ?auto_315761 ) ) ( not ( = ?auto_315755 ?auto_315762 ) ) ( not ( = ?auto_315755 ?auto_315763 ) ) ( not ( = ?auto_315755 ?auto_315764 ) ) ( not ( = ?auto_315755 ?auto_315765 ) ) ( not ( = ?auto_315756 ?auto_315757 ) ) ( not ( = ?auto_315756 ?auto_315758 ) ) ( not ( = ?auto_315756 ?auto_315759 ) ) ( not ( = ?auto_315756 ?auto_315760 ) ) ( not ( = ?auto_315756 ?auto_315761 ) ) ( not ( = ?auto_315756 ?auto_315762 ) ) ( not ( = ?auto_315756 ?auto_315763 ) ) ( not ( = ?auto_315756 ?auto_315764 ) ) ( not ( = ?auto_315756 ?auto_315765 ) ) ( not ( = ?auto_315757 ?auto_315758 ) ) ( not ( = ?auto_315757 ?auto_315759 ) ) ( not ( = ?auto_315757 ?auto_315760 ) ) ( not ( = ?auto_315757 ?auto_315761 ) ) ( not ( = ?auto_315757 ?auto_315762 ) ) ( not ( = ?auto_315757 ?auto_315763 ) ) ( not ( = ?auto_315757 ?auto_315764 ) ) ( not ( = ?auto_315757 ?auto_315765 ) ) ( not ( = ?auto_315758 ?auto_315759 ) ) ( not ( = ?auto_315758 ?auto_315760 ) ) ( not ( = ?auto_315758 ?auto_315761 ) ) ( not ( = ?auto_315758 ?auto_315762 ) ) ( not ( = ?auto_315758 ?auto_315763 ) ) ( not ( = ?auto_315758 ?auto_315764 ) ) ( not ( = ?auto_315758 ?auto_315765 ) ) ( not ( = ?auto_315759 ?auto_315760 ) ) ( not ( = ?auto_315759 ?auto_315761 ) ) ( not ( = ?auto_315759 ?auto_315762 ) ) ( not ( = ?auto_315759 ?auto_315763 ) ) ( not ( = ?auto_315759 ?auto_315764 ) ) ( not ( = ?auto_315759 ?auto_315765 ) ) ( not ( = ?auto_315760 ?auto_315761 ) ) ( not ( = ?auto_315760 ?auto_315762 ) ) ( not ( = ?auto_315760 ?auto_315763 ) ) ( not ( = ?auto_315760 ?auto_315764 ) ) ( not ( = ?auto_315760 ?auto_315765 ) ) ( not ( = ?auto_315761 ?auto_315762 ) ) ( not ( = ?auto_315761 ?auto_315763 ) ) ( not ( = ?auto_315761 ?auto_315764 ) ) ( not ( = ?auto_315761 ?auto_315765 ) ) ( not ( = ?auto_315762 ?auto_315763 ) ) ( not ( = ?auto_315762 ?auto_315764 ) ) ( not ( = ?auto_315762 ?auto_315765 ) ) ( not ( = ?auto_315763 ?auto_315764 ) ) ( not ( = ?auto_315763 ?auto_315765 ) ) ( not ( = ?auto_315764 ?auto_315765 ) ) ( ON ?auto_315763 ?auto_315764 ) ( CLEAR ?auto_315761 ) ( ON ?auto_315762 ?auto_315763 ) ( CLEAR ?auto_315762 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_315753 ?auto_315754 ?auto_315755 ?auto_315756 ?auto_315757 ?auto_315758 ?auto_315759 ?auto_315760 ?auto_315761 ?auto_315762 )
      ( MAKE-12PILE ?auto_315753 ?auto_315754 ?auto_315755 ?auto_315756 ?auto_315757 ?auto_315758 ?auto_315759 ?auto_315760 ?auto_315761 ?auto_315762 ?auto_315763 ?auto_315764 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_315778 - BLOCK
      ?auto_315779 - BLOCK
      ?auto_315780 - BLOCK
      ?auto_315781 - BLOCK
      ?auto_315782 - BLOCK
      ?auto_315783 - BLOCK
      ?auto_315784 - BLOCK
      ?auto_315785 - BLOCK
      ?auto_315786 - BLOCK
      ?auto_315787 - BLOCK
      ?auto_315788 - BLOCK
      ?auto_315789 - BLOCK
    )
    :vars
    (
      ?auto_315790 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_315789 ?auto_315790 ) ( ON-TABLE ?auto_315778 ) ( ON ?auto_315779 ?auto_315778 ) ( ON ?auto_315780 ?auto_315779 ) ( ON ?auto_315781 ?auto_315780 ) ( ON ?auto_315782 ?auto_315781 ) ( ON ?auto_315783 ?auto_315782 ) ( ON ?auto_315784 ?auto_315783 ) ( ON ?auto_315785 ?auto_315784 ) ( ON ?auto_315786 ?auto_315785 ) ( not ( = ?auto_315778 ?auto_315779 ) ) ( not ( = ?auto_315778 ?auto_315780 ) ) ( not ( = ?auto_315778 ?auto_315781 ) ) ( not ( = ?auto_315778 ?auto_315782 ) ) ( not ( = ?auto_315778 ?auto_315783 ) ) ( not ( = ?auto_315778 ?auto_315784 ) ) ( not ( = ?auto_315778 ?auto_315785 ) ) ( not ( = ?auto_315778 ?auto_315786 ) ) ( not ( = ?auto_315778 ?auto_315787 ) ) ( not ( = ?auto_315778 ?auto_315788 ) ) ( not ( = ?auto_315778 ?auto_315789 ) ) ( not ( = ?auto_315778 ?auto_315790 ) ) ( not ( = ?auto_315779 ?auto_315780 ) ) ( not ( = ?auto_315779 ?auto_315781 ) ) ( not ( = ?auto_315779 ?auto_315782 ) ) ( not ( = ?auto_315779 ?auto_315783 ) ) ( not ( = ?auto_315779 ?auto_315784 ) ) ( not ( = ?auto_315779 ?auto_315785 ) ) ( not ( = ?auto_315779 ?auto_315786 ) ) ( not ( = ?auto_315779 ?auto_315787 ) ) ( not ( = ?auto_315779 ?auto_315788 ) ) ( not ( = ?auto_315779 ?auto_315789 ) ) ( not ( = ?auto_315779 ?auto_315790 ) ) ( not ( = ?auto_315780 ?auto_315781 ) ) ( not ( = ?auto_315780 ?auto_315782 ) ) ( not ( = ?auto_315780 ?auto_315783 ) ) ( not ( = ?auto_315780 ?auto_315784 ) ) ( not ( = ?auto_315780 ?auto_315785 ) ) ( not ( = ?auto_315780 ?auto_315786 ) ) ( not ( = ?auto_315780 ?auto_315787 ) ) ( not ( = ?auto_315780 ?auto_315788 ) ) ( not ( = ?auto_315780 ?auto_315789 ) ) ( not ( = ?auto_315780 ?auto_315790 ) ) ( not ( = ?auto_315781 ?auto_315782 ) ) ( not ( = ?auto_315781 ?auto_315783 ) ) ( not ( = ?auto_315781 ?auto_315784 ) ) ( not ( = ?auto_315781 ?auto_315785 ) ) ( not ( = ?auto_315781 ?auto_315786 ) ) ( not ( = ?auto_315781 ?auto_315787 ) ) ( not ( = ?auto_315781 ?auto_315788 ) ) ( not ( = ?auto_315781 ?auto_315789 ) ) ( not ( = ?auto_315781 ?auto_315790 ) ) ( not ( = ?auto_315782 ?auto_315783 ) ) ( not ( = ?auto_315782 ?auto_315784 ) ) ( not ( = ?auto_315782 ?auto_315785 ) ) ( not ( = ?auto_315782 ?auto_315786 ) ) ( not ( = ?auto_315782 ?auto_315787 ) ) ( not ( = ?auto_315782 ?auto_315788 ) ) ( not ( = ?auto_315782 ?auto_315789 ) ) ( not ( = ?auto_315782 ?auto_315790 ) ) ( not ( = ?auto_315783 ?auto_315784 ) ) ( not ( = ?auto_315783 ?auto_315785 ) ) ( not ( = ?auto_315783 ?auto_315786 ) ) ( not ( = ?auto_315783 ?auto_315787 ) ) ( not ( = ?auto_315783 ?auto_315788 ) ) ( not ( = ?auto_315783 ?auto_315789 ) ) ( not ( = ?auto_315783 ?auto_315790 ) ) ( not ( = ?auto_315784 ?auto_315785 ) ) ( not ( = ?auto_315784 ?auto_315786 ) ) ( not ( = ?auto_315784 ?auto_315787 ) ) ( not ( = ?auto_315784 ?auto_315788 ) ) ( not ( = ?auto_315784 ?auto_315789 ) ) ( not ( = ?auto_315784 ?auto_315790 ) ) ( not ( = ?auto_315785 ?auto_315786 ) ) ( not ( = ?auto_315785 ?auto_315787 ) ) ( not ( = ?auto_315785 ?auto_315788 ) ) ( not ( = ?auto_315785 ?auto_315789 ) ) ( not ( = ?auto_315785 ?auto_315790 ) ) ( not ( = ?auto_315786 ?auto_315787 ) ) ( not ( = ?auto_315786 ?auto_315788 ) ) ( not ( = ?auto_315786 ?auto_315789 ) ) ( not ( = ?auto_315786 ?auto_315790 ) ) ( not ( = ?auto_315787 ?auto_315788 ) ) ( not ( = ?auto_315787 ?auto_315789 ) ) ( not ( = ?auto_315787 ?auto_315790 ) ) ( not ( = ?auto_315788 ?auto_315789 ) ) ( not ( = ?auto_315788 ?auto_315790 ) ) ( not ( = ?auto_315789 ?auto_315790 ) ) ( ON ?auto_315788 ?auto_315789 ) ( CLEAR ?auto_315786 ) ( ON ?auto_315787 ?auto_315788 ) ( CLEAR ?auto_315787 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_315778 ?auto_315779 ?auto_315780 ?auto_315781 ?auto_315782 ?auto_315783 ?auto_315784 ?auto_315785 ?auto_315786 ?auto_315787 )
      ( MAKE-12PILE ?auto_315778 ?auto_315779 ?auto_315780 ?auto_315781 ?auto_315782 ?auto_315783 ?auto_315784 ?auto_315785 ?auto_315786 ?auto_315787 ?auto_315788 ?auto_315789 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_315803 - BLOCK
      ?auto_315804 - BLOCK
      ?auto_315805 - BLOCK
      ?auto_315806 - BLOCK
      ?auto_315807 - BLOCK
      ?auto_315808 - BLOCK
      ?auto_315809 - BLOCK
      ?auto_315810 - BLOCK
      ?auto_315811 - BLOCK
      ?auto_315812 - BLOCK
      ?auto_315813 - BLOCK
      ?auto_315814 - BLOCK
    )
    :vars
    (
      ?auto_315815 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_315814 ?auto_315815 ) ( ON-TABLE ?auto_315803 ) ( ON ?auto_315804 ?auto_315803 ) ( ON ?auto_315805 ?auto_315804 ) ( ON ?auto_315806 ?auto_315805 ) ( ON ?auto_315807 ?auto_315806 ) ( ON ?auto_315808 ?auto_315807 ) ( ON ?auto_315809 ?auto_315808 ) ( ON ?auto_315810 ?auto_315809 ) ( not ( = ?auto_315803 ?auto_315804 ) ) ( not ( = ?auto_315803 ?auto_315805 ) ) ( not ( = ?auto_315803 ?auto_315806 ) ) ( not ( = ?auto_315803 ?auto_315807 ) ) ( not ( = ?auto_315803 ?auto_315808 ) ) ( not ( = ?auto_315803 ?auto_315809 ) ) ( not ( = ?auto_315803 ?auto_315810 ) ) ( not ( = ?auto_315803 ?auto_315811 ) ) ( not ( = ?auto_315803 ?auto_315812 ) ) ( not ( = ?auto_315803 ?auto_315813 ) ) ( not ( = ?auto_315803 ?auto_315814 ) ) ( not ( = ?auto_315803 ?auto_315815 ) ) ( not ( = ?auto_315804 ?auto_315805 ) ) ( not ( = ?auto_315804 ?auto_315806 ) ) ( not ( = ?auto_315804 ?auto_315807 ) ) ( not ( = ?auto_315804 ?auto_315808 ) ) ( not ( = ?auto_315804 ?auto_315809 ) ) ( not ( = ?auto_315804 ?auto_315810 ) ) ( not ( = ?auto_315804 ?auto_315811 ) ) ( not ( = ?auto_315804 ?auto_315812 ) ) ( not ( = ?auto_315804 ?auto_315813 ) ) ( not ( = ?auto_315804 ?auto_315814 ) ) ( not ( = ?auto_315804 ?auto_315815 ) ) ( not ( = ?auto_315805 ?auto_315806 ) ) ( not ( = ?auto_315805 ?auto_315807 ) ) ( not ( = ?auto_315805 ?auto_315808 ) ) ( not ( = ?auto_315805 ?auto_315809 ) ) ( not ( = ?auto_315805 ?auto_315810 ) ) ( not ( = ?auto_315805 ?auto_315811 ) ) ( not ( = ?auto_315805 ?auto_315812 ) ) ( not ( = ?auto_315805 ?auto_315813 ) ) ( not ( = ?auto_315805 ?auto_315814 ) ) ( not ( = ?auto_315805 ?auto_315815 ) ) ( not ( = ?auto_315806 ?auto_315807 ) ) ( not ( = ?auto_315806 ?auto_315808 ) ) ( not ( = ?auto_315806 ?auto_315809 ) ) ( not ( = ?auto_315806 ?auto_315810 ) ) ( not ( = ?auto_315806 ?auto_315811 ) ) ( not ( = ?auto_315806 ?auto_315812 ) ) ( not ( = ?auto_315806 ?auto_315813 ) ) ( not ( = ?auto_315806 ?auto_315814 ) ) ( not ( = ?auto_315806 ?auto_315815 ) ) ( not ( = ?auto_315807 ?auto_315808 ) ) ( not ( = ?auto_315807 ?auto_315809 ) ) ( not ( = ?auto_315807 ?auto_315810 ) ) ( not ( = ?auto_315807 ?auto_315811 ) ) ( not ( = ?auto_315807 ?auto_315812 ) ) ( not ( = ?auto_315807 ?auto_315813 ) ) ( not ( = ?auto_315807 ?auto_315814 ) ) ( not ( = ?auto_315807 ?auto_315815 ) ) ( not ( = ?auto_315808 ?auto_315809 ) ) ( not ( = ?auto_315808 ?auto_315810 ) ) ( not ( = ?auto_315808 ?auto_315811 ) ) ( not ( = ?auto_315808 ?auto_315812 ) ) ( not ( = ?auto_315808 ?auto_315813 ) ) ( not ( = ?auto_315808 ?auto_315814 ) ) ( not ( = ?auto_315808 ?auto_315815 ) ) ( not ( = ?auto_315809 ?auto_315810 ) ) ( not ( = ?auto_315809 ?auto_315811 ) ) ( not ( = ?auto_315809 ?auto_315812 ) ) ( not ( = ?auto_315809 ?auto_315813 ) ) ( not ( = ?auto_315809 ?auto_315814 ) ) ( not ( = ?auto_315809 ?auto_315815 ) ) ( not ( = ?auto_315810 ?auto_315811 ) ) ( not ( = ?auto_315810 ?auto_315812 ) ) ( not ( = ?auto_315810 ?auto_315813 ) ) ( not ( = ?auto_315810 ?auto_315814 ) ) ( not ( = ?auto_315810 ?auto_315815 ) ) ( not ( = ?auto_315811 ?auto_315812 ) ) ( not ( = ?auto_315811 ?auto_315813 ) ) ( not ( = ?auto_315811 ?auto_315814 ) ) ( not ( = ?auto_315811 ?auto_315815 ) ) ( not ( = ?auto_315812 ?auto_315813 ) ) ( not ( = ?auto_315812 ?auto_315814 ) ) ( not ( = ?auto_315812 ?auto_315815 ) ) ( not ( = ?auto_315813 ?auto_315814 ) ) ( not ( = ?auto_315813 ?auto_315815 ) ) ( not ( = ?auto_315814 ?auto_315815 ) ) ( ON ?auto_315813 ?auto_315814 ) ( ON ?auto_315812 ?auto_315813 ) ( CLEAR ?auto_315810 ) ( ON ?auto_315811 ?auto_315812 ) ( CLEAR ?auto_315811 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_315803 ?auto_315804 ?auto_315805 ?auto_315806 ?auto_315807 ?auto_315808 ?auto_315809 ?auto_315810 ?auto_315811 )
      ( MAKE-12PILE ?auto_315803 ?auto_315804 ?auto_315805 ?auto_315806 ?auto_315807 ?auto_315808 ?auto_315809 ?auto_315810 ?auto_315811 ?auto_315812 ?auto_315813 ?auto_315814 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_315828 - BLOCK
      ?auto_315829 - BLOCK
      ?auto_315830 - BLOCK
      ?auto_315831 - BLOCK
      ?auto_315832 - BLOCK
      ?auto_315833 - BLOCK
      ?auto_315834 - BLOCK
      ?auto_315835 - BLOCK
      ?auto_315836 - BLOCK
      ?auto_315837 - BLOCK
      ?auto_315838 - BLOCK
      ?auto_315839 - BLOCK
    )
    :vars
    (
      ?auto_315840 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_315839 ?auto_315840 ) ( ON-TABLE ?auto_315828 ) ( ON ?auto_315829 ?auto_315828 ) ( ON ?auto_315830 ?auto_315829 ) ( ON ?auto_315831 ?auto_315830 ) ( ON ?auto_315832 ?auto_315831 ) ( ON ?auto_315833 ?auto_315832 ) ( ON ?auto_315834 ?auto_315833 ) ( ON ?auto_315835 ?auto_315834 ) ( not ( = ?auto_315828 ?auto_315829 ) ) ( not ( = ?auto_315828 ?auto_315830 ) ) ( not ( = ?auto_315828 ?auto_315831 ) ) ( not ( = ?auto_315828 ?auto_315832 ) ) ( not ( = ?auto_315828 ?auto_315833 ) ) ( not ( = ?auto_315828 ?auto_315834 ) ) ( not ( = ?auto_315828 ?auto_315835 ) ) ( not ( = ?auto_315828 ?auto_315836 ) ) ( not ( = ?auto_315828 ?auto_315837 ) ) ( not ( = ?auto_315828 ?auto_315838 ) ) ( not ( = ?auto_315828 ?auto_315839 ) ) ( not ( = ?auto_315828 ?auto_315840 ) ) ( not ( = ?auto_315829 ?auto_315830 ) ) ( not ( = ?auto_315829 ?auto_315831 ) ) ( not ( = ?auto_315829 ?auto_315832 ) ) ( not ( = ?auto_315829 ?auto_315833 ) ) ( not ( = ?auto_315829 ?auto_315834 ) ) ( not ( = ?auto_315829 ?auto_315835 ) ) ( not ( = ?auto_315829 ?auto_315836 ) ) ( not ( = ?auto_315829 ?auto_315837 ) ) ( not ( = ?auto_315829 ?auto_315838 ) ) ( not ( = ?auto_315829 ?auto_315839 ) ) ( not ( = ?auto_315829 ?auto_315840 ) ) ( not ( = ?auto_315830 ?auto_315831 ) ) ( not ( = ?auto_315830 ?auto_315832 ) ) ( not ( = ?auto_315830 ?auto_315833 ) ) ( not ( = ?auto_315830 ?auto_315834 ) ) ( not ( = ?auto_315830 ?auto_315835 ) ) ( not ( = ?auto_315830 ?auto_315836 ) ) ( not ( = ?auto_315830 ?auto_315837 ) ) ( not ( = ?auto_315830 ?auto_315838 ) ) ( not ( = ?auto_315830 ?auto_315839 ) ) ( not ( = ?auto_315830 ?auto_315840 ) ) ( not ( = ?auto_315831 ?auto_315832 ) ) ( not ( = ?auto_315831 ?auto_315833 ) ) ( not ( = ?auto_315831 ?auto_315834 ) ) ( not ( = ?auto_315831 ?auto_315835 ) ) ( not ( = ?auto_315831 ?auto_315836 ) ) ( not ( = ?auto_315831 ?auto_315837 ) ) ( not ( = ?auto_315831 ?auto_315838 ) ) ( not ( = ?auto_315831 ?auto_315839 ) ) ( not ( = ?auto_315831 ?auto_315840 ) ) ( not ( = ?auto_315832 ?auto_315833 ) ) ( not ( = ?auto_315832 ?auto_315834 ) ) ( not ( = ?auto_315832 ?auto_315835 ) ) ( not ( = ?auto_315832 ?auto_315836 ) ) ( not ( = ?auto_315832 ?auto_315837 ) ) ( not ( = ?auto_315832 ?auto_315838 ) ) ( not ( = ?auto_315832 ?auto_315839 ) ) ( not ( = ?auto_315832 ?auto_315840 ) ) ( not ( = ?auto_315833 ?auto_315834 ) ) ( not ( = ?auto_315833 ?auto_315835 ) ) ( not ( = ?auto_315833 ?auto_315836 ) ) ( not ( = ?auto_315833 ?auto_315837 ) ) ( not ( = ?auto_315833 ?auto_315838 ) ) ( not ( = ?auto_315833 ?auto_315839 ) ) ( not ( = ?auto_315833 ?auto_315840 ) ) ( not ( = ?auto_315834 ?auto_315835 ) ) ( not ( = ?auto_315834 ?auto_315836 ) ) ( not ( = ?auto_315834 ?auto_315837 ) ) ( not ( = ?auto_315834 ?auto_315838 ) ) ( not ( = ?auto_315834 ?auto_315839 ) ) ( not ( = ?auto_315834 ?auto_315840 ) ) ( not ( = ?auto_315835 ?auto_315836 ) ) ( not ( = ?auto_315835 ?auto_315837 ) ) ( not ( = ?auto_315835 ?auto_315838 ) ) ( not ( = ?auto_315835 ?auto_315839 ) ) ( not ( = ?auto_315835 ?auto_315840 ) ) ( not ( = ?auto_315836 ?auto_315837 ) ) ( not ( = ?auto_315836 ?auto_315838 ) ) ( not ( = ?auto_315836 ?auto_315839 ) ) ( not ( = ?auto_315836 ?auto_315840 ) ) ( not ( = ?auto_315837 ?auto_315838 ) ) ( not ( = ?auto_315837 ?auto_315839 ) ) ( not ( = ?auto_315837 ?auto_315840 ) ) ( not ( = ?auto_315838 ?auto_315839 ) ) ( not ( = ?auto_315838 ?auto_315840 ) ) ( not ( = ?auto_315839 ?auto_315840 ) ) ( ON ?auto_315838 ?auto_315839 ) ( ON ?auto_315837 ?auto_315838 ) ( CLEAR ?auto_315835 ) ( ON ?auto_315836 ?auto_315837 ) ( CLEAR ?auto_315836 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_315828 ?auto_315829 ?auto_315830 ?auto_315831 ?auto_315832 ?auto_315833 ?auto_315834 ?auto_315835 ?auto_315836 )
      ( MAKE-12PILE ?auto_315828 ?auto_315829 ?auto_315830 ?auto_315831 ?auto_315832 ?auto_315833 ?auto_315834 ?auto_315835 ?auto_315836 ?auto_315837 ?auto_315838 ?auto_315839 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_315853 - BLOCK
      ?auto_315854 - BLOCK
      ?auto_315855 - BLOCK
      ?auto_315856 - BLOCK
      ?auto_315857 - BLOCK
      ?auto_315858 - BLOCK
      ?auto_315859 - BLOCK
      ?auto_315860 - BLOCK
      ?auto_315861 - BLOCK
      ?auto_315862 - BLOCK
      ?auto_315863 - BLOCK
      ?auto_315864 - BLOCK
    )
    :vars
    (
      ?auto_315865 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_315864 ?auto_315865 ) ( ON-TABLE ?auto_315853 ) ( ON ?auto_315854 ?auto_315853 ) ( ON ?auto_315855 ?auto_315854 ) ( ON ?auto_315856 ?auto_315855 ) ( ON ?auto_315857 ?auto_315856 ) ( ON ?auto_315858 ?auto_315857 ) ( ON ?auto_315859 ?auto_315858 ) ( not ( = ?auto_315853 ?auto_315854 ) ) ( not ( = ?auto_315853 ?auto_315855 ) ) ( not ( = ?auto_315853 ?auto_315856 ) ) ( not ( = ?auto_315853 ?auto_315857 ) ) ( not ( = ?auto_315853 ?auto_315858 ) ) ( not ( = ?auto_315853 ?auto_315859 ) ) ( not ( = ?auto_315853 ?auto_315860 ) ) ( not ( = ?auto_315853 ?auto_315861 ) ) ( not ( = ?auto_315853 ?auto_315862 ) ) ( not ( = ?auto_315853 ?auto_315863 ) ) ( not ( = ?auto_315853 ?auto_315864 ) ) ( not ( = ?auto_315853 ?auto_315865 ) ) ( not ( = ?auto_315854 ?auto_315855 ) ) ( not ( = ?auto_315854 ?auto_315856 ) ) ( not ( = ?auto_315854 ?auto_315857 ) ) ( not ( = ?auto_315854 ?auto_315858 ) ) ( not ( = ?auto_315854 ?auto_315859 ) ) ( not ( = ?auto_315854 ?auto_315860 ) ) ( not ( = ?auto_315854 ?auto_315861 ) ) ( not ( = ?auto_315854 ?auto_315862 ) ) ( not ( = ?auto_315854 ?auto_315863 ) ) ( not ( = ?auto_315854 ?auto_315864 ) ) ( not ( = ?auto_315854 ?auto_315865 ) ) ( not ( = ?auto_315855 ?auto_315856 ) ) ( not ( = ?auto_315855 ?auto_315857 ) ) ( not ( = ?auto_315855 ?auto_315858 ) ) ( not ( = ?auto_315855 ?auto_315859 ) ) ( not ( = ?auto_315855 ?auto_315860 ) ) ( not ( = ?auto_315855 ?auto_315861 ) ) ( not ( = ?auto_315855 ?auto_315862 ) ) ( not ( = ?auto_315855 ?auto_315863 ) ) ( not ( = ?auto_315855 ?auto_315864 ) ) ( not ( = ?auto_315855 ?auto_315865 ) ) ( not ( = ?auto_315856 ?auto_315857 ) ) ( not ( = ?auto_315856 ?auto_315858 ) ) ( not ( = ?auto_315856 ?auto_315859 ) ) ( not ( = ?auto_315856 ?auto_315860 ) ) ( not ( = ?auto_315856 ?auto_315861 ) ) ( not ( = ?auto_315856 ?auto_315862 ) ) ( not ( = ?auto_315856 ?auto_315863 ) ) ( not ( = ?auto_315856 ?auto_315864 ) ) ( not ( = ?auto_315856 ?auto_315865 ) ) ( not ( = ?auto_315857 ?auto_315858 ) ) ( not ( = ?auto_315857 ?auto_315859 ) ) ( not ( = ?auto_315857 ?auto_315860 ) ) ( not ( = ?auto_315857 ?auto_315861 ) ) ( not ( = ?auto_315857 ?auto_315862 ) ) ( not ( = ?auto_315857 ?auto_315863 ) ) ( not ( = ?auto_315857 ?auto_315864 ) ) ( not ( = ?auto_315857 ?auto_315865 ) ) ( not ( = ?auto_315858 ?auto_315859 ) ) ( not ( = ?auto_315858 ?auto_315860 ) ) ( not ( = ?auto_315858 ?auto_315861 ) ) ( not ( = ?auto_315858 ?auto_315862 ) ) ( not ( = ?auto_315858 ?auto_315863 ) ) ( not ( = ?auto_315858 ?auto_315864 ) ) ( not ( = ?auto_315858 ?auto_315865 ) ) ( not ( = ?auto_315859 ?auto_315860 ) ) ( not ( = ?auto_315859 ?auto_315861 ) ) ( not ( = ?auto_315859 ?auto_315862 ) ) ( not ( = ?auto_315859 ?auto_315863 ) ) ( not ( = ?auto_315859 ?auto_315864 ) ) ( not ( = ?auto_315859 ?auto_315865 ) ) ( not ( = ?auto_315860 ?auto_315861 ) ) ( not ( = ?auto_315860 ?auto_315862 ) ) ( not ( = ?auto_315860 ?auto_315863 ) ) ( not ( = ?auto_315860 ?auto_315864 ) ) ( not ( = ?auto_315860 ?auto_315865 ) ) ( not ( = ?auto_315861 ?auto_315862 ) ) ( not ( = ?auto_315861 ?auto_315863 ) ) ( not ( = ?auto_315861 ?auto_315864 ) ) ( not ( = ?auto_315861 ?auto_315865 ) ) ( not ( = ?auto_315862 ?auto_315863 ) ) ( not ( = ?auto_315862 ?auto_315864 ) ) ( not ( = ?auto_315862 ?auto_315865 ) ) ( not ( = ?auto_315863 ?auto_315864 ) ) ( not ( = ?auto_315863 ?auto_315865 ) ) ( not ( = ?auto_315864 ?auto_315865 ) ) ( ON ?auto_315863 ?auto_315864 ) ( ON ?auto_315862 ?auto_315863 ) ( ON ?auto_315861 ?auto_315862 ) ( CLEAR ?auto_315859 ) ( ON ?auto_315860 ?auto_315861 ) ( CLEAR ?auto_315860 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_315853 ?auto_315854 ?auto_315855 ?auto_315856 ?auto_315857 ?auto_315858 ?auto_315859 ?auto_315860 )
      ( MAKE-12PILE ?auto_315853 ?auto_315854 ?auto_315855 ?auto_315856 ?auto_315857 ?auto_315858 ?auto_315859 ?auto_315860 ?auto_315861 ?auto_315862 ?auto_315863 ?auto_315864 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_315878 - BLOCK
      ?auto_315879 - BLOCK
      ?auto_315880 - BLOCK
      ?auto_315881 - BLOCK
      ?auto_315882 - BLOCK
      ?auto_315883 - BLOCK
      ?auto_315884 - BLOCK
      ?auto_315885 - BLOCK
      ?auto_315886 - BLOCK
      ?auto_315887 - BLOCK
      ?auto_315888 - BLOCK
      ?auto_315889 - BLOCK
    )
    :vars
    (
      ?auto_315890 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_315889 ?auto_315890 ) ( ON-TABLE ?auto_315878 ) ( ON ?auto_315879 ?auto_315878 ) ( ON ?auto_315880 ?auto_315879 ) ( ON ?auto_315881 ?auto_315880 ) ( ON ?auto_315882 ?auto_315881 ) ( ON ?auto_315883 ?auto_315882 ) ( ON ?auto_315884 ?auto_315883 ) ( not ( = ?auto_315878 ?auto_315879 ) ) ( not ( = ?auto_315878 ?auto_315880 ) ) ( not ( = ?auto_315878 ?auto_315881 ) ) ( not ( = ?auto_315878 ?auto_315882 ) ) ( not ( = ?auto_315878 ?auto_315883 ) ) ( not ( = ?auto_315878 ?auto_315884 ) ) ( not ( = ?auto_315878 ?auto_315885 ) ) ( not ( = ?auto_315878 ?auto_315886 ) ) ( not ( = ?auto_315878 ?auto_315887 ) ) ( not ( = ?auto_315878 ?auto_315888 ) ) ( not ( = ?auto_315878 ?auto_315889 ) ) ( not ( = ?auto_315878 ?auto_315890 ) ) ( not ( = ?auto_315879 ?auto_315880 ) ) ( not ( = ?auto_315879 ?auto_315881 ) ) ( not ( = ?auto_315879 ?auto_315882 ) ) ( not ( = ?auto_315879 ?auto_315883 ) ) ( not ( = ?auto_315879 ?auto_315884 ) ) ( not ( = ?auto_315879 ?auto_315885 ) ) ( not ( = ?auto_315879 ?auto_315886 ) ) ( not ( = ?auto_315879 ?auto_315887 ) ) ( not ( = ?auto_315879 ?auto_315888 ) ) ( not ( = ?auto_315879 ?auto_315889 ) ) ( not ( = ?auto_315879 ?auto_315890 ) ) ( not ( = ?auto_315880 ?auto_315881 ) ) ( not ( = ?auto_315880 ?auto_315882 ) ) ( not ( = ?auto_315880 ?auto_315883 ) ) ( not ( = ?auto_315880 ?auto_315884 ) ) ( not ( = ?auto_315880 ?auto_315885 ) ) ( not ( = ?auto_315880 ?auto_315886 ) ) ( not ( = ?auto_315880 ?auto_315887 ) ) ( not ( = ?auto_315880 ?auto_315888 ) ) ( not ( = ?auto_315880 ?auto_315889 ) ) ( not ( = ?auto_315880 ?auto_315890 ) ) ( not ( = ?auto_315881 ?auto_315882 ) ) ( not ( = ?auto_315881 ?auto_315883 ) ) ( not ( = ?auto_315881 ?auto_315884 ) ) ( not ( = ?auto_315881 ?auto_315885 ) ) ( not ( = ?auto_315881 ?auto_315886 ) ) ( not ( = ?auto_315881 ?auto_315887 ) ) ( not ( = ?auto_315881 ?auto_315888 ) ) ( not ( = ?auto_315881 ?auto_315889 ) ) ( not ( = ?auto_315881 ?auto_315890 ) ) ( not ( = ?auto_315882 ?auto_315883 ) ) ( not ( = ?auto_315882 ?auto_315884 ) ) ( not ( = ?auto_315882 ?auto_315885 ) ) ( not ( = ?auto_315882 ?auto_315886 ) ) ( not ( = ?auto_315882 ?auto_315887 ) ) ( not ( = ?auto_315882 ?auto_315888 ) ) ( not ( = ?auto_315882 ?auto_315889 ) ) ( not ( = ?auto_315882 ?auto_315890 ) ) ( not ( = ?auto_315883 ?auto_315884 ) ) ( not ( = ?auto_315883 ?auto_315885 ) ) ( not ( = ?auto_315883 ?auto_315886 ) ) ( not ( = ?auto_315883 ?auto_315887 ) ) ( not ( = ?auto_315883 ?auto_315888 ) ) ( not ( = ?auto_315883 ?auto_315889 ) ) ( not ( = ?auto_315883 ?auto_315890 ) ) ( not ( = ?auto_315884 ?auto_315885 ) ) ( not ( = ?auto_315884 ?auto_315886 ) ) ( not ( = ?auto_315884 ?auto_315887 ) ) ( not ( = ?auto_315884 ?auto_315888 ) ) ( not ( = ?auto_315884 ?auto_315889 ) ) ( not ( = ?auto_315884 ?auto_315890 ) ) ( not ( = ?auto_315885 ?auto_315886 ) ) ( not ( = ?auto_315885 ?auto_315887 ) ) ( not ( = ?auto_315885 ?auto_315888 ) ) ( not ( = ?auto_315885 ?auto_315889 ) ) ( not ( = ?auto_315885 ?auto_315890 ) ) ( not ( = ?auto_315886 ?auto_315887 ) ) ( not ( = ?auto_315886 ?auto_315888 ) ) ( not ( = ?auto_315886 ?auto_315889 ) ) ( not ( = ?auto_315886 ?auto_315890 ) ) ( not ( = ?auto_315887 ?auto_315888 ) ) ( not ( = ?auto_315887 ?auto_315889 ) ) ( not ( = ?auto_315887 ?auto_315890 ) ) ( not ( = ?auto_315888 ?auto_315889 ) ) ( not ( = ?auto_315888 ?auto_315890 ) ) ( not ( = ?auto_315889 ?auto_315890 ) ) ( ON ?auto_315888 ?auto_315889 ) ( ON ?auto_315887 ?auto_315888 ) ( ON ?auto_315886 ?auto_315887 ) ( CLEAR ?auto_315884 ) ( ON ?auto_315885 ?auto_315886 ) ( CLEAR ?auto_315885 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_315878 ?auto_315879 ?auto_315880 ?auto_315881 ?auto_315882 ?auto_315883 ?auto_315884 ?auto_315885 )
      ( MAKE-12PILE ?auto_315878 ?auto_315879 ?auto_315880 ?auto_315881 ?auto_315882 ?auto_315883 ?auto_315884 ?auto_315885 ?auto_315886 ?auto_315887 ?auto_315888 ?auto_315889 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_315903 - BLOCK
      ?auto_315904 - BLOCK
      ?auto_315905 - BLOCK
      ?auto_315906 - BLOCK
      ?auto_315907 - BLOCK
      ?auto_315908 - BLOCK
      ?auto_315909 - BLOCK
      ?auto_315910 - BLOCK
      ?auto_315911 - BLOCK
      ?auto_315912 - BLOCK
      ?auto_315913 - BLOCK
      ?auto_315914 - BLOCK
    )
    :vars
    (
      ?auto_315915 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_315914 ?auto_315915 ) ( ON-TABLE ?auto_315903 ) ( ON ?auto_315904 ?auto_315903 ) ( ON ?auto_315905 ?auto_315904 ) ( ON ?auto_315906 ?auto_315905 ) ( ON ?auto_315907 ?auto_315906 ) ( ON ?auto_315908 ?auto_315907 ) ( not ( = ?auto_315903 ?auto_315904 ) ) ( not ( = ?auto_315903 ?auto_315905 ) ) ( not ( = ?auto_315903 ?auto_315906 ) ) ( not ( = ?auto_315903 ?auto_315907 ) ) ( not ( = ?auto_315903 ?auto_315908 ) ) ( not ( = ?auto_315903 ?auto_315909 ) ) ( not ( = ?auto_315903 ?auto_315910 ) ) ( not ( = ?auto_315903 ?auto_315911 ) ) ( not ( = ?auto_315903 ?auto_315912 ) ) ( not ( = ?auto_315903 ?auto_315913 ) ) ( not ( = ?auto_315903 ?auto_315914 ) ) ( not ( = ?auto_315903 ?auto_315915 ) ) ( not ( = ?auto_315904 ?auto_315905 ) ) ( not ( = ?auto_315904 ?auto_315906 ) ) ( not ( = ?auto_315904 ?auto_315907 ) ) ( not ( = ?auto_315904 ?auto_315908 ) ) ( not ( = ?auto_315904 ?auto_315909 ) ) ( not ( = ?auto_315904 ?auto_315910 ) ) ( not ( = ?auto_315904 ?auto_315911 ) ) ( not ( = ?auto_315904 ?auto_315912 ) ) ( not ( = ?auto_315904 ?auto_315913 ) ) ( not ( = ?auto_315904 ?auto_315914 ) ) ( not ( = ?auto_315904 ?auto_315915 ) ) ( not ( = ?auto_315905 ?auto_315906 ) ) ( not ( = ?auto_315905 ?auto_315907 ) ) ( not ( = ?auto_315905 ?auto_315908 ) ) ( not ( = ?auto_315905 ?auto_315909 ) ) ( not ( = ?auto_315905 ?auto_315910 ) ) ( not ( = ?auto_315905 ?auto_315911 ) ) ( not ( = ?auto_315905 ?auto_315912 ) ) ( not ( = ?auto_315905 ?auto_315913 ) ) ( not ( = ?auto_315905 ?auto_315914 ) ) ( not ( = ?auto_315905 ?auto_315915 ) ) ( not ( = ?auto_315906 ?auto_315907 ) ) ( not ( = ?auto_315906 ?auto_315908 ) ) ( not ( = ?auto_315906 ?auto_315909 ) ) ( not ( = ?auto_315906 ?auto_315910 ) ) ( not ( = ?auto_315906 ?auto_315911 ) ) ( not ( = ?auto_315906 ?auto_315912 ) ) ( not ( = ?auto_315906 ?auto_315913 ) ) ( not ( = ?auto_315906 ?auto_315914 ) ) ( not ( = ?auto_315906 ?auto_315915 ) ) ( not ( = ?auto_315907 ?auto_315908 ) ) ( not ( = ?auto_315907 ?auto_315909 ) ) ( not ( = ?auto_315907 ?auto_315910 ) ) ( not ( = ?auto_315907 ?auto_315911 ) ) ( not ( = ?auto_315907 ?auto_315912 ) ) ( not ( = ?auto_315907 ?auto_315913 ) ) ( not ( = ?auto_315907 ?auto_315914 ) ) ( not ( = ?auto_315907 ?auto_315915 ) ) ( not ( = ?auto_315908 ?auto_315909 ) ) ( not ( = ?auto_315908 ?auto_315910 ) ) ( not ( = ?auto_315908 ?auto_315911 ) ) ( not ( = ?auto_315908 ?auto_315912 ) ) ( not ( = ?auto_315908 ?auto_315913 ) ) ( not ( = ?auto_315908 ?auto_315914 ) ) ( not ( = ?auto_315908 ?auto_315915 ) ) ( not ( = ?auto_315909 ?auto_315910 ) ) ( not ( = ?auto_315909 ?auto_315911 ) ) ( not ( = ?auto_315909 ?auto_315912 ) ) ( not ( = ?auto_315909 ?auto_315913 ) ) ( not ( = ?auto_315909 ?auto_315914 ) ) ( not ( = ?auto_315909 ?auto_315915 ) ) ( not ( = ?auto_315910 ?auto_315911 ) ) ( not ( = ?auto_315910 ?auto_315912 ) ) ( not ( = ?auto_315910 ?auto_315913 ) ) ( not ( = ?auto_315910 ?auto_315914 ) ) ( not ( = ?auto_315910 ?auto_315915 ) ) ( not ( = ?auto_315911 ?auto_315912 ) ) ( not ( = ?auto_315911 ?auto_315913 ) ) ( not ( = ?auto_315911 ?auto_315914 ) ) ( not ( = ?auto_315911 ?auto_315915 ) ) ( not ( = ?auto_315912 ?auto_315913 ) ) ( not ( = ?auto_315912 ?auto_315914 ) ) ( not ( = ?auto_315912 ?auto_315915 ) ) ( not ( = ?auto_315913 ?auto_315914 ) ) ( not ( = ?auto_315913 ?auto_315915 ) ) ( not ( = ?auto_315914 ?auto_315915 ) ) ( ON ?auto_315913 ?auto_315914 ) ( ON ?auto_315912 ?auto_315913 ) ( ON ?auto_315911 ?auto_315912 ) ( ON ?auto_315910 ?auto_315911 ) ( CLEAR ?auto_315908 ) ( ON ?auto_315909 ?auto_315910 ) ( CLEAR ?auto_315909 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_315903 ?auto_315904 ?auto_315905 ?auto_315906 ?auto_315907 ?auto_315908 ?auto_315909 )
      ( MAKE-12PILE ?auto_315903 ?auto_315904 ?auto_315905 ?auto_315906 ?auto_315907 ?auto_315908 ?auto_315909 ?auto_315910 ?auto_315911 ?auto_315912 ?auto_315913 ?auto_315914 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_315928 - BLOCK
      ?auto_315929 - BLOCK
      ?auto_315930 - BLOCK
      ?auto_315931 - BLOCK
      ?auto_315932 - BLOCK
      ?auto_315933 - BLOCK
      ?auto_315934 - BLOCK
      ?auto_315935 - BLOCK
      ?auto_315936 - BLOCK
      ?auto_315937 - BLOCK
      ?auto_315938 - BLOCK
      ?auto_315939 - BLOCK
    )
    :vars
    (
      ?auto_315940 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_315939 ?auto_315940 ) ( ON-TABLE ?auto_315928 ) ( ON ?auto_315929 ?auto_315928 ) ( ON ?auto_315930 ?auto_315929 ) ( ON ?auto_315931 ?auto_315930 ) ( ON ?auto_315932 ?auto_315931 ) ( ON ?auto_315933 ?auto_315932 ) ( not ( = ?auto_315928 ?auto_315929 ) ) ( not ( = ?auto_315928 ?auto_315930 ) ) ( not ( = ?auto_315928 ?auto_315931 ) ) ( not ( = ?auto_315928 ?auto_315932 ) ) ( not ( = ?auto_315928 ?auto_315933 ) ) ( not ( = ?auto_315928 ?auto_315934 ) ) ( not ( = ?auto_315928 ?auto_315935 ) ) ( not ( = ?auto_315928 ?auto_315936 ) ) ( not ( = ?auto_315928 ?auto_315937 ) ) ( not ( = ?auto_315928 ?auto_315938 ) ) ( not ( = ?auto_315928 ?auto_315939 ) ) ( not ( = ?auto_315928 ?auto_315940 ) ) ( not ( = ?auto_315929 ?auto_315930 ) ) ( not ( = ?auto_315929 ?auto_315931 ) ) ( not ( = ?auto_315929 ?auto_315932 ) ) ( not ( = ?auto_315929 ?auto_315933 ) ) ( not ( = ?auto_315929 ?auto_315934 ) ) ( not ( = ?auto_315929 ?auto_315935 ) ) ( not ( = ?auto_315929 ?auto_315936 ) ) ( not ( = ?auto_315929 ?auto_315937 ) ) ( not ( = ?auto_315929 ?auto_315938 ) ) ( not ( = ?auto_315929 ?auto_315939 ) ) ( not ( = ?auto_315929 ?auto_315940 ) ) ( not ( = ?auto_315930 ?auto_315931 ) ) ( not ( = ?auto_315930 ?auto_315932 ) ) ( not ( = ?auto_315930 ?auto_315933 ) ) ( not ( = ?auto_315930 ?auto_315934 ) ) ( not ( = ?auto_315930 ?auto_315935 ) ) ( not ( = ?auto_315930 ?auto_315936 ) ) ( not ( = ?auto_315930 ?auto_315937 ) ) ( not ( = ?auto_315930 ?auto_315938 ) ) ( not ( = ?auto_315930 ?auto_315939 ) ) ( not ( = ?auto_315930 ?auto_315940 ) ) ( not ( = ?auto_315931 ?auto_315932 ) ) ( not ( = ?auto_315931 ?auto_315933 ) ) ( not ( = ?auto_315931 ?auto_315934 ) ) ( not ( = ?auto_315931 ?auto_315935 ) ) ( not ( = ?auto_315931 ?auto_315936 ) ) ( not ( = ?auto_315931 ?auto_315937 ) ) ( not ( = ?auto_315931 ?auto_315938 ) ) ( not ( = ?auto_315931 ?auto_315939 ) ) ( not ( = ?auto_315931 ?auto_315940 ) ) ( not ( = ?auto_315932 ?auto_315933 ) ) ( not ( = ?auto_315932 ?auto_315934 ) ) ( not ( = ?auto_315932 ?auto_315935 ) ) ( not ( = ?auto_315932 ?auto_315936 ) ) ( not ( = ?auto_315932 ?auto_315937 ) ) ( not ( = ?auto_315932 ?auto_315938 ) ) ( not ( = ?auto_315932 ?auto_315939 ) ) ( not ( = ?auto_315932 ?auto_315940 ) ) ( not ( = ?auto_315933 ?auto_315934 ) ) ( not ( = ?auto_315933 ?auto_315935 ) ) ( not ( = ?auto_315933 ?auto_315936 ) ) ( not ( = ?auto_315933 ?auto_315937 ) ) ( not ( = ?auto_315933 ?auto_315938 ) ) ( not ( = ?auto_315933 ?auto_315939 ) ) ( not ( = ?auto_315933 ?auto_315940 ) ) ( not ( = ?auto_315934 ?auto_315935 ) ) ( not ( = ?auto_315934 ?auto_315936 ) ) ( not ( = ?auto_315934 ?auto_315937 ) ) ( not ( = ?auto_315934 ?auto_315938 ) ) ( not ( = ?auto_315934 ?auto_315939 ) ) ( not ( = ?auto_315934 ?auto_315940 ) ) ( not ( = ?auto_315935 ?auto_315936 ) ) ( not ( = ?auto_315935 ?auto_315937 ) ) ( not ( = ?auto_315935 ?auto_315938 ) ) ( not ( = ?auto_315935 ?auto_315939 ) ) ( not ( = ?auto_315935 ?auto_315940 ) ) ( not ( = ?auto_315936 ?auto_315937 ) ) ( not ( = ?auto_315936 ?auto_315938 ) ) ( not ( = ?auto_315936 ?auto_315939 ) ) ( not ( = ?auto_315936 ?auto_315940 ) ) ( not ( = ?auto_315937 ?auto_315938 ) ) ( not ( = ?auto_315937 ?auto_315939 ) ) ( not ( = ?auto_315937 ?auto_315940 ) ) ( not ( = ?auto_315938 ?auto_315939 ) ) ( not ( = ?auto_315938 ?auto_315940 ) ) ( not ( = ?auto_315939 ?auto_315940 ) ) ( ON ?auto_315938 ?auto_315939 ) ( ON ?auto_315937 ?auto_315938 ) ( ON ?auto_315936 ?auto_315937 ) ( ON ?auto_315935 ?auto_315936 ) ( CLEAR ?auto_315933 ) ( ON ?auto_315934 ?auto_315935 ) ( CLEAR ?auto_315934 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_315928 ?auto_315929 ?auto_315930 ?auto_315931 ?auto_315932 ?auto_315933 ?auto_315934 )
      ( MAKE-12PILE ?auto_315928 ?auto_315929 ?auto_315930 ?auto_315931 ?auto_315932 ?auto_315933 ?auto_315934 ?auto_315935 ?auto_315936 ?auto_315937 ?auto_315938 ?auto_315939 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_315953 - BLOCK
      ?auto_315954 - BLOCK
      ?auto_315955 - BLOCK
      ?auto_315956 - BLOCK
      ?auto_315957 - BLOCK
      ?auto_315958 - BLOCK
      ?auto_315959 - BLOCK
      ?auto_315960 - BLOCK
      ?auto_315961 - BLOCK
      ?auto_315962 - BLOCK
      ?auto_315963 - BLOCK
      ?auto_315964 - BLOCK
    )
    :vars
    (
      ?auto_315965 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_315964 ?auto_315965 ) ( ON-TABLE ?auto_315953 ) ( ON ?auto_315954 ?auto_315953 ) ( ON ?auto_315955 ?auto_315954 ) ( ON ?auto_315956 ?auto_315955 ) ( ON ?auto_315957 ?auto_315956 ) ( not ( = ?auto_315953 ?auto_315954 ) ) ( not ( = ?auto_315953 ?auto_315955 ) ) ( not ( = ?auto_315953 ?auto_315956 ) ) ( not ( = ?auto_315953 ?auto_315957 ) ) ( not ( = ?auto_315953 ?auto_315958 ) ) ( not ( = ?auto_315953 ?auto_315959 ) ) ( not ( = ?auto_315953 ?auto_315960 ) ) ( not ( = ?auto_315953 ?auto_315961 ) ) ( not ( = ?auto_315953 ?auto_315962 ) ) ( not ( = ?auto_315953 ?auto_315963 ) ) ( not ( = ?auto_315953 ?auto_315964 ) ) ( not ( = ?auto_315953 ?auto_315965 ) ) ( not ( = ?auto_315954 ?auto_315955 ) ) ( not ( = ?auto_315954 ?auto_315956 ) ) ( not ( = ?auto_315954 ?auto_315957 ) ) ( not ( = ?auto_315954 ?auto_315958 ) ) ( not ( = ?auto_315954 ?auto_315959 ) ) ( not ( = ?auto_315954 ?auto_315960 ) ) ( not ( = ?auto_315954 ?auto_315961 ) ) ( not ( = ?auto_315954 ?auto_315962 ) ) ( not ( = ?auto_315954 ?auto_315963 ) ) ( not ( = ?auto_315954 ?auto_315964 ) ) ( not ( = ?auto_315954 ?auto_315965 ) ) ( not ( = ?auto_315955 ?auto_315956 ) ) ( not ( = ?auto_315955 ?auto_315957 ) ) ( not ( = ?auto_315955 ?auto_315958 ) ) ( not ( = ?auto_315955 ?auto_315959 ) ) ( not ( = ?auto_315955 ?auto_315960 ) ) ( not ( = ?auto_315955 ?auto_315961 ) ) ( not ( = ?auto_315955 ?auto_315962 ) ) ( not ( = ?auto_315955 ?auto_315963 ) ) ( not ( = ?auto_315955 ?auto_315964 ) ) ( not ( = ?auto_315955 ?auto_315965 ) ) ( not ( = ?auto_315956 ?auto_315957 ) ) ( not ( = ?auto_315956 ?auto_315958 ) ) ( not ( = ?auto_315956 ?auto_315959 ) ) ( not ( = ?auto_315956 ?auto_315960 ) ) ( not ( = ?auto_315956 ?auto_315961 ) ) ( not ( = ?auto_315956 ?auto_315962 ) ) ( not ( = ?auto_315956 ?auto_315963 ) ) ( not ( = ?auto_315956 ?auto_315964 ) ) ( not ( = ?auto_315956 ?auto_315965 ) ) ( not ( = ?auto_315957 ?auto_315958 ) ) ( not ( = ?auto_315957 ?auto_315959 ) ) ( not ( = ?auto_315957 ?auto_315960 ) ) ( not ( = ?auto_315957 ?auto_315961 ) ) ( not ( = ?auto_315957 ?auto_315962 ) ) ( not ( = ?auto_315957 ?auto_315963 ) ) ( not ( = ?auto_315957 ?auto_315964 ) ) ( not ( = ?auto_315957 ?auto_315965 ) ) ( not ( = ?auto_315958 ?auto_315959 ) ) ( not ( = ?auto_315958 ?auto_315960 ) ) ( not ( = ?auto_315958 ?auto_315961 ) ) ( not ( = ?auto_315958 ?auto_315962 ) ) ( not ( = ?auto_315958 ?auto_315963 ) ) ( not ( = ?auto_315958 ?auto_315964 ) ) ( not ( = ?auto_315958 ?auto_315965 ) ) ( not ( = ?auto_315959 ?auto_315960 ) ) ( not ( = ?auto_315959 ?auto_315961 ) ) ( not ( = ?auto_315959 ?auto_315962 ) ) ( not ( = ?auto_315959 ?auto_315963 ) ) ( not ( = ?auto_315959 ?auto_315964 ) ) ( not ( = ?auto_315959 ?auto_315965 ) ) ( not ( = ?auto_315960 ?auto_315961 ) ) ( not ( = ?auto_315960 ?auto_315962 ) ) ( not ( = ?auto_315960 ?auto_315963 ) ) ( not ( = ?auto_315960 ?auto_315964 ) ) ( not ( = ?auto_315960 ?auto_315965 ) ) ( not ( = ?auto_315961 ?auto_315962 ) ) ( not ( = ?auto_315961 ?auto_315963 ) ) ( not ( = ?auto_315961 ?auto_315964 ) ) ( not ( = ?auto_315961 ?auto_315965 ) ) ( not ( = ?auto_315962 ?auto_315963 ) ) ( not ( = ?auto_315962 ?auto_315964 ) ) ( not ( = ?auto_315962 ?auto_315965 ) ) ( not ( = ?auto_315963 ?auto_315964 ) ) ( not ( = ?auto_315963 ?auto_315965 ) ) ( not ( = ?auto_315964 ?auto_315965 ) ) ( ON ?auto_315963 ?auto_315964 ) ( ON ?auto_315962 ?auto_315963 ) ( ON ?auto_315961 ?auto_315962 ) ( ON ?auto_315960 ?auto_315961 ) ( ON ?auto_315959 ?auto_315960 ) ( CLEAR ?auto_315957 ) ( ON ?auto_315958 ?auto_315959 ) ( CLEAR ?auto_315958 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_315953 ?auto_315954 ?auto_315955 ?auto_315956 ?auto_315957 ?auto_315958 )
      ( MAKE-12PILE ?auto_315953 ?auto_315954 ?auto_315955 ?auto_315956 ?auto_315957 ?auto_315958 ?auto_315959 ?auto_315960 ?auto_315961 ?auto_315962 ?auto_315963 ?auto_315964 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_315978 - BLOCK
      ?auto_315979 - BLOCK
      ?auto_315980 - BLOCK
      ?auto_315981 - BLOCK
      ?auto_315982 - BLOCK
      ?auto_315983 - BLOCK
      ?auto_315984 - BLOCK
      ?auto_315985 - BLOCK
      ?auto_315986 - BLOCK
      ?auto_315987 - BLOCK
      ?auto_315988 - BLOCK
      ?auto_315989 - BLOCK
    )
    :vars
    (
      ?auto_315990 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_315989 ?auto_315990 ) ( ON-TABLE ?auto_315978 ) ( ON ?auto_315979 ?auto_315978 ) ( ON ?auto_315980 ?auto_315979 ) ( ON ?auto_315981 ?auto_315980 ) ( ON ?auto_315982 ?auto_315981 ) ( not ( = ?auto_315978 ?auto_315979 ) ) ( not ( = ?auto_315978 ?auto_315980 ) ) ( not ( = ?auto_315978 ?auto_315981 ) ) ( not ( = ?auto_315978 ?auto_315982 ) ) ( not ( = ?auto_315978 ?auto_315983 ) ) ( not ( = ?auto_315978 ?auto_315984 ) ) ( not ( = ?auto_315978 ?auto_315985 ) ) ( not ( = ?auto_315978 ?auto_315986 ) ) ( not ( = ?auto_315978 ?auto_315987 ) ) ( not ( = ?auto_315978 ?auto_315988 ) ) ( not ( = ?auto_315978 ?auto_315989 ) ) ( not ( = ?auto_315978 ?auto_315990 ) ) ( not ( = ?auto_315979 ?auto_315980 ) ) ( not ( = ?auto_315979 ?auto_315981 ) ) ( not ( = ?auto_315979 ?auto_315982 ) ) ( not ( = ?auto_315979 ?auto_315983 ) ) ( not ( = ?auto_315979 ?auto_315984 ) ) ( not ( = ?auto_315979 ?auto_315985 ) ) ( not ( = ?auto_315979 ?auto_315986 ) ) ( not ( = ?auto_315979 ?auto_315987 ) ) ( not ( = ?auto_315979 ?auto_315988 ) ) ( not ( = ?auto_315979 ?auto_315989 ) ) ( not ( = ?auto_315979 ?auto_315990 ) ) ( not ( = ?auto_315980 ?auto_315981 ) ) ( not ( = ?auto_315980 ?auto_315982 ) ) ( not ( = ?auto_315980 ?auto_315983 ) ) ( not ( = ?auto_315980 ?auto_315984 ) ) ( not ( = ?auto_315980 ?auto_315985 ) ) ( not ( = ?auto_315980 ?auto_315986 ) ) ( not ( = ?auto_315980 ?auto_315987 ) ) ( not ( = ?auto_315980 ?auto_315988 ) ) ( not ( = ?auto_315980 ?auto_315989 ) ) ( not ( = ?auto_315980 ?auto_315990 ) ) ( not ( = ?auto_315981 ?auto_315982 ) ) ( not ( = ?auto_315981 ?auto_315983 ) ) ( not ( = ?auto_315981 ?auto_315984 ) ) ( not ( = ?auto_315981 ?auto_315985 ) ) ( not ( = ?auto_315981 ?auto_315986 ) ) ( not ( = ?auto_315981 ?auto_315987 ) ) ( not ( = ?auto_315981 ?auto_315988 ) ) ( not ( = ?auto_315981 ?auto_315989 ) ) ( not ( = ?auto_315981 ?auto_315990 ) ) ( not ( = ?auto_315982 ?auto_315983 ) ) ( not ( = ?auto_315982 ?auto_315984 ) ) ( not ( = ?auto_315982 ?auto_315985 ) ) ( not ( = ?auto_315982 ?auto_315986 ) ) ( not ( = ?auto_315982 ?auto_315987 ) ) ( not ( = ?auto_315982 ?auto_315988 ) ) ( not ( = ?auto_315982 ?auto_315989 ) ) ( not ( = ?auto_315982 ?auto_315990 ) ) ( not ( = ?auto_315983 ?auto_315984 ) ) ( not ( = ?auto_315983 ?auto_315985 ) ) ( not ( = ?auto_315983 ?auto_315986 ) ) ( not ( = ?auto_315983 ?auto_315987 ) ) ( not ( = ?auto_315983 ?auto_315988 ) ) ( not ( = ?auto_315983 ?auto_315989 ) ) ( not ( = ?auto_315983 ?auto_315990 ) ) ( not ( = ?auto_315984 ?auto_315985 ) ) ( not ( = ?auto_315984 ?auto_315986 ) ) ( not ( = ?auto_315984 ?auto_315987 ) ) ( not ( = ?auto_315984 ?auto_315988 ) ) ( not ( = ?auto_315984 ?auto_315989 ) ) ( not ( = ?auto_315984 ?auto_315990 ) ) ( not ( = ?auto_315985 ?auto_315986 ) ) ( not ( = ?auto_315985 ?auto_315987 ) ) ( not ( = ?auto_315985 ?auto_315988 ) ) ( not ( = ?auto_315985 ?auto_315989 ) ) ( not ( = ?auto_315985 ?auto_315990 ) ) ( not ( = ?auto_315986 ?auto_315987 ) ) ( not ( = ?auto_315986 ?auto_315988 ) ) ( not ( = ?auto_315986 ?auto_315989 ) ) ( not ( = ?auto_315986 ?auto_315990 ) ) ( not ( = ?auto_315987 ?auto_315988 ) ) ( not ( = ?auto_315987 ?auto_315989 ) ) ( not ( = ?auto_315987 ?auto_315990 ) ) ( not ( = ?auto_315988 ?auto_315989 ) ) ( not ( = ?auto_315988 ?auto_315990 ) ) ( not ( = ?auto_315989 ?auto_315990 ) ) ( ON ?auto_315988 ?auto_315989 ) ( ON ?auto_315987 ?auto_315988 ) ( ON ?auto_315986 ?auto_315987 ) ( ON ?auto_315985 ?auto_315986 ) ( ON ?auto_315984 ?auto_315985 ) ( CLEAR ?auto_315982 ) ( ON ?auto_315983 ?auto_315984 ) ( CLEAR ?auto_315983 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_315978 ?auto_315979 ?auto_315980 ?auto_315981 ?auto_315982 ?auto_315983 )
      ( MAKE-12PILE ?auto_315978 ?auto_315979 ?auto_315980 ?auto_315981 ?auto_315982 ?auto_315983 ?auto_315984 ?auto_315985 ?auto_315986 ?auto_315987 ?auto_315988 ?auto_315989 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_316003 - BLOCK
      ?auto_316004 - BLOCK
      ?auto_316005 - BLOCK
      ?auto_316006 - BLOCK
      ?auto_316007 - BLOCK
      ?auto_316008 - BLOCK
      ?auto_316009 - BLOCK
      ?auto_316010 - BLOCK
      ?auto_316011 - BLOCK
      ?auto_316012 - BLOCK
      ?auto_316013 - BLOCK
      ?auto_316014 - BLOCK
    )
    :vars
    (
      ?auto_316015 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_316014 ?auto_316015 ) ( ON-TABLE ?auto_316003 ) ( ON ?auto_316004 ?auto_316003 ) ( ON ?auto_316005 ?auto_316004 ) ( ON ?auto_316006 ?auto_316005 ) ( not ( = ?auto_316003 ?auto_316004 ) ) ( not ( = ?auto_316003 ?auto_316005 ) ) ( not ( = ?auto_316003 ?auto_316006 ) ) ( not ( = ?auto_316003 ?auto_316007 ) ) ( not ( = ?auto_316003 ?auto_316008 ) ) ( not ( = ?auto_316003 ?auto_316009 ) ) ( not ( = ?auto_316003 ?auto_316010 ) ) ( not ( = ?auto_316003 ?auto_316011 ) ) ( not ( = ?auto_316003 ?auto_316012 ) ) ( not ( = ?auto_316003 ?auto_316013 ) ) ( not ( = ?auto_316003 ?auto_316014 ) ) ( not ( = ?auto_316003 ?auto_316015 ) ) ( not ( = ?auto_316004 ?auto_316005 ) ) ( not ( = ?auto_316004 ?auto_316006 ) ) ( not ( = ?auto_316004 ?auto_316007 ) ) ( not ( = ?auto_316004 ?auto_316008 ) ) ( not ( = ?auto_316004 ?auto_316009 ) ) ( not ( = ?auto_316004 ?auto_316010 ) ) ( not ( = ?auto_316004 ?auto_316011 ) ) ( not ( = ?auto_316004 ?auto_316012 ) ) ( not ( = ?auto_316004 ?auto_316013 ) ) ( not ( = ?auto_316004 ?auto_316014 ) ) ( not ( = ?auto_316004 ?auto_316015 ) ) ( not ( = ?auto_316005 ?auto_316006 ) ) ( not ( = ?auto_316005 ?auto_316007 ) ) ( not ( = ?auto_316005 ?auto_316008 ) ) ( not ( = ?auto_316005 ?auto_316009 ) ) ( not ( = ?auto_316005 ?auto_316010 ) ) ( not ( = ?auto_316005 ?auto_316011 ) ) ( not ( = ?auto_316005 ?auto_316012 ) ) ( not ( = ?auto_316005 ?auto_316013 ) ) ( not ( = ?auto_316005 ?auto_316014 ) ) ( not ( = ?auto_316005 ?auto_316015 ) ) ( not ( = ?auto_316006 ?auto_316007 ) ) ( not ( = ?auto_316006 ?auto_316008 ) ) ( not ( = ?auto_316006 ?auto_316009 ) ) ( not ( = ?auto_316006 ?auto_316010 ) ) ( not ( = ?auto_316006 ?auto_316011 ) ) ( not ( = ?auto_316006 ?auto_316012 ) ) ( not ( = ?auto_316006 ?auto_316013 ) ) ( not ( = ?auto_316006 ?auto_316014 ) ) ( not ( = ?auto_316006 ?auto_316015 ) ) ( not ( = ?auto_316007 ?auto_316008 ) ) ( not ( = ?auto_316007 ?auto_316009 ) ) ( not ( = ?auto_316007 ?auto_316010 ) ) ( not ( = ?auto_316007 ?auto_316011 ) ) ( not ( = ?auto_316007 ?auto_316012 ) ) ( not ( = ?auto_316007 ?auto_316013 ) ) ( not ( = ?auto_316007 ?auto_316014 ) ) ( not ( = ?auto_316007 ?auto_316015 ) ) ( not ( = ?auto_316008 ?auto_316009 ) ) ( not ( = ?auto_316008 ?auto_316010 ) ) ( not ( = ?auto_316008 ?auto_316011 ) ) ( not ( = ?auto_316008 ?auto_316012 ) ) ( not ( = ?auto_316008 ?auto_316013 ) ) ( not ( = ?auto_316008 ?auto_316014 ) ) ( not ( = ?auto_316008 ?auto_316015 ) ) ( not ( = ?auto_316009 ?auto_316010 ) ) ( not ( = ?auto_316009 ?auto_316011 ) ) ( not ( = ?auto_316009 ?auto_316012 ) ) ( not ( = ?auto_316009 ?auto_316013 ) ) ( not ( = ?auto_316009 ?auto_316014 ) ) ( not ( = ?auto_316009 ?auto_316015 ) ) ( not ( = ?auto_316010 ?auto_316011 ) ) ( not ( = ?auto_316010 ?auto_316012 ) ) ( not ( = ?auto_316010 ?auto_316013 ) ) ( not ( = ?auto_316010 ?auto_316014 ) ) ( not ( = ?auto_316010 ?auto_316015 ) ) ( not ( = ?auto_316011 ?auto_316012 ) ) ( not ( = ?auto_316011 ?auto_316013 ) ) ( not ( = ?auto_316011 ?auto_316014 ) ) ( not ( = ?auto_316011 ?auto_316015 ) ) ( not ( = ?auto_316012 ?auto_316013 ) ) ( not ( = ?auto_316012 ?auto_316014 ) ) ( not ( = ?auto_316012 ?auto_316015 ) ) ( not ( = ?auto_316013 ?auto_316014 ) ) ( not ( = ?auto_316013 ?auto_316015 ) ) ( not ( = ?auto_316014 ?auto_316015 ) ) ( ON ?auto_316013 ?auto_316014 ) ( ON ?auto_316012 ?auto_316013 ) ( ON ?auto_316011 ?auto_316012 ) ( ON ?auto_316010 ?auto_316011 ) ( ON ?auto_316009 ?auto_316010 ) ( ON ?auto_316008 ?auto_316009 ) ( CLEAR ?auto_316006 ) ( ON ?auto_316007 ?auto_316008 ) ( CLEAR ?auto_316007 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_316003 ?auto_316004 ?auto_316005 ?auto_316006 ?auto_316007 )
      ( MAKE-12PILE ?auto_316003 ?auto_316004 ?auto_316005 ?auto_316006 ?auto_316007 ?auto_316008 ?auto_316009 ?auto_316010 ?auto_316011 ?auto_316012 ?auto_316013 ?auto_316014 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_316028 - BLOCK
      ?auto_316029 - BLOCK
      ?auto_316030 - BLOCK
      ?auto_316031 - BLOCK
      ?auto_316032 - BLOCK
      ?auto_316033 - BLOCK
      ?auto_316034 - BLOCK
      ?auto_316035 - BLOCK
      ?auto_316036 - BLOCK
      ?auto_316037 - BLOCK
      ?auto_316038 - BLOCK
      ?auto_316039 - BLOCK
    )
    :vars
    (
      ?auto_316040 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_316039 ?auto_316040 ) ( ON-TABLE ?auto_316028 ) ( ON ?auto_316029 ?auto_316028 ) ( ON ?auto_316030 ?auto_316029 ) ( ON ?auto_316031 ?auto_316030 ) ( not ( = ?auto_316028 ?auto_316029 ) ) ( not ( = ?auto_316028 ?auto_316030 ) ) ( not ( = ?auto_316028 ?auto_316031 ) ) ( not ( = ?auto_316028 ?auto_316032 ) ) ( not ( = ?auto_316028 ?auto_316033 ) ) ( not ( = ?auto_316028 ?auto_316034 ) ) ( not ( = ?auto_316028 ?auto_316035 ) ) ( not ( = ?auto_316028 ?auto_316036 ) ) ( not ( = ?auto_316028 ?auto_316037 ) ) ( not ( = ?auto_316028 ?auto_316038 ) ) ( not ( = ?auto_316028 ?auto_316039 ) ) ( not ( = ?auto_316028 ?auto_316040 ) ) ( not ( = ?auto_316029 ?auto_316030 ) ) ( not ( = ?auto_316029 ?auto_316031 ) ) ( not ( = ?auto_316029 ?auto_316032 ) ) ( not ( = ?auto_316029 ?auto_316033 ) ) ( not ( = ?auto_316029 ?auto_316034 ) ) ( not ( = ?auto_316029 ?auto_316035 ) ) ( not ( = ?auto_316029 ?auto_316036 ) ) ( not ( = ?auto_316029 ?auto_316037 ) ) ( not ( = ?auto_316029 ?auto_316038 ) ) ( not ( = ?auto_316029 ?auto_316039 ) ) ( not ( = ?auto_316029 ?auto_316040 ) ) ( not ( = ?auto_316030 ?auto_316031 ) ) ( not ( = ?auto_316030 ?auto_316032 ) ) ( not ( = ?auto_316030 ?auto_316033 ) ) ( not ( = ?auto_316030 ?auto_316034 ) ) ( not ( = ?auto_316030 ?auto_316035 ) ) ( not ( = ?auto_316030 ?auto_316036 ) ) ( not ( = ?auto_316030 ?auto_316037 ) ) ( not ( = ?auto_316030 ?auto_316038 ) ) ( not ( = ?auto_316030 ?auto_316039 ) ) ( not ( = ?auto_316030 ?auto_316040 ) ) ( not ( = ?auto_316031 ?auto_316032 ) ) ( not ( = ?auto_316031 ?auto_316033 ) ) ( not ( = ?auto_316031 ?auto_316034 ) ) ( not ( = ?auto_316031 ?auto_316035 ) ) ( not ( = ?auto_316031 ?auto_316036 ) ) ( not ( = ?auto_316031 ?auto_316037 ) ) ( not ( = ?auto_316031 ?auto_316038 ) ) ( not ( = ?auto_316031 ?auto_316039 ) ) ( not ( = ?auto_316031 ?auto_316040 ) ) ( not ( = ?auto_316032 ?auto_316033 ) ) ( not ( = ?auto_316032 ?auto_316034 ) ) ( not ( = ?auto_316032 ?auto_316035 ) ) ( not ( = ?auto_316032 ?auto_316036 ) ) ( not ( = ?auto_316032 ?auto_316037 ) ) ( not ( = ?auto_316032 ?auto_316038 ) ) ( not ( = ?auto_316032 ?auto_316039 ) ) ( not ( = ?auto_316032 ?auto_316040 ) ) ( not ( = ?auto_316033 ?auto_316034 ) ) ( not ( = ?auto_316033 ?auto_316035 ) ) ( not ( = ?auto_316033 ?auto_316036 ) ) ( not ( = ?auto_316033 ?auto_316037 ) ) ( not ( = ?auto_316033 ?auto_316038 ) ) ( not ( = ?auto_316033 ?auto_316039 ) ) ( not ( = ?auto_316033 ?auto_316040 ) ) ( not ( = ?auto_316034 ?auto_316035 ) ) ( not ( = ?auto_316034 ?auto_316036 ) ) ( not ( = ?auto_316034 ?auto_316037 ) ) ( not ( = ?auto_316034 ?auto_316038 ) ) ( not ( = ?auto_316034 ?auto_316039 ) ) ( not ( = ?auto_316034 ?auto_316040 ) ) ( not ( = ?auto_316035 ?auto_316036 ) ) ( not ( = ?auto_316035 ?auto_316037 ) ) ( not ( = ?auto_316035 ?auto_316038 ) ) ( not ( = ?auto_316035 ?auto_316039 ) ) ( not ( = ?auto_316035 ?auto_316040 ) ) ( not ( = ?auto_316036 ?auto_316037 ) ) ( not ( = ?auto_316036 ?auto_316038 ) ) ( not ( = ?auto_316036 ?auto_316039 ) ) ( not ( = ?auto_316036 ?auto_316040 ) ) ( not ( = ?auto_316037 ?auto_316038 ) ) ( not ( = ?auto_316037 ?auto_316039 ) ) ( not ( = ?auto_316037 ?auto_316040 ) ) ( not ( = ?auto_316038 ?auto_316039 ) ) ( not ( = ?auto_316038 ?auto_316040 ) ) ( not ( = ?auto_316039 ?auto_316040 ) ) ( ON ?auto_316038 ?auto_316039 ) ( ON ?auto_316037 ?auto_316038 ) ( ON ?auto_316036 ?auto_316037 ) ( ON ?auto_316035 ?auto_316036 ) ( ON ?auto_316034 ?auto_316035 ) ( ON ?auto_316033 ?auto_316034 ) ( CLEAR ?auto_316031 ) ( ON ?auto_316032 ?auto_316033 ) ( CLEAR ?auto_316032 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_316028 ?auto_316029 ?auto_316030 ?auto_316031 ?auto_316032 )
      ( MAKE-12PILE ?auto_316028 ?auto_316029 ?auto_316030 ?auto_316031 ?auto_316032 ?auto_316033 ?auto_316034 ?auto_316035 ?auto_316036 ?auto_316037 ?auto_316038 ?auto_316039 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_316053 - BLOCK
      ?auto_316054 - BLOCK
      ?auto_316055 - BLOCK
      ?auto_316056 - BLOCK
      ?auto_316057 - BLOCK
      ?auto_316058 - BLOCK
      ?auto_316059 - BLOCK
      ?auto_316060 - BLOCK
      ?auto_316061 - BLOCK
      ?auto_316062 - BLOCK
      ?auto_316063 - BLOCK
      ?auto_316064 - BLOCK
    )
    :vars
    (
      ?auto_316065 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_316064 ?auto_316065 ) ( ON-TABLE ?auto_316053 ) ( ON ?auto_316054 ?auto_316053 ) ( ON ?auto_316055 ?auto_316054 ) ( not ( = ?auto_316053 ?auto_316054 ) ) ( not ( = ?auto_316053 ?auto_316055 ) ) ( not ( = ?auto_316053 ?auto_316056 ) ) ( not ( = ?auto_316053 ?auto_316057 ) ) ( not ( = ?auto_316053 ?auto_316058 ) ) ( not ( = ?auto_316053 ?auto_316059 ) ) ( not ( = ?auto_316053 ?auto_316060 ) ) ( not ( = ?auto_316053 ?auto_316061 ) ) ( not ( = ?auto_316053 ?auto_316062 ) ) ( not ( = ?auto_316053 ?auto_316063 ) ) ( not ( = ?auto_316053 ?auto_316064 ) ) ( not ( = ?auto_316053 ?auto_316065 ) ) ( not ( = ?auto_316054 ?auto_316055 ) ) ( not ( = ?auto_316054 ?auto_316056 ) ) ( not ( = ?auto_316054 ?auto_316057 ) ) ( not ( = ?auto_316054 ?auto_316058 ) ) ( not ( = ?auto_316054 ?auto_316059 ) ) ( not ( = ?auto_316054 ?auto_316060 ) ) ( not ( = ?auto_316054 ?auto_316061 ) ) ( not ( = ?auto_316054 ?auto_316062 ) ) ( not ( = ?auto_316054 ?auto_316063 ) ) ( not ( = ?auto_316054 ?auto_316064 ) ) ( not ( = ?auto_316054 ?auto_316065 ) ) ( not ( = ?auto_316055 ?auto_316056 ) ) ( not ( = ?auto_316055 ?auto_316057 ) ) ( not ( = ?auto_316055 ?auto_316058 ) ) ( not ( = ?auto_316055 ?auto_316059 ) ) ( not ( = ?auto_316055 ?auto_316060 ) ) ( not ( = ?auto_316055 ?auto_316061 ) ) ( not ( = ?auto_316055 ?auto_316062 ) ) ( not ( = ?auto_316055 ?auto_316063 ) ) ( not ( = ?auto_316055 ?auto_316064 ) ) ( not ( = ?auto_316055 ?auto_316065 ) ) ( not ( = ?auto_316056 ?auto_316057 ) ) ( not ( = ?auto_316056 ?auto_316058 ) ) ( not ( = ?auto_316056 ?auto_316059 ) ) ( not ( = ?auto_316056 ?auto_316060 ) ) ( not ( = ?auto_316056 ?auto_316061 ) ) ( not ( = ?auto_316056 ?auto_316062 ) ) ( not ( = ?auto_316056 ?auto_316063 ) ) ( not ( = ?auto_316056 ?auto_316064 ) ) ( not ( = ?auto_316056 ?auto_316065 ) ) ( not ( = ?auto_316057 ?auto_316058 ) ) ( not ( = ?auto_316057 ?auto_316059 ) ) ( not ( = ?auto_316057 ?auto_316060 ) ) ( not ( = ?auto_316057 ?auto_316061 ) ) ( not ( = ?auto_316057 ?auto_316062 ) ) ( not ( = ?auto_316057 ?auto_316063 ) ) ( not ( = ?auto_316057 ?auto_316064 ) ) ( not ( = ?auto_316057 ?auto_316065 ) ) ( not ( = ?auto_316058 ?auto_316059 ) ) ( not ( = ?auto_316058 ?auto_316060 ) ) ( not ( = ?auto_316058 ?auto_316061 ) ) ( not ( = ?auto_316058 ?auto_316062 ) ) ( not ( = ?auto_316058 ?auto_316063 ) ) ( not ( = ?auto_316058 ?auto_316064 ) ) ( not ( = ?auto_316058 ?auto_316065 ) ) ( not ( = ?auto_316059 ?auto_316060 ) ) ( not ( = ?auto_316059 ?auto_316061 ) ) ( not ( = ?auto_316059 ?auto_316062 ) ) ( not ( = ?auto_316059 ?auto_316063 ) ) ( not ( = ?auto_316059 ?auto_316064 ) ) ( not ( = ?auto_316059 ?auto_316065 ) ) ( not ( = ?auto_316060 ?auto_316061 ) ) ( not ( = ?auto_316060 ?auto_316062 ) ) ( not ( = ?auto_316060 ?auto_316063 ) ) ( not ( = ?auto_316060 ?auto_316064 ) ) ( not ( = ?auto_316060 ?auto_316065 ) ) ( not ( = ?auto_316061 ?auto_316062 ) ) ( not ( = ?auto_316061 ?auto_316063 ) ) ( not ( = ?auto_316061 ?auto_316064 ) ) ( not ( = ?auto_316061 ?auto_316065 ) ) ( not ( = ?auto_316062 ?auto_316063 ) ) ( not ( = ?auto_316062 ?auto_316064 ) ) ( not ( = ?auto_316062 ?auto_316065 ) ) ( not ( = ?auto_316063 ?auto_316064 ) ) ( not ( = ?auto_316063 ?auto_316065 ) ) ( not ( = ?auto_316064 ?auto_316065 ) ) ( ON ?auto_316063 ?auto_316064 ) ( ON ?auto_316062 ?auto_316063 ) ( ON ?auto_316061 ?auto_316062 ) ( ON ?auto_316060 ?auto_316061 ) ( ON ?auto_316059 ?auto_316060 ) ( ON ?auto_316058 ?auto_316059 ) ( ON ?auto_316057 ?auto_316058 ) ( CLEAR ?auto_316055 ) ( ON ?auto_316056 ?auto_316057 ) ( CLEAR ?auto_316056 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_316053 ?auto_316054 ?auto_316055 ?auto_316056 )
      ( MAKE-12PILE ?auto_316053 ?auto_316054 ?auto_316055 ?auto_316056 ?auto_316057 ?auto_316058 ?auto_316059 ?auto_316060 ?auto_316061 ?auto_316062 ?auto_316063 ?auto_316064 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_316078 - BLOCK
      ?auto_316079 - BLOCK
      ?auto_316080 - BLOCK
      ?auto_316081 - BLOCK
      ?auto_316082 - BLOCK
      ?auto_316083 - BLOCK
      ?auto_316084 - BLOCK
      ?auto_316085 - BLOCK
      ?auto_316086 - BLOCK
      ?auto_316087 - BLOCK
      ?auto_316088 - BLOCK
      ?auto_316089 - BLOCK
    )
    :vars
    (
      ?auto_316090 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_316089 ?auto_316090 ) ( ON-TABLE ?auto_316078 ) ( ON ?auto_316079 ?auto_316078 ) ( ON ?auto_316080 ?auto_316079 ) ( not ( = ?auto_316078 ?auto_316079 ) ) ( not ( = ?auto_316078 ?auto_316080 ) ) ( not ( = ?auto_316078 ?auto_316081 ) ) ( not ( = ?auto_316078 ?auto_316082 ) ) ( not ( = ?auto_316078 ?auto_316083 ) ) ( not ( = ?auto_316078 ?auto_316084 ) ) ( not ( = ?auto_316078 ?auto_316085 ) ) ( not ( = ?auto_316078 ?auto_316086 ) ) ( not ( = ?auto_316078 ?auto_316087 ) ) ( not ( = ?auto_316078 ?auto_316088 ) ) ( not ( = ?auto_316078 ?auto_316089 ) ) ( not ( = ?auto_316078 ?auto_316090 ) ) ( not ( = ?auto_316079 ?auto_316080 ) ) ( not ( = ?auto_316079 ?auto_316081 ) ) ( not ( = ?auto_316079 ?auto_316082 ) ) ( not ( = ?auto_316079 ?auto_316083 ) ) ( not ( = ?auto_316079 ?auto_316084 ) ) ( not ( = ?auto_316079 ?auto_316085 ) ) ( not ( = ?auto_316079 ?auto_316086 ) ) ( not ( = ?auto_316079 ?auto_316087 ) ) ( not ( = ?auto_316079 ?auto_316088 ) ) ( not ( = ?auto_316079 ?auto_316089 ) ) ( not ( = ?auto_316079 ?auto_316090 ) ) ( not ( = ?auto_316080 ?auto_316081 ) ) ( not ( = ?auto_316080 ?auto_316082 ) ) ( not ( = ?auto_316080 ?auto_316083 ) ) ( not ( = ?auto_316080 ?auto_316084 ) ) ( not ( = ?auto_316080 ?auto_316085 ) ) ( not ( = ?auto_316080 ?auto_316086 ) ) ( not ( = ?auto_316080 ?auto_316087 ) ) ( not ( = ?auto_316080 ?auto_316088 ) ) ( not ( = ?auto_316080 ?auto_316089 ) ) ( not ( = ?auto_316080 ?auto_316090 ) ) ( not ( = ?auto_316081 ?auto_316082 ) ) ( not ( = ?auto_316081 ?auto_316083 ) ) ( not ( = ?auto_316081 ?auto_316084 ) ) ( not ( = ?auto_316081 ?auto_316085 ) ) ( not ( = ?auto_316081 ?auto_316086 ) ) ( not ( = ?auto_316081 ?auto_316087 ) ) ( not ( = ?auto_316081 ?auto_316088 ) ) ( not ( = ?auto_316081 ?auto_316089 ) ) ( not ( = ?auto_316081 ?auto_316090 ) ) ( not ( = ?auto_316082 ?auto_316083 ) ) ( not ( = ?auto_316082 ?auto_316084 ) ) ( not ( = ?auto_316082 ?auto_316085 ) ) ( not ( = ?auto_316082 ?auto_316086 ) ) ( not ( = ?auto_316082 ?auto_316087 ) ) ( not ( = ?auto_316082 ?auto_316088 ) ) ( not ( = ?auto_316082 ?auto_316089 ) ) ( not ( = ?auto_316082 ?auto_316090 ) ) ( not ( = ?auto_316083 ?auto_316084 ) ) ( not ( = ?auto_316083 ?auto_316085 ) ) ( not ( = ?auto_316083 ?auto_316086 ) ) ( not ( = ?auto_316083 ?auto_316087 ) ) ( not ( = ?auto_316083 ?auto_316088 ) ) ( not ( = ?auto_316083 ?auto_316089 ) ) ( not ( = ?auto_316083 ?auto_316090 ) ) ( not ( = ?auto_316084 ?auto_316085 ) ) ( not ( = ?auto_316084 ?auto_316086 ) ) ( not ( = ?auto_316084 ?auto_316087 ) ) ( not ( = ?auto_316084 ?auto_316088 ) ) ( not ( = ?auto_316084 ?auto_316089 ) ) ( not ( = ?auto_316084 ?auto_316090 ) ) ( not ( = ?auto_316085 ?auto_316086 ) ) ( not ( = ?auto_316085 ?auto_316087 ) ) ( not ( = ?auto_316085 ?auto_316088 ) ) ( not ( = ?auto_316085 ?auto_316089 ) ) ( not ( = ?auto_316085 ?auto_316090 ) ) ( not ( = ?auto_316086 ?auto_316087 ) ) ( not ( = ?auto_316086 ?auto_316088 ) ) ( not ( = ?auto_316086 ?auto_316089 ) ) ( not ( = ?auto_316086 ?auto_316090 ) ) ( not ( = ?auto_316087 ?auto_316088 ) ) ( not ( = ?auto_316087 ?auto_316089 ) ) ( not ( = ?auto_316087 ?auto_316090 ) ) ( not ( = ?auto_316088 ?auto_316089 ) ) ( not ( = ?auto_316088 ?auto_316090 ) ) ( not ( = ?auto_316089 ?auto_316090 ) ) ( ON ?auto_316088 ?auto_316089 ) ( ON ?auto_316087 ?auto_316088 ) ( ON ?auto_316086 ?auto_316087 ) ( ON ?auto_316085 ?auto_316086 ) ( ON ?auto_316084 ?auto_316085 ) ( ON ?auto_316083 ?auto_316084 ) ( ON ?auto_316082 ?auto_316083 ) ( CLEAR ?auto_316080 ) ( ON ?auto_316081 ?auto_316082 ) ( CLEAR ?auto_316081 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_316078 ?auto_316079 ?auto_316080 ?auto_316081 )
      ( MAKE-12PILE ?auto_316078 ?auto_316079 ?auto_316080 ?auto_316081 ?auto_316082 ?auto_316083 ?auto_316084 ?auto_316085 ?auto_316086 ?auto_316087 ?auto_316088 ?auto_316089 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_316103 - BLOCK
      ?auto_316104 - BLOCK
      ?auto_316105 - BLOCK
      ?auto_316106 - BLOCK
      ?auto_316107 - BLOCK
      ?auto_316108 - BLOCK
      ?auto_316109 - BLOCK
      ?auto_316110 - BLOCK
      ?auto_316111 - BLOCK
      ?auto_316112 - BLOCK
      ?auto_316113 - BLOCK
      ?auto_316114 - BLOCK
    )
    :vars
    (
      ?auto_316115 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_316114 ?auto_316115 ) ( ON-TABLE ?auto_316103 ) ( ON ?auto_316104 ?auto_316103 ) ( not ( = ?auto_316103 ?auto_316104 ) ) ( not ( = ?auto_316103 ?auto_316105 ) ) ( not ( = ?auto_316103 ?auto_316106 ) ) ( not ( = ?auto_316103 ?auto_316107 ) ) ( not ( = ?auto_316103 ?auto_316108 ) ) ( not ( = ?auto_316103 ?auto_316109 ) ) ( not ( = ?auto_316103 ?auto_316110 ) ) ( not ( = ?auto_316103 ?auto_316111 ) ) ( not ( = ?auto_316103 ?auto_316112 ) ) ( not ( = ?auto_316103 ?auto_316113 ) ) ( not ( = ?auto_316103 ?auto_316114 ) ) ( not ( = ?auto_316103 ?auto_316115 ) ) ( not ( = ?auto_316104 ?auto_316105 ) ) ( not ( = ?auto_316104 ?auto_316106 ) ) ( not ( = ?auto_316104 ?auto_316107 ) ) ( not ( = ?auto_316104 ?auto_316108 ) ) ( not ( = ?auto_316104 ?auto_316109 ) ) ( not ( = ?auto_316104 ?auto_316110 ) ) ( not ( = ?auto_316104 ?auto_316111 ) ) ( not ( = ?auto_316104 ?auto_316112 ) ) ( not ( = ?auto_316104 ?auto_316113 ) ) ( not ( = ?auto_316104 ?auto_316114 ) ) ( not ( = ?auto_316104 ?auto_316115 ) ) ( not ( = ?auto_316105 ?auto_316106 ) ) ( not ( = ?auto_316105 ?auto_316107 ) ) ( not ( = ?auto_316105 ?auto_316108 ) ) ( not ( = ?auto_316105 ?auto_316109 ) ) ( not ( = ?auto_316105 ?auto_316110 ) ) ( not ( = ?auto_316105 ?auto_316111 ) ) ( not ( = ?auto_316105 ?auto_316112 ) ) ( not ( = ?auto_316105 ?auto_316113 ) ) ( not ( = ?auto_316105 ?auto_316114 ) ) ( not ( = ?auto_316105 ?auto_316115 ) ) ( not ( = ?auto_316106 ?auto_316107 ) ) ( not ( = ?auto_316106 ?auto_316108 ) ) ( not ( = ?auto_316106 ?auto_316109 ) ) ( not ( = ?auto_316106 ?auto_316110 ) ) ( not ( = ?auto_316106 ?auto_316111 ) ) ( not ( = ?auto_316106 ?auto_316112 ) ) ( not ( = ?auto_316106 ?auto_316113 ) ) ( not ( = ?auto_316106 ?auto_316114 ) ) ( not ( = ?auto_316106 ?auto_316115 ) ) ( not ( = ?auto_316107 ?auto_316108 ) ) ( not ( = ?auto_316107 ?auto_316109 ) ) ( not ( = ?auto_316107 ?auto_316110 ) ) ( not ( = ?auto_316107 ?auto_316111 ) ) ( not ( = ?auto_316107 ?auto_316112 ) ) ( not ( = ?auto_316107 ?auto_316113 ) ) ( not ( = ?auto_316107 ?auto_316114 ) ) ( not ( = ?auto_316107 ?auto_316115 ) ) ( not ( = ?auto_316108 ?auto_316109 ) ) ( not ( = ?auto_316108 ?auto_316110 ) ) ( not ( = ?auto_316108 ?auto_316111 ) ) ( not ( = ?auto_316108 ?auto_316112 ) ) ( not ( = ?auto_316108 ?auto_316113 ) ) ( not ( = ?auto_316108 ?auto_316114 ) ) ( not ( = ?auto_316108 ?auto_316115 ) ) ( not ( = ?auto_316109 ?auto_316110 ) ) ( not ( = ?auto_316109 ?auto_316111 ) ) ( not ( = ?auto_316109 ?auto_316112 ) ) ( not ( = ?auto_316109 ?auto_316113 ) ) ( not ( = ?auto_316109 ?auto_316114 ) ) ( not ( = ?auto_316109 ?auto_316115 ) ) ( not ( = ?auto_316110 ?auto_316111 ) ) ( not ( = ?auto_316110 ?auto_316112 ) ) ( not ( = ?auto_316110 ?auto_316113 ) ) ( not ( = ?auto_316110 ?auto_316114 ) ) ( not ( = ?auto_316110 ?auto_316115 ) ) ( not ( = ?auto_316111 ?auto_316112 ) ) ( not ( = ?auto_316111 ?auto_316113 ) ) ( not ( = ?auto_316111 ?auto_316114 ) ) ( not ( = ?auto_316111 ?auto_316115 ) ) ( not ( = ?auto_316112 ?auto_316113 ) ) ( not ( = ?auto_316112 ?auto_316114 ) ) ( not ( = ?auto_316112 ?auto_316115 ) ) ( not ( = ?auto_316113 ?auto_316114 ) ) ( not ( = ?auto_316113 ?auto_316115 ) ) ( not ( = ?auto_316114 ?auto_316115 ) ) ( ON ?auto_316113 ?auto_316114 ) ( ON ?auto_316112 ?auto_316113 ) ( ON ?auto_316111 ?auto_316112 ) ( ON ?auto_316110 ?auto_316111 ) ( ON ?auto_316109 ?auto_316110 ) ( ON ?auto_316108 ?auto_316109 ) ( ON ?auto_316107 ?auto_316108 ) ( ON ?auto_316106 ?auto_316107 ) ( CLEAR ?auto_316104 ) ( ON ?auto_316105 ?auto_316106 ) ( CLEAR ?auto_316105 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_316103 ?auto_316104 ?auto_316105 )
      ( MAKE-12PILE ?auto_316103 ?auto_316104 ?auto_316105 ?auto_316106 ?auto_316107 ?auto_316108 ?auto_316109 ?auto_316110 ?auto_316111 ?auto_316112 ?auto_316113 ?auto_316114 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_316128 - BLOCK
      ?auto_316129 - BLOCK
      ?auto_316130 - BLOCK
      ?auto_316131 - BLOCK
      ?auto_316132 - BLOCK
      ?auto_316133 - BLOCK
      ?auto_316134 - BLOCK
      ?auto_316135 - BLOCK
      ?auto_316136 - BLOCK
      ?auto_316137 - BLOCK
      ?auto_316138 - BLOCK
      ?auto_316139 - BLOCK
    )
    :vars
    (
      ?auto_316140 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_316139 ?auto_316140 ) ( ON-TABLE ?auto_316128 ) ( ON ?auto_316129 ?auto_316128 ) ( not ( = ?auto_316128 ?auto_316129 ) ) ( not ( = ?auto_316128 ?auto_316130 ) ) ( not ( = ?auto_316128 ?auto_316131 ) ) ( not ( = ?auto_316128 ?auto_316132 ) ) ( not ( = ?auto_316128 ?auto_316133 ) ) ( not ( = ?auto_316128 ?auto_316134 ) ) ( not ( = ?auto_316128 ?auto_316135 ) ) ( not ( = ?auto_316128 ?auto_316136 ) ) ( not ( = ?auto_316128 ?auto_316137 ) ) ( not ( = ?auto_316128 ?auto_316138 ) ) ( not ( = ?auto_316128 ?auto_316139 ) ) ( not ( = ?auto_316128 ?auto_316140 ) ) ( not ( = ?auto_316129 ?auto_316130 ) ) ( not ( = ?auto_316129 ?auto_316131 ) ) ( not ( = ?auto_316129 ?auto_316132 ) ) ( not ( = ?auto_316129 ?auto_316133 ) ) ( not ( = ?auto_316129 ?auto_316134 ) ) ( not ( = ?auto_316129 ?auto_316135 ) ) ( not ( = ?auto_316129 ?auto_316136 ) ) ( not ( = ?auto_316129 ?auto_316137 ) ) ( not ( = ?auto_316129 ?auto_316138 ) ) ( not ( = ?auto_316129 ?auto_316139 ) ) ( not ( = ?auto_316129 ?auto_316140 ) ) ( not ( = ?auto_316130 ?auto_316131 ) ) ( not ( = ?auto_316130 ?auto_316132 ) ) ( not ( = ?auto_316130 ?auto_316133 ) ) ( not ( = ?auto_316130 ?auto_316134 ) ) ( not ( = ?auto_316130 ?auto_316135 ) ) ( not ( = ?auto_316130 ?auto_316136 ) ) ( not ( = ?auto_316130 ?auto_316137 ) ) ( not ( = ?auto_316130 ?auto_316138 ) ) ( not ( = ?auto_316130 ?auto_316139 ) ) ( not ( = ?auto_316130 ?auto_316140 ) ) ( not ( = ?auto_316131 ?auto_316132 ) ) ( not ( = ?auto_316131 ?auto_316133 ) ) ( not ( = ?auto_316131 ?auto_316134 ) ) ( not ( = ?auto_316131 ?auto_316135 ) ) ( not ( = ?auto_316131 ?auto_316136 ) ) ( not ( = ?auto_316131 ?auto_316137 ) ) ( not ( = ?auto_316131 ?auto_316138 ) ) ( not ( = ?auto_316131 ?auto_316139 ) ) ( not ( = ?auto_316131 ?auto_316140 ) ) ( not ( = ?auto_316132 ?auto_316133 ) ) ( not ( = ?auto_316132 ?auto_316134 ) ) ( not ( = ?auto_316132 ?auto_316135 ) ) ( not ( = ?auto_316132 ?auto_316136 ) ) ( not ( = ?auto_316132 ?auto_316137 ) ) ( not ( = ?auto_316132 ?auto_316138 ) ) ( not ( = ?auto_316132 ?auto_316139 ) ) ( not ( = ?auto_316132 ?auto_316140 ) ) ( not ( = ?auto_316133 ?auto_316134 ) ) ( not ( = ?auto_316133 ?auto_316135 ) ) ( not ( = ?auto_316133 ?auto_316136 ) ) ( not ( = ?auto_316133 ?auto_316137 ) ) ( not ( = ?auto_316133 ?auto_316138 ) ) ( not ( = ?auto_316133 ?auto_316139 ) ) ( not ( = ?auto_316133 ?auto_316140 ) ) ( not ( = ?auto_316134 ?auto_316135 ) ) ( not ( = ?auto_316134 ?auto_316136 ) ) ( not ( = ?auto_316134 ?auto_316137 ) ) ( not ( = ?auto_316134 ?auto_316138 ) ) ( not ( = ?auto_316134 ?auto_316139 ) ) ( not ( = ?auto_316134 ?auto_316140 ) ) ( not ( = ?auto_316135 ?auto_316136 ) ) ( not ( = ?auto_316135 ?auto_316137 ) ) ( not ( = ?auto_316135 ?auto_316138 ) ) ( not ( = ?auto_316135 ?auto_316139 ) ) ( not ( = ?auto_316135 ?auto_316140 ) ) ( not ( = ?auto_316136 ?auto_316137 ) ) ( not ( = ?auto_316136 ?auto_316138 ) ) ( not ( = ?auto_316136 ?auto_316139 ) ) ( not ( = ?auto_316136 ?auto_316140 ) ) ( not ( = ?auto_316137 ?auto_316138 ) ) ( not ( = ?auto_316137 ?auto_316139 ) ) ( not ( = ?auto_316137 ?auto_316140 ) ) ( not ( = ?auto_316138 ?auto_316139 ) ) ( not ( = ?auto_316138 ?auto_316140 ) ) ( not ( = ?auto_316139 ?auto_316140 ) ) ( ON ?auto_316138 ?auto_316139 ) ( ON ?auto_316137 ?auto_316138 ) ( ON ?auto_316136 ?auto_316137 ) ( ON ?auto_316135 ?auto_316136 ) ( ON ?auto_316134 ?auto_316135 ) ( ON ?auto_316133 ?auto_316134 ) ( ON ?auto_316132 ?auto_316133 ) ( ON ?auto_316131 ?auto_316132 ) ( CLEAR ?auto_316129 ) ( ON ?auto_316130 ?auto_316131 ) ( CLEAR ?auto_316130 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_316128 ?auto_316129 ?auto_316130 )
      ( MAKE-12PILE ?auto_316128 ?auto_316129 ?auto_316130 ?auto_316131 ?auto_316132 ?auto_316133 ?auto_316134 ?auto_316135 ?auto_316136 ?auto_316137 ?auto_316138 ?auto_316139 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_316153 - BLOCK
      ?auto_316154 - BLOCK
      ?auto_316155 - BLOCK
      ?auto_316156 - BLOCK
      ?auto_316157 - BLOCK
      ?auto_316158 - BLOCK
      ?auto_316159 - BLOCK
      ?auto_316160 - BLOCK
      ?auto_316161 - BLOCK
      ?auto_316162 - BLOCK
      ?auto_316163 - BLOCK
      ?auto_316164 - BLOCK
    )
    :vars
    (
      ?auto_316165 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_316164 ?auto_316165 ) ( ON-TABLE ?auto_316153 ) ( not ( = ?auto_316153 ?auto_316154 ) ) ( not ( = ?auto_316153 ?auto_316155 ) ) ( not ( = ?auto_316153 ?auto_316156 ) ) ( not ( = ?auto_316153 ?auto_316157 ) ) ( not ( = ?auto_316153 ?auto_316158 ) ) ( not ( = ?auto_316153 ?auto_316159 ) ) ( not ( = ?auto_316153 ?auto_316160 ) ) ( not ( = ?auto_316153 ?auto_316161 ) ) ( not ( = ?auto_316153 ?auto_316162 ) ) ( not ( = ?auto_316153 ?auto_316163 ) ) ( not ( = ?auto_316153 ?auto_316164 ) ) ( not ( = ?auto_316153 ?auto_316165 ) ) ( not ( = ?auto_316154 ?auto_316155 ) ) ( not ( = ?auto_316154 ?auto_316156 ) ) ( not ( = ?auto_316154 ?auto_316157 ) ) ( not ( = ?auto_316154 ?auto_316158 ) ) ( not ( = ?auto_316154 ?auto_316159 ) ) ( not ( = ?auto_316154 ?auto_316160 ) ) ( not ( = ?auto_316154 ?auto_316161 ) ) ( not ( = ?auto_316154 ?auto_316162 ) ) ( not ( = ?auto_316154 ?auto_316163 ) ) ( not ( = ?auto_316154 ?auto_316164 ) ) ( not ( = ?auto_316154 ?auto_316165 ) ) ( not ( = ?auto_316155 ?auto_316156 ) ) ( not ( = ?auto_316155 ?auto_316157 ) ) ( not ( = ?auto_316155 ?auto_316158 ) ) ( not ( = ?auto_316155 ?auto_316159 ) ) ( not ( = ?auto_316155 ?auto_316160 ) ) ( not ( = ?auto_316155 ?auto_316161 ) ) ( not ( = ?auto_316155 ?auto_316162 ) ) ( not ( = ?auto_316155 ?auto_316163 ) ) ( not ( = ?auto_316155 ?auto_316164 ) ) ( not ( = ?auto_316155 ?auto_316165 ) ) ( not ( = ?auto_316156 ?auto_316157 ) ) ( not ( = ?auto_316156 ?auto_316158 ) ) ( not ( = ?auto_316156 ?auto_316159 ) ) ( not ( = ?auto_316156 ?auto_316160 ) ) ( not ( = ?auto_316156 ?auto_316161 ) ) ( not ( = ?auto_316156 ?auto_316162 ) ) ( not ( = ?auto_316156 ?auto_316163 ) ) ( not ( = ?auto_316156 ?auto_316164 ) ) ( not ( = ?auto_316156 ?auto_316165 ) ) ( not ( = ?auto_316157 ?auto_316158 ) ) ( not ( = ?auto_316157 ?auto_316159 ) ) ( not ( = ?auto_316157 ?auto_316160 ) ) ( not ( = ?auto_316157 ?auto_316161 ) ) ( not ( = ?auto_316157 ?auto_316162 ) ) ( not ( = ?auto_316157 ?auto_316163 ) ) ( not ( = ?auto_316157 ?auto_316164 ) ) ( not ( = ?auto_316157 ?auto_316165 ) ) ( not ( = ?auto_316158 ?auto_316159 ) ) ( not ( = ?auto_316158 ?auto_316160 ) ) ( not ( = ?auto_316158 ?auto_316161 ) ) ( not ( = ?auto_316158 ?auto_316162 ) ) ( not ( = ?auto_316158 ?auto_316163 ) ) ( not ( = ?auto_316158 ?auto_316164 ) ) ( not ( = ?auto_316158 ?auto_316165 ) ) ( not ( = ?auto_316159 ?auto_316160 ) ) ( not ( = ?auto_316159 ?auto_316161 ) ) ( not ( = ?auto_316159 ?auto_316162 ) ) ( not ( = ?auto_316159 ?auto_316163 ) ) ( not ( = ?auto_316159 ?auto_316164 ) ) ( not ( = ?auto_316159 ?auto_316165 ) ) ( not ( = ?auto_316160 ?auto_316161 ) ) ( not ( = ?auto_316160 ?auto_316162 ) ) ( not ( = ?auto_316160 ?auto_316163 ) ) ( not ( = ?auto_316160 ?auto_316164 ) ) ( not ( = ?auto_316160 ?auto_316165 ) ) ( not ( = ?auto_316161 ?auto_316162 ) ) ( not ( = ?auto_316161 ?auto_316163 ) ) ( not ( = ?auto_316161 ?auto_316164 ) ) ( not ( = ?auto_316161 ?auto_316165 ) ) ( not ( = ?auto_316162 ?auto_316163 ) ) ( not ( = ?auto_316162 ?auto_316164 ) ) ( not ( = ?auto_316162 ?auto_316165 ) ) ( not ( = ?auto_316163 ?auto_316164 ) ) ( not ( = ?auto_316163 ?auto_316165 ) ) ( not ( = ?auto_316164 ?auto_316165 ) ) ( ON ?auto_316163 ?auto_316164 ) ( ON ?auto_316162 ?auto_316163 ) ( ON ?auto_316161 ?auto_316162 ) ( ON ?auto_316160 ?auto_316161 ) ( ON ?auto_316159 ?auto_316160 ) ( ON ?auto_316158 ?auto_316159 ) ( ON ?auto_316157 ?auto_316158 ) ( ON ?auto_316156 ?auto_316157 ) ( ON ?auto_316155 ?auto_316156 ) ( CLEAR ?auto_316153 ) ( ON ?auto_316154 ?auto_316155 ) ( CLEAR ?auto_316154 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_316153 ?auto_316154 )
      ( MAKE-12PILE ?auto_316153 ?auto_316154 ?auto_316155 ?auto_316156 ?auto_316157 ?auto_316158 ?auto_316159 ?auto_316160 ?auto_316161 ?auto_316162 ?auto_316163 ?auto_316164 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_316178 - BLOCK
      ?auto_316179 - BLOCK
      ?auto_316180 - BLOCK
      ?auto_316181 - BLOCK
      ?auto_316182 - BLOCK
      ?auto_316183 - BLOCK
      ?auto_316184 - BLOCK
      ?auto_316185 - BLOCK
      ?auto_316186 - BLOCK
      ?auto_316187 - BLOCK
      ?auto_316188 - BLOCK
      ?auto_316189 - BLOCK
    )
    :vars
    (
      ?auto_316190 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_316189 ?auto_316190 ) ( ON-TABLE ?auto_316178 ) ( not ( = ?auto_316178 ?auto_316179 ) ) ( not ( = ?auto_316178 ?auto_316180 ) ) ( not ( = ?auto_316178 ?auto_316181 ) ) ( not ( = ?auto_316178 ?auto_316182 ) ) ( not ( = ?auto_316178 ?auto_316183 ) ) ( not ( = ?auto_316178 ?auto_316184 ) ) ( not ( = ?auto_316178 ?auto_316185 ) ) ( not ( = ?auto_316178 ?auto_316186 ) ) ( not ( = ?auto_316178 ?auto_316187 ) ) ( not ( = ?auto_316178 ?auto_316188 ) ) ( not ( = ?auto_316178 ?auto_316189 ) ) ( not ( = ?auto_316178 ?auto_316190 ) ) ( not ( = ?auto_316179 ?auto_316180 ) ) ( not ( = ?auto_316179 ?auto_316181 ) ) ( not ( = ?auto_316179 ?auto_316182 ) ) ( not ( = ?auto_316179 ?auto_316183 ) ) ( not ( = ?auto_316179 ?auto_316184 ) ) ( not ( = ?auto_316179 ?auto_316185 ) ) ( not ( = ?auto_316179 ?auto_316186 ) ) ( not ( = ?auto_316179 ?auto_316187 ) ) ( not ( = ?auto_316179 ?auto_316188 ) ) ( not ( = ?auto_316179 ?auto_316189 ) ) ( not ( = ?auto_316179 ?auto_316190 ) ) ( not ( = ?auto_316180 ?auto_316181 ) ) ( not ( = ?auto_316180 ?auto_316182 ) ) ( not ( = ?auto_316180 ?auto_316183 ) ) ( not ( = ?auto_316180 ?auto_316184 ) ) ( not ( = ?auto_316180 ?auto_316185 ) ) ( not ( = ?auto_316180 ?auto_316186 ) ) ( not ( = ?auto_316180 ?auto_316187 ) ) ( not ( = ?auto_316180 ?auto_316188 ) ) ( not ( = ?auto_316180 ?auto_316189 ) ) ( not ( = ?auto_316180 ?auto_316190 ) ) ( not ( = ?auto_316181 ?auto_316182 ) ) ( not ( = ?auto_316181 ?auto_316183 ) ) ( not ( = ?auto_316181 ?auto_316184 ) ) ( not ( = ?auto_316181 ?auto_316185 ) ) ( not ( = ?auto_316181 ?auto_316186 ) ) ( not ( = ?auto_316181 ?auto_316187 ) ) ( not ( = ?auto_316181 ?auto_316188 ) ) ( not ( = ?auto_316181 ?auto_316189 ) ) ( not ( = ?auto_316181 ?auto_316190 ) ) ( not ( = ?auto_316182 ?auto_316183 ) ) ( not ( = ?auto_316182 ?auto_316184 ) ) ( not ( = ?auto_316182 ?auto_316185 ) ) ( not ( = ?auto_316182 ?auto_316186 ) ) ( not ( = ?auto_316182 ?auto_316187 ) ) ( not ( = ?auto_316182 ?auto_316188 ) ) ( not ( = ?auto_316182 ?auto_316189 ) ) ( not ( = ?auto_316182 ?auto_316190 ) ) ( not ( = ?auto_316183 ?auto_316184 ) ) ( not ( = ?auto_316183 ?auto_316185 ) ) ( not ( = ?auto_316183 ?auto_316186 ) ) ( not ( = ?auto_316183 ?auto_316187 ) ) ( not ( = ?auto_316183 ?auto_316188 ) ) ( not ( = ?auto_316183 ?auto_316189 ) ) ( not ( = ?auto_316183 ?auto_316190 ) ) ( not ( = ?auto_316184 ?auto_316185 ) ) ( not ( = ?auto_316184 ?auto_316186 ) ) ( not ( = ?auto_316184 ?auto_316187 ) ) ( not ( = ?auto_316184 ?auto_316188 ) ) ( not ( = ?auto_316184 ?auto_316189 ) ) ( not ( = ?auto_316184 ?auto_316190 ) ) ( not ( = ?auto_316185 ?auto_316186 ) ) ( not ( = ?auto_316185 ?auto_316187 ) ) ( not ( = ?auto_316185 ?auto_316188 ) ) ( not ( = ?auto_316185 ?auto_316189 ) ) ( not ( = ?auto_316185 ?auto_316190 ) ) ( not ( = ?auto_316186 ?auto_316187 ) ) ( not ( = ?auto_316186 ?auto_316188 ) ) ( not ( = ?auto_316186 ?auto_316189 ) ) ( not ( = ?auto_316186 ?auto_316190 ) ) ( not ( = ?auto_316187 ?auto_316188 ) ) ( not ( = ?auto_316187 ?auto_316189 ) ) ( not ( = ?auto_316187 ?auto_316190 ) ) ( not ( = ?auto_316188 ?auto_316189 ) ) ( not ( = ?auto_316188 ?auto_316190 ) ) ( not ( = ?auto_316189 ?auto_316190 ) ) ( ON ?auto_316188 ?auto_316189 ) ( ON ?auto_316187 ?auto_316188 ) ( ON ?auto_316186 ?auto_316187 ) ( ON ?auto_316185 ?auto_316186 ) ( ON ?auto_316184 ?auto_316185 ) ( ON ?auto_316183 ?auto_316184 ) ( ON ?auto_316182 ?auto_316183 ) ( ON ?auto_316181 ?auto_316182 ) ( ON ?auto_316180 ?auto_316181 ) ( CLEAR ?auto_316178 ) ( ON ?auto_316179 ?auto_316180 ) ( CLEAR ?auto_316179 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_316178 ?auto_316179 )
      ( MAKE-12PILE ?auto_316178 ?auto_316179 ?auto_316180 ?auto_316181 ?auto_316182 ?auto_316183 ?auto_316184 ?auto_316185 ?auto_316186 ?auto_316187 ?auto_316188 ?auto_316189 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_316203 - BLOCK
      ?auto_316204 - BLOCK
      ?auto_316205 - BLOCK
      ?auto_316206 - BLOCK
      ?auto_316207 - BLOCK
      ?auto_316208 - BLOCK
      ?auto_316209 - BLOCK
      ?auto_316210 - BLOCK
      ?auto_316211 - BLOCK
      ?auto_316212 - BLOCK
      ?auto_316213 - BLOCK
      ?auto_316214 - BLOCK
    )
    :vars
    (
      ?auto_316215 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_316214 ?auto_316215 ) ( not ( = ?auto_316203 ?auto_316204 ) ) ( not ( = ?auto_316203 ?auto_316205 ) ) ( not ( = ?auto_316203 ?auto_316206 ) ) ( not ( = ?auto_316203 ?auto_316207 ) ) ( not ( = ?auto_316203 ?auto_316208 ) ) ( not ( = ?auto_316203 ?auto_316209 ) ) ( not ( = ?auto_316203 ?auto_316210 ) ) ( not ( = ?auto_316203 ?auto_316211 ) ) ( not ( = ?auto_316203 ?auto_316212 ) ) ( not ( = ?auto_316203 ?auto_316213 ) ) ( not ( = ?auto_316203 ?auto_316214 ) ) ( not ( = ?auto_316203 ?auto_316215 ) ) ( not ( = ?auto_316204 ?auto_316205 ) ) ( not ( = ?auto_316204 ?auto_316206 ) ) ( not ( = ?auto_316204 ?auto_316207 ) ) ( not ( = ?auto_316204 ?auto_316208 ) ) ( not ( = ?auto_316204 ?auto_316209 ) ) ( not ( = ?auto_316204 ?auto_316210 ) ) ( not ( = ?auto_316204 ?auto_316211 ) ) ( not ( = ?auto_316204 ?auto_316212 ) ) ( not ( = ?auto_316204 ?auto_316213 ) ) ( not ( = ?auto_316204 ?auto_316214 ) ) ( not ( = ?auto_316204 ?auto_316215 ) ) ( not ( = ?auto_316205 ?auto_316206 ) ) ( not ( = ?auto_316205 ?auto_316207 ) ) ( not ( = ?auto_316205 ?auto_316208 ) ) ( not ( = ?auto_316205 ?auto_316209 ) ) ( not ( = ?auto_316205 ?auto_316210 ) ) ( not ( = ?auto_316205 ?auto_316211 ) ) ( not ( = ?auto_316205 ?auto_316212 ) ) ( not ( = ?auto_316205 ?auto_316213 ) ) ( not ( = ?auto_316205 ?auto_316214 ) ) ( not ( = ?auto_316205 ?auto_316215 ) ) ( not ( = ?auto_316206 ?auto_316207 ) ) ( not ( = ?auto_316206 ?auto_316208 ) ) ( not ( = ?auto_316206 ?auto_316209 ) ) ( not ( = ?auto_316206 ?auto_316210 ) ) ( not ( = ?auto_316206 ?auto_316211 ) ) ( not ( = ?auto_316206 ?auto_316212 ) ) ( not ( = ?auto_316206 ?auto_316213 ) ) ( not ( = ?auto_316206 ?auto_316214 ) ) ( not ( = ?auto_316206 ?auto_316215 ) ) ( not ( = ?auto_316207 ?auto_316208 ) ) ( not ( = ?auto_316207 ?auto_316209 ) ) ( not ( = ?auto_316207 ?auto_316210 ) ) ( not ( = ?auto_316207 ?auto_316211 ) ) ( not ( = ?auto_316207 ?auto_316212 ) ) ( not ( = ?auto_316207 ?auto_316213 ) ) ( not ( = ?auto_316207 ?auto_316214 ) ) ( not ( = ?auto_316207 ?auto_316215 ) ) ( not ( = ?auto_316208 ?auto_316209 ) ) ( not ( = ?auto_316208 ?auto_316210 ) ) ( not ( = ?auto_316208 ?auto_316211 ) ) ( not ( = ?auto_316208 ?auto_316212 ) ) ( not ( = ?auto_316208 ?auto_316213 ) ) ( not ( = ?auto_316208 ?auto_316214 ) ) ( not ( = ?auto_316208 ?auto_316215 ) ) ( not ( = ?auto_316209 ?auto_316210 ) ) ( not ( = ?auto_316209 ?auto_316211 ) ) ( not ( = ?auto_316209 ?auto_316212 ) ) ( not ( = ?auto_316209 ?auto_316213 ) ) ( not ( = ?auto_316209 ?auto_316214 ) ) ( not ( = ?auto_316209 ?auto_316215 ) ) ( not ( = ?auto_316210 ?auto_316211 ) ) ( not ( = ?auto_316210 ?auto_316212 ) ) ( not ( = ?auto_316210 ?auto_316213 ) ) ( not ( = ?auto_316210 ?auto_316214 ) ) ( not ( = ?auto_316210 ?auto_316215 ) ) ( not ( = ?auto_316211 ?auto_316212 ) ) ( not ( = ?auto_316211 ?auto_316213 ) ) ( not ( = ?auto_316211 ?auto_316214 ) ) ( not ( = ?auto_316211 ?auto_316215 ) ) ( not ( = ?auto_316212 ?auto_316213 ) ) ( not ( = ?auto_316212 ?auto_316214 ) ) ( not ( = ?auto_316212 ?auto_316215 ) ) ( not ( = ?auto_316213 ?auto_316214 ) ) ( not ( = ?auto_316213 ?auto_316215 ) ) ( not ( = ?auto_316214 ?auto_316215 ) ) ( ON ?auto_316213 ?auto_316214 ) ( ON ?auto_316212 ?auto_316213 ) ( ON ?auto_316211 ?auto_316212 ) ( ON ?auto_316210 ?auto_316211 ) ( ON ?auto_316209 ?auto_316210 ) ( ON ?auto_316208 ?auto_316209 ) ( ON ?auto_316207 ?auto_316208 ) ( ON ?auto_316206 ?auto_316207 ) ( ON ?auto_316205 ?auto_316206 ) ( ON ?auto_316204 ?auto_316205 ) ( ON ?auto_316203 ?auto_316204 ) ( CLEAR ?auto_316203 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_316203 )
      ( MAKE-12PILE ?auto_316203 ?auto_316204 ?auto_316205 ?auto_316206 ?auto_316207 ?auto_316208 ?auto_316209 ?auto_316210 ?auto_316211 ?auto_316212 ?auto_316213 ?auto_316214 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_316228 - BLOCK
      ?auto_316229 - BLOCK
      ?auto_316230 - BLOCK
      ?auto_316231 - BLOCK
      ?auto_316232 - BLOCK
      ?auto_316233 - BLOCK
      ?auto_316234 - BLOCK
      ?auto_316235 - BLOCK
      ?auto_316236 - BLOCK
      ?auto_316237 - BLOCK
      ?auto_316238 - BLOCK
      ?auto_316239 - BLOCK
    )
    :vars
    (
      ?auto_316240 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_316239 ?auto_316240 ) ( not ( = ?auto_316228 ?auto_316229 ) ) ( not ( = ?auto_316228 ?auto_316230 ) ) ( not ( = ?auto_316228 ?auto_316231 ) ) ( not ( = ?auto_316228 ?auto_316232 ) ) ( not ( = ?auto_316228 ?auto_316233 ) ) ( not ( = ?auto_316228 ?auto_316234 ) ) ( not ( = ?auto_316228 ?auto_316235 ) ) ( not ( = ?auto_316228 ?auto_316236 ) ) ( not ( = ?auto_316228 ?auto_316237 ) ) ( not ( = ?auto_316228 ?auto_316238 ) ) ( not ( = ?auto_316228 ?auto_316239 ) ) ( not ( = ?auto_316228 ?auto_316240 ) ) ( not ( = ?auto_316229 ?auto_316230 ) ) ( not ( = ?auto_316229 ?auto_316231 ) ) ( not ( = ?auto_316229 ?auto_316232 ) ) ( not ( = ?auto_316229 ?auto_316233 ) ) ( not ( = ?auto_316229 ?auto_316234 ) ) ( not ( = ?auto_316229 ?auto_316235 ) ) ( not ( = ?auto_316229 ?auto_316236 ) ) ( not ( = ?auto_316229 ?auto_316237 ) ) ( not ( = ?auto_316229 ?auto_316238 ) ) ( not ( = ?auto_316229 ?auto_316239 ) ) ( not ( = ?auto_316229 ?auto_316240 ) ) ( not ( = ?auto_316230 ?auto_316231 ) ) ( not ( = ?auto_316230 ?auto_316232 ) ) ( not ( = ?auto_316230 ?auto_316233 ) ) ( not ( = ?auto_316230 ?auto_316234 ) ) ( not ( = ?auto_316230 ?auto_316235 ) ) ( not ( = ?auto_316230 ?auto_316236 ) ) ( not ( = ?auto_316230 ?auto_316237 ) ) ( not ( = ?auto_316230 ?auto_316238 ) ) ( not ( = ?auto_316230 ?auto_316239 ) ) ( not ( = ?auto_316230 ?auto_316240 ) ) ( not ( = ?auto_316231 ?auto_316232 ) ) ( not ( = ?auto_316231 ?auto_316233 ) ) ( not ( = ?auto_316231 ?auto_316234 ) ) ( not ( = ?auto_316231 ?auto_316235 ) ) ( not ( = ?auto_316231 ?auto_316236 ) ) ( not ( = ?auto_316231 ?auto_316237 ) ) ( not ( = ?auto_316231 ?auto_316238 ) ) ( not ( = ?auto_316231 ?auto_316239 ) ) ( not ( = ?auto_316231 ?auto_316240 ) ) ( not ( = ?auto_316232 ?auto_316233 ) ) ( not ( = ?auto_316232 ?auto_316234 ) ) ( not ( = ?auto_316232 ?auto_316235 ) ) ( not ( = ?auto_316232 ?auto_316236 ) ) ( not ( = ?auto_316232 ?auto_316237 ) ) ( not ( = ?auto_316232 ?auto_316238 ) ) ( not ( = ?auto_316232 ?auto_316239 ) ) ( not ( = ?auto_316232 ?auto_316240 ) ) ( not ( = ?auto_316233 ?auto_316234 ) ) ( not ( = ?auto_316233 ?auto_316235 ) ) ( not ( = ?auto_316233 ?auto_316236 ) ) ( not ( = ?auto_316233 ?auto_316237 ) ) ( not ( = ?auto_316233 ?auto_316238 ) ) ( not ( = ?auto_316233 ?auto_316239 ) ) ( not ( = ?auto_316233 ?auto_316240 ) ) ( not ( = ?auto_316234 ?auto_316235 ) ) ( not ( = ?auto_316234 ?auto_316236 ) ) ( not ( = ?auto_316234 ?auto_316237 ) ) ( not ( = ?auto_316234 ?auto_316238 ) ) ( not ( = ?auto_316234 ?auto_316239 ) ) ( not ( = ?auto_316234 ?auto_316240 ) ) ( not ( = ?auto_316235 ?auto_316236 ) ) ( not ( = ?auto_316235 ?auto_316237 ) ) ( not ( = ?auto_316235 ?auto_316238 ) ) ( not ( = ?auto_316235 ?auto_316239 ) ) ( not ( = ?auto_316235 ?auto_316240 ) ) ( not ( = ?auto_316236 ?auto_316237 ) ) ( not ( = ?auto_316236 ?auto_316238 ) ) ( not ( = ?auto_316236 ?auto_316239 ) ) ( not ( = ?auto_316236 ?auto_316240 ) ) ( not ( = ?auto_316237 ?auto_316238 ) ) ( not ( = ?auto_316237 ?auto_316239 ) ) ( not ( = ?auto_316237 ?auto_316240 ) ) ( not ( = ?auto_316238 ?auto_316239 ) ) ( not ( = ?auto_316238 ?auto_316240 ) ) ( not ( = ?auto_316239 ?auto_316240 ) ) ( ON ?auto_316238 ?auto_316239 ) ( ON ?auto_316237 ?auto_316238 ) ( ON ?auto_316236 ?auto_316237 ) ( ON ?auto_316235 ?auto_316236 ) ( ON ?auto_316234 ?auto_316235 ) ( ON ?auto_316233 ?auto_316234 ) ( ON ?auto_316232 ?auto_316233 ) ( ON ?auto_316231 ?auto_316232 ) ( ON ?auto_316230 ?auto_316231 ) ( ON ?auto_316229 ?auto_316230 ) ( ON ?auto_316228 ?auto_316229 ) ( CLEAR ?auto_316228 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_316228 )
      ( MAKE-12PILE ?auto_316228 ?auto_316229 ?auto_316230 ?auto_316231 ?auto_316232 ?auto_316233 ?auto_316234 ?auto_316235 ?auto_316236 ?auto_316237 ?auto_316238 ?auto_316239 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_316254 - BLOCK
      ?auto_316255 - BLOCK
      ?auto_316256 - BLOCK
      ?auto_316257 - BLOCK
      ?auto_316258 - BLOCK
      ?auto_316259 - BLOCK
      ?auto_316260 - BLOCK
      ?auto_316261 - BLOCK
      ?auto_316262 - BLOCK
      ?auto_316263 - BLOCK
      ?auto_316264 - BLOCK
      ?auto_316265 - BLOCK
      ?auto_316266 - BLOCK
    )
    :vars
    (
      ?auto_316267 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_316265 ) ( ON ?auto_316266 ?auto_316267 ) ( CLEAR ?auto_316266 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_316254 ) ( ON ?auto_316255 ?auto_316254 ) ( ON ?auto_316256 ?auto_316255 ) ( ON ?auto_316257 ?auto_316256 ) ( ON ?auto_316258 ?auto_316257 ) ( ON ?auto_316259 ?auto_316258 ) ( ON ?auto_316260 ?auto_316259 ) ( ON ?auto_316261 ?auto_316260 ) ( ON ?auto_316262 ?auto_316261 ) ( ON ?auto_316263 ?auto_316262 ) ( ON ?auto_316264 ?auto_316263 ) ( ON ?auto_316265 ?auto_316264 ) ( not ( = ?auto_316254 ?auto_316255 ) ) ( not ( = ?auto_316254 ?auto_316256 ) ) ( not ( = ?auto_316254 ?auto_316257 ) ) ( not ( = ?auto_316254 ?auto_316258 ) ) ( not ( = ?auto_316254 ?auto_316259 ) ) ( not ( = ?auto_316254 ?auto_316260 ) ) ( not ( = ?auto_316254 ?auto_316261 ) ) ( not ( = ?auto_316254 ?auto_316262 ) ) ( not ( = ?auto_316254 ?auto_316263 ) ) ( not ( = ?auto_316254 ?auto_316264 ) ) ( not ( = ?auto_316254 ?auto_316265 ) ) ( not ( = ?auto_316254 ?auto_316266 ) ) ( not ( = ?auto_316254 ?auto_316267 ) ) ( not ( = ?auto_316255 ?auto_316256 ) ) ( not ( = ?auto_316255 ?auto_316257 ) ) ( not ( = ?auto_316255 ?auto_316258 ) ) ( not ( = ?auto_316255 ?auto_316259 ) ) ( not ( = ?auto_316255 ?auto_316260 ) ) ( not ( = ?auto_316255 ?auto_316261 ) ) ( not ( = ?auto_316255 ?auto_316262 ) ) ( not ( = ?auto_316255 ?auto_316263 ) ) ( not ( = ?auto_316255 ?auto_316264 ) ) ( not ( = ?auto_316255 ?auto_316265 ) ) ( not ( = ?auto_316255 ?auto_316266 ) ) ( not ( = ?auto_316255 ?auto_316267 ) ) ( not ( = ?auto_316256 ?auto_316257 ) ) ( not ( = ?auto_316256 ?auto_316258 ) ) ( not ( = ?auto_316256 ?auto_316259 ) ) ( not ( = ?auto_316256 ?auto_316260 ) ) ( not ( = ?auto_316256 ?auto_316261 ) ) ( not ( = ?auto_316256 ?auto_316262 ) ) ( not ( = ?auto_316256 ?auto_316263 ) ) ( not ( = ?auto_316256 ?auto_316264 ) ) ( not ( = ?auto_316256 ?auto_316265 ) ) ( not ( = ?auto_316256 ?auto_316266 ) ) ( not ( = ?auto_316256 ?auto_316267 ) ) ( not ( = ?auto_316257 ?auto_316258 ) ) ( not ( = ?auto_316257 ?auto_316259 ) ) ( not ( = ?auto_316257 ?auto_316260 ) ) ( not ( = ?auto_316257 ?auto_316261 ) ) ( not ( = ?auto_316257 ?auto_316262 ) ) ( not ( = ?auto_316257 ?auto_316263 ) ) ( not ( = ?auto_316257 ?auto_316264 ) ) ( not ( = ?auto_316257 ?auto_316265 ) ) ( not ( = ?auto_316257 ?auto_316266 ) ) ( not ( = ?auto_316257 ?auto_316267 ) ) ( not ( = ?auto_316258 ?auto_316259 ) ) ( not ( = ?auto_316258 ?auto_316260 ) ) ( not ( = ?auto_316258 ?auto_316261 ) ) ( not ( = ?auto_316258 ?auto_316262 ) ) ( not ( = ?auto_316258 ?auto_316263 ) ) ( not ( = ?auto_316258 ?auto_316264 ) ) ( not ( = ?auto_316258 ?auto_316265 ) ) ( not ( = ?auto_316258 ?auto_316266 ) ) ( not ( = ?auto_316258 ?auto_316267 ) ) ( not ( = ?auto_316259 ?auto_316260 ) ) ( not ( = ?auto_316259 ?auto_316261 ) ) ( not ( = ?auto_316259 ?auto_316262 ) ) ( not ( = ?auto_316259 ?auto_316263 ) ) ( not ( = ?auto_316259 ?auto_316264 ) ) ( not ( = ?auto_316259 ?auto_316265 ) ) ( not ( = ?auto_316259 ?auto_316266 ) ) ( not ( = ?auto_316259 ?auto_316267 ) ) ( not ( = ?auto_316260 ?auto_316261 ) ) ( not ( = ?auto_316260 ?auto_316262 ) ) ( not ( = ?auto_316260 ?auto_316263 ) ) ( not ( = ?auto_316260 ?auto_316264 ) ) ( not ( = ?auto_316260 ?auto_316265 ) ) ( not ( = ?auto_316260 ?auto_316266 ) ) ( not ( = ?auto_316260 ?auto_316267 ) ) ( not ( = ?auto_316261 ?auto_316262 ) ) ( not ( = ?auto_316261 ?auto_316263 ) ) ( not ( = ?auto_316261 ?auto_316264 ) ) ( not ( = ?auto_316261 ?auto_316265 ) ) ( not ( = ?auto_316261 ?auto_316266 ) ) ( not ( = ?auto_316261 ?auto_316267 ) ) ( not ( = ?auto_316262 ?auto_316263 ) ) ( not ( = ?auto_316262 ?auto_316264 ) ) ( not ( = ?auto_316262 ?auto_316265 ) ) ( not ( = ?auto_316262 ?auto_316266 ) ) ( not ( = ?auto_316262 ?auto_316267 ) ) ( not ( = ?auto_316263 ?auto_316264 ) ) ( not ( = ?auto_316263 ?auto_316265 ) ) ( not ( = ?auto_316263 ?auto_316266 ) ) ( not ( = ?auto_316263 ?auto_316267 ) ) ( not ( = ?auto_316264 ?auto_316265 ) ) ( not ( = ?auto_316264 ?auto_316266 ) ) ( not ( = ?auto_316264 ?auto_316267 ) ) ( not ( = ?auto_316265 ?auto_316266 ) ) ( not ( = ?auto_316265 ?auto_316267 ) ) ( not ( = ?auto_316266 ?auto_316267 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_316266 ?auto_316267 )
      ( !STACK ?auto_316266 ?auto_316265 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_316281 - BLOCK
      ?auto_316282 - BLOCK
      ?auto_316283 - BLOCK
      ?auto_316284 - BLOCK
      ?auto_316285 - BLOCK
      ?auto_316286 - BLOCK
      ?auto_316287 - BLOCK
      ?auto_316288 - BLOCK
      ?auto_316289 - BLOCK
      ?auto_316290 - BLOCK
      ?auto_316291 - BLOCK
      ?auto_316292 - BLOCK
      ?auto_316293 - BLOCK
    )
    :vars
    (
      ?auto_316294 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_316292 ) ( ON ?auto_316293 ?auto_316294 ) ( CLEAR ?auto_316293 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_316281 ) ( ON ?auto_316282 ?auto_316281 ) ( ON ?auto_316283 ?auto_316282 ) ( ON ?auto_316284 ?auto_316283 ) ( ON ?auto_316285 ?auto_316284 ) ( ON ?auto_316286 ?auto_316285 ) ( ON ?auto_316287 ?auto_316286 ) ( ON ?auto_316288 ?auto_316287 ) ( ON ?auto_316289 ?auto_316288 ) ( ON ?auto_316290 ?auto_316289 ) ( ON ?auto_316291 ?auto_316290 ) ( ON ?auto_316292 ?auto_316291 ) ( not ( = ?auto_316281 ?auto_316282 ) ) ( not ( = ?auto_316281 ?auto_316283 ) ) ( not ( = ?auto_316281 ?auto_316284 ) ) ( not ( = ?auto_316281 ?auto_316285 ) ) ( not ( = ?auto_316281 ?auto_316286 ) ) ( not ( = ?auto_316281 ?auto_316287 ) ) ( not ( = ?auto_316281 ?auto_316288 ) ) ( not ( = ?auto_316281 ?auto_316289 ) ) ( not ( = ?auto_316281 ?auto_316290 ) ) ( not ( = ?auto_316281 ?auto_316291 ) ) ( not ( = ?auto_316281 ?auto_316292 ) ) ( not ( = ?auto_316281 ?auto_316293 ) ) ( not ( = ?auto_316281 ?auto_316294 ) ) ( not ( = ?auto_316282 ?auto_316283 ) ) ( not ( = ?auto_316282 ?auto_316284 ) ) ( not ( = ?auto_316282 ?auto_316285 ) ) ( not ( = ?auto_316282 ?auto_316286 ) ) ( not ( = ?auto_316282 ?auto_316287 ) ) ( not ( = ?auto_316282 ?auto_316288 ) ) ( not ( = ?auto_316282 ?auto_316289 ) ) ( not ( = ?auto_316282 ?auto_316290 ) ) ( not ( = ?auto_316282 ?auto_316291 ) ) ( not ( = ?auto_316282 ?auto_316292 ) ) ( not ( = ?auto_316282 ?auto_316293 ) ) ( not ( = ?auto_316282 ?auto_316294 ) ) ( not ( = ?auto_316283 ?auto_316284 ) ) ( not ( = ?auto_316283 ?auto_316285 ) ) ( not ( = ?auto_316283 ?auto_316286 ) ) ( not ( = ?auto_316283 ?auto_316287 ) ) ( not ( = ?auto_316283 ?auto_316288 ) ) ( not ( = ?auto_316283 ?auto_316289 ) ) ( not ( = ?auto_316283 ?auto_316290 ) ) ( not ( = ?auto_316283 ?auto_316291 ) ) ( not ( = ?auto_316283 ?auto_316292 ) ) ( not ( = ?auto_316283 ?auto_316293 ) ) ( not ( = ?auto_316283 ?auto_316294 ) ) ( not ( = ?auto_316284 ?auto_316285 ) ) ( not ( = ?auto_316284 ?auto_316286 ) ) ( not ( = ?auto_316284 ?auto_316287 ) ) ( not ( = ?auto_316284 ?auto_316288 ) ) ( not ( = ?auto_316284 ?auto_316289 ) ) ( not ( = ?auto_316284 ?auto_316290 ) ) ( not ( = ?auto_316284 ?auto_316291 ) ) ( not ( = ?auto_316284 ?auto_316292 ) ) ( not ( = ?auto_316284 ?auto_316293 ) ) ( not ( = ?auto_316284 ?auto_316294 ) ) ( not ( = ?auto_316285 ?auto_316286 ) ) ( not ( = ?auto_316285 ?auto_316287 ) ) ( not ( = ?auto_316285 ?auto_316288 ) ) ( not ( = ?auto_316285 ?auto_316289 ) ) ( not ( = ?auto_316285 ?auto_316290 ) ) ( not ( = ?auto_316285 ?auto_316291 ) ) ( not ( = ?auto_316285 ?auto_316292 ) ) ( not ( = ?auto_316285 ?auto_316293 ) ) ( not ( = ?auto_316285 ?auto_316294 ) ) ( not ( = ?auto_316286 ?auto_316287 ) ) ( not ( = ?auto_316286 ?auto_316288 ) ) ( not ( = ?auto_316286 ?auto_316289 ) ) ( not ( = ?auto_316286 ?auto_316290 ) ) ( not ( = ?auto_316286 ?auto_316291 ) ) ( not ( = ?auto_316286 ?auto_316292 ) ) ( not ( = ?auto_316286 ?auto_316293 ) ) ( not ( = ?auto_316286 ?auto_316294 ) ) ( not ( = ?auto_316287 ?auto_316288 ) ) ( not ( = ?auto_316287 ?auto_316289 ) ) ( not ( = ?auto_316287 ?auto_316290 ) ) ( not ( = ?auto_316287 ?auto_316291 ) ) ( not ( = ?auto_316287 ?auto_316292 ) ) ( not ( = ?auto_316287 ?auto_316293 ) ) ( not ( = ?auto_316287 ?auto_316294 ) ) ( not ( = ?auto_316288 ?auto_316289 ) ) ( not ( = ?auto_316288 ?auto_316290 ) ) ( not ( = ?auto_316288 ?auto_316291 ) ) ( not ( = ?auto_316288 ?auto_316292 ) ) ( not ( = ?auto_316288 ?auto_316293 ) ) ( not ( = ?auto_316288 ?auto_316294 ) ) ( not ( = ?auto_316289 ?auto_316290 ) ) ( not ( = ?auto_316289 ?auto_316291 ) ) ( not ( = ?auto_316289 ?auto_316292 ) ) ( not ( = ?auto_316289 ?auto_316293 ) ) ( not ( = ?auto_316289 ?auto_316294 ) ) ( not ( = ?auto_316290 ?auto_316291 ) ) ( not ( = ?auto_316290 ?auto_316292 ) ) ( not ( = ?auto_316290 ?auto_316293 ) ) ( not ( = ?auto_316290 ?auto_316294 ) ) ( not ( = ?auto_316291 ?auto_316292 ) ) ( not ( = ?auto_316291 ?auto_316293 ) ) ( not ( = ?auto_316291 ?auto_316294 ) ) ( not ( = ?auto_316292 ?auto_316293 ) ) ( not ( = ?auto_316292 ?auto_316294 ) ) ( not ( = ?auto_316293 ?auto_316294 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_316293 ?auto_316294 )
      ( !STACK ?auto_316293 ?auto_316292 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_316308 - BLOCK
      ?auto_316309 - BLOCK
      ?auto_316310 - BLOCK
      ?auto_316311 - BLOCK
      ?auto_316312 - BLOCK
      ?auto_316313 - BLOCK
      ?auto_316314 - BLOCK
      ?auto_316315 - BLOCK
      ?auto_316316 - BLOCK
      ?auto_316317 - BLOCK
      ?auto_316318 - BLOCK
      ?auto_316319 - BLOCK
      ?auto_316320 - BLOCK
    )
    :vars
    (
      ?auto_316321 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_316320 ?auto_316321 ) ( ON-TABLE ?auto_316308 ) ( ON ?auto_316309 ?auto_316308 ) ( ON ?auto_316310 ?auto_316309 ) ( ON ?auto_316311 ?auto_316310 ) ( ON ?auto_316312 ?auto_316311 ) ( ON ?auto_316313 ?auto_316312 ) ( ON ?auto_316314 ?auto_316313 ) ( ON ?auto_316315 ?auto_316314 ) ( ON ?auto_316316 ?auto_316315 ) ( ON ?auto_316317 ?auto_316316 ) ( ON ?auto_316318 ?auto_316317 ) ( not ( = ?auto_316308 ?auto_316309 ) ) ( not ( = ?auto_316308 ?auto_316310 ) ) ( not ( = ?auto_316308 ?auto_316311 ) ) ( not ( = ?auto_316308 ?auto_316312 ) ) ( not ( = ?auto_316308 ?auto_316313 ) ) ( not ( = ?auto_316308 ?auto_316314 ) ) ( not ( = ?auto_316308 ?auto_316315 ) ) ( not ( = ?auto_316308 ?auto_316316 ) ) ( not ( = ?auto_316308 ?auto_316317 ) ) ( not ( = ?auto_316308 ?auto_316318 ) ) ( not ( = ?auto_316308 ?auto_316319 ) ) ( not ( = ?auto_316308 ?auto_316320 ) ) ( not ( = ?auto_316308 ?auto_316321 ) ) ( not ( = ?auto_316309 ?auto_316310 ) ) ( not ( = ?auto_316309 ?auto_316311 ) ) ( not ( = ?auto_316309 ?auto_316312 ) ) ( not ( = ?auto_316309 ?auto_316313 ) ) ( not ( = ?auto_316309 ?auto_316314 ) ) ( not ( = ?auto_316309 ?auto_316315 ) ) ( not ( = ?auto_316309 ?auto_316316 ) ) ( not ( = ?auto_316309 ?auto_316317 ) ) ( not ( = ?auto_316309 ?auto_316318 ) ) ( not ( = ?auto_316309 ?auto_316319 ) ) ( not ( = ?auto_316309 ?auto_316320 ) ) ( not ( = ?auto_316309 ?auto_316321 ) ) ( not ( = ?auto_316310 ?auto_316311 ) ) ( not ( = ?auto_316310 ?auto_316312 ) ) ( not ( = ?auto_316310 ?auto_316313 ) ) ( not ( = ?auto_316310 ?auto_316314 ) ) ( not ( = ?auto_316310 ?auto_316315 ) ) ( not ( = ?auto_316310 ?auto_316316 ) ) ( not ( = ?auto_316310 ?auto_316317 ) ) ( not ( = ?auto_316310 ?auto_316318 ) ) ( not ( = ?auto_316310 ?auto_316319 ) ) ( not ( = ?auto_316310 ?auto_316320 ) ) ( not ( = ?auto_316310 ?auto_316321 ) ) ( not ( = ?auto_316311 ?auto_316312 ) ) ( not ( = ?auto_316311 ?auto_316313 ) ) ( not ( = ?auto_316311 ?auto_316314 ) ) ( not ( = ?auto_316311 ?auto_316315 ) ) ( not ( = ?auto_316311 ?auto_316316 ) ) ( not ( = ?auto_316311 ?auto_316317 ) ) ( not ( = ?auto_316311 ?auto_316318 ) ) ( not ( = ?auto_316311 ?auto_316319 ) ) ( not ( = ?auto_316311 ?auto_316320 ) ) ( not ( = ?auto_316311 ?auto_316321 ) ) ( not ( = ?auto_316312 ?auto_316313 ) ) ( not ( = ?auto_316312 ?auto_316314 ) ) ( not ( = ?auto_316312 ?auto_316315 ) ) ( not ( = ?auto_316312 ?auto_316316 ) ) ( not ( = ?auto_316312 ?auto_316317 ) ) ( not ( = ?auto_316312 ?auto_316318 ) ) ( not ( = ?auto_316312 ?auto_316319 ) ) ( not ( = ?auto_316312 ?auto_316320 ) ) ( not ( = ?auto_316312 ?auto_316321 ) ) ( not ( = ?auto_316313 ?auto_316314 ) ) ( not ( = ?auto_316313 ?auto_316315 ) ) ( not ( = ?auto_316313 ?auto_316316 ) ) ( not ( = ?auto_316313 ?auto_316317 ) ) ( not ( = ?auto_316313 ?auto_316318 ) ) ( not ( = ?auto_316313 ?auto_316319 ) ) ( not ( = ?auto_316313 ?auto_316320 ) ) ( not ( = ?auto_316313 ?auto_316321 ) ) ( not ( = ?auto_316314 ?auto_316315 ) ) ( not ( = ?auto_316314 ?auto_316316 ) ) ( not ( = ?auto_316314 ?auto_316317 ) ) ( not ( = ?auto_316314 ?auto_316318 ) ) ( not ( = ?auto_316314 ?auto_316319 ) ) ( not ( = ?auto_316314 ?auto_316320 ) ) ( not ( = ?auto_316314 ?auto_316321 ) ) ( not ( = ?auto_316315 ?auto_316316 ) ) ( not ( = ?auto_316315 ?auto_316317 ) ) ( not ( = ?auto_316315 ?auto_316318 ) ) ( not ( = ?auto_316315 ?auto_316319 ) ) ( not ( = ?auto_316315 ?auto_316320 ) ) ( not ( = ?auto_316315 ?auto_316321 ) ) ( not ( = ?auto_316316 ?auto_316317 ) ) ( not ( = ?auto_316316 ?auto_316318 ) ) ( not ( = ?auto_316316 ?auto_316319 ) ) ( not ( = ?auto_316316 ?auto_316320 ) ) ( not ( = ?auto_316316 ?auto_316321 ) ) ( not ( = ?auto_316317 ?auto_316318 ) ) ( not ( = ?auto_316317 ?auto_316319 ) ) ( not ( = ?auto_316317 ?auto_316320 ) ) ( not ( = ?auto_316317 ?auto_316321 ) ) ( not ( = ?auto_316318 ?auto_316319 ) ) ( not ( = ?auto_316318 ?auto_316320 ) ) ( not ( = ?auto_316318 ?auto_316321 ) ) ( not ( = ?auto_316319 ?auto_316320 ) ) ( not ( = ?auto_316319 ?auto_316321 ) ) ( not ( = ?auto_316320 ?auto_316321 ) ) ( CLEAR ?auto_316318 ) ( ON ?auto_316319 ?auto_316320 ) ( CLEAR ?auto_316319 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_316308 ?auto_316309 ?auto_316310 ?auto_316311 ?auto_316312 ?auto_316313 ?auto_316314 ?auto_316315 ?auto_316316 ?auto_316317 ?auto_316318 ?auto_316319 )
      ( MAKE-13PILE ?auto_316308 ?auto_316309 ?auto_316310 ?auto_316311 ?auto_316312 ?auto_316313 ?auto_316314 ?auto_316315 ?auto_316316 ?auto_316317 ?auto_316318 ?auto_316319 ?auto_316320 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_316335 - BLOCK
      ?auto_316336 - BLOCK
      ?auto_316337 - BLOCK
      ?auto_316338 - BLOCK
      ?auto_316339 - BLOCK
      ?auto_316340 - BLOCK
      ?auto_316341 - BLOCK
      ?auto_316342 - BLOCK
      ?auto_316343 - BLOCK
      ?auto_316344 - BLOCK
      ?auto_316345 - BLOCK
      ?auto_316346 - BLOCK
      ?auto_316347 - BLOCK
    )
    :vars
    (
      ?auto_316348 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_316347 ?auto_316348 ) ( ON-TABLE ?auto_316335 ) ( ON ?auto_316336 ?auto_316335 ) ( ON ?auto_316337 ?auto_316336 ) ( ON ?auto_316338 ?auto_316337 ) ( ON ?auto_316339 ?auto_316338 ) ( ON ?auto_316340 ?auto_316339 ) ( ON ?auto_316341 ?auto_316340 ) ( ON ?auto_316342 ?auto_316341 ) ( ON ?auto_316343 ?auto_316342 ) ( ON ?auto_316344 ?auto_316343 ) ( ON ?auto_316345 ?auto_316344 ) ( not ( = ?auto_316335 ?auto_316336 ) ) ( not ( = ?auto_316335 ?auto_316337 ) ) ( not ( = ?auto_316335 ?auto_316338 ) ) ( not ( = ?auto_316335 ?auto_316339 ) ) ( not ( = ?auto_316335 ?auto_316340 ) ) ( not ( = ?auto_316335 ?auto_316341 ) ) ( not ( = ?auto_316335 ?auto_316342 ) ) ( not ( = ?auto_316335 ?auto_316343 ) ) ( not ( = ?auto_316335 ?auto_316344 ) ) ( not ( = ?auto_316335 ?auto_316345 ) ) ( not ( = ?auto_316335 ?auto_316346 ) ) ( not ( = ?auto_316335 ?auto_316347 ) ) ( not ( = ?auto_316335 ?auto_316348 ) ) ( not ( = ?auto_316336 ?auto_316337 ) ) ( not ( = ?auto_316336 ?auto_316338 ) ) ( not ( = ?auto_316336 ?auto_316339 ) ) ( not ( = ?auto_316336 ?auto_316340 ) ) ( not ( = ?auto_316336 ?auto_316341 ) ) ( not ( = ?auto_316336 ?auto_316342 ) ) ( not ( = ?auto_316336 ?auto_316343 ) ) ( not ( = ?auto_316336 ?auto_316344 ) ) ( not ( = ?auto_316336 ?auto_316345 ) ) ( not ( = ?auto_316336 ?auto_316346 ) ) ( not ( = ?auto_316336 ?auto_316347 ) ) ( not ( = ?auto_316336 ?auto_316348 ) ) ( not ( = ?auto_316337 ?auto_316338 ) ) ( not ( = ?auto_316337 ?auto_316339 ) ) ( not ( = ?auto_316337 ?auto_316340 ) ) ( not ( = ?auto_316337 ?auto_316341 ) ) ( not ( = ?auto_316337 ?auto_316342 ) ) ( not ( = ?auto_316337 ?auto_316343 ) ) ( not ( = ?auto_316337 ?auto_316344 ) ) ( not ( = ?auto_316337 ?auto_316345 ) ) ( not ( = ?auto_316337 ?auto_316346 ) ) ( not ( = ?auto_316337 ?auto_316347 ) ) ( not ( = ?auto_316337 ?auto_316348 ) ) ( not ( = ?auto_316338 ?auto_316339 ) ) ( not ( = ?auto_316338 ?auto_316340 ) ) ( not ( = ?auto_316338 ?auto_316341 ) ) ( not ( = ?auto_316338 ?auto_316342 ) ) ( not ( = ?auto_316338 ?auto_316343 ) ) ( not ( = ?auto_316338 ?auto_316344 ) ) ( not ( = ?auto_316338 ?auto_316345 ) ) ( not ( = ?auto_316338 ?auto_316346 ) ) ( not ( = ?auto_316338 ?auto_316347 ) ) ( not ( = ?auto_316338 ?auto_316348 ) ) ( not ( = ?auto_316339 ?auto_316340 ) ) ( not ( = ?auto_316339 ?auto_316341 ) ) ( not ( = ?auto_316339 ?auto_316342 ) ) ( not ( = ?auto_316339 ?auto_316343 ) ) ( not ( = ?auto_316339 ?auto_316344 ) ) ( not ( = ?auto_316339 ?auto_316345 ) ) ( not ( = ?auto_316339 ?auto_316346 ) ) ( not ( = ?auto_316339 ?auto_316347 ) ) ( not ( = ?auto_316339 ?auto_316348 ) ) ( not ( = ?auto_316340 ?auto_316341 ) ) ( not ( = ?auto_316340 ?auto_316342 ) ) ( not ( = ?auto_316340 ?auto_316343 ) ) ( not ( = ?auto_316340 ?auto_316344 ) ) ( not ( = ?auto_316340 ?auto_316345 ) ) ( not ( = ?auto_316340 ?auto_316346 ) ) ( not ( = ?auto_316340 ?auto_316347 ) ) ( not ( = ?auto_316340 ?auto_316348 ) ) ( not ( = ?auto_316341 ?auto_316342 ) ) ( not ( = ?auto_316341 ?auto_316343 ) ) ( not ( = ?auto_316341 ?auto_316344 ) ) ( not ( = ?auto_316341 ?auto_316345 ) ) ( not ( = ?auto_316341 ?auto_316346 ) ) ( not ( = ?auto_316341 ?auto_316347 ) ) ( not ( = ?auto_316341 ?auto_316348 ) ) ( not ( = ?auto_316342 ?auto_316343 ) ) ( not ( = ?auto_316342 ?auto_316344 ) ) ( not ( = ?auto_316342 ?auto_316345 ) ) ( not ( = ?auto_316342 ?auto_316346 ) ) ( not ( = ?auto_316342 ?auto_316347 ) ) ( not ( = ?auto_316342 ?auto_316348 ) ) ( not ( = ?auto_316343 ?auto_316344 ) ) ( not ( = ?auto_316343 ?auto_316345 ) ) ( not ( = ?auto_316343 ?auto_316346 ) ) ( not ( = ?auto_316343 ?auto_316347 ) ) ( not ( = ?auto_316343 ?auto_316348 ) ) ( not ( = ?auto_316344 ?auto_316345 ) ) ( not ( = ?auto_316344 ?auto_316346 ) ) ( not ( = ?auto_316344 ?auto_316347 ) ) ( not ( = ?auto_316344 ?auto_316348 ) ) ( not ( = ?auto_316345 ?auto_316346 ) ) ( not ( = ?auto_316345 ?auto_316347 ) ) ( not ( = ?auto_316345 ?auto_316348 ) ) ( not ( = ?auto_316346 ?auto_316347 ) ) ( not ( = ?auto_316346 ?auto_316348 ) ) ( not ( = ?auto_316347 ?auto_316348 ) ) ( CLEAR ?auto_316345 ) ( ON ?auto_316346 ?auto_316347 ) ( CLEAR ?auto_316346 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_316335 ?auto_316336 ?auto_316337 ?auto_316338 ?auto_316339 ?auto_316340 ?auto_316341 ?auto_316342 ?auto_316343 ?auto_316344 ?auto_316345 ?auto_316346 )
      ( MAKE-13PILE ?auto_316335 ?auto_316336 ?auto_316337 ?auto_316338 ?auto_316339 ?auto_316340 ?auto_316341 ?auto_316342 ?auto_316343 ?auto_316344 ?auto_316345 ?auto_316346 ?auto_316347 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_316362 - BLOCK
      ?auto_316363 - BLOCK
      ?auto_316364 - BLOCK
      ?auto_316365 - BLOCK
      ?auto_316366 - BLOCK
      ?auto_316367 - BLOCK
      ?auto_316368 - BLOCK
      ?auto_316369 - BLOCK
      ?auto_316370 - BLOCK
      ?auto_316371 - BLOCK
      ?auto_316372 - BLOCK
      ?auto_316373 - BLOCK
      ?auto_316374 - BLOCK
    )
    :vars
    (
      ?auto_316375 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_316374 ?auto_316375 ) ( ON-TABLE ?auto_316362 ) ( ON ?auto_316363 ?auto_316362 ) ( ON ?auto_316364 ?auto_316363 ) ( ON ?auto_316365 ?auto_316364 ) ( ON ?auto_316366 ?auto_316365 ) ( ON ?auto_316367 ?auto_316366 ) ( ON ?auto_316368 ?auto_316367 ) ( ON ?auto_316369 ?auto_316368 ) ( ON ?auto_316370 ?auto_316369 ) ( ON ?auto_316371 ?auto_316370 ) ( not ( = ?auto_316362 ?auto_316363 ) ) ( not ( = ?auto_316362 ?auto_316364 ) ) ( not ( = ?auto_316362 ?auto_316365 ) ) ( not ( = ?auto_316362 ?auto_316366 ) ) ( not ( = ?auto_316362 ?auto_316367 ) ) ( not ( = ?auto_316362 ?auto_316368 ) ) ( not ( = ?auto_316362 ?auto_316369 ) ) ( not ( = ?auto_316362 ?auto_316370 ) ) ( not ( = ?auto_316362 ?auto_316371 ) ) ( not ( = ?auto_316362 ?auto_316372 ) ) ( not ( = ?auto_316362 ?auto_316373 ) ) ( not ( = ?auto_316362 ?auto_316374 ) ) ( not ( = ?auto_316362 ?auto_316375 ) ) ( not ( = ?auto_316363 ?auto_316364 ) ) ( not ( = ?auto_316363 ?auto_316365 ) ) ( not ( = ?auto_316363 ?auto_316366 ) ) ( not ( = ?auto_316363 ?auto_316367 ) ) ( not ( = ?auto_316363 ?auto_316368 ) ) ( not ( = ?auto_316363 ?auto_316369 ) ) ( not ( = ?auto_316363 ?auto_316370 ) ) ( not ( = ?auto_316363 ?auto_316371 ) ) ( not ( = ?auto_316363 ?auto_316372 ) ) ( not ( = ?auto_316363 ?auto_316373 ) ) ( not ( = ?auto_316363 ?auto_316374 ) ) ( not ( = ?auto_316363 ?auto_316375 ) ) ( not ( = ?auto_316364 ?auto_316365 ) ) ( not ( = ?auto_316364 ?auto_316366 ) ) ( not ( = ?auto_316364 ?auto_316367 ) ) ( not ( = ?auto_316364 ?auto_316368 ) ) ( not ( = ?auto_316364 ?auto_316369 ) ) ( not ( = ?auto_316364 ?auto_316370 ) ) ( not ( = ?auto_316364 ?auto_316371 ) ) ( not ( = ?auto_316364 ?auto_316372 ) ) ( not ( = ?auto_316364 ?auto_316373 ) ) ( not ( = ?auto_316364 ?auto_316374 ) ) ( not ( = ?auto_316364 ?auto_316375 ) ) ( not ( = ?auto_316365 ?auto_316366 ) ) ( not ( = ?auto_316365 ?auto_316367 ) ) ( not ( = ?auto_316365 ?auto_316368 ) ) ( not ( = ?auto_316365 ?auto_316369 ) ) ( not ( = ?auto_316365 ?auto_316370 ) ) ( not ( = ?auto_316365 ?auto_316371 ) ) ( not ( = ?auto_316365 ?auto_316372 ) ) ( not ( = ?auto_316365 ?auto_316373 ) ) ( not ( = ?auto_316365 ?auto_316374 ) ) ( not ( = ?auto_316365 ?auto_316375 ) ) ( not ( = ?auto_316366 ?auto_316367 ) ) ( not ( = ?auto_316366 ?auto_316368 ) ) ( not ( = ?auto_316366 ?auto_316369 ) ) ( not ( = ?auto_316366 ?auto_316370 ) ) ( not ( = ?auto_316366 ?auto_316371 ) ) ( not ( = ?auto_316366 ?auto_316372 ) ) ( not ( = ?auto_316366 ?auto_316373 ) ) ( not ( = ?auto_316366 ?auto_316374 ) ) ( not ( = ?auto_316366 ?auto_316375 ) ) ( not ( = ?auto_316367 ?auto_316368 ) ) ( not ( = ?auto_316367 ?auto_316369 ) ) ( not ( = ?auto_316367 ?auto_316370 ) ) ( not ( = ?auto_316367 ?auto_316371 ) ) ( not ( = ?auto_316367 ?auto_316372 ) ) ( not ( = ?auto_316367 ?auto_316373 ) ) ( not ( = ?auto_316367 ?auto_316374 ) ) ( not ( = ?auto_316367 ?auto_316375 ) ) ( not ( = ?auto_316368 ?auto_316369 ) ) ( not ( = ?auto_316368 ?auto_316370 ) ) ( not ( = ?auto_316368 ?auto_316371 ) ) ( not ( = ?auto_316368 ?auto_316372 ) ) ( not ( = ?auto_316368 ?auto_316373 ) ) ( not ( = ?auto_316368 ?auto_316374 ) ) ( not ( = ?auto_316368 ?auto_316375 ) ) ( not ( = ?auto_316369 ?auto_316370 ) ) ( not ( = ?auto_316369 ?auto_316371 ) ) ( not ( = ?auto_316369 ?auto_316372 ) ) ( not ( = ?auto_316369 ?auto_316373 ) ) ( not ( = ?auto_316369 ?auto_316374 ) ) ( not ( = ?auto_316369 ?auto_316375 ) ) ( not ( = ?auto_316370 ?auto_316371 ) ) ( not ( = ?auto_316370 ?auto_316372 ) ) ( not ( = ?auto_316370 ?auto_316373 ) ) ( not ( = ?auto_316370 ?auto_316374 ) ) ( not ( = ?auto_316370 ?auto_316375 ) ) ( not ( = ?auto_316371 ?auto_316372 ) ) ( not ( = ?auto_316371 ?auto_316373 ) ) ( not ( = ?auto_316371 ?auto_316374 ) ) ( not ( = ?auto_316371 ?auto_316375 ) ) ( not ( = ?auto_316372 ?auto_316373 ) ) ( not ( = ?auto_316372 ?auto_316374 ) ) ( not ( = ?auto_316372 ?auto_316375 ) ) ( not ( = ?auto_316373 ?auto_316374 ) ) ( not ( = ?auto_316373 ?auto_316375 ) ) ( not ( = ?auto_316374 ?auto_316375 ) ) ( ON ?auto_316373 ?auto_316374 ) ( CLEAR ?auto_316371 ) ( ON ?auto_316372 ?auto_316373 ) ( CLEAR ?auto_316372 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_316362 ?auto_316363 ?auto_316364 ?auto_316365 ?auto_316366 ?auto_316367 ?auto_316368 ?auto_316369 ?auto_316370 ?auto_316371 ?auto_316372 )
      ( MAKE-13PILE ?auto_316362 ?auto_316363 ?auto_316364 ?auto_316365 ?auto_316366 ?auto_316367 ?auto_316368 ?auto_316369 ?auto_316370 ?auto_316371 ?auto_316372 ?auto_316373 ?auto_316374 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_316389 - BLOCK
      ?auto_316390 - BLOCK
      ?auto_316391 - BLOCK
      ?auto_316392 - BLOCK
      ?auto_316393 - BLOCK
      ?auto_316394 - BLOCK
      ?auto_316395 - BLOCK
      ?auto_316396 - BLOCK
      ?auto_316397 - BLOCK
      ?auto_316398 - BLOCK
      ?auto_316399 - BLOCK
      ?auto_316400 - BLOCK
      ?auto_316401 - BLOCK
    )
    :vars
    (
      ?auto_316402 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_316401 ?auto_316402 ) ( ON-TABLE ?auto_316389 ) ( ON ?auto_316390 ?auto_316389 ) ( ON ?auto_316391 ?auto_316390 ) ( ON ?auto_316392 ?auto_316391 ) ( ON ?auto_316393 ?auto_316392 ) ( ON ?auto_316394 ?auto_316393 ) ( ON ?auto_316395 ?auto_316394 ) ( ON ?auto_316396 ?auto_316395 ) ( ON ?auto_316397 ?auto_316396 ) ( ON ?auto_316398 ?auto_316397 ) ( not ( = ?auto_316389 ?auto_316390 ) ) ( not ( = ?auto_316389 ?auto_316391 ) ) ( not ( = ?auto_316389 ?auto_316392 ) ) ( not ( = ?auto_316389 ?auto_316393 ) ) ( not ( = ?auto_316389 ?auto_316394 ) ) ( not ( = ?auto_316389 ?auto_316395 ) ) ( not ( = ?auto_316389 ?auto_316396 ) ) ( not ( = ?auto_316389 ?auto_316397 ) ) ( not ( = ?auto_316389 ?auto_316398 ) ) ( not ( = ?auto_316389 ?auto_316399 ) ) ( not ( = ?auto_316389 ?auto_316400 ) ) ( not ( = ?auto_316389 ?auto_316401 ) ) ( not ( = ?auto_316389 ?auto_316402 ) ) ( not ( = ?auto_316390 ?auto_316391 ) ) ( not ( = ?auto_316390 ?auto_316392 ) ) ( not ( = ?auto_316390 ?auto_316393 ) ) ( not ( = ?auto_316390 ?auto_316394 ) ) ( not ( = ?auto_316390 ?auto_316395 ) ) ( not ( = ?auto_316390 ?auto_316396 ) ) ( not ( = ?auto_316390 ?auto_316397 ) ) ( not ( = ?auto_316390 ?auto_316398 ) ) ( not ( = ?auto_316390 ?auto_316399 ) ) ( not ( = ?auto_316390 ?auto_316400 ) ) ( not ( = ?auto_316390 ?auto_316401 ) ) ( not ( = ?auto_316390 ?auto_316402 ) ) ( not ( = ?auto_316391 ?auto_316392 ) ) ( not ( = ?auto_316391 ?auto_316393 ) ) ( not ( = ?auto_316391 ?auto_316394 ) ) ( not ( = ?auto_316391 ?auto_316395 ) ) ( not ( = ?auto_316391 ?auto_316396 ) ) ( not ( = ?auto_316391 ?auto_316397 ) ) ( not ( = ?auto_316391 ?auto_316398 ) ) ( not ( = ?auto_316391 ?auto_316399 ) ) ( not ( = ?auto_316391 ?auto_316400 ) ) ( not ( = ?auto_316391 ?auto_316401 ) ) ( not ( = ?auto_316391 ?auto_316402 ) ) ( not ( = ?auto_316392 ?auto_316393 ) ) ( not ( = ?auto_316392 ?auto_316394 ) ) ( not ( = ?auto_316392 ?auto_316395 ) ) ( not ( = ?auto_316392 ?auto_316396 ) ) ( not ( = ?auto_316392 ?auto_316397 ) ) ( not ( = ?auto_316392 ?auto_316398 ) ) ( not ( = ?auto_316392 ?auto_316399 ) ) ( not ( = ?auto_316392 ?auto_316400 ) ) ( not ( = ?auto_316392 ?auto_316401 ) ) ( not ( = ?auto_316392 ?auto_316402 ) ) ( not ( = ?auto_316393 ?auto_316394 ) ) ( not ( = ?auto_316393 ?auto_316395 ) ) ( not ( = ?auto_316393 ?auto_316396 ) ) ( not ( = ?auto_316393 ?auto_316397 ) ) ( not ( = ?auto_316393 ?auto_316398 ) ) ( not ( = ?auto_316393 ?auto_316399 ) ) ( not ( = ?auto_316393 ?auto_316400 ) ) ( not ( = ?auto_316393 ?auto_316401 ) ) ( not ( = ?auto_316393 ?auto_316402 ) ) ( not ( = ?auto_316394 ?auto_316395 ) ) ( not ( = ?auto_316394 ?auto_316396 ) ) ( not ( = ?auto_316394 ?auto_316397 ) ) ( not ( = ?auto_316394 ?auto_316398 ) ) ( not ( = ?auto_316394 ?auto_316399 ) ) ( not ( = ?auto_316394 ?auto_316400 ) ) ( not ( = ?auto_316394 ?auto_316401 ) ) ( not ( = ?auto_316394 ?auto_316402 ) ) ( not ( = ?auto_316395 ?auto_316396 ) ) ( not ( = ?auto_316395 ?auto_316397 ) ) ( not ( = ?auto_316395 ?auto_316398 ) ) ( not ( = ?auto_316395 ?auto_316399 ) ) ( not ( = ?auto_316395 ?auto_316400 ) ) ( not ( = ?auto_316395 ?auto_316401 ) ) ( not ( = ?auto_316395 ?auto_316402 ) ) ( not ( = ?auto_316396 ?auto_316397 ) ) ( not ( = ?auto_316396 ?auto_316398 ) ) ( not ( = ?auto_316396 ?auto_316399 ) ) ( not ( = ?auto_316396 ?auto_316400 ) ) ( not ( = ?auto_316396 ?auto_316401 ) ) ( not ( = ?auto_316396 ?auto_316402 ) ) ( not ( = ?auto_316397 ?auto_316398 ) ) ( not ( = ?auto_316397 ?auto_316399 ) ) ( not ( = ?auto_316397 ?auto_316400 ) ) ( not ( = ?auto_316397 ?auto_316401 ) ) ( not ( = ?auto_316397 ?auto_316402 ) ) ( not ( = ?auto_316398 ?auto_316399 ) ) ( not ( = ?auto_316398 ?auto_316400 ) ) ( not ( = ?auto_316398 ?auto_316401 ) ) ( not ( = ?auto_316398 ?auto_316402 ) ) ( not ( = ?auto_316399 ?auto_316400 ) ) ( not ( = ?auto_316399 ?auto_316401 ) ) ( not ( = ?auto_316399 ?auto_316402 ) ) ( not ( = ?auto_316400 ?auto_316401 ) ) ( not ( = ?auto_316400 ?auto_316402 ) ) ( not ( = ?auto_316401 ?auto_316402 ) ) ( ON ?auto_316400 ?auto_316401 ) ( CLEAR ?auto_316398 ) ( ON ?auto_316399 ?auto_316400 ) ( CLEAR ?auto_316399 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_316389 ?auto_316390 ?auto_316391 ?auto_316392 ?auto_316393 ?auto_316394 ?auto_316395 ?auto_316396 ?auto_316397 ?auto_316398 ?auto_316399 )
      ( MAKE-13PILE ?auto_316389 ?auto_316390 ?auto_316391 ?auto_316392 ?auto_316393 ?auto_316394 ?auto_316395 ?auto_316396 ?auto_316397 ?auto_316398 ?auto_316399 ?auto_316400 ?auto_316401 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_316416 - BLOCK
      ?auto_316417 - BLOCK
      ?auto_316418 - BLOCK
      ?auto_316419 - BLOCK
      ?auto_316420 - BLOCK
      ?auto_316421 - BLOCK
      ?auto_316422 - BLOCK
      ?auto_316423 - BLOCK
      ?auto_316424 - BLOCK
      ?auto_316425 - BLOCK
      ?auto_316426 - BLOCK
      ?auto_316427 - BLOCK
      ?auto_316428 - BLOCK
    )
    :vars
    (
      ?auto_316429 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_316428 ?auto_316429 ) ( ON-TABLE ?auto_316416 ) ( ON ?auto_316417 ?auto_316416 ) ( ON ?auto_316418 ?auto_316417 ) ( ON ?auto_316419 ?auto_316418 ) ( ON ?auto_316420 ?auto_316419 ) ( ON ?auto_316421 ?auto_316420 ) ( ON ?auto_316422 ?auto_316421 ) ( ON ?auto_316423 ?auto_316422 ) ( ON ?auto_316424 ?auto_316423 ) ( not ( = ?auto_316416 ?auto_316417 ) ) ( not ( = ?auto_316416 ?auto_316418 ) ) ( not ( = ?auto_316416 ?auto_316419 ) ) ( not ( = ?auto_316416 ?auto_316420 ) ) ( not ( = ?auto_316416 ?auto_316421 ) ) ( not ( = ?auto_316416 ?auto_316422 ) ) ( not ( = ?auto_316416 ?auto_316423 ) ) ( not ( = ?auto_316416 ?auto_316424 ) ) ( not ( = ?auto_316416 ?auto_316425 ) ) ( not ( = ?auto_316416 ?auto_316426 ) ) ( not ( = ?auto_316416 ?auto_316427 ) ) ( not ( = ?auto_316416 ?auto_316428 ) ) ( not ( = ?auto_316416 ?auto_316429 ) ) ( not ( = ?auto_316417 ?auto_316418 ) ) ( not ( = ?auto_316417 ?auto_316419 ) ) ( not ( = ?auto_316417 ?auto_316420 ) ) ( not ( = ?auto_316417 ?auto_316421 ) ) ( not ( = ?auto_316417 ?auto_316422 ) ) ( not ( = ?auto_316417 ?auto_316423 ) ) ( not ( = ?auto_316417 ?auto_316424 ) ) ( not ( = ?auto_316417 ?auto_316425 ) ) ( not ( = ?auto_316417 ?auto_316426 ) ) ( not ( = ?auto_316417 ?auto_316427 ) ) ( not ( = ?auto_316417 ?auto_316428 ) ) ( not ( = ?auto_316417 ?auto_316429 ) ) ( not ( = ?auto_316418 ?auto_316419 ) ) ( not ( = ?auto_316418 ?auto_316420 ) ) ( not ( = ?auto_316418 ?auto_316421 ) ) ( not ( = ?auto_316418 ?auto_316422 ) ) ( not ( = ?auto_316418 ?auto_316423 ) ) ( not ( = ?auto_316418 ?auto_316424 ) ) ( not ( = ?auto_316418 ?auto_316425 ) ) ( not ( = ?auto_316418 ?auto_316426 ) ) ( not ( = ?auto_316418 ?auto_316427 ) ) ( not ( = ?auto_316418 ?auto_316428 ) ) ( not ( = ?auto_316418 ?auto_316429 ) ) ( not ( = ?auto_316419 ?auto_316420 ) ) ( not ( = ?auto_316419 ?auto_316421 ) ) ( not ( = ?auto_316419 ?auto_316422 ) ) ( not ( = ?auto_316419 ?auto_316423 ) ) ( not ( = ?auto_316419 ?auto_316424 ) ) ( not ( = ?auto_316419 ?auto_316425 ) ) ( not ( = ?auto_316419 ?auto_316426 ) ) ( not ( = ?auto_316419 ?auto_316427 ) ) ( not ( = ?auto_316419 ?auto_316428 ) ) ( not ( = ?auto_316419 ?auto_316429 ) ) ( not ( = ?auto_316420 ?auto_316421 ) ) ( not ( = ?auto_316420 ?auto_316422 ) ) ( not ( = ?auto_316420 ?auto_316423 ) ) ( not ( = ?auto_316420 ?auto_316424 ) ) ( not ( = ?auto_316420 ?auto_316425 ) ) ( not ( = ?auto_316420 ?auto_316426 ) ) ( not ( = ?auto_316420 ?auto_316427 ) ) ( not ( = ?auto_316420 ?auto_316428 ) ) ( not ( = ?auto_316420 ?auto_316429 ) ) ( not ( = ?auto_316421 ?auto_316422 ) ) ( not ( = ?auto_316421 ?auto_316423 ) ) ( not ( = ?auto_316421 ?auto_316424 ) ) ( not ( = ?auto_316421 ?auto_316425 ) ) ( not ( = ?auto_316421 ?auto_316426 ) ) ( not ( = ?auto_316421 ?auto_316427 ) ) ( not ( = ?auto_316421 ?auto_316428 ) ) ( not ( = ?auto_316421 ?auto_316429 ) ) ( not ( = ?auto_316422 ?auto_316423 ) ) ( not ( = ?auto_316422 ?auto_316424 ) ) ( not ( = ?auto_316422 ?auto_316425 ) ) ( not ( = ?auto_316422 ?auto_316426 ) ) ( not ( = ?auto_316422 ?auto_316427 ) ) ( not ( = ?auto_316422 ?auto_316428 ) ) ( not ( = ?auto_316422 ?auto_316429 ) ) ( not ( = ?auto_316423 ?auto_316424 ) ) ( not ( = ?auto_316423 ?auto_316425 ) ) ( not ( = ?auto_316423 ?auto_316426 ) ) ( not ( = ?auto_316423 ?auto_316427 ) ) ( not ( = ?auto_316423 ?auto_316428 ) ) ( not ( = ?auto_316423 ?auto_316429 ) ) ( not ( = ?auto_316424 ?auto_316425 ) ) ( not ( = ?auto_316424 ?auto_316426 ) ) ( not ( = ?auto_316424 ?auto_316427 ) ) ( not ( = ?auto_316424 ?auto_316428 ) ) ( not ( = ?auto_316424 ?auto_316429 ) ) ( not ( = ?auto_316425 ?auto_316426 ) ) ( not ( = ?auto_316425 ?auto_316427 ) ) ( not ( = ?auto_316425 ?auto_316428 ) ) ( not ( = ?auto_316425 ?auto_316429 ) ) ( not ( = ?auto_316426 ?auto_316427 ) ) ( not ( = ?auto_316426 ?auto_316428 ) ) ( not ( = ?auto_316426 ?auto_316429 ) ) ( not ( = ?auto_316427 ?auto_316428 ) ) ( not ( = ?auto_316427 ?auto_316429 ) ) ( not ( = ?auto_316428 ?auto_316429 ) ) ( ON ?auto_316427 ?auto_316428 ) ( ON ?auto_316426 ?auto_316427 ) ( CLEAR ?auto_316424 ) ( ON ?auto_316425 ?auto_316426 ) ( CLEAR ?auto_316425 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_316416 ?auto_316417 ?auto_316418 ?auto_316419 ?auto_316420 ?auto_316421 ?auto_316422 ?auto_316423 ?auto_316424 ?auto_316425 )
      ( MAKE-13PILE ?auto_316416 ?auto_316417 ?auto_316418 ?auto_316419 ?auto_316420 ?auto_316421 ?auto_316422 ?auto_316423 ?auto_316424 ?auto_316425 ?auto_316426 ?auto_316427 ?auto_316428 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_316443 - BLOCK
      ?auto_316444 - BLOCK
      ?auto_316445 - BLOCK
      ?auto_316446 - BLOCK
      ?auto_316447 - BLOCK
      ?auto_316448 - BLOCK
      ?auto_316449 - BLOCK
      ?auto_316450 - BLOCK
      ?auto_316451 - BLOCK
      ?auto_316452 - BLOCK
      ?auto_316453 - BLOCK
      ?auto_316454 - BLOCK
      ?auto_316455 - BLOCK
    )
    :vars
    (
      ?auto_316456 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_316455 ?auto_316456 ) ( ON-TABLE ?auto_316443 ) ( ON ?auto_316444 ?auto_316443 ) ( ON ?auto_316445 ?auto_316444 ) ( ON ?auto_316446 ?auto_316445 ) ( ON ?auto_316447 ?auto_316446 ) ( ON ?auto_316448 ?auto_316447 ) ( ON ?auto_316449 ?auto_316448 ) ( ON ?auto_316450 ?auto_316449 ) ( ON ?auto_316451 ?auto_316450 ) ( not ( = ?auto_316443 ?auto_316444 ) ) ( not ( = ?auto_316443 ?auto_316445 ) ) ( not ( = ?auto_316443 ?auto_316446 ) ) ( not ( = ?auto_316443 ?auto_316447 ) ) ( not ( = ?auto_316443 ?auto_316448 ) ) ( not ( = ?auto_316443 ?auto_316449 ) ) ( not ( = ?auto_316443 ?auto_316450 ) ) ( not ( = ?auto_316443 ?auto_316451 ) ) ( not ( = ?auto_316443 ?auto_316452 ) ) ( not ( = ?auto_316443 ?auto_316453 ) ) ( not ( = ?auto_316443 ?auto_316454 ) ) ( not ( = ?auto_316443 ?auto_316455 ) ) ( not ( = ?auto_316443 ?auto_316456 ) ) ( not ( = ?auto_316444 ?auto_316445 ) ) ( not ( = ?auto_316444 ?auto_316446 ) ) ( not ( = ?auto_316444 ?auto_316447 ) ) ( not ( = ?auto_316444 ?auto_316448 ) ) ( not ( = ?auto_316444 ?auto_316449 ) ) ( not ( = ?auto_316444 ?auto_316450 ) ) ( not ( = ?auto_316444 ?auto_316451 ) ) ( not ( = ?auto_316444 ?auto_316452 ) ) ( not ( = ?auto_316444 ?auto_316453 ) ) ( not ( = ?auto_316444 ?auto_316454 ) ) ( not ( = ?auto_316444 ?auto_316455 ) ) ( not ( = ?auto_316444 ?auto_316456 ) ) ( not ( = ?auto_316445 ?auto_316446 ) ) ( not ( = ?auto_316445 ?auto_316447 ) ) ( not ( = ?auto_316445 ?auto_316448 ) ) ( not ( = ?auto_316445 ?auto_316449 ) ) ( not ( = ?auto_316445 ?auto_316450 ) ) ( not ( = ?auto_316445 ?auto_316451 ) ) ( not ( = ?auto_316445 ?auto_316452 ) ) ( not ( = ?auto_316445 ?auto_316453 ) ) ( not ( = ?auto_316445 ?auto_316454 ) ) ( not ( = ?auto_316445 ?auto_316455 ) ) ( not ( = ?auto_316445 ?auto_316456 ) ) ( not ( = ?auto_316446 ?auto_316447 ) ) ( not ( = ?auto_316446 ?auto_316448 ) ) ( not ( = ?auto_316446 ?auto_316449 ) ) ( not ( = ?auto_316446 ?auto_316450 ) ) ( not ( = ?auto_316446 ?auto_316451 ) ) ( not ( = ?auto_316446 ?auto_316452 ) ) ( not ( = ?auto_316446 ?auto_316453 ) ) ( not ( = ?auto_316446 ?auto_316454 ) ) ( not ( = ?auto_316446 ?auto_316455 ) ) ( not ( = ?auto_316446 ?auto_316456 ) ) ( not ( = ?auto_316447 ?auto_316448 ) ) ( not ( = ?auto_316447 ?auto_316449 ) ) ( not ( = ?auto_316447 ?auto_316450 ) ) ( not ( = ?auto_316447 ?auto_316451 ) ) ( not ( = ?auto_316447 ?auto_316452 ) ) ( not ( = ?auto_316447 ?auto_316453 ) ) ( not ( = ?auto_316447 ?auto_316454 ) ) ( not ( = ?auto_316447 ?auto_316455 ) ) ( not ( = ?auto_316447 ?auto_316456 ) ) ( not ( = ?auto_316448 ?auto_316449 ) ) ( not ( = ?auto_316448 ?auto_316450 ) ) ( not ( = ?auto_316448 ?auto_316451 ) ) ( not ( = ?auto_316448 ?auto_316452 ) ) ( not ( = ?auto_316448 ?auto_316453 ) ) ( not ( = ?auto_316448 ?auto_316454 ) ) ( not ( = ?auto_316448 ?auto_316455 ) ) ( not ( = ?auto_316448 ?auto_316456 ) ) ( not ( = ?auto_316449 ?auto_316450 ) ) ( not ( = ?auto_316449 ?auto_316451 ) ) ( not ( = ?auto_316449 ?auto_316452 ) ) ( not ( = ?auto_316449 ?auto_316453 ) ) ( not ( = ?auto_316449 ?auto_316454 ) ) ( not ( = ?auto_316449 ?auto_316455 ) ) ( not ( = ?auto_316449 ?auto_316456 ) ) ( not ( = ?auto_316450 ?auto_316451 ) ) ( not ( = ?auto_316450 ?auto_316452 ) ) ( not ( = ?auto_316450 ?auto_316453 ) ) ( not ( = ?auto_316450 ?auto_316454 ) ) ( not ( = ?auto_316450 ?auto_316455 ) ) ( not ( = ?auto_316450 ?auto_316456 ) ) ( not ( = ?auto_316451 ?auto_316452 ) ) ( not ( = ?auto_316451 ?auto_316453 ) ) ( not ( = ?auto_316451 ?auto_316454 ) ) ( not ( = ?auto_316451 ?auto_316455 ) ) ( not ( = ?auto_316451 ?auto_316456 ) ) ( not ( = ?auto_316452 ?auto_316453 ) ) ( not ( = ?auto_316452 ?auto_316454 ) ) ( not ( = ?auto_316452 ?auto_316455 ) ) ( not ( = ?auto_316452 ?auto_316456 ) ) ( not ( = ?auto_316453 ?auto_316454 ) ) ( not ( = ?auto_316453 ?auto_316455 ) ) ( not ( = ?auto_316453 ?auto_316456 ) ) ( not ( = ?auto_316454 ?auto_316455 ) ) ( not ( = ?auto_316454 ?auto_316456 ) ) ( not ( = ?auto_316455 ?auto_316456 ) ) ( ON ?auto_316454 ?auto_316455 ) ( ON ?auto_316453 ?auto_316454 ) ( CLEAR ?auto_316451 ) ( ON ?auto_316452 ?auto_316453 ) ( CLEAR ?auto_316452 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_316443 ?auto_316444 ?auto_316445 ?auto_316446 ?auto_316447 ?auto_316448 ?auto_316449 ?auto_316450 ?auto_316451 ?auto_316452 )
      ( MAKE-13PILE ?auto_316443 ?auto_316444 ?auto_316445 ?auto_316446 ?auto_316447 ?auto_316448 ?auto_316449 ?auto_316450 ?auto_316451 ?auto_316452 ?auto_316453 ?auto_316454 ?auto_316455 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_316470 - BLOCK
      ?auto_316471 - BLOCK
      ?auto_316472 - BLOCK
      ?auto_316473 - BLOCK
      ?auto_316474 - BLOCK
      ?auto_316475 - BLOCK
      ?auto_316476 - BLOCK
      ?auto_316477 - BLOCK
      ?auto_316478 - BLOCK
      ?auto_316479 - BLOCK
      ?auto_316480 - BLOCK
      ?auto_316481 - BLOCK
      ?auto_316482 - BLOCK
    )
    :vars
    (
      ?auto_316483 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_316482 ?auto_316483 ) ( ON-TABLE ?auto_316470 ) ( ON ?auto_316471 ?auto_316470 ) ( ON ?auto_316472 ?auto_316471 ) ( ON ?auto_316473 ?auto_316472 ) ( ON ?auto_316474 ?auto_316473 ) ( ON ?auto_316475 ?auto_316474 ) ( ON ?auto_316476 ?auto_316475 ) ( ON ?auto_316477 ?auto_316476 ) ( not ( = ?auto_316470 ?auto_316471 ) ) ( not ( = ?auto_316470 ?auto_316472 ) ) ( not ( = ?auto_316470 ?auto_316473 ) ) ( not ( = ?auto_316470 ?auto_316474 ) ) ( not ( = ?auto_316470 ?auto_316475 ) ) ( not ( = ?auto_316470 ?auto_316476 ) ) ( not ( = ?auto_316470 ?auto_316477 ) ) ( not ( = ?auto_316470 ?auto_316478 ) ) ( not ( = ?auto_316470 ?auto_316479 ) ) ( not ( = ?auto_316470 ?auto_316480 ) ) ( not ( = ?auto_316470 ?auto_316481 ) ) ( not ( = ?auto_316470 ?auto_316482 ) ) ( not ( = ?auto_316470 ?auto_316483 ) ) ( not ( = ?auto_316471 ?auto_316472 ) ) ( not ( = ?auto_316471 ?auto_316473 ) ) ( not ( = ?auto_316471 ?auto_316474 ) ) ( not ( = ?auto_316471 ?auto_316475 ) ) ( not ( = ?auto_316471 ?auto_316476 ) ) ( not ( = ?auto_316471 ?auto_316477 ) ) ( not ( = ?auto_316471 ?auto_316478 ) ) ( not ( = ?auto_316471 ?auto_316479 ) ) ( not ( = ?auto_316471 ?auto_316480 ) ) ( not ( = ?auto_316471 ?auto_316481 ) ) ( not ( = ?auto_316471 ?auto_316482 ) ) ( not ( = ?auto_316471 ?auto_316483 ) ) ( not ( = ?auto_316472 ?auto_316473 ) ) ( not ( = ?auto_316472 ?auto_316474 ) ) ( not ( = ?auto_316472 ?auto_316475 ) ) ( not ( = ?auto_316472 ?auto_316476 ) ) ( not ( = ?auto_316472 ?auto_316477 ) ) ( not ( = ?auto_316472 ?auto_316478 ) ) ( not ( = ?auto_316472 ?auto_316479 ) ) ( not ( = ?auto_316472 ?auto_316480 ) ) ( not ( = ?auto_316472 ?auto_316481 ) ) ( not ( = ?auto_316472 ?auto_316482 ) ) ( not ( = ?auto_316472 ?auto_316483 ) ) ( not ( = ?auto_316473 ?auto_316474 ) ) ( not ( = ?auto_316473 ?auto_316475 ) ) ( not ( = ?auto_316473 ?auto_316476 ) ) ( not ( = ?auto_316473 ?auto_316477 ) ) ( not ( = ?auto_316473 ?auto_316478 ) ) ( not ( = ?auto_316473 ?auto_316479 ) ) ( not ( = ?auto_316473 ?auto_316480 ) ) ( not ( = ?auto_316473 ?auto_316481 ) ) ( not ( = ?auto_316473 ?auto_316482 ) ) ( not ( = ?auto_316473 ?auto_316483 ) ) ( not ( = ?auto_316474 ?auto_316475 ) ) ( not ( = ?auto_316474 ?auto_316476 ) ) ( not ( = ?auto_316474 ?auto_316477 ) ) ( not ( = ?auto_316474 ?auto_316478 ) ) ( not ( = ?auto_316474 ?auto_316479 ) ) ( not ( = ?auto_316474 ?auto_316480 ) ) ( not ( = ?auto_316474 ?auto_316481 ) ) ( not ( = ?auto_316474 ?auto_316482 ) ) ( not ( = ?auto_316474 ?auto_316483 ) ) ( not ( = ?auto_316475 ?auto_316476 ) ) ( not ( = ?auto_316475 ?auto_316477 ) ) ( not ( = ?auto_316475 ?auto_316478 ) ) ( not ( = ?auto_316475 ?auto_316479 ) ) ( not ( = ?auto_316475 ?auto_316480 ) ) ( not ( = ?auto_316475 ?auto_316481 ) ) ( not ( = ?auto_316475 ?auto_316482 ) ) ( not ( = ?auto_316475 ?auto_316483 ) ) ( not ( = ?auto_316476 ?auto_316477 ) ) ( not ( = ?auto_316476 ?auto_316478 ) ) ( not ( = ?auto_316476 ?auto_316479 ) ) ( not ( = ?auto_316476 ?auto_316480 ) ) ( not ( = ?auto_316476 ?auto_316481 ) ) ( not ( = ?auto_316476 ?auto_316482 ) ) ( not ( = ?auto_316476 ?auto_316483 ) ) ( not ( = ?auto_316477 ?auto_316478 ) ) ( not ( = ?auto_316477 ?auto_316479 ) ) ( not ( = ?auto_316477 ?auto_316480 ) ) ( not ( = ?auto_316477 ?auto_316481 ) ) ( not ( = ?auto_316477 ?auto_316482 ) ) ( not ( = ?auto_316477 ?auto_316483 ) ) ( not ( = ?auto_316478 ?auto_316479 ) ) ( not ( = ?auto_316478 ?auto_316480 ) ) ( not ( = ?auto_316478 ?auto_316481 ) ) ( not ( = ?auto_316478 ?auto_316482 ) ) ( not ( = ?auto_316478 ?auto_316483 ) ) ( not ( = ?auto_316479 ?auto_316480 ) ) ( not ( = ?auto_316479 ?auto_316481 ) ) ( not ( = ?auto_316479 ?auto_316482 ) ) ( not ( = ?auto_316479 ?auto_316483 ) ) ( not ( = ?auto_316480 ?auto_316481 ) ) ( not ( = ?auto_316480 ?auto_316482 ) ) ( not ( = ?auto_316480 ?auto_316483 ) ) ( not ( = ?auto_316481 ?auto_316482 ) ) ( not ( = ?auto_316481 ?auto_316483 ) ) ( not ( = ?auto_316482 ?auto_316483 ) ) ( ON ?auto_316481 ?auto_316482 ) ( ON ?auto_316480 ?auto_316481 ) ( ON ?auto_316479 ?auto_316480 ) ( CLEAR ?auto_316477 ) ( ON ?auto_316478 ?auto_316479 ) ( CLEAR ?auto_316478 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_316470 ?auto_316471 ?auto_316472 ?auto_316473 ?auto_316474 ?auto_316475 ?auto_316476 ?auto_316477 ?auto_316478 )
      ( MAKE-13PILE ?auto_316470 ?auto_316471 ?auto_316472 ?auto_316473 ?auto_316474 ?auto_316475 ?auto_316476 ?auto_316477 ?auto_316478 ?auto_316479 ?auto_316480 ?auto_316481 ?auto_316482 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_316497 - BLOCK
      ?auto_316498 - BLOCK
      ?auto_316499 - BLOCK
      ?auto_316500 - BLOCK
      ?auto_316501 - BLOCK
      ?auto_316502 - BLOCK
      ?auto_316503 - BLOCK
      ?auto_316504 - BLOCK
      ?auto_316505 - BLOCK
      ?auto_316506 - BLOCK
      ?auto_316507 - BLOCK
      ?auto_316508 - BLOCK
      ?auto_316509 - BLOCK
    )
    :vars
    (
      ?auto_316510 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_316509 ?auto_316510 ) ( ON-TABLE ?auto_316497 ) ( ON ?auto_316498 ?auto_316497 ) ( ON ?auto_316499 ?auto_316498 ) ( ON ?auto_316500 ?auto_316499 ) ( ON ?auto_316501 ?auto_316500 ) ( ON ?auto_316502 ?auto_316501 ) ( ON ?auto_316503 ?auto_316502 ) ( ON ?auto_316504 ?auto_316503 ) ( not ( = ?auto_316497 ?auto_316498 ) ) ( not ( = ?auto_316497 ?auto_316499 ) ) ( not ( = ?auto_316497 ?auto_316500 ) ) ( not ( = ?auto_316497 ?auto_316501 ) ) ( not ( = ?auto_316497 ?auto_316502 ) ) ( not ( = ?auto_316497 ?auto_316503 ) ) ( not ( = ?auto_316497 ?auto_316504 ) ) ( not ( = ?auto_316497 ?auto_316505 ) ) ( not ( = ?auto_316497 ?auto_316506 ) ) ( not ( = ?auto_316497 ?auto_316507 ) ) ( not ( = ?auto_316497 ?auto_316508 ) ) ( not ( = ?auto_316497 ?auto_316509 ) ) ( not ( = ?auto_316497 ?auto_316510 ) ) ( not ( = ?auto_316498 ?auto_316499 ) ) ( not ( = ?auto_316498 ?auto_316500 ) ) ( not ( = ?auto_316498 ?auto_316501 ) ) ( not ( = ?auto_316498 ?auto_316502 ) ) ( not ( = ?auto_316498 ?auto_316503 ) ) ( not ( = ?auto_316498 ?auto_316504 ) ) ( not ( = ?auto_316498 ?auto_316505 ) ) ( not ( = ?auto_316498 ?auto_316506 ) ) ( not ( = ?auto_316498 ?auto_316507 ) ) ( not ( = ?auto_316498 ?auto_316508 ) ) ( not ( = ?auto_316498 ?auto_316509 ) ) ( not ( = ?auto_316498 ?auto_316510 ) ) ( not ( = ?auto_316499 ?auto_316500 ) ) ( not ( = ?auto_316499 ?auto_316501 ) ) ( not ( = ?auto_316499 ?auto_316502 ) ) ( not ( = ?auto_316499 ?auto_316503 ) ) ( not ( = ?auto_316499 ?auto_316504 ) ) ( not ( = ?auto_316499 ?auto_316505 ) ) ( not ( = ?auto_316499 ?auto_316506 ) ) ( not ( = ?auto_316499 ?auto_316507 ) ) ( not ( = ?auto_316499 ?auto_316508 ) ) ( not ( = ?auto_316499 ?auto_316509 ) ) ( not ( = ?auto_316499 ?auto_316510 ) ) ( not ( = ?auto_316500 ?auto_316501 ) ) ( not ( = ?auto_316500 ?auto_316502 ) ) ( not ( = ?auto_316500 ?auto_316503 ) ) ( not ( = ?auto_316500 ?auto_316504 ) ) ( not ( = ?auto_316500 ?auto_316505 ) ) ( not ( = ?auto_316500 ?auto_316506 ) ) ( not ( = ?auto_316500 ?auto_316507 ) ) ( not ( = ?auto_316500 ?auto_316508 ) ) ( not ( = ?auto_316500 ?auto_316509 ) ) ( not ( = ?auto_316500 ?auto_316510 ) ) ( not ( = ?auto_316501 ?auto_316502 ) ) ( not ( = ?auto_316501 ?auto_316503 ) ) ( not ( = ?auto_316501 ?auto_316504 ) ) ( not ( = ?auto_316501 ?auto_316505 ) ) ( not ( = ?auto_316501 ?auto_316506 ) ) ( not ( = ?auto_316501 ?auto_316507 ) ) ( not ( = ?auto_316501 ?auto_316508 ) ) ( not ( = ?auto_316501 ?auto_316509 ) ) ( not ( = ?auto_316501 ?auto_316510 ) ) ( not ( = ?auto_316502 ?auto_316503 ) ) ( not ( = ?auto_316502 ?auto_316504 ) ) ( not ( = ?auto_316502 ?auto_316505 ) ) ( not ( = ?auto_316502 ?auto_316506 ) ) ( not ( = ?auto_316502 ?auto_316507 ) ) ( not ( = ?auto_316502 ?auto_316508 ) ) ( not ( = ?auto_316502 ?auto_316509 ) ) ( not ( = ?auto_316502 ?auto_316510 ) ) ( not ( = ?auto_316503 ?auto_316504 ) ) ( not ( = ?auto_316503 ?auto_316505 ) ) ( not ( = ?auto_316503 ?auto_316506 ) ) ( not ( = ?auto_316503 ?auto_316507 ) ) ( not ( = ?auto_316503 ?auto_316508 ) ) ( not ( = ?auto_316503 ?auto_316509 ) ) ( not ( = ?auto_316503 ?auto_316510 ) ) ( not ( = ?auto_316504 ?auto_316505 ) ) ( not ( = ?auto_316504 ?auto_316506 ) ) ( not ( = ?auto_316504 ?auto_316507 ) ) ( not ( = ?auto_316504 ?auto_316508 ) ) ( not ( = ?auto_316504 ?auto_316509 ) ) ( not ( = ?auto_316504 ?auto_316510 ) ) ( not ( = ?auto_316505 ?auto_316506 ) ) ( not ( = ?auto_316505 ?auto_316507 ) ) ( not ( = ?auto_316505 ?auto_316508 ) ) ( not ( = ?auto_316505 ?auto_316509 ) ) ( not ( = ?auto_316505 ?auto_316510 ) ) ( not ( = ?auto_316506 ?auto_316507 ) ) ( not ( = ?auto_316506 ?auto_316508 ) ) ( not ( = ?auto_316506 ?auto_316509 ) ) ( not ( = ?auto_316506 ?auto_316510 ) ) ( not ( = ?auto_316507 ?auto_316508 ) ) ( not ( = ?auto_316507 ?auto_316509 ) ) ( not ( = ?auto_316507 ?auto_316510 ) ) ( not ( = ?auto_316508 ?auto_316509 ) ) ( not ( = ?auto_316508 ?auto_316510 ) ) ( not ( = ?auto_316509 ?auto_316510 ) ) ( ON ?auto_316508 ?auto_316509 ) ( ON ?auto_316507 ?auto_316508 ) ( ON ?auto_316506 ?auto_316507 ) ( CLEAR ?auto_316504 ) ( ON ?auto_316505 ?auto_316506 ) ( CLEAR ?auto_316505 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_316497 ?auto_316498 ?auto_316499 ?auto_316500 ?auto_316501 ?auto_316502 ?auto_316503 ?auto_316504 ?auto_316505 )
      ( MAKE-13PILE ?auto_316497 ?auto_316498 ?auto_316499 ?auto_316500 ?auto_316501 ?auto_316502 ?auto_316503 ?auto_316504 ?auto_316505 ?auto_316506 ?auto_316507 ?auto_316508 ?auto_316509 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_316524 - BLOCK
      ?auto_316525 - BLOCK
      ?auto_316526 - BLOCK
      ?auto_316527 - BLOCK
      ?auto_316528 - BLOCK
      ?auto_316529 - BLOCK
      ?auto_316530 - BLOCK
      ?auto_316531 - BLOCK
      ?auto_316532 - BLOCK
      ?auto_316533 - BLOCK
      ?auto_316534 - BLOCK
      ?auto_316535 - BLOCK
      ?auto_316536 - BLOCK
    )
    :vars
    (
      ?auto_316537 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_316536 ?auto_316537 ) ( ON-TABLE ?auto_316524 ) ( ON ?auto_316525 ?auto_316524 ) ( ON ?auto_316526 ?auto_316525 ) ( ON ?auto_316527 ?auto_316526 ) ( ON ?auto_316528 ?auto_316527 ) ( ON ?auto_316529 ?auto_316528 ) ( ON ?auto_316530 ?auto_316529 ) ( not ( = ?auto_316524 ?auto_316525 ) ) ( not ( = ?auto_316524 ?auto_316526 ) ) ( not ( = ?auto_316524 ?auto_316527 ) ) ( not ( = ?auto_316524 ?auto_316528 ) ) ( not ( = ?auto_316524 ?auto_316529 ) ) ( not ( = ?auto_316524 ?auto_316530 ) ) ( not ( = ?auto_316524 ?auto_316531 ) ) ( not ( = ?auto_316524 ?auto_316532 ) ) ( not ( = ?auto_316524 ?auto_316533 ) ) ( not ( = ?auto_316524 ?auto_316534 ) ) ( not ( = ?auto_316524 ?auto_316535 ) ) ( not ( = ?auto_316524 ?auto_316536 ) ) ( not ( = ?auto_316524 ?auto_316537 ) ) ( not ( = ?auto_316525 ?auto_316526 ) ) ( not ( = ?auto_316525 ?auto_316527 ) ) ( not ( = ?auto_316525 ?auto_316528 ) ) ( not ( = ?auto_316525 ?auto_316529 ) ) ( not ( = ?auto_316525 ?auto_316530 ) ) ( not ( = ?auto_316525 ?auto_316531 ) ) ( not ( = ?auto_316525 ?auto_316532 ) ) ( not ( = ?auto_316525 ?auto_316533 ) ) ( not ( = ?auto_316525 ?auto_316534 ) ) ( not ( = ?auto_316525 ?auto_316535 ) ) ( not ( = ?auto_316525 ?auto_316536 ) ) ( not ( = ?auto_316525 ?auto_316537 ) ) ( not ( = ?auto_316526 ?auto_316527 ) ) ( not ( = ?auto_316526 ?auto_316528 ) ) ( not ( = ?auto_316526 ?auto_316529 ) ) ( not ( = ?auto_316526 ?auto_316530 ) ) ( not ( = ?auto_316526 ?auto_316531 ) ) ( not ( = ?auto_316526 ?auto_316532 ) ) ( not ( = ?auto_316526 ?auto_316533 ) ) ( not ( = ?auto_316526 ?auto_316534 ) ) ( not ( = ?auto_316526 ?auto_316535 ) ) ( not ( = ?auto_316526 ?auto_316536 ) ) ( not ( = ?auto_316526 ?auto_316537 ) ) ( not ( = ?auto_316527 ?auto_316528 ) ) ( not ( = ?auto_316527 ?auto_316529 ) ) ( not ( = ?auto_316527 ?auto_316530 ) ) ( not ( = ?auto_316527 ?auto_316531 ) ) ( not ( = ?auto_316527 ?auto_316532 ) ) ( not ( = ?auto_316527 ?auto_316533 ) ) ( not ( = ?auto_316527 ?auto_316534 ) ) ( not ( = ?auto_316527 ?auto_316535 ) ) ( not ( = ?auto_316527 ?auto_316536 ) ) ( not ( = ?auto_316527 ?auto_316537 ) ) ( not ( = ?auto_316528 ?auto_316529 ) ) ( not ( = ?auto_316528 ?auto_316530 ) ) ( not ( = ?auto_316528 ?auto_316531 ) ) ( not ( = ?auto_316528 ?auto_316532 ) ) ( not ( = ?auto_316528 ?auto_316533 ) ) ( not ( = ?auto_316528 ?auto_316534 ) ) ( not ( = ?auto_316528 ?auto_316535 ) ) ( not ( = ?auto_316528 ?auto_316536 ) ) ( not ( = ?auto_316528 ?auto_316537 ) ) ( not ( = ?auto_316529 ?auto_316530 ) ) ( not ( = ?auto_316529 ?auto_316531 ) ) ( not ( = ?auto_316529 ?auto_316532 ) ) ( not ( = ?auto_316529 ?auto_316533 ) ) ( not ( = ?auto_316529 ?auto_316534 ) ) ( not ( = ?auto_316529 ?auto_316535 ) ) ( not ( = ?auto_316529 ?auto_316536 ) ) ( not ( = ?auto_316529 ?auto_316537 ) ) ( not ( = ?auto_316530 ?auto_316531 ) ) ( not ( = ?auto_316530 ?auto_316532 ) ) ( not ( = ?auto_316530 ?auto_316533 ) ) ( not ( = ?auto_316530 ?auto_316534 ) ) ( not ( = ?auto_316530 ?auto_316535 ) ) ( not ( = ?auto_316530 ?auto_316536 ) ) ( not ( = ?auto_316530 ?auto_316537 ) ) ( not ( = ?auto_316531 ?auto_316532 ) ) ( not ( = ?auto_316531 ?auto_316533 ) ) ( not ( = ?auto_316531 ?auto_316534 ) ) ( not ( = ?auto_316531 ?auto_316535 ) ) ( not ( = ?auto_316531 ?auto_316536 ) ) ( not ( = ?auto_316531 ?auto_316537 ) ) ( not ( = ?auto_316532 ?auto_316533 ) ) ( not ( = ?auto_316532 ?auto_316534 ) ) ( not ( = ?auto_316532 ?auto_316535 ) ) ( not ( = ?auto_316532 ?auto_316536 ) ) ( not ( = ?auto_316532 ?auto_316537 ) ) ( not ( = ?auto_316533 ?auto_316534 ) ) ( not ( = ?auto_316533 ?auto_316535 ) ) ( not ( = ?auto_316533 ?auto_316536 ) ) ( not ( = ?auto_316533 ?auto_316537 ) ) ( not ( = ?auto_316534 ?auto_316535 ) ) ( not ( = ?auto_316534 ?auto_316536 ) ) ( not ( = ?auto_316534 ?auto_316537 ) ) ( not ( = ?auto_316535 ?auto_316536 ) ) ( not ( = ?auto_316535 ?auto_316537 ) ) ( not ( = ?auto_316536 ?auto_316537 ) ) ( ON ?auto_316535 ?auto_316536 ) ( ON ?auto_316534 ?auto_316535 ) ( ON ?auto_316533 ?auto_316534 ) ( ON ?auto_316532 ?auto_316533 ) ( CLEAR ?auto_316530 ) ( ON ?auto_316531 ?auto_316532 ) ( CLEAR ?auto_316531 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_316524 ?auto_316525 ?auto_316526 ?auto_316527 ?auto_316528 ?auto_316529 ?auto_316530 ?auto_316531 )
      ( MAKE-13PILE ?auto_316524 ?auto_316525 ?auto_316526 ?auto_316527 ?auto_316528 ?auto_316529 ?auto_316530 ?auto_316531 ?auto_316532 ?auto_316533 ?auto_316534 ?auto_316535 ?auto_316536 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_316551 - BLOCK
      ?auto_316552 - BLOCK
      ?auto_316553 - BLOCK
      ?auto_316554 - BLOCK
      ?auto_316555 - BLOCK
      ?auto_316556 - BLOCK
      ?auto_316557 - BLOCK
      ?auto_316558 - BLOCK
      ?auto_316559 - BLOCK
      ?auto_316560 - BLOCK
      ?auto_316561 - BLOCK
      ?auto_316562 - BLOCK
      ?auto_316563 - BLOCK
    )
    :vars
    (
      ?auto_316564 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_316563 ?auto_316564 ) ( ON-TABLE ?auto_316551 ) ( ON ?auto_316552 ?auto_316551 ) ( ON ?auto_316553 ?auto_316552 ) ( ON ?auto_316554 ?auto_316553 ) ( ON ?auto_316555 ?auto_316554 ) ( ON ?auto_316556 ?auto_316555 ) ( ON ?auto_316557 ?auto_316556 ) ( not ( = ?auto_316551 ?auto_316552 ) ) ( not ( = ?auto_316551 ?auto_316553 ) ) ( not ( = ?auto_316551 ?auto_316554 ) ) ( not ( = ?auto_316551 ?auto_316555 ) ) ( not ( = ?auto_316551 ?auto_316556 ) ) ( not ( = ?auto_316551 ?auto_316557 ) ) ( not ( = ?auto_316551 ?auto_316558 ) ) ( not ( = ?auto_316551 ?auto_316559 ) ) ( not ( = ?auto_316551 ?auto_316560 ) ) ( not ( = ?auto_316551 ?auto_316561 ) ) ( not ( = ?auto_316551 ?auto_316562 ) ) ( not ( = ?auto_316551 ?auto_316563 ) ) ( not ( = ?auto_316551 ?auto_316564 ) ) ( not ( = ?auto_316552 ?auto_316553 ) ) ( not ( = ?auto_316552 ?auto_316554 ) ) ( not ( = ?auto_316552 ?auto_316555 ) ) ( not ( = ?auto_316552 ?auto_316556 ) ) ( not ( = ?auto_316552 ?auto_316557 ) ) ( not ( = ?auto_316552 ?auto_316558 ) ) ( not ( = ?auto_316552 ?auto_316559 ) ) ( not ( = ?auto_316552 ?auto_316560 ) ) ( not ( = ?auto_316552 ?auto_316561 ) ) ( not ( = ?auto_316552 ?auto_316562 ) ) ( not ( = ?auto_316552 ?auto_316563 ) ) ( not ( = ?auto_316552 ?auto_316564 ) ) ( not ( = ?auto_316553 ?auto_316554 ) ) ( not ( = ?auto_316553 ?auto_316555 ) ) ( not ( = ?auto_316553 ?auto_316556 ) ) ( not ( = ?auto_316553 ?auto_316557 ) ) ( not ( = ?auto_316553 ?auto_316558 ) ) ( not ( = ?auto_316553 ?auto_316559 ) ) ( not ( = ?auto_316553 ?auto_316560 ) ) ( not ( = ?auto_316553 ?auto_316561 ) ) ( not ( = ?auto_316553 ?auto_316562 ) ) ( not ( = ?auto_316553 ?auto_316563 ) ) ( not ( = ?auto_316553 ?auto_316564 ) ) ( not ( = ?auto_316554 ?auto_316555 ) ) ( not ( = ?auto_316554 ?auto_316556 ) ) ( not ( = ?auto_316554 ?auto_316557 ) ) ( not ( = ?auto_316554 ?auto_316558 ) ) ( not ( = ?auto_316554 ?auto_316559 ) ) ( not ( = ?auto_316554 ?auto_316560 ) ) ( not ( = ?auto_316554 ?auto_316561 ) ) ( not ( = ?auto_316554 ?auto_316562 ) ) ( not ( = ?auto_316554 ?auto_316563 ) ) ( not ( = ?auto_316554 ?auto_316564 ) ) ( not ( = ?auto_316555 ?auto_316556 ) ) ( not ( = ?auto_316555 ?auto_316557 ) ) ( not ( = ?auto_316555 ?auto_316558 ) ) ( not ( = ?auto_316555 ?auto_316559 ) ) ( not ( = ?auto_316555 ?auto_316560 ) ) ( not ( = ?auto_316555 ?auto_316561 ) ) ( not ( = ?auto_316555 ?auto_316562 ) ) ( not ( = ?auto_316555 ?auto_316563 ) ) ( not ( = ?auto_316555 ?auto_316564 ) ) ( not ( = ?auto_316556 ?auto_316557 ) ) ( not ( = ?auto_316556 ?auto_316558 ) ) ( not ( = ?auto_316556 ?auto_316559 ) ) ( not ( = ?auto_316556 ?auto_316560 ) ) ( not ( = ?auto_316556 ?auto_316561 ) ) ( not ( = ?auto_316556 ?auto_316562 ) ) ( not ( = ?auto_316556 ?auto_316563 ) ) ( not ( = ?auto_316556 ?auto_316564 ) ) ( not ( = ?auto_316557 ?auto_316558 ) ) ( not ( = ?auto_316557 ?auto_316559 ) ) ( not ( = ?auto_316557 ?auto_316560 ) ) ( not ( = ?auto_316557 ?auto_316561 ) ) ( not ( = ?auto_316557 ?auto_316562 ) ) ( not ( = ?auto_316557 ?auto_316563 ) ) ( not ( = ?auto_316557 ?auto_316564 ) ) ( not ( = ?auto_316558 ?auto_316559 ) ) ( not ( = ?auto_316558 ?auto_316560 ) ) ( not ( = ?auto_316558 ?auto_316561 ) ) ( not ( = ?auto_316558 ?auto_316562 ) ) ( not ( = ?auto_316558 ?auto_316563 ) ) ( not ( = ?auto_316558 ?auto_316564 ) ) ( not ( = ?auto_316559 ?auto_316560 ) ) ( not ( = ?auto_316559 ?auto_316561 ) ) ( not ( = ?auto_316559 ?auto_316562 ) ) ( not ( = ?auto_316559 ?auto_316563 ) ) ( not ( = ?auto_316559 ?auto_316564 ) ) ( not ( = ?auto_316560 ?auto_316561 ) ) ( not ( = ?auto_316560 ?auto_316562 ) ) ( not ( = ?auto_316560 ?auto_316563 ) ) ( not ( = ?auto_316560 ?auto_316564 ) ) ( not ( = ?auto_316561 ?auto_316562 ) ) ( not ( = ?auto_316561 ?auto_316563 ) ) ( not ( = ?auto_316561 ?auto_316564 ) ) ( not ( = ?auto_316562 ?auto_316563 ) ) ( not ( = ?auto_316562 ?auto_316564 ) ) ( not ( = ?auto_316563 ?auto_316564 ) ) ( ON ?auto_316562 ?auto_316563 ) ( ON ?auto_316561 ?auto_316562 ) ( ON ?auto_316560 ?auto_316561 ) ( ON ?auto_316559 ?auto_316560 ) ( CLEAR ?auto_316557 ) ( ON ?auto_316558 ?auto_316559 ) ( CLEAR ?auto_316558 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_316551 ?auto_316552 ?auto_316553 ?auto_316554 ?auto_316555 ?auto_316556 ?auto_316557 ?auto_316558 )
      ( MAKE-13PILE ?auto_316551 ?auto_316552 ?auto_316553 ?auto_316554 ?auto_316555 ?auto_316556 ?auto_316557 ?auto_316558 ?auto_316559 ?auto_316560 ?auto_316561 ?auto_316562 ?auto_316563 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_316578 - BLOCK
      ?auto_316579 - BLOCK
      ?auto_316580 - BLOCK
      ?auto_316581 - BLOCK
      ?auto_316582 - BLOCK
      ?auto_316583 - BLOCK
      ?auto_316584 - BLOCK
      ?auto_316585 - BLOCK
      ?auto_316586 - BLOCK
      ?auto_316587 - BLOCK
      ?auto_316588 - BLOCK
      ?auto_316589 - BLOCK
      ?auto_316590 - BLOCK
    )
    :vars
    (
      ?auto_316591 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_316590 ?auto_316591 ) ( ON-TABLE ?auto_316578 ) ( ON ?auto_316579 ?auto_316578 ) ( ON ?auto_316580 ?auto_316579 ) ( ON ?auto_316581 ?auto_316580 ) ( ON ?auto_316582 ?auto_316581 ) ( ON ?auto_316583 ?auto_316582 ) ( not ( = ?auto_316578 ?auto_316579 ) ) ( not ( = ?auto_316578 ?auto_316580 ) ) ( not ( = ?auto_316578 ?auto_316581 ) ) ( not ( = ?auto_316578 ?auto_316582 ) ) ( not ( = ?auto_316578 ?auto_316583 ) ) ( not ( = ?auto_316578 ?auto_316584 ) ) ( not ( = ?auto_316578 ?auto_316585 ) ) ( not ( = ?auto_316578 ?auto_316586 ) ) ( not ( = ?auto_316578 ?auto_316587 ) ) ( not ( = ?auto_316578 ?auto_316588 ) ) ( not ( = ?auto_316578 ?auto_316589 ) ) ( not ( = ?auto_316578 ?auto_316590 ) ) ( not ( = ?auto_316578 ?auto_316591 ) ) ( not ( = ?auto_316579 ?auto_316580 ) ) ( not ( = ?auto_316579 ?auto_316581 ) ) ( not ( = ?auto_316579 ?auto_316582 ) ) ( not ( = ?auto_316579 ?auto_316583 ) ) ( not ( = ?auto_316579 ?auto_316584 ) ) ( not ( = ?auto_316579 ?auto_316585 ) ) ( not ( = ?auto_316579 ?auto_316586 ) ) ( not ( = ?auto_316579 ?auto_316587 ) ) ( not ( = ?auto_316579 ?auto_316588 ) ) ( not ( = ?auto_316579 ?auto_316589 ) ) ( not ( = ?auto_316579 ?auto_316590 ) ) ( not ( = ?auto_316579 ?auto_316591 ) ) ( not ( = ?auto_316580 ?auto_316581 ) ) ( not ( = ?auto_316580 ?auto_316582 ) ) ( not ( = ?auto_316580 ?auto_316583 ) ) ( not ( = ?auto_316580 ?auto_316584 ) ) ( not ( = ?auto_316580 ?auto_316585 ) ) ( not ( = ?auto_316580 ?auto_316586 ) ) ( not ( = ?auto_316580 ?auto_316587 ) ) ( not ( = ?auto_316580 ?auto_316588 ) ) ( not ( = ?auto_316580 ?auto_316589 ) ) ( not ( = ?auto_316580 ?auto_316590 ) ) ( not ( = ?auto_316580 ?auto_316591 ) ) ( not ( = ?auto_316581 ?auto_316582 ) ) ( not ( = ?auto_316581 ?auto_316583 ) ) ( not ( = ?auto_316581 ?auto_316584 ) ) ( not ( = ?auto_316581 ?auto_316585 ) ) ( not ( = ?auto_316581 ?auto_316586 ) ) ( not ( = ?auto_316581 ?auto_316587 ) ) ( not ( = ?auto_316581 ?auto_316588 ) ) ( not ( = ?auto_316581 ?auto_316589 ) ) ( not ( = ?auto_316581 ?auto_316590 ) ) ( not ( = ?auto_316581 ?auto_316591 ) ) ( not ( = ?auto_316582 ?auto_316583 ) ) ( not ( = ?auto_316582 ?auto_316584 ) ) ( not ( = ?auto_316582 ?auto_316585 ) ) ( not ( = ?auto_316582 ?auto_316586 ) ) ( not ( = ?auto_316582 ?auto_316587 ) ) ( not ( = ?auto_316582 ?auto_316588 ) ) ( not ( = ?auto_316582 ?auto_316589 ) ) ( not ( = ?auto_316582 ?auto_316590 ) ) ( not ( = ?auto_316582 ?auto_316591 ) ) ( not ( = ?auto_316583 ?auto_316584 ) ) ( not ( = ?auto_316583 ?auto_316585 ) ) ( not ( = ?auto_316583 ?auto_316586 ) ) ( not ( = ?auto_316583 ?auto_316587 ) ) ( not ( = ?auto_316583 ?auto_316588 ) ) ( not ( = ?auto_316583 ?auto_316589 ) ) ( not ( = ?auto_316583 ?auto_316590 ) ) ( not ( = ?auto_316583 ?auto_316591 ) ) ( not ( = ?auto_316584 ?auto_316585 ) ) ( not ( = ?auto_316584 ?auto_316586 ) ) ( not ( = ?auto_316584 ?auto_316587 ) ) ( not ( = ?auto_316584 ?auto_316588 ) ) ( not ( = ?auto_316584 ?auto_316589 ) ) ( not ( = ?auto_316584 ?auto_316590 ) ) ( not ( = ?auto_316584 ?auto_316591 ) ) ( not ( = ?auto_316585 ?auto_316586 ) ) ( not ( = ?auto_316585 ?auto_316587 ) ) ( not ( = ?auto_316585 ?auto_316588 ) ) ( not ( = ?auto_316585 ?auto_316589 ) ) ( not ( = ?auto_316585 ?auto_316590 ) ) ( not ( = ?auto_316585 ?auto_316591 ) ) ( not ( = ?auto_316586 ?auto_316587 ) ) ( not ( = ?auto_316586 ?auto_316588 ) ) ( not ( = ?auto_316586 ?auto_316589 ) ) ( not ( = ?auto_316586 ?auto_316590 ) ) ( not ( = ?auto_316586 ?auto_316591 ) ) ( not ( = ?auto_316587 ?auto_316588 ) ) ( not ( = ?auto_316587 ?auto_316589 ) ) ( not ( = ?auto_316587 ?auto_316590 ) ) ( not ( = ?auto_316587 ?auto_316591 ) ) ( not ( = ?auto_316588 ?auto_316589 ) ) ( not ( = ?auto_316588 ?auto_316590 ) ) ( not ( = ?auto_316588 ?auto_316591 ) ) ( not ( = ?auto_316589 ?auto_316590 ) ) ( not ( = ?auto_316589 ?auto_316591 ) ) ( not ( = ?auto_316590 ?auto_316591 ) ) ( ON ?auto_316589 ?auto_316590 ) ( ON ?auto_316588 ?auto_316589 ) ( ON ?auto_316587 ?auto_316588 ) ( ON ?auto_316586 ?auto_316587 ) ( ON ?auto_316585 ?auto_316586 ) ( CLEAR ?auto_316583 ) ( ON ?auto_316584 ?auto_316585 ) ( CLEAR ?auto_316584 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_316578 ?auto_316579 ?auto_316580 ?auto_316581 ?auto_316582 ?auto_316583 ?auto_316584 )
      ( MAKE-13PILE ?auto_316578 ?auto_316579 ?auto_316580 ?auto_316581 ?auto_316582 ?auto_316583 ?auto_316584 ?auto_316585 ?auto_316586 ?auto_316587 ?auto_316588 ?auto_316589 ?auto_316590 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_316605 - BLOCK
      ?auto_316606 - BLOCK
      ?auto_316607 - BLOCK
      ?auto_316608 - BLOCK
      ?auto_316609 - BLOCK
      ?auto_316610 - BLOCK
      ?auto_316611 - BLOCK
      ?auto_316612 - BLOCK
      ?auto_316613 - BLOCK
      ?auto_316614 - BLOCK
      ?auto_316615 - BLOCK
      ?auto_316616 - BLOCK
      ?auto_316617 - BLOCK
    )
    :vars
    (
      ?auto_316618 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_316617 ?auto_316618 ) ( ON-TABLE ?auto_316605 ) ( ON ?auto_316606 ?auto_316605 ) ( ON ?auto_316607 ?auto_316606 ) ( ON ?auto_316608 ?auto_316607 ) ( ON ?auto_316609 ?auto_316608 ) ( ON ?auto_316610 ?auto_316609 ) ( not ( = ?auto_316605 ?auto_316606 ) ) ( not ( = ?auto_316605 ?auto_316607 ) ) ( not ( = ?auto_316605 ?auto_316608 ) ) ( not ( = ?auto_316605 ?auto_316609 ) ) ( not ( = ?auto_316605 ?auto_316610 ) ) ( not ( = ?auto_316605 ?auto_316611 ) ) ( not ( = ?auto_316605 ?auto_316612 ) ) ( not ( = ?auto_316605 ?auto_316613 ) ) ( not ( = ?auto_316605 ?auto_316614 ) ) ( not ( = ?auto_316605 ?auto_316615 ) ) ( not ( = ?auto_316605 ?auto_316616 ) ) ( not ( = ?auto_316605 ?auto_316617 ) ) ( not ( = ?auto_316605 ?auto_316618 ) ) ( not ( = ?auto_316606 ?auto_316607 ) ) ( not ( = ?auto_316606 ?auto_316608 ) ) ( not ( = ?auto_316606 ?auto_316609 ) ) ( not ( = ?auto_316606 ?auto_316610 ) ) ( not ( = ?auto_316606 ?auto_316611 ) ) ( not ( = ?auto_316606 ?auto_316612 ) ) ( not ( = ?auto_316606 ?auto_316613 ) ) ( not ( = ?auto_316606 ?auto_316614 ) ) ( not ( = ?auto_316606 ?auto_316615 ) ) ( not ( = ?auto_316606 ?auto_316616 ) ) ( not ( = ?auto_316606 ?auto_316617 ) ) ( not ( = ?auto_316606 ?auto_316618 ) ) ( not ( = ?auto_316607 ?auto_316608 ) ) ( not ( = ?auto_316607 ?auto_316609 ) ) ( not ( = ?auto_316607 ?auto_316610 ) ) ( not ( = ?auto_316607 ?auto_316611 ) ) ( not ( = ?auto_316607 ?auto_316612 ) ) ( not ( = ?auto_316607 ?auto_316613 ) ) ( not ( = ?auto_316607 ?auto_316614 ) ) ( not ( = ?auto_316607 ?auto_316615 ) ) ( not ( = ?auto_316607 ?auto_316616 ) ) ( not ( = ?auto_316607 ?auto_316617 ) ) ( not ( = ?auto_316607 ?auto_316618 ) ) ( not ( = ?auto_316608 ?auto_316609 ) ) ( not ( = ?auto_316608 ?auto_316610 ) ) ( not ( = ?auto_316608 ?auto_316611 ) ) ( not ( = ?auto_316608 ?auto_316612 ) ) ( not ( = ?auto_316608 ?auto_316613 ) ) ( not ( = ?auto_316608 ?auto_316614 ) ) ( not ( = ?auto_316608 ?auto_316615 ) ) ( not ( = ?auto_316608 ?auto_316616 ) ) ( not ( = ?auto_316608 ?auto_316617 ) ) ( not ( = ?auto_316608 ?auto_316618 ) ) ( not ( = ?auto_316609 ?auto_316610 ) ) ( not ( = ?auto_316609 ?auto_316611 ) ) ( not ( = ?auto_316609 ?auto_316612 ) ) ( not ( = ?auto_316609 ?auto_316613 ) ) ( not ( = ?auto_316609 ?auto_316614 ) ) ( not ( = ?auto_316609 ?auto_316615 ) ) ( not ( = ?auto_316609 ?auto_316616 ) ) ( not ( = ?auto_316609 ?auto_316617 ) ) ( not ( = ?auto_316609 ?auto_316618 ) ) ( not ( = ?auto_316610 ?auto_316611 ) ) ( not ( = ?auto_316610 ?auto_316612 ) ) ( not ( = ?auto_316610 ?auto_316613 ) ) ( not ( = ?auto_316610 ?auto_316614 ) ) ( not ( = ?auto_316610 ?auto_316615 ) ) ( not ( = ?auto_316610 ?auto_316616 ) ) ( not ( = ?auto_316610 ?auto_316617 ) ) ( not ( = ?auto_316610 ?auto_316618 ) ) ( not ( = ?auto_316611 ?auto_316612 ) ) ( not ( = ?auto_316611 ?auto_316613 ) ) ( not ( = ?auto_316611 ?auto_316614 ) ) ( not ( = ?auto_316611 ?auto_316615 ) ) ( not ( = ?auto_316611 ?auto_316616 ) ) ( not ( = ?auto_316611 ?auto_316617 ) ) ( not ( = ?auto_316611 ?auto_316618 ) ) ( not ( = ?auto_316612 ?auto_316613 ) ) ( not ( = ?auto_316612 ?auto_316614 ) ) ( not ( = ?auto_316612 ?auto_316615 ) ) ( not ( = ?auto_316612 ?auto_316616 ) ) ( not ( = ?auto_316612 ?auto_316617 ) ) ( not ( = ?auto_316612 ?auto_316618 ) ) ( not ( = ?auto_316613 ?auto_316614 ) ) ( not ( = ?auto_316613 ?auto_316615 ) ) ( not ( = ?auto_316613 ?auto_316616 ) ) ( not ( = ?auto_316613 ?auto_316617 ) ) ( not ( = ?auto_316613 ?auto_316618 ) ) ( not ( = ?auto_316614 ?auto_316615 ) ) ( not ( = ?auto_316614 ?auto_316616 ) ) ( not ( = ?auto_316614 ?auto_316617 ) ) ( not ( = ?auto_316614 ?auto_316618 ) ) ( not ( = ?auto_316615 ?auto_316616 ) ) ( not ( = ?auto_316615 ?auto_316617 ) ) ( not ( = ?auto_316615 ?auto_316618 ) ) ( not ( = ?auto_316616 ?auto_316617 ) ) ( not ( = ?auto_316616 ?auto_316618 ) ) ( not ( = ?auto_316617 ?auto_316618 ) ) ( ON ?auto_316616 ?auto_316617 ) ( ON ?auto_316615 ?auto_316616 ) ( ON ?auto_316614 ?auto_316615 ) ( ON ?auto_316613 ?auto_316614 ) ( ON ?auto_316612 ?auto_316613 ) ( CLEAR ?auto_316610 ) ( ON ?auto_316611 ?auto_316612 ) ( CLEAR ?auto_316611 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_316605 ?auto_316606 ?auto_316607 ?auto_316608 ?auto_316609 ?auto_316610 ?auto_316611 )
      ( MAKE-13PILE ?auto_316605 ?auto_316606 ?auto_316607 ?auto_316608 ?auto_316609 ?auto_316610 ?auto_316611 ?auto_316612 ?auto_316613 ?auto_316614 ?auto_316615 ?auto_316616 ?auto_316617 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_316632 - BLOCK
      ?auto_316633 - BLOCK
      ?auto_316634 - BLOCK
      ?auto_316635 - BLOCK
      ?auto_316636 - BLOCK
      ?auto_316637 - BLOCK
      ?auto_316638 - BLOCK
      ?auto_316639 - BLOCK
      ?auto_316640 - BLOCK
      ?auto_316641 - BLOCK
      ?auto_316642 - BLOCK
      ?auto_316643 - BLOCK
      ?auto_316644 - BLOCK
    )
    :vars
    (
      ?auto_316645 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_316644 ?auto_316645 ) ( ON-TABLE ?auto_316632 ) ( ON ?auto_316633 ?auto_316632 ) ( ON ?auto_316634 ?auto_316633 ) ( ON ?auto_316635 ?auto_316634 ) ( ON ?auto_316636 ?auto_316635 ) ( not ( = ?auto_316632 ?auto_316633 ) ) ( not ( = ?auto_316632 ?auto_316634 ) ) ( not ( = ?auto_316632 ?auto_316635 ) ) ( not ( = ?auto_316632 ?auto_316636 ) ) ( not ( = ?auto_316632 ?auto_316637 ) ) ( not ( = ?auto_316632 ?auto_316638 ) ) ( not ( = ?auto_316632 ?auto_316639 ) ) ( not ( = ?auto_316632 ?auto_316640 ) ) ( not ( = ?auto_316632 ?auto_316641 ) ) ( not ( = ?auto_316632 ?auto_316642 ) ) ( not ( = ?auto_316632 ?auto_316643 ) ) ( not ( = ?auto_316632 ?auto_316644 ) ) ( not ( = ?auto_316632 ?auto_316645 ) ) ( not ( = ?auto_316633 ?auto_316634 ) ) ( not ( = ?auto_316633 ?auto_316635 ) ) ( not ( = ?auto_316633 ?auto_316636 ) ) ( not ( = ?auto_316633 ?auto_316637 ) ) ( not ( = ?auto_316633 ?auto_316638 ) ) ( not ( = ?auto_316633 ?auto_316639 ) ) ( not ( = ?auto_316633 ?auto_316640 ) ) ( not ( = ?auto_316633 ?auto_316641 ) ) ( not ( = ?auto_316633 ?auto_316642 ) ) ( not ( = ?auto_316633 ?auto_316643 ) ) ( not ( = ?auto_316633 ?auto_316644 ) ) ( not ( = ?auto_316633 ?auto_316645 ) ) ( not ( = ?auto_316634 ?auto_316635 ) ) ( not ( = ?auto_316634 ?auto_316636 ) ) ( not ( = ?auto_316634 ?auto_316637 ) ) ( not ( = ?auto_316634 ?auto_316638 ) ) ( not ( = ?auto_316634 ?auto_316639 ) ) ( not ( = ?auto_316634 ?auto_316640 ) ) ( not ( = ?auto_316634 ?auto_316641 ) ) ( not ( = ?auto_316634 ?auto_316642 ) ) ( not ( = ?auto_316634 ?auto_316643 ) ) ( not ( = ?auto_316634 ?auto_316644 ) ) ( not ( = ?auto_316634 ?auto_316645 ) ) ( not ( = ?auto_316635 ?auto_316636 ) ) ( not ( = ?auto_316635 ?auto_316637 ) ) ( not ( = ?auto_316635 ?auto_316638 ) ) ( not ( = ?auto_316635 ?auto_316639 ) ) ( not ( = ?auto_316635 ?auto_316640 ) ) ( not ( = ?auto_316635 ?auto_316641 ) ) ( not ( = ?auto_316635 ?auto_316642 ) ) ( not ( = ?auto_316635 ?auto_316643 ) ) ( not ( = ?auto_316635 ?auto_316644 ) ) ( not ( = ?auto_316635 ?auto_316645 ) ) ( not ( = ?auto_316636 ?auto_316637 ) ) ( not ( = ?auto_316636 ?auto_316638 ) ) ( not ( = ?auto_316636 ?auto_316639 ) ) ( not ( = ?auto_316636 ?auto_316640 ) ) ( not ( = ?auto_316636 ?auto_316641 ) ) ( not ( = ?auto_316636 ?auto_316642 ) ) ( not ( = ?auto_316636 ?auto_316643 ) ) ( not ( = ?auto_316636 ?auto_316644 ) ) ( not ( = ?auto_316636 ?auto_316645 ) ) ( not ( = ?auto_316637 ?auto_316638 ) ) ( not ( = ?auto_316637 ?auto_316639 ) ) ( not ( = ?auto_316637 ?auto_316640 ) ) ( not ( = ?auto_316637 ?auto_316641 ) ) ( not ( = ?auto_316637 ?auto_316642 ) ) ( not ( = ?auto_316637 ?auto_316643 ) ) ( not ( = ?auto_316637 ?auto_316644 ) ) ( not ( = ?auto_316637 ?auto_316645 ) ) ( not ( = ?auto_316638 ?auto_316639 ) ) ( not ( = ?auto_316638 ?auto_316640 ) ) ( not ( = ?auto_316638 ?auto_316641 ) ) ( not ( = ?auto_316638 ?auto_316642 ) ) ( not ( = ?auto_316638 ?auto_316643 ) ) ( not ( = ?auto_316638 ?auto_316644 ) ) ( not ( = ?auto_316638 ?auto_316645 ) ) ( not ( = ?auto_316639 ?auto_316640 ) ) ( not ( = ?auto_316639 ?auto_316641 ) ) ( not ( = ?auto_316639 ?auto_316642 ) ) ( not ( = ?auto_316639 ?auto_316643 ) ) ( not ( = ?auto_316639 ?auto_316644 ) ) ( not ( = ?auto_316639 ?auto_316645 ) ) ( not ( = ?auto_316640 ?auto_316641 ) ) ( not ( = ?auto_316640 ?auto_316642 ) ) ( not ( = ?auto_316640 ?auto_316643 ) ) ( not ( = ?auto_316640 ?auto_316644 ) ) ( not ( = ?auto_316640 ?auto_316645 ) ) ( not ( = ?auto_316641 ?auto_316642 ) ) ( not ( = ?auto_316641 ?auto_316643 ) ) ( not ( = ?auto_316641 ?auto_316644 ) ) ( not ( = ?auto_316641 ?auto_316645 ) ) ( not ( = ?auto_316642 ?auto_316643 ) ) ( not ( = ?auto_316642 ?auto_316644 ) ) ( not ( = ?auto_316642 ?auto_316645 ) ) ( not ( = ?auto_316643 ?auto_316644 ) ) ( not ( = ?auto_316643 ?auto_316645 ) ) ( not ( = ?auto_316644 ?auto_316645 ) ) ( ON ?auto_316643 ?auto_316644 ) ( ON ?auto_316642 ?auto_316643 ) ( ON ?auto_316641 ?auto_316642 ) ( ON ?auto_316640 ?auto_316641 ) ( ON ?auto_316639 ?auto_316640 ) ( ON ?auto_316638 ?auto_316639 ) ( CLEAR ?auto_316636 ) ( ON ?auto_316637 ?auto_316638 ) ( CLEAR ?auto_316637 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_316632 ?auto_316633 ?auto_316634 ?auto_316635 ?auto_316636 ?auto_316637 )
      ( MAKE-13PILE ?auto_316632 ?auto_316633 ?auto_316634 ?auto_316635 ?auto_316636 ?auto_316637 ?auto_316638 ?auto_316639 ?auto_316640 ?auto_316641 ?auto_316642 ?auto_316643 ?auto_316644 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_316659 - BLOCK
      ?auto_316660 - BLOCK
      ?auto_316661 - BLOCK
      ?auto_316662 - BLOCK
      ?auto_316663 - BLOCK
      ?auto_316664 - BLOCK
      ?auto_316665 - BLOCK
      ?auto_316666 - BLOCK
      ?auto_316667 - BLOCK
      ?auto_316668 - BLOCK
      ?auto_316669 - BLOCK
      ?auto_316670 - BLOCK
      ?auto_316671 - BLOCK
    )
    :vars
    (
      ?auto_316672 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_316671 ?auto_316672 ) ( ON-TABLE ?auto_316659 ) ( ON ?auto_316660 ?auto_316659 ) ( ON ?auto_316661 ?auto_316660 ) ( ON ?auto_316662 ?auto_316661 ) ( ON ?auto_316663 ?auto_316662 ) ( not ( = ?auto_316659 ?auto_316660 ) ) ( not ( = ?auto_316659 ?auto_316661 ) ) ( not ( = ?auto_316659 ?auto_316662 ) ) ( not ( = ?auto_316659 ?auto_316663 ) ) ( not ( = ?auto_316659 ?auto_316664 ) ) ( not ( = ?auto_316659 ?auto_316665 ) ) ( not ( = ?auto_316659 ?auto_316666 ) ) ( not ( = ?auto_316659 ?auto_316667 ) ) ( not ( = ?auto_316659 ?auto_316668 ) ) ( not ( = ?auto_316659 ?auto_316669 ) ) ( not ( = ?auto_316659 ?auto_316670 ) ) ( not ( = ?auto_316659 ?auto_316671 ) ) ( not ( = ?auto_316659 ?auto_316672 ) ) ( not ( = ?auto_316660 ?auto_316661 ) ) ( not ( = ?auto_316660 ?auto_316662 ) ) ( not ( = ?auto_316660 ?auto_316663 ) ) ( not ( = ?auto_316660 ?auto_316664 ) ) ( not ( = ?auto_316660 ?auto_316665 ) ) ( not ( = ?auto_316660 ?auto_316666 ) ) ( not ( = ?auto_316660 ?auto_316667 ) ) ( not ( = ?auto_316660 ?auto_316668 ) ) ( not ( = ?auto_316660 ?auto_316669 ) ) ( not ( = ?auto_316660 ?auto_316670 ) ) ( not ( = ?auto_316660 ?auto_316671 ) ) ( not ( = ?auto_316660 ?auto_316672 ) ) ( not ( = ?auto_316661 ?auto_316662 ) ) ( not ( = ?auto_316661 ?auto_316663 ) ) ( not ( = ?auto_316661 ?auto_316664 ) ) ( not ( = ?auto_316661 ?auto_316665 ) ) ( not ( = ?auto_316661 ?auto_316666 ) ) ( not ( = ?auto_316661 ?auto_316667 ) ) ( not ( = ?auto_316661 ?auto_316668 ) ) ( not ( = ?auto_316661 ?auto_316669 ) ) ( not ( = ?auto_316661 ?auto_316670 ) ) ( not ( = ?auto_316661 ?auto_316671 ) ) ( not ( = ?auto_316661 ?auto_316672 ) ) ( not ( = ?auto_316662 ?auto_316663 ) ) ( not ( = ?auto_316662 ?auto_316664 ) ) ( not ( = ?auto_316662 ?auto_316665 ) ) ( not ( = ?auto_316662 ?auto_316666 ) ) ( not ( = ?auto_316662 ?auto_316667 ) ) ( not ( = ?auto_316662 ?auto_316668 ) ) ( not ( = ?auto_316662 ?auto_316669 ) ) ( not ( = ?auto_316662 ?auto_316670 ) ) ( not ( = ?auto_316662 ?auto_316671 ) ) ( not ( = ?auto_316662 ?auto_316672 ) ) ( not ( = ?auto_316663 ?auto_316664 ) ) ( not ( = ?auto_316663 ?auto_316665 ) ) ( not ( = ?auto_316663 ?auto_316666 ) ) ( not ( = ?auto_316663 ?auto_316667 ) ) ( not ( = ?auto_316663 ?auto_316668 ) ) ( not ( = ?auto_316663 ?auto_316669 ) ) ( not ( = ?auto_316663 ?auto_316670 ) ) ( not ( = ?auto_316663 ?auto_316671 ) ) ( not ( = ?auto_316663 ?auto_316672 ) ) ( not ( = ?auto_316664 ?auto_316665 ) ) ( not ( = ?auto_316664 ?auto_316666 ) ) ( not ( = ?auto_316664 ?auto_316667 ) ) ( not ( = ?auto_316664 ?auto_316668 ) ) ( not ( = ?auto_316664 ?auto_316669 ) ) ( not ( = ?auto_316664 ?auto_316670 ) ) ( not ( = ?auto_316664 ?auto_316671 ) ) ( not ( = ?auto_316664 ?auto_316672 ) ) ( not ( = ?auto_316665 ?auto_316666 ) ) ( not ( = ?auto_316665 ?auto_316667 ) ) ( not ( = ?auto_316665 ?auto_316668 ) ) ( not ( = ?auto_316665 ?auto_316669 ) ) ( not ( = ?auto_316665 ?auto_316670 ) ) ( not ( = ?auto_316665 ?auto_316671 ) ) ( not ( = ?auto_316665 ?auto_316672 ) ) ( not ( = ?auto_316666 ?auto_316667 ) ) ( not ( = ?auto_316666 ?auto_316668 ) ) ( not ( = ?auto_316666 ?auto_316669 ) ) ( not ( = ?auto_316666 ?auto_316670 ) ) ( not ( = ?auto_316666 ?auto_316671 ) ) ( not ( = ?auto_316666 ?auto_316672 ) ) ( not ( = ?auto_316667 ?auto_316668 ) ) ( not ( = ?auto_316667 ?auto_316669 ) ) ( not ( = ?auto_316667 ?auto_316670 ) ) ( not ( = ?auto_316667 ?auto_316671 ) ) ( not ( = ?auto_316667 ?auto_316672 ) ) ( not ( = ?auto_316668 ?auto_316669 ) ) ( not ( = ?auto_316668 ?auto_316670 ) ) ( not ( = ?auto_316668 ?auto_316671 ) ) ( not ( = ?auto_316668 ?auto_316672 ) ) ( not ( = ?auto_316669 ?auto_316670 ) ) ( not ( = ?auto_316669 ?auto_316671 ) ) ( not ( = ?auto_316669 ?auto_316672 ) ) ( not ( = ?auto_316670 ?auto_316671 ) ) ( not ( = ?auto_316670 ?auto_316672 ) ) ( not ( = ?auto_316671 ?auto_316672 ) ) ( ON ?auto_316670 ?auto_316671 ) ( ON ?auto_316669 ?auto_316670 ) ( ON ?auto_316668 ?auto_316669 ) ( ON ?auto_316667 ?auto_316668 ) ( ON ?auto_316666 ?auto_316667 ) ( ON ?auto_316665 ?auto_316666 ) ( CLEAR ?auto_316663 ) ( ON ?auto_316664 ?auto_316665 ) ( CLEAR ?auto_316664 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_316659 ?auto_316660 ?auto_316661 ?auto_316662 ?auto_316663 ?auto_316664 )
      ( MAKE-13PILE ?auto_316659 ?auto_316660 ?auto_316661 ?auto_316662 ?auto_316663 ?auto_316664 ?auto_316665 ?auto_316666 ?auto_316667 ?auto_316668 ?auto_316669 ?auto_316670 ?auto_316671 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_316686 - BLOCK
      ?auto_316687 - BLOCK
      ?auto_316688 - BLOCK
      ?auto_316689 - BLOCK
      ?auto_316690 - BLOCK
      ?auto_316691 - BLOCK
      ?auto_316692 - BLOCK
      ?auto_316693 - BLOCK
      ?auto_316694 - BLOCK
      ?auto_316695 - BLOCK
      ?auto_316696 - BLOCK
      ?auto_316697 - BLOCK
      ?auto_316698 - BLOCK
    )
    :vars
    (
      ?auto_316699 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_316698 ?auto_316699 ) ( ON-TABLE ?auto_316686 ) ( ON ?auto_316687 ?auto_316686 ) ( ON ?auto_316688 ?auto_316687 ) ( ON ?auto_316689 ?auto_316688 ) ( not ( = ?auto_316686 ?auto_316687 ) ) ( not ( = ?auto_316686 ?auto_316688 ) ) ( not ( = ?auto_316686 ?auto_316689 ) ) ( not ( = ?auto_316686 ?auto_316690 ) ) ( not ( = ?auto_316686 ?auto_316691 ) ) ( not ( = ?auto_316686 ?auto_316692 ) ) ( not ( = ?auto_316686 ?auto_316693 ) ) ( not ( = ?auto_316686 ?auto_316694 ) ) ( not ( = ?auto_316686 ?auto_316695 ) ) ( not ( = ?auto_316686 ?auto_316696 ) ) ( not ( = ?auto_316686 ?auto_316697 ) ) ( not ( = ?auto_316686 ?auto_316698 ) ) ( not ( = ?auto_316686 ?auto_316699 ) ) ( not ( = ?auto_316687 ?auto_316688 ) ) ( not ( = ?auto_316687 ?auto_316689 ) ) ( not ( = ?auto_316687 ?auto_316690 ) ) ( not ( = ?auto_316687 ?auto_316691 ) ) ( not ( = ?auto_316687 ?auto_316692 ) ) ( not ( = ?auto_316687 ?auto_316693 ) ) ( not ( = ?auto_316687 ?auto_316694 ) ) ( not ( = ?auto_316687 ?auto_316695 ) ) ( not ( = ?auto_316687 ?auto_316696 ) ) ( not ( = ?auto_316687 ?auto_316697 ) ) ( not ( = ?auto_316687 ?auto_316698 ) ) ( not ( = ?auto_316687 ?auto_316699 ) ) ( not ( = ?auto_316688 ?auto_316689 ) ) ( not ( = ?auto_316688 ?auto_316690 ) ) ( not ( = ?auto_316688 ?auto_316691 ) ) ( not ( = ?auto_316688 ?auto_316692 ) ) ( not ( = ?auto_316688 ?auto_316693 ) ) ( not ( = ?auto_316688 ?auto_316694 ) ) ( not ( = ?auto_316688 ?auto_316695 ) ) ( not ( = ?auto_316688 ?auto_316696 ) ) ( not ( = ?auto_316688 ?auto_316697 ) ) ( not ( = ?auto_316688 ?auto_316698 ) ) ( not ( = ?auto_316688 ?auto_316699 ) ) ( not ( = ?auto_316689 ?auto_316690 ) ) ( not ( = ?auto_316689 ?auto_316691 ) ) ( not ( = ?auto_316689 ?auto_316692 ) ) ( not ( = ?auto_316689 ?auto_316693 ) ) ( not ( = ?auto_316689 ?auto_316694 ) ) ( not ( = ?auto_316689 ?auto_316695 ) ) ( not ( = ?auto_316689 ?auto_316696 ) ) ( not ( = ?auto_316689 ?auto_316697 ) ) ( not ( = ?auto_316689 ?auto_316698 ) ) ( not ( = ?auto_316689 ?auto_316699 ) ) ( not ( = ?auto_316690 ?auto_316691 ) ) ( not ( = ?auto_316690 ?auto_316692 ) ) ( not ( = ?auto_316690 ?auto_316693 ) ) ( not ( = ?auto_316690 ?auto_316694 ) ) ( not ( = ?auto_316690 ?auto_316695 ) ) ( not ( = ?auto_316690 ?auto_316696 ) ) ( not ( = ?auto_316690 ?auto_316697 ) ) ( not ( = ?auto_316690 ?auto_316698 ) ) ( not ( = ?auto_316690 ?auto_316699 ) ) ( not ( = ?auto_316691 ?auto_316692 ) ) ( not ( = ?auto_316691 ?auto_316693 ) ) ( not ( = ?auto_316691 ?auto_316694 ) ) ( not ( = ?auto_316691 ?auto_316695 ) ) ( not ( = ?auto_316691 ?auto_316696 ) ) ( not ( = ?auto_316691 ?auto_316697 ) ) ( not ( = ?auto_316691 ?auto_316698 ) ) ( not ( = ?auto_316691 ?auto_316699 ) ) ( not ( = ?auto_316692 ?auto_316693 ) ) ( not ( = ?auto_316692 ?auto_316694 ) ) ( not ( = ?auto_316692 ?auto_316695 ) ) ( not ( = ?auto_316692 ?auto_316696 ) ) ( not ( = ?auto_316692 ?auto_316697 ) ) ( not ( = ?auto_316692 ?auto_316698 ) ) ( not ( = ?auto_316692 ?auto_316699 ) ) ( not ( = ?auto_316693 ?auto_316694 ) ) ( not ( = ?auto_316693 ?auto_316695 ) ) ( not ( = ?auto_316693 ?auto_316696 ) ) ( not ( = ?auto_316693 ?auto_316697 ) ) ( not ( = ?auto_316693 ?auto_316698 ) ) ( not ( = ?auto_316693 ?auto_316699 ) ) ( not ( = ?auto_316694 ?auto_316695 ) ) ( not ( = ?auto_316694 ?auto_316696 ) ) ( not ( = ?auto_316694 ?auto_316697 ) ) ( not ( = ?auto_316694 ?auto_316698 ) ) ( not ( = ?auto_316694 ?auto_316699 ) ) ( not ( = ?auto_316695 ?auto_316696 ) ) ( not ( = ?auto_316695 ?auto_316697 ) ) ( not ( = ?auto_316695 ?auto_316698 ) ) ( not ( = ?auto_316695 ?auto_316699 ) ) ( not ( = ?auto_316696 ?auto_316697 ) ) ( not ( = ?auto_316696 ?auto_316698 ) ) ( not ( = ?auto_316696 ?auto_316699 ) ) ( not ( = ?auto_316697 ?auto_316698 ) ) ( not ( = ?auto_316697 ?auto_316699 ) ) ( not ( = ?auto_316698 ?auto_316699 ) ) ( ON ?auto_316697 ?auto_316698 ) ( ON ?auto_316696 ?auto_316697 ) ( ON ?auto_316695 ?auto_316696 ) ( ON ?auto_316694 ?auto_316695 ) ( ON ?auto_316693 ?auto_316694 ) ( ON ?auto_316692 ?auto_316693 ) ( ON ?auto_316691 ?auto_316692 ) ( CLEAR ?auto_316689 ) ( ON ?auto_316690 ?auto_316691 ) ( CLEAR ?auto_316690 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_316686 ?auto_316687 ?auto_316688 ?auto_316689 ?auto_316690 )
      ( MAKE-13PILE ?auto_316686 ?auto_316687 ?auto_316688 ?auto_316689 ?auto_316690 ?auto_316691 ?auto_316692 ?auto_316693 ?auto_316694 ?auto_316695 ?auto_316696 ?auto_316697 ?auto_316698 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_316713 - BLOCK
      ?auto_316714 - BLOCK
      ?auto_316715 - BLOCK
      ?auto_316716 - BLOCK
      ?auto_316717 - BLOCK
      ?auto_316718 - BLOCK
      ?auto_316719 - BLOCK
      ?auto_316720 - BLOCK
      ?auto_316721 - BLOCK
      ?auto_316722 - BLOCK
      ?auto_316723 - BLOCK
      ?auto_316724 - BLOCK
      ?auto_316725 - BLOCK
    )
    :vars
    (
      ?auto_316726 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_316725 ?auto_316726 ) ( ON-TABLE ?auto_316713 ) ( ON ?auto_316714 ?auto_316713 ) ( ON ?auto_316715 ?auto_316714 ) ( ON ?auto_316716 ?auto_316715 ) ( not ( = ?auto_316713 ?auto_316714 ) ) ( not ( = ?auto_316713 ?auto_316715 ) ) ( not ( = ?auto_316713 ?auto_316716 ) ) ( not ( = ?auto_316713 ?auto_316717 ) ) ( not ( = ?auto_316713 ?auto_316718 ) ) ( not ( = ?auto_316713 ?auto_316719 ) ) ( not ( = ?auto_316713 ?auto_316720 ) ) ( not ( = ?auto_316713 ?auto_316721 ) ) ( not ( = ?auto_316713 ?auto_316722 ) ) ( not ( = ?auto_316713 ?auto_316723 ) ) ( not ( = ?auto_316713 ?auto_316724 ) ) ( not ( = ?auto_316713 ?auto_316725 ) ) ( not ( = ?auto_316713 ?auto_316726 ) ) ( not ( = ?auto_316714 ?auto_316715 ) ) ( not ( = ?auto_316714 ?auto_316716 ) ) ( not ( = ?auto_316714 ?auto_316717 ) ) ( not ( = ?auto_316714 ?auto_316718 ) ) ( not ( = ?auto_316714 ?auto_316719 ) ) ( not ( = ?auto_316714 ?auto_316720 ) ) ( not ( = ?auto_316714 ?auto_316721 ) ) ( not ( = ?auto_316714 ?auto_316722 ) ) ( not ( = ?auto_316714 ?auto_316723 ) ) ( not ( = ?auto_316714 ?auto_316724 ) ) ( not ( = ?auto_316714 ?auto_316725 ) ) ( not ( = ?auto_316714 ?auto_316726 ) ) ( not ( = ?auto_316715 ?auto_316716 ) ) ( not ( = ?auto_316715 ?auto_316717 ) ) ( not ( = ?auto_316715 ?auto_316718 ) ) ( not ( = ?auto_316715 ?auto_316719 ) ) ( not ( = ?auto_316715 ?auto_316720 ) ) ( not ( = ?auto_316715 ?auto_316721 ) ) ( not ( = ?auto_316715 ?auto_316722 ) ) ( not ( = ?auto_316715 ?auto_316723 ) ) ( not ( = ?auto_316715 ?auto_316724 ) ) ( not ( = ?auto_316715 ?auto_316725 ) ) ( not ( = ?auto_316715 ?auto_316726 ) ) ( not ( = ?auto_316716 ?auto_316717 ) ) ( not ( = ?auto_316716 ?auto_316718 ) ) ( not ( = ?auto_316716 ?auto_316719 ) ) ( not ( = ?auto_316716 ?auto_316720 ) ) ( not ( = ?auto_316716 ?auto_316721 ) ) ( not ( = ?auto_316716 ?auto_316722 ) ) ( not ( = ?auto_316716 ?auto_316723 ) ) ( not ( = ?auto_316716 ?auto_316724 ) ) ( not ( = ?auto_316716 ?auto_316725 ) ) ( not ( = ?auto_316716 ?auto_316726 ) ) ( not ( = ?auto_316717 ?auto_316718 ) ) ( not ( = ?auto_316717 ?auto_316719 ) ) ( not ( = ?auto_316717 ?auto_316720 ) ) ( not ( = ?auto_316717 ?auto_316721 ) ) ( not ( = ?auto_316717 ?auto_316722 ) ) ( not ( = ?auto_316717 ?auto_316723 ) ) ( not ( = ?auto_316717 ?auto_316724 ) ) ( not ( = ?auto_316717 ?auto_316725 ) ) ( not ( = ?auto_316717 ?auto_316726 ) ) ( not ( = ?auto_316718 ?auto_316719 ) ) ( not ( = ?auto_316718 ?auto_316720 ) ) ( not ( = ?auto_316718 ?auto_316721 ) ) ( not ( = ?auto_316718 ?auto_316722 ) ) ( not ( = ?auto_316718 ?auto_316723 ) ) ( not ( = ?auto_316718 ?auto_316724 ) ) ( not ( = ?auto_316718 ?auto_316725 ) ) ( not ( = ?auto_316718 ?auto_316726 ) ) ( not ( = ?auto_316719 ?auto_316720 ) ) ( not ( = ?auto_316719 ?auto_316721 ) ) ( not ( = ?auto_316719 ?auto_316722 ) ) ( not ( = ?auto_316719 ?auto_316723 ) ) ( not ( = ?auto_316719 ?auto_316724 ) ) ( not ( = ?auto_316719 ?auto_316725 ) ) ( not ( = ?auto_316719 ?auto_316726 ) ) ( not ( = ?auto_316720 ?auto_316721 ) ) ( not ( = ?auto_316720 ?auto_316722 ) ) ( not ( = ?auto_316720 ?auto_316723 ) ) ( not ( = ?auto_316720 ?auto_316724 ) ) ( not ( = ?auto_316720 ?auto_316725 ) ) ( not ( = ?auto_316720 ?auto_316726 ) ) ( not ( = ?auto_316721 ?auto_316722 ) ) ( not ( = ?auto_316721 ?auto_316723 ) ) ( not ( = ?auto_316721 ?auto_316724 ) ) ( not ( = ?auto_316721 ?auto_316725 ) ) ( not ( = ?auto_316721 ?auto_316726 ) ) ( not ( = ?auto_316722 ?auto_316723 ) ) ( not ( = ?auto_316722 ?auto_316724 ) ) ( not ( = ?auto_316722 ?auto_316725 ) ) ( not ( = ?auto_316722 ?auto_316726 ) ) ( not ( = ?auto_316723 ?auto_316724 ) ) ( not ( = ?auto_316723 ?auto_316725 ) ) ( not ( = ?auto_316723 ?auto_316726 ) ) ( not ( = ?auto_316724 ?auto_316725 ) ) ( not ( = ?auto_316724 ?auto_316726 ) ) ( not ( = ?auto_316725 ?auto_316726 ) ) ( ON ?auto_316724 ?auto_316725 ) ( ON ?auto_316723 ?auto_316724 ) ( ON ?auto_316722 ?auto_316723 ) ( ON ?auto_316721 ?auto_316722 ) ( ON ?auto_316720 ?auto_316721 ) ( ON ?auto_316719 ?auto_316720 ) ( ON ?auto_316718 ?auto_316719 ) ( CLEAR ?auto_316716 ) ( ON ?auto_316717 ?auto_316718 ) ( CLEAR ?auto_316717 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_316713 ?auto_316714 ?auto_316715 ?auto_316716 ?auto_316717 )
      ( MAKE-13PILE ?auto_316713 ?auto_316714 ?auto_316715 ?auto_316716 ?auto_316717 ?auto_316718 ?auto_316719 ?auto_316720 ?auto_316721 ?auto_316722 ?auto_316723 ?auto_316724 ?auto_316725 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_316740 - BLOCK
      ?auto_316741 - BLOCK
      ?auto_316742 - BLOCK
      ?auto_316743 - BLOCK
      ?auto_316744 - BLOCK
      ?auto_316745 - BLOCK
      ?auto_316746 - BLOCK
      ?auto_316747 - BLOCK
      ?auto_316748 - BLOCK
      ?auto_316749 - BLOCK
      ?auto_316750 - BLOCK
      ?auto_316751 - BLOCK
      ?auto_316752 - BLOCK
    )
    :vars
    (
      ?auto_316753 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_316752 ?auto_316753 ) ( ON-TABLE ?auto_316740 ) ( ON ?auto_316741 ?auto_316740 ) ( ON ?auto_316742 ?auto_316741 ) ( not ( = ?auto_316740 ?auto_316741 ) ) ( not ( = ?auto_316740 ?auto_316742 ) ) ( not ( = ?auto_316740 ?auto_316743 ) ) ( not ( = ?auto_316740 ?auto_316744 ) ) ( not ( = ?auto_316740 ?auto_316745 ) ) ( not ( = ?auto_316740 ?auto_316746 ) ) ( not ( = ?auto_316740 ?auto_316747 ) ) ( not ( = ?auto_316740 ?auto_316748 ) ) ( not ( = ?auto_316740 ?auto_316749 ) ) ( not ( = ?auto_316740 ?auto_316750 ) ) ( not ( = ?auto_316740 ?auto_316751 ) ) ( not ( = ?auto_316740 ?auto_316752 ) ) ( not ( = ?auto_316740 ?auto_316753 ) ) ( not ( = ?auto_316741 ?auto_316742 ) ) ( not ( = ?auto_316741 ?auto_316743 ) ) ( not ( = ?auto_316741 ?auto_316744 ) ) ( not ( = ?auto_316741 ?auto_316745 ) ) ( not ( = ?auto_316741 ?auto_316746 ) ) ( not ( = ?auto_316741 ?auto_316747 ) ) ( not ( = ?auto_316741 ?auto_316748 ) ) ( not ( = ?auto_316741 ?auto_316749 ) ) ( not ( = ?auto_316741 ?auto_316750 ) ) ( not ( = ?auto_316741 ?auto_316751 ) ) ( not ( = ?auto_316741 ?auto_316752 ) ) ( not ( = ?auto_316741 ?auto_316753 ) ) ( not ( = ?auto_316742 ?auto_316743 ) ) ( not ( = ?auto_316742 ?auto_316744 ) ) ( not ( = ?auto_316742 ?auto_316745 ) ) ( not ( = ?auto_316742 ?auto_316746 ) ) ( not ( = ?auto_316742 ?auto_316747 ) ) ( not ( = ?auto_316742 ?auto_316748 ) ) ( not ( = ?auto_316742 ?auto_316749 ) ) ( not ( = ?auto_316742 ?auto_316750 ) ) ( not ( = ?auto_316742 ?auto_316751 ) ) ( not ( = ?auto_316742 ?auto_316752 ) ) ( not ( = ?auto_316742 ?auto_316753 ) ) ( not ( = ?auto_316743 ?auto_316744 ) ) ( not ( = ?auto_316743 ?auto_316745 ) ) ( not ( = ?auto_316743 ?auto_316746 ) ) ( not ( = ?auto_316743 ?auto_316747 ) ) ( not ( = ?auto_316743 ?auto_316748 ) ) ( not ( = ?auto_316743 ?auto_316749 ) ) ( not ( = ?auto_316743 ?auto_316750 ) ) ( not ( = ?auto_316743 ?auto_316751 ) ) ( not ( = ?auto_316743 ?auto_316752 ) ) ( not ( = ?auto_316743 ?auto_316753 ) ) ( not ( = ?auto_316744 ?auto_316745 ) ) ( not ( = ?auto_316744 ?auto_316746 ) ) ( not ( = ?auto_316744 ?auto_316747 ) ) ( not ( = ?auto_316744 ?auto_316748 ) ) ( not ( = ?auto_316744 ?auto_316749 ) ) ( not ( = ?auto_316744 ?auto_316750 ) ) ( not ( = ?auto_316744 ?auto_316751 ) ) ( not ( = ?auto_316744 ?auto_316752 ) ) ( not ( = ?auto_316744 ?auto_316753 ) ) ( not ( = ?auto_316745 ?auto_316746 ) ) ( not ( = ?auto_316745 ?auto_316747 ) ) ( not ( = ?auto_316745 ?auto_316748 ) ) ( not ( = ?auto_316745 ?auto_316749 ) ) ( not ( = ?auto_316745 ?auto_316750 ) ) ( not ( = ?auto_316745 ?auto_316751 ) ) ( not ( = ?auto_316745 ?auto_316752 ) ) ( not ( = ?auto_316745 ?auto_316753 ) ) ( not ( = ?auto_316746 ?auto_316747 ) ) ( not ( = ?auto_316746 ?auto_316748 ) ) ( not ( = ?auto_316746 ?auto_316749 ) ) ( not ( = ?auto_316746 ?auto_316750 ) ) ( not ( = ?auto_316746 ?auto_316751 ) ) ( not ( = ?auto_316746 ?auto_316752 ) ) ( not ( = ?auto_316746 ?auto_316753 ) ) ( not ( = ?auto_316747 ?auto_316748 ) ) ( not ( = ?auto_316747 ?auto_316749 ) ) ( not ( = ?auto_316747 ?auto_316750 ) ) ( not ( = ?auto_316747 ?auto_316751 ) ) ( not ( = ?auto_316747 ?auto_316752 ) ) ( not ( = ?auto_316747 ?auto_316753 ) ) ( not ( = ?auto_316748 ?auto_316749 ) ) ( not ( = ?auto_316748 ?auto_316750 ) ) ( not ( = ?auto_316748 ?auto_316751 ) ) ( not ( = ?auto_316748 ?auto_316752 ) ) ( not ( = ?auto_316748 ?auto_316753 ) ) ( not ( = ?auto_316749 ?auto_316750 ) ) ( not ( = ?auto_316749 ?auto_316751 ) ) ( not ( = ?auto_316749 ?auto_316752 ) ) ( not ( = ?auto_316749 ?auto_316753 ) ) ( not ( = ?auto_316750 ?auto_316751 ) ) ( not ( = ?auto_316750 ?auto_316752 ) ) ( not ( = ?auto_316750 ?auto_316753 ) ) ( not ( = ?auto_316751 ?auto_316752 ) ) ( not ( = ?auto_316751 ?auto_316753 ) ) ( not ( = ?auto_316752 ?auto_316753 ) ) ( ON ?auto_316751 ?auto_316752 ) ( ON ?auto_316750 ?auto_316751 ) ( ON ?auto_316749 ?auto_316750 ) ( ON ?auto_316748 ?auto_316749 ) ( ON ?auto_316747 ?auto_316748 ) ( ON ?auto_316746 ?auto_316747 ) ( ON ?auto_316745 ?auto_316746 ) ( ON ?auto_316744 ?auto_316745 ) ( CLEAR ?auto_316742 ) ( ON ?auto_316743 ?auto_316744 ) ( CLEAR ?auto_316743 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_316740 ?auto_316741 ?auto_316742 ?auto_316743 )
      ( MAKE-13PILE ?auto_316740 ?auto_316741 ?auto_316742 ?auto_316743 ?auto_316744 ?auto_316745 ?auto_316746 ?auto_316747 ?auto_316748 ?auto_316749 ?auto_316750 ?auto_316751 ?auto_316752 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_316767 - BLOCK
      ?auto_316768 - BLOCK
      ?auto_316769 - BLOCK
      ?auto_316770 - BLOCK
      ?auto_316771 - BLOCK
      ?auto_316772 - BLOCK
      ?auto_316773 - BLOCK
      ?auto_316774 - BLOCK
      ?auto_316775 - BLOCK
      ?auto_316776 - BLOCK
      ?auto_316777 - BLOCK
      ?auto_316778 - BLOCK
      ?auto_316779 - BLOCK
    )
    :vars
    (
      ?auto_316780 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_316779 ?auto_316780 ) ( ON-TABLE ?auto_316767 ) ( ON ?auto_316768 ?auto_316767 ) ( ON ?auto_316769 ?auto_316768 ) ( not ( = ?auto_316767 ?auto_316768 ) ) ( not ( = ?auto_316767 ?auto_316769 ) ) ( not ( = ?auto_316767 ?auto_316770 ) ) ( not ( = ?auto_316767 ?auto_316771 ) ) ( not ( = ?auto_316767 ?auto_316772 ) ) ( not ( = ?auto_316767 ?auto_316773 ) ) ( not ( = ?auto_316767 ?auto_316774 ) ) ( not ( = ?auto_316767 ?auto_316775 ) ) ( not ( = ?auto_316767 ?auto_316776 ) ) ( not ( = ?auto_316767 ?auto_316777 ) ) ( not ( = ?auto_316767 ?auto_316778 ) ) ( not ( = ?auto_316767 ?auto_316779 ) ) ( not ( = ?auto_316767 ?auto_316780 ) ) ( not ( = ?auto_316768 ?auto_316769 ) ) ( not ( = ?auto_316768 ?auto_316770 ) ) ( not ( = ?auto_316768 ?auto_316771 ) ) ( not ( = ?auto_316768 ?auto_316772 ) ) ( not ( = ?auto_316768 ?auto_316773 ) ) ( not ( = ?auto_316768 ?auto_316774 ) ) ( not ( = ?auto_316768 ?auto_316775 ) ) ( not ( = ?auto_316768 ?auto_316776 ) ) ( not ( = ?auto_316768 ?auto_316777 ) ) ( not ( = ?auto_316768 ?auto_316778 ) ) ( not ( = ?auto_316768 ?auto_316779 ) ) ( not ( = ?auto_316768 ?auto_316780 ) ) ( not ( = ?auto_316769 ?auto_316770 ) ) ( not ( = ?auto_316769 ?auto_316771 ) ) ( not ( = ?auto_316769 ?auto_316772 ) ) ( not ( = ?auto_316769 ?auto_316773 ) ) ( not ( = ?auto_316769 ?auto_316774 ) ) ( not ( = ?auto_316769 ?auto_316775 ) ) ( not ( = ?auto_316769 ?auto_316776 ) ) ( not ( = ?auto_316769 ?auto_316777 ) ) ( not ( = ?auto_316769 ?auto_316778 ) ) ( not ( = ?auto_316769 ?auto_316779 ) ) ( not ( = ?auto_316769 ?auto_316780 ) ) ( not ( = ?auto_316770 ?auto_316771 ) ) ( not ( = ?auto_316770 ?auto_316772 ) ) ( not ( = ?auto_316770 ?auto_316773 ) ) ( not ( = ?auto_316770 ?auto_316774 ) ) ( not ( = ?auto_316770 ?auto_316775 ) ) ( not ( = ?auto_316770 ?auto_316776 ) ) ( not ( = ?auto_316770 ?auto_316777 ) ) ( not ( = ?auto_316770 ?auto_316778 ) ) ( not ( = ?auto_316770 ?auto_316779 ) ) ( not ( = ?auto_316770 ?auto_316780 ) ) ( not ( = ?auto_316771 ?auto_316772 ) ) ( not ( = ?auto_316771 ?auto_316773 ) ) ( not ( = ?auto_316771 ?auto_316774 ) ) ( not ( = ?auto_316771 ?auto_316775 ) ) ( not ( = ?auto_316771 ?auto_316776 ) ) ( not ( = ?auto_316771 ?auto_316777 ) ) ( not ( = ?auto_316771 ?auto_316778 ) ) ( not ( = ?auto_316771 ?auto_316779 ) ) ( not ( = ?auto_316771 ?auto_316780 ) ) ( not ( = ?auto_316772 ?auto_316773 ) ) ( not ( = ?auto_316772 ?auto_316774 ) ) ( not ( = ?auto_316772 ?auto_316775 ) ) ( not ( = ?auto_316772 ?auto_316776 ) ) ( not ( = ?auto_316772 ?auto_316777 ) ) ( not ( = ?auto_316772 ?auto_316778 ) ) ( not ( = ?auto_316772 ?auto_316779 ) ) ( not ( = ?auto_316772 ?auto_316780 ) ) ( not ( = ?auto_316773 ?auto_316774 ) ) ( not ( = ?auto_316773 ?auto_316775 ) ) ( not ( = ?auto_316773 ?auto_316776 ) ) ( not ( = ?auto_316773 ?auto_316777 ) ) ( not ( = ?auto_316773 ?auto_316778 ) ) ( not ( = ?auto_316773 ?auto_316779 ) ) ( not ( = ?auto_316773 ?auto_316780 ) ) ( not ( = ?auto_316774 ?auto_316775 ) ) ( not ( = ?auto_316774 ?auto_316776 ) ) ( not ( = ?auto_316774 ?auto_316777 ) ) ( not ( = ?auto_316774 ?auto_316778 ) ) ( not ( = ?auto_316774 ?auto_316779 ) ) ( not ( = ?auto_316774 ?auto_316780 ) ) ( not ( = ?auto_316775 ?auto_316776 ) ) ( not ( = ?auto_316775 ?auto_316777 ) ) ( not ( = ?auto_316775 ?auto_316778 ) ) ( not ( = ?auto_316775 ?auto_316779 ) ) ( not ( = ?auto_316775 ?auto_316780 ) ) ( not ( = ?auto_316776 ?auto_316777 ) ) ( not ( = ?auto_316776 ?auto_316778 ) ) ( not ( = ?auto_316776 ?auto_316779 ) ) ( not ( = ?auto_316776 ?auto_316780 ) ) ( not ( = ?auto_316777 ?auto_316778 ) ) ( not ( = ?auto_316777 ?auto_316779 ) ) ( not ( = ?auto_316777 ?auto_316780 ) ) ( not ( = ?auto_316778 ?auto_316779 ) ) ( not ( = ?auto_316778 ?auto_316780 ) ) ( not ( = ?auto_316779 ?auto_316780 ) ) ( ON ?auto_316778 ?auto_316779 ) ( ON ?auto_316777 ?auto_316778 ) ( ON ?auto_316776 ?auto_316777 ) ( ON ?auto_316775 ?auto_316776 ) ( ON ?auto_316774 ?auto_316775 ) ( ON ?auto_316773 ?auto_316774 ) ( ON ?auto_316772 ?auto_316773 ) ( ON ?auto_316771 ?auto_316772 ) ( CLEAR ?auto_316769 ) ( ON ?auto_316770 ?auto_316771 ) ( CLEAR ?auto_316770 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_316767 ?auto_316768 ?auto_316769 ?auto_316770 )
      ( MAKE-13PILE ?auto_316767 ?auto_316768 ?auto_316769 ?auto_316770 ?auto_316771 ?auto_316772 ?auto_316773 ?auto_316774 ?auto_316775 ?auto_316776 ?auto_316777 ?auto_316778 ?auto_316779 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_316794 - BLOCK
      ?auto_316795 - BLOCK
      ?auto_316796 - BLOCK
      ?auto_316797 - BLOCK
      ?auto_316798 - BLOCK
      ?auto_316799 - BLOCK
      ?auto_316800 - BLOCK
      ?auto_316801 - BLOCK
      ?auto_316802 - BLOCK
      ?auto_316803 - BLOCK
      ?auto_316804 - BLOCK
      ?auto_316805 - BLOCK
      ?auto_316806 - BLOCK
    )
    :vars
    (
      ?auto_316807 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_316806 ?auto_316807 ) ( ON-TABLE ?auto_316794 ) ( ON ?auto_316795 ?auto_316794 ) ( not ( = ?auto_316794 ?auto_316795 ) ) ( not ( = ?auto_316794 ?auto_316796 ) ) ( not ( = ?auto_316794 ?auto_316797 ) ) ( not ( = ?auto_316794 ?auto_316798 ) ) ( not ( = ?auto_316794 ?auto_316799 ) ) ( not ( = ?auto_316794 ?auto_316800 ) ) ( not ( = ?auto_316794 ?auto_316801 ) ) ( not ( = ?auto_316794 ?auto_316802 ) ) ( not ( = ?auto_316794 ?auto_316803 ) ) ( not ( = ?auto_316794 ?auto_316804 ) ) ( not ( = ?auto_316794 ?auto_316805 ) ) ( not ( = ?auto_316794 ?auto_316806 ) ) ( not ( = ?auto_316794 ?auto_316807 ) ) ( not ( = ?auto_316795 ?auto_316796 ) ) ( not ( = ?auto_316795 ?auto_316797 ) ) ( not ( = ?auto_316795 ?auto_316798 ) ) ( not ( = ?auto_316795 ?auto_316799 ) ) ( not ( = ?auto_316795 ?auto_316800 ) ) ( not ( = ?auto_316795 ?auto_316801 ) ) ( not ( = ?auto_316795 ?auto_316802 ) ) ( not ( = ?auto_316795 ?auto_316803 ) ) ( not ( = ?auto_316795 ?auto_316804 ) ) ( not ( = ?auto_316795 ?auto_316805 ) ) ( not ( = ?auto_316795 ?auto_316806 ) ) ( not ( = ?auto_316795 ?auto_316807 ) ) ( not ( = ?auto_316796 ?auto_316797 ) ) ( not ( = ?auto_316796 ?auto_316798 ) ) ( not ( = ?auto_316796 ?auto_316799 ) ) ( not ( = ?auto_316796 ?auto_316800 ) ) ( not ( = ?auto_316796 ?auto_316801 ) ) ( not ( = ?auto_316796 ?auto_316802 ) ) ( not ( = ?auto_316796 ?auto_316803 ) ) ( not ( = ?auto_316796 ?auto_316804 ) ) ( not ( = ?auto_316796 ?auto_316805 ) ) ( not ( = ?auto_316796 ?auto_316806 ) ) ( not ( = ?auto_316796 ?auto_316807 ) ) ( not ( = ?auto_316797 ?auto_316798 ) ) ( not ( = ?auto_316797 ?auto_316799 ) ) ( not ( = ?auto_316797 ?auto_316800 ) ) ( not ( = ?auto_316797 ?auto_316801 ) ) ( not ( = ?auto_316797 ?auto_316802 ) ) ( not ( = ?auto_316797 ?auto_316803 ) ) ( not ( = ?auto_316797 ?auto_316804 ) ) ( not ( = ?auto_316797 ?auto_316805 ) ) ( not ( = ?auto_316797 ?auto_316806 ) ) ( not ( = ?auto_316797 ?auto_316807 ) ) ( not ( = ?auto_316798 ?auto_316799 ) ) ( not ( = ?auto_316798 ?auto_316800 ) ) ( not ( = ?auto_316798 ?auto_316801 ) ) ( not ( = ?auto_316798 ?auto_316802 ) ) ( not ( = ?auto_316798 ?auto_316803 ) ) ( not ( = ?auto_316798 ?auto_316804 ) ) ( not ( = ?auto_316798 ?auto_316805 ) ) ( not ( = ?auto_316798 ?auto_316806 ) ) ( not ( = ?auto_316798 ?auto_316807 ) ) ( not ( = ?auto_316799 ?auto_316800 ) ) ( not ( = ?auto_316799 ?auto_316801 ) ) ( not ( = ?auto_316799 ?auto_316802 ) ) ( not ( = ?auto_316799 ?auto_316803 ) ) ( not ( = ?auto_316799 ?auto_316804 ) ) ( not ( = ?auto_316799 ?auto_316805 ) ) ( not ( = ?auto_316799 ?auto_316806 ) ) ( not ( = ?auto_316799 ?auto_316807 ) ) ( not ( = ?auto_316800 ?auto_316801 ) ) ( not ( = ?auto_316800 ?auto_316802 ) ) ( not ( = ?auto_316800 ?auto_316803 ) ) ( not ( = ?auto_316800 ?auto_316804 ) ) ( not ( = ?auto_316800 ?auto_316805 ) ) ( not ( = ?auto_316800 ?auto_316806 ) ) ( not ( = ?auto_316800 ?auto_316807 ) ) ( not ( = ?auto_316801 ?auto_316802 ) ) ( not ( = ?auto_316801 ?auto_316803 ) ) ( not ( = ?auto_316801 ?auto_316804 ) ) ( not ( = ?auto_316801 ?auto_316805 ) ) ( not ( = ?auto_316801 ?auto_316806 ) ) ( not ( = ?auto_316801 ?auto_316807 ) ) ( not ( = ?auto_316802 ?auto_316803 ) ) ( not ( = ?auto_316802 ?auto_316804 ) ) ( not ( = ?auto_316802 ?auto_316805 ) ) ( not ( = ?auto_316802 ?auto_316806 ) ) ( not ( = ?auto_316802 ?auto_316807 ) ) ( not ( = ?auto_316803 ?auto_316804 ) ) ( not ( = ?auto_316803 ?auto_316805 ) ) ( not ( = ?auto_316803 ?auto_316806 ) ) ( not ( = ?auto_316803 ?auto_316807 ) ) ( not ( = ?auto_316804 ?auto_316805 ) ) ( not ( = ?auto_316804 ?auto_316806 ) ) ( not ( = ?auto_316804 ?auto_316807 ) ) ( not ( = ?auto_316805 ?auto_316806 ) ) ( not ( = ?auto_316805 ?auto_316807 ) ) ( not ( = ?auto_316806 ?auto_316807 ) ) ( ON ?auto_316805 ?auto_316806 ) ( ON ?auto_316804 ?auto_316805 ) ( ON ?auto_316803 ?auto_316804 ) ( ON ?auto_316802 ?auto_316803 ) ( ON ?auto_316801 ?auto_316802 ) ( ON ?auto_316800 ?auto_316801 ) ( ON ?auto_316799 ?auto_316800 ) ( ON ?auto_316798 ?auto_316799 ) ( ON ?auto_316797 ?auto_316798 ) ( CLEAR ?auto_316795 ) ( ON ?auto_316796 ?auto_316797 ) ( CLEAR ?auto_316796 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_316794 ?auto_316795 ?auto_316796 )
      ( MAKE-13PILE ?auto_316794 ?auto_316795 ?auto_316796 ?auto_316797 ?auto_316798 ?auto_316799 ?auto_316800 ?auto_316801 ?auto_316802 ?auto_316803 ?auto_316804 ?auto_316805 ?auto_316806 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_316821 - BLOCK
      ?auto_316822 - BLOCK
      ?auto_316823 - BLOCK
      ?auto_316824 - BLOCK
      ?auto_316825 - BLOCK
      ?auto_316826 - BLOCK
      ?auto_316827 - BLOCK
      ?auto_316828 - BLOCK
      ?auto_316829 - BLOCK
      ?auto_316830 - BLOCK
      ?auto_316831 - BLOCK
      ?auto_316832 - BLOCK
      ?auto_316833 - BLOCK
    )
    :vars
    (
      ?auto_316834 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_316833 ?auto_316834 ) ( ON-TABLE ?auto_316821 ) ( ON ?auto_316822 ?auto_316821 ) ( not ( = ?auto_316821 ?auto_316822 ) ) ( not ( = ?auto_316821 ?auto_316823 ) ) ( not ( = ?auto_316821 ?auto_316824 ) ) ( not ( = ?auto_316821 ?auto_316825 ) ) ( not ( = ?auto_316821 ?auto_316826 ) ) ( not ( = ?auto_316821 ?auto_316827 ) ) ( not ( = ?auto_316821 ?auto_316828 ) ) ( not ( = ?auto_316821 ?auto_316829 ) ) ( not ( = ?auto_316821 ?auto_316830 ) ) ( not ( = ?auto_316821 ?auto_316831 ) ) ( not ( = ?auto_316821 ?auto_316832 ) ) ( not ( = ?auto_316821 ?auto_316833 ) ) ( not ( = ?auto_316821 ?auto_316834 ) ) ( not ( = ?auto_316822 ?auto_316823 ) ) ( not ( = ?auto_316822 ?auto_316824 ) ) ( not ( = ?auto_316822 ?auto_316825 ) ) ( not ( = ?auto_316822 ?auto_316826 ) ) ( not ( = ?auto_316822 ?auto_316827 ) ) ( not ( = ?auto_316822 ?auto_316828 ) ) ( not ( = ?auto_316822 ?auto_316829 ) ) ( not ( = ?auto_316822 ?auto_316830 ) ) ( not ( = ?auto_316822 ?auto_316831 ) ) ( not ( = ?auto_316822 ?auto_316832 ) ) ( not ( = ?auto_316822 ?auto_316833 ) ) ( not ( = ?auto_316822 ?auto_316834 ) ) ( not ( = ?auto_316823 ?auto_316824 ) ) ( not ( = ?auto_316823 ?auto_316825 ) ) ( not ( = ?auto_316823 ?auto_316826 ) ) ( not ( = ?auto_316823 ?auto_316827 ) ) ( not ( = ?auto_316823 ?auto_316828 ) ) ( not ( = ?auto_316823 ?auto_316829 ) ) ( not ( = ?auto_316823 ?auto_316830 ) ) ( not ( = ?auto_316823 ?auto_316831 ) ) ( not ( = ?auto_316823 ?auto_316832 ) ) ( not ( = ?auto_316823 ?auto_316833 ) ) ( not ( = ?auto_316823 ?auto_316834 ) ) ( not ( = ?auto_316824 ?auto_316825 ) ) ( not ( = ?auto_316824 ?auto_316826 ) ) ( not ( = ?auto_316824 ?auto_316827 ) ) ( not ( = ?auto_316824 ?auto_316828 ) ) ( not ( = ?auto_316824 ?auto_316829 ) ) ( not ( = ?auto_316824 ?auto_316830 ) ) ( not ( = ?auto_316824 ?auto_316831 ) ) ( not ( = ?auto_316824 ?auto_316832 ) ) ( not ( = ?auto_316824 ?auto_316833 ) ) ( not ( = ?auto_316824 ?auto_316834 ) ) ( not ( = ?auto_316825 ?auto_316826 ) ) ( not ( = ?auto_316825 ?auto_316827 ) ) ( not ( = ?auto_316825 ?auto_316828 ) ) ( not ( = ?auto_316825 ?auto_316829 ) ) ( not ( = ?auto_316825 ?auto_316830 ) ) ( not ( = ?auto_316825 ?auto_316831 ) ) ( not ( = ?auto_316825 ?auto_316832 ) ) ( not ( = ?auto_316825 ?auto_316833 ) ) ( not ( = ?auto_316825 ?auto_316834 ) ) ( not ( = ?auto_316826 ?auto_316827 ) ) ( not ( = ?auto_316826 ?auto_316828 ) ) ( not ( = ?auto_316826 ?auto_316829 ) ) ( not ( = ?auto_316826 ?auto_316830 ) ) ( not ( = ?auto_316826 ?auto_316831 ) ) ( not ( = ?auto_316826 ?auto_316832 ) ) ( not ( = ?auto_316826 ?auto_316833 ) ) ( not ( = ?auto_316826 ?auto_316834 ) ) ( not ( = ?auto_316827 ?auto_316828 ) ) ( not ( = ?auto_316827 ?auto_316829 ) ) ( not ( = ?auto_316827 ?auto_316830 ) ) ( not ( = ?auto_316827 ?auto_316831 ) ) ( not ( = ?auto_316827 ?auto_316832 ) ) ( not ( = ?auto_316827 ?auto_316833 ) ) ( not ( = ?auto_316827 ?auto_316834 ) ) ( not ( = ?auto_316828 ?auto_316829 ) ) ( not ( = ?auto_316828 ?auto_316830 ) ) ( not ( = ?auto_316828 ?auto_316831 ) ) ( not ( = ?auto_316828 ?auto_316832 ) ) ( not ( = ?auto_316828 ?auto_316833 ) ) ( not ( = ?auto_316828 ?auto_316834 ) ) ( not ( = ?auto_316829 ?auto_316830 ) ) ( not ( = ?auto_316829 ?auto_316831 ) ) ( not ( = ?auto_316829 ?auto_316832 ) ) ( not ( = ?auto_316829 ?auto_316833 ) ) ( not ( = ?auto_316829 ?auto_316834 ) ) ( not ( = ?auto_316830 ?auto_316831 ) ) ( not ( = ?auto_316830 ?auto_316832 ) ) ( not ( = ?auto_316830 ?auto_316833 ) ) ( not ( = ?auto_316830 ?auto_316834 ) ) ( not ( = ?auto_316831 ?auto_316832 ) ) ( not ( = ?auto_316831 ?auto_316833 ) ) ( not ( = ?auto_316831 ?auto_316834 ) ) ( not ( = ?auto_316832 ?auto_316833 ) ) ( not ( = ?auto_316832 ?auto_316834 ) ) ( not ( = ?auto_316833 ?auto_316834 ) ) ( ON ?auto_316832 ?auto_316833 ) ( ON ?auto_316831 ?auto_316832 ) ( ON ?auto_316830 ?auto_316831 ) ( ON ?auto_316829 ?auto_316830 ) ( ON ?auto_316828 ?auto_316829 ) ( ON ?auto_316827 ?auto_316828 ) ( ON ?auto_316826 ?auto_316827 ) ( ON ?auto_316825 ?auto_316826 ) ( ON ?auto_316824 ?auto_316825 ) ( CLEAR ?auto_316822 ) ( ON ?auto_316823 ?auto_316824 ) ( CLEAR ?auto_316823 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_316821 ?auto_316822 ?auto_316823 )
      ( MAKE-13PILE ?auto_316821 ?auto_316822 ?auto_316823 ?auto_316824 ?auto_316825 ?auto_316826 ?auto_316827 ?auto_316828 ?auto_316829 ?auto_316830 ?auto_316831 ?auto_316832 ?auto_316833 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_316848 - BLOCK
      ?auto_316849 - BLOCK
      ?auto_316850 - BLOCK
      ?auto_316851 - BLOCK
      ?auto_316852 - BLOCK
      ?auto_316853 - BLOCK
      ?auto_316854 - BLOCK
      ?auto_316855 - BLOCK
      ?auto_316856 - BLOCK
      ?auto_316857 - BLOCK
      ?auto_316858 - BLOCK
      ?auto_316859 - BLOCK
      ?auto_316860 - BLOCK
    )
    :vars
    (
      ?auto_316861 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_316860 ?auto_316861 ) ( ON-TABLE ?auto_316848 ) ( not ( = ?auto_316848 ?auto_316849 ) ) ( not ( = ?auto_316848 ?auto_316850 ) ) ( not ( = ?auto_316848 ?auto_316851 ) ) ( not ( = ?auto_316848 ?auto_316852 ) ) ( not ( = ?auto_316848 ?auto_316853 ) ) ( not ( = ?auto_316848 ?auto_316854 ) ) ( not ( = ?auto_316848 ?auto_316855 ) ) ( not ( = ?auto_316848 ?auto_316856 ) ) ( not ( = ?auto_316848 ?auto_316857 ) ) ( not ( = ?auto_316848 ?auto_316858 ) ) ( not ( = ?auto_316848 ?auto_316859 ) ) ( not ( = ?auto_316848 ?auto_316860 ) ) ( not ( = ?auto_316848 ?auto_316861 ) ) ( not ( = ?auto_316849 ?auto_316850 ) ) ( not ( = ?auto_316849 ?auto_316851 ) ) ( not ( = ?auto_316849 ?auto_316852 ) ) ( not ( = ?auto_316849 ?auto_316853 ) ) ( not ( = ?auto_316849 ?auto_316854 ) ) ( not ( = ?auto_316849 ?auto_316855 ) ) ( not ( = ?auto_316849 ?auto_316856 ) ) ( not ( = ?auto_316849 ?auto_316857 ) ) ( not ( = ?auto_316849 ?auto_316858 ) ) ( not ( = ?auto_316849 ?auto_316859 ) ) ( not ( = ?auto_316849 ?auto_316860 ) ) ( not ( = ?auto_316849 ?auto_316861 ) ) ( not ( = ?auto_316850 ?auto_316851 ) ) ( not ( = ?auto_316850 ?auto_316852 ) ) ( not ( = ?auto_316850 ?auto_316853 ) ) ( not ( = ?auto_316850 ?auto_316854 ) ) ( not ( = ?auto_316850 ?auto_316855 ) ) ( not ( = ?auto_316850 ?auto_316856 ) ) ( not ( = ?auto_316850 ?auto_316857 ) ) ( not ( = ?auto_316850 ?auto_316858 ) ) ( not ( = ?auto_316850 ?auto_316859 ) ) ( not ( = ?auto_316850 ?auto_316860 ) ) ( not ( = ?auto_316850 ?auto_316861 ) ) ( not ( = ?auto_316851 ?auto_316852 ) ) ( not ( = ?auto_316851 ?auto_316853 ) ) ( not ( = ?auto_316851 ?auto_316854 ) ) ( not ( = ?auto_316851 ?auto_316855 ) ) ( not ( = ?auto_316851 ?auto_316856 ) ) ( not ( = ?auto_316851 ?auto_316857 ) ) ( not ( = ?auto_316851 ?auto_316858 ) ) ( not ( = ?auto_316851 ?auto_316859 ) ) ( not ( = ?auto_316851 ?auto_316860 ) ) ( not ( = ?auto_316851 ?auto_316861 ) ) ( not ( = ?auto_316852 ?auto_316853 ) ) ( not ( = ?auto_316852 ?auto_316854 ) ) ( not ( = ?auto_316852 ?auto_316855 ) ) ( not ( = ?auto_316852 ?auto_316856 ) ) ( not ( = ?auto_316852 ?auto_316857 ) ) ( not ( = ?auto_316852 ?auto_316858 ) ) ( not ( = ?auto_316852 ?auto_316859 ) ) ( not ( = ?auto_316852 ?auto_316860 ) ) ( not ( = ?auto_316852 ?auto_316861 ) ) ( not ( = ?auto_316853 ?auto_316854 ) ) ( not ( = ?auto_316853 ?auto_316855 ) ) ( not ( = ?auto_316853 ?auto_316856 ) ) ( not ( = ?auto_316853 ?auto_316857 ) ) ( not ( = ?auto_316853 ?auto_316858 ) ) ( not ( = ?auto_316853 ?auto_316859 ) ) ( not ( = ?auto_316853 ?auto_316860 ) ) ( not ( = ?auto_316853 ?auto_316861 ) ) ( not ( = ?auto_316854 ?auto_316855 ) ) ( not ( = ?auto_316854 ?auto_316856 ) ) ( not ( = ?auto_316854 ?auto_316857 ) ) ( not ( = ?auto_316854 ?auto_316858 ) ) ( not ( = ?auto_316854 ?auto_316859 ) ) ( not ( = ?auto_316854 ?auto_316860 ) ) ( not ( = ?auto_316854 ?auto_316861 ) ) ( not ( = ?auto_316855 ?auto_316856 ) ) ( not ( = ?auto_316855 ?auto_316857 ) ) ( not ( = ?auto_316855 ?auto_316858 ) ) ( not ( = ?auto_316855 ?auto_316859 ) ) ( not ( = ?auto_316855 ?auto_316860 ) ) ( not ( = ?auto_316855 ?auto_316861 ) ) ( not ( = ?auto_316856 ?auto_316857 ) ) ( not ( = ?auto_316856 ?auto_316858 ) ) ( not ( = ?auto_316856 ?auto_316859 ) ) ( not ( = ?auto_316856 ?auto_316860 ) ) ( not ( = ?auto_316856 ?auto_316861 ) ) ( not ( = ?auto_316857 ?auto_316858 ) ) ( not ( = ?auto_316857 ?auto_316859 ) ) ( not ( = ?auto_316857 ?auto_316860 ) ) ( not ( = ?auto_316857 ?auto_316861 ) ) ( not ( = ?auto_316858 ?auto_316859 ) ) ( not ( = ?auto_316858 ?auto_316860 ) ) ( not ( = ?auto_316858 ?auto_316861 ) ) ( not ( = ?auto_316859 ?auto_316860 ) ) ( not ( = ?auto_316859 ?auto_316861 ) ) ( not ( = ?auto_316860 ?auto_316861 ) ) ( ON ?auto_316859 ?auto_316860 ) ( ON ?auto_316858 ?auto_316859 ) ( ON ?auto_316857 ?auto_316858 ) ( ON ?auto_316856 ?auto_316857 ) ( ON ?auto_316855 ?auto_316856 ) ( ON ?auto_316854 ?auto_316855 ) ( ON ?auto_316853 ?auto_316854 ) ( ON ?auto_316852 ?auto_316853 ) ( ON ?auto_316851 ?auto_316852 ) ( ON ?auto_316850 ?auto_316851 ) ( CLEAR ?auto_316848 ) ( ON ?auto_316849 ?auto_316850 ) ( CLEAR ?auto_316849 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_316848 ?auto_316849 )
      ( MAKE-13PILE ?auto_316848 ?auto_316849 ?auto_316850 ?auto_316851 ?auto_316852 ?auto_316853 ?auto_316854 ?auto_316855 ?auto_316856 ?auto_316857 ?auto_316858 ?auto_316859 ?auto_316860 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_316875 - BLOCK
      ?auto_316876 - BLOCK
      ?auto_316877 - BLOCK
      ?auto_316878 - BLOCK
      ?auto_316879 - BLOCK
      ?auto_316880 - BLOCK
      ?auto_316881 - BLOCK
      ?auto_316882 - BLOCK
      ?auto_316883 - BLOCK
      ?auto_316884 - BLOCK
      ?auto_316885 - BLOCK
      ?auto_316886 - BLOCK
      ?auto_316887 - BLOCK
    )
    :vars
    (
      ?auto_316888 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_316887 ?auto_316888 ) ( ON-TABLE ?auto_316875 ) ( not ( = ?auto_316875 ?auto_316876 ) ) ( not ( = ?auto_316875 ?auto_316877 ) ) ( not ( = ?auto_316875 ?auto_316878 ) ) ( not ( = ?auto_316875 ?auto_316879 ) ) ( not ( = ?auto_316875 ?auto_316880 ) ) ( not ( = ?auto_316875 ?auto_316881 ) ) ( not ( = ?auto_316875 ?auto_316882 ) ) ( not ( = ?auto_316875 ?auto_316883 ) ) ( not ( = ?auto_316875 ?auto_316884 ) ) ( not ( = ?auto_316875 ?auto_316885 ) ) ( not ( = ?auto_316875 ?auto_316886 ) ) ( not ( = ?auto_316875 ?auto_316887 ) ) ( not ( = ?auto_316875 ?auto_316888 ) ) ( not ( = ?auto_316876 ?auto_316877 ) ) ( not ( = ?auto_316876 ?auto_316878 ) ) ( not ( = ?auto_316876 ?auto_316879 ) ) ( not ( = ?auto_316876 ?auto_316880 ) ) ( not ( = ?auto_316876 ?auto_316881 ) ) ( not ( = ?auto_316876 ?auto_316882 ) ) ( not ( = ?auto_316876 ?auto_316883 ) ) ( not ( = ?auto_316876 ?auto_316884 ) ) ( not ( = ?auto_316876 ?auto_316885 ) ) ( not ( = ?auto_316876 ?auto_316886 ) ) ( not ( = ?auto_316876 ?auto_316887 ) ) ( not ( = ?auto_316876 ?auto_316888 ) ) ( not ( = ?auto_316877 ?auto_316878 ) ) ( not ( = ?auto_316877 ?auto_316879 ) ) ( not ( = ?auto_316877 ?auto_316880 ) ) ( not ( = ?auto_316877 ?auto_316881 ) ) ( not ( = ?auto_316877 ?auto_316882 ) ) ( not ( = ?auto_316877 ?auto_316883 ) ) ( not ( = ?auto_316877 ?auto_316884 ) ) ( not ( = ?auto_316877 ?auto_316885 ) ) ( not ( = ?auto_316877 ?auto_316886 ) ) ( not ( = ?auto_316877 ?auto_316887 ) ) ( not ( = ?auto_316877 ?auto_316888 ) ) ( not ( = ?auto_316878 ?auto_316879 ) ) ( not ( = ?auto_316878 ?auto_316880 ) ) ( not ( = ?auto_316878 ?auto_316881 ) ) ( not ( = ?auto_316878 ?auto_316882 ) ) ( not ( = ?auto_316878 ?auto_316883 ) ) ( not ( = ?auto_316878 ?auto_316884 ) ) ( not ( = ?auto_316878 ?auto_316885 ) ) ( not ( = ?auto_316878 ?auto_316886 ) ) ( not ( = ?auto_316878 ?auto_316887 ) ) ( not ( = ?auto_316878 ?auto_316888 ) ) ( not ( = ?auto_316879 ?auto_316880 ) ) ( not ( = ?auto_316879 ?auto_316881 ) ) ( not ( = ?auto_316879 ?auto_316882 ) ) ( not ( = ?auto_316879 ?auto_316883 ) ) ( not ( = ?auto_316879 ?auto_316884 ) ) ( not ( = ?auto_316879 ?auto_316885 ) ) ( not ( = ?auto_316879 ?auto_316886 ) ) ( not ( = ?auto_316879 ?auto_316887 ) ) ( not ( = ?auto_316879 ?auto_316888 ) ) ( not ( = ?auto_316880 ?auto_316881 ) ) ( not ( = ?auto_316880 ?auto_316882 ) ) ( not ( = ?auto_316880 ?auto_316883 ) ) ( not ( = ?auto_316880 ?auto_316884 ) ) ( not ( = ?auto_316880 ?auto_316885 ) ) ( not ( = ?auto_316880 ?auto_316886 ) ) ( not ( = ?auto_316880 ?auto_316887 ) ) ( not ( = ?auto_316880 ?auto_316888 ) ) ( not ( = ?auto_316881 ?auto_316882 ) ) ( not ( = ?auto_316881 ?auto_316883 ) ) ( not ( = ?auto_316881 ?auto_316884 ) ) ( not ( = ?auto_316881 ?auto_316885 ) ) ( not ( = ?auto_316881 ?auto_316886 ) ) ( not ( = ?auto_316881 ?auto_316887 ) ) ( not ( = ?auto_316881 ?auto_316888 ) ) ( not ( = ?auto_316882 ?auto_316883 ) ) ( not ( = ?auto_316882 ?auto_316884 ) ) ( not ( = ?auto_316882 ?auto_316885 ) ) ( not ( = ?auto_316882 ?auto_316886 ) ) ( not ( = ?auto_316882 ?auto_316887 ) ) ( not ( = ?auto_316882 ?auto_316888 ) ) ( not ( = ?auto_316883 ?auto_316884 ) ) ( not ( = ?auto_316883 ?auto_316885 ) ) ( not ( = ?auto_316883 ?auto_316886 ) ) ( not ( = ?auto_316883 ?auto_316887 ) ) ( not ( = ?auto_316883 ?auto_316888 ) ) ( not ( = ?auto_316884 ?auto_316885 ) ) ( not ( = ?auto_316884 ?auto_316886 ) ) ( not ( = ?auto_316884 ?auto_316887 ) ) ( not ( = ?auto_316884 ?auto_316888 ) ) ( not ( = ?auto_316885 ?auto_316886 ) ) ( not ( = ?auto_316885 ?auto_316887 ) ) ( not ( = ?auto_316885 ?auto_316888 ) ) ( not ( = ?auto_316886 ?auto_316887 ) ) ( not ( = ?auto_316886 ?auto_316888 ) ) ( not ( = ?auto_316887 ?auto_316888 ) ) ( ON ?auto_316886 ?auto_316887 ) ( ON ?auto_316885 ?auto_316886 ) ( ON ?auto_316884 ?auto_316885 ) ( ON ?auto_316883 ?auto_316884 ) ( ON ?auto_316882 ?auto_316883 ) ( ON ?auto_316881 ?auto_316882 ) ( ON ?auto_316880 ?auto_316881 ) ( ON ?auto_316879 ?auto_316880 ) ( ON ?auto_316878 ?auto_316879 ) ( ON ?auto_316877 ?auto_316878 ) ( CLEAR ?auto_316875 ) ( ON ?auto_316876 ?auto_316877 ) ( CLEAR ?auto_316876 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_316875 ?auto_316876 )
      ( MAKE-13PILE ?auto_316875 ?auto_316876 ?auto_316877 ?auto_316878 ?auto_316879 ?auto_316880 ?auto_316881 ?auto_316882 ?auto_316883 ?auto_316884 ?auto_316885 ?auto_316886 ?auto_316887 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_316902 - BLOCK
      ?auto_316903 - BLOCK
      ?auto_316904 - BLOCK
      ?auto_316905 - BLOCK
      ?auto_316906 - BLOCK
      ?auto_316907 - BLOCK
      ?auto_316908 - BLOCK
      ?auto_316909 - BLOCK
      ?auto_316910 - BLOCK
      ?auto_316911 - BLOCK
      ?auto_316912 - BLOCK
      ?auto_316913 - BLOCK
      ?auto_316914 - BLOCK
    )
    :vars
    (
      ?auto_316915 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_316914 ?auto_316915 ) ( not ( = ?auto_316902 ?auto_316903 ) ) ( not ( = ?auto_316902 ?auto_316904 ) ) ( not ( = ?auto_316902 ?auto_316905 ) ) ( not ( = ?auto_316902 ?auto_316906 ) ) ( not ( = ?auto_316902 ?auto_316907 ) ) ( not ( = ?auto_316902 ?auto_316908 ) ) ( not ( = ?auto_316902 ?auto_316909 ) ) ( not ( = ?auto_316902 ?auto_316910 ) ) ( not ( = ?auto_316902 ?auto_316911 ) ) ( not ( = ?auto_316902 ?auto_316912 ) ) ( not ( = ?auto_316902 ?auto_316913 ) ) ( not ( = ?auto_316902 ?auto_316914 ) ) ( not ( = ?auto_316902 ?auto_316915 ) ) ( not ( = ?auto_316903 ?auto_316904 ) ) ( not ( = ?auto_316903 ?auto_316905 ) ) ( not ( = ?auto_316903 ?auto_316906 ) ) ( not ( = ?auto_316903 ?auto_316907 ) ) ( not ( = ?auto_316903 ?auto_316908 ) ) ( not ( = ?auto_316903 ?auto_316909 ) ) ( not ( = ?auto_316903 ?auto_316910 ) ) ( not ( = ?auto_316903 ?auto_316911 ) ) ( not ( = ?auto_316903 ?auto_316912 ) ) ( not ( = ?auto_316903 ?auto_316913 ) ) ( not ( = ?auto_316903 ?auto_316914 ) ) ( not ( = ?auto_316903 ?auto_316915 ) ) ( not ( = ?auto_316904 ?auto_316905 ) ) ( not ( = ?auto_316904 ?auto_316906 ) ) ( not ( = ?auto_316904 ?auto_316907 ) ) ( not ( = ?auto_316904 ?auto_316908 ) ) ( not ( = ?auto_316904 ?auto_316909 ) ) ( not ( = ?auto_316904 ?auto_316910 ) ) ( not ( = ?auto_316904 ?auto_316911 ) ) ( not ( = ?auto_316904 ?auto_316912 ) ) ( not ( = ?auto_316904 ?auto_316913 ) ) ( not ( = ?auto_316904 ?auto_316914 ) ) ( not ( = ?auto_316904 ?auto_316915 ) ) ( not ( = ?auto_316905 ?auto_316906 ) ) ( not ( = ?auto_316905 ?auto_316907 ) ) ( not ( = ?auto_316905 ?auto_316908 ) ) ( not ( = ?auto_316905 ?auto_316909 ) ) ( not ( = ?auto_316905 ?auto_316910 ) ) ( not ( = ?auto_316905 ?auto_316911 ) ) ( not ( = ?auto_316905 ?auto_316912 ) ) ( not ( = ?auto_316905 ?auto_316913 ) ) ( not ( = ?auto_316905 ?auto_316914 ) ) ( not ( = ?auto_316905 ?auto_316915 ) ) ( not ( = ?auto_316906 ?auto_316907 ) ) ( not ( = ?auto_316906 ?auto_316908 ) ) ( not ( = ?auto_316906 ?auto_316909 ) ) ( not ( = ?auto_316906 ?auto_316910 ) ) ( not ( = ?auto_316906 ?auto_316911 ) ) ( not ( = ?auto_316906 ?auto_316912 ) ) ( not ( = ?auto_316906 ?auto_316913 ) ) ( not ( = ?auto_316906 ?auto_316914 ) ) ( not ( = ?auto_316906 ?auto_316915 ) ) ( not ( = ?auto_316907 ?auto_316908 ) ) ( not ( = ?auto_316907 ?auto_316909 ) ) ( not ( = ?auto_316907 ?auto_316910 ) ) ( not ( = ?auto_316907 ?auto_316911 ) ) ( not ( = ?auto_316907 ?auto_316912 ) ) ( not ( = ?auto_316907 ?auto_316913 ) ) ( not ( = ?auto_316907 ?auto_316914 ) ) ( not ( = ?auto_316907 ?auto_316915 ) ) ( not ( = ?auto_316908 ?auto_316909 ) ) ( not ( = ?auto_316908 ?auto_316910 ) ) ( not ( = ?auto_316908 ?auto_316911 ) ) ( not ( = ?auto_316908 ?auto_316912 ) ) ( not ( = ?auto_316908 ?auto_316913 ) ) ( not ( = ?auto_316908 ?auto_316914 ) ) ( not ( = ?auto_316908 ?auto_316915 ) ) ( not ( = ?auto_316909 ?auto_316910 ) ) ( not ( = ?auto_316909 ?auto_316911 ) ) ( not ( = ?auto_316909 ?auto_316912 ) ) ( not ( = ?auto_316909 ?auto_316913 ) ) ( not ( = ?auto_316909 ?auto_316914 ) ) ( not ( = ?auto_316909 ?auto_316915 ) ) ( not ( = ?auto_316910 ?auto_316911 ) ) ( not ( = ?auto_316910 ?auto_316912 ) ) ( not ( = ?auto_316910 ?auto_316913 ) ) ( not ( = ?auto_316910 ?auto_316914 ) ) ( not ( = ?auto_316910 ?auto_316915 ) ) ( not ( = ?auto_316911 ?auto_316912 ) ) ( not ( = ?auto_316911 ?auto_316913 ) ) ( not ( = ?auto_316911 ?auto_316914 ) ) ( not ( = ?auto_316911 ?auto_316915 ) ) ( not ( = ?auto_316912 ?auto_316913 ) ) ( not ( = ?auto_316912 ?auto_316914 ) ) ( not ( = ?auto_316912 ?auto_316915 ) ) ( not ( = ?auto_316913 ?auto_316914 ) ) ( not ( = ?auto_316913 ?auto_316915 ) ) ( not ( = ?auto_316914 ?auto_316915 ) ) ( ON ?auto_316913 ?auto_316914 ) ( ON ?auto_316912 ?auto_316913 ) ( ON ?auto_316911 ?auto_316912 ) ( ON ?auto_316910 ?auto_316911 ) ( ON ?auto_316909 ?auto_316910 ) ( ON ?auto_316908 ?auto_316909 ) ( ON ?auto_316907 ?auto_316908 ) ( ON ?auto_316906 ?auto_316907 ) ( ON ?auto_316905 ?auto_316906 ) ( ON ?auto_316904 ?auto_316905 ) ( ON ?auto_316903 ?auto_316904 ) ( ON ?auto_316902 ?auto_316903 ) ( CLEAR ?auto_316902 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_316902 )
      ( MAKE-13PILE ?auto_316902 ?auto_316903 ?auto_316904 ?auto_316905 ?auto_316906 ?auto_316907 ?auto_316908 ?auto_316909 ?auto_316910 ?auto_316911 ?auto_316912 ?auto_316913 ?auto_316914 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_316929 - BLOCK
      ?auto_316930 - BLOCK
      ?auto_316931 - BLOCK
      ?auto_316932 - BLOCK
      ?auto_316933 - BLOCK
      ?auto_316934 - BLOCK
      ?auto_316935 - BLOCK
      ?auto_316936 - BLOCK
      ?auto_316937 - BLOCK
      ?auto_316938 - BLOCK
      ?auto_316939 - BLOCK
      ?auto_316940 - BLOCK
      ?auto_316941 - BLOCK
    )
    :vars
    (
      ?auto_316942 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_316941 ?auto_316942 ) ( not ( = ?auto_316929 ?auto_316930 ) ) ( not ( = ?auto_316929 ?auto_316931 ) ) ( not ( = ?auto_316929 ?auto_316932 ) ) ( not ( = ?auto_316929 ?auto_316933 ) ) ( not ( = ?auto_316929 ?auto_316934 ) ) ( not ( = ?auto_316929 ?auto_316935 ) ) ( not ( = ?auto_316929 ?auto_316936 ) ) ( not ( = ?auto_316929 ?auto_316937 ) ) ( not ( = ?auto_316929 ?auto_316938 ) ) ( not ( = ?auto_316929 ?auto_316939 ) ) ( not ( = ?auto_316929 ?auto_316940 ) ) ( not ( = ?auto_316929 ?auto_316941 ) ) ( not ( = ?auto_316929 ?auto_316942 ) ) ( not ( = ?auto_316930 ?auto_316931 ) ) ( not ( = ?auto_316930 ?auto_316932 ) ) ( not ( = ?auto_316930 ?auto_316933 ) ) ( not ( = ?auto_316930 ?auto_316934 ) ) ( not ( = ?auto_316930 ?auto_316935 ) ) ( not ( = ?auto_316930 ?auto_316936 ) ) ( not ( = ?auto_316930 ?auto_316937 ) ) ( not ( = ?auto_316930 ?auto_316938 ) ) ( not ( = ?auto_316930 ?auto_316939 ) ) ( not ( = ?auto_316930 ?auto_316940 ) ) ( not ( = ?auto_316930 ?auto_316941 ) ) ( not ( = ?auto_316930 ?auto_316942 ) ) ( not ( = ?auto_316931 ?auto_316932 ) ) ( not ( = ?auto_316931 ?auto_316933 ) ) ( not ( = ?auto_316931 ?auto_316934 ) ) ( not ( = ?auto_316931 ?auto_316935 ) ) ( not ( = ?auto_316931 ?auto_316936 ) ) ( not ( = ?auto_316931 ?auto_316937 ) ) ( not ( = ?auto_316931 ?auto_316938 ) ) ( not ( = ?auto_316931 ?auto_316939 ) ) ( not ( = ?auto_316931 ?auto_316940 ) ) ( not ( = ?auto_316931 ?auto_316941 ) ) ( not ( = ?auto_316931 ?auto_316942 ) ) ( not ( = ?auto_316932 ?auto_316933 ) ) ( not ( = ?auto_316932 ?auto_316934 ) ) ( not ( = ?auto_316932 ?auto_316935 ) ) ( not ( = ?auto_316932 ?auto_316936 ) ) ( not ( = ?auto_316932 ?auto_316937 ) ) ( not ( = ?auto_316932 ?auto_316938 ) ) ( not ( = ?auto_316932 ?auto_316939 ) ) ( not ( = ?auto_316932 ?auto_316940 ) ) ( not ( = ?auto_316932 ?auto_316941 ) ) ( not ( = ?auto_316932 ?auto_316942 ) ) ( not ( = ?auto_316933 ?auto_316934 ) ) ( not ( = ?auto_316933 ?auto_316935 ) ) ( not ( = ?auto_316933 ?auto_316936 ) ) ( not ( = ?auto_316933 ?auto_316937 ) ) ( not ( = ?auto_316933 ?auto_316938 ) ) ( not ( = ?auto_316933 ?auto_316939 ) ) ( not ( = ?auto_316933 ?auto_316940 ) ) ( not ( = ?auto_316933 ?auto_316941 ) ) ( not ( = ?auto_316933 ?auto_316942 ) ) ( not ( = ?auto_316934 ?auto_316935 ) ) ( not ( = ?auto_316934 ?auto_316936 ) ) ( not ( = ?auto_316934 ?auto_316937 ) ) ( not ( = ?auto_316934 ?auto_316938 ) ) ( not ( = ?auto_316934 ?auto_316939 ) ) ( not ( = ?auto_316934 ?auto_316940 ) ) ( not ( = ?auto_316934 ?auto_316941 ) ) ( not ( = ?auto_316934 ?auto_316942 ) ) ( not ( = ?auto_316935 ?auto_316936 ) ) ( not ( = ?auto_316935 ?auto_316937 ) ) ( not ( = ?auto_316935 ?auto_316938 ) ) ( not ( = ?auto_316935 ?auto_316939 ) ) ( not ( = ?auto_316935 ?auto_316940 ) ) ( not ( = ?auto_316935 ?auto_316941 ) ) ( not ( = ?auto_316935 ?auto_316942 ) ) ( not ( = ?auto_316936 ?auto_316937 ) ) ( not ( = ?auto_316936 ?auto_316938 ) ) ( not ( = ?auto_316936 ?auto_316939 ) ) ( not ( = ?auto_316936 ?auto_316940 ) ) ( not ( = ?auto_316936 ?auto_316941 ) ) ( not ( = ?auto_316936 ?auto_316942 ) ) ( not ( = ?auto_316937 ?auto_316938 ) ) ( not ( = ?auto_316937 ?auto_316939 ) ) ( not ( = ?auto_316937 ?auto_316940 ) ) ( not ( = ?auto_316937 ?auto_316941 ) ) ( not ( = ?auto_316937 ?auto_316942 ) ) ( not ( = ?auto_316938 ?auto_316939 ) ) ( not ( = ?auto_316938 ?auto_316940 ) ) ( not ( = ?auto_316938 ?auto_316941 ) ) ( not ( = ?auto_316938 ?auto_316942 ) ) ( not ( = ?auto_316939 ?auto_316940 ) ) ( not ( = ?auto_316939 ?auto_316941 ) ) ( not ( = ?auto_316939 ?auto_316942 ) ) ( not ( = ?auto_316940 ?auto_316941 ) ) ( not ( = ?auto_316940 ?auto_316942 ) ) ( not ( = ?auto_316941 ?auto_316942 ) ) ( ON ?auto_316940 ?auto_316941 ) ( ON ?auto_316939 ?auto_316940 ) ( ON ?auto_316938 ?auto_316939 ) ( ON ?auto_316937 ?auto_316938 ) ( ON ?auto_316936 ?auto_316937 ) ( ON ?auto_316935 ?auto_316936 ) ( ON ?auto_316934 ?auto_316935 ) ( ON ?auto_316933 ?auto_316934 ) ( ON ?auto_316932 ?auto_316933 ) ( ON ?auto_316931 ?auto_316932 ) ( ON ?auto_316930 ?auto_316931 ) ( ON ?auto_316929 ?auto_316930 ) ( CLEAR ?auto_316929 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_316929 )
      ( MAKE-13PILE ?auto_316929 ?auto_316930 ?auto_316931 ?auto_316932 ?auto_316933 ?auto_316934 ?auto_316935 ?auto_316936 ?auto_316937 ?auto_316938 ?auto_316939 ?auto_316940 ?auto_316941 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_316957 - BLOCK
      ?auto_316958 - BLOCK
      ?auto_316959 - BLOCK
      ?auto_316960 - BLOCK
      ?auto_316961 - BLOCK
      ?auto_316962 - BLOCK
      ?auto_316963 - BLOCK
      ?auto_316964 - BLOCK
      ?auto_316965 - BLOCK
      ?auto_316966 - BLOCK
      ?auto_316967 - BLOCK
      ?auto_316968 - BLOCK
      ?auto_316969 - BLOCK
      ?auto_316970 - BLOCK
    )
    :vars
    (
      ?auto_316971 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_316969 ) ( ON ?auto_316970 ?auto_316971 ) ( CLEAR ?auto_316970 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_316957 ) ( ON ?auto_316958 ?auto_316957 ) ( ON ?auto_316959 ?auto_316958 ) ( ON ?auto_316960 ?auto_316959 ) ( ON ?auto_316961 ?auto_316960 ) ( ON ?auto_316962 ?auto_316961 ) ( ON ?auto_316963 ?auto_316962 ) ( ON ?auto_316964 ?auto_316963 ) ( ON ?auto_316965 ?auto_316964 ) ( ON ?auto_316966 ?auto_316965 ) ( ON ?auto_316967 ?auto_316966 ) ( ON ?auto_316968 ?auto_316967 ) ( ON ?auto_316969 ?auto_316968 ) ( not ( = ?auto_316957 ?auto_316958 ) ) ( not ( = ?auto_316957 ?auto_316959 ) ) ( not ( = ?auto_316957 ?auto_316960 ) ) ( not ( = ?auto_316957 ?auto_316961 ) ) ( not ( = ?auto_316957 ?auto_316962 ) ) ( not ( = ?auto_316957 ?auto_316963 ) ) ( not ( = ?auto_316957 ?auto_316964 ) ) ( not ( = ?auto_316957 ?auto_316965 ) ) ( not ( = ?auto_316957 ?auto_316966 ) ) ( not ( = ?auto_316957 ?auto_316967 ) ) ( not ( = ?auto_316957 ?auto_316968 ) ) ( not ( = ?auto_316957 ?auto_316969 ) ) ( not ( = ?auto_316957 ?auto_316970 ) ) ( not ( = ?auto_316957 ?auto_316971 ) ) ( not ( = ?auto_316958 ?auto_316959 ) ) ( not ( = ?auto_316958 ?auto_316960 ) ) ( not ( = ?auto_316958 ?auto_316961 ) ) ( not ( = ?auto_316958 ?auto_316962 ) ) ( not ( = ?auto_316958 ?auto_316963 ) ) ( not ( = ?auto_316958 ?auto_316964 ) ) ( not ( = ?auto_316958 ?auto_316965 ) ) ( not ( = ?auto_316958 ?auto_316966 ) ) ( not ( = ?auto_316958 ?auto_316967 ) ) ( not ( = ?auto_316958 ?auto_316968 ) ) ( not ( = ?auto_316958 ?auto_316969 ) ) ( not ( = ?auto_316958 ?auto_316970 ) ) ( not ( = ?auto_316958 ?auto_316971 ) ) ( not ( = ?auto_316959 ?auto_316960 ) ) ( not ( = ?auto_316959 ?auto_316961 ) ) ( not ( = ?auto_316959 ?auto_316962 ) ) ( not ( = ?auto_316959 ?auto_316963 ) ) ( not ( = ?auto_316959 ?auto_316964 ) ) ( not ( = ?auto_316959 ?auto_316965 ) ) ( not ( = ?auto_316959 ?auto_316966 ) ) ( not ( = ?auto_316959 ?auto_316967 ) ) ( not ( = ?auto_316959 ?auto_316968 ) ) ( not ( = ?auto_316959 ?auto_316969 ) ) ( not ( = ?auto_316959 ?auto_316970 ) ) ( not ( = ?auto_316959 ?auto_316971 ) ) ( not ( = ?auto_316960 ?auto_316961 ) ) ( not ( = ?auto_316960 ?auto_316962 ) ) ( not ( = ?auto_316960 ?auto_316963 ) ) ( not ( = ?auto_316960 ?auto_316964 ) ) ( not ( = ?auto_316960 ?auto_316965 ) ) ( not ( = ?auto_316960 ?auto_316966 ) ) ( not ( = ?auto_316960 ?auto_316967 ) ) ( not ( = ?auto_316960 ?auto_316968 ) ) ( not ( = ?auto_316960 ?auto_316969 ) ) ( not ( = ?auto_316960 ?auto_316970 ) ) ( not ( = ?auto_316960 ?auto_316971 ) ) ( not ( = ?auto_316961 ?auto_316962 ) ) ( not ( = ?auto_316961 ?auto_316963 ) ) ( not ( = ?auto_316961 ?auto_316964 ) ) ( not ( = ?auto_316961 ?auto_316965 ) ) ( not ( = ?auto_316961 ?auto_316966 ) ) ( not ( = ?auto_316961 ?auto_316967 ) ) ( not ( = ?auto_316961 ?auto_316968 ) ) ( not ( = ?auto_316961 ?auto_316969 ) ) ( not ( = ?auto_316961 ?auto_316970 ) ) ( not ( = ?auto_316961 ?auto_316971 ) ) ( not ( = ?auto_316962 ?auto_316963 ) ) ( not ( = ?auto_316962 ?auto_316964 ) ) ( not ( = ?auto_316962 ?auto_316965 ) ) ( not ( = ?auto_316962 ?auto_316966 ) ) ( not ( = ?auto_316962 ?auto_316967 ) ) ( not ( = ?auto_316962 ?auto_316968 ) ) ( not ( = ?auto_316962 ?auto_316969 ) ) ( not ( = ?auto_316962 ?auto_316970 ) ) ( not ( = ?auto_316962 ?auto_316971 ) ) ( not ( = ?auto_316963 ?auto_316964 ) ) ( not ( = ?auto_316963 ?auto_316965 ) ) ( not ( = ?auto_316963 ?auto_316966 ) ) ( not ( = ?auto_316963 ?auto_316967 ) ) ( not ( = ?auto_316963 ?auto_316968 ) ) ( not ( = ?auto_316963 ?auto_316969 ) ) ( not ( = ?auto_316963 ?auto_316970 ) ) ( not ( = ?auto_316963 ?auto_316971 ) ) ( not ( = ?auto_316964 ?auto_316965 ) ) ( not ( = ?auto_316964 ?auto_316966 ) ) ( not ( = ?auto_316964 ?auto_316967 ) ) ( not ( = ?auto_316964 ?auto_316968 ) ) ( not ( = ?auto_316964 ?auto_316969 ) ) ( not ( = ?auto_316964 ?auto_316970 ) ) ( not ( = ?auto_316964 ?auto_316971 ) ) ( not ( = ?auto_316965 ?auto_316966 ) ) ( not ( = ?auto_316965 ?auto_316967 ) ) ( not ( = ?auto_316965 ?auto_316968 ) ) ( not ( = ?auto_316965 ?auto_316969 ) ) ( not ( = ?auto_316965 ?auto_316970 ) ) ( not ( = ?auto_316965 ?auto_316971 ) ) ( not ( = ?auto_316966 ?auto_316967 ) ) ( not ( = ?auto_316966 ?auto_316968 ) ) ( not ( = ?auto_316966 ?auto_316969 ) ) ( not ( = ?auto_316966 ?auto_316970 ) ) ( not ( = ?auto_316966 ?auto_316971 ) ) ( not ( = ?auto_316967 ?auto_316968 ) ) ( not ( = ?auto_316967 ?auto_316969 ) ) ( not ( = ?auto_316967 ?auto_316970 ) ) ( not ( = ?auto_316967 ?auto_316971 ) ) ( not ( = ?auto_316968 ?auto_316969 ) ) ( not ( = ?auto_316968 ?auto_316970 ) ) ( not ( = ?auto_316968 ?auto_316971 ) ) ( not ( = ?auto_316969 ?auto_316970 ) ) ( not ( = ?auto_316969 ?auto_316971 ) ) ( not ( = ?auto_316970 ?auto_316971 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_316970 ?auto_316971 )
      ( !STACK ?auto_316970 ?auto_316969 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_316986 - BLOCK
      ?auto_316987 - BLOCK
      ?auto_316988 - BLOCK
      ?auto_316989 - BLOCK
      ?auto_316990 - BLOCK
      ?auto_316991 - BLOCK
      ?auto_316992 - BLOCK
      ?auto_316993 - BLOCK
      ?auto_316994 - BLOCK
      ?auto_316995 - BLOCK
      ?auto_316996 - BLOCK
      ?auto_316997 - BLOCK
      ?auto_316998 - BLOCK
      ?auto_316999 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_316998 ) ( ON-TABLE ?auto_316999 ) ( CLEAR ?auto_316999 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_316986 ) ( ON ?auto_316987 ?auto_316986 ) ( ON ?auto_316988 ?auto_316987 ) ( ON ?auto_316989 ?auto_316988 ) ( ON ?auto_316990 ?auto_316989 ) ( ON ?auto_316991 ?auto_316990 ) ( ON ?auto_316992 ?auto_316991 ) ( ON ?auto_316993 ?auto_316992 ) ( ON ?auto_316994 ?auto_316993 ) ( ON ?auto_316995 ?auto_316994 ) ( ON ?auto_316996 ?auto_316995 ) ( ON ?auto_316997 ?auto_316996 ) ( ON ?auto_316998 ?auto_316997 ) ( not ( = ?auto_316986 ?auto_316987 ) ) ( not ( = ?auto_316986 ?auto_316988 ) ) ( not ( = ?auto_316986 ?auto_316989 ) ) ( not ( = ?auto_316986 ?auto_316990 ) ) ( not ( = ?auto_316986 ?auto_316991 ) ) ( not ( = ?auto_316986 ?auto_316992 ) ) ( not ( = ?auto_316986 ?auto_316993 ) ) ( not ( = ?auto_316986 ?auto_316994 ) ) ( not ( = ?auto_316986 ?auto_316995 ) ) ( not ( = ?auto_316986 ?auto_316996 ) ) ( not ( = ?auto_316986 ?auto_316997 ) ) ( not ( = ?auto_316986 ?auto_316998 ) ) ( not ( = ?auto_316986 ?auto_316999 ) ) ( not ( = ?auto_316987 ?auto_316988 ) ) ( not ( = ?auto_316987 ?auto_316989 ) ) ( not ( = ?auto_316987 ?auto_316990 ) ) ( not ( = ?auto_316987 ?auto_316991 ) ) ( not ( = ?auto_316987 ?auto_316992 ) ) ( not ( = ?auto_316987 ?auto_316993 ) ) ( not ( = ?auto_316987 ?auto_316994 ) ) ( not ( = ?auto_316987 ?auto_316995 ) ) ( not ( = ?auto_316987 ?auto_316996 ) ) ( not ( = ?auto_316987 ?auto_316997 ) ) ( not ( = ?auto_316987 ?auto_316998 ) ) ( not ( = ?auto_316987 ?auto_316999 ) ) ( not ( = ?auto_316988 ?auto_316989 ) ) ( not ( = ?auto_316988 ?auto_316990 ) ) ( not ( = ?auto_316988 ?auto_316991 ) ) ( not ( = ?auto_316988 ?auto_316992 ) ) ( not ( = ?auto_316988 ?auto_316993 ) ) ( not ( = ?auto_316988 ?auto_316994 ) ) ( not ( = ?auto_316988 ?auto_316995 ) ) ( not ( = ?auto_316988 ?auto_316996 ) ) ( not ( = ?auto_316988 ?auto_316997 ) ) ( not ( = ?auto_316988 ?auto_316998 ) ) ( not ( = ?auto_316988 ?auto_316999 ) ) ( not ( = ?auto_316989 ?auto_316990 ) ) ( not ( = ?auto_316989 ?auto_316991 ) ) ( not ( = ?auto_316989 ?auto_316992 ) ) ( not ( = ?auto_316989 ?auto_316993 ) ) ( not ( = ?auto_316989 ?auto_316994 ) ) ( not ( = ?auto_316989 ?auto_316995 ) ) ( not ( = ?auto_316989 ?auto_316996 ) ) ( not ( = ?auto_316989 ?auto_316997 ) ) ( not ( = ?auto_316989 ?auto_316998 ) ) ( not ( = ?auto_316989 ?auto_316999 ) ) ( not ( = ?auto_316990 ?auto_316991 ) ) ( not ( = ?auto_316990 ?auto_316992 ) ) ( not ( = ?auto_316990 ?auto_316993 ) ) ( not ( = ?auto_316990 ?auto_316994 ) ) ( not ( = ?auto_316990 ?auto_316995 ) ) ( not ( = ?auto_316990 ?auto_316996 ) ) ( not ( = ?auto_316990 ?auto_316997 ) ) ( not ( = ?auto_316990 ?auto_316998 ) ) ( not ( = ?auto_316990 ?auto_316999 ) ) ( not ( = ?auto_316991 ?auto_316992 ) ) ( not ( = ?auto_316991 ?auto_316993 ) ) ( not ( = ?auto_316991 ?auto_316994 ) ) ( not ( = ?auto_316991 ?auto_316995 ) ) ( not ( = ?auto_316991 ?auto_316996 ) ) ( not ( = ?auto_316991 ?auto_316997 ) ) ( not ( = ?auto_316991 ?auto_316998 ) ) ( not ( = ?auto_316991 ?auto_316999 ) ) ( not ( = ?auto_316992 ?auto_316993 ) ) ( not ( = ?auto_316992 ?auto_316994 ) ) ( not ( = ?auto_316992 ?auto_316995 ) ) ( not ( = ?auto_316992 ?auto_316996 ) ) ( not ( = ?auto_316992 ?auto_316997 ) ) ( not ( = ?auto_316992 ?auto_316998 ) ) ( not ( = ?auto_316992 ?auto_316999 ) ) ( not ( = ?auto_316993 ?auto_316994 ) ) ( not ( = ?auto_316993 ?auto_316995 ) ) ( not ( = ?auto_316993 ?auto_316996 ) ) ( not ( = ?auto_316993 ?auto_316997 ) ) ( not ( = ?auto_316993 ?auto_316998 ) ) ( not ( = ?auto_316993 ?auto_316999 ) ) ( not ( = ?auto_316994 ?auto_316995 ) ) ( not ( = ?auto_316994 ?auto_316996 ) ) ( not ( = ?auto_316994 ?auto_316997 ) ) ( not ( = ?auto_316994 ?auto_316998 ) ) ( not ( = ?auto_316994 ?auto_316999 ) ) ( not ( = ?auto_316995 ?auto_316996 ) ) ( not ( = ?auto_316995 ?auto_316997 ) ) ( not ( = ?auto_316995 ?auto_316998 ) ) ( not ( = ?auto_316995 ?auto_316999 ) ) ( not ( = ?auto_316996 ?auto_316997 ) ) ( not ( = ?auto_316996 ?auto_316998 ) ) ( not ( = ?auto_316996 ?auto_316999 ) ) ( not ( = ?auto_316997 ?auto_316998 ) ) ( not ( = ?auto_316997 ?auto_316999 ) ) ( not ( = ?auto_316998 ?auto_316999 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_316999 )
      ( !STACK ?auto_316999 ?auto_316998 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_317014 - BLOCK
      ?auto_317015 - BLOCK
      ?auto_317016 - BLOCK
      ?auto_317017 - BLOCK
      ?auto_317018 - BLOCK
      ?auto_317019 - BLOCK
      ?auto_317020 - BLOCK
      ?auto_317021 - BLOCK
      ?auto_317022 - BLOCK
      ?auto_317023 - BLOCK
      ?auto_317024 - BLOCK
      ?auto_317025 - BLOCK
      ?auto_317026 - BLOCK
      ?auto_317027 - BLOCK
    )
    :vars
    (
      ?auto_317028 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_317027 ?auto_317028 ) ( ON-TABLE ?auto_317014 ) ( ON ?auto_317015 ?auto_317014 ) ( ON ?auto_317016 ?auto_317015 ) ( ON ?auto_317017 ?auto_317016 ) ( ON ?auto_317018 ?auto_317017 ) ( ON ?auto_317019 ?auto_317018 ) ( ON ?auto_317020 ?auto_317019 ) ( ON ?auto_317021 ?auto_317020 ) ( ON ?auto_317022 ?auto_317021 ) ( ON ?auto_317023 ?auto_317022 ) ( ON ?auto_317024 ?auto_317023 ) ( ON ?auto_317025 ?auto_317024 ) ( not ( = ?auto_317014 ?auto_317015 ) ) ( not ( = ?auto_317014 ?auto_317016 ) ) ( not ( = ?auto_317014 ?auto_317017 ) ) ( not ( = ?auto_317014 ?auto_317018 ) ) ( not ( = ?auto_317014 ?auto_317019 ) ) ( not ( = ?auto_317014 ?auto_317020 ) ) ( not ( = ?auto_317014 ?auto_317021 ) ) ( not ( = ?auto_317014 ?auto_317022 ) ) ( not ( = ?auto_317014 ?auto_317023 ) ) ( not ( = ?auto_317014 ?auto_317024 ) ) ( not ( = ?auto_317014 ?auto_317025 ) ) ( not ( = ?auto_317014 ?auto_317026 ) ) ( not ( = ?auto_317014 ?auto_317027 ) ) ( not ( = ?auto_317014 ?auto_317028 ) ) ( not ( = ?auto_317015 ?auto_317016 ) ) ( not ( = ?auto_317015 ?auto_317017 ) ) ( not ( = ?auto_317015 ?auto_317018 ) ) ( not ( = ?auto_317015 ?auto_317019 ) ) ( not ( = ?auto_317015 ?auto_317020 ) ) ( not ( = ?auto_317015 ?auto_317021 ) ) ( not ( = ?auto_317015 ?auto_317022 ) ) ( not ( = ?auto_317015 ?auto_317023 ) ) ( not ( = ?auto_317015 ?auto_317024 ) ) ( not ( = ?auto_317015 ?auto_317025 ) ) ( not ( = ?auto_317015 ?auto_317026 ) ) ( not ( = ?auto_317015 ?auto_317027 ) ) ( not ( = ?auto_317015 ?auto_317028 ) ) ( not ( = ?auto_317016 ?auto_317017 ) ) ( not ( = ?auto_317016 ?auto_317018 ) ) ( not ( = ?auto_317016 ?auto_317019 ) ) ( not ( = ?auto_317016 ?auto_317020 ) ) ( not ( = ?auto_317016 ?auto_317021 ) ) ( not ( = ?auto_317016 ?auto_317022 ) ) ( not ( = ?auto_317016 ?auto_317023 ) ) ( not ( = ?auto_317016 ?auto_317024 ) ) ( not ( = ?auto_317016 ?auto_317025 ) ) ( not ( = ?auto_317016 ?auto_317026 ) ) ( not ( = ?auto_317016 ?auto_317027 ) ) ( not ( = ?auto_317016 ?auto_317028 ) ) ( not ( = ?auto_317017 ?auto_317018 ) ) ( not ( = ?auto_317017 ?auto_317019 ) ) ( not ( = ?auto_317017 ?auto_317020 ) ) ( not ( = ?auto_317017 ?auto_317021 ) ) ( not ( = ?auto_317017 ?auto_317022 ) ) ( not ( = ?auto_317017 ?auto_317023 ) ) ( not ( = ?auto_317017 ?auto_317024 ) ) ( not ( = ?auto_317017 ?auto_317025 ) ) ( not ( = ?auto_317017 ?auto_317026 ) ) ( not ( = ?auto_317017 ?auto_317027 ) ) ( not ( = ?auto_317017 ?auto_317028 ) ) ( not ( = ?auto_317018 ?auto_317019 ) ) ( not ( = ?auto_317018 ?auto_317020 ) ) ( not ( = ?auto_317018 ?auto_317021 ) ) ( not ( = ?auto_317018 ?auto_317022 ) ) ( not ( = ?auto_317018 ?auto_317023 ) ) ( not ( = ?auto_317018 ?auto_317024 ) ) ( not ( = ?auto_317018 ?auto_317025 ) ) ( not ( = ?auto_317018 ?auto_317026 ) ) ( not ( = ?auto_317018 ?auto_317027 ) ) ( not ( = ?auto_317018 ?auto_317028 ) ) ( not ( = ?auto_317019 ?auto_317020 ) ) ( not ( = ?auto_317019 ?auto_317021 ) ) ( not ( = ?auto_317019 ?auto_317022 ) ) ( not ( = ?auto_317019 ?auto_317023 ) ) ( not ( = ?auto_317019 ?auto_317024 ) ) ( not ( = ?auto_317019 ?auto_317025 ) ) ( not ( = ?auto_317019 ?auto_317026 ) ) ( not ( = ?auto_317019 ?auto_317027 ) ) ( not ( = ?auto_317019 ?auto_317028 ) ) ( not ( = ?auto_317020 ?auto_317021 ) ) ( not ( = ?auto_317020 ?auto_317022 ) ) ( not ( = ?auto_317020 ?auto_317023 ) ) ( not ( = ?auto_317020 ?auto_317024 ) ) ( not ( = ?auto_317020 ?auto_317025 ) ) ( not ( = ?auto_317020 ?auto_317026 ) ) ( not ( = ?auto_317020 ?auto_317027 ) ) ( not ( = ?auto_317020 ?auto_317028 ) ) ( not ( = ?auto_317021 ?auto_317022 ) ) ( not ( = ?auto_317021 ?auto_317023 ) ) ( not ( = ?auto_317021 ?auto_317024 ) ) ( not ( = ?auto_317021 ?auto_317025 ) ) ( not ( = ?auto_317021 ?auto_317026 ) ) ( not ( = ?auto_317021 ?auto_317027 ) ) ( not ( = ?auto_317021 ?auto_317028 ) ) ( not ( = ?auto_317022 ?auto_317023 ) ) ( not ( = ?auto_317022 ?auto_317024 ) ) ( not ( = ?auto_317022 ?auto_317025 ) ) ( not ( = ?auto_317022 ?auto_317026 ) ) ( not ( = ?auto_317022 ?auto_317027 ) ) ( not ( = ?auto_317022 ?auto_317028 ) ) ( not ( = ?auto_317023 ?auto_317024 ) ) ( not ( = ?auto_317023 ?auto_317025 ) ) ( not ( = ?auto_317023 ?auto_317026 ) ) ( not ( = ?auto_317023 ?auto_317027 ) ) ( not ( = ?auto_317023 ?auto_317028 ) ) ( not ( = ?auto_317024 ?auto_317025 ) ) ( not ( = ?auto_317024 ?auto_317026 ) ) ( not ( = ?auto_317024 ?auto_317027 ) ) ( not ( = ?auto_317024 ?auto_317028 ) ) ( not ( = ?auto_317025 ?auto_317026 ) ) ( not ( = ?auto_317025 ?auto_317027 ) ) ( not ( = ?auto_317025 ?auto_317028 ) ) ( not ( = ?auto_317026 ?auto_317027 ) ) ( not ( = ?auto_317026 ?auto_317028 ) ) ( not ( = ?auto_317027 ?auto_317028 ) ) ( CLEAR ?auto_317025 ) ( ON ?auto_317026 ?auto_317027 ) ( CLEAR ?auto_317026 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_317014 ?auto_317015 ?auto_317016 ?auto_317017 ?auto_317018 ?auto_317019 ?auto_317020 ?auto_317021 ?auto_317022 ?auto_317023 ?auto_317024 ?auto_317025 ?auto_317026 )
      ( MAKE-14PILE ?auto_317014 ?auto_317015 ?auto_317016 ?auto_317017 ?auto_317018 ?auto_317019 ?auto_317020 ?auto_317021 ?auto_317022 ?auto_317023 ?auto_317024 ?auto_317025 ?auto_317026 ?auto_317027 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_317043 - BLOCK
      ?auto_317044 - BLOCK
      ?auto_317045 - BLOCK
      ?auto_317046 - BLOCK
      ?auto_317047 - BLOCK
      ?auto_317048 - BLOCK
      ?auto_317049 - BLOCK
      ?auto_317050 - BLOCK
      ?auto_317051 - BLOCK
      ?auto_317052 - BLOCK
      ?auto_317053 - BLOCK
      ?auto_317054 - BLOCK
      ?auto_317055 - BLOCK
      ?auto_317056 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_317056 ) ( ON-TABLE ?auto_317043 ) ( ON ?auto_317044 ?auto_317043 ) ( ON ?auto_317045 ?auto_317044 ) ( ON ?auto_317046 ?auto_317045 ) ( ON ?auto_317047 ?auto_317046 ) ( ON ?auto_317048 ?auto_317047 ) ( ON ?auto_317049 ?auto_317048 ) ( ON ?auto_317050 ?auto_317049 ) ( ON ?auto_317051 ?auto_317050 ) ( ON ?auto_317052 ?auto_317051 ) ( ON ?auto_317053 ?auto_317052 ) ( ON ?auto_317054 ?auto_317053 ) ( not ( = ?auto_317043 ?auto_317044 ) ) ( not ( = ?auto_317043 ?auto_317045 ) ) ( not ( = ?auto_317043 ?auto_317046 ) ) ( not ( = ?auto_317043 ?auto_317047 ) ) ( not ( = ?auto_317043 ?auto_317048 ) ) ( not ( = ?auto_317043 ?auto_317049 ) ) ( not ( = ?auto_317043 ?auto_317050 ) ) ( not ( = ?auto_317043 ?auto_317051 ) ) ( not ( = ?auto_317043 ?auto_317052 ) ) ( not ( = ?auto_317043 ?auto_317053 ) ) ( not ( = ?auto_317043 ?auto_317054 ) ) ( not ( = ?auto_317043 ?auto_317055 ) ) ( not ( = ?auto_317043 ?auto_317056 ) ) ( not ( = ?auto_317044 ?auto_317045 ) ) ( not ( = ?auto_317044 ?auto_317046 ) ) ( not ( = ?auto_317044 ?auto_317047 ) ) ( not ( = ?auto_317044 ?auto_317048 ) ) ( not ( = ?auto_317044 ?auto_317049 ) ) ( not ( = ?auto_317044 ?auto_317050 ) ) ( not ( = ?auto_317044 ?auto_317051 ) ) ( not ( = ?auto_317044 ?auto_317052 ) ) ( not ( = ?auto_317044 ?auto_317053 ) ) ( not ( = ?auto_317044 ?auto_317054 ) ) ( not ( = ?auto_317044 ?auto_317055 ) ) ( not ( = ?auto_317044 ?auto_317056 ) ) ( not ( = ?auto_317045 ?auto_317046 ) ) ( not ( = ?auto_317045 ?auto_317047 ) ) ( not ( = ?auto_317045 ?auto_317048 ) ) ( not ( = ?auto_317045 ?auto_317049 ) ) ( not ( = ?auto_317045 ?auto_317050 ) ) ( not ( = ?auto_317045 ?auto_317051 ) ) ( not ( = ?auto_317045 ?auto_317052 ) ) ( not ( = ?auto_317045 ?auto_317053 ) ) ( not ( = ?auto_317045 ?auto_317054 ) ) ( not ( = ?auto_317045 ?auto_317055 ) ) ( not ( = ?auto_317045 ?auto_317056 ) ) ( not ( = ?auto_317046 ?auto_317047 ) ) ( not ( = ?auto_317046 ?auto_317048 ) ) ( not ( = ?auto_317046 ?auto_317049 ) ) ( not ( = ?auto_317046 ?auto_317050 ) ) ( not ( = ?auto_317046 ?auto_317051 ) ) ( not ( = ?auto_317046 ?auto_317052 ) ) ( not ( = ?auto_317046 ?auto_317053 ) ) ( not ( = ?auto_317046 ?auto_317054 ) ) ( not ( = ?auto_317046 ?auto_317055 ) ) ( not ( = ?auto_317046 ?auto_317056 ) ) ( not ( = ?auto_317047 ?auto_317048 ) ) ( not ( = ?auto_317047 ?auto_317049 ) ) ( not ( = ?auto_317047 ?auto_317050 ) ) ( not ( = ?auto_317047 ?auto_317051 ) ) ( not ( = ?auto_317047 ?auto_317052 ) ) ( not ( = ?auto_317047 ?auto_317053 ) ) ( not ( = ?auto_317047 ?auto_317054 ) ) ( not ( = ?auto_317047 ?auto_317055 ) ) ( not ( = ?auto_317047 ?auto_317056 ) ) ( not ( = ?auto_317048 ?auto_317049 ) ) ( not ( = ?auto_317048 ?auto_317050 ) ) ( not ( = ?auto_317048 ?auto_317051 ) ) ( not ( = ?auto_317048 ?auto_317052 ) ) ( not ( = ?auto_317048 ?auto_317053 ) ) ( not ( = ?auto_317048 ?auto_317054 ) ) ( not ( = ?auto_317048 ?auto_317055 ) ) ( not ( = ?auto_317048 ?auto_317056 ) ) ( not ( = ?auto_317049 ?auto_317050 ) ) ( not ( = ?auto_317049 ?auto_317051 ) ) ( not ( = ?auto_317049 ?auto_317052 ) ) ( not ( = ?auto_317049 ?auto_317053 ) ) ( not ( = ?auto_317049 ?auto_317054 ) ) ( not ( = ?auto_317049 ?auto_317055 ) ) ( not ( = ?auto_317049 ?auto_317056 ) ) ( not ( = ?auto_317050 ?auto_317051 ) ) ( not ( = ?auto_317050 ?auto_317052 ) ) ( not ( = ?auto_317050 ?auto_317053 ) ) ( not ( = ?auto_317050 ?auto_317054 ) ) ( not ( = ?auto_317050 ?auto_317055 ) ) ( not ( = ?auto_317050 ?auto_317056 ) ) ( not ( = ?auto_317051 ?auto_317052 ) ) ( not ( = ?auto_317051 ?auto_317053 ) ) ( not ( = ?auto_317051 ?auto_317054 ) ) ( not ( = ?auto_317051 ?auto_317055 ) ) ( not ( = ?auto_317051 ?auto_317056 ) ) ( not ( = ?auto_317052 ?auto_317053 ) ) ( not ( = ?auto_317052 ?auto_317054 ) ) ( not ( = ?auto_317052 ?auto_317055 ) ) ( not ( = ?auto_317052 ?auto_317056 ) ) ( not ( = ?auto_317053 ?auto_317054 ) ) ( not ( = ?auto_317053 ?auto_317055 ) ) ( not ( = ?auto_317053 ?auto_317056 ) ) ( not ( = ?auto_317054 ?auto_317055 ) ) ( not ( = ?auto_317054 ?auto_317056 ) ) ( not ( = ?auto_317055 ?auto_317056 ) ) ( CLEAR ?auto_317054 ) ( ON ?auto_317055 ?auto_317056 ) ( CLEAR ?auto_317055 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_317043 ?auto_317044 ?auto_317045 ?auto_317046 ?auto_317047 ?auto_317048 ?auto_317049 ?auto_317050 ?auto_317051 ?auto_317052 ?auto_317053 ?auto_317054 ?auto_317055 )
      ( MAKE-14PILE ?auto_317043 ?auto_317044 ?auto_317045 ?auto_317046 ?auto_317047 ?auto_317048 ?auto_317049 ?auto_317050 ?auto_317051 ?auto_317052 ?auto_317053 ?auto_317054 ?auto_317055 ?auto_317056 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_317071 - BLOCK
      ?auto_317072 - BLOCK
      ?auto_317073 - BLOCK
      ?auto_317074 - BLOCK
      ?auto_317075 - BLOCK
      ?auto_317076 - BLOCK
      ?auto_317077 - BLOCK
      ?auto_317078 - BLOCK
      ?auto_317079 - BLOCK
      ?auto_317080 - BLOCK
      ?auto_317081 - BLOCK
      ?auto_317082 - BLOCK
      ?auto_317083 - BLOCK
      ?auto_317084 - BLOCK
    )
    :vars
    (
      ?auto_317085 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_317084 ?auto_317085 ) ( ON-TABLE ?auto_317071 ) ( ON ?auto_317072 ?auto_317071 ) ( ON ?auto_317073 ?auto_317072 ) ( ON ?auto_317074 ?auto_317073 ) ( ON ?auto_317075 ?auto_317074 ) ( ON ?auto_317076 ?auto_317075 ) ( ON ?auto_317077 ?auto_317076 ) ( ON ?auto_317078 ?auto_317077 ) ( ON ?auto_317079 ?auto_317078 ) ( ON ?auto_317080 ?auto_317079 ) ( ON ?auto_317081 ?auto_317080 ) ( not ( = ?auto_317071 ?auto_317072 ) ) ( not ( = ?auto_317071 ?auto_317073 ) ) ( not ( = ?auto_317071 ?auto_317074 ) ) ( not ( = ?auto_317071 ?auto_317075 ) ) ( not ( = ?auto_317071 ?auto_317076 ) ) ( not ( = ?auto_317071 ?auto_317077 ) ) ( not ( = ?auto_317071 ?auto_317078 ) ) ( not ( = ?auto_317071 ?auto_317079 ) ) ( not ( = ?auto_317071 ?auto_317080 ) ) ( not ( = ?auto_317071 ?auto_317081 ) ) ( not ( = ?auto_317071 ?auto_317082 ) ) ( not ( = ?auto_317071 ?auto_317083 ) ) ( not ( = ?auto_317071 ?auto_317084 ) ) ( not ( = ?auto_317071 ?auto_317085 ) ) ( not ( = ?auto_317072 ?auto_317073 ) ) ( not ( = ?auto_317072 ?auto_317074 ) ) ( not ( = ?auto_317072 ?auto_317075 ) ) ( not ( = ?auto_317072 ?auto_317076 ) ) ( not ( = ?auto_317072 ?auto_317077 ) ) ( not ( = ?auto_317072 ?auto_317078 ) ) ( not ( = ?auto_317072 ?auto_317079 ) ) ( not ( = ?auto_317072 ?auto_317080 ) ) ( not ( = ?auto_317072 ?auto_317081 ) ) ( not ( = ?auto_317072 ?auto_317082 ) ) ( not ( = ?auto_317072 ?auto_317083 ) ) ( not ( = ?auto_317072 ?auto_317084 ) ) ( not ( = ?auto_317072 ?auto_317085 ) ) ( not ( = ?auto_317073 ?auto_317074 ) ) ( not ( = ?auto_317073 ?auto_317075 ) ) ( not ( = ?auto_317073 ?auto_317076 ) ) ( not ( = ?auto_317073 ?auto_317077 ) ) ( not ( = ?auto_317073 ?auto_317078 ) ) ( not ( = ?auto_317073 ?auto_317079 ) ) ( not ( = ?auto_317073 ?auto_317080 ) ) ( not ( = ?auto_317073 ?auto_317081 ) ) ( not ( = ?auto_317073 ?auto_317082 ) ) ( not ( = ?auto_317073 ?auto_317083 ) ) ( not ( = ?auto_317073 ?auto_317084 ) ) ( not ( = ?auto_317073 ?auto_317085 ) ) ( not ( = ?auto_317074 ?auto_317075 ) ) ( not ( = ?auto_317074 ?auto_317076 ) ) ( not ( = ?auto_317074 ?auto_317077 ) ) ( not ( = ?auto_317074 ?auto_317078 ) ) ( not ( = ?auto_317074 ?auto_317079 ) ) ( not ( = ?auto_317074 ?auto_317080 ) ) ( not ( = ?auto_317074 ?auto_317081 ) ) ( not ( = ?auto_317074 ?auto_317082 ) ) ( not ( = ?auto_317074 ?auto_317083 ) ) ( not ( = ?auto_317074 ?auto_317084 ) ) ( not ( = ?auto_317074 ?auto_317085 ) ) ( not ( = ?auto_317075 ?auto_317076 ) ) ( not ( = ?auto_317075 ?auto_317077 ) ) ( not ( = ?auto_317075 ?auto_317078 ) ) ( not ( = ?auto_317075 ?auto_317079 ) ) ( not ( = ?auto_317075 ?auto_317080 ) ) ( not ( = ?auto_317075 ?auto_317081 ) ) ( not ( = ?auto_317075 ?auto_317082 ) ) ( not ( = ?auto_317075 ?auto_317083 ) ) ( not ( = ?auto_317075 ?auto_317084 ) ) ( not ( = ?auto_317075 ?auto_317085 ) ) ( not ( = ?auto_317076 ?auto_317077 ) ) ( not ( = ?auto_317076 ?auto_317078 ) ) ( not ( = ?auto_317076 ?auto_317079 ) ) ( not ( = ?auto_317076 ?auto_317080 ) ) ( not ( = ?auto_317076 ?auto_317081 ) ) ( not ( = ?auto_317076 ?auto_317082 ) ) ( not ( = ?auto_317076 ?auto_317083 ) ) ( not ( = ?auto_317076 ?auto_317084 ) ) ( not ( = ?auto_317076 ?auto_317085 ) ) ( not ( = ?auto_317077 ?auto_317078 ) ) ( not ( = ?auto_317077 ?auto_317079 ) ) ( not ( = ?auto_317077 ?auto_317080 ) ) ( not ( = ?auto_317077 ?auto_317081 ) ) ( not ( = ?auto_317077 ?auto_317082 ) ) ( not ( = ?auto_317077 ?auto_317083 ) ) ( not ( = ?auto_317077 ?auto_317084 ) ) ( not ( = ?auto_317077 ?auto_317085 ) ) ( not ( = ?auto_317078 ?auto_317079 ) ) ( not ( = ?auto_317078 ?auto_317080 ) ) ( not ( = ?auto_317078 ?auto_317081 ) ) ( not ( = ?auto_317078 ?auto_317082 ) ) ( not ( = ?auto_317078 ?auto_317083 ) ) ( not ( = ?auto_317078 ?auto_317084 ) ) ( not ( = ?auto_317078 ?auto_317085 ) ) ( not ( = ?auto_317079 ?auto_317080 ) ) ( not ( = ?auto_317079 ?auto_317081 ) ) ( not ( = ?auto_317079 ?auto_317082 ) ) ( not ( = ?auto_317079 ?auto_317083 ) ) ( not ( = ?auto_317079 ?auto_317084 ) ) ( not ( = ?auto_317079 ?auto_317085 ) ) ( not ( = ?auto_317080 ?auto_317081 ) ) ( not ( = ?auto_317080 ?auto_317082 ) ) ( not ( = ?auto_317080 ?auto_317083 ) ) ( not ( = ?auto_317080 ?auto_317084 ) ) ( not ( = ?auto_317080 ?auto_317085 ) ) ( not ( = ?auto_317081 ?auto_317082 ) ) ( not ( = ?auto_317081 ?auto_317083 ) ) ( not ( = ?auto_317081 ?auto_317084 ) ) ( not ( = ?auto_317081 ?auto_317085 ) ) ( not ( = ?auto_317082 ?auto_317083 ) ) ( not ( = ?auto_317082 ?auto_317084 ) ) ( not ( = ?auto_317082 ?auto_317085 ) ) ( not ( = ?auto_317083 ?auto_317084 ) ) ( not ( = ?auto_317083 ?auto_317085 ) ) ( not ( = ?auto_317084 ?auto_317085 ) ) ( ON ?auto_317083 ?auto_317084 ) ( CLEAR ?auto_317081 ) ( ON ?auto_317082 ?auto_317083 ) ( CLEAR ?auto_317082 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_317071 ?auto_317072 ?auto_317073 ?auto_317074 ?auto_317075 ?auto_317076 ?auto_317077 ?auto_317078 ?auto_317079 ?auto_317080 ?auto_317081 ?auto_317082 )
      ( MAKE-14PILE ?auto_317071 ?auto_317072 ?auto_317073 ?auto_317074 ?auto_317075 ?auto_317076 ?auto_317077 ?auto_317078 ?auto_317079 ?auto_317080 ?auto_317081 ?auto_317082 ?auto_317083 ?auto_317084 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_317100 - BLOCK
      ?auto_317101 - BLOCK
      ?auto_317102 - BLOCK
      ?auto_317103 - BLOCK
      ?auto_317104 - BLOCK
      ?auto_317105 - BLOCK
      ?auto_317106 - BLOCK
      ?auto_317107 - BLOCK
      ?auto_317108 - BLOCK
      ?auto_317109 - BLOCK
      ?auto_317110 - BLOCK
      ?auto_317111 - BLOCK
      ?auto_317112 - BLOCK
      ?auto_317113 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_317113 ) ( ON-TABLE ?auto_317100 ) ( ON ?auto_317101 ?auto_317100 ) ( ON ?auto_317102 ?auto_317101 ) ( ON ?auto_317103 ?auto_317102 ) ( ON ?auto_317104 ?auto_317103 ) ( ON ?auto_317105 ?auto_317104 ) ( ON ?auto_317106 ?auto_317105 ) ( ON ?auto_317107 ?auto_317106 ) ( ON ?auto_317108 ?auto_317107 ) ( ON ?auto_317109 ?auto_317108 ) ( ON ?auto_317110 ?auto_317109 ) ( not ( = ?auto_317100 ?auto_317101 ) ) ( not ( = ?auto_317100 ?auto_317102 ) ) ( not ( = ?auto_317100 ?auto_317103 ) ) ( not ( = ?auto_317100 ?auto_317104 ) ) ( not ( = ?auto_317100 ?auto_317105 ) ) ( not ( = ?auto_317100 ?auto_317106 ) ) ( not ( = ?auto_317100 ?auto_317107 ) ) ( not ( = ?auto_317100 ?auto_317108 ) ) ( not ( = ?auto_317100 ?auto_317109 ) ) ( not ( = ?auto_317100 ?auto_317110 ) ) ( not ( = ?auto_317100 ?auto_317111 ) ) ( not ( = ?auto_317100 ?auto_317112 ) ) ( not ( = ?auto_317100 ?auto_317113 ) ) ( not ( = ?auto_317101 ?auto_317102 ) ) ( not ( = ?auto_317101 ?auto_317103 ) ) ( not ( = ?auto_317101 ?auto_317104 ) ) ( not ( = ?auto_317101 ?auto_317105 ) ) ( not ( = ?auto_317101 ?auto_317106 ) ) ( not ( = ?auto_317101 ?auto_317107 ) ) ( not ( = ?auto_317101 ?auto_317108 ) ) ( not ( = ?auto_317101 ?auto_317109 ) ) ( not ( = ?auto_317101 ?auto_317110 ) ) ( not ( = ?auto_317101 ?auto_317111 ) ) ( not ( = ?auto_317101 ?auto_317112 ) ) ( not ( = ?auto_317101 ?auto_317113 ) ) ( not ( = ?auto_317102 ?auto_317103 ) ) ( not ( = ?auto_317102 ?auto_317104 ) ) ( not ( = ?auto_317102 ?auto_317105 ) ) ( not ( = ?auto_317102 ?auto_317106 ) ) ( not ( = ?auto_317102 ?auto_317107 ) ) ( not ( = ?auto_317102 ?auto_317108 ) ) ( not ( = ?auto_317102 ?auto_317109 ) ) ( not ( = ?auto_317102 ?auto_317110 ) ) ( not ( = ?auto_317102 ?auto_317111 ) ) ( not ( = ?auto_317102 ?auto_317112 ) ) ( not ( = ?auto_317102 ?auto_317113 ) ) ( not ( = ?auto_317103 ?auto_317104 ) ) ( not ( = ?auto_317103 ?auto_317105 ) ) ( not ( = ?auto_317103 ?auto_317106 ) ) ( not ( = ?auto_317103 ?auto_317107 ) ) ( not ( = ?auto_317103 ?auto_317108 ) ) ( not ( = ?auto_317103 ?auto_317109 ) ) ( not ( = ?auto_317103 ?auto_317110 ) ) ( not ( = ?auto_317103 ?auto_317111 ) ) ( not ( = ?auto_317103 ?auto_317112 ) ) ( not ( = ?auto_317103 ?auto_317113 ) ) ( not ( = ?auto_317104 ?auto_317105 ) ) ( not ( = ?auto_317104 ?auto_317106 ) ) ( not ( = ?auto_317104 ?auto_317107 ) ) ( not ( = ?auto_317104 ?auto_317108 ) ) ( not ( = ?auto_317104 ?auto_317109 ) ) ( not ( = ?auto_317104 ?auto_317110 ) ) ( not ( = ?auto_317104 ?auto_317111 ) ) ( not ( = ?auto_317104 ?auto_317112 ) ) ( not ( = ?auto_317104 ?auto_317113 ) ) ( not ( = ?auto_317105 ?auto_317106 ) ) ( not ( = ?auto_317105 ?auto_317107 ) ) ( not ( = ?auto_317105 ?auto_317108 ) ) ( not ( = ?auto_317105 ?auto_317109 ) ) ( not ( = ?auto_317105 ?auto_317110 ) ) ( not ( = ?auto_317105 ?auto_317111 ) ) ( not ( = ?auto_317105 ?auto_317112 ) ) ( not ( = ?auto_317105 ?auto_317113 ) ) ( not ( = ?auto_317106 ?auto_317107 ) ) ( not ( = ?auto_317106 ?auto_317108 ) ) ( not ( = ?auto_317106 ?auto_317109 ) ) ( not ( = ?auto_317106 ?auto_317110 ) ) ( not ( = ?auto_317106 ?auto_317111 ) ) ( not ( = ?auto_317106 ?auto_317112 ) ) ( not ( = ?auto_317106 ?auto_317113 ) ) ( not ( = ?auto_317107 ?auto_317108 ) ) ( not ( = ?auto_317107 ?auto_317109 ) ) ( not ( = ?auto_317107 ?auto_317110 ) ) ( not ( = ?auto_317107 ?auto_317111 ) ) ( not ( = ?auto_317107 ?auto_317112 ) ) ( not ( = ?auto_317107 ?auto_317113 ) ) ( not ( = ?auto_317108 ?auto_317109 ) ) ( not ( = ?auto_317108 ?auto_317110 ) ) ( not ( = ?auto_317108 ?auto_317111 ) ) ( not ( = ?auto_317108 ?auto_317112 ) ) ( not ( = ?auto_317108 ?auto_317113 ) ) ( not ( = ?auto_317109 ?auto_317110 ) ) ( not ( = ?auto_317109 ?auto_317111 ) ) ( not ( = ?auto_317109 ?auto_317112 ) ) ( not ( = ?auto_317109 ?auto_317113 ) ) ( not ( = ?auto_317110 ?auto_317111 ) ) ( not ( = ?auto_317110 ?auto_317112 ) ) ( not ( = ?auto_317110 ?auto_317113 ) ) ( not ( = ?auto_317111 ?auto_317112 ) ) ( not ( = ?auto_317111 ?auto_317113 ) ) ( not ( = ?auto_317112 ?auto_317113 ) ) ( ON ?auto_317112 ?auto_317113 ) ( CLEAR ?auto_317110 ) ( ON ?auto_317111 ?auto_317112 ) ( CLEAR ?auto_317111 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_317100 ?auto_317101 ?auto_317102 ?auto_317103 ?auto_317104 ?auto_317105 ?auto_317106 ?auto_317107 ?auto_317108 ?auto_317109 ?auto_317110 ?auto_317111 )
      ( MAKE-14PILE ?auto_317100 ?auto_317101 ?auto_317102 ?auto_317103 ?auto_317104 ?auto_317105 ?auto_317106 ?auto_317107 ?auto_317108 ?auto_317109 ?auto_317110 ?auto_317111 ?auto_317112 ?auto_317113 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_317128 - BLOCK
      ?auto_317129 - BLOCK
      ?auto_317130 - BLOCK
      ?auto_317131 - BLOCK
      ?auto_317132 - BLOCK
      ?auto_317133 - BLOCK
      ?auto_317134 - BLOCK
      ?auto_317135 - BLOCK
      ?auto_317136 - BLOCK
      ?auto_317137 - BLOCK
      ?auto_317138 - BLOCK
      ?auto_317139 - BLOCK
      ?auto_317140 - BLOCK
      ?auto_317141 - BLOCK
    )
    :vars
    (
      ?auto_317142 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_317141 ?auto_317142 ) ( ON-TABLE ?auto_317128 ) ( ON ?auto_317129 ?auto_317128 ) ( ON ?auto_317130 ?auto_317129 ) ( ON ?auto_317131 ?auto_317130 ) ( ON ?auto_317132 ?auto_317131 ) ( ON ?auto_317133 ?auto_317132 ) ( ON ?auto_317134 ?auto_317133 ) ( ON ?auto_317135 ?auto_317134 ) ( ON ?auto_317136 ?auto_317135 ) ( ON ?auto_317137 ?auto_317136 ) ( not ( = ?auto_317128 ?auto_317129 ) ) ( not ( = ?auto_317128 ?auto_317130 ) ) ( not ( = ?auto_317128 ?auto_317131 ) ) ( not ( = ?auto_317128 ?auto_317132 ) ) ( not ( = ?auto_317128 ?auto_317133 ) ) ( not ( = ?auto_317128 ?auto_317134 ) ) ( not ( = ?auto_317128 ?auto_317135 ) ) ( not ( = ?auto_317128 ?auto_317136 ) ) ( not ( = ?auto_317128 ?auto_317137 ) ) ( not ( = ?auto_317128 ?auto_317138 ) ) ( not ( = ?auto_317128 ?auto_317139 ) ) ( not ( = ?auto_317128 ?auto_317140 ) ) ( not ( = ?auto_317128 ?auto_317141 ) ) ( not ( = ?auto_317128 ?auto_317142 ) ) ( not ( = ?auto_317129 ?auto_317130 ) ) ( not ( = ?auto_317129 ?auto_317131 ) ) ( not ( = ?auto_317129 ?auto_317132 ) ) ( not ( = ?auto_317129 ?auto_317133 ) ) ( not ( = ?auto_317129 ?auto_317134 ) ) ( not ( = ?auto_317129 ?auto_317135 ) ) ( not ( = ?auto_317129 ?auto_317136 ) ) ( not ( = ?auto_317129 ?auto_317137 ) ) ( not ( = ?auto_317129 ?auto_317138 ) ) ( not ( = ?auto_317129 ?auto_317139 ) ) ( not ( = ?auto_317129 ?auto_317140 ) ) ( not ( = ?auto_317129 ?auto_317141 ) ) ( not ( = ?auto_317129 ?auto_317142 ) ) ( not ( = ?auto_317130 ?auto_317131 ) ) ( not ( = ?auto_317130 ?auto_317132 ) ) ( not ( = ?auto_317130 ?auto_317133 ) ) ( not ( = ?auto_317130 ?auto_317134 ) ) ( not ( = ?auto_317130 ?auto_317135 ) ) ( not ( = ?auto_317130 ?auto_317136 ) ) ( not ( = ?auto_317130 ?auto_317137 ) ) ( not ( = ?auto_317130 ?auto_317138 ) ) ( not ( = ?auto_317130 ?auto_317139 ) ) ( not ( = ?auto_317130 ?auto_317140 ) ) ( not ( = ?auto_317130 ?auto_317141 ) ) ( not ( = ?auto_317130 ?auto_317142 ) ) ( not ( = ?auto_317131 ?auto_317132 ) ) ( not ( = ?auto_317131 ?auto_317133 ) ) ( not ( = ?auto_317131 ?auto_317134 ) ) ( not ( = ?auto_317131 ?auto_317135 ) ) ( not ( = ?auto_317131 ?auto_317136 ) ) ( not ( = ?auto_317131 ?auto_317137 ) ) ( not ( = ?auto_317131 ?auto_317138 ) ) ( not ( = ?auto_317131 ?auto_317139 ) ) ( not ( = ?auto_317131 ?auto_317140 ) ) ( not ( = ?auto_317131 ?auto_317141 ) ) ( not ( = ?auto_317131 ?auto_317142 ) ) ( not ( = ?auto_317132 ?auto_317133 ) ) ( not ( = ?auto_317132 ?auto_317134 ) ) ( not ( = ?auto_317132 ?auto_317135 ) ) ( not ( = ?auto_317132 ?auto_317136 ) ) ( not ( = ?auto_317132 ?auto_317137 ) ) ( not ( = ?auto_317132 ?auto_317138 ) ) ( not ( = ?auto_317132 ?auto_317139 ) ) ( not ( = ?auto_317132 ?auto_317140 ) ) ( not ( = ?auto_317132 ?auto_317141 ) ) ( not ( = ?auto_317132 ?auto_317142 ) ) ( not ( = ?auto_317133 ?auto_317134 ) ) ( not ( = ?auto_317133 ?auto_317135 ) ) ( not ( = ?auto_317133 ?auto_317136 ) ) ( not ( = ?auto_317133 ?auto_317137 ) ) ( not ( = ?auto_317133 ?auto_317138 ) ) ( not ( = ?auto_317133 ?auto_317139 ) ) ( not ( = ?auto_317133 ?auto_317140 ) ) ( not ( = ?auto_317133 ?auto_317141 ) ) ( not ( = ?auto_317133 ?auto_317142 ) ) ( not ( = ?auto_317134 ?auto_317135 ) ) ( not ( = ?auto_317134 ?auto_317136 ) ) ( not ( = ?auto_317134 ?auto_317137 ) ) ( not ( = ?auto_317134 ?auto_317138 ) ) ( not ( = ?auto_317134 ?auto_317139 ) ) ( not ( = ?auto_317134 ?auto_317140 ) ) ( not ( = ?auto_317134 ?auto_317141 ) ) ( not ( = ?auto_317134 ?auto_317142 ) ) ( not ( = ?auto_317135 ?auto_317136 ) ) ( not ( = ?auto_317135 ?auto_317137 ) ) ( not ( = ?auto_317135 ?auto_317138 ) ) ( not ( = ?auto_317135 ?auto_317139 ) ) ( not ( = ?auto_317135 ?auto_317140 ) ) ( not ( = ?auto_317135 ?auto_317141 ) ) ( not ( = ?auto_317135 ?auto_317142 ) ) ( not ( = ?auto_317136 ?auto_317137 ) ) ( not ( = ?auto_317136 ?auto_317138 ) ) ( not ( = ?auto_317136 ?auto_317139 ) ) ( not ( = ?auto_317136 ?auto_317140 ) ) ( not ( = ?auto_317136 ?auto_317141 ) ) ( not ( = ?auto_317136 ?auto_317142 ) ) ( not ( = ?auto_317137 ?auto_317138 ) ) ( not ( = ?auto_317137 ?auto_317139 ) ) ( not ( = ?auto_317137 ?auto_317140 ) ) ( not ( = ?auto_317137 ?auto_317141 ) ) ( not ( = ?auto_317137 ?auto_317142 ) ) ( not ( = ?auto_317138 ?auto_317139 ) ) ( not ( = ?auto_317138 ?auto_317140 ) ) ( not ( = ?auto_317138 ?auto_317141 ) ) ( not ( = ?auto_317138 ?auto_317142 ) ) ( not ( = ?auto_317139 ?auto_317140 ) ) ( not ( = ?auto_317139 ?auto_317141 ) ) ( not ( = ?auto_317139 ?auto_317142 ) ) ( not ( = ?auto_317140 ?auto_317141 ) ) ( not ( = ?auto_317140 ?auto_317142 ) ) ( not ( = ?auto_317141 ?auto_317142 ) ) ( ON ?auto_317140 ?auto_317141 ) ( ON ?auto_317139 ?auto_317140 ) ( CLEAR ?auto_317137 ) ( ON ?auto_317138 ?auto_317139 ) ( CLEAR ?auto_317138 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_317128 ?auto_317129 ?auto_317130 ?auto_317131 ?auto_317132 ?auto_317133 ?auto_317134 ?auto_317135 ?auto_317136 ?auto_317137 ?auto_317138 )
      ( MAKE-14PILE ?auto_317128 ?auto_317129 ?auto_317130 ?auto_317131 ?auto_317132 ?auto_317133 ?auto_317134 ?auto_317135 ?auto_317136 ?auto_317137 ?auto_317138 ?auto_317139 ?auto_317140 ?auto_317141 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_317157 - BLOCK
      ?auto_317158 - BLOCK
      ?auto_317159 - BLOCK
      ?auto_317160 - BLOCK
      ?auto_317161 - BLOCK
      ?auto_317162 - BLOCK
      ?auto_317163 - BLOCK
      ?auto_317164 - BLOCK
      ?auto_317165 - BLOCK
      ?auto_317166 - BLOCK
      ?auto_317167 - BLOCK
      ?auto_317168 - BLOCK
      ?auto_317169 - BLOCK
      ?auto_317170 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_317170 ) ( ON-TABLE ?auto_317157 ) ( ON ?auto_317158 ?auto_317157 ) ( ON ?auto_317159 ?auto_317158 ) ( ON ?auto_317160 ?auto_317159 ) ( ON ?auto_317161 ?auto_317160 ) ( ON ?auto_317162 ?auto_317161 ) ( ON ?auto_317163 ?auto_317162 ) ( ON ?auto_317164 ?auto_317163 ) ( ON ?auto_317165 ?auto_317164 ) ( ON ?auto_317166 ?auto_317165 ) ( not ( = ?auto_317157 ?auto_317158 ) ) ( not ( = ?auto_317157 ?auto_317159 ) ) ( not ( = ?auto_317157 ?auto_317160 ) ) ( not ( = ?auto_317157 ?auto_317161 ) ) ( not ( = ?auto_317157 ?auto_317162 ) ) ( not ( = ?auto_317157 ?auto_317163 ) ) ( not ( = ?auto_317157 ?auto_317164 ) ) ( not ( = ?auto_317157 ?auto_317165 ) ) ( not ( = ?auto_317157 ?auto_317166 ) ) ( not ( = ?auto_317157 ?auto_317167 ) ) ( not ( = ?auto_317157 ?auto_317168 ) ) ( not ( = ?auto_317157 ?auto_317169 ) ) ( not ( = ?auto_317157 ?auto_317170 ) ) ( not ( = ?auto_317158 ?auto_317159 ) ) ( not ( = ?auto_317158 ?auto_317160 ) ) ( not ( = ?auto_317158 ?auto_317161 ) ) ( not ( = ?auto_317158 ?auto_317162 ) ) ( not ( = ?auto_317158 ?auto_317163 ) ) ( not ( = ?auto_317158 ?auto_317164 ) ) ( not ( = ?auto_317158 ?auto_317165 ) ) ( not ( = ?auto_317158 ?auto_317166 ) ) ( not ( = ?auto_317158 ?auto_317167 ) ) ( not ( = ?auto_317158 ?auto_317168 ) ) ( not ( = ?auto_317158 ?auto_317169 ) ) ( not ( = ?auto_317158 ?auto_317170 ) ) ( not ( = ?auto_317159 ?auto_317160 ) ) ( not ( = ?auto_317159 ?auto_317161 ) ) ( not ( = ?auto_317159 ?auto_317162 ) ) ( not ( = ?auto_317159 ?auto_317163 ) ) ( not ( = ?auto_317159 ?auto_317164 ) ) ( not ( = ?auto_317159 ?auto_317165 ) ) ( not ( = ?auto_317159 ?auto_317166 ) ) ( not ( = ?auto_317159 ?auto_317167 ) ) ( not ( = ?auto_317159 ?auto_317168 ) ) ( not ( = ?auto_317159 ?auto_317169 ) ) ( not ( = ?auto_317159 ?auto_317170 ) ) ( not ( = ?auto_317160 ?auto_317161 ) ) ( not ( = ?auto_317160 ?auto_317162 ) ) ( not ( = ?auto_317160 ?auto_317163 ) ) ( not ( = ?auto_317160 ?auto_317164 ) ) ( not ( = ?auto_317160 ?auto_317165 ) ) ( not ( = ?auto_317160 ?auto_317166 ) ) ( not ( = ?auto_317160 ?auto_317167 ) ) ( not ( = ?auto_317160 ?auto_317168 ) ) ( not ( = ?auto_317160 ?auto_317169 ) ) ( not ( = ?auto_317160 ?auto_317170 ) ) ( not ( = ?auto_317161 ?auto_317162 ) ) ( not ( = ?auto_317161 ?auto_317163 ) ) ( not ( = ?auto_317161 ?auto_317164 ) ) ( not ( = ?auto_317161 ?auto_317165 ) ) ( not ( = ?auto_317161 ?auto_317166 ) ) ( not ( = ?auto_317161 ?auto_317167 ) ) ( not ( = ?auto_317161 ?auto_317168 ) ) ( not ( = ?auto_317161 ?auto_317169 ) ) ( not ( = ?auto_317161 ?auto_317170 ) ) ( not ( = ?auto_317162 ?auto_317163 ) ) ( not ( = ?auto_317162 ?auto_317164 ) ) ( not ( = ?auto_317162 ?auto_317165 ) ) ( not ( = ?auto_317162 ?auto_317166 ) ) ( not ( = ?auto_317162 ?auto_317167 ) ) ( not ( = ?auto_317162 ?auto_317168 ) ) ( not ( = ?auto_317162 ?auto_317169 ) ) ( not ( = ?auto_317162 ?auto_317170 ) ) ( not ( = ?auto_317163 ?auto_317164 ) ) ( not ( = ?auto_317163 ?auto_317165 ) ) ( not ( = ?auto_317163 ?auto_317166 ) ) ( not ( = ?auto_317163 ?auto_317167 ) ) ( not ( = ?auto_317163 ?auto_317168 ) ) ( not ( = ?auto_317163 ?auto_317169 ) ) ( not ( = ?auto_317163 ?auto_317170 ) ) ( not ( = ?auto_317164 ?auto_317165 ) ) ( not ( = ?auto_317164 ?auto_317166 ) ) ( not ( = ?auto_317164 ?auto_317167 ) ) ( not ( = ?auto_317164 ?auto_317168 ) ) ( not ( = ?auto_317164 ?auto_317169 ) ) ( not ( = ?auto_317164 ?auto_317170 ) ) ( not ( = ?auto_317165 ?auto_317166 ) ) ( not ( = ?auto_317165 ?auto_317167 ) ) ( not ( = ?auto_317165 ?auto_317168 ) ) ( not ( = ?auto_317165 ?auto_317169 ) ) ( not ( = ?auto_317165 ?auto_317170 ) ) ( not ( = ?auto_317166 ?auto_317167 ) ) ( not ( = ?auto_317166 ?auto_317168 ) ) ( not ( = ?auto_317166 ?auto_317169 ) ) ( not ( = ?auto_317166 ?auto_317170 ) ) ( not ( = ?auto_317167 ?auto_317168 ) ) ( not ( = ?auto_317167 ?auto_317169 ) ) ( not ( = ?auto_317167 ?auto_317170 ) ) ( not ( = ?auto_317168 ?auto_317169 ) ) ( not ( = ?auto_317168 ?auto_317170 ) ) ( not ( = ?auto_317169 ?auto_317170 ) ) ( ON ?auto_317169 ?auto_317170 ) ( ON ?auto_317168 ?auto_317169 ) ( CLEAR ?auto_317166 ) ( ON ?auto_317167 ?auto_317168 ) ( CLEAR ?auto_317167 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_317157 ?auto_317158 ?auto_317159 ?auto_317160 ?auto_317161 ?auto_317162 ?auto_317163 ?auto_317164 ?auto_317165 ?auto_317166 ?auto_317167 )
      ( MAKE-14PILE ?auto_317157 ?auto_317158 ?auto_317159 ?auto_317160 ?auto_317161 ?auto_317162 ?auto_317163 ?auto_317164 ?auto_317165 ?auto_317166 ?auto_317167 ?auto_317168 ?auto_317169 ?auto_317170 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_317185 - BLOCK
      ?auto_317186 - BLOCK
      ?auto_317187 - BLOCK
      ?auto_317188 - BLOCK
      ?auto_317189 - BLOCK
      ?auto_317190 - BLOCK
      ?auto_317191 - BLOCK
      ?auto_317192 - BLOCK
      ?auto_317193 - BLOCK
      ?auto_317194 - BLOCK
      ?auto_317195 - BLOCK
      ?auto_317196 - BLOCK
      ?auto_317197 - BLOCK
      ?auto_317198 - BLOCK
    )
    :vars
    (
      ?auto_317199 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_317198 ?auto_317199 ) ( ON-TABLE ?auto_317185 ) ( ON ?auto_317186 ?auto_317185 ) ( ON ?auto_317187 ?auto_317186 ) ( ON ?auto_317188 ?auto_317187 ) ( ON ?auto_317189 ?auto_317188 ) ( ON ?auto_317190 ?auto_317189 ) ( ON ?auto_317191 ?auto_317190 ) ( ON ?auto_317192 ?auto_317191 ) ( ON ?auto_317193 ?auto_317192 ) ( not ( = ?auto_317185 ?auto_317186 ) ) ( not ( = ?auto_317185 ?auto_317187 ) ) ( not ( = ?auto_317185 ?auto_317188 ) ) ( not ( = ?auto_317185 ?auto_317189 ) ) ( not ( = ?auto_317185 ?auto_317190 ) ) ( not ( = ?auto_317185 ?auto_317191 ) ) ( not ( = ?auto_317185 ?auto_317192 ) ) ( not ( = ?auto_317185 ?auto_317193 ) ) ( not ( = ?auto_317185 ?auto_317194 ) ) ( not ( = ?auto_317185 ?auto_317195 ) ) ( not ( = ?auto_317185 ?auto_317196 ) ) ( not ( = ?auto_317185 ?auto_317197 ) ) ( not ( = ?auto_317185 ?auto_317198 ) ) ( not ( = ?auto_317185 ?auto_317199 ) ) ( not ( = ?auto_317186 ?auto_317187 ) ) ( not ( = ?auto_317186 ?auto_317188 ) ) ( not ( = ?auto_317186 ?auto_317189 ) ) ( not ( = ?auto_317186 ?auto_317190 ) ) ( not ( = ?auto_317186 ?auto_317191 ) ) ( not ( = ?auto_317186 ?auto_317192 ) ) ( not ( = ?auto_317186 ?auto_317193 ) ) ( not ( = ?auto_317186 ?auto_317194 ) ) ( not ( = ?auto_317186 ?auto_317195 ) ) ( not ( = ?auto_317186 ?auto_317196 ) ) ( not ( = ?auto_317186 ?auto_317197 ) ) ( not ( = ?auto_317186 ?auto_317198 ) ) ( not ( = ?auto_317186 ?auto_317199 ) ) ( not ( = ?auto_317187 ?auto_317188 ) ) ( not ( = ?auto_317187 ?auto_317189 ) ) ( not ( = ?auto_317187 ?auto_317190 ) ) ( not ( = ?auto_317187 ?auto_317191 ) ) ( not ( = ?auto_317187 ?auto_317192 ) ) ( not ( = ?auto_317187 ?auto_317193 ) ) ( not ( = ?auto_317187 ?auto_317194 ) ) ( not ( = ?auto_317187 ?auto_317195 ) ) ( not ( = ?auto_317187 ?auto_317196 ) ) ( not ( = ?auto_317187 ?auto_317197 ) ) ( not ( = ?auto_317187 ?auto_317198 ) ) ( not ( = ?auto_317187 ?auto_317199 ) ) ( not ( = ?auto_317188 ?auto_317189 ) ) ( not ( = ?auto_317188 ?auto_317190 ) ) ( not ( = ?auto_317188 ?auto_317191 ) ) ( not ( = ?auto_317188 ?auto_317192 ) ) ( not ( = ?auto_317188 ?auto_317193 ) ) ( not ( = ?auto_317188 ?auto_317194 ) ) ( not ( = ?auto_317188 ?auto_317195 ) ) ( not ( = ?auto_317188 ?auto_317196 ) ) ( not ( = ?auto_317188 ?auto_317197 ) ) ( not ( = ?auto_317188 ?auto_317198 ) ) ( not ( = ?auto_317188 ?auto_317199 ) ) ( not ( = ?auto_317189 ?auto_317190 ) ) ( not ( = ?auto_317189 ?auto_317191 ) ) ( not ( = ?auto_317189 ?auto_317192 ) ) ( not ( = ?auto_317189 ?auto_317193 ) ) ( not ( = ?auto_317189 ?auto_317194 ) ) ( not ( = ?auto_317189 ?auto_317195 ) ) ( not ( = ?auto_317189 ?auto_317196 ) ) ( not ( = ?auto_317189 ?auto_317197 ) ) ( not ( = ?auto_317189 ?auto_317198 ) ) ( not ( = ?auto_317189 ?auto_317199 ) ) ( not ( = ?auto_317190 ?auto_317191 ) ) ( not ( = ?auto_317190 ?auto_317192 ) ) ( not ( = ?auto_317190 ?auto_317193 ) ) ( not ( = ?auto_317190 ?auto_317194 ) ) ( not ( = ?auto_317190 ?auto_317195 ) ) ( not ( = ?auto_317190 ?auto_317196 ) ) ( not ( = ?auto_317190 ?auto_317197 ) ) ( not ( = ?auto_317190 ?auto_317198 ) ) ( not ( = ?auto_317190 ?auto_317199 ) ) ( not ( = ?auto_317191 ?auto_317192 ) ) ( not ( = ?auto_317191 ?auto_317193 ) ) ( not ( = ?auto_317191 ?auto_317194 ) ) ( not ( = ?auto_317191 ?auto_317195 ) ) ( not ( = ?auto_317191 ?auto_317196 ) ) ( not ( = ?auto_317191 ?auto_317197 ) ) ( not ( = ?auto_317191 ?auto_317198 ) ) ( not ( = ?auto_317191 ?auto_317199 ) ) ( not ( = ?auto_317192 ?auto_317193 ) ) ( not ( = ?auto_317192 ?auto_317194 ) ) ( not ( = ?auto_317192 ?auto_317195 ) ) ( not ( = ?auto_317192 ?auto_317196 ) ) ( not ( = ?auto_317192 ?auto_317197 ) ) ( not ( = ?auto_317192 ?auto_317198 ) ) ( not ( = ?auto_317192 ?auto_317199 ) ) ( not ( = ?auto_317193 ?auto_317194 ) ) ( not ( = ?auto_317193 ?auto_317195 ) ) ( not ( = ?auto_317193 ?auto_317196 ) ) ( not ( = ?auto_317193 ?auto_317197 ) ) ( not ( = ?auto_317193 ?auto_317198 ) ) ( not ( = ?auto_317193 ?auto_317199 ) ) ( not ( = ?auto_317194 ?auto_317195 ) ) ( not ( = ?auto_317194 ?auto_317196 ) ) ( not ( = ?auto_317194 ?auto_317197 ) ) ( not ( = ?auto_317194 ?auto_317198 ) ) ( not ( = ?auto_317194 ?auto_317199 ) ) ( not ( = ?auto_317195 ?auto_317196 ) ) ( not ( = ?auto_317195 ?auto_317197 ) ) ( not ( = ?auto_317195 ?auto_317198 ) ) ( not ( = ?auto_317195 ?auto_317199 ) ) ( not ( = ?auto_317196 ?auto_317197 ) ) ( not ( = ?auto_317196 ?auto_317198 ) ) ( not ( = ?auto_317196 ?auto_317199 ) ) ( not ( = ?auto_317197 ?auto_317198 ) ) ( not ( = ?auto_317197 ?auto_317199 ) ) ( not ( = ?auto_317198 ?auto_317199 ) ) ( ON ?auto_317197 ?auto_317198 ) ( ON ?auto_317196 ?auto_317197 ) ( ON ?auto_317195 ?auto_317196 ) ( CLEAR ?auto_317193 ) ( ON ?auto_317194 ?auto_317195 ) ( CLEAR ?auto_317194 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_317185 ?auto_317186 ?auto_317187 ?auto_317188 ?auto_317189 ?auto_317190 ?auto_317191 ?auto_317192 ?auto_317193 ?auto_317194 )
      ( MAKE-14PILE ?auto_317185 ?auto_317186 ?auto_317187 ?auto_317188 ?auto_317189 ?auto_317190 ?auto_317191 ?auto_317192 ?auto_317193 ?auto_317194 ?auto_317195 ?auto_317196 ?auto_317197 ?auto_317198 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_317214 - BLOCK
      ?auto_317215 - BLOCK
      ?auto_317216 - BLOCK
      ?auto_317217 - BLOCK
      ?auto_317218 - BLOCK
      ?auto_317219 - BLOCK
      ?auto_317220 - BLOCK
      ?auto_317221 - BLOCK
      ?auto_317222 - BLOCK
      ?auto_317223 - BLOCK
      ?auto_317224 - BLOCK
      ?auto_317225 - BLOCK
      ?auto_317226 - BLOCK
      ?auto_317227 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_317227 ) ( ON-TABLE ?auto_317214 ) ( ON ?auto_317215 ?auto_317214 ) ( ON ?auto_317216 ?auto_317215 ) ( ON ?auto_317217 ?auto_317216 ) ( ON ?auto_317218 ?auto_317217 ) ( ON ?auto_317219 ?auto_317218 ) ( ON ?auto_317220 ?auto_317219 ) ( ON ?auto_317221 ?auto_317220 ) ( ON ?auto_317222 ?auto_317221 ) ( not ( = ?auto_317214 ?auto_317215 ) ) ( not ( = ?auto_317214 ?auto_317216 ) ) ( not ( = ?auto_317214 ?auto_317217 ) ) ( not ( = ?auto_317214 ?auto_317218 ) ) ( not ( = ?auto_317214 ?auto_317219 ) ) ( not ( = ?auto_317214 ?auto_317220 ) ) ( not ( = ?auto_317214 ?auto_317221 ) ) ( not ( = ?auto_317214 ?auto_317222 ) ) ( not ( = ?auto_317214 ?auto_317223 ) ) ( not ( = ?auto_317214 ?auto_317224 ) ) ( not ( = ?auto_317214 ?auto_317225 ) ) ( not ( = ?auto_317214 ?auto_317226 ) ) ( not ( = ?auto_317214 ?auto_317227 ) ) ( not ( = ?auto_317215 ?auto_317216 ) ) ( not ( = ?auto_317215 ?auto_317217 ) ) ( not ( = ?auto_317215 ?auto_317218 ) ) ( not ( = ?auto_317215 ?auto_317219 ) ) ( not ( = ?auto_317215 ?auto_317220 ) ) ( not ( = ?auto_317215 ?auto_317221 ) ) ( not ( = ?auto_317215 ?auto_317222 ) ) ( not ( = ?auto_317215 ?auto_317223 ) ) ( not ( = ?auto_317215 ?auto_317224 ) ) ( not ( = ?auto_317215 ?auto_317225 ) ) ( not ( = ?auto_317215 ?auto_317226 ) ) ( not ( = ?auto_317215 ?auto_317227 ) ) ( not ( = ?auto_317216 ?auto_317217 ) ) ( not ( = ?auto_317216 ?auto_317218 ) ) ( not ( = ?auto_317216 ?auto_317219 ) ) ( not ( = ?auto_317216 ?auto_317220 ) ) ( not ( = ?auto_317216 ?auto_317221 ) ) ( not ( = ?auto_317216 ?auto_317222 ) ) ( not ( = ?auto_317216 ?auto_317223 ) ) ( not ( = ?auto_317216 ?auto_317224 ) ) ( not ( = ?auto_317216 ?auto_317225 ) ) ( not ( = ?auto_317216 ?auto_317226 ) ) ( not ( = ?auto_317216 ?auto_317227 ) ) ( not ( = ?auto_317217 ?auto_317218 ) ) ( not ( = ?auto_317217 ?auto_317219 ) ) ( not ( = ?auto_317217 ?auto_317220 ) ) ( not ( = ?auto_317217 ?auto_317221 ) ) ( not ( = ?auto_317217 ?auto_317222 ) ) ( not ( = ?auto_317217 ?auto_317223 ) ) ( not ( = ?auto_317217 ?auto_317224 ) ) ( not ( = ?auto_317217 ?auto_317225 ) ) ( not ( = ?auto_317217 ?auto_317226 ) ) ( not ( = ?auto_317217 ?auto_317227 ) ) ( not ( = ?auto_317218 ?auto_317219 ) ) ( not ( = ?auto_317218 ?auto_317220 ) ) ( not ( = ?auto_317218 ?auto_317221 ) ) ( not ( = ?auto_317218 ?auto_317222 ) ) ( not ( = ?auto_317218 ?auto_317223 ) ) ( not ( = ?auto_317218 ?auto_317224 ) ) ( not ( = ?auto_317218 ?auto_317225 ) ) ( not ( = ?auto_317218 ?auto_317226 ) ) ( not ( = ?auto_317218 ?auto_317227 ) ) ( not ( = ?auto_317219 ?auto_317220 ) ) ( not ( = ?auto_317219 ?auto_317221 ) ) ( not ( = ?auto_317219 ?auto_317222 ) ) ( not ( = ?auto_317219 ?auto_317223 ) ) ( not ( = ?auto_317219 ?auto_317224 ) ) ( not ( = ?auto_317219 ?auto_317225 ) ) ( not ( = ?auto_317219 ?auto_317226 ) ) ( not ( = ?auto_317219 ?auto_317227 ) ) ( not ( = ?auto_317220 ?auto_317221 ) ) ( not ( = ?auto_317220 ?auto_317222 ) ) ( not ( = ?auto_317220 ?auto_317223 ) ) ( not ( = ?auto_317220 ?auto_317224 ) ) ( not ( = ?auto_317220 ?auto_317225 ) ) ( not ( = ?auto_317220 ?auto_317226 ) ) ( not ( = ?auto_317220 ?auto_317227 ) ) ( not ( = ?auto_317221 ?auto_317222 ) ) ( not ( = ?auto_317221 ?auto_317223 ) ) ( not ( = ?auto_317221 ?auto_317224 ) ) ( not ( = ?auto_317221 ?auto_317225 ) ) ( not ( = ?auto_317221 ?auto_317226 ) ) ( not ( = ?auto_317221 ?auto_317227 ) ) ( not ( = ?auto_317222 ?auto_317223 ) ) ( not ( = ?auto_317222 ?auto_317224 ) ) ( not ( = ?auto_317222 ?auto_317225 ) ) ( not ( = ?auto_317222 ?auto_317226 ) ) ( not ( = ?auto_317222 ?auto_317227 ) ) ( not ( = ?auto_317223 ?auto_317224 ) ) ( not ( = ?auto_317223 ?auto_317225 ) ) ( not ( = ?auto_317223 ?auto_317226 ) ) ( not ( = ?auto_317223 ?auto_317227 ) ) ( not ( = ?auto_317224 ?auto_317225 ) ) ( not ( = ?auto_317224 ?auto_317226 ) ) ( not ( = ?auto_317224 ?auto_317227 ) ) ( not ( = ?auto_317225 ?auto_317226 ) ) ( not ( = ?auto_317225 ?auto_317227 ) ) ( not ( = ?auto_317226 ?auto_317227 ) ) ( ON ?auto_317226 ?auto_317227 ) ( ON ?auto_317225 ?auto_317226 ) ( ON ?auto_317224 ?auto_317225 ) ( CLEAR ?auto_317222 ) ( ON ?auto_317223 ?auto_317224 ) ( CLEAR ?auto_317223 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_317214 ?auto_317215 ?auto_317216 ?auto_317217 ?auto_317218 ?auto_317219 ?auto_317220 ?auto_317221 ?auto_317222 ?auto_317223 )
      ( MAKE-14PILE ?auto_317214 ?auto_317215 ?auto_317216 ?auto_317217 ?auto_317218 ?auto_317219 ?auto_317220 ?auto_317221 ?auto_317222 ?auto_317223 ?auto_317224 ?auto_317225 ?auto_317226 ?auto_317227 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_317242 - BLOCK
      ?auto_317243 - BLOCK
      ?auto_317244 - BLOCK
      ?auto_317245 - BLOCK
      ?auto_317246 - BLOCK
      ?auto_317247 - BLOCK
      ?auto_317248 - BLOCK
      ?auto_317249 - BLOCK
      ?auto_317250 - BLOCK
      ?auto_317251 - BLOCK
      ?auto_317252 - BLOCK
      ?auto_317253 - BLOCK
      ?auto_317254 - BLOCK
      ?auto_317255 - BLOCK
    )
    :vars
    (
      ?auto_317256 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_317255 ?auto_317256 ) ( ON-TABLE ?auto_317242 ) ( ON ?auto_317243 ?auto_317242 ) ( ON ?auto_317244 ?auto_317243 ) ( ON ?auto_317245 ?auto_317244 ) ( ON ?auto_317246 ?auto_317245 ) ( ON ?auto_317247 ?auto_317246 ) ( ON ?auto_317248 ?auto_317247 ) ( ON ?auto_317249 ?auto_317248 ) ( not ( = ?auto_317242 ?auto_317243 ) ) ( not ( = ?auto_317242 ?auto_317244 ) ) ( not ( = ?auto_317242 ?auto_317245 ) ) ( not ( = ?auto_317242 ?auto_317246 ) ) ( not ( = ?auto_317242 ?auto_317247 ) ) ( not ( = ?auto_317242 ?auto_317248 ) ) ( not ( = ?auto_317242 ?auto_317249 ) ) ( not ( = ?auto_317242 ?auto_317250 ) ) ( not ( = ?auto_317242 ?auto_317251 ) ) ( not ( = ?auto_317242 ?auto_317252 ) ) ( not ( = ?auto_317242 ?auto_317253 ) ) ( not ( = ?auto_317242 ?auto_317254 ) ) ( not ( = ?auto_317242 ?auto_317255 ) ) ( not ( = ?auto_317242 ?auto_317256 ) ) ( not ( = ?auto_317243 ?auto_317244 ) ) ( not ( = ?auto_317243 ?auto_317245 ) ) ( not ( = ?auto_317243 ?auto_317246 ) ) ( not ( = ?auto_317243 ?auto_317247 ) ) ( not ( = ?auto_317243 ?auto_317248 ) ) ( not ( = ?auto_317243 ?auto_317249 ) ) ( not ( = ?auto_317243 ?auto_317250 ) ) ( not ( = ?auto_317243 ?auto_317251 ) ) ( not ( = ?auto_317243 ?auto_317252 ) ) ( not ( = ?auto_317243 ?auto_317253 ) ) ( not ( = ?auto_317243 ?auto_317254 ) ) ( not ( = ?auto_317243 ?auto_317255 ) ) ( not ( = ?auto_317243 ?auto_317256 ) ) ( not ( = ?auto_317244 ?auto_317245 ) ) ( not ( = ?auto_317244 ?auto_317246 ) ) ( not ( = ?auto_317244 ?auto_317247 ) ) ( not ( = ?auto_317244 ?auto_317248 ) ) ( not ( = ?auto_317244 ?auto_317249 ) ) ( not ( = ?auto_317244 ?auto_317250 ) ) ( not ( = ?auto_317244 ?auto_317251 ) ) ( not ( = ?auto_317244 ?auto_317252 ) ) ( not ( = ?auto_317244 ?auto_317253 ) ) ( not ( = ?auto_317244 ?auto_317254 ) ) ( not ( = ?auto_317244 ?auto_317255 ) ) ( not ( = ?auto_317244 ?auto_317256 ) ) ( not ( = ?auto_317245 ?auto_317246 ) ) ( not ( = ?auto_317245 ?auto_317247 ) ) ( not ( = ?auto_317245 ?auto_317248 ) ) ( not ( = ?auto_317245 ?auto_317249 ) ) ( not ( = ?auto_317245 ?auto_317250 ) ) ( not ( = ?auto_317245 ?auto_317251 ) ) ( not ( = ?auto_317245 ?auto_317252 ) ) ( not ( = ?auto_317245 ?auto_317253 ) ) ( not ( = ?auto_317245 ?auto_317254 ) ) ( not ( = ?auto_317245 ?auto_317255 ) ) ( not ( = ?auto_317245 ?auto_317256 ) ) ( not ( = ?auto_317246 ?auto_317247 ) ) ( not ( = ?auto_317246 ?auto_317248 ) ) ( not ( = ?auto_317246 ?auto_317249 ) ) ( not ( = ?auto_317246 ?auto_317250 ) ) ( not ( = ?auto_317246 ?auto_317251 ) ) ( not ( = ?auto_317246 ?auto_317252 ) ) ( not ( = ?auto_317246 ?auto_317253 ) ) ( not ( = ?auto_317246 ?auto_317254 ) ) ( not ( = ?auto_317246 ?auto_317255 ) ) ( not ( = ?auto_317246 ?auto_317256 ) ) ( not ( = ?auto_317247 ?auto_317248 ) ) ( not ( = ?auto_317247 ?auto_317249 ) ) ( not ( = ?auto_317247 ?auto_317250 ) ) ( not ( = ?auto_317247 ?auto_317251 ) ) ( not ( = ?auto_317247 ?auto_317252 ) ) ( not ( = ?auto_317247 ?auto_317253 ) ) ( not ( = ?auto_317247 ?auto_317254 ) ) ( not ( = ?auto_317247 ?auto_317255 ) ) ( not ( = ?auto_317247 ?auto_317256 ) ) ( not ( = ?auto_317248 ?auto_317249 ) ) ( not ( = ?auto_317248 ?auto_317250 ) ) ( not ( = ?auto_317248 ?auto_317251 ) ) ( not ( = ?auto_317248 ?auto_317252 ) ) ( not ( = ?auto_317248 ?auto_317253 ) ) ( not ( = ?auto_317248 ?auto_317254 ) ) ( not ( = ?auto_317248 ?auto_317255 ) ) ( not ( = ?auto_317248 ?auto_317256 ) ) ( not ( = ?auto_317249 ?auto_317250 ) ) ( not ( = ?auto_317249 ?auto_317251 ) ) ( not ( = ?auto_317249 ?auto_317252 ) ) ( not ( = ?auto_317249 ?auto_317253 ) ) ( not ( = ?auto_317249 ?auto_317254 ) ) ( not ( = ?auto_317249 ?auto_317255 ) ) ( not ( = ?auto_317249 ?auto_317256 ) ) ( not ( = ?auto_317250 ?auto_317251 ) ) ( not ( = ?auto_317250 ?auto_317252 ) ) ( not ( = ?auto_317250 ?auto_317253 ) ) ( not ( = ?auto_317250 ?auto_317254 ) ) ( not ( = ?auto_317250 ?auto_317255 ) ) ( not ( = ?auto_317250 ?auto_317256 ) ) ( not ( = ?auto_317251 ?auto_317252 ) ) ( not ( = ?auto_317251 ?auto_317253 ) ) ( not ( = ?auto_317251 ?auto_317254 ) ) ( not ( = ?auto_317251 ?auto_317255 ) ) ( not ( = ?auto_317251 ?auto_317256 ) ) ( not ( = ?auto_317252 ?auto_317253 ) ) ( not ( = ?auto_317252 ?auto_317254 ) ) ( not ( = ?auto_317252 ?auto_317255 ) ) ( not ( = ?auto_317252 ?auto_317256 ) ) ( not ( = ?auto_317253 ?auto_317254 ) ) ( not ( = ?auto_317253 ?auto_317255 ) ) ( not ( = ?auto_317253 ?auto_317256 ) ) ( not ( = ?auto_317254 ?auto_317255 ) ) ( not ( = ?auto_317254 ?auto_317256 ) ) ( not ( = ?auto_317255 ?auto_317256 ) ) ( ON ?auto_317254 ?auto_317255 ) ( ON ?auto_317253 ?auto_317254 ) ( ON ?auto_317252 ?auto_317253 ) ( ON ?auto_317251 ?auto_317252 ) ( CLEAR ?auto_317249 ) ( ON ?auto_317250 ?auto_317251 ) ( CLEAR ?auto_317250 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_317242 ?auto_317243 ?auto_317244 ?auto_317245 ?auto_317246 ?auto_317247 ?auto_317248 ?auto_317249 ?auto_317250 )
      ( MAKE-14PILE ?auto_317242 ?auto_317243 ?auto_317244 ?auto_317245 ?auto_317246 ?auto_317247 ?auto_317248 ?auto_317249 ?auto_317250 ?auto_317251 ?auto_317252 ?auto_317253 ?auto_317254 ?auto_317255 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_317271 - BLOCK
      ?auto_317272 - BLOCK
      ?auto_317273 - BLOCK
      ?auto_317274 - BLOCK
      ?auto_317275 - BLOCK
      ?auto_317276 - BLOCK
      ?auto_317277 - BLOCK
      ?auto_317278 - BLOCK
      ?auto_317279 - BLOCK
      ?auto_317280 - BLOCK
      ?auto_317281 - BLOCK
      ?auto_317282 - BLOCK
      ?auto_317283 - BLOCK
      ?auto_317284 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_317284 ) ( ON-TABLE ?auto_317271 ) ( ON ?auto_317272 ?auto_317271 ) ( ON ?auto_317273 ?auto_317272 ) ( ON ?auto_317274 ?auto_317273 ) ( ON ?auto_317275 ?auto_317274 ) ( ON ?auto_317276 ?auto_317275 ) ( ON ?auto_317277 ?auto_317276 ) ( ON ?auto_317278 ?auto_317277 ) ( not ( = ?auto_317271 ?auto_317272 ) ) ( not ( = ?auto_317271 ?auto_317273 ) ) ( not ( = ?auto_317271 ?auto_317274 ) ) ( not ( = ?auto_317271 ?auto_317275 ) ) ( not ( = ?auto_317271 ?auto_317276 ) ) ( not ( = ?auto_317271 ?auto_317277 ) ) ( not ( = ?auto_317271 ?auto_317278 ) ) ( not ( = ?auto_317271 ?auto_317279 ) ) ( not ( = ?auto_317271 ?auto_317280 ) ) ( not ( = ?auto_317271 ?auto_317281 ) ) ( not ( = ?auto_317271 ?auto_317282 ) ) ( not ( = ?auto_317271 ?auto_317283 ) ) ( not ( = ?auto_317271 ?auto_317284 ) ) ( not ( = ?auto_317272 ?auto_317273 ) ) ( not ( = ?auto_317272 ?auto_317274 ) ) ( not ( = ?auto_317272 ?auto_317275 ) ) ( not ( = ?auto_317272 ?auto_317276 ) ) ( not ( = ?auto_317272 ?auto_317277 ) ) ( not ( = ?auto_317272 ?auto_317278 ) ) ( not ( = ?auto_317272 ?auto_317279 ) ) ( not ( = ?auto_317272 ?auto_317280 ) ) ( not ( = ?auto_317272 ?auto_317281 ) ) ( not ( = ?auto_317272 ?auto_317282 ) ) ( not ( = ?auto_317272 ?auto_317283 ) ) ( not ( = ?auto_317272 ?auto_317284 ) ) ( not ( = ?auto_317273 ?auto_317274 ) ) ( not ( = ?auto_317273 ?auto_317275 ) ) ( not ( = ?auto_317273 ?auto_317276 ) ) ( not ( = ?auto_317273 ?auto_317277 ) ) ( not ( = ?auto_317273 ?auto_317278 ) ) ( not ( = ?auto_317273 ?auto_317279 ) ) ( not ( = ?auto_317273 ?auto_317280 ) ) ( not ( = ?auto_317273 ?auto_317281 ) ) ( not ( = ?auto_317273 ?auto_317282 ) ) ( not ( = ?auto_317273 ?auto_317283 ) ) ( not ( = ?auto_317273 ?auto_317284 ) ) ( not ( = ?auto_317274 ?auto_317275 ) ) ( not ( = ?auto_317274 ?auto_317276 ) ) ( not ( = ?auto_317274 ?auto_317277 ) ) ( not ( = ?auto_317274 ?auto_317278 ) ) ( not ( = ?auto_317274 ?auto_317279 ) ) ( not ( = ?auto_317274 ?auto_317280 ) ) ( not ( = ?auto_317274 ?auto_317281 ) ) ( not ( = ?auto_317274 ?auto_317282 ) ) ( not ( = ?auto_317274 ?auto_317283 ) ) ( not ( = ?auto_317274 ?auto_317284 ) ) ( not ( = ?auto_317275 ?auto_317276 ) ) ( not ( = ?auto_317275 ?auto_317277 ) ) ( not ( = ?auto_317275 ?auto_317278 ) ) ( not ( = ?auto_317275 ?auto_317279 ) ) ( not ( = ?auto_317275 ?auto_317280 ) ) ( not ( = ?auto_317275 ?auto_317281 ) ) ( not ( = ?auto_317275 ?auto_317282 ) ) ( not ( = ?auto_317275 ?auto_317283 ) ) ( not ( = ?auto_317275 ?auto_317284 ) ) ( not ( = ?auto_317276 ?auto_317277 ) ) ( not ( = ?auto_317276 ?auto_317278 ) ) ( not ( = ?auto_317276 ?auto_317279 ) ) ( not ( = ?auto_317276 ?auto_317280 ) ) ( not ( = ?auto_317276 ?auto_317281 ) ) ( not ( = ?auto_317276 ?auto_317282 ) ) ( not ( = ?auto_317276 ?auto_317283 ) ) ( not ( = ?auto_317276 ?auto_317284 ) ) ( not ( = ?auto_317277 ?auto_317278 ) ) ( not ( = ?auto_317277 ?auto_317279 ) ) ( not ( = ?auto_317277 ?auto_317280 ) ) ( not ( = ?auto_317277 ?auto_317281 ) ) ( not ( = ?auto_317277 ?auto_317282 ) ) ( not ( = ?auto_317277 ?auto_317283 ) ) ( not ( = ?auto_317277 ?auto_317284 ) ) ( not ( = ?auto_317278 ?auto_317279 ) ) ( not ( = ?auto_317278 ?auto_317280 ) ) ( not ( = ?auto_317278 ?auto_317281 ) ) ( not ( = ?auto_317278 ?auto_317282 ) ) ( not ( = ?auto_317278 ?auto_317283 ) ) ( not ( = ?auto_317278 ?auto_317284 ) ) ( not ( = ?auto_317279 ?auto_317280 ) ) ( not ( = ?auto_317279 ?auto_317281 ) ) ( not ( = ?auto_317279 ?auto_317282 ) ) ( not ( = ?auto_317279 ?auto_317283 ) ) ( not ( = ?auto_317279 ?auto_317284 ) ) ( not ( = ?auto_317280 ?auto_317281 ) ) ( not ( = ?auto_317280 ?auto_317282 ) ) ( not ( = ?auto_317280 ?auto_317283 ) ) ( not ( = ?auto_317280 ?auto_317284 ) ) ( not ( = ?auto_317281 ?auto_317282 ) ) ( not ( = ?auto_317281 ?auto_317283 ) ) ( not ( = ?auto_317281 ?auto_317284 ) ) ( not ( = ?auto_317282 ?auto_317283 ) ) ( not ( = ?auto_317282 ?auto_317284 ) ) ( not ( = ?auto_317283 ?auto_317284 ) ) ( ON ?auto_317283 ?auto_317284 ) ( ON ?auto_317282 ?auto_317283 ) ( ON ?auto_317281 ?auto_317282 ) ( ON ?auto_317280 ?auto_317281 ) ( CLEAR ?auto_317278 ) ( ON ?auto_317279 ?auto_317280 ) ( CLEAR ?auto_317279 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_317271 ?auto_317272 ?auto_317273 ?auto_317274 ?auto_317275 ?auto_317276 ?auto_317277 ?auto_317278 ?auto_317279 )
      ( MAKE-14PILE ?auto_317271 ?auto_317272 ?auto_317273 ?auto_317274 ?auto_317275 ?auto_317276 ?auto_317277 ?auto_317278 ?auto_317279 ?auto_317280 ?auto_317281 ?auto_317282 ?auto_317283 ?auto_317284 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_317299 - BLOCK
      ?auto_317300 - BLOCK
      ?auto_317301 - BLOCK
      ?auto_317302 - BLOCK
      ?auto_317303 - BLOCK
      ?auto_317304 - BLOCK
      ?auto_317305 - BLOCK
      ?auto_317306 - BLOCK
      ?auto_317307 - BLOCK
      ?auto_317308 - BLOCK
      ?auto_317309 - BLOCK
      ?auto_317310 - BLOCK
      ?auto_317311 - BLOCK
      ?auto_317312 - BLOCK
    )
    :vars
    (
      ?auto_317313 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_317312 ?auto_317313 ) ( ON-TABLE ?auto_317299 ) ( ON ?auto_317300 ?auto_317299 ) ( ON ?auto_317301 ?auto_317300 ) ( ON ?auto_317302 ?auto_317301 ) ( ON ?auto_317303 ?auto_317302 ) ( ON ?auto_317304 ?auto_317303 ) ( ON ?auto_317305 ?auto_317304 ) ( not ( = ?auto_317299 ?auto_317300 ) ) ( not ( = ?auto_317299 ?auto_317301 ) ) ( not ( = ?auto_317299 ?auto_317302 ) ) ( not ( = ?auto_317299 ?auto_317303 ) ) ( not ( = ?auto_317299 ?auto_317304 ) ) ( not ( = ?auto_317299 ?auto_317305 ) ) ( not ( = ?auto_317299 ?auto_317306 ) ) ( not ( = ?auto_317299 ?auto_317307 ) ) ( not ( = ?auto_317299 ?auto_317308 ) ) ( not ( = ?auto_317299 ?auto_317309 ) ) ( not ( = ?auto_317299 ?auto_317310 ) ) ( not ( = ?auto_317299 ?auto_317311 ) ) ( not ( = ?auto_317299 ?auto_317312 ) ) ( not ( = ?auto_317299 ?auto_317313 ) ) ( not ( = ?auto_317300 ?auto_317301 ) ) ( not ( = ?auto_317300 ?auto_317302 ) ) ( not ( = ?auto_317300 ?auto_317303 ) ) ( not ( = ?auto_317300 ?auto_317304 ) ) ( not ( = ?auto_317300 ?auto_317305 ) ) ( not ( = ?auto_317300 ?auto_317306 ) ) ( not ( = ?auto_317300 ?auto_317307 ) ) ( not ( = ?auto_317300 ?auto_317308 ) ) ( not ( = ?auto_317300 ?auto_317309 ) ) ( not ( = ?auto_317300 ?auto_317310 ) ) ( not ( = ?auto_317300 ?auto_317311 ) ) ( not ( = ?auto_317300 ?auto_317312 ) ) ( not ( = ?auto_317300 ?auto_317313 ) ) ( not ( = ?auto_317301 ?auto_317302 ) ) ( not ( = ?auto_317301 ?auto_317303 ) ) ( not ( = ?auto_317301 ?auto_317304 ) ) ( not ( = ?auto_317301 ?auto_317305 ) ) ( not ( = ?auto_317301 ?auto_317306 ) ) ( not ( = ?auto_317301 ?auto_317307 ) ) ( not ( = ?auto_317301 ?auto_317308 ) ) ( not ( = ?auto_317301 ?auto_317309 ) ) ( not ( = ?auto_317301 ?auto_317310 ) ) ( not ( = ?auto_317301 ?auto_317311 ) ) ( not ( = ?auto_317301 ?auto_317312 ) ) ( not ( = ?auto_317301 ?auto_317313 ) ) ( not ( = ?auto_317302 ?auto_317303 ) ) ( not ( = ?auto_317302 ?auto_317304 ) ) ( not ( = ?auto_317302 ?auto_317305 ) ) ( not ( = ?auto_317302 ?auto_317306 ) ) ( not ( = ?auto_317302 ?auto_317307 ) ) ( not ( = ?auto_317302 ?auto_317308 ) ) ( not ( = ?auto_317302 ?auto_317309 ) ) ( not ( = ?auto_317302 ?auto_317310 ) ) ( not ( = ?auto_317302 ?auto_317311 ) ) ( not ( = ?auto_317302 ?auto_317312 ) ) ( not ( = ?auto_317302 ?auto_317313 ) ) ( not ( = ?auto_317303 ?auto_317304 ) ) ( not ( = ?auto_317303 ?auto_317305 ) ) ( not ( = ?auto_317303 ?auto_317306 ) ) ( not ( = ?auto_317303 ?auto_317307 ) ) ( not ( = ?auto_317303 ?auto_317308 ) ) ( not ( = ?auto_317303 ?auto_317309 ) ) ( not ( = ?auto_317303 ?auto_317310 ) ) ( not ( = ?auto_317303 ?auto_317311 ) ) ( not ( = ?auto_317303 ?auto_317312 ) ) ( not ( = ?auto_317303 ?auto_317313 ) ) ( not ( = ?auto_317304 ?auto_317305 ) ) ( not ( = ?auto_317304 ?auto_317306 ) ) ( not ( = ?auto_317304 ?auto_317307 ) ) ( not ( = ?auto_317304 ?auto_317308 ) ) ( not ( = ?auto_317304 ?auto_317309 ) ) ( not ( = ?auto_317304 ?auto_317310 ) ) ( not ( = ?auto_317304 ?auto_317311 ) ) ( not ( = ?auto_317304 ?auto_317312 ) ) ( not ( = ?auto_317304 ?auto_317313 ) ) ( not ( = ?auto_317305 ?auto_317306 ) ) ( not ( = ?auto_317305 ?auto_317307 ) ) ( not ( = ?auto_317305 ?auto_317308 ) ) ( not ( = ?auto_317305 ?auto_317309 ) ) ( not ( = ?auto_317305 ?auto_317310 ) ) ( not ( = ?auto_317305 ?auto_317311 ) ) ( not ( = ?auto_317305 ?auto_317312 ) ) ( not ( = ?auto_317305 ?auto_317313 ) ) ( not ( = ?auto_317306 ?auto_317307 ) ) ( not ( = ?auto_317306 ?auto_317308 ) ) ( not ( = ?auto_317306 ?auto_317309 ) ) ( not ( = ?auto_317306 ?auto_317310 ) ) ( not ( = ?auto_317306 ?auto_317311 ) ) ( not ( = ?auto_317306 ?auto_317312 ) ) ( not ( = ?auto_317306 ?auto_317313 ) ) ( not ( = ?auto_317307 ?auto_317308 ) ) ( not ( = ?auto_317307 ?auto_317309 ) ) ( not ( = ?auto_317307 ?auto_317310 ) ) ( not ( = ?auto_317307 ?auto_317311 ) ) ( not ( = ?auto_317307 ?auto_317312 ) ) ( not ( = ?auto_317307 ?auto_317313 ) ) ( not ( = ?auto_317308 ?auto_317309 ) ) ( not ( = ?auto_317308 ?auto_317310 ) ) ( not ( = ?auto_317308 ?auto_317311 ) ) ( not ( = ?auto_317308 ?auto_317312 ) ) ( not ( = ?auto_317308 ?auto_317313 ) ) ( not ( = ?auto_317309 ?auto_317310 ) ) ( not ( = ?auto_317309 ?auto_317311 ) ) ( not ( = ?auto_317309 ?auto_317312 ) ) ( not ( = ?auto_317309 ?auto_317313 ) ) ( not ( = ?auto_317310 ?auto_317311 ) ) ( not ( = ?auto_317310 ?auto_317312 ) ) ( not ( = ?auto_317310 ?auto_317313 ) ) ( not ( = ?auto_317311 ?auto_317312 ) ) ( not ( = ?auto_317311 ?auto_317313 ) ) ( not ( = ?auto_317312 ?auto_317313 ) ) ( ON ?auto_317311 ?auto_317312 ) ( ON ?auto_317310 ?auto_317311 ) ( ON ?auto_317309 ?auto_317310 ) ( ON ?auto_317308 ?auto_317309 ) ( ON ?auto_317307 ?auto_317308 ) ( CLEAR ?auto_317305 ) ( ON ?auto_317306 ?auto_317307 ) ( CLEAR ?auto_317306 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_317299 ?auto_317300 ?auto_317301 ?auto_317302 ?auto_317303 ?auto_317304 ?auto_317305 ?auto_317306 )
      ( MAKE-14PILE ?auto_317299 ?auto_317300 ?auto_317301 ?auto_317302 ?auto_317303 ?auto_317304 ?auto_317305 ?auto_317306 ?auto_317307 ?auto_317308 ?auto_317309 ?auto_317310 ?auto_317311 ?auto_317312 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_317328 - BLOCK
      ?auto_317329 - BLOCK
      ?auto_317330 - BLOCK
      ?auto_317331 - BLOCK
      ?auto_317332 - BLOCK
      ?auto_317333 - BLOCK
      ?auto_317334 - BLOCK
      ?auto_317335 - BLOCK
      ?auto_317336 - BLOCK
      ?auto_317337 - BLOCK
      ?auto_317338 - BLOCK
      ?auto_317339 - BLOCK
      ?auto_317340 - BLOCK
      ?auto_317341 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_317341 ) ( ON-TABLE ?auto_317328 ) ( ON ?auto_317329 ?auto_317328 ) ( ON ?auto_317330 ?auto_317329 ) ( ON ?auto_317331 ?auto_317330 ) ( ON ?auto_317332 ?auto_317331 ) ( ON ?auto_317333 ?auto_317332 ) ( ON ?auto_317334 ?auto_317333 ) ( not ( = ?auto_317328 ?auto_317329 ) ) ( not ( = ?auto_317328 ?auto_317330 ) ) ( not ( = ?auto_317328 ?auto_317331 ) ) ( not ( = ?auto_317328 ?auto_317332 ) ) ( not ( = ?auto_317328 ?auto_317333 ) ) ( not ( = ?auto_317328 ?auto_317334 ) ) ( not ( = ?auto_317328 ?auto_317335 ) ) ( not ( = ?auto_317328 ?auto_317336 ) ) ( not ( = ?auto_317328 ?auto_317337 ) ) ( not ( = ?auto_317328 ?auto_317338 ) ) ( not ( = ?auto_317328 ?auto_317339 ) ) ( not ( = ?auto_317328 ?auto_317340 ) ) ( not ( = ?auto_317328 ?auto_317341 ) ) ( not ( = ?auto_317329 ?auto_317330 ) ) ( not ( = ?auto_317329 ?auto_317331 ) ) ( not ( = ?auto_317329 ?auto_317332 ) ) ( not ( = ?auto_317329 ?auto_317333 ) ) ( not ( = ?auto_317329 ?auto_317334 ) ) ( not ( = ?auto_317329 ?auto_317335 ) ) ( not ( = ?auto_317329 ?auto_317336 ) ) ( not ( = ?auto_317329 ?auto_317337 ) ) ( not ( = ?auto_317329 ?auto_317338 ) ) ( not ( = ?auto_317329 ?auto_317339 ) ) ( not ( = ?auto_317329 ?auto_317340 ) ) ( not ( = ?auto_317329 ?auto_317341 ) ) ( not ( = ?auto_317330 ?auto_317331 ) ) ( not ( = ?auto_317330 ?auto_317332 ) ) ( not ( = ?auto_317330 ?auto_317333 ) ) ( not ( = ?auto_317330 ?auto_317334 ) ) ( not ( = ?auto_317330 ?auto_317335 ) ) ( not ( = ?auto_317330 ?auto_317336 ) ) ( not ( = ?auto_317330 ?auto_317337 ) ) ( not ( = ?auto_317330 ?auto_317338 ) ) ( not ( = ?auto_317330 ?auto_317339 ) ) ( not ( = ?auto_317330 ?auto_317340 ) ) ( not ( = ?auto_317330 ?auto_317341 ) ) ( not ( = ?auto_317331 ?auto_317332 ) ) ( not ( = ?auto_317331 ?auto_317333 ) ) ( not ( = ?auto_317331 ?auto_317334 ) ) ( not ( = ?auto_317331 ?auto_317335 ) ) ( not ( = ?auto_317331 ?auto_317336 ) ) ( not ( = ?auto_317331 ?auto_317337 ) ) ( not ( = ?auto_317331 ?auto_317338 ) ) ( not ( = ?auto_317331 ?auto_317339 ) ) ( not ( = ?auto_317331 ?auto_317340 ) ) ( not ( = ?auto_317331 ?auto_317341 ) ) ( not ( = ?auto_317332 ?auto_317333 ) ) ( not ( = ?auto_317332 ?auto_317334 ) ) ( not ( = ?auto_317332 ?auto_317335 ) ) ( not ( = ?auto_317332 ?auto_317336 ) ) ( not ( = ?auto_317332 ?auto_317337 ) ) ( not ( = ?auto_317332 ?auto_317338 ) ) ( not ( = ?auto_317332 ?auto_317339 ) ) ( not ( = ?auto_317332 ?auto_317340 ) ) ( not ( = ?auto_317332 ?auto_317341 ) ) ( not ( = ?auto_317333 ?auto_317334 ) ) ( not ( = ?auto_317333 ?auto_317335 ) ) ( not ( = ?auto_317333 ?auto_317336 ) ) ( not ( = ?auto_317333 ?auto_317337 ) ) ( not ( = ?auto_317333 ?auto_317338 ) ) ( not ( = ?auto_317333 ?auto_317339 ) ) ( not ( = ?auto_317333 ?auto_317340 ) ) ( not ( = ?auto_317333 ?auto_317341 ) ) ( not ( = ?auto_317334 ?auto_317335 ) ) ( not ( = ?auto_317334 ?auto_317336 ) ) ( not ( = ?auto_317334 ?auto_317337 ) ) ( not ( = ?auto_317334 ?auto_317338 ) ) ( not ( = ?auto_317334 ?auto_317339 ) ) ( not ( = ?auto_317334 ?auto_317340 ) ) ( not ( = ?auto_317334 ?auto_317341 ) ) ( not ( = ?auto_317335 ?auto_317336 ) ) ( not ( = ?auto_317335 ?auto_317337 ) ) ( not ( = ?auto_317335 ?auto_317338 ) ) ( not ( = ?auto_317335 ?auto_317339 ) ) ( not ( = ?auto_317335 ?auto_317340 ) ) ( not ( = ?auto_317335 ?auto_317341 ) ) ( not ( = ?auto_317336 ?auto_317337 ) ) ( not ( = ?auto_317336 ?auto_317338 ) ) ( not ( = ?auto_317336 ?auto_317339 ) ) ( not ( = ?auto_317336 ?auto_317340 ) ) ( not ( = ?auto_317336 ?auto_317341 ) ) ( not ( = ?auto_317337 ?auto_317338 ) ) ( not ( = ?auto_317337 ?auto_317339 ) ) ( not ( = ?auto_317337 ?auto_317340 ) ) ( not ( = ?auto_317337 ?auto_317341 ) ) ( not ( = ?auto_317338 ?auto_317339 ) ) ( not ( = ?auto_317338 ?auto_317340 ) ) ( not ( = ?auto_317338 ?auto_317341 ) ) ( not ( = ?auto_317339 ?auto_317340 ) ) ( not ( = ?auto_317339 ?auto_317341 ) ) ( not ( = ?auto_317340 ?auto_317341 ) ) ( ON ?auto_317340 ?auto_317341 ) ( ON ?auto_317339 ?auto_317340 ) ( ON ?auto_317338 ?auto_317339 ) ( ON ?auto_317337 ?auto_317338 ) ( ON ?auto_317336 ?auto_317337 ) ( CLEAR ?auto_317334 ) ( ON ?auto_317335 ?auto_317336 ) ( CLEAR ?auto_317335 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_317328 ?auto_317329 ?auto_317330 ?auto_317331 ?auto_317332 ?auto_317333 ?auto_317334 ?auto_317335 )
      ( MAKE-14PILE ?auto_317328 ?auto_317329 ?auto_317330 ?auto_317331 ?auto_317332 ?auto_317333 ?auto_317334 ?auto_317335 ?auto_317336 ?auto_317337 ?auto_317338 ?auto_317339 ?auto_317340 ?auto_317341 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_317356 - BLOCK
      ?auto_317357 - BLOCK
      ?auto_317358 - BLOCK
      ?auto_317359 - BLOCK
      ?auto_317360 - BLOCK
      ?auto_317361 - BLOCK
      ?auto_317362 - BLOCK
      ?auto_317363 - BLOCK
      ?auto_317364 - BLOCK
      ?auto_317365 - BLOCK
      ?auto_317366 - BLOCK
      ?auto_317367 - BLOCK
      ?auto_317368 - BLOCK
      ?auto_317369 - BLOCK
    )
    :vars
    (
      ?auto_317370 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_317369 ?auto_317370 ) ( ON-TABLE ?auto_317356 ) ( ON ?auto_317357 ?auto_317356 ) ( ON ?auto_317358 ?auto_317357 ) ( ON ?auto_317359 ?auto_317358 ) ( ON ?auto_317360 ?auto_317359 ) ( ON ?auto_317361 ?auto_317360 ) ( not ( = ?auto_317356 ?auto_317357 ) ) ( not ( = ?auto_317356 ?auto_317358 ) ) ( not ( = ?auto_317356 ?auto_317359 ) ) ( not ( = ?auto_317356 ?auto_317360 ) ) ( not ( = ?auto_317356 ?auto_317361 ) ) ( not ( = ?auto_317356 ?auto_317362 ) ) ( not ( = ?auto_317356 ?auto_317363 ) ) ( not ( = ?auto_317356 ?auto_317364 ) ) ( not ( = ?auto_317356 ?auto_317365 ) ) ( not ( = ?auto_317356 ?auto_317366 ) ) ( not ( = ?auto_317356 ?auto_317367 ) ) ( not ( = ?auto_317356 ?auto_317368 ) ) ( not ( = ?auto_317356 ?auto_317369 ) ) ( not ( = ?auto_317356 ?auto_317370 ) ) ( not ( = ?auto_317357 ?auto_317358 ) ) ( not ( = ?auto_317357 ?auto_317359 ) ) ( not ( = ?auto_317357 ?auto_317360 ) ) ( not ( = ?auto_317357 ?auto_317361 ) ) ( not ( = ?auto_317357 ?auto_317362 ) ) ( not ( = ?auto_317357 ?auto_317363 ) ) ( not ( = ?auto_317357 ?auto_317364 ) ) ( not ( = ?auto_317357 ?auto_317365 ) ) ( not ( = ?auto_317357 ?auto_317366 ) ) ( not ( = ?auto_317357 ?auto_317367 ) ) ( not ( = ?auto_317357 ?auto_317368 ) ) ( not ( = ?auto_317357 ?auto_317369 ) ) ( not ( = ?auto_317357 ?auto_317370 ) ) ( not ( = ?auto_317358 ?auto_317359 ) ) ( not ( = ?auto_317358 ?auto_317360 ) ) ( not ( = ?auto_317358 ?auto_317361 ) ) ( not ( = ?auto_317358 ?auto_317362 ) ) ( not ( = ?auto_317358 ?auto_317363 ) ) ( not ( = ?auto_317358 ?auto_317364 ) ) ( not ( = ?auto_317358 ?auto_317365 ) ) ( not ( = ?auto_317358 ?auto_317366 ) ) ( not ( = ?auto_317358 ?auto_317367 ) ) ( not ( = ?auto_317358 ?auto_317368 ) ) ( not ( = ?auto_317358 ?auto_317369 ) ) ( not ( = ?auto_317358 ?auto_317370 ) ) ( not ( = ?auto_317359 ?auto_317360 ) ) ( not ( = ?auto_317359 ?auto_317361 ) ) ( not ( = ?auto_317359 ?auto_317362 ) ) ( not ( = ?auto_317359 ?auto_317363 ) ) ( not ( = ?auto_317359 ?auto_317364 ) ) ( not ( = ?auto_317359 ?auto_317365 ) ) ( not ( = ?auto_317359 ?auto_317366 ) ) ( not ( = ?auto_317359 ?auto_317367 ) ) ( not ( = ?auto_317359 ?auto_317368 ) ) ( not ( = ?auto_317359 ?auto_317369 ) ) ( not ( = ?auto_317359 ?auto_317370 ) ) ( not ( = ?auto_317360 ?auto_317361 ) ) ( not ( = ?auto_317360 ?auto_317362 ) ) ( not ( = ?auto_317360 ?auto_317363 ) ) ( not ( = ?auto_317360 ?auto_317364 ) ) ( not ( = ?auto_317360 ?auto_317365 ) ) ( not ( = ?auto_317360 ?auto_317366 ) ) ( not ( = ?auto_317360 ?auto_317367 ) ) ( not ( = ?auto_317360 ?auto_317368 ) ) ( not ( = ?auto_317360 ?auto_317369 ) ) ( not ( = ?auto_317360 ?auto_317370 ) ) ( not ( = ?auto_317361 ?auto_317362 ) ) ( not ( = ?auto_317361 ?auto_317363 ) ) ( not ( = ?auto_317361 ?auto_317364 ) ) ( not ( = ?auto_317361 ?auto_317365 ) ) ( not ( = ?auto_317361 ?auto_317366 ) ) ( not ( = ?auto_317361 ?auto_317367 ) ) ( not ( = ?auto_317361 ?auto_317368 ) ) ( not ( = ?auto_317361 ?auto_317369 ) ) ( not ( = ?auto_317361 ?auto_317370 ) ) ( not ( = ?auto_317362 ?auto_317363 ) ) ( not ( = ?auto_317362 ?auto_317364 ) ) ( not ( = ?auto_317362 ?auto_317365 ) ) ( not ( = ?auto_317362 ?auto_317366 ) ) ( not ( = ?auto_317362 ?auto_317367 ) ) ( not ( = ?auto_317362 ?auto_317368 ) ) ( not ( = ?auto_317362 ?auto_317369 ) ) ( not ( = ?auto_317362 ?auto_317370 ) ) ( not ( = ?auto_317363 ?auto_317364 ) ) ( not ( = ?auto_317363 ?auto_317365 ) ) ( not ( = ?auto_317363 ?auto_317366 ) ) ( not ( = ?auto_317363 ?auto_317367 ) ) ( not ( = ?auto_317363 ?auto_317368 ) ) ( not ( = ?auto_317363 ?auto_317369 ) ) ( not ( = ?auto_317363 ?auto_317370 ) ) ( not ( = ?auto_317364 ?auto_317365 ) ) ( not ( = ?auto_317364 ?auto_317366 ) ) ( not ( = ?auto_317364 ?auto_317367 ) ) ( not ( = ?auto_317364 ?auto_317368 ) ) ( not ( = ?auto_317364 ?auto_317369 ) ) ( not ( = ?auto_317364 ?auto_317370 ) ) ( not ( = ?auto_317365 ?auto_317366 ) ) ( not ( = ?auto_317365 ?auto_317367 ) ) ( not ( = ?auto_317365 ?auto_317368 ) ) ( not ( = ?auto_317365 ?auto_317369 ) ) ( not ( = ?auto_317365 ?auto_317370 ) ) ( not ( = ?auto_317366 ?auto_317367 ) ) ( not ( = ?auto_317366 ?auto_317368 ) ) ( not ( = ?auto_317366 ?auto_317369 ) ) ( not ( = ?auto_317366 ?auto_317370 ) ) ( not ( = ?auto_317367 ?auto_317368 ) ) ( not ( = ?auto_317367 ?auto_317369 ) ) ( not ( = ?auto_317367 ?auto_317370 ) ) ( not ( = ?auto_317368 ?auto_317369 ) ) ( not ( = ?auto_317368 ?auto_317370 ) ) ( not ( = ?auto_317369 ?auto_317370 ) ) ( ON ?auto_317368 ?auto_317369 ) ( ON ?auto_317367 ?auto_317368 ) ( ON ?auto_317366 ?auto_317367 ) ( ON ?auto_317365 ?auto_317366 ) ( ON ?auto_317364 ?auto_317365 ) ( ON ?auto_317363 ?auto_317364 ) ( CLEAR ?auto_317361 ) ( ON ?auto_317362 ?auto_317363 ) ( CLEAR ?auto_317362 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_317356 ?auto_317357 ?auto_317358 ?auto_317359 ?auto_317360 ?auto_317361 ?auto_317362 )
      ( MAKE-14PILE ?auto_317356 ?auto_317357 ?auto_317358 ?auto_317359 ?auto_317360 ?auto_317361 ?auto_317362 ?auto_317363 ?auto_317364 ?auto_317365 ?auto_317366 ?auto_317367 ?auto_317368 ?auto_317369 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_317385 - BLOCK
      ?auto_317386 - BLOCK
      ?auto_317387 - BLOCK
      ?auto_317388 - BLOCK
      ?auto_317389 - BLOCK
      ?auto_317390 - BLOCK
      ?auto_317391 - BLOCK
      ?auto_317392 - BLOCK
      ?auto_317393 - BLOCK
      ?auto_317394 - BLOCK
      ?auto_317395 - BLOCK
      ?auto_317396 - BLOCK
      ?auto_317397 - BLOCK
      ?auto_317398 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_317398 ) ( ON-TABLE ?auto_317385 ) ( ON ?auto_317386 ?auto_317385 ) ( ON ?auto_317387 ?auto_317386 ) ( ON ?auto_317388 ?auto_317387 ) ( ON ?auto_317389 ?auto_317388 ) ( ON ?auto_317390 ?auto_317389 ) ( not ( = ?auto_317385 ?auto_317386 ) ) ( not ( = ?auto_317385 ?auto_317387 ) ) ( not ( = ?auto_317385 ?auto_317388 ) ) ( not ( = ?auto_317385 ?auto_317389 ) ) ( not ( = ?auto_317385 ?auto_317390 ) ) ( not ( = ?auto_317385 ?auto_317391 ) ) ( not ( = ?auto_317385 ?auto_317392 ) ) ( not ( = ?auto_317385 ?auto_317393 ) ) ( not ( = ?auto_317385 ?auto_317394 ) ) ( not ( = ?auto_317385 ?auto_317395 ) ) ( not ( = ?auto_317385 ?auto_317396 ) ) ( not ( = ?auto_317385 ?auto_317397 ) ) ( not ( = ?auto_317385 ?auto_317398 ) ) ( not ( = ?auto_317386 ?auto_317387 ) ) ( not ( = ?auto_317386 ?auto_317388 ) ) ( not ( = ?auto_317386 ?auto_317389 ) ) ( not ( = ?auto_317386 ?auto_317390 ) ) ( not ( = ?auto_317386 ?auto_317391 ) ) ( not ( = ?auto_317386 ?auto_317392 ) ) ( not ( = ?auto_317386 ?auto_317393 ) ) ( not ( = ?auto_317386 ?auto_317394 ) ) ( not ( = ?auto_317386 ?auto_317395 ) ) ( not ( = ?auto_317386 ?auto_317396 ) ) ( not ( = ?auto_317386 ?auto_317397 ) ) ( not ( = ?auto_317386 ?auto_317398 ) ) ( not ( = ?auto_317387 ?auto_317388 ) ) ( not ( = ?auto_317387 ?auto_317389 ) ) ( not ( = ?auto_317387 ?auto_317390 ) ) ( not ( = ?auto_317387 ?auto_317391 ) ) ( not ( = ?auto_317387 ?auto_317392 ) ) ( not ( = ?auto_317387 ?auto_317393 ) ) ( not ( = ?auto_317387 ?auto_317394 ) ) ( not ( = ?auto_317387 ?auto_317395 ) ) ( not ( = ?auto_317387 ?auto_317396 ) ) ( not ( = ?auto_317387 ?auto_317397 ) ) ( not ( = ?auto_317387 ?auto_317398 ) ) ( not ( = ?auto_317388 ?auto_317389 ) ) ( not ( = ?auto_317388 ?auto_317390 ) ) ( not ( = ?auto_317388 ?auto_317391 ) ) ( not ( = ?auto_317388 ?auto_317392 ) ) ( not ( = ?auto_317388 ?auto_317393 ) ) ( not ( = ?auto_317388 ?auto_317394 ) ) ( not ( = ?auto_317388 ?auto_317395 ) ) ( not ( = ?auto_317388 ?auto_317396 ) ) ( not ( = ?auto_317388 ?auto_317397 ) ) ( not ( = ?auto_317388 ?auto_317398 ) ) ( not ( = ?auto_317389 ?auto_317390 ) ) ( not ( = ?auto_317389 ?auto_317391 ) ) ( not ( = ?auto_317389 ?auto_317392 ) ) ( not ( = ?auto_317389 ?auto_317393 ) ) ( not ( = ?auto_317389 ?auto_317394 ) ) ( not ( = ?auto_317389 ?auto_317395 ) ) ( not ( = ?auto_317389 ?auto_317396 ) ) ( not ( = ?auto_317389 ?auto_317397 ) ) ( not ( = ?auto_317389 ?auto_317398 ) ) ( not ( = ?auto_317390 ?auto_317391 ) ) ( not ( = ?auto_317390 ?auto_317392 ) ) ( not ( = ?auto_317390 ?auto_317393 ) ) ( not ( = ?auto_317390 ?auto_317394 ) ) ( not ( = ?auto_317390 ?auto_317395 ) ) ( not ( = ?auto_317390 ?auto_317396 ) ) ( not ( = ?auto_317390 ?auto_317397 ) ) ( not ( = ?auto_317390 ?auto_317398 ) ) ( not ( = ?auto_317391 ?auto_317392 ) ) ( not ( = ?auto_317391 ?auto_317393 ) ) ( not ( = ?auto_317391 ?auto_317394 ) ) ( not ( = ?auto_317391 ?auto_317395 ) ) ( not ( = ?auto_317391 ?auto_317396 ) ) ( not ( = ?auto_317391 ?auto_317397 ) ) ( not ( = ?auto_317391 ?auto_317398 ) ) ( not ( = ?auto_317392 ?auto_317393 ) ) ( not ( = ?auto_317392 ?auto_317394 ) ) ( not ( = ?auto_317392 ?auto_317395 ) ) ( not ( = ?auto_317392 ?auto_317396 ) ) ( not ( = ?auto_317392 ?auto_317397 ) ) ( not ( = ?auto_317392 ?auto_317398 ) ) ( not ( = ?auto_317393 ?auto_317394 ) ) ( not ( = ?auto_317393 ?auto_317395 ) ) ( not ( = ?auto_317393 ?auto_317396 ) ) ( not ( = ?auto_317393 ?auto_317397 ) ) ( not ( = ?auto_317393 ?auto_317398 ) ) ( not ( = ?auto_317394 ?auto_317395 ) ) ( not ( = ?auto_317394 ?auto_317396 ) ) ( not ( = ?auto_317394 ?auto_317397 ) ) ( not ( = ?auto_317394 ?auto_317398 ) ) ( not ( = ?auto_317395 ?auto_317396 ) ) ( not ( = ?auto_317395 ?auto_317397 ) ) ( not ( = ?auto_317395 ?auto_317398 ) ) ( not ( = ?auto_317396 ?auto_317397 ) ) ( not ( = ?auto_317396 ?auto_317398 ) ) ( not ( = ?auto_317397 ?auto_317398 ) ) ( ON ?auto_317397 ?auto_317398 ) ( ON ?auto_317396 ?auto_317397 ) ( ON ?auto_317395 ?auto_317396 ) ( ON ?auto_317394 ?auto_317395 ) ( ON ?auto_317393 ?auto_317394 ) ( ON ?auto_317392 ?auto_317393 ) ( CLEAR ?auto_317390 ) ( ON ?auto_317391 ?auto_317392 ) ( CLEAR ?auto_317391 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_317385 ?auto_317386 ?auto_317387 ?auto_317388 ?auto_317389 ?auto_317390 ?auto_317391 )
      ( MAKE-14PILE ?auto_317385 ?auto_317386 ?auto_317387 ?auto_317388 ?auto_317389 ?auto_317390 ?auto_317391 ?auto_317392 ?auto_317393 ?auto_317394 ?auto_317395 ?auto_317396 ?auto_317397 ?auto_317398 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_317413 - BLOCK
      ?auto_317414 - BLOCK
      ?auto_317415 - BLOCK
      ?auto_317416 - BLOCK
      ?auto_317417 - BLOCK
      ?auto_317418 - BLOCK
      ?auto_317419 - BLOCK
      ?auto_317420 - BLOCK
      ?auto_317421 - BLOCK
      ?auto_317422 - BLOCK
      ?auto_317423 - BLOCK
      ?auto_317424 - BLOCK
      ?auto_317425 - BLOCK
      ?auto_317426 - BLOCK
    )
    :vars
    (
      ?auto_317427 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_317426 ?auto_317427 ) ( ON-TABLE ?auto_317413 ) ( ON ?auto_317414 ?auto_317413 ) ( ON ?auto_317415 ?auto_317414 ) ( ON ?auto_317416 ?auto_317415 ) ( ON ?auto_317417 ?auto_317416 ) ( not ( = ?auto_317413 ?auto_317414 ) ) ( not ( = ?auto_317413 ?auto_317415 ) ) ( not ( = ?auto_317413 ?auto_317416 ) ) ( not ( = ?auto_317413 ?auto_317417 ) ) ( not ( = ?auto_317413 ?auto_317418 ) ) ( not ( = ?auto_317413 ?auto_317419 ) ) ( not ( = ?auto_317413 ?auto_317420 ) ) ( not ( = ?auto_317413 ?auto_317421 ) ) ( not ( = ?auto_317413 ?auto_317422 ) ) ( not ( = ?auto_317413 ?auto_317423 ) ) ( not ( = ?auto_317413 ?auto_317424 ) ) ( not ( = ?auto_317413 ?auto_317425 ) ) ( not ( = ?auto_317413 ?auto_317426 ) ) ( not ( = ?auto_317413 ?auto_317427 ) ) ( not ( = ?auto_317414 ?auto_317415 ) ) ( not ( = ?auto_317414 ?auto_317416 ) ) ( not ( = ?auto_317414 ?auto_317417 ) ) ( not ( = ?auto_317414 ?auto_317418 ) ) ( not ( = ?auto_317414 ?auto_317419 ) ) ( not ( = ?auto_317414 ?auto_317420 ) ) ( not ( = ?auto_317414 ?auto_317421 ) ) ( not ( = ?auto_317414 ?auto_317422 ) ) ( not ( = ?auto_317414 ?auto_317423 ) ) ( not ( = ?auto_317414 ?auto_317424 ) ) ( not ( = ?auto_317414 ?auto_317425 ) ) ( not ( = ?auto_317414 ?auto_317426 ) ) ( not ( = ?auto_317414 ?auto_317427 ) ) ( not ( = ?auto_317415 ?auto_317416 ) ) ( not ( = ?auto_317415 ?auto_317417 ) ) ( not ( = ?auto_317415 ?auto_317418 ) ) ( not ( = ?auto_317415 ?auto_317419 ) ) ( not ( = ?auto_317415 ?auto_317420 ) ) ( not ( = ?auto_317415 ?auto_317421 ) ) ( not ( = ?auto_317415 ?auto_317422 ) ) ( not ( = ?auto_317415 ?auto_317423 ) ) ( not ( = ?auto_317415 ?auto_317424 ) ) ( not ( = ?auto_317415 ?auto_317425 ) ) ( not ( = ?auto_317415 ?auto_317426 ) ) ( not ( = ?auto_317415 ?auto_317427 ) ) ( not ( = ?auto_317416 ?auto_317417 ) ) ( not ( = ?auto_317416 ?auto_317418 ) ) ( not ( = ?auto_317416 ?auto_317419 ) ) ( not ( = ?auto_317416 ?auto_317420 ) ) ( not ( = ?auto_317416 ?auto_317421 ) ) ( not ( = ?auto_317416 ?auto_317422 ) ) ( not ( = ?auto_317416 ?auto_317423 ) ) ( not ( = ?auto_317416 ?auto_317424 ) ) ( not ( = ?auto_317416 ?auto_317425 ) ) ( not ( = ?auto_317416 ?auto_317426 ) ) ( not ( = ?auto_317416 ?auto_317427 ) ) ( not ( = ?auto_317417 ?auto_317418 ) ) ( not ( = ?auto_317417 ?auto_317419 ) ) ( not ( = ?auto_317417 ?auto_317420 ) ) ( not ( = ?auto_317417 ?auto_317421 ) ) ( not ( = ?auto_317417 ?auto_317422 ) ) ( not ( = ?auto_317417 ?auto_317423 ) ) ( not ( = ?auto_317417 ?auto_317424 ) ) ( not ( = ?auto_317417 ?auto_317425 ) ) ( not ( = ?auto_317417 ?auto_317426 ) ) ( not ( = ?auto_317417 ?auto_317427 ) ) ( not ( = ?auto_317418 ?auto_317419 ) ) ( not ( = ?auto_317418 ?auto_317420 ) ) ( not ( = ?auto_317418 ?auto_317421 ) ) ( not ( = ?auto_317418 ?auto_317422 ) ) ( not ( = ?auto_317418 ?auto_317423 ) ) ( not ( = ?auto_317418 ?auto_317424 ) ) ( not ( = ?auto_317418 ?auto_317425 ) ) ( not ( = ?auto_317418 ?auto_317426 ) ) ( not ( = ?auto_317418 ?auto_317427 ) ) ( not ( = ?auto_317419 ?auto_317420 ) ) ( not ( = ?auto_317419 ?auto_317421 ) ) ( not ( = ?auto_317419 ?auto_317422 ) ) ( not ( = ?auto_317419 ?auto_317423 ) ) ( not ( = ?auto_317419 ?auto_317424 ) ) ( not ( = ?auto_317419 ?auto_317425 ) ) ( not ( = ?auto_317419 ?auto_317426 ) ) ( not ( = ?auto_317419 ?auto_317427 ) ) ( not ( = ?auto_317420 ?auto_317421 ) ) ( not ( = ?auto_317420 ?auto_317422 ) ) ( not ( = ?auto_317420 ?auto_317423 ) ) ( not ( = ?auto_317420 ?auto_317424 ) ) ( not ( = ?auto_317420 ?auto_317425 ) ) ( not ( = ?auto_317420 ?auto_317426 ) ) ( not ( = ?auto_317420 ?auto_317427 ) ) ( not ( = ?auto_317421 ?auto_317422 ) ) ( not ( = ?auto_317421 ?auto_317423 ) ) ( not ( = ?auto_317421 ?auto_317424 ) ) ( not ( = ?auto_317421 ?auto_317425 ) ) ( not ( = ?auto_317421 ?auto_317426 ) ) ( not ( = ?auto_317421 ?auto_317427 ) ) ( not ( = ?auto_317422 ?auto_317423 ) ) ( not ( = ?auto_317422 ?auto_317424 ) ) ( not ( = ?auto_317422 ?auto_317425 ) ) ( not ( = ?auto_317422 ?auto_317426 ) ) ( not ( = ?auto_317422 ?auto_317427 ) ) ( not ( = ?auto_317423 ?auto_317424 ) ) ( not ( = ?auto_317423 ?auto_317425 ) ) ( not ( = ?auto_317423 ?auto_317426 ) ) ( not ( = ?auto_317423 ?auto_317427 ) ) ( not ( = ?auto_317424 ?auto_317425 ) ) ( not ( = ?auto_317424 ?auto_317426 ) ) ( not ( = ?auto_317424 ?auto_317427 ) ) ( not ( = ?auto_317425 ?auto_317426 ) ) ( not ( = ?auto_317425 ?auto_317427 ) ) ( not ( = ?auto_317426 ?auto_317427 ) ) ( ON ?auto_317425 ?auto_317426 ) ( ON ?auto_317424 ?auto_317425 ) ( ON ?auto_317423 ?auto_317424 ) ( ON ?auto_317422 ?auto_317423 ) ( ON ?auto_317421 ?auto_317422 ) ( ON ?auto_317420 ?auto_317421 ) ( ON ?auto_317419 ?auto_317420 ) ( CLEAR ?auto_317417 ) ( ON ?auto_317418 ?auto_317419 ) ( CLEAR ?auto_317418 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_317413 ?auto_317414 ?auto_317415 ?auto_317416 ?auto_317417 ?auto_317418 )
      ( MAKE-14PILE ?auto_317413 ?auto_317414 ?auto_317415 ?auto_317416 ?auto_317417 ?auto_317418 ?auto_317419 ?auto_317420 ?auto_317421 ?auto_317422 ?auto_317423 ?auto_317424 ?auto_317425 ?auto_317426 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_317442 - BLOCK
      ?auto_317443 - BLOCK
      ?auto_317444 - BLOCK
      ?auto_317445 - BLOCK
      ?auto_317446 - BLOCK
      ?auto_317447 - BLOCK
      ?auto_317448 - BLOCK
      ?auto_317449 - BLOCK
      ?auto_317450 - BLOCK
      ?auto_317451 - BLOCK
      ?auto_317452 - BLOCK
      ?auto_317453 - BLOCK
      ?auto_317454 - BLOCK
      ?auto_317455 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_317455 ) ( ON-TABLE ?auto_317442 ) ( ON ?auto_317443 ?auto_317442 ) ( ON ?auto_317444 ?auto_317443 ) ( ON ?auto_317445 ?auto_317444 ) ( ON ?auto_317446 ?auto_317445 ) ( not ( = ?auto_317442 ?auto_317443 ) ) ( not ( = ?auto_317442 ?auto_317444 ) ) ( not ( = ?auto_317442 ?auto_317445 ) ) ( not ( = ?auto_317442 ?auto_317446 ) ) ( not ( = ?auto_317442 ?auto_317447 ) ) ( not ( = ?auto_317442 ?auto_317448 ) ) ( not ( = ?auto_317442 ?auto_317449 ) ) ( not ( = ?auto_317442 ?auto_317450 ) ) ( not ( = ?auto_317442 ?auto_317451 ) ) ( not ( = ?auto_317442 ?auto_317452 ) ) ( not ( = ?auto_317442 ?auto_317453 ) ) ( not ( = ?auto_317442 ?auto_317454 ) ) ( not ( = ?auto_317442 ?auto_317455 ) ) ( not ( = ?auto_317443 ?auto_317444 ) ) ( not ( = ?auto_317443 ?auto_317445 ) ) ( not ( = ?auto_317443 ?auto_317446 ) ) ( not ( = ?auto_317443 ?auto_317447 ) ) ( not ( = ?auto_317443 ?auto_317448 ) ) ( not ( = ?auto_317443 ?auto_317449 ) ) ( not ( = ?auto_317443 ?auto_317450 ) ) ( not ( = ?auto_317443 ?auto_317451 ) ) ( not ( = ?auto_317443 ?auto_317452 ) ) ( not ( = ?auto_317443 ?auto_317453 ) ) ( not ( = ?auto_317443 ?auto_317454 ) ) ( not ( = ?auto_317443 ?auto_317455 ) ) ( not ( = ?auto_317444 ?auto_317445 ) ) ( not ( = ?auto_317444 ?auto_317446 ) ) ( not ( = ?auto_317444 ?auto_317447 ) ) ( not ( = ?auto_317444 ?auto_317448 ) ) ( not ( = ?auto_317444 ?auto_317449 ) ) ( not ( = ?auto_317444 ?auto_317450 ) ) ( not ( = ?auto_317444 ?auto_317451 ) ) ( not ( = ?auto_317444 ?auto_317452 ) ) ( not ( = ?auto_317444 ?auto_317453 ) ) ( not ( = ?auto_317444 ?auto_317454 ) ) ( not ( = ?auto_317444 ?auto_317455 ) ) ( not ( = ?auto_317445 ?auto_317446 ) ) ( not ( = ?auto_317445 ?auto_317447 ) ) ( not ( = ?auto_317445 ?auto_317448 ) ) ( not ( = ?auto_317445 ?auto_317449 ) ) ( not ( = ?auto_317445 ?auto_317450 ) ) ( not ( = ?auto_317445 ?auto_317451 ) ) ( not ( = ?auto_317445 ?auto_317452 ) ) ( not ( = ?auto_317445 ?auto_317453 ) ) ( not ( = ?auto_317445 ?auto_317454 ) ) ( not ( = ?auto_317445 ?auto_317455 ) ) ( not ( = ?auto_317446 ?auto_317447 ) ) ( not ( = ?auto_317446 ?auto_317448 ) ) ( not ( = ?auto_317446 ?auto_317449 ) ) ( not ( = ?auto_317446 ?auto_317450 ) ) ( not ( = ?auto_317446 ?auto_317451 ) ) ( not ( = ?auto_317446 ?auto_317452 ) ) ( not ( = ?auto_317446 ?auto_317453 ) ) ( not ( = ?auto_317446 ?auto_317454 ) ) ( not ( = ?auto_317446 ?auto_317455 ) ) ( not ( = ?auto_317447 ?auto_317448 ) ) ( not ( = ?auto_317447 ?auto_317449 ) ) ( not ( = ?auto_317447 ?auto_317450 ) ) ( not ( = ?auto_317447 ?auto_317451 ) ) ( not ( = ?auto_317447 ?auto_317452 ) ) ( not ( = ?auto_317447 ?auto_317453 ) ) ( not ( = ?auto_317447 ?auto_317454 ) ) ( not ( = ?auto_317447 ?auto_317455 ) ) ( not ( = ?auto_317448 ?auto_317449 ) ) ( not ( = ?auto_317448 ?auto_317450 ) ) ( not ( = ?auto_317448 ?auto_317451 ) ) ( not ( = ?auto_317448 ?auto_317452 ) ) ( not ( = ?auto_317448 ?auto_317453 ) ) ( not ( = ?auto_317448 ?auto_317454 ) ) ( not ( = ?auto_317448 ?auto_317455 ) ) ( not ( = ?auto_317449 ?auto_317450 ) ) ( not ( = ?auto_317449 ?auto_317451 ) ) ( not ( = ?auto_317449 ?auto_317452 ) ) ( not ( = ?auto_317449 ?auto_317453 ) ) ( not ( = ?auto_317449 ?auto_317454 ) ) ( not ( = ?auto_317449 ?auto_317455 ) ) ( not ( = ?auto_317450 ?auto_317451 ) ) ( not ( = ?auto_317450 ?auto_317452 ) ) ( not ( = ?auto_317450 ?auto_317453 ) ) ( not ( = ?auto_317450 ?auto_317454 ) ) ( not ( = ?auto_317450 ?auto_317455 ) ) ( not ( = ?auto_317451 ?auto_317452 ) ) ( not ( = ?auto_317451 ?auto_317453 ) ) ( not ( = ?auto_317451 ?auto_317454 ) ) ( not ( = ?auto_317451 ?auto_317455 ) ) ( not ( = ?auto_317452 ?auto_317453 ) ) ( not ( = ?auto_317452 ?auto_317454 ) ) ( not ( = ?auto_317452 ?auto_317455 ) ) ( not ( = ?auto_317453 ?auto_317454 ) ) ( not ( = ?auto_317453 ?auto_317455 ) ) ( not ( = ?auto_317454 ?auto_317455 ) ) ( ON ?auto_317454 ?auto_317455 ) ( ON ?auto_317453 ?auto_317454 ) ( ON ?auto_317452 ?auto_317453 ) ( ON ?auto_317451 ?auto_317452 ) ( ON ?auto_317450 ?auto_317451 ) ( ON ?auto_317449 ?auto_317450 ) ( ON ?auto_317448 ?auto_317449 ) ( CLEAR ?auto_317446 ) ( ON ?auto_317447 ?auto_317448 ) ( CLEAR ?auto_317447 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_317442 ?auto_317443 ?auto_317444 ?auto_317445 ?auto_317446 ?auto_317447 )
      ( MAKE-14PILE ?auto_317442 ?auto_317443 ?auto_317444 ?auto_317445 ?auto_317446 ?auto_317447 ?auto_317448 ?auto_317449 ?auto_317450 ?auto_317451 ?auto_317452 ?auto_317453 ?auto_317454 ?auto_317455 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_317470 - BLOCK
      ?auto_317471 - BLOCK
      ?auto_317472 - BLOCK
      ?auto_317473 - BLOCK
      ?auto_317474 - BLOCK
      ?auto_317475 - BLOCK
      ?auto_317476 - BLOCK
      ?auto_317477 - BLOCK
      ?auto_317478 - BLOCK
      ?auto_317479 - BLOCK
      ?auto_317480 - BLOCK
      ?auto_317481 - BLOCK
      ?auto_317482 - BLOCK
      ?auto_317483 - BLOCK
    )
    :vars
    (
      ?auto_317484 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_317483 ?auto_317484 ) ( ON-TABLE ?auto_317470 ) ( ON ?auto_317471 ?auto_317470 ) ( ON ?auto_317472 ?auto_317471 ) ( ON ?auto_317473 ?auto_317472 ) ( not ( = ?auto_317470 ?auto_317471 ) ) ( not ( = ?auto_317470 ?auto_317472 ) ) ( not ( = ?auto_317470 ?auto_317473 ) ) ( not ( = ?auto_317470 ?auto_317474 ) ) ( not ( = ?auto_317470 ?auto_317475 ) ) ( not ( = ?auto_317470 ?auto_317476 ) ) ( not ( = ?auto_317470 ?auto_317477 ) ) ( not ( = ?auto_317470 ?auto_317478 ) ) ( not ( = ?auto_317470 ?auto_317479 ) ) ( not ( = ?auto_317470 ?auto_317480 ) ) ( not ( = ?auto_317470 ?auto_317481 ) ) ( not ( = ?auto_317470 ?auto_317482 ) ) ( not ( = ?auto_317470 ?auto_317483 ) ) ( not ( = ?auto_317470 ?auto_317484 ) ) ( not ( = ?auto_317471 ?auto_317472 ) ) ( not ( = ?auto_317471 ?auto_317473 ) ) ( not ( = ?auto_317471 ?auto_317474 ) ) ( not ( = ?auto_317471 ?auto_317475 ) ) ( not ( = ?auto_317471 ?auto_317476 ) ) ( not ( = ?auto_317471 ?auto_317477 ) ) ( not ( = ?auto_317471 ?auto_317478 ) ) ( not ( = ?auto_317471 ?auto_317479 ) ) ( not ( = ?auto_317471 ?auto_317480 ) ) ( not ( = ?auto_317471 ?auto_317481 ) ) ( not ( = ?auto_317471 ?auto_317482 ) ) ( not ( = ?auto_317471 ?auto_317483 ) ) ( not ( = ?auto_317471 ?auto_317484 ) ) ( not ( = ?auto_317472 ?auto_317473 ) ) ( not ( = ?auto_317472 ?auto_317474 ) ) ( not ( = ?auto_317472 ?auto_317475 ) ) ( not ( = ?auto_317472 ?auto_317476 ) ) ( not ( = ?auto_317472 ?auto_317477 ) ) ( not ( = ?auto_317472 ?auto_317478 ) ) ( not ( = ?auto_317472 ?auto_317479 ) ) ( not ( = ?auto_317472 ?auto_317480 ) ) ( not ( = ?auto_317472 ?auto_317481 ) ) ( not ( = ?auto_317472 ?auto_317482 ) ) ( not ( = ?auto_317472 ?auto_317483 ) ) ( not ( = ?auto_317472 ?auto_317484 ) ) ( not ( = ?auto_317473 ?auto_317474 ) ) ( not ( = ?auto_317473 ?auto_317475 ) ) ( not ( = ?auto_317473 ?auto_317476 ) ) ( not ( = ?auto_317473 ?auto_317477 ) ) ( not ( = ?auto_317473 ?auto_317478 ) ) ( not ( = ?auto_317473 ?auto_317479 ) ) ( not ( = ?auto_317473 ?auto_317480 ) ) ( not ( = ?auto_317473 ?auto_317481 ) ) ( not ( = ?auto_317473 ?auto_317482 ) ) ( not ( = ?auto_317473 ?auto_317483 ) ) ( not ( = ?auto_317473 ?auto_317484 ) ) ( not ( = ?auto_317474 ?auto_317475 ) ) ( not ( = ?auto_317474 ?auto_317476 ) ) ( not ( = ?auto_317474 ?auto_317477 ) ) ( not ( = ?auto_317474 ?auto_317478 ) ) ( not ( = ?auto_317474 ?auto_317479 ) ) ( not ( = ?auto_317474 ?auto_317480 ) ) ( not ( = ?auto_317474 ?auto_317481 ) ) ( not ( = ?auto_317474 ?auto_317482 ) ) ( not ( = ?auto_317474 ?auto_317483 ) ) ( not ( = ?auto_317474 ?auto_317484 ) ) ( not ( = ?auto_317475 ?auto_317476 ) ) ( not ( = ?auto_317475 ?auto_317477 ) ) ( not ( = ?auto_317475 ?auto_317478 ) ) ( not ( = ?auto_317475 ?auto_317479 ) ) ( not ( = ?auto_317475 ?auto_317480 ) ) ( not ( = ?auto_317475 ?auto_317481 ) ) ( not ( = ?auto_317475 ?auto_317482 ) ) ( not ( = ?auto_317475 ?auto_317483 ) ) ( not ( = ?auto_317475 ?auto_317484 ) ) ( not ( = ?auto_317476 ?auto_317477 ) ) ( not ( = ?auto_317476 ?auto_317478 ) ) ( not ( = ?auto_317476 ?auto_317479 ) ) ( not ( = ?auto_317476 ?auto_317480 ) ) ( not ( = ?auto_317476 ?auto_317481 ) ) ( not ( = ?auto_317476 ?auto_317482 ) ) ( not ( = ?auto_317476 ?auto_317483 ) ) ( not ( = ?auto_317476 ?auto_317484 ) ) ( not ( = ?auto_317477 ?auto_317478 ) ) ( not ( = ?auto_317477 ?auto_317479 ) ) ( not ( = ?auto_317477 ?auto_317480 ) ) ( not ( = ?auto_317477 ?auto_317481 ) ) ( not ( = ?auto_317477 ?auto_317482 ) ) ( not ( = ?auto_317477 ?auto_317483 ) ) ( not ( = ?auto_317477 ?auto_317484 ) ) ( not ( = ?auto_317478 ?auto_317479 ) ) ( not ( = ?auto_317478 ?auto_317480 ) ) ( not ( = ?auto_317478 ?auto_317481 ) ) ( not ( = ?auto_317478 ?auto_317482 ) ) ( not ( = ?auto_317478 ?auto_317483 ) ) ( not ( = ?auto_317478 ?auto_317484 ) ) ( not ( = ?auto_317479 ?auto_317480 ) ) ( not ( = ?auto_317479 ?auto_317481 ) ) ( not ( = ?auto_317479 ?auto_317482 ) ) ( not ( = ?auto_317479 ?auto_317483 ) ) ( not ( = ?auto_317479 ?auto_317484 ) ) ( not ( = ?auto_317480 ?auto_317481 ) ) ( not ( = ?auto_317480 ?auto_317482 ) ) ( not ( = ?auto_317480 ?auto_317483 ) ) ( not ( = ?auto_317480 ?auto_317484 ) ) ( not ( = ?auto_317481 ?auto_317482 ) ) ( not ( = ?auto_317481 ?auto_317483 ) ) ( not ( = ?auto_317481 ?auto_317484 ) ) ( not ( = ?auto_317482 ?auto_317483 ) ) ( not ( = ?auto_317482 ?auto_317484 ) ) ( not ( = ?auto_317483 ?auto_317484 ) ) ( ON ?auto_317482 ?auto_317483 ) ( ON ?auto_317481 ?auto_317482 ) ( ON ?auto_317480 ?auto_317481 ) ( ON ?auto_317479 ?auto_317480 ) ( ON ?auto_317478 ?auto_317479 ) ( ON ?auto_317477 ?auto_317478 ) ( ON ?auto_317476 ?auto_317477 ) ( ON ?auto_317475 ?auto_317476 ) ( CLEAR ?auto_317473 ) ( ON ?auto_317474 ?auto_317475 ) ( CLEAR ?auto_317474 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_317470 ?auto_317471 ?auto_317472 ?auto_317473 ?auto_317474 )
      ( MAKE-14PILE ?auto_317470 ?auto_317471 ?auto_317472 ?auto_317473 ?auto_317474 ?auto_317475 ?auto_317476 ?auto_317477 ?auto_317478 ?auto_317479 ?auto_317480 ?auto_317481 ?auto_317482 ?auto_317483 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_317499 - BLOCK
      ?auto_317500 - BLOCK
      ?auto_317501 - BLOCK
      ?auto_317502 - BLOCK
      ?auto_317503 - BLOCK
      ?auto_317504 - BLOCK
      ?auto_317505 - BLOCK
      ?auto_317506 - BLOCK
      ?auto_317507 - BLOCK
      ?auto_317508 - BLOCK
      ?auto_317509 - BLOCK
      ?auto_317510 - BLOCK
      ?auto_317511 - BLOCK
      ?auto_317512 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_317512 ) ( ON-TABLE ?auto_317499 ) ( ON ?auto_317500 ?auto_317499 ) ( ON ?auto_317501 ?auto_317500 ) ( ON ?auto_317502 ?auto_317501 ) ( not ( = ?auto_317499 ?auto_317500 ) ) ( not ( = ?auto_317499 ?auto_317501 ) ) ( not ( = ?auto_317499 ?auto_317502 ) ) ( not ( = ?auto_317499 ?auto_317503 ) ) ( not ( = ?auto_317499 ?auto_317504 ) ) ( not ( = ?auto_317499 ?auto_317505 ) ) ( not ( = ?auto_317499 ?auto_317506 ) ) ( not ( = ?auto_317499 ?auto_317507 ) ) ( not ( = ?auto_317499 ?auto_317508 ) ) ( not ( = ?auto_317499 ?auto_317509 ) ) ( not ( = ?auto_317499 ?auto_317510 ) ) ( not ( = ?auto_317499 ?auto_317511 ) ) ( not ( = ?auto_317499 ?auto_317512 ) ) ( not ( = ?auto_317500 ?auto_317501 ) ) ( not ( = ?auto_317500 ?auto_317502 ) ) ( not ( = ?auto_317500 ?auto_317503 ) ) ( not ( = ?auto_317500 ?auto_317504 ) ) ( not ( = ?auto_317500 ?auto_317505 ) ) ( not ( = ?auto_317500 ?auto_317506 ) ) ( not ( = ?auto_317500 ?auto_317507 ) ) ( not ( = ?auto_317500 ?auto_317508 ) ) ( not ( = ?auto_317500 ?auto_317509 ) ) ( not ( = ?auto_317500 ?auto_317510 ) ) ( not ( = ?auto_317500 ?auto_317511 ) ) ( not ( = ?auto_317500 ?auto_317512 ) ) ( not ( = ?auto_317501 ?auto_317502 ) ) ( not ( = ?auto_317501 ?auto_317503 ) ) ( not ( = ?auto_317501 ?auto_317504 ) ) ( not ( = ?auto_317501 ?auto_317505 ) ) ( not ( = ?auto_317501 ?auto_317506 ) ) ( not ( = ?auto_317501 ?auto_317507 ) ) ( not ( = ?auto_317501 ?auto_317508 ) ) ( not ( = ?auto_317501 ?auto_317509 ) ) ( not ( = ?auto_317501 ?auto_317510 ) ) ( not ( = ?auto_317501 ?auto_317511 ) ) ( not ( = ?auto_317501 ?auto_317512 ) ) ( not ( = ?auto_317502 ?auto_317503 ) ) ( not ( = ?auto_317502 ?auto_317504 ) ) ( not ( = ?auto_317502 ?auto_317505 ) ) ( not ( = ?auto_317502 ?auto_317506 ) ) ( not ( = ?auto_317502 ?auto_317507 ) ) ( not ( = ?auto_317502 ?auto_317508 ) ) ( not ( = ?auto_317502 ?auto_317509 ) ) ( not ( = ?auto_317502 ?auto_317510 ) ) ( not ( = ?auto_317502 ?auto_317511 ) ) ( not ( = ?auto_317502 ?auto_317512 ) ) ( not ( = ?auto_317503 ?auto_317504 ) ) ( not ( = ?auto_317503 ?auto_317505 ) ) ( not ( = ?auto_317503 ?auto_317506 ) ) ( not ( = ?auto_317503 ?auto_317507 ) ) ( not ( = ?auto_317503 ?auto_317508 ) ) ( not ( = ?auto_317503 ?auto_317509 ) ) ( not ( = ?auto_317503 ?auto_317510 ) ) ( not ( = ?auto_317503 ?auto_317511 ) ) ( not ( = ?auto_317503 ?auto_317512 ) ) ( not ( = ?auto_317504 ?auto_317505 ) ) ( not ( = ?auto_317504 ?auto_317506 ) ) ( not ( = ?auto_317504 ?auto_317507 ) ) ( not ( = ?auto_317504 ?auto_317508 ) ) ( not ( = ?auto_317504 ?auto_317509 ) ) ( not ( = ?auto_317504 ?auto_317510 ) ) ( not ( = ?auto_317504 ?auto_317511 ) ) ( not ( = ?auto_317504 ?auto_317512 ) ) ( not ( = ?auto_317505 ?auto_317506 ) ) ( not ( = ?auto_317505 ?auto_317507 ) ) ( not ( = ?auto_317505 ?auto_317508 ) ) ( not ( = ?auto_317505 ?auto_317509 ) ) ( not ( = ?auto_317505 ?auto_317510 ) ) ( not ( = ?auto_317505 ?auto_317511 ) ) ( not ( = ?auto_317505 ?auto_317512 ) ) ( not ( = ?auto_317506 ?auto_317507 ) ) ( not ( = ?auto_317506 ?auto_317508 ) ) ( not ( = ?auto_317506 ?auto_317509 ) ) ( not ( = ?auto_317506 ?auto_317510 ) ) ( not ( = ?auto_317506 ?auto_317511 ) ) ( not ( = ?auto_317506 ?auto_317512 ) ) ( not ( = ?auto_317507 ?auto_317508 ) ) ( not ( = ?auto_317507 ?auto_317509 ) ) ( not ( = ?auto_317507 ?auto_317510 ) ) ( not ( = ?auto_317507 ?auto_317511 ) ) ( not ( = ?auto_317507 ?auto_317512 ) ) ( not ( = ?auto_317508 ?auto_317509 ) ) ( not ( = ?auto_317508 ?auto_317510 ) ) ( not ( = ?auto_317508 ?auto_317511 ) ) ( not ( = ?auto_317508 ?auto_317512 ) ) ( not ( = ?auto_317509 ?auto_317510 ) ) ( not ( = ?auto_317509 ?auto_317511 ) ) ( not ( = ?auto_317509 ?auto_317512 ) ) ( not ( = ?auto_317510 ?auto_317511 ) ) ( not ( = ?auto_317510 ?auto_317512 ) ) ( not ( = ?auto_317511 ?auto_317512 ) ) ( ON ?auto_317511 ?auto_317512 ) ( ON ?auto_317510 ?auto_317511 ) ( ON ?auto_317509 ?auto_317510 ) ( ON ?auto_317508 ?auto_317509 ) ( ON ?auto_317507 ?auto_317508 ) ( ON ?auto_317506 ?auto_317507 ) ( ON ?auto_317505 ?auto_317506 ) ( ON ?auto_317504 ?auto_317505 ) ( CLEAR ?auto_317502 ) ( ON ?auto_317503 ?auto_317504 ) ( CLEAR ?auto_317503 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_317499 ?auto_317500 ?auto_317501 ?auto_317502 ?auto_317503 )
      ( MAKE-14PILE ?auto_317499 ?auto_317500 ?auto_317501 ?auto_317502 ?auto_317503 ?auto_317504 ?auto_317505 ?auto_317506 ?auto_317507 ?auto_317508 ?auto_317509 ?auto_317510 ?auto_317511 ?auto_317512 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_317527 - BLOCK
      ?auto_317528 - BLOCK
      ?auto_317529 - BLOCK
      ?auto_317530 - BLOCK
      ?auto_317531 - BLOCK
      ?auto_317532 - BLOCK
      ?auto_317533 - BLOCK
      ?auto_317534 - BLOCK
      ?auto_317535 - BLOCK
      ?auto_317536 - BLOCK
      ?auto_317537 - BLOCK
      ?auto_317538 - BLOCK
      ?auto_317539 - BLOCK
      ?auto_317540 - BLOCK
    )
    :vars
    (
      ?auto_317541 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_317540 ?auto_317541 ) ( ON-TABLE ?auto_317527 ) ( ON ?auto_317528 ?auto_317527 ) ( ON ?auto_317529 ?auto_317528 ) ( not ( = ?auto_317527 ?auto_317528 ) ) ( not ( = ?auto_317527 ?auto_317529 ) ) ( not ( = ?auto_317527 ?auto_317530 ) ) ( not ( = ?auto_317527 ?auto_317531 ) ) ( not ( = ?auto_317527 ?auto_317532 ) ) ( not ( = ?auto_317527 ?auto_317533 ) ) ( not ( = ?auto_317527 ?auto_317534 ) ) ( not ( = ?auto_317527 ?auto_317535 ) ) ( not ( = ?auto_317527 ?auto_317536 ) ) ( not ( = ?auto_317527 ?auto_317537 ) ) ( not ( = ?auto_317527 ?auto_317538 ) ) ( not ( = ?auto_317527 ?auto_317539 ) ) ( not ( = ?auto_317527 ?auto_317540 ) ) ( not ( = ?auto_317527 ?auto_317541 ) ) ( not ( = ?auto_317528 ?auto_317529 ) ) ( not ( = ?auto_317528 ?auto_317530 ) ) ( not ( = ?auto_317528 ?auto_317531 ) ) ( not ( = ?auto_317528 ?auto_317532 ) ) ( not ( = ?auto_317528 ?auto_317533 ) ) ( not ( = ?auto_317528 ?auto_317534 ) ) ( not ( = ?auto_317528 ?auto_317535 ) ) ( not ( = ?auto_317528 ?auto_317536 ) ) ( not ( = ?auto_317528 ?auto_317537 ) ) ( not ( = ?auto_317528 ?auto_317538 ) ) ( not ( = ?auto_317528 ?auto_317539 ) ) ( not ( = ?auto_317528 ?auto_317540 ) ) ( not ( = ?auto_317528 ?auto_317541 ) ) ( not ( = ?auto_317529 ?auto_317530 ) ) ( not ( = ?auto_317529 ?auto_317531 ) ) ( not ( = ?auto_317529 ?auto_317532 ) ) ( not ( = ?auto_317529 ?auto_317533 ) ) ( not ( = ?auto_317529 ?auto_317534 ) ) ( not ( = ?auto_317529 ?auto_317535 ) ) ( not ( = ?auto_317529 ?auto_317536 ) ) ( not ( = ?auto_317529 ?auto_317537 ) ) ( not ( = ?auto_317529 ?auto_317538 ) ) ( not ( = ?auto_317529 ?auto_317539 ) ) ( not ( = ?auto_317529 ?auto_317540 ) ) ( not ( = ?auto_317529 ?auto_317541 ) ) ( not ( = ?auto_317530 ?auto_317531 ) ) ( not ( = ?auto_317530 ?auto_317532 ) ) ( not ( = ?auto_317530 ?auto_317533 ) ) ( not ( = ?auto_317530 ?auto_317534 ) ) ( not ( = ?auto_317530 ?auto_317535 ) ) ( not ( = ?auto_317530 ?auto_317536 ) ) ( not ( = ?auto_317530 ?auto_317537 ) ) ( not ( = ?auto_317530 ?auto_317538 ) ) ( not ( = ?auto_317530 ?auto_317539 ) ) ( not ( = ?auto_317530 ?auto_317540 ) ) ( not ( = ?auto_317530 ?auto_317541 ) ) ( not ( = ?auto_317531 ?auto_317532 ) ) ( not ( = ?auto_317531 ?auto_317533 ) ) ( not ( = ?auto_317531 ?auto_317534 ) ) ( not ( = ?auto_317531 ?auto_317535 ) ) ( not ( = ?auto_317531 ?auto_317536 ) ) ( not ( = ?auto_317531 ?auto_317537 ) ) ( not ( = ?auto_317531 ?auto_317538 ) ) ( not ( = ?auto_317531 ?auto_317539 ) ) ( not ( = ?auto_317531 ?auto_317540 ) ) ( not ( = ?auto_317531 ?auto_317541 ) ) ( not ( = ?auto_317532 ?auto_317533 ) ) ( not ( = ?auto_317532 ?auto_317534 ) ) ( not ( = ?auto_317532 ?auto_317535 ) ) ( not ( = ?auto_317532 ?auto_317536 ) ) ( not ( = ?auto_317532 ?auto_317537 ) ) ( not ( = ?auto_317532 ?auto_317538 ) ) ( not ( = ?auto_317532 ?auto_317539 ) ) ( not ( = ?auto_317532 ?auto_317540 ) ) ( not ( = ?auto_317532 ?auto_317541 ) ) ( not ( = ?auto_317533 ?auto_317534 ) ) ( not ( = ?auto_317533 ?auto_317535 ) ) ( not ( = ?auto_317533 ?auto_317536 ) ) ( not ( = ?auto_317533 ?auto_317537 ) ) ( not ( = ?auto_317533 ?auto_317538 ) ) ( not ( = ?auto_317533 ?auto_317539 ) ) ( not ( = ?auto_317533 ?auto_317540 ) ) ( not ( = ?auto_317533 ?auto_317541 ) ) ( not ( = ?auto_317534 ?auto_317535 ) ) ( not ( = ?auto_317534 ?auto_317536 ) ) ( not ( = ?auto_317534 ?auto_317537 ) ) ( not ( = ?auto_317534 ?auto_317538 ) ) ( not ( = ?auto_317534 ?auto_317539 ) ) ( not ( = ?auto_317534 ?auto_317540 ) ) ( not ( = ?auto_317534 ?auto_317541 ) ) ( not ( = ?auto_317535 ?auto_317536 ) ) ( not ( = ?auto_317535 ?auto_317537 ) ) ( not ( = ?auto_317535 ?auto_317538 ) ) ( not ( = ?auto_317535 ?auto_317539 ) ) ( not ( = ?auto_317535 ?auto_317540 ) ) ( not ( = ?auto_317535 ?auto_317541 ) ) ( not ( = ?auto_317536 ?auto_317537 ) ) ( not ( = ?auto_317536 ?auto_317538 ) ) ( not ( = ?auto_317536 ?auto_317539 ) ) ( not ( = ?auto_317536 ?auto_317540 ) ) ( not ( = ?auto_317536 ?auto_317541 ) ) ( not ( = ?auto_317537 ?auto_317538 ) ) ( not ( = ?auto_317537 ?auto_317539 ) ) ( not ( = ?auto_317537 ?auto_317540 ) ) ( not ( = ?auto_317537 ?auto_317541 ) ) ( not ( = ?auto_317538 ?auto_317539 ) ) ( not ( = ?auto_317538 ?auto_317540 ) ) ( not ( = ?auto_317538 ?auto_317541 ) ) ( not ( = ?auto_317539 ?auto_317540 ) ) ( not ( = ?auto_317539 ?auto_317541 ) ) ( not ( = ?auto_317540 ?auto_317541 ) ) ( ON ?auto_317539 ?auto_317540 ) ( ON ?auto_317538 ?auto_317539 ) ( ON ?auto_317537 ?auto_317538 ) ( ON ?auto_317536 ?auto_317537 ) ( ON ?auto_317535 ?auto_317536 ) ( ON ?auto_317534 ?auto_317535 ) ( ON ?auto_317533 ?auto_317534 ) ( ON ?auto_317532 ?auto_317533 ) ( ON ?auto_317531 ?auto_317532 ) ( CLEAR ?auto_317529 ) ( ON ?auto_317530 ?auto_317531 ) ( CLEAR ?auto_317530 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_317527 ?auto_317528 ?auto_317529 ?auto_317530 )
      ( MAKE-14PILE ?auto_317527 ?auto_317528 ?auto_317529 ?auto_317530 ?auto_317531 ?auto_317532 ?auto_317533 ?auto_317534 ?auto_317535 ?auto_317536 ?auto_317537 ?auto_317538 ?auto_317539 ?auto_317540 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_317556 - BLOCK
      ?auto_317557 - BLOCK
      ?auto_317558 - BLOCK
      ?auto_317559 - BLOCK
      ?auto_317560 - BLOCK
      ?auto_317561 - BLOCK
      ?auto_317562 - BLOCK
      ?auto_317563 - BLOCK
      ?auto_317564 - BLOCK
      ?auto_317565 - BLOCK
      ?auto_317566 - BLOCK
      ?auto_317567 - BLOCK
      ?auto_317568 - BLOCK
      ?auto_317569 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_317569 ) ( ON-TABLE ?auto_317556 ) ( ON ?auto_317557 ?auto_317556 ) ( ON ?auto_317558 ?auto_317557 ) ( not ( = ?auto_317556 ?auto_317557 ) ) ( not ( = ?auto_317556 ?auto_317558 ) ) ( not ( = ?auto_317556 ?auto_317559 ) ) ( not ( = ?auto_317556 ?auto_317560 ) ) ( not ( = ?auto_317556 ?auto_317561 ) ) ( not ( = ?auto_317556 ?auto_317562 ) ) ( not ( = ?auto_317556 ?auto_317563 ) ) ( not ( = ?auto_317556 ?auto_317564 ) ) ( not ( = ?auto_317556 ?auto_317565 ) ) ( not ( = ?auto_317556 ?auto_317566 ) ) ( not ( = ?auto_317556 ?auto_317567 ) ) ( not ( = ?auto_317556 ?auto_317568 ) ) ( not ( = ?auto_317556 ?auto_317569 ) ) ( not ( = ?auto_317557 ?auto_317558 ) ) ( not ( = ?auto_317557 ?auto_317559 ) ) ( not ( = ?auto_317557 ?auto_317560 ) ) ( not ( = ?auto_317557 ?auto_317561 ) ) ( not ( = ?auto_317557 ?auto_317562 ) ) ( not ( = ?auto_317557 ?auto_317563 ) ) ( not ( = ?auto_317557 ?auto_317564 ) ) ( not ( = ?auto_317557 ?auto_317565 ) ) ( not ( = ?auto_317557 ?auto_317566 ) ) ( not ( = ?auto_317557 ?auto_317567 ) ) ( not ( = ?auto_317557 ?auto_317568 ) ) ( not ( = ?auto_317557 ?auto_317569 ) ) ( not ( = ?auto_317558 ?auto_317559 ) ) ( not ( = ?auto_317558 ?auto_317560 ) ) ( not ( = ?auto_317558 ?auto_317561 ) ) ( not ( = ?auto_317558 ?auto_317562 ) ) ( not ( = ?auto_317558 ?auto_317563 ) ) ( not ( = ?auto_317558 ?auto_317564 ) ) ( not ( = ?auto_317558 ?auto_317565 ) ) ( not ( = ?auto_317558 ?auto_317566 ) ) ( not ( = ?auto_317558 ?auto_317567 ) ) ( not ( = ?auto_317558 ?auto_317568 ) ) ( not ( = ?auto_317558 ?auto_317569 ) ) ( not ( = ?auto_317559 ?auto_317560 ) ) ( not ( = ?auto_317559 ?auto_317561 ) ) ( not ( = ?auto_317559 ?auto_317562 ) ) ( not ( = ?auto_317559 ?auto_317563 ) ) ( not ( = ?auto_317559 ?auto_317564 ) ) ( not ( = ?auto_317559 ?auto_317565 ) ) ( not ( = ?auto_317559 ?auto_317566 ) ) ( not ( = ?auto_317559 ?auto_317567 ) ) ( not ( = ?auto_317559 ?auto_317568 ) ) ( not ( = ?auto_317559 ?auto_317569 ) ) ( not ( = ?auto_317560 ?auto_317561 ) ) ( not ( = ?auto_317560 ?auto_317562 ) ) ( not ( = ?auto_317560 ?auto_317563 ) ) ( not ( = ?auto_317560 ?auto_317564 ) ) ( not ( = ?auto_317560 ?auto_317565 ) ) ( not ( = ?auto_317560 ?auto_317566 ) ) ( not ( = ?auto_317560 ?auto_317567 ) ) ( not ( = ?auto_317560 ?auto_317568 ) ) ( not ( = ?auto_317560 ?auto_317569 ) ) ( not ( = ?auto_317561 ?auto_317562 ) ) ( not ( = ?auto_317561 ?auto_317563 ) ) ( not ( = ?auto_317561 ?auto_317564 ) ) ( not ( = ?auto_317561 ?auto_317565 ) ) ( not ( = ?auto_317561 ?auto_317566 ) ) ( not ( = ?auto_317561 ?auto_317567 ) ) ( not ( = ?auto_317561 ?auto_317568 ) ) ( not ( = ?auto_317561 ?auto_317569 ) ) ( not ( = ?auto_317562 ?auto_317563 ) ) ( not ( = ?auto_317562 ?auto_317564 ) ) ( not ( = ?auto_317562 ?auto_317565 ) ) ( not ( = ?auto_317562 ?auto_317566 ) ) ( not ( = ?auto_317562 ?auto_317567 ) ) ( not ( = ?auto_317562 ?auto_317568 ) ) ( not ( = ?auto_317562 ?auto_317569 ) ) ( not ( = ?auto_317563 ?auto_317564 ) ) ( not ( = ?auto_317563 ?auto_317565 ) ) ( not ( = ?auto_317563 ?auto_317566 ) ) ( not ( = ?auto_317563 ?auto_317567 ) ) ( not ( = ?auto_317563 ?auto_317568 ) ) ( not ( = ?auto_317563 ?auto_317569 ) ) ( not ( = ?auto_317564 ?auto_317565 ) ) ( not ( = ?auto_317564 ?auto_317566 ) ) ( not ( = ?auto_317564 ?auto_317567 ) ) ( not ( = ?auto_317564 ?auto_317568 ) ) ( not ( = ?auto_317564 ?auto_317569 ) ) ( not ( = ?auto_317565 ?auto_317566 ) ) ( not ( = ?auto_317565 ?auto_317567 ) ) ( not ( = ?auto_317565 ?auto_317568 ) ) ( not ( = ?auto_317565 ?auto_317569 ) ) ( not ( = ?auto_317566 ?auto_317567 ) ) ( not ( = ?auto_317566 ?auto_317568 ) ) ( not ( = ?auto_317566 ?auto_317569 ) ) ( not ( = ?auto_317567 ?auto_317568 ) ) ( not ( = ?auto_317567 ?auto_317569 ) ) ( not ( = ?auto_317568 ?auto_317569 ) ) ( ON ?auto_317568 ?auto_317569 ) ( ON ?auto_317567 ?auto_317568 ) ( ON ?auto_317566 ?auto_317567 ) ( ON ?auto_317565 ?auto_317566 ) ( ON ?auto_317564 ?auto_317565 ) ( ON ?auto_317563 ?auto_317564 ) ( ON ?auto_317562 ?auto_317563 ) ( ON ?auto_317561 ?auto_317562 ) ( ON ?auto_317560 ?auto_317561 ) ( CLEAR ?auto_317558 ) ( ON ?auto_317559 ?auto_317560 ) ( CLEAR ?auto_317559 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_317556 ?auto_317557 ?auto_317558 ?auto_317559 )
      ( MAKE-14PILE ?auto_317556 ?auto_317557 ?auto_317558 ?auto_317559 ?auto_317560 ?auto_317561 ?auto_317562 ?auto_317563 ?auto_317564 ?auto_317565 ?auto_317566 ?auto_317567 ?auto_317568 ?auto_317569 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_317584 - BLOCK
      ?auto_317585 - BLOCK
      ?auto_317586 - BLOCK
      ?auto_317587 - BLOCK
      ?auto_317588 - BLOCK
      ?auto_317589 - BLOCK
      ?auto_317590 - BLOCK
      ?auto_317591 - BLOCK
      ?auto_317592 - BLOCK
      ?auto_317593 - BLOCK
      ?auto_317594 - BLOCK
      ?auto_317595 - BLOCK
      ?auto_317596 - BLOCK
      ?auto_317597 - BLOCK
    )
    :vars
    (
      ?auto_317598 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_317597 ?auto_317598 ) ( ON-TABLE ?auto_317584 ) ( ON ?auto_317585 ?auto_317584 ) ( not ( = ?auto_317584 ?auto_317585 ) ) ( not ( = ?auto_317584 ?auto_317586 ) ) ( not ( = ?auto_317584 ?auto_317587 ) ) ( not ( = ?auto_317584 ?auto_317588 ) ) ( not ( = ?auto_317584 ?auto_317589 ) ) ( not ( = ?auto_317584 ?auto_317590 ) ) ( not ( = ?auto_317584 ?auto_317591 ) ) ( not ( = ?auto_317584 ?auto_317592 ) ) ( not ( = ?auto_317584 ?auto_317593 ) ) ( not ( = ?auto_317584 ?auto_317594 ) ) ( not ( = ?auto_317584 ?auto_317595 ) ) ( not ( = ?auto_317584 ?auto_317596 ) ) ( not ( = ?auto_317584 ?auto_317597 ) ) ( not ( = ?auto_317584 ?auto_317598 ) ) ( not ( = ?auto_317585 ?auto_317586 ) ) ( not ( = ?auto_317585 ?auto_317587 ) ) ( not ( = ?auto_317585 ?auto_317588 ) ) ( not ( = ?auto_317585 ?auto_317589 ) ) ( not ( = ?auto_317585 ?auto_317590 ) ) ( not ( = ?auto_317585 ?auto_317591 ) ) ( not ( = ?auto_317585 ?auto_317592 ) ) ( not ( = ?auto_317585 ?auto_317593 ) ) ( not ( = ?auto_317585 ?auto_317594 ) ) ( not ( = ?auto_317585 ?auto_317595 ) ) ( not ( = ?auto_317585 ?auto_317596 ) ) ( not ( = ?auto_317585 ?auto_317597 ) ) ( not ( = ?auto_317585 ?auto_317598 ) ) ( not ( = ?auto_317586 ?auto_317587 ) ) ( not ( = ?auto_317586 ?auto_317588 ) ) ( not ( = ?auto_317586 ?auto_317589 ) ) ( not ( = ?auto_317586 ?auto_317590 ) ) ( not ( = ?auto_317586 ?auto_317591 ) ) ( not ( = ?auto_317586 ?auto_317592 ) ) ( not ( = ?auto_317586 ?auto_317593 ) ) ( not ( = ?auto_317586 ?auto_317594 ) ) ( not ( = ?auto_317586 ?auto_317595 ) ) ( not ( = ?auto_317586 ?auto_317596 ) ) ( not ( = ?auto_317586 ?auto_317597 ) ) ( not ( = ?auto_317586 ?auto_317598 ) ) ( not ( = ?auto_317587 ?auto_317588 ) ) ( not ( = ?auto_317587 ?auto_317589 ) ) ( not ( = ?auto_317587 ?auto_317590 ) ) ( not ( = ?auto_317587 ?auto_317591 ) ) ( not ( = ?auto_317587 ?auto_317592 ) ) ( not ( = ?auto_317587 ?auto_317593 ) ) ( not ( = ?auto_317587 ?auto_317594 ) ) ( not ( = ?auto_317587 ?auto_317595 ) ) ( not ( = ?auto_317587 ?auto_317596 ) ) ( not ( = ?auto_317587 ?auto_317597 ) ) ( not ( = ?auto_317587 ?auto_317598 ) ) ( not ( = ?auto_317588 ?auto_317589 ) ) ( not ( = ?auto_317588 ?auto_317590 ) ) ( not ( = ?auto_317588 ?auto_317591 ) ) ( not ( = ?auto_317588 ?auto_317592 ) ) ( not ( = ?auto_317588 ?auto_317593 ) ) ( not ( = ?auto_317588 ?auto_317594 ) ) ( not ( = ?auto_317588 ?auto_317595 ) ) ( not ( = ?auto_317588 ?auto_317596 ) ) ( not ( = ?auto_317588 ?auto_317597 ) ) ( not ( = ?auto_317588 ?auto_317598 ) ) ( not ( = ?auto_317589 ?auto_317590 ) ) ( not ( = ?auto_317589 ?auto_317591 ) ) ( not ( = ?auto_317589 ?auto_317592 ) ) ( not ( = ?auto_317589 ?auto_317593 ) ) ( not ( = ?auto_317589 ?auto_317594 ) ) ( not ( = ?auto_317589 ?auto_317595 ) ) ( not ( = ?auto_317589 ?auto_317596 ) ) ( not ( = ?auto_317589 ?auto_317597 ) ) ( not ( = ?auto_317589 ?auto_317598 ) ) ( not ( = ?auto_317590 ?auto_317591 ) ) ( not ( = ?auto_317590 ?auto_317592 ) ) ( not ( = ?auto_317590 ?auto_317593 ) ) ( not ( = ?auto_317590 ?auto_317594 ) ) ( not ( = ?auto_317590 ?auto_317595 ) ) ( not ( = ?auto_317590 ?auto_317596 ) ) ( not ( = ?auto_317590 ?auto_317597 ) ) ( not ( = ?auto_317590 ?auto_317598 ) ) ( not ( = ?auto_317591 ?auto_317592 ) ) ( not ( = ?auto_317591 ?auto_317593 ) ) ( not ( = ?auto_317591 ?auto_317594 ) ) ( not ( = ?auto_317591 ?auto_317595 ) ) ( not ( = ?auto_317591 ?auto_317596 ) ) ( not ( = ?auto_317591 ?auto_317597 ) ) ( not ( = ?auto_317591 ?auto_317598 ) ) ( not ( = ?auto_317592 ?auto_317593 ) ) ( not ( = ?auto_317592 ?auto_317594 ) ) ( not ( = ?auto_317592 ?auto_317595 ) ) ( not ( = ?auto_317592 ?auto_317596 ) ) ( not ( = ?auto_317592 ?auto_317597 ) ) ( not ( = ?auto_317592 ?auto_317598 ) ) ( not ( = ?auto_317593 ?auto_317594 ) ) ( not ( = ?auto_317593 ?auto_317595 ) ) ( not ( = ?auto_317593 ?auto_317596 ) ) ( not ( = ?auto_317593 ?auto_317597 ) ) ( not ( = ?auto_317593 ?auto_317598 ) ) ( not ( = ?auto_317594 ?auto_317595 ) ) ( not ( = ?auto_317594 ?auto_317596 ) ) ( not ( = ?auto_317594 ?auto_317597 ) ) ( not ( = ?auto_317594 ?auto_317598 ) ) ( not ( = ?auto_317595 ?auto_317596 ) ) ( not ( = ?auto_317595 ?auto_317597 ) ) ( not ( = ?auto_317595 ?auto_317598 ) ) ( not ( = ?auto_317596 ?auto_317597 ) ) ( not ( = ?auto_317596 ?auto_317598 ) ) ( not ( = ?auto_317597 ?auto_317598 ) ) ( ON ?auto_317596 ?auto_317597 ) ( ON ?auto_317595 ?auto_317596 ) ( ON ?auto_317594 ?auto_317595 ) ( ON ?auto_317593 ?auto_317594 ) ( ON ?auto_317592 ?auto_317593 ) ( ON ?auto_317591 ?auto_317592 ) ( ON ?auto_317590 ?auto_317591 ) ( ON ?auto_317589 ?auto_317590 ) ( ON ?auto_317588 ?auto_317589 ) ( ON ?auto_317587 ?auto_317588 ) ( CLEAR ?auto_317585 ) ( ON ?auto_317586 ?auto_317587 ) ( CLEAR ?auto_317586 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_317584 ?auto_317585 ?auto_317586 )
      ( MAKE-14PILE ?auto_317584 ?auto_317585 ?auto_317586 ?auto_317587 ?auto_317588 ?auto_317589 ?auto_317590 ?auto_317591 ?auto_317592 ?auto_317593 ?auto_317594 ?auto_317595 ?auto_317596 ?auto_317597 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_317613 - BLOCK
      ?auto_317614 - BLOCK
      ?auto_317615 - BLOCK
      ?auto_317616 - BLOCK
      ?auto_317617 - BLOCK
      ?auto_317618 - BLOCK
      ?auto_317619 - BLOCK
      ?auto_317620 - BLOCK
      ?auto_317621 - BLOCK
      ?auto_317622 - BLOCK
      ?auto_317623 - BLOCK
      ?auto_317624 - BLOCK
      ?auto_317625 - BLOCK
      ?auto_317626 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_317626 ) ( ON-TABLE ?auto_317613 ) ( ON ?auto_317614 ?auto_317613 ) ( not ( = ?auto_317613 ?auto_317614 ) ) ( not ( = ?auto_317613 ?auto_317615 ) ) ( not ( = ?auto_317613 ?auto_317616 ) ) ( not ( = ?auto_317613 ?auto_317617 ) ) ( not ( = ?auto_317613 ?auto_317618 ) ) ( not ( = ?auto_317613 ?auto_317619 ) ) ( not ( = ?auto_317613 ?auto_317620 ) ) ( not ( = ?auto_317613 ?auto_317621 ) ) ( not ( = ?auto_317613 ?auto_317622 ) ) ( not ( = ?auto_317613 ?auto_317623 ) ) ( not ( = ?auto_317613 ?auto_317624 ) ) ( not ( = ?auto_317613 ?auto_317625 ) ) ( not ( = ?auto_317613 ?auto_317626 ) ) ( not ( = ?auto_317614 ?auto_317615 ) ) ( not ( = ?auto_317614 ?auto_317616 ) ) ( not ( = ?auto_317614 ?auto_317617 ) ) ( not ( = ?auto_317614 ?auto_317618 ) ) ( not ( = ?auto_317614 ?auto_317619 ) ) ( not ( = ?auto_317614 ?auto_317620 ) ) ( not ( = ?auto_317614 ?auto_317621 ) ) ( not ( = ?auto_317614 ?auto_317622 ) ) ( not ( = ?auto_317614 ?auto_317623 ) ) ( not ( = ?auto_317614 ?auto_317624 ) ) ( not ( = ?auto_317614 ?auto_317625 ) ) ( not ( = ?auto_317614 ?auto_317626 ) ) ( not ( = ?auto_317615 ?auto_317616 ) ) ( not ( = ?auto_317615 ?auto_317617 ) ) ( not ( = ?auto_317615 ?auto_317618 ) ) ( not ( = ?auto_317615 ?auto_317619 ) ) ( not ( = ?auto_317615 ?auto_317620 ) ) ( not ( = ?auto_317615 ?auto_317621 ) ) ( not ( = ?auto_317615 ?auto_317622 ) ) ( not ( = ?auto_317615 ?auto_317623 ) ) ( not ( = ?auto_317615 ?auto_317624 ) ) ( not ( = ?auto_317615 ?auto_317625 ) ) ( not ( = ?auto_317615 ?auto_317626 ) ) ( not ( = ?auto_317616 ?auto_317617 ) ) ( not ( = ?auto_317616 ?auto_317618 ) ) ( not ( = ?auto_317616 ?auto_317619 ) ) ( not ( = ?auto_317616 ?auto_317620 ) ) ( not ( = ?auto_317616 ?auto_317621 ) ) ( not ( = ?auto_317616 ?auto_317622 ) ) ( not ( = ?auto_317616 ?auto_317623 ) ) ( not ( = ?auto_317616 ?auto_317624 ) ) ( not ( = ?auto_317616 ?auto_317625 ) ) ( not ( = ?auto_317616 ?auto_317626 ) ) ( not ( = ?auto_317617 ?auto_317618 ) ) ( not ( = ?auto_317617 ?auto_317619 ) ) ( not ( = ?auto_317617 ?auto_317620 ) ) ( not ( = ?auto_317617 ?auto_317621 ) ) ( not ( = ?auto_317617 ?auto_317622 ) ) ( not ( = ?auto_317617 ?auto_317623 ) ) ( not ( = ?auto_317617 ?auto_317624 ) ) ( not ( = ?auto_317617 ?auto_317625 ) ) ( not ( = ?auto_317617 ?auto_317626 ) ) ( not ( = ?auto_317618 ?auto_317619 ) ) ( not ( = ?auto_317618 ?auto_317620 ) ) ( not ( = ?auto_317618 ?auto_317621 ) ) ( not ( = ?auto_317618 ?auto_317622 ) ) ( not ( = ?auto_317618 ?auto_317623 ) ) ( not ( = ?auto_317618 ?auto_317624 ) ) ( not ( = ?auto_317618 ?auto_317625 ) ) ( not ( = ?auto_317618 ?auto_317626 ) ) ( not ( = ?auto_317619 ?auto_317620 ) ) ( not ( = ?auto_317619 ?auto_317621 ) ) ( not ( = ?auto_317619 ?auto_317622 ) ) ( not ( = ?auto_317619 ?auto_317623 ) ) ( not ( = ?auto_317619 ?auto_317624 ) ) ( not ( = ?auto_317619 ?auto_317625 ) ) ( not ( = ?auto_317619 ?auto_317626 ) ) ( not ( = ?auto_317620 ?auto_317621 ) ) ( not ( = ?auto_317620 ?auto_317622 ) ) ( not ( = ?auto_317620 ?auto_317623 ) ) ( not ( = ?auto_317620 ?auto_317624 ) ) ( not ( = ?auto_317620 ?auto_317625 ) ) ( not ( = ?auto_317620 ?auto_317626 ) ) ( not ( = ?auto_317621 ?auto_317622 ) ) ( not ( = ?auto_317621 ?auto_317623 ) ) ( not ( = ?auto_317621 ?auto_317624 ) ) ( not ( = ?auto_317621 ?auto_317625 ) ) ( not ( = ?auto_317621 ?auto_317626 ) ) ( not ( = ?auto_317622 ?auto_317623 ) ) ( not ( = ?auto_317622 ?auto_317624 ) ) ( not ( = ?auto_317622 ?auto_317625 ) ) ( not ( = ?auto_317622 ?auto_317626 ) ) ( not ( = ?auto_317623 ?auto_317624 ) ) ( not ( = ?auto_317623 ?auto_317625 ) ) ( not ( = ?auto_317623 ?auto_317626 ) ) ( not ( = ?auto_317624 ?auto_317625 ) ) ( not ( = ?auto_317624 ?auto_317626 ) ) ( not ( = ?auto_317625 ?auto_317626 ) ) ( ON ?auto_317625 ?auto_317626 ) ( ON ?auto_317624 ?auto_317625 ) ( ON ?auto_317623 ?auto_317624 ) ( ON ?auto_317622 ?auto_317623 ) ( ON ?auto_317621 ?auto_317622 ) ( ON ?auto_317620 ?auto_317621 ) ( ON ?auto_317619 ?auto_317620 ) ( ON ?auto_317618 ?auto_317619 ) ( ON ?auto_317617 ?auto_317618 ) ( ON ?auto_317616 ?auto_317617 ) ( CLEAR ?auto_317614 ) ( ON ?auto_317615 ?auto_317616 ) ( CLEAR ?auto_317615 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_317613 ?auto_317614 ?auto_317615 )
      ( MAKE-14PILE ?auto_317613 ?auto_317614 ?auto_317615 ?auto_317616 ?auto_317617 ?auto_317618 ?auto_317619 ?auto_317620 ?auto_317621 ?auto_317622 ?auto_317623 ?auto_317624 ?auto_317625 ?auto_317626 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_317641 - BLOCK
      ?auto_317642 - BLOCK
      ?auto_317643 - BLOCK
      ?auto_317644 - BLOCK
      ?auto_317645 - BLOCK
      ?auto_317646 - BLOCK
      ?auto_317647 - BLOCK
      ?auto_317648 - BLOCK
      ?auto_317649 - BLOCK
      ?auto_317650 - BLOCK
      ?auto_317651 - BLOCK
      ?auto_317652 - BLOCK
      ?auto_317653 - BLOCK
      ?auto_317654 - BLOCK
    )
    :vars
    (
      ?auto_317655 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_317654 ?auto_317655 ) ( ON-TABLE ?auto_317641 ) ( not ( = ?auto_317641 ?auto_317642 ) ) ( not ( = ?auto_317641 ?auto_317643 ) ) ( not ( = ?auto_317641 ?auto_317644 ) ) ( not ( = ?auto_317641 ?auto_317645 ) ) ( not ( = ?auto_317641 ?auto_317646 ) ) ( not ( = ?auto_317641 ?auto_317647 ) ) ( not ( = ?auto_317641 ?auto_317648 ) ) ( not ( = ?auto_317641 ?auto_317649 ) ) ( not ( = ?auto_317641 ?auto_317650 ) ) ( not ( = ?auto_317641 ?auto_317651 ) ) ( not ( = ?auto_317641 ?auto_317652 ) ) ( not ( = ?auto_317641 ?auto_317653 ) ) ( not ( = ?auto_317641 ?auto_317654 ) ) ( not ( = ?auto_317641 ?auto_317655 ) ) ( not ( = ?auto_317642 ?auto_317643 ) ) ( not ( = ?auto_317642 ?auto_317644 ) ) ( not ( = ?auto_317642 ?auto_317645 ) ) ( not ( = ?auto_317642 ?auto_317646 ) ) ( not ( = ?auto_317642 ?auto_317647 ) ) ( not ( = ?auto_317642 ?auto_317648 ) ) ( not ( = ?auto_317642 ?auto_317649 ) ) ( not ( = ?auto_317642 ?auto_317650 ) ) ( not ( = ?auto_317642 ?auto_317651 ) ) ( not ( = ?auto_317642 ?auto_317652 ) ) ( not ( = ?auto_317642 ?auto_317653 ) ) ( not ( = ?auto_317642 ?auto_317654 ) ) ( not ( = ?auto_317642 ?auto_317655 ) ) ( not ( = ?auto_317643 ?auto_317644 ) ) ( not ( = ?auto_317643 ?auto_317645 ) ) ( not ( = ?auto_317643 ?auto_317646 ) ) ( not ( = ?auto_317643 ?auto_317647 ) ) ( not ( = ?auto_317643 ?auto_317648 ) ) ( not ( = ?auto_317643 ?auto_317649 ) ) ( not ( = ?auto_317643 ?auto_317650 ) ) ( not ( = ?auto_317643 ?auto_317651 ) ) ( not ( = ?auto_317643 ?auto_317652 ) ) ( not ( = ?auto_317643 ?auto_317653 ) ) ( not ( = ?auto_317643 ?auto_317654 ) ) ( not ( = ?auto_317643 ?auto_317655 ) ) ( not ( = ?auto_317644 ?auto_317645 ) ) ( not ( = ?auto_317644 ?auto_317646 ) ) ( not ( = ?auto_317644 ?auto_317647 ) ) ( not ( = ?auto_317644 ?auto_317648 ) ) ( not ( = ?auto_317644 ?auto_317649 ) ) ( not ( = ?auto_317644 ?auto_317650 ) ) ( not ( = ?auto_317644 ?auto_317651 ) ) ( not ( = ?auto_317644 ?auto_317652 ) ) ( not ( = ?auto_317644 ?auto_317653 ) ) ( not ( = ?auto_317644 ?auto_317654 ) ) ( not ( = ?auto_317644 ?auto_317655 ) ) ( not ( = ?auto_317645 ?auto_317646 ) ) ( not ( = ?auto_317645 ?auto_317647 ) ) ( not ( = ?auto_317645 ?auto_317648 ) ) ( not ( = ?auto_317645 ?auto_317649 ) ) ( not ( = ?auto_317645 ?auto_317650 ) ) ( not ( = ?auto_317645 ?auto_317651 ) ) ( not ( = ?auto_317645 ?auto_317652 ) ) ( not ( = ?auto_317645 ?auto_317653 ) ) ( not ( = ?auto_317645 ?auto_317654 ) ) ( not ( = ?auto_317645 ?auto_317655 ) ) ( not ( = ?auto_317646 ?auto_317647 ) ) ( not ( = ?auto_317646 ?auto_317648 ) ) ( not ( = ?auto_317646 ?auto_317649 ) ) ( not ( = ?auto_317646 ?auto_317650 ) ) ( not ( = ?auto_317646 ?auto_317651 ) ) ( not ( = ?auto_317646 ?auto_317652 ) ) ( not ( = ?auto_317646 ?auto_317653 ) ) ( not ( = ?auto_317646 ?auto_317654 ) ) ( not ( = ?auto_317646 ?auto_317655 ) ) ( not ( = ?auto_317647 ?auto_317648 ) ) ( not ( = ?auto_317647 ?auto_317649 ) ) ( not ( = ?auto_317647 ?auto_317650 ) ) ( not ( = ?auto_317647 ?auto_317651 ) ) ( not ( = ?auto_317647 ?auto_317652 ) ) ( not ( = ?auto_317647 ?auto_317653 ) ) ( not ( = ?auto_317647 ?auto_317654 ) ) ( not ( = ?auto_317647 ?auto_317655 ) ) ( not ( = ?auto_317648 ?auto_317649 ) ) ( not ( = ?auto_317648 ?auto_317650 ) ) ( not ( = ?auto_317648 ?auto_317651 ) ) ( not ( = ?auto_317648 ?auto_317652 ) ) ( not ( = ?auto_317648 ?auto_317653 ) ) ( not ( = ?auto_317648 ?auto_317654 ) ) ( not ( = ?auto_317648 ?auto_317655 ) ) ( not ( = ?auto_317649 ?auto_317650 ) ) ( not ( = ?auto_317649 ?auto_317651 ) ) ( not ( = ?auto_317649 ?auto_317652 ) ) ( not ( = ?auto_317649 ?auto_317653 ) ) ( not ( = ?auto_317649 ?auto_317654 ) ) ( not ( = ?auto_317649 ?auto_317655 ) ) ( not ( = ?auto_317650 ?auto_317651 ) ) ( not ( = ?auto_317650 ?auto_317652 ) ) ( not ( = ?auto_317650 ?auto_317653 ) ) ( not ( = ?auto_317650 ?auto_317654 ) ) ( not ( = ?auto_317650 ?auto_317655 ) ) ( not ( = ?auto_317651 ?auto_317652 ) ) ( not ( = ?auto_317651 ?auto_317653 ) ) ( not ( = ?auto_317651 ?auto_317654 ) ) ( not ( = ?auto_317651 ?auto_317655 ) ) ( not ( = ?auto_317652 ?auto_317653 ) ) ( not ( = ?auto_317652 ?auto_317654 ) ) ( not ( = ?auto_317652 ?auto_317655 ) ) ( not ( = ?auto_317653 ?auto_317654 ) ) ( not ( = ?auto_317653 ?auto_317655 ) ) ( not ( = ?auto_317654 ?auto_317655 ) ) ( ON ?auto_317653 ?auto_317654 ) ( ON ?auto_317652 ?auto_317653 ) ( ON ?auto_317651 ?auto_317652 ) ( ON ?auto_317650 ?auto_317651 ) ( ON ?auto_317649 ?auto_317650 ) ( ON ?auto_317648 ?auto_317649 ) ( ON ?auto_317647 ?auto_317648 ) ( ON ?auto_317646 ?auto_317647 ) ( ON ?auto_317645 ?auto_317646 ) ( ON ?auto_317644 ?auto_317645 ) ( ON ?auto_317643 ?auto_317644 ) ( CLEAR ?auto_317641 ) ( ON ?auto_317642 ?auto_317643 ) ( CLEAR ?auto_317642 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_317641 ?auto_317642 )
      ( MAKE-14PILE ?auto_317641 ?auto_317642 ?auto_317643 ?auto_317644 ?auto_317645 ?auto_317646 ?auto_317647 ?auto_317648 ?auto_317649 ?auto_317650 ?auto_317651 ?auto_317652 ?auto_317653 ?auto_317654 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_317670 - BLOCK
      ?auto_317671 - BLOCK
      ?auto_317672 - BLOCK
      ?auto_317673 - BLOCK
      ?auto_317674 - BLOCK
      ?auto_317675 - BLOCK
      ?auto_317676 - BLOCK
      ?auto_317677 - BLOCK
      ?auto_317678 - BLOCK
      ?auto_317679 - BLOCK
      ?auto_317680 - BLOCK
      ?auto_317681 - BLOCK
      ?auto_317682 - BLOCK
      ?auto_317683 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_317683 ) ( ON-TABLE ?auto_317670 ) ( not ( = ?auto_317670 ?auto_317671 ) ) ( not ( = ?auto_317670 ?auto_317672 ) ) ( not ( = ?auto_317670 ?auto_317673 ) ) ( not ( = ?auto_317670 ?auto_317674 ) ) ( not ( = ?auto_317670 ?auto_317675 ) ) ( not ( = ?auto_317670 ?auto_317676 ) ) ( not ( = ?auto_317670 ?auto_317677 ) ) ( not ( = ?auto_317670 ?auto_317678 ) ) ( not ( = ?auto_317670 ?auto_317679 ) ) ( not ( = ?auto_317670 ?auto_317680 ) ) ( not ( = ?auto_317670 ?auto_317681 ) ) ( not ( = ?auto_317670 ?auto_317682 ) ) ( not ( = ?auto_317670 ?auto_317683 ) ) ( not ( = ?auto_317671 ?auto_317672 ) ) ( not ( = ?auto_317671 ?auto_317673 ) ) ( not ( = ?auto_317671 ?auto_317674 ) ) ( not ( = ?auto_317671 ?auto_317675 ) ) ( not ( = ?auto_317671 ?auto_317676 ) ) ( not ( = ?auto_317671 ?auto_317677 ) ) ( not ( = ?auto_317671 ?auto_317678 ) ) ( not ( = ?auto_317671 ?auto_317679 ) ) ( not ( = ?auto_317671 ?auto_317680 ) ) ( not ( = ?auto_317671 ?auto_317681 ) ) ( not ( = ?auto_317671 ?auto_317682 ) ) ( not ( = ?auto_317671 ?auto_317683 ) ) ( not ( = ?auto_317672 ?auto_317673 ) ) ( not ( = ?auto_317672 ?auto_317674 ) ) ( not ( = ?auto_317672 ?auto_317675 ) ) ( not ( = ?auto_317672 ?auto_317676 ) ) ( not ( = ?auto_317672 ?auto_317677 ) ) ( not ( = ?auto_317672 ?auto_317678 ) ) ( not ( = ?auto_317672 ?auto_317679 ) ) ( not ( = ?auto_317672 ?auto_317680 ) ) ( not ( = ?auto_317672 ?auto_317681 ) ) ( not ( = ?auto_317672 ?auto_317682 ) ) ( not ( = ?auto_317672 ?auto_317683 ) ) ( not ( = ?auto_317673 ?auto_317674 ) ) ( not ( = ?auto_317673 ?auto_317675 ) ) ( not ( = ?auto_317673 ?auto_317676 ) ) ( not ( = ?auto_317673 ?auto_317677 ) ) ( not ( = ?auto_317673 ?auto_317678 ) ) ( not ( = ?auto_317673 ?auto_317679 ) ) ( not ( = ?auto_317673 ?auto_317680 ) ) ( not ( = ?auto_317673 ?auto_317681 ) ) ( not ( = ?auto_317673 ?auto_317682 ) ) ( not ( = ?auto_317673 ?auto_317683 ) ) ( not ( = ?auto_317674 ?auto_317675 ) ) ( not ( = ?auto_317674 ?auto_317676 ) ) ( not ( = ?auto_317674 ?auto_317677 ) ) ( not ( = ?auto_317674 ?auto_317678 ) ) ( not ( = ?auto_317674 ?auto_317679 ) ) ( not ( = ?auto_317674 ?auto_317680 ) ) ( not ( = ?auto_317674 ?auto_317681 ) ) ( not ( = ?auto_317674 ?auto_317682 ) ) ( not ( = ?auto_317674 ?auto_317683 ) ) ( not ( = ?auto_317675 ?auto_317676 ) ) ( not ( = ?auto_317675 ?auto_317677 ) ) ( not ( = ?auto_317675 ?auto_317678 ) ) ( not ( = ?auto_317675 ?auto_317679 ) ) ( not ( = ?auto_317675 ?auto_317680 ) ) ( not ( = ?auto_317675 ?auto_317681 ) ) ( not ( = ?auto_317675 ?auto_317682 ) ) ( not ( = ?auto_317675 ?auto_317683 ) ) ( not ( = ?auto_317676 ?auto_317677 ) ) ( not ( = ?auto_317676 ?auto_317678 ) ) ( not ( = ?auto_317676 ?auto_317679 ) ) ( not ( = ?auto_317676 ?auto_317680 ) ) ( not ( = ?auto_317676 ?auto_317681 ) ) ( not ( = ?auto_317676 ?auto_317682 ) ) ( not ( = ?auto_317676 ?auto_317683 ) ) ( not ( = ?auto_317677 ?auto_317678 ) ) ( not ( = ?auto_317677 ?auto_317679 ) ) ( not ( = ?auto_317677 ?auto_317680 ) ) ( not ( = ?auto_317677 ?auto_317681 ) ) ( not ( = ?auto_317677 ?auto_317682 ) ) ( not ( = ?auto_317677 ?auto_317683 ) ) ( not ( = ?auto_317678 ?auto_317679 ) ) ( not ( = ?auto_317678 ?auto_317680 ) ) ( not ( = ?auto_317678 ?auto_317681 ) ) ( not ( = ?auto_317678 ?auto_317682 ) ) ( not ( = ?auto_317678 ?auto_317683 ) ) ( not ( = ?auto_317679 ?auto_317680 ) ) ( not ( = ?auto_317679 ?auto_317681 ) ) ( not ( = ?auto_317679 ?auto_317682 ) ) ( not ( = ?auto_317679 ?auto_317683 ) ) ( not ( = ?auto_317680 ?auto_317681 ) ) ( not ( = ?auto_317680 ?auto_317682 ) ) ( not ( = ?auto_317680 ?auto_317683 ) ) ( not ( = ?auto_317681 ?auto_317682 ) ) ( not ( = ?auto_317681 ?auto_317683 ) ) ( not ( = ?auto_317682 ?auto_317683 ) ) ( ON ?auto_317682 ?auto_317683 ) ( ON ?auto_317681 ?auto_317682 ) ( ON ?auto_317680 ?auto_317681 ) ( ON ?auto_317679 ?auto_317680 ) ( ON ?auto_317678 ?auto_317679 ) ( ON ?auto_317677 ?auto_317678 ) ( ON ?auto_317676 ?auto_317677 ) ( ON ?auto_317675 ?auto_317676 ) ( ON ?auto_317674 ?auto_317675 ) ( ON ?auto_317673 ?auto_317674 ) ( ON ?auto_317672 ?auto_317673 ) ( CLEAR ?auto_317670 ) ( ON ?auto_317671 ?auto_317672 ) ( CLEAR ?auto_317671 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_317670 ?auto_317671 )
      ( MAKE-14PILE ?auto_317670 ?auto_317671 ?auto_317672 ?auto_317673 ?auto_317674 ?auto_317675 ?auto_317676 ?auto_317677 ?auto_317678 ?auto_317679 ?auto_317680 ?auto_317681 ?auto_317682 ?auto_317683 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_317698 - BLOCK
      ?auto_317699 - BLOCK
      ?auto_317700 - BLOCK
      ?auto_317701 - BLOCK
      ?auto_317702 - BLOCK
      ?auto_317703 - BLOCK
      ?auto_317704 - BLOCK
      ?auto_317705 - BLOCK
      ?auto_317706 - BLOCK
      ?auto_317707 - BLOCK
      ?auto_317708 - BLOCK
      ?auto_317709 - BLOCK
      ?auto_317710 - BLOCK
      ?auto_317711 - BLOCK
    )
    :vars
    (
      ?auto_317712 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_317711 ?auto_317712 ) ( not ( = ?auto_317698 ?auto_317699 ) ) ( not ( = ?auto_317698 ?auto_317700 ) ) ( not ( = ?auto_317698 ?auto_317701 ) ) ( not ( = ?auto_317698 ?auto_317702 ) ) ( not ( = ?auto_317698 ?auto_317703 ) ) ( not ( = ?auto_317698 ?auto_317704 ) ) ( not ( = ?auto_317698 ?auto_317705 ) ) ( not ( = ?auto_317698 ?auto_317706 ) ) ( not ( = ?auto_317698 ?auto_317707 ) ) ( not ( = ?auto_317698 ?auto_317708 ) ) ( not ( = ?auto_317698 ?auto_317709 ) ) ( not ( = ?auto_317698 ?auto_317710 ) ) ( not ( = ?auto_317698 ?auto_317711 ) ) ( not ( = ?auto_317698 ?auto_317712 ) ) ( not ( = ?auto_317699 ?auto_317700 ) ) ( not ( = ?auto_317699 ?auto_317701 ) ) ( not ( = ?auto_317699 ?auto_317702 ) ) ( not ( = ?auto_317699 ?auto_317703 ) ) ( not ( = ?auto_317699 ?auto_317704 ) ) ( not ( = ?auto_317699 ?auto_317705 ) ) ( not ( = ?auto_317699 ?auto_317706 ) ) ( not ( = ?auto_317699 ?auto_317707 ) ) ( not ( = ?auto_317699 ?auto_317708 ) ) ( not ( = ?auto_317699 ?auto_317709 ) ) ( not ( = ?auto_317699 ?auto_317710 ) ) ( not ( = ?auto_317699 ?auto_317711 ) ) ( not ( = ?auto_317699 ?auto_317712 ) ) ( not ( = ?auto_317700 ?auto_317701 ) ) ( not ( = ?auto_317700 ?auto_317702 ) ) ( not ( = ?auto_317700 ?auto_317703 ) ) ( not ( = ?auto_317700 ?auto_317704 ) ) ( not ( = ?auto_317700 ?auto_317705 ) ) ( not ( = ?auto_317700 ?auto_317706 ) ) ( not ( = ?auto_317700 ?auto_317707 ) ) ( not ( = ?auto_317700 ?auto_317708 ) ) ( not ( = ?auto_317700 ?auto_317709 ) ) ( not ( = ?auto_317700 ?auto_317710 ) ) ( not ( = ?auto_317700 ?auto_317711 ) ) ( not ( = ?auto_317700 ?auto_317712 ) ) ( not ( = ?auto_317701 ?auto_317702 ) ) ( not ( = ?auto_317701 ?auto_317703 ) ) ( not ( = ?auto_317701 ?auto_317704 ) ) ( not ( = ?auto_317701 ?auto_317705 ) ) ( not ( = ?auto_317701 ?auto_317706 ) ) ( not ( = ?auto_317701 ?auto_317707 ) ) ( not ( = ?auto_317701 ?auto_317708 ) ) ( not ( = ?auto_317701 ?auto_317709 ) ) ( not ( = ?auto_317701 ?auto_317710 ) ) ( not ( = ?auto_317701 ?auto_317711 ) ) ( not ( = ?auto_317701 ?auto_317712 ) ) ( not ( = ?auto_317702 ?auto_317703 ) ) ( not ( = ?auto_317702 ?auto_317704 ) ) ( not ( = ?auto_317702 ?auto_317705 ) ) ( not ( = ?auto_317702 ?auto_317706 ) ) ( not ( = ?auto_317702 ?auto_317707 ) ) ( not ( = ?auto_317702 ?auto_317708 ) ) ( not ( = ?auto_317702 ?auto_317709 ) ) ( not ( = ?auto_317702 ?auto_317710 ) ) ( not ( = ?auto_317702 ?auto_317711 ) ) ( not ( = ?auto_317702 ?auto_317712 ) ) ( not ( = ?auto_317703 ?auto_317704 ) ) ( not ( = ?auto_317703 ?auto_317705 ) ) ( not ( = ?auto_317703 ?auto_317706 ) ) ( not ( = ?auto_317703 ?auto_317707 ) ) ( not ( = ?auto_317703 ?auto_317708 ) ) ( not ( = ?auto_317703 ?auto_317709 ) ) ( not ( = ?auto_317703 ?auto_317710 ) ) ( not ( = ?auto_317703 ?auto_317711 ) ) ( not ( = ?auto_317703 ?auto_317712 ) ) ( not ( = ?auto_317704 ?auto_317705 ) ) ( not ( = ?auto_317704 ?auto_317706 ) ) ( not ( = ?auto_317704 ?auto_317707 ) ) ( not ( = ?auto_317704 ?auto_317708 ) ) ( not ( = ?auto_317704 ?auto_317709 ) ) ( not ( = ?auto_317704 ?auto_317710 ) ) ( not ( = ?auto_317704 ?auto_317711 ) ) ( not ( = ?auto_317704 ?auto_317712 ) ) ( not ( = ?auto_317705 ?auto_317706 ) ) ( not ( = ?auto_317705 ?auto_317707 ) ) ( not ( = ?auto_317705 ?auto_317708 ) ) ( not ( = ?auto_317705 ?auto_317709 ) ) ( not ( = ?auto_317705 ?auto_317710 ) ) ( not ( = ?auto_317705 ?auto_317711 ) ) ( not ( = ?auto_317705 ?auto_317712 ) ) ( not ( = ?auto_317706 ?auto_317707 ) ) ( not ( = ?auto_317706 ?auto_317708 ) ) ( not ( = ?auto_317706 ?auto_317709 ) ) ( not ( = ?auto_317706 ?auto_317710 ) ) ( not ( = ?auto_317706 ?auto_317711 ) ) ( not ( = ?auto_317706 ?auto_317712 ) ) ( not ( = ?auto_317707 ?auto_317708 ) ) ( not ( = ?auto_317707 ?auto_317709 ) ) ( not ( = ?auto_317707 ?auto_317710 ) ) ( not ( = ?auto_317707 ?auto_317711 ) ) ( not ( = ?auto_317707 ?auto_317712 ) ) ( not ( = ?auto_317708 ?auto_317709 ) ) ( not ( = ?auto_317708 ?auto_317710 ) ) ( not ( = ?auto_317708 ?auto_317711 ) ) ( not ( = ?auto_317708 ?auto_317712 ) ) ( not ( = ?auto_317709 ?auto_317710 ) ) ( not ( = ?auto_317709 ?auto_317711 ) ) ( not ( = ?auto_317709 ?auto_317712 ) ) ( not ( = ?auto_317710 ?auto_317711 ) ) ( not ( = ?auto_317710 ?auto_317712 ) ) ( not ( = ?auto_317711 ?auto_317712 ) ) ( ON ?auto_317710 ?auto_317711 ) ( ON ?auto_317709 ?auto_317710 ) ( ON ?auto_317708 ?auto_317709 ) ( ON ?auto_317707 ?auto_317708 ) ( ON ?auto_317706 ?auto_317707 ) ( ON ?auto_317705 ?auto_317706 ) ( ON ?auto_317704 ?auto_317705 ) ( ON ?auto_317703 ?auto_317704 ) ( ON ?auto_317702 ?auto_317703 ) ( ON ?auto_317701 ?auto_317702 ) ( ON ?auto_317700 ?auto_317701 ) ( ON ?auto_317699 ?auto_317700 ) ( ON ?auto_317698 ?auto_317699 ) ( CLEAR ?auto_317698 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_317698 )
      ( MAKE-14PILE ?auto_317698 ?auto_317699 ?auto_317700 ?auto_317701 ?auto_317702 ?auto_317703 ?auto_317704 ?auto_317705 ?auto_317706 ?auto_317707 ?auto_317708 ?auto_317709 ?auto_317710 ?auto_317711 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_317727 - BLOCK
      ?auto_317728 - BLOCK
      ?auto_317729 - BLOCK
      ?auto_317730 - BLOCK
      ?auto_317731 - BLOCK
      ?auto_317732 - BLOCK
      ?auto_317733 - BLOCK
      ?auto_317734 - BLOCK
      ?auto_317735 - BLOCK
      ?auto_317736 - BLOCK
      ?auto_317737 - BLOCK
      ?auto_317738 - BLOCK
      ?auto_317739 - BLOCK
      ?auto_317740 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_317740 ) ( not ( = ?auto_317727 ?auto_317728 ) ) ( not ( = ?auto_317727 ?auto_317729 ) ) ( not ( = ?auto_317727 ?auto_317730 ) ) ( not ( = ?auto_317727 ?auto_317731 ) ) ( not ( = ?auto_317727 ?auto_317732 ) ) ( not ( = ?auto_317727 ?auto_317733 ) ) ( not ( = ?auto_317727 ?auto_317734 ) ) ( not ( = ?auto_317727 ?auto_317735 ) ) ( not ( = ?auto_317727 ?auto_317736 ) ) ( not ( = ?auto_317727 ?auto_317737 ) ) ( not ( = ?auto_317727 ?auto_317738 ) ) ( not ( = ?auto_317727 ?auto_317739 ) ) ( not ( = ?auto_317727 ?auto_317740 ) ) ( not ( = ?auto_317728 ?auto_317729 ) ) ( not ( = ?auto_317728 ?auto_317730 ) ) ( not ( = ?auto_317728 ?auto_317731 ) ) ( not ( = ?auto_317728 ?auto_317732 ) ) ( not ( = ?auto_317728 ?auto_317733 ) ) ( not ( = ?auto_317728 ?auto_317734 ) ) ( not ( = ?auto_317728 ?auto_317735 ) ) ( not ( = ?auto_317728 ?auto_317736 ) ) ( not ( = ?auto_317728 ?auto_317737 ) ) ( not ( = ?auto_317728 ?auto_317738 ) ) ( not ( = ?auto_317728 ?auto_317739 ) ) ( not ( = ?auto_317728 ?auto_317740 ) ) ( not ( = ?auto_317729 ?auto_317730 ) ) ( not ( = ?auto_317729 ?auto_317731 ) ) ( not ( = ?auto_317729 ?auto_317732 ) ) ( not ( = ?auto_317729 ?auto_317733 ) ) ( not ( = ?auto_317729 ?auto_317734 ) ) ( not ( = ?auto_317729 ?auto_317735 ) ) ( not ( = ?auto_317729 ?auto_317736 ) ) ( not ( = ?auto_317729 ?auto_317737 ) ) ( not ( = ?auto_317729 ?auto_317738 ) ) ( not ( = ?auto_317729 ?auto_317739 ) ) ( not ( = ?auto_317729 ?auto_317740 ) ) ( not ( = ?auto_317730 ?auto_317731 ) ) ( not ( = ?auto_317730 ?auto_317732 ) ) ( not ( = ?auto_317730 ?auto_317733 ) ) ( not ( = ?auto_317730 ?auto_317734 ) ) ( not ( = ?auto_317730 ?auto_317735 ) ) ( not ( = ?auto_317730 ?auto_317736 ) ) ( not ( = ?auto_317730 ?auto_317737 ) ) ( not ( = ?auto_317730 ?auto_317738 ) ) ( not ( = ?auto_317730 ?auto_317739 ) ) ( not ( = ?auto_317730 ?auto_317740 ) ) ( not ( = ?auto_317731 ?auto_317732 ) ) ( not ( = ?auto_317731 ?auto_317733 ) ) ( not ( = ?auto_317731 ?auto_317734 ) ) ( not ( = ?auto_317731 ?auto_317735 ) ) ( not ( = ?auto_317731 ?auto_317736 ) ) ( not ( = ?auto_317731 ?auto_317737 ) ) ( not ( = ?auto_317731 ?auto_317738 ) ) ( not ( = ?auto_317731 ?auto_317739 ) ) ( not ( = ?auto_317731 ?auto_317740 ) ) ( not ( = ?auto_317732 ?auto_317733 ) ) ( not ( = ?auto_317732 ?auto_317734 ) ) ( not ( = ?auto_317732 ?auto_317735 ) ) ( not ( = ?auto_317732 ?auto_317736 ) ) ( not ( = ?auto_317732 ?auto_317737 ) ) ( not ( = ?auto_317732 ?auto_317738 ) ) ( not ( = ?auto_317732 ?auto_317739 ) ) ( not ( = ?auto_317732 ?auto_317740 ) ) ( not ( = ?auto_317733 ?auto_317734 ) ) ( not ( = ?auto_317733 ?auto_317735 ) ) ( not ( = ?auto_317733 ?auto_317736 ) ) ( not ( = ?auto_317733 ?auto_317737 ) ) ( not ( = ?auto_317733 ?auto_317738 ) ) ( not ( = ?auto_317733 ?auto_317739 ) ) ( not ( = ?auto_317733 ?auto_317740 ) ) ( not ( = ?auto_317734 ?auto_317735 ) ) ( not ( = ?auto_317734 ?auto_317736 ) ) ( not ( = ?auto_317734 ?auto_317737 ) ) ( not ( = ?auto_317734 ?auto_317738 ) ) ( not ( = ?auto_317734 ?auto_317739 ) ) ( not ( = ?auto_317734 ?auto_317740 ) ) ( not ( = ?auto_317735 ?auto_317736 ) ) ( not ( = ?auto_317735 ?auto_317737 ) ) ( not ( = ?auto_317735 ?auto_317738 ) ) ( not ( = ?auto_317735 ?auto_317739 ) ) ( not ( = ?auto_317735 ?auto_317740 ) ) ( not ( = ?auto_317736 ?auto_317737 ) ) ( not ( = ?auto_317736 ?auto_317738 ) ) ( not ( = ?auto_317736 ?auto_317739 ) ) ( not ( = ?auto_317736 ?auto_317740 ) ) ( not ( = ?auto_317737 ?auto_317738 ) ) ( not ( = ?auto_317737 ?auto_317739 ) ) ( not ( = ?auto_317737 ?auto_317740 ) ) ( not ( = ?auto_317738 ?auto_317739 ) ) ( not ( = ?auto_317738 ?auto_317740 ) ) ( not ( = ?auto_317739 ?auto_317740 ) ) ( ON ?auto_317739 ?auto_317740 ) ( ON ?auto_317738 ?auto_317739 ) ( ON ?auto_317737 ?auto_317738 ) ( ON ?auto_317736 ?auto_317737 ) ( ON ?auto_317735 ?auto_317736 ) ( ON ?auto_317734 ?auto_317735 ) ( ON ?auto_317733 ?auto_317734 ) ( ON ?auto_317732 ?auto_317733 ) ( ON ?auto_317731 ?auto_317732 ) ( ON ?auto_317730 ?auto_317731 ) ( ON ?auto_317729 ?auto_317730 ) ( ON ?auto_317728 ?auto_317729 ) ( ON ?auto_317727 ?auto_317728 ) ( CLEAR ?auto_317727 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_317727 )
      ( MAKE-14PILE ?auto_317727 ?auto_317728 ?auto_317729 ?auto_317730 ?auto_317731 ?auto_317732 ?auto_317733 ?auto_317734 ?auto_317735 ?auto_317736 ?auto_317737 ?auto_317738 ?auto_317739 ?auto_317740 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_317755 - BLOCK
      ?auto_317756 - BLOCK
      ?auto_317757 - BLOCK
      ?auto_317758 - BLOCK
      ?auto_317759 - BLOCK
      ?auto_317760 - BLOCK
      ?auto_317761 - BLOCK
      ?auto_317762 - BLOCK
      ?auto_317763 - BLOCK
      ?auto_317764 - BLOCK
      ?auto_317765 - BLOCK
      ?auto_317766 - BLOCK
      ?auto_317767 - BLOCK
      ?auto_317768 - BLOCK
    )
    :vars
    (
      ?auto_317769 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_317755 ?auto_317756 ) ) ( not ( = ?auto_317755 ?auto_317757 ) ) ( not ( = ?auto_317755 ?auto_317758 ) ) ( not ( = ?auto_317755 ?auto_317759 ) ) ( not ( = ?auto_317755 ?auto_317760 ) ) ( not ( = ?auto_317755 ?auto_317761 ) ) ( not ( = ?auto_317755 ?auto_317762 ) ) ( not ( = ?auto_317755 ?auto_317763 ) ) ( not ( = ?auto_317755 ?auto_317764 ) ) ( not ( = ?auto_317755 ?auto_317765 ) ) ( not ( = ?auto_317755 ?auto_317766 ) ) ( not ( = ?auto_317755 ?auto_317767 ) ) ( not ( = ?auto_317755 ?auto_317768 ) ) ( not ( = ?auto_317756 ?auto_317757 ) ) ( not ( = ?auto_317756 ?auto_317758 ) ) ( not ( = ?auto_317756 ?auto_317759 ) ) ( not ( = ?auto_317756 ?auto_317760 ) ) ( not ( = ?auto_317756 ?auto_317761 ) ) ( not ( = ?auto_317756 ?auto_317762 ) ) ( not ( = ?auto_317756 ?auto_317763 ) ) ( not ( = ?auto_317756 ?auto_317764 ) ) ( not ( = ?auto_317756 ?auto_317765 ) ) ( not ( = ?auto_317756 ?auto_317766 ) ) ( not ( = ?auto_317756 ?auto_317767 ) ) ( not ( = ?auto_317756 ?auto_317768 ) ) ( not ( = ?auto_317757 ?auto_317758 ) ) ( not ( = ?auto_317757 ?auto_317759 ) ) ( not ( = ?auto_317757 ?auto_317760 ) ) ( not ( = ?auto_317757 ?auto_317761 ) ) ( not ( = ?auto_317757 ?auto_317762 ) ) ( not ( = ?auto_317757 ?auto_317763 ) ) ( not ( = ?auto_317757 ?auto_317764 ) ) ( not ( = ?auto_317757 ?auto_317765 ) ) ( not ( = ?auto_317757 ?auto_317766 ) ) ( not ( = ?auto_317757 ?auto_317767 ) ) ( not ( = ?auto_317757 ?auto_317768 ) ) ( not ( = ?auto_317758 ?auto_317759 ) ) ( not ( = ?auto_317758 ?auto_317760 ) ) ( not ( = ?auto_317758 ?auto_317761 ) ) ( not ( = ?auto_317758 ?auto_317762 ) ) ( not ( = ?auto_317758 ?auto_317763 ) ) ( not ( = ?auto_317758 ?auto_317764 ) ) ( not ( = ?auto_317758 ?auto_317765 ) ) ( not ( = ?auto_317758 ?auto_317766 ) ) ( not ( = ?auto_317758 ?auto_317767 ) ) ( not ( = ?auto_317758 ?auto_317768 ) ) ( not ( = ?auto_317759 ?auto_317760 ) ) ( not ( = ?auto_317759 ?auto_317761 ) ) ( not ( = ?auto_317759 ?auto_317762 ) ) ( not ( = ?auto_317759 ?auto_317763 ) ) ( not ( = ?auto_317759 ?auto_317764 ) ) ( not ( = ?auto_317759 ?auto_317765 ) ) ( not ( = ?auto_317759 ?auto_317766 ) ) ( not ( = ?auto_317759 ?auto_317767 ) ) ( not ( = ?auto_317759 ?auto_317768 ) ) ( not ( = ?auto_317760 ?auto_317761 ) ) ( not ( = ?auto_317760 ?auto_317762 ) ) ( not ( = ?auto_317760 ?auto_317763 ) ) ( not ( = ?auto_317760 ?auto_317764 ) ) ( not ( = ?auto_317760 ?auto_317765 ) ) ( not ( = ?auto_317760 ?auto_317766 ) ) ( not ( = ?auto_317760 ?auto_317767 ) ) ( not ( = ?auto_317760 ?auto_317768 ) ) ( not ( = ?auto_317761 ?auto_317762 ) ) ( not ( = ?auto_317761 ?auto_317763 ) ) ( not ( = ?auto_317761 ?auto_317764 ) ) ( not ( = ?auto_317761 ?auto_317765 ) ) ( not ( = ?auto_317761 ?auto_317766 ) ) ( not ( = ?auto_317761 ?auto_317767 ) ) ( not ( = ?auto_317761 ?auto_317768 ) ) ( not ( = ?auto_317762 ?auto_317763 ) ) ( not ( = ?auto_317762 ?auto_317764 ) ) ( not ( = ?auto_317762 ?auto_317765 ) ) ( not ( = ?auto_317762 ?auto_317766 ) ) ( not ( = ?auto_317762 ?auto_317767 ) ) ( not ( = ?auto_317762 ?auto_317768 ) ) ( not ( = ?auto_317763 ?auto_317764 ) ) ( not ( = ?auto_317763 ?auto_317765 ) ) ( not ( = ?auto_317763 ?auto_317766 ) ) ( not ( = ?auto_317763 ?auto_317767 ) ) ( not ( = ?auto_317763 ?auto_317768 ) ) ( not ( = ?auto_317764 ?auto_317765 ) ) ( not ( = ?auto_317764 ?auto_317766 ) ) ( not ( = ?auto_317764 ?auto_317767 ) ) ( not ( = ?auto_317764 ?auto_317768 ) ) ( not ( = ?auto_317765 ?auto_317766 ) ) ( not ( = ?auto_317765 ?auto_317767 ) ) ( not ( = ?auto_317765 ?auto_317768 ) ) ( not ( = ?auto_317766 ?auto_317767 ) ) ( not ( = ?auto_317766 ?auto_317768 ) ) ( not ( = ?auto_317767 ?auto_317768 ) ) ( ON ?auto_317755 ?auto_317769 ) ( not ( = ?auto_317768 ?auto_317769 ) ) ( not ( = ?auto_317767 ?auto_317769 ) ) ( not ( = ?auto_317766 ?auto_317769 ) ) ( not ( = ?auto_317765 ?auto_317769 ) ) ( not ( = ?auto_317764 ?auto_317769 ) ) ( not ( = ?auto_317763 ?auto_317769 ) ) ( not ( = ?auto_317762 ?auto_317769 ) ) ( not ( = ?auto_317761 ?auto_317769 ) ) ( not ( = ?auto_317760 ?auto_317769 ) ) ( not ( = ?auto_317759 ?auto_317769 ) ) ( not ( = ?auto_317758 ?auto_317769 ) ) ( not ( = ?auto_317757 ?auto_317769 ) ) ( not ( = ?auto_317756 ?auto_317769 ) ) ( not ( = ?auto_317755 ?auto_317769 ) ) ( ON ?auto_317756 ?auto_317755 ) ( ON ?auto_317757 ?auto_317756 ) ( ON ?auto_317758 ?auto_317757 ) ( ON ?auto_317759 ?auto_317758 ) ( ON ?auto_317760 ?auto_317759 ) ( ON ?auto_317761 ?auto_317760 ) ( ON ?auto_317762 ?auto_317761 ) ( ON ?auto_317763 ?auto_317762 ) ( ON ?auto_317764 ?auto_317763 ) ( ON ?auto_317765 ?auto_317764 ) ( ON ?auto_317766 ?auto_317765 ) ( ON ?auto_317767 ?auto_317766 ) ( ON ?auto_317768 ?auto_317767 ) ( CLEAR ?auto_317768 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_317768 ?auto_317767 ?auto_317766 ?auto_317765 ?auto_317764 ?auto_317763 ?auto_317762 ?auto_317761 ?auto_317760 ?auto_317759 ?auto_317758 ?auto_317757 ?auto_317756 ?auto_317755 )
      ( MAKE-14PILE ?auto_317755 ?auto_317756 ?auto_317757 ?auto_317758 ?auto_317759 ?auto_317760 ?auto_317761 ?auto_317762 ?auto_317763 ?auto_317764 ?auto_317765 ?auto_317766 ?auto_317767 ?auto_317768 ) )
  )

)

