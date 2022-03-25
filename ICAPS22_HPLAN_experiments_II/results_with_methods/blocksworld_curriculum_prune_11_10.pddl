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
      ?auto_128421 - BLOCK
    )
    :vars
    (
      ?auto_128422 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_128421 ?auto_128422 ) ( CLEAR ?auto_128421 ) ( HAND-EMPTY ) ( not ( = ?auto_128421 ?auto_128422 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_128421 ?auto_128422 )
      ( !PUTDOWN ?auto_128421 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_128428 - BLOCK
      ?auto_128429 - BLOCK
    )
    :vars
    (
      ?auto_128430 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_128428 ) ( ON ?auto_128429 ?auto_128430 ) ( CLEAR ?auto_128429 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_128428 ) ( not ( = ?auto_128428 ?auto_128429 ) ) ( not ( = ?auto_128428 ?auto_128430 ) ) ( not ( = ?auto_128429 ?auto_128430 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_128429 ?auto_128430 )
      ( !STACK ?auto_128429 ?auto_128428 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_128438 - BLOCK
      ?auto_128439 - BLOCK
    )
    :vars
    (
      ?auto_128440 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_128439 ?auto_128440 ) ( not ( = ?auto_128438 ?auto_128439 ) ) ( not ( = ?auto_128438 ?auto_128440 ) ) ( not ( = ?auto_128439 ?auto_128440 ) ) ( ON ?auto_128438 ?auto_128439 ) ( CLEAR ?auto_128438 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_128438 )
      ( MAKE-2PILE ?auto_128438 ?auto_128439 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_128449 - BLOCK
      ?auto_128450 - BLOCK
      ?auto_128451 - BLOCK
    )
    :vars
    (
      ?auto_128452 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_128450 ) ( ON ?auto_128451 ?auto_128452 ) ( CLEAR ?auto_128451 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_128449 ) ( ON ?auto_128450 ?auto_128449 ) ( not ( = ?auto_128449 ?auto_128450 ) ) ( not ( = ?auto_128449 ?auto_128451 ) ) ( not ( = ?auto_128449 ?auto_128452 ) ) ( not ( = ?auto_128450 ?auto_128451 ) ) ( not ( = ?auto_128450 ?auto_128452 ) ) ( not ( = ?auto_128451 ?auto_128452 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_128451 ?auto_128452 )
      ( !STACK ?auto_128451 ?auto_128450 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_128463 - BLOCK
      ?auto_128464 - BLOCK
      ?auto_128465 - BLOCK
    )
    :vars
    (
      ?auto_128466 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_128465 ?auto_128466 ) ( ON-TABLE ?auto_128463 ) ( not ( = ?auto_128463 ?auto_128464 ) ) ( not ( = ?auto_128463 ?auto_128465 ) ) ( not ( = ?auto_128463 ?auto_128466 ) ) ( not ( = ?auto_128464 ?auto_128465 ) ) ( not ( = ?auto_128464 ?auto_128466 ) ) ( not ( = ?auto_128465 ?auto_128466 ) ) ( CLEAR ?auto_128463 ) ( ON ?auto_128464 ?auto_128465 ) ( CLEAR ?auto_128464 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_128463 ?auto_128464 )
      ( MAKE-3PILE ?auto_128463 ?auto_128464 ?auto_128465 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_128477 - BLOCK
      ?auto_128478 - BLOCK
      ?auto_128479 - BLOCK
    )
    :vars
    (
      ?auto_128480 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_128479 ?auto_128480 ) ( not ( = ?auto_128477 ?auto_128478 ) ) ( not ( = ?auto_128477 ?auto_128479 ) ) ( not ( = ?auto_128477 ?auto_128480 ) ) ( not ( = ?auto_128478 ?auto_128479 ) ) ( not ( = ?auto_128478 ?auto_128480 ) ) ( not ( = ?auto_128479 ?auto_128480 ) ) ( ON ?auto_128478 ?auto_128479 ) ( ON ?auto_128477 ?auto_128478 ) ( CLEAR ?auto_128477 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_128477 )
      ( MAKE-3PILE ?auto_128477 ?auto_128478 ?auto_128479 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_128492 - BLOCK
      ?auto_128493 - BLOCK
      ?auto_128494 - BLOCK
      ?auto_128495 - BLOCK
    )
    :vars
    (
      ?auto_128496 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_128494 ) ( ON ?auto_128495 ?auto_128496 ) ( CLEAR ?auto_128495 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_128492 ) ( ON ?auto_128493 ?auto_128492 ) ( ON ?auto_128494 ?auto_128493 ) ( not ( = ?auto_128492 ?auto_128493 ) ) ( not ( = ?auto_128492 ?auto_128494 ) ) ( not ( = ?auto_128492 ?auto_128495 ) ) ( not ( = ?auto_128492 ?auto_128496 ) ) ( not ( = ?auto_128493 ?auto_128494 ) ) ( not ( = ?auto_128493 ?auto_128495 ) ) ( not ( = ?auto_128493 ?auto_128496 ) ) ( not ( = ?auto_128494 ?auto_128495 ) ) ( not ( = ?auto_128494 ?auto_128496 ) ) ( not ( = ?auto_128495 ?auto_128496 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_128495 ?auto_128496 )
      ( !STACK ?auto_128495 ?auto_128494 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_128510 - BLOCK
      ?auto_128511 - BLOCK
      ?auto_128512 - BLOCK
      ?auto_128513 - BLOCK
    )
    :vars
    (
      ?auto_128514 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_128513 ?auto_128514 ) ( ON-TABLE ?auto_128510 ) ( ON ?auto_128511 ?auto_128510 ) ( not ( = ?auto_128510 ?auto_128511 ) ) ( not ( = ?auto_128510 ?auto_128512 ) ) ( not ( = ?auto_128510 ?auto_128513 ) ) ( not ( = ?auto_128510 ?auto_128514 ) ) ( not ( = ?auto_128511 ?auto_128512 ) ) ( not ( = ?auto_128511 ?auto_128513 ) ) ( not ( = ?auto_128511 ?auto_128514 ) ) ( not ( = ?auto_128512 ?auto_128513 ) ) ( not ( = ?auto_128512 ?auto_128514 ) ) ( not ( = ?auto_128513 ?auto_128514 ) ) ( CLEAR ?auto_128511 ) ( ON ?auto_128512 ?auto_128513 ) ( CLEAR ?auto_128512 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_128510 ?auto_128511 ?auto_128512 )
      ( MAKE-4PILE ?auto_128510 ?auto_128511 ?auto_128512 ?auto_128513 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_128528 - BLOCK
      ?auto_128529 - BLOCK
      ?auto_128530 - BLOCK
      ?auto_128531 - BLOCK
    )
    :vars
    (
      ?auto_128532 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_128531 ?auto_128532 ) ( ON-TABLE ?auto_128528 ) ( not ( = ?auto_128528 ?auto_128529 ) ) ( not ( = ?auto_128528 ?auto_128530 ) ) ( not ( = ?auto_128528 ?auto_128531 ) ) ( not ( = ?auto_128528 ?auto_128532 ) ) ( not ( = ?auto_128529 ?auto_128530 ) ) ( not ( = ?auto_128529 ?auto_128531 ) ) ( not ( = ?auto_128529 ?auto_128532 ) ) ( not ( = ?auto_128530 ?auto_128531 ) ) ( not ( = ?auto_128530 ?auto_128532 ) ) ( not ( = ?auto_128531 ?auto_128532 ) ) ( ON ?auto_128530 ?auto_128531 ) ( CLEAR ?auto_128528 ) ( ON ?auto_128529 ?auto_128530 ) ( CLEAR ?auto_128529 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_128528 ?auto_128529 )
      ( MAKE-4PILE ?auto_128528 ?auto_128529 ?auto_128530 ?auto_128531 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_128546 - BLOCK
      ?auto_128547 - BLOCK
      ?auto_128548 - BLOCK
      ?auto_128549 - BLOCK
    )
    :vars
    (
      ?auto_128550 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_128549 ?auto_128550 ) ( not ( = ?auto_128546 ?auto_128547 ) ) ( not ( = ?auto_128546 ?auto_128548 ) ) ( not ( = ?auto_128546 ?auto_128549 ) ) ( not ( = ?auto_128546 ?auto_128550 ) ) ( not ( = ?auto_128547 ?auto_128548 ) ) ( not ( = ?auto_128547 ?auto_128549 ) ) ( not ( = ?auto_128547 ?auto_128550 ) ) ( not ( = ?auto_128548 ?auto_128549 ) ) ( not ( = ?auto_128548 ?auto_128550 ) ) ( not ( = ?auto_128549 ?auto_128550 ) ) ( ON ?auto_128548 ?auto_128549 ) ( ON ?auto_128547 ?auto_128548 ) ( ON ?auto_128546 ?auto_128547 ) ( CLEAR ?auto_128546 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_128546 )
      ( MAKE-4PILE ?auto_128546 ?auto_128547 ?auto_128548 ?auto_128549 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_128565 - BLOCK
      ?auto_128566 - BLOCK
      ?auto_128567 - BLOCK
      ?auto_128568 - BLOCK
      ?auto_128569 - BLOCK
    )
    :vars
    (
      ?auto_128570 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_128568 ) ( ON ?auto_128569 ?auto_128570 ) ( CLEAR ?auto_128569 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_128565 ) ( ON ?auto_128566 ?auto_128565 ) ( ON ?auto_128567 ?auto_128566 ) ( ON ?auto_128568 ?auto_128567 ) ( not ( = ?auto_128565 ?auto_128566 ) ) ( not ( = ?auto_128565 ?auto_128567 ) ) ( not ( = ?auto_128565 ?auto_128568 ) ) ( not ( = ?auto_128565 ?auto_128569 ) ) ( not ( = ?auto_128565 ?auto_128570 ) ) ( not ( = ?auto_128566 ?auto_128567 ) ) ( not ( = ?auto_128566 ?auto_128568 ) ) ( not ( = ?auto_128566 ?auto_128569 ) ) ( not ( = ?auto_128566 ?auto_128570 ) ) ( not ( = ?auto_128567 ?auto_128568 ) ) ( not ( = ?auto_128567 ?auto_128569 ) ) ( not ( = ?auto_128567 ?auto_128570 ) ) ( not ( = ?auto_128568 ?auto_128569 ) ) ( not ( = ?auto_128568 ?auto_128570 ) ) ( not ( = ?auto_128569 ?auto_128570 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_128569 ?auto_128570 )
      ( !STACK ?auto_128569 ?auto_128568 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_128587 - BLOCK
      ?auto_128588 - BLOCK
      ?auto_128589 - BLOCK
      ?auto_128590 - BLOCK
      ?auto_128591 - BLOCK
    )
    :vars
    (
      ?auto_128592 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_128591 ?auto_128592 ) ( ON-TABLE ?auto_128587 ) ( ON ?auto_128588 ?auto_128587 ) ( ON ?auto_128589 ?auto_128588 ) ( not ( = ?auto_128587 ?auto_128588 ) ) ( not ( = ?auto_128587 ?auto_128589 ) ) ( not ( = ?auto_128587 ?auto_128590 ) ) ( not ( = ?auto_128587 ?auto_128591 ) ) ( not ( = ?auto_128587 ?auto_128592 ) ) ( not ( = ?auto_128588 ?auto_128589 ) ) ( not ( = ?auto_128588 ?auto_128590 ) ) ( not ( = ?auto_128588 ?auto_128591 ) ) ( not ( = ?auto_128588 ?auto_128592 ) ) ( not ( = ?auto_128589 ?auto_128590 ) ) ( not ( = ?auto_128589 ?auto_128591 ) ) ( not ( = ?auto_128589 ?auto_128592 ) ) ( not ( = ?auto_128590 ?auto_128591 ) ) ( not ( = ?auto_128590 ?auto_128592 ) ) ( not ( = ?auto_128591 ?auto_128592 ) ) ( CLEAR ?auto_128589 ) ( ON ?auto_128590 ?auto_128591 ) ( CLEAR ?auto_128590 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_128587 ?auto_128588 ?auto_128589 ?auto_128590 )
      ( MAKE-5PILE ?auto_128587 ?auto_128588 ?auto_128589 ?auto_128590 ?auto_128591 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_128609 - BLOCK
      ?auto_128610 - BLOCK
      ?auto_128611 - BLOCK
      ?auto_128612 - BLOCK
      ?auto_128613 - BLOCK
    )
    :vars
    (
      ?auto_128614 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_128613 ?auto_128614 ) ( ON-TABLE ?auto_128609 ) ( ON ?auto_128610 ?auto_128609 ) ( not ( = ?auto_128609 ?auto_128610 ) ) ( not ( = ?auto_128609 ?auto_128611 ) ) ( not ( = ?auto_128609 ?auto_128612 ) ) ( not ( = ?auto_128609 ?auto_128613 ) ) ( not ( = ?auto_128609 ?auto_128614 ) ) ( not ( = ?auto_128610 ?auto_128611 ) ) ( not ( = ?auto_128610 ?auto_128612 ) ) ( not ( = ?auto_128610 ?auto_128613 ) ) ( not ( = ?auto_128610 ?auto_128614 ) ) ( not ( = ?auto_128611 ?auto_128612 ) ) ( not ( = ?auto_128611 ?auto_128613 ) ) ( not ( = ?auto_128611 ?auto_128614 ) ) ( not ( = ?auto_128612 ?auto_128613 ) ) ( not ( = ?auto_128612 ?auto_128614 ) ) ( not ( = ?auto_128613 ?auto_128614 ) ) ( ON ?auto_128612 ?auto_128613 ) ( CLEAR ?auto_128610 ) ( ON ?auto_128611 ?auto_128612 ) ( CLEAR ?auto_128611 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_128609 ?auto_128610 ?auto_128611 )
      ( MAKE-5PILE ?auto_128609 ?auto_128610 ?auto_128611 ?auto_128612 ?auto_128613 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_128631 - BLOCK
      ?auto_128632 - BLOCK
      ?auto_128633 - BLOCK
      ?auto_128634 - BLOCK
      ?auto_128635 - BLOCK
    )
    :vars
    (
      ?auto_128636 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_128635 ?auto_128636 ) ( ON-TABLE ?auto_128631 ) ( not ( = ?auto_128631 ?auto_128632 ) ) ( not ( = ?auto_128631 ?auto_128633 ) ) ( not ( = ?auto_128631 ?auto_128634 ) ) ( not ( = ?auto_128631 ?auto_128635 ) ) ( not ( = ?auto_128631 ?auto_128636 ) ) ( not ( = ?auto_128632 ?auto_128633 ) ) ( not ( = ?auto_128632 ?auto_128634 ) ) ( not ( = ?auto_128632 ?auto_128635 ) ) ( not ( = ?auto_128632 ?auto_128636 ) ) ( not ( = ?auto_128633 ?auto_128634 ) ) ( not ( = ?auto_128633 ?auto_128635 ) ) ( not ( = ?auto_128633 ?auto_128636 ) ) ( not ( = ?auto_128634 ?auto_128635 ) ) ( not ( = ?auto_128634 ?auto_128636 ) ) ( not ( = ?auto_128635 ?auto_128636 ) ) ( ON ?auto_128634 ?auto_128635 ) ( ON ?auto_128633 ?auto_128634 ) ( CLEAR ?auto_128631 ) ( ON ?auto_128632 ?auto_128633 ) ( CLEAR ?auto_128632 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_128631 ?auto_128632 )
      ( MAKE-5PILE ?auto_128631 ?auto_128632 ?auto_128633 ?auto_128634 ?auto_128635 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_128653 - BLOCK
      ?auto_128654 - BLOCK
      ?auto_128655 - BLOCK
      ?auto_128656 - BLOCK
      ?auto_128657 - BLOCK
    )
    :vars
    (
      ?auto_128658 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_128657 ?auto_128658 ) ( not ( = ?auto_128653 ?auto_128654 ) ) ( not ( = ?auto_128653 ?auto_128655 ) ) ( not ( = ?auto_128653 ?auto_128656 ) ) ( not ( = ?auto_128653 ?auto_128657 ) ) ( not ( = ?auto_128653 ?auto_128658 ) ) ( not ( = ?auto_128654 ?auto_128655 ) ) ( not ( = ?auto_128654 ?auto_128656 ) ) ( not ( = ?auto_128654 ?auto_128657 ) ) ( not ( = ?auto_128654 ?auto_128658 ) ) ( not ( = ?auto_128655 ?auto_128656 ) ) ( not ( = ?auto_128655 ?auto_128657 ) ) ( not ( = ?auto_128655 ?auto_128658 ) ) ( not ( = ?auto_128656 ?auto_128657 ) ) ( not ( = ?auto_128656 ?auto_128658 ) ) ( not ( = ?auto_128657 ?auto_128658 ) ) ( ON ?auto_128656 ?auto_128657 ) ( ON ?auto_128655 ?auto_128656 ) ( ON ?auto_128654 ?auto_128655 ) ( ON ?auto_128653 ?auto_128654 ) ( CLEAR ?auto_128653 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_128653 )
      ( MAKE-5PILE ?auto_128653 ?auto_128654 ?auto_128655 ?auto_128656 ?auto_128657 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_128676 - BLOCK
      ?auto_128677 - BLOCK
      ?auto_128678 - BLOCK
      ?auto_128679 - BLOCK
      ?auto_128680 - BLOCK
      ?auto_128681 - BLOCK
    )
    :vars
    (
      ?auto_128682 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_128680 ) ( ON ?auto_128681 ?auto_128682 ) ( CLEAR ?auto_128681 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_128676 ) ( ON ?auto_128677 ?auto_128676 ) ( ON ?auto_128678 ?auto_128677 ) ( ON ?auto_128679 ?auto_128678 ) ( ON ?auto_128680 ?auto_128679 ) ( not ( = ?auto_128676 ?auto_128677 ) ) ( not ( = ?auto_128676 ?auto_128678 ) ) ( not ( = ?auto_128676 ?auto_128679 ) ) ( not ( = ?auto_128676 ?auto_128680 ) ) ( not ( = ?auto_128676 ?auto_128681 ) ) ( not ( = ?auto_128676 ?auto_128682 ) ) ( not ( = ?auto_128677 ?auto_128678 ) ) ( not ( = ?auto_128677 ?auto_128679 ) ) ( not ( = ?auto_128677 ?auto_128680 ) ) ( not ( = ?auto_128677 ?auto_128681 ) ) ( not ( = ?auto_128677 ?auto_128682 ) ) ( not ( = ?auto_128678 ?auto_128679 ) ) ( not ( = ?auto_128678 ?auto_128680 ) ) ( not ( = ?auto_128678 ?auto_128681 ) ) ( not ( = ?auto_128678 ?auto_128682 ) ) ( not ( = ?auto_128679 ?auto_128680 ) ) ( not ( = ?auto_128679 ?auto_128681 ) ) ( not ( = ?auto_128679 ?auto_128682 ) ) ( not ( = ?auto_128680 ?auto_128681 ) ) ( not ( = ?auto_128680 ?auto_128682 ) ) ( not ( = ?auto_128681 ?auto_128682 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_128681 ?auto_128682 )
      ( !STACK ?auto_128681 ?auto_128680 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_128702 - BLOCK
      ?auto_128703 - BLOCK
      ?auto_128704 - BLOCK
      ?auto_128705 - BLOCK
      ?auto_128706 - BLOCK
      ?auto_128707 - BLOCK
    )
    :vars
    (
      ?auto_128708 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_128707 ?auto_128708 ) ( ON-TABLE ?auto_128702 ) ( ON ?auto_128703 ?auto_128702 ) ( ON ?auto_128704 ?auto_128703 ) ( ON ?auto_128705 ?auto_128704 ) ( not ( = ?auto_128702 ?auto_128703 ) ) ( not ( = ?auto_128702 ?auto_128704 ) ) ( not ( = ?auto_128702 ?auto_128705 ) ) ( not ( = ?auto_128702 ?auto_128706 ) ) ( not ( = ?auto_128702 ?auto_128707 ) ) ( not ( = ?auto_128702 ?auto_128708 ) ) ( not ( = ?auto_128703 ?auto_128704 ) ) ( not ( = ?auto_128703 ?auto_128705 ) ) ( not ( = ?auto_128703 ?auto_128706 ) ) ( not ( = ?auto_128703 ?auto_128707 ) ) ( not ( = ?auto_128703 ?auto_128708 ) ) ( not ( = ?auto_128704 ?auto_128705 ) ) ( not ( = ?auto_128704 ?auto_128706 ) ) ( not ( = ?auto_128704 ?auto_128707 ) ) ( not ( = ?auto_128704 ?auto_128708 ) ) ( not ( = ?auto_128705 ?auto_128706 ) ) ( not ( = ?auto_128705 ?auto_128707 ) ) ( not ( = ?auto_128705 ?auto_128708 ) ) ( not ( = ?auto_128706 ?auto_128707 ) ) ( not ( = ?auto_128706 ?auto_128708 ) ) ( not ( = ?auto_128707 ?auto_128708 ) ) ( CLEAR ?auto_128705 ) ( ON ?auto_128706 ?auto_128707 ) ( CLEAR ?auto_128706 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_128702 ?auto_128703 ?auto_128704 ?auto_128705 ?auto_128706 )
      ( MAKE-6PILE ?auto_128702 ?auto_128703 ?auto_128704 ?auto_128705 ?auto_128706 ?auto_128707 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_128728 - BLOCK
      ?auto_128729 - BLOCK
      ?auto_128730 - BLOCK
      ?auto_128731 - BLOCK
      ?auto_128732 - BLOCK
      ?auto_128733 - BLOCK
    )
    :vars
    (
      ?auto_128734 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_128733 ?auto_128734 ) ( ON-TABLE ?auto_128728 ) ( ON ?auto_128729 ?auto_128728 ) ( ON ?auto_128730 ?auto_128729 ) ( not ( = ?auto_128728 ?auto_128729 ) ) ( not ( = ?auto_128728 ?auto_128730 ) ) ( not ( = ?auto_128728 ?auto_128731 ) ) ( not ( = ?auto_128728 ?auto_128732 ) ) ( not ( = ?auto_128728 ?auto_128733 ) ) ( not ( = ?auto_128728 ?auto_128734 ) ) ( not ( = ?auto_128729 ?auto_128730 ) ) ( not ( = ?auto_128729 ?auto_128731 ) ) ( not ( = ?auto_128729 ?auto_128732 ) ) ( not ( = ?auto_128729 ?auto_128733 ) ) ( not ( = ?auto_128729 ?auto_128734 ) ) ( not ( = ?auto_128730 ?auto_128731 ) ) ( not ( = ?auto_128730 ?auto_128732 ) ) ( not ( = ?auto_128730 ?auto_128733 ) ) ( not ( = ?auto_128730 ?auto_128734 ) ) ( not ( = ?auto_128731 ?auto_128732 ) ) ( not ( = ?auto_128731 ?auto_128733 ) ) ( not ( = ?auto_128731 ?auto_128734 ) ) ( not ( = ?auto_128732 ?auto_128733 ) ) ( not ( = ?auto_128732 ?auto_128734 ) ) ( not ( = ?auto_128733 ?auto_128734 ) ) ( ON ?auto_128732 ?auto_128733 ) ( CLEAR ?auto_128730 ) ( ON ?auto_128731 ?auto_128732 ) ( CLEAR ?auto_128731 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_128728 ?auto_128729 ?auto_128730 ?auto_128731 )
      ( MAKE-6PILE ?auto_128728 ?auto_128729 ?auto_128730 ?auto_128731 ?auto_128732 ?auto_128733 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_128754 - BLOCK
      ?auto_128755 - BLOCK
      ?auto_128756 - BLOCK
      ?auto_128757 - BLOCK
      ?auto_128758 - BLOCK
      ?auto_128759 - BLOCK
    )
    :vars
    (
      ?auto_128760 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_128759 ?auto_128760 ) ( ON-TABLE ?auto_128754 ) ( ON ?auto_128755 ?auto_128754 ) ( not ( = ?auto_128754 ?auto_128755 ) ) ( not ( = ?auto_128754 ?auto_128756 ) ) ( not ( = ?auto_128754 ?auto_128757 ) ) ( not ( = ?auto_128754 ?auto_128758 ) ) ( not ( = ?auto_128754 ?auto_128759 ) ) ( not ( = ?auto_128754 ?auto_128760 ) ) ( not ( = ?auto_128755 ?auto_128756 ) ) ( not ( = ?auto_128755 ?auto_128757 ) ) ( not ( = ?auto_128755 ?auto_128758 ) ) ( not ( = ?auto_128755 ?auto_128759 ) ) ( not ( = ?auto_128755 ?auto_128760 ) ) ( not ( = ?auto_128756 ?auto_128757 ) ) ( not ( = ?auto_128756 ?auto_128758 ) ) ( not ( = ?auto_128756 ?auto_128759 ) ) ( not ( = ?auto_128756 ?auto_128760 ) ) ( not ( = ?auto_128757 ?auto_128758 ) ) ( not ( = ?auto_128757 ?auto_128759 ) ) ( not ( = ?auto_128757 ?auto_128760 ) ) ( not ( = ?auto_128758 ?auto_128759 ) ) ( not ( = ?auto_128758 ?auto_128760 ) ) ( not ( = ?auto_128759 ?auto_128760 ) ) ( ON ?auto_128758 ?auto_128759 ) ( ON ?auto_128757 ?auto_128758 ) ( CLEAR ?auto_128755 ) ( ON ?auto_128756 ?auto_128757 ) ( CLEAR ?auto_128756 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_128754 ?auto_128755 ?auto_128756 )
      ( MAKE-6PILE ?auto_128754 ?auto_128755 ?auto_128756 ?auto_128757 ?auto_128758 ?auto_128759 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_128780 - BLOCK
      ?auto_128781 - BLOCK
      ?auto_128782 - BLOCK
      ?auto_128783 - BLOCK
      ?auto_128784 - BLOCK
      ?auto_128785 - BLOCK
    )
    :vars
    (
      ?auto_128786 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_128785 ?auto_128786 ) ( ON-TABLE ?auto_128780 ) ( not ( = ?auto_128780 ?auto_128781 ) ) ( not ( = ?auto_128780 ?auto_128782 ) ) ( not ( = ?auto_128780 ?auto_128783 ) ) ( not ( = ?auto_128780 ?auto_128784 ) ) ( not ( = ?auto_128780 ?auto_128785 ) ) ( not ( = ?auto_128780 ?auto_128786 ) ) ( not ( = ?auto_128781 ?auto_128782 ) ) ( not ( = ?auto_128781 ?auto_128783 ) ) ( not ( = ?auto_128781 ?auto_128784 ) ) ( not ( = ?auto_128781 ?auto_128785 ) ) ( not ( = ?auto_128781 ?auto_128786 ) ) ( not ( = ?auto_128782 ?auto_128783 ) ) ( not ( = ?auto_128782 ?auto_128784 ) ) ( not ( = ?auto_128782 ?auto_128785 ) ) ( not ( = ?auto_128782 ?auto_128786 ) ) ( not ( = ?auto_128783 ?auto_128784 ) ) ( not ( = ?auto_128783 ?auto_128785 ) ) ( not ( = ?auto_128783 ?auto_128786 ) ) ( not ( = ?auto_128784 ?auto_128785 ) ) ( not ( = ?auto_128784 ?auto_128786 ) ) ( not ( = ?auto_128785 ?auto_128786 ) ) ( ON ?auto_128784 ?auto_128785 ) ( ON ?auto_128783 ?auto_128784 ) ( ON ?auto_128782 ?auto_128783 ) ( CLEAR ?auto_128780 ) ( ON ?auto_128781 ?auto_128782 ) ( CLEAR ?auto_128781 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_128780 ?auto_128781 )
      ( MAKE-6PILE ?auto_128780 ?auto_128781 ?auto_128782 ?auto_128783 ?auto_128784 ?auto_128785 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_128806 - BLOCK
      ?auto_128807 - BLOCK
      ?auto_128808 - BLOCK
      ?auto_128809 - BLOCK
      ?auto_128810 - BLOCK
      ?auto_128811 - BLOCK
    )
    :vars
    (
      ?auto_128812 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_128811 ?auto_128812 ) ( not ( = ?auto_128806 ?auto_128807 ) ) ( not ( = ?auto_128806 ?auto_128808 ) ) ( not ( = ?auto_128806 ?auto_128809 ) ) ( not ( = ?auto_128806 ?auto_128810 ) ) ( not ( = ?auto_128806 ?auto_128811 ) ) ( not ( = ?auto_128806 ?auto_128812 ) ) ( not ( = ?auto_128807 ?auto_128808 ) ) ( not ( = ?auto_128807 ?auto_128809 ) ) ( not ( = ?auto_128807 ?auto_128810 ) ) ( not ( = ?auto_128807 ?auto_128811 ) ) ( not ( = ?auto_128807 ?auto_128812 ) ) ( not ( = ?auto_128808 ?auto_128809 ) ) ( not ( = ?auto_128808 ?auto_128810 ) ) ( not ( = ?auto_128808 ?auto_128811 ) ) ( not ( = ?auto_128808 ?auto_128812 ) ) ( not ( = ?auto_128809 ?auto_128810 ) ) ( not ( = ?auto_128809 ?auto_128811 ) ) ( not ( = ?auto_128809 ?auto_128812 ) ) ( not ( = ?auto_128810 ?auto_128811 ) ) ( not ( = ?auto_128810 ?auto_128812 ) ) ( not ( = ?auto_128811 ?auto_128812 ) ) ( ON ?auto_128810 ?auto_128811 ) ( ON ?auto_128809 ?auto_128810 ) ( ON ?auto_128808 ?auto_128809 ) ( ON ?auto_128807 ?auto_128808 ) ( ON ?auto_128806 ?auto_128807 ) ( CLEAR ?auto_128806 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_128806 )
      ( MAKE-6PILE ?auto_128806 ?auto_128807 ?auto_128808 ?auto_128809 ?auto_128810 ?auto_128811 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_128833 - BLOCK
      ?auto_128834 - BLOCK
      ?auto_128835 - BLOCK
      ?auto_128836 - BLOCK
      ?auto_128837 - BLOCK
      ?auto_128838 - BLOCK
      ?auto_128839 - BLOCK
    )
    :vars
    (
      ?auto_128840 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_128838 ) ( ON ?auto_128839 ?auto_128840 ) ( CLEAR ?auto_128839 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_128833 ) ( ON ?auto_128834 ?auto_128833 ) ( ON ?auto_128835 ?auto_128834 ) ( ON ?auto_128836 ?auto_128835 ) ( ON ?auto_128837 ?auto_128836 ) ( ON ?auto_128838 ?auto_128837 ) ( not ( = ?auto_128833 ?auto_128834 ) ) ( not ( = ?auto_128833 ?auto_128835 ) ) ( not ( = ?auto_128833 ?auto_128836 ) ) ( not ( = ?auto_128833 ?auto_128837 ) ) ( not ( = ?auto_128833 ?auto_128838 ) ) ( not ( = ?auto_128833 ?auto_128839 ) ) ( not ( = ?auto_128833 ?auto_128840 ) ) ( not ( = ?auto_128834 ?auto_128835 ) ) ( not ( = ?auto_128834 ?auto_128836 ) ) ( not ( = ?auto_128834 ?auto_128837 ) ) ( not ( = ?auto_128834 ?auto_128838 ) ) ( not ( = ?auto_128834 ?auto_128839 ) ) ( not ( = ?auto_128834 ?auto_128840 ) ) ( not ( = ?auto_128835 ?auto_128836 ) ) ( not ( = ?auto_128835 ?auto_128837 ) ) ( not ( = ?auto_128835 ?auto_128838 ) ) ( not ( = ?auto_128835 ?auto_128839 ) ) ( not ( = ?auto_128835 ?auto_128840 ) ) ( not ( = ?auto_128836 ?auto_128837 ) ) ( not ( = ?auto_128836 ?auto_128838 ) ) ( not ( = ?auto_128836 ?auto_128839 ) ) ( not ( = ?auto_128836 ?auto_128840 ) ) ( not ( = ?auto_128837 ?auto_128838 ) ) ( not ( = ?auto_128837 ?auto_128839 ) ) ( not ( = ?auto_128837 ?auto_128840 ) ) ( not ( = ?auto_128838 ?auto_128839 ) ) ( not ( = ?auto_128838 ?auto_128840 ) ) ( not ( = ?auto_128839 ?auto_128840 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_128839 ?auto_128840 )
      ( !STACK ?auto_128839 ?auto_128838 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_128863 - BLOCK
      ?auto_128864 - BLOCK
      ?auto_128865 - BLOCK
      ?auto_128866 - BLOCK
      ?auto_128867 - BLOCK
      ?auto_128868 - BLOCK
      ?auto_128869 - BLOCK
    )
    :vars
    (
      ?auto_128870 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_128869 ?auto_128870 ) ( ON-TABLE ?auto_128863 ) ( ON ?auto_128864 ?auto_128863 ) ( ON ?auto_128865 ?auto_128864 ) ( ON ?auto_128866 ?auto_128865 ) ( ON ?auto_128867 ?auto_128866 ) ( not ( = ?auto_128863 ?auto_128864 ) ) ( not ( = ?auto_128863 ?auto_128865 ) ) ( not ( = ?auto_128863 ?auto_128866 ) ) ( not ( = ?auto_128863 ?auto_128867 ) ) ( not ( = ?auto_128863 ?auto_128868 ) ) ( not ( = ?auto_128863 ?auto_128869 ) ) ( not ( = ?auto_128863 ?auto_128870 ) ) ( not ( = ?auto_128864 ?auto_128865 ) ) ( not ( = ?auto_128864 ?auto_128866 ) ) ( not ( = ?auto_128864 ?auto_128867 ) ) ( not ( = ?auto_128864 ?auto_128868 ) ) ( not ( = ?auto_128864 ?auto_128869 ) ) ( not ( = ?auto_128864 ?auto_128870 ) ) ( not ( = ?auto_128865 ?auto_128866 ) ) ( not ( = ?auto_128865 ?auto_128867 ) ) ( not ( = ?auto_128865 ?auto_128868 ) ) ( not ( = ?auto_128865 ?auto_128869 ) ) ( not ( = ?auto_128865 ?auto_128870 ) ) ( not ( = ?auto_128866 ?auto_128867 ) ) ( not ( = ?auto_128866 ?auto_128868 ) ) ( not ( = ?auto_128866 ?auto_128869 ) ) ( not ( = ?auto_128866 ?auto_128870 ) ) ( not ( = ?auto_128867 ?auto_128868 ) ) ( not ( = ?auto_128867 ?auto_128869 ) ) ( not ( = ?auto_128867 ?auto_128870 ) ) ( not ( = ?auto_128868 ?auto_128869 ) ) ( not ( = ?auto_128868 ?auto_128870 ) ) ( not ( = ?auto_128869 ?auto_128870 ) ) ( CLEAR ?auto_128867 ) ( ON ?auto_128868 ?auto_128869 ) ( CLEAR ?auto_128868 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_128863 ?auto_128864 ?auto_128865 ?auto_128866 ?auto_128867 ?auto_128868 )
      ( MAKE-7PILE ?auto_128863 ?auto_128864 ?auto_128865 ?auto_128866 ?auto_128867 ?auto_128868 ?auto_128869 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_128893 - BLOCK
      ?auto_128894 - BLOCK
      ?auto_128895 - BLOCK
      ?auto_128896 - BLOCK
      ?auto_128897 - BLOCK
      ?auto_128898 - BLOCK
      ?auto_128899 - BLOCK
    )
    :vars
    (
      ?auto_128900 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_128899 ?auto_128900 ) ( ON-TABLE ?auto_128893 ) ( ON ?auto_128894 ?auto_128893 ) ( ON ?auto_128895 ?auto_128894 ) ( ON ?auto_128896 ?auto_128895 ) ( not ( = ?auto_128893 ?auto_128894 ) ) ( not ( = ?auto_128893 ?auto_128895 ) ) ( not ( = ?auto_128893 ?auto_128896 ) ) ( not ( = ?auto_128893 ?auto_128897 ) ) ( not ( = ?auto_128893 ?auto_128898 ) ) ( not ( = ?auto_128893 ?auto_128899 ) ) ( not ( = ?auto_128893 ?auto_128900 ) ) ( not ( = ?auto_128894 ?auto_128895 ) ) ( not ( = ?auto_128894 ?auto_128896 ) ) ( not ( = ?auto_128894 ?auto_128897 ) ) ( not ( = ?auto_128894 ?auto_128898 ) ) ( not ( = ?auto_128894 ?auto_128899 ) ) ( not ( = ?auto_128894 ?auto_128900 ) ) ( not ( = ?auto_128895 ?auto_128896 ) ) ( not ( = ?auto_128895 ?auto_128897 ) ) ( not ( = ?auto_128895 ?auto_128898 ) ) ( not ( = ?auto_128895 ?auto_128899 ) ) ( not ( = ?auto_128895 ?auto_128900 ) ) ( not ( = ?auto_128896 ?auto_128897 ) ) ( not ( = ?auto_128896 ?auto_128898 ) ) ( not ( = ?auto_128896 ?auto_128899 ) ) ( not ( = ?auto_128896 ?auto_128900 ) ) ( not ( = ?auto_128897 ?auto_128898 ) ) ( not ( = ?auto_128897 ?auto_128899 ) ) ( not ( = ?auto_128897 ?auto_128900 ) ) ( not ( = ?auto_128898 ?auto_128899 ) ) ( not ( = ?auto_128898 ?auto_128900 ) ) ( not ( = ?auto_128899 ?auto_128900 ) ) ( ON ?auto_128898 ?auto_128899 ) ( CLEAR ?auto_128896 ) ( ON ?auto_128897 ?auto_128898 ) ( CLEAR ?auto_128897 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_128893 ?auto_128894 ?auto_128895 ?auto_128896 ?auto_128897 )
      ( MAKE-7PILE ?auto_128893 ?auto_128894 ?auto_128895 ?auto_128896 ?auto_128897 ?auto_128898 ?auto_128899 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_128923 - BLOCK
      ?auto_128924 - BLOCK
      ?auto_128925 - BLOCK
      ?auto_128926 - BLOCK
      ?auto_128927 - BLOCK
      ?auto_128928 - BLOCK
      ?auto_128929 - BLOCK
    )
    :vars
    (
      ?auto_128930 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_128929 ?auto_128930 ) ( ON-TABLE ?auto_128923 ) ( ON ?auto_128924 ?auto_128923 ) ( ON ?auto_128925 ?auto_128924 ) ( not ( = ?auto_128923 ?auto_128924 ) ) ( not ( = ?auto_128923 ?auto_128925 ) ) ( not ( = ?auto_128923 ?auto_128926 ) ) ( not ( = ?auto_128923 ?auto_128927 ) ) ( not ( = ?auto_128923 ?auto_128928 ) ) ( not ( = ?auto_128923 ?auto_128929 ) ) ( not ( = ?auto_128923 ?auto_128930 ) ) ( not ( = ?auto_128924 ?auto_128925 ) ) ( not ( = ?auto_128924 ?auto_128926 ) ) ( not ( = ?auto_128924 ?auto_128927 ) ) ( not ( = ?auto_128924 ?auto_128928 ) ) ( not ( = ?auto_128924 ?auto_128929 ) ) ( not ( = ?auto_128924 ?auto_128930 ) ) ( not ( = ?auto_128925 ?auto_128926 ) ) ( not ( = ?auto_128925 ?auto_128927 ) ) ( not ( = ?auto_128925 ?auto_128928 ) ) ( not ( = ?auto_128925 ?auto_128929 ) ) ( not ( = ?auto_128925 ?auto_128930 ) ) ( not ( = ?auto_128926 ?auto_128927 ) ) ( not ( = ?auto_128926 ?auto_128928 ) ) ( not ( = ?auto_128926 ?auto_128929 ) ) ( not ( = ?auto_128926 ?auto_128930 ) ) ( not ( = ?auto_128927 ?auto_128928 ) ) ( not ( = ?auto_128927 ?auto_128929 ) ) ( not ( = ?auto_128927 ?auto_128930 ) ) ( not ( = ?auto_128928 ?auto_128929 ) ) ( not ( = ?auto_128928 ?auto_128930 ) ) ( not ( = ?auto_128929 ?auto_128930 ) ) ( ON ?auto_128928 ?auto_128929 ) ( ON ?auto_128927 ?auto_128928 ) ( CLEAR ?auto_128925 ) ( ON ?auto_128926 ?auto_128927 ) ( CLEAR ?auto_128926 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_128923 ?auto_128924 ?auto_128925 ?auto_128926 )
      ( MAKE-7PILE ?auto_128923 ?auto_128924 ?auto_128925 ?auto_128926 ?auto_128927 ?auto_128928 ?auto_128929 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_128953 - BLOCK
      ?auto_128954 - BLOCK
      ?auto_128955 - BLOCK
      ?auto_128956 - BLOCK
      ?auto_128957 - BLOCK
      ?auto_128958 - BLOCK
      ?auto_128959 - BLOCK
    )
    :vars
    (
      ?auto_128960 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_128959 ?auto_128960 ) ( ON-TABLE ?auto_128953 ) ( ON ?auto_128954 ?auto_128953 ) ( not ( = ?auto_128953 ?auto_128954 ) ) ( not ( = ?auto_128953 ?auto_128955 ) ) ( not ( = ?auto_128953 ?auto_128956 ) ) ( not ( = ?auto_128953 ?auto_128957 ) ) ( not ( = ?auto_128953 ?auto_128958 ) ) ( not ( = ?auto_128953 ?auto_128959 ) ) ( not ( = ?auto_128953 ?auto_128960 ) ) ( not ( = ?auto_128954 ?auto_128955 ) ) ( not ( = ?auto_128954 ?auto_128956 ) ) ( not ( = ?auto_128954 ?auto_128957 ) ) ( not ( = ?auto_128954 ?auto_128958 ) ) ( not ( = ?auto_128954 ?auto_128959 ) ) ( not ( = ?auto_128954 ?auto_128960 ) ) ( not ( = ?auto_128955 ?auto_128956 ) ) ( not ( = ?auto_128955 ?auto_128957 ) ) ( not ( = ?auto_128955 ?auto_128958 ) ) ( not ( = ?auto_128955 ?auto_128959 ) ) ( not ( = ?auto_128955 ?auto_128960 ) ) ( not ( = ?auto_128956 ?auto_128957 ) ) ( not ( = ?auto_128956 ?auto_128958 ) ) ( not ( = ?auto_128956 ?auto_128959 ) ) ( not ( = ?auto_128956 ?auto_128960 ) ) ( not ( = ?auto_128957 ?auto_128958 ) ) ( not ( = ?auto_128957 ?auto_128959 ) ) ( not ( = ?auto_128957 ?auto_128960 ) ) ( not ( = ?auto_128958 ?auto_128959 ) ) ( not ( = ?auto_128958 ?auto_128960 ) ) ( not ( = ?auto_128959 ?auto_128960 ) ) ( ON ?auto_128958 ?auto_128959 ) ( ON ?auto_128957 ?auto_128958 ) ( ON ?auto_128956 ?auto_128957 ) ( CLEAR ?auto_128954 ) ( ON ?auto_128955 ?auto_128956 ) ( CLEAR ?auto_128955 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_128953 ?auto_128954 ?auto_128955 )
      ( MAKE-7PILE ?auto_128953 ?auto_128954 ?auto_128955 ?auto_128956 ?auto_128957 ?auto_128958 ?auto_128959 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_128983 - BLOCK
      ?auto_128984 - BLOCK
      ?auto_128985 - BLOCK
      ?auto_128986 - BLOCK
      ?auto_128987 - BLOCK
      ?auto_128988 - BLOCK
      ?auto_128989 - BLOCK
    )
    :vars
    (
      ?auto_128990 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_128989 ?auto_128990 ) ( ON-TABLE ?auto_128983 ) ( not ( = ?auto_128983 ?auto_128984 ) ) ( not ( = ?auto_128983 ?auto_128985 ) ) ( not ( = ?auto_128983 ?auto_128986 ) ) ( not ( = ?auto_128983 ?auto_128987 ) ) ( not ( = ?auto_128983 ?auto_128988 ) ) ( not ( = ?auto_128983 ?auto_128989 ) ) ( not ( = ?auto_128983 ?auto_128990 ) ) ( not ( = ?auto_128984 ?auto_128985 ) ) ( not ( = ?auto_128984 ?auto_128986 ) ) ( not ( = ?auto_128984 ?auto_128987 ) ) ( not ( = ?auto_128984 ?auto_128988 ) ) ( not ( = ?auto_128984 ?auto_128989 ) ) ( not ( = ?auto_128984 ?auto_128990 ) ) ( not ( = ?auto_128985 ?auto_128986 ) ) ( not ( = ?auto_128985 ?auto_128987 ) ) ( not ( = ?auto_128985 ?auto_128988 ) ) ( not ( = ?auto_128985 ?auto_128989 ) ) ( not ( = ?auto_128985 ?auto_128990 ) ) ( not ( = ?auto_128986 ?auto_128987 ) ) ( not ( = ?auto_128986 ?auto_128988 ) ) ( not ( = ?auto_128986 ?auto_128989 ) ) ( not ( = ?auto_128986 ?auto_128990 ) ) ( not ( = ?auto_128987 ?auto_128988 ) ) ( not ( = ?auto_128987 ?auto_128989 ) ) ( not ( = ?auto_128987 ?auto_128990 ) ) ( not ( = ?auto_128988 ?auto_128989 ) ) ( not ( = ?auto_128988 ?auto_128990 ) ) ( not ( = ?auto_128989 ?auto_128990 ) ) ( ON ?auto_128988 ?auto_128989 ) ( ON ?auto_128987 ?auto_128988 ) ( ON ?auto_128986 ?auto_128987 ) ( ON ?auto_128985 ?auto_128986 ) ( CLEAR ?auto_128983 ) ( ON ?auto_128984 ?auto_128985 ) ( CLEAR ?auto_128984 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_128983 ?auto_128984 )
      ( MAKE-7PILE ?auto_128983 ?auto_128984 ?auto_128985 ?auto_128986 ?auto_128987 ?auto_128988 ?auto_128989 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_129013 - BLOCK
      ?auto_129014 - BLOCK
      ?auto_129015 - BLOCK
      ?auto_129016 - BLOCK
      ?auto_129017 - BLOCK
      ?auto_129018 - BLOCK
      ?auto_129019 - BLOCK
    )
    :vars
    (
      ?auto_129020 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_129019 ?auto_129020 ) ( not ( = ?auto_129013 ?auto_129014 ) ) ( not ( = ?auto_129013 ?auto_129015 ) ) ( not ( = ?auto_129013 ?auto_129016 ) ) ( not ( = ?auto_129013 ?auto_129017 ) ) ( not ( = ?auto_129013 ?auto_129018 ) ) ( not ( = ?auto_129013 ?auto_129019 ) ) ( not ( = ?auto_129013 ?auto_129020 ) ) ( not ( = ?auto_129014 ?auto_129015 ) ) ( not ( = ?auto_129014 ?auto_129016 ) ) ( not ( = ?auto_129014 ?auto_129017 ) ) ( not ( = ?auto_129014 ?auto_129018 ) ) ( not ( = ?auto_129014 ?auto_129019 ) ) ( not ( = ?auto_129014 ?auto_129020 ) ) ( not ( = ?auto_129015 ?auto_129016 ) ) ( not ( = ?auto_129015 ?auto_129017 ) ) ( not ( = ?auto_129015 ?auto_129018 ) ) ( not ( = ?auto_129015 ?auto_129019 ) ) ( not ( = ?auto_129015 ?auto_129020 ) ) ( not ( = ?auto_129016 ?auto_129017 ) ) ( not ( = ?auto_129016 ?auto_129018 ) ) ( not ( = ?auto_129016 ?auto_129019 ) ) ( not ( = ?auto_129016 ?auto_129020 ) ) ( not ( = ?auto_129017 ?auto_129018 ) ) ( not ( = ?auto_129017 ?auto_129019 ) ) ( not ( = ?auto_129017 ?auto_129020 ) ) ( not ( = ?auto_129018 ?auto_129019 ) ) ( not ( = ?auto_129018 ?auto_129020 ) ) ( not ( = ?auto_129019 ?auto_129020 ) ) ( ON ?auto_129018 ?auto_129019 ) ( ON ?auto_129017 ?auto_129018 ) ( ON ?auto_129016 ?auto_129017 ) ( ON ?auto_129015 ?auto_129016 ) ( ON ?auto_129014 ?auto_129015 ) ( ON ?auto_129013 ?auto_129014 ) ( CLEAR ?auto_129013 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_129013 )
      ( MAKE-7PILE ?auto_129013 ?auto_129014 ?auto_129015 ?auto_129016 ?auto_129017 ?auto_129018 ?auto_129019 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_129044 - BLOCK
      ?auto_129045 - BLOCK
      ?auto_129046 - BLOCK
      ?auto_129047 - BLOCK
      ?auto_129048 - BLOCK
      ?auto_129049 - BLOCK
      ?auto_129050 - BLOCK
      ?auto_129051 - BLOCK
    )
    :vars
    (
      ?auto_129052 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_129050 ) ( ON ?auto_129051 ?auto_129052 ) ( CLEAR ?auto_129051 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_129044 ) ( ON ?auto_129045 ?auto_129044 ) ( ON ?auto_129046 ?auto_129045 ) ( ON ?auto_129047 ?auto_129046 ) ( ON ?auto_129048 ?auto_129047 ) ( ON ?auto_129049 ?auto_129048 ) ( ON ?auto_129050 ?auto_129049 ) ( not ( = ?auto_129044 ?auto_129045 ) ) ( not ( = ?auto_129044 ?auto_129046 ) ) ( not ( = ?auto_129044 ?auto_129047 ) ) ( not ( = ?auto_129044 ?auto_129048 ) ) ( not ( = ?auto_129044 ?auto_129049 ) ) ( not ( = ?auto_129044 ?auto_129050 ) ) ( not ( = ?auto_129044 ?auto_129051 ) ) ( not ( = ?auto_129044 ?auto_129052 ) ) ( not ( = ?auto_129045 ?auto_129046 ) ) ( not ( = ?auto_129045 ?auto_129047 ) ) ( not ( = ?auto_129045 ?auto_129048 ) ) ( not ( = ?auto_129045 ?auto_129049 ) ) ( not ( = ?auto_129045 ?auto_129050 ) ) ( not ( = ?auto_129045 ?auto_129051 ) ) ( not ( = ?auto_129045 ?auto_129052 ) ) ( not ( = ?auto_129046 ?auto_129047 ) ) ( not ( = ?auto_129046 ?auto_129048 ) ) ( not ( = ?auto_129046 ?auto_129049 ) ) ( not ( = ?auto_129046 ?auto_129050 ) ) ( not ( = ?auto_129046 ?auto_129051 ) ) ( not ( = ?auto_129046 ?auto_129052 ) ) ( not ( = ?auto_129047 ?auto_129048 ) ) ( not ( = ?auto_129047 ?auto_129049 ) ) ( not ( = ?auto_129047 ?auto_129050 ) ) ( not ( = ?auto_129047 ?auto_129051 ) ) ( not ( = ?auto_129047 ?auto_129052 ) ) ( not ( = ?auto_129048 ?auto_129049 ) ) ( not ( = ?auto_129048 ?auto_129050 ) ) ( not ( = ?auto_129048 ?auto_129051 ) ) ( not ( = ?auto_129048 ?auto_129052 ) ) ( not ( = ?auto_129049 ?auto_129050 ) ) ( not ( = ?auto_129049 ?auto_129051 ) ) ( not ( = ?auto_129049 ?auto_129052 ) ) ( not ( = ?auto_129050 ?auto_129051 ) ) ( not ( = ?auto_129050 ?auto_129052 ) ) ( not ( = ?auto_129051 ?auto_129052 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_129051 ?auto_129052 )
      ( !STACK ?auto_129051 ?auto_129050 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_129078 - BLOCK
      ?auto_129079 - BLOCK
      ?auto_129080 - BLOCK
      ?auto_129081 - BLOCK
      ?auto_129082 - BLOCK
      ?auto_129083 - BLOCK
      ?auto_129084 - BLOCK
      ?auto_129085 - BLOCK
    )
    :vars
    (
      ?auto_129086 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_129085 ?auto_129086 ) ( ON-TABLE ?auto_129078 ) ( ON ?auto_129079 ?auto_129078 ) ( ON ?auto_129080 ?auto_129079 ) ( ON ?auto_129081 ?auto_129080 ) ( ON ?auto_129082 ?auto_129081 ) ( ON ?auto_129083 ?auto_129082 ) ( not ( = ?auto_129078 ?auto_129079 ) ) ( not ( = ?auto_129078 ?auto_129080 ) ) ( not ( = ?auto_129078 ?auto_129081 ) ) ( not ( = ?auto_129078 ?auto_129082 ) ) ( not ( = ?auto_129078 ?auto_129083 ) ) ( not ( = ?auto_129078 ?auto_129084 ) ) ( not ( = ?auto_129078 ?auto_129085 ) ) ( not ( = ?auto_129078 ?auto_129086 ) ) ( not ( = ?auto_129079 ?auto_129080 ) ) ( not ( = ?auto_129079 ?auto_129081 ) ) ( not ( = ?auto_129079 ?auto_129082 ) ) ( not ( = ?auto_129079 ?auto_129083 ) ) ( not ( = ?auto_129079 ?auto_129084 ) ) ( not ( = ?auto_129079 ?auto_129085 ) ) ( not ( = ?auto_129079 ?auto_129086 ) ) ( not ( = ?auto_129080 ?auto_129081 ) ) ( not ( = ?auto_129080 ?auto_129082 ) ) ( not ( = ?auto_129080 ?auto_129083 ) ) ( not ( = ?auto_129080 ?auto_129084 ) ) ( not ( = ?auto_129080 ?auto_129085 ) ) ( not ( = ?auto_129080 ?auto_129086 ) ) ( not ( = ?auto_129081 ?auto_129082 ) ) ( not ( = ?auto_129081 ?auto_129083 ) ) ( not ( = ?auto_129081 ?auto_129084 ) ) ( not ( = ?auto_129081 ?auto_129085 ) ) ( not ( = ?auto_129081 ?auto_129086 ) ) ( not ( = ?auto_129082 ?auto_129083 ) ) ( not ( = ?auto_129082 ?auto_129084 ) ) ( not ( = ?auto_129082 ?auto_129085 ) ) ( not ( = ?auto_129082 ?auto_129086 ) ) ( not ( = ?auto_129083 ?auto_129084 ) ) ( not ( = ?auto_129083 ?auto_129085 ) ) ( not ( = ?auto_129083 ?auto_129086 ) ) ( not ( = ?auto_129084 ?auto_129085 ) ) ( not ( = ?auto_129084 ?auto_129086 ) ) ( not ( = ?auto_129085 ?auto_129086 ) ) ( CLEAR ?auto_129083 ) ( ON ?auto_129084 ?auto_129085 ) ( CLEAR ?auto_129084 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_129078 ?auto_129079 ?auto_129080 ?auto_129081 ?auto_129082 ?auto_129083 ?auto_129084 )
      ( MAKE-8PILE ?auto_129078 ?auto_129079 ?auto_129080 ?auto_129081 ?auto_129082 ?auto_129083 ?auto_129084 ?auto_129085 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_129112 - BLOCK
      ?auto_129113 - BLOCK
      ?auto_129114 - BLOCK
      ?auto_129115 - BLOCK
      ?auto_129116 - BLOCK
      ?auto_129117 - BLOCK
      ?auto_129118 - BLOCK
      ?auto_129119 - BLOCK
    )
    :vars
    (
      ?auto_129120 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_129119 ?auto_129120 ) ( ON-TABLE ?auto_129112 ) ( ON ?auto_129113 ?auto_129112 ) ( ON ?auto_129114 ?auto_129113 ) ( ON ?auto_129115 ?auto_129114 ) ( ON ?auto_129116 ?auto_129115 ) ( not ( = ?auto_129112 ?auto_129113 ) ) ( not ( = ?auto_129112 ?auto_129114 ) ) ( not ( = ?auto_129112 ?auto_129115 ) ) ( not ( = ?auto_129112 ?auto_129116 ) ) ( not ( = ?auto_129112 ?auto_129117 ) ) ( not ( = ?auto_129112 ?auto_129118 ) ) ( not ( = ?auto_129112 ?auto_129119 ) ) ( not ( = ?auto_129112 ?auto_129120 ) ) ( not ( = ?auto_129113 ?auto_129114 ) ) ( not ( = ?auto_129113 ?auto_129115 ) ) ( not ( = ?auto_129113 ?auto_129116 ) ) ( not ( = ?auto_129113 ?auto_129117 ) ) ( not ( = ?auto_129113 ?auto_129118 ) ) ( not ( = ?auto_129113 ?auto_129119 ) ) ( not ( = ?auto_129113 ?auto_129120 ) ) ( not ( = ?auto_129114 ?auto_129115 ) ) ( not ( = ?auto_129114 ?auto_129116 ) ) ( not ( = ?auto_129114 ?auto_129117 ) ) ( not ( = ?auto_129114 ?auto_129118 ) ) ( not ( = ?auto_129114 ?auto_129119 ) ) ( not ( = ?auto_129114 ?auto_129120 ) ) ( not ( = ?auto_129115 ?auto_129116 ) ) ( not ( = ?auto_129115 ?auto_129117 ) ) ( not ( = ?auto_129115 ?auto_129118 ) ) ( not ( = ?auto_129115 ?auto_129119 ) ) ( not ( = ?auto_129115 ?auto_129120 ) ) ( not ( = ?auto_129116 ?auto_129117 ) ) ( not ( = ?auto_129116 ?auto_129118 ) ) ( not ( = ?auto_129116 ?auto_129119 ) ) ( not ( = ?auto_129116 ?auto_129120 ) ) ( not ( = ?auto_129117 ?auto_129118 ) ) ( not ( = ?auto_129117 ?auto_129119 ) ) ( not ( = ?auto_129117 ?auto_129120 ) ) ( not ( = ?auto_129118 ?auto_129119 ) ) ( not ( = ?auto_129118 ?auto_129120 ) ) ( not ( = ?auto_129119 ?auto_129120 ) ) ( ON ?auto_129118 ?auto_129119 ) ( CLEAR ?auto_129116 ) ( ON ?auto_129117 ?auto_129118 ) ( CLEAR ?auto_129117 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_129112 ?auto_129113 ?auto_129114 ?auto_129115 ?auto_129116 ?auto_129117 )
      ( MAKE-8PILE ?auto_129112 ?auto_129113 ?auto_129114 ?auto_129115 ?auto_129116 ?auto_129117 ?auto_129118 ?auto_129119 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_129146 - BLOCK
      ?auto_129147 - BLOCK
      ?auto_129148 - BLOCK
      ?auto_129149 - BLOCK
      ?auto_129150 - BLOCK
      ?auto_129151 - BLOCK
      ?auto_129152 - BLOCK
      ?auto_129153 - BLOCK
    )
    :vars
    (
      ?auto_129154 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_129153 ?auto_129154 ) ( ON-TABLE ?auto_129146 ) ( ON ?auto_129147 ?auto_129146 ) ( ON ?auto_129148 ?auto_129147 ) ( ON ?auto_129149 ?auto_129148 ) ( not ( = ?auto_129146 ?auto_129147 ) ) ( not ( = ?auto_129146 ?auto_129148 ) ) ( not ( = ?auto_129146 ?auto_129149 ) ) ( not ( = ?auto_129146 ?auto_129150 ) ) ( not ( = ?auto_129146 ?auto_129151 ) ) ( not ( = ?auto_129146 ?auto_129152 ) ) ( not ( = ?auto_129146 ?auto_129153 ) ) ( not ( = ?auto_129146 ?auto_129154 ) ) ( not ( = ?auto_129147 ?auto_129148 ) ) ( not ( = ?auto_129147 ?auto_129149 ) ) ( not ( = ?auto_129147 ?auto_129150 ) ) ( not ( = ?auto_129147 ?auto_129151 ) ) ( not ( = ?auto_129147 ?auto_129152 ) ) ( not ( = ?auto_129147 ?auto_129153 ) ) ( not ( = ?auto_129147 ?auto_129154 ) ) ( not ( = ?auto_129148 ?auto_129149 ) ) ( not ( = ?auto_129148 ?auto_129150 ) ) ( not ( = ?auto_129148 ?auto_129151 ) ) ( not ( = ?auto_129148 ?auto_129152 ) ) ( not ( = ?auto_129148 ?auto_129153 ) ) ( not ( = ?auto_129148 ?auto_129154 ) ) ( not ( = ?auto_129149 ?auto_129150 ) ) ( not ( = ?auto_129149 ?auto_129151 ) ) ( not ( = ?auto_129149 ?auto_129152 ) ) ( not ( = ?auto_129149 ?auto_129153 ) ) ( not ( = ?auto_129149 ?auto_129154 ) ) ( not ( = ?auto_129150 ?auto_129151 ) ) ( not ( = ?auto_129150 ?auto_129152 ) ) ( not ( = ?auto_129150 ?auto_129153 ) ) ( not ( = ?auto_129150 ?auto_129154 ) ) ( not ( = ?auto_129151 ?auto_129152 ) ) ( not ( = ?auto_129151 ?auto_129153 ) ) ( not ( = ?auto_129151 ?auto_129154 ) ) ( not ( = ?auto_129152 ?auto_129153 ) ) ( not ( = ?auto_129152 ?auto_129154 ) ) ( not ( = ?auto_129153 ?auto_129154 ) ) ( ON ?auto_129152 ?auto_129153 ) ( ON ?auto_129151 ?auto_129152 ) ( CLEAR ?auto_129149 ) ( ON ?auto_129150 ?auto_129151 ) ( CLEAR ?auto_129150 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_129146 ?auto_129147 ?auto_129148 ?auto_129149 ?auto_129150 )
      ( MAKE-8PILE ?auto_129146 ?auto_129147 ?auto_129148 ?auto_129149 ?auto_129150 ?auto_129151 ?auto_129152 ?auto_129153 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_129180 - BLOCK
      ?auto_129181 - BLOCK
      ?auto_129182 - BLOCK
      ?auto_129183 - BLOCK
      ?auto_129184 - BLOCK
      ?auto_129185 - BLOCK
      ?auto_129186 - BLOCK
      ?auto_129187 - BLOCK
    )
    :vars
    (
      ?auto_129188 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_129187 ?auto_129188 ) ( ON-TABLE ?auto_129180 ) ( ON ?auto_129181 ?auto_129180 ) ( ON ?auto_129182 ?auto_129181 ) ( not ( = ?auto_129180 ?auto_129181 ) ) ( not ( = ?auto_129180 ?auto_129182 ) ) ( not ( = ?auto_129180 ?auto_129183 ) ) ( not ( = ?auto_129180 ?auto_129184 ) ) ( not ( = ?auto_129180 ?auto_129185 ) ) ( not ( = ?auto_129180 ?auto_129186 ) ) ( not ( = ?auto_129180 ?auto_129187 ) ) ( not ( = ?auto_129180 ?auto_129188 ) ) ( not ( = ?auto_129181 ?auto_129182 ) ) ( not ( = ?auto_129181 ?auto_129183 ) ) ( not ( = ?auto_129181 ?auto_129184 ) ) ( not ( = ?auto_129181 ?auto_129185 ) ) ( not ( = ?auto_129181 ?auto_129186 ) ) ( not ( = ?auto_129181 ?auto_129187 ) ) ( not ( = ?auto_129181 ?auto_129188 ) ) ( not ( = ?auto_129182 ?auto_129183 ) ) ( not ( = ?auto_129182 ?auto_129184 ) ) ( not ( = ?auto_129182 ?auto_129185 ) ) ( not ( = ?auto_129182 ?auto_129186 ) ) ( not ( = ?auto_129182 ?auto_129187 ) ) ( not ( = ?auto_129182 ?auto_129188 ) ) ( not ( = ?auto_129183 ?auto_129184 ) ) ( not ( = ?auto_129183 ?auto_129185 ) ) ( not ( = ?auto_129183 ?auto_129186 ) ) ( not ( = ?auto_129183 ?auto_129187 ) ) ( not ( = ?auto_129183 ?auto_129188 ) ) ( not ( = ?auto_129184 ?auto_129185 ) ) ( not ( = ?auto_129184 ?auto_129186 ) ) ( not ( = ?auto_129184 ?auto_129187 ) ) ( not ( = ?auto_129184 ?auto_129188 ) ) ( not ( = ?auto_129185 ?auto_129186 ) ) ( not ( = ?auto_129185 ?auto_129187 ) ) ( not ( = ?auto_129185 ?auto_129188 ) ) ( not ( = ?auto_129186 ?auto_129187 ) ) ( not ( = ?auto_129186 ?auto_129188 ) ) ( not ( = ?auto_129187 ?auto_129188 ) ) ( ON ?auto_129186 ?auto_129187 ) ( ON ?auto_129185 ?auto_129186 ) ( ON ?auto_129184 ?auto_129185 ) ( CLEAR ?auto_129182 ) ( ON ?auto_129183 ?auto_129184 ) ( CLEAR ?auto_129183 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_129180 ?auto_129181 ?auto_129182 ?auto_129183 )
      ( MAKE-8PILE ?auto_129180 ?auto_129181 ?auto_129182 ?auto_129183 ?auto_129184 ?auto_129185 ?auto_129186 ?auto_129187 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_129214 - BLOCK
      ?auto_129215 - BLOCK
      ?auto_129216 - BLOCK
      ?auto_129217 - BLOCK
      ?auto_129218 - BLOCK
      ?auto_129219 - BLOCK
      ?auto_129220 - BLOCK
      ?auto_129221 - BLOCK
    )
    :vars
    (
      ?auto_129222 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_129221 ?auto_129222 ) ( ON-TABLE ?auto_129214 ) ( ON ?auto_129215 ?auto_129214 ) ( not ( = ?auto_129214 ?auto_129215 ) ) ( not ( = ?auto_129214 ?auto_129216 ) ) ( not ( = ?auto_129214 ?auto_129217 ) ) ( not ( = ?auto_129214 ?auto_129218 ) ) ( not ( = ?auto_129214 ?auto_129219 ) ) ( not ( = ?auto_129214 ?auto_129220 ) ) ( not ( = ?auto_129214 ?auto_129221 ) ) ( not ( = ?auto_129214 ?auto_129222 ) ) ( not ( = ?auto_129215 ?auto_129216 ) ) ( not ( = ?auto_129215 ?auto_129217 ) ) ( not ( = ?auto_129215 ?auto_129218 ) ) ( not ( = ?auto_129215 ?auto_129219 ) ) ( not ( = ?auto_129215 ?auto_129220 ) ) ( not ( = ?auto_129215 ?auto_129221 ) ) ( not ( = ?auto_129215 ?auto_129222 ) ) ( not ( = ?auto_129216 ?auto_129217 ) ) ( not ( = ?auto_129216 ?auto_129218 ) ) ( not ( = ?auto_129216 ?auto_129219 ) ) ( not ( = ?auto_129216 ?auto_129220 ) ) ( not ( = ?auto_129216 ?auto_129221 ) ) ( not ( = ?auto_129216 ?auto_129222 ) ) ( not ( = ?auto_129217 ?auto_129218 ) ) ( not ( = ?auto_129217 ?auto_129219 ) ) ( not ( = ?auto_129217 ?auto_129220 ) ) ( not ( = ?auto_129217 ?auto_129221 ) ) ( not ( = ?auto_129217 ?auto_129222 ) ) ( not ( = ?auto_129218 ?auto_129219 ) ) ( not ( = ?auto_129218 ?auto_129220 ) ) ( not ( = ?auto_129218 ?auto_129221 ) ) ( not ( = ?auto_129218 ?auto_129222 ) ) ( not ( = ?auto_129219 ?auto_129220 ) ) ( not ( = ?auto_129219 ?auto_129221 ) ) ( not ( = ?auto_129219 ?auto_129222 ) ) ( not ( = ?auto_129220 ?auto_129221 ) ) ( not ( = ?auto_129220 ?auto_129222 ) ) ( not ( = ?auto_129221 ?auto_129222 ) ) ( ON ?auto_129220 ?auto_129221 ) ( ON ?auto_129219 ?auto_129220 ) ( ON ?auto_129218 ?auto_129219 ) ( ON ?auto_129217 ?auto_129218 ) ( CLEAR ?auto_129215 ) ( ON ?auto_129216 ?auto_129217 ) ( CLEAR ?auto_129216 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_129214 ?auto_129215 ?auto_129216 )
      ( MAKE-8PILE ?auto_129214 ?auto_129215 ?auto_129216 ?auto_129217 ?auto_129218 ?auto_129219 ?auto_129220 ?auto_129221 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_129248 - BLOCK
      ?auto_129249 - BLOCK
      ?auto_129250 - BLOCK
      ?auto_129251 - BLOCK
      ?auto_129252 - BLOCK
      ?auto_129253 - BLOCK
      ?auto_129254 - BLOCK
      ?auto_129255 - BLOCK
    )
    :vars
    (
      ?auto_129256 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_129255 ?auto_129256 ) ( ON-TABLE ?auto_129248 ) ( not ( = ?auto_129248 ?auto_129249 ) ) ( not ( = ?auto_129248 ?auto_129250 ) ) ( not ( = ?auto_129248 ?auto_129251 ) ) ( not ( = ?auto_129248 ?auto_129252 ) ) ( not ( = ?auto_129248 ?auto_129253 ) ) ( not ( = ?auto_129248 ?auto_129254 ) ) ( not ( = ?auto_129248 ?auto_129255 ) ) ( not ( = ?auto_129248 ?auto_129256 ) ) ( not ( = ?auto_129249 ?auto_129250 ) ) ( not ( = ?auto_129249 ?auto_129251 ) ) ( not ( = ?auto_129249 ?auto_129252 ) ) ( not ( = ?auto_129249 ?auto_129253 ) ) ( not ( = ?auto_129249 ?auto_129254 ) ) ( not ( = ?auto_129249 ?auto_129255 ) ) ( not ( = ?auto_129249 ?auto_129256 ) ) ( not ( = ?auto_129250 ?auto_129251 ) ) ( not ( = ?auto_129250 ?auto_129252 ) ) ( not ( = ?auto_129250 ?auto_129253 ) ) ( not ( = ?auto_129250 ?auto_129254 ) ) ( not ( = ?auto_129250 ?auto_129255 ) ) ( not ( = ?auto_129250 ?auto_129256 ) ) ( not ( = ?auto_129251 ?auto_129252 ) ) ( not ( = ?auto_129251 ?auto_129253 ) ) ( not ( = ?auto_129251 ?auto_129254 ) ) ( not ( = ?auto_129251 ?auto_129255 ) ) ( not ( = ?auto_129251 ?auto_129256 ) ) ( not ( = ?auto_129252 ?auto_129253 ) ) ( not ( = ?auto_129252 ?auto_129254 ) ) ( not ( = ?auto_129252 ?auto_129255 ) ) ( not ( = ?auto_129252 ?auto_129256 ) ) ( not ( = ?auto_129253 ?auto_129254 ) ) ( not ( = ?auto_129253 ?auto_129255 ) ) ( not ( = ?auto_129253 ?auto_129256 ) ) ( not ( = ?auto_129254 ?auto_129255 ) ) ( not ( = ?auto_129254 ?auto_129256 ) ) ( not ( = ?auto_129255 ?auto_129256 ) ) ( ON ?auto_129254 ?auto_129255 ) ( ON ?auto_129253 ?auto_129254 ) ( ON ?auto_129252 ?auto_129253 ) ( ON ?auto_129251 ?auto_129252 ) ( ON ?auto_129250 ?auto_129251 ) ( CLEAR ?auto_129248 ) ( ON ?auto_129249 ?auto_129250 ) ( CLEAR ?auto_129249 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_129248 ?auto_129249 )
      ( MAKE-8PILE ?auto_129248 ?auto_129249 ?auto_129250 ?auto_129251 ?auto_129252 ?auto_129253 ?auto_129254 ?auto_129255 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_129282 - BLOCK
      ?auto_129283 - BLOCK
      ?auto_129284 - BLOCK
      ?auto_129285 - BLOCK
      ?auto_129286 - BLOCK
      ?auto_129287 - BLOCK
      ?auto_129288 - BLOCK
      ?auto_129289 - BLOCK
    )
    :vars
    (
      ?auto_129290 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_129289 ?auto_129290 ) ( not ( = ?auto_129282 ?auto_129283 ) ) ( not ( = ?auto_129282 ?auto_129284 ) ) ( not ( = ?auto_129282 ?auto_129285 ) ) ( not ( = ?auto_129282 ?auto_129286 ) ) ( not ( = ?auto_129282 ?auto_129287 ) ) ( not ( = ?auto_129282 ?auto_129288 ) ) ( not ( = ?auto_129282 ?auto_129289 ) ) ( not ( = ?auto_129282 ?auto_129290 ) ) ( not ( = ?auto_129283 ?auto_129284 ) ) ( not ( = ?auto_129283 ?auto_129285 ) ) ( not ( = ?auto_129283 ?auto_129286 ) ) ( not ( = ?auto_129283 ?auto_129287 ) ) ( not ( = ?auto_129283 ?auto_129288 ) ) ( not ( = ?auto_129283 ?auto_129289 ) ) ( not ( = ?auto_129283 ?auto_129290 ) ) ( not ( = ?auto_129284 ?auto_129285 ) ) ( not ( = ?auto_129284 ?auto_129286 ) ) ( not ( = ?auto_129284 ?auto_129287 ) ) ( not ( = ?auto_129284 ?auto_129288 ) ) ( not ( = ?auto_129284 ?auto_129289 ) ) ( not ( = ?auto_129284 ?auto_129290 ) ) ( not ( = ?auto_129285 ?auto_129286 ) ) ( not ( = ?auto_129285 ?auto_129287 ) ) ( not ( = ?auto_129285 ?auto_129288 ) ) ( not ( = ?auto_129285 ?auto_129289 ) ) ( not ( = ?auto_129285 ?auto_129290 ) ) ( not ( = ?auto_129286 ?auto_129287 ) ) ( not ( = ?auto_129286 ?auto_129288 ) ) ( not ( = ?auto_129286 ?auto_129289 ) ) ( not ( = ?auto_129286 ?auto_129290 ) ) ( not ( = ?auto_129287 ?auto_129288 ) ) ( not ( = ?auto_129287 ?auto_129289 ) ) ( not ( = ?auto_129287 ?auto_129290 ) ) ( not ( = ?auto_129288 ?auto_129289 ) ) ( not ( = ?auto_129288 ?auto_129290 ) ) ( not ( = ?auto_129289 ?auto_129290 ) ) ( ON ?auto_129288 ?auto_129289 ) ( ON ?auto_129287 ?auto_129288 ) ( ON ?auto_129286 ?auto_129287 ) ( ON ?auto_129285 ?auto_129286 ) ( ON ?auto_129284 ?auto_129285 ) ( ON ?auto_129283 ?auto_129284 ) ( ON ?auto_129282 ?auto_129283 ) ( CLEAR ?auto_129282 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_129282 )
      ( MAKE-8PILE ?auto_129282 ?auto_129283 ?auto_129284 ?auto_129285 ?auto_129286 ?auto_129287 ?auto_129288 ?auto_129289 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_129317 - BLOCK
      ?auto_129318 - BLOCK
      ?auto_129319 - BLOCK
      ?auto_129320 - BLOCK
      ?auto_129321 - BLOCK
      ?auto_129322 - BLOCK
      ?auto_129323 - BLOCK
      ?auto_129324 - BLOCK
      ?auto_129325 - BLOCK
    )
    :vars
    (
      ?auto_129326 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_129324 ) ( ON ?auto_129325 ?auto_129326 ) ( CLEAR ?auto_129325 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_129317 ) ( ON ?auto_129318 ?auto_129317 ) ( ON ?auto_129319 ?auto_129318 ) ( ON ?auto_129320 ?auto_129319 ) ( ON ?auto_129321 ?auto_129320 ) ( ON ?auto_129322 ?auto_129321 ) ( ON ?auto_129323 ?auto_129322 ) ( ON ?auto_129324 ?auto_129323 ) ( not ( = ?auto_129317 ?auto_129318 ) ) ( not ( = ?auto_129317 ?auto_129319 ) ) ( not ( = ?auto_129317 ?auto_129320 ) ) ( not ( = ?auto_129317 ?auto_129321 ) ) ( not ( = ?auto_129317 ?auto_129322 ) ) ( not ( = ?auto_129317 ?auto_129323 ) ) ( not ( = ?auto_129317 ?auto_129324 ) ) ( not ( = ?auto_129317 ?auto_129325 ) ) ( not ( = ?auto_129317 ?auto_129326 ) ) ( not ( = ?auto_129318 ?auto_129319 ) ) ( not ( = ?auto_129318 ?auto_129320 ) ) ( not ( = ?auto_129318 ?auto_129321 ) ) ( not ( = ?auto_129318 ?auto_129322 ) ) ( not ( = ?auto_129318 ?auto_129323 ) ) ( not ( = ?auto_129318 ?auto_129324 ) ) ( not ( = ?auto_129318 ?auto_129325 ) ) ( not ( = ?auto_129318 ?auto_129326 ) ) ( not ( = ?auto_129319 ?auto_129320 ) ) ( not ( = ?auto_129319 ?auto_129321 ) ) ( not ( = ?auto_129319 ?auto_129322 ) ) ( not ( = ?auto_129319 ?auto_129323 ) ) ( not ( = ?auto_129319 ?auto_129324 ) ) ( not ( = ?auto_129319 ?auto_129325 ) ) ( not ( = ?auto_129319 ?auto_129326 ) ) ( not ( = ?auto_129320 ?auto_129321 ) ) ( not ( = ?auto_129320 ?auto_129322 ) ) ( not ( = ?auto_129320 ?auto_129323 ) ) ( not ( = ?auto_129320 ?auto_129324 ) ) ( not ( = ?auto_129320 ?auto_129325 ) ) ( not ( = ?auto_129320 ?auto_129326 ) ) ( not ( = ?auto_129321 ?auto_129322 ) ) ( not ( = ?auto_129321 ?auto_129323 ) ) ( not ( = ?auto_129321 ?auto_129324 ) ) ( not ( = ?auto_129321 ?auto_129325 ) ) ( not ( = ?auto_129321 ?auto_129326 ) ) ( not ( = ?auto_129322 ?auto_129323 ) ) ( not ( = ?auto_129322 ?auto_129324 ) ) ( not ( = ?auto_129322 ?auto_129325 ) ) ( not ( = ?auto_129322 ?auto_129326 ) ) ( not ( = ?auto_129323 ?auto_129324 ) ) ( not ( = ?auto_129323 ?auto_129325 ) ) ( not ( = ?auto_129323 ?auto_129326 ) ) ( not ( = ?auto_129324 ?auto_129325 ) ) ( not ( = ?auto_129324 ?auto_129326 ) ) ( not ( = ?auto_129325 ?auto_129326 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_129325 ?auto_129326 )
      ( !STACK ?auto_129325 ?auto_129324 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_129355 - BLOCK
      ?auto_129356 - BLOCK
      ?auto_129357 - BLOCK
      ?auto_129358 - BLOCK
      ?auto_129359 - BLOCK
      ?auto_129360 - BLOCK
      ?auto_129361 - BLOCK
      ?auto_129362 - BLOCK
      ?auto_129363 - BLOCK
    )
    :vars
    (
      ?auto_129364 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_129363 ?auto_129364 ) ( ON-TABLE ?auto_129355 ) ( ON ?auto_129356 ?auto_129355 ) ( ON ?auto_129357 ?auto_129356 ) ( ON ?auto_129358 ?auto_129357 ) ( ON ?auto_129359 ?auto_129358 ) ( ON ?auto_129360 ?auto_129359 ) ( ON ?auto_129361 ?auto_129360 ) ( not ( = ?auto_129355 ?auto_129356 ) ) ( not ( = ?auto_129355 ?auto_129357 ) ) ( not ( = ?auto_129355 ?auto_129358 ) ) ( not ( = ?auto_129355 ?auto_129359 ) ) ( not ( = ?auto_129355 ?auto_129360 ) ) ( not ( = ?auto_129355 ?auto_129361 ) ) ( not ( = ?auto_129355 ?auto_129362 ) ) ( not ( = ?auto_129355 ?auto_129363 ) ) ( not ( = ?auto_129355 ?auto_129364 ) ) ( not ( = ?auto_129356 ?auto_129357 ) ) ( not ( = ?auto_129356 ?auto_129358 ) ) ( not ( = ?auto_129356 ?auto_129359 ) ) ( not ( = ?auto_129356 ?auto_129360 ) ) ( not ( = ?auto_129356 ?auto_129361 ) ) ( not ( = ?auto_129356 ?auto_129362 ) ) ( not ( = ?auto_129356 ?auto_129363 ) ) ( not ( = ?auto_129356 ?auto_129364 ) ) ( not ( = ?auto_129357 ?auto_129358 ) ) ( not ( = ?auto_129357 ?auto_129359 ) ) ( not ( = ?auto_129357 ?auto_129360 ) ) ( not ( = ?auto_129357 ?auto_129361 ) ) ( not ( = ?auto_129357 ?auto_129362 ) ) ( not ( = ?auto_129357 ?auto_129363 ) ) ( not ( = ?auto_129357 ?auto_129364 ) ) ( not ( = ?auto_129358 ?auto_129359 ) ) ( not ( = ?auto_129358 ?auto_129360 ) ) ( not ( = ?auto_129358 ?auto_129361 ) ) ( not ( = ?auto_129358 ?auto_129362 ) ) ( not ( = ?auto_129358 ?auto_129363 ) ) ( not ( = ?auto_129358 ?auto_129364 ) ) ( not ( = ?auto_129359 ?auto_129360 ) ) ( not ( = ?auto_129359 ?auto_129361 ) ) ( not ( = ?auto_129359 ?auto_129362 ) ) ( not ( = ?auto_129359 ?auto_129363 ) ) ( not ( = ?auto_129359 ?auto_129364 ) ) ( not ( = ?auto_129360 ?auto_129361 ) ) ( not ( = ?auto_129360 ?auto_129362 ) ) ( not ( = ?auto_129360 ?auto_129363 ) ) ( not ( = ?auto_129360 ?auto_129364 ) ) ( not ( = ?auto_129361 ?auto_129362 ) ) ( not ( = ?auto_129361 ?auto_129363 ) ) ( not ( = ?auto_129361 ?auto_129364 ) ) ( not ( = ?auto_129362 ?auto_129363 ) ) ( not ( = ?auto_129362 ?auto_129364 ) ) ( not ( = ?auto_129363 ?auto_129364 ) ) ( CLEAR ?auto_129361 ) ( ON ?auto_129362 ?auto_129363 ) ( CLEAR ?auto_129362 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_129355 ?auto_129356 ?auto_129357 ?auto_129358 ?auto_129359 ?auto_129360 ?auto_129361 ?auto_129362 )
      ( MAKE-9PILE ?auto_129355 ?auto_129356 ?auto_129357 ?auto_129358 ?auto_129359 ?auto_129360 ?auto_129361 ?auto_129362 ?auto_129363 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_129393 - BLOCK
      ?auto_129394 - BLOCK
      ?auto_129395 - BLOCK
      ?auto_129396 - BLOCK
      ?auto_129397 - BLOCK
      ?auto_129398 - BLOCK
      ?auto_129399 - BLOCK
      ?auto_129400 - BLOCK
      ?auto_129401 - BLOCK
    )
    :vars
    (
      ?auto_129402 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_129401 ?auto_129402 ) ( ON-TABLE ?auto_129393 ) ( ON ?auto_129394 ?auto_129393 ) ( ON ?auto_129395 ?auto_129394 ) ( ON ?auto_129396 ?auto_129395 ) ( ON ?auto_129397 ?auto_129396 ) ( ON ?auto_129398 ?auto_129397 ) ( not ( = ?auto_129393 ?auto_129394 ) ) ( not ( = ?auto_129393 ?auto_129395 ) ) ( not ( = ?auto_129393 ?auto_129396 ) ) ( not ( = ?auto_129393 ?auto_129397 ) ) ( not ( = ?auto_129393 ?auto_129398 ) ) ( not ( = ?auto_129393 ?auto_129399 ) ) ( not ( = ?auto_129393 ?auto_129400 ) ) ( not ( = ?auto_129393 ?auto_129401 ) ) ( not ( = ?auto_129393 ?auto_129402 ) ) ( not ( = ?auto_129394 ?auto_129395 ) ) ( not ( = ?auto_129394 ?auto_129396 ) ) ( not ( = ?auto_129394 ?auto_129397 ) ) ( not ( = ?auto_129394 ?auto_129398 ) ) ( not ( = ?auto_129394 ?auto_129399 ) ) ( not ( = ?auto_129394 ?auto_129400 ) ) ( not ( = ?auto_129394 ?auto_129401 ) ) ( not ( = ?auto_129394 ?auto_129402 ) ) ( not ( = ?auto_129395 ?auto_129396 ) ) ( not ( = ?auto_129395 ?auto_129397 ) ) ( not ( = ?auto_129395 ?auto_129398 ) ) ( not ( = ?auto_129395 ?auto_129399 ) ) ( not ( = ?auto_129395 ?auto_129400 ) ) ( not ( = ?auto_129395 ?auto_129401 ) ) ( not ( = ?auto_129395 ?auto_129402 ) ) ( not ( = ?auto_129396 ?auto_129397 ) ) ( not ( = ?auto_129396 ?auto_129398 ) ) ( not ( = ?auto_129396 ?auto_129399 ) ) ( not ( = ?auto_129396 ?auto_129400 ) ) ( not ( = ?auto_129396 ?auto_129401 ) ) ( not ( = ?auto_129396 ?auto_129402 ) ) ( not ( = ?auto_129397 ?auto_129398 ) ) ( not ( = ?auto_129397 ?auto_129399 ) ) ( not ( = ?auto_129397 ?auto_129400 ) ) ( not ( = ?auto_129397 ?auto_129401 ) ) ( not ( = ?auto_129397 ?auto_129402 ) ) ( not ( = ?auto_129398 ?auto_129399 ) ) ( not ( = ?auto_129398 ?auto_129400 ) ) ( not ( = ?auto_129398 ?auto_129401 ) ) ( not ( = ?auto_129398 ?auto_129402 ) ) ( not ( = ?auto_129399 ?auto_129400 ) ) ( not ( = ?auto_129399 ?auto_129401 ) ) ( not ( = ?auto_129399 ?auto_129402 ) ) ( not ( = ?auto_129400 ?auto_129401 ) ) ( not ( = ?auto_129400 ?auto_129402 ) ) ( not ( = ?auto_129401 ?auto_129402 ) ) ( ON ?auto_129400 ?auto_129401 ) ( CLEAR ?auto_129398 ) ( ON ?auto_129399 ?auto_129400 ) ( CLEAR ?auto_129399 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_129393 ?auto_129394 ?auto_129395 ?auto_129396 ?auto_129397 ?auto_129398 ?auto_129399 )
      ( MAKE-9PILE ?auto_129393 ?auto_129394 ?auto_129395 ?auto_129396 ?auto_129397 ?auto_129398 ?auto_129399 ?auto_129400 ?auto_129401 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_129431 - BLOCK
      ?auto_129432 - BLOCK
      ?auto_129433 - BLOCK
      ?auto_129434 - BLOCK
      ?auto_129435 - BLOCK
      ?auto_129436 - BLOCK
      ?auto_129437 - BLOCK
      ?auto_129438 - BLOCK
      ?auto_129439 - BLOCK
    )
    :vars
    (
      ?auto_129440 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_129439 ?auto_129440 ) ( ON-TABLE ?auto_129431 ) ( ON ?auto_129432 ?auto_129431 ) ( ON ?auto_129433 ?auto_129432 ) ( ON ?auto_129434 ?auto_129433 ) ( ON ?auto_129435 ?auto_129434 ) ( not ( = ?auto_129431 ?auto_129432 ) ) ( not ( = ?auto_129431 ?auto_129433 ) ) ( not ( = ?auto_129431 ?auto_129434 ) ) ( not ( = ?auto_129431 ?auto_129435 ) ) ( not ( = ?auto_129431 ?auto_129436 ) ) ( not ( = ?auto_129431 ?auto_129437 ) ) ( not ( = ?auto_129431 ?auto_129438 ) ) ( not ( = ?auto_129431 ?auto_129439 ) ) ( not ( = ?auto_129431 ?auto_129440 ) ) ( not ( = ?auto_129432 ?auto_129433 ) ) ( not ( = ?auto_129432 ?auto_129434 ) ) ( not ( = ?auto_129432 ?auto_129435 ) ) ( not ( = ?auto_129432 ?auto_129436 ) ) ( not ( = ?auto_129432 ?auto_129437 ) ) ( not ( = ?auto_129432 ?auto_129438 ) ) ( not ( = ?auto_129432 ?auto_129439 ) ) ( not ( = ?auto_129432 ?auto_129440 ) ) ( not ( = ?auto_129433 ?auto_129434 ) ) ( not ( = ?auto_129433 ?auto_129435 ) ) ( not ( = ?auto_129433 ?auto_129436 ) ) ( not ( = ?auto_129433 ?auto_129437 ) ) ( not ( = ?auto_129433 ?auto_129438 ) ) ( not ( = ?auto_129433 ?auto_129439 ) ) ( not ( = ?auto_129433 ?auto_129440 ) ) ( not ( = ?auto_129434 ?auto_129435 ) ) ( not ( = ?auto_129434 ?auto_129436 ) ) ( not ( = ?auto_129434 ?auto_129437 ) ) ( not ( = ?auto_129434 ?auto_129438 ) ) ( not ( = ?auto_129434 ?auto_129439 ) ) ( not ( = ?auto_129434 ?auto_129440 ) ) ( not ( = ?auto_129435 ?auto_129436 ) ) ( not ( = ?auto_129435 ?auto_129437 ) ) ( not ( = ?auto_129435 ?auto_129438 ) ) ( not ( = ?auto_129435 ?auto_129439 ) ) ( not ( = ?auto_129435 ?auto_129440 ) ) ( not ( = ?auto_129436 ?auto_129437 ) ) ( not ( = ?auto_129436 ?auto_129438 ) ) ( not ( = ?auto_129436 ?auto_129439 ) ) ( not ( = ?auto_129436 ?auto_129440 ) ) ( not ( = ?auto_129437 ?auto_129438 ) ) ( not ( = ?auto_129437 ?auto_129439 ) ) ( not ( = ?auto_129437 ?auto_129440 ) ) ( not ( = ?auto_129438 ?auto_129439 ) ) ( not ( = ?auto_129438 ?auto_129440 ) ) ( not ( = ?auto_129439 ?auto_129440 ) ) ( ON ?auto_129438 ?auto_129439 ) ( ON ?auto_129437 ?auto_129438 ) ( CLEAR ?auto_129435 ) ( ON ?auto_129436 ?auto_129437 ) ( CLEAR ?auto_129436 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_129431 ?auto_129432 ?auto_129433 ?auto_129434 ?auto_129435 ?auto_129436 )
      ( MAKE-9PILE ?auto_129431 ?auto_129432 ?auto_129433 ?auto_129434 ?auto_129435 ?auto_129436 ?auto_129437 ?auto_129438 ?auto_129439 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_129469 - BLOCK
      ?auto_129470 - BLOCK
      ?auto_129471 - BLOCK
      ?auto_129472 - BLOCK
      ?auto_129473 - BLOCK
      ?auto_129474 - BLOCK
      ?auto_129475 - BLOCK
      ?auto_129476 - BLOCK
      ?auto_129477 - BLOCK
    )
    :vars
    (
      ?auto_129478 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_129477 ?auto_129478 ) ( ON-TABLE ?auto_129469 ) ( ON ?auto_129470 ?auto_129469 ) ( ON ?auto_129471 ?auto_129470 ) ( ON ?auto_129472 ?auto_129471 ) ( not ( = ?auto_129469 ?auto_129470 ) ) ( not ( = ?auto_129469 ?auto_129471 ) ) ( not ( = ?auto_129469 ?auto_129472 ) ) ( not ( = ?auto_129469 ?auto_129473 ) ) ( not ( = ?auto_129469 ?auto_129474 ) ) ( not ( = ?auto_129469 ?auto_129475 ) ) ( not ( = ?auto_129469 ?auto_129476 ) ) ( not ( = ?auto_129469 ?auto_129477 ) ) ( not ( = ?auto_129469 ?auto_129478 ) ) ( not ( = ?auto_129470 ?auto_129471 ) ) ( not ( = ?auto_129470 ?auto_129472 ) ) ( not ( = ?auto_129470 ?auto_129473 ) ) ( not ( = ?auto_129470 ?auto_129474 ) ) ( not ( = ?auto_129470 ?auto_129475 ) ) ( not ( = ?auto_129470 ?auto_129476 ) ) ( not ( = ?auto_129470 ?auto_129477 ) ) ( not ( = ?auto_129470 ?auto_129478 ) ) ( not ( = ?auto_129471 ?auto_129472 ) ) ( not ( = ?auto_129471 ?auto_129473 ) ) ( not ( = ?auto_129471 ?auto_129474 ) ) ( not ( = ?auto_129471 ?auto_129475 ) ) ( not ( = ?auto_129471 ?auto_129476 ) ) ( not ( = ?auto_129471 ?auto_129477 ) ) ( not ( = ?auto_129471 ?auto_129478 ) ) ( not ( = ?auto_129472 ?auto_129473 ) ) ( not ( = ?auto_129472 ?auto_129474 ) ) ( not ( = ?auto_129472 ?auto_129475 ) ) ( not ( = ?auto_129472 ?auto_129476 ) ) ( not ( = ?auto_129472 ?auto_129477 ) ) ( not ( = ?auto_129472 ?auto_129478 ) ) ( not ( = ?auto_129473 ?auto_129474 ) ) ( not ( = ?auto_129473 ?auto_129475 ) ) ( not ( = ?auto_129473 ?auto_129476 ) ) ( not ( = ?auto_129473 ?auto_129477 ) ) ( not ( = ?auto_129473 ?auto_129478 ) ) ( not ( = ?auto_129474 ?auto_129475 ) ) ( not ( = ?auto_129474 ?auto_129476 ) ) ( not ( = ?auto_129474 ?auto_129477 ) ) ( not ( = ?auto_129474 ?auto_129478 ) ) ( not ( = ?auto_129475 ?auto_129476 ) ) ( not ( = ?auto_129475 ?auto_129477 ) ) ( not ( = ?auto_129475 ?auto_129478 ) ) ( not ( = ?auto_129476 ?auto_129477 ) ) ( not ( = ?auto_129476 ?auto_129478 ) ) ( not ( = ?auto_129477 ?auto_129478 ) ) ( ON ?auto_129476 ?auto_129477 ) ( ON ?auto_129475 ?auto_129476 ) ( ON ?auto_129474 ?auto_129475 ) ( CLEAR ?auto_129472 ) ( ON ?auto_129473 ?auto_129474 ) ( CLEAR ?auto_129473 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_129469 ?auto_129470 ?auto_129471 ?auto_129472 ?auto_129473 )
      ( MAKE-9PILE ?auto_129469 ?auto_129470 ?auto_129471 ?auto_129472 ?auto_129473 ?auto_129474 ?auto_129475 ?auto_129476 ?auto_129477 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_129507 - BLOCK
      ?auto_129508 - BLOCK
      ?auto_129509 - BLOCK
      ?auto_129510 - BLOCK
      ?auto_129511 - BLOCK
      ?auto_129512 - BLOCK
      ?auto_129513 - BLOCK
      ?auto_129514 - BLOCK
      ?auto_129515 - BLOCK
    )
    :vars
    (
      ?auto_129516 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_129515 ?auto_129516 ) ( ON-TABLE ?auto_129507 ) ( ON ?auto_129508 ?auto_129507 ) ( ON ?auto_129509 ?auto_129508 ) ( not ( = ?auto_129507 ?auto_129508 ) ) ( not ( = ?auto_129507 ?auto_129509 ) ) ( not ( = ?auto_129507 ?auto_129510 ) ) ( not ( = ?auto_129507 ?auto_129511 ) ) ( not ( = ?auto_129507 ?auto_129512 ) ) ( not ( = ?auto_129507 ?auto_129513 ) ) ( not ( = ?auto_129507 ?auto_129514 ) ) ( not ( = ?auto_129507 ?auto_129515 ) ) ( not ( = ?auto_129507 ?auto_129516 ) ) ( not ( = ?auto_129508 ?auto_129509 ) ) ( not ( = ?auto_129508 ?auto_129510 ) ) ( not ( = ?auto_129508 ?auto_129511 ) ) ( not ( = ?auto_129508 ?auto_129512 ) ) ( not ( = ?auto_129508 ?auto_129513 ) ) ( not ( = ?auto_129508 ?auto_129514 ) ) ( not ( = ?auto_129508 ?auto_129515 ) ) ( not ( = ?auto_129508 ?auto_129516 ) ) ( not ( = ?auto_129509 ?auto_129510 ) ) ( not ( = ?auto_129509 ?auto_129511 ) ) ( not ( = ?auto_129509 ?auto_129512 ) ) ( not ( = ?auto_129509 ?auto_129513 ) ) ( not ( = ?auto_129509 ?auto_129514 ) ) ( not ( = ?auto_129509 ?auto_129515 ) ) ( not ( = ?auto_129509 ?auto_129516 ) ) ( not ( = ?auto_129510 ?auto_129511 ) ) ( not ( = ?auto_129510 ?auto_129512 ) ) ( not ( = ?auto_129510 ?auto_129513 ) ) ( not ( = ?auto_129510 ?auto_129514 ) ) ( not ( = ?auto_129510 ?auto_129515 ) ) ( not ( = ?auto_129510 ?auto_129516 ) ) ( not ( = ?auto_129511 ?auto_129512 ) ) ( not ( = ?auto_129511 ?auto_129513 ) ) ( not ( = ?auto_129511 ?auto_129514 ) ) ( not ( = ?auto_129511 ?auto_129515 ) ) ( not ( = ?auto_129511 ?auto_129516 ) ) ( not ( = ?auto_129512 ?auto_129513 ) ) ( not ( = ?auto_129512 ?auto_129514 ) ) ( not ( = ?auto_129512 ?auto_129515 ) ) ( not ( = ?auto_129512 ?auto_129516 ) ) ( not ( = ?auto_129513 ?auto_129514 ) ) ( not ( = ?auto_129513 ?auto_129515 ) ) ( not ( = ?auto_129513 ?auto_129516 ) ) ( not ( = ?auto_129514 ?auto_129515 ) ) ( not ( = ?auto_129514 ?auto_129516 ) ) ( not ( = ?auto_129515 ?auto_129516 ) ) ( ON ?auto_129514 ?auto_129515 ) ( ON ?auto_129513 ?auto_129514 ) ( ON ?auto_129512 ?auto_129513 ) ( ON ?auto_129511 ?auto_129512 ) ( CLEAR ?auto_129509 ) ( ON ?auto_129510 ?auto_129511 ) ( CLEAR ?auto_129510 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_129507 ?auto_129508 ?auto_129509 ?auto_129510 )
      ( MAKE-9PILE ?auto_129507 ?auto_129508 ?auto_129509 ?auto_129510 ?auto_129511 ?auto_129512 ?auto_129513 ?auto_129514 ?auto_129515 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_129545 - BLOCK
      ?auto_129546 - BLOCK
      ?auto_129547 - BLOCK
      ?auto_129548 - BLOCK
      ?auto_129549 - BLOCK
      ?auto_129550 - BLOCK
      ?auto_129551 - BLOCK
      ?auto_129552 - BLOCK
      ?auto_129553 - BLOCK
    )
    :vars
    (
      ?auto_129554 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_129553 ?auto_129554 ) ( ON-TABLE ?auto_129545 ) ( ON ?auto_129546 ?auto_129545 ) ( not ( = ?auto_129545 ?auto_129546 ) ) ( not ( = ?auto_129545 ?auto_129547 ) ) ( not ( = ?auto_129545 ?auto_129548 ) ) ( not ( = ?auto_129545 ?auto_129549 ) ) ( not ( = ?auto_129545 ?auto_129550 ) ) ( not ( = ?auto_129545 ?auto_129551 ) ) ( not ( = ?auto_129545 ?auto_129552 ) ) ( not ( = ?auto_129545 ?auto_129553 ) ) ( not ( = ?auto_129545 ?auto_129554 ) ) ( not ( = ?auto_129546 ?auto_129547 ) ) ( not ( = ?auto_129546 ?auto_129548 ) ) ( not ( = ?auto_129546 ?auto_129549 ) ) ( not ( = ?auto_129546 ?auto_129550 ) ) ( not ( = ?auto_129546 ?auto_129551 ) ) ( not ( = ?auto_129546 ?auto_129552 ) ) ( not ( = ?auto_129546 ?auto_129553 ) ) ( not ( = ?auto_129546 ?auto_129554 ) ) ( not ( = ?auto_129547 ?auto_129548 ) ) ( not ( = ?auto_129547 ?auto_129549 ) ) ( not ( = ?auto_129547 ?auto_129550 ) ) ( not ( = ?auto_129547 ?auto_129551 ) ) ( not ( = ?auto_129547 ?auto_129552 ) ) ( not ( = ?auto_129547 ?auto_129553 ) ) ( not ( = ?auto_129547 ?auto_129554 ) ) ( not ( = ?auto_129548 ?auto_129549 ) ) ( not ( = ?auto_129548 ?auto_129550 ) ) ( not ( = ?auto_129548 ?auto_129551 ) ) ( not ( = ?auto_129548 ?auto_129552 ) ) ( not ( = ?auto_129548 ?auto_129553 ) ) ( not ( = ?auto_129548 ?auto_129554 ) ) ( not ( = ?auto_129549 ?auto_129550 ) ) ( not ( = ?auto_129549 ?auto_129551 ) ) ( not ( = ?auto_129549 ?auto_129552 ) ) ( not ( = ?auto_129549 ?auto_129553 ) ) ( not ( = ?auto_129549 ?auto_129554 ) ) ( not ( = ?auto_129550 ?auto_129551 ) ) ( not ( = ?auto_129550 ?auto_129552 ) ) ( not ( = ?auto_129550 ?auto_129553 ) ) ( not ( = ?auto_129550 ?auto_129554 ) ) ( not ( = ?auto_129551 ?auto_129552 ) ) ( not ( = ?auto_129551 ?auto_129553 ) ) ( not ( = ?auto_129551 ?auto_129554 ) ) ( not ( = ?auto_129552 ?auto_129553 ) ) ( not ( = ?auto_129552 ?auto_129554 ) ) ( not ( = ?auto_129553 ?auto_129554 ) ) ( ON ?auto_129552 ?auto_129553 ) ( ON ?auto_129551 ?auto_129552 ) ( ON ?auto_129550 ?auto_129551 ) ( ON ?auto_129549 ?auto_129550 ) ( ON ?auto_129548 ?auto_129549 ) ( CLEAR ?auto_129546 ) ( ON ?auto_129547 ?auto_129548 ) ( CLEAR ?auto_129547 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_129545 ?auto_129546 ?auto_129547 )
      ( MAKE-9PILE ?auto_129545 ?auto_129546 ?auto_129547 ?auto_129548 ?auto_129549 ?auto_129550 ?auto_129551 ?auto_129552 ?auto_129553 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_129583 - BLOCK
      ?auto_129584 - BLOCK
      ?auto_129585 - BLOCK
      ?auto_129586 - BLOCK
      ?auto_129587 - BLOCK
      ?auto_129588 - BLOCK
      ?auto_129589 - BLOCK
      ?auto_129590 - BLOCK
      ?auto_129591 - BLOCK
    )
    :vars
    (
      ?auto_129592 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_129591 ?auto_129592 ) ( ON-TABLE ?auto_129583 ) ( not ( = ?auto_129583 ?auto_129584 ) ) ( not ( = ?auto_129583 ?auto_129585 ) ) ( not ( = ?auto_129583 ?auto_129586 ) ) ( not ( = ?auto_129583 ?auto_129587 ) ) ( not ( = ?auto_129583 ?auto_129588 ) ) ( not ( = ?auto_129583 ?auto_129589 ) ) ( not ( = ?auto_129583 ?auto_129590 ) ) ( not ( = ?auto_129583 ?auto_129591 ) ) ( not ( = ?auto_129583 ?auto_129592 ) ) ( not ( = ?auto_129584 ?auto_129585 ) ) ( not ( = ?auto_129584 ?auto_129586 ) ) ( not ( = ?auto_129584 ?auto_129587 ) ) ( not ( = ?auto_129584 ?auto_129588 ) ) ( not ( = ?auto_129584 ?auto_129589 ) ) ( not ( = ?auto_129584 ?auto_129590 ) ) ( not ( = ?auto_129584 ?auto_129591 ) ) ( not ( = ?auto_129584 ?auto_129592 ) ) ( not ( = ?auto_129585 ?auto_129586 ) ) ( not ( = ?auto_129585 ?auto_129587 ) ) ( not ( = ?auto_129585 ?auto_129588 ) ) ( not ( = ?auto_129585 ?auto_129589 ) ) ( not ( = ?auto_129585 ?auto_129590 ) ) ( not ( = ?auto_129585 ?auto_129591 ) ) ( not ( = ?auto_129585 ?auto_129592 ) ) ( not ( = ?auto_129586 ?auto_129587 ) ) ( not ( = ?auto_129586 ?auto_129588 ) ) ( not ( = ?auto_129586 ?auto_129589 ) ) ( not ( = ?auto_129586 ?auto_129590 ) ) ( not ( = ?auto_129586 ?auto_129591 ) ) ( not ( = ?auto_129586 ?auto_129592 ) ) ( not ( = ?auto_129587 ?auto_129588 ) ) ( not ( = ?auto_129587 ?auto_129589 ) ) ( not ( = ?auto_129587 ?auto_129590 ) ) ( not ( = ?auto_129587 ?auto_129591 ) ) ( not ( = ?auto_129587 ?auto_129592 ) ) ( not ( = ?auto_129588 ?auto_129589 ) ) ( not ( = ?auto_129588 ?auto_129590 ) ) ( not ( = ?auto_129588 ?auto_129591 ) ) ( not ( = ?auto_129588 ?auto_129592 ) ) ( not ( = ?auto_129589 ?auto_129590 ) ) ( not ( = ?auto_129589 ?auto_129591 ) ) ( not ( = ?auto_129589 ?auto_129592 ) ) ( not ( = ?auto_129590 ?auto_129591 ) ) ( not ( = ?auto_129590 ?auto_129592 ) ) ( not ( = ?auto_129591 ?auto_129592 ) ) ( ON ?auto_129590 ?auto_129591 ) ( ON ?auto_129589 ?auto_129590 ) ( ON ?auto_129588 ?auto_129589 ) ( ON ?auto_129587 ?auto_129588 ) ( ON ?auto_129586 ?auto_129587 ) ( ON ?auto_129585 ?auto_129586 ) ( CLEAR ?auto_129583 ) ( ON ?auto_129584 ?auto_129585 ) ( CLEAR ?auto_129584 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_129583 ?auto_129584 )
      ( MAKE-9PILE ?auto_129583 ?auto_129584 ?auto_129585 ?auto_129586 ?auto_129587 ?auto_129588 ?auto_129589 ?auto_129590 ?auto_129591 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_129621 - BLOCK
      ?auto_129622 - BLOCK
      ?auto_129623 - BLOCK
      ?auto_129624 - BLOCK
      ?auto_129625 - BLOCK
      ?auto_129626 - BLOCK
      ?auto_129627 - BLOCK
      ?auto_129628 - BLOCK
      ?auto_129629 - BLOCK
    )
    :vars
    (
      ?auto_129630 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_129629 ?auto_129630 ) ( not ( = ?auto_129621 ?auto_129622 ) ) ( not ( = ?auto_129621 ?auto_129623 ) ) ( not ( = ?auto_129621 ?auto_129624 ) ) ( not ( = ?auto_129621 ?auto_129625 ) ) ( not ( = ?auto_129621 ?auto_129626 ) ) ( not ( = ?auto_129621 ?auto_129627 ) ) ( not ( = ?auto_129621 ?auto_129628 ) ) ( not ( = ?auto_129621 ?auto_129629 ) ) ( not ( = ?auto_129621 ?auto_129630 ) ) ( not ( = ?auto_129622 ?auto_129623 ) ) ( not ( = ?auto_129622 ?auto_129624 ) ) ( not ( = ?auto_129622 ?auto_129625 ) ) ( not ( = ?auto_129622 ?auto_129626 ) ) ( not ( = ?auto_129622 ?auto_129627 ) ) ( not ( = ?auto_129622 ?auto_129628 ) ) ( not ( = ?auto_129622 ?auto_129629 ) ) ( not ( = ?auto_129622 ?auto_129630 ) ) ( not ( = ?auto_129623 ?auto_129624 ) ) ( not ( = ?auto_129623 ?auto_129625 ) ) ( not ( = ?auto_129623 ?auto_129626 ) ) ( not ( = ?auto_129623 ?auto_129627 ) ) ( not ( = ?auto_129623 ?auto_129628 ) ) ( not ( = ?auto_129623 ?auto_129629 ) ) ( not ( = ?auto_129623 ?auto_129630 ) ) ( not ( = ?auto_129624 ?auto_129625 ) ) ( not ( = ?auto_129624 ?auto_129626 ) ) ( not ( = ?auto_129624 ?auto_129627 ) ) ( not ( = ?auto_129624 ?auto_129628 ) ) ( not ( = ?auto_129624 ?auto_129629 ) ) ( not ( = ?auto_129624 ?auto_129630 ) ) ( not ( = ?auto_129625 ?auto_129626 ) ) ( not ( = ?auto_129625 ?auto_129627 ) ) ( not ( = ?auto_129625 ?auto_129628 ) ) ( not ( = ?auto_129625 ?auto_129629 ) ) ( not ( = ?auto_129625 ?auto_129630 ) ) ( not ( = ?auto_129626 ?auto_129627 ) ) ( not ( = ?auto_129626 ?auto_129628 ) ) ( not ( = ?auto_129626 ?auto_129629 ) ) ( not ( = ?auto_129626 ?auto_129630 ) ) ( not ( = ?auto_129627 ?auto_129628 ) ) ( not ( = ?auto_129627 ?auto_129629 ) ) ( not ( = ?auto_129627 ?auto_129630 ) ) ( not ( = ?auto_129628 ?auto_129629 ) ) ( not ( = ?auto_129628 ?auto_129630 ) ) ( not ( = ?auto_129629 ?auto_129630 ) ) ( ON ?auto_129628 ?auto_129629 ) ( ON ?auto_129627 ?auto_129628 ) ( ON ?auto_129626 ?auto_129627 ) ( ON ?auto_129625 ?auto_129626 ) ( ON ?auto_129624 ?auto_129625 ) ( ON ?auto_129623 ?auto_129624 ) ( ON ?auto_129622 ?auto_129623 ) ( ON ?auto_129621 ?auto_129622 ) ( CLEAR ?auto_129621 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_129621 )
      ( MAKE-9PILE ?auto_129621 ?auto_129622 ?auto_129623 ?auto_129624 ?auto_129625 ?auto_129626 ?auto_129627 ?auto_129628 ?auto_129629 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_129660 - BLOCK
      ?auto_129661 - BLOCK
      ?auto_129662 - BLOCK
      ?auto_129663 - BLOCK
      ?auto_129664 - BLOCK
      ?auto_129665 - BLOCK
      ?auto_129666 - BLOCK
      ?auto_129667 - BLOCK
      ?auto_129668 - BLOCK
      ?auto_129669 - BLOCK
    )
    :vars
    (
      ?auto_129670 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_129668 ) ( ON ?auto_129669 ?auto_129670 ) ( CLEAR ?auto_129669 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_129660 ) ( ON ?auto_129661 ?auto_129660 ) ( ON ?auto_129662 ?auto_129661 ) ( ON ?auto_129663 ?auto_129662 ) ( ON ?auto_129664 ?auto_129663 ) ( ON ?auto_129665 ?auto_129664 ) ( ON ?auto_129666 ?auto_129665 ) ( ON ?auto_129667 ?auto_129666 ) ( ON ?auto_129668 ?auto_129667 ) ( not ( = ?auto_129660 ?auto_129661 ) ) ( not ( = ?auto_129660 ?auto_129662 ) ) ( not ( = ?auto_129660 ?auto_129663 ) ) ( not ( = ?auto_129660 ?auto_129664 ) ) ( not ( = ?auto_129660 ?auto_129665 ) ) ( not ( = ?auto_129660 ?auto_129666 ) ) ( not ( = ?auto_129660 ?auto_129667 ) ) ( not ( = ?auto_129660 ?auto_129668 ) ) ( not ( = ?auto_129660 ?auto_129669 ) ) ( not ( = ?auto_129660 ?auto_129670 ) ) ( not ( = ?auto_129661 ?auto_129662 ) ) ( not ( = ?auto_129661 ?auto_129663 ) ) ( not ( = ?auto_129661 ?auto_129664 ) ) ( not ( = ?auto_129661 ?auto_129665 ) ) ( not ( = ?auto_129661 ?auto_129666 ) ) ( not ( = ?auto_129661 ?auto_129667 ) ) ( not ( = ?auto_129661 ?auto_129668 ) ) ( not ( = ?auto_129661 ?auto_129669 ) ) ( not ( = ?auto_129661 ?auto_129670 ) ) ( not ( = ?auto_129662 ?auto_129663 ) ) ( not ( = ?auto_129662 ?auto_129664 ) ) ( not ( = ?auto_129662 ?auto_129665 ) ) ( not ( = ?auto_129662 ?auto_129666 ) ) ( not ( = ?auto_129662 ?auto_129667 ) ) ( not ( = ?auto_129662 ?auto_129668 ) ) ( not ( = ?auto_129662 ?auto_129669 ) ) ( not ( = ?auto_129662 ?auto_129670 ) ) ( not ( = ?auto_129663 ?auto_129664 ) ) ( not ( = ?auto_129663 ?auto_129665 ) ) ( not ( = ?auto_129663 ?auto_129666 ) ) ( not ( = ?auto_129663 ?auto_129667 ) ) ( not ( = ?auto_129663 ?auto_129668 ) ) ( not ( = ?auto_129663 ?auto_129669 ) ) ( not ( = ?auto_129663 ?auto_129670 ) ) ( not ( = ?auto_129664 ?auto_129665 ) ) ( not ( = ?auto_129664 ?auto_129666 ) ) ( not ( = ?auto_129664 ?auto_129667 ) ) ( not ( = ?auto_129664 ?auto_129668 ) ) ( not ( = ?auto_129664 ?auto_129669 ) ) ( not ( = ?auto_129664 ?auto_129670 ) ) ( not ( = ?auto_129665 ?auto_129666 ) ) ( not ( = ?auto_129665 ?auto_129667 ) ) ( not ( = ?auto_129665 ?auto_129668 ) ) ( not ( = ?auto_129665 ?auto_129669 ) ) ( not ( = ?auto_129665 ?auto_129670 ) ) ( not ( = ?auto_129666 ?auto_129667 ) ) ( not ( = ?auto_129666 ?auto_129668 ) ) ( not ( = ?auto_129666 ?auto_129669 ) ) ( not ( = ?auto_129666 ?auto_129670 ) ) ( not ( = ?auto_129667 ?auto_129668 ) ) ( not ( = ?auto_129667 ?auto_129669 ) ) ( not ( = ?auto_129667 ?auto_129670 ) ) ( not ( = ?auto_129668 ?auto_129669 ) ) ( not ( = ?auto_129668 ?auto_129670 ) ) ( not ( = ?auto_129669 ?auto_129670 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_129669 ?auto_129670 )
      ( !STACK ?auto_129669 ?auto_129668 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_129702 - BLOCK
      ?auto_129703 - BLOCK
      ?auto_129704 - BLOCK
      ?auto_129705 - BLOCK
      ?auto_129706 - BLOCK
      ?auto_129707 - BLOCK
      ?auto_129708 - BLOCK
      ?auto_129709 - BLOCK
      ?auto_129710 - BLOCK
      ?auto_129711 - BLOCK
    )
    :vars
    (
      ?auto_129712 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_129711 ?auto_129712 ) ( ON-TABLE ?auto_129702 ) ( ON ?auto_129703 ?auto_129702 ) ( ON ?auto_129704 ?auto_129703 ) ( ON ?auto_129705 ?auto_129704 ) ( ON ?auto_129706 ?auto_129705 ) ( ON ?auto_129707 ?auto_129706 ) ( ON ?auto_129708 ?auto_129707 ) ( ON ?auto_129709 ?auto_129708 ) ( not ( = ?auto_129702 ?auto_129703 ) ) ( not ( = ?auto_129702 ?auto_129704 ) ) ( not ( = ?auto_129702 ?auto_129705 ) ) ( not ( = ?auto_129702 ?auto_129706 ) ) ( not ( = ?auto_129702 ?auto_129707 ) ) ( not ( = ?auto_129702 ?auto_129708 ) ) ( not ( = ?auto_129702 ?auto_129709 ) ) ( not ( = ?auto_129702 ?auto_129710 ) ) ( not ( = ?auto_129702 ?auto_129711 ) ) ( not ( = ?auto_129702 ?auto_129712 ) ) ( not ( = ?auto_129703 ?auto_129704 ) ) ( not ( = ?auto_129703 ?auto_129705 ) ) ( not ( = ?auto_129703 ?auto_129706 ) ) ( not ( = ?auto_129703 ?auto_129707 ) ) ( not ( = ?auto_129703 ?auto_129708 ) ) ( not ( = ?auto_129703 ?auto_129709 ) ) ( not ( = ?auto_129703 ?auto_129710 ) ) ( not ( = ?auto_129703 ?auto_129711 ) ) ( not ( = ?auto_129703 ?auto_129712 ) ) ( not ( = ?auto_129704 ?auto_129705 ) ) ( not ( = ?auto_129704 ?auto_129706 ) ) ( not ( = ?auto_129704 ?auto_129707 ) ) ( not ( = ?auto_129704 ?auto_129708 ) ) ( not ( = ?auto_129704 ?auto_129709 ) ) ( not ( = ?auto_129704 ?auto_129710 ) ) ( not ( = ?auto_129704 ?auto_129711 ) ) ( not ( = ?auto_129704 ?auto_129712 ) ) ( not ( = ?auto_129705 ?auto_129706 ) ) ( not ( = ?auto_129705 ?auto_129707 ) ) ( not ( = ?auto_129705 ?auto_129708 ) ) ( not ( = ?auto_129705 ?auto_129709 ) ) ( not ( = ?auto_129705 ?auto_129710 ) ) ( not ( = ?auto_129705 ?auto_129711 ) ) ( not ( = ?auto_129705 ?auto_129712 ) ) ( not ( = ?auto_129706 ?auto_129707 ) ) ( not ( = ?auto_129706 ?auto_129708 ) ) ( not ( = ?auto_129706 ?auto_129709 ) ) ( not ( = ?auto_129706 ?auto_129710 ) ) ( not ( = ?auto_129706 ?auto_129711 ) ) ( not ( = ?auto_129706 ?auto_129712 ) ) ( not ( = ?auto_129707 ?auto_129708 ) ) ( not ( = ?auto_129707 ?auto_129709 ) ) ( not ( = ?auto_129707 ?auto_129710 ) ) ( not ( = ?auto_129707 ?auto_129711 ) ) ( not ( = ?auto_129707 ?auto_129712 ) ) ( not ( = ?auto_129708 ?auto_129709 ) ) ( not ( = ?auto_129708 ?auto_129710 ) ) ( not ( = ?auto_129708 ?auto_129711 ) ) ( not ( = ?auto_129708 ?auto_129712 ) ) ( not ( = ?auto_129709 ?auto_129710 ) ) ( not ( = ?auto_129709 ?auto_129711 ) ) ( not ( = ?auto_129709 ?auto_129712 ) ) ( not ( = ?auto_129710 ?auto_129711 ) ) ( not ( = ?auto_129710 ?auto_129712 ) ) ( not ( = ?auto_129711 ?auto_129712 ) ) ( CLEAR ?auto_129709 ) ( ON ?auto_129710 ?auto_129711 ) ( CLEAR ?auto_129710 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_129702 ?auto_129703 ?auto_129704 ?auto_129705 ?auto_129706 ?auto_129707 ?auto_129708 ?auto_129709 ?auto_129710 )
      ( MAKE-10PILE ?auto_129702 ?auto_129703 ?auto_129704 ?auto_129705 ?auto_129706 ?auto_129707 ?auto_129708 ?auto_129709 ?auto_129710 ?auto_129711 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_129744 - BLOCK
      ?auto_129745 - BLOCK
      ?auto_129746 - BLOCK
      ?auto_129747 - BLOCK
      ?auto_129748 - BLOCK
      ?auto_129749 - BLOCK
      ?auto_129750 - BLOCK
      ?auto_129751 - BLOCK
      ?auto_129752 - BLOCK
      ?auto_129753 - BLOCK
    )
    :vars
    (
      ?auto_129754 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_129753 ?auto_129754 ) ( ON-TABLE ?auto_129744 ) ( ON ?auto_129745 ?auto_129744 ) ( ON ?auto_129746 ?auto_129745 ) ( ON ?auto_129747 ?auto_129746 ) ( ON ?auto_129748 ?auto_129747 ) ( ON ?auto_129749 ?auto_129748 ) ( ON ?auto_129750 ?auto_129749 ) ( not ( = ?auto_129744 ?auto_129745 ) ) ( not ( = ?auto_129744 ?auto_129746 ) ) ( not ( = ?auto_129744 ?auto_129747 ) ) ( not ( = ?auto_129744 ?auto_129748 ) ) ( not ( = ?auto_129744 ?auto_129749 ) ) ( not ( = ?auto_129744 ?auto_129750 ) ) ( not ( = ?auto_129744 ?auto_129751 ) ) ( not ( = ?auto_129744 ?auto_129752 ) ) ( not ( = ?auto_129744 ?auto_129753 ) ) ( not ( = ?auto_129744 ?auto_129754 ) ) ( not ( = ?auto_129745 ?auto_129746 ) ) ( not ( = ?auto_129745 ?auto_129747 ) ) ( not ( = ?auto_129745 ?auto_129748 ) ) ( not ( = ?auto_129745 ?auto_129749 ) ) ( not ( = ?auto_129745 ?auto_129750 ) ) ( not ( = ?auto_129745 ?auto_129751 ) ) ( not ( = ?auto_129745 ?auto_129752 ) ) ( not ( = ?auto_129745 ?auto_129753 ) ) ( not ( = ?auto_129745 ?auto_129754 ) ) ( not ( = ?auto_129746 ?auto_129747 ) ) ( not ( = ?auto_129746 ?auto_129748 ) ) ( not ( = ?auto_129746 ?auto_129749 ) ) ( not ( = ?auto_129746 ?auto_129750 ) ) ( not ( = ?auto_129746 ?auto_129751 ) ) ( not ( = ?auto_129746 ?auto_129752 ) ) ( not ( = ?auto_129746 ?auto_129753 ) ) ( not ( = ?auto_129746 ?auto_129754 ) ) ( not ( = ?auto_129747 ?auto_129748 ) ) ( not ( = ?auto_129747 ?auto_129749 ) ) ( not ( = ?auto_129747 ?auto_129750 ) ) ( not ( = ?auto_129747 ?auto_129751 ) ) ( not ( = ?auto_129747 ?auto_129752 ) ) ( not ( = ?auto_129747 ?auto_129753 ) ) ( not ( = ?auto_129747 ?auto_129754 ) ) ( not ( = ?auto_129748 ?auto_129749 ) ) ( not ( = ?auto_129748 ?auto_129750 ) ) ( not ( = ?auto_129748 ?auto_129751 ) ) ( not ( = ?auto_129748 ?auto_129752 ) ) ( not ( = ?auto_129748 ?auto_129753 ) ) ( not ( = ?auto_129748 ?auto_129754 ) ) ( not ( = ?auto_129749 ?auto_129750 ) ) ( not ( = ?auto_129749 ?auto_129751 ) ) ( not ( = ?auto_129749 ?auto_129752 ) ) ( not ( = ?auto_129749 ?auto_129753 ) ) ( not ( = ?auto_129749 ?auto_129754 ) ) ( not ( = ?auto_129750 ?auto_129751 ) ) ( not ( = ?auto_129750 ?auto_129752 ) ) ( not ( = ?auto_129750 ?auto_129753 ) ) ( not ( = ?auto_129750 ?auto_129754 ) ) ( not ( = ?auto_129751 ?auto_129752 ) ) ( not ( = ?auto_129751 ?auto_129753 ) ) ( not ( = ?auto_129751 ?auto_129754 ) ) ( not ( = ?auto_129752 ?auto_129753 ) ) ( not ( = ?auto_129752 ?auto_129754 ) ) ( not ( = ?auto_129753 ?auto_129754 ) ) ( ON ?auto_129752 ?auto_129753 ) ( CLEAR ?auto_129750 ) ( ON ?auto_129751 ?auto_129752 ) ( CLEAR ?auto_129751 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_129744 ?auto_129745 ?auto_129746 ?auto_129747 ?auto_129748 ?auto_129749 ?auto_129750 ?auto_129751 )
      ( MAKE-10PILE ?auto_129744 ?auto_129745 ?auto_129746 ?auto_129747 ?auto_129748 ?auto_129749 ?auto_129750 ?auto_129751 ?auto_129752 ?auto_129753 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_129786 - BLOCK
      ?auto_129787 - BLOCK
      ?auto_129788 - BLOCK
      ?auto_129789 - BLOCK
      ?auto_129790 - BLOCK
      ?auto_129791 - BLOCK
      ?auto_129792 - BLOCK
      ?auto_129793 - BLOCK
      ?auto_129794 - BLOCK
      ?auto_129795 - BLOCK
    )
    :vars
    (
      ?auto_129796 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_129795 ?auto_129796 ) ( ON-TABLE ?auto_129786 ) ( ON ?auto_129787 ?auto_129786 ) ( ON ?auto_129788 ?auto_129787 ) ( ON ?auto_129789 ?auto_129788 ) ( ON ?auto_129790 ?auto_129789 ) ( ON ?auto_129791 ?auto_129790 ) ( not ( = ?auto_129786 ?auto_129787 ) ) ( not ( = ?auto_129786 ?auto_129788 ) ) ( not ( = ?auto_129786 ?auto_129789 ) ) ( not ( = ?auto_129786 ?auto_129790 ) ) ( not ( = ?auto_129786 ?auto_129791 ) ) ( not ( = ?auto_129786 ?auto_129792 ) ) ( not ( = ?auto_129786 ?auto_129793 ) ) ( not ( = ?auto_129786 ?auto_129794 ) ) ( not ( = ?auto_129786 ?auto_129795 ) ) ( not ( = ?auto_129786 ?auto_129796 ) ) ( not ( = ?auto_129787 ?auto_129788 ) ) ( not ( = ?auto_129787 ?auto_129789 ) ) ( not ( = ?auto_129787 ?auto_129790 ) ) ( not ( = ?auto_129787 ?auto_129791 ) ) ( not ( = ?auto_129787 ?auto_129792 ) ) ( not ( = ?auto_129787 ?auto_129793 ) ) ( not ( = ?auto_129787 ?auto_129794 ) ) ( not ( = ?auto_129787 ?auto_129795 ) ) ( not ( = ?auto_129787 ?auto_129796 ) ) ( not ( = ?auto_129788 ?auto_129789 ) ) ( not ( = ?auto_129788 ?auto_129790 ) ) ( not ( = ?auto_129788 ?auto_129791 ) ) ( not ( = ?auto_129788 ?auto_129792 ) ) ( not ( = ?auto_129788 ?auto_129793 ) ) ( not ( = ?auto_129788 ?auto_129794 ) ) ( not ( = ?auto_129788 ?auto_129795 ) ) ( not ( = ?auto_129788 ?auto_129796 ) ) ( not ( = ?auto_129789 ?auto_129790 ) ) ( not ( = ?auto_129789 ?auto_129791 ) ) ( not ( = ?auto_129789 ?auto_129792 ) ) ( not ( = ?auto_129789 ?auto_129793 ) ) ( not ( = ?auto_129789 ?auto_129794 ) ) ( not ( = ?auto_129789 ?auto_129795 ) ) ( not ( = ?auto_129789 ?auto_129796 ) ) ( not ( = ?auto_129790 ?auto_129791 ) ) ( not ( = ?auto_129790 ?auto_129792 ) ) ( not ( = ?auto_129790 ?auto_129793 ) ) ( not ( = ?auto_129790 ?auto_129794 ) ) ( not ( = ?auto_129790 ?auto_129795 ) ) ( not ( = ?auto_129790 ?auto_129796 ) ) ( not ( = ?auto_129791 ?auto_129792 ) ) ( not ( = ?auto_129791 ?auto_129793 ) ) ( not ( = ?auto_129791 ?auto_129794 ) ) ( not ( = ?auto_129791 ?auto_129795 ) ) ( not ( = ?auto_129791 ?auto_129796 ) ) ( not ( = ?auto_129792 ?auto_129793 ) ) ( not ( = ?auto_129792 ?auto_129794 ) ) ( not ( = ?auto_129792 ?auto_129795 ) ) ( not ( = ?auto_129792 ?auto_129796 ) ) ( not ( = ?auto_129793 ?auto_129794 ) ) ( not ( = ?auto_129793 ?auto_129795 ) ) ( not ( = ?auto_129793 ?auto_129796 ) ) ( not ( = ?auto_129794 ?auto_129795 ) ) ( not ( = ?auto_129794 ?auto_129796 ) ) ( not ( = ?auto_129795 ?auto_129796 ) ) ( ON ?auto_129794 ?auto_129795 ) ( ON ?auto_129793 ?auto_129794 ) ( CLEAR ?auto_129791 ) ( ON ?auto_129792 ?auto_129793 ) ( CLEAR ?auto_129792 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_129786 ?auto_129787 ?auto_129788 ?auto_129789 ?auto_129790 ?auto_129791 ?auto_129792 )
      ( MAKE-10PILE ?auto_129786 ?auto_129787 ?auto_129788 ?auto_129789 ?auto_129790 ?auto_129791 ?auto_129792 ?auto_129793 ?auto_129794 ?auto_129795 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_129828 - BLOCK
      ?auto_129829 - BLOCK
      ?auto_129830 - BLOCK
      ?auto_129831 - BLOCK
      ?auto_129832 - BLOCK
      ?auto_129833 - BLOCK
      ?auto_129834 - BLOCK
      ?auto_129835 - BLOCK
      ?auto_129836 - BLOCK
      ?auto_129837 - BLOCK
    )
    :vars
    (
      ?auto_129838 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_129837 ?auto_129838 ) ( ON-TABLE ?auto_129828 ) ( ON ?auto_129829 ?auto_129828 ) ( ON ?auto_129830 ?auto_129829 ) ( ON ?auto_129831 ?auto_129830 ) ( ON ?auto_129832 ?auto_129831 ) ( not ( = ?auto_129828 ?auto_129829 ) ) ( not ( = ?auto_129828 ?auto_129830 ) ) ( not ( = ?auto_129828 ?auto_129831 ) ) ( not ( = ?auto_129828 ?auto_129832 ) ) ( not ( = ?auto_129828 ?auto_129833 ) ) ( not ( = ?auto_129828 ?auto_129834 ) ) ( not ( = ?auto_129828 ?auto_129835 ) ) ( not ( = ?auto_129828 ?auto_129836 ) ) ( not ( = ?auto_129828 ?auto_129837 ) ) ( not ( = ?auto_129828 ?auto_129838 ) ) ( not ( = ?auto_129829 ?auto_129830 ) ) ( not ( = ?auto_129829 ?auto_129831 ) ) ( not ( = ?auto_129829 ?auto_129832 ) ) ( not ( = ?auto_129829 ?auto_129833 ) ) ( not ( = ?auto_129829 ?auto_129834 ) ) ( not ( = ?auto_129829 ?auto_129835 ) ) ( not ( = ?auto_129829 ?auto_129836 ) ) ( not ( = ?auto_129829 ?auto_129837 ) ) ( not ( = ?auto_129829 ?auto_129838 ) ) ( not ( = ?auto_129830 ?auto_129831 ) ) ( not ( = ?auto_129830 ?auto_129832 ) ) ( not ( = ?auto_129830 ?auto_129833 ) ) ( not ( = ?auto_129830 ?auto_129834 ) ) ( not ( = ?auto_129830 ?auto_129835 ) ) ( not ( = ?auto_129830 ?auto_129836 ) ) ( not ( = ?auto_129830 ?auto_129837 ) ) ( not ( = ?auto_129830 ?auto_129838 ) ) ( not ( = ?auto_129831 ?auto_129832 ) ) ( not ( = ?auto_129831 ?auto_129833 ) ) ( not ( = ?auto_129831 ?auto_129834 ) ) ( not ( = ?auto_129831 ?auto_129835 ) ) ( not ( = ?auto_129831 ?auto_129836 ) ) ( not ( = ?auto_129831 ?auto_129837 ) ) ( not ( = ?auto_129831 ?auto_129838 ) ) ( not ( = ?auto_129832 ?auto_129833 ) ) ( not ( = ?auto_129832 ?auto_129834 ) ) ( not ( = ?auto_129832 ?auto_129835 ) ) ( not ( = ?auto_129832 ?auto_129836 ) ) ( not ( = ?auto_129832 ?auto_129837 ) ) ( not ( = ?auto_129832 ?auto_129838 ) ) ( not ( = ?auto_129833 ?auto_129834 ) ) ( not ( = ?auto_129833 ?auto_129835 ) ) ( not ( = ?auto_129833 ?auto_129836 ) ) ( not ( = ?auto_129833 ?auto_129837 ) ) ( not ( = ?auto_129833 ?auto_129838 ) ) ( not ( = ?auto_129834 ?auto_129835 ) ) ( not ( = ?auto_129834 ?auto_129836 ) ) ( not ( = ?auto_129834 ?auto_129837 ) ) ( not ( = ?auto_129834 ?auto_129838 ) ) ( not ( = ?auto_129835 ?auto_129836 ) ) ( not ( = ?auto_129835 ?auto_129837 ) ) ( not ( = ?auto_129835 ?auto_129838 ) ) ( not ( = ?auto_129836 ?auto_129837 ) ) ( not ( = ?auto_129836 ?auto_129838 ) ) ( not ( = ?auto_129837 ?auto_129838 ) ) ( ON ?auto_129836 ?auto_129837 ) ( ON ?auto_129835 ?auto_129836 ) ( ON ?auto_129834 ?auto_129835 ) ( CLEAR ?auto_129832 ) ( ON ?auto_129833 ?auto_129834 ) ( CLEAR ?auto_129833 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_129828 ?auto_129829 ?auto_129830 ?auto_129831 ?auto_129832 ?auto_129833 )
      ( MAKE-10PILE ?auto_129828 ?auto_129829 ?auto_129830 ?auto_129831 ?auto_129832 ?auto_129833 ?auto_129834 ?auto_129835 ?auto_129836 ?auto_129837 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_129870 - BLOCK
      ?auto_129871 - BLOCK
      ?auto_129872 - BLOCK
      ?auto_129873 - BLOCK
      ?auto_129874 - BLOCK
      ?auto_129875 - BLOCK
      ?auto_129876 - BLOCK
      ?auto_129877 - BLOCK
      ?auto_129878 - BLOCK
      ?auto_129879 - BLOCK
    )
    :vars
    (
      ?auto_129880 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_129879 ?auto_129880 ) ( ON-TABLE ?auto_129870 ) ( ON ?auto_129871 ?auto_129870 ) ( ON ?auto_129872 ?auto_129871 ) ( ON ?auto_129873 ?auto_129872 ) ( not ( = ?auto_129870 ?auto_129871 ) ) ( not ( = ?auto_129870 ?auto_129872 ) ) ( not ( = ?auto_129870 ?auto_129873 ) ) ( not ( = ?auto_129870 ?auto_129874 ) ) ( not ( = ?auto_129870 ?auto_129875 ) ) ( not ( = ?auto_129870 ?auto_129876 ) ) ( not ( = ?auto_129870 ?auto_129877 ) ) ( not ( = ?auto_129870 ?auto_129878 ) ) ( not ( = ?auto_129870 ?auto_129879 ) ) ( not ( = ?auto_129870 ?auto_129880 ) ) ( not ( = ?auto_129871 ?auto_129872 ) ) ( not ( = ?auto_129871 ?auto_129873 ) ) ( not ( = ?auto_129871 ?auto_129874 ) ) ( not ( = ?auto_129871 ?auto_129875 ) ) ( not ( = ?auto_129871 ?auto_129876 ) ) ( not ( = ?auto_129871 ?auto_129877 ) ) ( not ( = ?auto_129871 ?auto_129878 ) ) ( not ( = ?auto_129871 ?auto_129879 ) ) ( not ( = ?auto_129871 ?auto_129880 ) ) ( not ( = ?auto_129872 ?auto_129873 ) ) ( not ( = ?auto_129872 ?auto_129874 ) ) ( not ( = ?auto_129872 ?auto_129875 ) ) ( not ( = ?auto_129872 ?auto_129876 ) ) ( not ( = ?auto_129872 ?auto_129877 ) ) ( not ( = ?auto_129872 ?auto_129878 ) ) ( not ( = ?auto_129872 ?auto_129879 ) ) ( not ( = ?auto_129872 ?auto_129880 ) ) ( not ( = ?auto_129873 ?auto_129874 ) ) ( not ( = ?auto_129873 ?auto_129875 ) ) ( not ( = ?auto_129873 ?auto_129876 ) ) ( not ( = ?auto_129873 ?auto_129877 ) ) ( not ( = ?auto_129873 ?auto_129878 ) ) ( not ( = ?auto_129873 ?auto_129879 ) ) ( not ( = ?auto_129873 ?auto_129880 ) ) ( not ( = ?auto_129874 ?auto_129875 ) ) ( not ( = ?auto_129874 ?auto_129876 ) ) ( not ( = ?auto_129874 ?auto_129877 ) ) ( not ( = ?auto_129874 ?auto_129878 ) ) ( not ( = ?auto_129874 ?auto_129879 ) ) ( not ( = ?auto_129874 ?auto_129880 ) ) ( not ( = ?auto_129875 ?auto_129876 ) ) ( not ( = ?auto_129875 ?auto_129877 ) ) ( not ( = ?auto_129875 ?auto_129878 ) ) ( not ( = ?auto_129875 ?auto_129879 ) ) ( not ( = ?auto_129875 ?auto_129880 ) ) ( not ( = ?auto_129876 ?auto_129877 ) ) ( not ( = ?auto_129876 ?auto_129878 ) ) ( not ( = ?auto_129876 ?auto_129879 ) ) ( not ( = ?auto_129876 ?auto_129880 ) ) ( not ( = ?auto_129877 ?auto_129878 ) ) ( not ( = ?auto_129877 ?auto_129879 ) ) ( not ( = ?auto_129877 ?auto_129880 ) ) ( not ( = ?auto_129878 ?auto_129879 ) ) ( not ( = ?auto_129878 ?auto_129880 ) ) ( not ( = ?auto_129879 ?auto_129880 ) ) ( ON ?auto_129878 ?auto_129879 ) ( ON ?auto_129877 ?auto_129878 ) ( ON ?auto_129876 ?auto_129877 ) ( ON ?auto_129875 ?auto_129876 ) ( CLEAR ?auto_129873 ) ( ON ?auto_129874 ?auto_129875 ) ( CLEAR ?auto_129874 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_129870 ?auto_129871 ?auto_129872 ?auto_129873 ?auto_129874 )
      ( MAKE-10PILE ?auto_129870 ?auto_129871 ?auto_129872 ?auto_129873 ?auto_129874 ?auto_129875 ?auto_129876 ?auto_129877 ?auto_129878 ?auto_129879 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_129912 - BLOCK
      ?auto_129913 - BLOCK
      ?auto_129914 - BLOCK
      ?auto_129915 - BLOCK
      ?auto_129916 - BLOCK
      ?auto_129917 - BLOCK
      ?auto_129918 - BLOCK
      ?auto_129919 - BLOCK
      ?auto_129920 - BLOCK
      ?auto_129921 - BLOCK
    )
    :vars
    (
      ?auto_129922 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_129921 ?auto_129922 ) ( ON-TABLE ?auto_129912 ) ( ON ?auto_129913 ?auto_129912 ) ( ON ?auto_129914 ?auto_129913 ) ( not ( = ?auto_129912 ?auto_129913 ) ) ( not ( = ?auto_129912 ?auto_129914 ) ) ( not ( = ?auto_129912 ?auto_129915 ) ) ( not ( = ?auto_129912 ?auto_129916 ) ) ( not ( = ?auto_129912 ?auto_129917 ) ) ( not ( = ?auto_129912 ?auto_129918 ) ) ( not ( = ?auto_129912 ?auto_129919 ) ) ( not ( = ?auto_129912 ?auto_129920 ) ) ( not ( = ?auto_129912 ?auto_129921 ) ) ( not ( = ?auto_129912 ?auto_129922 ) ) ( not ( = ?auto_129913 ?auto_129914 ) ) ( not ( = ?auto_129913 ?auto_129915 ) ) ( not ( = ?auto_129913 ?auto_129916 ) ) ( not ( = ?auto_129913 ?auto_129917 ) ) ( not ( = ?auto_129913 ?auto_129918 ) ) ( not ( = ?auto_129913 ?auto_129919 ) ) ( not ( = ?auto_129913 ?auto_129920 ) ) ( not ( = ?auto_129913 ?auto_129921 ) ) ( not ( = ?auto_129913 ?auto_129922 ) ) ( not ( = ?auto_129914 ?auto_129915 ) ) ( not ( = ?auto_129914 ?auto_129916 ) ) ( not ( = ?auto_129914 ?auto_129917 ) ) ( not ( = ?auto_129914 ?auto_129918 ) ) ( not ( = ?auto_129914 ?auto_129919 ) ) ( not ( = ?auto_129914 ?auto_129920 ) ) ( not ( = ?auto_129914 ?auto_129921 ) ) ( not ( = ?auto_129914 ?auto_129922 ) ) ( not ( = ?auto_129915 ?auto_129916 ) ) ( not ( = ?auto_129915 ?auto_129917 ) ) ( not ( = ?auto_129915 ?auto_129918 ) ) ( not ( = ?auto_129915 ?auto_129919 ) ) ( not ( = ?auto_129915 ?auto_129920 ) ) ( not ( = ?auto_129915 ?auto_129921 ) ) ( not ( = ?auto_129915 ?auto_129922 ) ) ( not ( = ?auto_129916 ?auto_129917 ) ) ( not ( = ?auto_129916 ?auto_129918 ) ) ( not ( = ?auto_129916 ?auto_129919 ) ) ( not ( = ?auto_129916 ?auto_129920 ) ) ( not ( = ?auto_129916 ?auto_129921 ) ) ( not ( = ?auto_129916 ?auto_129922 ) ) ( not ( = ?auto_129917 ?auto_129918 ) ) ( not ( = ?auto_129917 ?auto_129919 ) ) ( not ( = ?auto_129917 ?auto_129920 ) ) ( not ( = ?auto_129917 ?auto_129921 ) ) ( not ( = ?auto_129917 ?auto_129922 ) ) ( not ( = ?auto_129918 ?auto_129919 ) ) ( not ( = ?auto_129918 ?auto_129920 ) ) ( not ( = ?auto_129918 ?auto_129921 ) ) ( not ( = ?auto_129918 ?auto_129922 ) ) ( not ( = ?auto_129919 ?auto_129920 ) ) ( not ( = ?auto_129919 ?auto_129921 ) ) ( not ( = ?auto_129919 ?auto_129922 ) ) ( not ( = ?auto_129920 ?auto_129921 ) ) ( not ( = ?auto_129920 ?auto_129922 ) ) ( not ( = ?auto_129921 ?auto_129922 ) ) ( ON ?auto_129920 ?auto_129921 ) ( ON ?auto_129919 ?auto_129920 ) ( ON ?auto_129918 ?auto_129919 ) ( ON ?auto_129917 ?auto_129918 ) ( ON ?auto_129916 ?auto_129917 ) ( CLEAR ?auto_129914 ) ( ON ?auto_129915 ?auto_129916 ) ( CLEAR ?auto_129915 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_129912 ?auto_129913 ?auto_129914 ?auto_129915 )
      ( MAKE-10PILE ?auto_129912 ?auto_129913 ?auto_129914 ?auto_129915 ?auto_129916 ?auto_129917 ?auto_129918 ?auto_129919 ?auto_129920 ?auto_129921 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_129954 - BLOCK
      ?auto_129955 - BLOCK
      ?auto_129956 - BLOCK
      ?auto_129957 - BLOCK
      ?auto_129958 - BLOCK
      ?auto_129959 - BLOCK
      ?auto_129960 - BLOCK
      ?auto_129961 - BLOCK
      ?auto_129962 - BLOCK
      ?auto_129963 - BLOCK
    )
    :vars
    (
      ?auto_129964 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_129963 ?auto_129964 ) ( ON-TABLE ?auto_129954 ) ( ON ?auto_129955 ?auto_129954 ) ( not ( = ?auto_129954 ?auto_129955 ) ) ( not ( = ?auto_129954 ?auto_129956 ) ) ( not ( = ?auto_129954 ?auto_129957 ) ) ( not ( = ?auto_129954 ?auto_129958 ) ) ( not ( = ?auto_129954 ?auto_129959 ) ) ( not ( = ?auto_129954 ?auto_129960 ) ) ( not ( = ?auto_129954 ?auto_129961 ) ) ( not ( = ?auto_129954 ?auto_129962 ) ) ( not ( = ?auto_129954 ?auto_129963 ) ) ( not ( = ?auto_129954 ?auto_129964 ) ) ( not ( = ?auto_129955 ?auto_129956 ) ) ( not ( = ?auto_129955 ?auto_129957 ) ) ( not ( = ?auto_129955 ?auto_129958 ) ) ( not ( = ?auto_129955 ?auto_129959 ) ) ( not ( = ?auto_129955 ?auto_129960 ) ) ( not ( = ?auto_129955 ?auto_129961 ) ) ( not ( = ?auto_129955 ?auto_129962 ) ) ( not ( = ?auto_129955 ?auto_129963 ) ) ( not ( = ?auto_129955 ?auto_129964 ) ) ( not ( = ?auto_129956 ?auto_129957 ) ) ( not ( = ?auto_129956 ?auto_129958 ) ) ( not ( = ?auto_129956 ?auto_129959 ) ) ( not ( = ?auto_129956 ?auto_129960 ) ) ( not ( = ?auto_129956 ?auto_129961 ) ) ( not ( = ?auto_129956 ?auto_129962 ) ) ( not ( = ?auto_129956 ?auto_129963 ) ) ( not ( = ?auto_129956 ?auto_129964 ) ) ( not ( = ?auto_129957 ?auto_129958 ) ) ( not ( = ?auto_129957 ?auto_129959 ) ) ( not ( = ?auto_129957 ?auto_129960 ) ) ( not ( = ?auto_129957 ?auto_129961 ) ) ( not ( = ?auto_129957 ?auto_129962 ) ) ( not ( = ?auto_129957 ?auto_129963 ) ) ( not ( = ?auto_129957 ?auto_129964 ) ) ( not ( = ?auto_129958 ?auto_129959 ) ) ( not ( = ?auto_129958 ?auto_129960 ) ) ( not ( = ?auto_129958 ?auto_129961 ) ) ( not ( = ?auto_129958 ?auto_129962 ) ) ( not ( = ?auto_129958 ?auto_129963 ) ) ( not ( = ?auto_129958 ?auto_129964 ) ) ( not ( = ?auto_129959 ?auto_129960 ) ) ( not ( = ?auto_129959 ?auto_129961 ) ) ( not ( = ?auto_129959 ?auto_129962 ) ) ( not ( = ?auto_129959 ?auto_129963 ) ) ( not ( = ?auto_129959 ?auto_129964 ) ) ( not ( = ?auto_129960 ?auto_129961 ) ) ( not ( = ?auto_129960 ?auto_129962 ) ) ( not ( = ?auto_129960 ?auto_129963 ) ) ( not ( = ?auto_129960 ?auto_129964 ) ) ( not ( = ?auto_129961 ?auto_129962 ) ) ( not ( = ?auto_129961 ?auto_129963 ) ) ( not ( = ?auto_129961 ?auto_129964 ) ) ( not ( = ?auto_129962 ?auto_129963 ) ) ( not ( = ?auto_129962 ?auto_129964 ) ) ( not ( = ?auto_129963 ?auto_129964 ) ) ( ON ?auto_129962 ?auto_129963 ) ( ON ?auto_129961 ?auto_129962 ) ( ON ?auto_129960 ?auto_129961 ) ( ON ?auto_129959 ?auto_129960 ) ( ON ?auto_129958 ?auto_129959 ) ( ON ?auto_129957 ?auto_129958 ) ( CLEAR ?auto_129955 ) ( ON ?auto_129956 ?auto_129957 ) ( CLEAR ?auto_129956 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_129954 ?auto_129955 ?auto_129956 )
      ( MAKE-10PILE ?auto_129954 ?auto_129955 ?auto_129956 ?auto_129957 ?auto_129958 ?auto_129959 ?auto_129960 ?auto_129961 ?auto_129962 ?auto_129963 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_129996 - BLOCK
      ?auto_129997 - BLOCK
      ?auto_129998 - BLOCK
      ?auto_129999 - BLOCK
      ?auto_130000 - BLOCK
      ?auto_130001 - BLOCK
      ?auto_130002 - BLOCK
      ?auto_130003 - BLOCK
      ?auto_130004 - BLOCK
      ?auto_130005 - BLOCK
    )
    :vars
    (
      ?auto_130006 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_130005 ?auto_130006 ) ( ON-TABLE ?auto_129996 ) ( not ( = ?auto_129996 ?auto_129997 ) ) ( not ( = ?auto_129996 ?auto_129998 ) ) ( not ( = ?auto_129996 ?auto_129999 ) ) ( not ( = ?auto_129996 ?auto_130000 ) ) ( not ( = ?auto_129996 ?auto_130001 ) ) ( not ( = ?auto_129996 ?auto_130002 ) ) ( not ( = ?auto_129996 ?auto_130003 ) ) ( not ( = ?auto_129996 ?auto_130004 ) ) ( not ( = ?auto_129996 ?auto_130005 ) ) ( not ( = ?auto_129996 ?auto_130006 ) ) ( not ( = ?auto_129997 ?auto_129998 ) ) ( not ( = ?auto_129997 ?auto_129999 ) ) ( not ( = ?auto_129997 ?auto_130000 ) ) ( not ( = ?auto_129997 ?auto_130001 ) ) ( not ( = ?auto_129997 ?auto_130002 ) ) ( not ( = ?auto_129997 ?auto_130003 ) ) ( not ( = ?auto_129997 ?auto_130004 ) ) ( not ( = ?auto_129997 ?auto_130005 ) ) ( not ( = ?auto_129997 ?auto_130006 ) ) ( not ( = ?auto_129998 ?auto_129999 ) ) ( not ( = ?auto_129998 ?auto_130000 ) ) ( not ( = ?auto_129998 ?auto_130001 ) ) ( not ( = ?auto_129998 ?auto_130002 ) ) ( not ( = ?auto_129998 ?auto_130003 ) ) ( not ( = ?auto_129998 ?auto_130004 ) ) ( not ( = ?auto_129998 ?auto_130005 ) ) ( not ( = ?auto_129998 ?auto_130006 ) ) ( not ( = ?auto_129999 ?auto_130000 ) ) ( not ( = ?auto_129999 ?auto_130001 ) ) ( not ( = ?auto_129999 ?auto_130002 ) ) ( not ( = ?auto_129999 ?auto_130003 ) ) ( not ( = ?auto_129999 ?auto_130004 ) ) ( not ( = ?auto_129999 ?auto_130005 ) ) ( not ( = ?auto_129999 ?auto_130006 ) ) ( not ( = ?auto_130000 ?auto_130001 ) ) ( not ( = ?auto_130000 ?auto_130002 ) ) ( not ( = ?auto_130000 ?auto_130003 ) ) ( not ( = ?auto_130000 ?auto_130004 ) ) ( not ( = ?auto_130000 ?auto_130005 ) ) ( not ( = ?auto_130000 ?auto_130006 ) ) ( not ( = ?auto_130001 ?auto_130002 ) ) ( not ( = ?auto_130001 ?auto_130003 ) ) ( not ( = ?auto_130001 ?auto_130004 ) ) ( not ( = ?auto_130001 ?auto_130005 ) ) ( not ( = ?auto_130001 ?auto_130006 ) ) ( not ( = ?auto_130002 ?auto_130003 ) ) ( not ( = ?auto_130002 ?auto_130004 ) ) ( not ( = ?auto_130002 ?auto_130005 ) ) ( not ( = ?auto_130002 ?auto_130006 ) ) ( not ( = ?auto_130003 ?auto_130004 ) ) ( not ( = ?auto_130003 ?auto_130005 ) ) ( not ( = ?auto_130003 ?auto_130006 ) ) ( not ( = ?auto_130004 ?auto_130005 ) ) ( not ( = ?auto_130004 ?auto_130006 ) ) ( not ( = ?auto_130005 ?auto_130006 ) ) ( ON ?auto_130004 ?auto_130005 ) ( ON ?auto_130003 ?auto_130004 ) ( ON ?auto_130002 ?auto_130003 ) ( ON ?auto_130001 ?auto_130002 ) ( ON ?auto_130000 ?auto_130001 ) ( ON ?auto_129999 ?auto_130000 ) ( ON ?auto_129998 ?auto_129999 ) ( CLEAR ?auto_129996 ) ( ON ?auto_129997 ?auto_129998 ) ( CLEAR ?auto_129997 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_129996 ?auto_129997 )
      ( MAKE-10PILE ?auto_129996 ?auto_129997 ?auto_129998 ?auto_129999 ?auto_130000 ?auto_130001 ?auto_130002 ?auto_130003 ?auto_130004 ?auto_130005 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_130038 - BLOCK
      ?auto_130039 - BLOCK
      ?auto_130040 - BLOCK
      ?auto_130041 - BLOCK
      ?auto_130042 - BLOCK
      ?auto_130043 - BLOCK
      ?auto_130044 - BLOCK
      ?auto_130045 - BLOCK
      ?auto_130046 - BLOCK
      ?auto_130047 - BLOCK
    )
    :vars
    (
      ?auto_130048 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_130047 ?auto_130048 ) ( not ( = ?auto_130038 ?auto_130039 ) ) ( not ( = ?auto_130038 ?auto_130040 ) ) ( not ( = ?auto_130038 ?auto_130041 ) ) ( not ( = ?auto_130038 ?auto_130042 ) ) ( not ( = ?auto_130038 ?auto_130043 ) ) ( not ( = ?auto_130038 ?auto_130044 ) ) ( not ( = ?auto_130038 ?auto_130045 ) ) ( not ( = ?auto_130038 ?auto_130046 ) ) ( not ( = ?auto_130038 ?auto_130047 ) ) ( not ( = ?auto_130038 ?auto_130048 ) ) ( not ( = ?auto_130039 ?auto_130040 ) ) ( not ( = ?auto_130039 ?auto_130041 ) ) ( not ( = ?auto_130039 ?auto_130042 ) ) ( not ( = ?auto_130039 ?auto_130043 ) ) ( not ( = ?auto_130039 ?auto_130044 ) ) ( not ( = ?auto_130039 ?auto_130045 ) ) ( not ( = ?auto_130039 ?auto_130046 ) ) ( not ( = ?auto_130039 ?auto_130047 ) ) ( not ( = ?auto_130039 ?auto_130048 ) ) ( not ( = ?auto_130040 ?auto_130041 ) ) ( not ( = ?auto_130040 ?auto_130042 ) ) ( not ( = ?auto_130040 ?auto_130043 ) ) ( not ( = ?auto_130040 ?auto_130044 ) ) ( not ( = ?auto_130040 ?auto_130045 ) ) ( not ( = ?auto_130040 ?auto_130046 ) ) ( not ( = ?auto_130040 ?auto_130047 ) ) ( not ( = ?auto_130040 ?auto_130048 ) ) ( not ( = ?auto_130041 ?auto_130042 ) ) ( not ( = ?auto_130041 ?auto_130043 ) ) ( not ( = ?auto_130041 ?auto_130044 ) ) ( not ( = ?auto_130041 ?auto_130045 ) ) ( not ( = ?auto_130041 ?auto_130046 ) ) ( not ( = ?auto_130041 ?auto_130047 ) ) ( not ( = ?auto_130041 ?auto_130048 ) ) ( not ( = ?auto_130042 ?auto_130043 ) ) ( not ( = ?auto_130042 ?auto_130044 ) ) ( not ( = ?auto_130042 ?auto_130045 ) ) ( not ( = ?auto_130042 ?auto_130046 ) ) ( not ( = ?auto_130042 ?auto_130047 ) ) ( not ( = ?auto_130042 ?auto_130048 ) ) ( not ( = ?auto_130043 ?auto_130044 ) ) ( not ( = ?auto_130043 ?auto_130045 ) ) ( not ( = ?auto_130043 ?auto_130046 ) ) ( not ( = ?auto_130043 ?auto_130047 ) ) ( not ( = ?auto_130043 ?auto_130048 ) ) ( not ( = ?auto_130044 ?auto_130045 ) ) ( not ( = ?auto_130044 ?auto_130046 ) ) ( not ( = ?auto_130044 ?auto_130047 ) ) ( not ( = ?auto_130044 ?auto_130048 ) ) ( not ( = ?auto_130045 ?auto_130046 ) ) ( not ( = ?auto_130045 ?auto_130047 ) ) ( not ( = ?auto_130045 ?auto_130048 ) ) ( not ( = ?auto_130046 ?auto_130047 ) ) ( not ( = ?auto_130046 ?auto_130048 ) ) ( not ( = ?auto_130047 ?auto_130048 ) ) ( ON ?auto_130046 ?auto_130047 ) ( ON ?auto_130045 ?auto_130046 ) ( ON ?auto_130044 ?auto_130045 ) ( ON ?auto_130043 ?auto_130044 ) ( ON ?auto_130042 ?auto_130043 ) ( ON ?auto_130041 ?auto_130042 ) ( ON ?auto_130040 ?auto_130041 ) ( ON ?auto_130039 ?auto_130040 ) ( ON ?auto_130038 ?auto_130039 ) ( CLEAR ?auto_130038 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_130038 )
      ( MAKE-10PILE ?auto_130038 ?auto_130039 ?auto_130040 ?auto_130041 ?auto_130042 ?auto_130043 ?auto_130044 ?auto_130045 ?auto_130046 ?auto_130047 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_130081 - BLOCK
      ?auto_130082 - BLOCK
      ?auto_130083 - BLOCK
      ?auto_130084 - BLOCK
      ?auto_130085 - BLOCK
      ?auto_130086 - BLOCK
      ?auto_130087 - BLOCK
      ?auto_130088 - BLOCK
      ?auto_130089 - BLOCK
      ?auto_130090 - BLOCK
      ?auto_130091 - BLOCK
    )
    :vars
    (
      ?auto_130092 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_130090 ) ( ON ?auto_130091 ?auto_130092 ) ( CLEAR ?auto_130091 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_130081 ) ( ON ?auto_130082 ?auto_130081 ) ( ON ?auto_130083 ?auto_130082 ) ( ON ?auto_130084 ?auto_130083 ) ( ON ?auto_130085 ?auto_130084 ) ( ON ?auto_130086 ?auto_130085 ) ( ON ?auto_130087 ?auto_130086 ) ( ON ?auto_130088 ?auto_130087 ) ( ON ?auto_130089 ?auto_130088 ) ( ON ?auto_130090 ?auto_130089 ) ( not ( = ?auto_130081 ?auto_130082 ) ) ( not ( = ?auto_130081 ?auto_130083 ) ) ( not ( = ?auto_130081 ?auto_130084 ) ) ( not ( = ?auto_130081 ?auto_130085 ) ) ( not ( = ?auto_130081 ?auto_130086 ) ) ( not ( = ?auto_130081 ?auto_130087 ) ) ( not ( = ?auto_130081 ?auto_130088 ) ) ( not ( = ?auto_130081 ?auto_130089 ) ) ( not ( = ?auto_130081 ?auto_130090 ) ) ( not ( = ?auto_130081 ?auto_130091 ) ) ( not ( = ?auto_130081 ?auto_130092 ) ) ( not ( = ?auto_130082 ?auto_130083 ) ) ( not ( = ?auto_130082 ?auto_130084 ) ) ( not ( = ?auto_130082 ?auto_130085 ) ) ( not ( = ?auto_130082 ?auto_130086 ) ) ( not ( = ?auto_130082 ?auto_130087 ) ) ( not ( = ?auto_130082 ?auto_130088 ) ) ( not ( = ?auto_130082 ?auto_130089 ) ) ( not ( = ?auto_130082 ?auto_130090 ) ) ( not ( = ?auto_130082 ?auto_130091 ) ) ( not ( = ?auto_130082 ?auto_130092 ) ) ( not ( = ?auto_130083 ?auto_130084 ) ) ( not ( = ?auto_130083 ?auto_130085 ) ) ( not ( = ?auto_130083 ?auto_130086 ) ) ( not ( = ?auto_130083 ?auto_130087 ) ) ( not ( = ?auto_130083 ?auto_130088 ) ) ( not ( = ?auto_130083 ?auto_130089 ) ) ( not ( = ?auto_130083 ?auto_130090 ) ) ( not ( = ?auto_130083 ?auto_130091 ) ) ( not ( = ?auto_130083 ?auto_130092 ) ) ( not ( = ?auto_130084 ?auto_130085 ) ) ( not ( = ?auto_130084 ?auto_130086 ) ) ( not ( = ?auto_130084 ?auto_130087 ) ) ( not ( = ?auto_130084 ?auto_130088 ) ) ( not ( = ?auto_130084 ?auto_130089 ) ) ( not ( = ?auto_130084 ?auto_130090 ) ) ( not ( = ?auto_130084 ?auto_130091 ) ) ( not ( = ?auto_130084 ?auto_130092 ) ) ( not ( = ?auto_130085 ?auto_130086 ) ) ( not ( = ?auto_130085 ?auto_130087 ) ) ( not ( = ?auto_130085 ?auto_130088 ) ) ( not ( = ?auto_130085 ?auto_130089 ) ) ( not ( = ?auto_130085 ?auto_130090 ) ) ( not ( = ?auto_130085 ?auto_130091 ) ) ( not ( = ?auto_130085 ?auto_130092 ) ) ( not ( = ?auto_130086 ?auto_130087 ) ) ( not ( = ?auto_130086 ?auto_130088 ) ) ( not ( = ?auto_130086 ?auto_130089 ) ) ( not ( = ?auto_130086 ?auto_130090 ) ) ( not ( = ?auto_130086 ?auto_130091 ) ) ( not ( = ?auto_130086 ?auto_130092 ) ) ( not ( = ?auto_130087 ?auto_130088 ) ) ( not ( = ?auto_130087 ?auto_130089 ) ) ( not ( = ?auto_130087 ?auto_130090 ) ) ( not ( = ?auto_130087 ?auto_130091 ) ) ( not ( = ?auto_130087 ?auto_130092 ) ) ( not ( = ?auto_130088 ?auto_130089 ) ) ( not ( = ?auto_130088 ?auto_130090 ) ) ( not ( = ?auto_130088 ?auto_130091 ) ) ( not ( = ?auto_130088 ?auto_130092 ) ) ( not ( = ?auto_130089 ?auto_130090 ) ) ( not ( = ?auto_130089 ?auto_130091 ) ) ( not ( = ?auto_130089 ?auto_130092 ) ) ( not ( = ?auto_130090 ?auto_130091 ) ) ( not ( = ?auto_130090 ?auto_130092 ) ) ( not ( = ?auto_130091 ?auto_130092 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_130091 ?auto_130092 )
      ( !STACK ?auto_130091 ?auto_130090 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_130104 - BLOCK
      ?auto_130105 - BLOCK
      ?auto_130106 - BLOCK
      ?auto_130107 - BLOCK
      ?auto_130108 - BLOCK
      ?auto_130109 - BLOCK
      ?auto_130110 - BLOCK
      ?auto_130111 - BLOCK
      ?auto_130112 - BLOCK
      ?auto_130113 - BLOCK
      ?auto_130114 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_130113 ) ( ON-TABLE ?auto_130114 ) ( CLEAR ?auto_130114 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_130104 ) ( ON ?auto_130105 ?auto_130104 ) ( ON ?auto_130106 ?auto_130105 ) ( ON ?auto_130107 ?auto_130106 ) ( ON ?auto_130108 ?auto_130107 ) ( ON ?auto_130109 ?auto_130108 ) ( ON ?auto_130110 ?auto_130109 ) ( ON ?auto_130111 ?auto_130110 ) ( ON ?auto_130112 ?auto_130111 ) ( ON ?auto_130113 ?auto_130112 ) ( not ( = ?auto_130104 ?auto_130105 ) ) ( not ( = ?auto_130104 ?auto_130106 ) ) ( not ( = ?auto_130104 ?auto_130107 ) ) ( not ( = ?auto_130104 ?auto_130108 ) ) ( not ( = ?auto_130104 ?auto_130109 ) ) ( not ( = ?auto_130104 ?auto_130110 ) ) ( not ( = ?auto_130104 ?auto_130111 ) ) ( not ( = ?auto_130104 ?auto_130112 ) ) ( not ( = ?auto_130104 ?auto_130113 ) ) ( not ( = ?auto_130104 ?auto_130114 ) ) ( not ( = ?auto_130105 ?auto_130106 ) ) ( not ( = ?auto_130105 ?auto_130107 ) ) ( not ( = ?auto_130105 ?auto_130108 ) ) ( not ( = ?auto_130105 ?auto_130109 ) ) ( not ( = ?auto_130105 ?auto_130110 ) ) ( not ( = ?auto_130105 ?auto_130111 ) ) ( not ( = ?auto_130105 ?auto_130112 ) ) ( not ( = ?auto_130105 ?auto_130113 ) ) ( not ( = ?auto_130105 ?auto_130114 ) ) ( not ( = ?auto_130106 ?auto_130107 ) ) ( not ( = ?auto_130106 ?auto_130108 ) ) ( not ( = ?auto_130106 ?auto_130109 ) ) ( not ( = ?auto_130106 ?auto_130110 ) ) ( not ( = ?auto_130106 ?auto_130111 ) ) ( not ( = ?auto_130106 ?auto_130112 ) ) ( not ( = ?auto_130106 ?auto_130113 ) ) ( not ( = ?auto_130106 ?auto_130114 ) ) ( not ( = ?auto_130107 ?auto_130108 ) ) ( not ( = ?auto_130107 ?auto_130109 ) ) ( not ( = ?auto_130107 ?auto_130110 ) ) ( not ( = ?auto_130107 ?auto_130111 ) ) ( not ( = ?auto_130107 ?auto_130112 ) ) ( not ( = ?auto_130107 ?auto_130113 ) ) ( not ( = ?auto_130107 ?auto_130114 ) ) ( not ( = ?auto_130108 ?auto_130109 ) ) ( not ( = ?auto_130108 ?auto_130110 ) ) ( not ( = ?auto_130108 ?auto_130111 ) ) ( not ( = ?auto_130108 ?auto_130112 ) ) ( not ( = ?auto_130108 ?auto_130113 ) ) ( not ( = ?auto_130108 ?auto_130114 ) ) ( not ( = ?auto_130109 ?auto_130110 ) ) ( not ( = ?auto_130109 ?auto_130111 ) ) ( not ( = ?auto_130109 ?auto_130112 ) ) ( not ( = ?auto_130109 ?auto_130113 ) ) ( not ( = ?auto_130109 ?auto_130114 ) ) ( not ( = ?auto_130110 ?auto_130111 ) ) ( not ( = ?auto_130110 ?auto_130112 ) ) ( not ( = ?auto_130110 ?auto_130113 ) ) ( not ( = ?auto_130110 ?auto_130114 ) ) ( not ( = ?auto_130111 ?auto_130112 ) ) ( not ( = ?auto_130111 ?auto_130113 ) ) ( not ( = ?auto_130111 ?auto_130114 ) ) ( not ( = ?auto_130112 ?auto_130113 ) ) ( not ( = ?auto_130112 ?auto_130114 ) ) ( not ( = ?auto_130113 ?auto_130114 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_130114 )
      ( !STACK ?auto_130114 ?auto_130113 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_130126 - BLOCK
      ?auto_130127 - BLOCK
      ?auto_130128 - BLOCK
      ?auto_130129 - BLOCK
      ?auto_130130 - BLOCK
      ?auto_130131 - BLOCK
      ?auto_130132 - BLOCK
      ?auto_130133 - BLOCK
      ?auto_130134 - BLOCK
      ?auto_130135 - BLOCK
      ?auto_130136 - BLOCK
    )
    :vars
    (
      ?auto_130137 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_130136 ?auto_130137 ) ( ON-TABLE ?auto_130126 ) ( ON ?auto_130127 ?auto_130126 ) ( ON ?auto_130128 ?auto_130127 ) ( ON ?auto_130129 ?auto_130128 ) ( ON ?auto_130130 ?auto_130129 ) ( ON ?auto_130131 ?auto_130130 ) ( ON ?auto_130132 ?auto_130131 ) ( ON ?auto_130133 ?auto_130132 ) ( ON ?auto_130134 ?auto_130133 ) ( not ( = ?auto_130126 ?auto_130127 ) ) ( not ( = ?auto_130126 ?auto_130128 ) ) ( not ( = ?auto_130126 ?auto_130129 ) ) ( not ( = ?auto_130126 ?auto_130130 ) ) ( not ( = ?auto_130126 ?auto_130131 ) ) ( not ( = ?auto_130126 ?auto_130132 ) ) ( not ( = ?auto_130126 ?auto_130133 ) ) ( not ( = ?auto_130126 ?auto_130134 ) ) ( not ( = ?auto_130126 ?auto_130135 ) ) ( not ( = ?auto_130126 ?auto_130136 ) ) ( not ( = ?auto_130126 ?auto_130137 ) ) ( not ( = ?auto_130127 ?auto_130128 ) ) ( not ( = ?auto_130127 ?auto_130129 ) ) ( not ( = ?auto_130127 ?auto_130130 ) ) ( not ( = ?auto_130127 ?auto_130131 ) ) ( not ( = ?auto_130127 ?auto_130132 ) ) ( not ( = ?auto_130127 ?auto_130133 ) ) ( not ( = ?auto_130127 ?auto_130134 ) ) ( not ( = ?auto_130127 ?auto_130135 ) ) ( not ( = ?auto_130127 ?auto_130136 ) ) ( not ( = ?auto_130127 ?auto_130137 ) ) ( not ( = ?auto_130128 ?auto_130129 ) ) ( not ( = ?auto_130128 ?auto_130130 ) ) ( not ( = ?auto_130128 ?auto_130131 ) ) ( not ( = ?auto_130128 ?auto_130132 ) ) ( not ( = ?auto_130128 ?auto_130133 ) ) ( not ( = ?auto_130128 ?auto_130134 ) ) ( not ( = ?auto_130128 ?auto_130135 ) ) ( not ( = ?auto_130128 ?auto_130136 ) ) ( not ( = ?auto_130128 ?auto_130137 ) ) ( not ( = ?auto_130129 ?auto_130130 ) ) ( not ( = ?auto_130129 ?auto_130131 ) ) ( not ( = ?auto_130129 ?auto_130132 ) ) ( not ( = ?auto_130129 ?auto_130133 ) ) ( not ( = ?auto_130129 ?auto_130134 ) ) ( not ( = ?auto_130129 ?auto_130135 ) ) ( not ( = ?auto_130129 ?auto_130136 ) ) ( not ( = ?auto_130129 ?auto_130137 ) ) ( not ( = ?auto_130130 ?auto_130131 ) ) ( not ( = ?auto_130130 ?auto_130132 ) ) ( not ( = ?auto_130130 ?auto_130133 ) ) ( not ( = ?auto_130130 ?auto_130134 ) ) ( not ( = ?auto_130130 ?auto_130135 ) ) ( not ( = ?auto_130130 ?auto_130136 ) ) ( not ( = ?auto_130130 ?auto_130137 ) ) ( not ( = ?auto_130131 ?auto_130132 ) ) ( not ( = ?auto_130131 ?auto_130133 ) ) ( not ( = ?auto_130131 ?auto_130134 ) ) ( not ( = ?auto_130131 ?auto_130135 ) ) ( not ( = ?auto_130131 ?auto_130136 ) ) ( not ( = ?auto_130131 ?auto_130137 ) ) ( not ( = ?auto_130132 ?auto_130133 ) ) ( not ( = ?auto_130132 ?auto_130134 ) ) ( not ( = ?auto_130132 ?auto_130135 ) ) ( not ( = ?auto_130132 ?auto_130136 ) ) ( not ( = ?auto_130132 ?auto_130137 ) ) ( not ( = ?auto_130133 ?auto_130134 ) ) ( not ( = ?auto_130133 ?auto_130135 ) ) ( not ( = ?auto_130133 ?auto_130136 ) ) ( not ( = ?auto_130133 ?auto_130137 ) ) ( not ( = ?auto_130134 ?auto_130135 ) ) ( not ( = ?auto_130134 ?auto_130136 ) ) ( not ( = ?auto_130134 ?auto_130137 ) ) ( not ( = ?auto_130135 ?auto_130136 ) ) ( not ( = ?auto_130135 ?auto_130137 ) ) ( not ( = ?auto_130136 ?auto_130137 ) ) ( CLEAR ?auto_130134 ) ( ON ?auto_130135 ?auto_130136 ) ( CLEAR ?auto_130135 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_130126 ?auto_130127 ?auto_130128 ?auto_130129 ?auto_130130 ?auto_130131 ?auto_130132 ?auto_130133 ?auto_130134 ?auto_130135 )
      ( MAKE-11PILE ?auto_130126 ?auto_130127 ?auto_130128 ?auto_130129 ?auto_130130 ?auto_130131 ?auto_130132 ?auto_130133 ?auto_130134 ?auto_130135 ?auto_130136 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_130149 - BLOCK
      ?auto_130150 - BLOCK
      ?auto_130151 - BLOCK
      ?auto_130152 - BLOCK
      ?auto_130153 - BLOCK
      ?auto_130154 - BLOCK
      ?auto_130155 - BLOCK
      ?auto_130156 - BLOCK
      ?auto_130157 - BLOCK
      ?auto_130158 - BLOCK
      ?auto_130159 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_130159 ) ( ON-TABLE ?auto_130149 ) ( ON ?auto_130150 ?auto_130149 ) ( ON ?auto_130151 ?auto_130150 ) ( ON ?auto_130152 ?auto_130151 ) ( ON ?auto_130153 ?auto_130152 ) ( ON ?auto_130154 ?auto_130153 ) ( ON ?auto_130155 ?auto_130154 ) ( ON ?auto_130156 ?auto_130155 ) ( ON ?auto_130157 ?auto_130156 ) ( not ( = ?auto_130149 ?auto_130150 ) ) ( not ( = ?auto_130149 ?auto_130151 ) ) ( not ( = ?auto_130149 ?auto_130152 ) ) ( not ( = ?auto_130149 ?auto_130153 ) ) ( not ( = ?auto_130149 ?auto_130154 ) ) ( not ( = ?auto_130149 ?auto_130155 ) ) ( not ( = ?auto_130149 ?auto_130156 ) ) ( not ( = ?auto_130149 ?auto_130157 ) ) ( not ( = ?auto_130149 ?auto_130158 ) ) ( not ( = ?auto_130149 ?auto_130159 ) ) ( not ( = ?auto_130150 ?auto_130151 ) ) ( not ( = ?auto_130150 ?auto_130152 ) ) ( not ( = ?auto_130150 ?auto_130153 ) ) ( not ( = ?auto_130150 ?auto_130154 ) ) ( not ( = ?auto_130150 ?auto_130155 ) ) ( not ( = ?auto_130150 ?auto_130156 ) ) ( not ( = ?auto_130150 ?auto_130157 ) ) ( not ( = ?auto_130150 ?auto_130158 ) ) ( not ( = ?auto_130150 ?auto_130159 ) ) ( not ( = ?auto_130151 ?auto_130152 ) ) ( not ( = ?auto_130151 ?auto_130153 ) ) ( not ( = ?auto_130151 ?auto_130154 ) ) ( not ( = ?auto_130151 ?auto_130155 ) ) ( not ( = ?auto_130151 ?auto_130156 ) ) ( not ( = ?auto_130151 ?auto_130157 ) ) ( not ( = ?auto_130151 ?auto_130158 ) ) ( not ( = ?auto_130151 ?auto_130159 ) ) ( not ( = ?auto_130152 ?auto_130153 ) ) ( not ( = ?auto_130152 ?auto_130154 ) ) ( not ( = ?auto_130152 ?auto_130155 ) ) ( not ( = ?auto_130152 ?auto_130156 ) ) ( not ( = ?auto_130152 ?auto_130157 ) ) ( not ( = ?auto_130152 ?auto_130158 ) ) ( not ( = ?auto_130152 ?auto_130159 ) ) ( not ( = ?auto_130153 ?auto_130154 ) ) ( not ( = ?auto_130153 ?auto_130155 ) ) ( not ( = ?auto_130153 ?auto_130156 ) ) ( not ( = ?auto_130153 ?auto_130157 ) ) ( not ( = ?auto_130153 ?auto_130158 ) ) ( not ( = ?auto_130153 ?auto_130159 ) ) ( not ( = ?auto_130154 ?auto_130155 ) ) ( not ( = ?auto_130154 ?auto_130156 ) ) ( not ( = ?auto_130154 ?auto_130157 ) ) ( not ( = ?auto_130154 ?auto_130158 ) ) ( not ( = ?auto_130154 ?auto_130159 ) ) ( not ( = ?auto_130155 ?auto_130156 ) ) ( not ( = ?auto_130155 ?auto_130157 ) ) ( not ( = ?auto_130155 ?auto_130158 ) ) ( not ( = ?auto_130155 ?auto_130159 ) ) ( not ( = ?auto_130156 ?auto_130157 ) ) ( not ( = ?auto_130156 ?auto_130158 ) ) ( not ( = ?auto_130156 ?auto_130159 ) ) ( not ( = ?auto_130157 ?auto_130158 ) ) ( not ( = ?auto_130157 ?auto_130159 ) ) ( not ( = ?auto_130158 ?auto_130159 ) ) ( CLEAR ?auto_130157 ) ( ON ?auto_130158 ?auto_130159 ) ( CLEAR ?auto_130158 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_130149 ?auto_130150 ?auto_130151 ?auto_130152 ?auto_130153 ?auto_130154 ?auto_130155 ?auto_130156 ?auto_130157 ?auto_130158 )
      ( MAKE-11PILE ?auto_130149 ?auto_130150 ?auto_130151 ?auto_130152 ?auto_130153 ?auto_130154 ?auto_130155 ?auto_130156 ?auto_130157 ?auto_130158 ?auto_130159 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_130171 - BLOCK
      ?auto_130172 - BLOCK
      ?auto_130173 - BLOCK
      ?auto_130174 - BLOCK
      ?auto_130175 - BLOCK
      ?auto_130176 - BLOCK
      ?auto_130177 - BLOCK
      ?auto_130178 - BLOCK
      ?auto_130179 - BLOCK
      ?auto_130180 - BLOCK
      ?auto_130181 - BLOCK
    )
    :vars
    (
      ?auto_130182 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_130181 ?auto_130182 ) ( ON-TABLE ?auto_130171 ) ( ON ?auto_130172 ?auto_130171 ) ( ON ?auto_130173 ?auto_130172 ) ( ON ?auto_130174 ?auto_130173 ) ( ON ?auto_130175 ?auto_130174 ) ( ON ?auto_130176 ?auto_130175 ) ( ON ?auto_130177 ?auto_130176 ) ( ON ?auto_130178 ?auto_130177 ) ( not ( = ?auto_130171 ?auto_130172 ) ) ( not ( = ?auto_130171 ?auto_130173 ) ) ( not ( = ?auto_130171 ?auto_130174 ) ) ( not ( = ?auto_130171 ?auto_130175 ) ) ( not ( = ?auto_130171 ?auto_130176 ) ) ( not ( = ?auto_130171 ?auto_130177 ) ) ( not ( = ?auto_130171 ?auto_130178 ) ) ( not ( = ?auto_130171 ?auto_130179 ) ) ( not ( = ?auto_130171 ?auto_130180 ) ) ( not ( = ?auto_130171 ?auto_130181 ) ) ( not ( = ?auto_130171 ?auto_130182 ) ) ( not ( = ?auto_130172 ?auto_130173 ) ) ( not ( = ?auto_130172 ?auto_130174 ) ) ( not ( = ?auto_130172 ?auto_130175 ) ) ( not ( = ?auto_130172 ?auto_130176 ) ) ( not ( = ?auto_130172 ?auto_130177 ) ) ( not ( = ?auto_130172 ?auto_130178 ) ) ( not ( = ?auto_130172 ?auto_130179 ) ) ( not ( = ?auto_130172 ?auto_130180 ) ) ( not ( = ?auto_130172 ?auto_130181 ) ) ( not ( = ?auto_130172 ?auto_130182 ) ) ( not ( = ?auto_130173 ?auto_130174 ) ) ( not ( = ?auto_130173 ?auto_130175 ) ) ( not ( = ?auto_130173 ?auto_130176 ) ) ( not ( = ?auto_130173 ?auto_130177 ) ) ( not ( = ?auto_130173 ?auto_130178 ) ) ( not ( = ?auto_130173 ?auto_130179 ) ) ( not ( = ?auto_130173 ?auto_130180 ) ) ( not ( = ?auto_130173 ?auto_130181 ) ) ( not ( = ?auto_130173 ?auto_130182 ) ) ( not ( = ?auto_130174 ?auto_130175 ) ) ( not ( = ?auto_130174 ?auto_130176 ) ) ( not ( = ?auto_130174 ?auto_130177 ) ) ( not ( = ?auto_130174 ?auto_130178 ) ) ( not ( = ?auto_130174 ?auto_130179 ) ) ( not ( = ?auto_130174 ?auto_130180 ) ) ( not ( = ?auto_130174 ?auto_130181 ) ) ( not ( = ?auto_130174 ?auto_130182 ) ) ( not ( = ?auto_130175 ?auto_130176 ) ) ( not ( = ?auto_130175 ?auto_130177 ) ) ( not ( = ?auto_130175 ?auto_130178 ) ) ( not ( = ?auto_130175 ?auto_130179 ) ) ( not ( = ?auto_130175 ?auto_130180 ) ) ( not ( = ?auto_130175 ?auto_130181 ) ) ( not ( = ?auto_130175 ?auto_130182 ) ) ( not ( = ?auto_130176 ?auto_130177 ) ) ( not ( = ?auto_130176 ?auto_130178 ) ) ( not ( = ?auto_130176 ?auto_130179 ) ) ( not ( = ?auto_130176 ?auto_130180 ) ) ( not ( = ?auto_130176 ?auto_130181 ) ) ( not ( = ?auto_130176 ?auto_130182 ) ) ( not ( = ?auto_130177 ?auto_130178 ) ) ( not ( = ?auto_130177 ?auto_130179 ) ) ( not ( = ?auto_130177 ?auto_130180 ) ) ( not ( = ?auto_130177 ?auto_130181 ) ) ( not ( = ?auto_130177 ?auto_130182 ) ) ( not ( = ?auto_130178 ?auto_130179 ) ) ( not ( = ?auto_130178 ?auto_130180 ) ) ( not ( = ?auto_130178 ?auto_130181 ) ) ( not ( = ?auto_130178 ?auto_130182 ) ) ( not ( = ?auto_130179 ?auto_130180 ) ) ( not ( = ?auto_130179 ?auto_130181 ) ) ( not ( = ?auto_130179 ?auto_130182 ) ) ( not ( = ?auto_130180 ?auto_130181 ) ) ( not ( = ?auto_130180 ?auto_130182 ) ) ( not ( = ?auto_130181 ?auto_130182 ) ) ( ON ?auto_130180 ?auto_130181 ) ( CLEAR ?auto_130178 ) ( ON ?auto_130179 ?auto_130180 ) ( CLEAR ?auto_130179 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_130171 ?auto_130172 ?auto_130173 ?auto_130174 ?auto_130175 ?auto_130176 ?auto_130177 ?auto_130178 ?auto_130179 )
      ( MAKE-11PILE ?auto_130171 ?auto_130172 ?auto_130173 ?auto_130174 ?auto_130175 ?auto_130176 ?auto_130177 ?auto_130178 ?auto_130179 ?auto_130180 ?auto_130181 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_130194 - BLOCK
      ?auto_130195 - BLOCK
      ?auto_130196 - BLOCK
      ?auto_130197 - BLOCK
      ?auto_130198 - BLOCK
      ?auto_130199 - BLOCK
      ?auto_130200 - BLOCK
      ?auto_130201 - BLOCK
      ?auto_130202 - BLOCK
      ?auto_130203 - BLOCK
      ?auto_130204 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_130204 ) ( ON-TABLE ?auto_130194 ) ( ON ?auto_130195 ?auto_130194 ) ( ON ?auto_130196 ?auto_130195 ) ( ON ?auto_130197 ?auto_130196 ) ( ON ?auto_130198 ?auto_130197 ) ( ON ?auto_130199 ?auto_130198 ) ( ON ?auto_130200 ?auto_130199 ) ( ON ?auto_130201 ?auto_130200 ) ( not ( = ?auto_130194 ?auto_130195 ) ) ( not ( = ?auto_130194 ?auto_130196 ) ) ( not ( = ?auto_130194 ?auto_130197 ) ) ( not ( = ?auto_130194 ?auto_130198 ) ) ( not ( = ?auto_130194 ?auto_130199 ) ) ( not ( = ?auto_130194 ?auto_130200 ) ) ( not ( = ?auto_130194 ?auto_130201 ) ) ( not ( = ?auto_130194 ?auto_130202 ) ) ( not ( = ?auto_130194 ?auto_130203 ) ) ( not ( = ?auto_130194 ?auto_130204 ) ) ( not ( = ?auto_130195 ?auto_130196 ) ) ( not ( = ?auto_130195 ?auto_130197 ) ) ( not ( = ?auto_130195 ?auto_130198 ) ) ( not ( = ?auto_130195 ?auto_130199 ) ) ( not ( = ?auto_130195 ?auto_130200 ) ) ( not ( = ?auto_130195 ?auto_130201 ) ) ( not ( = ?auto_130195 ?auto_130202 ) ) ( not ( = ?auto_130195 ?auto_130203 ) ) ( not ( = ?auto_130195 ?auto_130204 ) ) ( not ( = ?auto_130196 ?auto_130197 ) ) ( not ( = ?auto_130196 ?auto_130198 ) ) ( not ( = ?auto_130196 ?auto_130199 ) ) ( not ( = ?auto_130196 ?auto_130200 ) ) ( not ( = ?auto_130196 ?auto_130201 ) ) ( not ( = ?auto_130196 ?auto_130202 ) ) ( not ( = ?auto_130196 ?auto_130203 ) ) ( not ( = ?auto_130196 ?auto_130204 ) ) ( not ( = ?auto_130197 ?auto_130198 ) ) ( not ( = ?auto_130197 ?auto_130199 ) ) ( not ( = ?auto_130197 ?auto_130200 ) ) ( not ( = ?auto_130197 ?auto_130201 ) ) ( not ( = ?auto_130197 ?auto_130202 ) ) ( not ( = ?auto_130197 ?auto_130203 ) ) ( not ( = ?auto_130197 ?auto_130204 ) ) ( not ( = ?auto_130198 ?auto_130199 ) ) ( not ( = ?auto_130198 ?auto_130200 ) ) ( not ( = ?auto_130198 ?auto_130201 ) ) ( not ( = ?auto_130198 ?auto_130202 ) ) ( not ( = ?auto_130198 ?auto_130203 ) ) ( not ( = ?auto_130198 ?auto_130204 ) ) ( not ( = ?auto_130199 ?auto_130200 ) ) ( not ( = ?auto_130199 ?auto_130201 ) ) ( not ( = ?auto_130199 ?auto_130202 ) ) ( not ( = ?auto_130199 ?auto_130203 ) ) ( not ( = ?auto_130199 ?auto_130204 ) ) ( not ( = ?auto_130200 ?auto_130201 ) ) ( not ( = ?auto_130200 ?auto_130202 ) ) ( not ( = ?auto_130200 ?auto_130203 ) ) ( not ( = ?auto_130200 ?auto_130204 ) ) ( not ( = ?auto_130201 ?auto_130202 ) ) ( not ( = ?auto_130201 ?auto_130203 ) ) ( not ( = ?auto_130201 ?auto_130204 ) ) ( not ( = ?auto_130202 ?auto_130203 ) ) ( not ( = ?auto_130202 ?auto_130204 ) ) ( not ( = ?auto_130203 ?auto_130204 ) ) ( ON ?auto_130203 ?auto_130204 ) ( CLEAR ?auto_130201 ) ( ON ?auto_130202 ?auto_130203 ) ( CLEAR ?auto_130202 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_130194 ?auto_130195 ?auto_130196 ?auto_130197 ?auto_130198 ?auto_130199 ?auto_130200 ?auto_130201 ?auto_130202 )
      ( MAKE-11PILE ?auto_130194 ?auto_130195 ?auto_130196 ?auto_130197 ?auto_130198 ?auto_130199 ?auto_130200 ?auto_130201 ?auto_130202 ?auto_130203 ?auto_130204 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_130216 - BLOCK
      ?auto_130217 - BLOCK
      ?auto_130218 - BLOCK
      ?auto_130219 - BLOCK
      ?auto_130220 - BLOCK
      ?auto_130221 - BLOCK
      ?auto_130222 - BLOCK
      ?auto_130223 - BLOCK
      ?auto_130224 - BLOCK
      ?auto_130225 - BLOCK
      ?auto_130226 - BLOCK
    )
    :vars
    (
      ?auto_130227 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_130226 ?auto_130227 ) ( ON-TABLE ?auto_130216 ) ( ON ?auto_130217 ?auto_130216 ) ( ON ?auto_130218 ?auto_130217 ) ( ON ?auto_130219 ?auto_130218 ) ( ON ?auto_130220 ?auto_130219 ) ( ON ?auto_130221 ?auto_130220 ) ( ON ?auto_130222 ?auto_130221 ) ( not ( = ?auto_130216 ?auto_130217 ) ) ( not ( = ?auto_130216 ?auto_130218 ) ) ( not ( = ?auto_130216 ?auto_130219 ) ) ( not ( = ?auto_130216 ?auto_130220 ) ) ( not ( = ?auto_130216 ?auto_130221 ) ) ( not ( = ?auto_130216 ?auto_130222 ) ) ( not ( = ?auto_130216 ?auto_130223 ) ) ( not ( = ?auto_130216 ?auto_130224 ) ) ( not ( = ?auto_130216 ?auto_130225 ) ) ( not ( = ?auto_130216 ?auto_130226 ) ) ( not ( = ?auto_130216 ?auto_130227 ) ) ( not ( = ?auto_130217 ?auto_130218 ) ) ( not ( = ?auto_130217 ?auto_130219 ) ) ( not ( = ?auto_130217 ?auto_130220 ) ) ( not ( = ?auto_130217 ?auto_130221 ) ) ( not ( = ?auto_130217 ?auto_130222 ) ) ( not ( = ?auto_130217 ?auto_130223 ) ) ( not ( = ?auto_130217 ?auto_130224 ) ) ( not ( = ?auto_130217 ?auto_130225 ) ) ( not ( = ?auto_130217 ?auto_130226 ) ) ( not ( = ?auto_130217 ?auto_130227 ) ) ( not ( = ?auto_130218 ?auto_130219 ) ) ( not ( = ?auto_130218 ?auto_130220 ) ) ( not ( = ?auto_130218 ?auto_130221 ) ) ( not ( = ?auto_130218 ?auto_130222 ) ) ( not ( = ?auto_130218 ?auto_130223 ) ) ( not ( = ?auto_130218 ?auto_130224 ) ) ( not ( = ?auto_130218 ?auto_130225 ) ) ( not ( = ?auto_130218 ?auto_130226 ) ) ( not ( = ?auto_130218 ?auto_130227 ) ) ( not ( = ?auto_130219 ?auto_130220 ) ) ( not ( = ?auto_130219 ?auto_130221 ) ) ( not ( = ?auto_130219 ?auto_130222 ) ) ( not ( = ?auto_130219 ?auto_130223 ) ) ( not ( = ?auto_130219 ?auto_130224 ) ) ( not ( = ?auto_130219 ?auto_130225 ) ) ( not ( = ?auto_130219 ?auto_130226 ) ) ( not ( = ?auto_130219 ?auto_130227 ) ) ( not ( = ?auto_130220 ?auto_130221 ) ) ( not ( = ?auto_130220 ?auto_130222 ) ) ( not ( = ?auto_130220 ?auto_130223 ) ) ( not ( = ?auto_130220 ?auto_130224 ) ) ( not ( = ?auto_130220 ?auto_130225 ) ) ( not ( = ?auto_130220 ?auto_130226 ) ) ( not ( = ?auto_130220 ?auto_130227 ) ) ( not ( = ?auto_130221 ?auto_130222 ) ) ( not ( = ?auto_130221 ?auto_130223 ) ) ( not ( = ?auto_130221 ?auto_130224 ) ) ( not ( = ?auto_130221 ?auto_130225 ) ) ( not ( = ?auto_130221 ?auto_130226 ) ) ( not ( = ?auto_130221 ?auto_130227 ) ) ( not ( = ?auto_130222 ?auto_130223 ) ) ( not ( = ?auto_130222 ?auto_130224 ) ) ( not ( = ?auto_130222 ?auto_130225 ) ) ( not ( = ?auto_130222 ?auto_130226 ) ) ( not ( = ?auto_130222 ?auto_130227 ) ) ( not ( = ?auto_130223 ?auto_130224 ) ) ( not ( = ?auto_130223 ?auto_130225 ) ) ( not ( = ?auto_130223 ?auto_130226 ) ) ( not ( = ?auto_130223 ?auto_130227 ) ) ( not ( = ?auto_130224 ?auto_130225 ) ) ( not ( = ?auto_130224 ?auto_130226 ) ) ( not ( = ?auto_130224 ?auto_130227 ) ) ( not ( = ?auto_130225 ?auto_130226 ) ) ( not ( = ?auto_130225 ?auto_130227 ) ) ( not ( = ?auto_130226 ?auto_130227 ) ) ( ON ?auto_130225 ?auto_130226 ) ( ON ?auto_130224 ?auto_130225 ) ( CLEAR ?auto_130222 ) ( ON ?auto_130223 ?auto_130224 ) ( CLEAR ?auto_130223 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_130216 ?auto_130217 ?auto_130218 ?auto_130219 ?auto_130220 ?auto_130221 ?auto_130222 ?auto_130223 )
      ( MAKE-11PILE ?auto_130216 ?auto_130217 ?auto_130218 ?auto_130219 ?auto_130220 ?auto_130221 ?auto_130222 ?auto_130223 ?auto_130224 ?auto_130225 ?auto_130226 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_130239 - BLOCK
      ?auto_130240 - BLOCK
      ?auto_130241 - BLOCK
      ?auto_130242 - BLOCK
      ?auto_130243 - BLOCK
      ?auto_130244 - BLOCK
      ?auto_130245 - BLOCK
      ?auto_130246 - BLOCK
      ?auto_130247 - BLOCK
      ?auto_130248 - BLOCK
      ?auto_130249 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_130249 ) ( ON-TABLE ?auto_130239 ) ( ON ?auto_130240 ?auto_130239 ) ( ON ?auto_130241 ?auto_130240 ) ( ON ?auto_130242 ?auto_130241 ) ( ON ?auto_130243 ?auto_130242 ) ( ON ?auto_130244 ?auto_130243 ) ( ON ?auto_130245 ?auto_130244 ) ( not ( = ?auto_130239 ?auto_130240 ) ) ( not ( = ?auto_130239 ?auto_130241 ) ) ( not ( = ?auto_130239 ?auto_130242 ) ) ( not ( = ?auto_130239 ?auto_130243 ) ) ( not ( = ?auto_130239 ?auto_130244 ) ) ( not ( = ?auto_130239 ?auto_130245 ) ) ( not ( = ?auto_130239 ?auto_130246 ) ) ( not ( = ?auto_130239 ?auto_130247 ) ) ( not ( = ?auto_130239 ?auto_130248 ) ) ( not ( = ?auto_130239 ?auto_130249 ) ) ( not ( = ?auto_130240 ?auto_130241 ) ) ( not ( = ?auto_130240 ?auto_130242 ) ) ( not ( = ?auto_130240 ?auto_130243 ) ) ( not ( = ?auto_130240 ?auto_130244 ) ) ( not ( = ?auto_130240 ?auto_130245 ) ) ( not ( = ?auto_130240 ?auto_130246 ) ) ( not ( = ?auto_130240 ?auto_130247 ) ) ( not ( = ?auto_130240 ?auto_130248 ) ) ( not ( = ?auto_130240 ?auto_130249 ) ) ( not ( = ?auto_130241 ?auto_130242 ) ) ( not ( = ?auto_130241 ?auto_130243 ) ) ( not ( = ?auto_130241 ?auto_130244 ) ) ( not ( = ?auto_130241 ?auto_130245 ) ) ( not ( = ?auto_130241 ?auto_130246 ) ) ( not ( = ?auto_130241 ?auto_130247 ) ) ( not ( = ?auto_130241 ?auto_130248 ) ) ( not ( = ?auto_130241 ?auto_130249 ) ) ( not ( = ?auto_130242 ?auto_130243 ) ) ( not ( = ?auto_130242 ?auto_130244 ) ) ( not ( = ?auto_130242 ?auto_130245 ) ) ( not ( = ?auto_130242 ?auto_130246 ) ) ( not ( = ?auto_130242 ?auto_130247 ) ) ( not ( = ?auto_130242 ?auto_130248 ) ) ( not ( = ?auto_130242 ?auto_130249 ) ) ( not ( = ?auto_130243 ?auto_130244 ) ) ( not ( = ?auto_130243 ?auto_130245 ) ) ( not ( = ?auto_130243 ?auto_130246 ) ) ( not ( = ?auto_130243 ?auto_130247 ) ) ( not ( = ?auto_130243 ?auto_130248 ) ) ( not ( = ?auto_130243 ?auto_130249 ) ) ( not ( = ?auto_130244 ?auto_130245 ) ) ( not ( = ?auto_130244 ?auto_130246 ) ) ( not ( = ?auto_130244 ?auto_130247 ) ) ( not ( = ?auto_130244 ?auto_130248 ) ) ( not ( = ?auto_130244 ?auto_130249 ) ) ( not ( = ?auto_130245 ?auto_130246 ) ) ( not ( = ?auto_130245 ?auto_130247 ) ) ( not ( = ?auto_130245 ?auto_130248 ) ) ( not ( = ?auto_130245 ?auto_130249 ) ) ( not ( = ?auto_130246 ?auto_130247 ) ) ( not ( = ?auto_130246 ?auto_130248 ) ) ( not ( = ?auto_130246 ?auto_130249 ) ) ( not ( = ?auto_130247 ?auto_130248 ) ) ( not ( = ?auto_130247 ?auto_130249 ) ) ( not ( = ?auto_130248 ?auto_130249 ) ) ( ON ?auto_130248 ?auto_130249 ) ( ON ?auto_130247 ?auto_130248 ) ( CLEAR ?auto_130245 ) ( ON ?auto_130246 ?auto_130247 ) ( CLEAR ?auto_130246 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_130239 ?auto_130240 ?auto_130241 ?auto_130242 ?auto_130243 ?auto_130244 ?auto_130245 ?auto_130246 )
      ( MAKE-11PILE ?auto_130239 ?auto_130240 ?auto_130241 ?auto_130242 ?auto_130243 ?auto_130244 ?auto_130245 ?auto_130246 ?auto_130247 ?auto_130248 ?auto_130249 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_130261 - BLOCK
      ?auto_130262 - BLOCK
      ?auto_130263 - BLOCK
      ?auto_130264 - BLOCK
      ?auto_130265 - BLOCK
      ?auto_130266 - BLOCK
      ?auto_130267 - BLOCK
      ?auto_130268 - BLOCK
      ?auto_130269 - BLOCK
      ?auto_130270 - BLOCK
      ?auto_130271 - BLOCK
    )
    :vars
    (
      ?auto_130272 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_130271 ?auto_130272 ) ( ON-TABLE ?auto_130261 ) ( ON ?auto_130262 ?auto_130261 ) ( ON ?auto_130263 ?auto_130262 ) ( ON ?auto_130264 ?auto_130263 ) ( ON ?auto_130265 ?auto_130264 ) ( ON ?auto_130266 ?auto_130265 ) ( not ( = ?auto_130261 ?auto_130262 ) ) ( not ( = ?auto_130261 ?auto_130263 ) ) ( not ( = ?auto_130261 ?auto_130264 ) ) ( not ( = ?auto_130261 ?auto_130265 ) ) ( not ( = ?auto_130261 ?auto_130266 ) ) ( not ( = ?auto_130261 ?auto_130267 ) ) ( not ( = ?auto_130261 ?auto_130268 ) ) ( not ( = ?auto_130261 ?auto_130269 ) ) ( not ( = ?auto_130261 ?auto_130270 ) ) ( not ( = ?auto_130261 ?auto_130271 ) ) ( not ( = ?auto_130261 ?auto_130272 ) ) ( not ( = ?auto_130262 ?auto_130263 ) ) ( not ( = ?auto_130262 ?auto_130264 ) ) ( not ( = ?auto_130262 ?auto_130265 ) ) ( not ( = ?auto_130262 ?auto_130266 ) ) ( not ( = ?auto_130262 ?auto_130267 ) ) ( not ( = ?auto_130262 ?auto_130268 ) ) ( not ( = ?auto_130262 ?auto_130269 ) ) ( not ( = ?auto_130262 ?auto_130270 ) ) ( not ( = ?auto_130262 ?auto_130271 ) ) ( not ( = ?auto_130262 ?auto_130272 ) ) ( not ( = ?auto_130263 ?auto_130264 ) ) ( not ( = ?auto_130263 ?auto_130265 ) ) ( not ( = ?auto_130263 ?auto_130266 ) ) ( not ( = ?auto_130263 ?auto_130267 ) ) ( not ( = ?auto_130263 ?auto_130268 ) ) ( not ( = ?auto_130263 ?auto_130269 ) ) ( not ( = ?auto_130263 ?auto_130270 ) ) ( not ( = ?auto_130263 ?auto_130271 ) ) ( not ( = ?auto_130263 ?auto_130272 ) ) ( not ( = ?auto_130264 ?auto_130265 ) ) ( not ( = ?auto_130264 ?auto_130266 ) ) ( not ( = ?auto_130264 ?auto_130267 ) ) ( not ( = ?auto_130264 ?auto_130268 ) ) ( not ( = ?auto_130264 ?auto_130269 ) ) ( not ( = ?auto_130264 ?auto_130270 ) ) ( not ( = ?auto_130264 ?auto_130271 ) ) ( not ( = ?auto_130264 ?auto_130272 ) ) ( not ( = ?auto_130265 ?auto_130266 ) ) ( not ( = ?auto_130265 ?auto_130267 ) ) ( not ( = ?auto_130265 ?auto_130268 ) ) ( not ( = ?auto_130265 ?auto_130269 ) ) ( not ( = ?auto_130265 ?auto_130270 ) ) ( not ( = ?auto_130265 ?auto_130271 ) ) ( not ( = ?auto_130265 ?auto_130272 ) ) ( not ( = ?auto_130266 ?auto_130267 ) ) ( not ( = ?auto_130266 ?auto_130268 ) ) ( not ( = ?auto_130266 ?auto_130269 ) ) ( not ( = ?auto_130266 ?auto_130270 ) ) ( not ( = ?auto_130266 ?auto_130271 ) ) ( not ( = ?auto_130266 ?auto_130272 ) ) ( not ( = ?auto_130267 ?auto_130268 ) ) ( not ( = ?auto_130267 ?auto_130269 ) ) ( not ( = ?auto_130267 ?auto_130270 ) ) ( not ( = ?auto_130267 ?auto_130271 ) ) ( not ( = ?auto_130267 ?auto_130272 ) ) ( not ( = ?auto_130268 ?auto_130269 ) ) ( not ( = ?auto_130268 ?auto_130270 ) ) ( not ( = ?auto_130268 ?auto_130271 ) ) ( not ( = ?auto_130268 ?auto_130272 ) ) ( not ( = ?auto_130269 ?auto_130270 ) ) ( not ( = ?auto_130269 ?auto_130271 ) ) ( not ( = ?auto_130269 ?auto_130272 ) ) ( not ( = ?auto_130270 ?auto_130271 ) ) ( not ( = ?auto_130270 ?auto_130272 ) ) ( not ( = ?auto_130271 ?auto_130272 ) ) ( ON ?auto_130270 ?auto_130271 ) ( ON ?auto_130269 ?auto_130270 ) ( ON ?auto_130268 ?auto_130269 ) ( CLEAR ?auto_130266 ) ( ON ?auto_130267 ?auto_130268 ) ( CLEAR ?auto_130267 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_130261 ?auto_130262 ?auto_130263 ?auto_130264 ?auto_130265 ?auto_130266 ?auto_130267 )
      ( MAKE-11PILE ?auto_130261 ?auto_130262 ?auto_130263 ?auto_130264 ?auto_130265 ?auto_130266 ?auto_130267 ?auto_130268 ?auto_130269 ?auto_130270 ?auto_130271 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_130284 - BLOCK
      ?auto_130285 - BLOCK
      ?auto_130286 - BLOCK
      ?auto_130287 - BLOCK
      ?auto_130288 - BLOCK
      ?auto_130289 - BLOCK
      ?auto_130290 - BLOCK
      ?auto_130291 - BLOCK
      ?auto_130292 - BLOCK
      ?auto_130293 - BLOCK
      ?auto_130294 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_130294 ) ( ON-TABLE ?auto_130284 ) ( ON ?auto_130285 ?auto_130284 ) ( ON ?auto_130286 ?auto_130285 ) ( ON ?auto_130287 ?auto_130286 ) ( ON ?auto_130288 ?auto_130287 ) ( ON ?auto_130289 ?auto_130288 ) ( not ( = ?auto_130284 ?auto_130285 ) ) ( not ( = ?auto_130284 ?auto_130286 ) ) ( not ( = ?auto_130284 ?auto_130287 ) ) ( not ( = ?auto_130284 ?auto_130288 ) ) ( not ( = ?auto_130284 ?auto_130289 ) ) ( not ( = ?auto_130284 ?auto_130290 ) ) ( not ( = ?auto_130284 ?auto_130291 ) ) ( not ( = ?auto_130284 ?auto_130292 ) ) ( not ( = ?auto_130284 ?auto_130293 ) ) ( not ( = ?auto_130284 ?auto_130294 ) ) ( not ( = ?auto_130285 ?auto_130286 ) ) ( not ( = ?auto_130285 ?auto_130287 ) ) ( not ( = ?auto_130285 ?auto_130288 ) ) ( not ( = ?auto_130285 ?auto_130289 ) ) ( not ( = ?auto_130285 ?auto_130290 ) ) ( not ( = ?auto_130285 ?auto_130291 ) ) ( not ( = ?auto_130285 ?auto_130292 ) ) ( not ( = ?auto_130285 ?auto_130293 ) ) ( not ( = ?auto_130285 ?auto_130294 ) ) ( not ( = ?auto_130286 ?auto_130287 ) ) ( not ( = ?auto_130286 ?auto_130288 ) ) ( not ( = ?auto_130286 ?auto_130289 ) ) ( not ( = ?auto_130286 ?auto_130290 ) ) ( not ( = ?auto_130286 ?auto_130291 ) ) ( not ( = ?auto_130286 ?auto_130292 ) ) ( not ( = ?auto_130286 ?auto_130293 ) ) ( not ( = ?auto_130286 ?auto_130294 ) ) ( not ( = ?auto_130287 ?auto_130288 ) ) ( not ( = ?auto_130287 ?auto_130289 ) ) ( not ( = ?auto_130287 ?auto_130290 ) ) ( not ( = ?auto_130287 ?auto_130291 ) ) ( not ( = ?auto_130287 ?auto_130292 ) ) ( not ( = ?auto_130287 ?auto_130293 ) ) ( not ( = ?auto_130287 ?auto_130294 ) ) ( not ( = ?auto_130288 ?auto_130289 ) ) ( not ( = ?auto_130288 ?auto_130290 ) ) ( not ( = ?auto_130288 ?auto_130291 ) ) ( not ( = ?auto_130288 ?auto_130292 ) ) ( not ( = ?auto_130288 ?auto_130293 ) ) ( not ( = ?auto_130288 ?auto_130294 ) ) ( not ( = ?auto_130289 ?auto_130290 ) ) ( not ( = ?auto_130289 ?auto_130291 ) ) ( not ( = ?auto_130289 ?auto_130292 ) ) ( not ( = ?auto_130289 ?auto_130293 ) ) ( not ( = ?auto_130289 ?auto_130294 ) ) ( not ( = ?auto_130290 ?auto_130291 ) ) ( not ( = ?auto_130290 ?auto_130292 ) ) ( not ( = ?auto_130290 ?auto_130293 ) ) ( not ( = ?auto_130290 ?auto_130294 ) ) ( not ( = ?auto_130291 ?auto_130292 ) ) ( not ( = ?auto_130291 ?auto_130293 ) ) ( not ( = ?auto_130291 ?auto_130294 ) ) ( not ( = ?auto_130292 ?auto_130293 ) ) ( not ( = ?auto_130292 ?auto_130294 ) ) ( not ( = ?auto_130293 ?auto_130294 ) ) ( ON ?auto_130293 ?auto_130294 ) ( ON ?auto_130292 ?auto_130293 ) ( ON ?auto_130291 ?auto_130292 ) ( CLEAR ?auto_130289 ) ( ON ?auto_130290 ?auto_130291 ) ( CLEAR ?auto_130290 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_130284 ?auto_130285 ?auto_130286 ?auto_130287 ?auto_130288 ?auto_130289 ?auto_130290 )
      ( MAKE-11PILE ?auto_130284 ?auto_130285 ?auto_130286 ?auto_130287 ?auto_130288 ?auto_130289 ?auto_130290 ?auto_130291 ?auto_130292 ?auto_130293 ?auto_130294 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_130306 - BLOCK
      ?auto_130307 - BLOCK
      ?auto_130308 - BLOCK
      ?auto_130309 - BLOCK
      ?auto_130310 - BLOCK
      ?auto_130311 - BLOCK
      ?auto_130312 - BLOCK
      ?auto_130313 - BLOCK
      ?auto_130314 - BLOCK
      ?auto_130315 - BLOCK
      ?auto_130316 - BLOCK
    )
    :vars
    (
      ?auto_130317 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_130316 ?auto_130317 ) ( ON-TABLE ?auto_130306 ) ( ON ?auto_130307 ?auto_130306 ) ( ON ?auto_130308 ?auto_130307 ) ( ON ?auto_130309 ?auto_130308 ) ( ON ?auto_130310 ?auto_130309 ) ( not ( = ?auto_130306 ?auto_130307 ) ) ( not ( = ?auto_130306 ?auto_130308 ) ) ( not ( = ?auto_130306 ?auto_130309 ) ) ( not ( = ?auto_130306 ?auto_130310 ) ) ( not ( = ?auto_130306 ?auto_130311 ) ) ( not ( = ?auto_130306 ?auto_130312 ) ) ( not ( = ?auto_130306 ?auto_130313 ) ) ( not ( = ?auto_130306 ?auto_130314 ) ) ( not ( = ?auto_130306 ?auto_130315 ) ) ( not ( = ?auto_130306 ?auto_130316 ) ) ( not ( = ?auto_130306 ?auto_130317 ) ) ( not ( = ?auto_130307 ?auto_130308 ) ) ( not ( = ?auto_130307 ?auto_130309 ) ) ( not ( = ?auto_130307 ?auto_130310 ) ) ( not ( = ?auto_130307 ?auto_130311 ) ) ( not ( = ?auto_130307 ?auto_130312 ) ) ( not ( = ?auto_130307 ?auto_130313 ) ) ( not ( = ?auto_130307 ?auto_130314 ) ) ( not ( = ?auto_130307 ?auto_130315 ) ) ( not ( = ?auto_130307 ?auto_130316 ) ) ( not ( = ?auto_130307 ?auto_130317 ) ) ( not ( = ?auto_130308 ?auto_130309 ) ) ( not ( = ?auto_130308 ?auto_130310 ) ) ( not ( = ?auto_130308 ?auto_130311 ) ) ( not ( = ?auto_130308 ?auto_130312 ) ) ( not ( = ?auto_130308 ?auto_130313 ) ) ( not ( = ?auto_130308 ?auto_130314 ) ) ( not ( = ?auto_130308 ?auto_130315 ) ) ( not ( = ?auto_130308 ?auto_130316 ) ) ( not ( = ?auto_130308 ?auto_130317 ) ) ( not ( = ?auto_130309 ?auto_130310 ) ) ( not ( = ?auto_130309 ?auto_130311 ) ) ( not ( = ?auto_130309 ?auto_130312 ) ) ( not ( = ?auto_130309 ?auto_130313 ) ) ( not ( = ?auto_130309 ?auto_130314 ) ) ( not ( = ?auto_130309 ?auto_130315 ) ) ( not ( = ?auto_130309 ?auto_130316 ) ) ( not ( = ?auto_130309 ?auto_130317 ) ) ( not ( = ?auto_130310 ?auto_130311 ) ) ( not ( = ?auto_130310 ?auto_130312 ) ) ( not ( = ?auto_130310 ?auto_130313 ) ) ( not ( = ?auto_130310 ?auto_130314 ) ) ( not ( = ?auto_130310 ?auto_130315 ) ) ( not ( = ?auto_130310 ?auto_130316 ) ) ( not ( = ?auto_130310 ?auto_130317 ) ) ( not ( = ?auto_130311 ?auto_130312 ) ) ( not ( = ?auto_130311 ?auto_130313 ) ) ( not ( = ?auto_130311 ?auto_130314 ) ) ( not ( = ?auto_130311 ?auto_130315 ) ) ( not ( = ?auto_130311 ?auto_130316 ) ) ( not ( = ?auto_130311 ?auto_130317 ) ) ( not ( = ?auto_130312 ?auto_130313 ) ) ( not ( = ?auto_130312 ?auto_130314 ) ) ( not ( = ?auto_130312 ?auto_130315 ) ) ( not ( = ?auto_130312 ?auto_130316 ) ) ( not ( = ?auto_130312 ?auto_130317 ) ) ( not ( = ?auto_130313 ?auto_130314 ) ) ( not ( = ?auto_130313 ?auto_130315 ) ) ( not ( = ?auto_130313 ?auto_130316 ) ) ( not ( = ?auto_130313 ?auto_130317 ) ) ( not ( = ?auto_130314 ?auto_130315 ) ) ( not ( = ?auto_130314 ?auto_130316 ) ) ( not ( = ?auto_130314 ?auto_130317 ) ) ( not ( = ?auto_130315 ?auto_130316 ) ) ( not ( = ?auto_130315 ?auto_130317 ) ) ( not ( = ?auto_130316 ?auto_130317 ) ) ( ON ?auto_130315 ?auto_130316 ) ( ON ?auto_130314 ?auto_130315 ) ( ON ?auto_130313 ?auto_130314 ) ( ON ?auto_130312 ?auto_130313 ) ( CLEAR ?auto_130310 ) ( ON ?auto_130311 ?auto_130312 ) ( CLEAR ?auto_130311 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_130306 ?auto_130307 ?auto_130308 ?auto_130309 ?auto_130310 ?auto_130311 )
      ( MAKE-11PILE ?auto_130306 ?auto_130307 ?auto_130308 ?auto_130309 ?auto_130310 ?auto_130311 ?auto_130312 ?auto_130313 ?auto_130314 ?auto_130315 ?auto_130316 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_130329 - BLOCK
      ?auto_130330 - BLOCK
      ?auto_130331 - BLOCK
      ?auto_130332 - BLOCK
      ?auto_130333 - BLOCK
      ?auto_130334 - BLOCK
      ?auto_130335 - BLOCK
      ?auto_130336 - BLOCK
      ?auto_130337 - BLOCK
      ?auto_130338 - BLOCK
      ?auto_130339 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_130339 ) ( ON-TABLE ?auto_130329 ) ( ON ?auto_130330 ?auto_130329 ) ( ON ?auto_130331 ?auto_130330 ) ( ON ?auto_130332 ?auto_130331 ) ( ON ?auto_130333 ?auto_130332 ) ( not ( = ?auto_130329 ?auto_130330 ) ) ( not ( = ?auto_130329 ?auto_130331 ) ) ( not ( = ?auto_130329 ?auto_130332 ) ) ( not ( = ?auto_130329 ?auto_130333 ) ) ( not ( = ?auto_130329 ?auto_130334 ) ) ( not ( = ?auto_130329 ?auto_130335 ) ) ( not ( = ?auto_130329 ?auto_130336 ) ) ( not ( = ?auto_130329 ?auto_130337 ) ) ( not ( = ?auto_130329 ?auto_130338 ) ) ( not ( = ?auto_130329 ?auto_130339 ) ) ( not ( = ?auto_130330 ?auto_130331 ) ) ( not ( = ?auto_130330 ?auto_130332 ) ) ( not ( = ?auto_130330 ?auto_130333 ) ) ( not ( = ?auto_130330 ?auto_130334 ) ) ( not ( = ?auto_130330 ?auto_130335 ) ) ( not ( = ?auto_130330 ?auto_130336 ) ) ( not ( = ?auto_130330 ?auto_130337 ) ) ( not ( = ?auto_130330 ?auto_130338 ) ) ( not ( = ?auto_130330 ?auto_130339 ) ) ( not ( = ?auto_130331 ?auto_130332 ) ) ( not ( = ?auto_130331 ?auto_130333 ) ) ( not ( = ?auto_130331 ?auto_130334 ) ) ( not ( = ?auto_130331 ?auto_130335 ) ) ( not ( = ?auto_130331 ?auto_130336 ) ) ( not ( = ?auto_130331 ?auto_130337 ) ) ( not ( = ?auto_130331 ?auto_130338 ) ) ( not ( = ?auto_130331 ?auto_130339 ) ) ( not ( = ?auto_130332 ?auto_130333 ) ) ( not ( = ?auto_130332 ?auto_130334 ) ) ( not ( = ?auto_130332 ?auto_130335 ) ) ( not ( = ?auto_130332 ?auto_130336 ) ) ( not ( = ?auto_130332 ?auto_130337 ) ) ( not ( = ?auto_130332 ?auto_130338 ) ) ( not ( = ?auto_130332 ?auto_130339 ) ) ( not ( = ?auto_130333 ?auto_130334 ) ) ( not ( = ?auto_130333 ?auto_130335 ) ) ( not ( = ?auto_130333 ?auto_130336 ) ) ( not ( = ?auto_130333 ?auto_130337 ) ) ( not ( = ?auto_130333 ?auto_130338 ) ) ( not ( = ?auto_130333 ?auto_130339 ) ) ( not ( = ?auto_130334 ?auto_130335 ) ) ( not ( = ?auto_130334 ?auto_130336 ) ) ( not ( = ?auto_130334 ?auto_130337 ) ) ( not ( = ?auto_130334 ?auto_130338 ) ) ( not ( = ?auto_130334 ?auto_130339 ) ) ( not ( = ?auto_130335 ?auto_130336 ) ) ( not ( = ?auto_130335 ?auto_130337 ) ) ( not ( = ?auto_130335 ?auto_130338 ) ) ( not ( = ?auto_130335 ?auto_130339 ) ) ( not ( = ?auto_130336 ?auto_130337 ) ) ( not ( = ?auto_130336 ?auto_130338 ) ) ( not ( = ?auto_130336 ?auto_130339 ) ) ( not ( = ?auto_130337 ?auto_130338 ) ) ( not ( = ?auto_130337 ?auto_130339 ) ) ( not ( = ?auto_130338 ?auto_130339 ) ) ( ON ?auto_130338 ?auto_130339 ) ( ON ?auto_130337 ?auto_130338 ) ( ON ?auto_130336 ?auto_130337 ) ( ON ?auto_130335 ?auto_130336 ) ( CLEAR ?auto_130333 ) ( ON ?auto_130334 ?auto_130335 ) ( CLEAR ?auto_130334 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_130329 ?auto_130330 ?auto_130331 ?auto_130332 ?auto_130333 ?auto_130334 )
      ( MAKE-11PILE ?auto_130329 ?auto_130330 ?auto_130331 ?auto_130332 ?auto_130333 ?auto_130334 ?auto_130335 ?auto_130336 ?auto_130337 ?auto_130338 ?auto_130339 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_130351 - BLOCK
      ?auto_130352 - BLOCK
      ?auto_130353 - BLOCK
      ?auto_130354 - BLOCK
      ?auto_130355 - BLOCK
      ?auto_130356 - BLOCK
      ?auto_130357 - BLOCK
      ?auto_130358 - BLOCK
      ?auto_130359 - BLOCK
      ?auto_130360 - BLOCK
      ?auto_130361 - BLOCK
    )
    :vars
    (
      ?auto_130362 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_130361 ?auto_130362 ) ( ON-TABLE ?auto_130351 ) ( ON ?auto_130352 ?auto_130351 ) ( ON ?auto_130353 ?auto_130352 ) ( ON ?auto_130354 ?auto_130353 ) ( not ( = ?auto_130351 ?auto_130352 ) ) ( not ( = ?auto_130351 ?auto_130353 ) ) ( not ( = ?auto_130351 ?auto_130354 ) ) ( not ( = ?auto_130351 ?auto_130355 ) ) ( not ( = ?auto_130351 ?auto_130356 ) ) ( not ( = ?auto_130351 ?auto_130357 ) ) ( not ( = ?auto_130351 ?auto_130358 ) ) ( not ( = ?auto_130351 ?auto_130359 ) ) ( not ( = ?auto_130351 ?auto_130360 ) ) ( not ( = ?auto_130351 ?auto_130361 ) ) ( not ( = ?auto_130351 ?auto_130362 ) ) ( not ( = ?auto_130352 ?auto_130353 ) ) ( not ( = ?auto_130352 ?auto_130354 ) ) ( not ( = ?auto_130352 ?auto_130355 ) ) ( not ( = ?auto_130352 ?auto_130356 ) ) ( not ( = ?auto_130352 ?auto_130357 ) ) ( not ( = ?auto_130352 ?auto_130358 ) ) ( not ( = ?auto_130352 ?auto_130359 ) ) ( not ( = ?auto_130352 ?auto_130360 ) ) ( not ( = ?auto_130352 ?auto_130361 ) ) ( not ( = ?auto_130352 ?auto_130362 ) ) ( not ( = ?auto_130353 ?auto_130354 ) ) ( not ( = ?auto_130353 ?auto_130355 ) ) ( not ( = ?auto_130353 ?auto_130356 ) ) ( not ( = ?auto_130353 ?auto_130357 ) ) ( not ( = ?auto_130353 ?auto_130358 ) ) ( not ( = ?auto_130353 ?auto_130359 ) ) ( not ( = ?auto_130353 ?auto_130360 ) ) ( not ( = ?auto_130353 ?auto_130361 ) ) ( not ( = ?auto_130353 ?auto_130362 ) ) ( not ( = ?auto_130354 ?auto_130355 ) ) ( not ( = ?auto_130354 ?auto_130356 ) ) ( not ( = ?auto_130354 ?auto_130357 ) ) ( not ( = ?auto_130354 ?auto_130358 ) ) ( not ( = ?auto_130354 ?auto_130359 ) ) ( not ( = ?auto_130354 ?auto_130360 ) ) ( not ( = ?auto_130354 ?auto_130361 ) ) ( not ( = ?auto_130354 ?auto_130362 ) ) ( not ( = ?auto_130355 ?auto_130356 ) ) ( not ( = ?auto_130355 ?auto_130357 ) ) ( not ( = ?auto_130355 ?auto_130358 ) ) ( not ( = ?auto_130355 ?auto_130359 ) ) ( not ( = ?auto_130355 ?auto_130360 ) ) ( not ( = ?auto_130355 ?auto_130361 ) ) ( not ( = ?auto_130355 ?auto_130362 ) ) ( not ( = ?auto_130356 ?auto_130357 ) ) ( not ( = ?auto_130356 ?auto_130358 ) ) ( not ( = ?auto_130356 ?auto_130359 ) ) ( not ( = ?auto_130356 ?auto_130360 ) ) ( not ( = ?auto_130356 ?auto_130361 ) ) ( not ( = ?auto_130356 ?auto_130362 ) ) ( not ( = ?auto_130357 ?auto_130358 ) ) ( not ( = ?auto_130357 ?auto_130359 ) ) ( not ( = ?auto_130357 ?auto_130360 ) ) ( not ( = ?auto_130357 ?auto_130361 ) ) ( not ( = ?auto_130357 ?auto_130362 ) ) ( not ( = ?auto_130358 ?auto_130359 ) ) ( not ( = ?auto_130358 ?auto_130360 ) ) ( not ( = ?auto_130358 ?auto_130361 ) ) ( not ( = ?auto_130358 ?auto_130362 ) ) ( not ( = ?auto_130359 ?auto_130360 ) ) ( not ( = ?auto_130359 ?auto_130361 ) ) ( not ( = ?auto_130359 ?auto_130362 ) ) ( not ( = ?auto_130360 ?auto_130361 ) ) ( not ( = ?auto_130360 ?auto_130362 ) ) ( not ( = ?auto_130361 ?auto_130362 ) ) ( ON ?auto_130360 ?auto_130361 ) ( ON ?auto_130359 ?auto_130360 ) ( ON ?auto_130358 ?auto_130359 ) ( ON ?auto_130357 ?auto_130358 ) ( ON ?auto_130356 ?auto_130357 ) ( CLEAR ?auto_130354 ) ( ON ?auto_130355 ?auto_130356 ) ( CLEAR ?auto_130355 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_130351 ?auto_130352 ?auto_130353 ?auto_130354 ?auto_130355 )
      ( MAKE-11PILE ?auto_130351 ?auto_130352 ?auto_130353 ?auto_130354 ?auto_130355 ?auto_130356 ?auto_130357 ?auto_130358 ?auto_130359 ?auto_130360 ?auto_130361 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_130374 - BLOCK
      ?auto_130375 - BLOCK
      ?auto_130376 - BLOCK
      ?auto_130377 - BLOCK
      ?auto_130378 - BLOCK
      ?auto_130379 - BLOCK
      ?auto_130380 - BLOCK
      ?auto_130381 - BLOCK
      ?auto_130382 - BLOCK
      ?auto_130383 - BLOCK
      ?auto_130384 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_130384 ) ( ON-TABLE ?auto_130374 ) ( ON ?auto_130375 ?auto_130374 ) ( ON ?auto_130376 ?auto_130375 ) ( ON ?auto_130377 ?auto_130376 ) ( not ( = ?auto_130374 ?auto_130375 ) ) ( not ( = ?auto_130374 ?auto_130376 ) ) ( not ( = ?auto_130374 ?auto_130377 ) ) ( not ( = ?auto_130374 ?auto_130378 ) ) ( not ( = ?auto_130374 ?auto_130379 ) ) ( not ( = ?auto_130374 ?auto_130380 ) ) ( not ( = ?auto_130374 ?auto_130381 ) ) ( not ( = ?auto_130374 ?auto_130382 ) ) ( not ( = ?auto_130374 ?auto_130383 ) ) ( not ( = ?auto_130374 ?auto_130384 ) ) ( not ( = ?auto_130375 ?auto_130376 ) ) ( not ( = ?auto_130375 ?auto_130377 ) ) ( not ( = ?auto_130375 ?auto_130378 ) ) ( not ( = ?auto_130375 ?auto_130379 ) ) ( not ( = ?auto_130375 ?auto_130380 ) ) ( not ( = ?auto_130375 ?auto_130381 ) ) ( not ( = ?auto_130375 ?auto_130382 ) ) ( not ( = ?auto_130375 ?auto_130383 ) ) ( not ( = ?auto_130375 ?auto_130384 ) ) ( not ( = ?auto_130376 ?auto_130377 ) ) ( not ( = ?auto_130376 ?auto_130378 ) ) ( not ( = ?auto_130376 ?auto_130379 ) ) ( not ( = ?auto_130376 ?auto_130380 ) ) ( not ( = ?auto_130376 ?auto_130381 ) ) ( not ( = ?auto_130376 ?auto_130382 ) ) ( not ( = ?auto_130376 ?auto_130383 ) ) ( not ( = ?auto_130376 ?auto_130384 ) ) ( not ( = ?auto_130377 ?auto_130378 ) ) ( not ( = ?auto_130377 ?auto_130379 ) ) ( not ( = ?auto_130377 ?auto_130380 ) ) ( not ( = ?auto_130377 ?auto_130381 ) ) ( not ( = ?auto_130377 ?auto_130382 ) ) ( not ( = ?auto_130377 ?auto_130383 ) ) ( not ( = ?auto_130377 ?auto_130384 ) ) ( not ( = ?auto_130378 ?auto_130379 ) ) ( not ( = ?auto_130378 ?auto_130380 ) ) ( not ( = ?auto_130378 ?auto_130381 ) ) ( not ( = ?auto_130378 ?auto_130382 ) ) ( not ( = ?auto_130378 ?auto_130383 ) ) ( not ( = ?auto_130378 ?auto_130384 ) ) ( not ( = ?auto_130379 ?auto_130380 ) ) ( not ( = ?auto_130379 ?auto_130381 ) ) ( not ( = ?auto_130379 ?auto_130382 ) ) ( not ( = ?auto_130379 ?auto_130383 ) ) ( not ( = ?auto_130379 ?auto_130384 ) ) ( not ( = ?auto_130380 ?auto_130381 ) ) ( not ( = ?auto_130380 ?auto_130382 ) ) ( not ( = ?auto_130380 ?auto_130383 ) ) ( not ( = ?auto_130380 ?auto_130384 ) ) ( not ( = ?auto_130381 ?auto_130382 ) ) ( not ( = ?auto_130381 ?auto_130383 ) ) ( not ( = ?auto_130381 ?auto_130384 ) ) ( not ( = ?auto_130382 ?auto_130383 ) ) ( not ( = ?auto_130382 ?auto_130384 ) ) ( not ( = ?auto_130383 ?auto_130384 ) ) ( ON ?auto_130383 ?auto_130384 ) ( ON ?auto_130382 ?auto_130383 ) ( ON ?auto_130381 ?auto_130382 ) ( ON ?auto_130380 ?auto_130381 ) ( ON ?auto_130379 ?auto_130380 ) ( CLEAR ?auto_130377 ) ( ON ?auto_130378 ?auto_130379 ) ( CLEAR ?auto_130378 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_130374 ?auto_130375 ?auto_130376 ?auto_130377 ?auto_130378 )
      ( MAKE-11PILE ?auto_130374 ?auto_130375 ?auto_130376 ?auto_130377 ?auto_130378 ?auto_130379 ?auto_130380 ?auto_130381 ?auto_130382 ?auto_130383 ?auto_130384 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_130396 - BLOCK
      ?auto_130397 - BLOCK
      ?auto_130398 - BLOCK
      ?auto_130399 - BLOCK
      ?auto_130400 - BLOCK
      ?auto_130401 - BLOCK
      ?auto_130402 - BLOCK
      ?auto_130403 - BLOCK
      ?auto_130404 - BLOCK
      ?auto_130405 - BLOCK
      ?auto_130406 - BLOCK
    )
    :vars
    (
      ?auto_130407 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_130406 ?auto_130407 ) ( ON-TABLE ?auto_130396 ) ( ON ?auto_130397 ?auto_130396 ) ( ON ?auto_130398 ?auto_130397 ) ( not ( = ?auto_130396 ?auto_130397 ) ) ( not ( = ?auto_130396 ?auto_130398 ) ) ( not ( = ?auto_130396 ?auto_130399 ) ) ( not ( = ?auto_130396 ?auto_130400 ) ) ( not ( = ?auto_130396 ?auto_130401 ) ) ( not ( = ?auto_130396 ?auto_130402 ) ) ( not ( = ?auto_130396 ?auto_130403 ) ) ( not ( = ?auto_130396 ?auto_130404 ) ) ( not ( = ?auto_130396 ?auto_130405 ) ) ( not ( = ?auto_130396 ?auto_130406 ) ) ( not ( = ?auto_130396 ?auto_130407 ) ) ( not ( = ?auto_130397 ?auto_130398 ) ) ( not ( = ?auto_130397 ?auto_130399 ) ) ( not ( = ?auto_130397 ?auto_130400 ) ) ( not ( = ?auto_130397 ?auto_130401 ) ) ( not ( = ?auto_130397 ?auto_130402 ) ) ( not ( = ?auto_130397 ?auto_130403 ) ) ( not ( = ?auto_130397 ?auto_130404 ) ) ( not ( = ?auto_130397 ?auto_130405 ) ) ( not ( = ?auto_130397 ?auto_130406 ) ) ( not ( = ?auto_130397 ?auto_130407 ) ) ( not ( = ?auto_130398 ?auto_130399 ) ) ( not ( = ?auto_130398 ?auto_130400 ) ) ( not ( = ?auto_130398 ?auto_130401 ) ) ( not ( = ?auto_130398 ?auto_130402 ) ) ( not ( = ?auto_130398 ?auto_130403 ) ) ( not ( = ?auto_130398 ?auto_130404 ) ) ( not ( = ?auto_130398 ?auto_130405 ) ) ( not ( = ?auto_130398 ?auto_130406 ) ) ( not ( = ?auto_130398 ?auto_130407 ) ) ( not ( = ?auto_130399 ?auto_130400 ) ) ( not ( = ?auto_130399 ?auto_130401 ) ) ( not ( = ?auto_130399 ?auto_130402 ) ) ( not ( = ?auto_130399 ?auto_130403 ) ) ( not ( = ?auto_130399 ?auto_130404 ) ) ( not ( = ?auto_130399 ?auto_130405 ) ) ( not ( = ?auto_130399 ?auto_130406 ) ) ( not ( = ?auto_130399 ?auto_130407 ) ) ( not ( = ?auto_130400 ?auto_130401 ) ) ( not ( = ?auto_130400 ?auto_130402 ) ) ( not ( = ?auto_130400 ?auto_130403 ) ) ( not ( = ?auto_130400 ?auto_130404 ) ) ( not ( = ?auto_130400 ?auto_130405 ) ) ( not ( = ?auto_130400 ?auto_130406 ) ) ( not ( = ?auto_130400 ?auto_130407 ) ) ( not ( = ?auto_130401 ?auto_130402 ) ) ( not ( = ?auto_130401 ?auto_130403 ) ) ( not ( = ?auto_130401 ?auto_130404 ) ) ( not ( = ?auto_130401 ?auto_130405 ) ) ( not ( = ?auto_130401 ?auto_130406 ) ) ( not ( = ?auto_130401 ?auto_130407 ) ) ( not ( = ?auto_130402 ?auto_130403 ) ) ( not ( = ?auto_130402 ?auto_130404 ) ) ( not ( = ?auto_130402 ?auto_130405 ) ) ( not ( = ?auto_130402 ?auto_130406 ) ) ( not ( = ?auto_130402 ?auto_130407 ) ) ( not ( = ?auto_130403 ?auto_130404 ) ) ( not ( = ?auto_130403 ?auto_130405 ) ) ( not ( = ?auto_130403 ?auto_130406 ) ) ( not ( = ?auto_130403 ?auto_130407 ) ) ( not ( = ?auto_130404 ?auto_130405 ) ) ( not ( = ?auto_130404 ?auto_130406 ) ) ( not ( = ?auto_130404 ?auto_130407 ) ) ( not ( = ?auto_130405 ?auto_130406 ) ) ( not ( = ?auto_130405 ?auto_130407 ) ) ( not ( = ?auto_130406 ?auto_130407 ) ) ( ON ?auto_130405 ?auto_130406 ) ( ON ?auto_130404 ?auto_130405 ) ( ON ?auto_130403 ?auto_130404 ) ( ON ?auto_130402 ?auto_130403 ) ( ON ?auto_130401 ?auto_130402 ) ( ON ?auto_130400 ?auto_130401 ) ( CLEAR ?auto_130398 ) ( ON ?auto_130399 ?auto_130400 ) ( CLEAR ?auto_130399 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_130396 ?auto_130397 ?auto_130398 ?auto_130399 )
      ( MAKE-11PILE ?auto_130396 ?auto_130397 ?auto_130398 ?auto_130399 ?auto_130400 ?auto_130401 ?auto_130402 ?auto_130403 ?auto_130404 ?auto_130405 ?auto_130406 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_130419 - BLOCK
      ?auto_130420 - BLOCK
      ?auto_130421 - BLOCK
      ?auto_130422 - BLOCK
      ?auto_130423 - BLOCK
      ?auto_130424 - BLOCK
      ?auto_130425 - BLOCK
      ?auto_130426 - BLOCK
      ?auto_130427 - BLOCK
      ?auto_130428 - BLOCK
      ?auto_130429 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_130429 ) ( ON-TABLE ?auto_130419 ) ( ON ?auto_130420 ?auto_130419 ) ( ON ?auto_130421 ?auto_130420 ) ( not ( = ?auto_130419 ?auto_130420 ) ) ( not ( = ?auto_130419 ?auto_130421 ) ) ( not ( = ?auto_130419 ?auto_130422 ) ) ( not ( = ?auto_130419 ?auto_130423 ) ) ( not ( = ?auto_130419 ?auto_130424 ) ) ( not ( = ?auto_130419 ?auto_130425 ) ) ( not ( = ?auto_130419 ?auto_130426 ) ) ( not ( = ?auto_130419 ?auto_130427 ) ) ( not ( = ?auto_130419 ?auto_130428 ) ) ( not ( = ?auto_130419 ?auto_130429 ) ) ( not ( = ?auto_130420 ?auto_130421 ) ) ( not ( = ?auto_130420 ?auto_130422 ) ) ( not ( = ?auto_130420 ?auto_130423 ) ) ( not ( = ?auto_130420 ?auto_130424 ) ) ( not ( = ?auto_130420 ?auto_130425 ) ) ( not ( = ?auto_130420 ?auto_130426 ) ) ( not ( = ?auto_130420 ?auto_130427 ) ) ( not ( = ?auto_130420 ?auto_130428 ) ) ( not ( = ?auto_130420 ?auto_130429 ) ) ( not ( = ?auto_130421 ?auto_130422 ) ) ( not ( = ?auto_130421 ?auto_130423 ) ) ( not ( = ?auto_130421 ?auto_130424 ) ) ( not ( = ?auto_130421 ?auto_130425 ) ) ( not ( = ?auto_130421 ?auto_130426 ) ) ( not ( = ?auto_130421 ?auto_130427 ) ) ( not ( = ?auto_130421 ?auto_130428 ) ) ( not ( = ?auto_130421 ?auto_130429 ) ) ( not ( = ?auto_130422 ?auto_130423 ) ) ( not ( = ?auto_130422 ?auto_130424 ) ) ( not ( = ?auto_130422 ?auto_130425 ) ) ( not ( = ?auto_130422 ?auto_130426 ) ) ( not ( = ?auto_130422 ?auto_130427 ) ) ( not ( = ?auto_130422 ?auto_130428 ) ) ( not ( = ?auto_130422 ?auto_130429 ) ) ( not ( = ?auto_130423 ?auto_130424 ) ) ( not ( = ?auto_130423 ?auto_130425 ) ) ( not ( = ?auto_130423 ?auto_130426 ) ) ( not ( = ?auto_130423 ?auto_130427 ) ) ( not ( = ?auto_130423 ?auto_130428 ) ) ( not ( = ?auto_130423 ?auto_130429 ) ) ( not ( = ?auto_130424 ?auto_130425 ) ) ( not ( = ?auto_130424 ?auto_130426 ) ) ( not ( = ?auto_130424 ?auto_130427 ) ) ( not ( = ?auto_130424 ?auto_130428 ) ) ( not ( = ?auto_130424 ?auto_130429 ) ) ( not ( = ?auto_130425 ?auto_130426 ) ) ( not ( = ?auto_130425 ?auto_130427 ) ) ( not ( = ?auto_130425 ?auto_130428 ) ) ( not ( = ?auto_130425 ?auto_130429 ) ) ( not ( = ?auto_130426 ?auto_130427 ) ) ( not ( = ?auto_130426 ?auto_130428 ) ) ( not ( = ?auto_130426 ?auto_130429 ) ) ( not ( = ?auto_130427 ?auto_130428 ) ) ( not ( = ?auto_130427 ?auto_130429 ) ) ( not ( = ?auto_130428 ?auto_130429 ) ) ( ON ?auto_130428 ?auto_130429 ) ( ON ?auto_130427 ?auto_130428 ) ( ON ?auto_130426 ?auto_130427 ) ( ON ?auto_130425 ?auto_130426 ) ( ON ?auto_130424 ?auto_130425 ) ( ON ?auto_130423 ?auto_130424 ) ( CLEAR ?auto_130421 ) ( ON ?auto_130422 ?auto_130423 ) ( CLEAR ?auto_130422 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_130419 ?auto_130420 ?auto_130421 ?auto_130422 )
      ( MAKE-11PILE ?auto_130419 ?auto_130420 ?auto_130421 ?auto_130422 ?auto_130423 ?auto_130424 ?auto_130425 ?auto_130426 ?auto_130427 ?auto_130428 ?auto_130429 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_130441 - BLOCK
      ?auto_130442 - BLOCK
      ?auto_130443 - BLOCK
      ?auto_130444 - BLOCK
      ?auto_130445 - BLOCK
      ?auto_130446 - BLOCK
      ?auto_130447 - BLOCK
      ?auto_130448 - BLOCK
      ?auto_130449 - BLOCK
      ?auto_130450 - BLOCK
      ?auto_130451 - BLOCK
    )
    :vars
    (
      ?auto_130452 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_130451 ?auto_130452 ) ( ON-TABLE ?auto_130441 ) ( ON ?auto_130442 ?auto_130441 ) ( not ( = ?auto_130441 ?auto_130442 ) ) ( not ( = ?auto_130441 ?auto_130443 ) ) ( not ( = ?auto_130441 ?auto_130444 ) ) ( not ( = ?auto_130441 ?auto_130445 ) ) ( not ( = ?auto_130441 ?auto_130446 ) ) ( not ( = ?auto_130441 ?auto_130447 ) ) ( not ( = ?auto_130441 ?auto_130448 ) ) ( not ( = ?auto_130441 ?auto_130449 ) ) ( not ( = ?auto_130441 ?auto_130450 ) ) ( not ( = ?auto_130441 ?auto_130451 ) ) ( not ( = ?auto_130441 ?auto_130452 ) ) ( not ( = ?auto_130442 ?auto_130443 ) ) ( not ( = ?auto_130442 ?auto_130444 ) ) ( not ( = ?auto_130442 ?auto_130445 ) ) ( not ( = ?auto_130442 ?auto_130446 ) ) ( not ( = ?auto_130442 ?auto_130447 ) ) ( not ( = ?auto_130442 ?auto_130448 ) ) ( not ( = ?auto_130442 ?auto_130449 ) ) ( not ( = ?auto_130442 ?auto_130450 ) ) ( not ( = ?auto_130442 ?auto_130451 ) ) ( not ( = ?auto_130442 ?auto_130452 ) ) ( not ( = ?auto_130443 ?auto_130444 ) ) ( not ( = ?auto_130443 ?auto_130445 ) ) ( not ( = ?auto_130443 ?auto_130446 ) ) ( not ( = ?auto_130443 ?auto_130447 ) ) ( not ( = ?auto_130443 ?auto_130448 ) ) ( not ( = ?auto_130443 ?auto_130449 ) ) ( not ( = ?auto_130443 ?auto_130450 ) ) ( not ( = ?auto_130443 ?auto_130451 ) ) ( not ( = ?auto_130443 ?auto_130452 ) ) ( not ( = ?auto_130444 ?auto_130445 ) ) ( not ( = ?auto_130444 ?auto_130446 ) ) ( not ( = ?auto_130444 ?auto_130447 ) ) ( not ( = ?auto_130444 ?auto_130448 ) ) ( not ( = ?auto_130444 ?auto_130449 ) ) ( not ( = ?auto_130444 ?auto_130450 ) ) ( not ( = ?auto_130444 ?auto_130451 ) ) ( not ( = ?auto_130444 ?auto_130452 ) ) ( not ( = ?auto_130445 ?auto_130446 ) ) ( not ( = ?auto_130445 ?auto_130447 ) ) ( not ( = ?auto_130445 ?auto_130448 ) ) ( not ( = ?auto_130445 ?auto_130449 ) ) ( not ( = ?auto_130445 ?auto_130450 ) ) ( not ( = ?auto_130445 ?auto_130451 ) ) ( not ( = ?auto_130445 ?auto_130452 ) ) ( not ( = ?auto_130446 ?auto_130447 ) ) ( not ( = ?auto_130446 ?auto_130448 ) ) ( not ( = ?auto_130446 ?auto_130449 ) ) ( not ( = ?auto_130446 ?auto_130450 ) ) ( not ( = ?auto_130446 ?auto_130451 ) ) ( not ( = ?auto_130446 ?auto_130452 ) ) ( not ( = ?auto_130447 ?auto_130448 ) ) ( not ( = ?auto_130447 ?auto_130449 ) ) ( not ( = ?auto_130447 ?auto_130450 ) ) ( not ( = ?auto_130447 ?auto_130451 ) ) ( not ( = ?auto_130447 ?auto_130452 ) ) ( not ( = ?auto_130448 ?auto_130449 ) ) ( not ( = ?auto_130448 ?auto_130450 ) ) ( not ( = ?auto_130448 ?auto_130451 ) ) ( not ( = ?auto_130448 ?auto_130452 ) ) ( not ( = ?auto_130449 ?auto_130450 ) ) ( not ( = ?auto_130449 ?auto_130451 ) ) ( not ( = ?auto_130449 ?auto_130452 ) ) ( not ( = ?auto_130450 ?auto_130451 ) ) ( not ( = ?auto_130450 ?auto_130452 ) ) ( not ( = ?auto_130451 ?auto_130452 ) ) ( ON ?auto_130450 ?auto_130451 ) ( ON ?auto_130449 ?auto_130450 ) ( ON ?auto_130448 ?auto_130449 ) ( ON ?auto_130447 ?auto_130448 ) ( ON ?auto_130446 ?auto_130447 ) ( ON ?auto_130445 ?auto_130446 ) ( ON ?auto_130444 ?auto_130445 ) ( CLEAR ?auto_130442 ) ( ON ?auto_130443 ?auto_130444 ) ( CLEAR ?auto_130443 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_130441 ?auto_130442 ?auto_130443 )
      ( MAKE-11PILE ?auto_130441 ?auto_130442 ?auto_130443 ?auto_130444 ?auto_130445 ?auto_130446 ?auto_130447 ?auto_130448 ?auto_130449 ?auto_130450 ?auto_130451 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_130464 - BLOCK
      ?auto_130465 - BLOCK
      ?auto_130466 - BLOCK
      ?auto_130467 - BLOCK
      ?auto_130468 - BLOCK
      ?auto_130469 - BLOCK
      ?auto_130470 - BLOCK
      ?auto_130471 - BLOCK
      ?auto_130472 - BLOCK
      ?auto_130473 - BLOCK
      ?auto_130474 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_130474 ) ( ON-TABLE ?auto_130464 ) ( ON ?auto_130465 ?auto_130464 ) ( not ( = ?auto_130464 ?auto_130465 ) ) ( not ( = ?auto_130464 ?auto_130466 ) ) ( not ( = ?auto_130464 ?auto_130467 ) ) ( not ( = ?auto_130464 ?auto_130468 ) ) ( not ( = ?auto_130464 ?auto_130469 ) ) ( not ( = ?auto_130464 ?auto_130470 ) ) ( not ( = ?auto_130464 ?auto_130471 ) ) ( not ( = ?auto_130464 ?auto_130472 ) ) ( not ( = ?auto_130464 ?auto_130473 ) ) ( not ( = ?auto_130464 ?auto_130474 ) ) ( not ( = ?auto_130465 ?auto_130466 ) ) ( not ( = ?auto_130465 ?auto_130467 ) ) ( not ( = ?auto_130465 ?auto_130468 ) ) ( not ( = ?auto_130465 ?auto_130469 ) ) ( not ( = ?auto_130465 ?auto_130470 ) ) ( not ( = ?auto_130465 ?auto_130471 ) ) ( not ( = ?auto_130465 ?auto_130472 ) ) ( not ( = ?auto_130465 ?auto_130473 ) ) ( not ( = ?auto_130465 ?auto_130474 ) ) ( not ( = ?auto_130466 ?auto_130467 ) ) ( not ( = ?auto_130466 ?auto_130468 ) ) ( not ( = ?auto_130466 ?auto_130469 ) ) ( not ( = ?auto_130466 ?auto_130470 ) ) ( not ( = ?auto_130466 ?auto_130471 ) ) ( not ( = ?auto_130466 ?auto_130472 ) ) ( not ( = ?auto_130466 ?auto_130473 ) ) ( not ( = ?auto_130466 ?auto_130474 ) ) ( not ( = ?auto_130467 ?auto_130468 ) ) ( not ( = ?auto_130467 ?auto_130469 ) ) ( not ( = ?auto_130467 ?auto_130470 ) ) ( not ( = ?auto_130467 ?auto_130471 ) ) ( not ( = ?auto_130467 ?auto_130472 ) ) ( not ( = ?auto_130467 ?auto_130473 ) ) ( not ( = ?auto_130467 ?auto_130474 ) ) ( not ( = ?auto_130468 ?auto_130469 ) ) ( not ( = ?auto_130468 ?auto_130470 ) ) ( not ( = ?auto_130468 ?auto_130471 ) ) ( not ( = ?auto_130468 ?auto_130472 ) ) ( not ( = ?auto_130468 ?auto_130473 ) ) ( not ( = ?auto_130468 ?auto_130474 ) ) ( not ( = ?auto_130469 ?auto_130470 ) ) ( not ( = ?auto_130469 ?auto_130471 ) ) ( not ( = ?auto_130469 ?auto_130472 ) ) ( not ( = ?auto_130469 ?auto_130473 ) ) ( not ( = ?auto_130469 ?auto_130474 ) ) ( not ( = ?auto_130470 ?auto_130471 ) ) ( not ( = ?auto_130470 ?auto_130472 ) ) ( not ( = ?auto_130470 ?auto_130473 ) ) ( not ( = ?auto_130470 ?auto_130474 ) ) ( not ( = ?auto_130471 ?auto_130472 ) ) ( not ( = ?auto_130471 ?auto_130473 ) ) ( not ( = ?auto_130471 ?auto_130474 ) ) ( not ( = ?auto_130472 ?auto_130473 ) ) ( not ( = ?auto_130472 ?auto_130474 ) ) ( not ( = ?auto_130473 ?auto_130474 ) ) ( ON ?auto_130473 ?auto_130474 ) ( ON ?auto_130472 ?auto_130473 ) ( ON ?auto_130471 ?auto_130472 ) ( ON ?auto_130470 ?auto_130471 ) ( ON ?auto_130469 ?auto_130470 ) ( ON ?auto_130468 ?auto_130469 ) ( ON ?auto_130467 ?auto_130468 ) ( CLEAR ?auto_130465 ) ( ON ?auto_130466 ?auto_130467 ) ( CLEAR ?auto_130466 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_130464 ?auto_130465 ?auto_130466 )
      ( MAKE-11PILE ?auto_130464 ?auto_130465 ?auto_130466 ?auto_130467 ?auto_130468 ?auto_130469 ?auto_130470 ?auto_130471 ?auto_130472 ?auto_130473 ?auto_130474 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_130486 - BLOCK
      ?auto_130487 - BLOCK
      ?auto_130488 - BLOCK
      ?auto_130489 - BLOCK
      ?auto_130490 - BLOCK
      ?auto_130491 - BLOCK
      ?auto_130492 - BLOCK
      ?auto_130493 - BLOCK
      ?auto_130494 - BLOCK
      ?auto_130495 - BLOCK
      ?auto_130496 - BLOCK
    )
    :vars
    (
      ?auto_130497 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_130496 ?auto_130497 ) ( ON-TABLE ?auto_130486 ) ( not ( = ?auto_130486 ?auto_130487 ) ) ( not ( = ?auto_130486 ?auto_130488 ) ) ( not ( = ?auto_130486 ?auto_130489 ) ) ( not ( = ?auto_130486 ?auto_130490 ) ) ( not ( = ?auto_130486 ?auto_130491 ) ) ( not ( = ?auto_130486 ?auto_130492 ) ) ( not ( = ?auto_130486 ?auto_130493 ) ) ( not ( = ?auto_130486 ?auto_130494 ) ) ( not ( = ?auto_130486 ?auto_130495 ) ) ( not ( = ?auto_130486 ?auto_130496 ) ) ( not ( = ?auto_130486 ?auto_130497 ) ) ( not ( = ?auto_130487 ?auto_130488 ) ) ( not ( = ?auto_130487 ?auto_130489 ) ) ( not ( = ?auto_130487 ?auto_130490 ) ) ( not ( = ?auto_130487 ?auto_130491 ) ) ( not ( = ?auto_130487 ?auto_130492 ) ) ( not ( = ?auto_130487 ?auto_130493 ) ) ( not ( = ?auto_130487 ?auto_130494 ) ) ( not ( = ?auto_130487 ?auto_130495 ) ) ( not ( = ?auto_130487 ?auto_130496 ) ) ( not ( = ?auto_130487 ?auto_130497 ) ) ( not ( = ?auto_130488 ?auto_130489 ) ) ( not ( = ?auto_130488 ?auto_130490 ) ) ( not ( = ?auto_130488 ?auto_130491 ) ) ( not ( = ?auto_130488 ?auto_130492 ) ) ( not ( = ?auto_130488 ?auto_130493 ) ) ( not ( = ?auto_130488 ?auto_130494 ) ) ( not ( = ?auto_130488 ?auto_130495 ) ) ( not ( = ?auto_130488 ?auto_130496 ) ) ( not ( = ?auto_130488 ?auto_130497 ) ) ( not ( = ?auto_130489 ?auto_130490 ) ) ( not ( = ?auto_130489 ?auto_130491 ) ) ( not ( = ?auto_130489 ?auto_130492 ) ) ( not ( = ?auto_130489 ?auto_130493 ) ) ( not ( = ?auto_130489 ?auto_130494 ) ) ( not ( = ?auto_130489 ?auto_130495 ) ) ( not ( = ?auto_130489 ?auto_130496 ) ) ( not ( = ?auto_130489 ?auto_130497 ) ) ( not ( = ?auto_130490 ?auto_130491 ) ) ( not ( = ?auto_130490 ?auto_130492 ) ) ( not ( = ?auto_130490 ?auto_130493 ) ) ( not ( = ?auto_130490 ?auto_130494 ) ) ( not ( = ?auto_130490 ?auto_130495 ) ) ( not ( = ?auto_130490 ?auto_130496 ) ) ( not ( = ?auto_130490 ?auto_130497 ) ) ( not ( = ?auto_130491 ?auto_130492 ) ) ( not ( = ?auto_130491 ?auto_130493 ) ) ( not ( = ?auto_130491 ?auto_130494 ) ) ( not ( = ?auto_130491 ?auto_130495 ) ) ( not ( = ?auto_130491 ?auto_130496 ) ) ( not ( = ?auto_130491 ?auto_130497 ) ) ( not ( = ?auto_130492 ?auto_130493 ) ) ( not ( = ?auto_130492 ?auto_130494 ) ) ( not ( = ?auto_130492 ?auto_130495 ) ) ( not ( = ?auto_130492 ?auto_130496 ) ) ( not ( = ?auto_130492 ?auto_130497 ) ) ( not ( = ?auto_130493 ?auto_130494 ) ) ( not ( = ?auto_130493 ?auto_130495 ) ) ( not ( = ?auto_130493 ?auto_130496 ) ) ( not ( = ?auto_130493 ?auto_130497 ) ) ( not ( = ?auto_130494 ?auto_130495 ) ) ( not ( = ?auto_130494 ?auto_130496 ) ) ( not ( = ?auto_130494 ?auto_130497 ) ) ( not ( = ?auto_130495 ?auto_130496 ) ) ( not ( = ?auto_130495 ?auto_130497 ) ) ( not ( = ?auto_130496 ?auto_130497 ) ) ( ON ?auto_130495 ?auto_130496 ) ( ON ?auto_130494 ?auto_130495 ) ( ON ?auto_130493 ?auto_130494 ) ( ON ?auto_130492 ?auto_130493 ) ( ON ?auto_130491 ?auto_130492 ) ( ON ?auto_130490 ?auto_130491 ) ( ON ?auto_130489 ?auto_130490 ) ( ON ?auto_130488 ?auto_130489 ) ( CLEAR ?auto_130486 ) ( ON ?auto_130487 ?auto_130488 ) ( CLEAR ?auto_130487 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_130486 ?auto_130487 )
      ( MAKE-11PILE ?auto_130486 ?auto_130487 ?auto_130488 ?auto_130489 ?auto_130490 ?auto_130491 ?auto_130492 ?auto_130493 ?auto_130494 ?auto_130495 ?auto_130496 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_130509 - BLOCK
      ?auto_130510 - BLOCK
      ?auto_130511 - BLOCK
      ?auto_130512 - BLOCK
      ?auto_130513 - BLOCK
      ?auto_130514 - BLOCK
      ?auto_130515 - BLOCK
      ?auto_130516 - BLOCK
      ?auto_130517 - BLOCK
      ?auto_130518 - BLOCK
      ?auto_130519 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_130519 ) ( ON-TABLE ?auto_130509 ) ( not ( = ?auto_130509 ?auto_130510 ) ) ( not ( = ?auto_130509 ?auto_130511 ) ) ( not ( = ?auto_130509 ?auto_130512 ) ) ( not ( = ?auto_130509 ?auto_130513 ) ) ( not ( = ?auto_130509 ?auto_130514 ) ) ( not ( = ?auto_130509 ?auto_130515 ) ) ( not ( = ?auto_130509 ?auto_130516 ) ) ( not ( = ?auto_130509 ?auto_130517 ) ) ( not ( = ?auto_130509 ?auto_130518 ) ) ( not ( = ?auto_130509 ?auto_130519 ) ) ( not ( = ?auto_130510 ?auto_130511 ) ) ( not ( = ?auto_130510 ?auto_130512 ) ) ( not ( = ?auto_130510 ?auto_130513 ) ) ( not ( = ?auto_130510 ?auto_130514 ) ) ( not ( = ?auto_130510 ?auto_130515 ) ) ( not ( = ?auto_130510 ?auto_130516 ) ) ( not ( = ?auto_130510 ?auto_130517 ) ) ( not ( = ?auto_130510 ?auto_130518 ) ) ( not ( = ?auto_130510 ?auto_130519 ) ) ( not ( = ?auto_130511 ?auto_130512 ) ) ( not ( = ?auto_130511 ?auto_130513 ) ) ( not ( = ?auto_130511 ?auto_130514 ) ) ( not ( = ?auto_130511 ?auto_130515 ) ) ( not ( = ?auto_130511 ?auto_130516 ) ) ( not ( = ?auto_130511 ?auto_130517 ) ) ( not ( = ?auto_130511 ?auto_130518 ) ) ( not ( = ?auto_130511 ?auto_130519 ) ) ( not ( = ?auto_130512 ?auto_130513 ) ) ( not ( = ?auto_130512 ?auto_130514 ) ) ( not ( = ?auto_130512 ?auto_130515 ) ) ( not ( = ?auto_130512 ?auto_130516 ) ) ( not ( = ?auto_130512 ?auto_130517 ) ) ( not ( = ?auto_130512 ?auto_130518 ) ) ( not ( = ?auto_130512 ?auto_130519 ) ) ( not ( = ?auto_130513 ?auto_130514 ) ) ( not ( = ?auto_130513 ?auto_130515 ) ) ( not ( = ?auto_130513 ?auto_130516 ) ) ( not ( = ?auto_130513 ?auto_130517 ) ) ( not ( = ?auto_130513 ?auto_130518 ) ) ( not ( = ?auto_130513 ?auto_130519 ) ) ( not ( = ?auto_130514 ?auto_130515 ) ) ( not ( = ?auto_130514 ?auto_130516 ) ) ( not ( = ?auto_130514 ?auto_130517 ) ) ( not ( = ?auto_130514 ?auto_130518 ) ) ( not ( = ?auto_130514 ?auto_130519 ) ) ( not ( = ?auto_130515 ?auto_130516 ) ) ( not ( = ?auto_130515 ?auto_130517 ) ) ( not ( = ?auto_130515 ?auto_130518 ) ) ( not ( = ?auto_130515 ?auto_130519 ) ) ( not ( = ?auto_130516 ?auto_130517 ) ) ( not ( = ?auto_130516 ?auto_130518 ) ) ( not ( = ?auto_130516 ?auto_130519 ) ) ( not ( = ?auto_130517 ?auto_130518 ) ) ( not ( = ?auto_130517 ?auto_130519 ) ) ( not ( = ?auto_130518 ?auto_130519 ) ) ( ON ?auto_130518 ?auto_130519 ) ( ON ?auto_130517 ?auto_130518 ) ( ON ?auto_130516 ?auto_130517 ) ( ON ?auto_130515 ?auto_130516 ) ( ON ?auto_130514 ?auto_130515 ) ( ON ?auto_130513 ?auto_130514 ) ( ON ?auto_130512 ?auto_130513 ) ( ON ?auto_130511 ?auto_130512 ) ( CLEAR ?auto_130509 ) ( ON ?auto_130510 ?auto_130511 ) ( CLEAR ?auto_130510 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_130509 ?auto_130510 )
      ( MAKE-11PILE ?auto_130509 ?auto_130510 ?auto_130511 ?auto_130512 ?auto_130513 ?auto_130514 ?auto_130515 ?auto_130516 ?auto_130517 ?auto_130518 ?auto_130519 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_130531 - BLOCK
      ?auto_130532 - BLOCK
      ?auto_130533 - BLOCK
      ?auto_130534 - BLOCK
      ?auto_130535 - BLOCK
      ?auto_130536 - BLOCK
      ?auto_130537 - BLOCK
      ?auto_130538 - BLOCK
      ?auto_130539 - BLOCK
      ?auto_130540 - BLOCK
      ?auto_130541 - BLOCK
    )
    :vars
    (
      ?auto_130542 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_130541 ?auto_130542 ) ( not ( = ?auto_130531 ?auto_130532 ) ) ( not ( = ?auto_130531 ?auto_130533 ) ) ( not ( = ?auto_130531 ?auto_130534 ) ) ( not ( = ?auto_130531 ?auto_130535 ) ) ( not ( = ?auto_130531 ?auto_130536 ) ) ( not ( = ?auto_130531 ?auto_130537 ) ) ( not ( = ?auto_130531 ?auto_130538 ) ) ( not ( = ?auto_130531 ?auto_130539 ) ) ( not ( = ?auto_130531 ?auto_130540 ) ) ( not ( = ?auto_130531 ?auto_130541 ) ) ( not ( = ?auto_130531 ?auto_130542 ) ) ( not ( = ?auto_130532 ?auto_130533 ) ) ( not ( = ?auto_130532 ?auto_130534 ) ) ( not ( = ?auto_130532 ?auto_130535 ) ) ( not ( = ?auto_130532 ?auto_130536 ) ) ( not ( = ?auto_130532 ?auto_130537 ) ) ( not ( = ?auto_130532 ?auto_130538 ) ) ( not ( = ?auto_130532 ?auto_130539 ) ) ( not ( = ?auto_130532 ?auto_130540 ) ) ( not ( = ?auto_130532 ?auto_130541 ) ) ( not ( = ?auto_130532 ?auto_130542 ) ) ( not ( = ?auto_130533 ?auto_130534 ) ) ( not ( = ?auto_130533 ?auto_130535 ) ) ( not ( = ?auto_130533 ?auto_130536 ) ) ( not ( = ?auto_130533 ?auto_130537 ) ) ( not ( = ?auto_130533 ?auto_130538 ) ) ( not ( = ?auto_130533 ?auto_130539 ) ) ( not ( = ?auto_130533 ?auto_130540 ) ) ( not ( = ?auto_130533 ?auto_130541 ) ) ( not ( = ?auto_130533 ?auto_130542 ) ) ( not ( = ?auto_130534 ?auto_130535 ) ) ( not ( = ?auto_130534 ?auto_130536 ) ) ( not ( = ?auto_130534 ?auto_130537 ) ) ( not ( = ?auto_130534 ?auto_130538 ) ) ( not ( = ?auto_130534 ?auto_130539 ) ) ( not ( = ?auto_130534 ?auto_130540 ) ) ( not ( = ?auto_130534 ?auto_130541 ) ) ( not ( = ?auto_130534 ?auto_130542 ) ) ( not ( = ?auto_130535 ?auto_130536 ) ) ( not ( = ?auto_130535 ?auto_130537 ) ) ( not ( = ?auto_130535 ?auto_130538 ) ) ( not ( = ?auto_130535 ?auto_130539 ) ) ( not ( = ?auto_130535 ?auto_130540 ) ) ( not ( = ?auto_130535 ?auto_130541 ) ) ( not ( = ?auto_130535 ?auto_130542 ) ) ( not ( = ?auto_130536 ?auto_130537 ) ) ( not ( = ?auto_130536 ?auto_130538 ) ) ( not ( = ?auto_130536 ?auto_130539 ) ) ( not ( = ?auto_130536 ?auto_130540 ) ) ( not ( = ?auto_130536 ?auto_130541 ) ) ( not ( = ?auto_130536 ?auto_130542 ) ) ( not ( = ?auto_130537 ?auto_130538 ) ) ( not ( = ?auto_130537 ?auto_130539 ) ) ( not ( = ?auto_130537 ?auto_130540 ) ) ( not ( = ?auto_130537 ?auto_130541 ) ) ( not ( = ?auto_130537 ?auto_130542 ) ) ( not ( = ?auto_130538 ?auto_130539 ) ) ( not ( = ?auto_130538 ?auto_130540 ) ) ( not ( = ?auto_130538 ?auto_130541 ) ) ( not ( = ?auto_130538 ?auto_130542 ) ) ( not ( = ?auto_130539 ?auto_130540 ) ) ( not ( = ?auto_130539 ?auto_130541 ) ) ( not ( = ?auto_130539 ?auto_130542 ) ) ( not ( = ?auto_130540 ?auto_130541 ) ) ( not ( = ?auto_130540 ?auto_130542 ) ) ( not ( = ?auto_130541 ?auto_130542 ) ) ( ON ?auto_130540 ?auto_130541 ) ( ON ?auto_130539 ?auto_130540 ) ( ON ?auto_130538 ?auto_130539 ) ( ON ?auto_130537 ?auto_130538 ) ( ON ?auto_130536 ?auto_130537 ) ( ON ?auto_130535 ?auto_130536 ) ( ON ?auto_130534 ?auto_130535 ) ( ON ?auto_130533 ?auto_130534 ) ( ON ?auto_130532 ?auto_130533 ) ( ON ?auto_130531 ?auto_130532 ) ( CLEAR ?auto_130531 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_130531 )
      ( MAKE-11PILE ?auto_130531 ?auto_130532 ?auto_130533 ?auto_130534 ?auto_130535 ?auto_130536 ?auto_130537 ?auto_130538 ?auto_130539 ?auto_130540 ?auto_130541 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_130554 - BLOCK
      ?auto_130555 - BLOCK
      ?auto_130556 - BLOCK
      ?auto_130557 - BLOCK
      ?auto_130558 - BLOCK
      ?auto_130559 - BLOCK
      ?auto_130560 - BLOCK
      ?auto_130561 - BLOCK
      ?auto_130562 - BLOCK
      ?auto_130563 - BLOCK
      ?auto_130564 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_130564 ) ( not ( = ?auto_130554 ?auto_130555 ) ) ( not ( = ?auto_130554 ?auto_130556 ) ) ( not ( = ?auto_130554 ?auto_130557 ) ) ( not ( = ?auto_130554 ?auto_130558 ) ) ( not ( = ?auto_130554 ?auto_130559 ) ) ( not ( = ?auto_130554 ?auto_130560 ) ) ( not ( = ?auto_130554 ?auto_130561 ) ) ( not ( = ?auto_130554 ?auto_130562 ) ) ( not ( = ?auto_130554 ?auto_130563 ) ) ( not ( = ?auto_130554 ?auto_130564 ) ) ( not ( = ?auto_130555 ?auto_130556 ) ) ( not ( = ?auto_130555 ?auto_130557 ) ) ( not ( = ?auto_130555 ?auto_130558 ) ) ( not ( = ?auto_130555 ?auto_130559 ) ) ( not ( = ?auto_130555 ?auto_130560 ) ) ( not ( = ?auto_130555 ?auto_130561 ) ) ( not ( = ?auto_130555 ?auto_130562 ) ) ( not ( = ?auto_130555 ?auto_130563 ) ) ( not ( = ?auto_130555 ?auto_130564 ) ) ( not ( = ?auto_130556 ?auto_130557 ) ) ( not ( = ?auto_130556 ?auto_130558 ) ) ( not ( = ?auto_130556 ?auto_130559 ) ) ( not ( = ?auto_130556 ?auto_130560 ) ) ( not ( = ?auto_130556 ?auto_130561 ) ) ( not ( = ?auto_130556 ?auto_130562 ) ) ( not ( = ?auto_130556 ?auto_130563 ) ) ( not ( = ?auto_130556 ?auto_130564 ) ) ( not ( = ?auto_130557 ?auto_130558 ) ) ( not ( = ?auto_130557 ?auto_130559 ) ) ( not ( = ?auto_130557 ?auto_130560 ) ) ( not ( = ?auto_130557 ?auto_130561 ) ) ( not ( = ?auto_130557 ?auto_130562 ) ) ( not ( = ?auto_130557 ?auto_130563 ) ) ( not ( = ?auto_130557 ?auto_130564 ) ) ( not ( = ?auto_130558 ?auto_130559 ) ) ( not ( = ?auto_130558 ?auto_130560 ) ) ( not ( = ?auto_130558 ?auto_130561 ) ) ( not ( = ?auto_130558 ?auto_130562 ) ) ( not ( = ?auto_130558 ?auto_130563 ) ) ( not ( = ?auto_130558 ?auto_130564 ) ) ( not ( = ?auto_130559 ?auto_130560 ) ) ( not ( = ?auto_130559 ?auto_130561 ) ) ( not ( = ?auto_130559 ?auto_130562 ) ) ( not ( = ?auto_130559 ?auto_130563 ) ) ( not ( = ?auto_130559 ?auto_130564 ) ) ( not ( = ?auto_130560 ?auto_130561 ) ) ( not ( = ?auto_130560 ?auto_130562 ) ) ( not ( = ?auto_130560 ?auto_130563 ) ) ( not ( = ?auto_130560 ?auto_130564 ) ) ( not ( = ?auto_130561 ?auto_130562 ) ) ( not ( = ?auto_130561 ?auto_130563 ) ) ( not ( = ?auto_130561 ?auto_130564 ) ) ( not ( = ?auto_130562 ?auto_130563 ) ) ( not ( = ?auto_130562 ?auto_130564 ) ) ( not ( = ?auto_130563 ?auto_130564 ) ) ( ON ?auto_130563 ?auto_130564 ) ( ON ?auto_130562 ?auto_130563 ) ( ON ?auto_130561 ?auto_130562 ) ( ON ?auto_130560 ?auto_130561 ) ( ON ?auto_130559 ?auto_130560 ) ( ON ?auto_130558 ?auto_130559 ) ( ON ?auto_130557 ?auto_130558 ) ( ON ?auto_130556 ?auto_130557 ) ( ON ?auto_130555 ?auto_130556 ) ( ON ?auto_130554 ?auto_130555 ) ( CLEAR ?auto_130554 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_130554 )
      ( MAKE-11PILE ?auto_130554 ?auto_130555 ?auto_130556 ?auto_130557 ?auto_130558 ?auto_130559 ?auto_130560 ?auto_130561 ?auto_130562 ?auto_130563 ?auto_130564 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_130576 - BLOCK
      ?auto_130577 - BLOCK
      ?auto_130578 - BLOCK
      ?auto_130579 - BLOCK
      ?auto_130580 - BLOCK
      ?auto_130581 - BLOCK
      ?auto_130582 - BLOCK
      ?auto_130583 - BLOCK
      ?auto_130584 - BLOCK
      ?auto_130585 - BLOCK
      ?auto_130586 - BLOCK
    )
    :vars
    (
      ?auto_130587 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_130576 ?auto_130577 ) ) ( not ( = ?auto_130576 ?auto_130578 ) ) ( not ( = ?auto_130576 ?auto_130579 ) ) ( not ( = ?auto_130576 ?auto_130580 ) ) ( not ( = ?auto_130576 ?auto_130581 ) ) ( not ( = ?auto_130576 ?auto_130582 ) ) ( not ( = ?auto_130576 ?auto_130583 ) ) ( not ( = ?auto_130576 ?auto_130584 ) ) ( not ( = ?auto_130576 ?auto_130585 ) ) ( not ( = ?auto_130576 ?auto_130586 ) ) ( not ( = ?auto_130577 ?auto_130578 ) ) ( not ( = ?auto_130577 ?auto_130579 ) ) ( not ( = ?auto_130577 ?auto_130580 ) ) ( not ( = ?auto_130577 ?auto_130581 ) ) ( not ( = ?auto_130577 ?auto_130582 ) ) ( not ( = ?auto_130577 ?auto_130583 ) ) ( not ( = ?auto_130577 ?auto_130584 ) ) ( not ( = ?auto_130577 ?auto_130585 ) ) ( not ( = ?auto_130577 ?auto_130586 ) ) ( not ( = ?auto_130578 ?auto_130579 ) ) ( not ( = ?auto_130578 ?auto_130580 ) ) ( not ( = ?auto_130578 ?auto_130581 ) ) ( not ( = ?auto_130578 ?auto_130582 ) ) ( not ( = ?auto_130578 ?auto_130583 ) ) ( not ( = ?auto_130578 ?auto_130584 ) ) ( not ( = ?auto_130578 ?auto_130585 ) ) ( not ( = ?auto_130578 ?auto_130586 ) ) ( not ( = ?auto_130579 ?auto_130580 ) ) ( not ( = ?auto_130579 ?auto_130581 ) ) ( not ( = ?auto_130579 ?auto_130582 ) ) ( not ( = ?auto_130579 ?auto_130583 ) ) ( not ( = ?auto_130579 ?auto_130584 ) ) ( not ( = ?auto_130579 ?auto_130585 ) ) ( not ( = ?auto_130579 ?auto_130586 ) ) ( not ( = ?auto_130580 ?auto_130581 ) ) ( not ( = ?auto_130580 ?auto_130582 ) ) ( not ( = ?auto_130580 ?auto_130583 ) ) ( not ( = ?auto_130580 ?auto_130584 ) ) ( not ( = ?auto_130580 ?auto_130585 ) ) ( not ( = ?auto_130580 ?auto_130586 ) ) ( not ( = ?auto_130581 ?auto_130582 ) ) ( not ( = ?auto_130581 ?auto_130583 ) ) ( not ( = ?auto_130581 ?auto_130584 ) ) ( not ( = ?auto_130581 ?auto_130585 ) ) ( not ( = ?auto_130581 ?auto_130586 ) ) ( not ( = ?auto_130582 ?auto_130583 ) ) ( not ( = ?auto_130582 ?auto_130584 ) ) ( not ( = ?auto_130582 ?auto_130585 ) ) ( not ( = ?auto_130582 ?auto_130586 ) ) ( not ( = ?auto_130583 ?auto_130584 ) ) ( not ( = ?auto_130583 ?auto_130585 ) ) ( not ( = ?auto_130583 ?auto_130586 ) ) ( not ( = ?auto_130584 ?auto_130585 ) ) ( not ( = ?auto_130584 ?auto_130586 ) ) ( not ( = ?auto_130585 ?auto_130586 ) ) ( ON ?auto_130576 ?auto_130587 ) ( not ( = ?auto_130586 ?auto_130587 ) ) ( not ( = ?auto_130585 ?auto_130587 ) ) ( not ( = ?auto_130584 ?auto_130587 ) ) ( not ( = ?auto_130583 ?auto_130587 ) ) ( not ( = ?auto_130582 ?auto_130587 ) ) ( not ( = ?auto_130581 ?auto_130587 ) ) ( not ( = ?auto_130580 ?auto_130587 ) ) ( not ( = ?auto_130579 ?auto_130587 ) ) ( not ( = ?auto_130578 ?auto_130587 ) ) ( not ( = ?auto_130577 ?auto_130587 ) ) ( not ( = ?auto_130576 ?auto_130587 ) ) ( ON ?auto_130577 ?auto_130576 ) ( ON ?auto_130578 ?auto_130577 ) ( ON ?auto_130579 ?auto_130578 ) ( ON ?auto_130580 ?auto_130579 ) ( ON ?auto_130581 ?auto_130580 ) ( ON ?auto_130582 ?auto_130581 ) ( ON ?auto_130583 ?auto_130582 ) ( ON ?auto_130584 ?auto_130583 ) ( ON ?auto_130585 ?auto_130584 ) ( ON ?auto_130586 ?auto_130585 ) ( CLEAR ?auto_130586 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_130586 ?auto_130585 ?auto_130584 ?auto_130583 ?auto_130582 ?auto_130581 ?auto_130580 ?auto_130579 ?auto_130578 ?auto_130577 ?auto_130576 )
      ( MAKE-11PILE ?auto_130576 ?auto_130577 ?auto_130578 ?auto_130579 ?auto_130580 ?auto_130581 ?auto_130582 ?auto_130583 ?auto_130584 ?auto_130585 ?auto_130586 ) )
  )

)
