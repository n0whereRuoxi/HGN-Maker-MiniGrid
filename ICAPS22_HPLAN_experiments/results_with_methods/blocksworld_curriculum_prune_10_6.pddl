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
      ?auto_83487 - BLOCK
    )
    :vars
    (
      ?auto_83488 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_83487 ?auto_83488 ) ( CLEAR ?auto_83487 ) ( HAND-EMPTY ) ( not ( = ?auto_83487 ?auto_83488 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_83487 ?auto_83488 )
      ( !PUTDOWN ?auto_83487 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_83494 - BLOCK
      ?auto_83495 - BLOCK
    )
    :vars
    (
      ?auto_83496 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_83494 ) ( ON ?auto_83495 ?auto_83496 ) ( CLEAR ?auto_83495 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_83494 ) ( not ( = ?auto_83494 ?auto_83495 ) ) ( not ( = ?auto_83494 ?auto_83496 ) ) ( not ( = ?auto_83495 ?auto_83496 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_83495 ?auto_83496 )
      ( !STACK ?auto_83495 ?auto_83494 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_83504 - BLOCK
      ?auto_83505 - BLOCK
    )
    :vars
    (
      ?auto_83506 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_83505 ?auto_83506 ) ( not ( = ?auto_83504 ?auto_83505 ) ) ( not ( = ?auto_83504 ?auto_83506 ) ) ( not ( = ?auto_83505 ?auto_83506 ) ) ( ON ?auto_83504 ?auto_83505 ) ( CLEAR ?auto_83504 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_83504 )
      ( MAKE-2PILE ?auto_83504 ?auto_83505 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_83515 - BLOCK
      ?auto_83516 - BLOCK
      ?auto_83517 - BLOCK
    )
    :vars
    (
      ?auto_83518 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_83516 ) ( ON ?auto_83517 ?auto_83518 ) ( CLEAR ?auto_83517 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_83515 ) ( ON ?auto_83516 ?auto_83515 ) ( not ( = ?auto_83515 ?auto_83516 ) ) ( not ( = ?auto_83515 ?auto_83517 ) ) ( not ( = ?auto_83515 ?auto_83518 ) ) ( not ( = ?auto_83516 ?auto_83517 ) ) ( not ( = ?auto_83516 ?auto_83518 ) ) ( not ( = ?auto_83517 ?auto_83518 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_83517 ?auto_83518 )
      ( !STACK ?auto_83517 ?auto_83516 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_83529 - BLOCK
      ?auto_83530 - BLOCK
      ?auto_83531 - BLOCK
    )
    :vars
    (
      ?auto_83532 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_83531 ?auto_83532 ) ( ON-TABLE ?auto_83529 ) ( not ( = ?auto_83529 ?auto_83530 ) ) ( not ( = ?auto_83529 ?auto_83531 ) ) ( not ( = ?auto_83529 ?auto_83532 ) ) ( not ( = ?auto_83530 ?auto_83531 ) ) ( not ( = ?auto_83530 ?auto_83532 ) ) ( not ( = ?auto_83531 ?auto_83532 ) ) ( CLEAR ?auto_83529 ) ( ON ?auto_83530 ?auto_83531 ) ( CLEAR ?auto_83530 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_83529 ?auto_83530 )
      ( MAKE-3PILE ?auto_83529 ?auto_83530 ?auto_83531 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_83543 - BLOCK
      ?auto_83544 - BLOCK
      ?auto_83545 - BLOCK
    )
    :vars
    (
      ?auto_83546 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_83545 ?auto_83546 ) ( not ( = ?auto_83543 ?auto_83544 ) ) ( not ( = ?auto_83543 ?auto_83545 ) ) ( not ( = ?auto_83543 ?auto_83546 ) ) ( not ( = ?auto_83544 ?auto_83545 ) ) ( not ( = ?auto_83544 ?auto_83546 ) ) ( not ( = ?auto_83545 ?auto_83546 ) ) ( ON ?auto_83544 ?auto_83545 ) ( ON ?auto_83543 ?auto_83544 ) ( CLEAR ?auto_83543 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_83543 )
      ( MAKE-3PILE ?auto_83543 ?auto_83544 ?auto_83545 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_83558 - BLOCK
      ?auto_83559 - BLOCK
      ?auto_83560 - BLOCK
      ?auto_83561 - BLOCK
    )
    :vars
    (
      ?auto_83562 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_83560 ) ( ON ?auto_83561 ?auto_83562 ) ( CLEAR ?auto_83561 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_83558 ) ( ON ?auto_83559 ?auto_83558 ) ( ON ?auto_83560 ?auto_83559 ) ( not ( = ?auto_83558 ?auto_83559 ) ) ( not ( = ?auto_83558 ?auto_83560 ) ) ( not ( = ?auto_83558 ?auto_83561 ) ) ( not ( = ?auto_83558 ?auto_83562 ) ) ( not ( = ?auto_83559 ?auto_83560 ) ) ( not ( = ?auto_83559 ?auto_83561 ) ) ( not ( = ?auto_83559 ?auto_83562 ) ) ( not ( = ?auto_83560 ?auto_83561 ) ) ( not ( = ?auto_83560 ?auto_83562 ) ) ( not ( = ?auto_83561 ?auto_83562 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_83561 ?auto_83562 )
      ( !STACK ?auto_83561 ?auto_83560 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_83576 - BLOCK
      ?auto_83577 - BLOCK
      ?auto_83578 - BLOCK
      ?auto_83579 - BLOCK
    )
    :vars
    (
      ?auto_83580 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_83579 ?auto_83580 ) ( ON-TABLE ?auto_83576 ) ( ON ?auto_83577 ?auto_83576 ) ( not ( = ?auto_83576 ?auto_83577 ) ) ( not ( = ?auto_83576 ?auto_83578 ) ) ( not ( = ?auto_83576 ?auto_83579 ) ) ( not ( = ?auto_83576 ?auto_83580 ) ) ( not ( = ?auto_83577 ?auto_83578 ) ) ( not ( = ?auto_83577 ?auto_83579 ) ) ( not ( = ?auto_83577 ?auto_83580 ) ) ( not ( = ?auto_83578 ?auto_83579 ) ) ( not ( = ?auto_83578 ?auto_83580 ) ) ( not ( = ?auto_83579 ?auto_83580 ) ) ( CLEAR ?auto_83577 ) ( ON ?auto_83578 ?auto_83579 ) ( CLEAR ?auto_83578 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_83576 ?auto_83577 ?auto_83578 )
      ( MAKE-4PILE ?auto_83576 ?auto_83577 ?auto_83578 ?auto_83579 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_83594 - BLOCK
      ?auto_83595 - BLOCK
      ?auto_83596 - BLOCK
      ?auto_83597 - BLOCK
    )
    :vars
    (
      ?auto_83598 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_83597 ?auto_83598 ) ( ON-TABLE ?auto_83594 ) ( not ( = ?auto_83594 ?auto_83595 ) ) ( not ( = ?auto_83594 ?auto_83596 ) ) ( not ( = ?auto_83594 ?auto_83597 ) ) ( not ( = ?auto_83594 ?auto_83598 ) ) ( not ( = ?auto_83595 ?auto_83596 ) ) ( not ( = ?auto_83595 ?auto_83597 ) ) ( not ( = ?auto_83595 ?auto_83598 ) ) ( not ( = ?auto_83596 ?auto_83597 ) ) ( not ( = ?auto_83596 ?auto_83598 ) ) ( not ( = ?auto_83597 ?auto_83598 ) ) ( ON ?auto_83596 ?auto_83597 ) ( CLEAR ?auto_83594 ) ( ON ?auto_83595 ?auto_83596 ) ( CLEAR ?auto_83595 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_83594 ?auto_83595 )
      ( MAKE-4PILE ?auto_83594 ?auto_83595 ?auto_83596 ?auto_83597 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_83612 - BLOCK
      ?auto_83613 - BLOCK
      ?auto_83614 - BLOCK
      ?auto_83615 - BLOCK
    )
    :vars
    (
      ?auto_83616 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_83615 ?auto_83616 ) ( not ( = ?auto_83612 ?auto_83613 ) ) ( not ( = ?auto_83612 ?auto_83614 ) ) ( not ( = ?auto_83612 ?auto_83615 ) ) ( not ( = ?auto_83612 ?auto_83616 ) ) ( not ( = ?auto_83613 ?auto_83614 ) ) ( not ( = ?auto_83613 ?auto_83615 ) ) ( not ( = ?auto_83613 ?auto_83616 ) ) ( not ( = ?auto_83614 ?auto_83615 ) ) ( not ( = ?auto_83614 ?auto_83616 ) ) ( not ( = ?auto_83615 ?auto_83616 ) ) ( ON ?auto_83614 ?auto_83615 ) ( ON ?auto_83613 ?auto_83614 ) ( ON ?auto_83612 ?auto_83613 ) ( CLEAR ?auto_83612 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_83612 )
      ( MAKE-4PILE ?auto_83612 ?auto_83613 ?auto_83614 ?auto_83615 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_83631 - BLOCK
      ?auto_83632 - BLOCK
      ?auto_83633 - BLOCK
      ?auto_83634 - BLOCK
      ?auto_83635 - BLOCK
    )
    :vars
    (
      ?auto_83636 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_83634 ) ( ON ?auto_83635 ?auto_83636 ) ( CLEAR ?auto_83635 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_83631 ) ( ON ?auto_83632 ?auto_83631 ) ( ON ?auto_83633 ?auto_83632 ) ( ON ?auto_83634 ?auto_83633 ) ( not ( = ?auto_83631 ?auto_83632 ) ) ( not ( = ?auto_83631 ?auto_83633 ) ) ( not ( = ?auto_83631 ?auto_83634 ) ) ( not ( = ?auto_83631 ?auto_83635 ) ) ( not ( = ?auto_83631 ?auto_83636 ) ) ( not ( = ?auto_83632 ?auto_83633 ) ) ( not ( = ?auto_83632 ?auto_83634 ) ) ( not ( = ?auto_83632 ?auto_83635 ) ) ( not ( = ?auto_83632 ?auto_83636 ) ) ( not ( = ?auto_83633 ?auto_83634 ) ) ( not ( = ?auto_83633 ?auto_83635 ) ) ( not ( = ?auto_83633 ?auto_83636 ) ) ( not ( = ?auto_83634 ?auto_83635 ) ) ( not ( = ?auto_83634 ?auto_83636 ) ) ( not ( = ?auto_83635 ?auto_83636 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_83635 ?auto_83636 )
      ( !STACK ?auto_83635 ?auto_83634 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_83653 - BLOCK
      ?auto_83654 - BLOCK
      ?auto_83655 - BLOCK
      ?auto_83656 - BLOCK
      ?auto_83657 - BLOCK
    )
    :vars
    (
      ?auto_83658 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_83657 ?auto_83658 ) ( ON-TABLE ?auto_83653 ) ( ON ?auto_83654 ?auto_83653 ) ( ON ?auto_83655 ?auto_83654 ) ( not ( = ?auto_83653 ?auto_83654 ) ) ( not ( = ?auto_83653 ?auto_83655 ) ) ( not ( = ?auto_83653 ?auto_83656 ) ) ( not ( = ?auto_83653 ?auto_83657 ) ) ( not ( = ?auto_83653 ?auto_83658 ) ) ( not ( = ?auto_83654 ?auto_83655 ) ) ( not ( = ?auto_83654 ?auto_83656 ) ) ( not ( = ?auto_83654 ?auto_83657 ) ) ( not ( = ?auto_83654 ?auto_83658 ) ) ( not ( = ?auto_83655 ?auto_83656 ) ) ( not ( = ?auto_83655 ?auto_83657 ) ) ( not ( = ?auto_83655 ?auto_83658 ) ) ( not ( = ?auto_83656 ?auto_83657 ) ) ( not ( = ?auto_83656 ?auto_83658 ) ) ( not ( = ?auto_83657 ?auto_83658 ) ) ( CLEAR ?auto_83655 ) ( ON ?auto_83656 ?auto_83657 ) ( CLEAR ?auto_83656 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_83653 ?auto_83654 ?auto_83655 ?auto_83656 )
      ( MAKE-5PILE ?auto_83653 ?auto_83654 ?auto_83655 ?auto_83656 ?auto_83657 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_83675 - BLOCK
      ?auto_83676 - BLOCK
      ?auto_83677 - BLOCK
      ?auto_83678 - BLOCK
      ?auto_83679 - BLOCK
    )
    :vars
    (
      ?auto_83680 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_83679 ?auto_83680 ) ( ON-TABLE ?auto_83675 ) ( ON ?auto_83676 ?auto_83675 ) ( not ( = ?auto_83675 ?auto_83676 ) ) ( not ( = ?auto_83675 ?auto_83677 ) ) ( not ( = ?auto_83675 ?auto_83678 ) ) ( not ( = ?auto_83675 ?auto_83679 ) ) ( not ( = ?auto_83675 ?auto_83680 ) ) ( not ( = ?auto_83676 ?auto_83677 ) ) ( not ( = ?auto_83676 ?auto_83678 ) ) ( not ( = ?auto_83676 ?auto_83679 ) ) ( not ( = ?auto_83676 ?auto_83680 ) ) ( not ( = ?auto_83677 ?auto_83678 ) ) ( not ( = ?auto_83677 ?auto_83679 ) ) ( not ( = ?auto_83677 ?auto_83680 ) ) ( not ( = ?auto_83678 ?auto_83679 ) ) ( not ( = ?auto_83678 ?auto_83680 ) ) ( not ( = ?auto_83679 ?auto_83680 ) ) ( ON ?auto_83678 ?auto_83679 ) ( CLEAR ?auto_83676 ) ( ON ?auto_83677 ?auto_83678 ) ( CLEAR ?auto_83677 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_83675 ?auto_83676 ?auto_83677 )
      ( MAKE-5PILE ?auto_83675 ?auto_83676 ?auto_83677 ?auto_83678 ?auto_83679 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_83697 - BLOCK
      ?auto_83698 - BLOCK
      ?auto_83699 - BLOCK
      ?auto_83700 - BLOCK
      ?auto_83701 - BLOCK
    )
    :vars
    (
      ?auto_83702 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_83701 ?auto_83702 ) ( ON-TABLE ?auto_83697 ) ( not ( = ?auto_83697 ?auto_83698 ) ) ( not ( = ?auto_83697 ?auto_83699 ) ) ( not ( = ?auto_83697 ?auto_83700 ) ) ( not ( = ?auto_83697 ?auto_83701 ) ) ( not ( = ?auto_83697 ?auto_83702 ) ) ( not ( = ?auto_83698 ?auto_83699 ) ) ( not ( = ?auto_83698 ?auto_83700 ) ) ( not ( = ?auto_83698 ?auto_83701 ) ) ( not ( = ?auto_83698 ?auto_83702 ) ) ( not ( = ?auto_83699 ?auto_83700 ) ) ( not ( = ?auto_83699 ?auto_83701 ) ) ( not ( = ?auto_83699 ?auto_83702 ) ) ( not ( = ?auto_83700 ?auto_83701 ) ) ( not ( = ?auto_83700 ?auto_83702 ) ) ( not ( = ?auto_83701 ?auto_83702 ) ) ( ON ?auto_83700 ?auto_83701 ) ( ON ?auto_83699 ?auto_83700 ) ( CLEAR ?auto_83697 ) ( ON ?auto_83698 ?auto_83699 ) ( CLEAR ?auto_83698 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_83697 ?auto_83698 )
      ( MAKE-5PILE ?auto_83697 ?auto_83698 ?auto_83699 ?auto_83700 ?auto_83701 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_83719 - BLOCK
      ?auto_83720 - BLOCK
      ?auto_83721 - BLOCK
      ?auto_83722 - BLOCK
      ?auto_83723 - BLOCK
    )
    :vars
    (
      ?auto_83724 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_83723 ?auto_83724 ) ( not ( = ?auto_83719 ?auto_83720 ) ) ( not ( = ?auto_83719 ?auto_83721 ) ) ( not ( = ?auto_83719 ?auto_83722 ) ) ( not ( = ?auto_83719 ?auto_83723 ) ) ( not ( = ?auto_83719 ?auto_83724 ) ) ( not ( = ?auto_83720 ?auto_83721 ) ) ( not ( = ?auto_83720 ?auto_83722 ) ) ( not ( = ?auto_83720 ?auto_83723 ) ) ( not ( = ?auto_83720 ?auto_83724 ) ) ( not ( = ?auto_83721 ?auto_83722 ) ) ( not ( = ?auto_83721 ?auto_83723 ) ) ( not ( = ?auto_83721 ?auto_83724 ) ) ( not ( = ?auto_83722 ?auto_83723 ) ) ( not ( = ?auto_83722 ?auto_83724 ) ) ( not ( = ?auto_83723 ?auto_83724 ) ) ( ON ?auto_83722 ?auto_83723 ) ( ON ?auto_83721 ?auto_83722 ) ( ON ?auto_83720 ?auto_83721 ) ( ON ?auto_83719 ?auto_83720 ) ( CLEAR ?auto_83719 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_83719 )
      ( MAKE-5PILE ?auto_83719 ?auto_83720 ?auto_83721 ?auto_83722 ?auto_83723 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_83742 - BLOCK
      ?auto_83743 - BLOCK
      ?auto_83744 - BLOCK
      ?auto_83745 - BLOCK
      ?auto_83746 - BLOCK
      ?auto_83747 - BLOCK
    )
    :vars
    (
      ?auto_83748 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_83746 ) ( ON ?auto_83747 ?auto_83748 ) ( CLEAR ?auto_83747 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_83742 ) ( ON ?auto_83743 ?auto_83742 ) ( ON ?auto_83744 ?auto_83743 ) ( ON ?auto_83745 ?auto_83744 ) ( ON ?auto_83746 ?auto_83745 ) ( not ( = ?auto_83742 ?auto_83743 ) ) ( not ( = ?auto_83742 ?auto_83744 ) ) ( not ( = ?auto_83742 ?auto_83745 ) ) ( not ( = ?auto_83742 ?auto_83746 ) ) ( not ( = ?auto_83742 ?auto_83747 ) ) ( not ( = ?auto_83742 ?auto_83748 ) ) ( not ( = ?auto_83743 ?auto_83744 ) ) ( not ( = ?auto_83743 ?auto_83745 ) ) ( not ( = ?auto_83743 ?auto_83746 ) ) ( not ( = ?auto_83743 ?auto_83747 ) ) ( not ( = ?auto_83743 ?auto_83748 ) ) ( not ( = ?auto_83744 ?auto_83745 ) ) ( not ( = ?auto_83744 ?auto_83746 ) ) ( not ( = ?auto_83744 ?auto_83747 ) ) ( not ( = ?auto_83744 ?auto_83748 ) ) ( not ( = ?auto_83745 ?auto_83746 ) ) ( not ( = ?auto_83745 ?auto_83747 ) ) ( not ( = ?auto_83745 ?auto_83748 ) ) ( not ( = ?auto_83746 ?auto_83747 ) ) ( not ( = ?auto_83746 ?auto_83748 ) ) ( not ( = ?auto_83747 ?auto_83748 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_83747 ?auto_83748 )
      ( !STACK ?auto_83747 ?auto_83746 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_83768 - BLOCK
      ?auto_83769 - BLOCK
      ?auto_83770 - BLOCK
      ?auto_83771 - BLOCK
      ?auto_83772 - BLOCK
      ?auto_83773 - BLOCK
    )
    :vars
    (
      ?auto_83774 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_83773 ?auto_83774 ) ( ON-TABLE ?auto_83768 ) ( ON ?auto_83769 ?auto_83768 ) ( ON ?auto_83770 ?auto_83769 ) ( ON ?auto_83771 ?auto_83770 ) ( not ( = ?auto_83768 ?auto_83769 ) ) ( not ( = ?auto_83768 ?auto_83770 ) ) ( not ( = ?auto_83768 ?auto_83771 ) ) ( not ( = ?auto_83768 ?auto_83772 ) ) ( not ( = ?auto_83768 ?auto_83773 ) ) ( not ( = ?auto_83768 ?auto_83774 ) ) ( not ( = ?auto_83769 ?auto_83770 ) ) ( not ( = ?auto_83769 ?auto_83771 ) ) ( not ( = ?auto_83769 ?auto_83772 ) ) ( not ( = ?auto_83769 ?auto_83773 ) ) ( not ( = ?auto_83769 ?auto_83774 ) ) ( not ( = ?auto_83770 ?auto_83771 ) ) ( not ( = ?auto_83770 ?auto_83772 ) ) ( not ( = ?auto_83770 ?auto_83773 ) ) ( not ( = ?auto_83770 ?auto_83774 ) ) ( not ( = ?auto_83771 ?auto_83772 ) ) ( not ( = ?auto_83771 ?auto_83773 ) ) ( not ( = ?auto_83771 ?auto_83774 ) ) ( not ( = ?auto_83772 ?auto_83773 ) ) ( not ( = ?auto_83772 ?auto_83774 ) ) ( not ( = ?auto_83773 ?auto_83774 ) ) ( CLEAR ?auto_83771 ) ( ON ?auto_83772 ?auto_83773 ) ( CLEAR ?auto_83772 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_83768 ?auto_83769 ?auto_83770 ?auto_83771 ?auto_83772 )
      ( MAKE-6PILE ?auto_83768 ?auto_83769 ?auto_83770 ?auto_83771 ?auto_83772 ?auto_83773 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_83794 - BLOCK
      ?auto_83795 - BLOCK
      ?auto_83796 - BLOCK
      ?auto_83797 - BLOCK
      ?auto_83798 - BLOCK
      ?auto_83799 - BLOCK
    )
    :vars
    (
      ?auto_83800 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_83799 ?auto_83800 ) ( ON-TABLE ?auto_83794 ) ( ON ?auto_83795 ?auto_83794 ) ( ON ?auto_83796 ?auto_83795 ) ( not ( = ?auto_83794 ?auto_83795 ) ) ( not ( = ?auto_83794 ?auto_83796 ) ) ( not ( = ?auto_83794 ?auto_83797 ) ) ( not ( = ?auto_83794 ?auto_83798 ) ) ( not ( = ?auto_83794 ?auto_83799 ) ) ( not ( = ?auto_83794 ?auto_83800 ) ) ( not ( = ?auto_83795 ?auto_83796 ) ) ( not ( = ?auto_83795 ?auto_83797 ) ) ( not ( = ?auto_83795 ?auto_83798 ) ) ( not ( = ?auto_83795 ?auto_83799 ) ) ( not ( = ?auto_83795 ?auto_83800 ) ) ( not ( = ?auto_83796 ?auto_83797 ) ) ( not ( = ?auto_83796 ?auto_83798 ) ) ( not ( = ?auto_83796 ?auto_83799 ) ) ( not ( = ?auto_83796 ?auto_83800 ) ) ( not ( = ?auto_83797 ?auto_83798 ) ) ( not ( = ?auto_83797 ?auto_83799 ) ) ( not ( = ?auto_83797 ?auto_83800 ) ) ( not ( = ?auto_83798 ?auto_83799 ) ) ( not ( = ?auto_83798 ?auto_83800 ) ) ( not ( = ?auto_83799 ?auto_83800 ) ) ( ON ?auto_83798 ?auto_83799 ) ( CLEAR ?auto_83796 ) ( ON ?auto_83797 ?auto_83798 ) ( CLEAR ?auto_83797 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_83794 ?auto_83795 ?auto_83796 ?auto_83797 )
      ( MAKE-6PILE ?auto_83794 ?auto_83795 ?auto_83796 ?auto_83797 ?auto_83798 ?auto_83799 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_83820 - BLOCK
      ?auto_83821 - BLOCK
      ?auto_83822 - BLOCK
      ?auto_83823 - BLOCK
      ?auto_83824 - BLOCK
      ?auto_83825 - BLOCK
    )
    :vars
    (
      ?auto_83826 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_83825 ?auto_83826 ) ( ON-TABLE ?auto_83820 ) ( ON ?auto_83821 ?auto_83820 ) ( not ( = ?auto_83820 ?auto_83821 ) ) ( not ( = ?auto_83820 ?auto_83822 ) ) ( not ( = ?auto_83820 ?auto_83823 ) ) ( not ( = ?auto_83820 ?auto_83824 ) ) ( not ( = ?auto_83820 ?auto_83825 ) ) ( not ( = ?auto_83820 ?auto_83826 ) ) ( not ( = ?auto_83821 ?auto_83822 ) ) ( not ( = ?auto_83821 ?auto_83823 ) ) ( not ( = ?auto_83821 ?auto_83824 ) ) ( not ( = ?auto_83821 ?auto_83825 ) ) ( not ( = ?auto_83821 ?auto_83826 ) ) ( not ( = ?auto_83822 ?auto_83823 ) ) ( not ( = ?auto_83822 ?auto_83824 ) ) ( not ( = ?auto_83822 ?auto_83825 ) ) ( not ( = ?auto_83822 ?auto_83826 ) ) ( not ( = ?auto_83823 ?auto_83824 ) ) ( not ( = ?auto_83823 ?auto_83825 ) ) ( not ( = ?auto_83823 ?auto_83826 ) ) ( not ( = ?auto_83824 ?auto_83825 ) ) ( not ( = ?auto_83824 ?auto_83826 ) ) ( not ( = ?auto_83825 ?auto_83826 ) ) ( ON ?auto_83824 ?auto_83825 ) ( ON ?auto_83823 ?auto_83824 ) ( CLEAR ?auto_83821 ) ( ON ?auto_83822 ?auto_83823 ) ( CLEAR ?auto_83822 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_83820 ?auto_83821 ?auto_83822 )
      ( MAKE-6PILE ?auto_83820 ?auto_83821 ?auto_83822 ?auto_83823 ?auto_83824 ?auto_83825 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_83846 - BLOCK
      ?auto_83847 - BLOCK
      ?auto_83848 - BLOCK
      ?auto_83849 - BLOCK
      ?auto_83850 - BLOCK
      ?auto_83851 - BLOCK
    )
    :vars
    (
      ?auto_83852 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_83851 ?auto_83852 ) ( ON-TABLE ?auto_83846 ) ( not ( = ?auto_83846 ?auto_83847 ) ) ( not ( = ?auto_83846 ?auto_83848 ) ) ( not ( = ?auto_83846 ?auto_83849 ) ) ( not ( = ?auto_83846 ?auto_83850 ) ) ( not ( = ?auto_83846 ?auto_83851 ) ) ( not ( = ?auto_83846 ?auto_83852 ) ) ( not ( = ?auto_83847 ?auto_83848 ) ) ( not ( = ?auto_83847 ?auto_83849 ) ) ( not ( = ?auto_83847 ?auto_83850 ) ) ( not ( = ?auto_83847 ?auto_83851 ) ) ( not ( = ?auto_83847 ?auto_83852 ) ) ( not ( = ?auto_83848 ?auto_83849 ) ) ( not ( = ?auto_83848 ?auto_83850 ) ) ( not ( = ?auto_83848 ?auto_83851 ) ) ( not ( = ?auto_83848 ?auto_83852 ) ) ( not ( = ?auto_83849 ?auto_83850 ) ) ( not ( = ?auto_83849 ?auto_83851 ) ) ( not ( = ?auto_83849 ?auto_83852 ) ) ( not ( = ?auto_83850 ?auto_83851 ) ) ( not ( = ?auto_83850 ?auto_83852 ) ) ( not ( = ?auto_83851 ?auto_83852 ) ) ( ON ?auto_83850 ?auto_83851 ) ( ON ?auto_83849 ?auto_83850 ) ( ON ?auto_83848 ?auto_83849 ) ( CLEAR ?auto_83846 ) ( ON ?auto_83847 ?auto_83848 ) ( CLEAR ?auto_83847 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_83846 ?auto_83847 )
      ( MAKE-6PILE ?auto_83846 ?auto_83847 ?auto_83848 ?auto_83849 ?auto_83850 ?auto_83851 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_83872 - BLOCK
      ?auto_83873 - BLOCK
      ?auto_83874 - BLOCK
      ?auto_83875 - BLOCK
      ?auto_83876 - BLOCK
      ?auto_83877 - BLOCK
    )
    :vars
    (
      ?auto_83878 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_83877 ?auto_83878 ) ( not ( = ?auto_83872 ?auto_83873 ) ) ( not ( = ?auto_83872 ?auto_83874 ) ) ( not ( = ?auto_83872 ?auto_83875 ) ) ( not ( = ?auto_83872 ?auto_83876 ) ) ( not ( = ?auto_83872 ?auto_83877 ) ) ( not ( = ?auto_83872 ?auto_83878 ) ) ( not ( = ?auto_83873 ?auto_83874 ) ) ( not ( = ?auto_83873 ?auto_83875 ) ) ( not ( = ?auto_83873 ?auto_83876 ) ) ( not ( = ?auto_83873 ?auto_83877 ) ) ( not ( = ?auto_83873 ?auto_83878 ) ) ( not ( = ?auto_83874 ?auto_83875 ) ) ( not ( = ?auto_83874 ?auto_83876 ) ) ( not ( = ?auto_83874 ?auto_83877 ) ) ( not ( = ?auto_83874 ?auto_83878 ) ) ( not ( = ?auto_83875 ?auto_83876 ) ) ( not ( = ?auto_83875 ?auto_83877 ) ) ( not ( = ?auto_83875 ?auto_83878 ) ) ( not ( = ?auto_83876 ?auto_83877 ) ) ( not ( = ?auto_83876 ?auto_83878 ) ) ( not ( = ?auto_83877 ?auto_83878 ) ) ( ON ?auto_83876 ?auto_83877 ) ( ON ?auto_83875 ?auto_83876 ) ( ON ?auto_83874 ?auto_83875 ) ( ON ?auto_83873 ?auto_83874 ) ( ON ?auto_83872 ?auto_83873 ) ( CLEAR ?auto_83872 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_83872 )
      ( MAKE-6PILE ?auto_83872 ?auto_83873 ?auto_83874 ?auto_83875 ?auto_83876 ?auto_83877 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_83899 - BLOCK
      ?auto_83900 - BLOCK
      ?auto_83901 - BLOCK
      ?auto_83902 - BLOCK
      ?auto_83903 - BLOCK
      ?auto_83904 - BLOCK
      ?auto_83905 - BLOCK
    )
    :vars
    (
      ?auto_83906 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_83904 ) ( ON ?auto_83905 ?auto_83906 ) ( CLEAR ?auto_83905 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_83899 ) ( ON ?auto_83900 ?auto_83899 ) ( ON ?auto_83901 ?auto_83900 ) ( ON ?auto_83902 ?auto_83901 ) ( ON ?auto_83903 ?auto_83902 ) ( ON ?auto_83904 ?auto_83903 ) ( not ( = ?auto_83899 ?auto_83900 ) ) ( not ( = ?auto_83899 ?auto_83901 ) ) ( not ( = ?auto_83899 ?auto_83902 ) ) ( not ( = ?auto_83899 ?auto_83903 ) ) ( not ( = ?auto_83899 ?auto_83904 ) ) ( not ( = ?auto_83899 ?auto_83905 ) ) ( not ( = ?auto_83899 ?auto_83906 ) ) ( not ( = ?auto_83900 ?auto_83901 ) ) ( not ( = ?auto_83900 ?auto_83902 ) ) ( not ( = ?auto_83900 ?auto_83903 ) ) ( not ( = ?auto_83900 ?auto_83904 ) ) ( not ( = ?auto_83900 ?auto_83905 ) ) ( not ( = ?auto_83900 ?auto_83906 ) ) ( not ( = ?auto_83901 ?auto_83902 ) ) ( not ( = ?auto_83901 ?auto_83903 ) ) ( not ( = ?auto_83901 ?auto_83904 ) ) ( not ( = ?auto_83901 ?auto_83905 ) ) ( not ( = ?auto_83901 ?auto_83906 ) ) ( not ( = ?auto_83902 ?auto_83903 ) ) ( not ( = ?auto_83902 ?auto_83904 ) ) ( not ( = ?auto_83902 ?auto_83905 ) ) ( not ( = ?auto_83902 ?auto_83906 ) ) ( not ( = ?auto_83903 ?auto_83904 ) ) ( not ( = ?auto_83903 ?auto_83905 ) ) ( not ( = ?auto_83903 ?auto_83906 ) ) ( not ( = ?auto_83904 ?auto_83905 ) ) ( not ( = ?auto_83904 ?auto_83906 ) ) ( not ( = ?auto_83905 ?auto_83906 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_83905 ?auto_83906 )
      ( !STACK ?auto_83905 ?auto_83904 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_83929 - BLOCK
      ?auto_83930 - BLOCK
      ?auto_83931 - BLOCK
      ?auto_83932 - BLOCK
      ?auto_83933 - BLOCK
      ?auto_83934 - BLOCK
      ?auto_83935 - BLOCK
    )
    :vars
    (
      ?auto_83936 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_83935 ?auto_83936 ) ( ON-TABLE ?auto_83929 ) ( ON ?auto_83930 ?auto_83929 ) ( ON ?auto_83931 ?auto_83930 ) ( ON ?auto_83932 ?auto_83931 ) ( ON ?auto_83933 ?auto_83932 ) ( not ( = ?auto_83929 ?auto_83930 ) ) ( not ( = ?auto_83929 ?auto_83931 ) ) ( not ( = ?auto_83929 ?auto_83932 ) ) ( not ( = ?auto_83929 ?auto_83933 ) ) ( not ( = ?auto_83929 ?auto_83934 ) ) ( not ( = ?auto_83929 ?auto_83935 ) ) ( not ( = ?auto_83929 ?auto_83936 ) ) ( not ( = ?auto_83930 ?auto_83931 ) ) ( not ( = ?auto_83930 ?auto_83932 ) ) ( not ( = ?auto_83930 ?auto_83933 ) ) ( not ( = ?auto_83930 ?auto_83934 ) ) ( not ( = ?auto_83930 ?auto_83935 ) ) ( not ( = ?auto_83930 ?auto_83936 ) ) ( not ( = ?auto_83931 ?auto_83932 ) ) ( not ( = ?auto_83931 ?auto_83933 ) ) ( not ( = ?auto_83931 ?auto_83934 ) ) ( not ( = ?auto_83931 ?auto_83935 ) ) ( not ( = ?auto_83931 ?auto_83936 ) ) ( not ( = ?auto_83932 ?auto_83933 ) ) ( not ( = ?auto_83932 ?auto_83934 ) ) ( not ( = ?auto_83932 ?auto_83935 ) ) ( not ( = ?auto_83932 ?auto_83936 ) ) ( not ( = ?auto_83933 ?auto_83934 ) ) ( not ( = ?auto_83933 ?auto_83935 ) ) ( not ( = ?auto_83933 ?auto_83936 ) ) ( not ( = ?auto_83934 ?auto_83935 ) ) ( not ( = ?auto_83934 ?auto_83936 ) ) ( not ( = ?auto_83935 ?auto_83936 ) ) ( CLEAR ?auto_83933 ) ( ON ?auto_83934 ?auto_83935 ) ( CLEAR ?auto_83934 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_83929 ?auto_83930 ?auto_83931 ?auto_83932 ?auto_83933 ?auto_83934 )
      ( MAKE-7PILE ?auto_83929 ?auto_83930 ?auto_83931 ?auto_83932 ?auto_83933 ?auto_83934 ?auto_83935 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_83959 - BLOCK
      ?auto_83960 - BLOCK
      ?auto_83961 - BLOCK
      ?auto_83962 - BLOCK
      ?auto_83963 - BLOCK
      ?auto_83964 - BLOCK
      ?auto_83965 - BLOCK
    )
    :vars
    (
      ?auto_83966 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_83965 ?auto_83966 ) ( ON-TABLE ?auto_83959 ) ( ON ?auto_83960 ?auto_83959 ) ( ON ?auto_83961 ?auto_83960 ) ( ON ?auto_83962 ?auto_83961 ) ( not ( = ?auto_83959 ?auto_83960 ) ) ( not ( = ?auto_83959 ?auto_83961 ) ) ( not ( = ?auto_83959 ?auto_83962 ) ) ( not ( = ?auto_83959 ?auto_83963 ) ) ( not ( = ?auto_83959 ?auto_83964 ) ) ( not ( = ?auto_83959 ?auto_83965 ) ) ( not ( = ?auto_83959 ?auto_83966 ) ) ( not ( = ?auto_83960 ?auto_83961 ) ) ( not ( = ?auto_83960 ?auto_83962 ) ) ( not ( = ?auto_83960 ?auto_83963 ) ) ( not ( = ?auto_83960 ?auto_83964 ) ) ( not ( = ?auto_83960 ?auto_83965 ) ) ( not ( = ?auto_83960 ?auto_83966 ) ) ( not ( = ?auto_83961 ?auto_83962 ) ) ( not ( = ?auto_83961 ?auto_83963 ) ) ( not ( = ?auto_83961 ?auto_83964 ) ) ( not ( = ?auto_83961 ?auto_83965 ) ) ( not ( = ?auto_83961 ?auto_83966 ) ) ( not ( = ?auto_83962 ?auto_83963 ) ) ( not ( = ?auto_83962 ?auto_83964 ) ) ( not ( = ?auto_83962 ?auto_83965 ) ) ( not ( = ?auto_83962 ?auto_83966 ) ) ( not ( = ?auto_83963 ?auto_83964 ) ) ( not ( = ?auto_83963 ?auto_83965 ) ) ( not ( = ?auto_83963 ?auto_83966 ) ) ( not ( = ?auto_83964 ?auto_83965 ) ) ( not ( = ?auto_83964 ?auto_83966 ) ) ( not ( = ?auto_83965 ?auto_83966 ) ) ( ON ?auto_83964 ?auto_83965 ) ( CLEAR ?auto_83962 ) ( ON ?auto_83963 ?auto_83964 ) ( CLEAR ?auto_83963 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_83959 ?auto_83960 ?auto_83961 ?auto_83962 ?auto_83963 )
      ( MAKE-7PILE ?auto_83959 ?auto_83960 ?auto_83961 ?auto_83962 ?auto_83963 ?auto_83964 ?auto_83965 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_83989 - BLOCK
      ?auto_83990 - BLOCK
      ?auto_83991 - BLOCK
      ?auto_83992 - BLOCK
      ?auto_83993 - BLOCK
      ?auto_83994 - BLOCK
      ?auto_83995 - BLOCK
    )
    :vars
    (
      ?auto_83996 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_83995 ?auto_83996 ) ( ON-TABLE ?auto_83989 ) ( ON ?auto_83990 ?auto_83989 ) ( ON ?auto_83991 ?auto_83990 ) ( not ( = ?auto_83989 ?auto_83990 ) ) ( not ( = ?auto_83989 ?auto_83991 ) ) ( not ( = ?auto_83989 ?auto_83992 ) ) ( not ( = ?auto_83989 ?auto_83993 ) ) ( not ( = ?auto_83989 ?auto_83994 ) ) ( not ( = ?auto_83989 ?auto_83995 ) ) ( not ( = ?auto_83989 ?auto_83996 ) ) ( not ( = ?auto_83990 ?auto_83991 ) ) ( not ( = ?auto_83990 ?auto_83992 ) ) ( not ( = ?auto_83990 ?auto_83993 ) ) ( not ( = ?auto_83990 ?auto_83994 ) ) ( not ( = ?auto_83990 ?auto_83995 ) ) ( not ( = ?auto_83990 ?auto_83996 ) ) ( not ( = ?auto_83991 ?auto_83992 ) ) ( not ( = ?auto_83991 ?auto_83993 ) ) ( not ( = ?auto_83991 ?auto_83994 ) ) ( not ( = ?auto_83991 ?auto_83995 ) ) ( not ( = ?auto_83991 ?auto_83996 ) ) ( not ( = ?auto_83992 ?auto_83993 ) ) ( not ( = ?auto_83992 ?auto_83994 ) ) ( not ( = ?auto_83992 ?auto_83995 ) ) ( not ( = ?auto_83992 ?auto_83996 ) ) ( not ( = ?auto_83993 ?auto_83994 ) ) ( not ( = ?auto_83993 ?auto_83995 ) ) ( not ( = ?auto_83993 ?auto_83996 ) ) ( not ( = ?auto_83994 ?auto_83995 ) ) ( not ( = ?auto_83994 ?auto_83996 ) ) ( not ( = ?auto_83995 ?auto_83996 ) ) ( ON ?auto_83994 ?auto_83995 ) ( ON ?auto_83993 ?auto_83994 ) ( CLEAR ?auto_83991 ) ( ON ?auto_83992 ?auto_83993 ) ( CLEAR ?auto_83992 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_83989 ?auto_83990 ?auto_83991 ?auto_83992 )
      ( MAKE-7PILE ?auto_83989 ?auto_83990 ?auto_83991 ?auto_83992 ?auto_83993 ?auto_83994 ?auto_83995 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_84019 - BLOCK
      ?auto_84020 - BLOCK
      ?auto_84021 - BLOCK
      ?auto_84022 - BLOCK
      ?auto_84023 - BLOCK
      ?auto_84024 - BLOCK
      ?auto_84025 - BLOCK
    )
    :vars
    (
      ?auto_84026 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_84025 ?auto_84026 ) ( ON-TABLE ?auto_84019 ) ( ON ?auto_84020 ?auto_84019 ) ( not ( = ?auto_84019 ?auto_84020 ) ) ( not ( = ?auto_84019 ?auto_84021 ) ) ( not ( = ?auto_84019 ?auto_84022 ) ) ( not ( = ?auto_84019 ?auto_84023 ) ) ( not ( = ?auto_84019 ?auto_84024 ) ) ( not ( = ?auto_84019 ?auto_84025 ) ) ( not ( = ?auto_84019 ?auto_84026 ) ) ( not ( = ?auto_84020 ?auto_84021 ) ) ( not ( = ?auto_84020 ?auto_84022 ) ) ( not ( = ?auto_84020 ?auto_84023 ) ) ( not ( = ?auto_84020 ?auto_84024 ) ) ( not ( = ?auto_84020 ?auto_84025 ) ) ( not ( = ?auto_84020 ?auto_84026 ) ) ( not ( = ?auto_84021 ?auto_84022 ) ) ( not ( = ?auto_84021 ?auto_84023 ) ) ( not ( = ?auto_84021 ?auto_84024 ) ) ( not ( = ?auto_84021 ?auto_84025 ) ) ( not ( = ?auto_84021 ?auto_84026 ) ) ( not ( = ?auto_84022 ?auto_84023 ) ) ( not ( = ?auto_84022 ?auto_84024 ) ) ( not ( = ?auto_84022 ?auto_84025 ) ) ( not ( = ?auto_84022 ?auto_84026 ) ) ( not ( = ?auto_84023 ?auto_84024 ) ) ( not ( = ?auto_84023 ?auto_84025 ) ) ( not ( = ?auto_84023 ?auto_84026 ) ) ( not ( = ?auto_84024 ?auto_84025 ) ) ( not ( = ?auto_84024 ?auto_84026 ) ) ( not ( = ?auto_84025 ?auto_84026 ) ) ( ON ?auto_84024 ?auto_84025 ) ( ON ?auto_84023 ?auto_84024 ) ( ON ?auto_84022 ?auto_84023 ) ( CLEAR ?auto_84020 ) ( ON ?auto_84021 ?auto_84022 ) ( CLEAR ?auto_84021 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_84019 ?auto_84020 ?auto_84021 )
      ( MAKE-7PILE ?auto_84019 ?auto_84020 ?auto_84021 ?auto_84022 ?auto_84023 ?auto_84024 ?auto_84025 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_84049 - BLOCK
      ?auto_84050 - BLOCK
      ?auto_84051 - BLOCK
      ?auto_84052 - BLOCK
      ?auto_84053 - BLOCK
      ?auto_84054 - BLOCK
      ?auto_84055 - BLOCK
    )
    :vars
    (
      ?auto_84056 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_84055 ?auto_84056 ) ( ON-TABLE ?auto_84049 ) ( not ( = ?auto_84049 ?auto_84050 ) ) ( not ( = ?auto_84049 ?auto_84051 ) ) ( not ( = ?auto_84049 ?auto_84052 ) ) ( not ( = ?auto_84049 ?auto_84053 ) ) ( not ( = ?auto_84049 ?auto_84054 ) ) ( not ( = ?auto_84049 ?auto_84055 ) ) ( not ( = ?auto_84049 ?auto_84056 ) ) ( not ( = ?auto_84050 ?auto_84051 ) ) ( not ( = ?auto_84050 ?auto_84052 ) ) ( not ( = ?auto_84050 ?auto_84053 ) ) ( not ( = ?auto_84050 ?auto_84054 ) ) ( not ( = ?auto_84050 ?auto_84055 ) ) ( not ( = ?auto_84050 ?auto_84056 ) ) ( not ( = ?auto_84051 ?auto_84052 ) ) ( not ( = ?auto_84051 ?auto_84053 ) ) ( not ( = ?auto_84051 ?auto_84054 ) ) ( not ( = ?auto_84051 ?auto_84055 ) ) ( not ( = ?auto_84051 ?auto_84056 ) ) ( not ( = ?auto_84052 ?auto_84053 ) ) ( not ( = ?auto_84052 ?auto_84054 ) ) ( not ( = ?auto_84052 ?auto_84055 ) ) ( not ( = ?auto_84052 ?auto_84056 ) ) ( not ( = ?auto_84053 ?auto_84054 ) ) ( not ( = ?auto_84053 ?auto_84055 ) ) ( not ( = ?auto_84053 ?auto_84056 ) ) ( not ( = ?auto_84054 ?auto_84055 ) ) ( not ( = ?auto_84054 ?auto_84056 ) ) ( not ( = ?auto_84055 ?auto_84056 ) ) ( ON ?auto_84054 ?auto_84055 ) ( ON ?auto_84053 ?auto_84054 ) ( ON ?auto_84052 ?auto_84053 ) ( ON ?auto_84051 ?auto_84052 ) ( CLEAR ?auto_84049 ) ( ON ?auto_84050 ?auto_84051 ) ( CLEAR ?auto_84050 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_84049 ?auto_84050 )
      ( MAKE-7PILE ?auto_84049 ?auto_84050 ?auto_84051 ?auto_84052 ?auto_84053 ?auto_84054 ?auto_84055 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_84079 - BLOCK
      ?auto_84080 - BLOCK
      ?auto_84081 - BLOCK
      ?auto_84082 - BLOCK
      ?auto_84083 - BLOCK
      ?auto_84084 - BLOCK
      ?auto_84085 - BLOCK
    )
    :vars
    (
      ?auto_84086 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_84085 ?auto_84086 ) ( not ( = ?auto_84079 ?auto_84080 ) ) ( not ( = ?auto_84079 ?auto_84081 ) ) ( not ( = ?auto_84079 ?auto_84082 ) ) ( not ( = ?auto_84079 ?auto_84083 ) ) ( not ( = ?auto_84079 ?auto_84084 ) ) ( not ( = ?auto_84079 ?auto_84085 ) ) ( not ( = ?auto_84079 ?auto_84086 ) ) ( not ( = ?auto_84080 ?auto_84081 ) ) ( not ( = ?auto_84080 ?auto_84082 ) ) ( not ( = ?auto_84080 ?auto_84083 ) ) ( not ( = ?auto_84080 ?auto_84084 ) ) ( not ( = ?auto_84080 ?auto_84085 ) ) ( not ( = ?auto_84080 ?auto_84086 ) ) ( not ( = ?auto_84081 ?auto_84082 ) ) ( not ( = ?auto_84081 ?auto_84083 ) ) ( not ( = ?auto_84081 ?auto_84084 ) ) ( not ( = ?auto_84081 ?auto_84085 ) ) ( not ( = ?auto_84081 ?auto_84086 ) ) ( not ( = ?auto_84082 ?auto_84083 ) ) ( not ( = ?auto_84082 ?auto_84084 ) ) ( not ( = ?auto_84082 ?auto_84085 ) ) ( not ( = ?auto_84082 ?auto_84086 ) ) ( not ( = ?auto_84083 ?auto_84084 ) ) ( not ( = ?auto_84083 ?auto_84085 ) ) ( not ( = ?auto_84083 ?auto_84086 ) ) ( not ( = ?auto_84084 ?auto_84085 ) ) ( not ( = ?auto_84084 ?auto_84086 ) ) ( not ( = ?auto_84085 ?auto_84086 ) ) ( ON ?auto_84084 ?auto_84085 ) ( ON ?auto_84083 ?auto_84084 ) ( ON ?auto_84082 ?auto_84083 ) ( ON ?auto_84081 ?auto_84082 ) ( ON ?auto_84080 ?auto_84081 ) ( ON ?auto_84079 ?auto_84080 ) ( CLEAR ?auto_84079 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_84079 )
      ( MAKE-7PILE ?auto_84079 ?auto_84080 ?auto_84081 ?auto_84082 ?auto_84083 ?auto_84084 ?auto_84085 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_84110 - BLOCK
      ?auto_84111 - BLOCK
      ?auto_84112 - BLOCK
      ?auto_84113 - BLOCK
      ?auto_84114 - BLOCK
      ?auto_84115 - BLOCK
      ?auto_84116 - BLOCK
      ?auto_84117 - BLOCK
    )
    :vars
    (
      ?auto_84118 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_84116 ) ( ON ?auto_84117 ?auto_84118 ) ( CLEAR ?auto_84117 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_84110 ) ( ON ?auto_84111 ?auto_84110 ) ( ON ?auto_84112 ?auto_84111 ) ( ON ?auto_84113 ?auto_84112 ) ( ON ?auto_84114 ?auto_84113 ) ( ON ?auto_84115 ?auto_84114 ) ( ON ?auto_84116 ?auto_84115 ) ( not ( = ?auto_84110 ?auto_84111 ) ) ( not ( = ?auto_84110 ?auto_84112 ) ) ( not ( = ?auto_84110 ?auto_84113 ) ) ( not ( = ?auto_84110 ?auto_84114 ) ) ( not ( = ?auto_84110 ?auto_84115 ) ) ( not ( = ?auto_84110 ?auto_84116 ) ) ( not ( = ?auto_84110 ?auto_84117 ) ) ( not ( = ?auto_84110 ?auto_84118 ) ) ( not ( = ?auto_84111 ?auto_84112 ) ) ( not ( = ?auto_84111 ?auto_84113 ) ) ( not ( = ?auto_84111 ?auto_84114 ) ) ( not ( = ?auto_84111 ?auto_84115 ) ) ( not ( = ?auto_84111 ?auto_84116 ) ) ( not ( = ?auto_84111 ?auto_84117 ) ) ( not ( = ?auto_84111 ?auto_84118 ) ) ( not ( = ?auto_84112 ?auto_84113 ) ) ( not ( = ?auto_84112 ?auto_84114 ) ) ( not ( = ?auto_84112 ?auto_84115 ) ) ( not ( = ?auto_84112 ?auto_84116 ) ) ( not ( = ?auto_84112 ?auto_84117 ) ) ( not ( = ?auto_84112 ?auto_84118 ) ) ( not ( = ?auto_84113 ?auto_84114 ) ) ( not ( = ?auto_84113 ?auto_84115 ) ) ( not ( = ?auto_84113 ?auto_84116 ) ) ( not ( = ?auto_84113 ?auto_84117 ) ) ( not ( = ?auto_84113 ?auto_84118 ) ) ( not ( = ?auto_84114 ?auto_84115 ) ) ( not ( = ?auto_84114 ?auto_84116 ) ) ( not ( = ?auto_84114 ?auto_84117 ) ) ( not ( = ?auto_84114 ?auto_84118 ) ) ( not ( = ?auto_84115 ?auto_84116 ) ) ( not ( = ?auto_84115 ?auto_84117 ) ) ( not ( = ?auto_84115 ?auto_84118 ) ) ( not ( = ?auto_84116 ?auto_84117 ) ) ( not ( = ?auto_84116 ?auto_84118 ) ) ( not ( = ?auto_84117 ?auto_84118 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_84117 ?auto_84118 )
      ( !STACK ?auto_84117 ?auto_84116 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_84144 - BLOCK
      ?auto_84145 - BLOCK
      ?auto_84146 - BLOCK
      ?auto_84147 - BLOCK
      ?auto_84148 - BLOCK
      ?auto_84149 - BLOCK
      ?auto_84150 - BLOCK
      ?auto_84151 - BLOCK
    )
    :vars
    (
      ?auto_84152 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_84151 ?auto_84152 ) ( ON-TABLE ?auto_84144 ) ( ON ?auto_84145 ?auto_84144 ) ( ON ?auto_84146 ?auto_84145 ) ( ON ?auto_84147 ?auto_84146 ) ( ON ?auto_84148 ?auto_84147 ) ( ON ?auto_84149 ?auto_84148 ) ( not ( = ?auto_84144 ?auto_84145 ) ) ( not ( = ?auto_84144 ?auto_84146 ) ) ( not ( = ?auto_84144 ?auto_84147 ) ) ( not ( = ?auto_84144 ?auto_84148 ) ) ( not ( = ?auto_84144 ?auto_84149 ) ) ( not ( = ?auto_84144 ?auto_84150 ) ) ( not ( = ?auto_84144 ?auto_84151 ) ) ( not ( = ?auto_84144 ?auto_84152 ) ) ( not ( = ?auto_84145 ?auto_84146 ) ) ( not ( = ?auto_84145 ?auto_84147 ) ) ( not ( = ?auto_84145 ?auto_84148 ) ) ( not ( = ?auto_84145 ?auto_84149 ) ) ( not ( = ?auto_84145 ?auto_84150 ) ) ( not ( = ?auto_84145 ?auto_84151 ) ) ( not ( = ?auto_84145 ?auto_84152 ) ) ( not ( = ?auto_84146 ?auto_84147 ) ) ( not ( = ?auto_84146 ?auto_84148 ) ) ( not ( = ?auto_84146 ?auto_84149 ) ) ( not ( = ?auto_84146 ?auto_84150 ) ) ( not ( = ?auto_84146 ?auto_84151 ) ) ( not ( = ?auto_84146 ?auto_84152 ) ) ( not ( = ?auto_84147 ?auto_84148 ) ) ( not ( = ?auto_84147 ?auto_84149 ) ) ( not ( = ?auto_84147 ?auto_84150 ) ) ( not ( = ?auto_84147 ?auto_84151 ) ) ( not ( = ?auto_84147 ?auto_84152 ) ) ( not ( = ?auto_84148 ?auto_84149 ) ) ( not ( = ?auto_84148 ?auto_84150 ) ) ( not ( = ?auto_84148 ?auto_84151 ) ) ( not ( = ?auto_84148 ?auto_84152 ) ) ( not ( = ?auto_84149 ?auto_84150 ) ) ( not ( = ?auto_84149 ?auto_84151 ) ) ( not ( = ?auto_84149 ?auto_84152 ) ) ( not ( = ?auto_84150 ?auto_84151 ) ) ( not ( = ?auto_84150 ?auto_84152 ) ) ( not ( = ?auto_84151 ?auto_84152 ) ) ( CLEAR ?auto_84149 ) ( ON ?auto_84150 ?auto_84151 ) ( CLEAR ?auto_84150 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_84144 ?auto_84145 ?auto_84146 ?auto_84147 ?auto_84148 ?auto_84149 ?auto_84150 )
      ( MAKE-8PILE ?auto_84144 ?auto_84145 ?auto_84146 ?auto_84147 ?auto_84148 ?auto_84149 ?auto_84150 ?auto_84151 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_84178 - BLOCK
      ?auto_84179 - BLOCK
      ?auto_84180 - BLOCK
      ?auto_84181 - BLOCK
      ?auto_84182 - BLOCK
      ?auto_84183 - BLOCK
      ?auto_84184 - BLOCK
      ?auto_84185 - BLOCK
    )
    :vars
    (
      ?auto_84186 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_84185 ?auto_84186 ) ( ON-TABLE ?auto_84178 ) ( ON ?auto_84179 ?auto_84178 ) ( ON ?auto_84180 ?auto_84179 ) ( ON ?auto_84181 ?auto_84180 ) ( ON ?auto_84182 ?auto_84181 ) ( not ( = ?auto_84178 ?auto_84179 ) ) ( not ( = ?auto_84178 ?auto_84180 ) ) ( not ( = ?auto_84178 ?auto_84181 ) ) ( not ( = ?auto_84178 ?auto_84182 ) ) ( not ( = ?auto_84178 ?auto_84183 ) ) ( not ( = ?auto_84178 ?auto_84184 ) ) ( not ( = ?auto_84178 ?auto_84185 ) ) ( not ( = ?auto_84178 ?auto_84186 ) ) ( not ( = ?auto_84179 ?auto_84180 ) ) ( not ( = ?auto_84179 ?auto_84181 ) ) ( not ( = ?auto_84179 ?auto_84182 ) ) ( not ( = ?auto_84179 ?auto_84183 ) ) ( not ( = ?auto_84179 ?auto_84184 ) ) ( not ( = ?auto_84179 ?auto_84185 ) ) ( not ( = ?auto_84179 ?auto_84186 ) ) ( not ( = ?auto_84180 ?auto_84181 ) ) ( not ( = ?auto_84180 ?auto_84182 ) ) ( not ( = ?auto_84180 ?auto_84183 ) ) ( not ( = ?auto_84180 ?auto_84184 ) ) ( not ( = ?auto_84180 ?auto_84185 ) ) ( not ( = ?auto_84180 ?auto_84186 ) ) ( not ( = ?auto_84181 ?auto_84182 ) ) ( not ( = ?auto_84181 ?auto_84183 ) ) ( not ( = ?auto_84181 ?auto_84184 ) ) ( not ( = ?auto_84181 ?auto_84185 ) ) ( not ( = ?auto_84181 ?auto_84186 ) ) ( not ( = ?auto_84182 ?auto_84183 ) ) ( not ( = ?auto_84182 ?auto_84184 ) ) ( not ( = ?auto_84182 ?auto_84185 ) ) ( not ( = ?auto_84182 ?auto_84186 ) ) ( not ( = ?auto_84183 ?auto_84184 ) ) ( not ( = ?auto_84183 ?auto_84185 ) ) ( not ( = ?auto_84183 ?auto_84186 ) ) ( not ( = ?auto_84184 ?auto_84185 ) ) ( not ( = ?auto_84184 ?auto_84186 ) ) ( not ( = ?auto_84185 ?auto_84186 ) ) ( ON ?auto_84184 ?auto_84185 ) ( CLEAR ?auto_84182 ) ( ON ?auto_84183 ?auto_84184 ) ( CLEAR ?auto_84183 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_84178 ?auto_84179 ?auto_84180 ?auto_84181 ?auto_84182 ?auto_84183 )
      ( MAKE-8PILE ?auto_84178 ?auto_84179 ?auto_84180 ?auto_84181 ?auto_84182 ?auto_84183 ?auto_84184 ?auto_84185 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_84212 - BLOCK
      ?auto_84213 - BLOCK
      ?auto_84214 - BLOCK
      ?auto_84215 - BLOCK
      ?auto_84216 - BLOCK
      ?auto_84217 - BLOCK
      ?auto_84218 - BLOCK
      ?auto_84219 - BLOCK
    )
    :vars
    (
      ?auto_84220 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_84219 ?auto_84220 ) ( ON-TABLE ?auto_84212 ) ( ON ?auto_84213 ?auto_84212 ) ( ON ?auto_84214 ?auto_84213 ) ( ON ?auto_84215 ?auto_84214 ) ( not ( = ?auto_84212 ?auto_84213 ) ) ( not ( = ?auto_84212 ?auto_84214 ) ) ( not ( = ?auto_84212 ?auto_84215 ) ) ( not ( = ?auto_84212 ?auto_84216 ) ) ( not ( = ?auto_84212 ?auto_84217 ) ) ( not ( = ?auto_84212 ?auto_84218 ) ) ( not ( = ?auto_84212 ?auto_84219 ) ) ( not ( = ?auto_84212 ?auto_84220 ) ) ( not ( = ?auto_84213 ?auto_84214 ) ) ( not ( = ?auto_84213 ?auto_84215 ) ) ( not ( = ?auto_84213 ?auto_84216 ) ) ( not ( = ?auto_84213 ?auto_84217 ) ) ( not ( = ?auto_84213 ?auto_84218 ) ) ( not ( = ?auto_84213 ?auto_84219 ) ) ( not ( = ?auto_84213 ?auto_84220 ) ) ( not ( = ?auto_84214 ?auto_84215 ) ) ( not ( = ?auto_84214 ?auto_84216 ) ) ( not ( = ?auto_84214 ?auto_84217 ) ) ( not ( = ?auto_84214 ?auto_84218 ) ) ( not ( = ?auto_84214 ?auto_84219 ) ) ( not ( = ?auto_84214 ?auto_84220 ) ) ( not ( = ?auto_84215 ?auto_84216 ) ) ( not ( = ?auto_84215 ?auto_84217 ) ) ( not ( = ?auto_84215 ?auto_84218 ) ) ( not ( = ?auto_84215 ?auto_84219 ) ) ( not ( = ?auto_84215 ?auto_84220 ) ) ( not ( = ?auto_84216 ?auto_84217 ) ) ( not ( = ?auto_84216 ?auto_84218 ) ) ( not ( = ?auto_84216 ?auto_84219 ) ) ( not ( = ?auto_84216 ?auto_84220 ) ) ( not ( = ?auto_84217 ?auto_84218 ) ) ( not ( = ?auto_84217 ?auto_84219 ) ) ( not ( = ?auto_84217 ?auto_84220 ) ) ( not ( = ?auto_84218 ?auto_84219 ) ) ( not ( = ?auto_84218 ?auto_84220 ) ) ( not ( = ?auto_84219 ?auto_84220 ) ) ( ON ?auto_84218 ?auto_84219 ) ( ON ?auto_84217 ?auto_84218 ) ( CLEAR ?auto_84215 ) ( ON ?auto_84216 ?auto_84217 ) ( CLEAR ?auto_84216 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_84212 ?auto_84213 ?auto_84214 ?auto_84215 ?auto_84216 )
      ( MAKE-8PILE ?auto_84212 ?auto_84213 ?auto_84214 ?auto_84215 ?auto_84216 ?auto_84217 ?auto_84218 ?auto_84219 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_84246 - BLOCK
      ?auto_84247 - BLOCK
      ?auto_84248 - BLOCK
      ?auto_84249 - BLOCK
      ?auto_84250 - BLOCK
      ?auto_84251 - BLOCK
      ?auto_84252 - BLOCK
      ?auto_84253 - BLOCK
    )
    :vars
    (
      ?auto_84254 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_84253 ?auto_84254 ) ( ON-TABLE ?auto_84246 ) ( ON ?auto_84247 ?auto_84246 ) ( ON ?auto_84248 ?auto_84247 ) ( not ( = ?auto_84246 ?auto_84247 ) ) ( not ( = ?auto_84246 ?auto_84248 ) ) ( not ( = ?auto_84246 ?auto_84249 ) ) ( not ( = ?auto_84246 ?auto_84250 ) ) ( not ( = ?auto_84246 ?auto_84251 ) ) ( not ( = ?auto_84246 ?auto_84252 ) ) ( not ( = ?auto_84246 ?auto_84253 ) ) ( not ( = ?auto_84246 ?auto_84254 ) ) ( not ( = ?auto_84247 ?auto_84248 ) ) ( not ( = ?auto_84247 ?auto_84249 ) ) ( not ( = ?auto_84247 ?auto_84250 ) ) ( not ( = ?auto_84247 ?auto_84251 ) ) ( not ( = ?auto_84247 ?auto_84252 ) ) ( not ( = ?auto_84247 ?auto_84253 ) ) ( not ( = ?auto_84247 ?auto_84254 ) ) ( not ( = ?auto_84248 ?auto_84249 ) ) ( not ( = ?auto_84248 ?auto_84250 ) ) ( not ( = ?auto_84248 ?auto_84251 ) ) ( not ( = ?auto_84248 ?auto_84252 ) ) ( not ( = ?auto_84248 ?auto_84253 ) ) ( not ( = ?auto_84248 ?auto_84254 ) ) ( not ( = ?auto_84249 ?auto_84250 ) ) ( not ( = ?auto_84249 ?auto_84251 ) ) ( not ( = ?auto_84249 ?auto_84252 ) ) ( not ( = ?auto_84249 ?auto_84253 ) ) ( not ( = ?auto_84249 ?auto_84254 ) ) ( not ( = ?auto_84250 ?auto_84251 ) ) ( not ( = ?auto_84250 ?auto_84252 ) ) ( not ( = ?auto_84250 ?auto_84253 ) ) ( not ( = ?auto_84250 ?auto_84254 ) ) ( not ( = ?auto_84251 ?auto_84252 ) ) ( not ( = ?auto_84251 ?auto_84253 ) ) ( not ( = ?auto_84251 ?auto_84254 ) ) ( not ( = ?auto_84252 ?auto_84253 ) ) ( not ( = ?auto_84252 ?auto_84254 ) ) ( not ( = ?auto_84253 ?auto_84254 ) ) ( ON ?auto_84252 ?auto_84253 ) ( ON ?auto_84251 ?auto_84252 ) ( ON ?auto_84250 ?auto_84251 ) ( CLEAR ?auto_84248 ) ( ON ?auto_84249 ?auto_84250 ) ( CLEAR ?auto_84249 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_84246 ?auto_84247 ?auto_84248 ?auto_84249 )
      ( MAKE-8PILE ?auto_84246 ?auto_84247 ?auto_84248 ?auto_84249 ?auto_84250 ?auto_84251 ?auto_84252 ?auto_84253 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_84280 - BLOCK
      ?auto_84281 - BLOCK
      ?auto_84282 - BLOCK
      ?auto_84283 - BLOCK
      ?auto_84284 - BLOCK
      ?auto_84285 - BLOCK
      ?auto_84286 - BLOCK
      ?auto_84287 - BLOCK
    )
    :vars
    (
      ?auto_84288 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_84287 ?auto_84288 ) ( ON-TABLE ?auto_84280 ) ( ON ?auto_84281 ?auto_84280 ) ( not ( = ?auto_84280 ?auto_84281 ) ) ( not ( = ?auto_84280 ?auto_84282 ) ) ( not ( = ?auto_84280 ?auto_84283 ) ) ( not ( = ?auto_84280 ?auto_84284 ) ) ( not ( = ?auto_84280 ?auto_84285 ) ) ( not ( = ?auto_84280 ?auto_84286 ) ) ( not ( = ?auto_84280 ?auto_84287 ) ) ( not ( = ?auto_84280 ?auto_84288 ) ) ( not ( = ?auto_84281 ?auto_84282 ) ) ( not ( = ?auto_84281 ?auto_84283 ) ) ( not ( = ?auto_84281 ?auto_84284 ) ) ( not ( = ?auto_84281 ?auto_84285 ) ) ( not ( = ?auto_84281 ?auto_84286 ) ) ( not ( = ?auto_84281 ?auto_84287 ) ) ( not ( = ?auto_84281 ?auto_84288 ) ) ( not ( = ?auto_84282 ?auto_84283 ) ) ( not ( = ?auto_84282 ?auto_84284 ) ) ( not ( = ?auto_84282 ?auto_84285 ) ) ( not ( = ?auto_84282 ?auto_84286 ) ) ( not ( = ?auto_84282 ?auto_84287 ) ) ( not ( = ?auto_84282 ?auto_84288 ) ) ( not ( = ?auto_84283 ?auto_84284 ) ) ( not ( = ?auto_84283 ?auto_84285 ) ) ( not ( = ?auto_84283 ?auto_84286 ) ) ( not ( = ?auto_84283 ?auto_84287 ) ) ( not ( = ?auto_84283 ?auto_84288 ) ) ( not ( = ?auto_84284 ?auto_84285 ) ) ( not ( = ?auto_84284 ?auto_84286 ) ) ( not ( = ?auto_84284 ?auto_84287 ) ) ( not ( = ?auto_84284 ?auto_84288 ) ) ( not ( = ?auto_84285 ?auto_84286 ) ) ( not ( = ?auto_84285 ?auto_84287 ) ) ( not ( = ?auto_84285 ?auto_84288 ) ) ( not ( = ?auto_84286 ?auto_84287 ) ) ( not ( = ?auto_84286 ?auto_84288 ) ) ( not ( = ?auto_84287 ?auto_84288 ) ) ( ON ?auto_84286 ?auto_84287 ) ( ON ?auto_84285 ?auto_84286 ) ( ON ?auto_84284 ?auto_84285 ) ( ON ?auto_84283 ?auto_84284 ) ( CLEAR ?auto_84281 ) ( ON ?auto_84282 ?auto_84283 ) ( CLEAR ?auto_84282 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_84280 ?auto_84281 ?auto_84282 )
      ( MAKE-8PILE ?auto_84280 ?auto_84281 ?auto_84282 ?auto_84283 ?auto_84284 ?auto_84285 ?auto_84286 ?auto_84287 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_84314 - BLOCK
      ?auto_84315 - BLOCK
      ?auto_84316 - BLOCK
      ?auto_84317 - BLOCK
      ?auto_84318 - BLOCK
      ?auto_84319 - BLOCK
      ?auto_84320 - BLOCK
      ?auto_84321 - BLOCK
    )
    :vars
    (
      ?auto_84322 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_84321 ?auto_84322 ) ( ON-TABLE ?auto_84314 ) ( not ( = ?auto_84314 ?auto_84315 ) ) ( not ( = ?auto_84314 ?auto_84316 ) ) ( not ( = ?auto_84314 ?auto_84317 ) ) ( not ( = ?auto_84314 ?auto_84318 ) ) ( not ( = ?auto_84314 ?auto_84319 ) ) ( not ( = ?auto_84314 ?auto_84320 ) ) ( not ( = ?auto_84314 ?auto_84321 ) ) ( not ( = ?auto_84314 ?auto_84322 ) ) ( not ( = ?auto_84315 ?auto_84316 ) ) ( not ( = ?auto_84315 ?auto_84317 ) ) ( not ( = ?auto_84315 ?auto_84318 ) ) ( not ( = ?auto_84315 ?auto_84319 ) ) ( not ( = ?auto_84315 ?auto_84320 ) ) ( not ( = ?auto_84315 ?auto_84321 ) ) ( not ( = ?auto_84315 ?auto_84322 ) ) ( not ( = ?auto_84316 ?auto_84317 ) ) ( not ( = ?auto_84316 ?auto_84318 ) ) ( not ( = ?auto_84316 ?auto_84319 ) ) ( not ( = ?auto_84316 ?auto_84320 ) ) ( not ( = ?auto_84316 ?auto_84321 ) ) ( not ( = ?auto_84316 ?auto_84322 ) ) ( not ( = ?auto_84317 ?auto_84318 ) ) ( not ( = ?auto_84317 ?auto_84319 ) ) ( not ( = ?auto_84317 ?auto_84320 ) ) ( not ( = ?auto_84317 ?auto_84321 ) ) ( not ( = ?auto_84317 ?auto_84322 ) ) ( not ( = ?auto_84318 ?auto_84319 ) ) ( not ( = ?auto_84318 ?auto_84320 ) ) ( not ( = ?auto_84318 ?auto_84321 ) ) ( not ( = ?auto_84318 ?auto_84322 ) ) ( not ( = ?auto_84319 ?auto_84320 ) ) ( not ( = ?auto_84319 ?auto_84321 ) ) ( not ( = ?auto_84319 ?auto_84322 ) ) ( not ( = ?auto_84320 ?auto_84321 ) ) ( not ( = ?auto_84320 ?auto_84322 ) ) ( not ( = ?auto_84321 ?auto_84322 ) ) ( ON ?auto_84320 ?auto_84321 ) ( ON ?auto_84319 ?auto_84320 ) ( ON ?auto_84318 ?auto_84319 ) ( ON ?auto_84317 ?auto_84318 ) ( ON ?auto_84316 ?auto_84317 ) ( CLEAR ?auto_84314 ) ( ON ?auto_84315 ?auto_84316 ) ( CLEAR ?auto_84315 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_84314 ?auto_84315 )
      ( MAKE-8PILE ?auto_84314 ?auto_84315 ?auto_84316 ?auto_84317 ?auto_84318 ?auto_84319 ?auto_84320 ?auto_84321 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_84348 - BLOCK
      ?auto_84349 - BLOCK
      ?auto_84350 - BLOCK
      ?auto_84351 - BLOCK
      ?auto_84352 - BLOCK
      ?auto_84353 - BLOCK
      ?auto_84354 - BLOCK
      ?auto_84355 - BLOCK
    )
    :vars
    (
      ?auto_84356 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_84355 ?auto_84356 ) ( not ( = ?auto_84348 ?auto_84349 ) ) ( not ( = ?auto_84348 ?auto_84350 ) ) ( not ( = ?auto_84348 ?auto_84351 ) ) ( not ( = ?auto_84348 ?auto_84352 ) ) ( not ( = ?auto_84348 ?auto_84353 ) ) ( not ( = ?auto_84348 ?auto_84354 ) ) ( not ( = ?auto_84348 ?auto_84355 ) ) ( not ( = ?auto_84348 ?auto_84356 ) ) ( not ( = ?auto_84349 ?auto_84350 ) ) ( not ( = ?auto_84349 ?auto_84351 ) ) ( not ( = ?auto_84349 ?auto_84352 ) ) ( not ( = ?auto_84349 ?auto_84353 ) ) ( not ( = ?auto_84349 ?auto_84354 ) ) ( not ( = ?auto_84349 ?auto_84355 ) ) ( not ( = ?auto_84349 ?auto_84356 ) ) ( not ( = ?auto_84350 ?auto_84351 ) ) ( not ( = ?auto_84350 ?auto_84352 ) ) ( not ( = ?auto_84350 ?auto_84353 ) ) ( not ( = ?auto_84350 ?auto_84354 ) ) ( not ( = ?auto_84350 ?auto_84355 ) ) ( not ( = ?auto_84350 ?auto_84356 ) ) ( not ( = ?auto_84351 ?auto_84352 ) ) ( not ( = ?auto_84351 ?auto_84353 ) ) ( not ( = ?auto_84351 ?auto_84354 ) ) ( not ( = ?auto_84351 ?auto_84355 ) ) ( not ( = ?auto_84351 ?auto_84356 ) ) ( not ( = ?auto_84352 ?auto_84353 ) ) ( not ( = ?auto_84352 ?auto_84354 ) ) ( not ( = ?auto_84352 ?auto_84355 ) ) ( not ( = ?auto_84352 ?auto_84356 ) ) ( not ( = ?auto_84353 ?auto_84354 ) ) ( not ( = ?auto_84353 ?auto_84355 ) ) ( not ( = ?auto_84353 ?auto_84356 ) ) ( not ( = ?auto_84354 ?auto_84355 ) ) ( not ( = ?auto_84354 ?auto_84356 ) ) ( not ( = ?auto_84355 ?auto_84356 ) ) ( ON ?auto_84354 ?auto_84355 ) ( ON ?auto_84353 ?auto_84354 ) ( ON ?auto_84352 ?auto_84353 ) ( ON ?auto_84351 ?auto_84352 ) ( ON ?auto_84350 ?auto_84351 ) ( ON ?auto_84349 ?auto_84350 ) ( ON ?auto_84348 ?auto_84349 ) ( CLEAR ?auto_84348 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_84348 )
      ( MAKE-8PILE ?auto_84348 ?auto_84349 ?auto_84350 ?auto_84351 ?auto_84352 ?auto_84353 ?auto_84354 ?auto_84355 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_84383 - BLOCK
      ?auto_84384 - BLOCK
      ?auto_84385 - BLOCK
      ?auto_84386 - BLOCK
      ?auto_84387 - BLOCK
      ?auto_84388 - BLOCK
      ?auto_84389 - BLOCK
      ?auto_84390 - BLOCK
      ?auto_84391 - BLOCK
    )
    :vars
    (
      ?auto_84392 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_84390 ) ( ON ?auto_84391 ?auto_84392 ) ( CLEAR ?auto_84391 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_84383 ) ( ON ?auto_84384 ?auto_84383 ) ( ON ?auto_84385 ?auto_84384 ) ( ON ?auto_84386 ?auto_84385 ) ( ON ?auto_84387 ?auto_84386 ) ( ON ?auto_84388 ?auto_84387 ) ( ON ?auto_84389 ?auto_84388 ) ( ON ?auto_84390 ?auto_84389 ) ( not ( = ?auto_84383 ?auto_84384 ) ) ( not ( = ?auto_84383 ?auto_84385 ) ) ( not ( = ?auto_84383 ?auto_84386 ) ) ( not ( = ?auto_84383 ?auto_84387 ) ) ( not ( = ?auto_84383 ?auto_84388 ) ) ( not ( = ?auto_84383 ?auto_84389 ) ) ( not ( = ?auto_84383 ?auto_84390 ) ) ( not ( = ?auto_84383 ?auto_84391 ) ) ( not ( = ?auto_84383 ?auto_84392 ) ) ( not ( = ?auto_84384 ?auto_84385 ) ) ( not ( = ?auto_84384 ?auto_84386 ) ) ( not ( = ?auto_84384 ?auto_84387 ) ) ( not ( = ?auto_84384 ?auto_84388 ) ) ( not ( = ?auto_84384 ?auto_84389 ) ) ( not ( = ?auto_84384 ?auto_84390 ) ) ( not ( = ?auto_84384 ?auto_84391 ) ) ( not ( = ?auto_84384 ?auto_84392 ) ) ( not ( = ?auto_84385 ?auto_84386 ) ) ( not ( = ?auto_84385 ?auto_84387 ) ) ( not ( = ?auto_84385 ?auto_84388 ) ) ( not ( = ?auto_84385 ?auto_84389 ) ) ( not ( = ?auto_84385 ?auto_84390 ) ) ( not ( = ?auto_84385 ?auto_84391 ) ) ( not ( = ?auto_84385 ?auto_84392 ) ) ( not ( = ?auto_84386 ?auto_84387 ) ) ( not ( = ?auto_84386 ?auto_84388 ) ) ( not ( = ?auto_84386 ?auto_84389 ) ) ( not ( = ?auto_84386 ?auto_84390 ) ) ( not ( = ?auto_84386 ?auto_84391 ) ) ( not ( = ?auto_84386 ?auto_84392 ) ) ( not ( = ?auto_84387 ?auto_84388 ) ) ( not ( = ?auto_84387 ?auto_84389 ) ) ( not ( = ?auto_84387 ?auto_84390 ) ) ( not ( = ?auto_84387 ?auto_84391 ) ) ( not ( = ?auto_84387 ?auto_84392 ) ) ( not ( = ?auto_84388 ?auto_84389 ) ) ( not ( = ?auto_84388 ?auto_84390 ) ) ( not ( = ?auto_84388 ?auto_84391 ) ) ( not ( = ?auto_84388 ?auto_84392 ) ) ( not ( = ?auto_84389 ?auto_84390 ) ) ( not ( = ?auto_84389 ?auto_84391 ) ) ( not ( = ?auto_84389 ?auto_84392 ) ) ( not ( = ?auto_84390 ?auto_84391 ) ) ( not ( = ?auto_84390 ?auto_84392 ) ) ( not ( = ?auto_84391 ?auto_84392 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_84391 ?auto_84392 )
      ( !STACK ?auto_84391 ?auto_84390 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_84421 - BLOCK
      ?auto_84422 - BLOCK
      ?auto_84423 - BLOCK
      ?auto_84424 - BLOCK
      ?auto_84425 - BLOCK
      ?auto_84426 - BLOCK
      ?auto_84427 - BLOCK
      ?auto_84428 - BLOCK
      ?auto_84429 - BLOCK
    )
    :vars
    (
      ?auto_84430 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_84429 ?auto_84430 ) ( ON-TABLE ?auto_84421 ) ( ON ?auto_84422 ?auto_84421 ) ( ON ?auto_84423 ?auto_84422 ) ( ON ?auto_84424 ?auto_84423 ) ( ON ?auto_84425 ?auto_84424 ) ( ON ?auto_84426 ?auto_84425 ) ( ON ?auto_84427 ?auto_84426 ) ( not ( = ?auto_84421 ?auto_84422 ) ) ( not ( = ?auto_84421 ?auto_84423 ) ) ( not ( = ?auto_84421 ?auto_84424 ) ) ( not ( = ?auto_84421 ?auto_84425 ) ) ( not ( = ?auto_84421 ?auto_84426 ) ) ( not ( = ?auto_84421 ?auto_84427 ) ) ( not ( = ?auto_84421 ?auto_84428 ) ) ( not ( = ?auto_84421 ?auto_84429 ) ) ( not ( = ?auto_84421 ?auto_84430 ) ) ( not ( = ?auto_84422 ?auto_84423 ) ) ( not ( = ?auto_84422 ?auto_84424 ) ) ( not ( = ?auto_84422 ?auto_84425 ) ) ( not ( = ?auto_84422 ?auto_84426 ) ) ( not ( = ?auto_84422 ?auto_84427 ) ) ( not ( = ?auto_84422 ?auto_84428 ) ) ( not ( = ?auto_84422 ?auto_84429 ) ) ( not ( = ?auto_84422 ?auto_84430 ) ) ( not ( = ?auto_84423 ?auto_84424 ) ) ( not ( = ?auto_84423 ?auto_84425 ) ) ( not ( = ?auto_84423 ?auto_84426 ) ) ( not ( = ?auto_84423 ?auto_84427 ) ) ( not ( = ?auto_84423 ?auto_84428 ) ) ( not ( = ?auto_84423 ?auto_84429 ) ) ( not ( = ?auto_84423 ?auto_84430 ) ) ( not ( = ?auto_84424 ?auto_84425 ) ) ( not ( = ?auto_84424 ?auto_84426 ) ) ( not ( = ?auto_84424 ?auto_84427 ) ) ( not ( = ?auto_84424 ?auto_84428 ) ) ( not ( = ?auto_84424 ?auto_84429 ) ) ( not ( = ?auto_84424 ?auto_84430 ) ) ( not ( = ?auto_84425 ?auto_84426 ) ) ( not ( = ?auto_84425 ?auto_84427 ) ) ( not ( = ?auto_84425 ?auto_84428 ) ) ( not ( = ?auto_84425 ?auto_84429 ) ) ( not ( = ?auto_84425 ?auto_84430 ) ) ( not ( = ?auto_84426 ?auto_84427 ) ) ( not ( = ?auto_84426 ?auto_84428 ) ) ( not ( = ?auto_84426 ?auto_84429 ) ) ( not ( = ?auto_84426 ?auto_84430 ) ) ( not ( = ?auto_84427 ?auto_84428 ) ) ( not ( = ?auto_84427 ?auto_84429 ) ) ( not ( = ?auto_84427 ?auto_84430 ) ) ( not ( = ?auto_84428 ?auto_84429 ) ) ( not ( = ?auto_84428 ?auto_84430 ) ) ( not ( = ?auto_84429 ?auto_84430 ) ) ( CLEAR ?auto_84427 ) ( ON ?auto_84428 ?auto_84429 ) ( CLEAR ?auto_84428 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_84421 ?auto_84422 ?auto_84423 ?auto_84424 ?auto_84425 ?auto_84426 ?auto_84427 ?auto_84428 )
      ( MAKE-9PILE ?auto_84421 ?auto_84422 ?auto_84423 ?auto_84424 ?auto_84425 ?auto_84426 ?auto_84427 ?auto_84428 ?auto_84429 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_84459 - BLOCK
      ?auto_84460 - BLOCK
      ?auto_84461 - BLOCK
      ?auto_84462 - BLOCK
      ?auto_84463 - BLOCK
      ?auto_84464 - BLOCK
      ?auto_84465 - BLOCK
      ?auto_84466 - BLOCK
      ?auto_84467 - BLOCK
    )
    :vars
    (
      ?auto_84468 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_84467 ?auto_84468 ) ( ON-TABLE ?auto_84459 ) ( ON ?auto_84460 ?auto_84459 ) ( ON ?auto_84461 ?auto_84460 ) ( ON ?auto_84462 ?auto_84461 ) ( ON ?auto_84463 ?auto_84462 ) ( ON ?auto_84464 ?auto_84463 ) ( not ( = ?auto_84459 ?auto_84460 ) ) ( not ( = ?auto_84459 ?auto_84461 ) ) ( not ( = ?auto_84459 ?auto_84462 ) ) ( not ( = ?auto_84459 ?auto_84463 ) ) ( not ( = ?auto_84459 ?auto_84464 ) ) ( not ( = ?auto_84459 ?auto_84465 ) ) ( not ( = ?auto_84459 ?auto_84466 ) ) ( not ( = ?auto_84459 ?auto_84467 ) ) ( not ( = ?auto_84459 ?auto_84468 ) ) ( not ( = ?auto_84460 ?auto_84461 ) ) ( not ( = ?auto_84460 ?auto_84462 ) ) ( not ( = ?auto_84460 ?auto_84463 ) ) ( not ( = ?auto_84460 ?auto_84464 ) ) ( not ( = ?auto_84460 ?auto_84465 ) ) ( not ( = ?auto_84460 ?auto_84466 ) ) ( not ( = ?auto_84460 ?auto_84467 ) ) ( not ( = ?auto_84460 ?auto_84468 ) ) ( not ( = ?auto_84461 ?auto_84462 ) ) ( not ( = ?auto_84461 ?auto_84463 ) ) ( not ( = ?auto_84461 ?auto_84464 ) ) ( not ( = ?auto_84461 ?auto_84465 ) ) ( not ( = ?auto_84461 ?auto_84466 ) ) ( not ( = ?auto_84461 ?auto_84467 ) ) ( not ( = ?auto_84461 ?auto_84468 ) ) ( not ( = ?auto_84462 ?auto_84463 ) ) ( not ( = ?auto_84462 ?auto_84464 ) ) ( not ( = ?auto_84462 ?auto_84465 ) ) ( not ( = ?auto_84462 ?auto_84466 ) ) ( not ( = ?auto_84462 ?auto_84467 ) ) ( not ( = ?auto_84462 ?auto_84468 ) ) ( not ( = ?auto_84463 ?auto_84464 ) ) ( not ( = ?auto_84463 ?auto_84465 ) ) ( not ( = ?auto_84463 ?auto_84466 ) ) ( not ( = ?auto_84463 ?auto_84467 ) ) ( not ( = ?auto_84463 ?auto_84468 ) ) ( not ( = ?auto_84464 ?auto_84465 ) ) ( not ( = ?auto_84464 ?auto_84466 ) ) ( not ( = ?auto_84464 ?auto_84467 ) ) ( not ( = ?auto_84464 ?auto_84468 ) ) ( not ( = ?auto_84465 ?auto_84466 ) ) ( not ( = ?auto_84465 ?auto_84467 ) ) ( not ( = ?auto_84465 ?auto_84468 ) ) ( not ( = ?auto_84466 ?auto_84467 ) ) ( not ( = ?auto_84466 ?auto_84468 ) ) ( not ( = ?auto_84467 ?auto_84468 ) ) ( ON ?auto_84466 ?auto_84467 ) ( CLEAR ?auto_84464 ) ( ON ?auto_84465 ?auto_84466 ) ( CLEAR ?auto_84465 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_84459 ?auto_84460 ?auto_84461 ?auto_84462 ?auto_84463 ?auto_84464 ?auto_84465 )
      ( MAKE-9PILE ?auto_84459 ?auto_84460 ?auto_84461 ?auto_84462 ?auto_84463 ?auto_84464 ?auto_84465 ?auto_84466 ?auto_84467 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_84497 - BLOCK
      ?auto_84498 - BLOCK
      ?auto_84499 - BLOCK
      ?auto_84500 - BLOCK
      ?auto_84501 - BLOCK
      ?auto_84502 - BLOCK
      ?auto_84503 - BLOCK
      ?auto_84504 - BLOCK
      ?auto_84505 - BLOCK
    )
    :vars
    (
      ?auto_84506 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_84505 ?auto_84506 ) ( ON-TABLE ?auto_84497 ) ( ON ?auto_84498 ?auto_84497 ) ( ON ?auto_84499 ?auto_84498 ) ( ON ?auto_84500 ?auto_84499 ) ( ON ?auto_84501 ?auto_84500 ) ( not ( = ?auto_84497 ?auto_84498 ) ) ( not ( = ?auto_84497 ?auto_84499 ) ) ( not ( = ?auto_84497 ?auto_84500 ) ) ( not ( = ?auto_84497 ?auto_84501 ) ) ( not ( = ?auto_84497 ?auto_84502 ) ) ( not ( = ?auto_84497 ?auto_84503 ) ) ( not ( = ?auto_84497 ?auto_84504 ) ) ( not ( = ?auto_84497 ?auto_84505 ) ) ( not ( = ?auto_84497 ?auto_84506 ) ) ( not ( = ?auto_84498 ?auto_84499 ) ) ( not ( = ?auto_84498 ?auto_84500 ) ) ( not ( = ?auto_84498 ?auto_84501 ) ) ( not ( = ?auto_84498 ?auto_84502 ) ) ( not ( = ?auto_84498 ?auto_84503 ) ) ( not ( = ?auto_84498 ?auto_84504 ) ) ( not ( = ?auto_84498 ?auto_84505 ) ) ( not ( = ?auto_84498 ?auto_84506 ) ) ( not ( = ?auto_84499 ?auto_84500 ) ) ( not ( = ?auto_84499 ?auto_84501 ) ) ( not ( = ?auto_84499 ?auto_84502 ) ) ( not ( = ?auto_84499 ?auto_84503 ) ) ( not ( = ?auto_84499 ?auto_84504 ) ) ( not ( = ?auto_84499 ?auto_84505 ) ) ( not ( = ?auto_84499 ?auto_84506 ) ) ( not ( = ?auto_84500 ?auto_84501 ) ) ( not ( = ?auto_84500 ?auto_84502 ) ) ( not ( = ?auto_84500 ?auto_84503 ) ) ( not ( = ?auto_84500 ?auto_84504 ) ) ( not ( = ?auto_84500 ?auto_84505 ) ) ( not ( = ?auto_84500 ?auto_84506 ) ) ( not ( = ?auto_84501 ?auto_84502 ) ) ( not ( = ?auto_84501 ?auto_84503 ) ) ( not ( = ?auto_84501 ?auto_84504 ) ) ( not ( = ?auto_84501 ?auto_84505 ) ) ( not ( = ?auto_84501 ?auto_84506 ) ) ( not ( = ?auto_84502 ?auto_84503 ) ) ( not ( = ?auto_84502 ?auto_84504 ) ) ( not ( = ?auto_84502 ?auto_84505 ) ) ( not ( = ?auto_84502 ?auto_84506 ) ) ( not ( = ?auto_84503 ?auto_84504 ) ) ( not ( = ?auto_84503 ?auto_84505 ) ) ( not ( = ?auto_84503 ?auto_84506 ) ) ( not ( = ?auto_84504 ?auto_84505 ) ) ( not ( = ?auto_84504 ?auto_84506 ) ) ( not ( = ?auto_84505 ?auto_84506 ) ) ( ON ?auto_84504 ?auto_84505 ) ( ON ?auto_84503 ?auto_84504 ) ( CLEAR ?auto_84501 ) ( ON ?auto_84502 ?auto_84503 ) ( CLEAR ?auto_84502 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_84497 ?auto_84498 ?auto_84499 ?auto_84500 ?auto_84501 ?auto_84502 )
      ( MAKE-9PILE ?auto_84497 ?auto_84498 ?auto_84499 ?auto_84500 ?auto_84501 ?auto_84502 ?auto_84503 ?auto_84504 ?auto_84505 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_84535 - BLOCK
      ?auto_84536 - BLOCK
      ?auto_84537 - BLOCK
      ?auto_84538 - BLOCK
      ?auto_84539 - BLOCK
      ?auto_84540 - BLOCK
      ?auto_84541 - BLOCK
      ?auto_84542 - BLOCK
      ?auto_84543 - BLOCK
    )
    :vars
    (
      ?auto_84544 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_84543 ?auto_84544 ) ( ON-TABLE ?auto_84535 ) ( ON ?auto_84536 ?auto_84535 ) ( ON ?auto_84537 ?auto_84536 ) ( ON ?auto_84538 ?auto_84537 ) ( not ( = ?auto_84535 ?auto_84536 ) ) ( not ( = ?auto_84535 ?auto_84537 ) ) ( not ( = ?auto_84535 ?auto_84538 ) ) ( not ( = ?auto_84535 ?auto_84539 ) ) ( not ( = ?auto_84535 ?auto_84540 ) ) ( not ( = ?auto_84535 ?auto_84541 ) ) ( not ( = ?auto_84535 ?auto_84542 ) ) ( not ( = ?auto_84535 ?auto_84543 ) ) ( not ( = ?auto_84535 ?auto_84544 ) ) ( not ( = ?auto_84536 ?auto_84537 ) ) ( not ( = ?auto_84536 ?auto_84538 ) ) ( not ( = ?auto_84536 ?auto_84539 ) ) ( not ( = ?auto_84536 ?auto_84540 ) ) ( not ( = ?auto_84536 ?auto_84541 ) ) ( not ( = ?auto_84536 ?auto_84542 ) ) ( not ( = ?auto_84536 ?auto_84543 ) ) ( not ( = ?auto_84536 ?auto_84544 ) ) ( not ( = ?auto_84537 ?auto_84538 ) ) ( not ( = ?auto_84537 ?auto_84539 ) ) ( not ( = ?auto_84537 ?auto_84540 ) ) ( not ( = ?auto_84537 ?auto_84541 ) ) ( not ( = ?auto_84537 ?auto_84542 ) ) ( not ( = ?auto_84537 ?auto_84543 ) ) ( not ( = ?auto_84537 ?auto_84544 ) ) ( not ( = ?auto_84538 ?auto_84539 ) ) ( not ( = ?auto_84538 ?auto_84540 ) ) ( not ( = ?auto_84538 ?auto_84541 ) ) ( not ( = ?auto_84538 ?auto_84542 ) ) ( not ( = ?auto_84538 ?auto_84543 ) ) ( not ( = ?auto_84538 ?auto_84544 ) ) ( not ( = ?auto_84539 ?auto_84540 ) ) ( not ( = ?auto_84539 ?auto_84541 ) ) ( not ( = ?auto_84539 ?auto_84542 ) ) ( not ( = ?auto_84539 ?auto_84543 ) ) ( not ( = ?auto_84539 ?auto_84544 ) ) ( not ( = ?auto_84540 ?auto_84541 ) ) ( not ( = ?auto_84540 ?auto_84542 ) ) ( not ( = ?auto_84540 ?auto_84543 ) ) ( not ( = ?auto_84540 ?auto_84544 ) ) ( not ( = ?auto_84541 ?auto_84542 ) ) ( not ( = ?auto_84541 ?auto_84543 ) ) ( not ( = ?auto_84541 ?auto_84544 ) ) ( not ( = ?auto_84542 ?auto_84543 ) ) ( not ( = ?auto_84542 ?auto_84544 ) ) ( not ( = ?auto_84543 ?auto_84544 ) ) ( ON ?auto_84542 ?auto_84543 ) ( ON ?auto_84541 ?auto_84542 ) ( ON ?auto_84540 ?auto_84541 ) ( CLEAR ?auto_84538 ) ( ON ?auto_84539 ?auto_84540 ) ( CLEAR ?auto_84539 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_84535 ?auto_84536 ?auto_84537 ?auto_84538 ?auto_84539 )
      ( MAKE-9PILE ?auto_84535 ?auto_84536 ?auto_84537 ?auto_84538 ?auto_84539 ?auto_84540 ?auto_84541 ?auto_84542 ?auto_84543 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_84573 - BLOCK
      ?auto_84574 - BLOCK
      ?auto_84575 - BLOCK
      ?auto_84576 - BLOCK
      ?auto_84577 - BLOCK
      ?auto_84578 - BLOCK
      ?auto_84579 - BLOCK
      ?auto_84580 - BLOCK
      ?auto_84581 - BLOCK
    )
    :vars
    (
      ?auto_84582 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_84581 ?auto_84582 ) ( ON-TABLE ?auto_84573 ) ( ON ?auto_84574 ?auto_84573 ) ( ON ?auto_84575 ?auto_84574 ) ( not ( = ?auto_84573 ?auto_84574 ) ) ( not ( = ?auto_84573 ?auto_84575 ) ) ( not ( = ?auto_84573 ?auto_84576 ) ) ( not ( = ?auto_84573 ?auto_84577 ) ) ( not ( = ?auto_84573 ?auto_84578 ) ) ( not ( = ?auto_84573 ?auto_84579 ) ) ( not ( = ?auto_84573 ?auto_84580 ) ) ( not ( = ?auto_84573 ?auto_84581 ) ) ( not ( = ?auto_84573 ?auto_84582 ) ) ( not ( = ?auto_84574 ?auto_84575 ) ) ( not ( = ?auto_84574 ?auto_84576 ) ) ( not ( = ?auto_84574 ?auto_84577 ) ) ( not ( = ?auto_84574 ?auto_84578 ) ) ( not ( = ?auto_84574 ?auto_84579 ) ) ( not ( = ?auto_84574 ?auto_84580 ) ) ( not ( = ?auto_84574 ?auto_84581 ) ) ( not ( = ?auto_84574 ?auto_84582 ) ) ( not ( = ?auto_84575 ?auto_84576 ) ) ( not ( = ?auto_84575 ?auto_84577 ) ) ( not ( = ?auto_84575 ?auto_84578 ) ) ( not ( = ?auto_84575 ?auto_84579 ) ) ( not ( = ?auto_84575 ?auto_84580 ) ) ( not ( = ?auto_84575 ?auto_84581 ) ) ( not ( = ?auto_84575 ?auto_84582 ) ) ( not ( = ?auto_84576 ?auto_84577 ) ) ( not ( = ?auto_84576 ?auto_84578 ) ) ( not ( = ?auto_84576 ?auto_84579 ) ) ( not ( = ?auto_84576 ?auto_84580 ) ) ( not ( = ?auto_84576 ?auto_84581 ) ) ( not ( = ?auto_84576 ?auto_84582 ) ) ( not ( = ?auto_84577 ?auto_84578 ) ) ( not ( = ?auto_84577 ?auto_84579 ) ) ( not ( = ?auto_84577 ?auto_84580 ) ) ( not ( = ?auto_84577 ?auto_84581 ) ) ( not ( = ?auto_84577 ?auto_84582 ) ) ( not ( = ?auto_84578 ?auto_84579 ) ) ( not ( = ?auto_84578 ?auto_84580 ) ) ( not ( = ?auto_84578 ?auto_84581 ) ) ( not ( = ?auto_84578 ?auto_84582 ) ) ( not ( = ?auto_84579 ?auto_84580 ) ) ( not ( = ?auto_84579 ?auto_84581 ) ) ( not ( = ?auto_84579 ?auto_84582 ) ) ( not ( = ?auto_84580 ?auto_84581 ) ) ( not ( = ?auto_84580 ?auto_84582 ) ) ( not ( = ?auto_84581 ?auto_84582 ) ) ( ON ?auto_84580 ?auto_84581 ) ( ON ?auto_84579 ?auto_84580 ) ( ON ?auto_84578 ?auto_84579 ) ( ON ?auto_84577 ?auto_84578 ) ( CLEAR ?auto_84575 ) ( ON ?auto_84576 ?auto_84577 ) ( CLEAR ?auto_84576 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_84573 ?auto_84574 ?auto_84575 ?auto_84576 )
      ( MAKE-9PILE ?auto_84573 ?auto_84574 ?auto_84575 ?auto_84576 ?auto_84577 ?auto_84578 ?auto_84579 ?auto_84580 ?auto_84581 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_84611 - BLOCK
      ?auto_84612 - BLOCK
      ?auto_84613 - BLOCK
      ?auto_84614 - BLOCK
      ?auto_84615 - BLOCK
      ?auto_84616 - BLOCK
      ?auto_84617 - BLOCK
      ?auto_84618 - BLOCK
      ?auto_84619 - BLOCK
    )
    :vars
    (
      ?auto_84620 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_84619 ?auto_84620 ) ( ON-TABLE ?auto_84611 ) ( ON ?auto_84612 ?auto_84611 ) ( not ( = ?auto_84611 ?auto_84612 ) ) ( not ( = ?auto_84611 ?auto_84613 ) ) ( not ( = ?auto_84611 ?auto_84614 ) ) ( not ( = ?auto_84611 ?auto_84615 ) ) ( not ( = ?auto_84611 ?auto_84616 ) ) ( not ( = ?auto_84611 ?auto_84617 ) ) ( not ( = ?auto_84611 ?auto_84618 ) ) ( not ( = ?auto_84611 ?auto_84619 ) ) ( not ( = ?auto_84611 ?auto_84620 ) ) ( not ( = ?auto_84612 ?auto_84613 ) ) ( not ( = ?auto_84612 ?auto_84614 ) ) ( not ( = ?auto_84612 ?auto_84615 ) ) ( not ( = ?auto_84612 ?auto_84616 ) ) ( not ( = ?auto_84612 ?auto_84617 ) ) ( not ( = ?auto_84612 ?auto_84618 ) ) ( not ( = ?auto_84612 ?auto_84619 ) ) ( not ( = ?auto_84612 ?auto_84620 ) ) ( not ( = ?auto_84613 ?auto_84614 ) ) ( not ( = ?auto_84613 ?auto_84615 ) ) ( not ( = ?auto_84613 ?auto_84616 ) ) ( not ( = ?auto_84613 ?auto_84617 ) ) ( not ( = ?auto_84613 ?auto_84618 ) ) ( not ( = ?auto_84613 ?auto_84619 ) ) ( not ( = ?auto_84613 ?auto_84620 ) ) ( not ( = ?auto_84614 ?auto_84615 ) ) ( not ( = ?auto_84614 ?auto_84616 ) ) ( not ( = ?auto_84614 ?auto_84617 ) ) ( not ( = ?auto_84614 ?auto_84618 ) ) ( not ( = ?auto_84614 ?auto_84619 ) ) ( not ( = ?auto_84614 ?auto_84620 ) ) ( not ( = ?auto_84615 ?auto_84616 ) ) ( not ( = ?auto_84615 ?auto_84617 ) ) ( not ( = ?auto_84615 ?auto_84618 ) ) ( not ( = ?auto_84615 ?auto_84619 ) ) ( not ( = ?auto_84615 ?auto_84620 ) ) ( not ( = ?auto_84616 ?auto_84617 ) ) ( not ( = ?auto_84616 ?auto_84618 ) ) ( not ( = ?auto_84616 ?auto_84619 ) ) ( not ( = ?auto_84616 ?auto_84620 ) ) ( not ( = ?auto_84617 ?auto_84618 ) ) ( not ( = ?auto_84617 ?auto_84619 ) ) ( not ( = ?auto_84617 ?auto_84620 ) ) ( not ( = ?auto_84618 ?auto_84619 ) ) ( not ( = ?auto_84618 ?auto_84620 ) ) ( not ( = ?auto_84619 ?auto_84620 ) ) ( ON ?auto_84618 ?auto_84619 ) ( ON ?auto_84617 ?auto_84618 ) ( ON ?auto_84616 ?auto_84617 ) ( ON ?auto_84615 ?auto_84616 ) ( ON ?auto_84614 ?auto_84615 ) ( CLEAR ?auto_84612 ) ( ON ?auto_84613 ?auto_84614 ) ( CLEAR ?auto_84613 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_84611 ?auto_84612 ?auto_84613 )
      ( MAKE-9PILE ?auto_84611 ?auto_84612 ?auto_84613 ?auto_84614 ?auto_84615 ?auto_84616 ?auto_84617 ?auto_84618 ?auto_84619 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_84649 - BLOCK
      ?auto_84650 - BLOCK
      ?auto_84651 - BLOCK
      ?auto_84652 - BLOCK
      ?auto_84653 - BLOCK
      ?auto_84654 - BLOCK
      ?auto_84655 - BLOCK
      ?auto_84656 - BLOCK
      ?auto_84657 - BLOCK
    )
    :vars
    (
      ?auto_84658 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_84657 ?auto_84658 ) ( ON-TABLE ?auto_84649 ) ( not ( = ?auto_84649 ?auto_84650 ) ) ( not ( = ?auto_84649 ?auto_84651 ) ) ( not ( = ?auto_84649 ?auto_84652 ) ) ( not ( = ?auto_84649 ?auto_84653 ) ) ( not ( = ?auto_84649 ?auto_84654 ) ) ( not ( = ?auto_84649 ?auto_84655 ) ) ( not ( = ?auto_84649 ?auto_84656 ) ) ( not ( = ?auto_84649 ?auto_84657 ) ) ( not ( = ?auto_84649 ?auto_84658 ) ) ( not ( = ?auto_84650 ?auto_84651 ) ) ( not ( = ?auto_84650 ?auto_84652 ) ) ( not ( = ?auto_84650 ?auto_84653 ) ) ( not ( = ?auto_84650 ?auto_84654 ) ) ( not ( = ?auto_84650 ?auto_84655 ) ) ( not ( = ?auto_84650 ?auto_84656 ) ) ( not ( = ?auto_84650 ?auto_84657 ) ) ( not ( = ?auto_84650 ?auto_84658 ) ) ( not ( = ?auto_84651 ?auto_84652 ) ) ( not ( = ?auto_84651 ?auto_84653 ) ) ( not ( = ?auto_84651 ?auto_84654 ) ) ( not ( = ?auto_84651 ?auto_84655 ) ) ( not ( = ?auto_84651 ?auto_84656 ) ) ( not ( = ?auto_84651 ?auto_84657 ) ) ( not ( = ?auto_84651 ?auto_84658 ) ) ( not ( = ?auto_84652 ?auto_84653 ) ) ( not ( = ?auto_84652 ?auto_84654 ) ) ( not ( = ?auto_84652 ?auto_84655 ) ) ( not ( = ?auto_84652 ?auto_84656 ) ) ( not ( = ?auto_84652 ?auto_84657 ) ) ( not ( = ?auto_84652 ?auto_84658 ) ) ( not ( = ?auto_84653 ?auto_84654 ) ) ( not ( = ?auto_84653 ?auto_84655 ) ) ( not ( = ?auto_84653 ?auto_84656 ) ) ( not ( = ?auto_84653 ?auto_84657 ) ) ( not ( = ?auto_84653 ?auto_84658 ) ) ( not ( = ?auto_84654 ?auto_84655 ) ) ( not ( = ?auto_84654 ?auto_84656 ) ) ( not ( = ?auto_84654 ?auto_84657 ) ) ( not ( = ?auto_84654 ?auto_84658 ) ) ( not ( = ?auto_84655 ?auto_84656 ) ) ( not ( = ?auto_84655 ?auto_84657 ) ) ( not ( = ?auto_84655 ?auto_84658 ) ) ( not ( = ?auto_84656 ?auto_84657 ) ) ( not ( = ?auto_84656 ?auto_84658 ) ) ( not ( = ?auto_84657 ?auto_84658 ) ) ( ON ?auto_84656 ?auto_84657 ) ( ON ?auto_84655 ?auto_84656 ) ( ON ?auto_84654 ?auto_84655 ) ( ON ?auto_84653 ?auto_84654 ) ( ON ?auto_84652 ?auto_84653 ) ( ON ?auto_84651 ?auto_84652 ) ( CLEAR ?auto_84649 ) ( ON ?auto_84650 ?auto_84651 ) ( CLEAR ?auto_84650 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_84649 ?auto_84650 )
      ( MAKE-9PILE ?auto_84649 ?auto_84650 ?auto_84651 ?auto_84652 ?auto_84653 ?auto_84654 ?auto_84655 ?auto_84656 ?auto_84657 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_84687 - BLOCK
      ?auto_84688 - BLOCK
      ?auto_84689 - BLOCK
      ?auto_84690 - BLOCK
      ?auto_84691 - BLOCK
      ?auto_84692 - BLOCK
      ?auto_84693 - BLOCK
      ?auto_84694 - BLOCK
      ?auto_84695 - BLOCK
    )
    :vars
    (
      ?auto_84696 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_84695 ?auto_84696 ) ( not ( = ?auto_84687 ?auto_84688 ) ) ( not ( = ?auto_84687 ?auto_84689 ) ) ( not ( = ?auto_84687 ?auto_84690 ) ) ( not ( = ?auto_84687 ?auto_84691 ) ) ( not ( = ?auto_84687 ?auto_84692 ) ) ( not ( = ?auto_84687 ?auto_84693 ) ) ( not ( = ?auto_84687 ?auto_84694 ) ) ( not ( = ?auto_84687 ?auto_84695 ) ) ( not ( = ?auto_84687 ?auto_84696 ) ) ( not ( = ?auto_84688 ?auto_84689 ) ) ( not ( = ?auto_84688 ?auto_84690 ) ) ( not ( = ?auto_84688 ?auto_84691 ) ) ( not ( = ?auto_84688 ?auto_84692 ) ) ( not ( = ?auto_84688 ?auto_84693 ) ) ( not ( = ?auto_84688 ?auto_84694 ) ) ( not ( = ?auto_84688 ?auto_84695 ) ) ( not ( = ?auto_84688 ?auto_84696 ) ) ( not ( = ?auto_84689 ?auto_84690 ) ) ( not ( = ?auto_84689 ?auto_84691 ) ) ( not ( = ?auto_84689 ?auto_84692 ) ) ( not ( = ?auto_84689 ?auto_84693 ) ) ( not ( = ?auto_84689 ?auto_84694 ) ) ( not ( = ?auto_84689 ?auto_84695 ) ) ( not ( = ?auto_84689 ?auto_84696 ) ) ( not ( = ?auto_84690 ?auto_84691 ) ) ( not ( = ?auto_84690 ?auto_84692 ) ) ( not ( = ?auto_84690 ?auto_84693 ) ) ( not ( = ?auto_84690 ?auto_84694 ) ) ( not ( = ?auto_84690 ?auto_84695 ) ) ( not ( = ?auto_84690 ?auto_84696 ) ) ( not ( = ?auto_84691 ?auto_84692 ) ) ( not ( = ?auto_84691 ?auto_84693 ) ) ( not ( = ?auto_84691 ?auto_84694 ) ) ( not ( = ?auto_84691 ?auto_84695 ) ) ( not ( = ?auto_84691 ?auto_84696 ) ) ( not ( = ?auto_84692 ?auto_84693 ) ) ( not ( = ?auto_84692 ?auto_84694 ) ) ( not ( = ?auto_84692 ?auto_84695 ) ) ( not ( = ?auto_84692 ?auto_84696 ) ) ( not ( = ?auto_84693 ?auto_84694 ) ) ( not ( = ?auto_84693 ?auto_84695 ) ) ( not ( = ?auto_84693 ?auto_84696 ) ) ( not ( = ?auto_84694 ?auto_84695 ) ) ( not ( = ?auto_84694 ?auto_84696 ) ) ( not ( = ?auto_84695 ?auto_84696 ) ) ( ON ?auto_84694 ?auto_84695 ) ( ON ?auto_84693 ?auto_84694 ) ( ON ?auto_84692 ?auto_84693 ) ( ON ?auto_84691 ?auto_84692 ) ( ON ?auto_84690 ?auto_84691 ) ( ON ?auto_84689 ?auto_84690 ) ( ON ?auto_84688 ?auto_84689 ) ( ON ?auto_84687 ?auto_84688 ) ( CLEAR ?auto_84687 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_84687 )
      ( MAKE-9PILE ?auto_84687 ?auto_84688 ?auto_84689 ?auto_84690 ?auto_84691 ?auto_84692 ?auto_84693 ?auto_84694 ?auto_84695 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_84726 - BLOCK
      ?auto_84727 - BLOCK
      ?auto_84728 - BLOCK
      ?auto_84729 - BLOCK
      ?auto_84730 - BLOCK
      ?auto_84731 - BLOCK
      ?auto_84732 - BLOCK
      ?auto_84733 - BLOCK
      ?auto_84734 - BLOCK
      ?auto_84735 - BLOCK
    )
    :vars
    (
      ?auto_84736 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_84734 ) ( ON ?auto_84735 ?auto_84736 ) ( CLEAR ?auto_84735 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_84726 ) ( ON ?auto_84727 ?auto_84726 ) ( ON ?auto_84728 ?auto_84727 ) ( ON ?auto_84729 ?auto_84728 ) ( ON ?auto_84730 ?auto_84729 ) ( ON ?auto_84731 ?auto_84730 ) ( ON ?auto_84732 ?auto_84731 ) ( ON ?auto_84733 ?auto_84732 ) ( ON ?auto_84734 ?auto_84733 ) ( not ( = ?auto_84726 ?auto_84727 ) ) ( not ( = ?auto_84726 ?auto_84728 ) ) ( not ( = ?auto_84726 ?auto_84729 ) ) ( not ( = ?auto_84726 ?auto_84730 ) ) ( not ( = ?auto_84726 ?auto_84731 ) ) ( not ( = ?auto_84726 ?auto_84732 ) ) ( not ( = ?auto_84726 ?auto_84733 ) ) ( not ( = ?auto_84726 ?auto_84734 ) ) ( not ( = ?auto_84726 ?auto_84735 ) ) ( not ( = ?auto_84726 ?auto_84736 ) ) ( not ( = ?auto_84727 ?auto_84728 ) ) ( not ( = ?auto_84727 ?auto_84729 ) ) ( not ( = ?auto_84727 ?auto_84730 ) ) ( not ( = ?auto_84727 ?auto_84731 ) ) ( not ( = ?auto_84727 ?auto_84732 ) ) ( not ( = ?auto_84727 ?auto_84733 ) ) ( not ( = ?auto_84727 ?auto_84734 ) ) ( not ( = ?auto_84727 ?auto_84735 ) ) ( not ( = ?auto_84727 ?auto_84736 ) ) ( not ( = ?auto_84728 ?auto_84729 ) ) ( not ( = ?auto_84728 ?auto_84730 ) ) ( not ( = ?auto_84728 ?auto_84731 ) ) ( not ( = ?auto_84728 ?auto_84732 ) ) ( not ( = ?auto_84728 ?auto_84733 ) ) ( not ( = ?auto_84728 ?auto_84734 ) ) ( not ( = ?auto_84728 ?auto_84735 ) ) ( not ( = ?auto_84728 ?auto_84736 ) ) ( not ( = ?auto_84729 ?auto_84730 ) ) ( not ( = ?auto_84729 ?auto_84731 ) ) ( not ( = ?auto_84729 ?auto_84732 ) ) ( not ( = ?auto_84729 ?auto_84733 ) ) ( not ( = ?auto_84729 ?auto_84734 ) ) ( not ( = ?auto_84729 ?auto_84735 ) ) ( not ( = ?auto_84729 ?auto_84736 ) ) ( not ( = ?auto_84730 ?auto_84731 ) ) ( not ( = ?auto_84730 ?auto_84732 ) ) ( not ( = ?auto_84730 ?auto_84733 ) ) ( not ( = ?auto_84730 ?auto_84734 ) ) ( not ( = ?auto_84730 ?auto_84735 ) ) ( not ( = ?auto_84730 ?auto_84736 ) ) ( not ( = ?auto_84731 ?auto_84732 ) ) ( not ( = ?auto_84731 ?auto_84733 ) ) ( not ( = ?auto_84731 ?auto_84734 ) ) ( not ( = ?auto_84731 ?auto_84735 ) ) ( not ( = ?auto_84731 ?auto_84736 ) ) ( not ( = ?auto_84732 ?auto_84733 ) ) ( not ( = ?auto_84732 ?auto_84734 ) ) ( not ( = ?auto_84732 ?auto_84735 ) ) ( not ( = ?auto_84732 ?auto_84736 ) ) ( not ( = ?auto_84733 ?auto_84734 ) ) ( not ( = ?auto_84733 ?auto_84735 ) ) ( not ( = ?auto_84733 ?auto_84736 ) ) ( not ( = ?auto_84734 ?auto_84735 ) ) ( not ( = ?auto_84734 ?auto_84736 ) ) ( not ( = ?auto_84735 ?auto_84736 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_84735 ?auto_84736 )
      ( !STACK ?auto_84735 ?auto_84734 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_84747 - BLOCK
      ?auto_84748 - BLOCK
      ?auto_84749 - BLOCK
      ?auto_84750 - BLOCK
      ?auto_84751 - BLOCK
      ?auto_84752 - BLOCK
      ?auto_84753 - BLOCK
      ?auto_84754 - BLOCK
      ?auto_84755 - BLOCK
      ?auto_84756 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_84755 ) ( ON-TABLE ?auto_84756 ) ( CLEAR ?auto_84756 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_84747 ) ( ON ?auto_84748 ?auto_84747 ) ( ON ?auto_84749 ?auto_84748 ) ( ON ?auto_84750 ?auto_84749 ) ( ON ?auto_84751 ?auto_84750 ) ( ON ?auto_84752 ?auto_84751 ) ( ON ?auto_84753 ?auto_84752 ) ( ON ?auto_84754 ?auto_84753 ) ( ON ?auto_84755 ?auto_84754 ) ( not ( = ?auto_84747 ?auto_84748 ) ) ( not ( = ?auto_84747 ?auto_84749 ) ) ( not ( = ?auto_84747 ?auto_84750 ) ) ( not ( = ?auto_84747 ?auto_84751 ) ) ( not ( = ?auto_84747 ?auto_84752 ) ) ( not ( = ?auto_84747 ?auto_84753 ) ) ( not ( = ?auto_84747 ?auto_84754 ) ) ( not ( = ?auto_84747 ?auto_84755 ) ) ( not ( = ?auto_84747 ?auto_84756 ) ) ( not ( = ?auto_84748 ?auto_84749 ) ) ( not ( = ?auto_84748 ?auto_84750 ) ) ( not ( = ?auto_84748 ?auto_84751 ) ) ( not ( = ?auto_84748 ?auto_84752 ) ) ( not ( = ?auto_84748 ?auto_84753 ) ) ( not ( = ?auto_84748 ?auto_84754 ) ) ( not ( = ?auto_84748 ?auto_84755 ) ) ( not ( = ?auto_84748 ?auto_84756 ) ) ( not ( = ?auto_84749 ?auto_84750 ) ) ( not ( = ?auto_84749 ?auto_84751 ) ) ( not ( = ?auto_84749 ?auto_84752 ) ) ( not ( = ?auto_84749 ?auto_84753 ) ) ( not ( = ?auto_84749 ?auto_84754 ) ) ( not ( = ?auto_84749 ?auto_84755 ) ) ( not ( = ?auto_84749 ?auto_84756 ) ) ( not ( = ?auto_84750 ?auto_84751 ) ) ( not ( = ?auto_84750 ?auto_84752 ) ) ( not ( = ?auto_84750 ?auto_84753 ) ) ( not ( = ?auto_84750 ?auto_84754 ) ) ( not ( = ?auto_84750 ?auto_84755 ) ) ( not ( = ?auto_84750 ?auto_84756 ) ) ( not ( = ?auto_84751 ?auto_84752 ) ) ( not ( = ?auto_84751 ?auto_84753 ) ) ( not ( = ?auto_84751 ?auto_84754 ) ) ( not ( = ?auto_84751 ?auto_84755 ) ) ( not ( = ?auto_84751 ?auto_84756 ) ) ( not ( = ?auto_84752 ?auto_84753 ) ) ( not ( = ?auto_84752 ?auto_84754 ) ) ( not ( = ?auto_84752 ?auto_84755 ) ) ( not ( = ?auto_84752 ?auto_84756 ) ) ( not ( = ?auto_84753 ?auto_84754 ) ) ( not ( = ?auto_84753 ?auto_84755 ) ) ( not ( = ?auto_84753 ?auto_84756 ) ) ( not ( = ?auto_84754 ?auto_84755 ) ) ( not ( = ?auto_84754 ?auto_84756 ) ) ( not ( = ?auto_84755 ?auto_84756 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_84756 )
      ( !STACK ?auto_84756 ?auto_84755 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_84767 - BLOCK
      ?auto_84768 - BLOCK
      ?auto_84769 - BLOCK
      ?auto_84770 - BLOCK
      ?auto_84771 - BLOCK
      ?auto_84772 - BLOCK
      ?auto_84773 - BLOCK
      ?auto_84774 - BLOCK
      ?auto_84775 - BLOCK
      ?auto_84776 - BLOCK
    )
    :vars
    (
      ?auto_84777 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_84776 ?auto_84777 ) ( ON-TABLE ?auto_84767 ) ( ON ?auto_84768 ?auto_84767 ) ( ON ?auto_84769 ?auto_84768 ) ( ON ?auto_84770 ?auto_84769 ) ( ON ?auto_84771 ?auto_84770 ) ( ON ?auto_84772 ?auto_84771 ) ( ON ?auto_84773 ?auto_84772 ) ( ON ?auto_84774 ?auto_84773 ) ( not ( = ?auto_84767 ?auto_84768 ) ) ( not ( = ?auto_84767 ?auto_84769 ) ) ( not ( = ?auto_84767 ?auto_84770 ) ) ( not ( = ?auto_84767 ?auto_84771 ) ) ( not ( = ?auto_84767 ?auto_84772 ) ) ( not ( = ?auto_84767 ?auto_84773 ) ) ( not ( = ?auto_84767 ?auto_84774 ) ) ( not ( = ?auto_84767 ?auto_84775 ) ) ( not ( = ?auto_84767 ?auto_84776 ) ) ( not ( = ?auto_84767 ?auto_84777 ) ) ( not ( = ?auto_84768 ?auto_84769 ) ) ( not ( = ?auto_84768 ?auto_84770 ) ) ( not ( = ?auto_84768 ?auto_84771 ) ) ( not ( = ?auto_84768 ?auto_84772 ) ) ( not ( = ?auto_84768 ?auto_84773 ) ) ( not ( = ?auto_84768 ?auto_84774 ) ) ( not ( = ?auto_84768 ?auto_84775 ) ) ( not ( = ?auto_84768 ?auto_84776 ) ) ( not ( = ?auto_84768 ?auto_84777 ) ) ( not ( = ?auto_84769 ?auto_84770 ) ) ( not ( = ?auto_84769 ?auto_84771 ) ) ( not ( = ?auto_84769 ?auto_84772 ) ) ( not ( = ?auto_84769 ?auto_84773 ) ) ( not ( = ?auto_84769 ?auto_84774 ) ) ( not ( = ?auto_84769 ?auto_84775 ) ) ( not ( = ?auto_84769 ?auto_84776 ) ) ( not ( = ?auto_84769 ?auto_84777 ) ) ( not ( = ?auto_84770 ?auto_84771 ) ) ( not ( = ?auto_84770 ?auto_84772 ) ) ( not ( = ?auto_84770 ?auto_84773 ) ) ( not ( = ?auto_84770 ?auto_84774 ) ) ( not ( = ?auto_84770 ?auto_84775 ) ) ( not ( = ?auto_84770 ?auto_84776 ) ) ( not ( = ?auto_84770 ?auto_84777 ) ) ( not ( = ?auto_84771 ?auto_84772 ) ) ( not ( = ?auto_84771 ?auto_84773 ) ) ( not ( = ?auto_84771 ?auto_84774 ) ) ( not ( = ?auto_84771 ?auto_84775 ) ) ( not ( = ?auto_84771 ?auto_84776 ) ) ( not ( = ?auto_84771 ?auto_84777 ) ) ( not ( = ?auto_84772 ?auto_84773 ) ) ( not ( = ?auto_84772 ?auto_84774 ) ) ( not ( = ?auto_84772 ?auto_84775 ) ) ( not ( = ?auto_84772 ?auto_84776 ) ) ( not ( = ?auto_84772 ?auto_84777 ) ) ( not ( = ?auto_84773 ?auto_84774 ) ) ( not ( = ?auto_84773 ?auto_84775 ) ) ( not ( = ?auto_84773 ?auto_84776 ) ) ( not ( = ?auto_84773 ?auto_84777 ) ) ( not ( = ?auto_84774 ?auto_84775 ) ) ( not ( = ?auto_84774 ?auto_84776 ) ) ( not ( = ?auto_84774 ?auto_84777 ) ) ( not ( = ?auto_84775 ?auto_84776 ) ) ( not ( = ?auto_84775 ?auto_84777 ) ) ( not ( = ?auto_84776 ?auto_84777 ) ) ( CLEAR ?auto_84774 ) ( ON ?auto_84775 ?auto_84776 ) ( CLEAR ?auto_84775 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_84767 ?auto_84768 ?auto_84769 ?auto_84770 ?auto_84771 ?auto_84772 ?auto_84773 ?auto_84774 ?auto_84775 )
      ( MAKE-10PILE ?auto_84767 ?auto_84768 ?auto_84769 ?auto_84770 ?auto_84771 ?auto_84772 ?auto_84773 ?auto_84774 ?auto_84775 ?auto_84776 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_84788 - BLOCK
      ?auto_84789 - BLOCK
      ?auto_84790 - BLOCK
      ?auto_84791 - BLOCK
      ?auto_84792 - BLOCK
      ?auto_84793 - BLOCK
      ?auto_84794 - BLOCK
      ?auto_84795 - BLOCK
      ?auto_84796 - BLOCK
      ?auto_84797 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_84797 ) ( ON-TABLE ?auto_84788 ) ( ON ?auto_84789 ?auto_84788 ) ( ON ?auto_84790 ?auto_84789 ) ( ON ?auto_84791 ?auto_84790 ) ( ON ?auto_84792 ?auto_84791 ) ( ON ?auto_84793 ?auto_84792 ) ( ON ?auto_84794 ?auto_84793 ) ( ON ?auto_84795 ?auto_84794 ) ( not ( = ?auto_84788 ?auto_84789 ) ) ( not ( = ?auto_84788 ?auto_84790 ) ) ( not ( = ?auto_84788 ?auto_84791 ) ) ( not ( = ?auto_84788 ?auto_84792 ) ) ( not ( = ?auto_84788 ?auto_84793 ) ) ( not ( = ?auto_84788 ?auto_84794 ) ) ( not ( = ?auto_84788 ?auto_84795 ) ) ( not ( = ?auto_84788 ?auto_84796 ) ) ( not ( = ?auto_84788 ?auto_84797 ) ) ( not ( = ?auto_84789 ?auto_84790 ) ) ( not ( = ?auto_84789 ?auto_84791 ) ) ( not ( = ?auto_84789 ?auto_84792 ) ) ( not ( = ?auto_84789 ?auto_84793 ) ) ( not ( = ?auto_84789 ?auto_84794 ) ) ( not ( = ?auto_84789 ?auto_84795 ) ) ( not ( = ?auto_84789 ?auto_84796 ) ) ( not ( = ?auto_84789 ?auto_84797 ) ) ( not ( = ?auto_84790 ?auto_84791 ) ) ( not ( = ?auto_84790 ?auto_84792 ) ) ( not ( = ?auto_84790 ?auto_84793 ) ) ( not ( = ?auto_84790 ?auto_84794 ) ) ( not ( = ?auto_84790 ?auto_84795 ) ) ( not ( = ?auto_84790 ?auto_84796 ) ) ( not ( = ?auto_84790 ?auto_84797 ) ) ( not ( = ?auto_84791 ?auto_84792 ) ) ( not ( = ?auto_84791 ?auto_84793 ) ) ( not ( = ?auto_84791 ?auto_84794 ) ) ( not ( = ?auto_84791 ?auto_84795 ) ) ( not ( = ?auto_84791 ?auto_84796 ) ) ( not ( = ?auto_84791 ?auto_84797 ) ) ( not ( = ?auto_84792 ?auto_84793 ) ) ( not ( = ?auto_84792 ?auto_84794 ) ) ( not ( = ?auto_84792 ?auto_84795 ) ) ( not ( = ?auto_84792 ?auto_84796 ) ) ( not ( = ?auto_84792 ?auto_84797 ) ) ( not ( = ?auto_84793 ?auto_84794 ) ) ( not ( = ?auto_84793 ?auto_84795 ) ) ( not ( = ?auto_84793 ?auto_84796 ) ) ( not ( = ?auto_84793 ?auto_84797 ) ) ( not ( = ?auto_84794 ?auto_84795 ) ) ( not ( = ?auto_84794 ?auto_84796 ) ) ( not ( = ?auto_84794 ?auto_84797 ) ) ( not ( = ?auto_84795 ?auto_84796 ) ) ( not ( = ?auto_84795 ?auto_84797 ) ) ( not ( = ?auto_84796 ?auto_84797 ) ) ( CLEAR ?auto_84795 ) ( ON ?auto_84796 ?auto_84797 ) ( CLEAR ?auto_84796 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_84788 ?auto_84789 ?auto_84790 ?auto_84791 ?auto_84792 ?auto_84793 ?auto_84794 ?auto_84795 ?auto_84796 )
      ( MAKE-10PILE ?auto_84788 ?auto_84789 ?auto_84790 ?auto_84791 ?auto_84792 ?auto_84793 ?auto_84794 ?auto_84795 ?auto_84796 ?auto_84797 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_84808 - BLOCK
      ?auto_84809 - BLOCK
      ?auto_84810 - BLOCK
      ?auto_84811 - BLOCK
      ?auto_84812 - BLOCK
      ?auto_84813 - BLOCK
      ?auto_84814 - BLOCK
      ?auto_84815 - BLOCK
      ?auto_84816 - BLOCK
      ?auto_84817 - BLOCK
    )
    :vars
    (
      ?auto_84818 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_84817 ?auto_84818 ) ( ON-TABLE ?auto_84808 ) ( ON ?auto_84809 ?auto_84808 ) ( ON ?auto_84810 ?auto_84809 ) ( ON ?auto_84811 ?auto_84810 ) ( ON ?auto_84812 ?auto_84811 ) ( ON ?auto_84813 ?auto_84812 ) ( ON ?auto_84814 ?auto_84813 ) ( not ( = ?auto_84808 ?auto_84809 ) ) ( not ( = ?auto_84808 ?auto_84810 ) ) ( not ( = ?auto_84808 ?auto_84811 ) ) ( not ( = ?auto_84808 ?auto_84812 ) ) ( not ( = ?auto_84808 ?auto_84813 ) ) ( not ( = ?auto_84808 ?auto_84814 ) ) ( not ( = ?auto_84808 ?auto_84815 ) ) ( not ( = ?auto_84808 ?auto_84816 ) ) ( not ( = ?auto_84808 ?auto_84817 ) ) ( not ( = ?auto_84808 ?auto_84818 ) ) ( not ( = ?auto_84809 ?auto_84810 ) ) ( not ( = ?auto_84809 ?auto_84811 ) ) ( not ( = ?auto_84809 ?auto_84812 ) ) ( not ( = ?auto_84809 ?auto_84813 ) ) ( not ( = ?auto_84809 ?auto_84814 ) ) ( not ( = ?auto_84809 ?auto_84815 ) ) ( not ( = ?auto_84809 ?auto_84816 ) ) ( not ( = ?auto_84809 ?auto_84817 ) ) ( not ( = ?auto_84809 ?auto_84818 ) ) ( not ( = ?auto_84810 ?auto_84811 ) ) ( not ( = ?auto_84810 ?auto_84812 ) ) ( not ( = ?auto_84810 ?auto_84813 ) ) ( not ( = ?auto_84810 ?auto_84814 ) ) ( not ( = ?auto_84810 ?auto_84815 ) ) ( not ( = ?auto_84810 ?auto_84816 ) ) ( not ( = ?auto_84810 ?auto_84817 ) ) ( not ( = ?auto_84810 ?auto_84818 ) ) ( not ( = ?auto_84811 ?auto_84812 ) ) ( not ( = ?auto_84811 ?auto_84813 ) ) ( not ( = ?auto_84811 ?auto_84814 ) ) ( not ( = ?auto_84811 ?auto_84815 ) ) ( not ( = ?auto_84811 ?auto_84816 ) ) ( not ( = ?auto_84811 ?auto_84817 ) ) ( not ( = ?auto_84811 ?auto_84818 ) ) ( not ( = ?auto_84812 ?auto_84813 ) ) ( not ( = ?auto_84812 ?auto_84814 ) ) ( not ( = ?auto_84812 ?auto_84815 ) ) ( not ( = ?auto_84812 ?auto_84816 ) ) ( not ( = ?auto_84812 ?auto_84817 ) ) ( not ( = ?auto_84812 ?auto_84818 ) ) ( not ( = ?auto_84813 ?auto_84814 ) ) ( not ( = ?auto_84813 ?auto_84815 ) ) ( not ( = ?auto_84813 ?auto_84816 ) ) ( not ( = ?auto_84813 ?auto_84817 ) ) ( not ( = ?auto_84813 ?auto_84818 ) ) ( not ( = ?auto_84814 ?auto_84815 ) ) ( not ( = ?auto_84814 ?auto_84816 ) ) ( not ( = ?auto_84814 ?auto_84817 ) ) ( not ( = ?auto_84814 ?auto_84818 ) ) ( not ( = ?auto_84815 ?auto_84816 ) ) ( not ( = ?auto_84815 ?auto_84817 ) ) ( not ( = ?auto_84815 ?auto_84818 ) ) ( not ( = ?auto_84816 ?auto_84817 ) ) ( not ( = ?auto_84816 ?auto_84818 ) ) ( not ( = ?auto_84817 ?auto_84818 ) ) ( ON ?auto_84816 ?auto_84817 ) ( CLEAR ?auto_84814 ) ( ON ?auto_84815 ?auto_84816 ) ( CLEAR ?auto_84815 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_84808 ?auto_84809 ?auto_84810 ?auto_84811 ?auto_84812 ?auto_84813 ?auto_84814 ?auto_84815 )
      ( MAKE-10PILE ?auto_84808 ?auto_84809 ?auto_84810 ?auto_84811 ?auto_84812 ?auto_84813 ?auto_84814 ?auto_84815 ?auto_84816 ?auto_84817 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_84829 - BLOCK
      ?auto_84830 - BLOCK
      ?auto_84831 - BLOCK
      ?auto_84832 - BLOCK
      ?auto_84833 - BLOCK
      ?auto_84834 - BLOCK
      ?auto_84835 - BLOCK
      ?auto_84836 - BLOCK
      ?auto_84837 - BLOCK
      ?auto_84838 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_84838 ) ( ON-TABLE ?auto_84829 ) ( ON ?auto_84830 ?auto_84829 ) ( ON ?auto_84831 ?auto_84830 ) ( ON ?auto_84832 ?auto_84831 ) ( ON ?auto_84833 ?auto_84832 ) ( ON ?auto_84834 ?auto_84833 ) ( ON ?auto_84835 ?auto_84834 ) ( not ( = ?auto_84829 ?auto_84830 ) ) ( not ( = ?auto_84829 ?auto_84831 ) ) ( not ( = ?auto_84829 ?auto_84832 ) ) ( not ( = ?auto_84829 ?auto_84833 ) ) ( not ( = ?auto_84829 ?auto_84834 ) ) ( not ( = ?auto_84829 ?auto_84835 ) ) ( not ( = ?auto_84829 ?auto_84836 ) ) ( not ( = ?auto_84829 ?auto_84837 ) ) ( not ( = ?auto_84829 ?auto_84838 ) ) ( not ( = ?auto_84830 ?auto_84831 ) ) ( not ( = ?auto_84830 ?auto_84832 ) ) ( not ( = ?auto_84830 ?auto_84833 ) ) ( not ( = ?auto_84830 ?auto_84834 ) ) ( not ( = ?auto_84830 ?auto_84835 ) ) ( not ( = ?auto_84830 ?auto_84836 ) ) ( not ( = ?auto_84830 ?auto_84837 ) ) ( not ( = ?auto_84830 ?auto_84838 ) ) ( not ( = ?auto_84831 ?auto_84832 ) ) ( not ( = ?auto_84831 ?auto_84833 ) ) ( not ( = ?auto_84831 ?auto_84834 ) ) ( not ( = ?auto_84831 ?auto_84835 ) ) ( not ( = ?auto_84831 ?auto_84836 ) ) ( not ( = ?auto_84831 ?auto_84837 ) ) ( not ( = ?auto_84831 ?auto_84838 ) ) ( not ( = ?auto_84832 ?auto_84833 ) ) ( not ( = ?auto_84832 ?auto_84834 ) ) ( not ( = ?auto_84832 ?auto_84835 ) ) ( not ( = ?auto_84832 ?auto_84836 ) ) ( not ( = ?auto_84832 ?auto_84837 ) ) ( not ( = ?auto_84832 ?auto_84838 ) ) ( not ( = ?auto_84833 ?auto_84834 ) ) ( not ( = ?auto_84833 ?auto_84835 ) ) ( not ( = ?auto_84833 ?auto_84836 ) ) ( not ( = ?auto_84833 ?auto_84837 ) ) ( not ( = ?auto_84833 ?auto_84838 ) ) ( not ( = ?auto_84834 ?auto_84835 ) ) ( not ( = ?auto_84834 ?auto_84836 ) ) ( not ( = ?auto_84834 ?auto_84837 ) ) ( not ( = ?auto_84834 ?auto_84838 ) ) ( not ( = ?auto_84835 ?auto_84836 ) ) ( not ( = ?auto_84835 ?auto_84837 ) ) ( not ( = ?auto_84835 ?auto_84838 ) ) ( not ( = ?auto_84836 ?auto_84837 ) ) ( not ( = ?auto_84836 ?auto_84838 ) ) ( not ( = ?auto_84837 ?auto_84838 ) ) ( ON ?auto_84837 ?auto_84838 ) ( CLEAR ?auto_84835 ) ( ON ?auto_84836 ?auto_84837 ) ( CLEAR ?auto_84836 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_84829 ?auto_84830 ?auto_84831 ?auto_84832 ?auto_84833 ?auto_84834 ?auto_84835 ?auto_84836 )
      ( MAKE-10PILE ?auto_84829 ?auto_84830 ?auto_84831 ?auto_84832 ?auto_84833 ?auto_84834 ?auto_84835 ?auto_84836 ?auto_84837 ?auto_84838 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_84849 - BLOCK
      ?auto_84850 - BLOCK
      ?auto_84851 - BLOCK
      ?auto_84852 - BLOCK
      ?auto_84853 - BLOCK
      ?auto_84854 - BLOCK
      ?auto_84855 - BLOCK
      ?auto_84856 - BLOCK
      ?auto_84857 - BLOCK
      ?auto_84858 - BLOCK
    )
    :vars
    (
      ?auto_84859 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_84858 ?auto_84859 ) ( ON-TABLE ?auto_84849 ) ( ON ?auto_84850 ?auto_84849 ) ( ON ?auto_84851 ?auto_84850 ) ( ON ?auto_84852 ?auto_84851 ) ( ON ?auto_84853 ?auto_84852 ) ( ON ?auto_84854 ?auto_84853 ) ( not ( = ?auto_84849 ?auto_84850 ) ) ( not ( = ?auto_84849 ?auto_84851 ) ) ( not ( = ?auto_84849 ?auto_84852 ) ) ( not ( = ?auto_84849 ?auto_84853 ) ) ( not ( = ?auto_84849 ?auto_84854 ) ) ( not ( = ?auto_84849 ?auto_84855 ) ) ( not ( = ?auto_84849 ?auto_84856 ) ) ( not ( = ?auto_84849 ?auto_84857 ) ) ( not ( = ?auto_84849 ?auto_84858 ) ) ( not ( = ?auto_84849 ?auto_84859 ) ) ( not ( = ?auto_84850 ?auto_84851 ) ) ( not ( = ?auto_84850 ?auto_84852 ) ) ( not ( = ?auto_84850 ?auto_84853 ) ) ( not ( = ?auto_84850 ?auto_84854 ) ) ( not ( = ?auto_84850 ?auto_84855 ) ) ( not ( = ?auto_84850 ?auto_84856 ) ) ( not ( = ?auto_84850 ?auto_84857 ) ) ( not ( = ?auto_84850 ?auto_84858 ) ) ( not ( = ?auto_84850 ?auto_84859 ) ) ( not ( = ?auto_84851 ?auto_84852 ) ) ( not ( = ?auto_84851 ?auto_84853 ) ) ( not ( = ?auto_84851 ?auto_84854 ) ) ( not ( = ?auto_84851 ?auto_84855 ) ) ( not ( = ?auto_84851 ?auto_84856 ) ) ( not ( = ?auto_84851 ?auto_84857 ) ) ( not ( = ?auto_84851 ?auto_84858 ) ) ( not ( = ?auto_84851 ?auto_84859 ) ) ( not ( = ?auto_84852 ?auto_84853 ) ) ( not ( = ?auto_84852 ?auto_84854 ) ) ( not ( = ?auto_84852 ?auto_84855 ) ) ( not ( = ?auto_84852 ?auto_84856 ) ) ( not ( = ?auto_84852 ?auto_84857 ) ) ( not ( = ?auto_84852 ?auto_84858 ) ) ( not ( = ?auto_84852 ?auto_84859 ) ) ( not ( = ?auto_84853 ?auto_84854 ) ) ( not ( = ?auto_84853 ?auto_84855 ) ) ( not ( = ?auto_84853 ?auto_84856 ) ) ( not ( = ?auto_84853 ?auto_84857 ) ) ( not ( = ?auto_84853 ?auto_84858 ) ) ( not ( = ?auto_84853 ?auto_84859 ) ) ( not ( = ?auto_84854 ?auto_84855 ) ) ( not ( = ?auto_84854 ?auto_84856 ) ) ( not ( = ?auto_84854 ?auto_84857 ) ) ( not ( = ?auto_84854 ?auto_84858 ) ) ( not ( = ?auto_84854 ?auto_84859 ) ) ( not ( = ?auto_84855 ?auto_84856 ) ) ( not ( = ?auto_84855 ?auto_84857 ) ) ( not ( = ?auto_84855 ?auto_84858 ) ) ( not ( = ?auto_84855 ?auto_84859 ) ) ( not ( = ?auto_84856 ?auto_84857 ) ) ( not ( = ?auto_84856 ?auto_84858 ) ) ( not ( = ?auto_84856 ?auto_84859 ) ) ( not ( = ?auto_84857 ?auto_84858 ) ) ( not ( = ?auto_84857 ?auto_84859 ) ) ( not ( = ?auto_84858 ?auto_84859 ) ) ( ON ?auto_84857 ?auto_84858 ) ( ON ?auto_84856 ?auto_84857 ) ( CLEAR ?auto_84854 ) ( ON ?auto_84855 ?auto_84856 ) ( CLEAR ?auto_84855 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_84849 ?auto_84850 ?auto_84851 ?auto_84852 ?auto_84853 ?auto_84854 ?auto_84855 )
      ( MAKE-10PILE ?auto_84849 ?auto_84850 ?auto_84851 ?auto_84852 ?auto_84853 ?auto_84854 ?auto_84855 ?auto_84856 ?auto_84857 ?auto_84858 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_84870 - BLOCK
      ?auto_84871 - BLOCK
      ?auto_84872 - BLOCK
      ?auto_84873 - BLOCK
      ?auto_84874 - BLOCK
      ?auto_84875 - BLOCK
      ?auto_84876 - BLOCK
      ?auto_84877 - BLOCK
      ?auto_84878 - BLOCK
      ?auto_84879 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_84879 ) ( ON-TABLE ?auto_84870 ) ( ON ?auto_84871 ?auto_84870 ) ( ON ?auto_84872 ?auto_84871 ) ( ON ?auto_84873 ?auto_84872 ) ( ON ?auto_84874 ?auto_84873 ) ( ON ?auto_84875 ?auto_84874 ) ( not ( = ?auto_84870 ?auto_84871 ) ) ( not ( = ?auto_84870 ?auto_84872 ) ) ( not ( = ?auto_84870 ?auto_84873 ) ) ( not ( = ?auto_84870 ?auto_84874 ) ) ( not ( = ?auto_84870 ?auto_84875 ) ) ( not ( = ?auto_84870 ?auto_84876 ) ) ( not ( = ?auto_84870 ?auto_84877 ) ) ( not ( = ?auto_84870 ?auto_84878 ) ) ( not ( = ?auto_84870 ?auto_84879 ) ) ( not ( = ?auto_84871 ?auto_84872 ) ) ( not ( = ?auto_84871 ?auto_84873 ) ) ( not ( = ?auto_84871 ?auto_84874 ) ) ( not ( = ?auto_84871 ?auto_84875 ) ) ( not ( = ?auto_84871 ?auto_84876 ) ) ( not ( = ?auto_84871 ?auto_84877 ) ) ( not ( = ?auto_84871 ?auto_84878 ) ) ( not ( = ?auto_84871 ?auto_84879 ) ) ( not ( = ?auto_84872 ?auto_84873 ) ) ( not ( = ?auto_84872 ?auto_84874 ) ) ( not ( = ?auto_84872 ?auto_84875 ) ) ( not ( = ?auto_84872 ?auto_84876 ) ) ( not ( = ?auto_84872 ?auto_84877 ) ) ( not ( = ?auto_84872 ?auto_84878 ) ) ( not ( = ?auto_84872 ?auto_84879 ) ) ( not ( = ?auto_84873 ?auto_84874 ) ) ( not ( = ?auto_84873 ?auto_84875 ) ) ( not ( = ?auto_84873 ?auto_84876 ) ) ( not ( = ?auto_84873 ?auto_84877 ) ) ( not ( = ?auto_84873 ?auto_84878 ) ) ( not ( = ?auto_84873 ?auto_84879 ) ) ( not ( = ?auto_84874 ?auto_84875 ) ) ( not ( = ?auto_84874 ?auto_84876 ) ) ( not ( = ?auto_84874 ?auto_84877 ) ) ( not ( = ?auto_84874 ?auto_84878 ) ) ( not ( = ?auto_84874 ?auto_84879 ) ) ( not ( = ?auto_84875 ?auto_84876 ) ) ( not ( = ?auto_84875 ?auto_84877 ) ) ( not ( = ?auto_84875 ?auto_84878 ) ) ( not ( = ?auto_84875 ?auto_84879 ) ) ( not ( = ?auto_84876 ?auto_84877 ) ) ( not ( = ?auto_84876 ?auto_84878 ) ) ( not ( = ?auto_84876 ?auto_84879 ) ) ( not ( = ?auto_84877 ?auto_84878 ) ) ( not ( = ?auto_84877 ?auto_84879 ) ) ( not ( = ?auto_84878 ?auto_84879 ) ) ( ON ?auto_84878 ?auto_84879 ) ( ON ?auto_84877 ?auto_84878 ) ( CLEAR ?auto_84875 ) ( ON ?auto_84876 ?auto_84877 ) ( CLEAR ?auto_84876 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_84870 ?auto_84871 ?auto_84872 ?auto_84873 ?auto_84874 ?auto_84875 ?auto_84876 )
      ( MAKE-10PILE ?auto_84870 ?auto_84871 ?auto_84872 ?auto_84873 ?auto_84874 ?auto_84875 ?auto_84876 ?auto_84877 ?auto_84878 ?auto_84879 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_84890 - BLOCK
      ?auto_84891 - BLOCK
      ?auto_84892 - BLOCK
      ?auto_84893 - BLOCK
      ?auto_84894 - BLOCK
      ?auto_84895 - BLOCK
      ?auto_84896 - BLOCK
      ?auto_84897 - BLOCK
      ?auto_84898 - BLOCK
      ?auto_84899 - BLOCK
    )
    :vars
    (
      ?auto_84900 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_84899 ?auto_84900 ) ( ON-TABLE ?auto_84890 ) ( ON ?auto_84891 ?auto_84890 ) ( ON ?auto_84892 ?auto_84891 ) ( ON ?auto_84893 ?auto_84892 ) ( ON ?auto_84894 ?auto_84893 ) ( not ( = ?auto_84890 ?auto_84891 ) ) ( not ( = ?auto_84890 ?auto_84892 ) ) ( not ( = ?auto_84890 ?auto_84893 ) ) ( not ( = ?auto_84890 ?auto_84894 ) ) ( not ( = ?auto_84890 ?auto_84895 ) ) ( not ( = ?auto_84890 ?auto_84896 ) ) ( not ( = ?auto_84890 ?auto_84897 ) ) ( not ( = ?auto_84890 ?auto_84898 ) ) ( not ( = ?auto_84890 ?auto_84899 ) ) ( not ( = ?auto_84890 ?auto_84900 ) ) ( not ( = ?auto_84891 ?auto_84892 ) ) ( not ( = ?auto_84891 ?auto_84893 ) ) ( not ( = ?auto_84891 ?auto_84894 ) ) ( not ( = ?auto_84891 ?auto_84895 ) ) ( not ( = ?auto_84891 ?auto_84896 ) ) ( not ( = ?auto_84891 ?auto_84897 ) ) ( not ( = ?auto_84891 ?auto_84898 ) ) ( not ( = ?auto_84891 ?auto_84899 ) ) ( not ( = ?auto_84891 ?auto_84900 ) ) ( not ( = ?auto_84892 ?auto_84893 ) ) ( not ( = ?auto_84892 ?auto_84894 ) ) ( not ( = ?auto_84892 ?auto_84895 ) ) ( not ( = ?auto_84892 ?auto_84896 ) ) ( not ( = ?auto_84892 ?auto_84897 ) ) ( not ( = ?auto_84892 ?auto_84898 ) ) ( not ( = ?auto_84892 ?auto_84899 ) ) ( not ( = ?auto_84892 ?auto_84900 ) ) ( not ( = ?auto_84893 ?auto_84894 ) ) ( not ( = ?auto_84893 ?auto_84895 ) ) ( not ( = ?auto_84893 ?auto_84896 ) ) ( not ( = ?auto_84893 ?auto_84897 ) ) ( not ( = ?auto_84893 ?auto_84898 ) ) ( not ( = ?auto_84893 ?auto_84899 ) ) ( not ( = ?auto_84893 ?auto_84900 ) ) ( not ( = ?auto_84894 ?auto_84895 ) ) ( not ( = ?auto_84894 ?auto_84896 ) ) ( not ( = ?auto_84894 ?auto_84897 ) ) ( not ( = ?auto_84894 ?auto_84898 ) ) ( not ( = ?auto_84894 ?auto_84899 ) ) ( not ( = ?auto_84894 ?auto_84900 ) ) ( not ( = ?auto_84895 ?auto_84896 ) ) ( not ( = ?auto_84895 ?auto_84897 ) ) ( not ( = ?auto_84895 ?auto_84898 ) ) ( not ( = ?auto_84895 ?auto_84899 ) ) ( not ( = ?auto_84895 ?auto_84900 ) ) ( not ( = ?auto_84896 ?auto_84897 ) ) ( not ( = ?auto_84896 ?auto_84898 ) ) ( not ( = ?auto_84896 ?auto_84899 ) ) ( not ( = ?auto_84896 ?auto_84900 ) ) ( not ( = ?auto_84897 ?auto_84898 ) ) ( not ( = ?auto_84897 ?auto_84899 ) ) ( not ( = ?auto_84897 ?auto_84900 ) ) ( not ( = ?auto_84898 ?auto_84899 ) ) ( not ( = ?auto_84898 ?auto_84900 ) ) ( not ( = ?auto_84899 ?auto_84900 ) ) ( ON ?auto_84898 ?auto_84899 ) ( ON ?auto_84897 ?auto_84898 ) ( ON ?auto_84896 ?auto_84897 ) ( CLEAR ?auto_84894 ) ( ON ?auto_84895 ?auto_84896 ) ( CLEAR ?auto_84895 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_84890 ?auto_84891 ?auto_84892 ?auto_84893 ?auto_84894 ?auto_84895 )
      ( MAKE-10PILE ?auto_84890 ?auto_84891 ?auto_84892 ?auto_84893 ?auto_84894 ?auto_84895 ?auto_84896 ?auto_84897 ?auto_84898 ?auto_84899 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_84911 - BLOCK
      ?auto_84912 - BLOCK
      ?auto_84913 - BLOCK
      ?auto_84914 - BLOCK
      ?auto_84915 - BLOCK
      ?auto_84916 - BLOCK
      ?auto_84917 - BLOCK
      ?auto_84918 - BLOCK
      ?auto_84919 - BLOCK
      ?auto_84920 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_84920 ) ( ON-TABLE ?auto_84911 ) ( ON ?auto_84912 ?auto_84911 ) ( ON ?auto_84913 ?auto_84912 ) ( ON ?auto_84914 ?auto_84913 ) ( ON ?auto_84915 ?auto_84914 ) ( not ( = ?auto_84911 ?auto_84912 ) ) ( not ( = ?auto_84911 ?auto_84913 ) ) ( not ( = ?auto_84911 ?auto_84914 ) ) ( not ( = ?auto_84911 ?auto_84915 ) ) ( not ( = ?auto_84911 ?auto_84916 ) ) ( not ( = ?auto_84911 ?auto_84917 ) ) ( not ( = ?auto_84911 ?auto_84918 ) ) ( not ( = ?auto_84911 ?auto_84919 ) ) ( not ( = ?auto_84911 ?auto_84920 ) ) ( not ( = ?auto_84912 ?auto_84913 ) ) ( not ( = ?auto_84912 ?auto_84914 ) ) ( not ( = ?auto_84912 ?auto_84915 ) ) ( not ( = ?auto_84912 ?auto_84916 ) ) ( not ( = ?auto_84912 ?auto_84917 ) ) ( not ( = ?auto_84912 ?auto_84918 ) ) ( not ( = ?auto_84912 ?auto_84919 ) ) ( not ( = ?auto_84912 ?auto_84920 ) ) ( not ( = ?auto_84913 ?auto_84914 ) ) ( not ( = ?auto_84913 ?auto_84915 ) ) ( not ( = ?auto_84913 ?auto_84916 ) ) ( not ( = ?auto_84913 ?auto_84917 ) ) ( not ( = ?auto_84913 ?auto_84918 ) ) ( not ( = ?auto_84913 ?auto_84919 ) ) ( not ( = ?auto_84913 ?auto_84920 ) ) ( not ( = ?auto_84914 ?auto_84915 ) ) ( not ( = ?auto_84914 ?auto_84916 ) ) ( not ( = ?auto_84914 ?auto_84917 ) ) ( not ( = ?auto_84914 ?auto_84918 ) ) ( not ( = ?auto_84914 ?auto_84919 ) ) ( not ( = ?auto_84914 ?auto_84920 ) ) ( not ( = ?auto_84915 ?auto_84916 ) ) ( not ( = ?auto_84915 ?auto_84917 ) ) ( not ( = ?auto_84915 ?auto_84918 ) ) ( not ( = ?auto_84915 ?auto_84919 ) ) ( not ( = ?auto_84915 ?auto_84920 ) ) ( not ( = ?auto_84916 ?auto_84917 ) ) ( not ( = ?auto_84916 ?auto_84918 ) ) ( not ( = ?auto_84916 ?auto_84919 ) ) ( not ( = ?auto_84916 ?auto_84920 ) ) ( not ( = ?auto_84917 ?auto_84918 ) ) ( not ( = ?auto_84917 ?auto_84919 ) ) ( not ( = ?auto_84917 ?auto_84920 ) ) ( not ( = ?auto_84918 ?auto_84919 ) ) ( not ( = ?auto_84918 ?auto_84920 ) ) ( not ( = ?auto_84919 ?auto_84920 ) ) ( ON ?auto_84919 ?auto_84920 ) ( ON ?auto_84918 ?auto_84919 ) ( ON ?auto_84917 ?auto_84918 ) ( CLEAR ?auto_84915 ) ( ON ?auto_84916 ?auto_84917 ) ( CLEAR ?auto_84916 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_84911 ?auto_84912 ?auto_84913 ?auto_84914 ?auto_84915 ?auto_84916 )
      ( MAKE-10PILE ?auto_84911 ?auto_84912 ?auto_84913 ?auto_84914 ?auto_84915 ?auto_84916 ?auto_84917 ?auto_84918 ?auto_84919 ?auto_84920 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_84931 - BLOCK
      ?auto_84932 - BLOCK
      ?auto_84933 - BLOCK
      ?auto_84934 - BLOCK
      ?auto_84935 - BLOCK
      ?auto_84936 - BLOCK
      ?auto_84937 - BLOCK
      ?auto_84938 - BLOCK
      ?auto_84939 - BLOCK
      ?auto_84940 - BLOCK
    )
    :vars
    (
      ?auto_84941 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_84940 ?auto_84941 ) ( ON-TABLE ?auto_84931 ) ( ON ?auto_84932 ?auto_84931 ) ( ON ?auto_84933 ?auto_84932 ) ( ON ?auto_84934 ?auto_84933 ) ( not ( = ?auto_84931 ?auto_84932 ) ) ( not ( = ?auto_84931 ?auto_84933 ) ) ( not ( = ?auto_84931 ?auto_84934 ) ) ( not ( = ?auto_84931 ?auto_84935 ) ) ( not ( = ?auto_84931 ?auto_84936 ) ) ( not ( = ?auto_84931 ?auto_84937 ) ) ( not ( = ?auto_84931 ?auto_84938 ) ) ( not ( = ?auto_84931 ?auto_84939 ) ) ( not ( = ?auto_84931 ?auto_84940 ) ) ( not ( = ?auto_84931 ?auto_84941 ) ) ( not ( = ?auto_84932 ?auto_84933 ) ) ( not ( = ?auto_84932 ?auto_84934 ) ) ( not ( = ?auto_84932 ?auto_84935 ) ) ( not ( = ?auto_84932 ?auto_84936 ) ) ( not ( = ?auto_84932 ?auto_84937 ) ) ( not ( = ?auto_84932 ?auto_84938 ) ) ( not ( = ?auto_84932 ?auto_84939 ) ) ( not ( = ?auto_84932 ?auto_84940 ) ) ( not ( = ?auto_84932 ?auto_84941 ) ) ( not ( = ?auto_84933 ?auto_84934 ) ) ( not ( = ?auto_84933 ?auto_84935 ) ) ( not ( = ?auto_84933 ?auto_84936 ) ) ( not ( = ?auto_84933 ?auto_84937 ) ) ( not ( = ?auto_84933 ?auto_84938 ) ) ( not ( = ?auto_84933 ?auto_84939 ) ) ( not ( = ?auto_84933 ?auto_84940 ) ) ( not ( = ?auto_84933 ?auto_84941 ) ) ( not ( = ?auto_84934 ?auto_84935 ) ) ( not ( = ?auto_84934 ?auto_84936 ) ) ( not ( = ?auto_84934 ?auto_84937 ) ) ( not ( = ?auto_84934 ?auto_84938 ) ) ( not ( = ?auto_84934 ?auto_84939 ) ) ( not ( = ?auto_84934 ?auto_84940 ) ) ( not ( = ?auto_84934 ?auto_84941 ) ) ( not ( = ?auto_84935 ?auto_84936 ) ) ( not ( = ?auto_84935 ?auto_84937 ) ) ( not ( = ?auto_84935 ?auto_84938 ) ) ( not ( = ?auto_84935 ?auto_84939 ) ) ( not ( = ?auto_84935 ?auto_84940 ) ) ( not ( = ?auto_84935 ?auto_84941 ) ) ( not ( = ?auto_84936 ?auto_84937 ) ) ( not ( = ?auto_84936 ?auto_84938 ) ) ( not ( = ?auto_84936 ?auto_84939 ) ) ( not ( = ?auto_84936 ?auto_84940 ) ) ( not ( = ?auto_84936 ?auto_84941 ) ) ( not ( = ?auto_84937 ?auto_84938 ) ) ( not ( = ?auto_84937 ?auto_84939 ) ) ( not ( = ?auto_84937 ?auto_84940 ) ) ( not ( = ?auto_84937 ?auto_84941 ) ) ( not ( = ?auto_84938 ?auto_84939 ) ) ( not ( = ?auto_84938 ?auto_84940 ) ) ( not ( = ?auto_84938 ?auto_84941 ) ) ( not ( = ?auto_84939 ?auto_84940 ) ) ( not ( = ?auto_84939 ?auto_84941 ) ) ( not ( = ?auto_84940 ?auto_84941 ) ) ( ON ?auto_84939 ?auto_84940 ) ( ON ?auto_84938 ?auto_84939 ) ( ON ?auto_84937 ?auto_84938 ) ( ON ?auto_84936 ?auto_84937 ) ( CLEAR ?auto_84934 ) ( ON ?auto_84935 ?auto_84936 ) ( CLEAR ?auto_84935 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_84931 ?auto_84932 ?auto_84933 ?auto_84934 ?auto_84935 )
      ( MAKE-10PILE ?auto_84931 ?auto_84932 ?auto_84933 ?auto_84934 ?auto_84935 ?auto_84936 ?auto_84937 ?auto_84938 ?auto_84939 ?auto_84940 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_84952 - BLOCK
      ?auto_84953 - BLOCK
      ?auto_84954 - BLOCK
      ?auto_84955 - BLOCK
      ?auto_84956 - BLOCK
      ?auto_84957 - BLOCK
      ?auto_84958 - BLOCK
      ?auto_84959 - BLOCK
      ?auto_84960 - BLOCK
      ?auto_84961 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_84961 ) ( ON-TABLE ?auto_84952 ) ( ON ?auto_84953 ?auto_84952 ) ( ON ?auto_84954 ?auto_84953 ) ( ON ?auto_84955 ?auto_84954 ) ( not ( = ?auto_84952 ?auto_84953 ) ) ( not ( = ?auto_84952 ?auto_84954 ) ) ( not ( = ?auto_84952 ?auto_84955 ) ) ( not ( = ?auto_84952 ?auto_84956 ) ) ( not ( = ?auto_84952 ?auto_84957 ) ) ( not ( = ?auto_84952 ?auto_84958 ) ) ( not ( = ?auto_84952 ?auto_84959 ) ) ( not ( = ?auto_84952 ?auto_84960 ) ) ( not ( = ?auto_84952 ?auto_84961 ) ) ( not ( = ?auto_84953 ?auto_84954 ) ) ( not ( = ?auto_84953 ?auto_84955 ) ) ( not ( = ?auto_84953 ?auto_84956 ) ) ( not ( = ?auto_84953 ?auto_84957 ) ) ( not ( = ?auto_84953 ?auto_84958 ) ) ( not ( = ?auto_84953 ?auto_84959 ) ) ( not ( = ?auto_84953 ?auto_84960 ) ) ( not ( = ?auto_84953 ?auto_84961 ) ) ( not ( = ?auto_84954 ?auto_84955 ) ) ( not ( = ?auto_84954 ?auto_84956 ) ) ( not ( = ?auto_84954 ?auto_84957 ) ) ( not ( = ?auto_84954 ?auto_84958 ) ) ( not ( = ?auto_84954 ?auto_84959 ) ) ( not ( = ?auto_84954 ?auto_84960 ) ) ( not ( = ?auto_84954 ?auto_84961 ) ) ( not ( = ?auto_84955 ?auto_84956 ) ) ( not ( = ?auto_84955 ?auto_84957 ) ) ( not ( = ?auto_84955 ?auto_84958 ) ) ( not ( = ?auto_84955 ?auto_84959 ) ) ( not ( = ?auto_84955 ?auto_84960 ) ) ( not ( = ?auto_84955 ?auto_84961 ) ) ( not ( = ?auto_84956 ?auto_84957 ) ) ( not ( = ?auto_84956 ?auto_84958 ) ) ( not ( = ?auto_84956 ?auto_84959 ) ) ( not ( = ?auto_84956 ?auto_84960 ) ) ( not ( = ?auto_84956 ?auto_84961 ) ) ( not ( = ?auto_84957 ?auto_84958 ) ) ( not ( = ?auto_84957 ?auto_84959 ) ) ( not ( = ?auto_84957 ?auto_84960 ) ) ( not ( = ?auto_84957 ?auto_84961 ) ) ( not ( = ?auto_84958 ?auto_84959 ) ) ( not ( = ?auto_84958 ?auto_84960 ) ) ( not ( = ?auto_84958 ?auto_84961 ) ) ( not ( = ?auto_84959 ?auto_84960 ) ) ( not ( = ?auto_84959 ?auto_84961 ) ) ( not ( = ?auto_84960 ?auto_84961 ) ) ( ON ?auto_84960 ?auto_84961 ) ( ON ?auto_84959 ?auto_84960 ) ( ON ?auto_84958 ?auto_84959 ) ( ON ?auto_84957 ?auto_84958 ) ( CLEAR ?auto_84955 ) ( ON ?auto_84956 ?auto_84957 ) ( CLEAR ?auto_84956 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_84952 ?auto_84953 ?auto_84954 ?auto_84955 ?auto_84956 )
      ( MAKE-10PILE ?auto_84952 ?auto_84953 ?auto_84954 ?auto_84955 ?auto_84956 ?auto_84957 ?auto_84958 ?auto_84959 ?auto_84960 ?auto_84961 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_84972 - BLOCK
      ?auto_84973 - BLOCK
      ?auto_84974 - BLOCK
      ?auto_84975 - BLOCK
      ?auto_84976 - BLOCK
      ?auto_84977 - BLOCK
      ?auto_84978 - BLOCK
      ?auto_84979 - BLOCK
      ?auto_84980 - BLOCK
      ?auto_84981 - BLOCK
    )
    :vars
    (
      ?auto_84982 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_84981 ?auto_84982 ) ( ON-TABLE ?auto_84972 ) ( ON ?auto_84973 ?auto_84972 ) ( ON ?auto_84974 ?auto_84973 ) ( not ( = ?auto_84972 ?auto_84973 ) ) ( not ( = ?auto_84972 ?auto_84974 ) ) ( not ( = ?auto_84972 ?auto_84975 ) ) ( not ( = ?auto_84972 ?auto_84976 ) ) ( not ( = ?auto_84972 ?auto_84977 ) ) ( not ( = ?auto_84972 ?auto_84978 ) ) ( not ( = ?auto_84972 ?auto_84979 ) ) ( not ( = ?auto_84972 ?auto_84980 ) ) ( not ( = ?auto_84972 ?auto_84981 ) ) ( not ( = ?auto_84972 ?auto_84982 ) ) ( not ( = ?auto_84973 ?auto_84974 ) ) ( not ( = ?auto_84973 ?auto_84975 ) ) ( not ( = ?auto_84973 ?auto_84976 ) ) ( not ( = ?auto_84973 ?auto_84977 ) ) ( not ( = ?auto_84973 ?auto_84978 ) ) ( not ( = ?auto_84973 ?auto_84979 ) ) ( not ( = ?auto_84973 ?auto_84980 ) ) ( not ( = ?auto_84973 ?auto_84981 ) ) ( not ( = ?auto_84973 ?auto_84982 ) ) ( not ( = ?auto_84974 ?auto_84975 ) ) ( not ( = ?auto_84974 ?auto_84976 ) ) ( not ( = ?auto_84974 ?auto_84977 ) ) ( not ( = ?auto_84974 ?auto_84978 ) ) ( not ( = ?auto_84974 ?auto_84979 ) ) ( not ( = ?auto_84974 ?auto_84980 ) ) ( not ( = ?auto_84974 ?auto_84981 ) ) ( not ( = ?auto_84974 ?auto_84982 ) ) ( not ( = ?auto_84975 ?auto_84976 ) ) ( not ( = ?auto_84975 ?auto_84977 ) ) ( not ( = ?auto_84975 ?auto_84978 ) ) ( not ( = ?auto_84975 ?auto_84979 ) ) ( not ( = ?auto_84975 ?auto_84980 ) ) ( not ( = ?auto_84975 ?auto_84981 ) ) ( not ( = ?auto_84975 ?auto_84982 ) ) ( not ( = ?auto_84976 ?auto_84977 ) ) ( not ( = ?auto_84976 ?auto_84978 ) ) ( not ( = ?auto_84976 ?auto_84979 ) ) ( not ( = ?auto_84976 ?auto_84980 ) ) ( not ( = ?auto_84976 ?auto_84981 ) ) ( not ( = ?auto_84976 ?auto_84982 ) ) ( not ( = ?auto_84977 ?auto_84978 ) ) ( not ( = ?auto_84977 ?auto_84979 ) ) ( not ( = ?auto_84977 ?auto_84980 ) ) ( not ( = ?auto_84977 ?auto_84981 ) ) ( not ( = ?auto_84977 ?auto_84982 ) ) ( not ( = ?auto_84978 ?auto_84979 ) ) ( not ( = ?auto_84978 ?auto_84980 ) ) ( not ( = ?auto_84978 ?auto_84981 ) ) ( not ( = ?auto_84978 ?auto_84982 ) ) ( not ( = ?auto_84979 ?auto_84980 ) ) ( not ( = ?auto_84979 ?auto_84981 ) ) ( not ( = ?auto_84979 ?auto_84982 ) ) ( not ( = ?auto_84980 ?auto_84981 ) ) ( not ( = ?auto_84980 ?auto_84982 ) ) ( not ( = ?auto_84981 ?auto_84982 ) ) ( ON ?auto_84980 ?auto_84981 ) ( ON ?auto_84979 ?auto_84980 ) ( ON ?auto_84978 ?auto_84979 ) ( ON ?auto_84977 ?auto_84978 ) ( ON ?auto_84976 ?auto_84977 ) ( CLEAR ?auto_84974 ) ( ON ?auto_84975 ?auto_84976 ) ( CLEAR ?auto_84975 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_84972 ?auto_84973 ?auto_84974 ?auto_84975 )
      ( MAKE-10PILE ?auto_84972 ?auto_84973 ?auto_84974 ?auto_84975 ?auto_84976 ?auto_84977 ?auto_84978 ?auto_84979 ?auto_84980 ?auto_84981 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_84993 - BLOCK
      ?auto_84994 - BLOCK
      ?auto_84995 - BLOCK
      ?auto_84996 - BLOCK
      ?auto_84997 - BLOCK
      ?auto_84998 - BLOCK
      ?auto_84999 - BLOCK
      ?auto_85000 - BLOCK
      ?auto_85001 - BLOCK
      ?auto_85002 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_85002 ) ( ON-TABLE ?auto_84993 ) ( ON ?auto_84994 ?auto_84993 ) ( ON ?auto_84995 ?auto_84994 ) ( not ( = ?auto_84993 ?auto_84994 ) ) ( not ( = ?auto_84993 ?auto_84995 ) ) ( not ( = ?auto_84993 ?auto_84996 ) ) ( not ( = ?auto_84993 ?auto_84997 ) ) ( not ( = ?auto_84993 ?auto_84998 ) ) ( not ( = ?auto_84993 ?auto_84999 ) ) ( not ( = ?auto_84993 ?auto_85000 ) ) ( not ( = ?auto_84993 ?auto_85001 ) ) ( not ( = ?auto_84993 ?auto_85002 ) ) ( not ( = ?auto_84994 ?auto_84995 ) ) ( not ( = ?auto_84994 ?auto_84996 ) ) ( not ( = ?auto_84994 ?auto_84997 ) ) ( not ( = ?auto_84994 ?auto_84998 ) ) ( not ( = ?auto_84994 ?auto_84999 ) ) ( not ( = ?auto_84994 ?auto_85000 ) ) ( not ( = ?auto_84994 ?auto_85001 ) ) ( not ( = ?auto_84994 ?auto_85002 ) ) ( not ( = ?auto_84995 ?auto_84996 ) ) ( not ( = ?auto_84995 ?auto_84997 ) ) ( not ( = ?auto_84995 ?auto_84998 ) ) ( not ( = ?auto_84995 ?auto_84999 ) ) ( not ( = ?auto_84995 ?auto_85000 ) ) ( not ( = ?auto_84995 ?auto_85001 ) ) ( not ( = ?auto_84995 ?auto_85002 ) ) ( not ( = ?auto_84996 ?auto_84997 ) ) ( not ( = ?auto_84996 ?auto_84998 ) ) ( not ( = ?auto_84996 ?auto_84999 ) ) ( not ( = ?auto_84996 ?auto_85000 ) ) ( not ( = ?auto_84996 ?auto_85001 ) ) ( not ( = ?auto_84996 ?auto_85002 ) ) ( not ( = ?auto_84997 ?auto_84998 ) ) ( not ( = ?auto_84997 ?auto_84999 ) ) ( not ( = ?auto_84997 ?auto_85000 ) ) ( not ( = ?auto_84997 ?auto_85001 ) ) ( not ( = ?auto_84997 ?auto_85002 ) ) ( not ( = ?auto_84998 ?auto_84999 ) ) ( not ( = ?auto_84998 ?auto_85000 ) ) ( not ( = ?auto_84998 ?auto_85001 ) ) ( not ( = ?auto_84998 ?auto_85002 ) ) ( not ( = ?auto_84999 ?auto_85000 ) ) ( not ( = ?auto_84999 ?auto_85001 ) ) ( not ( = ?auto_84999 ?auto_85002 ) ) ( not ( = ?auto_85000 ?auto_85001 ) ) ( not ( = ?auto_85000 ?auto_85002 ) ) ( not ( = ?auto_85001 ?auto_85002 ) ) ( ON ?auto_85001 ?auto_85002 ) ( ON ?auto_85000 ?auto_85001 ) ( ON ?auto_84999 ?auto_85000 ) ( ON ?auto_84998 ?auto_84999 ) ( ON ?auto_84997 ?auto_84998 ) ( CLEAR ?auto_84995 ) ( ON ?auto_84996 ?auto_84997 ) ( CLEAR ?auto_84996 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_84993 ?auto_84994 ?auto_84995 ?auto_84996 )
      ( MAKE-10PILE ?auto_84993 ?auto_84994 ?auto_84995 ?auto_84996 ?auto_84997 ?auto_84998 ?auto_84999 ?auto_85000 ?auto_85001 ?auto_85002 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_85013 - BLOCK
      ?auto_85014 - BLOCK
      ?auto_85015 - BLOCK
      ?auto_85016 - BLOCK
      ?auto_85017 - BLOCK
      ?auto_85018 - BLOCK
      ?auto_85019 - BLOCK
      ?auto_85020 - BLOCK
      ?auto_85021 - BLOCK
      ?auto_85022 - BLOCK
    )
    :vars
    (
      ?auto_85023 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_85022 ?auto_85023 ) ( ON-TABLE ?auto_85013 ) ( ON ?auto_85014 ?auto_85013 ) ( not ( = ?auto_85013 ?auto_85014 ) ) ( not ( = ?auto_85013 ?auto_85015 ) ) ( not ( = ?auto_85013 ?auto_85016 ) ) ( not ( = ?auto_85013 ?auto_85017 ) ) ( not ( = ?auto_85013 ?auto_85018 ) ) ( not ( = ?auto_85013 ?auto_85019 ) ) ( not ( = ?auto_85013 ?auto_85020 ) ) ( not ( = ?auto_85013 ?auto_85021 ) ) ( not ( = ?auto_85013 ?auto_85022 ) ) ( not ( = ?auto_85013 ?auto_85023 ) ) ( not ( = ?auto_85014 ?auto_85015 ) ) ( not ( = ?auto_85014 ?auto_85016 ) ) ( not ( = ?auto_85014 ?auto_85017 ) ) ( not ( = ?auto_85014 ?auto_85018 ) ) ( not ( = ?auto_85014 ?auto_85019 ) ) ( not ( = ?auto_85014 ?auto_85020 ) ) ( not ( = ?auto_85014 ?auto_85021 ) ) ( not ( = ?auto_85014 ?auto_85022 ) ) ( not ( = ?auto_85014 ?auto_85023 ) ) ( not ( = ?auto_85015 ?auto_85016 ) ) ( not ( = ?auto_85015 ?auto_85017 ) ) ( not ( = ?auto_85015 ?auto_85018 ) ) ( not ( = ?auto_85015 ?auto_85019 ) ) ( not ( = ?auto_85015 ?auto_85020 ) ) ( not ( = ?auto_85015 ?auto_85021 ) ) ( not ( = ?auto_85015 ?auto_85022 ) ) ( not ( = ?auto_85015 ?auto_85023 ) ) ( not ( = ?auto_85016 ?auto_85017 ) ) ( not ( = ?auto_85016 ?auto_85018 ) ) ( not ( = ?auto_85016 ?auto_85019 ) ) ( not ( = ?auto_85016 ?auto_85020 ) ) ( not ( = ?auto_85016 ?auto_85021 ) ) ( not ( = ?auto_85016 ?auto_85022 ) ) ( not ( = ?auto_85016 ?auto_85023 ) ) ( not ( = ?auto_85017 ?auto_85018 ) ) ( not ( = ?auto_85017 ?auto_85019 ) ) ( not ( = ?auto_85017 ?auto_85020 ) ) ( not ( = ?auto_85017 ?auto_85021 ) ) ( not ( = ?auto_85017 ?auto_85022 ) ) ( not ( = ?auto_85017 ?auto_85023 ) ) ( not ( = ?auto_85018 ?auto_85019 ) ) ( not ( = ?auto_85018 ?auto_85020 ) ) ( not ( = ?auto_85018 ?auto_85021 ) ) ( not ( = ?auto_85018 ?auto_85022 ) ) ( not ( = ?auto_85018 ?auto_85023 ) ) ( not ( = ?auto_85019 ?auto_85020 ) ) ( not ( = ?auto_85019 ?auto_85021 ) ) ( not ( = ?auto_85019 ?auto_85022 ) ) ( not ( = ?auto_85019 ?auto_85023 ) ) ( not ( = ?auto_85020 ?auto_85021 ) ) ( not ( = ?auto_85020 ?auto_85022 ) ) ( not ( = ?auto_85020 ?auto_85023 ) ) ( not ( = ?auto_85021 ?auto_85022 ) ) ( not ( = ?auto_85021 ?auto_85023 ) ) ( not ( = ?auto_85022 ?auto_85023 ) ) ( ON ?auto_85021 ?auto_85022 ) ( ON ?auto_85020 ?auto_85021 ) ( ON ?auto_85019 ?auto_85020 ) ( ON ?auto_85018 ?auto_85019 ) ( ON ?auto_85017 ?auto_85018 ) ( ON ?auto_85016 ?auto_85017 ) ( CLEAR ?auto_85014 ) ( ON ?auto_85015 ?auto_85016 ) ( CLEAR ?auto_85015 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_85013 ?auto_85014 ?auto_85015 )
      ( MAKE-10PILE ?auto_85013 ?auto_85014 ?auto_85015 ?auto_85016 ?auto_85017 ?auto_85018 ?auto_85019 ?auto_85020 ?auto_85021 ?auto_85022 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_85034 - BLOCK
      ?auto_85035 - BLOCK
      ?auto_85036 - BLOCK
      ?auto_85037 - BLOCK
      ?auto_85038 - BLOCK
      ?auto_85039 - BLOCK
      ?auto_85040 - BLOCK
      ?auto_85041 - BLOCK
      ?auto_85042 - BLOCK
      ?auto_85043 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_85043 ) ( ON-TABLE ?auto_85034 ) ( ON ?auto_85035 ?auto_85034 ) ( not ( = ?auto_85034 ?auto_85035 ) ) ( not ( = ?auto_85034 ?auto_85036 ) ) ( not ( = ?auto_85034 ?auto_85037 ) ) ( not ( = ?auto_85034 ?auto_85038 ) ) ( not ( = ?auto_85034 ?auto_85039 ) ) ( not ( = ?auto_85034 ?auto_85040 ) ) ( not ( = ?auto_85034 ?auto_85041 ) ) ( not ( = ?auto_85034 ?auto_85042 ) ) ( not ( = ?auto_85034 ?auto_85043 ) ) ( not ( = ?auto_85035 ?auto_85036 ) ) ( not ( = ?auto_85035 ?auto_85037 ) ) ( not ( = ?auto_85035 ?auto_85038 ) ) ( not ( = ?auto_85035 ?auto_85039 ) ) ( not ( = ?auto_85035 ?auto_85040 ) ) ( not ( = ?auto_85035 ?auto_85041 ) ) ( not ( = ?auto_85035 ?auto_85042 ) ) ( not ( = ?auto_85035 ?auto_85043 ) ) ( not ( = ?auto_85036 ?auto_85037 ) ) ( not ( = ?auto_85036 ?auto_85038 ) ) ( not ( = ?auto_85036 ?auto_85039 ) ) ( not ( = ?auto_85036 ?auto_85040 ) ) ( not ( = ?auto_85036 ?auto_85041 ) ) ( not ( = ?auto_85036 ?auto_85042 ) ) ( not ( = ?auto_85036 ?auto_85043 ) ) ( not ( = ?auto_85037 ?auto_85038 ) ) ( not ( = ?auto_85037 ?auto_85039 ) ) ( not ( = ?auto_85037 ?auto_85040 ) ) ( not ( = ?auto_85037 ?auto_85041 ) ) ( not ( = ?auto_85037 ?auto_85042 ) ) ( not ( = ?auto_85037 ?auto_85043 ) ) ( not ( = ?auto_85038 ?auto_85039 ) ) ( not ( = ?auto_85038 ?auto_85040 ) ) ( not ( = ?auto_85038 ?auto_85041 ) ) ( not ( = ?auto_85038 ?auto_85042 ) ) ( not ( = ?auto_85038 ?auto_85043 ) ) ( not ( = ?auto_85039 ?auto_85040 ) ) ( not ( = ?auto_85039 ?auto_85041 ) ) ( not ( = ?auto_85039 ?auto_85042 ) ) ( not ( = ?auto_85039 ?auto_85043 ) ) ( not ( = ?auto_85040 ?auto_85041 ) ) ( not ( = ?auto_85040 ?auto_85042 ) ) ( not ( = ?auto_85040 ?auto_85043 ) ) ( not ( = ?auto_85041 ?auto_85042 ) ) ( not ( = ?auto_85041 ?auto_85043 ) ) ( not ( = ?auto_85042 ?auto_85043 ) ) ( ON ?auto_85042 ?auto_85043 ) ( ON ?auto_85041 ?auto_85042 ) ( ON ?auto_85040 ?auto_85041 ) ( ON ?auto_85039 ?auto_85040 ) ( ON ?auto_85038 ?auto_85039 ) ( ON ?auto_85037 ?auto_85038 ) ( CLEAR ?auto_85035 ) ( ON ?auto_85036 ?auto_85037 ) ( CLEAR ?auto_85036 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_85034 ?auto_85035 ?auto_85036 )
      ( MAKE-10PILE ?auto_85034 ?auto_85035 ?auto_85036 ?auto_85037 ?auto_85038 ?auto_85039 ?auto_85040 ?auto_85041 ?auto_85042 ?auto_85043 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_85054 - BLOCK
      ?auto_85055 - BLOCK
      ?auto_85056 - BLOCK
      ?auto_85057 - BLOCK
      ?auto_85058 - BLOCK
      ?auto_85059 - BLOCK
      ?auto_85060 - BLOCK
      ?auto_85061 - BLOCK
      ?auto_85062 - BLOCK
      ?auto_85063 - BLOCK
    )
    :vars
    (
      ?auto_85064 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_85063 ?auto_85064 ) ( ON-TABLE ?auto_85054 ) ( not ( = ?auto_85054 ?auto_85055 ) ) ( not ( = ?auto_85054 ?auto_85056 ) ) ( not ( = ?auto_85054 ?auto_85057 ) ) ( not ( = ?auto_85054 ?auto_85058 ) ) ( not ( = ?auto_85054 ?auto_85059 ) ) ( not ( = ?auto_85054 ?auto_85060 ) ) ( not ( = ?auto_85054 ?auto_85061 ) ) ( not ( = ?auto_85054 ?auto_85062 ) ) ( not ( = ?auto_85054 ?auto_85063 ) ) ( not ( = ?auto_85054 ?auto_85064 ) ) ( not ( = ?auto_85055 ?auto_85056 ) ) ( not ( = ?auto_85055 ?auto_85057 ) ) ( not ( = ?auto_85055 ?auto_85058 ) ) ( not ( = ?auto_85055 ?auto_85059 ) ) ( not ( = ?auto_85055 ?auto_85060 ) ) ( not ( = ?auto_85055 ?auto_85061 ) ) ( not ( = ?auto_85055 ?auto_85062 ) ) ( not ( = ?auto_85055 ?auto_85063 ) ) ( not ( = ?auto_85055 ?auto_85064 ) ) ( not ( = ?auto_85056 ?auto_85057 ) ) ( not ( = ?auto_85056 ?auto_85058 ) ) ( not ( = ?auto_85056 ?auto_85059 ) ) ( not ( = ?auto_85056 ?auto_85060 ) ) ( not ( = ?auto_85056 ?auto_85061 ) ) ( not ( = ?auto_85056 ?auto_85062 ) ) ( not ( = ?auto_85056 ?auto_85063 ) ) ( not ( = ?auto_85056 ?auto_85064 ) ) ( not ( = ?auto_85057 ?auto_85058 ) ) ( not ( = ?auto_85057 ?auto_85059 ) ) ( not ( = ?auto_85057 ?auto_85060 ) ) ( not ( = ?auto_85057 ?auto_85061 ) ) ( not ( = ?auto_85057 ?auto_85062 ) ) ( not ( = ?auto_85057 ?auto_85063 ) ) ( not ( = ?auto_85057 ?auto_85064 ) ) ( not ( = ?auto_85058 ?auto_85059 ) ) ( not ( = ?auto_85058 ?auto_85060 ) ) ( not ( = ?auto_85058 ?auto_85061 ) ) ( not ( = ?auto_85058 ?auto_85062 ) ) ( not ( = ?auto_85058 ?auto_85063 ) ) ( not ( = ?auto_85058 ?auto_85064 ) ) ( not ( = ?auto_85059 ?auto_85060 ) ) ( not ( = ?auto_85059 ?auto_85061 ) ) ( not ( = ?auto_85059 ?auto_85062 ) ) ( not ( = ?auto_85059 ?auto_85063 ) ) ( not ( = ?auto_85059 ?auto_85064 ) ) ( not ( = ?auto_85060 ?auto_85061 ) ) ( not ( = ?auto_85060 ?auto_85062 ) ) ( not ( = ?auto_85060 ?auto_85063 ) ) ( not ( = ?auto_85060 ?auto_85064 ) ) ( not ( = ?auto_85061 ?auto_85062 ) ) ( not ( = ?auto_85061 ?auto_85063 ) ) ( not ( = ?auto_85061 ?auto_85064 ) ) ( not ( = ?auto_85062 ?auto_85063 ) ) ( not ( = ?auto_85062 ?auto_85064 ) ) ( not ( = ?auto_85063 ?auto_85064 ) ) ( ON ?auto_85062 ?auto_85063 ) ( ON ?auto_85061 ?auto_85062 ) ( ON ?auto_85060 ?auto_85061 ) ( ON ?auto_85059 ?auto_85060 ) ( ON ?auto_85058 ?auto_85059 ) ( ON ?auto_85057 ?auto_85058 ) ( ON ?auto_85056 ?auto_85057 ) ( CLEAR ?auto_85054 ) ( ON ?auto_85055 ?auto_85056 ) ( CLEAR ?auto_85055 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_85054 ?auto_85055 )
      ( MAKE-10PILE ?auto_85054 ?auto_85055 ?auto_85056 ?auto_85057 ?auto_85058 ?auto_85059 ?auto_85060 ?auto_85061 ?auto_85062 ?auto_85063 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_85075 - BLOCK
      ?auto_85076 - BLOCK
      ?auto_85077 - BLOCK
      ?auto_85078 - BLOCK
      ?auto_85079 - BLOCK
      ?auto_85080 - BLOCK
      ?auto_85081 - BLOCK
      ?auto_85082 - BLOCK
      ?auto_85083 - BLOCK
      ?auto_85084 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_85084 ) ( ON-TABLE ?auto_85075 ) ( not ( = ?auto_85075 ?auto_85076 ) ) ( not ( = ?auto_85075 ?auto_85077 ) ) ( not ( = ?auto_85075 ?auto_85078 ) ) ( not ( = ?auto_85075 ?auto_85079 ) ) ( not ( = ?auto_85075 ?auto_85080 ) ) ( not ( = ?auto_85075 ?auto_85081 ) ) ( not ( = ?auto_85075 ?auto_85082 ) ) ( not ( = ?auto_85075 ?auto_85083 ) ) ( not ( = ?auto_85075 ?auto_85084 ) ) ( not ( = ?auto_85076 ?auto_85077 ) ) ( not ( = ?auto_85076 ?auto_85078 ) ) ( not ( = ?auto_85076 ?auto_85079 ) ) ( not ( = ?auto_85076 ?auto_85080 ) ) ( not ( = ?auto_85076 ?auto_85081 ) ) ( not ( = ?auto_85076 ?auto_85082 ) ) ( not ( = ?auto_85076 ?auto_85083 ) ) ( not ( = ?auto_85076 ?auto_85084 ) ) ( not ( = ?auto_85077 ?auto_85078 ) ) ( not ( = ?auto_85077 ?auto_85079 ) ) ( not ( = ?auto_85077 ?auto_85080 ) ) ( not ( = ?auto_85077 ?auto_85081 ) ) ( not ( = ?auto_85077 ?auto_85082 ) ) ( not ( = ?auto_85077 ?auto_85083 ) ) ( not ( = ?auto_85077 ?auto_85084 ) ) ( not ( = ?auto_85078 ?auto_85079 ) ) ( not ( = ?auto_85078 ?auto_85080 ) ) ( not ( = ?auto_85078 ?auto_85081 ) ) ( not ( = ?auto_85078 ?auto_85082 ) ) ( not ( = ?auto_85078 ?auto_85083 ) ) ( not ( = ?auto_85078 ?auto_85084 ) ) ( not ( = ?auto_85079 ?auto_85080 ) ) ( not ( = ?auto_85079 ?auto_85081 ) ) ( not ( = ?auto_85079 ?auto_85082 ) ) ( not ( = ?auto_85079 ?auto_85083 ) ) ( not ( = ?auto_85079 ?auto_85084 ) ) ( not ( = ?auto_85080 ?auto_85081 ) ) ( not ( = ?auto_85080 ?auto_85082 ) ) ( not ( = ?auto_85080 ?auto_85083 ) ) ( not ( = ?auto_85080 ?auto_85084 ) ) ( not ( = ?auto_85081 ?auto_85082 ) ) ( not ( = ?auto_85081 ?auto_85083 ) ) ( not ( = ?auto_85081 ?auto_85084 ) ) ( not ( = ?auto_85082 ?auto_85083 ) ) ( not ( = ?auto_85082 ?auto_85084 ) ) ( not ( = ?auto_85083 ?auto_85084 ) ) ( ON ?auto_85083 ?auto_85084 ) ( ON ?auto_85082 ?auto_85083 ) ( ON ?auto_85081 ?auto_85082 ) ( ON ?auto_85080 ?auto_85081 ) ( ON ?auto_85079 ?auto_85080 ) ( ON ?auto_85078 ?auto_85079 ) ( ON ?auto_85077 ?auto_85078 ) ( CLEAR ?auto_85075 ) ( ON ?auto_85076 ?auto_85077 ) ( CLEAR ?auto_85076 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_85075 ?auto_85076 )
      ( MAKE-10PILE ?auto_85075 ?auto_85076 ?auto_85077 ?auto_85078 ?auto_85079 ?auto_85080 ?auto_85081 ?auto_85082 ?auto_85083 ?auto_85084 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_85095 - BLOCK
      ?auto_85096 - BLOCK
      ?auto_85097 - BLOCK
      ?auto_85098 - BLOCK
      ?auto_85099 - BLOCK
      ?auto_85100 - BLOCK
      ?auto_85101 - BLOCK
      ?auto_85102 - BLOCK
      ?auto_85103 - BLOCK
      ?auto_85104 - BLOCK
    )
    :vars
    (
      ?auto_85105 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_85104 ?auto_85105 ) ( not ( = ?auto_85095 ?auto_85096 ) ) ( not ( = ?auto_85095 ?auto_85097 ) ) ( not ( = ?auto_85095 ?auto_85098 ) ) ( not ( = ?auto_85095 ?auto_85099 ) ) ( not ( = ?auto_85095 ?auto_85100 ) ) ( not ( = ?auto_85095 ?auto_85101 ) ) ( not ( = ?auto_85095 ?auto_85102 ) ) ( not ( = ?auto_85095 ?auto_85103 ) ) ( not ( = ?auto_85095 ?auto_85104 ) ) ( not ( = ?auto_85095 ?auto_85105 ) ) ( not ( = ?auto_85096 ?auto_85097 ) ) ( not ( = ?auto_85096 ?auto_85098 ) ) ( not ( = ?auto_85096 ?auto_85099 ) ) ( not ( = ?auto_85096 ?auto_85100 ) ) ( not ( = ?auto_85096 ?auto_85101 ) ) ( not ( = ?auto_85096 ?auto_85102 ) ) ( not ( = ?auto_85096 ?auto_85103 ) ) ( not ( = ?auto_85096 ?auto_85104 ) ) ( not ( = ?auto_85096 ?auto_85105 ) ) ( not ( = ?auto_85097 ?auto_85098 ) ) ( not ( = ?auto_85097 ?auto_85099 ) ) ( not ( = ?auto_85097 ?auto_85100 ) ) ( not ( = ?auto_85097 ?auto_85101 ) ) ( not ( = ?auto_85097 ?auto_85102 ) ) ( not ( = ?auto_85097 ?auto_85103 ) ) ( not ( = ?auto_85097 ?auto_85104 ) ) ( not ( = ?auto_85097 ?auto_85105 ) ) ( not ( = ?auto_85098 ?auto_85099 ) ) ( not ( = ?auto_85098 ?auto_85100 ) ) ( not ( = ?auto_85098 ?auto_85101 ) ) ( not ( = ?auto_85098 ?auto_85102 ) ) ( not ( = ?auto_85098 ?auto_85103 ) ) ( not ( = ?auto_85098 ?auto_85104 ) ) ( not ( = ?auto_85098 ?auto_85105 ) ) ( not ( = ?auto_85099 ?auto_85100 ) ) ( not ( = ?auto_85099 ?auto_85101 ) ) ( not ( = ?auto_85099 ?auto_85102 ) ) ( not ( = ?auto_85099 ?auto_85103 ) ) ( not ( = ?auto_85099 ?auto_85104 ) ) ( not ( = ?auto_85099 ?auto_85105 ) ) ( not ( = ?auto_85100 ?auto_85101 ) ) ( not ( = ?auto_85100 ?auto_85102 ) ) ( not ( = ?auto_85100 ?auto_85103 ) ) ( not ( = ?auto_85100 ?auto_85104 ) ) ( not ( = ?auto_85100 ?auto_85105 ) ) ( not ( = ?auto_85101 ?auto_85102 ) ) ( not ( = ?auto_85101 ?auto_85103 ) ) ( not ( = ?auto_85101 ?auto_85104 ) ) ( not ( = ?auto_85101 ?auto_85105 ) ) ( not ( = ?auto_85102 ?auto_85103 ) ) ( not ( = ?auto_85102 ?auto_85104 ) ) ( not ( = ?auto_85102 ?auto_85105 ) ) ( not ( = ?auto_85103 ?auto_85104 ) ) ( not ( = ?auto_85103 ?auto_85105 ) ) ( not ( = ?auto_85104 ?auto_85105 ) ) ( ON ?auto_85103 ?auto_85104 ) ( ON ?auto_85102 ?auto_85103 ) ( ON ?auto_85101 ?auto_85102 ) ( ON ?auto_85100 ?auto_85101 ) ( ON ?auto_85099 ?auto_85100 ) ( ON ?auto_85098 ?auto_85099 ) ( ON ?auto_85097 ?auto_85098 ) ( ON ?auto_85096 ?auto_85097 ) ( ON ?auto_85095 ?auto_85096 ) ( CLEAR ?auto_85095 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_85095 )
      ( MAKE-10PILE ?auto_85095 ?auto_85096 ?auto_85097 ?auto_85098 ?auto_85099 ?auto_85100 ?auto_85101 ?auto_85102 ?auto_85103 ?auto_85104 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_85116 - BLOCK
      ?auto_85117 - BLOCK
      ?auto_85118 - BLOCK
      ?auto_85119 - BLOCK
      ?auto_85120 - BLOCK
      ?auto_85121 - BLOCK
      ?auto_85122 - BLOCK
      ?auto_85123 - BLOCK
      ?auto_85124 - BLOCK
      ?auto_85125 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_85125 ) ( not ( = ?auto_85116 ?auto_85117 ) ) ( not ( = ?auto_85116 ?auto_85118 ) ) ( not ( = ?auto_85116 ?auto_85119 ) ) ( not ( = ?auto_85116 ?auto_85120 ) ) ( not ( = ?auto_85116 ?auto_85121 ) ) ( not ( = ?auto_85116 ?auto_85122 ) ) ( not ( = ?auto_85116 ?auto_85123 ) ) ( not ( = ?auto_85116 ?auto_85124 ) ) ( not ( = ?auto_85116 ?auto_85125 ) ) ( not ( = ?auto_85117 ?auto_85118 ) ) ( not ( = ?auto_85117 ?auto_85119 ) ) ( not ( = ?auto_85117 ?auto_85120 ) ) ( not ( = ?auto_85117 ?auto_85121 ) ) ( not ( = ?auto_85117 ?auto_85122 ) ) ( not ( = ?auto_85117 ?auto_85123 ) ) ( not ( = ?auto_85117 ?auto_85124 ) ) ( not ( = ?auto_85117 ?auto_85125 ) ) ( not ( = ?auto_85118 ?auto_85119 ) ) ( not ( = ?auto_85118 ?auto_85120 ) ) ( not ( = ?auto_85118 ?auto_85121 ) ) ( not ( = ?auto_85118 ?auto_85122 ) ) ( not ( = ?auto_85118 ?auto_85123 ) ) ( not ( = ?auto_85118 ?auto_85124 ) ) ( not ( = ?auto_85118 ?auto_85125 ) ) ( not ( = ?auto_85119 ?auto_85120 ) ) ( not ( = ?auto_85119 ?auto_85121 ) ) ( not ( = ?auto_85119 ?auto_85122 ) ) ( not ( = ?auto_85119 ?auto_85123 ) ) ( not ( = ?auto_85119 ?auto_85124 ) ) ( not ( = ?auto_85119 ?auto_85125 ) ) ( not ( = ?auto_85120 ?auto_85121 ) ) ( not ( = ?auto_85120 ?auto_85122 ) ) ( not ( = ?auto_85120 ?auto_85123 ) ) ( not ( = ?auto_85120 ?auto_85124 ) ) ( not ( = ?auto_85120 ?auto_85125 ) ) ( not ( = ?auto_85121 ?auto_85122 ) ) ( not ( = ?auto_85121 ?auto_85123 ) ) ( not ( = ?auto_85121 ?auto_85124 ) ) ( not ( = ?auto_85121 ?auto_85125 ) ) ( not ( = ?auto_85122 ?auto_85123 ) ) ( not ( = ?auto_85122 ?auto_85124 ) ) ( not ( = ?auto_85122 ?auto_85125 ) ) ( not ( = ?auto_85123 ?auto_85124 ) ) ( not ( = ?auto_85123 ?auto_85125 ) ) ( not ( = ?auto_85124 ?auto_85125 ) ) ( ON ?auto_85124 ?auto_85125 ) ( ON ?auto_85123 ?auto_85124 ) ( ON ?auto_85122 ?auto_85123 ) ( ON ?auto_85121 ?auto_85122 ) ( ON ?auto_85120 ?auto_85121 ) ( ON ?auto_85119 ?auto_85120 ) ( ON ?auto_85118 ?auto_85119 ) ( ON ?auto_85117 ?auto_85118 ) ( ON ?auto_85116 ?auto_85117 ) ( CLEAR ?auto_85116 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_85116 )
      ( MAKE-10PILE ?auto_85116 ?auto_85117 ?auto_85118 ?auto_85119 ?auto_85120 ?auto_85121 ?auto_85122 ?auto_85123 ?auto_85124 ?auto_85125 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_85136 - BLOCK
      ?auto_85137 - BLOCK
      ?auto_85138 - BLOCK
      ?auto_85139 - BLOCK
      ?auto_85140 - BLOCK
      ?auto_85141 - BLOCK
      ?auto_85142 - BLOCK
      ?auto_85143 - BLOCK
      ?auto_85144 - BLOCK
      ?auto_85145 - BLOCK
    )
    :vars
    (
      ?auto_85146 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_85136 ?auto_85137 ) ) ( not ( = ?auto_85136 ?auto_85138 ) ) ( not ( = ?auto_85136 ?auto_85139 ) ) ( not ( = ?auto_85136 ?auto_85140 ) ) ( not ( = ?auto_85136 ?auto_85141 ) ) ( not ( = ?auto_85136 ?auto_85142 ) ) ( not ( = ?auto_85136 ?auto_85143 ) ) ( not ( = ?auto_85136 ?auto_85144 ) ) ( not ( = ?auto_85136 ?auto_85145 ) ) ( not ( = ?auto_85137 ?auto_85138 ) ) ( not ( = ?auto_85137 ?auto_85139 ) ) ( not ( = ?auto_85137 ?auto_85140 ) ) ( not ( = ?auto_85137 ?auto_85141 ) ) ( not ( = ?auto_85137 ?auto_85142 ) ) ( not ( = ?auto_85137 ?auto_85143 ) ) ( not ( = ?auto_85137 ?auto_85144 ) ) ( not ( = ?auto_85137 ?auto_85145 ) ) ( not ( = ?auto_85138 ?auto_85139 ) ) ( not ( = ?auto_85138 ?auto_85140 ) ) ( not ( = ?auto_85138 ?auto_85141 ) ) ( not ( = ?auto_85138 ?auto_85142 ) ) ( not ( = ?auto_85138 ?auto_85143 ) ) ( not ( = ?auto_85138 ?auto_85144 ) ) ( not ( = ?auto_85138 ?auto_85145 ) ) ( not ( = ?auto_85139 ?auto_85140 ) ) ( not ( = ?auto_85139 ?auto_85141 ) ) ( not ( = ?auto_85139 ?auto_85142 ) ) ( not ( = ?auto_85139 ?auto_85143 ) ) ( not ( = ?auto_85139 ?auto_85144 ) ) ( not ( = ?auto_85139 ?auto_85145 ) ) ( not ( = ?auto_85140 ?auto_85141 ) ) ( not ( = ?auto_85140 ?auto_85142 ) ) ( not ( = ?auto_85140 ?auto_85143 ) ) ( not ( = ?auto_85140 ?auto_85144 ) ) ( not ( = ?auto_85140 ?auto_85145 ) ) ( not ( = ?auto_85141 ?auto_85142 ) ) ( not ( = ?auto_85141 ?auto_85143 ) ) ( not ( = ?auto_85141 ?auto_85144 ) ) ( not ( = ?auto_85141 ?auto_85145 ) ) ( not ( = ?auto_85142 ?auto_85143 ) ) ( not ( = ?auto_85142 ?auto_85144 ) ) ( not ( = ?auto_85142 ?auto_85145 ) ) ( not ( = ?auto_85143 ?auto_85144 ) ) ( not ( = ?auto_85143 ?auto_85145 ) ) ( not ( = ?auto_85144 ?auto_85145 ) ) ( ON ?auto_85136 ?auto_85146 ) ( not ( = ?auto_85145 ?auto_85146 ) ) ( not ( = ?auto_85144 ?auto_85146 ) ) ( not ( = ?auto_85143 ?auto_85146 ) ) ( not ( = ?auto_85142 ?auto_85146 ) ) ( not ( = ?auto_85141 ?auto_85146 ) ) ( not ( = ?auto_85140 ?auto_85146 ) ) ( not ( = ?auto_85139 ?auto_85146 ) ) ( not ( = ?auto_85138 ?auto_85146 ) ) ( not ( = ?auto_85137 ?auto_85146 ) ) ( not ( = ?auto_85136 ?auto_85146 ) ) ( ON ?auto_85137 ?auto_85136 ) ( ON ?auto_85138 ?auto_85137 ) ( ON ?auto_85139 ?auto_85138 ) ( ON ?auto_85140 ?auto_85139 ) ( ON ?auto_85141 ?auto_85140 ) ( ON ?auto_85142 ?auto_85141 ) ( ON ?auto_85143 ?auto_85142 ) ( ON ?auto_85144 ?auto_85143 ) ( ON ?auto_85145 ?auto_85144 ) ( CLEAR ?auto_85145 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_85145 ?auto_85144 ?auto_85143 ?auto_85142 ?auto_85141 ?auto_85140 ?auto_85139 ?auto_85138 ?auto_85137 ?auto_85136 )
      ( MAKE-10PILE ?auto_85136 ?auto_85137 ?auto_85138 ?auto_85139 ?auto_85140 ?auto_85141 ?auto_85142 ?auto_85143 ?auto_85144 ?auto_85145 ) )
  )

)

