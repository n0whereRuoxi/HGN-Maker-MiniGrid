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
      ?auto_33472 - BLOCK
    )
    :vars
    (
      ?auto_33473 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_33472 ?auto_33473 ) ( CLEAR ?auto_33472 ) ( HAND-EMPTY ) ( not ( = ?auto_33472 ?auto_33473 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_33472 ?auto_33473 )
      ( !PUTDOWN ?auto_33472 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_33479 - BLOCK
      ?auto_33480 - BLOCK
    )
    :vars
    (
      ?auto_33481 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_33479 ) ( ON ?auto_33480 ?auto_33481 ) ( CLEAR ?auto_33480 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_33479 ) ( not ( = ?auto_33479 ?auto_33480 ) ) ( not ( = ?auto_33479 ?auto_33481 ) ) ( not ( = ?auto_33480 ?auto_33481 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_33480 ?auto_33481 )
      ( !STACK ?auto_33480 ?auto_33479 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_33489 - BLOCK
      ?auto_33490 - BLOCK
    )
    :vars
    (
      ?auto_33491 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_33490 ?auto_33491 ) ( not ( = ?auto_33489 ?auto_33490 ) ) ( not ( = ?auto_33489 ?auto_33491 ) ) ( not ( = ?auto_33490 ?auto_33491 ) ) ( ON ?auto_33489 ?auto_33490 ) ( CLEAR ?auto_33489 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_33489 )
      ( MAKE-2PILE ?auto_33489 ?auto_33490 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_33500 - BLOCK
      ?auto_33501 - BLOCK
      ?auto_33502 - BLOCK
    )
    :vars
    (
      ?auto_33503 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_33501 ) ( ON ?auto_33502 ?auto_33503 ) ( CLEAR ?auto_33502 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_33500 ) ( ON ?auto_33501 ?auto_33500 ) ( not ( = ?auto_33500 ?auto_33501 ) ) ( not ( = ?auto_33500 ?auto_33502 ) ) ( not ( = ?auto_33500 ?auto_33503 ) ) ( not ( = ?auto_33501 ?auto_33502 ) ) ( not ( = ?auto_33501 ?auto_33503 ) ) ( not ( = ?auto_33502 ?auto_33503 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_33502 ?auto_33503 )
      ( !STACK ?auto_33502 ?auto_33501 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_33514 - BLOCK
      ?auto_33515 - BLOCK
      ?auto_33516 - BLOCK
    )
    :vars
    (
      ?auto_33517 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_33516 ?auto_33517 ) ( ON-TABLE ?auto_33514 ) ( not ( = ?auto_33514 ?auto_33515 ) ) ( not ( = ?auto_33514 ?auto_33516 ) ) ( not ( = ?auto_33514 ?auto_33517 ) ) ( not ( = ?auto_33515 ?auto_33516 ) ) ( not ( = ?auto_33515 ?auto_33517 ) ) ( not ( = ?auto_33516 ?auto_33517 ) ) ( CLEAR ?auto_33514 ) ( ON ?auto_33515 ?auto_33516 ) ( CLEAR ?auto_33515 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_33514 ?auto_33515 )
      ( MAKE-3PILE ?auto_33514 ?auto_33515 ?auto_33516 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_33528 - BLOCK
      ?auto_33529 - BLOCK
      ?auto_33530 - BLOCK
    )
    :vars
    (
      ?auto_33531 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_33530 ?auto_33531 ) ( not ( = ?auto_33528 ?auto_33529 ) ) ( not ( = ?auto_33528 ?auto_33530 ) ) ( not ( = ?auto_33528 ?auto_33531 ) ) ( not ( = ?auto_33529 ?auto_33530 ) ) ( not ( = ?auto_33529 ?auto_33531 ) ) ( not ( = ?auto_33530 ?auto_33531 ) ) ( ON ?auto_33529 ?auto_33530 ) ( ON ?auto_33528 ?auto_33529 ) ( CLEAR ?auto_33528 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_33528 )
      ( MAKE-3PILE ?auto_33528 ?auto_33529 ?auto_33530 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_33543 - BLOCK
      ?auto_33544 - BLOCK
      ?auto_33545 - BLOCK
      ?auto_33546 - BLOCK
    )
    :vars
    (
      ?auto_33547 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_33545 ) ( ON ?auto_33546 ?auto_33547 ) ( CLEAR ?auto_33546 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_33543 ) ( ON ?auto_33544 ?auto_33543 ) ( ON ?auto_33545 ?auto_33544 ) ( not ( = ?auto_33543 ?auto_33544 ) ) ( not ( = ?auto_33543 ?auto_33545 ) ) ( not ( = ?auto_33543 ?auto_33546 ) ) ( not ( = ?auto_33543 ?auto_33547 ) ) ( not ( = ?auto_33544 ?auto_33545 ) ) ( not ( = ?auto_33544 ?auto_33546 ) ) ( not ( = ?auto_33544 ?auto_33547 ) ) ( not ( = ?auto_33545 ?auto_33546 ) ) ( not ( = ?auto_33545 ?auto_33547 ) ) ( not ( = ?auto_33546 ?auto_33547 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_33546 ?auto_33547 )
      ( !STACK ?auto_33546 ?auto_33545 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_33561 - BLOCK
      ?auto_33562 - BLOCK
      ?auto_33563 - BLOCK
      ?auto_33564 - BLOCK
    )
    :vars
    (
      ?auto_33565 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_33564 ?auto_33565 ) ( ON-TABLE ?auto_33561 ) ( ON ?auto_33562 ?auto_33561 ) ( not ( = ?auto_33561 ?auto_33562 ) ) ( not ( = ?auto_33561 ?auto_33563 ) ) ( not ( = ?auto_33561 ?auto_33564 ) ) ( not ( = ?auto_33561 ?auto_33565 ) ) ( not ( = ?auto_33562 ?auto_33563 ) ) ( not ( = ?auto_33562 ?auto_33564 ) ) ( not ( = ?auto_33562 ?auto_33565 ) ) ( not ( = ?auto_33563 ?auto_33564 ) ) ( not ( = ?auto_33563 ?auto_33565 ) ) ( not ( = ?auto_33564 ?auto_33565 ) ) ( CLEAR ?auto_33562 ) ( ON ?auto_33563 ?auto_33564 ) ( CLEAR ?auto_33563 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_33561 ?auto_33562 ?auto_33563 )
      ( MAKE-4PILE ?auto_33561 ?auto_33562 ?auto_33563 ?auto_33564 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_33579 - BLOCK
      ?auto_33580 - BLOCK
      ?auto_33581 - BLOCK
      ?auto_33582 - BLOCK
    )
    :vars
    (
      ?auto_33583 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_33582 ?auto_33583 ) ( ON-TABLE ?auto_33579 ) ( not ( = ?auto_33579 ?auto_33580 ) ) ( not ( = ?auto_33579 ?auto_33581 ) ) ( not ( = ?auto_33579 ?auto_33582 ) ) ( not ( = ?auto_33579 ?auto_33583 ) ) ( not ( = ?auto_33580 ?auto_33581 ) ) ( not ( = ?auto_33580 ?auto_33582 ) ) ( not ( = ?auto_33580 ?auto_33583 ) ) ( not ( = ?auto_33581 ?auto_33582 ) ) ( not ( = ?auto_33581 ?auto_33583 ) ) ( not ( = ?auto_33582 ?auto_33583 ) ) ( ON ?auto_33581 ?auto_33582 ) ( CLEAR ?auto_33579 ) ( ON ?auto_33580 ?auto_33581 ) ( CLEAR ?auto_33580 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_33579 ?auto_33580 )
      ( MAKE-4PILE ?auto_33579 ?auto_33580 ?auto_33581 ?auto_33582 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_33597 - BLOCK
      ?auto_33598 - BLOCK
      ?auto_33599 - BLOCK
      ?auto_33600 - BLOCK
    )
    :vars
    (
      ?auto_33601 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_33600 ?auto_33601 ) ( not ( = ?auto_33597 ?auto_33598 ) ) ( not ( = ?auto_33597 ?auto_33599 ) ) ( not ( = ?auto_33597 ?auto_33600 ) ) ( not ( = ?auto_33597 ?auto_33601 ) ) ( not ( = ?auto_33598 ?auto_33599 ) ) ( not ( = ?auto_33598 ?auto_33600 ) ) ( not ( = ?auto_33598 ?auto_33601 ) ) ( not ( = ?auto_33599 ?auto_33600 ) ) ( not ( = ?auto_33599 ?auto_33601 ) ) ( not ( = ?auto_33600 ?auto_33601 ) ) ( ON ?auto_33599 ?auto_33600 ) ( ON ?auto_33598 ?auto_33599 ) ( ON ?auto_33597 ?auto_33598 ) ( CLEAR ?auto_33597 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_33597 )
      ( MAKE-4PILE ?auto_33597 ?auto_33598 ?auto_33599 ?auto_33600 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_33616 - BLOCK
      ?auto_33617 - BLOCK
      ?auto_33618 - BLOCK
      ?auto_33619 - BLOCK
      ?auto_33620 - BLOCK
    )
    :vars
    (
      ?auto_33621 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_33619 ) ( ON ?auto_33620 ?auto_33621 ) ( CLEAR ?auto_33620 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_33616 ) ( ON ?auto_33617 ?auto_33616 ) ( ON ?auto_33618 ?auto_33617 ) ( ON ?auto_33619 ?auto_33618 ) ( not ( = ?auto_33616 ?auto_33617 ) ) ( not ( = ?auto_33616 ?auto_33618 ) ) ( not ( = ?auto_33616 ?auto_33619 ) ) ( not ( = ?auto_33616 ?auto_33620 ) ) ( not ( = ?auto_33616 ?auto_33621 ) ) ( not ( = ?auto_33617 ?auto_33618 ) ) ( not ( = ?auto_33617 ?auto_33619 ) ) ( not ( = ?auto_33617 ?auto_33620 ) ) ( not ( = ?auto_33617 ?auto_33621 ) ) ( not ( = ?auto_33618 ?auto_33619 ) ) ( not ( = ?auto_33618 ?auto_33620 ) ) ( not ( = ?auto_33618 ?auto_33621 ) ) ( not ( = ?auto_33619 ?auto_33620 ) ) ( not ( = ?auto_33619 ?auto_33621 ) ) ( not ( = ?auto_33620 ?auto_33621 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_33620 ?auto_33621 )
      ( !STACK ?auto_33620 ?auto_33619 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_33638 - BLOCK
      ?auto_33639 - BLOCK
      ?auto_33640 - BLOCK
      ?auto_33641 - BLOCK
      ?auto_33642 - BLOCK
    )
    :vars
    (
      ?auto_33643 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_33642 ?auto_33643 ) ( ON-TABLE ?auto_33638 ) ( ON ?auto_33639 ?auto_33638 ) ( ON ?auto_33640 ?auto_33639 ) ( not ( = ?auto_33638 ?auto_33639 ) ) ( not ( = ?auto_33638 ?auto_33640 ) ) ( not ( = ?auto_33638 ?auto_33641 ) ) ( not ( = ?auto_33638 ?auto_33642 ) ) ( not ( = ?auto_33638 ?auto_33643 ) ) ( not ( = ?auto_33639 ?auto_33640 ) ) ( not ( = ?auto_33639 ?auto_33641 ) ) ( not ( = ?auto_33639 ?auto_33642 ) ) ( not ( = ?auto_33639 ?auto_33643 ) ) ( not ( = ?auto_33640 ?auto_33641 ) ) ( not ( = ?auto_33640 ?auto_33642 ) ) ( not ( = ?auto_33640 ?auto_33643 ) ) ( not ( = ?auto_33641 ?auto_33642 ) ) ( not ( = ?auto_33641 ?auto_33643 ) ) ( not ( = ?auto_33642 ?auto_33643 ) ) ( CLEAR ?auto_33640 ) ( ON ?auto_33641 ?auto_33642 ) ( CLEAR ?auto_33641 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_33638 ?auto_33639 ?auto_33640 ?auto_33641 )
      ( MAKE-5PILE ?auto_33638 ?auto_33639 ?auto_33640 ?auto_33641 ?auto_33642 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_33660 - BLOCK
      ?auto_33661 - BLOCK
      ?auto_33662 - BLOCK
      ?auto_33663 - BLOCK
      ?auto_33664 - BLOCK
    )
    :vars
    (
      ?auto_33665 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_33664 ?auto_33665 ) ( ON-TABLE ?auto_33660 ) ( ON ?auto_33661 ?auto_33660 ) ( not ( = ?auto_33660 ?auto_33661 ) ) ( not ( = ?auto_33660 ?auto_33662 ) ) ( not ( = ?auto_33660 ?auto_33663 ) ) ( not ( = ?auto_33660 ?auto_33664 ) ) ( not ( = ?auto_33660 ?auto_33665 ) ) ( not ( = ?auto_33661 ?auto_33662 ) ) ( not ( = ?auto_33661 ?auto_33663 ) ) ( not ( = ?auto_33661 ?auto_33664 ) ) ( not ( = ?auto_33661 ?auto_33665 ) ) ( not ( = ?auto_33662 ?auto_33663 ) ) ( not ( = ?auto_33662 ?auto_33664 ) ) ( not ( = ?auto_33662 ?auto_33665 ) ) ( not ( = ?auto_33663 ?auto_33664 ) ) ( not ( = ?auto_33663 ?auto_33665 ) ) ( not ( = ?auto_33664 ?auto_33665 ) ) ( ON ?auto_33663 ?auto_33664 ) ( CLEAR ?auto_33661 ) ( ON ?auto_33662 ?auto_33663 ) ( CLEAR ?auto_33662 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_33660 ?auto_33661 ?auto_33662 )
      ( MAKE-5PILE ?auto_33660 ?auto_33661 ?auto_33662 ?auto_33663 ?auto_33664 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_33682 - BLOCK
      ?auto_33683 - BLOCK
      ?auto_33684 - BLOCK
      ?auto_33685 - BLOCK
      ?auto_33686 - BLOCK
    )
    :vars
    (
      ?auto_33687 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_33686 ?auto_33687 ) ( ON-TABLE ?auto_33682 ) ( not ( = ?auto_33682 ?auto_33683 ) ) ( not ( = ?auto_33682 ?auto_33684 ) ) ( not ( = ?auto_33682 ?auto_33685 ) ) ( not ( = ?auto_33682 ?auto_33686 ) ) ( not ( = ?auto_33682 ?auto_33687 ) ) ( not ( = ?auto_33683 ?auto_33684 ) ) ( not ( = ?auto_33683 ?auto_33685 ) ) ( not ( = ?auto_33683 ?auto_33686 ) ) ( not ( = ?auto_33683 ?auto_33687 ) ) ( not ( = ?auto_33684 ?auto_33685 ) ) ( not ( = ?auto_33684 ?auto_33686 ) ) ( not ( = ?auto_33684 ?auto_33687 ) ) ( not ( = ?auto_33685 ?auto_33686 ) ) ( not ( = ?auto_33685 ?auto_33687 ) ) ( not ( = ?auto_33686 ?auto_33687 ) ) ( ON ?auto_33685 ?auto_33686 ) ( ON ?auto_33684 ?auto_33685 ) ( CLEAR ?auto_33682 ) ( ON ?auto_33683 ?auto_33684 ) ( CLEAR ?auto_33683 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_33682 ?auto_33683 )
      ( MAKE-5PILE ?auto_33682 ?auto_33683 ?auto_33684 ?auto_33685 ?auto_33686 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_33704 - BLOCK
      ?auto_33705 - BLOCK
      ?auto_33706 - BLOCK
      ?auto_33707 - BLOCK
      ?auto_33708 - BLOCK
    )
    :vars
    (
      ?auto_33709 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_33708 ?auto_33709 ) ( not ( = ?auto_33704 ?auto_33705 ) ) ( not ( = ?auto_33704 ?auto_33706 ) ) ( not ( = ?auto_33704 ?auto_33707 ) ) ( not ( = ?auto_33704 ?auto_33708 ) ) ( not ( = ?auto_33704 ?auto_33709 ) ) ( not ( = ?auto_33705 ?auto_33706 ) ) ( not ( = ?auto_33705 ?auto_33707 ) ) ( not ( = ?auto_33705 ?auto_33708 ) ) ( not ( = ?auto_33705 ?auto_33709 ) ) ( not ( = ?auto_33706 ?auto_33707 ) ) ( not ( = ?auto_33706 ?auto_33708 ) ) ( not ( = ?auto_33706 ?auto_33709 ) ) ( not ( = ?auto_33707 ?auto_33708 ) ) ( not ( = ?auto_33707 ?auto_33709 ) ) ( not ( = ?auto_33708 ?auto_33709 ) ) ( ON ?auto_33707 ?auto_33708 ) ( ON ?auto_33706 ?auto_33707 ) ( ON ?auto_33705 ?auto_33706 ) ( ON ?auto_33704 ?auto_33705 ) ( CLEAR ?auto_33704 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_33704 )
      ( MAKE-5PILE ?auto_33704 ?auto_33705 ?auto_33706 ?auto_33707 ?auto_33708 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_33727 - BLOCK
      ?auto_33728 - BLOCK
      ?auto_33729 - BLOCK
      ?auto_33730 - BLOCK
      ?auto_33731 - BLOCK
      ?auto_33732 - BLOCK
    )
    :vars
    (
      ?auto_33733 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_33731 ) ( ON ?auto_33732 ?auto_33733 ) ( CLEAR ?auto_33732 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_33727 ) ( ON ?auto_33728 ?auto_33727 ) ( ON ?auto_33729 ?auto_33728 ) ( ON ?auto_33730 ?auto_33729 ) ( ON ?auto_33731 ?auto_33730 ) ( not ( = ?auto_33727 ?auto_33728 ) ) ( not ( = ?auto_33727 ?auto_33729 ) ) ( not ( = ?auto_33727 ?auto_33730 ) ) ( not ( = ?auto_33727 ?auto_33731 ) ) ( not ( = ?auto_33727 ?auto_33732 ) ) ( not ( = ?auto_33727 ?auto_33733 ) ) ( not ( = ?auto_33728 ?auto_33729 ) ) ( not ( = ?auto_33728 ?auto_33730 ) ) ( not ( = ?auto_33728 ?auto_33731 ) ) ( not ( = ?auto_33728 ?auto_33732 ) ) ( not ( = ?auto_33728 ?auto_33733 ) ) ( not ( = ?auto_33729 ?auto_33730 ) ) ( not ( = ?auto_33729 ?auto_33731 ) ) ( not ( = ?auto_33729 ?auto_33732 ) ) ( not ( = ?auto_33729 ?auto_33733 ) ) ( not ( = ?auto_33730 ?auto_33731 ) ) ( not ( = ?auto_33730 ?auto_33732 ) ) ( not ( = ?auto_33730 ?auto_33733 ) ) ( not ( = ?auto_33731 ?auto_33732 ) ) ( not ( = ?auto_33731 ?auto_33733 ) ) ( not ( = ?auto_33732 ?auto_33733 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_33732 ?auto_33733 )
      ( !STACK ?auto_33732 ?auto_33731 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_33753 - BLOCK
      ?auto_33754 - BLOCK
      ?auto_33755 - BLOCK
      ?auto_33756 - BLOCK
      ?auto_33757 - BLOCK
      ?auto_33758 - BLOCK
    )
    :vars
    (
      ?auto_33759 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_33758 ?auto_33759 ) ( ON-TABLE ?auto_33753 ) ( ON ?auto_33754 ?auto_33753 ) ( ON ?auto_33755 ?auto_33754 ) ( ON ?auto_33756 ?auto_33755 ) ( not ( = ?auto_33753 ?auto_33754 ) ) ( not ( = ?auto_33753 ?auto_33755 ) ) ( not ( = ?auto_33753 ?auto_33756 ) ) ( not ( = ?auto_33753 ?auto_33757 ) ) ( not ( = ?auto_33753 ?auto_33758 ) ) ( not ( = ?auto_33753 ?auto_33759 ) ) ( not ( = ?auto_33754 ?auto_33755 ) ) ( not ( = ?auto_33754 ?auto_33756 ) ) ( not ( = ?auto_33754 ?auto_33757 ) ) ( not ( = ?auto_33754 ?auto_33758 ) ) ( not ( = ?auto_33754 ?auto_33759 ) ) ( not ( = ?auto_33755 ?auto_33756 ) ) ( not ( = ?auto_33755 ?auto_33757 ) ) ( not ( = ?auto_33755 ?auto_33758 ) ) ( not ( = ?auto_33755 ?auto_33759 ) ) ( not ( = ?auto_33756 ?auto_33757 ) ) ( not ( = ?auto_33756 ?auto_33758 ) ) ( not ( = ?auto_33756 ?auto_33759 ) ) ( not ( = ?auto_33757 ?auto_33758 ) ) ( not ( = ?auto_33757 ?auto_33759 ) ) ( not ( = ?auto_33758 ?auto_33759 ) ) ( CLEAR ?auto_33756 ) ( ON ?auto_33757 ?auto_33758 ) ( CLEAR ?auto_33757 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_33753 ?auto_33754 ?auto_33755 ?auto_33756 ?auto_33757 )
      ( MAKE-6PILE ?auto_33753 ?auto_33754 ?auto_33755 ?auto_33756 ?auto_33757 ?auto_33758 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_33779 - BLOCK
      ?auto_33780 - BLOCK
      ?auto_33781 - BLOCK
      ?auto_33782 - BLOCK
      ?auto_33783 - BLOCK
      ?auto_33784 - BLOCK
    )
    :vars
    (
      ?auto_33785 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_33784 ?auto_33785 ) ( ON-TABLE ?auto_33779 ) ( ON ?auto_33780 ?auto_33779 ) ( ON ?auto_33781 ?auto_33780 ) ( not ( = ?auto_33779 ?auto_33780 ) ) ( not ( = ?auto_33779 ?auto_33781 ) ) ( not ( = ?auto_33779 ?auto_33782 ) ) ( not ( = ?auto_33779 ?auto_33783 ) ) ( not ( = ?auto_33779 ?auto_33784 ) ) ( not ( = ?auto_33779 ?auto_33785 ) ) ( not ( = ?auto_33780 ?auto_33781 ) ) ( not ( = ?auto_33780 ?auto_33782 ) ) ( not ( = ?auto_33780 ?auto_33783 ) ) ( not ( = ?auto_33780 ?auto_33784 ) ) ( not ( = ?auto_33780 ?auto_33785 ) ) ( not ( = ?auto_33781 ?auto_33782 ) ) ( not ( = ?auto_33781 ?auto_33783 ) ) ( not ( = ?auto_33781 ?auto_33784 ) ) ( not ( = ?auto_33781 ?auto_33785 ) ) ( not ( = ?auto_33782 ?auto_33783 ) ) ( not ( = ?auto_33782 ?auto_33784 ) ) ( not ( = ?auto_33782 ?auto_33785 ) ) ( not ( = ?auto_33783 ?auto_33784 ) ) ( not ( = ?auto_33783 ?auto_33785 ) ) ( not ( = ?auto_33784 ?auto_33785 ) ) ( ON ?auto_33783 ?auto_33784 ) ( CLEAR ?auto_33781 ) ( ON ?auto_33782 ?auto_33783 ) ( CLEAR ?auto_33782 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_33779 ?auto_33780 ?auto_33781 ?auto_33782 )
      ( MAKE-6PILE ?auto_33779 ?auto_33780 ?auto_33781 ?auto_33782 ?auto_33783 ?auto_33784 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_33805 - BLOCK
      ?auto_33806 - BLOCK
      ?auto_33807 - BLOCK
      ?auto_33808 - BLOCK
      ?auto_33809 - BLOCK
      ?auto_33810 - BLOCK
    )
    :vars
    (
      ?auto_33811 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_33810 ?auto_33811 ) ( ON-TABLE ?auto_33805 ) ( ON ?auto_33806 ?auto_33805 ) ( not ( = ?auto_33805 ?auto_33806 ) ) ( not ( = ?auto_33805 ?auto_33807 ) ) ( not ( = ?auto_33805 ?auto_33808 ) ) ( not ( = ?auto_33805 ?auto_33809 ) ) ( not ( = ?auto_33805 ?auto_33810 ) ) ( not ( = ?auto_33805 ?auto_33811 ) ) ( not ( = ?auto_33806 ?auto_33807 ) ) ( not ( = ?auto_33806 ?auto_33808 ) ) ( not ( = ?auto_33806 ?auto_33809 ) ) ( not ( = ?auto_33806 ?auto_33810 ) ) ( not ( = ?auto_33806 ?auto_33811 ) ) ( not ( = ?auto_33807 ?auto_33808 ) ) ( not ( = ?auto_33807 ?auto_33809 ) ) ( not ( = ?auto_33807 ?auto_33810 ) ) ( not ( = ?auto_33807 ?auto_33811 ) ) ( not ( = ?auto_33808 ?auto_33809 ) ) ( not ( = ?auto_33808 ?auto_33810 ) ) ( not ( = ?auto_33808 ?auto_33811 ) ) ( not ( = ?auto_33809 ?auto_33810 ) ) ( not ( = ?auto_33809 ?auto_33811 ) ) ( not ( = ?auto_33810 ?auto_33811 ) ) ( ON ?auto_33809 ?auto_33810 ) ( ON ?auto_33808 ?auto_33809 ) ( CLEAR ?auto_33806 ) ( ON ?auto_33807 ?auto_33808 ) ( CLEAR ?auto_33807 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_33805 ?auto_33806 ?auto_33807 )
      ( MAKE-6PILE ?auto_33805 ?auto_33806 ?auto_33807 ?auto_33808 ?auto_33809 ?auto_33810 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_33831 - BLOCK
      ?auto_33832 - BLOCK
      ?auto_33833 - BLOCK
      ?auto_33834 - BLOCK
      ?auto_33835 - BLOCK
      ?auto_33836 - BLOCK
    )
    :vars
    (
      ?auto_33837 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_33836 ?auto_33837 ) ( ON-TABLE ?auto_33831 ) ( not ( = ?auto_33831 ?auto_33832 ) ) ( not ( = ?auto_33831 ?auto_33833 ) ) ( not ( = ?auto_33831 ?auto_33834 ) ) ( not ( = ?auto_33831 ?auto_33835 ) ) ( not ( = ?auto_33831 ?auto_33836 ) ) ( not ( = ?auto_33831 ?auto_33837 ) ) ( not ( = ?auto_33832 ?auto_33833 ) ) ( not ( = ?auto_33832 ?auto_33834 ) ) ( not ( = ?auto_33832 ?auto_33835 ) ) ( not ( = ?auto_33832 ?auto_33836 ) ) ( not ( = ?auto_33832 ?auto_33837 ) ) ( not ( = ?auto_33833 ?auto_33834 ) ) ( not ( = ?auto_33833 ?auto_33835 ) ) ( not ( = ?auto_33833 ?auto_33836 ) ) ( not ( = ?auto_33833 ?auto_33837 ) ) ( not ( = ?auto_33834 ?auto_33835 ) ) ( not ( = ?auto_33834 ?auto_33836 ) ) ( not ( = ?auto_33834 ?auto_33837 ) ) ( not ( = ?auto_33835 ?auto_33836 ) ) ( not ( = ?auto_33835 ?auto_33837 ) ) ( not ( = ?auto_33836 ?auto_33837 ) ) ( ON ?auto_33835 ?auto_33836 ) ( ON ?auto_33834 ?auto_33835 ) ( ON ?auto_33833 ?auto_33834 ) ( CLEAR ?auto_33831 ) ( ON ?auto_33832 ?auto_33833 ) ( CLEAR ?auto_33832 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_33831 ?auto_33832 )
      ( MAKE-6PILE ?auto_33831 ?auto_33832 ?auto_33833 ?auto_33834 ?auto_33835 ?auto_33836 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_33857 - BLOCK
      ?auto_33858 - BLOCK
      ?auto_33859 - BLOCK
      ?auto_33860 - BLOCK
      ?auto_33861 - BLOCK
      ?auto_33862 - BLOCK
    )
    :vars
    (
      ?auto_33863 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_33862 ?auto_33863 ) ( not ( = ?auto_33857 ?auto_33858 ) ) ( not ( = ?auto_33857 ?auto_33859 ) ) ( not ( = ?auto_33857 ?auto_33860 ) ) ( not ( = ?auto_33857 ?auto_33861 ) ) ( not ( = ?auto_33857 ?auto_33862 ) ) ( not ( = ?auto_33857 ?auto_33863 ) ) ( not ( = ?auto_33858 ?auto_33859 ) ) ( not ( = ?auto_33858 ?auto_33860 ) ) ( not ( = ?auto_33858 ?auto_33861 ) ) ( not ( = ?auto_33858 ?auto_33862 ) ) ( not ( = ?auto_33858 ?auto_33863 ) ) ( not ( = ?auto_33859 ?auto_33860 ) ) ( not ( = ?auto_33859 ?auto_33861 ) ) ( not ( = ?auto_33859 ?auto_33862 ) ) ( not ( = ?auto_33859 ?auto_33863 ) ) ( not ( = ?auto_33860 ?auto_33861 ) ) ( not ( = ?auto_33860 ?auto_33862 ) ) ( not ( = ?auto_33860 ?auto_33863 ) ) ( not ( = ?auto_33861 ?auto_33862 ) ) ( not ( = ?auto_33861 ?auto_33863 ) ) ( not ( = ?auto_33862 ?auto_33863 ) ) ( ON ?auto_33861 ?auto_33862 ) ( ON ?auto_33860 ?auto_33861 ) ( ON ?auto_33859 ?auto_33860 ) ( ON ?auto_33858 ?auto_33859 ) ( ON ?auto_33857 ?auto_33858 ) ( CLEAR ?auto_33857 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_33857 )
      ( MAKE-6PILE ?auto_33857 ?auto_33858 ?auto_33859 ?auto_33860 ?auto_33861 ?auto_33862 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_33884 - BLOCK
      ?auto_33885 - BLOCK
      ?auto_33886 - BLOCK
      ?auto_33887 - BLOCK
      ?auto_33888 - BLOCK
      ?auto_33889 - BLOCK
      ?auto_33890 - BLOCK
    )
    :vars
    (
      ?auto_33891 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_33889 ) ( ON ?auto_33890 ?auto_33891 ) ( CLEAR ?auto_33890 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_33884 ) ( ON ?auto_33885 ?auto_33884 ) ( ON ?auto_33886 ?auto_33885 ) ( ON ?auto_33887 ?auto_33886 ) ( ON ?auto_33888 ?auto_33887 ) ( ON ?auto_33889 ?auto_33888 ) ( not ( = ?auto_33884 ?auto_33885 ) ) ( not ( = ?auto_33884 ?auto_33886 ) ) ( not ( = ?auto_33884 ?auto_33887 ) ) ( not ( = ?auto_33884 ?auto_33888 ) ) ( not ( = ?auto_33884 ?auto_33889 ) ) ( not ( = ?auto_33884 ?auto_33890 ) ) ( not ( = ?auto_33884 ?auto_33891 ) ) ( not ( = ?auto_33885 ?auto_33886 ) ) ( not ( = ?auto_33885 ?auto_33887 ) ) ( not ( = ?auto_33885 ?auto_33888 ) ) ( not ( = ?auto_33885 ?auto_33889 ) ) ( not ( = ?auto_33885 ?auto_33890 ) ) ( not ( = ?auto_33885 ?auto_33891 ) ) ( not ( = ?auto_33886 ?auto_33887 ) ) ( not ( = ?auto_33886 ?auto_33888 ) ) ( not ( = ?auto_33886 ?auto_33889 ) ) ( not ( = ?auto_33886 ?auto_33890 ) ) ( not ( = ?auto_33886 ?auto_33891 ) ) ( not ( = ?auto_33887 ?auto_33888 ) ) ( not ( = ?auto_33887 ?auto_33889 ) ) ( not ( = ?auto_33887 ?auto_33890 ) ) ( not ( = ?auto_33887 ?auto_33891 ) ) ( not ( = ?auto_33888 ?auto_33889 ) ) ( not ( = ?auto_33888 ?auto_33890 ) ) ( not ( = ?auto_33888 ?auto_33891 ) ) ( not ( = ?auto_33889 ?auto_33890 ) ) ( not ( = ?auto_33889 ?auto_33891 ) ) ( not ( = ?auto_33890 ?auto_33891 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_33890 ?auto_33891 )
      ( !STACK ?auto_33890 ?auto_33889 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_33914 - BLOCK
      ?auto_33915 - BLOCK
      ?auto_33916 - BLOCK
      ?auto_33917 - BLOCK
      ?auto_33918 - BLOCK
      ?auto_33919 - BLOCK
      ?auto_33920 - BLOCK
    )
    :vars
    (
      ?auto_33921 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_33920 ?auto_33921 ) ( ON-TABLE ?auto_33914 ) ( ON ?auto_33915 ?auto_33914 ) ( ON ?auto_33916 ?auto_33915 ) ( ON ?auto_33917 ?auto_33916 ) ( ON ?auto_33918 ?auto_33917 ) ( not ( = ?auto_33914 ?auto_33915 ) ) ( not ( = ?auto_33914 ?auto_33916 ) ) ( not ( = ?auto_33914 ?auto_33917 ) ) ( not ( = ?auto_33914 ?auto_33918 ) ) ( not ( = ?auto_33914 ?auto_33919 ) ) ( not ( = ?auto_33914 ?auto_33920 ) ) ( not ( = ?auto_33914 ?auto_33921 ) ) ( not ( = ?auto_33915 ?auto_33916 ) ) ( not ( = ?auto_33915 ?auto_33917 ) ) ( not ( = ?auto_33915 ?auto_33918 ) ) ( not ( = ?auto_33915 ?auto_33919 ) ) ( not ( = ?auto_33915 ?auto_33920 ) ) ( not ( = ?auto_33915 ?auto_33921 ) ) ( not ( = ?auto_33916 ?auto_33917 ) ) ( not ( = ?auto_33916 ?auto_33918 ) ) ( not ( = ?auto_33916 ?auto_33919 ) ) ( not ( = ?auto_33916 ?auto_33920 ) ) ( not ( = ?auto_33916 ?auto_33921 ) ) ( not ( = ?auto_33917 ?auto_33918 ) ) ( not ( = ?auto_33917 ?auto_33919 ) ) ( not ( = ?auto_33917 ?auto_33920 ) ) ( not ( = ?auto_33917 ?auto_33921 ) ) ( not ( = ?auto_33918 ?auto_33919 ) ) ( not ( = ?auto_33918 ?auto_33920 ) ) ( not ( = ?auto_33918 ?auto_33921 ) ) ( not ( = ?auto_33919 ?auto_33920 ) ) ( not ( = ?auto_33919 ?auto_33921 ) ) ( not ( = ?auto_33920 ?auto_33921 ) ) ( CLEAR ?auto_33918 ) ( ON ?auto_33919 ?auto_33920 ) ( CLEAR ?auto_33919 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_33914 ?auto_33915 ?auto_33916 ?auto_33917 ?auto_33918 ?auto_33919 )
      ( MAKE-7PILE ?auto_33914 ?auto_33915 ?auto_33916 ?auto_33917 ?auto_33918 ?auto_33919 ?auto_33920 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_33944 - BLOCK
      ?auto_33945 - BLOCK
      ?auto_33946 - BLOCK
      ?auto_33947 - BLOCK
      ?auto_33948 - BLOCK
      ?auto_33949 - BLOCK
      ?auto_33950 - BLOCK
    )
    :vars
    (
      ?auto_33951 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_33950 ?auto_33951 ) ( ON-TABLE ?auto_33944 ) ( ON ?auto_33945 ?auto_33944 ) ( ON ?auto_33946 ?auto_33945 ) ( ON ?auto_33947 ?auto_33946 ) ( not ( = ?auto_33944 ?auto_33945 ) ) ( not ( = ?auto_33944 ?auto_33946 ) ) ( not ( = ?auto_33944 ?auto_33947 ) ) ( not ( = ?auto_33944 ?auto_33948 ) ) ( not ( = ?auto_33944 ?auto_33949 ) ) ( not ( = ?auto_33944 ?auto_33950 ) ) ( not ( = ?auto_33944 ?auto_33951 ) ) ( not ( = ?auto_33945 ?auto_33946 ) ) ( not ( = ?auto_33945 ?auto_33947 ) ) ( not ( = ?auto_33945 ?auto_33948 ) ) ( not ( = ?auto_33945 ?auto_33949 ) ) ( not ( = ?auto_33945 ?auto_33950 ) ) ( not ( = ?auto_33945 ?auto_33951 ) ) ( not ( = ?auto_33946 ?auto_33947 ) ) ( not ( = ?auto_33946 ?auto_33948 ) ) ( not ( = ?auto_33946 ?auto_33949 ) ) ( not ( = ?auto_33946 ?auto_33950 ) ) ( not ( = ?auto_33946 ?auto_33951 ) ) ( not ( = ?auto_33947 ?auto_33948 ) ) ( not ( = ?auto_33947 ?auto_33949 ) ) ( not ( = ?auto_33947 ?auto_33950 ) ) ( not ( = ?auto_33947 ?auto_33951 ) ) ( not ( = ?auto_33948 ?auto_33949 ) ) ( not ( = ?auto_33948 ?auto_33950 ) ) ( not ( = ?auto_33948 ?auto_33951 ) ) ( not ( = ?auto_33949 ?auto_33950 ) ) ( not ( = ?auto_33949 ?auto_33951 ) ) ( not ( = ?auto_33950 ?auto_33951 ) ) ( ON ?auto_33949 ?auto_33950 ) ( CLEAR ?auto_33947 ) ( ON ?auto_33948 ?auto_33949 ) ( CLEAR ?auto_33948 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_33944 ?auto_33945 ?auto_33946 ?auto_33947 ?auto_33948 )
      ( MAKE-7PILE ?auto_33944 ?auto_33945 ?auto_33946 ?auto_33947 ?auto_33948 ?auto_33949 ?auto_33950 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_33974 - BLOCK
      ?auto_33975 - BLOCK
      ?auto_33976 - BLOCK
      ?auto_33977 - BLOCK
      ?auto_33978 - BLOCK
      ?auto_33979 - BLOCK
      ?auto_33980 - BLOCK
    )
    :vars
    (
      ?auto_33981 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_33980 ?auto_33981 ) ( ON-TABLE ?auto_33974 ) ( ON ?auto_33975 ?auto_33974 ) ( ON ?auto_33976 ?auto_33975 ) ( not ( = ?auto_33974 ?auto_33975 ) ) ( not ( = ?auto_33974 ?auto_33976 ) ) ( not ( = ?auto_33974 ?auto_33977 ) ) ( not ( = ?auto_33974 ?auto_33978 ) ) ( not ( = ?auto_33974 ?auto_33979 ) ) ( not ( = ?auto_33974 ?auto_33980 ) ) ( not ( = ?auto_33974 ?auto_33981 ) ) ( not ( = ?auto_33975 ?auto_33976 ) ) ( not ( = ?auto_33975 ?auto_33977 ) ) ( not ( = ?auto_33975 ?auto_33978 ) ) ( not ( = ?auto_33975 ?auto_33979 ) ) ( not ( = ?auto_33975 ?auto_33980 ) ) ( not ( = ?auto_33975 ?auto_33981 ) ) ( not ( = ?auto_33976 ?auto_33977 ) ) ( not ( = ?auto_33976 ?auto_33978 ) ) ( not ( = ?auto_33976 ?auto_33979 ) ) ( not ( = ?auto_33976 ?auto_33980 ) ) ( not ( = ?auto_33976 ?auto_33981 ) ) ( not ( = ?auto_33977 ?auto_33978 ) ) ( not ( = ?auto_33977 ?auto_33979 ) ) ( not ( = ?auto_33977 ?auto_33980 ) ) ( not ( = ?auto_33977 ?auto_33981 ) ) ( not ( = ?auto_33978 ?auto_33979 ) ) ( not ( = ?auto_33978 ?auto_33980 ) ) ( not ( = ?auto_33978 ?auto_33981 ) ) ( not ( = ?auto_33979 ?auto_33980 ) ) ( not ( = ?auto_33979 ?auto_33981 ) ) ( not ( = ?auto_33980 ?auto_33981 ) ) ( ON ?auto_33979 ?auto_33980 ) ( ON ?auto_33978 ?auto_33979 ) ( CLEAR ?auto_33976 ) ( ON ?auto_33977 ?auto_33978 ) ( CLEAR ?auto_33977 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_33974 ?auto_33975 ?auto_33976 ?auto_33977 )
      ( MAKE-7PILE ?auto_33974 ?auto_33975 ?auto_33976 ?auto_33977 ?auto_33978 ?auto_33979 ?auto_33980 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_34004 - BLOCK
      ?auto_34005 - BLOCK
      ?auto_34006 - BLOCK
      ?auto_34007 - BLOCK
      ?auto_34008 - BLOCK
      ?auto_34009 - BLOCK
      ?auto_34010 - BLOCK
    )
    :vars
    (
      ?auto_34011 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_34010 ?auto_34011 ) ( ON-TABLE ?auto_34004 ) ( ON ?auto_34005 ?auto_34004 ) ( not ( = ?auto_34004 ?auto_34005 ) ) ( not ( = ?auto_34004 ?auto_34006 ) ) ( not ( = ?auto_34004 ?auto_34007 ) ) ( not ( = ?auto_34004 ?auto_34008 ) ) ( not ( = ?auto_34004 ?auto_34009 ) ) ( not ( = ?auto_34004 ?auto_34010 ) ) ( not ( = ?auto_34004 ?auto_34011 ) ) ( not ( = ?auto_34005 ?auto_34006 ) ) ( not ( = ?auto_34005 ?auto_34007 ) ) ( not ( = ?auto_34005 ?auto_34008 ) ) ( not ( = ?auto_34005 ?auto_34009 ) ) ( not ( = ?auto_34005 ?auto_34010 ) ) ( not ( = ?auto_34005 ?auto_34011 ) ) ( not ( = ?auto_34006 ?auto_34007 ) ) ( not ( = ?auto_34006 ?auto_34008 ) ) ( not ( = ?auto_34006 ?auto_34009 ) ) ( not ( = ?auto_34006 ?auto_34010 ) ) ( not ( = ?auto_34006 ?auto_34011 ) ) ( not ( = ?auto_34007 ?auto_34008 ) ) ( not ( = ?auto_34007 ?auto_34009 ) ) ( not ( = ?auto_34007 ?auto_34010 ) ) ( not ( = ?auto_34007 ?auto_34011 ) ) ( not ( = ?auto_34008 ?auto_34009 ) ) ( not ( = ?auto_34008 ?auto_34010 ) ) ( not ( = ?auto_34008 ?auto_34011 ) ) ( not ( = ?auto_34009 ?auto_34010 ) ) ( not ( = ?auto_34009 ?auto_34011 ) ) ( not ( = ?auto_34010 ?auto_34011 ) ) ( ON ?auto_34009 ?auto_34010 ) ( ON ?auto_34008 ?auto_34009 ) ( ON ?auto_34007 ?auto_34008 ) ( CLEAR ?auto_34005 ) ( ON ?auto_34006 ?auto_34007 ) ( CLEAR ?auto_34006 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_34004 ?auto_34005 ?auto_34006 )
      ( MAKE-7PILE ?auto_34004 ?auto_34005 ?auto_34006 ?auto_34007 ?auto_34008 ?auto_34009 ?auto_34010 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_34034 - BLOCK
      ?auto_34035 - BLOCK
      ?auto_34036 - BLOCK
      ?auto_34037 - BLOCK
      ?auto_34038 - BLOCK
      ?auto_34039 - BLOCK
      ?auto_34040 - BLOCK
    )
    :vars
    (
      ?auto_34041 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_34040 ?auto_34041 ) ( ON-TABLE ?auto_34034 ) ( not ( = ?auto_34034 ?auto_34035 ) ) ( not ( = ?auto_34034 ?auto_34036 ) ) ( not ( = ?auto_34034 ?auto_34037 ) ) ( not ( = ?auto_34034 ?auto_34038 ) ) ( not ( = ?auto_34034 ?auto_34039 ) ) ( not ( = ?auto_34034 ?auto_34040 ) ) ( not ( = ?auto_34034 ?auto_34041 ) ) ( not ( = ?auto_34035 ?auto_34036 ) ) ( not ( = ?auto_34035 ?auto_34037 ) ) ( not ( = ?auto_34035 ?auto_34038 ) ) ( not ( = ?auto_34035 ?auto_34039 ) ) ( not ( = ?auto_34035 ?auto_34040 ) ) ( not ( = ?auto_34035 ?auto_34041 ) ) ( not ( = ?auto_34036 ?auto_34037 ) ) ( not ( = ?auto_34036 ?auto_34038 ) ) ( not ( = ?auto_34036 ?auto_34039 ) ) ( not ( = ?auto_34036 ?auto_34040 ) ) ( not ( = ?auto_34036 ?auto_34041 ) ) ( not ( = ?auto_34037 ?auto_34038 ) ) ( not ( = ?auto_34037 ?auto_34039 ) ) ( not ( = ?auto_34037 ?auto_34040 ) ) ( not ( = ?auto_34037 ?auto_34041 ) ) ( not ( = ?auto_34038 ?auto_34039 ) ) ( not ( = ?auto_34038 ?auto_34040 ) ) ( not ( = ?auto_34038 ?auto_34041 ) ) ( not ( = ?auto_34039 ?auto_34040 ) ) ( not ( = ?auto_34039 ?auto_34041 ) ) ( not ( = ?auto_34040 ?auto_34041 ) ) ( ON ?auto_34039 ?auto_34040 ) ( ON ?auto_34038 ?auto_34039 ) ( ON ?auto_34037 ?auto_34038 ) ( ON ?auto_34036 ?auto_34037 ) ( CLEAR ?auto_34034 ) ( ON ?auto_34035 ?auto_34036 ) ( CLEAR ?auto_34035 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_34034 ?auto_34035 )
      ( MAKE-7PILE ?auto_34034 ?auto_34035 ?auto_34036 ?auto_34037 ?auto_34038 ?auto_34039 ?auto_34040 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_34064 - BLOCK
      ?auto_34065 - BLOCK
      ?auto_34066 - BLOCK
      ?auto_34067 - BLOCK
      ?auto_34068 - BLOCK
      ?auto_34069 - BLOCK
      ?auto_34070 - BLOCK
    )
    :vars
    (
      ?auto_34071 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_34070 ?auto_34071 ) ( not ( = ?auto_34064 ?auto_34065 ) ) ( not ( = ?auto_34064 ?auto_34066 ) ) ( not ( = ?auto_34064 ?auto_34067 ) ) ( not ( = ?auto_34064 ?auto_34068 ) ) ( not ( = ?auto_34064 ?auto_34069 ) ) ( not ( = ?auto_34064 ?auto_34070 ) ) ( not ( = ?auto_34064 ?auto_34071 ) ) ( not ( = ?auto_34065 ?auto_34066 ) ) ( not ( = ?auto_34065 ?auto_34067 ) ) ( not ( = ?auto_34065 ?auto_34068 ) ) ( not ( = ?auto_34065 ?auto_34069 ) ) ( not ( = ?auto_34065 ?auto_34070 ) ) ( not ( = ?auto_34065 ?auto_34071 ) ) ( not ( = ?auto_34066 ?auto_34067 ) ) ( not ( = ?auto_34066 ?auto_34068 ) ) ( not ( = ?auto_34066 ?auto_34069 ) ) ( not ( = ?auto_34066 ?auto_34070 ) ) ( not ( = ?auto_34066 ?auto_34071 ) ) ( not ( = ?auto_34067 ?auto_34068 ) ) ( not ( = ?auto_34067 ?auto_34069 ) ) ( not ( = ?auto_34067 ?auto_34070 ) ) ( not ( = ?auto_34067 ?auto_34071 ) ) ( not ( = ?auto_34068 ?auto_34069 ) ) ( not ( = ?auto_34068 ?auto_34070 ) ) ( not ( = ?auto_34068 ?auto_34071 ) ) ( not ( = ?auto_34069 ?auto_34070 ) ) ( not ( = ?auto_34069 ?auto_34071 ) ) ( not ( = ?auto_34070 ?auto_34071 ) ) ( ON ?auto_34069 ?auto_34070 ) ( ON ?auto_34068 ?auto_34069 ) ( ON ?auto_34067 ?auto_34068 ) ( ON ?auto_34066 ?auto_34067 ) ( ON ?auto_34065 ?auto_34066 ) ( ON ?auto_34064 ?auto_34065 ) ( CLEAR ?auto_34064 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_34064 )
      ( MAKE-7PILE ?auto_34064 ?auto_34065 ?auto_34066 ?auto_34067 ?auto_34068 ?auto_34069 ?auto_34070 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_34095 - BLOCK
      ?auto_34096 - BLOCK
      ?auto_34097 - BLOCK
      ?auto_34098 - BLOCK
      ?auto_34099 - BLOCK
      ?auto_34100 - BLOCK
      ?auto_34101 - BLOCK
      ?auto_34102 - BLOCK
    )
    :vars
    (
      ?auto_34103 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_34101 ) ( ON ?auto_34102 ?auto_34103 ) ( CLEAR ?auto_34102 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_34095 ) ( ON ?auto_34096 ?auto_34095 ) ( ON ?auto_34097 ?auto_34096 ) ( ON ?auto_34098 ?auto_34097 ) ( ON ?auto_34099 ?auto_34098 ) ( ON ?auto_34100 ?auto_34099 ) ( ON ?auto_34101 ?auto_34100 ) ( not ( = ?auto_34095 ?auto_34096 ) ) ( not ( = ?auto_34095 ?auto_34097 ) ) ( not ( = ?auto_34095 ?auto_34098 ) ) ( not ( = ?auto_34095 ?auto_34099 ) ) ( not ( = ?auto_34095 ?auto_34100 ) ) ( not ( = ?auto_34095 ?auto_34101 ) ) ( not ( = ?auto_34095 ?auto_34102 ) ) ( not ( = ?auto_34095 ?auto_34103 ) ) ( not ( = ?auto_34096 ?auto_34097 ) ) ( not ( = ?auto_34096 ?auto_34098 ) ) ( not ( = ?auto_34096 ?auto_34099 ) ) ( not ( = ?auto_34096 ?auto_34100 ) ) ( not ( = ?auto_34096 ?auto_34101 ) ) ( not ( = ?auto_34096 ?auto_34102 ) ) ( not ( = ?auto_34096 ?auto_34103 ) ) ( not ( = ?auto_34097 ?auto_34098 ) ) ( not ( = ?auto_34097 ?auto_34099 ) ) ( not ( = ?auto_34097 ?auto_34100 ) ) ( not ( = ?auto_34097 ?auto_34101 ) ) ( not ( = ?auto_34097 ?auto_34102 ) ) ( not ( = ?auto_34097 ?auto_34103 ) ) ( not ( = ?auto_34098 ?auto_34099 ) ) ( not ( = ?auto_34098 ?auto_34100 ) ) ( not ( = ?auto_34098 ?auto_34101 ) ) ( not ( = ?auto_34098 ?auto_34102 ) ) ( not ( = ?auto_34098 ?auto_34103 ) ) ( not ( = ?auto_34099 ?auto_34100 ) ) ( not ( = ?auto_34099 ?auto_34101 ) ) ( not ( = ?auto_34099 ?auto_34102 ) ) ( not ( = ?auto_34099 ?auto_34103 ) ) ( not ( = ?auto_34100 ?auto_34101 ) ) ( not ( = ?auto_34100 ?auto_34102 ) ) ( not ( = ?auto_34100 ?auto_34103 ) ) ( not ( = ?auto_34101 ?auto_34102 ) ) ( not ( = ?auto_34101 ?auto_34103 ) ) ( not ( = ?auto_34102 ?auto_34103 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_34102 ?auto_34103 )
      ( !STACK ?auto_34102 ?auto_34101 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_34112 - BLOCK
      ?auto_34113 - BLOCK
      ?auto_34114 - BLOCK
      ?auto_34115 - BLOCK
      ?auto_34116 - BLOCK
      ?auto_34117 - BLOCK
      ?auto_34118 - BLOCK
      ?auto_34119 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_34118 ) ( ON-TABLE ?auto_34119 ) ( CLEAR ?auto_34119 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_34112 ) ( ON ?auto_34113 ?auto_34112 ) ( ON ?auto_34114 ?auto_34113 ) ( ON ?auto_34115 ?auto_34114 ) ( ON ?auto_34116 ?auto_34115 ) ( ON ?auto_34117 ?auto_34116 ) ( ON ?auto_34118 ?auto_34117 ) ( not ( = ?auto_34112 ?auto_34113 ) ) ( not ( = ?auto_34112 ?auto_34114 ) ) ( not ( = ?auto_34112 ?auto_34115 ) ) ( not ( = ?auto_34112 ?auto_34116 ) ) ( not ( = ?auto_34112 ?auto_34117 ) ) ( not ( = ?auto_34112 ?auto_34118 ) ) ( not ( = ?auto_34112 ?auto_34119 ) ) ( not ( = ?auto_34113 ?auto_34114 ) ) ( not ( = ?auto_34113 ?auto_34115 ) ) ( not ( = ?auto_34113 ?auto_34116 ) ) ( not ( = ?auto_34113 ?auto_34117 ) ) ( not ( = ?auto_34113 ?auto_34118 ) ) ( not ( = ?auto_34113 ?auto_34119 ) ) ( not ( = ?auto_34114 ?auto_34115 ) ) ( not ( = ?auto_34114 ?auto_34116 ) ) ( not ( = ?auto_34114 ?auto_34117 ) ) ( not ( = ?auto_34114 ?auto_34118 ) ) ( not ( = ?auto_34114 ?auto_34119 ) ) ( not ( = ?auto_34115 ?auto_34116 ) ) ( not ( = ?auto_34115 ?auto_34117 ) ) ( not ( = ?auto_34115 ?auto_34118 ) ) ( not ( = ?auto_34115 ?auto_34119 ) ) ( not ( = ?auto_34116 ?auto_34117 ) ) ( not ( = ?auto_34116 ?auto_34118 ) ) ( not ( = ?auto_34116 ?auto_34119 ) ) ( not ( = ?auto_34117 ?auto_34118 ) ) ( not ( = ?auto_34117 ?auto_34119 ) ) ( not ( = ?auto_34118 ?auto_34119 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_34119 )
      ( !STACK ?auto_34119 ?auto_34118 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_34128 - BLOCK
      ?auto_34129 - BLOCK
      ?auto_34130 - BLOCK
      ?auto_34131 - BLOCK
      ?auto_34132 - BLOCK
      ?auto_34133 - BLOCK
      ?auto_34134 - BLOCK
      ?auto_34135 - BLOCK
    )
    :vars
    (
      ?auto_34136 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_34135 ?auto_34136 ) ( ON-TABLE ?auto_34128 ) ( ON ?auto_34129 ?auto_34128 ) ( ON ?auto_34130 ?auto_34129 ) ( ON ?auto_34131 ?auto_34130 ) ( ON ?auto_34132 ?auto_34131 ) ( ON ?auto_34133 ?auto_34132 ) ( not ( = ?auto_34128 ?auto_34129 ) ) ( not ( = ?auto_34128 ?auto_34130 ) ) ( not ( = ?auto_34128 ?auto_34131 ) ) ( not ( = ?auto_34128 ?auto_34132 ) ) ( not ( = ?auto_34128 ?auto_34133 ) ) ( not ( = ?auto_34128 ?auto_34134 ) ) ( not ( = ?auto_34128 ?auto_34135 ) ) ( not ( = ?auto_34128 ?auto_34136 ) ) ( not ( = ?auto_34129 ?auto_34130 ) ) ( not ( = ?auto_34129 ?auto_34131 ) ) ( not ( = ?auto_34129 ?auto_34132 ) ) ( not ( = ?auto_34129 ?auto_34133 ) ) ( not ( = ?auto_34129 ?auto_34134 ) ) ( not ( = ?auto_34129 ?auto_34135 ) ) ( not ( = ?auto_34129 ?auto_34136 ) ) ( not ( = ?auto_34130 ?auto_34131 ) ) ( not ( = ?auto_34130 ?auto_34132 ) ) ( not ( = ?auto_34130 ?auto_34133 ) ) ( not ( = ?auto_34130 ?auto_34134 ) ) ( not ( = ?auto_34130 ?auto_34135 ) ) ( not ( = ?auto_34130 ?auto_34136 ) ) ( not ( = ?auto_34131 ?auto_34132 ) ) ( not ( = ?auto_34131 ?auto_34133 ) ) ( not ( = ?auto_34131 ?auto_34134 ) ) ( not ( = ?auto_34131 ?auto_34135 ) ) ( not ( = ?auto_34131 ?auto_34136 ) ) ( not ( = ?auto_34132 ?auto_34133 ) ) ( not ( = ?auto_34132 ?auto_34134 ) ) ( not ( = ?auto_34132 ?auto_34135 ) ) ( not ( = ?auto_34132 ?auto_34136 ) ) ( not ( = ?auto_34133 ?auto_34134 ) ) ( not ( = ?auto_34133 ?auto_34135 ) ) ( not ( = ?auto_34133 ?auto_34136 ) ) ( not ( = ?auto_34134 ?auto_34135 ) ) ( not ( = ?auto_34134 ?auto_34136 ) ) ( not ( = ?auto_34135 ?auto_34136 ) ) ( CLEAR ?auto_34133 ) ( ON ?auto_34134 ?auto_34135 ) ( CLEAR ?auto_34134 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_34128 ?auto_34129 ?auto_34130 ?auto_34131 ?auto_34132 ?auto_34133 ?auto_34134 )
      ( MAKE-8PILE ?auto_34128 ?auto_34129 ?auto_34130 ?auto_34131 ?auto_34132 ?auto_34133 ?auto_34134 ?auto_34135 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_34145 - BLOCK
      ?auto_34146 - BLOCK
      ?auto_34147 - BLOCK
      ?auto_34148 - BLOCK
      ?auto_34149 - BLOCK
      ?auto_34150 - BLOCK
      ?auto_34151 - BLOCK
      ?auto_34152 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_34152 ) ( ON-TABLE ?auto_34145 ) ( ON ?auto_34146 ?auto_34145 ) ( ON ?auto_34147 ?auto_34146 ) ( ON ?auto_34148 ?auto_34147 ) ( ON ?auto_34149 ?auto_34148 ) ( ON ?auto_34150 ?auto_34149 ) ( not ( = ?auto_34145 ?auto_34146 ) ) ( not ( = ?auto_34145 ?auto_34147 ) ) ( not ( = ?auto_34145 ?auto_34148 ) ) ( not ( = ?auto_34145 ?auto_34149 ) ) ( not ( = ?auto_34145 ?auto_34150 ) ) ( not ( = ?auto_34145 ?auto_34151 ) ) ( not ( = ?auto_34145 ?auto_34152 ) ) ( not ( = ?auto_34146 ?auto_34147 ) ) ( not ( = ?auto_34146 ?auto_34148 ) ) ( not ( = ?auto_34146 ?auto_34149 ) ) ( not ( = ?auto_34146 ?auto_34150 ) ) ( not ( = ?auto_34146 ?auto_34151 ) ) ( not ( = ?auto_34146 ?auto_34152 ) ) ( not ( = ?auto_34147 ?auto_34148 ) ) ( not ( = ?auto_34147 ?auto_34149 ) ) ( not ( = ?auto_34147 ?auto_34150 ) ) ( not ( = ?auto_34147 ?auto_34151 ) ) ( not ( = ?auto_34147 ?auto_34152 ) ) ( not ( = ?auto_34148 ?auto_34149 ) ) ( not ( = ?auto_34148 ?auto_34150 ) ) ( not ( = ?auto_34148 ?auto_34151 ) ) ( not ( = ?auto_34148 ?auto_34152 ) ) ( not ( = ?auto_34149 ?auto_34150 ) ) ( not ( = ?auto_34149 ?auto_34151 ) ) ( not ( = ?auto_34149 ?auto_34152 ) ) ( not ( = ?auto_34150 ?auto_34151 ) ) ( not ( = ?auto_34150 ?auto_34152 ) ) ( not ( = ?auto_34151 ?auto_34152 ) ) ( CLEAR ?auto_34150 ) ( ON ?auto_34151 ?auto_34152 ) ( CLEAR ?auto_34151 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_34145 ?auto_34146 ?auto_34147 ?auto_34148 ?auto_34149 ?auto_34150 ?auto_34151 )
      ( MAKE-8PILE ?auto_34145 ?auto_34146 ?auto_34147 ?auto_34148 ?auto_34149 ?auto_34150 ?auto_34151 ?auto_34152 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_34161 - BLOCK
      ?auto_34162 - BLOCK
      ?auto_34163 - BLOCK
      ?auto_34164 - BLOCK
      ?auto_34165 - BLOCK
      ?auto_34166 - BLOCK
      ?auto_34167 - BLOCK
      ?auto_34168 - BLOCK
    )
    :vars
    (
      ?auto_34169 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_34168 ?auto_34169 ) ( ON-TABLE ?auto_34161 ) ( ON ?auto_34162 ?auto_34161 ) ( ON ?auto_34163 ?auto_34162 ) ( ON ?auto_34164 ?auto_34163 ) ( ON ?auto_34165 ?auto_34164 ) ( not ( = ?auto_34161 ?auto_34162 ) ) ( not ( = ?auto_34161 ?auto_34163 ) ) ( not ( = ?auto_34161 ?auto_34164 ) ) ( not ( = ?auto_34161 ?auto_34165 ) ) ( not ( = ?auto_34161 ?auto_34166 ) ) ( not ( = ?auto_34161 ?auto_34167 ) ) ( not ( = ?auto_34161 ?auto_34168 ) ) ( not ( = ?auto_34161 ?auto_34169 ) ) ( not ( = ?auto_34162 ?auto_34163 ) ) ( not ( = ?auto_34162 ?auto_34164 ) ) ( not ( = ?auto_34162 ?auto_34165 ) ) ( not ( = ?auto_34162 ?auto_34166 ) ) ( not ( = ?auto_34162 ?auto_34167 ) ) ( not ( = ?auto_34162 ?auto_34168 ) ) ( not ( = ?auto_34162 ?auto_34169 ) ) ( not ( = ?auto_34163 ?auto_34164 ) ) ( not ( = ?auto_34163 ?auto_34165 ) ) ( not ( = ?auto_34163 ?auto_34166 ) ) ( not ( = ?auto_34163 ?auto_34167 ) ) ( not ( = ?auto_34163 ?auto_34168 ) ) ( not ( = ?auto_34163 ?auto_34169 ) ) ( not ( = ?auto_34164 ?auto_34165 ) ) ( not ( = ?auto_34164 ?auto_34166 ) ) ( not ( = ?auto_34164 ?auto_34167 ) ) ( not ( = ?auto_34164 ?auto_34168 ) ) ( not ( = ?auto_34164 ?auto_34169 ) ) ( not ( = ?auto_34165 ?auto_34166 ) ) ( not ( = ?auto_34165 ?auto_34167 ) ) ( not ( = ?auto_34165 ?auto_34168 ) ) ( not ( = ?auto_34165 ?auto_34169 ) ) ( not ( = ?auto_34166 ?auto_34167 ) ) ( not ( = ?auto_34166 ?auto_34168 ) ) ( not ( = ?auto_34166 ?auto_34169 ) ) ( not ( = ?auto_34167 ?auto_34168 ) ) ( not ( = ?auto_34167 ?auto_34169 ) ) ( not ( = ?auto_34168 ?auto_34169 ) ) ( ON ?auto_34167 ?auto_34168 ) ( CLEAR ?auto_34165 ) ( ON ?auto_34166 ?auto_34167 ) ( CLEAR ?auto_34166 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_34161 ?auto_34162 ?auto_34163 ?auto_34164 ?auto_34165 ?auto_34166 )
      ( MAKE-8PILE ?auto_34161 ?auto_34162 ?auto_34163 ?auto_34164 ?auto_34165 ?auto_34166 ?auto_34167 ?auto_34168 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_34178 - BLOCK
      ?auto_34179 - BLOCK
      ?auto_34180 - BLOCK
      ?auto_34181 - BLOCK
      ?auto_34182 - BLOCK
      ?auto_34183 - BLOCK
      ?auto_34184 - BLOCK
      ?auto_34185 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_34185 ) ( ON-TABLE ?auto_34178 ) ( ON ?auto_34179 ?auto_34178 ) ( ON ?auto_34180 ?auto_34179 ) ( ON ?auto_34181 ?auto_34180 ) ( ON ?auto_34182 ?auto_34181 ) ( not ( = ?auto_34178 ?auto_34179 ) ) ( not ( = ?auto_34178 ?auto_34180 ) ) ( not ( = ?auto_34178 ?auto_34181 ) ) ( not ( = ?auto_34178 ?auto_34182 ) ) ( not ( = ?auto_34178 ?auto_34183 ) ) ( not ( = ?auto_34178 ?auto_34184 ) ) ( not ( = ?auto_34178 ?auto_34185 ) ) ( not ( = ?auto_34179 ?auto_34180 ) ) ( not ( = ?auto_34179 ?auto_34181 ) ) ( not ( = ?auto_34179 ?auto_34182 ) ) ( not ( = ?auto_34179 ?auto_34183 ) ) ( not ( = ?auto_34179 ?auto_34184 ) ) ( not ( = ?auto_34179 ?auto_34185 ) ) ( not ( = ?auto_34180 ?auto_34181 ) ) ( not ( = ?auto_34180 ?auto_34182 ) ) ( not ( = ?auto_34180 ?auto_34183 ) ) ( not ( = ?auto_34180 ?auto_34184 ) ) ( not ( = ?auto_34180 ?auto_34185 ) ) ( not ( = ?auto_34181 ?auto_34182 ) ) ( not ( = ?auto_34181 ?auto_34183 ) ) ( not ( = ?auto_34181 ?auto_34184 ) ) ( not ( = ?auto_34181 ?auto_34185 ) ) ( not ( = ?auto_34182 ?auto_34183 ) ) ( not ( = ?auto_34182 ?auto_34184 ) ) ( not ( = ?auto_34182 ?auto_34185 ) ) ( not ( = ?auto_34183 ?auto_34184 ) ) ( not ( = ?auto_34183 ?auto_34185 ) ) ( not ( = ?auto_34184 ?auto_34185 ) ) ( ON ?auto_34184 ?auto_34185 ) ( CLEAR ?auto_34182 ) ( ON ?auto_34183 ?auto_34184 ) ( CLEAR ?auto_34183 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_34178 ?auto_34179 ?auto_34180 ?auto_34181 ?auto_34182 ?auto_34183 )
      ( MAKE-8PILE ?auto_34178 ?auto_34179 ?auto_34180 ?auto_34181 ?auto_34182 ?auto_34183 ?auto_34184 ?auto_34185 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_34194 - BLOCK
      ?auto_34195 - BLOCK
      ?auto_34196 - BLOCK
      ?auto_34197 - BLOCK
      ?auto_34198 - BLOCK
      ?auto_34199 - BLOCK
      ?auto_34200 - BLOCK
      ?auto_34201 - BLOCK
    )
    :vars
    (
      ?auto_34202 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_34201 ?auto_34202 ) ( ON-TABLE ?auto_34194 ) ( ON ?auto_34195 ?auto_34194 ) ( ON ?auto_34196 ?auto_34195 ) ( ON ?auto_34197 ?auto_34196 ) ( not ( = ?auto_34194 ?auto_34195 ) ) ( not ( = ?auto_34194 ?auto_34196 ) ) ( not ( = ?auto_34194 ?auto_34197 ) ) ( not ( = ?auto_34194 ?auto_34198 ) ) ( not ( = ?auto_34194 ?auto_34199 ) ) ( not ( = ?auto_34194 ?auto_34200 ) ) ( not ( = ?auto_34194 ?auto_34201 ) ) ( not ( = ?auto_34194 ?auto_34202 ) ) ( not ( = ?auto_34195 ?auto_34196 ) ) ( not ( = ?auto_34195 ?auto_34197 ) ) ( not ( = ?auto_34195 ?auto_34198 ) ) ( not ( = ?auto_34195 ?auto_34199 ) ) ( not ( = ?auto_34195 ?auto_34200 ) ) ( not ( = ?auto_34195 ?auto_34201 ) ) ( not ( = ?auto_34195 ?auto_34202 ) ) ( not ( = ?auto_34196 ?auto_34197 ) ) ( not ( = ?auto_34196 ?auto_34198 ) ) ( not ( = ?auto_34196 ?auto_34199 ) ) ( not ( = ?auto_34196 ?auto_34200 ) ) ( not ( = ?auto_34196 ?auto_34201 ) ) ( not ( = ?auto_34196 ?auto_34202 ) ) ( not ( = ?auto_34197 ?auto_34198 ) ) ( not ( = ?auto_34197 ?auto_34199 ) ) ( not ( = ?auto_34197 ?auto_34200 ) ) ( not ( = ?auto_34197 ?auto_34201 ) ) ( not ( = ?auto_34197 ?auto_34202 ) ) ( not ( = ?auto_34198 ?auto_34199 ) ) ( not ( = ?auto_34198 ?auto_34200 ) ) ( not ( = ?auto_34198 ?auto_34201 ) ) ( not ( = ?auto_34198 ?auto_34202 ) ) ( not ( = ?auto_34199 ?auto_34200 ) ) ( not ( = ?auto_34199 ?auto_34201 ) ) ( not ( = ?auto_34199 ?auto_34202 ) ) ( not ( = ?auto_34200 ?auto_34201 ) ) ( not ( = ?auto_34200 ?auto_34202 ) ) ( not ( = ?auto_34201 ?auto_34202 ) ) ( ON ?auto_34200 ?auto_34201 ) ( ON ?auto_34199 ?auto_34200 ) ( CLEAR ?auto_34197 ) ( ON ?auto_34198 ?auto_34199 ) ( CLEAR ?auto_34198 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_34194 ?auto_34195 ?auto_34196 ?auto_34197 ?auto_34198 )
      ( MAKE-8PILE ?auto_34194 ?auto_34195 ?auto_34196 ?auto_34197 ?auto_34198 ?auto_34199 ?auto_34200 ?auto_34201 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_34211 - BLOCK
      ?auto_34212 - BLOCK
      ?auto_34213 - BLOCK
      ?auto_34214 - BLOCK
      ?auto_34215 - BLOCK
      ?auto_34216 - BLOCK
      ?auto_34217 - BLOCK
      ?auto_34218 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_34218 ) ( ON-TABLE ?auto_34211 ) ( ON ?auto_34212 ?auto_34211 ) ( ON ?auto_34213 ?auto_34212 ) ( ON ?auto_34214 ?auto_34213 ) ( not ( = ?auto_34211 ?auto_34212 ) ) ( not ( = ?auto_34211 ?auto_34213 ) ) ( not ( = ?auto_34211 ?auto_34214 ) ) ( not ( = ?auto_34211 ?auto_34215 ) ) ( not ( = ?auto_34211 ?auto_34216 ) ) ( not ( = ?auto_34211 ?auto_34217 ) ) ( not ( = ?auto_34211 ?auto_34218 ) ) ( not ( = ?auto_34212 ?auto_34213 ) ) ( not ( = ?auto_34212 ?auto_34214 ) ) ( not ( = ?auto_34212 ?auto_34215 ) ) ( not ( = ?auto_34212 ?auto_34216 ) ) ( not ( = ?auto_34212 ?auto_34217 ) ) ( not ( = ?auto_34212 ?auto_34218 ) ) ( not ( = ?auto_34213 ?auto_34214 ) ) ( not ( = ?auto_34213 ?auto_34215 ) ) ( not ( = ?auto_34213 ?auto_34216 ) ) ( not ( = ?auto_34213 ?auto_34217 ) ) ( not ( = ?auto_34213 ?auto_34218 ) ) ( not ( = ?auto_34214 ?auto_34215 ) ) ( not ( = ?auto_34214 ?auto_34216 ) ) ( not ( = ?auto_34214 ?auto_34217 ) ) ( not ( = ?auto_34214 ?auto_34218 ) ) ( not ( = ?auto_34215 ?auto_34216 ) ) ( not ( = ?auto_34215 ?auto_34217 ) ) ( not ( = ?auto_34215 ?auto_34218 ) ) ( not ( = ?auto_34216 ?auto_34217 ) ) ( not ( = ?auto_34216 ?auto_34218 ) ) ( not ( = ?auto_34217 ?auto_34218 ) ) ( ON ?auto_34217 ?auto_34218 ) ( ON ?auto_34216 ?auto_34217 ) ( CLEAR ?auto_34214 ) ( ON ?auto_34215 ?auto_34216 ) ( CLEAR ?auto_34215 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_34211 ?auto_34212 ?auto_34213 ?auto_34214 ?auto_34215 )
      ( MAKE-8PILE ?auto_34211 ?auto_34212 ?auto_34213 ?auto_34214 ?auto_34215 ?auto_34216 ?auto_34217 ?auto_34218 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_34227 - BLOCK
      ?auto_34228 - BLOCK
      ?auto_34229 - BLOCK
      ?auto_34230 - BLOCK
      ?auto_34231 - BLOCK
      ?auto_34232 - BLOCK
      ?auto_34233 - BLOCK
      ?auto_34234 - BLOCK
    )
    :vars
    (
      ?auto_34235 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_34234 ?auto_34235 ) ( ON-TABLE ?auto_34227 ) ( ON ?auto_34228 ?auto_34227 ) ( ON ?auto_34229 ?auto_34228 ) ( not ( = ?auto_34227 ?auto_34228 ) ) ( not ( = ?auto_34227 ?auto_34229 ) ) ( not ( = ?auto_34227 ?auto_34230 ) ) ( not ( = ?auto_34227 ?auto_34231 ) ) ( not ( = ?auto_34227 ?auto_34232 ) ) ( not ( = ?auto_34227 ?auto_34233 ) ) ( not ( = ?auto_34227 ?auto_34234 ) ) ( not ( = ?auto_34227 ?auto_34235 ) ) ( not ( = ?auto_34228 ?auto_34229 ) ) ( not ( = ?auto_34228 ?auto_34230 ) ) ( not ( = ?auto_34228 ?auto_34231 ) ) ( not ( = ?auto_34228 ?auto_34232 ) ) ( not ( = ?auto_34228 ?auto_34233 ) ) ( not ( = ?auto_34228 ?auto_34234 ) ) ( not ( = ?auto_34228 ?auto_34235 ) ) ( not ( = ?auto_34229 ?auto_34230 ) ) ( not ( = ?auto_34229 ?auto_34231 ) ) ( not ( = ?auto_34229 ?auto_34232 ) ) ( not ( = ?auto_34229 ?auto_34233 ) ) ( not ( = ?auto_34229 ?auto_34234 ) ) ( not ( = ?auto_34229 ?auto_34235 ) ) ( not ( = ?auto_34230 ?auto_34231 ) ) ( not ( = ?auto_34230 ?auto_34232 ) ) ( not ( = ?auto_34230 ?auto_34233 ) ) ( not ( = ?auto_34230 ?auto_34234 ) ) ( not ( = ?auto_34230 ?auto_34235 ) ) ( not ( = ?auto_34231 ?auto_34232 ) ) ( not ( = ?auto_34231 ?auto_34233 ) ) ( not ( = ?auto_34231 ?auto_34234 ) ) ( not ( = ?auto_34231 ?auto_34235 ) ) ( not ( = ?auto_34232 ?auto_34233 ) ) ( not ( = ?auto_34232 ?auto_34234 ) ) ( not ( = ?auto_34232 ?auto_34235 ) ) ( not ( = ?auto_34233 ?auto_34234 ) ) ( not ( = ?auto_34233 ?auto_34235 ) ) ( not ( = ?auto_34234 ?auto_34235 ) ) ( ON ?auto_34233 ?auto_34234 ) ( ON ?auto_34232 ?auto_34233 ) ( ON ?auto_34231 ?auto_34232 ) ( CLEAR ?auto_34229 ) ( ON ?auto_34230 ?auto_34231 ) ( CLEAR ?auto_34230 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_34227 ?auto_34228 ?auto_34229 ?auto_34230 )
      ( MAKE-8PILE ?auto_34227 ?auto_34228 ?auto_34229 ?auto_34230 ?auto_34231 ?auto_34232 ?auto_34233 ?auto_34234 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_34244 - BLOCK
      ?auto_34245 - BLOCK
      ?auto_34246 - BLOCK
      ?auto_34247 - BLOCK
      ?auto_34248 - BLOCK
      ?auto_34249 - BLOCK
      ?auto_34250 - BLOCK
      ?auto_34251 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_34251 ) ( ON-TABLE ?auto_34244 ) ( ON ?auto_34245 ?auto_34244 ) ( ON ?auto_34246 ?auto_34245 ) ( not ( = ?auto_34244 ?auto_34245 ) ) ( not ( = ?auto_34244 ?auto_34246 ) ) ( not ( = ?auto_34244 ?auto_34247 ) ) ( not ( = ?auto_34244 ?auto_34248 ) ) ( not ( = ?auto_34244 ?auto_34249 ) ) ( not ( = ?auto_34244 ?auto_34250 ) ) ( not ( = ?auto_34244 ?auto_34251 ) ) ( not ( = ?auto_34245 ?auto_34246 ) ) ( not ( = ?auto_34245 ?auto_34247 ) ) ( not ( = ?auto_34245 ?auto_34248 ) ) ( not ( = ?auto_34245 ?auto_34249 ) ) ( not ( = ?auto_34245 ?auto_34250 ) ) ( not ( = ?auto_34245 ?auto_34251 ) ) ( not ( = ?auto_34246 ?auto_34247 ) ) ( not ( = ?auto_34246 ?auto_34248 ) ) ( not ( = ?auto_34246 ?auto_34249 ) ) ( not ( = ?auto_34246 ?auto_34250 ) ) ( not ( = ?auto_34246 ?auto_34251 ) ) ( not ( = ?auto_34247 ?auto_34248 ) ) ( not ( = ?auto_34247 ?auto_34249 ) ) ( not ( = ?auto_34247 ?auto_34250 ) ) ( not ( = ?auto_34247 ?auto_34251 ) ) ( not ( = ?auto_34248 ?auto_34249 ) ) ( not ( = ?auto_34248 ?auto_34250 ) ) ( not ( = ?auto_34248 ?auto_34251 ) ) ( not ( = ?auto_34249 ?auto_34250 ) ) ( not ( = ?auto_34249 ?auto_34251 ) ) ( not ( = ?auto_34250 ?auto_34251 ) ) ( ON ?auto_34250 ?auto_34251 ) ( ON ?auto_34249 ?auto_34250 ) ( ON ?auto_34248 ?auto_34249 ) ( CLEAR ?auto_34246 ) ( ON ?auto_34247 ?auto_34248 ) ( CLEAR ?auto_34247 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_34244 ?auto_34245 ?auto_34246 ?auto_34247 )
      ( MAKE-8PILE ?auto_34244 ?auto_34245 ?auto_34246 ?auto_34247 ?auto_34248 ?auto_34249 ?auto_34250 ?auto_34251 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_34260 - BLOCK
      ?auto_34261 - BLOCK
      ?auto_34262 - BLOCK
      ?auto_34263 - BLOCK
      ?auto_34264 - BLOCK
      ?auto_34265 - BLOCK
      ?auto_34266 - BLOCK
      ?auto_34267 - BLOCK
    )
    :vars
    (
      ?auto_34268 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_34267 ?auto_34268 ) ( ON-TABLE ?auto_34260 ) ( ON ?auto_34261 ?auto_34260 ) ( not ( = ?auto_34260 ?auto_34261 ) ) ( not ( = ?auto_34260 ?auto_34262 ) ) ( not ( = ?auto_34260 ?auto_34263 ) ) ( not ( = ?auto_34260 ?auto_34264 ) ) ( not ( = ?auto_34260 ?auto_34265 ) ) ( not ( = ?auto_34260 ?auto_34266 ) ) ( not ( = ?auto_34260 ?auto_34267 ) ) ( not ( = ?auto_34260 ?auto_34268 ) ) ( not ( = ?auto_34261 ?auto_34262 ) ) ( not ( = ?auto_34261 ?auto_34263 ) ) ( not ( = ?auto_34261 ?auto_34264 ) ) ( not ( = ?auto_34261 ?auto_34265 ) ) ( not ( = ?auto_34261 ?auto_34266 ) ) ( not ( = ?auto_34261 ?auto_34267 ) ) ( not ( = ?auto_34261 ?auto_34268 ) ) ( not ( = ?auto_34262 ?auto_34263 ) ) ( not ( = ?auto_34262 ?auto_34264 ) ) ( not ( = ?auto_34262 ?auto_34265 ) ) ( not ( = ?auto_34262 ?auto_34266 ) ) ( not ( = ?auto_34262 ?auto_34267 ) ) ( not ( = ?auto_34262 ?auto_34268 ) ) ( not ( = ?auto_34263 ?auto_34264 ) ) ( not ( = ?auto_34263 ?auto_34265 ) ) ( not ( = ?auto_34263 ?auto_34266 ) ) ( not ( = ?auto_34263 ?auto_34267 ) ) ( not ( = ?auto_34263 ?auto_34268 ) ) ( not ( = ?auto_34264 ?auto_34265 ) ) ( not ( = ?auto_34264 ?auto_34266 ) ) ( not ( = ?auto_34264 ?auto_34267 ) ) ( not ( = ?auto_34264 ?auto_34268 ) ) ( not ( = ?auto_34265 ?auto_34266 ) ) ( not ( = ?auto_34265 ?auto_34267 ) ) ( not ( = ?auto_34265 ?auto_34268 ) ) ( not ( = ?auto_34266 ?auto_34267 ) ) ( not ( = ?auto_34266 ?auto_34268 ) ) ( not ( = ?auto_34267 ?auto_34268 ) ) ( ON ?auto_34266 ?auto_34267 ) ( ON ?auto_34265 ?auto_34266 ) ( ON ?auto_34264 ?auto_34265 ) ( ON ?auto_34263 ?auto_34264 ) ( CLEAR ?auto_34261 ) ( ON ?auto_34262 ?auto_34263 ) ( CLEAR ?auto_34262 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_34260 ?auto_34261 ?auto_34262 )
      ( MAKE-8PILE ?auto_34260 ?auto_34261 ?auto_34262 ?auto_34263 ?auto_34264 ?auto_34265 ?auto_34266 ?auto_34267 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_34277 - BLOCK
      ?auto_34278 - BLOCK
      ?auto_34279 - BLOCK
      ?auto_34280 - BLOCK
      ?auto_34281 - BLOCK
      ?auto_34282 - BLOCK
      ?auto_34283 - BLOCK
      ?auto_34284 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_34284 ) ( ON-TABLE ?auto_34277 ) ( ON ?auto_34278 ?auto_34277 ) ( not ( = ?auto_34277 ?auto_34278 ) ) ( not ( = ?auto_34277 ?auto_34279 ) ) ( not ( = ?auto_34277 ?auto_34280 ) ) ( not ( = ?auto_34277 ?auto_34281 ) ) ( not ( = ?auto_34277 ?auto_34282 ) ) ( not ( = ?auto_34277 ?auto_34283 ) ) ( not ( = ?auto_34277 ?auto_34284 ) ) ( not ( = ?auto_34278 ?auto_34279 ) ) ( not ( = ?auto_34278 ?auto_34280 ) ) ( not ( = ?auto_34278 ?auto_34281 ) ) ( not ( = ?auto_34278 ?auto_34282 ) ) ( not ( = ?auto_34278 ?auto_34283 ) ) ( not ( = ?auto_34278 ?auto_34284 ) ) ( not ( = ?auto_34279 ?auto_34280 ) ) ( not ( = ?auto_34279 ?auto_34281 ) ) ( not ( = ?auto_34279 ?auto_34282 ) ) ( not ( = ?auto_34279 ?auto_34283 ) ) ( not ( = ?auto_34279 ?auto_34284 ) ) ( not ( = ?auto_34280 ?auto_34281 ) ) ( not ( = ?auto_34280 ?auto_34282 ) ) ( not ( = ?auto_34280 ?auto_34283 ) ) ( not ( = ?auto_34280 ?auto_34284 ) ) ( not ( = ?auto_34281 ?auto_34282 ) ) ( not ( = ?auto_34281 ?auto_34283 ) ) ( not ( = ?auto_34281 ?auto_34284 ) ) ( not ( = ?auto_34282 ?auto_34283 ) ) ( not ( = ?auto_34282 ?auto_34284 ) ) ( not ( = ?auto_34283 ?auto_34284 ) ) ( ON ?auto_34283 ?auto_34284 ) ( ON ?auto_34282 ?auto_34283 ) ( ON ?auto_34281 ?auto_34282 ) ( ON ?auto_34280 ?auto_34281 ) ( CLEAR ?auto_34278 ) ( ON ?auto_34279 ?auto_34280 ) ( CLEAR ?auto_34279 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_34277 ?auto_34278 ?auto_34279 )
      ( MAKE-8PILE ?auto_34277 ?auto_34278 ?auto_34279 ?auto_34280 ?auto_34281 ?auto_34282 ?auto_34283 ?auto_34284 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_34293 - BLOCK
      ?auto_34294 - BLOCK
      ?auto_34295 - BLOCK
      ?auto_34296 - BLOCK
      ?auto_34297 - BLOCK
      ?auto_34298 - BLOCK
      ?auto_34299 - BLOCK
      ?auto_34300 - BLOCK
    )
    :vars
    (
      ?auto_34301 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_34300 ?auto_34301 ) ( ON-TABLE ?auto_34293 ) ( not ( = ?auto_34293 ?auto_34294 ) ) ( not ( = ?auto_34293 ?auto_34295 ) ) ( not ( = ?auto_34293 ?auto_34296 ) ) ( not ( = ?auto_34293 ?auto_34297 ) ) ( not ( = ?auto_34293 ?auto_34298 ) ) ( not ( = ?auto_34293 ?auto_34299 ) ) ( not ( = ?auto_34293 ?auto_34300 ) ) ( not ( = ?auto_34293 ?auto_34301 ) ) ( not ( = ?auto_34294 ?auto_34295 ) ) ( not ( = ?auto_34294 ?auto_34296 ) ) ( not ( = ?auto_34294 ?auto_34297 ) ) ( not ( = ?auto_34294 ?auto_34298 ) ) ( not ( = ?auto_34294 ?auto_34299 ) ) ( not ( = ?auto_34294 ?auto_34300 ) ) ( not ( = ?auto_34294 ?auto_34301 ) ) ( not ( = ?auto_34295 ?auto_34296 ) ) ( not ( = ?auto_34295 ?auto_34297 ) ) ( not ( = ?auto_34295 ?auto_34298 ) ) ( not ( = ?auto_34295 ?auto_34299 ) ) ( not ( = ?auto_34295 ?auto_34300 ) ) ( not ( = ?auto_34295 ?auto_34301 ) ) ( not ( = ?auto_34296 ?auto_34297 ) ) ( not ( = ?auto_34296 ?auto_34298 ) ) ( not ( = ?auto_34296 ?auto_34299 ) ) ( not ( = ?auto_34296 ?auto_34300 ) ) ( not ( = ?auto_34296 ?auto_34301 ) ) ( not ( = ?auto_34297 ?auto_34298 ) ) ( not ( = ?auto_34297 ?auto_34299 ) ) ( not ( = ?auto_34297 ?auto_34300 ) ) ( not ( = ?auto_34297 ?auto_34301 ) ) ( not ( = ?auto_34298 ?auto_34299 ) ) ( not ( = ?auto_34298 ?auto_34300 ) ) ( not ( = ?auto_34298 ?auto_34301 ) ) ( not ( = ?auto_34299 ?auto_34300 ) ) ( not ( = ?auto_34299 ?auto_34301 ) ) ( not ( = ?auto_34300 ?auto_34301 ) ) ( ON ?auto_34299 ?auto_34300 ) ( ON ?auto_34298 ?auto_34299 ) ( ON ?auto_34297 ?auto_34298 ) ( ON ?auto_34296 ?auto_34297 ) ( ON ?auto_34295 ?auto_34296 ) ( CLEAR ?auto_34293 ) ( ON ?auto_34294 ?auto_34295 ) ( CLEAR ?auto_34294 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_34293 ?auto_34294 )
      ( MAKE-8PILE ?auto_34293 ?auto_34294 ?auto_34295 ?auto_34296 ?auto_34297 ?auto_34298 ?auto_34299 ?auto_34300 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_34310 - BLOCK
      ?auto_34311 - BLOCK
      ?auto_34312 - BLOCK
      ?auto_34313 - BLOCK
      ?auto_34314 - BLOCK
      ?auto_34315 - BLOCK
      ?auto_34316 - BLOCK
      ?auto_34317 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_34317 ) ( ON-TABLE ?auto_34310 ) ( not ( = ?auto_34310 ?auto_34311 ) ) ( not ( = ?auto_34310 ?auto_34312 ) ) ( not ( = ?auto_34310 ?auto_34313 ) ) ( not ( = ?auto_34310 ?auto_34314 ) ) ( not ( = ?auto_34310 ?auto_34315 ) ) ( not ( = ?auto_34310 ?auto_34316 ) ) ( not ( = ?auto_34310 ?auto_34317 ) ) ( not ( = ?auto_34311 ?auto_34312 ) ) ( not ( = ?auto_34311 ?auto_34313 ) ) ( not ( = ?auto_34311 ?auto_34314 ) ) ( not ( = ?auto_34311 ?auto_34315 ) ) ( not ( = ?auto_34311 ?auto_34316 ) ) ( not ( = ?auto_34311 ?auto_34317 ) ) ( not ( = ?auto_34312 ?auto_34313 ) ) ( not ( = ?auto_34312 ?auto_34314 ) ) ( not ( = ?auto_34312 ?auto_34315 ) ) ( not ( = ?auto_34312 ?auto_34316 ) ) ( not ( = ?auto_34312 ?auto_34317 ) ) ( not ( = ?auto_34313 ?auto_34314 ) ) ( not ( = ?auto_34313 ?auto_34315 ) ) ( not ( = ?auto_34313 ?auto_34316 ) ) ( not ( = ?auto_34313 ?auto_34317 ) ) ( not ( = ?auto_34314 ?auto_34315 ) ) ( not ( = ?auto_34314 ?auto_34316 ) ) ( not ( = ?auto_34314 ?auto_34317 ) ) ( not ( = ?auto_34315 ?auto_34316 ) ) ( not ( = ?auto_34315 ?auto_34317 ) ) ( not ( = ?auto_34316 ?auto_34317 ) ) ( ON ?auto_34316 ?auto_34317 ) ( ON ?auto_34315 ?auto_34316 ) ( ON ?auto_34314 ?auto_34315 ) ( ON ?auto_34313 ?auto_34314 ) ( ON ?auto_34312 ?auto_34313 ) ( CLEAR ?auto_34310 ) ( ON ?auto_34311 ?auto_34312 ) ( CLEAR ?auto_34311 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_34310 ?auto_34311 )
      ( MAKE-8PILE ?auto_34310 ?auto_34311 ?auto_34312 ?auto_34313 ?auto_34314 ?auto_34315 ?auto_34316 ?auto_34317 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_34326 - BLOCK
      ?auto_34327 - BLOCK
      ?auto_34328 - BLOCK
      ?auto_34329 - BLOCK
      ?auto_34330 - BLOCK
      ?auto_34331 - BLOCK
      ?auto_34332 - BLOCK
      ?auto_34333 - BLOCK
    )
    :vars
    (
      ?auto_34334 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_34333 ?auto_34334 ) ( not ( = ?auto_34326 ?auto_34327 ) ) ( not ( = ?auto_34326 ?auto_34328 ) ) ( not ( = ?auto_34326 ?auto_34329 ) ) ( not ( = ?auto_34326 ?auto_34330 ) ) ( not ( = ?auto_34326 ?auto_34331 ) ) ( not ( = ?auto_34326 ?auto_34332 ) ) ( not ( = ?auto_34326 ?auto_34333 ) ) ( not ( = ?auto_34326 ?auto_34334 ) ) ( not ( = ?auto_34327 ?auto_34328 ) ) ( not ( = ?auto_34327 ?auto_34329 ) ) ( not ( = ?auto_34327 ?auto_34330 ) ) ( not ( = ?auto_34327 ?auto_34331 ) ) ( not ( = ?auto_34327 ?auto_34332 ) ) ( not ( = ?auto_34327 ?auto_34333 ) ) ( not ( = ?auto_34327 ?auto_34334 ) ) ( not ( = ?auto_34328 ?auto_34329 ) ) ( not ( = ?auto_34328 ?auto_34330 ) ) ( not ( = ?auto_34328 ?auto_34331 ) ) ( not ( = ?auto_34328 ?auto_34332 ) ) ( not ( = ?auto_34328 ?auto_34333 ) ) ( not ( = ?auto_34328 ?auto_34334 ) ) ( not ( = ?auto_34329 ?auto_34330 ) ) ( not ( = ?auto_34329 ?auto_34331 ) ) ( not ( = ?auto_34329 ?auto_34332 ) ) ( not ( = ?auto_34329 ?auto_34333 ) ) ( not ( = ?auto_34329 ?auto_34334 ) ) ( not ( = ?auto_34330 ?auto_34331 ) ) ( not ( = ?auto_34330 ?auto_34332 ) ) ( not ( = ?auto_34330 ?auto_34333 ) ) ( not ( = ?auto_34330 ?auto_34334 ) ) ( not ( = ?auto_34331 ?auto_34332 ) ) ( not ( = ?auto_34331 ?auto_34333 ) ) ( not ( = ?auto_34331 ?auto_34334 ) ) ( not ( = ?auto_34332 ?auto_34333 ) ) ( not ( = ?auto_34332 ?auto_34334 ) ) ( not ( = ?auto_34333 ?auto_34334 ) ) ( ON ?auto_34332 ?auto_34333 ) ( ON ?auto_34331 ?auto_34332 ) ( ON ?auto_34330 ?auto_34331 ) ( ON ?auto_34329 ?auto_34330 ) ( ON ?auto_34328 ?auto_34329 ) ( ON ?auto_34327 ?auto_34328 ) ( ON ?auto_34326 ?auto_34327 ) ( CLEAR ?auto_34326 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_34326 )
      ( MAKE-8PILE ?auto_34326 ?auto_34327 ?auto_34328 ?auto_34329 ?auto_34330 ?auto_34331 ?auto_34332 ?auto_34333 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_34343 - BLOCK
      ?auto_34344 - BLOCK
      ?auto_34345 - BLOCK
      ?auto_34346 - BLOCK
      ?auto_34347 - BLOCK
      ?auto_34348 - BLOCK
      ?auto_34349 - BLOCK
      ?auto_34350 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_34350 ) ( not ( = ?auto_34343 ?auto_34344 ) ) ( not ( = ?auto_34343 ?auto_34345 ) ) ( not ( = ?auto_34343 ?auto_34346 ) ) ( not ( = ?auto_34343 ?auto_34347 ) ) ( not ( = ?auto_34343 ?auto_34348 ) ) ( not ( = ?auto_34343 ?auto_34349 ) ) ( not ( = ?auto_34343 ?auto_34350 ) ) ( not ( = ?auto_34344 ?auto_34345 ) ) ( not ( = ?auto_34344 ?auto_34346 ) ) ( not ( = ?auto_34344 ?auto_34347 ) ) ( not ( = ?auto_34344 ?auto_34348 ) ) ( not ( = ?auto_34344 ?auto_34349 ) ) ( not ( = ?auto_34344 ?auto_34350 ) ) ( not ( = ?auto_34345 ?auto_34346 ) ) ( not ( = ?auto_34345 ?auto_34347 ) ) ( not ( = ?auto_34345 ?auto_34348 ) ) ( not ( = ?auto_34345 ?auto_34349 ) ) ( not ( = ?auto_34345 ?auto_34350 ) ) ( not ( = ?auto_34346 ?auto_34347 ) ) ( not ( = ?auto_34346 ?auto_34348 ) ) ( not ( = ?auto_34346 ?auto_34349 ) ) ( not ( = ?auto_34346 ?auto_34350 ) ) ( not ( = ?auto_34347 ?auto_34348 ) ) ( not ( = ?auto_34347 ?auto_34349 ) ) ( not ( = ?auto_34347 ?auto_34350 ) ) ( not ( = ?auto_34348 ?auto_34349 ) ) ( not ( = ?auto_34348 ?auto_34350 ) ) ( not ( = ?auto_34349 ?auto_34350 ) ) ( ON ?auto_34349 ?auto_34350 ) ( ON ?auto_34348 ?auto_34349 ) ( ON ?auto_34347 ?auto_34348 ) ( ON ?auto_34346 ?auto_34347 ) ( ON ?auto_34345 ?auto_34346 ) ( ON ?auto_34344 ?auto_34345 ) ( ON ?auto_34343 ?auto_34344 ) ( CLEAR ?auto_34343 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_34343 )
      ( MAKE-8PILE ?auto_34343 ?auto_34344 ?auto_34345 ?auto_34346 ?auto_34347 ?auto_34348 ?auto_34349 ?auto_34350 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_34359 - BLOCK
      ?auto_34360 - BLOCK
      ?auto_34361 - BLOCK
      ?auto_34362 - BLOCK
      ?auto_34363 - BLOCK
      ?auto_34364 - BLOCK
      ?auto_34365 - BLOCK
      ?auto_34366 - BLOCK
    )
    :vars
    (
      ?auto_34367 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_34359 ?auto_34360 ) ) ( not ( = ?auto_34359 ?auto_34361 ) ) ( not ( = ?auto_34359 ?auto_34362 ) ) ( not ( = ?auto_34359 ?auto_34363 ) ) ( not ( = ?auto_34359 ?auto_34364 ) ) ( not ( = ?auto_34359 ?auto_34365 ) ) ( not ( = ?auto_34359 ?auto_34366 ) ) ( not ( = ?auto_34360 ?auto_34361 ) ) ( not ( = ?auto_34360 ?auto_34362 ) ) ( not ( = ?auto_34360 ?auto_34363 ) ) ( not ( = ?auto_34360 ?auto_34364 ) ) ( not ( = ?auto_34360 ?auto_34365 ) ) ( not ( = ?auto_34360 ?auto_34366 ) ) ( not ( = ?auto_34361 ?auto_34362 ) ) ( not ( = ?auto_34361 ?auto_34363 ) ) ( not ( = ?auto_34361 ?auto_34364 ) ) ( not ( = ?auto_34361 ?auto_34365 ) ) ( not ( = ?auto_34361 ?auto_34366 ) ) ( not ( = ?auto_34362 ?auto_34363 ) ) ( not ( = ?auto_34362 ?auto_34364 ) ) ( not ( = ?auto_34362 ?auto_34365 ) ) ( not ( = ?auto_34362 ?auto_34366 ) ) ( not ( = ?auto_34363 ?auto_34364 ) ) ( not ( = ?auto_34363 ?auto_34365 ) ) ( not ( = ?auto_34363 ?auto_34366 ) ) ( not ( = ?auto_34364 ?auto_34365 ) ) ( not ( = ?auto_34364 ?auto_34366 ) ) ( not ( = ?auto_34365 ?auto_34366 ) ) ( ON ?auto_34359 ?auto_34367 ) ( not ( = ?auto_34366 ?auto_34367 ) ) ( not ( = ?auto_34365 ?auto_34367 ) ) ( not ( = ?auto_34364 ?auto_34367 ) ) ( not ( = ?auto_34363 ?auto_34367 ) ) ( not ( = ?auto_34362 ?auto_34367 ) ) ( not ( = ?auto_34361 ?auto_34367 ) ) ( not ( = ?auto_34360 ?auto_34367 ) ) ( not ( = ?auto_34359 ?auto_34367 ) ) ( ON ?auto_34360 ?auto_34359 ) ( ON ?auto_34361 ?auto_34360 ) ( ON ?auto_34362 ?auto_34361 ) ( ON ?auto_34363 ?auto_34362 ) ( ON ?auto_34364 ?auto_34363 ) ( ON ?auto_34365 ?auto_34364 ) ( ON ?auto_34366 ?auto_34365 ) ( CLEAR ?auto_34366 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_34366 ?auto_34365 ?auto_34364 ?auto_34363 ?auto_34362 ?auto_34361 ?auto_34360 ?auto_34359 )
      ( MAKE-8PILE ?auto_34359 ?auto_34360 ?auto_34361 ?auto_34362 ?auto_34363 ?auto_34364 ?auto_34365 ?auto_34366 ) )
  )

)

