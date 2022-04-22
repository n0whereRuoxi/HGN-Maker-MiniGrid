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
      ?auto_836448 - BLOCK
    )
    :vars
    (
      ?auto_836449 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_836448 ?auto_836449 ) ( CLEAR ?auto_836448 ) ( HAND-EMPTY ) ( not ( = ?auto_836448 ?auto_836449 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_836448 ?auto_836449 )
      ( !PUTDOWN ?auto_836448 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_836455 - BLOCK
      ?auto_836456 - BLOCK
    )
    :vars
    (
      ?auto_836457 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_836455 ) ( ON ?auto_836456 ?auto_836457 ) ( CLEAR ?auto_836456 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_836455 ) ( not ( = ?auto_836455 ?auto_836456 ) ) ( not ( = ?auto_836455 ?auto_836457 ) ) ( not ( = ?auto_836456 ?auto_836457 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_836456 ?auto_836457 )
      ( !STACK ?auto_836456 ?auto_836455 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_836465 - BLOCK
      ?auto_836466 - BLOCK
    )
    :vars
    (
      ?auto_836467 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_836466 ?auto_836467 ) ( not ( = ?auto_836465 ?auto_836466 ) ) ( not ( = ?auto_836465 ?auto_836467 ) ) ( not ( = ?auto_836466 ?auto_836467 ) ) ( ON ?auto_836465 ?auto_836466 ) ( CLEAR ?auto_836465 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_836465 )
      ( MAKE-2PILE ?auto_836465 ?auto_836466 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_836476 - BLOCK
      ?auto_836477 - BLOCK
      ?auto_836478 - BLOCK
    )
    :vars
    (
      ?auto_836479 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_836477 ) ( ON ?auto_836478 ?auto_836479 ) ( CLEAR ?auto_836478 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_836476 ) ( ON ?auto_836477 ?auto_836476 ) ( not ( = ?auto_836476 ?auto_836477 ) ) ( not ( = ?auto_836476 ?auto_836478 ) ) ( not ( = ?auto_836476 ?auto_836479 ) ) ( not ( = ?auto_836477 ?auto_836478 ) ) ( not ( = ?auto_836477 ?auto_836479 ) ) ( not ( = ?auto_836478 ?auto_836479 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_836478 ?auto_836479 )
      ( !STACK ?auto_836478 ?auto_836477 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_836490 - BLOCK
      ?auto_836491 - BLOCK
      ?auto_836492 - BLOCK
    )
    :vars
    (
      ?auto_836493 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_836492 ?auto_836493 ) ( ON-TABLE ?auto_836490 ) ( not ( = ?auto_836490 ?auto_836491 ) ) ( not ( = ?auto_836490 ?auto_836492 ) ) ( not ( = ?auto_836490 ?auto_836493 ) ) ( not ( = ?auto_836491 ?auto_836492 ) ) ( not ( = ?auto_836491 ?auto_836493 ) ) ( not ( = ?auto_836492 ?auto_836493 ) ) ( CLEAR ?auto_836490 ) ( ON ?auto_836491 ?auto_836492 ) ( CLEAR ?auto_836491 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_836490 ?auto_836491 )
      ( MAKE-3PILE ?auto_836490 ?auto_836491 ?auto_836492 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_836504 - BLOCK
      ?auto_836505 - BLOCK
      ?auto_836506 - BLOCK
    )
    :vars
    (
      ?auto_836507 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_836506 ?auto_836507 ) ( not ( = ?auto_836504 ?auto_836505 ) ) ( not ( = ?auto_836504 ?auto_836506 ) ) ( not ( = ?auto_836504 ?auto_836507 ) ) ( not ( = ?auto_836505 ?auto_836506 ) ) ( not ( = ?auto_836505 ?auto_836507 ) ) ( not ( = ?auto_836506 ?auto_836507 ) ) ( ON ?auto_836505 ?auto_836506 ) ( ON ?auto_836504 ?auto_836505 ) ( CLEAR ?auto_836504 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_836504 )
      ( MAKE-3PILE ?auto_836504 ?auto_836505 ?auto_836506 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_836519 - BLOCK
      ?auto_836520 - BLOCK
      ?auto_836521 - BLOCK
      ?auto_836522 - BLOCK
    )
    :vars
    (
      ?auto_836523 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_836521 ) ( ON ?auto_836522 ?auto_836523 ) ( CLEAR ?auto_836522 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_836519 ) ( ON ?auto_836520 ?auto_836519 ) ( ON ?auto_836521 ?auto_836520 ) ( not ( = ?auto_836519 ?auto_836520 ) ) ( not ( = ?auto_836519 ?auto_836521 ) ) ( not ( = ?auto_836519 ?auto_836522 ) ) ( not ( = ?auto_836519 ?auto_836523 ) ) ( not ( = ?auto_836520 ?auto_836521 ) ) ( not ( = ?auto_836520 ?auto_836522 ) ) ( not ( = ?auto_836520 ?auto_836523 ) ) ( not ( = ?auto_836521 ?auto_836522 ) ) ( not ( = ?auto_836521 ?auto_836523 ) ) ( not ( = ?auto_836522 ?auto_836523 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_836522 ?auto_836523 )
      ( !STACK ?auto_836522 ?auto_836521 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_836537 - BLOCK
      ?auto_836538 - BLOCK
      ?auto_836539 - BLOCK
      ?auto_836540 - BLOCK
    )
    :vars
    (
      ?auto_836541 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_836540 ?auto_836541 ) ( ON-TABLE ?auto_836537 ) ( ON ?auto_836538 ?auto_836537 ) ( not ( = ?auto_836537 ?auto_836538 ) ) ( not ( = ?auto_836537 ?auto_836539 ) ) ( not ( = ?auto_836537 ?auto_836540 ) ) ( not ( = ?auto_836537 ?auto_836541 ) ) ( not ( = ?auto_836538 ?auto_836539 ) ) ( not ( = ?auto_836538 ?auto_836540 ) ) ( not ( = ?auto_836538 ?auto_836541 ) ) ( not ( = ?auto_836539 ?auto_836540 ) ) ( not ( = ?auto_836539 ?auto_836541 ) ) ( not ( = ?auto_836540 ?auto_836541 ) ) ( CLEAR ?auto_836538 ) ( ON ?auto_836539 ?auto_836540 ) ( CLEAR ?auto_836539 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_836537 ?auto_836538 ?auto_836539 )
      ( MAKE-4PILE ?auto_836537 ?auto_836538 ?auto_836539 ?auto_836540 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_836555 - BLOCK
      ?auto_836556 - BLOCK
      ?auto_836557 - BLOCK
      ?auto_836558 - BLOCK
    )
    :vars
    (
      ?auto_836559 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_836558 ?auto_836559 ) ( ON-TABLE ?auto_836555 ) ( not ( = ?auto_836555 ?auto_836556 ) ) ( not ( = ?auto_836555 ?auto_836557 ) ) ( not ( = ?auto_836555 ?auto_836558 ) ) ( not ( = ?auto_836555 ?auto_836559 ) ) ( not ( = ?auto_836556 ?auto_836557 ) ) ( not ( = ?auto_836556 ?auto_836558 ) ) ( not ( = ?auto_836556 ?auto_836559 ) ) ( not ( = ?auto_836557 ?auto_836558 ) ) ( not ( = ?auto_836557 ?auto_836559 ) ) ( not ( = ?auto_836558 ?auto_836559 ) ) ( ON ?auto_836557 ?auto_836558 ) ( CLEAR ?auto_836555 ) ( ON ?auto_836556 ?auto_836557 ) ( CLEAR ?auto_836556 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_836555 ?auto_836556 )
      ( MAKE-4PILE ?auto_836555 ?auto_836556 ?auto_836557 ?auto_836558 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_836573 - BLOCK
      ?auto_836574 - BLOCK
      ?auto_836575 - BLOCK
      ?auto_836576 - BLOCK
    )
    :vars
    (
      ?auto_836577 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_836576 ?auto_836577 ) ( not ( = ?auto_836573 ?auto_836574 ) ) ( not ( = ?auto_836573 ?auto_836575 ) ) ( not ( = ?auto_836573 ?auto_836576 ) ) ( not ( = ?auto_836573 ?auto_836577 ) ) ( not ( = ?auto_836574 ?auto_836575 ) ) ( not ( = ?auto_836574 ?auto_836576 ) ) ( not ( = ?auto_836574 ?auto_836577 ) ) ( not ( = ?auto_836575 ?auto_836576 ) ) ( not ( = ?auto_836575 ?auto_836577 ) ) ( not ( = ?auto_836576 ?auto_836577 ) ) ( ON ?auto_836575 ?auto_836576 ) ( ON ?auto_836574 ?auto_836575 ) ( ON ?auto_836573 ?auto_836574 ) ( CLEAR ?auto_836573 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_836573 )
      ( MAKE-4PILE ?auto_836573 ?auto_836574 ?auto_836575 ?auto_836576 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_836592 - BLOCK
      ?auto_836593 - BLOCK
      ?auto_836594 - BLOCK
      ?auto_836595 - BLOCK
      ?auto_836596 - BLOCK
    )
    :vars
    (
      ?auto_836597 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_836595 ) ( ON ?auto_836596 ?auto_836597 ) ( CLEAR ?auto_836596 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_836592 ) ( ON ?auto_836593 ?auto_836592 ) ( ON ?auto_836594 ?auto_836593 ) ( ON ?auto_836595 ?auto_836594 ) ( not ( = ?auto_836592 ?auto_836593 ) ) ( not ( = ?auto_836592 ?auto_836594 ) ) ( not ( = ?auto_836592 ?auto_836595 ) ) ( not ( = ?auto_836592 ?auto_836596 ) ) ( not ( = ?auto_836592 ?auto_836597 ) ) ( not ( = ?auto_836593 ?auto_836594 ) ) ( not ( = ?auto_836593 ?auto_836595 ) ) ( not ( = ?auto_836593 ?auto_836596 ) ) ( not ( = ?auto_836593 ?auto_836597 ) ) ( not ( = ?auto_836594 ?auto_836595 ) ) ( not ( = ?auto_836594 ?auto_836596 ) ) ( not ( = ?auto_836594 ?auto_836597 ) ) ( not ( = ?auto_836595 ?auto_836596 ) ) ( not ( = ?auto_836595 ?auto_836597 ) ) ( not ( = ?auto_836596 ?auto_836597 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_836596 ?auto_836597 )
      ( !STACK ?auto_836596 ?auto_836595 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_836614 - BLOCK
      ?auto_836615 - BLOCK
      ?auto_836616 - BLOCK
      ?auto_836617 - BLOCK
      ?auto_836618 - BLOCK
    )
    :vars
    (
      ?auto_836619 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_836618 ?auto_836619 ) ( ON-TABLE ?auto_836614 ) ( ON ?auto_836615 ?auto_836614 ) ( ON ?auto_836616 ?auto_836615 ) ( not ( = ?auto_836614 ?auto_836615 ) ) ( not ( = ?auto_836614 ?auto_836616 ) ) ( not ( = ?auto_836614 ?auto_836617 ) ) ( not ( = ?auto_836614 ?auto_836618 ) ) ( not ( = ?auto_836614 ?auto_836619 ) ) ( not ( = ?auto_836615 ?auto_836616 ) ) ( not ( = ?auto_836615 ?auto_836617 ) ) ( not ( = ?auto_836615 ?auto_836618 ) ) ( not ( = ?auto_836615 ?auto_836619 ) ) ( not ( = ?auto_836616 ?auto_836617 ) ) ( not ( = ?auto_836616 ?auto_836618 ) ) ( not ( = ?auto_836616 ?auto_836619 ) ) ( not ( = ?auto_836617 ?auto_836618 ) ) ( not ( = ?auto_836617 ?auto_836619 ) ) ( not ( = ?auto_836618 ?auto_836619 ) ) ( CLEAR ?auto_836616 ) ( ON ?auto_836617 ?auto_836618 ) ( CLEAR ?auto_836617 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_836614 ?auto_836615 ?auto_836616 ?auto_836617 )
      ( MAKE-5PILE ?auto_836614 ?auto_836615 ?auto_836616 ?auto_836617 ?auto_836618 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_836636 - BLOCK
      ?auto_836637 - BLOCK
      ?auto_836638 - BLOCK
      ?auto_836639 - BLOCK
      ?auto_836640 - BLOCK
    )
    :vars
    (
      ?auto_836641 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_836640 ?auto_836641 ) ( ON-TABLE ?auto_836636 ) ( ON ?auto_836637 ?auto_836636 ) ( not ( = ?auto_836636 ?auto_836637 ) ) ( not ( = ?auto_836636 ?auto_836638 ) ) ( not ( = ?auto_836636 ?auto_836639 ) ) ( not ( = ?auto_836636 ?auto_836640 ) ) ( not ( = ?auto_836636 ?auto_836641 ) ) ( not ( = ?auto_836637 ?auto_836638 ) ) ( not ( = ?auto_836637 ?auto_836639 ) ) ( not ( = ?auto_836637 ?auto_836640 ) ) ( not ( = ?auto_836637 ?auto_836641 ) ) ( not ( = ?auto_836638 ?auto_836639 ) ) ( not ( = ?auto_836638 ?auto_836640 ) ) ( not ( = ?auto_836638 ?auto_836641 ) ) ( not ( = ?auto_836639 ?auto_836640 ) ) ( not ( = ?auto_836639 ?auto_836641 ) ) ( not ( = ?auto_836640 ?auto_836641 ) ) ( ON ?auto_836639 ?auto_836640 ) ( CLEAR ?auto_836637 ) ( ON ?auto_836638 ?auto_836639 ) ( CLEAR ?auto_836638 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_836636 ?auto_836637 ?auto_836638 )
      ( MAKE-5PILE ?auto_836636 ?auto_836637 ?auto_836638 ?auto_836639 ?auto_836640 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_836658 - BLOCK
      ?auto_836659 - BLOCK
      ?auto_836660 - BLOCK
      ?auto_836661 - BLOCK
      ?auto_836662 - BLOCK
    )
    :vars
    (
      ?auto_836663 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_836662 ?auto_836663 ) ( ON-TABLE ?auto_836658 ) ( not ( = ?auto_836658 ?auto_836659 ) ) ( not ( = ?auto_836658 ?auto_836660 ) ) ( not ( = ?auto_836658 ?auto_836661 ) ) ( not ( = ?auto_836658 ?auto_836662 ) ) ( not ( = ?auto_836658 ?auto_836663 ) ) ( not ( = ?auto_836659 ?auto_836660 ) ) ( not ( = ?auto_836659 ?auto_836661 ) ) ( not ( = ?auto_836659 ?auto_836662 ) ) ( not ( = ?auto_836659 ?auto_836663 ) ) ( not ( = ?auto_836660 ?auto_836661 ) ) ( not ( = ?auto_836660 ?auto_836662 ) ) ( not ( = ?auto_836660 ?auto_836663 ) ) ( not ( = ?auto_836661 ?auto_836662 ) ) ( not ( = ?auto_836661 ?auto_836663 ) ) ( not ( = ?auto_836662 ?auto_836663 ) ) ( ON ?auto_836661 ?auto_836662 ) ( ON ?auto_836660 ?auto_836661 ) ( CLEAR ?auto_836658 ) ( ON ?auto_836659 ?auto_836660 ) ( CLEAR ?auto_836659 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_836658 ?auto_836659 )
      ( MAKE-5PILE ?auto_836658 ?auto_836659 ?auto_836660 ?auto_836661 ?auto_836662 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_836680 - BLOCK
      ?auto_836681 - BLOCK
      ?auto_836682 - BLOCK
      ?auto_836683 - BLOCK
      ?auto_836684 - BLOCK
    )
    :vars
    (
      ?auto_836685 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_836684 ?auto_836685 ) ( not ( = ?auto_836680 ?auto_836681 ) ) ( not ( = ?auto_836680 ?auto_836682 ) ) ( not ( = ?auto_836680 ?auto_836683 ) ) ( not ( = ?auto_836680 ?auto_836684 ) ) ( not ( = ?auto_836680 ?auto_836685 ) ) ( not ( = ?auto_836681 ?auto_836682 ) ) ( not ( = ?auto_836681 ?auto_836683 ) ) ( not ( = ?auto_836681 ?auto_836684 ) ) ( not ( = ?auto_836681 ?auto_836685 ) ) ( not ( = ?auto_836682 ?auto_836683 ) ) ( not ( = ?auto_836682 ?auto_836684 ) ) ( not ( = ?auto_836682 ?auto_836685 ) ) ( not ( = ?auto_836683 ?auto_836684 ) ) ( not ( = ?auto_836683 ?auto_836685 ) ) ( not ( = ?auto_836684 ?auto_836685 ) ) ( ON ?auto_836683 ?auto_836684 ) ( ON ?auto_836682 ?auto_836683 ) ( ON ?auto_836681 ?auto_836682 ) ( ON ?auto_836680 ?auto_836681 ) ( CLEAR ?auto_836680 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_836680 )
      ( MAKE-5PILE ?auto_836680 ?auto_836681 ?auto_836682 ?auto_836683 ?auto_836684 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_836703 - BLOCK
      ?auto_836704 - BLOCK
      ?auto_836705 - BLOCK
      ?auto_836706 - BLOCK
      ?auto_836707 - BLOCK
      ?auto_836708 - BLOCK
    )
    :vars
    (
      ?auto_836709 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_836707 ) ( ON ?auto_836708 ?auto_836709 ) ( CLEAR ?auto_836708 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_836703 ) ( ON ?auto_836704 ?auto_836703 ) ( ON ?auto_836705 ?auto_836704 ) ( ON ?auto_836706 ?auto_836705 ) ( ON ?auto_836707 ?auto_836706 ) ( not ( = ?auto_836703 ?auto_836704 ) ) ( not ( = ?auto_836703 ?auto_836705 ) ) ( not ( = ?auto_836703 ?auto_836706 ) ) ( not ( = ?auto_836703 ?auto_836707 ) ) ( not ( = ?auto_836703 ?auto_836708 ) ) ( not ( = ?auto_836703 ?auto_836709 ) ) ( not ( = ?auto_836704 ?auto_836705 ) ) ( not ( = ?auto_836704 ?auto_836706 ) ) ( not ( = ?auto_836704 ?auto_836707 ) ) ( not ( = ?auto_836704 ?auto_836708 ) ) ( not ( = ?auto_836704 ?auto_836709 ) ) ( not ( = ?auto_836705 ?auto_836706 ) ) ( not ( = ?auto_836705 ?auto_836707 ) ) ( not ( = ?auto_836705 ?auto_836708 ) ) ( not ( = ?auto_836705 ?auto_836709 ) ) ( not ( = ?auto_836706 ?auto_836707 ) ) ( not ( = ?auto_836706 ?auto_836708 ) ) ( not ( = ?auto_836706 ?auto_836709 ) ) ( not ( = ?auto_836707 ?auto_836708 ) ) ( not ( = ?auto_836707 ?auto_836709 ) ) ( not ( = ?auto_836708 ?auto_836709 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_836708 ?auto_836709 )
      ( !STACK ?auto_836708 ?auto_836707 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_836729 - BLOCK
      ?auto_836730 - BLOCK
      ?auto_836731 - BLOCK
      ?auto_836732 - BLOCK
      ?auto_836733 - BLOCK
      ?auto_836734 - BLOCK
    )
    :vars
    (
      ?auto_836735 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_836734 ?auto_836735 ) ( ON-TABLE ?auto_836729 ) ( ON ?auto_836730 ?auto_836729 ) ( ON ?auto_836731 ?auto_836730 ) ( ON ?auto_836732 ?auto_836731 ) ( not ( = ?auto_836729 ?auto_836730 ) ) ( not ( = ?auto_836729 ?auto_836731 ) ) ( not ( = ?auto_836729 ?auto_836732 ) ) ( not ( = ?auto_836729 ?auto_836733 ) ) ( not ( = ?auto_836729 ?auto_836734 ) ) ( not ( = ?auto_836729 ?auto_836735 ) ) ( not ( = ?auto_836730 ?auto_836731 ) ) ( not ( = ?auto_836730 ?auto_836732 ) ) ( not ( = ?auto_836730 ?auto_836733 ) ) ( not ( = ?auto_836730 ?auto_836734 ) ) ( not ( = ?auto_836730 ?auto_836735 ) ) ( not ( = ?auto_836731 ?auto_836732 ) ) ( not ( = ?auto_836731 ?auto_836733 ) ) ( not ( = ?auto_836731 ?auto_836734 ) ) ( not ( = ?auto_836731 ?auto_836735 ) ) ( not ( = ?auto_836732 ?auto_836733 ) ) ( not ( = ?auto_836732 ?auto_836734 ) ) ( not ( = ?auto_836732 ?auto_836735 ) ) ( not ( = ?auto_836733 ?auto_836734 ) ) ( not ( = ?auto_836733 ?auto_836735 ) ) ( not ( = ?auto_836734 ?auto_836735 ) ) ( CLEAR ?auto_836732 ) ( ON ?auto_836733 ?auto_836734 ) ( CLEAR ?auto_836733 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_836729 ?auto_836730 ?auto_836731 ?auto_836732 ?auto_836733 )
      ( MAKE-6PILE ?auto_836729 ?auto_836730 ?auto_836731 ?auto_836732 ?auto_836733 ?auto_836734 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_836755 - BLOCK
      ?auto_836756 - BLOCK
      ?auto_836757 - BLOCK
      ?auto_836758 - BLOCK
      ?auto_836759 - BLOCK
      ?auto_836760 - BLOCK
    )
    :vars
    (
      ?auto_836761 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_836760 ?auto_836761 ) ( ON-TABLE ?auto_836755 ) ( ON ?auto_836756 ?auto_836755 ) ( ON ?auto_836757 ?auto_836756 ) ( not ( = ?auto_836755 ?auto_836756 ) ) ( not ( = ?auto_836755 ?auto_836757 ) ) ( not ( = ?auto_836755 ?auto_836758 ) ) ( not ( = ?auto_836755 ?auto_836759 ) ) ( not ( = ?auto_836755 ?auto_836760 ) ) ( not ( = ?auto_836755 ?auto_836761 ) ) ( not ( = ?auto_836756 ?auto_836757 ) ) ( not ( = ?auto_836756 ?auto_836758 ) ) ( not ( = ?auto_836756 ?auto_836759 ) ) ( not ( = ?auto_836756 ?auto_836760 ) ) ( not ( = ?auto_836756 ?auto_836761 ) ) ( not ( = ?auto_836757 ?auto_836758 ) ) ( not ( = ?auto_836757 ?auto_836759 ) ) ( not ( = ?auto_836757 ?auto_836760 ) ) ( not ( = ?auto_836757 ?auto_836761 ) ) ( not ( = ?auto_836758 ?auto_836759 ) ) ( not ( = ?auto_836758 ?auto_836760 ) ) ( not ( = ?auto_836758 ?auto_836761 ) ) ( not ( = ?auto_836759 ?auto_836760 ) ) ( not ( = ?auto_836759 ?auto_836761 ) ) ( not ( = ?auto_836760 ?auto_836761 ) ) ( ON ?auto_836759 ?auto_836760 ) ( CLEAR ?auto_836757 ) ( ON ?auto_836758 ?auto_836759 ) ( CLEAR ?auto_836758 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_836755 ?auto_836756 ?auto_836757 ?auto_836758 )
      ( MAKE-6PILE ?auto_836755 ?auto_836756 ?auto_836757 ?auto_836758 ?auto_836759 ?auto_836760 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_836781 - BLOCK
      ?auto_836782 - BLOCK
      ?auto_836783 - BLOCK
      ?auto_836784 - BLOCK
      ?auto_836785 - BLOCK
      ?auto_836786 - BLOCK
    )
    :vars
    (
      ?auto_836787 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_836786 ?auto_836787 ) ( ON-TABLE ?auto_836781 ) ( ON ?auto_836782 ?auto_836781 ) ( not ( = ?auto_836781 ?auto_836782 ) ) ( not ( = ?auto_836781 ?auto_836783 ) ) ( not ( = ?auto_836781 ?auto_836784 ) ) ( not ( = ?auto_836781 ?auto_836785 ) ) ( not ( = ?auto_836781 ?auto_836786 ) ) ( not ( = ?auto_836781 ?auto_836787 ) ) ( not ( = ?auto_836782 ?auto_836783 ) ) ( not ( = ?auto_836782 ?auto_836784 ) ) ( not ( = ?auto_836782 ?auto_836785 ) ) ( not ( = ?auto_836782 ?auto_836786 ) ) ( not ( = ?auto_836782 ?auto_836787 ) ) ( not ( = ?auto_836783 ?auto_836784 ) ) ( not ( = ?auto_836783 ?auto_836785 ) ) ( not ( = ?auto_836783 ?auto_836786 ) ) ( not ( = ?auto_836783 ?auto_836787 ) ) ( not ( = ?auto_836784 ?auto_836785 ) ) ( not ( = ?auto_836784 ?auto_836786 ) ) ( not ( = ?auto_836784 ?auto_836787 ) ) ( not ( = ?auto_836785 ?auto_836786 ) ) ( not ( = ?auto_836785 ?auto_836787 ) ) ( not ( = ?auto_836786 ?auto_836787 ) ) ( ON ?auto_836785 ?auto_836786 ) ( ON ?auto_836784 ?auto_836785 ) ( CLEAR ?auto_836782 ) ( ON ?auto_836783 ?auto_836784 ) ( CLEAR ?auto_836783 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_836781 ?auto_836782 ?auto_836783 )
      ( MAKE-6PILE ?auto_836781 ?auto_836782 ?auto_836783 ?auto_836784 ?auto_836785 ?auto_836786 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_836807 - BLOCK
      ?auto_836808 - BLOCK
      ?auto_836809 - BLOCK
      ?auto_836810 - BLOCK
      ?auto_836811 - BLOCK
      ?auto_836812 - BLOCK
    )
    :vars
    (
      ?auto_836813 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_836812 ?auto_836813 ) ( ON-TABLE ?auto_836807 ) ( not ( = ?auto_836807 ?auto_836808 ) ) ( not ( = ?auto_836807 ?auto_836809 ) ) ( not ( = ?auto_836807 ?auto_836810 ) ) ( not ( = ?auto_836807 ?auto_836811 ) ) ( not ( = ?auto_836807 ?auto_836812 ) ) ( not ( = ?auto_836807 ?auto_836813 ) ) ( not ( = ?auto_836808 ?auto_836809 ) ) ( not ( = ?auto_836808 ?auto_836810 ) ) ( not ( = ?auto_836808 ?auto_836811 ) ) ( not ( = ?auto_836808 ?auto_836812 ) ) ( not ( = ?auto_836808 ?auto_836813 ) ) ( not ( = ?auto_836809 ?auto_836810 ) ) ( not ( = ?auto_836809 ?auto_836811 ) ) ( not ( = ?auto_836809 ?auto_836812 ) ) ( not ( = ?auto_836809 ?auto_836813 ) ) ( not ( = ?auto_836810 ?auto_836811 ) ) ( not ( = ?auto_836810 ?auto_836812 ) ) ( not ( = ?auto_836810 ?auto_836813 ) ) ( not ( = ?auto_836811 ?auto_836812 ) ) ( not ( = ?auto_836811 ?auto_836813 ) ) ( not ( = ?auto_836812 ?auto_836813 ) ) ( ON ?auto_836811 ?auto_836812 ) ( ON ?auto_836810 ?auto_836811 ) ( ON ?auto_836809 ?auto_836810 ) ( CLEAR ?auto_836807 ) ( ON ?auto_836808 ?auto_836809 ) ( CLEAR ?auto_836808 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_836807 ?auto_836808 )
      ( MAKE-6PILE ?auto_836807 ?auto_836808 ?auto_836809 ?auto_836810 ?auto_836811 ?auto_836812 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_836833 - BLOCK
      ?auto_836834 - BLOCK
      ?auto_836835 - BLOCK
      ?auto_836836 - BLOCK
      ?auto_836837 - BLOCK
      ?auto_836838 - BLOCK
    )
    :vars
    (
      ?auto_836839 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_836838 ?auto_836839 ) ( not ( = ?auto_836833 ?auto_836834 ) ) ( not ( = ?auto_836833 ?auto_836835 ) ) ( not ( = ?auto_836833 ?auto_836836 ) ) ( not ( = ?auto_836833 ?auto_836837 ) ) ( not ( = ?auto_836833 ?auto_836838 ) ) ( not ( = ?auto_836833 ?auto_836839 ) ) ( not ( = ?auto_836834 ?auto_836835 ) ) ( not ( = ?auto_836834 ?auto_836836 ) ) ( not ( = ?auto_836834 ?auto_836837 ) ) ( not ( = ?auto_836834 ?auto_836838 ) ) ( not ( = ?auto_836834 ?auto_836839 ) ) ( not ( = ?auto_836835 ?auto_836836 ) ) ( not ( = ?auto_836835 ?auto_836837 ) ) ( not ( = ?auto_836835 ?auto_836838 ) ) ( not ( = ?auto_836835 ?auto_836839 ) ) ( not ( = ?auto_836836 ?auto_836837 ) ) ( not ( = ?auto_836836 ?auto_836838 ) ) ( not ( = ?auto_836836 ?auto_836839 ) ) ( not ( = ?auto_836837 ?auto_836838 ) ) ( not ( = ?auto_836837 ?auto_836839 ) ) ( not ( = ?auto_836838 ?auto_836839 ) ) ( ON ?auto_836837 ?auto_836838 ) ( ON ?auto_836836 ?auto_836837 ) ( ON ?auto_836835 ?auto_836836 ) ( ON ?auto_836834 ?auto_836835 ) ( ON ?auto_836833 ?auto_836834 ) ( CLEAR ?auto_836833 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_836833 )
      ( MAKE-6PILE ?auto_836833 ?auto_836834 ?auto_836835 ?auto_836836 ?auto_836837 ?auto_836838 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_836860 - BLOCK
      ?auto_836861 - BLOCK
      ?auto_836862 - BLOCK
      ?auto_836863 - BLOCK
      ?auto_836864 - BLOCK
      ?auto_836865 - BLOCK
      ?auto_836866 - BLOCK
    )
    :vars
    (
      ?auto_836867 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_836865 ) ( ON ?auto_836866 ?auto_836867 ) ( CLEAR ?auto_836866 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_836860 ) ( ON ?auto_836861 ?auto_836860 ) ( ON ?auto_836862 ?auto_836861 ) ( ON ?auto_836863 ?auto_836862 ) ( ON ?auto_836864 ?auto_836863 ) ( ON ?auto_836865 ?auto_836864 ) ( not ( = ?auto_836860 ?auto_836861 ) ) ( not ( = ?auto_836860 ?auto_836862 ) ) ( not ( = ?auto_836860 ?auto_836863 ) ) ( not ( = ?auto_836860 ?auto_836864 ) ) ( not ( = ?auto_836860 ?auto_836865 ) ) ( not ( = ?auto_836860 ?auto_836866 ) ) ( not ( = ?auto_836860 ?auto_836867 ) ) ( not ( = ?auto_836861 ?auto_836862 ) ) ( not ( = ?auto_836861 ?auto_836863 ) ) ( not ( = ?auto_836861 ?auto_836864 ) ) ( not ( = ?auto_836861 ?auto_836865 ) ) ( not ( = ?auto_836861 ?auto_836866 ) ) ( not ( = ?auto_836861 ?auto_836867 ) ) ( not ( = ?auto_836862 ?auto_836863 ) ) ( not ( = ?auto_836862 ?auto_836864 ) ) ( not ( = ?auto_836862 ?auto_836865 ) ) ( not ( = ?auto_836862 ?auto_836866 ) ) ( not ( = ?auto_836862 ?auto_836867 ) ) ( not ( = ?auto_836863 ?auto_836864 ) ) ( not ( = ?auto_836863 ?auto_836865 ) ) ( not ( = ?auto_836863 ?auto_836866 ) ) ( not ( = ?auto_836863 ?auto_836867 ) ) ( not ( = ?auto_836864 ?auto_836865 ) ) ( not ( = ?auto_836864 ?auto_836866 ) ) ( not ( = ?auto_836864 ?auto_836867 ) ) ( not ( = ?auto_836865 ?auto_836866 ) ) ( not ( = ?auto_836865 ?auto_836867 ) ) ( not ( = ?auto_836866 ?auto_836867 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_836866 ?auto_836867 )
      ( !STACK ?auto_836866 ?auto_836865 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_836890 - BLOCK
      ?auto_836891 - BLOCK
      ?auto_836892 - BLOCK
      ?auto_836893 - BLOCK
      ?auto_836894 - BLOCK
      ?auto_836895 - BLOCK
      ?auto_836896 - BLOCK
    )
    :vars
    (
      ?auto_836897 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_836896 ?auto_836897 ) ( ON-TABLE ?auto_836890 ) ( ON ?auto_836891 ?auto_836890 ) ( ON ?auto_836892 ?auto_836891 ) ( ON ?auto_836893 ?auto_836892 ) ( ON ?auto_836894 ?auto_836893 ) ( not ( = ?auto_836890 ?auto_836891 ) ) ( not ( = ?auto_836890 ?auto_836892 ) ) ( not ( = ?auto_836890 ?auto_836893 ) ) ( not ( = ?auto_836890 ?auto_836894 ) ) ( not ( = ?auto_836890 ?auto_836895 ) ) ( not ( = ?auto_836890 ?auto_836896 ) ) ( not ( = ?auto_836890 ?auto_836897 ) ) ( not ( = ?auto_836891 ?auto_836892 ) ) ( not ( = ?auto_836891 ?auto_836893 ) ) ( not ( = ?auto_836891 ?auto_836894 ) ) ( not ( = ?auto_836891 ?auto_836895 ) ) ( not ( = ?auto_836891 ?auto_836896 ) ) ( not ( = ?auto_836891 ?auto_836897 ) ) ( not ( = ?auto_836892 ?auto_836893 ) ) ( not ( = ?auto_836892 ?auto_836894 ) ) ( not ( = ?auto_836892 ?auto_836895 ) ) ( not ( = ?auto_836892 ?auto_836896 ) ) ( not ( = ?auto_836892 ?auto_836897 ) ) ( not ( = ?auto_836893 ?auto_836894 ) ) ( not ( = ?auto_836893 ?auto_836895 ) ) ( not ( = ?auto_836893 ?auto_836896 ) ) ( not ( = ?auto_836893 ?auto_836897 ) ) ( not ( = ?auto_836894 ?auto_836895 ) ) ( not ( = ?auto_836894 ?auto_836896 ) ) ( not ( = ?auto_836894 ?auto_836897 ) ) ( not ( = ?auto_836895 ?auto_836896 ) ) ( not ( = ?auto_836895 ?auto_836897 ) ) ( not ( = ?auto_836896 ?auto_836897 ) ) ( CLEAR ?auto_836894 ) ( ON ?auto_836895 ?auto_836896 ) ( CLEAR ?auto_836895 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_836890 ?auto_836891 ?auto_836892 ?auto_836893 ?auto_836894 ?auto_836895 )
      ( MAKE-7PILE ?auto_836890 ?auto_836891 ?auto_836892 ?auto_836893 ?auto_836894 ?auto_836895 ?auto_836896 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_836920 - BLOCK
      ?auto_836921 - BLOCK
      ?auto_836922 - BLOCK
      ?auto_836923 - BLOCK
      ?auto_836924 - BLOCK
      ?auto_836925 - BLOCK
      ?auto_836926 - BLOCK
    )
    :vars
    (
      ?auto_836927 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_836926 ?auto_836927 ) ( ON-TABLE ?auto_836920 ) ( ON ?auto_836921 ?auto_836920 ) ( ON ?auto_836922 ?auto_836921 ) ( ON ?auto_836923 ?auto_836922 ) ( not ( = ?auto_836920 ?auto_836921 ) ) ( not ( = ?auto_836920 ?auto_836922 ) ) ( not ( = ?auto_836920 ?auto_836923 ) ) ( not ( = ?auto_836920 ?auto_836924 ) ) ( not ( = ?auto_836920 ?auto_836925 ) ) ( not ( = ?auto_836920 ?auto_836926 ) ) ( not ( = ?auto_836920 ?auto_836927 ) ) ( not ( = ?auto_836921 ?auto_836922 ) ) ( not ( = ?auto_836921 ?auto_836923 ) ) ( not ( = ?auto_836921 ?auto_836924 ) ) ( not ( = ?auto_836921 ?auto_836925 ) ) ( not ( = ?auto_836921 ?auto_836926 ) ) ( not ( = ?auto_836921 ?auto_836927 ) ) ( not ( = ?auto_836922 ?auto_836923 ) ) ( not ( = ?auto_836922 ?auto_836924 ) ) ( not ( = ?auto_836922 ?auto_836925 ) ) ( not ( = ?auto_836922 ?auto_836926 ) ) ( not ( = ?auto_836922 ?auto_836927 ) ) ( not ( = ?auto_836923 ?auto_836924 ) ) ( not ( = ?auto_836923 ?auto_836925 ) ) ( not ( = ?auto_836923 ?auto_836926 ) ) ( not ( = ?auto_836923 ?auto_836927 ) ) ( not ( = ?auto_836924 ?auto_836925 ) ) ( not ( = ?auto_836924 ?auto_836926 ) ) ( not ( = ?auto_836924 ?auto_836927 ) ) ( not ( = ?auto_836925 ?auto_836926 ) ) ( not ( = ?auto_836925 ?auto_836927 ) ) ( not ( = ?auto_836926 ?auto_836927 ) ) ( ON ?auto_836925 ?auto_836926 ) ( CLEAR ?auto_836923 ) ( ON ?auto_836924 ?auto_836925 ) ( CLEAR ?auto_836924 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_836920 ?auto_836921 ?auto_836922 ?auto_836923 ?auto_836924 )
      ( MAKE-7PILE ?auto_836920 ?auto_836921 ?auto_836922 ?auto_836923 ?auto_836924 ?auto_836925 ?auto_836926 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_836950 - BLOCK
      ?auto_836951 - BLOCK
      ?auto_836952 - BLOCK
      ?auto_836953 - BLOCK
      ?auto_836954 - BLOCK
      ?auto_836955 - BLOCK
      ?auto_836956 - BLOCK
    )
    :vars
    (
      ?auto_836957 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_836956 ?auto_836957 ) ( ON-TABLE ?auto_836950 ) ( ON ?auto_836951 ?auto_836950 ) ( ON ?auto_836952 ?auto_836951 ) ( not ( = ?auto_836950 ?auto_836951 ) ) ( not ( = ?auto_836950 ?auto_836952 ) ) ( not ( = ?auto_836950 ?auto_836953 ) ) ( not ( = ?auto_836950 ?auto_836954 ) ) ( not ( = ?auto_836950 ?auto_836955 ) ) ( not ( = ?auto_836950 ?auto_836956 ) ) ( not ( = ?auto_836950 ?auto_836957 ) ) ( not ( = ?auto_836951 ?auto_836952 ) ) ( not ( = ?auto_836951 ?auto_836953 ) ) ( not ( = ?auto_836951 ?auto_836954 ) ) ( not ( = ?auto_836951 ?auto_836955 ) ) ( not ( = ?auto_836951 ?auto_836956 ) ) ( not ( = ?auto_836951 ?auto_836957 ) ) ( not ( = ?auto_836952 ?auto_836953 ) ) ( not ( = ?auto_836952 ?auto_836954 ) ) ( not ( = ?auto_836952 ?auto_836955 ) ) ( not ( = ?auto_836952 ?auto_836956 ) ) ( not ( = ?auto_836952 ?auto_836957 ) ) ( not ( = ?auto_836953 ?auto_836954 ) ) ( not ( = ?auto_836953 ?auto_836955 ) ) ( not ( = ?auto_836953 ?auto_836956 ) ) ( not ( = ?auto_836953 ?auto_836957 ) ) ( not ( = ?auto_836954 ?auto_836955 ) ) ( not ( = ?auto_836954 ?auto_836956 ) ) ( not ( = ?auto_836954 ?auto_836957 ) ) ( not ( = ?auto_836955 ?auto_836956 ) ) ( not ( = ?auto_836955 ?auto_836957 ) ) ( not ( = ?auto_836956 ?auto_836957 ) ) ( ON ?auto_836955 ?auto_836956 ) ( ON ?auto_836954 ?auto_836955 ) ( CLEAR ?auto_836952 ) ( ON ?auto_836953 ?auto_836954 ) ( CLEAR ?auto_836953 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_836950 ?auto_836951 ?auto_836952 ?auto_836953 )
      ( MAKE-7PILE ?auto_836950 ?auto_836951 ?auto_836952 ?auto_836953 ?auto_836954 ?auto_836955 ?auto_836956 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_836980 - BLOCK
      ?auto_836981 - BLOCK
      ?auto_836982 - BLOCK
      ?auto_836983 - BLOCK
      ?auto_836984 - BLOCK
      ?auto_836985 - BLOCK
      ?auto_836986 - BLOCK
    )
    :vars
    (
      ?auto_836987 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_836986 ?auto_836987 ) ( ON-TABLE ?auto_836980 ) ( ON ?auto_836981 ?auto_836980 ) ( not ( = ?auto_836980 ?auto_836981 ) ) ( not ( = ?auto_836980 ?auto_836982 ) ) ( not ( = ?auto_836980 ?auto_836983 ) ) ( not ( = ?auto_836980 ?auto_836984 ) ) ( not ( = ?auto_836980 ?auto_836985 ) ) ( not ( = ?auto_836980 ?auto_836986 ) ) ( not ( = ?auto_836980 ?auto_836987 ) ) ( not ( = ?auto_836981 ?auto_836982 ) ) ( not ( = ?auto_836981 ?auto_836983 ) ) ( not ( = ?auto_836981 ?auto_836984 ) ) ( not ( = ?auto_836981 ?auto_836985 ) ) ( not ( = ?auto_836981 ?auto_836986 ) ) ( not ( = ?auto_836981 ?auto_836987 ) ) ( not ( = ?auto_836982 ?auto_836983 ) ) ( not ( = ?auto_836982 ?auto_836984 ) ) ( not ( = ?auto_836982 ?auto_836985 ) ) ( not ( = ?auto_836982 ?auto_836986 ) ) ( not ( = ?auto_836982 ?auto_836987 ) ) ( not ( = ?auto_836983 ?auto_836984 ) ) ( not ( = ?auto_836983 ?auto_836985 ) ) ( not ( = ?auto_836983 ?auto_836986 ) ) ( not ( = ?auto_836983 ?auto_836987 ) ) ( not ( = ?auto_836984 ?auto_836985 ) ) ( not ( = ?auto_836984 ?auto_836986 ) ) ( not ( = ?auto_836984 ?auto_836987 ) ) ( not ( = ?auto_836985 ?auto_836986 ) ) ( not ( = ?auto_836985 ?auto_836987 ) ) ( not ( = ?auto_836986 ?auto_836987 ) ) ( ON ?auto_836985 ?auto_836986 ) ( ON ?auto_836984 ?auto_836985 ) ( ON ?auto_836983 ?auto_836984 ) ( CLEAR ?auto_836981 ) ( ON ?auto_836982 ?auto_836983 ) ( CLEAR ?auto_836982 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_836980 ?auto_836981 ?auto_836982 )
      ( MAKE-7PILE ?auto_836980 ?auto_836981 ?auto_836982 ?auto_836983 ?auto_836984 ?auto_836985 ?auto_836986 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_837010 - BLOCK
      ?auto_837011 - BLOCK
      ?auto_837012 - BLOCK
      ?auto_837013 - BLOCK
      ?auto_837014 - BLOCK
      ?auto_837015 - BLOCK
      ?auto_837016 - BLOCK
    )
    :vars
    (
      ?auto_837017 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_837016 ?auto_837017 ) ( ON-TABLE ?auto_837010 ) ( not ( = ?auto_837010 ?auto_837011 ) ) ( not ( = ?auto_837010 ?auto_837012 ) ) ( not ( = ?auto_837010 ?auto_837013 ) ) ( not ( = ?auto_837010 ?auto_837014 ) ) ( not ( = ?auto_837010 ?auto_837015 ) ) ( not ( = ?auto_837010 ?auto_837016 ) ) ( not ( = ?auto_837010 ?auto_837017 ) ) ( not ( = ?auto_837011 ?auto_837012 ) ) ( not ( = ?auto_837011 ?auto_837013 ) ) ( not ( = ?auto_837011 ?auto_837014 ) ) ( not ( = ?auto_837011 ?auto_837015 ) ) ( not ( = ?auto_837011 ?auto_837016 ) ) ( not ( = ?auto_837011 ?auto_837017 ) ) ( not ( = ?auto_837012 ?auto_837013 ) ) ( not ( = ?auto_837012 ?auto_837014 ) ) ( not ( = ?auto_837012 ?auto_837015 ) ) ( not ( = ?auto_837012 ?auto_837016 ) ) ( not ( = ?auto_837012 ?auto_837017 ) ) ( not ( = ?auto_837013 ?auto_837014 ) ) ( not ( = ?auto_837013 ?auto_837015 ) ) ( not ( = ?auto_837013 ?auto_837016 ) ) ( not ( = ?auto_837013 ?auto_837017 ) ) ( not ( = ?auto_837014 ?auto_837015 ) ) ( not ( = ?auto_837014 ?auto_837016 ) ) ( not ( = ?auto_837014 ?auto_837017 ) ) ( not ( = ?auto_837015 ?auto_837016 ) ) ( not ( = ?auto_837015 ?auto_837017 ) ) ( not ( = ?auto_837016 ?auto_837017 ) ) ( ON ?auto_837015 ?auto_837016 ) ( ON ?auto_837014 ?auto_837015 ) ( ON ?auto_837013 ?auto_837014 ) ( ON ?auto_837012 ?auto_837013 ) ( CLEAR ?auto_837010 ) ( ON ?auto_837011 ?auto_837012 ) ( CLEAR ?auto_837011 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_837010 ?auto_837011 )
      ( MAKE-7PILE ?auto_837010 ?auto_837011 ?auto_837012 ?auto_837013 ?auto_837014 ?auto_837015 ?auto_837016 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_837040 - BLOCK
      ?auto_837041 - BLOCK
      ?auto_837042 - BLOCK
      ?auto_837043 - BLOCK
      ?auto_837044 - BLOCK
      ?auto_837045 - BLOCK
      ?auto_837046 - BLOCK
    )
    :vars
    (
      ?auto_837047 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_837046 ?auto_837047 ) ( not ( = ?auto_837040 ?auto_837041 ) ) ( not ( = ?auto_837040 ?auto_837042 ) ) ( not ( = ?auto_837040 ?auto_837043 ) ) ( not ( = ?auto_837040 ?auto_837044 ) ) ( not ( = ?auto_837040 ?auto_837045 ) ) ( not ( = ?auto_837040 ?auto_837046 ) ) ( not ( = ?auto_837040 ?auto_837047 ) ) ( not ( = ?auto_837041 ?auto_837042 ) ) ( not ( = ?auto_837041 ?auto_837043 ) ) ( not ( = ?auto_837041 ?auto_837044 ) ) ( not ( = ?auto_837041 ?auto_837045 ) ) ( not ( = ?auto_837041 ?auto_837046 ) ) ( not ( = ?auto_837041 ?auto_837047 ) ) ( not ( = ?auto_837042 ?auto_837043 ) ) ( not ( = ?auto_837042 ?auto_837044 ) ) ( not ( = ?auto_837042 ?auto_837045 ) ) ( not ( = ?auto_837042 ?auto_837046 ) ) ( not ( = ?auto_837042 ?auto_837047 ) ) ( not ( = ?auto_837043 ?auto_837044 ) ) ( not ( = ?auto_837043 ?auto_837045 ) ) ( not ( = ?auto_837043 ?auto_837046 ) ) ( not ( = ?auto_837043 ?auto_837047 ) ) ( not ( = ?auto_837044 ?auto_837045 ) ) ( not ( = ?auto_837044 ?auto_837046 ) ) ( not ( = ?auto_837044 ?auto_837047 ) ) ( not ( = ?auto_837045 ?auto_837046 ) ) ( not ( = ?auto_837045 ?auto_837047 ) ) ( not ( = ?auto_837046 ?auto_837047 ) ) ( ON ?auto_837045 ?auto_837046 ) ( ON ?auto_837044 ?auto_837045 ) ( ON ?auto_837043 ?auto_837044 ) ( ON ?auto_837042 ?auto_837043 ) ( ON ?auto_837041 ?auto_837042 ) ( ON ?auto_837040 ?auto_837041 ) ( CLEAR ?auto_837040 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_837040 )
      ( MAKE-7PILE ?auto_837040 ?auto_837041 ?auto_837042 ?auto_837043 ?auto_837044 ?auto_837045 ?auto_837046 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_837071 - BLOCK
      ?auto_837072 - BLOCK
      ?auto_837073 - BLOCK
      ?auto_837074 - BLOCK
      ?auto_837075 - BLOCK
      ?auto_837076 - BLOCK
      ?auto_837077 - BLOCK
      ?auto_837078 - BLOCK
    )
    :vars
    (
      ?auto_837079 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_837077 ) ( ON ?auto_837078 ?auto_837079 ) ( CLEAR ?auto_837078 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_837071 ) ( ON ?auto_837072 ?auto_837071 ) ( ON ?auto_837073 ?auto_837072 ) ( ON ?auto_837074 ?auto_837073 ) ( ON ?auto_837075 ?auto_837074 ) ( ON ?auto_837076 ?auto_837075 ) ( ON ?auto_837077 ?auto_837076 ) ( not ( = ?auto_837071 ?auto_837072 ) ) ( not ( = ?auto_837071 ?auto_837073 ) ) ( not ( = ?auto_837071 ?auto_837074 ) ) ( not ( = ?auto_837071 ?auto_837075 ) ) ( not ( = ?auto_837071 ?auto_837076 ) ) ( not ( = ?auto_837071 ?auto_837077 ) ) ( not ( = ?auto_837071 ?auto_837078 ) ) ( not ( = ?auto_837071 ?auto_837079 ) ) ( not ( = ?auto_837072 ?auto_837073 ) ) ( not ( = ?auto_837072 ?auto_837074 ) ) ( not ( = ?auto_837072 ?auto_837075 ) ) ( not ( = ?auto_837072 ?auto_837076 ) ) ( not ( = ?auto_837072 ?auto_837077 ) ) ( not ( = ?auto_837072 ?auto_837078 ) ) ( not ( = ?auto_837072 ?auto_837079 ) ) ( not ( = ?auto_837073 ?auto_837074 ) ) ( not ( = ?auto_837073 ?auto_837075 ) ) ( not ( = ?auto_837073 ?auto_837076 ) ) ( not ( = ?auto_837073 ?auto_837077 ) ) ( not ( = ?auto_837073 ?auto_837078 ) ) ( not ( = ?auto_837073 ?auto_837079 ) ) ( not ( = ?auto_837074 ?auto_837075 ) ) ( not ( = ?auto_837074 ?auto_837076 ) ) ( not ( = ?auto_837074 ?auto_837077 ) ) ( not ( = ?auto_837074 ?auto_837078 ) ) ( not ( = ?auto_837074 ?auto_837079 ) ) ( not ( = ?auto_837075 ?auto_837076 ) ) ( not ( = ?auto_837075 ?auto_837077 ) ) ( not ( = ?auto_837075 ?auto_837078 ) ) ( not ( = ?auto_837075 ?auto_837079 ) ) ( not ( = ?auto_837076 ?auto_837077 ) ) ( not ( = ?auto_837076 ?auto_837078 ) ) ( not ( = ?auto_837076 ?auto_837079 ) ) ( not ( = ?auto_837077 ?auto_837078 ) ) ( not ( = ?auto_837077 ?auto_837079 ) ) ( not ( = ?auto_837078 ?auto_837079 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_837078 ?auto_837079 )
      ( !STACK ?auto_837078 ?auto_837077 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_837105 - BLOCK
      ?auto_837106 - BLOCK
      ?auto_837107 - BLOCK
      ?auto_837108 - BLOCK
      ?auto_837109 - BLOCK
      ?auto_837110 - BLOCK
      ?auto_837111 - BLOCK
      ?auto_837112 - BLOCK
    )
    :vars
    (
      ?auto_837113 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_837112 ?auto_837113 ) ( ON-TABLE ?auto_837105 ) ( ON ?auto_837106 ?auto_837105 ) ( ON ?auto_837107 ?auto_837106 ) ( ON ?auto_837108 ?auto_837107 ) ( ON ?auto_837109 ?auto_837108 ) ( ON ?auto_837110 ?auto_837109 ) ( not ( = ?auto_837105 ?auto_837106 ) ) ( not ( = ?auto_837105 ?auto_837107 ) ) ( not ( = ?auto_837105 ?auto_837108 ) ) ( not ( = ?auto_837105 ?auto_837109 ) ) ( not ( = ?auto_837105 ?auto_837110 ) ) ( not ( = ?auto_837105 ?auto_837111 ) ) ( not ( = ?auto_837105 ?auto_837112 ) ) ( not ( = ?auto_837105 ?auto_837113 ) ) ( not ( = ?auto_837106 ?auto_837107 ) ) ( not ( = ?auto_837106 ?auto_837108 ) ) ( not ( = ?auto_837106 ?auto_837109 ) ) ( not ( = ?auto_837106 ?auto_837110 ) ) ( not ( = ?auto_837106 ?auto_837111 ) ) ( not ( = ?auto_837106 ?auto_837112 ) ) ( not ( = ?auto_837106 ?auto_837113 ) ) ( not ( = ?auto_837107 ?auto_837108 ) ) ( not ( = ?auto_837107 ?auto_837109 ) ) ( not ( = ?auto_837107 ?auto_837110 ) ) ( not ( = ?auto_837107 ?auto_837111 ) ) ( not ( = ?auto_837107 ?auto_837112 ) ) ( not ( = ?auto_837107 ?auto_837113 ) ) ( not ( = ?auto_837108 ?auto_837109 ) ) ( not ( = ?auto_837108 ?auto_837110 ) ) ( not ( = ?auto_837108 ?auto_837111 ) ) ( not ( = ?auto_837108 ?auto_837112 ) ) ( not ( = ?auto_837108 ?auto_837113 ) ) ( not ( = ?auto_837109 ?auto_837110 ) ) ( not ( = ?auto_837109 ?auto_837111 ) ) ( not ( = ?auto_837109 ?auto_837112 ) ) ( not ( = ?auto_837109 ?auto_837113 ) ) ( not ( = ?auto_837110 ?auto_837111 ) ) ( not ( = ?auto_837110 ?auto_837112 ) ) ( not ( = ?auto_837110 ?auto_837113 ) ) ( not ( = ?auto_837111 ?auto_837112 ) ) ( not ( = ?auto_837111 ?auto_837113 ) ) ( not ( = ?auto_837112 ?auto_837113 ) ) ( CLEAR ?auto_837110 ) ( ON ?auto_837111 ?auto_837112 ) ( CLEAR ?auto_837111 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_837105 ?auto_837106 ?auto_837107 ?auto_837108 ?auto_837109 ?auto_837110 ?auto_837111 )
      ( MAKE-8PILE ?auto_837105 ?auto_837106 ?auto_837107 ?auto_837108 ?auto_837109 ?auto_837110 ?auto_837111 ?auto_837112 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_837139 - BLOCK
      ?auto_837140 - BLOCK
      ?auto_837141 - BLOCK
      ?auto_837142 - BLOCK
      ?auto_837143 - BLOCK
      ?auto_837144 - BLOCK
      ?auto_837145 - BLOCK
      ?auto_837146 - BLOCK
    )
    :vars
    (
      ?auto_837147 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_837146 ?auto_837147 ) ( ON-TABLE ?auto_837139 ) ( ON ?auto_837140 ?auto_837139 ) ( ON ?auto_837141 ?auto_837140 ) ( ON ?auto_837142 ?auto_837141 ) ( ON ?auto_837143 ?auto_837142 ) ( not ( = ?auto_837139 ?auto_837140 ) ) ( not ( = ?auto_837139 ?auto_837141 ) ) ( not ( = ?auto_837139 ?auto_837142 ) ) ( not ( = ?auto_837139 ?auto_837143 ) ) ( not ( = ?auto_837139 ?auto_837144 ) ) ( not ( = ?auto_837139 ?auto_837145 ) ) ( not ( = ?auto_837139 ?auto_837146 ) ) ( not ( = ?auto_837139 ?auto_837147 ) ) ( not ( = ?auto_837140 ?auto_837141 ) ) ( not ( = ?auto_837140 ?auto_837142 ) ) ( not ( = ?auto_837140 ?auto_837143 ) ) ( not ( = ?auto_837140 ?auto_837144 ) ) ( not ( = ?auto_837140 ?auto_837145 ) ) ( not ( = ?auto_837140 ?auto_837146 ) ) ( not ( = ?auto_837140 ?auto_837147 ) ) ( not ( = ?auto_837141 ?auto_837142 ) ) ( not ( = ?auto_837141 ?auto_837143 ) ) ( not ( = ?auto_837141 ?auto_837144 ) ) ( not ( = ?auto_837141 ?auto_837145 ) ) ( not ( = ?auto_837141 ?auto_837146 ) ) ( not ( = ?auto_837141 ?auto_837147 ) ) ( not ( = ?auto_837142 ?auto_837143 ) ) ( not ( = ?auto_837142 ?auto_837144 ) ) ( not ( = ?auto_837142 ?auto_837145 ) ) ( not ( = ?auto_837142 ?auto_837146 ) ) ( not ( = ?auto_837142 ?auto_837147 ) ) ( not ( = ?auto_837143 ?auto_837144 ) ) ( not ( = ?auto_837143 ?auto_837145 ) ) ( not ( = ?auto_837143 ?auto_837146 ) ) ( not ( = ?auto_837143 ?auto_837147 ) ) ( not ( = ?auto_837144 ?auto_837145 ) ) ( not ( = ?auto_837144 ?auto_837146 ) ) ( not ( = ?auto_837144 ?auto_837147 ) ) ( not ( = ?auto_837145 ?auto_837146 ) ) ( not ( = ?auto_837145 ?auto_837147 ) ) ( not ( = ?auto_837146 ?auto_837147 ) ) ( ON ?auto_837145 ?auto_837146 ) ( CLEAR ?auto_837143 ) ( ON ?auto_837144 ?auto_837145 ) ( CLEAR ?auto_837144 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_837139 ?auto_837140 ?auto_837141 ?auto_837142 ?auto_837143 ?auto_837144 )
      ( MAKE-8PILE ?auto_837139 ?auto_837140 ?auto_837141 ?auto_837142 ?auto_837143 ?auto_837144 ?auto_837145 ?auto_837146 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_837173 - BLOCK
      ?auto_837174 - BLOCK
      ?auto_837175 - BLOCK
      ?auto_837176 - BLOCK
      ?auto_837177 - BLOCK
      ?auto_837178 - BLOCK
      ?auto_837179 - BLOCK
      ?auto_837180 - BLOCK
    )
    :vars
    (
      ?auto_837181 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_837180 ?auto_837181 ) ( ON-TABLE ?auto_837173 ) ( ON ?auto_837174 ?auto_837173 ) ( ON ?auto_837175 ?auto_837174 ) ( ON ?auto_837176 ?auto_837175 ) ( not ( = ?auto_837173 ?auto_837174 ) ) ( not ( = ?auto_837173 ?auto_837175 ) ) ( not ( = ?auto_837173 ?auto_837176 ) ) ( not ( = ?auto_837173 ?auto_837177 ) ) ( not ( = ?auto_837173 ?auto_837178 ) ) ( not ( = ?auto_837173 ?auto_837179 ) ) ( not ( = ?auto_837173 ?auto_837180 ) ) ( not ( = ?auto_837173 ?auto_837181 ) ) ( not ( = ?auto_837174 ?auto_837175 ) ) ( not ( = ?auto_837174 ?auto_837176 ) ) ( not ( = ?auto_837174 ?auto_837177 ) ) ( not ( = ?auto_837174 ?auto_837178 ) ) ( not ( = ?auto_837174 ?auto_837179 ) ) ( not ( = ?auto_837174 ?auto_837180 ) ) ( not ( = ?auto_837174 ?auto_837181 ) ) ( not ( = ?auto_837175 ?auto_837176 ) ) ( not ( = ?auto_837175 ?auto_837177 ) ) ( not ( = ?auto_837175 ?auto_837178 ) ) ( not ( = ?auto_837175 ?auto_837179 ) ) ( not ( = ?auto_837175 ?auto_837180 ) ) ( not ( = ?auto_837175 ?auto_837181 ) ) ( not ( = ?auto_837176 ?auto_837177 ) ) ( not ( = ?auto_837176 ?auto_837178 ) ) ( not ( = ?auto_837176 ?auto_837179 ) ) ( not ( = ?auto_837176 ?auto_837180 ) ) ( not ( = ?auto_837176 ?auto_837181 ) ) ( not ( = ?auto_837177 ?auto_837178 ) ) ( not ( = ?auto_837177 ?auto_837179 ) ) ( not ( = ?auto_837177 ?auto_837180 ) ) ( not ( = ?auto_837177 ?auto_837181 ) ) ( not ( = ?auto_837178 ?auto_837179 ) ) ( not ( = ?auto_837178 ?auto_837180 ) ) ( not ( = ?auto_837178 ?auto_837181 ) ) ( not ( = ?auto_837179 ?auto_837180 ) ) ( not ( = ?auto_837179 ?auto_837181 ) ) ( not ( = ?auto_837180 ?auto_837181 ) ) ( ON ?auto_837179 ?auto_837180 ) ( ON ?auto_837178 ?auto_837179 ) ( CLEAR ?auto_837176 ) ( ON ?auto_837177 ?auto_837178 ) ( CLEAR ?auto_837177 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_837173 ?auto_837174 ?auto_837175 ?auto_837176 ?auto_837177 )
      ( MAKE-8PILE ?auto_837173 ?auto_837174 ?auto_837175 ?auto_837176 ?auto_837177 ?auto_837178 ?auto_837179 ?auto_837180 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_837207 - BLOCK
      ?auto_837208 - BLOCK
      ?auto_837209 - BLOCK
      ?auto_837210 - BLOCK
      ?auto_837211 - BLOCK
      ?auto_837212 - BLOCK
      ?auto_837213 - BLOCK
      ?auto_837214 - BLOCK
    )
    :vars
    (
      ?auto_837215 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_837214 ?auto_837215 ) ( ON-TABLE ?auto_837207 ) ( ON ?auto_837208 ?auto_837207 ) ( ON ?auto_837209 ?auto_837208 ) ( not ( = ?auto_837207 ?auto_837208 ) ) ( not ( = ?auto_837207 ?auto_837209 ) ) ( not ( = ?auto_837207 ?auto_837210 ) ) ( not ( = ?auto_837207 ?auto_837211 ) ) ( not ( = ?auto_837207 ?auto_837212 ) ) ( not ( = ?auto_837207 ?auto_837213 ) ) ( not ( = ?auto_837207 ?auto_837214 ) ) ( not ( = ?auto_837207 ?auto_837215 ) ) ( not ( = ?auto_837208 ?auto_837209 ) ) ( not ( = ?auto_837208 ?auto_837210 ) ) ( not ( = ?auto_837208 ?auto_837211 ) ) ( not ( = ?auto_837208 ?auto_837212 ) ) ( not ( = ?auto_837208 ?auto_837213 ) ) ( not ( = ?auto_837208 ?auto_837214 ) ) ( not ( = ?auto_837208 ?auto_837215 ) ) ( not ( = ?auto_837209 ?auto_837210 ) ) ( not ( = ?auto_837209 ?auto_837211 ) ) ( not ( = ?auto_837209 ?auto_837212 ) ) ( not ( = ?auto_837209 ?auto_837213 ) ) ( not ( = ?auto_837209 ?auto_837214 ) ) ( not ( = ?auto_837209 ?auto_837215 ) ) ( not ( = ?auto_837210 ?auto_837211 ) ) ( not ( = ?auto_837210 ?auto_837212 ) ) ( not ( = ?auto_837210 ?auto_837213 ) ) ( not ( = ?auto_837210 ?auto_837214 ) ) ( not ( = ?auto_837210 ?auto_837215 ) ) ( not ( = ?auto_837211 ?auto_837212 ) ) ( not ( = ?auto_837211 ?auto_837213 ) ) ( not ( = ?auto_837211 ?auto_837214 ) ) ( not ( = ?auto_837211 ?auto_837215 ) ) ( not ( = ?auto_837212 ?auto_837213 ) ) ( not ( = ?auto_837212 ?auto_837214 ) ) ( not ( = ?auto_837212 ?auto_837215 ) ) ( not ( = ?auto_837213 ?auto_837214 ) ) ( not ( = ?auto_837213 ?auto_837215 ) ) ( not ( = ?auto_837214 ?auto_837215 ) ) ( ON ?auto_837213 ?auto_837214 ) ( ON ?auto_837212 ?auto_837213 ) ( ON ?auto_837211 ?auto_837212 ) ( CLEAR ?auto_837209 ) ( ON ?auto_837210 ?auto_837211 ) ( CLEAR ?auto_837210 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_837207 ?auto_837208 ?auto_837209 ?auto_837210 )
      ( MAKE-8PILE ?auto_837207 ?auto_837208 ?auto_837209 ?auto_837210 ?auto_837211 ?auto_837212 ?auto_837213 ?auto_837214 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_837241 - BLOCK
      ?auto_837242 - BLOCK
      ?auto_837243 - BLOCK
      ?auto_837244 - BLOCK
      ?auto_837245 - BLOCK
      ?auto_837246 - BLOCK
      ?auto_837247 - BLOCK
      ?auto_837248 - BLOCK
    )
    :vars
    (
      ?auto_837249 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_837248 ?auto_837249 ) ( ON-TABLE ?auto_837241 ) ( ON ?auto_837242 ?auto_837241 ) ( not ( = ?auto_837241 ?auto_837242 ) ) ( not ( = ?auto_837241 ?auto_837243 ) ) ( not ( = ?auto_837241 ?auto_837244 ) ) ( not ( = ?auto_837241 ?auto_837245 ) ) ( not ( = ?auto_837241 ?auto_837246 ) ) ( not ( = ?auto_837241 ?auto_837247 ) ) ( not ( = ?auto_837241 ?auto_837248 ) ) ( not ( = ?auto_837241 ?auto_837249 ) ) ( not ( = ?auto_837242 ?auto_837243 ) ) ( not ( = ?auto_837242 ?auto_837244 ) ) ( not ( = ?auto_837242 ?auto_837245 ) ) ( not ( = ?auto_837242 ?auto_837246 ) ) ( not ( = ?auto_837242 ?auto_837247 ) ) ( not ( = ?auto_837242 ?auto_837248 ) ) ( not ( = ?auto_837242 ?auto_837249 ) ) ( not ( = ?auto_837243 ?auto_837244 ) ) ( not ( = ?auto_837243 ?auto_837245 ) ) ( not ( = ?auto_837243 ?auto_837246 ) ) ( not ( = ?auto_837243 ?auto_837247 ) ) ( not ( = ?auto_837243 ?auto_837248 ) ) ( not ( = ?auto_837243 ?auto_837249 ) ) ( not ( = ?auto_837244 ?auto_837245 ) ) ( not ( = ?auto_837244 ?auto_837246 ) ) ( not ( = ?auto_837244 ?auto_837247 ) ) ( not ( = ?auto_837244 ?auto_837248 ) ) ( not ( = ?auto_837244 ?auto_837249 ) ) ( not ( = ?auto_837245 ?auto_837246 ) ) ( not ( = ?auto_837245 ?auto_837247 ) ) ( not ( = ?auto_837245 ?auto_837248 ) ) ( not ( = ?auto_837245 ?auto_837249 ) ) ( not ( = ?auto_837246 ?auto_837247 ) ) ( not ( = ?auto_837246 ?auto_837248 ) ) ( not ( = ?auto_837246 ?auto_837249 ) ) ( not ( = ?auto_837247 ?auto_837248 ) ) ( not ( = ?auto_837247 ?auto_837249 ) ) ( not ( = ?auto_837248 ?auto_837249 ) ) ( ON ?auto_837247 ?auto_837248 ) ( ON ?auto_837246 ?auto_837247 ) ( ON ?auto_837245 ?auto_837246 ) ( ON ?auto_837244 ?auto_837245 ) ( CLEAR ?auto_837242 ) ( ON ?auto_837243 ?auto_837244 ) ( CLEAR ?auto_837243 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_837241 ?auto_837242 ?auto_837243 )
      ( MAKE-8PILE ?auto_837241 ?auto_837242 ?auto_837243 ?auto_837244 ?auto_837245 ?auto_837246 ?auto_837247 ?auto_837248 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_837275 - BLOCK
      ?auto_837276 - BLOCK
      ?auto_837277 - BLOCK
      ?auto_837278 - BLOCK
      ?auto_837279 - BLOCK
      ?auto_837280 - BLOCK
      ?auto_837281 - BLOCK
      ?auto_837282 - BLOCK
    )
    :vars
    (
      ?auto_837283 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_837282 ?auto_837283 ) ( ON-TABLE ?auto_837275 ) ( not ( = ?auto_837275 ?auto_837276 ) ) ( not ( = ?auto_837275 ?auto_837277 ) ) ( not ( = ?auto_837275 ?auto_837278 ) ) ( not ( = ?auto_837275 ?auto_837279 ) ) ( not ( = ?auto_837275 ?auto_837280 ) ) ( not ( = ?auto_837275 ?auto_837281 ) ) ( not ( = ?auto_837275 ?auto_837282 ) ) ( not ( = ?auto_837275 ?auto_837283 ) ) ( not ( = ?auto_837276 ?auto_837277 ) ) ( not ( = ?auto_837276 ?auto_837278 ) ) ( not ( = ?auto_837276 ?auto_837279 ) ) ( not ( = ?auto_837276 ?auto_837280 ) ) ( not ( = ?auto_837276 ?auto_837281 ) ) ( not ( = ?auto_837276 ?auto_837282 ) ) ( not ( = ?auto_837276 ?auto_837283 ) ) ( not ( = ?auto_837277 ?auto_837278 ) ) ( not ( = ?auto_837277 ?auto_837279 ) ) ( not ( = ?auto_837277 ?auto_837280 ) ) ( not ( = ?auto_837277 ?auto_837281 ) ) ( not ( = ?auto_837277 ?auto_837282 ) ) ( not ( = ?auto_837277 ?auto_837283 ) ) ( not ( = ?auto_837278 ?auto_837279 ) ) ( not ( = ?auto_837278 ?auto_837280 ) ) ( not ( = ?auto_837278 ?auto_837281 ) ) ( not ( = ?auto_837278 ?auto_837282 ) ) ( not ( = ?auto_837278 ?auto_837283 ) ) ( not ( = ?auto_837279 ?auto_837280 ) ) ( not ( = ?auto_837279 ?auto_837281 ) ) ( not ( = ?auto_837279 ?auto_837282 ) ) ( not ( = ?auto_837279 ?auto_837283 ) ) ( not ( = ?auto_837280 ?auto_837281 ) ) ( not ( = ?auto_837280 ?auto_837282 ) ) ( not ( = ?auto_837280 ?auto_837283 ) ) ( not ( = ?auto_837281 ?auto_837282 ) ) ( not ( = ?auto_837281 ?auto_837283 ) ) ( not ( = ?auto_837282 ?auto_837283 ) ) ( ON ?auto_837281 ?auto_837282 ) ( ON ?auto_837280 ?auto_837281 ) ( ON ?auto_837279 ?auto_837280 ) ( ON ?auto_837278 ?auto_837279 ) ( ON ?auto_837277 ?auto_837278 ) ( CLEAR ?auto_837275 ) ( ON ?auto_837276 ?auto_837277 ) ( CLEAR ?auto_837276 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_837275 ?auto_837276 )
      ( MAKE-8PILE ?auto_837275 ?auto_837276 ?auto_837277 ?auto_837278 ?auto_837279 ?auto_837280 ?auto_837281 ?auto_837282 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_837309 - BLOCK
      ?auto_837310 - BLOCK
      ?auto_837311 - BLOCK
      ?auto_837312 - BLOCK
      ?auto_837313 - BLOCK
      ?auto_837314 - BLOCK
      ?auto_837315 - BLOCK
      ?auto_837316 - BLOCK
    )
    :vars
    (
      ?auto_837317 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_837316 ?auto_837317 ) ( not ( = ?auto_837309 ?auto_837310 ) ) ( not ( = ?auto_837309 ?auto_837311 ) ) ( not ( = ?auto_837309 ?auto_837312 ) ) ( not ( = ?auto_837309 ?auto_837313 ) ) ( not ( = ?auto_837309 ?auto_837314 ) ) ( not ( = ?auto_837309 ?auto_837315 ) ) ( not ( = ?auto_837309 ?auto_837316 ) ) ( not ( = ?auto_837309 ?auto_837317 ) ) ( not ( = ?auto_837310 ?auto_837311 ) ) ( not ( = ?auto_837310 ?auto_837312 ) ) ( not ( = ?auto_837310 ?auto_837313 ) ) ( not ( = ?auto_837310 ?auto_837314 ) ) ( not ( = ?auto_837310 ?auto_837315 ) ) ( not ( = ?auto_837310 ?auto_837316 ) ) ( not ( = ?auto_837310 ?auto_837317 ) ) ( not ( = ?auto_837311 ?auto_837312 ) ) ( not ( = ?auto_837311 ?auto_837313 ) ) ( not ( = ?auto_837311 ?auto_837314 ) ) ( not ( = ?auto_837311 ?auto_837315 ) ) ( not ( = ?auto_837311 ?auto_837316 ) ) ( not ( = ?auto_837311 ?auto_837317 ) ) ( not ( = ?auto_837312 ?auto_837313 ) ) ( not ( = ?auto_837312 ?auto_837314 ) ) ( not ( = ?auto_837312 ?auto_837315 ) ) ( not ( = ?auto_837312 ?auto_837316 ) ) ( not ( = ?auto_837312 ?auto_837317 ) ) ( not ( = ?auto_837313 ?auto_837314 ) ) ( not ( = ?auto_837313 ?auto_837315 ) ) ( not ( = ?auto_837313 ?auto_837316 ) ) ( not ( = ?auto_837313 ?auto_837317 ) ) ( not ( = ?auto_837314 ?auto_837315 ) ) ( not ( = ?auto_837314 ?auto_837316 ) ) ( not ( = ?auto_837314 ?auto_837317 ) ) ( not ( = ?auto_837315 ?auto_837316 ) ) ( not ( = ?auto_837315 ?auto_837317 ) ) ( not ( = ?auto_837316 ?auto_837317 ) ) ( ON ?auto_837315 ?auto_837316 ) ( ON ?auto_837314 ?auto_837315 ) ( ON ?auto_837313 ?auto_837314 ) ( ON ?auto_837312 ?auto_837313 ) ( ON ?auto_837311 ?auto_837312 ) ( ON ?auto_837310 ?auto_837311 ) ( ON ?auto_837309 ?auto_837310 ) ( CLEAR ?auto_837309 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_837309 )
      ( MAKE-8PILE ?auto_837309 ?auto_837310 ?auto_837311 ?auto_837312 ?auto_837313 ?auto_837314 ?auto_837315 ?auto_837316 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_837344 - BLOCK
      ?auto_837345 - BLOCK
      ?auto_837346 - BLOCK
      ?auto_837347 - BLOCK
      ?auto_837348 - BLOCK
      ?auto_837349 - BLOCK
      ?auto_837350 - BLOCK
      ?auto_837351 - BLOCK
      ?auto_837352 - BLOCK
    )
    :vars
    (
      ?auto_837353 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_837351 ) ( ON ?auto_837352 ?auto_837353 ) ( CLEAR ?auto_837352 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_837344 ) ( ON ?auto_837345 ?auto_837344 ) ( ON ?auto_837346 ?auto_837345 ) ( ON ?auto_837347 ?auto_837346 ) ( ON ?auto_837348 ?auto_837347 ) ( ON ?auto_837349 ?auto_837348 ) ( ON ?auto_837350 ?auto_837349 ) ( ON ?auto_837351 ?auto_837350 ) ( not ( = ?auto_837344 ?auto_837345 ) ) ( not ( = ?auto_837344 ?auto_837346 ) ) ( not ( = ?auto_837344 ?auto_837347 ) ) ( not ( = ?auto_837344 ?auto_837348 ) ) ( not ( = ?auto_837344 ?auto_837349 ) ) ( not ( = ?auto_837344 ?auto_837350 ) ) ( not ( = ?auto_837344 ?auto_837351 ) ) ( not ( = ?auto_837344 ?auto_837352 ) ) ( not ( = ?auto_837344 ?auto_837353 ) ) ( not ( = ?auto_837345 ?auto_837346 ) ) ( not ( = ?auto_837345 ?auto_837347 ) ) ( not ( = ?auto_837345 ?auto_837348 ) ) ( not ( = ?auto_837345 ?auto_837349 ) ) ( not ( = ?auto_837345 ?auto_837350 ) ) ( not ( = ?auto_837345 ?auto_837351 ) ) ( not ( = ?auto_837345 ?auto_837352 ) ) ( not ( = ?auto_837345 ?auto_837353 ) ) ( not ( = ?auto_837346 ?auto_837347 ) ) ( not ( = ?auto_837346 ?auto_837348 ) ) ( not ( = ?auto_837346 ?auto_837349 ) ) ( not ( = ?auto_837346 ?auto_837350 ) ) ( not ( = ?auto_837346 ?auto_837351 ) ) ( not ( = ?auto_837346 ?auto_837352 ) ) ( not ( = ?auto_837346 ?auto_837353 ) ) ( not ( = ?auto_837347 ?auto_837348 ) ) ( not ( = ?auto_837347 ?auto_837349 ) ) ( not ( = ?auto_837347 ?auto_837350 ) ) ( not ( = ?auto_837347 ?auto_837351 ) ) ( not ( = ?auto_837347 ?auto_837352 ) ) ( not ( = ?auto_837347 ?auto_837353 ) ) ( not ( = ?auto_837348 ?auto_837349 ) ) ( not ( = ?auto_837348 ?auto_837350 ) ) ( not ( = ?auto_837348 ?auto_837351 ) ) ( not ( = ?auto_837348 ?auto_837352 ) ) ( not ( = ?auto_837348 ?auto_837353 ) ) ( not ( = ?auto_837349 ?auto_837350 ) ) ( not ( = ?auto_837349 ?auto_837351 ) ) ( not ( = ?auto_837349 ?auto_837352 ) ) ( not ( = ?auto_837349 ?auto_837353 ) ) ( not ( = ?auto_837350 ?auto_837351 ) ) ( not ( = ?auto_837350 ?auto_837352 ) ) ( not ( = ?auto_837350 ?auto_837353 ) ) ( not ( = ?auto_837351 ?auto_837352 ) ) ( not ( = ?auto_837351 ?auto_837353 ) ) ( not ( = ?auto_837352 ?auto_837353 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_837352 ?auto_837353 )
      ( !STACK ?auto_837352 ?auto_837351 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_837382 - BLOCK
      ?auto_837383 - BLOCK
      ?auto_837384 - BLOCK
      ?auto_837385 - BLOCK
      ?auto_837386 - BLOCK
      ?auto_837387 - BLOCK
      ?auto_837388 - BLOCK
      ?auto_837389 - BLOCK
      ?auto_837390 - BLOCK
    )
    :vars
    (
      ?auto_837391 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_837390 ?auto_837391 ) ( ON-TABLE ?auto_837382 ) ( ON ?auto_837383 ?auto_837382 ) ( ON ?auto_837384 ?auto_837383 ) ( ON ?auto_837385 ?auto_837384 ) ( ON ?auto_837386 ?auto_837385 ) ( ON ?auto_837387 ?auto_837386 ) ( ON ?auto_837388 ?auto_837387 ) ( not ( = ?auto_837382 ?auto_837383 ) ) ( not ( = ?auto_837382 ?auto_837384 ) ) ( not ( = ?auto_837382 ?auto_837385 ) ) ( not ( = ?auto_837382 ?auto_837386 ) ) ( not ( = ?auto_837382 ?auto_837387 ) ) ( not ( = ?auto_837382 ?auto_837388 ) ) ( not ( = ?auto_837382 ?auto_837389 ) ) ( not ( = ?auto_837382 ?auto_837390 ) ) ( not ( = ?auto_837382 ?auto_837391 ) ) ( not ( = ?auto_837383 ?auto_837384 ) ) ( not ( = ?auto_837383 ?auto_837385 ) ) ( not ( = ?auto_837383 ?auto_837386 ) ) ( not ( = ?auto_837383 ?auto_837387 ) ) ( not ( = ?auto_837383 ?auto_837388 ) ) ( not ( = ?auto_837383 ?auto_837389 ) ) ( not ( = ?auto_837383 ?auto_837390 ) ) ( not ( = ?auto_837383 ?auto_837391 ) ) ( not ( = ?auto_837384 ?auto_837385 ) ) ( not ( = ?auto_837384 ?auto_837386 ) ) ( not ( = ?auto_837384 ?auto_837387 ) ) ( not ( = ?auto_837384 ?auto_837388 ) ) ( not ( = ?auto_837384 ?auto_837389 ) ) ( not ( = ?auto_837384 ?auto_837390 ) ) ( not ( = ?auto_837384 ?auto_837391 ) ) ( not ( = ?auto_837385 ?auto_837386 ) ) ( not ( = ?auto_837385 ?auto_837387 ) ) ( not ( = ?auto_837385 ?auto_837388 ) ) ( not ( = ?auto_837385 ?auto_837389 ) ) ( not ( = ?auto_837385 ?auto_837390 ) ) ( not ( = ?auto_837385 ?auto_837391 ) ) ( not ( = ?auto_837386 ?auto_837387 ) ) ( not ( = ?auto_837386 ?auto_837388 ) ) ( not ( = ?auto_837386 ?auto_837389 ) ) ( not ( = ?auto_837386 ?auto_837390 ) ) ( not ( = ?auto_837386 ?auto_837391 ) ) ( not ( = ?auto_837387 ?auto_837388 ) ) ( not ( = ?auto_837387 ?auto_837389 ) ) ( not ( = ?auto_837387 ?auto_837390 ) ) ( not ( = ?auto_837387 ?auto_837391 ) ) ( not ( = ?auto_837388 ?auto_837389 ) ) ( not ( = ?auto_837388 ?auto_837390 ) ) ( not ( = ?auto_837388 ?auto_837391 ) ) ( not ( = ?auto_837389 ?auto_837390 ) ) ( not ( = ?auto_837389 ?auto_837391 ) ) ( not ( = ?auto_837390 ?auto_837391 ) ) ( CLEAR ?auto_837388 ) ( ON ?auto_837389 ?auto_837390 ) ( CLEAR ?auto_837389 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_837382 ?auto_837383 ?auto_837384 ?auto_837385 ?auto_837386 ?auto_837387 ?auto_837388 ?auto_837389 )
      ( MAKE-9PILE ?auto_837382 ?auto_837383 ?auto_837384 ?auto_837385 ?auto_837386 ?auto_837387 ?auto_837388 ?auto_837389 ?auto_837390 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_837420 - BLOCK
      ?auto_837421 - BLOCK
      ?auto_837422 - BLOCK
      ?auto_837423 - BLOCK
      ?auto_837424 - BLOCK
      ?auto_837425 - BLOCK
      ?auto_837426 - BLOCK
      ?auto_837427 - BLOCK
      ?auto_837428 - BLOCK
    )
    :vars
    (
      ?auto_837429 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_837428 ?auto_837429 ) ( ON-TABLE ?auto_837420 ) ( ON ?auto_837421 ?auto_837420 ) ( ON ?auto_837422 ?auto_837421 ) ( ON ?auto_837423 ?auto_837422 ) ( ON ?auto_837424 ?auto_837423 ) ( ON ?auto_837425 ?auto_837424 ) ( not ( = ?auto_837420 ?auto_837421 ) ) ( not ( = ?auto_837420 ?auto_837422 ) ) ( not ( = ?auto_837420 ?auto_837423 ) ) ( not ( = ?auto_837420 ?auto_837424 ) ) ( not ( = ?auto_837420 ?auto_837425 ) ) ( not ( = ?auto_837420 ?auto_837426 ) ) ( not ( = ?auto_837420 ?auto_837427 ) ) ( not ( = ?auto_837420 ?auto_837428 ) ) ( not ( = ?auto_837420 ?auto_837429 ) ) ( not ( = ?auto_837421 ?auto_837422 ) ) ( not ( = ?auto_837421 ?auto_837423 ) ) ( not ( = ?auto_837421 ?auto_837424 ) ) ( not ( = ?auto_837421 ?auto_837425 ) ) ( not ( = ?auto_837421 ?auto_837426 ) ) ( not ( = ?auto_837421 ?auto_837427 ) ) ( not ( = ?auto_837421 ?auto_837428 ) ) ( not ( = ?auto_837421 ?auto_837429 ) ) ( not ( = ?auto_837422 ?auto_837423 ) ) ( not ( = ?auto_837422 ?auto_837424 ) ) ( not ( = ?auto_837422 ?auto_837425 ) ) ( not ( = ?auto_837422 ?auto_837426 ) ) ( not ( = ?auto_837422 ?auto_837427 ) ) ( not ( = ?auto_837422 ?auto_837428 ) ) ( not ( = ?auto_837422 ?auto_837429 ) ) ( not ( = ?auto_837423 ?auto_837424 ) ) ( not ( = ?auto_837423 ?auto_837425 ) ) ( not ( = ?auto_837423 ?auto_837426 ) ) ( not ( = ?auto_837423 ?auto_837427 ) ) ( not ( = ?auto_837423 ?auto_837428 ) ) ( not ( = ?auto_837423 ?auto_837429 ) ) ( not ( = ?auto_837424 ?auto_837425 ) ) ( not ( = ?auto_837424 ?auto_837426 ) ) ( not ( = ?auto_837424 ?auto_837427 ) ) ( not ( = ?auto_837424 ?auto_837428 ) ) ( not ( = ?auto_837424 ?auto_837429 ) ) ( not ( = ?auto_837425 ?auto_837426 ) ) ( not ( = ?auto_837425 ?auto_837427 ) ) ( not ( = ?auto_837425 ?auto_837428 ) ) ( not ( = ?auto_837425 ?auto_837429 ) ) ( not ( = ?auto_837426 ?auto_837427 ) ) ( not ( = ?auto_837426 ?auto_837428 ) ) ( not ( = ?auto_837426 ?auto_837429 ) ) ( not ( = ?auto_837427 ?auto_837428 ) ) ( not ( = ?auto_837427 ?auto_837429 ) ) ( not ( = ?auto_837428 ?auto_837429 ) ) ( ON ?auto_837427 ?auto_837428 ) ( CLEAR ?auto_837425 ) ( ON ?auto_837426 ?auto_837427 ) ( CLEAR ?auto_837426 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_837420 ?auto_837421 ?auto_837422 ?auto_837423 ?auto_837424 ?auto_837425 ?auto_837426 )
      ( MAKE-9PILE ?auto_837420 ?auto_837421 ?auto_837422 ?auto_837423 ?auto_837424 ?auto_837425 ?auto_837426 ?auto_837427 ?auto_837428 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_837458 - BLOCK
      ?auto_837459 - BLOCK
      ?auto_837460 - BLOCK
      ?auto_837461 - BLOCK
      ?auto_837462 - BLOCK
      ?auto_837463 - BLOCK
      ?auto_837464 - BLOCK
      ?auto_837465 - BLOCK
      ?auto_837466 - BLOCK
    )
    :vars
    (
      ?auto_837467 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_837466 ?auto_837467 ) ( ON-TABLE ?auto_837458 ) ( ON ?auto_837459 ?auto_837458 ) ( ON ?auto_837460 ?auto_837459 ) ( ON ?auto_837461 ?auto_837460 ) ( ON ?auto_837462 ?auto_837461 ) ( not ( = ?auto_837458 ?auto_837459 ) ) ( not ( = ?auto_837458 ?auto_837460 ) ) ( not ( = ?auto_837458 ?auto_837461 ) ) ( not ( = ?auto_837458 ?auto_837462 ) ) ( not ( = ?auto_837458 ?auto_837463 ) ) ( not ( = ?auto_837458 ?auto_837464 ) ) ( not ( = ?auto_837458 ?auto_837465 ) ) ( not ( = ?auto_837458 ?auto_837466 ) ) ( not ( = ?auto_837458 ?auto_837467 ) ) ( not ( = ?auto_837459 ?auto_837460 ) ) ( not ( = ?auto_837459 ?auto_837461 ) ) ( not ( = ?auto_837459 ?auto_837462 ) ) ( not ( = ?auto_837459 ?auto_837463 ) ) ( not ( = ?auto_837459 ?auto_837464 ) ) ( not ( = ?auto_837459 ?auto_837465 ) ) ( not ( = ?auto_837459 ?auto_837466 ) ) ( not ( = ?auto_837459 ?auto_837467 ) ) ( not ( = ?auto_837460 ?auto_837461 ) ) ( not ( = ?auto_837460 ?auto_837462 ) ) ( not ( = ?auto_837460 ?auto_837463 ) ) ( not ( = ?auto_837460 ?auto_837464 ) ) ( not ( = ?auto_837460 ?auto_837465 ) ) ( not ( = ?auto_837460 ?auto_837466 ) ) ( not ( = ?auto_837460 ?auto_837467 ) ) ( not ( = ?auto_837461 ?auto_837462 ) ) ( not ( = ?auto_837461 ?auto_837463 ) ) ( not ( = ?auto_837461 ?auto_837464 ) ) ( not ( = ?auto_837461 ?auto_837465 ) ) ( not ( = ?auto_837461 ?auto_837466 ) ) ( not ( = ?auto_837461 ?auto_837467 ) ) ( not ( = ?auto_837462 ?auto_837463 ) ) ( not ( = ?auto_837462 ?auto_837464 ) ) ( not ( = ?auto_837462 ?auto_837465 ) ) ( not ( = ?auto_837462 ?auto_837466 ) ) ( not ( = ?auto_837462 ?auto_837467 ) ) ( not ( = ?auto_837463 ?auto_837464 ) ) ( not ( = ?auto_837463 ?auto_837465 ) ) ( not ( = ?auto_837463 ?auto_837466 ) ) ( not ( = ?auto_837463 ?auto_837467 ) ) ( not ( = ?auto_837464 ?auto_837465 ) ) ( not ( = ?auto_837464 ?auto_837466 ) ) ( not ( = ?auto_837464 ?auto_837467 ) ) ( not ( = ?auto_837465 ?auto_837466 ) ) ( not ( = ?auto_837465 ?auto_837467 ) ) ( not ( = ?auto_837466 ?auto_837467 ) ) ( ON ?auto_837465 ?auto_837466 ) ( ON ?auto_837464 ?auto_837465 ) ( CLEAR ?auto_837462 ) ( ON ?auto_837463 ?auto_837464 ) ( CLEAR ?auto_837463 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_837458 ?auto_837459 ?auto_837460 ?auto_837461 ?auto_837462 ?auto_837463 )
      ( MAKE-9PILE ?auto_837458 ?auto_837459 ?auto_837460 ?auto_837461 ?auto_837462 ?auto_837463 ?auto_837464 ?auto_837465 ?auto_837466 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_837496 - BLOCK
      ?auto_837497 - BLOCK
      ?auto_837498 - BLOCK
      ?auto_837499 - BLOCK
      ?auto_837500 - BLOCK
      ?auto_837501 - BLOCK
      ?auto_837502 - BLOCK
      ?auto_837503 - BLOCK
      ?auto_837504 - BLOCK
    )
    :vars
    (
      ?auto_837505 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_837504 ?auto_837505 ) ( ON-TABLE ?auto_837496 ) ( ON ?auto_837497 ?auto_837496 ) ( ON ?auto_837498 ?auto_837497 ) ( ON ?auto_837499 ?auto_837498 ) ( not ( = ?auto_837496 ?auto_837497 ) ) ( not ( = ?auto_837496 ?auto_837498 ) ) ( not ( = ?auto_837496 ?auto_837499 ) ) ( not ( = ?auto_837496 ?auto_837500 ) ) ( not ( = ?auto_837496 ?auto_837501 ) ) ( not ( = ?auto_837496 ?auto_837502 ) ) ( not ( = ?auto_837496 ?auto_837503 ) ) ( not ( = ?auto_837496 ?auto_837504 ) ) ( not ( = ?auto_837496 ?auto_837505 ) ) ( not ( = ?auto_837497 ?auto_837498 ) ) ( not ( = ?auto_837497 ?auto_837499 ) ) ( not ( = ?auto_837497 ?auto_837500 ) ) ( not ( = ?auto_837497 ?auto_837501 ) ) ( not ( = ?auto_837497 ?auto_837502 ) ) ( not ( = ?auto_837497 ?auto_837503 ) ) ( not ( = ?auto_837497 ?auto_837504 ) ) ( not ( = ?auto_837497 ?auto_837505 ) ) ( not ( = ?auto_837498 ?auto_837499 ) ) ( not ( = ?auto_837498 ?auto_837500 ) ) ( not ( = ?auto_837498 ?auto_837501 ) ) ( not ( = ?auto_837498 ?auto_837502 ) ) ( not ( = ?auto_837498 ?auto_837503 ) ) ( not ( = ?auto_837498 ?auto_837504 ) ) ( not ( = ?auto_837498 ?auto_837505 ) ) ( not ( = ?auto_837499 ?auto_837500 ) ) ( not ( = ?auto_837499 ?auto_837501 ) ) ( not ( = ?auto_837499 ?auto_837502 ) ) ( not ( = ?auto_837499 ?auto_837503 ) ) ( not ( = ?auto_837499 ?auto_837504 ) ) ( not ( = ?auto_837499 ?auto_837505 ) ) ( not ( = ?auto_837500 ?auto_837501 ) ) ( not ( = ?auto_837500 ?auto_837502 ) ) ( not ( = ?auto_837500 ?auto_837503 ) ) ( not ( = ?auto_837500 ?auto_837504 ) ) ( not ( = ?auto_837500 ?auto_837505 ) ) ( not ( = ?auto_837501 ?auto_837502 ) ) ( not ( = ?auto_837501 ?auto_837503 ) ) ( not ( = ?auto_837501 ?auto_837504 ) ) ( not ( = ?auto_837501 ?auto_837505 ) ) ( not ( = ?auto_837502 ?auto_837503 ) ) ( not ( = ?auto_837502 ?auto_837504 ) ) ( not ( = ?auto_837502 ?auto_837505 ) ) ( not ( = ?auto_837503 ?auto_837504 ) ) ( not ( = ?auto_837503 ?auto_837505 ) ) ( not ( = ?auto_837504 ?auto_837505 ) ) ( ON ?auto_837503 ?auto_837504 ) ( ON ?auto_837502 ?auto_837503 ) ( ON ?auto_837501 ?auto_837502 ) ( CLEAR ?auto_837499 ) ( ON ?auto_837500 ?auto_837501 ) ( CLEAR ?auto_837500 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_837496 ?auto_837497 ?auto_837498 ?auto_837499 ?auto_837500 )
      ( MAKE-9PILE ?auto_837496 ?auto_837497 ?auto_837498 ?auto_837499 ?auto_837500 ?auto_837501 ?auto_837502 ?auto_837503 ?auto_837504 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_837534 - BLOCK
      ?auto_837535 - BLOCK
      ?auto_837536 - BLOCK
      ?auto_837537 - BLOCK
      ?auto_837538 - BLOCK
      ?auto_837539 - BLOCK
      ?auto_837540 - BLOCK
      ?auto_837541 - BLOCK
      ?auto_837542 - BLOCK
    )
    :vars
    (
      ?auto_837543 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_837542 ?auto_837543 ) ( ON-TABLE ?auto_837534 ) ( ON ?auto_837535 ?auto_837534 ) ( ON ?auto_837536 ?auto_837535 ) ( not ( = ?auto_837534 ?auto_837535 ) ) ( not ( = ?auto_837534 ?auto_837536 ) ) ( not ( = ?auto_837534 ?auto_837537 ) ) ( not ( = ?auto_837534 ?auto_837538 ) ) ( not ( = ?auto_837534 ?auto_837539 ) ) ( not ( = ?auto_837534 ?auto_837540 ) ) ( not ( = ?auto_837534 ?auto_837541 ) ) ( not ( = ?auto_837534 ?auto_837542 ) ) ( not ( = ?auto_837534 ?auto_837543 ) ) ( not ( = ?auto_837535 ?auto_837536 ) ) ( not ( = ?auto_837535 ?auto_837537 ) ) ( not ( = ?auto_837535 ?auto_837538 ) ) ( not ( = ?auto_837535 ?auto_837539 ) ) ( not ( = ?auto_837535 ?auto_837540 ) ) ( not ( = ?auto_837535 ?auto_837541 ) ) ( not ( = ?auto_837535 ?auto_837542 ) ) ( not ( = ?auto_837535 ?auto_837543 ) ) ( not ( = ?auto_837536 ?auto_837537 ) ) ( not ( = ?auto_837536 ?auto_837538 ) ) ( not ( = ?auto_837536 ?auto_837539 ) ) ( not ( = ?auto_837536 ?auto_837540 ) ) ( not ( = ?auto_837536 ?auto_837541 ) ) ( not ( = ?auto_837536 ?auto_837542 ) ) ( not ( = ?auto_837536 ?auto_837543 ) ) ( not ( = ?auto_837537 ?auto_837538 ) ) ( not ( = ?auto_837537 ?auto_837539 ) ) ( not ( = ?auto_837537 ?auto_837540 ) ) ( not ( = ?auto_837537 ?auto_837541 ) ) ( not ( = ?auto_837537 ?auto_837542 ) ) ( not ( = ?auto_837537 ?auto_837543 ) ) ( not ( = ?auto_837538 ?auto_837539 ) ) ( not ( = ?auto_837538 ?auto_837540 ) ) ( not ( = ?auto_837538 ?auto_837541 ) ) ( not ( = ?auto_837538 ?auto_837542 ) ) ( not ( = ?auto_837538 ?auto_837543 ) ) ( not ( = ?auto_837539 ?auto_837540 ) ) ( not ( = ?auto_837539 ?auto_837541 ) ) ( not ( = ?auto_837539 ?auto_837542 ) ) ( not ( = ?auto_837539 ?auto_837543 ) ) ( not ( = ?auto_837540 ?auto_837541 ) ) ( not ( = ?auto_837540 ?auto_837542 ) ) ( not ( = ?auto_837540 ?auto_837543 ) ) ( not ( = ?auto_837541 ?auto_837542 ) ) ( not ( = ?auto_837541 ?auto_837543 ) ) ( not ( = ?auto_837542 ?auto_837543 ) ) ( ON ?auto_837541 ?auto_837542 ) ( ON ?auto_837540 ?auto_837541 ) ( ON ?auto_837539 ?auto_837540 ) ( ON ?auto_837538 ?auto_837539 ) ( CLEAR ?auto_837536 ) ( ON ?auto_837537 ?auto_837538 ) ( CLEAR ?auto_837537 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_837534 ?auto_837535 ?auto_837536 ?auto_837537 )
      ( MAKE-9PILE ?auto_837534 ?auto_837535 ?auto_837536 ?auto_837537 ?auto_837538 ?auto_837539 ?auto_837540 ?auto_837541 ?auto_837542 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_837572 - BLOCK
      ?auto_837573 - BLOCK
      ?auto_837574 - BLOCK
      ?auto_837575 - BLOCK
      ?auto_837576 - BLOCK
      ?auto_837577 - BLOCK
      ?auto_837578 - BLOCK
      ?auto_837579 - BLOCK
      ?auto_837580 - BLOCK
    )
    :vars
    (
      ?auto_837581 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_837580 ?auto_837581 ) ( ON-TABLE ?auto_837572 ) ( ON ?auto_837573 ?auto_837572 ) ( not ( = ?auto_837572 ?auto_837573 ) ) ( not ( = ?auto_837572 ?auto_837574 ) ) ( not ( = ?auto_837572 ?auto_837575 ) ) ( not ( = ?auto_837572 ?auto_837576 ) ) ( not ( = ?auto_837572 ?auto_837577 ) ) ( not ( = ?auto_837572 ?auto_837578 ) ) ( not ( = ?auto_837572 ?auto_837579 ) ) ( not ( = ?auto_837572 ?auto_837580 ) ) ( not ( = ?auto_837572 ?auto_837581 ) ) ( not ( = ?auto_837573 ?auto_837574 ) ) ( not ( = ?auto_837573 ?auto_837575 ) ) ( not ( = ?auto_837573 ?auto_837576 ) ) ( not ( = ?auto_837573 ?auto_837577 ) ) ( not ( = ?auto_837573 ?auto_837578 ) ) ( not ( = ?auto_837573 ?auto_837579 ) ) ( not ( = ?auto_837573 ?auto_837580 ) ) ( not ( = ?auto_837573 ?auto_837581 ) ) ( not ( = ?auto_837574 ?auto_837575 ) ) ( not ( = ?auto_837574 ?auto_837576 ) ) ( not ( = ?auto_837574 ?auto_837577 ) ) ( not ( = ?auto_837574 ?auto_837578 ) ) ( not ( = ?auto_837574 ?auto_837579 ) ) ( not ( = ?auto_837574 ?auto_837580 ) ) ( not ( = ?auto_837574 ?auto_837581 ) ) ( not ( = ?auto_837575 ?auto_837576 ) ) ( not ( = ?auto_837575 ?auto_837577 ) ) ( not ( = ?auto_837575 ?auto_837578 ) ) ( not ( = ?auto_837575 ?auto_837579 ) ) ( not ( = ?auto_837575 ?auto_837580 ) ) ( not ( = ?auto_837575 ?auto_837581 ) ) ( not ( = ?auto_837576 ?auto_837577 ) ) ( not ( = ?auto_837576 ?auto_837578 ) ) ( not ( = ?auto_837576 ?auto_837579 ) ) ( not ( = ?auto_837576 ?auto_837580 ) ) ( not ( = ?auto_837576 ?auto_837581 ) ) ( not ( = ?auto_837577 ?auto_837578 ) ) ( not ( = ?auto_837577 ?auto_837579 ) ) ( not ( = ?auto_837577 ?auto_837580 ) ) ( not ( = ?auto_837577 ?auto_837581 ) ) ( not ( = ?auto_837578 ?auto_837579 ) ) ( not ( = ?auto_837578 ?auto_837580 ) ) ( not ( = ?auto_837578 ?auto_837581 ) ) ( not ( = ?auto_837579 ?auto_837580 ) ) ( not ( = ?auto_837579 ?auto_837581 ) ) ( not ( = ?auto_837580 ?auto_837581 ) ) ( ON ?auto_837579 ?auto_837580 ) ( ON ?auto_837578 ?auto_837579 ) ( ON ?auto_837577 ?auto_837578 ) ( ON ?auto_837576 ?auto_837577 ) ( ON ?auto_837575 ?auto_837576 ) ( CLEAR ?auto_837573 ) ( ON ?auto_837574 ?auto_837575 ) ( CLEAR ?auto_837574 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_837572 ?auto_837573 ?auto_837574 )
      ( MAKE-9PILE ?auto_837572 ?auto_837573 ?auto_837574 ?auto_837575 ?auto_837576 ?auto_837577 ?auto_837578 ?auto_837579 ?auto_837580 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_837610 - BLOCK
      ?auto_837611 - BLOCK
      ?auto_837612 - BLOCK
      ?auto_837613 - BLOCK
      ?auto_837614 - BLOCK
      ?auto_837615 - BLOCK
      ?auto_837616 - BLOCK
      ?auto_837617 - BLOCK
      ?auto_837618 - BLOCK
    )
    :vars
    (
      ?auto_837619 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_837618 ?auto_837619 ) ( ON-TABLE ?auto_837610 ) ( not ( = ?auto_837610 ?auto_837611 ) ) ( not ( = ?auto_837610 ?auto_837612 ) ) ( not ( = ?auto_837610 ?auto_837613 ) ) ( not ( = ?auto_837610 ?auto_837614 ) ) ( not ( = ?auto_837610 ?auto_837615 ) ) ( not ( = ?auto_837610 ?auto_837616 ) ) ( not ( = ?auto_837610 ?auto_837617 ) ) ( not ( = ?auto_837610 ?auto_837618 ) ) ( not ( = ?auto_837610 ?auto_837619 ) ) ( not ( = ?auto_837611 ?auto_837612 ) ) ( not ( = ?auto_837611 ?auto_837613 ) ) ( not ( = ?auto_837611 ?auto_837614 ) ) ( not ( = ?auto_837611 ?auto_837615 ) ) ( not ( = ?auto_837611 ?auto_837616 ) ) ( not ( = ?auto_837611 ?auto_837617 ) ) ( not ( = ?auto_837611 ?auto_837618 ) ) ( not ( = ?auto_837611 ?auto_837619 ) ) ( not ( = ?auto_837612 ?auto_837613 ) ) ( not ( = ?auto_837612 ?auto_837614 ) ) ( not ( = ?auto_837612 ?auto_837615 ) ) ( not ( = ?auto_837612 ?auto_837616 ) ) ( not ( = ?auto_837612 ?auto_837617 ) ) ( not ( = ?auto_837612 ?auto_837618 ) ) ( not ( = ?auto_837612 ?auto_837619 ) ) ( not ( = ?auto_837613 ?auto_837614 ) ) ( not ( = ?auto_837613 ?auto_837615 ) ) ( not ( = ?auto_837613 ?auto_837616 ) ) ( not ( = ?auto_837613 ?auto_837617 ) ) ( not ( = ?auto_837613 ?auto_837618 ) ) ( not ( = ?auto_837613 ?auto_837619 ) ) ( not ( = ?auto_837614 ?auto_837615 ) ) ( not ( = ?auto_837614 ?auto_837616 ) ) ( not ( = ?auto_837614 ?auto_837617 ) ) ( not ( = ?auto_837614 ?auto_837618 ) ) ( not ( = ?auto_837614 ?auto_837619 ) ) ( not ( = ?auto_837615 ?auto_837616 ) ) ( not ( = ?auto_837615 ?auto_837617 ) ) ( not ( = ?auto_837615 ?auto_837618 ) ) ( not ( = ?auto_837615 ?auto_837619 ) ) ( not ( = ?auto_837616 ?auto_837617 ) ) ( not ( = ?auto_837616 ?auto_837618 ) ) ( not ( = ?auto_837616 ?auto_837619 ) ) ( not ( = ?auto_837617 ?auto_837618 ) ) ( not ( = ?auto_837617 ?auto_837619 ) ) ( not ( = ?auto_837618 ?auto_837619 ) ) ( ON ?auto_837617 ?auto_837618 ) ( ON ?auto_837616 ?auto_837617 ) ( ON ?auto_837615 ?auto_837616 ) ( ON ?auto_837614 ?auto_837615 ) ( ON ?auto_837613 ?auto_837614 ) ( ON ?auto_837612 ?auto_837613 ) ( CLEAR ?auto_837610 ) ( ON ?auto_837611 ?auto_837612 ) ( CLEAR ?auto_837611 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_837610 ?auto_837611 )
      ( MAKE-9PILE ?auto_837610 ?auto_837611 ?auto_837612 ?auto_837613 ?auto_837614 ?auto_837615 ?auto_837616 ?auto_837617 ?auto_837618 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_837648 - BLOCK
      ?auto_837649 - BLOCK
      ?auto_837650 - BLOCK
      ?auto_837651 - BLOCK
      ?auto_837652 - BLOCK
      ?auto_837653 - BLOCK
      ?auto_837654 - BLOCK
      ?auto_837655 - BLOCK
      ?auto_837656 - BLOCK
    )
    :vars
    (
      ?auto_837657 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_837656 ?auto_837657 ) ( not ( = ?auto_837648 ?auto_837649 ) ) ( not ( = ?auto_837648 ?auto_837650 ) ) ( not ( = ?auto_837648 ?auto_837651 ) ) ( not ( = ?auto_837648 ?auto_837652 ) ) ( not ( = ?auto_837648 ?auto_837653 ) ) ( not ( = ?auto_837648 ?auto_837654 ) ) ( not ( = ?auto_837648 ?auto_837655 ) ) ( not ( = ?auto_837648 ?auto_837656 ) ) ( not ( = ?auto_837648 ?auto_837657 ) ) ( not ( = ?auto_837649 ?auto_837650 ) ) ( not ( = ?auto_837649 ?auto_837651 ) ) ( not ( = ?auto_837649 ?auto_837652 ) ) ( not ( = ?auto_837649 ?auto_837653 ) ) ( not ( = ?auto_837649 ?auto_837654 ) ) ( not ( = ?auto_837649 ?auto_837655 ) ) ( not ( = ?auto_837649 ?auto_837656 ) ) ( not ( = ?auto_837649 ?auto_837657 ) ) ( not ( = ?auto_837650 ?auto_837651 ) ) ( not ( = ?auto_837650 ?auto_837652 ) ) ( not ( = ?auto_837650 ?auto_837653 ) ) ( not ( = ?auto_837650 ?auto_837654 ) ) ( not ( = ?auto_837650 ?auto_837655 ) ) ( not ( = ?auto_837650 ?auto_837656 ) ) ( not ( = ?auto_837650 ?auto_837657 ) ) ( not ( = ?auto_837651 ?auto_837652 ) ) ( not ( = ?auto_837651 ?auto_837653 ) ) ( not ( = ?auto_837651 ?auto_837654 ) ) ( not ( = ?auto_837651 ?auto_837655 ) ) ( not ( = ?auto_837651 ?auto_837656 ) ) ( not ( = ?auto_837651 ?auto_837657 ) ) ( not ( = ?auto_837652 ?auto_837653 ) ) ( not ( = ?auto_837652 ?auto_837654 ) ) ( not ( = ?auto_837652 ?auto_837655 ) ) ( not ( = ?auto_837652 ?auto_837656 ) ) ( not ( = ?auto_837652 ?auto_837657 ) ) ( not ( = ?auto_837653 ?auto_837654 ) ) ( not ( = ?auto_837653 ?auto_837655 ) ) ( not ( = ?auto_837653 ?auto_837656 ) ) ( not ( = ?auto_837653 ?auto_837657 ) ) ( not ( = ?auto_837654 ?auto_837655 ) ) ( not ( = ?auto_837654 ?auto_837656 ) ) ( not ( = ?auto_837654 ?auto_837657 ) ) ( not ( = ?auto_837655 ?auto_837656 ) ) ( not ( = ?auto_837655 ?auto_837657 ) ) ( not ( = ?auto_837656 ?auto_837657 ) ) ( ON ?auto_837655 ?auto_837656 ) ( ON ?auto_837654 ?auto_837655 ) ( ON ?auto_837653 ?auto_837654 ) ( ON ?auto_837652 ?auto_837653 ) ( ON ?auto_837651 ?auto_837652 ) ( ON ?auto_837650 ?auto_837651 ) ( ON ?auto_837649 ?auto_837650 ) ( ON ?auto_837648 ?auto_837649 ) ( CLEAR ?auto_837648 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_837648 )
      ( MAKE-9PILE ?auto_837648 ?auto_837649 ?auto_837650 ?auto_837651 ?auto_837652 ?auto_837653 ?auto_837654 ?auto_837655 ?auto_837656 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_837687 - BLOCK
      ?auto_837688 - BLOCK
      ?auto_837689 - BLOCK
      ?auto_837690 - BLOCK
      ?auto_837691 - BLOCK
      ?auto_837692 - BLOCK
      ?auto_837693 - BLOCK
      ?auto_837694 - BLOCK
      ?auto_837695 - BLOCK
      ?auto_837696 - BLOCK
    )
    :vars
    (
      ?auto_837697 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_837695 ) ( ON ?auto_837696 ?auto_837697 ) ( CLEAR ?auto_837696 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_837687 ) ( ON ?auto_837688 ?auto_837687 ) ( ON ?auto_837689 ?auto_837688 ) ( ON ?auto_837690 ?auto_837689 ) ( ON ?auto_837691 ?auto_837690 ) ( ON ?auto_837692 ?auto_837691 ) ( ON ?auto_837693 ?auto_837692 ) ( ON ?auto_837694 ?auto_837693 ) ( ON ?auto_837695 ?auto_837694 ) ( not ( = ?auto_837687 ?auto_837688 ) ) ( not ( = ?auto_837687 ?auto_837689 ) ) ( not ( = ?auto_837687 ?auto_837690 ) ) ( not ( = ?auto_837687 ?auto_837691 ) ) ( not ( = ?auto_837687 ?auto_837692 ) ) ( not ( = ?auto_837687 ?auto_837693 ) ) ( not ( = ?auto_837687 ?auto_837694 ) ) ( not ( = ?auto_837687 ?auto_837695 ) ) ( not ( = ?auto_837687 ?auto_837696 ) ) ( not ( = ?auto_837687 ?auto_837697 ) ) ( not ( = ?auto_837688 ?auto_837689 ) ) ( not ( = ?auto_837688 ?auto_837690 ) ) ( not ( = ?auto_837688 ?auto_837691 ) ) ( not ( = ?auto_837688 ?auto_837692 ) ) ( not ( = ?auto_837688 ?auto_837693 ) ) ( not ( = ?auto_837688 ?auto_837694 ) ) ( not ( = ?auto_837688 ?auto_837695 ) ) ( not ( = ?auto_837688 ?auto_837696 ) ) ( not ( = ?auto_837688 ?auto_837697 ) ) ( not ( = ?auto_837689 ?auto_837690 ) ) ( not ( = ?auto_837689 ?auto_837691 ) ) ( not ( = ?auto_837689 ?auto_837692 ) ) ( not ( = ?auto_837689 ?auto_837693 ) ) ( not ( = ?auto_837689 ?auto_837694 ) ) ( not ( = ?auto_837689 ?auto_837695 ) ) ( not ( = ?auto_837689 ?auto_837696 ) ) ( not ( = ?auto_837689 ?auto_837697 ) ) ( not ( = ?auto_837690 ?auto_837691 ) ) ( not ( = ?auto_837690 ?auto_837692 ) ) ( not ( = ?auto_837690 ?auto_837693 ) ) ( not ( = ?auto_837690 ?auto_837694 ) ) ( not ( = ?auto_837690 ?auto_837695 ) ) ( not ( = ?auto_837690 ?auto_837696 ) ) ( not ( = ?auto_837690 ?auto_837697 ) ) ( not ( = ?auto_837691 ?auto_837692 ) ) ( not ( = ?auto_837691 ?auto_837693 ) ) ( not ( = ?auto_837691 ?auto_837694 ) ) ( not ( = ?auto_837691 ?auto_837695 ) ) ( not ( = ?auto_837691 ?auto_837696 ) ) ( not ( = ?auto_837691 ?auto_837697 ) ) ( not ( = ?auto_837692 ?auto_837693 ) ) ( not ( = ?auto_837692 ?auto_837694 ) ) ( not ( = ?auto_837692 ?auto_837695 ) ) ( not ( = ?auto_837692 ?auto_837696 ) ) ( not ( = ?auto_837692 ?auto_837697 ) ) ( not ( = ?auto_837693 ?auto_837694 ) ) ( not ( = ?auto_837693 ?auto_837695 ) ) ( not ( = ?auto_837693 ?auto_837696 ) ) ( not ( = ?auto_837693 ?auto_837697 ) ) ( not ( = ?auto_837694 ?auto_837695 ) ) ( not ( = ?auto_837694 ?auto_837696 ) ) ( not ( = ?auto_837694 ?auto_837697 ) ) ( not ( = ?auto_837695 ?auto_837696 ) ) ( not ( = ?auto_837695 ?auto_837697 ) ) ( not ( = ?auto_837696 ?auto_837697 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_837696 ?auto_837697 )
      ( !STACK ?auto_837696 ?auto_837695 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_837729 - BLOCK
      ?auto_837730 - BLOCK
      ?auto_837731 - BLOCK
      ?auto_837732 - BLOCK
      ?auto_837733 - BLOCK
      ?auto_837734 - BLOCK
      ?auto_837735 - BLOCK
      ?auto_837736 - BLOCK
      ?auto_837737 - BLOCK
      ?auto_837738 - BLOCK
    )
    :vars
    (
      ?auto_837739 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_837738 ?auto_837739 ) ( ON-TABLE ?auto_837729 ) ( ON ?auto_837730 ?auto_837729 ) ( ON ?auto_837731 ?auto_837730 ) ( ON ?auto_837732 ?auto_837731 ) ( ON ?auto_837733 ?auto_837732 ) ( ON ?auto_837734 ?auto_837733 ) ( ON ?auto_837735 ?auto_837734 ) ( ON ?auto_837736 ?auto_837735 ) ( not ( = ?auto_837729 ?auto_837730 ) ) ( not ( = ?auto_837729 ?auto_837731 ) ) ( not ( = ?auto_837729 ?auto_837732 ) ) ( not ( = ?auto_837729 ?auto_837733 ) ) ( not ( = ?auto_837729 ?auto_837734 ) ) ( not ( = ?auto_837729 ?auto_837735 ) ) ( not ( = ?auto_837729 ?auto_837736 ) ) ( not ( = ?auto_837729 ?auto_837737 ) ) ( not ( = ?auto_837729 ?auto_837738 ) ) ( not ( = ?auto_837729 ?auto_837739 ) ) ( not ( = ?auto_837730 ?auto_837731 ) ) ( not ( = ?auto_837730 ?auto_837732 ) ) ( not ( = ?auto_837730 ?auto_837733 ) ) ( not ( = ?auto_837730 ?auto_837734 ) ) ( not ( = ?auto_837730 ?auto_837735 ) ) ( not ( = ?auto_837730 ?auto_837736 ) ) ( not ( = ?auto_837730 ?auto_837737 ) ) ( not ( = ?auto_837730 ?auto_837738 ) ) ( not ( = ?auto_837730 ?auto_837739 ) ) ( not ( = ?auto_837731 ?auto_837732 ) ) ( not ( = ?auto_837731 ?auto_837733 ) ) ( not ( = ?auto_837731 ?auto_837734 ) ) ( not ( = ?auto_837731 ?auto_837735 ) ) ( not ( = ?auto_837731 ?auto_837736 ) ) ( not ( = ?auto_837731 ?auto_837737 ) ) ( not ( = ?auto_837731 ?auto_837738 ) ) ( not ( = ?auto_837731 ?auto_837739 ) ) ( not ( = ?auto_837732 ?auto_837733 ) ) ( not ( = ?auto_837732 ?auto_837734 ) ) ( not ( = ?auto_837732 ?auto_837735 ) ) ( not ( = ?auto_837732 ?auto_837736 ) ) ( not ( = ?auto_837732 ?auto_837737 ) ) ( not ( = ?auto_837732 ?auto_837738 ) ) ( not ( = ?auto_837732 ?auto_837739 ) ) ( not ( = ?auto_837733 ?auto_837734 ) ) ( not ( = ?auto_837733 ?auto_837735 ) ) ( not ( = ?auto_837733 ?auto_837736 ) ) ( not ( = ?auto_837733 ?auto_837737 ) ) ( not ( = ?auto_837733 ?auto_837738 ) ) ( not ( = ?auto_837733 ?auto_837739 ) ) ( not ( = ?auto_837734 ?auto_837735 ) ) ( not ( = ?auto_837734 ?auto_837736 ) ) ( not ( = ?auto_837734 ?auto_837737 ) ) ( not ( = ?auto_837734 ?auto_837738 ) ) ( not ( = ?auto_837734 ?auto_837739 ) ) ( not ( = ?auto_837735 ?auto_837736 ) ) ( not ( = ?auto_837735 ?auto_837737 ) ) ( not ( = ?auto_837735 ?auto_837738 ) ) ( not ( = ?auto_837735 ?auto_837739 ) ) ( not ( = ?auto_837736 ?auto_837737 ) ) ( not ( = ?auto_837736 ?auto_837738 ) ) ( not ( = ?auto_837736 ?auto_837739 ) ) ( not ( = ?auto_837737 ?auto_837738 ) ) ( not ( = ?auto_837737 ?auto_837739 ) ) ( not ( = ?auto_837738 ?auto_837739 ) ) ( CLEAR ?auto_837736 ) ( ON ?auto_837737 ?auto_837738 ) ( CLEAR ?auto_837737 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_837729 ?auto_837730 ?auto_837731 ?auto_837732 ?auto_837733 ?auto_837734 ?auto_837735 ?auto_837736 ?auto_837737 )
      ( MAKE-10PILE ?auto_837729 ?auto_837730 ?auto_837731 ?auto_837732 ?auto_837733 ?auto_837734 ?auto_837735 ?auto_837736 ?auto_837737 ?auto_837738 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_837771 - BLOCK
      ?auto_837772 - BLOCK
      ?auto_837773 - BLOCK
      ?auto_837774 - BLOCK
      ?auto_837775 - BLOCK
      ?auto_837776 - BLOCK
      ?auto_837777 - BLOCK
      ?auto_837778 - BLOCK
      ?auto_837779 - BLOCK
      ?auto_837780 - BLOCK
    )
    :vars
    (
      ?auto_837781 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_837780 ?auto_837781 ) ( ON-TABLE ?auto_837771 ) ( ON ?auto_837772 ?auto_837771 ) ( ON ?auto_837773 ?auto_837772 ) ( ON ?auto_837774 ?auto_837773 ) ( ON ?auto_837775 ?auto_837774 ) ( ON ?auto_837776 ?auto_837775 ) ( ON ?auto_837777 ?auto_837776 ) ( not ( = ?auto_837771 ?auto_837772 ) ) ( not ( = ?auto_837771 ?auto_837773 ) ) ( not ( = ?auto_837771 ?auto_837774 ) ) ( not ( = ?auto_837771 ?auto_837775 ) ) ( not ( = ?auto_837771 ?auto_837776 ) ) ( not ( = ?auto_837771 ?auto_837777 ) ) ( not ( = ?auto_837771 ?auto_837778 ) ) ( not ( = ?auto_837771 ?auto_837779 ) ) ( not ( = ?auto_837771 ?auto_837780 ) ) ( not ( = ?auto_837771 ?auto_837781 ) ) ( not ( = ?auto_837772 ?auto_837773 ) ) ( not ( = ?auto_837772 ?auto_837774 ) ) ( not ( = ?auto_837772 ?auto_837775 ) ) ( not ( = ?auto_837772 ?auto_837776 ) ) ( not ( = ?auto_837772 ?auto_837777 ) ) ( not ( = ?auto_837772 ?auto_837778 ) ) ( not ( = ?auto_837772 ?auto_837779 ) ) ( not ( = ?auto_837772 ?auto_837780 ) ) ( not ( = ?auto_837772 ?auto_837781 ) ) ( not ( = ?auto_837773 ?auto_837774 ) ) ( not ( = ?auto_837773 ?auto_837775 ) ) ( not ( = ?auto_837773 ?auto_837776 ) ) ( not ( = ?auto_837773 ?auto_837777 ) ) ( not ( = ?auto_837773 ?auto_837778 ) ) ( not ( = ?auto_837773 ?auto_837779 ) ) ( not ( = ?auto_837773 ?auto_837780 ) ) ( not ( = ?auto_837773 ?auto_837781 ) ) ( not ( = ?auto_837774 ?auto_837775 ) ) ( not ( = ?auto_837774 ?auto_837776 ) ) ( not ( = ?auto_837774 ?auto_837777 ) ) ( not ( = ?auto_837774 ?auto_837778 ) ) ( not ( = ?auto_837774 ?auto_837779 ) ) ( not ( = ?auto_837774 ?auto_837780 ) ) ( not ( = ?auto_837774 ?auto_837781 ) ) ( not ( = ?auto_837775 ?auto_837776 ) ) ( not ( = ?auto_837775 ?auto_837777 ) ) ( not ( = ?auto_837775 ?auto_837778 ) ) ( not ( = ?auto_837775 ?auto_837779 ) ) ( not ( = ?auto_837775 ?auto_837780 ) ) ( not ( = ?auto_837775 ?auto_837781 ) ) ( not ( = ?auto_837776 ?auto_837777 ) ) ( not ( = ?auto_837776 ?auto_837778 ) ) ( not ( = ?auto_837776 ?auto_837779 ) ) ( not ( = ?auto_837776 ?auto_837780 ) ) ( not ( = ?auto_837776 ?auto_837781 ) ) ( not ( = ?auto_837777 ?auto_837778 ) ) ( not ( = ?auto_837777 ?auto_837779 ) ) ( not ( = ?auto_837777 ?auto_837780 ) ) ( not ( = ?auto_837777 ?auto_837781 ) ) ( not ( = ?auto_837778 ?auto_837779 ) ) ( not ( = ?auto_837778 ?auto_837780 ) ) ( not ( = ?auto_837778 ?auto_837781 ) ) ( not ( = ?auto_837779 ?auto_837780 ) ) ( not ( = ?auto_837779 ?auto_837781 ) ) ( not ( = ?auto_837780 ?auto_837781 ) ) ( ON ?auto_837779 ?auto_837780 ) ( CLEAR ?auto_837777 ) ( ON ?auto_837778 ?auto_837779 ) ( CLEAR ?auto_837778 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_837771 ?auto_837772 ?auto_837773 ?auto_837774 ?auto_837775 ?auto_837776 ?auto_837777 ?auto_837778 )
      ( MAKE-10PILE ?auto_837771 ?auto_837772 ?auto_837773 ?auto_837774 ?auto_837775 ?auto_837776 ?auto_837777 ?auto_837778 ?auto_837779 ?auto_837780 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_837813 - BLOCK
      ?auto_837814 - BLOCK
      ?auto_837815 - BLOCK
      ?auto_837816 - BLOCK
      ?auto_837817 - BLOCK
      ?auto_837818 - BLOCK
      ?auto_837819 - BLOCK
      ?auto_837820 - BLOCK
      ?auto_837821 - BLOCK
      ?auto_837822 - BLOCK
    )
    :vars
    (
      ?auto_837823 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_837822 ?auto_837823 ) ( ON-TABLE ?auto_837813 ) ( ON ?auto_837814 ?auto_837813 ) ( ON ?auto_837815 ?auto_837814 ) ( ON ?auto_837816 ?auto_837815 ) ( ON ?auto_837817 ?auto_837816 ) ( ON ?auto_837818 ?auto_837817 ) ( not ( = ?auto_837813 ?auto_837814 ) ) ( not ( = ?auto_837813 ?auto_837815 ) ) ( not ( = ?auto_837813 ?auto_837816 ) ) ( not ( = ?auto_837813 ?auto_837817 ) ) ( not ( = ?auto_837813 ?auto_837818 ) ) ( not ( = ?auto_837813 ?auto_837819 ) ) ( not ( = ?auto_837813 ?auto_837820 ) ) ( not ( = ?auto_837813 ?auto_837821 ) ) ( not ( = ?auto_837813 ?auto_837822 ) ) ( not ( = ?auto_837813 ?auto_837823 ) ) ( not ( = ?auto_837814 ?auto_837815 ) ) ( not ( = ?auto_837814 ?auto_837816 ) ) ( not ( = ?auto_837814 ?auto_837817 ) ) ( not ( = ?auto_837814 ?auto_837818 ) ) ( not ( = ?auto_837814 ?auto_837819 ) ) ( not ( = ?auto_837814 ?auto_837820 ) ) ( not ( = ?auto_837814 ?auto_837821 ) ) ( not ( = ?auto_837814 ?auto_837822 ) ) ( not ( = ?auto_837814 ?auto_837823 ) ) ( not ( = ?auto_837815 ?auto_837816 ) ) ( not ( = ?auto_837815 ?auto_837817 ) ) ( not ( = ?auto_837815 ?auto_837818 ) ) ( not ( = ?auto_837815 ?auto_837819 ) ) ( not ( = ?auto_837815 ?auto_837820 ) ) ( not ( = ?auto_837815 ?auto_837821 ) ) ( not ( = ?auto_837815 ?auto_837822 ) ) ( not ( = ?auto_837815 ?auto_837823 ) ) ( not ( = ?auto_837816 ?auto_837817 ) ) ( not ( = ?auto_837816 ?auto_837818 ) ) ( not ( = ?auto_837816 ?auto_837819 ) ) ( not ( = ?auto_837816 ?auto_837820 ) ) ( not ( = ?auto_837816 ?auto_837821 ) ) ( not ( = ?auto_837816 ?auto_837822 ) ) ( not ( = ?auto_837816 ?auto_837823 ) ) ( not ( = ?auto_837817 ?auto_837818 ) ) ( not ( = ?auto_837817 ?auto_837819 ) ) ( not ( = ?auto_837817 ?auto_837820 ) ) ( not ( = ?auto_837817 ?auto_837821 ) ) ( not ( = ?auto_837817 ?auto_837822 ) ) ( not ( = ?auto_837817 ?auto_837823 ) ) ( not ( = ?auto_837818 ?auto_837819 ) ) ( not ( = ?auto_837818 ?auto_837820 ) ) ( not ( = ?auto_837818 ?auto_837821 ) ) ( not ( = ?auto_837818 ?auto_837822 ) ) ( not ( = ?auto_837818 ?auto_837823 ) ) ( not ( = ?auto_837819 ?auto_837820 ) ) ( not ( = ?auto_837819 ?auto_837821 ) ) ( not ( = ?auto_837819 ?auto_837822 ) ) ( not ( = ?auto_837819 ?auto_837823 ) ) ( not ( = ?auto_837820 ?auto_837821 ) ) ( not ( = ?auto_837820 ?auto_837822 ) ) ( not ( = ?auto_837820 ?auto_837823 ) ) ( not ( = ?auto_837821 ?auto_837822 ) ) ( not ( = ?auto_837821 ?auto_837823 ) ) ( not ( = ?auto_837822 ?auto_837823 ) ) ( ON ?auto_837821 ?auto_837822 ) ( ON ?auto_837820 ?auto_837821 ) ( CLEAR ?auto_837818 ) ( ON ?auto_837819 ?auto_837820 ) ( CLEAR ?auto_837819 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_837813 ?auto_837814 ?auto_837815 ?auto_837816 ?auto_837817 ?auto_837818 ?auto_837819 )
      ( MAKE-10PILE ?auto_837813 ?auto_837814 ?auto_837815 ?auto_837816 ?auto_837817 ?auto_837818 ?auto_837819 ?auto_837820 ?auto_837821 ?auto_837822 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_837855 - BLOCK
      ?auto_837856 - BLOCK
      ?auto_837857 - BLOCK
      ?auto_837858 - BLOCK
      ?auto_837859 - BLOCK
      ?auto_837860 - BLOCK
      ?auto_837861 - BLOCK
      ?auto_837862 - BLOCK
      ?auto_837863 - BLOCK
      ?auto_837864 - BLOCK
    )
    :vars
    (
      ?auto_837865 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_837864 ?auto_837865 ) ( ON-TABLE ?auto_837855 ) ( ON ?auto_837856 ?auto_837855 ) ( ON ?auto_837857 ?auto_837856 ) ( ON ?auto_837858 ?auto_837857 ) ( ON ?auto_837859 ?auto_837858 ) ( not ( = ?auto_837855 ?auto_837856 ) ) ( not ( = ?auto_837855 ?auto_837857 ) ) ( not ( = ?auto_837855 ?auto_837858 ) ) ( not ( = ?auto_837855 ?auto_837859 ) ) ( not ( = ?auto_837855 ?auto_837860 ) ) ( not ( = ?auto_837855 ?auto_837861 ) ) ( not ( = ?auto_837855 ?auto_837862 ) ) ( not ( = ?auto_837855 ?auto_837863 ) ) ( not ( = ?auto_837855 ?auto_837864 ) ) ( not ( = ?auto_837855 ?auto_837865 ) ) ( not ( = ?auto_837856 ?auto_837857 ) ) ( not ( = ?auto_837856 ?auto_837858 ) ) ( not ( = ?auto_837856 ?auto_837859 ) ) ( not ( = ?auto_837856 ?auto_837860 ) ) ( not ( = ?auto_837856 ?auto_837861 ) ) ( not ( = ?auto_837856 ?auto_837862 ) ) ( not ( = ?auto_837856 ?auto_837863 ) ) ( not ( = ?auto_837856 ?auto_837864 ) ) ( not ( = ?auto_837856 ?auto_837865 ) ) ( not ( = ?auto_837857 ?auto_837858 ) ) ( not ( = ?auto_837857 ?auto_837859 ) ) ( not ( = ?auto_837857 ?auto_837860 ) ) ( not ( = ?auto_837857 ?auto_837861 ) ) ( not ( = ?auto_837857 ?auto_837862 ) ) ( not ( = ?auto_837857 ?auto_837863 ) ) ( not ( = ?auto_837857 ?auto_837864 ) ) ( not ( = ?auto_837857 ?auto_837865 ) ) ( not ( = ?auto_837858 ?auto_837859 ) ) ( not ( = ?auto_837858 ?auto_837860 ) ) ( not ( = ?auto_837858 ?auto_837861 ) ) ( not ( = ?auto_837858 ?auto_837862 ) ) ( not ( = ?auto_837858 ?auto_837863 ) ) ( not ( = ?auto_837858 ?auto_837864 ) ) ( not ( = ?auto_837858 ?auto_837865 ) ) ( not ( = ?auto_837859 ?auto_837860 ) ) ( not ( = ?auto_837859 ?auto_837861 ) ) ( not ( = ?auto_837859 ?auto_837862 ) ) ( not ( = ?auto_837859 ?auto_837863 ) ) ( not ( = ?auto_837859 ?auto_837864 ) ) ( not ( = ?auto_837859 ?auto_837865 ) ) ( not ( = ?auto_837860 ?auto_837861 ) ) ( not ( = ?auto_837860 ?auto_837862 ) ) ( not ( = ?auto_837860 ?auto_837863 ) ) ( not ( = ?auto_837860 ?auto_837864 ) ) ( not ( = ?auto_837860 ?auto_837865 ) ) ( not ( = ?auto_837861 ?auto_837862 ) ) ( not ( = ?auto_837861 ?auto_837863 ) ) ( not ( = ?auto_837861 ?auto_837864 ) ) ( not ( = ?auto_837861 ?auto_837865 ) ) ( not ( = ?auto_837862 ?auto_837863 ) ) ( not ( = ?auto_837862 ?auto_837864 ) ) ( not ( = ?auto_837862 ?auto_837865 ) ) ( not ( = ?auto_837863 ?auto_837864 ) ) ( not ( = ?auto_837863 ?auto_837865 ) ) ( not ( = ?auto_837864 ?auto_837865 ) ) ( ON ?auto_837863 ?auto_837864 ) ( ON ?auto_837862 ?auto_837863 ) ( ON ?auto_837861 ?auto_837862 ) ( CLEAR ?auto_837859 ) ( ON ?auto_837860 ?auto_837861 ) ( CLEAR ?auto_837860 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_837855 ?auto_837856 ?auto_837857 ?auto_837858 ?auto_837859 ?auto_837860 )
      ( MAKE-10PILE ?auto_837855 ?auto_837856 ?auto_837857 ?auto_837858 ?auto_837859 ?auto_837860 ?auto_837861 ?auto_837862 ?auto_837863 ?auto_837864 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_837897 - BLOCK
      ?auto_837898 - BLOCK
      ?auto_837899 - BLOCK
      ?auto_837900 - BLOCK
      ?auto_837901 - BLOCK
      ?auto_837902 - BLOCK
      ?auto_837903 - BLOCK
      ?auto_837904 - BLOCK
      ?auto_837905 - BLOCK
      ?auto_837906 - BLOCK
    )
    :vars
    (
      ?auto_837907 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_837906 ?auto_837907 ) ( ON-TABLE ?auto_837897 ) ( ON ?auto_837898 ?auto_837897 ) ( ON ?auto_837899 ?auto_837898 ) ( ON ?auto_837900 ?auto_837899 ) ( not ( = ?auto_837897 ?auto_837898 ) ) ( not ( = ?auto_837897 ?auto_837899 ) ) ( not ( = ?auto_837897 ?auto_837900 ) ) ( not ( = ?auto_837897 ?auto_837901 ) ) ( not ( = ?auto_837897 ?auto_837902 ) ) ( not ( = ?auto_837897 ?auto_837903 ) ) ( not ( = ?auto_837897 ?auto_837904 ) ) ( not ( = ?auto_837897 ?auto_837905 ) ) ( not ( = ?auto_837897 ?auto_837906 ) ) ( not ( = ?auto_837897 ?auto_837907 ) ) ( not ( = ?auto_837898 ?auto_837899 ) ) ( not ( = ?auto_837898 ?auto_837900 ) ) ( not ( = ?auto_837898 ?auto_837901 ) ) ( not ( = ?auto_837898 ?auto_837902 ) ) ( not ( = ?auto_837898 ?auto_837903 ) ) ( not ( = ?auto_837898 ?auto_837904 ) ) ( not ( = ?auto_837898 ?auto_837905 ) ) ( not ( = ?auto_837898 ?auto_837906 ) ) ( not ( = ?auto_837898 ?auto_837907 ) ) ( not ( = ?auto_837899 ?auto_837900 ) ) ( not ( = ?auto_837899 ?auto_837901 ) ) ( not ( = ?auto_837899 ?auto_837902 ) ) ( not ( = ?auto_837899 ?auto_837903 ) ) ( not ( = ?auto_837899 ?auto_837904 ) ) ( not ( = ?auto_837899 ?auto_837905 ) ) ( not ( = ?auto_837899 ?auto_837906 ) ) ( not ( = ?auto_837899 ?auto_837907 ) ) ( not ( = ?auto_837900 ?auto_837901 ) ) ( not ( = ?auto_837900 ?auto_837902 ) ) ( not ( = ?auto_837900 ?auto_837903 ) ) ( not ( = ?auto_837900 ?auto_837904 ) ) ( not ( = ?auto_837900 ?auto_837905 ) ) ( not ( = ?auto_837900 ?auto_837906 ) ) ( not ( = ?auto_837900 ?auto_837907 ) ) ( not ( = ?auto_837901 ?auto_837902 ) ) ( not ( = ?auto_837901 ?auto_837903 ) ) ( not ( = ?auto_837901 ?auto_837904 ) ) ( not ( = ?auto_837901 ?auto_837905 ) ) ( not ( = ?auto_837901 ?auto_837906 ) ) ( not ( = ?auto_837901 ?auto_837907 ) ) ( not ( = ?auto_837902 ?auto_837903 ) ) ( not ( = ?auto_837902 ?auto_837904 ) ) ( not ( = ?auto_837902 ?auto_837905 ) ) ( not ( = ?auto_837902 ?auto_837906 ) ) ( not ( = ?auto_837902 ?auto_837907 ) ) ( not ( = ?auto_837903 ?auto_837904 ) ) ( not ( = ?auto_837903 ?auto_837905 ) ) ( not ( = ?auto_837903 ?auto_837906 ) ) ( not ( = ?auto_837903 ?auto_837907 ) ) ( not ( = ?auto_837904 ?auto_837905 ) ) ( not ( = ?auto_837904 ?auto_837906 ) ) ( not ( = ?auto_837904 ?auto_837907 ) ) ( not ( = ?auto_837905 ?auto_837906 ) ) ( not ( = ?auto_837905 ?auto_837907 ) ) ( not ( = ?auto_837906 ?auto_837907 ) ) ( ON ?auto_837905 ?auto_837906 ) ( ON ?auto_837904 ?auto_837905 ) ( ON ?auto_837903 ?auto_837904 ) ( ON ?auto_837902 ?auto_837903 ) ( CLEAR ?auto_837900 ) ( ON ?auto_837901 ?auto_837902 ) ( CLEAR ?auto_837901 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_837897 ?auto_837898 ?auto_837899 ?auto_837900 ?auto_837901 )
      ( MAKE-10PILE ?auto_837897 ?auto_837898 ?auto_837899 ?auto_837900 ?auto_837901 ?auto_837902 ?auto_837903 ?auto_837904 ?auto_837905 ?auto_837906 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_837939 - BLOCK
      ?auto_837940 - BLOCK
      ?auto_837941 - BLOCK
      ?auto_837942 - BLOCK
      ?auto_837943 - BLOCK
      ?auto_837944 - BLOCK
      ?auto_837945 - BLOCK
      ?auto_837946 - BLOCK
      ?auto_837947 - BLOCK
      ?auto_837948 - BLOCK
    )
    :vars
    (
      ?auto_837949 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_837948 ?auto_837949 ) ( ON-TABLE ?auto_837939 ) ( ON ?auto_837940 ?auto_837939 ) ( ON ?auto_837941 ?auto_837940 ) ( not ( = ?auto_837939 ?auto_837940 ) ) ( not ( = ?auto_837939 ?auto_837941 ) ) ( not ( = ?auto_837939 ?auto_837942 ) ) ( not ( = ?auto_837939 ?auto_837943 ) ) ( not ( = ?auto_837939 ?auto_837944 ) ) ( not ( = ?auto_837939 ?auto_837945 ) ) ( not ( = ?auto_837939 ?auto_837946 ) ) ( not ( = ?auto_837939 ?auto_837947 ) ) ( not ( = ?auto_837939 ?auto_837948 ) ) ( not ( = ?auto_837939 ?auto_837949 ) ) ( not ( = ?auto_837940 ?auto_837941 ) ) ( not ( = ?auto_837940 ?auto_837942 ) ) ( not ( = ?auto_837940 ?auto_837943 ) ) ( not ( = ?auto_837940 ?auto_837944 ) ) ( not ( = ?auto_837940 ?auto_837945 ) ) ( not ( = ?auto_837940 ?auto_837946 ) ) ( not ( = ?auto_837940 ?auto_837947 ) ) ( not ( = ?auto_837940 ?auto_837948 ) ) ( not ( = ?auto_837940 ?auto_837949 ) ) ( not ( = ?auto_837941 ?auto_837942 ) ) ( not ( = ?auto_837941 ?auto_837943 ) ) ( not ( = ?auto_837941 ?auto_837944 ) ) ( not ( = ?auto_837941 ?auto_837945 ) ) ( not ( = ?auto_837941 ?auto_837946 ) ) ( not ( = ?auto_837941 ?auto_837947 ) ) ( not ( = ?auto_837941 ?auto_837948 ) ) ( not ( = ?auto_837941 ?auto_837949 ) ) ( not ( = ?auto_837942 ?auto_837943 ) ) ( not ( = ?auto_837942 ?auto_837944 ) ) ( not ( = ?auto_837942 ?auto_837945 ) ) ( not ( = ?auto_837942 ?auto_837946 ) ) ( not ( = ?auto_837942 ?auto_837947 ) ) ( not ( = ?auto_837942 ?auto_837948 ) ) ( not ( = ?auto_837942 ?auto_837949 ) ) ( not ( = ?auto_837943 ?auto_837944 ) ) ( not ( = ?auto_837943 ?auto_837945 ) ) ( not ( = ?auto_837943 ?auto_837946 ) ) ( not ( = ?auto_837943 ?auto_837947 ) ) ( not ( = ?auto_837943 ?auto_837948 ) ) ( not ( = ?auto_837943 ?auto_837949 ) ) ( not ( = ?auto_837944 ?auto_837945 ) ) ( not ( = ?auto_837944 ?auto_837946 ) ) ( not ( = ?auto_837944 ?auto_837947 ) ) ( not ( = ?auto_837944 ?auto_837948 ) ) ( not ( = ?auto_837944 ?auto_837949 ) ) ( not ( = ?auto_837945 ?auto_837946 ) ) ( not ( = ?auto_837945 ?auto_837947 ) ) ( not ( = ?auto_837945 ?auto_837948 ) ) ( not ( = ?auto_837945 ?auto_837949 ) ) ( not ( = ?auto_837946 ?auto_837947 ) ) ( not ( = ?auto_837946 ?auto_837948 ) ) ( not ( = ?auto_837946 ?auto_837949 ) ) ( not ( = ?auto_837947 ?auto_837948 ) ) ( not ( = ?auto_837947 ?auto_837949 ) ) ( not ( = ?auto_837948 ?auto_837949 ) ) ( ON ?auto_837947 ?auto_837948 ) ( ON ?auto_837946 ?auto_837947 ) ( ON ?auto_837945 ?auto_837946 ) ( ON ?auto_837944 ?auto_837945 ) ( ON ?auto_837943 ?auto_837944 ) ( CLEAR ?auto_837941 ) ( ON ?auto_837942 ?auto_837943 ) ( CLEAR ?auto_837942 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_837939 ?auto_837940 ?auto_837941 ?auto_837942 )
      ( MAKE-10PILE ?auto_837939 ?auto_837940 ?auto_837941 ?auto_837942 ?auto_837943 ?auto_837944 ?auto_837945 ?auto_837946 ?auto_837947 ?auto_837948 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_837981 - BLOCK
      ?auto_837982 - BLOCK
      ?auto_837983 - BLOCK
      ?auto_837984 - BLOCK
      ?auto_837985 - BLOCK
      ?auto_837986 - BLOCK
      ?auto_837987 - BLOCK
      ?auto_837988 - BLOCK
      ?auto_837989 - BLOCK
      ?auto_837990 - BLOCK
    )
    :vars
    (
      ?auto_837991 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_837990 ?auto_837991 ) ( ON-TABLE ?auto_837981 ) ( ON ?auto_837982 ?auto_837981 ) ( not ( = ?auto_837981 ?auto_837982 ) ) ( not ( = ?auto_837981 ?auto_837983 ) ) ( not ( = ?auto_837981 ?auto_837984 ) ) ( not ( = ?auto_837981 ?auto_837985 ) ) ( not ( = ?auto_837981 ?auto_837986 ) ) ( not ( = ?auto_837981 ?auto_837987 ) ) ( not ( = ?auto_837981 ?auto_837988 ) ) ( not ( = ?auto_837981 ?auto_837989 ) ) ( not ( = ?auto_837981 ?auto_837990 ) ) ( not ( = ?auto_837981 ?auto_837991 ) ) ( not ( = ?auto_837982 ?auto_837983 ) ) ( not ( = ?auto_837982 ?auto_837984 ) ) ( not ( = ?auto_837982 ?auto_837985 ) ) ( not ( = ?auto_837982 ?auto_837986 ) ) ( not ( = ?auto_837982 ?auto_837987 ) ) ( not ( = ?auto_837982 ?auto_837988 ) ) ( not ( = ?auto_837982 ?auto_837989 ) ) ( not ( = ?auto_837982 ?auto_837990 ) ) ( not ( = ?auto_837982 ?auto_837991 ) ) ( not ( = ?auto_837983 ?auto_837984 ) ) ( not ( = ?auto_837983 ?auto_837985 ) ) ( not ( = ?auto_837983 ?auto_837986 ) ) ( not ( = ?auto_837983 ?auto_837987 ) ) ( not ( = ?auto_837983 ?auto_837988 ) ) ( not ( = ?auto_837983 ?auto_837989 ) ) ( not ( = ?auto_837983 ?auto_837990 ) ) ( not ( = ?auto_837983 ?auto_837991 ) ) ( not ( = ?auto_837984 ?auto_837985 ) ) ( not ( = ?auto_837984 ?auto_837986 ) ) ( not ( = ?auto_837984 ?auto_837987 ) ) ( not ( = ?auto_837984 ?auto_837988 ) ) ( not ( = ?auto_837984 ?auto_837989 ) ) ( not ( = ?auto_837984 ?auto_837990 ) ) ( not ( = ?auto_837984 ?auto_837991 ) ) ( not ( = ?auto_837985 ?auto_837986 ) ) ( not ( = ?auto_837985 ?auto_837987 ) ) ( not ( = ?auto_837985 ?auto_837988 ) ) ( not ( = ?auto_837985 ?auto_837989 ) ) ( not ( = ?auto_837985 ?auto_837990 ) ) ( not ( = ?auto_837985 ?auto_837991 ) ) ( not ( = ?auto_837986 ?auto_837987 ) ) ( not ( = ?auto_837986 ?auto_837988 ) ) ( not ( = ?auto_837986 ?auto_837989 ) ) ( not ( = ?auto_837986 ?auto_837990 ) ) ( not ( = ?auto_837986 ?auto_837991 ) ) ( not ( = ?auto_837987 ?auto_837988 ) ) ( not ( = ?auto_837987 ?auto_837989 ) ) ( not ( = ?auto_837987 ?auto_837990 ) ) ( not ( = ?auto_837987 ?auto_837991 ) ) ( not ( = ?auto_837988 ?auto_837989 ) ) ( not ( = ?auto_837988 ?auto_837990 ) ) ( not ( = ?auto_837988 ?auto_837991 ) ) ( not ( = ?auto_837989 ?auto_837990 ) ) ( not ( = ?auto_837989 ?auto_837991 ) ) ( not ( = ?auto_837990 ?auto_837991 ) ) ( ON ?auto_837989 ?auto_837990 ) ( ON ?auto_837988 ?auto_837989 ) ( ON ?auto_837987 ?auto_837988 ) ( ON ?auto_837986 ?auto_837987 ) ( ON ?auto_837985 ?auto_837986 ) ( ON ?auto_837984 ?auto_837985 ) ( CLEAR ?auto_837982 ) ( ON ?auto_837983 ?auto_837984 ) ( CLEAR ?auto_837983 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_837981 ?auto_837982 ?auto_837983 )
      ( MAKE-10PILE ?auto_837981 ?auto_837982 ?auto_837983 ?auto_837984 ?auto_837985 ?auto_837986 ?auto_837987 ?auto_837988 ?auto_837989 ?auto_837990 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_838023 - BLOCK
      ?auto_838024 - BLOCK
      ?auto_838025 - BLOCK
      ?auto_838026 - BLOCK
      ?auto_838027 - BLOCK
      ?auto_838028 - BLOCK
      ?auto_838029 - BLOCK
      ?auto_838030 - BLOCK
      ?auto_838031 - BLOCK
      ?auto_838032 - BLOCK
    )
    :vars
    (
      ?auto_838033 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_838032 ?auto_838033 ) ( ON-TABLE ?auto_838023 ) ( not ( = ?auto_838023 ?auto_838024 ) ) ( not ( = ?auto_838023 ?auto_838025 ) ) ( not ( = ?auto_838023 ?auto_838026 ) ) ( not ( = ?auto_838023 ?auto_838027 ) ) ( not ( = ?auto_838023 ?auto_838028 ) ) ( not ( = ?auto_838023 ?auto_838029 ) ) ( not ( = ?auto_838023 ?auto_838030 ) ) ( not ( = ?auto_838023 ?auto_838031 ) ) ( not ( = ?auto_838023 ?auto_838032 ) ) ( not ( = ?auto_838023 ?auto_838033 ) ) ( not ( = ?auto_838024 ?auto_838025 ) ) ( not ( = ?auto_838024 ?auto_838026 ) ) ( not ( = ?auto_838024 ?auto_838027 ) ) ( not ( = ?auto_838024 ?auto_838028 ) ) ( not ( = ?auto_838024 ?auto_838029 ) ) ( not ( = ?auto_838024 ?auto_838030 ) ) ( not ( = ?auto_838024 ?auto_838031 ) ) ( not ( = ?auto_838024 ?auto_838032 ) ) ( not ( = ?auto_838024 ?auto_838033 ) ) ( not ( = ?auto_838025 ?auto_838026 ) ) ( not ( = ?auto_838025 ?auto_838027 ) ) ( not ( = ?auto_838025 ?auto_838028 ) ) ( not ( = ?auto_838025 ?auto_838029 ) ) ( not ( = ?auto_838025 ?auto_838030 ) ) ( not ( = ?auto_838025 ?auto_838031 ) ) ( not ( = ?auto_838025 ?auto_838032 ) ) ( not ( = ?auto_838025 ?auto_838033 ) ) ( not ( = ?auto_838026 ?auto_838027 ) ) ( not ( = ?auto_838026 ?auto_838028 ) ) ( not ( = ?auto_838026 ?auto_838029 ) ) ( not ( = ?auto_838026 ?auto_838030 ) ) ( not ( = ?auto_838026 ?auto_838031 ) ) ( not ( = ?auto_838026 ?auto_838032 ) ) ( not ( = ?auto_838026 ?auto_838033 ) ) ( not ( = ?auto_838027 ?auto_838028 ) ) ( not ( = ?auto_838027 ?auto_838029 ) ) ( not ( = ?auto_838027 ?auto_838030 ) ) ( not ( = ?auto_838027 ?auto_838031 ) ) ( not ( = ?auto_838027 ?auto_838032 ) ) ( not ( = ?auto_838027 ?auto_838033 ) ) ( not ( = ?auto_838028 ?auto_838029 ) ) ( not ( = ?auto_838028 ?auto_838030 ) ) ( not ( = ?auto_838028 ?auto_838031 ) ) ( not ( = ?auto_838028 ?auto_838032 ) ) ( not ( = ?auto_838028 ?auto_838033 ) ) ( not ( = ?auto_838029 ?auto_838030 ) ) ( not ( = ?auto_838029 ?auto_838031 ) ) ( not ( = ?auto_838029 ?auto_838032 ) ) ( not ( = ?auto_838029 ?auto_838033 ) ) ( not ( = ?auto_838030 ?auto_838031 ) ) ( not ( = ?auto_838030 ?auto_838032 ) ) ( not ( = ?auto_838030 ?auto_838033 ) ) ( not ( = ?auto_838031 ?auto_838032 ) ) ( not ( = ?auto_838031 ?auto_838033 ) ) ( not ( = ?auto_838032 ?auto_838033 ) ) ( ON ?auto_838031 ?auto_838032 ) ( ON ?auto_838030 ?auto_838031 ) ( ON ?auto_838029 ?auto_838030 ) ( ON ?auto_838028 ?auto_838029 ) ( ON ?auto_838027 ?auto_838028 ) ( ON ?auto_838026 ?auto_838027 ) ( ON ?auto_838025 ?auto_838026 ) ( CLEAR ?auto_838023 ) ( ON ?auto_838024 ?auto_838025 ) ( CLEAR ?auto_838024 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_838023 ?auto_838024 )
      ( MAKE-10PILE ?auto_838023 ?auto_838024 ?auto_838025 ?auto_838026 ?auto_838027 ?auto_838028 ?auto_838029 ?auto_838030 ?auto_838031 ?auto_838032 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_838065 - BLOCK
      ?auto_838066 - BLOCK
      ?auto_838067 - BLOCK
      ?auto_838068 - BLOCK
      ?auto_838069 - BLOCK
      ?auto_838070 - BLOCK
      ?auto_838071 - BLOCK
      ?auto_838072 - BLOCK
      ?auto_838073 - BLOCK
      ?auto_838074 - BLOCK
    )
    :vars
    (
      ?auto_838075 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_838074 ?auto_838075 ) ( not ( = ?auto_838065 ?auto_838066 ) ) ( not ( = ?auto_838065 ?auto_838067 ) ) ( not ( = ?auto_838065 ?auto_838068 ) ) ( not ( = ?auto_838065 ?auto_838069 ) ) ( not ( = ?auto_838065 ?auto_838070 ) ) ( not ( = ?auto_838065 ?auto_838071 ) ) ( not ( = ?auto_838065 ?auto_838072 ) ) ( not ( = ?auto_838065 ?auto_838073 ) ) ( not ( = ?auto_838065 ?auto_838074 ) ) ( not ( = ?auto_838065 ?auto_838075 ) ) ( not ( = ?auto_838066 ?auto_838067 ) ) ( not ( = ?auto_838066 ?auto_838068 ) ) ( not ( = ?auto_838066 ?auto_838069 ) ) ( not ( = ?auto_838066 ?auto_838070 ) ) ( not ( = ?auto_838066 ?auto_838071 ) ) ( not ( = ?auto_838066 ?auto_838072 ) ) ( not ( = ?auto_838066 ?auto_838073 ) ) ( not ( = ?auto_838066 ?auto_838074 ) ) ( not ( = ?auto_838066 ?auto_838075 ) ) ( not ( = ?auto_838067 ?auto_838068 ) ) ( not ( = ?auto_838067 ?auto_838069 ) ) ( not ( = ?auto_838067 ?auto_838070 ) ) ( not ( = ?auto_838067 ?auto_838071 ) ) ( not ( = ?auto_838067 ?auto_838072 ) ) ( not ( = ?auto_838067 ?auto_838073 ) ) ( not ( = ?auto_838067 ?auto_838074 ) ) ( not ( = ?auto_838067 ?auto_838075 ) ) ( not ( = ?auto_838068 ?auto_838069 ) ) ( not ( = ?auto_838068 ?auto_838070 ) ) ( not ( = ?auto_838068 ?auto_838071 ) ) ( not ( = ?auto_838068 ?auto_838072 ) ) ( not ( = ?auto_838068 ?auto_838073 ) ) ( not ( = ?auto_838068 ?auto_838074 ) ) ( not ( = ?auto_838068 ?auto_838075 ) ) ( not ( = ?auto_838069 ?auto_838070 ) ) ( not ( = ?auto_838069 ?auto_838071 ) ) ( not ( = ?auto_838069 ?auto_838072 ) ) ( not ( = ?auto_838069 ?auto_838073 ) ) ( not ( = ?auto_838069 ?auto_838074 ) ) ( not ( = ?auto_838069 ?auto_838075 ) ) ( not ( = ?auto_838070 ?auto_838071 ) ) ( not ( = ?auto_838070 ?auto_838072 ) ) ( not ( = ?auto_838070 ?auto_838073 ) ) ( not ( = ?auto_838070 ?auto_838074 ) ) ( not ( = ?auto_838070 ?auto_838075 ) ) ( not ( = ?auto_838071 ?auto_838072 ) ) ( not ( = ?auto_838071 ?auto_838073 ) ) ( not ( = ?auto_838071 ?auto_838074 ) ) ( not ( = ?auto_838071 ?auto_838075 ) ) ( not ( = ?auto_838072 ?auto_838073 ) ) ( not ( = ?auto_838072 ?auto_838074 ) ) ( not ( = ?auto_838072 ?auto_838075 ) ) ( not ( = ?auto_838073 ?auto_838074 ) ) ( not ( = ?auto_838073 ?auto_838075 ) ) ( not ( = ?auto_838074 ?auto_838075 ) ) ( ON ?auto_838073 ?auto_838074 ) ( ON ?auto_838072 ?auto_838073 ) ( ON ?auto_838071 ?auto_838072 ) ( ON ?auto_838070 ?auto_838071 ) ( ON ?auto_838069 ?auto_838070 ) ( ON ?auto_838068 ?auto_838069 ) ( ON ?auto_838067 ?auto_838068 ) ( ON ?auto_838066 ?auto_838067 ) ( ON ?auto_838065 ?auto_838066 ) ( CLEAR ?auto_838065 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_838065 )
      ( MAKE-10PILE ?auto_838065 ?auto_838066 ?auto_838067 ?auto_838068 ?auto_838069 ?auto_838070 ?auto_838071 ?auto_838072 ?auto_838073 ?auto_838074 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_838108 - BLOCK
      ?auto_838109 - BLOCK
      ?auto_838110 - BLOCK
      ?auto_838111 - BLOCK
      ?auto_838112 - BLOCK
      ?auto_838113 - BLOCK
      ?auto_838114 - BLOCK
      ?auto_838115 - BLOCK
      ?auto_838116 - BLOCK
      ?auto_838117 - BLOCK
      ?auto_838118 - BLOCK
    )
    :vars
    (
      ?auto_838119 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_838117 ) ( ON ?auto_838118 ?auto_838119 ) ( CLEAR ?auto_838118 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_838108 ) ( ON ?auto_838109 ?auto_838108 ) ( ON ?auto_838110 ?auto_838109 ) ( ON ?auto_838111 ?auto_838110 ) ( ON ?auto_838112 ?auto_838111 ) ( ON ?auto_838113 ?auto_838112 ) ( ON ?auto_838114 ?auto_838113 ) ( ON ?auto_838115 ?auto_838114 ) ( ON ?auto_838116 ?auto_838115 ) ( ON ?auto_838117 ?auto_838116 ) ( not ( = ?auto_838108 ?auto_838109 ) ) ( not ( = ?auto_838108 ?auto_838110 ) ) ( not ( = ?auto_838108 ?auto_838111 ) ) ( not ( = ?auto_838108 ?auto_838112 ) ) ( not ( = ?auto_838108 ?auto_838113 ) ) ( not ( = ?auto_838108 ?auto_838114 ) ) ( not ( = ?auto_838108 ?auto_838115 ) ) ( not ( = ?auto_838108 ?auto_838116 ) ) ( not ( = ?auto_838108 ?auto_838117 ) ) ( not ( = ?auto_838108 ?auto_838118 ) ) ( not ( = ?auto_838108 ?auto_838119 ) ) ( not ( = ?auto_838109 ?auto_838110 ) ) ( not ( = ?auto_838109 ?auto_838111 ) ) ( not ( = ?auto_838109 ?auto_838112 ) ) ( not ( = ?auto_838109 ?auto_838113 ) ) ( not ( = ?auto_838109 ?auto_838114 ) ) ( not ( = ?auto_838109 ?auto_838115 ) ) ( not ( = ?auto_838109 ?auto_838116 ) ) ( not ( = ?auto_838109 ?auto_838117 ) ) ( not ( = ?auto_838109 ?auto_838118 ) ) ( not ( = ?auto_838109 ?auto_838119 ) ) ( not ( = ?auto_838110 ?auto_838111 ) ) ( not ( = ?auto_838110 ?auto_838112 ) ) ( not ( = ?auto_838110 ?auto_838113 ) ) ( not ( = ?auto_838110 ?auto_838114 ) ) ( not ( = ?auto_838110 ?auto_838115 ) ) ( not ( = ?auto_838110 ?auto_838116 ) ) ( not ( = ?auto_838110 ?auto_838117 ) ) ( not ( = ?auto_838110 ?auto_838118 ) ) ( not ( = ?auto_838110 ?auto_838119 ) ) ( not ( = ?auto_838111 ?auto_838112 ) ) ( not ( = ?auto_838111 ?auto_838113 ) ) ( not ( = ?auto_838111 ?auto_838114 ) ) ( not ( = ?auto_838111 ?auto_838115 ) ) ( not ( = ?auto_838111 ?auto_838116 ) ) ( not ( = ?auto_838111 ?auto_838117 ) ) ( not ( = ?auto_838111 ?auto_838118 ) ) ( not ( = ?auto_838111 ?auto_838119 ) ) ( not ( = ?auto_838112 ?auto_838113 ) ) ( not ( = ?auto_838112 ?auto_838114 ) ) ( not ( = ?auto_838112 ?auto_838115 ) ) ( not ( = ?auto_838112 ?auto_838116 ) ) ( not ( = ?auto_838112 ?auto_838117 ) ) ( not ( = ?auto_838112 ?auto_838118 ) ) ( not ( = ?auto_838112 ?auto_838119 ) ) ( not ( = ?auto_838113 ?auto_838114 ) ) ( not ( = ?auto_838113 ?auto_838115 ) ) ( not ( = ?auto_838113 ?auto_838116 ) ) ( not ( = ?auto_838113 ?auto_838117 ) ) ( not ( = ?auto_838113 ?auto_838118 ) ) ( not ( = ?auto_838113 ?auto_838119 ) ) ( not ( = ?auto_838114 ?auto_838115 ) ) ( not ( = ?auto_838114 ?auto_838116 ) ) ( not ( = ?auto_838114 ?auto_838117 ) ) ( not ( = ?auto_838114 ?auto_838118 ) ) ( not ( = ?auto_838114 ?auto_838119 ) ) ( not ( = ?auto_838115 ?auto_838116 ) ) ( not ( = ?auto_838115 ?auto_838117 ) ) ( not ( = ?auto_838115 ?auto_838118 ) ) ( not ( = ?auto_838115 ?auto_838119 ) ) ( not ( = ?auto_838116 ?auto_838117 ) ) ( not ( = ?auto_838116 ?auto_838118 ) ) ( not ( = ?auto_838116 ?auto_838119 ) ) ( not ( = ?auto_838117 ?auto_838118 ) ) ( not ( = ?auto_838117 ?auto_838119 ) ) ( not ( = ?auto_838118 ?auto_838119 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_838118 ?auto_838119 )
      ( !STACK ?auto_838118 ?auto_838117 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_838154 - BLOCK
      ?auto_838155 - BLOCK
      ?auto_838156 - BLOCK
      ?auto_838157 - BLOCK
      ?auto_838158 - BLOCK
      ?auto_838159 - BLOCK
      ?auto_838160 - BLOCK
      ?auto_838161 - BLOCK
      ?auto_838162 - BLOCK
      ?auto_838163 - BLOCK
      ?auto_838164 - BLOCK
    )
    :vars
    (
      ?auto_838165 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_838164 ?auto_838165 ) ( ON-TABLE ?auto_838154 ) ( ON ?auto_838155 ?auto_838154 ) ( ON ?auto_838156 ?auto_838155 ) ( ON ?auto_838157 ?auto_838156 ) ( ON ?auto_838158 ?auto_838157 ) ( ON ?auto_838159 ?auto_838158 ) ( ON ?auto_838160 ?auto_838159 ) ( ON ?auto_838161 ?auto_838160 ) ( ON ?auto_838162 ?auto_838161 ) ( not ( = ?auto_838154 ?auto_838155 ) ) ( not ( = ?auto_838154 ?auto_838156 ) ) ( not ( = ?auto_838154 ?auto_838157 ) ) ( not ( = ?auto_838154 ?auto_838158 ) ) ( not ( = ?auto_838154 ?auto_838159 ) ) ( not ( = ?auto_838154 ?auto_838160 ) ) ( not ( = ?auto_838154 ?auto_838161 ) ) ( not ( = ?auto_838154 ?auto_838162 ) ) ( not ( = ?auto_838154 ?auto_838163 ) ) ( not ( = ?auto_838154 ?auto_838164 ) ) ( not ( = ?auto_838154 ?auto_838165 ) ) ( not ( = ?auto_838155 ?auto_838156 ) ) ( not ( = ?auto_838155 ?auto_838157 ) ) ( not ( = ?auto_838155 ?auto_838158 ) ) ( not ( = ?auto_838155 ?auto_838159 ) ) ( not ( = ?auto_838155 ?auto_838160 ) ) ( not ( = ?auto_838155 ?auto_838161 ) ) ( not ( = ?auto_838155 ?auto_838162 ) ) ( not ( = ?auto_838155 ?auto_838163 ) ) ( not ( = ?auto_838155 ?auto_838164 ) ) ( not ( = ?auto_838155 ?auto_838165 ) ) ( not ( = ?auto_838156 ?auto_838157 ) ) ( not ( = ?auto_838156 ?auto_838158 ) ) ( not ( = ?auto_838156 ?auto_838159 ) ) ( not ( = ?auto_838156 ?auto_838160 ) ) ( not ( = ?auto_838156 ?auto_838161 ) ) ( not ( = ?auto_838156 ?auto_838162 ) ) ( not ( = ?auto_838156 ?auto_838163 ) ) ( not ( = ?auto_838156 ?auto_838164 ) ) ( not ( = ?auto_838156 ?auto_838165 ) ) ( not ( = ?auto_838157 ?auto_838158 ) ) ( not ( = ?auto_838157 ?auto_838159 ) ) ( not ( = ?auto_838157 ?auto_838160 ) ) ( not ( = ?auto_838157 ?auto_838161 ) ) ( not ( = ?auto_838157 ?auto_838162 ) ) ( not ( = ?auto_838157 ?auto_838163 ) ) ( not ( = ?auto_838157 ?auto_838164 ) ) ( not ( = ?auto_838157 ?auto_838165 ) ) ( not ( = ?auto_838158 ?auto_838159 ) ) ( not ( = ?auto_838158 ?auto_838160 ) ) ( not ( = ?auto_838158 ?auto_838161 ) ) ( not ( = ?auto_838158 ?auto_838162 ) ) ( not ( = ?auto_838158 ?auto_838163 ) ) ( not ( = ?auto_838158 ?auto_838164 ) ) ( not ( = ?auto_838158 ?auto_838165 ) ) ( not ( = ?auto_838159 ?auto_838160 ) ) ( not ( = ?auto_838159 ?auto_838161 ) ) ( not ( = ?auto_838159 ?auto_838162 ) ) ( not ( = ?auto_838159 ?auto_838163 ) ) ( not ( = ?auto_838159 ?auto_838164 ) ) ( not ( = ?auto_838159 ?auto_838165 ) ) ( not ( = ?auto_838160 ?auto_838161 ) ) ( not ( = ?auto_838160 ?auto_838162 ) ) ( not ( = ?auto_838160 ?auto_838163 ) ) ( not ( = ?auto_838160 ?auto_838164 ) ) ( not ( = ?auto_838160 ?auto_838165 ) ) ( not ( = ?auto_838161 ?auto_838162 ) ) ( not ( = ?auto_838161 ?auto_838163 ) ) ( not ( = ?auto_838161 ?auto_838164 ) ) ( not ( = ?auto_838161 ?auto_838165 ) ) ( not ( = ?auto_838162 ?auto_838163 ) ) ( not ( = ?auto_838162 ?auto_838164 ) ) ( not ( = ?auto_838162 ?auto_838165 ) ) ( not ( = ?auto_838163 ?auto_838164 ) ) ( not ( = ?auto_838163 ?auto_838165 ) ) ( not ( = ?auto_838164 ?auto_838165 ) ) ( CLEAR ?auto_838162 ) ( ON ?auto_838163 ?auto_838164 ) ( CLEAR ?auto_838163 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_838154 ?auto_838155 ?auto_838156 ?auto_838157 ?auto_838158 ?auto_838159 ?auto_838160 ?auto_838161 ?auto_838162 ?auto_838163 )
      ( MAKE-11PILE ?auto_838154 ?auto_838155 ?auto_838156 ?auto_838157 ?auto_838158 ?auto_838159 ?auto_838160 ?auto_838161 ?auto_838162 ?auto_838163 ?auto_838164 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_838200 - BLOCK
      ?auto_838201 - BLOCK
      ?auto_838202 - BLOCK
      ?auto_838203 - BLOCK
      ?auto_838204 - BLOCK
      ?auto_838205 - BLOCK
      ?auto_838206 - BLOCK
      ?auto_838207 - BLOCK
      ?auto_838208 - BLOCK
      ?auto_838209 - BLOCK
      ?auto_838210 - BLOCK
    )
    :vars
    (
      ?auto_838211 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_838210 ?auto_838211 ) ( ON-TABLE ?auto_838200 ) ( ON ?auto_838201 ?auto_838200 ) ( ON ?auto_838202 ?auto_838201 ) ( ON ?auto_838203 ?auto_838202 ) ( ON ?auto_838204 ?auto_838203 ) ( ON ?auto_838205 ?auto_838204 ) ( ON ?auto_838206 ?auto_838205 ) ( ON ?auto_838207 ?auto_838206 ) ( not ( = ?auto_838200 ?auto_838201 ) ) ( not ( = ?auto_838200 ?auto_838202 ) ) ( not ( = ?auto_838200 ?auto_838203 ) ) ( not ( = ?auto_838200 ?auto_838204 ) ) ( not ( = ?auto_838200 ?auto_838205 ) ) ( not ( = ?auto_838200 ?auto_838206 ) ) ( not ( = ?auto_838200 ?auto_838207 ) ) ( not ( = ?auto_838200 ?auto_838208 ) ) ( not ( = ?auto_838200 ?auto_838209 ) ) ( not ( = ?auto_838200 ?auto_838210 ) ) ( not ( = ?auto_838200 ?auto_838211 ) ) ( not ( = ?auto_838201 ?auto_838202 ) ) ( not ( = ?auto_838201 ?auto_838203 ) ) ( not ( = ?auto_838201 ?auto_838204 ) ) ( not ( = ?auto_838201 ?auto_838205 ) ) ( not ( = ?auto_838201 ?auto_838206 ) ) ( not ( = ?auto_838201 ?auto_838207 ) ) ( not ( = ?auto_838201 ?auto_838208 ) ) ( not ( = ?auto_838201 ?auto_838209 ) ) ( not ( = ?auto_838201 ?auto_838210 ) ) ( not ( = ?auto_838201 ?auto_838211 ) ) ( not ( = ?auto_838202 ?auto_838203 ) ) ( not ( = ?auto_838202 ?auto_838204 ) ) ( not ( = ?auto_838202 ?auto_838205 ) ) ( not ( = ?auto_838202 ?auto_838206 ) ) ( not ( = ?auto_838202 ?auto_838207 ) ) ( not ( = ?auto_838202 ?auto_838208 ) ) ( not ( = ?auto_838202 ?auto_838209 ) ) ( not ( = ?auto_838202 ?auto_838210 ) ) ( not ( = ?auto_838202 ?auto_838211 ) ) ( not ( = ?auto_838203 ?auto_838204 ) ) ( not ( = ?auto_838203 ?auto_838205 ) ) ( not ( = ?auto_838203 ?auto_838206 ) ) ( not ( = ?auto_838203 ?auto_838207 ) ) ( not ( = ?auto_838203 ?auto_838208 ) ) ( not ( = ?auto_838203 ?auto_838209 ) ) ( not ( = ?auto_838203 ?auto_838210 ) ) ( not ( = ?auto_838203 ?auto_838211 ) ) ( not ( = ?auto_838204 ?auto_838205 ) ) ( not ( = ?auto_838204 ?auto_838206 ) ) ( not ( = ?auto_838204 ?auto_838207 ) ) ( not ( = ?auto_838204 ?auto_838208 ) ) ( not ( = ?auto_838204 ?auto_838209 ) ) ( not ( = ?auto_838204 ?auto_838210 ) ) ( not ( = ?auto_838204 ?auto_838211 ) ) ( not ( = ?auto_838205 ?auto_838206 ) ) ( not ( = ?auto_838205 ?auto_838207 ) ) ( not ( = ?auto_838205 ?auto_838208 ) ) ( not ( = ?auto_838205 ?auto_838209 ) ) ( not ( = ?auto_838205 ?auto_838210 ) ) ( not ( = ?auto_838205 ?auto_838211 ) ) ( not ( = ?auto_838206 ?auto_838207 ) ) ( not ( = ?auto_838206 ?auto_838208 ) ) ( not ( = ?auto_838206 ?auto_838209 ) ) ( not ( = ?auto_838206 ?auto_838210 ) ) ( not ( = ?auto_838206 ?auto_838211 ) ) ( not ( = ?auto_838207 ?auto_838208 ) ) ( not ( = ?auto_838207 ?auto_838209 ) ) ( not ( = ?auto_838207 ?auto_838210 ) ) ( not ( = ?auto_838207 ?auto_838211 ) ) ( not ( = ?auto_838208 ?auto_838209 ) ) ( not ( = ?auto_838208 ?auto_838210 ) ) ( not ( = ?auto_838208 ?auto_838211 ) ) ( not ( = ?auto_838209 ?auto_838210 ) ) ( not ( = ?auto_838209 ?auto_838211 ) ) ( not ( = ?auto_838210 ?auto_838211 ) ) ( ON ?auto_838209 ?auto_838210 ) ( CLEAR ?auto_838207 ) ( ON ?auto_838208 ?auto_838209 ) ( CLEAR ?auto_838208 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_838200 ?auto_838201 ?auto_838202 ?auto_838203 ?auto_838204 ?auto_838205 ?auto_838206 ?auto_838207 ?auto_838208 )
      ( MAKE-11PILE ?auto_838200 ?auto_838201 ?auto_838202 ?auto_838203 ?auto_838204 ?auto_838205 ?auto_838206 ?auto_838207 ?auto_838208 ?auto_838209 ?auto_838210 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_838246 - BLOCK
      ?auto_838247 - BLOCK
      ?auto_838248 - BLOCK
      ?auto_838249 - BLOCK
      ?auto_838250 - BLOCK
      ?auto_838251 - BLOCK
      ?auto_838252 - BLOCK
      ?auto_838253 - BLOCK
      ?auto_838254 - BLOCK
      ?auto_838255 - BLOCK
      ?auto_838256 - BLOCK
    )
    :vars
    (
      ?auto_838257 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_838256 ?auto_838257 ) ( ON-TABLE ?auto_838246 ) ( ON ?auto_838247 ?auto_838246 ) ( ON ?auto_838248 ?auto_838247 ) ( ON ?auto_838249 ?auto_838248 ) ( ON ?auto_838250 ?auto_838249 ) ( ON ?auto_838251 ?auto_838250 ) ( ON ?auto_838252 ?auto_838251 ) ( not ( = ?auto_838246 ?auto_838247 ) ) ( not ( = ?auto_838246 ?auto_838248 ) ) ( not ( = ?auto_838246 ?auto_838249 ) ) ( not ( = ?auto_838246 ?auto_838250 ) ) ( not ( = ?auto_838246 ?auto_838251 ) ) ( not ( = ?auto_838246 ?auto_838252 ) ) ( not ( = ?auto_838246 ?auto_838253 ) ) ( not ( = ?auto_838246 ?auto_838254 ) ) ( not ( = ?auto_838246 ?auto_838255 ) ) ( not ( = ?auto_838246 ?auto_838256 ) ) ( not ( = ?auto_838246 ?auto_838257 ) ) ( not ( = ?auto_838247 ?auto_838248 ) ) ( not ( = ?auto_838247 ?auto_838249 ) ) ( not ( = ?auto_838247 ?auto_838250 ) ) ( not ( = ?auto_838247 ?auto_838251 ) ) ( not ( = ?auto_838247 ?auto_838252 ) ) ( not ( = ?auto_838247 ?auto_838253 ) ) ( not ( = ?auto_838247 ?auto_838254 ) ) ( not ( = ?auto_838247 ?auto_838255 ) ) ( not ( = ?auto_838247 ?auto_838256 ) ) ( not ( = ?auto_838247 ?auto_838257 ) ) ( not ( = ?auto_838248 ?auto_838249 ) ) ( not ( = ?auto_838248 ?auto_838250 ) ) ( not ( = ?auto_838248 ?auto_838251 ) ) ( not ( = ?auto_838248 ?auto_838252 ) ) ( not ( = ?auto_838248 ?auto_838253 ) ) ( not ( = ?auto_838248 ?auto_838254 ) ) ( not ( = ?auto_838248 ?auto_838255 ) ) ( not ( = ?auto_838248 ?auto_838256 ) ) ( not ( = ?auto_838248 ?auto_838257 ) ) ( not ( = ?auto_838249 ?auto_838250 ) ) ( not ( = ?auto_838249 ?auto_838251 ) ) ( not ( = ?auto_838249 ?auto_838252 ) ) ( not ( = ?auto_838249 ?auto_838253 ) ) ( not ( = ?auto_838249 ?auto_838254 ) ) ( not ( = ?auto_838249 ?auto_838255 ) ) ( not ( = ?auto_838249 ?auto_838256 ) ) ( not ( = ?auto_838249 ?auto_838257 ) ) ( not ( = ?auto_838250 ?auto_838251 ) ) ( not ( = ?auto_838250 ?auto_838252 ) ) ( not ( = ?auto_838250 ?auto_838253 ) ) ( not ( = ?auto_838250 ?auto_838254 ) ) ( not ( = ?auto_838250 ?auto_838255 ) ) ( not ( = ?auto_838250 ?auto_838256 ) ) ( not ( = ?auto_838250 ?auto_838257 ) ) ( not ( = ?auto_838251 ?auto_838252 ) ) ( not ( = ?auto_838251 ?auto_838253 ) ) ( not ( = ?auto_838251 ?auto_838254 ) ) ( not ( = ?auto_838251 ?auto_838255 ) ) ( not ( = ?auto_838251 ?auto_838256 ) ) ( not ( = ?auto_838251 ?auto_838257 ) ) ( not ( = ?auto_838252 ?auto_838253 ) ) ( not ( = ?auto_838252 ?auto_838254 ) ) ( not ( = ?auto_838252 ?auto_838255 ) ) ( not ( = ?auto_838252 ?auto_838256 ) ) ( not ( = ?auto_838252 ?auto_838257 ) ) ( not ( = ?auto_838253 ?auto_838254 ) ) ( not ( = ?auto_838253 ?auto_838255 ) ) ( not ( = ?auto_838253 ?auto_838256 ) ) ( not ( = ?auto_838253 ?auto_838257 ) ) ( not ( = ?auto_838254 ?auto_838255 ) ) ( not ( = ?auto_838254 ?auto_838256 ) ) ( not ( = ?auto_838254 ?auto_838257 ) ) ( not ( = ?auto_838255 ?auto_838256 ) ) ( not ( = ?auto_838255 ?auto_838257 ) ) ( not ( = ?auto_838256 ?auto_838257 ) ) ( ON ?auto_838255 ?auto_838256 ) ( ON ?auto_838254 ?auto_838255 ) ( CLEAR ?auto_838252 ) ( ON ?auto_838253 ?auto_838254 ) ( CLEAR ?auto_838253 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_838246 ?auto_838247 ?auto_838248 ?auto_838249 ?auto_838250 ?auto_838251 ?auto_838252 ?auto_838253 )
      ( MAKE-11PILE ?auto_838246 ?auto_838247 ?auto_838248 ?auto_838249 ?auto_838250 ?auto_838251 ?auto_838252 ?auto_838253 ?auto_838254 ?auto_838255 ?auto_838256 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_838292 - BLOCK
      ?auto_838293 - BLOCK
      ?auto_838294 - BLOCK
      ?auto_838295 - BLOCK
      ?auto_838296 - BLOCK
      ?auto_838297 - BLOCK
      ?auto_838298 - BLOCK
      ?auto_838299 - BLOCK
      ?auto_838300 - BLOCK
      ?auto_838301 - BLOCK
      ?auto_838302 - BLOCK
    )
    :vars
    (
      ?auto_838303 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_838302 ?auto_838303 ) ( ON-TABLE ?auto_838292 ) ( ON ?auto_838293 ?auto_838292 ) ( ON ?auto_838294 ?auto_838293 ) ( ON ?auto_838295 ?auto_838294 ) ( ON ?auto_838296 ?auto_838295 ) ( ON ?auto_838297 ?auto_838296 ) ( not ( = ?auto_838292 ?auto_838293 ) ) ( not ( = ?auto_838292 ?auto_838294 ) ) ( not ( = ?auto_838292 ?auto_838295 ) ) ( not ( = ?auto_838292 ?auto_838296 ) ) ( not ( = ?auto_838292 ?auto_838297 ) ) ( not ( = ?auto_838292 ?auto_838298 ) ) ( not ( = ?auto_838292 ?auto_838299 ) ) ( not ( = ?auto_838292 ?auto_838300 ) ) ( not ( = ?auto_838292 ?auto_838301 ) ) ( not ( = ?auto_838292 ?auto_838302 ) ) ( not ( = ?auto_838292 ?auto_838303 ) ) ( not ( = ?auto_838293 ?auto_838294 ) ) ( not ( = ?auto_838293 ?auto_838295 ) ) ( not ( = ?auto_838293 ?auto_838296 ) ) ( not ( = ?auto_838293 ?auto_838297 ) ) ( not ( = ?auto_838293 ?auto_838298 ) ) ( not ( = ?auto_838293 ?auto_838299 ) ) ( not ( = ?auto_838293 ?auto_838300 ) ) ( not ( = ?auto_838293 ?auto_838301 ) ) ( not ( = ?auto_838293 ?auto_838302 ) ) ( not ( = ?auto_838293 ?auto_838303 ) ) ( not ( = ?auto_838294 ?auto_838295 ) ) ( not ( = ?auto_838294 ?auto_838296 ) ) ( not ( = ?auto_838294 ?auto_838297 ) ) ( not ( = ?auto_838294 ?auto_838298 ) ) ( not ( = ?auto_838294 ?auto_838299 ) ) ( not ( = ?auto_838294 ?auto_838300 ) ) ( not ( = ?auto_838294 ?auto_838301 ) ) ( not ( = ?auto_838294 ?auto_838302 ) ) ( not ( = ?auto_838294 ?auto_838303 ) ) ( not ( = ?auto_838295 ?auto_838296 ) ) ( not ( = ?auto_838295 ?auto_838297 ) ) ( not ( = ?auto_838295 ?auto_838298 ) ) ( not ( = ?auto_838295 ?auto_838299 ) ) ( not ( = ?auto_838295 ?auto_838300 ) ) ( not ( = ?auto_838295 ?auto_838301 ) ) ( not ( = ?auto_838295 ?auto_838302 ) ) ( not ( = ?auto_838295 ?auto_838303 ) ) ( not ( = ?auto_838296 ?auto_838297 ) ) ( not ( = ?auto_838296 ?auto_838298 ) ) ( not ( = ?auto_838296 ?auto_838299 ) ) ( not ( = ?auto_838296 ?auto_838300 ) ) ( not ( = ?auto_838296 ?auto_838301 ) ) ( not ( = ?auto_838296 ?auto_838302 ) ) ( not ( = ?auto_838296 ?auto_838303 ) ) ( not ( = ?auto_838297 ?auto_838298 ) ) ( not ( = ?auto_838297 ?auto_838299 ) ) ( not ( = ?auto_838297 ?auto_838300 ) ) ( not ( = ?auto_838297 ?auto_838301 ) ) ( not ( = ?auto_838297 ?auto_838302 ) ) ( not ( = ?auto_838297 ?auto_838303 ) ) ( not ( = ?auto_838298 ?auto_838299 ) ) ( not ( = ?auto_838298 ?auto_838300 ) ) ( not ( = ?auto_838298 ?auto_838301 ) ) ( not ( = ?auto_838298 ?auto_838302 ) ) ( not ( = ?auto_838298 ?auto_838303 ) ) ( not ( = ?auto_838299 ?auto_838300 ) ) ( not ( = ?auto_838299 ?auto_838301 ) ) ( not ( = ?auto_838299 ?auto_838302 ) ) ( not ( = ?auto_838299 ?auto_838303 ) ) ( not ( = ?auto_838300 ?auto_838301 ) ) ( not ( = ?auto_838300 ?auto_838302 ) ) ( not ( = ?auto_838300 ?auto_838303 ) ) ( not ( = ?auto_838301 ?auto_838302 ) ) ( not ( = ?auto_838301 ?auto_838303 ) ) ( not ( = ?auto_838302 ?auto_838303 ) ) ( ON ?auto_838301 ?auto_838302 ) ( ON ?auto_838300 ?auto_838301 ) ( ON ?auto_838299 ?auto_838300 ) ( CLEAR ?auto_838297 ) ( ON ?auto_838298 ?auto_838299 ) ( CLEAR ?auto_838298 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_838292 ?auto_838293 ?auto_838294 ?auto_838295 ?auto_838296 ?auto_838297 ?auto_838298 )
      ( MAKE-11PILE ?auto_838292 ?auto_838293 ?auto_838294 ?auto_838295 ?auto_838296 ?auto_838297 ?auto_838298 ?auto_838299 ?auto_838300 ?auto_838301 ?auto_838302 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_838338 - BLOCK
      ?auto_838339 - BLOCK
      ?auto_838340 - BLOCK
      ?auto_838341 - BLOCK
      ?auto_838342 - BLOCK
      ?auto_838343 - BLOCK
      ?auto_838344 - BLOCK
      ?auto_838345 - BLOCK
      ?auto_838346 - BLOCK
      ?auto_838347 - BLOCK
      ?auto_838348 - BLOCK
    )
    :vars
    (
      ?auto_838349 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_838348 ?auto_838349 ) ( ON-TABLE ?auto_838338 ) ( ON ?auto_838339 ?auto_838338 ) ( ON ?auto_838340 ?auto_838339 ) ( ON ?auto_838341 ?auto_838340 ) ( ON ?auto_838342 ?auto_838341 ) ( not ( = ?auto_838338 ?auto_838339 ) ) ( not ( = ?auto_838338 ?auto_838340 ) ) ( not ( = ?auto_838338 ?auto_838341 ) ) ( not ( = ?auto_838338 ?auto_838342 ) ) ( not ( = ?auto_838338 ?auto_838343 ) ) ( not ( = ?auto_838338 ?auto_838344 ) ) ( not ( = ?auto_838338 ?auto_838345 ) ) ( not ( = ?auto_838338 ?auto_838346 ) ) ( not ( = ?auto_838338 ?auto_838347 ) ) ( not ( = ?auto_838338 ?auto_838348 ) ) ( not ( = ?auto_838338 ?auto_838349 ) ) ( not ( = ?auto_838339 ?auto_838340 ) ) ( not ( = ?auto_838339 ?auto_838341 ) ) ( not ( = ?auto_838339 ?auto_838342 ) ) ( not ( = ?auto_838339 ?auto_838343 ) ) ( not ( = ?auto_838339 ?auto_838344 ) ) ( not ( = ?auto_838339 ?auto_838345 ) ) ( not ( = ?auto_838339 ?auto_838346 ) ) ( not ( = ?auto_838339 ?auto_838347 ) ) ( not ( = ?auto_838339 ?auto_838348 ) ) ( not ( = ?auto_838339 ?auto_838349 ) ) ( not ( = ?auto_838340 ?auto_838341 ) ) ( not ( = ?auto_838340 ?auto_838342 ) ) ( not ( = ?auto_838340 ?auto_838343 ) ) ( not ( = ?auto_838340 ?auto_838344 ) ) ( not ( = ?auto_838340 ?auto_838345 ) ) ( not ( = ?auto_838340 ?auto_838346 ) ) ( not ( = ?auto_838340 ?auto_838347 ) ) ( not ( = ?auto_838340 ?auto_838348 ) ) ( not ( = ?auto_838340 ?auto_838349 ) ) ( not ( = ?auto_838341 ?auto_838342 ) ) ( not ( = ?auto_838341 ?auto_838343 ) ) ( not ( = ?auto_838341 ?auto_838344 ) ) ( not ( = ?auto_838341 ?auto_838345 ) ) ( not ( = ?auto_838341 ?auto_838346 ) ) ( not ( = ?auto_838341 ?auto_838347 ) ) ( not ( = ?auto_838341 ?auto_838348 ) ) ( not ( = ?auto_838341 ?auto_838349 ) ) ( not ( = ?auto_838342 ?auto_838343 ) ) ( not ( = ?auto_838342 ?auto_838344 ) ) ( not ( = ?auto_838342 ?auto_838345 ) ) ( not ( = ?auto_838342 ?auto_838346 ) ) ( not ( = ?auto_838342 ?auto_838347 ) ) ( not ( = ?auto_838342 ?auto_838348 ) ) ( not ( = ?auto_838342 ?auto_838349 ) ) ( not ( = ?auto_838343 ?auto_838344 ) ) ( not ( = ?auto_838343 ?auto_838345 ) ) ( not ( = ?auto_838343 ?auto_838346 ) ) ( not ( = ?auto_838343 ?auto_838347 ) ) ( not ( = ?auto_838343 ?auto_838348 ) ) ( not ( = ?auto_838343 ?auto_838349 ) ) ( not ( = ?auto_838344 ?auto_838345 ) ) ( not ( = ?auto_838344 ?auto_838346 ) ) ( not ( = ?auto_838344 ?auto_838347 ) ) ( not ( = ?auto_838344 ?auto_838348 ) ) ( not ( = ?auto_838344 ?auto_838349 ) ) ( not ( = ?auto_838345 ?auto_838346 ) ) ( not ( = ?auto_838345 ?auto_838347 ) ) ( not ( = ?auto_838345 ?auto_838348 ) ) ( not ( = ?auto_838345 ?auto_838349 ) ) ( not ( = ?auto_838346 ?auto_838347 ) ) ( not ( = ?auto_838346 ?auto_838348 ) ) ( not ( = ?auto_838346 ?auto_838349 ) ) ( not ( = ?auto_838347 ?auto_838348 ) ) ( not ( = ?auto_838347 ?auto_838349 ) ) ( not ( = ?auto_838348 ?auto_838349 ) ) ( ON ?auto_838347 ?auto_838348 ) ( ON ?auto_838346 ?auto_838347 ) ( ON ?auto_838345 ?auto_838346 ) ( ON ?auto_838344 ?auto_838345 ) ( CLEAR ?auto_838342 ) ( ON ?auto_838343 ?auto_838344 ) ( CLEAR ?auto_838343 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_838338 ?auto_838339 ?auto_838340 ?auto_838341 ?auto_838342 ?auto_838343 )
      ( MAKE-11PILE ?auto_838338 ?auto_838339 ?auto_838340 ?auto_838341 ?auto_838342 ?auto_838343 ?auto_838344 ?auto_838345 ?auto_838346 ?auto_838347 ?auto_838348 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_838384 - BLOCK
      ?auto_838385 - BLOCK
      ?auto_838386 - BLOCK
      ?auto_838387 - BLOCK
      ?auto_838388 - BLOCK
      ?auto_838389 - BLOCK
      ?auto_838390 - BLOCK
      ?auto_838391 - BLOCK
      ?auto_838392 - BLOCK
      ?auto_838393 - BLOCK
      ?auto_838394 - BLOCK
    )
    :vars
    (
      ?auto_838395 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_838394 ?auto_838395 ) ( ON-TABLE ?auto_838384 ) ( ON ?auto_838385 ?auto_838384 ) ( ON ?auto_838386 ?auto_838385 ) ( ON ?auto_838387 ?auto_838386 ) ( not ( = ?auto_838384 ?auto_838385 ) ) ( not ( = ?auto_838384 ?auto_838386 ) ) ( not ( = ?auto_838384 ?auto_838387 ) ) ( not ( = ?auto_838384 ?auto_838388 ) ) ( not ( = ?auto_838384 ?auto_838389 ) ) ( not ( = ?auto_838384 ?auto_838390 ) ) ( not ( = ?auto_838384 ?auto_838391 ) ) ( not ( = ?auto_838384 ?auto_838392 ) ) ( not ( = ?auto_838384 ?auto_838393 ) ) ( not ( = ?auto_838384 ?auto_838394 ) ) ( not ( = ?auto_838384 ?auto_838395 ) ) ( not ( = ?auto_838385 ?auto_838386 ) ) ( not ( = ?auto_838385 ?auto_838387 ) ) ( not ( = ?auto_838385 ?auto_838388 ) ) ( not ( = ?auto_838385 ?auto_838389 ) ) ( not ( = ?auto_838385 ?auto_838390 ) ) ( not ( = ?auto_838385 ?auto_838391 ) ) ( not ( = ?auto_838385 ?auto_838392 ) ) ( not ( = ?auto_838385 ?auto_838393 ) ) ( not ( = ?auto_838385 ?auto_838394 ) ) ( not ( = ?auto_838385 ?auto_838395 ) ) ( not ( = ?auto_838386 ?auto_838387 ) ) ( not ( = ?auto_838386 ?auto_838388 ) ) ( not ( = ?auto_838386 ?auto_838389 ) ) ( not ( = ?auto_838386 ?auto_838390 ) ) ( not ( = ?auto_838386 ?auto_838391 ) ) ( not ( = ?auto_838386 ?auto_838392 ) ) ( not ( = ?auto_838386 ?auto_838393 ) ) ( not ( = ?auto_838386 ?auto_838394 ) ) ( not ( = ?auto_838386 ?auto_838395 ) ) ( not ( = ?auto_838387 ?auto_838388 ) ) ( not ( = ?auto_838387 ?auto_838389 ) ) ( not ( = ?auto_838387 ?auto_838390 ) ) ( not ( = ?auto_838387 ?auto_838391 ) ) ( not ( = ?auto_838387 ?auto_838392 ) ) ( not ( = ?auto_838387 ?auto_838393 ) ) ( not ( = ?auto_838387 ?auto_838394 ) ) ( not ( = ?auto_838387 ?auto_838395 ) ) ( not ( = ?auto_838388 ?auto_838389 ) ) ( not ( = ?auto_838388 ?auto_838390 ) ) ( not ( = ?auto_838388 ?auto_838391 ) ) ( not ( = ?auto_838388 ?auto_838392 ) ) ( not ( = ?auto_838388 ?auto_838393 ) ) ( not ( = ?auto_838388 ?auto_838394 ) ) ( not ( = ?auto_838388 ?auto_838395 ) ) ( not ( = ?auto_838389 ?auto_838390 ) ) ( not ( = ?auto_838389 ?auto_838391 ) ) ( not ( = ?auto_838389 ?auto_838392 ) ) ( not ( = ?auto_838389 ?auto_838393 ) ) ( not ( = ?auto_838389 ?auto_838394 ) ) ( not ( = ?auto_838389 ?auto_838395 ) ) ( not ( = ?auto_838390 ?auto_838391 ) ) ( not ( = ?auto_838390 ?auto_838392 ) ) ( not ( = ?auto_838390 ?auto_838393 ) ) ( not ( = ?auto_838390 ?auto_838394 ) ) ( not ( = ?auto_838390 ?auto_838395 ) ) ( not ( = ?auto_838391 ?auto_838392 ) ) ( not ( = ?auto_838391 ?auto_838393 ) ) ( not ( = ?auto_838391 ?auto_838394 ) ) ( not ( = ?auto_838391 ?auto_838395 ) ) ( not ( = ?auto_838392 ?auto_838393 ) ) ( not ( = ?auto_838392 ?auto_838394 ) ) ( not ( = ?auto_838392 ?auto_838395 ) ) ( not ( = ?auto_838393 ?auto_838394 ) ) ( not ( = ?auto_838393 ?auto_838395 ) ) ( not ( = ?auto_838394 ?auto_838395 ) ) ( ON ?auto_838393 ?auto_838394 ) ( ON ?auto_838392 ?auto_838393 ) ( ON ?auto_838391 ?auto_838392 ) ( ON ?auto_838390 ?auto_838391 ) ( ON ?auto_838389 ?auto_838390 ) ( CLEAR ?auto_838387 ) ( ON ?auto_838388 ?auto_838389 ) ( CLEAR ?auto_838388 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_838384 ?auto_838385 ?auto_838386 ?auto_838387 ?auto_838388 )
      ( MAKE-11PILE ?auto_838384 ?auto_838385 ?auto_838386 ?auto_838387 ?auto_838388 ?auto_838389 ?auto_838390 ?auto_838391 ?auto_838392 ?auto_838393 ?auto_838394 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_838430 - BLOCK
      ?auto_838431 - BLOCK
      ?auto_838432 - BLOCK
      ?auto_838433 - BLOCK
      ?auto_838434 - BLOCK
      ?auto_838435 - BLOCK
      ?auto_838436 - BLOCK
      ?auto_838437 - BLOCK
      ?auto_838438 - BLOCK
      ?auto_838439 - BLOCK
      ?auto_838440 - BLOCK
    )
    :vars
    (
      ?auto_838441 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_838440 ?auto_838441 ) ( ON-TABLE ?auto_838430 ) ( ON ?auto_838431 ?auto_838430 ) ( ON ?auto_838432 ?auto_838431 ) ( not ( = ?auto_838430 ?auto_838431 ) ) ( not ( = ?auto_838430 ?auto_838432 ) ) ( not ( = ?auto_838430 ?auto_838433 ) ) ( not ( = ?auto_838430 ?auto_838434 ) ) ( not ( = ?auto_838430 ?auto_838435 ) ) ( not ( = ?auto_838430 ?auto_838436 ) ) ( not ( = ?auto_838430 ?auto_838437 ) ) ( not ( = ?auto_838430 ?auto_838438 ) ) ( not ( = ?auto_838430 ?auto_838439 ) ) ( not ( = ?auto_838430 ?auto_838440 ) ) ( not ( = ?auto_838430 ?auto_838441 ) ) ( not ( = ?auto_838431 ?auto_838432 ) ) ( not ( = ?auto_838431 ?auto_838433 ) ) ( not ( = ?auto_838431 ?auto_838434 ) ) ( not ( = ?auto_838431 ?auto_838435 ) ) ( not ( = ?auto_838431 ?auto_838436 ) ) ( not ( = ?auto_838431 ?auto_838437 ) ) ( not ( = ?auto_838431 ?auto_838438 ) ) ( not ( = ?auto_838431 ?auto_838439 ) ) ( not ( = ?auto_838431 ?auto_838440 ) ) ( not ( = ?auto_838431 ?auto_838441 ) ) ( not ( = ?auto_838432 ?auto_838433 ) ) ( not ( = ?auto_838432 ?auto_838434 ) ) ( not ( = ?auto_838432 ?auto_838435 ) ) ( not ( = ?auto_838432 ?auto_838436 ) ) ( not ( = ?auto_838432 ?auto_838437 ) ) ( not ( = ?auto_838432 ?auto_838438 ) ) ( not ( = ?auto_838432 ?auto_838439 ) ) ( not ( = ?auto_838432 ?auto_838440 ) ) ( not ( = ?auto_838432 ?auto_838441 ) ) ( not ( = ?auto_838433 ?auto_838434 ) ) ( not ( = ?auto_838433 ?auto_838435 ) ) ( not ( = ?auto_838433 ?auto_838436 ) ) ( not ( = ?auto_838433 ?auto_838437 ) ) ( not ( = ?auto_838433 ?auto_838438 ) ) ( not ( = ?auto_838433 ?auto_838439 ) ) ( not ( = ?auto_838433 ?auto_838440 ) ) ( not ( = ?auto_838433 ?auto_838441 ) ) ( not ( = ?auto_838434 ?auto_838435 ) ) ( not ( = ?auto_838434 ?auto_838436 ) ) ( not ( = ?auto_838434 ?auto_838437 ) ) ( not ( = ?auto_838434 ?auto_838438 ) ) ( not ( = ?auto_838434 ?auto_838439 ) ) ( not ( = ?auto_838434 ?auto_838440 ) ) ( not ( = ?auto_838434 ?auto_838441 ) ) ( not ( = ?auto_838435 ?auto_838436 ) ) ( not ( = ?auto_838435 ?auto_838437 ) ) ( not ( = ?auto_838435 ?auto_838438 ) ) ( not ( = ?auto_838435 ?auto_838439 ) ) ( not ( = ?auto_838435 ?auto_838440 ) ) ( not ( = ?auto_838435 ?auto_838441 ) ) ( not ( = ?auto_838436 ?auto_838437 ) ) ( not ( = ?auto_838436 ?auto_838438 ) ) ( not ( = ?auto_838436 ?auto_838439 ) ) ( not ( = ?auto_838436 ?auto_838440 ) ) ( not ( = ?auto_838436 ?auto_838441 ) ) ( not ( = ?auto_838437 ?auto_838438 ) ) ( not ( = ?auto_838437 ?auto_838439 ) ) ( not ( = ?auto_838437 ?auto_838440 ) ) ( not ( = ?auto_838437 ?auto_838441 ) ) ( not ( = ?auto_838438 ?auto_838439 ) ) ( not ( = ?auto_838438 ?auto_838440 ) ) ( not ( = ?auto_838438 ?auto_838441 ) ) ( not ( = ?auto_838439 ?auto_838440 ) ) ( not ( = ?auto_838439 ?auto_838441 ) ) ( not ( = ?auto_838440 ?auto_838441 ) ) ( ON ?auto_838439 ?auto_838440 ) ( ON ?auto_838438 ?auto_838439 ) ( ON ?auto_838437 ?auto_838438 ) ( ON ?auto_838436 ?auto_838437 ) ( ON ?auto_838435 ?auto_838436 ) ( ON ?auto_838434 ?auto_838435 ) ( CLEAR ?auto_838432 ) ( ON ?auto_838433 ?auto_838434 ) ( CLEAR ?auto_838433 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_838430 ?auto_838431 ?auto_838432 ?auto_838433 )
      ( MAKE-11PILE ?auto_838430 ?auto_838431 ?auto_838432 ?auto_838433 ?auto_838434 ?auto_838435 ?auto_838436 ?auto_838437 ?auto_838438 ?auto_838439 ?auto_838440 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_838476 - BLOCK
      ?auto_838477 - BLOCK
      ?auto_838478 - BLOCK
      ?auto_838479 - BLOCK
      ?auto_838480 - BLOCK
      ?auto_838481 - BLOCK
      ?auto_838482 - BLOCK
      ?auto_838483 - BLOCK
      ?auto_838484 - BLOCK
      ?auto_838485 - BLOCK
      ?auto_838486 - BLOCK
    )
    :vars
    (
      ?auto_838487 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_838486 ?auto_838487 ) ( ON-TABLE ?auto_838476 ) ( ON ?auto_838477 ?auto_838476 ) ( not ( = ?auto_838476 ?auto_838477 ) ) ( not ( = ?auto_838476 ?auto_838478 ) ) ( not ( = ?auto_838476 ?auto_838479 ) ) ( not ( = ?auto_838476 ?auto_838480 ) ) ( not ( = ?auto_838476 ?auto_838481 ) ) ( not ( = ?auto_838476 ?auto_838482 ) ) ( not ( = ?auto_838476 ?auto_838483 ) ) ( not ( = ?auto_838476 ?auto_838484 ) ) ( not ( = ?auto_838476 ?auto_838485 ) ) ( not ( = ?auto_838476 ?auto_838486 ) ) ( not ( = ?auto_838476 ?auto_838487 ) ) ( not ( = ?auto_838477 ?auto_838478 ) ) ( not ( = ?auto_838477 ?auto_838479 ) ) ( not ( = ?auto_838477 ?auto_838480 ) ) ( not ( = ?auto_838477 ?auto_838481 ) ) ( not ( = ?auto_838477 ?auto_838482 ) ) ( not ( = ?auto_838477 ?auto_838483 ) ) ( not ( = ?auto_838477 ?auto_838484 ) ) ( not ( = ?auto_838477 ?auto_838485 ) ) ( not ( = ?auto_838477 ?auto_838486 ) ) ( not ( = ?auto_838477 ?auto_838487 ) ) ( not ( = ?auto_838478 ?auto_838479 ) ) ( not ( = ?auto_838478 ?auto_838480 ) ) ( not ( = ?auto_838478 ?auto_838481 ) ) ( not ( = ?auto_838478 ?auto_838482 ) ) ( not ( = ?auto_838478 ?auto_838483 ) ) ( not ( = ?auto_838478 ?auto_838484 ) ) ( not ( = ?auto_838478 ?auto_838485 ) ) ( not ( = ?auto_838478 ?auto_838486 ) ) ( not ( = ?auto_838478 ?auto_838487 ) ) ( not ( = ?auto_838479 ?auto_838480 ) ) ( not ( = ?auto_838479 ?auto_838481 ) ) ( not ( = ?auto_838479 ?auto_838482 ) ) ( not ( = ?auto_838479 ?auto_838483 ) ) ( not ( = ?auto_838479 ?auto_838484 ) ) ( not ( = ?auto_838479 ?auto_838485 ) ) ( not ( = ?auto_838479 ?auto_838486 ) ) ( not ( = ?auto_838479 ?auto_838487 ) ) ( not ( = ?auto_838480 ?auto_838481 ) ) ( not ( = ?auto_838480 ?auto_838482 ) ) ( not ( = ?auto_838480 ?auto_838483 ) ) ( not ( = ?auto_838480 ?auto_838484 ) ) ( not ( = ?auto_838480 ?auto_838485 ) ) ( not ( = ?auto_838480 ?auto_838486 ) ) ( not ( = ?auto_838480 ?auto_838487 ) ) ( not ( = ?auto_838481 ?auto_838482 ) ) ( not ( = ?auto_838481 ?auto_838483 ) ) ( not ( = ?auto_838481 ?auto_838484 ) ) ( not ( = ?auto_838481 ?auto_838485 ) ) ( not ( = ?auto_838481 ?auto_838486 ) ) ( not ( = ?auto_838481 ?auto_838487 ) ) ( not ( = ?auto_838482 ?auto_838483 ) ) ( not ( = ?auto_838482 ?auto_838484 ) ) ( not ( = ?auto_838482 ?auto_838485 ) ) ( not ( = ?auto_838482 ?auto_838486 ) ) ( not ( = ?auto_838482 ?auto_838487 ) ) ( not ( = ?auto_838483 ?auto_838484 ) ) ( not ( = ?auto_838483 ?auto_838485 ) ) ( not ( = ?auto_838483 ?auto_838486 ) ) ( not ( = ?auto_838483 ?auto_838487 ) ) ( not ( = ?auto_838484 ?auto_838485 ) ) ( not ( = ?auto_838484 ?auto_838486 ) ) ( not ( = ?auto_838484 ?auto_838487 ) ) ( not ( = ?auto_838485 ?auto_838486 ) ) ( not ( = ?auto_838485 ?auto_838487 ) ) ( not ( = ?auto_838486 ?auto_838487 ) ) ( ON ?auto_838485 ?auto_838486 ) ( ON ?auto_838484 ?auto_838485 ) ( ON ?auto_838483 ?auto_838484 ) ( ON ?auto_838482 ?auto_838483 ) ( ON ?auto_838481 ?auto_838482 ) ( ON ?auto_838480 ?auto_838481 ) ( ON ?auto_838479 ?auto_838480 ) ( CLEAR ?auto_838477 ) ( ON ?auto_838478 ?auto_838479 ) ( CLEAR ?auto_838478 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_838476 ?auto_838477 ?auto_838478 )
      ( MAKE-11PILE ?auto_838476 ?auto_838477 ?auto_838478 ?auto_838479 ?auto_838480 ?auto_838481 ?auto_838482 ?auto_838483 ?auto_838484 ?auto_838485 ?auto_838486 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_838522 - BLOCK
      ?auto_838523 - BLOCK
      ?auto_838524 - BLOCK
      ?auto_838525 - BLOCK
      ?auto_838526 - BLOCK
      ?auto_838527 - BLOCK
      ?auto_838528 - BLOCK
      ?auto_838529 - BLOCK
      ?auto_838530 - BLOCK
      ?auto_838531 - BLOCK
      ?auto_838532 - BLOCK
    )
    :vars
    (
      ?auto_838533 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_838532 ?auto_838533 ) ( ON-TABLE ?auto_838522 ) ( not ( = ?auto_838522 ?auto_838523 ) ) ( not ( = ?auto_838522 ?auto_838524 ) ) ( not ( = ?auto_838522 ?auto_838525 ) ) ( not ( = ?auto_838522 ?auto_838526 ) ) ( not ( = ?auto_838522 ?auto_838527 ) ) ( not ( = ?auto_838522 ?auto_838528 ) ) ( not ( = ?auto_838522 ?auto_838529 ) ) ( not ( = ?auto_838522 ?auto_838530 ) ) ( not ( = ?auto_838522 ?auto_838531 ) ) ( not ( = ?auto_838522 ?auto_838532 ) ) ( not ( = ?auto_838522 ?auto_838533 ) ) ( not ( = ?auto_838523 ?auto_838524 ) ) ( not ( = ?auto_838523 ?auto_838525 ) ) ( not ( = ?auto_838523 ?auto_838526 ) ) ( not ( = ?auto_838523 ?auto_838527 ) ) ( not ( = ?auto_838523 ?auto_838528 ) ) ( not ( = ?auto_838523 ?auto_838529 ) ) ( not ( = ?auto_838523 ?auto_838530 ) ) ( not ( = ?auto_838523 ?auto_838531 ) ) ( not ( = ?auto_838523 ?auto_838532 ) ) ( not ( = ?auto_838523 ?auto_838533 ) ) ( not ( = ?auto_838524 ?auto_838525 ) ) ( not ( = ?auto_838524 ?auto_838526 ) ) ( not ( = ?auto_838524 ?auto_838527 ) ) ( not ( = ?auto_838524 ?auto_838528 ) ) ( not ( = ?auto_838524 ?auto_838529 ) ) ( not ( = ?auto_838524 ?auto_838530 ) ) ( not ( = ?auto_838524 ?auto_838531 ) ) ( not ( = ?auto_838524 ?auto_838532 ) ) ( not ( = ?auto_838524 ?auto_838533 ) ) ( not ( = ?auto_838525 ?auto_838526 ) ) ( not ( = ?auto_838525 ?auto_838527 ) ) ( not ( = ?auto_838525 ?auto_838528 ) ) ( not ( = ?auto_838525 ?auto_838529 ) ) ( not ( = ?auto_838525 ?auto_838530 ) ) ( not ( = ?auto_838525 ?auto_838531 ) ) ( not ( = ?auto_838525 ?auto_838532 ) ) ( not ( = ?auto_838525 ?auto_838533 ) ) ( not ( = ?auto_838526 ?auto_838527 ) ) ( not ( = ?auto_838526 ?auto_838528 ) ) ( not ( = ?auto_838526 ?auto_838529 ) ) ( not ( = ?auto_838526 ?auto_838530 ) ) ( not ( = ?auto_838526 ?auto_838531 ) ) ( not ( = ?auto_838526 ?auto_838532 ) ) ( not ( = ?auto_838526 ?auto_838533 ) ) ( not ( = ?auto_838527 ?auto_838528 ) ) ( not ( = ?auto_838527 ?auto_838529 ) ) ( not ( = ?auto_838527 ?auto_838530 ) ) ( not ( = ?auto_838527 ?auto_838531 ) ) ( not ( = ?auto_838527 ?auto_838532 ) ) ( not ( = ?auto_838527 ?auto_838533 ) ) ( not ( = ?auto_838528 ?auto_838529 ) ) ( not ( = ?auto_838528 ?auto_838530 ) ) ( not ( = ?auto_838528 ?auto_838531 ) ) ( not ( = ?auto_838528 ?auto_838532 ) ) ( not ( = ?auto_838528 ?auto_838533 ) ) ( not ( = ?auto_838529 ?auto_838530 ) ) ( not ( = ?auto_838529 ?auto_838531 ) ) ( not ( = ?auto_838529 ?auto_838532 ) ) ( not ( = ?auto_838529 ?auto_838533 ) ) ( not ( = ?auto_838530 ?auto_838531 ) ) ( not ( = ?auto_838530 ?auto_838532 ) ) ( not ( = ?auto_838530 ?auto_838533 ) ) ( not ( = ?auto_838531 ?auto_838532 ) ) ( not ( = ?auto_838531 ?auto_838533 ) ) ( not ( = ?auto_838532 ?auto_838533 ) ) ( ON ?auto_838531 ?auto_838532 ) ( ON ?auto_838530 ?auto_838531 ) ( ON ?auto_838529 ?auto_838530 ) ( ON ?auto_838528 ?auto_838529 ) ( ON ?auto_838527 ?auto_838528 ) ( ON ?auto_838526 ?auto_838527 ) ( ON ?auto_838525 ?auto_838526 ) ( ON ?auto_838524 ?auto_838525 ) ( CLEAR ?auto_838522 ) ( ON ?auto_838523 ?auto_838524 ) ( CLEAR ?auto_838523 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_838522 ?auto_838523 )
      ( MAKE-11PILE ?auto_838522 ?auto_838523 ?auto_838524 ?auto_838525 ?auto_838526 ?auto_838527 ?auto_838528 ?auto_838529 ?auto_838530 ?auto_838531 ?auto_838532 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_838568 - BLOCK
      ?auto_838569 - BLOCK
      ?auto_838570 - BLOCK
      ?auto_838571 - BLOCK
      ?auto_838572 - BLOCK
      ?auto_838573 - BLOCK
      ?auto_838574 - BLOCK
      ?auto_838575 - BLOCK
      ?auto_838576 - BLOCK
      ?auto_838577 - BLOCK
      ?auto_838578 - BLOCK
    )
    :vars
    (
      ?auto_838579 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_838578 ?auto_838579 ) ( not ( = ?auto_838568 ?auto_838569 ) ) ( not ( = ?auto_838568 ?auto_838570 ) ) ( not ( = ?auto_838568 ?auto_838571 ) ) ( not ( = ?auto_838568 ?auto_838572 ) ) ( not ( = ?auto_838568 ?auto_838573 ) ) ( not ( = ?auto_838568 ?auto_838574 ) ) ( not ( = ?auto_838568 ?auto_838575 ) ) ( not ( = ?auto_838568 ?auto_838576 ) ) ( not ( = ?auto_838568 ?auto_838577 ) ) ( not ( = ?auto_838568 ?auto_838578 ) ) ( not ( = ?auto_838568 ?auto_838579 ) ) ( not ( = ?auto_838569 ?auto_838570 ) ) ( not ( = ?auto_838569 ?auto_838571 ) ) ( not ( = ?auto_838569 ?auto_838572 ) ) ( not ( = ?auto_838569 ?auto_838573 ) ) ( not ( = ?auto_838569 ?auto_838574 ) ) ( not ( = ?auto_838569 ?auto_838575 ) ) ( not ( = ?auto_838569 ?auto_838576 ) ) ( not ( = ?auto_838569 ?auto_838577 ) ) ( not ( = ?auto_838569 ?auto_838578 ) ) ( not ( = ?auto_838569 ?auto_838579 ) ) ( not ( = ?auto_838570 ?auto_838571 ) ) ( not ( = ?auto_838570 ?auto_838572 ) ) ( not ( = ?auto_838570 ?auto_838573 ) ) ( not ( = ?auto_838570 ?auto_838574 ) ) ( not ( = ?auto_838570 ?auto_838575 ) ) ( not ( = ?auto_838570 ?auto_838576 ) ) ( not ( = ?auto_838570 ?auto_838577 ) ) ( not ( = ?auto_838570 ?auto_838578 ) ) ( not ( = ?auto_838570 ?auto_838579 ) ) ( not ( = ?auto_838571 ?auto_838572 ) ) ( not ( = ?auto_838571 ?auto_838573 ) ) ( not ( = ?auto_838571 ?auto_838574 ) ) ( not ( = ?auto_838571 ?auto_838575 ) ) ( not ( = ?auto_838571 ?auto_838576 ) ) ( not ( = ?auto_838571 ?auto_838577 ) ) ( not ( = ?auto_838571 ?auto_838578 ) ) ( not ( = ?auto_838571 ?auto_838579 ) ) ( not ( = ?auto_838572 ?auto_838573 ) ) ( not ( = ?auto_838572 ?auto_838574 ) ) ( not ( = ?auto_838572 ?auto_838575 ) ) ( not ( = ?auto_838572 ?auto_838576 ) ) ( not ( = ?auto_838572 ?auto_838577 ) ) ( not ( = ?auto_838572 ?auto_838578 ) ) ( not ( = ?auto_838572 ?auto_838579 ) ) ( not ( = ?auto_838573 ?auto_838574 ) ) ( not ( = ?auto_838573 ?auto_838575 ) ) ( not ( = ?auto_838573 ?auto_838576 ) ) ( not ( = ?auto_838573 ?auto_838577 ) ) ( not ( = ?auto_838573 ?auto_838578 ) ) ( not ( = ?auto_838573 ?auto_838579 ) ) ( not ( = ?auto_838574 ?auto_838575 ) ) ( not ( = ?auto_838574 ?auto_838576 ) ) ( not ( = ?auto_838574 ?auto_838577 ) ) ( not ( = ?auto_838574 ?auto_838578 ) ) ( not ( = ?auto_838574 ?auto_838579 ) ) ( not ( = ?auto_838575 ?auto_838576 ) ) ( not ( = ?auto_838575 ?auto_838577 ) ) ( not ( = ?auto_838575 ?auto_838578 ) ) ( not ( = ?auto_838575 ?auto_838579 ) ) ( not ( = ?auto_838576 ?auto_838577 ) ) ( not ( = ?auto_838576 ?auto_838578 ) ) ( not ( = ?auto_838576 ?auto_838579 ) ) ( not ( = ?auto_838577 ?auto_838578 ) ) ( not ( = ?auto_838577 ?auto_838579 ) ) ( not ( = ?auto_838578 ?auto_838579 ) ) ( ON ?auto_838577 ?auto_838578 ) ( ON ?auto_838576 ?auto_838577 ) ( ON ?auto_838575 ?auto_838576 ) ( ON ?auto_838574 ?auto_838575 ) ( ON ?auto_838573 ?auto_838574 ) ( ON ?auto_838572 ?auto_838573 ) ( ON ?auto_838571 ?auto_838572 ) ( ON ?auto_838570 ?auto_838571 ) ( ON ?auto_838569 ?auto_838570 ) ( ON ?auto_838568 ?auto_838569 ) ( CLEAR ?auto_838568 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_838568 )
      ( MAKE-11PILE ?auto_838568 ?auto_838569 ?auto_838570 ?auto_838571 ?auto_838572 ?auto_838573 ?auto_838574 ?auto_838575 ?auto_838576 ?auto_838577 ?auto_838578 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_838615 - BLOCK
      ?auto_838616 - BLOCK
      ?auto_838617 - BLOCK
      ?auto_838618 - BLOCK
      ?auto_838619 - BLOCK
      ?auto_838620 - BLOCK
      ?auto_838621 - BLOCK
      ?auto_838622 - BLOCK
      ?auto_838623 - BLOCK
      ?auto_838624 - BLOCK
      ?auto_838625 - BLOCK
      ?auto_838626 - BLOCK
    )
    :vars
    (
      ?auto_838627 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_838625 ) ( ON ?auto_838626 ?auto_838627 ) ( CLEAR ?auto_838626 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_838615 ) ( ON ?auto_838616 ?auto_838615 ) ( ON ?auto_838617 ?auto_838616 ) ( ON ?auto_838618 ?auto_838617 ) ( ON ?auto_838619 ?auto_838618 ) ( ON ?auto_838620 ?auto_838619 ) ( ON ?auto_838621 ?auto_838620 ) ( ON ?auto_838622 ?auto_838621 ) ( ON ?auto_838623 ?auto_838622 ) ( ON ?auto_838624 ?auto_838623 ) ( ON ?auto_838625 ?auto_838624 ) ( not ( = ?auto_838615 ?auto_838616 ) ) ( not ( = ?auto_838615 ?auto_838617 ) ) ( not ( = ?auto_838615 ?auto_838618 ) ) ( not ( = ?auto_838615 ?auto_838619 ) ) ( not ( = ?auto_838615 ?auto_838620 ) ) ( not ( = ?auto_838615 ?auto_838621 ) ) ( not ( = ?auto_838615 ?auto_838622 ) ) ( not ( = ?auto_838615 ?auto_838623 ) ) ( not ( = ?auto_838615 ?auto_838624 ) ) ( not ( = ?auto_838615 ?auto_838625 ) ) ( not ( = ?auto_838615 ?auto_838626 ) ) ( not ( = ?auto_838615 ?auto_838627 ) ) ( not ( = ?auto_838616 ?auto_838617 ) ) ( not ( = ?auto_838616 ?auto_838618 ) ) ( not ( = ?auto_838616 ?auto_838619 ) ) ( not ( = ?auto_838616 ?auto_838620 ) ) ( not ( = ?auto_838616 ?auto_838621 ) ) ( not ( = ?auto_838616 ?auto_838622 ) ) ( not ( = ?auto_838616 ?auto_838623 ) ) ( not ( = ?auto_838616 ?auto_838624 ) ) ( not ( = ?auto_838616 ?auto_838625 ) ) ( not ( = ?auto_838616 ?auto_838626 ) ) ( not ( = ?auto_838616 ?auto_838627 ) ) ( not ( = ?auto_838617 ?auto_838618 ) ) ( not ( = ?auto_838617 ?auto_838619 ) ) ( not ( = ?auto_838617 ?auto_838620 ) ) ( not ( = ?auto_838617 ?auto_838621 ) ) ( not ( = ?auto_838617 ?auto_838622 ) ) ( not ( = ?auto_838617 ?auto_838623 ) ) ( not ( = ?auto_838617 ?auto_838624 ) ) ( not ( = ?auto_838617 ?auto_838625 ) ) ( not ( = ?auto_838617 ?auto_838626 ) ) ( not ( = ?auto_838617 ?auto_838627 ) ) ( not ( = ?auto_838618 ?auto_838619 ) ) ( not ( = ?auto_838618 ?auto_838620 ) ) ( not ( = ?auto_838618 ?auto_838621 ) ) ( not ( = ?auto_838618 ?auto_838622 ) ) ( not ( = ?auto_838618 ?auto_838623 ) ) ( not ( = ?auto_838618 ?auto_838624 ) ) ( not ( = ?auto_838618 ?auto_838625 ) ) ( not ( = ?auto_838618 ?auto_838626 ) ) ( not ( = ?auto_838618 ?auto_838627 ) ) ( not ( = ?auto_838619 ?auto_838620 ) ) ( not ( = ?auto_838619 ?auto_838621 ) ) ( not ( = ?auto_838619 ?auto_838622 ) ) ( not ( = ?auto_838619 ?auto_838623 ) ) ( not ( = ?auto_838619 ?auto_838624 ) ) ( not ( = ?auto_838619 ?auto_838625 ) ) ( not ( = ?auto_838619 ?auto_838626 ) ) ( not ( = ?auto_838619 ?auto_838627 ) ) ( not ( = ?auto_838620 ?auto_838621 ) ) ( not ( = ?auto_838620 ?auto_838622 ) ) ( not ( = ?auto_838620 ?auto_838623 ) ) ( not ( = ?auto_838620 ?auto_838624 ) ) ( not ( = ?auto_838620 ?auto_838625 ) ) ( not ( = ?auto_838620 ?auto_838626 ) ) ( not ( = ?auto_838620 ?auto_838627 ) ) ( not ( = ?auto_838621 ?auto_838622 ) ) ( not ( = ?auto_838621 ?auto_838623 ) ) ( not ( = ?auto_838621 ?auto_838624 ) ) ( not ( = ?auto_838621 ?auto_838625 ) ) ( not ( = ?auto_838621 ?auto_838626 ) ) ( not ( = ?auto_838621 ?auto_838627 ) ) ( not ( = ?auto_838622 ?auto_838623 ) ) ( not ( = ?auto_838622 ?auto_838624 ) ) ( not ( = ?auto_838622 ?auto_838625 ) ) ( not ( = ?auto_838622 ?auto_838626 ) ) ( not ( = ?auto_838622 ?auto_838627 ) ) ( not ( = ?auto_838623 ?auto_838624 ) ) ( not ( = ?auto_838623 ?auto_838625 ) ) ( not ( = ?auto_838623 ?auto_838626 ) ) ( not ( = ?auto_838623 ?auto_838627 ) ) ( not ( = ?auto_838624 ?auto_838625 ) ) ( not ( = ?auto_838624 ?auto_838626 ) ) ( not ( = ?auto_838624 ?auto_838627 ) ) ( not ( = ?auto_838625 ?auto_838626 ) ) ( not ( = ?auto_838625 ?auto_838627 ) ) ( not ( = ?auto_838626 ?auto_838627 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_838626 ?auto_838627 )
      ( !STACK ?auto_838626 ?auto_838625 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_838665 - BLOCK
      ?auto_838666 - BLOCK
      ?auto_838667 - BLOCK
      ?auto_838668 - BLOCK
      ?auto_838669 - BLOCK
      ?auto_838670 - BLOCK
      ?auto_838671 - BLOCK
      ?auto_838672 - BLOCK
      ?auto_838673 - BLOCK
      ?auto_838674 - BLOCK
      ?auto_838675 - BLOCK
      ?auto_838676 - BLOCK
    )
    :vars
    (
      ?auto_838677 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_838676 ?auto_838677 ) ( ON-TABLE ?auto_838665 ) ( ON ?auto_838666 ?auto_838665 ) ( ON ?auto_838667 ?auto_838666 ) ( ON ?auto_838668 ?auto_838667 ) ( ON ?auto_838669 ?auto_838668 ) ( ON ?auto_838670 ?auto_838669 ) ( ON ?auto_838671 ?auto_838670 ) ( ON ?auto_838672 ?auto_838671 ) ( ON ?auto_838673 ?auto_838672 ) ( ON ?auto_838674 ?auto_838673 ) ( not ( = ?auto_838665 ?auto_838666 ) ) ( not ( = ?auto_838665 ?auto_838667 ) ) ( not ( = ?auto_838665 ?auto_838668 ) ) ( not ( = ?auto_838665 ?auto_838669 ) ) ( not ( = ?auto_838665 ?auto_838670 ) ) ( not ( = ?auto_838665 ?auto_838671 ) ) ( not ( = ?auto_838665 ?auto_838672 ) ) ( not ( = ?auto_838665 ?auto_838673 ) ) ( not ( = ?auto_838665 ?auto_838674 ) ) ( not ( = ?auto_838665 ?auto_838675 ) ) ( not ( = ?auto_838665 ?auto_838676 ) ) ( not ( = ?auto_838665 ?auto_838677 ) ) ( not ( = ?auto_838666 ?auto_838667 ) ) ( not ( = ?auto_838666 ?auto_838668 ) ) ( not ( = ?auto_838666 ?auto_838669 ) ) ( not ( = ?auto_838666 ?auto_838670 ) ) ( not ( = ?auto_838666 ?auto_838671 ) ) ( not ( = ?auto_838666 ?auto_838672 ) ) ( not ( = ?auto_838666 ?auto_838673 ) ) ( not ( = ?auto_838666 ?auto_838674 ) ) ( not ( = ?auto_838666 ?auto_838675 ) ) ( not ( = ?auto_838666 ?auto_838676 ) ) ( not ( = ?auto_838666 ?auto_838677 ) ) ( not ( = ?auto_838667 ?auto_838668 ) ) ( not ( = ?auto_838667 ?auto_838669 ) ) ( not ( = ?auto_838667 ?auto_838670 ) ) ( not ( = ?auto_838667 ?auto_838671 ) ) ( not ( = ?auto_838667 ?auto_838672 ) ) ( not ( = ?auto_838667 ?auto_838673 ) ) ( not ( = ?auto_838667 ?auto_838674 ) ) ( not ( = ?auto_838667 ?auto_838675 ) ) ( not ( = ?auto_838667 ?auto_838676 ) ) ( not ( = ?auto_838667 ?auto_838677 ) ) ( not ( = ?auto_838668 ?auto_838669 ) ) ( not ( = ?auto_838668 ?auto_838670 ) ) ( not ( = ?auto_838668 ?auto_838671 ) ) ( not ( = ?auto_838668 ?auto_838672 ) ) ( not ( = ?auto_838668 ?auto_838673 ) ) ( not ( = ?auto_838668 ?auto_838674 ) ) ( not ( = ?auto_838668 ?auto_838675 ) ) ( not ( = ?auto_838668 ?auto_838676 ) ) ( not ( = ?auto_838668 ?auto_838677 ) ) ( not ( = ?auto_838669 ?auto_838670 ) ) ( not ( = ?auto_838669 ?auto_838671 ) ) ( not ( = ?auto_838669 ?auto_838672 ) ) ( not ( = ?auto_838669 ?auto_838673 ) ) ( not ( = ?auto_838669 ?auto_838674 ) ) ( not ( = ?auto_838669 ?auto_838675 ) ) ( not ( = ?auto_838669 ?auto_838676 ) ) ( not ( = ?auto_838669 ?auto_838677 ) ) ( not ( = ?auto_838670 ?auto_838671 ) ) ( not ( = ?auto_838670 ?auto_838672 ) ) ( not ( = ?auto_838670 ?auto_838673 ) ) ( not ( = ?auto_838670 ?auto_838674 ) ) ( not ( = ?auto_838670 ?auto_838675 ) ) ( not ( = ?auto_838670 ?auto_838676 ) ) ( not ( = ?auto_838670 ?auto_838677 ) ) ( not ( = ?auto_838671 ?auto_838672 ) ) ( not ( = ?auto_838671 ?auto_838673 ) ) ( not ( = ?auto_838671 ?auto_838674 ) ) ( not ( = ?auto_838671 ?auto_838675 ) ) ( not ( = ?auto_838671 ?auto_838676 ) ) ( not ( = ?auto_838671 ?auto_838677 ) ) ( not ( = ?auto_838672 ?auto_838673 ) ) ( not ( = ?auto_838672 ?auto_838674 ) ) ( not ( = ?auto_838672 ?auto_838675 ) ) ( not ( = ?auto_838672 ?auto_838676 ) ) ( not ( = ?auto_838672 ?auto_838677 ) ) ( not ( = ?auto_838673 ?auto_838674 ) ) ( not ( = ?auto_838673 ?auto_838675 ) ) ( not ( = ?auto_838673 ?auto_838676 ) ) ( not ( = ?auto_838673 ?auto_838677 ) ) ( not ( = ?auto_838674 ?auto_838675 ) ) ( not ( = ?auto_838674 ?auto_838676 ) ) ( not ( = ?auto_838674 ?auto_838677 ) ) ( not ( = ?auto_838675 ?auto_838676 ) ) ( not ( = ?auto_838675 ?auto_838677 ) ) ( not ( = ?auto_838676 ?auto_838677 ) ) ( CLEAR ?auto_838674 ) ( ON ?auto_838675 ?auto_838676 ) ( CLEAR ?auto_838675 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_838665 ?auto_838666 ?auto_838667 ?auto_838668 ?auto_838669 ?auto_838670 ?auto_838671 ?auto_838672 ?auto_838673 ?auto_838674 ?auto_838675 )
      ( MAKE-12PILE ?auto_838665 ?auto_838666 ?auto_838667 ?auto_838668 ?auto_838669 ?auto_838670 ?auto_838671 ?auto_838672 ?auto_838673 ?auto_838674 ?auto_838675 ?auto_838676 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_838715 - BLOCK
      ?auto_838716 - BLOCK
      ?auto_838717 - BLOCK
      ?auto_838718 - BLOCK
      ?auto_838719 - BLOCK
      ?auto_838720 - BLOCK
      ?auto_838721 - BLOCK
      ?auto_838722 - BLOCK
      ?auto_838723 - BLOCK
      ?auto_838724 - BLOCK
      ?auto_838725 - BLOCK
      ?auto_838726 - BLOCK
    )
    :vars
    (
      ?auto_838727 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_838726 ?auto_838727 ) ( ON-TABLE ?auto_838715 ) ( ON ?auto_838716 ?auto_838715 ) ( ON ?auto_838717 ?auto_838716 ) ( ON ?auto_838718 ?auto_838717 ) ( ON ?auto_838719 ?auto_838718 ) ( ON ?auto_838720 ?auto_838719 ) ( ON ?auto_838721 ?auto_838720 ) ( ON ?auto_838722 ?auto_838721 ) ( ON ?auto_838723 ?auto_838722 ) ( not ( = ?auto_838715 ?auto_838716 ) ) ( not ( = ?auto_838715 ?auto_838717 ) ) ( not ( = ?auto_838715 ?auto_838718 ) ) ( not ( = ?auto_838715 ?auto_838719 ) ) ( not ( = ?auto_838715 ?auto_838720 ) ) ( not ( = ?auto_838715 ?auto_838721 ) ) ( not ( = ?auto_838715 ?auto_838722 ) ) ( not ( = ?auto_838715 ?auto_838723 ) ) ( not ( = ?auto_838715 ?auto_838724 ) ) ( not ( = ?auto_838715 ?auto_838725 ) ) ( not ( = ?auto_838715 ?auto_838726 ) ) ( not ( = ?auto_838715 ?auto_838727 ) ) ( not ( = ?auto_838716 ?auto_838717 ) ) ( not ( = ?auto_838716 ?auto_838718 ) ) ( not ( = ?auto_838716 ?auto_838719 ) ) ( not ( = ?auto_838716 ?auto_838720 ) ) ( not ( = ?auto_838716 ?auto_838721 ) ) ( not ( = ?auto_838716 ?auto_838722 ) ) ( not ( = ?auto_838716 ?auto_838723 ) ) ( not ( = ?auto_838716 ?auto_838724 ) ) ( not ( = ?auto_838716 ?auto_838725 ) ) ( not ( = ?auto_838716 ?auto_838726 ) ) ( not ( = ?auto_838716 ?auto_838727 ) ) ( not ( = ?auto_838717 ?auto_838718 ) ) ( not ( = ?auto_838717 ?auto_838719 ) ) ( not ( = ?auto_838717 ?auto_838720 ) ) ( not ( = ?auto_838717 ?auto_838721 ) ) ( not ( = ?auto_838717 ?auto_838722 ) ) ( not ( = ?auto_838717 ?auto_838723 ) ) ( not ( = ?auto_838717 ?auto_838724 ) ) ( not ( = ?auto_838717 ?auto_838725 ) ) ( not ( = ?auto_838717 ?auto_838726 ) ) ( not ( = ?auto_838717 ?auto_838727 ) ) ( not ( = ?auto_838718 ?auto_838719 ) ) ( not ( = ?auto_838718 ?auto_838720 ) ) ( not ( = ?auto_838718 ?auto_838721 ) ) ( not ( = ?auto_838718 ?auto_838722 ) ) ( not ( = ?auto_838718 ?auto_838723 ) ) ( not ( = ?auto_838718 ?auto_838724 ) ) ( not ( = ?auto_838718 ?auto_838725 ) ) ( not ( = ?auto_838718 ?auto_838726 ) ) ( not ( = ?auto_838718 ?auto_838727 ) ) ( not ( = ?auto_838719 ?auto_838720 ) ) ( not ( = ?auto_838719 ?auto_838721 ) ) ( not ( = ?auto_838719 ?auto_838722 ) ) ( not ( = ?auto_838719 ?auto_838723 ) ) ( not ( = ?auto_838719 ?auto_838724 ) ) ( not ( = ?auto_838719 ?auto_838725 ) ) ( not ( = ?auto_838719 ?auto_838726 ) ) ( not ( = ?auto_838719 ?auto_838727 ) ) ( not ( = ?auto_838720 ?auto_838721 ) ) ( not ( = ?auto_838720 ?auto_838722 ) ) ( not ( = ?auto_838720 ?auto_838723 ) ) ( not ( = ?auto_838720 ?auto_838724 ) ) ( not ( = ?auto_838720 ?auto_838725 ) ) ( not ( = ?auto_838720 ?auto_838726 ) ) ( not ( = ?auto_838720 ?auto_838727 ) ) ( not ( = ?auto_838721 ?auto_838722 ) ) ( not ( = ?auto_838721 ?auto_838723 ) ) ( not ( = ?auto_838721 ?auto_838724 ) ) ( not ( = ?auto_838721 ?auto_838725 ) ) ( not ( = ?auto_838721 ?auto_838726 ) ) ( not ( = ?auto_838721 ?auto_838727 ) ) ( not ( = ?auto_838722 ?auto_838723 ) ) ( not ( = ?auto_838722 ?auto_838724 ) ) ( not ( = ?auto_838722 ?auto_838725 ) ) ( not ( = ?auto_838722 ?auto_838726 ) ) ( not ( = ?auto_838722 ?auto_838727 ) ) ( not ( = ?auto_838723 ?auto_838724 ) ) ( not ( = ?auto_838723 ?auto_838725 ) ) ( not ( = ?auto_838723 ?auto_838726 ) ) ( not ( = ?auto_838723 ?auto_838727 ) ) ( not ( = ?auto_838724 ?auto_838725 ) ) ( not ( = ?auto_838724 ?auto_838726 ) ) ( not ( = ?auto_838724 ?auto_838727 ) ) ( not ( = ?auto_838725 ?auto_838726 ) ) ( not ( = ?auto_838725 ?auto_838727 ) ) ( not ( = ?auto_838726 ?auto_838727 ) ) ( ON ?auto_838725 ?auto_838726 ) ( CLEAR ?auto_838723 ) ( ON ?auto_838724 ?auto_838725 ) ( CLEAR ?auto_838724 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_838715 ?auto_838716 ?auto_838717 ?auto_838718 ?auto_838719 ?auto_838720 ?auto_838721 ?auto_838722 ?auto_838723 ?auto_838724 )
      ( MAKE-12PILE ?auto_838715 ?auto_838716 ?auto_838717 ?auto_838718 ?auto_838719 ?auto_838720 ?auto_838721 ?auto_838722 ?auto_838723 ?auto_838724 ?auto_838725 ?auto_838726 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_838765 - BLOCK
      ?auto_838766 - BLOCK
      ?auto_838767 - BLOCK
      ?auto_838768 - BLOCK
      ?auto_838769 - BLOCK
      ?auto_838770 - BLOCK
      ?auto_838771 - BLOCK
      ?auto_838772 - BLOCK
      ?auto_838773 - BLOCK
      ?auto_838774 - BLOCK
      ?auto_838775 - BLOCK
      ?auto_838776 - BLOCK
    )
    :vars
    (
      ?auto_838777 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_838776 ?auto_838777 ) ( ON-TABLE ?auto_838765 ) ( ON ?auto_838766 ?auto_838765 ) ( ON ?auto_838767 ?auto_838766 ) ( ON ?auto_838768 ?auto_838767 ) ( ON ?auto_838769 ?auto_838768 ) ( ON ?auto_838770 ?auto_838769 ) ( ON ?auto_838771 ?auto_838770 ) ( ON ?auto_838772 ?auto_838771 ) ( not ( = ?auto_838765 ?auto_838766 ) ) ( not ( = ?auto_838765 ?auto_838767 ) ) ( not ( = ?auto_838765 ?auto_838768 ) ) ( not ( = ?auto_838765 ?auto_838769 ) ) ( not ( = ?auto_838765 ?auto_838770 ) ) ( not ( = ?auto_838765 ?auto_838771 ) ) ( not ( = ?auto_838765 ?auto_838772 ) ) ( not ( = ?auto_838765 ?auto_838773 ) ) ( not ( = ?auto_838765 ?auto_838774 ) ) ( not ( = ?auto_838765 ?auto_838775 ) ) ( not ( = ?auto_838765 ?auto_838776 ) ) ( not ( = ?auto_838765 ?auto_838777 ) ) ( not ( = ?auto_838766 ?auto_838767 ) ) ( not ( = ?auto_838766 ?auto_838768 ) ) ( not ( = ?auto_838766 ?auto_838769 ) ) ( not ( = ?auto_838766 ?auto_838770 ) ) ( not ( = ?auto_838766 ?auto_838771 ) ) ( not ( = ?auto_838766 ?auto_838772 ) ) ( not ( = ?auto_838766 ?auto_838773 ) ) ( not ( = ?auto_838766 ?auto_838774 ) ) ( not ( = ?auto_838766 ?auto_838775 ) ) ( not ( = ?auto_838766 ?auto_838776 ) ) ( not ( = ?auto_838766 ?auto_838777 ) ) ( not ( = ?auto_838767 ?auto_838768 ) ) ( not ( = ?auto_838767 ?auto_838769 ) ) ( not ( = ?auto_838767 ?auto_838770 ) ) ( not ( = ?auto_838767 ?auto_838771 ) ) ( not ( = ?auto_838767 ?auto_838772 ) ) ( not ( = ?auto_838767 ?auto_838773 ) ) ( not ( = ?auto_838767 ?auto_838774 ) ) ( not ( = ?auto_838767 ?auto_838775 ) ) ( not ( = ?auto_838767 ?auto_838776 ) ) ( not ( = ?auto_838767 ?auto_838777 ) ) ( not ( = ?auto_838768 ?auto_838769 ) ) ( not ( = ?auto_838768 ?auto_838770 ) ) ( not ( = ?auto_838768 ?auto_838771 ) ) ( not ( = ?auto_838768 ?auto_838772 ) ) ( not ( = ?auto_838768 ?auto_838773 ) ) ( not ( = ?auto_838768 ?auto_838774 ) ) ( not ( = ?auto_838768 ?auto_838775 ) ) ( not ( = ?auto_838768 ?auto_838776 ) ) ( not ( = ?auto_838768 ?auto_838777 ) ) ( not ( = ?auto_838769 ?auto_838770 ) ) ( not ( = ?auto_838769 ?auto_838771 ) ) ( not ( = ?auto_838769 ?auto_838772 ) ) ( not ( = ?auto_838769 ?auto_838773 ) ) ( not ( = ?auto_838769 ?auto_838774 ) ) ( not ( = ?auto_838769 ?auto_838775 ) ) ( not ( = ?auto_838769 ?auto_838776 ) ) ( not ( = ?auto_838769 ?auto_838777 ) ) ( not ( = ?auto_838770 ?auto_838771 ) ) ( not ( = ?auto_838770 ?auto_838772 ) ) ( not ( = ?auto_838770 ?auto_838773 ) ) ( not ( = ?auto_838770 ?auto_838774 ) ) ( not ( = ?auto_838770 ?auto_838775 ) ) ( not ( = ?auto_838770 ?auto_838776 ) ) ( not ( = ?auto_838770 ?auto_838777 ) ) ( not ( = ?auto_838771 ?auto_838772 ) ) ( not ( = ?auto_838771 ?auto_838773 ) ) ( not ( = ?auto_838771 ?auto_838774 ) ) ( not ( = ?auto_838771 ?auto_838775 ) ) ( not ( = ?auto_838771 ?auto_838776 ) ) ( not ( = ?auto_838771 ?auto_838777 ) ) ( not ( = ?auto_838772 ?auto_838773 ) ) ( not ( = ?auto_838772 ?auto_838774 ) ) ( not ( = ?auto_838772 ?auto_838775 ) ) ( not ( = ?auto_838772 ?auto_838776 ) ) ( not ( = ?auto_838772 ?auto_838777 ) ) ( not ( = ?auto_838773 ?auto_838774 ) ) ( not ( = ?auto_838773 ?auto_838775 ) ) ( not ( = ?auto_838773 ?auto_838776 ) ) ( not ( = ?auto_838773 ?auto_838777 ) ) ( not ( = ?auto_838774 ?auto_838775 ) ) ( not ( = ?auto_838774 ?auto_838776 ) ) ( not ( = ?auto_838774 ?auto_838777 ) ) ( not ( = ?auto_838775 ?auto_838776 ) ) ( not ( = ?auto_838775 ?auto_838777 ) ) ( not ( = ?auto_838776 ?auto_838777 ) ) ( ON ?auto_838775 ?auto_838776 ) ( ON ?auto_838774 ?auto_838775 ) ( CLEAR ?auto_838772 ) ( ON ?auto_838773 ?auto_838774 ) ( CLEAR ?auto_838773 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_838765 ?auto_838766 ?auto_838767 ?auto_838768 ?auto_838769 ?auto_838770 ?auto_838771 ?auto_838772 ?auto_838773 )
      ( MAKE-12PILE ?auto_838765 ?auto_838766 ?auto_838767 ?auto_838768 ?auto_838769 ?auto_838770 ?auto_838771 ?auto_838772 ?auto_838773 ?auto_838774 ?auto_838775 ?auto_838776 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_838815 - BLOCK
      ?auto_838816 - BLOCK
      ?auto_838817 - BLOCK
      ?auto_838818 - BLOCK
      ?auto_838819 - BLOCK
      ?auto_838820 - BLOCK
      ?auto_838821 - BLOCK
      ?auto_838822 - BLOCK
      ?auto_838823 - BLOCK
      ?auto_838824 - BLOCK
      ?auto_838825 - BLOCK
      ?auto_838826 - BLOCK
    )
    :vars
    (
      ?auto_838827 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_838826 ?auto_838827 ) ( ON-TABLE ?auto_838815 ) ( ON ?auto_838816 ?auto_838815 ) ( ON ?auto_838817 ?auto_838816 ) ( ON ?auto_838818 ?auto_838817 ) ( ON ?auto_838819 ?auto_838818 ) ( ON ?auto_838820 ?auto_838819 ) ( ON ?auto_838821 ?auto_838820 ) ( not ( = ?auto_838815 ?auto_838816 ) ) ( not ( = ?auto_838815 ?auto_838817 ) ) ( not ( = ?auto_838815 ?auto_838818 ) ) ( not ( = ?auto_838815 ?auto_838819 ) ) ( not ( = ?auto_838815 ?auto_838820 ) ) ( not ( = ?auto_838815 ?auto_838821 ) ) ( not ( = ?auto_838815 ?auto_838822 ) ) ( not ( = ?auto_838815 ?auto_838823 ) ) ( not ( = ?auto_838815 ?auto_838824 ) ) ( not ( = ?auto_838815 ?auto_838825 ) ) ( not ( = ?auto_838815 ?auto_838826 ) ) ( not ( = ?auto_838815 ?auto_838827 ) ) ( not ( = ?auto_838816 ?auto_838817 ) ) ( not ( = ?auto_838816 ?auto_838818 ) ) ( not ( = ?auto_838816 ?auto_838819 ) ) ( not ( = ?auto_838816 ?auto_838820 ) ) ( not ( = ?auto_838816 ?auto_838821 ) ) ( not ( = ?auto_838816 ?auto_838822 ) ) ( not ( = ?auto_838816 ?auto_838823 ) ) ( not ( = ?auto_838816 ?auto_838824 ) ) ( not ( = ?auto_838816 ?auto_838825 ) ) ( not ( = ?auto_838816 ?auto_838826 ) ) ( not ( = ?auto_838816 ?auto_838827 ) ) ( not ( = ?auto_838817 ?auto_838818 ) ) ( not ( = ?auto_838817 ?auto_838819 ) ) ( not ( = ?auto_838817 ?auto_838820 ) ) ( not ( = ?auto_838817 ?auto_838821 ) ) ( not ( = ?auto_838817 ?auto_838822 ) ) ( not ( = ?auto_838817 ?auto_838823 ) ) ( not ( = ?auto_838817 ?auto_838824 ) ) ( not ( = ?auto_838817 ?auto_838825 ) ) ( not ( = ?auto_838817 ?auto_838826 ) ) ( not ( = ?auto_838817 ?auto_838827 ) ) ( not ( = ?auto_838818 ?auto_838819 ) ) ( not ( = ?auto_838818 ?auto_838820 ) ) ( not ( = ?auto_838818 ?auto_838821 ) ) ( not ( = ?auto_838818 ?auto_838822 ) ) ( not ( = ?auto_838818 ?auto_838823 ) ) ( not ( = ?auto_838818 ?auto_838824 ) ) ( not ( = ?auto_838818 ?auto_838825 ) ) ( not ( = ?auto_838818 ?auto_838826 ) ) ( not ( = ?auto_838818 ?auto_838827 ) ) ( not ( = ?auto_838819 ?auto_838820 ) ) ( not ( = ?auto_838819 ?auto_838821 ) ) ( not ( = ?auto_838819 ?auto_838822 ) ) ( not ( = ?auto_838819 ?auto_838823 ) ) ( not ( = ?auto_838819 ?auto_838824 ) ) ( not ( = ?auto_838819 ?auto_838825 ) ) ( not ( = ?auto_838819 ?auto_838826 ) ) ( not ( = ?auto_838819 ?auto_838827 ) ) ( not ( = ?auto_838820 ?auto_838821 ) ) ( not ( = ?auto_838820 ?auto_838822 ) ) ( not ( = ?auto_838820 ?auto_838823 ) ) ( not ( = ?auto_838820 ?auto_838824 ) ) ( not ( = ?auto_838820 ?auto_838825 ) ) ( not ( = ?auto_838820 ?auto_838826 ) ) ( not ( = ?auto_838820 ?auto_838827 ) ) ( not ( = ?auto_838821 ?auto_838822 ) ) ( not ( = ?auto_838821 ?auto_838823 ) ) ( not ( = ?auto_838821 ?auto_838824 ) ) ( not ( = ?auto_838821 ?auto_838825 ) ) ( not ( = ?auto_838821 ?auto_838826 ) ) ( not ( = ?auto_838821 ?auto_838827 ) ) ( not ( = ?auto_838822 ?auto_838823 ) ) ( not ( = ?auto_838822 ?auto_838824 ) ) ( not ( = ?auto_838822 ?auto_838825 ) ) ( not ( = ?auto_838822 ?auto_838826 ) ) ( not ( = ?auto_838822 ?auto_838827 ) ) ( not ( = ?auto_838823 ?auto_838824 ) ) ( not ( = ?auto_838823 ?auto_838825 ) ) ( not ( = ?auto_838823 ?auto_838826 ) ) ( not ( = ?auto_838823 ?auto_838827 ) ) ( not ( = ?auto_838824 ?auto_838825 ) ) ( not ( = ?auto_838824 ?auto_838826 ) ) ( not ( = ?auto_838824 ?auto_838827 ) ) ( not ( = ?auto_838825 ?auto_838826 ) ) ( not ( = ?auto_838825 ?auto_838827 ) ) ( not ( = ?auto_838826 ?auto_838827 ) ) ( ON ?auto_838825 ?auto_838826 ) ( ON ?auto_838824 ?auto_838825 ) ( ON ?auto_838823 ?auto_838824 ) ( CLEAR ?auto_838821 ) ( ON ?auto_838822 ?auto_838823 ) ( CLEAR ?auto_838822 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_838815 ?auto_838816 ?auto_838817 ?auto_838818 ?auto_838819 ?auto_838820 ?auto_838821 ?auto_838822 )
      ( MAKE-12PILE ?auto_838815 ?auto_838816 ?auto_838817 ?auto_838818 ?auto_838819 ?auto_838820 ?auto_838821 ?auto_838822 ?auto_838823 ?auto_838824 ?auto_838825 ?auto_838826 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_838865 - BLOCK
      ?auto_838866 - BLOCK
      ?auto_838867 - BLOCK
      ?auto_838868 - BLOCK
      ?auto_838869 - BLOCK
      ?auto_838870 - BLOCK
      ?auto_838871 - BLOCK
      ?auto_838872 - BLOCK
      ?auto_838873 - BLOCK
      ?auto_838874 - BLOCK
      ?auto_838875 - BLOCK
      ?auto_838876 - BLOCK
    )
    :vars
    (
      ?auto_838877 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_838876 ?auto_838877 ) ( ON-TABLE ?auto_838865 ) ( ON ?auto_838866 ?auto_838865 ) ( ON ?auto_838867 ?auto_838866 ) ( ON ?auto_838868 ?auto_838867 ) ( ON ?auto_838869 ?auto_838868 ) ( ON ?auto_838870 ?auto_838869 ) ( not ( = ?auto_838865 ?auto_838866 ) ) ( not ( = ?auto_838865 ?auto_838867 ) ) ( not ( = ?auto_838865 ?auto_838868 ) ) ( not ( = ?auto_838865 ?auto_838869 ) ) ( not ( = ?auto_838865 ?auto_838870 ) ) ( not ( = ?auto_838865 ?auto_838871 ) ) ( not ( = ?auto_838865 ?auto_838872 ) ) ( not ( = ?auto_838865 ?auto_838873 ) ) ( not ( = ?auto_838865 ?auto_838874 ) ) ( not ( = ?auto_838865 ?auto_838875 ) ) ( not ( = ?auto_838865 ?auto_838876 ) ) ( not ( = ?auto_838865 ?auto_838877 ) ) ( not ( = ?auto_838866 ?auto_838867 ) ) ( not ( = ?auto_838866 ?auto_838868 ) ) ( not ( = ?auto_838866 ?auto_838869 ) ) ( not ( = ?auto_838866 ?auto_838870 ) ) ( not ( = ?auto_838866 ?auto_838871 ) ) ( not ( = ?auto_838866 ?auto_838872 ) ) ( not ( = ?auto_838866 ?auto_838873 ) ) ( not ( = ?auto_838866 ?auto_838874 ) ) ( not ( = ?auto_838866 ?auto_838875 ) ) ( not ( = ?auto_838866 ?auto_838876 ) ) ( not ( = ?auto_838866 ?auto_838877 ) ) ( not ( = ?auto_838867 ?auto_838868 ) ) ( not ( = ?auto_838867 ?auto_838869 ) ) ( not ( = ?auto_838867 ?auto_838870 ) ) ( not ( = ?auto_838867 ?auto_838871 ) ) ( not ( = ?auto_838867 ?auto_838872 ) ) ( not ( = ?auto_838867 ?auto_838873 ) ) ( not ( = ?auto_838867 ?auto_838874 ) ) ( not ( = ?auto_838867 ?auto_838875 ) ) ( not ( = ?auto_838867 ?auto_838876 ) ) ( not ( = ?auto_838867 ?auto_838877 ) ) ( not ( = ?auto_838868 ?auto_838869 ) ) ( not ( = ?auto_838868 ?auto_838870 ) ) ( not ( = ?auto_838868 ?auto_838871 ) ) ( not ( = ?auto_838868 ?auto_838872 ) ) ( not ( = ?auto_838868 ?auto_838873 ) ) ( not ( = ?auto_838868 ?auto_838874 ) ) ( not ( = ?auto_838868 ?auto_838875 ) ) ( not ( = ?auto_838868 ?auto_838876 ) ) ( not ( = ?auto_838868 ?auto_838877 ) ) ( not ( = ?auto_838869 ?auto_838870 ) ) ( not ( = ?auto_838869 ?auto_838871 ) ) ( not ( = ?auto_838869 ?auto_838872 ) ) ( not ( = ?auto_838869 ?auto_838873 ) ) ( not ( = ?auto_838869 ?auto_838874 ) ) ( not ( = ?auto_838869 ?auto_838875 ) ) ( not ( = ?auto_838869 ?auto_838876 ) ) ( not ( = ?auto_838869 ?auto_838877 ) ) ( not ( = ?auto_838870 ?auto_838871 ) ) ( not ( = ?auto_838870 ?auto_838872 ) ) ( not ( = ?auto_838870 ?auto_838873 ) ) ( not ( = ?auto_838870 ?auto_838874 ) ) ( not ( = ?auto_838870 ?auto_838875 ) ) ( not ( = ?auto_838870 ?auto_838876 ) ) ( not ( = ?auto_838870 ?auto_838877 ) ) ( not ( = ?auto_838871 ?auto_838872 ) ) ( not ( = ?auto_838871 ?auto_838873 ) ) ( not ( = ?auto_838871 ?auto_838874 ) ) ( not ( = ?auto_838871 ?auto_838875 ) ) ( not ( = ?auto_838871 ?auto_838876 ) ) ( not ( = ?auto_838871 ?auto_838877 ) ) ( not ( = ?auto_838872 ?auto_838873 ) ) ( not ( = ?auto_838872 ?auto_838874 ) ) ( not ( = ?auto_838872 ?auto_838875 ) ) ( not ( = ?auto_838872 ?auto_838876 ) ) ( not ( = ?auto_838872 ?auto_838877 ) ) ( not ( = ?auto_838873 ?auto_838874 ) ) ( not ( = ?auto_838873 ?auto_838875 ) ) ( not ( = ?auto_838873 ?auto_838876 ) ) ( not ( = ?auto_838873 ?auto_838877 ) ) ( not ( = ?auto_838874 ?auto_838875 ) ) ( not ( = ?auto_838874 ?auto_838876 ) ) ( not ( = ?auto_838874 ?auto_838877 ) ) ( not ( = ?auto_838875 ?auto_838876 ) ) ( not ( = ?auto_838875 ?auto_838877 ) ) ( not ( = ?auto_838876 ?auto_838877 ) ) ( ON ?auto_838875 ?auto_838876 ) ( ON ?auto_838874 ?auto_838875 ) ( ON ?auto_838873 ?auto_838874 ) ( ON ?auto_838872 ?auto_838873 ) ( CLEAR ?auto_838870 ) ( ON ?auto_838871 ?auto_838872 ) ( CLEAR ?auto_838871 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_838865 ?auto_838866 ?auto_838867 ?auto_838868 ?auto_838869 ?auto_838870 ?auto_838871 )
      ( MAKE-12PILE ?auto_838865 ?auto_838866 ?auto_838867 ?auto_838868 ?auto_838869 ?auto_838870 ?auto_838871 ?auto_838872 ?auto_838873 ?auto_838874 ?auto_838875 ?auto_838876 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_838915 - BLOCK
      ?auto_838916 - BLOCK
      ?auto_838917 - BLOCK
      ?auto_838918 - BLOCK
      ?auto_838919 - BLOCK
      ?auto_838920 - BLOCK
      ?auto_838921 - BLOCK
      ?auto_838922 - BLOCK
      ?auto_838923 - BLOCK
      ?auto_838924 - BLOCK
      ?auto_838925 - BLOCK
      ?auto_838926 - BLOCK
    )
    :vars
    (
      ?auto_838927 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_838926 ?auto_838927 ) ( ON-TABLE ?auto_838915 ) ( ON ?auto_838916 ?auto_838915 ) ( ON ?auto_838917 ?auto_838916 ) ( ON ?auto_838918 ?auto_838917 ) ( ON ?auto_838919 ?auto_838918 ) ( not ( = ?auto_838915 ?auto_838916 ) ) ( not ( = ?auto_838915 ?auto_838917 ) ) ( not ( = ?auto_838915 ?auto_838918 ) ) ( not ( = ?auto_838915 ?auto_838919 ) ) ( not ( = ?auto_838915 ?auto_838920 ) ) ( not ( = ?auto_838915 ?auto_838921 ) ) ( not ( = ?auto_838915 ?auto_838922 ) ) ( not ( = ?auto_838915 ?auto_838923 ) ) ( not ( = ?auto_838915 ?auto_838924 ) ) ( not ( = ?auto_838915 ?auto_838925 ) ) ( not ( = ?auto_838915 ?auto_838926 ) ) ( not ( = ?auto_838915 ?auto_838927 ) ) ( not ( = ?auto_838916 ?auto_838917 ) ) ( not ( = ?auto_838916 ?auto_838918 ) ) ( not ( = ?auto_838916 ?auto_838919 ) ) ( not ( = ?auto_838916 ?auto_838920 ) ) ( not ( = ?auto_838916 ?auto_838921 ) ) ( not ( = ?auto_838916 ?auto_838922 ) ) ( not ( = ?auto_838916 ?auto_838923 ) ) ( not ( = ?auto_838916 ?auto_838924 ) ) ( not ( = ?auto_838916 ?auto_838925 ) ) ( not ( = ?auto_838916 ?auto_838926 ) ) ( not ( = ?auto_838916 ?auto_838927 ) ) ( not ( = ?auto_838917 ?auto_838918 ) ) ( not ( = ?auto_838917 ?auto_838919 ) ) ( not ( = ?auto_838917 ?auto_838920 ) ) ( not ( = ?auto_838917 ?auto_838921 ) ) ( not ( = ?auto_838917 ?auto_838922 ) ) ( not ( = ?auto_838917 ?auto_838923 ) ) ( not ( = ?auto_838917 ?auto_838924 ) ) ( not ( = ?auto_838917 ?auto_838925 ) ) ( not ( = ?auto_838917 ?auto_838926 ) ) ( not ( = ?auto_838917 ?auto_838927 ) ) ( not ( = ?auto_838918 ?auto_838919 ) ) ( not ( = ?auto_838918 ?auto_838920 ) ) ( not ( = ?auto_838918 ?auto_838921 ) ) ( not ( = ?auto_838918 ?auto_838922 ) ) ( not ( = ?auto_838918 ?auto_838923 ) ) ( not ( = ?auto_838918 ?auto_838924 ) ) ( not ( = ?auto_838918 ?auto_838925 ) ) ( not ( = ?auto_838918 ?auto_838926 ) ) ( not ( = ?auto_838918 ?auto_838927 ) ) ( not ( = ?auto_838919 ?auto_838920 ) ) ( not ( = ?auto_838919 ?auto_838921 ) ) ( not ( = ?auto_838919 ?auto_838922 ) ) ( not ( = ?auto_838919 ?auto_838923 ) ) ( not ( = ?auto_838919 ?auto_838924 ) ) ( not ( = ?auto_838919 ?auto_838925 ) ) ( not ( = ?auto_838919 ?auto_838926 ) ) ( not ( = ?auto_838919 ?auto_838927 ) ) ( not ( = ?auto_838920 ?auto_838921 ) ) ( not ( = ?auto_838920 ?auto_838922 ) ) ( not ( = ?auto_838920 ?auto_838923 ) ) ( not ( = ?auto_838920 ?auto_838924 ) ) ( not ( = ?auto_838920 ?auto_838925 ) ) ( not ( = ?auto_838920 ?auto_838926 ) ) ( not ( = ?auto_838920 ?auto_838927 ) ) ( not ( = ?auto_838921 ?auto_838922 ) ) ( not ( = ?auto_838921 ?auto_838923 ) ) ( not ( = ?auto_838921 ?auto_838924 ) ) ( not ( = ?auto_838921 ?auto_838925 ) ) ( not ( = ?auto_838921 ?auto_838926 ) ) ( not ( = ?auto_838921 ?auto_838927 ) ) ( not ( = ?auto_838922 ?auto_838923 ) ) ( not ( = ?auto_838922 ?auto_838924 ) ) ( not ( = ?auto_838922 ?auto_838925 ) ) ( not ( = ?auto_838922 ?auto_838926 ) ) ( not ( = ?auto_838922 ?auto_838927 ) ) ( not ( = ?auto_838923 ?auto_838924 ) ) ( not ( = ?auto_838923 ?auto_838925 ) ) ( not ( = ?auto_838923 ?auto_838926 ) ) ( not ( = ?auto_838923 ?auto_838927 ) ) ( not ( = ?auto_838924 ?auto_838925 ) ) ( not ( = ?auto_838924 ?auto_838926 ) ) ( not ( = ?auto_838924 ?auto_838927 ) ) ( not ( = ?auto_838925 ?auto_838926 ) ) ( not ( = ?auto_838925 ?auto_838927 ) ) ( not ( = ?auto_838926 ?auto_838927 ) ) ( ON ?auto_838925 ?auto_838926 ) ( ON ?auto_838924 ?auto_838925 ) ( ON ?auto_838923 ?auto_838924 ) ( ON ?auto_838922 ?auto_838923 ) ( ON ?auto_838921 ?auto_838922 ) ( CLEAR ?auto_838919 ) ( ON ?auto_838920 ?auto_838921 ) ( CLEAR ?auto_838920 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_838915 ?auto_838916 ?auto_838917 ?auto_838918 ?auto_838919 ?auto_838920 )
      ( MAKE-12PILE ?auto_838915 ?auto_838916 ?auto_838917 ?auto_838918 ?auto_838919 ?auto_838920 ?auto_838921 ?auto_838922 ?auto_838923 ?auto_838924 ?auto_838925 ?auto_838926 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_838965 - BLOCK
      ?auto_838966 - BLOCK
      ?auto_838967 - BLOCK
      ?auto_838968 - BLOCK
      ?auto_838969 - BLOCK
      ?auto_838970 - BLOCK
      ?auto_838971 - BLOCK
      ?auto_838972 - BLOCK
      ?auto_838973 - BLOCK
      ?auto_838974 - BLOCK
      ?auto_838975 - BLOCK
      ?auto_838976 - BLOCK
    )
    :vars
    (
      ?auto_838977 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_838976 ?auto_838977 ) ( ON-TABLE ?auto_838965 ) ( ON ?auto_838966 ?auto_838965 ) ( ON ?auto_838967 ?auto_838966 ) ( ON ?auto_838968 ?auto_838967 ) ( not ( = ?auto_838965 ?auto_838966 ) ) ( not ( = ?auto_838965 ?auto_838967 ) ) ( not ( = ?auto_838965 ?auto_838968 ) ) ( not ( = ?auto_838965 ?auto_838969 ) ) ( not ( = ?auto_838965 ?auto_838970 ) ) ( not ( = ?auto_838965 ?auto_838971 ) ) ( not ( = ?auto_838965 ?auto_838972 ) ) ( not ( = ?auto_838965 ?auto_838973 ) ) ( not ( = ?auto_838965 ?auto_838974 ) ) ( not ( = ?auto_838965 ?auto_838975 ) ) ( not ( = ?auto_838965 ?auto_838976 ) ) ( not ( = ?auto_838965 ?auto_838977 ) ) ( not ( = ?auto_838966 ?auto_838967 ) ) ( not ( = ?auto_838966 ?auto_838968 ) ) ( not ( = ?auto_838966 ?auto_838969 ) ) ( not ( = ?auto_838966 ?auto_838970 ) ) ( not ( = ?auto_838966 ?auto_838971 ) ) ( not ( = ?auto_838966 ?auto_838972 ) ) ( not ( = ?auto_838966 ?auto_838973 ) ) ( not ( = ?auto_838966 ?auto_838974 ) ) ( not ( = ?auto_838966 ?auto_838975 ) ) ( not ( = ?auto_838966 ?auto_838976 ) ) ( not ( = ?auto_838966 ?auto_838977 ) ) ( not ( = ?auto_838967 ?auto_838968 ) ) ( not ( = ?auto_838967 ?auto_838969 ) ) ( not ( = ?auto_838967 ?auto_838970 ) ) ( not ( = ?auto_838967 ?auto_838971 ) ) ( not ( = ?auto_838967 ?auto_838972 ) ) ( not ( = ?auto_838967 ?auto_838973 ) ) ( not ( = ?auto_838967 ?auto_838974 ) ) ( not ( = ?auto_838967 ?auto_838975 ) ) ( not ( = ?auto_838967 ?auto_838976 ) ) ( not ( = ?auto_838967 ?auto_838977 ) ) ( not ( = ?auto_838968 ?auto_838969 ) ) ( not ( = ?auto_838968 ?auto_838970 ) ) ( not ( = ?auto_838968 ?auto_838971 ) ) ( not ( = ?auto_838968 ?auto_838972 ) ) ( not ( = ?auto_838968 ?auto_838973 ) ) ( not ( = ?auto_838968 ?auto_838974 ) ) ( not ( = ?auto_838968 ?auto_838975 ) ) ( not ( = ?auto_838968 ?auto_838976 ) ) ( not ( = ?auto_838968 ?auto_838977 ) ) ( not ( = ?auto_838969 ?auto_838970 ) ) ( not ( = ?auto_838969 ?auto_838971 ) ) ( not ( = ?auto_838969 ?auto_838972 ) ) ( not ( = ?auto_838969 ?auto_838973 ) ) ( not ( = ?auto_838969 ?auto_838974 ) ) ( not ( = ?auto_838969 ?auto_838975 ) ) ( not ( = ?auto_838969 ?auto_838976 ) ) ( not ( = ?auto_838969 ?auto_838977 ) ) ( not ( = ?auto_838970 ?auto_838971 ) ) ( not ( = ?auto_838970 ?auto_838972 ) ) ( not ( = ?auto_838970 ?auto_838973 ) ) ( not ( = ?auto_838970 ?auto_838974 ) ) ( not ( = ?auto_838970 ?auto_838975 ) ) ( not ( = ?auto_838970 ?auto_838976 ) ) ( not ( = ?auto_838970 ?auto_838977 ) ) ( not ( = ?auto_838971 ?auto_838972 ) ) ( not ( = ?auto_838971 ?auto_838973 ) ) ( not ( = ?auto_838971 ?auto_838974 ) ) ( not ( = ?auto_838971 ?auto_838975 ) ) ( not ( = ?auto_838971 ?auto_838976 ) ) ( not ( = ?auto_838971 ?auto_838977 ) ) ( not ( = ?auto_838972 ?auto_838973 ) ) ( not ( = ?auto_838972 ?auto_838974 ) ) ( not ( = ?auto_838972 ?auto_838975 ) ) ( not ( = ?auto_838972 ?auto_838976 ) ) ( not ( = ?auto_838972 ?auto_838977 ) ) ( not ( = ?auto_838973 ?auto_838974 ) ) ( not ( = ?auto_838973 ?auto_838975 ) ) ( not ( = ?auto_838973 ?auto_838976 ) ) ( not ( = ?auto_838973 ?auto_838977 ) ) ( not ( = ?auto_838974 ?auto_838975 ) ) ( not ( = ?auto_838974 ?auto_838976 ) ) ( not ( = ?auto_838974 ?auto_838977 ) ) ( not ( = ?auto_838975 ?auto_838976 ) ) ( not ( = ?auto_838975 ?auto_838977 ) ) ( not ( = ?auto_838976 ?auto_838977 ) ) ( ON ?auto_838975 ?auto_838976 ) ( ON ?auto_838974 ?auto_838975 ) ( ON ?auto_838973 ?auto_838974 ) ( ON ?auto_838972 ?auto_838973 ) ( ON ?auto_838971 ?auto_838972 ) ( ON ?auto_838970 ?auto_838971 ) ( CLEAR ?auto_838968 ) ( ON ?auto_838969 ?auto_838970 ) ( CLEAR ?auto_838969 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_838965 ?auto_838966 ?auto_838967 ?auto_838968 ?auto_838969 )
      ( MAKE-12PILE ?auto_838965 ?auto_838966 ?auto_838967 ?auto_838968 ?auto_838969 ?auto_838970 ?auto_838971 ?auto_838972 ?auto_838973 ?auto_838974 ?auto_838975 ?auto_838976 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_839015 - BLOCK
      ?auto_839016 - BLOCK
      ?auto_839017 - BLOCK
      ?auto_839018 - BLOCK
      ?auto_839019 - BLOCK
      ?auto_839020 - BLOCK
      ?auto_839021 - BLOCK
      ?auto_839022 - BLOCK
      ?auto_839023 - BLOCK
      ?auto_839024 - BLOCK
      ?auto_839025 - BLOCK
      ?auto_839026 - BLOCK
    )
    :vars
    (
      ?auto_839027 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_839026 ?auto_839027 ) ( ON-TABLE ?auto_839015 ) ( ON ?auto_839016 ?auto_839015 ) ( ON ?auto_839017 ?auto_839016 ) ( not ( = ?auto_839015 ?auto_839016 ) ) ( not ( = ?auto_839015 ?auto_839017 ) ) ( not ( = ?auto_839015 ?auto_839018 ) ) ( not ( = ?auto_839015 ?auto_839019 ) ) ( not ( = ?auto_839015 ?auto_839020 ) ) ( not ( = ?auto_839015 ?auto_839021 ) ) ( not ( = ?auto_839015 ?auto_839022 ) ) ( not ( = ?auto_839015 ?auto_839023 ) ) ( not ( = ?auto_839015 ?auto_839024 ) ) ( not ( = ?auto_839015 ?auto_839025 ) ) ( not ( = ?auto_839015 ?auto_839026 ) ) ( not ( = ?auto_839015 ?auto_839027 ) ) ( not ( = ?auto_839016 ?auto_839017 ) ) ( not ( = ?auto_839016 ?auto_839018 ) ) ( not ( = ?auto_839016 ?auto_839019 ) ) ( not ( = ?auto_839016 ?auto_839020 ) ) ( not ( = ?auto_839016 ?auto_839021 ) ) ( not ( = ?auto_839016 ?auto_839022 ) ) ( not ( = ?auto_839016 ?auto_839023 ) ) ( not ( = ?auto_839016 ?auto_839024 ) ) ( not ( = ?auto_839016 ?auto_839025 ) ) ( not ( = ?auto_839016 ?auto_839026 ) ) ( not ( = ?auto_839016 ?auto_839027 ) ) ( not ( = ?auto_839017 ?auto_839018 ) ) ( not ( = ?auto_839017 ?auto_839019 ) ) ( not ( = ?auto_839017 ?auto_839020 ) ) ( not ( = ?auto_839017 ?auto_839021 ) ) ( not ( = ?auto_839017 ?auto_839022 ) ) ( not ( = ?auto_839017 ?auto_839023 ) ) ( not ( = ?auto_839017 ?auto_839024 ) ) ( not ( = ?auto_839017 ?auto_839025 ) ) ( not ( = ?auto_839017 ?auto_839026 ) ) ( not ( = ?auto_839017 ?auto_839027 ) ) ( not ( = ?auto_839018 ?auto_839019 ) ) ( not ( = ?auto_839018 ?auto_839020 ) ) ( not ( = ?auto_839018 ?auto_839021 ) ) ( not ( = ?auto_839018 ?auto_839022 ) ) ( not ( = ?auto_839018 ?auto_839023 ) ) ( not ( = ?auto_839018 ?auto_839024 ) ) ( not ( = ?auto_839018 ?auto_839025 ) ) ( not ( = ?auto_839018 ?auto_839026 ) ) ( not ( = ?auto_839018 ?auto_839027 ) ) ( not ( = ?auto_839019 ?auto_839020 ) ) ( not ( = ?auto_839019 ?auto_839021 ) ) ( not ( = ?auto_839019 ?auto_839022 ) ) ( not ( = ?auto_839019 ?auto_839023 ) ) ( not ( = ?auto_839019 ?auto_839024 ) ) ( not ( = ?auto_839019 ?auto_839025 ) ) ( not ( = ?auto_839019 ?auto_839026 ) ) ( not ( = ?auto_839019 ?auto_839027 ) ) ( not ( = ?auto_839020 ?auto_839021 ) ) ( not ( = ?auto_839020 ?auto_839022 ) ) ( not ( = ?auto_839020 ?auto_839023 ) ) ( not ( = ?auto_839020 ?auto_839024 ) ) ( not ( = ?auto_839020 ?auto_839025 ) ) ( not ( = ?auto_839020 ?auto_839026 ) ) ( not ( = ?auto_839020 ?auto_839027 ) ) ( not ( = ?auto_839021 ?auto_839022 ) ) ( not ( = ?auto_839021 ?auto_839023 ) ) ( not ( = ?auto_839021 ?auto_839024 ) ) ( not ( = ?auto_839021 ?auto_839025 ) ) ( not ( = ?auto_839021 ?auto_839026 ) ) ( not ( = ?auto_839021 ?auto_839027 ) ) ( not ( = ?auto_839022 ?auto_839023 ) ) ( not ( = ?auto_839022 ?auto_839024 ) ) ( not ( = ?auto_839022 ?auto_839025 ) ) ( not ( = ?auto_839022 ?auto_839026 ) ) ( not ( = ?auto_839022 ?auto_839027 ) ) ( not ( = ?auto_839023 ?auto_839024 ) ) ( not ( = ?auto_839023 ?auto_839025 ) ) ( not ( = ?auto_839023 ?auto_839026 ) ) ( not ( = ?auto_839023 ?auto_839027 ) ) ( not ( = ?auto_839024 ?auto_839025 ) ) ( not ( = ?auto_839024 ?auto_839026 ) ) ( not ( = ?auto_839024 ?auto_839027 ) ) ( not ( = ?auto_839025 ?auto_839026 ) ) ( not ( = ?auto_839025 ?auto_839027 ) ) ( not ( = ?auto_839026 ?auto_839027 ) ) ( ON ?auto_839025 ?auto_839026 ) ( ON ?auto_839024 ?auto_839025 ) ( ON ?auto_839023 ?auto_839024 ) ( ON ?auto_839022 ?auto_839023 ) ( ON ?auto_839021 ?auto_839022 ) ( ON ?auto_839020 ?auto_839021 ) ( ON ?auto_839019 ?auto_839020 ) ( CLEAR ?auto_839017 ) ( ON ?auto_839018 ?auto_839019 ) ( CLEAR ?auto_839018 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_839015 ?auto_839016 ?auto_839017 ?auto_839018 )
      ( MAKE-12PILE ?auto_839015 ?auto_839016 ?auto_839017 ?auto_839018 ?auto_839019 ?auto_839020 ?auto_839021 ?auto_839022 ?auto_839023 ?auto_839024 ?auto_839025 ?auto_839026 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_839065 - BLOCK
      ?auto_839066 - BLOCK
      ?auto_839067 - BLOCK
      ?auto_839068 - BLOCK
      ?auto_839069 - BLOCK
      ?auto_839070 - BLOCK
      ?auto_839071 - BLOCK
      ?auto_839072 - BLOCK
      ?auto_839073 - BLOCK
      ?auto_839074 - BLOCK
      ?auto_839075 - BLOCK
      ?auto_839076 - BLOCK
    )
    :vars
    (
      ?auto_839077 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_839076 ?auto_839077 ) ( ON-TABLE ?auto_839065 ) ( ON ?auto_839066 ?auto_839065 ) ( not ( = ?auto_839065 ?auto_839066 ) ) ( not ( = ?auto_839065 ?auto_839067 ) ) ( not ( = ?auto_839065 ?auto_839068 ) ) ( not ( = ?auto_839065 ?auto_839069 ) ) ( not ( = ?auto_839065 ?auto_839070 ) ) ( not ( = ?auto_839065 ?auto_839071 ) ) ( not ( = ?auto_839065 ?auto_839072 ) ) ( not ( = ?auto_839065 ?auto_839073 ) ) ( not ( = ?auto_839065 ?auto_839074 ) ) ( not ( = ?auto_839065 ?auto_839075 ) ) ( not ( = ?auto_839065 ?auto_839076 ) ) ( not ( = ?auto_839065 ?auto_839077 ) ) ( not ( = ?auto_839066 ?auto_839067 ) ) ( not ( = ?auto_839066 ?auto_839068 ) ) ( not ( = ?auto_839066 ?auto_839069 ) ) ( not ( = ?auto_839066 ?auto_839070 ) ) ( not ( = ?auto_839066 ?auto_839071 ) ) ( not ( = ?auto_839066 ?auto_839072 ) ) ( not ( = ?auto_839066 ?auto_839073 ) ) ( not ( = ?auto_839066 ?auto_839074 ) ) ( not ( = ?auto_839066 ?auto_839075 ) ) ( not ( = ?auto_839066 ?auto_839076 ) ) ( not ( = ?auto_839066 ?auto_839077 ) ) ( not ( = ?auto_839067 ?auto_839068 ) ) ( not ( = ?auto_839067 ?auto_839069 ) ) ( not ( = ?auto_839067 ?auto_839070 ) ) ( not ( = ?auto_839067 ?auto_839071 ) ) ( not ( = ?auto_839067 ?auto_839072 ) ) ( not ( = ?auto_839067 ?auto_839073 ) ) ( not ( = ?auto_839067 ?auto_839074 ) ) ( not ( = ?auto_839067 ?auto_839075 ) ) ( not ( = ?auto_839067 ?auto_839076 ) ) ( not ( = ?auto_839067 ?auto_839077 ) ) ( not ( = ?auto_839068 ?auto_839069 ) ) ( not ( = ?auto_839068 ?auto_839070 ) ) ( not ( = ?auto_839068 ?auto_839071 ) ) ( not ( = ?auto_839068 ?auto_839072 ) ) ( not ( = ?auto_839068 ?auto_839073 ) ) ( not ( = ?auto_839068 ?auto_839074 ) ) ( not ( = ?auto_839068 ?auto_839075 ) ) ( not ( = ?auto_839068 ?auto_839076 ) ) ( not ( = ?auto_839068 ?auto_839077 ) ) ( not ( = ?auto_839069 ?auto_839070 ) ) ( not ( = ?auto_839069 ?auto_839071 ) ) ( not ( = ?auto_839069 ?auto_839072 ) ) ( not ( = ?auto_839069 ?auto_839073 ) ) ( not ( = ?auto_839069 ?auto_839074 ) ) ( not ( = ?auto_839069 ?auto_839075 ) ) ( not ( = ?auto_839069 ?auto_839076 ) ) ( not ( = ?auto_839069 ?auto_839077 ) ) ( not ( = ?auto_839070 ?auto_839071 ) ) ( not ( = ?auto_839070 ?auto_839072 ) ) ( not ( = ?auto_839070 ?auto_839073 ) ) ( not ( = ?auto_839070 ?auto_839074 ) ) ( not ( = ?auto_839070 ?auto_839075 ) ) ( not ( = ?auto_839070 ?auto_839076 ) ) ( not ( = ?auto_839070 ?auto_839077 ) ) ( not ( = ?auto_839071 ?auto_839072 ) ) ( not ( = ?auto_839071 ?auto_839073 ) ) ( not ( = ?auto_839071 ?auto_839074 ) ) ( not ( = ?auto_839071 ?auto_839075 ) ) ( not ( = ?auto_839071 ?auto_839076 ) ) ( not ( = ?auto_839071 ?auto_839077 ) ) ( not ( = ?auto_839072 ?auto_839073 ) ) ( not ( = ?auto_839072 ?auto_839074 ) ) ( not ( = ?auto_839072 ?auto_839075 ) ) ( not ( = ?auto_839072 ?auto_839076 ) ) ( not ( = ?auto_839072 ?auto_839077 ) ) ( not ( = ?auto_839073 ?auto_839074 ) ) ( not ( = ?auto_839073 ?auto_839075 ) ) ( not ( = ?auto_839073 ?auto_839076 ) ) ( not ( = ?auto_839073 ?auto_839077 ) ) ( not ( = ?auto_839074 ?auto_839075 ) ) ( not ( = ?auto_839074 ?auto_839076 ) ) ( not ( = ?auto_839074 ?auto_839077 ) ) ( not ( = ?auto_839075 ?auto_839076 ) ) ( not ( = ?auto_839075 ?auto_839077 ) ) ( not ( = ?auto_839076 ?auto_839077 ) ) ( ON ?auto_839075 ?auto_839076 ) ( ON ?auto_839074 ?auto_839075 ) ( ON ?auto_839073 ?auto_839074 ) ( ON ?auto_839072 ?auto_839073 ) ( ON ?auto_839071 ?auto_839072 ) ( ON ?auto_839070 ?auto_839071 ) ( ON ?auto_839069 ?auto_839070 ) ( ON ?auto_839068 ?auto_839069 ) ( CLEAR ?auto_839066 ) ( ON ?auto_839067 ?auto_839068 ) ( CLEAR ?auto_839067 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_839065 ?auto_839066 ?auto_839067 )
      ( MAKE-12PILE ?auto_839065 ?auto_839066 ?auto_839067 ?auto_839068 ?auto_839069 ?auto_839070 ?auto_839071 ?auto_839072 ?auto_839073 ?auto_839074 ?auto_839075 ?auto_839076 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_839115 - BLOCK
      ?auto_839116 - BLOCK
      ?auto_839117 - BLOCK
      ?auto_839118 - BLOCK
      ?auto_839119 - BLOCK
      ?auto_839120 - BLOCK
      ?auto_839121 - BLOCK
      ?auto_839122 - BLOCK
      ?auto_839123 - BLOCK
      ?auto_839124 - BLOCK
      ?auto_839125 - BLOCK
      ?auto_839126 - BLOCK
    )
    :vars
    (
      ?auto_839127 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_839126 ?auto_839127 ) ( ON-TABLE ?auto_839115 ) ( not ( = ?auto_839115 ?auto_839116 ) ) ( not ( = ?auto_839115 ?auto_839117 ) ) ( not ( = ?auto_839115 ?auto_839118 ) ) ( not ( = ?auto_839115 ?auto_839119 ) ) ( not ( = ?auto_839115 ?auto_839120 ) ) ( not ( = ?auto_839115 ?auto_839121 ) ) ( not ( = ?auto_839115 ?auto_839122 ) ) ( not ( = ?auto_839115 ?auto_839123 ) ) ( not ( = ?auto_839115 ?auto_839124 ) ) ( not ( = ?auto_839115 ?auto_839125 ) ) ( not ( = ?auto_839115 ?auto_839126 ) ) ( not ( = ?auto_839115 ?auto_839127 ) ) ( not ( = ?auto_839116 ?auto_839117 ) ) ( not ( = ?auto_839116 ?auto_839118 ) ) ( not ( = ?auto_839116 ?auto_839119 ) ) ( not ( = ?auto_839116 ?auto_839120 ) ) ( not ( = ?auto_839116 ?auto_839121 ) ) ( not ( = ?auto_839116 ?auto_839122 ) ) ( not ( = ?auto_839116 ?auto_839123 ) ) ( not ( = ?auto_839116 ?auto_839124 ) ) ( not ( = ?auto_839116 ?auto_839125 ) ) ( not ( = ?auto_839116 ?auto_839126 ) ) ( not ( = ?auto_839116 ?auto_839127 ) ) ( not ( = ?auto_839117 ?auto_839118 ) ) ( not ( = ?auto_839117 ?auto_839119 ) ) ( not ( = ?auto_839117 ?auto_839120 ) ) ( not ( = ?auto_839117 ?auto_839121 ) ) ( not ( = ?auto_839117 ?auto_839122 ) ) ( not ( = ?auto_839117 ?auto_839123 ) ) ( not ( = ?auto_839117 ?auto_839124 ) ) ( not ( = ?auto_839117 ?auto_839125 ) ) ( not ( = ?auto_839117 ?auto_839126 ) ) ( not ( = ?auto_839117 ?auto_839127 ) ) ( not ( = ?auto_839118 ?auto_839119 ) ) ( not ( = ?auto_839118 ?auto_839120 ) ) ( not ( = ?auto_839118 ?auto_839121 ) ) ( not ( = ?auto_839118 ?auto_839122 ) ) ( not ( = ?auto_839118 ?auto_839123 ) ) ( not ( = ?auto_839118 ?auto_839124 ) ) ( not ( = ?auto_839118 ?auto_839125 ) ) ( not ( = ?auto_839118 ?auto_839126 ) ) ( not ( = ?auto_839118 ?auto_839127 ) ) ( not ( = ?auto_839119 ?auto_839120 ) ) ( not ( = ?auto_839119 ?auto_839121 ) ) ( not ( = ?auto_839119 ?auto_839122 ) ) ( not ( = ?auto_839119 ?auto_839123 ) ) ( not ( = ?auto_839119 ?auto_839124 ) ) ( not ( = ?auto_839119 ?auto_839125 ) ) ( not ( = ?auto_839119 ?auto_839126 ) ) ( not ( = ?auto_839119 ?auto_839127 ) ) ( not ( = ?auto_839120 ?auto_839121 ) ) ( not ( = ?auto_839120 ?auto_839122 ) ) ( not ( = ?auto_839120 ?auto_839123 ) ) ( not ( = ?auto_839120 ?auto_839124 ) ) ( not ( = ?auto_839120 ?auto_839125 ) ) ( not ( = ?auto_839120 ?auto_839126 ) ) ( not ( = ?auto_839120 ?auto_839127 ) ) ( not ( = ?auto_839121 ?auto_839122 ) ) ( not ( = ?auto_839121 ?auto_839123 ) ) ( not ( = ?auto_839121 ?auto_839124 ) ) ( not ( = ?auto_839121 ?auto_839125 ) ) ( not ( = ?auto_839121 ?auto_839126 ) ) ( not ( = ?auto_839121 ?auto_839127 ) ) ( not ( = ?auto_839122 ?auto_839123 ) ) ( not ( = ?auto_839122 ?auto_839124 ) ) ( not ( = ?auto_839122 ?auto_839125 ) ) ( not ( = ?auto_839122 ?auto_839126 ) ) ( not ( = ?auto_839122 ?auto_839127 ) ) ( not ( = ?auto_839123 ?auto_839124 ) ) ( not ( = ?auto_839123 ?auto_839125 ) ) ( not ( = ?auto_839123 ?auto_839126 ) ) ( not ( = ?auto_839123 ?auto_839127 ) ) ( not ( = ?auto_839124 ?auto_839125 ) ) ( not ( = ?auto_839124 ?auto_839126 ) ) ( not ( = ?auto_839124 ?auto_839127 ) ) ( not ( = ?auto_839125 ?auto_839126 ) ) ( not ( = ?auto_839125 ?auto_839127 ) ) ( not ( = ?auto_839126 ?auto_839127 ) ) ( ON ?auto_839125 ?auto_839126 ) ( ON ?auto_839124 ?auto_839125 ) ( ON ?auto_839123 ?auto_839124 ) ( ON ?auto_839122 ?auto_839123 ) ( ON ?auto_839121 ?auto_839122 ) ( ON ?auto_839120 ?auto_839121 ) ( ON ?auto_839119 ?auto_839120 ) ( ON ?auto_839118 ?auto_839119 ) ( ON ?auto_839117 ?auto_839118 ) ( CLEAR ?auto_839115 ) ( ON ?auto_839116 ?auto_839117 ) ( CLEAR ?auto_839116 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_839115 ?auto_839116 )
      ( MAKE-12PILE ?auto_839115 ?auto_839116 ?auto_839117 ?auto_839118 ?auto_839119 ?auto_839120 ?auto_839121 ?auto_839122 ?auto_839123 ?auto_839124 ?auto_839125 ?auto_839126 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_839165 - BLOCK
      ?auto_839166 - BLOCK
      ?auto_839167 - BLOCK
      ?auto_839168 - BLOCK
      ?auto_839169 - BLOCK
      ?auto_839170 - BLOCK
      ?auto_839171 - BLOCK
      ?auto_839172 - BLOCK
      ?auto_839173 - BLOCK
      ?auto_839174 - BLOCK
      ?auto_839175 - BLOCK
      ?auto_839176 - BLOCK
    )
    :vars
    (
      ?auto_839177 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_839176 ?auto_839177 ) ( not ( = ?auto_839165 ?auto_839166 ) ) ( not ( = ?auto_839165 ?auto_839167 ) ) ( not ( = ?auto_839165 ?auto_839168 ) ) ( not ( = ?auto_839165 ?auto_839169 ) ) ( not ( = ?auto_839165 ?auto_839170 ) ) ( not ( = ?auto_839165 ?auto_839171 ) ) ( not ( = ?auto_839165 ?auto_839172 ) ) ( not ( = ?auto_839165 ?auto_839173 ) ) ( not ( = ?auto_839165 ?auto_839174 ) ) ( not ( = ?auto_839165 ?auto_839175 ) ) ( not ( = ?auto_839165 ?auto_839176 ) ) ( not ( = ?auto_839165 ?auto_839177 ) ) ( not ( = ?auto_839166 ?auto_839167 ) ) ( not ( = ?auto_839166 ?auto_839168 ) ) ( not ( = ?auto_839166 ?auto_839169 ) ) ( not ( = ?auto_839166 ?auto_839170 ) ) ( not ( = ?auto_839166 ?auto_839171 ) ) ( not ( = ?auto_839166 ?auto_839172 ) ) ( not ( = ?auto_839166 ?auto_839173 ) ) ( not ( = ?auto_839166 ?auto_839174 ) ) ( not ( = ?auto_839166 ?auto_839175 ) ) ( not ( = ?auto_839166 ?auto_839176 ) ) ( not ( = ?auto_839166 ?auto_839177 ) ) ( not ( = ?auto_839167 ?auto_839168 ) ) ( not ( = ?auto_839167 ?auto_839169 ) ) ( not ( = ?auto_839167 ?auto_839170 ) ) ( not ( = ?auto_839167 ?auto_839171 ) ) ( not ( = ?auto_839167 ?auto_839172 ) ) ( not ( = ?auto_839167 ?auto_839173 ) ) ( not ( = ?auto_839167 ?auto_839174 ) ) ( not ( = ?auto_839167 ?auto_839175 ) ) ( not ( = ?auto_839167 ?auto_839176 ) ) ( not ( = ?auto_839167 ?auto_839177 ) ) ( not ( = ?auto_839168 ?auto_839169 ) ) ( not ( = ?auto_839168 ?auto_839170 ) ) ( not ( = ?auto_839168 ?auto_839171 ) ) ( not ( = ?auto_839168 ?auto_839172 ) ) ( not ( = ?auto_839168 ?auto_839173 ) ) ( not ( = ?auto_839168 ?auto_839174 ) ) ( not ( = ?auto_839168 ?auto_839175 ) ) ( not ( = ?auto_839168 ?auto_839176 ) ) ( not ( = ?auto_839168 ?auto_839177 ) ) ( not ( = ?auto_839169 ?auto_839170 ) ) ( not ( = ?auto_839169 ?auto_839171 ) ) ( not ( = ?auto_839169 ?auto_839172 ) ) ( not ( = ?auto_839169 ?auto_839173 ) ) ( not ( = ?auto_839169 ?auto_839174 ) ) ( not ( = ?auto_839169 ?auto_839175 ) ) ( not ( = ?auto_839169 ?auto_839176 ) ) ( not ( = ?auto_839169 ?auto_839177 ) ) ( not ( = ?auto_839170 ?auto_839171 ) ) ( not ( = ?auto_839170 ?auto_839172 ) ) ( not ( = ?auto_839170 ?auto_839173 ) ) ( not ( = ?auto_839170 ?auto_839174 ) ) ( not ( = ?auto_839170 ?auto_839175 ) ) ( not ( = ?auto_839170 ?auto_839176 ) ) ( not ( = ?auto_839170 ?auto_839177 ) ) ( not ( = ?auto_839171 ?auto_839172 ) ) ( not ( = ?auto_839171 ?auto_839173 ) ) ( not ( = ?auto_839171 ?auto_839174 ) ) ( not ( = ?auto_839171 ?auto_839175 ) ) ( not ( = ?auto_839171 ?auto_839176 ) ) ( not ( = ?auto_839171 ?auto_839177 ) ) ( not ( = ?auto_839172 ?auto_839173 ) ) ( not ( = ?auto_839172 ?auto_839174 ) ) ( not ( = ?auto_839172 ?auto_839175 ) ) ( not ( = ?auto_839172 ?auto_839176 ) ) ( not ( = ?auto_839172 ?auto_839177 ) ) ( not ( = ?auto_839173 ?auto_839174 ) ) ( not ( = ?auto_839173 ?auto_839175 ) ) ( not ( = ?auto_839173 ?auto_839176 ) ) ( not ( = ?auto_839173 ?auto_839177 ) ) ( not ( = ?auto_839174 ?auto_839175 ) ) ( not ( = ?auto_839174 ?auto_839176 ) ) ( not ( = ?auto_839174 ?auto_839177 ) ) ( not ( = ?auto_839175 ?auto_839176 ) ) ( not ( = ?auto_839175 ?auto_839177 ) ) ( not ( = ?auto_839176 ?auto_839177 ) ) ( ON ?auto_839175 ?auto_839176 ) ( ON ?auto_839174 ?auto_839175 ) ( ON ?auto_839173 ?auto_839174 ) ( ON ?auto_839172 ?auto_839173 ) ( ON ?auto_839171 ?auto_839172 ) ( ON ?auto_839170 ?auto_839171 ) ( ON ?auto_839169 ?auto_839170 ) ( ON ?auto_839168 ?auto_839169 ) ( ON ?auto_839167 ?auto_839168 ) ( ON ?auto_839166 ?auto_839167 ) ( ON ?auto_839165 ?auto_839166 ) ( CLEAR ?auto_839165 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_839165 )
      ( MAKE-12PILE ?auto_839165 ?auto_839166 ?auto_839167 ?auto_839168 ?auto_839169 ?auto_839170 ?auto_839171 ?auto_839172 ?auto_839173 ?auto_839174 ?auto_839175 ?auto_839176 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_839216 - BLOCK
      ?auto_839217 - BLOCK
      ?auto_839218 - BLOCK
      ?auto_839219 - BLOCK
      ?auto_839220 - BLOCK
      ?auto_839221 - BLOCK
      ?auto_839222 - BLOCK
      ?auto_839223 - BLOCK
      ?auto_839224 - BLOCK
      ?auto_839225 - BLOCK
      ?auto_839226 - BLOCK
      ?auto_839227 - BLOCK
      ?auto_839228 - BLOCK
    )
    :vars
    (
      ?auto_839229 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_839227 ) ( ON ?auto_839228 ?auto_839229 ) ( CLEAR ?auto_839228 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_839216 ) ( ON ?auto_839217 ?auto_839216 ) ( ON ?auto_839218 ?auto_839217 ) ( ON ?auto_839219 ?auto_839218 ) ( ON ?auto_839220 ?auto_839219 ) ( ON ?auto_839221 ?auto_839220 ) ( ON ?auto_839222 ?auto_839221 ) ( ON ?auto_839223 ?auto_839222 ) ( ON ?auto_839224 ?auto_839223 ) ( ON ?auto_839225 ?auto_839224 ) ( ON ?auto_839226 ?auto_839225 ) ( ON ?auto_839227 ?auto_839226 ) ( not ( = ?auto_839216 ?auto_839217 ) ) ( not ( = ?auto_839216 ?auto_839218 ) ) ( not ( = ?auto_839216 ?auto_839219 ) ) ( not ( = ?auto_839216 ?auto_839220 ) ) ( not ( = ?auto_839216 ?auto_839221 ) ) ( not ( = ?auto_839216 ?auto_839222 ) ) ( not ( = ?auto_839216 ?auto_839223 ) ) ( not ( = ?auto_839216 ?auto_839224 ) ) ( not ( = ?auto_839216 ?auto_839225 ) ) ( not ( = ?auto_839216 ?auto_839226 ) ) ( not ( = ?auto_839216 ?auto_839227 ) ) ( not ( = ?auto_839216 ?auto_839228 ) ) ( not ( = ?auto_839216 ?auto_839229 ) ) ( not ( = ?auto_839217 ?auto_839218 ) ) ( not ( = ?auto_839217 ?auto_839219 ) ) ( not ( = ?auto_839217 ?auto_839220 ) ) ( not ( = ?auto_839217 ?auto_839221 ) ) ( not ( = ?auto_839217 ?auto_839222 ) ) ( not ( = ?auto_839217 ?auto_839223 ) ) ( not ( = ?auto_839217 ?auto_839224 ) ) ( not ( = ?auto_839217 ?auto_839225 ) ) ( not ( = ?auto_839217 ?auto_839226 ) ) ( not ( = ?auto_839217 ?auto_839227 ) ) ( not ( = ?auto_839217 ?auto_839228 ) ) ( not ( = ?auto_839217 ?auto_839229 ) ) ( not ( = ?auto_839218 ?auto_839219 ) ) ( not ( = ?auto_839218 ?auto_839220 ) ) ( not ( = ?auto_839218 ?auto_839221 ) ) ( not ( = ?auto_839218 ?auto_839222 ) ) ( not ( = ?auto_839218 ?auto_839223 ) ) ( not ( = ?auto_839218 ?auto_839224 ) ) ( not ( = ?auto_839218 ?auto_839225 ) ) ( not ( = ?auto_839218 ?auto_839226 ) ) ( not ( = ?auto_839218 ?auto_839227 ) ) ( not ( = ?auto_839218 ?auto_839228 ) ) ( not ( = ?auto_839218 ?auto_839229 ) ) ( not ( = ?auto_839219 ?auto_839220 ) ) ( not ( = ?auto_839219 ?auto_839221 ) ) ( not ( = ?auto_839219 ?auto_839222 ) ) ( not ( = ?auto_839219 ?auto_839223 ) ) ( not ( = ?auto_839219 ?auto_839224 ) ) ( not ( = ?auto_839219 ?auto_839225 ) ) ( not ( = ?auto_839219 ?auto_839226 ) ) ( not ( = ?auto_839219 ?auto_839227 ) ) ( not ( = ?auto_839219 ?auto_839228 ) ) ( not ( = ?auto_839219 ?auto_839229 ) ) ( not ( = ?auto_839220 ?auto_839221 ) ) ( not ( = ?auto_839220 ?auto_839222 ) ) ( not ( = ?auto_839220 ?auto_839223 ) ) ( not ( = ?auto_839220 ?auto_839224 ) ) ( not ( = ?auto_839220 ?auto_839225 ) ) ( not ( = ?auto_839220 ?auto_839226 ) ) ( not ( = ?auto_839220 ?auto_839227 ) ) ( not ( = ?auto_839220 ?auto_839228 ) ) ( not ( = ?auto_839220 ?auto_839229 ) ) ( not ( = ?auto_839221 ?auto_839222 ) ) ( not ( = ?auto_839221 ?auto_839223 ) ) ( not ( = ?auto_839221 ?auto_839224 ) ) ( not ( = ?auto_839221 ?auto_839225 ) ) ( not ( = ?auto_839221 ?auto_839226 ) ) ( not ( = ?auto_839221 ?auto_839227 ) ) ( not ( = ?auto_839221 ?auto_839228 ) ) ( not ( = ?auto_839221 ?auto_839229 ) ) ( not ( = ?auto_839222 ?auto_839223 ) ) ( not ( = ?auto_839222 ?auto_839224 ) ) ( not ( = ?auto_839222 ?auto_839225 ) ) ( not ( = ?auto_839222 ?auto_839226 ) ) ( not ( = ?auto_839222 ?auto_839227 ) ) ( not ( = ?auto_839222 ?auto_839228 ) ) ( not ( = ?auto_839222 ?auto_839229 ) ) ( not ( = ?auto_839223 ?auto_839224 ) ) ( not ( = ?auto_839223 ?auto_839225 ) ) ( not ( = ?auto_839223 ?auto_839226 ) ) ( not ( = ?auto_839223 ?auto_839227 ) ) ( not ( = ?auto_839223 ?auto_839228 ) ) ( not ( = ?auto_839223 ?auto_839229 ) ) ( not ( = ?auto_839224 ?auto_839225 ) ) ( not ( = ?auto_839224 ?auto_839226 ) ) ( not ( = ?auto_839224 ?auto_839227 ) ) ( not ( = ?auto_839224 ?auto_839228 ) ) ( not ( = ?auto_839224 ?auto_839229 ) ) ( not ( = ?auto_839225 ?auto_839226 ) ) ( not ( = ?auto_839225 ?auto_839227 ) ) ( not ( = ?auto_839225 ?auto_839228 ) ) ( not ( = ?auto_839225 ?auto_839229 ) ) ( not ( = ?auto_839226 ?auto_839227 ) ) ( not ( = ?auto_839226 ?auto_839228 ) ) ( not ( = ?auto_839226 ?auto_839229 ) ) ( not ( = ?auto_839227 ?auto_839228 ) ) ( not ( = ?auto_839227 ?auto_839229 ) ) ( not ( = ?auto_839228 ?auto_839229 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_839228 ?auto_839229 )
      ( !STACK ?auto_839228 ?auto_839227 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_839270 - BLOCK
      ?auto_839271 - BLOCK
      ?auto_839272 - BLOCK
      ?auto_839273 - BLOCK
      ?auto_839274 - BLOCK
      ?auto_839275 - BLOCK
      ?auto_839276 - BLOCK
      ?auto_839277 - BLOCK
      ?auto_839278 - BLOCK
      ?auto_839279 - BLOCK
      ?auto_839280 - BLOCK
      ?auto_839281 - BLOCK
      ?auto_839282 - BLOCK
    )
    :vars
    (
      ?auto_839283 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_839282 ?auto_839283 ) ( ON-TABLE ?auto_839270 ) ( ON ?auto_839271 ?auto_839270 ) ( ON ?auto_839272 ?auto_839271 ) ( ON ?auto_839273 ?auto_839272 ) ( ON ?auto_839274 ?auto_839273 ) ( ON ?auto_839275 ?auto_839274 ) ( ON ?auto_839276 ?auto_839275 ) ( ON ?auto_839277 ?auto_839276 ) ( ON ?auto_839278 ?auto_839277 ) ( ON ?auto_839279 ?auto_839278 ) ( ON ?auto_839280 ?auto_839279 ) ( not ( = ?auto_839270 ?auto_839271 ) ) ( not ( = ?auto_839270 ?auto_839272 ) ) ( not ( = ?auto_839270 ?auto_839273 ) ) ( not ( = ?auto_839270 ?auto_839274 ) ) ( not ( = ?auto_839270 ?auto_839275 ) ) ( not ( = ?auto_839270 ?auto_839276 ) ) ( not ( = ?auto_839270 ?auto_839277 ) ) ( not ( = ?auto_839270 ?auto_839278 ) ) ( not ( = ?auto_839270 ?auto_839279 ) ) ( not ( = ?auto_839270 ?auto_839280 ) ) ( not ( = ?auto_839270 ?auto_839281 ) ) ( not ( = ?auto_839270 ?auto_839282 ) ) ( not ( = ?auto_839270 ?auto_839283 ) ) ( not ( = ?auto_839271 ?auto_839272 ) ) ( not ( = ?auto_839271 ?auto_839273 ) ) ( not ( = ?auto_839271 ?auto_839274 ) ) ( not ( = ?auto_839271 ?auto_839275 ) ) ( not ( = ?auto_839271 ?auto_839276 ) ) ( not ( = ?auto_839271 ?auto_839277 ) ) ( not ( = ?auto_839271 ?auto_839278 ) ) ( not ( = ?auto_839271 ?auto_839279 ) ) ( not ( = ?auto_839271 ?auto_839280 ) ) ( not ( = ?auto_839271 ?auto_839281 ) ) ( not ( = ?auto_839271 ?auto_839282 ) ) ( not ( = ?auto_839271 ?auto_839283 ) ) ( not ( = ?auto_839272 ?auto_839273 ) ) ( not ( = ?auto_839272 ?auto_839274 ) ) ( not ( = ?auto_839272 ?auto_839275 ) ) ( not ( = ?auto_839272 ?auto_839276 ) ) ( not ( = ?auto_839272 ?auto_839277 ) ) ( not ( = ?auto_839272 ?auto_839278 ) ) ( not ( = ?auto_839272 ?auto_839279 ) ) ( not ( = ?auto_839272 ?auto_839280 ) ) ( not ( = ?auto_839272 ?auto_839281 ) ) ( not ( = ?auto_839272 ?auto_839282 ) ) ( not ( = ?auto_839272 ?auto_839283 ) ) ( not ( = ?auto_839273 ?auto_839274 ) ) ( not ( = ?auto_839273 ?auto_839275 ) ) ( not ( = ?auto_839273 ?auto_839276 ) ) ( not ( = ?auto_839273 ?auto_839277 ) ) ( not ( = ?auto_839273 ?auto_839278 ) ) ( not ( = ?auto_839273 ?auto_839279 ) ) ( not ( = ?auto_839273 ?auto_839280 ) ) ( not ( = ?auto_839273 ?auto_839281 ) ) ( not ( = ?auto_839273 ?auto_839282 ) ) ( not ( = ?auto_839273 ?auto_839283 ) ) ( not ( = ?auto_839274 ?auto_839275 ) ) ( not ( = ?auto_839274 ?auto_839276 ) ) ( not ( = ?auto_839274 ?auto_839277 ) ) ( not ( = ?auto_839274 ?auto_839278 ) ) ( not ( = ?auto_839274 ?auto_839279 ) ) ( not ( = ?auto_839274 ?auto_839280 ) ) ( not ( = ?auto_839274 ?auto_839281 ) ) ( not ( = ?auto_839274 ?auto_839282 ) ) ( not ( = ?auto_839274 ?auto_839283 ) ) ( not ( = ?auto_839275 ?auto_839276 ) ) ( not ( = ?auto_839275 ?auto_839277 ) ) ( not ( = ?auto_839275 ?auto_839278 ) ) ( not ( = ?auto_839275 ?auto_839279 ) ) ( not ( = ?auto_839275 ?auto_839280 ) ) ( not ( = ?auto_839275 ?auto_839281 ) ) ( not ( = ?auto_839275 ?auto_839282 ) ) ( not ( = ?auto_839275 ?auto_839283 ) ) ( not ( = ?auto_839276 ?auto_839277 ) ) ( not ( = ?auto_839276 ?auto_839278 ) ) ( not ( = ?auto_839276 ?auto_839279 ) ) ( not ( = ?auto_839276 ?auto_839280 ) ) ( not ( = ?auto_839276 ?auto_839281 ) ) ( not ( = ?auto_839276 ?auto_839282 ) ) ( not ( = ?auto_839276 ?auto_839283 ) ) ( not ( = ?auto_839277 ?auto_839278 ) ) ( not ( = ?auto_839277 ?auto_839279 ) ) ( not ( = ?auto_839277 ?auto_839280 ) ) ( not ( = ?auto_839277 ?auto_839281 ) ) ( not ( = ?auto_839277 ?auto_839282 ) ) ( not ( = ?auto_839277 ?auto_839283 ) ) ( not ( = ?auto_839278 ?auto_839279 ) ) ( not ( = ?auto_839278 ?auto_839280 ) ) ( not ( = ?auto_839278 ?auto_839281 ) ) ( not ( = ?auto_839278 ?auto_839282 ) ) ( not ( = ?auto_839278 ?auto_839283 ) ) ( not ( = ?auto_839279 ?auto_839280 ) ) ( not ( = ?auto_839279 ?auto_839281 ) ) ( not ( = ?auto_839279 ?auto_839282 ) ) ( not ( = ?auto_839279 ?auto_839283 ) ) ( not ( = ?auto_839280 ?auto_839281 ) ) ( not ( = ?auto_839280 ?auto_839282 ) ) ( not ( = ?auto_839280 ?auto_839283 ) ) ( not ( = ?auto_839281 ?auto_839282 ) ) ( not ( = ?auto_839281 ?auto_839283 ) ) ( not ( = ?auto_839282 ?auto_839283 ) ) ( CLEAR ?auto_839280 ) ( ON ?auto_839281 ?auto_839282 ) ( CLEAR ?auto_839281 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_839270 ?auto_839271 ?auto_839272 ?auto_839273 ?auto_839274 ?auto_839275 ?auto_839276 ?auto_839277 ?auto_839278 ?auto_839279 ?auto_839280 ?auto_839281 )
      ( MAKE-13PILE ?auto_839270 ?auto_839271 ?auto_839272 ?auto_839273 ?auto_839274 ?auto_839275 ?auto_839276 ?auto_839277 ?auto_839278 ?auto_839279 ?auto_839280 ?auto_839281 ?auto_839282 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_839324 - BLOCK
      ?auto_839325 - BLOCK
      ?auto_839326 - BLOCK
      ?auto_839327 - BLOCK
      ?auto_839328 - BLOCK
      ?auto_839329 - BLOCK
      ?auto_839330 - BLOCK
      ?auto_839331 - BLOCK
      ?auto_839332 - BLOCK
      ?auto_839333 - BLOCK
      ?auto_839334 - BLOCK
      ?auto_839335 - BLOCK
      ?auto_839336 - BLOCK
    )
    :vars
    (
      ?auto_839337 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_839336 ?auto_839337 ) ( ON-TABLE ?auto_839324 ) ( ON ?auto_839325 ?auto_839324 ) ( ON ?auto_839326 ?auto_839325 ) ( ON ?auto_839327 ?auto_839326 ) ( ON ?auto_839328 ?auto_839327 ) ( ON ?auto_839329 ?auto_839328 ) ( ON ?auto_839330 ?auto_839329 ) ( ON ?auto_839331 ?auto_839330 ) ( ON ?auto_839332 ?auto_839331 ) ( ON ?auto_839333 ?auto_839332 ) ( not ( = ?auto_839324 ?auto_839325 ) ) ( not ( = ?auto_839324 ?auto_839326 ) ) ( not ( = ?auto_839324 ?auto_839327 ) ) ( not ( = ?auto_839324 ?auto_839328 ) ) ( not ( = ?auto_839324 ?auto_839329 ) ) ( not ( = ?auto_839324 ?auto_839330 ) ) ( not ( = ?auto_839324 ?auto_839331 ) ) ( not ( = ?auto_839324 ?auto_839332 ) ) ( not ( = ?auto_839324 ?auto_839333 ) ) ( not ( = ?auto_839324 ?auto_839334 ) ) ( not ( = ?auto_839324 ?auto_839335 ) ) ( not ( = ?auto_839324 ?auto_839336 ) ) ( not ( = ?auto_839324 ?auto_839337 ) ) ( not ( = ?auto_839325 ?auto_839326 ) ) ( not ( = ?auto_839325 ?auto_839327 ) ) ( not ( = ?auto_839325 ?auto_839328 ) ) ( not ( = ?auto_839325 ?auto_839329 ) ) ( not ( = ?auto_839325 ?auto_839330 ) ) ( not ( = ?auto_839325 ?auto_839331 ) ) ( not ( = ?auto_839325 ?auto_839332 ) ) ( not ( = ?auto_839325 ?auto_839333 ) ) ( not ( = ?auto_839325 ?auto_839334 ) ) ( not ( = ?auto_839325 ?auto_839335 ) ) ( not ( = ?auto_839325 ?auto_839336 ) ) ( not ( = ?auto_839325 ?auto_839337 ) ) ( not ( = ?auto_839326 ?auto_839327 ) ) ( not ( = ?auto_839326 ?auto_839328 ) ) ( not ( = ?auto_839326 ?auto_839329 ) ) ( not ( = ?auto_839326 ?auto_839330 ) ) ( not ( = ?auto_839326 ?auto_839331 ) ) ( not ( = ?auto_839326 ?auto_839332 ) ) ( not ( = ?auto_839326 ?auto_839333 ) ) ( not ( = ?auto_839326 ?auto_839334 ) ) ( not ( = ?auto_839326 ?auto_839335 ) ) ( not ( = ?auto_839326 ?auto_839336 ) ) ( not ( = ?auto_839326 ?auto_839337 ) ) ( not ( = ?auto_839327 ?auto_839328 ) ) ( not ( = ?auto_839327 ?auto_839329 ) ) ( not ( = ?auto_839327 ?auto_839330 ) ) ( not ( = ?auto_839327 ?auto_839331 ) ) ( not ( = ?auto_839327 ?auto_839332 ) ) ( not ( = ?auto_839327 ?auto_839333 ) ) ( not ( = ?auto_839327 ?auto_839334 ) ) ( not ( = ?auto_839327 ?auto_839335 ) ) ( not ( = ?auto_839327 ?auto_839336 ) ) ( not ( = ?auto_839327 ?auto_839337 ) ) ( not ( = ?auto_839328 ?auto_839329 ) ) ( not ( = ?auto_839328 ?auto_839330 ) ) ( not ( = ?auto_839328 ?auto_839331 ) ) ( not ( = ?auto_839328 ?auto_839332 ) ) ( not ( = ?auto_839328 ?auto_839333 ) ) ( not ( = ?auto_839328 ?auto_839334 ) ) ( not ( = ?auto_839328 ?auto_839335 ) ) ( not ( = ?auto_839328 ?auto_839336 ) ) ( not ( = ?auto_839328 ?auto_839337 ) ) ( not ( = ?auto_839329 ?auto_839330 ) ) ( not ( = ?auto_839329 ?auto_839331 ) ) ( not ( = ?auto_839329 ?auto_839332 ) ) ( not ( = ?auto_839329 ?auto_839333 ) ) ( not ( = ?auto_839329 ?auto_839334 ) ) ( not ( = ?auto_839329 ?auto_839335 ) ) ( not ( = ?auto_839329 ?auto_839336 ) ) ( not ( = ?auto_839329 ?auto_839337 ) ) ( not ( = ?auto_839330 ?auto_839331 ) ) ( not ( = ?auto_839330 ?auto_839332 ) ) ( not ( = ?auto_839330 ?auto_839333 ) ) ( not ( = ?auto_839330 ?auto_839334 ) ) ( not ( = ?auto_839330 ?auto_839335 ) ) ( not ( = ?auto_839330 ?auto_839336 ) ) ( not ( = ?auto_839330 ?auto_839337 ) ) ( not ( = ?auto_839331 ?auto_839332 ) ) ( not ( = ?auto_839331 ?auto_839333 ) ) ( not ( = ?auto_839331 ?auto_839334 ) ) ( not ( = ?auto_839331 ?auto_839335 ) ) ( not ( = ?auto_839331 ?auto_839336 ) ) ( not ( = ?auto_839331 ?auto_839337 ) ) ( not ( = ?auto_839332 ?auto_839333 ) ) ( not ( = ?auto_839332 ?auto_839334 ) ) ( not ( = ?auto_839332 ?auto_839335 ) ) ( not ( = ?auto_839332 ?auto_839336 ) ) ( not ( = ?auto_839332 ?auto_839337 ) ) ( not ( = ?auto_839333 ?auto_839334 ) ) ( not ( = ?auto_839333 ?auto_839335 ) ) ( not ( = ?auto_839333 ?auto_839336 ) ) ( not ( = ?auto_839333 ?auto_839337 ) ) ( not ( = ?auto_839334 ?auto_839335 ) ) ( not ( = ?auto_839334 ?auto_839336 ) ) ( not ( = ?auto_839334 ?auto_839337 ) ) ( not ( = ?auto_839335 ?auto_839336 ) ) ( not ( = ?auto_839335 ?auto_839337 ) ) ( not ( = ?auto_839336 ?auto_839337 ) ) ( ON ?auto_839335 ?auto_839336 ) ( CLEAR ?auto_839333 ) ( ON ?auto_839334 ?auto_839335 ) ( CLEAR ?auto_839334 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_839324 ?auto_839325 ?auto_839326 ?auto_839327 ?auto_839328 ?auto_839329 ?auto_839330 ?auto_839331 ?auto_839332 ?auto_839333 ?auto_839334 )
      ( MAKE-13PILE ?auto_839324 ?auto_839325 ?auto_839326 ?auto_839327 ?auto_839328 ?auto_839329 ?auto_839330 ?auto_839331 ?auto_839332 ?auto_839333 ?auto_839334 ?auto_839335 ?auto_839336 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_839378 - BLOCK
      ?auto_839379 - BLOCK
      ?auto_839380 - BLOCK
      ?auto_839381 - BLOCK
      ?auto_839382 - BLOCK
      ?auto_839383 - BLOCK
      ?auto_839384 - BLOCK
      ?auto_839385 - BLOCK
      ?auto_839386 - BLOCK
      ?auto_839387 - BLOCK
      ?auto_839388 - BLOCK
      ?auto_839389 - BLOCK
      ?auto_839390 - BLOCK
    )
    :vars
    (
      ?auto_839391 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_839390 ?auto_839391 ) ( ON-TABLE ?auto_839378 ) ( ON ?auto_839379 ?auto_839378 ) ( ON ?auto_839380 ?auto_839379 ) ( ON ?auto_839381 ?auto_839380 ) ( ON ?auto_839382 ?auto_839381 ) ( ON ?auto_839383 ?auto_839382 ) ( ON ?auto_839384 ?auto_839383 ) ( ON ?auto_839385 ?auto_839384 ) ( ON ?auto_839386 ?auto_839385 ) ( not ( = ?auto_839378 ?auto_839379 ) ) ( not ( = ?auto_839378 ?auto_839380 ) ) ( not ( = ?auto_839378 ?auto_839381 ) ) ( not ( = ?auto_839378 ?auto_839382 ) ) ( not ( = ?auto_839378 ?auto_839383 ) ) ( not ( = ?auto_839378 ?auto_839384 ) ) ( not ( = ?auto_839378 ?auto_839385 ) ) ( not ( = ?auto_839378 ?auto_839386 ) ) ( not ( = ?auto_839378 ?auto_839387 ) ) ( not ( = ?auto_839378 ?auto_839388 ) ) ( not ( = ?auto_839378 ?auto_839389 ) ) ( not ( = ?auto_839378 ?auto_839390 ) ) ( not ( = ?auto_839378 ?auto_839391 ) ) ( not ( = ?auto_839379 ?auto_839380 ) ) ( not ( = ?auto_839379 ?auto_839381 ) ) ( not ( = ?auto_839379 ?auto_839382 ) ) ( not ( = ?auto_839379 ?auto_839383 ) ) ( not ( = ?auto_839379 ?auto_839384 ) ) ( not ( = ?auto_839379 ?auto_839385 ) ) ( not ( = ?auto_839379 ?auto_839386 ) ) ( not ( = ?auto_839379 ?auto_839387 ) ) ( not ( = ?auto_839379 ?auto_839388 ) ) ( not ( = ?auto_839379 ?auto_839389 ) ) ( not ( = ?auto_839379 ?auto_839390 ) ) ( not ( = ?auto_839379 ?auto_839391 ) ) ( not ( = ?auto_839380 ?auto_839381 ) ) ( not ( = ?auto_839380 ?auto_839382 ) ) ( not ( = ?auto_839380 ?auto_839383 ) ) ( not ( = ?auto_839380 ?auto_839384 ) ) ( not ( = ?auto_839380 ?auto_839385 ) ) ( not ( = ?auto_839380 ?auto_839386 ) ) ( not ( = ?auto_839380 ?auto_839387 ) ) ( not ( = ?auto_839380 ?auto_839388 ) ) ( not ( = ?auto_839380 ?auto_839389 ) ) ( not ( = ?auto_839380 ?auto_839390 ) ) ( not ( = ?auto_839380 ?auto_839391 ) ) ( not ( = ?auto_839381 ?auto_839382 ) ) ( not ( = ?auto_839381 ?auto_839383 ) ) ( not ( = ?auto_839381 ?auto_839384 ) ) ( not ( = ?auto_839381 ?auto_839385 ) ) ( not ( = ?auto_839381 ?auto_839386 ) ) ( not ( = ?auto_839381 ?auto_839387 ) ) ( not ( = ?auto_839381 ?auto_839388 ) ) ( not ( = ?auto_839381 ?auto_839389 ) ) ( not ( = ?auto_839381 ?auto_839390 ) ) ( not ( = ?auto_839381 ?auto_839391 ) ) ( not ( = ?auto_839382 ?auto_839383 ) ) ( not ( = ?auto_839382 ?auto_839384 ) ) ( not ( = ?auto_839382 ?auto_839385 ) ) ( not ( = ?auto_839382 ?auto_839386 ) ) ( not ( = ?auto_839382 ?auto_839387 ) ) ( not ( = ?auto_839382 ?auto_839388 ) ) ( not ( = ?auto_839382 ?auto_839389 ) ) ( not ( = ?auto_839382 ?auto_839390 ) ) ( not ( = ?auto_839382 ?auto_839391 ) ) ( not ( = ?auto_839383 ?auto_839384 ) ) ( not ( = ?auto_839383 ?auto_839385 ) ) ( not ( = ?auto_839383 ?auto_839386 ) ) ( not ( = ?auto_839383 ?auto_839387 ) ) ( not ( = ?auto_839383 ?auto_839388 ) ) ( not ( = ?auto_839383 ?auto_839389 ) ) ( not ( = ?auto_839383 ?auto_839390 ) ) ( not ( = ?auto_839383 ?auto_839391 ) ) ( not ( = ?auto_839384 ?auto_839385 ) ) ( not ( = ?auto_839384 ?auto_839386 ) ) ( not ( = ?auto_839384 ?auto_839387 ) ) ( not ( = ?auto_839384 ?auto_839388 ) ) ( not ( = ?auto_839384 ?auto_839389 ) ) ( not ( = ?auto_839384 ?auto_839390 ) ) ( not ( = ?auto_839384 ?auto_839391 ) ) ( not ( = ?auto_839385 ?auto_839386 ) ) ( not ( = ?auto_839385 ?auto_839387 ) ) ( not ( = ?auto_839385 ?auto_839388 ) ) ( not ( = ?auto_839385 ?auto_839389 ) ) ( not ( = ?auto_839385 ?auto_839390 ) ) ( not ( = ?auto_839385 ?auto_839391 ) ) ( not ( = ?auto_839386 ?auto_839387 ) ) ( not ( = ?auto_839386 ?auto_839388 ) ) ( not ( = ?auto_839386 ?auto_839389 ) ) ( not ( = ?auto_839386 ?auto_839390 ) ) ( not ( = ?auto_839386 ?auto_839391 ) ) ( not ( = ?auto_839387 ?auto_839388 ) ) ( not ( = ?auto_839387 ?auto_839389 ) ) ( not ( = ?auto_839387 ?auto_839390 ) ) ( not ( = ?auto_839387 ?auto_839391 ) ) ( not ( = ?auto_839388 ?auto_839389 ) ) ( not ( = ?auto_839388 ?auto_839390 ) ) ( not ( = ?auto_839388 ?auto_839391 ) ) ( not ( = ?auto_839389 ?auto_839390 ) ) ( not ( = ?auto_839389 ?auto_839391 ) ) ( not ( = ?auto_839390 ?auto_839391 ) ) ( ON ?auto_839389 ?auto_839390 ) ( ON ?auto_839388 ?auto_839389 ) ( CLEAR ?auto_839386 ) ( ON ?auto_839387 ?auto_839388 ) ( CLEAR ?auto_839387 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_839378 ?auto_839379 ?auto_839380 ?auto_839381 ?auto_839382 ?auto_839383 ?auto_839384 ?auto_839385 ?auto_839386 ?auto_839387 )
      ( MAKE-13PILE ?auto_839378 ?auto_839379 ?auto_839380 ?auto_839381 ?auto_839382 ?auto_839383 ?auto_839384 ?auto_839385 ?auto_839386 ?auto_839387 ?auto_839388 ?auto_839389 ?auto_839390 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_839432 - BLOCK
      ?auto_839433 - BLOCK
      ?auto_839434 - BLOCK
      ?auto_839435 - BLOCK
      ?auto_839436 - BLOCK
      ?auto_839437 - BLOCK
      ?auto_839438 - BLOCK
      ?auto_839439 - BLOCK
      ?auto_839440 - BLOCK
      ?auto_839441 - BLOCK
      ?auto_839442 - BLOCK
      ?auto_839443 - BLOCK
      ?auto_839444 - BLOCK
    )
    :vars
    (
      ?auto_839445 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_839444 ?auto_839445 ) ( ON-TABLE ?auto_839432 ) ( ON ?auto_839433 ?auto_839432 ) ( ON ?auto_839434 ?auto_839433 ) ( ON ?auto_839435 ?auto_839434 ) ( ON ?auto_839436 ?auto_839435 ) ( ON ?auto_839437 ?auto_839436 ) ( ON ?auto_839438 ?auto_839437 ) ( ON ?auto_839439 ?auto_839438 ) ( not ( = ?auto_839432 ?auto_839433 ) ) ( not ( = ?auto_839432 ?auto_839434 ) ) ( not ( = ?auto_839432 ?auto_839435 ) ) ( not ( = ?auto_839432 ?auto_839436 ) ) ( not ( = ?auto_839432 ?auto_839437 ) ) ( not ( = ?auto_839432 ?auto_839438 ) ) ( not ( = ?auto_839432 ?auto_839439 ) ) ( not ( = ?auto_839432 ?auto_839440 ) ) ( not ( = ?auto_839432 ?auto_839441 ) ) ( not ( = ?auto_839432 ?auto_839442 ) ) ( not ( = ?auto_839432 ?auto_839443 ) ) ( not ( = ?auto_839432 ?auto_839444 ) ) ( not ( = ?auto_839432 ?auto_839445 ) ) ( not ( = ?auto_839433 ?auto_839434 ) ) ( not ( = ?auto_839433 ?auto_839435 ) ) ( not ( = ?auto_839433 ?auto_839436 ) ) ( not ( = ?auto_839433 ?auto_839437 ) ) ( not ( = ?auto_839433 ?auto_839438 ) ) ( not ( = ?auto_839433 ?auto_839439 ) ) ( not ( = ?auto_839433 ?auto_839440 ) ) ( not ( = ?auto_839433 ?auto_839441 ) ) ( not ( = ?auto_839433 ?auto_839442 ) ) ( not ( = ?auto_839433 ?auto_839443 ) ) ( not ( = ?auto_839433 ?auto_839444 ) ) ( not ( = ?auto_839433 ?auto_839445 ) ) ( not ( = ?auto_839434 ?auto_839435 ) ) ( not ( = ?auto_839434 ?auto_839436 ) ) ( not ( = ?auto_839434 ?auto_839437 ) ) ( not ( = ?auto_839434 ?auto_839438 ) ) ( not ( = ?auto_839434 ?auto_839439 ) ) ( not ( = ?auto_839434 ?auto_839440 ) ) ( not ( = ?auto_839434 ?auto_839441 ) ) ( not ( = ?auto_839434 ?auto_839442 ) ) ( not ( = ?auto_839434 ?auto_839443 ) ) ( not ( = ?auto_839434 ?auto_839444 ) ) ( not ( = ?auto_839434 ?auto_839445 ) ) ( not ( = ?auto_839435 ?auto_839436 ) ) ( not ( = ?auto_839435 ?auto_839437 ) ) ( not ( = ?auto_839435 ?auto_839438 ) ) ( not ( = ?auto_839435 ?auto_839439 ) ) ( not ( = ?auto_839435 ?auto_839440 ) ) ( not ( = ?auto_839435 ?auto_839441 ) ) ( not ( = ?auto_839435 ?auto_839442 ) ) ( not ( = ?auto_839435 ?auto_839443 ) ) ( not ( = ?auto_839435 ?auto_839444 ) ) ( not ( = ?auto_839435 ?auto_839445 ) ) ( not ( = ?auto_839436 ?auto_839437 ) ) ( not ( = ?auto_839436 ?auto_839438 ) ) ( not ( = ?auto_839436 ?auto_839439 ) ) ( not ( = ?auto_839436 ?auto_839440 ) ) ( not ( = ?auto_839436 ?auto_839441 ) ) ( not ( = ?auto_839436 ?auto_839442 ) ) ( not ( = ?auto_839436 ?auto_839443 ) ) ( not ( = ?auto_839436 ?auto_839444 ) ) ( not ( = ?auto_839436 ?auto_839445 ) ) ( not ( = ?auto_839437 ?auto_839438 ) ) ( not ( = ?auto_839437 ?auto_839439 ) ) ( not ( = ?auto_839437 ?auto_839440 ) ) ( not ( = ?auto_839437 ?auto_839441 ) ) ( not ( = ?auto_839437 ?auto_839442 ) ) ( not ( = ?auto_839437 ?auto_839443 ) ) ( not ( = ?auto_839437 ?auto_839444 ) ) ( not ( = ?auto_839437 ?auto_839445 ) ) ( not ( = ?auto_839438 ?auto_839439 ) ) ( not ( = ?auto_839438 ?auto_839440 ) ) ( not ( = ?auto_839438 ?auto_839441 ) ) ( not ( = ?auto_839438 ?auto_839442 ) ) ( not ( = ?auto_839438 ?auto_839443 ) ) ( not ( = ?auto_839438 ?auto_839444 ) ) ( not ( = ?auto_839438 ?auto_839445 ) ) ( not ( = ?auto_839439 ?auto_839440 ) ) ( not ( = ?auto_839439 ?auto_839441 ) ) ( not ( = ?auto_839439 ?auto_839442 ) ) ( not ( = ?auto_839439 ?auto_839443 ) ) ( not ( = ?auto_839439 ?auto_839444 ) ) ( not ( = ?auto_839439 ?auto_839445 ) ) ( not ( = ?auto_839440 ?auto_839441 ) ) ( not ( = ?auto_839440 ?auto_839442 ) ) ( not ( = ?auto_839440 ?auto_839443 ) ) ( not ( = ?auto_839440 ?auto_839444 ) ) ( not ( = ?auto_839440 ?auto_839445 ) ) ( not ( = ?auto_839441 ?auto_839442 ) ) ( not ( = ?auto_839441 ?auto_839443 ) ) ( not ( = ?auto_839441 ?auto_839444 ) ) ( not ( = ?auto_839441 ?auto_839445 ) ) ( not ( = ?auto_839442 ?auto_839443 ) ) ( not ( = ?auto_839442 ?auto_839444 ) ) ( not ( = ?auto_839442 ?auto_839445 ) ) ( not ( = ?auto_839443 ?auto_839444 ) ) ( not ( = ?auto_839443 ?auto_839445 ) ) ( not ( = ?auto_839444 ?auto_839445 ) ) ( ON ?auto_839443 ?auto_839444 ) ( ON ?auto_839442 ?auto_839443 ) ( ON ?auto_839441 ?auto_839442 ) ( CLEAR ?auto_839439 ) ( ON ?auto_839440 ?auto_839441 ) ( CLEAR ?auto_839440 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_839432 ?auto_839433 ?auto_839434 ?auto_839435 ?auto_839436 ?auto_839437 ?auto_839438 ?auto_839439 ?auto_839440 )
      ( MAKE-13PILE ?auto_839432 ?auto_839433 ?auto_839434 ?auto_839435 ?auto_839436 ?auto_839437 ?auto_839438 ?auto_839439 ?auto_839440 ?auto_839441 ?auto_839442 ?auto_839443 ?auto_839444 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_839486 - BLOCK
      ?auto_839487 - BLOCK
      ?auto_839488 - BLOCK
      ?auto_839489 - BLOCK
      ?auto_839490 - BLOCK
      ?auto_839491 - BLOCK
      ?auto_839492 - BLOCK
      ?auto_839493 - BLOCK
      ?auto_839494 - BLOCK
      ?auto_839495 - BLOCK
      ?auto_839496 - BLOCK
      ?auto_839497 - BLOCK
      ?auto_839498 - BLOCK
    )
    :vars
    (
      ?auto_839499 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_839498 ?auto_839499 ) ( ON-TABLE ?auto_839486 ) ( ON ?auto_839487 ?auto_839486 ) ( ON ?auto_839488 ?auto_839487 ) ( ON ?auto_839489 ?auto_839488 ) ( ON ?auto_839490 ?auto_839489 ) ( ON ?auto_839491 ?auto_839490 ) ( ON ?auto_839492 ?auto_839491 ) ( not ( = ?auto_839486 ?auto_839487 ) ) ( not ( = ?auto_839486 ?auto_839488 ) ) ( not ( = ?auto_839486 ?auto_839489 ) ) ( not ( = ?auto_839486 ?auto_839490 ) ) ( not ( = ?auto_839486 ?auto_839491 ) ) ( not ( = ?auto_839486 ?auto_839492 ) ) ( not ( = ?auto_839486 ?auto_839493 ) ) ( not ( = ?auto_839486 ?auto_839494 ) ) ( not ( = ?auto_839486 ?auto_839495 ) ) ( not ( = ?auto_839486 ?auto_839496 ) ) ( not ( = ?auto_839486 ?auto_839497 ) ) ( not ( = ?auto_839486 ?auto_839498 ) ) ( not ( = ?auto_839486 ?auto_839499 ) ) ( not ( = ?auto_839487 ?auto_839488 ) ) ( not ( = ?auto_839487 ?auto_839489 ) ) ( not ( = ?auto_839487 ?auto_839490 ) ) ( not ( = ?auto_839487 ?auto_839491 ) ) ( not ( = ?auto_839487 ?auto_839492 ) ) ( not ( = ?auto_839487 ?auto_839493 ) ) ( not ( = ?auto_839487 ?auto_839494 ) ) ( not ( = ?auto_839487 ?auto_839495 ) ) ( not ( = ?auto_839487 ?auto_839496 ) ) ( not ( = ?auto_839487 ?auto_839497 ) ) ( not ( = ?auto_839487 ?auto_839498 ) ) ( not ( = ?auto_839487 ?auto_839499 ) ) ( not ( = ?auto_839488 ?auto_839489 ) ) ( not ( = ?auto_839488 ?auto_839490 ) ) ( not ( = ?auto_839488 ?auto_839491 ) ) ( not ( = ?auto_839488 ?auto_839492 ) ) ( not ( = ?auto_839488 ?auto_839493 ) ) ( not ( = ?auto_839488 ?auto_839494 ) ) ( not ( = ?auto_839488 ?auto_839495 ) ) ( not ( = ?auto_839488 ?auto_839496 ) ) ( not ( = ?auto_839488 ?auto_839497 ) ) ( not ( = ?auto_839488 ?auto_839498 ) ) ( not ( = ?auto_839488 ?auto_839499 ) ) ( not ( = ?auto_839489 ?auto_839490 ) ) ( not ( = ?auto_839489 ?auto_839491 ) ) ( not ( = ?auto_839489 ?auto_839492 ) ) ( not ( = ?auto_839489 ?auto_839493 ) ) ( not ( = ?auto_839489 ?auto_839494 ) ) ( not ( = ?auto_839489 ?auto_839495 ) ) ( not ( = ?auto_839489 ?auto_839496 ) ) ( not ( = ?auto_839489 ?auto_839497 ) ) ( not ( = ?auto_839489 ?auto_839498 ) ) ( not ( = ?auto_839489 ?auto_839499 ) ) ( not ( = ?auto_839490 ?auto_839491 ) ) ( not ( = ?auto_839490 ?auto_839492 ) ) ( not ( = ?auto_839490 ?auto_839493 ) ) ( not ( = ?auto_839490 ?auto_839494 ) ) ( not ( = ?auto_839490 ?auto_839495 ) ) ( not ( = ?auto_839490 ?auto_839496 ) ) ( not ( = ?auto_839490 ?auto_839497 ) ) ( not ( = ?auto_839490 ?auto_839498 ) ) ( not ( = ?auto_839490 ?auto_839499 ) ) ( not ( = ?auto_839491 ?auto_839492 ) ) ( not ( = ?auto_839491 ?auto_839493 ) ) ( not ( = ?auto_839491 ?auto_839494 ) ) ( not ( = ?auto_839491 ?auto_839495 ) ) ( not ( = ?auto_839491 ?auto_839496 ) ) ( not ( = ?auto_839491 ?auto_839497 ) ) ( not ( = ?auto_839491 ?auto_839498 ) ) ( not ( = ?auto_839491 ?auto_839499 ) ) ( not ( = ?auto_839492 ?auto_839493 ) ) ( not ( = ?auto_839492 ?auto_839494 ) ) ( not ( = ?auto_839492 ?auto_839495 ) ) ( not ( = ?auto_839492 ?auto_839496 ) ) ( not ( = ?auto_839492 ?auto_839497 ) ) ( not ( = ?auto_839492 ?auto_839498 ) ) ( not ( = ?auto_839492 ?auto_839499 ) ) ( not ( = ?auto_839493 ?auto_839494 ) ) ( not ( = ?auto_839493 ?auto_839495 ) ) ( not ( = ?auto_839493 ?auto_839496 ) ) ( not ( = ?auto_839493 ?auto_839497 ) ) ( not ( = ?auto_839493 ?auto_839498 ) ) ( not ( = ?auto_839493 ?auto_839499 ) ) ( not ( = ?auto_839494 ?auto_839495 ) ) ( not ( = ?auto_839494 ?auto_839496 ) ) ( not ( = ?auto_839494 ?auto_839497 ) ) ( not ( = ?auto_839494 ?auto_839498 ) ) ( not ( = ?auto_839494 ?auto_839499 ) ) ( not ( = ?auto_839495 ?auto_839496 ) ) ( not ( = ?auto_839495 ?auto_839497 ) ) ( not ( = ?auto_839495 ?auto_839498 ) ) ( not ( = ?auto_839495 ?auto_839499 ) ) ( not ( = ?auto_839496 ?auto_839497 ) ) ( not ( = ?auto_839496 ?auto_839498 ) ) ( not ( = ?auto_839496 ?auto_839499 ) ) ( not ( = ?auto_839497 ?auto_839498 ) ) ( not ( = ?auto_839497 ?auto_839499 ) ) ( not ( = ?auto_839498 ?auto_839499 ) ) ( ON ?auto_839497 ?auto_839498 ) ( ON ?auto_839496 ?auto_839497 ) ( ON ?auto_839495 ?auto_839496 ) ( ON ?auto_839494 ?auto_839495 ) ( CLEAR ?auto_839492 ) ( ON ?auto_839493 ?auto_839494 ) ( CLEAR ?auto_839493 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_839486 ?auto_839487 ?auto_839488 ?auto_839489 ?auto_839490 ?auto_839491 ?auto_839492 ?auto_839493 )
      ( MAKE-13PILE ?auto_839486 ?auto_839487 ?auto_839488 ?auto_839489 ?auto_839490 ?auto_839491 ?auto_839492 ?auto_839493 ?auto_839494 ?auto_839495 ?auto_839496 ?auto_839497 ?auto_839498 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_839540 - BLOCK
      ?auto_839541 - BLOCK
      ?auto_839542 - BLOCK
      ?auto_839543 - BLOCK
      ?auto_839544 - BLOCK
      ?auto_839545 - BLOCK
      ?auto_839546 - BLOCK
      ?auto_839547 - BLOCK
      ?auto_839548 - BLOCK
      ?auto_839549 - BLOCK
      ?auto_839550 - BLOCK
      ?auto_839551 - BLOCK
      ?auto_839552 - BLOCK
    )
    :vars
    (
      ?auto_839553 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_839552 ?auto_839553 ) ( ON-TABLE ?auto_839540 ) ( ON ?auto_839541 ?auto_839540 ) ( ON ?auto_839542 ?auto_839541 ) ( ON ?auto_839543 ?auto_839542 ) ( ON ?auto_839544 ?auto_839543 ) ( ON ?auto_839545 ?auto_839544 ) ( not ( = ?auto_839540 ?auto_839541 ) ) ( not ( = ?auto_839540 ?auto_839542 ) ) ( not ( = ?auto_839540 ?auto_839543 ) ) ( not ( = ?auto_839540 ?auto_839544 ) ) ( not ( = ?auto_839540 ?auto_839545 ) ) ( not ( = ?auto_839540 ?auto_839546 ) ) ( not ( = ?auto_839540 ?auto_839547 ) ) ( not ( = ?auto_839540 ?auto_839548 ) ) ( not ( = ?auto_839540 ?auto_839549 ) ) ( not ( = ?auto_839540 ?auto_839550 ) ) ( not ( = ?auto_839540 ?auto_839551 ) ) ( not ( = ?auto_839540 ?auto_839552 ) ) ( not ( = ?auto_839540 ?auto_839553 ) ) ( not ( = ?auto_839541 ?auto_839542 ) ) ( not ( = ?auto_839541 ?auto_839543 ) ) ( not ( = ?auto_839541 ?auto_839544 ) ) ( not ( = ?auto_839541 ?auto_839545 ) ) ( not ( = ?auto_839541 ?auto_839546 ) ) ( not ( = ?auto_839541 ?auto_839547 ) ) ( not ( = ?auto_839541 ?auto_839548 ) ) ( not ( = ?auto_839541 ?auto_839549 ) ) ( not ( = ?auto_839541 ?auto_839550 ) ) ( not ( = ?auto_839541 ?auto_839551 ) ) ( not ( = ?auto_839541 ?auto_839552 ) ) ( not ( = ?auto_839541 ?auto_839553 ) ) ( not ( = ?auto_839542 ?auto_839543 ) ) ( not ( = ?auto_839542 ?auto_839544 ) ) ( not ( = ?auto_839542 ?auto_839545 ) ) ( not ( = ?auto_839542 ?auto_839546 ) ) ( not ( = ?auto_839542 ?auto_839547 ) ) ( not ( = ?auto_839542 ?auto_839548 ) ) ( not ( = ?auto_839542 ?auto_839549 ) ) ( not ( = ?auto_839542 ?auto_839550 ) ) ( not ( = ?auto_839542 ?auto_839551 ) ) ( not ( = ?auto_839542 ?auto_839552 ) ) ( not ( = ?auto_839542 ?auto_839553 ) ) ( not ( = ?auto_839543 ?auto_839544 ) ) ( not ( = ?auto_839543 ?auto_839545 ) ) ( not ( = ?auto_839543 ?auto_839546 ) ) ( not ( = ?auto_839543 ?auto_839547 ) ) ( not ( = ?auto_839543 ?auto_839548 ) ) ( not ( = ?auto_839543 ?auto_839549 ) ) ( not ( = ?auto_839543 ?auto_839550 ) ) ( not ( = ?auto_839543 ?auto_839551 ) ) ( not ( = ?auto_839543 ?auto_839552 ) ) ( not ( = ?auto_839543 ?auto_839553 ) ) ( not ( = ?auto_839544 ?auto_839545 ) ) ( not ( = ?auto_839544 ?auto_839546 ) ) ( not ( = ?auto_839544 ?auto_839547 ) ) ( not ( = ?auto_839544 ?auto_839548 ) ) ( not ( = ?auto_839544 ?auto_839549 ) ) ( not ( = ?auto_839544 ?auto_839550 ) ) ( not ( = ?auto_839544 ?auto_839551 ) ) ( not ( = ?auto_839544 ?auto_839552 ) ) ( not ( = ?auto_839544 ?auto_839553 ) ) ( not ( = ?auto_839545 ?auto_839546 ) ) ( not ( = ?auto_839545 ?auto_839547 ) ) ( not ( = ?auto_839545 ?auto_839548 ) ) ( not ( = ?auto_839545 ?auto_839549 ) ) ( not ( = ?auto_839545 ?auto_839550 ) ) ( not ( = ?auto_839545 ?auto_839551 ) ) ( not ( = ?auto_839545 ?auto_839552 ) ) ( not ( = ?auto_839545 ?auto_839553 ) ) ( not ( = ?auto_839546 ?auto_839547 ) ) ( not ( = ?auto_839546 ?auto_839548 ) ) ( not ( = ?auto_839546 ?auto_839549 ) ) ( not ( = ?auto_839546 ?auto_839550 ) ) ( not ( = ?auto_839546 ?auto_839551 ) ) ( not ( = ?auto_839546 ?auto_839552 ) ) ( not ( = ?auto_839546 ?auto_839553 ) ) ( not ( = ?auto_839547 ?auto_839548 ) ) ( not ( = ?auto_839547 ?auto_839549 ) ) ( not ( = ?auto_839547 ?auto_839550 ) ) ( not ( = ?auto_839547 ?auto_839551 ) ) ( not ( = ?auto_839547 ?auto_839552 ) ) ( not ( = ?auto_839547 ?auto_839553 ) ) ( not ( = ?auto_839548 ?auto_839549 ) ) ( not ( = ?auto_839548 ?auto_839550 ) ) ( not ( = ?auto_839548 ?auto_839551 ) ) ( not ( = ?auto_839548 ?auto_839552 ) ) ( not ( = ?auto_839548 ?auto_839553 ) ) ( not ( = ?auto_839549 ?auto_839550 ) ) ( not ( = ?auto_839549 ?auto_839551 ) ) ( not ( = ?auto_839549 ?auto_839552 ) ) ( not ( = ?auto_839549 ?auto_839553 ) ) ( not ( = ?auto_839550 ?auto_839551 ) ) ( not ( = ?auto_839550 ?auto_839552 ) ) ( not ( = ?auto_839550 ?auto_839553 ) ) ( not ( = ?auto_839551 ?auto_839552 ) ) ( not ( = ?auto_839551 ?auto_839553 ) ) ( not ( = ?auto_839552 ?auto_839553 ) ) ( ON ?auto_839551 ?auto_839552 ) ( ON ?auto_839550 ?auto_839551 ) ( ON ?auto_839549 ?auto_839550 ) ( ON ?auto_839548 ?auto_839549 ) ( ON ?auto_839547 ?auto_839548 ) ( CLEAR ?auto_839545 ) ( ON ?auto_839546 ?auto_839547 ) ( CLEAR ?auto_839546 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_839540 ?auto_839541 ?auto_839542 ?auto_839543 ?auto_839544 ?auto_839545 ?auto_839546 )
      ( MAKE-13PILE ?auto_839540 ?auto_839541 ?auto_839542 ?auto_839543 ?auto_839544 ?auto_839545 ?auto_839546 ?auto_839547 ?auto_839548 ?auto_839549 ?auto_839550 ?auto_839551 ?auto_839552 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_839594 - BLOCK
      ?auto_839595 - BLOCK
      ?auto_839596 - BLOCK
      ?auto_839597 - BLOCK
      ?auto_839598 - BLOCK
      ?auto_839599 - BLOCK
      ?auto_839600 - BLOCK
      ?auto_839601 - BLOCK
      ?auto_839602 - BLOCK
      ?auto_839603 - BLOCK
      ?auto_839604 - BLOCK
      ?auto_839605 - BLOCK
      ?auto_839606 - BLOCK
    )
    :vars
    (
      ?auto_839607 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_839606 ?auto_839607 ) ( ON-TABLE ?auto_839594 ) ( ON ?auto_839595 ?auto_839594 ) ( ON ?auto_839596 ?auto_839595 ) ( ON ?auto_839597 ?auto_839596 ) ( ON ?auto_839598 ?auto_839597 ) ( not ( = ?auto_839594 ?auto_839595 ) ) ( not ( = ?auto_839594 ?auto_839596 ) ) ( not ( = ?auto_839594 ?auto_839597 ) ) ( not ( = ?auto_839594 ?auto_839598 ) ) ( not ( = ?auto_839594 ?auto_839599 ) ) ( not ( = ?auto_839594 ?auto_839600 ) ) ( not ( = ?auto_839594 ?auto_839601 ) ) ( not ( = ?auto_839594 ?auto_839602 ) ) ( not ( = ?auto_839594 ?auto_839603 ) ) ( not ( = ?auto_839594 ?auto_839604 ) ) ( not ( = ?auto_839594 ?auto_839605 ) ) ( not ( = ?auto_839594 ?auto_839606 ) ) ( not ( = ?auto_839594 ?auto_839607 ) ) ( not ( = ?auto_839595 ?auto_839596 ) ) ( not ( = ?auto_839595 ?auto_839597 ) ) ( not ( = ?auto_839595 ?auto_839598 ) ) ( not ( = ?auto_839595 ?auto_839599 ) ) ( not ( = ?auto_839595 ?auto_839600 ) ) ( not ( = ?auto_839595 ?auto_839601 ) ) ( not ( = ?auto_839595 ?auto_839602 ) ) ( not ( = ?auto_839595 ?auto_839603 ) ) ( not ( = ?auto_839595 ?auto_839604 ) ) ( not ( = ?auto_839595 ?auto_839605 ) ) ( not ( = ?auto_839595 ?auto_839606 ) ) ( not ( = ?auto_839595 ?auto_839607 ) ) ( not ( = ?auto_839596 ?auto_839597 ) ) ( not ( = ?auto_839596 ?auto_839598 ) ) ( not ( = ?auto_839596 ?auto_839599 ) ) ( not ( = ?auto_839596 ?auto_839600 ) ) ( not ( = ?auto_839596 ?auto_839601 ) ) ( not ( = ?auto_839596 ?auto_839602 ) ) ( not ( = ?auto_839596 ?auto_839603 ) ) ( not ( = ?auto_839596 ?auto_839604 ) ) ( not ( = ?auto_839596 ?auto_839605 ) ) ( not ( = ?auto_839596 ?auto_839606 ) ) ( not ( = ?auto_839596 ?auto_839607 ) ) ( not ( = ?auto_839597 ?auto_839598 ) ) ( not ( = ?auto_839597 ?auto_839599 ) ) ( not ( = ?auto_839597 ?auto_839600 ) ) ( not ( = ?auto_839597 ?auto_839601 ) ) ( not ( = ?auto_839597 ?auto_839602 ) ) ( not ( = ?auto_839597 ?auto_839603 ) ) ( not ( = ?auto_839597 ?auto_839604 ) ) ( not ( = ?auto_839597 ?auto_839605 ) ) ( not ( = ?auto_839597 ?auto_839606 ) ) ( not ( = ?auto_839597 ?auto_839607 ) ) ( not ( = ?auto_839598 ?auto_839599 ) ) ( not ( = ?auto_839598 ?auto_839600 ) ) ( not ( = ?auto_839598 ?auto_839601 ) ) ( not ( = ?auto_839598 ?auto_839602 ) ) ( not ( = ?auto_839598 ?auto_839603 ) ) ( not ( = ?auto_839598 ?auto_839604 ) ) ( not ( = ?auto_839598 ?auto_839605 ) ) ( not ( = ?auto_839598 ?auto_839606 ) ) ( not ( = ?auto_839598 ?auto_839607 ) ) ( not ( = ?auto_839599 ?auto_839600 ) ) ( not ( = ?auto_839599 ?auto_839601 ) ) ( not ( = ?auto_839599 ?auto_839602 ) ) ( not ( = ?auto_839599 ?auto_839603 ) ) ( not ( = ?auto_839599 ?auto_839604 ) ) ( not ( = ?auto_839599 ?auto_839605 ) ) ( not ( = ?auto_839599 ?auto_839606 ) ) ( not ( = ?auto_839599 ?auto_839607 ) ) ( not ( = ?auto_839600 ?auto_839601 ) ) ( not ( = ?auto_839600 ?auto_839602 ) ) ( not ( = ?auto_839600 ?auto_839603 ) ) ( not ( = ?auto_839600 ?auto_839604 ) ) ( not ( = ?auto_839600 ?auto_839605 ) ) ( not ( = ?auto_839600 ?auto_839606 ) ) ( not ( = ?auto_839600 ?auto_839607 ) ) ( not ( = ?auto_839601 ?auto_839602 ) ) ( not ( = ?auto_839601 ?auto_839603 ) ) ( not ( = ?auto_839601 ?auto_839604 ) ) ( not ( = ?auto_839601 ?auto_839605 ) ) ( not ( = ?auto_839601 ?auto_839606 ) ) ( not ( = ?auto_839601 ?auto_839607 ) ) ( not ( = ?auto_839602 ?auto_839603 ) ) ( not ( = ?auto_839602 ?auto_839604 ) ) ( not ( = ?auto_839602 ?auto_839605 ) ) ( not ( = ?auto_839602 ?auto_839606 ) ) ( not ( = ?auto_839602 ?auto_839607 ) ) ( not ( = ?auto_839603 ?auto_839604 ) ) ( not ( = ?auto_839603 ?auto_839605 ) ) ( not ( = ?auto_839603 ?auto_839606 ) ) ( not ( = ?auto_839603 ?auto_839607 ) ) ( not ( = ?auto_839604 ?auto_839605 ) ) ( not ( = ?auto_839604 ?auto_839606 ) ) ( not ( = ?auto_839604 ?auto_839607 ) ) ( not ( = ?auto_839605 ?auto_839606 ) ) ( not ( = ?auto_839605 ?auto_839607 ) ) ( not ( = ?auto_839606 ?auto_839607 ) ) ( ON ?auto_839605 ?auto_839606 ) ( ON ?auto_839604 ?auto_839605 ) ( ON ?auto_839603 ?auto_839604 ) ( ON ?auto_839602 ?auto_839603 ) ( ON ?auto_839601 ?auto_839602 ) ( ON ?auto_839600 ?auto_839601 ) ( CLEAR ?auto_839598 ) ( ON ?auto_839599 ?auto_839600 ) ( CLEAR ?auto_839599 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_839594 ?auto_839595 ?auto_839596 ?auto_839597 ?auto_839598 ?auto_839599 )
      ( MAKE-13PILE ?auto_839594 ?auto_839595 ?auto_839596 ?auto_839597 ?auto_839598 ?auto_839599 ?auto_839600 ?auto_839601 ?auto_839602 ?auto_839603 ?auto_839604 ?auto_839605 ?auto_839606 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_839648 - BLOCK
      ?auto_839649 - BLOCK
      ?auto_839650 - BLOCK
      ?auto_839651 - BLOCK
      ?auto_839652 - BLOCK
      ?auto_839653 - BLOCK
      ?auto_839654 - BLOCK
      ?auto_839655 - BLOCK
      ?auto_839656 - BLOCK
      ?auto_839657 - BLOCK
      ?auto_839658 - BLOCK
      ?auto_839659 - BLOCK
      ?auto_839660 - BLOCK
    )
    :vars
    (
      ?auto_839661 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_839660 ?auto_839661 ) ( ON-TABLE ?auto_839648 ) ( ON ?auto_839649 ?auto_839648 ) ( ON ?auto_839650 ?auto_839649 ) ( ON ?auto_839651 ?auto_839650 ) ( not ( = ?auto_839648 ?auto_839649 ) ) ( not ( = ?auto_839648 ?auto_839650 ) ) ( not ( = ?auto_839648 ?auto_839651 ) ) ( not ( = ?auto_839648 ?auto_839652 ) ) ( not ( = ?auto_839648 ?auto_839653 ) ) ( not ( = ?auto_839648 ?auto_839654 ) ) ( not ( = ?auto_839648 ?auto_839655 ) ) ( not ( = ?auto_839648 ?auto_839656 ) ) ( not ( = ?auto_839648 ?auto_839657 ) ) ( not ( = ?auto_839648 ?auto_839658 ) ) ( not ( = ?auto_839648 ?auto_839659 ) ) ( not ( = ?auto_839648 ?auto_839660 ) ) ( not ( = ?auto_839648 ?auto_839661 ) ) ( not ( = ?auto_839649 ?auto_839650 ) ) ( not ( = ?auto_839649 ?auto_839651 ) ) ( not ( = ?auto_839649 ?auto_839652 ) ) ( not ( = ?auto_839649 ?auto_839653 ) ) ( not ( = ?auto_839649 ?auto_839654 ) ) ( not ( = ?auto_839649 ?auto_839655 ) ) ( not ( = ?auto_839649 ?auto_839656 ) ) ( not ( = ?auto_839649 ?auto_839657 ) ) ( not ( = ?auto_839649 ?auto_839658 ) ) ( not ( = ?auto_839649 ?auto_839659 ) ) ( not ( = ?auto_839649 ?auto_839660 ) ) ( not ( = ?auto_839649 ?auto_839661 ) ) ( not ( = ?auto_839650 ?auto_839651 ) ) ( not ( = ?auto_839650 ?auto_839652 ) ) ( not ( = ?auto_839650 ?auto_839653 ) ) ( not ( = ?auto_839650 ?auto_839654 ) ) ( not ( = ?auto_839650 ?auto_839655 ) ) ( not ( = ?auto_839650 ?auto_839656 ) ) ( not ( = ?auto_839650 ?auto_839657 ) ) ( not ( = ?auto_839650 ?auto_839658 ) ) ( not ( = ?auto_839650 ?auto_839659 ) ) ( not ( = ?auto_839650 ?auto_839660 ) ) ( not ( = ?auto_839650 ?auto_839661 ) ) ( not ( = ?auto_839651 ?auto_839652 ) ) ( not ( = ?auto_839651 ?auto_839653 ) ) ( not ( = ?auto_839651 ?auto_839654 ) ) ( not ( = ?auto_839651 ?auto_839655 ) ) ( not ( = ?auto_839651 ?auto_839656 ) ) ( not ( = ?auto_839651 ?auto_839657 ) ) ( not ( = ?auto_839651 ?auto_839658 ) ) ( not ( = ?auto_839651 ?auto_839659 ) ) ( not ( = ?auto_839651 ?auto_839660 ) ) ( not ( = ?auto_839651 ?auto_839661 ) ) ( not ( = ?auto_839652 ?auto_839653 ) ) ( not ( = ?auto_839652 ?auto_839654 ) ) ( not ( = ?auto_839652 ?auto_839655 ) ) ( not ( = ?auto_839652 ?auto_839656 ) ) ( not ( = ?auto_839652 ?auto_839657 ) ) ( not ( = ?auto_839652 ?auto_839658 ) ) ( not ( = ?auto_839652 ?auto_839659 ) ) ( not ( = ?auto_839652 ?auto_839660 ) ) ( not ( = ?auto_839652 ?auto_839661 ) ) ( not ( = ?auto_839653 ?auto_839654 ) ) ( not ( = ?auto_839653 ?auto_839655 ) ) ( not ( = ?auto_839653 ?auto_839656 ) ) ( not ( = ?auto_839653 ?auto_839657 ) ) ( not ( = ?auto_839653 ?auto_839658 ) ) ( not ( = ?auto_839653 ?auto_839659 ) ) ( not ( = ?auto_839653 ?auto_839660 ) ) ( not ( = ?auto_839653 ?auto_839661 ) ) ( not ( = ?auto_839654 ?auto_839655 ) ) ( not ( = ?auto_839654 ?auto_839656 ) ) ( not ( = ?auto_839654 ?auto_839657 ) ) ( not ( = ?auto_839654 ?auto_839658 ) ) ( not ( = ?auto_839654 ?auto_839659 ) ) ( not ( = ?auto_839654 ?auto_839660 ) ) ( not ( = ?auto_839654 ?auto_839661 ) ) ( not ( = ?auto_839655 ?auto_839656 ) ) ( not ( = ?auto_839655 ?auto_839657 ) ) ( not ( = ?auto_839655 ?auto_839658 ) ) ( not ( = ?auto_839655 ?auto_839659 ) ) ( not ( = ?auto_839655 ?auto_839660 ) ) ( not ( = ?auto_839655 ?auto_839661 ) ) ( not ( = ?auto_839656 ?auto_839657 ) ) ( not ( = ?auto_839656 ?auto_839658 ) ) ( not ( = ?auto_839656 ?auto_839659 ) ) ( not ( = ?auto_839656 ?auto_839660 ) ) ( not ( = ?auto_839656 ?auto_839661 ) ) ( not ( = ?auto_839657 ?auto_839658 ) ) ( not ( = ?auto_839657 ?auto_839659 ) ) ( not ( = ?auto_839657 ?auto_839660 ) ) ( not ( = ?auto_839657 ?auto_839661 ) ) ( not ( = ?auto_839658 ?auto_839659 ) ) ( not ( = ?auto_839658 ?auto_839660 ) ) ( not ( = ?auto_839658 ?auto_839661 ) ) ( not ( = ?auto_839659 ?auto_839660 ) ) ( not ( = ?auto_839659 ?auto_839661 ) ) ( not ( = ?auto_839660 ?auto_839661 ) ) ( ON ?auto_839659 ?auto_839660 ) ( ON ?auto_839658 ?auto_839659 ) ( ON ?auto_839657 ?auto_839658 ) ( ON ?auto_839656 ?auto_839657 ) ( ON ?auto_839655 ?auto_839656 ) ( ON ?auto_839654 ?auto_839655 ) ( ON ?auto_839653 ?auto_839654 ) ( CLEAR ?auto_839651 ) ( ON ?auto_839652 ?auto_839653 ) ( CLEAR ?auto_839652 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_839648 ?auto_839649 ?auto_839650 ?auto_839651 ?auto_839652 )
      ( MAKE-13PILE ?auto_839648 ?auto_839649 ?auto_839650 ?auto_839651 ?auto_839652 ?auto_839653 ?auto_839654 ?auto_839655 ?auto_839656 ?auto_839657 ?auto_839658 ?auto_839659 ?auto_839660 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_839702 - BLOCK
      ?auto_839703 - BLOCK
      ?auto_839704 - BLOCK
      ?auto_839705 - BLOCK
      ?auto_839706 - BLOCK
      ?auto_839707 - BLOCK
      ?auto_839708 - BLOCK
      ?auto_839709 - BLOCK
      ?auto_839710 - BLOCK
      ?auto_839711 - BLOCK
      ?auto_839712 - BLOCK
      ?auto_839713 - BLOCK
      ?auto_839714 - BLOCK
    )
    :vars
    (
      ?auto_839715 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_839714 ?auto_839715 ) ( ON-TABLE ?auto_839702 ) ( ON ?auto_839703 ?auto_839702 ) ( ON ?auto_839704 ?auto_839703 ) ( not ( = ?auto_839702 ?auto_839703 ) ) ( not ( = ?auto_839702 ?auto_839704 ) ) ( not ( = ?auto_839702 ?auto_839705 ) ) ( not ( = ?auto_839702 ?auto_839706 ) ) ( not ( = ?auto_839702 ?auto_839707 ) ) ( not ( = ?auto_839702 ?auto_839708 ) ) ( not ( = ?auto_839702 ?auto_839709 ) ) ( not ( = ?auto_839702 ?auto_839710 ) ) ( not ( = ?auto_839702 ?auto_839711 ) ) ( not ( = ?auto_839702 ?auto_839712 ) ) ( not ( = ?auto_839702 ?auto_839713 ) ) ( not ( = ?auto_839702 ?auto_839714 ) ) ( not ( = ?auto_839702 ?auto_839715 ) ) ( not ( = ?auto_839703 ?auto_839704 ) ) ( not ( = ?auto_839703 ?auto_839705 ) ) ( not ( = ?auto_839703 ?auto_839706 ) ) ( not ( = ?auto_839703 ?auto_839707 ) ) ( not ( = ?auto_839703 ?auto_839708 ) ) ( not ( = ?auto_839703 ?auto_839709 ) ) ( not ( = ?auto_839703 ?auto_839710 ) ) ( not ( = ?auto_839703 ?auto_839711 ) ) ( not ( = ?auto_839703 ?auto_839712 ) ) ( not ( = ?auto_839703 ?auto_839713 ) ) ( not ( = ?auto_839703 ?auto_839714 ) ) ( not ( = ?auto_839703 ?auto_839715 ) ) ( not ( = ?auto_839704 ?auto_839705 ) ) ( not ( = ?auto_839704 ?auto_839706 ) ) ( not ( = ?auto_839704 ?auto_839707 ) ) ( not ( = ?auto_839704 ?auto_839708 ) ) ( not ( = ?auto_839704 ?auto_839709 ) ) ( not ( = ?auto_839704 ?auto_839710 ) ) ( not ( = ?auto_839704 ?auto_839711 ) ) ( not ( = ?auto_839704 ?auto_839712 ) ) ( not ( = ?auto_839704 ?auto_839713 ) ) ( not ( = ?auto_839704 ?auto_839714 ) ) ( not ( = ?auto_839704 ?auto_839715 ) ) ( not ( = ?auto_839705 ?auto_839706 ) ) ( not ( = ?auto_839705 ?auto_839707 ) ) ( not ( = ?auto_839705 ?auto_839708 ) ) ( not ( = ?auto_839705 ?auto_839709 ) ) ( not ( = ?auto_839705 ?auto_839710 ) ) ( not ( = ?auto_839705 ?auto_839711 ) ) ( not ( = ?auto_839705 ?auto_839712 ) ) ( not ( = ?auto_839705 ?auto_839713 ) ) ( not ( = ?auto_839705 ?auto_839714 ) ) ( not ( = ?auto_839705 ?auto_839715 ) ) ( not ( = ?auto_839706 ?auto_839707 ) ) ( not ( = ?auto_839706 ?auto_839708 ) ) ( not ( = ?auto_839706 ?auto_839709 ) ) ( not ( = ?auto_839706 ?auto_839710 ) ) ( not ( = ?auto_839706 ?auto_839711 ) ) ( not ( = ?auto_839706 ?auto_839712 ) ) ( not ( = ?auto_839706 ?auto_839713 ) ) ( not ( = ?auto_839706 ?auto_839714 ) ) ( not ( = ?auto_839706 ?auto_839715 ) ) ( not ( = ?auto_839707 ?auto_839708 ) ) ( not ( = ?auto_839707 ?auto_839709 ) ) ( not ( = ?auto_839707 ?auto_839710 ) ) ( not ( = ?auto_839707 ?auto_839711 ) ) ( not ( = ?auto_839707 ?auto_839712 ) ) ( not ( = ?auto_839707 ?auto_839713 ) ) ( not ( = ?auto_839707 ?auto_839714 ) ) ( not ( = ?auto_839707 ?auto_839715 ) ) ( not ( = ?auto_839708 ?auto_839709 ) ) ( not ( = ?auto_839708 ?auto_839710 ) ) ( not ( = ?auto_839708 ?auto_839711 ) ) ( not ( = ?auto_839708 ?auto_839712 ) ) ( not ( = ?auto_839708 ?auto_839713 ) ) ( not ( = ?auto_839708 ?auto_839714 ) ) ( not ( = ?auto_839708 ?auto_839715 ) ) ( not ( = ?auto_839709 ?auto_839710 ) ) ( not ( = ?auto_839709 ?auto_839711 ) ) ( not ( = ?auto_839709 ?auto_839712 ) ) ( not ( = ?auto_839709 ?auto_839713 ) ) ( not ( = ?auto_839709 ?auto_839714 ) ) ( not ( = ?auto_839709 ?auto_839715 ) ) ( not ( = ?auto_839710 ?auto_839711 ) ) ( not ( = ?auto_839710 ?auto_839712 ) ) ( not ( = ?auto_839710 ?auto_839713 ) ) ( not ( = ?auto_839710 ?auto_839714 ) ) ( not ( = ?auto_839710 ?auto_839715 ) ) ( not ( = ?auto_839711 ?auto_839712 ) ) ( not ( = ?auto_839711 ?auto_839713 ) ) ( not ( = ?auto_839711 ?auto_839714 ) ) ( not ( = ?auto_839711 ?auto_839715 ) ) ( not ( = ?auto_839712 ?auto_839713 ) ) ( not ( = ?auto_839712 ?auto_839714 ) ) ( not ( = ?auto_839712 ?auto_839715 ) ) ( not ( = ?auto_839713 ?auto_839714 ) ) ( not ( = ?auto_839713 ?auto_839715 ) ) ( not ( = ?auto_839714 ?auto_839715 ) ) ( ON ?auto_839713 ?auto_839714 ) ( ON ?auto_839712 ?auto_839713 ) ( ON ?auto_839711 ?auto_839712 ) ( ON ?auto_839710 ?auto_839711 ) ( ON ?auto_839709 ?auto_839710 ) ( ON ?auto_839708 ?auto_839709 ) ( ON ?auto_839707 ?auto_839708 ) ( ON ?auto_839706 ?auto_839707 ) ( CLEAR ?auto_839704 ) ( ON ?auto_839705 ?auto_839706 ) ( CLEAR ?auto_839705 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_839702 ?auto_839703 ?auto_839704 ?auto_839705 )
      ( MAKE-13PILE ?auto_839702 ?auto_839703 ?auto_839704 ?auto_839705 ?auto_839706 ?auto_839707 ?auto_839708 ?auto_839709 ?auto_839710 ?auto_839711 ?auto_839712 ?auto_839713 ?auto_839714 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_839756 - BLOCK
      ?auto_839757 - BLOCK
      ?auto_839758 - BLOCK
      ?auto_839759 - BLOCK
      ?auto_839760 - BLOCK
      ?auto_839761 - BLOCK
      ?auto_839762 - BLOCK
      ?auto_839763 - BLOCK
      ?auto_839764 - BLOCK
      ?auto_839765 - BLOCK
      ?auto_839766 - BLOCK
      ?auto_839767 - BLOCK
      ?auto_839768 - BLOCK
    )
    :vars
    (
      ?auto_839769 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_839768 ?auto_839769 ) ( ON-TABLE ?auto_839756 ) ( ON ?auto_839757 ?auto_839756 ) ( not ( = ?auto_839756 ?auto_839757 ) ) ( not ( = ?auto_839756 ?auto_839758 ) ) ( not ( = ?auto_839756 ?auto_839759 ) ) ( not ( = ?auto_839756 ?auto_839760 ) ) ( not ( = ?auto_839756 ?auto_839761 ) ) ( not ( = ?auto_839756 ?auto_839762 ) ) ( not ( = ?auto_839756 ?auto_839763 ) ) ( not ( = ?auto_839756 ?auto_839764 ) ) ( not ( = ?auto_839756 ?auto_839765 ) ) ( not ( = ?auto_839756 ?auto_839766 ) ) ( not ( = ?auto_839756 ?auto_839767 ) ) ( not ( = ?auto_839756 ?auto_839768 ) ) ( not ( = ?auto_839756 ?auto_839769 ) ) ( not ( = ?auto_839757 ?auto_839758 ) ) ( not ( = ?auto_839757 ?auto_839759 ) ) ( not ( = ?auto_839757 ?auto_839760 ) ) ( not ( = ?auto_839757 ?auto_839761 ) ) ( not ( = ?auto_839757 ?auto_839762 ) ) ( not ( = ?auto_839757 ?auto_839763 ) ) ( not ( = ?auto_839757 ?auto_839764 ) ) ( not ( = ?auto_839757 ?auto_839765 ) ) ( not ( = ?auto_839757 ?auto_839766 ) ) ( not ( = ?auto_839757 ?auto_839767 ) ) ( not ( = ?auto_839757 ?auto_839768 ) ) ( not ( = ?auto_839757 ?auto_839769 ) ) ( not ( = ?auto_839758 ?auto_839759 ) ) ( not ( = ?auto_839758 ?auto_839760 ) ) ( not ( = ?auto_839758 ?auto_839761 ) ) ( not ( = ?auto_839758 ?auto_839762 ) ) ( not ( = ?auto_839758 ?auto_839763 ) ) ( not ( = ?auto_839758 ?auto_839764 ) ) ( not ( = ?auto_839758 ?auto_839765 ) ) ( not ( = ?auto_839758 ?auto_839766 ) ) ( not ( = ?auto_839758 ?auto_839767 ) ) ( not ( = ?auto_839758 ?auto_839768 ) ) ( not ( = ?auto_839758 ?auto_839769 ) ) ( not ( = ?auto_839759 ?auto_839760 ) ) ( not ( = ?auto_839759 ?auto_839761 ) ) ( not ( = ?auto_839759 ?auto_839762 ) ) ( not ( = ?auto_839759 ?auto_839763 ) ) ( not ( = ?auto_839759 ?auto_839764 ) ) ( not ( = ?auto_839759 ?auto_839765 ) ) ( not ( = ?auto_839759 ?auto_839766 ) ) ( not ( = ?auto_839759 ?auto_839767 ) ) ( not ( = ?auto_839759 ?auto_839768 ) ) ( not ( = ?auto_839759 ?auto_839769 ) ) ( not ( = ?auto_839760 ?auto_839761 ) ) ( not ( = ?auto_839760 ?auto_839762 ) ) ( not ( = ?auto_839760 ?auto_839763 ) ) ( not ( = ?auto_839760 ?auto_839764 ) ) ( not ( = ?auto_839760 ?auto_839765 ) ) ( not ( = ?auto_839760 ?auto_839766 ) ) ( not ( = ?auto_839760 ?auto_839767 ) ) ( not ( = ?auto_839760 ?auto_839768 ) ) ( not ( = ?auto_839760 ?auto_839769 ) ) ( not ( = ?auto_839761 ?auto_839762 ) ) ( not ( = ?auto_839761 ?auto_839763 ) ) ( not ( = ?auto_839761 ?auto_839764 ) ) ( not ( = ?auto_839761 ?auto_839765 ) ) ( not ( = ?auto_839761 ?auto_839766 ) ) ( not ( = ?auto_839761 ?auto_839767 ) ) ( not ( = ?auto_839761 ?auto_839768 ) ) ( not ( = ?auto_839761 ?auto_839769 ) ) ( not ( = ?auto_839762 ?auto_839763 ) ) ( not ( = ?auto_839762 ?auto_839764 ) ) ( not ( = ?auto_839762 ?auto_839765 ) ) ( not ( = ?auto_839762 ?auto_839766 ) ) ( not ( = ?auto_839762 ?auto_839767 ) ) ( not ( = ?auto_839762 ?auto_839768 ) ) ( not ( = ?auto_839762 ?auto_839769 ) ) ( not ( = ?auto_839763 ?auto_839764 ) ) ( not ( = ?auto_839763 ?auto_839765 ) ) ( not ( = ?auto_839763 ?auto_839766 ) ) ( not ( = ?auto_839763 ?auto_839767 ) ) ( not ( = ?auto_839763 ?auto_839768 ) ) ( not ( = ?auto_839763 ?auto_839769 ) ) ( not ( = ?auto_839764 ?auto_839765 ) ) ( not ( = ?auto_839764 ?auto_839766 ) ) ( not ( = ?auto_839764 ?auto_839767 ) ) ( not ( = ?auto_839764 ?auto_839768 ) ) ( not ( = ?auto_839764 ?auto_839769 ) ) ( not ( = ?auto_839765 ?auto_839766 ) ) ( not ( = ?auto_839765 ?auto_839767 ) ) ( not ( = ?auto_839765 ?auto_839768 ) ) ( not ( = ?auto_839765 ?auto_839769 ) ) ( not ( = ?auto_839766 ?auto_839767 ) ) ( not ( = ?auto_839766 ?auto_839768 ) ) ( not ( = ?auto_839766 ?auto_839769 ) ) ( not ( = ?auto_839767 ?auto_839768 ) ) ( not ( = ?auto_839767 ?auto_839769 ) ) ( not ( = ?auto_839768 ?auto_839769 ) ) ( ON ?auto_839767 ?auto_839768 ) ( ON ?auto_839766 ?auto_839767 ) ( ON ?auto_839765 ?auto_839766 ) ( ON ?auto_839764 ?auto_839765 ) ( ON ?auto_839763 ?auto_839764 ) ( ON ?auto_839762 ?auto_839763 ) ( ON ?auto_839761 ?auto_839762 ) ( ON ?auto_839760 ?auto_839761 ) ( ON ?auto_839759 ?auto_839760 ) ( CLEAR ?auto_839757 ) ( ON ?auto_839758 ?auto_839759 ) ( CLEAR ?auto_839758 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_839756 ?auto_839757 ?auto_839758 )
      ( MAKE-13PILE ?auto_839756 ?auto_839757 ?auto_839758 ?auto_839759 ?auto_839760 ?auto_839761 ?auto_839762 ?auto_839763 ?auto_839764 ?auto_839765 ?auto_839766 ?auto_839767 ?auto_839768 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_839810 - BLOCK
      ?auto_839811 - BLOCK
      ?auto_839812 - BLOCK
      ?auto_839813 - BLOCK
      ?auto_839814 - BLOCK
      ?auto_839815 - BLOCK
      ?auto_839816 - BLOCK
      ?auto_839817 - BLOCK
      ?auto_839818 - BLOCK
      ?auto_839819 - BLOCK
      ?auto_839820 - BLOCK
      ?auto_839821 - BLOCK
      ?auto_839822 - BLOCK
    )
    :vars
    (
      ?auto_839823 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_839822 ?auto_839823 ) ( ON-TABLE ?auto_839810 ) ( not ( = ?auto_839810 ?auto_839811 ) ) ( not ( = ?auto_839810 ?auto_839812 ) ) ( not ( = ?auto_839810 ?auto_839813 ) ) ( not ( = ?auto_839810 ?auto_839814 ) ) ( not ( = ?auto_839810 ?auto_839815 ) ) ( not ( = ?auto_839810 ?auto_839816 ) ) ( not ( = ?auto_839810 ?auto_839817 ) ) ( not ( = ?auto_839810 ?auto_839818 ) ) ( not ( = ?auto_839810 ?auto_839819 ) ) ( not ( = ?auto_839810 ?auto_839820 ) ) ( not ( = ?auto_839810 ?auto_839821 ) ) ( not ( = ?auto_839810 ?auto_839822 ) ) ( not ( = ?auto_839810 ?auto_839823 ) ) ( not ( = ?auto_839811 ?auto_839812 ) ) ( not ( = ?auto_839811 ?auto_839813 ) ) ( not ( = ?auto_839811 ?auto_839814 ) ) ( not ( = ?auto_839811 ?auto_839815 ) ) ( not ( = ?auto_839811 ?auto_839816 ) ) ( not ( = ?auto_839811 ?auto_839817 ) ) ( not ( = ?auto_839811 ?auto_839818 ) ) ( not ( = ?auto_839811 ?auto_839819 ) ) ( not ( = ?auto_839811 ?auto_839820 ) ) ( not ( = ?auto_839811 ?auto_839821 ) ) ( not ( = ?auto_839811 ?auto_839822 ) ) ( not ( = ?auto_839811 ?auto_839823 ) ) ( not ( = ?auto_839812 ?auto_839813 ) ) ( not ( = ?auto_839812 ?auto_839814 ) ) ( not ( = ?auto_839812 ?auto_839815 ) ) ( not ( = ?auto_839812 ?auto_839816 ) ) ( not ( = ?auto_839812 ?auto_839817 ) ) ( not ( = ?auto_839812 ?auto_839818 ) ) ( not ( = ?auto_839812 ?auto_839819 ) ) ( not ( = ?auto_839812 ?auto_839820 ) ) ( not ( = ?auto_839812 ?auto_839821 ) ) ( not ( = ?auto_839812 ?auto_839822 ) ) ( not ( = ?auto_839812 ?auto_839823 ) ) ( not ( = ?auto_839813 ?auto_839814 ) ) ( not ( = ?auto_839813 ?auto_839815 ) ) ( not ( = ?auto_839813 ?auto_839816 ) ) ( not ( = ?auto_839813 ?auto_839817 ) ) ( not ( = ?auto_839813 ?auto_839818 ) ) ( not ( = ?auto_839813 ?auto_839819 ) ) ( not ( = ?auto_839813 ?auto_839820 ) ) ( not ( = ?auto_839813 ?auto_839821 ) ) ( not ( = ?auto_839813 ?auto_839822 ) ) ( not ( = ?auto_839813 ?auto_839823 ) ) ( not ( = ?auto_839814 ?auto_839815 ) ) ( not ( = ?auto_839814 ?auto_839816 ) ) ( not ( = ?auto_839814 ?auto_839817 ) ) ( not ( = ?auto_839814 ?auto_839818 ) ) ( not ( = ?auto_839814 ?auto_839819 ) ) ( not ( = ?auto_839814 ?auto_839820 ) ) ( not ( = ?auto_839814 ?auto_839821 ) ) ( not ( = ?auto_839814 ?auto_839822 ) ) ( not ( = ?auto_839814 ?auto_839823 ) ) ( not ( = ?auto_839815 ?auto_839816 ) ) ( not ( = ?auto_839815 ?auto_839817 ) ) ( not ( = ?auto_839815 ?auto_839818 ) ) ( not ( = ?auto_839815 ?auto_839819 ) ) ( not ( = ?auto_839815 ?auto_839820 ) ) ( not ( = ?auto_839815 ?auto_839821 ) ) ( not ( = ?auto_839815 ?auto_839822 ) ) ( not ( = ?auto_839815 ?auto_839823 ) ) ( not ( = ?auto_839816 ?auto_839817 ) ) ( not ( = ?auto_839816 ?auto_839818 ) ) ( not ( = ?auto_839816 ?auto_839819 ) ) ( not ( = ?auto_839816 ?auto_839820 ) ) ( not ( = ?auto_839816 ?auto_839821 ) ) ( not ( = ?auto_839816 ?auto_839822 ) ) ( not ( = ?auto_839816 ?auto_839823 ) ) ( not ( = ?auto_839817 ?auto_839818 ) ) ( not ( = ?auto_839817 ?auto_839819 ) ) ( not ( = ?auto_839817 ?auto_839820 ) ) ( not ( = ?auto_839817 ?auto_839821 ) ) ( not ( = ?auto_839817 ?auto_839822 ) ) ( not ( = ?auto_839817 ?auto_839823 ) ) ( not ( = ?auto_839818 ?auto_839819 ) ) ( not ( = ?auto_839818 ?auto_839820 ) ) ( not ( = ?auto_839818 ?auto_839821 ) ) ( not ( = ?auto_839818 ?auto_839822 ) ) ( not ( = ?auto_839818 ?auto_839823 ) ) ( not ( = ?auto_839819 ?auto_839820 ) ) ( not ( = ?auto_839819 ?auto_839821 ) ) ( not ( = ?auto_839819 ?auto_839822 ) ) ( not ( = ?auto_839819 ?auto_839823 ) ) ( not ( = ?auto_839820 ?auto_839821 ) ) ( not ( = ?auto_839820 ?auto_839822 ) ) ( not ( = ?auto_839820 ?auto_839823 ) ) ( not ( = ?auto_839821 ?auto_839822 ) ) ( not ( = ?auto_839821 ?auto_839823 ) ) ( not ( = ?auto_839822 ?auto_839823 ) ) ( ON ?auto_839821 ?auto_839822 ) ( ON ?auto_839820 ?auto_839821 ) ( ON ?auto_839819 ?auto_839820 ) ( ON ?auto_839818 ?auto_839819 ) ( ON ?auto_839817 ?auto_839818 ) ( ON ?auto_839816 ?auto_839817 ) ( ON ?auto_839815 ?auto_839816 ) ( ON ?auto_839814 ?auto_839815 ) ( ON ?auto_839813 ?auto_839814 ) ( ON ?auto_839812 ?auto_839813 ) ( CLEAR ?auto_839810 ) ( ON ?auto_839811 ?auto_839812 ) ( CLEAR ?auto_839811 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_839810 ?auto_839811 )
      ( MAKE-13PILE ?auto_839810 ?auto_839811 ?auto_839812 ?auto_839813 ?auto_839814 ?auto_839815 ?auto_839816 ?auto_839817 ?auto_839818 ?auto_839819 ?auto_839820 ?auto_839821 ?auto_839822 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_839864 - BLOCK
      ?auto_839865 - BLOCK
      ?auto_839866 - BLOCK
      ?auto_839867 - BLOCK
      ?auto_839868 - BLOCK
      ?auto_839869 - BLOCK
      ?auto_839870 - BLOCK
      ?auto_839871 - BLOCK
      ?auto_839872 - BLOCK
      ?auto_839873 - BLOCK
      ?auto_839874 - BLOCK
      ?auto_839875 - BLOCK
      ?auto_839876 - BLOCK
    )
    :vars
    (
      ?auto_839877 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_839876 ?auto_839877 ) ( not ( = ?auto_839864 ?auto_839865 ) ) ( not ( = ?auto_839864 ?auto_839866 ) ) ( not ( = ?auto_839864 ?auto_839867 ) ) ( not ( = ?auto_839864 ?auto_839868 ) ) ( not ( = ?auto_839864 ?auto_839869 ) ) ( not ( = ?auto_839864 ?auto_839870 ) ) ( not ( = ?auto_839864 ?auto_839871 ) ) ( not ( = ?auto_839864 ?auto_839872 ) ) ( not ( = ?auto_839864 ?auto_839873 ) ) ( not ( = ?auto_839864 ?auto_839874 ) ) ( not ( = ?auto_839864 ?auto_839875 ) ) ( not ( = ?auto_839864 ?auto_839876 ) ) ( not ( = ?auto_839864 ?auto_839877 ) ) ( not ( = ?auto_839865 ?auto_839866 ) ) ( not ( = ?auto_839865 ?auto_839867 ) ) ( not ( = ?auto_839865 ?auto_839868 ) ) ( not ( = ?auto_839865 ?auto_839869 ) ) ( not ( = ?auto_839865 ?auto_839870 ) ) ( not ( = ?auto_839865 ?auto_839871 ) ) ( not ( = ?auto_839865 ?auto_839872 ) ) ( not ( = ?auto_839865 ?auto_839873 ) ) ( not ( = ?auto_839865 ?auto_839874 ) ) ( not ( = ?auto_839865 ?auto_839875 ) ) ( not ( = ?auto_839865 ?auto_839876 ) ) ( not ( = ?auto_839865 ?auto_839877 ) ) ( not ( = ?auto_839866 ?auto_839867 ) ) ( not ( = ?auto_839866 ?auto_839868 ) ) ( not ( = ?auto_839866 ?auto_839869 ) ) ( not ( = ?auto_839866 ?auto_839870 ) ) ( not ( = ?auto_839866 ?auto_839871 ) ) ( not ( = ?auto_839866 ?auto_839872 ) ) ( not ( = ?auto_839866 ?auto_839873 ) ) ( not ( = ?auto_839866 ?auto_839874 ) ) ( not ( = ?auto_839866 ?auto_839875 ) ) ( not ( = ?auto_839866 ?auto_839876 ) ) ( not ( = ?auto_839866 ?auto_839877 ) ) ( not ( = ?auto_839867 ?auto_839868 ) ) ( not ( = ?auto_839867 ?auto_839869 ) ) ( not ( = ?auto_839867 ?auto_839870 ) ) ( not ( = ?auto_839867 ?auto_839871 ) ) ( not ( = ?auto_839867 ?auto_839872 ) ) ( not ( = ?auto_839867 ?auto_839873 ) ) ( not ( = ?auto_839867 ?auto_839874 ) ) ( not ( = ?auto_839867 ?auto_839875 ) ) ( not ( = ?auto_839867 ?auto_839876 ) ) ( not ( = ?auto_839867 ?auto_839877 ) ) ( not ( = ?auto_839868 ?auto_839869 ) ) ( not ( = ?auto_839868 ?auto_839870 ) ) ( not ( = ?auto_839868 ?auto_839871 ) ) ( not ( = ?auto_839868 ?auto_839872 ) ) ( not ( = ?auto_839868 ?auto_839873 ) ) ( not ( = ?auto_839868 ?auto_839874 ) ) ( not ( = ?auto_839868 ?auto_839875 ) ) ( not ( = ?auto_839868 ?auto_839876 ) ) ( not ( = ?auto_839868 ?auto_839877 ) ) ( not ( = ?auto_839869 ?auto_839870 ) ) ( not ( = ?auto_839869 ?auto_839871 ) ) ( not ( = ?auto_839869 ?auto_839872 ) ) ( not ( = ?auto_839869 ?auto_839873 ) ) ( not ( = ?auto_839869 ?auto_839874 ) ) ( not ( = ?auto_839869 ?auto_839875 ) ) ( not ( = ?auto_839869 ?auto_839876 ) ) ( not ( = ?auto_839869 ?auto_839877 ) ) ( not ( = ?auto_839870 ?auto_839871 ) ) ( not ( = ?auto_839870 ?auto_839872 ) ) ( not ( = ?auto_839870 ?auto_839873 ) ) ( not ( = ?auto_839870 ?auto_839874 ) ) ( not ( = ?auto_839870 ?auto_839875 ) ) ( not ( = ?auto_839870 ?auto_839876 ) ) ( not ( = ?auto_839870 ?auto_839877 ) ) ( not ( = ?auto_839871 ?auto_839872 ) ) ( not ( = ?auto_839871 ?auto_839873 ) ) ( not ( = ?auto_839871 ?auto_839874 ) ) ( not ( = ?auto_839871 ?auto_839875 ) ) ( not ( = ?auto_839871 ?auto_839876 ) ) ( not ( = ?auto_839871 ?auto_839877 ) ) ( not ( = ?auto_839872 ?auto_839873 ) ) ( not ( = ?auto_839872 ?auto_839874 ) ) ( not ( = ?auto_839872 ?auto_839875 ) ) ( not ( = ?auto_839872 ?auto_839876 ) ) ( not ( = ?auto_839872 ?auto_839877 ) ) ( not ( = ?auto_839873 ?auto_839874 ) ) ( not ( = ?auto_839873 ?auto_839875 ) ) ( not ( = ?auto_839873 ?auto_839876 ) ) ( not ( = ?auto_839873 ?auto_839877 ) ) ( not ( = ?auto_839874 ?auto_839875 ) ) ( not ( = ?auto_839874 ?auto_839876 ) ) ( not ( = ?auto_839874 ?auto_839877 ) ) ( not ( = ?auto_839875 ?auto_839876 ) ) ( not ( = ?auto_839875 ?auto_839877 ) ) ( not ( = ?auto_839876 ?auto_839877 ) ) ( ON ?auto_839875 ?auto_839876 ) ( ON ?auto_839874 ?auto_839875 ) ( ON ?auto_839873 ?auto_839874 ) ( ON ?auto_839872 ?auto_839873 ) ( ON ?auto_839871 ?auto_839872 ) ( ON ?auto_839870 ?auto_839871 ) ( ON ?auto_839869 ?auto_839870 ) ( ON ?auto_839868 ?auto_839869 ) ( ON ?auto_839867 ?auto_839868 ) ( ON ?auto_839866 ?auto_839867 ) ( ON ?auto_839865 ?auto_839866 ) ( ON ?auto_839864 ?auto_839865 ) ( CLEAR ?auto_839864 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_839864 )
      ( MAKE-13PILE ?auto_839864 ?auto_839865 ?auto_839866 ?auto_839867 ?auto_839868 ?auto_839869 ?auto_839870 ?auto_839871 ?auto_839872 ?auto_839873 ?auto_839874 ?auto_839875 ?auto_839876 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_839919 - BLOCK
      ?auto_839920 - BLOCK
      ?auto_839921 - BLOCK
      ?auto_839922 - BLOCK
      ?auto_839923 - BLOCK
      ?auto_839924 - BLOCK
      ?auto_839925 - BLOCK
      ?auto_839926 - BLOCK
      ?auto_839927 - BLOCK
      ?auto_839928 - BLOCK
      ?auto_839929 - BLOCK
      ?auto_839930 - BLOCK
      ?auto_839931 - BLOCK
      ?auto_839932 - BLOCK
    )
    :vars
    (
      ?auto_839933 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_839931 ) ( ON ?auto_839932 ?auto_839933 ) ( CLEAR ?auto_839932 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_839919 ) ( ON ?auto_839920 ?auto_839919 ) ( ON ?auto_839921 ?auto_839920 ) ( ON ?auto_839922 ?auto_839921 ) ( ON ?auto_839923 ?auto_839922 ) ( ON ?auto_839924 ?auto_839923 ) ( ON ?auto_839925 ?auto_839924 ) ( ON ?auto_839926 ?auto_839925 ) ( ON ?auto_839927 ?auto_839926 ) ( ON ?auto_839928 ?auto_839927 ) ( ON ?auto_839929 ?auto_839928 ) ( ON ?auto_839930 ?auto_839929 ) ( ON ?auto_839931 ?auto_839930 ) ( not ( = ?auto_839919 ?auto_839920 ) ) ( not ( = ?auto_839919 ?auto_839921 ) ) ( not ( = ?auto_839919 ?auto_839922 ) ) ( not ( = ?auto_839919 ?auto_839923 ) ) ( not ( = ?auto_839919 ?auto_839924 ) ) ( not ( = ?auto_839919 ?auto_839925 ) ) ( not ( = ?auto_839919 ?auto_839926 ) ) ( not ( = ?auto_839919 ?auto_839927 ) ) ( not ( = ?auto_839919 ?auto_839928 ) ) ( not ( = ?auto_839919 ?auto_839929 ) ) ( not ( = ?auto_839919 ?auto_839930 ) ) ( not ( = ?auto_839919 ?auto_839931 ) ) ( not ( = ?auto_839919 ?auto_839932 ) ) ( not ( = ?auto_839919 ?auto_839933 ) ) ( not ( = ?auto_839920 ?auto_839921 ) ) ( not ( = ?auto_839920 ?auto_839922 ) ) ( not ( = ?auto_839920 ?auto_839923 ) ) ( not ( = ?auto_839920 ?auto_839924 ) ) ( not ( = ?auto_839920 ?auto_839925 ) ) ( not ( = ?auto_839920 ?auto_839926 ) ) ( not ( = ?auto_839920 ?auto_839927 ) ) ( not ( = ?auto_839920 ?auto_839928 ) ) ( not ( = ?auto_839920 ?auto_839929 ) ) ( not ( = ?auto_839920 ?auto_839930 ) ) ( not ( = ?auto_839920 ?auto_839931 ) ) ( not ( = ?auto_839920 ?auto_839932 ) ) ( not ( = ?auto_839920 ?auto_839933 ) ) ( not ( = ?auto_839921 ?auto_839922 ) ) ( not ( = ?auto_839921 ?auto_839923 ) ) ( not ( = ?auto_839921 ?auto_839924 ) ) ( not ( = ?auto_839921 ?auto_839925 ) ) ( not ( = ?auto_839921 ?auto_839926 ) ) ( not ( = ?auto_839921 ?auto_839927 ) ) ( not ( = ?auto_839921 ?auto_839928 ) ) ( not ( = ?auto_839921 ?auto_839929 ) ) ( not ( = ?auto_839921 ?auto_839930 ) ) ( not ( = ?auto_839921 ?auto_839931 ) ) ( not ( = ?auto_839921 ?auto_839932 ) ) ( not ( = ?auto_839921 ?auto_839933 ) ) ( not ( = ?auto_839922 ?auto_839923 ) ) ( not ( = ?auto_839922 ?auto_839924 ) ) ( not ( = ?auto_839922 ?auto_839925 ) ) ( not ( = ?auto_839922 ?auto_839926 ) ) ( not ( = ?auto_839922 ?auto_839927 ) ) ( not ( = ?auto_839922 ?auto_839928 ) ) ( not ( = ?auto_839922 ?auto_839929 ) ) ( not ( = ?auto_839922 ?auto_839930 ) ) ( not ( = ?auto_839922 ?auto_839931 ) ) ( not ( = ?auto_839922 ?auto_839932 ) ) ( not ( = ?auto_839922 ?auto_839933 ) ) ( not ( = ?auto_839923 ?auto_839924 ) ) ( not ( = ?auto_839923 ?auto_839925 ) ) ( not ( = ?auto_839923 ?auto_839926 ) ) ( not ( = ?auto_839923 ?auto_839927 ) ) ( not ( = ?auto_839923 ?auto_839928 ) ) ( not ( = ?auto_839923 ?auto_839929 ) ) ( not ( = ?auto_839923 ?auto_839930 ) ) ( not ( = ?auto_839923 ?auto_839931 ) ) ( not ( = ?auto_839923 ?auto_839932 ) ) ( not ( = ?auto_839923 ?auto_839933 ) ) ( not ( = ?auto_839924 ?auto_839925 ) ) ( not ( = ?auto_839924 ?auto_839926 ) ) ( not ( = ?auto_839924 ?auto_839927 ) ) ( not ( = ?auto_839924 ?auto_839928 ) ) ( not ( = ?auto_839924 ?auto_839929 ) ) ( not ( = ?auto_839924 ?auto_839930 ) ) ( not ( = ?auto_839924 ?auto_839931 ) ) ( not ( = ?auto_839924 ?auto_839932 ) ) ( not ( = ?auto_839924 ?auto_839933 ) ) ( not ( = ?auto_839925 ?auto_839926 ) ) ( not ( = ?auto_839925 ?auto_839927 ) ) ( not ( = ?auto_839925 ?auto_839928 ) ) ( not ( = ?auto_839925 ?auto_839929 ) ) ( not ( = ?auto_839925 ?auto_839930 ) ) ( not ( = ?auto_839925 ?auto_839931 ) ) ( not ( = ?auto_839925 ?auto_839932 ) ) ( not ( = ?auto_839925 ?auto_839933 ) ) ( not ( = ?auto_839926 ?auto_839927 ) ) ( not ( = ?auto_839926 ?auto_839928 ) ) ( not ( = ?auto_839926 ?auto_839929 ) ) ( not ( = ?auto_839926 ?auto_839930 ) ) ( not ( = ?auto_839926 ?auto_839931 ) ) ( not ( = ?auto_839926 ?auto_839932 ) ) ( not ( = ?auto_839926 ?auto_839933 ) ) ( not ( = ?auto_839927 ?auto_839928 ) ) ( not ( = ?auto_839927 ?auto_839929 ) ) ( not ( = ?auto_839927 ?auto_839930 ) ) ( not ( = ?auto_839927 ?auto_839931 ) ) ( not ( = ?auto_839927 ?auto_839932 ) ) ( not ( = ?auto_839927 ?auto_839933 ) ) ( not ( = ?auto_839928 ?auto_839929 ) ) ( not ( = ?auto_839928 ?auto_839930 ) ) ( not ( = ?auto_839928 ?auto_839931 ) ) ( not ( = ?auto_839928 ?auto_839932 ) ) ( not ( = ?auto_839928 ?auto_839933 ) ) ( not ( = ?auto_839929 ?auto_839930 ) ) ( not ( = ?auto_839929 ?auto_839931 ) ) ( not ( = ?auto_839929 ?auto_839932 ) ) ( not ( = ?auto_839929 ?auto_839933 ) ) ( not ( = ?auto_839930 ?auto_839931 ) ) ( not ( = ?auto_839930 ?auto_839932 ) ) ( not ( = ?auto_839930 ?auto_839933 ) ) ( not ( = ?auto_839931 ?auto_839932 ) ) ( not ( = ?auto_839931 ?auto_839933 ) ) ( not ( = ?auto_839932 ?auto_839933 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_839932 ?auto_839933 )
      ( !STACK ?auto_839932 ?auto_839931 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_839977 - BLOCK
      ?auto_839978 - BLOCK
      ?auto_839979 - BLOCK
      ?auto_839980 - BLOCK
      ?auto_839981 - BLOCK
      ?auto_839982 - BLOCK
      ?auto_839983 - BLOCK
      ?auto_839984 - BLOCK
      ?auto_839985 - BLOCK
      ?auto_839986 - BLOCK
      ?auto_839987 - BLOCK
      ?auto_839988 - BLOCK
      ?auto_839989 - BLOCK
      ?auto_839990 - BLOCK
    )
    :vars
    (
      ?auto_839991 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_839990 ?auto_839991 ) ( ON-TABLE ?auto_839977 ) ( ON ?auto_839978 ?auto_839977 ) ( ON ?auto_839979 ?auto_839978 ) ( ON ?auto_839980 ?auto_839979 ) ( ON ?auto_839981 ?auto_839980 ) ( ON ?auto_839982 ?auto_839981 ) ( ON ?auto_839983 ?auto_839982 ) ( ON ?auto_839984 ?auto_839983 ) ( ON ?auto_839985 ?auto_839984 ) ( ON ?auto_839986 ?auto_839985 ) ( ON ?auto_839987 ?auto_839986 ) ( ON ?auto_839988 ?auto_839987 ) ( not ( = ?auto_839977 ?auto_839978 ) ) ( not ( = ?auto_839977 ?auto_839979 ) ) ( not ( = ?auto_839977 ?auto_839980 ) ) ( not ( = ?auto_839977 ?auto_839981 ) ) ( not ( = ?auto_839977 ?auto_839982 ) ) ( not ( = ?auto_839977 ?auto_839983 ) ) ( not ( = ?auto_839977 ?auto_839984 ) ) ( not ( = ?auto_839977 ?auto_839985 ) ) ( not ( = ?auto_839977 ?auto_839986 ) ) ( not ( = ?auto_839977 ?auto_839987 ) ) ( not ( = ?auto_839977 ?auto_839988 ) ) ( not ( = ?auto_839977 ?auto_839989 ) ) ( not ( = ?auto_839977 ?auto_839990 ) ) ( not ( = ?auto_839977 ?auto_839991 ) ) ( not ( = ?auto_839978 ?auto_839979 ) ) ( not ( = ?auto_839978 ?auto_839980 ) ) ( not ( = ?auto_839978 ?auto_839981 ) ) ( not ( = ?auto_839978 ?auto_839982 ) ) ( not ( = ?auto_839978 ?auto_839983 ) ) ( not ( = ?auto_839978 ?auto_839984 ) ) ( not ( = ?auto_839978 ?auto_839985 ) ) ( not ( = ?auto_839978 ?auto_839986 ) ) ( not ( = ?auto_839978 ?auto_839987 ) ) ( not ( = ?auto_839978 ?auto_839988 ) ) ( not ( = ?auto_839978 ?auto_839989 ) ) ( not ( = ?auto_839978 ?auto_839990 ) ) ( not ( = ?auto_839978 ?auto_839991 ) ) ( not ( = ?auto_839979 ?auto_839980 ) ) ( not ( = ?auto_839979 ?auto_839981 ) ) ( not ( = ?auto_839979 ?auto_839982 ) ) ( not ( = ?auto_839979 ?auto_839983 ) ) ( not ( = ?auto_839979 ?auto_839984 ) ) ( not ( = ?auto_839979 ?auto_839985 ) ) ( not ( = ?auto_839979 ?auto_839986 ) ) ( not ( = ?auto_839979 ?auto_839987 ) ) ( not ( = ?auto_839979 ?auto_839988 ) ) ( not ( = ?auto_839979 ?auto_839989 ) ) ( not ( = ?auto_839979 ?auto_839990 ) ) ( not ( = ?auto_839979 ?auto_839991 ) ) ( not ( = ?auto_839980 ?auto_839981 ) ) ( not ( = ?auto_839980 ?auto_839982 ) ) ( not ( = ?auto_839980 ?auto_839983 ) ) ( not ( = ?auto_839980 ?auto_839984 ) ) ( not ( = ?auto_839980 ?auto_839985 ) ) ( not ( = ?auto_839980 ?auto_839986 ) ) ( not ( = ?auto_839980 ?auto_839987 ) ) ( not ( = ?auto_839980 ?auto_839988 ) ) ( not ( = ?auto_839980 ?auto_839989 ) ) ( not ( = ?auto_839980 ?auto_839990 ) ) ( not ( = ?auto_839980 ?auto_839991 ) ) ( not ( = ?auto_839981 ?auto_839982 ) ) ( not ( = ?auto_839981 ?auto_839983 ) ) ( not ( = ?auto_839981 ?auto_839984 ) ) ( not ( = ?auto_839981 ?auto_839985 ) ) ( not ( = ?auto_839981 ?auto_839986 ) ) ( not ( = ?auto_839981 ?auto_839987 ) ) ( not ( = ?auto_839981 ?auto_839988 ) ) ( not ( = ?auto_839981 ?auto_839989 ) ) ( not ( = ?auto_839981 ?auto_839990 ) ) ( not ( = ?auto_839981 ?auto_839991 ) ) ( not ( = ?auto_839982 ?auto_839983 ) ) ( not ( = ?auto_839982 ?auto_839984 ) ) ( not ( = ?auto_839982 ?auto_839985 ) ) ( not ( = ?auto_839982 ?auto_839986 ) ) ( not ( = ?auto_839982 ?auto_839987 ) ) ( not ( = ?auto_839982 ?auto_839988 ) ) ( not ( = ?auto_839982 ?auto_839989 ) ) ( not ( = ?auto_839982 ?auto_839990 ) ) ( not ( = ?auto_839982 ?auto_839991 ) ) ( not ( = ?auto_839983 ?auto_839984 ) ) ( not ( = ?auto_839983 ?auto_839985 ) ) ( not ( = ?auto_839983 ?auto_839986 ) ) ( not ( = ?auto_839983 ?auto_839987 ) ) ( not ( = ?auto_839983 ?auto_839988 ) ) ( not ( = ?auto_839983 ?auto_839989 ) ) ( not ( = ?auto_839983 ?auto_839990 ) ) ( not ( = ?auto_839983 ?auto_839991 ) ) ( not ( = ?auto_839984 ?auto_839985 ) ) ( not ( = ?auto_839984 ?auto_839986 ) ) ( not ( = ?auto_839984 ?auto_839987 ) ) ( not ( = ?auto_839984 ?auto_839988 ) ) ( not ( = ?auto_839984 ?auto_839989 ) ) ( not ( = ?auto_839984 ?auto_839990 ) ) ( not ( = ?auto_839984 ?auto_839991 ) ) ( not ( = ?auto_839985 ?auto_839986 ) ) ( not ( = ?auto_839985 ?auto_839987 ) ) ( not ( = ?auto_839985 ?auto_839988 ) ) ( not ( = ?auto_839985 ?auto_839989 ) ) ( not ( = ?auto_839985 ?auto_839990 ) ) ( not ( = ?auto_839985 ?auto_839991 ) ) ( not ( = ?auto_839986 ?auto_839987 ) ) ( not ( = ?auto_839986 ?auto_839988 ) ) ( not ( = ?auto_839986 ?auto_839989 ) ) ( not ( = ?auto_839986 ?auto_839990 ) ) ( not ( = ?auto_839986 ?auto_839991 ) ) ( not ( = ?auto_839987 ?auto_839988 ) ) ( not ( = ?auto_839987 ?auto_839989 ) ) ( not ( = ?auto_839987 ?auto_839990 ) ) ( not ( = ?auto_839987 ?auto_839991 ) ) ( not ( = ?auto_839988 ?auto_839989 ) ) ( not ( = ?auto_839988 ?auto_839990 ) ) ( not ( = ?auto_839988 ?auto_839991 ) ) ( not ( = ?auto_839989 ?auto_839990 ) ) ( not ( = ?auto_839989 ?auto_839991 ) ) ( not ( = ?auto_839990 ?auto_839991 ) ) ( CLEAR ?auto_839988 ) ( ON ?auto_839989 ?auto_839990 ) ( CLEAR ?auto_839989 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_839977 ?auto_839978 ?auto_839979 ?auto_839980 ?auto_839981 ?auto_839982 ?auto_839983 ?auto_839984 ?auto_839985 ?auto_839986 ?auto_839987 ?auto_839988 ?auto_839989 )
      ( MAKE-14PILE ?auto_839977 ?auto_839978 ?auto_839979 ?auto_839980 ?auto_839981 ?auto_839982 ?auto_839983 ?auto_839984 ?auto_839985 ?auto_839986 ?auto_839987 ?auto_839988 ?auto_839989 ?auto_839990 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_840035 - BLOCK
      ?auto_840036 - BLOCK
      ?auto_840037 - BLOCK
      ?auto_840038 - BLOCK
      ?auto_840039 - BLOCK
      ?auto_840040 - BLOCK
      ?auto_840041 - BLOCK
      ?auto_840042 - BLOCK
      ?auto_840043 - BLOCK
      ?auto_840044 - BLOCK
      ?auto_840045 - BLOCK
      ?auto_840046 - BLOCK
      ?auto_840047 - BLOCK
      ?auto_840048 - BLOCK
    )
    :vars
    (
      ?auto_840049 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_840048 ?auto_840049 ) ( ON-TABLE ?auto_840035 ) ( ON ?auto_840036 ?auto_840035 ) ( ON ?auto_840037 ?auto_840036 ) ( ON ?auto_840038 ?auto_840037 ) ( ON ?auto_840039 ?auto_840038 ) ( ON ?auto_840040 ?auto_840039 ) ( ON ?auto_840041 ?auto_840040 ) ( ON ?auto_840042 ?auto_840041 ) ( ON ?auto_840043 ?auto_840042 ) ( ON ?auto_840044 ?auto_840043 ) ( ON ?auto_840045 ?auto_840044 ) ( not ( = ?auto_840035 ?auto_840036 ) ) ( not ( = ?auto_840035 ?auto_840037 ) ) ( not ( = ?auto_840035 ?auto_840038 ) ) ( not ( = ?auto_840035 ?auto_840039 ) ) ( not ( = ?auto_840035 ?auto_840040 ) ) ( not ( = ?auto_840035 ?auto_840041 ) ) ( not ( = ?auto_840035 ?auto_840042 ) ) ( not ( = ?auto_840035 ?auto_840043 ) ) ( not ( = ?auto_840035 ?auto_840044 ) ) ( not ( = ?auto_840035 ?auto_840045 ) ) ( not ( = ?auto_840035 ?auto_840046 ) ) ( not ( = ?auto_840035 ?auto_840047 ) ) ( not ( = ?auto_840035 ?auto_840048 ) ) ( not ( = ?auto_840035 ?auto_840049 ) ) ( not ( = ?auto_840036 ?auto_840037 ) ) ( not ( = ?auto_840036 ?auto_840038 ) ) ( not ( = ?auto_840036 ?auto_840039 ) ) ( not ( = ?auto_840036 ?auto_840040 ) ) ( not ( = ?auto_840036 ?auto_840041 ) ) ( not ( = ?auto_840036 ?auto_840042 ) ) ( not ( = ?auto_840036 ?auto_840043 ) ) ( not ( = ?auto_840036 ?auto_840044 ) ) ( not ( = ?auto_840036 ?auto_840045 ) ) ( not ( = ?auto_840036 ?auto_840046 ) ) ( not ( = ?auto_840036 ?auto_840047 ) ) ( not ( = ?auto_840036 ?auto_840048 ) ) ( not ( = ?auto_840036 ?auto_840049 ) ) ( not ( = ?auto_840037 ?auto_840038 ) ) ( not ( = ?auto_840037 ?auto_840039 ) ) ( not ( = ?auto_840037 ?auto_840040 ) ) ( not ( = ?auto_840037 ?auto_840041 ) ) ( not ( = ?auto_840037 ?auto_840042 ) ) ( not ( = ?auto_840037 ?auto_840043 ) ) ( not ( = ?auto_840037 ?auto_840044 ) ) ( not ( = ?auto_840037 ?auto_840045 ) ) ( not ( = ?auto_840037 ?auto_840046 ) ) ( not ( = ?auto_840037 ?auto_840047 ) ) ( not ( = ?auto_840037 ?auto_840048 ) ) ( not ( = ?auto_840037 ?auto_840049 ) ) ( not ( = ?auto_840038 ?auto_840039 ) ) ( not ( = ?auto_840038 ?auto_840040 ) ) ( not ( = ?auto_840038 ?auto_840041 ) ) ( not ( = ?auto_840038 ?auto_840042 ) ) ( not ( = ?auto_840038 ?auto_840043 ) ) ( not ( = ?auto_840038 ?auto_840044 ) ) ( not ( = ?auto_840038 ?auto_840045 ) ) ( not ( = ?auto_840038 ?auto_840046 ) ) ( not ( = ?auto_840038 ?auto_840047 ) ) ( not ( = ?auto_840038 ?auto_840048 ) ) ( not ( = ?auto_840038 ?auto_840049 ) ) ( not ( = ?auto_840039 ?auto_840040 ) ) ( not ( = ?auto_840039 ?auto_840041 ) ) ( not ( = ?auto_840039 ?auto_840042 ) ) ( not ( = ?auto_840039 ?auto_840043 ) ) ( not ( = ?auto_840039 ?auto_840044 ) ) ( not ( = ?auto_840039 ?auto_840045 ) ) ( not ( = ?auto_840039 ?auto_840046 ) ) ( not ( = ?auto_840039 ?auto_840047 ) ) ( not ( = ?auto_840039 ?auto_840048 ) ) ( not ( = ?auto_840039 ?auto_840049 ) ) ( not ( = ?auto_840040 ?auto_840041 ) ) ( not ( = ?auto_840040 ?auto_840042 ) ) ( not ( = ?auto_840040 ?auto_840043 ) ) ( not ( = ?auto_840040 ?auto_840044 ) ) ( not ( = ?auto_840040 ?auto_840045 ) ) ( not ( = ?auto_840040 ?auto_840046 ) ) ( not ( = ?auto_840040 ?auto_840047 ) ) ( not ( = ?auto_840040 ?auto_840048 ) ) ( not ( = ?auto_840040 ?auto_840049 ) ) ( not ( = ?auto_840041 ?auto_840042 ) ) ( not ( = ?auto_840041 ?auto_840043 ) ) ( not ( = ?auto_840041 ?auto_840044 ) ) ( not ( = ?auto_840041 ?auto_840045 ) ) ( not ( = ?auto_840041 ?auto_840046 ) ) ( not ( = ?auto_840041 ?auto_840047 ) ) ( not ( = ?auto_840041 ?auto_840048 ) ) ( not ( = ?auto_840041 ?auto_840049 ) ) ( not ( = ?auto_840042 ?auto_840043 ) ) ( not ( = ?auto_840042 ?auto_840044 ) ) ( not ( = ?auto_840042 ?auto_840045 ) ) ( not ( = ?auto_840042 ?auto_840046 ) ) ( not ( = ?auto_840042 ?auto_840047 ) ) ( not ( = ?auto_840042 ?auto_840048 ) ) ( not ( = ?auto_840042 ?auto_840049 ) ) ( not ( = ?auto_840043 ?auto_840044 ) ) ( not ( = ?auto_840043 ?auto_840045 ) ) ( not ( = ?auto_840043 ?auto_840046 ) ) ( not ( = ?auto_840043 ?auto_840047 ) ) ( not ( = ?auto_840043 ?auto_840048 ) ) ( not ( = ?auto_840043 ?auto_840049 ) ) ( not ( = ?auto_840044 ?auto_840045 ) ) ( not ( = ?auto_840044 ?auto_840046 ) ) ( not ( = ?auto_840044 ?auto_840047 ) ) ( not ( = ?auto_840044 ?auto_840048 ) ) ( not ( = ?auto_840044 ?auto_840049 ) ) ( not ( = ?auto_840045 ?auto_840046 ) ) ( not ( = ?auto_840045 ?auto_840047 ) ) ( not ( = ?auto_840045 ?auto_840048 ) ) ( not ( = ?auto_840045 ?auto_840049 ) ) ( not ( = ?auto_840046 ?auto_840047 ) ) ( not ( = ?auto_840046 ?auto_840048 ) ) ( not ( = ?auto_840046 ?auto_840049 ) ) ( not ( = ?auto_840047 ?auto_840048 ) ) ( not ( = ?auto_840047 ?auto_840049 ) ) ( not ( = ?auto_840048 ?auto_840049 ) ) ( ON ?auto_840047 ?auto_840048 ) ( CLEAR ?auto_840045 ) ( ON ?auto_840046 ?auto_840047 ) ( CLEAR ?auto_840046 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_840035 ?auto_840036 ?auto_840037 ?auto_840038 ?auto_840039 ?auto_840040 ?auto_840041 ?auto_840042 ?auto_840043 ?auto_840044 ?auto_840045 ?auto_840046 )
      ( MAKE-14PILE ?auto_840035 ?auto_840036 ?auto_840037 ?auto_840038 ?auto_840039 ?auto_840040 ?auto_840041 ?auto_840042 ?auto_840043 ?auto_840044 ?auto_840045 ?auto_840046 ?auto_840047 ?auto_840048 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_840093 - BLOCK
      ?auto_840094 - BLOCK
      ?auto_840095 - BLOCK
      ?auto_840096 - BLOCK
      ?auto_840097 - BLOCK
      ?auto_840098 - BLOCK
      ?auto_840099 - BLOCK
      ?auto_840100 - BLOCK
      ?auto_840101 - BLOCK
      ?auto_840102 - BLOCK
      ?auto_840103 - BLOCK
      ?auto_840104 - BLOCK
      ?auto_840105 - BLOCK
      ?auto_840106 - BLOCK
    )
    :vars
    (
      ?auto_840107 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_840106 ?auto_840107 ) ( ON-TABLE ?auto_840093 ) ( ON ?auto_840094 ?auto_840093 ) ( ON ?auto_840095 ?auto_840094 ) ( ON ?auto_840096 ?auto_840095 ) ( ON ?auto_840097 ?auto_840096 ) ( ON ?auto_840098 ?auto_840097 ) ( ON ?auto_840099 ?auto_840098 ) ( ON ?auto_840100 ?auto_840099 ) ( ON ?auto_840101 ?auto_840100 ) ( ON ?auto_840102 ?auto_840101 ) ( not ( = ?auto_840093 ?auto_840094 ) ) ( not ( = ?auto_840093 ?auto_840095 ) ) ( not ( = ?auto_840093 ?auto_840096 ) ) ( not ( = ?auto_840093 ?auto_840097 ) ) ( not ( = ?auto_840093 ?auto_840098 ) ) ( not ( = ?auto_840093 ?auto_840099 ) ) ( not ( = ?auto_840093 ?auto_840100 ) ) ( not ( = ?auto_840093 ?auto_840101 ) ) ( not ( = ?auto_840093 ?auto_840102 ) ) ( not ( = ?auto_840093 ?auto_840103 ) ) ( not ( = ?auto_840093 ?auto_840104 ) ) ( not ( = ?auto_840093 ?auto_840105 ) ) ( not ( = ?auto_840093 ?auto_840106 ) ) ( not ( = ?auto_840093 ?auto_840107 ) ) ( not ( = ?auto_840094 ?auto_840095 ) ) ( not ( = ?auto_840094 ?auto_840096 ) ) ( not ( = ?auto_840094 ?auto_840097 ) ) ( not ( = ?auto_840094 ?auto_840098 ) ) ( not ( = ?auto_840094 ?auto_840099 ) ) ( not ( = ?auto_840094 ?auto_840100 ) ) ( not ( = ?auto_840094 ?auto_840101 ) ) ( not ( = ?auto_840094 ?auto_840102 ) ) ( not ( = ?auto_840094 ?auto_840103 ) ) ( not ( = ?auto_840094 ?auto_840104 ) ) ( not ( = ?auto_840094 ?auto_840105 ) ) ( not ( = ?auto_840094 ?auto_840106 ) ) ( not ( = ?auto_840094 ?auto_840107 ) ) ( not ( = ?auto_840095 ?auto_840096 ) ) ( not ( = ?auto_840095 ?auto_840097 ) ) ( not ( = ?auto_840095 ?auto_840098 ) ) ( not ( = ?auto_840095 ?auto_840099 ) ) ( not ( = ?auto_840095 ?auto_840100 ) ) ( not ( = ?auto_840095 ?auto_840101 ) ) ( not ( = ?auto_840095 ?auto_840102 ) ) ( not ( = ?auto_840095 ?auto_840103 ) ) ( not ( = ?auto_840095 ?auto_840104 ) ) ( not ( = ?auto_840095 ?auto_840105 ) ) ( not ( = ?auto_840095 ?auto_840106 ) ) ( not ( = ?auto_840095 ?auto_840107 ) ) ( not ( = ?auto_840096 ?auto_840097 ) ) ( not ( = ?auto_840096 ?auto_840098 ) ) ( not ( = ?auto_840096 ?auto_840099 ) ) ( not ( = ?auto_840096 ?auto_840100 ) ) ( not ( = ?auto_840096 ?auto_840101 ) ) ( not ( = ?auto_840096 ?auto_840102 ) ) ( not ( = ?auto_840096 ?auto_840103 ) ) ( not ( = ?auto_840096 ?auto_840104 ) ) ( not ( = ?auto_840096 ?auto_840105 ) ) ( not ( = ?auto_840096 ?auto_840106 ) ) ( not ( = ?auto_840096 ?auto_840107 ) ) ( not ( = ?auto_840097 ?auto_840098 ) ) ( not ( = ?auto_840097 ?auto_840099 ) ) ( not ( = ?auto_840097 ?auto_840100 ) ) ( not ( = ?auto_840097 ?auto_840101 ) ) ( not ( = ?auto_840097 ?auto_840102 ) ) ( not ( = ?auto_840097 ?auto_840103 ) ) ( not ( = ?auto_840097 ?auto_840104 ) ) ( not ( = ?auto_840097 ?auto_840105 ) ) ( not ( = ?auto_840097 ?auto_840106 ) ) ( not ( = ?auto_840097 ?auto_840107 ) ) ( not ( = ?auto_840098 ?auto_840099 ) ) ( not ( = ?auto_840098 ?auto_840100 ) ) ( not ( = ?auto_840098 ?auto_840101 ) ) ( not ( = ?auto_840098 ?auto_840102 ) ) ( not ( = ?auto_840098 ?auto_840103 ) ) ( not ( = ?auto_840098 ?auto_840104 ) ) ( not ( = ?auto_840098 ?auto_840105 ) ) ( not ( = ?auto_840098 ?auto_840106 ) ) ( not ( = ?auto_840098 ?auto_840107 ) ) ( not ( = ?auto_840099 ?auto_840100 ) ) ( not ( = ?auto_840099 ?auto_840101 ) ) ( not ( = ?auto_840099 ?auto_840102 ) ) ( not ( = ?auto_840099 ?auto_840103 ) ) ( not ( = ?auto_840099 ?auto_840104 ) ) ( not ( = ?auto_840099 ?auto_840105 ) ) ( not ( = ?auto_840099 ?auto_840106 ) ) ( not ( = ?auto_840099 ?auto_840107 ) ) ( not ( = ?auto_840100 ?auto_840101 ) ) ( not ( = ?auto_840100 ?auto_840102 ) ) ( not ( = ?auto_840100 ?auto_840103 ) ) ( not ( = ?auto_840100 ?auto_840104 ) ) ( not ( = ?auto_840100 ?auto_840105 ) ) ( not ( = ?auto_840100 ?auto_840106 ) ) ( not ( = ?auto_840100 ?auto_840107 ) ) ( not ( = ?auto_840101 ?auto_840102 ) ) ( not ( = ?auto_840101 ?auto_840103 ) ) ( not ( = ?auto_840101 ?auto_840104 ) ) ( not ( = ?auto_840101 ?auto_840105 ) ) ( not ( = ?auto_840101 ?auto_840106 ) ) ( not ( = ?auto_840101 ?auto_840107 ) ) ( not ( = ?auto_840102 ?auto_840103 ) ) ( not ( = ?auto_840102 ?auto_840104 ) ) ( not ( = ?auto_840102 ?auto_840105 ) ) ( not ( = ?auto_840102 ?auto_840106 ) ) ( not ( = ?auto_840102 ?auto_840107 ) ) ( not ( = ?auto_840103 ?auto_840104 ) ) ( not ( = ?auto_840103 ?auto_840105 ) ) ( not ( = ?auto_840103 ?auto_840106 ) ) ( not ( = ?auto_840103 ?auto_840107 ) ) ( not ( = ?auto_840104 ?auto_840105 ) ) ( not ( = ?auto_840104 ?auto_840106 ) ) ( not ( = ?auto_840104 ?auto_840107 ) ) ( not ( = ?auto_840105 ?auto_840106 ) ) ( not ( = ?auto_840105 ?auto_840107 ) ) ( not ( = ?auto_840106 ?auto_840107 ) ) ( ON ?auto_840105 ?auto_840106 ) ( ON ?auto_840104 ?auto_840105 ) ( CLEAR ?auto_840102 ) ( ON ?auto_840103 ?auto_840104 ) ( CLEAR ?auto_840103 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_840093 ?auto_840094 ?auto_840095 ?auto_840096 ?auto_840097 ?auto_840098 ?auto_840099 ?auto_840100 ?auto_840101 ?auto_840102 ?auto_840103 )
      ( MAKE-14PILE ?auto_840093 ?auto_840094 ?auto_840095 ?auto_840096 ?auto_840097 ?auto_840098 ?auto_840099 ?auto_840100 ?auto_840101 ?auto_840102 ?auto_840103 ?auto_840104 ?auto_840105 ?auto_840106 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_840151 - BLOCK
      ?auto_840152 - BLOCK
      ?auto_840153 - BLOCK
      ?auto_840154 - BLOCK
      ?auto_840155 - BLOCK
      ?auto_840156 - BLOCK
      ?auto_840157 - BLOCK
      ?auto_840158 - BLOCK
      ?auto_840159 - BLOCK
      ?auto_840160 - BLOCK
      ?auto_840161 - BLOCK
      ?auto_840162 - BLOCK
      ?auto_840163 - BLOCK
      ?auto_840164 - BLOCK
    )
    :vars
    (
      ?auto_840165 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_840164 ?auto_840165 ) ( ON-TABLE ?auto_840151 ) ( ON ?auto_840152 ?auto_840151 ) ( ON ?auto_840153 ?auto_840152 ) ( ON ?auto_840154 ?auto_840153 ) ( ON ?auto_840155 ?auto_840154 ) ( ON ?auto_840156 ?auto_840155 ) ( ON ?auto_840157 ?auto_840156 ) ( ON ?auto_840158 ?auto_840157 ) ( ON ?auto_840159 ?auto_840158 ) ( not ( = ?auto_840151 ?auto_840152 ) ) ( not ( = ?auto_840151 ?auto_840153 ) ) ( not ( = ?auto_840151 ?auto_840154 ) ) ( not ( = ?auto_840151 ?auto_840155 ) ) ( not ( = ?auto_840151 ?auto_840156 ) ) ( not ( = ?auto_840151 ?auto_840157 ) ) ( not ( = ?auto_840151 ?auto_840158 ) ) ( not ( = ?auto_840151 ?auto_840159 ) ) ( not ( = ?auto_840151 ?auto_840160 ) ) ( not ( = ?auto_840151 ?auto_840161 ) ) ( not ( = ?auto_840151 ?auto_840162 ) ) ( not ( = ?auto_840151 ?auto_840163 ) ) ( not ( = ?auto_840151 ?auto_840164 ) ) ( not ( = ?auto_840151 ?auto_840165 ) ) ( not ( = ?auto_840152 ?auto_840153 ) ) ( not ( = ?auto_840152 ?auto_840154 ) ) ( not ( = ?auto_840152 ?auto_840155 ) ) ( not ( = ?auto_840152 ?auto_840156 ) ) ( not ( = ?auto_840152 ?auto_840157 ) ) ( not ( = ?auto_840152 ?auto_840158 ) ) ( not ( = ?auto_840152 ?auto_840159 ) ) ( not ( = ?auto_840152 ?auto_840160 ) ) ( not ( = ?auto_840152 ?auto_840161 ) ) ( not ( = ?auto_840152 ?auto_840162 ) ) ( not ( = ?auto_840152 ?auto_840163 ) ) ( not ( = ?auto_840152 ?auto_840164 ) ) ( not ( = ?auto_840152 ?auto_840165 ) ) ( not ( = ?auto_840153 ?auto_840154 ) ) ( not ( = ?auto_840153 ?auto_840155 ) ) ( not ( = ?auto_840153 ?auto_840156 ) ) ( not ( = ?auto_840153 ?auto_840157 ) ) ( not ( = ?auto_840153 ?auto_840158 ) ) ( not ( = ?auto_840153 ?auto_840159 ) ) ( not ( = ?auto_840153 ?auto_840160 ) ) ( not ( = ?auto_840153 ?auto_840161 ) ) ( not ( = ?auto_840153 ?auto_840162 ) ) ( not ( = ?auto_840153 ?auto_840163 ) ) ( not ( = ?auto_840153 ?auto_840164 ) ) ( not ( = ?auto_840153 ?auto_840165 ) ) ( not ( = ?auto_840154 ?auto_840155 ) ) ( not ( = ?auto_840154 ?auto_840156 ) ) ( not ( = ?auto_840154 ?auto_840157 ) ) ( not ( = ?auto_840154 ?auto_840158 ) ) ( not ( = ?auto_840154 ?auto_840159 ) ) ( not ( = ?auto_840154 ?auto_840160 ) ) ( not ( = ?auto_840154 ?auto_840161 ) ) ( not ( = ?auto_840154 ?auto_840162 ) ) ( not ( = ?auto_840154 ?auto_840163 ) ) ( not ( = ?auto_840154 ?auto_840164 ) ) ( not ( = ?auto_840154 ?auto_840165 ) ) ( not ( = ?auto_840155 ?auto_840156 ) ) ( not ( = ?auto_840155 ?auto_840157 ) ) ( not ( = ?auto_840155 ?auto_840158 ) ) ( not ( = ?auto_840155 ?auto_840159 ) ) ( not ( = ?auto_840155 ?auto_840160 ) ) ( not ( = ?auto_840155 ?auto_840161 ) ) ( not ( = ?auto_840155 ?auto_840162 ) ) ( not ( = ?auto_840155 ?auto_840163 ) ) ( not ( = ?auto_840155 ?auto_840164 ) ) ( not ( = ?auto_840155 ?auto_840165 ) ) ( not ( = ?auto_840156 ?auto_840157 ) ) ( not ( = ?auto_840156 ?auto_840158 ) ) ( not ( = ?auto_840156 ?auto_840159 ) ) ( not ( = ?auto_840156 ?auto_840160 ) ) ( not ( = ?auto_840156 ?auto_840161 ) ) ( not ( = ?auto_840156 ?auto_840162 ) ) ( not ( = ?auto_840156 ?auto_840163 ) ) ( not ( = ?auto_840156 ?auto_840164 ) ) ( not ( = ?auto_840156 ?auto_840165 ) ) ( not ( = ?auto_840157 ?auto_840158 ) ) ( not ( = ?auto_840157 ?auto_840159 ) ) ( not ( = ?auto_840157 ?auto_840160 ) ) ( not ( = ?auto_840157 ?auto_840161 ) ) ( not ( = ?auto_840157 ?auto_840162 ) ) ( not ( = ?auto_840157 ?auto_840163 ) ) ( not ( = ?auto_840157 ?auto_840164 ) ) ( not ( = ?auto_840157 ?auto_840165 ) ) ( not ( = ?auto_840158 ?auto_840159 ) ) ( not ( = ?auto_840158 ?auto_840160 ) ) ( not ( = ?auto_840158 ?auto_840161 ) ) ( not ( = ?auto_840158 ?auto_840162 ) ) ( not ( = ?auto_840158 ?auto_840163 ) ) ( not ( = ?auto_840158 ?auto_840164 ) ) ( not ( = ?auto_840158 ?auto_840165 ) ) ( not ( = ?auto_840159 ?auto_840160 ) ) ( not ( = ?auto_840159 ?auto_840161 ) ) ( not ( = ?auto_840159 ?auto_840162 ) ) ( not ( = ?auto_840159 ?auto_840163 ) ) ( not ( = ?auto_840159 ?auto_840164 ) ) ( not ( = ?auto_840159 ?auto_840165 ) ) ( not ( = ?auto_840160 ?auto_840161 ) ) ( not ( = ?auto_840160 ?auto_840162 ) ) ( not ( = ?auto_840160 ?auto_840163 ) ) ( not ( = ?auto_840160 ?auto_840164 ) ) ( not ( = ?auto_840160 ?auto_840165 ) ) ( not ( = ?auto_840161 ?auto_840162 ) ) ( not ( = ?auto_840161 ?auto_840163 ) ) ( not ( = ?auto_840161 ?auto_840164 ) ) ( not ( = ?auto_840161 ?auto_840165 ) ) ( not ( = ?auto_840162 ?auto_840163 ) ) ( not ( = ?auto_840162 ?auto_840164 ) ) ( not ( = ?auto_840162 ?auto_840165 ) ) ( not ( = ?auto_840163 ?auto_840164 ) ) ( not ( = ?auto_840163 ?auto_840165 ) ) ( not ( = ?auto_840164 ?auto_840165 ) ) ( ON ?auto_840163 ?auto_840164 ) ( ON ?auto_840162 ?auto_840163 ) ( ON ?auto_840161 ?auto_840162 ) ( CLEAR ?auto_840159 ) ( ON ?auto_840160 ?auto_840161 ) ( CLEAR ?auto_840160 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_840151 ?auto_840152 ?auto_840153 ?auto_840154 ?auto_840155 ?auto_840156 ?auto_840157 ?auto_840158 ?auto_840159 ?auto_840160 )
      ( MAKE-14PILE ?auto_840151 ?auto_840152 ?auto_840153 ?auto_840154 ?auto_840155 ?auto_840156 ?auto_840157 ?auto_840158 ?auto_840159 ?auto_840160 ?auto_840161 ?auto_840162 ?auto_840163 ?auto_840164 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_840209 - BLOCK
      ?auto_840210 - BLOCK
      ?auto_840211 - BLOCK
      ?auto_840212 - BLOCK
      ?auto_840213 - BLOCK
      ?auto_840214 - BLOCK
      ?auto_840215 - BLOCK
      ?auto_840216 - BLOCK
      ?auto_840217 - BLOCK
      ?auto_840218 - BLOCK
      ?auto_840219 - BLOCK
      ?auto_840220 - BLOCK
      ?auto_840221 - BLOCK
      ?auto_840222 - BLOCK
    )
    :vars
    (
      ?auto_840223 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_840222 ?auto_840223 ) ( ON-TABLE ?auto_840209 ) ( ON ?auto_840210 ?auto_840209 ) ( ON ?auto_840211 ?auto_840210 ) ( ON ?auto_840212 ?auto_840211 ) ( ON ?auto_840213 ?auto_840212 ) ( ON ?auto_840214 ?auto_840213 ) ( ON ?auto_840215 ?auto_840214 ) ( ON ?auto_840216 ?auto_840215 ) ( not ( = ?auto_840209 ?auto_840210 ) ) ( not ( = ?auto_840209 ?auto_840211 ) ) ( not ( = ?auto_840209 ?auto_840212 ) ) ( not ( = ?auto_840209 ?auto_840213 ) ) ( not ( = ?auto_840209 ?auto_840214 ) ) ( not ( = ?auto_840209 ?auto_840215 ) ) ( not ( = ?auto_840209 ?auto_840216 ) ) ( not ( = ?auto_840209 ?auto_840217 ) ) ( not ( = ?auto_840209 ?auto_840218 ) ) ( not ( = ?auto_840209 ?auto_840219 ) ) ( not ( = ?auto_840209 ?auto_840220 ) ) ( not ( = ?auto_840209 ?auto_840221 ) ) ( not ( = ?auto_840209 ?auto_840222 ) ) ( not ( = ?auto_840209 ?auto_840223 ) ) ( not ( = ?auto_840210 ?auto_840211 ) ) ( not ( = ?auto_840210 ?auto_840212 ) ) ( not ( = ?auto_840210 ?auto_840213 ) ) ( not ( = ?auto_840210 ?auto_840214 ) ) ( not ( = ?auto_840210 ?auto_840215 ) ) ( not ( = ?auto_840210 ?auto_840216 ) ) ( not ( = ?auto_840210 ?auto_840217 ) ) ( not ( = ?auto_840210 ?auto_840218 ) ) ( not ( = ?auto_840210 ?auto_840219 ) ) ( not ( = ?auto_840210 ?auto_840220 ) ) ( not ( = ?auto_840210 ?auto_840221 ) ) ( not ( = ?auto_840210 ?auto_840222 ) ) ( not ( = ?auto_840210 ?auto_840223 ) ) ( not ( = ?auto_840211 ?auto_840212 ) ) ( not ( = ?auto_840211 ?auto_840213 ) ) ( not ( = ?auto_840211 ?auto_840214 ) ) ( not ( = ?auto_840211 ?auto_840215 ) ) ( not ( = ?auto_840211 ?auto_840216 ) ) ( not ( = ?auto_840211 ?auto_840217 ) ) ( not ( = ?auto_840211 ?auto_840218 ) ) ( not ( = ?auto_840211 ?auto_840219 ) ) ( not ( = ?auto_840211 ?auto_840220 ) ) ( not ( = ?auto_840211 ?auto_840221 ) ) ( not ( = ?auto_840211 ?auto_840222 ) ) ( not ( = ?auto_840211 ?auto_840223 ) ) ( not ( = ?auto_840212 ?auto_840213 ) ) ( not ( = ?auto_840212 ?auto_840214 ) ) ( not ( = ?auto_840212 ?auto_840215 ) ) ( not ( = ?auto_840212 ?auto_840216 ) ) ( not ( = ?auto_840212 ?auto_840217 ) ) ( not ( = ?auto_840212 ?auto_840218 ) ) ( not ( = ?auto_840212 ?auto_840219 ) ) ( not ( = ?auto_840212 ?auto_840220 ) ) ( not ( = ?auto_840212 ?auto_840221 ) ) ( not ( = ?auto_840212 ?auto_840222 ) ) ( not ( = ?auto_840212 ?auto_840223 ) ) ( not ( = ?auto_840213 ?auto_840214 ) ) ( not ( = ?auto_840213 ?auto_840215 ) ) ( not ( = ?auto_840213 ?auto_840216 ) ) ( not ( = ?auto_840213 ?auto_840217 ) ) ( not ( = ?auto_840213 ?auto_840218 ) ) ( not ( = ?auto_840213 ?auto_840219 ) ) ( not ( = ?auto_840213 ?auto_840220 ) ) ( not ( = ?auto_840213 ?auto_840221 ) ) ( not ( = ?auto_840213 ?auto_840222 ) ) ( not ( = ?auto_840213 ?auto_840223 ) ) ( not ( = ?auto_840214 ?auto_840215 ) ) ( not ( = ?auto_840214 ?auto_840216 ) ) ( not ( = ?auto_840214 ?auto_840217 ) ) ( not ( = ?auto_840214 ?auto_840218 ) ) ( not ( = ?auto_840214 ?auto_840219 ) ) ( not ( = ?auto_840214 ?auto_840220 ) ) ( not ( = ?auto_840214 ?auto_840221 ) ) ( not ( = ?auto_840214 ?auto_840222 ) ) ( not ( = ?auto_840214 ?auto_840223 ) ) ( not ( = ?auto_840215 ?auto_840216 ) ) ( not ( = ?auto_840215 ?auto_840217 ) ) ( not ( = ?auto_840215 ?auto_840218 ) ) ( not ( = ?auto_840215 ?auto_840219 ) ) ( not ( = ?auto_840215 ?auto_840220 ) ) ( not ( = ?auto_840215 ?auto_840221 ) ) ( not ( = ?auto_840215 ?auto_840222 ) ) ( not ( = ?auto_840215 ?auto_840223 ) ) ( not ( = ?auto_840216 ?auto_840217 ) ) ( not ( = ?auto_840216 ?auto_840218 ) ) ( not ( = ?auto_840216 ?auto_840219 ) ) ( not ( = ?auto_840216 ?auto_840220 ) ) ( not ( = ?auto_840216 ?auto_840221 ) ) ( not ( = ?auto_840216 ?auto_840222 ) ) ( not ( = ?auto_840216 ?auto_840223 ) ) ( not ( = ?auto_840217 ?auto_840218 ) ) ( not ( = ?auto_840217 ?auto_840219 ) ) ( not ( = ?auto_840217 ?auto_840220 ) ) ( not ( = ?auto_840217 ?auto_840221 ) ) ( not ( = ?auto_840217 ?auto_840222 ) ) ( not ( = ?auto_840217 ?auto_840223 ) ) ( not ( = ?auto_840218 ?auto_840219 ) ) ( not ( = ?auto_840218 ?auto_840220 ) ) ( not ( = ?auto_840218 ?auto_840221 ) ) ( not ( = ?auto_840218 ?auto_840222 ) ) ( not ( = ?auto_840218 ?auto_840223 ) ) ( not ( = ?auto_840219 ?auto_840220 ) ) ( not ( = ?auto_840219 ?auto_840221 ) ) ( not ( = ?auto_840219 ?auto_840222 ) ) ( not ( = ?auto_840219 ?auto_840223 ) ) ( not ( = ?auto_840220 ?auto_840221 ) ) ( not ( = ?auto_840220 ?auto_840222 ) ) ( not ( = ?auto_840220 ?auto_840223 ) ) ( not ( = ?auto_840221 ?auto_840222 ) ) ( not ( = ?auto_840221 ?auto_840223 ) ) ( not ( = ?auto_840222 ?auto_840223 ) ) ( ON ?auto_840221 ?auto_840222 ) ( ON ?auto_840220 ?auto_840221 ) ( ON ?auto_840219 ?auto_840220 ) ( ON ?auto_840218 ?auto_840219 ) ( CLEAR ?auto_840216 ) ( ON ?auto_840217 ?auto_840218 ) ( CLEAR ?auto_840217 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_840209 ?auto_840210 ?auto_840211 ?auto_840212 ?auto_840213 ?auto_840214 ?auto_840215 ?auto_840216 ?auto_840217 )
      ( MAKE-14PILE ?auto_840209 ?auto_840210 ?auto_840211 ?auto_840212 ?auto_840213 ?auto_840214 ?auto_840215 ?auto_840216 ?auto_840217 ?auto_840218 ?auto_840219 ?auto_840220 ?auto_840221 ?auto_840222 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_840267 - BLOCK
      ?auto_840268 - BLOCK
      ?auto_840269 - BLOCK
      ?auto_840270 - BLOCK
      ?auto_840271 - BLOCK
      ?auto_840272 - BLOCK
      ?auto_840273 - BLOCK
      ?auto_840274 - BLOCK
      ?auto_840275 - BLOCK
      ?auto_840276 - BLOCK
      ?auto_840277 - BLOCK
      ?auto_840278 - BLOCK
      ?auto_840279 - BLOCK
      ?auto_840280 - BLOCK
    )
    :vars
    (
      ?auto_840281 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_840280 ?auto_840281 ) ( ON-TABLE ?auto_840267 ) ( ON ?auto_840268 ?auto_840267 ) ( ON ?auto_840269 ?auto_840268 ) ( ON ?auto_840270 ?auto_840269 ) ( ON ?auto_840271 ?auto_840270 ) ( ON ?auto_840272 ?auto_840271 ) ( ON ?auto_840273 ?auto_840272 ) ( not ( = ?auto_840267 ?auto_840268 ) ) ( not ( = ?auto_840267 ?auto_840269 ) ) ( not ( = ?auto_840267 ?auto_840270 ) ) ( not ( = ?auto_840267 ?auto_840271 ) ) ( not ( = ?auto_840267 ?auto_840272 ) ) ( not ( = ?auto_840267 ?auto_840273 ) ) ( not ( = ?auto_840267 ?auto_840274 ) ) ( not ( = ?auto_840267 ?auto_840275 ) ) ( not ( = ?auto_840267 ?auto_840276 ) ) ( not ( = ?auto_840267 ?auto_840277 ) ) ( not ( = ?auto_840267 ?auto_840278 ) ) ( not ( = ?auto_840267 ?auto_840279 ) ) ( not ( = ?auto_840267 ?auto_840280 ) ) ( not ( = ?auto_840267 ?auto_840281 ) ) ( not ( = ?auto_840268 ?auto_840269 ) ) ( not ( = ?auto_840268 ?auto_840270 ) ) ( not ( = ?auto_840268 ?auto_840271 ) ) ( not ( = ?auto_840268 ?auto_840272 ) ) ( not ( = ?auto_840268 ?auto_840273 ) ) ( not ( = ?auto_840268 ?auto_840274 ) ) ( not ( = ?auto_840268 ?auto_840275 ) ) ( not ( = ?auto_840268 ?auto_840276 ) ) ( not ( = ?auto_840268 ?auto_840277 ) ) ( not ( = ?auto_840268 ?auto_840278 ) ) ( not ( = ?auto_840268 ?auto_840279 ) ) ( not ( = ?auto_840268 ?auto_840280 ) ) ( not ( = ?auto_840268 ?auto_840281 ) ) ( not ( = ?auto_840269 ?auto_840270 ) ) ( not ( = ?auto_840269 ?auto_840271 ) ) ( not ( = ?auto_840269 ?auto_840272 ) ) ( not ( = ?auto_840269 ?auto_840273 ) ) ( not ( = ?auto_840269 ?auto_840274 ) ) ( not ( = ?auto_840269 ?auto_840275 ) ) ( not ( = ?auto_840269 ?auto_840276 ) ) ( not ( = ?auto_840269 ?auto_840277 ) ) ( not ( = ?auto_840269 ?auto_840278 ) ) ( not ( = ?auto_840269 ?auto_840279 ) ) ( not ( = ?auto_840269 ?auto_840280 ) ) ( not ( = ?auto_840269 ?auto_840281 ) ) ( not ( = ?auto_840270 ?auto_840271 ) ) ( not ( = ?auto_840270 ?auto_840272 ) ) ( not ( = ?auto_840270 ?auto_840273 ) ) ( not ( = ?auto_840270 ?auto_840274 ) ) ( not ( = ?auto_840270 ?auto_840275 ) ) ( not ( = ?auto_840270 ?auto_840276 ) ) ( not ( = ?auto_840270 ?auto_840277 ) ) ( not ( = ?auto_840270 ?auto_840278 ) ) ( not ( = ?auto_840270 ?auto_840279 ) ) ( not ( = ?auto_840270 ?auto_840280 ) ) ( not ( = ?auto_840270 ?auto_840281 ) ) ( not ( = ?auto_840271 ?auto_840272 ) ) ( not ( = ?auto_840271 ?auto_840273 ) ) ( not ( = ?auto_840271 ?auto_840274 ) ) ( not ( = ?auto_840271 ?auto_840275 ) ) ( not ( = ?auto_840271 ?auto_840276 ) ) ( not ( = ?auto_840271 ?auto_840277 ) ) ( not ( = ?auto_840271 ?auto_840278 ) ) ( not ( = ?auto_840271 ?auto_840279 ) ) ( not ( = ?auto_840271 ?auto_840280 ) ) ( not ( = ?auto_840271 ?auto_840281 ) ) ( not ( = ?auto_840272 ?auto_840273 ) ) ( not ( = ?auto_840272 ?auto_840274 ) ) ( not ( = ?auto_840272 ?auto_840275 ) ) ( not ( = ?auto_840272 ?auto_840276 ) ) ( not ( = ?auto_840272 ?auto_840277 ) ) ( not ( = ?auto_840272 ?auto_840278 ) ) ( not ( = ?auto_840272 ?auto_840279 ) ) ( not ( = ?auto_840272 ?auto_840280 ) ) ( not ( = ?auto_840272 ?auto_840281 ) ) ( not ( = ?auto_840273 ?auto_840274 ) ) ( not ( = ?auto_840273 ?auto_840275 ) ) ( not ( = ?auto_840273 ?auto_840276 ) ) ( not ( = ?auto_840273 ?auto_840277 ) ) ( not ( = ?auto_840273 ?auto_840278 ) ) ( not ( = ?auto_840273 ?auto_840279 ) ) ( not ( = ?auto_840273 ?auto_840280 ) ) ( not ( = ?auto_840273 ?auto_840281 ) ) ( not ( = ?auto_840274 ?auto_840275 ) ) ( not ( = ?auto_840274 ?auto_840276 ) ) ( not ( = ?auto_840274 ?auto_840277 ) ) ( not ( = ?auto_840274 ?auto_840278 ) ) ( not ( = ?auto_840274 ?auto_840279 ) ) ( not ( = ?auto_840274 ?auto_840280 ) ) ( not ( = ?auto_840274 ?auto_840281 ) ) ( not ( = ?auto_840275 ?auto_840276 ) ) ( not ( = ?auto_840275 ?auto_840277 ) ) ( not ( = ?auto_840275 ?auto_840278 ) ) ( not ( = ?auto_840275 ?auto_840279 ) ) ( not ( = ?auto_840275 ?auto_840280 ) ) ( not ( = ?auto_840275 ?auto_840281 ) ) ( not ( = ?auto_840276 ?auto_840277 ) ) ( not ( = ?auto_840276 ?auto_840278 ) ) ( not ( = ?auto_840276 ?auto_840279 ) ) ( not ( = ?auto_840276 ?auto_840280 ) ) ( not ( = ?auto_840276 ?auto_840281 ) ) ( not ( = ?auto_840277 ?auto_840278 ) ) ( not ( = ?auto_840277 ?auto_840279 ) ) ( not ( = ?auto_840277 ?auto_840280 ) ) ( not ( = ?auto_840277 ?auto_840281 ) ) ( not ( = ?auto_840278 ?auto_840279 ) ) ( not ( = ?auto_840278 ?auto_840280 ) ) ( not ( = ?auto_840278 ?auto_840281 ) ) ( not ( = ?auto_840279 ?auto_840280 ) ) ( not ( = ?auto_840279 ?auto_840281 ) ) ( not ( = ?auto_840280 ?auto_840281 ) ) ( ON ?auto_840279 ?auto_840280 ) ( ON ?auto_840278 ?auto_840279 ) ( ON ?auto_840277 ?auto_840278 ) ( ON ?auto_840276 ?auto_840277 ) ( ON ?auto_840275 ?auto_840276 ) ( CLEAR ?auto_840273 ) ( ON ?auto_840274 ?auto_840275 ) ( CLEAR ?auto_840274 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_840267 ?auto_840268 ?auto_840269 ?auto_840270 ?auto_840271 ?auto_840272 ?auto_840273 ?auto_840274 )
      ( MAKE-14PILE ?auto_840267 ?auto_840268 ?auto_840269 ?auto_840270 ?auto_840271 ?auto_840272 ?auto_840273 ?auto_840274 ?auto_840275 ?auto_840276 ?auto_840277 ?auto_840278 ?auto_840279 ?auto_840280 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_840325 - BLOCK
      ?auto_840326 - BLOCK
      ?auto_840327 - BLOCK
      ?auto_840328 - BLOCK
      ?auto_840329 - BLOCK
      ?auto_840330 - BLOCK
      ?auto_840331 - BLOCK
      ?auto_840332 - BLOCK
      ?auto_840333 - BLOCK
      ?auto_840334 - BLOCK
      ?auto_840335 - BLOCK
      ?auto_840336 - BLOCK
      ?auto_840337 - BLOCK
      ?auto_840338 - BLOCK
    )
    :vars
    (
      ?auto_840339 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_840338 ?auto_840339 ) ( ON-TABLE ?auto_840325 ) ( ON ?auto_840326 ?auto_840325 ) ( ON ?auto_840327 ?auto_840326 ) ( ON ?auto_840328 ?auto_840327 ) ( ON ?auto_840329 ?auto_840328 ) ( ON ?auto_840330 ?auto_840329 ) ( not ( = ?auto_840325 ?auto_840326 ) ) ( not ( = ?auto_840325 ?auto_840327 ) ) ( not ( = ?auto_840325 ?auto_840328 ) ) ( not ( = ?auto_840325 ?auto_840329 ) ) ( not ( = ?auto_840325 ?auto_840330 ) ) ( not ( = ?auto_840325 ?auto_840331 ) ) ( not ( = ?auto_840325 ?auto_840332 ) ) ( not ( = ?auto_840325 ?auto_840333 ) ) ( not ( = ?auto_840325 ?auto_840334 ) ) ( not ( = ?auto_840325 ?auto_840335 ) ) ( not ( = ?auto_840325 ?auto_840336 ) ) ( not ( = ?auto_840325 ?auto_840337 ) ) ( not ( = ?auto_840325 ?auto_840338 ) ) ( not ( = ?auto_840325 ?auto_840339 ) ) ( not ( = ?auto_840326 ?auto_840327 ) ) ( not ( = ?auto_840326 ?auto_840328 ) ) ( not ( = ?auto_840326 ?auto_840329 ) ) ( not ( = ?auto_840326 ?auto_840330 ) ) ( not ( = ?auto_840326 ?auto_840331 ) ) ( not ( = ?auto_840326 ?auto_840332 ) ) ( not ( = ?auto_840326 ?auto_840333 ) ) ( not ( = ?auto_840326 ?auto_840334 ) ) ( not ( = ?auto_840326 ?auto_840335 ) ) ( not ( = ?auto_840326 ?auto_840336 ) ) ( not ( = ?auto_840326 ?auto_840337 ) ) ( not ( = ?auto_840326 ?auto_840338 ) ) ( not ( = ?auto_840326 ?auto_840339 ) ) ( not ( = ?auto_840327 ?auto_840328 ) ) ( not ( = ?auto_840327 ?auto_840329 ) ) ( not ( = ?auto_840327 ?auto_840330 ) ) ( not ( = ?auto_840327 ?auto_840331 ) ) ( not ( = ?auto_840327 ?auto_840332 ) ) ( not ( = ?auto_840327 ?auto_840333 ) ) ( not ( = ?auto_840327 ?auto_840334 ) ) ( not ( = ?auto_840327 ?auto_840335 ) ) ( not ( = ?auto_840327 ?auto_840336 ) ) ( not ( = ?auto_840327 ?auto_840337 ) ) ( not ( = ?auto_840327 ?auto_840338 ) ) ( not ( = ?auto_840327 ?auto_840339 ) ) ( not ( = ?auto_840328 ?auto_840329 ) ) ( not ( = ?auto_840328 ?auto_840330 ) ) ( not ( = ?auto_840328 ?auto_840331 ) ) ( not ( = ?auto_840328 ?auto_840332 ) ) ( not ( = ?auto_840328 ?auto_840333 ) ) ( not ( = ?auto_840328 ?auto_840334 ) ) ( not ( = ?auto_840328 ?auto_840335 ) ) ( not ( = ?auto_840328 ?auto_840336 ) ) ( not ( = ?auto_840328 ?auto_840337 ) ) ( not ( = ?auto_840328 ?auto_840338 ) ) ( not ( = ?auto_840328 ?auto_840339 ) ) ( not ( = ?auto_840329 ?auto_840330 ) ) ( not ( = ?auto_840329 ?auto_840331 ) ) ( not ( = ?auto_840329 ?auto_840332 ) ) ( not ( = ?auto_840329 ?auto_840333 ) ) ( not ( = ?auto_840329 ?auto_840334 ) ) ( not ( = ?auto_840329 ?auto_840335 ) ) ( not ( = ?auto_840329 ?auto_840336 ) ) ( not ( = ?auto_840329 ?auto_840337 ) ) ( not ( = ?auto_840329 ?auto_840338 ) ) ( not ( = ?auto_840329 ?auto_840339 ) ) ( not ( = ?auto_840330 ?auto_840331 ) ) ( not ( = ?auto_840330 ?auto_840332 ) ) ( not ( = ?auto_840330 ?auto_840333 ) ) ( not ( = ?auto_840330 ?auto_840334 ) ) ( not ( = ?auto_840330 ?auto_840335 ) ) ( not ( = ?auto_840330 ?auto_840336 ) ) ( not ( = ?auto_840330 ?auto_840337 ) ) ( not ( = ?auto_840330 ?auto_840338 ) ) ( not ( = ?auto_840330 ?auto_840339 ) ) ( not ( = ?auto_840331 ?auto_840332 ) ) ( not ( = ?auto_840331 ?auto_840333 ) ) ( not ( = ?auto_840331 ?auto_840334 ) ) ( not ( = ?auto_840331 ?auto_840335 ) ) ( not ( = ?auto_840331 ?auto_840336 ) ) ( not ( = ?auto_840331 ?auto_840337 ) ) ( not ( = ?auto_840331 ?auto_840338 ) ) ( not ( = ?auto_840331 ?auto_840339 ) ) ( not ( = ?auto_840332 ?auto_840333 ) ) ( not ( = ?auto_840332 ?auto_840334 ) ) ( not ( = ?auto_840332 ?auto_840335 ) ) ( not ( = ?auto_840332 ?auto_840336 ) ) ( not ( = ?auto_840332 ?auto_840337 ) ) ( not ( = ?auto_840332 ?auto_840338 ) ) ( not ( = ?auto_840332 ?auto_840339 ) ) ( not ( = ?auto_840333 ?auto_840334 ) ) ( not ( = ?auto_840333 ?auto_840335 ) ) ( not ( = ?auto_840333 ?auto_840336 ) ) ( not ( = ?auto_840333 ?auto_840337 ) ) ( not ( = ?auto_840333 ?auto_840338 ) ) ( not ( = ?auto_840333 ?auto_840339 ) ) ( not ( = ?auto_840334 ?auto_840335 ) ) ( not ( = ?auto_840334 ?auto_840336 ) ) ( not ( = ?auto_840334 ?auto_840337 ) ) ( not ( = ?auto_840334 ?auto_840338 ) ) ( not ( = ?auto_840334 ?auto_840339 ) ) ( not ( = ?auto_840335 ?auto_840336 ) ) ( not ( = ?auto_840335 ?auto_840337 ) ) ( not ( = ?auto_840335 ?auto_840338 ) ) ( not ( = ?auto_840335 ?auto_840339 ) ) ( not ( = ?auto_840336 ?auto_840337 ) ) ( not ( = ?auto_840336 ?auto_840338 ) ) ( not ( = ?auto_840336 ?auto_840339 ) ) ( not ( = ?auto_840337 ?auto_840338 ) ) ( not ( = ?auto_840337 ?auto_840339 ) ) ( not ( = ?auto_840338 ?auto_840339 ) ) ( ON ?auto_840337 ?auto_840338 ) ( ON ?auto_840336 ?auto_840337 ) ( ON ?auto_840335 ?auto_840336 ) ( ON ?auto_840334 ?auto_840335 ) ( ON ?auto_840333 ?auto_840334 ) ( ON ?auto_840332 ?auto_840333 ) ( CLEAR ?auto_840330 ) ( ON ?auto_840331 ?auto_840332 ) ( CLEAR ?auto_840331 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_840325 ?auto_840326 ?auto_840327 ?auto_840328 ?auto_840329 ?auto_840330 ?auto_840331 )
      ( MAKE-14PILE ?auto_840325 ?auto_840326 ?auto_840327 ?auto_840328 ?auto_840329 ?auto_840330 ?auto_840331 ?auto_840332 ?auto_840333 ?auto_840334 ?auto_840335 ?auto_840336 ?auto_840337 ?auto_840338 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_840383 - BLOCK
      ?auto_840384 - BLOCK
      ?auto_840385 - BLOCK
      ?auto_840386 - BLOCK
      ?auto_840387 - BLOCK
      ?auto_840388 - BLOCK
      ?auto_840389 - BLOCK
      ?auto_840390 - BLOCK
      ?auto_840391 - BLOCK
      ?auto_840392 - BLOCK
      ?auto_840393 - BLOCK
      ?auto_840394 - BLOCK
      ?auto_840395 - BLOCK
      ?auto_840396 - BLOCK
    )
    :vars
    (
      ?auto_840397 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_840396 ?auto_840397 ) ( ON-TABLE ?auto_840383 ) ( ON ?auto_840384 ?auto_840383 ) ( ON ?auto_840385 ?auto_840384 ) ( ON ?auto_840386 ?auto_840385 ) ( ON ?auto_840387 ?auto_840386 ) ( not ( = ?auto_840383 ?auto_840384 ) ) ( not ( = ?auto_840383 ?auto_840385 ) ) ( not ( = ?auto_840383 ?auto_840386 ) ) ( not ( = ?auto_840383 ?auto_840387 ) ) ( not ( = ?auto_840383 ?auto_840388 ) ) ( not ( = ?auto_840383 ?auto_840389 ) ) ( not ( = ?auto_840383 ?auto_840390 ) ) ( not ( = ?auto_840383 ?auto_840391 ) ) ( not ( = ?auto_840383 ?auto_840392 ) ) ( not ( = ?auto_840383 ?auto_840393 ) ) ( not ( = ?auto_840383 ?auto_840394 ) ) ( not ( = ?auto_840383 ?auto_840395 ) ) ( not ( = ?auto_840383 ?auto_840396 ) ) ( not ( = ?auto_840383 ?auto_840397 ) ) ( not ( = ?auto_840384 ?auto_840385 ) ) ( not ( = ?auto_840384 ?auto_840386 ) ) ( not ( = ?auto_840384 ?auto_840387 ) ) ( not ( = ?auto_840384 ?auto_840388 ) ) ( not ( = ?auto_840384 ?auto_840389 ) ) ( not ( = ?auto_840384 ?auto_840390 ) ) ( not ( = ?auto_840384 ?auto_840391 ) ) ( not ( = ?auto_840384 ?auto_840392 ) ) ( not ( = ?auto_840384 ?auto_840393 ) ) ( not ( = ?auto_840384 ?auto_840394 ) ) ( not ( = ?auto_840384 ?auto_840395 ) ) ( not ( = ?auto_840384 ?auto_840396 ) ) ( not ( = ?auto_840384 ?auto_840397 ) ) ( not ( = ?auto_840385 ?auto_840386 ) ) ( not ( = ?auto_840385 ?auto_840387 ) ) ( not ( = ?auto_840385 ?auto_840388 ) ) ( not ( = ?auto_840385 ?auto_840389 ) ) ( not ( = ?auto_840385 ?auto_840390 ) ) ( not ( = ?auto_840385 ?auto_840391 ) ) ( not ( = ?auto_840385 ?auto_840392 ) ) ( not ( = ?auto_840385 ?auto_840393 ) ) ( not ( = ?auto_840385 ?auto_840394 ) ) ( not ( = ?auto_840385 ?auto_840395 ) ) ( not ( = ?auto_840385 ?auto_840396 ) ) ( not ( = ?auto_840385 ?auto_840397 ) ) ( not ( = ?auto_840386 ?auto_840387 ) ) ( not ( = ?auto_840386 ?auto_840388 ) ) ( not ( = ?auto_840386 ?auto_840389 ) ) ( not ( = ?auto_840386 ?auto_840390 ) ) ( not ( = ?auto_840386 ?auto_840391 ) ) ( not ( = ?auto_840386 ?auto_840392 ) ) ( not ( = ?auto_840386 ?auto_840393 ) ) ( not ( = ?auto_840386 ?auto_840394 ) ) ( not ( = ?auto_840386 ?auto_840395 ) ) ( not ( = ?auto_840386 ?auto_840396 ) ) ( not ( = ?auto_840386 ?auto_840397 ) ) ( not ( = ?auto_840387 ?auto_840388 ) ) ( not ( = ?auto_840387 ?auto_840389 ) ) ( not ( = ?auto_840387 ?auto_840390 ) ) ( not ( = ?auto_840387 ?auto_840391 ) ) ( not ( = ?auto_840387 ?auto_840392 ) ) ( not ( = ?auto_840387 ?auto_840393 ) ) ( not ( = ?auto_840387 ?auto_840394 ) ) ( not ( = ?auto_840387 ?auto_840395 ) ) ( not ( = ?auto_840387 ?auto_840396 ) ) ( not ( = ?auto_840387 ?auto_840397 ) ) ( not ( = ?auto_840388 ?auto_840389 ) ) ( not ( = ?auto_840388 ?auto_840390 ) ) ( not ( = ?auto_840388 ?auto_840391 ) ) ( not ( = ?auto_840388 ?auto_840392 ) ) ( not ( = ?auto_840388 ?auto_840393 ) ) ( not ( = ?auto_840388 ?auto_840394 ) ) ( not ( = ?auto_840388 ?auto_840395 ) ) ( not ( = ?auto_840388 ?auto_840396 ) ) ( not ( = ?auto_840388 ?auto_840397 ) ) ( not ( = ?auto_840389 ?auto_840390 ) ) ( not ( = ?auto_840389 ?auto_840391 ) ) ( not ( = ?auto_840389 ?auto_840392 ) ) ( not ( = ?auto_840389 ?auto_840393 ) ) ( not ( = ?auto_840389 ?auto_840394 ) ) ( not ( = ?auto_840389 ?auto_840395 ) ) ( not ( = ?auto_840389 ?auto_840396 ) ) ( not ( = ?auto_840389 ?auto_840397 ) ) ( not ( = ?auto_840390 ?auto_840391 ) ) ( not ( = ?auto_840390 ?auto_840392 ) ) ( not ( = ?auto_840390 ?auto_840393 ) ) ( not ( = ?auto_840390 ?auto_840394 ) ) ( not ( = ?auto_840390 ?auto_840395 ) ) ( not ( = ?auto_840390 ?auto_840396 ) ) ( not ( = ?auto_840390 ?auto_840397 ) ) ( not ( = ?auto_840391 ?auto_840392 ) ) ( not ( = ?auto_840391 ?auto_840393 ) ) ( not ( = ?auto_840391 ?auto_840394 ) ) ( not ( = ?auto_840391 ?auto_840395 ) ) ( not ( = ?auto_840391 ?auto_840396 ) ) ( not ( = ?auto_840391 ?auto_840397 ) ) ( not ( = ?auto_840392 ?auto_840393 ) ) ( not ( = ?auto_840392 ?auto_840394 ) ) ( not ( = ?auto_840392 ?auto_840395 ) ) ( not ( = ?auto_840392 ?auto_840396 ) ) ( not ( = ?auto_840392 ?auto_840397 ) ) ( not ( = ?auto_840393 ?auto_840394 ) ) ( not ( = ?auto_840393 ?auto_840395 ) ) ( not ( = ?auto_840393 ?auto_840396 ) ) ( not ( = ?auto_840393 ?auto_840397 ) ) ( not ( = ?auto_840394 ?auto_840395 ) ) ( not ( = ?auto_840394 ?auto_840396 ) ) ( not ( = ?auto_840394 ?auto_840397 ) ) ( not ( = ?auto_840395 ?auto_840396 ) ) ( not ( = ?auto_840395 ?auto_840397 ) ) ( not ( = ?auto_840396 ?auto_840397 ) ) ( ON ?auto_840395 ?auto_840396 ) ( ON ?auto_840394 ?auto_840395 ) ( ON ?auto_840393 ?auto_840394 ) ( ON ?auto_840392 ?auto_840393 ) ( ON ?auto_840391 ?auto_840392 ) ( ON ?auto_840390 ?auto_840391 ) ( ON ?auto_840389 ?auto_840390 ) ( CLEAR ?auto_840387 ) ( ON ?auto_840388 ?auto_840389 ) ( CLEAR ?auto_840388 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_840383 ?auto_840384 ?auto_840385 ?auto_840386 ?auto_840387 ?auto_840388 )
      ( MAKE-14PILE ?auto_840383 ?auto_840384 ?auto_840385 ?auto_840386 ?auto_840387 ?auto_840388 ?auto_840389 ?auto_840390 ?auto_840391 ?auto_840392 ?auto_840393 ?auto_840394 ?auto_840395 ?auto_840396 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_840441 - BLOCK
      ?auto_840442 - BLOCK
      ?auto_840443 - BLOCK
      ?auto_840444 - BLOCK
      ?auto_840445 - BLOCK
      ?auto_840446 - BLOCK
      ?auto_840447 - BLOCK
      ?auto_840448 - BLOCK
      ?auto_840449 - BLOCK
      ?auto_840450 - BLOCK
      ?auto_840451 - BLOCK
      ?auto_840452 - BLOCK
      ?auto_840453 - BLOCK
      ?auto_840454 - BLOCK
    )
    :vars
    (
      ?auto_840455 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_840454 ?auto_840455 ) ( ON-TABLE ?auto_840441 ) ( ON ?auto_840442 ?auto_840441 ) ( ON ?auto_840443 ?auto_840442 ) ( ON ?auto_840444 ?auto_840443 ) ( not ( = ?auto_840441 ?auto_840442 ) ) ( not ( = ?auto_840441 ?auto_840443 ) ) ( not ( = ?auto_840441 ?auto_840444 ) ) ( not ( = ?auto_840441 ?auto_840445 ) ) ( not ( = ?auto_840441 ?auto_840446 ) ) ( not ( = ?auto_840441 ?auto_840447 ) ) ( not ( = ?auto_840441 ?auto_840448 ) ) ( not ( = ?auto_840441 ?auto_840449 ) ) ( not ( = ?auto_840441 ?auto_840450 ) ) ( not ( = ?auto_840441 ?auto_840451 ) ) ( not ( = ?auto_840441 ?auto_840452 ) ) ( not ( = ?auto_840441 ?auto_840453 ) ) ( not ( = ?auto_840441 ?auto_840454 ) ) ( not ( = ?auto_840441 ?auto_840455 ) ) ( not ( = ?auto_840442 ?auto_840443 ) ) ( not ( = ?auto_840442 ?auto_840444 ) ) ( not ( = ?auto_840442 ?auto_840445 ) ) ( not ( = ?auto_840442 ?auto_840446 ) ) ( not ( = ?auto_840442 ?auto_840447 ) ) ( not ( = ?auto_840442 ?auto_840448 ) ) ( not ( = ?auto_840442 ?auto_840449 ) ) ( not ( = ?auto_840442 ?auto_840450 ) ) ( not ( = ?auto_840442 ?auto_840451 ) ) ( not ( = ?auto_840442 ?auto_840452 ) ) ( not ( = ?auto_840442 ?auto_840453 ) ) ( not ( = ?auto_840442 ?auto_840454 ) ) ( not ( = ?auto_840442 ?auto_840455 ) ) ( not ( = ?auto_840443 ?auto_840444 ) ) ( not ( = ?auto_840443 ?auto_840445 ) ) ( not ( = ?auto_840443 ?auto_840446 ) ) ( not ( = ?auto_840443 ?auto_840447 ) ) ( not ( = ?auto_840443 ?auto_840448 ) ) ( not ( = ?auto_840443 ?auto_840449 ) ) ( not ( = ?auto_840443 ?auto_840450 ) ) ( not ( = ?auto_840443 ?auto_840451 ) ) ( not ( = ?auto_840443 ?auto_840452 ) ) ( not ( = ?auto_840443 ?auto_840453 ) ) ( not ( = ?auto_840443 ?auto_840454 ) ) ( not ( = ?auto_840443 ?auto_840455 ) ) ( not ( = ?auto_840444 ?auto_840445 ) ) ( not ( = ?auto_840444 ?auto_840446 ) ) ( not ( = ?auto_840444 ?auto_840447 ) ) ( not ( = ?auto_840444 ?auto_840448 ) ) ( not ( = ?auto_840444 ?auto_840449 ) ) ( not ( = ?auto_840444 ?auto_840450 ) ) ( not ( = ?auto_840444 ?auto_840451 ) ) ( not ( = ?auto_840444 ?auto_840452 ) ) ( not ( = ?auto_840444 ?auto_840453 ) ) ( not ( = ?auto_840444 ?auto_840454 ) ) ( not ( = ?auto_840444 ?auto_840455 ) ) ( not ( = ?auto_840445 ?auto_840446 ) ) ( not ( = ?auto_840445 ?auto_840447 ) ) ( not ( = ?auto_840445 ?auto_840448 ) ) ( not ( = ?auto_840445 ?auto_840449 ) ) ( not ( = ?auto_840445 ?auto_840450 ) ) ( not ( = ?auto_840445 ?auto_840451 ) ) ( not ( = ?auto_840445 ?auto_840452 ) ) ( not ( = ?auto_840445 ?auto_840453 ) ) ( not ( = ?auto_840445 ?auto_840454 ) ) ( not ( = ?auto_840445 ?auto_840455 ) ) ( not ( = ?auto_840446 ?auto_840447 ) ) ( not ( = ?auto_840446 ?auto_840448 ) ) ( not ( = ?auto_840446 ?auto_840449 ) ) ( not ( = ?auto_840446 ?auto_840450 ) ) ( not ( = ?auto_840446 ?auto_840451 ) ) ( not ( = ?auto_840446 ?auto_840452 ) ) ( not ( = ?auto_840446 ?auto_840453 ) ) ( not ( = ?auto_840446 ?auto_840454 ) ) ( not ( = ?auto_840446 ?auto_840455 ) ) ( not ( = ?auto_840447 ?auto_840448 ) ) ( not ( = ?auto_840447 ?auto_840449 ) ) ( not ( = ?auto_840447 ?auto_840450 ) ) ( not ( = ?auto_840447 ?auto_840451 ) ) ( not ( = ?auto_840447 ?auto_840452 ) ) ( not ( = ?auto_840447 ?auto_840453 ) ) ( not ( = ?auto_840447 ?auto_840454 ) ) ( not ( = ?auto_840447 ?auto_840455 ) ) ( not ( = ?auto_840448 ?auto_840449 ) ) ( not ( = ?auto_840448 ?auto_840450 ) ) ( not ( = ?auto_840448 ?auto_840451 ) ) ( not ( = ?auto_840448 ?auto_840452 ) ) ( not ( = ?auto_840448 ?auto_840453 ) ) ( not ( = ?auto_840448 ?auto_840454 ) ) ( not ( = ?auto_840448 ?auto_840455 ) ) ( not ( = ?auto_840449 ?auto_840450 ) ) ( not ( = ?auto_840449 ?auto_840451 ) ) ( not ( = ?auto_840449 ?auto_840452 ) ) ( not ( = ?auto_840449 ?auto_840453 ) ) ( not ( = ?auto_840449 ?auto_840454 ) ) ( not ( = ?auto_840449 ?auto_840455 ) ) ( not ( = ?auto_840450 ?auto_840451 ) ) ( not ( = ?auto_840450 ?auto_840452 ) ) ( not ( = ?auto_840450 ?auto_840453 ) ) ( not ( = ?auto_840450 ?auto_840454 ) ) ( not ( = ?auto_840450 ?auto_840455 ) ) ( not ( = ?auto_840451 ?auto_840452 ) ) ( not ( = ?auto_840451 ?auto_840453 ) ) ( not ( = ?auto_840451 ?auto_840454 ) ) ( not ( = ?auto_840451 ?auto_840455 ) ) ( not ( = ?auto_840452 ?auto_840453 ) ) ( not ( = ?auto_840452 ?auto_840454 ) ) ( not ( = ?auto_840452 ?auto_840455 ) ) ( not ( = ?auto_840453 ?auto_840454 ) ) ( not ( = ?auto_840453 ?auto_840455 ) ) ( not ( = ?auto_840454 ?auto_840455 ) ) ( ON ?auto_840453 ?auto_840454 ) ( ON ?auto_840452 ?auto_840453 ) ( ON ?auto_840451 ?auto_840452 ) ( ON ?auto_840450 ?auto_840451 ) ( ON ?auto_840449 ?auto_840450 ) ( ON ?auto_840448 ?auto_840449 ) ( ON ?auto_840447 ?auto_840448 ) ( ON ?auto_840446 ?auto_840447 ) ( CLEAR ?auto_840444 ) ( ON ?auto_840445 ?auto_840446 ) ( CLEAR ?auto_840445 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_840441 ?auto_840442 ?auto_840443 ?auto_840444 ?auto_840445 )
      ( MAKE-14PILE ?auto_840441 ?auto_840442 ?auto_840443 ?auto_840444 ?auto_840445 ?auto_840446 ?auto_840447 ?auto_840448 ?auto_840449 ?auto_840450 ?auto_840451 ?auto_840452 ?auto_840453 ?auto_840454 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_840499 - BLOCK
      ?auto_840500 - BLOCK
      ?auto_840501 - BLOCK
      ?auto_840502 - BLOCK
      ?auto_840503 - BLOCK
      ?auto_840504 - BLOCK
      ?auto_840505 - BLOCK
      ?auto_840506 - BLOCK
      ?auto_840507 - BLOCK
      ?auto_840508 - BLOCK
      ?auto_840509 - BLOCK
      ?auto_840510 - BLOCK
      ?auto_840511 - BLOCK
      ?auto_840512 - BLOCK
    )
    :vars
    (
      ?auto_840513 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_840512 ?auto_840513 ) ( ON-TABLE ?auto_840499 ) ( ON ?auto_840500 ?auto_840499 ) ( ON ?auto_840501 ?auto_840500 ) ( not ( = ?auto_840499 ?auto_840500 ) ) ( not ( = ?auto_840499 ?auto_840501 ) ) ( not ( = ?auto_840499 ?auto_840502 ) ) ( not ( = ?auto_840499 ?auto_840503 ) ) ( not ( = ?auto_840499 ?auto_840504 ) ) ( not ( = ?auto_840499 ?auto_840505 ) ) ( not ( = ?auto_840499 ?auto_840506 ) ) ( not ( = ?auto_840499 ?auto_840507 ) ) ( not ( = ?auto_840499 ?auto_840508 ) ) ( not ( = ?auto_840499 ?auto_840509 ) ) ( not ( = ?auto_840499 ?auto_840510 ) ) ( not ( = ?auto_840499 ?auto_840511 ) ) ( not ( = ?auto_840499 ?auto_840512 ) ) ( not ( = ?auto_840499 ?auto_840513 ) ) ( not ( = ?auto_840500 ?auto_840501 ) ) ( not ( = ?auto_840500 ?auto_840502 ) ) ( not ( = ?auto_840500 ?auto_840503 ) ) ( not ( = ?auto_840500 ?auto_840504 ) ) ( not ( = ?auto_840500 ?auto_840505 ) ) ( not ( = ?auto_840500 ?auto_840506 ) ) ( not ( = ?auto_840500 ?auto_840507 ) ) ( not ( = ?auto_840500 ?auto_840508 ) ) ( not ( = ?auto_840500 ?auto_840509 ) ) ( not ( = ?auto_840500 ?auto_840510 ) ) ( not ( = ?auto_840500 ?auto_840511 ) ) ( not ( = ?auto_840500 ?auto_840512 ) ) ( not ( = ?auto_840500 ?auto_840513 ) ) ( not ( = ?auto_840501 ?auto_840502 ) ) ( not ( = ?auto_840501 ?auto_840503 ) ) ( not ( = ?auto_840501 ?auto_840504 ) ) ( not ( = ?auto_840501 ?auto_840505 ) ) ( not ( = ?auto_840501 ?auto_840506 ) ) ( not ( = ?auto_840501 ?auto_840507 ) ) ( not ( = ?auto_840501 ?auto_840508 ) ) ( not ( = ?auto_840501 ?auto_840509 ) ) ( not ( = ?auto_840501 ?auto_840510 ) ) ( not ( = ?auto_840501 ?auto_840511 ) ) ( not ( = ?auto_840501 ?auto_840512 ) ) ( not ( = ?auto_840501 ?auto_840513 ) ) ( not ( = ?auto_840502 ?auto_840503 ) ) ( not ( = ?auto_840502 ?auto_840504 ) ) ( not ( = ?auto_840502 ?auto_840505 ) ) ( not ( = ?auto_840502 ?auto_840506 ) ) ( not ( = ?auto_840502 ?auto_840507 ) ) ( not ( = ?auto_840502 ?auto_840508 ) ) ( not ( = ?auto_840502 ?auto_840509 ) ) ( not ( = ?auto_840502 ?auto_840510 ) ) ( not ( = ?auto_840502 ?auto_840511 ) ) ( not ( = ?auto_840502 ?auto_840512 ) ) ( not ( = ?auto_840502 ?auto_840513 ) ) ( not ( = ?auto_840503 ?auto_840504 ) ) ( not ( = ?auto_840503 ?auto_840505 ) ) ( not ( = ?auto_840503 ?auto_840506 ) ) ( not ( = ?auto_840503 ?auto_840507 ) ) ( not ( = ?auto_840503 ?auto_840508 ) ) ( not ( = ?auto_840503 ?auto_840509 ) ) ( not ( = ?auto_840503 ?auto_840510 ) ) ( not ( = ?auto_840503 ?auto_840511 ) ) ( not ( = ?auto_840503 ?auto_840512 ) ) ( not ( = ?auto_840503 ?auto_840513 ) ) ( not ( = ?auto_840504 ?auto_840505 ) ) ( not ( = ?auto_840504 ?auto_840506 ) ) ( not ( = ?auto_840504 ?auto_840507 ) ) ( not ( = ?auto_840504 ?auto_840508 ) ) ( not ( = ?auto_840504 ?auto_840509 ) ) ( not ( = ?auto_840504 ?auto_840510 ) ) ( not ( = ?auto_840504 ?auto_840511 ) ) ( not ( = ?auto_840504 ?auto_840512 ) ) ( not ( = ?auto_840504 ?auto_840513 ) ) ( not ( = ?auto_840505 ?auto_840506 ) ) ( not ( = ?auto_840505 ?auto_840507 ) ) ( not ( = ?auto_840505 ?auto_840508 ) ) ( not ( = ?auto_840505 ?auto_840509 ) ) ( not ( = ?auto_840505 ?auto_840510 ) ) ( not ( = ?auto_840505 ?auto_840511 ) ) ( not ( = ?auto_840505 ?auto_840512 ) ) ( not ( = ?auto_840505 ?auto_840513 ) ) ( not ( = ?auto_840506 ?auto_840507 ) ) ( not ( = ?auto_840506 ?auto_840508 ) ) ( not ( = ?auto_840506 ?auto_840509 ) ) ( not ( = ?auto_840506 ?auto_840510 ) ) ( not ( = ?auto_840506 ?auto_840511 ) ) ( not ( = ?auto_840506 ?auto_840512 ) ) ( not ( = ?auto_840506 ?auto_840513 ) ) ( not ( = ?auto_840507 ?auto_840508 ) ) ( not ( = ?auto_840507 ?auto_840509 ) ) ( not ( = ?auto_840507 ?auto_840510 ) ) ( not ( = ?auto_840507 ?auto_840511 ) ) ( not ( = ?auto_840507 ?auto_840512 ) ) ( not ( = ?auto_840507 ?auto_840513 ) ) ( not ( = ?auto_840508 ?auto_840509 ) ) ( not ( = ?auto_840508 ?auto_840510 ) ) ( not ( = ?auto_840508 ?auto_840511 ) ) ( not ( = ?auto_840508 ?auto_840512 ) ) ( not ( = ?auto_840508 ?auto_840513 ) ) ( not ( = ?auto_840509 ?auto_840510 ) ) ( not ( = ?auto_840509 ?auto_840511 ) ) ( not ( = ?auto_840509 ?auto_840512 ) ) ( not ( = ?auto_840509 ?auto_840513 ) ) ( not ( = ?auto_840510 ?auto_840511 ) ) ( not ( = ?auto_840510 ?auto_840512 ) ) ( not ( = ?auto_840510 ?auto_840513 ) ) ( not ( = ?auto_840511 ?auto_840512 ) ) ( not ( = ?auto_840511 ?auto_840513 ) ) ( not ( = ?auto_840512 ?auto_840513 ) ) ( ON ?auto_840511 ?auto_840512 ) ( ON ?auto_840510 ?auto_840511 ) ( ON ?auto_840509 ?auto_840510 ) ( ON ?auto_840508 ?auto_840509 ) ( ON ?auto_840507 ?auto_840508 ) ( ON ?auto_840506 ?auto_840507 ) ( ON ?auto_840505 ?auto_840506 ) ( ON ?auto_840504 ?auto_840505 ) ( ON ?auto_840503 ?auto_840504 ) ( CLEAR ?auto_840501 ) ( ON ?auto_840502 ?auto_840503 ) ( CLEAR ?auto_840502 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_840499 ?auto_840500 ?auto_840501 ?auto_840502 )
      ( MAKE-14PILE ?auto_840499 ?auto_840500 ?auto_840501 ?auto_840502 ?auto_840503 ?auto_840504 ?auto_840505 ?auto_840506 ?auto_840507 ?auto_840508 ?auto_840509 ?auto_840510 ?auto_840511 ?auto_840512 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_840557 - BLOCK
      ?auto_840558 - BLOCK
      ?auto_840559 - BLOCK
      ?auto_840560 - BLOCK
      ?auto_840561 - BLOCK
      ?auto_840562 - BLOCK
      ?auto_840563 - BLOCK
      ?auto_840564 - BLOCK
      ?auto_840565 - BLOCK
      ?auto_840566 - BLOCK
      ?auto_840567 - BLOCK
      ?auto_840568 - BLOCK
      ?auto_840569 - BLOCK
      ?auto_840570 - BLOCK
    )
    :vars
    (
      ?auto_840571 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_840570 ?auto_840571 ) ( ON-TABLE ?auto_840557 ) ( ON ?auto_840558 ?auto_840557 ) ( not ( = ?auto_840557 ?auto_840558 ) ) ( not ( = ?auto_840557 ?auto_840559 ) ) ( not ( = ?auto_840557 ?auto_840560 ) ) ( not ( = ?auto_840557 ?auto_840561 ) ) ( not ( = ?auto_840557 ?auto_840562 ) ) ( not ( = ?auto_840557 ?auto_840563 ) ) ( not ( = ?auto_840557 ?auto_840564 ) ) ( not ( = ?auto_840557 ?auto_840565 ) ) ( not ( = ?auto_840557 ?auto_840566 ) ) ( not ( = ?auto_840557 ?auto_840567 ) ) ( not ( = ?auto_840557 ?auto_840568 ) ) ( not ( = ?auto_840557 ?auto_840569 ) ) ( not ( = ?auto_840557 ?auto_840570 ) ) ( not ( = ?auto_840557 ?auto_840571 ) ) ( not ( = ?auto_840558 ?auto_840559 ) ) ( not ( = ?auto_840558 ?auto_840560 ) ) ( not ( = ?auto_840558 ?auto_840561 ) ) ( not ( = ?auto_840558 ?auto_840562 ) ) ( not ( = ?auto_840558 ?auto_840563 ) ) ( not ( = ?auto_840558 ?auto_840564 ) ) ( not ( = ?auto_840558 ?auto_840565 ) ) ( not ( = ?auto_840558 ?auto_840566 ) ) ( not ( = ?auto_840558 ?auto_840567 ) ) ( not ( = ?auto_840558 ?auto_840568 ) ) ( not ( = ?auto_840558 ?auto_840569 ) ) ( not ( = ?auto_840558 ?auto_840570 ) ) ( not ( = ?auto_840558 ?auto_840571 ) ) ( not ( = ?auto_840559 ?auto_840560 ) ) ( not ( = ?auto_840559 ?auto_840561 ) ) ( not ( = ?auto_840559 ?auto_840562 ) ) ( not ( = ?auto_840559 ?auto_840563 ) ) ( not ( = ?auto_840559 ?auto_840564 ) ) ( not ( = ?auto_840559 ?auto_840565 ) ) ( not ( = ?auto_840559 ?auto_840566 ) ) ( not ( = ?auto_840559 ?auto_840567 ) ) ( not ( = ?auto_840559 ?auto_840568 ) ) ( not ( = ?auto_840559 ?auto_840569 ) ) ( not ( = ?auto_840559 ?auto_840570 ) ) ( not ( = ?auto_840559 ?auto_840571 ) ) ( not ( = ?auto_840560 ?auto_840561 ) ) ( not ( = ?auto_840560 ?auto_840562 ) ) ( not ( = ?auto_840560 ?auto_840563 ) ) ( not ( = ?auto_840560 ?auto_840564 ) ) ( not ( = ?auto_840560 ?auto_840565 ) ) ( not ( = ?auto_840560 ?auto_840566 ) ) ( not ( = ?auto_840560 ?auto_840567 ) ) ( not ( = ?auto_840560 ?auto_840568 ) ) ( not ( = ?auto_840560 ?auto_840569 ) ) ( not ( = ?auto_840560 ?auto_840570 ) ) ( not ( = ?auto_840560 ?auto_840571 ) ) ( not ( = ?auto_840561 ?auto_840562 ) ) ( not ( = ?auto_840561 ?auto_840563 ) ) ( not ( = ?auto_840561 ?auto_840564 ) ) ( not ( = ?auto_840561 ?auto_840565 ) ) ( not ( = ?auto_840561 ?auto_840566 ) ) ( not ( = ?auto_840561 ?auto_840567 ) ) ( not ( = ?auto_840561 ?auto_840568 ) ) ( not ( = ?auto_840561 ?auto_840569 ) ) ( not ( = ?auto_840561 ?auto_840570 ) ) ( not ( = ?auto_840561 ?auto_840571 ) ) ( not ( = ?auto_840562 ?auto_840563 ) ) ( not ( = ?auto_840562 ?auto_840564 ) ) ( not ( = ?auto_840562 ?auto_840565 ) ) ( not ( = ?auto_840562 ?auto_840566 ) ) ( not ( = ?auto_840562 ?auto_840567 ) ) ( not ( = ?auto_840562 ?auto_840568 ) ) ( not ( = ?auto_840562 ?auto_840569 ) ) ( not ( = ?auto_840562 ?auto_840570 ) ) ( not ( = ?auto_840562 ?auto_840571 ) ) ( not ( = ?auto_840563 ?auto_840564 ) ) ( not ( = ?auto_840563 ?auto_840565 ) ) ( not ( = ?auto_840563 ?auto_840566 ) ) ( not ( = ?auto_840563 ?auto_840567 ) ) ( not ( = ?auto_840563 ?auto_840568 ) ) ( not ( = ?auto_840563 ?auto_840569 ) ) ( not ( = ?auto_840563 ?auto_840570 ) ) ( not ( = ?auto_840563 ?auto_840571 ) ) ( not ( = ?auto_840564 ?auto_840565 ) ) ( not ( = ?auto_840564 ?auto_840566 ) ) ( not ( = ?auto_840564 ?auto_840567 ) ) ( not ( = ?auto_840564 ?auto_840568 ) ) ( not ( = ?auto_840564 ?auto_840569 ) ) ( not ( = ?auto_840564 ?auto_840570 ) ) ( not ( = ?auto_840564 ?auto_840571 ) ) ( not ( = ?auto_840565 ?auto_840566 ) ) ( not ( = ?auto_840565 ?auto_840567 ) ) ( not ( = ?auto_840565 ?auto_840568 ) ) ( not ( = ?auto_840565 ?auto_840569 ) ) ( not ( = ?auto_840565 ?auto_840570 ) ) ( not ( = ?auto_840565 ?auto_840571 ) ) ( not ( = ?auto_840566 ?auto_840567 ) ) ( not ( = ?auto_840566 ?auto_840568 ) ) ( not ( = ?auto_840566 ?auto_840569 ) ) ( not ( = ?auto_840566 ?auto_840570 ) ) ( not ( = ?auto_840566 ?auto_840571 ) ) ( not ( = ?auto_840567 ?auto_840568 ) ) ( not ( = ?auto_840567 ?auto_840569 ) ) ( not ( = ?auto_840567 ?auto_840570 ) ) ( not ( = ?auto_840567 ?auto_840571 ) ) ( not ( = ?auto_840568 ?auto_840569 ) ) ( not ( = ?auto_840568 ?auto_840570 ) ) ( not ( = ?auto_840568 ?auto_840571 ) ) ( not ( = ?auto_840569 ?auto_840570 ) ) ( not ( = ?auto_840569 ?auto_840571 ) ) ( not ( = ?auto_840570 ?auto_840571 ) ) ( ON ?auto_840569 ?auto_840570 ) ( ON ?auto_840568 ?auto_840569 ) ( ON ?auto_840567 ?auto_840568 ) ( ON ?auto_840566 ?auto_840567 ) ( ON ?auto_840565 ?auto_840566 ) ( ON ?auto_840564 ?auto_840565 ) ( ON ?auto_840563 ?auto_840564 ) ( ON ?auto_840562 ?auto_840563 ) ( ON ?auto_840561 ?auto_840562 ) ( ON ?auto_840560 ?auto_840561 ) ( CLEAR ?auto_840558 ) ( ON ?auto_840559 ?auto_840560 ) ( CLEAR ?auto_840559 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_840557 ?auto_840558 ?auto_840559 )
      ( MAKE-14PILE ?auto_840557 ?auto_840558 ?auto_840559 ?auto_840560 ?auto_840561 ?auto_840562 ?auto_840563 ?auto_840564 ?auto_840565 ?auto_840566 ?auto_840567 ?auto_840568 ?auto_840569 ?auto_840570 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_840615 - BLOCK
      ?auto_840616 - BLOCK
      ?auto_840617 - BLOCK
      ?auto_840618 - BLOCK
      ?auto_840619 - BLOCK
      ?auto_840620 - BLOCK
      ?auto_840621 - BLOCK
      ?auto_840622 - BLOCK
      ?auto_840623 - BLOCK
      ?auto_840624 - BLOCK
      ?auto_840625 - BLOCK
      ?auto_840626 - BLOCK
      ?auto_840627 - BLOCK
      ?auto_840628 - BLOCK
    )
    :vars
    (
      ?auto_840629 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_840628 ?auto_840629 ) ( ON-TABLE ?auto_840615 ) ( not ( = ?auto_840615 ?auto_840616 ) ) ( not ( = ?auto_840615 ?auto_840617 ) ) ( not ( = ?auto_840615 ?auto_840618 ) ) ( not ( = ?auto_840615 ?auto_840619 ) ) ( not ( = ?auto_840615 ?auto_840620 ) ) ( not ( = ?auto_840615 ?auto_840621 ) ) ( not ( = ?auto_840615 ?auto_840622 ) ) ( not ( = ?auto_840615 ?auto_840623 ) ) ( not ( = ?auto_840615 ?auto_840624 ) ) ( not ( = ?auto_840615 ?auto_840625 ) ) ( not ( = ?auto_840615 ?auto_840626 ) ) ( not ( = ?auto_840615 ?auto_840627 ) ) ( not ( = ?auto_840615 ?auto_840628 ) ) ( not ( = ?auto_840615 ?auto_840629 ) ) ( not ( = ?auto_840616 ?auto_840617 ) ) ( not ( = ?auto_840616 ?auto_840618 ) ) ( not ( = ?auto_840616 ?auto_840619 ) ) ( not ( = ?auto_840616 ?auto_840620 ) ) ( not ( = ?auto_840616 ?auto_840621 ) ) ( not ( = ?auto_840616 ?auto_840622 ) ) ( not ( = ?auto_840616 ?auto_840623 ) ) ( not ( = ?auto_840616 ?auto_840624 ) ) ( not ( = ?auto_840616 ?auto_840625 ) ) ( not ( = ?auto_840616 ?auto_840626 ) ) ( not ( = ?auto_840616 ?auto_840627 ) ) ( not ( = ?auto_840616 ?auto_840628 ) ) ( not ( = ?auto_840616 ?auto_840629 ) ) ( not ( = ?auto_840617 ?auto_840618 ) ) ( not ( = ?auto_840617 ?auto_840619 ) ) ( not ( = ?auto_840617 ?auto_840620 ) ) ( not ( = ?auto_840617 ?auto_840621 ) ) ( not ( = ?auto_840617 ?auto_840622 ) ) ( not ( = ?auto_840617 ?auto_840623 ) ) ( not ( = ?auto_840617 ?auto_840624 ) ) ( not ( = ?auto_840617 ?auto_840625 ) ) ( not ( = ?auto_840617 ?auto_840626 ) ) ( not ( = ?auto_840617 ?auto_840627 ) ) ( not ( = ?auto_840617 ?auto_840628 ) ) ( not ( = ?auto_840617 ?auto_840629 ) ) ( not ( = ?auto_840618 ?auto_840619 ) ) ( not ( = ?auto_840618 ?auto_840620 ) ) ( not ( = ?auto_840618 ?auto_840621 ) ) ( not ( = ?auto_840618 ?auto_840622 ) ) ( not ( = ?auto_840618 ?auto_840623 ) ) ( not ( = ?auto_840618 ?auto_840624 ) ) ( not ( = ?auto_840618 ?auto_840625 ) ) ( not ( = ?auto_840618 ?auto_840626 ) ) ( not ( = ?auto_840618 ?auto_840627 ) ) ( not ( = ?auto_840618 ?auto_840628 ) ) ( not ( = ?auto_840618 ?auto_840629 ) ) ( not ( = ?auto_840619 ?auto_840620 ) ) ( not ( = ?auto_840619 ?auto_840621 ) ) ( not ( = ?auto_840619 ?auto_840622 ) ) ( not ( = ?auto_840619 ?auto_840623 ) ) ( not ( = ?auto_840619 ?auto_840624 ) ) ( not ( = ?auto_840619 ?auto_840625 ) ) ( not ( = ?auto_840619 ?auto_840626 ) ) ( not ( = ?auto_840619 ?auto_840627 ) ) ( not ( = ?auto_840619 ?auto_840628 ) ) ( not ( = ?auto_840619 ?auto_840629 ) ) ( not ( = ?auto_840620 ?auto_840621 ) ) ( not ( = ?auto_840620 ?auto_840622 ) ) ( not ( = ?auto_840620 ?auto_840623 ) ) ( not ( = ?auto_840620 ?auto_840624 ) ) ( not ( = ?auto_840620 ?auto_840625 ) ) ( not ( = ?auto_840620 ?auto_840626 ) ) ( not ( = ?auto_840620 ?auto_840627 ) ) ( not ( = ?auto_840620 ?auto_840628 ) ) ( not ( = ?auto_840620 ?auto_840629 ) ) ( not ( = ?auto_840621 ?auto_840622 ) ) ( not ( = ?auto_840621 ?auto_840623 ) ) ( not ( = ?auto_840621 ?auto_840624 ) ) ( not ( = ?auto_840621 ?auto_840625 ) ) ( not ( = ?auto_840621 ?auto_840626 ) ) ( not ( = ?auto_840621 ?auto_840627 ) ) ( not ( = ?auto_840621 ?auto_840628 ) ) ( not ( = ?auto_840621 ?auto_840629 ) ) ( not ( = ?auto_840622 ?auto_840623 ) ) ( not ( = ?auto_840622 ?auto_840624 ) ) ( not ( = ?auto_840622 ?auto_840625 ) ) ( not ( = ?auto_840622 ?auto_840626 ) ) ( not ( = ?auto_840622 ?auto_840627 ) ) ( not ( = ?auto_840622 ?auto_840628 ) ) ( not ( = ?auto_840622 ?auto_840629 ) ) ( not ( = ?auto_840623 ?auto_840624 ) ) ( not ( = ?auto_840623 ?auto_840625 ) ) ( not ( = ?auto_840623 ?auto_840626 ) ) ( not ( = ?auto_840623 ?auto_840627 ) ) ( not ( = ?auto_840623 ?auto_840628 ) ) ( not ( = ?auto_840623 ?auto_840629 ) ) ( not ( = ?auto_840624 ?auto_840625 ) ) ( not ( = ?auto_840624 ?auto_840626 ) ) ( not ( = ?auto_840624 ?auto_840627 ) ) ( not ( = ?auto_840624 ?auto_840628 ) ) ( not ( = ?auto_840624 ?auto_840629 ) ) ( not ( = ?auto_840625 ?auto_840626 ) ) ( not ( = ?auto_840625 ?auto_840627 ) ) ( not ( = ?auto_840625 ?auto_840628 ) ) ( not ( = ?auto_840625 ?auto_840629 ) ) ( not ( = ?auto_840626 ?auto_840627 ) ) ( not ( = ?auto_840626 ?auto_840628 ) ) ( not ( = ?auto_840626 ?auto_840629 ) ) ( not ( = ?auto_840627 ?auto_840628 ) ) ( not ( = ?auto_840627 ?auto_840629 ) ) ( not ( = ?auto_840628 ?auto_840629 ) ) ( ON ?auto_840627 ?auto_840628 ) ( ON ?auto_840626 ?auto_840627 ) ( ON ?auto_840625 ?auto_840626 ) ( ON ?auto_840624 ?auto_840625 ) ( ON ?auto_840623 ?auto_840624 ) ( ON ?auto_840622 ?auto_840623 ) ( ON ?auto_840621 ?auto_840622 ) ( ON ?auto_840620 ?auto_840621 ) ( ON ?auto_840619 ?auto_840620 ) ( ON ?auto_840618 ?auto_840619 ) ( ON ?auto_840617 ?auto_840618 ) ( CLEAR ?auto_840615 ) ( ON ?auto_840616 ?auto_840617 ) ( CLEAR ?auto_840616 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_840615 ?auto_840616 )
      ( MAKE-14PILE ?auto_840615 ?auto_840616 ?auto_840617 ?auto_840618 ?auto_840619 ?auto_840620 ?auto_840621 ?auto_840622 ?auto_840623 ?auto_840624 ?auto_840625 ?auto_840626 ?auto_840627 ?auto_840628 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_840673 - BLOCK
      ?auto_840674 - BLOCK
      ?auto_840675 - BLOCK
      ?auto_840676 - BLOCK
      ?auto_840677 - BLOCK
      ?auto_840678 - BLOCK
      ?auto_840679 - BLOCK
      ?auto_840680 - BLOCK
      ?auto_840681 - BLOCK
      ?auto_840682 - BLOCK
      ?auto_840683 - BLOCK
      ?auto_840684 - BLOCK
      ?auto_840685 - BLOCK
      ?auto_840686 - BLOCK
    )
    :vars
    (
      ?auto_840687 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_840686 ?auto_840687 ) ( not ( = ?auto_840673 ?auto_840674 ) ) ( not ( = ?auto_840673 ?auto_840675 ) ) ( not ( = ?auto_840673 ?auto_840676 ) ) ( not ( = ?auto_840673 ?auto_840677 ) ) ( not ( = ?auto_840673 ?auto_840678 ) ) ( not ( = ?auto_840673 ?auto_840679 ) ) ( not ( = ?auto_840673 ?auto_840680 ) ) ( not ( = ?auto_840673 ?auto_840681 ) ) ( not ( = ?auto_840673 ?auto_840682 ) ) ( not ( = ?auto_840673 ?auto_840683 ) ) ( not ( = ?auto_840673 ?auto_840684 ) ) ( not ( = ?auto_840673 ?auto_840685 ) ) ( not ( = ?auto_840673 ?auto_840686 ) ) ( not ( = ?auto_840673 ?auto_840687 ) ) ( not ( = ?auto_840674 ?auto_840675 ) ) ( not ( = ?auto_840674 ?auto_840676 ) ) ( not ( = ?auto_840674 ?auto_840677 ) ) ( not ( = ?auto_840674 ?auto_840678 ) ) ( not ( = ?auto_840674 ?auto_840679 ) ) ( not ( = ?auto_840674 ?auto_840680 ) ) ( not ( = ?auto_840674 ?auto_840681 ) ) ( not ( = ?auto_840674 ?auto_840682 ) ) ( not ( = ?auto_840674 ?auto_840683 ) ) ( not ( = ?auto_840674 ?auto_840684 ) ) ( not ( = ?auto_840674 ?auto_840685 ) ) ( not ( = ?auto_840674 ?auto_840686 ) ) ( not ( = ?auto_840674 ?auto_840687 ) ) ( not ( = ?auto_840675 ?auto_840676 ) ) ( not ( = ?auto_840675 ?auto_840677 ) ) ( not ( = ?auto_840675 ?auto_840678 ) ) ( not ( = ?auto_840675 ?auto_840679 ) ) ( not ( = ?auto_840675 ?auto_840680 ) ) ( not ( = ?auto_840675 ?auto_840681 ) ) ( not ( = ?auto_840675 ?auto_840682 ) ) ( not ( = ?auto_840675 ?auto_840683 ) ) ( not ( = ?auto_840675 ?auto_840684 ) ) ( not ( = ?auto_840675 ?auto_840685 ) ) ( not ( = ?auto_840675 ?auto_840686 ) ) ( not ( = ?auto_840675 ?auto_840687 ) ) ( not ( = ?auto_840676 ?auto_840677 ) ) ( not ( = ?auto_840676 ?auto_840678 ) ) ( not ( = ?auto_840676 ?auto_840679 ) ) ( not ( = ?auto_840676 ?auto_840680 ) ) ( not ( = ?auto_840676 ?auto_840681 ) ) ( not ( = ?auto_840676 ?auto_840682 ) ) ( not ( = ?auto_840676 ?auto_840683 ) ) ( not ( = ?auto_840676 ?auto_840684 ) ) ( not ( = ?auto_840676 ?auto_840685 ) ) ( not ( = ?auto_840676 ?auto_840686 ) ) ( not ( = ?auto_840676 ?auto_840687 ) ) ( not ( = ?auto_840677 ?auto_840678 ) ) ( not ( = ?auto_840677 ?auto_840679 ) ) ( not ( = ?auto_840677 ?auto_840680 ) ) ( not ( = ?auto_840677 ?auto_840681 ) ) ( not ( = ?auto_840677 ?auto_840682 ) ) ( not ( = ?auto_840677 ?auto_840683 ) ) ( not ( = ?auto_840677 ?auto_840684 ) ) ( not ( = ?auto_840677 ?auto_840685 ) ) ( not ( = ?auto_840677 ?auto_840686 ) ) ( not ( = ?auto_840677 ?auto_840687 ) ) ( not ( = ?auto_840678 ?auto_840679 ) ) ( not ( = ?auto_840678 ?auto_840680 ) ) ( not ( = ?auto_840678 ?auto_840681 ) ) ( not ( = ?auto_840678 ?auto_840682 ) ) ( not ( = ?auto_840678 ?auto_840683 ) ) ( not ( = ?auto_840678 ?auto_840684 ) ) ( not ( = ?auto_840678 ?auto_840685 ) ) ( not ( = ?auto_840678 ?auto_840686 ) ) ( not ( = ?auto_840678 ?auto_840687 ) ) ( not ( = ?auto_840679 ?auto_840680 ) ) ( not ( = ?auto_840679 ?auto_840681 ) ) ( not ( = ?auto_840679 ?auto_840682 ) ) ( not ( = ?auto_840679 ?auto_840683 ) ) ( not ( = ?auto_840679 ?auto_840684 ) ) ( not ( = ?auto_840679 ?auto_840685 ) ) ( not ( = ?auto_840679 ?auto_840686 ) ) ( not ( = ?auto_840679 ?auto_840687 ) ) ( not ( = ?auto_840680 ?auto_840681 ) ) ( not ( = ?auto_840680 ?auto_840682 ) ) ( not ( = ?auto_840680 ?auto_840683 ) ) ( not ( = ?auto_840680 ?auto_840684 ) ) ( not ( = ?auto_840680 ?auto_840685 ) ) ( not ( = ?auto_840680 ?auto_840686 ) ) ( not ( = ?auto_840680 ?auto_840687 ) ) ( not ( = ?auto_840681 ?auto_840682 ) ) ( not ( = ?auto_840681 ?auto_840683 ) ) ( not ( = ?auto_840681 ?auto_840684 ) ) ( not ( = ?auto_840681 ?auto_840685 ) ) ( not ( = ?auto_840681 ?auto_840686 ) ) ( not ( = ?auto_840681 ?auto_840687 ) ) ( not ( = ?auto_840682 ?auto_840683 ) ) ( not ( = ?auto_840682 ?auto_840684 ) ) ( not ( = ?auto_840682 ?auto_840685 ) ) ( not ( = ?auto_840682 ?auto_840686 ) ) ( not ( = ?auto_840682 ?auto_840687 ) ) ( not ( = ?auto_840683 ?auto_840684 ) ) ( not ( = ?auto_840683 ?auto_840685 ) ) ( not ( = ?auto_840683 ?auto_840686 ) ) ( not ( = ?auto_840683 ?auto_840687 ) ) ( not ( = ?auto_840684 ?auto_840685 ) ) ( not ( = ?auto_840684 ?auto_840686 ) ) ( not ( = ?auto_840684 ?auto_840687 ) ) ( not ( = ?auto_840685 ?auto_840686 ) ) ( not ( = ?auto_840685 ?auto_840687 ) ) ( not ( = ?auto_840686 ?auto_840687 ) ) ( ON ?auto_840685 ?auto_840686 ) ( ON ?auto_840684 ?auto_840685 ) ( ON ?auto_840683 ?auto_840684 ) ( ON ?auto_840682 ?auto_840683 ) ( ON ?auto_840681 ?auto_840682 ) ( ON ?auto_840680 ?auto_840681 ) ( ON ?auto_840679 ?auto_840680 ) ( ON ?auto_840678 ?auto_840679 ) ( ON ?auto_840677 ?auto_840678 ) ( ON ?auto_840676 ?auto_840677 ) ( ON ?auto_840675 ?auto_840676 ) ( ON ?auto_840674 ?auto_840675 ) ( ON ?auto_840673 ?auto_840674 ) ( CLEAR ?auto_840673 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_840673 )
      ( MAKE-14PILE ?auto_840673 ?auto_840674 ?auto_840675 ?auto_840676 ?auto_840677 ?auto_840678 ?auto_840679 ?auto_840680 ?auto_840681 ?auto_840682 ?auto_840683 ?auto_840684 ?auto_840685 ?auto_840686 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_840732 - BLOCK
      ?auto_840733 - BLOCK
      ?auto_840734 - BLOCK
      ?auto_840735 - BLOCK
      ?auto_840736 - BLOCK
      ?auto_840737 - BLOCK
      ?auto_840738 - BLOCK
      ?auto_840739 - BLOCK
      ?auto_840740 - BLOCK
      ?auto_840741 - BLOCK
      ?auto_840742 - BLOCK
      ?auto_840743 - BLOCK
      ?auto_840744 - BLOCK
      ?auto_840745 - BLOCK
      ?auto_840746 - BLOCK
    )
    :vars
    (
      ?auto_840747 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_840745 ) ( ON ?auto_840746 ?auto_840747 ) ( CLEAR ?auto_840746 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_840732 ) ( ON ?auto_840733 ?auto_840732 ) ( ON ?auto_840734 ?auto_840733 ) ( ON ?auto_840735 ?auto_840734 ) ( ON ?auto_840736 ?auto_840735 ) ( ON ?auto_840737 ?auto_840736 ) ( ON ?auto_840738 ?auto_840737 ) ( ON ?auto_840739 ?auto_840738 ) ( ON ?auto_840740 ?auto_840739 ) ( ON ?auto_840741 ?auto_840740 ) ( ON ?auto_840742 ?auto_840741 ) ( ON ?auto_840743 ?auto_840742 ) ( ON ?auto_840744 ?auto_840743 ) ( ON ?auto_840745 ?auto_840744 ) ( not ( = ?auto_840732 ?auto_840733 ) ) ( not ( = ?auto_840732 ?auto_840734 ) ) ( not ( = ?auto_840732 ?auto_840735 ) ) ( not ( = ?auto_840732 ?auto_840736 ) ) ( not ( = ?auto_840732 ?auto_840737 ) ) ( not ( = ?auto_840732 ?auto_840738 ) ) ( not ( = ?auto_840732 ?auto_840739 ) ) ( not ( = ?auto_840732 ?auto_840740 ) ) ( not ( = ?auto_840732 ?auto_840741 ) ) ( not ( = ?auto_840732 ?auto_840742 ) ) ( not ( = ?auto_840732 ?auto_840743 ) ) ( not ( = ?auto_840732 ?auto_840744 ) ) ( not ( = ?auto_840732 ?auto_840745 ) ) ( not ( = ?auto_840732 ?auto_840746 ) ) ( not ( = ?auto_840732 ?auto_840747 ) ) ( not ( = ?auto_840733 ?auto_840734 ) ) ( not ( = ?auto_840733 ?auto_840735 ) ) ( not ( = ?auto_840733 ?auto_840736 ) ) ( not ( = ?auto_840733 ?auto_840737 ) ) ( not ( = ?auto_840733 ?auto_840738 ) ) ( not ( = ?auto_840733 ?auto_840739 ) ) ( not ( = ?auto_840733 ?auto_840740 ) ) ( not ( = ?auto_840733 ?auto_840741 ) ) ( not ( = ?auto_840733 ?auto_840742 ) ) ( not ( = ?auto_840733 ?auto_840743 ) ) ( not ( = ?auto_840733 ?auto_840744 ) ) ( not ( = ?auto_840733 ?auto_840745 ) ) ( not ( = ?auto_840733 ?auto_840746 ) ) ( not ( = ?auto_840733 ?auto_840747 ) ) ( not ( = ?auto_840734 ?auto_840735 ) ) ( not ( = ?auto_840734 ?auto_840736 ) ) ( not ( = ?auto_840734 ?auto_840737 ) ) ( not ( = ?auto_840734 ?auto_840738 ) ) ( not ( = ?auto_840734 ?auto_840739 ) ) ( not ( = ?auto_840734 ?auto_840740 ) ) ( not ( = ?auto_840734 ?auto_840741 ) ) ( not ( = ?auto_840734 ?auto_840742 ) ) ( not ( = ?auto_840734 ?auto_840743 ) ) ( not ( = ?auto_840734 ?auto_840744 ) ) ( not ( = ?auto_840734 ?auto_840745 ) ) ( not ( = ?auto_840734 ?auto_840746 ) ) ( not ( = ?auto_840734 ?auto_840747 ) ) ( not ( = ?auto_840735 ?auto_840736 ) ) ( not ( = ?auto_840735 ?auto_840737 ) ) ( not ( = ?auto_840735 ?auto_840738 ) ) ( not ( = ?auto_840735 ?auto_840739 ) ) ( not ( = ?auto_840735 ?auto_840740 ) ) ( not ( = ?auto_840735 ?auto_840741 ) ) ( not ( = ?auto_840735 ?auto_840742 ) ) ( not ( = ?auto_840735 ?auto_840743 ) ) ( not ( = ?auto_840735 ?auto_840744 ) ) ( not ( = ?auto_840735 ?auto_840745 ) ) ( not ( = ?auto_840735 ?auto_840746 ) ) ( not ( = ?auto_840735 ?auto_840747 ) ) ( not ( = ?auto_840736 ?auto_840737 ) ) ( not ( = ?auto_840736 ?auto_840738 ) ) ( not ( = ?auto_840736 ?auto_840739 ) ) ( not ( = ?auto_840736 ?auto_840740 ) ) ( not ( = ?auto_840736 ?auto_840741 ) ) ( not ( = ?auto_840736 ?auto_840742 ) ) ( not ( = ?auto_840736 ?auto_840743 ) ) ( not ( = ?auto_840736 ?auto_840744 ) ) ( not ( = ?auto_840736 ?auto_840745 ) ) ( not ( = ?auto_840736 ?auto_840746 ) ) ( not ( = ?auto_840736 ?auto_840747 ) ) ( not ( = ?auto_840737 ?auto_840738 ) ) ( not ( = ?auto_840737 ?auto_840739 ) ) ( not ( = ?auto_840737 ?auto_840740 ) ) ( not ( = ?auto_840737 ?auto_840741 ) ) ( not ( = ?auto_840737 ?auto_840742 ) ) ( not ( = ?auto_840737 ?auto_840743 ) ) ( not ( = ?auto_840737 ?auto_840744 ) ) ( not ( = ?auto_840737 ?auto_840745 ) ) ( not ( = ?auto_840737 ?auto_840746 ) ) ( not ( = ?auto_840737 ?auto_840747 ) ) ( not ( = ?auto_840738 ?auto_840739 ) ) ( not ( = ?auto_840738 ?auto_840740 ) ) ( not ( = ?auto_840738 ?auto_840741 ) ) ( not ( = ?auto_840738 ?auto_840742 ) ) ( not ( = ?auto_840738 ?auto_840743 ) ) ( not ( = ?auto_840738 ?auto_840744 ) ) ( not ( = ?auto_840738 ?auto_840745 ) ) ( not ( = ?auto_840738 ?auto_840746 ) ) ( not ( = ?auto_840738 ?auto_840747 ) ) ( not ( = ?auto_840739 ?auto_840740 ) ) ( not ( = ?auto_840739 ?auto_840741 ) ) ( not ( = ?auto_840739 ?auto_840742 ) ) ( not ( = ?auto_840739 ?auto_840743 ) ) ( not ( = ?auto_840739 ?auto_840744 ) ) ( not ( = ?auto_840739 ?auto_840745 ) ) ( not ( = ?auto_840739 ?auto_840746 ) ) ( not ( = ?auto_840739 ?auto_840747 ) ) ( not ( = ?auto_840740 ?auto_840741 ) ) ( not ( = ?auto_840740 ?auto_840742 ) ) ( not ( = ?auto_840740 ?auto_840743 ) ) ( not ( = ?auto_840740 ?auto_840744 ) ) ( not ( = ?auto_840740 ?auto_840745 ) ) ( not ( = ?auto_840740 ?auto_840746 ) ) ( not ( = ?auto_840740 ?auto_840747 ) ) ( not ( = ?auto_840741 ?auto_840742 ) ) ( not ( = ?auto_840741 ?auto_840743 ) ) ( not ( = ?auto_840741 ?auto_840744 ) ) ( not ( = ?auto_840741 ?auto_840745 ) ) ( not ( = ?auto_840741 ?auto_840746 ) ) ( not ( = ?auto_840741 ?auto_840747 ) ) ( not ( = ?auto_840742 ?auto_840743 ) ) ( not ( = ?auto_840742 ?auto_840744 ) ) ( not ( = ?auto_840742 ?auto_840745 ) ) ( not ( = ?auto_840742 ?auto_840746 ) ) ( not ( = ?auto_840742 ?auto_840747 ) ) ( not ( = ?auto_840743 ?auto_840744 ) ) ( not ( = ?auto_840743 ?auto_840745 ) ) ( not ( = ?auto_840743 ?auto_840746 ) ) ( not ( = ?auto_840743 ?auto_840747 ) ) ( not ( = ?auto_840744 ?auto_840745 ) ) ( not ( = ?auto_840744 ?auto_840746 ) ) ( not ( = ?auto_840744 ?auto_840747 ) ) ( not ( = ?auto_840745 ?auto_840746 ) ) ( not ( = ?auto_840745 ?auto_840747 ) ) ( not ( = ?auto_840746 ?auto_840747 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_840746 ?auto_840747 )
      ( !STACK ?auto_840746 ?auto_840745 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_840794 - BLOCK
      ?auto_840795 - BLOCK
      ?auto_840796 - BLOCK
      ?auto_840797 - BLOCK
      ?auto_840798 - BLOCK
      ?auto_840799 - BLOCK
      ?auto_840800 - BLOCK
      ?auto_840801 - BLOCK
      ?auto_840802 - BLOCK
      ?auto_840803 - BLOCK
      ?auto_840804 - BLOCK
      ?auto_840805 - BLOCK
      ?auto_840806 - BLOCK
      ?auto_840807 - BLOCK
      ?auto_840808 - BLOCK
    )
    :vars
    (
      ?auto_840809 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_840808 ?auto_840809 ) ( ON-TABLE ?auto_840794 ) ( ON ?auto_840795 ?auto_840794 ) ( ON ?auto_840796 ?auto_840795 ) ( ON ?auto_840797 ?auto_840796 ) ( ON ?auto_840798 ?auto_840797 ) ( ON ?auto_840799 ?auto_840798 ) ( ON ?auto_840800 ?auto_840799 ) ( ON ?auto_840801 ?auto_840800 ) ( ON ?auto_840802 ?auto_840801 ) ( ON ?auto_840803 ?auto_840802 ) ( ON ?auto_840804 ?auto_840803 ) ( ON ?auto_840805 ?auto_840804 ) ( ON ?auto_840806 ?auto_840805 ) ( not ( = ?auto_840794 ?auto_840795 ) ) ( not ( = ?auto_840794 ?auto_840796 ) ) ( not ( = ?auto_840794 ?auto_840797 ) ) ( not ( = ?auto_840794 ?auto_840798 ) ) ( not ( = ?auto_840794 ?auto_840799 ) ) ( not ( = ?auto_840794 ?auto_840800 ) ) ( not ( = ?auto_840794 ?auto_840801 ) ) ( not ( = ?auto_840794 ?auto_840802 ) ) ( not ( = ?auto_840794 ?auto_840803 ) ) ( not ( = ?auto_840794 ?auto_840804 ) ) ( not ( = ?auto_840794 ?auto_840805 ) ) ( not ( = ?auto_840794 ?auto_840806 ) ) ( not ( = ?auto_840794 ?auto_840807 ) ) ( not ( = ?auto_840794 ?auto_840808 ) ) ( not ( = ?auto_840794 ?auto_840809 ) ) ( not ( = ?auto_840795 ?auto_840796 ) ) ( not ( = ?auto_840795 ?auto_840797 ) ) ( not ( = ?auto_840795 ?auto_840798 ) ) ( not ( = ?auto_840795 ?auto_840799 ) ) ( not ( = ?auto_840795 ?auto_840800 ) ) ( not ( = ?auto_840795 ?auto_840801 ) ) ( not ( = ?auto_840795 ?auto_840802 ) ) ( not ( = ?auto_840795 ?auto_840803 ) ) ( not ( = ?auto_840795 ?auto_840804 ) ) ( not ( = ?auto_840795 ?auto_840805 ) ) ( not ( = ?auto_840795 ?auto_840806 ) ) ( not ( = ?auto_840795 ?auto_840807 ) ) ( not ( = ?auto_840795 ?auto_840808 ) ) ( not ( = ?auto_840795 ?auto_840809 ) ) ( not ( = ?auto_840796 ?auto_840797 ) ) ( not ( = ?auto_840796 ?auto_840798 ) ) ( not ( = ?auto_840796 ?auto_840799 ) ) ( not ( = ?auto_840796 ?auto_840800 ) ) ( not ( = ?auto_840796 ?auto_840801 ) ) ( not ( = ?auto_840796 ?auto_840802 ) ) ( not ( = ?auto_840796 ?auto_840803 ) ) ( not ( = ?auto_840796 ?auto_840804 ) ) ( not ( = ?auto_840796 ?auto_840805 ) ) ( not ( = ?auto_840796 ?auto_840806 ) ) ( not ( = ?auto_840796 ?auto_840807 ) ) ( not ( = ?auto_840796 ?auto_840808 ) ) ( not ( = ?auto_840796 ?auto_840809 ) ) ( not ( = ?auto_840797 ?auto_840798 ) ) ( not ( = ?auto_840797 ?auto_840799 ) ) ( not ( = ?auto_840797 ?auto_840800 ) ) ( not ( = ?auto_840797 ?auto_840801 ) ) ( not ( = ?auto_840797 ?auto_840802 ) ) ( not ( = ?auto_840797 ?auto_840803 ) ) ( not ( = ?auto_840797 ?auto_840804 ) ) ( not ( = ?auto_840797 ?auto_840805 ) ) ( not ( = ?auto_840797 ?auto_840806 ) ) ( not ( = ?auto_840797 ?auto_840807 ) ) ( not ( = ?auto_840797 ?auto_840808 ) ) ( not ( = ?auto_840797 ?auto_840809 ) ) ( not ( = ?auto_840798 ?auto_840799 ) ) ( not ( = ?auto_840798 ?auto_840800 ) ) ( not ( = ?auto_840798 ?auto_840801 ) ) ( not ( = ?auto_840798 ?auto_840802 ) ) ( not ( = ?auto_840798 ?auto_840803 ) ) ( not ( = ?auto_840798 ?auto_840804 ) ) ( not ( = ?auto_840798 ?auto_840805 ) ) ( not ( = ?auto_840798 ?auto_840806 ) ) ( not ( = ?auto_840798 ?auto_840807 ) ) ( not ( = ?auto_840798 ?auto_840808 ) ) ( not ( = ?auto_840798 ?auto_840809 ) ) ( not ( = ?auto_840799 ?auto_840800 ) ) ( not ( = ?auto_840799 ?auto_840801 ) ) ( not ( = ?auto_840799 ?auto_840802 ) ) ( not ( = ?auto_840799 ?auto_840803 ) ) ( not ( = ?auto_840799 ?auto_840804 ) ) ( not ( = ?auto_840799 ?auto_840805 ) ) ( not ( = ?auto_840799 ?auto_840806 ) ) ( not ( = ?auto_840799 ?auto_840807 ) ) ( not ( = ?auto_840799 ?auto_840808 ) ) ( not ( = ?auto_840799 ?auto_840809 ) ) ( not ( = ?auto_840800 ?auto_840801 ) ) ( not ( = ?auto_840800 ?auto_840802 ) ) ( not ( = ?auto_840800 ?auto_840803 ) ) ( not ( = ?auto_840800 ?auto_840804 ) ) ( not ( = ?auto_840800 ?auto_840805 ) ) ( not ( = ?auto_840800 ?auto_840806 ) ) ( not ( = ?auto_840800 ?auto_840807 ) ) ( not ( = ?auto_840800 ?auto_840808 ) ) ( not ( = ?auto_840800 ?auto_840809 ) ) ( not ( = ?auto_840801 ?auto_840802 ) ) ( not ( = ?auto_840801 ?auto_840803 ) ) ( not ( = ?auto_840801 ?auto_840804 ) ) ( not ( = ?auto_840801 ?auto_840805 ) ) ( not ( = ?auto_840801 ?auto_840806 ) ) ( not ( = ?auto_840801 ?auto_840807 ) ) ( not ( = ?auto_840801 ?auto_840808 ) ) ( not ( = ?auto_840801 ?auto_840809 ) ) ( not ( = ?auto_840802 ?auto_840803 ) ) ( not ( = ?auto_840802 ?auto_840804 ) ) ( not ( = ?auto_840802 ?auto_840805 ) ) ( not ( = ?auto_840802 ?auto_840806 ) ) ( not ( = ?auto_840802 ?auto_840807 ) ) ( not ( = ?auto_840802 ?auto_840808 ) ) ( not ( = ?auto_840802 ?auto_840809 ) ) ( not ( = ?auto_840803 ?auto_840804 ) ) ( not ( = ?auto_840803 ?auto_840805 ) ) ( not ( = ?auto_840803 ?auto_840806 ) ) ( not ( = ?auto_840803 ?auto_840807 ) ) ( not ( = ?auto_840803 ?auto_840808 ) ) ( not ( = ?auto_840803 ?auto_840809 ) ) ( not ( = ?auto_840804 ?auto_840805 ) ) ( not ( = ?auto_840804 ?auto_840806 ) ) ( not ( = ?auto_840804 ?auto_840807 ) ) ( not ( = ?auto_840804 ?auto_840808 ) ) ( not ( = ?auto_840804 ?auto_840809 ) ) ( not ( = ?auto_840805 ?auto_840806 ) ) ( not ( = ?auto_840805 ?auto_840807 ) ) ( not ( = ?auto_840805 ?auto_840808 ) ) ( not ( = ?auto_840805 ?auto_840809 ) ) ( not ( = ?auto_840806 ?auto_840807 ) ) ( not ( = ?auto_840806 ?auto_840808 ) ) ( not ( = ?auto_840806 ?auto_840809 ) ) ( not ( = ?auto_840807 ?auto_840808 ) ) ( not ( = ?auto_840807 ?auto_840809 ) ) ( not ( = ?auto_840808 ?auto_840809 ) ) ( CLEAR ?auto_840806 ) ( ON ?auto_840807 ?auto_840808 ) ( CLEAR ?auto_840807 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_840794 ?auto_840795 ?auto_840796 ?auto_840797 ?auto_840798 ?auto_840799 ?auto_840800 ?auto_840801 ?auto_840802 ?auto_840803 ?auto_840804 ?auto_840805 ?auto_840806 ?auto_840807 )
      ( MAKE-15PILE ?auto_840794 ?auto_840795 ?auto_840796 ?auto_840797 ?auto_840798 ?auto_840799 ?auto_840800 ?auto_840801 ?auto_840802 ?auto_840803 ?auto_840804 ?auto_840805 ?auto_840806 ?auto_840807 ?auto_840808 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_840856 - BLOCK
      ?auto_840857 - BLOCK
      ?auto_840858 - BLOCK
      ?auto_840859 - BLOCK
      ?auto_840860 - BLOCK
      ?auto_840861 - BLOCK
      ?auto_840862 - BLOCK
      ?auto_840863 - BLOCK
      ?auto_840864 - BLOCK
      ?auto_840865 - BLOCK
      ?auto_840866 - BLOCK
      ?auto_840867 - BLOCK
      ?auto_840868 - BLOCK
      ?auto_840869 - BLOCK
      ?auto_840870 - BLOCK
    )
    :vars
    (
      ?auto_840871 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_840870 ?auto_840871 ) ( ON-TABLE ?auto_840856 ) ( ON ?auto_840857 ?auto_840856 ) ( ON ?auto_840858 ?auto_840857 ) ( ON ?auto_840859 ?auto_840858 ) ( ON ?auto_840860 ?auto_840859 ) ( ON ?auto_840861 ?auto_840860 ) ( ON ?auto_840862 ?auto_840861 ) ( ON ?auto_840863 ?auto_840862 ) ( ON ?auto_840864 ?auto_840863 ) ( ON ?auto_840865 ?auto_840864 ) ( ON ?auto_840866 ?auto_840865 ) ( ON ?auto_840867 ?auto_840866 ) ( not ( = ?auto_840856 ?auto_840857 ) ) ( not ( = ?auto_840856 ?auto_840858 ) ) ( not ( = ?auto_840856 ?auto_840859 ) ) ( not ( = ?auto_840856 ?auto_840860 ) ) ( not ( = ?auto_840856 ?auto_840861 ) ) ( not ( = ?auto_840856 ?auto_840862 ) ) ( not ( = ?auto_840856 ?auto_840863 ) ) ( not ( = ?auto_840856 ?auto_840864 ) ) ( not ( = ?auto_840856 ?auto_840865 ) ) ( not ( = ?auto_840856 ?auto_840866 ) ) ( not ( = ?auto_840856 ?auto_840867 ) ) ( not ( = ?auto_840856 ?auto_840868 ) ) ( not ( = ?auto_840856 ?auto_840869 ) ) ( not ( = ?auto_840856 ?auto_840870 ) ) ( not ( = ?auto_840856 ?auto_840871 ) ) ( not ( = ?auto_840857 ?auto_840858 ) ) ( not ( = ?auto_840857 ?auto_840859 ) ) ( not ( = ?auto_840857 ?auto_840860 ) ) ( not ( = ?auto_840857 ?auto_840861 ) ) ( not ( = ?auto_840857 ?auto_840862 ) ) ( not ( = ?auto_840857 ?auto_840863 ) ) ( not ( = ?auto_840857 ?auto_840864 ) ) ( not ( = ?auto_840857 ?auto_840865 ) ) ( not ( = ?auto_840857 ?auto_840866 ) ) ( not ( = ?auto_840857 ?auto_840867 ) ) ( not ( = ?auto_840857 ?auto_840868 ) ) ( not ( = ?auto_840857 ?auto_840869 ) ) ( not ( = ?auto_840857 ?auto_840870 ) ) ( not ( = ?auto_840857 ?auto_840871 ) ) ( not ( = ?auto_840858 ?auto_840859 ) ) ( not ( = ?auto_840858 ?auto_840860 ) ) ( not ( = ?auto_840858 ?auto_840861 ) ) ( not ( = ?auto_840858 ?auto_840862 ) ) ( not ( = ?auto_840858 ?auto_840863 ) ) ( not ( = ?auto_840858 ?auto_840864 ) ) ( not ( = ?auto_840858 ?auto_840865 ) ) ( not ( = ?auto_840858 ?auto_840866 ) ) ( not ( = ?auto_840858 ?auto_840867 ) ) ( not ( = ?auto_840858 ?auto_840868 ) ) ( not ( = ?auto_840858 ?auto_840869 ) ) ( not ( = ?auto_840858 ?auto_840870 ) ) ( not ( = ?auto_840858 ?auto_840871 ) ) ( not ( = ?auto_840859 ?auto_840860 ) ) ( not ( = ?auto_840859 ?auto_840861 ) ) ( not ( = ?auto_840859 ?auto_840862 ) ) ( not ( = ?auto_840859 ?auto_840863 ) ) ( not ( = ?auto_840859 ?auto_840864 ) ) ( not ( = ?auto_840859 ?auto_840865 ) ) ( not ( = ?auto_840859 ?auto_840866 ) ) ( not ( = ?auto_840859 ?auto_840867 ) ) ( not ( = ?auto_840859 ?auto_840868 ) ) ( not ( = ?auto_840859 ?auto_840869 ) ) ( not ( = ?auto_840859 ?auto_840870 ) ) ( not ( = ?auto_840859 ?auto_840871 ) ) ( not ( = ?auto_840860 ?auto_840861 ) ) ( not ( = ?auto_840860 ?auto_840862 ) ) ( not ( = ?auto_840860 ?auto_840863 ) ) ( not ( = ?auto_840860 ?auto_840864 ) ) ( not ( = ?auto_840860 ?auto_840865 ) ) ( not ( = ?auto_840860 ?auto_840866 ) ) ( not ( = ?auto_840860 ?auto_840867 ) ) ( not ( = ?auto_840860 ?auto_840868 ) ) ( not ( = ?auto_840860 ?auto_840869 ) ) ( not ( = ?auto_840860 ?auto_840870 ) ) ( not ( = ?auto_840860 ?auto_840871 ) ) ( not ( = ?auto_840861 ?auto_840862 ) ) ( not ( = ?auto_840861 ?auto_840863 ) ) ( not ( = ?auto_840861 ?auto_840864 ) ) ( not ( = ?auto_840861 ?auto_840865 ) ) ( not ( = ?auto_840861 ?auto_840866 ) ) ( not ( = ?auto_840861 ?auto_840867 ) ) ( not ( = ?auto_840861 ?auto_840868 ) ) ( not ( = ?auto_840861 ?auto_840869 ) ) ( not ( = ?auto_840861 ?auto_840870 ) ) ( not ( = ?auto_840861 ?auto_840871 ) ) ( not ( = ?auto_840862 ?auto_840863 ) ) ( not ( = ?auto_840862 ?auto_840864 ) ) ( not ( = ?auto_840862 ?auto_840865 ) ) ( not ( = ?auto_840862 ?auto_840866 ) ) ( not ( = ?auto_840862 ?auto_840867 ) ) ( not ( = ?auto_840862 ?auto_840868 ) ) ( not ( = ?auto_840862 ?auto_840869 ) ) ( not ( = ?auto_840862 ?auto_840870 ) ) ( not ( = ?auto_840862 ?auto_840871 ) ) ( not ( = ?auto_840863 ?auto_840864 ) ) ( not ( = ?auto_840863 ?auto_840865 ) ) ( not ( = ?auto_840863 ?auto_840866 ) ) ( not ( = ?auto_840863 ?auto_840867 ) ) ( not ( = ?auto_840863 ?auto_840868 ) ) ( not ( = ?auto_840863 ?auto_840869 ) ) ( not ( = ?auto_840863 ?auto_840870 ) ) ( not ( = ?auto_840863 ?auto_840871 ) ) ( not ( = ?auto_840864 ?auto_840865 ) ) ( not ( = ?auto_840864 ?auto_840866 ) ) ( not ( = ?auto_840864 ?auto_840867 ) ) ( not ( = ?auto_840864 ?auto_840868 ) ) ( not ( = ?auto_840864 ?auto_840869 ) ) ( not ( = ?auto_840864 ?auto_840870 ) ) ( not ( = ?auto_840864 ?auto_840871 ) ) ( not ( = ?auto_840865 ?auto_840866 ) ) ( not ( = ?auto_840865 ?auto_840867 ) ) ( not ( = ?auto_840865 ?auto_840868 ) ) ( not ( = ?auto_840865 ?auto_840869 ) ) ( not ( = ?auto_840865 ?auto_840870 ) ) ( not ( = ?auto_840865 ?auto_840871 ) ) ( not ( = ?auto_840866 ?auto_840867 ) ) ( not ( = ?auto_840866 ?auto_840868 ) ) ( not ( = ?auto_840866 ?auto_840869 ) ) ( not ( = ?auto_840866 ?auto_840870 ) ) ( not ( = ?auto_840866 ?auto_840871 ) ) ( not ( = ?auto_840867 ?auto_840868 ) ) ( not ( = ?auto_840867 ?auto_840869 ) ) ( not ( = ?auto_840867 ?auto_840870 ) ) ( not ( = ?auto_840867 ?auto_840871 ) ) ( not ( = ?auto_840868 ?auto_840869 ) ) ( not ( = ?auto_840868 ?auto_840870 ) ) ( not ( = ?auto_840868 ?auto_840871 ) ) ( not ( = ?auto_840869 ?auto_840870 ) ) ( not ( = ?auto_840869 ?auto_840871 ) ) ( not ( = ?auto_840870 ?auto_840871 ) ) ( ON ?auto_840869 ?auto_840870 ) ( CLEAR ?auto_840867 ) ( ON ?auto_840868 ?auto_840869 ) ( CLEAR ?auto_840868 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_840856 ?auto_840857 ?auto_840858 ?auto_840859 ?auto_840860 ?auto_840861 ?auto_840862 ?auto_840863 ?auto_840864 ?auto_840865 ?auto_840866 ?auto_840867 ?auto_840868 )
      ( MAKE-15PILE ?auto_840856 ?auto_840857 ?auto_840858 ?auto_840859 ?auto_840860 ?auto_840861 ?auto_840862 ?auto_840863 ?auto_840864 ?auto_840865 ?auto_840866 ?auto_840867 ?auto_840868 ?auto_840869 ?auto_840870 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_840918 - BLOCK
      ?auto_840919 - BLOCK
      ?auto_840920 - BLOCK
      ?auto_840921 - BLOCK
      ?auto_840922 - BLOCK
      ?auto_840923 - BLOCK
      ?auto_840924 - BLOCK
      ?auto_840925 - BLOCK
      ?auto_840926 - BLOCK
      ?auto_840927 - BLOCK
      ?auto_840928 - BLOCK
      ?auto_840929 - BLOCK
      ?auto_840930 - BLOCK
      ?auto_840931 - BLOCK
      ?auto_840932 - BLOCK
    )
    :vars
    (
      ?auto_840933 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_840932 ?auto_840933 ) ( ON-TABLE ?auto_840918 ) ( ON ?auto_840919 ?auto_840918 ) ( ON ?auto_840920 ?auto_840919 ) ( ON ?auto_840921 ?auto_840920 ) ( ON ?auto_840922 ?auto_840921 ) ( ON ?auto_840923 ?auto_840922 ) ( ON ?auto_840924 ?auto_840923 ) ( ON ?auto_840925 ?auto_840924 ) ( ON ?auto_840926 ?auto_840925 ) ( ON ?auto_840927 ?auto_840926 ) ( ON ?auto_840928 ?auto_840927 ) ( not ( = ?auto_840918 ?auto_840919 ) ) ( not ( = ?auto_840918 ?auto_840920 ) ) ( not ( = ?auto_840918 ?auto_840921 ) ) ( not ( = ?auto_840918 ?auto_840922 ) ) ( not ( = ?auto_840918 ?auto_840923 ) ) ( not ( = ?auto_840918 ?auto_840924 ) ) ( not ( = ?auto_840918 ?auto_840925 ) ) ( not ( = ?auto_840918 ?auto_840926 ) ) ( not ( = ?auto_840918 ?auto_840927 ) ) ( not ( = ?auto_840918 ?auto_840928 ) ) ( not ( = ?auto_840918 ?auto_840929 ) ) ( not ( = ?auto_840918 ?auto_840930 ) ) ( not ( = ?auto_840918 ?auto_840931 ) ) ( not ( = ?auto_840918 ?auto_840932 ) ) ( not ( = ?auto_840918 ?auto_840933 ) ) ( not ( = ?auto_840919 ?auto_840920 ) ) ( not ( = ?auto_840919 ?auto_840921 ) ) ( not ( = ?auto_840919 ?auto_840922 ) ) ( not ( = ?auto_840919 ?auto_840923 ) ) ( not ( = ?auto_840919 ?auto_840924 ) ) ( not ( = ?auto_840919 ?auto_840925 ) ) ( not ( = ?auto_840919 ?auto_840926 ) ) ( not ( = ?auto_840919 ?auto_840927 ) ) ( not ( = ?auto_840919 ?auto_840928 ) ) ( not ( = ?auto_840919 ?auto_840929 ) ) ( not ( = ?auto_840919 ?auto_840930 ) ) ( not ( = ?auto_840919 ?auto_840931 ) ) ( not ( = ?auto_840919 ?auto_840932 ) ) ( not ( = ?auto_840919 ?auto_840933 ) ) ( not ( = ?auto_840920 ?auto_840921 ) ) ( not ( = ?auto_840920 ?auto_840922 ) ) ( not ( = ?auto_840920 ?auto_840923 ) ) ( not ( = ?auto_840920 ?auto_840924 ) ) ( not ( = ?auto_840920 ?auto_840925 ) ) ( not ( = ?auto_840920 ?auto_840926 ) ) ( not ( = ?auto_840920 ?auto_840927 ) ) ( not ( = ?auto_840920 ?auto_840928 ) ) ( not ( = ?auto_840920 ?auto_840929 ) ) ( not ( = ?auto_840920 ?auto_840930 ) ) ( not ( = ?auto_840920 ?auto_840931 ) ) ( not ( = ?auto_840920 ?auto_840932 ) ) ( not ( = ?auto_840920 ?auto_840933 ) ) ( not ( = ?auto_840921 ?auto_840922 ) ) ( not ( = ?auto_840921 ?auto_840923 ) ) ( not ( = ?auto_840921 ?auto_840924 ) ) ( not ( = ?auto_840921 ?auto_840925 ) ) ( not ( = ?auto_840921 ?auto_840926 ) ) ( not ( = ?auto_840921 ?auto_840927 ) ) ( not ( = ?auto_840921 ?auto_840928 ) ) ( not ( = ?auto_840921 ?auto_840929 ) ) ( not ( = ?auto_840921 ?auto_840930 ) ) ( not ( = ?auto_840921 ?auto_840931 ) ) ( not ( = ?auto_840921 ?auto_840932 ) ) ( not ( = ?auto_840921 ?auto_840933 ) ) ( not ( = ?auto_840922 ?auto_840923 ) ) ( not ( = ?auto_840922 ?auto_840924 ) ) ( not ( = ?auto_840922 ?auto_840925 ) ) ( not ( = ?auto_840922 ?auto_840926 ) ) ( not ( = ?auto_840922 ?auto_840927 ) ) ( not ( = ?auto_840922 ?auto_840928 ) ) ( not ( = ?auto_840922 ?auto_840929 ) ) ( not ( = ?auto_840922 ?auto_840930 ) ) ( not ( = ?auto_840922 ?auto_840931 ) ) ( not ( = ?auto_840922 ?auto_840932 ) ) ( not ( = ?auto_840922 ?auto_840933 ) ) ( not ( = ?auto_840923 ?auto_840924 ) ) ( not ( = ?auto_840923 ?auto_840925 ) ) ( not ( = ?auto_840923 ?auto_840926 ) ) ( not ( = ?auto_840923 ?auto_840927 ) ) ( not ( = ?auto_840923 ?auto_840928 ) ) ( not ( = ?auto_840923 ?auto_840929 ) ) ( not ( = ?auto_840923 ?auto_840930 ) ) ( not ( = ?auto_840923 ?auto_840931 ) ) ( not ( = ?auto_840923 ?auto_840932 ) ) ( not ( = ?auto_840923 ?auto_840933 ) ) ( not ( = ?auto_840924 ?auto_840925 ) ) ( not ( = ?auto_840924 ?auto_840926 ) ) ( not ( = ?auto_840924 ?auto_840927 ) ) ( not ( = ?auto_840924 ?auto_840928 ) ) ( not ( = ?auto_840924 ?auto_840929 ) ) ( not ( = ?auto_840924 ?auto_840930 ) ) ( not ( = ?auto_840924 ?auto_840931 ) ) ( not ( = ?auto_840924 ?auto_840932 ) ) ( not ( = ?auto_840924 ?auto_840933 ) ) ( not ( = ?auto_840925 ?auto_840926 ) ) ( not ( = ?auto_840925 ?auto_840927 ) ) ( not ( = ?auto_840925 ?auto_840928 ) ) ( not ( = ?auto_840925 ?auto_840929 ) ) ( not ( = ?auto_840925 ?auto_840930 ) ) ( not ( = ?auto_840925 ?auto_840931 ) ) ( not ( = ?auto_840925 ?auto_840932 ) ) ( not ( = ?auto_840925 ?auto_840933 ) ) ( not ( = ?auto_840926 ?auto_840927 ) ) ( not ( = ?auto_840926 ?auto_840928 ) ) ( not ( = ?auto_840926 ?auto_840929 ) ) ( not ( = ?auto_840926 ?auto_840930 ) ) ( not ( = ?auto_840926 ?auto_840931 ) ) ( not ( = ?auto_840926 ?auto_840932 ) ) ( not ( = ?auto_840926 ?auto_840933 ) ) ( not ( = ?auto_840927 ?auto_840928 ) ) ( not ( = ?auto_840927 ?auto_840929 ) ) ( not ( = ?auto_840927 ?auto_840930 ) ) ( not ( = ?auto_840927 ?auto_840931 ) ) ( not ( = ?auto_840927 ?auto_840932 ) ) ( not ( = ?auto_840927 ?auto_840933 ) ) ( not ( = ?auto_840928 ?auto_840929 ) ) ( not ( = ?auto_840928 ?auto_840930 ) ) ( not ( = ?auto_840928 ?auto_840931 ) ) ( not ( = ?auto_840928 ?auto_840932 ) ) ( not ( = ?auto_840928 ?auto_840933 ) ) ( not ( = ?auto_840929 ?auto_840930 ) ) ( not ( = ?auto_840929 ?auto_840931 ) ) ( not ( = ?auto_840929 ?auto_840932 ) ) ( not ( = ?auto_840929 ?auto_840933 ) ) ( not ( = ?auto_840930 ?auto_840931 ) ) ( not ( = ?auto_840930 ?auto_840932 ) ) ( not ( = ?auto_840930 ?auto_840933 ) ) ( not ( = ?auto_840931 ?auto_840932 ) ) ( not ( = ?auto_840931 ?auto_840933 ) ) ( not ( = ?auto_840932 ?auto_840933 ) ) ( ON ?auto_840931 ?auto_840932 ) ( ON ?auto_840930 ?auto_840931 ) ( CLEAR ?auto_840928 ) ( ON ?auto_840929 ?auto_840930 ) ( CLEAR ?auto_840929 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_840918 ?auto_840919 ?auto_840920 ?auto_840921 ?auto_840922 ?auto_840923 ?auto_840924 ?auto_840925 ?auto_840926 ?auto_840927 ?auto_840928 ?auto_840929 )
      ( MAKE-15PILE ?auto_840918 ?auto_840919 ?auto_840920 ?auto_840921 ?auto_840922 ?auto_840923 ?auto_840924 ?auto_840925 ?auto_840926 ?auto_840927 ?auto_840928 ?auto_840929 ?auto_840930 ?auto_840931 ?auto_840932 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_840980 - BLOCK
      ?auto_840981 - BLOCK
      ?auto_840982 - BLOCK
      ?auto_840983 - BLOCK
      ?auto_840984 - BLOCK
      ?auto_840985 - BLOCK
      ?auto_840986 - BLOCK
      ?auto_840987 - BLOCK
      ?auto_840988 - BLOCK
      ?auto_840989 - BLOCK
      ?auto_840990 - BLOCK
      ?auto_840991 - BLOCK
      ?auto_840992 - BLOCK
      ?auto_840993 - BLOCK
      ?auto_840994 - BLOCK
    )
    :vars
    (
      ?auto_840995 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_840994 ?auto_840995 ) ( ON-TABLE ?auto_840980 ) ( ON ?auto_840981 ?auto_840980 ) ( ON ?auto_840982 ?auto_840981 ) ( ON ?auto_840983 ?auto_840982 ) ( ON ?auto_840984 ?auto_840983 ) ( ON ?auto_840985 ?auto_840984 ) ( ON ?auto_840986 ?auto_840985 ) ( ON ?auto_840987 ?auto_840986 ) ( ON ?auto_840988 ?auto_840987 ) ( ON ?auto_840989 ?auto_840988 ) ( not ( = ?auto_840980 ?auto_840981 ) ) ( not ( = ?auto_840980 ?auto_840982 ) ) ( not ( = ?auto_840980 ?auto_840983 ) ) ( not ( = ?auto_840980 ?auto_840984 ) ) ( not ( = ?auto_840980 ?auto_840985 ) ) ( not ( = ?auto_840980 ?auto_840986 ) ) ( not ( = ?auto_840980 ?auto_840987 ) ) ( not ( = ?auto_840980 ?auto_840988 ) ) ( not ( = ?auto_840980 ?auto_840989 ) ) ( not ( = ?auto_840980 ?auto_840990 ) ) ( not ( = ?auto_840980 ?auto_840991 ) ) ( not ( = ?auto_840980 ?auto_840992 ) ) ( not ( = ?auto_840980 ?auto_840993 ) ) ( not ( = ?auto_840980 ?auto_840994 ) ) ( not ( = ?auto_840980 ?auto_840995 ) ) ( not ( = ?auto_840981 ?auto_840982 ) ) ( not ( = ?auto_840981 ?auto_840983 ) ) ( not ( = ?auto_840981 ?auto_840984 ) ) ( not ( = ?auto_840981 ?auto_840985 ) ) ( not ( = ?auto_840981 ?auto_840986 ) ) ( not ( = ?auto_840981 ?auto_840987 ) ) ( not ( = ?auto_840981 ?auto_840988 ) ) ( not ( = ?auto_840981 ?auto_840989 ) ) ( not ( = ?auto_840981 ?auto_840990 ) ) ( not ( = ?auto_840981 ?auto_840991 ) ) ( not ( = ?auto_840981 ?auto_840992 ) ) ( not ( = ?auto_840981 ?auto_840993 ) ) ( not ( = ?auto_840981 ?auto_840994 ) ) ( not ( = ?auto_840981 ?auto_840995 ) ) ( not ( = ?auto_840982 ?auto_840983 ) ) ( not ( = ?auto_840982 ?auto_840984 ) ) ( not ( = ?auto_840982 ?auto_840985 ) ) ( not ( = ?auto_840982 ?auto_840986 ) ) ( not ( = ?auto_840982 ?auto_840987 ) ) ( not ( = ?auto_840982 ?auto_840988 ) ) ( not ( = ?auto_840982 ?auto_840989 ) ) ( not ( = ?auto_840982 ?auto_840990 ) ) ( not ( = ?auto_840982 ?auto_840991 ) ) ( not ( = ?auto_840982 ?auto_840992 ) ) ( not ( = ?auto_840982 ?auto_840993 ) ) ( not ( = ?auto_840982 ?auto_840994 ) ) ( not ( = ?auto_840982 ?auto_840995 ) ) ( not ( = ?auto_840983 ?auto_840984 ) ) ( not ( = ?auto_840983 ?auto_840985 ) ) ( not ( = ?auto_840983 ?auto_840986 ) ) ( not ( = ?auto_840983 ?auto_840987 ) ) ( not ( = ?auto_840983 ?auto_840988 ) ) ( not ( = ?auto_840983 ?auto_840989 ) ) ( not ( = ?auto_840983 ?auto_840990 ) ) ( not ( = ?auto_840983 ?auto_840991 ) ) ( not ( = ?auto_840983 ?auto_840992 ) ) ( not ( = ?auto_840983 ?auto_840993 ) ) ( not ( = ?auto_840983 ?auto_840994 ) ) ( not ( = ?auto_840983 ?auto_840995 ) ) ( not ( = ?auto_840984 ?auto_840985 ) ) ( not ( = ?auto_840984 ?auto_840986 ) ) ( not ( = ?auto_840984 ?auto_840987 ) ) ( not ( = ?auto_840984 ?auto_840988 ) ) ( not ( = ?auto_840984 ?auto_840989 ) ) ( not ( = ?auto_840984 ?auto_840990 ) ) ( not ( = ?auto_840984 ?auto_840991 ) ) ( not ( = ?auto_840984 ?auto_840992 ) ) ( not ( = ?auto_840984 ?auto_840993 ) ) ( not ( = ?auto_840984 ?auto_840994 ) ) ( not ( = ?auto_840984 ?auto_840995 ) ) ( not ( = ?auto_840985 ?auto_840986 ) ) ( not ( = ?auto_840985 ?auto_840987 ) ) ( not ( = ?auto_840985 ?auto_840988 ) ) ( not ( = ?auto_840985 ?auto_840989 ) ) ( not ( = ?auto_840985 ?auto_840990 ) ) ( not ( = ?auto_840985 ?auto_840991 ) ) ( not ( = ?auto_840985 ?auto_840992 ) ) ( not ( = ?auto_840985 ?auto_840993 ) ) ( not ( = ?auto_840985 ?auto_840994 ) ) ( not ( = ?auto_840985 ?auto_840995 ) ) ( not ( = ?auto_840986 ?auto_840987 ) ) ( not ( = ?auto_840986 ?auto_840988 ) ) ( not ( = ?auto_840986 ?auto_840989 ) ) ( not ( = ?auto_840986 ?auto_840990 ) ) ( not ( = ?auto_840986 ?auto_840991 ) ) ( not ( = ?auto_840986 ?auto_840992 ) ) ( not ( = ?auto_840986 ?auto_840993 ) ) ( not ( = ?auto_840986 ?auto_840994 ) ) ( not ( = ?auto_840986 ?auto_840995 ) ) ( not ( = ?auto_840987 ?auto_840988 ) ) ( not ( = ?auto_840987 ?auto_840989 ) ) ( not ( = ?auto_840987 ?auto_840990 ) ) ( not ( = ?auto_840987 ?auto_840991 ) ) ( not ( = ?auto_840987 ?auto_840992 ) ) ( not ( = ?auto_840987 ?auto_840993 ) ) ( not ( = ?auto_840987 ?auto_840994 ) ) ( not ( = ?auto_840987 ?auto_840995 ) ) ( not ( = ?auto_840988 ?auto_840989 ) ) ( not ( = ?auto_840988 ?auto_840990 ) ) ( not ( = ?auto_840988 ?auto_840991 ) ) ( not ( = ?auto_840988 ?auto_840992 ) ) ( not ( = ?auto_840988 ?auto_840993 ) ) ( not ( = ?auto_840988 ?auto_840994 ) ) ( not ( = ?auto_840988 ?auto_840995 ) ) ( not ( = ?auto_840989 ?auto_840990 ) ) ( not ( = ?auto_840989 ?auto_840991 ) ) ( not ( = ?auto_840989 ?auto_840992 ) ) ( not ( = ?auto_840989 ?auto_840993 ) ) ( not ( = ?auto_840989 ?auto_840994 ) ) ( not ( = ?auto_840989 ?auto_840995 ) ) ( not ( = ?auto_840990 ?auto_840991 ) ) ( not ( = ?auto_840990 ?auto_840992 ) ) ( not ( = ?auto_840990 ?auto_840993 ) ) ( not ( = ?auto_840990 ?auto_840994 ) ) ( not ( = ?auto_840990 ?auto_840995 ) ) ( not ( = ?auto_840991 ?auto_840992 ) ) ( not ( = ?auto_840991 ?auto_840993 ) ) ( not ( = ?auto_840991 ?auto_840994 ) ) ( not ( = ?auto_840991 ?auto_840995 ) ) ( not ( = ?auto_840992 ?auto_840993 ) ) ( not ( = ?auto_840992 ?auto_840994 ) ) ( not ( = ?auto_840992 ?auto_840995 ) ) ( not ( = ?auto_840993 ?auto_840994 ) ) ( not ( = ?auto_840993 ?auto_840995 ) ) ( not ( = ?auto_840994 ?auto_840995 ) ) ( ON ?auto_840993 ?auto_840994 ) ( ON ?auto_840992 ?auto_840993 ) ( ON ?auto_840991 ?auto_840992 ) ( CLEAR ?auto_840989 ) ( ON ?auto_840990 ?auto_840991 ) ( CLEAR ?auto_840990 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_840980 ?auto_840981 ?auto_840982 ?auto_840983 ?auto_840984 ?auto_840985 ?auto_840986 ?auto_840987 ?auto_840988 ?auto_840989 ?auto_840990 )
      ( MAKE-15PILE ?auto_840980 ?auto_840981 ?auto_840982 ?auto_840983 ?auto_840984 ?auto_840985 ?auto_840986 ?auto_840987 ?auto_840988 ?auto_840989 ?auto_840990 ?auto_840991 ?auto_840992 ?auto_840993 ?auto_840994 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_841042 - BLOCK
      ?auto_841043 - BLOCK
      ?auto_841044 - BLOCK
      ?auto_841045 - BLOCK
      ?auto_841046 - BLOCK
      ?auto_841047 - BLOCK
      ?auto_841048 - BLOCK
      ?auto_841049 - BLOCK
      ?auto_841050 - BLOCK
      ?auto_841051 - BLOCK
      ?auto_841052 - BLOCK
      ?auto_841053 - BLOCK
      ?auto_841054 - BLOCK
      ?auto_841055 - BLOCK
      ?auto_841056 - BLOCK
    )
    :vars
    (
      ?auto_841057 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_841056 ?auto_841057 ) ( ON-TABLE ?auto_841042 ) ( ON ?auto_841043 ?auto_841042 ) ( ON ?auto_841044 ?auto_841043 ) ( ON ?auto_841045 ?auto_841044 ) ( ON ?auto_841046 ?auto_841045 ) ( ON ?auto_841047 ?auto_841046 ) ( ON ?auto_841048 ?auto_841047 ) ( ON ?auto_841049 ?auto_841048 ) ( ON ?auto_841050 ?auto_841049 ) ( not ( = ?auto_841042 ?auto_841043 ) ) ( not ( = ?auto_841042 ?auto_841044 ) ) ( not ( = ?auto_841042 ?auto_841045 ) ) ( not ( = ?auto_841042 ?auto_841046 ) ) ( not ( = ?auto_841042 ?auto_841047 ) ) ( not ( = ?auto_841042 ?auto_841048 ) ) ( not ( = ?auto_841042 ?auto_841049 ) ) ( not ( = ?auto_841042 ?auto_841050 ) ) ( not ( = ?auto_841042 ?auto_841051 ) ) ( not ( = ?auto_841042 ?auto_841052 ) ) ( not ( = ?auto_841042 ?auto_841053 ) ) ( not ( = ?auto_841042 ?auto_841054 ) ) ( not ( = ?auto_841042 ?auto_841055 ) ) ( not ( = ?auto_841042 ?auto_841056 ) ) ( not ( = ?auto_841042 ?auto_841057 ) ) ( not ( = ?auto_841043 ?auto_841044 ) ) ( not ( = ?auto_841043 ?auto_841045 ) ) ( not ( = ?auto_841043 ?auto_841046 ) ) ( not ( = ?auto_841043 ?auto_841047 ) ) ( not ( = ?auto_841043 ?auto_841048 ) ) ( not ( = ?auto_841043 ?auto_841049 ) ) ( not ( = ?auto_841043 ?auto_841050 ) ) ( not ( = ?auto_841043 ?auto_841051 ) ) ( not ( = ?auto_841043 ?auto_841052 ) ) ( not ( = ?auto_841043 ?auto_841053 ) ) ( not ( = ?auto_841043 ?auto_841054 ) ) ( not ( = ?auto_841043 ?auto_841055 ) ) ( not ( = ?auto_841043 ?auto_841056 ) ) ( not ( = ?auto_841043 ?auto_841057 ) ) ( not ( = ?auto_841044 ?auto_841045 ) ) ( not ( = ?auto_841044 ?auto_841046 ) ) ( not ( = ?auto_841044 ?auto_841047 ) ) ( not ( = ?auto_841044 ?auto_841048 ) ) ( not ( = ?auto_841044 ?auto_841049 ) ) ( not ( = ?auto_841044 ?auto_841050 ) ) ( not ( = ?auto_841044 ?auto_841051 ) ) ( not ( = ?auto_841044 ?auto_841052 ) ) ( not ( = ?auto_841044 ?auto_841053 ) ) ( not ( = ?auto_841044 ?auto_841054 ) ) ( not ( = ?auto_841044 ?auto_841055 ) ) ( not ( = ?auto_841044 ?auto_841056 ) ) ( not ( = ?auto_841044 ?auto_841057 ) ) ( not ( = ?auto_841045 ?auto_841046 ) ) ( not ( = ?auto_841045 ?auto_841047 ) ) ( not ( = ?auto_841045 ?auto_841048 ) ) ( not ( = ?auto_841045 ?auto_841049 ) ) ( not ( = ?auto_841045 ?auto_841050 ) ) ( not ( = ?auto_841045 ?auto_841051 ) ) ( not ( = ?auto_841045 ?auto_841052 ) ) ( not ( = ?auto_841045 ?auto_841053 ) ) ( not ( = ?auto_841045 ?auto_841054 ) ) ( not ( = ?auto_841045 ?auto_841055 ) ) ( not ( = ?auto_841045 ?auto_841056 ) ) ( not ( = ?auto_841045 ?auto_841057 ) ) ( not ( = ?auto_841046 ?auto_841047 ) ) ( not ( = ?auto_841046 ?auto_841048 ) ) ( not ( = ?auto_841046 ?auto_841049 ) ) ( not ( = ?auto_841046 ?auto_841050 ) ) ( not ( = ?auto_841046 ?auto_841051 ) ) ( not ( = ?auto_841046 ?auto_841052 ) ) ( not ( = ?auto_841046 ?auto_841053 ) ) ( not ( = ?auto_841046 ?auto_841054 ) ) ( not ( = ?auto_841046 ?auto_841055 ) ) ( not ( = ?auto_841046 ?auto_841056 ) ) ( not ( = ?auto_841046 ?auto_841057 ) ) ( not ( = ?auto_841047 ?auto_841048 ) ) ( not ( = ?auto_841047 ?auto_841049 ) ) ( not ( = ?auto_841047 ?auto_841050 ) ) ( not ( = ?auto_841047 ?auto_841051 ) ) ( not ( = ?auto_841047 ?auto_841052 ) ) ( not ( = ?auto_841047 ?auto_841053 ) ) ( not ( = ?auto_841047 ?auto_841054 ) ) ( not ( = ?auto_841047 ?auto_841055 ) ) ( not ( = ?auto_841047 ?auto_841056 ) ) ( not ( = ?auto_841047 ?auto_841057 ) ) ( not ( = ?auto_841048 ?auto_841049 ) ) ( not ( = ?auto_841048 ?auto_841050 ) ) ( not ( = ?auto_841048 ?auto_841051 ) ) ( not ( = ?auto_841048 ?auto_841052 ) ) ( not ( = ?auto_841048 ?auto_841053 ) ) ( not ( = ?auto_841048 ?auto_841054 ) ) ( not ( = ?auto_841048 ?auto_841055 ) ) ( not ( = ?auto_841048 ?auto_841056 ) ) ( not ( = ?auto_841048 ?auto_841057 ) ) ( not ( = ?auto_841049 ?auto_841050 ) ) ( not ( = ?auto_841049 ?auto_841051 ) ) ( not ( = ?auto_841049 ?auto_841052 ) ) ( not ( = ?auto_841049 ?auto_841053 ) ) ( not ( = ?auto_841049 ?auto_841054 ) ) ( not ( = ?auto_841049 ?auto_841055 ) ) ( not ( = ?auto_841049 ?auto_841056 ) ) ( not ( = ?auto_841049 ?auto_841057 ) ) ( not ( = ?auto_841050 ?auto_841051 ) ) ( not ( = ?auto_841050 ?auto_841052 ) ) ( not ( = ?auto_841050 ?auto_841053 ) ) ( not ( = ?auto_841050 ?auto_841054 ) ) ( not ( = ?auto_841050 ?auto_841055 ) ) ( not ( = ?auto_841050 ?auto_841056 ) ) ( not ( = ?auto_841050 ?auto_841057 ) ) ( not ( = ?auto_841051 ?auto_841052 ) ) ( not ( = ?auto_841051 ?auto_841053 ) ) ( not ( = ?auto_841051 ?auto_841054 ) ) ( not ( = ?auto_841051 ?auto_841055 ) ) ( not ( = ?auto_841051 ?auto_841056 ) ) ( not ( = ?auto_841051 ?auto_841057 ) ) ( not ( = ?auto_841052 ?auto_841053 ) ) ( not ( = ?auto_841052 ?auto_841054 ) ) ( not ( = ?auto_841052 ?auto_841055 ) ) ( not ( = ?auto_841052 ?auto_841056 ) ) ( not ( = ?auto_841052 ?auto_841057 ) ) ( not ( = ?auto_841053 ?auto_841054 ) ) ( not ( = ?auto_841053 ?auto_841055 ) ) ( not ( = ?auto_841053 ?auto_841056 ) ) ( not ( = ?auto_841053 ?auto_841057 ) ) ( not ( = ?auto_841054 ?auto_841055 ) ) ( not ( = ?auto_841054 ?auto_841056 ) ) ( not ( = ?auto_841054 ?auto_841057 ) ) ( not ( = ?auto_841055 ?auto_841056 ) ) ( not ( = ?auto_841055 ?auto_841057 ) ) ( not ( = ?auto_841056 ?auto_841057 ) ) ( ON ?auto_841055 ?auto_841056 ) ( ON ?auto_841054 ?auto_841055 ) ( ON ?auto_841053 ?auto_841054 ) ( ON ?auto_841052 ?auto_841053 ) ( CLEAR ?auto_841050 ) ( ON ?auto_841051 ?auto_841052 ) ( CLEAR ?auto_841051 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_841042 ?auto_841043 ?auto_841044 ?auto_841045 ?auto_841046 ?auto_841047 ?auto_841048 ?auto_841049 ?auto_841050 ?auto_841051 )
      ( MAKE-15PILE ?auto_841042 ?auto_841043 ?auto_841044 ?auto_841045 ?auto_841046 ?auto_841047 ?auto_841048 ?auto_841049 ?auto_841050 ?auto_841051 ?auto_841052 ?auto_841053 ?auto_841054 ?auto_841055 ?auto_841056 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_841104 - BLOCK
      ?auto_841105 - BLOCK
      ?auto_841106 - BLOCK
      ?auto_841107 - BLOCK
      ?auto_841108 - BLOCK
      ?auto_841109 - BLOCK
      ?auto_841110 - BLOCK
      ?auto_841111 - BLOCK
      ?auto_841112 - BLOCK
      ?auto_841113 - BLOCK
      ?auto_841114 - BLOCK
      ?auto_841115 - BLOCK
      ?auto_841116 - BLOCK
      ?auto_841117 - BLOCK
      ?auto_841118 - BLOCK
    )
    :vars
    (
      ?auto_841119 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_841118 ?auto_841119 ) ( ON-TABLE ?auto_841104 ) ( ON ?auto_841105 ?auto_841104 ) ( ON ?auto_841106 ?auto_841105 ) ( ON ?auto_841107 ?auto_841106 ) ( ON ?auto_841108 ?auto_841107 ) ( ON ?auto_841109 ?auto_841108 ) ( ON ?auto_841110 ?auto_841109 ) ( ON ?auto_841111 ?auto_841110 ) ( not ( = ?auto_841104 ?auto_841105 ) ) ( not ( = ?auto_841104 ?auto_841106 ) ) ( not ( = ?auto_841104 ?auto_841107 ) ) ( not ( = ?auto_841104 ?auto_841108 ) ) ( not ( = ?auto_841104 ?auto_841109 ) ) ( not ( = ?auto_841104 ?auto_841110 ) ) ( not ( = ?auto_841104 ?auto_841111 ) ) ( not ( = ?auto_841104 ?auto_841112 ) ) ( not ( = ?auto_841104 ?auto_841113 ) ) ( not ( = ?auto_841104 ?auto_841114 ) ) ( not ( = ?auto_841104 ?auto_841115 ) ) ( not ( = ?auto_841104 ?auto_841116 ) ) ( not ( = ?auto_841104 ?auto_841117 ) ) ( not ( = ?auto_841104 ?auto_841118 ) ) ( not ( = ?auto_841104 ?auto_841119 ) ) ( not ( = ?auto_841105 ?auto_841106 ) ) ( not ( = ?auto_841105 ?auto_841107 ) ) ( not ( = ?auto_841105 ?auto_841108 ) ) ( not ( = ?auto_841105 ?auto_841109 ) ) ( not ( = ?auto_841105 ?auto_841110 ) ) ( not ( = ?auto_841105 ?auto_841111 ) ) ( not ( = ?auto_841105 ?auto_841112 ) ) ( not ( = ?auto_841105 ?auto_841113 ) ) ( not ( = ?auto_841105 ?auto_841114 ) ) ( not ( = ?auto_841105 ?auto_841115 ) ) ( not ( = ?auto_841105 ?auto_841116 ) ) ( not ( = ?auto_841105 ?auto_841117 ) ) ( not ( = ?auto_841105 ?auto_841118 ) ) ( not ( = ?auto_841105 ?auto_841119 ) ) ( not ( = ?auto_841106 ?auto_841107 ) ) ( not ( = ?auto_841106 ?auto_841108 ) ) ( not ( = ?auto_841106 ?auto_841109 ) ) ( not ( = ?auto_841106 ?auto_841110 ) ) ( not ( = ?auto_841106 ?auto_841111 ) ) ( not ( = ?auto_841106 ?auto_841112 ) ) ( not ( = ?auto_841106 ?auto_841113 ) ) ( not ( = ?auto_841106 ?auto_841114 ) ) ( not ( = ?auto_841106 ?auto_841115 ) ) ( not ( = ?auto_841106 ?auto_841116 ) ) ( not ( = ?auto_841106 ?auto_841117 ) ) ( not ( = ?auto_841106 ?auto_841118 ) ) ( not ( = ?auto_841106 ?auto_841119 ) ) ( not ( = ?auto_841107 ?auto_841108 ) ) ( not ( = ?auto_841107 ?auto_841109 ) ) ( not ( = ?auto_841107 ?auto_841110 ) ) ( not ( = ?auto_841107 ?auto_841111 ) ) ( not ( = ?auto_841107 ?auto_841112 ) ) ( not ( = ?auto_841107 ?auto_841113 ) ) ( not ( = ?auto_841107 ?auto_841114 ) ) ( not ( = ?auto_841107 ?auto_841115 ) ) ( not ( = ?auto_841107 ?auto_841116 ) ) ( not ( = ?auto_841107 ?auto_841117 ) ) ( not ( = ?auto_841107 ?auto_841118 ) ) ( not ( = ?auto_841107 ?auto_841119 ) ) ( not ( = ?auto_841108 ?auto_841109 ) ) ( not ( = ?auto_841108 ?auto_841110 ) ) ( not ( = ?auto_841108 ?auto_841111 ) ) ( not ( = ?auto_841108 ?auto_841112 ) ) ( not ( = ?auto_841108 ?auto_841113 ) ) ( not ( = ?auto_841108 ?auto_841114 ) ) ( not ( = ?auto_841108 ?auto_841115 ) ) ( not ( = ?auto_841108 ?auto_841116 ) ) ( not ( = ?auto_841108 ?auto_841117 ) ) ( not ( = ?auto_841108 ?auto_841118 ) ) ( not ( = ?auto_841108 ?auto_841119 ) ) ( not ( = ?auto_841109 ?auto_841110 ) ) ( not ( = ?auto_841109 ?auto_841111 ) ) ( not ( = ?auto_841109 ?auto_841112 ) ) ( not ( = ?auto_841109 ?auto_841113 ) ) ( not ( = ?auto_841109 ?auto_841114 ) ) ( not ( = ?auto_841109 ?auto_841115 ) ) ( not ( = ?auto_841109 ?auto_841116 ) ) ( not ( = ?auto_841109 ?auto_841117 ) ) ( not ( = ?auto_841109 ?auto_841118 ) ) ( not ( = ?auto_841109 ?auto_841119 ) ) ( not ( = ?auto_841110 ?auto_841111 ) ) ( not ( = ?auto_841110 ?auto_841112 ) ) ( not ( = ?auto_841110 ?auto_841113 ) ) ( not ( = ?auto_841110 ?auto_841114 ) ) ( not ( = ?auto_841110 ?auto_841115 ) ) ( not ( = ?auto_841110 ?auto_841116 ) ) ( not ( = ?auto_841110 ?auto_841117 ) ) ( not ( = ?auto_841110 ?auto_841118 ) ) ( not ( = ?auto_841110 ?auto_841119 ) ) ( not ( = ?auto_841111 ?auto_841112 ) ) ( not ( = ?auto_841111 ?auto_841113 ) ) ( not ( = ?auto_841111 ?auto_841114 ) ) ( not ( = ?auto_841111 ?auto_841115 ) ) ( not ( = ?auto_841111 ?auto_841116 ) ) ( not ( = ?auto_841111 ?auto_841117 ) ) ( not ( = ?auto_841111 ?auto_841118 ) ) ( not ( = ?auto_841111 ?auto_841119 ) ) ( not ( = ?auto_841112 ?auto_841113 ) ) ( not ( = ?auto_841112 ?auto_841114 ) ) ( not ( = ?auto_841112 ?auto_841115 ) ) ( not ( = ?auto_841112 ?auto_841116 ) ) ( not ( = ?auto_841112 ?auto_841117 ) ) ( not ( = ?auto_841112 ?auto_841118 ) ) ( not ( = ?auto_841112 ?auto_841119 ) ) ( not ( = ?auto_841113 ?auto_841114 ) ) ( not ( = ?auto_841113 ?auto_841115 ) ) ( not ( = ?auto_841113 ?auto_841116 ) ) ( not ( = ?auto_841113 ?auto_841117 ) ) ( not ( = ?auto_841113 ?auto_841118 ) ) ( not ( = ?auto_841113 ?auto_841119 ) ) ( not ( = ?auto_841114 ?auto_841115 ) ) ( not ( = ?auto_841114 ?auto_841116 ) ) ( not ( = ?auto_841114 ?auto_841117 ) ) ( not ( = ?auto_841114 ?auto_841118 ) ) ( not ( = ?auto_841114 ?auto_841119 ) ) ( not ( = ?auto_841115 ?auto_841116 ) ) ( not ( = ?auto_841115 ?auto_841117 ) ) ( not ( = ?auto_841115 ?auto_841118 ) ) ( not ( = ?auto_841115 ?auto_841119 ) ) ( not ( = ?auto_841116 ?auto_841117 ) ) ( not ( = ?auto_841116 ?auto_841118 ) ) ( not ( = ?auto_841116 ?auto_841119 ) ) ( not ( = ?auto_841117 ?auto_841118 ) ) ( not ( = ?auto_841117 ?auto_841119 ) ) ( not ( = ?auto_841118 ?auto_841119 ) ) ( ON ?auto_841117 ?auto_841118 ) ( ON ?auto_841116 ?auto_841117 ) ( ON ?auto_841115 ?auto_841116 ) ( ON ?auto_841114 ?auto_841115 ) ( ON ?auto_841113 ?auto_841114 ) ( CLEAR ?auto_841111 ) ( ON ?auto_841112 ?auto_841113 ) ( CLEAR ?auto_841112 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_841104 ?auto_841105 ?auto_841106 ?auto_841107 ?auto_841108 ?auto_841109 ?auto_841110 ?auto_841111 ?auto_841112 )
      ( MAKE-15PILE ?auto_841104 ?auto_841105 ?auto_841106 ?auto_841107 ?auto_841108 ?auto_841109 ?auto_841110 ?auto_841111 ?auto_841112 ?auto_841113 ?auto_841114 ?auto_841115 ?auto_841116 ?auto_841117 ?auto_841118 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_841166 - BLOCK
      ?auto_841167 - BLOCK
      ?auto_841168 - BLOCK
      ?auto_841169 - BLOCK
      ?auto_841170 - BLOCK
      ?auto_841171 - BLOCK
      ?auto_841172 - BLOCK
      ?auto_841173 - BLOCK
      ?auto_841174 - BLOCK
      ?auto_841175 - BLOCK
      ?auto_841176 - BLOCK
      ?auto_841177 - BLOCK
      ?auto_841178 - BLOCK
      ?auto_841179 - BLOCK
      ?auto_841180 - BLOCK
    )
    :vars
    (
      ?auto_841181 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_841180 ?auto_841181 ) ( ON-TABLE ?auto_841166 ) ( ON ?auto_841167 ?auto_841166 ) ( ON ?auto_841168 ?auto_841167 ) ( ON ?auto_841169 ?auto_841168 ) ( ON ?auto_841170 ?auto_841169 ) ( ON ?auto_841171 ?auto_841170 ) ( ON ?auto_841172 ?auto_841171 ) ( not ( = ?auto_841166 ?auto_841167 ) ) ( not ( = ?auto_841166 ?auto_841168 ) ) ( not ( = ?auto_841166 ?auto_841169 ) ) ( not ( = ?auto_841166 ?auto_841170 ) ) ( not ( = ?auto_841166 ?auto_841171 ) ) ( not ( = ?auto_841166 ?auto_841172 ) ) ( not ( = ?auto_841166 ?auto_841173 ) ) ( not ( = ?auto_841166 ?auto_841174 ) ) ( not ( = ?auto_841166 ?auto_841175 ) ) ( not ( = ?auto_841166 ?auto_841176 ) ) ( not ( = ?auto_841166 ?auto_841177 ) ) ( not ( = ?auto_841166 ?auto_841178 ) ) ( not ( = ?auto_841166 ?auto_841179 ) ) ( not ( = ?auto_841166 ?auto_841180 ) ) ( not ( = ?auto_841166 ?auto_841181 ) ) ( not ( = ?auto_841167 ?auto_841168 ) ) ( not ( = ?auto_841167 ?auto_841169 ) ) ( not ( = ?auto_841167 ?auto_841170 ) ) ( not ( = ?auto_841167 ?auto_841171 ) ) ( not ( = ?auto_841167 ?auto_841172 ) ) ( not ( = ?auto_841167 ?auto_841173 ) ) ( not ( = ?auto_841167 ?auto_841174 ) ) ( not ( = ?auto_841167 ?auto_841175 ) ) ( not ( = ?auto_841167 ?auto_841176 ) ) ( not ( = ?auto_841167 ?auto_841177 ) ) ( not ( = ?auto_841167 ?auto_841178 ) ) ( not ( = ?auto_841167 ?auto_841179 ) ) ( not ( = ?auto_841167 ?auto_841180 ) ) ( not ( = ?auto_841167 ?auto_841181 ) ) ( not ( = ?auto_841168 ?auto_841169 ) ) ( not ( = ?auto_841168 ?auto_841170 ) ) ( not ( = ?auto_841168 ?auto_841171 ) ) ( not ( = ?auto_841168 ?auto_841172 ) ) ( not ( = ?auto_841168 ?auto_841173 ) ) ( not ( = ?auto_841168 ?auto_841174 ) ) ( not ( = ?auto_841168 ?auto_841175 ) ) ( not ( = ?auto_841168 ?auto_841176 ) ) ( not ( = ?auto_841168 ?auto_841177 ) ) ( not ( = ?auto_841168 ?auto_841178 ) ) ( not ( = ?auto_841168 ?auto_841179 ) ) ( not ( = ?auto_841168 ?auto_841180 ) ) ( not ( = ?auto_841168 ?auto_841181 ) ) ( not ( = ?auto_841169 ?auto_841170 ) ) ( not ( = ?auto_841169 ?auto_841171 ) ) ( not ( = ?auto_841169 ?auto_841172 ) ) ( not ( = ?auto_841169 ?auto_841173 ) ) ( not ( = ?auto_841169 ?auto_841174 ) ) ( not ( = ?auto_841169 ?auto_841175 ) ) ( not ( = ?auto_841169 ?auto_841176 ) ) ( not ( = ?auto_841169 ?auto_841177 ) ) ( not ( = ?auto_841169 ?auto_841178 ) ) ( not ( = ?auto_841169 ?auto_841179 ) ) ( not ( = ?auto_841169 ?auto_841180 ) ) ( not ( = ?auto_841169 ?auto_841181 ) ) ( not ( = ?auto_841170 ?auto_841171 ) ) ( not ( = ?auto_841170 ?auto_841172 ) ) ( not ( = ?auto_841170 ?auto_841173 ) ) ( not ( = ?auto_841170 ?auto_841174 ) ) ( not ( = ?auto_841170 ?auto_841175 ) ) ( not ( = ?auto_841170 ?auto_841176 ) ) ( not ( = ?auto_841170 ?auto_841177 ) ) ( not ( = ?auto_841170 ?auto_841178 ) ) ( not ( = ?auto_841170 ?auto_841179 ) ) ( not ( = ?auto_841170 ?auto_841180 ) ) ( not ( = ?auto_841170 ?auto_841181 ) ) ( not ( = ?auto_841171 ?auto_841172 ) ) ( not ( = ?auto_841171 ?auto_841173 ) ) ( not ( = ?auto_841171 ?auto_841174 ) ) ( not ( = ?auto_841171 ?auto_841175 ) ) ( not ( = ?auto_841171 ?auto_841176 ) ) ( not ( = ?auto_841171 ?auto_841177 ) ) ( not ( = ?auto_841171 ?auto_841178 ) ) ( not ( = ?auto_841171 ?auto_841179 ) ) ( not ( = ?auto_841171 ?auto_841180 ) ) ( not ( = ?auto_841171 ?auto_841181 ) ) ( not ( = ?auto_841172 ?auto_841173 ) ) ( not ( = ?auto_841172 ?auto_841174 ) ) ( not ( = ?auto_841172 ?auto_841175 ) ) ( not ( = ?auto_841172 ?auto_841176 ) ) ( not ( = ?auto_841172 ?auto_841177 ) ) ( not ( = ?auto_841172 ?auto_841178 ) ) ( not ( = ?auto_841172 ?auto_841179 ) ) ( not ( = ?auto_841172 ?auto_841180 ) ) ( not ( = ?auto_841172 ?auto_841181 ) ) ( not ( = ?auto_841173 ?auto_841174 ) ) ( not ( = ?auto_841173 ?auto_841175 ) ) ( not ( = ?auto_841173 ?auto_841176 ) ) ( not ( = ?auto_841173 ?auto_841177 ) ) ( not ( = ?auto_841173 ?auto_841178 ) ) ( not ( = ?auto_841173 ?auto_841179 ) ) ( not ( = ?auto_841173 ?auto_841180 ) ) ( not ( = ?auto_841173 ?auto_841181 ) ) ( not ( = ?auto_841174 ?auto_841175 ) ) ( not ( = ?auto_841174 ?auto_841176 ) ) ( not ( = ?auto_841174 ?auto_841177 ) ) ( not ( = ?auto_841174 ?auto_841178 ) ) ( not ( = ?auto_841174 ?auto_841179 ) ) ( not ( = ?auto_841174 ?auto_841180 ) ) ( not ( = ?auto_841174 ?auto_841181 ) ) ( not ( = ?auto_841175 ?auto_841176 ) ) ( not ( = ?auto_841175 ?auto_841177 ) ) ( not ( = ?auto_841175 ?auto_841178 ) ) ( not ( = ?auto_841175 ?auto_841179 ) ) ( not ( = ?auto_841175 ?auto_841180 ) ) ( not ( = ?auto_841175 ?auto_841181 ) ) ( not ( = ?auto_841176 ?auto_841177 ) ) ( not ( = ?auto_841176 ?auto_841178 ) ) ( not ( = ?auto_841176 ?auto_841179 ) ) ( not ( = ?auto_841176 ?auto_841180 ) ) ( not ( = ?auto_841176 ?auto_841181 ) ) ( not ( = ?auto_841177 ?auto_841178 ) ) ( not ( = ?auto_841177 ?auto_841179 ) ) ( not ( = ?auto_841177 ?auto_841180 ) ) ( not ( = ?auto_841177 ?auto_841181 ) ) ( not ( = ?auto_841178 ?auto_841179 ) ) ( not ( = ?auto_841178 ?auto_841180 ) ) ( not ( = ?auto_841178 ?auto_841181 ) ) ( not ( = ?auto_841179 ?auto_841180 ) ) ( not ( = ?auto_841179 ?auto_841181 ) ) ( not ( = ?auto_841180 ?auto_841181 ) ) ( ON ?auto_841179 ?auto_841180 ) ( ON ?auto_841178 ?auto_841179 ) ( ON ?auto_841177 ?auto_841178 ) ( ON ?auto_841176 ?auto_841177 ) ( ON ?auto_841175 ?auto_841176 ) ( ON ?auto_841174 ?auto_841175 ) ( CLEAR ?auto_841172 ) ( ON ?auto_841173 ?auto_841174 ) ( CLEAR ?auto_841173 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_841166 ?auto_841167 ?auto_841168 ?auto_841169 ?auto_841170 ?auto_841171 ?auto_841172 ?auto_841173 )
      ( MAKE-15PILE ?auto_841166 ?auto_841167 ?auto_841168 ?auto_841169 ?auto_841170 ?auto_841171 ?auto_841172 ?auto_841173 ?auto_841174 ?auto_841175 ?auto_841176 ?auto_841177 ?auto_841178 ?auto_841179 ?auto_841180 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_841228 - BLOCK
      ?auto_841229 - BLOCK
      ?auto_841230 - BLOCK
      ?auto_841231 - BLOCK
      ?auto_841232 - BLOCK
      ?auto_841233 - BLOCK
      ?auto_841234 - BLOCK
      ?auto_841235 - BLOCK
      ?auto_841236 - BLOCK
      ?auto_841237 - BLOCK
      ?auto_841238 - BLOCK
      ?auto_841239 - BLOCK
      ?auto_841240 - BLOCK
      ?auto_841241 - BLOCK
      ?auto_841242 - BLOCK
    )
    :vars
    (
      ?auto_841243 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_841242 ?auto_841243 ) ( ON-TABLE ?auto_841228 ) ( ON ?auto_841229 ?auto_841228 ) ( ON ?auto_841230 ?auto_841229 ) ( ON ?auto_841231 ?auto_841230 ) ( ON ?auto_841232 ?auto_841231 ) ( ON ?auto_841233 ?auto_841232 ) ( not ( = ?auto_841228 ?auto_841229 ) ) ( not ( = ?auto_841228 ?auto_841230 ) ) ( not ( = ?auto_841228 ?auto_841231 ) ) ( not ( = ?auto_841228 ?auto_841232 ) ) ( not ( = ?auto_841228 ?auto_841233 ) ) ( not ( = ?auto_841228 ?auto_841234 ) ) ( not ( = ?auto_841228 ?auto_841235 ) ) ( not ( = ?auto_841228 ?auto_841236 ) ) ( not ( = ?auto_841228 ?auto_841237 ) ) ( not ( = ?auto_841228 ?auto_841238 ) ) ( not ( = ?auto_841228 ?auto_841239 ) ) ( not ( = ?auto_841228 ?auto_841240 ) ) ( not ( = ?auto_841228 ?auto_841241 ) ) ( not ( = ?auto_841228 ?auto_841242 ) ) ( not ( = ?auto_841228 ?auto_841243 ) ) ( not ( = ?auto_841229 ?auto_841230 ) ) ( not ( = ?auto_841229 ?auto_841231 ) ) ( not ( = ?auto_841229 ?auto_841232 ) ) ( not ( = ?auto_841229 ?auto_841233 ) ) ( not ( = ?auto_841229 ?auto_841234 ) ) ( not ( = ?auto_841229 ?auto_841235 ) ) ( not ( = ?auto_841229 ?auto_841236 ) ) ( not ( = ?auto_841229 ?auto_841237 ) ) ( not ( = ?auto_841229 ?auto_841238 ) ) ( not ( = ?auto_841229 ?auto_841239 ) ) ( not ( = ?auto_841229 ?auto_841240 ) ) ( not ( = ?auto_841229 ?auto_841241 ) ) ( not ( = ?auto_841229 ?auto_841242 ) ) ( not ( = ?auto_841229 ?auto_841243 ) ) ( not ( = ?auto_841230 ?auto_841231 ) ) ( not ( = ?auto_841230 ?auto_841232 ) ) ( not ( = ?auto_841230 ?auto_841233 ) ) ( not ( = ?auto_841230 ?auto_841234 ) ) ( not ( = ?auto_841230 ?auto_841235 ) ) ( not ( = ?auto_841230 ?auto_841236 ) ) ( not ( = ?auto_841230 ?auto_841237 ) ) ( not ( = ?auto_841230 ?auto_841238 ) ) ( not ( = ?auto_841230 ?auto_841239 ) ) ( not ( = ?auto_841230 ?auto_841240 ) ) ( not ( = ?auto_841230 ?auto_841241 ) ) ( not ( = ?auto_841230 ?auto_841242 ) ) ( not ( = ?auto_841230 ?auto_841243 ) ) ( not ( = ?auto_841231 ?auto_841232 ) ) ( not ( = ?auto_841231 ?auto_841233 ) ) ( not ( = ?auto_841231 ?auto_841234 ) ) ( not ( = ?auto_841231 ?auto_841235 ) ) ( not ( = ?auto_841231 ?auto_841236 ) ) ( not ( = ?auto_841231 ?auto_841237 ) ) ( not ( = ?auto_841231 ?auto_841238 ) ) ( not ( = ?auto_841231 ?auto_841239 ) ) ( not ( = ?auto_841231 ?auto_841240 ) ) ( not ( = ?auto_841231 ?auto_841241 ) ) ( not ( = ?auto_841231 ?auto_841242 ) ) ( not ( = ?auto_841231 ?auto_841243 ) ) ( not ( = ?auto_841232 ?auto_841233 ) ) ( not ( = ?auto_841232 ?auto_841234 ) ) ( not ( = ?auto_841232 ?auto_841235 ) ) ( not ( = ?auto_841232 ?auto_841236 ) ) ( not ( = ?auto_841232 ?auto_841237 ) ) ( not ( = ?auto_841232 ?auto_841238 ) ) ( not ( = ?auto_841232 ?auto_841239 ) ) ( not ( = ?auto_841232 ?auto_841240 ) ) ( not ( = ?auto_841232 ?auto_841241 ) ) ( not ( = ?auto_841232 ?auto_841242 ) ) ( not ( = ?auto_841232 ?auto_841243 ) ) ( not ( = ?auto_841233 ?auto_841234 ) ) ( not ( = ?auto_841233 ?auto_841235 ) ) ( not ( = ?auto_841233 ?auto_841236 ) ) ( not ( = ?auto_841233 ?auto_841237 ) ) ( not ( = ?auto_841233 ?auto_841238 ) ) ( not ( = ?auto_841233 ?auto_841239 ) ) ( not ( = ?auto_841233 ?auto_841240 ) ) ( not ( = ?auto_841233 ?auto_841241 ) ) ( not ( = ?auto_841233 ?auto_841242 ) ) ( not ( = ?auto_841233 ?auto_841243 ) ) ( not ( = ?auto_841234 ?auto_841235 ) ) ( not ( = ?auto_841234 ?auto_841236 ) ) ( not ( = ?auto_841234 ?auto_841237 ) ) ( not ( = ?auto_841234 ?auto_841238 ) ) ( not ( = ?auto_841234 ?auto_841239 ) ) ( not ( = ?auto_841234 ?auto_841240 ) ) ( not ( = ?auto_841234 ?auto_841241 ) ) ( not ( = ?auto_841234 ?auto_841242 ) ) ( not ( = ?auto_841234 ?auto_841243 ) ) ( not ( = ?auto_841235 ?auto_841236 ) ) ( not ( = ?auto_841235 ?auto_841237 ) ) ( not ( = ?auto_841235 ?auto_841238 ) ) ( not ( = ?auto_841235 ?auto_841239 ) ) ( not ( = ?auto_841235 ?auto_841240 ) ) ( not ( = ?auto_841235 ?auto_841241 ) ) ( not ( = ?auto_841235 ?auto_841242 ) ) ( not ( = ?auto_841235 ?auto_841243 ) ) ( not ( = ?auto_841236 ?auto_841237 ) ) ( not ( = ?auto_841236 ?auto_841238 ) ) ( not ( = ?auto_841236 ?auto_841239 ) ) ( not ( = ?auto_841236 ?auto_841240 ) ) ( not ( = ?auto_841236 ?auto_841241 ) ) ( not ( = ?auto_841236 ?auto_841242 ) ) ( not ( = ?auto_841236 ?auto_841243 ) ) ( not ( = ?auto_841237 ?auto_841238 ) ) ( not ( = ?auto_841237 ?auto_841239 ) ) ( not ( = ?auto_841237 ?auto_841240 ) ) ( not ( = ?auto_841237 ?auto_841241 ) ) ( not ( = ?auto_841237 ?auto_841242 ) ) ( not ( = ?auto_841237 ?auto_841243 ) ) ( not ( = ?auto_841238 ?auto_841239 ) ) ( not ( = ?auto_841238 ?auto_841240 ) ) ( not ( = ?auto_841238 ?auto_841241 ) ) ( not ( = ?auto_841238 ?auto_841242 ) ) ( not ( = ?auto_841238 ?auto_841243 ) ) ( not ( = ?auto_841239 ?auto_841240 ) ) ( not ( = ?auto_841239 ?auto_841241 ) ) ( not ( = ?auto_841239 ?auto_841242 ) ) ( not ( = ?auto_841239 ?auto_841243 ) ) ( not ( = ?auto_841240 ?auto_841241 ) ) ( not ( = ?auto_841240 ?auto_841242 ) ) ( not ( = ?auto_841240 ?auto_841243 ) ) ( not ( = ?auto_841241 ?auto_841242 ) ) ( not ( = ?auto_841241 ?auto_841243 ) ) ( not ( = ?auto_841242 ?auto_841243 ) ) ( ON ?auto_841241 ?auto_841242 ) ( ON ?auto_841240 ?auto_841241 ) ( ON ?auto_841239 ?auto_841240 ) ( ON ?auto_841238 ?auto_841239 ) ( ON ?auto_841237 ?auto_841238 ) ( ON ?auto_841236 ?auto_841237 ) ( ON ?auto_841235 ?auto_841236 ) ( CLEAR ?auto_841233 ) ( ON ?auto_841234 ?auto_841235 ) ( CLEAR ?auto_841234 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_841228 ?auto_841229 ?auto_841230 ?auto_841231 ?auto_841232 ?auto_841233 ?auto_841234 )
      ( MAKE-15PILE ?auto_841228 ?auto_841229 ?auto_841230 ?auto_841231 ?auto_841232 ?auto_841233 ?auto_841234 ?auto_841235 ?auto_841236 ?auto_841237 ?auto_841238 ?auto_841239 ?auto_841240 ?auto_841241 ?auto_841242 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_841290 - BLOCK
      ?auto_841291 - BLOCK
      ?auto_841292 - BLOCK
      ?auto_841293 - BLOCK
      ?auto_841294 - BLOCK
      ?auto_841295 - BLOCK
      ?auto_841296 - BLOCK
      ?auto_841297 - BLOCK
      ?auto_841298 - BLOCK
      ?auto_841299 - BLOCK
      ?auto_841300 - BLOCK
      ?auto_841301 - BLOCK
      ?auto_841302 - BLOCK
      ?auto_841303 - BLOCK
      ?auto_841304 - BLOCK
    )
    :vars
    (
      ?auto_841305 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_841304 ?auto_841305 ) ( ON-TABLE ?auto_841290 ) ( ON ?auto_841291 ?auto_841290 ) ( ON ?auto_841292 ?auto_841291 ) ( ON ?auto_841293 ?auto_841292 ) ( ON ?auto_841294 ?auto_841293 ) ( not ( = ?auto_841290 ?auto_841291 ) ) ( not ( = ?auto_841290 ?auto_841292 ) ) ( not ( = ?auto_841290 ?auto_841293 ) ) ( not ( = ?auto_841290 ?auto_841294 ) ) ( not ( = ?auto_841290 ?auto_841295 ) ) ( not ( = ?auto_841290 ?auto_841296 ) ) ( not ( = ?auto_841290 ?auto_841297 ) ) ( not ( = ?auto_841290 ?auto_841298 ) ) ( not ( = ?auto_841290 ?auto_841299 ) ) ( not ( = ?auto_841290 ?auto_841300 ) ) ( not ( = ?auto_841290 ?auto_841301 ) ) ( not ( = ?auto_841290 ?auto_841302 ) ) ( not ( = ?auto_841290 ?auto_841303 ) ) ( not ( = ?auto_841290 ?auto_841304 ) ) ( not ( = ?auto_841290 ?auto_841305 ) ) ( not ( = ?auto_841291 ?auto_841292 ) ) ( not ( = ?auto_841291 ?auto_841293 ) ) ( not ( = ?auto_841291 ?auto_841294 ) ) ( not ( = ?auto_841291 ?auto_841295 ) ) ( not ( = ?auto_841291 ?auto_841296 ) ) ( not ( = ?auto_841291 ?auto_841297 ) ) ( not ( = ?auto_841291 ?auto_841298 ) ) ( not ( = ?auto_841291 ?auto_841299 ) ) ( not ( = ?auto_841291 ?auto_841300 ) ) ( not ( = ?auto_841291 ?auto_841301 ) ) ( not ( = ?auto_841291 ?auto_841302 ) ) ( not ( = ?auto_841291 ?auto_841303 ) ) ( not ( = ?auto_841291 ?auto_841304 ) ) ( not ( = ?auto_841291 ?auto_841305 ) ) ( not ( = ?auto_841292 ?auto_841293 ) ) ( not ( = ?auto_841292 ?auto_841294 ) ) ( not ( = ?auto_841292 ?auto_841295 ) ) ( not ( = ?auto_841292 ?auto_841296 ) ) ( not ( = ?auto_841292 ?auto_841297 ) ) ( not ( = ?auto_841292 ?auto_841298 ) ) ( not ( = ?auto_841292 ?auto_841299 ) ) ( not ( = ?auto_841292 ?auto_841300 ) ) ( not ( = ?auto_841292 ?auto_841301 ) ) ( not ( = ?auto_841292 ?auto_841302 ) ) ( not ( = ?auto_841292 ?auto_841303 ) ) ( not ( = ?auto_841292 ?auto_841304 ) ) ( not ( = ?auto_841292 ?auto_841305 ) ) ( not ( = ?auto_841293 ?auto_841294 ) ) ( not ( = ?auto_841293 ?auto_841295 ) ) ( not ( = ?auto_841293 ?auto_841296 ) ) ( not ( = ?auto_841293 ?auto_841297 ) ) ( not ( = ?auto_841293 ?auto_841298 ) ) ( not ( = ?auto_841293 ?auto_841299 ) ) ( not ( = ?auto_841293 ?auto_841300 ) ) ( not ( = ?auto_841293 ?auto_841301 ) ) ( not ( = ?auto_841293 ?auto_841302 ) ) ( not ( = ?auto_841293 ?auto_841303 ) ) ( not ( = ?auto_841293 ?auto_841304 ) ) ( not ( = ?auto_841293 ?auto_841305 ) ) ( not ( = ?auto_841294 ?auto_841295 ) ) ( not ( = ?auto_841294 ?auto_841296 ) ) ( not ( = ?auto_841294 ?auto_841297 ) ) ( not ( = ?auto_841294 ?auto_841298 ) ) ( not ( = ?auto_841294 ?auto_841299 ) ) ( not ( = ?auto_841294 ?auto_841300 ) ) ( not ( = ?auto_841294 ?auto_841301 ) ) ( not ( = ?auto_841294 ?auto_841302 ) ) ( not ( = ?auto_841294 ?auto_841303 ) ) ( not ( = ?auto_841294 ?auto_841304 ) ) ( not ( = ?auto_841294 ?auto_841305 ) ) ( not ( = ?auto_841295 ?auto_841296 ) ) ( not ( = ?auto_841295 ?auto_841297 ) ) ( not ( = ?auto_841295 ?auto_841298 ) ) ( not ( = ?auto_841295 ?auto_841299 ) ) ( not ( = ?auto_841295 ?auto_841300 ) ) ( not ( = ?auto_841295 ?auto_841301 ) ) ( not ( = ?auto_841295 ?auto_841302 ) ) ( not ( = ?auto_841295 ?auto_841303 ) ) ( not ( = ?auto_841295 ?auto_841304 ) ) ( not ( = ?auto_841295 ?auto_841305 ) ) ( not ( = ?auto_841296 ?auto_841297 ) ) ( not ( = ?auto_841296 ?auto_841298 ) ) ( not ( = ?auto_841296 ?auto_841299 ) ) ( not ( = ?auto_841296 ?auto_841300 ) ) ( not ( = ?auto_841296 ?auto_841301 ) ) ( not ( = ?auto_841296 ?auto_841302 ) ) ( not ( = ?auto_841296 ?auto_841303 ) ) ( not ( = ?auto_841296 ?auto_841304 ) ) ( not ( = ?auto_841296 ?auto_841305 ) ) ( not ( = ?auto_841297 ?auto_841298 ) ) ( not ( = ?auto_841297 ?auto_841299 ) ) ( not ( = ?auto_841297 ?auto_841300 ) ) ( not ( = ?auto_841297 ?auto_841301 ) ) ( not ( = ?auto_841297 ?auto_841302 ) ) ( not ( = ?auto_841297 ?auto_841303 ) ) ( not ( = ?auto_841297 ?auto_841304 ) ) ( not ( = ?auto_841297 ?auto_841305 ) ) ( not ( = ?auto_841298 ?auto_841299 ) ) ( not ( = ?auto_841298 ?auto_841300 ) ) ( not ( = ?auto_841298 ?auto_841301 ) ) ( not ( = ?auto_841298 ?auto_841302 ) ) ( not ( = ?auto_841298 ?auto_841303 ) ) ( not ( = ?auto_841298 ?auto_841304 ) ) ( not ( = ?auto_841298 ?auto_841305 ) ) ( not ( = ?auto_841299 ?auto_841300 ) ) ( not ( = ?auto_841299 ?auto_841301 ) ) ( not ( = ?auto_841299 ?auto_841302 ) ) ( not ( = ?auto_841299 ?auto_841303 ) ) ( not ( = ?auto_841299 ?auto_841304 ) ) ( not ( = ?auto_841299 ?auto_841305 ) ) ( not ( = ?auto_841300 ?auto_841301 ) ) ( not ( = ?auto_841300 ?auto_841302 ) ) ( not ( = ?auto_841300 ?auto_841303 ) ) ( not ( = ?auto_841300 ?auto_841304 ) ) ( not ( = ?auto_841300 ?auto_841305 ) ) ( not ( = ?auto_841301 ?auto_841302 ) ) ( not ( = ?auto_841301 ?auto_841303 ) ) ( not ( = ?auto_841301 ?auto_841304 ) ) ( not ( = ?auto_841301 ?auto_841305 ) ) ( not ( = ?auto_841302 ?auto_841303 ) ) ( not ( = ?auto_841302 ?auto_841304 ) ) ( not ( = ?auto_841302 ?auto_841305 ) ) ( not ( = ?auto_841303 ?auto_841304 ) ) ( not ( = ?auto_841303 ?auto_841305 ) ) ( not ( = ?auto_841304 ?auto_841305 ) ) ( ON ?auto_841303 ?auto_841304 ) ( ON ?auto_841302 ?auto_841303 ) ( ON ?auto_841301 ?auto_841302 ) ( ON ?auto_841300 ?auto_841301 ) ( ON ?auto_841299 ?auto_841300 ) ( ON ?auto_841298 ?auto_841299 ) ( ON ?auto_841297 ?auto_841298 ) ( ON ?auto_841296 ?auto_841297 ) ( CLEAR ?auto_841294 ) ( ON ?auto_841295 ?auto_841296 ) ( CLEAR ?auto_841295 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_841290 ?auto_841291 ?auto_841292 ?auto_841293 ?auto_841294 ?auto_841295 )
      ( MAKE-15PILE ?auto_841290 ?auto_841291 ?auto_841292 ?auto_841293 ?auto_841294 ?auto_841295 ?auto_841296 ?auto_841297 ?auto_841298 ?auto_841299 ?auto_841300 ?auto_841301 ?auto_841302 ?auto_841303 ?auto_841304 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_841352 - BLOCK
      ?auto_841353 - BLOCK
      ?auto_841354 - BLOCK
      ?auto_841355 - BLOCK
      ?auto_841356 - BLOCK
      ?auto_841357 - BLOCK
      ?auto_841358 - BLOCK
      ?auto_841359 - BLOCK
      ?auto_841360 - BLOCK
      ?auto_841361 - BLOCK
      ?auto_841362 - BLOCK
      ?auto_841363 - BLOCK
      ?auto_841364 - BLOCK
      ?auto_841365 - BLOCK
      ?auto_841366 - BLOCK
    )
    :vars
    (
      ?auto_841367 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_841366 ?auto_841367 ) ( ON-TABLE ?auto_841352 ) ( ON ?auto_841353 ?auto_841352 ) ( ON ?auto_841354 ?auto_841353 ) ( ON ?auto_841355 ?auto_841354 ) ( not ( = ?auto_841352 ?auto_841353 ) ) ( not ( = ?auto_841352 ?auto_841354 ) ) ( not ( = ?auto_841352 ?auto_841355 ) ) ( not ( = ?auto_841352 ?auto_841356 ) ) ( not ( = ?auto_841352 ?auto_841357 ) ) ( not ( = ?auto_841352 ?auto_841358 ) ) ( not ( = ?auto_841352 ?auto_841359 ) ) ( not ( = ?auto_841352 ?auto_841360 ) ) ( not ( = ?auto_841352 ?auto_841361 ) ) ( not ( = ?auto_841352 ?auto_841362 ) ) ( not ( = ?auto_841352 ?auto_841363 ) ) ( not ( = ?auto_841352 ?auto_841364 ) ) ( not ( = ?auto_841352 ?auto_841365 ) ) ( not ( = ?auto_841352 ?auto_841366 ) ) ( not ( = ?auto_841352 ?auto_841367 ) ) ( not ( = ?auto_841353 ?auto_841354 ) ) ( not ( = ?auto_841353 ?auto_841355 ) ) ( not ( = ?auto_841353 ?auto_841356 ) ) ( not ( = ?auto_841353 ?auto_841357 ) ) ( not ( = ?auto_841353 ?auto_841358 ) ) ( not ( = ?auto_841353 ?auto_841359 ) ) ( not ( = ?auto_841353 ?auto_841360 ) ) ( not ( = ?auto_841353 ?auto_841361 ) ) ( not ( = ?auto_841353 ?auto_841362 ) ) ( not ( = ?auto_841353 ?auto_841363 ) ) ( not ( = ?auto_841353 ?auto_841364 ) ) ( not ( = ?auto_841353 ?auto_841365 ) ) ( not ( = ?auto_841353 ?auto_841366 ) ) ( not ( = ?auto_841353 ?auto_841367 ) ) ( not ( = ?auto_841354 ?auto_841355 ) ) ( not ( = ?auto_841354 ?auto_841356 ) ) ( not ( = ?auto_841354 ?auto_841357 ) ) ( not ( = ?auto_841354 ?auto_841358 ) ) ( not ( = ?auto_841354 ?auto_841359 ) ) ( not ( = ?auto_841354 ?auto_841360 ) ) ( not ( = ?auto_841354 ?auto_841361 ) ) ( not ( = ?auto_841354 ?auto_841362 ) ) ( not ( = ?auto_841354 ?auto_841363 ) ) ( not ( = ?auto_841354 ?auto_841364 ) ) ( not ( = ?auto_841354 ?auto_841365 ) ) ( not ( = ?auto_841354 ?auto_841366 ) ) ( not ( = ?auto_841354 ?auto_841367 ) ) ( not ( = ?auto_841355 ?auto_841356 ) ) ( not ( = ?auto_841355 ?auto_841357 ) ) ( not ( = ?auto_841355 ?auto_841358 ) ) ( not ( = ?auto_841355 ?auto_841359 ) ) ( not ( = ?auto_841355 ?auto_841360 ) ) ( not ( = ?auto_841355 ?auto_841361 ) ) ( not ( = ?auto_841355 ?auto_841362 ) ) ( not ( = ?auto_841355 ?auto_841363 ) ) ( not ( = ?auto_841355 ?auto_841364 ) ) ( not ( = ?auto_841355 ?auto_841365 ) ) ( not ( = ?auto_841355 ?auto_841366 ) ) ( not ( = ?auto_841355 ?auto_841367 ) ) ( not ( = ?auto_841356 ?auto_841357 ) ) ( not ( = ?auto_841356 ?auto_841358 ) ) ( not ( = ?auto_841356 ?auto_841359 ) ) ( not ( = ?auto_841356 ?auto_841360 ) ) ( not ( = ?auto_841356 ?auto_841361 ) ) ( not ( = ?auto_841356 ?auto_841362 ) ) ( not ( = ?auto_841356 ?auto_841363 ) ) ( not ( = ?auto_841356 ?auto_841364 ) ) ( not ( = ?auto_841356 ?auto_841365 ) ) ( not ( = ?auto_841356 ?auto_841366 ) ) ( not ( = ?auto_841356 ?auto_841367 ) ) ( not ( = ?auto_841357 ?auto_841358 ) ) ( not ( = ?auto_841357 ?auto_841359 ) ) ( not ( = ?auto_841357 ?auto_841360 ) ) ( not ( = ?auto_841357 ?auto_841361 ) ) ( not ( = ?auto_841357 ?auto_841362 ) ) ( not ( = ?auto_841357 ?auto_841363 ) ) ( not ( = ?auto_841357 ?auto_841364 ) ) ( not ( = ?auto_841357 ?auto_841365 ) ) ( not ( = ?auto_841357 ?auto_841366 ) ) ( not ( = ?auto_841357 ?auto_841367 ) ) ( not ( = ?auto_841358 ?auto_841359 ) ) ( not ( = ?auto_841358 ?auto_841360 ) ) ( not ( = ?auto_841358 ?auto_841361 ) ) ( not ( = ?auto_841358 ?auto_841362 ) ) ( not ( = ?auto_841358 ?auto_841363 ) ) ( not ( = ?auto_841358 ?auto_841364 ) ) ( not ( = ?auto_841358 ?auto_841365 ) ) ( not ( = ?auto_841358 ?auto_841366 ) ) ( not ( = ?auto_841358 ?auto_841367 ) ) ( not ( = ?auto_841359 ?auto_841360 ) ) ( not ( = ?auto_841359 ?auto_841361 ) ) ( not ( = ?auto_841359 ?auto_841362 ) ) ( not ( = ?auto_841359 ?auto_841363 ) ) ( not ( = ?auto_841359 ?auto_841364 ) ) ( not ( = ?auto_841359 ?auto_841365 ) ) ( not ( = ?auto_841359 ?auto_841366 ) ) ( not ( = ?auto_841359 ?auto_841367 ) ) ( not ( = ?auto_841360 ?auto_841361 ) ) ( not ( = ?auto_841360 ?auto_841362 ) ) ( not ( = ?auto_841360 ?auto_841363 ) ) ( not ( = ?auto_841360 ?auto_841364 ) ) ( not ( = ?auto_841360 ?auto_841365 ) ) ( not ( = ?auto_841360 ?auto_841366 ) ) ( not ( = ?auto_841360 ?auto_841367 ) ) ( not ( = ?auto_841361 ?auto_841362 ) ) ( not ( = ?auto_841361 ?auto_841363 ) ) ( not ( = ?auto_841361 ?auto_841364 ) ) ( not ( = ?auto_841361 ?auto_841365 ) ) ( not ( = ?auto_841361 ?auto_841366 ) ) ( not ( = ?auto_841361 ?auto_841367 ) ) ( not ( = ?auto_841362 ?auto_841363 ) ) ( not ( = ?auto_841362 ?auto_841364 ) ) ( not ( = ?auto_841362 ?auto_841365 ) ) ( not ( = ?auto_841362 ?auto_841366 ) ) ( not ( = ?auto_841362 ?auto_841367 ) ) ( not ( = ?auto_841363 ?auto_841364 ) ) ( not ( = ?auto_841363 ?auto_841365 ) ) ( not ( = ?auto_841363 ?auto_841366 ) ) ( not ( = ?auto_841363 ?auto_841367 ) ) ( not ( = ?auto_841364 ?auto_841365 ) ) ( not ( = ?auto_841364 ?auto_841366 ) ) ( not ( = ?auto_841364 ?auto_841367 ) ) ( not ( = ?auto_841365 ?auto_841366 ) ) ( not ( = ?auto_841365 ?auto_841367 ) ) ( not ( = ?auto_841366 ?auto_841367 ) ) ( ON ?auto_841365 ?auto_841366 ) ( ON ?auto_841364 ?auto_841365 ) ( ON ?auto_841363 ?auto_841364 ) ( ON ?auto_841362 ?auto_841363 ) ( ON ?auto_841361 ?auto_841362 ) ( ON ?auto_841360 ?auto_841361 ) ( ON ?auto_841359 ?auto_841360 ) ( ON ?auto_841358 ?auto_841359 ) ( ON ?auto_841357 ?auto_841358 ) ( CLEAR ?auto_841355 ) ( ON ?auto_841356 ?auto_841357 ) ( CLEAR ?auto_841356 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_841352 ?auto_841353 ?auto_841354 ?auto_841355 ?auto_841356 )
      ( MAKE-15PILE ?auto_841352 ?auto_841353 ?auto_841354 ?auto_841355 ?auto_841356 ?auto_841357 ?auto_841358 ?auto_841359 ?auto_841360 ?auto_841361 ?auto_841362 ?auto_841363 ?auto_841364 ?auto_841365 ?auto_841366 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_841414 - BLOCK
      ?auto_841415 - BLOCK
      ?auto_841416 - BLOCK
      ?auto_841417 - BLOCK
      ?auto_841418 - BLOCK
      ?auto_841419 - BLOCK
      ?auto_841420 - BLOCK
      ?auto_841421 - BLOCK
      ?auto_841422 - BLOCK
      ?auto_841423 - BLOCK
      ?auto_841424 - BLOCK
      ?auto_841425 - BLOCK
      ?auto_841426 - BLOCK
      ?auto_841427 - BLOCK
      ?auto_841428 - BLOCK
    )
    :vars
    (
      ?auto_841429 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_841428 ?auto_841429 ) ( ON-TABLE ?auto_841414 ) ( ON ?auto_841415 ?auto_841414 ) ( ON ?auto_841416 ?auto_841415 ) ( not ( = ?auto_841414 ?auto_841415 ) ) ( not ( = ?auto_841414 ?auto_841416 ) ) ( not ( = ?auto_841414 ?auto_841417 ) ) ( not ( = ?auto_841414 ?auto_841418 ) ) ( not ( = ?auto_841414 ?auto_841419 ) ) ( not ( = ?auto_841414 ?auto_841420 ) ) ( not ( = ?auto_841414 ?auto_841421 ) ) ( not ( = ?auto_841414 ?auto_841422 ) ) ( not ( = ?auto_841414 ?auto_841423 ) ) ( not ( = ?auto_841414 ?auto_841424 ) ) ( not ( = ?auto_841414 ?auto_841425 ) ) ( not ( = ?auto_841414 ?auto_841426 ) ) ( not ( = ?auto_841414 ?auto_841427 ) ) ( not ( = ?auto_841414 ?auto_841428 ) ) ( not ( = ?auto_841414 ?auto_841429 ) ) ( not ( = ?auto_841415 ?auto_841416 ) ) ( not ( = ?auto_841415 ?auto_841417 ) ) ( not ( = ?auto_841415 ?auto_841418 ) ) ( not ( = ?auto_841415 ?auto_841419 ) ) ( not ( = ?auto_841415 ?auto_841420 ) ) ( not ( = ?auto_841415 ?auto_841421 ) ) ( not ( = ?auto_841415 ?auto_841422 ) ) ( not ( = ?auto_841415 ?auto_841423 ) ) ( not ( = ?auto_841415 ?auto_841424 ) ) ( not ( = ?auto_841415 ?auto_841425 ) ) ( not ( = ?auto_841415 ?auto_841426 ) ) ( not ( = ?auto_841415 ?auto_841427 ) ) ( not ( = ?auto_841415 ?auto_841428 ) ) ( not ( = ?auto_841415 ?auto_841429 ) ) ( not ( = ?auto_841416 ?auto_841417 ) ) ( not ( = ?auto_841416 ?auto_841418 ) ) ( not ( = ?auto_841416 ?auto_841419 ) ) ( not ( = ?auto_841416 ?auto_841420 ) ) ( not ( = ?auto_841416 ?auto_841421 ) ) ( not ( = ?auto_841416 ?auto_841422 ) ) ( not ( = ?auto_841416 ?auto_841423 ) ) ( not ( = ?auto_841416 ?auto_841424 ) ) ( not ( = ?auto_841416 ?auto_841425 ) ) ( not ( = ?auto_841416 ?auto_841426 ) ) ( not ( = ?auto_841416 ?auto_841427 ) ) ( not ( = ?auto_841416 ?auto_841428 ) ) ( not ( = ?auto_841416 ?auto_841429 ) ) ( not ( = ?auto_841417 ?auto_841418 ) ) ( not ( = ?auto_841417 ?auto_841419 ) ) ( not ( = ?auto_841417 ?auto_841420 ) ) ( not ( = ?auto_841417 ?auto_841421 ) ) ( not ( = ?auto_841417 ?auto_841422 ) ) ( not ( = ?auto_841417 ?auto_841423 ) ) ( not ( = ?auto_841417 ?auto_841424 ) ) ( not ( = ?auto_841417 ?auto_841425 ) ) ( not ( = ?auto_841417 ?auto_841426 ) ) ( not ( = ?auto_841417 ?auto_841427 ) ) ( not ( = ?auto_841417 ?auto_841428 ) ) ( not ( = ?auto_841417 ?auto_841429 ) ) ( not ( = ?auto_841418 ?auto_841419 ) ) ( not ( = ?auto_841418 ?auto_841420 ) ) ( not ( = ?auto_841418 ?auto_841421 ) ) ( not ( = ?auto_841418 ?auto_841422 ) ) ( not ( = ?auto_841418 ?auto_841423 ) ) ( not ( = ?auto_841418 ?auto_841424 ) ) ( not ( = ?auto_841418 ?auto_841425 ) ) ( not ( = ?auto_841418 ?auto_841426 ) ) ( not ( = ?auto_841418 ?auto_841427 ) ) ( not ( = ?auto_841418 ?auto_841428 ) ) ( not ( = ?auto_841418 ?auto_841429 ) ) ( not ( = ?auto_841419 ?auto_841420 ) ) ( not ( = ?auto_841419 ?auto_841421 ) ) ( not ( = ?auto_841419 ?auto_841422 ) ) ( not ( = ?auto_841419 ?auto_841423 ) ) ( not ( = ?auto_841419 ?auto_841424 ) ) ( not ( = ?auto_841419 ?auto_841425 ) ) ( not ( = ?auto_841419 ?auto_841426 ) ) ( not ( = ?auto_841419 ?auto_841427 ) ) ( not ( = ?auto_841419 ?auto_841428 ) ) ( not ( = ?auto_841419 ?auto_841429 ) ) ( not ( = ?auto_841420 ?auto_841421 ) ) ( not ( = ?auto_841420 ?auto_841422 ) ) ( not ( = ?auto_841420 ?auto_841423 ) ) ( not ( = ?auto_841420 ?auto_841424 ) ) ( not ( = ?auto_841420 ?auto_841425 ) ) ( not ( = ?auto_841420 ?auto_841426 ) ) ( not ( = ?auto_841420 ?auto_841427 ) ) ( not ( = ?auto_841420 ?auto_841428 ) ) ( not ( = ?auto_841420 ?auto_841429 ) ) ( not ( = ?auto_841421 ?auto_841422 ) ) ( not ( = ?auto_841421 ?auto_841423 ) ) ( not ( = ?auto_841421 ?auto_841424 ) ) ( not ( = ?auto_841421 ?auto_841425 ) ) ( not ( = ?auto_841421 ?auto_841426 ) ) ( not ( = ?auto_841421 ?auto_841427 ) ) ( not ( = ?auto_841421 ?auto_841428 ) ) ( not ( = ?auto_841421 ?auto_841429 ) ) ( not ( = ?auto_841422 ?auto_841423 ) ) ( not ( = ?auto_841422 ?auto_841424 ) ) ( not ( = ?auto_841422 ?auto_841425 ) ) ( not ( = ?auto_841422 ?auto_841426 ) ) ( not ( = ?auto_841422 ?auto_841427 ) ) ( not ( = ?auto_841422 ?auto_841428 ) ) ( not ( = ?auto_841422 ?auto_841429 ) ) ( not ( = ?auto_841423 ?auto_841424 ) ) ( not ( = ?auto_841423 ?auto_841425 ) ) ( not ( = ?auto_841423 ?auto_841426 ) ) ( not ( = ?auto_841423 ?auto_841427 ) ) ( not ( = ?auto_841423 ?auto_841428 ) ) ( not ( = ?auto_841423 ?auto_841429 ) ) ( not ( = ?auto_841424 ?auto_841425 ) ) ( not ( = ?auto_841424 ?auto_841426 ) ) ( not ( = ?auto_841424 ?auto_841427 ) ) ( not ( = ?auto_841424 ?auto_841428 ) ) ( not ( = ?auto_841424 ?auto_841429 ) ) ( not ( = ?auto_841425 ?auto_841426 ) ) ( not ( = ?auto_841425 ?auto_841427 ) ) ( not ( = ?auto_841425 ?auto_841428 ) ) ( not ( = ?auto_841425 ?auto_841429 ) ) ( not ( = ?auto_841426 ?auto_841427 ) ) ( not ( = ?auto_841426 ?auto_841428 ) ) ( not ( = ?auto_841426 ?auto_841429 ) ) ( not ( = ?auto_841427 ?auto_841428 ) ) ( not ( = ?auto_841427 ?auto_841429 ) ) ( not ( = ?auto_841428 ?auto_841429 ) ) ( ON ?auto_841427 ?auto_841428 ) ( ON ?auto_841426 ?auto_841427 ) ( ON ?auto_841425 ?auto_841426 ) ( ON ?auto_841424 ?auto_841425 ) ( ON ?auto_841423 ?auto_841424 ) ( ON ?auto_841422 ?auto_841423 ) ( ON ?auto_841421 ?auto_841422 ) ( ON ?auto_841420 ?auto_841421 ) ( ON ?auto_841419 ?auto_841420 ) ( ON ?auto_841418 ?auto_841419 ) ( CLEAR ?auto_841416 ) ( ON ?auto_841417 ?auto_841418 ) ( CLEAR ?auto_841417 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_841414 ?auto_841415 ?auto_841416 ?auto_841417 )
      ( MAKE-15PILE ?auto_841414 ?auto_841415 ?auto_841416 ?auto_841417 ?auto_841418 ?auto_841419 ?auto_841420 ?auto_841421 ?auto_841422 ?auto_841423 ?auto_841424 ?auto_841425 ?auto_841426 ?auto_841427 ?auto_841428 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_841476 - BLOCK
      ?auto_841477 - BLOCK
      ?auto_841478 - BLOCK
      ?auto_841479 - BLOCK
      ?auto_841480 - BLOCK
      ?auto_841481 - BLOCK
      ?auto_841482 - BLOCK
      ?auto_841483 - BLOCK
      ?auto_841484 - BLOCK
      ?auto_841485 - BLOCK
      ?auto_841486 - BLOCK
      ?auto_841487 - BLOCK
      ?auto_841488 - BLOCK
      ?auto_841489 - BLOCK
      ?auto_841490 - BLOCK
    )
    :vars
    (
      ?auto_841491 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_841490 ?auto_841491 ) ( ON-TABLE ?auto_841476 ) ( ON ?auto_841477 ?auto_841476 ) ( not ( = ?auto_841476 ?auto_841477 ) ) ( not ( = ?auto_841476 ?auto_841478 ) ) ( not ( = ?auto_841476 ?auto_841479 ) ) ( not ( = ?auto_841476 ?auto_841480 ) ) ( not ( = ?auto_841476 ?auto_841481 ) ) ( not ( = ?auto_841476 ?auto_841482 ) ) ( not ( = ?auto_841476 ?auto_841483 ) ) ( not ( = ?auto_841476 ?auto_841484 ) ) ( not ( = ?auto_841476 ?auto_841485 ) ) ( not ( = ?auto_841476 ?auto_841486 ) ) ( not ( = ?auto_841476 ?auto_841487 ) ) ( not ( = ?auto_841476 ?auto_841488 ) ) ( not ( = ?auto_841476 ?auto_841489 ) ) ( not ( = ?auto_841476 ?auto_841490 ) ) ( not ( = ?auto_841476 ?auto_841491 ) ) ( not ( = ?auto_841477 ?auto_841478 ) ) ( not ( = ?auto_841477 ?auto_841479 ) ) ( not ( = ?auto_841477 ?auto_841480 ) ) ( not ( = ?auto_841477 ?auto_841481 ) ) ( not ( = ?auto_841477 ?auto_841482 ) ) ( not ( = ?auto_841477 ?auto_841483 ) ) ( not ( = ?auto_841477 ?auto_841484 ) ) ( not ( = ?auto_841477 ?auto_841485 ) ) ( not ( = ?auto_841477 ?auto_841486 ) ) ( not ( = ?auto_841477 ?auto_841487 ) ) ( not ( = ?auto_841477 ?auto_841488 ) ) ( not ( = ?auto_841477 ?auto_841489 ) ) ( not ( = ?auto_841477 ?auto_841490 ) ) ( not ( = ?auto_841477 ?auto_841491 ) ) ( not ( = ?auto_841478 ?auto_841479 ) ) ( not ( = ?auto_841478 ?auto_841480 ) ) ( not ( = ?auto_841478 ?auto_841481 ) ) ( not ( = ?auto_841478 ?auto_841482 ) ) ( not ( = ?auto_841478 ?auto_841483 ) ) ( not ( = ?auto_841478 ?auto_841484 ) ) ( not ( = ?auto_841478 ?auto_841485 ) ) ( not ( = ?auto_841478 ?auto_841486 ) ) ( not ( = ?auto_841478 ?auto_841487 ) ) ( not ( = ?auto_841478 ?auto_841488 ) ) ( not ( = ?auto_841478 ?auto_841489 ) ) ( not ( = ?auto_841478 ?auto_841490 ) ) ( not ( = ?auto_841478 ?auto_841491 ) ) ( not ( = ?auto_841479 ?auto_841480 ) ) ( not ( = ?auto_841479 ?auto_841481 ) ) ( not ( = ?auto_841479 ?auto_841482 ) ) ( not ( = ?auto_841479 ?auto_841483 ) ) ( not ( = ?auto_841479 ?auto_841484 ) ) ( not ( = ?auto_841479 ?auto_841485 ) ) ( not ( = ?auto_841479 ?auto_841486 ) ) ( not ( = ?auto_841479 ?auto_841487 ) ) ( not ( = ?auto_841479 ?auto_841488 ) ) ( not ( = ?auto_841479 ?auto_841489 ) ) ( not ( = ?auto_841479 ?auto_841490 ) ) ( not ( = ?auto_841479 ?auto_841491 ) ) ( not ( = ?auto_841480 ?auto_841481 ) ) ( not ( = ?auto_841480 ?auto_841482 ) ) ( not ( = ?auto_841480 ?auto_841483 ) ) ( not ( = ?auto_841480 ?auto_841484 ) ) ( not ( = ?auto_841480 ?auto_841485 ) ) ( not ( = ?auto_841480 ?auto_841486 ) ) ( not ( = ?auto_841480 ?auto_841487 ) ) ( not ( = ?auto_841480 ?auto_841488 ) ) ( not ( = ?auto_841480 ?auto_841489 ) ) ( not ( = ?auto_841480 ?auto_841490 ) ) ( not ( = ?auto_841480 ?auto_841491 ) ) ( not ( = ?auto_841481 ?auto_841482 ) ) ( not ( = ?auto_841481 ?auto_841483 ) ) ( not ( = ?auto_841481 ?auto_841484 ) ) ( not ( = ?auto_841481 ?auto_841485 ) ) ( not ( = ?auto_841481 ?auto_841486 ) ) ( not ( = ?auto_841481 ?auto_841487 ) ) ( not ( = ?auto_841481 ?auto_841488 ) ) ( not ( = ?auto_841481 ?auto_841489 ) ) ( not ( = ?auto_841481 ?auto_841490 ) ) ( not ( = ?auto_841481 ?auto_841491 ) ) ( not ( = ?auto_841482 ?auto_841483 ) ) ( not ( = ?auto_841482 ?auto_841484 ) ) ( not ( = ?auto_841482 ?auto_841485 ) ) ( not ( = ?auto_841482 ?auto_841486 ) ) ( not ( = ?auto_841482 ?auto_841487 ) ) ( not ( = ?auto_841482 ?auto_841488 ) ) ( not ( = ?auto_841482 ?auto_841489 ) ) ( not ( = ?auto_841482 ?auto_841490 ) ) ( not ( = ?auto_841482 ?auto_841491 ) ) ( not ( = ?auto_841483 ?auto_841484 ) ) ( not ( = ?auto_841483 ?auto_841485 ) ) ( not ( = ?auto_841483 ?auto_841486 ) ) ( not ( = ?auto_841483 ?auto_841487 ) ) ( not ( = ?auto_841483 ?auto_841488 ) ) ( not ( = ?auto_841483 ?auto_841489 ) ) ( not ( = ?auto_841483 ?auto_841490 ) ) ( not ( = ?auto_841483 ?auto_841491 ) ) ( not ( = ?auto_841484 ?auto_841485 ) ) ( not ( = ?auto_841484 ?auto_841486 ) ) ( not ( = ?auto_841484 ?auto_841487 ) ) ( not ( = ?auto_841484 ?auto_841488 ) ) ( not ( = ?auto_841484 ?auto_841489 ) ) ( not ( = ?auto_841484 ?auto_841490 ) ) ( not ( = ?auto_841484 ?auto_841491 ) ) ( not ( = ?auto_841485 ?auto_841486 ) ) ( not ( = ?auto_841485 ?auto_841487 ) ) ( not ( = ?auto_841485 ?auto_841488 ) ) ( not ( = ?auto_841485 ?auto_841489 ) ) ( not ( = ?auto_841485 ?auto_841490 ) ) ( not ( = ?auto_841485 ?auto_841491 ) ) ( not ( = ?auto_841486 ?auto_841487 ) ) ( not ( = ?auto_841486 ?auto_841488 ) ) ( not ( = ?auto_841486 ?auto_841489 ) ) ( not ( = ?auto_841486 ?auto_841490 ) ) ( not ( = ?auto_841486 ?auto_841491 ) ) ( not ( = ?auto_841487 ?auto_841488 ) ) ( not ( = ?auto_841487 ?auto_841489 ) ) ( not ( = ?auto_841487 ?auto_841490 ) ) ( not ( = ?auto_841487 ?auto_841491 ) ) ( not ( = ?auto_841488 ?auto_841489 ) ) ( not ( = ?auto_841488 ?auto_841490 ) ) ( not ( = ?auto_841488 ?auto_841491 ) ) ( not ( = ?auto_841489 ?auto_841490 ) ) ( not ( = ?auto_841489 ?auto_841491 ) ) ( not ( = ?auto_841490 ?auto_841491 ) ) ( ON ?auto_841489 ?auto_841490 ) ( ON ?auto_841488 ?auto_841489 ) ( ON ?auto_841487 ?auto_841488 ) ( ON ?auto_841486 ?auto_841487 ) ( ON ?auto_841485 ?auto_841486 ) ( ON ?auto_841484 ?auto_841485 ) ( ON ?auto_841483 ?auto_841484 ) ( ON ?auto_841482 ?auto_841483 ) ( ON ?auto_841481 ?auto_841482 ) ( ON ?auto_841480 ?auto_841481 ) ( ON ?auto_841479 ?auto_841480 ) ( CLEAR ?auto_841477 ) ( ON ?auto_841478 ?auto_841479 ) ( CLEAR ?auto_841478 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_841476 ?auto_841477 ?auto_841478 )
      ( MAKE-15PILE ?auto_841476 ?auto_841477 ?auto_841478 ?auto_841479 ?auto_841480 ?auto_841481 ?auto_841482 ?auto_841483 ?auto_841484 ?auto_841485 ?auto_841486 ?auto_841487 ?auto_841488 ?auto_841489 ?auto_841490 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_841538 - BLOCK
      ?auto_841539 - BLOCK
      ?auto_841540 - BLOCK
      ?auto_841541 - BLOCK
      ?auto_841542 - BLOCK
      ?auto_841543 - BLOCK
      ?auto_841544 - BLOCK
      ?auto_841545 - BLOCK
      ?auto_841546 - BLOCK
      ?auto_841547 - BLOCK
      ?auto_841548 - BLOCK
      ?auto_841549 - BLOCK
      ?auto_841550 - BLOCK
      ?auto_841551 - BLOCK
      ?auto_841552 - BLOCK
    )
    :vars
    (
      ?auto_841553 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_841552 ?auto_841553 ) ( ON-TABLE ?auto_841538 ) ( not ( = ?auto_841538 ?auto_841539 ) ) ( not ( = ?auto_841538 ?auto_841540 ) ) ( not ( = ?auto_841538 ?auto_841541 ) ) ( not ( = ?auto_841538 ?auto_841542 ) ) ( not ( = ?auto_841538 ?auto_841543 ) ) ( not ( = ?auto_841538 ?auto_841544 ) ) ( not ( = ?auto_841538 ?auto_841545 ) ) ( not ( = ?auto_841538 ?auto_841546 ) ) ( not ( = ?auto_841538 ?auto_841547 ) ) ( not ( = ?auto_841538 ?auto_841548 ) ) ( not ( = ?auto_841538 ?auto_841549 ) ) ( not ( = ?auto_841538 ?auto_841550 ) ) ( not ( = ?auto_841538 ?auto_841551 ) ) ( not ( = ?auto_841538 ?auto_841552 ) ) ( not ( = ?auto_841538 ?auto_841553 ) ) ( not ( = ?auto_841539 ?auto_841540 ) ) ( not ( = ?auto_841539 ?auto_841541 ) ) ( not ( = ?auto_841539 ?auto_841542 ) ) ( not ( = ?auto_841539 ?auto_841543 ) ) ( not ( = ?auto_841539 ?auto_841544 ) ) ( not ( = ?auto_841539 ?auto_841545 ) ) ( not ( = ?auto_841539 ?auto_841546 ) ) ( not ( = ?auto_841539 ?auto_841547 ) ) ( not ( = ?auto_841539 ?auto_841548 ) ) ( not ( = ?auto_841539 ?auto_841549 ) ) ( not ( = ?auto_841539 ?auto_841550 ) ) ( not ( = ?auto_841539 ?auto_841551 ) ) ( not ( = ?auto_841539 ?auto_841552 ) ) ( not ( = ?auto_841539 ?auto_841553 ) ) ( not ( = ?auto_841540 ?auto_841541 ) ) ( not ( = ?auto_841540 ?auto_841542 ) ) ( not ( = ?auto_841540 ?auto_841543 ) ) ( not ( = ?auto_841540 ?auto_841544 ) ) ( not ( = ?auto_841540 ?auto_841545 ) ) ( not ( = ?auto_841540 ?auto_841546 ) ) ( not ( = ?auto_841540 ?auto_841547 ) ) ( not ( = ?auto_841540 ?auto_841548 ) ) ( not ( = ?auto_841540 ?auto_841549 ) ) ( not ( = ?auto_841540 ?auto_841550 ) ) ( not ( = ?auto_841540 ?auto_841551 ) ) ( not ( = ?auto_841540 ?auto_841552 ) ) ( not ( = ?auto_841540 ?auto_841553 ) ) ( not ( = ?auto_841541 ?auto_841542 ) ) ( not ( = ?auto_841541 ?auto_841543 ) ) ( not ( = ?auto_841541 ?auto_841544 ) ) ( not ( = ?auto_841541 ?auto_841545 ) ) ( not ( = ?auto_841541 ?auto_841546 ) ) ( not ( = ?auto_841541 ?auto_841547 ) ) ( not ( = ?auto_841541 ?auto_841548 ) ) ( not ( = ?auto_841541 ?auto_841549 ) ) ( not ( = ?auto_841541 ?auto_841550 ) ) ( not ( = ?auto_841541 ?auto_841551 ) ) ( not ( = ?auto_841541 ?auto_841552 ) ) ( not ( = ?auto_841541 ?auto_841553 ) ) ( not ( = ?auto_841542 ?auto_841543 ) ) ( not ( = ?auto_841542 ?auto_841544 ) ) ( not ( = ?auto_841542 ?auto_841545 ) ) ( not ( = ?auto_841542 ?auto_841546 ) ) ( not ( = ?auto_841542 ?auto_841547 ) ) ( not ( = ?auto_841542 ?auto_841548 ) ) ( not ( = ?auto_841542 ?auto_841549 ) ) ( not ( = ?auto_841542 ?auto_841550 ) ) ( not ( = ?auto_841542 ?auto_841551 ) ) ( not ( = ?auto_841542 ?auto_841552 ) ) ( not ( = ?auto_841542 ?auto_841553 ) ) ( not ( = ?auto_841543 ?auto_841544 ) ) ( not ( = ?auto_841543 ?auto_841545 ) ) ( not ( = ?auto_841543 ?auto_841546 ) ) ( not ( = ?auto_841543 ?auto_841547 ) ) ( not ( = ?auto_841543 ?auto_841548 ) ) ( not ( = ?auto_841543 ?auto_841549 ) ) ( not ( = ?auto_841543 ?auto_841550 ) ) ( not ( = ?auto_841543 ?auto_841551 ) ) ( not ( = ?auto_841543 ?auto_841552 ) ) ( not ( = ?auto_841543 ?auto_841553 ) ) ( not ( = ?auto_841544 ?auto_841545 ) ) ( not ( = ?auto_841544 ?auto_841546 ) ) ( not ( = ?auto_841544 ?auto_841547 ) ) ( not ( = ?auto_841544 ?auto_841548 ) ) ( not ( = ?auto_841544 ?auto_841549 ) ) ( not ( = ?auto_841544 ?auto_841550 ) ) ( not ( = ?auto_841544 ?auto_841551 ) ) ( not ( = ?auto_841544 ?auto_841552 ) ) ( not ( = ?auto_841544 ?auto_841553 ) ) ( not ( = ?auto_841545 ?auto_841546 ) ) ( not ( = ?auto_841545 ?auto_841547 ) ) ( not ( = ?auto_841545 ?auto_841548 ) ) ( not ( = ?auto_841545 ?auto_841549 ) ) ( not ( = ?auto_841545 ?auto_841550 ) ) ( not ( = ?auto_841545 ?auto_841551 ) ) ( not ( = ?auto_841545 ?auto_841552 ) ) ( not ( = ?auto_841545 ?auto_841553 ) ) ( not ( = ?auto_841546 ?auto_841547 ) ) ( not ( = ?auto_841546 ?auto_841548 ) ) ( not ( = ?auto_841546 ?auto_841549 ) ) ( not ( = ?auto_841546 ?auto_841550 ) ) ( not ( = ?auto_841546 ?auto_841551 ) ) ( not ( = ?auto_841546 ?auto_841552 ) ) ( not ( = ?auto_841546 ?auto_841553 ) ) ( not ( = ?auto_841547 ?auto_841548 ) ) ( not ( = ?auto_841547 ?auto_841549 ) ) ( not ( = ?auto_841547 ?auto_841550 ) ) ( not ( = ?auto_841547 ?auto_841551 ) ) ( not ( = ?auto_841547 ?auto_841552 ) ) ( not ( = ?auto_841547 ?auto_841553 ) ) ( not ( = ?auto_841548 ?auto_841549 ) ) ( not ( = ?auto_841548 ?auto_841550 ) ) ( not ( = ?auto_841548 ?auto_841551 ) ) ( not ( = ?auto_841548 ?auto_841552 ) ) ( not ( = ?auto_841548 ?auto_841553 ) ) ( not ( = ?auto_841549 ?auto_841550 ) ) ( not ( = ?auto_841549 ?auto_841551 ) ) ( not ( = ?auto_841549 ?auto_841552 ) ) ( not ( = ?auto_841549 ?auto_841553 ) ) ( not ( = ?auto_841550 ?auto_841551 ) ) ( not ( = ?auto_841550 ?auto_841552 ) ) ( not ( = ?auto_841550 ?auto_841553 ) ) ( not ( = ?auto_841551 ?auto_841552 ) ) ( not ( = ?auto_841551 ?auto_841553 ) ) ( not ( = ?auto_841552 ?auto_841553 ) ) ( ON ?auto_841551 ?auto_841552 ) ( ON ?auto_841550 ?auto_841551 ) ( ON ?auto_841549 ?auto_841550 ) ( ON ?auto_841548 ?auto_841549 ) ( ON ?auto_841547 ?auto_841548 ) ( ON ?auto_841546 ?auto_841547 ) ( ON ?auto_841545 ?auto_841546 ) ( ON ?auto_841544 ?auto_841545 ) ( ON ?auto_841543 ?auto_841544 ) ( ON ?auto_841542 ?auto_841543 ) ( ON ?auto_841541 ?auto_841542 ) ( ON ?auto_841540 ?auto_841541 ) ( CLEAR ?auto_841538 ) ( ON ?auto_841539 ?auto_841540 ) ( CLEAR ?auto_841539 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_841538 ?auto_841539 )
      ( MAKE-15PILE ?auto_841538 ?auto_841539 ?auto_841540 ?auto_841541 ?auto_841542 ?auto_841543 ?auto_841544 ?auto_841545 ?auto_841546 ?auto_841547 ?auto_841548 ?auto_841549 ?auto_841550 ?auto_841551 ?auto_841552 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_841600 - BLOCK
      ?auto_841601 - BLOCK
      ?auto_841602 - BLOCK
      ?auto_841603 - BLOCK
      ?auto_841604 - BLOCK
      ?auto_841605 - BLOCK
      ?auto_841606 - BLOCK
      ?auto_841607 - BLOCK
      ?auto_841608 - BLOCK
      ?auto_841609 - BLOCK
      ?auto_841610 - BLOCK
      ?auto_841611 - BLOCK
      ?auto_841612 - BLOCK
      ?auto_841613 - BLOCK
      ?auto_841614 - BLOCK
    )
    :vars
    (
      ?auto_841615 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_841614 ?auto_841615 ) ( not ( = ?auto_841600 ?auto_841601 ) ) ( not ( = ?auto_841600 ?auto_841602 ) ) ( not ( = ?auto_841600 ?auto_841603 ) ) ( not ( = ?auto_841600 ?auto_841604 ) ) ( not ( = ?auto_841600 ?auto_841605 ) ) ( not ( = ?auto_841600 ?auto_841606 ) ) ( not ( = ?auto_841600 ?auto_841607 ) ) ( not ( = ?auto_841600 ?auto_841608 ) ) ( not ( = ?auto_841600 ?auto_841609 ) ) ( not ( = ?auto_841600 ?auto_841610 ) ) ( not ( = ?auto_841600 ?auto_841611 ) ) ( not ( = ?auto_841600 ?auto_841612 ) ) ( not ( = ?auto_841600 ?auto_841613 ) ) ( not ( = ?auto_841600 ?auto_841614 ) ) ( not ( = ?auto_841600 ?auto_841615 ) ) ( not ( = ?auto_841601 ?auto_841602 ) ) ( not ( = ?auto_841601 ?auto_841603 ) ) ( not ( = ?auto_841601 ?auto_841604 ) ) ( not ( = ?auto_841601 ?auto_841605 ) ) ( not ( = ?auto_841601 ?auto_841606 ) ) ( not ( = ?auto_841601 ?auto_841607 ) ) ( not ( = ?auto_841601 ?auto_841608 ) ) ( not ( = ?auto_841601 ?auto_841609 ) ) ( not ( = ?auto_841601 ?auto_841610 ) ) ( not ( = ?auto_841601 ?auto_841611 ) ) ( not ( = ?auto_841601 ?auto_841612 ) ) ( not ( = ?auto_841601 ?auto_841613 ) ) ( not ( = ?auto_841601 ?auto_841614 ) ) ( not ( = ?auto_841601 ?auto_841615 ) ) ( not ( = ?auto_841602 ?auto_841603 ) ) ( not ( = ?auto_841602 ?auto_841604 ) ) ( not ( = ?auto_841602 ?auto_841605 ) ) ( not ( = ?auto_841602 ?auto_841606 ) ) ( not ( = ?auto_841602 ?auto_841607 ) ) ( not ( = ?auto_841602 ?auto_841608 ) ) ( not ( = ?auto_841602 ?auto_841609 ) ) ( not ( = ?auto_841602 ?auto_841610 ) ) ( not ( = ?auto_841602 ?auto_841611 ) ) ( not ( = ?auto_841602 ?auto_841612 ) ) ( not ( = ?auto_841602 ?auto_841613 ) ) ( not ( = ?auto_841602 ?auto_841614 ) ) ( not ( = ?auto_841602 ?auto_841615 ) ) ( not ( = ?auto_841603 ?auto_841604 ) ) ( not ( = ?auto_841603 ?auto_841605 ) ) ( not ( = ?auto_841603 ?auto_841606 ) ) ( not ( = ?auto_841603 ?auto_841607 ) ) ( not ( = ?auto_841603 ?auto_841608 ) ) ( not ( = ?auto_841603 ?auto_841609 ) ) ( not ( = ?auto_841603 ?auto_841610 ) ) ( not ( = ?auto_841603 ?auto_841611 ) ) ( not ( = ?auto_841603 ?auto_841612 ) ) ( not ( = ?auto_841603 ?auto_841613 ) ) ( not ( = ?auto_841603 ?auto_841614 ) ) ( not ( = ?auto_841603 ?auto_841615 ) ) ( not ( = ?auto_841604 ?auto_841605 ) ) ( not ( = ?auto_841604 ?auto_841606 ) ) ( not ( = ?auto_841604 ?auto_841607 ) ) ( not ( = ?auto_841604 ?auto_841608 ) ) ( not ( = ?auto_841604 ?auto_841609 ) ) ( not ( = ?auto_841604 ?auto_841610 ) ) ( not ( = ?auto_841604 ?auto_841611 ) ) ( not ( = ?auto_841604 ?auto_841612 ) ) ( not ( = ?auto_841604 ?auto_841613 ) ) ( not ( = ?auto_841604 ?auto_841614 ) ) ( not ( = ?auto_841604 ?auto_841615 ) ) ( not ( = ?auto_841605 ?auto_841606 ) ) ( not ( = ?auto_841605 ?auto_841607 ) ) ( not ( = ?auto_841605 ?auto_841608 ) ) ( not ( = ?auto_841605 ?auto_841609 ) ) ( not ( = ?auto_841605 ?auto_841610 ) ) ( not ( = ?auto_841605 ?auto_841611 ) ) ( not ( = ?auto_841605 ?auto_841612 ) ) ( not ( = ?auto_841605 ?auto_841613 ) ) ( not ( = ?auto_841605 ?auto_841614 ) ) ( not ( = ?auto_841605 ?auto_841615 ) ) ( not ( = ?auto_841606 ?auto_841607 ) ) ( not ( = ?auto_841606 ?auto_841608 ) ) ( not ( = ?auto_841606 ?auto_841609 ) ) ( not ( = ?auto_841606 ?auto_841610 ) ) ( not ( = ?auto_841606 ?auto_841611 ) ) ( not ( = ?auto_841606 ?auto_841612 ) ) ( not ( = ?auto_841606 ?auto_841613 ) ) ( not ( = ?auto_841606 ?auto_841614 ) ) ( not ( = ?auto_841606 ?auto_841615 ) ) ( not ( = ?auto_841607 ?auto_841608 ) ) ( not ( = ?auto_841607 ?auto_841609 ) ) ( not ( = ?auto_841607 ?auto_841610 ) ) ( not ( = ?auto_841607 ?auto_841611 ) ) ( not ( = ?auto_841607 ?auto_841612 ) ) ( not ( = ?auto_841607 ?auto_841613 ) ) ( not ( = ?auto_841607 ?auto_841614 ) ) ( not ( = ?auto_841607 ?auto_841615 ) ) ( not ( = ?auto_841608 ?auto_841609 ) ) ( not ( = ?auto_841608 ?auto_841610 ) ) ( not ( = ?auto_841608 ?auto_841611 ) ) ( not ( = ?auto_841608 ?auto_841612 ) ) ( not ( = ?auto_841608 ?auto_841613 ) ) ( not ( = ?auto_841608 ?auto_841614 ) ) ( not ( = ?auto_841608 ?auto_841615 ) ) ( not ( = ?auto_841609 ?auto_841610 ) ) ( not ( = ?auto_841609 ?auto_841611 ) ) ( not ( = ?auto_841609 ?auto_841612 ) ) ( not ( = ?auto_841609 ?auto_841613 ) ) ( not ( = ?auto_841609 ?auto_841614 ) ) ( not ( = ?auto_841609 ?auto_841615 ) ) ( not ( = ?auto_841610 ?auto_841611 ) ) ( not ( = ?auto_841610 ?auto_841612 ) ) ( not ( = ?auto_841610 ?auto_841613 ) ) ( not ( = ?auto_841610 ?auto_841614 ) ) ( not ( = ?auto_841610 ?auto_841615 ) ) ( not ( = ?auto_841611 ?auto_841612 ) ) ( not ( = ?auto_841611 ?auto_841613 ) ) ( not ( = ?auto_841611 ?auto_841614 ) ) ( not ( = ?auto_841611 ?auto_841615 ) ) ( not ( = ?auto_841612 ?auto_841613 ) ) ( not ( = ?auto_841612 ?auto_841614 ) ) ( not ( = ?auto_841612 ?auto_841615 ) ) ( not ( = ?auto_841613 ?auto_841614 ) ) ( not ( = ?auto_841613 ?auto_841615 ) ) ( not ( = ?auto_841614 ?auto_841615 ) ) ( ON ?auto_841613 ?auto_841614 ) ( ON ?auto_841612 ?auto_841613 ) ( ON ?auto_841611 ?auto_841612 ) ( ON ?auto_841610 ?auto_841611 ) ( ON ?auto_841609 ?auto_841610 ) ( ON ?auto_841608 ?auto_841609 ) ( ON ?auto_841607 ?auto_841608 ) ( ON ?auto_841606 ?auto_841607 ) ( ON ?auto_841605 ?auto_841606 ) ( ON ?auto_841604 ?auto_841605 ) ( ON ?auto_841603 ?auto_841604 ) ( ON ?auto_841602 ?auto_841603 ) ( ON ?auto_841601 ?auto_841602 ) ( ON ?auto_841600 ?auto_841601 ) ( CLEAR ?auto_841600 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_841600 )
      ( MAKE-15PILE ?auto_841600 ?auto_841601 ?auto_841602 ?auto_841603 ?auto_841604 ?auto_841605 ?auto_841606 ?auto_841607 ?auto_841608 ?auto_841609 ?auto_841610 ?auto_841611 ?auto_841612 ?auto_841613 ?auto_841614 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_841663 - BLOCK
      ?auto_841664 - BLOCK
      ?auto_841665 - BLOCK
      ?auto_841666 - BLOCK
      ?auto_841667 - BLOCK
      ?auto_841668 - BLOCK
      ?auto_841669 - BLOCK
      ?auto_841670 - BLOCK
      ?auto_841671 - BLOCK
      ?auto_841672 - BLOCK
      ?auto_841673 - BLOCK
      ?auto_841674 - BLOCK
      ?auto_841675 - BLOCK
      ?auto_841676 - BLOCK
      ?auto_841677 - BLOCK
      ?auto_841678 - BLOCK
    )
    :vars
    (
      ?auto_841679 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_841677 ) ( ON ?auto_841678 ?auto_841679 ) ( CLEAR ?auto_841678 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_841663 ) ( ON ?auto_841664 ?auto_841663 ) ( ON ?auto_841665 ?auto_841664 ) ( ON ?auto_841666 ?auto_841665 ) ( ON ?auto_841667 ?auto_841666 ) ( ON ?auto_841668 ?auto_841667 ) ( ON ?auto_841669 ?auto_841668 ) ( ON ?auto_841670 ?auto_841669 ) ( ON ?auto_841671 ?auto_841670 ) ( ON ?auto_841672 ?auto_841671 ) ( ON ?auto_841673 ?auto_841672 ) ( ON ?auto_841674 ?auto_841673 ) ( ON ?auto_841675 ?auto_841674 ) ( ON ?auto_841676 ?auto_841675 ) ( ON ?auto_841677 ?auto_841676 ) ( not ( = ?auto_841663 ?auto_841664 ) ) ( not ( = ?auto_841663 ?auto_841665 ) ) ( not ( = ?auto_841663 ?auto_841666 ) ) ( not ( = ?auto_841663 ?auto_841667 ) ) ( not ( = ?auto_841663 ?auto_841668 ) ) ( not ( = ?auto_841663 ?auto_841669 ) ) ( not ( = ?auto_841663 ?auto_841670 ) ) ( not ( = ?auto_841663 ?auto_841671 ) ) ( not ( = ?auto_841663 ?auto_841672 ) ) ( not ( = ?auto_841663 ?auto_841673 ) ) ( not ( = ?auto_841663 ?auto_841674 ) ) ( not ( = ?auto_841663 ?auto_841675 ) ) ( not ( = ?auto_841663 ?auto_841676 ) ) ( not ( = ?auto_841663 ?auto_841677 ) ) ( not ( = ?auto_841663 ?auto_841678 ) ) ( not ( = ?auto_841663 ?auto_841679 ) ) ( not ( = ?auto_841664 ?auto_841665 ) ) ( not ( = ?auto_841664 ?auto_841666 ) ) ( not ( = ?auto_841664 ?auto_841667 ) ) ( not ( = ?auto_841664 ?auto_841668 ) ) ( not ( = ?auto_841664 ?auto_841669 ) ) ( not ( = ?auto_841664 ?auto_841670 ) ) ( not ( = ?auto_841664 ?auto_841671 ) ) ( not ( = ?auto_841664 ?auto_841672 ) ) ( not ( = ?auto_841664 ?auto_841673 ) ) ( not ( = ?auto_841664 ?auto_841674 ) ) ( not ( = ?auto_841664 ?auto_841675 ) ) ( not ( = ?auto_841664 ?auto_841676 ) ) ( not ( = ?auto_841664 ?auto_841677 ) ) ( not ( = ?auto_841664 ?auto_841678 ) ) ( not ( = ?auto_841664 ?auto_841679 ) ) ( not ( = ?auto_841665 ?auto_841666 ) ) ( not ( = ?auto_841665 ?auto_841667 ) ) ( not ( = ?auto_841665 ?auto_841668 ) ) ( not ( = ?auto_841665 ?auto_841669 ) ) ( not ( = ?auto_841665 ?auto_841670 ) ) ( not ( = ?auto_841665 ?auto_841671 ) ) ( not ( = ?auto_841665 ?auto_841672 ) ) ( not ( = ?auto_841665 ?auto_841673 ) ) ( not ( = ?auto_841665 ?auto_841674 ) ) ( not ( = ?auto_841665 ?auto_841675 ) ) ( not ( = ?auto_841665 ?auto_841676 ) ) ( not ( = ?auto_841665 ?auto_841677 ) ) ( not ( = ?auto_841665 ?auto_841678 ) ) ( not ( = ?auto_841665 ?auto_841679 ) ) ( not ( = ?auto_841666 ?auto_841667 ) ) ( not ( = ?auto_841666 ?auto_841668 ) ) ( not ( = ?auto_841666 ?auto_841669 ) ) ( not ( = ?auto_841666 ?auto_841670 ) ) ( not ( = ?auto_841666 ?auto_841671 ) ) ( not ( = ?auto_841666 ?auto_841672 ) ) ( not ( = ?auto_841666 ?auto_841673 ) ) ( not ( = ?auto_841666 ?auto_841674 ) ) ( not ( = ?auto_841666 ?auto_841675 ) ) ( not ( = ?auto_841666 ?auto_841676 ) ) ( not ( = ?auto_841666 ?auto_841677 ) ) ( not ( = ?auto_841666 ?auto_841678 ) ) ( not ( = ?auto_841666 ?auto_841679 ) ) ( not ( = ?auto_841667 ?auto_841668 ) ) ( not ( = ?auto_841667 ?auto_841669 ) ) ( not ( = ?auto_841667 ?auto_841670 ) ) ( not ( = ?auto_841667 ?auto_841671 ) ) ( not ( = ?auto_841667 ?auto_841672 ) ) ( not ( = ?auto_841667 ?auto_841673 ) ) ( not ( = ?auto_841667 ?auto_841674 ) ) ( not ( = ?auto_841667 ?auto_841675 ) ) ( not ( = ?auto_841667 ?auto_841676 ) ) ( not ( = ?auto_841667 ?auto_841677 ) ) ( not ( = ?auto_841667 ?auto_841678 ) ) ( not ( = ?auto_841667 ?auto_841679 ) ) ( not ( = ?auto_841668 ?auto_841669 ) ) ( not ( = ?auto_841668 ?auto_841670 ) ) ( not ( = ?auto_841668 ?auto_841671 ) ) ( not ( = ?auto_841668 ?auto_841672 ) ) ( not ( = ?auto_841668 ?auto_841673 ) ) ( not ( = ?auto_841668 ?auto_841674 ) ) ( not ( = ?auto_841668 ?auto_841675 ) ) ( not ( = ?auto_841668 ?auto_841676 ) ) ( not ( = ?auto_841668 ?auto_841677 ) ) ( not ( = ?auto_841668 ?auto_841678 ) ) ( not ( = ?auto_841668 ?auto_841679 ) ) ( not ( = ?auto_841669 ?auto_841670 ) ) ( not ( = ?auto_841669 ?auto_841671 ) ) ( not ( = ?auto_841669 ?auto_841672 ) ) ( not ( = ?auto_841669 ?auto_841673 ) ) ( not ( = ?auto_841669 ?auto_841674 ) ) ( not ( = ?auto_841669 ?auto_841675 ) ) ( not ( = ?auto_841669 ?auto_841676 ) ) ( not ( = ?auto_841669 ?auto_841677 ) ) ( not ( = ?auto_841669 ?auto_841678 ) ) ( not ( = ?auto_841669 ?auto_841679 ) ) ( not ( = ?auto_841670 ?auto_841671 ) ) ( not ( = ?auto_841670 ?auto_841672 ) ) ( not ( = ?auto_841670 ?auto_841673 ) ) ( not ( = ?auto_841670 ?auto_841674 ) ) ( not ( = ?auto_841670 ?auto_841675 ) ) ( not ( = ?auto_841670 ?auto_841676 ) ) ( not ( = ?auto_841670 ?auto_841677 ) ) ( not ( = ?auto_841670 ?auto_841678 ) ) ( not ( = ?auto_841670 ?auto_841679 ) ) ( not ( = ?auto_841671 ?auto_841672 ) ) ( not ( = ?auto_841671 ?auto_841673 ) ) ( not ( = ?auto_841671 ?auto_841674 ) ) ( not ( = ?auto_841671 ?auto_841675 ) ) ( not ( = ?auto_841671 ?auto_841676 ) ) ( not ( = ?auto_841671 ?auto_841677 ) ) ( not ( = ?auto_841671 ?auto_841678 ) ) ( not ( = ?auto_841671 ?auto_841679 ) ) ( not ( = ?auto_841672 ?auto_841673 ) ) ( not ( = ?auto_841672 ?auto_841674 ) ) ( not ( = ?auto_841672 ?auto_841675 ) ) ( not ( = ?auto_841672 ?auto_841676 ) ) ( not ( = ?auto_841672 ?auto_841677 ) ) ( not ( = ?auto_841672 ?auto_841678 ) ) ( not ( = ?auto_841672 ?auto_841679 ) ) ( not ( = ?auto_841673 ?auto_841674 ) ) ( not ( = ?auto_841673 ?auto_841675 ) ) ( not ( = ?auto_841673 ?auto_841676 ) ) ( not ( = ?auto_841673 ?auto_841677 ) ) ( not ( = ?auto_841673 ?auto_841678 ) ) ( not ( = ?auto_841673 ?auto_841679 ) ) ( not ( = ?auto_841674 ?auto_841675 ) ) ( not ( = ?auto_841674 ?auto_841676 ) ) ( not ( = ?auto_841674 ?auto_841677 ) ) ( not ( = ?auto_841674 ?auto_841678 ) ) ( not ( = ?auto_841674 ?auto_841679 ) ) ( not ( = ?auto_841675 ?auto_841676 ) ) ( not ( = ?auto_841675 ?auto_841677 ) ) ( not ( = ?auto_841675 ?auto_841678 ) ) ( not ( = ?auto_841675 ?auto_841679 ) ) ( not ( = ?auto_841676 ?auto_841677 ) ) ( not ( = ?auto_841676 ?auto_841678 ) ) ( not ( = ?auto_841676 ?auto_841679 ) ) ( not ( = ?auto_841677 ?auto_841678 ) ) ( not ( = ?auto_841677 ?auto_841679 ) ) ( not ( = ?auto_841678 ?auto_841679 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_841678 ?auto_841679 )
      ( !STACK ?auto_841678 ?auto_841677 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_841729 - BLOCK
      ?auto_841730 - BLOCK
      ?auto_841731 - BLOCK
      ?auto_841732 - BLOCK
      ?auto_841733 - BLOCK
      ?auto_841734 - BLOCK
      ?auto_841735 - BLOCK
      ?auto_841736 - BLOCK
      ?auto_841737 - BLOCK
      ?auto_841738 - BLOCK
      ?auto_841739 - BLOCK
      ?auto_841740 - BLOCK
      ?auto_841741 - BLOCK
      ?auto_841742 - BLOCK
      ?auto_841743 - BLOCK
      ?auto_841744 - BLOCK
    )
    :vars
    (
      ?auto_841745 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_841744 ?auto_841745 ) ( ON-TABLE ?auto_841729 ) ( ON ?auto_841730 ?auto_841729 ) ( ON ?auto_841731 ?auto_841730 ) ( ON ?auto_841732 ?auto_841731 ) ( ON ?auto_841733 ?auto_841732 ) ( ON ?auto_841734 ?auto_841733 ) ( ON ?auto_841735 ?auto_841734 ) ( ON ?auto_841736 ?auto_841735 ) ( ON ?auto_841737 ?auto_841736 ) ( ON ?auto_841738 ?auto_841737 ) ( ON ?auto_841739 ?auto_841738 ) ( ON ?auto_841740 ?auto_841739 ) ( ON ?auto_841741 ?auto_841740 ) ( ON ?auto_841742 ?auto_841741 ) ( not ( = ?auto_841729 ?auto_841730 ) ) ( not ( = ?auto_841729 ?auto_841731 ) ) ( not ( = ?auto_841729 ?auto_841732 ) ) ( not ( = ?auto_841729 ?auto_841733 ) ) ( not ( = ?auto_841729 ?auto_841734 ) ) ( not ( = ?auto_841729 ?auto_841735 ) ) ( not ( = ?auto_841729 ?auto_841736 ) ) ( not ( = ?auto_841729 ?auto_841737 ) ) ( not ( = ?auto_841729 ?auto_841738 ) ) ( not ( = ?auto_841729 ?auto_841739 ) ) ( not ( = ?auto_841729 ?auto_841740 ) ) ( not ( = ?auto_841729 ?auto_841741 ) ) ( not ( = ?auto_841729 ?auto_841742 ) ) ( not ( = ?auto_841729 ?auto_841743 ) ) ( not ( = ?auto_841729 ?auto_841744 ) ) ( not ( = ?auto_841729 ?auto_841745 ) ) ( not ( = ?auto_841730 ?auto_841731 ) ) ( not ( = ?auto_841730 ?auto_841732 ) ) ( not ( = ?auto_841730 ?auto_841733 ) ) ( not ( = ?auto_841730 ?auto_841734 ) ) ( not ( = ?auto_841730 ?auto_841735 ) ) ( not ( = ?auto_841730 ?auto_841736 ) ) ( not ( = ?auto_841730 ?auto_841737 ) ) ( not ( = ?auto_841730 ?auto_841738 ) ) ( not ( = ?auto_841730 ?auto_841739 ) ) ( not ( = ?auto_841730 ?auto_841740 ) ) ( not ( = ?auto_841730 ?auto_841741 ) ) ( not ( = ?auto_841730 ?auto_841742 ) ) ( not ( = ?auto_841730 ?auto_841743 ) ) ( not ( = ?auto_841730 ?auto_841744 ) ) ( not ( = ?auto_841730 ?auto_841745 ) ) ( not ( = ?auto_841731 ?auto_841732 ) ) ( not ( = ?auto_841731 ?auto_841733 ) ) ( not ( = ?auto_841731 ?auto_841734 ) ) ( not ( = ?auto_841731 ?auto_841735 ) ) ( not ( = ?auto_841731 ?auto_841736 ) ) ( not ( = ?auto_841731 ?auto_841737 ) ) ( not ( = ?auto_841731 ?auto_841738 ) ) ( not ( = ?auto_841731 ?auto_841739 ) ) ( not ( = ?auto_841731 ?auto_841740 ) ) ( not ( = ?auto_841731 ?auto_841741 ) ) ( not ( = ?auto_841731 ?auto_841742 ) ) ( not ( = ?auto_841731 ?auto_841743 ) ) ( not ( = ?auto_841731 ?auto_841744 ) ) ( not ( = ?auto_841731 ?auto_841745 ) ) ( not ( = ?auto_841732 ?auto_841733 ) ) ( not ( = ?auto_841732 ?auto_841734 ) ) ( not ( = ?auto_841732 ?auto_841735 ) ) ( not ( = ?auto_841732 ?auto_841736 ) ) ( not ( = ?auto_841732 ?auto_841737 ) ) ( not ( = ?auto_841732 ?auto_841738 ) ) ( not ( = ?auto_841732 ?auto_841739 ) ) ( not ( = ?auto_841732 ?auto_841740 ) ) ( not ( = ?auto_841732 ?auto_841741 ) ) ( not ( = ?auto_841732 ?auto_841742 ) ) ( not ( = ?auto_841732 ?auto_841743 ) ) ( not ( = ?auto_841732 ?auto_841744 ) ) ( not ( = ?auto_841732 ?auto_841745 ) ) ( not ( = ?auto_841733 ?auto_841734 ) ) ( not ( = ?auto_841733 ?auto_841735 ) ) ( not ( = ?auto_841733 ?auto_841736 ) ) ( not ( = ?auto_841733 ?auto_841737 ) ) ( not ( = ?auto_841733 ?auto_841738 ) ) ( not ( = ?auto_841733 ?auto_841739 ) ) ( not ( = ?auto_841733 ?auto_841740 ) ) ( not ( = ?auto_841733 ?auto_841741 ) ) ( not ( = ?auto_841733 ?auto_841742 ) ) ( not ( = ?auto_841733 ?auto_841743 ) ) ( not ( = ?auto_841733 ?auto_841744 ) ) ( not ( = ?auto_841733 ?auto_841745 ) ) ( not ( = ?auto_841734 ?auto_841735 ) ) ( not ( = ?auto_841734 ?auto_841736 ) ) ( not ( = ?auto_841734 ?auto_841737 ) ) ( not ( = ?auto_841734 ?auto_841738 ) ) ( not ( = ?auto_841734 ?auto_841739 ) ) ( not ( = ?auto_841734 ?auto_841740 ) ) ( not ( = ?auto_841734 ?auto_841741 ) ) ( not ( = ?auto_841734 ?auto_841742 ) ) ( not ( = ?auto_841734 ?auto_841743 ) ) ( not ( = ?auto_841734 ?auto_841744 ) ) ( not ( = ?auto_841734 ?auto_841745 ) ) ( not ( = ?auto_841735 ?auto_841736 ) ) ( not ( = ?auto_841735 ?auto_841737 ) ) ( not ( = ?auto_841735 ?auto_841738 ) ) ( not ( = ?auto_841735 ?auto_841739 ) ) ( not ( = ?auto_841735 ?auto_841740 ) ) ( not ( = ?auto_841735 ?auto_841741 ) ) ( not ( = ?auto_841735 ?auto_841742 ) ) ( not ( = ?auto_841735 ?auto_841743 ) ) ( not ( = ?auto_841735 ?auto_841744 ) ) ( not ( = ?auto_841735 ?auto_841745 ) ) ( not ( = ?auto_841736 ?auto_841737 ) ) ( not ( = ?auto_841736 ?auto_841738 ) ) ( not ( = ?auto_841736 ?auto_841739 ) ) ( not ( = ?auto_841736 ?auto_841740 ) ) ( not ( = ?auto_841736 ?auto_841741 ) ) ( not ( = ?auto_841736 ?auto_841742 ) ) ( not ( = ?auto_841736 ?auto_841743 ) ) ( not ( = ?auto_841736 ?auto_841744 ) ) ( not ( = ?auto_841736 ?auto_841745 ) ) ( not ( = ?auto_841737 ?auto_841738 ) ) ( not ( = ?auto_841737 ?auto_841739 ) ) ( not ( = ?auto_841737 ?auto_841740 ) ) ( not ( = ?auto_841737 ?auto_841741 ) ) ( not ( = ?auto_841737 ?auto_841742 ) ) ( not ( = ?auto_841737 ?auto_841743 ) ) ( not ( = ?auto_841737 ?auto_841744 ) ) ( not ( = ?auto_841737 ?auto_841745 ) ) ( not ( = ?auto_841738 ?auto_841739 ) ) ( not ( = ?auto_841738 ?auto_841740 ) ) ( not ( = ?auto_841738 ?auto_841741 ) ) ( not ( = ?auto_841738 ?auto_841742 ) ) ( not ( = ?auto_841738 ?auto_841743 ) ) ( not ( = ?auto_841738 ?auto_841744 ) ) ( not ( = ?auto_841738 ?auto_841745 ) ) ( not ( = ?auto_841739 ?auto_841740 ) ) ( not ( = ?auto_841739 ?auto_841741 ) ) ( not ( = ?auto_841739 ?auto_841742 ) ) ( not ( = ?auto_841739 ?auto_841743 ) ) ( not ( = ?auto_841739 ?auto_841744 ) ) ( not ( = ?auto_841739 ?auto_841745 ) ) ( not ( = ?auto_841740 ?auto_841741 ) ) ( not ( = ?auto_841740 ?auto_841742 ) ) ( not ( = ?auto_841740 ?auto_841743 ) ) ( not ( = ?auto_841740 ?auto_841744 ) ) ( not ( = ?auto_841740 ?auto_841745 ) ) ( not ( = ?auto_841741 ?auto_841742 ) ) ( not ( = ?auto_841741 ?auto_841743 ) ) ( not ( = ?auto_841741 ?auto_841744 ) ) ( not ( = ?auto_841741 ?auto_841745 ) ) ( not ( = ?auto_841742 ?auto_841743 ) ) ( not ( = ?auto_841742 ?auto_841744 ) ) ( not ( = ?auto_841742 ?auto_841745 ) ) ( not ( = ?auto_841743 ?auto_841744 ) ) ( not ( = ?auto_841743 ?auto_841745 ) ) ( not ( = ?auto_841744 ?auto_841745 ) ) ( CLEAR ?auto_841742 ) ( ON ?auto_841743 ?auto_841744 ) ( CLEAR ?auto_841743 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-15PILE ?auto_841729 ?auto_841730 ?auto_841731 ?auto_841732 ?auto_841733 ?auto_841734 ?auto_841735 ?auto_841736 ?auto_841737 ?auto_841738 ?auto_841739 ?auto_841740 ?auto_841741 ?auto_841742 ?auto_841743 )
      ( MAKE-16PILE ?auto_841729 ?auto_841730 ?auto_841731 ?auto_841732 ?auto_841733 ?auto_841734 ?auto_841735 ?auto_841736 ?auto_841737 ?auto_841738 ?auto_841739 ?auto_841740 ?auto_841741 ?auto_841742 ?auto_841743 ?auto_841744 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_841795 - BLOCK
      ?auto_841796 - BLOCK
      ?auto_841797 - BLOCK
      ?auto_841798 - BLOCK
      ?auto_841799 - BLOCK
      ?auto_841800 - BLOCK
      ?auto_841801 - BLOCK
      ?auto_841802 - BLOCK
      ?auto_841803 - BLOCK
      ?auto_841804 - BLOCK
      ?auto_841805 - BLOCK
      ?auto_841806 - BLOCK
      ?auto_841807 - BLOCK
      ?auto_841808 - BLOCK
      ?auto_841809 - BLOCK
      ?auto_841810 - BLOCK
    )
    :vars
    (
      ?auto_841811 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_841810 ?auto_841811 ) ( ON-TABLE ?auto_841795 ) ( ON ?auto_841796 ?auto_841795 ) ( ON ?auto_841797 ?auto_841796 ) ( ON ?auto_841798 ?auto_841797 ) ( ON ?auto_841799 ?auto_841798 ) ( ON ?auto_841800 ?auto_841799 ) ( ON ?auto_841801 ?auto_841800 ) ( ON ?auto_841802 ?auto_841801 ) ( ON ?auto_841803 ?auto_841802 ) ( ON ?auto_841804 ?auto_841803 ) ( ON ?auto_841805 ?auto_841804 ) ( ON ?auto_841806 ?auto_841805 ) ( ON ?auto_841807 ?auto_841806 ) ( not ( = ?auto_841795 ?auto_841796 ) ) ( not ( = ?auto_841795 ?auto_841797 ) ) ( not ( = ?auto_841795 ?auto_841798 ) ) ( not ( = ?auto_841795 ?auto_841799 ) ) ( not ( = ?auto_841795 ?auto_841800 ) ) ( not ( = ?auto_841795 ?auto_841801 ) ) ( not ( = ?auto_841795 ?auto_841802 ) ) ( not ( = ?auto_841795 ?auto_841803 ) ) ( not ( = ?auto_841795 ?auto_841804 ) ) ( not ( = ?auto_841795 ?auto_841805 ) ) ( not ( = ?auto_841795 ?auto_841806 ) ) ( not ( = ?auto_841795 ?auto_841807 ) ) ( not ( = ?auto_841795 ?auto_841808 ) ) ( not ( = ?auto_841795 ?auto_841809 ) ) ( not ( = ?auto_841795 ?auto_841810 ) ) ( not ( = ?auto_841795 ?auto_841811 ) ) ( not ( = ?auto_841796 ?auto_841797 ) ) ( not ( = ?auto_841796 ?auto_841798 ) ) ( not ( = ?auto_841796 ?auto_841799 ) ) ( not ( = ?auto_841796 ?auto_841800 ) ) ( not ( = ?auto_841796 ?auto_841801 ) ) ( not ( = ?auto_841796 ?auto_841802 ) ) ( not ( = ?auto_841796 ?auto_841803 ) ) ( not ( = ?auto_841796 ?auto_841804 ) ) ( not ( = ?auto_841796 ?auto_841805 ) ) ( not ( = ?auto_841796 ?auto_841806 ) ) ( not ( = ?auto_841796 ?auto_841807 ) ) ( not ( = ?auto_841796 ?auto_841808 ) ) ( not ( = ?auto_841796 ?auto_841809 ) ) ( not ( = ?auto_841796 ?auto_841810 ) ) ( not ( = ?auto_841796 ?auto_841811 ) ) ( not ( = ?auto_841797 ?auto_841798 ) ) ( not ( = ?auto_841797 ?auto_841799 ) ) ( not ( = ?auto_841797 ?auto_841800 ) ) ( not ( = ?auto_841797 ?auto_841801 ) ) ( not ( = ?auto_841797 ?auto_841802 ) ) ( not ( = ?auto_841797 ?auto_841803 ) ) ( not ( = ?auto_841797 ?auto_841804 ) ) ( not ( = ?auto_841797 ?auto_841805 ) ) ( not ( = ?auto_841797 ?auto_841806 ) ) ( not ( = ?auto_841797 ?auto_841807 ) ) ( not ( = ?auto_841797 ?auto_841808 ) ) ( not ( = ?auto_841797 ?auto_841809 ) ) ( not ( = ?auto_841797 ?auto_841810 ) ) ( not ( = ?auto_841797 ?auto_841811 ) ) ( not ( = ?auto_841798 ?auto_841799 ) ) ( not ( = ?auto_841798 ?auto_841800 ) ) ( not ( = ?auto_841798 ?auto_841801 ) ) ( not ( = ?auto_841798 ?auto_841802 ) ) ( not ( = ?auto_841798 ?auto_841803 ) ) ( not ( = ?auto_841798 ?auto_841804 ) ) ( not ( = ?auto_841798 ?auto_841805 ) ) ( not ( = ?auto_841798 ?auto_841806 ) ) ( not ( = ?auto_841798 ?auto_841807 ) ) ( not ( = ?auto_841798 ?auto_841808 ) ) ( not ( = ?auto_841798 ?auto_841809 ) ) ( not ( = ?auto_841798 ?auto_841810 ) ) ( not ( = ?auto_841798 ?auto_841811 ) ) ( not ( = ?auto_841799 ?auto_841800 ) ) ( not ( = ?auto_841799 ?auto_841801 ) ) ( not ( = ?auto_841799 ?auto_841802 ) ) ( not ( = ?auto_841799 ?auto_841803 ) ) ( not ( = ?auto_841799 ?auto_841804 ) ) ( not ( = ?auto_841799 ?auto_841805 ) ) ( not ( = ?auto_841799 ?auto_841806 ) ) ( not ( = ?auto_841799 ?auto_841807 ) ) ( not ( = ?auto_841799 ?auto_841808 ) ) ( not ( = ?auto_841799 ?auto_841809 ) ) ( not ( = ?auto_841799 ?auto_841810 ) ) ( not ( = ?auto_841799 ?auto_841811 ) ) ( not ( = ?auto_841800 ?auto_841801 ) ) ( not ( = ?auto_841800 ?auto_841802 ) ) ( not ( = ?auto_841800 ?auto_841803 ) ) ( not ( = ?auto_841800 ?auto_841804 ) ) ( not ( = ?auto_841800 ?auto_841805 ) ) ( not ( = ?auto_841800 ?auto_841806 ) ) ( not ( = ?auto_841800 ?auto_841807 ) ) ( not ( = ?auto_841800 ?auto_841808 ) ) ( not ( = ?auto_841800 ?auto_841809 ) ) ( not ( = ?auto_841800 ?auto_841810 ) ) ( not ( = ?auto_841800 ?auto_841811 ) ) ( not ( = ?auto_841801 ?auto_841802 ) ) ( not ( = ?auto_841801 ?auto_841803 ) ) ( not ( = ?auto_841801 ?auto_841804 ) ) ( not ( = ?auto_841801 ?auto_841805 ) ) ( not ( = ?auto_841801 ?auto_841806 ) ) ( not ( = ?auto_841801 ?auto_841807 ) ) ( not ( = ?auto_841801 ?auto_841808 ) ) ( not ( = ?auto_841801 ?auto_841809 ) ) ( not ( = ?auto_841801 ?auto_841810 ) ) ( not ( = ?auto_841801 ?auto_841811 ) ) ( not ( = ?auto_841802 ?auto_841803 ) ) ( not ( = ?auto_841802 ?auto_841804 ) ) ( not ( = ?auto_841802 ?auto_841805 ) ) ( not ( = ?auto_841802 ?auto_841806 ) ) ( not ( = ?auto_841802 ?auto_841807 ) ) ( not ( = ?auto_841802 ?auto_841808 ) ) ( not ( = ?auto_841802 ?auto_841809 ) ) ( not ( = ?auto_841802 ?auto_841810 ) ) ( not ( = ?auto_841802 ?auto_841811 ) ) ( not ( = ?auto_841803 ?auto_841804 ) ) ( not ( = ?auto_841803 ?auto_841805 ) ) ( not ( = ?auto_841803 ?auto_841806 ) ) ( not ( = ?auto_841803 ?auto_841807 ) ) ( not ( = ?auto_841803 ?auto_841808 ) ) ( not ( = ?auto_841803 ?auto_841809 ) ) ( not ( = ?auto_841803 ?auto_841810 ) ) ( not ( = ?auto_841803 ?auto_841811 ) ) ( not ( = ?auto_841804 ?auto_841805 ) ) ( not ( = ?auto_841804 ?auto_841806 ) ) ( not ( = ?auto_841804 ?auto_841807 ) ) ( not ( = ?auto_841804 ?auto_841808 ) ) ( not ( = ?auto_841804 ?auto_841809 ) ) ( not ( = ?auto_841804 ?auto_841810 ) ) ( not ( = ?auto_841804 ?auto_841811 ) ) ( not ( = ?auto_841805 ?auto_841806 ) ) ( not ( = ?auto_841805 ?auto_841807 ) ) ( not ( = ?auto_841805 ?auto_841808 ) ) ( not ( = ?auto_841805 ?auto_841809 ) ) ( not ( = ?auto_841805 ?auto_841810 ) ) ( not ( = ?auto_841805 ?auto_841811 ) ) ( not ( = ?auto_841806 ?auto_841807 ) ) ( not ( = ?auto_841806 ?auto_841808 ) ) ( not ( = ?auto_841806 ?auto_841809 ) ) ( not ( = ?auto_841806 ?auto_841810 ) ) ( not ( = ?auto_841806 ?auto_841811 ) ) ( not ( = ?auto_841807 ?auto_841808 ) ) ( not ( = ?auto_841807 ?auto_841809 ) ) ( not ( = ?auto_841807 ?auto_841810 ) ) ( not ( = ?auto_841807 ?auto_841811 ) ) ( not ( = ?auto_841808 ?auto_841809 ) ) ( not ( = ?auto_841808 ?auto_841810 ) ) ( not ( = ?auto_841808 ?auto_841811 ) ) ( not ( = ?auto_841809 ?auto_841810 ) ) ( not ( = ?auto_841809 ?auto_841811 ) ) ( not ( = ?auto_841810 ?auto_841811 ) ) ( ON ?auto_841809 ?auto_841810 ) ( CLEAR ?auto_841807 ) ( ON ?auto_841808 ?auto_841809 ) ( CLEAR ?auto_841808 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_841795 ?auto_841796 ?auto_841797 ?auto_841798 ?auto_841799 ?auto_841800 ?auto_841801 ?auto_841802 ?auto_841803 ?auto_841804 ?auto_841805 ?auto_841806 ?auto_841807 ?auto_841808 )
      ( MAKE-16PILE ?auto_841795 ?auto_841796 ?auto_841797 ?auto_841798 ?auto_841799 ?auto_841800 ?auto_841801 ?auto_841802 ?auto_841803 ?auto_841804 ?auto_841805 ?auto_841806 ?auto_841807 ?auto_841808 ?auto_841809 ?auto_841810 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_841861 - BLOCK
      ?auto_841862 - BLOCK
      ?auto_841863 - BLOCK
      ?auto_841864 - BLOCK
      ?auto_841865 - BLOCK
      ?auto_841866 - BLOCK
      ?auto_841867 - BLOCK
      ?auto_841868 - BLOCK
      ?auto_841869 - BLOCK
      ?auto_841870 - BLOCK
      ?auto_841871 - BLOCK
      ?auto_841872 - BLOCK
      ?auto_841873 - BLOCK
      ?auto_841874 - BLOCK
      ?auto_841875 - BLOCK
      ?auto_841876 - BLOCK
    )
    :vars
    (
      ?auto_841877 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_841876 ?auto_841877 ) ( ON-TABLE ?auto_841861 ) ( ON ?auto_841862 ?auto_841861 ) ( ON ?auto_841863 ?auto_841862 ) ( ON ?auto_841864 ?auto_841863 ) ( ON ?auto_841865 ?auto_841864 ) ( ON ?auto_841866 ?auto_841865 ) ( ON ?auto_841867 ?auto_841866 ) ( ON ?auto_841868 ?auto_841867 ) ( ON ?auto_841869 ?auto_841868 ) ( ON ?auto_841870 ?auto_841869 ) ( ON ?auto_841871 ?auto_841870 ) ( ON ?auto_841872 ?auto_841871 ) ( not ( = ?auto_841861 ?auto_841862 ) ) ( not ( = ?auto_841861 ?auto_841863 ) ) ( not ( = ?auto_841861 ?auto_841864 ) ) ( not ( = ?auto_841861 ?auto_841865 ) ) ( not ( = ?auto_841861 ?auto_841866 ) ) ( not ( = ?auto_841861 ?auto_841867 ) ) ( not ( = ?auto_841861 ?auto_841868 ) ) ( not ( = ?auto_841861 ?auto_841869 ) ) ( not ( = ?auto_841861 ?auto_841870 ) ) ( not ( = ?auto_841861 ?auto_841871 ) ) ( not ( = ?auto_841861 ?auto_841872 ) ) ( not ( = ?auto_841861 ?auto_841873 ) ) ( not ( = ?auto_841861 ?auto_841874 ) ) ( not ( = ?auto_841861 ?auto_841875 ) ) ( not ( = ?auto_841861 ?auto_841876 ) ) ( not ( = ?auto_841861 ?auto_841877 ) ) ( not ( = ?auto_841862 ?auto_841863 ) ) ( not ( = ?auto_841862 ?auto_841864 ) ) ( not ( = ?auto_841862 ?auto_841865 ) ) ( not ( = ?auto_841862 ?auto_841866 ) ) ( not ( = ?auto_841862 ?auto_841867 ) ) ( not ( = ?auto_841862 ?auto_841868 ) ) ( not ( = ?auto_841862 ?auto_841869 ) ) ( not ( = ?auto_841862 ?auto_841870 ) ) ( not ( = ?auto_841862 ?auto_841871 ) ) ( not ( = ?auto_841862 ?auto_841872 ) ) ( not ( = ?auto_841862 ?auto_841873 ) ) ( not ( = ?auto_841862 ?auto_841874 ) ) ( not ( = ?auto_841862 ?auto_841875 ) ) ( not ( = ?auto_841862 ?auto_841876 ) ) ( not ( = ?auto_841862 ?auto_841877 ) ) ( not ( = ?auto_841863 ?auto_841864 ) ) ( not ( = ?auto_841863 ?auto_841865 ) ) ( not ( = ?auto_841863 ?auto_841866 ) ) ( not ( = ?auto_841863 ?auto_841867 ) ) ( not ( = ?auto_841863 ?auto_841868 ) ) ( not ( = ?auto_841863 ?auto_841869 ) ) ( not ( = ?auto_841863 ?auto_841870 ) ) ( not ( = ?auto_841863 ?auto_841871 ) ) ( not ( = ?auto_841863 ?auto_841872 ) ) ( not ( = ?auto_841863 ?auto_841873 ) ) ( not ( = ?auto_841863 ?auto_841874 ) ) ( not ( = ?auto_841863 ?auto_841875 ) ) ( not ( = ?auto_841863 ?auto_841876 ) ) ( not ( = ?auto_841863 ?auto_841877 ) ) ( not ( = ?auto_841864 ?auto_841865 ) ) ( not ( = ?auto_841864 ?auto_841866 ) ) ( not ( = ?auto_841864 ?auto_841867 ) ) ( not ( = ?auto_841864 ?auto_841868 ) ) ( not ( = ?auto_841864 ?auto_841869 ) ) ( not ( = ?auto_841864 ?auto_841870 ) ) ( not ( = ?auto_841864 ?auto_841871 ) ) ( not ( = ?auto_841864 ?auto_841872 ) ) ( not ( = ?auto_841864 ?auto_841873 ) ) ( not ( = ?auto_841864 ?auto_841874 ) ) ( not ( = ?auto_841864 ?auto_841875 ) ) ( not ( = ?auto_841864 ?auto_841876 ) ) ( not ( = ?auto_841864 ?auto_841877 ) ) ( not ( = ?auto_841865 ?auto_841866 ) ) ( not ( = ?auto_841865 ?auto_841867 ) ) ( not ( = ?auto_841865 ?auto_841868 ) ) ( not ( = ?auto_841865 ?auto_841869 ) ) ( not ( = ?auto_841865 ?auto_841870 ) ) ( not ( = ?auto_841865 ?auto_841871 ) ) ( not ( = ?auto_841865 ?auto_841872 ) ) ( not ( = ?auto_841865 ?auto_841873 ) ) ( not ( = ?auto_841865 ?auto_841874 ) ) ( not ( = ?auto_841865 ?auto_841875 ) ) ( not ( = ?auto_841865 ?auto_841876 ) ) ( not ( = ?auto_841865 ?auto_841877 ) ) ( not ( = ?auto_841866 ?auto_841867 ) ) ( not ( = ?auto_841866 ?auto_841868 ) ) ( not ( = ?auto_841866 ?auto_841869 ) ) ( not ( = ?auto_841866 ?auto_841870 ) ) ( not ( = ?auto_841866 ?auto_841871 ) ) ( not ( = ?auto_841866 ?auto_841872 ) ) ( not ( = ?auto_841866 ?auto_841873 ) ) ( not ( = ?auto_841866 ?auto_841874 ) ) ( not ( = ?auto_841866 ?auto_841875 ) ) ( not ( = ?auto_841866 ?auto_841876 ) ) ( not ( = ?auto_841866 ?auto_841877 ) ) ( not ( = ?auto_841867 ?auto_841868 ) ) ( not ( = ?auto_841867 ?auto_841869 ) ) ( not ( = ?auto_841867 ?auto_841870 ) ) ( not ( = ?auto_841867 ?auto_841871 ) ) ( not ( = ?auto_841867 ?auto_841872 ) ) ( not ( = ?auto_841867 ?auto_841873 ) ) ( not ( = ?auto_841867 ?auto_841874 ) ) ( not ( = ?auto_841867 ?auto_841875 ) ) ( not ( = ?auto_841867 ?auto_841876 ) ) ( not ( = ?auto_841867 ?auto_841877 ) ) ( not ( = ?auto_841868 ?auto_841869 ) ) ( not ( = ?auto_841868 ?auto_841870 ) ) ( not ( = ?auto_841868 ?auto_841871 ) ) ( not ( = ?auto_841868 ?auto_841872 ) ) ( not ( = ?auto_841868 ?auto_841873 ) ) ( not ( = ?auto_841868 ?auto_841874 ) ) ( not ( = ?auto_841868 ?auto_841875 ) ) ( not ( = ?auto_841868 ?auto_841876 ) ) ( not ( = ?auto_841868 ?auto_841877 ) ) ( not ( = ?auto_841869 ?auto_841870 ) ) ( not ( = ?auto_841869 ?auto_841871 ) ) ( not ( = ?auto_841869 ?auto_841872 ) ) ( not ( = ?auto_841869 ?auto_841873 ) ) ( not ( = ?auto_841869 ?auto_841874 ) ) ( not ( = ?auto_841869 ?auto_841875 ) ) ( not ( = ?auto_841869 ?auto_841876 ) ) ( not ( = ?auto_841869 ?auto_841877 ) ) ( not ( = ?auto_841870 ?auto_841871 ) ) ( not ( = ?auto_841870 ?auto_841872 ) ) ( not ( = ?auto_841870 ?auto_841873 ) ) ( not ( = ?auto_841870 ?auto_841874 ) ) ( not ( = ?auto_841870 ?auto_841875 ) ) ( not ( = ?auto_841870 ?auto_841876 ) ) ( not ( = ?auto_841870 ?auto_841877 ) ) ( not ( = ?auto_841871 ?auto_841872 ) ) ( not ( = ?auto_841871 ?auto_841873 ) ) ( not ( = ?auto_841871 ?auto_841874 ) ) ( not ( = ?auto_841871 ?auto_841875 ) ) ( not ( = ?auto_841871 ?auto_841876 ) ) ( not ( = ?auto_841871 ?auto_841877 ) ) ( not ( = ?auto_841872 ?auto_841873 ) ) ( not ( = ?auto_841872 ?auto_841874 ) ) ( not ( = ?auto_841872 ?auto_841875 ) ) ( not ( = ?auto_841872 ?auto_841876 ) ) ( not ( = ?auto_841872 ?auto_841877 ) ) ( not ( = ?auto_841873 ?auto_841874 ) ) ( not ( = ?auto_841873 ?auto_841875 ) ) ( not ( = ?auto_841873 ?auto_841876 ) ) ( not ( = ?auto_841873 ?auto_841877 ) ) ( not ( = ?auto_841874 ?auto_841875 ) ) ( not ( = ?auto_841874 ?auto_841876 ) ) ( not ( = ?auto_841874 ?auto_841877 ) ) ( not ( = ?auto_841875 ?auto_841876 ) ) ( not ( = ?auto_841875 ?auto_841877 ) ) ( not ( = ?auto_841876 ?auto_841877 ) ) ( ON ?auto_841875 ?auto_841876 ) ( ON ?auto_841874 ?auto_841875 ) ( CLEAR ?auto_841872 ) ( ON ?auto_841873 ?auto_841874 ) ( CLEAR ?auto_841873 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_841861 ?auto_841862 ?auto_841863 ?auto_841864 ?auto_841865 ?auto_841866 ?auto_841867 ?auto_841868 ?auto_841869 ?auto_841870 ?auto_841871 ?auto_841872 ?auto_841873 )
      ( MAKE-16PILE ?auto_841861 ?auto_841862 ?auto_841863 ?auto_841864 ?auto_841865 ?auto_841866 ?auto_841867 ?auto_841868 ?auto_841869 ?auto_841870 ?auto_841871 ?auto_841872 ?auto_841873 ?auto_841874 ?auto_841875 ?auto_841876 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_841927 - BLOCK
      ?auto_841928 - BLOCK
      ?auto_841929 - BLOCK
      ?auto_841930 - BLOCK
      ?auto_841931 - BLOCK
      ?auto_841932 - BLOCK
      ?auto_841933 - BLOCK
      ?auto_841934 - BLOCK
      ?auto_841935 - BLOCK
      ?auto_841936 - BLOCK
      ?auto_841937 - BLOCK
      ?auto_841938 - BLOCK
      ?auto_841939 - BLOCK
      ?auto_841940 - BLOCK
      ?auto_841941 - BLOCK
      ?auto_841942 - BLOCK
    )
    :vars
    (
      ?auto_841943 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_841942 ?auto_841943 ) ( ON-TABLE ?auto_841927 ) ( ON ?auto_841928 ?auto_841927 ) ( ON ?auto_841929 ?auto_841928 ) ( ON ?auto_841930 ?auto_841929 ) ( ON ?auto_841931 ?auto_841930 ) ( ON ?auto_841932 ?auto_841931 ) ( ON ?auto_841933 ?auto_841932 ) ( ON ?auto_841934 ?auto_841933 ) ( ON ?auto_841935 ?auto_841934 ) ( ON ?auto_841936 ?auto_841935 ) ( ON ?auto_841937 ?auto_841936 ) ( not ( = ?auto_841927 ?auto_841928 ) ) ( not ( = ?auto_841927 ?auto_841929 ) ) ( not ( = ?auto_841927 ?auto_841930 ) ) ( not ( = ?auto_841927 ?auto_841931 ) ) ( not ( = ?auto_841927 ?auto_841932 ) ) ( not ( = ?auto_841927 ?auto_841933 ) ) ( not ( = ?auto_841927 ?auto_841934 ) ) ( not ( = ?auto_841927 ?auto_841935 ) ) ( not ( = ?auto_841927 ?auto_841936 ) ) ( not ( = ?auto_841927 ?auto_841937 ) ) ( not ( = ?auto_841927 ?auto_841938 ) ) ( not ( = ?auto_841927 ?auto_841939 ) ) ( not ( = ?auto_841927 ?auto_841940 ) ) ( not ( = ?auto_841927 ?auto_841941 ) ) ( not ( = ?auto_841927 ?auto_841942 ) ) ( not ( = ?auto_841927 ?auto_841943 ) ) ( not ( = ?auto_841928 ?auto_841929 ) ) ( not ( = ?auto_841928 ?auto_841930 ) ) ( not ( = ?auto_841928 ?auto_841931 ) ) ( not ( = ?auto_841928 ?auto_841932 ) ) ( not ( = ?auto_841928 ?auto_841933 ) ) ( not ( = ?auto_841928 ?auto_841934 ) ) ( not ( = ?auto_841928 ?auto_841935 ) ) ( not ( = ?auto_841928 ?auto_841936 ) ) ( not ( = ?auto_841928 ?auto_841937 ) ) ( not ( = ?auto_841928 ?auto_841938 ) ) ( not ( = ?auto_841928 ?auto_841939 ) ) ( not ( = ?auto_841928 ?auto_841940 ) ) ( not ( = ?auto_841928 ?auto_841941 ) ) ( not ( = ?auto_841928 ?auto_841942 ) ) ( not ( = ?auto_841928 ?auto_841943 ) ) ( not ( = ?auto_841929 ?auto_841930 ) ) ( not ( = ?auto_841929 ?auto_841931 ) ) ( not ( = ?auto_841929 ?auto_841932 ) ) ( not ( = ?auto_841929 ?auto_841933 ) ) ( not ( = ?auto_841929 ?auto_841934 ) ) ( not ( = ?auto_841929 ?auto_841935 ) ) ( not ( = ?auto_841929 ?auto_841936 ) ) ( not ( = ?auto_841929 ?auto_841937 ) ) ( not ( = ?auto_841929 ?auto_841938 ) ) ( not ( = ?auto_841929 ?auto_841939 ) ) ( not ( = ?auto_841929 ?auto_841940 ) ) ( not ( = ?auto_841929 ?auto_841941 ) ) ( not ( = ?auto_841929 ?auto_841942 ) ) ( not ( = ?auto_841929 ?auto_841943 ) ) ( not ( = ?auto_841930 ?auto_841931 ) ) ( not ( = ?auto_841930 ?auto_841932 ) ) ( not ( = ?auto_841930 ?auto_841933 ) ) ( not ( = ?auto_841930 ?auto_841934 ) ) ( not ( = ?auto_841930 ?auto_841935 ) ) ( not ( = ?auto_841930 ?auto_841936 ) ) ( not ( = ?auto_841930 ?auto_841937 ) ) ( not ( = ?auto_841930 ?auto_841938 ) ) ( not ( = ?auto_841930 ?auto_841939 ) ) ( not ( = ?auto_841930 ?auto_841940 ) ) ( not ( = ?auto_841930 ?auto_841941 ) ) ( not ( = ?auto_841930 ?auto_841942 ) ) ( not ( = ?auto_841930 ?auto_841943 ) ) ( not ( = ?auto_841931 ?auto_841932 ) ) ( not ( = ?auto_841931 ?auto_841933 ) ) ( not ( = ?auto_841931 ?auto_841934 ) ) ( not ( = ?auto_841931 ?auto_841935 ) ) ( not ( = ?auto_841931 ?auto_841936 ) ) ( not ( = ?auto_841931 ?auto_841937 ) ) ( not ( = ?auto_841931 ?auto_841938 ) ) ( not ( = ?auto_841931 ?auto_841939 ) ) ( not ( = ?auto_841931 ?auto_841940 ) ) ( not ( = ?auto_841931 ?auto_841941 ) ) ( not ( = ?auto_841931 ?auto_841942 ) ) ( not ( = ?auto_841931 ?auto_841943 ) ) ( not ( = ?auto_841932 ?auto_841933 ) ) ( not ( = ?auto_841932 ?auto_841934 ) ) ( not ( = ?auto_841932 ?auto_841935 ) ) ( not ( = ?auto_841932 ?auto_841936 ) ) ( not ( = ?auto_841932 ?auto_841937 ) ) ( not ( = ?auto_841932 ?auto_841938 ) ) ( not ( = ?auto_841932 ?auto_841939 ) ) ( not ( = ?auto_841932 ?auto_841940 ) ) ( not ( = ?auto_841932 ?auto_841941 ) ) ( not ( = ?auto_841932 ?auto_841942 ) ) ( not ( = ?auto_841932 ?auto_841943 ) ) ( not ( = ?auto_841933 ?auto_841934 ) ) ( not ( = ?auto_841933 ?auto_841935 ) ) ( not ( = ?auto_841933 ?auto_841936 ) ) ( not ( = ?auto_841933 ?auto_841937 ) ) ( not ( = ?auto_841933 ?auto_841938 ) ) ( not ( = ?auto_841933 ?auto_841939 ) ) ( not ( = ?auto_841933 ?auto_841940 ) ) ( not ( = ?auto_841933 ?auto_841941 ) ) ( not ( = ?auto_841933 ?auto_841942 ) ) ( not ( = ?auto_841933 ?auto_841943 ) ) ( not ( = ?auto_841934 ?auto_841935 ) ) ( not ( = ?auto_841934 ?auto_841936 ) ) ( not ( = ?auto_841934 ?auto_841937 ) ) ( not ( = ?auto_841934 ?auto_841938 ) ) ( not ( = ?auto_841934 ?auto_841939 ) ) ( not ( = ?auto_841934 ?auto_841940 ) ) ( not ( = ?auto_841934 ?auto_841941 ) ) ( not ( = ?auto_841934 ?auto_841942 ) ) ( not ( = ?auto_841934 ?auto_841943 ) ) ( not ( = ?auto_841935 ?auto_841936 ) ) ( not ( = ?auto_841935 ?auto_841937 ) ) ( not ( = ?auto_841935 ?auto_841938 ) ) ( not ( = ?auto_841935 ?auto_841939 ) ) ( not ( = ?auto_841935 ?auto_841940 ) ) ( not ( = ?auto_841935 ?auto_841941 ) ) ( not ( = ?auto_841935 ?auto_841942 ) ) ( not ( = ?auto_841935 ?auto_841943 ) ) ( not ( = ?auto_841936 ?auto_841937 ) ) ( not ( = ?auto_841936 ?auto_841938 ) ) ( not ( = ?auto_841936 ?auto_841939 ) ) ( not ( = ?auto_841936 ?auto_841940 ) ) ( not ( = ?auto_841936 ?auto_841941 ) ) ( not ( = ?auto_841936 ?auto_841942 ) ) ( not ( = ?auto_841936 ?auto_841943 ) ) ( not ( = ?auto_841937 ?auto_841938 ) ) ( not ( = ?auto_841937 ?auto_841939 ) ) ( not ( = ?auto_841937 ?auto_841940 ) ) ( not ( = ?auto_841937 ?auto_841941 ) ) ( not ( = ?auto_841937 ?auto_841942 ) ) ( not ( = ?auto_841937 ?auto_841943 ) ) ( not ( = ?auto_841938 ?auto_841939 ) ) ( not ( = ?auto_841938 ?auto_841940 ) ) ( not ( = ?auto_841938 ?auto_841941 ) ) ( not ( = ?auto_841938 ?auto_841942 ) ) ( not ( = ?auto_841938 ?auto_841943 ) ) ( not ( = ?auto_841939 ?auto_841940 ) ) ( not ( = ?auto_841939 ?auto_841941 ) ) ( not ( = ?auto_841939 ?auto_841942 ) ) ( not ( = ?auto_841939 ?auto_841943 ) ) ( not ( = ?auto_841940 ?auto_841941 ) ) ( not ( = ?auto_841940 ?auto_841942 ) ) ( not ( = ?auto_841940 ?auto_841943 ) ) ( not ( = ?auto_841941 ?auto_841942 ) ) ( not ( = ?auto_841941 ?auto_841943 ) ) ( not ( = ?auto_841942 ?auto_841943 ) ) ( ON ?auto_841941 ?auto_841942 ) ( ON ?auto_841940 ?auto_841941 ) ( ON ?auto_841939 ?auto_841940 ) ( CLEAR ?auto_841937 ) ( ON ?auto_841938 ?auto_841939 ) ( CLEAR ?auto_841938 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_841927 ?auto_841928 ?auto_841929 ?auto_841930 ?auto_841931 ?auto_841932 ?auto_841933 ?auto_841934 ?auto_841935 ?auto_841936 ?auto_841937 ?auto_841938 )
      ( MAKE-16PILE ?auto_841927 ?auto_841928 ?auto_841929 ?auto_841930 ?auto_841931 ?auto_841932 ?auto_841933 ?auto_841934 ?auto_841935 ?auto_841936 ?auto_841937 ?auto_841938 ?auto_841939 ?auto_841940 ?auto_841941 ?auto_841942 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_841993 - BLOCK
      ?auto_841994 - BLOCK
      ?auto_841995 - BLOCK
      ?auto_841996 - BLOCK
      ?auto_841997 - BLOCK
      ?auto_841998 - BLOCK
      ?auto_841999 - BLOCK
      ?auto_842000 - BLOCK
      ?auto_842001 - BLOCK
      ?auto_842002 - BLOCK
      ?auto_842003 - BLOCK
      ?auto_842004 - BLOCK
      ?auto_842005 - BLOCK
      ?auto_842006 - BLOCK
      ?auto_842007 - BLOCK
      ?auto_842008 - BLOCK
    )
    :vars
    (
      ?auto_842009 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_842008 ?auto_842009 ) ( ON-TABLE ?auto_841993 ) ( ON ?auto_841994 ?auto_841993 ) ( ON ?auto_841995 ?auto_841994 ) ( ON ?auto_841996 ?auto_841995 ) ( ON ?auto_841997 ?auto_841996 ) ( ON ?auto_841998 ?auto_841997 ) ( ON ?auto_841999 ?auto_841998 ) ( ON ?auto_842000 ?auto_841999 ) ( ON ?auto_842001 ?auto_842000 ) ( ON ?auto_842002 ?auto_842001 ) ( not ( = ?auto_841993 ?auto_841994 ) ) ( not ( = ?auto_841993 ?auto_841995 ) ) ( not ( = ?auto_841993 ?auto_841996 ) ) ( not ( = ?auto_841993 ?auto_841997 ) ) ( not ( = ?auto_841993 ?auto_841998 ) ) ( not ( = ?auto_841993 ?auto_841999 ) ) ( not ( = ?auto_841993 ?auto_842000 ) ) ( not ( = ?auto_841993 ?auto_842001 ) ) ( not ( = ?auto_841993 ?auto_842002 ) ) ( not ( = ?auto_841993 ?auto_842003 ) ) ( not ( = ?auto_841993 ?auto_842004 ) ) ( not ( = ?auto_841993 ?auto_842005 ) ) ( not ( = ?auto_841993 ?auto_842006 ) ) ( not ( = ?auto_841993 ?auto_842007 ) ) ( not ( = ?auto_841993 ?auto_842008 ) ) ( not ( = ?auto_841993 ?auto_842009 ) ) ( not ( = ?auto_841994 ?auto_841995 ) ) ( not ( = ?auto_841994 ?auto_841996 ) ) ( not ( = ?auto_841994 ?auto_841997 ) ) ( not ( = ?auto_841994 ?auto_841998 ) ) ( not ( = ?auto_841994 ?auto_841999 ) ) ( not ( = ?auto_841994 ?auto_842000 ) ) ( not ( = ?auto_841994 ?auto_842001 ) ) ( not ( = ?auto_841994 ?auto_842002 ) ) ( not ( = ?auto_841994 ?auto_842003 ) ) ( not ( = ?auto_841994 ?auto_842004 ) ) ( not ( = ?auto_841994 ?auto_842005 ) ) ( not ( = ?auto_841994 ?auto_842006 ) ) ( not ( = ?auto_841994 ?auto_842007 ) ) ( not ( = ?auto_841994 ?auto_842008 ) ) ( not ( = ?auto_841994 ?auto_842009 ) ) ( not ( = ?auto_841995 ?auto_841996 ) ) ( not ( = ?auto_841995 ?auto_841997 ) ) ( not ( = ?auto_841995 ?auto_841998 ) ) ( not ( = ?auto_841995 ?auto_841999 ) ) ( not ( = ?auto_841995 ?auto_842000 ) ) ( not ( = ?auto_841995 ?auto_842001 ) ) ( not ( = ?auto_841995 ?auto_842002 ) ) ( not ( = ?auto_841995 ?auto_842003 ) ) ( not ( = ?auto_841995 ?auto_842004 ) ) ( not ( = ?auto_841995 ?auto_842005 ) ) ( not ( = ?auto_841995 ?auto_842006 ) ) ( not ( = ?auto_841995 ?auto_842007 ) ) ( not ( = ?auto_841995 ?auto_842008 ) ) ( not ( = ?auto_841995 ?auto_842009 ) ) ( not ( = ?auto_841996 ?auto_841997 ) ) ( not ( = ?auto_841996 ?auto_841998 ) ) ( not ( = ?auto_841996 ?auto_841999 ) ) ( not ( = ?auto_841996 ?auto_842000 ) ) ( not ( = ?auto_841996 ?auto_842001 ) ) ( not ( = ?auto_841996 ?auto_842002 ) ) ( not ( = ?auto_841996 ?auto_842003 ) ) ( not ( = ?auto_841996 ?auto_842004 ) ) ( not ( = ?auto_841996 ?auto_842005 ) ) ( not ( = ?auto_841996 ?auto_842006 ) ) ( not ( = ?auto_841996 ?auto_842007 ) ) ( not ( = ?auto_841996 ?auto_842008 ) ) ( not ( = ?auto_841996 ?auto_842009 ) ) ( not ( = ?auto_841997 ?auto_841998 ) ) ( not ( = ?auto_841997 ?auto_841999 ) ) ( not ( = ?auto_841997 ?auto_842000 ) ) ( not ( = ?auto_841997 ?auto_842001 ) ) ( not ( = ?auto_841997 ?auto_842002 ) ) ( not ( = ?auto_841997 ?auto_842003 ) ) ( not ( = ?auto_841997 ?auto_842004 ) ) ( not ( = ?auto_841997 ?auto_842005 ) ) ( not ( = ?auto_841997 ?auto_842006 ) ) ( not ( = ?auto_841997 ?auto_842007 ) ) ( not ( = ?auto_841997 ?auto_842008 ) ) ( not ( = ?auto_841997 ?auto_842009 ) ) ( not ( = ?auto_841998 ?auto_841999 ) ) ( not ( = ?auto_841998 ?auto_842000 ) ) ( not ( = ?auto_841998 ?auto_842001 ) ) ( not ( = ?auto_841998 ?auto_842002 ) ) ( not ( = ?auto_841998 ?auto_842003 ) ) ( not ( = ?auto_841998 ?auto_842004 ) ) ( not ( = ?auto_841998 ?auto_842005 ) ) ( not ( = ?auto_841998 ?auto_842006 ) ) ( not ( = ?auto_841998 ?auto_842007 ) ) ( not ( = ?auto_841998 ?auto_842008 ) ) ( not ( = ?auto_841998 ?auto_842009 ) ) ( not ( = ?auto_841999 ?auto_842000 ) ) ( not ( = ?auto_841999 ?auto_842001 ) ) ( not ( = ?auto_841999 ?auto_842002 ) ) ( not ( = ?auto_841999 ?auto_842003 ) ) ( not ( = ?auto_841999 ?auto_842004 ) ) ( not ( = ?auto_841999 ?auto_842005 ) ) ( not ( = ?auto_841999 ?auto_842006 ) ) ( not ( = ?auto_841999 ?auto_842007 ) ) ( not ( = ?auto_841999 ?auto_842008 ) ) ( not ( = ?auto_841999 ?auto_842009 ) ) ( not ( = ?auto_842000 ?auto_842001 ) ) ( not ( = ?auto_842000 ?auto_842002 ) ) ( not ( = ?auto_842000 ?auto_842003 ) ) ( not ( = ?auto_842000 ?auto_842004 ) ) ( not ( = ?auto_842000 ?auto_842005 ) ) ( not ( = ?auto_842000 ?auto_842006 ) ) ( not ( = ?auto_842000 ?auto_842007 ) ) ( not ( = ?auto_842000 ?auto_842008 ) ) ( not ( = ?auto_842000 ?auto_842009 ) ) ( not ( = ?auto_842001 ?auto_842002 ) ) ( not ( = ?auto_842001 ?auto_842003 ) ) ( not ( = ?auto_842001 ?auto_842004 ) ) ( not ( = ?auto_842001 ?auto_842005 ) ) ( not ( = ?auto_842001 ?auto_842006 ) ) ( not ( = ?auto_842001 ?auto_842007 ) ) ( not ( = ?auto_842001 ?auto_842008 ) ) ( not ( = ?auto_842001 ?auto_842009 ) ) ( not ( = ?auto_842002 ?auto_842003 ) ) ( not ( = ?auto_842002 ?auto_842004 ) ) ( not ( = ?auto_842002 ?auto_842005 ) ) ( not ( = ?auto_842002 ?auto_842006 ) ) ( not ( = ?auto_842002 ?auto_842007 ) ) ( not ( = ?auto_842002 ?auto_842008 ) ) ( not ( = ?auto_842002 ?auto_842009 ) ) ( not ( = ?auto_842003 ?auto_842004 ) ) ( not ( = ?auto_842003 ?auto_842005 ) ) ( not ( = ?auto_842003 ?auto_842006 ) ) ( not ( = ?auto_842003 ?auto_842007 ) ) ( not ( = ?auto_842003 ?auto_842008 ) ) ( not ( = ?auto_842003 ?auto_842009 ) ) ( not ( = ?auto_842004 ?auto_842005 ) ) ( not ( = ?auto_842004 ?auto_842006 ) ) ( not ( = ?auto_842004 ?auto_842007 ) ) ( not ( = ?auto_842004 ?auto_842008 ) ) ( not ( = ?auto_842004 ?auto_842009 ) ) ( not ( = ?auto_842005 ?auto_842006 ) ) ( not ( = ?auto_842005 ?auto_842007 ) ) ( not ( = ?auto_842005 ?auto_842008 ) ) ( not ( = ?auto_842005 ?auto_842009 ) ) ( not ( = ?auto_842006 ?auto_842007 ) ) ( not ( = ?auto_842006 ?auto_842008 ) ) ( not ( = ?auto_842006 ?auto_842009 ) ) ( not ( = ?auto_842007 ?auto_842008 ) ) ( not ( = ?auto_842007 ?auto_842009 ) ) ( not ( = ?auto_842008 ?auto_842009 ) ) ( ON ?auto_842007 ?auto_842008 ) ( ON ?auto_842006 ?auto_842007 ) ( ON ?auto_842005 ?auto_842006 ) ( ON ?auto_842004 ?auto_842005 ) ( CLEAR ?auto_842002 ) ( ON ?auto_842003 ?auto_842004 ) ( CLEAR ?auto_842003 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_841993 ?auto_841994 ?auto_841995 ?auto_841996 ?auto_841997 ?auto_841998 ?auto_841999 ?auto_842000 ?auto_842001 ?auto_842002 ?auto_842003 )
      ( MAKE-16PILE ?auto_841993 ?auto_841994 ?auto_841995 ?auto_841996 ?auto_841997 ?auto_841998 ?auto_841999 ?auto_842000 ?auto_842001 ?auto_842002 ?auto_842003 ?auto_842004 ?auto_842005 ?auto_842006 ?auto_842007 ?auto_842008 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_842059 - BLOCK
      ?auto_842060 - BLOCK
      ?auto_842061 - BLOCK
      ?auto_842062 - BLOCK
      ?auto_842063 - BLOCK
      ?auto_842064 - BLOCK
      ?auto_842065 - BLOCK
      ?auto_842066 - BLOCK
      ?auto_842067 - BLOCK
      ?auto_842068 - BLOCK
      ?auto_842069 - BLOCK
      ?auto_842070 - BLOCK
      ?auto_842071 - BLOCK
      ?auto_842072 - BLOCK
      ?auto_842073 - BLOCK
      ?auto_842074 - BLOCK
    )
    :vars
    (
      ?auto_842075 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_842074 ?auto_842075 ) ( ON-TABLE ?auto_842059 ) ( ON ?auto_842060 ?auto_842059 ) ( ON ?auto_842061 ?auto_842060 ) ( ON ?auto_842062 ?auto_842061 ) ( ON ?auto_842063 ?auto_842062 ) ( ON ?auto_842064 ?auto_842063 ) ( ON ?auto_842065 ?auto_842064 ) ( ON ?auto_842066 ?auto_842065 ) ( ON ?auto_842067 ?auto_842066 ) ( not ( = ?auto_842059 ?auto_842060 ) ) ( not ( = ?auto_842059 ?auto_842061 ) ) ( not ( = ?auto_842059 ?auto_842062 ) ) ( not ( = ?auto_842059 ?auto_842063 ) ) ( not ( = ?auto_842059 ?auto_842064 ) ) ( not ( = ?auto_842059 ?auto_842065 ) ) ( not ( = ?auto_842059 ?auto_842066 ) ) ( not ( = ?auto_842059 ?auto_842067 ) ) ( not ( = ?auto_842059 ?auto_842068 ) ) ( not ( = ?auto_842059 ?auto_842069 ) ) ( not ( = ?auto_842059 ?auto_842070 ) ) ( not ( = ?auto_842059 ?auto_842071 ) ) ( not ( = ?auto_842059 ?auto_842072 ) ) ( not ( = ?auto_842059 ?auto_842073 ) ) ( not ( = ?auto_842059 ?auto_842074 ) ) ( not ( = ?auto_842059 ?auto_842075 ) ) ( not ( = ?auto_842060 ?auto_842061 ) ) ( not ( = ?auto_842060 ?auto_842062 ) ) ( not ( = ?auto_842060 ?auto_842063 ) ) ( not ( = ?auto_842060 ?auto_842064 ) ) ( not ( = ?auto_842060 ?auto_842065 ) ) ( not ( = ?auto_842060 ?auto_842066 ) ) ( not ( = ?auto_842060 ?auto_842067 ) ) ( not ( = ?auto_842060 ?auto_842068 ) ) ( not ( = ?auto_842060 ?auto_842069 ) ) ( not ( = ?auto_842060 ?auto_842070 ) ) ( not ( = ?auto_842060 ?auto_842071 ) ) ( not ( = ?auto_842060 ?auto_842072 ) ) ( not ( = ?auto_842060 ?auto_842073 ) ) ( not ( = ?auto_842060 ?auto_842074 ) ) ( not ( = ?auto_842060 ?auto_842075 ) ) ( not ( = ?auto_842061 ?auto_842062 ) ) ( not ( = ?auto_842061 ?auto_842063 ) ) ( not ( = ?auto_842061 ?auto_842064 ) ) ( not ( = ?auto_842061 ?auto_842065 ) ) ( not ( = ?auto_842061 ?auto_842066 ) ) ( not ( = ?auto_842061 ?auto_842067 ) ) ( not ( = ?auto_842061 ?auto_842068 ) ) ( not ( = ?auto_842061 ?auto_842069 ) ) ( not ( = ?auto_842061 ?auto_842070 ) ) ( not ( = ?auto_842061 ?auto_842071 ) ) ( not ( = ?auto_842061 ?auto_842072 ) ) ( not ( = ?auto_842061 ?auto_842073 ) ) ( not ( = ?auto_842061 ?auto_842074 ) ) ( not ( = ?auto_842061 ?auto_842075 ) ) ( not ( = ?auto_842062 ?auto_842063 ) ) ( not ( = ?auto_842062 ?auto_842064 ) ) ( not ( = ?auto_842062 ?auto_842065 ) ) ( not ( = ?auto_842062 ?auto_842066 ) ) ( not ( = ?auto_842062 ?auto_842067 ) ) ( not ( = ?auto_842062 ?auto_842068 ) ) ( not ( = ?auto_842062 ?auto_842069 ) ) ( not ( = ?auto_842062 ?auto_842070 ) ) ( not ( = ?auto_842062 ?auto_842071 ) ) ( not ( = ?auto_842062 ?auto_842072 ) ) ( not ( = ?auto_842062 ?auto_842073 ) ) ( not ( = ?auto_842062 ?auto_842074 ) ) ( not ( = ?auto_842062 ?auto_842075 ) ) ( not ( = ?auto_842063 ?auto_842064 ) ) ( not ( = ?auto_842063 ?auto_842065 ) ) ( not ( = ?auto_842063 ?auto_842066 ) ) ( not ( = ?auto_842063 ?auto_842067 ) ) ( not ( = ?auto_842063 ?auto_842068 ) ) ( not ( = ?auto_842063 ?auto_842069 ) ) ( not ( = ?auto_842063 ?auto_842070 ) ) ( not ( = ?auto_842063 ?auto_842071 ) ) ( not ( = ?auto_842063 ?auto_842072 ) ) ( not ( = ?auto_842063 ?auto_842073 ) ) ( not ( = ?auto_842063 ?auto_842074 ) ) ( not ( = ?auto_842063 ?auto_842075 ) ) ( not ( = ?auto_842064 ?auto_842065 ) ) ( not ( = ?auto_842064 ?auto_842066 ) ) ( not ( = ?auto_842064 ?auto_842067 ) ) ( not ( = ?auto_842064 ?auto_842068 ) ) ( not ( = ?auto_842064 ?auto_842069 ) ) ( not ( = ?auto_842064 ?auto_842070 ) ) ( not ( = ?auto_842064 ?auto_842071 ) ) ( not ( = ?auto_842064 ?auto_842072 ) ) ( not ( = ?auto_842064 ?auto_842073 ) ) ( not ( = ?auto_842064 ?auto_842074 ) ) ( not ( = ?auto_842064 ?auto_842075 ) ) ( not ( = ?auto_842065 ?auto_842066 ) ) ( not ( = ?auto_842065 ?auto_842067 ) ) ( not ( = ?auto_842065 ?auto_842068 ) ) ( not ( = ?auto_842065 ?auto_842069 ) ) ( not ( = ?auto_842065 ?auto_842070 ) ) ( not ( = ?auto_842065 ?auto_842071 ) ) ( not ( = ?auto_842065 ?auto_842072 ) ) ( not ( = ?auto_842065 ?auto_842073 ) ) ( not ( = ?auto_842065 ?auto_842074 ) ) ( not ( = ?auto_842065 ?auto_842075 ) ) ( not ( = ?auto_842066 ?auto_842067 ) ) ( not ( = ?auto_842066 ?auto_842068 ) ) ( not ( = ?auto_842066 ?auto_842069 ) ) ( not ( = ?auto_842066 ?auto_842070 ) ) ( not ( = ?auto_842066 ?auto_842071 ) ) ( not ( = ?auto_842066 ?auto_842072 ) ) ( not ( = ?auto_842066 ?auto_842073 ) ) ( not ( = ?auto_842066 ?auto_842074 ) ) ( not ( = ?auto_842066 ?auto_842075 ) ) ( not ( = ?auto_842067 ?auto_842068 ) ) ( not ( = ?auto_842067 ?auto_842069 ) ) ( not ( = ?auto_842067 ?auto_842070 ) ) ( not ( = ?auto_842067 ?auto_842071 ) ) ( not ( = ?auto_842067 ?auto_842072 ) ) ( not ( = ?auto_842067 ?auto_842073 ) ) ( not ( = ?auto_842067 ?auto_842074 ) ) ( not ( = ?auto_842067 ?auto_842075 ) ) ( not ( = ?auto_842068 ?auto_842069 ) ) ( not ( = ?auto_842068 ?auto_842070 ) ) ( not ( = ?auto_842068 ?auto_842071 ) ) ( not ( = ?auto_842068 ?auto_842072 ) ) ( not ( = ?auto_842068 ?auto_842073 ) ) ( not ( = ?auto_842068 ?auto_842074 ) ) ( not ( = ?auto_842068 ?auto_842075 ) ) ( not ( = ?auto_842069 ?auto_842070 ) ) ( not ( = ?auto_842069 ?auto_842071 ) ) ( not ( = ?auto_842069 ?auto_842072 ) ) ( not ( = ?auto_842069 ?auto_842073 ) ) ( not ( = ?auto_842069 ?auto_842074 ) ) ( not ( = ?auto_842069 ?auto_842075 ) ) ( not ( = ?auto_842070 ?auto_842071 ) ) ( not ( = ?auto_842070 ?auto_842072 ) ) ( not ( = ?auto_842070 ?auto_842073 ) ) ( not ( = ?auto_842070 ?auto_842074 ) ) ( not ( = ?auto_842070 ?auto_842075 ) ) ( not ( = ?auto_842071 ?auto_842072 ) ) ( not ( = ?auto_842071 ?auto_842073 ) ) ( not ( = ?auto_842071 ?auto_842074 ) ) ( not ( = ?auto_842071 ?auto_842075 ) ) ( not ( = ?auto_842072 ?auto_842073 ) ) ( not ( = ?auto_842072 ?auto_842074 ) ) ( not ( = ?auto_842072 ?auto_842075 ) ) ( not ( = ?auto_842073 ?auto_842074 ) ) ( not ( = ?auto_842073 ?auto_842075 ) ) ( not ( = ?auto_842074 ?auto_842075 ) ) ( ON ?auto_842073 ?auto_842074 ) ( ON ?auto_842072 ?auto_842073 ) ( ON ?auto_842071 ?auto_842072 ) ( ON ?auto_842070 ?auto_842071 ) ( ON ?auto_842069 ?auto_842070 ) ( CLEAR ?auto_842067 ) ( ON ?auto_842068 ?auto_842069 ) ( CLEAR ?auto_842068 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_842059 ?auto_842060 ?auto_842061 ?auto_842062 ?auto_842063 ?auto_842064 ?auto_842065 ?auto_842066 ?auto_842067 ?auto_842068 )
      ( MAKE-16PILE ?auto_842059 ?auto_842060 ?auto_842061 ?auto_842062 ?auto_842063 ?auto_842064 ?auto_842065 ?auto_842066 ?auto_842067 ?auto_842068 ?auto_842069 ?auto_842070 ?auto_842071 ?auto_842072 ?auto_842073 ?auto_842074 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_842125 - BLOCK
      ?auto_842126 - BLOCK
      ?auto_842127 - BLOCK
      ?auto_842128 - BLOCK
      ?auto_842129 - BLOCK
      ?auto_842130 - BLOCK
      ?auto_842131 - BLOCK
      ?auto_842132 - BLOCK
      ?auto_842133 - BLOCK
      ?auto_842134 - BLOCK
      ?auto_842135 - BLOCK
      ?auto_842136 - BLOCK
      ?auto_842137 - BLOCK
      ?auto_842138 - BLOCK
      ?auto_842139 - BLOCK
      ?auto_842140 - BLOCK
    )
    :vars
    (
      ?auto_842141 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_842140 ?auto_842141 ) ( ON-TABLE ?auto_842125 ) ( ON ?auto_842126 ?auto_842125 ) ( ON ?auto_842127 ?auto_842126 ) ( ON ?auto_842128 ?auto_842127 ) ( ON ?auto_842129 ?auto_842128 ) ( ON ?auto_842130 ?auto_842129 ) ( ON ?auto_842131 ?auto_842130 ) ( ON ?auto_842132 ?auto_842131 ) ( not ( = ?auto_842125 ?auto_842126 ) ) ( not ( = ?auto_842125 ?auto_842127 ) ) ( not ( = ?auto_842125 ?auto_842128 ) ) ( not ( = ?auto_842125 ?auto_842129 ) ) ( not ( = ?auto_842125 ?auto_842130 ) ) ( not ( = ?auto_842125 ?auto_842131 ) ) ( not ( = ?auto_842125 ?auto_842132 ) ) ( not ( = ?auto_842125 ?auto_842133 ) ) ( not ( = ?auto_842125 ?auto_842134 ) ) ( not ( = ?auto_842125 ?auto_842135 ) ) ( not ( = ?auto_842125 ?auto_842136 ) ) ( not ( = ?auto_842125 ?auto_842137 ) ) ( not ( = ?auto_842125 ?auto_842138 ) ) ( not ( = ?auto_842125 ?auto_842139 ) ) ( not ( = ?auto_842125 ?auto_842140 ) ) ( not ( = ?auto_842125 ?auto_842141 ) ) ( not ( = ?auto_842126 ?auto_842127 ) ) ( not ( = ?auto_842126 ?auto_842128 ) ) ( not ( = ?auto_842126 ?auto_842129 ) ) ( not ( = ?auto_842126 ?auto_842130 ) ) ( not ( = ?auto_842126 ?auto_842131 ) ) ( not ( = ?auto_842126 ?auto_842132 ) ) ( not ( = ?auto_842126 ?auto_842133 ) ) ( not ( = ?auto_842126 ?auto_842134 ) ) ( not ( = ?auto_842126 ?auto_842135 ) ) ( not ( = ?auto_842126 ?auto_842136 ) ) ( not ( = ?auto_842126 ?auto_842137 ) ) ( not ( = ?auto_842126 ?auto_842138 ) ) ( not ( = ?auto_842126 ?auto_842139 ) ) ( not ( = ?auto_842126 ?auto_842140 ) ) ( not ( = ?auto_842126 ?auto_842141 ) ) ( not ( = ?auto_842127 ?auto_842128 ) ) ( not ( = ?auto_842127 ?auto_842129 ) ) ( not ( = ?auto_842127 ?auto_842130 ) ) ( not ( = ?auto_842127 ?auto_842131 ) ) ( not ( = ?auto_842127 ?auto_842132 ) ) ( not ( = ?auto_842127 ?auto_842133 ) ) ( not ( = ?auto_842127 ?auto_842134 ) ) ( not ( = ?auto_842127 ?auto_842135 ) ) ( not ( = ?auto_842127 ?auto_842136 ) ) ( not ( = ?auto_842127 ?auto_842137 ) ) ( not ( = ?auto_842127 ?auto_842138 ) ) ( not ( = ?auto_842127 ?auto_842139 ) ) ( not ( = ?auto_842127 ?auto_842140 ) ) ( not ( = ?auto_842127 ?auto_842141 ) ) ( not ( = ?auto_842128 ?auto_842129 ) ) ( not ( = ?auto_842128 ?auto_842130 ) ) ( not ( = ?auto_842128 ?auto_842131 ) ) ( not ( = ?auto_842128 ?auto_842132 ) ) ( not ( = ?auto_842128 ?auto_842133 ) ) ( not ( = ?auto_842128 ?auto_842134 ) ) ( not ( = ?auto_842128 ?auto_842135 ) ) ( not ( = ?auto_842128 ?auto_842136 ) ) ( not ( = ?auto_842128 ?auto_842137 ) ) ( not ( = ?auto_842128 ?auto_842138 ) ) ( not ( = ?auto_842128 ?auto_842139 ) ) ( not ( = ?auto_842128 ?auto_842140 ) ) ( not ( = ?auto_842128 ?auto_842141 ) ) ( not ( = ?auto_842129 ?auto_842130 ) ) ( not ( = ?auto_842129 ?auto_842131 ) ) ( not ( = ?auto_842129 ?auto_842132 ) ) ( not ( = ?auto_842129 ?auto_842133 ) ) ( not ( = ?auto_842129 ?auto_842134 ) ) ( not ( = ?auto_842129 ?auto_842135 ) ) ( not ( = ?auto_842129 ?auto_842136 ) ) ( not ( = ?auto_842129 ?auto_842137 ) ) ( not ( = ?auto_842129 ?auto_842138 ) ) ( not ( = ?auto_842129 ?auto_842139 ) ) ( not ( = ?auto_842129 ?auto_842140 ) ) ( not ( = ?auto_842129 ?auto_842141 ) ) ( not ( = ?auto_842130 ?auto_842131 ) ) ( not ( = ?auto_842130 ?auto_842132 ) ) ( not ( = ?auto_842130 ?auto_842133 ) ) ( not ( = ?auto_842130 ?auto_842134 ) ) ( not ( = ?auto_842130 ?auto_842135 ) ) ( not ( = ?auto_842130 ?auto_842136 ) ) ( not ( = ?auto_842130 ?auto_842137 ) ) ( not ( = ?auto_842130 ?auto_842138 ) ) ( not ( = ?auto_842130 ?auto_842139 ) ) ( not ( = ?auto_842130 ?auto_842140 ) ) ( not ( = ?auto_842130 ?auto_842141 ) ) ( not ( = ?auto_842131 ?auto_842132 ) ) ( not ( = ?auto_842131 ?auto_842133 ) ) ( not ( = ?auto_842131 ?auto_842134 ) ) ( not ( = ?auto_842131 ?auto_842135 ) ) ( not ( = ?auto_842131 ?auto_842136 ) ) ( not ( = ?auto_842131 ?auto_842137 ) ) ( not ( = ?auto_842131 ?auto_842138 ) ) ( not ( = ?auto_842131 ?auto_842139 ) ) ( not ( = ?auto_842131 ?auto_842140 ) ) ( not ( = ?auto_842131 ?auto_842141 ) ) ( not ( = ?auto_842132 ?auto_842133 ) ) ( not ( = ?auto_842132 ?auto_842134 ) ) ( not ( = ?auto_842132 ?auto_842135 ) ) ( not ( = ?auto_842132 ?auto_842136 ) ) ( not ( = ?auto_842132 ?auto_842137 ) ) ( not ( = ?auto_842132 ?auto_842138 ) ) ( not ( = ?auto_842132 ?auto_842139 ) ) ( not ( = ?auto_842132 ?auto_842140 ) ) ( not ( = ?auto_842132 ?auto_842141 ) ) ( not ( = ?auto_842133 ?auto_842134 ) ) ( not ( = ?auto_842133 ?auto_842135 ) ) ( not ( = ?auto_842133 ?auto_842136 ) ) ( not ( = ?auto_842133 ?auto_842137 ) ) ( not ( = ?auto_842133 ?auto_842138 ) ) ( not ( = ?auto_842133 ?auto_842139 ) ) ( not ( = ?auto_842133 ?auto_842140 ) ) ( not ( = ?auto_842133 ?auto_842141 ) ) ( not ( = ?auto_842134 ?auto_842135 ) ) ( not ( = ?auto_842134 ?auto_842136 ) ) ( not ( = ?auto_842134 ?auto_842137 ) ) ( not ( = ?auto_842134 ?auto_842138 ) ) ( not ( = ?auto_842134 ?auto_842139 ) ) ( not ( = ?auto_842134 ?auto_842140 ) ) ( not ( = ?auto_842134 ?auto_842141 ) ) ( not ( = ?auto_842135 ?auto_842136 ) ) ( not ( = ?auto_842135 ?auto_842137 ) ) ( not ( = ?auto_842135 ?auto_842138 ) ) ( not ( = ?auto_842135 ?auto_842139 ) ) ( not ( = ?auto_842135 ?auto_842140 ) ) ( not ( = ?auto_842135 ?auto_842141 ) ) ( not ( = ?auto_842136 ?auto_842137 ) ) ( not ( = ?auto_842136 ?auto_842138 ) ) ( not ( = ?auto_842136 ?auto_842139 ) ) ( not ( = ?auto_842136 ?auto_842140 ) ) ( not ( = ?auto_842136 ?auto_842141 ) ) ( not ( = ?auto_842137 ?auto_842138 ) ) ( not ( = ?auto_842137 ?auto_842139 ) ) ( not ( = ?auto_842137 ?auto_842140 ) ) ( not ( = ?auto_842137 ?auto_842141 ) ) ( not ( = ?auto_842138 ?auto_842139 ) ) ( not ( = ?auto_842138 ?auto_842140 ) ) ( not ( = ?auto_842138 ?auto_842141 ) ) ( not ( = ?auto_842139 ?auto_842140 ) ) ( not ( = ?auto_842139 ?auto_842141 ) ) ( not ( = ?auto_842140 ?auto_842141 ) ) ( ON ?auto_842139 ?auto_842140 ) ( ON ?auto_842138 ?auto_842139 ) ( ON ?auto_842137 ?auto_842138 ) ( ON ?auto_842136 ?auto_842137 ) ( ON ?auto_842135 ?auto_842136 ) ( ON ?auto_842134 ?auto_842135 ) ( CLEAR ?auto_842132 ) ( ON ?auto_842133 ?auto_842134 ) ( CLEAR ?auto_842133 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_842125 ?auto_842126 ?auto_842127 ?auto_842128 ?auto_842129 ?auto_842130 ?auto_842131 ?auto_842132 ?auto_842133 )
      ( MAKE-16PILE ?auto_842125 ?auto_842126 ?auto_842127 ?auto_842128 ?auto_842129 ?auto_842130 ?auto_842131 ?auto_842132 ?auto_842133 ?auto_842134 ?auto_842135 ?auto_842136 ?auto_842137 ?auto_842138 ?auto_842139 ?auto_842140 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_842191 - BLOCK
      ?auto_842192 - BLOCK
      ?auto_842193 - BLOCK
      ?auto_842194 - BLOCK
      ?auto_842195 - BLOCK
      ?auto_842196 - BLOCK
      ?auto_842197 - BLOCK
      ?auto_842198 - BLOCK
      ?auto_842199 - BLOCK
      ?auto_842200 - BLOCK
      ?auto_842201 - BLOCK
      ?auto_842202 - BLOCK
      ?auto_842203 - BLOCK
      ?auto_842204 - BLOCK
      ?auto_842205 - BLOCK
      ?auto_842206 - BLOCK
    )
    :vars
    (
      ?auto_842207 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_842206 ?auto_842207 ) ( ON-TABLE ?auto_842191 ) ( ON ?auto_842192 ?auto_842191 ) ( ON ?auto_842193 ?auto_842192 ) ( ON ?auto_842194 ?auto_842193 ) ( ON ?auto_842195 ?auto_842194 ) ( ON ?auto_842196 ?auto_842195 ) ( ON ?auto_842197 ?auto_842196 ) ( not ( = ?auto_842191 ?auto_842192 ) ) ( not ( = ?auto_842191 ?auto_842193 ) ) ( not ( = ?auto_842191 ?auto_842194 ) ) ( not ( = ?auto_842191 ?auto_842195 ) ) ( not ( = ?auto_842191 ?auto_842196 ) ) ( not ( = ?auto_842191 ?auto_842197 ) ) ( not ( = ?auto_842191 ?auto_842198 ) ) ( not ( = ?auto_842191 ?auto_842199 ) ) ( not ( = ?auto_842191 ?auto_842200 ) ) ( not ( = ?auto_842191 ?auto_842201 ) ) ( not ( = ?auto_842191 ?auto_842202 ) ) ( not ( = ?auto_842191 ?auto_842203 ) ) ( not ( = ?auto_842191 ?auto_842204 ) ) ( not ( = ?auto_842191 ?auto_842205 ) ) ( not ( = ?auto_842191 ?auto_842206 ) ) ( not ( = ?auto_842191 ?auto_842207 ) ) ( not ( = ?auto_842192 ?auto_842193 ) ) ( not ( = ?auto_842192 ?auto_842194 ) ) ( not ( = ?auto_842192 ?auto_842195 ) ) ( not ( = ?auto_842192 ?auto_842196 ) ) ( not ( = ?auto_842192 ?auto_842197 ) ) ( not ( = ?auto_842192 ?auto_842198 ) ) ( not ( = ?auto_842192 ?auto_842199 ) ) ( not ( = ?auto_842192 ?auto_842200 ) ) ( not ( = ?auto_842192 ?auto_842201 ) ) ( not ( = ?auto_842192 ?auto_842202 ) ) ( not ( = ?auto_842192 ?auto_842203 ) ) ( not ( = ?auto_842192 ?auto_842204 ) ) ( not ( = ?auto_842192 ?auto_842205 ) ) ( not ( = ?auto_842192 ?auto_842206 ) ) ( not ( = ?auto_842192 ?auto_842207 ) ) ( not ( = ?auto_842193 ?auto_842194 ) ) ( not ( = ?auto_842193 ?auto_842195 ) ) ( not ( = ?auto_842193 ?auto_842196 ) ) ( not ( = ?auto_842193 ?auto_842197 ) ) ( not ( = ?auto_842193 ?auto_842198 ) ) ( not ( = ?auto_842193 ?auto_842199 ) ) ( not ( = ?auto_842193 ?auto_842200 ) ) ( not ( = ?auto_842193 ?auto_842201 ) ) ( not ( = ?auto_842193 ?auto_842202 ) ) ( not ( = ?auto_842193 ?auto_842203 ) ) ( not ( = ?auto_842193 ?auto_842204 ) ) ( not ( = ?auto_842193 ?auto_842205 ) ) ( not ( = ?auto_842193 ?auto_842206 ) ) ( not ( = ?auto_842193 ?auto_842207 ) ) ( not ( = ?auto_842194 ?auto_842195 ) ) ( not ( = ?auto_842194 ?auto_842196 ) ) ( not ( = ?auto_842194 ?auto_842197 ) ) ( not ( = ?auto_842194 ?auto_842198 ) ) ( not ( = ?auto_842194 ?auto_842199 ) ) ( not ( = ?auto_842194 ?auto_842200 ) ) ( not ( = ?auto_842194 ?auto_842201 ) ) ( not ( = ?auto_842194 ?auto_842202 ) ) ( not ( = ?auto_842194 ?auto_842203 ) ) ( not ( = ?auto_842194 ?auto_842204 ) ) ( not ( = ?auto_842194 ?auto_842205 ) ) ( not ( = ?auto_842194 ?auto_842206 ) ) ( not ( = ?auto_842194 ?auto_842207 ) ) ( not ( = ?auto_842195 ?auto_842196 ) ) ( not ( = ?auto_842195 ?auto_842197 ) ) ( not ( = ?auto_842195 ?auto_842198 ) ) ( not ( = ?auto_842195 ?auto_842199 ) ) ( not ( = ?auto_842195 ?auto_842200 ) ) ( not ( = ?auto_842195 ?auto_842201 ) ) ( not ( = ?auto_842195 ?auto_842202 ) ) ( not ( = ?auto_842195 ?auto_842203 ) ) ( not ( = ?auto_842195 ?auto_842204 ) ) ( not ( = ?auto_842195 ?auto_842205 ) ) ( not ( = ?auto_842195 ?auto_842206 ) ) ( not ( = ?auto_842195 ?auto_842207 ) ) ( not ( = ?auto_842196 ?auto_842197 ) ) ( not ( = ?auto_842196 ?auto_842198 ) ) ( not ( = ?auto_842196 ?auto_842199 ) ) ( not ( = ?auto_842196 ?auto_842200 ) ) ( not ( = ?auto_842196 ?auto_842201 ) ) ( not ( = ?auto_842196 ?auto_842202 ) ) ( not ( = ?auto_842196 ?auto_842203 ) ) ( not ( = ?auto_842196 ?auto_842204 ) ) ( not ( = ?auto_842196 ?auto_842205 ) ) ( not ( = ?auto_842196 ?auto_842206 ) ) ( not ( = ?auto_842196 ?auto_842207 ) ) ( not ( = ?auto_842197 ?auto_842198 ) ) ( not ( = ?auto_842197 ?auto_842199 ) ) ( not ( = ?auto_842197 ?auto_842200 ) ) ( not ( = ?auto_842197 ?auto_842201 ) ) ( not ( = ?auto_842197 ?auto_842202 ) ) ( not ( = ?auto_842197 ?auto_842203 ) ) ( not ( = ?auto_842197 ?auto_842204 ) ) ( not ( = ?auto_842197 ?auto_842205 ) ) ( not ( = ?auto_842197 ?auto_842206 ) ) ( not ( = ?auto_842197 ?auto_842207 ) ) ( not ( = ?auto_842198 ?auto_842199 ) ) ( not ( = ?auto_842198 ?auto_842200 ) ) ( not ( = ?auto_842198 ?auto_842201 ) ) ( not ( = ?auto_842198 ?auto_842202 ) ) ( not ( = ?auto_842198 ?auto_842203 ) ) ( not ( = ?auto_842198 ?auto_842204 ) ) ( not ( = ?auto_842198 ?auto_842205 ) ) ( not ( = ?auto_842198 ?auto_842206 ) ) ( not ( = ?auto_842198 ?auto_842207 ) ) ( not ( = ?auto_842199 ?auto_842200 ) ) ( not ( = ?auto_842199 ?auto_842201 ) ) ( not ( = ?auto_842199 ?auto_842202 ) ) ( not ( = ?auto_842199 ?auto_842203 ) ) ( not ( = ?auto_842199 ?auto_842204 ) ) ( not ( = ?auto_842199 ?auto_842205 ) ) ( not ( = ?auto_842199 ?auto_842206 ) ) ( not ( = ?auto_842199 ?auto_842207 ) ) ( not ( = ?auto_842200 ?auto_842201 ) ) ( not ( = ?auto_842200 ?auto_842202 ) ) ( not ( = ?auto_842200 ?auto_842203 ) ) ( not ( = ?auto_842200 ?auto_842204 ) ) ( not ( = ?auto_842200 ?auto_842205 ) ) ( not ( = ?auto_842200 ?auto_842206 ) ) ( not ( = ?auto_842200 ?auto_842207 ) ) ( not ( = ?auto_842201 ?auto_842202 ) ) ( not ( = ?auto_842201 ?auto_842203 ) ) ( not ( = ?auto_842201 ?auto_842204 ) ) ( not ( = ?auto_842201 ?auto_842205 ) ) ( not ( = ?auto_842201 ?auto_842206 ) ) ( not ( = ?auto_842201 ?auto_842207 ) ) ( not ( = ?auto_842202 ?auto_842203 ) ) ( not ( = ?auto_842202 ?auto_842204 ) ) ( not ( = ?auto_842202 ?auto_842205 ) ) ( not ( = ?auto_842202 ?auto_842206 ) ) ( not ( = ?auto_842202 ?auto_842207 ) ) ( not ( = ?auto_842203 ?auto_842204 ) ) ( not ( = ?auto_842203 ?auto_842205 ) ) ( not ( = ?auto_842203 ?auto_842206 ) ) ( not ( = ?auto_842203 ?auto_842207 ) ) ( not ( = ?auto_842204 ?auto_842205 ) ) ( not ( = ?auto_842204 ?auto_842206 ) ) ( not ( = ?auto_842204 ?auto_842207 ) ) ( not ( = ?auto_842205 ?auto_842206 ) ) ( not ( = ?auto_842205 ?auto_842207 ) ) ( not ( = ?auto_842206 ?auto_842207 ) ) ( ON ?auto_842205 ?auto_842206 ) ( ON ?auto_842204 ?auto_842205 ) ( ON ?auto_842203 ?auto_842204 ) ( ON ?auto_842202 ?auto_842203 ) ( ON ?auto_842201 ?auto_842202 ) ( ON ?auto_842200 ?auto_842201 ) ( ON ?auto_842199 ?auto_842200 ) ( CLEAR ?auto_842197 ) ( ON ?auto_842198 ?auto_842199 ) ( CLEAR ?auto_842198 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_842191 ?auto_842192 ?auto_842193 ?auto_842194 ?auto_842195 ?auto_842196 ?auto_842197 ?auto_842198 )
      ( MAKE-16PILE ?auto_842191 ?auto_842192 ?auto_842193 ?auto_842194 ?auto_842195 ?auto_842196 ?auto_842197 ?auto_842198 ?auto_842199 ?auto_842200 ?auto_842201 ?auto_842202 ?auto_842203 ?auto_842204 ?auto_842205 ?auto_842206 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_842257 - BLOCK
      ?auto_842258 - BLOCK
      ?auto_842259 - BLOCK
      ?auto_842260 - BLOCK
      ?auto_842261 - BLOCK
      ?auto_842262 - BLOCK
      ?auto_842263 - BLOCK
      ?auto_842264 - BLOCK
      ?auto_842265 - BLOCK
      ?auto_842266 - BLOCK
      ?auto_842267 - BLOCK
      ?auto_842268 - BLOCK
      ?auto_842269 - BLOCK
      ?auto_842270 - BLOCK
      ?auto_842271 - BLOCK
      ?auto_842272 - BLOCK
    )
    :vars
    (
      ?auto_842273 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_842272 ?auto_842273 ) ( ON-TABLE ?auto_842257 ) ( ON ?auto_842258 ?auto_842257 ) ( ON ?auto_842259 ?auto_842258 ) ( ON ?auto_842260 ?auto_842259 ) ( ON ?auto_842261 ?auto_842260 ) ( ON ?auto_842262 ?auto_842261 ) ( not ( = ?auto_842257 ?auto_842258 ) ) ( not ( = ?auto_842257 ?auto_842259 ) ) ( not ( = ?auto_842257 ?auto_842260 ) ) ( not ( = ?auto_842257 ?auto_842261 ) ) ( not ( = ?auto_842257 ?auto_842262 ) ) ( not ( = ?auto_842257 ?auto_842263 ) ) ( not ( = ?auto_842257 ?auto_842264 ) ) ( not ( = ?auto_842257 ?auto_842265 ) ) ( not ( = ?auto_842257 ?auto_842266 ) ) ( not ( = ?auto_842257 ?auto_842267 ) ) ( not ( = ?auto_842257 ?auto_842268 ) ) ( not ( = ?auto_842257 ?auto_842269 ) ) ( not ( = ?auto_842257 ?auto_842270 ) ) ( not ( = ?auto_842257 ?auto_842271 ) ) ( not ( = ?auto_842257 ?auto_842272 ) ) ( not ( = ?auto_842257 ?auto_842273 ) ) ( not ( = ?auto_842258 ?auto_842259 ) ) ( not ( = ?auto_842258 ?auto_842260 ) ) ( not ( = ?auto_842258 ?auto_842261 ) ) ( not ( = ?auto_842258 ?auto_842262 ) ) ( not ( = ?auto_842258 ?auto_842263 ) ) ( not ( = ?auto_842258 ?auto_842264 ) ) ( not ( = ?auto_842258 ?auto_842265 ) ) ( not ( = ?auto_842258 ?auto_842266 ) ) ( not ( = ?auto_842258 ?auto_842267 ) ) ( not ( = ?auto_842258 ?auto_842268 ) ) ( not ( = ?auto_842258 ?auto_842269 ) ) ( not ( = ?auto_842258 ?auto_842270 ) ) ( not ( = ?auto_842258 ?auto_842271 ) ) ( not ( = ?auto_842258 ?auto_842272 ) ) ( not ( = ?auto_842258 ?auto_842273 ) ) ( not ( = ?auto_842259 ?auto_842260 ) ) ( not ( = ?auto_842259 ?auto_842261 ) ) ( not ( = ?auto_842259 ?auto_842262 ) ) ( not ( = ?auto_842259 ?auto_842263 ) ) ( not ( = ?auto_842259 ?auto_842264 ) ) ( not ( = ?auto_842259 ?auto_842265 ) ) ( not ( = ?auto_842259 ?auto_842266 ) ) ( not ( = ?auto_842259 ?auto_842267 ) ) ( not ( = ?auto_842259 ?auto_842268 ) ) ( not ( = ?auto_842259 ?auto_842269 ) ) ( not ( = ?auto_842259 ?auto_842270 ) ) ( not ( = ?auto_842259 ?auto_842271 ) ) ( not ( = ?auto_842259 ?auto_842272 ) ) ( not ( = ?auto_842259 ?auto_842273 ) ) ( not ( = ?auto_842260 ?auto_842261 ) ) ( not ( = ?auto_842260 ?auto_842262 ) ) ( not ( = ?auto_842260 ?auto_842263 ) ) ( not ( = ?auto_842260 ?auto_842264 ) ) ( not ( = ?auto_842260 ?auto_842265 ) ) ( not ( = ?auto_842260 ?auto_842266 ) ) ( not ( = ?auto_842260 ?auto_842267 ) ) ( not ( = ?auto_842260 ?auto_842268 ) ) ( not ( = ?auto_842260 ?auto_842269 ) ) ( not ( = ?auto_842260 ?auto_842270 ) ) ( not ( = ?auto_842260 ?auto_842271 ) ) ( not ( = ?auto_842260 ?auto_842272 ) ) ( not ( = ?auto_842260 ?auto_842273 ) ) ( not ( = ?auto_842261 ?auto_842262 ) ) ( not ( = ?auto_842261 ?auto_842263 ) ) ( not ( = ?auto_842261 ?auto_842264 ) ) ( not ( = ?auto_842261 ?auto_842265 ) ) ( not ( = ?auto_842261 ?auto_842266 ) ) ( not ( = ?auto_842261 ?auto_842267 ) ) ( not ( = ?auto_842261 ?auto_842268 ) ) ( not ( = ?auto_842261 ?auto_842269 ) ) ( not ( = ?auto_842261 ?auto_842270 ) ) ( not ( = ?auto_842261 ?auto_842271 ) ) ( not ( = ?auto_842261 ?auto_842272 ) ) ( not ( = ?auto_842261 ?auto_842273 ) ) ( not ( = ?auto_842262 ?auto_842263 ) ) ( not ( = ?auto_842262 ?auto_842264 ) ) ( not ( = ?auto_842262 ?auto_842265 ) ) ( not ( = ?auto_842262 ?auto_842266 ) ) ( not ( = ?auto_842262 ?auto_842267 ) ) ( not ( = ?auto_842262 ?auto_842268 ) ) ( not ( = ?auto_842262 ?auto_842269 ) ) ( not ( = ?auto_842262 ?auto_842270 ) ) ( not ( = ?auto_842262 ?auto_842271 ) ) ( not ( = ?auto_842262 ?auto_842272 ) ) ( not ( = ?auto_842262 ?auto_842273 ) ) ( not ( = ?auto_842263 ?auto_842264 ) ) ( not ( = ?auto_842263 ?auto_842265 ) ) ( not ( = ?auto_842263 ?auto_842266 ) ) ( not ( = ?auto_842263 ?auto_842267 ) ) ( not ( = ?auto_842263 ?auto_842268 ) ) ( not ( = ?auto_842263 ?auto_842269 ) ) ( not ( = ?auto_842263 ?auto_842270 ) ) ( not ( = ?auto_842263 ?auto_842271 ) ) ( not ( = ?auto_842263 ?auto_842272 ) ) ( not ( = ?auto_842263 ?auto_842273 ) ) ( not ( = ?auto_842264 ?auto_842265 ) ) ( not ( = ?auto_842264 ?auto_842266 ) ) ( not ( = ?auto_842264 ?auto_842267 ) ) ( not ( = ?auto_842264 ?auto_842268 ) ) ( not ( = ?auto_842264 ?auto_842269 ) ) ( not ( = ?auto_842264 ?auto_842270 ) ) ( not ( = ?auto_842264 ?auto_842271 ) ) ( not ( = ?auto_842264 ?auto_842272 ) ) ( not ( = ?auto_842264 ?auto_842273 ) ) ( not ( = ?auto_842265 ?auto_842266 ) ) ( not ( = ?auto_842265 ?auto_842267 ) ) ( not ( = ?auto_842265 ?auto_842268 ) ) ( not ( = ?auto_842265 ?auto_842269 ) ) ( not ( = ?auto_842265 ?auto_842270 ) ) ( not ( = ?auto_842265 ?auto_842271 ) ) ( not ( = ?auto_842265 ?auto_842272 ) ) ( not ( = ?auto_842265 ?auto_842273 ) ) ( not ( = ?auto_842266 ?auto_842267 ) ) ( not ( = ?auto_842266 ?auto_842268 ) ) ( not ( = ?auto_842266 ?auto_842269 ) ) ( not ( = ?auto_842266 ?auto_842270 ) ) ( not ( = ?auto_842266 ?auto_842271 ) ) ( not ( = ?auto_842266 ?auto_842272 ) ) ( not ( = ?auto_842266 ?auto_842273 ) ) ( not ( = ?auto_842267 ?auto_842268 ) ) ( not ( = ?auto_842267 ?auto_842269 ) ) ( not ( = ?auto_842267 ?auto_842270 ) ) ( not ( = ?auto_842267 ?auto_842271 ) ) ( not ( = ?auto_842267 ?auto_842272 ) ) ( not ( = ?auto_842267 ?auto_842273 ) ) ( not ( = ?auto_842268 ?auto_842269 ) ) ( not ( = ?auto_842268 ?auto_842270 ) ) ( not ( = ?auto_842268 ?auto_842271 ) ) ( not ( = ?auto_842268 ?auto_842272 ) ) ( not ( = ?auto_842268 ?auto_842273 ) ) ( not ( = ?auto_842269 ?auto_842270 ) ) ( not ( = ?auto_842269 ?auto_842271 ) ) ( not ( = ?auto_842269 ?auto_842272 ) ) ( not ( = ?auto_842269 ?auto_842273 ) ) ( not ( = ?auto_842270 ?auto_842271 ) ) ( not ( = ?auto_842270 ?auto_842272 ) ) ( not ( = ?auto_842270 ?auto_842273 ) ) ( not ( = ?auto_842271 ?auto_842272 ) ) ( not ( = ?auto_842271 ?auto_842273 ) ) ( not ( = ?auto_842272 ?auto_842273 ) ) ( ON ?auto_842271 ?auto_842272 ) ( ON ?auto_842270 ?auto_842271 ) ( ON ?auto_842269 ?auto_842270 ) ( ON ?auto_842268 ?auto_842269 ) ( ON ?auto_842267 ?auto_842268 ) ( ON ?auto_842266 ?auto_842267 ) ( ON ?auto_842265 ?auto_842266 ) ( ON ?auto_842264 ?auto_842265 ) ( CLEAR ?auto_842262 ) ( ON ?auto_842263 ?auto_842264 ) ( CLEAR ?auto_842263 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_842257 ?auto_842258 ?auto_842259 ?auto_842260 ?auto_842261 ?auto_842262 ?auto_842263 )
      ( MAKE-16PILE ?auto_842257 ?auto_842258 ?auto_842259 ?auto_842260 ?auto_842261 ?auto_842262 ?auto_842263 ?auto_842264 ?auto_842265 ?auto_842266 ?auto_842267 ?auto_842268 ?auto_842269 ?auto_842270 ?auto_842271 ?auto_842272 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_842323 - BLOCK
      ?auto_842324 - BLOCK
      ?auto_842325 - BLOCK
      ?auto_842326 - BLOCK
      ?auto_842327 - BLOCK
      ?auto_842328 - BLOCK
      ?auto_842329 - BLOCK
      ?auto_842330 - BLOCK
      ?auto_842331 - BLOCK
      ?auto_842332 - BLOCK
      ?auto_842333 - BLOCK
      ?auto_842334 - BLOCK
      ?auto_842335 - BLOCK
      ?auto_842336 - BLOCK
      ?auto_842337 - BLOCK
      ?auto_842338 - BLOCK
    )
    :vars
    (
      ?auto_842339 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_842338 ?auto_842339 ) ( ON-TABLE ?auto_842323 ) ( ON ?auto_842324 ?auto_842323 ) ( ON ?auto_842325 ?auto_842324 ) ( ON ?auto_842326 ?auto_842325 ) ( ON ?auto_842327 ?auto_842326 ) ( not ( = ?auto_842323 ?auto_842324 ) ) ( not ( = ?auto_842323 ?auto_842325 ) ) ( not ( = ?auto_842323 ?auto_842326 ) ) ( not ( = ?auto_842323 ?auto_842327 ) ) ( not ( = ?auto_842323 ?auto_842328 ) ) ( not ( = ?auto_842323 ?auto_842329 ) ) ( not ( = ?auto_842323 ?auto_842330 ) ) ( not ( = ?auto_842323 ?auto_842331 ) ) ( not ( = ?auto_842323 ?auto_842332 ) ) ( not ( = ?auto_842323 ?auto_842333 ) ) ( not ( = ?auto_842323 ?auto_842334 ) ) ( not ( = ?auto_842323 ?auto_842335 ) ) ( not ( = ?auto_842323 ?auto_842336 ) ) ( not ( = ?auto_842323 ?auto_842337 ) ) ( not ( = ?auto_842323 ?auto_842338 ) ) ( not ( = ?auto_842323 ?auto_842339 ) ) ( not ( = ?auto_842324 ?auto_842325 ) ) ( not ( = ?auto_842324 ?auto_842326 ) ) ( not ( = ?auto_842324 ?auto_842327 ) ) ( not ( = ?auto_842324 ?auto_842328 ) ) ( not ( = ?auto_842324 ?auto_842329 ) ) ( not ( = ?auto_842324 ?auto_842330 ) ) ( not ( = ?auto_842324 ?auto_842331 ) ) ( not ( = ?auto_842324 ?auto_842332 ) ) ( not ( = ?auto_842324 ?auto_842333 ) ) ( not ( = ?auto_842324 ?auto_842334 ) ) ( not ( = ?auto_842324 ?auto_842335 ) ) ( not ( = ?auto_842324 ?auto_842336 ) ) ( not ( = ?auto_842324 ?auto_842337 ) ) ( not ( = ?auto_842324 ?auto_842338 ) ) ( not ( = ?auto_842324 ?auto_842339 ) ) ( not ( = ?auto_842325 ?auto_842326 ) ) ( not ( = ?auto_842325 ?auto_842327 ) ) ( not ( = ?auto_842325 ?auto_842328 ) ) ( not ( = ?auto_842325 ?auto_842329 ) ) ( not ( = ?auto_842325 ?auto_842330 ) ) ( not ( = ?auto_842325 ?auto_842331 ) ) ( not ( = ?auto_842325 ?auto_842332 ) ) ( not ( = ?auto_842325 ?auto_842333 ) ) ( not ( = ?auto_842325 ?auto_842334 ) ) ( not ( = ?auto_842325 ?auto_842335 ) ) ( not ( = ?auto_842325 ?auto_842336 ) ) ( not ( = ?auto_842325 ?auto_842337 ) ) ( not ( = ?auto_842325 ?auto_842338 ) ) ( not ( = ?auto_842325 ?auto_842339 ) ) ( not ( = ?auto_842326 ?auto_842327 ) ) ( not ( = ?auto_842326 ?auto_842328 ) ) ( not ( = ?auto_842326 ?auto_842329 ) ) ( not ( = ?auto_842326 ?auto_842330 ) ) ( not ( = ?auto_842326 ?auto_842331 ) ) ( not ( = ?auto_842326 ?auto_842332 ) ) ( not ( = ?auto_842326 ?auto_842333 ) ) ( not ( = ?auto_842326 ?auto_842334 ) ) ( not ( = ?auto_842326 ?auto_842335 ) ) ( not ( = ?auto_842326 ?auto_842336 ) ) ( not ( = ?auto_842326 ?auto_842337 ) ) ( not ( = ?auto_842326 ?auto_842338 ) ) ( not ( = ?auto_842326 ?auto_842339 ) ) ( not ( = ?auto_842327 ?auto_842328 ) ) ( not ( = ?auto_842327 ?auto_842329 ) ) ( not ( = ?auto_842327 ?auto_842330 ) ) ( not ( = ?auto_842327 ?auto_842331 ) ) ( not ( = ?auto_842327 ?auto_842332 ) ) ( not ( = ?auto_842327 ?auto_842333 ) ) ( not ( = ?auto_842327 ?auto_842334 ) ) ( not ( = ?auto_842327 ?auto_842335 ) ) ( not ( = ?auto_842327 ?auto_842336 ) ) ( not ( = ?auto_842327 ?auto_842337 ) ) ( not ( = ?auto_842327 ?auto_842338 ) ) ( not ( = ?auto_842327 ?auto_842339 ) ) ( not ( = ?auto_842328 ?auto_842329 ) ) ( not ( = ?auto_842328 ?auto_842330 ) ) ( not ( = ?auto_842328 ?auto_842331 ) ) ( not ( = ?auto_842328 ?auto_842332 ) ) ( not ( = ?auto_842328 ?auto_842333 ) ) ( not ( = ?auto_842328 ?auto_842334 ) ) ( not ( = ?auto_842328 ?auto_842335 ) ) ( not ( = ?auto_842328 ?auto_842336 ) ) ( not ( = ?auto_842328 ?auto_842337 ) ) ( not ( = ?auto_842328 ?auto_842338 ) ) ( not ( = ?auto_842328 ?auto_842339 ) ) ( not ( = ?auto_842329 ?auto_842330 ) ) ( not ( = ?auto_842329 ?auto_842331 ) ) ( not ( = ?auto_842329 ?auto_842332 ) ) ( not ( = ?auto_842329 ?auto_842333 ) ) ( not ( = ?auto_842329 ?auto_842334 ) ) ( not ( = ?auto_842329 ?auto_842335 ) ) ( not ( = ?auto_842329 ?auto_842336 ) ) ( not ( = ?auto_842329 ?auto_842337 ) ) ( not ( = ?auto_842329 ?auto_842338 ) ) ( not ( = ?auto_842329 ?auto_842339 ) ) ( not ( = ?auto_842330 ?auto_842331 ) ) ( not ( = ?auto_842330 ?auto_842332 ) ) ( not ( = ?auto_842330 ?auto_842333 ) ) ( not ( = ?auto_842330 ?auto_842334 ) ) ( not ( = ?auto_842330 ?auto_842335 ) ) ( not ( = ?auto_842330 ?auto_842336 ) ) ( not ( = ?auto_842330 ?auto_842337 ) ) ( not ( = ?auto_842330 ?auto_842338 ) ) ( not ( = ?auto_842330 ?auto_842339 ) ) ( not ( = ?auto_842331 ?auto_842332 ) ) ( not ( = ?auto_842331 ?auto_842333 ) ) ( not ( = ?auto_842331 ?auto_842334 ) ) ( not ( = ?auto_842331 ?auto_842335 ) ) ( not ( = ?auto_842331 ?auto_842336 ) ) ( not ( = ?auto_842331 ?auto_842337 ) ) ( not ( = ?auto_842331 ?auto_842338 ) ) ( not ( = ?auto_842331 ?auto_842339 ) ) ( not ( = ?auto_842332 ?auto_842333 ) ) ( not ( = ?auto_842332 ?auto_842334 ) ) ( not ( = ?auto_842332 ?auto_842335 ) ) ( not ( = ?auto_842332 ?auto_842336 ) ) ( not ( = ?auto_842332 ?auto_842337 ) ) ( not ( = ?auto_842332 ?auto_842338 ) ) ( not ( = ?auto_842332 ?auto_842339 ) ) ( not ( = ?auto_842333 ?auto_842334 ) ) ( not ( = ?auto_842333 ?auto_842335 ) ) ( not ( = ?auto_842333 ?auto_842336 ) ) ( not ( = ?auto_842333 ?auto_842337 ) ) ( not ( = ?auto_842333 ?auto_842338 ) ) ( not ( = ?auto_842333 ?auto_842339 ) ) ( not ( = ?auto_842334 ?auto_842335 ) ) ( not ( = ?auto_842334 ?auto_842336 ) ) ( not ( = ?auto_842334 ?auto_842337 ) ) ( not ( = ?auto_842334 ?auto_842338 ) ) ( not ( = ?auto_842334 ?auto_842339 ) ) ( not ( = ?auto_842335 ?auto_842336 ) ) ( not ( = ?auto_842335 ?auto_842337 ) ) ( not ( = ?auto_842335 ?auto_842338 ) ) ( not ( = ?auto_842335 ?auto_842339 ) ) ( not ( = ?auto_842336 ?auto_842337 ) ) ( not ( = ?auto_842336 ?auto_842338 ) ) ( not ( = ?auto_842336 ?auto_842339 ) ) ( not ( = ?auto_842337 ?auto_842338 ) ) ( not ( = ?auto_842337 ?auto_842339 ) ) ( not ( = ?auto_842338 ?auto_842339 ) ) ( ON ?auto_842337 ?auto_842338 ) ( ON ?auto_842336 ?auto_842337 ) ( ON ?auto_842335 ?auto_842336 ) ( ON ?auto_842334 ?auto_842335 ) ( ON ?auto_842333 ?auto_842334 ) ( ON ?auto_842332 ?auto_842333 ) ( ON ?auto_842331 ?auto_842332 ) ( ON ?auto_842330 ?auto_842331 ) ( ON ?auto_842329 ?auto_842330 ) ( CLEAR ?auto_842327 ) ( ON ?auto_842328 ?auto_842329 ) ( CLEAR ?auto_842328 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_842323 ?auto_842324 ?auto_842325 ?auto_842326 ?auto_842327 ?auto_842328 )
      ( MAKE-16PILE ?auto_842323 ?auto_842324 ?auto_842325 ?auto_842326 ?auto_842327 ?auto_842328 ?auto_842329 ?auto_842330 ?auto_842331 ?auto_842332 ?auto_842333 ?auto_842334 ?auto_842335 ?auto_842336 ?auto_842337 ?auto_842338 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_842389 - BLOCK
      ?auto_842390 - BLOCK
      ?auto_842391 - BLOCK
      ?auto_842392 - BLOCK
      ?auto_842393 - BLOCK
      ?auto_842394 - BLOCK
      ?auto_842395 - BLOCK
      ?auto_842396 - BLOCK
      ?auto_842397 - BLOCK
      ?auto_842398 - BLOCK
      ?auto_842399 - BLOCK
      ?auto_842400 - BLOCK
      ?auto_842401 - BLOCK
      ?auto_842402 - BLOCK
      ?auto_842403 - BLOCK
      ?auto_842404 - BLOCK
    )
    :vars
    (
      ?auto_842405 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_842404 ?auto_842405 ) ( ON-TABLE ?auto_842389 ) ( ON ?auto_842390 ?auto_842389 ) ( ON ?auto_842391 ?auto_842390 ) ( ON ?auto_842392 ?auto_842391 ) ( not ( = ?auto_842389 ?auto_842390 ) ) ( not ( = ?auto_842389 ?auto_842391 ) ) ( not ( = ?auto_842389 ?auto_842392 ) ) ( not ( = ?auto_842389 ?auto_842393 ) ) ( not ( = ?auto_842389 ?auto_842394 ) ) ( not ( = ?auto_842389 ?auto_842395 ) ) ( not ( = ?auto_842389 ?auto_842396 ) ) ( not ( = ?auto_842389 ?auto_842397 ) ) ( not ( = ?auto_842389 ?auto_842398 ) ) ( not ( = ?auto_842389 ?auto_842399 ) ) ( not ( = ?auto_842389 ?auto_842400 ) ) ( not ( = ?auto_842389 ?auto_842401 ) ) ( not ( = ?auto_842389 ?auto_842402 ) ) ( not ( = ?auto_842389 ?auto_842403 ) ) ( not ( = ?auto_842389 ?auto_842404 ) ) ( not ( = ?auto_842389 ?auto_842405 ) ) ( not ( = ?auto_842390 ?auto_842391 ) ) ( not ( = ?auto_842390 ?auto_842392 ) ) ( not ( = ?auto_842390 ?auto_842393 ) ) ( not ( = ?auto_842390 ?auto_842394 ) ) ( not ( = ?auto_842390 ?auto_842395 ) ) ( not ( = ?auto_842390 ?auto_842396 ) ) ( not ( = ?auto_842390 ?auto_842397 ) ) ( not ( = ?auto_842390 ?auto_842398 ) ) ( not ( = ?auto_842390 ?auto_842399 ) ) ( not ( = ?auto_842390 ?auto_842400 ) ) ( not ( = ?auto_842390 ?auto_842401 ) ) ( not ( = ?auto_842390 ?auto_842402 ) ) ( not ( = ?auto_842390 ?auto_842403 ) ) ( not ( = ?auto_842390 ?auto_842404 ) ) ( not ( = ?auto_842390 ?auto_842405 ) ) ( not ( = ?auto_842391 ?auto_842392 ) ) ( not ( = ?auto_842391 ?auto_842393 ) ) ( not ( = ?auto_842391 ?auto_842394 ) ) ( not ( = ?auto_842391 ?auto_842395 ) ) ( not ( = ?auto_842391 ?auto_842396 ) ) ( not ( = ?auto_842391 ?auto_842397 ) ) ( not ( = ?auto_842391 ?auto_842398 ) ) ( not ( = ?auto_842391 ?auto_842399 ) ) ( not ( = ?auto_842391 ?auto_842400 ) ) ( not ( = ?auto_842391 ?auto_842401 ) ) ( not ( = ?auto_842391 ?auto_842402 ) ) ( not ( = ?auto_842391 ?auto_842403 ) ) ( not ( = ?auto_842391 ?auto_842404 ) ) ( not ( = ?auto_842391 ?auto_842405 ) ) ( not ( = ?auto_842392 ?auto_842393 ) ) ( not ( = ?auto_842392 ?auto_842394 ) ) ( not ( = ?auto_842392 ?auto_842395 ) ) ( not ( = ?auto_842392 ?auto_842396 ) ) ( not ( = ?auto_842392 ?auto_842397 ) ) ( not ( = ?auto_842392 ?auto_842398 ) ) ( not ( = ?auto_842392 ?auto_842399 ) ) ( not ( = ?auto_842392 ?auto_842400 ) ) ( not ( = ?auto_842392 ?auto_842401 ) ) ( not ( = ?auto_842392 ?auto_842402 ) ) ( not ( = ?auto_842392 ?auto_842403 ) ) ( not ( = ?auto_842392 ?auto_842404 ) ) ( not ( = ?auto_842392 ?auto_842405 ) ) ( not ( = ?auto_842393 ?auto_842394 ) ) ( not ( = ?auto_842393 ?auto_842395 ) ) ( not ( = ?auto_842393 ?auto_842396 ) ) ( not ( = ?auto_842393 ?auto_842397 ) ) ( not ( = ?auto_842393 ?auto_842398 ) ) ( not ( = ?auto_842393 ?auto_842399 ) ) ( not ( = ?auto_842393 ?auto_842400 ) ) ( not ( = ?auto_842393 ?auto_842401 ) ) ( not ( = ?auto_842393 ?auto_842402 ) ) ( not ( = ?auto_842393 ?auto_842403 ) ) ( not ( = ?auto_842393 ?auto_842404 ) ) ( not ( = ?auto_842393 ?auto_842405 ) ) ( not ( = ?auto_842394 ?auto_842395 ) ) ( not ( = ?auto_842394 ?auto_842396 ) ) ( not ( = ?auto_842394 ?auto_842397 ) ) ( not ( = ?auto_842394 ?auto_842398 ) ) ( not ( = ?auto_842394 ?auto_842399 ) ) ( not ( = ?auto_842394 ?auto_842400 ) ) ( not ( = ?auto_842394 ?auto_842401 ) ) ( not ( = ?auto_842394 ?auto_842402 ) ) ( not ( = ?auto_842394 ?auto_842403 ) ) ( not ( = ?auto_842394 ?auto_842404 ) ) ( not ( = ?auto_842394 ?auto_842405 ) ) ( not ( = ?auto_842395 ?auto_842396 ) ) ( not ( = ?auto_842395 ?auto_842397 ) ) ( not ( = ?auto_842395 ?auto_842398 ) ) ( not ( = ?auto_842395 ?auto_842399 ) ) ( not ( = ?auto_842395 ?auto_842400 ) ) ( not ( = ?auto_842395 ?auto_842401 ) ) ( not ( = ?auto_842395 ?auto_842402 ) ) ( not ( = ?auto_842395 ?auto_842403 ) ) ( not ( = ?auto_842395 ?auto_842404 ) ) ( not ( = ?auto_842395 ?auto_842405 ) ) ( not ( = ?auto_842396 ?auto_842397 ) ) ( not ( = ?auto_842396 ?auto_842398 ) ) ( not ( = ?auto_842396 ?auto_842399 ) ) ( not ( = ?auto_842396 ?auto_842400 ) ) ( not ( = ?auto_842396 ?auto_842401 ) ) ( not ( = ?auto_842396 ?auto_842402 ) ) ( not ( = ?auto_842396 ?auto_842403 ) ) ( not ( = ?auto_842396 ?auto_842404 ) ) ( not ( = ?auto_842396 ?auto_842405 ) ) ( not ( = ?auto_842397 ?auto_842398 ) ) ( not ( = ?auto_842397 ?auto_842399 ) ) ( not ( = ?auto_842397 ?auto_842400 ) ) ( not ( = ?auto_842397 ?auto_842401 ) ) ( not ( = ?auto_842397 ?auto_842402 ) ) ( not ( = ?auto_842397 ?auto_842403 ) ) ( not ( = ?auto_842397 ?auto_842404 ) ) ( not ( = ?auto_842397 ?auto_842405 ) ) ( not ( = ?auto_842398 ?auto_842399 ) ) ( not ( = ?auto_842398 ?auto_842400 ) ) ( not ( = ?auto_842398 ?auto_842401 ) ) ( not ( = ?auto_842398 ?auto_842402 ) ) ( not ( = ?auto_842398 ?auto_842403 ) ) ( not ( = ?auto_842398 ?auto_842404 ) ) ( not ( = ?auto_842398 ?auto_842405 ) ) ( not ( = ?auto_842399 ?auto_842400 ) ) ( not ( = ?auto_842399 ?auto_842401 ) ) ( not ( = ?auto_842399 ?auto_842402 ) ) ( not ( = ?auto_842399 ?auto_842403 ) ) ( not ( = ?auto_842399 ?auto_842404 ) ) ( not ( = ?auto_842399 ?auto_842405 ) ) ( not ( = ?auto_842400 ?auto_842401 ) ) ( not ( = ?auto_842400 ?auto_842402 ) ) ( not ( = ?auto_842400 ?auto_842403 ) ) ( not ( = ?auto_842400 ?auto_842404 ) ) ( not ( = ?auto_842400 ?auto_842405 ) ) ( not ( = ?auto_842401 ?auto_842402 ) ) ( not ( = ?auto_842401 ?auto_842403 ) ) ( not ( = ?auto_842401 ?auto_842404 ) ) ( not ( = ?auto_842401 ?auto_842405 ) ) ( not ( = ?auto_842402 ?auto_842403 ) ) ( not ( = ?auto_842402 ?auto_842404 ) ) ( not ( = ?auto_842402 ?auto_842405 ) ) ( not ( = ?auto_842403 ?auto_842404 ) ) ( not ( = ?auto_842403 ?auto_842405 ) ) ( not ( = ?auto_842404 ?auto_842405 ) ) ( ON ?auto_842403 ?auto_842404 ) ( ON ?auto_842402 ?auto_842403 ) ( ON ?auto_842401 ?auto_842402 ) ( ON ?auto_842400 ?auto_842401 ) ( ON ?auto_842399 ?auto_842400 ) ( ON ?auto_842398 ?auto_842399 ) ( ON ?auto_842397 ?auto_842398 ) ( ON ?auto_842396 ?auto_842397 ) ( ON ?auto_842395 ?auto_842396 ) ( ON ?auto_842394 ?auto_842395 ) ( CLEAR ?auto_842392 ) ( ON ?auto_842393 ?auto_842394 ) ( CLEAR ?auto_842393 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_842389 ?auto_842390 ?auto_842391 ?auto_842392 ?auto_842393 )
      ( MAKE-16PILE ?auto_842389 ?auto_842390 ?auto_842391 ?auto_842392 ?auto_842393 ?auto_842394 ?auto_842395 ?auto_842396 ?auto_842397 ?auto_842398 ?auto_842399 ?auto_842400 ?auto_842401 ?auto_842402 ?auto_842403 ?auto_842404 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_842455 - BLOCK
      ?auto_842456 - BLOCK
      ?auto_842457 - BLOCK
      ?auto_842458 - BLOCK
      ?auto_842459 - BLOCK
      ?auto_842460 - BLOCK
      ?auto_842461 - BLOCK
      ?auto_842462 - BLOCK
      ?auto_842463 - BLOCK
      ?auto_842464 - BLOCK
      ?auto_842465 - BLOCK
      ?auto_842466 - BLOCK
      ?auto_842467 - BLOCK
      ?auto_842468 - BLOCK
      ?auto_842469 - BLOCK
      ?auto_842470 - BLOCK
    )
    :vars
    (
      ?auto_842471 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_842470 ?auto_842471 ) ( ON-TABLE ?auto_842455 ) ( ON ?auto_842456 ?auto_842455 ) ( ON ?auto_842457 ?auto_842456 ) ( not ( = ?auto_842455 ?auto_842456 ) ) ( not ( = ?auto_842455 ?auto_842457 ) ) ( not ( = ?auto_842455 ?auto_842458 ) ) ( not ( = ?auto_842455 ?auto_842459 ) ) ( not ( = ?auto_842455 ?auto_842460 ) ) ( not ( = ?auto_842455 ?auto_842461 ) ) ( not ( = ?auto_842455 ?auto_842462 ) ) ( not ( = ?auto_842455 ?auto_842463 ) ) ( not ( = ?auto_842455 ?auto_842464 ) ) ( not ( = ?auto_842455 ?auto_842465 ) ) ( not ( = ?auto_842455 ?auto_842466 ) ) ( not ( = ?auto_842455 ?auto_842467 ) ) ( not ( = ?auto_842455 ?auto_842468 ) ) ( not ( = ?auto_842455 ?auto_842469 ) ) ( not ( = ?auto_842455 ?auto_842470 ) ) ( not ( = ?auto_842455 ?auto_842471 ) ) ( not ( = ?auto_842456 ?auto_842457 ) ) ( not ( = ?auto_842456 ?auto_842458 ) ) ( not ( = ?auto_842456 ?auto_842459 ) ) ( not ( = ?auto_842456 ?auto_842460 ) ) ( not ( = ?auto_842456 ?auto_842461 ) ) ( not ( = ?auto_842456 ?auto_842462 ) ) ( not ( = ?auto_842456 ?auto_842463 ) ) ( not ( = ?auto_842456 ?auto_842464 ) ) ( not ( = ?auto_842456 ?auto_842465 ) ) ( not ( = ?auto_842456 ?auto_842466 ) ) ( not ( = ?auto_842456 ?auto_842467 ) ) ( not ( = ?auto_842456 ?auto_842468 ) ) ( not ( = ?auto_842456 ?auto_842469 ) ) ( not ( = ?auto_842456 ?auto_842470 ) ) ( not ( = ?auto_842456 ?auto_842471 ) ) ( not ( = ?auto_842457 ?auto_842458 ) ) ( not ( = ?auto_842457 ?auto_842459 ) ) ( not ( = ?auto_842457 ?auto_842460 ) ) ( not ( = ?auto_842457 ?auto_842461 ) ) ( not ( = ?auto_842457 ?auto_842462 ) ) ( not ( = ?auto_842457 ?auto_842463 ) ) ( not ( = ?auto_842457 ?auto_842464 ) ) ( not ( = ?auto_842457 ?auto_842465 ) ) ( not ( = ?auto_842457 ?auto_842466 ) ) ( not ( = ?auto_842457 ?auto_842467 ) ) ( not ( = ?auto_842457 ?auto_842468 ) ) ( not ( = ?auto_842457 ?auto_842469 ) ) ( not ( = ?auto_842457 ?auto_842470 ) ) ( not ( = ?auto_842457 ?auto_842471 ) ) ( not ( = ?auto_842458 ?auto_842459 ) ) ( not ( = ?auto_842458 ?auto_842460 ) ) ( not ( = ?auto_842458 ?auto_842461 ) ) ( not ( = ?auto_842458 ?auto_842462 ) ) ( not ( = ?auto_842458 ?auto_842463 ) ) ( not ( = ?auto_842458 ?auto_842464 ) ) ( not ( = ?auto_842458 ?auto_842465 ) ) ( not ( = ?auto_842458 ?auto_842466 ) ) ( not ( = ?auto_842458 ?auto_842467 ) ) ( not ( = ?auto_842458 ?auto_842468 ) ) ( not ( = ?auto_842458 ?auto_842469 ) ) ( not ( = ?auto_842458 ?auto_842470 ) ) ( not ( = ?auto_842458 ?auto_842471 ) ) ( not ( = ?auto_842459 ?auto_842460 ) ) ( not ( = ?auto_842459 ?auto_842461 ) ) ( not ( = ?auto_842459 ?auto_842462 ) ) ( not ( = ?auto_842459 ?auto_842463 ) ) ( not ( = ?auto_842459 ?auto_842464 ) ) ( not ( = ?auto_842459 ?auto_842465 ) ) ( not ( = ?auto_842459 ?auto_842466 ) ) ( not ( = ?auto_842459 ?auto_842467 ) ) ( not ( = ?auto_842459 ?auto_842468 ) ) ( not ( = ?auto_842459 ?auto_842469 ) ) ( not ( = ?auto_842459 ?auto_842470 ) ) ( not ( = ?auto_842459 ?auto_842471 ) ) ( not ( = ?auto_842460 ?auto_842461 ) ) ( not ( = ?auto_842460 ?auto_842462 ) ) ( not ( = ?auto_842460 ?auto_842463 ) ) ( not ( = ?auto_842460 ?auto_842464 ) ) ( not ( = ?auto_842460 ?auto_842465 ) ) ( not ( = ?auto_842460 ?auto_842466 ) ) ( not ( = ?auto_842460 ?auto_842467 ) ) ( not ( = ?auto_842460 ?auto_842468 ) ) ( not ( = ?auto_842460 ?auto_842469 ) ) ( not ( = ?auto_842460 ?auto_842470 ) ) ( not ( = ?auto_842460 ?auto_842471 ) ) ( not ( = ?auto_842461 ?auto_842462 ) ) ( not ( = ?auto_842461 ?auto_842463 ) ) ( not ( = ?auto_842461 ?auto_842464 ) ) ( not ( = ?auto_842461 ?auto_842465 ) ) ( not ( = ?auto_842461 ?auto_842466 ) ) ( not ( = ?auto_842461 ?auto_842467 ) ) ( not ( = ?auto_842461 ?auto_842468 ) ) ( not ( = ?auto_842461 ?auto_842469 ) ) ( not ( = ?auto_842461 ?auto_842470 ) ) ( not ( = ?auto_842461 ?auto_842471 ) ) ( not ( = ?auto_842462 ?auto_842463 ) ) ( not ( = ?auto_842462 ?auto_842464 ) ) ( not ( = ?auto_842462 ?auto_842465 ) ) ( not ( = ?auto_842462 ?auto_842466 ) ) ( not ( = ?auto_842462 ?auto_842467 ) ) ( not ( = ?auto_842462 ?auto_842468 ) ) ( not ( = ?auto_842462 ?auto_842469 ) ) ( not ( = ?auto_842462 ?auto_842470 ) ) ( not ( = ?auto_842462 ?auto_842471 ) ) ( not ( = ?auto_842463 ?auto_842464 ) ) ( not ( = ?auto_842463 ?auto_842465 ) ) ( not ( = ?auto_842463 ?auto_842466 ) ) ( not ( = ?auto_842463 ?auto_842467 ) ) ( not ( = ?auto_842463 ?auto_842468 ) ) ( not ( = ?auto_842463 ?auto_842469 ) ) ( not ( = ?auto_842463 ?auto_842470 ) ) ( not ( = ?auto_842463 ?auto_842471 ) ) ( not ( = ?auto_842464 ?auto_842465 ) ) ( not ( = ?auto_842464 ?auto_842466 ) ) ( not ( = ?auto_842464 ?auto_842467 ) ) ( not ( = ?auto_842464 ?auto_842468 ) ) ( not ( = ?auto_842464 ?auto_842469 ) ) ( not ( = ?auto_842464 ?auto_842470 ) ) ( not ( = ?auto_842464 ?auto_842471 ) ) ( not ( = ?auto_842465 ?auto_842466 ) ) ( not ( = ?auto_842465 ?auto_842467 ) ) ( not ( = ?auto_842465 ?auto_842468 ) ) ( not ( = ?auto_842465 ?auto_842469 ) ) ( not ( = ?auto_842465 ?auto_842470 ) ) ( not ( = ?auto_842465 ?auto_842471 ) ) ( not ( = ?auto_842466 ?auto_842467 ) ) ( not ( = ?auto_842466 ?auto_842468 ) ) ( not ( = ?auto_842466 ?auto_842469 ) ) ( not ( = ?auto_842466 ?auto_842470 ) ) ( not ( = ?auto_842466 ?auto_842471 ) ) ( not ( = ?auto_842467 ?auto_842468 ) ) ( not ( = ?auto_842467 ?auto_842469 ) ) ( not ( = ?auto_842467 ?auto_842470 ) ) ( not ( = ?auto_842467 ?auto_842471 ) ) ( not ( = ?auto_842468 ?auto_842469 ) ) ( not ( = ?auto_842468 ?auto_842470 ) ) ( not ( = ?auto_842468 ?auto_842471 ) ) ( not ( = ?auto_842469 ?auto_842470 ) ) ( not ( = ?auto_842469 ?auto_842471 ) ) ( not ( = ?auto_842470 ?auto_842471 ) ) ( ON ?auto_842469 ?auto_842470 ) ( ON ?auto_842468 ?auto_842469 ) ( ON ?auto_842467 ?auto_842468 ) ( ON ?auto_842466 ?auto_842467 ) ( ON ?auto_842465 ?auto_842466 ) ( ON ?auto_842464 ?auto_842465 ) ( ON ?auto_842463 ?auto_842464 ) ( ON ?auto_842462 ?auto_842463 ) ( ON ?auto_842461 ?auto_842462 ) ( ON ?auto_842460 ?auto_842461 ) ( ON ?auto_842459 ?auto_842460 ) ( CLEAR ?auto_842457 ) ( ON ?auto_842458 ?auto_842459 ) ( CLEAR ?auto_842458 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_842455 ?auto_842456 ?auto_842457 ?auto_842458 )
      ( MAKE-16PILE ?auto_842455 ?auto_842456 ?auto_842457 ?auto_842458 ?auto_842459 ?auto_842460 ?auto_842461 ?auto_842462 ?auto_842463 ?auto_842464 ?auto_842465 ?auto_842466 ?auto_842467 ?auto_842468 ?auto_842469 ?auto_842470 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_842521 - BLOCK
      ?auto_842522 - BLOCK
      ?auto_842523 - BLOCK
      ?auto_842524 - BLOCK
      ?auto_842525 - BLOCK
      ?auto_842526 - BLOCK
      ?auto_842527 - BLOCK
      ?auto_842528 - BLOCK
      ?auto_842529 - BLOCK
      ?auto_842530 - BLOCK
      ?auto_842531 - BLOCK
      ?auto_842532 - BLOCK
      ?auto_842533 - BLOCK
      ?auto_842534 - BLOCK
      ?auto_842535 - BLOCK
      ?auto_842536 - BLOCK
    )
    :vars
    (
      ?auto_842537 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_842536 ?auto_842537 ) ( ON-TABLE ?auto_842521 ) ( ON ?auto_842522 ?auto_842521 ) ( not ( = ?auto_842521 ?auto_842522 ) ) ( not ( = ?auto_842521 ?auto_842523 ) ) ( not ( = ?auto_842521 ?auto_842524 ) ) ( not ( = ?auto_842521 ?auto_842525 ) ) ( not ( = ?auto_842521 ?auto_842526 ) ) ( not ( = ?auto_842521 ?auto_842527 ) ) ( not ( = ?auto_842521 ?auto_842528 ) ) ( not ( = ?auto_842521 ?auto_842529 ) ) ( not ( = ?auto_842521 ?auto_842530 ) ) ( not ( = ?auto_842521 ?auto_842531 ) ) ( not ( = ?auto_842521 ?auto_842532 ) ) ( not ( = ?auto_842521 ?auto_842533 ) ) ( not ( = ?auto_842521 ?auto_842534 ) ) ( not ( = ?auto_842521 ?auto_842535 ) ) ( not ( = ?auto_842521 ?auto_842536 ) ) ( not ( = ?auto_842521 ?auto_842537 ) ) ( not ( = ?auto_842522 ?auto_842523 ) ) ( not ( = ?auto_842522 ?auto_842524 ) ) ( not ( = ?auto_842522 ?auto_842525 ) ) ( not ( = ?auto_842522 ?auto_842526 ) ) ( not ( = ?auto_842522 ?auto_842527 ) ) ( not ( = ?auto_842522 ?auto_842528 ) ) ( not ( = ?auto_842522 ?auto_842529 ) ) ( not ( = ?auto_842522 ?auto_842530 ) ) ( not ( = ?auto_842522 ?auto_842531 ) ) ( not ( = ?auto_842522 ?auto_842532 ) ) ( not ( = ?auto_842522 ?auto_842533 ) ) ( not ( = ?auto_842522 ?auto_842534 ) ) ( not ( = ?auto_842522 ?auto_842535 ) ) ( not ( = ?auto_842522 ?auto_842536 ) ) ( not ( = ?auto_842522 ?auto_842537 ) ) ( not ( = ?auto_842523 ?auto_842524 ) ) ( not ( = ?auto_842523 ?auto_842525 ) ) ( not ( = ?auto_842523 ?auto_842526 ) ) ( not ( = ?auto_842523 ?auto_842527 ) ) ( not ( = ?auto_842523 ?auto_842528 ) ) ( not ( = ?auto_842523 ?auto_842529 ) ) ( not ( = ?auto_842523 ?auto_842530 ) ) ( not ( = ?auto_842523 ?auto_842531 ) ) ( not ( = ?auto_842523 ?auto_842532 ) ) ( not ( = ?auto_842523 ?auto_842533 ) ) ( not ( = ?auto_842523 ?auto_842534 ) ) ( not ( = ?auto_842523 ?auto_842535 ) ) ( not ( = ?auto_842523 ?auto_842536 ) ) ( not ( = ?auto_842523 ?auto_842537 ) ) ( not ( = ?auto_842524 ?auto_842525 ) ) ( not ( = ?auto_842524 ?auto_842526 ) ) ( not ( = ?auto_842524 ?auto_842527 ) ) ( not ( = ?auto_842524 ?auto_842528 ) ) ( not ( = ?auto_842524 ?auto_842529 ) ) ( not ( = ?auto_842524 ?auto_842530 ) ) ( not ( = ?auto_842524 ?auto_842531 ) ) ( not ( = ?auto_842524 ?auto_842532 ) ) ( not ( = ?auto_842524 ?auto_842533 ) ) ( not ( = ?auto_842524 ?auto_842534 ) ) ( not ( = ?auto_842524 ?auto_842535 ) ) ( not ( = ?auto_842524 ?auto_842536 ) ) ( not ( = ?auto_842524 ?auto_842537 ) ) ( not ( = ?auto_842525 ?auto_842526 ) ) ( not ( = ?auto_842525 ?auto_842527 ) ) ( not ( = ?auto_842525 ?auto_842528 ) ) ( not ( = ?auto_842525 ?auto_842529 ) ) ( not ( = ?auto_842525 ?auto_842530 ) ) ( not ( = ?auto_842525 ?auto_842531 ) ) ( not ( = ?auto_842525 ?auto_842532 ) ) ( not ( = ?auto_842525 ?auto_842533 ) ) ( not ( = ?auto_842525 ?auto_842534 ) ) ( not ( = ?auto_842525 ?auto_842535 ) ) ( not ( = ?auto_842525 ?auto_842536 ) ) ( not ( = ?auto_842525 ?auto_842537 ) ) ( not ( = ?auto_842526 ?auto_842527 ) ) ( not ( = ?auto_842526 ?auto_842528 ) ) ( not ( = ?auto_842526 ?auto_842529 ) ) ( not ( = ?auto_842526 ?auto_842530 ) ) ( not ( = ?auto_842526 ?auto_842531 ) ) ( not ( = ?auto_842526 ?auto_842532 ) ) ( not ( = ?auto_842526 ?auto_842533 ) ) ( not ( = ?auto_842526 ?auto_842534 ) ) ( not ( = ?auto_842526 ?auto_842535 ) ) ( not ( = ?auto_842526 ?auto_842536 ) ) ( not ( = ?auto_842526 ?auto_842537 ) ) ( not ( = ?auto_842527 ?auto_842528 ) ) ( not ( = ?auto_842527 ?auto_842529 ) ) ( not ( = ?auto_842527 ?auto_842530 ) ) ( not ( = ?auto_842527 ?auto_842531 ) ) ( not ( = ?auto_842527 ?auto_842532 ) ) ( not ( = ?auto_842527 ?auto_842533 ) ) ( not ( = ?auto_842527 ?auto_842534 ) ) ( not ( = ?auto_842527 ?auto_842535 ) ) ( not ( = ?auto_842527 ?auto_842536 ) ) ( not ( = ?auto_842527 ?auto_842537 ) ) ( not ( = ?auto_842528 ?auto_842529 ) ) ( not ( = ?auto_842528 ?auto_842530 ) ) ( not ( = ?auto_842528 ?auto_842531 ) ) ( not ( = ?auto_842528 ?auto_842532 ) ) ( not ( = ?auto_842528 ?auto_842533 ) ) ( not ( = ?auto_842528 ?auto_842534 ) ) ( not ( = ?auto_842528 ?auto_842535 ) ) ( not ( = ?auto_842528 ?auto_842536 ) ) ( not ( = ?auto_842528 ?auto_842537 ) ) ( not ( = ?auto_842529 ?auto_842530 ) ) ( not ( = ?auto_842529 ?auto_842531 ) ) ( not ( = ?auto_842529 ?auto_842532 ) ) ( not ( = ?auto_842529 ?auto_842533 ) ) ( not ( = ?auto_842529 ?auto_842534 ) ) ( not ( = ?auto_842529 ?auto_842535 ) ) ( not ( = ?auto_842529 ?auto_842536 ) ) ( not ( = ?auto_842529 ?auto_842537 ) ) ( not ( = ?auto_842530 ?auto_842531 ) ) ( not ( = ?auto_842530 ?auto_842532 ) ) ( not ( = ?auto_842530 ?auto_842533 ) ) ( not ( = ?auto_842530 ?auto_842534 ) ) ( not ( = ?auto_842530 ?auto_842535 ) ) ( not ( = ?auto_842530 ?auto_842536 ) ) ( not ( = ?auto_842530 ?auto_842537 ) ) ( not ( = ?auto_842531 ?auto_842532 ) ) ( not ( = ?auto_842531 ?auto_842533 ) ) ( not ( = ?auto_842531 ?auto_842534 ) ) ( not ( = ?auto_842531 ?auto_842535 ) ) ( not ( = ?auto_842531 ?auto_842536 ) ) ( not ( = ?auto_842531 ?auto_842537 ) ) ( not ( = ?auto_842532 ?auto_842533 ) ) ( not ( = ?auto_842532 ?auto_842534 ) ) ( not ( = ?auto_842532 ?auto_842535 ) ) ( not ( = ?auto_842532 ?auto_842536 ) ) ( not ( = ?auto_842532 ?auto_842537 ) ) ( not ( = ?auto_842533 ?auto_842534 ) ) ( not ( = ?auto_842533 ?auto_842535 ) ) ( not ( = ?auto_842533 ?auto_842536 ) ) ( not ( = ?auto_842533 ?auto_842537 ) ) ( not ( = ?auto_842534 ?auto_842535 ) ) ( not ( = ?auto_842534 ?auto_842536 ) ) ( not ( = ?auto_842534 ?auto_842537 ) ) ( not ( = ?auto_842535 ?auto_842536 ) ) ( not ( = ?auto_842535 ?auto_842537 ) ) ( not ( = ?auto_842536 ?auto_842537 ) ) ( ON ?auto_842535 ?auto_842536 ) ( ON ?auto_842534 ?auto_842535 ) ( ON ?auto_842533 ?auto_842534 ) ( ON ?auto_842532 ?auto_842533 ) ( ON ?auto_842531 ?auto_842532 ) ( ON ?auto_842530 ?auto_842531 ) ( ON ?auto_842529 ?auto_842530 ) ( ON ?auto_842528 ?auto_842529 ) ( ON ?auto_842527 ?auto_842528 ) ( ON ?auto_842526 ?auto_842527 ) ( ON ?auto_842525 ?auto_842526 ) ( ON ?auto_842524 ?auto_842525 ) ( CLEAR ?auto_842522 ) ( ON ?auto_842523 ?auto_842524 ) ( CLEAR ?auto_842523 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_842521 ?auto_842522 ?auto_842523 )
      ( MAKE-16PILE ?auto_842521 ?auto_842522 ?auto_842523 ?auto_842524 ?auto_842525 ?auto_842526 ?auto_842527 ?auto_842528 ?auto_842529 ?auto_842530 ?auto_842531 ?auto_842532 ?auto_842533 ?auto_842534 ?auto_842535 ?auto_842536 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_842587 - BLOCK
      ?auto_842588 - BLOCK
      ?auto_842589 - BLOCK
      ?auto_842590 - BLOCK
      ?auto_842591 - BLOCK
      ?auto_842592 - BLOCK
      ?auto_842593 - BLOCK
      ?auto_842594 - BLOCK
      ?auto_842595 - BLOCK
      ?auto_842596 - BLOCK
      ?auto_842597 - BLOCK
      ?auto_842598 - BLOCK
      ?auto_842599 - BLOCK
      ?auto_842600 - BLOCK
      ?auto_842601 - BLOCK
      ?auto_842602 - BLOCK
    )
    :vars
    (
      ?auto_842603 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_842602 ?auto_842603 ) ( ON-TABLE ?auto_842587 ) ( not ( = ?auto_842587 ?auto_842588 ) ) ( not ( = ?auto_842587 ?auto_842589 ) ) ( not ( = ?auto_842587 ?auto_842590 ) ) ( not ( = ?auto_842587 ?auto_842591 ) ) ( not ( = ?auto_842587 ?auto_842592 ) ) ( not ( = ?auto_842587 ?auto_842593 ) ) ( not ( = ?auto_842587 ?auto_842594 ) ) ( not ( = ?auto_842587 ?auto_842595 ) ) ( not ( = ?auto_842587 ?auto_842596 ) ) ( not ( = ?auto_842587 ?auto_842597 ) ) ( not ( = ?auto_842587 ?auto_842598 ) ) ( not ( = ?auto_842587 ?auto_842599 ) ) ( not ( = ?auto_842587 ?auto_842600 ) ) ( not ( = ?auto_842587 ?auto_842601 ) ) ( not ( = ?auto_842587 ?auto_842602 ) ) ( not ( = ?auto_842587 ?auto_842603 ) ) ( not ( = ?auto_842588 ?auto_842589 ) ) ( not ( = ?auto_842588 ?auto_842590 ) ) ( not ( = ?auto_842588 ?auto_842591 ) ) ( not ( = ?auto_842588 ?auto_842592 ) ) ( not ( = ?auto_842588 ?auto_842593 ) ) ( not ( = ?auto_842588 ?auto_842594 ) ) ( not ( = ?auto_842588 ?auto_842595 ) ) ( not ( = ?auto_842588 ?auto_842596 ) ) ( not ( = ?auto_842588 ?auto_842597 ) ) ( not ( = ?auto_842588 ?auto_842598 ) ) ( not ( = ?auto_842588 ?auto_842599 ) ) ( not ( = ?auto_842588 ?auto_842600 ) ) ( not ( = ?auto_842588 ?auto_842601 ) ) ( not ( = ?auto_842588 ?auto_842602 ) ) ( not ( = ?auto_842588 ?auto_842603 ) ) ( not ( = ?auto_842589 ?auto_842590 ) ) ( not ( = ?auto_842589 ?auto_842591 ) ) ( not ( = ?auto_842589 ?auto_842592 ) ) ( not ( = ?auto_842589 ?auto_842593 ) ) ( not ( = ?auto_842589 ?auto_842594 ) ) ( not ( = ?auto_842589 ?auto_842595 ) ) ( not ( = ?auto_842589 ?auto_842596 ) ) ( not ( = ?auto_842589 ?auto_842597 ) ) ( not ( = ?auto_842589 ?auto_842598 ) ) ( not ( = ?auto_842589 ?auto_842599 ) ) ( not ( = ?auto_842589 ?auto_842600 ) ) ( not ( = ?auto_842589 ?auto_842601 ) ) ( not ( = ?auto_842589 ?auto_842602 ) ) ( not ( = ?auto_842589 ?auto_842603 ) ) ( not ( = ?auto_842590 ?auto_842591 ) ) ( not ( = ?auto_842590 ?auto_842592 ) ) ( not ( = ?auto_842590 ?auto_842593 ) ) ( not ( = ?auto_842590 ?auto_842594 ) ) ( not ( = ?auto_842590 ?auto_842595 ) ) ( not ( = ?auto_842590 ?auto_842596 ) ) ( not ( = ?auto_842590 ?auto_842597 ) ) ( not ( = ?auto_842590 ?auto_842598 ) ) ( not ( = ?auto_842590 ?auto_842599 ) ) ( not ( = ?auto_842590 ?auto_842600 ) ) ( not ( = ?auto_842590 ?auto_842601 ) ) ( not ( = ?auto_842590 ?auto_842602 ) ) ( not ( = ?auto_842590 ?auto_842603 ) ) ( not ( = ?auto_842591 ?auto_842592 ) ) ( not ( = ?auto_842591 ?auto_842593 ) ) ( not ( = ?auto_842591 ?auto_842594 ) ) ( not ( = ?auto_842591 ?auto_842595 ) ) ( not ( = ?auto_842591 ?auto_842596 ) ) ( not ( = ?auto_842591 ?auto_842597 ) ) ( not ( = ?auto_842591 ?auto_842598 ) ) ( not ( = ?auto_842591 ?auto_842599 ) ) ( not ( = ?auto_842591 ?auto_842600 ) ) ( not ( = ?auto_842591 ?auto_842601 ) ) ( not ( = ?auto_842591 ?auto_842602 ) ) ( not ( = ?auto_842591 ?auto_842603 ) ) ( not ( = ?auto_842592 ?auto_842593 ) ) ( not ( = ?auto_842592 ?auto_842594 ) ) ( not ( = ?auto_842592 ?auto_842595 ) ) ( not ( = ?auto_842592 ?auto_842596 ) ) ( not ( = ?auto_842592 ?auto_842597 ) ) ( not ( = ?auto_842592 ?auto_842598 ) ) ( not ( = ?auto_842592 ?auto_842599 ) ) ( not ( = ?auto_842592 ?auto_842600 ) ) ( not ( = ?auto_842592 ?auto_842601 ) ) ( not ( = ?auto_842592 ?auto_842602 ) ) ( not ( = ?auto_842592 ?auto_842603 ) ) ( not ( = ?auto_842593 ?auto_842594 ) ) ( not ( = ?auto_842593 ?auto_842595 ) ) ( not ( = ?auto_842593 ?auto_842596 ) ) ( not ( = ?auto_842593 ?auto_842597 ) ) ( not ( = ?auto_842593 ?auto_842598 ) ) ( not ( = ?auto_842593 ?auto_842599 ) ) ( not ( = ?auto_842593 ?auto_842600 ) ) ( not ( = ?auto_842593 ?auto_842601 ) ) ( not ( = ?auto_842593 ?auto_842602 ) ) ( not ( = ?auto_842593 ?auto_842603 ) ) ( not ( = ?auto_842594 ?auto_842595 ) ) ( not ( = ?auto_842594 ?auto_842596 ) ) ( not ( = ?auto_842594 ?auto_842597 ) ) ( not ( = ?auto_842594 ?auto_842598 ) ) ( not ( = ?auto_842594 ?auto_842599 ) ) ( not ( = ?auto_842594 ?auto_842600 ) ) ( not ( = ?auto_842594 ?auto_842601 ) ) ( not ( = ?auto_842594 ?auto_842602 ) ) ( not ( = ?auto_842594 ?auto_842603 ) ) ( not ( = ?auto_842595 ?auto_842596 ) ) ( not ( = ?auto_842595 ?auto_842597 ) ) ( not ( = ?auto_842595 ?auto_842598 ) ) ( not ( = ?auto_842595 ?auto_842599 ) ) ( not ( = ?auto_842595 ?auto_842600 ) ) ( not ( = ?auto_842595 ?auto_842601 ) ) ( not ( = ?auto_842595 ?auto_842602 ) ) ( not ( = ?auto_842595 ?auto_842603 ) ) ( not ( = ?auto_842596 ?auto_842597 ) ) ( not ( = ?auto_842596 ?auto_842598 ) ) ( not ( = ?auto_842596 ?auto_842599 ) ) ( not ( = ?auto_842596 ?auto_842600 ) ) ( not ( = ?auto_842596 ?auto_842601 ) ) ( not ( = ?auto_842596 ?auto_842602 ) ) ( not ( = ?auto_842596 ?auto_842603 ) ) ( not ( = ?auto_842597 ?auto_842598 ) ) ( not ( = ?auto_842597 ?auto_842599 ) ) ( not ( = ?auto_842597 ?auto_842600 ) ) ( not ( = ?auto_842597 ?auto_842601 ) ) ( not ( = ?auto_842597 ?auto_842602 ) ) ( not ( = ?auto_842597 ?auto_842603 ) ) ( not ( = ?auto_842598 ?auto_842599 ) ) ( not ( = ?auto_842598 ?auto_842600 ) ) ( not ( = ?auto_842598 ?auto_842601 ) ) ( not ( = ?auto_842598 ?auto_842602 ) ) ( not ( = ?auto_842598 ?auto_842603 ) ) ( not ( = ?auto_842599 ?auto_842600 ) ) ( not ( = ?auto_842599 ?auto_842601 ) ) ( not ( = ?auto_842599 ?auto_842602 ) ) ( not ( = ?auto_842599 ?auto_842603 ) ) ( not ( = ?auto_842600 ?auto_842601 ) ) ( not ( = ?auto_842600 ?auto_842602 ) ) ( not ( = ?auto_842600 ?auto_842603 ) ) ( not ( = ?auto_842601 ?auto_842602 ) ) ( not ( = ?auto_842601 ?auto_842603 ) ) ( not ( = ?auto_842602 ?auto_842603 ) ) ( ON ?auto_842601 ?auto_842602 ) ( ON ?auto_842600 ?auto_842601 ) ( ON ?auto_842599 ?auto_842600 ) ( ON ?auto_842598 ?auto_842599 ) ( ON ?auto_842597 ?auto_842598 ) ( ON ?auto_842596 ?auto_842597 ) ( ON ?auto_842595 ?auto_842596 ) ( ON ?auto_842594 ?auto_842595 ) ( ON ?auto_842593 ?auto_842594 ) ( ON ?auto_842592 ?auto_842593 ) ( ON ?auto_842591 ?auto_842592 ) ( ON ?auto_842590 ?auto_842591 ) ( ON ?auto_842589 ?auto_842590 ) ( CLEAR ?auto_842587 ) ( ON ?auto_842588 ?auto_842589 ) ( CLEAR ?auto_842588 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_842587 ?auto_842588 )
      ( MAKE-16PILE ?auto_842587 ?auto_842588 ?auto_842589 ?auto_842590 ?auto_842591 ?auto_842592 ?auto_842593 ?auto_842594 ?auto_842595 ?auto_842596 ?auto_842597 ?auto_842598 ?auto_842599 ?auto_842600 ?auto_842601 ?auto_842602 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_842653 - BLOCK
      ?auto_842654 - BLOCK
      ?auto_842655 - BLOCK
      ?auto_842656 - BLOCK
      ?auto_842657 - BLOCK
      ?auto_842658 - BLOCK
      ?auto_842659 - BLOCK
      ?auto_842660 - BLOCK
      ?auto_842661 - BLOCK
      ?auto_842662 - BLOCK
      ?auto_842663 - BLOCK
      ?auto_842664 - BLOCK
      ?auto_842665 - BLOCK
      ?auto_842666 - BLOCK
      ?auto_842667 - BLOCK
      ?auto_842668 - BLOCK
    )
    :vars
    (
      ?auto_842669 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_842668 ?auto_842669 ) ( not ( = ?auto_842653 ?auto_842654 ) ) ( not ( = ?auto_842653 ?auto_842655 ) ) ( not ( = ?auto_842653 ?auto_842656 ) ) ( not ( = ?auto_842653 ?auto_842657 ) ) ( not ( = ?auto_842653 ?auto_842658 ) ) ( not ( = ?auto_842653 ?auto_842659 ) ) ( not ( = ?auto_842653 ?auto_842660 ) ) ( not ( = ?auto_842653 ?auto_842661 ) ) ( not ( = ?auto_842653 ?auto_842662 ) ) ( not ( = ?auto_842653 ?auto_842663 ) ) ( not ( = ?auto_842653 ?auto_842664 ) ) ( not ( = ?auto_842653 ?auto_842665 ) ) ( not ( = ?auto_842653 ?auto_842666 ) ) ( not ( = ?auto_842653 ?auto_842667 ) ) ( not ( = ?auto_842653 ?auto_842668 ) ) ( not ( = ?auto_842653 ?auto_842669 ) ) ( not ( = ?auto_842654 ?auto_842655 ) ) ( not ( = ?auto_842654 ?auto_842656 ) ) ( not ( = ?auto_842654 ?auto_842657 ) ) ( not ( = ?auto_842654 ?auto_842658 ) ) ( not ( = ?auto_842654 ?auto_842659 ) ) ( not ( = ?auto_842654 ?auto_842660 ) ) ( not ( = ?auto_842654 ?auto_842661 ) ) ( not ( = ?auto_842654 ?auto_842662 ) ) ( not ( = ?auto_842654 ?auto_842663 ) ) ( not ( = ?auto_842654 ?auto_842664 ) ) ( not ( = ?auto_842654 ?auto_842665 ) ) ( not ( = ?auto_842654 ?auto_842666 ) ) ( not ( = ?auto_842654 ?auto_842667 ) ) ( not ( = ?auto_842654 ?auto_842668 ) ) ( not ( = ?auto_842654 ?auto_842669 ) ) ( not ( = ?auto_842655 ?auto_842656 ) ) ( not ( = ?auto_842655 ?auto_842657 ) ) ( not ( = ?auto_842655 ?auto_842658 ) ) ( not ( = ?auto_842655 ?auto_842659 ) ) ( not ( = ?auto_842655 ?auto_842660 ) ) ( not ( = ?auto_842655 ?auto_842661 ) ) ( not ( = ?auto_842655 ?auto_842662 ) ) ( not ( = ?auto_842655 ?auto_842663 ) ) ( not ( = ?auto_842655 ?auto_842664 ) ) ( not ( = ?auto_842655 ?auto_842665 ) ) ( not ( = ?auto_842655 ?auto_842666 ) ) ( not ( = ?auto_842655 ?auto_842667 ) ) ( not ( = ?auto_842655 ?auto_842668 ) ) ( not ( = ?auto_842655 ?auto_842669 ) ) ( not ( = ?auto_842656 ?auto_842657 ) ) ( not ( = ?auto_842656 ?auto_842658 ) ) ( not ( = ?auto_842656 ?auto_842659 ) ) ( not ( = ?auto_842656 ?auto_842660 ) ) ( not ( = ?auto_842656 ?auto_842661 ) ) ( not ( = ?auto_842656 ?auto_842662 ) ) ( not ( = ?auto_842656 ?auto_842663 ) ) ( not ( = ?auto_842656 ?auto_842664 ) ) ( not ( = ?auto_842656 ?auto_842665 ) ) ( not ( = ?auto_842656 ?auto_842666 ) ) ( not ( = ?auto_842656 ?auto_842667 ) ) ( not ( = ?auto_842656 ?auto_842668 ) ) ( not ( = ?auto_842656 ?auto_842669 ) ) ( not ( = ?auto_842657 ?auto_842658 ) ) ( not ( = ?auto_842657 ?auto_842659 ) ) ( not ( = ?auto_842657 ?auto_842660 ) ) ( not ( = ?auto_842657 ?auto_842661 ) ) ( not ( = ?auto_842657 ?auto_842662 ) ) ( not ( = ?auto_842657 ?auto_842663 ) ) ( not ( = ?auto_842657 ?auto_842664 ) ) ( not ( = ?auto_842657 ?auto_842665 ) ) ( not ( = ?auto_842657 ?auto_842666 ) ) ( not ( = ?auto_842657 ?auto_842667 ) ) ( not ( = ?auto_842657 ?auto_842668 ) ) ( not ( = ?auto_842657 ?auto_842669 ) ) ( not ( = ?auto_842658 ?auto_842659 ) ) ( not ( = ?auto_842658 ?auto_842660 ) ) ( not ( = ?auto_842658 ?auto_842661 ) ) ( not ( = ?auto_842658 ?auto_842662 ) ) ( not ( = ?auto_842658 ?auto_842663 ) ) ( not ( = ?auto_842658 ?auto_842664 ) ) ( not ( = ?auto_842658 ?auto_842665 ) ) ( not ( = ?auto_842658 ?auto_842666 ) ) ( not ( = ?auto_842658 ?auto_842667 ) ) ( not ( = ?auto_842658 ?auto_842668 ) ) ( not ( = ?auto_842658 ?auto_842669 ) ) ( not ( = ?auto_842659 ?auto_842660 ) ) ( not ( = ?auto_842659 ?auto_842661 ) ) ( not ( = ?auto_842659 ?auto_842662 ) ) ( not ( = ?auto_842659 ?auto_842663 ) ) ( not ( = ?auto_842659 ?auto_842664 ) ) ( not ( = ?auto_842659 ?auto_842665 ) ) ( not ( = ?auto_842659 ?auto_842666 ) ) ( not ( = ?auto_842659 ?auto_842667 ) ) ( not ( = ?auto_842659 ?auto_842668 ) ) ( not ( = ?auto_842659 ?auto_842669 ) ) ( not ( = ?auto_842660 ?auto_842661 ) ) ( not ( = ?auto_842660 ?auto_842662 ) ) ( not ( = ?auto_842660 ?auto_842663 ) ) ( not ( = ?auto_842660 ?auto_842664 ) ) ( not ( = ?auto_842660 ?auto_842665 ) ) ( not ( = ?auto_842660 ?auto_842666 ) ) ( not ( = ?auto_842660 ?auto_842667 ) ) ( not ( = ?auto_842660 ?auto_842668 ) ) ( not ( = ?auto_842660 ?auto_842669 ) ) ( not ( = ?auto_842661 ?auto_842662 ) ) ( not ( = ?auto_842661 ?auto_842663 ) ) ( not ( = ?auto_842661 ?auto_842664 ) ) ( not ( = ?auto_842661 ?auto_842665 ) ) ( not ( = ?auto_842661 ?auto_842666 ) ) ( not ( = ?auto_842661 ?auto_842667 ) ) ( not ( = ?auto_842661 ?auto_842668 ) ) ( not ( = ?auto_842661 ?auto_842669 ) ) ( not ( = ?auto_842662 ?auto_842663 ) ) ( not ( = ?auto_842662 ?auto_842664 ) ) ( not ( = ?auto_842662 ?auto_842665 ) ) ( not ( = ?auto_842662 ?auto_842666 ) ) ( not ( = ?auto_842662 ?auto_842667 ) ) ( not ( = ?auto_842662 ?auto_842668 ) ) ( not ( = ?auto_842662 ?auto_842669 ) ) ( not ( = ?auto_842663 ?auto_842664 ) ) ( not ( = ?auto_842663 ?auto_842665 ) ) ( not ( = ?auto_842663 ?auto_842666 ) ) ( not ( = ?auto_842663 ?auto_842667 ) ) ( not ( = ?auto_842663 ?auto_842668 ) ) ( not ( = ?auto_842663 ?auto_842669 ) ) ( not ( = ?auto_842664 ?auto_842665 ) ) ( not ( = ?auto_842664 ?auto_842666 ) ) ( not ( = ?auto_842664 ?auto_842667 ) ) ( not ( = ?auto_842664 ?auto_842668 ) ) ( not ( = ?auto_842664 ?auto_842669 ) ) ( not ( = ?auto_842665 ?auto_842666 ) ) ( not ( = ?auto_842665 ?auto_842667 ) ) ( not ( = ?auto_842665 ?auto_842668 ) ) ( not ( = ?auto_842665 ?auto_842669 ) ) ( not ( = ?auto_842666 ?auto_842667 ) ) ( not ( = ?auto_842666 ?auto_842668 ) ) ( not ( = ?auto_842666 ?auto_842669 ) ) ( not ( = ?auto_842667 ?auto_842668 ) ) ( not ( = ?auto_842667 ?auto_842669 ) ) ( not ( = ?auto_842668 ?auto_842669 ) ) ( ON ?auto_842667 ?auto_842668 ) ( ON ?auto_842666 ?auto_842667 ) ( ON ?auto_842665 ?auto_842666 ) ( ON ?auto_842664 ?auto_842665 ) ( ON ?auto_842663 ?auto_842664 ) ( ON ?auto_842662 ?auto_842663 ) ( ON ?auto_842661 ?auto_842662 ) ( ON ?auto_842660 ?auto_842661 ) ( ON ?auto_842659 ?auto_842660 ) ( ON ?auto_842658 ?auto_842659 ) ( ON ?auto_842657 ?auto_842658 ) ( ON ?auto_842656 ?auto_842657 ) ( ON ?auto_842655 ?auto_842656 ) ( ON ?auto_842654 ?auto_842655 ) ( ON ?auto_842653 ?auto_842654 ) ( CLEAR ?auto_842653 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_842653 )
      ( MAKE-16PILE ?auto_842653 ?auto_842654 ?auto_842655 ?auto_842656 ?auto_842657 ?auto_842658 ?auto_842659 ?auto_842660 ?auto_842661 ?auto_842662 ?auto_842663 ?auto_842664 ?auto_842665 ?auto_842666 ?auto_842667 ?auto_842668 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_842720 - BLOCK
      ?auto_842721 - BLOCK
      ?auto_842722 - BLOCK
      ?auto_842723 - BLOCK
      ?auto_842724 - BLOCK
      ?auto_842725 - BLOCK
      ?auto_842726 - BLOCK
      ?auto_842727 - BLOCK
      ?auto_842728 - BLOCK
      ?auto_842729 - BLOCK
      ?auto_842730 - BLOCK
      ?auto_842731 - BLOCK
      ?auto_842732 - BLOCK
      ?auto_842733 - BLOCK
      ?auto_842734 - BLOCK
      ?auto_842735 - BLOCK
      ?auto_842736 - BLOCK
    )
    :vars
    (
      ?auto_842737 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_842735 ) ( ON ?auto_842736 ?auto_842737 ) ( CLEAR ?auto_842736 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_842720 ) ( ON ?auto_842721 ?auto_842720 ) ( ON ?auto_842722 ?auto_842721 ) ( ON ?auto_842723 ?auto_842722 ) ( ON ?auto_842724 ?auto_842723 ) ( ON ?auto_842725 ?auto_842724 ) ( ON ?auto_842726 ?auto_842725 ) ( ON ?auto_842727 ?auto_842726 ) ( ON ?auto_842728 ?auto_842727 ) ( ON ?auto_842729 ?auto_842728 ) ( ON ?auto_842730 ?auto_842729 ) ( ON ?auto_842731 ?auto_842730 ) ( ON ?auto_842732 ?auto_842731 ) ( ON ?auto_842733 ?auto_842732 ) ( ON ?auto_842734 ?auto_842733 ) ( ON ?auto_842735 ?auto_842734 ) ( not ( = ?auto_842720 ?auto_842721 ) ) ( not ( = ?auto_842720 ?auto_842722 ) ) ( not ( = ?auto_842720 ?auto_842723 ) ) ( not ( = ?auto_842720 ?auto_842724 ) ) ( not ( = ?auto_842720 ?auto_842725 ) ) ( not ( = ?auto_842720 ?auto_842726 ) ) ( not ( = ?auto_842720 ?auto_842727 ) ) ( not ( = ?auto_842720 ?auto_842728 ) ) ( not ( = ?auto_842720 ?auto_842729 ) ) ( not ( = ?auto_842720 ?auto_842730 ) ) ( not ( = ?auto_842720 ?auto_842731 ) ) ( not ( = ?auto_842720 ?auto_842732 ) ) ( not ( = ?auto_842720 ?auto_842733 ) ) ( not ( = ?auto_842720 ?auto_842734 ) ) ( not ( = ?auto_842720 ?auto_842735 ) ) ( not ( = ?auto_842720 ?auto_842736 ) ) ( not ( = ?auto_842720 ?auto_842737 ) ) ( not ( = ?auto_842721 ?auto_842722 ) ) ( not ( = ?auto_842721 ?auto_842723 ) ) ( not ( = ?auto_842721 ?auto_842724 ) ) ( not ( = ?auto_842721 ?auto_842725 ) ) ( not ( = ?auto_842721 ?auto_842726 ) ) ( not ( = ?auto_842721 ?auto_842727 ) ) ( not ( = ?auto_842721 ?auto_842728 ) ) ( not ( = ?auto_842721 ?auto_842729 ) ) ( not ( = ?auto_842721 ?auto_842730 ) ) ( not ( = ?auto_842721 ?auto_842731 ) ) ( not ( = ?auto_842721 ?auto_842732 ) ) ( not ( = ?auto_842721 ?auto_842733 ) ) ( not ( = ?auto_842721 ?auto_842734 ) ) ( not ( = ?auto_842721 ?auto_842735 ) ) ( not ( = ?auto_842721 ?auto_842736 ) ) ( not ( = ?auto_842721 ?auto_842737 ) ) ( not ( = ?auto_842722 ?auto_842723 ) ) ( not ( = ?auto_842722 ?auto_842724 ) ) ( not ( = ?auto_842722 ?auto_842725 ) ) ( not ( = ?auto_842722 ?auto_842726 ) ) ( not ( = ?auto_842722 ?auto_842727 ) ) ( not ( = ?auto_842722 ?auto_842728 ) ) ( not ( = ?auto_842722 ?auto_842729 ) ) ( not ( = ?auto_842722 ?auto_842730 ) ) ( not ( = ?auto_842722 ?auto_842731 ) ) ( not ( = ?auto_842722 ?auto_842732 ) ) ( not ( = ?auto_842722 ?auto_842733 ) ) ( not ( = ?auto_842722 ?auto_842734 ) ) ( not ( = ?auto_842722 ?auto_842735 ) ) ( not ( = ?auto_842722 ?auto_842736 ) ) ( not ( = ?auto_842722 ?auto_842737 ) ) ( not ( = ?auto_842723 ?auto_842724 ) ) ( not ( = ?auto_842723 ?auto_842725 ) ) ( not ( = ?auto_842723 ?auto_842726 ) ) ( not ( = ?auto_842723 ?auto_842727 ) ) ( not ( = ?auto_842723 ?auto_842728 ) ) ( not ( = ?auto_842723 ?auto_842729 ) ) ( not ( = ?auto_842723 ?auto_842730 ) ) ( not ( = ?auto_842723 ?auto_842731 ) ) ( not ( = ?auto_842723 ?auto_842732 ) ) ( not ( = ?auto_842723 ?auto_842733 ) ) ( not ( = ?auto_842723 ?auto_842734 ) ) ( not ( = ?auto_842723 ?auto_842735 ) ) ( not ( = ?auto_842723 ?auto_842736 ) ) ( not ( = ?auto_842723 ?auto_842737 ) ) ( not ( = ?auto_842724 ?auto_842725 ) ) ( not ( = ?auto_842724 ?auto_842726 ) ) ( not ( = ?auto_842724 ?auto_842727 ) ) ( not ( = ?auto_842724 ?auto_842728 ) ) ( not ( = ?auto_842724 ?auto_842729 ) ) ( not ( = ?auto_842724 ?auto_842730 ) ) ( not ( = ?auto_842724 ?auto_842731 ) ) ( not ( = ?auto_842724 ?auto_842732 ) ) ( not ( = ?auto_842724 ?auto_842733 ) ) ( not ( = ?auto_842724 ?auto_842734 ) ) ( not ( = ?auto_842724 ?auto_842735 ) ) ( not ( = ?auto_842724 ?auto_842736 ) ) ( not ( = ?auto_842724 ?auto_842737 ) ) ( not ( = ?auto_842725 ?auto_842726 ) ) ( not ( = ?auto_842725 ?auto_842727 ) ) ( not ( = ?auto_842725 ?auto_842728 ) ) ( not ( = ?auto_842725 ?auto_842729 ) ) ( not ( = ?auto_842725 ?auto_842730 ) ) ( not ( = ?auto_842725 ?auto_842731 ) ) ( not ( = ?auto_842725 ?auto_842732 ) ) ( not ( = ?auto_842725 ?auto_842733 ) ) ( not ( = ?auto_842725 ?auto_842734 ) ) ( not ( = ?auto_842725 ?auto_842735 ) ) ( not ( = ?auto_842725 ?auto_842736 ) ) ( not ( = ?auto_842725 ?auto_842737 ) ) ( not ( = ?auto_842726 ?auto_842727 ) ) ( not ( = ?auto_842726 ?auto_842728 ) ) ( not ( = ?auto_842726 ?auto_842729 ) ) ( not ( = ?auto_842726 ?auto_842730 ) ) ( not ( = ?auto_842726 ?auto_842731 ) ) ( not ( = ?auto_842726 ?auto_842732 ) ) ( not ( = ?auto_842726 ?auto_842733 ) ) ( not ( = ?auto_842726 ?auto_842734 ) ) ( not ( = ?auto_842726 ?auto_842735 ) ) ( not ( = ?auto_842726 ?auto_842736 ) ) ( not ( = ?auto_842726 ?auto_842737 ) ) ( not ( = ?auto_842727 ?auto_842728 ) ) ( not ( = ?auto_842727 ?auto_842729 ) ) ( not ( = ?auto_842727 ?auto_842730 ) ) ( not ( = ?auto_842727 ?auto_842731 ) ) ( not ( = ?auto_842727 ?auto_842732 ) ) ( not ( = ?auto_842727 ?auto_842733 ) ) ( not ( = ?auto_842727 ?auto_842734 ) ) ( not ( = ?auto_842727 ?auto_842735 ) ) ( not ( = ?auto_842727 ?auto_842736 ) ) ( not ( = ?auto_842727 ?auto_842737 ) ) ( not ( = ?auto_842728 ?auto_842729 ) ) ( not ( = ?auto_842728 ?auto_842730 ) ) ( not ( = ?auto_842728 ?auto_842731 ) ) ( not ( = ?auto_842728 ?auto_842732 ) ) ( not ( = ?auto_842728 ?auto_842733 ) ) ( not ( = ?auto_842728 ?auto_842734 ) ) ( not ( = ?auto_842728 ?auto_842735 ) ) ( not ( = ?auto_842728 ?auto_842736 ) ) ( not ( = ?auto_842728 ?auto_842737 ) ) ( not ( = ?auto_842729 ?auto_842730 ) ) ( not ( = ?auto_842729 ?auto_842731 ) ) ( not ( = ?auto_842729 ?auto_842732 ) ) ( not ( = ?auto_842729 ?auto_842733 ) ) ( not ( = ?auto_842729 ?auto_842734 ) ) ( not ( = ?auto_842729 ?auto_842735 ) ) ( not ( = ?auto_842729 ?auto_842736 ) ) ( not ( = ?auto_842729 ?auto_842737 ) ) ( not ( = ?auto_842730 ?auto_842731 ) ) ( not ( = ?auto_842730 ?auto_842732 ) ) ( not ( = ?auto_842730 ?auto_842733 ) ) ( not ( = ?auto_842730 ?auto_842734 ) ) ( not ( = ?auto_842730 ?auto_842735 ) ) ( not ( = ?auto_842730 ?auto_842736 ) ) ( not ( = ?auto_842730 ?auto_842737 ) ) ( not ( = ?auto_842731 ?auto_842732 ) ) ( not ( = ?auto_842731 ?auto_842733 ) ) ( not ( = ?auto_842731 ?auto_842734 ) ) ( not ( = ?auto_842731 ?auto_842735 ) ) ( not ( = ?auto_842731 ?auto_842736 ) ) ( not ( = ?auto_842731 ?auto_842737 ) ) ( not ( = ?auto_842732 ?auto_842733 ) ) ( not ( = ?auto_842732 ?auto_842734 ) ) ( not ( = ?auto_842732 ?auto_842735 ) ) ( not ( = ?auto_842732 ?auto_842736 ) ) ( not ( = ?auto_842732 ?auto_842737 ) ) ( not ( = ?auto_842733 ?auto_842734 ) ) ( not ( = ?auto_842733 ?auto_842735 ) ) ( not ( = ?auto_842733 ?auto_842736 ) ) ( not ( = ?auto_842733 ?auto_842737 ) ) ( not ( = ?auto_842734 ?auto_842735 ) ) ( not ( = ?auto_842734 ?auto_842736 ) ) ( not ( = ?auto_842734 ?auto_842737 ) ) ( not ( = ?auto_842735 ?auto_842736 ) ) ( not ( = ?auto_842735 ?auto_842737 ) ) ( not ( = ?auto_842736 ?auto_842737 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_842736 ?auto_842737 )
      ( !STACK ?auto_842736 ?auto_842735 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_842790 - BLOCK
      ?auto_842791 - BLOCK
      ?auto_842792 - BLOCK
      ?auto_842793 - BLOCK
      ?auto_842794 - BLOCK
      ?auto_842795 - BLOCK
      ?auto_842796 - BLOCK
      ?auto_842797 - BLOCK
      ?auto_842798 - BLOCK
      ?auto_842799 - BLOCK
      ?auto_842800 - BLOCK
      ?auto_842801 - BLOCK
      ?auto_842802 - BLOCK
      ?auto_842803 - BLOCK
      ?auto_842804 - BLOCK
      ?auto_842805 - BLOCK
      ?auto_842806 - BLOCK
    )
    :vars
    (
      ?auto_842807 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_842806 ?auto_842807 ) ( ON-TABLE ?auto_842790 ) ( ON ?auto_842791 ?auto_842790 ) ( ON ?auto_842792 ?auto_842791 ) ( ON ?auto_842793 ?auto_842792 ) ( ON ?auto_842794 ?auto_842793 ) ( ON ?auto_842795 ?auto_842794 ) ( ON ?auto_842796 ?auto_842795 ) ( ON ?auto_842797 ?auto_842796 ) ( ON ?auto_842798 ?auto_842797 ) ( ON ?auto_842799 ?auto_842798 ) ( ON ?auto_842800 ?auto_842799 ) ( ON ?auto_842801 ?auto_842800 ) ( ON ?auto_842802 ?auto_842801 ) ( ON ?auto_842803 ?auto_842802 ) ( ON ?auto_842804 ?auto_842803 ) ( not ( = ?auto_842790 ?auto_842791 ) ) ( not ( = ?auto_842790 ?auto_842792 ) ) ( not ( = ?auto_842790 ?auto_842793 ) ) ( not ( = ?auto_842790 ?auto_842794 ) ) ( not ( = ?auto_842790 ?auto_842795 ) ) ( not ( = ?auto_842790 ?auto_842796 ) ) ( not ( = ?auto_842790 ?auto_842797 ) ) ( not ( = ?auto_842790 ?auto_842798 ) ) ( not ( = ?auto_842790 ?auto_842799 ) ) ( not ( = ?auto_842790 ?auto_842800 ) ) ( not ( = ?auto_842790 ?auto_842801 ) ) ( not ( = ?auto_842790 ?auto_842802 ) ) ( not ( = ?auto_842790 ?auto_842803 ) ) ( not ( = ?auto_842790 ?auto_842804 ) ) ( not ( = ?auto_842790 ?auto_842805 ) ) ( not ( = ?auto_842790 ?auto_842806 ) ) ( not ( = ?auto_842790 ?auto_842807 ) ) ( not ( = ?auto_842791 ?auto_842792 ) ) ( not ( = ?auto_842791 ?auto_842793 ) ) ( not ( = ?auto_842791 ?auto_842794 ) ) ( not ( = ?auto_842791 ?auto_842795 ) ) ( not ( = ?auto_842791 ?auto_842796 ) ) ( not ( = ?auto_842791 ?auto_842797 ) ) ( not ( = ?auto_842791 ?auto_842798 ) ) ( not ( = ?auto_842791 ?auto_842799 ) ) ( not ( = ?auto_842791 ?auto_842800 ) ) ( not ( = ?auto_842791 ?auto_842801 ) ) ( not ( = ?auto_842791 ?auto_842802 ) ) ( not ( = ?auto_842791 ?auto_842803 ) ) ( not ( = ?auto_842791 ?auto_842804 ) ) ( not ( = ?auto_842791 ?auto_842805 ) ) ( not ( = ?auto_842791 ?auto_842806 ) ) ( not ( = ?auto_842791 ?auto_842807 ) ) ( not ( = ?auto_842792 ?auto_842793 ) ) ( not ( = ?auto_842792 ?auto_842794 ) ) ( not ( = ?auto_842792 ?auto_842795 ) ) ( not ( = ?auto_842792 ?auto_842796 ) ) ( not ( = ?auto_842792 ?auto_842797 ) ) ( not ( = ?auto_842792 ?auto_842798 ) ) ( not ( = ?auto_842792 ?auto_842799 ) ) ( not ( = ?auto_842792 ?auto_842800 ) ) ( not ( = ?auto_842792 ?auto_842801 ) ) ( not ( = ?auto_842792 ?auto_842802 ) ) ( not ( = ?auto_842792 ?auto_842803 ) ) ( not ( = ?auto_842792 ?auto_842804 ) ) ( not ( = ?auto_842792 ?auto_842805 ) ) ( not ( = ?auto_842792 ?auto_842806 ) ) ( not ( = ?auto_842792 ?auto_842807 ) ) ( not ( = ?auto_842793 ?auto_842794 ) ) ( not ( = ?auto_842793 ?auto_842795 ) ) ( not ( = ?auto_842793 ?auto_842796 ) ) ( not ( = ?auto_842793 ?auto_842797 ) ) ( not ( = ?auto_842793 ?auto_842798 ) ) ( not ( = ?auto_842793 ?auto_842799 ) ) ( not ( = ?auto_842793 ?auto_842800 ) ) ( not ( = ?auto_842793 ?auto_842801 ) ) ( not ( = ?auto_842793 ?auto_842802 ) ) ( not ( = ?auto_842793 ?auto_842803 ) ) ( not ( = ?auto_842793 ?auto_842804 ) ) ( not ( = ?auto_842793 ?auto_842805 ) ) ( not ( = ?auto_842793 ?auto_842806 ) ) ( not ( = ?auto_842793 ?auto_842807 ) ) ( not ( = ?auto_842794 ?auto_842795 ) ) ( not ( = ?auto_842794 ?auto_842796 ) ) ( not ( = ?auto_842794 ?auto_842797 ) ) ( not ( = ?auto_842794 ?auto_842798 ) ) ( not ( = ?auto_842794 ?auto_842799 ) ) ( not ( = ?auto_842794 ?auto_842800 ) ) ( not ( = ?auto_842794 ?auto_842801 ) ) ( not ( = ?auto_842794 ?auto_842802 ) ) ( not ( = ?auto_842794 ?auto_842803 ) ) ( not ( = ?auto_842794 ?auto_842804 ) ) ( not ( = ?auto_842794 ?auto_842805 ) ) ( not ( = ?auto_842794 ?auto_842806 ) ) ( not ( = ?auto_842794 ?auto_842807 ) ) ( not ( = ?auto_842795 ?auto_842796 ) ) ( not ( = ?auto_842795 ?auto_842797 ) ) ( not ( = ?auto_842795 ?auto_842798 ) ) ( not ( = ?auto_842795 ?auto_842799 ) ) ( not ( = ?auto_842795 ?auto_842800 ) ) ( not ( = ?auto_842795 ?auto_842801 ) ) ( not ( = ?auto_842795 ?auto_842802 ) ) ( not ( = ?auto_842795 ?auto_842803 ) ) ( not ( = ?auto_842795 ?auto_842804 ) ) ( not ( = ?auto_842795 ?auto_842805 ) ) ( not ( = ?auto_842795 ?auto_842806 ) ) ( not ( = ?auto_842795 ?auto_842807 ) ) ( not ( = ?auto_842796 ?auto_842797 ) ) ( not ( = ?auto_842796 ?auto_842798 ) ) ( not ( = ?auto_842796 ?auto_842799 ) ) ( not ( = ?auto_842796 ?auto_842800 ) ) ( not ( = ?auto_842796 ?auto_842801 ) ) ( not ( = ?auto_842796 ?auto_842802 ) ) ( not ( = ?auto_842796 ?auto_842803 ) ) ( not ( = ?auto_842796 ?auto_842804 ) ) ( not ( = ?auto_842796 ?auto_842805 ) ) ( not ( = ?auto_842796 ?auto_842806 ) ) ( not ( = ?auto_842796 ?auto_842807 ) ) ( not ( = ?auto_842797 ?auto_842798 ) ) ( not ( = ?auto_842797 ?auto_842799 ) ) ( not ( = ?auto_842797 ?auto_842800 ) ) ( not ( = ?auto_842797 ?auto_842801 ) ) ( not ( = ?auto_842797 ?auto_842802 ) ) ( not ( = ?auto_842797 ?auto_842803 ) ) ( not ( = ?auto_842797 ?auto_842804 ) ) ( not ( = ?auto_842797 ?auto_842805 ) ) ( not ( = ?auto_842797 ?auto_842806 ) ) ( not ( = ?auto_842797 ?auto_842807 ) ) ( not ( = ?auto_842798 ?auto_842799 ) ) ( not ( = ?auto_842798 ?auto_842800 ) ) ( not ( = ?auto_842798 ?auto_842801 ) ) ( not ( = ?auto_842798 ?auto_842802 ) ) ( not ( = ?auto_842798 ?auto_842803 ) ) ( not ( = ?auto_842798 ?auto_842804 ) ) ( not ( = ?auto_842798 ?auto_842805 ) ) ( not ( = ?auto_842798 ?auto_842806 ) ) ( not ( = ?auto_842798 ?auto_842807 ) ) ( not ( = ?auto_842799 ?auto_842800 ) ) ( not ( = ?auto_842799 ?auto_842801 ) ) ( not ( = ?auto_842799 ?auto_842802 ) ) ( not ( = ?auto_842799 ?auto_842803 ) ) ( not ( = ?auto_842799 ?auto_842804 ) ) ( not ( = ?auto_842799 ?auto_842805 ) ) ( not ( = ?auto_842799 ?auto_842806 ) ) ( not ( = ?auto_842799 ?auto_842807 ) ) ( not ( = ?auto_842800 ?auto_842801 ) ) ( not ( = ?auto_842800 ?auto_842802 ) ) ( not ( = ?auto_842800 ?auto_842803 ) ) ( not ( = ?auto_842800 ?auto_842804 ) ) ( not ( = ?auto_842800 ?auto_842805 ) ) ( not ( = ?auto_842800 ?auto_842806 ) ) ( not ( = ?auto_842800 ?auto_842807 ) ) ( not ( = ?auto_842801 ?auto_842802 ) ) ( not ( = ?auto_842801 ?auto_842803 ) ) ( not ( = ?auto_842801 ?auto_842804 ) ) ( not ( = ?auto_842801 ?auto_842805 ) ) ( not ( = ?auto_842801 ?auto_842806 ) ) ( not ( = ?auto_842801 ?auto_842807 ) ) ( not ( = ?auto_842802 ?auto_842803 ) ) ( not ( = ?auto_842802 ?auto_842804 ) ) ( not ( = ?auto_842802 ?auto_842805 ) ) ( not ( = ?auto_842802 ?auto_842806 ) ) ( not ( = ?auto_842802 ?auto_842807 ) ) ( not ( = ?auto_842803 ?auto_842804 ) ) ( not ( = ?auto_842803 ?auto_842805 ) ) ( not ( = ?auto_842803 ?auto_842806 ) ) ( not ( = ?auto_842803 ?auto_842807 ) ) ( not ( = ?auto_842804 ?auto_842805 ) ) ( not ( = ?auto_842804 ?auto_842806 ) ) ( not ( = ?auto_842804 ?auto_842807 ) ) ( not ( = ?auto_842805 ?auto_842806 ) ) ( not ( = ?auto_842805 ?auto_842807 ) ) ( not ( = ?auto_842806 ?auto_842807 ) ) ( CLEAR ?auto_842804 ) ( ON ?auto_842805 ?auto_842806 ) ( CLEAR ?auto_842805 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-16PILE ?auto_842790 ?auto_842791 ?auto_842792 ?auto_842793 ?auto_842794 ?auto_842795 ?auto_842796 ?auto_842797 ?auto_842798 ?auto_842799 ?auto_842800 ?auto_842801 ?auto_842802 ?auto_842803 ?auto_842804 ?auto_842805 )
      ( MAKE-17PILE ?auto_842790 ?auto_842791 ?auto_842792 ?auto_842793 ?auto_842794 ?auto_842795 ?auto_842796 ?auto_842797 ?auto_842798 ?auto_842799 ?auto_842800 ?auto_842801 ?auto_842802 ?auto_842803 ?auto_842804 ?auto_842805 ?auto_842806 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_842860 - BLOCK
      ?auto_842861 - BLOCK
      ?auto_842862 - BLOCK
      ?auto_842863 - BLOCK
      ?auto_842864 - BLOCK
      ?auto_842865 - BLOCK
      ?auto_842866 - BLOCK
      ?auto_842867 - BLOCK
      ?auto_842868 - BLOCK
      ?auto_842869 - BLOCK
      ?auto_842870 - BLOCK
      ?auto_842871 - BLOCK
      ?auto_842872 - BLOCK
      ?auto_842873 - BLOCK
      ?auto_842874 - BLOCK
      ?auto_842875 - BLOCK
      ?auto_842876 - BLOCK
    )
    :vars
    (
      ?auto_842877 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_842876 ?auto_842877 ) ( ON-TABLE ?auto_842860 ) ( ON ?auto_842861 ?auto_842860 ) ( ON ?auto_842862 ?auto_842861 ) ( ON ?auto_842863 ?auto_842862 ) ( ON ?auto_842864 ?auto_842863 ) ( ON ?auto_842865 ?auto_842864 ) ( ON ?auto_842866 ?auto_842865 ) ( ON ?auto_842867 ?auto_842866 ) ( ON ?auto_842868 ?auto_842867 ) ( ON ?auto_842869 ?auto_842868 ) ( ON ?auto_842870 ?auto_842869 ) ( ON ?auto_842871 ?auto_842870 ) ( ON ?auto_842872 ?auto_842871 ) ( ON ?auto_842873 ?auto_842872 ) ( not ( = ?auto_842860 ?auto_842861 ) ) ( not ( = ?auto_842860 ?auto_842862 ) ) ( not ( = ?auto_842860 ?auto_842863 ) ) ( not ( = ?auto_842860 ?auto_842864 ) ) ( not ( = ?auto_842860 ?auto_842865 ) ) ( not ( = ?auto_842860 ?auto_842866 ) ) ( not ( = ?auto_842860 ?auto_842867 ) ) ( not ( = ?auto_842860 ?auto_842868 ) ) ( not ( = ?auto_842860 ?auto_842869 ) ) ( not ( = ?auto_842860 ?auto_842870 ) ) ( not ( = ?auto_842860 ?auto_842871 ) ) ( not ( = ?auto_842860 ?auto_842872 ) ) ( not ( = ?auto_842860 ?auto_842873 ) ) ( not ( = ?auto_842860 ?auto_842874 ) ) ( not ( = ?auto_842860 ?auto_842875 ) ) ( not ( = ?auto_842860 ?auto_842876 ) ) ( not ( = ?auto_842860 ?auto_842877 ) ) ( not ( = ?auto_842861 ?auto_842862 ) ) ( not ( = ?auto_842861 ?auto_842863 ) ) ( not ( = ?auto_842861 ?auto_842864 ) ) ( not ( = ?auto_842861 ?auto_842865 ) ) ( not ( = ?auto_842861 ?auto_842866 ) ) ( not ( = ?auto_842861 ?auto_842867 ) ) ( not ( = ?auto_842861 ?auto_842868 ) ) ( not ( = ?auto_842861 ?auto_842869 ) ) ( not ( = ?auto_842861 ?auto_842870 ) ) ( not ( = ?auto_842861 ?auto_842871 ) ) ( not ( = ?auto_842861 ?auto_842872 ) ) ( not ( = ?auto_842861 ?auto_842873 ) ) ( not ( = ?auto_842861 ?auto_842874 ) ) ( not ( = ?auto_842861 ?auto_842875 ) ) ( not ( = ?auto_842861 ?auto_842876 ) ) ( not ( = ?auto_842861 ?auto_842877 ) ) ( not ( = ?auto_842862 ?auto_842863 ) ) ( not ( = ?auto_842862 ?auto_842864 ) ) ( not ( = ?auto_842862 ?auto_842865 ) ) ( not ( = ?auto_842862 ?auto_842866 ) ) ( not ( = ?auto_842862 ?auto_842867 ) ) ( not ( = ?auto_842862 ?auto_842868 ) ) ( not ( = ?auto_842862 ?auto_842869 ) ) ( not ( = ?auto_842862 ?auto_842870 ) ) ( not ( = ?auto_842862 ?auto_842871 ) ) ( not ( = ?auto_842862 ?auto_842872 ) ) ( not ( = ?auto_842862 ?auto_842873 ) ) ( not ( = ?auto_842862 ?auto_842874 ) ) ( not ( = ?auto_842862 ?auto_842875 ) ) ( not ( = ?auto_842862 ?auto_842876 ) ) ( not ( = ?auto_842862 ?auto_842877 ) ) ( not ( = ?auto_842863 ?auto_842864 ) ) ( not ( = ?auto_842863 ?auto_842865 ) ) ( not ( = ?auto_842863 ?auto_842866 ) ) ( not ( = ?auto_842863 ?auto_842867 ) ) ( not ( = ?auto_842863 ?auto_842868 ) ) ( not ( = ?auto_842863 ?auto_842869 ) ) ( not ( = ?auto_842863 ?auto_842870 ) ) ( not ( = ?auto_842863 ?auto_842871 ) ) ( not ( = ?auto_842863 ?auto_842872 ) ) ( not ( = ?auto_842863 ?auto_842873 ) ) ( not ( = ?auto_842863 ?auto_842874 ) ) ( not ( = ?auto_842863 ?auto_842875 ) ) ( not ( = ?auto_842863 ?auto_842876 ) ) ( not ( = ?auto_842863 ?auto_842877 ) ) ( not ( = ?auto_842864 ?auto_842865 ) ) ( not ( = ?auto_842864 ?auto_842866 ) ) ( not ( = ?auto_842864 ?auto_842867 ) ) ( not ( = ?auto_842864 ?auto_842868 ) ) ( not ( = ?auto_842864 ?auto_842869 ) ) ( not ( = ?auto_842864 ?auto_842870 ) ) ( not ( = ?auto_842864 ?auto_842871 ) ) ( not ( = ?auto_842864 ?auto_842872 ) ) ( not ( = ?auto_842864 ?auto_842873 ) ) ( not ( = ?auto_842864 ?auto_842874 ) ) ( not ( = ?auto_842864 ?auto_842875 ) ) ( not ( = ?auto_842864 ?auto_842876 ) ) ( not ( = ?auto_842864 ?auto_842877 ) ) ( not ( = ?auto_842865 ?auto_842866 ) ) ( not ( = ?auto_842865 ?auto_842867 ) ) ( not ( = ?auto_842865 ?auto_842868 ) ) ( not ( = ?auto_842865 ?auto_842869 ) ) ( not ( = ?auto_842865 ?auto_842870 ) ) ( not ( = ?auto_842865 ?auto_842871 ) ) ( not ( = ?auto_842865 ?auto_842872 ) ) ( not ( = ?auto_842865 ?auto_842873 ) ) ( not ( = ?auto_842865 ?auto_842874 ) ) ( not ( = ?auto_842865 ?auto_842875 ) ) ( not ( = ?auto_842865 ?auto_842876 ) ) ( not ( = ?auto_842865 ?auto_842877 ) ) ( not ( = ?auto_842866 ?auto_842867 ) ) ( not ( = ?auto_842866 ?auto_842868 ) ) ( not ( = ?auto_842866 ?auto_842869 ) ) ( not ( = ?auto_842866 ?auto_842870 ) ) ( not ( = ?auto_842866 ?auto_842871 ) ) ( not ( = ?auto_842866 ?auto_842872 ) ) ( not ( = ?auto_842866 ?auto_842873 ) ) ( not ( = ?auto_842866 ?auto_842874 ) ) ( not ( = ?auto_842866 ?auto_842875 ) ) ( not ( = ?auto_842866 ?auto_842876 ) ) ( not ( = ?auto_842866 ?auto_842877 ) ) ( not ( = ?auto_842867 ?auto_842868 ) ) ( not ( = ?auto_842867 ?auto_842869 ) ) ( not ( = ?auto_842867 ?auto_842870 ) ) ( not ( = ?auto_842867 ?auto_842871 ) ) ( not ( = ?auto_842867 ?auto_842872 ) ) ( not ( = ?auto_842867 ?auto_842873 ) ) ( not ( = ?auto_842867 ?auto_842874 ) ) ( not ( = ?auto_842867 ?auto_842875 ) ) ( not ( = ?auto_842867 ?auto_842876 ) ) ( not ( = ?auto_842867 ?auto_842877 ) ) ( not ( = ?auto_842868 ?auto_842869 ) ) ( not ( = ?auto_842868 ?auto_842870 ) ) ( not ( = ?auto_842868 ?auto_842871 ) ) ( not ( = ?auto_842868 ?auto_842872 ) ) ( not ( = ?auto_842868 ?auto_842873 ) ) ( not ( = ?auto_842868 ?auto_842874 ) ) ( not ( = ?auto_842868 ?auto_842875 ) ) ( not ( = ?auto_842868 ?auto_842876 ) ) ( not ( = ?auto_842868 ?auto_842877 ) ) ( not ( = ?auto_842869 ?auto_842870 ) ) ( not ( = ?auto_842869 ?auto_842871 ) ) ( not ( = ?auto_842869 ?auto_842872 ) ) ( not ( = ?auto_842869 ?auto_842873 ) ) ( not ( = ?auto_842869 ?auto_842874 ) ) ( not ( = ?auto_842869 ?auto_842875 ) ) ( not ( = ?auto_842869 ?auto_842876 ) ) ( not ( = ?auto_842869 ?auto_842877 ) ) ( not ( = ?auto_842870 ?auto_842871 ) ) ( not ( = ?auto_842870 ?auto_842872 ) ) ( not ( = ?auto_842870 ?auto_842873 ) ) ( not ( = ?auto_842870 ?auto_842874 ) ) ( not ( = ?auto_842870 ?auto_842875 ) ) ( not ( = ?auto_842870 ?auto_842876 ) ) ( not ( = ?auto_842870 ?auto_842877 ) ) ( not ( = ?auto_842871 ?auto_842872 ) ) ( not ( = ?auto_842871 ?auto_842873 ) ) ( not ( = ?auto_842871 ?auto_842874 ) ) ( not ( = ?auto_842871 ?auto_842875 ) ) ( not ( = ?auto_842871 ?auto_842876 ) ) ( not ( = ?auto_842871 ?auto_842877 ) ) ( not ( = ?auto_842872 ?auto_842873 ) ) ( not ( = ?auto_842872 ?auto_842874 ) ) ( not ( = ?auto_842872 ?auto_842875 ) ) ( not ( = ?auto_842872 ?auto_842876 ) ) ( not ( = ?auto_842872 ?auto_842877 ) ) ( not ( = ?auto_842873 ?auto_842874 ) ) ( not ( = ?auto_842873 ?auto_842875 ) ) ( not ( = ?auto_842873 ?auto_842876 ) ) ( not ( = ?auto_842873 ?auto_842877 ) ) ( not ( = ?auto_842874 ?auto_842875 ) ) ( not ( = ?auto_842874 ?auto_842876 ) ) ( not ( = ?auto_842874 ?auto_842877 ) ) ( not ( = ?auto_842875 ?auto_842876 ) ) ( not ( = ?auto_842875 ?auto_842877 ) ) ( not ( = ?auto_842876 ?auto_842877 ) ) ( ON ?auto_842875 ?auto_842876 ) ( CLEAR ?auto_842873 ) ( ON ?auto_842874 ?auto_842875 ) ( CLEAR ?auto_842874 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-15PILE ?auto_842860 ?auto_842861 ?auto_842862 ?auto_842863 ?auto_842864 ?auto_842865 ?auto_842866 ?auto_842867 ?auto_842868 ?auto_842869 ?auto_842870 ?auto_842871 ?auto_842872 ?auto_842873 ?auto_842874 )
      ( MAKE-17PILE ?auto_842860 ?auto_842861 ?auto_842862 ?auto_842863 ?auto_842864 ?auto_842865 ?auto_842866 ?auto_842867 ?auto_842868 ?auto_842869 ?auto_842870 ?auto_842871 ?auto_842872 ?auto_842873 ?auto_842874 ?auto_842875 ?auto_842876 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_842930 - BLOCK
      ?auto_842931 - BLOCK
      ?auto_842932 - BLOCK
      ?auto_842933 - BLOCK
      ?auto_842934 - BLOCK
      ?auto_842935 - BLOCK
      ?auto_842936 - BLOCK
      ?auto_842937 - BLOCK
      ?auto_842938 - BLOCK
      ?auto_842939 - BLOCK
      ?auto_842940 - BLOCK
      ?auto_842941 - BLOCK
      ?auto_842942 - BLOCK
      ?auto_842943 - BLOCK
      ?auto_842944 - BLOCK
      ?auto_842945 - BLOCK
      ?auto_842946 - BLOCK
    )
    :vars
    (
      ?auto_842947 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_842946 ?auto_842947 ) ( ON-TABLE ?auto_842930 ) ( ON ?auto_842931 ?auto_842930 ) ( ON ?auto_842932 ?auto_842931 ) ( ON ?auto_842933 ?auto_842932 ) ( ON ?auto_842934 ?auto_842933 ) ( ON ?auto_842935 ?auto_842934 ) ( ON ?auto_842936 ?auto_842935 ) ( ON ?auto_842937 ?auto_842936 ) ( ON ?auto_842938 ?auto_842937 ) ( ON ?auto_842939 ?auto_842938 ) ( ON ?auto_842940 ?auto_842939 ) ( ON ?auto_842941 ?auto_842940 ) ( ON ?auto_842942 ?auto_842941 ) ( not ( = ?auto_842930 ?auto_842931 ) ) ( not ( = ?auto_842930 ?auto_842932 ) ) ( not ( = ?auto_842930 ?auto_842933 ) ) ( not ( = ?auto_842930 ?auto_842934 ) ) ( not ( = ?auto_842930 ?auto_842935 ) ) ( not ( = ?auto_842930 ?auto_842936 ) ) ( not ( = ?auto_842930 ?auto_842937 ) ) ( not ( = ?auto_842930 ?auto_842938 ) ) ( not ( = ?auto_842930 ?auto_842939 ) ) ( not ( = ?auto_842930 ?auto_842940 ) ) ( not ( = ?auto_842930 ?auto_842941 ) ) ( not ( = ?auto_842930 ?auto_842942 ) ) ( not ( = ?auto_842930 ?auto_842943 ) ) ( not ( = ?auto_842930 ?auto_842944 ) ) ( not ( = ?auto_842930 ?auto_842945 ) ) ( not ( = ?auto_842930 ?auto_842946 ) ) ( not ( = ?auto_842930 ?auto_842947 ) ) ( not ( = ?auto_842931 ?auto_842932 ) ) ( not ( = ?auto_842931 ?auto_842933 ) ) ( not ( = ?auto_842931 ?auto_842934 ) ) ( not ( = ?auto_842931 ?auto_842935 ) ) ( not ( = ?auto_842931 ?auto_842936 ) ) ( not ( = ?auto_842931 ?auto_842937 ) ) ( not ( = ?auto_842931 ?auto_842938 ) ) ( not ( = ?auto_842931 ?auto_842939 ) ) ( not ( = ?auto_842931 ?auto_842940 ) ) ( not ( = ?auto_842931 ?auto_842941 ) ) ( not ( = ?auto_842931 ?auto_842942 ) ) ( not ( = ?auto_842931 ?auto_842943 ) ) ( not ( = ?auto_842931 ?auto_842944 ) ) ( not ( = ?auto_842931 ?auto_842945 ) ) ( not ( = ?auto_842931 ?auto_842946 ) ) ( not ( = ?auto_842931 ?auto_842947 ) ) ( not ( = ?auto_842932 ?auto_842933 ) ) ( not ( = ?auto_842932 ?auto_842934 ) ) ( not ( = ?auto_842932 ?auto_842935 ) ) ( not ( = ?auto_842932 ?auto_842936 ) ) ( not ( = ?auto_842932 ?auto_842937 ) ) ( not ( = ?auto_842932 ?auto_842938 ) ) ( not ( = ?auto_842932 ?auto_842939 ) ) ( not ( = ?auto_842932 ?auto_842940 ) ) ( not ( = ?auto_842932 ?auto_842941 ) ) ( not ( = ?auto_842932 ?auto_842942 ) ) ( not ( = ?auto_842932 ?auto_842943 ) ) ( not ( = ?auto_842932 ?auto_842944 ) ) ( not ( = ?auto_842932 ?auto_842945 ) ) ( not ( = ?auto_842932 ?auto_842946 ) ) ( not ( = ?auto_842932 ?auto_842947 ) ) ( not ( = ?auto_842933 ?auto_842934 ) ) ( not ( = ?auto_842933 ?auto_842935 ) ) ( not ( = ?auto_842933 ?auto_842936 ) ) ( not ( = ?auto_842933 ?auto_842937 ) ) ( not ( = ?auto_842933 ?auto_842938 ) ) ( not ( = ?auto_842933 ?auto_842939 ) ) ( not ( = ?auto_842933 ?auto_842940 ) ) ( not ( = ?auto_842933 ?auto_842941 ) ) ( not ( = ?auto_842933 ?auto_842942 ) ) ( not ( = ?auto_842933 ?auto_842943 ) ) ( not ( = ?auto_842933 ?auto_842944 ) ) ( not ( = ?auto_842933 ?auto_842945 ) ) ( not ( = ?auto_842933 ?auto_842946 ) ) ( not ( = ?auto_842933 ?auto_842947 ) ) ( not ( = ?auto_842934 ?auto_842935 ) ) ( not ( = ?auto_842934 ?auto_842936 ) ) ( not ( = ?auto_842934 ?auto_842937 ) ) ( not ( = ?auto_842934 ?auto_842938 ) ) ( not ( = ?auto_842934 ?auto_842939 ) ) ( not ( = ?auto_842934 ?auto_842940 ) ) ( not ( = ?auto_842934 ?auto_842941 ) ) ( not ( = ?auto_842934 ?auto_842942 ) ) ( not ( = ?auto_842934 ?auto_842943 ) ) ( not ( = ?auto_842934 ?auto_842944 ) ) ( not ( = ?auto_842934 ?auto_842945 ) ) ( not ( = ?auto_842934 ?auto_842946 ) ) ( not ( = ?auto_842934 ?auto_842947 ) ) ( not ( = ?auto_842935 ?auto_842936 ) ) ( not ( = ?auto_842935 ?auto_842937 ) ) ( not ( = ?auto_842935 ?auto_842938 ) ) ( not ( = ?auto_842935 ?auto_842939 ) ) ( not ( = ?auto_842935 ?auto_842940 ) ) ( not ( = ?auto_842935 ?auto_842941 ) ) ( not ( = ?auto_842935 ?auto_842942 ) ) ( not ( = ?auto_842935 ?auto_842943 ) ) ( not ( = ?auto_842935 ?auto_842944 ) ) ( not ( = ?auto_842935 ?auto_842945 ) ) ( not ( = ?auto_842935 ?auto_842946 ) ) ( not ( = ?auto_842935 ?auto_842947 ) ) ( not ( = ?auto_842936 ?auto_842937 ) ) ( not ( = ?auto_842936 ?auto_842938 ) ) ( not ( = ?auto_842936 ?auto_842939 ) ) ( not ( = ?auto_842936 ?auto_842940 ) ) ( not ( = ?auto_842936 ?auto_842941 ) ) ( not ( = ?auto_842936 ?auto_842942 ) ) ( not ( = ?auto_842936 ?auto_842943 ) ) ( not ( = ?auto_842936 ?auto_842944 ) ) ( not ( = ?auto_842936 ?auto_842945 ) ) ( not ( = ?auto_842936 ?auto_842946 ) ) ( not ( = ?auto_842936 ?auto_842947 ) ) ( not ( = ?auto_842937 ?auto_842938 ) ) ( not ( = ?auto_842937 ?auto_842939 ) ) ( not ( = ?auto_842937 ?auto_842940 ) ) ( not ( = ?auto_842937 ?auto_842941 ) ) ( not ( = ?auto_842937 ?auto_842942 ) ) ( not ( = ?auto_842937 ?auto_842943 ) ) ( not ( = ?auto_842937 ?auto_842944 ) ) ( not ( = ?auto_842937 ?auto_842945 ) ) ( not ( = ?auto_842937 ?auto_842946 ) ) ( not ( = ?auto_842937 ?auto_842947 ) ) ( not ( = ?auto_842938 ?auto_842939 ) ) ( not ( = ?auto_842938 ?auto_842940 ) ) ( not ( = ?auto_842938 ?auto_842941 ) ) ( not ( = ?auto_842938 ?auto_842942 ) ) ( not ( = ?auto_842938 ?auto_842943 ) ) ( not ( = ?auto_842938 ?auto_842944 ) ) ( not ( = ?auto_842938 ?auto_842945 ) ) ( not ( = ?auto_842938 ?auto_842946 ) ) ( not ( = ?auto_842938 ?auto_842947 ) ) ( not ( = ?auto_842939 ?auto_842940 ) ) ( not ( = ?auto_842939 ?auto_842941 ) ) ( not ( = ?auto_842939 ?auto_842942 ) ) ( not ( = ?auto_842939 ?auto_842943 ) ) ( not ( = ?auto_842939 ?auto_842944 ) ) ( not ( = ?auto_842939 ?auto_842945 ) ) ( not ( = ?auto_842939 ?auto_842946 ) ) ( not ( = ?auto_842939 ?auto_842947 ) ) ( not ( = ?auto_842940 ?auto_842941 ) ) ( not ( = ?auto_842940 ?auto_842942 ) ) ( not ( = ?auto_842940 ?auto_842943 ) ) ( not ( = ?auto_842940 ?auto_842944 ) ) ( not ( = ?auto_842940 ?auto_842945 ) ) ( not ( = ?auto_842940 ?auto_842946 ) ) ( not ( = ?auto_842940 ?auto_842947 ) ) ( not ( = ?auto_842941 ?auto_842942 ) ) ( not ( = ?auto_842941 ?auto_842943 ) ) ( not ( = ?auto_842941 ?auto_842944 ) ) ( not ( = ?auto_842941 ?auto_842945 ) ) ( not ( = ?auto_842941 ?auto_842946 ) ) ( not ( = ?auto_842941 ?auto_842947 ) ) ( not ( = ?auto_842942 ?auto_842943 ) ) ( not ( = ?auto_842942 ?auto_842944 ) ) ( not ( = ?auto_842942 ?auto_842945 ) ) ( not ( = ?auto_842942 ?auto_842946 ) ) ( not ( = ?auto_842942 ?auto_842947 ) ) ( not ( = ?auto_842943 ?auto_842944 ) ) ( not ( = ?auto_842943 ?auto_842945 ) ) ( not ( = ?auto_842943 ?auto_842946 ) ) ( not ( = ?auto_842943 ?auto_842947 ) ) ( not ( = ?auto_842944 ?auto_842945 ) ) ( not ( = ?auto_842944 ?auto_842946 ) ) ( not ( = ?auto_842944 ?auto_842947 ) ) ( not ( = ?auto_842945 ?auto_842946 ) ) ( not ( = ?auto_842945 ?auto_842947 ) ) ( not ( = ?auto_842946 ?auto_842947 ) ) ( ON ?auto_842945 ?auto_842946 ) ( ON ?auto_842944 ?auto_842945 ) ( CLEAR ?auto_842942 ) ( ON ?auto_842943 ?auto_842944 ) ( CLEAR ?auto_842943 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_842930 ?auto_842931 ?auto_842932 ?auto_842933 ?auto_842934 ?auto_842935 ?auto_842936 ?auto_842937 ?auto_842938 ?auto_842939 ?auto_842940 ?auto_842941 ?auto_842942 ?auto_842943 )
      ( MAKE-17PILE ?auto_842930 ?auto_842931 ?auto_842932 ?auto_842933 ?auto_842934 ?auto_842935 ?auto_842936 ?auto_842937 ?auto_842938 ?auto_842939 ?auto_842940 ?auto_842941 ?auto_842942 ?auto_842943 ?auto_842944 ?auto_842945 ?auto_842946 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_843000 - BLOCK
      ?auto_843001 - BLOCK
      ?auto_843002 - BLOCK
      ?auto_843003 - BLOCK
      ?auto_843004 - BLOCK
      ?auto_843005 - BLOCK
      ?auto_843006 - BLOCK
      ?auto_843007 - BLOCK
      ?auto_843008 - BLOCK
      ?auto_843009 - BLOCK
      ?auto_843010 - BLOCK
      ?auto_843011 - BLOCK
      ?auto_843012 - BLOCK
      ?auto_843013 - BLOCK
      ?auto_843014 - BLOCK
      ?auto_843015 - BLOCK
      ?auto_843016 - BLOCK
    )
    :vars
    (
      ?auto_843017 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_843016 ?auto_843017 ) ( ON-TABLE ?auto_843000 ) ( ON ?auto_843001 ?auto_843000 ) ( ON ?auto_843002 ?auto_843001 ) ( ON ?auto_843003 ?auto_843002 ) ( ON ?auto_843004 ?auto_843003 ) ( ON ?auto_843005 ?auto_843004 ) ( ON ?auto_843006 ?auto_843005 ) ( ON ?auto_843007 ?auto_843006 ) ( ON ?auto_843008 ?auto_843007 ) ( ON ?auto_843009 ?auto_843008 ) ( ON ?auto_843010 ?auto_843009 ) ( ON ?auto_843011 ?auto_843010 ) ( not ( = ?auto_843000 ?auto_843001 ) ) ( not ( = ?auto_843000 ?auto_843002 ) ) ( not ( = ?auto_843000 ?auto_843003 ) ) ( not ( = ?auto_843000 ?auto_843004 ) ) ( not ( = ?auto_843000 ?auto_843005 ) ) ( not ( = ?auto_843000 ?auto_843006 ) ) ( not ( = ?auto_843000 ?auto_843007 ) ) ( not ( = ?auto_843000 ?auto_843008 ) ) ( not ( = ?auto_843000 ?auto_843009 ) ) ( not ( = ?auto_843000 ?auto_843010 ) ) ( not ( = ?auto_843000 ?auto_843011 ) ) ( not ( = ?auto_843000 ?auto_843012 ) ) ( not ( = ?auto_843000 ?auto_843013 ) ) ( not ( = ?auto_843000 ?auto_843014 ) ) ( not ( = ?auto_843000 ?auto_843015 ) ) ( not ( = ?auto_843000 ?auto_843016 ) ) ( not ( = ?auto_843000 ?auto_843017 ) ) ( not ( = ?auto_843001 ?auto_843002 ) ) ( not ( = ?auto_843001 ?auto_843003 ) ) ( not ( = ?auto_843001 ?auto_843004 ) ) ( not ( = ?auto_843001 ?auto_843005 ) ) ( not ( = ?auto_843001 ?auto_843006 ) ) ( not ( = ?auto_843001 ?auto_843007 ) ) ( not ( = ?auto_843001 ?auto_843008 ) ) ( not ( = ?auto_843001 ?auto_843009 ) ) ( not ( = ?auto_843001 ?auto_843010 ) ) ( not ( = ?auto_843001 ?auto_843011 ) ) ( not ( = ?auto_843001 ?auto_843012 ) ) ( not ( = ?auto_843001 ?auto_843013 ) ) ( not ( = ?auto_843001 ?auto_843014 ) ) ( not ( = ?auto_843001 ?auto_843015 ) ) ( not ( = ?auto_843001 ?auto_843016 ) ) ( not ( = ?auto_843001 ?auto_843017 ) ) ( not ( = ?auto_843002 ?auto_843003 ) ) ( not ( = ?auto_843002 ?auto_843004 ) ) ( not ( = ?auto_843002 ?auto_843005 ) ) ( not ( = ?auto_843002 ?auto_843006 ) ) ( not ( = ?auto_843002 ?auto_843007 ) ) ( not ( = ?auto_843002 ?auto_843008 ) ) ( not ( = ?auto_843002 ?auto_843009 ) ) ( not ( = ?auto_843002 ?auto_843010 ) ) ( not ( = ?auto_843002 ?auto_843011 ) ) ( not ( = ?auto_843002 ?auto_843012 ) ) ( not ( = ?auto_843002 ?auto_843013 ) ) ( not ( = ?auto_843002 ?auto_843014 ) ) ( not ( = ?auto_843002 ?auto_843015 ) ) ( not ( = ?auto_843002 ?auto_843016 ) ) ( not ( = ?auto_843002 ?auto_843017 ) ) ( not ( = ?auto_843003 ?auto_843004 ) ) ( not ( = ?auto_843003 ?auto_843005 ) ) ( not ( = ?auto_843003 ?auto_843006 ) ) ( not ( = ?auto_843003 ?auto_843007 ) ) ( not ( = ?auto_843003 ?auto_843008 ) ) ( not ( = ?auto_843003 ?auto_843009 ) ) ( not ( = ?auto_843003 ?auto_843010 ) ) ( not ( = ?auto_843003 ?auto_843011 ) ) ( not ( = ?auto_843003 ?auto_843012 ) ) ( not ( = ?auto_843003 ?auto_843013 ) ) ( not ( = ?auto_843003 ?auto_843014 ) ) ( not ( = ?auto_843003 ?auto_843015 ) ) ( not ( = ?auto_843003 ?auto_843016 ) ) ( not ( = ?auto_843003 ?auto_843017 ) ) ( not ( = ?auto_843004 ?auto_843005 ) ) ( not ( = ?auto_843004 ?auto_843006 ) ) ( not ( = ?auto_843004 ?auto_843007 ) ) ( not ( = ?auto_843004 ?auto_843008 ) ) ( not ( = ?auto_843004 ?auto_843009 ) ) ( not ( = ?auto_843004 ?auto_843010 ) ) ( not ( = ?auto_843004 ?auto_843011 ) ) ( not ( = ?auto_843004 ?auto_843012 ) ) ( not ( = ?auto_843004 ?auto_843013 ) ) ( not ( = ?auto_843004 ?auto_843014 ) ) ( not ( = ?auto_843004 ?auto_843015 ) ) ( not ( = ?auto_843004 ?auto_843016 ) ) ( not ( = ?auto_843004 ?auto_843017 ) ) ( not ( = ?auto_843005 ?auto_843006 ) ) ( not ( = ?auto_843005 ?auto_843007 ) ) ( not ( = ?auto_843005 ?auto_843008 ) ) ( not ( = ?auto_843005 ?auto_843009 ) ) ( not ( = ?auto_843005 ?auto_843010 ) ) ( not ( = ?auto_843005 ?auto_843011 ) ) ( not ( = ?auto_843005 ?auto_843012 ) ) ( not ( = ?auto_843005 ?auto_843013 ) ) ( not ( = ?auto_843005 ?auto_843014 ) ) ( not ( = ?auto_843005 ?auto_843015 ) ) ( not ( = ?auto_843005 ?auto_843016 ) ) ( not ( = ?auto_843005 ?auto_843017 ) ) ( not ( = ?auto_843006 ?auto_843007 ) ) ( not ( = ?auto_843006 ?auto_843008 ) ) ( not ( = ?auto_843006 ?auto_843009 ) ) ( not ( = ?auto_843006 ?auto_843010 ) ) ( not ( = ?auto_843006 ?auto_843011 ) ) ( not ( = ?auto_843006 ?auto_843012 ) ) ( not ( = ?auto_843006 ?auto_843013 ) ) ( not ( = ?auto_843006 ?auto_843014 ) ) ( not ( = ?auto_843006 ?auto_843015 ) ) ( not ( = ?auto_843006 ?auto_843016 ) ) ( not ( = ?auto_843006 ?auto_843017 ) ) ( not ( = ?auto_843007 ?auto_843008 ) ) ( not ( = ?auto_843007 ?auto_843009 ) ) ( not ( = ?auto_843007 ?auto_843010 ) ) ( not ( = ?auto_843007 ?auto_843011 ) ) ( not ( = ?auto_843007 ?auto_843012 ) ) ( not ( = ?auto_843007 ?auto_843013 ) ) ( not ( = ?auto_843007 ?auto_843014 ) ) ( not ( = ?auto_843007 ?auto_843015 ) ) ( not ( = ?auto_843007 ?auto_843016 ) ) ( not ( = ?auto_843007 ?auto_843017 ) ) ( not ( = ?auto_843008 ?auto_843009 ) ) ( not ( = ?auto_843008 ?auto_843010 ) ) ( not ( = ?auto_843008 ?auto_843011 ) ) ( not ( = ?auto_843008 ?auto_843012 ) ) ( not ( = ?auto_843008 ?auto_843013 ) ) ( not ( = ?auto_843008 ?auto_843014 ) ) ( not ( = ?auto_843008 ?auto_843015 ) ) ( not ( = ?auto_843008 ?auto_843016 ) ) ( not ( = ?auto_843008 ?auto_843017 ) ) ( not ( = ?auto_843009 ?auto_843010 ) ) ( not ( = ?auto_843009 ?auto_843011 ) ) ( not ( = ?auto_843009 ?auto_843012 ) ) ( not ( = ?auto_843009 ?auto_843013 ) ) ( not ( = ?auto_843009 ?auto_843014 ) ) ( not ( = ?auto_843009 ?auto_843015 ) ) ( not ( = ?auto_843009 ?auto_843016 ) ) ( not ( = ?auto_843009 ?auto_843017 ) ) ( not ( = ?auto_843010 ?auto_843011 ) ) ( not ( = ?auto_843010 ?auto_843012 ) ) ( not ( = ?auto_843010 ?auto_843013 ) ) ( not ( = ?auto_843010 ?auto_843014 ) ) ( not ( = ?auto_843010 ?auto_843015 ) ) ( not ( = ?auto_843010 ?auto_843016 ) ) ( not ( = ?auto_843010 ?auto_843017 ) ) ( not ( = ?auto_843011 ?auto_843012 ) ) ( not ( = ?auto_843011 ?auto_843013 ) ) ( not ( = ?auto_843011 ?auto_843014 ) ) ( not ( = ?auto_843011 ?auto_843015 ) ) ( not ( = ?auto_843011 ?auto_843016 ) ) ( not ( = ?auto_843011 ?auto_843017 ) ) ( not ( = ?auto_843012 ?auto_843013 ) ) ( not ( = ?auto_843012 ?auto_843014 ) ) ( not ( = ?auto_843012 ?auto_843015 ) ) ( not ( = ?auto_843012 ?auto_843016 ) ) ( not ( = ?auto_843012 ?auto_843017 ) ) ( not ( = ?auto_843013 ?auto_843014 ) ) ( not ( = ?auto_843013 ?auto_843015 ) ) ( not ( = ?auto_843013 ?auto_843016 ) ) ( not ( = ?auto_843013 ?auto_843017 ) ) ( not ( = ?auto_843014 ?auto_843015 ) ) ( not ( = ?auto_843014 ?auto_843016 ) ) ( not ( = ?auto_843014 ?auto_843017 ) ) ( not ( = ?auto_843015 ?auto_843016 ) ) ( not ( = ?auto_843015 ?auto_843017 ) ) ( not ( = ?auto_843016 ?auto_843017 ) ) ( ON ?auto_843015 ?auto_843016 ) ( ON ?auto_843014 ?auto_843015 ) ( ON ?auto_843013 ?auto_843014 ) ( CLEAR ?auto_843011 ) ( ON ?auto_843012 ?auto_843013 ) ( CLEAR ?auto_843012 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_843000 ?auto_843001 ?auto_843002 ?auto_843003 ?auto_843004 ?auto_843005 ?auto_843006 ?auto_843007 ?auto_843008 ?auto_843009 ?auto_843010 ?auto_843011 ?auto_843012 )
      ( MAKE-17PILE ?auto_843000 ?auto_843001 ?auto_843002 ?auto_843003 ?auto_843004 ?auto_843005 ?auto_843006 ?auto_843007 ?auto_843008 ?auto_843009 ?auto_843010 ?auto_843011 ?auto_843012 ?auto_843013 ?auto_843014 ?auto_843015 ?auto_843016 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_843070 - BLOCK
      ?auto_843071 - BLOCK
      ?auto_843072 - BLOCK
      ?auto_843073 - BLOCK
      ?auto_843074 - BLOCK
      ?auto_843075 - BLOCK
      ?auto_843076 - BLOCK
      ?auto_843077 - BLOCK
      ?auto_843078 - BLOCK
      ?auto_843079 - BLOCK
      ?auto_843080 - BLOCK
      ?auto_843081 - BLOCK
      ?auto_843082 - BLOCK
      ?auto_843083 - BLOCK
      ?auto_843084 - BLOCK
      ?auto_843085 - BLOCK
      ?auto_843086 - BLOCK
    )
    :vars
    (
      ?auto_843087 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_843086 ?auto_843087 ) ( ON-TABLE ?auto_843070 ) ( ON ?auto_843071 ?auto_843070 ) ( ON ?auto_843072 ?auto_843071 ) ( ON ?auto_843073 ?auto_843072 ) ( ON ?auto_843074 ?auto_843073 ) ( ON ?auto_843075 ?auto_843074 ) ( ON ?auto_843076 ?auto_843075 ) ( ON ?auto_843077 ?auto_843076 ) ( ON ?auto_843078 ?auto_843077 ) ( ON ?auto_843079 ?auto_843078 ) ( ON ?auto_843080 ?auto_843079 ) ( not ( = ?auto_843070 ?auto_843071 ) ) ( not ( = ?auto_843070 ?auto_843072 ) ) ( not ( = ?auto_843070 ?auto_843073 ) ) ( not ( = ?auto_843070 ?auto_843074 ) ) ( not ( = ?auto_843070 ?auto_843075 ) ) ( not ( = ?auto_843070 ?auto_843076 ) ) ( not ( = ?auto_843070 ?auto_843077 ) ) ( not ( = ?auto_843070 ?auto_843078 ) ) ( not ( = ?auto_843070 ?auto_843079 ) ) ( not ( = ?auto_843070 ?auto_843080 ) ) ( not ( = ?auto_843070 ?auto_843081 ) ) ( not ( = ?auto_843070 ?auto_843082 ) ) ( not ( = ?auto_843070 ?auto_843083 ) ) ( not ( = ?auto_843070 ?auto_843084 ) ) ( not ( = ?auto_843070 ?auto_843085 ) ) ( not ( = ?auto_843070 ?auto_843086 ) ) ( not ( = ?auto_843070 ?auto_843087 ) ) ( not ( = ?auto_843071 ?auto_843072 ) ) ( not ( = ?auto_843071 ?auto_843073 ) ) ( not ( = ?auto_843071 ?auto_843074 ) ) ( not ( = ?auto_843071 ?auto_843075 ) ) ( not ( = ?auto_843071 ?auto_843076 ) ) ( not ( = ?auto_843071 ?auto_843077 ) ) ( not ( = ?auto_843071 ?auto_843078 ) ) ( not ( = ?auto_843071 ?auto_843079 ) ) ( not ( = ?auto_843071 ?auto_843080 ) ) ( not ( = ?auto_843071 ?auto_843081 ) ) ( not ( = ?auto_843071 ?auto_843082 ) ) ( not ( = ?auto_843071 ?auto_843083 ) ) ( not ( = ?auto_843071 ?auto_843084 ) ) ( not ( = ?auto_843071 ?auto_843085 ) ) ( not ( = ?auto_843071 ?auto_843086 ) ) ( not ( = ?auto_843071 ?auto_843087 ) ) ( not ( = ?auto_843072 ?auto_843073 ) ) ( not ( = ?auto_843072 ?auto_843074 ) ) ( not ( = ?auto_843072 ?auto_843075 ) ) ( not ( = ?auto_843072 ?auto_843076 ) ) ( not ( = ?auto_843072 ?auto_843077 ) ) ( not ( = ?auto_843072 ?auto_843078 ) ) ( not ( = ?auto_843072 ?auto_843079 ) ) ( not ( = ?auto_843072 ?auto_843080 ) ) ( not ( = ?auto_843072 ?auto_843081 ) ) ( not ( = ?auto_843072 ?auto_843082 ) ) ( not ( = ?auto_843072 ?auto_843083 ) ) ( not ( = ?auto_843072 ?auto_843084 ) ) ( not ( = ?auto_843072 ?auto_843085 ) ) ( not ( = ?auto_843072 ?auto_843086 ) ) ( not ( = ?auto_843072 ?auto_843087 ) ) ( not ( = ?auto_843073 ?auto_843074 ) ) ( not ( = ?auto_843073 ?auto_843075 ) ) ( not ( = ?auto_843073 ?auto_843076 ) ) ( not ( = ?auto_843073 ?auto_843077 ) ) ( not ( = ?auto_843073 ?auto_843078 ) ) ( not ( = ?auto_843073 ?auto_843079 ) ) ( not ( = ?auto_843073 ?auto_843080 ) ) ( not ( = ?auto_843073 ?auto_843081 ) ) ( not ( = ?auto_843073 ?auto_843082 ) ) ( not ( = ?auto_843073 ?auto_843083 ) ) ( not ( = ?auto_843073 ?auto_843084 ) ) ( not ( = ?auto_843073 ?auto_843085 ) ) ( not ( = ?auto_843073 ?auto_843086 ) ) ( not ( = ?auto_843073 ?auto_843087 ) ) ( not ( = ?auto_843074 ?auto_843075 ) ) ( not ( = ?auto_843074 ?auto_843076 ) ) ( not ( = ?auto_843074 ?auto_843077 ) ) ( not ( = ?auto_843074 ?auto_843078 ) ) ( not ( = ?auto_843074 ?auto_843079 ) ) ( not ( = ?auto_843074 ?auto_843080 ) ) ( not ( = ?auto_843074 ?auto_843081 ) ) ( not ( = ?auto_843074 ?auto_843082 ) ) ( not ( = ?auto_843074 ?auto_843083 ) ) ( not ( = ?auto_843074 ?auto_843084 ) ) ( not ( = ?auto_843074 ?auto_843085 ) ) ( not ( = ?auto_843074 ?auto_843086 ) ) ( not ( = ?auto_843074 ?auto_843087 ) ) ( not ( = ?auto_843075 ?auto_843076 ) ) ( not ( = ?auto_843075 ?auto_843077 ) ) ( not ( = ?auto_843075 ?auto_843078 ) ) ( not ( = ?auto_843075 ?auto_843079 ) ) ( not ( = ?auto_843075 ?auto_843080 ) ) ( not ( = ?auto_843075 ?auto_843081 ) ) ( not ( = ?auto_843075 ?auto_843082 ) ) ( not ( = ?auto_843075 ?auto_843083 ) ) ( not ( = ?auto_843075 ?auto_843084 ) ) ( not ( = ?auto_843075 ?auto_843085 ) ) ( not ( = ?auto_843075 ?auto_843086 ) ) ( not ( = ?auto_843075 ?auto_843087 ) ) ( not ( = ?auto_843076 ?auto_843077 ) ) ( not ( = ?auto_843076 ?auto_843078 ) ) ( not ( = ?auto_843076 ?auto_843079 ) ) ( not ( = ?auto_843076 ?auto_843080 ) ) ( not ( = ?auto_843076 ?auto_843081 ) ) ( not ( = ?auto_843076 ?auto_843082 ) ) ( not ( = ?auto_843076 ?auto_843083 ) ) ( not ( = ?auto_843076 ?auto_843084 ) ) ( not ( = ?auto_843076 ?auto_843085 ) ) ( not ( = ?auto_843076 ?auto_843086 ) ) ( not ( = ?auto_843076 ?auto_843087 ) ) ( not ( = ?auto_843077 ?auto_843078 ) ) ( not ( = ?auto_843077 ?auto_843079 ) ) ( not ( = ?auto_843077 ?auto_843080 ) ) ( not ( = ?auto_843077 ?auto_843081 ) ) ( not ( = ?auto_843077 ?auto_843082 ) ) ( not ( = ?auto_843077 ?auto_843083 ) ) ( not ( = ?auto_843077 ?auto_843084 ) ) ( not ( = ?auto_843077 ?auto_843085 ) ) ( not ( = ?auto_843077 ?auto_843086 ) ) ( not ( = ?auto_843077 ?auto_843087 ) ) ( not ( = ?auto_843078 ?auto_843079 ) ) ( not ( = ?auto_843078 ?auto_843080 ) ) ( not ( = ?auto_843078 ?auto_843081 ) ) ( not ( = ?auto_843078 ?auto_843082 ) ) ( not ( = ?auto_843078 ?auto_843083 ) ) ( not ( = ?auto_843078 ?auto_843084 ) ) ( not ( = ?auto_843078 ?auto_843085 ) ) ( not ( = ?auto_843078 ?auto_843086 ) ) ( not ( = ?auto_843078 ?auto_843087 ) ) ( not ( = ?auto_843079 ?auto_843080 ) ) ( not ( = ?auto_843079 ?auto_843081 ) ) ( not ( = ?auto_843079 ?auto_843082 ) ) ( not ( = ?auto_843079 ?auto_843083 ) ) ( not ( = ?auto_843079 ?auto_843084 ) ) ( not ( = ?auto_843079 ?auto_843085 ) ) ( not ( = ?auto_843079 ?auto_843086 ) ) ( not ( = ?auto_843079 ?auto_843087 ) ) ( not ( = ?auto_843080 ?auto_843081 ) ) ( not ( = ?auto_843080 ?auto_843082 ) ) ( not ( = ?auto_843080 ?auto_843083 ) ) ( not ( = ?auto_843080 ?auto_843084 ) ) ( not ( = ?auto_843080 ?auto_843085 ) ) ( not ( = ?auto_843080 ?auto_843086 ) ) ( not ( = ?auto_843080 ?auto_843087 ) ) ( not ( = ?auto_843081 ?auto_843082 ) ) ( not ( = ?auto_843081 ?auto_843083 ) ) ( not ( = ?auto_843081 ?auto_843084 ) ) ( not ( = ?auto_843081 ?auto_843085 ) ) ( not ( = ?auto_843081 ?auto_843086 ) ) ( not ( = ?auto_843081 ?auto_843087 ) ) ( not ( = ?auto_843082 ?auto_843083 ) ) ( not ( = ?auto_843082 ?auto_843084 ) ) ( not ( = ?auto_843082 ?auto_843085 ) ) ( not ( = ?auto_843082 ?auto_843086 ) ) ( not ( = ?auto_843082 ?auto_843087 ) ) ( not ( = ?auto_843083 ?auto_843084 ) ) ( not ( = ?auto_843083 ?auto_843085 ) ) ( not ( = ?auto_843083 ?auto_843086 ) ) ( not ( = ?auto_843083 ?auto_843087 ) ) ( not ( = ?auto_843084 ?auto_843085 ) ) ( not ( = ?auto_843084 ?auto_843086 ) ) ( not ( = ?auto_843084 ?auto_843087 ) ) ( not ( = ?auto_843085 ?auto_843086 ) ) ( not ( = ?auto_843085 ?auto_843087 ) ) ( not ( = ?auto_843086 ?auto_843087 ) ) ( ON ?auto_843085 ?auto_843086 ) ( ON ?auto_843084 ?auto_843085 ) ( ON ?auto_843083 ?auto_843084 ) ( ON ?auto_843082 ?auto_843083 ) ( CLEAR ?auto_843080 ) ( ON ?auto_843081 ?auto_843082 ) ( CLEAR ?auto_843081 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_843070 ?auto_843071 ?auto_843072 ?auto_843073 ?auto_843074 ?auto_843075 ?auto_843076 ?auto_843077 ?auto_843078 ?auto_843079 ?auto_843080 ?auto_843081 )
      ( MAKE-17PILE ?auto_843070 ?auto_843071 ?auto_843072 ?auto_843073 ?auto_843074 ?auto_843075 ?auto_843076 ?auto_843077 ?auto_843078 ?auto_843079 ?auto_843080 ?auto_843081 ?auto_843082 ?auto_843083 ?auto_843084 ?auto_843085 ?auto_843086 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_843140 - BLOCK
      ?auto_843141 - BLOCK
      ?auto_843142 - BLOCK
      ?auto_843143 - BLOCK
      ?auto_843144 - BLOCK
      ?auto_843145 - BLOCK
      ?auto_843146 - BLOCK
      ?auto_843147 - BLOCK
      ?auto_843148 - BLOCK
      ?auto_843149 - BLOCK
      ?auto_843150 - BLOCK
      ?auto_843151 - BLOCK
      ?auto_843152 - BLOCK
      ?auto_843153 - BLOCK
      ?auto_843154 - BLOCK
      ?auto_843155 - BLOCK
      ?auto_843156 - BLOCK
    )
    :vars
    (
      ?auto_843157 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_843156 ?auto_843157 ) ( ON-TABLE ?auto_843140 ) ( ON ?auto_843141 ?auto_843140 ) ( ON ?auto_843142 ?auto_843141 ) ( ON ?auto_843143 ?auto_843142 ) ( ON ?auto_843144 ?auto_843143 ) ( ON ?auto_843145 ?auto_843144 ) ( ON ?auto_843146 ?auto_843145 ) ( ON ?auto_843147 ?auto_843146 ) ( ON ?auto_843148 ?auto_843147 ) ( ON ?auto_843149 ?auto_843148 ) ( not ( = ?auto_843140 ?auto_843141 ) ) ( not ( = ?auto_843140 ?auto_843142 ) ) ( not ( = ?auto_843140 ?auto_843143 ) ) ( not ( = ?auto_843140 ?auto_843144 ) ) ( not ( = ?auto_843140 ?auto_843145 ) ) ( not ( = ?auto_843140 ?auto_843146 ) ) ( not ( = ?auto_843140 ?auto_843147 ) ) ( not ( = ?auto_843140 ?auto_843148 ) ) ( not ( = ?auto_843140 ?auto_843149 ) ) ( not ( = ?auto_843140 ?auto_843150 ) ) ( not ( = ?auto_843140 ?auto_843151 ) ) ( not ( = ?auto_843140 ?auto_843152 ) ) ( not ( = ?auto_843140 ?auto_843153 ) ) ( not ( = ?auto_843140 ?auto_843154 ) ) ( not ( = ?auto_843140 ?auto_843155 ) ) ( not ( = ?auto_843140 ?auto_843156 ) ) ( not ( = ?auto_843140 ?auto_843157 ) ) ( not ( = ?auto_843141 ?auto_843142 ) ) ( not ( = ?auto_843141 ?auto_843143 ) ) ( not ( = ?auto_843141 ?auto_843144 ) ) ( not ( = ?auto_843141 ?auto_843145 ) ) ( not ( = ?auto_843141 ?auto_843146 ) ) ( not ( = ?auto_843141 ?auto_843147 ) ) ( not ( = ?auto_843141 ?auto_843148 ) ) ( not ( = ?auto_843141 ?auto_843149 ) ) ( not ( = ?auto_843141 ?auto_843150 ) ) ( not ( = ?auto_843141 ?auto_843151 ) ) ( not ( = ?auto_843141 ?auto_843152 ) ) ( not ( = ?auto_843141 ?auto_843153 ) ) ( not ( = ?auto_843141 ?auto_843154 ) ) ( not ( = ?auto_843141 ?auto_843155 ) ) ( not ( = ?auto_843141 ?auto_843156 ) ) ( not ( = ?auto_843141 ?auto_843157 ) ) ( not ( = ?auto_843142 ?auto_843143 ) ) ( not ( = ?auto_843142 ?auto_843144 ) ) ( not ( = ?auto_843142 ?auto_843145 ) ) ( not ( = ?auto_843142 ?auto_843146 ) ) ( not ( = ?auto_843142 ?auto_843147 ) ) ( not ( = ?auto_843142 ?auto_843148 ) ) ( not ( = ?auto_843142 ?auto_843149 ) ) ( not ( = ?auto_843142 ?auto_843150 ) ) ( not ( = ?auto_843142 ?auto_843151 ) ) ( not ( = ?auto_843142 ?auto_843152 ) ) ( not ( = ?auto_843142 ?auto_843153 ) ) ( not ( = ?auto_843142 ?auto_843154 ) ) ( not ( = ?auto_843142 ?auto_843155 ) ) ( not ( = ?auto_843142 ?auto_843156 ) ) ( not ( = ?auto_843142 ?auto_843157 ) ) ( not ( = ?auto_843143 ?auto_843144 ) ) ( not ( = ?auto_843143 ?auto_843145 ) ) ( not ( = ?auto_843143 ?auto_843146 ) ) ( not ( = ?auto_843143 ?auto_843147 ) ) ( not ( = ?auto_843143 ?auto_843148 ) ) ( not ( = ?auto_843143 ?auto_843149 ) ) ( not ( = ?auto_843143 ?auto_843150 ) ) ( not ( = ?auto_843143 ?auto_843151 ) ) ( not ( = ?auto_843143 ?auto_843152 ) ) ( not ( = ?auto_843143 ?auto_843153 ) ) ( not ( = ?auto_843143 ?auto_843154 ) ) ( not ( = ?auto_843143 ?auto_843155 ) ) ( not ( = ?auto_843143 ?auto_843156 ) ) ( not ( = ?auto_843143 ?auto_843157 ) ) ( not ( = ?auto_843144 ?auto_843145 ) ) ( not ( = ?auto_843144 ?auto_843146 ) ) ( not ( = ?auto_843144 ?auto_843147 ) ) ( not ( = ?auto_843144 ?auto_843148 ) ) ( not ( = ?auto_843144 ?auto_843149 ) ) ( not ( = ?auto_843144 ?auto_843150 ) ) ( not ( = ?auto_843144 ?auto_843151 ) ) ( not ( = ?auto_843144 ?auto_843152 ) ) ( not ( = ?auto_843144 ?auto_843153 ) ) ( not ( = ?auto_843144 ?auto_843154 ) ) ( not ( = ?auto_843144 ?auto_843155 ) ) ( not ( = ?auto_843144 ?auto_843156 ) ) ( not ( = ?auto_843144 ?auto_843157 ) ) ( not ( = ?auto_843145 ?auto_843146 ) ) ( not ( = ?auto_843145 ?auto_843147 ) ) ( not ( = ?auto_843145 ?auto_843148 ) ) ( not ( = ?auto_843145 ?auto_843149 ) ) ( not ( = ?auto_843145 ?auto_843150 ) ) ( not ( = ?auto_843145 ?auto_843151 ) ) ( not ( = ?auto_843145 ?auto_843152 ) ) ( not ( = ?auto_843145 ?auto_843153 ) ) ( not ( = ?auto_843145 ?auto_843154 ) ) ( not ( = ?auto_843145 ?auto_843155 ) ) ( not ( = ?auto_843145 ?auto_843156 ) ) ( not ( = ?auto_843145 ?auto_843157 ) ) ( not ( = ?auto_843146 ?auto_843147 ) ) ( not ( = ?auto_843146 ?auto_843148 ) ) ( not ( = ?auto_843146 ?auto_843149 ) ) ( not ( = ?auto_843146 ?auto_843150 ) ) ( not ( = ?auto_843146 ?auto_843151 ) ) ( not ( = ?auto_843146 ?auto_843152 ) ) ( not ( = ?auto_843146 ?auto_843153 ) ) ( not ( = ?auto_843146 ?auto_843154 ) ) ( not ( = ?auto_843146 ?auto_843155 ) ) ( not ( = ?auto_843146 ?auto_843156 ) ) ( not ( = ?auto_843146 ?auto_843157 ) ) ( not ( = ?auto_843147 ?auto_843148 ) ) ( not ( = ?auto_843147 ?auto_843149 ) ) ( not ( = ?auto_843147 ?auto_843150 ) ) ( not ( = ?auto_843147 ?auto_843151 ) ) ( not ( = ?auto_843147 ?auto_843152 ) ) ( not ( = ?auto_843147 ?auto_843153 ) ) ( not ( = ?auto_843147 ?auto_843154 ) ) ( not ( = ?auto_843147 ?auto_843155 ) ) ( not ( = ?auto_843147 ?auto_843156 ) ) ( not ( = ?auto_843147 ?auto_843157 ) ) ( not ( = ?auto_843148 ?auto_843149 ) ) ( not ( = ?auto_843148 ?auto_843150 ) ) ( not ( = ?auto_843148 ?auto_843151 ) ) ( not ( = ?auto_843148 ?auto_843152 ) ) ( not ( = ?auto_843148 ?auto_843153 ) ) ( not ( = ?auto_843148 ?auto_843154 ) ) ( not ( = ?auto_843148 ?auto_843155 ) ) ( not ( = ?auto_843148 ?auto_843156 ) ) ( not ( = ?auto_843148 ?auto_843157 ) ) ( not ( = ?auto_843149 ?auto_843150 ) ) ( not ( = ?auto_843149 ?auto_843151 ) ) ( not ( = ?auto_843149 ?auto_843152 ) ) ( not ( = ?auto_843149 ?auto_843153 ) ) ( not ( = ?auto_843149 ?auto_843154 ) ) ( not ( = ?auto_843149 ?auto_843155 ) ) ( not ( = ?auto_843149 ?auto_843156 ) ) ( not ( = ?auto_843149 ?auto_843157 ) ) ( not ( = ?auto_843150 ?auto_843151 ) ) ( not ( = ?auto_843150 ?auto_843152 ) ) ( not ( = ?auto_843150 ?auto_843153 ) ) ( not ( = ?auto_843150 ?auto_843154 ) ) ( not ( = ?auto_843150 ?auto_843155 ) ) ( not ( = ?auto_843150 ?auto_843156 ) ) ( not ( = ?auto_843150 ?auto_843157 ) ) ( not ( = ?auto_843151 ?auto_843152 ) ) ( not ( = ?auto_843151 ?auto_843153 ) ) ( not ( = ?auto_843151 ?auto_843154 ) ) ( not ( = ?auto_843151 ?auto_843155 ) ) ( not ( = ?auto_843151 ?auto_843156 ) ) ( not ( = ?auto_843151 ?auto_843157 ) ) ( not ( = ?auto_843152 ?auto_843153 ) ) ( not ( = ?auto_843152 ?auto_843154 ) ) ( not ( = ?auto_843152 ?auto_843155 ) ) ( not ( = ?auto_843152 ?auto_843156 ) ) ( not ( = ?auto_843152 ?auto_843157 ) ) ( not ( = ?auto_843153 ?auto_843154 ) ) ( not ( = ?auto_843153 ?auto_843155 ) ) ( not ( = ?auto_843153 ?auto_843156 ) ) ( not ( = ?auto_843153 ?auto_843157 ) ) ( not ( = ?auto_843154 ?auto_843155 ) ) ( not ( = ?auto_843154 ?auto_843156 ) ) ( not ( = ?auto_843154 ?auto_843157 ) ) ( not ( = ?auto_843155 ?auto_843156 ) ) ( not ( = ?auto_843155 ?auto_843157 ) ) ( not ( = ?auto_843156 ?auto_843157 ) ) ( ON ?auto_843155 ?auto_843156 ) ( ON ?auto_843154 ?auto_843155 ) ( ON ?auto_843153 ?auto_843154 ) ( ON ?auto_843152 ?auto_843153 ) ( ON ?auto_843151 ?auto_843152 ) ( CLEAR ?auto_843149 ) ( ON ?auto_843150 ?auto_843151 ) ( CLEAR ?auto_843150 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_843140 ?auto_843141 ?auto_843142 ?auto_843143 ?auto_843144 ?auto_843145 ?auto_843146 ?auto_843147 ?auto_843148 ?auto_843149 ?auto_843150 )
      ( MAKE-17PILE ?auto_843140 ?auto_843141 ?auto_843142 ?auto_843143 ?auto_843144 ?auto_843145 ?auto_843146 ?auto_843147 ?auto_843148 ?auto_843149 ?auto_843150 ?auto_843151 ?auto_843152 ?auto_843153 ?auto_843154 ?auto_843155 ?auto_843156 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_843210 - BLOCK
      ?auto_843211 - BLOCK
      ?auto_843212 - BLOCK
      ?auto_843213 - BLOCK
      ?auto_843214 - BLOCK
      ?auto_843215 - BLOCK
      ?auto_843216 - BLOCK
      ?auto_843217 - BLOCK
      ?auto_843218 - BLOCK
      ?auto_843219 - BLOCK
      ?auto_843220 - BLOCK
      ?auto_843221 - BLOCK
      ?auto_843222 - BLOCK
      ?auto_843223 - BLOCK
      ?auto_843224 - BLOCK
      ?auto_843225 - BLOCK
      ?auto_843226 - BLOCK
    )
    :vars
    (
      ?auto_843227 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_843226 ?auto_843227 ) ( ON-TABLE ?auto_843210 ) ( ON ?auto_843211 ?auto_843210 ) ( ON ?auto_843212 ?auto_843211 ) ( ON ?auto_843213 ?auto_843212 ) ( ON ?auto_843214 ?auto_843213 ) ( ON ?auto_843215 ?auto_843214 ) ( ON ?auto_843216 ?auto_843215 ) ( ON ?auto_843217 ?auto_843216 ) ( ON ?auto_843218 ?auto_843217 ) ( not ( = ?auto_843210 ?auto_843211 ) ) ( not ( = ?auto_843210 ?auto_843212 ) ) ( not ( = ?auto_843210 ?auto_843213 ) ) ( not ( = ?auto_843210 ?auto_843214 ) ) ( not ( = ?auto_843210 ?auto_843215 ) ) ( not ( = ?auto_843210 ?auto_843216 ) ) ( not ( = ?auto_843210 ?auto_843217 ) ) ( not ( = ?auto_843210 ?auto_843218 ) ) ( not ( = ?auto_843210 ?auto_843219 ) ) ( not ( = ?auto_843210 ?auto_843220 ) ) ( not ( = ?auto_843210 ?auto_843221 ) ) ( not ( = ?auto_843210 ?auto_843222 ) ) ( not ( = ?auto_843210 ?auto_843223 ) ) ( not ( = ?auto_843210 ?auto_843224 ) ) ( not ( = ?auto_843210 ?auto_843225 ) ) ( not ( = ?auto_843210 ?auto_843226 ) ) ( not ( = ?auto_843210 ?auto_843227 ) ) ( not ( = ?auto_843211 ?auto_843212 ) ) ( not ( = ?auto_843211 ?auto_843213 ) ) ( not ( = ?auto_843211 ?auto_843214 ) ) ( not ( = ?auto_843211 ?auto_843215 ) ) ( not ( = ?auto_843211 ?auto_843216 ) ) ( not ( = ?auto_843211 ?auto_843217 ) ) ( not ( = ?auto_843211 ?auto_843218 ) ) ( not ( = ?auto_843211 ?auto_843219 ) ) ( not ( = ?auto_843211 ?auto_843220 ) ) ( not ( = ?auto_843211 ?auto_843221 ) ) ( not ( = ?auto_843211 ?auto_843222 ) ) ( not ( = ?auto_843211 ?auto_843223 ) ) ( not ( = ?auto_843211 ?auto_843224 ) ) ( not ( = ?auto_843211 ?auto_843225 ) ) ( not ( = ?auto_843211 ?auto_843226 ) ) ( not ( = ?auto_843211 ?auto_843227 ) ) ( not ( = ?auto_843212 ?auto_843213 ) ) ( not ( = ?auto_843212 ?auto_843214 ) ) ( not ( = ?auto_843212 ?auto_843215 ) ) ( not ( = ?auto_843212 ?auto_843216 ) ) ( not ( = ?auto_843212 ?auto_843217 ) ) ( not ( = ?auto_843212 ?auto_843218 ) ) ( not ( = ?auto_843212 ?auto_843219 ) ) ( not ( = ?auto_843212 ?auto_843220 ) ) ( not ( = ?auto_843212 ?auto_843221 ) ) ( not ( = ?auto_843212 ?auto_843222 ) ) ( not ( = ?auto_843212 ?auto_843223 ) ) ( not ( = ?auto_843212 ?auto_843224 ) ) ( not ( = ?auto_843212 ?auto_843225 ) ) ( not ( = ?auto_843212 ?auto_843226 ) ) ( not ( = ?auto_843212 ?auto_843227 ) ) ( not ( = ?auto_843213 ?auto_843214 ) ) ( not ( = ?auto_843213 ?auto_843215 ) ) ( not ( = ?auto_843213 ?auto_843216 ) ) ( not ( = ?auto_843213 ?auto_843217 ) ) ( not ( = ?auto_843213 ?auto_843218 ) ) ( not ( = ?auto_843213 ?auto_843219 ) ) ( not ( = ?auto_843213 ?auto_843220 ) ) ( not ( = ?auto_843213 ?auto_843221 ) ) ( not ( = ?auto_843213 ?auto_843222 ) ) ( not ( = ?auto_843213 ?auto_843223 ) ) ( not ( = ?auto_843213 ?auto_843224 ) ) ( not ( = ?auto_843213 ?auto_843225 ) ) ( not ( = ?auto_843213 ?auto_843226 ) ) ( not ( = ?auto_843213 ?auto_843227 ) ) ( not ( = ?auto_843214 ?auto_843215 ) ) ( not ( = ?auto_843214 ?auto_843216 ) ) ( not ( = ?auto_843214 ?auto_843217 ) ) ( not ( = ?auto_843214 ?auto_843218 ) ) ( not ( = ?auto_843214 ?auto_843219 ) ) ( not ( = ?auto_843214 ?auto_843220 ) ) ( not ( = ?auto_843214 ?auto_843221 ) ) ( not ( = ?auto_843214 ?auto_843222 ) ) ( not ( = ?auto_843214 ?auto_843223 ) ) ( not ( = ?auto_843214 ?auto_843224 ) ) ( not ( = ?auto_843214 ?auto_843225 ) ) ( not ( = ?auto_843214 ?auto_843226 ) ) ( not ( = ?auto_843214 ?auto_843227 ) ) ( not ( = ?auto_843215 ?auto_843216 ) ) ( not ( = ?auto_843215 ?auto_843217 ) ) ( not ( = ?auto_843215 ?auto_843218 ) ) ( not ( = ?auto_843215 ?auto_843219 ) ) ( not ( = ?auto_843215 ?auto_843220 ) ) ( not ( = ?auto_843215 ?auto_843221 ) ) ( not ( = ?auto_843215 ?auto_843222 ) ) ( not ( = ?auto_843215 ?auto_843223 ) ) ( not ( = ?auto_843215 ?auto_843224 ) ) ( not ( = ?auto_843215 ?auto_843225 ) ) ( not ( = ?auto_843215 ?auto_843226 ) ) ( not ( = ?auto_843215 ?auto_843227 ) ) ( not ( = ?auto_843216 ?auto_843217 ) ) ( not ( = ?auto_843216 ?auto_843218 ) ) ( not ( = ?auto_843216 ?auto_843219 ) ) ( not ( = ?auto_843216 ?auto_843220 ) ) ( not ( = ?auto_843216 ?auto_843221 ) ) ( not ( = ?auto_843216 ?auto_843222 ) ) ( not ( = ?auto_843216 ?auto_843223 ) ) ( not ( = ?auto_843216 ?auto_843224 ) ) ( not ( = ?auto_843216 ?auto_843225 ) ) ( not ( = ?auto_843216 ?auto_843226 ) ) ( not ( = ?auto_843216 ?auto_843227 ) ) ( not ( = ?auto_843217 ?auto_843218 ) ) ( not ( = ?auto_843217 ?auto_843219 ) ) ( not ( = ?auto_843217 ?auto_843220 ) ) ( not ( = ?auto_843217 ?auto_843221 ) ) ( not ( = ?auto_843217 ?auto_843222 ) ) ( not ( = ?auto_843217 ?auto_843223 ) ) ( not ( = ?auto_843217 ?auto_843224 ) ) ( not ( = ?auto_843217 ?auto_843225 ) ) ( not ( = ?auto_843217 ?auto_843226 ) ) ( not ( = ?auto_843217 ?auto_843227 ) ) ( not ( = ?auto_843218 ?auto_843219 ) ) ( not ( = ?auto_843218 ?auto_843220 ) ) ( not ( = ?auto_843218 ?auto_843221 ) ) ( not ( = ?auto_843218 ?auto_843222 ) ) ( not ( = ?auto_843218 ?auto_843223 ) ) ( not ( = ?auto_843218 ?auto_843224 ) ) ( not ( = ?auto_843218 ?auto_843225 ) ) ( not ( = ?auto_843218 ?auto_843226 ) ) ( not ( = ?auto_843218 ?auto_843227 ) ) ( not ( = ?auto_843219 ?auto_843220 ) ) ( not ( = ?auto_843219 ?auto_843221 ) ) ( not ( = ?auto_843219 ?auto_843222 ) ) ( not ( = ?auto_843219 ?auto_843223 ) ) ( not ( = ?auto_843219 ?auto_843224 ) ) ( not ( = ?auto_843219 ?auto_843225 ) ) ( not ( = ?auto_843219 ?auto_843226 ) ) ( not ( = ?auto_843219 ?auto_843227 ) ) ( not ( = ?auto_843220 ?auto_843221 ) ) ( not ( = ?auto_843220 ?auto_843222 ) ) ( not ( = ?auto_843220 ?auto_843223 ) ) ( not ( = ?auto_843220 ?auto_843224 ) ) ( not ( = ?auto_843220 ?auto_843225 ) ) ( not ( = ?auto_843220 ?auto_843226 ) ) ( not ( = ?auto_843220 ?auto_843227 ) ) ( not ( = ?auto_843221 ?auto_843222 ) ) ( not ( = ?auto_843221 ?auto_843223 ) ) ( not ( = ?auto_843221 ?auto_843224 ) ) ( not ( = ?auto_843221 ?auto_843225 ) ) ( not ( = ?auto_843221 ?auto_843226 ) ) ( not ( = ?auto_843221 ?auto_843227 ) ) ( not ( = ?auto_843222 ?auto_843223 ) ) ( not ( = ?auto_843222 ?auto_843224 ) ) ( not ( = ?auto_843222 ?auto_843225 ) ) ( not ( = ?auto_843222 ?auto_843226 ) ) ( not ( = ?auto_843222 ?auto_843227 ) ) ( not ( = ?auto_843223 ?auto_843224 ) ) ( not ( = ?auto_843223 ?auto_843225 ) ) ( not ( = ?auto_843223 ?auto_843226 ) ) ( not ( = ?auto_843223 ?auto_843227 ) ) ( not ( = ?auto_843224 ?auto_843225 ) ) ( not ( = ?auto_843224 ?auto_843226 ) ) ( not ( = ?auto_843224 ?auto_843227 ) ) ( not ( = ?auto_843225 ?auto_843226 ) ) ( not ( = ?auto_843225 ?auto_843227 ) ) ( not ( = ?auto_843226 ?auto_843227 ) ) ( ON ?auto_843225 ?auto_843226 ) ( ON ?auto_843224 ?auto_843225 ) ( ON ?auto_843223 ?auto_843224 ) ( ON ?auto_843222 ?auto_843223 ) ( ON ?auto_843221 ?auto_843222 ) ( ON ?auto_843220 ?auto_843221 ) ( CLEAR ?auto_843218 ) ( ON ?auto_843219 ?auto_843220 ) ( CLEAR ?auto_843219 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_843210 ?auto_843211 ?auto_843212 ?auto_843213 ?auto_843214 ?auto_843215 ?auto_843216 ?auto_843217 ?auto_843218 ?auto_843219 )
      ( MAKE-17PILE ?auto_843210 ?auto_843211 ?auto_843212 ?auto_843213 ?auto_843214 ?auto_843215 ?auto_843216 ?auto_843217 ?auto_843218 ?auto_843219 ?auto_843220 ?auto_843221 ?auto_843222 ?auto_843223 ?auto_843224 ?auto_843225 ?auto_843226 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_843280 - BLOCK
      ?auto_843281 - BLOCK
      ?auto_843282 - BLOCK
      ?auto_843283 - BLOCK
      ?auto_843284 - BLOCK
      ?auto_843285 - BLOCK
      ?auto_843286 - BLOCK
      ?auto_843287 - BLOCK
      ?auto_843288 - BLOCK
      ?auto_843289 - BLOCK
      ?auto_843290 - BLOCK
      ?auto_843291 - BLOCK
      ?auto_843292 - BLOCK
      ?auto_843293 - BLOCK
      ?auto_843294 - BLOCK
      ?auto_843295 - BLOCK
      ?auto_843296 - BLOCK
    )
    :vars
    (
      ?auto_843297 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_843296 ?auto_843297 ) ( ON-TABLE ?auto_843280 ) ( ON ?auto_843281 ?auto_843280 ) ( ON ?auto_843282 ?auto_843281 ) ( ON ?auto_843283 ?auto_843282 ) ( ON ?auto_843284 ?auto_843283 ) ( ON ?auto_843285 ?auto_843284 ) ( ON ?auto_843286 ?auto_843285 ) ( ON ?auto_843287 ?auto_843286 ) ( not ( = ?auto_843280 ?auto_843281 ) ) ( not ( = ?auto_843280 ?auto_843282 ) ) ( not ( = ?auto_843280 ?auto_843283 ) ) ( not ( = ?auto_843280 ?auto_843284 ) ) ( not ( = ?auto_843280 ?auto_843285 ) ) ( not ( = ?auto_843280 ?auto_843286 ) ) ( not ( = ?auto_843280 ?auto_843287 ) ) ( not ( = ?auto_843280 ?auto_843288 ) ) ( not ( = ?auto_843280 ?auto_843289 ) ) ( not ( = ?auto_843280 ?auto_843290 ) ) ( not ( = ?auto_843280 ?auto_843291 ) ) ( not ( = ?auto_843280 ?auto_843292 ) ) ( not ( = ?auto_843280 ?auto_843293 ) ) ( not ( = ?auto_843280 ?auto_843294 ) ) ( not ( = ?auto_843280 ?auto_843295 ) ) ( not ( = ?auto_843280 ?auto_843296 ) ) ( not ( = ?auto_843280 ?auto_843297 ) ) ( not ( = ?auto_843281 ?auto_843282 ) ) ( not ( = ?auto_843281 ?auto_843283 ) ) ( not ( = ?auto_843281 ?auto_843284 ) ) ( not ( = ?auto_843281 ?auto_843285 ) ) ( not ( = ?auto_843281 ?auto_843286 ) ) ( not ( = ?auto_843281 ?auto_843287 ) ) ( not ( = ?auto_843281 ?auto_843288 ) ) ( not ( = ?auto_843281 ?auto_843289 ) ) ( not ( = ?auto_843281 ?auto_843290 ) ) ( not ( = ?auto_843281 ?auto_843291 ) ) ( not ( = ?auto_843281 ?auto_843292 ) ) ( not ( = ?auto_843281 ?auto_843293 ) ) ( not ( = ?auto_843281 ?auto_843294 ) ) ( not ( = ?auto_843281 ?auto_843295 ) ) ( not ( = ?auto_843281 ?auto_843296 ) ) ( not ( = ?auto_843281 ?auto_843297 ) ) ( not ( = ?auto_843282 ?auto_843283 ) ) ( not ( = ?auto_843282 ?auto_843284 ) ) ( not ( = ?auto_843282 ?auto_843285 ) ) ( not ( = ?auto_843282 ?auto_843286 ) ) ( not ( = ?auto_843282 ?auto_843287 ) ) ( not ( = ?auto_843282 ?auto_843288 ) ) ( not ( = ?auto_843282 ?auto_843289 ) ) ( not ( = ?auto_843282 ?auto_843290 ) ) ( not ( = ?auto_843282 ?auto_843291 ) ) ( not ( = ?auto_843282 ?auto_843292 ) ) ( not ( = ?auto_843282 ?auto_843293 ) ) ( not ( = ?auto_843282 ?auto_843294 ) ) ( not ( = ?auto_843282 ?auto_843295 ) ) ( not ( = ?auto_843282 ?auto_843296 ) ) ( not ( = ?auto_843282 ?auto_843297 ) ) ( not ( = ?auto_843283 ?auto_843284 ) ) ( not ( = ?auto_843283 ?auto_843285 ) ) ( not ( = ?auto_843283 ?auto_843286 ) ) ( not ( = ?auto_843283 ?auto_843287 ) ) ( not ( = ?auto_843283 ?auto_843288 ) ) ( not ( = ?auto_843283 ?auto_843289 ) ) ( not ( = ?auto_843283 ?auto_843290 ) ) ( not ( = ?auto_843283 ?auto_843291 ) ) ( not ( = ?auto_843283 ?auto_843292 ) ) ( not ( = ?auto_843283 ?auto_843293 ) ) ( not ( = ?auto_843283 ?auto_843294 ) ) ( not ( = ?auto_843283 ?auto_843295 ) ) ( not ( = ?auto_843283 ?auto_843296 ) ) ( not ( = ?auto_843283 ?auto_843297 ) ) ( not ( = ?auto_843284 ?auto_843285 ) ) ( not ( = ?auto_843284 ?auto_843286 ) ) ( not ( = ?auto_843284 ?auto_843287 ) ) ( not ( = ?auto_843284 ?auto_843288 ) ) ( not ( = ?auto_843284 ?auto_843289 ) ) ( not ( = ?auto_843284 ?auto_843290 ) ) ( not ( = ?auto_843284 ?auto_843291 ) ) ( not ( = ?auto_843284 ?auto_843292 ) ) ( not ( = ?auto_843284 ?auto_843293 ) ) ( not ( = ?auto_843284 ?auto_843294 ) ) ( not ( = ?auto_843284 ?auto_843295 ) ) ( not ( = ?auto_843284 ?auto_843296 ) ) ( not ( = ?auto_843284 ?auto_843297 ) ) ( not ( = ?auto_843285 ?auto_843286 ) ) ( not ( = ?auto_843285 ?auto_843287 ) ) ( not ( = ?auto_843285 ?auto_843288 ) ) ( not ( = ?auto_843285 ?auto_843289 ) ) ( not ( = ?auto_843285 ?auto_843290 ) ) ( not ( = ?auto_843285 ?auto_843291 ) ) ( not ( = ?auto_843285 ?auto_843292 ) ) ( not ( = ?auto_843285 ?auto_843293 ) ) ( not ( = ?auto_843285 ?auto_843294 ) ) ( not ( = ?auto_843285 ?auto_843295 ) ) ( not ( = ?auto_843285 ?auto_843296 ) ) ( not ( = ?auto_843285 ?auto_843297 ) ) ( not ( = ?auto_843286 ?auto_843287 ) ) ( not ( = ?auto_843286 ?auto_843288 ) ) ( not ( = ?auto_843286 ?auto_843289 ) ) ( not ( = ?auto_843286 ?auto_843290 ) ) ( not ( = ?auto_843286 ?auto_843291 ) ) ( not ( = ?auto_843286 ?auto_843292 ) ) ( not ( = ?auto_843286 ?auto_843293 ) ) ( not ( = ?auto_843286 ?auto_843294 ) ) ( not ( = ?auto_843286 ?auto_843295 ) ) ( not ( = ?auto_843286 ?auto_843296 ) ) ( not ( = ?auto_843286 ?auto_843297 ) ) ( not ( = ?auto_843287 ?auto_843288 ) ) ( not ( = ?auto_843287 ?auto_843289 ) ) ( not ( = ?auto_843287 ?auto_843290 ) ) ( not ( = ?auto_843287 ?auto_843291 ) ) ( not ( = ?auto_843287 ?auto_843292 ) ) ( not ( = ?auto_843287 ?auto_843293 ) ) ( not ( = ?auto_843287 ?auto_843294 ) ) ( not ( = ?auto_843287 ?auto_843295 ) ) ( not ( = ?auto_843287 ?auto_843296 ) ) ( not ( = ?auto_843287 ?auto_843297 ) ) ( not ( = ?auto_843288 ?auto_843289 ) ) ( not ( = ?auto_843288 ?auto_843290 ) ) ( not ( = ?auto_843288 ?auto_843291 ) ) ( not ( = ?auto_843288 ?auto_843292 ) ) ( not ( = ?auto_843288 ?auto_843293 ) ) ( not ( = ?auto_843288 ?auto_843294 ) ) ( not ( = ?auto_843288 ?auto_843295 ) ) ( not ( = ?auto_843288 ?auto_843296 ) ) ( not ( = ?auto_843288 ?auto_843297 ) ) ( not ( = ?auto_843289 ?auto_843290 ) ) ( not ( = ?auto_843289 ?auto_843291 ) ) ( not ( = ?auto_843289 ?auto_843292 ) ) ( not ( = ?auto_843289 ?auto_843293 ) ) ( not ( = ?auto_843289 ?auto_843294 ) ) ( not ( = ?auto_843289 ?auto_843295 ) ) ( not ( = ?auto_843289 ?auto_843296 ) ) ( not ( = ?auto_843289 ?auto_843297 ) ) ( not ( = ?auto_843290 ?auto_843291 ) ) ( not ( = ?auto_843290 ?auto_843292 ) ) ( not ( = ?auto_843290 ?auto_843293 ) ) ( not ( = ?auto_843290 ?auto_843294 ) ) ( not ( = ?auto_843290 ?auto_843295 ) ) ( not ( = ?auto_843290 ?auto_843296 ) ) ( not ( = ?auto_843290 ?auto_843297 ) ) ( not ( = ?auto_843291 ?auto_843292 ) ) ( not ( = ?auto_843291 ?auto_843293 ) ) ( not ( = ?auto_843291 ?auto_843294 ) ) ( not ( = ?auto_843291 ?auto_843295 ) ) ( not ( = ?auto_843291 ?auto_843296 ) ) ( not ( = ?auto_843291 ?auto_843297 ) ) ( not ( = ?auto_843292 ?auto_843293 ) ) ( not ( = ?auto_843292 ?auto_843294 ) ) ( not ( = ?auto_843292 ?auto_843295 ) ) ( not ( = ?auto_843292 ?auto_843296 ) ) ( not ( = ?auto_843292 ?auto_843297 ) ) ( not ( = ?auto_843293 ?auto_843294 ) ) ( not ( = ?auto_843293 ?auto_843295 ) ) ( not ( = ?auto_843293 ?auto_843296 ) ) ( not ( = ?auto_843293 ?auto_843297 ) ) ( not ( = ?auto_843294 ?auto_843295 ) ) ( not ( = ?auto_843294 ?auto_843296 ) ) ( not ( = ?auto_843294 ?auto_843297 ) ) ( not ( = ?auto_843295 ?auto_843296 ) ) ( not ( = ?auto_843295 ?auto_843297 ) ) ( not ( = ?auto_843296 ?auto_843297 ) ) ( ON ?auto_843295 ?auto_843296 ) ( ON ?auto_843294 ?auto_843295 ) ( ON ?auto_843293 ?auto_843294 ) ( ON ?auto_843292 ?auto_843293 ) ( ON ?auto_843291 ?auto_843292 ) ( ON ?auto_843290 ?auto_843291 ) ( ON ?auto_843289 ?auto_843290 ) ( CLEAR ?auto_843287 ) ( ON ?auto_843288 ?auto_843289 ) ( CLEAR ?auto_843288 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_843280 ?auto_843281 ?auto_843282 ?auto_843283 ?auto_843284 ?auto_843285 ?auto_843286 ?auto_843287 ?auto_843288 )
      ( MAKE-17PILE ?auto_843280 ?auto_843281 ?auto_843282 ?auto_843283 ?auto_843284 ?auto_843285 ?auto_843286 ?auto_843287 ?auto_843288 ?auto_843289 ?auto_843290 ?auto_843291 ?auto_843292 ?auto_843293 ?auto_843294 ?auto_843295 ?auto_843296 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_843350 - BLOCK
      ?auto_843351 - BLOCK
      ?auto_843352 - BLOCK
      ?auto_843353 - BLOCK
      ?auto_843354 - BLOCK
      ?auto_843355 - BLOCK
      ?auto_843356 - BLOCK
      ?auto_843357 - BLOCK
      ?auto_843358 - BLOCK
      ?auto_843359 - BLOCK
      ?auto_843360 - BLOCK
      ?auto_843361 - BLOCK
      ?auto_843362 - BLOCK
      ?auto_843363 - BLOCK
      ?auto_843364 - BLOCK
      ?auto_843365 - BLOCK
      ?auto_843366 - BLOCK
    )
    :vars
    (
      ?auto_843367 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_843366 ?auto_843367 ) ( ON-TABLE ?auto_843350 ) ( ON ?auto_843351 ?auto_843350 ) ( ON ?auto_843352 ?auto_843351 ) ( ON ?auto_843353 ?auto_843352 ) ( ON ?auto_843354 ?auto_843353 ) ( ON ?auto_843355 ?auto_843354 ) ( ON ?auto_843356 ?auto_843355 ) ( not ( = ?auto_843350 ?auto_843351 ) ) ( not ( = ?auto_843350 ?auto_843352 ) ) ( not ( = ?auto_843350 ?auto_843353 ) ) ( not ( = ?auto_843350 ?auto_843354 ) ) ( not ( = ?auto_843350 ?auto_843355 ) ) ( not ( = ?auto_843350 ?auto_843356 ) ) ( not ( = ?auto_843350 ?auto_843357 ) ) ( not ( = ?auto_843350 ?auto_843358 ) ) ( not ( = ?auto_843350 ?auto_843359 ) ) ( not ( = ?auto_843350 ?auto_843360 ) ) ( not ( = ?auto_843350 ?auto_843361 ) ) ( not ( = ?auto_843350 ?auto_843362 ) ) ( not ( = ?auto_843350 ?auto_843363 ) ) ( not ( = ?auto_843350 ?auto_843364 ) ) ( not ( = ?auto_843350 ?auto_843365 ) ) ( not ( = ?auto_843350 ?auto_843366 ) ) ( not ( = ?auto_843350 ?auto_843367 ) ) ( not ( = ?auto_843351 ?auto_843352 ) ) ( not ( = ?auto_843351 ?auto_843353 ) ) ( not ( = ?auto_843351 ?auto_843354 ) ) ( not ( = ?auto_843351 ?auto_843355 ) ) ( not ( = ?auto_843351 ?auto_843356 ) ) ( not ( = ?auto_843351 ?auto_843357 ) ) ( not ( = ?auto_843351 ?auto_843358 ) ) ( not ( = ?auto_843351 ?auto_843359 ) ) ( not ( = ?auto_843351 ?auto_843360 ) ) ( not ( = ?auto_843351 ?auto_843361 ) ) ( not ( = ?auto_843351 ?auto_843362 ) ) ( not ( = ?auto_843351 ?auto_843363 ) ) ( not ( = ?auto_843351 ?auto_843364 ) ) ( not ( = ?auto_843351 ?auto_843365 ) ) ( not ( = ?auto_843351 ?auto_843366 ) ) ( not ( = ?auto_843351 ?auto_843367 ) ) ( not ( = ?auto_843352 ?auto_843353 ) ) ( not ( = ?auto_843352 ?auto_843354 ) ) ( not ( = ?auto_843352 ?auto_843355 ) ) ( not ( = ?auto_843352 ?auto_843356 ) ) ( not ( = ?auto_843352 ?auto_843357 ) ) ( not ( = ?auto_843352 ?auto_843358 ) ) ( not ( = ?auto_843352 ?auto_843359 ) ) ( not ( = ?auto_843352 ?auto_843360 ) ) ( not ( = ?auto_843352 ?auto_843361 ) ) ( not ( = ?auto_843352 ?auto_843362 ) ) ( not ( = ?auto_843352 ?auto_843363 ) ) ( not ( = ?auto_843352 ?auto_843364 ) ) ( not ( = ?auto_843352 ?auto_843365 ) ) ( not ( = ?auto_843352 ?auto_843366 ) ) ( not ( = ?auto_843352 ?auto_843367 ) ) ( not ( = ?auto_843353 ?auto_843354 ) ) ( not ( = ?auto_843353 ?auto_843355 ) ) ( not ( = ?auto_843353 ?auto_843356 ) ) ( not ( = ?auto_843353 ?auto_843357 ) ) ( not ( = ?auto_843353 ?auto_843358 ) ) ( not ( = ?auto_843353 ?auto_843359 ) ) ( not ( = ?auto_843353 ?auto_843360 ) ) ( not ( = ?auto_843353 ?auto_843361 ) ) ( not ( = ?auto_843353 ?auto_843362 ) ) ( not ( = ?auto_843353 ?auto_843363 ) ) ( not ( = ?auto_843353 ?auto_843364 ) ) ( not ( = ?auto_843353 ?auto_843365 ) ) ( not ( = ?auto_843353 ?auto_843366 ) ) ( not ( = ?auto_843353 ?auto_843367 ) ) ( not ( = ?auto_843354 ?auto_843355 ) ) ( not ( = ?auto_843354 ?auto_843356 ) ) ( not ( = ?auto_843354 ?auto_843357 ) ) ( not ( = ?auto_843354 ?auto_843358 ) ) ( not ( = ?auto_843354 ?auto_843359 ) ) ( not ( = ?auto_843354 ?auto_843360 ) ) ( not ( = ?auto_843354 ?auto_843361 ) ) ( not ( = ?auto_843354 ?auto_843362 ) ) ( not ( = ?auto_843354 ?auto_843363 ) ) ( not ( = ?auto_843354 ?auto_843364 ) ) ( not ( = ?auto_843354 ?auto_843365 ) ) ( not ( = ?auto_843354 ?auto_843366 ) ) ( not ( = ?auto_843354 ?auto_843367 ) ) ( not ( = ?auto_843355 ?auto_843356 ) ) ( not ( = ?auto_843355 ?auto_843357 ) ) ( not ( = ?auto_843355 ?auto_843358 ) ) ( not ( = ?auto_843355 ?auto_843359 ) ) ( not ( = ?auto_843355 ?auto_843360 ) ) ( not ( = ?auto_843355 ?auto_843361 ) ) ( not ( = ?auto_843355 ?auto_843362 ) ) ( not ( = ?auto_843355 ?auto_843363 ) ) ( not ( = ?auto_843355 ?auto_843364 ) ) ( not ( = ?auto_843355 ?auto_843365 ) ) ( not ( = ?auto_843355 ?auto_843366 ) ) ( not ( = ?auto_843355 ?auto_843367 ) ) ( not ( = ?auto_843356 ?auto_843357 ) ) ( not ( = ?auto_843356 ?auto_843358 ) ) ( not ( = ?auto_843356 ?auto_843359 ) ) ( not ( = ?auto_843356 ?auto_843360 ) ) ( not ( = ?auto_843356 ?auto_843361 ) ) ( not ( = ?auto_843356 ?auto_843362 ) ) ( not ( = ?auto_843356 ?auto_843363 ) ) ( not ( = ?auto_843356 ?auto_843364 ) ) ( not ( = ?auto_843356 ?auto_843365 ) ) ( not ( = ?auto_843356 ?auto_843366 ) ) ( not ( = ?auto_843356 ?auto_843367 ) ) ( not ( = ?auto_843357 ?auto_843358 ) ) ( not ( = ?auto_843357 ?auto_843359 ) ) ( not ( = ?auto_843357 ?auto_843360 ) ) ( not ( = ?auto_843357 ?auto_843361 ) ) ( not ( = ?auto_843357 ?auto_843362 ) ) ( not ( = ?auto_843357 ?auto_843363 ) ) ( not ( = ?auto_843357 ?auto_843364 ) ) ( not ( = ?auto_843357 ?auto_843365 ) ) ( not ( = ?auto_843357 ?auto_843366 ) ) ( not ( = ?auto_843357 ?auto_843367 ) ) ( not ( = ?auto_843358 ?auto_843359 ) ) ( not ( = ?auto_843358 ?auto_843360 ) ) ( not ( = ?auto_843358 ?auto_843361 ) ) ( not ( = ?auto_843358 ?auto_843362 ) ) ( not ( = ?auto_843358 ?auto_843363 ) ) ( not ( = ?auto_843358 ?auto_843364 ) ) ( not ( = ?auto_843358 ?auto_843365 ) ) ( not ( = ?auto_843358 ?auto_843366 ) ) ( not ( = ?auto_843358 ?auto_843367 ) ) ( not ( = ?auto_843359 ?auto_843360 ) ) ( not ( = ?auto_843359 ?auto_843361 ) ) ( not ( = ?auto_843359 ?auto_843362 ) ) ( not ( = ?auto_843359 ?auto_843363 ) ) ( not ( = ?auto_843359 ?auto_843364 ) ) ( not ( = ?auto_843359 ?auto_843365 ) ) ( not ( = ?auto_843359 ?auto_843366 ) ) ( not ( = ?auto_843359 ?auto_843367 ) ) ( not ( = ?auto_843360 ?auto_843361 ) ) ( not ( = ?auto_843360 ?auto_843362 ) ) ( not ( = ?auto_843360 ?auto_843363 ) ) ( not ( = ?auto_843360 ?auto_843364 ) ) ( not ( = ?auto_843360 ?auto_843365 ) ) ( not ( = ?auto_843360 ?auto_843366 ) ) ( not ( = ?auto_843360 ?auto_843367 ) ) ( not ( = ?auto_843361 ?auto_843362 ) ) ( not ( = ?auto_843361 ?auto_843363 ) ) ( not ( = ?auto_843361 ?auto_843364 ) ) ( not ( = ?auto_843361 ?auto_843365 ) ) ( not ( = ?auto_843361 ?auto_843366 ) ) ( not ( = ?auto_843361 ?auto_843367 ) ) ( not ( = ?auto_843362 ?auto_843363 ) ) ( not ( = ?auto_843362 ?auto_843364 ) ) ( not ( = ?auto_843362 ?auto_843365 ) ) ( not ( = ?auto_843362 ?auto_843366 ) ) ( not ( = ?auto_843362 ?auto_843367 ) ) ( not ( = ?auto_843363 ?auto_843364 ) ) ( not ( = ?auto_843363 ?auto_843365 ) ) ( not ( = ?auto_843363 ?auto_843366 ) ) ( not ( = ?auto_843363 ?auto_843367 ) ) ( not ( = ?auto_843364 ?auto_843365 ) ) ( not ( = ?auto_843364 ?auto_843366 ) ) ( not ( = ?auto_843364 ?auto_843367 ) ) ( not ( = ?auto_843365 ?auto_843366 ) ) ( not ( = ?auto_843365 ?auto_843367 ) ) ( not ( = ?auto_843366 ?auto_843367 ) ) ( ON ?auto_843365 ?auto_843366 ) ( ON ?auto_843364 ?auto_843365 ) ( ON ?auto_843363 ?auto_843364 ) ( ON ?auto_843362 ?auto_843363 ) ( ON ?auto_843361 ?auto_843362 ) ( ON ?auto_843360 ?auto_843361 ) ( ON ?auto_843359 ?auto_843360 ) ( ON ?auto_843358 ?auto_843359 ) ( CLEAR ?auto_843356 ) ( ON ?auto_843357 ?auto_843358 ) ( CLEAR ?auto_843357 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_843350 ?auto_843351 ?auto_843352 ?auto_843353 ?auto_843354 ?auto_843355 ?auto_843356 ?auto_843357 )
      ( MAKE-17PILE ?auto_843350 ?auto_843351 ?auto_843352 ?auto_843353 ?auto_843354 ?auto_843355 ?auto_843356 ?auto_843357 ?auto_843358 ?auto_843359 ?auto_843360 ?auto_843361 ?auto_843362 ?auto_843363 ?auto_843364 ?auto_843365 ?auto_843366 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_843420 - BLOCK
      ?auto_843421 - BLOCK
      ?auto_843422 - BLOCK
      ?auto_843423 - BLOCK
      ?auto_843424 - BLOCK
      ?auto_843425 - BLOCK
      ?auto_843426 - BLOCK
      ?auto_843427 - BLOCK
      ?auto_843428 - BLOCK
      ?auto_843429 - BLOCK
      ?auto_843430 - BLOCK
      ?auto_843431 - BLOCK
      ?auto_843432 - BLOCK
      ?auto_843433 - BLOCK
      ?auto_843434 - BLOCK
      ?auto_843435 - BLOCK
      ?auto_843436 - BLOCK
    )
    :vars
    (
      ?auto_843437 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_843436 ?auto_843437 ) ( ON-TABLE ?auto_843420 ) ( ON ?auto_843421 ?auto_843420 ) ( ON ?auto_843422 ?auto_843421 ) ( ON ?auto_843423 ?auto_843422 ) ( ON ?auto_843424 ?auto_843423 ) ( ON ?auto_843425 ?auto_843424 ) ( not ( = ?auto_843420 ?auto_843421 ) ) ( not ( = ?auto_843420 ?auto_843422 ) ) ( not ( = ?auto_843420 ?auto_843423 ) ) ( not ( = ?auto_843420 ?auto_843424 ) ) ( not ( = ?auto_843420 ?auto_843425 ) ) ( not ( = ?auto_843420 ?auto_843426 ) ) ( not ( = ?auto_843420 ?auto_843427 ) ) ( not ( = ?auto_843420 ?auto_843428 ) ) ( not ( = ?auto_843420 ?auto_843429 ) ) ( not ( = ?auto_843420 ?auto_843430 ) ) ( not ( = ?auto_843420 ?auto_843431 ) ) ( not ( = ?auto_843420 ?auto_843432 ) ) ( not ( = ?auto_843420 ?auto_843433 ) ) ( not ( = ?auto_843420 ?auto_843434 ) ) ( not ( = ?auto_843420 ?auto_843435 ) ) ( not ( = ?auto_843420 ?auto_843436 ) ) ( not ( = ?auto_843420 ?auto_843437 ) ) ( not ( = ?auto_843421 ?auto_843422 ) ) ( not ( = ?auto_843421 ?auto_843423 ) ) ( not ( = ?auto_843421 ?auto_843424 ) ) ( not ( = ?auto_843421 ?auto_843425 ) ) ( not ( = ?auto_843421 ?auto_843426 ) ) ( not ( = ?auto_843421 ?auto_843427 ) ) ( not ( = ?auto_843421 ?auto_843428 ) ) ( not ( = ?auto_843421 ?auto_843429 ) ) ( not ( = ?auto_843421 ?auto_843430 ) ) ( not ( = ?auto_843421 ?auto_843431 ) ) ( not ( = ?auto_843421 ?auto_843432 ) ) ( not ( = ?auto_843421 ?auto_843433 ) ) ( not ( = ?auto_843421 ?auto_843434 ) ) ( not ( = ?auto_843421 ?auto_843435 ) ) ( not ( = ?auto_843421 ?auto_843436 ) ) ( not ( = ?auto_843421 ?auto_843437 ) ) ( not ( = ?auto_843422 ?auto_843423 ) ) ( not ( = ?auto_843422 ?auto_843424 ) ) ( not ( = ?auto_843422 ?auto_843425 ) ) ( not ( = ?auto_843422 ?auto_843426 ) ) ( not ( = ?auto_843422 ?auto_843427 ) ) ( not ( = ?auto_843422 ?auto_843428 ) ) ( not ( = ?auto_843422 ?auto_843429 ) ) ( not ( = ?auto_843422 ?auto_843430 ) ) ( not ( = ?auto_843422 ?auto_843431 ) ) ( not ( = ?auto_843422 ?auto_843432 ) ) ( not ( = ?auto_843422 ?auto_843433 ) ) ( not ( = ?auto_843422 ?auto_843434 ) ) ( not ( = ?auto_843422 ?auto_843435 ) ) ( not ( = ?auto_843422 ?auto_843436 ) ) ( not ( = ?auto_843422 ?auto_843437 ) ) ( not ( = ?auto_843423 ?auto_843424 ) ) ( not ( = ?auto_843423 ?auto_843425 ) ) ( not ( = ?auto_843423 ?auto_843426 ) ) ( not ( = ?auto_843423 ?auto_843427 ) ) ( not ( = ?auto_843423 ?auto_843428 ) ) ( not ( = ?auto_843423 ?auto_843429 ) ) ( not ( = ?auto_843423 ?auto_843430 ) ) ( not ( = ?auto_843423 ?auto_843431 ) ) ( not ( = ?auto_843423 ?auto_843432 ) ) ( not ( = ?auto_843423 ?auto_843433 ) ) ( not ( = ?auto_843423 ?auto_843434 ) ) ( not ( = ?auto_843423 ?auto_843435 ) ) ( not ( = ?auto_843423 ?auto_843436 ) ) ( not ( = ?auto_843423 ?auto_843437 ) ) ( not ( = ?auto_843424 ?auto_843425 ) ) ( not ( = ?auto_843424 ?auto_843426 ) ) ( not ( = ?auto_843424 ?auto_843427 ) ) ( not ( = ?auto_843424 ?auto_843428 ) ) ( not ( = ?auto_843424 ?auto_843429 ) ) ( not ( = ?auto_843424 ?auto_843430 ) ) ( not ( = ?auto_843424 ?auto_843431 ) ) ( not ( = ?auto_843424 ?auto_843432 ) ) ( not ( = ?auto_843424 ?auto_843433 ) ) ( not ( = ?auto_843424 ?auto_843434 ) ) ( not ( = ?auto_843424 ?auto_843435 ) ) ( not ( = ?auto_843424 ?auto_843436 ) ) ( not ( = ?auto_843424 ?auto_843437 ) ) ( not ( = ?auto_843425 ?auto_843426 ) ) ( not ( = ?auto_843425 ?auto_843427 ) ) ( not ( = ?auto_843425 ?auto_843428 ) ) ( not ( = ?auto_843425 ?auto_843429 ) ) ( not ( = ?auto_843425 ?auto_843430 ) ) ( not ( = ?auto_843425 ?auto_843431 ) ) ( not ( = ?auto_843425 ?auto_843432 ) ) ( not ( = ?auto_843425 ?auto_843433 ) ) ( not ( = ?auto_843425 ?auto_843434 ) ) ( not ( = ?auto_843425 ?auto_843435 ) ) ( not ( = ?auto_843425 ?auto_843436 ) ) ( not ( = ?auto_843425 ?auto_843437 ) ) ( not ( = ?auto_843426 ?auto_843427 ) ) ( not ( = ?auto_843426 ?auto_843428 ) ) ( not ( = ?auto_843426 ?auto_843429 ) ) ( not ( = ?auto_843426 ?auto_843430 ) ) ( not ( = ?auto_843426 ?auto_843431 ) ) ( not ( = ?auto_843426 ?auto_843432 ) ) ( not ( = ?auto_843426 ?auto_843433 ) ) ( not ( = ?auto_843426 ?auto_843434 ) ) ( not ( = ?auto_843426 ?auto_843435 ) ) ( not ( = ?auto_843426 ?auto_843436 ) ) ( not ( = ?auto_843426 ?auto_843437 ) ) ( not ( = ?auto_843427 ?auto_843428 ) ) ( not ( = ?auto_843427 ?auto_843429 ) ) ( not ( = ?auto_843427 ?auto_843430 ) ) ( not ( = ?auto_843427 ?auto_843431 ) ) ( not ( = ?auto_843427 ?auto_843432 ) ) ( not ( = ?auto_843427 ?auto_843433 ) ) ( not ( = ?auto_843427 ?auto_843434 ) ) ( not ( = ?auto_843427 ?auto_843435 ) ) ( not ( = ?auto_843427 ?auto_843436 ) ) ( not ( = ?auto_843427 ?auto_843437 ) ) ( not ( = ?auto_843428 ?auto_843429 ) ) ( not ( = ?auto_843428 ?auto_843430 ) ) ( not ( = ?auto_843428 ?auto_843431 ) ) ( not ( = ?auto_843428 ?auto_843432 ) ) ( not ( = ?auto_843428 ?auto_843433 ) ) ( not ( = ?auto_843428 ?auto_843434 ) ) ( not ( = ?auto_843428 ?auto_843435 ) ) ( not ( = ?auto_843428 ?auto_843436 ) ) ( not ( = ?auto_843428 ?auto_843437 ) ) ( not ( = ?auto_843429 ?auto_843430 ) ) ( not ( = ?auto_843429 ?auto_843431 ) ) ( not ( = ?auto_843429 ?auto_843432 ) ) ( not ( = ?auto_843429 ?auto_843433 ) ) ( not ( = ?auto_843429 ?auto_843434 ) ) ( not ( = ?auto_843429 ?auto_843435 ) ) ( not ( = ?auto_843429 ?auto_843436 ) ) ( not ( = ?auto_843429 ?auto_843437 ) ) ( not ( = ?auto_843430 ?auto_843431 ) ) ( not ( = ?auto_843430 ?auto_843432 ) ) ( not ( = ?auto_843430 ?auto_843433 ) ) ( not ( = ?auto_843430 ?auto_843434 ) ) ( not ( = ?auto_843430 ?auto_843435 ) ) ( not ( = ?auto_843430 ?auto_843436 ) ) ( not ( = ?auto_843430 ?auto_843437 ) ) ( not ( = ?auto_843431 ?auto_843432 ) ) ( not ( = ?auto_843431 ?auto_843433 ) ) ( not ( = ?auto_843431 ?auto_843434 ) ) ( not ( = ?auto_843431 ?auto_843435 ) ) ( not ( = ?auto_843431 ?auto_843436 ) ) ( not ( = ?auto_843431 ?auto_843437 ) ) ( not ( = ?auto_843432 ?auto_843433 ) ) ( not ( = ?auto_843432 ?auto_843434 ) ) ( not ( = ?auto_843432 ?auto_843435 ) ) ( not ( = ?auto_843432 ?auto_843436 ) ) ( not ( = ?auto_843432 ?auto_843437 ) ) ( not ( = ?auto_843433 ?auto_843434 ) ) ( not ( = ?auto_843433 ?auto_843435 ) ) ( not ( = ?auto_843433 ?auto_843436 ) ) ( not ( = ?auto_843433 ?auto_843437 ) ) ( not ( = ?auto_843434 ?auto_843435 ) ) ( not ( = ?auto_843434 ?auto_843436 ) ) ( not ( = ?auto_843434 ?auto_843437 ) ) ( not ( = ?auto_843435 ?auto_843436 ) ) ( not ( = ?auto_843435 ?auto_843437 ) ) ( not ( = ?auto_843436 ?auto_843437 ) ) ( ON ?auto_843435 ?auto_843436 ) ( ON ?auto_843434 ?auto_843435 ) ( ON ?auto_843433 ?auto_843434 ) ( ON ?auto_843432 ?auto_843433 ) ( ON ?auto_843431 ?auto_843432 ) ( ON ?auto_843430 ?auto_843431 ) ( ON ?auto_843429 ?auto_843430 ) ( ON ?auto_843428 ?auto_843429 ) ( ON ?auto_843427 ?auto_843428 ) ( CLEAR ?auto_843425 ) ( ON ?auto_843426 ?auto_843427 ) ( CLEAR ?auto_843426 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_843420 ?auto_843421 ?auto_843422 ?auto_843423 ?auto_843424 ?auto_843425 ?auto_843426 )
      ( MAKE-17PILE ?auto_843420 ?auto_843421 ?auto_843422 ?auto_843423 ?auto_843424 ?auto_843425 ?auto_843426 ?auto_843427 ?auto_843428 ?auto_843429 ?auto_843430 ?auto_843431 ?auto_843432 ?auto_843433 ?auto_843434 ?auto_843435 ?auto_843436 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_843490 - BLOCK
      ?auto_843491 - BLOCK
      ?auto_843492 - BLOCK
      ?auto_843493 - BLOCK
      ?auto_843494 - BLOCK
      ?auto_843495 - BLOCK
      ?auto_843496 - BLOCK
      ?auto_843497 - BLOCK
      ?auto_843498 - BLOCK
      ?auto_843499 - BLOCK
      ?auto_843500 - BLOCK
      ?auto_843501 - BLOCK
      ?auto_843502 - BLOCK
      ?auto_843503 - BLOCK
      ?auto_843504 - BLOCK
      ?auto_843505 - BLOCK
      ?auto_843506 - BLOCK
    )
    :vars
    (
      ?auto_843507 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_843506 ?auto_843507 ) ( ON-TABLE ?auto_843490 ) ( ON ?auto_843491 ?auto_843490 ) ( ON ?auto_843492 ?auto_843491 ) ( ON ?auto_843493 ?auto_843492 ) ( ON ?auto_843494 ?auto_843493 ) ( not ( = ?auto_843490 ?auto_843491 ) ) ( not ( = ?auto_843490 ?auto_843492 ) ) ( not ( = ?auto_843490 ?auto_843493 ) ) ( not ( = ?auto_843490 ?auto_843494 ) ) ( not ( = ?auto_843490 ?auto_843495 ) ) ( not ( = ?auto_843490 ?auto_843496 ) ) ( not ( = ?auto_843490 ?auto_843497 ) ) ( not ( = ?auto_843490 ?auto_843498 ) ) ( not ( = ?auto_843490 ?auto_843499 ) ) ( not ( = ?auto_843490 ?auto_843500 ) ) ( not ( = ?auto_843490 ?auto_843501 ) ) ( not ( = ?auto_843490 ?auto_843502 ) ) ( not ( = ?auto_843490 ?auto_843503 ) ) ( not ( = ?auto_843490 ?auto_843504 ) ) ( not ( = ?auto_843490 ?auto_843505 ) ) ( not ( = ?auto_843490 ?auto_843506 ) ) ( not ( = ?auto_843490 ?auto_843507 ) ) ( not ( = ?auto_843491 ?auto_843492 ) ) ( not ( = ?auto_843491 ?auto_843493 ) ) ( not ( = ?auto_843491 ?auto_843494 ) ) ( not ( = ?auto_843491 ?auto_843495 ) ) ( not ( = ?auto_843491 ?auto_843496 ) ) ( not ( = ?auto_843491 ?auto_843497 ) ) ( not ( = ?auto_843491 ?auto_843498 ) ) ( not ( = ?auto_843491 ?auto_843499 ) ) ( not ( = ?auto_843491 ?auto_843500 ) ) ( not ( = ?auto_843491 ?auto_843501 ) ) ( not ( = ?auto_843491 ?auto_843502 ) ) ( not ( = ?auto_843491 ?auto_843503 ) ) ( not ( = ?auto_843491 ?auto_843504 ) ) ( not ( = ?auto_843491 ?auto_843505 ) ) ( not ( = ?auto_843491 ?auto_843506 ) ) ( not ( = ?auto_843491 ?auto_843507 ) ) ( not ( = ?auto_843492 ?auto_843493 ) ) ( not ( = ?auto_843492 ?auto_843494 ) ) ( not ( = ?auto_843492 ?auto_843495 ) ) ( not ( = ?auto_843492 ?auto_843496 ) ) ( not ( = ?auto_843492 ?auto_843497 ) ) ( not ( = ?auto_843492 ?auto_843498 ) ) ( not ( = ?auto_843492 ?auto_843499 ) ) ( not ( = ?auto_843492 ?auto_843500 ) ) ( not ( = ?auto_843492 ?auto_843501 ) ) ( not ( = ?auto_843492 ?auto_843502 ) ) ( not ( = ?auto_843492 ?auto_843503 ) ) ( not ( = ?auto_843492 ?auto_843504 ) ) ( not ( = ?auto_843492 ?auto_843505 ) ) ( not ( = ?auto_843492 ?auto_843506 ) ) ( not ( = ?auto_843492 ?auto_843507 ) ) ( not ( = ?auto_843493 ?auto_843494 ) ) ( not ( = ?auto_843493 ?auto_843495 ) ) ( not ( = ?auto_843493 ?auto_843496 ) ) ( not ( = ?auto_843493 ?auto_843497 ) ) ( not ( = ?auto_843493 ?auto_843498 ) ) ( not ( = ?auto_843493 ?auto_843499 ) ) ( not ( = ?auto_843493 ?auto_843500 ) ) ( not ( = ?auto_843493 ?auto_843501 ) ) ( not ( = ?auto_843493 ?auto_843502 ) ) ( not ( = ?auto_843493 ?auto_843503 ) ) ( not ( = ?auto_843493 ?auto_843504 ) ) ( not ( = ?auto_843493 ?auto_843505 ) ) ( not ( = ?auto_843493 ?auto_843506 ) ) ( not ( = ?auto_843493 ?auto_843507 ) ) ( not ( = ?auto_843494 ?auto_843495 ) ) ( not ( = ?auto_843494 ?auto_843496 ) ) ( not ( = ?auto_843494 ?auto_843497 ) ) ( not ( = ?auto_843494 ?auto_843498 ) ) ( not ( = ?auto_843494 ?auto_843499 ) ) ( not ( = ?auto_843494 ?auto_843500 ) ) ( not ( = ?auto_843494 ?auto_843501 ) ) ( not ( = ?auto_843494 ?auto_843502 ) ) ( not ( = ?auto_843494 ?auto_843503 ) ) ( not ( = ?auto_843494 ?auto_843504 ) ) ( not ( = ?auto_843494 ?auto_843505 ) ) ( not ( = ?auto_843494 ?auto_843506 ) ) ( not ( = ?auto_843494 ?auto_843507 ) ) ( not ( = ?auto_843495 ?auto_843496 ) ) ( not ( = ?auto_843495 ?auto_843497 ) ) ( not ( = ?auto_843495 ?auto_843498 ) ) ( not ( = ?auto_843495 ?auto_843499 ) ) ( not ( = ?auto_843495 ?auto_843500 ) ) ( not ( = ?auto_843495 ?auto_843501 ) ) ( not ( = ?auto_843495 ?auto_843502 ) ) ( not ( = ?auto_843495 ?auto_843503 ) ) ( not ( = ?auto_843495 ?auto_843504 ) ) ( not ( = ?auto_843495 ?auto_843505 ) ) ( not ( = ?auto_843495 ?auto_843506 ) ) ( not ( = ?auto_843495 ?auto_843507 ) ) ( not ( = ?auto_843496 ?auto_843497 ) ) ( not ( = ?auto_843496 ?auto_843498 ) ) ( not ( = ?auto_843496 ?auto_843499 ) ) ( not ( = ?auto_843496 ?auto_843500 ) ) ( not ( = ?auto_843496 ?auto_843501 ) ) ( not ( = ?auto_843496 ?auto_843502 ) ) ( not ( = ?auto_843496 ?auto_843503 ) ) ( not ( = ?auto_843496 ?auto_843504 ) ) ( not ( = ?auto_843496 ?auto_843505 ) ) ( not ( = ?auto_843496 ?auto_843506 ) ) ( not ( = ?auto_843496 ?auto_843507 ) ) ( not ( = ?auto_843497 ?auto_843498 ) ) ( not ( = ?auto_843497 ?auto_843499 ) ) ( not ( = ?auto_843497 ?auto_843500 ) ) ( not ( = ?auto_843497 ?auto_843501 ) ) ( not ( = ?auto_843497 ?auto_843502 ) ) ( not ( = ?auto_843497 ?auto_843503 ) ) ( not ( = ?auto_843497 ?auto_843504 ) ) ( not ( = ?auto_843497 ?auto_843505 ) ) ( not ( = ?auto_843497 ?auto_843506 ) ) ( not ( = ?auto_843497 ?auto_843507 ) ) ( not ( = ?auto_843498 ?auto_843499 ) ) ( not ( = ?auto_843498 ?auto_843500 ) ) ( not ( = ?auto_843498 ?auto_843501 ) ) ( not ( = ?auto_843498 ?auto_843502 ) ) ( not ( = ?auto_843498 ?auto_843503 ) ) ( not ( = ?auto_843498 ?auto_843504 ) ) ( not ( = ?auto_843498 ?auto_843505 ) ) ( not ( = ?auto_843498 ?auto_843506 ) ) ( not ( = ?auto_843498 ?auto_843507 ) ) ( not ( = ?auto_843499 ?auto_843500 ) ) ( not ( = ?auto_843499 ?auto_843501 ) ) ( not ( = ?auto_843499 ?auto_843502 ) ) ( not ( = ?auto_843499 ?auto_843503 ) ) ( not ( = ?auto_843499 ?auto_843504 ) ) ( not ( = ?auto_843499 ?auto_843505 ) ) ( not ( = ?auto_843499 ?auto_843506 ) ) ( not ( = ?auto_843499 ?auto_843507 ) ) ( not ( = ?auto_843500 ?auto_843501 ) ) ( not ( = ?auto_843500 ?auto_843502 ) ) ( not ( = ?auto_843500 ?auto_843503 ) ) ( not ( = ?auto_843500 ?auto_843504 ) ) ( not ( = ?auto_843500 ?auto_843505 ) ) ( not ( = ?auto_843500 ?auto_843506 ) ) ( not ( = ?auto_843500 ?auto_843507 ) ) ( not ( = ?auto_843501 ?auto_843502 ) ) ( not ( = ?auto_843501 ?auto_843503 ) ) ( not ( = ?auto_843501 ?auto_843504 ) ) ( not ( = ?auto_843501 ?auto_843505 ) ) ( not ( = ?auto_843501 ?auto_843506 ) ) ( not ( = ?auto_843501 ?auto_843507 ) ) ( not ( = ?auto_843502 ?auto_843503 ) ) ( not ( = ?auto_843502 ?auto_843504 ) ) ( not ( = ?auto_843502 ?auto_843505 ) ) ( not ( = ?auto_843502 ?auto_843506 ) ) ( not ( = ?auto_843502 ?auto_843507 ) ) ( not ( = ?auto_843503 ?auto_843504 ) ) ( not ( = ?auto_843503 ?auto_843505 ) ) ( not ( = ?auto_843503 ?auto_843506 ) ) ( not ( = ?auto_843503 ?auto_843507 ) ) ( not ( = ?auto_843504 ?auto_843505 ) ) ( not ( = ?auto_843504 ?auto_843506 ) ) ( not ( = ?auto_843504 ?auto_843507 ) ) ( not ( = ?auto_843505 ?auto_843506 ) ) ( not ( = ?auto_843505 ?auto_843507 ) ) ( not ( = ?auto_843506 ?auto_843507 ) ) ( ON ?auto_843505 ?auto_843506 ) ( ON ?auto_843504 ?auto_843505 ) ( ON ?auto_843503 ?auto_843504 ) ( ON ?auto_843502 ?auto_843503 ) ( ON ?auto_843501 ?auto_843502 ) ( ON ?auto_843500 ?auto_843501 ) ( ON ?auto_843499 ?auto_843500 ) ( ON ?auto_843498 ?auto_843499 ) ( ON ?auto_843497 ?auto_843498 ) ( ON ?auto_843496 ?auto_843497 ) ( CLEAR ?auto_843494 ) ( ON ?auto_843495 ?auto_843496 ) ( CLEAR ?auto_843495 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_843490 ?auto_843491 ?auto_843492 ?auto_843493 ?auto_843494 ?auto_843495 )
      ( MAKE-17PILE ?auto_843490 ?auto_843491 ?auto_843492 ?auto_843493 ?auto_843494 ?auto_843495 ?auto_843496 ?auto_843497 ?auto_843498 ?auto_843499 ?auto_843500 ?auto_843501 ?auto_843502 ?auto_843503 ?auto_843504 ?auto_843505 ?auto_843506 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_843560 - BLOCK
      ?auto_843561 - BLOCK
      ?auto_843562 - BLOCK
      ?auto_843563 - BLOCK
      ?auto_843564 - BLOCK
      ?auto_843565 - BLOCK
      ?auto_843566 - BLOCK
      ?auto_843567 - BLOCK
      ?auto_843568 - BLOCK
      ?auto_843569 - BLOCK
      ?auto_843570 - BLOCK
      ?auto_843571 - BLOCK
      ?auto_843572 - BLOCK
      ?auto_843573 - BLOCK
      ?auto_843574 - BLOCK
      ?auto_843575 - BLOCK
      ?auto_843576 - BLOCK
    )
    :vars
    (
      ?auto_843577 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_843576 ?auto_843577 ) ( ON-TABLE ?auto_843560 ) ( ON ?auto_843561 ?auto_843560 ) ( ON ?auto_843562 ?auto_843561 ) ( ON ?auto_843563 ?auto_843562 ) ( not ( = ?auto_843560 ?auto_843561 ) ) ( not ( = ?auto_843560 ?auto_843562 ) ) ( not ( = ?auto_843560 ?auto_843563 ) ) ( not ( = ?auto_843560 ?auto_843564 ) ) ( not ( = ?auto_843560 ?auto_843565 ) ) ( not ( = ?auto_843560 ?auto_843566 ) ) ( not ( = ?auto_843560 ?auto_843567 ) ) ( not ( = ?auto_843560 ?auto_843568 ) ) ( not ( = ?auto_843560 ?auto_843569 ) ) ( not ( = ?auto_843560 ?auto_843570 ) ) ( not ( = ?auto_843560 ?auto_843571 ) ) ( not ( = ?auto_843560 ?auto_843572 ) ) ( not ( = ?auto_843560 ?auto_843573 ) ) ( not ( = ?auto_843560 ?auto_843574 ) ) ( not ( = ?auto_843560 ?auto_843575 ) ) ( not ( = ?auto_843560 ?auto_843576 ) ) ( not ( = ?auto_843560 ?auto_843577 ) ) ( not ( = ?auto_843561 ?auto_843562 ) ) ( not ( = ?auto_843561 ?auto_843563 ) ) ( not ( = ?auto_843561 ?auto_843564 ) ) ( not ( = ?auto_843561 ?auto_843565 ) ) ( not ( = ?auto_843561 ?auto_843566 ) ) ( not ( = ?auto_843561 ?auto_843567 ) ) ( not ( = ?auto_843561 ?auto_843568 ) ) ( not ( = ?auto_843561 ?auto_843569 ) ) ( not ( = ?auto_843561 ?auto_843570 ) ) ( not ( = ?auto_843561 ?auto_843571 ) ) ( not ( = ?auto_843561 ?auto_843572 ) ) ( not ( = ?auto_843561 ?auto_843573 ) ) ( not ( = ?auto_843561 ?auto_843574 ) ) ( not ( = ?auto_843561 ?auto_843575 ) ) ( not ( = ?auto_843561 ?auto_843576 ) ) ( not ( = ?auto_843561 ?auto_843577 ) ) ( not ( = ?auto_843562 ?auto_843563 ) ) ( not ( = ?auto_843562 ?auto_843564 ) ) ( not ( = ?auto_843562 ?auto_843565 ) ) ( not ( = ?auto_843562 ?auto_843566 ) ) ( not ( = ?auto_843562 ?auto_843567 ) ) ( not ( = ?auto_843562 ?auto_843568 ) ) ( not ( = ?auto_843562 ?auto_843569 ) ) ( not ( = ?auto_843562 ?auto_843570 ) ) ( not ( = ?auto_843562 ?auto_843571 ) ) ( not ( = ?auto_843562 ?auto_843572 ) ) ( not ( = ?auto_843562 ?auto_843573 ) ) ( not ( = ?auto_843562 ?auto_843574 ) ) ( not ( = ?auto_843562 ?auto_843575 ) ) ( not ( = ?auto_843562 ?auto_843576 ) ) ( not ( = ?auto_843562 ?auto_843577 ) ) ( not ( = ?auto_843563 ?auto_843564 ) ) ( not ( = ?auto_843563 ?auto_843565 ) ) ( not ( = ?auto_843563 ?auto_843566 ) ) ( not ( = ?auto_843563 ?auto_843567 ) ) ( not ( = ?auto_843563 ?auto_843568 ) ) ( not ( = ?auto_843563 ?auto_843569 ) ) ( not ( = ?auto_843563 ?auto_843570 ) ) ( not ( = ?auto_843563 ?auto_843571 ) ) ( not ( = ?auto_843563 ?auto_843572 ) ) ( not ( = ?auto_843563 ?auto_843573 ) ) ( not ( = ?auto_843563 ?auto_843574 ) ) ( not ( = ?auto_843563 ?auto_843575 ) ) ( not ( = ?auto_843563 ?auto_843576 ) ) ( not ( = ?auto_843563 ?auto_843577 ) ) ( not ( = ?auto_843564 ?auto_843565 ) ) ( not ( = ?auto_843564 ?auto_843566 ) ) ( not ( = ?auto_843564 ?auto_843567 ) ) ( not ( = ?auto_843564 ?auto_843568 ) ) ( not ( = ?auto_843564 ?auto_843569 ) ) ( not ( = ?auto_843564 ?auto_843570 ) ) ( not ( = ?auto_843564 ?auto_843571 ) ) ( not ( = ?auto_843564 ?auto_843572 ) ) ( not ( = ?auto_843564 ?auto_843573 ) ) ( not ( = ?auto_843564 ?auto_843574 ) ) ( not ( = ?auto_843564 ?auto_843575 ) ) ( not ( = ?auto_843564 ?auto_843576 ) ) ( not ( = ?auto_843564 ?auto_843577 ) ) ( not ( = ?auto_843565 ?auto_843566 ) ) ( not ( = ?auto_843565 ?auto_843567 ) ) ( not ( = ?auto_843565 ?auto_843568 ) ) ( not ( = ?auto_843565 ?auto_843569 ) ) ( not ( = ?auto_843565 ?auto_843570 ) ) ( not ( = ?auto_843565 ?auto_843571 ) ) ( not ( = ?auto_843565 ?auto_843572 ) ) ( not ( = ?auto_843565 ?auto_843573 ) ) ( not ( = ?auto_843565 ?auto_843574 ) ) ( not ( = ?auto_843565 ?auto_843575 ) ) ( not ( = ?auto_843565 ?auto_843576 ) ) ( not ( = ?auto_843565 ?auto_843577 ) ) ( not ( = ?auto_843566 ?auto_843567 ) ) ( not ( = ?auto_843566 ?auto_843568 ) ) ( not ( = ?auto_843566 ?auto_843569 ) ) ( not ( = ?auto_843566 ?auto_843570 ) ) ( not ( = ?auto_843566 ?auto_843571 ) ) ( not ( = ?auto_843566 ?auto_843572 ) ) ( not ( = ?auto_843566 ?auto_843573 ) ) ( not ( = ?auto_843566 ?auto_843574 ) ) ( not ( = ?auto_843566 ?auto_843575 ) ) ( not ( = ?auto_843566 ?auto_843576 ) ) ( not ( = ?auto_843566 ?auto_843577 ) ) ( not ( = ?auto_843567 ?auto_843568 ) ) ( not ( = ?auto_843567 ?auto_843569 ) ) ( not ( = ?auto_843567 ?auto_843570 ) ) ( not ( = ?auto_843567 ?auto_843571 ) ) ( not ( = ?auto_843567 ?auto_843572 ) ) ( not ( = ?auto_843567 ?auto_843573 ) ) ( not ( = ?auto_843567 ?auto_843574 ) ) ( not ( = ?auto_843567 ?auto_843575 ) ) ( not ( = ?auto_843567 ?auto_843576 ) ) ( not ( = ?auto_843567 ?auto_843577 ) ) ( not ( = ?auto_843568 ?auto_843569 ) ) ( not ( = ?auto_843568 ?auto_843570 ) ) ( not ( = ?auto_843568 ?auto_843571 ) ) ( not ( = ?auto_843568 ?auto_843572 ) ) ( not ( = ?auto_843568 ?auto_843573 ) ) ( not ( = ?auto_843568 ?auto_843574 ) ) ( not ( = ?auto_843568 ?auto_843575 ) ) ( not ( = ?auto_843568 ?auto_843576 ) ) ( not ( = ?auto_843568 ?auto_843577 ) ) ( not ( = ?auto_843569 ?auto_843570 ) ) ( not ( = ?auto_843569 ?auto_843571 ) ) ( not ( = ?auto_843569 ?auto_843572 ) ) ( not ( = ?auto_843569 ?auto_843573 ) ) ( not ( = ?auto_843569 ?auto_843574 ) ) ( not ( = ?auto_843569 ?auto_843575 ) ) ( not ( = ?auto_843569 ?auto_843576 ) ) ( not ( = ?auto_843569 ?auto_843577 ) ) ( not ( = ?auto_843570 ?auto_843571 ) ) ( not ( = ?auto_843570 ?auto_843572 ) ) ( not ( = ?auto_843570 ?auto_843573 ) ) ( not ( = ?auto_843570 ?auto_843574 ) ) ( not ( = ?auto_843570 ?auto_843575 ) ) ( not ( = ?auto_843570 ?auto_843576 ) ) ( not ( = ?auto_843570 ?auto_843577 ) ) ( not ( = ?auto_843571 ?auto_843572 ) ) ( not ( = ?auto_843571 ?auto_843573 ) ) ( not ( = ?auto_843571 ?auto_843574 ) ) ( not ( = ?auto_843571 ?auto_843575 ) ) ( not ( = ?auto_843571 ?auto_843576 ) ) ( not ( = ?auto_843571 ?auto_843577 ) ) ( not ( = ?auto_843572 ?auto_843573 ) ) ( not ( = ?auto_843572 ?auto_843574 ) ) ( not ( = ?auto_843572 ?auto_843575 ) ) ( not ( = ?auto_843572 ?auto_843576 ) ) ( not ( = ?auto_843572 ?auto_843577 ) ) ( not ( = ?auto_843573 ?auto_843574 ) ) ( not ( = ?auto_843573 ?auto_843575 ) ) ( not ( = ?auto_843573 ?auto_843576 ) ) ( not ( = ?auto_843573 ?auto_843577 ) ) ( not ( = ?auto_843574 ?auto_843575 ) ) ( not ( = ?auto_843574 ?auto_843576 ) ) ( not ( = ?auto_843574 ?auto_843577 ) ) ( not ( = ?auto_843575 ?auto_843576 ) ) ( not ( = ?auto_843575 ?auto_843577 ) ) ( not ( = ?auto_843576 ?auto_843577 ) ) ( ON ?auto_843575 ?auto_843576 ) ( ON ?auto_843574 ?auto_843575 ) ( ON ?auto_843573 ?auto_843574 ) ( ON ?auto_843572 ?auto_843573 ) ( ON ?auto_843571 ?auto_843572 ) ( ON ?auto_843570 ?auto_843571 ) ( ON ?auto_843569 ?auto_843570 ) ( ON ?auto_843568 ?auto_843569 ) ( ON ?auto_843567 ?auto_843568 ) ( ON ?auto_843566 ?auto_843567 ) ( ON ?auto_843565 ?auto_843566 ) ( CLEAR ?auto_843563 ) ( ON ?auto_843564 ?auto_843565 ) ( CLEAR ?auto_843564 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_843560 ?auto_843561 ?auto_843562 ?auto_843563 ?auto_843564 )
      ( MAKE-17PILE ?auto_843560 ?auto_843561 ?auto_843562 ?auto_843563 ?auto_843564 ?auto_843565 ?auto_843566 ?auto_843567 ?auto_843568 ?auto_843569 ?auto_843570 ?auto_843571 ?auto_843572 ?auto_843573 ?auto_843574 ?auto_843575 ?auto_843576 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_843630 - BLOCK
      ?auto_843631 - BLOCK
      ?auto_843632 - BLOCK
      ?auto_843633 - BLOCK
      ?auto_843634 - BLOCK
      ?auto_843635 - BLOCK
      ?auto_843636 - BLOCK
      ?auto_843637 - BLOCK
      ?auto_843638 - BLOCK
      ?auto_843639 - BLOCK
      ?auto_843640 - BLOCK
      ?auto_843641 - BLOCK
      ?auto_843642 - BLOCK
      ?auto_843643 - BLOCK
      ?auto_843644 - BLOCK
      ?auto_843645 - BLOCK
      ?auto_843646 - BLOCK
    )
    :vars
    (
      ?auto_843647 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_843646 ?auto_843647 ) ( ON-TABLE ?auto_843630 ) ( ON ?auto_843631 ?auto_843630 ) ( ON ?auto_843632 ?auto_843631 ) ( not ( = ?auto_843630 ?auto_843631 ) ) ( not ( = ?auto_843630 ?auto_843632 ) ) ( not ( = ?auto_843630 ?auto_843633 ) ) ( not ( = ?auto_843630 ?auto_843634 ) ) ( not ( = ?auto_843630 ?auto_843635 ) ) ( not ( = ?auto_843630 ?auto_843636 ) ) ( not ( = ?auto_843630 ?auto_843637 ) ) ( not ( = ?auto_843630 ?auto_843638 ) ) ( not ( = ?auto_843630 ?auto_843639 ) ) ( not ( = ?auto_843630 ?auto_843640 ) ) ( not ( = ?auto_843630 ?auto_843641 ) ) ( not ( = ?auto_843630 ?auto_843642 ) ) ( not ( = ?auto_843630 ?auto_843643 ) ) ( not ( = ?auto_843630 ?auto_843644 ) ) ( not ( = ?auto_843630 ?auto_843645 ) ) ( not ( = ?auto_843630 ?auto_843646 ) ) ( not ( = ?auto_843630 ?auto_843647 ) ) ( not ( = ?auto_843631 ?auto_843632 ) ) ( not ( = ?auto_843631 ?auto_843633 ) ) ( not ( = ?auto_843631 ?auto_843634 ) ) ( not ( = ?auto_843631 ?auto_843635 ) ) ( not ( = ?auto_843631 ?auto_843636 ) ) ( not ( = ?auto_843631 ?auto_843637 ) ) ( not ( = ?auto_843631 ?auto_843638 ) ) ( not ( = ?auto_843631 ?auto_843639 ) ) ( not ( = ?auto_843631 ?auto_843640 ) ) ( not ( = ?auto_843631 ?auto_843641 ) ) ( not ( = ?auto_843631 ?auto_843642 ) ) ( not ( = ?auto_843631 ?auto_843643 ) ) ( not ( = ?auto_843631 ?auto_843644 ) ) ( not ( = ?auto_843631 ?auto_843645 ) ) ( not ( = ?auto_843631 ?auto_843646 ) ) ( not ( = ?auto_843631 ?auto_843647 ) ) ( not ( = ?auto_843632 ?auto_843633 ) ) ( not ( = ?auto_843632 ?auto_843634 ) ) ( not ( = ?auto_843632 ?auto_843635 ) ) ( not ( = ?auto_843632 ?auto_843636 ) ) ( not ( = ?auto_843632 ?auto_843637 ) ) ( not ( = ?auto_843632 ?auto_843638 ) ) ( not ( = ?auto_843632 ?auto_843639 ) ) ( not ( = ?auto_843632 ?auto_843640 ) ) ( not ( = ?auto_843632 ?auto_843641 ) ) ( not ( = ?auto_843632 ?auto_843642 ) ) ( not ( = ?auto_843632 ?auto_843643 ) ) ( not ( = ?auto_843632 ?auto_843644 ) ) ( not ( = ?auto_843632 ?auto_843645 ) ) ( not ( = ?auto_843632 ?auto_843646 ) ) ( not ( = ?auto_843632 ?auto_843647 ) ) ( not ( = ?auto_843633 ?auto_843634 ) ) ( not ( = ?auto_843633 ?auto_843635 ) ) ( not ( = ?auto_843633 ?auto_843636 ) ) ( not ( = ?auto_843633 ?auto_843637 ) ) ( not ( = ?auto_843633 ?auto_843638 ) ) ( not ( = ?auto_843633 ?auto_843639 ) ) ( not ( = ?auto_843633 ?auto_843640 ) ) ( not ( = ?auto_843633 ?auto_843641 ) ) ( not ( = ?auto_843633 ?auto_843642 ) ) ( not ( = ?auto_843633 ?auto_843643 ) ) ( not ( = ?auto_843633 ?auto_843644 ) ) ( not ( = ?auto_843633 ?auto_843645 ) ) ( not ( = ?auto_843633 ?auto_843646 ) ) ( not ( = ?auto_843633 ?auto_843647 ) ) ( not ( = ?auto_843634 ?auto_843635 ) ) ( not ( = ?auto_843634 ?auto_843636 ) ) ( not ( = ?auto_843634 ?auto_843637 ) ) ( not ( = ?auto_843634 ?auto_843638 ) ) ( not ( = ?auto_843634 ?auto_843639 ) ) ( not ( = ?auto_843634 ?auto_843640 ) ) ( not ( = ?auto_843634 ?auto_843641 ) ) ( not ( = ?auto_843634 ?auto_843642 ) ) ( not ( = ?auto_843634 ?auto_843643 ) ) ( not ( = ?auto_843634 ?auto_843644 ) ) ( not ( = ?auto_843634 ?auto_843645 ) ) ( not ( = ?auto_843634 ?auto_843646 ) ) ( not ( = ?auto_843634 ?auto_843647 ) ) ( not ( = ?auto_843635 ?auto_843636 ) ) ( not ( = ?auto_843635 ?auto_843637 ) ) ( not ( = ?auto_843635 ?auto_843638 ) ) ( not ( = ?auto_843635 ?auto_843639 ) ) ( not ( = ?auto_843635 ?auto_843640 ) ) ( not ( = ?auto_843635 ?auto_843641 ) ) ( not ( = ?auto_843635 ?auto_843642 ) ) ( not ( = ?auto_843635 ?auto_843643 ) ) ( not ( = ?auto_843635 ?auto_843644 ) ) ( not ( = ?auto_843635 ?auto_843645 ) ) ( not ( = ?auto_843635 ?auto_843646 ) ) ( not ( = ?auto_843635 ?auto_843647 ) ) ( not ( = ?auto_843636 ?auto_843637 ) ) ( not ( = ?auto_843636 ?auto_843638 ) ) ( not ( = ?auto_843636 ?auto_843639 ) ) ( not ( = ?auto_843636 ?auto_843640 ) ) ( not ( = ?auto_843636 ?auto_843641 ) ) ( not ( = ?auto_843636 ?auto_843642 ) ) ( not ( = ?auto_843636 ?auto_843643 ) ) ( not ( = ?auto_843636 ?auto_843644 ) ) ( not ( = ?auto_843636 ?auto_843645 ) ) ( not ( = ?auto_843636 ?auto_843646 ) ) ( not ( = ?auto_843636 ?auto_843647 ) ) ( not ( = ?auto_843637 ?auto_843638 ) ) ( not ( = ?auto_843637 ?auto_843639 ) ) ( not ( = ?auto_843637 ?auto_843640 ) ) ( not ( = ?auto_843637 ?auto_843641 ) ) ( not ( = ?auto_843637 ?auto_843642 ) ) ( not ( = ?auto_843637 ?auto_843643 ) ) ( not ( = ?auto_843637 ?auto_843644 ) ) ( not ( = ?auto_843637 ?auto_843645 ) ) ( not ( = ?auto_843637 ?auto_843646 ) ) ( not ( = ?auto_843637 ?auto_843647 ) ) ( not ( = ?auto_843638 ?auto_843639 ) ) ( not ( = ?auto_843638 ?auto_843640 ) ) ( not ( = ?auto_843638 ?auto_843641 ) ) ( not ( = ?auto_843638 ?auto_843642 ) ) ( not ( = ?auto_843638 ?auto_843643 ) ) ( not ( = ?auto_843638 ?auto_843644 ) ) ( not ( = ?auto_843638 ?auto_843645 ) ) ( not ( = ?auto_843638 ?auto_843646 ) ) ( not ( = ?auto_843638 ?auto_843647 ) ) ( not ( = ?auto_843639 ?auto_843640 ) ) ( not ( = ?auto_843639 ?auto_843641 ) ) ( not ( = ?auto_843639 ?auto_843642 ) ) ( not ( = ?auto_843639 ?auto_843643 ) ) ( not ( = ?auto_843639 ?auto_843644 ) ) ( not ( = ?auto_843639 ?auto_843645 ) ) ( not ( = ?auto_843639 ?auto_843646 ) ) ( not ( = ?auto_843639 ?auto_843647 ) ) ( not ( = ?auto_843640 ?auto_843641 ) ) ( not ( = ?auto_843640 ?auto_843642 ) ) ( not ( = ?auto_843640 ?auto_843643 ) ) ( not ( = ?auto_843640 ?auto_843644 ) ) ( not ( = ?auto_843640 ?auto_843645 ) ) ( not ( = ?auto_843640 ?auto_843646 ) ) ( not ( = ?auto_843640 ?auto_843647 ) ) ( not ( = ?auto_843641 ?auto_843642 ) ) ( not ( = ?auto_843641 ?auto_843643 ) ) ( not ( = ?auto_843641 ?auto_843644 ) ) ( not ( = ?auto_843641 ?auto_843645 ) ) ( not ( = ?auto_843641 ?auto_843646 ) ) ( not ( = ?auto_843641 ?auto_843647 ) ) ( not ( = ?auto_843642 ?auto_843643 ) ) ( not ( = ?auto_843642 ?auto_843644 ) ) ( not ( = ?auto_843642 ?auto_843645 ) ) ( not ( = ?auto_843642 ?auto_843646 ) ) ( not ( = ?auto_843642 ?auto_843647 ) ) ( not ( = ?auto_843643 ?auto_843644 ) ) ( not ( = ?auto_843643 ?auto_843645 ) ) ( not ( = ?auto_843643 ?auto_843646 ) ) ( not ( = ?auto_843643 ?auto_843647 ) ) ( not ( = ?auto_843644 ?auto_843645 ) ) ( not ( = ?auto_843644 ?auto_843646 ) ) ( not ( = ?auto_843644 ?auto_843647 ) ) ( not ( = ?auto_843645 ?auto_843646 ) ) ( not ( = ?auto_843645 ?auto_843647 ) ) ( not ( = ?auto_843646 ?auto_843647 ) ) ( ON ?auto_843645 ?auto_843646 ) ( ON ?auto_843644 ?auto_843645 ) ( ON ?auto_843643 ?auto_843644 ) ( ON ?auto_843642 ?auto_843643 ) ( ON ?auto_843641 ?auto_843642 ) ( ON ?auto_843640 ?auto_843641 ) ( ON ?auto_843639 ?auto_843640 ) ( ON ?auto_843638 ?auto_843639 ) ( ON ?auto_843637 ?auto_843638 ) ( ON ?auto_843636 ?auto_843637 ) ( ON ?auto_843635 ?auto_843636 ) ( ON ?auto_843634 ?auto_843635 ) ( CLEAR ?auto_843632 ) ( ON ?auto_843633 ?auto_843634 ) ( CLEAR ?auto_843633 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_843630 ?auto_843631 ?auto_843632 ?auto_843633 )
      ( MAKE-17PILE ?auto_843630 ?auto_843631 ?auto_843632 ?auto_843633 ?auto_843634 ?auto_843635 ?auto_843636 ?auto_843637 ?auto_843638 ?auto_843639 ?auto_843640 ?auto_843641 ?auto_843642 ?auto_843643 ?auto_843644 ?auto_843645 ?auto_843646 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_843700 - BLOCK
      ?auto_843701 - BLOCK
      ?auto_843702 - BLOCK
      ?auto_843703 - BLOCK
      ?auto_843704 - BLOCK
      ?auto_843705 - BLOCK
      ?auto_843706 - BLOCK
      ?auto_843707 - BLOCK
      ?auto_843708 - BLOCK
      ?auto_843709 - BLOCK
      ?auto_843710 - BLOCK
      ?auto_843711 - BLOCK
      ?auto_843712 - BLOCK
      ?auto_843713 - BLOCK
      ?auto_843714 - BLOCK
      ?auto_843715 - BLOCK
      ?auto_843716 - BLOCK
    )
    :vars
    (
      ?auto_843717 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_843716 ?auto_843717 ) ( ON-TABLE ?auto_843700 ) ( ON ?auto_843701 ?auto_843700 ) ( not ( = ?auto_843700 ?auto_843701 ) ) ( not ( = ?auto_843700 ?auto_843702 ) ) ( not ( = ?auto_843700 ?auto_843703 ) ) ( not ( = ?auto_843700 ?auto_843704 ) ) ( not ( = ?auto_843700 ?auto_843705 ) ) ( not ( = ?auto_843700 ?auto_843706 ) ) ( not ( = ?auto_843700 ?auto_843707 ) ) ( not ( = ?auto_843700 ?auto_843708 ) ) ( not ( = ?auto_843700 ?auto_843709 ) ) ( not ( = ?auto_843700 ?auto_843710 ) ) ( not ( = ?auto_843700 ?auto_843711 ) ) ( not ( = ?auto_843700 ?auto_843712 ) ) ( not ( = ?auto_843700 ?auto_843713 ) ) ( not ( = ?auto_843700 ?auto_843714 ) ) ( not ( = ?auto_843700 ?auto_843715 ) ) ( not ( = ?auto_843700 ?auto_843716 ) ) ( not ( = ?auto_843700 ?auto_843717 ) ) ( not ( = ?auto_843701 ?auto_843702 ) ) ( not ( = ?auto_843701 ?auto_843703 ) ) ( not ( = ?auto_843701 ?auto_843704 ) ) ( not ( = ?auto_843701 ?auto_843705 ) ) ( not ( = ?auto_843701 ?auto_843706 ) ) ( not ( = ?auto_843701 ?auto_843707 ) ) ( not ( = ?auto_843701 ?auto_843708 ) ) ( not ( = ?auto_843701 ?auto_843709 ) ) ( not ( = ?auto_843701 ?auto_843710 ) ) ( not ( = ?auto_843701 ?auto_843711 ) ) ( not ( = ?auto_843701 ?auto_843712 ) ) ( not ( = ?auto_843701 ?auto_843713 ) ) ( not ( = ?auto_843701 ?auto_843714 ) ) ( not ( = ?auto_843701 ?auto_843715 ) ) ( not ( = ?auto_843701 ?auto_843716 ) ) ( not ( = ?auto_843701 ?auto_843717 ) ) ( not ( = ?auto_843702 ?auto_843703 ) ) ( not ( = ?auto_843702 ?auto_843704 ) ) ( not ( = ?auto_843702 ?auto_843705 ) ) ( not ( = ?auto_843702 ?auto_843706 ) ) ( not ( = ?auto_843702 ?auto_843707 ) ) ( not ( = ?auto_843702 ?auto_843708 ) ) ( not ( = ?auto_843702 ?auto_843709 ) ) ( not ( = ?auto_843702 ?auto_843710 ) ) ( not ( = ?auto_843702 ?auto_843711 ) ) ( not ( = ?auto_843702 ?auto_843712 ) ) ( not ( = ?auto_843702 ?auto_843713 ) ) ( not ( = ?auto_843702 ?auto_843714 ) ) ( not ( = ?auto_843702 ?auto_843715 ) ) ( not ( = ?auto_843702 ?auto_843716 ) ) ( not ( = ?auto_843702 ?auto_843717 ) ) ( not ( = ?auto_843703 ?auto_843704 ) ) ( not ( = ?auto_843703 ?auto_843705 ) ) ( not ( = ?auto_843703 ?auto_843706 ) ) ( not ( = ?auto_843703 ?auto_843707 ) ) ( not ( = ?auto_843703 ?auto_843708 ) ) ( not ( = ?auto_843703 ?auto_843709 ) ) ( not ( = ?auto_843703 ?auto_843710 ) ) ( not ( = ?auto_843703 ?auto_843711 ) ) ( not ( = ?auto_843703 ?auto_843712 ) ) ( not ( = ?auto_843703 ?auto_843713 ) ) ( not ( = ?auto_843703 ?auto_843714 ) ) ( not ( = ?auto_843703 ?auto_843715 ) ) ( not ( = ?auto_843703 ?auto_843716 ) ) ( not ( = ?auto_843703 ?auto_843717 ) ) ( not ( = ?auto_843704 ?auto_843705 ) ) ( not ( = ?auto_843704 ?auto_843706 ) ) ( not ( = ?auto_843704 ?auto_843707 ) ) ( not ( = ?auto_843704 ?auto_843708 ) ) ( not ( = ?auto_843704 ?auto_843709 ) ) ( not ( = ?auto_843704 ?auto_843710 ) ) ( not ( = ?auto_843704 ?auto_843711 ) ) ( not ( = ?auto_843704 ?auto_843712 ) ) ( not ( = ?auto_843704 ?auto_843713 ) ) ( not ( = ?auto_843704 ?auto_843714 ) ) ( not ( = ?auto_843704 ?auto_843715 ) ) ( not ( = ?auto_843704 ?auto_843716 ) ) ( not ( = ?auto_843704 ?auto_843717 ) ) ( not ( = ?auto_843705 ?auto_843706 ) ) ( not ( = ?auto_843705 ?auto_843707 ) ) ( not ( = ?auto_843705 ?auto_843708 ) ) ( not ( = ?auto_843705 ?auto_843709 ) ) ( not ( = ?auto_843705 ?auto_843710 ) ) ( not ( = ?auto_843705 ?auto_843711 ) ) ( not ( = ?auto_843705 ?auto_843712 ) ) ( not ( = ?auto_843705 ?auto_843713 ) ) ( not ( = ?auto_843705 ?auto_843714 ) ) ( not ( = ?auto_843705 ?auto_843715 ) ) ( not ( = ?auto_843705 ?auto_843716 ) ) ( not ( = ?auto_843705 ?auto_843717 ) ) ( not ( = ?auto_843706 ?auto_843707 ) ) ( not ( = ?auto_843706 ?auto_843708 ) ) ( not ( = ?auto_843706 ?auto_843709 ) ) ( not ( = ?auto_843706 ?auto_843710 ) ) ( not ( = ?auto_843706 ?auto_843711 ) ) ( not ( = ?auto_843706 ?auto_843712 ) ) ( not ( = ?auto_843706 ?auto_843713 ) ) ( not ( = ?auto_843706 ?auto_843714 ) ) ( not ( = ?auto_843706 ?auto_843715 ) ) ( not ( = ?auto_843706 ?auto_843716 ) ) ( not ( = ?auto_843706 ?auto_843717 ) ) ( not ( = ?auto_843707 ?auto_843708 ) ) ( not ( = ?auto_843707 ?auto_843709 ) ) ( not ( = ?auto_843707 ?auto_843710 ) ) ( not ( = ?auto_843707 ?auto_843711 ) ) ( not ( = ?auto_843707 ?auto_843712 ) ) ( not ( = ?auto_843707 ?auto_843713 ) ) ( not ( = ?auto_843707 ?auto_843714 ) ) ( not ( = ?auto_843707 ?auto_843715 ) ) ( not ( = ?auto_843707 ?auto_843716 ) ) ( not ( = ?auto_843707 ?auto_843717 ) ) ( not ( = ?auto_843708 ?auto_843709 ) ) ( not ( = ?auto_843708 ?auto_843710 ) ) ( not ( = ?auto_843708 ?auto_843711 ) ) ( not ( = ?auto_843708 ?auto_843712 ) ) ( not ( = ?auto_843708 ?auto_843713 ) ) ( not ( = ?auto_843708 ?auto_843714 ) ) ( not ( = ?auto_843708 ?auto_843715 ) ) ( not ( = ?auto_843708 ?auto_843716 ) ) ( not ( = ?auto_843708 ?auto_843717 ) ) ( not ( = ?auto_843709 ?auto_843710 ) ) ( not ( = ?auto_843709 ?auto_843711 ) ) ( not ( = ?auto_843709 ?auto_843712 ) ) ( not ( = ?auto_843709 ?auto_843713 ) ) ( not ( = ?auto_843709 ?auto_843714 ) ) ( not ( = ?auto_843709 ?auto_843715 ) ) ( not ( = ?auto_843709 ?auto_843716 ) ) ( not ( = ?auto_843709 ?auto_843717 ) ) ( not ( = ?auto_843710 ?auto_843711 ) ) ( not ( = ?auto_843710 ?auto_843712 ) ) ( not ( = ?auto_843710 ?auto_843713 ) ) ( not ( = ?auto_843710 ?auto_843714 ) ) ( not ( = ?auto_843710 ?auto_843715 ) ) ( not ( = ?auto_843710 ?auto_843716 ) ) ( not ( = ?auto_843710 ?auto_843717 ) ) ( not ( = ?auto_843711 ?auto_843712 ) ) ( not ( = ?auto_843711 ?auto_843713 ) ) ( not ( = ?auto_843711 ?auto_843714 ) ) ( not ( = ?auto_843711 ?auto_843715 ) ) ( not ( = ?auto_843711 ?auto_843716 ) ) ( not ( = ?auto_843711 ?auto_843717 ) ) ( not ( = ?auto_843712 ?auto_843713 ) ) ( not ( = ?auto_843712 ?auto_843714 ) ) ( not ( = ?auto_843712 ?auto_843715 ) ) ( not ( = ?auto_843712 ?auto_843716 ) ) ( not ( = ?auto_843712 ?auto_843717 ) ) ( not ( = ?auto_843713 ?auto_843714 ) ) ( not ( = ?auto_843713 ?auto_843715 ) ) ( not ( = ?auto_843713 ?auto_843716 ) ) ( not ( = ?auto_843713 ?auto_843717 ) ) ( not ( = ?auto_843714 ?auto_843715 ) ) ( not ( = ?auto_843714 ?auto_843716 ) ) ( not ( = ?auto_843714 ?auto_843717 ) ) ( not ( = ?auto_843715 ?auto_843716 ) ) ( not ( = ?auto_843715 ?auto_843717 ) ) ( not ( = ?auto_843716 ?auto_843717 ) ) ( ON ?auto_843715 ?auto_843716 ) ( ON ?auto_843714 ?auto_843715 ) ( ON ?auto_843713 ?auto_843714 ) ( ON ?auto_843712 ?auto_843713 ) ( ON ?auto_843711 ?auto_843712 ) ( ON ?auto_843710 ?auto_843711 ) ( ON ?auto_843709 ?auto_843710 ) ( ON ?auto_843708 ?auto_843709 ) ( ON ?auto_843707 ?auto_843708 ) ( ON ?auto_843706 ?auto_843707 ) ( ON ?auto_843705 ?auto_843706 ) ( ON ?auto_843704 ?auto_843705 ) ( ON ?auto_843703 ?auto_843704 ) ( CLEAR ?auto_843701 ) ( ON ?auto_843702 ?auto_843703 ) ( CLEAR ?auto_843702 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_843700 ?auto_843701 ?auto_843702 )
      ( MAKE-17PILE ?auto_843700 ?auto_843701 ?auto_843702 ?auto_843703 ?auto_843704 ?auto_843705 ?auto_843706 ?auto_843707 ?auto_843708 ?auto_843709 ?auto_843710 ?auto_843711 ?auto_843712 ?auto_843713 ?auto_843714 ?auto_843715 ?auto_843716 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_843770 - BLOCK
      ?auto_843771 - BLOCK
      ?auto_843772 - BLOCK
      ?auto_843773 - BLOCK
      ?auto_843774 - BLOCK
      ?auto_843775 - BLOCK
      ?auto_843776 - BLOCK
      ?auto_843777 - BLOCK
      ?auto_843778 - BLOCK
      ?auto_843779 - BLOCK
      ?auto_843780 - BLOCK
      ?auto_843781 - BLOCK
      ?auto_843782 - BLOCK
      ?auto_843783 - BLOCK
      ?auto_843784 - BLOCK
      ?auto_843785 - BLOCK
      ?auto_843786 - BLOCK
    )
    :vars
    (
      ?auto_843787 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_843786 ?auto_843787 ) ( ON-TABLE ?auto_843770 ) ( not ( = ?auto_843770 ?auto_843771 ) ) ( not ( = ?auto_843770 ?auto_843772 ) ) ( not ( = ?auto_843770 ?auto_843773 ) ) ( not ( = ?auto_843770 ?auto_843774 ) ) ( not ( = ?auto_843770 ?auto_843775 ) ) ( not ( = ?auto_843770 ?auto_843776 ) ) ( not ( = ?auto_843770 ?auto_843777 ) ) ( not ( = ?auto_843770 ?auto_843778 ) ) ( not ( = ?auto_843770 ?auto_843779 ) ) ( not ( = ?auto_843770 ?auto_843780 ) ) ( not ( = ?auto_843770 ?auto_843781 ) ) ( not ( = ?auto_843770 ?auto_843782 ) ) ( not ( = ?auto_843770 ?auto_843783 ) ) ( not ( = ?auto_843770 ?auto_843784 ) ) ( not ( = ?auto_843770 ?auto_843785 ) ) ( not ( = ?auto_843770 ?auto_843786 ) ) ( not ( = ?auto_843770 ?auto_843787 ) ) ( not ( = ?auto_843771 ?auto_843772 ) ) ( not ( = ?auto_843771 ?auto_843773 ) ) ( not ( = ?auto_843771 ?auto_843774 ) ) ( not ( = ?auto_843771 ?auto_843775 ) ) ( not ( = ?auto_843771 ?auto_843776 ) ) ( not ( = ?auto_843771 ?auto_843777 ) ) ( not ( = ?auto_843771 ?auto_843778 ) ) ( not ( = ?auto_843771 ?auto_843779 ) ) ( not ( = ?auto_843771 ?auto_843780 ) ) ( not ( = ?auto_843771 ?auto_843781 ) ) ( not ( = ?auto_843771 ?auto_843782 ) ) ( not ( = ?auto_843771 ?auto_843783 ) ) ( not ( = ?auto_843771 ?auto_843784 ) ) ( not ( = ?auto_843771 ?auto_843785 ) ) ( not ( = ?auto_843771 ?auto_843786 ) ) ( not ( = ?auto_843771 ?auto_843787 ) ) ( not ( = ?auto_843772 ?auto_843773 ) ) ( not ( = ?auto_843772 ?auto_843774 ) ) ( not ( = ?auto_843772 ?auto_843775 ) ) ( not ( = ?auto_843772 ?auto_843776 ) ) ( not ( = ?auto_843772 ?auto_843777 ) ) ( not ( = ?auto_843772 ?auto_843778 ) ) ( not ( = ?auto_843772 ?auto_843779 ) ) ( not ( = ?auto_843772 ?auto_843780 ) ) ( not ( = ?auto_843772 ?auto_843781 ) ) ( not ( = ?auto_843772 ?auto_843782 ) ) ( not ( = ?auto_843772 ?auto_843783 ) ) ( not ( = ?auto_843772 ?auto_843784 ) ) ( not ( = ?auto_843772 ?auto_843785 ) ) ( not ( = ?auto_843772 ?auto_843786 ) ) ( not ( = ?auto_843772 ?auto_843787 ) ) ( not ( = ?auto_843773 ?auto_843774 ) ) ( not ( = ?auto_843773 ?auto_843775 ) ) ( not ( = ?auto_843773 ?auto_843776 ) ) ( not ( = ?auto_843773 ?auto_843777 ) ) ( not ( = ?auto_843773 ?auto_843778 ) ) ( not ( = ?auto_843773 ?auto_843779 ) ) ( not ( = ?auto_843773 ?auto_843780 ) ) ( not ( = ?auto_843773 ?auto_843781 ) ) ( not ( = ?auto_843773 ?auto_843782 ) ) ( not ( = ?auto_843773 ?auto_843783 ) ) ( not ( = ?auto_843773 ?auto_843784 ) ) ( not ( = ?auto_843773 ?auto_843785 ) ) ( not ( = ?auto_843773 ?auto_843786 ) ) ( not ( = ?auto_843773 ?auto_843787 ) ) ( not ( = ?auto_843774 ?auto_843775 ) ) ( not ( = ?auto_843774 ?auto_843776 ) ) ( not ( = ?auto_843774 ?auto_843777 ) ) ( not ( = ?auto_843774 ?auto_843778 ) ) ( not ( = ?auto_843774 ?auto_843779 ) ) ( not ( = ?auto_843774 ?auto_843780 ) ) ( not ( = ?auto_843774 ?auto_843781 ) ) ( not ( = ?auto_843774 ?auto_843782 ) ) ( not ( = ?auto_843774 ?auto_843783 ) ) ( not ( = ?auto_843774 ?auto_843784 ) ) ( not ( = ?auto_843774 ?auto_843785 ) ) ( not ( = ?auto_843774 ?auto_843786 ) ) ( not ( = ?auto_843774 ?auto_843787 ) ) ( not ( = ?auto_843775 ?auto_843776 ) ) ( not ( = ?auto_843775 ?auto_843777 ) ) ( not ( = ?auto_843775 ?auto_843778 ) ) ( not ( = ?auto_843775 ?auto_843779 ) ) ( not ( = ?auto_843775 ?auto_843780 ) ) ( not ( = ?auto_843775 ?auto_843781 ) ) ( not ( = ?auto_843775 ?auto_843782 ) ) ( not ( = ?auto_843775 ?auto_843783 ) ) ( not ( = ?auto_843775 ?auto_843784 ) ) ( not ( = ?auto_843775 ?auto_843785 ) ) ( not ( = ?auto_843775 ?auto_843786 ) ) ( not ( = ?auto_843775 ?auto_843787 ) ) ( not ( = ?auto_843776 ?auto_843777 ) ) ( not ( = ?auto_843776 ?auto_843778 ) ) ( not ( = ?auto_843776 ?auto_843779 ) ) ( not ( = ?auto_843776 ?auto_843780 ) ) ( not ( = ?auto_843776 ?auto_843781 ) ) ( not ( = ?auto_843776 ?auto_843782 ) ) ( not ( = ?auto_843776 ?auto_843783 ) ) ( not ( = ?auto_843776 ?auto_843784 ) ) ( not ( = ?auto_843776 ?auto_843785 ) ) ( not ( = ?auto_843776 ?auto_843786 ) ) ( not ( = ?auto_843776 ?auto_843787 ) ) ( not ( = ?auto_843777 ?auto_843778 ) ) ( not ( = ?auto_843777 ?auto_843779 ) ) ( not ( = ?auto_843777 ?auto_843780 ) ) ( not ( = ?auto_843777 ?auto_843781 ) ) ( not ( = ?auto_843777 ?auto_843782 ) ) ( not ( = ?auto_843777 ?auto_843783 ) ) ( not ( = ?auto_843777 ?auto_843784 ) ) ( not ( = ?auto_843777 ?auto_843785 ) ) ( not ( = ?auto_843777 ?auto_843786 ) ) ( not ( = ?auto_843777 ?auto_843787 ) ) ( not ( = ?auto_843778 ?auto_843779 ) ) ( not ( = ?auto_843778 ?auto_843780 ) ) ( not ( = ?auto_843778 ?auto_843781 ) ) ( not ( = ?auto_843778 ?auto_843782 ) ) ( not ( = ?auto_843778 ?auto_843783 ) ) ( not ( = ?auto_843778 ?auto_843784 ) ) ( not ( = ?auto_843778 ?auto_843785 ) ) ( not ( = ?auto_843778 ?auto_843786 ) ) ( not ( = ?auto_843778 ?auto_843787 ) ) ( not ( = ?auto_843779 ?auto_843780 ) ) ( not ( = ?auto_843779 ?auto_843781 ) ) ( not ( = ?auto_843779 ?auto_843782 ) ) ( not ( = ?auto_843779 ?auto_843783 ) ) ( not ( = ?auto_843779 ?auto_843784 ) ) ( not ( = ?auto_843779 ?auto_843785 ) ) ( not ( = ?auto_843779 ?auto_843786 ) ) ( not ( = ?auto_843779 ?auto_843787 ) ) ( not ( = ?auto_843780 ?auto_843781 ) ) ( not ( = ?auto_843780 ?auto_843782 ) ) ( not ( = ?auto_843780 ?auto_843783 ) ) ( not ( = ?auto_843780 ?auto_843784 ) ) ( not ( = ?auto_843780 ?auto_843785 ) ) ( not ( = ?auto_843780 ?auto_843786 ) ) ( not ( = ?auto_843780 ?auto_843787 ) ) ( not ( = ?auto_843781 ?auto_843782 ) ) ( not ( = ?auto_843781 ?auto_843783 ) ) ( not ( = ?auto_843781 ?auto_843784 ) ) ( not ( = ?auto_843781 ?auto_843785 ) ) ( not ( = ?auto_843781 ?auto_843786 ) ) ( not ( = ?auto_843781 ?auto_843787 ) ) ( not ( = ?auto_843782 ?auto_843783 ) ) ( not ( = ?auto_843782 ?auto_843784 ) ) ( not ( = ?auto_843782 ?auto_843785 ) ) ( not ( = ?auto_843782 ?auto_843786 ) ) ( not ( = ?auto_843782 ?auto_843787 ) ) ( not ( = ?auto_843783 ?auto_843784 ) ) ( not ( = ?auto_843783 ?auto_843785 ) ) ( not ( = ?auto_843783 ?auto_843786 ) ) ( not ( = ?auto_843783 ?auto_843787 ) ) ( not ( = ?auto_843784 ?auto_843785 ) ) ( not ( = ?auto_843784 ?auto_843786 ) ) ( not ( = ?auto_843784 ?auto_843787 ) ) ( not ( = ?auto_843785 ?auto_843786 ) ) ( not ( = ?auto_843785 ?auto_843787 ) ) ( not ( = ?auto_843786 ?auto_843787 ) ) ( ON ?auto_843785 ?auto_843786 ) ( ON ?auto_843784 ?auto_843785 ) ( ON ?auto_843783 ?auto_843784 ) ( ON ?auto_843782 ?auto_843783 ) ( ON ?auto_843781 ?auto_843782 ) ( ON ?auto_843780 ?auto_843781 ) ( ON ?auto_843779 ?auto_843780 ) ( ON ?auto_843778 ?auto_843779 ) ( ON ?auto_843777 ?auto_843778 ) ( ON ?auto_843776 ?auto_843777 ) ( ON ?auto_843775 ?auto_843776 ) ( ON ?auto_843774 ?auto_843775 ) ( ON ?auto_843773 ?auto_843774 ) ( ON ?auto_843772 ?auto_843773 ) ( CLEAR ?auto_843770 ) ( ON ?auto_843771 ?auto_843772 ) ( CLEAR ?auto_843771 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_843770 ?auto_843771 )
      ( MAKE-17PILE ?auto_843770 ?auto_843771 ?auto_843772 ?auto_843773 ?auto_843774 ?auto_843775 ?auto_843776 ?auto_843777 ?auto_843778 ?auto_843779 ?auto_843780 ?auto_843781 ?auto_843782 ?auto_843783 ?auto_843784 ?auto_843785 ?auto_843786 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_843840 - BLOCK
      ?auto_843841 - BLOCK
      ?auto_843842 - BLOCK
      ?auto_843843 - BLOCK
      ?auto_843844 - BLOCK
      ?auto_843845 - BLOCK
      ?auto_843846 - BLOCK
      ?auto_843847 - BLOCK
      ?auto_843848 - BLOCK
      ?auto_843849 - BLOCK
      ?auto_843850 - BLOCK
      ?auto_843851 - BLOCK
      ?auto_843852 - BLOCK
      ?auto_843853 - BLOCK
      ?auto_843854 - BLOCK
      ?auto_843855 - BLOCK
      ?auto_843856 - BLOCK
    )
    :vars
    (
      ?auto_843857 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_843856 ?auto_843857 ) ( not ( = ?auto_843840 ?auto_843841 ) ) ( not ( = ?auto_843840 ?auto_843842 ) ) ( not ( = ?auto_843840 ?auto_843843 ) ) ( not ( = ?auto_843840 ?auto_843844 ) ) ( not ( = ?auto_843840 ?auto_843845 ) ) ( not ( = ?auto_843840 ?auto_843846 ) ) ( not ( = ?auto_843840 ?auto_843847 ) ) ( not ( = ?auto_843840 ?auto_843848 ) ) ( not ( = ?auto_843840 ?auto_843849 ) ) ( not ( = ?auto_843840 ?auto_843850 ) ) ( not ( = ?auto_843840 ?auto_843851 ) ) ( not ( = ?auto_843840 ?auto_843852 ) ) ( not ( = ?auto_843840 ?auto_843853 ) ) ( not ( = ?auto_843840 ?auto_843854 ) ) ( not ( = ?auto_843840 ?auto_843855 ) ) ( not ( = ?auto_843840 ?auto_843856 ) ) ( not ( = ?auto_843840 ?auto_843857 ) ) ( not ( = ?auto_843841 ?auto_843842 ) ) ( not ( = ?auto_843841 ?auto_843843 ) ) ( not ( = ?auto_843841 ?auto_843844 ) ) ( not ( = ?auto_843841 ?auto_843845 ) ) ( not ( = ?auto_843841 ?auto_843846 ) ) ( not ( = ?auto_843841 ?auto_843847 ) ) ( not ( = ?auto_843841 ?auto_843848 ) ) ( not ( = ?auto_843841 ?auto_843849 ) ) ( not ( = ?auto_843841 ?auto_843850 ) ) ( not ( = ?auto_843841 ?auto_843851 ) ) ( not ( = ?auto_843841 ?auto_843852 ) ) ( not ( = ?auto_843841 ?auto_843853 ) ) ( not ( = ?auto_843841 ?auto_843854 ) ) ( not ( = ?auto_843841 ?auto_843855 ) ) ( not ( = ?auto_843841 ?auto_843856 ) ) ( not ( = ?auto_843841 ?auto_843857 ) ) ( not ( = ?auto_843842 ?auto_843843 ) ) ( not ( = ?auto_843842 ?auto_843844 ) ) ( not ( = ?auto_843842 ?auto_843845 ) ) ( not ( = ?auto_843842 ?auto_843846 ) ) ( not ( = ?auto_843842 ?auto_843847 ) ) ( not ( = ?auto_843842 ?auto_843848 ) ) ( not ( = ?auto_843842 ?auto_843849 ) ) ( not ( = ?auto_843842 ?auto_843850 ) ) ( not ( = ?auto_843842 ?auto_843851 ) ) ( not ( = ?auto_843842 ?auto_843852 ) ) ( not ( = ?auto_843842 ?auto_843853 ) ) ( not ( = ?auto_843842 ?auto_843854 ) ) ( not ( = ?auto_843842 ?auto_843855 ) ) ( not ( = ?auto_843842 ?auto_843856 ) ) ( not ( = ?auto_843842 ?auto_843857 ) ) ( not ( = ?auto_843843 ?auto_843844 ) ) ( not ( = ?auto_843843 ?auto_843845 ) ) ( not ( = ?auto_843843 ?auto_843846 ) ) ( not ( = ?auto_843843 ?auto_843847 ) ) ( not ( = ?auto_843843 ?auto_843848 ) ) ( not ( = ?auto_843843 ?auto_843849 ) ) ( not ( = ?auto_843843 ?auto_843850 ) ) ( not ( = ?auto_843843 ?auto_843851 ) ) ( not ( = ?auto_843843 ?auto_843852 ) ) ( not ( = ?auto_843843 ?auto_843853 ) ) ( not ( = ?auto_843843 ?auto_843854 ) ) ( not ( = ?auto_843843 ?auto_843855 ) ) ( not ( = ?auto_843843 ?auto_843856 ) ) ( not ( = ?auto_843843 ?auto_843857 ) ) ( not ( = ?auto_843844 ?auto_843845 ) ) ( not ( = ?auto_843844 ?auto_843846 ) ) ( not ( = ?auto_843844 ?auto_843847 ) ) ( not ( = ?auto_843844 ?auto_843848 ) ) ( not ( = ?auto_843844 ?auto_843849 ) ) ( not ( = ?auto_843844 ?auto_843850 ) ) ( not ( = ?auto_843844 ?auto_843851 ) ) ( not ( = ?auto_843844 ?auto_843852 ) ) ( not ( = ?auto_843844 ?auto_843853 ) ) ( not ( = ?auto_843844 ?auto_843854 ) ) ( not ( = ?auto_843844 ?auto_843855 ) ) ( not ( = ?auto_843844 ?auto_843856 ) ) ( not ( = ?auto_843844 ?auto_843857 ) ) ( not ( = ?auto_843845 ?auto_843846 ) ) ( not ( = ?auto_843845 ?auto_843847 ) ) ( not ( = ?auto_843845 ?auto_843848 ) ) ( not ( = ?auto_843845 ?auto_843849 ) ) ( not ( = ?auto_843845 ?auto_843850 ) ) ( not ( = ?auto_843845 ?auto_843851 ) ) ( not ( = ?auto_843845 ?auto_843852 ) ) ( not ( = ?auto_843845 ?auto_843853 ) ) ( not ( = ?auto_843845 ?auto_843854 ) ) ( not ( = ?auto_843845 ?auto_843855 ) ) ( not ( = ?auto_843845 ?auto_843856 ) ) ( not ( = ?auto_843845 ?auto_843857 ) ) ( not ( = ?auto_843846 ?auto_843847 ) ) ( not ( = ?auto_843846 ?auto_843848 ) ) ( not ( = ?auto_843846 ?auto_843849 ) ) ( not ( = ?auto_843846 ?auto_843850 ) ) ( not ( = ?auto_843846 ?auto_843851 ) ) ( not ( = ?auto_843846 ?auto_843852 ) ) ( not ( = ?auto_843846 ?auto_843853 ) ) ( not ( = ?auto_843846 ?auto_843854 ) ) ( not ( = ?auto_843846 ?auto_843855 ) ) ( not ( = ?auto_843846 ?auto_843856 ) ) ( not ( = ?auto_843846 ?auto_843857 ) ) ( not ( = ?auto_843847 ?auto_843848 ) ) ( not ( = ?auto_843847 ?auto_843849 ) ) ( not ( = ?auto_843847 ?auto_843850 ) ) ( not ( = ?auto_843847 ?auto_843851 ) ) ( not ( = ?auto_843847 ?auto_843852 ) ) ( not ( = ?auto_843847 ?auto_843853 ) ) ( not ( = ?auto_843847 ?auto_843854 ) ) ( not ( = ?auto_843847 ?auto_843855 ) ) ( not ( = ?auto_843847 ?auto_843856 ) ) ( not ( = ?auto_843847 ?auto_843857 ) ) ( not ( = ?auto_843848 ?auto_843849 ) ) ( not ( = ?auto_843848 ?auto_843850 ) ) ( not ( = ?auto_843848 ?auto_843851 ) ) ( not ( = ?auto_843848 ?auto_843852 ) ) ( not ( = ?auto_843848 ?auto_843853 ) ) ( not ( = ?auto_843848 ?auto_843854 ) ) ( not ( = ?auto_843848 ?auto_843855 ) ) ( not ( = ?auto_843848 ?auto_843856 ) ) ( not ( = ?auto_843848 ?auto_843857 ) ) ( not ( = ?auto_843849 ?auto_843850 ) ) ( not ( = ?auto_843849 ?auto_843851 ) ) ( not ( = ?auto_843849 ?auto_843852 ) ) ( not ( = ?auto_843849 ?auto_843853 ) ) ( not ( = ?auto_843849 ?auto_843854 ) ) ( not ( = ?auto_843849 ?auto_843855 ) ) ( not ( = ?auto_843849 ?auto_843856 ) ) ( not ( = ?auto_843849 ?auto_843857 ) ) ( not ( = ?auto_843850 ?auto_843851 ) ) ( not ( = ?auto_843850 ?auto_843852 ) ) ( not ( = ?auto_843850 ?auto_843853 ) ) ( not ( = ?auto_843850 ?auto_843854 ) ) ( not ( = ?auto_843850 ?auto_843855 ) ) ( not ( = ?auto_843850 ?auto_843856 ) ) ( not ( = ?auto_843850 ?auto_843857 ) ) ( not ( = ?auto_843851 ?auto_843852 ) ) ( not ( = ?auto_843851 ?auto_843853 ) ) ( not ( = ?auto_843851 ?auto_843854 ) ) ( not ( = ?auto_843851 ?auto_843855 ) ) ( not ( = ?auto_843851 ?auto_843856 ) ) ( not ( = ?auto_843851 ?auto_843857 ) ) ( not ( = ?auto_843852 ?auto_843853 ) ) ( not ( = ?auto_843852 ?auto_843854 ) ) ( not ( = ?auto_843852 ?auto_843855 ) ) ( not ( = ?auto_843852 ?auto_843856 ) ) ( not ( = ?auto_843852 ?auto_843857 ) ) ( not ( = ?auto_843853 ?auto_843854 ) ) ( not ( = ?auto_843853 ?auto_843855 ) ) ( not ( = ?auto_843853 ?auto_843856 ) ) ( not ( = ?auto_843853 ?auto_843857 ) ) ( not ( = ?auto_843854 ?auto_843855 ) ) ( not ( = ?auto_843854 ?auto_843856 ) ) ( not ( = ?auto_843854 ?auto_843857 ) ) ( not ( = ?auto_843855 ?auto_843856 ) ) ( not ( = ?auto_843855 ?auto_843857 ) ) ( not ( = ?auto_843856 ?auto_843857 ) ) ( ON ?auto_843855 ?auto_843856 ) ( ON ?auto_843854 ?auto_843855 ) ( ON ?auto_843853 ?auto_843854 ) ( ON ?auto_843852 ?auto_843853 ) ( ON ?auto_843851 ?auto_843852 ) ( ON ?auto_843850 ?auto_843851 ) ( ON ?auto_843849 ?auto_843850 ) ( ON ?auto_843848 ?auto_843849 ) ( ON ?auto_843847 ?auto_843848 ) ( ON ?auto_843846 ?auto_843847 ) ( ON ?auto_843845 ?auto_843846 ) ( ON ?auto_843844 ?auto_843845 ) ( ON ?auto_843843 ?auto_843844 ) ( ON ?auto_843842 ?auto_843843 ) ( ON ?auto_843841 ?auto_843842 ) ( ON ?auto_843840 ?auto_843841 ) ( CLEAR ?auto_843840 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_843840 )
      ( MAKE-17PILE ?auto_843840 ?auto_843841 ?auto_843842 ?auto_843843 ?auto_843844 ?auto_843845 ?auto_843846 ?auto_843847 ?auto_843848 ?auto_843849 ?auto_843850 ?auto_843851 ?auto_843852 ?auto_843853 ?auto_843854 ?auto_843855 ?auto_843856 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_843911 - BLOCK
      ?auto_843912 - BLOCK
      ?auto_843913 - BLOCK
      ?auto_843914 - BLOCK
      ?auto_843915 - BLOCK
      ?auto_843916 - BLOCK
      ?auto_843917 - BLOCK
      ?auto_843918 - BLOCK
      ?auto_843919 - BLOCK
      ?auto_843920 - BLOCK
      ?auto_843921 - BLOCK
      ?auto_843922 - BLOCK
      ?auto_843923 - BLOCK
      ?auto_843924 - BLOCK
      ?auto_843925 - BLOCK
      ?auto_843926 - BLOCK
      ?auto_843927 - BLOCK
      ?auto_843928 - BLOCK
    )
    :vars
    (
      ?auto_843929 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_843927 ) ( ON ?auto_843928 ?auto_843929 ) ( CLEAR ?auto_843928 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_843911 ) ( ON ?auto_843912 ?auto_843911 ) ( ON ?auto_843913 ?auto_843912 ) ( ON ?auto_843914 ?auto_843913 ) ( ON ?auto_843915 ?auto_843914 ) ( ON ?auto_843916 ?auto_843915 ) ( ON ?auto_843917 ?auto_843916 ) ( ON ?auto_843918 ?auto_843917 ) ( ON ?auto_843919 ?auto_843918 ) ( ON ?auto_843920 ?auto_843919 ) ( ON ?auto_843921 ?auto_843920 ) ( ON ?auto_843922 ?auto_843921 ) ( ON ?auto_843923 ?auto_843922 ) ( ON ?auto_843924 ?auto_843923 ) ( ON ?auto_843925 ?auto_843924 ) ( ON ?auto_843926 ?auto_843925 ) ( ON ?auto_843927 ?auto_843926 ) ( not ( = ?auto_843911 ?auto_843912 ) ) ( not ( = ?auto_843911 ?auto_843913 ) ) ( not ( = ?auto_843911 ?auto_843914 ) ) ( not ( = ?auto_843911 ?auto_843915 ) ) ( not ( = ?auto_843911 ?auto_843916 ) ) ( not ( = ?auto_843911 ?auto_843917 ) ) ( not ( = ?auto_843911 ?auto_843918 ) ) ( not ( = ?auto_843911 ?auto_843919 ) ) ( not ( = ?auto_843911 ?auto_843920 ) ) ( not ( = ?auto_843911 ?auto_843921 ) ) ( not ( = ?auto_843911 ?auto_843922 ) ) ( not ( = ?auto_843911 ?auto_843923 ) ) ( not ( = ?auto_843911 ?auto_843924 ) ) ( not ( = ?auto_843911 ?auto_843925 ) ) ( not ( = ?auto_843911 ?auto_843926 ) ) ( not ( = ?auto_843911 ?auto_843927 ) ) ( not ( = ?auto_843911 ?auto_843928 ) ) ( not ( = ?auto_843911 ?auto_843929 ) ) ( not ( = ?auto_843912 ?auto_843913 ) ) ( not ( = ?auto_843912 ?auto_843914 ) ) ( not ( = ?auto_843912 ?auto_843915 ) ) ( not ( = ?auto_843912 ?auto_843916 ) ) ( not ( = ?auto_843912 ?auto_843917 ) ) ( not ( = ?auto_843912 ?auto_843918 ) ) ( not ( = ?auto_843912 ?auto_843919 ) ) ( not ( = ?auto_843912 ?auto_843920 ) ) ( not ( = ?auto_843912 ?auto_843921 ) ) ( not ( = ?auto_843912 ?auto_843922 ) ) ( not ( = ?auto_843912 ?auto_843923 ) ) ( not ( = ?auto_843912 ?auto_843924 ) ) ( not ( = ?auto_843912 ?auto_843925 ) ) ( not ( = ?auto_843912 ?auto_843926 ) ) ( not ( = ?auto_843912 ?auto_843927 ) ) ( not ( = ?auto_843912 ?auto_843928 ) ) ( not ( = ?auto_843912 ?auto_843929 ) ) ( not ( = ?auto_843913 ?auto_843914 ) ) ( not ( = ?auto_843913 ?auto_843915 ) ) ( not ( = ?auto_843913 ?auto_843916 ) ) ( not ( = ?auto_843913 ?auto_843917 ) ) ( not ( = ?auto_843913 ?auto_843918 ) ) ( not ( = ?auto_843913 ?auto_843919 ) ) ( not ( = ?auto_843913 ?auto_843920 ) ) ( not ( = ?auto_843913 ?auto_843921 ) ) ( not ( = ?auto_843913 ?auto_843922 ) ) ( not ( = ?auto_843913 ?auto_843923 ) ) ( not ( = ?auto_843913 ?auto_843924 ) ) ( not ( = ?auto_843913 ?auto_843925 ) ) ( not ( = ?auto_843913 ?auto_843926 ) ) ( not ( = ?auto_843913 ?auto_843927 ) ) ( not ( = ?auto_843913 ?auto_843928 ) ) ( not ( = ?auto_843913 ?auto_843929 ) ) ( not ( = ?auto_843914 ?auto_843915 ) ) ( not ( = ?auto_843914 ?auto_843916 ) ) ( not ( = ?auto_843914 ?auto_843917 ) ) ( not ( = ?auto_843914 ?auto_843918 ) ) ( not ( = ?auto_843914 ?auto_843919 ) ) ( not ( = ?auto_843914 ?auto_843920 ) ) ( not ( = ?auto_843914 ?auto_843921 ) ) ( not ( = ?auto_843914 ?auto_843922 ) ) ( not ( = ?auto_843914 ?auto_843923 ) ) ( not ( = ?auto_843914 ?auto_843924 ) ) ( not ( = ?auto_843914 ?auto_843925 ) ) ( not ( = ?auto_843914 ?auto_843926 ) ) ( not ( = ?auto_843914 ?auto_843927 ) ) ( not ( = ?auto_843914 ?auto_843928 ) ) ( not ( = ?auto_843914 ?auto_843929 ) ) ( not ( = ?auto_843915 ?auto_843916 ) ) ( not ( = ?auto_843915 ?auto_843917 ) ) ( not ( = ?auto_843915 ?auto_843918 ) ) ( not ( = ?auto_843915 ?auto_843919 ) ) ( not ( = ?auto_843915 ?auto_843920 ) ) ( not ( = ?auto_843915 ?auto_843921 ) ) ( not ( = ?auto_843915 ?auto_843922 ) ) ( not ( = ?auto_843915 ?auto_843923 ) ) ( not ( = ?auto_843915 ?auto_843924 ) ) ( not ( = ?auto_843915 ?auto_843925 ) ) ( not ( = ?auto_843915 ?auto_843926 ) ) ( not ( = ?auto_843915 ?auto_843927 ) ) ( not ( = ?auto_843915 ?auto_843928 ) ) ( not ( = ?auto_843915 ?auto_843929 ) ) ( not ( = ?auto_843916 ?auto_843917 ) ) ( not ( = ?auto_843916 ?auto_843918 ) ) ( not ( = ?auto_843916 ?auto_843919 ) ) ( not ( = ?auto_843916 ?auto_843920 ) ) ( not ( = ?auto_843916 ?auto_843921 ) ) ( not ( = ?auto_843916 ?auto_843922 ) ) ( not ( = ?auto_843916 ?auto_843923 ) ) ( not ( = ?auto_843916 ?auto_843924 ) ) ( not ( = ?auto_843916 ?auto_843925 ) ) ( not ( = ?auto_843916 ?auto_843926 ) ) ( not ( = ?auto_843916 ?auto_843927 ) ) ( not ( = ?auto_843916 ?auto_843928 ) ) ( not ( = ?auto_843916 ?auto_843929 ) ) ( not ( = ?auto_843917 ?auto_843918 ) ) ( not ( = ?auto_843917 ?auto_843919 ) ) ( not ( = ?auto_843917 ?auto_843920 ) ) ( not ( = ?auto_843917 ?auto_843921 ) ) ( not ( = ?auto_843917 ?auto_843922 ) ) ( not ( = ?auto_843917 ?auto_843923 ) ) ( not ( = ?auto_843917 ?auto_843924 ) ) ( not ( = ?auto_843917 ?auto_843925 ) ) ( not ( = ?auto_843917 ?auto_843926 ) ) ( not ( = ?auto_843917 ?auto_843927 ) ) ( not ( = ?auto_843917 ?auto_843928 ) ) ( not ( = ?auto_843917 ?auto_843929 ) ) ( not ( = ?auto_843918 ?auto_843919 ) ) ( not ( = ?auto_843918 ?auto_843920 ) ) ( not ( = ?auto_843918 ?auto_843921 ) ) ( not ( = ?auto_843918 ?auto_843922 ) ) ( not ( = ?auto_843918 ?auto_843923 ) ) ( not ( = ?auto_843918 ?auto_843924 ) ) ( not ( = ?auto_843918 ?auto_843925 ) ) ( not ( = ?auto_843918 ?auto_843926 ) ) ( not ( = ?auto_843918 ?auto_843927 ) ) ( not ( = ?auto_843918 ?auto_843928 ) ) ( not ( = ?auto_843918 ?auto_843929 ) ) ( not ( = ?auto_843919 ?auto_843920 ) ) ( not ( = ?auto_843919 ?auto_843921 ) ) ( not ( = ?auto_843919 ?auto_843922 ) ) ( not ( = ?auto_843919 ?auto_843923 ) ) ( not ( = ?auto_843919 ?auto_843924 ) ) ( not ( = ?auto_843919 ?auto_843925 ) ) ( not ( = ?auto_843919 ?auto_843926 ) ) ( not ( = ?auto_843919 ?auto_843927 ) ) ( not ( = ?auto_843919 ?auto_843928 ) ) ( not ( = ?auto_843919 ?auto_843929 ) ) ( not ( = ?auto_843920 ?auto_843921 ) ) ( not ( = ?auto_843920 ?auto_843922 ) ) ( not ( = ?auto_843920 ?auto_843923 ) ) ( not ( = ?auto_843920 ?auto_843924 ) ) ( not ( = ?auto_843920 ?auto_843925 ) ) ( not ( = ?auto_843920 ?auto_843926 ) ) ( not ( = ?auto_843920 ?auto_843927 ) ) ( not ( = ?auto_843920 ?auto_843928 ) ) ( not ( = ?auto_843920 ?auto_843929 ) ) ( not ( = ?auto_843921 ?auto_843922 ) ) ( not ( = ?auto_843921 ?auto_843923 ) ) ( not ( = ?auto_843921 ?auto_843924 ) ) ( not ( = ?auto_843921 ?auto_843925 ) ) ( not ( = ?auto_843921 ?auto_843926 ) ) ( not ( = ?auto_843921 ?auto_843927 ) ) ( not ( = ?auto_843921 ?auto_843928 ) ) ( not ( = ?auto_843921 ?auto_843929 ) ) ( not ( = ?auto_843922 ?auto_843923 ) ) ( not ( = ?auto_843922 ?auto_843924 ) ) ( not ( = ?auto_843922 ?auto_843925 ) ) ( not ( = ?auto_843922 ?auto_843926 ) ) ( not ( = ?auto_843922 ?auto_843927 ) ) ( not ( = ?auto_843922 ?auto_843928 ) ) ( not ( = ?auto_843922 ?auto_843929 ) ) ( not ( = ?auto_843923 ?auto_843924 ) ) ( not ( = ?auto_843923 ?auto_843925 ) ) ( not ( = ?auto_843923 ?auto_843926 ) ) ( not ( = ?auto_843923 ?auto_843927 ) ) ( not ( = ?auto_843923 ?auto_843928 ) ) ( not ( = ?auto_843923 ?auto_843929 ) ) ( not ( = ?auto_843924 ?auto_843925 ) ) ( not ( = ?auto_843924 ?auto_843926 ) ) ( not ( = ?auto_843924 ?auto_843927 ) ) ( not ( = ?auto_843924 ?auto_843928 ) ) ( not ( = ?auto_843924 ?auto_843929 ) ) ( not ( = ?auto_843925 ?auto_843926 ) ) ( not ( = ?auto_843925 ?auto_843927 ) ) ( not ( = ?auto_843925 ?auto_843928 ) ) ( not ( = ?auto_843925 ?auto_843929 ) ) ( not ( = ?auto_843926 ?auto_843927 ) ) ( not ( = ?auto_843926 ?auto_843928 ) ) ( not ( = ?auto_843926 ?auto_843929 ) ) ( not ( = ?auto_843927 ?auto_843928 ) ) ( not ( = ?auto_843927 ?auto_843929 ) ) ( not ( = ?auto_843928 ?auto_843929 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_843928 ?auto_843929 )
      ( !STACK ?auto_843928 ?auto_843927 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_843948 - BLOCK
      ?auto_843949 - BLOCK
      ?auto_843950 - BLOCK
      ?auto_843951 - BLOCK
      ?auto_843952 - BLOCK
      ?auto_843953 - BLOCK
      ?auto_843954 - BLOCK
      ?auto_843955 - BLOCK
      ?auto_843956 - BLOCK
      ?auto_843957 - BLOCK
      ?auto_843958 - BLOCK
      ?auto_843959 - BLOCK
      ?auto_843960 - BLOCK
      ?auto_843961 - BLOCK
      ?auto_843962 - BLOCK
      ?auto_843963 - BLOCK
      ?auto_843964 - BLOCK
      ?auto_843965 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_843964 ) ( ON-TABLE ?auto_843965 ) ( CLEAR ?auto_843965 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_843948 ) ( ON ?auto_843949 ?auto_843948 ) ( ON ?auto_843950 ?auto_843949 ) ( ON ?auto_843951 ?auto_843950 ) ( ON ?auto_843952 ?auto_843951 ) ( ON ?auto_843953 ?auto_843952 ) ( ON ?auto_843954 ?auto_843953 ) ( ON ?auto_843955 ?auto_843954 ) ( ON ?auto_843956 ?auto_843955 ) ( ON ?auto_843957 ?auto_843956 ) ( ON ?auto_843958 ?auto_843957 ) ( ON ?auto_843959 ?auto_843958 ) ( ON ?auto_843960 ?auto_843959 ) ( ON ?auto_843961 ?auto_843960 ) ( ON ?auto_843962 ?auto_843961 ) ( ON ?auto_843963 ?auto_843962 ) ( ON ?auto_843964 ?auto_843963 ) ( not ( = ?auto_843948 ?auto_843949 ) ) ( not ( = ?auto_843948 ?auto_843950 ) ) ( not ( = ?auto_843948 ?auto_843951 ) ) ( not ( = ?auto_843948 ?auto_843952 ) ) ( not ( = ?auto_843948 ?auto_843953 ) ) ( not ( = ?auto_843948 ?auto_843954 ) ) ( not ( = ?auto_843948 ?auto_843955 ) ) ( not ( = ?auto_843948 ?auto_843956 ) ) ( not ( = ?auto_843948 ?auto_843957 ) ) ( not ( = ?auto_843948 ?auto_843958 ) ) ( not ( = ?auto_843948 ?auto_843959 ) ) ( not ( = ?auto_843948 ?auto_843960 ) ) ( not ( = ?auto_843948 ?auto_843961 ) ) ( not ( = ?auto_843948 ?auto_843962 ) ) ( not ( = ?auto_843948 ?auto_843963 ) ) ( not ( = ?auto_843948 ?auto_843964 ) ) ( not ( = ?auto_843948 ?auto_843965 ) ) ( not ( = ?auto_843949 ?auto_843950 ) ) ( not ( = ?auto_843949 ?auto_843951 ) ) ( not ( = ?auto_843949 ?auto_843952 ) ) ( not ( = ?auto_843949 ?auto_843953 ) ) ( not ( = ?auto_843949 ?auto_843954 ) ) ( not ( = ?auto_843949 ?auto_843955 ) ) ( not ( = ?auto_843949 ?auto_843956 ) ) ( not ( = ?auto_843949 ?auto_843957 ) ) ( not ( = ?auto_843949 ?auto_843958 ) ) ( not ( = ?auto_843949 ?auto_843959 ) ) ( not ( = ?auto_843949 ?auto_843960 ) ) ( not ( = ?auto_843949 ?auto_843961 ) ) ( not ( = ?auto_843949 ?auto_843962 ) ) ( not ( = ?auto_843949 ?auto_843963 ) ) ( not ( = ?auto_843949 ?auto_843964 ) ) ( not ( = ?auto_843949 ?auto_843965 ) ) ( not ( = ?auto_843950 ?auto_843951 ) ) ( not ( = ?auto_843950 ?auto_843952 ) ) ( not ( = ?auto_843950 ?auto_843953 ) ) ( not ( = ?auto_843950 ?auto_843954 ) ) ( not ( = ?auto_843950 ?auto_843955 ) ) ( not ( = ?auto_843950 ?auto_843956 ) ) ( not ( = ?auto_843950 ?auto_843957 ) ) ( not ( = ?auto_843950 ?auto_843958 ) ) ( not ( = ?auto_843950 ?auto_843959 ) ) ( not ( = ?auto_843950 ?auto_843960 ) ) ( not ( = ?auto_843950 ?auto_843961 ) ) ( not ( = ?auto_843950 ?auto_843962 ) ) ( not ( = ?auto_843950 ?auto_843963 ) ) ( not ( = ?auto_843950 ?auto_843964 ) ) ( not ( = ?auto_843950 ?auto_843965 ) ) ( not ( = ?auto_843951 ?auto_843952 ) ) ( not ( = ?auto_843951 ?auto_843953 ) ) ( not ( = ?auto_843951 ?auto_843954 ) ) ( not ( = ?auto_843951 ?auto_843955 ) ) ( not ( = ?auto_843951 ?auto_843956 ) ) ( not ( = ?auto_843951 ?auto_843957 ) ) ( not ( = ?auto_843951 ?auto_843958 ) ) ( not ( = ?auto_843951 ?auto_843959 ) ) ( not ( = ?auto_843951 ?auto_843960 ) ) ( not ( = ?auto_843951 ?auto_843961 ) ) ( not ( = ?auto_843951 ?auto_843962 ) ) ( not ( = ?auto_843951 ?auto_843963 ) ) ( not ( = ?auto_843951 ?auto_843964 ) ) ( not ( = ?auto_843951 ?auto_843965 ) ) ( not ( = ?auto_843952 ?auto_843953 ) ) ( not ( = ?auto_843952 ?auto_843954 ) ) ( not ( = ?auto_843952 ?auto_843955 ) ) ( not ( = ?auto_843952 ?auto_843956 ) ) ( not ( = ?auto_843952 ?auto_843957 ) ) ( not ( = ?auto_843952 ?auto_843958 ) ) ( not ( = ?auto_843952 ?auto_843959 ) ) ( not ( = ?auto_843952 ?auto_843960 ) ) ( not ( = ?auto_843952 ?auto_843961 ) ) ( not ( = ?auto_843952 ?auto_843962 ) ) ( not ( = ?auto_843952 ?auto_843963 ) ) ( not ( = ?auto_843952 ?auto_843964 ) ) ( not ( = ?auto_843952 ?auto_843965 ) ) ( not ( = ?auto_843953 ?auto_843954 ) ) ( not ( = ?auto_843953 ?auto_843955 ) ) ( not ( = ?auto_843953 ?auto_843956 ) ) ( not ( = ?auto_843953 ?auto_843957 ) ) ( not ( = ?auto_843953 ?auto_843958 ) ) ( not ( = ?auto_843953 ?auto_843959 ) ) ( not ( = ?auto_843953 ?auto_843960 ) ) ( not ( = ?auto_843953 ?auto_843961 ) ) ( not ( = ?auto_843953 ?auto_843962 ) ) ( not ( = ?auto_843953 ?auto_843963 ) ) ( not ( = ?auto_843953 ?auto_843964 ) ) ( not ( = ?auto_843953 ?auto_843965 ) ) ( not ( = ?auto_843954 ?auto_843955 ) ) ( not ( = ?auto_843954 ?auto_843956 ) ) ( not ( = ?auto_843954 ?auto_843957 ) ) ( not ( = ?auto_843954 ?auto_843958 ) ) ( not ( = ?auto_843954 ?auto_843959 ) ) ( not ( = ?auto_843954 ?auto_843960 ) ) ( not ( = ?auto_843954 ?auto_843961 ) ) ( not ( = ?auto_843954 ?auto_843962 ) ) ( not ( = ?auto_843954 ?auto_843963 ) ) ( not ( = ?auto_843954 ?auto_843964 ) ) ( not ( = ?auto_843954 ?auto_843965 ) ) ( not ( = ?auto_843955 ?auto_843956 ) ) ( not ( = ?auto_843955 ?auto_843957 ) ) ( not ( = ?auto_843955 ?auto_843958 ) ) ( not ( = ?auto_843955 ?auto_843959 ) ) ( not ( = ?auto_843955 ?auto_843960 ) ) ( not ( = ?auto_843955 ?auto_843961 ) ) ( not ( = ?auto_843955 ?auto_843962 ) ) ( not ( = ?auto_843955 ?auto_843963 ) ) ( not ( = ?auto_843955 ?auto_843964 ) ) ( not ( = ?auto_843955 ?auto_843965 ) ) ( not ( = ?auto_843956 ?auto_843957 ) ) ( not ( = ?auto_843956 ?auto_843958 ) ) ( not ( = ?auto_843956 ?auto_843959 ) ) ( not ( = ?auto_843956 ?auto_843960 ) ) ( not ( = ?auto_843956 ?auto_843961 ) ) ( not ( = ?auto_843956 ?auto_843962 ) ) ( not ( = ?auto_843956 ?auto_843963 ) ) ( not ( = ?auto_843956 ?auto_843964 ) ) ( not ( = ?auto_843956 ?auto_843965 ) ) ( not ( = ?auto_843957 ?auto_843958 ) ) ( not ( = ?auto_843957 ?auto_843959 ) ) ( not ( = ?auto_843957 ?auto_843960 ) ) ( not ( = ?auto_843957 ?auto_843961 ) ) ( not ( = ?auto_843957 ?auto_843962 ) ) ( not ( = ?auto_843957 ?auto_843963 ) ) ( not ( = ?auto_843957 ?auto_843964 ) ) ( not ( = ?auto_843957 ?auto_843965 ) ) ( not ( = ?auto_843958 ?auto_843959 ) ) ( not ( = ?auto_843958 ?auto_843960 ) ) ( not ( = ?auto_843958 ?auto_843961 ) ) ( not ( = ?auto_843958 ?auto_843962 ) ) ( not ( = ?auto_843958 ?auto_843963 ) ) ( not ( = ?auto_843958 ?auto_843964 ) ) ( not ( = ?auto_843958 ?auto_843965 ) ) ( not ( = ?auto_843959 ?auto_843960 ) ) ( not ( = ?auto_843959 ?auto_843961 ) ) ( not ( = ?auto_843959 ?auto_843962 ) ) ( not ( = ?auto_843959 ?auto_843963 ) ) ( not ( = ?auto_843959 ?auto_843964 ) ) ( not ( = ?auto_843959 ?auto_843965 ) ) ( not ( = ?auto_843960 ?auto_843961 ) ) ( not ( = ?auto_843960 ?auto_843962 ) ) ( not ( = ?auto_843960 ?auto_843963 ) ) ( not ( = ?auto_843960 ?auto_843964 ) ) ( not ( = ?auto_843960 ?auto_843965 ) ) ( not ( = ?auto_843961 ?auto_843962 ) ) ( not ( = ?auto_843961 ?auto_843963 ) ) ( not ( = ?auto_843961 ?auto_843964 ) ) ( not ( = ?auto_843961 ?auto_843965 ) ) ( not ( = ?auto_843962 ?auto_843963 ) ) ( not ( = ?auto_843962 ?auto_843964 ) ) ( not ( = ?auto_843962 ?auto_843965 ) ) ( not ( = ?auto_843963 ?auto_843964 ) ) ( not ( = ?auto_843963 ?auto_843965 ) ) ( not ( = ?auto_843964 ?auto_843965 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_843965 )
      ( !STACK ?auto_843965 ?auto_843964 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_843984 - BLOCK
      ?auto_843985 - BLOCK
      ?auto_843986 - BLOCK
      ?auto_843987 - BLOCK
      ?auto_843988 - BLOCK
      ?auto_843989 - BLOCK
      ?auto_843990 - BLOCK
      ?auto_843991 - BLOCK
      ?auto_843992 - BLOCK
      ?auto_843993 - BLOCK
      ?auto_843994 - BLOCK
      ?auto_843995 - BLOCK
      ?auto_843996 - BLOCK
      ?auto_843997 - BLOCK
      ?auto_843998 - BLOCK
      ?auto_843999 - BLOCK
      ?auto_844000 - BLOCK
      ?auto_844001 - BLOCK
    )
    :vars
    (
      ?auto_844002 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_844001 ?auto_844002 ) ( ON-TABLE ?auto_843984 ) ( ON ?auto_843985 ?auto_843984 ) ( ON ?auto_843986 ?auto_843985 ) ( ON ?auto_843987 ?auto_843986 ) ( ON ?auto_843988 ?auto_843987 ) ( ON ?auto_843989 ?auto_843988 ) ( ON ?auto_843990 ?auto_843989 ) ( ON ?auto_843991 ?auto_843990 ) ( ON ?auto_843992 ?auto_843991 ) ( ON ?auto_843993 ?auto_843992 ) ( ON ?auto_843994 ?auto_843993 ) ( ON ?auto_843995 ?auto_843994 ) ( ON ?auto_843996 ?auto_843995 ) ( ON ?auto_843997 ?auto_843996 ) ( ON ?auto_843998 ?auto_843997 ) ( ON ?auto_843999 ?auto_843998 ) ( not ( = ?auto_843984 ?auto_843985 ) ) ( not ( = ?auto_843984 ?auto_843986 ) ) ( not ( = ?auto_843984 ?auto_843987 ) ) ( not ( = ?auto_843984 ?auto_843988 ) ) ( not ( = ?auto_843984 ?auto_843989 ) ) ( not ( = ?auto_843984 ?auto_843990 ) ) ( not ( = ?auto_843984 ?auto_843991 ) ) ( not ( = ?auto_843984 ?auto_843992 ) ) ( not ( = ?auto_843984 ?auto_843993 ) ) ( not ( = ?auto_843984 ?auto_843994 ) ) ( not ( = ?auto_843984 ?auto_843995 ) ) ( not ( = ?auto_843984 ?auto_843996 ) ) ( not ( = ?auto_843984 ?auto_843997 ) ) ( not ( = ?auto_843984 ?auto_843998 ) ) ( not ( = ?auto_843984 ?auto_843999 ) ) ( not ( = ?auto_843984 ?auto_844000 ) ) ( not ( = ?auto_843984 ?auto_844001 ) ) ( not ( = ?auto_843984 ?auto_844002 ) ) ( not ( = ?auto_843985 ?auto_843986 ) ) ( not ( = ?auto_843985 ?auto_843987 ) ) ( not ( = ?auto_843985 ?auto_843988 ) ) ( not ( = ?auto_843985 ?auto_843989 ) ) ( not ( = ?auto_843985 ?auto_843990 ) ) ( not ( = ?auto_843985 ?auto_843991 ) ) ( not ( = ?auto_843985 ?auto_843992 ) ) ( not ( = ?auto_843985 ?auto_843993 ) ) ( not ( = ?auto_843985 ?auto_843994 ) ) ( not ( = ?auto_843985 ?auto_843995 ) ) ( not ( = ?auto_843985 ?auto_843996 ) ) ( not ( = ?auto_843985 ?auto_843997 ) ) ( not ( = ?auto_843985 ?auto_843998 ) ) ( not ( = ?auto_843985 ?auto_843999 ) ) ( not ( = ?auto_843985 ?auto_844000 ) ) ( not ( = ?auto_843985 ?auto_844001 ) ) ( not ( = ?auto_843985 ?auto_844002 ) ) ( not ( = ?auto_843986 ?auto_843987 ) ) ( not ( = ?auto_843986 ?auto_843988 ) ) ( not ( = ?auto_843986 ?auto_843989 ) ) ( not ( = ?auto_843986 ?auto_843990 ) ) ( not ( = ?auto_843986 ?auto_843991 ) ) ( not ( = ?auto_843986 ?auto_843992 ) ) ( not ( = ?auto_843986 ?auto_843993 ) ) ( not ( = ?auto_843986 ?auto_843994 ) ) ( not ( = ?auto_843986 ?auto_843995 ) ) ( not ( = ?auto_843986 ?auto_843996 ) ) ( not ( = ?auto_843986 ?auto_843997 ) ) ( not ( = ?auto_843986 ?auto_843998 ) ) ( not ( = ?auto_843986 ?auto_843999 ) ) ( not ( = ?auto_843986 ?auto_844000 ) ) ( not ( = ?auto_843986 ?auto_844001 ) ) ( not ( = ?auto_843986 ?auto_844002 ) ) ( not ( = ?auto_843987 ?auto_843988 ) ) ( not ( = ?auto_843987 ?auto_843989 ) ) ( not ( = ?auto_843987 ?auto_843990 ) ) ( not ( = ?auto_843987 ?auto_843991 ) ) ( not ( = ?auto_843987 ?auto_843992 ) ) ( not ( = ?auto_843987 ?auto_843993 ) ) ( not ( = ?auto_843987 ?auto_843994 ) ) ( not ( = ?auto_843987 ?auto_843995 ) ) ( not ( = ?auto_843987 ?auto_843996 ) ) ( not ( = ?auto_843987 ?auto_843997 ) ) ( not ( = ?auto_843987 ?auto_843998 ) ) ( not ( = ?auto_843987 ?auto_843999 ) ) ( not ( = ?auto_843987 ?auto_844000 ) ) ( not ( = ?auto_843987 ?auto_844001 ) ) ( not ( = ?auto_843987 ?auto_844002 ) ) ( not ( = ?auto_843988 ?auto_843989 ) ) ( not ( = ?auto_843988 ?auto_843990 ) ) ( not ( = ?auto_843988 ?auto_843991 ) ) ( not ( = ?auto_843988 ?auto_843992 ) ) ( not ( = ?auto_843988 ?auto_843993 ) ) ( not ( = ?auto_843988 ?auto_843994 ) ) ( not ( = ?auto_843988 ?auto_843995 ) ) ( not ( = ?auto_843988 ?auto_843996 ) ) ( not ( = ?auto_843988 ?auto_843997 ) ) ( not ( = ?auto_843988 ?auto_843998 ) ) ( not ( = ?auto_843988 ?auto_843999 ) ) ( not ( = ?auto_843988 ?auto_844000 ) ) ( not ( = ?auto_843988 ?auto_844001 ) ) ( not ( = ?auto_843988 ?auto_844002 ) ) ( not ( = ?auto_843989 ?auto_843990 ) ) ( not ( = ?auto_843989 ?auto_843991 ) ) ( not ( = ?auto_843989 ?auto_843992 ) ) ( not ( = ?auto_843989 ?auto_843993 ) ) ( not ( = ?auto_843989 ?auto_843994 ) ) ( not ( = ?auto_843989 ?auto_843995 ) ) ( not ( = ?auto_843989 ?auto_843996 ) ) ( not ( = ?auto_843989 ?auto_843997 ) ) ( not ( = ?auto_843989 ?auto_843998 ) ) ( not ( = ?auto_843989 ?auto_843999 ) ) ( not ( = ?auto_843989 ?auto_844000 ) ) ( not ( = ?auto_843989 ?auto_844001 ) ) ( not ( = ?auto_843989 ?auto_844002 ) ) ( not ( = ?auto_843990 ?auto_843991 ) ) ( not ( = ?auto_843990 ?auto_843992 ) ) ( not ( = ?auto_843990 ?auto_843993 ) ) ( not ( = ?auto_843990 ?auto_843994 ) ) ( not ( = ?auto_843990 ?auto_843995 ) ) ( not ( = ?auto_843990 ?auto_843996 ) ) ( not ( = ?auto_843990 ?auto_843997 ) ) ( not ( = ?auto_843990 ?auto_843998 ) ) ( not ( = ?auto_843990 ?auto_843999 ) ) ( not ( = ?auto_843990 ?auto_844000 ) ) ( not ( = ?auto_843990 ?auto_844001 ) ) ( not ( = ?auto_843990 ?auto_844002 ) ) ( not ( = ?auto_843991 ?auto_843992 ) ) ( not ( = ?auto_843991 ?auto_843993 ) ) ( not ( = ?auto_843991 ?auto_843994 ) ) ( not ( = ?auto_843991 ?auto_843995 ) ) ( not ( = ?auto_843991 ?auto_843996 ) ) ( not ( = ?auto_843991 ?auto_843997 ) ) ( not ( = ?auto_843991 ?auto_843998 ) ) ( not ( = ?auto_843991 ?auto_843999 ) ) ( not ( = ?auto_843991 ?auto_844000 ) ) ( not ( = ?auto_843991 ?auto_844001 ) ) ( not ( = ?auto_843991 ?auto_844002 ) ) ( not ( = ?auto_843992 ?auto_843993 ) ) ( not ( = ?auto_843992 ?auto_843994 ) ) ( not ( = ?auto_843992 ?auto_843995 ) ) ( not ( = ?auto_843992 ?auto_843996 ) ) ( not ( = ?auto_843992 ?auto_843997 ) ) ( not ( = ?auto_843992 ?auto_843998 ) ) ( not ( = ?auto_843992 ?auto_843999 ) ) ( not ( = ?auto_843992 ?auto_844000 ) ) ( not ( = ?auto_843992 ?auto_844001 ) ) ( not ( = ?auto_843992 ?auto_844002 ) ) ( not ( = ?auto_843993 ?auto_843994 ) ) ( not ( = ?auto_843993 ?auto_843995 ) ) ( not ( = ?auto_843993 ?auto_843996 ) ) ( not ( = ?auto_843993 ?auto_843997 ) ) ( not ( = ?auto_843993 ?auto_843998 ) ) ( not ( = ?auto_843993 ?auto_843999 ) ) ( not ( = ?auto_843993 ?auto_844000 ) ) ( not ( = ?auto_843993 ?auto_844001 ) ) ( not ( = ?auto_843993 ?auto_844002 ) ) ( not ( = ?auto_843994 ?auto_843995 ) ) ( not ( = ?auto_843994 ?auto_843996 ) ) ( not ( = ?auto_843994 ?auto_843997 ) ) ( not ( = ?auto_843994 ?auto_843998 ) ) ( not ( = ?auto_843994 ?auto_843999 ) ) ( not ( = ?auto_843994 ?auto_844000 ) ) ( not ( = ?auto_843994 ?auto_844001 ) ) ( not ( = ?auto_843994 ?auto_844002 ) ) ( not ( = ?auto_843995 ?auto_843996 ) ) ( not ( = ?auto_843995 ?auto_843997 ) ) ( not ( = ?auto_843995 ?auto_843998 ) ) ( not ( = ?auto_843995 ?auto_843999 ) ) ( not ( = ?auto_843995 ?auto_844000 ) ) ( not ( = ?auto_843995 ?auto_844001 ) ) ( not ( = ?auto_843995 ?auto_844002 ) ) ( not ( = ?auto_843996 ?auto_843997 ) ) ( not ( = ?auto_843996 ?auto_843998 ) ) ( not ( = ?auto_843996 ?auto_843999 ) ) ( not ( = ?auto_843996 ?auto_844000 ) ) ( not ( = ?auto_843996 ?auto_844001 ) ) ( not ( = ?auto_843996 ?auto_844002 ) ) ( not ( = ?auto_843997 ?auto_843998 ) ) ( not ( = ?auto_843997 ?auto_843999 ) ) ( not ( = ?auto_843997 ?auto_844000 ) ) ( not ( = ?auto_843997 ?auto_844001 ) ) ( not ( = ?auto_843997 ?auto_844002 ) ) ( not ( = ?auto_843998 ?auto_843999 ) ) ( not ( = ?auto_843998 ?auto_844000 ) ) ( not ( = ?auto_843998 ?auto_844001 ) ) ( not ( = ?auto_843998 ?auto_844002 ) ) ( not ( = ?auto_843999 ?auto_844000 ) ) ( not ( = ?auto_843999 ?auto_844001 ) ) ( not ( = ?auto_843999 ?auto_844002 ) ) ( not ( = ?auto_844000 ?auto_844001 ) ) ( not ( = ?auto_844000 ?auto_844002 ) ) ( not ( = ?auto_844001 ?auto_844002 ) ) ( CLEAR ?auto_843999 ) ( ON ?auto_844000 ?auto_844001 ) ( CLEAR ?auto_844000 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-17PILE ?auto_843984 ?auto_843985 ?auto_843986 ?auto_843987 ?auto_843988 ?auto_843989 ?auto_843990 ?auto_843991 ?auto_843992 ?auto_843993 ?auto_843994 ?auto_843995 ?auto_843996 ?auto_843997 ?auto_843998 ?auto_843999 ?auto_844000 )
      ( MAKE-18PILE ?auto_843984 ?auto_843985 ?auto_843986 ?auto_843987 ?auto_843988 ?auto_843989 ?auto_843990 ?auto_843991 ?auto_843992 ?auto_843993 ?auto_843994 ?auto_843995 ?auto_843996 ?auto_843997 ?auto_843998 ?auto_843999 ?auto_844000 ?auto_844001 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_844021 - BLOCK
      ?auto_844022 - BLOCK
      ?auto_844023 - BLOCK
      ?auto_844024 - BLOCK
      ?auto_844025 - BLOCK
      ?auto_844026 - BLOCK
      ?auto_844027 - BLOCK
      ?auto_844028 - BLOCK
      ?auto_844029 - BLOCK
      ?auto_844030 - BLOCK
      ?auto_844031 - BLOCK
      ?auto_844032 - BLOCK
      ?auto_844033 - BLOCK
      ?auto_844034 - BLOCK
      ?auto_844035 - BLOCK
      ?auto_844036 - BLOCK
      ?auto_844037 - BLOCK
      ?auto_844038 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_844038 ) ( ON-TABLE ?auto_844021 ) ( ON ?auto_844022 ?auto_844021 ) ( ON ?auto_844023 ?auto_844022 ) ( ON ?auto_844024 ?auto_844023 ) ( ON ?auto_844025 ?auto_844024 ) ( ON ?auto_844026 ?auto_844025 ) ( ON ?auto_844027 ?auto_844026 ) ( ON ?auto_844028 ?auto_844027 ) ( ON ?auto_844029 ?auto_844028 ) ( ON ?auto_844030 ?auto_844029 ) ( ON ?auto_844031 ?auto_844030 ) ( ON ?auto_844032 ?auto_844031 ) ( ON ?auto_844033 ?auto_844032 ) ( ON ?auto_844034 ?auto_844033 ) ( ON ?auto_844035 ?auto_844034 ) ( ON ?auto_844036 ?auto_844035 ) ( not ( = ?auto_844021 ?auto_844022 ) ) ( not ( = ?auto_844021 ?auto_844023 ) ) ( not ( = ?auto_844021 ?auto_844024 ) ) ( not ( = ?auto_844021 ?auto_844025 ) ) ( not ( = ?auto_844021 ?auto_844026 ) ) ( not ( = ?auto_844021 ?auto_844027 ) ) ( not ( = ?auto_844021 ?auto_844028 ) ) ( not ( = ?auto_844021 ?auto_844029 ) ) ( not ( = ?auto_844021 ?auto_844030 ) ) ( not ( = ?auto_844021 ?auto_844031 ) ) ( not ( = ?auto_844021 ?auto_844032 ) ) ( not ( = ?auto_844021 ?auto_844033 ) ) ( not ( = ?auto_844021 ?auto_844034 ) ) ( not ( = ?auto_844021 ?auto_844035 ) ) ( not ( = ?auto_844021 ?auto_844036 ) ) ( not ( = ?auto_844021 ?auto_844037 ) ) ( not ( = ?auto_844021 ?auto_844038 ) ) ( not ( = ?auto_844022 ?auto_844023 ) ) ( not ( = ?auto_844022 ?auto_844024 ) ) ( not ( = ?auto_844022 ?auto_844025 ) ) ( not ( = ?auto_844022 ?auto_844026 ) ) ( not ( = ?auto_844022 ?auto_844027 ) ) ( not ( = ?auto_844022 ?auto_844028 ) ) ( not ( = ?auto_844022 ?auto_844029 ) ) ( not ( = ?auto_844022 ?auto_844030 ) ) ( not ( = ?auto_844022 ?auto_844031 ) ) ( not ( = ?auto_844022 ?auto_844032 ) ) ( not ( = ?auto_844022 ?auto_844033 ) ) ( not ( = ?auto_844022 ?auto_844034 ) ) ( not ( = ?auto_844022 ?auto_844035 ) ) ( not ( = ?auto_844022 ?auto_844036 ) ) ( not ( = ?auto_844022 ?auto_844037 ) ) ( not ( = ?auto_844022 ?auto_844038 ) ) ( not ( = ?auto_844023 ?auto_844024 ) ) ( not ( = ?auto_844023 ?auto_844025 ) ) ( not ( = ?auto_844023 ?auto_844026 ) ) ( not ( = ?auto_844023 ?auto_844027 ) ) ( not ( = ?auto_844023 ?auto_844028 ) ) ( not ( = ?auto_844023 ?auto_844029 ) ) ( not ( = ?auto_844023 ?auto_844030 ) ) ( not ( = ?auto_844023 ?auto_844031 ) ) ( not ( = ?auto_844023 ?auto_844032 ) ) ( not ( = ?auto_844023 ?auto_844033 ) ) ( not ( = ?auto_844023 ?auto_844034 ) ) ( not ( = ?auto_844023 ?auto_844035 ) ) ( not ( = ?auto_844023 ?auto_844036 ) ) ( not ( = ?auto_844023 ?auto_844037 ) ) ( not ( = ?auto_844023 ?auto_844038 ) ) ( not ( = ?auto_844024 ?auto_844025 ) ) ( not ( = ?auto_844024 ?auto_844026 ) ) ( not ( = ?auto_844024 ?auto_844027 ) ) ( not ( = ?auto_844024 ?auto_844028 ) ) ( not ( = ?auto_844024 ?auto_844029 ) ) ( not ( = ?auto_844024 ?auto_844030 ) ) ( not ( = ?auto_844024 ?auto_844031 ) ) ( not ( = ?auto_844024 ?auto_844032 ) ) ( not ( = ?auto_844024 ?auto_844033 ) ) ( not ( = ?auto_844024 ?auto_844034 ) ) ( not ( = ?auto_844024 ?auto_844035 ) ) ( not ( = ?auto_844024 ?auto_844036 ) ) ( not ( = ?auto_844024 ?auto_844037 ) ) ( not ( = ?auto_844024 ?auto_844038 ) ) ( not ( = ?auto_844025 ?auto_844026 ) ) ( not ( = ?auto_844025 ?auto_844027 ) ) ( not ( = ?auto_844025 ?auto_844028 ) ) ( not ( = ?auto_844025 ?auto_844029 ) ) ( not ( = ?auto_844025 ?auto_844030 ) ) ( not ( = ?auto_844025 ?auto_844031 ) ) ( not ( = ?auto_844025 ?auto_844032 ) ) ( not ( = ?auto_844025 ?auto_844033 ) ) ( not ( = ?auto_844025 ?auto_844034 ) ) ( not ( = ?auto_844025 ?auto_844035 ) ) ( not ( = ?auto_844025 ?auto_844036 ) ) ( not ( = ?auto_844025 ?auto_844037 ) ) ( not ( = ?auto_844025 ?auto_844038 ) ) ( not ( = ?auto_844026 ?auto_844027 ) ) ( not ( = ?auto_844026 ?auto_844028 ) ) ( not ( = ?auto_844026 ?auto_844029 ) ) ( not ( = ?auto_844026 ?auto_844030 ) ) ( not ( = ?auto_844026 ?auto_844031 ) ) ( not ( = ?auto_844026 ?auto_844032 ) ) ( not ( = ?auto_844026 ?auto_844033 ) ) ( not ( = ?auto_844026 ?auto_844034 ) ) ( not ( = ?auto_844026 ?auto_844035 ) ) ( not ( = ?auto_844026 ?auto_844036 ) ) ( not ( = ?auto_844026 ?auto_844037 ) ) ( not ( = ?auto_844026 ?auto_844038 ) ) ( not ( = ?auto_844027 ?auto_844028 ) ) ( not ( = ?auto_844027 ?auto_844029 ) ) ( not ( = ?auto_844027 ?auto_844030 ) ) ( not ( = ?auto_844027 ?auto_844031 ) ) ( not ( = ?auto_844027 ?auto_844032 ) ) ( not ( = ?auto_844027 ?auto_844033 ) ) ( not ( = ?auto_844027 ?auto_844034 ) ) ( not ( = ?auto_844027 ?auto_844035 ) ) ( not ( = ?auto_844027 ?auto_844036 ) ) ( not ( = ?auto_844027 ?auto_844037 ) ) ( not ( = ?auto_844027 ?auto_844038 ) ) ( not ( = ?auto_844028 ?auto_844029 ) ) ( not ( = ?auto_844028 ?auto_844030 ) ) ( not ( = ?auto_844028 ?auto_844031 ) ) ( not ( = ?auto_844028 ?auto_844032 ) ) ( not ( = ?auto_844028 ?auto_844033 ) ) ( not ( = ?auto_844028 ?auto_844034 ) ) ( not ( = ?auto_844028 ?auto_844035 ) ) ( not ( = ?auto_844028 ?auto_844036 ) ) ( not ( = ?auto_844028 ?auto_844037 ) ) ( not ( = ?auto_844028 ?auto_844038 ) ) ( not ( = ?auto_844029 ?auto_844030 ) ) ( not ( = ?auto_844029 ?auto_844031 ) ) ( not ( = ?auto_844029 ?auto_844032 ) ) ( not ( = ?auto_844029 ?auto_844033 ) ) ( not ( = ?auto_844029 ?auto_844034 ) ) ( not ( = ?auto_844029 ?auto_844035 ) ) ( not ( = ?auto_844029 ?auto_844036 ) ) ( not ( = ?auto_844029 ?auto_844037 ) ) ( not ( = ?auto_844029 ?auto_844038 ) ) ( not ( = ?auto_844030 ?auto_844031 ) ) ( not ( = ?auto_844030 ?auto_844032 ) ) ( not ( = ?auto_844030 ?auto_844033 ) ) ( not ( = ?auto_844030 ?auto_844034 ) ) ( not ( = ?auto_844030 ?auto_844035 ) ) ( not ( = ?auto_844030 ?auto_844036 ) ) ( not ( = ?auto_844030 ?auto_844037 ) ) ( not ( = ?auto_844030 ?auto_844038 ) ) ( not ( = ?auto_844031 ?auto_844032 ) ) ( not ( = ?auto_844031 ?auto_844033 ) ) ( not ( = ?auto_844031 ?auto_844034 ) ) ( not ( = ?auto_844031 ?auto_844035 ) ) ( not ( = ?auto_844031 ?auto_844036 ) ) ( not ( = ?auto_844031 ?auto_844037 ) ) ( not ( = ?auto_844031 ?auto_844038 ) ) ( not ( = ?auto_844032 ?auto_844033 ) ) ( not ( = ?auto_844032 ?auto_844034 ) ) ( not ( = ?auto_844032 ?auto_844035 ) ) ( not ( = ?auto_844032 ?auto_844036 ) ) ( not ( = ?auto_844032 ?auto_844037 ) ) ( not ( = ?auto_844032 ?auto_844038 ) ) ( not ( = ?auto_844033 ?auto_844034 ) ) ( not ( = ?auto_844033 ?auto_844035 ) ) ( not ( = ?auto_844033 ?auto_844036 ) ) ( not ( = ?auto_844033 ?auto_844037 ) ) ( not ( = ?auto_844033 ?auto_844038 ) ) ( not ( = ?auto_844034 ?auto_844035 ) ) ( not ( = ?auto_844034 ?auto_844036 ) ) ( not ( = ?auto_844034 ?auto_844037 ) ) ( not ( = ?auto_844034 ?auto_844038 ) ) ( not ( = ?auto_844035 ?auto_844036 ) ) ( not ( = ?auto_844035 ?auto_844037 ) ) ( not ( = ?auto_844035 ?auto_844038 ) ) ( not ( = ?auto_844036 ?auto_844037 ) ) ( not ( = ?auto_844036 ?auto_844038 ) ) ( not ( = ?auto_844037 ?auto_844038 ) ) ( CLEAR ?auto_844036 ) ( ON ?auto_844037 ?auto_844038 ) ( CLEAR ?auto_844037 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-17PILE ?auto_844021 ?auto_844022 ?auto_844023 ?auto_844024 ?auto_844025 ?auto_844026 ?auto_844027 ?auto_844028 ?auto_844029 ?auto_844030 ?auto_844031 ?auto_844032 ?auto_844033 ?auto_844034 ?auto_844035 ?auto_844036 ?auto_844037 )
      ( MAKE-18PILE ?auto_844021 ?auto_844022 ?auto_844023 ?auto_844024 ?auto_844025 ?auto_844026 ?auto_844027 ?auto_844028 ?auto_844029 ?auto_844030 ?auto_844031 ?auto_844032 ?auto_844033 ?auto_844034 ?auto_844035 ?auto_844036 ?auto_844037 ?auto_844038 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_844057 - BLOCK
      ?auto_844058 - BLOCK
      ?auto_844059 - BLOCK
      ?auto_844060 - BLOCK
      ?auto_844061 - BLOCK
      ?auto_844062 - BLOCK
      ?auto_844063 - BLOCK
      ?auto_844064 - BLOCK
      ?auto_844065 - BLOCK
      ?auto_844066 - BLOCK
      ?auto_844067 - BLOCK
      ?auto_844068 - BLOCK
      ?auto_844069 - BLOCK
      ?auto_844070 - BLOCK
      ?auto_844071 - BLOCK
      ?auto_844072 - BLOCK
      ?auto_844073 - BLOCK
      ?auto_844074 - BLOCK
    )
    :vars
    (
      ?auto_844075 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_844074 ?auto_844075 ) ( ON-TABLE ?auto_844057 ) ( ON ?auto_844058 ?auto_844057 ) ( ON ?auto_844059 ?auto_844058 ) ( ON ?auto_844060 ?auto_844059 ) ( ON ?auto_844061 ?auto_844060 ) ( ON ?auto_844062 ?auto_844061 ) ( ON ?auto_844063 ?auto_844062 ) ( ON ?auto_844064 ?auto_844063 ) ( ON ?auto_844065 ?auto_844064 ) ( ON ?auto_844066 ?auto_844065 ) ( ON ?auto_844067 ?auto_844066 ) ( ON ?auto_844068 ?auto_844067 ) ( ON ?auto_844069 ?auto_844068 ) ( ON ?auto_844070 ?auto_844069 ) ( ON ?auto_844071 ?auto_844070 ) ( not ( = ?auto_844057 ?auto_844058 ) ) ( not ( = ?auto_844057 ?auto_844059 ) ) ( not ( = ?auto_844057 ?auto_844060 ) ) ( not ( = ?auto_844057 ?auto_844061 ) ) ( not ( = ?auto_844057 ?auto_844062 ) ) ( not ( = ?auto_844057 ?auto_844063 ) ) ( not ( = ?auto_844057 ?auto_844064 ) ) ( not ( = ?auto_844057 ?auto_844065 ) ) ( not ( = ?auto_844057 ?auto_844066 ) ) ( not ( = ?auto_844057 ?auto_844067 ) ) ( not ( = ?auto_844057 ?auto_844068 ) ) ( not ( = ?auto_844057 ?auto_844069 ) ) ( not ( = ?auto_844057 ?auto_844070 ) ) ( not ( = ?auto_844057 ?auto_844071 ) ) ( not ( = ?auto_844057 ?auto_844072 ) ) ( not ( = ?auto_844057 ?auto_844073 ) ) ( not ( = ?auto_844057 ?auto_844074 ) ) ( not ( = ?auto_844057 ?auto_844075 ) ) ( not ( = ?auto_844058 ?auto_844059 ) ) ( not ( = ?auto_844058 ?auto_844060 ) ) ( not ( = ?auto_844058 ?auto_844061 ) ) ( not ( = ?auto_844058 ?auto_844062 ) ) ( not ( = ?auto_844058 ?auto_844063 ) ) ( not ( = ?auto_844058 ?auto_844064 ) ) ( not ( = ?auto_844058 ?auto_844065 ) ) ( not ( = ?auto_844058 ?auto_844066 ) ) ( not ( = ?auto_844058 ?auto_844067 ) ) ( not ( = ?auto_844058 ?auto_844068 ) ) ( not ( = ?auto_844058 ?auto_844069 ) ) ( not ( = ?auto_844058 ?auto_844070 ) ) ( not ( = ?auto_844058 ?auto_844071 ) ) ( not ( = ?auto_844058 ?auto_844072 ) ) ( not ( = ?auto_844058 ?auto_844073 ) ) ( not ( = ?auto_844058 ?auto_844074 ) ) ( not ( = ?auto_844058 ?auto_844075 ) ) ( not ( = ?auto_844059 ?auto_844060 ) ) ( not ( = ?auto_844059 ?auto_844061 ) ) ( not ( = ?auto_844059 ?auto_844062 ) ) ( not ( = ?auto_844059 ?auto_844063 ) ) ( not ( = ?auto_844059 ?auto_844064 ) ) ( not ( = ?auto_844059 ?auto_844065 ) ) ( not ( = ?auto_844059 ?auto_844066 ) ) ( not ( = ?auto_844059 ?auto_844067 ) ) ( not ( = ?auto_844059 ?auto_844068 ) ) ( not ( = ?auto_844059 ?auto_844069 ) ) ( not ( = ?auto_844059 ?auto_844070 ) ) ( not ( = ?auto_844059 ?auto_844071 ) ) ( not ( = ?auto_844059 ?auto_844072 ) ) ( not ( = ?auto_844059 ?auto_844073 ) ) ( not ( = ?auto_844059 ?auto_844074 ) ) ( not ( = ?auto_844059 ?auto_844075 ) ) ( not ( = ?auto_844060 ?auto_844061 ) ) ( not ( = ?auto_844060 ?auto_844062 ) ) ( not ( = ?auto_844060 ?auto_844063 ) ) ( not ( = ?auto_844060 ?auto_844064 ) ) ( not ( = ?auto_844060 ?auto_844065 ) ) ( not ( = ?auto_844060 ?auto_844066 ) ) ( not ( = ?auto_844060 ?auto_844067 ) ) ( not ( = ?auto_844060 ?auto_844068 ) ) ( not ( = ?auto_844060 ?auto_844069 ) ) ( not ( = ?auto_844060 ?auto_844070 ) ) ( not ( = ?auto_844060 ?auto_844071 ) ) ( not ( = ?auto_844060 ?auto_844072 ) ) ( not ( = ?auto_844060 ?auto_844073 ) ) ( not ( = ?auto_844060 ?auto_844074 ) ) ( not ( = ?auto_844060 ?auto_844075 ) ) ( not ( = ?auto_844061 ?auto_844062 ) ) ( not ( = ?auto_844061 ?auto_844063 ) ) ( not ( = ?auto_844061 ?auto_844064 ) ) ( not ( = ?auto_844061 ?auto_844065 ) ) ( not ( = ?auto_844061 ?auto_844066 ) ) ( not ( = ?auto_844061 ?auto_844067 ) ) ( not ( = ?auto_844061 ?auto_844068 ) ) ( not ( = ?auto_844061 ?auto_844069 ) ) ( not ( = ?auto_844061 ?auto_844070 ) ) ( not ( = ?auto_844061 ?auto_844071 ) ) ( not ( = ?auto_844061 ?auto_844072 ) ) ( not ( = ?auto_844061 ?auto_844073 ) ) ( not ( = ?auto_844061 ?auto_844074 ) ) ( not ( = ?auto_844061 ?auto_844075 ) ) ( not ( = ?auto_844062 ?auto_844063 ) ) ( not ( = ?auto_844062 ?auto_844064 ) ) ( not ( = ?auto_844062 ?auto_844065 ) ) ( not ( = ?auto_844062 ?auto_844066 ) ) ( not ( = ?auto_844062 ?auto_844067 ) ) ( not ( = ?auto_844062 ?auto_844068 ) ) ( not ( = ?auto_844062 ?auto_844069 ) ) ( not ( = ?auto_844062 ?auto_844070 ) ) ( not ( = ?auto_844062 ?auto_844071 ) ) ( not ( = ?auto_844062 ?auto_844072 ) ) ( not ( = ?auto_844062 ?auto_844073 ) ) ( not ( = ?auto_844062 ?auto_844074 ) ) ( not ( = ?auto_844062 ?auto_844075 ) ) ( not ( = ?auto_844063 ?auto_844064 ) ) ( not ( = ?auto_844063 ?auto_844065 ) ) ( not ( = ?auto_844063 ?auto_844066 ) ) ( not ( = ?auto_844063 ?auto_844067 ) ) ( not ( = ?auto_844063 ?auto_844068 ) ) ( not ( = ?auto_844063 ?auto_844069 ) ) ( not ( = ?auto_844063 ?auto_844070 ) ) ( not ( = ?auto_844063 ?auto_844071 ) ) ( not ( = ?auto_844063 ?auto_844072 ) ) ( not ( = ?auto_844063 ?auto_844073 ) ) ( not ( = ?auto_844063 ?auto_844074 ) ) ( not ( = ?auto_844063 ?auto_844075 ) ) ( not ( = ?auto_844064 ?auto_844065 ) ) ( not ( = ?auto_844064 ?auto_844066 ) ) ( not ( = ?auto_844064 ?auto_844067 ) ) ( not ( = ?auto_844064 ?auto_844068 ) ) ( not ( = ?auto_844064 ?auto_844069 ) ) ( not ( = ?auto_844064 ?auto_844070 ) ) ( not ( = ?auto_844064 ?auto_844071 ) ) ( not ( = ?auto_844064 ?auto_844072 ) ) ( not ( = ?auto_844064 ?auto_844073 ) ) ( not ( = ?auto_844064 ?auto_844074 ) ) ( not ( = ?auto_844064 ?auto_844075 ) ) ( not ( = ?auto_844065 ?auto_844066 ) ) ( not ( = ?auto_844065 ?auto_844067 ) ) ( not ( = ?auto_844065 ?auto_844068 ) ) ( not ( = ?auto_844065 ?auto_844069 ) ) ( not ( = ?auto_844065 ?auto_844070 ) ) ( not ( = ?auto_844065 ?auto_844071 ) ) ( not ( = ?auto_844065 ?auto_844072 ) ) ( not ( = ?auto_844065 ?auto_844073 ) ) ( not ( = ?auto_844065 ?auto_844074 ) ) ( not ( = ?auto_844065 ?auto_844075 ) ) ( not ( = ?auto_844066 ?auto_844067 ) ) ( not ( = ?auto_844066 ?auto_844068 ) ) ( not ( = ?auto_844066 ?auto_844069 ) ) ( not ( = ?auto_844066 ?auto_844070 ) ) ( not ( = ?auto_844066 ?auto_844071 ) ) ( not ( = ?auto_844066 ?auto_844072 ) ) ( not ( = ?auto_844066 ?auto_844073 ) ) ( not ( = ?auto_844066 ?auto_844074 ) ) ( not ( = ?auto_844066 ?auto_844075 ) ) ( not ( = ?auto_844067 ?auto_844068 ) ) ( not ( = ?auto_844067 ?auto_844069 ) ) ( not ( = ?auto_844067 ?auto_844070 ) ) ( not ( = ?auto_844067 ?auto_844071 ) ) ( not ( = ?auto_844067 ?auto_844072 ) ) ( not ( = ?auto_844067 ?auto_844073 ) ) ( not ( = ?auto_844067 ?auto_844074 ) ) ( not ( = ?auto_844067 ?auto_844075 ) ) ( not ( = ?auto_844068 ?auto_844069 ) ) ( not ( = ?auto_844068 ?auto_844070 ) ) ( not ( = ?auto_844068 ?auto_844071 ) ) ( not ( = ?auto_844068 ?auto_844072 ) ) ( not ( = ?auto_844068 ?auto_844073 ) ) ( not ( = ?auto_844068 ?auto_844074 ) ) ( not ( = ?auto_844068 ?auto_844075 ) ) ( not ( = ?auto_844069 ?auto_844070 ) ) ( not ( = ?auto_844069 ?auto_844071 ) ) ( not ( = ?auto_844069 ?auto_844072 ) ) ( not ( = ?auto_844069 ?auto_844073 ) ) ( not ( = ?auto_844069 ?auto_844074 ) ) ( not ( = ?auto_844069 ?auto_844075 ) ) ( not ( = ?auto_844070 ?auto_844071 ) ) ( not ( = ?auto_844070 ?auto_844072 ) ) ( not ( = ?auto_844070 ?auto_844073 ) ) ( not ( = ?auto_844070 ?auto_844074 ) ) ( not ( = ?auto_844070 ?auto_844075 ) ) ( not ( = ?auto_844071 ?auto_844072 ) ) ( not ( = ?auto_844071 ?auto_844073 ) ) ( not ( = ?auto_844071 ?auto_844074 ) ) ( not ( = ?auto_844071 ?auto_844075 ) ) ( not ( = ?auto_844072 ?auto_844073 ) ) ( not ( = ?auto_844072 ?auto_844074 ) ) ( not ( = ?auto_844072 ?auto_844075 ) ) ( not ( = ?auto_844073 ?auto_844074 ) ) ( not ( = ?auto_844073 ?auto_844075 ) ) ( not ( = ?auto_844074 ?auto_844075 ) ) ( ON ?auto_844073 ?auto_844074 ) ( CLEAR ?auto_844071 ) ( ON ?auto_844072 ?auto_844073 ) ( CLEAR ?auto_844072 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-16PILE ?auto_844057 ?auto_844058 ?auto_844059 ?auto_844060 ?auto_844061 ?auto_844062 ?auto_844063 ?auto_844064 ?auto_844065 ?auto_844066 ?auto_844067 ?auto_844068 ?auto_844069 ?auto_844070 ?auto_844071 ?auto_844072 )
      ( MAKE-18PILE ?auto_844057 ?auto_844058 ?auto_844059 ?auto_844060 ?auto_844061 ?auto_844062 ?auto_844063 ?auto_844064 ?auto_844065 ?auto_844066 ?auto_844067 ?auto_844068 ?auto_844069 ?auto_844070 ?auto_844071 ?auto_844072 ?auto_844073 ?auto_844074 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_844094 - BLOCK
      ?auto_844095 - BLOCK
      ?auto_844096 - BLOCK
      ?auto_844097 - BLOCK
      ?auto_844098 - BLOCK
      ?auto_844099 - BLOCK
      ?auto_844100 - BLOCK
      ?auto_844101 - BLOCK
      ?auto_844102 - BLOCK
      ?auto_844103 - BLOCK
      ?auto_844104 - BLOCK
      ?auto_844105 - BLOCK
      ?auto_844106 - BLOCK
      ?auto_844107 - BLOCK
      ?auto_844108 - BLOCK
      ?auto_844109 - BLOCK
      ?auto_844110 - BLOCK
      ?auto_844111 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_844111 ) ( ON-TABLE ?auto_844094 ) ( ON ?auto_844095 ?auto_844094 ) ( ON ?auto_844096 ?auto_844095 ) ( ON ?auto_844097 ?auto_844096 ) ( ON ?auto_844098 ?auto_844097 ) ( ON ?auto_844099 ?auto_844098 ) ( ON ?auto_844100 ?auto_844099 ) ( ON ?auto_844101 ?auto_844100 ) ( ON ?auto_844102 ?auto_844101 ) ( ON ?auto_844103 ?auto_844102 ) ( ON ?auto_844104 ?auto_844103 ) ( ON ?auto_844105 ?auto_844104 ) ( ON ?auto_844106 ?auto_844105 ) ( ON ?auto_844107 ?auto_844106 ) ( ON ?auto_844108 ?auto_844107 ) ( not ( = ?auto_844094 ?auto_844095 ) ) ( not ( = ?auto_844094 ?auto_844096 ) ) ( not ( = ?auto_844094 ?auto_844097 ) ) ( not ( = ?auto_844094 ?auto_844098 ) ) ( not ( = ?auto_844094 ?auto_844099 ) ) ( not ( = ?auto_844094 ?auto_844100 ) ) ( not ( = ?auto_844094 ?auto_844101 ) ) ( not ( = ?auto_844094 ?auto_844102 ) ) ( not ( = ?auto_844094 ?auto_844103 ) ) ( not ( = ?auto_844094 ?auto_844104 ) ) ( not ( = ?auto_844094 ?auto_844105 ) ) ( not ( = ?auto_844094 ?auto_844106 ) ) ( not ( = ?auto_844094 ?auto_844107 ) ) ( not ( = ?auto_844094 ?auto_844108 ) ) ( not ( = ?auto_844094 ?auto_844109 ) ) ( not ( = ?auto_844094 ?auto_844110 ) ) ( not ( = ?auto_844094 ?auto_844111 ) ) ( not ( = ?auto_844095 ?auto_844096 ) ) ( not ( = ?auto_844095 ?auto_844097 ) ) ( not ( = ?auto_844095 ?auto_844098 ) ) ( not ( = ?auto_844095 ?auto_844099 ) ) ( not ( = ?auto_844095 ?auto_844100 ) ) ( not ( = ?auto_844095 ?auto_844101 ) ) ( not ( = ?auto_844095 ?auto_844102 ) ) ( not ( = ?auto_844095 ?auto_844103 ) ) ( not ( = ?auto_844095 ?auto_844104 ) ) ( not ( = ?auto_844095 ?auto_844105 ) ) ( not ( = ?auto_844095 ?auto_844106 ) ) ( not ( = ?auto_844095 ?auto_844107 ) ) ( not ( = ?auto_844095 ?auto_844108 ) ) ( not ( = ?auto_844095 ?auto_844109 ) ) ( not ( = ?auto_844095 ?auto_844110 ) ) ( not ( = ?auto_844095 ?auto_844111 ) ) ( not ( = ?auto_844096 ?auto_844097 ) ) ( not ( = ?auto_844096 ?auto_844098 ) ) ( not ( = ?auto_844096 ?auto_844099 ) ) ( not ( = ?auto_844096 ?auto_844100 ) ) ( not ( = ?auto_844096 ?auto_844101 ) ) ( not ( = ?auto_844096 ?auto_844102 ) ) ( not ( = ?auto_844096 ?auto_844103 ) ) ( not ( = ?auto_844096 ?auto_844104 ) ) ( not ( = ?auto_844096 ?auto_844105 ) ) ( not ( = ?auto_844096 ?auto_844106 ) ) ( not ( = ?auto_844096 ?auto_844107 ) ) ( not ( = ?auto_844096 ?auto_844108 ) ) ( not ( = ?auto_844096 ?auto_844109 ) ) ( not ( = ?auto_844096 ?auto_844110 ) ) ( not ( = ?auto_844096 ?auto_844111 ) ) ( not ( = ?auto_844097 ?auto_844098 ) ) ( not ( = ?auto_844097 ?auto_844099 ) ) ( not ( = ?auto_844097 ?auto_844100 ) ) ( not ( = ?auto_844097 ?auto_844101 ) ) ( not ( = ?auto_844097 ?auto_844102 ) ) ( not ( = ?auto_844097 ?auto_844103 ) ) ( not ( = ?auto_844097 ?auto_844104 ) ) ( not ( = ?auto_844097 ?auto_844105 ) ) ( not ( = ?auto_844097 ?auto_844106 ) ) ( not ( = ?auto_844097 ?auto_844107 ) ) ( not ( = ?auto_844097 ?auto_844108 ) ) ( not ( = ?auto_844097 ?auto_844109 ) ) ( not ( = ?auto_844097 ?auto_844110 ) ) ( not ( = ?auto_844097 ?auto_844111 ) ) ( not ( = ?auto_844098 ?auto_844099 ) ) ( not ( = ?auto_844098 ?auto_844100 ) ) ( not ( = ?auto_844098 ?auto_844101 ) ) ( not ( = ?auto_844098 ?auto_844102 ) ) ( not ( = ?auto_844098 ?auto_844103 ) ) ( not ( = ?auto_844098 ?auto_844104 ) ) ( not ( = ?auto_844098 ?auto_844105 ) ) ( not ( = ?auto_844098 ?auto_844106 ) ) ( not ( = ?auto_844098 ?auto_844107 ) ) ( not ( = ?auto_844098 ?auto_844108 ) ) ( not ( = ?auto_844098 ?auto_844109 ) ) ( not ( = ?auto_844098 ?auto_844110 ) ) ( not ( = ?auto_844098 ?auto_844111 ) ) ( not ( = ?auto_844099 ?auto_844100 ) ) ( not ( = ?auto_844099 ?auto_844101 ) ) ( not ( = ?auto_844099 ?auto_844102 ) ) ( not ( = ?auto_844099 ?auto_844103 ) ) ( not ( = ?auto_844099 ?auto_844104 ) ) ( not ( = ?auto_844099 ?auto_844105 ) ) ( not ( = ?auto_844099 ?auto_844106 ) ) ( not ( = ?auto_844099 ?auto_844107 ) ) ( not ( = ?auto_844099 ?auto_844108 ) ) ( not ( = ?auto_844099 ?auto_844109 ) ) ( not ( = ?auto_844099 ?auto_844110 ) ) ( not ( = ?auto_844099 ?auto_844111 ) ) ( not ( = ?auto_844100 ?auto_844101 ) ) ( not ( = ?auto_844100 ?auto_844102 ) ) ( not ( = ?auto_844100 ?auto_844103 ) ) ( not ( = ?auto_844100 ?auto_844104 ) ) ( not ( = ?auto_844100 ?auto_844105 ) ) ( not ( = ?auto_844100 ?auto_844106 ) ) ( not ( = ?auto_844100 ?auto_844107 ) ) ( not ( = ?auto_844100 ?auto_844108 ) ) ( not ( = ?auto_844100 ?auto_844109 ) ) ( not ( = ?auto_844100 ?auto_844110 ) ) ( not ( = ?auto_844100 ?auto_844111 ) ) ( not ( = ?auto_844101 ?auto_844102 ) ) ( not ( = ?auto_844101 ?auto_844103 ) ) ( not ( = ?auto_844101 ?auto_844104 ) ) ( not ( = ?auto_844101 ?auto_844105 ) ) ( not ( = ?auto_844101 ?auto_844106 ) ) ( not ( = ?auto_844101 ?auto_844107 ) ) ( not ( = ?auto_844101 ?auto_844108 ) ) ( not ( = ?auto_844101 ?auto_844109 ) ) ( not ( = ?auto_844101 ?auto_844110 ) ) ( not ( = ?auto_844101 ?auto_844111 ) ) ( not ( = ?auto_844102 ?auto_844103 ) ) ( not ( = ?auto_844102 ?auto_844104 ) ) ( not ( = ?auto_844102 ?auto_844105 ) ) ( not ( = ?auto_844102 ?auto_844106 ) ) ( not ( = ?auto_844102 ?auto_844107 ) ) ( not ( = ?auto_844102 ?auto_844108 ) ) ( not ( = ?auto_844102 ?auto_844109 ) ) ( not ( = ?auto_844102 ?auto_844110 ) ) ( not ( = ?auto_844102 ?auto_844111 ) ) ( not ( = ?auto_844103 ?auto_844104 ) ) ( not ( = ?auto_844103 ?auto_844105 ) ) ( not ( = ?auto_844103 ?auto_844106 ) ) ( not ( = ?auto_844103 ?auto_844107 ) ) ( not ( = ?auto_844103 ?auto_844108 ) ) ( not ( = ?auto_844103 ?auto_844109 ) ) ( not ( = ?auto_844103 ?auto_844110 ) ) ( not ( = ?auto_844103 ?auto_844111 ) ) ( not ( = ?auto_844104 ?auto_844105 ) ) ( not ( = ?auto_844104 ?auto_844106 ) ) ( not ( = ?auto_844104 ?auto_844107 ) ) ( not ( = ?auto_844104 ?auto_844108 ) ) ( not ( = ?auto_844104 ?auto_844109 ) ) ( not ( = ?auto_844104 ?auto_844110 ) ) ( not ( = ?auto_844104 ?auto_844111 ) ) ( not ( = ?auto_844105 ?auto_844106 ) ) ( not ( = ?auto_844105 ?auto_844107 ) ) ( not ( = ?auto_844105 ?auto_844108 ) ) ( not ( = ?auto_844105 ?auto_844109 ) ) ( not ( = ?auto_844105 ?auto_844110 ) ) ( not ( = ?auto_844105 ?auto_844111 ) ) ( not ( = ?auto_844106 ?auto_844107 ) ) ( not ( = ?auto_844106 ?auto_844108 ) ) ( not ( = ?auto_844106 ?auto_844109 ) ) ( not ( = ?auto_844106 ?auto_844110 ) ) ( not ( = ?auto_844106 ?auto_844111 ) ) ( not ( = ?auto_844107 ?auto_844108 ) ) ( not ( = ?auto_844107 ?auto_844109 ) ) ( not ( = ?auto_844107 ?auto_844110 ) ) ( not ( = ?auto_844107 ?auto_844111 ) ) ( not ( = ?auto_844108 ?auto_844109 ) ) ( not ( = ?auto_844108 ?auto_844110 ) ) ( not ( = ?auto_844108 ?auto_844111 ) ) ( not ( = ?auto_844109 ?auto_844110 ) ) ( not ( = ?auto_844109 ?auto_844111 ) ) ( not ( = ?auto_844110 ?auto_844111 ) ) ( ON ?auto_844110 ?auto_844111 ) ( CLEAR ?auto_844108 ) ( ON ?auto_844109 ?auto_844110 ) ( CLEAR ?auto_844109 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-16PILE ?auto_844094 ?auto_844095 ?auto_844096 ?auto_844097 ?auto_844098 ?auto_844099 ?auto_844100 ?auto_844101 ?auto_844102 ?auto_844103 ?auto_844104 ?auto_844105 ?auto_844106 ?auto_844107 ?auto_844108 ?auto_844109 )
      ( MAKE-18PILE ?auto_844094 ?auto_844095 ?auto_844096 ?auto_844097 ?auto_844098 ?auto_844099 ?auto_844100 ?auto_844101 ?auto_844102 ?auto_844103 ?auto_844104 ?auto_844105 ?auto_844106 ?auto_844107 ?auto_844108 ?auto_844109 ?auto_844110 ?auto_844111 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_844130 - BLOCK
      ?auto_844131 - BLOCK
      ?auto_844132 - BLOCK
      ?auto_844133 - BLOCK
      ?auto_844134 - BLOCK
      ?auto_844135 - BLOCK
      ?auto_844136 - BLOCK
      ?auto_844137 - BLOCK
      ?auto_844138 - BLOCK
      ?auto_844139 - BLOCK
      ?auto_844140 - BLOCK
      ?auto_844141 - BLOCK
      ?auto_844142 - BLOCK
      ?auto_844143 - BLOCK
      ?auto_844144 - BLOCK
      ?auto_844145 - BLOCK
      ?auto_844146 - BLOCK
      ?auto_844147 - BLOCK
    )
    :vars
    (
      ?auto_844148 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_844147 ?auto_844148 ) ( ON-TABLE ?auto_844130 ) ( ON ?auto_844131 ?auto_844130 ) ( ON ?auto_844132 ?auto_844131 ) ( ON ?auto_844133 ?auto_844132 ) ( ON ?auto_844134 ?auto_844133 ) ( ON ?auto_844135 ?auto_844134 ) ( ON ?auto_844136 ?auto_844135 ) ( ON ?auto_844137 ?auto_844136 ) ( ON ?auto_844138 ?auto_844137 ) ( ON ?auto_844139 ?auto_844138 ) ( ON ?auto_844140 ?auto_844139 ) ( ON ?auto_844141 ?auto_844140 ) ( ON ?auto_844142 ?auto_844141 ) ( ON ?auto_844143 ?auto_844142 ) ( not ( = ?auto_844130 ?auto_844131 ) ) ( not ( = ?auto_844130 ?auto_844132 ) ) ( not ( = ?auto_844130 ?auto_844133 ) ) ( not ( = ?auto_844130 ?auto_844134 ) ) ( not ( = ?auto_844130 ?auto_844135 ) ) ( not ( = ?auto_844130 ?auto_844136 ) ) ( not ( = ?auto_844130 ?auto_844137 ) ) ( not ( = ?auto_844130 ?auto_844138 ) ) ( not ( = ?auto_844130 ?auto_844139 ) ) ( not ( = ?auto_844130 ?auto_844140 ) ) ( not ( = ?auto_844130 ?auto_844141 ) ) ( not ( = ?auto_844130 ?auto_844142 ) ) ( not ( = ?auto_844130 ?auto_844143 ) ) ( not ( = ?auto_844130 ?auto_844144 ) ) ( not ( = ?auto_844130 ?auto_844145 ) ) ( not ( = ?auto_844130 ?auto_844146 ) ) ( not ( = ?auto_844130 ?auto_844147 ) ) ( not ( = ?auto_844130 ?auto_844148 ) ) ( not ( = ?auto_844131 ?auto_844132 ) ) ( not ( = ?auto_844131 ?auto_844133 ) ) ( not ( = ?auto_844131 ?auto_844134 ) ) ( not ( = ?auto_844131 ?auto_844135 ) ) ( not ( = ?auto_844131 ?auto_844136 ) ) ( not ( = ?auto_844131 ?auto_844137 ) ) ( not ( = ?auto_844131 ?auto_844138 ) ) ( not ( = ?auto_844131 ?auto_844139 ) ) ( not ( = ?auto_844131 ?auto_844140 ) ) ( not ( = ?auto_844131 ?auto_844141 ) ) ( not ( = ?auto_844131 ?auto_844142 ) ) ( not ( = ?auto_844131 ?auto_844143 ) ) ( not ( = ?auto_844131 ?auto_844144 ) ) ( not ( = ?auto_844131 ?auto_844145 ) ) ( not ( = ?auto_844131 ?auto_844146 ) ) ( not ( = ?auto_844131 ?auto_844147 ) ) ( not ( = ?auto_844131 ?auto_844148 ) ) ( not ( = ?auto_844132 ?auto_844133 ) ) ( not ( = ?auto_844132 ?auto_844134 ) ) ( not ( = ?auto_844132 ?auto_844135 ) ) ( not ( = ?auto_844132 ?auto_844136 ) ) ( not ( = ?auto_844132 ?auto_844137 ) ) ( not ( = ?auto_844132 ?auto_844138 ) ) ( not ( = ?auto_844132 ?auto_844139 ) ) ( not ( = ?auto_844132 ?auto_844140 ) ) ( not ( = ?auto_844132 ?auto_844141 ) ) ( not ( = ?auto_844132 ?auto_844142 ) ) ( not ( = ?auto_844132 ?auto_844143 ) ) ( not ( = ?auto_844132 ?auto_844144 ) ) ( not ( = ?auto_844132 ?auto_844145 ) ) ( not ( = ?auto_844132 ?auto_844146 ) ) ( not ( = ?auto_844132 ?auto_844147 ) ) ( not ( = ?auto_844132 ?auto_844148 ) ) ( not ( = ?auto_844133 ?auto_844134 ) ) ( not ( = ?auto_844133 ?auto_844135 ) ) ( not ( = ?auto_844133 ?auto_844136 ) ) ( not ( = ?auto_844133 ?auto_844137 ) ) ( not ( = ?auto_844133 ?auto_844138 ) ) ( not ( = ?auto_844133 ?auto_844139 ) ) ( not ( = ?auto_844133 ?auto_844140 ) ) ( not ( = ?auto_844133 ?auto_844141 ) ) ( not ( = ?auto_844133 ?auto_844142 ) ) ( not ( = ?auto_844133 ?auto_844143 ) ) ( not ( = ?auto_844133 ?auto_844144 ) ) ( not ( = ?auto_844133 ?auto_844145 ) ) ( not ( = ?auto_844133 ?auto_844146 ) ) ( not ( = ?auto_844133 ?auto_844147 ) ) ( not ( = ?auto_844133 ?auto_844148 ) ) ( not ( = ?auto_844134 ?auto_844135 ) ) ( not ( = ?auto_844134 ?auto_844136 ) ) ( not ( = ?auto_844134 ?auto_844137 ) ) ( not ( = ?auto_844134 ?auto_844138 ) ) ( not ( = ?auto_844134 ?auto_844139 ) ) ( not ( = ?auto_844134 ?auto_844140 ) ) ( not ( = ?auto_844134 ?auto_844141 ) ) ( not ( = ?auto_844134 ?auto_844142 ) ) ( not ( = ?auto_844134 ?auto_844143 ) ) ( not ( = ?auto_844134 ?auto_844144 ) ) ( not ( = ?auto_844134 ?auto_844145 ) ) ( not ( = ?auto_844134 ?auto_844146 ) ) ( not ( = ?auto_844134 ?auto_844147 ) ) ( not ( = ?auto_844134 ?auto_844148 ) ) ( not ( = ?auto_844135 ?auto_844136 ) ) ( not ( = ?auto_844135 ?auto_844137 ) ) ( not ( = ?auto_844135 ?auto_844138 ) ) ( not ( = ?auto_844135 ?auto_844139 ) ) ( not ( = ?auto_844135 ?auto_844140 ) ) ( not ( = ?auto_844135 ?auto_844141 ) ) ( not ( = ?auto_844135 ?auto_844142 ) ) ( not ( = ?auto_844135 ?auto_844143 ) ) ( not ( = ?auto_844135 ?auto_844144 ) ) ( not ( = ?auto_844135 ?auto_844145 ) ) ( not ( = ?auto_844135 ?auto_844146 ) ) ( not ( = ?auto_844135 ?auto_844147 ) ) ( not ( = ?auto_844135 ?auto_844148 ) ) ( not ( = ?auto_844136 ?auto_844137 ) ) ( not ( = ?auto_844136 ?auto_844138 ) ) ( not ( = ?auto_844136 ?auto_844139 ) ) ( not ( = ?auto_844136 ?auto_844140 ) ) ( not ( = ?auto_844136 ?auto_844141 ) ) ( not ( = ?auto_844136 ?auto_844142 ) ) ( not ( = ?auto_844136 ?auto_844143 ) ) ( not ( = ?auto_844136 ?auto_844144 ) ) ( not ( = ?auto_844136 ?auto_844145 ) ) ( not ( = ?auto_844136 ?auto_844146 ) ) ( not ( = ?auto_844136 ?auto_844147 ) ) ( not ( = ?auto_844136 ?auto_844148 ) ) ( not ( = ?auto_844137 ?auto_844138 ) ) ( not ( = ?auto_844137 ?auto_844139 ) ) ( not ( = ?auto_844137 ?auto_844140 ) ) ( not ( = ?auto_844137 ?auto_844141 ) ) ( not ( = ?auto_844137 ?auto_844142 ) ) ( not ( = ?auto_844137 ?auto_844143 ) ) ( not ( = ?auto_844137 ?auto_844144 ) ) ( not ( = ?auto_844137 ?auto_844145 ) ) ( not ( = ?auto_844137 ?auto_844146 ) ) ( not ( = ?auto_844137 ?auto_844147 ) ) ( not ( = ?auto_844137 ?auto_844148 ) ) ( not ( = ?auto_844138 ?auto_844139 ) ) ( not ( = ?auto_844138 ?auto_844140 ) ) ( not ( = ?auto_844138 ?auto_844141 ) ) ( not ( = ?auto_844138 ?auto_844142 ) ) ( not ( = ?auto_844138 ?auto_844143 ) ) ( not ( = ?auto_844138 ?auto_844144 ) ) ( not ( = ?auto_844138 ?auto_844145 ) ) ( not ( = ?auto_844138 ?auto_844146 ) ) ( not ( = ?auto_844138 ?auto_844147 ) ) ( not ( = ?auto_844138 ?auto_844148 ) ) ( not ( = ?auto_844139 ?auto_844140 ) ) ( not ( = ?auto_844139 ?auto_844141 ) ) ( not ( = ?auto_844139 ?auto_844142 ) ) ( not ( = ?auto_844139 ?auto_844143 ) ) ( not ( = ?auto_844139 ?auto_844144 ) ) ( not ( = ?auto_844139 ?auto_844145 ) ) ( not ( = ?auto_844139 ?auto_844146 ) ) ( not ( = ?auto_844139 ?auto_844147 ) ) ( not ( = ?auto_844139 ?auto_844148 ) ) ( not ( = ?auto_844140 ?auto_844141 ) ) ( not ( = ?auto_844140 ?auto_844142 ) ) ( not ( = ?auto_844140 ?auto_844143 ) ) ( not ( = ?auto_844140 ?auto_844144 ) ) ( not ( = ?auto_844140 ?auto_844145 ) ) ( not ( = ?auto_844140 ?auto_844146 ) ) ( not ( = ?auto_844140 ?auto_844147 ) ) ( not ( = ?auto_844140 ?auto_844148 ) ) ( not ( = ?auto_844141 ?auto_844142 ) ) ( not ( = ?auto_844141 ?auto_844143 ) ) ( not ( = ?auto_844141 ?auto_844144 ) ) ( not ( = ?auto_844141 ?auto_844145 ) ) ( not ( = ?auto_844141 ?auto_844146 ) ) ( not ( = ?auto_844141 ?auto_844147 ) ) ( not ( = ?auto_844141 ?auto_844148 ) ) ( not ( = ?auto_844142 ?auto_844143 ) ) ( not ( = ?auto_844142 ?auto_844144 ) ) ( not ( = ?auto_844142 ?auto_844145 ) ) ( not ( = ?auto_844142 ?auto_844146 ) ) ( not ( = ?auto_844142 ?auto_844147 ) ) ( not ( = ?auto_844142 ?auto_844148 ) ) ( not ( = ?auto_844143 ?auto_844144 ) ) ( not ( = ?auto_844143 ?auto_844145 ) ) ( not ( = ?auto_844143 ?auto_844146 ) ) ( not ( = ?auto_844143 ?auto_844147 ) ) ( not ( = ?auto_844143 ?auto_844148 ) ) ( not ( = ?auto_844144 ?auto_844145 ) ) ( not ( = ?auto_844144 ?auto_844146 ) ) ( not ( = ?auto_844144 ?auto_844147 ) ) ( not ( = ?auto_844144 ?auto_844148 ) ) ( not ( = ?auto_844145 ?auto_844146 ) ) ( not ( = ?auto_844145 ?auto_844147 ) ) ( not ( = ?auto_844145 ?auto_844148 ) ) ( not ( = ?auto_844146 ?auto_844147 ) ) ( not ( = ?auto_844146 ?auto_844148 ) ) ( not ( = ?auto_844147 ?auto_844148 ) ) ( ON ?auto_844146 ?auto_844147 ) ( ON ?auto_844145 ?auto_844146 ) ( CLEAR ?auto_844143 ) ( ON ?auto_844144 ?auto_844145 ) ( CLEAR ?auto_844144 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-15PILE ?auto_844130 ?auto_844131 ?auto_844132 ?auto_844133 ?auto_844134 ?auto_844135 ?auto_844136 ?auto_844137 ?auto_844138 ?auto_844139 ?auto_844140 ?auto_844141 ?auto_844142 ?auto_844143 ?auto_844144 )
      ( MAKE-18PILE ?auto_844130 ?auto_844131 ?auto_844132 ?auto_844133 ?auto_844134 ?auto_844135 ?auto_844136 ?auto_844137 ?auto_844138 ?auto_844139 ?auto_844140 ?auto_844141 ?auto_844142 ?auto_844143 ?auto_844144 ?auto_844145 ?auto_844146 ?auto_844147 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_844167 - BLOCK
      ?auto_844168 - BLOCK
      ?auto_844169 - BLOCK
      ?auto_844170 - BLOCK
      ?auto_844171 - BLOCK
      ?auto_844172 - BLOCK
      ?auto_844173 - BLOCK
      ?auto_844174 - BLOCK
      ?auto_844175 - BLOCK
      ?auto_844176 - BLOCK
      ?auto_844177 - BLOCK
      ?auto_844178 - BLOCK
      ?auto_844179 - BLOCK
      ?auto_844180 - BLOCK
      ?auto_844181 - BLOCK
      ?auto_844182 - BLOCK
      ?auto_844183 - BLOCK
      ?auto_844184 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_844184 ) ( ON-TABLE ?auto_844167 ) ( ON ?auto_844168 ?auto_844167 ) ( ON ?auto_844169 ?auto_844168 ) ( ON ?auto_844170 ?auto_844169 ) ( ON ?auto_844171 ?auto_844170 ) ( ON ?auto_844172 ?auto_844171 ) ( ON ?auto_844173 ?auto_844172 ) ( ON ?auto_844174 ?auto_844173 ) ( ON ?auto_844175 ?auto_844174 ) ( ON ?auto_844176 ?auto_844175 ) ( ON ?auto_844177 ?auto_844176 ) ( ON ?auto_844178 ?auto_844177 ) ( ON ?auto_844179 ?auto_844178 ) ( ON ?auto_844180 ?auto_844179 ) ( not ( = ?auto_844167 ?auto_844168 ) ) ( not ( = ?auto_844167 ?auto_844169 ) ) ( not ( = ?auto_844167 ?auto_844170 ) ) ( not ( = ?auto_844167 ?auto_844171 ) ) ( not ( = ?auto_844167 ?auto_844172 ) ) ( not ( = ?auto_844167 ?auto_844173 ) ) ( not ( = ?auto_844167 ?auto_844174 ) ) ( not ( = ?auto_844167 ?auto_844175 ) ) ( not ( = ?auto_844167 ?auto_844176 ) ) ( not ( = ?auto_844167 ?auto_844177 ) ) ( not ( = ?auto_844167 ?auto_844178 ) ) ( not ( = ?auto_844167 ?auto_844179 ) ) ( not ( = ?auto_844167 ?auto_844180 ) ) ( not ( = ?auto_844167 ?auto_844181 ) ) ( not ( = ?auto_844167 ?auto_844182 ) ) ( not ( = ?auto_844167 ?auto_844183 ) ) ( not ( = ?auto_844167 ?auto_844184 ) ) ( not ( = ?auto_844168 ?auto_844169 ) ) ( not ( = ?auto_844168 ?auto_844170 ) ) ( not ( = ?auto_844168 ?auto_844171 ) ) ( not ( = ?auto_844168 ?auto_844172 ) ) ( not ( = ?auto_844168 ?auto_844173 ) ) ( not ( = ?auto_844168 ?auto_844174 ) ) ( not ( = ?auto_844168 ?auto_844175 ) ) ( not ( = ?auto_844168 ?auto_844176 ) ) ( not ( = ?auto_844168 ?auto_844177 ) ) ( not ( = ?auto_844168 ?auto_844178 ) ) ( not ( = ?auto_844168 ?auto_844179 ) ) ( not ( = ?auto_844168 ?auto_844180 ) ) ( not ( = ?auto_844168 ?auto_844181 ) ) ( not ( = ?auto_844168 ?auto_844182 ) ) ( not ( = ?auto_844168 ?auto_844183 ) ) ( not ( = ?auto_844168 ?auto_844184 ) ) ( not ( = ?auto_844169 ?auto_844170 ) ) ( not ( = ?auto_844169 ?auto_844171 ) ) ( not ( = ?auto_844169 ?auto_844172 ) ) ( not ( = ?auto_844169 ?auto_844173 ) ) ( not ( = ?auto_844169 ?auto_844174 ) ) ( not ( = ?auto_844169 ?auto_844175 ) ) ( not ( = ?auto_844169 ?auto_844176 ) ) ( not ( = ?auto_844169 ?auto_844177 ) ) ( not ( = ?auto_844169 ?auto_844178 ) ) ( not ( = ?auto_844169 ?auto_844179 ) ) ( not ( = ?auto_844169 ?auto_844180 ) ) ( not ( = ?auto_844169 ?auto_844181 ) ) ( not ( = ?auto_844169 ?auto_844182 ) ) ( not ( = ?auto_844169 ?auto_844183 ) ) ( not ( = ?auto_844169 ?auto_844184 ) ) ( not ( = ?auto_844170 ?auto_844171 ) ) ( not ( = ?auto_844170 ?auto_844172 ) ) ( not ( = ?auto_844170 ?auto_844173 ) ) ( not ( = ?auto_844170 ?auto_844174 ) ) ( not ( = ?auto_844170 ?auto_844175 ) ) ( not ( = ?auto_844170 ?auto_844176 ) ) ( not ( = ?auto_844170 ?auto_844177 ) ) ( not ( = ?auto_844170 ?auto_844178 ) ) ( not ( = ?auto_844170 ?auto_844179 ) ) ( not ( = ?auto_844170 ?auto_844180 ) ) ( not ( = ?auto_844170 ?auto_844181 ) ) ( not ( = ?auto_844170 ?auto_844182 ) ) ( not ( = ?auto_844170 ?auto_844183 ) ) ( not ( = ?auto_844170 ?auto_844184 ) ) ( not ( = ?auto_844171 ?auto_844172 ) ) ( not ( = ?auto_844171 ?auto_844173 ) ) ( not ( = ?auto_844171 ?auto_844174 ) ) ( not ( = ?auto_844171 ?auto_844175 ) ) ( not ( = ?auto_844171 ?auto_844176 ) ) ( not ( = ?auto_844171 ?auto_844177 ) ) ( not ( = ?auto_844171 ?auto_844178 ) ) ( not ( = ?auto_844171 ?auto_844179 ) ) ( not ( = ?auto_844171 ?auto_844180 ) ) ( not ( = ?auto_844171 ?auto_844181 ) ) ( not ( = ?auto_844171 ?auto_844182 ) ) ( not ( = ?auto_844171 ?auto_844183 ) ) ( not ( = ?auto_844171 ?auto_844184 ) ) ( not ( = ?auto_844172 ?auto_844173 ) ) ( not ( = ?auto_844172 ?auto_844174 ) ) ( not ( = ?auto_844172 ?auto_844175 ) ) ( not ( = ?auto_844172 ?auto_844176 ) ) ( not ( = ?auto_844172 ?auto_844177 ) ) ( not ( = ?auto_844172 ?auto_844178 ) ) ( not ( = ?auto_844172 ?auto_844179 ) ) ( not ( = ?auto_844172 ?auto_844180 ) ) ( not ( = ?auto_844172 ?auto_844181 ) ) ( not ( = ?auto_844172 ?auto_844182 ) ) ( not ( = ?auto_844172 ?auto_844183 ) ) ( not ( = ?auto_844172 ?auto_844184 ) ) ( not ( = ?auto_844173 ?auto_844174 ) ) ( not ( = ?auto_844173 ?auto_844175 ) ) ( not ( = ?auto_844173 ?auto_844176 ) ) ( not ( = ?auto_844173 ?auto_844177 ) ) ( not ( = ?auto_844173 ?auto_844178 ) ) ( not ( = ?auto_844173 ?auto_844179 ) ) ( not ( = ?auto_844173 ?auto_844180 ) ) ( not ( = ?auto_844173 ?auto_844181 ) ) ( not ( = ?auto_844173 ?auto_844182 ) ) ( not ( = ?auto_844173 ?auto_844183 ) ) ( not ( = ?auto_844173 ?auto_844184 ) ) ( not ( = ?auto_844174 ?auto_844175 ) ) ( not ( = ?auto_844174 ?auto_844176 ) ) ( not ( = ?auto_844174 ?auto_844177 ) ) ( not ( = ?auto_844174 ?auto_844178 ) ) ( not ( = ?auto_844174 ?auto_844179 ) ) ( not ( = ?auto_844174 ?auto_844180 ) ) ( not ( = ?auto_844174 ?auto_844181 ) ) ( not ( = ?auto_844174 ?auto_844182 ) ) ( not ( = ?auto_844174 ?auto_844183 ) ) ( not ( = ?auto_844174 ?auto_844184 ) ) ( not ( = ?auto_844175 ?auto_844176 ) ) ( not ( = ?auto_844175 ?auto_844177 ) ) ( not ( = ?auto_844175 ?auto_844178 ) ) ( not ( = ?auto_844175 ?auto_844179 ) ) ( not ( = ?auto_844175 ?auto_844180 ) ) ( not ( = ?auto_844175 ?auto_844181 ) ) ( not ( = ?auto_844175 ?auto_844182 ) ) ( not ( = ?auto_844175 ?auto_844183 ) ) ( not ( = ?auto_844175 ?auto_844184 ) ) ( not ( = ?auto_844176 ?auto_844177 ) ) ( not ( = ?auto_844176 ?auto_844178 ) ) ( not ( = ?auto_844176 ?auto_844179 ) ) ( not ( = ?auto_844176 ?auto_844180 ) ) ( not ( = ?auto_844176 ?auto_844181 ) ) ( not ( = ?auto_844176 ?auto_844182 ) ) ( not ( = ?auto_844176 ?auto_844183 ) ) ( not ( = ?auto_844176 ?auto_844184 ) ) ( not ( = ?auto_844177 ?auto_844178 ) ) ( not ( = ?auto_844177 ?auto_844179 ) ) ( not ( = ?auto_844177 ?auto_844180 ) ) ( not ( = ?auto_844177 ?auto_844181 ) ) ( not ( = ?auto_844177 ?auto_844182 ) ) ( not ( = ?auto_844177 ?auto_844183 ) ) ( not ( = ?auto_844177 ?auto_844184 ) ) ( not ( = ?auto_844178 ?auto_844179 ) ) ( not ( = ?auto_844178 ?auto_844180 ) ) ( not ( = ?auto_844178 ?auto_844181 ) ) ( not ( = ?auto_844178 ?auto_844182 ) ) ( not ( = ?auto_844178 ?auto_844183 ) ) ( not ( = ?auto_844178 ?auto_844184 ) ) ( not ( = ?auto_844179 ?auto_844180 ) ) ( not ( = ?auto_844179 ?auto_844181 ) ) ( not ( = ?auto_844179 ?auto_844182 ) ) ( not ( = ?auto_844179 ?auto_844183 ) ) ( not ( = ?auto_844179 ?auto_844184 ) ) ( not ( = ?auto_844180 ?auto_844181 ) ) ( not ( = ?auto_844180 ?auto_844182 ) ) ( not ( = ?auto_844180 ?auto_844183 ) ) ( not ( = ?auto_844180 ?auto_844184 ) ) ( not ( = ?auto_844181 ?auto_844182 ) ) ( not ( = ?auto_844181 ?auto_844183 ) ) ( not ( = ?auto_844181 ?auto_844184 ) ) ( not ( = ?auto_844182 ?auto_844183 ) ) ( not ( = ?auto_844182 ?auto_844184 ) ) ( not ( = ?auto_844183 ?auto_844184 ) ) ( ON ?auto_844183 ?auto_844184 ) ( ON ?auto_844182 ?auto_844183 ) ( CLEAR ?auto_844180 ) ( ON ?auto_844181 ?auto_844182 ) ( CLEAR ?auto_844181 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-15PILE ?auto_844167 ?auto_844168 ?auto_844169 ?auto_844170 ?auto_844171 ?auto_844172 ?auto_844173 ?auto_844174 ?auto_844175 ?auto_844176 ?auto_844177 ?auto_844178 ?auto_844179 ?auto_844180 ?auto_844181 )
      ( MAKE-18PILE ?auto_844167 ?auto_844168 ?auto_844169 ?auto_844170 ?auto_844171 ?auto_844172 ?auto_844173 ?auto_844174 ?auto_844175 ?auto_844176 ?auto_844177 ?auto_844178 ?auto_844179 ?auto_844180 ?auto_844181 ?auto_844182 ?auto_844183 ?auto_844184 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_844203 - BLOCK
      ?auto_844204 - BLOCK
      ?auto_844205 - BLOCK
      ?auto_844206 - BLOCK
      ?auto_844207 - BLOCK
      ?auto_844208 - BLOCK
      ?auto_844209 - BLOCK
      ?auto_844210 - BLOCK
      ?auto_844211 - BLOCK
      ?auto_844212 - BLOCK
      ?auto_844213 - BLOCK
      ?auto_844214 - BLOCK
      ?auto_844215 - BLOCK
      ?auto_844216 - BLOCK
      ?auto_844217 - BLOCK
      ?auto_844218 - BLOCK
      ?auto_844219 - BLOCK
      ?auto_844220 - BLOCK
    )
    :vars
    (
      ?auto_844221 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_844220 ?auto_844221 ) ( ON-TABLE ?auto_844203 ) ( ON ?auto_844204 ?auto_844203 ) ( ON ?auto_844205 ?auto_844204 ) ( ON ?auto_844206 ?auto_844205 ) ( ON ?auto_844207 ?auto_844206 ) ( ON ?auto_844208 ?auto_844207 ) ( ON ?auto_844209 ?auto_844208 ) ( ON ?auto_844210 ?auto_844209 ) ( ON ?auto_844211 ?auto_844210 ) ( ON ?auto_844212 ?auto_844211 ) ( ON ?auto_844213 ?auto_844212 ) ( ON ?auto_844214 ?auto_844213 ) ( ON ?auto_844215 ?auto_844214 ) ( not ( = ?auto_844203 ?auto_844204 ) ) ( not ( = ?auto_844203 ?auto_844205 ) ) ( not ( = ?auto_844203 ?auto_844206 ) ) ( not ( = ?auto_844203 ?auto_844207 ) ) ( not ( = ?auto_844203 ?auto_844208 ) ) ( not ( = ?auto_844203 ?auto_844209 ) ) ( not ( = ?auto_844203 ?auto_844210 ) ) ( not ( = ?auto_844203 ?auto_844211 ) ) ( not ( = ?auto_844203 ?auto_844212 ) ) ( not ( = ?auto_844203 ?auto_844213 ) ) ( not ( = ?auto_844203 ?auto_844214 ) ) ( not ( = ?auto_844203 ?auto_844215 ) ) ( not ( = ?auto_844203 ?auto_844216 ) ) ( not ( = ?auto_844203 ?auto_844217 ) ) ( not ( = ?auto_844203 ?auto_844218 ) ) ( not ( = ?auto_844203 ?auto_844219 ) ) ( not ( = ?auto_844203 ?auto_844220 ) ) ( not ( = ?auto_844203 ?auto_844221 ) ) ( not ( = ?auto_844204 ?auto_844205 ) ) ( not ( = ?auto_844204 ?auto_844206 ) ) ( not ( = ?auto_844204 ?auto_844207 ) ) ( not ( = ?auto_844204 ?auto_844208 ) ) ( not ( = ?auto_844204 ?auto_844209 ) ) ( not ( = ?auto_844204 ?auto_844210 ) ) ( not ( = ?auto_844204 ?auto_844211 ) ) ( not ( = ?auto_844204 ?auto_844212 ) ) ( not ( = ?auto_844204 ?auto_844213 ) ) ( not ( = ?auto_844204 ?auto_844214 ) ) ( not ( = ?auto_844204 ?auto_844215 ) ) ( not ( = ?auto_844204 ?auto_844216 ) ) ( not ( = ?auto_844204 ?auto_844217 ) ) ( not ( = ?auto_844204 ?auto_844218 ) ) ( not ( = ?auto_844204 ?auto_844219 ) ) ( not ( = ?auto_844204 ?auto_844220 ) ) ( not ( = ?auto_844204 ?auto_844221 ) ) ( not ( = ?auto_844205 ?auto_844206 ) ) ( not ( = ?auto_844205 ?auto_844207 ) ) ( not ( = ?auto_844205 ?auto_844208 ) ) ( not ( = ?auto_844205 ?auto_844209 ) ) ( not ( = ?auto_844205 ?auto_844210 ) ) ( not ( = ?auto_844205 ?auto_844211 ) ) ( not ( = ?auto_844205 ?auto_844212 ) ) ( not ( = ?auto_844205 ?auto_844213 ) ) ( not ( = ?auto_844205 ?auto_844214 ) ) ( not ( = ?auto_844205 ?auto_844215 ) ) ( not ( = ?auto_844205 ?auto_844216 ) ) ( not ( = ?auto_844205 ?auto_844217 ) ) ( not ( = ?auto_844205 ?auto_844218 ) ) ( not ( = ?auto_844205 ?auto_844219 ) ) ( not ( = ?auto_844205 ?auto_844220 ) ) ( not ( = ?auto_844205 ?auto_844221 ) ) ( not ( = ?auto_844206 ?auto_844207 ) ) ( not ( = ?auto_844206 ?auto_844208 ) ) ( not ( = ?auto_844206 ?auto_844209 ) ) ( not ( = ?auto_844206 ?auto_844210 ) ) ( not ( = ?auto_844206 ?auto_844211 ) ) ( not ( = ?auto_844206 ?auto_844212 ) ) ( not ( = ?auto_844206 ?auto_844213 ) ) ( not ( = ?auto_844206 ?auto_844214 ) ) ( not ( = ?auto_844206 ?auto_844215 ) ) ( not ( = ?auto_844206 ?auto_844216 ) ) ( not ( = ?auto_844206 ?auto_844217 ) ) ( not ( = ?auto_844206 ?auto_844218 ) ) ( not ( = ?auto_844206 ?auto_844219 ) ) ( not ( = ?auto_844206 ?auto_844220 ) ) ( not ( = ?auto_844206 ?auto_844221 ) ) ( not ( = ?auto_844207 ?auto_844208 ) ) ( not ( = ?auto_844207 ?auto_844209 ) ) ( not ( = ?auto_844207 ?auto_844210 ) ) ( not ( = ?auto_844207 ?auto_844211 ) ) ( not ( = ?auto_844207 ?auto_844212 ) ) ( not ( = ?auto_844207 ?auto_844213 ) ) ( not ( = ?auto_844207 ?auto_844214 ) ) ( not ( = ?auto_844207 ?auto_844215 ) ) ( not ( = ?auto_844207 ?auto_844216 ) ) ( not ( = ?auto_844207 ?auto_844217 ) ) ( not ( = ?auto_844207 ?auto_844218 ) ) ( not ( = ?auto_844207 ?auto_844219 ) ) ( not ( = ?auto_844207 ?auto_844220 ) ) ( not ( = ?auto_844207 ?auto_844221 ) ) ( not ( = ?auto_844208 ?auto_844209 ) ) ( not ( = ?auto_844208 ?auto_844210 ) ) ( not ( = ?auto_844208 ?auto_844211 ) ) ( not ( = ?auto_844208 ?auto_844212 ) ) ( not ( = ?auto_844208 ?auto_844213 ) ) ( not ( = ?auto_844208 ?auto_844214 ) ) ( not ( = ?auto_844208 ?auto_844215 ) ) ( not ( = ?auto_844208 ?auto_844216 ) ) ( not ( = ?auto_844208 ?auto_844217 ) ) ( not ( = ?auto_844208 ?auto_844218 ) ) ( not ( = ?auto_844208 ?auto_844219 ) ) ( not ( = ?auto_844208 ?auto_844220 ) ) ( not ( = ?auto_844208 ?auto_844221 ) ) ( not ( = ?auto_844209 ?auto_844210 ) ) ( not ( = ?auto_844209 ?auto_844211 ) ) ( not ( = ?auto_844209 ?auto_844212 ) ) ( not ( = ?auto_844209 ?auto_844213 ) ) ( not ( = ?auto_844209 ?auto_844214 ) ) ( not ( = ?auto_844209 ?auto_844215 ) ) ( not ( = ?auto_844209 ?auto_844216 ) ) ( not ( = ?auto_844209 ?auto_844217 ) ) ( not ( = ?auto_844209 ?auto_844218 ) ) ( not ( = ?auto_844209 ?auto_844219 ) ) ( not ( = ?auto_844209 ?auto_844220 ) ) ( not ( = ?auto_844209 ?auto_844221 ) ) ( not ( = ?auto_844210 ?auto_844211 ) ) ( not ( = ?auto_844210 ?auto_844212 ) ) ( not ( = ?auto_844210 ?auto_844213 ) ) ( not ( = ?auto_844210 ?auto_844214 ) ) ( not ( = ?auto_844210 ?auto_844215 ) ) ( not ( = ?auto_844210 ?auto_844216 ) ) ( not ( = ?auto_844210 ?auto_844217 ) ) ( not ( = ?auto_844210 ?auto_844218 ) ) ( not ( = ?auto_844210 ?auto_844219 ) ) ( not ( = ?auto_844210 ?auto_844220 ) ) ( not ( = ?auto_844210 ?auto_844221 ) ) ( not ( = ?auto_844211 ?auto_844212 ) ) ( not ( = ?auto_844211 ?auto_844213 ) ) ( not ( = ?auto_844211 ?auto_844214 ) ) ( not ( = ?auto_844211 ?auto_844215 ) ) ( not ( = ?auto_844211 ?auto_844216 ) ) ( not ( = ?auto_844211 ?auto_844217 ) ) ( not ( = ?auto_844211 ?auto_844218 ) ) ( not ( = ?auto_844211 ?auto_844219 ) ) ( not ( = ?auto_844211 ?auto_844220 ) ) ( not ( = ?auto_844211 ?auto_844221 ) ) ( not ( = ?auto_844212 ?auto_844213 ) ) ( not ( = ?auto_844212 ?auto_844214 ) ) ( not ( = ?auto_844212 ?auto_844215 ) ) ( not ( = ?auto_844212 ?auto_844216 ) ) ( not ( = ?auto_844212 ?auto_844217 ) ) ( not ( = ?auto_844212 ?auto_844218 ) ) ( not ( = ?auto_844212 ?auto_844219 ) ) ( not ( = ?auto_844212 ?auto_844220 ) ) ( not ( = ?auto_844212 ?auto_844221 ) ) ( not ( = ?auto_844213 ?auto_844214 ) ) ( not ( = ?auto_844213 ?auto_844215 ) ) ( not ( = ?auto_844213 ?auto_844216 ) ) ( not ( = ?auto_844213 ?auto_844217 ) ) ( not ( = ?auto_844213 ?auto_844218 ) ) ( not ( = ?auto_844213 ?auto_844219 ) ) ( not ( = ?auto_844213 ?auto_844220 ) ) ( not ( = ?auto_844213 ?auto_844221 ) ) ( not ( = ?auto_844214 ?auto_844215 ) ) ( not ( = ?auto_844214 ?auto_844216 ) ) ( not ( = ?auto_844214 ?auto_844217 ) ) ( not ( = ?auto_844214 ?auto_844218 ) ) ( not ( = ?auto_844214 ?auto_844219 ) ) ( not ( = ?auto_844214 ?auto_844220 ) ) ( not ( = ?auto_844214 ?auto_844221 ) ) ( not ( = ?auto_844215 ?auto_844216 ) ) ( not ( = ?auto_844215 ?auto_844217 ) ) ( not ( = ?auto_844215 ?auto_844218 ) ) ( not ( = ?auto_844215 ?auto_844219 ) ) ( not ( = ?auto_844215 ?auto_844220 ) ) ( not ( = ?auto_844215 ?auto_844221 ) ) ( not ( = ?auto_844216 ?auto_844217 ) ) ( not ( = ?auto_844216 ?auto_844218 ) ) ( not ( = ?auto_844216 ?auto_844219 ) ) ( not ( = ?auto_844216 ?auto_844220 ) ) ( not ( = ?auto_844216 ?auto_844221 ) ) ( not ( = ?auto_844217 ?auto_844218 ) ) ( not ( = ?auto_844217 ?auto_844219 ) ) ( not ( = ?auto_844217 ?auto_844220 ) ) ( not ( = ?auto_844217 ?auto_844221 ) ) ( not ( = ?auto_844218 ?auto_844219 ) ) ( not ( = ?auto_844218 ?auto_844220 ) ) ( not ( = ?auto_844218 ?auto_844221 ) ) ( not ( = ?auto_844219 ?auto_844220 ) ) ( not ( = ?auto_844219 ?auto_844221 ) ) ( not ( = ?auto_844220 ?auto_844221 ) ) ( ON ?auto_844219 ?auto_844220 ) ( ON ?auto_844218 ?auto_844219 ) ( ON ?auto_844217 ?auto_844218 ) ( CLEAR ?auto_844215 ) ( ON ?auto_844216 ?auto_844217 ) ( CLEAR ?auto_844216 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_844203 ?auto_844204 ?auto_844205 ?auto_844206 ?auto_844207 ?auto_844208 ?auto_844209 ?auto_844210 ?auto_844211 ?auto_844212 ?auto_844213 ?auto_844214 ?auto_844215 ?auto_844216 )
      ( MAKE-18PILE ?auto_844203 ?auto_844204 ?auto_844205 ?auto_844206 ?auto_844207 ?auto_844208 ?auto_844209 ?auto_844210 ?auto_844211 ?auto_844212 ?auto_844213 ?auto_844214 ?auto_844215 ?auto_844216 ?auto_844217 ?auto_844218 ?auto_844219 ?auto_844220 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_844240 - BLOCK
      ?auto_844241 - BLOCK
      ?auto_844242 - BLOCK
      ?auto_844243 - BLOCK
      ?auto_844244 - BLOCK
      ?auto_844245 - BLOCK
      ?auto_844246 - BLOCK
      ?auto_844247 - BLOCK
      ?auto_844248 - BLOCK
      ?auto_844249 - BLOCK
      ?auto_844250 - BLOCK
      ?auto_844251 - BLOCK
      ?auto_844252 - BLOCK
      ?auto_844253 - BLOCK
      ?auto_844254 - BLOCK
      ?auto_844255 - BLOCK
      ?auto_844256 - BLOCK
      ?auto_844257 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_844257 ) ( ON-TABLE ?auto_844240 ) ( ON ?auto_844241 ?auto_844240 ) ( ON ?auto_844242 ?auto_844241 ) ( ON ?auto_844243 ?auto_844242 ) ( ON ?auto_844244 ?auto_844243 ) ( ON ?auto_844245 ?auto_844244 ) ( ON ?auto_844246 ?auto_844245 ) ( ON ?auto_844247 ?auto_844246 ) ( ON ?auto_844248 ?auto_844247 ) ( ON ?auto_844249 ?auto_844248 ) ( ON ?auto_844250 ?auto_844249 ) ( ON ?auto_844251 ?auto_844250 ) ( ON ?auto_844252 ?auto_844251 ) ( not ( = ?auto_844240 ?auto_844241 ) ) ( not ( = ?auto_844240 ?auto_844242 ) ) ( not ( = ?auto_844240 ?auto_844243 ) ) ( not ( = ?auto_844240 ?auto_844244 ) ) ( not ( = ?auto_844240 ?auto_844245 ) ) ( not ( = ?auto_844240 ?auto_844246 ) ) ( not ( = ?auto_844240 ?auto_844247 ) ) ( not ( = ?auto_844240 ?auto_844248 ) ) ( not ( = ?auto_844240 ?auto_844249 ) ) ( not ( = ?auto_844240 ?auto_844250 ) ) ( not ( = ?auto_844240 ?auto_844251 ) ) ( not ( = ?auto_844240 ?auto_844252 ) ) ( not ( = ?auto_844240 ?auto_844253 ) ) ( not ( = ?auto_844240 ?auto_844254 ) ) ( not ( = ?auto_844240 ?auto_844255 ) ) ( not ( = ?auto_844240 ?auto_844256 ) ) ( not ( = ?auto_844240 ?auto_844257 ) ) ( not ( = ?auto_844241 ?auto_844242 ) ) ( not ( = ?auto_844241 ?auto_844243 ) ) ( not ( = ?auto_844241 ?auto_844244 ) ) ( not ( = ?auto_844241 ?auto_844245 ) ) ( not ( = ?auto_844241 ?auto_844246 ) ) ( not ( = ?auto_844241 ?auto_844247 ) ) ( not ( = ?auto_844241 ?auto_844248 ) ) ( not ( = ?auto_844241 ?auto_844249 ) ) ( not ( = ?auto_844241 ?auto_844250 ) ) ( not ( = ?auto_844241 ?auto_844251 ) ) ( not ( = ?auto_844241 ?auto_844252 ) ) ( not ( = ?auto_844241 ?auto_844253 ) ) ( not ( = ?auto_844241 ?auto_844254 ) ) ( not ( = ?auto_844241 ?auto_844255 ) ) ( not ( = ?auto_844241 ?auto_844256 ) ) ( not ( = ?auto_844241 ?auto_844257 ) ) ( not ( = ?auto_844242 ?auto_844243 ) ) ( not ( = ?auto_844242 ?auto_844244 ) ) ( not ( = ?auto_844242 ?auto_844245 ) ) ( not ( = ?auto_844242 ?auto_844246 ) ) ( not ( = ?auto_844242 ?auto_844247 ) ) ( not ( = ?auto_844242 ?auto_844248 ) ) ( not ( = ?auto_844242 ?auto_844249 ) ) ( not ( = ?auto_844242 ?auto_844250 ) ) ( not ( = ?auto_844242 ?auto_844251 ) ) ( not ( = ?auto_844242 ?auto_844252 ) ) ( not ( = ?auto_844242 ?auto_844253 ) ) ( not ( = ?auto_844242 ?auto_844254 ) ) ( not ( = ?auto_844242 ?auto_844255 ) ) ( not ( = ?auto_844242 ?auto_844256 ) ) ( not ( = ?auto_844242 ?auto_844257 ) ) ( not ( = ?auto_844243 ?auto_844244 ) ) ( not ( = ?auto_844243 ?auto_844245 ) ) ( not ( = ?auto_844243 ?auto_844246 ) ) ( not ( = ?auto_844243 ?auto_844247 ) ) ( not ( = ?auto_844243 ?auto_844248 ) ) ( not ( = ?auto_844243 ?auto_844249 ) ) ( not ( = ?auto_844243 ?auto_844250 ) ) ( not ( = ?auto_844243 ?auto_844251 ) ) ( not ( = ?auto_844243 ?auto_844252 ) ) ( not ( = ?auto_844243 ?auto_844253 ) ) ( not ( = ?auto_844243 ?auto_844254 ) ) ( not ( = ?auto_844243 ?auto_844255 ) ) ( not ( = ?auto_844243 ?auto_844256 ) ) ( not ( = ?auto_844243 ?auto_844257 ) ) ( not ( = ?auto_844244 ?auto_844245 ) ) ( not ( = ?auto_844244 ?auto_844246 ) ) ( not ( = ?auto_844244 ?auto_844247 ) ) ( not ( = ?auto_844244 ?auto_844248 ) ) ( not ( = ?auto_844244 ?auto_844249 ) ) ( not ( = ?auto_844244 ?auto_844250 ) ) ( not ( = ?auto_844244 ?auto_844251 ) ) ( not ( = ?auto_844244 ?auto_844252 ) ) ( not ( = ?auto_844244 ?auto_844253 ) ) ( not ( = ?auto_844244 ?auto_844254 ) ) ( not ( = ?auto_844244 ?auto_844255 ) ) ( not ( = ?auto_844244 ?auto_844256 ) ) ( not ( = ?auto_844244 ?auto_844257 ) ) ( not ( = ?auto_844245 ?auto_844246 ) ) ( not ( = ?auto_844245 ?auto_844247 ) ) ( not ( = ?auto_844245 ?auto_844248 ) ) ( not ( = ?auto_844245 ?auto_844249 ) ) ( not ( = ?auto_844245 ?auto_844250 ) ) ( not ( = ?auto_844245 ?auto_844251 ) ) ( not ( = ?auto_844245 ?auto_844252 ) ) ( not ( = ?auto_844245 ?auto_844253 ) ) ( not ( = ?auto_844245 ?auto_844254 ) ) ( not ( = ?auto_844245 ?auto_844255 ) ) ( not ( = ?auto_844245 ?auto_844256 ) ) ( not ( = ?auto_844245 ?auto_844257 ) ) ( not ( = ?auto_844246 ?auto_844247 ) ) ( not ( = ?auto_844246 ?auto_844248 ) ) ( not ( = ?auto_844246 ?auto_844249 ) ) ( not ( = ?auto_844246 ?auto_844250 ) ) ( not ( = ?auto_844246 ?auto_844251 ) ) ( not ( = ?auto_844246 ?auto_844252 ) ) ( not ( = ?auto_844246 ?auto_844253 ) ) ( not ( = ?auto_844246 ?auto_844254 ) ) ( not ( = ?auto_844246 ?auto_844255 ) ) ( not ( = ?auto_844246 ?auto_844256 ) ) ( not ( = ?auto_844246 ?auto_844257 ) ) ( not ( = ?auto_844247 ?auto_844248 ) ) ( not ( = ?auto_844247 ?auto_844249 ) ) ( not ( = ?auto_844247 ?auto_844250 ) ) ( not ( = ?auto_844247 ?auto_844251 ) ) ( not ( = ?auto_844247 ?auto_844252 ) ) ( not ( = ?auto_844247 ?auto_844253 ) ) ( not ( = ?auto_844247 ?auto_844254 ) ) ( not ( = ?auto_844247 ?auto_844255 ) ) ( not ( = ?auto_844247 ?auto_844256 ) ) ( not ( = ?auto_844247 ?auto_844257 ) ) ( not ( = ?auto_844248 ?auto_844249 ) ) ( not ( = ?auto_844248 ?auto_844250 ) ) ( not ( = ?auto_844248 ?auto_844251 ) ) ( not ( = ?auto_844248 ?auto_844252 ) ) ( not ( = ?auto_844248 ?auto_844253 ) ) ( not ( = ?auto_844248 ?auto_844254 ) ) ( not ( = ?auto_844248 ?auto_844255 ) ) ( not ( = ?auto_844248 ?auto_844256 ) ) ( not ( = ?auto_844248 ?auto_844257 ) ) ( not ( = ?auto_844249 ?auto_844250 ) ) ( not ( = ?auto_844249 ?auto_844251 ) ) ( not ( = ?auto_844249 ?auto_844252 ) ) ( not ( = ?auto_844249 ?auto_844253 ) ) ( not ( = ?auto_844249 ?auto_844254 ) ) ( not ( = ?auto_844249 ?auto_844255 ) ) ( not ( = ?auto_844249 ?auto_844256 ) ) ( not ( = ?auto_844249 ?auto_844257 ) ) ( not ( = ?auto_844250 ?auto_844251 ) ) ( not ( = ?auto_844250 ?auto_844252 ) ) ( not ( = ?auto_844250 ?auto_844253 ) ) ( not ( = ?auto_844250 ?auto_844254 ) ) ( not ( = ?auto_844250 ?auto_844255 ) ) ( not ( = ?auto_844250 ?auto_844256 ) ) ( not ( = ?auto_844250 ?auto_844257 ) ) ( not ( = ?auto_844251 ?auto_844252 ) ) ( not ( = ?auto_844251 ?auto_844253 ) ) ( not ( = ?auto_844251 ?auto_844254 ) ) ( not ( = ?auto_844251 ?auto_844255 ) ) ( not ( = ?auto_844251 ?auto_844256 ) ) ( not ( = ?auto_844251 ?auto_844257 ) ) ( not ( = ?auto_844252 ?auto_844253 ) ) ( not ( = ?auto_844252 ?auto_844254 ) ) ( not ( = ?auto_844252 ?auto_844255 ) ) ( not ( = ?auto_844252 ?auto_844256 ) ) ( not ( = ?auto_844252 ?auto_844257 ) ) ( not ( = ?auto_844253 ?auto_844254 ) ) ( not ( = ?auto_844253 ?auto_844255 ) ) ( not ( = ?auto_844253 ?auto_844256 ) ) ( not ( = ?auto_844253 ?auto_844257 ) ) ( not ( = ?auto_844254 ?auto_844255 ) ) ( not ( = ?auto_844254 ?auto_844256 ) ) ( not ( = ?auto_844254 ?auto_844257 ) ) ( not ( = ?auto_844255 ?auto_844256 ) ) ( not ( = ?auto_844255 ?auto_844257 ) ) ( not ( = ?auto_844256 ?auto_844257 ) ) ( ON ?auto_844256 ?auto_844257 ) ( ON ?auto_844255 ?auto_844256 ) ( ON ?auto_844254 ?auto_844255 ) ( CLEAR ?auto_844252 ) ( ON ?auto_844253 ?auto_844254 ) ( CLEAR ?auto_844253 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_844240 ?auto_844241 ?auto_844242 ?auto_844243 ?auto_844244 ?auto_844245 ?auto_844246 ?auto_844247 ?auto_844248 ?auto_844249 ?auto_844250 ?auto_844251 ?auto_844252 ?auto_844253 )
      ( MAKE-18PILE ?auto_844240 ?auto_844241 ?auto_844242 ?auto_844243 ?auto_844244 ?auto_844245 ?auto_844246 ?auto_844247 ?auto_844248 ?auto_844249 ?auto_844250 ?auto_844251 ?auto_844252 ?auto_844253 ?auto_844254 ?auto_844255 ?auto_844256 ?auto_844257 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_844276 - BLOCK
      ?auto_844277 - BLOCK
      ?auto_844278 - BLOCK
      ?auto_844279 - BLOCK
      ?auto_844280 - BLOCK
      ?auto_844281 - BLOCK
      ?auto_844282 - BLOCK
      ?auto_844283 - BLOCK
      ?auto_844284 - BLOCK
      ?auto_844285 - BLOCK
      ?auto_844286 - BLOCK
      ?auto_844287 - BLOCK
      ?auto_844288 - BLOCK
      ?auto_844289 - BLOCK
      ?auto_844290 - BLOCK
      ?auto_844291 - BLOCK
      ?auto_844292 - BLOCK
      ?auto_844293 - BLOCK
    )
    :vars
    (
      ?auto_844294 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_844293 ?auto_844294 ) ( ON-TABLE ?auto_844276 ) ( ON ?auto_844277 ?auto_844276 ) ( ON ?auto_844278 ?auto_844277 ) ( ON ?auto_844279 ?auto_844278 ) ( ON ?auto_844280 ?auto_844279 ) ( ON ?auto_844281 ?auto_844280 ) ( ON ?auto_844282 ?auto_844281 ) ( ON ?auto_844283 ?auto_844282 ) ( ON ?auto_844284 ?auto_844283 ) ( ON ?auto_844285 ?auto_844284 ) ( ON ?auto_844286 ?auto_844285 ) ( ON ?auto_844287 ?auto_844286 ) ( not ( = ?auto_844276 ?auto_844277 ) ) ( not ( = ?auto_844276 ?auto_844278 ) ) ( not ( = ?auto_844276 ?auto_844279 ) ) ( not ( = ?auto_844276 ?auto_844280 ) ) ( not ( = ?auto_844276 ?auto_844281 ) ) ( not ( = ?auto_844276 ?auto_844282 ) ) ( not ( = ?auto_844276 ?auto_844283 ) ) ( not ( = ?auto_844276 ?auto_844284 ) ) ( not ( = ?auto_844276 ?auto_844285 ) ) ( not ( = ?auto_844276 ?auto_844286 ) ) ( not ( = ?auto_844276 ?auto_844287 ) ) ( not ( = ?auto_844276 ?auto_844288 ) ) ( not ( = ?auto_844276 ?auto_844289 ) ) ( not ( = ?auto_844276 ?auto_844290 ) ) ( not ( = ?auto_844276 ?auto_844291 ) ) ( not ( = ?auto_844276 ?auto_844292 ) ) ( not ( = ?auto_844276 ?auto_844293 ) ) ( not ( = ?auto_844276 ?auto_844294 ) ) ( not ( = ?auto_844277 ?auto_844278 ) ) ( not ( = ?auto_844277 ?auto_844279 ) ) ( not ( = ?auto_844277 ?auto_844280 ) ) ( not ( = ?auto_844277 ?auto_844281 ) ) ( not ( = ?auto_844277 ?auto_844282 ) ) ( not ( = ?auto_844277 ?auto_844283 ) ) ( not ( = ?auto_844277 ?auto_844284 ) ) ( not ( = ?auto_844277 ?auto_844285 ) ) ( not ( = ?auto_844277 ?auto_844286 ) ) ( not ( = ?auto_844277 ?auto_844287 ) ) ( not ( = ?auto_844277 ?auto_844288 ) ) ( not ( = ?auto_844277 ?auto_844289 ) ) ( not ( = ?auto_844277 ?auto_844290 ) ) ( not ( = ?auto_844277 ?auto_844291 ) ) ( not ( = ?auto_844277 ?auto_844292 ) ) ( not ( = ?auto_844277 ?auto_844293 ) ) ( not ( = ?auto_844277 ?auto_844294 ) ) ( not ( = ?auto_844278 ?auto_844279 ) ) ( not ( = ?auto_844278 ?auto_844280 ) ) ( not ( = ?auto_844278 ?auto_844281 ) ) ( not ( = ?auto_844278 ?auto_844282 ) ) ( not ( = ?auto_844278 ?auto_844283 ) ) ( not ( = ?auto_844278 ?auto_844284 ) ) ( not ( = ?auto_844278 ?auto_844285 ) ) ( not ( = ?auto_844278 ?auto_844286 ) ) ( not ( = ?auto_844278 ?auto_844287 ) ) ( not ( = ?auto_844278 ?auto_844288 ) ) ( not ( = ?auto_844278 ?auto_844289 ) ) ( not ( = ?auto_844278 ?auto_844290 ) ) ( not ( = ?auto_844278 ?auto_844291 ) ) ( not ( = ?auto_844278 ?auto_844292 ) ) ( not ( = ?auto_844278 ?auto_844293 ) ) ( not ( = ?auto_844278 ?auto_844294 ) ) ( not ( = ?auto_844279 ?auto_844280 ) ) ( not ( = ?auto_844279 ?auto_844281 ) ) ( not ( = ?auto_844279 ?auto_844282 ) ) ( not ( = ?auto_844279 ?auto_844283 ) ) ( not ( = ?auto_844279 ?auto_844284 ) ) ( not ( = ?auto_844279 ?auto_844285 ) ) ( not ( = ?auto_844279 ?auto_844286 ) ) ( not ( = ?auto_844279 ?auto_844287 ) ) ( not ( = ?auto_844279 ?auto_844288 ) ) ( not ( = ?auto_844279 ?auto_844289 ) ) ( not ( = ?auto_844279 ?auto_844290 ) ) ( not ( = ?auto_844279 ?auto_844291 ) ) ( not ( = ?auto_844279 ?auto_844292 ) ) ( not ( = ?auto_844279 ?auto_844293 ) ) ( not ( = ?auto_844279 ?auto_844294 ) ) ( not ( = ?auto_844280 ?auto_844281 ) ) ( not ( = ?auto_844280 ?auto_844282 ) ) ( not ( = ?auto_844280 ?auto_844283 ) ) ( not ( = ?auto_844280 ?auto_844284 ) ) ( not ( = ?auto_844280 ?auto_844285 ) ) ( not ( = ?auto_844280 ?auto_844286 ) ) ( not ( = ?auto_844280 ?auto_844287 ) ) ( not ( = ?auto_844280 ?auto_844288 ) ) ( not ( = ?auto_844280 ?auto_844289 ) ) ( not ( = ?auto_844280 ?auto_844290 ) ) ( not ( = ?auto_844280 ?auto_844291 ) ) ( not ( = ?auto_844280 ?auto_844292 ) ) ( not ( = ?auto_844280 ?auto_844293 ) ) ( not ( = ?auto_844280 ?auto_844294 ) ) ( not ( = ?auto_844281 ?auto_844282 ) ) ( not ( = ?auto_844281 ?auto_844283 ) ) ( not ( = ?auto_844281 ?auto_844284 ) ) ( not ( = ?auto_844281 ?auto_844285 ) ) ( not ( = ?auto_844281 ?auto_844286 ) ) ( not ( = ?auto_844281 ?auto_844287 ) ) ( not ( = ?auto_844281 ?auto_844288 ) ) ( not ( = ?auto_844281 ?auto_844289 ) ) ( not ( = ?auto_844281 ?auto_844290 ) ) ( not ( = ?auto_844281 ?auto_844291 ) ) ( not ( = ?auto_844281 ?auto_844292 ) ) ( not ( = ?auto_844281 ?auto_844293 ) ) ( not ( = ?auto_844281 ?auto_844294 ) ) ( not ( = ?auto_844282 ?auto_844283 ) ) ( not ( = ?auto_844282 ?auto_844284 ) ) ( not ( = ?auto_844282 ?auto_844285 ) ) ( not ( = ?auto_844282 ?auto_844286 ) ) ( not ( = ?auto_844282 ?auto_844287 ) ) ( not ( = ?auto_844282 ?auto_844288 ) ) ( not ( = ?auto_844282 ?auto_844289 ) ) ( not ( = ?auto_844282 ?auto_844290 ) ) ( not ( = ?auto_844282 ?auto_844291 ) ) ( not ( = ?auto_844282 ?auto_844292 ) ) ( not ( = ?auto_844282 ?auto_844293 ) ) ( not ( = ?auto_844282 ?auto_844294 ) ) ( not ( = ?auto_844283 ?auto_844284 ) ) ( not ( = ?auto_844283 ?auto_844285 ) ) ( not ( = ?auto_844283 ?auto_844286 ) ) ( not ( = ?auto_844283 ?auto_844287 ) ) ( not ( = ?auto_844283 ?auto_844288 ) ) ( not ( = ?auto_844283 ?auto_844289 ) ) ( not ( = ?auto_844283 ?auto_844290 ) ) ( not ( = ?auto_844283 ?auto_844291 ) ) ( not ( = ?auto_844283 ?auto_844292 ) ) ( not ( = ?auto_844283 ?auto_844293 ) ) ( not ( = ?auto_844283 ?auto_844294 ) ) ( not ( = ?auto_844284 ?auto_844285 ) ) ( not ( = ?auto_844284 ?auto_844286 ) ) ( not ( = ?auto_844284 ?auto_844287 ) ) ( not ( = ?auto_844284 ?auto_844288 ) ) ( not ( = ?auto_844284 ?auto_844289 ) ) ( not ( = ?auto_844284 ?auto_844290 ) ) ( not ( = ?auto_844284 ?auto_844291 ) ) ( not ( = ?auto_844284 ?auto_844292 ) ) ( not ( = ?auto_844284 ?auto_844293 ) ) ( not ( = ?auto_844284 ?auto_844294 ) ) ( not ( = ?auto_844285 ?auto_844286 ) ) ( not ( = ?auto_844285 ?auto_844287 ) ) ( not ( = ?auto_844285 ?auto_844288 ) ) ( not ( = ?auto_844285 ?auto_844289 ) ) ( not ( = ?auto_844285 ?auto_844290 ) ) ( not ( = ?auto_844285 ?auto_844291 ) ) ( not ( = ?auto_844285 ?auto_844292 ) ) ( not ( = ?auto_844285 ?auto_844293 ) ) ( not ( = ?auto_844285 ?auto_844294 ) ) ( not ( = ?auto_844286 ?auto_844287 ) ) ( not ( = ?auto_844286 ?auto_844288 ) ) ( not ( = ?auto_844286 ?auto_844289 ) ) ( not ( = ?auto_844286 ?auto_844290 ) ) ( not ( = ?auto_844286 ?auto_844291 ) ) ( not ( = ?auto_844286 ?auto_844292 ) ) ( not ( = ?auto_844286 ?auto_844293 ) ) ( not ( = ?auto_844286 ?auto_844294 ) ) ( not ( = ?auto_844287 ?auto_844288 ) ) ( not ( = ?auto_844287 ?auto_844289 ) ) ( not ( = ?auto_844287 ?auto_844290 ) ) ( not ( = ?auto_844287 ?auto_844291 ) ) ( not ( = ?auto_844287 ?auto_844292 ) ) ( not ( = ?auto_844287 ?auto_844293 ) ) ( not ( = ?auto_844287 ?auto_844294 ) ) ( not ( = ?auto_844288 ?auto_844289 ) ) ( not ( = ?auto_844288 ?auto_844290 ) ) ( not ( = ?auto_844288 ?auto_844291 ) ) ( not ( = ?auto_844288 ?auto_844292 ) ) ( not ( = ?auto_844288 ?auto_844293 ) ) ( not ( = ?auto_844288 ?auto_844294 ) ) ( not ( = ?auto_844289 ?auto_844290 ) ) ( not ( = ?auto_844289 ?auto_844291 ) ) ( not ( = ?auto_844289 ?auto_844292 ) ) ( not ( = ?auto_844289 ?auto_844293 ) ) ( not ( = ?auto_844289 ?auto_844294 ) ) ( not ( = ?auto_844290 ?auto_844291 ) ) ( not ( = ?auto_844290 ?auto_844292 ) ) ( not ( = ?auto_844290 ?auto_844293 ) ) ( not ( = ?auto_844290 ?auto_844294 ) ) ( not ( = ?auto_844291 ?auto_844292 ) ) ( not ( = ?auto_844291 ?auto_844293 ) ) ( not ( = ?auto_844291 ?auto_844294 ) ) ( not ( = ?auto_844292 ?auto_844293 ) ) ( not ( = ?auto_844292 ?auto_844294 ) ) ( not ( = ?auto_844293 ?auto_844294 ) ) ( ON ?auto_844292 ?auto_844293 ) ( ON ?auto_844291 ?auto_844292 ) ( ON ?auto_844290 ?auto_844291 ) ( ON ?auto_844289 ?auto_844290 ) ( CLEAR ?auto_844287 ) ( ON ?auto_844288 ?auto_844289 ) ( CLEAR ?auto_844288 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_844276 ?auto_844277 ?auto_844278 ?auto_844279 ?auto_844280 ?auto_844281 ?auto_844282 ?auto_844283 ?auto_844284 ?auto_844285 ?auto_844286 ?auto_844287 ?auto_844288 )
      ( MAKE-18PILE ?auto_844276 ?auto_844277 ?auto_844278 ?auto_844279 ?auto_844280 ?auto_844281 ?auto_844282 ?auto_844283 ?auto_844284 ?auto_844285 ?auto_844286 ?auto_844287 ?auto_844288 ?auto_844289 ?auto_844290 ?auto_844291 ?auto_844292 ?auto_844293 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_844313 - BLOCK
      ?auto_844314 - BLOCK
      ?auto_844315 - BLOCK
      ?auto_844316 - BLOCK
      ?auto_844317 - BLOCK
      ?auto_844318 - BLOCK
      ?auto_844319 - BLOCK
      ?auto_844320 - BLOCK
      ?auto_844321 - BLOCK
      ?auto_844322 - BLOCK
      ?auto_844323 - BLOCK
      ?auto_844324 - BLOCK
      ?auto_844325 - BLOCK
      ?auto_844326 - BLOCK
      ?auto_844327 - BLOCK
      ?auto_844328 - BLOCK
      ?auto_844329 - BLOCK
      ?auto_844330 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_844330 ) ( ON-TABLE ?auto_844313 ) ( ON ?auto_844314 ?auto_844313 ) ( ON ?auto_844315 ?auto_844314 ) ( ON ?auto_844316 ?auto_844315 ) ( ON ?auto_844317 ?auto_844316 ) ( ON ?auto_844318 ?auto_844317 ) ( ON ?auto_844319 ?auto_844318 ) ( ON ?auto_844320 ?auto_844319 ) ( ON ?auto_844321 ?auto_844320 ) ( ON ?auto_844322 ?auto_844321 ) ( ON ?auto_844323 ?auto_844322 ) ( ON ?auto_844324 ?auto_844323 ) ( not ( = ?auto_844313 ?auto_844314 ) ) ( not ( = ?auto_844313 ?auto_844315 ) ) ( not ( = ?auto_844313 ?auto_844316 ) ) ( not ( = ?auto_844313 ?auto_844317 ) ) ( not ( = ?auto_844313 ?auto_844318 ) ) ( not ( = ?auto_844313 ?auto_844319 ) ) ( not ( = ?auto_844313 ?auto_844320 ) ) ( not ( = ?auto_844313 ?auto_844321 ) ) ( not ( = ?auto_844313 ?auto_844322 ) ) ( not ( = ?auto_844313 ?auto_844323 ) ) ( not ( = ?auto_844313 ?auto_844324 ) ) ( not ( = ?auto_844313 ?auto_844325 ) ) ( not ( = ?auto_844313 ?auto_844326 ) ) ( not ( = ?auto_844313 ?auto_844327 ) ) ( not ( = ?auto_844313 ?auto_844328 ) ) ( not ( = ?auto_844313 ?auto_844329 ) ) ( not ( = ?auto_844313 ?auto_844330 ) ) ( not ( = ?auto_844314 ?auto_844315 ) ) ( not ( = ?auto_844314 ?auto_844316 ) ) ( not ( = ?auto_844314 ?auto_844317 ) ) ( not ( = ?auto_844314 ?auto_844318 ) ) ( not ( = ?auto_844314 ?auto_844319 ) ) ( not ( = ?auto_844314 ?auto_844320 ) ) ( not ( = ?auto_844314 ?auto_844321 ) ) ( not ( = ?auto_844314 ?auto_844322 ) ) ( not ( = ?auto_844314 ?auto_844323 ) ) ( not ( = ?auto_844314 ?auto_844324 ) ) ( not ( = ?auto_844314 ?auto_844325 ) ) ( not ( = ?auto_844314 ?auto_844326 ) ) ( not ( = ?auto_844314 ?auto_844327 ) ) ( not ( = ?auto_844314 ?auto_844328 ) ) ( not ( = ?auto_844314 ?auto_844329 ) ) ( not ( = ?auto_844314 ?auto_844330 ) ) ( not ( = ?auto_844315 ?auto_844316 ) ) ( not ( = ?auto_844315 ?auto_844317 ) ) ( not ( = ?auto_844315 ?auto_844318 ) ) ( not ( = ?auto_844315 ?auto_844319 ) ) ( not ( = ?auto_844315 ?auto_844320 ) ) ( not ( = ?auto_844315 ?auto_844321 ) ) ( not ( = ?auto_844315 ?auto_844322 ) ) ( not ( = ?auto_844315 ?auto_844323 ) ) ( not ( = ?auto_844315 ?auto_844324 ) ) ( not ( = ?auto_844315 ?auto_844325 ) ) ( not ( = ?auto_844315 ?auto_844326 ) ) ( not ( = ?auto_844315 ?auto_844327 ) ) ( not ( = ?auto_844315 ?auto_844328 ) ) ( not ( = ?auto_844315 ?auto_844329 ) ) ( not ( = ?auto_844315 ?auto_844330 ) ) ( not ( = ?auto_844316 ?auto_844317 ) ) ( not ( = ?auto_844316 ?auto_844318 ) ) ( not ( = ?auto_844316 ?auto_844319 ) ) ( not ( = ?auto_844316 ?auto_844320 ) ) ( not ( = ?auto_844316 ?auto_844321 ) ) ( not ( = ?auto_844316 ?auto_844322 ) ) ( not ( = ?auto_844316 ?auto_844323 ) ) ( not ( = ?auto_844316 ?auto_844324 ) ) ( not ( = ?auto_844316 ?auto_844325 ) ) ( not ( = ?auto_844316 ?auto_844326 ) ) ( not ( = ?auto_844316 ?auto_844327 ) ) ( not ( = ?auto_844316 ?auto_844328 ) ) ( not ( = ?auto_844316 ?auto_844329 ) ) ( not ( = ?auto_844316 ?auto_844330 ) ) ( not ( = ?auto_844317 ?auto_844318 ) ) ( not ( = ?auto_844317 ?auto_844319 ) ) ( not ( = ?auto_844317 ?auto_844320 ) ) ( not ( = ?auto_844317 ?auto_844321 ) ) ( not ( = ?auto_844317 ?auto_844322 ) ) ( not ( = ?auto_844317 ?auto_844323 ) ) ( not ( = ?auto_844317 ?auto_844324 ) ) ( not ( = ?auto_844317 ?auto_844325 ) ) ( not ( = ?auto_844317 ?auto_844326 ) ) ( not ( = ?auto_844317 ?auto_844327 ) ) ( not ( = ?auto_844317 ?auto_844328 ) ) ( not ( = ?auto_844317 ?auto_844329 ) ) ( not ( = ?auto_844317 ?auto_844330 ) ) ( not ( = ?auto_844318 ?auto_844319 ) ) ( not ( = ?auto_844318 ?auto_844320 ) ) ( not ( = ?auto_844318 ?auto_844321 ) ) ( not ( = ?auto_844318 ?auto_844322 ) ) ( not ( = ?auto_844318 ?auto_844323 ) ) ( not ( = ?auto_844318 ?auto_844324 ) ) ( not ( = ?auto_844318 ?auto_844325 ) ) ( not ( = ?auto_844318 ?auto_844326 ) ) ( not ( = ?auto_844318 ?auto_844327 ) ) ( not ( = ?auto_844318 ?auto_844328 ) ) ( not ( = ?auto_844318 ?auto_844329 ) ) ( not ( = ?auto_844318 ?auto_844330 ) ) ( not ( = ?auto_844319 ?auto_844320 ) ) ( not ( = ?auto_844319 ?auto_844321 ) ) ( not ( = ?auto_844319 ?auto_844322 ) ) ( not ( = ?auto_844319 ?auto_844323 ) ) ( not ( = ?auto_844319 ?auto_844324 ) ) ( not ( = ?auto_844319 ?auto_844325 ) ) ( not ( = ?auto_844319 ?auto_844326 ) ) ( not ( = ?auto_844319 ?auto_844327 ) ) ( not ( = ?auto_844319 ?auto_844328 ) ) ( not ( = ?auto_844319 ?auto_844329 ) ) ( not ( = ?auto_844319 ?auto_844330 ) ) ( not ( = ?auto_844320 ?auto_844321 ) ) ( not ( = ?auto_844320 ?auto_844322 ) ) ( not ( = ?auto_844320 ?auto_844323 ) ) ( not ( = ?auto_844320 ?auto_844324 ) ) ( not ( = ?auto_844320 ?auto_844325 ) ) ( not ( = ?auto_844320 ?auto_844326 ) ) ( not ( = ?auto_844320 ?auto_844327 ) ) ( not ( = ?auto_844320 ?auto_844328 ) ) ( not ( = ?auto_844320 ?auto_844329 ) ) ( not ( = ?auto_844320 ?auto_844330 ) ) ( not ( = ?auto_844321 ?auto_844322 ) ) ( not ( = ?auto_844321 ?auto_844323 ) ) ( not ( = ?auto_844321 ?auto_844324 ) ) ( not ( = ?auto_844321 ?auto_844325 ) ) ( not ( = ?auto_844321 ?auto_844326 ) ) ( not ( = ?auto_844321 ?auto_844327 ) ) ( not ( = ?auto_844321 ?auto_844328 ) ) ( not ( = ?auto_844321 ?auto_844329 ) ) ( not ( = ?auto_844321 ?auto_844330 ) ) ( not ( = ?auto_844322 ?auto_844323 ) ) ( not ( = ?auto_844322 ?auto_844324 ) ) ( not ( = ?auto_844322 ?auto_844325 ) ) ( not ( = ?auto_844322 ?auto_844326 ) ) ( not ( = ?auto_844322 ?auto_844327 ) ) ( not ( = ?auto_844322 ?auto_844328 ) ) ( not ( = ?auto_844322 ?auto_844329 ) ) ( not ( = ?auto_844322 ?auto_844330 ) ) ( not ( = ?auto_844323 ?auto_844324 ) ) ( not ( = ?auto_844323 ?auto_844325 ) ) ( not ( = ?auto_844323 ?auto_844326 ) ) ( not ( = ?auto_844323 ?auto_844327 ) ) ( not ( = ?auto_844323 ?auto_844328 ) ) ( not ( = ?auto_844323 ?auto_844329 ) ) ( not ( = ?auto_844323 ?auto_844330 ) ) ( not ( = ?auto_844324 ?auto_844325 ) ) ( not ( = ?auto_844324 ?auto_844326 ) ) ( not ( = ?auto_844324 ?auto_844327 ) ) ( not ( = ?auto_844324 ?auto_844328 ) ) ( not ( = ?auto_844324 ?auto_844329 ) ) ( not ( = ?auto_844324 ?auto_844330 ) ) ( not ( = ?auto_844325 ?auto_844326 ) ) ( not ( = ?auto_844325 ?auto_844327 ) ) ( not ( = ?auto_844325 ?auto_844328 ) ) ( not ( = ?auto_844325 ?auto_844329 ) ) ( not ( = ?auto_844325 ?auto_844330 ) ) ( not ( = ?auto_844326 ?auto_844327 ) ) ( not ( = ?auto_844326 ?auto_844328 ) ) ( not ( = ?auto_844326 ?auto_844329 ) ) ( not ( = ?auto_844326 ?auto_844330 ) ) ( not ( = ?auto_844327 ?auto_844328 ) ) ( not ( = ?auto_844327 ?auto_844329 ) ) ( not ( = ?auto_844327 ?auto_844330 ) ) ( not ( = ?auto_844328 ?auto_844329 ) ) ( not ( = ?auto_844328 ?auto_844330 ) ) ( not ( = ?auto_844329 ?auto_844330 ) ) ( ON ?auto_844329 ?auto_844330 ) ( ON ?auto_844328 ?auto_844329 ) ( ON ?auto_844327 ?auto_844328 ) ( ON ?auto_844326 ?auto_844327 ) ( CLEAR ?auto_844324 ) ( ON ?auto_844325 ?auto_844326 ) ( CLEAR ?auto_844325 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_844313 ?auto_844314 ?auto_844315 ?auto_844316 ?auto_844317 ?auto_844318 ?auto_844319 ?auto_844320 ?auto_844321 ?auto_844322 ?auto_844323 ?auto_844324 ?auto_844325 )
      ( MAKE-18PILE ?auto_844313 ?auto_844314 ?auto_844315 ?auto_844316 ?auto_844317 ?auto_844318 ?auto_844319 ?auto_844320 ?auto_844321 ?auto_844322 ?auto_844323 ?auto_844324 ?auto_844325 ?auto_844326 ?auto_844327 ?auto_844328 ?auto_844329 ?auto_844330 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_844349 - BLOCK
      ?auto_844350 - BLOCK
      ?auto_844351 - BLOCK
      ?auto_844352 - BLOCK
      ?auto_844353 - BLOCK
      ?auto_844354 - BLOCK
      ?auto_844355 - BLOCK
      ?auto_844356 - BLOCK
      ?auto_844357 - BLOCK
      ?auto_844358 - BLOCK
      ?auto_844359 - BLOCK
      ?auto_844360 - BLOCK
      ?auto_844361 - BLOCK
      ?auto_844362 - BLOCK
      ?auto_844363 - BLOCK
      ?auto_844364 - BLOCK
      ?auto_844365 - BLOCK
      ?auto_844366 - BLOCK
    )
    :vars
    (
      ?auto_844367 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_844366 ?auto_844367 ) ( ON-TABLE ?auto_844349 ) ( ON ?auto_844350 ?auto_844349 ) ( ON ?auto_844351 ?auto_844350 ) ( ON ?auto_844352 ?auto_844351 ) ( ON ?auto_844353 ?auto_844352 ) ( ON ?auto_844354 ?auto_844353 ) ( ON ?auto_844355 ?auto_844354 ) ( ON ?auto_844356 ?auto_844355 ) ( ON ?auto_844357 ?auto_844356 ) ( ON ?auto_844358 ?auto_844357 ) ( ON ?auto_844359 ?auto_844358 ) ( not ( = ?auto_844349 ?auto_844350 ) ) ( not ( = ?auto_844349 ?auto_844351 ) ) ( not ( = ?auto_844349 ?auto_844352 ) ) ( not ( = ?auto_844349 ?auto_844353 ) ) ( not ( = ?auto_844349 ?auto_844354 ) ) ( not ( = ?auto_844349 ?auto_844355 ) ) ( not ( = ?auto_844349 ?auto_844356 ) ) ( not ( = ?auto_844349 ?auto_844357 ) ) ( not ( = ?auto_844349 ?auto_844358 ) ) ( not ( = ?auto_844349 ?auto_844359 ) ) ( not ( = ?auto_844349 ?auto_844360 ) ) ( not ( = ?auto_844349 ?auto_844361 ) ) ( not ( = ?auto_844349 ?auto_844362 ) ) ( not ( = ?auto_844349 ?auto_844363 ) ) ( not ( = ?auto_844349 ?auto_844364 ) ) ( not ( = ?auto_844349 ?auto_844365 ) ) ( not ( = ?auto_844349 ?auto_844366 ) ) ( not ( = ?auto_844349 ?auto_844367 ) ) ( not ( = ?auto_844350 ?auto_844351 ) ) ( not ( = ?auto_844350 ?auto_844352 ) ) ( not ( = ?auto_844350 ?auto_844353 ) ) ( not ( = ?auto_844350 ?auto_844354 ) ) ( not ( = ?auto_844350 ?auto_844355 ) ) ( not ( = ?auto_844350 ?auto_844356 ) ) ( not ( = ?auto_844350 ?auto_844357 ) ) ( not ( = ?auto_844350 ?auto_844358 ) ) ( not ( = ?auto_844350 ?auto_844359 ) ) ( not ( = ?auto_844350 ?auto_844360 ) ) ( not ( = ?auto_844350 ?auto_844361 ) ) ( not ( = ?auto_844350 ?auto_844362 ) ) ( not ( = ?auto_844350 ?auto_844363 ) ) ( not ( = ?auto_844350 ?auto_844364 ) ) ( not ( = ?auto_844350 ?auto_844365 ) ) ( not ( = ?auto_844350 ?auto_844366 ) ) ( not ( = ?auto_844350 ?auto_844367 ) ) ( not ( = ?auto_844351 ?auto_844352 ) ) ( not ( = ?auto_844351 ?auto_844353 ) ) ( not ( = ?auto_844351 ?auto_844354 ) ) ( not ( = ?auto_844351 ?auto_844355 ) ) ( not ( = ?auto_844351 ?auto_844356 ) ) ( not ( = ?auto_844351 ?auto_844357 ) ) ( not ( = ?auto_844351 ?auto_844358 ) ) ( not ( = ?auto_844351 ?auto_844359 ) ) ( not ( = ?auto_844351 ?auto_844360 ) ) ( not ( = ?auto_844351 ?auto_844361 ) ) ( not ( = ?auto_844351 ?auto_844362 ) ) ( not ( = ?auto_844351 ?auto_844363 ) ) ( not ( = ?auto_844351 ?auto_844364 ) ) ( not ( = ?auto_844351 ?auto_844365 ) ) ( not ( = ?auto_844351 ?auto_844366 ) ) ( not ( = ?auto_844351 ?auto_844367 ) ) ( not ( = ?auto_844352 ?auto_844353 ) ) ( not ( = ?auto_844352 ?auto_844354 ) ) ( not ( = ?auto_844352 ?auto_844355 ) ) ( not ( = ?auto_844352 ?auto_844356 ) ) ( not ( = ?auto_844352 ?auto_844357 ) ) ( not ( = ?auto_844352 ?auto_844358 ) ) ( not ( = ?auto_844352 ?auto_844359 ) ) ( not ( = ?auto_844352 ?auto_844360 ) ) ( not ( = ?auto_844352 ?auto_844361 ) ) ( not ( = ?auto_844352 ?auto_844362 ) ) ( not ( = ?auto_844352 ?auto_844363 ) ) ( not ( = ?auto_844352 ?auto_844364 ) ) ( not ( = ?auto_844352 ?auto_844365 ) ) ( not ( = ?auto_844352 ?auto_844366 ) ) ( not ( = ?auto_844352 ?auto_844367 ) ) ( not ( = ?auto_844353 ?auto_844354 ) ) ( not ( = ?auto_844353 ?auto_844355 ) ) ( not ( = ?auto_844353 ?auto_844356 ) ) ( not ( = ?auto_844353 ?auto_844357 ) ) ( not ( = ?auto_844353 ?auto_844358 ) ) ( not ( = ?auto_844353 ?auto_844359 ) ) ( not ( = ?auto_844353 ?auto_844360 ) ) ( not ( = ?auto_844353 ?auto_844361 ) ) ( not ( = ?auto_844353 ?auto_844362 ) ) ( not ( = ?auto_844353 ?auto_844363 ) ) ( not ( = ?auto_844353 ?auto_844364 ) ) ( not ( = ?auto_844353 ?auto_844365 ) ) ( not ( = ?auto_844353 ?auto_844366 ) ) ( not ( = ?auto_844353 ?auto_844367 ) ) ( not ( = ?auto_844354 ?auto_844355 ) ) ( not ( = ?auto_844354 ?auto_844356 ) ) ( not ( = ?auto_844354 ?auto_844357 ) ) ( not ( = ?auto_844354 ?auto_844358 ) ) ( not ( = ?auto_844354 ?auto_844359 ) ) ( not ( = ?auto_844354 ?auto_844360 ) ) ( not ( = ?auto_844354 ?auto_844361 ) ) ( not ( = ?auto_844354 ?auto_844362 ) ) ( not ( = ?auto_844354 ?auto_844363 ) ) ( not ( = ?auto_844354 ?auto_844364 ) ) ( not ( = ?auto_844354 ?auto_844365 ) ) ( not ( = ?auto_844354 ?auto_844366 ) ) ( not ( = ?auto_844354 ?auto_844367 ) ) ( not ( = ?auto_844355 ?auto_844356 ) ) ( not ( = ?auto_844355 ?auto_844357 ) ) ( not ( = ?auto_844355 ?auto_844358 ) ) ( not ( = ?auto_844355 ?auto_844359 ) ) ( not ( = ?auto_844355 ?auto_844360 ) ) ( not ( = ?auto_844355 ?auto_844361 ) ) ( not ( = ?auto_844355 ?auto_844362 ) ) ( not ( = ?auto_844355 ?auto_844363 ) ) ( not ( = ?auto_844355 ?auto_844364 ) ) ( not ( = ?auto_844355 ?auto_844365 ) ) ( not ( = ?auto_844355 ?auto_844366 ) ) ( not ( = ?auto_844355 ?auto_844367 ) ) ( not ( = ?auto_844356 ?auto_844357 ) ) ( not ( = ?auto_844356 ?auto_844358 ) ) ( not ( = ?auto_844356 ?auto_844359 ) ) ( not ( = ?auto_844356 ?auto_844360 ) ) ( not ( = ?auto_844356 ?auto_844361 ) ) ( not ( = ?auto_844356 ?auto_844362 ) ) ( not ( = ?auto_844356 ?auto_844363 ) ) ( not ( = ?auto_844356 ?auto_844364 ) ) ( not ( = ?auto_844356 ?auto_844365 ) ) ( not ( = ?auto_844356 ?auto_844366 ) ) ( not ( = ?auto_844356 ?auto_844367 ) ) ( not ( = ?auto_844357 ?auto_844358 ) ) ( not ( = ?auto_844357 ?auto_844359 ) ) ( not ( = ?auto_844357 ?auto_844360 ) ) ( not ( = ?auto_844357 ?auto_844361 ) ) ( not ( = ?auto_844357 ?auto_844362 ) ) ( not ( = ?auto_844357 ?auto_844363 ) ) ( not ( = ?auto_844357 ?auto_844364 ) ) ( not ( = ?auto_844357 ?auto_844365 ) ) ( not ( = ?auto_844357 ?auto_844366 ) ) ( not ( = ?auto_844357 ?auto_844367 ) ) ( not ( = ?auto_844358 ?auto_844359 ) ) ( not ( = ?auto_844358 ?auto_844360 ) ) ( not ( = ?auto_844358 ?auto_844361 ) ) ( not ( = ?auto_844358 ?auto_844362 ) ) ( not ( = ?auto_844358 ?auto_844363 ) ) ( not ( = ?auto_844358 ?auto_844364 ) ) ( not ( = ?auto_844358 ?auto_844365 ) ) ( not ( = ?auto_844358 ?auto_844366 ) ) ( not ( = ?auto_844358 ?auto_844367 ) ) ( not ( = ?auto_844359 ?auto_844360 ) ) ( not ( = ?auto_844359 ?auto_844361 ) ) ( not ( = ?auto_844359 ?auto_844362 ) ) ( not ( = ?auto_844359 ?auto_844363 ) ) ( not ( = ?auto_844359 ?auto_844364 ) ) ( not ( = ?auto_844359 ?auto_844365 ) ) ( not ( = ?auto_844359 ?auto_844366 ) ) ( not ( = ?auto_844359 ?auto_844367 ) ) ( not ( = ?auto_844360 ?auto_844361 ) ) ( not ( = ?auto_844360 ?auto_844362 ) ) ( not ( = ?auto_844360 ?auto_844363 ) ) ( not ( = ?auto_844360 ?auto_844364 ) ) ( not ( = ?auto_844360 ?auto_844365 ) ) ( not ( = ?auto_844360 ?auto_844366 ) ) ( not ( = ?auto_844360 ?auto_844367 ) ) ( not ( = ?auto_844361 ?auto_844362 ) ) ( not ( = ?auto_844361 ?auto_844363 ) ) ( not ( = ?auto_844361 ?auto_844364 ) ) ( not ( = ?auto_844361 ?auto_844365 ) ) ( not ( = ?auto_844361 ?auto_844366 ) ) ( not ( = ?auto_844361 ?auto_844367 ) ) ( not ( = ?auto_844362 ?auto_844363 ) ) ( not ( = ?auto_844362 ?auto_844364 ) ) ( not ( = ?auto_844362 ?auto_844365 ) ) ( not ( = ?auto_844362 ?auto_844366 ) ) ( not ( = ?auto_844362 ?auto_844367 ) ) ( not ( = ?auto_844363 ?auto_844364 ) ) ( not ( = ?auto_844363 ?auto_844365 ) ) ( not ( = ?auto_844363 ?auto_844366 ) ) ( not ( = ?auto_844363 ?auto_844367 ) ) ( not ( = ?auto_844364 ?auto_844365 ) ) ( not ( = ?auto_844364 ?auto_844366 ) ) ( not ( = ?auto_844364 ?auto_844367 ) ) ( not ( = ?auto_844365 ?auto_844366 ) ) ( not ( = ?auto_844365 ?auto_844367 ) ) ( not ( = ?auto_844366 ?auto_844367 ) ) ( ON ?auto_844365 ?auto_844366 ) ( ON ?auto_844364 ?auto_844365 ) ( ON ?auto_844363 ?auto_844364 ) ( ON ?auto_844362 ?auto_844363 ) ( ON ?auto_844361 ?auto_844362 ) ( CLEAR ?auto_844359 ) ( ON ?auto_844360 ?auto_844361 ) ( CLEAR ?auto_844360 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_844349 ?auto_844350 ?auto_844351 ?auto_844352 ?auto_844353 ?auto_844354 ?auto_844355 ?auto_844356 ?auto_844357 ?auto_844358 ?auto_844359 ?auto_844360 )
      ( MAKE-18PILE ?auto_844349 ?auto_844350 ?auto_844351 ?auto_844352 ?auto_844353 ?auto_844354 ?auto_844355 ?auto_844356 ?auto_844357 ?auto_844358 ?auto_844359 ?auto_844360 ?auto_844361 ?auto_844362 ?auto_844363 ?auto_844364 ?auto_844365 ?auto_844366 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_844386 - BLOCK
      ?auto_844387 - BLOCK
      ?auto_844388 - BLOCK
      ?auto_844389 - BLOCK
      ?auto_844390 - BLOCK
      ?auto_844391 - BLOCK
      ?auto_844392 - BLOCK
      ?auto_844393 - BLOCK
      ?auto_844394 - BLOCK
      ?auto_844395 - BLOCK
      ?auto_844396 - BLOCK
      ?auto_844397 - BLOCK
      ?auto_844398 - BLOCK
      ?auto_844399 - BLOCK
      ?auto_844400 - BLOCK
      ?auto_844401 - BLOCK
      ?auto_844402 - BLOCK
      ?auto_844403 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_844403 ) ( ON-TABLE ?auto_844386 ) ( ON ?auto_844387 ?auto_844386 ) ( ON ?auto_844388 ?auto_844387 ) ( ON ?auto_844389 ?auto_844388 ) ( ON ?auto_844390 ?auto_844389 ) ( ON ?auto_844391 ?auto_844390 ) ( ON ?auto_844392 ?auto_844391 ) ( ON ?auto_844393 ?auto_844392 ) ( ON ?auto_844394 ?auto_844393 ) ( ON ?auto_844395 ?auto_844394 ) ( ON ?auto_844396 ?auto_844395 ) ( not ( = ?auto_844386 ?auto_844387 ) ) ( not ( = ?auto_844386 ?auto_844388 ) ) ( not ( = ?auto_844386 ?auto_844389 ) ) ( not ( = ?auto_844386 ?auto_844390 ) ) ( not ( = ?auto_844386 ?auto_844391 ) ) ( not ( = ?auto_844386 ?auto_844392 ) ) ( not ( = ?auto_844386 ?auto_844393 ) ) ( not ( = ?auto_844386 ?auto_844394 ) ) ( not ( = ?auto_844386 ?auto_844395 ) ) ( not ( = ?auto_844386 ?auto_844396 ) ) ( not ( = ?auto_844386 ?auto_844397 ) ) ( not ( = ?auto_844386 ?auto_844398 ) ) ( not ( = ?auto_844386 ?auto_844399 ) ) ( not ( = ?auto_844386 ?auto_844400 ) ) ( not ( = ?auto_844386 ?auto_844401 ) ) ( not ( = ?auto_844386 ?auto_844402 ) ) ( not ( = ?auto_844386 ?auto_844403 ) ) ( not ( = ?auto_844387 ?auto_844388 ) ) ( not ( = ?auto_844387 ?auto_844389 ) ) ( not ( = ?auto_844387 ?auto_844390 ) ) ( not ( = ?auto_844387 ?auto_844391 ) ) ( not ( = ?auto_844387 ?auto_844392 ) ) ( not ( = ?auto_844387 ?auto_844393 ) ) ( not ( = ?auto_844387 ?auto_844394 ) ) ( not ( = ?auto_844387 ?auto_844395 ) ) ( not ( = ?auto_844387 ?auto_844396 ) ) ( not ( = ?auto_844387 ?auto_844397 ) ) ( not ( = ?auto_844387 ?auto_844398 ) ) ( not ( = ?auto_844387 ?auto_844399 ) ) ( not ( = ?auto_844387 ?auto_844400 ) ) ( not ( = ?auto_844387 ?auto_844401 ) ) ( not ( = ?auto_844387 ?auto_844402 ) ) ( not ( = ?auto_844387 ?auto_844403 ) ) ( not ( = ?auto_844388 ?auto_844389 ) ) ( not ( = ?auto_844388 ?auto_844390 ) ) ( not ( = ?auto_844388 ?auto_844391 ) ) ( not ( = ?auto_844388 ?auto_844392 ) ) ( not ( = ?auto_844388 ?auto_844393 ) ) ( not ( = ?auto_844388 ?auto_844394 ) ) ( not ( = ?auto_844388 ?auto_844395 ) ) ( not ( = ?auto_844388 ?auto_844396 ) ) ( not ( = ?auto_844388 ?auto_844397 ) ) ( not ( = ?auto_844388 ?auto_844398 ) ) ( not ( = ?auto_844388 ?auto_844399 ) ) ( not ( = ?auto_844388 ?auto_844400 ) ) ( not ( = ?auto_844388 ?auto_844401 ) ) ( not ( = ?auto_844388 ?auto_844402 ) ) ( not ( = ?auto_844388 ?auto_844403 ) ) ( not ( = ?auto_844389 ?auto_844390 ) ) ( not ( = ?auto_844389 ?auto_844391 ) ) ( not ( = ?auto_844389 ?auto_844392 ) ) ( not ( = ?auto_844389 ?auto_844393 ) ) ( not ( = ?auto_844389 ?auto_844394 ) ) ( not ( = ?auto_844389 ?auto_844395 ) ) ( not ( = ?auto_844389 ?auto_844396 ) ) ( not ( = ?auto_844389 ?auto_844397 ) ) ( not ( = ?auto_844389 ?auto_844398 ) ) ( not ( = ?auto_844389 ?auto_844399 ) ) ( not ( = ?auto_844389 ?auto_844400 ) ) ( not ( = ?auto_844389 ?auto_844401 ) ) ( not ( = ?auto_844389 ?auto_844402 ) ) ( not ( = ?auto_844389 ?auto_844403 ) ) ( not ( = ?auto_844390 ?auto_844391 ) ) ( not ( = ?auto_844390 ?auto_844392 ) ) ( not ( = ?auto_844390 ?auto_844393 ) ) ( not ( = ?auto_844390 ?auto_844394 ) ) ( not ( = ?auto_844390 ?auto_844395 ) ) ( not ( = ?auto_844390 ?auto_844396 ) ) ( not ( = ?auto_844390 ?auto_844397 ) ) ( not ( = ?auto_844390 ?auto_844398 ) ) ( not ( = ?auto_844390 ?auto_844399 ) ) ( not ( = ?auto_844390 ?auto_844400 ) ) ( not ( = ?auto_844390 ?auto_844401 ) ) ( not ( = ?auto_844390 ?auto_844402 ) ) ( not ( = ?auto_844390 ?auto_844403 ) ) ( not ( = ?auto_844391 ?auto_844392 ) ) ( not ( = ?auto_844391 ?auto_844393 ) ) ( not ( = ?auto_844391 ?auto_844394 ) ) ( not ( = ?auto_844391 ?auto_844395 ) ) ( not ( = ?auto_844391 ?auto_844396 ) ) ( not ( = ?auto_844391 ?auto_844397 ) ) ( not ( = ?auto_844391 ?auto_844398 ) ) ( not ( = ?auto_844391 ?auto_844399 ) ) ( not ( = ?auto_844391 ?auto_844400 ) ) ( not ( = ?auto_844391 ?auto_844401 ) ) ( not ( = ?auto_844391 ?auto_844402 ) ) ( not ( = ?auto_844391 ?auto_844403 ) ) ( not ( = ?auto_844392 ?auto_844393 ) ) ( not ( = ?auto_844392 ?auto_844394 ) ) ( not ( = ?auto_844392 ?auto_844395 ) ) ( not ( = ?auto_844392 ?auto_844396 ) ) ( not ( = ?auto_844392 ?auto_844397 ) ) ( not ( = ?auto_844392 ?auto_844398 ) ) ( not ( = ?auto_844392 ?auto_844399 ) ) ( not ( = ?auto_844392 ?auto_844400 ) ) ( not ( = ?auto_844392 ?auto_844401 ) ) ( not ( = ?auto_844392 ?auto_844402 ) ) ( not ( = ?auto_844392 ?auto_844403 ) ) ( not ( = ?auto_844393 ?auto_844394 ) ) ( not ( = ?auto_844393 ?auto_844395 ) ) ( not ( = ?auto_844393 ?auto_844396 ) ) ( not ( = ?auto_844393 ?auto_844397 ) ) ( not ( = ?auto_844393 ?auto_844398 ) ) ( not ( = ?auto_844393 ?auto_844399 ) ) ( not ( = ?auto_844393 ?auto_844400 ) ) ( not ( = ?auto_844393 ?auto_844401 ) ) ( not ( = ?auto_844393 ?auto_844402 ) ) ( not ( = ?auto_844393 ?auto_844403 ) ) ( not ( = ?auto_844394 ?auto_844395 ) ) ( not ( = ?auto_844394 ?auto_844396 ) ) ( not ( = ?auto_844394 ?auto_844397 ) ) ( not ( = ?auto_844394 ?auto_844398 ) ) ( not ( = ?auto_844394 ?auto_844399 ) ) ( not ( = ?auto_844394 ?auto_844400 ) ) ( not ( = ?auto_844394 ?auto_844401 ) ) ( not ( = ?auto_844394 ?auto_844402 ) ) ( not ( = ?auto_844394 ?auto_844403 ) ) ( not ( = ?auto_844395 ?auto_844396 ) ) ( not ( = ?auto_844395 ?auto_844397 ) ) ( not ( = ?auto_844395 ?auto_844398 ) ) ( not ( = ?auto_844395 ?auto_844399 ) ) ( not ( = ?auto_844395 ?auto_844400 ) ) ( not ( = ?auto_844395 ?auto_844401 ) ) ( not ( = ?auto_844395 ?auto_844402 ) ) ( not ( = ?auto_844395 ?auto_844403 ) ) ( not ( = ?auto_844396 ?auto_844397 ) ) ( not ( = ?auto_844396 ?auto_844398 ) ) ( not ( = ?auto_844396 ?auto_844399 ) ) ( not ( = ?auto_844396 ?auto_844400 ) ) ( not ( = ?auto_844396 ?auto_844401 ) ) ( not ( = ?auto_844396 ?auto_844402 ) ) ( not ( = ?auto_844396 ?auto_844403 ) ) ( not ( = ?auto_844397 ?auto_844398 ) ) ( not ( = ?auto_844397 ?auto_844399 ) ) ( not ( = ?auto_844397 ?auto_844400 ) ) ( not ( = ?auto_844397 ?auto_844401 ) ) ( not ( = ?auto_844397 ?auto_844402 ) ) ( not ( = ?auto_844397 ?auto_844403 ) ) ( not ( = ?auto_844398 ?auto_844399 ) ) ( not ( = ?auto_844398 ?auto_844400 ) ) ( not ( = ?auto_844398 ?auto_844401 ) ) ( not ( = ?auto_844398 ?auto_844402 ) ) ( not ( = ?auto_844398 ?auto_844403 ) ) ( not ( = ?auto_844399 ?auto_844400 ) ) ( not ( = ?auto_844399 ?auto_844401 ) ) ( not ( = ?auto_844399 ?auto_844402 ) ) ( not ( = ?auto_844399 ?auto_844403 ) ) ( not ( = ?auto_844400 ?auto_844401 ) ) ( not ( = ?auto_844400 ?auto_844402 ) ) ( not ( = ?auto_844400 ?auto_844403 ) ) ( not ( = ?auto_844401 ?auto_844402 ) ) ( not ( = ?auto_844401 ?auto_844403 ) ) ( not ( = ?auto_844402 ?auto_844403 ) ) ( ON ?auto_844402 ?auto_844403 ) ( ON ?auto_844401 ?auto_844402 ) ( ON ?auto_844400 ?auto_844401 ) ( ON ?auto_844399 ?auto_844400 ) ( ON ?auto_844398 ?auto_844399 ) ( CLEAR ?auto_844396 ) ( ON ?auto_844397 ?auto_844398 ) ( CLEAR ?auto_844397 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_844386 ?auto_844387 ?auto_844388 ?auto_844389 ?auto_844390 ?auto_844391 ?auto_844392 ?auto_844393 ?auto_844394 ?auto_844395 ?auto_844396 ?auto_844397 )
      ( MAKE-18PILE ?auto_844386 ?auto_844387 ?auto_844388 ?auto_844389 ?auto_844390 ?auto_844391 ?auto_844392 ?auto_844393 ?auto_844394 ?auto_844395 ?auto_844396 ?auto_844397 ?auto_844398 ?auto_844399 ?auto_844400 ?auto_844401 ?auto_844402 ?auto_844403 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_844422 - BLOCK
      ?auto_844423 - BLOCK
      ?auto_844424 - BLOCK
      ?auto_844425 - BLOCK
      ?auto_844426 - BLOCK
      ?auto_844427 - BLOCK
      ?auto_844428 - BLOCK
      ?auto_844429 - BLOCK
      ?auto_844430 - BLOCK
      ?auto_844431 - BLOCK
      ?auto_844432 - BLOCK
      ?auto_844433 - BLOCK
      ?auto_844434 - BLOCK
      ?auto_844435 - BLOCK
      ?auto_844436 - BLOCK
      ?auto_844437 - BLOCK
      ?auto_844438 - BLOCK
      ?auto_844439 - BLOCK
    )
    :vars
    (
      ?auto_844440 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_844439 ?auto_844440 ) ( ON-TABLE ?auto_844422 ) ( ON ?auto_844423 ?auto_844422 ) ( ON ?auto_844424 ?auto_844423 ) ( ON ?auto_844425 ?auto_844424 ) ( ON ?auto_844426 ?auto_844425 ) ( ON ?auto_844427 ?auto_844426 ) ( ON ?auto_844428 ?auto_844427 ) ( ON ?auto_844429 ?auto_844428 ) ( ON ?auto_844430 ?auto_844429 ) ( ON ?auto_844431 ?auto_844430 ) ( not ( = ?auto_844422 ?auto_844423 ) ) ( not ( = ?auto_844422 ?auto_844424 ) ) ( not ( = ?auto_844422 ?auto_844425 ) ) ( not ( = ?auto_844422 ?auto_844426 ) ) ( not ( = ?auto_844422 ?auto_844427 ) ) ( not ( = ?auto_844422 ?auto_844428 ) ) ( not ( = ?auto_844422 ?auto_844429 ) ) ( not ( = ?auto_844422 ?auto_844430 ) ) ( not ( = ?auto_844422 ?auto_844431 ) ) ( not ( = ?auto_844422 ?auto_844432 ) ) ( not ( = ?auto_844422 ?auto_844433 ) ) ( not ( = ?auto_844422 ?auto_844434 ) ) ( not ( = ?auto_844422 ?auto_844435 ) ) ( not ( = ?auto_844422 ?auto_844436 ) ) ( not ( = ?auto_844422 ?auto_844437 ) ) ( not ( = ?auto_844422 ?auto_844438 ) ) ( not ( = ?auto_844422 ?auto_844439 ) ) ( not ( = ?auto_844422 ?auto_844440 ) ) ( not ( = ?auto_844423 ?auto_844424 ) ) ( not ( = ?auto_844423 ?auto_844425 ) ) ( not ( = ?auto_844423 ?auto_844426 ) ) ( not ( = ?auto_844423 ?auto_844427 ) ) ( not ( = ?auto_844423 ?auto_844428 ) ) ( not ( = ?auto_844423 ?auto_844429 ) ) ( not ( = ?auto_844423 ?auto_844430 ) ) ( not ( = ?auto_844423 ?auto_844431 ) ) ( not ( = ?auto_844423 ?auto_844432 ) ) ( not ( = ?auto_844423 ?auto_844433 ) ) ( not ( = ?auto_844423 ?auto_844434 ) ) ( not ( = ?auto_844423 ?auto_844435 ) ) ( not ( = ?auto_844423 ?auto_844436 ) ) ( not ( = ?auto_844423 ?auto_844437 ) ) ( not ( = ?auto_844423 ?auto_844438 ) ) ( not ( = ?auto_844423 ?auto_844439 ) ) ( not ( = ?auto_844423 ?auto_844440 ) ) ( not ( = ?auto_844424 ?auto_844425 ) ) ( not ( = ?auto_844424 ?auto_844426 ) ) ( not ( = ?auto_844424 ?auto_844427 ) ) ( not ( = ?auto_844424 ?auto_844428 ) ) ( not ( = ?auto_844424 ?auto_844429 ) ) ( not ( = ?auto_844424 ?auto_844430 ) ) ( not ( = ?auto_844424 ?auto_844431 ) ) ( not ( = ?auto_844424 ?auto_844432 ) ) ( not ( = ?auto_844424 ?auto_844433 ) ) ( not ( = ?auto_844424 ?auto_844434 ) ) ( not ( = ?auto_844424 ?auto_844435 ) ) ( not ( = ?auto_844424 ?auto_844436 ) ) ( not ( = ?auto_844424 ?auto_844437 ) ) ( not ( = ?auto_844424 ?auto_844438 ) ) ( not ( = ?auto_844424 ?auto_844439 ) ) ( not ( = ?auto_844424 ?auto_844440 ) ) ( not ( = ?auto_844425 ?auto_844426 ) ) ( not ( = ?auto_844425 ?auto_844427 ) ) ( not ( = ?auto_844425 ?auto_844428 ) ) ( not ( = ?auto_844425 ?auto_844429 ) ) ( not ( = ?auto_844425 ?auto_844430 ) ) ( not ( = ?auto_844425 ?auto_844431 ) ) ( not ( = ?auto_844425 ?auto_844432 ) ) ( not ( = ?auto_844425 ?auto_844433 ) ) ( not ( = ?auto_844425 ?auto_844434 ) ) ( not ( = ?auto_844425 ?auto_844435 ) ) ( not ( = ?auto_844425 ?auto_844436 ) ) ( not ( = ?auto_844425 ?auto_844437 ) ) ( not ( = ?auto_844425 ?auto_844438 ) ) ( not ( = ?auto_844425 ?auto_844439 ) ) ( not ( = ?auto_844425 ?auto_844440 ) ) ( not ( = ?auto_844426 ?auto_844427 ) ) ( not ( = ?auto_844426 ?auto_844428 ) ) ( not ( = ?auto_844426 ?auto_844429 ) ) ( not ( = ?auto_844426 ?auto_844430 ) ) ( not ( = ?auto_844426 ?auto_844431 ) ) ( not ( = ?auto_844426 ?auto_844432 ) ) ( not ( = ?auto_844426 ?auto_844433 ) ) ( not ( = ?auto_844426 ?auto_844434 ) ) ( not ( = ?auto_844426 ?auto_844435 ) ) ( not ( = ?auto_844426 ?auto_844436 ) ) ( not ( = ?auto_844426 ?auto_844437 ) ) ( not ( = ?auto_844426 ?auto_844438 ) ) ( not ( = ?auto_844426 ?auto_844439 ) ) ( not ( = ?auto_844426 ?auto_844440 ) ) ( not ( = ?auto_844427 ?auto_844428 ) ) ( not ( = ?auto_844427 ?auto_844429 ) ) ( not ( = ?auto_844427 ?auto_844430 ) ) ( not ( = ?auto_844427 ?auto_844431 ) ) ( not ( = ?auto_844427 ?auto_844432 ) ) ( not ( = ?auto_844427 ?auto_844433 ) ) ( not ( = ?auto_844427 ?auto_844434 ) ) ( not ( = ?auto_844427 ?auto_844435 ) ) ( not ( = ?auto_844427 ?auto_844436 ) ) ( not ( = ?auto_844427 ?auto_844437 ) ) ( not ( = ?auto_844427 ?auto_844438 ) ) ( not ( = ?auto_844427 ?auto_844439 ) ) ( not ( = ?auto_844427 ?auto_844440 ) ) ( not ( = ?auto_844428 ?auto_844429 ) ) ( not ( = ?auto_844428 ?auto_844430 ) ) ( not ( = ?auto_844428 ?auto_844431 ) ) ( not ( = ?auto_844428 ?auto_844432 ) ) ( not ( = ?auto_844428 ?auto_844433 ) ) ( not ( = ?auto_844428 ?auto_844434 ) ) ( not ( = ?auto_844428 ?auto_844435 ) ) ( not ( = ?auto_844428 ?auto_844436 ) ) ( not ( = ?auto_844428 ?auto_844437 ) ) ( not ( = ?auto_844428 ?auto_844438 ) ) ( not ( = ?auto_844428 ?auto_844439 ) ) ( not ( = ?auto_844428 ?auto_844440 ) ) ( not ( = ?auto_844429 ?auto_844430 ) ) ( not ( = ?auto_844429 ?auto_844431 ) ) ( not ( = ?auto_844429 ?auto_844432 ) ) ( not ( = ?auto_844429 ?auto_844433 ) ) ( not ( = ?auto_844429 ?auto_844434 ) ) ( not ( = ?auto_844429 ?auto_844435 ) ) ( not ( = ?auto_844429 ?auto_844436 ) ) ( not ( = ?auto_844429 ?auto_844437 ) ) ( not ( = ?auto_844429 ?auto_844438 ) ) ( not ( = ?auto_844429 ?auto_844439 ) ) ( not ( = ?auto_844429 ?auto_844440 ) ) ( not ( = ?auto_844430 ?auto_844431 ) ) ( not ( = ?auto_844430 ?auto_844432 ) ) ( not ( = ?auto_844430 ?auto_844433 ) ) ( not ( = ?auto_844430 ?auto_844434 ) ) ( not ( = ?auto_844430 ?auto_844435 ) ) ( not ( = ?auto_844430 ?auto_844436 ) ) ( not ( = ?auto_844430 ?auto_844437 ) ) ( not ( = ?auto_844430 ?auto_844438 ) ) ( not ( = ?auto_844430 ?auto_844439 ) ) ( not ( = ?auto_844430 ?auto_844440 ) ) ( not ( = ?auto_844431 ?auto_844432 ) ) ( not ( = ?auto_844431 ?auto_844433 ) ) ( not ( = ?auto_844431 ?auto_844434 ) ) ( not ( = ?auto_844431 ?auto_844435 ) ) ( not ( = ?auto_844431 ?auto_844436 ) ) ( not ( = ?auto_844431 ?auto_844437 ) ) ( not ( = ?auto_844431 ?auto_844438 ) ) ( not ( = ?auto_844431 ?auto_844439 ) ) ( not ( = ?auto_844431 ?auto_844440 ) ) ( not ( = ?auto_844432 ?auto_844433 ) ) ( not ( = ?auto_844432 ?auto_844434 ) ) ( not ( = ?auto_844432 ?auto_844435 ) ) ( not ( = ?auto_844432 ?auto_844436 ) ) ( not ( = ?auto_844432 ?auto_844437 ) ) ( not ( = ?auto_844432 ?auto_844438 ) ) ( not ( = ?auto_844432 ?auto_844439 ) ) ( not ( = ?auto_844432 ?auto_844440 ) ) ( not ( = ?auto_844433 ?auto_844434 ) ) ( not ( = ?auto_844433 ?auto_844435 ) ) ( not ( = ?auto_844433 ?auto_844436 ) ) ( not ( = ?auto_844433 ?auto_844437 ) ) ( not ( = ?auto_844433 ?auto_844438 ) ) ( not ( = ?auto_844433 ?auto_844439 ) ) ( not ( = ?auto_844433 ?auto_844440 ) ) ( not ( = ?auto_844434 ?auto_844435 ) ) ( not ( = ?auto_844434 ?auto_844436 ) ) ( not ( = ?auto_844434 ?auto_844437 ) ) ( not ( = ?auto_844434 ?auto_844438 ) ) ( not ( = ?auto_844434 ?auto_844439 ) ) ( not ( = ?auto_844434 ?auto_844440 ) ) ( not ( = ?auto_844435 ?auto_844436 ) ) ( not ( = ?auto_844435 ?auto_844437 ) ) ( not ( = ?auto_844435 ?auto_844438 ) ) ( not ( = ?auto_844435 ?auto_844439 ) ) ( not ( = ?auto_844435 ?auto_844440 ) ) ( not ( = ?auto_844436 ?auto_844437 ) ) ( not ( = ?auto_844436 ?auto_844438 ) ) ( not ( = ?auto_844436 ?auto_844439 ) ) ( not ( = ?auto_844436 ?auto_844440 ) ) ( not ( = ?auto_844437 ?auto_844438 ) ) ( not ( = ?auto_844437 ?auto_844439 ) ) ( not ( = ?auto_844437 ?auto_844440 ) ) ( not ( = ?auto_844438 ?auto_844439 ) ) ( not ( = ?auto_844438 ?auto_844440 ) ) ( not ( = ?auto_844439 ?auto_844440 ) ) ( ON ?auto_844438 ?auto_844439 ) ( ON ?auto_844437 ?auto_844438 ) ( ON ?auto_844436 ?auto_844437 ) ( ON ?auto_844435 ?auto_844436 ) ( ON ?auto_844434 ?auto_844435 ) ( ON ?auto_844433 ?auto_844434 ) ( CLEAR ?auto_844431 ) ( ON ?auto_844432 ?auto_844433 ) ( CLEAR ?auto_844432 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_844422 ?auto_844423 ?auto_844424 ?auto_844425 ?auto_844426 ?auto_844427 ?auto_844428 ?auto_844429 ?auto_844430 ?auto_844431 ?auto_844432 )
      ( MAKE-18PILE ?auto_844422 ?auto_844423 ?auto_844424 ?auto_844425 ?auto_844426 ?auto_844427 ?auto_844428 ?auto_844429 ?auto_844430 ?auto_844431 ?auto_844432 ?auto_844433 ?auto_844434 ?auto_844435 ?auto_844436 ?auto_844437 ?auto_844438 ?auto_844439 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_844459 - BLOCK
      ?auto_844460 - BLOCK
      ?auto_844461 - BLOCK
      ?auto_844462 - BLOCK
      ?auto_844463 - BLOCK
      ?auto_844464 - BLOCK
      ?auto_844465 - BLOCK
      ?auto_844466 - BLOCK
      ?auto_844467 - BLOCK
      ?auto_844468 - BLOCK
      ?auto_844469 - BLOCK
      ?auto_844470 - BLOCK
      ?auto_844471 - BLOCK
      ?auto_844472 - BLOCK
      ?auto_844473 - BLOCK
      ?auto_844474 - BLOCK
      ?auto_844475 - BLOCK
      ?auto_844476 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_844476 ) ( ON-TABLE ?auto_844459 ) ( ON ?auto_844460 ?auto_844459 ) ( ON ?auto_844461 ?auto_844460 ) ( ON ?auto_844462 ?auto_844461 ) ( ON ?auto_844463 ?auto_844462 ) ( ON ?auto_844464 ?auto_844463 ) ( ON ?auto_844465 ?auto_844464 ) ( ON ?auto_844466 ?auto_844465 ) ( ON ?auto_844467 ?auto_844466 ) ( ON ?auto_844468 ?auto_844467 ) ( not ( = ?auto_844459 ?auto_844460 ) ) ( not ( = ?auto_844459 ?auto_844461 ) ) ( not ( = ?auto_844459 ?auto_844462 ) ) ( not ( = ?auto_844459 ?auto_844463 ) ) ( not ( = ?auto_844459 ?auto_844464 ) ) ( not ( = ?auto_844459 ?auto_844465 ) ) ( not ( = ?auto_844459 ?auto_844466 ) ) ( not ( = ?auto_844459 ?auto_844467 ) ) ( not ( = ?auto_844459 ?auto_844468 ) ) ( not ( = ?auto_844459 ?auto_844469 ) ) ( not ( = ?auto_844459 ?auto_844470 ) ) ( not ( = ?auto_844459 ?auto_844471 ) ) ( not ( = ?auto_844459 ?auto_844472 ) ) ( not ( = ?auto_844459 ?auto_844473 ) ) ( not ( = ?auto_844459 ?auto_844474 ) ) ( not ( = ?auto_844459 ?auto_844475 ) ) ( not ( = ?auto_844459 ?auto_844476 ) ) ( not ( = ?auto_844460 ?auto_844461 ) ) ( not ( = ?auto_844460 ?auto_844462 ) ) ( not ( = ?auto_844460 ?auto_844463 ) ) ( not ( = ?auto_844460 ?auto_844464 ) ) ( not ( = ?auto_844460 ?auto_844465 ) ) ( not ( = ?auto_844460 ?auto_844466 ) ) ( not ( = ?auto_844460 ?auto_844467 ) ) ( not ( = ?auto_844460 ?auto_844468 ) ) ( not ( = ?auto_844460 ?auto_844469 ) ) ( not ( = ?auto_844460 ?auto_844470 ) ) ( not ( = ?auto_844460 ?auto_844471 ) ) ( not ( = ?auto_844460 ?auto_844472 ) ) ( not ( = ?auto_844460 ?auto_844473 ) ) ( not ( = ?auto_844460 ?auto_844474 ) ) ( not ( = ?auto_844460 ?auto_844475 ) ) ( not ( = ?auto_844460 ?auto_844476 ) ) ( not ( = ?auto_844461 ?auto_844462 ) ) ( not ( = ?auto_844461 ?auto_844463 ) ) ( not ( = ?auto_844461 ?auto_844464 ) ) ( not ( = ?auto_844461 ?auto_844465 ) ) ( not ( = ?auto_844461 ?auto_844466 ) ) ( not ( = ?auto_844461 ?auto_844467 ) ) ( not ( = ?auto_844461 ?auto_844468 ) ) ( not ( = ?auto_844461 ?auto_844469 ) ) ( not ( = ?auto_844461 ?auto_844470 ) ) ( not ( = ?auto_844461 ?auto_844471 ) ) ( not ( = ?auto_844461 ?auto_844472 ) ) ( not ( = ?auto_844461 ?auto_844473 ) ) ( not ( = ?auto_844461 ?auto_844474 ) ) ( not ( = ?auto_844461 ?auto_844475 ) ) ( not ( = ?auto_844461 ?auto_844476 ) ) ( not ( = ?auto_844462 ?auto_844463 ) ) ( not ( = ?auto_844462 ?auto_844464 ) ) ( not ( = ?auto_844462 ?auto_844465 ) ) ( not ( = ?auto_844462 ?auto_844466 ) ) ( not ( = ?auto_844462 ?auto_844467 ) ) ( not ( = ?auto_844462 ?auto_844468 ) ) ( not ( = ?auto_844462 ?auto_844469 ) ) ( not ( = ?auto_844462 ?auto_844470 ) ) ( not ( = ?auto_844462 ?auto_844471 ) ) ( not ( = ?auto_844462 ?auto_844472 ) ) ( not ( = ?auto_844462 ?auto_844473 ) ) ( not ( = ?auto_844462 ?auto_844474 ) ) ( not ( = ?auto_844462 ?auto_844475 ) ) ( not ( = ?auto_844462 ?auto_844476 ) ) ( not ( = ?auto_844463 ?auto_844464 ) ) ( not ( = ?auto_844463 ?auto_844465 ) ) ( not ( = ?auto_844463 ?auto_844466 ) ) ( not ( = ?auto_844463 ?auto_844467 ) ) ( not ( = ?auto_844463 ?auto_844468 ) ) ( not ( = ?auto_844463 ?auto_844469 ) ) ( not ( = ?auto_844463 ?auto_844470 ) ) ( not ( = ?auto_844463 ?auto_844471 ) ) ( not ( = ?auto_844463 ?auto_844472 ) ) ( not ( = ?auto_844463 ?auto_844473 ) ) ( not ( = ?auto_844463 ?auto_844474 ) ) ( not ( = ?auto_844463 ?auto_844475 ) ) ( not ( = ?auto_844463 ?auto_844476 ) ) ( not ( = ?auto_844464 ?auto_844465 ) ) ( not ( = ?auto_844464 ?auto_844466 ) ) ( not ( = ?auto_844464 ?auto_844467 ) ) ( not ( = ?auto_844464 ?auto_844468 ) ) ( not ( = ?auto_844464 ?auto_844469 ) ) ( not ( = ?auto_844464 ?auto_844470 ) ) ( not ( = ?auto_844464 ?auto_844471 ) ) ( not ( = ?auto_844464 ?auto_844472 ) ) ( not ( = ?auto_844464 ?auto_844473 ) ) ( not ( = ?auto_844464 ?auto_844474 ) ) ( not ( = ?auto_844464 ?auto_844475 ) ) ( not ( = ?auto_844464 ?auto_844476 ) ) ( not ( = ?auto_844465 ?auto_844466 ) ) ( not ( = ?auto_844465 ?auto_844467 ) ) ( not ( = ?auto_844465 ?auto_844468 ) ) ( not ( = ?auto_844465 ?auto_844469 ) ) ( not ( = ?auto_844465 ?auto_844470 ) ) ( not ( = ?auto_844465 ?auto_844471 ) ) ( not ( = ?auto_844465 ?auto_844472 ) ) ( not ( = ?auto_844465 ?auto_844473 ) ) ( not ( = ?auto_844465 ?auto_844474 ) ) ( not ( = ?auto_844465 ?auto_844475 ) ) ( not ( = ?auto_844465 ?auto_844476 ) ) ( not ( = ?auto_844466 ?auto_844467 ) ) ( not ( = ?auto_844466 ?auto_844468 ) ) ( not ( = ?auto_844466 ?auto_844469 ) ) ( not ( = ?auto_844466 ?auto_844470 ) ) ( not ( = ?auto_844466 ?auto_844471 ) ) ( not ( = ?auto_844466 ?auto_844472 ) ) ( not ( = ?auto_844466 ?auto_844473 ) ) ( not ( = ?auto_844466 ?auto_844474 ) ) ( not ( = ?auto_844466 ?auto_844475 ) ) ( not ( = ?auto_844466 ?auto_844476 ) ) ( not ( = ?auto_844467 ?auto_844468 ) ) ( not ( = ?auto_844467 ?auto_844469 ) ) ( not ( = ?auto_844467 ?auto_844470 ) ) ( not ( = ?auto_844467 ?auto_844471 ) ) ( not ( = ?auto_844467 ?auto_844472 ) ) ( not ( = ?auto_844467 ?auto_844473 ) ) ( not ( = ?auto_844467 ?auto_844474 ) ) ( not ( = ?auto_844467 ?auto_844475 ) ) ( not ( = ?auto_844467 ?auto_844476 ) ) ( not ( = ?auto_844468 ?auto_844469 ) ) ( not ( = ?auto_844468 ?auto_844470 ) ) ( not ( = ?auto_844468 ?auto_844471 ) ) ( not ( = ?auto_844468 ?auto_844472 ) ) ( not ( = ?auto_844468 ?auto_844473 ) ) ( not ( = ?auto_844468 ?auto_844474 ) ) ( not ( = ?auto_844468 ?auto_844475 ) ) ( not ( = ?auto_844468 ?auto_844476 ) ) ( not ( = ?auto_844469 ?auto_844470 ) ) ( not ( = ?auto_844469 ?auto_844471 ) ) ( not ( = ?auto_844469 ?auto_844472 ) ) ( not ( = ?auto_844469 ?auto_844473 ) ) ( not ( = ?auto_844469 ?auto_844474 ) ) ( not ( = ?auto_844469 ?auto_844475 ) ) ( not ( = ?auto_844469 ?auto_844476 ) ) ( not ( = ?auto_844470 ?auto_844471 ) ) ( not ( = ?auto_844470 ?auto_844472 ) ) ( not ( = ?auto_844470 ?auto_844473 ) ) ( not ( = ?auto_844470 ?auto_844474 ) ) ( not ( = ?auto_844470 ?auto_844475 ) ) ( not ( = ?auto_844470 ?auto_844476 ) ) ( not ( = ?auto_844471 ?auto_844472 ) ) ( not ( = ?auto_844471 ?auto_844473 ) ) ( not ( = ?auto_844471 ?auto_844474 ) ) ( not ( = ?auto_844471 ?auto_844475 ) ) ( not ( = ?auto_844471 ?auto_844476 ) ) ( not ( = ?auto_844472 ?auto_844473 ) ) ( not ( = ?auto_844472 ?auto_844474 ) ) ( not ( = ?auto_844472 ?auto_844475 ) ) ( not ( = ?auto_844472 ?auto_844476 ) ) ( not ( = ?auto_844473 ?auto_844474 ) ) ( not ( = ?auto_844473 ?auto_844475 ) ) ( not ( = ?auto_844473 ?auto_844476 ) ) ( not ( = ?auto_844474 ?auto_844475 ) ) ( not ( = ?auto_844474 ?auto_844476 ) ) ( not ( = ?auto_844475 ?auto_844476 ) ) ( ON ?auto_844475 ?auto_844476 ) ( ON ?auto_844474 ?auto_844475 ) ( ON ?auto_844473 ?auto_844474 ) ( ON ?auto_844472 ?auto_844473 ) ( ON ?auto_844471 ?auto_844472 ) ( ON ?auto_844470 ?auto_844471 ) ( CLEAR ?auto_844468 ) ( ON ?auto_844469 ?auto_844470 ) ( CLEAR ?auto_844469 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_844459 ?auto_844460 ?auto_844461 ?auto_844462 ?auto_844463 ?auto_844464 ?auto_844465 ?auto_844466 ?auto_844467 ?auto_844468 ?auto_844469 )
      ( MAKE-18PILE ?auto_844459 ?auto_844460 ?auto_844461 ?auto_844462 ?auto_844463 ?auto_844464 ?auto_844465 ?auto_844466 ?auto_844467 ?auto_844468 ?auto_844469 ?auto_844470 ?auto_844471 ?auto_844472 ?auto_844473 ?auto_844474 ?auto_844475 ?auto_844476 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_844495 - BLOCK
      ?auto_844496 - BLOCK
      ?auto_844497 - BLOCK
      ?auto_844498 - BLOCK
      ?auto_844499 - BLOCK
      ?auto_844500 - BLOCK
      ?auto_844501 - BLOCK
      ?auto_844502 - BLOCK
      ?auto_844503 - BLOCK
      ?auto_844504 - BLOCK
      ?auto_844505 - BLOCK
      ?auto_844506 - BLOCK
      ?auto_844507 - BLOCK
      ?auto_844508 - BLOCK
      ?auto_844509 - BLOCK
      ?auto_844510 - BLOCK
      ?auto_844511 - BLOCK
      ?auto_844512 - BLOCK
    )
    :vars
    (
      ?auto_844513 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_844512 ?auto_844513 ) ( ON-TABLE ?auto_844495 ) ( ON ?auto_844496 ?auto_844495 ) ( ON ?auto_844497 ?auto_844496 ) ( ON ?auto_844498 ?auto_844497 ) ( ON ?auto_844499 ?auto_844498 ) ( ON ?auto_844500 ?auto_844499 ) ( ON ?auto_844501 ?auto_844500 ) ( ON ?auto_844502 ?auto_844501 ) ( ON ?auto_844503 ?auto_844502 ) ( not ( = ?auto_844495 ?auto_844496 ) ) ( not ( = ?auto_844495 ?auto_844497 ) ) ( not ( = ?auto_844495 ?auto_844498 ) ) ( not ( = ?auto_844495 ?auto_844499 ) ) ( not ( = ?auto_844495 ?auto_844500 ) ) ( not ( = ?auto_844495 ?auto_844501 ) ) ( not ( = ?auto_844495 ?auto_844502 ) ) ( not ( = ?auto_844495 ?auto_844503 ) ) ( not ( = ?auto_844495 ?auto_844504 ) ) ( not ( = ?auto_844495 ?auto_844505 ) ) ( not ( = ?auto_844495 ?auto_844506 ) ) ( not ( = ?auto_844495 ?auto_844507 ) ) ( not ( = ?auto_844495 ?auto_844508 ) ) ( not ( = ?auto_844495 ?auto_844509 ) ) ( not ( = ?auto_844495 ?auto_844510 ) ) ( not ( = ?auto_844495 ?auto_844511 ) ) ( not ( = ?auto_844495 ?auto_844512 ) ) ( not ( = ?auto_844495 ?auto_844513 ) ) ( not ( = ?auto_844496 ?auto_844497 ) ) ( not ( = ?auto_844496 ?auto_844498 ) ) ( not ( = ?auto_844496 ?auto_844499 ) ) ( not ( = ?auto_844496 ?auto_844500 ) ) ( not ( = ?auto_844496 ?auto_844501 ) ) ( not ( = ?auto_844496 ?auto_844502 ) ) ( not ( = ?auto_844496 ?auto_844503 ) ) ( not ( = ?auto_844496 ?auto_844504 ) ) ( not ( = ?auto_844496 ?auto_844505 ) ) ( not ( = ?auto_844496 ?auto_844506 ) ) ( not ( = ?auto_844496 ?auto_844507 ) ) ( not ( = ?auto_844496 ?auto_844508 ) ) ( not ( = ?auto_844496 ?auto_844509 ) ) ( not ( = ?auto_844496 ?auto_844510 ) ) ( not ( = ?auto_844496 ?auto_844511 ) ) ( not ( = ?auto_844496 ?auto_844512 ) ) ( not ( = ?auto_844496 ?auto_844513 ) ) ( not ( = ?auto_844497 ?auto_844498 ) ) ( not ( = ?auto_844497 ?auto_844499 ) ) ( not ( = ?auto_844497 ?auto_844500 ) ) ( not ( = ?auto_844497 ?auto_844501 ) ) ( not ( = ?auto_844497 ?auto_844502 ) ) ( not ( = ?auto_844497 ?auto_844503 ) ) ( not ( = ?auto_844497 ?auto_844504 ) ) ( not ( = ?auto_844497 ?auto_844505 ) ) ( not ( = ?auto_844497 ?auto_844506 ) ) ( not ( = ?auto_844497 ?auto_844507 ) ) ( not ( = ?auto_844497 ?auto_844508 ) ) ( not ( = ?auto_844497 ?auto_844509 ) ) ( not ( = ?auto_844497 ?auto_844510 ) ) ( not ( = ?auto_844497 ?auto_844511 ) ) ( not ( = ?auto_844497 ?auto_844512 ) ) ( not ( = ?auto_844497 ?auto_844513 ) ) ( not ( = ?auto_844498 ?auto_844499 ) ) ( not ( = ?auto_844498 ?auto_844500 ) ) ( not ( = ?auto_844498 ?auto_844501 ) ) ( not ( = ?auto_844498 ?auto_844502 ) ) ( not ( = ?auto_844498 ?auto_844503 ) ) ( not ( = ?auto_844498 ?auto_844504 ) ) ( not ( = ?auto_844498 ?auto_844505 ) ) ( not ( = ?auto_844498 ?auto_844506 ) ) ( not ( = ?auto_844498 ?auto_844507 ) ) ( not ( = ?auto_844498 ?auto_844508 ) ) ( not ( = ?auto_844498 ?auto_844509 ) ) ( not ( = ?auto_844498 ?auto_844510 ) ) ( not ( = ?auto_844498 ?auto_844511 ) ) ( not ( = ?auto_844498 ?auto_844512 ) ) ( not ( = ?auto_844498 ?auto_844513 ) ) ( not ( = ?auto_844499 ?auto_844500 ) ) ( not ( = ?auto_844499 ?auto_844501 ) ) ( not ( = ?auto_844499 ?auto_844502 ) ) ( not ( = ?auto_844499 ?auto_844503 ) ) ( not ( = ?auto_844499 ?auto_844504 ) ) ( not ( = ?auto_844499 ?auto_844505 ) ) ( not ( = ?auto_844499 ?auto_844506 ) ) ( not ( = ?auto_844499 ?auto_844507 ) ) ( not ( = ?auto_844499 ?auto_844508 ) ) ( not ( = ?auto_844499 ?auto_844509 ) ) ( not ( = ?auto_844499 ?auto_844510 ) ) ( not ( = ?auto_844499 ?auto_844511 ) ) ( not ( = ?auto_844499 ?auto_844512 ) ) ( not ( = ?auto_844499 ?auto_844513 ) ) ( not ( = ?auto_844500 ?auto_844501 ) ) ( not ( = ?auto_844500 ?auto_844502 ) ) ( not ( = ?auto_844500 ?auto_844503 ) ) ( not ( = ?auto_844500 ?auto_844504 ) ) ( not ( = ?auto_844500 ?auto_844505 ) ) ( not ( = ?auto_844500 ?auto_844506 ) ) ( not ( = ?auto_844500 ?auto_844507 ) ) ( not ( = ?auto_844500 ?auto_844508 ) ) ( not ( = ?auto_844500 ?auto_844509 ) ) ( not ( = ?auto_844500 ?auto_844510 ) ) ( not ( = ?auto_844500 ?auto_844511 ) ) ( not ( = ?auto_844500 ?auto_844512 ) ) ( not ( = ?auto_844500 ?auto_844513 ) ) ( not ( = ?auto_844501 ?auto_844502 ) ) ( not ( = ?auto_844501 ?auto_844503 ) ) ( not ( = ?auto_844501 ?auto_844504 ) ) ( not ( = ?auto_844501 ?auto_844505 ) ) ( not ( = ?auto_844501 ?auto_844506 ) ) ( not ( = ?auto_844501 ?auto_844507 ) ) ( not ( = ?auto_844501 ?auto_844508 ) ) ( not ( = ?auto_844501 ?auto_844509 ) ) ( not ( = ?auto_844501 ?auto_844510 ) ) ( not ( = ?auto_844501 ?auto_844511 ) ) ( not ( = ?auto_844501 ?auto_844512 ) ) ( not ( = ?auto_844501 ?auto_844513 ) ) ( not ( = ?auto_844502 ?auto_844503 ) ) ( not ( = ?auto_844502 ?auto_844504 ) ) ( not ( = ?auto_844502 ?auto_844505 ) ) ( not ( = ?auto_844502 ?auto_844506 ) ) ( not ( = ?auto_844502 ?auto_844507 ) ) ( not ( = ?auto_844502 ?auto_844508 ) ) ( not ( = ?auto_844502 ?auto_844509 ) ) ( not ( = ?auto_844502 ?auto_844510 ) ) ( not ( = ?auto_844502 ?auto_844511 ) ) ( not ( = ?auto_844502 ?auto_844512 ) ) ( not ( = ?auto_844502 ?auto_844513 ) ) ( not ( = ?auto_844503 ?auto_844504 ) ) ( not ( = ?auto_844503 ?auto_844505 ) ) ( not ( = ?auto_844503 ?auto_844506 ) ) ( not ( = ?auto_844503 ?auto_844507 ) ) ( not ( = ?auto_844503 ?auto_844508 ) ) ( not ( = ?auto_844503 ?auto_844509 ) ) ( not ( = ?auto_844503 ?auto_844510 ) ) ( not ( = ?auto_844503 ?auto_844511 ) ) ( not ( = ?auto_844503 ?auto_844512 ) ) ( not ( = ?auto_844503 ?auto_844513 ) ) ( not ( = ?auto_844504 ?auto_844505 ) ) ( not ( = ?auto_844504 ?auto_844506 ) ) ( not ( = ?auto_844504 ?auto_844507 ) ) ( not ( = ?auto_844504 ?auto_844508 ) ) ( not ( = ?auto_844504 ?auto_844509 ) ) ( not ( = ?auto_844504 ?auto_844510 ) ) ( not ( = ?auto_844504 ?auto_844511 ) ) ( not ( = ?auto_844504 ?auto_844512 ) ) ( not ( = ?auto_844504 ?auto_844513 ) ) ( not ( = ?auto_844505 ?auto_844506 ) ) ( not ( = ?auto_844505 ?auto_844507 ) ) ( not ( = ?auto_844505 ?auto_844508 ) ) ( not ( = ?auto_844505 ?auto_844509 ) ) ( not ( = ?auto_844505 ?auto_844510 ) ) ( not ( = ?auto_844505 ?auto_844511 ) ) ( not ( = ?auto_844505 ?auto_844512 ) ) ( not ( = ?auto_844505 ?auto_844513 ) ) ( not ( = ?auto_844506 ?auto_844507 ) ) ( not ( = ?auto_844506 ?auto_844508 ) ) ( not ( = ?auto_844506 ?auto_844509 ) ) ( not ( = ?auto_844506 ?auto_844510 ) ) ( not ( = ?auto_844506 ?auto_844511 ) ) ( not ( = ?auto_844506 ?auto_844512 ) ) ( not ( = ?auto_844506 ?auto_844513 ) ) ( not ( = ?auto_844507 ?auto_844508 ) ) ( not ( = ?auto_844507 ?auto_844509 ) ) ( not ( = ?auto_844507 ?auto_844510 ) ) ( not ( = ?auto_844507 ?auto_844511 ) ) ( not ( = ?auto_844507 ?auto_844512 ) ) ( not ( = ?auto_844507 ?auto_844513 ) ) ( not ( = ?auto_844508 ?auto_844509 ) ) ( not ( = ?auto_844508 ?auto_844510 ) ) ( not ( = ?auto_844508 ?auto_844511 ) ) ( not ( = ?auto_844508 ?auto_844512 ) ) ( not ( = ?auto_844508 ?auto_844513 ) ) ( not ( = ?auto_844509 ?auto_844510 ) ) ( not ( = ?auto_844509 ?auto_844511 ) ) ( not ( = ?auto_844509 ?auto_844512 ) ) ( not ( = ?auto_844509 ?auto_844513 ) ) ( not ( = ?auto_844510 ?auto_844511 ) ) ( not ( = ?auto_844510 ?auto_844512 ) ) ( not ( = ?auto_844510 ?auto_844513 ) ) ( not ( = ?auto_844511 ?auto_844512 ) ) ( not ( = ?auto_844511 ?auto_844513 ) ) ( not ( = ?auto_844512 ?auto_844513 ) ) ( ON ?auto_844511 ?auto_844512 ) ( ON ?auto_844510 ?auto_844511 ) ( ON ?auto_844509 ?auto_844510 ) ( ON ?auto_844508 ?auto_844509 ) ( ON ?auto_844507 ?auto_844508 ) ( ON ?auto_844506 ?auto_844507 ) ( ON ?auto_844505 ?auto_844506 ) ( CLEAR ?auto_844503 ) ( ON ?auto_844504 ?auto_844505 ) ( CLEAR ?auto_844504 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_844495 ?auto_844496 ?auto_844497 ?auto_844498 ?auto_844499 ?auto_844500 ?auto_844501 ?auto_844502 ?auto_844503 ?auto_844504 )
      ( MAKE-18PILE ?auto_844495 ?auto_844496 ?auto_844497 ?auto_844498 ?auto_844499 ?auto_844500 ?auto_844501 ?auto_844502 ?auto_844503 ?auto_844504 ?auto_844505 ?auto_844506 ?auto_844507 ?auto_844508 ?auto_844509 ?auto_844510 ?auto_844511 ?auto_844512 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_844532 - BLOCK
      ?auto_844533 - BLOCK
      ?auto_844534 - BLOCK
      ?auto_844535 - BLOCK
      ?auto_844536 - BLOCK
      ?auto_844537 - BLOCK
      ?auto_844538 - BLOCK
      ?auto_844539 - BLOCK
      ?auto_844540 - BLOCK
      ?auto_844541 - BLOCK
      ?auto_844542 - BLOCK
      ?auto_844543 - BLOCK
      ?auto_844544 - BLOCK
      ?auto_844545 - BLOCK
      ?auto_844546 - BLOCK
      ?auto_844547 - BLOCK
      ?auto_844548 - BLOCK
      ?auto_844549 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_844549 ) ( ON-TABLE ?auto_844532 ) ( ON ?auto_844533 ?auto_844532 ) ( ON ?auto_844534 ?auto_844533 ) ( ON ?auto_844535 ?auto_844534 ) ( ON ?auto_844536 ?auto_844535 ) ( ON ?auto_844537 ?auto_844536 ) ( ON ?auto_844538 ?auto_844537 ) ( ON ?auto_844539 ?auto_844538 ) ( ON ?auto_844540 ?auto_844539 ) ( not ( = ?auto_844532 ?auto_844533 ) ) ( not ( = ?auto_844532 ?auto_844534 ) ) ( not ( = ?auto_844532 ?auto_844535 ) ) ( not ( = ?auto_844532 ?auto_844536 ) ) ( not ( = ?auto_844532 ?auto_844537 ) ) ( not ( = ?auto_844532 ?auto_844538 ) ) ( not ( = ?auto_844532 ?auto_844539 ) ) ( not ( = ?auto_844532 ?auto_844540 ) ) ( not ( = ?auto_844532 ?auto_844541 ) ) ( not ( = ?auto_844532 ?auto_844542 ) ) ( not ( = ?auto_844532 ?auto_844543 ) ) ( not ( = ?auto_844532 ?auto_844544 ) ) ( not ( = ?auto_844532 ?auto_844545 ) ) ( not ( = ?auto_844532 ?auto_844546 ) ) ( not ( = ?auto_844532 ?auto_844547 ) ) ( not ( = ?auto_844532 ?auto_844548 ) ) ( not ( = ?auto_844532 ?auto_844549 ) ) ( not ( = ?auto_844533 ?auto_844534 ) ) ( not ( = ?auto_844533 ?auto_844535 ) ) ( not ( = ?auto_844533 ?auto_844536 ) ) ( not ( = ?auto_844533 ?auto_844537 ) ) ( not ( = ?auto_844533 ?auto_844538 ) ) ( not ( = ?auto_844533 ?auto_844539 ) ) ( not ( = ?auto_844533 ?auto_844540 ) ) ( not ( = ?auto_844533 ?auto_844541 ) ) ( not ( = ?auto_844533 ?auto_844542 ) ) ( not ( = ?auto_844533 ?auto_844543 ) ) ( not ( = ?auto_844533 ?auto_844544 ) ) ( not ( = ?auto_844533 ?auto_844545 ) ) ( not ( = ?auto_844533 ?auto_844546 ) ) ( not ( = ?auto_844533 ?auto_844547 ) ) ( not ( = ?auto_844533 ?auto_844548 ) ) ( not ( = ?auto_844533 ?auto_844549 ) ) ( not ( = ?auto_844534 ?auto_844535 ) ) ( not ( = ?auto_844534 ?auto_844536 ) ) ( not ( = ?auto_844534 ?auto_844537 ) ) ( not ( = ?auto_844534 ?auto_844538 ) ) ( not ( = ?auto_844534 ?auto_844539 ) ) ( not ( = ?auto_844534 ?auto_844540 ) ) ( not ( = ?auto_844534 ?auto_844541 ) ) ( not ( = ?auto_844534 ?auto_844542 ) ) ( not ( = ?auto_844534 ?auto_844543 ) ) ( not ( = ?auto_844534 ?auto_844544 ) ) ( not ( = ?auto_844534 ?auto_844545 ) ) ( not ( = ?auto_844534 ?auto_844546 ) ) ( not ( = ?auto_844534 ?auto_844547 ) ) ( not ( = ?auto_844534 ?auto_844548 ) ) ( not ( = ?auto_844534 ?auto_844549 ) ) ( not ( = ?auto_844535 ?auto_844536 ) ) ( not ( = ?auto_844535 ?auto_844537 ) ) ( not ( = ?auto_844535 ?auto_844538 ) ) ( not ( = ?auto_844535 ?auto_844539 ) ) ( not ( = ?auto_844535 ?auto_844540 ) ) ( not ( = ?auto_844535 ?auto_844541 ) ) ( not ( = ?auto_844535 ?auto_844542 ) ) ( not ( = ?auto_844535 ?auto_844543 ) ) ( not ( = ?auto_844535 ?auto_844544 ) ) ( not ( = ?auto_844535 ?auto_844545 ) ) ( not ( = ?auto_844535 ?auto_844546 ) ) ( not ( = ?auto_844535 ?auto_844547 ) ) ( not ( = ?auto_844535 ?auto_844548 ) ) ( not ( = ?auto_844535 ?auto_844549 ) ) ( not ( = ?auto_844536 ?auto_844537 ) ) ( not ( = ?auto_844536 ?auto_844538 ) ) ( not ( = ?auto_844536 ?auto_844539 ) ) ( not ( = ?auto_844536 ?auto_844540 ) ) ( not ( = ?auto_844536 ?auto_844541 ) ) ( not ( = ?auto_844536 ?auto_844542 ) ) ( not ( = ?auto_844536 ?auto_844543 ) ) ( not ( = ?auto_844536 ?auto_844544 ) ) ( not ( = ?auto_844536 ?auto_844545 ) ) ( not ( = ?auto_844536 ?auto_844546 ) ) ( not ( = ?auto_844536 ?auto_844547 ) ) ( not ( = ?auto_844536 ?auto_844548 ) ) ( not ( = ?auto_844536 ?auto_844549 ) ) ( not ( = ?auto_844537 ?auto_844538 ) ) ( not ( = ?auto_844537 ?auto_844539 ) ) ( not ( = ?auto_844537 ?auto_844540 ) ) ( not ( = ?auto_844537 ?auto_844541 ) ) ( not ( = ?auto_844537 ?auto_844542 ) ) ( not ( = ?auto_844537 ?auto_844543 ) ) ( not ( = ?auto_844537 ?auto_844544 ) ) ( not ( = ?auto_844537 ?auto_844545 ) ) ( not ( = ?auto_844537 ?auto_844546 ) ) ( not ( = ?auto_844537 ?auto_844547 ) ) ( not ( = ?auto_844537 ?auto_844548 ) ) ( not ( = ?auto_844537 ?auto_844549 ) ) ( not ( = ?auto_844538 ?auto_844539 ) ) ( not ( = ?auto_844538 ?auto_844540 ) ) ( not ( = ?auto_844538 ?auto_844541 ) ) ( not ( = ?auto_844538 ?auto_844542 ) ) ( not ( = ?auto_844538 ?auto_844543 ) ) ( not ( = ?auto_844538 ?auto_844544 ) ) ( not ( = ?auto_844538 ?auto_844545 ) ) ( not ( = ?auto_844538 ?auto_844546 ) ) ( not ( = ?auto_844538 ?auto_844547 ) ) ( not ( = ?auto_844538 ?auto_844548 ) ) ( not ( = ?auto_844538 ?auto_844549 ) ) ( not ( = ?auto_844539 ?auto_844540 ) ) ( not ( = ?auto_844539 ?auto_844541 ) ) ( not ( = ?auto_844539 ?auto_844542 ) ) ( not ( = ?auto_844539 ?auto_844543 ) ) ( not ( = ?auto_844539 ?auto_844544 ) ) ( not ( = ?auto_844539 ?auto_844545 ) ) ( not ( = ?auto_844539 ?auto_844546 ) ) ( not ( = ?auto_844539 ?auto_844547 ) ) ( not ( = ?auto_844539 ?auto_844548 ) ) ( not ( = ?auto_844539 ?auto_844549 ) ) ( not ( = ?auto_844540 ?auto_844541 ) ) ( not ( = ?auto_844540 ?auto_844542 ) ) ( not ( = ?auto_844540 ?auto_844543 ) ) ( not ( = ?auto_844540 ?auto_844544 ) ) ( not ( = ?auto_844540 ?auto_844545 ) ) ( not ( = ?auto_844540 ?auto_844546 ) ) ( not ( = ?auto_844540 ?auto_844547 ) ) ( not ( = ?auto_844540 ?auto_844548 ) ) ( not ( = ?auto_844540 ?auto_844549 ) ) ( not ( = ?auto_844541 ?auto_844542 ) ) ( not ( = ?auto_844541 ?auto_844543 ) ) ( not ( = ?auto_844541 ?auto_844544 ) ) ( not ( = ?auto_844541 ?auto_844545 ) ) ( not ( = ?auto_844541 ?auto_844546 ) ) ( not ( = ?auto_844541 ?auto_844547 ) ) ( not ( = ?auto_844541 ?auto_844548 ) ) ( not ( = ?auto_844541 ?auto_844549 ) ) ( not ( = ?auto_844542 ?auto_844543 ) ) ( not ( = ?auto_844542 ?auto_844544 ) ) ( not ( = ?auto_844542 ?auto_844545 ) ) ( not ( = ?auto_844542 ?auto_844546 ) ) ( not ( = ?auto_844542 ?auto_844547 ) ) ( not ( = ?auto_844542 ?auto_844548 ) ) ( not ( = ?auto_844542 ?auto_844549 ) ) ( not ( = ?auto_844543 ?auto_844544 ) ) ( not ( = ?auto_844543 ?auto_844545 ) ) ( not ( = ?auto_844543 ?auto_844546 ) ) ( not ( = ?auto_844543 ?auto_844547 ) ) ( not ( = ?auto_844543 ?auto_844548 ) ) ( not ( = ?auto_844543 ?auto_844549 ) ) ( not ( = ?auto_844544 ?auto_844545 ) ) ( not ( = ?auto_844544 ?auto_844546 ) ) ( not ( = ?auto_844544 ?auto_844547 ) ) ( not ( = ?auto_844544 ?auto_844548 ) ) ( not ( = ?auto_844544 ?auto_844549 ) ) ( not ( = ?auto_844545 ?auto_844546 ) ) ( not ( = ?auto_844545 ?auto_844547 ) ) ( not ( = ?auto_844545 ?auto_844548 ) ) ( not ( = ?auto_844545 ?auto_844549 ) ) ( not ( = ?auto_844546 ?auto_844547 ) ) ( not ( = ?auto_844546 ?auto_844548 ) ) ( not ( = ?auto_844546 ?auto_844549 ) ) ( not ( = ?auto_844547 ?auto_844548 ) ) ( not ( = ?auto_844547 ?auto_844549 ) ) ( not ( = ?auto_844548 ?auto_844549 ) ) ( ON ?auto_844548 ?auto_844549 ) ( ON ?auto_844547 ?auto_844548 ) ( ON ?auto_844546 ?auto_844547 ) ( ON ?auto_844545 ?auto_844546 ) ( ON ?auto_844544 ?auto_844545 ) ( ON ?auto_844543 ?auto_844544 ) ( ON ?auto_844542 ?auto_844543 ) ( CLEAR ?auto_844540 ) ( ON ?auto_844541 ?auto_844542 ) ( CLEAR ?auto_844541 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_844532 ?auto_844533 ?auto_844534 ?auto_844535 ?auto_844536 ?auto_844537 ?auto_844538 ?auto_844539 ?auto_844540 ?auto_844541 )
      ( MAKE-18PILE ?auto_844532 ?auto_844533 ?auto_844534 ?auto_844535 ?auto_844536 ?auto_844537 ?auto_844538 ?auto_844539 ?auto_844540 ?auto_844541 ?auto_844542 ?auto_844543 ?auto_844544 ?auto_844545 ?auto_844546 ?auto_844547 ?auto_844548 ?auto_844549 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_844568 - BLOCK
      ?auto_844569 - BLOCK
      ?auto_844570 - BLOCK
      ?auto_844571 - BLOCK
      ?auto_844572 - BLOCK
      ?auto_844573 - BLOCK
      ?auto_844574 - BLOCK
      ?auto_844575 - BLOCK
      ?auto_844576 - BLOCK
      ?auto_844577 - BLOCK
      ?auto_844578 - BLOCK
      ?auto_844579 - BLOCK
      ?auto_844580 - BLOCK
      ?auto_844581 - BLOCK
      ?auto_844582 - BLOCK
      ?auto_844583 - BLOCK
      ?auto_844584 - BLOCK
      ?auto_844585 - BLOCK
    )
    :vars
    (
      ?auto_844586 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_844585 ?auto_844586 ) ( ON-TABLE ?auto_844568 ) ( ON ?auto_844569 ?auto_844568 ) ( ON ?auto_844570 ?auto_844569 ) ( ON ?auto_844571 ?auto_844570 ) ( ON ?auto_844572 ?auto_844571 ) ( ON ?auto_844573 ?auto_844572 ) ( ON ?auto_844574 ?auto_844573 ) ( ON ?auto_844575 ?auto_844574 ) ( not ( = ?auto_844568 ?auto_844569 ) ) ( not ( = ?auto_844568 ?auto_844570 ) ) ( not ( = ?auto_844568 ?auto_844571 ) ) ( not ( = ?auto_844568 ?auto_844572 ) ) ( not ( = ?auto_844568 ?auto_844573 ) ) ( not ( = ?auto_844568 ?auto_844574 ) ) ( not ( = ?auto_844568 ?auto_844575 ) ) ( not ( = ?auto_844568 ?auto_844576 ) ) ( not ( = ?auto_844568 ?auto_844577 ) ) ( not ( = ?auto_844568 ?auto_844578 ) ) ( not ( = ?auto_844568 ?auto_844579 ) ) ( not ( = ?auto_844568 ?auto_844580 ) ) ( not ( = ?auto_844568 ?auto_844581 ) ) ( not ( = ?auto_844568 ?auto_844582 ) ) ( not ( = ?auto_844568 ?auto_844583 ) ) ( not ( = ?auto_844568 ?auto_844584 ) ) ( not ( = ?auto_844568 ?auto_844585 ) ) ( not ( = ?auto_844568 ?auto_844586 ) ) ( not ( = ?auto_844569 ?auto_844570 ) ) ( not ( = ?auto_844569 ?auto_844571 ) ) ( not ( = ?auto_844569 ?auto_844572 ) ) ( not ( = ?auto_844569 ?auto_844573 ) ) ( not ( = ?auto_844569 ?auto_844574 ) ) ( not ( = ?auto_844569 ?auto_844575 ) ) ( not ( = ?auto_844569 ?auto_844576 ) ) ( not ( = ?auto_844569 ?auto_844577 ) ) ( not ( = ?auto_844569 ?auto_844578 ) ) ( not ( = ?auto_844569 ?auto_844579 ) ) ( not ( = ?auto_844569 ?auto_844580 ) ) ( not ( = ?auto_844569 ?auto_844581 ) ) ( not ( = ?auto_844569 ?auto_844582 ) ) ( not ( = ?auto_844569 ?auto_844583 ) ) ( not ( = ?auto_844569 ?auto_844584 ) ) ( not ( = ?auto_844569 ?auto_844585 ) ) ( not ( = ?auto_844569 ?auto_844586 ) ) ( not ( = ?auto_844570 ?auto_844571 ) ) ( not ( = ?auto_844570 ?auto_844572 ) ) ( not ( = ?auto_844570 ?auto_844573 ) ) ( not ( = ?auto_844570 ?auto_844574 ) ) ( not ( = ?auto_844570 ?auto_844575 ) ) ( not ( = ?auto_844570 ?auto_844576 ) ) ( not ( = ?auto_844570 ?auto_844577 ) ) ( not ( = ?auto_844570 ?auto_844578 ) ) ( not ( = ?auto_844570 ?auto_844579 ) ) ( not ( = ?auto_844570 ?auto_844580 ) ) ( not ( = ?auto_844570 ?auto_844581 ) ) ( not ( = ?auto_844570 ?auto_844582 ) ) ( not ( = ?auto_844570 ?auto_844583 ) ) ( not ( = ?auto_844570 ?auto_844584 ) ) ( not ( = ?auto_844570 ?auto_844585 ) ) ( not ( = ?auto_844570 ?auto_844586 ) ) ( not ( = ?auto_844571 ?auto_844572 ) ) ( not ( = ?auto_844571 ?auto_844573 ) ) ( not ( = ?auto_844571 ?auto_844574 ) ) ( not ( = ?auto_844571 ?auto_844575 ) ) ( not ( = ?auto_844571 ?auto_844576 ) ) ( not ( = ?auto_844571 ?auto_844577 ) ) ( not ( = ?auto_844571 ?auto_844578 ) ) ( not ( = ?auto_844571 ?auto_844579 ) ) ( not ( = ?auto_844571 ?auto_844580 ) ) ( not ( = ?auto_844571 ?auto_844581 ) ) ( not ( = ?auto_844571 ?auto_844582 ) ) ( not ( = ?auto_844571 ?auto_844583 ) ) ( not ( = ?auto_844571 ?auto_844584 ) ) ( not ( = ?auto_844571 ?auto_844585 ) ) ( not ( = ?auto_844571 ?auto_844586 ) ) ( not ( = ?auto_844572 ?auto_844573 ) ) ( not ( = ?auto_844572 ?auto_844574 ) ) ( not ( = ?auto_844572 ?auto_844575 ) ) ( not ( = ?auto_844572 ?auto_844576 ) ) ( not ( = ?auto_844572 ?auto_844577 ) ) ( not ( = ?auto_844572 ?auto_844578 ) ) ( not ( = ?auto_844572 ?auto_844579 ) ) ( not ( = ?auto_844572 ?auto_844580 ) ) ( not ( = ?auto_844572 ?auto_844581 ) ) ( not ( = ?auto_844572 ?auto_844582 ) ) ( not ( = ?auto_844572 ?auto_844583 ) ) ( not ( = ?auto_844572 ?auto_844584 ) ) ( not ( = ?auto_844572 ?auto_844585 ) ) ( not ( = ?auto_844572 ?auto_844586 ) ) ( not ( = ?auto_844573 ?auto_844574 ) ) ( not ( = ?auto_844573 ?auto_844575 ) ) ( not ( = ?auto_844573 ?auto_844576 ) ) ( not ( = ?auto_844573 ?auto_844577 ) ) ( not ( = ?auto_844573 ?auto_844578 ) ) ( not ( = ?auto_844573 ?auto_844579 ) ) ( not ( = ?auto_844573 ?auto_844580 ) ) ( not ( = ?auto_844573 ?auto_844581 ) ) ( not ( = ?auto_844573 ?auto_844582 ) ) ( not ( = ?auto_844573 ?auto_844583 ) ) ( not ( = ?auto_844573 ?auto_844584 ) ) ( not ( = ?auto_844573 ?auto_844585 ) ) ( not ( = ?auto_844573 ?auto_844586 ) ) ( not ( = ?auto_844574 ?auto_844575 ) ) ( not ( = ?auto_844574 ?auto_844576 ) ) ( not ( = ?auto_844574 ?auto_844577 ) ) ( not ( = ?auto_844574 ?auto_844578 ) ) ( not ( = ?auto_844574 ?auto_844579 ) ) ( not ( = ?auto_844574 ?auto_844580 ) ) ( not ( = ?auto_844574 ?auto_844581 ) ) ( not ( = ?auto_844574 ?auto_844582 ) ) ( not ( = ?auto_844574 ?auto_844583 ) ) ( not ( = ?auto_844574 ?auto_844584 ) ) ( not ( = ?auto_844574 ?auto_844585 ) ) ( not ( = ?auto_844574 ?auto_844586 ) ) ( not ( = ?auto_844575 ?auto_844576 ) ) ( not ( = ?auto_844575 ?auto_844577 ) ) ( not ( = ?auto_844575 ?auto_844578 ) ) ( not ( = ?auto_844575 ?auto_844579 ) ) ( not ( = ?auto_844575 ?auto_844580 ) ) ( not ( = ?auto_844575 ?auto_844581 ) ) ( not ( = ?auto_844575 ?auto_844582 ) ) ( not ( = ?auto_844575 ?auto_844583 ) ) ( not ( = ?auto_844575 ?auto_844584 ) ) ( not ( = ?auto_844575 ?auto_844585 ) ) ( not ( = ?auto_844575 ?auto_844586 ) ) ( not ( = ?auto_844576 ?auto_844577 ) ) ( not ( = ?auto_844576 ?auto_844578 ) ) ( not ( = ?auto_844576 ?auto_844579 ) ) ( not ( = ?auto_844576 ?auto_844580 ) ) ( not ( = ?auto_844576 ?auto_844581 ) ) ( not ( = ?auto_844576 ?auto_844582 ) ) ( not ( = ?auto_844576 ?auto_844583 ) ) ( not ( = ?auto_844576 ?auto_844584 ) ) ( not ( = ?auto_844576 ?auto_844585 ) ) ( not ( = ?auto_844576 ?auto_844586 ) ) ( not ( = ?auto_844577 ?auto_844578 ) ) ( not ( = ?auto_844577 ?auto_844579 ) ) ( not ( = ?auto_844577 ?auto_844580 ) ) ( not ( = ?auto_844577 ?auto_844581 ) ) ( not ( = ?auto_844577 ?auto_844582 ) ) ( not ( = ?auto_844577 ?auto_844583 ) ) ( not ( = ?auto_844577 ?auto_844584 ) ) ( not ( = ?auto_844577 ?auto_844585 ) ) ( not ( = ?auto_844577 ?auto_844586 ) ) ( not ( = ?auto_844578 ?auto_844579 ) ) ( not ( = ?auto_844578 ?auto_844580 ) ) ( not ( = ?auto_844578 ?auto_844581 ) ) ( not ( = ?auto_844578 ?auto_844582 ) ) ( not ( = ?auto_844578 ?auto_844583 ) ) ( not ( = ?auto_844578 ?auto_844584 ) ) ( not ( = ?auto_844578 ?auto_844585 ) ) ( not ( = ?auto_844578 ?auto_844586 ) ) ( not ( = ?auto_844579 ?auto_844580 ) ) ( not ( = ?auto_844579 ?auto_844581 ) ) ( not ( = ?auto_844579 ?auto_844582 ) ) ( not ( = ?auto_844579 ?auto_844583 ) ) ( not ( = ?auto_844579 ?auto_844584 ) ) ( not ( = ?auto_844579 ?auto_844585 ) ) ( not ( = ?auto_844579 ?auto_844586 ) ) ( not ( = ?auto_844580 ?auto_844581 ) ) ( not ( = ?auto_844580 ?auto_844582 ) ) ( not ( = ?auto_844580 ?auto_844583 ) ) ( not ( = ?auto_844580 ?auto_844584 ) ) ( not ( = ?auto_844580 ?auto_844585 ) ) ( not ( = ?auto_844580 ?auto_844586 ) ) ( not ( = ?auto_844581 ?auto_844582 ) ) ( not ( = ?auto_844581 ?auto_844583 ) ) ( not ( = ?auto_844581 ?auto_844584 ) ) ( not ( = ?auto_844581 ?auto_844585 ) ) ( not ( = ?auto_844581 ?auto_844586 ) ) ( not ( = ?auto_844582 ?auto_844583 ) ) ( not ( = ?auto_844582 ?auto_844584 ) ) ( not ( = ?auto_844582 ?auto_844585 ) ) ( not ( = ?auto_844582 ?auto_844586 ) ) ( not ( = ?auto_844583 ?auto_844584 ) ) ( not ( = ?auto_844583 ?auto_844585 ) ) ( not ( = ?auto_844583 ?auto_844586 ) ) ( not ( = ?auto_844584 ?auto_844585 ) ) ( not ( = ?auto_844584 ?auto_844586 ) ) ( not ( = ?auto_844585 ?auto_844586 ) ) ( ON ?auto_844584 ?auto_844585 ) ( ON ?auto_844583 ?auto_844584 ) ( ON ?auto_844582 ?auto_844583 ) ( ON ?auto_844581 ?auto_844582 ) ( ON ?auto_844580 ?auto_844581 ) ( ON ?auto_844579 ?auto_844580 ) ( ON ?auto_844578 ?auto_844579 ) ( ON ?auto_844577 ?auto_844578 ) ( CLEAR ?auto_844575 ) ( ON ?auto_844576 ?auto_844577 ) ( CLEAR ?auto_844576 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_844568 ?auto_844569 ?auto_844570 ?auto_844571 ?auto_844572 ?auto_844573 ?auto_844574 ?auto_844575 ?auto_844576 )
      ( MAKE-18PILE ?auto_844568 ?auto_844569 ?auto_844570 ?auto_844571 ?auto_844572 ?auto_844573 ?auto_844574 ?auto_844575 ?auto_844576 ?auto_844577 ?auto_844578 ?auto_844579 ?auto_844580 ?auto_844581 ?auto_844582 ?auto_844583 ?auto_844584 ?auto_844585 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_844605 - BLOCK
      ?auto_844606 - BLOCK
      ?auto_844607 - BLOCK
      ?auto_844608 - BLOCK
      ?auto_844609 - BLOCK
      ?auto_844610 - BLOCK
      ?auto_844611 - BLOCK
      ?auto_844612 - BLOCK
      ?auto_844613 - BLOCK
      ?auto_844614 - BLOCK
      ?auto_844615 - BLOCK
      ?auto_844616 - BLOCK
      ?auto_844617 - BLOCK
      ?auto_844618 - BLOCK
      ?auto_844619 - BLOCK
      ?auto_844620 - BLOCK
      ?auto_844621 - BLOCK
      ?auto_844622 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_844622 ) ( ON-TABLE ?auto_844605 ) ( ON ?auto_844606 ?auto_844605 ) ( ON ?auto_844607 ?auto_844606 ) ( ON ?auto_844608 ?auto_844607 ) ( ON ?auto_844609 ?auto_844608 ) ( ON ?auto_844610 ?auto_844609 ) ( ON ?auto_844611 ?auto_844610 ) ( ON ?auto_844612 ?auto_844611 ) ( not ( = ?auto_844605 ?auto_844606 ) ) ( not ( = ?auto_844605 ?auto_844607 ) ) ( not ( = ?auto_844605 ?auto_844608 ) ) ( not ( = ?auto_844605 ?auto_844609 ) ) ( not ( = ?auto_844605 ?auto_844610 ) ) ( not ( = ?auto_844605 ?auto_844611 ) ) ( not ( = ?auto_844605 ?auto_844612 ) ) ( not ( = ?auto_844605 ?auto_844613 ) ) ( not ( = ?auto_844605 ?auto_844614 ) ) ( not ( = ?auto_844605 ?auto_844615 ) ) ( not ( = ?auto_844605 ?auto_844616 ) ) ( not ( = ?auto_844605 ?auto_844617 ) ) ( not ( = ?auto_844605 ?auto_844618 ) ) ( not ( = ?auto_844605 ?auto_844619 ) ) ( not ( = ?auto_844605 ?auto_844620 ) ) ( not ( = ?auto_844605 ?auto_844621 ) ) ( not ( = ?auto_844605 ?auto_844622 ) ) ( not ( = ?auto_844606 ?auto_844607 ) ) ( not ( = ?auto_844606 ?auto_844608 ) ) ( not ( = ?auto_844606 ?auto_844609 ) ) ( not ( = ?auto_844606 ?auto_844610 ) ) ( not ( = ?auto_844606 ?auto_844611 ) ) ( not ( = ?auto_844606 ?auto_844612 ) ) ( not ( = ?auto_844606 ?auto_844613 ) ) ( not ( = ?auto_844606 ?auto_844614 ) ) ( not ( = ?auto_844606 ?auto_844615 ) ) ( not ( = ?auto_844606 ?auto_844616 ) ) ( not ( = ?auto_844606 ?auto_844617 ) ) ( not ( = ?auto_844606 ?auto_844618 ) ) ( not ( = ?auto_844606 ?auto_844619 ) ) ( not ( = ?auto_844606 ?auto_844620 ) ) ( not ( = ?auto_844606 ?auto_844621 ) ) ( not ( = ?auto_844606 ?auto_844622 ) ) ( not ( = ?auto_844607 ?auto_844608 ) ) ( not ( = ?auto_844607 ?auto_844609 ) ) ( not ( = ?auto_844607 ?auto_844610 ) ) ( not ( = ?auto_844607 ?auto_844611 ) ) ( not ( = ?auto_844607 ?auto_844612 ) ) ( not ( = ?auto_844607 ?auto_844613 ) ) ( not ( = ?auto_844607 ?auto_844614 ) ) ( not ( = ?auto_844607 ?auto_844615 ) ) ( not ( = ?auto_844607 ?auto_844616 ) ) ( not ( = ?auto_844607 ?auto_844617 ) ) ( not ( = ?auto_844607 ?auto_844618 ) ) ( not ( = ?auto_844607 ?auto_844619 ) ) ( not ( = ?auto_844607 ?auto_844620 ) ) ( not ( = ?auto_844607 ?auto_844621 ) ) ( not ( = ?auto_844607 ?auto_844622 ) ) ( not ( = ?auto_844608 ?auto_844609 ) ) ( not ( = ?auto_844608 ?auto_844610 ) ) ( not ( = ?auto_844608 ?auto_844611 ) ) ( not ( = ?auto_844608 ?auto_844612 ) ) ( not ( = ?auto_844608 ?auto_844613 ) ) ( not ( = ?auto_844608 ?auto_844614 ) ) ( not ( = ?auto_844608 ?auto_844615 ) ) ( not ( = ?auto_844608 ?auto_844616 ) ) ( not ( = ?auto_844608 ?auto_844617 ) ) ( not ( = ?auto_844608 ?auto_844618 ) ) ( not ( = ?auto_844608 ?auto_844619 ) ) ( not ( = ?auto_844608 ?auto_844620 ) ) ( not ( = ?auto_844608 ?auto_844621 ) ) ( not ( = ?auto_844608 ?auto_844622 ) ) ( not ( = ?auto_844609 ?auto_844610 ) ) ( not ( = ?auto_844609 ?auto_844611 ) ) ( not ( = ?auto_844609 ?auto_844612 ) ) ( not ( = ?auto_844609 ?auto_844613 ) ) ( not ( = ?auto_844609 ?auto_844614 ) ) ( not ( = ?auto_844609 ?auto_844615 ) ) ( not ( = ?auto_844609 ?auto_844616 ) ) ( not ( = ?auto_844609 ?auto_844617 ) ) ( not ( = ?auto_844609 ?auto_844618 ) ) ( not ( = ?auto_844609 ?auto_844619 ) ) ( not ( = ?auto_844609 ?auto_844620 ) ) ( not ( = ?auto_844609 ?auto_844621 ) ) ( not ( = ?auto_844609 ?auto_844622 ) ) ( not ( = ?auto_844610 ?auto_844611 ) ) ( not ( = ?auto_844610 ?auto_844612 ) ) ( not ( = ?auto_844610 ?auto_844613 ) ) ( not ( = ?auto_844610 ?auto_844614 ) ) ( not ( = ?auto_844610 ?auto_844615 ) ) ( not ( = ?auto_844610 ?auto_844616 ) ) ( not ( = ?auto_844610 ?auto_844617 ) ) ( not ( = ?auto_844610 ?auto_844618 ) ) ( not ( = ?auto_844610 ?auto_844619 ) ) ( not ( = ?auto_844610 ?auto_844620 ) ) ( not ( = ?auto_844610 ?auto_844621 ) ) ( not ( = ?auto_844610 ?auto_844622 ) ) ( not ( = ?auto_844611 ?auto_844612 ) ) ( not ( = ?auto_844611 ?auto_844613 ) ) ( not ( = ?auto_844611 ?auto_844614 ) ) ( not ( = ?auto_844611 ?auto_844615 ) ) ( not ( = ?auto_844611 ?auto_844616 ) ) ( not ( = ?auto_844611 ?auto_844617 ) ) ( not ( = ?auto_844611 ?auto_844618 ) ) ( not ( = ?auto_844611 ?auto_844619 ) ) ( not ( = ?auto_844611 ?auto_844620 ) ) ( not ( = ?auto_844611 ?auto_844621 ) ) ( not ( = ?auto_844611 ?auto_844622 ) ) ( not ( = ?auto_844612 ?auto_844613 ) ) ( not ( = ?auto_844612 ?auto_844614 ) ) ( not ( = ?auto_844612 ?auto_844615 ) ) ( not ( = ?auto_844612 ?auto_844616 ) ) ( not ( = ?auto_844612 ?auto_844617 ) ) ( not ( = ?auto_844612 ?auto_844618 ) ) ( not ( = ?auto_844612 ?auto_844619 ) ) ( not ( = ?auto_844612 ?auto_844620 ) ) ( not ( = ?auto_844612 ?auto_844621 ) ) ( not ( = ?auto_844612 ?auto_844622 ) ) ( not ( = ?auto_844613 ?auto_844614 ) ) ( not ( = ?auto_844613 ?auto_844615 ) ) ( not ( = ?auto_844613 ?auto_844616 ) ) ( not ( = ?auto_844613 ?auto_844617 ) ) ( not ( = ?auto_844613 ?auto_844618 ) ) ( not ( = ?auto_844613 ?auto_844619 ) ) ( not ( = ?auto_844613 ?auto_844620 ) ) ( not ( = ?auto_844613 ?auto_844621 ) ) ( not ( = ?auto_844613 ?auto_844622 ) ) ( not ( = ?auto_844614 ?auto_844615 ) ) ( not ( = ?auto_844614 ?auto_844616 ) ) ( not ( = ?auto_844614 ?auto_844617 ) ) ( not ( = ?auto_844614 ?auto_844618 ) ) ( not ( = ?auto_844614 ?auto_844619 ) ) ( not ( = ?auto_844614 ?auto_844620 ) ) ( not ( = ?auto_844614 ?auto_844621 ) ) ( not ( = ?auto_844614 ?auto_844622 ) ) ( not ( = ?auto_844615 ?auto_844616 ) ) ( not ( = ?auto_844615 ?auto_844617 ) ) ( not ( = ?auto_844615 ?auto_844618 ) ) ( not ( = ?auto_844615 ?auto_844619 ) ) ( not ( = ?auto_844615 ?auto_844620 ) ) ( not ( = ?auto_844615 ?auto_844621 ) ) ( not ( = ?auto_844615 ?auto_844622 ) ) ( not ( = ?auto_844616 ?auto_844617 ) ) ( not ( = ?auto_844616 ?auto_844618 ) ) ( not ( = ?auto_844616 ?auto_844619 ) ) ( not ( = ?auto_844616 ?auto_844620 ) ) ( not ( = ?auto_844616 ?auto_844621 ) ) ( not ( = ?auto_844616 ?auto_844622 ) ) ( not ( = ?auto_844617 ?auto_844618 ) ) ( not ( = ?auto_844617 ?auto_844619 ) ) ( not ( = ?auto_844617 ?auto_844620 ) ) ( not ( = ?auto_844617 ?auto_844621 ) ) ( not ( = ?auto_844617 ?auto_844622 ) ) ( not ( = ?auto_844618 ?auto_844619 ) ) ( not ( = ?auto_844618 ?auto_844620 ) ) ( not ( = ?auto_844618 ?auto_844621 ) ) ( not ( = ?auto_844618 ?auto_844622 ) ) ( not ( = ?auto_844619 ?auto_844620 ) ) ( not ( = ?auto_844619 ?auto_844621 ) ) ( not ( = ?auto_844619 ?auto_844622 ) ) ( not ( = ?auto_844620 ?auto_844621 ) ) ( not ( = ?auto_844620 ?auto_844622 ) ) ( not ( = ?auto_844621 ?auto_844622 ) ) ( ON ?auto_844621 ?auto_844622 ) ( ON ?auto_844620 ?auto_844621 ) ( ON ?auto_844619 ?auto_844620 ) ( ON ?auto_844618 ?auto_844619 ) ( ON ?auto_844617 ?auto_844618 ) ( ON ?auto_844616 ?auto_844617 ) ( ON ?auto_844615 ?auto_844616 ) ( ON ?auto_844614 ?auto_844615 ) ( CLEAR ?auto_844612 ) ( ON ?auto_844613 ?auto_844614 ) ( CLEAR ?auto_844613 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_844605 ?auto_844606 ?auto_844607 ?auto_844608 ?auto_844609 ?auto_844610 ?auto_844611 ?auto_844612 ?auto_844613 )
      ( MAKE-18PILE ?auto_844605 ?auto_844606 ?auto_844607 ?auto_844608 ?auto_844609 ?auto_844610 ?auto_844611 ?auto_844612 ?auto_844613 ?auto_844614 ?auto_844615 ?auto_844616 ?auto_844617 ?auto_844618 ?auto_844619 ?auto_844620 ?auto_844621 ?auto_844622 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_844641 - BLOCK
      ?auto_844642 - BLOCK
      ?auto_844643 - BLOCK
      ?auto_844644 - BLOCK
      ?auto_844645 - BLOCK
      ?auto_844646 - BLOCK
      ?auto_844647 - BLOCK
      ?auto_844648 - BLOCK
      ?auto_844649 - BLOCK
      ?auto_844650 - BLOCK
      ?auto_844651 - BLOCK
      ?auto_844652 - BLOCK
      ?auto_844653 - BLOCK
      ?auto_844654 - BLOCK
      ?auto_844655 - BLOCK
      ?auto_844656 - BLOCK
      ?auto_844657 - BLOCK
      ?auto_844658 - BLOCK
    )
    :vars
    (
      ?auto_844659 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_844658 ?auto_844659 ) ( ON-TABLE ?auto_844641 ) ( ON ?auto_844642 ?auto_844641 ) ( ON ?auto_844643 ?auto_844642 ) ( ON ?auto_844644 ?auto_844643 ) ( ON ?auto_844645 ?auto_844644 ) ( ON ?auto_844646 ?auto_844645 ) ( ON ?auto_844647 ?auto_844646 ) ( not ( = ?auto_844641 ?auto_844642 ) ) ( not ( = ?auto_844641 ?auto_844643 ) ) ( not ( = ?auto_844641 ?auto_844644 ) ) ( not ( = ?auto_844641 ?auto_844645 ) ) ( not ( = ?auto_844641 ?auto_844646 ) ) ( not ( = ?auto_844641 ?auto_844647 ) ) ( not ( = ?auto_844641 ?auto_844648 ) ) ( not ( = ?auto_844641 ?auto_844649 ) ) ( not ( = ?auto_844641 ?auto_844650 ) ) ( not ( = ?auto_844641 ?auto_844651 ) ) ( not ( = ?auto_844641 ?auto_844652 ) ) ( not ( = ?auto_844641 ?auto_844653 ) ) ( not ( = ?auto_844641 ?auto_844654 ) ) ( not ( = ?auto_844641 ?auto_844655 ) ) ( not ( = ?auto_844641 ?auto_844656 ) ) ( not ( = ?auto_844641 ?auto_844657 ) ) ( not ( = ?auto_844641 ?auto_844658 ) ) ( not ( = ?auto_844641 ?auto_844659 ) ) ( not ( = ?auto_844642 ?auto_844643 ) ) ( not ( = ?auto_844642 ?auto_844644 ) ) ( not ( = ?auto_844642 ?auto_844645 ) ) ( not ( = ?auto_844642 ?auto_844646 ) ) ( not ( = ?auto_844642 ?auto_844647 ) ) ( not ( = ?auto_844642 ?auto_844648 ) ) ( not ( = ?auto_844642 ?auto_844649 ) ) ( not ( = ?auto_844642 ?auto_844650 ) ) ( not ( = ?auto_844642 ?auto_844651 ) ) ( not ( = ?auto_844642 ?auto_844652 ) ) ( not ( = ?auto_844642 ?auto_844653 ) ) ( not ( = ?auto_844642 ?auto_844654 ) ) ( not ( = ?auto_844642 ?auto_844655 ) ) ( not ( = ?auto_844642 ?auto_844656 ) ) ( not ( = ?auto_844642 ?auto_844657 ) ) ( not ( = ?auto_844642 ?auto_844658 ) ) ( not ( = ?auto_844642 ?auto_844659 ) ) ( not ( = ?auto_844643 ?auto_844644 ) ) ( not ( = ?auto_844643 ?auto_844645 ) ) ( not ( = ?auto_844643 ?auto_844646 ) ) ( not ( = ?auto_844643 ?auto_844647 ) ) ( not ( = ?auto_844643 ?auto_844648 ) ) ( not ( = ?auto_844643 ?auto_844649 ) ) ( not ( = ?auto_844643 ?auto_844650 ) ) ( not ( = ?auto_844643 ?auto_844651 ) ) ( not ( = ?auto_844643 ?auto_844652 ) ) ( not ( = ?auto_844643 ?auto_844653 ) ) ( not ( = ?auto_844643 ?auto_844654 ) ) ( not ( = ?auto_844643 ?auto_844655 ) ) ( not ( = ?auto_844643 ?auto_844656 ) ) ( not ( = ?auto_844643 ?auto_844657 ) ) ( not ( = ?auto_844643 ?auto_844658 ) ) ( not ( = ?auto_844643 ?auto_844659 ) ) ( not ( = ?auto_844644 ?auto_844645 ) ) ( not ( = ?auto_844644 ?auto_844646 ) ) ( not ( = ?auto_844644 ?auto_844647 ) ) ( not ( = ?auto_844644 ?auto_844648 ) ) ( not ( = ?auto_844644 ?auto_844649 ) ) ( not ( = ?auto_844644 ?auto_844650 ) ) ( not ( = ?auto_844644 ?auto_844651 ) ) ( not ( = ?auto_844644 ?auto_844652 ) ) ( not ( = ?auto_844644 ?auto_844653 ) ) ( not ( = ?auto_844644 ?auto_844654 ) ) ( not ( = ?auto_844644 ?auto_844655 ) ) ( not ( = ?auto_844644 ?auto_844656 ) ) ( not ( = ?auto_844644 ?auto_844657 ) ) ( not ( = ?auto_844644 ?auto_844658 ) ) ( not ( = ?auto_844644 ?auto_844659 ) ) ( not ( = ?auto_844645 ?auto_844646 ) ) ( not ( = ?auto_844645 ?auto_844647 ) ) ( not ( = ?auto_844645 ?auto_844648 ) ) ( not ( = ?auto_844645 ?auto_844649 ) ) ( not ( = ?auto_844645 ?auto_844650 ) ) ( not ( = ?auto_844645 ?auto_844651 ) ) ( not ( = ?auto_844645 ?auto_844652 ) ) ( not ( = ?auto_844645 ?auto_844653 ) ) ( not ( = ?auto_844645 ?auto_844654 ) ) ( not ( = ?auto_844645 ?auto_844655 ) ) ( not ( = ?auto_844645 ?auto_844656 ) ) ( not ( = ?auto_844645 ?auto_844657 ) ) ( not ( = ?auto_844645 ?auto_844658 ) ) ( not ( = ?auto_844645 ?auto_844659 ) ) ( not ( = ?auto_844646 ?auto_844647 ) ) ( not ( = ?auto_844646 ?auto_844648 ) ) ( not ( = ?auto_844646 ?auto_844649 ) ) ( not ( = ?auto_844646 ?auto_844650 ) ) ( not ( = ?auto_844646 ?auto_844651 ) ) ( not ( = ?auto_844646 ?auto_844652 ) ) ( not ( = ?auto_844646 ?auto_844653 ) ) ( not ( = ?auto_844646 ?auto_844654 ) ) ( not ( = ?auto_844646 ?auto_844655 ) ) ( not ( = ?auto_844646 ?auto_844656 ) ) ( not ( = ?auto_844646 ?auto_844657 ) ) ( not ( = ?auto_844646 ?auto_844658 ) ) ( not ( = ?auto_844646 ?auto_844659 ) ) ( not ( = ?auto_844647 ?auto_844648 ) ) ( not ( = ?auto_844647 ?auto_844649 ) ) ( not ( = ?auto_844647 ?auto_844650 ) ) ( not ( = ?auto_844647 ?auto_844651 ) ) ( not ( = ?auto_844647 ?auto_844652 ) ) ( not ( = ?auto_844647 ?auto_844653 ) ) ( not ( = ?auto_844647 ?auto_844654 ) ) ( not ( = ?auto_844647 ?auto_844655 ) ) ( not ( = ?auto_844647 ?auto_844656 ) ) ( not ( = ?auto_844647 ?auto_844657 ) ) ( not ( = ?auto_844647 ?auto_844658 ) ) ( not ( = ?auto_844647 ?auto_844659 ) ) ( not ( = ?auto_844648 ?auto_844649 ) ) ( not ( = ?auto_844648 ?auto_844650 ) ) ( not ( = ?auto_844648 ?auto_844651 ) ) ( not ( = ?auto_844648 ?auto_844652 ) ) ( not ( = ?auto_844648 ?auto_844653 ) ) ( not ( = ?auto_844648 ?auto_844654 ) ) ( not ( = ?auto_844648 ?auto_844655 ) ) ( not ( = ?auto_844648 ?auto_844656 ) ) ( not ( = ?auto_844648 ?auto_844657 ) ) ( not ( = ?auto_844648 ?auto_844658 ) ) ( not ( = ?auto_844648 ?auto_844659 ) ) ( not ( = ?auto_844649 ?auto_844650 ) ) ( not ( = ?auto_844649 ?auto_844651 ) ) ( not ( = ?auto_844649 ?auto_844652 ) ) ( not ( = ?auto_844649 ?auto_844653 ) ) ( not ( = ?auto_844649 ?auto_844654 ) ) ( not ( = ?auto_844649 ?auto_844655 ) ) ( not ( = ?auto_844649 ?auto_844656 ) ) ( not ( = ?auto_844649 ?auto_844657 ) ) ( not ( = ?auto_844649 ?auto_844658 ) ) ( not ( = ?auto_844649 ?auto_844659 ) ) ( not ( = ?auto_844650 ?auto_844651 ) ) ( not ( = ?auto_844650 ?auto_844652 ) ) ( not ( = ?auto_844650 ?auto_844653 ) ) ( not ( = ?auto_844650 ?auto_844654 ) ) ( not ( = ?auto_844650 ?auto_844655 ) ) ( not ( = ?auto_844650 ?auto_844656 ) ) ( not ( = ?auto_844650 ?auto_844657 ) ) ( not ( = ?auto_844650 ?auto_844658 ) ) ( not ( = ?auto_844650 ?auto_844659 ) ) ( not ( = ?auto_844651 ?auto_844652 ) ) ( not ( = ?auto_844651 ?auto_844653 ) ) ( not ( = ?auto_844651 ?auto_844654 ) ) ( not ( = ?auto_844651 ?auto_844655 ) ) ( not ( = ?auto_844651 ?auto_844656 ) ) ( not ( = ?auto_844651 ?auto_844657 ) ) ( not ( = ?auto_844651 ?auto_844658 ) ) ( not ( = ?auto_844651 ?auto_844659 ) ) ( not ( = ?auto_844652 ?auto_844653 ) ) ( not ( = ?auto_844652 ?auto_844654 ) ) ( not ( = ?auto_844652 ?auto_844655 ) ) ( not ( = ?auto_844652 ?auto_844656 ) ) ( not ( = ?auto_844652 ?auto_844657 ) ) ( not ( = ?auto_844652 ?auto_844658 ) ) ( not ( = ?auto_844652 ?auto_844659 ) ) ( not ( = ?auto_844653 ?auto_844654 ) ) ( not ( = ?auto_844653 ?auto_844655 ) ) ( not ( = ?auto_844653 ?auto_844656 ) ) ( not ( = ?auto_844653 ?auto_844657 ) ) ( not ( = ?auto_844653 ?auto_844658 ) ) ( not ( = ?auto_844653 ?auto_844659 ) ) ( not ( = ?auto_844654 ?auto_844655 ) ) ( not ( = ?auto_844654 ?auto_844656 ) ) ( not ( = ?auto_844654 ?auto_844657 ) ) ( not ( = ?auto_844654 ?auto_844658 ) ) ( not ( = ?auto_844654 ?auto_844659 ) ) ( not ( = ?auto_844655 ?auto_844656 ) ) ( not ( = ?auto_844655 ?auto_844657 ) ) ( not ( = ?auto_844655 ?auto_844658 ) ) ( not ( = ?auto_844655 ?auto_844659 ) ) ( not ( = ?auto_844656 ?auto_844657 ) ) ( not ( = ?auto_844656 ?auto_844658 ) ) ( not ( = ?auto_844656 ?auto_844659 ) ) ( not ( = ?auto_844657 ?auto_844658 ) ) ( not ( = ?auto_844657 ?auto_844659 ) ) ( not ( = ?auto_844658 ?auto_844659 ) ) ( ON ?auto_844657 ?auto_844658 ) ( ON ?auto_844656 ?auto_844657 ) ( ON ?auto_844655 ?auto_844656 ) ( ON ?auto_844654 ?auto_844655 ) ( ON ?auto_844653 ?auto_844654 ) ( ON ?auto_844652 ?auto_844653 ) ( ON ?auto_844651 ?auto_844652 ) ( ON ?auto_844650 ?auto_844651 ) ( ON ?auto_844649 ?auto_844650 ) ( CLEAR ?auto_844647 ) ( ON ?auto_844648 ?auto_844649 ) ( CLEAR ?auto_844648 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_844641 ?auto_844642 ?auto_844643 ?auto_844644 ?auto_844645 ?auto_844646 ?auto_844647 ?auto_844648 )
      ( MAKE-18PILE ?auto_844641 ?auto_844642 ?auto_844643 ?auto_844644 ?auto_844645 ?auto_844646 ?auto_844647 ?auto_844648 ?auto_844649 ?auto_844650 ?auto_844651 ?auto_844652 ?auto_844653 ?auto_844654 ?auto_844655 ?auto_844656 ?auto_844657 ?auto_844658 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_844678 - BLOCK
      ?auto_844679 - BLOCK
      ?auto_844680 - BLOCK
      ?auto_844681 - BLOCK
      ?auto_844682 - BLOCK
      ?auto_844683 - BLOCK
      ?auto_844684 - BLOCK
      ?auto_844685 - BLOCK
      ?auto_844686 - BLOCK
      ?auto_844687 - BLOCK
      ?auto_844688 - BLOCK
      ?auto_844689 - BLOCK
      ?auto_844690 - BLOCK
      ?auto_844691 - BLOCK
      ?auto_844692 - BLOCK
      ?auto_844693 - BLOCK
      ?auto_844694 - BLOCK
      ?auto_844695 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_844695 ) ( ON-TABLE ?auto_844678 ) ( ON ?auto_844679 ?auto_844678 ) ( ON ?auto_844680 ?auto_844679 ) ( ON ?auto_844681 ?auto_844680 ) ( ON ?auto_844682 ?auto_844681 ) ( ON ?auto_844683 ?auto_844682 ) ( ON ?auto_844684 ?auto_844683 ) ( not ( = ?auto_844678 ?auto_844679 ) ) ( not ( = ?auto_844678 ?auto_844680 ) ) ( not ( = ?auto_844678 ?auto_844681 ) ) ( not ( = ?auto_844678 ?auto_844682 ) ) ( not ( = ?auto_844678 ?auto_844683 ) ) ( not ( = ?auto_844678 ?auto_844684 ) ) ( not ( = ?auto_844678 ?auto_844685 ) ) ( not ( = ?auto_844678 ?auto_844686 ) ) ( not ( = ?auto_844678 ?auto_844687 ) ) ( not ( = ?auto_844678 ?auto_844688 ) ) ( not ( = ?auto_844678 ?auto_844689 ) ) ( not ( = ?auto_844678 ?auto_844690 ) ) ( not ( = ?auto_844678 ?auto_844691 ) ) ( not ( = ?auto_844678 ?auto_844692 ) ) ( not ( = ?auto_844678 ?auto_844693 ) ) ( not ( = ?auto_844678 ?auto_844694 ) ) ( not ( = ?auto_844678 ?auto_844695 ) ) ( not ( = ?auto_844679 ?auto_844680 ) ) ( not ( = ?auto_844679 ?auto_844681 ) ) ( not ( = ?auto_844679 ?auto_844682 ) ) ( not ( = ?auto_844679 ?auto_844683 ) ) ( not ( = ?auto_844679 ?auto_844684 ) ) ( not ( = ?auto_844679 ?auto_844685 ) ) ( not ( = ?auto_844679 ?auto_844686 ) ) ( not ( = ?auto_844679 ?auto_844687 ) ) ( not ( = ?auto_844679 ?auto_844688 ) ) ( not ( = ?auto_844679 ?auto_844689 ) ) ( not ( = ?auto_844679 ?auto_844690 ) ) ( not ( = ?auto_844679 ?auto_844691 ) ) ( not ( = ?auto_844679 ?auto_844692 ) ) ( not ( = ?auto_844679 ?auto_844693 ) ) ( not ( = ?auto_844679 ?auto_844694 ) ) ( not ( = ?auto_844679 ?auto_844695 ) ) ( not ( = ?auto_844680 ?auto_844681 ) ) ( not ( = ?auto_844680 ?auto_844682 ) ) ( not ( = ?auto_844680 ?auto_844683 ) ) ( not ( = ?auto_844680 ?auto_844684 ) ) ( not ( = ?auto_844680 ?auto_844685 ) ) ( not ( = ?auto_844680 ?auto_844686 ) ) ( not ( = ?auto_844680 ?auto_844687 ) ) ( not ( = ?auto_844680 ?auto_844688 ) ) ( not ( = ?auto_844680 ?auto_844689 ) ) ( not ( = ?auto_844680 ?auto_844690 ) ) ( not ( = ?auto_844680 ?auto_844691 ) ) ( not ( = ?auto_844680 ?auto_844692 ) ) ( not ( = ?auto_844680 ?auto_844693 ) ) ( not ( = ?auto_844680 ?auto_844694 ) ) ( not ( = ?auto_844680 ?auto_844695 ) ) ( not ( = ?auto_844681 ?auto_844682 ) ) ( not ( = ?auto_844681 ?auto_844683 ) ) ( not ( = ?auto_844681 ?auto_844684 ) ) ( not ( = ?auto_844681 ?auto_844685 ) ) ( not ( = ?auto_844681 ?auto_844686 ) ) ( not ( = ?auto_844681 ?auto_844687 ) ) ( not ( = ?auto_844681 ?auto_844688 ) ) ( not ( = ?auto_844681 ?auto_844689 ) ) ( not ( = ?auto_844681 ?auto_844690 ) ) ( not ( = ?auto_844681 ?auto_844691 ) ) ( not ( = ?auto_844681 ?auto_844692 ) ) ( not ( = ?auto_844681 ?auto_844693 ) ) ( not ( = ?auto_844681 ?auto_844694 ) ) ( not ( = ?auto_844681 ?auto_844695 ) ) ( not ( = ?auto_844682 ?auto_844683 ) ) ( not ( = ?auto_844682 ?auto_844684 ) ) ( not ( = ?auto_844682 ?auto_844685 ) ) ( not ( = ?auto_844682 ?auto_844686 ) ) ( not ( = ?auto_844682 ?auto_844687 ) ) ( not ( = ?auto_844682 ?auto_844688 ) ) ( not ( = ?auto_844682 ?auto_844689 ) ) ( not ( = ?auto_844682 ?auto_844690 ) ) ( not ( = ?auto_844682 ?auto_844691 ) ) ( not ( = ?auto_844682 ?auto_844692 ) ) ( not ( = ?auto_844682 ?auto_844693 ) ) ( not ( = ?auto_844682 ?auto_844694 ) ) ( not ( = ?auto_844682 ?auto_844695 ) ) ( not ( = ?auto_844683 ?auto_844684 ) ) ( not ( = ?auto_844683 ?auto_844685 ) ) ( not ( = ?auto_844683 ?auto_844686 ) ) ( not ( = ?auto_844683 ?auto_844687 ) ) ( not ( = ?auto_844683 ?auto_844688 ) ) ( not ( = ?auto_844683 ?auto_844689 ) ) ( not ( = ?auto_844683 ?auto_844690 ) ) ( not ( = ?auto_844683 ?auto_844691 ) ) ( not ( = ?auto_844683 ?auto_844692 ) ) ( not ( = ?auto_844683 ?auto_844693 ) ) ( not ( = ?auto_844683 ?auto_844694 ) ) ( not ( = ?auto_844683 ?auto_844695 ) ) ( not ( = ?auto_844684 ?auto_844685 ) ) ( not ( = ?auto_844684 ?auto_844686 ) ) ( not ( = ?auto_844684 ?auto_844687 ) ) ( not ( = ?auto_844684 ?auto_844688 ) ) ( not ( = ?auto_844684 ?auto_844689 ) ) ( not ( = ?auto_844684 ?auto_844690 ) ) ( not ( = ?auto_844684 ?auto_844691 ) ) ( not ( = ?auto_844684 ?auto_844692 ) ) ( not ( = ?auto_844684 ?auto_844693 ) ) ( not ( = ?auto_844684 ?auto_844694 ) ) ( not ( = ?auto_844684 ?auto_844695 ) ) ( not ( = ?auto_844685 ?auto_844686 ) ) ( not ( = ?auto_844685 ?auto_844687 ) ) ( not ( = ?auto_844685 ?auto_844688 ) ) ( not ( = ?auto_844685 ?auto_844689 ) ) ( not ( = ?auto_844685 ?auto_844690 ) ) ( not ( = ?auto_844685 ?auto_844691 ) ) ( not ( = ?auto_844685 ?auto_844692 ) ) ( not ( = ?auto_844685 ?auto_844693 ) ) ( not ( = ?auto_844685 ?auto_844694 ) ) ( not ( = ?auto_844685 ?auto_844695 ) ) ( not ( = ?auto_844686 ?auto_844687 ) ) ( not ( = ?auto_844686 ?auto_844688 ) ) ( not ( = ?auto_844686 ?auto_844689 ) ) ( not ( = ?auto_844686 ?auto_844690 ) ) ( not ( = ?auto_844686 ?auto_844691 ) ) ( not ( = ?auto_844686 ?auto_844692 ) ) ( not ( = ?auto_844686 ?auto_844693 ) ) ( not ( = ?auto_844686 ?auto_844694 ) ) ( not ( = ?auto_844686 ?auto_844695 ) ) ( not ( = ?auto_844687 ?auto_844688 ) ) ( not ( = ?auto_844687 ?auto_844689 ) ) ( not ( = ?auto_844687 ?auto_844690 ) ) ( not ( = ?auto_844687 ?auto_844691 ) ) ( not ( = ?auto_844687 ?auto_844692 ) ) ( not ( = ?auto_844687 ?auto_844693 ) ) ( not ( = ?auto_844687 ?auto_844694 ) ) ( not ( = ?auto_844687 ?auto_844695 ) ) ( not ( = ?auto_844688 ?auto_844689 ) ) ( not ( = ?auto_844688 ?auto_844690 ) ) ( not ( = ?auto_844688 ?auto_844691 ) ) ( not ( = ?auto_844688 ?auto_844692 ) ) ( not ( = ?auto_844688 ?auto_844693 ) ) ( not ( = ?auto_844688 ?auto_844694 ) ) ( not ( = ?auto_844688 ?auto_844695 ) ) ( not ( = ?auto_844689 ?auto_844690 ) ) ( not ( = ?auto_844689 ?auto_844691 ) ) ( not ( = ?auto_844689 ?auto_844692 ) ) ( not ( = ?auto_844689 ?auto_844693 ) ) ( not ( = ?auto_844689 ?auto_844694 ) ) ( not ( = ?auto_844689 ?auto_844695 ) ) ( not ( = ?auto_844690 ?auto_844691 ) ) ( not ( = ?auto_844690 ?auto_844692 ) ) ( not ( = ?auto_844690 ?auto_844693 ) ) ( not ( = ?auto_844690 ?auto_844694 ) ) ( not ( = ?auto_844690 ?auto_844695 ) ) ( not ( = ?auto_844691 ?auto_844692 ) ) ( not ( = ?auto_844691 ?auto_844693 ) ) ( not ( = ?auto_844691 ?auto_844694 ) ) ( not ( = ?auto_844691 ?auto_844695 ) ) ( not ( = ?auto_844692 ?auto_844693 ) ) ( not ( = ?auto_844692 ?auto_844694 ) ) ( not ( = ?auto_844692 ?auto_844695 ) ) ( not ( = ?auto_844693 ?auto_844694 ) ) ( not ( = ?auto_844693 ?auto_844695 ) ) ( not ( = ?auto_844694 ?auto_844695 ) ) ( ON ?auto_844694 ?auto_844695 ) ( ON ?auto_844693 ?auto_844694 ) ( ON ?auto_844692 ?auto_844693 ) ( ON ?auto_844691 ?auto_844692 ) ( ON ?auto_844690 ?auto_844691 ) ( ON ?auto_844689 ?auto_844690 ) ( ON ?auto_844688 ?auto_844689 ) ( ON ?auto_844687 ?auto_844688 ) ( ON ?auto_844686 ?auto_844687 ) ( CLEAR ?auto_844684 ) ( ON ?auto_844685 ?auto_844686 ) ( CLEAR ?auto_844685 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_844678 ?auto_844679 ?auto_844680 ?auto_844681 ?auto_844682 ?auto_844683 ?auto_844684 ?auto_844685 )
      ( MAKE-18PILE ?auto_844678 ?auto_844679 ?auto_844680 ?auto_844681 ?auto_844682 ?auto_844683 ?auto_844684 ?auto_844685 ?auto_844686 ?auto_844687 ?auto_844688 ?auto_844689 ?auto_844690 ?auto_844691 ?auto_844692 ?auto_844693 ?auto_844694 ?auto_844695 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_844714 - BLOCK
      ?auto_844715 - BLOCK
      ?auto_844716 - BLOCK
      ?auto_844717 - BLOCK
      ?auto_844718 - BLOCK
      ?auto_844719 - BLOCK
      ?auto_844720 - BLOCK
      ?auto_844721 - BLOCK
      ?auto_844722 - BLOCK
      ?auto_844723 - BLOCK
      ?auto_844724 - BLOCK
      ?auto_844725 - BLOCK
      ?auto_844726 - BLOCK
      ?auto_844727 - BLOCK
      ?auto_844728 - BLOCK
      ?auto_844729 - BLOCK
      ?auto_844730 - BLOCK
      ?auto_844731 - BLOCK
    )
    :vars
    (
      ?auto_844732 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_844731 ?auto_844732 ) ( ON-TABLE ?auto_844714 ) ( ON ?auto_844715 ?auto_844714 ) ( ON ?auto_844716 ?auto_844715 ) ( ON ?auto_844717 ?auto_844716 ) ( ON ?auto_844718 ?auto_844717 ) ( ON ?auto_844719 ?auto_844718 ) ( not ( = ?auto_844714 ?auto_844715 ) ) ( not ( = ?auto_844714 ?auto_844716 ) ) ( not ( = ?auto_844714 ?auto_844717 ) ) ( not ( = ?auto_844714 ?auto_844718 ) ) ( not ( = ?auto_844714 ?auto_844719 ) ) ( not ( = ?auto_844714 ?auto_844720 ) ) ( not ( = ?auto_844714 ?auto_844721 ) ) ( not ( = ?auto_844714 ?auto_844722 ) ) ( not ( = ?auto_844714 ?auto_844723 ) ) ( not ( = ?auto_844714 ?auto_844724 ) ) ( not ( = ?auto_844714 ?auto_844725 ) ) ( not ( = ?auto_844714 ?auto_844726 ) ) ( not ( = ?auto_844714 ?auto_844727 ) ) ( not ( = ?auto_844714 ?auto_844728 ) ) ( not ( = ?auto_844714 ?auto_844729 ) ) ( not ( = ?auto_844714 ?auto_844730 ) ) ( not ( = ?auto_844714 ?auto_844731 ) ) ( not ( = ?auto_844714 ?auto_844732 ) ) ( not ( = ?auto_844715 ?auto_844716 ) ) ( not ( = ?auto_844715 ?auto_844717 ) ) ( not ( = ?auto_844715 ?auto_844718 ) ) ( not ( = ?auto_844715 ?auto_844719 ) ) ( not ( = ?auto_844715 ?auto_844720 ) ) ( not ( = ?auto_844715 ?auto_844721 ) ) ( not ( = ?auto_844715 ?auto_844722 ) ) ( not ( = ?auto_844715 ?auto_844723 ) ) ( not ( = ?auto_844715 ?auto_844724 ) ) ( not ( = ?auto_844715 ?auto_844725 ) ) ( not ( = ?auto_844715 ?auto_844726 ) ) ( not ( = ?auto_844715 ?auto_844727 ) ) ( not ( = ?auto_844715 ?auto_844728 ) ) ( not ( = ?auto_844715 ?auto_844729 ) ) ( not ( = ?auto_844715 ?auto_844730 ) ) ( not ( = ?auto_844715 ?auto_844731 ) ) ( not ( = ?auto_844715 ?auto_844732 ) ) ( not ( = ?auto_844716 ?auto_844717 ) ) ( not ( = ?auto_844716 ?auto_844718 ) ) ( not ( = ?auto_844716 ?auto_844719 ) ) ( not ( = ?auto_844716 ?auto_844720 ) ) ( not ( = ?auto_844716 ?auto_844721 ) ) ( not ( = ?auto_844716 ?auto_844722 ) ) ( not ( = ?auto_844716 ?auto_844723 ) ) ( not ( = ?auto_844716 ?auto_844724 ) ) ( not ( = ?auto_844716 ?auto_844725 ) ) ( not ( = ?auto_844716 ?auto_844726 ) ) ( not ( = ?auto_844716 ?auto_844727 ) ) ( not ( = ?auto_844716 ?auto_844728 ) ) ( not ( = ?auto_844716 ?auto_844729 ) ) ( not ( = ?auto_844716 ?auto_844730 ) ) ( not ( = ?auto_844716 ?auto_844731 ) ) ( not ( = ?auto_844716 ?auto_844732 ) ) ( not ( = ?auto_844717 ?auto_844718 ) ) ( not ( = ?auto_844717 ?auto_844719 ) ) ( not ( = ?auto_844717 ?auto_844720 ) ) ( not ( = ?auto_844717 ?auto_844721 ) ) ( not ( = ?auto_844717 ?auto_844722 ) ) ( not ( = ?auto_844717 ?auto_844723 ) ) ( not ( = ?auto_844717 ?auto_844724 ) ) ( not ( = ?auto_844717 ?auto_844725 ) ) ( not ( = ?auto_844717 ?auto_844726 ) ) ( not ( = ?auto_844717 ?auto_844727 ) ) ( not ( = ?auto_844717 ?auto_844728 ) ) ( not ( = ?auto_844717 ?auto_844729 ) ) ( not ( = ?auto_844717 ?auto_844730 ) ) ( not ( = ?auto_844717 ?auto_844731 ) ) ( not ( = ?auto_844717 ?auto_844732 ) ) ( not ( = ?auto_844718 ?auto_844719 ) ) ( not ( = ?auto_844718 ?auto_844720 ) ) ( not ( = ?auto_844718 ?auto_844721 ) ) ( not ( = ?auto_844718 ?auto_844722 ) ) ( not ( = ?auto_844718 ?auto_844723 ) ) ( not ( = ?auto_844718 ?auto_844724 ) ) ( not ( = ?auto_844718 ?auto_844725 ) ) ( not ( = ?auto_844718 ?auto_844726 ) ) ( not ( = ?auto_844718 ?auto_844727 ) ) ( not ( = ?auto_844718 ?auto_844728 ) ) ( not ( = ?auto_844718 ?auto_844729 ) ) ( not ( = ?auto_844718 ?auto_844730 ) ) ( not ( = ?auto_844718 ?auto_844731 ) ) ( not ( = ?auto_844718 ?auto_844732 ) ) ( not ( = ?auto_844719 ?auto_844720 ) ) ( not ( = ?auto_844719 ?auto_844721 ) ) ( not ( = ?auto_844719 ?auto_844722 ) ) ( not ( = ?auto_844719 ?auto_844723 ) ) ( not ( = ?auto_844719 ?auto_844724 ) ) ( not ( = ?auto_844719 ?auto_844725 ) ) ( not ( = ?auto_844719 ?auto_844726 ) ) ( not ( = ?auto_844719 ?auto_844727 ) ) ( not ( = ?auto_844719 ?auto_844728 ) ) ( not ( = ?auto_844719 ?auto_844729 ) ) ( not ( = ?auto_844719 ?auto_844730 ) ) ( not ( = ?auto_844719 ?auto_844731 ) ) ( not ( = ?auto_844719 ?auto_844732 ) ) ( not ( = ?auto_844720 ?auto_844721 ) ) ( not ( = ?auto_844720 ?auto_844722 ) ) ( not ( = ?auto_844720 ?auto_844723 ) ) ( not ( = ?auto_844720 ?auto_844724 ) ) ( not ( = ?auto_844720 ?auto_844725 ) ) ( not ( = ?auto_844720 ?auto_844726 ) ) ( not ( = ?auto_844720 ?auto_844727 ) ) ( not ( = ?auto_844720 ?auto_844728 ) ) ( not ( = ?auto_844720 ?auto_844729 ) ) ( not ( = ?auto_844720 ?auto_844730 ) ) ( not ( = ?auto_844720 ?auto_844731 ) ) ( not ( = ?auto_844720 ?auto_844732 ) ) ( not ( = ?auto_844721 ?auto_844722 ) ) ( not ( = ?auto_844721 ?auto_844723 ) ) ( not ( = ?auto_844721 ?auto_844724 ) ) ( not ( = ?auto_844721 ?auto_844725 ) ) ( not ( = ?auto_844721 ?auto_844726 ) ) ( not ( = ?auto_844721 ?auto_844727 ) ) ( not ( = ?auto_844721 ?auto_844728 ) ) ( not ( = ?auto_844721 ?auto_844729 ) ) ( not ( = ?auto_844721 ?auto_844730 ) ) ( not ( = ?auto_844721 ?auto_844731 ) ) ( not ( = ?auto_844721 ?auto_844732 ) ) ( not ( = ?auto_844722 ?auto_844723 ) ) ( not ( = ?auto_844722 ?auto_844724 ) ) ( not ( = ?auto_844722 ?auto_844725 ) ) ( not ( = ?auto_844722 ?auto_844726 ) ) ( not ( = ?auto_844722 ?auto_844727 ) ) ( not ( = ?auto_844722 ?auto_844728 ) ) ( not ( = ?auto_844722 ?auto_844729 ) ) ( not ( = ?auto_844722 ?auto_844730 ) ) ( not ( = ?auto_844722 ?auto_844731 ) ) ( not ( = ?auto_844722 ?auto_844732 ) ) ( not ( = ?auto_844723 ?auto_844724 ) ) ( not ( = ?auto_844723 ?auto_844725 ) ) ( not ( = ?auto_844723 ?auto_844726 ) ) ( not ( = ?auto_844723 ?auto_844727 ) ) ( not ( = ?auto_844723 ?auto_844728 ) ) ( not ( = ?auto_844723 ?auto_844729 ) ) ( not ( = ?auto_844723 ?auto_844730 ) ) ( not ( = ?auto_844723 ?auto_844731 ) ) ( not ( = ?auto_844723 ?auto_844732 ) ) ( not ( = ?auto_844724 ?auto_844725 ) ) ( not ( = ?auto_844724 ?auto_844726 ) ) ( not ( = ?auto_844724 ?auto_844727 ) ) ( not ( = ?auto_844724 ?auto_844728 ) ) ( not ( = ?auto_844724 ?auto_844729 ) ) ( not ( = ?auto_844724 ?auto_844730 ) ) ( not ( = ?auto_844724 ?auto_844731 ) ) ( not ( = ?auto_844724 ?auto_844732 ) ) ( not ( = ?auto_844725 ?auto_844726 ) ) ( not ( = ?auto_844725 ?auto_844727 ) ) ( not ( = ?auto_844725 ?auto_844728 ) ) ( not ( = ?auto_844725 ?auto_844729 ) ) ( not ( = ?auto_844725 ?auto_844730 ) ) ( not ( = ?auto_844725 ?auto_844731 ) ) ( not ( = ?auto_844725 ?auto_844732 ) ) ( not ( = ?auto_844726 ?auto_844727 ) ) ( not ( = ?auto_844726 ?auto_844728 ) ) ( not ( = ?auto_844726 ?auto_844729 ) ) ( not ( = ?auto_844726 ?auto_844730 ) ) ( not ( = ?auto_844726 ?auto_844731 ) ) ( not ( = ?auto_844726 ?auto_844732 ) ) ( not ( = ?auto_844727 ?auto_844728 ) ) ( not ( = ?auto_844727 ?auto_844729 ) ) ( not ( = ?auto_844727 ?auto_844730 ) ) ( not ( = ?auto_844727 ?auto_844731 ) ) ( not ( = ?auto_844727 ?auto_844732 ) ) ( not ( = ?auto_844728 ?auto_844729 ) ) ( not ( = ?auto_844728 ?auto_844730 ) ) ( not ( = ?auto_844728 ?auto_844731 ) ) ( not ( = ?auto_844728 ?auto_844732 ) ) ( not ( = ?auto_844729 ?auto_844730 ) ) ( not ( = ?auto_844729 ?auto_844731 ) ) ( not ( = ?auto_844729 ?auto_844732 ) ) ( not ( = ?auto_844730 ?auto_844731 ) ) ( not ( = ?auto_844730 ?auto_844732 ) ) ( not ( = ?auto_844731 ?auto_844732 ) ) ( ON ?auto_844730 ?auto_844731 ) ( ON ?auto_844729 ?auto_844730 ) ( ON ?auto_844728 ?auto_844729 ) ( ON ?auto_844727 ?auto_844728 ) ( ON ?auto_844726 ?auto_844727 ) ( ON ?auto_844725 ?auto_844726 ) ( ON ?auto_844724 ?auto_844725 ) ( ON ?auto_844723 ?auto_844724 ) ( ON ?auto_844722 ?auto_844723 ) ( ON ?auto_844721 ?auto_844722 ) ( CLEAR ?auto_844719 ) ( ON ?auto_844720 ?auto_844721 ) ( CLEAR ?auto_844720 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_844714 ?auto_844715 ?auto_844716 ?auto_844717 ?auto_844718 ?auto_844719 ?auto_844720 )
      ( MAKE-18PILE ?auto_844714 ?auto_844715 ?auto_844716 ?auto_844717 ?auto_844718 ?auto_844719 ?auto_844720 ?auto_844721 ?auto_844722 ?auto_844723 ?auto_844724 ?auto_844725 ?auto_844726 ?auto_844727 ?auto_844728 ?auto_844729 ?auto_844730 ?auto_844731 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_844751 - BLOCK
      ?auto_844752 - BLOCK
      ?auto_844753 - BLOCK
      ?auto_844754 - BLOCK
      ?auto_844755 - BLOCK
      ?auto_844756 - BLOCK
      ?auto_844757 - BLOCK
      ?auto_844758 - BLOCK
      ?auto_844759 - BLOCK
      ?auto_844760 - BLOCK
      ?auto_844761 - BLOCK
      ?auto_844762 - BLOCK
      ?auto_844763 - BLOCK
      ?auto_844764 - BLOCK
      ?auto_844765 - BLOCK
      ?auto_844766 - BLOCK
      ?auto_844767 - BLOCK
      ?auto_844768 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_844768 ) ( ON-TABLE ?auto_844751 ) ( ON ?auto_844752 ?auto_844751 ) ( ON ?auto_844753 ?auto_844752 ) ( ON ?auto_844754 ?auto_844753 ) ( ON ?auto_844755 ?auto_844754 ) ( ON ?auto_844756 ?auto_844755 ) ( not ( = ?auto_844751 ?auto_844752 ) ) ( not ( = ?auto_844751 ?auto_844753 ) ) ( not ( = ?auto_844751 ?auto_844754 ) ) ( not ( = ?auto_844751 ?auto_844755 ) ) ( not ( = ?auto_844751 ?auto_844756 ) ) ( not ( = ?auto_844751 ?auto_844757 ) ) ( not ( = ?auto_844751 ?auto_844758 ) ) ( not ( = ?auto_844751 ?auto_844759 ) ) ( not ( = ?auto_844751 ?auto_844760 ) ) ( not ( = ?auto_844751 ?auto_844761 ) ) ( not ( = ?auto_844751 ?auto_844762 ) ) ( not ( = ?auto_844751 ?auto_844763 ) ) ( not ( = ?auto_844751 ?auto_844764 ) ) ( not ( = ?auto_844751 ?auto_844765 ) ) ( not ( = ?auto_844751 ?auto_844766 ) ) ( not ( = ?auto_844751 ?auto_844767 ) ) ( not ( = ?auto_844751 ?auto_844768 ) ) ( not ( = ?auto_844752 ?auto_844753 ) ) ( not ( = ?auto_844752 ?auto_844754 ) ) ( not ( = ?auto_844752 ?auto_844755 ) ) ( not ( = ?auto_844752 ?auto_844756 ) ) ( not ( = ?auto_844752 ?auto_844757 ) ) ( not ( = ?auto_844752 ?auto_844758 ) ) ( not ( = ?auto_844752 ?auto_844759 ) ) ( not ( = ?auto_844752 ?auto_844760 ) ) ( not ( = ?auto_844752 ?auto_844761 ) ) ( not ( = ?auto_844752 ?auto_844762 ) ) ( not ( = ?auto_844752 ?auto_844763 ) ) ( not ( = ?auto_844752 ?auto_844764 ) ) ( not ( = ?auto_844752 ?auto_844765 ) ) ( not ( = ?auto_844752 ?auto_844766 ) ) ( not ( = ?auto_844752 ?auto_844767 ) ) ( not ( = ?auto_844752 ?auto_844768 ) ) ( not ( = ?auto_844753 ?auto_844754 ) ) ( not ( = ?auto_844753 ?auto_844755 ) ) ( not ( = ?auto_844753 ?auto_844756 ) ) ( not ( = ?auto_844753 ?auto_844757 ) ) ( not ( = ?auto_844753 ?auto_844758 ) ) ( not ( = ?auto_844753 ?auto_844759 ) ) ( not ( = ?auto_844753 ?auto_844760 ) ) ( not ( = ?auto_844753 ?auto_844761 ) ) ( not ( = ?auto_844753 ?auto_844762 ) ) ( not ( = ?auto_844753 ?auto_844763 ) ) ( not ( = ?auto_844753 ?auto_844764 ) ) ( not ( = ?auto_844753 ?auto_844765 ) ) ( not ( = ?auto_844753 ?auto_844766 ) ) ( not ( = ?auto_844753 ?auto_844767 ) ) ( not ( = ?auto_844753 ?auto_844768 ) ) ( not ( = ?auto_844754 ?auto_844755 ) ) ( not ( = ?auto_844754 ?auto_844756 ) ) ( not ( = ?auto_844754 ?auto_844757 ) ) ( not ( = ?auto_844754 ?auto_844758 ) ) ( not ( = ?auto_844754 ?auto_844759 ) ) ( not ( = ?auto_844754 ?auto_844760 ) ) ( not ( = ?auto_844754 ?auto_844761 ) ) ( not ( = ?auto_844754 ?auto_844762 ) ) ( not ( = ?auto_844754 ?auto_844763 ) ) ( not ( = ?auto_844754 ?auto_844764 ) ) ( not ( = ?auto_844754 ?auto_844765 ) ) ( not ( = ?auto_844754 ?auto_844766 ) ) ( not ( = ?auto_844754 ?auto_844767 ) ) ( not ( = ?auto_844754 ?auto_844768 ) ) ( not ( = ?auto_844755 ?auto_844756 ) ) ( not ( = ?auto_844755 ?auto_844757 ) ) ( not ( = ?auto_844755 ?auto_844758 ) ) ( not ( = ?auto_844755 ?auto_844759 ) ) ( not ( = ?auto_844755 ?auto_844760 ) ) ( not ( = ?auto_844755 ?auto_844761 ) ) ( not ( = ?auto_844755 ?auto_844762 ) ) ( not ( = ?auto_844755 ?auto_844763 ) ) ( not ( = ?auto_844755 ?auto_844764 ) ) ( not ( = ?auto_844755 ?auto_844765 ) ) ( not ( = ?auto_844755 ?auto_844766 ) ) ( not ( = ?auto_844755 ?auto_844767 ) ) ( not ( = ?auto_844755 ?auto_844768 ) ) ( not ( = ?auto_844756 ?auto_844757 ) ) ( not ( = ?auto_844756 ?auto_844758 ) ) ( not ( = ?auto_844756 ?auto_844759 ) ) ( not ( = ?auto_844756 ?auto_844760 ) ) ( not ( = ?auto_844756 ?auto_844761 ) ) ( not ( = ?auto_844756 ?auto_844762 ) ) ( not ( = ?auto_844756 ?auto_844763 ) ) ( not ( = ?auto_844756 ?auto_844764 ) ) ( not ( = ?auto_844756 ?auto_844765 ) ) ( not ( = ?auto_844756 ?auto_844766 ) ) ( not ( = ?auto_844756 ?auto_844767 ) ) ( not ( = ?auto_844756 ?auto_844768 ) ) ( not ( = ?auto_844757 ?auto_844758 ) ) ( not ( = ?auto_844757 ?auto_844759 ) ) ( not ( = ?auto_844757 ?auto_844760 ) ) ( not ( = ?auto_844757 ?auto_844761 ) ) ( not ( = ?auto_844757 ?auto_844762 ) ) ( not ( = ?auto_844757 ?auto_844763 ) ) ( not ( = ?auto_844757 ?auto_844764 ) ) ( not ( = ?auto_844757 ?auto_844765 ) ) ( not ( = ?auto_844757 ?auto_844766 ) ) ( not ( = ?auto_844757 ?auto_844767 ) ) ( not ( = ?auto_844757 ?auto_844768 ) ) ( not ( = ?auto_844758 ?auto_844759 ) ) ( not ( = ?auto_844758 ?auto_844760 ) ) ( not ( = ?auto_844758 ?auto_844761 ) ) ( not ( = ?auto_844758 ?auto_844762 ) ) ( not ( = ?auto_844758 ?auto_844763 ) ) ( not ( = ?auto_844758 ?auto_844764 ) ) ( not ( = ?auto_844758 ?auto_844765 ) ) ( not ( = ?auto_844758 ?auto_844766 ) ) ( not ( = ?auto_844758 ?auto_844767 ) ) ( not ( = ?auto_844758 ?auto_844768 ) ) ( not ( = ?auto_844759 ?auto_844760 ) ) ( not ( = ?auto_844759 ?auto_844761 ) ) ( not ( = ?auto_844759 ?auto_844762 ) ) ( not ( = ?auto_844759 ?auto_844763 ) ) ( not ( = ?auto_844759 ?auto_844764 ) ) ( not ( = ?auto_844759 ?auto_844765 ) ) ( not ( = ?auto_844759 ?auto_844766 ) ) ( not ( = ?auto_844759 ?auto_844767 ) ) ( not ( = ?auto_844759 ?auto_844768 ) ) ( not ( = ?auto_844760 ?auto_844761 ) ) ( not ( = ?auto_844760 ?auto_844762 ) ) ( not ( = ?auto_844760 ?auto_844763 ) ) ( not ( = ?auto_844760 ?auto_844764 ) ) ( not ( = ?auto_844760 ?auto_844765 ) ) ( not ( = ?auto_844760 ?auto_844766 ) ) ( not ( = ?auto_844760 ?auto_844767 ) ) ( not ( = ?auto_844760 ?auto_844768 ) ) ( not ( = ?auto_844761 ?auto_844762 ) ) ( not ( = ?auto_844761 ?auto_844763 ) ) ( not ( = ?auto_844761 ?auto_844764 ) ) ( not ( = ?auto_844761 ?auto_844765 ) ) ( not ( = ?auto_844761 ?auto_844766 ) ) ( not ( = ?auto_844761 ?auto_844767 ) ) ( not ( = ?auto_844761 ?auto_844768 ) ) ( not ( = ?auto_844762 ?auto_844763 ) ) ( not ( = ?auto_844762 ?auto_844764 ) ) ( not ( = ?auto_844762 ?auto_844765 ) ) ( not ( = ?auto_844762 ?auto_844766 ) ) ( not ( = ?auto_844762 ?auto_844767 ) ) ( not ( = ?auto_844762 ?auto_844768 ) ) ( not ( = ?auto_844763 ?auto_844764 ) ) ( not ( = ?auto_844763 ?auto_844765 ) ) ( not ( = ?auto_844763 ?auto_844766 ) ) ( not ( = ?auto_844763 ?auto_844767 ) ) ( not ( = ?auto_844763 ?auto_844768 ) ) ( not ( = ?auto_844764 ?auto_844765 ) ) ( not ( = ?auto_844764 ?auto_844766 ) ) ( not ( = ?auto_844764 ?auto_844767 ) ) ( not ( = ?auto_844764 ?auto_844768 ) ) ( not ( = ?auto_844765 ?auto_844766 ) ) ( not ( = ?auto_844765 ?auto_844767 ) ) ( not ( = ?auto_844765 ?auto_844768 ) ) ( not ( = ?auto_844766 ?auto_844767 ) ) ( not ( = ?auto_844766 ?auto_844768 ) ) ( not ( = ?auto_844767 ?auto_844768 ) ) ( ON ?auto_844767 ?auto_844768 ) ( ON ?auto_844766 ?auto_844767 ) ( ON ?auto_844765 ?auto_844766 ) ( ON ?auto_844764 ?auto_844765 ) ( ON ?auto_844763 ?auto_844764 ) ( ON ?auto_844762 ?auto_844763 ) ( ON ?auto_844761 ?auto_844762 ) ( ON ?auto_844760 ?auto_844761 ) ( ON ?auto_844759 ?auto_844760 ) ( ON ?auto_844758 ?auto_844759 ) ( CLEAR ?auto_844756 ) ( ON ?auto_844757 ?auto_844758 ) ( CLEAR ?auto_844757 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_844751 ?auto_844752 ?auto_844753 ?auto_844754 ?auto_844755 ?auto_844756 ?auto_844757 )
      ( MAKE-18PILE ?auto_844751 ?auto_844752 ?auto_844753 ?auto_844754 ?auto_844755 ?auto_844756 ?auto_844757 ?auto_844758 ?auto_844759 ?auto_844760 ?auto_844761 ?auto_844762 ?auto_844763 ?auto_844764 ?auto_844765 ?auto_844766 ?auto_844767 ?auto_844768 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_844787 - BLOCK
      ?auto_844788 - BLOCK
      ?auto_844789 - BLOCK
      ?auto_844790 - BLOCK
      ?auto_844791 - BLOCK
      ?auto_844792 - BLOCK
      ?auto_844793 - BLOCK
      ?auto_844794 - BLOCK
      ?auto_844795 - BLOCK
      ?auto_844796 - BLOCK
      ?auto_844797 - BLOCK
      ?auto_844798 - BLOCK
      ?auto_844799 - BLOCK
      ?auto_844800 - BLOCK
      ?auto_844801 - BLOCK
      ?auto_844802 - BLOCK
      ?auto_844803 - BLOCK
      ?auto_844804 - BLOCK
    )
    :vars
    (
      ?auto_844805 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_844804 ?auto_844805 ) ( ON-TABLE ?auto_844787 ) ( ON ?auto_844788 ?auto_844787 ) ( ON ?auto_844789 ?auto_844788 ) ( ON ?auto_844790 ?auto_844789 ) ( ON ?auto_844791 ?auto_844790 ) ( not ( = ?auto_844787 ?auto_844788 ) ) ( not ( = ?auto_844787 ?auto_844789 ) ) ( not ( = ?auto_844787 ?auto_844790 ) ) ( not ( = ?auto_844787 ?auto_844791 ) ) ( not ( = ?auto_844787 ?auto_844792 ) ) ( not ( = ?auto_844787 ?auto_844793 ) ) ( not ( = ?auto_844787 ?auto_844794 ) ) ( not ( = ?auto_844787 ?auto_844795 ) ) ( not ( = ?auto_844787 ?auto_844796 ) ) ( not ( = ?auto_844787 ?auto_844797 ) ) ( not ( = ?auto_844787 ?auto_844798 ) ) ( not ( = ?auto_844787 ?auto_844799 ) ) ( not ( = ?auto_844787 ?auto_844800 ) ) ( not ( = ?auto_844787 ?auto_844801 ) ) ( not ( = ?auto_844787 ?auto_844802 ) ) ( not ( = ?auto_844787 ?auto_844803 ) ) ( not ( = ?auto_844787 ?auto_844804 ) ) ( not ( = ?auto_844787 ?auto_844805 ) ) ( not ( = ?auto_844788 ?auto_844789 ) ) ( not ( = ?auto_844788 ?auto_844790 ) ) ( not ( = ?auto_844788 ?auto_844791 ) ) ( not ( = ?auto_844788 ?auto_844792 ) ) ( not ( = ?auto_844788 ?auto_844793 ) ) ( not ( = ?auto_844788 ?auto_844794 ) ) ( not ( = ?auto_844788 ?auto_844795 ) ) ( not ( = ?auto_844788 ?auto_844796 ) ) ( not ( = ?auto_844788 ?auto_844797 ) ) ( not ( = ?auto_844788 ?auto_844798 ) ) ( not ( = ?auto_844788 ?auto_844799 ) ) ( not ( = ?auto_844788 ?auto_844800 ) ) ( not ( = ?auto_844788 ?auto_844801 ) ) ( not ( = ?auto_844788 ?auto_844802 ) ) ( not ( = ?auto_844788 ?auto_844803 ) ) ( not ( = ?auto_844788 ?auto_844804 ) ) ( not ( = ?auto_844788 ?auto_844805 ) ) ( not ( = ?auto_844789 ?auto_844790 ) ) ( not ( = ?auto_844789 ?auto_844791 ) ) ( not ( = ?auto_844789 ?auto_844792 ) ) ( not ( = ?auto_844789 ?auto_844793 ) ) ( not ( = ?auto_844789 ?auto_844794 ) ) ( not ( = ?auto_844789 ?auto_844795 ) ) ( not ( = ?auto_844789 ?auto_844796 ) ) ( not ( = ?auto_844789 ?auto_844797 ) ) ( not ( = ?auto_844789 ?auto_844798 ) ) ( not ( = ?auto_844789 ?auto_844799 ) ) ( not ( = ?auto_844789 ?auto_844800 ) ) ( not ( = ?auto_844789 ?auto_844801 ) ) ( not ( = ?auto_844789 ?auto_844802 ) ) ( not ( = ?auto_844789 ?auto_844803 ) ) ( not ( = ?auto_844789 ?auto_844804 ) ) ( not ( = ?auto_844789 ?auto_844805 ) ) ( not ( = ?auto_844790 ?auto_844791 ) ) ( not ( = ?auto_844790 ?auto_844792 ) ) ( not ( = ?auto_844790 ?auto_844793 ) ) ( not ( = ?auto_844790 ?auto_844794 ) ) ( not ( = ?auto_844790 ?auto_844795 ) ) ( not ( = ?auto_844790 ?auto_844796 ) ) ( not ( = ?auto_844790 ?auto_844797 ) ) ( not ( = ?auto_844790 ?auto_844798 ) ) ( not ( = ?auto_844790 ?auto_844799 ) ) ( not ( = ?auto_844790 ?auto_844800 ) ) ( not ( = ?auto_844790 ?auto_844801 ) ) ( not ( = ?auto_844790 ?auto_844802 ) ) ( not ( = ?auto_844790 ?auto_844803 ) ) ( not ( = ?auto_844790 ?auto_844804 ) ) ( not ( = ?auto_844790 ?auto_844805 ) ) ( not ( = ?auto_844791 ?auto_844792 ) ) ( not ( = ?auto_844791 ?auto_844793 ) ) ( not ( = ?auto_844791 ?auto_844794 ) ) ( not ( = ?auto_844791 ?auto_844795 ) ) ( not ( = ?auto_844791 ?auto_844796 ) ) ( not ( = ?auto_844791 ?auto_844797 ) ) ( not ( = ?auto_844791 ?auto_844798 ) ) ( not ( = ?auto_844791 ?auto_844799 ) ) ( not ( = ?auto_844791 ?auto_844800 ) ) ( not ( = ?auto_844791 ?auto_844801 ) ) ( not ( = ?auto_844791 ?auto_844802 ) ) ( not ( = ?auto_844791 ?auto_844803 ) ) ( not ( = ?auto_844791 ?auto_844804 ) ) ( not ( = ?auto_844791 ?auto_844805 ) ) ( not ( = ?auto_844792 ?auto_844793 ) ) ( not ( = ?auto_844792 ?auto_844794 ) ) ( not ( = ?auto_844792 ?auto_844795 ) ) ( not ( = ?auto_844792 ?auto_844796 ) ) ( not ( = ?auto_844792 ?auto_844797 ) ) ( not ( = ?auto_844792 ?auto_844798 ) ) ( not ( = ?auto_844792 ?auto_844799 ) ) ( not ( = ?auto_844792 ?auto_844800 ) ) ( not ( = ?auto_844792 ?auto_844801 ) ) ( not ( = ?auto_844792 ?auto_844802 ) ) ( not ( = ?auto_844792 ?auto_844803 ) ) ( not ( = ?auto_844792 ?auto_844804 ) ) ( not ( = ?auto_844792 ?auto_844805 ) ) ( not ( = ?auto_844793 ?auto_844794 ) ) ( not ( = ?auto_844793 ?auto_844795 ) ) ( not ( = ?auto_844793 ?auto_844796 ) ) ( not ( = ?auto_844793 ?auto_844797 ) ) ( not ( = ?auto_844793 ?auto_844798 ) ) ( not ( = ?auto_844793 ?auto_844799 ) ) ( not ( = ?auto_844793 ?auto_844800 ) ) ( not ( = ?auto_844793 ?auto_844801 ) ) ( not ( = ?auto_844793 ?auto_844802 ) ) ( not ( = ?auto_844793 ?auto_844803 ) ) ( not ( = ?auto_844793 ?auto_844804 ) ) ( not ( = ?auto_844793 ?auto_844805 ) ) ( not ( = ?auto_844794 ?auto_844795 ) ) ( not ( = ?auto_844794 ?auto_844796 ) ) ( not ( = ?auto_844794 ?auto_844797 ) ) ( not ( = ?auto_844794 ?auto_844798 ) ) ( not ( = ?auto_844794 ?auto_844799 ) ) ( not ( = ?auto_844794 ?auto_844800 ) ) ( not ( = ?auto_844794 ?auto_844801 ) ) ( not ( = ?auto_844794 ?auto_844802 ) ) ( not ( = ?auto_844794 ?auto_844803 ) ) ( not ( = ?auto_844794 ?auto_844804 ) ) ( not ( = ?auto_844794 ?auto_844805 ) ) ( not ( = ?auto_844795 ?auto_844796 ) ) ( not ( = ?auto_844795 ?auto_844797 ) ) ( not ( = ?auto_844795 ?auto_844798 ) ) ( not ( = ?auto_844795 ?auto_844799 ) ) ( not ( = ?auto_844795 ?auto_844800 ) ) ( not ( = ?auto_844795 ?auto_844801 ) ) ( not ( = ?auto_844795 ?auto_844802 ) ) ( not ( = ?auto_844795 ?auto_844803 ) ) ( not ( = ?auto_844795 ?auto_844804 ) ) ( not ( = ?auto_844795 ?auto_844805 ) ) ( not ( = ?auto_844796 ?auto_844797 ) ) ( not ( = ?auto_844796 ?auto_844798 ) ) ( not ( = ?auto_844796 ?auto_844799 ) ) ( not ( = ?auto_844796 ?auto_844800 ) ) ( not ( = ?auto_844796 ?auto_844801 ) ) ( not ( = ?auto_844796 ?auto_844802 ) ) ( not ( = ?auto_844796 ?auto_844803 ) ) ( not ( = ?auto_844796 ?auto_844804 ) ) ( not ( = ?auto_844796 ?auto_844805 ) ) ( not ( = ?auto_844797 ?auto_844798 ) ) ( not ( = ?auto_844797 ?auto_844799 ) ) ( not ( = ?auto_844797 ?auto_844800 ) ) ( not ( = ?auto_844797 ?auto_844801 ) ) ( not ( = ?auto_844797 ?auto_844802 ) ) ( not ( = ?auto_844797 ?auto_844803 ) ) ( not ( = ?auto_844797 ?auto_844804 ) ) ( not ( = ?auto_844797 ?auto_844805 ) ) ( not ( = ?auto_844798 ?auto_844799 ) ) ( not ( = ?auto_844798 ?auto_844800 ) ) ( not ( = ?auto_844798 ?auto_844801 ) ) ( not ( = ?auto_844798 ?auto_844802 ) ) ( not ( = ?auto_844798 ?auto_844803 ) ) ( not ( = ?auto_844798 ?auto_844804 ) ) ( not ( = ?auto_844798 ?auto_844805 ) ) ( not ( = ?auto_844799 ?auto_844800 ) ) ( not ( = ?auto_844799 ?auto_844801 ) ) ( not ( = ?auto_844799 ?auto_844802 ) ) ( not ( = ?auto_844799 ?auto_844803 ) ) ( not ( = ?auto_844799 ?auto_844804 ) ) ( not ( = ?auto_844799 ?auto_844805 ) ) ( not ( = ?auto_844800 ?auto_844801 ) ) ( not ( = ?auto_844800 ?auto_844802 ) ) ( not ( = ?auto_844800 ?auto_844803 ) ) ( not ( = ?auto_844800 ?auto_844804 ) ) ( not ( = ?auto_844800 ?auto_844805 ) ) ( not ( = ?auto_844801 ?auto_844802 ) ) ( not ( = ?auto_844801 ?auto_844803 ) ) ( not ( = ?auto_844801 ?auto_844804 ) ) ( not ( = ?auto_844801 ?auto_844805 ) ) ( not ( = ?auto_844802 ?auto_844803 ) ) ( not ( = ?auto_844802 ?auto_844804 ) ) ( not ( = ?auto_844802 ?auto_844805 ) ) ( not ( = ?auto_844803 ?auto_844804 ) ) ( not ( = ?auto_844803 ?auto_844805 ) ) ( not ( = ?auto_844804 ?auto_844805 ) ) ( ON ?auto_844803 ?auto_844804 ) ( ON ?auto_844802 ?auto_844803 ) ( ON ?auto_844801 ?auto_844802 ) ( ON ?auto_844800 ?auto_844801 ) ( ON ?auto_844799 ?auto_844800 ) ( ON ?auto_844798 ?auto_844799 ) ( ON ?auto_844797 ?auto_844798 ) ( ON ?auto_844796 ?auto_844797 ) ( ON ?auto_844795 ?auto_844796 ) ( ON ?auto_844794 ?auto_844795 ) ( ON ?auto_844793 ?auto_844794 ) ( CLEAR ?auto_844791 ) ( ON ?auto_844792 ?auto_844793 ) ( CLEAR ?auto_844792 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_844787 ?auto_844788 ?auto_844789 ?auto_844790 ?auto_844791 ?auto_844792 )
      ( MAKE-18PILE ?auto_844787 ?auto_844788 ?auto_844789 ?auto_844790 ?auto_844791 ?auto_844792 ?auto_844793 ?auto_844794 ?auto_844795 ?auto_844796 ?auto_844797 ?auto_844798 ?auto_844799 ?auto_844800 ?auto_844801 ?auto_844802 ?auto_844803 ?auto_844804 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_844824 - BLOCK
      ?auto_844825 - BLOCK
      ?auto_844826 - BLOCK
      ?auto_844827 - BLOCK
      ?auto_844828 - BLOCK
      ?auto_844829 - BLOCK
      ?auto_844830 - BLOCK
      ?auto_844831 - BLOCK
      ?auto_844832 - BLOCK
      ?auto_844833 - BLOCK
      ?auto_844834 - BLOCK
      ?auto_844835 - BLOCK
      ?auto_844836 - BLOCK
      ?auto_844837 - BLOCK
      ?auto_844838 - BLOCK
      ?auto_844839 - BLOCK
      ?auto_844840 - BLOCK
      ?auto_844841 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_844841 ) ( ON-TABLE ?auto_844824 ) ( ON ?auto_844825 ?auto_844824 ) ( ON ?auto_844826 ?auto_844825 ) ( ON ?auto_844827 ?auto_844826 ) ( ON ?auto_844828 ?auto_844827 ) ( not ( = ?auto_844824 ?auto_844825 ) ) ( not ( = ?auto_844824 ?auto_844826 ) ) ( not ( = ?auto_844824 ?auto_844827 ) ) ( not ( = ?auto_844824 ?auto_844828 ) ) ( not ( = ?auto_844824 ?auto_844829 ) ) ( not ( = ?auto_844824 ?auto_844830 ) ) ( not ( = ?auto_844824 ?auto_844831 ) ) ( not ( = ?auto_844824 ?auto_844832 ) ) ( not ( = ?auto_844824 ?auto_844833 ) ) ( not ( = ?auto_844824 ?auto_844834 ) ) ( not ( = ?auto_844824 ?auto_844835 ) ) ( not ( = ?auto_844824 ?auto_844836 ) ) ( not ( = ?auto_844824 ?auto_844837 ) ) ( not ( = ?auto_844824 ?auto_844838 ) ) ( not ( = ?auto_844824 ?auto_844839 ) ) ( not ( = ?auto_844824 ?auto_844840 ) ) ( not ( = ?auto_844824 ?auto_844841 ) ) ( not ( = ?auto_844825 ?auto_844826 ) ) ( not ( = ?auto_844825 ?auto_844827 ) ) ( not ( = ?auto_844825 ?auto_844828 ) ) ( not ( = ?auto_844825 ?auto_844829 ) ) ( not ( = ?auto_844825 ?auto_844830 ) ) ( not ( = ?auto_844825 ?auto_844831 ) ) ( not ( = ?auto_844825 ?auto_844832 ) ) ( not ( = ?auto_844825 ?auto_844833 ) ) ( not ( = ?auto_844825 ?auto_844834 ) ) ( not ( = ?auto_844825 ?auto_844835 ) ) ( not ( = ?auto_844825 ?auto_844836 ) ) ( not ( = ?auto_844825 ?auto_844837 ) ) ( not ( = ?auto_844825 ?auto_844838 ) ) ( not ( = ?auto_844825 ?auto_844839 ) ) ( not ( = ?auto_844825 ?auto_844840 ) ) ( not ( = ?auto_844825 ?auto_844841 ) ) ( not ( = ?auto_844826 ?auto_844827 ) ) ( not ( = ?auto_844826 ?auto_844828 ) ) ( not ( = ?auto_844826 ?auto_844829 ) ) ( not ( = ?auto_844826 ?auto_844830 ) ) ( not ( = ?auto_844826 ?auto_844831 ) ) ( not ( = ?auto_844826 ?auto_844832 ) ) ( not ( = ?auto_844826 ?auto_844833 ) ) ( not ( = ?auto_844826 ?auto_844834 ) ) ( not ( = ?auto_844826 ?auto_844835 ) ) ( not ( = ?auto_844826 ?auto_844836 ) ) ( not ( = ?auto_844826 ?auto_844837 ) ) ( not ( = ?auto_844826 ?auto_844838 ) ) ( not ( = ?auto_844826 ?auto_844839 ) ) ( not ( = ?auto_844826 ?auto_844840 ) ) ( not ( = ?auto_844826 ?auto_844841 ) ) ( not ( = ?auto_844827 ?auto_844828 ) ) ( not ( = ?auto_844827 ?auto_844829 ) ) ( not ( = ?auto_844827 ?auto_844830 ) ) ( not ( = ?auto_844827 ?auto_844831 ) ) ( not ( = ?auto_844827 ?auto_844832 ) ) ( not ( = ?auto_844827 ?auto_844833 ) ) ( not ( = ?auto_844827 ?auto_844834 ) ) ( not ( = ?auto_844827 ?auto_844835 ) ) ( not ( = ?auto_844827 ?auto_844836 ) ) ( not ( = ?auto_844827 ?auto_844837 ) ) ( not ( = ?auto_844827 ?auto_844838 ) ) ( not ( = ?auto_844827 ?auto_844839 ) ) ( not ( = ?auto_844827 ?auto_844840 ) ) ( not ( = ?auto_844827 ?auto_844841 ) ) ( not ( = ?auto_844828 ?auto_844829 ) ) ( not ( = ?auto_844828 ?auto_844830 ) ) ( not ( = ?auto_844828 ?auto_844831 ) ) ( not ( = ?auto_844828 ?auto_844832 ) ) ( not ( = ?auto_844828 ?auto_844833 ) ) ( not ( = ?auto_844828 ?auto_844834 ) ) ( not ( = ?auto_844828 ?auto_844835 ) ) ( not ( = ?auto_844828 ?auto_844836 ) ) ( not ( = ?auto_844828 ?auto_844837 ) ) ( not ( = ?auto_844828 ?auto_844838 ) ) ( not ( = ?auto_844828 ?auto_844839 ) ) ( not ( = ?auto_844828 ?auto_844840 ) ) ( not ( = ?auto_844828 ?auto_844841 ) ) ( not ( = ?auto_844829 ?auto_844830 ) ) ( not ( = ?auto_844829 ?auto_844831 ) ) ( not ( = ?auto_844829 ?auto_844832 ) ) ( not ( = ?auto_844829 ?auto_844833 ) ) ( not ( = ?auto_844829 ?auto_844834 ) ) ( not ( = ?auto_844829 ?auto_844835 ) ) ( not ( = ?auto_844829 ?auto_844836 ) ) ( not ( = ?auto_844829 ?auto_844837 ) ) ( not ( = ?auto_844829 ?auto_844838 ) ) ( not ( = ?auto_844829 ?auto_844839 ) ) ( not ( = ?auto_844829 ?auto_844840 ) ) ( not ( = ?auto_844829 ?auto_844841 ) ) ( not ( = ?auto_844830 ?auto_844831 ) ) ( not ( = ?auto_844830 ?auto_844832 ) ) ( not ( = ?auto_844830 ?auto_844833 ) ) ( not ( = ?auto_844830 ?auto_844834 ) ) ( not ( = ?auto_844830 ?auto_844835 ) ) ( not ( = ?auto_844830 ?auto_844836 ) ) ( not ( = ?auto_844830 ?auto_844837 ) ) ( not ( = ?auto_844830 ?auto_844838 ) ) ( not ( = ?auto_844830 ?auto_844839 ) ) ( not ( = ?auto_844830 ?auto_844840 ) ) ( not ( = ?auto_844830 ?auto_844841 ) ) ( not ( = ?auto_844831 ?auto_844832 ) ) ( not ( = ?auto_844831 ?auto_844833 ) ) ( not ( = ?auto_844831 ?auto_844834 ) ) ( not ( = ?auto_844831 ?auto_844835 ) ) ( not ( = ?auto_844831 ?auto_844836 ) ) ( not ( = ?auto_844831 ?auto_844837 ) ) ( not ( = ?auto_844831 ?auto_844838 ) ) ( not ( = ?auto_844831 ?auto_844839 ) ) ( not ( = ?auto_844831 ?auto_844840 ) ) ( not ( = ?auto_844831 ?auto_844841 ) ) ( not ( = ?auto_844832 ?auto_844833 ) ) ( not ( = ?auto_844832 ?auto_844834 ) ) ( not ( = ?auto_844832 ?auto_844835 ) ) ( not ( = ?auto_844832 ?auto_844836 ) ) ( not ( = ?auto_844832 ?auto_844837 ) ) ( not ( = ?auto_844832 ?auto_844838 ) ) ( not ( = ?auto_844832 ?auto_844839 ) ) ( not ( = ?auto_844832 ?auto_844840 ) ) ( not ( = ?auto_844832 ?auto_844841 ) ) ( not ( = ?auto_844833 ?auto_844834 ) ) ( not ( = ?auto_844833 ?auto_844835 ) ) ( not ( = ?auto_844833 ?auto_844836 ) ) ( not ( = ?auto_844833 ?auto_844837 ) ) ( not ( = ?auto_844833 ?auto_844838 ) ) ( not ( = ?auto_844833 ?auto_844839 ) ) ( not ( = ?auto_844833 ?auto_844840 ) ) ( not ( = ?auto_844833 ?auto_844841 ) ) ( not ( = ?auto_844834 ?auto_844835 ) ) ( not ( = ?auto_844834 ?auto_844836 ) ) ( not ( = ?auto_844834 ?auto_844837 ) ) ( not ( = ?auto_844834 ?auto_844838 ) ) ( not ( = ?auto_844834 ?auto_844839 ) ) ( not ( = ?auto_844834 ?auto_844840 ) ) ( not ( = ?auto_844834 ?auto_844841 ) ) ( not ( = ?auto_844835 ?auto_844836 ) ) ( not ( = ?auto_844835 ?auto_844837 ) ) ( not ( = ?auto_844835 ?auto_844838 ) ) ( not ( = ?auto_844835 ?auto_844839 ) ) ( not ( = ?auto_844835 ?auto_844840 ) ) ( not ( = ?auto_844835 ?auto_844841 ) ) ( not ( = ?auto_844836 ?auto_844837 ) ) ( not ( = ?auto_844836 ?auto_844838 ) ) ( not ( = ?auto_844836 ?auto_844839 ) ) ( not ( = ?auto_844836 ?auto_844840 ) ) ( not ( = ?auto_844836 ?auto_844841 ) ) ( not ( = ?auto_844837 ?auto_844838 ) ) ( not ( = ?auto_844837 ?auto_844839 ) ) ( not ( = ?auto_844837 ?auto_844840 ) ) ( not ( = ?auto_844837 ?auto_844841 ) ) ( not ( = ?auto_844838 ?auto_844839 ) ) ( not ( = ?auto_844838 ?auto_844840 ) ) ( not ( = ?auto_844838 ?auto_844841 ) ) ( not ( = ?auto_844839 ?auto_844840 ) ) ( not ( = ?auto_844839 ?auto_844841 ) ) ( not ( = ?auto_844840 ?auto_844841 ) ) ( ON ?auto_844840 ?auto_844841 ) ( ON ?auto_844839 ?auto_844840 ) ( ON ?auto_844838 ?auto_844839 ) ( ON ?auto_844837 ?auto_844838 ) ( ON ?auto_844836 ?auto_844837 ) ( ON ?auto_844835 ?auto_844836 ) ( ON ?auto_844834 ?auto_844835 ) ( ON ?auto_844833 ?auto_844834 ) ( ON ?auto_844832 ?auto_844833 ) ( ON ?auto_844831 ?auto_844832 ) ( ON ?auto_844830 ?auto_844831 ) ( CLEAR ?auto_844828 ) ( ON ?auto_844829 ?auto_844830 ) ( CLEAR ?auto_844829 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_844824 ?auto_844825 ?auto_844826 ?auto_844827 ?auto_844828 ?auto_844829 )
      ( MAKE-18PILE ?auto_844824 ?auto_844825 ?auto_844826 ?auto_844827 ?auto_844828 ?auto_844829 ?auto_844830 ?auto_844831 ?auto_844832 ?auto_844833 ?auto_844834 ?auto_844835 ?auto_844836 ?auto_844837 ?auto_844838 ?auto_844839 ?auto_844840 ?auto_844841 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_844860 - BLOCK
      ?auto_844861 - BLOCK
      ?auto_844862 - BLOCK
      ?auto_844863 - BLOCK
      ?auto_844864 - BLOCK
      ?auto_844865 - BLOCK
      ?auto_844866 - BLOCK
      ?auto_844867 - BLOCK
      ?auto_844868 - BLOCK
      ?auto_844869 - BLOCK
      ?auto_844870 - BLOCK
      ?auto_844871 - BLOCK
      ?auto_844872 - BLOCK
      ?auto_844873 - BLOCK
      ?auto_844874 - BLOCK
      ?auto_844875 - BLOCK
      ?auto_844876 - BLOCK
      ?auto_844877 - BLOCK
    )
    :vars
    (
      ?auto_844878 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_844877 ?auto_844878 ) ( ON-TABLE ?auto_844860 ) ( ON ?auto_844861 ?auto_844860 ) ( ON ?auto_844862 ?auto_844861 ) ( ON ?auto_844863 ?auto_844862 ) ( not ( = ?auto_844860 ?auto_844861 ) ) ( not ( = ?auto_844860 ?auto_844862 ) ) ( not ( = ?auto_844860 ?auto_844863 ) ) ( not ( = ?auto_844860 ?auto_844864 ) ) ( not ( = ?auto_844860 ?auto_844865 ) ) ( not ( = ?auto_844860 ?auto_844866 ) ) ( not ( = ?auto_844860 ?auto_844867 ) ) ( not ( = ?auto_844860 ?auto_844868 ) ) ( not ( = ?auto_844860 ?auto_844869 ) ) ( not ( = ?auto_844860 ?auto_844870 ) ) ( not ( = ?auto_844860 ?auto_844871 ) ) ( not ( = ?auto_844860 ?auto_844872 ) ) ( not ( = ?auto_844860 ?auto_844873 ) ) ( not ( = ?auto_844860 ?auto_844874 ) ) ( not ( = ?auto_844860 ?auto_844875 ) ) ( not ( = ?auto_844860 ?auto_844876 ) ) ( not ( = ?auto_844860 ?auto_844877 ) ) ( not ( = ?auto_844860 ?auto_844878 ) ) ( not ( = ?auto_844861 ?auto_844862 ) ) ( not ( = ?auto_844861 ?auto_844863 ) ) ( not ( = ?auto_844861 ?auto_844864 ) ) ( not ( = ?auto_844861 ?auto_844865 ) ) ( not ( = ?auto_844861 ?auto_844866 ) ) ( not ( = ?auto_844861 ?auto_844867 ) ) ( not ( = ?auto_844861 ?auto_844868 ) ) ( not ( = ?auto_844861 ?auto_844869 ) ) ( not ( = ?auto_844861 ?auto_844870 ) ) ( not ( = ?auto_844861 ?auto_844871 ) ) ( not ( = ?auto_844861 ?auto_844872 ) ) ( not ( = ?auto_844861 ?auto_844873 ) ) ( not ( = ?auto_844861 ?auto_844874 ) ) ( not ( = ?auto_844861 ?auto_844875 ) ) ( not ( = ?auto_844861 ?auto_844876 ) ) ( not ( = ?auto_844861 ?auto_844877 ) ) ( not ( = ?auto_844861 ?auto_844878 ) ) ( not ( = ?auto_844862 ?auto_844863 ) ) ( not ( = ?auto_844862 ?auto_844864 ) ) ( not ( = ?auto_844862 ?auto_844865 ) ) ( not ( = ?auto_844862 ?auto_844866 ) ) ( not ( = ?auto_844862 ?auto_844867 ) ) ( not ( = ?auto_844862 ?auto_844868 ) ) ( not ( = ?auto_844862 ?auto_844869 ) ) ( not ( = ?auto_844862 ?auto_844870 ) ) ( not ( = ?auto_844862 ?auto_844871 ) ) ( not ( = ?auto_844862 ?auto_844872 ) ) ( not ( = ?auto_844862 ?auto_844873 ) ) ( not ( = ?auto_844862 ?auto_844874 ) ) ( not ( = ?auto_844862 ?auto_844875 ) ) ( not ( = ?auto_844862 ?auto_844876 ) ) ( not ( = ?auto_844862 ?auto_844877 ) ) ( not ( = ?auto_844862 ?auto_844878 ) ) ( not ( = ?auto_844863 ?auto_844864 ) ) ( not ( = ?auto_844863 ?auto_844865 ) ) ( not ( = ?auto_844863 ?auto_844866 ) ) ( not ( = ?auto_844863 ?auto_844867 ) ) ( not ( = ?auto_844863 ?auto_844868 ) ) ( not ( = ?auto_844863 ?auto_844869 ) ) ( not ( = ?auto_844863 ?auto_844870 ) ) ( not ( = ?auto_844863 ?auto_844871 ) ) ( not ( = ?auto_844863 ?auto_844872 ) ) ( not ( = ?auto_844863 ?auto_844873 ) ) ( not ( = ?auto_844863 ?auto_844874 ) ) ( not ( = ?auto_844863 ?auto_844875 ) ) ( not ( = ?auto_844863 ?auto_844876 ) ) ( not ( = ?auto_844863 ?auto_844877 ) ) ( not ( = ?auto_844863 ?auto_844878 ) ) ( not ( = ?auto_844864 ?auto_844865 ) ) ( not ( = ?auto_844864 ?auto_844866 ) ) ( not ( = ?auto_844864 ?auto_844867 ) ) ( not ( = ?auto_844864 ?auto_844868 ) ) ( not ( = ?auto_844864 ?auto_844869 ) ) ( not ( = ?auto_844864 ?auto_844870 ) ) ( not ( = ?auto_844864 ?auto_844871 ) ) ( not ( = ?auto_844864 ?auto_844872 ) ) ( not ( = ?auto_844864 ?auto_844873 ) ) ( not ( = ?auto_844864 ?auto_844874 ) ) ( not ( = ?auto_844864 ?auto_844875 ) ) ( not ( = ?auto_844864 ?auto_844876 ) ) ( not ( = ?auto_844864 ?auto_844877 ) ) ( not ( = ?auto_844864 ?auto_844878 ) ) ( not ( = ?auto_844865 ?auto_844866 ) ) ( not ( = ?auto_844865 ?auto_844867 ) ) ( not ( = ?auto_844865 ?auto_844868 ) ) ( not ( = ?auto_844865 ?auto_844869 ) ) ( not ( = ?auto_844865 ?auto_844870 ) ) ( not ( = ?auto_844865 ?auto_844871 ) ) ( not ( = ?auto_844865 ?auto_844872 ) ) ( not ( = ?auto_844865 ?auto_844873 ) ) ( not ( = ?auto_844865 ?auto_844874 ) ) ( not ( = ?auto_844865 ?auto_844875 ) ) ( not ( = ?auto_844865 ?auto_844876 ) ) ( not ( = ?auto_844865 ?auto_844877 ) ) ( not ( = ?auto_844865 ?auto_844878 ) ) ( not ( = ?auto_844866 ?auto_844867 ) ) ( not ( = ?auto_844866 ?auto_844868 ) ) ( not ( = ?auto_844866 ?auto_844869 ) ) ( not ( = ?auto_844866 ?auto_844870 ) ) ( not ( = ?auto_844866 ?auto_844871 ) ) ( not ( = ?auto_844866 ?auto_844872 ) ) ( not ( = ?auto_844866 ?auto_844873 ) ) ( not ( = ?auto_844866 ?auto_844874 ) ) ( not ( = ?auto_844866 ?auto_844875 ) ) ( not ( = ?auto_844866 ?auto_844876 ) ) ( not ( = ?auto_844866 ?auto_844877 ) ) ( not ( = ?auto_844866 ?auto_844878 ) ) ( not ( = ?auto_844867 ?auto_844868 ) ) ( not ( = ?auto_844867 ?auto_844869 ) ) ( not ( = ?auto_844867 ?auto_844870 ) ) ( not ( = ?auto_844867 ?auto_844871 ) ) ( not ( = ?auto_844867 ?auto_844872 ) ) ( not ( = ?auto_844867 ?auto_844873 ) ) ( not ( = ?auto_844867 ?auto_844874 ) ) ( not ( = ?auto_844867 ?auto_844875 ) ) ( not ( = ?auto_844867 ?auto_844876 ) ) ( not ( = ?auto_844867 ?auto_844877 ) ) ( not ( = ?auto_844867 ?auto_844878 ) ) ( not ( = ?auto_844868 ?auto_844869 ) ) ( not ( = ?auto_844868 ?auto_844870 ) ) ( not ( = ?auto_844868 ?auto_844871 ) ) ( not ( = ?auto_844868 ?auto_844872 ) ) ( not ( = ?auto_844868 ?auto_844873 ) ) ( not ( = ?auto_844868 ?auto_844874 ) ) ( not ( = ?auto_844868 ?auto_844875 ) ) ( not ( = ?auto_844868 ?auto_844876 ) ) ( not ( = ?auto_844868 ?auto_844877 ) ) ( not ( = ?auto_844868 ?auto_844878 ) ) ( not ( = ?auto_844869 ?auto_844870 ) ) ( not ( = ?auto_844869 ?auto_844871 ) ) ( not ( = ?auto_844869 ?auto_844872 ) ) ( not ( = ?auto_844869 ?auto_844873 ) ) ( not ( = ?auto_844869 ?auto_844874 ) ) ( not ( = ?auto_844869 ?auto_844875 ) ) ( not ( = ?auto_844869 ?auto_844876 ) ) ( not ( = ?auto_844869 ?auto_844877 ) ) ( not ( = ?auto_844869 ?auto_844878 ) ) ( not ( = ?auto_844870 ?auto_844871 ) ) ( not ( = ?auto_844870 ?auto_844872 ) ) ( not ( = ?auto_844870 ?auto_844873 ) ) ( not ( = ?auto_844870 ?auto_844874 ) ) ( not ( = ?auto_844870 ?auto_844875 ) ) ( not ( = ?auto_844870 ?auto_844876 ) ) ( not ( = ?auto_844870 ?auto_844877 ) ) ( not ( = ?auto_844870 ?auto_844878 ) ) ( not ( = ?auto_844871 ?auto_844872 ) ) ( not ( = ?auto_844871 ?auto_844873 ) ) ( not ( = ?auto_844871 ?auto_844874 ) ) ( not ( = ?auto_844871 ?auto_844875 ) ) ( not ( = ?auto_844871 ?auto_844876 ) ) ( not ( = ?auto_844871 ?auto_844877 ) ) ( not ( = ?auto_844871 ?auto_844878 ) ) ( not ( = ?auto_844872 ?auto_844873 ) ) ( not ( = ?auto_844872 ?auto_844874 ) ) ( not ( = ?auto_844872 ?auto_844875 ) ) ( not ( = ?auto_844872 ?auto_844876 ) ) ( not ( = ?auto_844872 ?auto_844877 ) ) ( not ( = ?auto_844872 ?auto_844878 ) ) ( not ( = ?auto_844873 ?auto_844874 ) ) ( not ( = ?auto_844873 ?auto_844875 ) ) ( not ( = ?auto_844873 ?auto_844876 ) ) ( not ( = ?auto_844873 ?auto_844877 ) ) ( not ( = ?auto_844873 ?auto_844878 ) ) ( not ( = ?auto_844874 ?auto_844875 ) ) ( not ( = ?auto_844874 ?auto_844876 ) ) ( not ( = ?auto_844874 ?auto_844877 ) ) ( not ( = ?auto_844874 ?auto_844878 ) ) ( not ( = ?auto_844875 ?auto_844876 ) ) ( not ( = ?auto_844875 ?auto_844877 ) ) ( not ( = ?auto_844875 ?auto_844878 ) ) ( not ( = ?auto_844876 ?auto_844877 ) ) ( not ( = ?auto_844876 ?auto_844878 ) ) ( not ( = ?auto_844877 ?auto_844878 ) ) ( ON ?auto_844876 ?auto_844877 ) ( ON ?auto_844875 ?auto_844876 ) ( ON ?auto_844874 ?auto_844875 ) ( ON ?auto_844873 ?auto_844874 ) ( ON ?auto_844872 ?auto_844873 ) ( ON ?auto_844871 ?auto_844872 ) ( ON ?auto_844870 ?auto_844871 ) ( ON ?auto_844869 ?auto_844870 ) ( ON ?auto_844868 ?auto_844869 ) ( ON ?auto_844867 ?auto_844868 ) ( ON ?auto_844866 ?auto_844867 ) ( ON ?auto_844865 ?auto_844866 ) ( CLEAR ?auto_844863 ) ( ON ?auto_844864 ?auto_844865 ) ( CLEAR ?auto_844864 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_844860 ?auto_844861 ?auto_844862 ?auto_844863 ?auto_844864 )
      ( MAKE-18PILE ?auto_844860 ?auto_844861 ?auto_844862 ?auto_844863 ?auto_844864 ?auto_844865 ?auto_844866 ?auto_844867 ?auto_844868 ?auto_844869 ?auto_844870 ?auto_844871 ?auto_844872 ?auto_844873 ?auto_844874 ?auto_844875 ?auto_844876 ?auto_844877 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_844897 - BLOCK
      ?auto_844898 - BLOCK
      ?auto_844899 - BLOCK
      ?auto_844900 - BLOCK
      ?auto_844901 - BLOCK
      ?auto_844902 - BLOCK
      ?auto_844903 - BLOCK
      ?auto_844904 - BLOCK
      ?auto_844905 - BLOCK
      ?auto_844906 - BLOCK
      ?auto_844907 - BLOCK
      ?auto_844908 - BLOCK
      ?auto_844909 - BLOCK
      ?auto_844910 - BLOCK
      ?auto_844911 - BLOCK
      ?auto_844912 - BLOCK
      ?auto_844913 - BLOCK
      ?auto_844914 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_844914 ) ( ON-TABLE ?auto_844897 ) ( ON ?auto_844898 ?auto_844897 ) ( ON ?auto_844899 ?auto_844898 ) ( ON ?auto_844900 ?auto_844899 ) ( not ( = ?auto_844897 ?auto_844898 ) ) ( not ( = ?auto_844897 ?auto_844899 ) ) ( not ( = ?auto_844897 ?auto_844900 ) ) ( not ( = ?auto_844897 ?auto_844901 ) ) ( not ( = ?auto_844897 ?auto_844902 ) ) ( not ( = ?auto_844897 ?auto_844903 ) ) ( not ( = ?auto_844897 ?auto_844904 ) ) ( not ( = ?auto_844897 ?auto_844905 ) ) ( not ( = ?auto_844897 ?auto_844906 ) ) ( not ( = ?auto_844897 ?auto_844907 ) ) ( not ( = ?auto_844897 ?auto_844908 ) ) ( not ( = ?auto_844897 ?auto_844909 ) ) ( not ( = ?auto_844897 ?auto_844910 ) ) ( not ( = ?auto_844897 ?auto_844911 ) ) ( not ( = ?auto_844897 ?auto_844912 ) ) ( not ( = ?auto_844897 ?auto_844913 ) ) ( not ( = ?auto_844897 ?auto_844914 ) ) ( not ( = ?auto_844898 ?auto_844899 ) ) ( not ( = ?auto_844898 ?auto_844900 ) ) ( not ( = ?auto_844898 ?auto_844901 ) ) ( not ( = ?auto_844898 ?auto_844902 ) ) ( not ( = ?auto_844898 ?auto_844903 ) ) ( not ( = ?auto_844898 ?auto_844904 ) ) ( not ( = ?auto_844898 ?auto_844905 ) ) ( not ( = ?auto_844898 ?auto_844906 ) ) ( not ( = ?auto_844898 ?auto_844907 ) ) ( not ( = ?auto_844898 ?auto_844908 ) ) ( not ( = ?auto_844898 ?auto_844909 ) ) ( not ( = ?auto_844898 ?auto_844910 ) ) ( not ( = ?auto_844898 ?auto_844911 ) ) ( not ( = ?auto_844898 ?auto_844912 ) ) ( not ( = ?auto_844898 ?auto_844913 ) ) ( not ( = ?auto_844898 ?auto_844914 ) ) ( not ( = ?auto_844899 ?auto_844900 ) ) ( not ( = ?auto_844899 ?auto_844901 ) ) ( not ( = ?auto_844899 ?auto_844902 ) ) ( not ( = ?auto_844899 ?auto_844903 ) ) ( not ( = ?auto_844899 ?auto_844904 ) ) ( not ( = ?auto_844899 ?auto_844905 ) ) ( not ( = ?auto_844899 ?auto_844906 ) ) ( not ( = ?auto_844899 ?auto_844907 ) ) ( not ( = ?auto_844899 ?auto_844908 ) ) ( not ( = ?auto_844899 ?auto_844909 ) ) ( not ( = ?auto_844899 ?auto_844910 ) ) ( not ( = ?auto_844899 ?auto_844911 ) ) ( not ( = ?auto_844899 ?auto_844912 ) ) ( not ( = ?auto_844899 ?auto_844913 ) ) ( not ( = ?auto_844899 ?auto_844914 ) ) ( not ( = ?auto_844900 ?auto_844901 ) ) ( not ( = ?auto_844900 ?auto_844902 ) ) ( not ( = ?auto_844900 ?auto_844903 ) ) ( not ( = ?auto_844900 ?auto_844904 ) ) ( not ( = ?auto_844900 ?auto_844905 ) ) ( not ( = ?auto_844900 ?auto_844906 ) ) ( not ( = ?auto_844900 ?auto_844907 ) ) ( not ( = ?auto_844900 ?auto_844908 ) ) ( not ( = ?auto_844900 ?auto_844909 ) ) ( not ( = ?auto_844900 ?auto_844910 ) ) ( not ( = ?auto_844900 ?auto_844911 ) ) ( not ( = ?auto_844900 ?auto_844912 ) ) ( not ( = ?auto_844900 ?auto_844913 ) ) ( not ( = ?auto_844900 ?auto_844914 ) ) ( not ( = ?auto_844901 ?auto_844902 ) ) ( not ( = ?auto_844901 ?auto_844903 ) ) ( not ( = ?auto_844901 ?auto_844904 ) ) ( not ( = ?auto_844901 ?auto_844905 ) ) ( not ( = ?auto_844901 ?auto_844906 ) ) ( not ( = ?auto_844901 ?auto_844907 ) ) ( not ( = ?auto_844901 ?auto_844908 ) ) ( not ( = ?auto_844901 ?auto_844909 ) ) ( not ( = ?auto_844901 ?auto_844910 ) ) ( not ( = ?auto_844901 ?auto_844911 ) ) ( not ( = ?auto_844901 ?auto_844912 ) ) ( not ( = ?auto_844901 ?auto_844913 ) ) ( not ( = ?auto_844901 ?auto_844914 ) ) ( not ( = ?auto_844902 ?auto_844903 ) ) ( not ( = ?auto_844902 ?auto_844904 ) ) ( not ( = ?auto_844902 ?auto_844905 ) ) ( not ( = ?auto_844902 ?auto_844906 ) ) ( not ( = ?auto_844902 ?auto_844907 ) ) ( not ( = ?auto_844902 ?auto_844908 ) ) ( not ( = ?auto_844902 ?auto_844909 ) ) ( not ( = ?auto_844902 ?auto_844910 ) ) ( not ( = ?auto_844902 ?auto_844911 ) ) ( not ( = ?auto_844902 ?auto_844912 ) ) ( not ( = ?auto_844902 ?auto_844913 ) ) ( not ( = ?auto_844902 ?auto_844914 ) ) ( not ( = ?auto_844903 ?auto_844904 ) ) ( not ( = ?auto_844903 ?auto_844905 ) ) ( not ( = ?auto_844903 ?auto_844906 ) ) ( not ( = ?auto_844903 ?auto_844907 ) ) ( not ( = ?auto_844903 ?auto_844908 ) ) ( not ( = ?auto_844903 ?auto_844909 ) ) ( not ( = ?auto_844903 ?auto_844910 ) ) ( not ( = ?auto_844903 ?auto_844911 ) ) ( not ( = ?auto_844903 ?auto_844912 ) ) ( not ( = ?auto_844903 ?auto_844913 ) ) ( not ( = ?auto_844903 ?auto_844914 ) ) ( not ( = ?auto_844904 ?auto_844905 ) ) ( not ( = ?auto_844904 ?auto_844906 ) ) ( not ( = ?auto_844904 ?auto_844907 ) ) ( not ( = ?auto_844904 ?auto_844908 ) ) ( not ( = ?auto_844904 ?auto_844909 ) ) ( not ( = ?auto_844904 ?auto_844910 ) ) ( not ( = ?auto_844904 ?auto_844911 ) ) ( not ( = ?auto_844904 ?auto_844912 ) ) ( not ( = ?auto_844904 ?auto_844913 ) ) ( not ( = ?auto_844904 ?auto_844914 ) ) ( not ( = ?auto_844905 ?auto_844906 ) ) ( not ( = ?auto_844905 ?auto_844907 ) ) ( not ( = ?auto_844905 ?auto_844908 ) ) ( not ( = ?auto_844905 ?auto_844909 ) ) ( not ( = ?auto_844905 ?auto_844910 ) ) ( not ( = ?auto_844905 ?auto_844911 ) ) ( not ( = ?auto_844905 ?auto_844912 ) ) ( not ( = ?auto_844905 ?auto_844913 ) ) ( not ( = ?auto_844905 ?auto_844914 ) ) ( not ( = ?auto_844906 ?auto_844907 ) ) ( not ( = ?auto_844906 ?auto_844908 ) ) ( not ( = ?auto_844906 ?auto_844909 ) ) ( not ( = ?auto_844906 ?auto_844910 ) ) ( not ( = ?auto_844906 ?auto_844911 ) ) ( not ( = ?auto_844906 ?auto_844912 ) ) ( not ( = ?auto_844906 ?auto_844913 ) ) ( not ( = ?auto_844906 ?auto_844914 ) ) ( not ( = ?auto_844907 ?auto_844908 ) ) ( not ( = ?auto_844907 ?auto_844909 ) ) ( not ( = ?auto_844907 ?auto_844910 ) ) ( not ( = ?auto_844907 ?auto_844911 ) ) ( not ( = ?auto_844907 ?auto_844912 ) ) ( not ( = ?auto_844907 ?auto_844913 ) ) ( not ( = ?auto_844907 ?auto_844914 ) ) ( not ( = ?auto_844908 ?auto_844909 ) ) ( not ( = ?auto_844908 ?auto_844910 ) ) ( not ( = ?auto_844908 ?auto_844911 ) ) ( not ( = ?auto_844908 ?auto_844912 ) ) ( not ( = ?auto_844908 ?auto_844913 ) ) ( not ( = ?auto_844908 ?auto_844914 ) ) ( not ( = ?auto_844909 ?auto_844910 ) ) ( not ( = ?auto_844909 ?auto_844911 ) ) ( not ( = ?auto_844909 ?auto_844912 ) ) ( not ( = ?auto_844909 ?auto_844913 ) ) ( not ( = ?auto_844909 ?auto_844914 ) ) ( not ( = ?auto_844910 ?auto_844911 ) ) ( not ( = ?auto_844910 ?auto_844912 ) ) ( not ( = ?auto_844910 ?auto_844913 ) ) ( not ( = ?auto_844910 ?auto_844914 ) ) ( not ( = ?auto_844911 ?auto_844912 ) ) ( not ( = ?auto_844911 ?auto_844913 ) ) ( not ( = ?auto_844911 ?auto_844914 ) ) ( not ( = ?auto_844912 ?auto_844913 ) ) ( not ( = ?auto_844912 ?auto_844914 ) ) ( not ( = ?auto_844913 ?auto_844914 ) ) ( ON ?auto_844913 ?auto_844914 ) ( ON ?auto_844912 ?auto_844913 ) ( ON ?auto_844911 ?auto_844912 ) ( ON ?auto_844910 ?auto_844911 ) ( ON ?auto_844909 ?auto_844910 ) ( ON ?auto_844908 ?auto_844909 ) ( ON ?auto_844907 ?auto_844908 ) ( ON ?auto_844906 ?auto_844907 ) ( ON ?auto_844905 ?auto_844906 ) ( ON ?auto_844904 ?auto_844905 ) ( ON ?auto_844903 ?auto_844904 ) ( ON ?auto_844902 ?auto_844903 ) ( CLEAR ?auto_844900 ) ( ON ?auto_844901 ?auto_844902 ) ( CLEAR ?auto_844901 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_844897 ?auto_844898 ?auto_844899 ?auto_844900 ?auto_844901 )
      ( MAKE-18PILE ?auto_844897 ?auto_844898 ?auto_844899 ?auto_844900 ?auto_844901 ?auto_844902 ?auto_844903 ?auto_844904 ?auto_844905 ?auto_844906 ?auto_844907 ?auto_844908 ?auto_844909 ?auto_844910 ?auto_844911 ?auto_844912 ?auto_844913 ?auto_844914 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_844933 - BLOCK
      ?auto_844934 - BLOCK
      ?auto_844935 - BLOCK
      ?auto_844936 - BLOCK
      ?auto_844937 - BLOCK
      ?auto_844938 - BLOCK
      ?auto_844939 - BLOCK
      ?auto_844940 - BLOCK
      ?auto_844941 - BLOCK
      ?auto_844942 - BLOCK
      ?auto_844943 - BLOCK
      ?auto_844944 - BLOCK
      ?auto_844945 - BLOCK
      ?auto_844946 - BLOCK
      ?auto_844947 - BLOCK
      ?auto_844948 - BLOCK
      ?auto_844949 - BLOCK
      ?auto_844950 - BLOCK
    )
    :vars
    (
      ?auto_844951 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_844950 ?auto_844951 ) ( ON-TABLE ?auto_844933 ) ( ON ?auto_844934 ?auto_844933 ) ( ON ?auto_844935 ?auto_844934 ) ( not ( = ?auto_844933 ?auto_844934 ) ) ( not ( = ?auto_844933 ?auto_844935 ) ) ( not ( = ?auto_844933 ?auto_844936 ) ) ( not ( = ?auto_844933 ?auto_844937 ) ) ( not ( = ?auto_844933 ?auto_844938 ) ) ( not ( = ?auto_844933 ?auto_844939 ) ) ( not ( = ?auto_844933 ?auto_844940 ) ) ( not ( = ?auto_844933 ?auto_844941 ) ) ( not ( = ?auto_844933 ?auto_844942 ) ) ( not ( = ?auto_844933 ?auto_844943 ) ) ( not ( = ?auto_844933 ?auto_844944 ) ) ( not ( = ?auto_844933 ?auto_844945 ) ) ( not ( = ?auto_844933 ?auto_844946 ) ) ( not ( = ?auto_844933 ?auto_844947 ) ) ( not ( = ?auto_844933 ?auto_844948 ) ) ( not ( = ?auto_844933 ?auto_844949 ) ) ( not ( = ?auto_844933 ?auto_844950 ) ) ( not ( = ?auto_844933 ?auto_844951 ) ) ( not ( = ?auto_844934 ?auto_844935 ) ) ( not ( = ?auto_844934 ?auto_844936 ) ) ( not ( = ?auto_844934 ?auto_844937 ) ) ( not ( = ?auto_844934 ?auto_844938 ) ) ( not ( = ?auto_844934 ?auto_844939 ) ) ( not ( = ?auto_844934 ?auto_844940 ) ) ( not ( = ?auto_844934 ?auto_844941 ) ) ( not ( = ?auto_844934 ?auto_844942 ) ) ( not ( = ?auto_844934 ?auto_844943 ) ) ( not ( = ?auto_844934 ?auto_844944 ) ) ( not ( = ?auto_844934 ?auto_844945 ) ) ( not ( = ?auto_844934 ?auto_844946 ) ) ( not ( = ?auto_844934 ?auto_844947 ) ) ( not ( = ?auto_844934 ?auto_844948 ) ) ( not ( = ?auto_844934 ?auto_844949 ) ) ( not ( = ?auto_844934 ?auto_844950 ) ) ( not ( = ?auto_844934 ?auto_844951 ) ) ( not ( = ?auto_844935 ?auto_844936 ) ) ( not ( = ?auto_844935 ?auto_844937 ) ) ( not ( = ?auto_844935 ?auto_844938 ) ) ( not ( = ?auto_844935 ?auto_844939 ) ) ( not ( = ?auto_844935 ?auto_844940 ) ) ( not ( = ?auto_844935 ?auto_844941 ) ) ( not ( = ?auto_844935 ?auto_844942 ) ) ( not ( = ?auto_844935 ?auto_844943 ) ) ( not ( = ?auto_844935 ?auto_844944 ) ) ( not ( = ?auto_844935 ?auto_844945 ) ) ( not ( = ?auto_844935 ?auto_844946 ) ) ( not ( = ?auto_844935 ?auto_844947 ) ) ( not ( = ?auto_844935 ?auto_844948 ) ) ( not ( = ?auto_844935 ?auto_844949 ) ) ( not ( = ?auto_844935 ?auto_844950 ) ) ( not ( = ?auto_844935 ?auto_844951 ) ) ( not ( = ?auto_844936 ?auto_844937 ) ) ( not ( = ?auto_844936 ?auto_844938 ) ) ( not ( = ?auto_844936 ?auto_844939 ) ) ( not ( = ?auto_844936 ?auto_844940 ) ) ( not ( = ?auto_844936 ?auto_844941 ) ) ( not ( = ?auto_844936 ?auto_844942 ) ) ( not ( = ?auto_844936 ?auto_844943 ) ) ( not ( = ?auto_844936 ?auto_844944 ) ) ( not ( = ?auto_844936 ?auto_844945 ) ) ( not ( = ?auto_844936 ?auto_844946 ) ) ( not ( = ?auto_844936 ?auto_844947 ) ) ( not ( = ?auto_844936 ?auto_844948 ) ) ( not ( = ?auto_844936 ?auto_844949 ) ) ( not ( = ?auto_844936 ?auto_844950 ) ) ( not ( = ?auto_844936 ?auto_844951 ) ) ( not ( = ?auto_844937 ?auto_844938 ) ) ( not ( = ?auto_844937 ?auto_844939 ) ) ( not ( = ?auto_844937 ?auto_844940 ) ) ( not ( = ?auto_844937 ?auto_844941 ) ) ( not ( = ?auto_844937 ?auto_844942 ) ) ( not ( = ?auto_844937 ?auto_844943 ) ) ( not ( = ?auto_844937 ?auto_844944 ) ) ( not ( = ?auto_844937 ?auto_844945 ) ) ( not ( = ?auto_844937 ?auto_844946 ) ) ( not ( = ?auto_844937 ?auto_844947 ) ) ( not ( = ?auto_844937 ?auto_844948 ) ) ( not ( = ?auto_844937 ?auto_844949 ) ) ( not ( = ?auto_844937 ?auto_844950 ) ) ( not ( = ?auto_844937 ?auto_844951 ) ) ( not ( = ?auto_844938 ?auto_844939 ) ) ( not ( = ?auto_844938 ?auto_844940 ) ) ( not ( = ?auto_844938 ?auto_844941 ) ) ( not ( = ?auto_844938 ?auto_844942 ) ) ( not ( = ?auto_844938 ?auto_844943 ) ) ( not ( = ?auto_844938 ?auto_844944 ) ) ( not ( = ?auto_844938 ?auto_844945 ) ) ( not ( = ?auto_844938 ?auto_844946 ) ) ( not ( = ?auto_844938 ?auto_844947 ) ) ( not ( = ?auto_844938 ?auto_844948 ) ) ( not ( = ?auto_844938 ?auto_844949 ) ) ( not ( = ?auto_844938 ?auto_844950 ) ) ( not ( = ?auto_844938 ?auto_844951 ) ) ( not ( = ?auto_844939 ?auto_844940 ) ) ( not ( = ?auto_844939 ?auto_844941 ) ) ( not ( = ?auto_844939 ?auto_844942 ) ) ( not ( = ?auto_844939 ?auto_844943 ) ) ( not ( = ?auto_844939 ?auto_844944 ) ) ( not ( = ?auto_844939 ?auto_844945 ) ) ( not ( = ?auto_844939 ?auto_844946 ) ) ( not ( = ?auto_844939 ?auto_844947 ) ) ( not ( = ?auto_844939 ?auto_844948 ) ) ( not ( = ?auto_844939 ?auto_844949 ) ) ( not ( = ?auto_844939 ?auto_844950 ) ) ( not ( = ?auto_844939 ?auto_844951 ) ) ( not ( = ?auto_844940 ?auto_844941 ) ) ( not ( = ?auto_844940 ?auto_844942 ) ) ( not ( = ?auto_844940 ?auto_844943 ) ) ( not ( = ?auto_844940 ?auto_844944 ) ) ( not ( = ?auto_844940 ?auto_844945 ) ) ( not ( = ?auto_844940 ?auto_844946 ) ) ( not ( = ?auto_844940 ?auto_844947 ) ) ( not ( = ?auto_844940 ?auto_844948 ) ) ( not ( = ?auto_844940 ?auto_844949 ) ) ( not ( = ?auto_844940 ?auto_844950 ) ) ( not ( = ?auto_844940 ?auto_844951 ) ) ( not ( = ?auto_844941 ?auto_844942 ) ) ( not ( = ?auto_844941 ?auto_844943 ) ) ( not ( = ?auto_844941 ?auto_844944 ) ) ( not ( = ?auto_844941 ?auto_844945 ) ) ( not ( = ?auto_844941 ?auto_844946 ) ) ( not ( = ?auto_844941 ?auto_844947 ) ) ( not ( = ?auto_844941 ?auto_844948 ) ) ( not ( = ?auto_844941 ?auto_844949 ) ) ( not ( = ?auto_844941 ?auto_844950 ) ) ( not ( = ?auto_844941 ?auto_844951 ) ) ( not ( = ?auto_844942 ?auto_844943 ) ) ( not ( = ?auto_844942 ?auto_844944 ) ) ( not ( = ?auto_844942 ?auto_844945 ) ) ( not ( = ?auto_844942 ?auto_844946 ) ) ( not ( = ?auto_844942 ?auto_844947 ) ) ( not ( = ?auto_844942 ?auto_844948 ) ) ( not ( = ?auto_844942 ?auto_844949 ) ) ( not ( = ?auto_844942 ?auto_844950 ) ) ( not ( = ?auto_844942 ?auto_844951 ) ) ( not ( = ?auto_844943 ?auto_844944 ) ) ( not ( = ?auto_844943 ?auto_844945 ) ) ( not ( = ?auto_844943 ?auto_844946 ) ) ( not ( = ?auto_844943 ?auto_844947 ) ) ( not ( = ?auto_844943 ?auto_844948 ) ) ( not ( = ?auto_844943 ?auto_844949 ) ) ( not ( = ?auto_844943 ?auto_844950 ) ) ( not ( = ?auto_844943 ?auto_844951 ) ) ( not ( = ?auto_844944 ?auto_844945 ) ) ( not ( = ?auto_844944 ?auto_844946 ) ) ( not ( = ?auto_844944 ?auto_844947 ) ) ( not ( = ?auto_844944 ?auto_844948 ) ) ( not ( = ?auto_844944 ?auto_844949 ) ) ( not ( = ?auto_844944 ?auto_844950 ) ) ( not ( = ?auto_844944 ?auto_844951 ) ) ( not ( = ?auto_844945 ?auto_844946 ) ) ( not ( = ?auto_844945 ?auto_844947 ) ) ( not ( = ?auto_844945 ?auto_844948 ) ) ( not ( = ?auto_844945 ?auto_844949 ) ) ( not ( = ?auto_844945 ?auto_844950 ) ) ( not ( = ?auto_844945 ?auto_844951 ) ) ( not ( = ?auto_844946 ?auto_844947 ) ) ( not ( = ?auto_844946 ?auto_844948 ) ) ( not ( = ?auto_844946 ?auto_844949 ) ) ( not ( = ?auto_844946 ?auto_844950 ) ) ( not ( = ?auto_844946 ?auto_844951 ) ) ( not ( = ?auto_844947 ?auto_844948 ) ) ( not ( = ?auto_844947 ?auto_844949 ) ) ( not ( = ?auto_844947 ?auto_844950 ) ) ( not ( = ?auto_844947 ?auto_844951 ) ) ( not ( = ?auto_844948 ?auto_844949 ) ) ( not ( = ?auto_844948 ?auto_844950 ) ) ( not ( = ?auto_844948 ?auto_844951 ) ) ( not ( = ?auto_844949 ?auto_844950 ) ) ( not ( = ?auto_844949 ?auto_844951 ) ) ( not ( = ?auto_844950 ?auto_844951 ) ) ( ON ?auto_844949 ?auto_844950 ) ( ON ?auto_844948 ?auto_844949 ) ( ON ?auto_844947 ?auto_844948 ) ( ON ?auto_844946 ?auto_844947 ) ( ON ?auto_844945 ?auto_844946 ) ( ON ?auto_844944 ?auto_844945 ) ( ON ?auto_844943 ?auto_844944 ) ( ON ?auto_844942 ?auto_844943 ) ( ON ?auto_844941 ?auto_844942 ) ( ON ?auto_844940 ?auto_844941 ) ( ON ?auto_844939 ?auto_844940 ) ( ON ?auto_844938 ?auto_844939 ) ( ON ?auto_844937 ?auto_844938 ) ( CLEAR ?auto_844935 ) ( ON ?auto_844936 ?auto_844937 ) ( CLEAR ?auto_844936 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_844933 ?auto_844934 ?auto_844935 ?auto_844936 )
      ( MAKE-18PILE ?auto_844933 ?auto_844934 ?auto_844935 ?auto_844936 ?auto_844937 ?auto_844938 ?auto_844939 ?auto_844940 ?auto_844941 ?auto_844942 ?auto_844943 ?auto_844944 ?auto_844945 ?auto_844946 ?auto_844947 ?auto_844948 ?auto_844949 ?auto_844950 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_844970 - BLOCK
      ?auto_844971 - BLOCK
      ?auto_844972 - BLOCK
      ?auto_844973 - BLOCK
      ?auto_844974 - BLOCK
      ?auto_844975 - BLOCK
      ?auto_844976 - BLOCK
      ?auto_844977 - BLOCK
      ?auto_844978 - BLOCK
      ?auto_844979 - BLOCK
      ?auto_844980 - BLOCK
      ?auto_844981 - BLOCK
      ?auto_844982 - BLOCK
      ?auto_844983 - BLOCK
      ?auto_844984 - BLOCK
      ?auto_844985 - BLOCK
      ?auto_844986 - BLOCK
      ?auto_844987 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_844987 ) ( ON-TABLE ?auto_844970 ) ( ON ?auto_844971 ?auto_844970 ) ( ON ?auto_844972 ?auto_844971 ) ( not ( = ?auto_844970 ?auto_844971 ) ) ( not ( = ?auto_844970 ?auto_844972 ) ) ( not ( = ?auto_844970 ?auto_844973 ) ) ( not ( = ?auto_844970 ?auto_844974 ) ) ( not ( = ?auto_844970 ?auto_844975 ) ) ( not ( = ?auto_844970 ?auto_844976 ) ) ( not ( = ?auto_844970 ?auto_844977 ) ) ( not ( = ?auto_844970 ?auto_844978 ) ) ( not ( = ?auto_844970 ?auto_844979 ) ) ( not ( = ?auto_844970 ?auto_844980 ) ) ( not ( = ?auto_844970 ?auto_844981 ) ) ( not ( = ?auto_844970 ?auto_844982 ) ) ( not ( = ?auto_844970 ?auto_844983 ) ) ( not ( = ?auto_844970 ?auto_844984 ) ) ( not ( = ?auto_844970 ?auto_844985 ) ) ( not ( = ?auto_844970 ?auto_844986 ) ) ( not ( = ?auto_844970 ?auto_844987 ) ) ( not ( = ?auto_844971 ?auto_844972 ) ) ( not ( = ?auto_844971 ?auto_844973 ) ) ( not ( = ?auto_844971 ?auto_844974 ) ) ( not ( = ?auto_844971 ?auto_844975 ) ) ( not ( = ?auto_844971 ?auto_844976 ) ) ( not ( = ?auto_844971 ?auto_844977 ) ) ( not ( = ?auto_844971 ?auto_844978 ) ) ( not ( = ?auto_844971 ?auto_844979 ) ) ( not ( = ?auto_844971 ?auto_844980 ) ) ( not ( = ?auto_844971 ?auto_844981 ) ) ( not ( = ?auto_844971 ?auto_844982 ) ) ( not ( = ?auto_844971 ?auto_844983 ) ) ( not ( = ?auto_844971 ?auto_844984 ) ) ( not ( = ?auto_844971 ?auto_844985 ) ) ( not ( = ?auto_844971 ?auto_844986 ) ) ( not ( = ?auto_844971 ?auto_844987 ) ) ( not ( = ?auto_844972 ?auto_844973 ) ) ( not ( = ?auto_844972 ?auto_844974 ) ) ( not ( = ?auto_844972 ?auto_844975 ) ) ( not ( = ?auto_844972 ?auto_844976 ) ) ( not ( = ?auto_844972 ?auto_844977 ) ) ( not ( = ?auto_844972 ?auto_844978 ) ) ( not ( = ?auto_844972 ?auto_844979 ) ) ( not ( = ?auto_844972 ?auto_844980 ) ) ( not ( = ?auto_844972 ?auto_844981 ) ) ( not ( = ?auto_844972 ?auto_844982 ) ) ( not ( = ?auto_844972 ?auto_844983 ) ) ( not ( = ?auto_844972 ?auto_844984 ) ) ( not ( = ?auto_844972 ?auto_844985 ) ) ( not ( = ?auto_844972 ?auto_844986 ) ) ( not ( = ?auto_844972 ?auto_844987 ) ) ( not ( = ?auto_844973 ?auto_844974 ) ) ( not ( = ?auto_844973 ?auto_844975 ) ) ( not ( = ?auto_844973 ?auto_844976 ) ) ( not ( = ?auto_844973 ?auto_844977 ) ) ( not ( = ?auto_844973 ?auto_844978 ) ) ( not ( = ?auto_844973 ?auto_844979 ) ) ( not ( = ?auto_844973 ?auto_844980 ) ) ( not ( = ?auto_844973 ?auto_844981 ) ) ( not ( = ?auto_844973 ?auto_844982 ) ) ( not ( = ?auto_844973 ?auto_844983 ) ) ( not ( = ?auto_844973 ?auto_844984 ) ) ( not ( = ?auto_844973 ?auto_844985 ) ) ( not ( = ?auto_844973 ?auto_844986 ) ) ( not ( = ?auto_844973 ?auto_844987 ) ) ( not ( = ?auto_844974 ?auto_844975 ) ) ( not ( = ?auto_844974 ?auto_844976 ) ) ( not ( = ?auto_844974 ?auto_844977 ) ) ( not ( = ?auto_844974 ?auto_844978 ) ) ( not ( = ?auto_844974 ?auto_844979 ) ) ( not ( = ?auto_844974 ?auto_844980 ) ) ( not ( = ?auto_844974 ?auto_844981 ) ) ( not ( = ?auto_844974 ?auto_844982 ) ) ( not ( = ?auto_844974 ?auto_844983 ) ) ( not ( = ?auto_844974 ?auto_844984 ) ) ( not ( = ?auto_844974 ?auto_844985 ) ) ( not ( = ?auto_844974 ?auto_844986 ) ) ( not ( = ?auto_844974 ?auto_844987 ) ) ( not ( = ?auto_844975 ?auto_844976 ) ) ( not ( = ?auto_844975 ?auto_844977 ) ) ( not ( = ?auto_844975 ?auto_844978 ) ) ( not ( = ?auto_844975 ?auto_844979 ) ) ( not ( = ?auto_844975 ?auto_844980 ) ) ( not ( = ?auto_844975 ?auto_844981 ) ) ( not ( = ?auto_844975 ?auto_844982 ) ) ( not ( = ?auto_844975 ?auto_844983 ) ) ( not ( = ?auto_844975 ?auto_844984 ) ) ( not ( = ?auto_844975 ?auto_844985 ) ) ( not ( = ?auto_844975 ?auto_844986 ) ) ( not ( = ?auto_844975 ?auto_844987 ) ) ( not ( = ?auto_844976 ?auto_844977 ) ) ( not ( = ?auto_844976 ?auto_844978 ) ) ( not ( = ?auto_844976 ?auto_844979 ) ) ( not ( = ?auto_844976 ?auto_844980 ) ) ( not ( = ?auto_844976 ?auto_844981 ) ) ( not ( = ?auto_844976 ?auto_844982 ) ) ( not ( = ?auto_844976 ?auto_844983 ) ) ( not ( = ?auto_844976 ?auto_844984 ) ) ( not ( = ?auto_844976 ?auto_844985 ) ) ( not ( = ?auto_844976 ?auto_844986 ) ) ( not ( = ?auto_844976 ?auto_844987 ) ) ( not ( = ?auto_844977 ?auto_844978 ) ) ( not ( = ?auto_844977 ?auto_844979 ) ) ( not ( = ?auto_844977 ?auto_844980 ) ) ( not ( = ?auto_844977 ?auto_844981 ) ) ( not ( = ?auto_844977 ?auto_844982 ) ) ( not ( = ?auto_844977 ?auto_844983 ) ) ( not ( = ?auto_844977 ?auto_844984 ) ) ( not ( = ?auto_844977 ?auto_844985 ) ) ( not ( = ?auto_844977 ?auto_844986 ) ) ( not ( = ?auto_844977 ?auto_844987 ) ) ( not ( = ?auto_844978 ?auto_844979 ) ) ( not ( = ?auto_844978 ?auto_844980 ) ) ( not ( = ?auto_844978 ?auto_844981 ) ) ( not ( = ?auto_844978 ?auto_844982 ) ) ( not ( = ?auto_844978 ?auto_844983 ) ) ( not ( = ?auto_844978 ?auto_844984 ) ) ( not ( = ?auto_844978 ?auto_844985 ) ) ( not ( = ?auto_844978 ?auto_844986 ) ) ( not ( = ?auto_844978 ?auto_844987 ) ) ( not ( = ?auto_844979 ?auto_844980 ) ) ( not ( = ?auto_844979 ?auto_844981 ) ) ( not ( = ?auto_844979 ?auto_844982 ) ) ( not ( = ?auto_844979 ?auto_844983 ) ) ( not ( = ?auto_844979 ?auto_844984 ) ) ( not ( = ?auto_844979 ?auto_844985 ) ) ( not ( = ?auto_844979 ?auto_844986 ) ) ( not ( = ?auto_844979 ?auto_844987 ) ) ( not ( = ?auto_844980 ?auto_844981 ) ) ( not ( = ?auto_844980 ?auto_844982 ) ) ( not ( = ?auto_844980 ?auto_844983 ) ) ( not ( = ?auto_844980 ?auto_844984 ) ) ( not ( = ?auto_844980 ?auto_844985 ) ) ( not ( = ?auto_844980 ?auto_844986 ) ) ( not ( = ?auto_844980 ?auto_844987 ) ) ( not ( = ?auto_844981 ?auto_844982 ) ) ( not ( = ?auto_844981 ?auto_844983 ) ) ( not ( = ?auto_844981 ?auto_844984 ) ) ( not ( = ?auto_844981 ?auto_844985 ) ) ( not ( = ?auto_844981 ?auto_844986 ) ) ( not ( = ?auto_844981 ?auto_844987 ) ) ( not ( = ?auto_844982 ?auto_844983 ) ) ( not ( = ?auto_844982 ?auto_844984 ) ) ( not ( = ?auto_844982 ?auto_844985 ) ) ( not ( = ?auto_844982 ?auto_844986 ) ) ( not ( = ?auto_844982 ?auto_844987 ) ) ( not ( = ?auto_844983 ?auto_844984 ) ) ( not ( = ?auto_844983 ?auto_844985 ) ) ( not ( = ?auto_844983 ?auto_844986 ) ) ( not ( = ?auto_844983 ?auto_844987 ) ) ( not ( = ?auto_844984 ?auto_844985 ) ) ( not ( = ?auto_844984 ?auto_844986 ) ) ( not ( = ?auto_844984 ?auto_844987 ) ) ( not ( = ?auto_844985 ?auto_844986 ) ) ( not ( = ?auto_844985 ?auto_844987 ) ) ( not ( = ?auto_844986 ?auto_844987 ) ) ( ON ?auto_844986 ?auto_844987 ) ( ON ?auto_844985 ?auto_844986 ) ( ON ?auto_844984 ?auto_844985 ) ( ON ?auto_844983 ?auto_844984 ) ( ON ?auto_844982 ?auto_844983 ) ( ON ?auto_844981 ?auto_844982 ) ( ON ?auto_844980 ?auto_844981 ) ( ON ?auto_844979 ?auto_844980 ) ( ON ?auto_844978 ?auto_844979 ) ( ON ?auto_844977 ?auto_844978 ) ( ON ?auto_844976 ?auto_844977 ) ( ON ?auto_844975 ?auto_844976 ) ( ON ?auto_844974 ?auto_844975 ) ( CLEAR ?auto_844972 ) ( ON ?auto_844973 ?auto_844974 ) ( CLEAR ?auto_844973 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_844970 ?auto_844971 ?auto_844972 ?auto_844973 )
      ( MAKE-18PILE ?auto_844970 ?auto_844971 ?auto_844972 ?auto_844973 ?auto_844974 ?auto_844975 ?auto_844976 ?auto_844977 ?auto_844978 ?auto_844979 ?auto_844980 ?auto_844981 ?auto_844982 ?auto_844983 ?auto_844984 ?auto_844985 ?auto_844986 ?auto_844987 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_845006 - BLOCK
      ?auto_845007 - BLOCK
      ?auto_845008 - BLOCK
      ?auto_845009 - BLOCK
      ?auto_845010 - BLOCK
      ?auto_845011 - BLOCK
      ?auto_845012 - BLOCK
      ?auto_845013 - BLOCK
      ?auto_845014 - BLOCK
      ?auto_845015 - BLOCK
      ?auto_845016 - BLOCK
      ?auto_845017 - BLOCK
      ?auto_845018 - BLOCK
      ?auto_845019 - BLOCK
      ?auto_845020 - BLOCK
      ?auto_845021 - BLOCK
      ?auto_845022 - BLOCK
      ?auto_845023 - BLOCK
    )
    :vars
    (
      ?auto_845024 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_845023 ?auto_845024 ) ( ON-TABLE ?auto_845006 ) ( ON ?auto_845007 ?auto_845006 ) ( not ( = ?auto_845006 ?auto_845007 ) ) ( not ( = ?auto_845006 ?auto_845008 ) ) ( not ( = ?auto_845006 ?auto_845009 ) ) ( not ( = ?auto_845006 ?auto_845010 ) ) ( not ( = ?auto_845006 ?auto_845011 ) ) ( not ( = ?auto_845006 ?auto_845012 ) ) ( not ( = ?auto_845006 ?auto_845013 ) ) ( not ( = ?auto_845006 ?auto_845014 ) ) ( not ( = ?auto_845006 ?auto_845015 ) ) ( not ( = ?auto_845006 ?auto_845016 ) ) ( not ( = ?auto_845006 ?auto_845017 ) ) ( not ( = ?auto_845006 ?auto_845018 ) ) ( not ( = ?auto_845006 ?auto_845019 ) ) ( not ( = ?auto_845006 ?auto_845020 ) ) ( not ( = ?auto_845006 ?auto_845021 ) ) ( not ( = ?auto_845006 ?auto_845022 ) ) ( not ( = ?auto_845006 ?auto_845023 ) ) ( not ( = ?auto_845006 ?auto_845024 ) ) ( not ( = ?auto_845007 ?auto_845008 ) ) ( not ( = ?auto_845007 ?auto_845009 ) ) ( not ( = ?auto_845007 ?auto_845010 ) ) ( not ( = ?auto_845007 ?auto_845011 ) ) ( not ( = ?auto_845007 ?auto_845012 ) ) ( not ( = ?auto_845007 ?auto_845013 ) ) ( not ( = ?auto_845007 ?auto_845014 ) ) ( not ( = ?auto_845007 ?auto_845015 ) ) ( not ( = ?auto_845007 ?auto_845016 ) ) ( not ( = ?auto_845007 ?auto_845017 ) ) ( not ( = ?auto_845007 ?auto_845018 ) ) ( not ( = ?auto_845007 ?auto_845019 ) ) ( not ( = ?auto_845007 ?auto_845020 ) ) ( not ( = ?auto_845007 ?auto_845021 ) ) ( not ( = ?auto_845007 ?auto_845022 ) ) ( not ( = ?auto_845007 ?auto_845023 ) ) ( not ( = ?auto_845007 ?auto_845024 ) ) ( not ( = ?auto_845008 ?auto_845009 ) ) ( not ( = ?auto_845008 ?auto_845010 ) ) ( not ( = ?auto_845008 ?auto_845011 ) ) ( not ( = ?auto_845008 ?auto_845012 ) ) ( not ( = ?auto_845008 ?auto_845013 ) ) ( not ( = ?auto_845008 ?auto_845014 ) ) ( not ( = ?auto_845008 ?auto_845015 ) ) ( not ( = ?auto_845008 ?auto_845016 ) ) ( not ( = ?auto_845008 ?auto_845017 ) ) ( not ( = ?auto_845008 ?auto_845018 ) ) ( not ( = ?auto_845008 ?auto_845019 ) ) ( not ( = ?auto_845008 ?auto_845020 ) ) ( not ( = ?auto_845008 ?auto_845021 ) ) ( not ( = ?auto_845008 ?auto_845022 ) ) ( not ( = ?auto_845008 ?auto_845023 ) ) ( not ( = ?auto_845008 ?auto_845024 ) ) ( not ( = ?auto_845009 ?auto_845010 ) ) ( not ( = ?auto_845009 ?auto_845011 ) ) ( not ( = ?auto_845009 ?auto_845012 ) ) ( not ( = ?auto_845009 ?auto_845013 ) ) ( not ( = ?auto_845009 ?auto_845014 ) ) ( not ( = ?auto_845009 ?auto_845015 ) ) ( not ( = ?auto_845009 ?auto_845016 ) ) ( not ( = ?auto_845009 ?auto_845017 ) ) ( not ( = ?auto_845009 ?auto_845018 ) ) ( not ( = ?auto_845009 ?auto_845019 ) ) ( not ( = ?auto_845009 ?auto_845020 ) ) ( not ( = ?auto_845009 ?auto_845021 ) ) ( not ( = ?auto_845009 ?auto_845022 ) ) ( not ( = ?auto_845009 ?auto_845023 ) ) ( not ( = ?auto_845009 ?auto_845024 ) ) ( not ( = ?auto_845010 ?auto_845011 ) ) ( not ( = ?auto_845010 ?auto_845012 ) ) ( not ( = ?auto_845010 ?auto_845013 ) ) ( not ( = ?auto_845010 ?auto_845014 ) ) ( not ( = ?auto_845010 ?auto_845015 ) ) ( not ( = ?auto_845010 ?auto_845016 ) ) ( not ( = ?auto_845010 ?auto_845017 ) ) ( not ( = ?auto_845010 ?auto_845018 ) ) ( not ( = ?auto_845010 ?auto_845019 ) ) ( not ( = ?auto_845010 ?auto_845020 ) ) ( not ( = ?auto_845010 ?auto_845021 ) ) ( not ( = ?auto_845010 ?auto_845022 ) ) ( not ( = ?auto_845010 ?auto_845023 ) ) ( not ( = ?auto_845010 ?auto_845024 ) ) ( not ( = ?auto_845011 ?auto_845012 ) ) ( not ( = ?auto_845011 ?auto_845013 ) ) ( not ( = ?auto_845011 ?auto_845014 ) ) ( not ( = ?auto_845011 ?auto_845015 ) ) ( not ( = ?auto_845011 ?auto_845016 ) ) ( not ( = ?auto_845011 ?auto_845017 ) ) ( not ( = ?auto_845011 ?auto_845018 ) ) ( not ( = ?auto_845011 ?auto_845019 ) ) ( not ( = ?auto_845011 ?auto_845020 ) ) ( not ( = ?auto_845011 ?auto_845021 ) ) ( not ( = ?auto_845011 ?auto_845022 ) ) ( not ( = ?auto_845011 ?auto_845023 ) ) ( not ( = ?auto_845011 ?auto_845024 ) ) ( not ( = ?auto_845012 ?auto_845013 ) ) ( not ( = ?auto_845012 ?auto_845014 ) ) ( not ( = ?auto_845012 ?auto_845015 ) ) ( not ( = ?auto_845012 ?auto_845016 ) ) ( not ( = ?auto_845012 ?auto_845017 ) ) ( not ( = ?auto_845012 ?auto_845018 ) ) ( not ( = ?auto_845012 ?auto_845019 ) ) ( not ( = ?auto_845012 ?auto_845020 ) ) ( not ( = ?auto_845012 ?auto_845021 ) ) ( not ( = ?auto_845012 ?auto_845022 ) ) ( not ( = ?auto_845012 ?auto_845023 ) ) ( not ( = ?auto_845012 ?auto_845024 ) ) ( not ( = ?auto_845013 ?auto_845014 ) ) ( not ( = ?auto_845013 ?auto_845015 ) ) ( not ( = ?auto_845013 ?auto_845016 ) ) ( not ( = ?auto_845013 ?auto_845017 ) ) ( not ( = ?auto_845013 ?auto_845018 ) ) ( not ( = ?auto_845013 ?auto_845019 ) ) ( not ( = ?auto_845013 ?auto_845020 ) ) ( not ( = ?auto_845013 ?auto_845021 ) ) ( not ( = ?auto_845013 ?auto_845022 ) ) ( not ( = ?auto_845013 ?auto_845023 ) ) ( not ( = ?auto_845013 ?auto_845024 ) ) ( not ( = ?auto_845014 ?auto_845015 ) ) ( not ( = ?auto_845014 ?auto_845016 ) ) ( not ( = ?auto_845014 ?auto_845017 ) ) ( not ( = ?auto_845014 ?auto_845018 ) ) ( not ( = ?auto_845014 ?auto_845019 ) ) ( not ( = ?auto_845014 ?auto_845020 ) ) ( not ( = ?auto_845014 ?auto_845021 ) ) ( not ( = ?auto_845014 ?auto_845022 ) ) ( not ( = ?auto_845014 ?auto_845023 ) ) ( not ( = ?auto_845014 ?auto_845024 ) ) ( not ( = ?auto_845015 ?auto_845016 ) ) ( not ( = ?auto_845015 ?auto_845017 ) ) ( not ( = ?auto_845015 ?auto_845018 ) ) ( not ( = ?auto_845015 ?auto_845019 ) ) ( not ( = ?auto_845015 ?auto_845020 ) ) ( not ( = ?auto_845015 ?auto_845021 ) ) ( not ( = ?auto_845015 ?auto_845022 ) ) ( not ( = ?auto_845015 ?auto_845023 ) ) ( not ( = ?auto_845015 ?auto_845024 ) ) ( not ( = ?auto_845016 ?auto_845017 ) ) ( not ( = ?auto_845016 ?auto_845018 ) ) ( not ( = ?auto_845016 ?auto_845019 ) ) ( not ( = ?auto_845016 ?auto_845020 ) ) ( not ( = ?auto_845016 ?auto_845021 ) ) ( not ( = ?auto_845016 ?auto_845022 ) ) ( not ( = ?auto_845016 ?auto_845023 ) ) ( not ( = ?auto_845016 ?auto_845024 ) ) ( not ( = ?auto_845017 ?auto_845018 ) ) ( not ( = ?auto_845017 ?auto_845019 ) ) ( not ( = ?auto_845017 ?auto_845020 ) ) ( not ( = ?auto_845017 ?auto_845021 ) ) ( not ( = ?auto_845017 ?auto_845022 ) ) ( not ( = ?auto_845017 ?auto_845023 ) ) ( not ( = ?auto_845017 ?auto_845024 ) ) ( not ( = ?auto_845018 ?auto_845019 ) ) ( not ( = ?auto_845018 ?auto_845020 ) ) ( not ( = ?auto_845018 ?auto_845021 ) ) ( not ( = ?auto_845018 ?auto_845022 ) ) ( not ( = ?auto_845018 ?auto_845023 ) ) ( not ( = ?auto_845018 ?auto_845024 ) ) ( not ( = ?auto_845019 ?auto_845020 ) ) ( not ( = ?auto_845019 ?auto_845021 ) ) ( not ( = ?auto_845019 ?auto_845022 ) ) ( not ( = ?auto_845019 ?auto_845023 ) ) ( not ( = ?auto_845019 ?auto_845024 ) ) ( not ( = ?auto_845020 ?auto_845021 ) ) ( not ( = ?auto_845020 ?auto_845022 ) ) ( not ( = ?auto_845020 ?auto_845023 ) ) ( not ( = ?auto_845020 ?auto_845024 ) ) ( not ( = ?auto_845021 ?auto_845022 ) ) ( not ( = ?auto_845021 ?auto_845023 ) ) ( not ( = ?auto_845021 ?auto_845024 ) ) ( not ( = ?auto_845022 ?auto_845023 ) ) ( not ( = ?auto_845022 ?auto_845024 ) ) ( not ( = ?auto_845023 ?auto_845024 ) ) ( ON ?auto_845022 ?auto_845023 ) ( ON ?auto_845021 ?auto_845022 ) ( ON ?auto_845020 ?auto_845021 ) ( ON ?auto_845019 ?auto_845020 ) ( ON ?auto_845018 ?auto_845019 ) ( ON ?auto_845017 ?auto_845018 ) ( ON ?auto_845016 ?auto_845017 ) ( ON ?auto_845015 ?auto_845016 ) ( ON ?auto_845014 ?auto_845015 ) ( ON ?auto_845013 ?auto_845014 ) ( ON ?auto_845012 ?auto_845013 ) ( ON ?auto_845011 ?auto_845012 ) ( ON ?auto_845010 ?auto_845011 ) ( ON ?auto_845009 ?auto_845010 ) ( CLEAR ?auto_845007 ) ( ON ?auto_845008 ?auto_845009 ) ( CLEAR ?auto_845008 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_845006 ?auto_845007 ?auto_845008 )
      ( MAKE-18PILE ?auto_845006 ?auto_845007 ?auto_845008 ?auto_845009 ?auto_845010 ?auto_845011 ?auto_845012 ?auto_845013 ?auto_845014 ?auto_845015 ?auto_845016 ?auto_845017 ?auto_845018 ?auto_845019 ?auto_845020 ?auto_845021 ?auto_845022 ?auto_845023 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_845043 - BLOCK
      ?auto_845044 - BLOCK
      ?auto_845045 - BLOCK
      ?auto_845046 - BLOCK
      ?auto_845047 - BLOCK
      ?auto_845048 - BLOCK
      ?auto_845049 - BLOCK
      ?auto_845050 - BLOCK
      ?auto_845051 - BLOCK
      ?auto_845052 - BLOCK
      ?auto_845053 - BLOCK
      ?auto_845054 - BLOCK
      ?auto_845055 - BLOCK
      ?auto_845056 - BLOCK
      ?auto_845057 - BLOCK
      ?auto_845058 - BLOCK
      ?auto_845059 - BLOCK
      ?auto_845060 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_845060 ) ( ON-TABLE ?auto_845043 ) ( ON ?auto_845044 ?auto_845043 ) ( not ( = ?auto_845043 ?auto_845044 ) ) ( not ( = ?auto_845043 ?auto_845045 ) ) ( not ( = ?auto_845043 ?auto_845046 ) ) ( not ( = ?auto_845043 ?auto_845047 ) ) ( not ( = ?auto_845043 ?auto_845048 ) ) ( not ( = ?auto_845043 ?auto_845049 ) ) ( not ( = ?auto_845043 ?auto_845050 ) ) ( not ( = ?auto_845043 ?auto_845051 ) ) ( not ( = ?auto_845043 ?auto_845052 ) ) ( not ( = ?auto_845043 ?auto_845053 ) ) ( not ( = ?auto_845043 ?auto_845054 ) ) ( not ( = ?auto_845043 ?auto_845055 ) ) ( not ( = ?auto_845043 ?auto_845056 ) ) ( not ( = ?auto_845043 ?auto_845057 ) ) ( not ( = ?auto_845043 ?auto_845058 ) ) ( not ( = ?auto_845043 ?auto_845059 ) ) ( not ( = ?auto_845043 ?auto_845060 ) ) ( not ( = ?auto_845044 ?auto_845045 ) ) ( not ( = ?auto_845044 ?auto_845046 ) ) ( not ( = ?auto_845044 ?auto_845047 ) ) ( not ( = ?auto_845044 ?auto_845048 ) ) ( not ( = ?auto_845044 ?auto_845049 ) ) ( not ( = ?auto_845044 ?auto_845050 ) ) ( not ( = ?auto_845044 ?auto_845051 ) ) ( not ( = ?auto_845044 ?auto_845052 ) ) ( not ( = ?auto_845044 ?auto_845053 ) ) ( not ( = ?auto_845044 ?auto_845054 ) ) ( not ( = ?auto_845044 ?auto_845055 ) ) ( not ( = ?auto_845044 ?auto_845056 ) ) ( not ( = ?auto_845044 ?auto_845057 ) ) ( not ( = ?auto_845044 ?auto_845058 ) ) ( not ( = ?auto_845044 ?auto_845059 ) ) ( not ( = ?auto_845044 ?auto_845060 ) ) ( not ( = ?auto_845045 ?auto_845046 ) ) ( not ( = ?auto_845045 ?auto_845047 ) ) ( not ( = ?auto_845045 ?auto_845048 ) ) ( not ( = ?auto_845045 ?auto_845049 ) ) ( not ( = ?auto_845045 ?auto_845050 ) ) ( not ( = ?auto_845045 ?auto_845051 ) ) ( not ( = ?auto_845045 ?auto_845052 ) ) ( not ( = ?auto_845045 ?auto_845053 ) ) ( not ( = ?auto_845045 ?auto_845054 ) ) ( not ( = ?auto_845045 ?auto_845055 ) ) ( not ( = ?auto_845045 ?auto_845056 ) ) ( not ( = ?auto_845045 ?auto_845057 ) ) ( not ( = ?auto_845045 ?auto_845058 ) ) ( not ( = ?auto_845045 ?auto_845059 ) ) ( not ( = ?auto_845045 ?auto_845060 ) ) ( not ( = ?auto_845046 ?auto_845047 ) ) ( not ( = ?auto_845046 ?auto_845048 ) ) ( not ( = ?auto_845046 ?auto_845049 ) ) ( not ( = ?auto_845046 ?auto_845050 ) ) ( not ( = ?auto_845046 ?auto_845051 ) ) ( not ( = ?auto_845046 ?auto_845052 ) ) ( not ( = ?auto_845046 ?auto_845053 ) ) ( not ( = ?auto_845046 ?auto_845054 ) ) ( not ( = ?auto_845046 ?auto_845055 ) ) ( not ( = ?auto_845046 ?auto_845056 ) ) ( not ( = ?auto_845046 ?auto_845057 ) ) ( not ( = ?auto_845046 ?auto_845058 ) ) ( not ( = ?auto_845046 ?auto_845059 ) ) ( not ( = ?auto_845046 ?auto_845060 ) ) ( not ( = ?auto_845047 ?auto_845048 ) ) ( not ( = ?auto_845047 ?auto_845049 ) ) ( not ( = ?auto_845047 ?auto_845050 ) ) ( not ( = ?auto_845047 ?auto_845051 ) ) ( not ( = ?auto_845047 ?auto_845052 ) ) ( not ( = ?auto_845047 ?auto_845053 ) ) ( not ( = ?auto_845047 ?auto_845054 ) ) ( not ( = ?auto_845047 ?auto_845055 ) ) ( not ( = ?auto_845047 ?auto_845056 ) ) ( not ( = ?auto_845047 ?auto_845057 ) ) ( not ( = ?auto_845047 ?auto_845058 ) ) ( not ( = ?auto_845047 ?auto_845059 ) ) ( not ( = ?auto_845047 ?auto_845060 ) ) ( not ( = ?auto_845048 ?auto_845049 ) ) ( not ( = ?auto_845048 ?auto_845050 ) ) ( not ( = ?auto_845048 ?auto_845051 ) ) ( not ( = ?auto_845048 ?auto_845052 ) ) ( not ( = ?auto_845048 ?auto_845053 ) ) ( not ( = ?auto_845048 ?auto_845054 ) ) ( not ( = ?auto_845048 ?auto_845055 ) ) ( not ( = ?auto_845048 ?auto_845056 ) ) ( not ( = ?auto_845048 ?auto_845057 ) ) ( not ( = ?auto_845048 ?auto_845058 ) ) ( not ( = ?auto_845048 ?auto_845059 ) ) ( not ( = ?auto_845048 ?auto_845060 ) ) ( not ( = ?auto_845049 ?auto_845050 ) ) ( not ( = ?auto_845049 ?auto_845051 ) ) ( not ( = ?auto_845049 ?auto_845052 ) ) ( not ( = ?auto_845049 ?auto_845053 ) ) ( not ( = ?auto_845049 ?auto_845054 ) ) ( not ( = ?auto_845049 ?auto_845055 ) ) ( not ( = ?auto_845049 ?auto_845056 ) ) ( not ( = ?auto_845049 ?auto_845057 ) ) ( not ( = ?auto_845049 ?auto_845058 ) ) ( not ( = ?auto_845049 ?auto_845059 ) ) ( not ( = ?auto_845049 ?auto_845060 ) ) ( not ( = ?auto_845050 ?auto_845051 ) ) ( not ( = ?auto_845050 ?auto_845052 ) ) ( not ( = ?auto_845050 ?auto_845053 ) ) ( not ( = ?auto_845050 ?auto_845054 ) ) ( not ( = ?auto_845050 ?auto_845055 ) ) ( not ( = ?auto_845050 ?auto_845056 ) ) ( not ( = ?auto_845050 ?auto_845057 ) ) ( not ( = ?auto_845050 ?auto_845058 ) ) ( not ( = ?auto_845050 ?auto_845059 ) ) ( not ( = ?auto_845050 ?auto_845060 ) ) ( not ( = ?auto_845051 ?auto_845052 ) ) ( not ( = ?auto_845051 ?auto_845053 ) ) ( not ( = ?auto_845051 ?auto_845054 ) ) ( not ( = ?auto_845051 ?auto_845055 ) ) ( not ( = ?auto_845051 ?auto_845056 ) ) ( not ( = ?auto_845051 ?auto_845057 ) ) ( not ( = ?auto_845051 ?auto_845058 ) ) ( not ( = ?auto_845051 ?auto_845059 ) ) ( not ( = ?auto_845051 ?auto_845060 ) ) ( not ( = ?auto_845052 ?auto_845053 ) ) ( not ( = ?auto_845052 ?auto_845054 ) ) ( not ( = ?auto_845052 ?auto_845055 ) ) ( not ( = ?auto_845052 ?auto_845056 ) ) ( not ( = ?auto_845052 ?auto_845057 ) ) ( not ( = ?auto_845052 ?auto_845058 ) ) ( not ( = ?auto_845052 ?auto_845059 ) ) ( not ( = ?auto_845052 ?auto_845060 ) ) ( not ( = ?auto_845053 ?auto_845054 ) ) ( not ( = ?auto_845053 ?auto_845055 ) ) ( not ( = ?auto_845053 ?auto_845056 ) ) ( not ( = ?auto_845053 ?auto_845057 ) ) ( not ( = ?auto_845053 ?auto_845058 ) ) ( not ( = ?auto_845053 ?auto_845059 ) ) ( not ( = ?auto_845053 ?auto_845060 ) ) ( not ( = ?auto_845054 ?auto_845055 ) ) ( not ( = ?auto_845054 ?auto_845056 ) ) ( not ( = ?auto_845054 ?auto_845057 ) ) ( not ( = ?auto_845054 ?auto_845058 ) ) ( not ( = ?auto_845054 ?auto_845059 ) ) ( not ( = ?auto_845054 ?auto_845060 ) ) ( not ( = ?auto_845055 ?auto_845056 ) ) ( not ( = ?auto_845055 ?auto_845057 ) ) ( not ( = ?auto_845055 ?auto_845058 ) ) ( not ( = ?auto_845055 ?auto_845059 ) ) ( not ( = ?auto_845055 ?auto_845060 ) ) ( not ( = ?auto_845056 ?auto_845057 ) ) ( not ( = ?auto_845056 ?auto_845058 ) ) ( not ( = ?auto_845056 ?auto_845059 ) ) ( not ( = ?auto_845056 ?auto_845060 ) ) ( not ( = ?auto_845057 ?auto_845058 ) ) ( not ( = ?auto_845057 ?auto_845059 ) ) ( not ( = ?auto_845057 ?auto_845060 ) ) ( not ( = ?auto_845058 ?auto_845059 ) ) ( not ( = ?auto_845058 ?auto_845060 ) ) ( not ( = ?auto_845059 ?auto_845060 ) ) ( ON ?auto_845059 ?auto_845060 ) ( ON ?auto_845058 ?auto_845059 ) ( ON ?auto_845057 ?auto_845058 ) ( ON ?auto_845056 ?auto_845057 ) ( ON ?auto_845055 ?auto_845056 ) ( ON ?auto_845054 ?auto_845055 ) ( ON ?auto_845053 ?auto_845054 ) ( ON ?auto_845052 ?auto_845053 ) ( ON ?auto_845051 ?auto_845052 ) ( ON ?auto_845050 ?auto_845051 ) ( ON ?auto_845049 ?auto_845050 ) ( ON ?auto_845048 ?auto_845049 ) ( ON ?auto_845047 ?auto_845048 ) ( ON ?auto_845046 ?auto_845047 ) ( CLEAR ?auto_845044 ) ( ON ?auto_845045 ?auto_845046 ) ( CLEAR ?auto_845045 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_845043 ?auto_845044 ?auto_845045 )
      ( MAKE-18PILE ?auto_845043 ?auto_845044 ?auto_845045 ?auto_845046 ?auto_845047 ?auto_845048 ?auto_845049 ?auto_845050 ?auto_845051 ?auto_845052 ?auto_845053 ?auto_845054 ?auto_845055 ?auto_845056 ?auto_845057 ?auto_845058 ?auto_845059 ?auto_845060 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_845079 - BLOCK
      ?auto_845080 - BLOCK
      ?auto_845081 - BLOCK
      ?auto_845082 - BLOCK
      ?auto_845083 - BLOCK
      ?auto_845084 - BLOCK
      ?auto_845085 - BLOCK
      ?auto_845086 - BLOCK
      ?auto_845087 - BLOCK
      ?auto_845088 - BLOCK
      ?auto_845089 - BLOCK
      ?auto_845090 - BLOCK
      ?auto_845091 - BLOCK
      ?auto_845092 - BLOCK
      ?auto_845093 - BLOCK
      ?auto_845094 - BLOCK
      ?auto_845095 - BLOCK
      ?auto_845096 - BLOCK
    )
    :vars
    (
      ?auto_845097 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_845096 ?auto_845097 ) ( ON-TABLE ?auto_845079 ) ( not ( = ?auto_845079 ?auto_845080 ) ) ( not ( = ?auto_845079 ?auto_845081 ) ) ( not ( = ?auto_845079 ?auto_845082 ) ) ( not ( = ?auto_845079 ?auto_845083 ) ) ( not ( = ?auto_845079 ?auto_845084 ) ) ( not ( = ?auto_845079 ?auto_845085 ) ) ( not ( = ?auto_845079 ?auto_845086 ) ) ( not ( = ?auto_845079 ?auto_845087 ) ) ( not ( = ?auto_845079 ?auto_845088 ) ) ( not ( = ?auto_845079 ?auto_845089 ) ) ( not ( = ?auto_845079 ?auto_845090 ) ) ( not ( = ?auto_845079 ?auto_845091 ) ) ( not ( = ?auto_845079 ?auto_845092 ) ) ( not ( = ?auto_845079 ?auto_845093 ) ) ( not ( = ?auto_845079 ?auto_845094 ) ) ( not ( = ?auto_845079 ?auto_845095 ) ) ( not ( = ?auto_845079 ?auto_845096 ) ) ( not ( = ?auto_845079 ?auto_845097 ) ) ( not ( = ?auto_845080 ?auto_845081 ) ) ( not ( = ?auto_845080 ?auto_845082 ) ) ( not ( = ?auto_845080 ?auto_845083 ) ) ( not ( = ?auto_845080 ?auto_845084 ) ) ( not ( = ?auto_845080 ?auto_845085 ) ) ( not ( = ?auto_845080 ?auto_845086 ) ) ( not ( = ?auto_845080 ?auto_845087 ) ) ( not ( = ?auto_845080 ?auto_845088 ) ) ( not ( = ?auto_845080 ?auto_845089 ) ) ( not ( = ?auto_845080 ?auto_845090 ) ) ( not ( = ?auto_845080 ?auto_845091 ) ) ( not ( = ?auto_845080 ?auto_845092 ) ) ( not ( = ?auto_845080 ?auto_845093 ) ) ( not ( = ?auto_845080 ?auto_845094 ) ) ( not ( = ?auto_845080 ?auto_845095 ) ) ( not ( = ?auto_845080 ?auto_845096 ) ) ( not ( = ?auto_845080 ?auto_845097 ) ) ( not ( = ?auto_845081 ?auto_845082 ) ) ( not ( = ?auto_845081 ?auto_845083 ) ) ( not ( = ?auto_845081 ?auto_845084 ) ) ( not ( = ?auto_845081 ?auto_845085 ) ) ( not ( = ?auto_845081 ?auto_845086 ) ) ( not ( = ?auto_845081 ?auto_845087 ) ) ( not ( = ?auto_845081 ?auto_845088 ) ) ( not ( = ?auto_845081 ?auto_845089 ) ) ( not ( = ?auto_845081 ?auto_845090 ) ) ( not ( = ?auto_845081 ?auto_845091 ) ) ( not ( = ?auto_845081 ?auto_845092 ) ) ( not ( = ?auto_845081 ?auto_845093 ) ) ( not ( = ?auto_845081 ?auto_845094 ) ) ( not ( = ?auto_845081 ?auto_845095 ) ) ( not ( = ?auto_845081 ?auto_845096 ) ) ( not ( = ?auto_845081 ?auto_845097 ) ) ( not ( = ?auto_845082 ?auto_845083 ) ) ( not ( = ?auto_845082 ?auto_845084 ) ) ( not ( = ?auto_845082 ?auto_845085 ) ) ( not ( = ?auto_845082 ?auto_845086 ) ) ( not ( = ?auto_845082 ?auto_845087 ) ) ( not ( = ?auto_845082 ?auto_845088 ) ) ( not ( = ?auto_845082 ?auto_845089 ) ) ( not ( = ?auto_845082 ?auto_845090 ) ) ( not ( = ?auto_845082 ?auto_845091 ) ) ( not ( = ?auto_845082 ?auto_845092 ) ) ( not ( = ?auto_845082 ?auto_845093 ) ) ( not ( = ?auto_845082 ?auto_845094 ) ) ( not ( = ?auto_845082 ?auto_845095 ) ) ( not ( = ?auto_845082 ?auto_845096 ) ) ( not ( = ?auto_845082 ?auto_845097 ) ) ( not ( = ?auto_845083 ?auto_845084 ) ) ( not ( = ?auto_845083 ?auto_845085 ) ) ( not ( = ?auto_845083 ?auto_845086 ) ) ( not ( = ?auto_845083 ?auto_845087 ) ) ( not ( = ?auto_845083 ?auto_845088 ) ) ( not ( = ?auto_845083 ?auto_845089 ) ) ( not ( = ?auto_845083 ?auto_845090 ) ) ( not ( = ?auto_845083 ?auto_845091 ) ) ( not ( = ?auto_845083 ?auto_845092 ) ) ( not ( = ?auto_845083 ?auto_845093 ) ) ( not ( = ?auto_845083 ?auto_845094 ) ) ( not ( = ?auto_845083 ?auto_845095 ) ) ( not ( = ?auto_845083 ?auto_845096 ) ) ( not ( = ?auto_845083 ?auto_845097 ) ) ( not ( = ?auto_845084 ?auto_845085 ) ) ( not ( = ?auto_845084 ?auto_845086 ) ) ( not ( = ?auto_845084 ?auto_845087 ) ) ( not ( = ?auto_845084 ?auto_845088 ) ) ( not ( = ?auto_845084 ?auto_845089 ) ) ( not ( = ?auto_845084 ?auto_845090 ) ) ( not ( = ?auto_845084 ?auto_845091 ) ) ( not ( = ?auto_845084 ?auto_845092 ) ) ( not ( = ?auto_845084 ?auto_845093 ) ) ( not ( = ?auto_845084 ?auto_845094 ) ) ( not ( = ?auto_845084 ?auto_845095 ) ) ( not ( = ?auto_845084 ?auto_845096 ) ) ( not ( = ?auto_845084 ?auto_845097 ) ) ( not ( = ?auto_845085 ?auto_845086 ) ) ( not ( = ?auto_845085 ?auto_845087 ) ) ( not ( = ?auto_845085 ?auto_845088 ) ) ( not ( = ?auto_845085 ?auto_845089 ) ) ( not ( = ?auto_845085 ?auto_845090 ) ) ( not ( = ?auto_845085 ?auto_845091 ) ) ( not ( = ?auto_845085 ?auto_845092 ) ) ( not ( = ?auto_845085 ?auto_845093 ) ) ( not ( = ?auto_845085 ?auto_845094 ) ) ( not ( = ?auto_845085 ?auto_845095 ) ) ( not ( = ?auto_845085 ?auto_845096 ) ) ( not ( = ?auto_845085 ?auto_845097 ) ) ( not ( = ?auto_845086 ?auto_845087 ) ) ( not ( = ?auto_845086 ?auto_845088 ) ) ( not ( = ?auto_845086 ?auto_845089 ) ) ( not ( = ?auto_845086 ?auto_845090 ) ) ( not ( = ?auto_845086 ?auto_845091 ) ) ( not ( = ?auto_845086 ?auto_845092 ) ) ( not ( = ?auto_845086 ?auto_845093 ) ) ( not ( = ?auto_845086 ?auto_845094 ) ) ( not ( = ?auto_845086 ?auto_845095 ) ) ( not ( = ?auto_845086 ?auto_845096 ) ) ( not ( = ?auto_845086 ?auto_845097 ) ) ( not ( = ?auto_845087 ?auto_845088 ) ) ( not ( = ?auto_845087 ?auto_845089 ) ) ( not ( = ?auto_845087 ?auto_845090 ) ) ( not ( = ?auto_845087 ?auto_845091 ) ) ( not ( = ?auto_845087 ?auto_845092 ) ) ( not ( = ?auto_845087 ?auto_845093 ) ) ( not ( = ?auto_845087 ?auto_845094 ) ) ( not ( = ?auto_845087 ?auto_845095 ) ) ( not ( = ?auto_845087 ?auto_845096 ) ) ( not ( = ?auto_845087 ?auto_845097 ) ) ( not ( = ?auto_845088 ?auto_845089 ) ) ( not ( = ?auto_845088 ?auto_845090 ) ) ( not ( = ?auto_845088 ?auto_845091 ) ) ( not ( = ?auto_845088 ?auto_845092 ) ) ( not ( = ?auto_845088 ?auto_845093 ) ) ( not ( = ?auto_845088 ?auto_845094 ) ) ( not ( = ?auto_845088 ?auto_845095 ) ) ( not ( = ?auto_845088 ?auto_845096 ) ) ( not ( = ?auto_845088 ?auto_845097 ) ) ( not ( = ?auto_845089 ?auto_845090 ) ) ( not ( = ?auto_845089 ?auto_845091 ) ) ( not ( = ?auto_845089 ?auto_845092 ) ) ( not ( = ?auto_845089 ?auto_845093 ) ) ( not ( = ?auto_845089 ?auto_845094 ) ) ( not ( = ?auto_845089 ?auto_845095 ) ) ( not ( = ?auto_845089 ?auto_845096 ) ) ( not ( = ?auto_845089 ?auto_845097 ) ) ( not ( = ?auto_845090 ?auto_845091 ) ) ( not ( = ?auto_845090 ?auto_845092 ) ) ( not ( = ?auto_845090 ?auto_845093 ) ) ( not ( = ?auto_845090 ?auto_845094 ) ) ( not ( = ?auto_845090 ?auto_845095 ) ) ( not ( = ?auto_845090 ?auto_845096 ) ) ( not ( = ?auto_845090 ?auto_845097 ) ) ( not ( = ?auto_845091 ?auto_845092 ) ) ( not ( = ?auto_845091 ?auto_845093 ) ) ( not ( = ?auto_845091 ?auto_845094 ) ) ( not ( = ?auto_845091 ?auto_845095 ) ) ( not ( = ?auto_845091 ?auto_845096 ) ) ( not ( = ?auto_845091 ?auto_845097 ) ) ( not ( = ?auto_845092 ?auto_845093 ) ) ( not ( = ?auto_845092 ?auto_845094 ) ) ( not ( = ?auto_845092 ?auto_845095 ) ) ( not ( = ?auto_845092 ?auto_845096 ) ) ( not ( = ?auto_845092 ?auto_845097 ) ) ( not ( = ?auto_845093 ?auto_845094 ) ) ( not ( = ?auto_845093 ?auto_845095 ) ) ( not ( = ?auto_845093 ?auto_845096 ) ) ( not ( = ?auto_845093 ?auto_845097 ) ) ( not ( = ?auto_845094 ?auto_845095 ) ) ( not ( = ?auto_845094 ?auto_845096 ) ) ( not ( = ?auto_845094 ?auto_845097 ) ) ( not ( = ?auto_845095 ?auto_845096 ) ) ( not ( = ?auto_845095 ?auto_845097 ) ) ( not ( = ?auto_845096 ?auto_845097 ) ) ( ON ?auto_845095 ?auto_845096 ) ( ON ?auto_845094 ?auto_845095 ) ( ON ?auto_845093 ?auto_845094 ) ( ON ?auto_845092 ?auto_845093 ) ( ON ?auto_845091 ?auto_845092 ) ( ON ?auto_845090 ?auto_845091 ) ( ON ?auto_845089 ?auto_845090 ) ( ON ?auto_845088 ?auto_845089 ) ( ON ?auto_845087 ?auto_845088 ) ( ON ?auto_845086 ?auto_845087 ) ( ON ?auto_845085 ?auto_845086 ) ( ON ?auto_845084 ?auto_845085 ) ( ON ?auto_845083 ?auto_845084 ) ( ON ?auto_845082 ?auto_845083 ) ( ON ?auto_845081 ?auto_845082 ) ( CLEAR ?auto_845079 ) ( ON ?auto_845080 ?auto_845081 ) ( CLEAR ?auto_845080 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_845079 ?auto_845080 )
      ( MAKE-18PILE ?auto_845079 ?auto_845080 ?auto_845081 ?auto_845082 ?auto_845083 ?auto_845084 ?auto_845085 ?auto_845086 ?auto_845087 ?auto_845088 ?auto_845089 ?auto_845090 ?auto_845091 ?auto_845092 ?auto_845093 ?auto_845094 ?auto_845095 ?auto_845096 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_845116 - BLOCK
      ?auto_845117 - BLOCK
      ?auto_845118 - BLOCK
      ?auto_845119 - BLOCK
      ?auto_845120 - BLOCK
      ?auto_845121 - BLOCK
      ?auto_845122 - BLOCK
      ?auto_845123 - BLOCK
      ?auto_845124 - BLOCK
      ?auto_845125 - BLOCK
      ?auto_845126 - BLOCK
      ?auto_845127 - BLOCK
      ?auto_845128 - BLOCK
      ?auto_845129 - BLOCK
      ?auto_845130 - BLOCK
      ?auto_845131 - BLOCK
      ?auto_845132 - BLOCK
      ?auto_845133 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_845133 ) ( ON-TABLE ?auto_845116 ) ( not ( = ?auto_845116 ?auto_845117 ) ) ( not ( = ?auto_845116 ?auto_845118 ) ) ( not ( = ?auto_845116 ?auto_845119 ) ) ( not ( = ?auto_845116 ?auto_845120 ) ) ( not ( = ?auto_845116 ?auto_845121 ) ) ( not ( = ?auto_845116 ?auto_845122 ) ) ( not ( = ?auto_845116 ?auto_845123 ) ) ( not ( = ?auto_845116 ?auto_845124 ) ) ( not ( = ?auto_845116 ?auto_845125 ) ) ( not ( = ?auto_845116 ?auto_845126 ) ) ( not ( = ?auto_845116 ?auto_845127 ) ) ( not ( = ?auto_845116 ?auto_845128 ) ) ( not ( = ?auto_845116 ?auto_845129 ) ) ( not ( = ?auto_845116 ?auto_845130 ) ) ( not ( = ?auto_845116 ?auto_845131 ) ) ( not ( = ?auto_845116 ?auto_845132 ) ) ( not ( = ?auto_845116 ?auto_845133 ) ) ( not ( = ?auto_845117 ?auto_845118 ) ) ( not ( = ?auto_845117 ?auto_845119 ) ) ( not ( = ?auto_845117 ?auto_845120 ) ) ( not ( = ?auto_845117 ?auto_845121 ) ) ( not ( = ?auto_845117 ?auto_845122 ) ) ( not ( = ?auto_845117 ?auto_845123 ) ) ( not ( = ?auto_845117 ?auto_845124 ) ) ( not ( = ?auto_845117 ?auto_845125 ) ) ( not ( = ?auto_845117 ?auto_845126 ) ) ( not ( = ?auto_845117 ?auto_845127 ) ) ( not ( = ?auto_845117 ?auto_845128 ) ) ( not ( = ?auto_845117 ?auto_845129 ) ) ( not ( = ?auto_845117 ?auto_845130 ) ) ( not ( = ?auto_845117 ?auto_845131 ) ) ( not ( = ?auto_845117 ?auto_845132 ) ) ( not ( = ?auto_845117 ?auto_845133 ) ) ( not ( = ?auto_845118 ?auto_845119 ) ) ( not ( = ?auto_845118 ?auto_845120 ) ) ( not ( = ?auto_845118 ?auto_845121 ) ) ( not ( = ?auto_845118 ?auto_845122 ) ) ( not ( = ?auto_845118 ?auto_845123 ) ) ( not ( = ?auto_845118 ?auto_845124 ) ) ( not ( = ?auto_845118 ?auto_845125 ) ) ( not ( = ?auto_845118 ?auto_845126 ) ) ( not ( = ?auto_845118 ?auto_845127 ) ) ( not ( = ?auto_845118 ?auto_845128 ) ) ( not ( = ?auto_845118 ?auto_845129 ) ) ( not ( = ?auto_845118 ?auto_845130 ) ) ( not ( = ?auto_845118 ?auto_845131 ) ) ( not ( = ?auto_845118 ?auto_845132 ) ) ( not ( = ?auto_845118 ?auto_845133 ) ) ( not ( = ?auto_845119 ?auto_845120 ) ) ( not ( = ?auto_845119 ?auto_845121 ) ) ( not ( = ?auto_845119 ?auto_845122 ) ) ( not ( = ?auto_845119 ?auto_845123 ) ) ( not ( = ?auto_845119 ?auto_845124 ) ) ( not ( = ?auto_845119 ?auto_845125 ) ) ( not ( = ?auto_845119 ?auto_845126 ) ) ( not ( = ?auto_845119 ?auto_845127 ) ) ( not ( = ?auto_845119 ?auto_845128 ) ) ( not ( = ?auto_845119 ?auto_845129 ) ) ( not ( = ?auto_845119 ?auto_845130 ) ) ( not ( = ?auto_845119 ?auto_845131 ) ) ( not ( = ?auto_845119 ?auto_845132 ) ) ( not ( = ?auto_845119 ?auto_845133 ) ) ( not ( = ?auto_845120 ?auto_845121 ) ) ( not ( = ?auto_845120 ?auto_845122 ) ) ( not ( = ?auto_845120 ?auto_845123 ) ) ( not ( = ?auto_845120 ?auto_845124 ) ) ( not ( = ?auto_845120 ?auto_845125 ) ) ( not ( = ?auto_845120 ?auto_845126 ) ) ( not ( = ?auto_845120 ?auto_845127 ) ) ( not ( = ?auto_845120 ?auto_845128 ) ) ( not ( = ?auto_845120 ?auto_845129 ) ) ( not ( = ?auto_845120 ?auto_845130 ) ) ( not ( = ?auto_845120 ?auto_845131 ) ) ( not ( = ?auto_845120 ?auto_845132 ) ) ( not ( = ?auto_845120 ?auto_845133 ) ) ( not ( = ?auto_845121 ?auto_845122 ) ) ( not ( = ?auto_845121 ?auto_845123 ) ) ( not ( = ?auto_845121 ?auto_845124 ) ) ( not ( = ?auto_845121 ?auto_845125 ) ) ( not ( = ?auto_845121 ?auto_845126 ) ) ( not ( = ?auto_845121 ?auto_845127 ) ) ( not ( = ?auto_845121 ?auto_845128 ) ) ( not ( = ?auto_845121 ?auto_845129 ) ) ( not ( = ?auto_845121 ?auto_845130 ) ) ( not ( = ?auto_845121 ?auto_845131 ) ) ( not ( = ?auto_845121 ?auto_845132 ) ) ( not ( = ?auto_845121 ?auto_845133 ) ) ( not ( = ?auto_845122 ?auto_845123 ) ) ( not ( = ?auto_845122 ?auto_845124 ) ) ( not ( = ?auto_845122 ?auto_845125 ) ) ( not ( = ?auto_845122 ?auto_845126 ) ) ( not ( = ?auto_845122 ?auto_845127 ) ) ( not ( = ?auto_845122 ?auto_845128 ) ) ( not ( = ?auto_845122 ?auto_845129 ) ) ( not ( = ?auto_845122 ?auto_845130 ) ) ( not ( = ?auto_845122 ?auto_845131 ) ) ( not ( = ?auto_845122 ?auto_845132 ) ) ( not ( = ?auto_845122 ?auto_845133 ) ) ( not ( = ?auto_845123 ?auto_845124 ) ) ( not ( = ?auto_845123 ?auto_845125 ) ) ( not ( = ?auto_845123 ?auto_845126 ) ) ( not ( = ?auto_845123 ?auto_845127 ) ) ( not ( = ?auto_845123 ?auto_845128 ) ) ( not ( = ?auto_845123 ?auto_845129 ) ) ( not ( = ?auto_845123 ?auto_845130 ) ) ( not ( = ?auto_845123 ?auto_845131 ) ) ( not ( = ?auto_845123 ?auto_845132 ) ) ( not ( = ?auto_845123 ?auto_845133 ) ) ( not ( = ?auto_845124 ?auto_845125 ) ) ( not ( = ?auto_845124 ?auto_845126 ) ) ( not ( = ?auto_845124 ?auto_845127 ) ) ( not ( = ?auto_845124 ?auto_845128 ) ) ( not ( = ?auto_845124 ?auto_845129 ) ) ( not ( = ?auto_845124 ?auto_845130 ) ) ( not ( = ?auto_845124 ?auto_845131 ) ) ( not ( = ?auto_845124 ?auto_845132 ) ) ( not ( = ?auto_845124 ?auto_845133 ) ) ( not ( = ?auto_845125 ?auto_845126 ) ) ( not ( = ?auto_845125 ?auto_845127 ) ) ( not ( = ?auto_845125 ?auto_845128 ) ) ( not ( = ?auto_845125 ?auto_845129 ) ) ( not ( = ?auto_845125 ?auto_845130 ) ) ( not ( = ?auto_845125 ?auto_845131 ) ) ( not ( = ?auto_845125 ?auto_845132 ) ) ( not ( = ?auto_845125 ?auto_845133 ) ) ( not ( = ?auto_845126 ?auto_845127 ) ) ( not ( = ?auto_845126 ?auto_845128 ) ) ( not ( = ?auto_845126 ?auto_845129 ) ) ( not ( = ?auto_845126 ?auto_845130 ) ) ( not ( = ?auto_845126 ?auto_845131 ) ) ( not ( = ?auto_845126 ?auto_845132 ) ) ( not ( = ?auto_845126 ?auto_845133 ) ) ( not ( = ?auto_845127 ?auto_845128 ) ) ( not ( = ?auto_845127 ?auto_845129 ) ) ( not ( = ?auto_845127 ?auto_845130 ) ) ( not ( = ?auto_845127 ?auto_845131 ) ) ( not ( = ?auto_845127 ?auto_845132 ) ) ( not ( = ?auto_845127 ?auto_845133 ) ) ( not ( = ?auto_845128 ?auto_845129 ) ) ( not ( = ?auto_845128 ?auto_845130 ) ) ( not ( = ?auto_845128 ?auto_845131 ) ) ( not ( = ?auto_845128 ?auto_845132 ) ) ( not ( = ?auto_845128 ?auto_845133 ) ) ( not ( = ?auto_845129 ?auto_845130 ) ) ( not ( = ?auto_845129 ?auto_845131 ) ) ( not ( = ?auto_845129 ?auto_845132 ) ) ( not ( = ?auto_845129 ?auto_845133 ) ) ( not ( = ?auto_845130 ?auto_845131 ) ) ( not ( = ?auto_845130 ?auto_845132 ) ) ( not ( = ?auto_845130 ?auto_845133 ) ) ( not ( = ?auto_845131 ?auto_845132 ) ) ( not ( = ?auto_845131 ?auto_845133 ) ) ( not ( = ?auto_845132 ?auto_845133 ) ) ( ON ?auto_845132 ?auto_845133 ) ( ON ?auto_845131 ?auto_845132 ) ( ON ?auto_845130 ?auto_845131 ) ( ON ?auto_845129 ?auto_845130 ) ( ON ?auto_845128 ?auto_845129 ) ( ON ?auto_845127 ?auto_845128 ) ( ON ?auto_845126 ?auto_845127 ) ( ON ?auto_845125 ?auto_845126 ) ( ON ?auto_845124 ?auto_845125 ) ( ON ?auto_845123 ?auto_845124 ) ( ON ?auto_845122 ?auto_845123 ) ( ON ?auto_845121 ?auto_845122 ) ( ON ?auto_845120 ?auto_845121 ) ( ON ?auto_845119 ?auto_845120 ) ( ON ?auto_845118 ?auto_845119 ) ( CLEAR ?auto_845116 ) ( ON ?auto_845117 ?auto_845118 ) ( CLEAR ?auto_845117 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_845116 ?auto_845117 )
      ( MAKE-18PILE ?auto_845116 ?auto_845117 ?auto_845118 ?auto_845119 ?auto_845120 ?auto_845121 ?auto_845122 ?auto_845123 ?auto_845124 ?auto_845125 ?auto_845126 ?auto_845127 ?auto_845128 ?auto_845129 ?auto_845130 ?auto_845131 ?auto_845132 ?auto_845133 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_845152 - BLOCK
      ?auto_845153 - BLOCK
      ?auto_845154 - BLOCK
      ?auto_845155 - BLOCK
      ?auto_845156 - BLOCK
      ?auto_845157 - BLOCK
      ?auto_845158 - BLOCK
      ?auto_845159 - BLOCK
      ?auto_845160 - BLOCK
      ?auto_845161 - BLOCK
      ?auto_845162 - BLOCK
      ?auto_845163 - BLOCK
      ?auto_845164 - BLOCK
      ?auto_845165 - BLOCK
      ?auto_845166 - BLOCK
      ?auto_845167 - BLOCK
      ?auto_845168 - BLOCK
      ?auto_845169 - BLOCK
    )
    :vars
    (
      ?auto_845170 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_845169 ?auto_845170 ) ( not ( = ?auto_845152 ?auto_845153 ) ) ( not ( = ?auto_845152 ?auto_845154 ) ) ( not ( = ?auto_845152 ?auto_845155 ) ) ( not ( = ?auto_845152 ?auto_845156 ) ) ( not ( = ?auto_845152 ?auto_845157 ) ) ( not ( = ?auto_845152 ?auto_845158 ) ) ( not ( = ?auto_845152 ?auto_845159 ) ) ( not ( = ?auto_845152 ?auto_845160 ) ) ( not ( = ?auto_845152 ?auto_845161 ) ) ( not ( = ?auto_845152 ?auto_845162 ) ) ( not ( = ?auto_845152 ?auto_845163 ) ) ( not ( = ?auto_845152 ?auto_845164 ) ) ( not ( = ?auto_845152 ?auto_845165 ) ) ( not ( = ?auto_845152 ?auto_845166 ) ) ( not ( = ?auto_845152 ?auto_845167 ) ) ( not ( = ?auto_845152 ?auto_845168 ) ) ( not ( = ?auto_845152 ?auto_845169 ) ) ( not ( = ?auto_845152 ?auto_845170 ) ) ( not ( = ?auto_845153 ?auto_845154 ) ) ( not ( = ?auto_845153 ?auto_845155 ) ) ( not ( = ?auto_845153 ?auto_845156 ) ) ( not ( = ?auto_845153 ?auto_845157 ) ) ( not ( = ?auto_845153 ?auto_845158 ) ) ( not ( = ?auto_845153 ?auto_845159 ) ) ( not ( = ?auto_845153 ?auto_845160 ) ) ( not ( = ?auto_845153 ?auto_845161 ) ) ( not ( = ?auto_845153 ?auto_845162 ) ) ( not ( = ?auto_845153 ?auto_845163 ) ) ( not ( = ?auto_845153 ?auto_845164 ) ) ( not ( = ?auto_845153 ?auto_845165 ) ) ( not ( = ?auto_845153 ?auto_845166 ) ) ( not ( = ?auto_845153 ?auto_845167 ) ) ( not ( = ?auto_845153 ?auto_845168 ) ) ( not ( = ?auto_845153 ?auto_845169 ) ) ( not ( = ?auto_845153 ?auto_845170 ) ) ( not ( = ?auto_845154 ?auto_845155 ) ) ( not ( = ?auto_845154 ?auto_845156 ) ) ( not ( = ?auto_845154 ?auto_845157 ) ) ( not ( = ?auto_845154 ?auto_845158 ) ) ( not ( = ?auto_845154 ?auto_845159 ) ) ( not ( = ?auto_845154 ?auto_845160 ) ) ( not ( = ?auto_845154 ?auto_845161 ) ) ( not ( = ?auto_845154 ?auto_845162 ) ) ( not ( = ?auto_845154 ?auto_845163 ) ) ( not ( = ?auto_845154 ?auto_845164 ) ) ( not ( = ?auto_845154 ?auto_845165 ) ) ( not ( = ?auto_845154 ?auto_845166 ) ) ( not ( = ?auto_845154 ?auto_845167 ) ) ( not ( = ?auto_845154 ?auto_845168 ) ) ( not ( = ?auto_845154 ?auto_845169 ) ) ( not ( = ?auto_845154 ?auto_845170 ) ) ( not ( = ?auto_845155 ?auto_845156 ) ) ( not ( = ?auto_845155 ?auto_845157 ) ) ( not ( = ?auto_845155 ?auto_845158 ) ) ( not ( = ?auto_845155 ?auto_845159 ) ) ( not ( = ?auto_845155 ?auto_845160 ) ) ( not ( = ?auto_845155 ?auto_845161 ) ) ( not ( = ?auto_845155 ?auto_845162 ) ) ( not ( = ?auto_845155 ?auto_845163 ) ) ( not ( = ?auto_845155 ?auto_845164 ) ) ( not ( = ?auto_845155 ?auto_845165 ) ) ( not ( = ?auto_845155 ?auto_845166 ) ) ( not ( = ?auto_845155 ?auto_845167 ) ) ( not ( = ?auto_845155 ?auto_845168 ) ) ( not ( = ?auto_845155 ?auto_845169 ) ) ( not ( = ?auto_845155 ?auto_845170 ) ) ( not ( = ?auto_845156 ?auto_845157 ) ) ( not ( = ?auto_845156 ?auto_845158 ) ) ( not ( = ?auto_845156 ?auto_845159 ) ) ( not ( = ?auto_845156 ?auto_845160 ) ) ( not ( = ?auto_845156 ?auto_845161 ) ) ( not ( = ?auto_845156 ?auto_845162 ) ) ( not ( = ?auto_845156 ?auto_845163 ) ) ( not ( = ?auto_845156 ?auto_845164 ) ) ( not ( = ?auto_845156 ?auto_845165 ) ) ( not ( = ?auto_845156 ?auto_845166 ) ) ( not ( = ?auto_845156 ?auto_845167 ) ) ( not ( = ?auto_845156 ?auto_845168 ) ) ( not ( = ?auto_845156 ?auto_845169 ) ) ( not ( = ?auto_845156 ?auto_845170 ) ) ( not ( = ?auto_845157 ?auto_845158 ) ) ( not ( = ?auto_845157 ?auto_845159 ) ) ( not ( = ?auto_845157 ?auto_845160 ) ) ( not ( = ?auto_845157 ?auto_845161 ) ) ( not ( = ?auto_845157 ?auto_845162 ) ) ( not ( = ?auto_845157 ?auto_845163 ) ) ( not ( = ?auto_845157 ?auto_845164 ) ) ( not ( = ?auto_845157 ?auto_845165 ) ) ( not ( = ?auto_845157 ?auto_845166 ) ) ( not ( = ?auto_845157 ?auto_845167 ) ) ( not ( = ?auto_845157 ?auto_845168 ) ) ( not ( = ?auto_845157 ?auto_845169 ) ) ( not ( = ?auto_845157 ?auto_845170 ) ) ( not ( = ?auto_845158 ?auto_845159 ) ) ( not ( = ?auto_845158 ?auto_845160 ) ) ( not ( = ?auto_845158 ?auto_845161 ) ) ( not ( = ?auto_845158 ?auto_845162 ) ) ( not ( = ?auto_845158 ?auto_845163 ) ) ( not ( = ?auto_845158 ?auto_845164 ) ) ( not ( = ?auto_845158 ?auto_845165 ) ) ( not ( = ?auto_845158 ?auto_845166 ) ) ( not ( = ?auto_845158 ?auto_845167 ) ) ( not ( = ?auto_845158 ?auto_845168 ) ) ( not ( = ?auto_845158 ?auto_845169 ) ) ( not ( = ?auto_845158 ?auto_845170 ) ) ( not ( = ?auto_845159 ?auto_845160 ) ) ( not ( = ?auto_845159 ?auto_845161 ) ) ( not ( = ?auto_845159 ?auto_845162 ) ) ( not ( = ?auto_845159 ?auto_845163 ) ) ( not ( = ?auto_845159 ?auto_845164 ) ) ( not ( = ?auto_845159 ?auto_845165 ) ) ( not ( = ?auto_845159 ?auto_845166 ) ) ( not ( = ?auto_845159 ?auto_845167 ) ) ( not ( = ?auto_845159 ?auto_845168 ) ) ( not ( = ?auto_845159 ?auto_845169 ) ) ( not ( = ?auto_845159 ?auto_845170 ) ) ( not ( = ?auto_845160 ?auto_845161 ) ) ( not ( = ?auto_845160 ?auto_845162 ) ) ( not ( = ?auto_845160 ?auto_845163 ) ) ( not ( = ?auto_845160 ?auto_845164 ) ) ( not ( = ?auto_845160 ?auto_845165 ) ) ( not ( = ?auto_845160 ?auto_845166 ) ) ( not ( = ?auto_845160 ?auto_845167 ) ) ( not ( = ?auto_845160 ?auto_845168 ) ) ( not ( = ?auto_845160 ?auto_845169 ) ) ( not ( = ?auto_845160 ?auto_845170 ) ) ( not ( = ?auto_845161 ?auto_845162 ) ) ( not ( = ?auto_845161 ?auto_845163 ) ) ( not ( = ?auto_845161 ?auto_845164 ) ) ( not ( = ?auto_845161 ?auto_845165 ) ) ( not ( = ?auto_845161 ?auto_845166 ) ) ( not ( = ?auto_845161 ?auto_845167 ) ) ( not ( = ?auto_845161 ?auto_845168 ) ) ( not ( = ?auto_845161 ?auto_845169 ) ) ( not ( = ?auto_845161 ?auto_845170 ) ) ( not ( = ?auto_845162 ?auto_845163 ) ) ( not ( = ?auto_845162 ?auto_845164 ) ) ( not ( = ?auto_845162 ?auto_845165 ) ) ( not ( = ?auto_845162 ?auto_845166 ) ) ( not ( = ?auto_845162 ?auto_845167 ) ) ( not ( = ?auto_845162 ?auto_845168 ) ) ( not ( = ?auto_845162 ?auto_845169 ) ) ( not ( = ?auto_845162 ?auto_845170 ) ) ( not ( = ?auto_845163 ?auto_845164 ) ) ( not ( = ?auto_845163 ?auto_845165 ) ) ( not ( = ?auto_845163 ?auto_845166 ) ) ( not ( = ?auto_845163 ?auto_845167 ) ) ( not ( = ?auto_845163 ?auto_845168 ) ) ( not ( = ?auto_845163 ?auto_845169 ) ) ( not ( = ?auto_845163 ?auto_845170 ) ) ( not ( = ?auto_845164 ?auto_845165 ) ) ( not ( = ?auto_845164 ?auto_845166 ) ) ( not ( = ?auto_845164 ?auto_845167 ) ) ( not ( = ?auto_845164 ?auto_845168 ) ) ( not ( = ?auto_845164 ?auto_845169 ) ) ( not ( = ?auto_845164 ?auto_845170 ) ) ( not ( = ?auto_845165 ?auto_845166 ) ) ( not ( = ?auto_845165 ?auto_845167 ) ) ( not ( = ?auto_845165 ?auto_845168 ) ) ( not ( = ?auto_845165 ?auto_845169 ) ) ( not ( = ?auto_845165 ?auto_845170 ) ) ( not ( = ?auto_845166 ?auto_845167 ) ) ( not ( = ?auto_845166 ?auto_845168 ) ) ( not ( = ?auto_845166 ?auto_845169 ) ) ( not ( = ?auto_845166 ?auto_845170 ) ) ( not ( = ?auto_845167 ?auto_845168 ) ) ( not ( = ?auto_845167 ?auto_845169 ) ) ( not ( = ?auto_845167 ?auto_845170 ) ) ( not ( = ?auto_845168 ?auto_845169 ) ) ( not ( = ?auto_845168 ?auto_845170 ) ) ( not ( = ?auto_845169 ?auto_845170 ) ) ( ON ?auto_845168 ?auto_845169 ) ( ON ?auto_845167 ?auto_845168 ) ( ON ?auto_845166 ?auto_845167 ) ( ON ?auto_845165 ?auto_845166 ) ( ON ?auto_845164 ?auto_845165 ) ( ON ?auto_845163 ?auto_845164 ) ( ON ?auto_845162 ?auto_845163 ) ( ON ?auto_845161 ?auto_845162 ) ( ON ?auto_845160 ?auto_845161 ) ( ON ?auto_845159 ?auto_845160 ) ( ON ?auto_845158 ?auto_845159 ) ( ON ?auto_845157 ?auto_845158 ) ( ON ?auto_845156 ?auto_845157 ) ( ON ?auto_845155 ?auto_845156 ) ( ON ?auto_845154 ?auto_845155 ) ( ON ?auto_845153 ?auto_845154 ) ( ON ?auto_845152 ?auto_845153 ) ( CLEAR ?auto_845152 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_845152 )
      ( MAKE-18PILE ?auto_845152 ?auto_845153 ?auto_845154 ?auto_845155 ?auto_845156 ?auto_845157 ?auto_845158 ?auto_845159 ?auto_845160 ?auto_845161 ?auto_845162 ?auto_845163 ?auto_845164 ?auto_845165 ?auto_845166 ?auto_845167 ?auto_845168 ?auto_845169 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_845189 - BLOCK
      ?auto_845190 - BLOCK
      ?auto_845191 - BLOCK
      ?auto_845192 - BLOCK
      ?auto_845193 - BLOCK
      ?auto_845194 - BLOCK
      ?auto_845195 - BLOCK
      ?auto_845196 - BLOCK
      ?auto_845197 - BLOCK
      ?auto_845198 - BLOCK
      ?auto_845199 - BLOCK
      ?auto_845200 - BLOCK
      ?auto_845201 - BLOCK
      ?auto_845202 - BLOCK
      ?auto_845203 - BLOCK
      ?auto_845204 - BLOCK
      ?auto_845205 - BLOCK
      ?auto_845206 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_845206 ) ( not ( = ?auto_845189 ?auto_845190 ) ) ( not ( = ?auto_845189 ?auto_845191 ) ) ( not ( = ?auto_845189 ?auto_845192 ) ) ( not ( = ?auto_845189 ?auto_845193 ) ) ( not ( = ?auto_845189 ?auto_845194 ) ) ( not ( = ?auto_845189 ?auto_845195 ) ) ( not ( = ?auto_845189 ?auto_845196 ) ) ( not ( = ?auto_845189 ?auto_845197 ) ) ( not ( = ?auto_845189 ?auto_845198 ) ) ( not ( = ?auto_845189 ?auto_845199 ) ) ( not ( = ?auto_845189 ?auto_845200 ) ) ( not ( = ?auto_845189 ?auto_845201 ) ) ( not ( = ?auto_845189 ?auto_845202 ) ) ( not ( = ?auto_845189 ?auto_845203 ) ) ( not ( = ?auto_845189 ?auto_845204 ) ) ( not ( = ?auto_845189 ?auto_845205 ) ) ( not ( = ?auto_845189 ?auto_845206 ) ) ( not ( = ?auto_845190 ?auto_845191 ) ) ( not ( = ?auto_845190 ?auto_845192 ) ) ( not ( = ?auto_845190 ?auto_845193 ) ) ( not ( = ?auto_845190 ?auto_845194 ) ) ( not ( = ?auto_845190 ?auto_845195 ) ) ( not ( = ?auto_845190 ?auto_845196 ) ) ( not ( = ?auto_845190 ?auto_845197 ) ) ( not ( = ?auto_845190 ?auto_845198 ) ) ( not ( = ?auto_845190 ?auto_845199 ) ) ( not ( = ?auto_845190 ?auto_845200 ) ) ( not ( = ?auto_845190 ?auto_845201 ) ) ( not ( = ?auto_845190 ?auto_845202 ) ) ( not ( = ?auto_845190 ?auto_845203 ) ) ( not ( = ?auto_845190 ?auto_845204 ) ) ( not ( = ?auto_845190 ?auto_845205 ) ) ( not ( = ?auto_845190 ?auto_845206 ) ) ( not ( = ?auto_845191 ?auto_845192 ) ) ( not ( = ?auto_845191 ?auto_845193 ) ) ( not ( = ?auto_845191 ?auto_845194 ) ) ( not ( = ?auto_845191 ?auto_845195 ) ) ( not ( = ?auto_845191 ?auto_845196 ) ) ( not ( = ?auto_845191 ?auto_845197 ) ) ( not ( = ?auto_845191 ?auto_845198 ) ) ( not ( = ?auto_845191 ?auto_845199 ) ) ( not ( = ?auto_845191 ?auto_845200 ) ) ( not ( = ?auto_845191 ?auto_845201 ) ) ( not ( = ?auto_845191 ?auto_845202 ) ) ( not ( = ?auto_845191 ?auto_845203 ) ) ( not ( = ?auto_845191 ?auto_845204 ) ) ( not ( = ?auto_845191 ?auto_845205 ) ) ( not ( = ?auto_845191 ?auto_845206 ) ) ( not ( = ?auto_845192 ?auto_845193 ) ) ( not ( = ?auto_845192 ?auto_845194 ) ) ( not ( = ?auto_845192 ?auto_845195 ) ) ( not ( = ?auto_845192 ?auto_845196 ) ) ( not ( = ?auto_845192 ?auto_845197 ) ) ( not ( = ?auto_845192 ?auto_845198 ) ) ( not ( = ?auto_845192 ?auto_845199 ) ) ( not ( = ?auto_845192 ?auto_845200 ) ) ( not ( = ?auto_845192 ?auto_845201 ) ) ( not ( = ?auto_845192 ?auto_845202 ) ) ( not ( = ?auto_845192 ?auto_845203 ) ) ( not ( = ?auto_845192 ?auto_845204 ) ) ( not ( = ?auto_845192 ?auto_845205 ) ) ( not ( = ?auto_845192 ?auto_845206 ) ) ( not ( = ?auto_845193 ?auto_845194 ) ) ( not ( = ?auto_845193 ?auto_845195 ) ) ( not ( = ?auto_845193 ?auto_845196 ) ) ( not ( = ?auto_845193 ?auto_845197 ) ) ( not ( = ?auto_845193 ?auto_845198 ) ) ( not ( = ?auto_845193 ?auto_845199 ) ) ( not ( = ?auto_845193 ?auto_845200 ) ) ( not ( = ?auto_845193 ?auto_845201 ) ) ( not ( = ?auto_845193 ?auto_845202 ) ) ( not ( = ?auto_845193 ?auto_845203 ) ) ( not ( = ?auto_845193 ?auto_845204 ) ) ( not ( = ?auto_845193 ?auto_845205 ) ) ( not ( = ?auto_845193 ?auto_845206 ) ) ( not ( = ?auto_845194 ?auto_845195 ) ) ( not ( = ?auto_845194 ?auto_845196 ) ) ( not ( = ?auto_845194 ?auto_845197 ) ) ( not ( = ?auto_845194 ?auto_845198 ) ) ( not ( = ?auto_845194 ?auto_845199 ) ) ( not ( = ?auto_845194 ?auto_845200 ) ) ( not ( = ?auto_845194 ?auto_845201 ) ) ( not ( = ?auto_845194 ?auto_845202 ) ) ( not ( = ?auto_845194 ?auto_845203 ) ) ( not ( = ?auto_845194 ?auto_845204 ) ) ( not ( = ?auto_845194 ?auto_845205 ) ) ( not ( = ?auto_845194 ?auto_845206 ) ) ( not ( = ?auto_845195 ?auto_845196 ) ) ( not ( = ?auto_845195 ?auto_845197 ) ) ( not ( = ?auto_845195 ?auto_845198 ) ) ( not ( = ?auto_845195 ?auto_845199 ) ) ( not ( = ?auto_845195 ?auto_845200 ) ) ( not ( = ?auto_845195 ?auto_845201 ) ) ( not ( = ?auto_845195 ?auto_845202 ) ) ( not ( = ?auto_845195 ?auto_845203 ) ) ( not ( = ?auto_845195 ?auto_845204 ) ) ( not ( = ?auto_845195 ?auto_845205 ) ) ( not ( = ?auto_845195 ?auto_845206 ) ) ( not ( = ?auto_845196 ?auto_845197 ) ) ( not ( = ?auto_845196 ?auto_845198 ) ) ( not ( = ?auto_845196 ?auto_845199 ) ) ( not ( = ?auto_845196 ?auto_845200 ) ) ( not ( = ?auto_845196 ?auto_845201 ) ) ( not ( = ?auto_845196 ?auto_845202 ) ) ( not ( = ?auto_845196 ?auto_845203 ) ) ( not ( = ?auto_845196 ?auto_845204 ) ) ( not ( = ?auto_845196 ?auto_845205 ) ) ( not ( = ?auto_845196 ?auto_845206 ) ) ( not ( = ?auto_845197 ?auto_845198 ) ) ( not ( = ?auto_845197 ?auto_845199 ) ) ( not ( = ?auto_845197 ?auto_845200 ) ) ( not ( = ?auto_845197 ?auto_845201 ) ) ( not ( = ?auto_845197 ?auto_845202 ) ) ( not ( = ?auto_845197 ?auto_845203 ) ) ( not ( = ?auto_845197 ?auto_845204 ) ) ( not ( = ?auto_845197 ?auto_845205 ) ) ( not ( = ?auto_845197 ?auto_845206 ) ) ( not ( = ?auto_845198 ?auto_845199 ) ) ( not ( = ?auto_845198 ?auto_845200 ) ) ( not ( = ?auto_845198 ?auto_845201 ) ) ( not ( = ?auto_845198 ?auto_845202 ) ) ( not ( = ?auto_845198 ?auto_845203 ) ) ( not ( = ?auto_845198 ?auto_845204 ) ) ( not ( = ?auto_845198 ?auto_845205 ) ) ( not ( = ?auto_845198 ?auto_845206 ) ) ( not ( = ?auto_845199 ?auto_845200 ) ) ( not ( = ?auto_845199 ?auto_845201 ) ) ( not ( = ?auto_845199 ?auto_845202 ) ) ( not ( = ?auto_845199 ?auto_845203 ) ) ( not ( = ?auto_845199 ?auto_845204 ) ) ( not ( = ?auto_845199 ?auto_845205 ) ) ( not ( = ?auto_845199 ?auto_845206 ) ) ( not ( = ?auto_845200 ?auto_845201 ) ) ( not ( = ?auto_845200 ?auto_845202 ) ) ( not ( = ?auto_845200 ?auto_845203 ) ) ( not ( = ?auto_845200 ?auto_845204 ) ) ( not ( = ?auto_845200 ?auto_845205 ) ) ( not ( = ?auto_845200 ?auto_845206 ) ) ( not ( = ?auto_845201 ?auto_845202 ) ) ( not ( = ?auto_845201 ?auto_845203 ) ) ( not ( = ?auto_845201 ?auto_845204 ) ) ( not ( = ?auto_845201 ?auto_845205 ) ) ( not ( = ?auto_845201 ?auto_845206 ) ) ( not ( = ?auto_845202 ?auto_845203 ) ) ( not ( = ?auto_845202 ?auto_845204 ) ) ( not ( = ?auto_845202 ?auto_845205 ) ) ( not ( = ?auto_845202 ?auto_845206 ) ) ( not ( = ?auto_845203 ?auto_845204 ) ) ( not ( = ?auto_845203 ?auto_845205 ) ) ( not ( = ?auto_845203 ?auto_845206 ) ) ( not ( = ?auto_845204 ?auto_845205 ) ) ( not ( = ?auto_845204 ?auto_845206 ) ) ( not ( = ?auto_845205 ?auto_845206 ) ) ( ON ?auto_845205 ?auto_845206 ) ( ON ?auto_845204 ?auto_845205 ) ( ON ?auto_845203 ?auto_845204 ) ( ON ?auto_845202 ?auto_845203 ) ( ON ?auto_845201 ?auto_845202 ) ( ON ?auto_845200 ?auto_845201 ) ( ON ?auto_845199 ?auto_845200 ) ( ON ?auto_845198 ?auto_845199 ) ( ON ?auto_845197 ?auto_845198 ) ( ON ?auto_845196 ?auto_845197 ) ( ON ?auto_845195 ?auto_845196 ) ( ON ?auto_845194 ?auto_845195 ) ( ON ?auto_845193 ?auto_845194 ) ( ON ?auto_845192 ?auto_845193 ) ( ON ?auto_845191 ?auto_845192 ) ( ON ?auto_845190 ?auto_845191 ) ( ON ?auto_845189 ?auto_845190 ) ( CLEAR ?auto_845189 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_845189 )
      ( MAKE-18PILE ?auto_845189 ?auto_845190 ?auto_845191 ?auto_845192 ?auto_845193 ?auto_845194 ?auto_845195 ?auto_845196 ?auto_845197 ?auto_845198 ?auto_845199 ?auto_845200 ?auto_845201 ?auto_845202 ?auto_845203 ?auto_845204 ?auto_845205 ?auto_845206 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_845225 - BLOCK
      ?auto_845226 - BLOCK
      ?auto_845227 - BLOCK
      ?auto_845228 - BLOCK
      ?auto_845229 - BLOCK
      ?auto_845230 - BLOCK
      ?auto_845231 - BLOCK
      ?auto_845232 - BLOCK
      ?auto_845233 - BLOCK
      ?auto_845234 - BLOCK
      ?auto_845235 - BLOCK
      ?auto_845236 - BLOCK
      ?auto_845237 - BLOCK
      ?auto_845238 - BLOCK
      ?auto_845239 - BLOCK
      ?auto_845240 - BLOCK
      ?auto_845241 - BLOCK
      ?auto_845242 - BLOCK
    )
    :vars
    (
      ?auto_845243 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_845225 ?auto_845226 ) ) ( not ( = ?auto_845225 ?auto_845227 ) ) ( not ( = ?auto_845225 ?auto_845228 ) ) ( not ( = ?auto_845225 ?auto_845229 ) ) ( not ( = ?auto_845225 ?auto_845230 ) ) ( not ( = ?auto_845225 ?auto_845231 ) ) ( not ( = ?auto_845225 ?auto_845232 ) ) ( not ( = ?auto_845225 ?auto_845233 ) ) ( not ( = ?auto_845225 ?auto_845234 ) ) ( not ( = ?auto_845225 ?auto_845235 ) ) ( not ( = ?auto_845225 ?auto_845236 ) ) ( not ( = ?auto_845225 ?auto_845237 ) ) ( not ( = ?auto_845225 ?auto_845238 ) ) ( not ( = ?auto_845225 ?auto_845239 ) ) ( not ( = ?auto_845225 ?auto_845240 ) ) ( not ( = ?auto_845225 ?auto_845241 ) ) ( not ( = ?auto_845225 ?auto_845242 ) ) ( not ( = ?auto_845226 ?auto_845227 ) ) ( not ( = ?auto_845226 ?auto_845228 ) ) ( not ( = ?auto_845226 ?auto_845229 ) ) ( not ( = ?auto_845226 ?auto_845230 ) ) ( not ( = ?auto_845226 ?auto_845231 ) ) ( not ( = ?auto_845226 ?auto_845232 ) ) ( not ( = ?auto_845226 ?auto_845233 ) ) ( not ( = ?auto_845226 ?auto_845234 ) ) ( not ( = ?auto_845226 ?auto_845235 ) ) ( not ( = ?auto_845226 ?auto_845236 ) ) ( not ( = ?auto_845226 ?auto_845237 ) ) ( not ( = ?auto_845226 ?auto_845238 ) ) ( not ( = ?auto_845226 ?auto_845239 ) ) ( not ( = ?auto_845226 ?auto_845240 ) ) ( not ( = ?auto_845226 ?auto_845241 ) ) ( not ( = ?auto_845226 ?auto_845242 ) ) ( not ( = ?auto_845227 ?auto_845228 ) ) ( not ( = ?auto_845227 ?auto_845229 ) ) ( not ( = ?auto_845227 ?auto_845230 ) ) ( not ( = ?auto_845227 ?auto_845231 ) ) ( not ( = ?auto_845227 ?auto_845232 ) ) ( not ( = ?auto_845227 ?auto_845233 ) ) ( not ( = ?auto_845227 ?auto_845234 ) ) ( not ( = ?auto_845227 ?auto_845235 ) ) ( not ( = ?auto_845227 ?auto_845236 ) ) ( not ( = ?auto_845227 ?auto_845237 ) ) ( not ( = ?auto_845227 ?auto_845238 ) ) ( not ( = ?auto_845227 ?auto_845239 ) ) ( not ( = ?auto_845227 ?auto_845240 ) ) ( not ( = ?auto_845227 ?auto_845241 ) ) ( not ( = ?auto_845227 ?auto_845242 ) ) ( not ( = ?auto_845228 ?auto_845229 ) ) ( not ( = ?auto_845228 ?auto_845230 ) ) ( not ( = ?auto_845228 ?auto_845231 ) ) ( not ( = ?auto_845228 ?auto_845232 ) ) ( not ( = ?auto_845228 ?auto_845233 ) ) ( not ( = ?auto_845228 ?auto_845234 ) ) ( not ( = ?auto_845228 ?auto_845235 ) ) ( not ( = ?auto_845228 ?auto_845236 ) ) ( not ( = ?auto_845228 ?auto_845237 ) ) ( not ( = ?auto_845228 ?auto_845238 ) ) ( not ( = ?auto_845228 ?auto_845239 ) ) ( not ( = ?auto_845228 ?auto_845240 ) ) ( not ( = ?auto_845228 ?auto_845241 ) ) ( not ( = ?auto_845228 ?auto_845242 ) ) ( not ( = ?auto_845229 ?auto_845230 ) ) ( not ( = ?auto_845229 ?auto_845231 ) ) ( not ( = ?auto_845229 ?auto_845232 ) ) ( not ( = ?auto_845229 ?auto_845233 ) ) ( not ( = ?auto_845229 ?auto_845234 ) ) ( not ( = ?auto_845229 ?auto_845235 ) ) ( not ( = ?auto_845229 ?auto_845236 ) ) ( not ( = ?auto_845229 ?auto_845237 ) ) ( not ( = ?auto_845229 ?auto_845238 ) ) ( not ( = ?auto_845229 ?auto_845239 ) ) ( not ( = ?auto_845229 ?auto_845240 ) ) ( not ( = ?auto_845229 ?auto_845241 ) ) ( not ( = ?auto_845229 ?auto_845242 ) ) ( not ( = ?auto_845230 ?auto_845231 ) ) ( not ( = ?auto_845230 ?auto_845232 ) ) ( not ( = ?auto_845230 ?auto_845233 ) ) ( not ( = ?auto_845230 ?auto_845234 ) ) ( not ( = ?auto_845230 ?auto_845235 ) ) ( not ( = ?auto_845230 ?auto_845236 ) ) ( not ( = ?auto_845230 ?auto_845237 ) ) ( not ( = ?auto_845230 ?auto_845238 ) ) ( not ( = ?auto_845230 ?auto_845239 ) ) ( not ( = ?auto_845230 ?auto_845240 ) ) ( not ( = ?auto_845230 ?auto_845241 ) ) ( not ( = ?auto_845230 ?auto_845242 ) ) ( not ( = ?auto_845231 ?auto_845232 ) ) ( not ( = ?auto_845231 ?auto_845233 ) ) ( not ( = ?auto_845231 ?auto_845234 ) ) ( not ( = ?auto_845231 ?auto_845235 ) ) ( not ( = ?auto_845231 ?auto_845236 ) ) ( not ( = ?auto_845231 ?auto_845237 ) ) ( not ( = ?auto_845231 ?auto_845238 ) ) ( not ( = ?auto_845231 ?auto_845239 ) ) ( not ( = ?auto_845231 ?auto_845240 ) ) ( not ( = ?auto_845231 ?auto_845241 ) ) ( not ( = ?auto_845231 ?auto_845242 ) ) ( not ( = ?auto_845232 ?auto_845233 ) ) ( not ( = ?auto_845232 ?auto_845234 ) ) ( not ( = ?auto_845232 ?auto_845235 ) ) ( not ( = ?auto_845232 ?auto_845236 ) ) ( not ( = ?auto_845232 ?auto_845237 ) ) ( not ( = ?auto_845232 ?auto_845238 ) ) ( not ( = ?auto_845232 ?auto_845239 ) ) ( not ( = ?auto_845232 ?auto_845240 ) ) ( not ( = ?auto_845232 ?auto_845241 ) ) ( not ( = ?auto_845232 ?auto_845242 ) ) ( not ( = ?auto_845233 ?auto_845234 ) ) ( not ( = ?auto_845233 ?auto_845235 ) ) ( not ( = ?auto_845233 ?auto_845236 ) ) ( not ( = ?auto_845233 ?auto_845237 ) ) ( not ( = ?auto_845233 ?auto_845238 ) ) ( not ( = ?auto_845233 ?auto_845239 ) ) ( not ( = ?auto_845233 ?auto_845240 ) ) ( not ( = ?auto_845233 ?auto_845241 ) ) ( not ( = ?auto_845233 ?auto_845242 ) ) ( not ( = ?auto_845234 ?auto_845235 ) ) ( not ( = ?auto_845234 ?auto_845236 ) ) ( not ( = ?auto_845234 ?auto_845237 ) ) ( not ( = ?auto_845234 ?auto_845238 ) ) ( not ( = ?auto_845234 ?auto_845239 ) ) ( not ( = ?auto_845234 ?auto_845240 ) ) ( not ( = ?auto_845234 ?auto_845241 ) ) ( not ( = ?auto_845234 ?auto_845242 ) ) ( not ( = ?auto_845235 ?auto_845236 ) ) ( not ( = ?auto_845235 ?auto_845237 ) ) ( not ( = ?auto_845235 ?auto_845238 ) ) ( not ( = ?auto_845235 ?auto_845239 ) ) ( not ( = ?auto_845235 ?auto_845240 ) ) ( not ( = ?auto_845235 ?auto_845241 ) ) ( not ( = ?auto_845235 ?auto_845242 ) ) ( not ( = ?auto_845236 ?auto_845237 ) ) ( not ( = ?auto_845236 ?auto_845238 ) ) ( not ( = ?auto_845236 ?auto_845239 ) ) ( not ( = ?auto_845236 ?auto_845240 ) ) ( not ( = ?auto_845236 ?auto_845241 ) ) ( not ( = ?auto_845236 ?auto_845242 ) ) ( not ( = ?auto_845237 ?auto_845238 ) ) ( not ( = ?auto_845237 ?auto_845239 ) ) ( not ( = ?auto_845237 ?auto_845240 ) ) ( not ( = ?auto_845237 ?auto_845241 ) ) ( not ( = ?auto_845237 ?auto_845242 ) ) ( not ( = ?auto_845238 ?auto_845239 ) ) ( not ( = ?auto_845238 ?auto_845240 ) ) ( not ( = ?auto_845238 ?auto_845241 ) ) ( not ( = ?auto_845238 ?auto_845242 ) ) ( not ( = ?auto_845239 ?auto_845240 ) ) ( not ( = ?auto_845239 ?auto_845241 ) ) ( not ( = ?auto_845239 ?auto_845242 ) ) ( not ( = ?auto_845240 ?auto_845241 ) ) ( not ( = ?auto_845240 ?auto_845242 ) ) ( not ( = ?auto_845241 ?auto_845242 ) ) ( ON ?auto_845225 ?auto_845243 ) ( not ( = ?auto_845242 ?auto_845243 ) ) ( not ( = ?auto_845241 ?auto_845243 ) ) ( not ( = ?auto_845240 ?auto_845243 ) ) ( not ( = ?auto_845239 ?auto_845243 ) ) ( not ( = ?auto_845238 ?auto_845243 ) ) ( not ( = ?auto_845237 ?auto_845243 ) ) ( not ( = ?auto_845236 ?auto_845243 ) ) ( not ( = ?auto_845235 ?auto_845243 ) ) ( not ( = ?auto_845234 ?auto_845243 ) ) ( not ( = ?auto_845233 ?auto_845243 ) ) ( not ( = ?auto_845232 ?auto_845243 ) ) ( not ( = ?auto_845231 ?auto_845243 ) ) ( not ( = ?auto_845230 ?auto_845243 ) ) ( not ( = ?auto_845229 ?auto_845243 ) ) ( not ( = ?auto_845228 ?auto_845243 ) ) ( not ( = ?auto_845227 ?auto_845243 ) ) ( not ( = ?auto_845226 ?auto_845243 ) ) ( not ( = ?auto_845225 ?auto_845243 ) ) ( ON ?auto_845226 ?auto_845225 ) ( ON ?auto_845227 ?auto_845226 ) ( ON ?auto_845228 ?auto_845227 ) ( ON ?auto_845229 ?auto_845228 ) ( ON ?auto_845230 ?auto_845229 ) ( ON ?auto_845231 ?auto_845230 ) ( ON ?auto_845232 ?auto_845231 ) ( ON ?auto_845233 ?auto_845232 ) ( ON ?auto_845234 ?auto_845233 ) ( ON ?auto_845235 ?auto_845234 ) ( ON ?auto_845236 ?auto_845235 ) ( ON ?auto_845237 ?auto_845236 ) ( ON ?auto_845238 ?auto_845237 ) ( ON ?auto_845239 ?auto_845238 ) ( ON ?auto_845240 ?auto_845239 ) ( ON ?auto_845241 ?auto_845240 ) ( ON ?auto_845242 ?auto_845241 ) ( CLEAR ?auto_845242 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-18PILE ?auto_845242 ?auto_845241 ?auto_845240 ?auto_845239 ?auto_845238 ?auto_845237 ?auto_845236 ?auto_845235 ?auto_845234 ?auto_845233 ?auto_845232 ?auto_845231 ?auto_845230 ?auto_845229 ?auto_845228 ?auto_845227 ?auto_845226 ?auto_845225 )
      ( MAKE-18PILE ?auto_845225 ?auto_845226 ?auto_845227 ?auto_845228 ?auto_845229 ?auto_845230 ?auto_845231 ?auto_845232 ?auto_845233 ?auto_845234 ?auto_845235 ?auto_845236 ?auto_845237 ?auto_845238 ?auto_845239 ?auto_845240 ?auto_845241 ?auto_845242 ) )
  )

)

