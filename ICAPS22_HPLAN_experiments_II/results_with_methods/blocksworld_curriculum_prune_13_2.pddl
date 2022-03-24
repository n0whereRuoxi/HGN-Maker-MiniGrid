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

