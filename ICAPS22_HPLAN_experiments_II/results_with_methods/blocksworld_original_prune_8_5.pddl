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
      ?auto_135643 - BLOCK
      ?auto_135644 - BLOCK
      ?auto_135645 - BLOCK
      ?auto_135646 - BLOCK
      ?auto_135647 - BLOCK
      ?auto_135648 - BLOCK
      ?auto_135649 - BLOCK
      ?auto_135650 - BLOCK
    )
    :vars
    (
      ?auto_135651 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_135651 ?auto_135650 ) ( CLEAR ?auto_135651 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_135643 ) ( ON ?auto_135644 ?auto_135643 ) ( ON ?auto_135645 ?auto_135644 ) ( ON ?auto_135646 ?auto_135645 ) ( ON ?auto_135647 ?auto_135646 ) ( ON ?auto_135648 ?auto_135647 ) ( ON ?auto_135649 ?auto_135648 ) ( ON ?auto_135650 ?auto_135649 ) ( not ( = ?auto_135643 ?auto_135644 ) ) ( not ( = ?auto_135643 ?auto_135645 ) ) ( not ( = ?auto_135643 ?auto_135646 ) ) ( not ( = ?auto_135643 ?auto_135647 ) ) ( not ( = ?auto_135643 ?auto_135648 ) ) ( not ( = ?auto_135643 ?auto_135649 ) ) ( not ( = ?auto_135643 ?auto_135650 ) ) ( not ( = ?auto_135643 ?auto_135651 ) ) ( not ( = ?auto_135644 ?auto_135645 ) ) ( not ( = ?auto_135644 ?auto_135646 ) ) ( not ( = ?auto_135644 ?auto_135647 ) ) ( not ( = ?auto_135644 ?auto_135648 ) ) ( not ( = ?auto_135644 ?auto_135649 ) ) ( not ( = ?auto_135644 ?auto_135650 ) ) ( not ( = ?auto_135644 ?auto_135651 ) ) ( not ( = ?auto_135645 ?auto_135646 ) ) ( not ( = ?auto_135645 ?auto_135647 ) ) ( not ( = ?auto_135645 ?auto_135648 ) ) ( not ( = ?auto_135645 ?auto_135649 ) ) ( not ( = ?auto_135645 ?auto_135650 ) ) ( not ( = ?auto_135645 ?auto_135651 ) ) ( not ( = ?auto_135646 ?auto_135647 ) ) ( not ( = ?auto_135646 ?auto_135648 ) ) ( not ( = ?auto_135646 ?auto_135649 ) ) ( not ( = ?auto_135646 ?auto_135650 ) ) ( not ( = ?auto_135646 ?auto_135651 ) ) ( not ( = ?auto_135647 ?auto_135648 ) ) ( not ( = ?auto_135647 ?auto_135649 ) ) ( not ( = ?auto_135647 ?auto_135650 ) ) ( not ( = ?auto_135647 ?auto_135651 ) ) ( not ( = ?auto_135648 ?auto_135649 ) ) ( not ( = ?auto_135648 ?auto_135650 ) ) ( not ( = ?auto_135648 ?auto_135651 ) ) ( not ( = ?auto_135649 ?auto_135650 ) ) ( not ( = ?auto_135649 ?auto_135651 ) ) ( not ( = ?auto_135650 ?auto_135651 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_135651 ?auto_135650 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_135653 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_135653 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_135653 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_135654 - BLOCK
    )
    :vars
    (
      ?auto_135655 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_135654 ?auto_135655 ) ( CLEAR ?auto_135654 ) ( HAND-EMPTY ) ( not ( = ?auto_135654 ?auto_135655 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_135654 ?auto_135655 )
      ( MAKE-1PILE ?auto_135654 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_135663 - BLOCK
      ?auto_135664 - BLOCK
      ?auto_135665 - BLOCK
      ?auto_135666 - BLOCK
      ?auto_135667 - BLOCK
      ?auto_135668 - BLOCK
      ?auto_135669 - BLOCK
    )
    :vars
    (
      ?auto_135670 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_135670 ?auto_135669 ) ( CLEAR ?auto_135670 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_135663 ) ( ON ?auto_135664 ?auto_135663 ) ( ON ?auto_135665 ?auto_135664 ) ( ON ?auto_135666 ?auto_135665 ) ( ON ?auto_135667 ?auto_135666 ) ( ON ?auto_135668 ?auto_135667 ) ( ON ?auto_135669 ?auto_135668 ) ( not ( = ?auto_135663 ?auto_135664 ) ) ( not ( = ?auto_135663 ?auto_135665 ) ) ( not ( = ?auto_135663 ?auto_135666 ) ) ( not ( = ?auto_135663 ?auto_135667 ) ) ( not ( = ?auto_135663 ?auto_135668 ) ) ( not ( = ?auto_135663 ?auto_135669 ) ) ( not ( = ?auto_135663 ?auto_135670 ) ) ( not ( = ?auto_135664 ?auto_135665 ) ) ( not ( = ?auto_135664 ?auto_135666 ) ) ( not ( = ?auto_135664 ?auto_135667 ) ) ( not ( = ?auto_135664 ?auto_135668 ) ) ( not ( = ?auto_135664 ?auto_135669 ) ) ( not ( = ?auto_135664 ?auto_135670 ) ) ( not ( = ?auto_135665 ?auto_135666 ) ) ( not ( = ?auto_135665 ?auto_135667 ) ) ( not ( = ?auto_135665 ?auto_135668 ) ) ( not ( = ?auto_135665 ?auto_135669 ) ) ( not ( = ?auto_135665 ?auto_135670 ) ) ( not ( = ?auto_135666 ?auto_135667 ) ) ( not ( = ?auto_135666 ?auto_135668 ) ) ( not ( = ?auto_135666 ?auto_135669 ) ) ( not ( = ?auto_135666 ?auto_135670 ) ) ( not ( = ?auto_135667 ?auto_135668 ) ) ( not ( = ?auto_135667 ?auto_135669 ) ) ( not ( = ?auto_135667 ?auto_135670 ) ) ( not ( = ?auto_135668 ?auto_135669 ) ) ( not ( = ?auto_135668 ?auto_135670 ) ) ( not ( = ?auto_135669 ?auto_135670 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_135670 ?auto_135669 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_135671 - BLOCK
      ?auto_135672 - BLOCK
      ?auto_135673 - BLOCK
      ?auto_135674 - BLOCK
      ?auto_135675 - BLOCK
      ?auto_135676 - BLOCK
      ?auto_135677 - BLOCK
    )
    :vars
    (
      ?auto_135678 - BLOCK
      ?auto_135679 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_135678 ?auto_135677 ) ( CLEAR ?auto_135678 ) ( ON-TABLE ?auto_135671 ) ( ON ?auto_135672 ?auto_135671 ) ( ON ?auto_135673 ?auto_135672 ) ( ON ?auto_135674 ?auto_135673 ) ( ON ?auto_135675 ?auto_135674 ) ( ON ?auto_135676 ?auto_135675 ) ( ON ?auto_135677 ?auto_135676 ) ( not ( = ?auto_135671 ?auto_135672 ) ) ( not ( = ?auto_135671 ?auto_135673 ) ) ( not ( = ?auto_135671 ?auto_135674 ) ) ( not ( = ?auto_135671 ?auto_135675 ) ) ( not ( = ?auto_135671 ?auto_135676 ) ) ( not ( = ?auto_135671 ?auto_135677 ) ) ( not ( = ?auto_135671 ?auto_135678 ) ) ( not ( = ?auto_135672 ?auto_135673 ) ) ( not ( = ?auto_135672 ?auto_135674 ) ) ( not ( = ?auto_135672 ?auto_135675 ) ) ( not ( = ?auto_135672 ?auto_135676 ) ) ( not ( = ?auto_135672 ?auto_135677 ) ) ( not ( = ?auto_135672 ?auto_135678 ) ) ( not ( = ?auto_135673 ?auto_135674 ) ) ( not ( = ?auto_135673 ?auto_135675 ) ) ( not ( = ?auto_135673 ?auto_135676 ) ) ( not ( = ?auto_135673 ?auto_135677 ) ) ( not ( = ?auto_135673 ?auto_135678 ) ) ( not ( = ?auto_135674 ?auto_135675 ) ) ( not ( = ?auto_135674 ?auto_135676 ) ) ( not ( = ?auto_135674 ?auto_135677 ) ) ( not ( = ?auto_135674 ?auto_135678 ) ) ( not ( = ?auto_135675 ?auto_135676 ) ) ( not ( = ?auto_135675 ?auto_135677 ) ) ( not ( = ?auto_135675 ?auto_135678 ) ) ( not ( = ?auto_135676 ?auto_135677 ) ) ( not ( = ?auto_135676 ?auto_135678 ) ) ( not ( = ?auto_135677 ?auto_135678 ) ) ( HOLDING ?auto_135679 ) ( not ( = ?auto_135671 ?auto_135679 ) ) ( not ( = ?auto_135672 ?auto_135679 ) ) ( not ( = ?auto_135673 ?auto_135679 ) ) ( not ( = ?auto_135674 ?auto_135679 ) ) ( not ( = ?auto_135675 ?auto_135679 ) ) ( not ( = ?auto_135676 ?auto_135679 ) ) ( not ( = ?auto_135677 ?auto_135679 ) ) ( not ( = ?auto_135678 ?auto_135679 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_135679 )
      ( MAKE-7PILE ?auto_135671 ?auto_135672 ?auto_135673 ?auto_135674 ?auto_135675 ?auto_135676 ?auto_135677 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_135680 - BLOCK
      ?auto_135681 - BLOCK
      ?auto_135682 - BLOCK
      ?auto_135683 - BLOCK
      ?auto_135684 - BLOCK
      ?auto_135685 - BLOCK
      ?auto_135686 - BLOCK
    )
    :vars
    (
      ?auto_135687 - BLOCK
      ?auto_135688 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_135687 ?auto_135686 ) ( ON-TABLE ?auto_135680 ) ( ON ?auto_135681 ?auto_135680 ) ( ON ?auto_135682 ?auto_135681 ) ( ON ?auto_135683 ?auto_135682 ) ( ON ?auto_135684 ?auto_135683 ) ( ON ?auto_135685 ?auto_135684 ) ( ON ?auto_135686 ?auto_135685 ) ( not ( = ?auto_135680 ?auto_135681 ) ) ( not ( = ?auto_135680 ?auto_135682 ) ) ( not ( = ?auto_135680 ?auto_135683 ) ) ( not ( = ?auto_135680 ?auto_135684 ) ) ( not ( = ?auto_135680 ?auto_135685 ) ) ( not ( = ?auto_135680 ?auto_135686 ) ) ( not ( = ?auto_135680 ?auto_135687 ) ) ( not ( = ?auto_135681 ?auto_135682 ) ) ( not ( = ?auto_135681 ?auto_135683 ) ) ( not ( = ?auto_135681 ?auto_135684 ) ) ( not ( = ?auto_135681 ?auto_135685 ) ) ( not ( = ?auto_135681 ?auto_135686 ) ) ( not ( = ?auto_135681 ?auto_135687 ) ) ( not ( = ?auto_135682 ?auto_135683 ) ) ( not ( = ?auto_135682 ?auto_135684 ) ) ( not ( = ?auto_135682 ?auto_135685 ) ) ( not ( = ?auto_135682 ?auto_135686 ) ) ( not ( = ?auto_135682 ?auto_135687 ) ) ( not ( = ?auto_135683 ?auto_135684 ) ) ( not ( = ?auto_135683 ?auto_135685 ) ) ( not ( = ?auto_135683 ?auto_135686 ) ) ( not ( = ?auto_135683 ?auto_135687 ) ) ( not ( = ?auto_135684 ?auto_135685 ) ) ( not ( = ?auto_135684 ?auto_135686 ) ) ( not ( = ?auto_135684 ?auto_135687 ) ) ( not ( = ?auto_135685 ?auto_135686 ) ) ( not ( = ?auto_135685 ?auto_135687 ) ) ( not ( = ?auto_135686 ?auto_135687 ) ) ( not ( = ?auto_135680 ?auto_135688 ) ) ( not ( = ?auto_135681 ?auto_135688 ) ) ( not ( = ?auto_135682 ?auto_135688 ) ) ( not ( = ?auto_135683 ?auto_135688 ) ) ( not ( = ?auto_135684 ?auto_135688 ) ) ( not ( = ?auto_135685 ?auto_135688 ) ) ( not ( = ?auto_135686 ?auto_135688 ) ) ( not ( = ?auto_135687 ?auto_135688 ) ) ( ON ?auto_135688 ?auto_135687 ) ( CLEAR ?auto_135688 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_135680 ?auto_135681 ?auto_135682 ?auto_135683 ?auto_135684 ?auto_135685 ?auto_135686 ?auto_135687 )
      ( MAKE-7PILE ?auto_135680 ?auto_135681 ?auto_135682 ?auto_135683 ?auto_135684 ?auto_135685 ?auto_135686 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_135691 - BLOCK
      ?auto_135692 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_135692 ) ( CLEAR ?auto_135691 ) ( ON-TABLE ?auto_135691 ) ( not ( = ?auto_135691 ?auto_135692 ) ) )
    :subtasks
    ( ( !STACK ?auto_135692 ?auto_135691 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_135693 - BLOCK
      ?auto_135694 - BLOCK
    )
    :vars
    (
      ?auto_135695 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_135693 ) ( ON-TABLE ?auto_135693 ) ( not ( = ?auto_135693 ?auto_135694 ) ) ( ON ?auto_135694 ?auto_135695 ) ( CLEAR ?auto_135694 ) ( HAND-EMPTY ) ( not ( = ?auto_135693 ?auto_135695 ) ) ( not ( = ?auto_135694 ?auto_135695 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_135694 ?auto_135695 )
      ( MAKE-2PILE ?auto_135693 ?auto_135694 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_135696 - BLOCK
      ?auto_135697 - BLOCK
    )
    :vars
    (
      ?auto_135698 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_135696 ?auto_135697 ) ) ( ON ?auto_135697 ?auto_135698 ) ( CLEAR ?auto_135697 ) ( not ( = ?auto_135696 ?auto_135698 ) ) ( not ( = ?auto_135697 ?auto_135698 ) ) ( HOLDING ?auto_135696 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_135696 )
      ( MAKE-2PILE ?auto_135696 ?auto_135697 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_135699 - BLOCK
      ?auto_135700 - BLOCK
    )
    :vars
    (
      ?auto_135701 - BLOCK
      ?auto_135704 - BLOCK
      ?auto_135703 - BLOCK
      ?auto_135707 - BLOCK
      ?auto_135706 - BLOCK
      ?auto_135702 - BLOCK
      ?auto_135705 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_135699 ?auto_135700 ) ) ( ON ?auto_135700 ?auto_135701 ) ( not ( = ?auto_135699 ?auto_135701 ) ) ( not ( = ?auto_135700 ?auto_135701 ) ) ( ON ?auto_135699 ?auto_135700 ) ( CLEAR ?auto_135699 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_135704 ) ( ON ?auto_135703 ?auto_135704 ) ( ON ?auto_135707 ?auto_135703 ) ( ON ?auto_135706 ?auto_135707 ) ( ON ?auto_135702 ?auto_135706 ) ( ON ?auto_135705 ?auto_135702 ) ( ON ?auto_135701 ?auto_135705 ) ( not ( = ?auto_135704 ?auto_135703 ) ) ( not ( = ?auto_135704 ?auto_135707 ) ) ( not ( = ?auto_135704 ?auto_135706 ) ) ( not ( = ?auto_135704 ?auto_135702 ) ) ( not ( = ?auto_135704 ?auto_135705 ) ) ( not ( = ?auto_135704 ?auto_135701 ) ) ( not ( = ?auto_135704 ?auto_135700 ) ) ( not ( = ?auto_135704 ?auto_135699 ) ) ( not ( = ?auto_135703 ?auto_135707 ) ) ( not ( = ?auto_135703 ?auto_135706 ) ) ( not ( = ?auto_135703 ?auto_135702 ) ) ( not ( = ?auto_135703 ?auto_135705 ) ) ( not ( = ?auto_135703 ?auto_135701 ) ) ( not ( = ?auto_135703 ?auto_135700 ) ) ( not ( = ?auto_135703 ?auto_135699 ) ) ( not ( = ?auto_135707 ?auto_135706 ) ) ( not ( = ?auto_135707 ?auto_135702 ) ) ( not ( = ?auto_135707 ?auto_135705 ) ) ( not ( = ?auto_135707 ?auto_135701 ) ) ( not ( = ?auto_135707 ?auto_135700 ) ) ( not ( = ?auto_135707 ?auto_135699 ) ) ( not ( = ?auto_135706 ?auto_135702 ) ) ( not ( = ?auto_135706 ?auto_135705 ) ) ( not ( = ?auto_135706 ?auto_135701 ) ) ( not ( = ?auto_135706 ?auto_135700 ) ) ( not ( = ?auto_135706 ?auto_135699 ) ) ( not ( = ?auto_135702 ?auto_135705 ) ) ( not ( = ?auto_135702 ?auto_135701 ) ) ( not ( = ?auto_135702 ?auto_135700 ) ) ( not ( = ?auto_135702 ?auto_135699 ) ) ( not ( = ?auto_135705 ?auto_135701 ) ) ( not ( = ?auto_135705 ?auto_135700 ) ) ( not ( = ?auto_135705 ?auto_135699 ) ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_135704 ?auto_135703 ?auto_135707 ?auto_135706 ?auto_135702 ?auto_135705 ?auto_135701 ?auto_135700 )
      ( MAKE-2PILE ?auto_135699 ?auto_135700 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_135714 - BLOCK
      ?auto_135715 - BLOCK
      ?auto_135716 - BLOCK
      ?auto_135717 - BLOCK
      ?auto_135718 - BLOCK
      ?auto_135719 - BLOCK
    )
    :vars
    (
      ?auto_135720 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_135720 ?auto_135719 ) ( CLEAR ?auto_135720 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_135714 ) ( ON ?auto_135715 ?auto_135714 ) ( ON ?auto_135716 ?auto_135715 ) ( ON ?auto_135717 ?auto_135716 ) ( ON ?auto_135718 ?auto_135717 ) ( ON ?auto_135719 ?auto_135718 ) ( not ( = ?auto_135714 ?auto_135715 ) ) ( not ( = ?auto_135714 ?auto_135716 ) ) ( not ( = ?auto_135714 ?auto_135717 ) ) ( not ( = ?auto_135714 ?auto_135718 ) ) ( not ( = ?auto_135714 ?auto_135719 ) ) ( not ( = ?auto_135714 ?auto_135720 ) ) ( not ( = ?auto_135715 ?auto_135716 ) ) ( not ( = ?auto_135715 ?auto_135717 ) ) ( not ( = ?auto_135715 ?auto_135718 ) ) ( not ( = ?auto_135715 ?auto_135719 ) ) ( not ( = ?auto_135715 ?auto_135720 ) ) ( not ( = ?auto_135716 ?auto_135717 ) ) ( not ( = ?auto_135716 ?auto_135718 ) ) ( not ( = ?auto_135716 ?auto_135719 ) ) ( not ( = ?auto_135716 ?auto_135720 ) ) ( not ( = ?auto_135717 ?auto_135718 ) ) ( not ( = ?auto_135717 ?auto_135719 ) ) ( not ( = ?auto_135717 ?auto_135720 ) ) ( not ( = ?auto_135718 ?auto_135719 ) ) ( not ( = ?auto_135718 ?auto_135720 ) ) ( not ( = ?auto_135719 ?auto_135720 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_135720 ?auto_135719 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_135721 - BLOCK
      ?auto_135722 - BLOCK
      ?auto_135723 - BLOCK
      ?auto_135724 - BLOCK
      ?auto_135725 - BLOCK
      ?auto_135726 - BLOCK
    )
    :vars
    (
      ?auto_135727 - BLOCK
      ?auto_135728 - BLOCK
      ?auto_135729 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_135727 ?auto_135726 ) ( CLEAR ?auto_135727 ) ( ON-TABLE ?auto_135721 ) ( ON ?auto_135722 ?auto_135721 ) ( ON ?auto_135723 ?auto_135722 ) ( ON ?auto_135724 ?auto_135723 ) ( ON ?auto_135725 ?auto_135724 ) ( ON ?auto_135726 ?auto_135725 ) ( not ( = ?auto_135721 ?auto_135722 ) ) ( not ( = ?auto_135721 ?auto_135723 ) ) ( not ( = ?auto_135721 ?auto_135724 ) ) ( not ( = ?auto_135721 ?auto_135725 ) ) ( not ( = ?auto_135721 ?auto_135726 ) ) ( not ( = ?auto_135721 ?auto_135727 ) ) ( not ( = ?auto_135722 ?auto_135723 ) ) ( not ( = ?auto_135722 ?auto_135724 ) ) ( not ( = ?auto_135722 ?auto_135725 ) ) ( not ( = ?auto_135722 ?auto_135726 ) ) ( not ( = ?auto_135722 ?auto_135727 ) ) ( not ( = ?auto_135723 ?auto_135724 ) ) ( not ( = ?auto_135723 ?auto_135725 ) ) ( not ( = ?auto_135723 ?auto_135726 ) ) ( not ( = ?auto_135723 ?auto_135727 ) ) ( not ( = ?auto_135724 ?auto_135725 ) ) ( not ( = ?auto_135724 ?auto_135726 ) ) ( not ( = ?auto_135724 ?auto_135727 ) ) ( not ( = ?auto_135725 ?auto_135726 ) ) ( not ( = ?auto_135725 ?auto_135727 ) ) ( not ( = ?auto_135726 ?auto_135727 ) ) ( HOLDING ?auto_135728 ) ( CLEAR ?auto_135729 ) ( not ( = ?auto_135721 ?auto_135728 ) ) ( not ( = ?auto_135721 ?auto_135729 ) ) ( not ( = ?auto_135722 ?auto_135728 ) ) ( not ( = ?auto_135722 ?auto_135729 ) ) ( not ( = ?auto_135723 ?auto_135728 ) ) ( not ( = ?auto_135723 ?auto_135729 ) ) ( not ( = ?auto_135724 ?auto_135728 ) ) ( not ( = ?auto_135724 ?auto_135729 ) ) ( not ( = ?auto_135725 ?auto_135728 ) ) ( not ( = ?auto_135725 ?auto_135729 ) ) ( not ( = ?auto_135726 ?auto_135728 ) ) ( not ( = ?auto_135726 ?auto_135729 ) ) ( not ( = ?auto_135727 ?auto_135728 ) ) ( not ( = ?auto_135727 ?auto_135729 ) ) ( not ( = ?auto_135728 ?auto_135729 ) ) )
    :subtasks
    ( ( !STACK ?auto_135728 ?auto_135729 )
      ( MAKE-6PILE ?auto_135721 ?auto_135722 ?auto_135723 ?auto_135724 ?auto_135725 ?auto_135726 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_137061 - BLOCK
      ?auto_137062 - BLOCK
      ?auto_137063 - BLOCK
      ?auto_137064 - BLOCK
      ?auto_137065 - BLOCK
      ?auto_137066 - BLOCK
    )
    :vars
    (
      ?auto_137067 - BLOCK
      ?auto_137068 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_137067 ?auto_137066 ) ( ON-TABLE ?auto_137061 ) ( ON ?auto_137062 ?auto_137061 ) ( ON ?auto_137063 ?auto_137062 ) ( ON ?auto_137064 ?auto_137063 ) ( ON ?auto_137065 ?auto_137064 ) ( ON ?auto_137066 ?auto_137065 ) ( not ( = ?auto_137061 ?auto_137062 ) ) ( not ( = ?auto_137061 ?auto_137063 ) ) ( not ( = ?auto_137061 ?auto_137064 ) ) ( not ( = ?auto_137061 ?auto_137065 ) ) ( not ( = ?auto_137061 ?auto_137066 ) ) ( not ( = ?auto_137061 ?auto_137067 ) ) ( not ( = ?auto_137062 ?auto_137063 ) ) ( not ( = ?auto_137062 ?auto_137064 ) ) ( not ( = ?auto_137062 ?auto_137065 ) ) ( not ( = ?auto_137062 ?auto_137066 ) ) ( not ( = ?auto_137062 ?auto_137067 ) ) ( not ( = ?auto_137063 ?auto_137064 ) ) ( not ( = ?auto_137063 ?auto_137065 ) ) ( not ( = ?auto_137063 ?auto_137066 ) ) ( not ( = ?auto_137063 ?auto_137067 ) ) ( not ( = ?auto_137064 ?auto_137065 ) ) ( not ( = ?auto_137064 ?auto_137066 ) ) ( not ( = ?auto_137064 ?auto_137067 ) ) ( not ( = ?auto_137065 ?auto_137066 ) ) ( not ( = ?auto_137065 ?auto_137067 ) ) ( not ( = ?auto_137066 ?auto_137067 ) ) ( not ( = ?auto_137061 ?auto_137068 ) ) ( not ( = ?auto_137062 ?auto_137068 ) ) ( not ( = ?auto_137063 ?auto_137068 ) ) ( not ( = ?auto_137064 ?auto_137068 ) ) ( not ( = ?auto_137065 ?auto_137068 ) ) ( not ( = ?auto_137066 ?auto_137068 ) ) ( not ( = ?auto_137067 ?auto_137068 ) ) ( ON ?auto_137068 ?auto_137067 ) ( CLEAR ?auto_137068 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_137061 ?auto_137062 ?auto_137063 ?auto_137064 ?auto_137065 ?auto_137066 ?auto_137067 )
      ( MAKE-6PILE ?auto_137061 ?auto_137062 ?auto_137063 ?auto_137064 ?auto_137065 ?auto_137066 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_135739 - BLOCK
      ?auto_135740 - BLOCK
      ?auto_135741 - BLOCK
      ?auto_135742 - BLOCK
      ?auto_135743 - BLOCK
      ?auto_135744 - BLOCK
    )
    :vars
    (
      ?auto_135745 - BLOCK
      ?auto_135747 - BLOCK
      ?auto_135746 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_135745 ?auto_135744 ) ( ON-TABLE ?auto_135739 ) ( ON ?auto_135740 ?auto_135739 ) ( ON ?auto_135741 ?auto_135740 ) ( ON ?auto_135742 ?auto_135741 ) ( ON ?auto_135743 ?auto_135742 ) ( ON ?auto_135744 ?auto_135743 ) ( not ( = ?auto_135739 ?auto_135740 ) ) ( not ( = ?auto_135739 ?auto_135741 ) ) ( not ( = ?auto_135739 ?auto_135742 ) ) ( not ( = ?auto_135739 ?auto_135743 ) ) ( not ( = ?auto_135739 ?auto_135744 ) ) ( not ( = ?auto_135739 ?auto_135745 ) ) ( not ( = ?auto_135740 ?auto_135741 ) ) ( not ( = ?auto_135740 ?auto_135742 ) ) ( not ( = ?auto_135740 ?auto_135743 ) ) ( not ( = ?auto_135740 ?auto_135744 ) ) ( not ( = ?auto_135740 ?auto_135745 ) ) ( not ( = ?auto_135741 ?auto_135742 ) ) ( not ( = ?auto_135741 ?auto_135743 ) ) ( not ( = ?auto_135741 ?auto_135744 ) ) ( not ( = ?auto_135741 ?auto_135745 ) ) ( not ( = ?auto_135742 ?auto_135743 ) ) ( not ( = ?auto_135742 ?auto_135744 ) ) ( not ( = ?auto_135742 ?auto_135745 ) ) ( not ( = ?auto_135743 ?auto_135744 ) ) ( not ( = ?auto_135743 ?auto_135745 ) ) ( not ( = ?auto_135744 ?auto_135745 ) ) ( not ( = ?auto_135739 ?auto_135747 ) ) ( not ( = ?auto_135739 ?auto_135746 ) ) ( not ( = ?auto_135740 ?auto_135747 ) ) ( not ( = ?auto_135740 ?auto_135746 ) ) ( not ( = ?auto_135741 ?auto_135747 ) ) ( not ( = ?auto_135741 ?auto_135746 ) ) ( not ( = ?auto_135742 ?auto_135747 ) ) ( not ( = ?auto_135742 ?auto_135746 ) ) ( not ( = ?auto_135743 ?auto_135747 ) ) ( not ( = ?auto_135743 ?auto_135746 ) ) ( not ( = ?auto_135744 ?auto_135747 ) ) ( not ( = ?auto_135744 ?auto_135746 ) ) ( not ( = ?auto_135745 ?auto_135747 ) ) ( not ( = ?auto_135745 ?auto_135746 ) ) ( not ( = ?auto_135747 ?auto_135746 ) ) ( ON ?auto_135747 ?auto_135745 ) ( CLEAR ?auto_135747 ) ( HOLDING ?auto_135746 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_135746 )
      ( MAKE-6PILE ?auto_135739 ?auto_135740 ?auto_135741 ?auto_135742 ?auto_135743 ?auto_135744 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_135748 - BLOCK
      ?auto_135749 - BLOCK
      ?auto_135750 - BLOCK
      ?auto_135751 - BLOCK
      ?auto_135752 - BLOCK
      ?auto_135753 - BLOCK
    )
    :vars
    (
      ?auto_135754 - BLOCK
      ?auto_135756 - BLOCK
      ?auto_135755 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_135754 ?auto_135753 ) ( ON-TABLE ?auto_135748 ) ( ON ?auto_135749 ?auto_135748 ) ( ON ?auto_135750 ?auto_135749 ) ( ON ?auto_135751 ?auto_135750 ) ( ON ?auto_135752 ?auto_135751 ) ( ON ?auto_135753 ?auto_135752 ) ( not ( = ?auto_135748 ?auto_135749 ) ) ( not ( = ?auto_135748 ?auto_135750 ) ) ( not ( = ?auto_135748 ?auto_135751 ) ) ( not ( = ?auto_135748 ?auto_135752 ) ) ( not ( = ?auto_135748 ?auto_135753 ) ) ( not ( = ?auto_135748 ?auto_135754 ) ) ( not ( = ?auto_135749 ?auto_135750 ) ) ( not ( = ?auto_135749 ?auto_135751 ) ) ( not ( = ?auto_135749 ?auto_135752 ) ) ( not ( = ?auto_135749 ?auto_135753 ) ) ( not ( = ?auto_135749 ?auto_135754 ) ) ( not ( = ?auto_135750 ?auto_135751 ) ) ( not ( = ?auto_135750 ?auto_135752 ) ) ( not ( = ?auto_135750 ?auto_135753 ) ) ( not ( = ?auto_135750 ?auto_135754 ) ) ( not ( = ?auto_135751 ?auto_135752 ) ) ( not ( = ?auto_135751 ?auto_135753 ) ) ( not ( = ?auto_135751 ?auto_135754 ) ) ( not ( = ?auto_135752 ?auto_135753 ) ) ( not ( = ?auto_135752 ?auto_135754 ) ) ( not ( = ?auto_135753 ?auto_135754 ) ) ( not ( = ?auto_135748 ?auto_135756 ) ) ( not ( = ?auto_135748 ?auto_135755 ) ) ( not ( = ?auto_135749 ?auto_135756 ) ) ( not ( = ?auto_135749 ?auto_135755 ) ) ( not ( = ?auto_135750 ?auto_135756 ) ) ( not ( = ?auto_135750 ?auto_135755 ) ) ( not ( = ?auto_135751 ?auto_135756 ) ) ( not ( = ?auto_135751 ?auto_135755 ) ) ( not ( = ?auto_135752 ?auto_135756 ) ) ( not ( = ?auto_135752 ?auto_135755 ) ) ( not ( = ?auto_135753 ?auto_135756 ) ) ( not ( = ?auto_135753 ?auto_135755 ) ) ( not ( = ?auto_135754 ?auto_135756 ) ) ( not ( = ?auto_135754 ?auto_135755 ) ) ( not ( = ?auto_135756 ?auto_135755 ) ) ( ON ?auto_135756 ?auto_135754 ) ( ON ?auto_135755 ?auto_135756 ) ( CLEAR ?auto_135755 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_135748 ?auto_135749 ?auto_135750 ?auto_135751 ?auto_135752 ?auto_135753 ?auto_135754 ?auto_135756 )
      ( MAKE-6PILE ?auto_135748 ?auto_135749 ?auto_135750 ?auto_135751 ?auto_135752 ?auto_135753 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_135760 - BLOCK
      ?auto_135761 - BLOCK
      ?auto_135762 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_135762 ) ( CLEAR ?auto_135761 ) ( ON-TABLE ?auto_135760 ) ( ON ?auto_135761 ?auto_135760 ) ( not ( = ?auto_135760 ?auto_135761 ) ) ( not ( = ?auto_135760 ?auto_135762 ) ) ( not ( = ?auto_135761 ?auto_135762 ) ) )
    :subtasks
    ( ( !STACK ?auto_135762 ?auto_135761 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_135763 - BLOCK
      ?auto_135764 - BLOCK
      ?auto_135765 - BLOCK
    )
    :vars
    (
      ?auto_135766 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_135764 ) ( ON-TABLE ?auto_135763 ) ( ON ?auto_135764 ?auto_135763 ) ( not ( = ?auto_135763 ?auto_135764 ) ) ( not ( = ?auto_135763 ?auto_135765 ) ) ( not ( = ?auto_135764 ?auto_135765 ) ) ( ON ?auto_135765 ?auto_135766 ) ( CLEAR ?auto_135765 ) ( HAND-EMPTY ) ( not ( = ?auto_135763 ?auto_135766 ) ) ( not ( = ?auto_135764 ?auto_135766 ) ) ( not ( = ?auto_135765 ?auto_135766 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_135765 ?auto_135766 )
      ( MAKE-3PILE ?auto_135763 ?auto_135764 ?auto_135765 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_135767 - BLOCK
      ?auto_135768 - BLOCK
      ?auto_135769 - BLOCK
    )
    :vars
    (
      ?auto_135770 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_135767 ) ( not ( = ?auto_135767 ?auto_135768 ) ) ( not ( = ?auto_135767 ?auto_135769 ) ) ( not ( = ?auto_135768 ?auto_135769 ) ) ( ON ?auto_135769 ?auto_135770 ) ( CLEAR ?auto_135769 ) ( not ( = ?auto_135767 ?auto_135770 ) ) ( not ( = ?auto_135768 ?auto_135770 ) ) ( not ( = ?auto_135769 ?auto_135770 ) ) ( HOLDING ?auto_135768 ) ( CLEAR ?auto_135767 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_135767 ?auto_135768 )
      ( MAKE-3PILE ?auto_135767 ?auto_135768 ?auto_135769 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_135771 - BLOCK
      ?auto_135772 - BLOCK
      ?auto_135773 - BLOCK
    )
    :vars
    (
      ?auto_135774 - BLOCK
      ?auto_135775 - BLOCK
      ?auto_135777 - BLOCK
      ?auto_135778 - BLOCK
      ?auto_135779 - BLOCK
      ?auto_135776 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_135771 ) ( not ( = ?auto_135771 ?auto_135772 ) ) ( not ( = ?auto_135771 ?auto_135773 ) ) ( not ( = ?auto_135772 ?auto_135773 ) ) ( ON ?auto_135773 ?auto_135774 ) ( not ( = ?auto_135771 ?auto_135774 ) ) ( not ( = ?auto_135772 ?auto_135774 ) ) ( not ( = ?auto_135773 ?auto_135774 ) ) ( CLEAR ?auto_135771 ) ( ON ?auto_135772 ?auto_135773 ) ( CLEAR ?auto_135772 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_135775 ) ( ON ?auto_135777 ?auto_135775 ) ( ON ?auto_135778 ?auto_135777 ) ( ON ?auto_135779 ?auto_135778 ) ( ON ?auto_135776 ?auto_135779 ) ( ON ?auto_135774 ?auto_135776 ) ( not ( = ?auto_135775 ?auto_135777 ) ) ( not ( = ?auto_135775 ?auto_135778 ) ) ( not ( = ?auto_135775 ?auto_135779 ) ) ( not ( = ?auto_135775 ?auto_135776 ) ) ( not ( = ?auto_135775 ?auto_135774 ) ) ( not ( = ?auto_135775 ?auto_135773 ) ) ( not ( = ?auto_135775 ?auto_135772 ) ) ( not ( = ?auto_135777 ?auto_135778 ) ) ( not ( = ?auto_135777 ?auto_135779 ) ) ( not ( = ?auto_135777 ?auto_135776 ) ) ( not ( = ?auto_135777 ?auto_135774 ) ) ( not ( = ?auto_135777 ?auto_135773 ) ) ( not ( = ?auto_135777 ?auto_135772 ) ) ( not ( = ?auto_135778 ?auto_135779 ) ) ( not ( = ?auto_135778 ?auto_135776 ) ) ( not ( = ?auto_135778 ?auto_135774 ) ) ( not ( = ?auto_135778 ?auto_135773 ) ) ( not ( = ?auto_135778 ?auto_135772 ) ) ( not ( = ?auto_135779 ?auto_135776 ) ) ( not ( = ?auto_135779 ?auto_135774 ) ) ( not ( = ?auto_135779 ?auto_135773 ) ) ( not ( = ?auto_135779 ?auto_135772 ) ) ( not ( = ?auto_135776 ?auto_135774 ) ) ( not ( = ?auto_135776 ?auto_135773 ) ) ( not ( = ?auto_135776 ?auto_135772 ) ) ( not ( = ?auto_135771 ?auto_135775 ) ) ( not ( = ?auto_135771 ?auto_135777 ) ) ( not ( = ?auto_135771 ?auto_135778 ) ) ( not ( = ?auto_135771 ?auto_135779 ) ) ( not ( = ?auto_135771 ?auto_135776 ) ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_135775 ?auto_135777 ?auto_135778 ?auto_135779 ?auto_135776 ?auto_135774 ?auto_135773 )
      ( MAKE-3PILE ?auto_135771 ?auto_135772 ?auto_135773 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_135780 - BLOCK
      ?auto_135781 - BLOCK
      ?auto_135782 - BLOCK
    )
    :vars
    (
      ?auto_135783 - BLOCK
      ?auto_135785 - BLOCK
      ?auto_135786 - BLOCK
      ?auto_135788 - BLOCK
      ?auto_135784 - BLOCK
      ?auto_135787 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_135780 ?auto_135781 ) ) ( not ( = ?auto_135780 ?auto_135782 ) ) ( not ( = ?auto_135781 ?auto_135782 ) ) ( ON ?auto_135782 ?auto_135783 ) ( not ( = ?auto_135780 ?auto_135783 ) ) ( not ( = ?auto_135781 ?auto_135783 ) ) ( not ( = ?auto_135782 ?auto_135783 ) ) ( ON ?auto_135781 ?auto_135782 ) ( CLEAR ?auto_135781 ) ( ON-TABLE ?auto_135785 ) ( ON ?auto_135786 ?auto_135785 ) ( ON ?auto_135788 ?auto_135786 ) ( ON ?auto_135784 ?auto_135788 ) ( ON ?auto_135787 ?auto_135784 ) ( ON ?auto_135783 ?auto_135787 ) ( not ( = ?auto_135785 ?auto_135786 ) ) ( not ( = ?auto_135785 ?auto_135788 ) ) ( not ( = ?auto_135785 ?auto_135784 ) ) ( not ( = ?auto_135785 ?auto_135787 ) ) ( not ( = ?auto_135785 ?auto_135783 ) ) ( not ( = ?auto_135785 ?auto_135782 ) ) ( not ( = ?auto_135785 ?auto_135781 ) ) ( not ( = ?auto_135786 ?auto_135788 ) ) ( not ( = ?auto_135786 ?auto_135784 ) ) ( not ( = ?auto_135786 ?auto_135787 ) ) ( not ( = ?auto_135786 ?auto_135783 ) ) ( not ( = ?auto_135786 ?auto_135782 ) ) ( not ( = ?auto_135786 ?auto_135781 ) ) ( not ( = ?auto_135788 ?auto_135784 ) ) ( not ( = ?auto_135788 ?auto_135787 ) ) ( not ( = ?auto_135788 ?auto_135783 ) ) ( not ( = ?auto_135788 ?auto_135782 ) ) ( not ( = ?auto_135788 ?auto_135781 ) ) ( not ( = ?auto_135784 ?auto_135787 ) ) ( not ( = ?auto_135784 ?auto_135783 ) ) ( not ( = ?auto_135784 ?auto_135782 ) ) ( not ( = ?auto_135784 ?auto_135781 ) ) ( not ( = ?auto_135787 ?auto_135783 ) ) ( not ( = ?auto_135787 ?auto_135782 ) ) ( not ( = ?auto_135787 ?auto_135781 ) ) ( not ( = ?auto_135780 ?auto_135785 ) ) ( not ( = ?auto_135780 ?auto_135786 ) ) ( not ( = ?auto_135780 ?auto_135788 ) ) ( not ( = ?auto_135780 ?auto_135784 ) ) ( not ( = ?auto_135780 ?auto_135787 ) ) ( HOLDING ?auto_135780 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_135780 )
      ( MAKE-3PILE ?auto_135780 ?auto_135781 ?auto_135782 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_135789 - BLOCK
      ?auto_135790 - BLOCK
      ?auto_135791 - BLOCK
    )
    :vars
    (
      ?auto_135792 - BLOCK
      ?auto_135795 - BLOCK
      ?auto_135797 - BLOCK
      ?auto_135793 - BLOCK
      ?auto_135794 - BLOCK
      ?auto_135796 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_135789 ?auto_135790 ) ) ( not ( = ?auto_135789 ?auto_135791 ) ) ( not ( = ?auto_135790 ?auto_135791 ) ) ( ON ?auto_135791 ?auto_135792 ) ( not ( = ?auto_135789 ?auto_135792 ) ) ( not ( = ?auto_135790 ?auto_135792 ) ) ( not ( = ?auto_135791 ?auto_135792 ) ) ( ON ?auto_135790 ?auto_135791 ) ( ON-TABLE ?auto_135795 ) ( ON ?auto_135797 ?auto_135795 ) ( ON ?auto_135793 ?auto_135797 ) ( ON ?auto_135794 ?auto_135793 ) ( ON ?auto_135796 ?auto_135794 ) ( ON ?auto_135792 ?auto_135796 ) ( not ( = ?auto_135795 ?auto_135797 ) ) ( not ( = ?auto_135795 ?auto_135793 ) ) ( not ( = ?auto_135795 ?auto_135794 ) ) ( not ( = ?auto_135795 ?auto_135796 ) ) ( not ( = ?auto_135795 ?auto_135792 ) ) ( not ( = ?auto_135795 ?auto_135791 ) ) ( not ( = ?auto_135795 ?auto_135790 ) ) ( not ( = ?auto_135797 ?auto_135793 ) ) ( not ( = ?auto_135797 ?auto_135794 ) ) ( not ( = ?auto_135797 ?auto_135796 ) ) ( not ( = ?auto_135797 ?auto_135792 ) ) ( not ( = ?auto_135797 ?auto_135791 ) ) ( not ( = ?auto_135797 ?auto_135790 ) ) ( not ( = ?auto_135793 ?auto_135794 ) ) ( not ( = ?auto_135793 ?auto_135796 ) ) ( not ( = ?auto_135793 ?auto_135792 ) ) ( not ( = ?auto_135793 ?auto_135791 ) ) ( not ( = ?auto_135793 ?auto_135790 ) ) ( not ( = ?auto_135794 ?auto_135796 ) ) ( not ( = ?auto_135794 ?auto_135792 ) ) ( not ( = ?auto_135794 ?auto_135791 ) ) ( not ( = ?auto_135794 ?auto_135790 ) ) ( not ( = ?auto_135796 ?auto_135792 ) ) ( not ( = ?auto_135796 ?auto_135791 ) ) ( not ( = ?auto_135796 ?auto_135790 ) ) ( not ( = ?auto_135789 ?auto_135795 ) ) ( not ( = ?auto_135789 ?auto_135797 ) ) ( not ( = ?auto_135789 ?auto_135793 ) ) ( not ( = ?auto_135789 ?auto_135794 ) ) ( not ( = ?auto_135789 ?auto_135796 ) ) ( ON ?auto_135789 ?auto_135790 ) ( CLEAR ?auto_135789 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_135795 ?auto_135797 ?auto_135793 ?auto_135794 ?auto_135796 ?auto_135792 ?auto_135791 ?auto_135790 )
      ( MAKE-3PILE ?auto_135789 ?auto_135790 ?auto_135791 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_135803 - BLOCK
      ?auto_135804 - BLOCK
      ?auto_135805 - BLOCK
      ?auto_135806 - BLOCK
      ?auto_135807 - BLOCK
    )
    :vars
    (
      ?auto_135808 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_135808 ?auto_135807 ) ( CLEAR ?auto_135808 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_135803 ) ( ON ?auto_135804 ?auto_135803 ) ( ON ?auto_135805 ?auto_135804 ) ( ON ?auto_135806 ?auto_135805 ) ( ON ?auto_135807 ?auto_135806 ) ( not ( = ?auto_135803 ?auto_135804 ) ) ( not ( = ?auto_135803 ?auto_135805 ) ) ( not ( = ?auto_135803 ?auto_135806 ) ) ( not ( = ?auto_135803 ?auto_135807 ) ) ( not ( = ?auto_135803 ?auto_135808 ) ) ( not ( = ?auto_135804 ?auto_135805 ) ) ( not ( = ?auto_135804 ?auto_135806 ) ) ( not ( = ?auto_135804 ?auto_135807 ) ) ( not ( = ?auto_135804 ?auto_135808 ) ) ( not ( = ?auto_135805 ?auto_135806 ) ) ( not ( = ?auto_135805 ?auto_135807 ) ) ( not ( = ?auto_135805 ?auto_135808 ) ) ( not ( = ?auto_135806 ?auto_135807 ) ) ( not ( = ?auto_135806 ?auto_135808 ) ) ( not ( = ?auto_135807 ?auto_135808 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_135808 ?auto_135807 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_135809 - BLOCK
      ?auto_135810 - BLOCK
      ?auto_135811 - BLOCK
      ?auto_135812 - BLOCK
      ?auto_135813 - BLOCK
    )
    :vars
    (
      ?auto_135814 - BLOCK
      ?auto_135815 - BLOCK
      ?auto_135816 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_135814 ?auto_135813 ) ( CLEAR ?auto_135814 ) ( ON-TABLE ?auto_135809 ) ( ON ?auto_135810 ?auto_135809 ) ( ON ?auto_135811 ?auto_135810 ) ( ON ?auto_135812 ?auto_135811 ) ( ON ?auto_135813 ?auto_135812 ) ( not ( = ?auto_135809 ?auto_135810 ) ) ( not ( = ?auto_135809 ?auto_135811 ) ) ( not ( = ?auto_135809 ?auto_135812 ) ) ( not ( = ?auto_135809 ?auto_135813 ) ) ( not ( = ?auto_135809 ?auto_135814 ) ) ( not ( = ?auto_135810 ?auto_135811 ) ) ( not ( = ?auto_135810 ?auto_135812 ) ) ( not ( = ?auto_135810 ?auto_135813 ) ) ( not ( = ?auto_135810 ?auto_135814 ) ) ( not ( = ?auto_135811 ?auto_135812 ) ) ( not ( = ?auto_135811 ?auto_135813 ) ) ( not ( = ?auto_135811 ?auto_135814 ) ) ( not ( = ?auto_135812 ?auto_135813 ) ) ( not ( = ?auto_135812 ?auto_135814 ) ) ( not ( = ?auto_135813 ?auto_135814 ) ) ( HOLDING ?auto_135815 ) ( CLEAR ?auto_135816 ) ( not ( = ?auto_135809 ?auto_135815 ) ) ( not ( = ?auto_135809 ?auto_135816 ) ) ( not ( = ?auto_135810 ?auto_135815 ) ) ( not ( = ?auto_135810 ?auto_135816 ) ) ( not ( = ?auto_135811 ?auto_135815 ) ) ( not ( = ?auto_135811 ?auto_135816 ) ) ( not ( = ?auto_135812 ?auto_135815 ) ) ( not ( = ?auto_135812 ?auto_135816 ) ) ( not ( = ?auto_135813 ?auto_135815 ) ) ( not ( = ?auto_135813 ?auto_135816 ) ) ( not ( = ?auto_135814 ?auto_135815 ) ) ( not ( = ?auto_135814 ?auto_135816 ) ) ( not ( = ?auto_135815 ?auto_135816 ) ) )
    :subtasks
    ( ( !STACK ?auto_135815 ?auto_135816 )
      ( MAKE-5PILE ?auto_135809 ?auto_135810 ?auto_135811 ?auto_135812 ?auto_135813 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_135817 - BLOCK
      ?auto_135818 - BLOCK
      ?auto_135819 - BLOCK
      ?auto_135820 - BLOCK
      ?auto_135821 - BLOCK
    )
    :vars
    (
      ?auto_135823 - BLOCK
      ?auto_135822 - BLOCK
      ?auto_135824 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_135823 ?auto_135821 ) ( ON-TABLE ?auto_135817 ) ( ON ?auto_135818 ?auto_135817 ) ( ON ?auto_135819 ?auto_135818 ) ( ON ?auto_135820 ?auto_135819 ) ( ON ?auto_135821 ?auto_135820 ) ( not ( = ?auto_135817 ?auto_135818 ) ) ( not ( = ?auto_135817 ?auto_135819 ) ) ( not ( = ?auto_135817 ?auto_135820 ) ) ( not ( = ?auto_135817 ?auto_135821 ) ) ( not ( = ?auto_135817 ?auto_135823 ) ) ( not ( = ?auto_135818 ?auto_135819 ) ) ( not ( = ?auto_135818 ?auto_135820 ) ) ( not ( = ?auto_135818 ?auto_135821 ) ) ( not ( = ?auto_135818 ?auto_135823 ) ) ( not ( = ?auto_135819 ?auto_135820 ) ) ( not ( = ?auto_135819 ?auto_135821 ) ) ( not ( = ?auto_135819 ?auto_135823 ) ) ( not ( = ?auto_135820 ?auto_135821 ) ) ( not ( = ?auto_135820 ?auto_135823 ) ) ( not ( = ?auto_135821 ?auto_135823 ) ) ( CLEAR ?auto_135822 ) ( not ( = ?auto_135817 ?auto_135824 ) ) ( not ( = ?auto_135817 ?auto_135822 ) ) ( not ( = ?auto_135818 ?auto_135824 ) ) ( not ( = ?auto_135818 ?auto_135822 ) ) ( not ( = ?auto_135819 ?auto_135824 ) ) ( not ( = ?auto_135819 ?auto_135822 ) ) ( not ( = ?auto_135820 ?auto_135824 ) ) ( not ( = ?auto_135820 ?auto_135822 ) ) ( not ( = ?auto_135821 ?auto_135824 ) ) ( not ( = ?auto_135821 ?auto_135822 ) ) ( not ( = ?auto_135823 ?auto_135824 ) ) ( not ( = ?auto_135823 ?auto_135822 ) ) ( not ( = ?auto_135824 ?auto_135822 ) ) ( ON ?auto_135824 ?auto_135823 ) ( CLEAR ?auto_135824 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_135817 ?auto_135818 ?auto_135819 ?auto_135820 ?auto_135821 ?auto_135823 )
      ( MAKE-5PILE ?auto_135817 ?auto_135818 ?auto_135819 ?auto_135820 ?auto_135821 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_135825 - BLOCK
      ?auto_135826 - BLOCK
      ?auto_135827 - BLOCK
      ?auto_135828 - BLOCK
      ?auto_135829 - BLOCK
    )
    :vars
    (
      ?auto_135832 - BLOCK
      ?auto_135830 - BLOCK
      ?auto_135831 - BLOCK
      ?auto_135833 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_135832 ?auto_135829 ) ( ON-TABLE ?auto_135825 ) ( ON ?auto_135826 ?auto_135825 ) ( ON ?auto_135827 ?auto_135826 ) ( ON ?auto_135828 ?auto_135827 ) ( ON ?auto_135829 ?auto_135828 ) ( not ( = ?auto_135825 ?auto_135826 ) ) ( not ( = ?auto_135825 ?auto_135827 ) ) ( not ( = ?auto_135825 ?auto_135828 ) ) ( not ( = ?auto_135825 ?auto_135829 ) ) ( not ( = ?auto_135825 ?auto_135832 ) ) ( not ( = ?auto_135826 ?auto_135827 ) ) ( not ( = ?auto_135826 ?auto_135828 ) ) ( not ( = ?auto_135826 ?auto_135829 ) ) ( not ( = ?auto_135826 ?auto_135832 ) ) ( not ( = ?auto_135827 ?auto_135828 ) ) ( not ( = ?auto_135827 ?auto_135829 ) ) ( not ( = ?auto_135827 ?auto_135832 ) ) ( not ( = ?auto_135828 ?auto_135829 ) ) ( not ( = ?auto_135828 ?auto_135832 ) ) ( not ( = ?auto_135829 ?auto_135832 ) ) ( not ( = ?auto_135825 ?auto_135830 ) ) ( not ( = ?auto_135825 ?auto_135831 ) ) ( not ( = ?auto_135826 ?auto_135830 ) ) ( not ( = ?auto_135826 ?auto_135831 ) ) ( not ( = ?auto_135827 ?auto_135830 ) ) ( not ( = ?auto_135827 ?auto_135831 ) ) ( not ( = ?auto_135828 ?auto_135830 ) ) ( not ( = ?auto_135828 ?auto_135831 ) ) ( not ( = ?auto_135829 ?auto_135830 ) ) ( not ( = ?auto_135829 ?auto_135831 ) ) ( not ( = ?auto_135832 ?auto_135830 ) ) ( not ( = ?auto_135832 ?auto_135831 ) ) ( not ( = ?auto_135830 ?auto_135831 ) ) ( ON ?auto_135830 ?auto_135832 ) ( CLEAR ?auto_135830 ) ( HOLDING ?auto_135831 ) ( CLEAR ?auto_135833 ) ( ON-TABLE ?auto_135833 ) ( not ( = ?auto_135833 ?auto_135831 ) ) ( not ( = ?auto_135825 ?auto_135833 ) ) ( not ( = ?auto_135826 ?auto_135833 ) ) ( not ( = ?auto_135827 ?auto_135833 ) ) ( not ( = ?auto_135828 ?auto_135833 ) ) ( not ( = ?auto_135829 ?auto_135833 ) ) ( not ( = ?auto_135832 ?auto_135833 ) ) ( not ( = ?auto_135830 ?auto_135833 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_135833 ?auto_135831 )
      ( MAKE-5PILE ?auto_135825 ?auto_135826 ?auto_135827 ?auto_135828 ?auto_135829 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_137353 - BLOCK
      ?auto_137354 - BLOCK
      ?auto_137355 - BLOCK
      ?auto_137356 - BLOCK
      ?auto_137357 - BLOCK
    )
    :vars
    (
      ?auto_137359 - BLOCK
      ?auto_137360 - BLOCK
      ?auto_137358 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_137359 ?auto_137357 ) ( ON-TABLE ?auto_137353 ) ( ON ?auto_137354 ?auto_137353 ) ( ON ?auto_137355 ?auto_137354 ) ( ON ?auto_137356 ?auto_137355 ) ( ON ?auto_137357 ?auto_137356 ) ( not ( = ?auto_137353 ?auto_137354 ) ) ( not ( = ?auto_137353 ?auto_137355 ) ) ( not ( = ?auto_137353 ?auto_137356 ) ) ( not ( = ?auto_137353 ?auto_137357 ) ) ( not ( = ?auto_137353 ?auto_137359 ) ) ( not ( = ?auto_137354 ?auto_137355 ) ) ( not ( = ?auto_137354 ?auto_137356 ) ) ( not ( = ?auto_137354 ?auto_137357 ) ) ( not ( = ?auto_137354 ?auto_137359 ) ) ( not ( = ?auto_137355 ?auto_137356 ) ) ( not ( = ?auto_137355 ?auto_137357 ) ) ( not ( = ?auto_137355 ?auto_137359 ) ) ( not ( = ?auto_137356 ?auto_137357 ) ) ( not ( = ?auto_137356 ?auto_137359 ) ) ( not ( = ?auto_137357 ?auto_137359 ) ) ( not ( = ?auto_137353 ?auto_137360 ) ) ( not ( = ?auto_137353 ?auto_137358 ) ) ( not ( = ?auto_137354 ?auto_137360 ) ) ( not ( = ?auto_137354 ?auto_137358 ) ) ( not ( = ?auto_137355 ?auto_137360 ) ) ( not ( = ?auto_137355 ?auto_137358 ) ) ( not ( = ?auto_137356 ?auto_137360 ) ) ( not ( = ?auto_137356 ?auto_137358 ) ) ( not ( = ?auto_137357 ?auto_137360 ) ) ( not ( = ?auto_137357 ?auto_137358 ) ) ( not ( = ?auto_137359 ?auto_137360 ) ) ( not ( = ?auto_137359 ?auto_137358 ) ) ( not ( = ?auto_137360 ?auto_137358 ) ) ( ON ?auto_137360 ?auto_137359 ) ( ON ?auto_137358 ?auto_137360 ) ( CLEAR ?auto_137358 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_137353 ?auto_137354 ?auto_137355 ?auto_137356 ?auto_137357 ?auto_137359 ?auto_137360 )
      ( MAKE-5PILE ?auto_137353 ?auto_137354 ?auto_137355 ?auto_137356 ?auto_137357 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_135843 - BLOCK
      ?auto_135844 - BLOCK
      ?auto_135845 - BLOCK
      ?auto_135846 - BLOCK
      ?auto_135847 - BLOCK
    )
    :vars
    (
      ?auto_135848 - BLOCK
      ?auto_135851 - BLOCK
      ?auto_135850 - BLOCK
      ?auto_135849 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_135848 ?auto_135847 ) ( ON-TABLE ?auto_135843 ) ( ON ?auto_135844 ?auto_135843 ) ( ON ?auto_135845 ?auto_135844 ) ( ON ?auto_135846 ?auto_135845 ) ( ON ?auto_135847 ?auto_135846 ) ( not ( = ?auto_135843 ?auto_135844 ) ) ( not ( = ?auto_135843 ?auto_135845 ) ) ( not ( = ?auto_135843 ?auto_135846 ) ) ( not ( = ?auto_135843 ?auto_135847 ) ) ( not ( = ?auto_135843 ?auto_135848 ) ) ( not ( = ?auto_135844 ?auto_135845 ) ) ( not ( = ?auto_135844 ?auto_135846 ) ) ( not ( = ?auto_135844 ?auto_135847 ) ) ( not ( = ?auto_135844 ?auto_135848 ) ) ( not ( = ?auto_135845 ?auto_135846 ) ) ( not ( = ?auto_135845 ?auto_135847 ) ) ( not ( = ?auto_135845 ?auto_135848 ) ) ( not ( = ?auto_135846 ?auto_135847 ) ) ( not ( = ?auto_135846 ?auto_135848 ) ) ( not ( = ?auto_135847 ?auto_135848 ) ) ( not ( = ?auto_135843 ?auto_135851 ) ) ( not ( = ?auto_135843 ?auto_135850 ) ) ( not ( = ?auto_135844 ?auto_135851 ) ) ( not ( = ?auto_135844 ?auto_135850 ) ) ( not ( = ?auto_135845 ?auto_135851 ) ) ( not ( = ?auto_135845 ?auto_135850 ) ) ( not ( = ?auto_135846 ?auto_135851 ) ) ( not ( = ?auto_135846 ?auto_135850 ) ) ( not ( = ?auto_135847 ?auto_135851 ) ) ( not ( = ?auto_135847 ?auto_135850 ) ) ( not ( = ?auto_135848 ?auto_135851 ) ) ( not ( = ?auto_135848 ?auto_135850 ) ) ( not ( = ?auto_135851 ?auto_135850 ) ) ( ON ?auto_135851 ?auto_135848 ) ( not ( = ?auto_135849 ?auto_135850 ) ) ( not ( = ?auto_135843 ?auto_135849 ) ) ( not ( = ?auto_135844 ?auto_135849 ) ) ( not ( = ?auto_135845 ?auto_135849 ) ) ( not ( = ?auto_135846 ?auto_135849 ) ) ( not ( = ?auto_135847 ?auto_135849 ) ) ( not ( = ?auto_135848 ?auto_135849 ) ) ( not ( = ?auto_135851 ?auto_135849 ) ) ( ON ?auto_135850 ?auto_135851 ) ( CLEAR ?auto_135850 ) ( HOLDING ?auto_135849 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_135849 )
      ( MAKE-5PILE ?auto_135843 ?auto_135844 ?auto_135845 ?auto_135846 ?auto_135847 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_135852 - BLOCK
      ?auto_135853 - BLOCK
      ?auto_135854 - BLOCK
      ?auto_135855 - BLOCK
      ?auto_135856 - BLOCK
    )
    :vars
    (
      ?auto_135859 - BLOCK
      ?auto_135858 - BLOCK
      ?auto_135860 - BLOCK
      ?auto_135857 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_135859 ?auto_135856 ) ( ON-TABLE ?auto_135852 ) ( ON ?auto_135853 ?auto_135852 ) ( ON ?auto_135854 ?auto_135853 ) ( ON ?auto_135855 ?auto_135854 ) ( ON ?auto_135856 ?auto_135855 ) ( not ( = ?auto_135852 ?auto_135853 ) ) ( not ( = ?auto_135852 ?auto_135854 ) ) ( not ( = ?auto_135852 ?auto_135855 ) ) ( not ( = ?auto_135852 ?auto_135856 ) ) ( not ( = ?auto_135852 ?auto_135859 ) ) ( not ( = ?auto_135853 ?auto_135854 ) ) ( not ( = ?auto_135853 ?auto_135855 ) ) ( not ( = ?auto_135853 ?auto_135856 ) ) ( not ( = ?auto_135853 ?auto_135859 ) ) ( not ( = ?auto_135854 ?auto_135855 ) ) ( not ( = ?auto_135854 ?auto_135856 ) ) ( not ( = ?auto_135854 ?auto_135859 ) ) ( not ( = ?auto_135855 ?auto_135856 ) ) ( not ( = ?auto_135855 ?auto_135859 ) ) ( not ( = ?auto_135856 ?auto_135859 ) ) ( not ( = ?auto_135852 ?auto_135858 ) ) ( not ( = ?auto_135852 ?auto_135860 ) ) ( not ( = ?auto_135853 ?auto_135858 ) ) ( not ( = ?auto_135853 ?auto_135860 ) ) ( not ( = ?auto_135854 ?auto_135858 ) ) ( not ( = ?auto_135854 ?auto_135860 ) ) ( not ( = ?auto_135855 ?auto_135858 ) ) ( not ( = ?auto_135855 ?auto_135860 ) ) ( not ( = ?auto_135856 ?auto_135858 ) ) ( not ( = ?auto_135856 ?auto_135860 ) ) ( not ( = ?auto_135859 ?auto_135858 ) ) ( not ( = ?auto_135859 ?auto_135860 ) ) ( not ( = ?auto_135858 ?auto_135860 ) ) ( ON ?auto_135858 ?auto_135859 ) ( not ( = ?auto_135857 ?auto_135860 ) ) ( not ( = ?auto_135852 ?auto_135857 ) ) ( not ( = ?auto_135853 ?auto_135857 ) ) ( not ( = ?auto_135854 ?auto_135857 ) ) ( not ( = ?auto_135855 ?auto_135857 ) ) ( not ( = ?auto_135856 ?auto_135857 ) ) ( not ( = ?auto_135859 ?auto_135857 ) ) ( not ( = ?auto_135858 ?auto_135857 ) ) ( ON ?auto_135860 ?auto_135858 ) ( ON ?auto_135857 ?auto_135860 ) ( CLEAR ?auto_135857 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_135852 ?auto_135853 ?auto_135854 ?auto_135855 ?auto_135856 ?auto_135859 ?auto_135858 ?auto_135860 )
      ( MAKE-5PILE ?auto_135852 ?auto_135853 ?auto_135854 ?auto_135855 ?auto_135856 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_135865 - BLOCK
      ?auto_135866 - BLOCK
      ?auto_135867 - BLOCK
      ?auto_135868 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_135868 ) ( CLEAR ?auto_135867 ) ( ON-TABLE ?auto_135865 ) ( ON ?auto_135866 ?auto_135865 ) ( ON ?auto_135867 ?auto_135866 ) ( not ( = ?auto_135865 ?auto_135866 ) ) ( not ( = ?auto_135865 ?auto_135867 ) ) ( not ( = ?auto_135865 ?auto_135868 ) ) ( not ( = ?auto_135866 ?auto_135867 ) ) ( not ( = ?auto_135866 ?auto_135868 ) ) ( not ( = ?auto_135867 ?auto_135868 ) ) )
    :subtasks
    ( ( !STACK ?auto_135868 ?auto_135867 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_135869 - BLOCK
      ?auto_135870 - BLOCK
      ?auto_135871 - BLOCK
      ?auto_135872 - BLOCK
    )
    :vars
    (
      ?auto_135873 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_135871 ) ( ON-TABLE ?auto_135869 ) ( ON ?auto_135870 ?auto_135869 ) ( ON ?auto_135871 ?auto_135870 ) ( not ( = ?auto_135869 ?auto_135870 ) ) ( not ( = ?auto_135869 ?auto_135871 ) ) ( not ( = ?auto_135869 ?auto_135872 ) ) ( not ( = ?auto_135870 ?auto_135871 ) ) ( not ( = ?auto_135870 ?auto_135872 ) ) ( not ( = ?auto_135871 ?auto_135872 ) ) ( ON ?auto_135872 ?auto_135873 ) ( CLEAR ?auto_135872 ) ( HAND-EMPTY ) ( not ( = ?auto_135869 ?auto_135873 ) ) ( not ( = ?auto_135870 ?auto_135873 ) ) ( not ( = ?auto_135871 ?auto_135873 ) ) ( not ( = ?auto_135872 ?auto_135873 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_135872 ?auto_135873 )
      ( MAKE-4PILE ?auto_135869 ?auto_135870 ?auto_135871 ?auto_135872 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_135874 - BLOCK
      ?auto_135875 - BLOCK
      ?auto_135876 - BLOCK
      ?auto_135877 - BLOCK
    )
    :vars
    (
      ?auto_135878 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_135874 ) ( ON ?auto_135875 ?auto_135874 ) ( not ( = ?auto_135874 ?auto_135875 ) ) ( not ( = ?auto_135874 ?auto_135876 ) ) ( not ( = ?auto_135874 ?auto_135877 ) ) ( not ( = ?auto_135875 ?auto_135876 ) ) ( not ( = ?auto_135875 ?auto_135877 ) ) ( not ( = ?auto_135876 ?auto_135877 ) ) ( ON ?auto_135877 ?auto_135878 ) ( CLEAR ?auto_135877 ) ( not ( = ?auto_135874 ?auto_135878 ) ) ( not ( = ?auto_135875 ?auto_135878 ) ) ( not ( = ?auto_135876 ?auto_135878 ) ) ( not ( = ?auto_135877 ?auto_135878 ) ) ( HOLDING ?auto_135876 ) ( CLEAR ?auto_135875 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_135874 ?auto_135875 ?auto_135876 )
      ( MAKE-4PILE ?auto_135874 ?auto_135875 ?auto_135876 ?auto_135877 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_135879 - BLOCK
      ?auto_135880 - BLOCK
      ?auto_135881 - BLOCK
      ?auto_135882 - BLOCK
    )
    :vars
    (
      ?auto_135883 - BLOCK
      ?auto_135885 - BLOCK
      ?auto_135884 - BLOCK
      ?auto_135887 - BLOCK
      ?auto_135886 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_135879 ) ( ON ?auto_135880 ?auto_135879 ) ( not ( = ?auto_135879 ?auto_135880 ) ) ( not ( = ?auto_135879 ?auto_135881 ) ) ( not ( = ?auto_135879 ?auto_135882 ) ) ( not ( = ?auto_135880 ?auto_135881 ) ) ( not ( = ?auto_135880 ?auto_135882 ) ) ( not ( = ?auto_135881 ?auto_135882 ) ) ( ON ?auto_135882 ?auto_135883 ) ( not ( = ?auto_135879 ?auto_135883 ) ) ( not ( = ?auto_135880 ?auto_135883 ) ) ( not ( = ?auto_135881 ?auto_135883 ) ) ( not ( = ?auto_135882 ?auto_135883 ) ) ( CLEAR ?auto_135880 ) ( ON ?auto_135881 ?auto_135882 ) ( CLEAR ?auto_135881 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_135885 ) ( ON ?auto_135884 ?auto_135885 ) ( ON ?auto_135887 ?auto_135884 ) ( ON ?auto_135886 ?auto_135887 ) ( ON ?auto_135883 ?auto_135886 ) ( not ( = ?auto_135885 ?auto_135884 ) ) ( not ( = ?auto_135885 ?auto_135887 ) ) ( not ( = ?auto_135885 ?auto_135886 ) ) ( not ( = ?auto_135885 ?auto_135883 ) ) ( not ( = ?auto_135885 ?auto_135882 ) ) ( not ( = ?auto_135885 ?auto_135881 ) ) ( not ( = ?auto_135884 ?auto_135887 ) ) ( not ( = ?auto_135884 ?auto_135886 ) ) ( not ( = ?auto_135884 ?auto_135883 ) ) ( not ( = ?auto_135884 ?auto_135882 ) ) ( not ( = ?auto_135884 ?auto_135881 ) ) ( not ( = ?auto_135887 ?auto_135886 ) ) ( not ( = ?auto_135887 ?auto_135883 ) ) ( not ( = ?auto_135887 ?auto_135882 ) ) ( not ( = ?auto_135887 ?auto_135881 ) ) ( not ( = ?auto_135886 ?auto_135883 ) ) ( not ( = ?auto_135886 ?auto_135882 ) ) ( not ( = ?auto_135886 ?auto_135881 ) ) ( not ( = ?auto_135879 ?auto_135885 ) ) ( not ( = ?auto_135879 ?auto_135884 ) ) ( not ( = ?auto_135879 ?auto_135887 ) ) ( not ( = ?auto_135879 ?auto_135886 ) ) ( not ( = ?auto_135880 ?auto_135885 ) ) ( not ( = ?auto_135880 ?auto_135884 ) ) ( not ( = ?auto_135880 ?auto_135887 ) ) ( not ( = ?auto_135880 ?auto_135886 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_135885 ?auto_135884 ?auto_135887 ?auto_135886 ?auto_135883 ?auto_135882 )
      ( MAKE-4PILE ?auto_135879 ?auto_135880 ?auto_135881 ?auto_135882 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_135888 - BLOCK
      ?auto_135889 - BLOCK
      ?auto_135890 - BLOCK
      ?auto_135891 - BLOCK
    )
    :vars
    (
      ?auto_135893 - BLOCK
      ?auto_135892 - BLOCK
      ?auto_135896 - BLOCK
      ?auto_135895 - BLOCK
      ?auto_135894 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_135888 ) ( not ( = ?auto_135888 ?auto_135889 ) ) ( not ( = ?auto_135888 ?auto_135890 ) ) ( not ( = ?auto_135888 ?auto_135891 ) ) ( not ( = ?auto_135889 ?auto_135890 ) ) ( not ( = ?auto_135889 ?auto_135891 ) ) ( not ( = ?auto_135890 ?auto_135891 ) ) ( ON ?auto_135891 ?auto_135893 ) ( not ( = ?auto_135888 ?auto_135893 ) ) ( not ( = ?auto_135889 ?auto_135893 ) ) ( not ( = ?auto_135890 ?auto_135893 ) ) ( not ( = ?auto_135891 ?auto_135893 ) ) ( ON ?auto_135890 ?auto_135891 ) ( CLEAR ?auto_135890 ) ( ON-TABLE ?auto_135892 ) ( ON ?auto_135896 ?auto_135892 ) ( ON ?auto_135895 ?auto_135896 ) ( ON ?auto_135894 ?auto_135895 ) ( ON ?auto_135893 ?auto_135894 ) ( not ( = ?auto_135892 ?auto_135896 ) ) ( not ( = ?auto_135892 ?auto_135895 ) ) ( not ( = ?auto_135892 ?auto_135894 ) ) ( not ( = ?auto_135892 ?auto_135893 ) ) ( not ( = ?auto_135892 ?auto_135891 ) ) ( not ( = ?auto_135892 ?auto_135890 ) ) ( not ( = ?auto_135896 ?auto_135895 ) ) ( not ( = ?auto_135896 ?auto_135894 ) ) ( not ( = ?auto_135896 ?auto_135893 ) ) ( not ( = ?auto_135896 ?auto_135891 ) ) ( not ( = ?auto_135896 ?auto_135890 ) ) ( not ( = ?auto_135895 ?auto_135894 ) ) ( not ( = ?auto_135895 ?auto_135893 ) ) ( not ( = ?auto_135895 ?auto_135891 ) ) ( not ( = ?auto_135895 ?auto_135890 ) ) ( not ( = ?auto_135894 ?auto_135893 ) ) ( not ( = ?auto_135894 ?auto_135891 ) ) ( not ( = ?auto_135894 ?auto_135890 ) ) ( not ( = ?auto_135888 ?auto_135892 ) ) ( not ( = ?auto_135888 ?auto_135896 ) ) ( not ( = ?auto_135888 ?auto_135895 ) ) ( not ( = ?auto_135888 ?auto_135894 ) ) ( not ( = ?auto_135889 ?auto_135892 ) ) ( not ( = ?auto_135889 ?auto_135896 ) ) ( not ( = ?auto_135889 ?auto_135895 ) ) ( not ( = ?auto_135889 ?auto_135894 ) ) ( HOLDING ?auto_135889 ) ( CLEAR ?auto_135888 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_135888 ?auto_135889 )
      ( MAKE-4PILE ?auto_135888 ?auto_135889 ?auto_135890 ?auto_135891 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_135897 - BLOCK
      ?auto_135898 - BLOCK
      ?auto_135899 - BLOCK
      ?auto_135900 - BLOCK
    )
    :vars
    (
      ?auto_135901 - BLOCK
      ?auto_135905 - BLOCK
      ?auto_135903 - BLOCK
      ?auto_135904 - BLOCK
      ?auto_135902 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_135897 ) ( not ( = ?auto_135897 ?auto_135898 ) ) ( not ( = ?auto_135897 ?auto_135899 ) ) ( not ( = ?auto_135897 ?auto_135900 ) ) ( not ( = ?auto_135898 ?auto_135899 ) ) ( not ( = ?auto_135898 ?auto_135900 ) ) ( not ( = ?auto_135899 ?auto_135900 ) ) ( ON ?auto_135900 ?auto_135901 ) ( not ( = ?auto_135897 ?auto_135901 ) ) ( not ( = ?auto_135898 ?auto_135901 ) ) ( not ( = ?auto_135899 ?auto_135901 ) ) ( not ( = ?auto_135900 ?auto_135901 ) ) ( ON ?auto_135899 ?auto_135900 ) ( ON-TABLE ?auto_135905 ) ( ON ?auto_135903 ?auto_135905 ) ( ON ?auto_135904 ?auto_135903 ) ( ON ?auto_135902 ?auto_135904 ) ( ON ?auto_135901 ?auto_135902 ) ( not ( = ?auto_135905 ?auto_135903 ) ) ( not ( = ?auto_135905 ?auto_135904 ) ) ( not ( = ?auto_135905 ?auto_135902 ) ) ( not ( = ?auto_135905 ?auto_135901 ) ) ( not ( = ?auto_135905 ?auto_135900 ) ) ( not ( = ?auto_135905 ?auto_135899 ) ) ( not ( = ?auto_135903 ?auto_135904 ) ) ( not ( = ?auto_135903 ?auto_135902 ) ) ( not ( = ?auto_135903 ?auto_135901 ) ) ( not ( = ?auto_135903 ?auto_135900 ) ) ( not ( = ?auto_135903 ?auto_135899 ) ) ( not ( = ?auto_135904 ?auto_135902 ) ) ( not ( = ?auto_135904 ?auto_135901 ) ) ( not ( = ?auto_135904 ?auto_135900 ) ) ( not ( = ?auto_135904 ?auto_135899 ) ) ( not ( = ?auto_135902 ?auto_135901 ) ) ( not ( = ?auto_135902 ?auto_135900 ) ) ( not ( = ?auto_135902 ?auto_135899 ) ) ( not ( = ?auto_135897 ?auto_135905 ) ) ( not ( = ?auto_135897 ?auto_135903 ) ) ( not ( = ?auto_135897 ?auto_135904 ) ) ( not ( = ?auto_135897 ?auto_135902 ) ) ( not ( = ?auto_135898 ?auto_135905 ) ) ( not ( = ?auto_135898 ?auto_135903 ) ) ( not ( = ?auto_135898 ?auto_135904 ) ) ( not ( = ?auto_135898 ?auto_135902 ) ) ( CLEAR ?auto_135897 ) ( ON ?auto_135898 ?auto_135899 ) ( CLEAR ?auto_135898 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_135905 ?auto_135903 ?auto_135904 ?auto_135902 ?auto_135901 ?auto_135900 ?auto_135899 )
      ( MAKE-4PILE ?auto_135897 ?auto_135898 ?auto_135899 ?auto_135900 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_135906 - BLOCK
      ?auto_135907 - BLOCK
      ?auto_135908 - BLOCK
      ?auto_135909 - BLOCK
    )
    :vars
    (
      ?auto_135912 - BLOCK
      ?auto_135913 - BLOCK
      ?auto_135911 - BLOCK
      ?auto_135914 - BLOCK
      ?auto_135910 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_135906 ?auto_135907 ) ) ( not ( = ?auto_135906 ?auto_135908 ) ) ( not ( = ?auto_135906 ?auto_135909 ) ) ( not ( = ?auto_135907 ?auto_135908 ) ) ( not ( = ?auto_135907 ?auto_135909 ) ) ( not ( = ?auto_135908 ?auto_135909 ) ) ( ON ?auto_135909 ?auto_135912 ) ( not ( = ?auto_135906 ?auto_135912 ) ) ( not ( = ?auto_135907 ?auto_135912 ) ) ( not ( = ?auto_135908 ?auto_135912 ) ) ( not ( = ?auto_135909 ?auto_135912 ) ) ( ON ?auto_135908 ?auto_135909 ) ( ON-TABLE ?auto_135913 ) ( ON ?auto_135911 ?auto_135913 ) ( ON ?auto_135914 ?auto_135911 ) ( ON ?auto_135910 ?auto_135914 ) ( ON ?auto_135912 ?auto_135910 ) ( not ( = ?auto_135913 ?auto_135911 ) ) ( not ( = ?auto_135913 ?auto_135914 ) ) ( not ( = ?auto_135913 ?auto_135910 ) ) ( not ( = ?auto_135913 ?auto_135912 ) ) ( not ( = ?auto_135913 ?auto_135909 ) ) ( not ( = ?auto_135913 ?auto_135908 ) ) ( not ( = ?auto_135911 ?auto_135914 ) ) ( not ( = ?auto_135911 ?auto_135910 ) ) ( not ( = ?auto_135911 ?auto_135912 ) ) ( not ( = ?auto_135911 ?auto_135909 ) ) ( not ( = ?auto_135911 ?auto_135908 ) ) ( not ( = ?auto_135914 ?auto_135910 ) ) ( not ( = ?auto_135914 ?auto_135912 ) ) ( not ( = ?auto_135914 ?auto_135909 ) ) ( not ( = ?auto_135914 ?auto_135908 ) ) ( not ( = ?auto_135910 ?auto_135912 ) ) ( not ( = ?auto_135910 ?auto_135909 ) ) ( not ( = ?auto_135910 ?auto_135908 ) ) ( not ( = ?auto_135906 ?auto_135913 ) ) ( not ( = ?auto_135906 ?auto_135911 ) ) ( not ( = ?auto_135906 ?auto_135914 ) ) ( not ( = ?auto_135906 ?auto_135910 ) ) ( not ( = ?auto_135907 ?auto_135913 ) ) ( not ( = ?auto_135907 ?auto_135911 ) ) ( not ( = ?auto_135907 ?auto_135914 ) ) ( not ( = ?auto_135907 ?auto_135910 ) ) ( ON ?auto_135907 ?auto_135908 ) ( CLEAR ?auto_135907 ) ( HOLDING ?auto_135906 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_135906 )
      ( MAKE-4PILE ?auto_135906 ?auto_135907 ?auto_135908 ?auto_135909 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_135915 - BLOCK
      ?auto_135916 - BLOCK
      ?auto_135917 - BLOCK
      ?auto_135918 - BLOCK
    )
    :vars
    (
      ?auto_135923 - BLOCK
      ?auto_135921 - BLOCK
      ?auto_135920 - BLOCK
      ?auto_135922 - BLOCK
      ?auto_135919 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_135915 ?auto_135916 ) ) ( not ( = ?auto_135915 ?auto_135917 ) ) ( not ( = ?auto_135915 ?auto_135918 ) ) ( not ( = ?auto_135916 ?auto_135917 ) ) ( not ( = ?auto_135916 ?auto_135918 ) ) ( not ( = ?auto_135917 ?auto_135918 ) ) ( ON ?auto_135918 ?auto_135923 ) ( not ( = ?auto_135915 ?auto_135923 ) ) ( not ( = ?auto_135916 ?auto_135923 ) ) ( not ( = ?auto_135917 ?auto_135923 ) ) ( not ( = ?auto_135918 ?auto_135923 ) ) ( ON ?auto_135917 ?auto_135918 ) ( ON-TABLE ?auto_135921 ) ( ON ?auto_135920 ?auto_135921 ) ( ON ?auto_135922 ?auto_135920 ) ( ON ?auto_135919 ?auto_135922 ) ( ON ?auto_135923 ?auto_135919 ) ( not ( = ?auto_135921 ?auto_135920 ) ) ( not ( = ?auto_135921 ?auto_135922 ) ) ( not ( = ?auto_135921 ?auto_135919 ) ) ( not ( = ?auto_135921 ?auto_135923 ) ) ( not ( = ?auto_135921 ?auto_135918 ) ) ( not ( = ?auto_135921 ?auto_135917 ) ) ( not ( = ?auto_135920 ?auto_135922 ) ) ( not ( = ?auto_135920 ?auto_135919 ) ) ( not ( = ?auto_135920 ?auto_135923 ) ) ( not ( = ?auto_135920 ?auto_135918 ) ) ( not ( = ?auto_135920 ?auto_135917 ) ) ( not ( = ?auto_135922 ?auto_135919 ) ) ( not ( = ?auto_135922 ?auto_135923 ) ) ( not ( = ?auto_135922 ?auto_135918 ) ) ( not ( = ?auto_135922 ?auto_135917 ) ) ( not ( = ?auto_135919 ?auto_135923 ) ) ( not ( = ?auto_135919 ?auto_135918 ) ) ( not ( = ?auto_135919 ?auto_135917 ) ) ( not ( = ?auto_135915 ?auto_135921 ) ) ( not ( = ?auto_135915 ?auto_135920 ) ) ( not ( = ?auto_135915 ?auto_135922 ) ) ( not ( = ?auto_135915 ?auto_135919 ) ) ( not ( = ?auto_135916 ?auto_135921 ) ) ( not ( = ?auto_135916 ?auto_135920 ) ) ( not ( = ?auto_135916 ?auto_135922 ) ) ( not ( = ?auto_135916 ?auto_135919 ) ) ( ON ?auto_135916 ?auto_135917 ) ( ON ?auto_135915 ?auto_135916 ) ( CLEAR ?auto_135915 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_135921 ?auto_135920 ?auto_135922 ?auto_135919 ?auto_135923 ?auto_135918 ?auto_135917 ?auto_135916 )
      ( MAKE-4PILE ?auto_135915 ?auto_135916 ?auto_135917 ?auto_135918 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_135928 - BLOCK
      ?auto_135929 - BLOCK
      ?auto_135930 - BLOCK
      ?auto_135931 - BLOCK
    )
    :vars
    (
      ?auto_135932 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_135932 ?auto_135931 ) ( CLEAR ?auto_135932 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_135928 ) ( ON ?auto_135929 ?auto_135928 ) ( ON ?auto_135930 ?auto_135929 ) ( ON ?auto_135931 ?auto_135930 ) ( not ( = ?auto_135928 ?auto_135929 ) ) ( not ( = ?auto_135928 ?auto_135930 ) ) ( not ( = ?auto_135928 ?auto_135931 ) ) ( not ( = ?auto_135928 ?auto_135932 ) ) ( not ( = ?auto_135929 ?auto_135930 ) ) ( not ( = ?auto_135929 ?auto_135931 ) ) ( not ( = ?auto_135929 ?auto_135932 ) ) ( not ( = ?auto_135930 ?auto_135931 ) ) ( not ( = ?auto_135930 ?auto_135932 ) ) ( not ( = ?auto_135931 ?auto_135932 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_135932 ?auto_135931 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_135933 - BLOCK
      ?auto_135934 - BLOCK
      ?auto_135935 - BLOCK
      ?auto_135936 - BLOCK
    )
    :vars
    (
      ?auto_135937 - BLOCK
      ?auto_135938 - BLOCK
      ?auto_135939 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_135937 ?auto_135936 ) ( CLEAR ?auto_135937 ) ( ON-TABLE ?auto_135933 ) ( ON ?auto_135934 ?auto_135933 ) ( ON ?auto_135935 ?auto_135934 ) ( ON ?auto_135936 ?auto_135935 ) ( not ( = ?auto_135933 ?auto_135934 ) ) ( not ( = ?auto_135933 ?auto_135935 ) ) ( not ( = ?auto_135933 ?auto_135936 ) ) ( not ( = ?auto_135933 ?auto_135937 ) ) ( not ( = ?auto_135934 ?auto_135935 ) ) ( not ( = ?auto_135934 ?auto_135936 ) ) ( not ( = ?auto_135934 ?auto_135937 ) ) ( not ( = ?auto_135935 ?auto_135936 ) ) ( not ( = ?auto_135935 ?auto_135937 ) ) ( not ( = ?auto_135936 ?auto_135937 ) ) ( HOLDING ?auto_135938 ) ( CLEAR ?auto_135939 ) ( not ( = ?auto_135933 ?auto_135938 ) ) ( not ( = ?auto_135933 ?auto_135939 ) ) ( not ( = ?auto_135934 ?auto_135938 ) ) ( not ( = ?auto_135934 ?auto_135939 ) ) ( not ( = ?auto_135935 ?auto_135938 ) ) ( not ( = ?auto_135935 ?auto_135939 ) ) ( not ( = ?auto_135936 ?auto_135938 ) ) ( not ( = ?auto_135936 ?auto_135939 ) ) ( not ( = ?auto_135937 ?auto_135938 ) ) ( not ( = ?auto_135937 ?auto_135939 ) ) ( not ( = ?auto_135938 ?auto_135939 ) ) )
    :subtasks
    ( ( !STACK ?auto_135938 ?auto_135939 )
      ( MAKE-4PILE ?auto_135933 ?auto_135934 ?auto_135935 ?auto_135936 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_135940 - BLOCK
      ?auto_135941 - BLOCK
      ?auto_135942 - BLOCK
      ?auto_135943 - BLOCK
    )
    :vars
    (
      ?auto_135945 - BLOCK
      ?auto_135946 - BLOCK
      ?auto_135944 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_135945 ?auto_135943 ) ( ON-TABLE ?auto_135940 ) ( ON ?auto_135941 ?auto_135940 ) ( ON ?auto_135942 ?auto_135941 ) ( ON ?auto_135943 ?auto_135942 ) ( not ( = ?auto_135940 ?auto_135941 ) ) ( not ( = ?auto_135940 ?auto_135942 ) ) ( not ( = ?auto_135940 ?auto_135943 ) ) ( not ( = ?auto_135940 ?auto_135945 ) ) ( not ( = ?auto_135941 ?auto_135942 ) ) ( not ( = ?auto_135941 ?auto_135943 ) ) ( not ( = ?auto_135941 ?auto_135945 ) ) ( not ( = ?auto_135942 ?auto_135943 ) ) ( not ( = ?auto_135942 ?auto_135945 ) ) ( not ( = ?auto_135943 ?auto_135945 ) ) ( CLEAR ?auto_135946 ) ( not ( = ?auto_135940 ?auto_135944 ) ) ( not ( = ?auto_135940 ?auto_135946 ) ) ( not ( = ?auto_135941 ?auto_135944 ) ) ( not ( = ?auto_135941 ?auto_135946 ) ) ( not ( = ?auto_135942 ?auto_135944 ) ) ( not ( = ?auto_135942 ?auto_135946 ) ) ( not ( = ?auto_135943 ?auto_135944 ) ) ( not ( = ?auto_135943 ?auto_135946 ) ) ( not ( = ?auto_135945 ?auto_135944 ) ) ( not ( = ?auto_135945 ?auto_135946 ) ) ( not ( = ?auto_135944 ?auto_135946 ) ) ( ON ?auto_135944 ?auto_135945 ) ( CLEAR ?auto_135944 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_135940 ?auto_135941 ?auto_135942 ?auto_135943 ?auto_135945 )
      ( MAKE-4PILE ?auto_135940 ?auto_135941 ?auto_135942 ?auto_135943 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_135947 - BLOCK
      ?auto_135948 - BLOCK
      ?auto_135949 - BLOCK
      ?auto_135950 - BLOCK
    )
    :vars
    (
      ?auto_135952 - BLOCK
      ?auto_135953 - BLOCK
      ?auto_135951 - BLOCK
      ?auto_135954 - BLOCK
      ?auto_135955 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_135952 ?auto_135950 ) ( ON-TABLE ?auto_135947 ) ( ON ?auto_135948 ?auto_135947 ) ( ON ?auto_135949 ?auto_135948 ) ( ON ?auto_135950 ?auto_135949 ) ( not ( = ?auto_135947 ?auto_135948 ) ) ( not ( = ?auto_135947 ?auto_135949 ) ) ( not ( = ?auto_135947 ?auto_135950 ) ) ( not ( = ?auto_135947 ?auto_135952 ) ) ( not ( = ?auto_135948 ?auto_135949 ) ) ( not ( = ?auto_135948 ?auto_135950 ) ) ( not ( = ?auto_135948 ?auto_135952 ) ) ( not ( = ?auto_135949 ?auto_135950 ) ) ( not ( = ?auto_135949 ?auto_135952 ) ) ( not ( = ?auto_135950 ?auto_135952 ) ) ( not ( = ?auto_135947 ?auto_135953 ) ) ( not ( = ?auto_135947 ?auto_135951 ) ) ( not ( = ?auto_135948 ?auto_135953 ) ) ( not ( = ?auto_135948 ?auto_135951 ) ) ( not ( = ?auto_135949 ?auto_135953 ) ) ( not ( = ?auto_135949 ?auto_135951 ) ) ( not ( = ?auto_135950 ?auto_135953 ) ) ( not ( = ?auto_135950 ?auto_135951 ) ) ( not ( = ?auto_135952 ?auto_135953 ) ) ( not ( = ?auto_135952 ?auto_135951 ) ) ( not ( = ?auto_135953 ?auto_135951 ) ) ( ON ?auto_135953 ?auto_135952 ) ( CLEAR ?auto_135953 ) ( HOLDING ?auto_135951 ) ( CLEAR ?auto_135954 ) ( ON-TABLE ?auto_135955 ) ( ON ?auto_135954 ?auto_135955 ) ( not ( = ?auto_135955 ?auto_135954 ) ) ( not ( = ?auto_135955 ?auto_135951 ) ) ( not ( = ?auto_135954 ?auto_135951 ) ) ( not ( = ?auto_135947 ?auto_135954 ) ) ( not ( = ?auto_135947 ?auto_135955 ) ) ( not ( = ?auto_135948 ?auto_135954 ) ) ( not ( = ?auto_135948 ?auto_135955 ) ) ( not ( = ?auto_135949 ?auto_135954 ) ) ( not ( = ?auto_135949 ?auto_135955 ) ) ( not ( = ?auto_135950 ?auto_135954 ) ) ( not ( = ?auto_135950 ?auto_135955 ) ) ( not ( = ?auto_135952 ?auto_135954 ) ) ( not ( = ?auto_135952 ?auto_135955 ) ) ( not ( = ?auto_135953 ?auto_135954 ) ) ( not ( = ?auto_135953 ?auto_135955 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_135955 ?auto_135954 ?auto_135951 )
      ( MAKE-4PILE ?auto_135947 ?auto_135948 ?auto_135949 ?auto_135950 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_135956 - BLOCK
      ?auto_135957 - BLOCK
      ?auto_135958 - BLOCK
      ?auto_135959 - BLOCK
    )
    :vars
    (
      ?auto_135960 - BLOCK
      ?auto_135962 - BLOCK
      ?auto_135964 - BLOCK
      ?auto_135963 - BLOCK
      ?auto_135961 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_135960 ?auto_135959 ) ( ON-TABLE ?auto_135956 ) ( ON ?auto_135957 ?auto_135956 ) ( ON ?auto_135958 ?auto_135957 ) ( ON ?auto_135959 ?auto_135958 ) ( not ( = ?auto_135956 ?auto_135957 ) ) ( not ( = ?auto_135956 ?auto_135958 ) ) ( not ( = ?auto_135956 ?auto_135959 ) ) ( not ( = ?auto_135956 ?auto_135960 ) ) ( not ( = ?auto_135957 ?auto_135958 ) ) ( not ( = ?auto_135957 ?auto_135959 ) ) ( not ( = ?auto_135957 ?auto_135960 ) ) ( not ( = ?auto_135958 ?auto_135959 ) ) ( not ( = ?auto_135958 ?auto_135960 ) ) ( not ( = ?auto_135959 ?auto_135960 ) ) ( not ( = ?auto_135956 ?auto_135962 ) ) ( not ( = ?auto_135956 ?auto_135964 ) ) ( not ( = ?auto_135957 ?auto_135962 ) ) ( not ( = ?auto_135957 ?auto_135964 ) ) ( not ( = ?auto_135958 ?auto_135962 ) ) ( not ( = ?auto_135958 ?auto_135964 ) ) ( not ( = ?auto_135959 ?auto_135962 ) ) ( not ( = ?auto_135959 ?auto_135964 ) ) ( not ( = ?auto_135960 ?auto_135962 ) ) ( not ( = ?auto_135960 ?auto_135964 ) ) ( not ( = ?auto_135962 ?auto_135964 ) ) ( ON ?auto_135962 ?auto_135960 ) ( CLEAR ?auto_135963 ) ( ON-TABLE ?auto_135961 ) ( ON ?auto_135963 ?auto_135961 ) ( not ( = ?auto_135961 ?auto_135963 ) ) ( not ( = ?auto_135961 ?auto_135964 ) ) ( not ( = ?auto_135963 ?auto_135964 ) ) ( not ( = ?auto_135956 ?auto_135963 ) ) ( not ( = ?auto_135956 ?auto_135961 ) ) ( not ( = ?auto_135957 ?auto_135963 ) ) ( not ( = ?auto_135957 ?auto_135961 ) ) ( not ( = ?auto_135958 ?auto_135963 ) ) ( not ( = ?auto_135958 ?auto_135961 ) ) ( not ( = ?auto_135959 ?auto_135963 ) ) ( not ( = ?auto_135959 ?auto_135961 ) ) ( not ( = ?auto_135960 ?auto_135963 ) ) ( not ( = ?auto_135960 ?auto_135961 ) ) ( not ( = ?auto_135962 ?auto_135963 ) ) ( not ( = ?auto_135962 ?auto_135961 ) ) ( ON ?auto_135964 ?auto_135962 ) ( CLEAR ?auto_135964 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_135956 ?auto_135957 ?auto_135958 ?auto_135959 ?auto_135960 ?auto_135962 )
      ( MAKE-4PILE ?auto_135956 ?auto_135957 ?auto_135958 ?auto_135959 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_135965 - BLOCK
      ?auto_135966 - BLOCK
      ?auto_135967 - BLOCK
      ?auto_135968 - BLOCK
    )
    :vars
    (
      ?auto_135970 - BLOCK
      ?auto_135971 - BLOCK
      ?auto_135973 - BLOCK
      ?auto_135972 - BLOCK
      ?auto_135969 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_135970 ?auto_135968 ) ( ON-TABLE ?auto_135965 ) ( ON ?auto_135966 ?auto_135965 ) ( ON ?auto_135967 ?auto_135966 ) ( ON ?auto_135968 ?auto_135967 ) ( not ( = ?auto_135965 ?auto_135966 ) ) ( not ( = ?auto_135965 ?auto_135967 ) ) ( not ( = ?auto_135965 ?auto_135968 ) ) ( not ( = ?auto_135965 ?auto_135970 ) ) ( not ( = ?auto_135966 ?auto_135967 ) ) ( not ( = ?auto_135966 ?auto_135968 ) ) ( not ( = ?auto_135966 ?auto_135970 ) ) ( not ( = ?auto_135967 ?auto_135968 ) ) ( not ( = ?auto_135967 ?auto_135970 ) ) ( not ( = ?auto_135968 ?auto_135970 ) ) ( not ( = ?auto_135965 ?auto_135971 ) ) ( not ( = ?auto_135965 ?auto_135973 ) ) ( not ( = ?auto_135966 ?auto_135971 ) ) ( not ( = ?auto_135966 ?auto_135973 ) ) ( not ( = ?auto_135967 ?auto_135971 ) ) ( not ( = ?auto_135967 ?auto_135973 ) ) ( not ( = ?auto_135968 ?auto_135971 ) ) ( not ( = ?auto_135968 ?auto_135973 ) ) ( not ( = ?auto_135970 ?auto_135971 ) ) ( not ( = ?auto_135970 ?auto_135973 ) ) ( not ( = ?auto_135971 ?auto_135973 ) ) ( ON ?auto_135971 ?auto_135970 ) ( ON-TABLE ?auto_135972 ) ( not ( = ?auto_135972 ?auto_135969 ) ) ( not ( = ?auto_135972 ?auto_135973 ) ) ( not ( = ?auto_135969 ?auto_135973 ) ) ( not ( = ?auto_135965 ?auto_135969 ) ) ( not ( = ?auto_135965 ?auto_135972 ) ) ( not ( = ?auto_135966 ?auto_135969 ) ) ( not ( = ?auto_135966 ?auto_135972 ) ) ( not ( = ?auto_135967 ?auto_135969 ) ) ( not ( = ?auto_135967 ?auto_135972 ) ) ( not ( = ?auto_135968 ?auto_135969 ) ) ( not ( = ?auto_135968 ?auto_135972 ) ) ( not ( = ?auto_135970 ?auto_135969 ) ) ( not ( = ?auto_135970 ?auto_135972 ) ) ( not ( = ?auto_135971 ?auto_135969 ) ) ( not ( = ?auto_135971 ?auto_135972 ) ) ( ON ?auto_135973 ?auto_135971 ) ( CLEAR ?auto_135973 ) ( HOLDING ?auto_135969 ) ( CLEAR ?auto_135972 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_135972 ?auto_135969 )
      ( MAKE-4PILE ?auto_135965 ?auto_135966 ?auto_135967 ?auto_135968 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_137667 - BLOCK
      ?auto_137668 - BLOCK
      ?auto_137669 - BLOCK
      ?auto_137670 - BLOCK
    )
    :vars
    (
      ?auto_137671 - BLOCK
      ?auto_137672 - BLOCK
      ?auto_137673 - BLOCK
      ?auto_137674 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_137671 ?auto_137670 ) ( ON-TABLE ?auto_137667 ) ( ON ?auto_137668 ?auto_137667 ) ( ON ?auto_137669 ?auto_137668 ) ( ON ?auto_137670 ?auto_137669 ) ( not ( = ?auto_137667 ?auto_137668 ) ) ( not ( = ?auto_137667 ?auto_137669 ) ) ( not ( = ?auto_137667 ?auto_137670 ) ) ( not ( = ?auto_137667 ?auto_137671 ) ) ( not ( = ?auto_137668 ?auto_137669 ) ) ( not ( = ?auto_137668 ?auto_137670 ) ) ( not ( = ?auto_137668 ?auto_137671 ) ) ( not ( = ?auto_137669 ?auto_137670 ) ) ( not ( = ?auto_137669 ?auto_137671 ) ) ( not ( = ?auto_137670 ?auto_137671 ) ) ( not ( = ?auto_137667 ?auto_137672 ) ) ( not ( = ?auto_137667 ?auto_137673 ) ) ( not ( = ?auto_137668 ?auto_137672 ) ) ( not ( = ?auto_137668 ?auto_137673 ) ) ( not ( = ?auto_137669 ?auto_137672 ) ) ( not ( = ?auto_137669 ?auto_137673 ) ) ( not ( = ?auto_137670 ?auto_137672 ) ) ( not ( = ?auto_137670 ?auto_137673 ) ) ( not ( = ?auto_137671 ?auto_137672 ) ) ( not ( = ?auto_137671 ?auto_137673 ) ) ( not ( = ?auto_137672 ?auto_137673 ) ) ( ON ?auto_137672 ?auto_137671 ) ( not ( = ?auto_137674 ?auto_137673 ) ) ( not ( = ?auto_137667 ?auto_137674 ) ) ( not ( = ?auto_137668 ?auto_137674 ) ) ( not ( = ?auto_137669 ?auto_137674 ) ) ( not ( = ?auto_137670 ?auto_137674 ) ) ( not ( = ?auto_137671 ?auto_137674 ) ) ( not ( = ?auto_137672 ?auto_137674 ) ) ( ON ?auto_137673 ?auto_137672 ) ( ON ?auto_137674 ?auto_137673 ) ( CLEAR ?auto_137674 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_137667 ?auto_137668 ?auto_137669 ?auto_137670 ?auto_137671 ?auto_137672 ?auto_137673 )
      ( MAKE-4PILE ?auto_137667 ?auto_137668 ?auto_137669 ?auto_137670 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_135983 - BLOCK
      ?auto_135984 - BLOCK
      ?auto_135985 - BLOCK
      ?auto_135986 - BLOCK
    )
    :vars
    (
      ?auto_135990 - BLOCK
      ?auto_135991 - BLOCK
      ?auto_135989 - BLOCK
      ?auto_135987 - BLOCK
      ?auto_135988 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_135990 ?auto_135986 ) ( ON-TABLE ?auto_135983 ) ( ON ?auto_135984 ?auto_135983 ) ( ON ?auto_135985 ?auto_135984 ) ( ON ?auto_135986 ?auto_135985 ) ( not ( = ?auto_135983 ?auto_135984 ) ) ( not ( = ?auto_135983 ?auto_135985 ) ) ( not ( = ?auto_135983 ?auto_135986 ) ) ( not ( = ?auto_135983 ?auto_135990 ) ) ( not ( = ?auto_135984 ?auto_135985 ) ) ( not ( = ?auto_135984 ?auto_135986 ) ) ( not ( = ?auto_135984 ?auto_135990 ) ) ( not ( = ?auto_135985 ?auto_135986 ) ) ( not ( = ?auto_135985 ?auto_135990 ) ) ( not ( = ?auto_135986 ?auto_135990 ) ) ( not ( = ?auto_135983 ?auto_135991 ) ) ( not ( = ?auto_135983 ?auto_135989 ) ) ( not ( = ?auto_135984 ?auto_135991 ) ) ( not ( = ?auto_135984 ?auto_135989 ) ) ( not ( = ?auto_135985 ?auto_135991 ) ) ( not ( = ?auto_135985 ?auto_135989 ) ) ( not ( = ?auto_135986 ?auto_135991 ) ) ( not ( = ?auto_135986 ?auto_135989 ) ) ( not ( = ?auto_135990 ?auto_135991 ) ) ( not ( = ?auto_135990 ?auto_135989 ) ) ( not ( = ?auto_135991 ?auto_135989 ) ) ( ON ?auto_135991 ?auto_135990 ) ( not ( = ?auto_135987 ?auto_135988 ) ) ( not ( = ?auto_135987 ?auto_135989 ) ) ( not ( = ?auto_135988 ?auto_135989 ) ) ( not ( = ?auto_135983 ?auto_135988 ) ) ( not ( = ?auto_135983 ?auto_135987 ) ) ( not ( = ?auto_135984 ?auto_135988 ) ) ( not ( = ?auto_135984 ?auto_135987 ) ) ( not ( = ?auto_135985 ?auto_135988 ) ) ( not ( = ?auto_135985 ?auto_135987 ) ) ( not ( = ?auto_135986 ?auto_135988 ) ) ( not ( = ?auto_135986 ?auto_135987 ) ) ( not ( = ?auto_135990 ?auto_135988 ) ) ( not ( = ?auto_135990 ?auto_135987 ) ) ( not ( = ?auto_135991 ?auto_135988 ) ) ( not ( = ?auto_135991 ?auto_135987 ) ) ( ON ?auto_135989 ?auto_135991 ) ( ON ?auto_135988 ?auto_135989 ) ( CLEAR ?auto_135988 ) ( HOLDING ?auto_135987 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_135987 )
      ( MAKE-4PILE ?auto_135983 ?auto_135984 ?auto_135985 ?auto_135986 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_135992 - BLOCK
      ?auto_135993 - BLOCK
      ?auto_135994 - BLOCK
      ?auto_135995 - BLOCK
    )
    :vars
    (
      ?auto_136000 - BLOCK
      ?auto_135998 - BLOCK
      ?auto_135999 - BLOCK
      ?auto_135997 - BLOCK
      ?auto_135996 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_136000 ?auto_135995 ) ( ON-TABLE ?auto_135992 ) ( ON ?auto_135993 ?auto_135992 ) ( ON ?auto_135994 ?auto_135993 ) ( ON ?auto_135995 ?auto_135994 ) ( not ( = ?auto_135992 ?auto_135993 ) ) ( not ( = ?auto_135992 ?auto_135994 ) ) ( not ( = ?auto_135992 ?auto_135995 ) ) ( not ( = ?auto_135992 ?auto_136000 ) ) ( not ( = ?auto_135993 ?auto_135994 ) ) ( not ( = ?auto_135993 ?auto_135995 ) ) ( not ( = ?auto_135993 ?auto_136000 ) ) ( not ( = ?auto_135994 ?auto_135995 ) ) ( not ( = ?auto_135994 ?auto_136000 ) ) ( not ( = ?auto_135995 ?auto_136000 ) ) ( not ( = ?auto_135992 ?auto_135998 ) ) ( not ( = ?auto_135992 ?auto_135999 ) ) ( not ( = ?auto_135993 ?auto_135998 ) ) ( not ( = ?auto_135993 ?auto_135999 ) ) ( not ( = ?auto_135994 ?auto_135998 ) ) ( not ( = ?auto_135994 ?auto_135999 ) ) ( not ( = ?auto_135995 ?auto_135998 ) ) ( not ( = ?auto_135995 ?auto_135999 ) ) ( not ( = ?auto_136000 ?auto_135998 ) ) ( not ( = ?auto_136000 ?auto_135999 ) ) ( not ( = ?auto_135998 ?auto_135999 ) ) ( ON ?auto_135998 ?auto_136000 ) ( not ( = ?auto_135997 ?auto_135996 ) ) ( not ( = ?auto_135997 ?auto_135999 ) ) ( not ( = ?auto_135996 ?auto_135999 ) ) ( not ( = ?auto_135992 ?auto_135996 ) ) ( not ( = ?auto_135992 ?auto_135997 ) ) ( not ( = ?auto_135993 ?auto_135996 ) ) ( not ( = ?auto_135993 ?auto_135997 ) ) ( not ( = ?auto_135994 ?auto_135996 ) ) ( not ( = ?auto_135994 ?auto_135997 ) ) ( not ( = ?auto_135995 ?auto_135996 ) ) ( not ( = ?auto_135995 ?auto_135997 ) ) ( not ( = ?auto_136000 ?auto_135996 ) ) ( not ( = ?auto_136000 ?auto_135997 ) ) ( not ( = ?auto_135998 ?auto_135996 ) ) ( not ( = ?auto_135998 ?auto_135997 ) ) ( ON ?auto_135999 ?auto_135998 ) ( ON ?auto_135996 ?auto_135999 ) ( ON ?auto_135997 ?auto_135996 ) ( CLEAR ?auto_135997 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_135992 ?auto_135993 ?auto_135994 ?auto_135995 ?auto_136000 ?auto_135998 ?auto_135999 ?auto_135996 )
      ( MAKE-4PILE ?auto_135992 ?auto_135993 ?auto_135994 ?auto_135995 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_136006 - BLOCK
      ?auto_136007 - BLOCK
      ?auto_136008 - BLOCK
      ?auto_136009 - BLOCK
      ?auto_136010 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_136010 ) ( CLEAR ?auto_136009 ) ( ON-TABLE ?auto_136006 ) ( ON ?auto_136007 ?auto_136006 ) ( ON ?auto_136008 ?auto_136007 ) ( ON ?auto_136009 ?auto_136008 ) ( not ( = ?auto_136006 ?auto_136007 ) ) ( not ( = ?auto_136006 ?auto_136008 ) ) ( not ( = ?auto_136006 ?auto_136009 ) ) ( not ( = ?auto_136006 ?auto_136010 ) ) ( not ( = ?auto_136007 ?auto_136008 ) ) ( not ( = ?auto_136007 ?auto_136009 ) ) ( not ( = ?auto_136007 ?auto_136010 ) ) ( not ( = ?auto_136008 ?auto_136009 ) ) ( not ( = ?auto_136008 ?auto_136010 ) ) ( not ( = ?auto_136009 ?auto_136010 ) ) )
    :subtasks
    ( ( !STACK ?auto_136010 ?auto_136009 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_136011 - BLOCK
      ?auto_136012 - BLOCK
      ?auto_136013 - BLOCK
      ?auto_136014 - BLOCK
      ?auto_136015 - BLOCK
    )
    :vars
    (
      ?auto_136016 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_136014 ) ( ON-TABLE ?auto_136011 ) ( ON ?auto_136012 ?auto_136011 ) ( ON ?auto_136013 ?auto_136012 ) ( ON ?auto_136014 ?auto_136013 ) ( not ( = ?auto_136011 ?auto_136012 ) ) ( not ( = ?auto_136011 ?auto_136013 ) ) ( not ( = ?auto_136011 ?auto_136014 ) ) ( not ( = ?auto_136011 ?auto_136015 ) ) ( not ( = ?auto_136012 ?auto_136013 ) ) ( not ( = ?auto_136012 ?auto_136014 ) ) ( not ( = ?auto_136012 ?auto_136015 ) ) ( not ( = ?auto_136013 ?auto_136014 ) ) ( not ( = ?auto_136013 ?auto_136015 ) ) ( not ( = ?auto_136014 ?auto_136015 ) ) ( ON ?auto_136015 ?auto_136016 ) ( CLEAR ?auto_136015 ) ( HAND-EMPTY ) ( not ( = ?auto_136011 ?auto_136016 ) ) ( not ( = ?auto_136012 ?auto_136016 ) ) ( not ( = ?auto_136013 ?auto_136016 ) ) ( not ( = ?auto_136014 ?auto_136016 ) ) ( not ( = ?auto_136015 ?auto_136016 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_136015 ?auto_136016 )
      ( MAKE-5PILE ?auto_136011 ?auto_136012 ?auto_136013 ?auto_136014 ?auto_136015 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_136017 - BLOCK
      ?auto_136018 - BLOCK
      ?auto_136019 - BLOCK
      ?auto_136020 - BLOCK
      ?auto_136021 - BLOCK
    )
    :vars
    (
      ?auto_136022 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_136017 ) ( ON ?auto_136018 ?auto_136017 ) ( ON ?auto_136019 ?auto_136018 ) ( not ( = ?auto_136017 ?auto_136018 ) ) ( not ( = ?auto_136017 ?auto_136019 ) ) ( not ( = ?auto_136017 ?auto_136020 ) ) ( not ( = ?auto_136017 ?auto_136021 ) ) ( not ( = ?auto_136018 ?auto_136019 ) ) ( not ( = ?auto_136018 ?auto_136020 ) ) ( not ( = ?auto_136018 ?auto_136021 ) ) ( not ( = ?auto_136019 ?auto_136020 ) ) ( not ( = ?auto_136019 ?auto_136021 ) ) ( not ( = ?auto_136020 ?auto_136021 ) ) ( ON ?auto_136021 ?auto_136022 ) ( CLEAR ?auto_136021 ) ( not ( = ?auto_136017 ?auto_136022 ) ) ( not ( = ?auto_136018 ?auto_136022 ) ) ( not ( = ?auto_136019 ?auto_136022 ) ) ( not ( = ?auto_136020 ?auto_136022 ) ) ( not ( = ?auto_136021 ?auto_136022 ) ) ( HOLDING ?auto_136020 ) ( CLEAR ?auto_136019 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_136017 ?auto_136018 ?auto_136019 ?auto_136020 )
      ( MAKE-5PILE ?auto_136017 ?auto_136018 ?auto_136019 ?auto_136020 ?auto_136021 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_136023 - BLOCK
      ?auto_136024 - BLOCK
      ?auto_136025 - BLOCK
      ?auto_136026 - BLOCK
      ?auto_136027 - BLOCK
    )
    :vars
    (
      ?auto_136028 - BLOCK
      ?auto_136029 - BLOCK
      ?auto_136031 - BLOCK
      ?auto_136030 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_136023 ) ( ON ?auto_136024 ?auto_136023 ) ( ON ?auto_136025 ?auto_136024 ) ( not ( = ?auto_136023 ?auto_136024 ) ) ( not ( = ?auto_136023 ?auto_136025 ) ) ( not ( = ?auto_136023 ?auto_136026 ) ) ( not ( = ?auto_136023 ?auto_136027 ) ) ( not ( = ?auto_136024 ?auto_136025 ) ) ( not ( = ?auto_136024 ?auto_136026 ) ) ( not ( = ?auto_136024 ?auto_136027 ) ) ( not ( = ?auto_136025 ?auto_136026 ) ) ( not ( = ?auto_136025 ?auto_136027 ) ) ( not ( = ?auto_136026 ?auto_136027 ) ) ( ON ?auto_136027 ?auto_136028 ) ( not ( = ?auto_136023 ?auto_136028 ) ) ( not ( = ?auto_136024 ?auto_136028 ) ) ( not ( = ?auto_136025 ?auto_136028 ) ) ( not ( = ?auto_136026 ?auto_136028 ) ) ( not ( = ?auto_136027 ?auto_136028 ) ) ( CLEAR ?auto_136025 ) ( ON ?auto_136026 ?auto_136027 ) ( CLEAR ?auto_136026 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_136029 ) ( ON ?auto_136031 ?auto_136029 ) ( ON ?auto_136030 ?auto_136031 ) ( ON ?auto_136028 ?auto_136030 ) ( not ( = ?auto_136029 ?auto_136031 ) ) ( not ( = ?auto_136029 ?auto_136030 ) ) ( not ( = ?auto_136029 ?auto_136028 ) ) ( not ( = ?auto_136029 ?auto_136027 ) ) ( not ( = ?auto_136029 ?auto_136026 ) ) ( not ( = ?auto_136031 ?auto_136030 ) ) ( not ( = ?auto_136031 ?auto_136028 ) ) ( not ( = ?auto_136031 ?auto_136027 ) ) ( not ( = ?auto_136031 ?auto_136026 ) ) ( not ( = ?auto_136030 ?auto_136028 ) ) ( not ( = ?auto_136030 ?auto_136027 ) ) ( not ( = ?auto_136030 ?auto_136026 ) ) ( not ( = ?auto_136023 ?auto_136029 ) ) ( not ( = ?auto_136023 ?auto_136031 ) ) ( not ( = ?auto_136023 ?auto_136030 ) ) ( not ( = ?auto_136024 ?auto_136029 ) ) ( not ( = ?auto_136024 ?auto_136031 ) ) ( not ( = ?auto_136024 ?auto_136030 ) ) ( not ( = ?auto_136025 ?auto_136029 ) ) ( not ( = ?auto_136025 ?auto_136031 ) ) ( not ( = ?auto_136025 ?auto_136030 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_136029 ?auto_136031 ?auto_136030 ?auto_136028 ?auto_136027 )
      ( MAKE-5PILE ?auto_136023 ?auto_136024 ?auto_136025 ?auto_136026 ?auto_136027 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_136032 - BLOCK
      ?auto_136033 - BLOCK
      ?auto_136034 - BLOCK
      ?auto_136035 - BLOCK
      ?auto_136036 - BLOCK
    )
    :vars
    (
      ?auto_136038 - BLOCK
      ?auto_136037 - BLOCK
      ?auto_136039 - BLOCK
      ?auto_136040 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_136032 ) ( ON ?auto_136033 ?auto_136032 ) ( not ( = ?auto_136032 ?auto_136033 ) ) ( not ( = ?auto_136032 ?auto_136034 ) ) ( not ( = ?auto_136032 ?auto_136035 ) ) ( not ( = ?auto_136032 ?auto_136036 ) ) ( not ( = ?auto_136033 ?auto_136034 ) ) ( not ( = ?auto_136033 ?auto_136035 ) ) ( not ( = ?auto_136033 ?auto_136036 ) ) ( not ( = ?auto_136034 ?auto_136035 ) ) ( not ( = ?auto_136034 ?auto_136036 ) ) ( not ( = ?auto_136035 ?auto_136036 ) ) ( ON ?auto_136036 ?auto_136038 ) ( not ( = ?auto_136032 ?auto_136038 ) ) ( not ( = ?auto_136033 ?auto_136038 ) ) ( not ( = ?auto_136034 ?auto_136038 ) ) ( not ( = ?auto_136035 ?auto_136038 ) ) ( not ( = ?auto_136036 ?auto_136038 ) ) ( ON ?auto_136035 ?auto_136036 ) ( CLEAR ?auto_136035 ) ( ON-TABLE ?auto_136037 ) ( ON ?auto_136039 ?auto_136037 ) ( ON ?auto_136040 ?auto_136039 ) ( ON ?auto_136038 ?auto_136040 ) ( not ( = ?auto_136037 ?auto_136039 ) ) ( not ( = ?auto_136037 ?auto_136040 ) ) ( not ( = ?auto_136037 ?auto_136038 ) ) ( not ( = ?auto_136037 ?auto_136036 ) ) ( not ( = ?auto_136037 ?auto_136035 ) ) ( not ( = ?auto_136039 ?auto_136040 ) ) ( not ( = ?auto_136039 ?auto_136038 ) ) ( not ( = ?auto_136039 ?auto_136036 ) ) ( not ( = ?auto_136039 ?auto_136035 ) ) ( not ( = ?auto_136040 ?auto_136038 ) ) ( not ( = ?auto_136040 ?auto_136036 ) ) ( not ( = ?auto_136040 ?auto_136035 ) ) ( not ( = ?auto_136032 ?auto_136037 ) ) ( not ( = ?auto_136032 ?auto_136039 ) ) ( not ( = ?auto_136032 ?auto_136040 ) ) ( not ( = ?auto_136033 ?auto_136037 ) ) ( not ( = ?auto_136033 ?auto_136039 ) ) ( not ( = ?auto_136033 ?auto_136040 ) ) ( not ( = ?auto_136034 ?auto_136037 ) ) ( not ( = ?auto_136034 ?auto_136039 ) ) ( not ( = ?auto_136034 ?auto_136040 ) ) ( HOLDING ?auto_136034 ) ( CLEAR ?auto_136033 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_136032 ?auto_136033 ?auto_136034 )
      ( MAKE-5PILE ?auto_136032 ?auto_136033 ?auto_136034 ?auto_136035 ?auto_136036 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_136041 - BLOCK
      ?auto_136042 - BLOCK
      ?auto_136043 - BLOCK
      ?auto_136044 - BLOCK
      ?auto_136045 - BLOCK
    )
    :vars
    (
      ?auto_136046 - BLOCK
      ?auto_136047 - BLOCK
      ?auto_136048 - BLOCK
      ?auto_136049 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_136041 ) ( ON ?auto_136042 ?auto_136041 ) ( not ( = ?auto_136041 ?auto_136042 ) ) ( not ( = ?auto_136041 ?auto_136043 ) ) ( not ( = ?auto_136041 ?auto_136044 ) ) ( not ( = ?auto_136041 ?auto_136045 ) ) ( not ( = ?auto_136042 ?auto_136043 ) ) ( not ( = ?auto_136042 ?auto_136044 ) ) ( not ( = ?auto_136042 ?auto_136045 ) ) ( not ( = ?auto_136043 ?auto_136044 ) ) ( not ( = ?auto_136043 ?auto_136045 ) ) ( not ( = ?auto_136044 ?auto_136045 ) ) ( ON ?auto_136045 ?auto_136046 ) ( not ( = ?auto_136041 ?auto_136046 ) ) ( not ( = ?auto_136042 ?auto_136046 ) ) ( not ( = ?auto_136043 ?auto_136046 ) ) ( not ( = ?auto_136044 ?auto_136046 ) ) ( not ( = ?auto_136045 ?auto_136046 ) ) ( ON ?auto_136044 ?auto_136045 ) ( ON-TABLE ?auto_136047 ) ( ON ?auto_136048 ?auto_136047 ) ( ON ?auto_136049 ?auto_136048 ) ( ON ?auto_136046 ?auto_136049 ) ( not ( = ?auto_136047 ?auto_136048 ) ) ( not ( = ?auto_136047 ?auto_136049 ) ) ( not ( = ?auto_136047 ?auto_136046 ) ) ( not ( = ?auto_136047 ?auto_136045 ) ) ( not ( = ?auto_136047 ?auto_136044 ) ) ( not ( = ?auto_136048 ?auto_136049 ) ) ( not ( = ?auto_136048 ?auto_136046 ) ) ( not ( = ?auto_136048 ?auto_136045 ) ) ( not ( = ?auto_136048 ?auto_136044 ) ) ( not ( = ?auto_136049 ?auto_136046 ) ) ( not ( = ?auto_136049 ?auto_136045 ) ) ( not ( = ?auto_136049 ?auto_136044 ) ) ( not ( = ?auto_136041 ?auto_136047 ) ) ( not ( = ?auto_136041 ?auto_136048 ) ) ( not ( = ?auto_136041 ?auto_136049 ) ) ( not ( = ?auto_136042 ?auto_136047 ) ) ( not ( = ?auto_136042 ?auto_136048 ) ) ( not ( = ?auto_136042 ?auto_136049 ) ) ( not ( = ?auto_136043 ?auto_136047 ) ) ( not ( = ?auto_136043 ?auto_136048 ) ) ( not ( = ?auto_136043 ?auto_136049 ) ) ( CLEAR ?auto_136042 ) ( ON ?auto_136043 ?auto_136044 ) ( CLEAR ?auto_136043 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_136047 ?auto_136048 ?auto_136049 ?auto_136046 ?auto_136045 ?auto_136044 )
      ( MAKE-5PILE ?auto_136041 ?auto_136042 ?auto_136043 ?auto_136044 ?auto_136045 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_136050 - BLOCK
      ?auto_136051 - BLOCK
      ?auto_136052 - BLOCK
      ?auto_136053 - BLOCK
      ?auto_136054 - BLOCK
    )
    :vars
    (
      ?auto_136055 - BLOCK
      ?auto_136058 - BLOCK
      ?auto_136057 - BLOCK
      ?auto_136056 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_136050 ) ( not ( = ?auto_136050 ?auto_136051 ) ) ( not ( = ?auto_136050 ?auto_136052 ) ) ( not ( = ?auto_136050 ?auto_136053 ) ) ( not ( = ?auto_136050 ?auto_136054 ) ) ( not ( = ?auto_136051 ?auto_136052 ) ) ( not ( = ?auto_136051 ?auto_136053 ) ) ( not ( = ?auto_136051 ?auto_136054 ) ) ( not ( = ?auto_136052 ?auto_136053 ) ) ( not ( = ?auto_136052 ?auto_136054 ) ) ( not ( = ?auto_136053 ?auto_136054 ) ) ( ON ?auto_136054 ?auto_136055 ) ( not ( = ?auto_136050 ?auto_136055 ) ) ( not ( = ?auto_136051 ?auto_136055 ) ) ( not ( = ?auto_136052 ?auto_136055 ) ) ( not ( = ?auto_136053 ?auto_136055 ) ) ( not ( = ?auto_136054 ?auto_136055 ) ) ( ON ?auto_136053 ?auto_136054 ) ( ON-TABLE ?auto_136058 ) ( ON ?auto_136057 ?auto_136058 ) ( ON ?auto_136056 ?auto_136057 ) ( ON ?auto_136055 ?auto_136056 ) ( not ( = ?auto_136058 ?auto_136057 ) ) ( not ( = ?auto_136058 ?auto_136056 ) ) ( not ( = ?auto_136058 ?auto_136055 ) ) ( not ( = ?auto_136058 ?auto_136054 ) ) ( not ( = ?auto_136058 ?auto_136053 ) ) ( not ( = ?auto_136057 ?auto_136056 ) ) ( not ( = ?auto_136057 ?auto_136055 ) ) ( not ( = ?auto_136057 ?auto_136054 ) ) ( not ( = ?auto_136057 ?auto_136053 ) ) ( not ( = ?auto_136056 ?auto_136055 ) ) ( not ( = ?auto_136056 ?auto_136054 ) ) ( not ( = ?auto_136056 ?auto_136053 ) ) ( not ( = ?auto_136050 ?auto_136058 ) ) ( not ( = ?auto_136050 ?auto_136057 ) ) ( not ( = ?auto_136050 ?auto_136056 ) ) ( not ( = ?auto_136051 ?auto_136058 ) ) ( not ( = ?auto_136051 ?auto_136057 ) ) ( not ( = ?auto_136051 ?auto_136056 ) ) ( not ( = ?auto_136052 ?auto_136058 ) ) ( not ( = ?auto_136052 ?auto_136057 ) ) ( not ( = ?auto_136052 ?auto_136056 ) ) ( ON ?auto_136052 ?auto_136053 ) ( CLEAR ?auto_136052 ) ( HOLDING ?auto_136051 ) ( CLEAR ?auto_136050 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_136050 ?auto_136051 )
      ( MAKE-5PILE ?auto_136050 ?auto_136051 ?auto_136052 ?auto_136053 ?auto_136054 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_136059 - BLOCK
      ?auto_136060 - BLOCK
      ?auto_136061 - BLOCK
      ?auto_136062 - BLOCK
      ?auto_136063 - BLOCK
    )
    :vars
    (
      ?auto_136064 - BLOCK
      ?auto_136065 - BLOCK
      ?auto_136067 - BLOCK
      ?auto_136066 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_136059 ) ( not ( = ?auto_136059 ?auto_136060 ) ) ( not ( = ?auto_136059 ?auto_136061 ) ) ( not ( = ?auto_136059 ?auto_136062 ) ) ( not ( = ?auto_136059 ?auto_136063 ) ) ( not ( = ?auto_136060 ?auto_136061 ) ) ( not ( = ?auto_136060 ?auto_136062 ) ) ( not ( = ?auto_136060 ?auto_136063 ) ) ( not ( = ?auto_136061 ?auto_136062 ) ) ( not ( = ?auto_136061 ?auto_136063 ) ) ( not ( = ?auto_136062 ?auto_136063 ) ) ( ON ?auto_136063 ?auto_136064 ) ( not ( = ?auto_136059 ?auto_136064 ) ) ( not ( = ?auto_136060 ?auto_136064 ) ) ( not ( = ?auto_136061 ?auto_136064 ) ) ( not ( = ?auto_136062 ?auto_136064 ) ) ( not ( = ?auto_136063 ?auto_136064 ) ) ( ON ?auto_136062 ?auto_136063 ) ( ON-TABLE ?auto_136065 ) ( ON ?auto_136067 ?auto_136065 ) ( ON ?auto_136066 ?auto_136067 ) ( ON ?auto_136064 ?auto_136066 ) ( not ( = ?auto_136065 ?auto_136067 ) ) ( not ( = ?auto_136065 ?auto_136066 ) ) ( not ( = ?auto_136065 ?auto_136064 ) ) ( not ( = ?auto_136065 ?auto_136063 ) ) ( not ( = ?auto_136065 ?auto_136062 ) ) ( not ( = ?auto_136067 ?auto_136066 ) ) ( not ( = ?auto_136067 ?auto_136064 ) ) ( not ( = ?auto_136067 ?auto_136063 ) ) ( not ( = ?auto_136067 ?auto_136062 ) ) ( not ( = ?auto_136066 ?auto_136064 ) ) ( not ( = ?auto_136066 ?auto_136063 ) ) ( not ( = ?auto_136066 ?auto_136062 ) ) ( not ( = ?auto_136059 ?auto_136065 ) ) ( not ( = ?auto_136059 ?auto_136067 ) ) ( not ( = ?auto_136059 ?auto_136066 ) ) ( not ( = ?auto_136060 ?auto_136065 ) ) ( not ( = ?auto_136060 ?auto_136067 ) ) ( not ( = ?auto_136060 ?auto_136066 ) ) ( not ( = ?auto_136061 ?auto_136065 ) ) ( not ( = ?auto_136061 ?auto_136067 ) ) ( not ( = ?auto_136061 ?auto_136066 ) ) ( ON ?auto_136061 ?auto_136062 ) ( CLEAR ?auto_136059 ) ( ON ?auto_136060 ?auto_136061 ) ( CLEAR ?auto_136060 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_136065 ?auto_136067 ?auto_136066 ?auto_136064 ?auto_136063 ?auto_136062 ?auto_136061 )
      ( MAKE-5PILE ?auto_136059 ?auto_136060 ?auto_136061 ?auto_136062 ?auto_136063 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_136068 - BLOCK
      ?auto_136069 - BLOCK
      ?auto_136070 - BLOCK
      ?auto_136071 - BLOCK
      ?auto_136072 - BLOCK
    )
    :vars
    (
      ?auto_136076 - BLOCK
      ?auto_136073 - BLOCK
      ?auto_136074 - BLOCK
      ?auto_136075 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_136068 ?auto_136069 ) ) ( not ( = ?auto_136068 ?auto_136070 ) ) ( not ( = ?auto_136068 ?auto_136071 ) ) ( not ( = ?auto_136068 ?auto_136072 ) ) ( not ( = ?auto_136069 ?auto_136070 ) ) ( not ( = ?auto_136069 ?auto_136071 ) ) ( not ( = ?auto_136069 ?auto_136072 ) ) ( not ( = ?auto_136070 ?auto_136071 ) ) ( not ( = ?auto_136070 ?auto_136072 ) ) ( not ( = ?auto_136071 ?auto_136072 ) ) ( ON ?auto_136072 ?auto_136076 ) ( not ( = ?auto_136068 ?auto_136076 ) ) ( not ( = ?auto_136069 ?auto_136076 ) ) ( not ( = ?auto_136070 ?auto_136076 ) ) ( not ( = ?auto_136071 ?auto_136076 ) ) ( not ( = ?auto_136072 ?auto_136076 ) ) ( ON ?auto_136071 ?auto_136072 ) ( ON-TABLE ?auto_136073 ) ( ON ?auto_136074 ?auto_136073 ) ( ON ?auto_136075 ?auto_136074 ) ( ON ?auto_136076 ?auto_136075 ) ( not ( = ?auto_136073 ?auto_136074 ) ) ( not ( = ?auto_136073 ?auto_136075 ) ) ( not ( = ?auto_136073 ?auto_136076 ) ) ( not ( = ?auto_136073 ?auto_136072 ) ) ( not ( = ?auto_136073 ?auto_136071 ) ) ( not ( = ?auto_136074 ?auto_136075 ) ) ( not ( = ?auto_136074 ?auto_136076 ) ) ( not ( = ?auto_136074 ?auto_136072 ) ) ( not ( = ?auto_136074 ?auto_136071 ) ) ( not ( = ?auto_136075 ?auto_136076 ) ) ( not ( = ?auto_136075 ?auto_136072 ) ) ( not ( = ?auto_136075 ?auto_136071 ) ) ( not ( = ?auto_136068 ?auto_136073 ) ) ( not ( = ?auto_136068 ?auto_136074 ) ) ( not ( = ?auto_136068 ?auto_136075 ) ) ( not ( = ?auto_136069 ?auto_136073 ) ) ( not ( = ?auto_136069 ?auto_136074 ) ) ( not ( = ?auto_136069 ?auto_136075 ) ) ( not ( = ?auto_136070 ?auto_136073 ) ) ( not ( = ?auto_136070 ?auto_136074 ) ) ( not ( = ?auto_136070 ?auto_136075 ) ) ( ON ?auto_136070 ?auto_136071 ) ( ON ?auto_136069 ?auto_136070 ) ( CLEAR ?auto_136069 ) ( HOLDING ?auto_136068 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_136068 )
      ( MAKE-5PILE ?auto_136068 ?auto_136069 ?auto_136070 ?auto_136071 ?auto_136072 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_136077 - BLOCK
      ?auto_136078 - BLOCK
      ?auto_136079 - BLOCK
      ?auto_136080 - BLOCK
      ?auto_136081 - BLOCK
    )
    :vars
    (
      ?auto_136085 - BLOCK
      ?auto_136084 - BLOCK
      ?auto_136083 - BLOCK
      ?auto_136082 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_136077 ?auto_136078 ) ) ( not ( = ?auto_136077 ?auto_136079 ) ) ( not ( = ?auto_136077 ?auto_136080 ) ) ( not ( = ?auto_136077 ?auto_136081 ) ) ( not ( = ?auto_136078 ?auto_136079 ) ) ( not ( = ?auto_136078 ?auto_136080 ) ) ( not ( = ?auto_136078 ?auto_136081 ) ) ( not ( = ?auto_136079 ?auto_136080 ) ) ( not ( = ?auto_136079 ?auto_136081 ) ) ( not ( = ?auto_136080 ?auto_136081 ) ) ( ON ?auto_136081 ?auto_136085 ) ( not ( = ?auto_136077 ?auto_136085 ) ) ( not ( = ?auto_136078 ?auto_136085 ) ) ( not ( = ?auto_136079 ?auto_136085 ) ) ( not ( = ?auto_136080 ?auto_136085 ) ) ( not ( = ?auto_136081 ?auto_136085 ) ) ( ON ?auto_136080 ?auto_136081 ) ( ON-TABLE ?auto_136084 ) ( ON ?auto_136083 ?auto_136084 ) ( ON ?auto_136082 ?auto_136083 ) ( ON ?auto_136085 ?auto_136082 ) ( not ( = ?auto_136084 ?auto_136083 ) ) ( not ( = ?auto_136084 ?auto_136082 ) ) ( not ( = ?auto_136084 ?auto_136085 ) ) ( not ( = ?auto_136084 ?auto_136081 ) ) ( not ( = ?auto_136084 ?auto_136080 ) ) ( not ( = ?auto_136083 ?auto_136082 ) ) ( not ( = ?auto_136083 ?auto_136085 ) ) ( not ( = ?auto_136083 ?auto_136081 ) ) ( not ( = ?auto_136083 ?auto_136080 ) ) ( not ( = ?auto_136082 ?auto_136085 ) ) ( not ( = ?auto_136082 ?auto_136081 ) ) ( not ( = ?auto_136082 ?auto_136080 ) ) ( not ( = ?auto_136077 ?auto_136084 ) ) ( not ( = ?auto_136077 ?auto_136083 ) ) ( not ( = ?auto_136077 ?auto_136082 ) ) ( not ( = ?auto_136078 ?auto_136084 ) ) ( not ( = ?auto_136078 ?auto_136083 ) ) ( not ( = ?auto_136078 ?auto_136082 ) ) ( not ( = ?auto_136079 ?auto_136084 ) ) ( not ( = ?auto_136079 ?auto_136083 ) ) ( not ( = ?auto_136079 ?auto_136082 ) ) ( ON ?auto_136079 ?auto_136080 ) ( ON ?auto_136078 ?auto_136079 ) ( ON ?auto_136077 ?auto_136078 ) ( CLEAR ?auto_136077 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_136084 ?auto_136083 ?auto_136082 ?auto_136085 ?auto_136081 ?auto_136080 ?auto_136079 ?auto_136078 )
      ( MAKE-5PILE ?auto_136077 ?auto_136078 ?auto_136079 ?auto_136080 ?auto_136081 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_136089 - BLOCK
      ?auto_136090 - BLOCK
      ?auto_136091 - BLOCK
    )
    :vars
    (
      ?auto_136092 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_136092 ?auto_136091 ) ( CLEAR ?auto_136092 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_136089 ) ( ON ?auto_136090 ?auto_136089 ) ( ON ?auto_136091 ?auto_136090 ) ( not ( = ?auto_136089 ?auto_136090 ) ) ( not ( = ?auto_136089 ?auto_136091 ) ) ( not ( = ?auto_136089 ?auto_136092 ) ) ( not ( = ?auto_136090 ?auto_136091 ) ) ( not ( = ?auto_136090 ?auto_136092 ) ) ( not ( = ?auto_136091 ?auto_136092 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_136092 ?auto_136091 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_136093 - BLOCK
      ?auto_136094 - BLOCK
      ?auto_136095 - BLOCK
    )
    :vars
    (
      ?auto_136096 - BLOCK
      ?auto_136097 - BLOCK
      ?auto_136098 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_136096 ?auto_136095 ) ( CLEAR ?auto_136096 ) ( ON-TABLE ?auto_136093 ) ( ON ?auto_136094 ?auto_136093 ) ( ON ?auto_136095 ?auto_136094 ) ( not ( = ?auto_136093 ?auto_136094 ) ) ( not ( = ?auto_136093 ?auto_136095 ) ) ( not ( = ?auto_136093 ?auto_136096 ) ) ( not ( = ?auto_136094 ?auto_136095 ) ) ( not ( = ?auto_136094 ?auto_136096 ) ) ( not ( = ?auto_136095 ?auto_136096 ) ) ( HOLDING ?auto_136097 ) ( CLEAR ?auto_136098 ) ( not ( = ?auto_136093 ?auto_136097 ) ) ( not ( = ?auto_136093 ?auto_136098 ) ) ( not ( = ?auto_136094 ?auto_136097 ) ) ( not ( = ?auto_136094 ?auto_136098 ) ) ( not ( = ?auto_136095 ?auto_136097 ) ) ( not ( = ?auto_136095 ?auto_136098 ) ) ( not ( = ?auto_136096 ?auto_136097 ) ) ( not ( = ?auto_136096 ?auto_136098 ) ) ( not ( = ?auto_136097 ?auto_136098 ) ) )
    :subtasks
    ( ( !STACK ?auto_136097 ?auto_136098 )
      ( MAKE-3PILE ?auto_136093 ?auto_136094 ?auto_136095 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_136099 - BLOCK
      ?auto_136100 - BLOCK
      ?auto_136101 - BLOCK
    )
    :vars
    (
      ?auto_136102 - BLOCK
      ?auto_136103 - BLOCK
      ?auto_136104 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_136102 ?auto_136101 ) ( ON-TABLE ?auto_136099 ) ( ON ?auto_136100 ?auto_136099 ) ( ON ?auto_136101 ?auto_136100 ) ( not ( = ?auto_136099 ?auto_136100 ) ) ( not ( = ?auto_136099 ?auto_136101 ) ) ( not ( = ?auto_136099 ?auto_136102 ) ) ( not ( = ?auto_136100 ?auto_136101 ) ) ( not ( = ?auto_136100 ?auto_136102 ) ) ( not ( = ?auto_136101 ?auto_136102 ) ) ( CLEAR ?auto_136103 ) ( not ( = ?auto_136099 ?auto_136104 ) ) ( not ( = ?auto_136099 ?auto_136103 ) ) ( not ( = ?auto_136100 ?auto_136104 ) ) ( not ( = ?auto_136100 ?auto_136103 ) ) ( not ( = ?auto_136101 ?auto_136104 ) ) ( not ( = ?auto_136101 ?auto_136103 ) ) ( not ( = ?auto_136102 ?auto_136104 ) ) ( not ( = ?auto_136102 ?auto_136103 ) ) ( not ( = ?auto_136104 ?auto_136103 ) ) ( ON ?auto_136104 ?auto_136102 ) ( CLEAR ?auto_136104 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_136099 ?auto_136100 ?auto_136101 ?auto_136102 )
      ( MAKE-3PILE ?auto_136099 ?auto_136100 ?auto_136101 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_136105 - BLOCK
      ?auto_136106 - BLOCK
      ?auto_136107 - BLOCK
    )
    :vars
    (
      ?auto_136109 - BLOCK
      ?auto_136110 - BLOCK
      ?auto_136108 - BLOCK
      ?auto_136111 - BLOCK
      ?auto_136112 - BLOCK
      ?auto_136113 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_136109 ?auto_136107 ) ( ON-TABLE ?auto_136105 ) ( ON ?auto_136106 ?auto_136105 ) ( ON ?auto_136107 ?auto_136106 ) ( not ( = ?auto_136105 ?auto_136106 ) ) ( not ( = ?auto_136105 ?auto_136107 ) ) ( not ( = ?auto_136105 ?auto_136109 ) ) ( not ( = ?auto_136106 ?auto_136107 ) ) ( not ( = ?auto_136106 ?auto_136109 ) ) ( not ( = ?auto_136107 ?auto_136109 ) ) ( not ( = ?auto_136105 ?auto_136110 ) ) ( not ( = ?auto_136105 ?auto_136108 ) ) ( not ( = ?auto_136106 ?auto_136110 ) ) ( not ( = ?auto_136106 ?auto_136108 ) ) ( not ( = ?auto_136107 ?auto_136110 ) ) ( not ( = ?auto_136107 ?auto_136108 ) ) ( not ( = ?auto_136109 ?auto_136110 ) ) ( not ( = ?auto_136109 ?auto_136108 ) ) ( not ( = ?auto_136110 ?auto_136108 ) ) ( ON ?auto_136110 ?auto_136109 ) ( CLEAR ?auto_136110 ) ( HOLDING ?auto_136108 ) ( CLEAR ?auto_136111 ) ( ON-TABLE ?auto_136112 ) ( ON ?auto_136113 ?auto_136112 ) ( ON ?auto_136111 ?auto_136113 ) ( not ( = ?auto_136112 ?auto_136113 ) ) ( not ( = ?auto_136112 ?auto_136111 ) ) ( not ( = ?auto_136112 ?auto_136108 ) ) ( not ( = ?auto_136113 ?auto_136111 ) ) ( not ( = ?auto_136113 ?auto_136108 ) ) ( not ( = ?auto_136111 ?auto_136108 ) ) ( not ( = ?auto_136105 ?auto_136111 ) ) ( not ( = ?auto_136105 ?auto_136112 ) ) ( not ( = ?auto_136105 ?auto_136113 ) ) ( not ( = ?auto_136106 ?auto_136111 ) ) ( not ( = ?auto_136106 ?auto_136112 ) ) ( not ( = ?auto_136106 ?auto_136113 ) ) ( not ( = ?auto_136107 ?auto_136111 ) ) ( not ( = ?auto_136107 ?auto_136112 ) ) ( not ( = ?auto_136107 ?auto_136113 ) ) ( not ( = ?auto_136109 ?auto_136111 ) ) ( not ( = ?auto_136109 ?auto_136112 ) ) ( not ( = ?auto_136109 ?auto_136113 ) ) ( not ( = ?auto_136110 ?auto_136111 ) ) ( not ( = ?auto_136110 ?auto_136112 ) ) ( not ( = ?auto_136110 ?auto_136113 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_136112 ?auto_136113 ?auto_136111 ?auto_136108 )
      ( MAKE-3PILE ?auto_136105 ?auto_136106 ?auto_136107 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_136114 - BLOCK
      ?auto_136115 - BLOCK
      ?auto_136116 - BLOCK
    )
    :vars
    (
      ?auto_136118 - BLOCK
      ?auto_136119 - BLOCK
      ?auto_136120 - BLOCK
      ?auto_136121 - BLOCK
      ?auto_136117 - BLOCK
      ?auto_136122 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_136118 ?auto_136116 ) ( ON-TABLE ?auto_136114 ) ( ON ?auto_136115 ?auto_136114 ) ( ON ?auto_136116 ?auto_136115 ) ( not ( = ?auto_136114 ?auto_136115 ) ) ( not ( = ?auto_136114 ?auto_136116 ) ) ( not ( = ?auto_136114 ?auto_136118 ) ) ( not ( = ?auto_136115 ?auto_136116 ) ) ( not ( = ?auto_136115 ?auto_136118 ) ) ( not ( = ?auto_136116 ?auto_136118 ) ) ( not ( = ?auto_136114 ?auto_136119 ) ) ( not ( = ?auto_136114 ?auto_136120 ) ) ( not ( = ?auto_136115 ?auto_136119 ) ) ( not ( = ?auto_136115 ?auto_136120 ) ) ( not ( = ?auto_136116 ?auto_136119 ) ) ( not ( = ?auto_136116 ?auto_136120 ) ) ( not ( = ?auto_136118 ?auto_136119 ) ) ( not ( = ?auto_136118 ?auto_136120 ) ) ( not ( = ?auto_136119 ?auto_136120 ) ) ( ON ?auto_136119 ?auto_136118 ) ( CLEAR ?auto_136121 ) ( ON-TABLE ?auto_136117 ) ( ON ?auto_136122 ?auto_136117 ) ( ON ?auto_136121 ?auto_136122 ) ( not ( = ?auto_136117 ?auto_136122 ) ) ( not ( = ?auto_136117 ?auto_136121 ) ) ( not ( = ?auto_136117 ?auto_136120 ) ) ( not ( = ?auto_136122 ?auto_136121 ) ) ( not ( = ?auto_136122 ?auto_136120 ) ) ( not ( = ?auto_136121 ?auto_136120 ) ) ( not ( = ?auto_136114 ?auto_136121 ) ) ( not ( = ?auto_136114 ?auto_136117 ) ) ( not ( = ?auto_136114 ?auto_136122 ) ) ( not ( = ?auto_136115 ?auto_136121 ) ) ( not ( = ?auto_136115 ?auto_136117 ) ) ( not ( = ?auto_136115 ?auto_136122 ) ) ( not ( = ?auto_136116 ?auto_136121 ) ) ( not ( = ?auto_136116 ?auto_136117 ) ) ( not ( = ?auto_136116 ?auto_136122 ) ) ( not ( = ?auto_136118 ?auto_136121 ) ) ( not ( = ?auto_136118 ?auto_136117 ) ) ( not ( = ?auto_136118 ?auto_136122 ) ) ( not ( = ?auto_136119 ?auto_136121 ) ) ( not ( = ?auto_136119 ?auto_136117 ) ) ( not ( = ?auto_136119 ?auto_136122 ) ) ( ON ?auto_136120 ?auto_136119 ) ( CLEAR ?auto_136120 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_136114 ?auto_136115 ?auto_136116 ?auto_136118 ?auto_136119 )
      ( MAKE-3PILE ?auto_136114 ?auto_136115 ?auto_136116 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_136123 - BLOCK
      ?auto_136124 - BLOCK
      ?auto_136125 - BLOCK
    )
    :vars
    (
      ?auto_136128 - BLOCK
      ?auto_136126 - BLOCK
      ?auto_136127 - BLOCK
      ?auto_136129 - BLOCK
      ?auto_136131 - BLOCK
      ?auto_136130 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_136128 ?auto_136125 ) ( ON-TABLE ?auto_136123 ) ( ON ?auto_136124 ?auto_136123 ) ( ON ?auto_136125 ?auto_136124 ) ( not ( = ?auto_136123 ?auto_136124 ) ) ( not ( = ?auto_136123 ?auto_136125 ) ) ( not ( = ?auto_136123 ?auto_136128 ) ) ( not ( = ?auto_136124 ?auto_136125 ) ) ( not ( = ?auto_136124 ?auto_136128 ) ) ( not ( = ?auto_136125 ?auto_136128 ) ) ( not ( = ?auto_136123 ?auto_136126 ) ) ( not ( = ?auto_136123 ?auto_136127 ) ) ( not ( = ?auto_136124 ?auto_136126 ) ) ( not ( = ?auto_136124 ?auto_136127 ) ) ( not ( = ?auto_136125 ?auto_136126 ) ) ( not ( = ?auto_136125 ?auto_136127 ) ) ( not ( = ?auto_136128 ?auto_136126 ) ) ( not ( = ?auto_136128 ?auto_136127 ) ) ( not ( = ?auto_136126 ?auto_136127 ) ) ( ON ?auto_136126 ?auto_136128 ) ( ON-TABLE ?auto_136129 ) ( ON ?auto_136131 ?auto_136129 ) ( not ( = ?auto_136129 ?auto_136131 ) ) ( not ( = ?auto_136129 ?auto_136130 ) ) ( not ( = ?auto_136129 ?auto_136127 ) ) ( not ( = ?auto_136131 ?auto_136130 ) ) ( not ( = ?auto_136131 ?auto_136127 ) ) ( not ( = ?auto_136130 ?auto_136127 ) ) ( not ( = ?auto_136123 ?auto_136130 ) ) ( not ( = ?auto_136123 ?auto_136129 ) ) ( not ( = ?auto_136123 ?auto_136131 ) ) ( not ( = ?auto_136124 ?auto_136130 ) ) ( not ( = ?auto_136124 ?auto_136129 ) ) ( not ( = ?auto_136124 ?auto_136131 ) ) ( not ( = ?auto_136125 ?auto_136130 ) ) ( not ( = ?auto_136125 ?auto_136129 ) ) ( not ( = ?auto_136125 ?auto_136131 ) ) ( not ( = ?auto_136128 ?auto_136130 ) ) ( not ( = ?auto_136128 ?auto_136129 ) ) ( not ( = ?auto_136128 ?auto_136131 ) ) ( not ( = ?auto_136126 ?auto_136130 ) ) ( not ( = ?auto_136126 ?auto_136129 ) ) ( not ( = ?auto_136126 ?auto_136131 ) ) ( ON ?auto_136127 ?auto_136126 ) ( CLEAR ?auto_136127 ) ( HOLDING ?auto_136130 ) ( CLEAR ?auto_136131 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_136129 ?auto_136131 ?auto_136130 )
      ( MAKE-3PILE ?auto_136123 ?auto_136124 ?auto_136125 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_136132 - BLOCK
      ?auto_136133 - BLOCK
      ?auto_136134 - BLOCK
    )
    :vars
    (
      ?auto_136137 - BLOCK
      ?auto_136135 - BLOCK
      ?auto_136139 - BLOCK
      ?auto_136136 - BLOCK
      ?auto_136140 - BLOCK
      ?auto_136138 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_136137 ?auto_136134 ) ( ON-TABLE ?auto_136132 ) ( ON ?auto_136133 ?auto_136132 ) ( ON ?auto_136134 ?auto_136133 ) ( not ( = ?auto_136132 ?auto_136133 ) ) ( not ( = ?auto_136132 ?auto_136134 ) ) ( not ( = ?auto_136132 ?auto_136137 ) ) ( not ( = ?auto_136133 ?auto_136134 ) ) ( not ( = ?auto_136133 ?auto_136137 ) ) ( not ( = ?auto_136134 ?auto_136137 ) ) ( not ( = ?auto_136132 ?auto_136135 ) ) ( not ( = ?auto_136132 ?auto_136139 ) ) ( not ( = ?auto_136133 ?auto_136135 ) ) ( not ( = ?auto_136133 ?auto_136139 ) ) ( not ( = ?auto_136134 ?auto_136135 ) ) ( not ( = ?auto_136134 ?auto_136139 ) ) ( not ( = ?auto_136137 ?auto_136135 ) ) ( not ( = ?auto_136137 ?auto_136139 ) ) ( not ( = ?auto_136135 ?auto_136139 ) ) ( ON ?auto_136135 ?auto_136137 ) ( ON-TABLE ?auto_136136 ) ( ON ?auto_136140 ?auto_136136 ) ( not ( = ?auto_136136 ?auto_136140 ) ) ( not ( = ?auto_136136 ?auto_136138 ) ) ( not ( = ?auto_136136 ?auto_136139 ) ) ( not ( = ?auto_136140 ?auto_136138 ) ) ( not ( = ?auto_136140 ?auto_136139 ) ) ( not ( = ?auto_136138 ?auto_136139 ) ) ( not ( = ?auto_136132 ?auto_136138 ) ) ( not ( = ?auto_136132 ?auto_136136 ) ) ( not ( = ?auto_136132 ?auto_136140 ) ) ( not ( = ?auto_136133 ?auto_136138 ) ) ( not ( = ?auto_136133 ?auto_136136 ) ) ( not ( = ?auto_136133 ?auto_136140 ) ) ( not ( = ?auto_136134 ?auto_136138 ) ) ( not ( = ?auto_136134 ?auto_136136 ) ) ( not ( = ?auto_136134 ?auto_136140 ) ) ( not ( = ?auto_136137 ?auto_136138 ) ) ( not ( = ?auto_136137 ?auto_136136 ) ) ( not ( = ?auto_136137 ?auto_136140 ) ) ( not ( = ?auto_136135 ?auto_136138 ) ) ( not ( = ?auto_136135 ?auto_136136 ) ) ( not ( = ?auto_136135 ?auto_136140 ) ) ( ON ?auto_136139 ?auto_136135 ) ( CLEAR ?auto_136140 ) ( ON ?auto_136138 ?auto_136139 ) ( CLEAR ?auto_136138 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_136132 ?auto_136133 ?auto_136134 ?auto_136137 ?auto_136135 ?auto_136139 )
      ( MAKE-3PILE ?auto_136132 ?auto_136133 ?auto_136134 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_136141 - BLOCK
      ?auto_136142 - BLOCK
      ?auto_136143 - BLOCK
    )
    :vars
    (
      ?auto_136145 - BLOCK
      ?auto_136148 - BLOCK
      ?auto_136146 - BLOCK
      ?auto_136149 - BLOCK
      ?auto_136147 - BLOCK
      ?auto_136144 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_136145 ?auto_136143 ) ( ON-TABLE ?auto_136141 ) ( ON ?auto_136142 ?auto_136141 ) ( ON ?auto_136143 ?auto_136142 ) ( not ( = ?auto_136141 ?auto_136142 ) ) ( not ( = ?auto_136141 ?auto_136143 ) ) ( not ( = ?auto_136141 ?auto_136145 ) ) ( not ( = ?auto_136142 ?auto_136143 ) ) ( not ( = ?auto_136142 ?auto_136145 ) ) ( not ( = ?auto_136143 ?auto_136145 ) ) ( not ( = ?auto_136141 ?auto_136148 ) ) ( not ( = ?auto_136141 ?auto_136146 ) ) ( not ( = ?auto_136142 ?auto_136148 ) ) ( not ( = ?auto_136142 ?auto_136146 ) ) ( not ( = ?auto_136143 ?auto_136148 ) ) ( not ( = ?auto_136143 ?auto_136146 ) ) ( not ( = ?auto_136145 ?auto_136148 ) ) ( not ( = ?auto_136145 ?auto_136146 ) ) ( not ( = ?auto_136148 ?auto_136146 ) ) ( ON ?auto_136148 ?auto_136145 ) ( ON-TABLE ?auto_136149 ) ( not ( = ?auto_136149 ?auto_136147 ) ) ( not ( = ?auto_136149 ?auto_136144 ) ) ( not ( = ?auto_136149 ?auto_136146 ) ) ( not ( = ?auto_136147 ?auto_136144 ) ) ( not ( = ?auto_136147 ?auto_136146 ) ) ( not ( = ?auto_136144 ?auto_136146 ) ) ( not ( = ?auto_136141 ?auto_136144 ) ) ( not ( = ?auto_136141 ?auto_136149 ) ) ( not ( = ?auto_136141 ?auto_136147 ) ) ( not ( = ?auto_136142 ?auto_136144 ) ) ( not ( = ?auto_136142 ?auto_136149 ) ) ( not ( = ?auto_136142 ?auto_136147 ) ) ( not ( = ?auto_136143 ?auto_136144 ) ) ( not ( = ?auto_136143 ?auto_136149 ) ) ( not ( = ?auto_136143 ?auto_136147 ) ) ( not ( = ?auto_136145 ?auto_136144 ) ) ( not ( = ?auto_136145 ?auto_136149 ) ) ( not ( = ?auto_136145 ?auto_136147 ) ) ( not ( = ?auto_136148 ?auto_136144 ) ) ( not ( = ?auto_136148 ?auto_136149 ) ) ( not ( = ?auto_136148 ?auto_136147 ) ) ( ON ?auto_136146 ?auto_136148 ) ( ON ?auto_136144 ?auto_136146 ) ( CLEAR ?auto_136144 ) ( HOLDING ?auto_136147 ) ( CLEAR ?auto_136149 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_136149 ?auto_136147 )
      ( MAKE-3PILE ?auto_136141 ?auto_136142 ?auto_136143 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_138008 - BLOCK
      ?auto_138009 - BLOCK
      ?auto_138010 - BLOCK
    )
    :vars
    (
      ?auto_138015 - BLOCK
      ?auto_138012 - BLOCK
      ?auto_138014 - BLOCK
      ?auto_138013 - BLOCK
      ?auto_138011 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_138015 ?auto_138010 ) ( ON-TABLE ?auto_138008 ) ( ON ?auto_138009 ?auto_138008 ) ( ON ?auto_138010 ?auto_138009 ) ( not ( = ?auto_138008 ?auto_138009 ) ) ( not ( = ?auto_138008 ?auto_138010 ) ) ( not ( = ?auto_138008 ?auto_138015 ) ) ( not ( = ?auto_138009 ?auto_138010 ) ) ( not ( = ?auto_138009 ?auto_138015 ) ) ( not ( = ?auto_138010 ?auto_138015 ) ) ( not ( = ?auto_138008 ?auto_138012 ) ) ( not ( = ?auto_138008 ?auto_138014 ) ) ( not ( = ?auto_138009 ?auto_138012 ) ) ( not ( = ?auto_138009 ?auto_138014 ) ) ( not ( = ?auto_138010 ?auto_138012 ) ) ( not ( = ?auto_138010 ?auto_138014 ) ) ( not ( = ?auto_138015 ?auto_138012 ) ) ( not ( = ?auto_138015 ?auto_138014 ) ) ( not ( = ?auto_138012 ?auto_138014 ) ) ( ON ?auto_138012 ?auto_138015 ) ( not ( = ?auto_138013 ?auto_138011 ) ) ( not ( = ?auto_138013 ?auto_138014 ) ) ( not ( = ?auto_138011 ?auto_138014 ) ) ( not ( = ?auto_138008 ?auto_138011 ) ) ( not ( = ?auto_138008 ?auto_138013 ) ) ( not ( = ?auto_138009 ?auto_138011 ) ) ( not ( = ?auto_138009 ?auto_138013 ) ) ( not ( = ?auto_138010 ?auto_138011 ) ) ( not ( = ?auto_138010 ?auto_138013 ) ) ( not ( = ?auto_138015 ?auto_138011 ) ) ( not ( = ?auto_138015 ?auto_138013 ) ) ( not ( = ?auto_138012 ?auto_138011 ) ) ( not ( = ?auto_138012 ?auto_138013 ) ) ( ON ?auto_138014 ?auto_138012 ) ( ON ?auto_138011 ?auto_138014 ) ( ON ?auto_138013 ?auto_138011 ) ( CLEAR ?auto_138013 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_138008 ?auto_138009 ?auto_138010 ?auto_138015 ?auto_138012 ?auto_138014 ?auto_138011 )
      ( MAKE-3PILE ?auto_138008 ?auto_138009 ?auto_138010 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_136159 - BLOCK
      ?auto_136160 - BLOCK
      ?auto_136161 - BLOCK
    )
    :vars
    (
      ?auto_136166 - BLOCK
      ?auto_136163 - BLOCK
      ?auto_136165 - BLOCK
      ?auto_136167 - BLOCK
      ?auto_136164 - BLOCK
      ?auto_136162 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_136166 ?auto_136161 ) ( ON-TABLE ?auto_136159 ) ( ON ?auto_136160 ?auto_136159 ) ( ON ?auto_136161 ?auto_136160 ) ( not ( = ?auto_136159 ?auto_136160 ) ) ( not ( = ?auto_136159 ?auto_136161 ) ) ( not ( = ?auto_136159 ?auto_136166 ) ) ( not ( = ?auto_136160 ?auto_136161 ) ) ( not ( = ?auto_136160 ?auto_136166 ) ) ( not ( = ?auto_136161 ?auto_136166 ) ) ( not ( = ?auto_136159 ?auto_136163 ) ) ( not ( = ?auto_136159 ?auto_136165 ) ) ( not ( = ?auto_136160 ?auto_136163 ) ) ( not ( = ?auto_136160 ?auto_136165 ) ) ( not ( = ?auto_136161 ?auto_136163 ) ) ( not ( = ?auto_136161 ?auto_136165 ) ) ( not ( = ?auto_136166 ?auto_136163 ) ) ( not ( = ?auto_136166 ?auto_136165 ) ) ( not ( = ?auto_136163 ?auto_136165 ) ) ( ON ?auto_136163 ?auto_136166 ) ( not ( = ?auto_136167 ?auto_136164 ) ) ( not ( = ?auto_136167 ?auto_136162 ) ) ( not ( = ?auto_136167 ?auto_136165 ) ) ( not ( = ?auto_136164 ?auto_136162 ) ) ( not ( = ?auto_136164 ?auto_136165 ) ) ( not ( = ?auto_136162 ?auto_136165 ) ) ( not ( = ?auto_136159 ?auto_136162 ) ) ( not ( = ?auto_136159 ?auto_136167 ) ) ( not ( = ?auto_136159 ?auto_136164 ) ) ( not ( = ?auto_136160 ?auto_136162 ) ) ( not ( = ?auto_136160 ?auto_136167 ) ) ( not ( = ?auto_136160 ?auto_136164 ) ) ( not ( = ?auto_136161 ?auto_136162 ) ) ( not ( = ?auto_136161 ?auto_136167 ) ) ( not ( = ?auto_136161 ?auto_136164 ) ) ( not ( = ?auto_136166 ?auto_136162 ) ) ( not ( = ?auto_136166 ?auto_136167 ) ) ( not ( = ?auto_136166 ?auto_136164 ) ) ( not ( = ?auto_136163 ?auto_136162 ) ) ( not ( = ?auto_136163 ?auto_136167 ) ) ( not ( = ?auto_136163 ?auto_136164 ) ) ( ON ?auto_136165 ?auto_136163 ) ( ON ?auto_136162 ?auto_136165 ) ( ON ?auto_136164 ?auto_136162 ) ( CLEAR ?auto_136164 ) ( HOLDING ?auto_136167 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_136167 )
      ( MAKE-3PILE ?auto_136159 ?auto_136160 ?auto_136161 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_136168 - BLOCK
      ?auto_136169 - BLOCK
      ?auto_136170 - BLOCK
    )
    :vars
    (
      ?auto_136174 - BLOCK
      ?auto_136176 - BLOCK
      ?auto_136172 - BLOCK
      ?auto_136175 - BLOCK
      ?auto_136171 - BLOCK
      ?auto_136173 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_136174 ?auto_136170 ) ( ON-TABLE ?auto_136168 ) ( ON ?auto_136169 ?auto_136168 ) ( ON ?auto_136170 ?auto_136169 ) ( not ( = ?auto_136168 ?auto_136169 ) ) ( not ( = ?auto_136168 ?auto_136170 ) ) ( not ( = ?auto_136168 ?auto_136174 ) ) ( not ( = ?auto_136169 ?auto_136170 ) ) ( not ( = ?auto_136169 ?auto_136174 ) ) ( not ( = ?auto_136170 ?auto_136174 ) ) ( not ( = ?auto_136168 ?auto_136176 ) ) ( not ( = ?auto_136168 ?auto_136172 ) ) ( not ( = ?auto_136169 ?auto_136176 ) ) ( not ( = ?auto_136169 ?auto_136172 ) ) ( not ( = ?auto_136170 ?auto_136176 ) ) ( not ( = ?auto_136170 ?auto_136172 ) ) ( not ( = ?auto_136174 ?auto_136176 ) ) ( not ( = ?auto_136174 ?auto_136172 ) ) ( not ( = ?auto_136176 ?auto_136172 ) ) ( ON ?auto_136176 ?auto_136174 ) ( not ( = ?auto_136175 ?auto_136171 ) ) ( not ( = ?auto_136175 ?auto_136173 ) ) ( not ( = ?auto_136175 ?auto_136172 ) ) ( not ( = ?auto_136171 ?auto_136173 ) ) ( not ( = ?auto_136171 ?auto_136172 ) ) ( not ( = ?auto_136173 ?auto_136172 ) ) ( not ( = ?auto_136168 ?auto_136173 ) ) ( not ( = ?auto_136168 ?auto_136175 ) ) ( not ( = ?auto_136168 ?auto_136171 ) ) ( not ( = ?auto_136169 ?auto_136173 ) ) ( not ( = ?auto_136169 ?auto_136175 ) ) ( not ( = ?auto_136169 ?auto_136171 ) ) ( not ( = ?auto_136170 ?auto_136173 ) ) ( not ( = ?auto_136170 ?auto_136175 ) ) ( not ( = ?auto_136170 ?auto_136171 ) ) ( not ( = ?auto_136174 ?auto_136173 ) ) ( not ( = ?auto_136174 ?auto_136175 ) ) ( not ( = ?auto_136174 ?auto_136171 ) ) ( not ( = ?auto_136176 ?auto_136173 ) ) ( not ( = ?auto_136176 ?auto_136175 ) ) ( not ( = ?auto_136176 ?auto_136171 ) ) ( ON ?auto_136172 ?auto_136176 ) ( ON ?auto_136173 ?auto_136172 ) ( ON ?auto_136171 ?auto_136173 ) ( ON ?auto_136175 ?auto_136171 ) ( CLEAR ?auto_136175 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_136168 ?auto_136169 ?auto_136170 ?auto_136174 ?auto_136176 ?auto_136172 ?auto_136173 ?auto_136171 )
      ( MAKE-3PILE ?auto_136168 ?auto_136169 ?auto_136170 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_136183 - BLOCK
      ?auto_136184 - BLOCK
      ?auto_136185 - BLOCK
      ?auto_136186 - BLOCK
      ?auto_136187 - BLOCK
      ?auto_136188 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_136188 ) ( CLEAR ?auto_136187 ) ( ON-TABLE ?auto_136183 ) ( ON ?auto_136184 ?auto_136183 ) ( ON ?auto_136185 ?auto_136184 ) ( ON ?auto_136186 ?auto_136185 ) ( ON ?auto_136187 ?auto_136186 ) ( not ( = ?auto_136183 ?auto_136184 ) ) ( not ( = ?auto_136183 ?auto_136185 ) ) ( not ( = ?auto_136183 ?auto_136186 ) ) ( not ( = ?auto_136183 ?auto_136187 ) ) ( not ( = ?auto_136183 ?auto_136188 ) ) ( not ( = ?auto_136184 ?auto_136185 ) ) ( not ( = ?auto_136184 ?auto_136186 ) ) ( not ( = ?auto_136184 ?auto_136187 ) ) ( not ( = ?auto_136184 ?auto_136188 ) ) ( not ( = ?auto_136185 ?auto_136186 ) ) ( not ( = ?auto_136185 ?auto_136187 ) ) ( not ( = ?auto_136185 ?auto_136188 ) ) ( not ( = ?auto_136186 ?auto_136187 ) ) ( not ( = ?auto_136186 ?auto_136188 ) ) ( not ( = ?auto_136187 ?auto_136188 ) ) )
    :subtasks
    ( ( !STACK ?auto_136188 ?auto_136187 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_136189 - BLOCK
      ?auto_136190 - BLOCK
      ?auto_136191 - BLOCK
      ?auto_136192 - BLOCK
      ?auto_136193 - BLOCK
      ?auto_136194 - BLOCK
    )
    :vars
    (
      ?auto_136195 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_136193 ) ( ON-TABLE ?auto_136189 ) ( ON ?auto_136190 ?auto_136189 ) ( ON ?auto_136191 ?auto_136190 ) ( ON ?auto_136192 ?auto_136191 ) ( ON ?auto_136193 ?auto_136192 ) ( not ( = ?auto_136189 ?auto_136190 ) ) ( not ( = ?auto_136189 ?auto_136191 ) ) ( not ( = ?auto_136189 ?auto_136192 ) ) ( not ( = ?auto_136189 ?auto_136193 ) ) ( not ( = ?auto_136189 ?auto_136194 ) ) ( not ( = ?auto_136190 ?auto_136191 ) ) ( not ( = ?auto_136190 ?auto_136192 ) ) ( not ( = ?auto_136190 ?auto_136193 ) ) ( not ( = ?auto_136190 ?auto_136194 ) ) ( not ( = ?auto_136191 ?auto_136192 ) ) ( not ( = ?auto_136191 ?auto_136193 ) ) ( not ( = ?auto_136191 ?auto_136194 ) ) ( not ( = ?auto_136192 ?auto_136193 ) ) ( not ( = ?auto_136192 ?auto_136194 ) ) ( not ( = ?auto_136193 ?auto_136194 ) ) ( ON ?auto_136194 ?auto_136195 ) ( CLEAR ?auto_136194 ) ( HAND-EMPTY ) ( not ( = ?auto_136189 ?auto_136195 ) ) ( not ( = ?auto_136190 ?auto_136195 ) ) ( not ( = ?auto_136191 ?auto_136195 ) ) ( not ( = ?auto_136192 ?auto_136195 ) ) ( not ( = ?auto_136193 ?auto_136195 ) ) ( not ( = ?auto_136194 ?auto_136195 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_136194 ?auto_136195 )
      ( MAKE-6PILE ?auto_136189 ?auto_136190 ?auto_136191 ?auto_136192 ?auto_136193 ?auto_136194 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_136196 - BLOCK
      ?auto_136197 - BLOCK
      ?auto_136198 - BLOCK
      ?auto_136199 - BLOCK
      ?auto_136200 - BLOCK
      ?auto_136201 - BLOCK
    )
    :vars
    (
      ?auto_136202 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_136196 ) ( ON ?auto_136197 ?auto_136196 ) ( ON ?auto_136198 ?auto_136197 ) ( ON ?auto_136199 ?auto_136198 ) ( not ( = ?auto_136196 ?auto_136197 ) ) ( not ( = ?auto_136196 ?auto_136198 ) ) ( not ( = ?auto_136196 ?auto_136199 ) ) ( not ( = ?auto_136196 ?auto_136200 ) ) ( not ( = ?auto_136196 ?auto_136201 ) ) ( not ( = ?auto_136197 ?auto_136198 ) ) ( not ( = ?auto_136197 ?auto_136199 ) ) ( not ( = ?auto_136197 ?auto_136200 ) ) ( not ( = ?auto_136197 ?auto_136201 ) ) ( not ( = ?auto_136198 ?auto_136199 ) ) ( not ( = ?auto_136198 ?auto_136200 ) ) ( not ( = ?auto_136198 ?auto_136201 ) ) ( not ( = ?auto_136199 ?auto_136200 ) ) ( not ( = ?auto_136199 ?auto_136201 ) ) ( not ( = ?auto_136200 ?auto_136201 ) ) ( ON ?auto_136201 ?auto_136202 ) ( CLEAR ?auto_136201 ) ( not ( = ?auto_136196 ?auto_136202 ) ) ( not ( = ?auto_136197 ?auto_136202 ) ) ( not ( = ?auto_136198 ?auto_136202 ) ) ( not ( = ?auto_136199 ?auto_136202 ) ) ( not ( = ?auto_136200 ?auto_136202 ) ) ( not ( = ?auto_136201 ?auto_136202 ) ) ( HOLDING ?auto_136200 ) ( CLEAR ?auto_136199 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_136196 ?auto_136197 ?auto_136198 ?auto_136199 ?auto_136200 )
      ( MAKE-6PILE ?auto_136196 ?auto_136197 ?auto_136198 ?auto_136199 ?auto_136200 ?auto_136201 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_136203 - BLOCK
      ?auto_136204 - BLOCK
      ?auto_136205 - BLOCK
      ?auto_136206 - BLOCK
      ?auto_136207 - BLOCK
      ?auto_136208 - BLOCK
    )
    :vars
    (
      ?auto_136209 - BLOCK
      ?auto_136210 - BLOCK
      ?auto_136211 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_136203 ) ( ON ?auto_136204 ?auto_136203 ) ( ON ?auto_136205 ?auto_136204 ) ( ON ?auto_136206 ?auto_136205 ) ( not ( = ?auto_136203 ?auto_136204 ) ) ( not ( = ?auto_136203 ?auto_136205 ) ) ( not ( = ?auto_136203 ?auto_136206 ) ) ( not ( = ?auto_136203 ?auto_136207 ) ) ( not ( = ?auto_136203 ?auto_136208 ) ) ( not ( = ?auto_136204 ?auto_136205 ) ) ( not ( = ?auto_136204 ?auto_136206 ) ) ( not ( = ?auto_136204 ?auto_136207 ) ) ( not ( = ?auto_136204 ?auto_136208 ) ) ( not ( = ?auto_136205 ?auto_136206 ) ) ( not ( = ?auto_136205 ?auto_136207 ) ) ( not ( = ?auto_136205 ?auto_136208 ) ) ( not ( = ?auto_136206 ?auto_136207 ) ) ( not ( = ?auto_136206 ?auto_136208 ) ) ( not ( = ?auto_136207 ?auto_136208 ) ) ( ON ?auto_136208 ?auto_136209 ) ( not ( = ?auto_136203 ?auto_136209 ) ) ( not ( = ?auto_136204 ?auto_136209 ) ) ( not ( = ?auto_136205 ?auto_136209 ) ) ( not ( = ?auto_136206 ?auto_136209 ) ) ( not ( = ?auto_136207 ?auto_136209 ) ) ( not ( = ?auto_136208 ?auto_136209 ) ) ( CLEAR ?auto_136206 ) ( ON ?auto_136207 ?auto_136208 ) ( CLEAR ?auto_136207 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_136210 ) ( ON ?auto_136211 ?auto_136210 ) ( ON ?auto_136209 ?auto_136211 ) ( not ( = ?auto_136210 ?auto_136211 ) ) ( not ( = ?auto_136210 ?auto_136209 ) ) ( not ( = ?auto_136210 ?auto_136208 ) ) ( not ( = ?auto_136210 ?auto_136207 ) ) ( not ( = ?auto_136211 ?auto_136209 ) ) ( not ( = ?auto_136211 ?auto_136208 ) ) ( not ( = ?auto_136211 ?auto_136207 ) ) ( not ( = ?auto_136203 ?auto_136210 ) ) ( not ( = ?auto_136203 ?auto_136211 ) ) ( not ( = ?auto_136204 ?auto_136210 ) ) ( not ( = ?auto_136204 ?auto_136211 ) ) ( not ( = ?auto_136205 ?auto_136210 ) ) ( not ( = ?auto_136205 ?auto_136211 ) ) ( not ( = ?auto_136206 ?auto_136210 ) ) ( not ( = ?auto_136206 ?auto_136211 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_136210 ?auto_136211 ?auto_136209 ?auto_136208 )
      ( MAKE-6PILE ?auto_136203 ?auto_136204 ?auto_136205 ?auto_136206 ?auto_136207 ?auto_136208 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_136212 - BLOCK
      ?auto_136213 - BLOCK
      ?auto_136214 - BLOCK
      ?auto_136215 - BLOCK
      ?auto_136216 - BLOCK
      ?auto_136217 - BLOCK
    )
    :vars
    (
      ?auto_136218 - BLOCK
      ?auto_136220 - BLOCK
      ?auto_136219 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_136212 ) ( ON ?auto_136213 ?auto_136212 ) ( ON ?auto_136214 ?auto_136213 ) ( not ( = ?auto_136212 ?auto_136213 ) ) ( not ( = ?auto_136212 ?auto_136214 ) ) ( not ( = ?auto_136212 ?auto_136215 ) ) ( not ( = ?auto_136212 ?auto_136216 ) ) ( not ( = ?auto_136212 ?auto_136217 ) ) ( not ( = ?auto_136213 ?auto_136214 ) ) ( not ( = ?auto_136213 ?auto_136215 ) ) ( not ( = ?auto_136213 ?auto_136216 ) ) ( not ( = ?auto_136213 ?auto_136217 ) ) ( not ( = ?auto_136214 ?auto_136215 ) ) ( not ( = ?auto_136214 ?auto_136216 ) ) ( not ( = ?auto_136214 ?auto_136217 ) ) ( not ( = ?auto_136215 ?auto_136216 ) ) ( not ( = ?auto_136215 ?auto_136217 ) ) ( not ( = ?auto_136216 ?auto_136217 ) ) ( ON ?auto_136217 ?auto_136218 ) ( not ( = ?auto_136212 ?auto_136218 ) ) ( not ( = ?auto_136213 ?auto_136218 ) ) ( not ( = ?auto_136214 ?auto_136218 ) ) ( not ( = ?auto_136215 ?auto_136218 ) ) ( not ( = ?auto_136216 ?auto_136218 ) ) ( not ( = ?auto_136217 ?auto_136218 ) ) ( ON ?auto_136216 ?auto_136217 ) ( CLEAR ?auto_136216 ) ( ON-TABLE ?auto_136220 ) ( ON ?auto_136219 ?auto_136220 ) ( ON ?auto_136218 ?auto_136219 ) ( not ( = ?auto_136220 ?auto_136219 ) ) ( not ( = ?auto_136220 ?auto_136218 ) ) ( not ( = ?auto_136220 ?auto_136217 ) ) ( not ( = ?auto_136220 ?auto_136216 ) ) ( not ( = ?auto_136219 ?auto_136218 ) ) ( not ( = ?auto_136219 ?auto_136217 ) ) ( not ( = ?auto_136219 ?auto_136216 ) ) ( not ( = ?auto_136212 ?auto_136220 ) ) ( not ( = ?auto_136212 ?auto_136219 ) ) ( not ( = ?auto_136213 ?auto_136220 ) ) ( not ( = ?auto_136213 ?auto_136219 ) ) ( not ( = ?auto_136214 ?auto_136220 ) ) ( not ( = ?auto_136214 ?auto_136219 ) ) ( not ( = ?auto_136215 ?auto_136220 ) ) ( not ( = ?auto_136215 ?auto_136219 ) ) ( HOLDING ?auto_136215 ) ( CLEAR ?auto_136214 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_136212 ?auto_136213 ?auto_136214 ?auto_136215 )
      ( MAKE-6PILE ?auto_136212 ?auto_136213 ?auto_136214 ?auto_136215 ?auto_136216 ?auto_136217 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_136221 - BLOCK
      ?auto_136222 - BLOCK
      ?auto_136223 - BLOCK
      ?auto_136224 - BLOCK
      ?auto_136225 - BLOCK
      ?auto_136226 - BLOCK
    )
    :vars
    (
      ?auto_136229 - BLOCK
      ?auto_136227 - BLOCK
      ?auto_136228 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_136221 ) ( ON ?auto_136222 ?auto_136221 ) ( ON ?auto_136223 ?auto_136222 ) ( not ( = ?auto_136221 ?auto_136222 ) ) ( not ( = ?auto_136221 ?auto_136223 ) ) ( not ( = ?auto_136221 ?auto_136224 ) ) ( not ( = ?auto_136221 ?auto_136225 ) ) ( not ( = ?auto_136221 ?auto_136226 ) ) ( not ( = ?auto_136222 ?auto_136223 ) ) ( not ( = ?auto_136222 ?auto_136224 ) ) ( not ( = ?auto_136222 ?auto_136225 ) ) ( not ( = ?auto_136222 ?auto_136226 ) ) ( not ( = ?auto_136223 ?auto_136224 ) ) ( not ( = ?auto_136223 ?auto_136225 ) ) ( not ( = ?auto_136223 ?auto_136226 ) ) ( not ( = ?auto_136224 ?auto_136225 ) ) ( not ( = ?auto_136224 ?auto_136226 ) ) ( not ( = ?auto_136225 ?auto_136226 ) ) ( ON ?auto_136226 ?auto_136229 ) ( not ( = ?auto_136221 ?auto_136229 ) ) ( not ( = ?auto_136222 ?auto_136229 ) ) ( not ( = ?auto_136223 ?auto_136229 ) ) ( not ( = ?auto_136224 ?auto_136229 ) ) ( not ( = ?auto_136225 ?auto_136229 ) ) ( not ( = ?auto_136226 ?auto_136229 ) ) ( ON ?auto_136225 ?auto_136226 ) ( ON-TABLE ?auto_136227 ) ( ON ?auto_136228 ?auto_136227 ) ( ON ?auto_136229 ?auto_136228 ) ( not ( = ?auto_136227 ?auto_136228 ) ) ( not ( = ?auto_136227 ?auto_136229 ) ) ( not ( = ?auto_136227 ?auto_136226 ) ) ( not ( = ?auto_136227 ?auto_136225 ) ) ( not ( = ?auto_136228 ?auto_136229 ) ) ( not ( = ?auto_136228 ?auto_136226 ) ) ( not ( = ?auto_136228 ?auto_136225 ) ) ( not ( = ?auto_136221 ?auto_136227 ) ) ( not ( = ?auto_136221 ?auto_136228 ) ) ( not ( = ?auto_136222 ?auto_136227 ) ) ( not ( = ?auto_136222 ?auto_136228 ) ) ( not ( = ?auto_136223 ?auto_136227 ) ) ( not ( = ?auto_136223 ?auto_136228 ) ) ( not ( = ?auto_136224 ?auto_136227 ) ) ( not ( = ?auto_136224 ?auto_136228 ) ) ( CLEAR ?auto_136223 ) ( ON ?auto_136224 ?auto_136225 ) ( CLEAR ?auto_136224 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_136227 ?auto_136228 ?auto_136229 ?auto_136226 ?auto_136225 )
      ( MAKE-6PILE ?auto_136221 ?auto_136222 ?auto_136223 ?auto_136224 ?auto_136225 ?auto_136226 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_136230 - BLOCK
      ?auto_136231 - BLOCK
      ?auto_136232 - BLOCK
      ?auto_136233 - BLOCK
      ?auto_136234 - BLOCK
      ?auto_136235 - BLOCK
    )
    :vars
    (
      ?auto_136237 - BLOCK
      ?auto_136238 - BLOCK
      ?auto_136236 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_136230 ) ( ON ?auto_136231 ?auto_136230 ) ( not ( = ?auto_136230 ?auto_136231 ) ) ( not ( = ?auto_136230 ?auto_136232 ) ) ( not ( = ?auto_136230 ?auto_136233 ) ) ( not ( = ?auto_136230 ?auto_136234 ) ) ( not ( = ?auto_136230 ?auto_136235 ) ) ( not ( = ?auto_136231 ?auto_136232 ) ) ( not ( = ?auto_136231 ?auto_136233 ) ) ( not ( = ?auto_136231 ?auto_136234 ) ) ( not ( = ?auto_136231 ?auto_136235 ) ) ( not ( = ?auto_136232 ?auto_136233 ) ) ( not ( = ?auto_136232 ?auto_136234 ) ) ( not ( = ?auto_136232 ?auto_136235 ) ) ( not ( = ?auto_136233 ?auto_136234 ) ) ( not ( = ?auto_136233 ?auto_136235 ) ) ( not ( = ?auto_136234 ?auto_136235 ) ) ( ON ?auto_136235 ?auto_136237 ) ( not ( = ?auto_136230 ?auto_136237 ) ) ( not ( = ?auto_136231 ?auto_136237 ) ) ( not ( = ?auto_136232 ?auto_136237 ) ) ( not ( = ?auto_136233 ?auto_136237 ) ) ( not ( = ?auto_136234 ?auto_136237 ) ) ( not ( = ?auto_136235 ?auto_136237 ) ) ( ON ?auto_136234 ?auto_136235 ) ( ON-TABLE ?auto_136238 ) ( ON ?auto_136236 ?auto_136238 ) ( ON ?auto_136237 ?auto_136236 ) ( not ( = ?auto_136238 ?auto_136236 ) ) ( not ( = ?auto_136238 ?auto_136237 ) ) ( not ( = ?auto_136238 ?auto_136235 ) ) ( not ( = ?auto_136238 ?auto_136234 ) ) ( not ( = ?auto_136236 ?auto_136237 ) ) ( not ( = ?auto_136236 ?auto_136235 ) ) ( not ( = ?auto_136236 ?auto_136234 ) ) ( not ( = ?auto_136230 ?auto_136238 ) ) ( not ( = ?auto_136230 ?auto_136236 ) ) ( not ( = ?auto_136231 ?auto_136238 ) ) ( not ( = ?auto_136231 ?auto_136236 ) ) ( not ( = ?auto_136232 ?auto_136238 ) ) ( not ( = ?auto_136232 ?auto_136236 ) ) ( not ( = ?auto_136233 ?auto_136238 ) ) ( not ( = ?auto_136233 ?auto_136236 ) ) ( ON ?auto_136233 ?auto_136234 ) ( CLEAR ?auto_136233 ) ( HOLDING ?auto_136232 ) ( CLEAR ?auto_136231 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_136230 ?auto_136231 ?auto_136232 )
      ( MAKE-6PILE ?auto_136230 ?auto_136231 ?auto_136232 ?auto_136233 ?auto_136234 ?auto_136235 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_136239 - BLOCK
      ?auto_136240 - BLOCK
      ?auto_136241 - BLOCK
      ?auto_136242 - BLOCK
      ?auto_136243 - BLOCK
      ?auto_136244 - BLOCK
    )
    :vars
    (
      ?auto_136247 - BLOCK
      ?auto_136246 - BLOCK
      ?auto_136245 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_136239 ) ( ON ?auto_136240 ?auto_136239 ) ( not ( = ?auto_136239 ?auto_136240 ) ) ( not ( = ?auto_136239 ?auto_136241 ) ) ( not ( = ?auto_136239 ?auto_136242 ) ) ( not ( = ?auto_136239 ?auto_136243 ) ) ( not ( = ?auto_136239 ?auto_136244 ) ) ( not ( = ?auto_136240 ?auto_136241 ) ) ( not ( = ?auto_136240 ?auto_136242 ) ) ( not ( = ?auto_136240 ?auto_136243 ) ) ( not ( = ?auto_136240 ?auto_136244 ) ) ( not ( = ?auto_136241 ?auto_136242 ) ) ( not ( = ?auto_136241 ?auto_136243 ) ) ( not ( = ?auto_136241 ?auto_136244 ) ) ( not ( = ?auto_136242 ?auto_136243 ) ) ( not ( = ?auto_136242 ?auto_136244 ) ) ( not ( = ?auto_136243 ?auto_136244 ) ) ( ON ?auto_136244 ?auto_136247 ) ( not ( = ?auto_136239 ?auto_136247 ) ) ( not ( = ?auto_136240 ?auto_136247 ) ) ( not ( = ?auto_136241 ?auto_136247 ) ) ( not ( = ?auto_136242 ?auto_136247 ) ) ( not ( = ?auto_136243 ?auto_136247 ) ) ( not ( = ?auto_136244 ?auto_136247 ) ) ( ON ?auto_136243 ?auto_136244 ) ( ON-TABLE ?auto_136246 ) ( ON ?auto_136245 ?auto_136246 ) ( ON ?auto_136247 ?auto_136245 ) ( not ( = ?auto_136246 ?auto_136245 ) ) ( not ( = ?auto_136246 ?auto_136247 ) ) ( not ( = ?auto_136246 ?auto_136244 ) ) ( not ( = ?auto_136246 ?auto_136243 ) ) ( not ( = ?auto_136245 ?auto_136247 ) ) ( not ( = ?auto_136245 ?auto_136244 ) ) ( not ( = ?auto_136245 ?auto_136243 ) ) ( not ( = ?auto_136239 ?auto_136246 ) ) ( not ( = ?auto_136239 ?auto_136245 ) ) ( not ( = ?auto_136240 ?auto_136246 ) ) ( not ( = ?auto_136240 ?auto_136245 ) ) ( not ( = ?auto_136241 ?auto_136246 ) ) ( not ( = ?auto_136241 ?auto_136245 ) ) ( not ( = ?auto_136242 ?auto_136246 ) ) ( not ( = ?auto_136242 ?auto_136245 ) ) ( ON ?auto_136242 ?auto_136243 ) ( CLEAR ?auto_136240 ) ( ON ?auto_136241 ?auto_136242 ) ( CLEAR ?auto_136241 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_136246 ?auto_136245 ?auto_136247 ?auto_136244 ?auto_136243 ?auto_136242 )
      ( MAKE-6PILE ?auto_136239 ?auto_136240 ?auto_136241 ?auto_136242 ?auto_136243 ?auto_136244 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_136248 - BLOCK
      ?auto_136249 - BLOCK
      ?auto_136250 - BLOCK
      ?auto_136251 - BLOCK
      ?auto_136252 - BLOCK
      ?auto_136253 - BLOCK
    )
    :vars
    (
      ?auto_136255 - BLOCK
      ?auto_136254 - BLOCK
      ?auto_136256 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_136248 ) ( not ( = ?auto_136248 ?auto_136249 ) ) ( not ( = ?auto_136248 ?auto_136250 ) ) ( not ( = ?auto_136248 ?auto_136251 ) ) ( not ( = ?auto_136248 ?auto_136252 ) ) ( not ( = ?auto_136248 ?auto_136253 ) ) ( not ( = ?auto_136249 ?auto_136250 ) ) ( not ( = ?auto_136249 ?auto_136251 ) ) ( not ( = ?auto_136249 ?auto_136252 ) ) ( not ( = ?auto_136249 ?auto_136253 ) ) ( not ( = ?auto_136250 ?auto_136251 ) ) ( not ( = ?auto_136250 ?auto_136252 ) ) ( not ( = ?auto_136250 ?auto_136253 ) ) ( not ( = ?auto_136251 ?auto_136252 ) ) ( not ( = ?auto_136251 ?auto_136253 ) ) ( not ( = ?auto_136252 ?auto_136253 ) ) ( ON ?auto_136253 ?auto_136255 ) ( not ( = ?auto_136248 ?auto_136255 ) ) ( not ( = ?auto_136249 ?auto_136255 ) ) ( not ( = ?auto_136250 ?auto_136255 ) ) ( not ( = ?auto_136251 ?auto_136255 ) ) ( not ( = ?auto_136252 ?auto_136255 ) ) ( not ( = ?auto_136253 ?auto_136255 ) ) ( ON ?auto_136252 ?auto_136253 ) ( ON-TABLE ?auto_136254 ) ( ON ?auto_136256 ?auto_136254 ) ( ON ?auto_136255 ?auto_136256 ) ( not ( = ?auto_136254 ?auto_136256 ) ) ( not ( = ?auto_136254 ?auto_136255 ) ) ( not ( = ?auto_136254 ?auto_136253 ) ) ( not ( = ?auto_136254 ?auto_136252 ) ) ( not ( = ?auto_136256 ?auto_136255 ) ) ( not ( = ?auto_136256 ?auto_136253 ) ) ( not ( = ?auto_136256 ?auto_136252 ) ) ( not ( = ?auto_136248 ?auto_136254 ) ) ( not ( = ?auto_136248 ?auto_136256 ) ) ( not ( = ?auto_136249 ?auto_136254 ) ) ( not ( = ?auto_136249 ?auto_136256 ) ) ( not ( = ?auto_136250 ?auto_136254 ) ) ( not ( = ?auto_136250 ?auto_136256 ) ) ( not ( = ?auto_136251 ?auto_136254 ) ) ( not ( = ?auto_136251 ?auto_136256 ) ) ( ON ?auto_136251 ?auto_136252 ) ( ON ?auto_136250 ?auto_136251 ) ( CLEAR ?auto_136250 ) ( HOLDING ?auto_136249 ) ( CLEAR ?auto_136248 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_136248 ?auto_136249 )
      ( MAKE-6PILE ?auto_136248 ?auto_136249 ?auto_136250 ?auto_136251 ?auto_136252 ?auto_136253 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_136257 - BLOCK
      ?auto_136258 - BLOCK
      ?auto_136259 - BLOCK
      ?auto_136260 - BLOCK
      ?auto_136261 - BLOCK
      ?auto_136262 - BLOCK
    )
    :vars
    (
      ?auto_136265 - BLOCK
      ?auto_136263 - BLOCK
      ?auto_136264 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_136257 ) ( not ( = ?auto_136257 ?auto_136258 ) ) ( not ( = ?auto_136257 ?auto_136259 ) ) ( not ( = ?auto_136257 ?auto_136260 ) ) ( not ( = ?auto_136257 ?auto_136261 ) ) ( not ( = ?auto_136257 ?auto_136262 ) ) ( not ( = ?auto_136258 ?auto_136259 ) ) ( not ( = ?auto_136258 ?auto_136260 ) ) ( not ( = ?auto_136258 ?auto_136261 ) ) ( not ( = ?auto_136258 ?auto_136262 ) ) ( not ( = ?auto_136259 ?auto_136260 ) ) ( not ( = ?auto_136259 ?auto_136261 ) ) ( not ( = ?auto_136259 ?auto_136262 ) ) ( not ( = ?auto_136260 ?auto_136261 ) ) ( not ( = ?auto_136260 ?auto_136262 ) ) ( not ( = ?auto_136261 ?auto_136262 ) ) ( ON ?auto_136262 ?auto_136265 ) ( not ( = ?auto_136257 ?auto_136265 ) ) ( not ( = ?auto_136258 ?auto_136265 ) ) ( not ( = ?auto_136259 ?auto_136265 ) ) ( not ( = ?auto_136260 ?auto_136265 ) ) ( not ( = ?auto_136261 ?auto_136265 ) ) ( not ( = ?auto_136262 ?auto_136265 ) ) ( ON ?auto_136261 ?auto_136262 ) ( ON-TABLE ?auto_136263 ) ( ON ?auto_136264 ?auto_136263 ) ( ON ?auto_136265 ?auto_136264 ) ( not ( = ?auto_136263 ?auto_136264 ) ) ( not ( = ?auto_136263 ?auto_136265 ) ) ( not ( = ?auto_136263 ?auto_136262 ) ) ( not ( = ?auto_136263 ?auto_136261 ) ) ( not ( = ?auto_136264 ?auto_136265 ) ) ( not ( = ?auto_136264 ?auto_136262 ) ) ( not ( = ?auto_136264 ?auto_136261 ) ) ( not ( = ?auto_136257 ?auto_136263 ) ) ( not ( = ?auto_136257 ?auto_136264 ) ) ( not ( = ?auto_136258 ?auto_136263 ) ) ( not ( = ?auto_136258 ?auto_136264 ) ) ( not ( = ?auto_136259 ?auto_136263 ) ) ( not ( = ?auto_136259 ?auto_136264 ) ) ( not ( = ?auto_136260 ?auto_136263 ) ) ( not ( = ?auto_136260 ?auto_136264 ) ) ( ON ?auto_136260 ?auto_136261 ) ( ON ?auto_136259 ?auto_136260 ) ( CLEAR ?auto_136257 ) ( ON ?auto_136258 ?auto_136259 ) ( CLEAR ?auto_136258 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_136263 ?auto_136264 ?auto_136265 ?auto_136262 ?auto_136261 ?auto_136260 ?auto_136259 )
      ( MAKE-6PILE ?auto_136257 ?auto_136258 ?auto_136259 ?auto_136260 ?auto_136261 ?auto_136262 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_136266 - BLOCK
      ?auto_136267 - BLOCK
      ?auto_136268 - BLOCK
      ?auto_136269 - BLOCK
      ?auto_136270 - BLOCK
      ?auto_136271 - BLOCK
    )
    :vars
    (
      ?auto_136273 - BLOCK
      ?auto_136272 - BLOCK
      ?auto_136274 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_136266 ?auto_136267 ) ) ( not ( = ?auto_136266 ?auto_136268 ) ) ( not ( = ?auto_136266 ?auto_136269 ) ) ( not ( = ?auto_136266 ?auto_136270 ) ) ( not ( = ?auto_136266 ?auto_136271 ) ) ( not ( = ?auto_136267 ?auto_136268 ) ) ( not ( = ?auto_136267 ?auto_136269 ) ) ( not ( = ?auto_136267 ?auto_136270 ) ) ( not ( = ?auto_136267 ?auto_136271 ) ) ( not ( = ?auto_136268 ?auto_136269 ) ) ( not ( = ?auto_136268 ?auto_136270 ) ) ( not ( = ?auto_136268 ?auto_136271 ) ) ( not ( = ?auto_136269 ?auto_136270 ) ) ( not ( = ?auto_136269 ?auto_136271 ) ) ( not ( = ?auto_136270 ?auto_136271 ) ) ( ON ?auto_136271 ?auto_136273 ) ( not ( = ?auto_136266 ?auto_136273 ) ) ( not ( = ?auto_136267 ?auto_136273 ) ) ( not ( = ?auto_136268 ?auto_136273 ) ) ( not ( = ?auto_136269 ?auto_136273 ) ) ( not ( = ?auto_136270 ?auto_136273 ) ) ( not ( = ?auto_136271 ?auto_136273 ) ) ( ON ?auto_136270 ?auto_136271 ) ( ON-TABLE ?auto_136272 ) ( ON ?auto_136274 ?auto_136272 ) ( ON ?auto_136273 ?auto_136274 ) ( not ( = ?auto_136272 ?auto_136274 ) ) ( not ( = ?auto_136272 ?auto_136273 ) ) ( not ( = ?auto_136272 ?auto_136271 ) ) ( not ( = ?auto_136272 ?auto_136270 ) ) ( not ( = ?auto_136274 ?auto_136273 ) ) ( not ( = ?auto_136274 ?auto_136271 ) ) ( not ( = ?auto_136274 ?auto_136270 ) ) ( not ( = ?auto_136266 ?auto_136272 ) ) ( not ( = ?auto_136266 ?auto_136274 ) ) ( not ( = ?auto_136267 ?auto_136272 ) ) ( not ( = ?auto_136267 ?auto_136274 ) ) ( not ( = ?auto_136268 ?auto_136272 ) ) ( not ( = ?auto_136268 ?auto_136274 ) ) ( not ( = ?auto_136269 ?auto_136272 ) ) ( not ( = ?auto_136269 ?auto_136274 ) ) ( ON ?auto_136269 ?auto_136270 ) ( ON ?auto_136268 ?auto_136269 ) ( ON ?auto_136267 ?auto_136268 ) ( CLEAR ?auto_136267 ) ( HOLDING ?auto_136266 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_136266 )
      ( MAKE-6PILE ?auto_136266 ?auto_136267 ?auto_136268 ?auto_136269 ?auto_136270 ?auto_136271 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_136275 - BLOCK
      ?auto_136276 - BLOCK
      ?auto_136277 - BLOCK
      ?auto_136278 - BLOCK
      ?auto_136279 - BLOCK
      ?auto_136280 - BLOCK
    )
    :vars
    (
      ?auto_136281 - BLOCK
      ?auto_136283 - BLOCK
      ?auto_136282 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_136275 ?auto_136276 ) ) ( not ( = ?auto_136275 ?auto_136277 ) ) ( not ( = ?auto_136275 ?auto_136278 ) ) ( not ( = ?auto_136275 ?auto_136279 ) ) ( not ( = ?auto_136275 ?auto_136280 ) ) ( not ( = ?auto_136276 ?auto_136277 ) ) ( not ( = ?auto_136276 ?auto_136278 ) ) ( not ( = ?auto_136276 ?auto_136279 ) ) ( not ( = ?auto_136276 ?auto_136280 ) ) ( not ( = ?auto_136277 ?auto_136278 ) ) ( not ( = ?auto_136277 ?auto_136279 ) ) ( not ( = ?auto_136277 ?auto_136280 ) ) ( not ( = ?auto_136278 ?auto_136279 ) ) ( not ( = ?auto_136278 ?auto_136280 ) ) ( not ( = ?auto_136279 ?auto_136280 ) ) ( ON ?auto_136280 ?auto_136281 ) ( not ( = ?auto_136275 ?auto_136281 ) ) ( not ( = ?auto_136276 ?auto_136281 ) ) ( not ( = ?auto_136277 ?auto_136281 ) ) ( not ( = ?auto_136278 ?auto_136281 ) ) ( not ( = ?auto_136279 ?auto_136281 ) ) ( not ( = ?auto_136280 ?auto_136281 ) ) ( ON ?auto_136279 ?auto_136280 ) ( ON-TABLE ?auto_136283 ) ( ON ?auto_136282 ?auto_136283 ) ( ON ?auto_136281 ?auto_136282 ) ( not ( = ?auto_136283 ?auto_136282 ) ) ( not ( = ?auto_136283 ?auto_136281 ) ) ( not ( = ?auto_136283 ?auto_136280 ) ) ( not ( = ?auto_136283 ?auto_136279 ) ) ( not ( = ?auto_136282 ?auto_136281 ) ) ( not ( = ?auto_136282 ?auto_136280 ) ) ( not ( = ?auto_136282 ?auto_136279 ) ) ( not ( = ?auto_136275 ?auto_136283 ) ) ( not ( = ?auto_136275 ?auto_136282 ) ) ( not ( = ?auto_136276 ?auto_136283 ) ) ( not ( = ?auto_136276 ?auto_136282 ) ) ( not ( = ?auto_136277 ?auto_136283 ) ) ( not ( = ?auto_136277 ?auto_136282 ) ) ( not ( = ?auto_136278 ?auto_136283 ) ) ( not ( = ?auto_136278 ?auto_136282 ) ) ( ON ?auto_136278 ?auto_136279 ) ( ON ?auto_136277 ?auto_136278 ) ( ON ?auto_136276 ?auto_136277 ) ( ON ?auto_136275 ?auto_136276 ) ( CLEAR ?auto_136275 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_136283 ?auto_136282 ?auto_136281 ?auto_136280 ?auto_136279 ?auto_136278 ?auto_136277 ?auto_136276 )
      ( MAKE-6PILE ?auto_136275 ?auto_136276 ?auto_136277 ?auto_136278 ?auto_136279 ?auto_136280 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_136286 - BLOCK
      ?auto_136287 - BLOCK
    )
    :vars
    (
      ?auto_136288 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_136288 ?auto_136287 ) ( CLEAR ?auto_136288 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_136286 ) ( ON ?auto_136287 ?auto_136286 ) ( not ( = ?auto_136286 ?auto_136287 ) ) ( not ( = ?auto_136286 ?auto_136288 ) ) ( not ( = ?auto_136287 ?auto_136288 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_136288 ?auto_136287 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_136289 - BLOCK
      ?auto_136290 - BLOCK
    )
    :vars
    (
      ?auto_136291 - BLOCK
      ?auto_136292 - BLOCK
      ?auto_136293 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_136291 ?auto_136290 ) ( CLEAR ?auto_136291 ) ( ON-TABLE ?auto_136289 ) ( ON ?auto_136290 ?auto_136289 ) ( not ( = ?auto_136289 ?auto_136290 ) ) ( not ( = ?auto_136289 ?auto_136291 ) ) ( not ( = ?auto_136290 ?auto_136291 ) ) ( HOLDING ?auto_136292 ) ( CLEAR ?auto_136293 ) ( not ( = ?auto_136289 ?auto_136292 ) ) ( not ( = ?auto_136289 ?auto_136293 ) ) ( not ( = ?auto_136290 ?auto_136292 ) ) ( not ( = ?auto_136290 ?auto_136293 ) ) ( not ( = ?auto_136291 ?auto_136292 ) ) ( not ( = ?auto_136291 ?auto_136293 ) ) ( not ( = ?auto_136292 ?auto_136293 ) ) )
    :subtasks
    ( ( !STACK ?auto_136292 ?auto_136293 )
      ( MAKE-2PILE ?auto_136289 ?auto_136290 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_136294 - BLOCK
      ?auto_136295 - BLOCK
    )
    :vars
    (
      ?auto_136298 - BLOCK
      ?auto_136296 - BLOCK
      ?auto_136297 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_136298 ?auto_136295 ) ( ON-TABLE ?auto_136294 ) ( ON ?auto_136295 ?auto_136294 ) ( not ( = ?auto_136294 ?auto_136295 ) ) ( not ( = ?auto_136294 ?auto_136298 ) ) ( not ( = ?auto_136295 ?auto_136298 ) ) ( CLEAR ?auto_136296 ) ( not ( = ?auto_136294 ?auto_136297 ) ) ( not ( = ?auto_136294 ?auto_136296 ) ) ( not ( = ?auto_136295 ?auto_136297 ) ) ( not ( = ?auto_136295 ?auto_136296 ) ) ( not ( = ?auto_136298 ?auto_136297 ) ) ( not ( = ?auto_136298 ?auto_136296 ) ) ( not ( = ?auto_136297 ?auto_136296 ) ) ( ON ?auto_136297 ?auto_136298 ) ( CLEAR ?auto_136297 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_136294 ?auto_136295 ?auto_136298 )
      ( MAKE-2PILE ?auto_136294 ?auto_136295 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_136299 - BLOCK
      ?auto_136300 - BLOCK
    )
    :vars
    (
      ?auto_136303 - BLOCK
      ?auto_136302 - BLOCK
      ?auto_136301 - BLOCK
      ?auto_136305 - BLOCK
      ?auto_136306 - BLOCK
      ?auto_136307 - BLOCK
      ?auto_136304 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_136303 ?auto_136300 ) ( ON-TABLE ?auto_136299 ) ( ON ?auto_136300 ?auto_136299 ) ( not ( = ?auto_136299 ?auto_136300 ) ) ( not ( = ?auto_136299 ?auto_136303 ) ) ( not ( = ?auto_136300 ?auto_136303 ) ) ( not ( = ?auto_136299 ?auto_136302 ) ) ( not ( = ?auto_136299 ?auto_136301 ) ) ( not ( = ?auto_136300 ?auto_136302 ) ) ( not ( = ?auto_136300 ?auto_136301 ) ) ( not ( = ?auto_136303 ?auto_136302 ) ) ( not ( = ?auto_136303 ?auto_136301 ) ) ( not ( = ?auto_136302 ?auto_136301 ) ) ( ON ?auto_136302 ?auto_136303 ) ( CLEAR ?auto_136302 ) ( HOLDING ?auto_136301 ) ( CLEAR ?auto_136305 ) ( ON-TABLE ?auto_136306 ) ( ON ?auto_136307 ?auto_136306 ) ( ON ?auto_136304 ?auto_136307 ) ( ON ?auto_136305 ?auto_136304 ) ( not ( = ?auto_136306 ?auto_136307 ) ) ( not ( = ?auto_136306 ?auto_136304 ) ) ( not ( = ?auto_136306 ?auto_136305 ) ) ( not ( = ?auto_136306 ?auto_136301 ) ) ( not ( = ?auto_136307 ?auto_136304 ) ) ( not ( = ?auto_136307 ?auto_136305 ) ) ( not ( = ?auto_136307 ?auto_136301 ) ) ( not ( = ?auto_136304 ?auto_136305 ) ) ( not ( = ?auto_136304 ?auto_136301 ) ) ( not ( = ?auto_136305 ?auto_136301 ) ) ( not ( = ?auto_136299 ?auto_136305 ) ) ( not ( = ?auto_136299 ?auto_136306 ) ) ( not ( = ?auto_136299 ?auto_136307 ) ) ( not ( = ?auto_136299 ?auto_136304 ) ) ( not ( = ?auto_136300 ?auto_136305 ) ) ( not ( = ?auto_136300 ?auto_136306 ) ) ( not ( = ?auto_136300 ?auto_136307 ) ) ( not ( = ?auto_136300 ?auto_136304 ) ) ( not ( = ?auto_136303 ?auto_136305 ) ) ( not ( = ?auto_136303 ?auto_136306 ) ) ( not ( = ?auto_136303 ?auto_136307 ) ) ( not ( = ?auto_136303 ?auto_136304 ) ) ( not ( = ?auto_136302 ?auto_136305 ) ) ( not ( = ?auto_136302 ?auto_136306 ) ) ( not ( = ?auto_136302 ?auto_136307 ) ) ( not ( = ?auto_136302 ?auto_136304 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_136306 ?auto_136307 ?auto_136304 ?auto_136305 ?auto_136301 )
      ( MAKE-2PILE ?auto_136299 ?auto_136300 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_136308 - BLOCK
      ?auto_136309 - BLOCK
    )
    :vars
    (
      ?auto_136312 - BLOCK
      ?auto_136314 - BLOCK
      ?auto_136311 - BLOCK
      ?auto_136310 - BLOCK
      ?auto_136316 - BLOCK
      ?auto_136313 - BLOCK
      ?auto_136315 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_136312 ?auto_136309 ) ( ON-TABLE ?auto_136308 ) ( ON ?auto_136309 ?auto_136308 ) ( not ( = ?auto_136308 ?auto_136309 ) ) ( not ( = ?auto_136308 ?auto_136312 ) ) ( not ( = ?auto_136309 ?auto_136312 ) ) ( not ( = ?auto_136308 ?auto_136314 ) ) ( not ( = ?auto_136308 ?auto_136311 ) ) ( not ( = ?auto_136309 ?auto_136314 ) ) ( not ( = ?auto_136309 ?auto_136311 ) ) ( not ( = ?auto_136312 ?auto_136314 ) ) ( not ( = ?auto_136312 ?auto_136311 ) ) ( not ( = ?auto_136314 ?auto_136311 ) ) ( ON ?auto_136314 ?auto_136312 ) ( CLEAR ?auto_136310 ) ( ON-TABLE ?auto_136316 ) ( ON ?auto_136313 ?auto_136316 ) ( ON ?auto_136315 ?auto_136313 ) ( ON ?auto_136310 ?auto_136315 ) ( not ( = ?auto_136316 ?auto_136313 ) ) ( not ( = ?auto_136316 ?auto_136315 ) ) ( not ( = ?auto_136316 ?auto_136310 ) ) ( not ( = ?auto_136316 ?auto_136311 ) ) ( not ( = ?auto_136313 ?auto_136315 ) ) ( not ( = ?auto_136313 ?auto_136310 ) ) ( not ( = ?auto_136313 ?auto_136311 ) ) ( not ( = ?auto_136315 ?auto_136310 ) ) ( not ( = ?auto_136315 ?auto_136311 ) ) ( not ( = ?auto_136310 ?auto_136311 ) ) ( not ( = ?auto_136308 ?auto_136310 ) ) ( not ( = ?auto_136308 ?auto_136316 ) ) ( not ( = ?auto_136308 ?auto_136313 ) ) ( not ( = ?auto_136308 ?auto_136315 ) ) ( not ( = ?auto_136309 ?auto_136310 ) ) ( not ( = ?auto_136309 ?auto_136316 ) ) ( not ( = ?auto_136309 ?auto_136313 ) ) ( not ( = ?auto_136309 ?auto_136315 ) ) ( not ( = ?auto_136312 ?auto_136310 ) ) ( not ( = ?auto_136312 ?auto_136316 ) ) ( not ( = ?auto_136312 ?auto_136313 ) ) ( not ( = ?auto_136312 ?auto_136315 ) ) ( not ( = ?auto_136314 ?auto_136310 ) ) ( not ( = ?auto_136314 ?auto_136316 ) ) ( not ( = ?auto_136314 ?auto_136313 ) ) ( not ( = ?auto_136314 ?auto_136315 ) ) ( ON ?auto_136311 ?auto_136314 ) ( CLEAR ?auto_136311 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_136308 ?auto_136309 ?auto_136312 ?auto_136314 )
      ( MAKE-2PILE ?auto_136308 ?auto_136309 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_136317 - BLOCK
      ?auto_136318 - BLOCK
    )
    :vars
    (
      ?auto_136321 - BLOCK
      ?auto_136323 - BLOCK
      ?auto_136319 - BLOCK
      ?auto_136320 - BLOCK
      ?auto_136322 - BLOCK
      ?auto_136324 - BLOCK
      ?auto_136325 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_136321 ?auto_136318 ) ( ON-TABLE ?auto_136317 ) ( ON ?auto_136318 ?auto_136317 ) ( not ( = ?auto_136317 ?auto_136318 ) ) ( not ( = ?auto_136317 ?auto_136321 ) ) ( not ( = ?auto_136318 ?auto_136321 ) ) ( not ( = ?auto_136317 ?auto_136323 ) ) ( not ( = ?auto_136317 ?auto_136319 ) ) ( not ( = ?auto_136318 ?auto_136323 ) ) ( not ( = ?auto_136318 ?auto_136319 ) ) ( not ( = ?auto_136321 ?auto_136323 ) ) ( not ( = ?auto_136321 ?auto_136319 ) ) ( not ( = ?auto_136323 ?auto_136319 ) ) ( ON ?auto_136323 ?auto_136321 ) ( ON-TABLE ?auto_136320 ) ( ON ?auto_136322 ?auto_136320 ) ( ON ?auto_136324 ?auto_136322 ) ( not ( = ?auto_136320 ?auto_136322 ) ) ( not ( = ?auto_136320 ?auto_136324 ) ) ( not ( = ?auto_136320 ?auto_136325 ) ) ( not ( = ?auto_136320 ?auto_136319 ) ) ( not ( = ?auto_136322 ?auto_136324 ) ) ( not ( = ?auto_136322 ?auto_136325 ) ) ( not ( = ?auto_136322 ?auto_136319 ) ) ( not ( = ?auto_136324 ?auto_136325 ) ) ( not ( = ?auto_136324 ?auto_136319 ) ) ( not ( = ?auto_136325 ?auto_136319 ) ) ( not ( = ?auto_136317 ?auto_136325 ) ) ( not ( = ?auto_136317 ?auto_136320 ) ) ( not ( = ?auto_136317 ?auto_136322 ) ) ( not ( = ?auto_136317 ?auto_136324 ) ) ( not ( = ?auto_136318 ?auto_136325 ) ) ( not ( = ?auto_136318 ?auto_136320 ) ) ( not ( = ?auto_136318 ?auto_136322 ) ) ( not ( = ?auto_136318 ?auto_136324 ) ) ( not ( = ?auto_136321 ?auto_136325 ) ) ( not ( = ?auto_136321 ?auto_136320 ) ) ( not ( = ?auto_136321 ?auto_136322 ) ) ( not ( = ?auto_136321 ?auto_136324 ) ) ( not ( = ?auto_136323 ?auto_136325 ) ) ( not ( = ?auto_136323 ?auto_136320 ) ) ( not ( = ?auto_136323 ?auto_136322 ) ) ( not ( = ?auto_136323 ?auto_136324 ) ) ( ON ?auto_136319 ?auto_136323 ) ( CLEAR ?auto_136319 ) ( HOLDING ?auto_136325 ) ( CLEAR ?auto_136324 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_136320 ?auto_136322 ?auto_136324 ?auto_136325 )
      ( MAKE-2PILE ?auto_136317 ?auto_136318 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_136326 - BLOCK
      ?auto_136327 - BLOCK
    )
    :vars
    (
      ?auto_136328 - BLOCK
      ?auto_136334 - BLOCK
      ?auto_136330 - BLOCK
      ?auto_136331 - BLOCK
      ?auto_136329 - BLOCK
      ?auto_136332 - BLOCK
      ?auto_136333 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_136328 ?auto_136327 ) ( ON-TABLE ?auto_136326 ) ( ON ?auto_136327 ?auto_136326 ) ( not ( = ?auto_136326 ?auto_136327 ) ) ( not ( = ?auto_136326 ?auto_136328 ) ) ( not ( = ?auto_136327 ?auto_136328 ) ) ( not ( = ?auto_136326 ?auto_136334 ) ) ( not ( = ?auto_136326 ?auto_136330 ) ) ( not ( = ?auto_136327 ?auto_136334 ) ) ( not ( = ?auto_136327 ?auto_136330 ) ) ( not ( = ?auto_136328 ?auto_136334 ) ) ( not ( = ?auto_136328 ?auto_136330 ) ) ( not ( = ?auto_136334 ?auto_136330 ) ) ( ON ?auto_136334 ?auto_136328 ) ( ON-TABLE ?auto_136331 ) ( ON ?auto_136329 ?auto_136331 ) ( ON ?auto_136332 ?auto_136329 ) ( not ( = ?auto_136331 ?auto_136329 ) ) ( not ( = ?auto_136331 ?auto_136332 ) ) ( not ( = ?auto_136331 ?auto_136333 ) ) ( not ( = ?auto_136331 ?auto_136330 ) ) ( not ( = ?auto_136329 ?auto_136332 ) ) ( not ( = ?auto_136329 ?auto_136333 ) ) ( not ( = ?auto_136329 ?auto_136330 ) ) ( not ( = ?auto_136332 ?auto_136333 ) ) ( not ( = ?auto_136332 ?auto_136330 ) ) ( not ( = ?auto_136333 ?auto_136330 ) ) ( not ( = ?auto_136326 ?auto_136333 ) ) ( not ( = ?auto_136326 ?auto_136331 ) ) ( not ( = ?auto_136326 ?auto_136329 ) ) ( not ( = ?auto_136326 ?auto_136332 ) ) ( not ( = ?auto_136327 ?auto_136333 ) ) ( not ( = ?auto_136327 ?auto_136331 ) ) ( not ( = ?auto_136327 ?auto_136329 ) ) ( not ( = ?auto_136327 ?auto_136332 ) ) ( not ( = ?auto_136328 ?auto_136333 ) ) ( not ( = ?auto_136328 ?auto_136331 ) ) ( not ( = ?auto_136328 ?auto_136329 ) ) ( not ( = ?auto_136328 ?auto_136332 ) ) ( not ( = ?auto_136334 ?auto_136333 ) ) ( not ( = ?auto_136334 ?auto_136331 ) ) ( not ( = ?auto_136334 ?auto_136329 ) ) ( not ( = ?auto_136334 ?auto_136332 ) ) ( ON ?auto_136330 ?auto_136334 ) ( CLEAR ?auto_136332 ) ( ON ?auto_136333 ?auto_136330 ) ( CLEAR ?auto_136333 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_136326 ?auto_136327 ?auto_136328 ?auto_136334 ?auto_136330 )
      ( MAKE-2PILE ?auto_136326 ?auto_136327 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_136335 - BLOCK
      ?auto_136336 - BLOCK
    )
    :vars
    (
      ?auto_136339 - BLOCK
      ?auto_136343 - BLOCK
      ?auto_136337 - BLOCK
      ?auto_136340 - BLOCK
      ?auto_136341 - BLOCK
      ?auto_136342 - BLOCK
      ?auto_136338 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_136339 ?auto_136336 ) ( ON-TABLE ?auto_136335 ) ( ON ?auto_136336 ?auto_136335 ) ( not ( = ?auto_136335 ?auto_136336 ) ) ( not ( = ?auto_136335 ?auto_136339 ) ) ( not ( = ?auto_136336 ?auto_136339 ) ) ( not ( = ?auto_136335 ?auto_136343 ) ) ( not ( = ?auto_136335 ?auto_136337 ) ) ( not ( = ?auto_136336 ?auto_136343 ) ) ( not ( = ?auto_136336 ?auto_136337 ) ) ( not ( = ?auto_136339 ?auto_136343 ) ) ( not ( = ?auto_136339 ?auto_136337 ) ) ( not ( = ?auto_136343 ?auto_136337 ) ) ( ON ?auto_136343 ?auto_136339 ) ( ON-TABLE ?auto_136340 ) ( ON ?auto_136341 ?auto_136340 ) ( not ( = ?auto_136340 ?auto_136341 ) ) ( not ( = ?auto_136340 ?auto_136342 ) ) ( not ( = ?auto_136340 ?auto_136338 ) ) ( not ( = ?auto_136340 ?auto_136337 ) ) ( not ( = ?auto_136341 ?auto_136342 ) ) ( not ( = ?auto_136341 ?auto_136338 ) ) ( not ( = ?auto_136341 ?auto_136337 ) ) ( not ( = ?auto_136342 ?auto_136338 ) ) ( not ( = ?auto_136342 ?auto_136337 ) ) ( not ( = ?auto_136338 ?auto_136337 ) ) ( not ( = ?auto_136335 ?auto_136338 ) ) ( not ( = ?auto_136335 ?auto_136340 ) ) ( not ( = ?auto_136335 ?auto_136341 ) ) ( not ( = ?auto_136335 ?auto_136342 ) ) ( not ( = ?auto_136336 ?auto_136338 ) ) ( not ( = ?auto_136336 ?auto_136340 ) ) ( not ( = ?auto_136336 ?auto_136341 ) ) ( not ( = ?auto_136336 ?auto_136342 ) ) ( not ( = ?auto_136339 ?auto_136338 ) ) ( not ( = ?auto_136339 ?auto_136340 ) ) ( not ( = ?auto_136339 ?auto_136341 ) ) ( not ( = ?auto_136339 ?auto_136342 ) ) ( not ( = ?auto_136343 ?auto_136338 ) ) ( not ( = ?auto_136343 ?auto_136340 ) ) ( not ( = ?auto_136343 ?auto_136341 ) ) ( not ( = ?auto_136343 ?auto_136342 ) ) ( ON ?auto_136337 ?auto_136343 ) ( ON ?auto_136338 ?auto_136337 ) ( CLEAR ?auto_136338 ) ( HOLDING ?auto_136342 ) ( CLEAR ?auto_136341 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_136340 ?auto_136341 ?auto_136342 )
      ( MAKE-2PILE ?auto_136335 ?auto_136336 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_136344 - BLOCK
      ?auto_136345 - BLOCK
    )
    :vars
    (
      ?auto_136350 - BLOCK
      ?auto_136351 - BLOCK
      ?auto_136347 - BLOCK
      ?auto_136348 - BLOCK
      ?auto_136349 - BLOCK
      ?auto_136346 - BLOCK
      ?auto_136352 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_136350 ?auto_136345 ) ( ON-TABLE ?auto_136344 ) ( ON ?auto_136345 ?auto_136344 ) ( not ( = ?auto_136344 ?auto_136345 ) ) ( not ( = ?auto_136344 ?auto_136350 ) ) ( not ( = ?auto_136345 ?auto_136350 ) ) ( not ( = ?auto_136344 ?auto_136351 ) ) ( not ( = ?auto_136344 ?auto_136347 ) ) ( not ( = ?auto_136345 ?auto_136351 ) ) ( not ( = ?auto_136345 ?auto_136347 ) ) ( not ( = ?auto_136350 ?auto_136351 ) ) ( not ( = ?auto_136350 ?auto_136347 ) ) ( not ( = ?auto_136351 ?auto_136347 ) ) ( ON ?auto_136351 ?auto_136350 ) ( ON-TABLE ?auto_136348 ) ( ON ?auto_136349 ?auto_136348 ) ( not ( = ?auto_136348 ?auto_136349 ) ) ( not ( = ?auto_136348 ?auto_136346 ) ) ( not ( = ?auto_136348 ?auto_136352 ) ) ( not ( = ?auto_136348 ?auto_136347 ) ) ( not ( = ?auto_136349 ?auto_136346 ) ) ( not ( = ?auto_136349 ?auto_136352 ) ) ( not ( = ?auto_136349 ?auto_136347 ) ) ( not ( = ?auto_136346 ?auto_136352 ) ) ( not ( = ?auto_136346 ?auto_136347 ) ) ( not ( = ?auto_136352 ?auto_136347 ) ) ( not ( = ?auto_136344 ?auto_136352 ) ) ( not ( = ?auto_136344 ?auto_136348 ) ) ( not ( = ?auto_136344 ?auto_136349 ) ) ( not ( = ?auto_136344 ?auto_136346 ) ) ( not ( = ?auto_136345 ?auto_136352 ) ) ( not ( = ?auto_136345 ?auto_136348 ) ) ( not ( = ?auto_136345 ?auto_136349 ) ) ( not ( = ?auto_136345 ?auto_136346 ) ) ( not ( = ?auto_136350 ?auto_136352 ) ) ( not ( = ?auto_136350 ?auto_136348 ) ) ( not ( = ?auto_136350 ?auto_136349 ) ) ( not ( = ?auto_136350 ?auto_136346 ) ) ( not ( = ?auto_136351 ?auto_136352 ) ) ( not ( = ?auto_136351 ?auto_136348 ) ) ( not ( = ?auto_136351 ?auto_136349 ) ) ( not ( = ?auto_136351 ?auto_136346 ) ) ( ON ?auto_136347 ?auto_136351 ) ( ON ?auto_136352 ?auto_136347 ) ( CLEAR ?auto_136349 ) ( ON ?auto_136346 ?auto_136352 ) ( CLEAR ?auto_136346 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_136344 ?auto_136345 ?auto_136350 ?auto_136351 ?auto_136347 ?auto_136352 )
      ( MAKE-2PILE ?auto_136344 ?auto_136345 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_136353 - BLOCK
      ?auto_136354 - BLOCK
    )
    :vars
    (
      ?auto_136361 - BLOCK
      ?auto_136357 - BLOCK
      ?auto_136356 - BLOCK
      ?auto_136358 - BLOCK
      ?auto_136359 - BLOCK
      ?auto_136360 - BLOCK
      ?auto_136355 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_136361 ?auto_136354 ) ( ON-TABLE ?auto_136353 ) ( ON ?auto_136354 ?auto_136353 ) ( not ( = ?auto_136353 ?auto_136354 ) ) ( not ( = ?auto_136353 ?auto_136361 ) ) ( not ( = ?auto_136354 ?auto_136361 ) ) ( not ( = ?auto_136353 ?auto_136357 ) ) ( not ( = ?auto_136353 ?auto_136356 ) ) ( not ( = ?auto_136354 ?auto_136357 ) ) ( not ( = ?auto_136354 ?auto_136356 ) ) ( not ( = ?auto_136361 ?auto_136357 ) ) ( not ( = ?auto_136361 ?auto_136356 ) ) ( not ( = ?auto_136357 ?auto_136356 ) ) ( ON ?auto_136357 ?auto_136361 ) ( ON-TABLE ?auto_136358 ) ( not ( = ?auto_136358 ?auto_136359 ) ) ( not ( = ?auto_136358 ?auto_136360 ) ) ( not ( = ?auto_136358 ?auto_136355 ) ) ( not ( = ?auto_136358 ?auto_136356 ) ) ( not ( = ?auto_136359 ?auto_136360 ) ) ( not ( = ?auto_136359 ?auto_136355 ) ) ( not ( = ?auto_136359 ?auto_136356 ) ) ( not ( = ?auto_136360 ?auto_136355 ) ) ( not ( = ?auto_136360 ?auto_136356 ) ) ( not ( = ?auto_136355 ?auto_136356 ) ) ( not ( = ?auto_136353 ?auto_136355 ) ) ( not ( = ?auto_136353 ?auto_136358 ) ) ( not ( = ?auto_136353 ?auto_136359 ) ) ( not ( = ?auto_136353 ?auto_136360 ) ) ( not ( = ?auto_136354 ?auto_136355 ) ) ( not ( = ?auto_136354 ?auto_136358 ) ) ( not ( = ?auto_136354 ?auto_136359 ) ) ( not ( = ?auto_136354 ?auto_136360 ) ) ( not ( = ?auto_136361 ?auto_136355 ) ) ( not ( = ?auto_136361 ?auto_136358 ) ) ( not ( = ?auto_136361 ?auto_136359 ) ) ( not ( = ?auto_136361 ?auto_136360 ) ) ( not ( = ?auto_136357 ?auto_136355 ) ) ( not ( = ?auto_136357 ?auto_136358 ) ) ( not ( = ?auto_136357 ?auto_136359 ) ) ( not ( = ?auto_136357 ?auto_136360 ) ) ( ON ?auto_136356 ?auto_136357 ) ( ON ?auto_136355 ?auto_136356 ) ( ON ?auto_136360 ?auto_136355 ) ( CLEAR ?auto_136360 ) ( HOLDING ?auto_136359 ) ( CLEAR ?auto_136358 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_136358 ?auto_136359 )
      ( MAKE-2PILE ?auto_136353 ?auto_136354 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_138380 - BLOCK
      ?auto_138381 - BLOCK
    )
    :vars
    (
      ?auto_138385 - BLOCK
      ?auto_138384 - BLOCK
      ?auto_138383 - BLOCK
      ?auto_138386 - BLOCK
      ?auto_138387 - BLOCK
      ?auto_138382 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_138385 ?auto_138381 ) ( ON-TABLE ?auto_138380 ) ( ON ?auto_138381 ?auto_138380 ) ( not ( = ?auto_138380 ?auto_138381 ) ) ( not ( = ?auto_138380 ?auto_138385 ) ) ( not ( = ?auto_138381 ?auto_138385 ) ) ( not ( = ?auto_138380 ?auto_138384 ) ) ( not ( = ?auto_138380 ?auto_138383 ) ) ( not ( = ?auto_138381 ?auto_138384 ) ) ( not ( = ?auto_138381 ?auto_138383 ) ) ( not ( = ?auto_138385 ?auto_138384 ) ) ( not ( = ?auto_138385 ?auto_138383 ) ) ( not ( = ?auto_138384 ?auto_138383 ) ) ( ON ?auto_138384 ?auto_138385 ) ( not ( = ?auto_138386 ?auto_138387 ) ) ( not ( = ?auto_138386 ?auto_138382 ) ) ( not ( = ?auto_138386 ?auto_138383 ) ) ( not ( = ?auto_138387 ?auto_138382 ) ) ( not ( = ?auto_138387 ?auto_138383 ) ) ( not ( = ?auto_138382 ?auto_138383 ) ) ( not ( = ?auto_138380 ?auto_138382 ) ) ( not ( = ?auto_138380 ?auto_138386 ) ) ( not ( = ?auto_138380 ?auto_138387 ) ) ( not ( = ?auto_138381 ?auto_138382 ) ) ( not ( = ?auto_138381 ?auto_138386 ) ) ( not ( = ?auto_138381 ?auto_138387 ) ) ( not ( = ?auto_138385 ?auto_138382 ) ) ( not ( = ?auto_138385 ?auto_138386 ) ) ( not ( = ?auto_138385 ?auto_138387 ) ) ( not ( = ?auto_138384 ?auto_138382 ) ) ( not ( = ?auto_138384 ?auto_138386 ) ) ( not ( = ?auto_138384 ?auto_138387 ) ) ( ON ?auto_138383 ?auto_138384 ) ( ON ?auto_138382 ?auto_138383 ) ( ON ?auto_138387 ?auto_138382 ) ( ON ?auto_138386 ?auto_138387 ) ( CLEAR ?auto_138386 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_138380 ?auto_138381 ?auto_138385 ?auto_138384 ?auto_138383 ?auto_138382 ?auto_138387 )
      ( MAKE-2PILE ?auto_138380 ?auto_138381 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_136371 - BLOCK
      ?auto_136372 - BLOCK
    )
    :vars
    (
      ?auto_136377 - BLOCK
      ?auto_136378 - BLOCK
      ?auto_136379 - BLOCK
      ?auto_136375 - BLOCK
      ?auto_136376 - BLOCK
      ?auto_136373 - BLOCK
      ?auto_136374 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_136377 ?auto_136372 ) ( ON-TABLE ?auto_136371 ) ( ON ?auto_136372 ?auto_136371 ) ( not ( = ?auto_136371 ?auto_136372 ) ) ( not ( = ?auto_136371 ?auto_136377 ) ) ( not ( = ?auto_136372 ?auto_136377 ) ) ( not ( = ?auto_136371 ?auto_136378 ) ) ( not ( = ?auto_136371 ?auto_136379 ) ) ( not ( = ?auto_136372 ?auto_136378 ) ) ( not ( = ?auto_136372 ?auto_136379 ) ) ( not ( = ?auto_136377 ?auto_136378 ) ) ( not ( = ?auto_136377 ?auto_136379 ) ) ( not ( = ?auto_136378 ?auto_136379 ) ) ( ON ?auto_136378 ?auto_136377 ) ( not ( = ?auto_136375 ?auto_136376 ) ) ( not ( = ?auto_136375 ?auto_136373 ) ) ( not ( = ?auto_136375 ?auto_136374 ) ) ( not ( = ?auto_136375 ?auto_136379 ) ) ( not ( = ?auto_136376 ?auto_136373 ) ) ( not ( = ?auto_136376 ?auto_136374 ) ) ( not ( = ?auto_136376 ?auto_136379 ) ) ( not ( = ?auto_136373 ?auto_136374 ) ) ( not ( = ?auto_136373 ?auto_136379 ) ) ( not ( = ?auto_136374 ?auto_136379 ) ) ( not ( = ?auto_136371 ?auto_136374 ) ) ( not ( = ?auto_136371 ?auto_136375 ) ) ( not ( = ?auto_136371 ?auto_136376 ) ) ( not ( = ?auto_136371 ?auto_136373 ) ) ( not ( = ?auto_136372 ?auto_136374 ) ) ( not ( = ?auto_136372 ?auto_136375 ) ) ( not ( = ?auto_136372 ?auto_136376 ) ) ( not ( = ?auto_136372 ?auto_136373 ) ) ( not ( = ?auto_136377 ?auto_136374 ) ) ( not ( = ?auto_136377 ?auto_136375 ) ) ( not ( = ?auto_136377 ?auto_136376 ) ) ( not ( = ?auto_136377 ?auto_136373 ) ) ( not ( = ?auto_136378 ?auto_136374 ) ) ( not ( = ?auto_136378 ?auto_136375 ) ) ( not ( = ?auto_136378 ?auto_136376 ) ) ( not ( = ?auto_136378 ?auto_136373 ) ) ( ON ?auto_136379 ?auto_136378 ) ( ON ?auto_136374 ?auto_136379 ) ( ON ?auto_136373 ?auto_136374 ) ( ON ?auto_136376 ?auto_136373 ) ( CLEAR ?auto_136376 ) ( HOLDING ?auto_136375 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_136375 )
      ( MAKE-2PILE ?auto_136371 ?auto_136372 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_136380 - BLOCK
      ?auto_136381 - BLOCK
    )
    :vars
    (
      ?auto_136387 - BLOCK
      ?auto_136385 - BLOCK
      ?auto_136382 - BLOCK
      ?auto_136386 - BLOCK
      ?auto_136383 - BLOCK
      ?auto_136388 - BLOCK
      ?auto_136384 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_136387 ?auto_136381 ) ( ON-TABLE ?auto_136380 ) ( ON ?auto_136381 ?auto_136380 ) ( not ( = ?auto_136380 ?auto_136381 ) ) ( not ( = ?auto_136380 ?auto_136387 ) ) ( not ( = ?auto_136381 ?auto_136387 ) ) ( not ( = ?auto_136380 ?auto_136385 ) ) ( not ( = ?auto_136380 ?auto_136382 ) ) ( not ( = ?auto_136381 ?auto_136385 ) ) ( not ( = ?auto_136381 ?auto_136382 ) ) ( not ( = ?auto_136387 ?auto_136385 ) ) ( not ( = ?auto_136387 ?auto_136382 ) ) ( not ( = ?auto_136385 ?auto_136382 ) ) ( ON ?auto_136385 ?auto_136387 ) ( not ( = ?auto_136386 ?auto_136383 ) ) ( not ( = ?auto_136386 ?auto_136388 ) ) ( not ( = ?auto_136386 ?auto_136384 ) ) ( not ( = ?auto_136386 ?auto_136382 ) ) ( not ( = ?auto_136383 ?auto_136388 ) ) ( not ( = ?auto_136383 ?auto_136384 ) ) ( not ( = ?auto_136383 ?auto_136382 ) ) ( not ( = ?auto_136388 ?auto_136384 ) ) ( not ( = ?auto_136388 ?auto_136382 ) ) ( not ( = ?auto_136384 ?auto_136382 ) ) ( not ( = ?auto_136380 ?auto_136384 ) ) ( not ( = ?auto_136380 ?auto_136386 ) ) ( not ( = ?auto_136380 ?auto_136383 ) ) ( not ( = ?auto_136380 ?auto_136388 ) ) ( not ( = ?auto_136381 ?auto_136384 ) ) ( not ( = ?auto_136381 ?auto_136386 ) ) ( not ( = ?auto_136381 ?auto_136383 ) ) ( not ( = ?auto_136381 ?auto_136388 ) ) ( not ( = ?auto_136387 ?auto_136384 ) ) ( not ( = ?auto_136387 ?auto_136386 ) ) ( not ( = ?auto_136387 ?auto_136383 ) ) ( not ( = ?auto_136387 ?auto_136388 ) ) ( not ( = ?auto_136385 ?auto_136384 ) ) ( not ( = ?auto_136385 ?auto_136386 ) ) ( not ( = ?auto_136385 ?auto_136383 ) ) ( not ( = ?auto_136385 ?auto_136388 ) ) ( ON ?auto_136382 ?auto_136385 ) ( ON ?auto_136384 ?auto_136382 ) ( ON ?auto_136388 ?auto_136384 ) ( ON ?auto_136383 ?auto_136388 ) ( ON ?auto_136386 ?auto_136383 ) ( CLEAR ?auto_136386 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_136380 ?auto_136381 ?auto_136387 ?auto_136385 ?auto_136382 ?auto_136384 ?auto_136388 ?auto_136383 )
      ( MAKE-2PILE ?auto_136380 ?auto_136381 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_136396 - BLOCK
      ?auto_136397 - BLOCK
      ?auto_136398 - BLOCK
      ?auto_136399 - BLOCK
      ?auto_136400 - BLOCK
      ?auto_136401 - BLOCK
      ?auto_136402 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_136402 ) ( CLEAR ?auto_136401 ) ( ON-TABLE ?auto_136396 ) ( ON ?auto_136397 ?auto_136396 ) ( ON ?auto_136398 ?auto_136397 ) ( ON ?auto_136399 ?auto_136398 ) ( ON ?auto_136400 ?auto_136399 ) ( ON ?auto_136401 ?auto_136400 ) ( not ( = ?auto_136396 ?auto_136397 ) ) ( not ( = ?auto_136396 ?auto_136398 ) ) ( not ( = ?auto_136396 ?auto_136399 ) ) ( not ( = ?auto_136396 ?auto_136400 ) ) ( not ( = ?auto_136396 ?auto_136401 ) ) ( not ( = ?auto_136396 ?auto_136402 ) ) ( not ( = ?auto_136397 ?auto_136398 ) ) ( not ( = ?auto_136397 ?auto_136399 ) ) ( not ( = ?auto_136397 ?auto_136400 ) ) ( not ( = ?auto_136397 ?auto_136401 ) ) ( not ( = ?auto_136397 ?auto_136402 ) ) ( not ( = ?auto_136398 ?auto_136399 ) ) ( not ( = ?auto_136398 ?auto_136400 ) ) ( not ( = ?auto_136398 ?auto_136401 ) ) ( not ( = ?auto_136398 ?auto_136402 ) ) ( not ( = ?auto_136399 ?auto_136400 ) ) ( not ( = ?auto_136399 ?auto_136401 ) ) ( not ( = ?auto_136399 ?auto_136402 ) ) ( not ( = ?auto_136400 ?auto_136401 ) ) ( not ( = ?auto_136400 ?auto_136402 ) ) ( not ( = ?auto_136401 ?auto_136402 ) ) )
    :subtasks
    ( ( !STACK ?auto_136402 ?auto_136401 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_136403 - BLOCK
      ?auto_136404 - BLOCK
      ?auto_136405 - BLOCK
      ?auto_136406 - BLOCK
      ?auto_136407 - BLOCK
      ?auto_136408 - BLOCK
      ?auto_136409 - BLOCK
    )
    :vars
    (
      ?auto_136410 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_136408 ) ( ON-TABLE ?auto_136403 ) ( ON ?auto_136404 ?auto_136403 ) ( ON ?auto_136405 ?auto_136404 ) ( ON ?auto_136406 ?auto_136405 ) ( ON ?auto_136407 ?auto_136406 ) ( ON ?auto_136408 ?auto_136407 ) ( not ( = ?auto_136403 ?auto_136404 ) ) ( not ( = ?auto_136403 ?auto_136405 ) ) ( not ( = ?auto_136403 ?auto_136406 ) ) ( not ( = ?auto_136403 ?auto_136407 ) ) ( not ( = ?auto_136403 ?auto_136408 ) ) ( not ( = ?auto_136403 ?auto_136409 ) ) ( not ( = ?auto_136404 ?auto_136405 ) ) ( not ( = ?auto_136404 ?auto_136406 ) ) ( not ( = ?auto_136404 ?auto_136407 ) ) ( not ( = ?auto_136404 ?auto_136408 ) ) ( not ( = ?auto_136404 ?auto_136409 ) ) ( not ( = ?auto_136405 ?auto_136406 ) ) ( not ( = ?auto_136405 ?auto_136407 ) ) ( not ( = ?auto_136405 ?auto_136408 ) ) ( not ( = ?auto_136405 ?auto_136409 ) ) ( not ( = ?auto_136406 ?auto_136407 ) ) ( not ( = ?auto_136406 ?auto_136408 ) ) ( not ( = ?auto_136406 ?auto_136409 ) ) ( not ( = ?auto_136407 ?auto_136408 ) ) ( not ( = ?auto_136407 ?auto_136409 ) ) ( not ( = ?auto_136408 ?auto_136409 ) ) ( ON ?auto_136409 ?auto_136410 ) ( CLEAR ?auto_136409 ) ( HAND-EMPTY ) ( not ( = ?auto_136403 ?auto_136410 ) ) ( not ( = ?auto_136404 ?auto_136410 ) ) ( not ( = ?auto_136405 ?auto_136410 ) ) ( not ( = ?auto_136406 ?auto_136410 ) ) ( not ( = ?auto_136407 ?auto_136410 ) ) ( not ( = ?auto_136408 ?auto_136410 ) ) ( not ( = ?auto_136409 ?auto_136410 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_136409 ?auto_136410 )
      ( MAKE-7PILE ?auto_136403 ?auto_136404 ?auto_136405 ?auto_136406 ?auto_136407 ?auto_136408 ?auto_136409 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_136411 - BLOCK
      ?auto_136412 - BLOCK
      ?auto_136413 - BLOCK
      ?auto_136414 - BLOCK
      ?auto_136415 - BLOCK
      ?auto_136416 - BLOCK
      ?auto_136417 - BLOCK
    )
    :vars
    (
      ?auto_136418 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_136411 ) ( ON ?auto_136412 ?auto_136411 ) ( ON ?auto_136413 ?auto_136412 ) ( ON ?auto_136414 ?auto_136413 ) ( ON ?auto_136415 ?auto_136414 ) ( not ( = ?auto_136411 ?auto_136412 ) ) ( not ( = ?auto_136411 ?auto_136413 ) ) ( not ( = ?auto_136411 ?auto_136414 ) ) ( not ( = ?auto_136411 ?auto_136415 ) ) ( not ( = ?auto_136411 ?auto_136416 ) ) ( not ( = ?auto_136411 ?auto_136417 ) ) ( not ( = ?auto_136412 ?auto_136413 ) ) ( not ( = ?auto_136412 ?auto_136414 ) ) ( not ( = ?auto_136412 ?auto_136415 ) ) ( not ( = ?auto_136412 ?auto_136416 ) ) ( not ( = ?auto_136412 ?auto_136417 ) ) ( not ( = ?auto_136413 ?auto_136414 ) ) ( not ( = ?auto_136413 ?auto_136415 ) ) ( not ( = ?auto_136413 ?auto_136416 ) ) ( not ( = ?auto_136413 ?auto_136417 ) ) ( not ( = ?auto_136414 ?auto_136415 ) ) ( not ( = ?auto_136414 ?auto_136416 ) ) ( not ( = ?auto_136414 ?auto_136417 ) ) ( not ( = ?auto_136415 ?auto_136416 ) ) ( not ( = ?auto_136415 ?auto_136417 ) ) ( not ( = ?auto_136416 ?auto_136417 ) ) ( ON ?auto_136417 ?auto_136418 ) ( CLEAR ?auto_136417 ) ( not ( = ?auto_136411 ?auto_136418 ) ) ( not ( = ?auto_136412 ?auto_136418 ) ) ( not ( = ?auto_136413 ?auto_136418 ) ) ( not ( = ?auto_136414 ?auto_136418 ) ) ( not ( = ?auto_136415 ?auto_136418 ) ) ( not ( = ?auto_136416 ?auto_136418 ) ) ( not ( = ?auto_136417 ?auto_136418 ) ) ( HOLDING ?auto_136416 ) ( CLEAR ?auto_136415 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_136411 ?auto_136412 ?auto_136413 ?auto_136414 ?auto_136415 ?auto_136416 )
      ( MAKE-7PILE ?auto_136411 ?auto_136412 ?auto_136413 ?auto_136414 ?auto_136415 ?auto_136416 ?auto_136417 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_136419 - BLOCK
      ?auto_136420 - BLOCK
      ?auto_136421 - BLOCK
      ?auto_136422 - BLOCK
      ?auto_136423 - BLOCK
      ?auto_136424 - BLOCK
      ?auto_136425 - BLOCK
    )
    :vars
    (
      ?auto_136426 - BLOCK
      ?auto_136427 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_136419 ) ( ON ?auto_136420 ?auto_136419 ) ( ON ?auto_136421 ?auto_136420 ) ( ON ?auto_136422 ?auto_136421 ) ( ON ?auto_136423 ?auto_136422 ) ( not ( = ?auto_136419 ?auto_136420 ) ) ( not ( = ?auto_136419 ?auto_136421 ) ) ( not ( = ?auto_136419 ?auto_136422 ) ) ( not ( = ?auto_136419 ?auto_136423 ) ) ( not ( = ?auto_136419 ?auto_136424 ) ) ( not ( = ?auto_136419 ?auto_136425 ) ) ( not ( = ?auto_136420 ?auto_136421 ) ) ( not ( = ?auto_136420 ?auto_136422 ) ) ( not ( = ?auto_136420 ?auto_136423 ) ) ( not ( = ?auto_136420 ?auto_136424 ) ) ( not ( = ?auto_136420 ?auto_136425 ) ) ( not ( = ?auto_136421 ?auto_136422 ) ) ( not ( = ?auto_136421 ?auto_136423 ) ) ( not ( = ?auto_136421 ?auto_136424 ) ) ( not ( = ?auto_136421 ?auto_136425 ) ) ( not ( = ?auto_136422 ?auto_136423 ) ) ( not ( = ?auto_136422 ?auto_136424 ) ) ( not ( = ?auto_136422 ?auto_136425 ) ) ( not ( = ?auto_136423 ?auto_136424 ) ) ( not ( = ?auto_136423 ?auto_136425 ) ) ( not ( = ?auto_136424 ?auto_136425 ) ) ( ON ?auto_136425 ?auto_136426 ) ( not ( = ?auto_136419 ?auto_136426 ) ) ( not ( = ?auto_136420 ?auto_136426 ) ) ( not ( = ?auto_136421 ?auto_136426 ) ) ( not ( = ?auto_136422 ?auto_136426 ) ) ( not ( = ?auto_136423 ?auto_136426 ) ) ( not ( = ?auto_136424 ?auto_136426 ) ) ( not ( = ?auto_136425 ?auto_136426 ) ) ( CLEAR ?auto_136423 ) ( ON ?auto_136424 ?auto_136425 ) ( CLEAR ?auto_136424 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_136427 ) ( ON ?auto_136426 ?auto_136427 ) ( not ( = ?auto_136427 ?auto_136426 ) ) ( not ( = ?auto_136427 ?auto_136425 ) ) ( not ( = ?auto_136427 ?auto_136424 ) ) ( not ( = ?auto_136419 ?auto_136427 ) ) ( not ( = ?auto_136420 ?auto_136427 ) ) ( not ( = ?auto_136421 ?auto_136427 ) ) ( not ( = ?auto_136422 ?auto_136427 ) ) ( not ( = ?auto_136423 ?auto_136427 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_136427 ?auto_136426 ?auto_136425 )
      ( MAKE-7PILE ?auto_136419 ?auto_136420 ?auto_136421 ?auto_136422 ?auto_136423 ?auto_136424 ?auto_136425 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_136428 - BLOCK
      ?auto_136429 - BLOCK
      ?auto_136430 - BLOCK
      ?auto_136431 - BLOCK
      ?auto_136432 - BLOCK
      ?auto_136433 - BLOCK
      ?auto_136434 - BLOCK
    )
    :vars
    (
      ?auto_136436 - BLOCK
      ?auto_136435 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_136428 ) ( ON ?auto_136429 ?auto_136428 ) ( ON ?auto_136430 ?auto_136429 ) ( ON ?auto_136431 ?auto_136430 ) ( not ( = ?auto_136428 ?auto_136429 ) ) ( not ( = ?auto_136428 ?auto_136430 ) ) ( not ( = ?auto_136428 ?auto_136431 ) ) ( not ( = ?auto_136428 ?auto_136432 ) ) ( not ( = ?auto_136428 ?auto_136433 ) ) ( not ( = ?auto_136428 ?auto_136434 ) ) ( not ( = ?auto_136429 ?auto_136430 ) ) ( not ( = ?auto_136429 ?auto_136431 ) ) ( not ( = ?auto_136429 ?auto_136432 ) ) ( not ( = ?auto_136429 ?auto_136433 ) ) ( not ( = ?auto_136429 ?auto_136434 ) ) ( not ( = ?auto_136430 ?auto_136431 ) ) ( not ( = ?auto_136430 ?auto_136432 ) ) ( not ( = ?auto_136430 ?auto_136433 ) ) ( not ( = ?auto_136430 ?auto_136434 ) ) ( not ( = ?auto_136431 ?auto_136432 ) ) ( not ( = ?auto_136431 ?auto_136433 ) ) ( not ( = ?auto_136431 ?auto_136434 ) ) ( not ( = ?auto_136432 ?auto_136433 ) ) ( not ( = ?auto_136432 ?auto_136434 ) ) ( not ( = ?auto_136433 ?auto_136434 ) ) ( ON ?auto_136434 ?auto_136436 ) ( not ( = ?auto_136428 ?auto_136436 ) ) ( not ( = ?auto_136429 ?auto_136436 ) ) ( not ( = ?auto_136430 ?auto_136436 ) ) ( not ( = ?auto_136431 ?auto_136436 ) ) ( not ( = ?auto_136432 ?auto_136436 ) ) ( not ( = ?auto_136433 ?auto_136436 ) ) ( not ( = ?auto_136434 ?auto_136436 ) ) ( ON ?auto_136433 ?auto_136434 ) ( CLEAR ?auto_136433 ) ( ON-TABLE ?auto_136435 ) ( ON ?auto_136436 ?auto_136435 ) ( not ( = ?auto_136435 ?auto_136436 ) ) ( not ( = ?auto_136435 ?auto_136434 ) ) ( not ( = ?auto_136435 ?auto_136433 ) ) ( not ( = ?auto_136428 ?auto_136435 ) ) ( not ( = ?auto_136429 ?auto_136435 ) ) ( not ( = ?auto_136430 ?auto_136435 ) ) ( not ( = ?auto_136431 ?auto_136435 ) ) ( not ( = ?auto_136432 ?auto_136435 ) ) ( HOLDING ?auto_136432 ) ( CLEAR ?auto_136431 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_136428 ?auto_136429 ?auto_136430 ?auto_136431 ?auto_136432 )
      ( MAKE-7PILE ?auto_136428 ?auto_136429 ?auto_136430 ?auto_136431 ?auto_136432 ?auto_136433 ?auto_136434 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_136437 - BLOCK
      ?auto_136438 - BLOCK
      ?auto_136439 - BLOCK
      ?auto_136440 - BLOCK
      ?auto_136441 - BLOCK
      ?auto_136442 - BLOCK
      ?auto_136443 - BLOCK
    )
    :vars
    (
      ?auto_136444 - BLOCK
      ?auto_136445 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_136437 ) ( ON ?auto_136438 ?auto_136437 ) ( ON ?auto_136439 ?auto_136438 ) ( ON ?auto_136440 ?auto_136439 ) ( not ( = ?auto_136437 ?auto_136438 ) ) ( not ( = ?auto_136437 ?auto_136439 ) ) ( not ( = ?auto_136437 ?auto_136440 ) ) ( not ( = ?auto_136437 ?auto_136441 ) ) ( not ( = ?auto_136437 ?auto_136442 ) ) ( not ( = ?auto_136437 ?auto_136443 ) ) ( not ( = ?auto_136438 ?auto_136439 ) ) ( not ( = ?auto_136438 ?auto_136440 ) ) ( not ( = ?auto_136438 ?auto_136441 ) ) ( not ( = ?auto_136438 ?auto_136442 ) ) ( not ( = ?auto_136438 ?auto_136443 ) ) ( not ( = ?auto_136439 ?auto_136440 ) ) ( not ( = ?auto_136439 ?auto_136441 ) ) ( not ( = ?auto_136439 ?auto_136442 ) ) ( not ( = ?auto_136439 ?auto_136443 ) ) ( not ( = ?auto_136440 ?auto_136441 ) ) ( not ( = ?auto_136440 ?auto_136442 ) ) ( not ( = ?auto_136440 ?auto_136443 ) ) ( not ( = ?auto_136441 ?auto_136442 ) ) ( not ( = ?auto_136441 ?auto_136443 ) ) ( not ( = ?auto_136442 ?auto_136443 ) ) ( ON ?auto_136443 ?auto_136444 ) ( not ( = ?auto_136437 ?auto_136444 ) ) ( not ( = ?auto_136438 ?auto_136444 ) ) ( not ( = ?auto_136439 ?auto_136444 ) ) ( not ( = ?auto_136440 ?auto_136444 ) ) ( not ( = ?auto_136441 ?auto_136444 ) ) ( not ( = ?auto_136442 ?auto_136444 ) ) ( not ( = ?auto_136443 ?auto_136444 ) ) ( ON ?auto_136442 ?auto_136443 ) ( ON-TABLE ?auto_136445 ) ( ON ?auto_136444 ?auto_136445 ) ( not ( = ?auto_136445 ?auto_136444 ) ) ( not ( = ?auto_136445 ?auto_136443 ) ) ( not ( = ?auto_136445 ?auto_136442 ) ) ( not ( = ?auto_136437 ?auto_136445 ) ) ( not ( = ?auto_136438 ?auto_136445 ) ) ( not ( = ?auto_136439 ?auto_136445 ) ) ( not ( = ?auto_136440 ?auto_136445 ) ) ( not ( = ?auto_136441 ?auto_136445 ) ) ( CLEAR ?auto_136440 ) ( ON ?auto_136441 ?auto_136442 ) ( CLEAR ?auto_136441 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_136445 ?auto_136444 ?auto_136443 ?auto_136442 )
      ( MAKE-7PILE ?auto_136437 ?auto_136438 ?auto_136439 ?auto_136440 ?auto_136441 ?auto_136442 ?auto_136443 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_136446 - BLOCK
      ?auto_136447 - BLOCK
      ?auto_136448 - BLOCK
      ?auto_136449 - BLOCK
      ?auto_136450 - BLOCK
      ?auto_136451 - BLOCK
      ?auto_136452 - BLOCK
    )
    :vars
    (
      ?auto_136453 - BLOCK
      ?auto_136454 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_136446 ) ( ON ?auto_136447 ?auto_136446 ) ( ON ?auto_136448 ?auto_136447 ) ( not ( = ?auto_136446 ?auto_136447 ) ) ( not ( = ?auto_136446 ?auto_136448 ) ) ( not ( = ?auto_136446 ?auto_136449 ) ) ( not ( = ?auto_136446 ?auto_136450 ) ) ( not ( = ?auto_136446 ?auto_136451 ) ) ( not ( = ?auto_136446 ?auto_136452 ) ) ( not ( = ?auto_136447 ?auto_136448 ) ) ( not ( = ?auto_136447 ?auto_136449 ) ) ( not ( = ?auto_136447 ?auto_136450 ) ) ( not ( = ?auto_136447 ?auto_136451 ) ) ( not ( = ?auto_136447 ?auto_136452 ) ) ( not ( = ?auto_136448 ?auto_136449 ) ) ( not ( = ?auto_136448 ?auto_136450 ) ) ( not ( = ?auto_136448 ?auto_136451 ) ) ( not ( = ?auto_136448 ?auto_136452 ) ) ( not ( = ?auto_136449 ?auto_136450 ) ) ( not ( = ?auto_136449 ?auto_136451 ) ) ( not ( = ?auto_136449 ?auto_136452 ) ) ( not ( = ?auto_136450 ?auto_136451 ) ) ( not ( = ?auto_136450 ?auto_136452 ) ) ( not ( = ?auto_136451 ?auto_136452 ) ) ( ON ?auto_136452 ?auto_136453 ) ( not ( = ?auto_136446 ?auto_136453 ) ) ( not ( = ?auto_136447 ?auto_136453 ) ) ( not ( = ?auto_136448 ?auto_136453 ) ) ( not ( = ?auto_136449 ?auto_136453 ) ) ( not ( = ?auto_136450 ?auto_136453 ) ) ( not ( = ?auto_136451 ?auto_136453 ) ) ( not ( = ?auto_136452 ?auto_136453 ) ) ( ON ?auto_136451 ?auto_136452 ) ( ON-TABLE ?auto_136454 ) ( ON ?auto_136453 ?auto_136454 ) ( not ( = ?auto_136454 ?auto_136453 ) ) ( not ( = ?auto_136454 ?auto_136452 ) ) ( not ( = ?auto_136454 ?auto_136451 ) ) ( not ( = ?auto_136446 ?auto_136454 ) ) ( not ( = ?auto_136447 ?auto_136454 ) ) ( not ( = ?auto_136448 ?auto_136454 ) ) ( not ( = ?auto_136449 ?auto_136454 ) ) ( not ( = ?auto_136450 ?auto_136454 ) ) ( ON ?auto_136450 ?auto_136451 ) ( CLEAR ?auto_136450 ) ( HOLDING ?auto_136449 ) ( CLEAR ?auto_136448 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_136446 ?auto_136447 ?auto_136448 ?auto_136449 )
      ( MAKE-7PILE ?auto_136446 ?auto_136447 ?auto_136448 ?auto_136449 ?auto_136450 ?auto_136451 ?auto_136452 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_136455 - BLOCK
      ?auto_136456 - BLOCK
      ?auto_136457 - BLOCK
      ?auto_136458 - BLOCK
      ?auto_136459 - BLOCK
      ?auto_136460 - BLOCK
      ?auto_136461 - BLOCK
    )
    :vars
    (
      ?auto_136463 - BLOCK
      ?auto_136462 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_136455 ) ( ON ?auto_136456 ?auto_136455 ) ( ON ?auto_136457 ?auto_136456 ) ( not ( = ?auto_136455 ?auto_136456 ) ) ( not ( = ?auto_136455 ?auto_136457 ) ) ( not ( = ?auto_136455 ?auto_136458 ) ) ( not ( = ?auto_136455 ?auto_136459 ) ) ( not ( = ?auto_136455 ?auto_136460 ) ) ( not ( = ?auto_136455 ?auto_136461 ) ) ( not ( = ?auto_136456 ?auto_136457 ) ) ( not ( = ?auto_136456 ?auto_136458 ) ) ( not ( = ?auto_136456 ?auto_136459 ) ) ( not ( = ?auto_136456 ?auto_136460 ) ) ( not ( = ?auto_136456 ?auto_136461 ) ) ( not ( = ?auto_136457 ?auto_136458 ) ) ( not ( = ?auto_136457 ?auto_136459 ) ) ( not ( = ?auto_136457 ?auto_136460 ) ) ( not ( = ?auto_136457 ?auto_136461 ) ) ( not ( = ?auto_136458 ?auto_136459 ) ) ( not ( = ?auto_136458 ?auto_136460 ) ) ( not ( = ?auto_136458 ?auto_136461 ) ) ( not ( = ?auto_136459 ?auto_136460 ) ) ( not ( = ?auto_136459 ?auto_136461 ) ) ( not ( = ?auto_136460 ?auto_136461 ) ) ( ON ?auto_136461 ?auto_136463 ) ( not ( = ?auto_136455 ?auto_136463 ) ) ( not ( = ?auto_136456 ?auto_136463 ) ) ( not ( = ?auto_136457 ?auto_136463 ) ) ( not ( = ?auto_136458 ?auto_136463 ) ) ( not ( = ?auto_136459 ?auto_136463 ) ) ( not ( = ?auto_136460 ?auto_136463 ) ) ( not ( = ?auto_136461 ?auto_136463 ) ) ( ON ?auto_136460 ?auto_136461 ) ( ON-TABLE ?auto_136462 ) ( ON ?auto_136463 ?auto_136462 ) ( not ( = ?auto_136462 ?auto_136463 ) ) ( not ( = ?auto_136462 ?auto_136461 ) ) ( not ( = ?auto_136462 ?auto_136460 ) ) ( not ( = ?auto_136455 ?auto_136462 ) ) ( not ( = ?auto_136456 ?auto_136462 ) ) ( not ( = ?auto_136457 ?auto_136462 ) ) ( not ( = ?auto_136458 ?auto_136462 ) ) ( not ( = ?auto_136459 ?auto_136462 ) ) ( ON ?auto_136459 ?auto_136460 ) ( CLEAR ?auto_136457 ) ( ON ?auto_136458 ?auto_136459 ) ( CLEAR ?auto_136458 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_136462 ?auto_136463 ?auto_136461 ?auto_136460 ?auto_136459 )
      ( MAKE-7PILE ?auto_136455 ?auto_136456 ?auto_136457 ?auto_136458 ?auto_136459 ?auto_136460 ?auto_136461 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_136464 - BLOCK
      ?auto_136465 - BLOCK
      ?auto_136466 - BLOCK
      ?auto_136467 - BLOCK
      ?auto_136468 - BLOCK
      ?auto_136469 - BLOCK
      ?auto_136470 - BLOCK
    )
    :vars
    (
      ?auto_136471 - BLOCK
      ?auto_136472 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_136464 ) ( ON ?auto_136465 ?auto_136464 ) ( not ( = ?auto_136464 ?auto_136465 ) ) ( not ( = ?auto_136464 ?auto_136466 ) ) ( not ( = ?auto_136464 ?auto_136467 ) ) ( not ( = ?auto_136464 ?auto_136468 ) ) ( not ( = ?auto_136464 ?auto_136469 ) ) ( not ( = ?auto_136464 ?auto_136470 ) ) ( not ( = ?auto_136465 ?auto_136466 ) ) ( not ( = ?auto_136465 ?auto_136467 ) ) ( not ( = ?auto_136465 ?auto_136468 ) ) ( not ( = ?auto_136465 ?auto_136469 ) ) ( not ( = ?auto_136465 ?auto_136470 ) ) ( not ( = ?auto_136466 ?auto_136467 ) ) ( not ( = ?auto_136466 ?auto_136468 ) ) ( not ( = ?auto_136466 ?auto_136469 ) ) ( not ( = ?auto_136466 ?auto_136470 ) ) ( not ( = ?auto_136467 ?auto_136468 ) ) ( not ( = ?auto_136467 ?auto_136469 ) ) ( not ( = ?auto_136467 ?auto_136470 ) ) ( not ( = ?auto_136468 ?auto_136469 ) ) ( not ( = ?auto_136468 ?auto_136470 ) ) ( not ( = ?auto_136469 ?auto_136470 ) ) ( ON ?auto_136470 ?auto_136471 ) ( not ( = ?auto_136464 ?auto_136471 ) ) ( not ( = ?auto_136465 ?auto_136471 ) ) ( not ( = ?auto_136466 ?auto_136471 ) ) ( not ( = ?auto_136467 ?auto_136471 ) ) ( not ( = ?auto_136468 ?auto_136471 ) ) ( not ( = ?auto_136469 ?auto_136471 ) ) ( not ( = ?auto_136470 ?auto_136471 ) ) ( ON ?auto_136469 ?auto_136470 ) ( ON-TABLE ?auto_136472 ) ( ON ?auto_136471 ?auto_136472 ) ( not ( = ?auto_136472 ?auto_136471 ) ) ( not ( = ?auto_136472 ?auto_136470 ) ) ( not ( = ?auto_136472 ?auto_136469 ) ) ( not ( = ?auto_136464 ?auto_136472 ) ) ( not ( = ?auto_136465 ?auto_136472 ) ) ( not ( = ?auto_136466 ?auto_136472 ) ) ( not ( = ?auto_136467 ?auto_136472 ) ) ( not ( = ?auto_136468 ?auto_136472 ) ) ( ON ?auto_136468 ?auto_136469 ) ( ON ?auto_136467 ?auto_136468 ) ( CLEAR ?auto_136467 ) ( HOLDING ?auto_136466 ) ( CLEAR ?auto_136465 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_136464 ?auto_136465 ?auto_136466 )
      ( MAKE-7PILE ?auto_136464 ?auto_136465 ?auto_136466 ?auto_136467 ?auto_136468 ?auto_136469 ?auto_136470 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_136473 - BLOCK
      ?auto_136474 - BLOCK
      ?auto_136475 - BLOCK
      ?auto_136476 - BLOCK
      ?auto_136477 - BLOCK
      ?auto_136478 - BLOCK
      ?auto_136479 - BLOCK
    )
    :vars
    (
      ?auto_136480 - BLOCK
      ?auto_136481 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_136473 ) ( ON ?auto_136474 ?auto_136473 ) ( not ( = ?auto_136473 ?auto_136474 ) ) ( not ( = ?auto_136473 ?auto_136475 ) ) ( not ( = ?auto_136473 ?auto_136476 ) ) ( not ( = ?auto_136473 ?auto_136477 ) ) ( not ( = ?auto_136473 ?auto_136478 ) ) ( not ( = ?auto_136473 ?auto_136479 ) ) ( not ( = ?auto_136474 ?auto_136475 ) ) ( not ( = ?auto_136474 ?auto_136476 ) ) ( not ( = ?auto_136474 ?auto_136477 ) ) ( not ( = ?auto_136474 ?auto_136478 ) ) ( not ( = ?auto_136474 ?auto_136479 ) ) ( not ( = ?auto_136475 ?auto_136476 ) ) ( not ( = ?auto_136475 ?auto_136477 ) ) ( not ( = ?auto_136475 ?auto_136478 ) ) ( not ( = ?auto_136475 ?auto_136479 ) ) ( not ( = ?auto_136476 ?auto_136477 ) ) ( not ( = ?auto_136476 ?auto_136478 ) ) ( not ( = ?auto_136476 ?auto_136479 ) ) ( not ( = ?auto_136477 ?auto_136478 ) ) ( not ( = ?auto_136477 ?auto_136479 ) ) ( not ( = ?auto_136478 ?auto_136479 ) ) ( ON ?auto_136479 ?auto_136480 ) ( not ( = ?auto_136473 ?auto_136480 ) ) ( not ( = ?auto_136474 ?auto_136480 ) ) ( not ( = ?auto_136475 ?auto_136480 ) ) ( not ( = ?auto_136476 ?auto_136480 ) ) ( not ( = ?auto_136477 ?auto_136480 ) ) ( not ( = ?auto_136478 ?auto_136480 ) ) ( not ( = ?auto_136479 ?auto_136480 ) ) ( ON ?auto_136478 ?auto_136479 ) ( ON-TABLE ?auto_136481 ) ( ON ?auto_136480 ?auto_136481 ) ( not ( = ?auto_136481 ?auto_136480 ) ) ( not ( = ?auto_136481 ?auto_136479 ) ) ( not ( = ?auto_136481 ?auto_136478 ) ) ( not ( = ?auto_136473 ?auto_136481 ) ) ( not ( = ?auto_136474 ?auto_136481 ) ) ( not ( = ?auto_136475 ?auto_136481 ) ) ( not ( = ?auto_136476 ?auto_136481 ) ) ( not ( = ?auto_136477 ?auto_136481 ) ) ( ON ?auto_136477 ?auto_136478 ) ( ON ?auto_136476 ?auto_136477 ) ( CLEAR ?auto_136474 ) ( ON ?auto_136475 ?auto_136476 ) ( CLEAR ?auto_136475 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_136481 ?auto_136480 ?auto_136479 ?auto_136478 ?auto_136477 ?auto_136476 )
      ( MAKE-7PILE ?auto_136473 ?auto_136474 ?auto_136475 ?auto_136476 ?auto_136477 ?auto_136478 ?auto_136479 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_136482 - BLOCK
      ?auto_136483 - BLOCK
      ?auto_136484 - BLOCK
      ?auto_136485 - BLOCK
      ?auto_136486 - BLOCK
      ?auto_136487 - BLOCK
      ?auto_136488 - BLOCK
    )
    :vars
    (
      ?auto_136490 - BLOCK
      ?auto_136489 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_136482 ) ( not ( = ?auto_136482 ?auto_136483 ) ) ( not ( = ?auto_136482 ?auto_136484 ) ) ( not ( = ?auto_136482 ?auto_136485 ) ) ( not ( = ?auto_136482 ?auto_136486 ) ) ( not ( = ?auto_136482 ?auto_136487 ) ) ( not ( = ?auto_136482 ?auto_136488 ) ) ( not ( = ?auto_136483 ?auto_136484 ) ) ( not ( = ?auto_136483 ?auto_136485 ) ) ( not ( = ?auto_136483 ?auto_136486 ) ) ( not ( = ?auto_136483 ?auto_136487 ) ) ( not ( = ?auto_136483 ?auto_136488 ) ) ( not ( = ?auto_136484 ?auto_136485 ) ) ( not ( = ?auto_136484 ?auto_136486 ) ) ( not ( = ?auto_136484 ?auto_136487 ) ) ( not ( = ?auto_136484 ?auto_136488 ) ) ( not ( = ?auto_136485 ?auto_136486 ) ) ( not ( = ?auto_136485 ?auto_136487 ) ) ( not ( = ?auto_136485 ?auto_136488 ) ) ( not ( = ?auto_136486 ?auto_136487 ) ) ( not ( = ?auto_136486 ?auto_136488 ) ) ( not ( = ?auto_136487 ?auto_136488 ) ) ( ON ?auto_136488 ?auto_136490 ) ( not ( = ?auto_136482 ?auto_136490 ) ) ( not ( = ?auto_136483 ?auto_136490 ) ) ( not ( = ?auto_136484 ?auto_136490 ) ) ( not ( = ?auto_136485 ?auto_136490 ) ) ( not ( = ?auto_136486 ?auto_136490 ) ) ( not ( = ?auto_136487 ?auto_136490 ) ) ( not ( = ?auto_136488 ?auto_136490 ) ) ( ON ?auto_136487 ?auto_136488 ) ( ON-TABLE ?auto_136489 ) ( ON ?auto_136490 ?auto_136489 ) ( not ( = ?auto_136489 ?auto_136490 ) ) ( not ( = ?auto_136489 ?auto_136488 ) ) ( not ( = ?auto_136489 ?auto_136487 ) ) ( not ( = ?auto_136482 ?auto_136489 ) ) ( not ( = ?auto_136483 ?auto_136489 ) ) ( not ( = ?auto_136484 ?auto_136489 ) ) ( not ( = ?auto_136485 ?auto_136489 ) ) ( not ( = ?auto_136486 ?auto_136489 ) ) ( ON ?auto_136486 ?auto_136487 ) ( ON ?auto_136485 ?auto_136486 ) ( ON ?auto_136484 ?auto_136485 ) ( CLEAR ?auto_136484 ) ( HOLDING ?auto_136483 ) ( CLEAR ?auto_136482 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_136482 ?auto_136483 )
      ( MAKE-7PILE ?auto_136482 ?auto_136483 ?auto_136484 ?auto_136485 ?auto_136486 ?auto_136487 ?auto_136488 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_136491 - BLOCK
      ?auto_136492 - BLOCK
      ?auto_136493 - BLOCK
      ?auto_136494 - BLOCK
      ?auto_136495 - BLOCK
      ?auto_136496 - BLOCK
      ?auto_136497 - BLOCK
    )
    :vars
    (
      ?auto_136499 - BLOCK
      ?auto_136498 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_136491 ) ( not ( = ?auto_136491 ?auto_136492 ) ) ( not ( = ?auto_136491 ?auto_136493 ) ) ( not ( = ?auto_136491 ?auto_136494 ) ) ( not ( = ?auto_136491 ?auto_136495 ) ) ( not ( = ?auto_136491 ?auto_136496 ) ) ( not ( = ?auto_136491 ?auto_136497 ) ) ( not ( = ?auto_136492 ?auto_136493 ) ) ( not ( = ?auto_136492 ?auto_136494 ) ) ( not ( = ?auto_136492 ?auto_136495 ) ) ( not ( = ?auto_136492 ?auto_136496 ) ) ( not ( = ?auto_136492 ?auto_136497 ) ) ( not ( = ?auto_136493 ?auto_136494 ) ) ( not ( = ?auto_136493 ?auto_136495 ) ) ( not ( = ?auto_136493 ?auto_136496 ) ) ( not ( = ?auto_136493 ?auto_136497 ) ) ( not ( = ?auto_136494 ?auto_136495 ) ) ( not ( = ?auto_136494 ?auto_136496 ) ) ( not ( = ?auto_136494 ?auto_136497 ) ) ( not ( = ?auto_136495 ?auto_136496 ) ) ( not ( = ?auto_136495 ?auto_136497 ) ) ( not ( = ?auto_136496 ?auto_136497 ) ) ( ON ?auto_136497 ?auto_136499 ) ( not ( = ?auto_136491 ?auto_136499 ) ) ( not ( = ?auto_136492 ?auto_136499 ) ) ( not ( = ?auto_136493 ?auto_136499 ) ) ( not ( = ?auto_136494 ?auto_136499 ) ) ( not ( = ?auto_136495 ?auto_136499 ) ) ( not ( = ?auto_136496 ?auto_136499 ) ) ( not ( = ?auto_136497 ?auto_136499 ) ) ( ON ?auto_136496 ?auto_136497 ) ( ON-TABLE ?auto_136498 ) ( ON ?auto_136499 ?auto_136498 ) ( not ( = ?auto_136498 ?auto_136499 ) ) ( not ( = ?auto_136498 ?auto_136497 ) ) ( not ( = ?auto_136498 ?auto_136496 ) ) ( not ( = ?auto_136491 ?auto_136498 ) ) ( not ( = ?auto_136492 ?auto_136498 ) ) ( not ( = ?auto_136493 ?auto_136498 ) ) ( not ( = ?auto_136494 ?auto_136498 ) ) ( not ( = ?auto_136495 ?auto_136498 ) ) ( ON ?auto_136495 ?auto_136496 ) ( ON ?auto_136494 ?auto_136495 ) ( ON ?auto_136493 ?auto_136494 ) ( CLEAR ?auto_136491 ) ( ON ?auto_136492 ?auto_136493 ) ( CLEAR ?auto_136492 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_136498 ?auto_136499 ?auto_136497 ?auto_136496 ?auto_136495 ?auto_136494 ?auto_136493 )
      ( MAKE-7PILE ?auto_136491 ?auto_136492 ?auto_136493 ?auto_136494 ?auto_136495 ?auto_136496 ?auto_136497 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_136500 - BLOCK
      ?auto_136501 - BLOCK
      ?auto_136502 - BLOCK
      ?auto_136503 - BLOCK
      ?auto_136504 - BLOCK
      ?auto_136505 - BLOCK
      ?auto_136506 - BLOCK
    )
    :vars
    (
      ?auto_136508 - BLOCK
      ?auto_136507 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_136500 ?auto_136501 ) ) ( not ( = ?auto_136500 ?auto_136502 ) ) ( not ( = ?auto_136500 ?auto_136503 ) ) ( not ( = ?auto_136500 ?auto_136504 ) ) ( not ( = ?auto_136500 ?auto_136505 ) ) ( not ( = ?auto_136500 ?auto_136506 ) ) ( not ( = ?auto_136501 ?auto_136502 ) ) ( not ( = ?auto_136501 ?auto_136503 ) ) ( not ( = ?auto_136501 ?auto_136504 ) ) ( not ( = ?auto_136501 ?auto_136505 ) ) ( not ( = ?auto_136501 ?auto_136506 ) ) ( not ( = ?auto_136502 ?auto_136503 ) ) ( not ( = ?auto_136502 ?auto_136504 ) ) ( not ( = ?auto_136502 ?auto_136505 ) ) ( not ( = ?auto_136502 ?auto_136506 ) ) ( not ( = ?auto_136503 ?auto_136504 ) ) ( not ( = ?auto_136503 ?auto_136505 ) ) ( not ( = ?auto_136503 ?auto_136506 ) ) ( not ( = ?auto_136504 ?auto_136505 ) ) ( not ( = ?auto_136504 ?auto_136506 ) ) ( not ( = ?auto_136505 ?auto_136506 ) ) ( ON ?auto_136506 ?auto_136508 ) ( not ( = ?auto_136500 ?auto_136508 ) ) ( not ( = ?auto_136501 ?auto_136508 ) ) ( not ( = ?auto_136502 ?auto_136508 ) ) ( not ( = ?auto_136503 ?auto_136508 ) ) ( not ( = ?auto_136504 ?auto_136508 ) ) ( not ( = ?auto_136505 ?auto_136508 ) ) ( not ( = ?auto_136506 ?auto_136508 ) ) ( ON ?auto_136505 ?auto_136506 ) ( ON-TABLE ?auto_136507 ) ( ON ?auto_136508 ?auto_136507 ) ( not ( = ?auto_136507 ?auto_136508 ) ) ( not ( = ?auto_136507 ?auto_136506 ) ) ( not ( = ?auto_136507 ?auto_136505 ) ) ( not ( = ?auto_136500 ?auto_136507 ) ) ( not ( = ?auto_136501 ?auto_136507 ) ) ( not ( = ?auto_136502 ?auto_136507 ) ) ( not ( = ?auto_136503 ?auto_136507 ) ) ( not ( = ?auto_136504 ?auto_136507 ) ) ( ON ?auto_136504 ?auto_136505 ) ( ON ?auto_136503 ?auto_136504 ) ( ON ?auto_136502 ?auto_136503 ) ( ON ?auto_136501 ?auto_136502 ) ( CLEAR ?auto_136501 ) ( HOLDING ?auto_136500 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_136500 )
      ( MAKE-7PILE ?auto_136500 ?auto_136501 ?auto_136502 ?auto_136503 ?auto_136504 ?auto_136505 ?auto_136506 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_136509 - BLOCK
      ?auto_136510 - BLOCK
      ?auto_136511 - BLOCK
      ?auto_136512 - BLOCK
      ?auto_136513 - BLOCK
      ?auto_136514 - BLOCK
      ?auto_136515 - BLOCK
    )
    :vars
    (
      ?auto_136517 - BLOCK
      ?auto_136516 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_136509 ?auto_136510 ) ) ( not ( = ?auto_136509 ?auto_136511 ) ) ( not ( = ?auto_136509 ?auto_136512 ) ) ( not ( = ?auto_136509 ?auto_136513 ) ) ( not ( = ?auto_136509 ?auto_136514 ) ) ( not ( = ?auto_136509 ?auto_136515 ) ) ( not ( = ?auto_136510 ?auto_136511 ) ) ( not ( = ?auto_136510 ?auto_136512 ) ) ( not ( = ?auto_136510 ?auto_136513 ) ) ( not ( = ?auto_136510 ?auto_136514 ) ) ( not ( = ?auto_136510 ?auto_136515 ) ) ( not ( = ?auto_136511 ?auto_136512 ) ) ( not ( = ?auto_136511 ?auto_136513 ) ) ( not ( = ?auto_136511 ?auto_136514 ) ) ( not ( = ?auto_136511 ?auto_136515 ) ) ( not ( = ?auto_136512 ?auto_136513 ) ) ( not ( = ?auto_136512 ?auto_136514 ) ) ( not ( = ?auto_136512 ?auto_136515 ) ) ( not ( = ?auto_136513 ?auto_136514 ) ) ( not ( = ?auto_136513 ?auto_136515 ) ) ( not ( = ?auto_136514 ?auto_136515 ) ) ( ON ?auto_136515 ?auto_136517 ) ( not ( = ?auto_136509 ?auto_136517 ) ) ( not ( = ?auto_136510 ?auto_136517 ) ) ( not ( = ?auto_136511 ?auto_136517 ) ) ( not ( = ?auto_136512 ?auto_136517 ) ) ( not ( = ?auto_136513 ?auto_136517 ) ) ( not ( = ?auto_136514 ?auto_136517 ) ) ( not ( = ?auto_136515 ?auto_136517 ) ) ( ON ?auto_136514 ?auto_136515 ) ( ON-TABLE ?auto_136516 ) ( ON ?auto_136517 ?auto_136516 ) ( not ( = ?auto_136516 ?auto_136517 ) ) ( not ( = ?auto_136516 ?auto_136515 ) ) ( not ( = ?auto_136516 ?auto_136514 ) ) ( not ( = ?auto_136509 ?auto_136516 ) ) ( not ( = ?auto_136510 ?auto_136516 ) ) ( not ( = ?auto_136511 ?auto_136516 ) ) ( not ( = ?auto_136512 ?auto_136516 ) ) ( not ( = ?auto_136513 ?auto_136516 ) ) ( ON ?auto_136513 ?auto_136514 ) ( ON ?auto_136512 ?auto_136513 ) ( ON ?auto_136511 ?auto_136512 ) ( ON ?auto_136510 ?auto_136511 ) ( ON ?auto_136509 ?auto_136510 ) ( CLEAR ?auto_136509 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_136516 ?auto_136517 ?auto_136515 ?auto_136514 ?auto_136513 ?auto_136512 ?auto_136511 ?auto_136510 )
      ( MAKE-7PILE ?auto_136509 ?auto_136510 ?auto_136511 ?auto_136512 ?auto_136513 ?auto_136514 ?auto_136515 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_136519 - BLOCK
    )
    :vars
    (
      ?auto_136520 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_136520 ?auto_136519 ) ( CLEAR ?auto_136520 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_136519 ) ( not ( = ?auto_136519 ?auto_136520 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_136520 ?auto_136519 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_136521 - BLOCK
    )
    :vars
    (
      ?auto_136522 - BLOCK
      ?auto_136523 - BLOCK
      ?auto_136524 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_136522 ?auto_136521 ) ( CLEAR ?auto_136522 ) ( ON-TABLE ?auto_136521 ) ( not ( = ?auto_136521 ?auto_136522 ) ) ( HOLDING ?auto_136523 ) ( CLEAR ?auto_136524 ) ( not ( = ?auto_136521 ?auto_136523 ) ) ( not ( = ?auto_136521 ?auto_136524 ) ) ( not ( = ?auto_136522 ?auto_136523 ) ) ( not ( = ?auto_136522 ?auto_136524 ) ) ( not ( = ?auto_136523 ?auto_136524 ) ) )
    :subtasks
    ( ( !STACK ?auto_136523 ?auto_136524 )
      ( MAKE-1PILE ?auto_136521 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_136525 - BLOCK
    )
    :vars
    (
      ?auto_136527 - BLOCK
      ?auto_136528 - BLOCK
      ?auto_136526 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_136527 ?auto_136525 ) ( ON-TABLE ?auto_136525 ) ( not ( = ?auto_136525 ?auto_136527 ) ) ( CLEAR ?auto_136528 ) ( not ( = ?auto_136525 ?auto_136526 ) ) ( not ( = ?auto_136525 ?auto_136528 ) ) ( not ( = ?auto_136527 ?auto_136526 ) ) ( not ( = ?auto_136527 ?auto_136528 ) ) ( not ( = ?auto_136526 ?auto_136528 ) ) ( ON ?auto_136526 ?auto_136527 ) ( CLEAR ?auto_136526 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_136525 ?auto_136527 )
      ( MAKE-1PILE ?auto_136525 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_136529 - BLOCK
    )
    :vars
    (
      ?auto_136532 - BLOCK
      ?auto_136530 - BLOCK
      ?auto_136531 - BLOCK
      ?auto_136534 - BLOCK
      ?auto_136537 - BLOCK
      ?auto_136535 - BLOCK
      ?auto_136536 - BLOCK
      ?auto_136533 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_136532 ?auto_136529 ) ( ON-TABLE ?auto_136529 ) ( not ( = ?auto_136529 ?auto_136532 ) ) ( not ( = ?auto_136529 ?auto_136530 ) ) ( not ( = ?auto_136529 ?auto_136531 ) ) ( not ( = ?auto_136532 ?auto_136530 ) ) ( not ( = ?auto_136532 ?auto_136531 ) ) ( not ( = ?auto_136530 ?auto_136531 ) ) ( ON ?auto_136530 ?auto_136532 ) ( CLEAR ?auto_136530 ) ( HOLDING ?auto_136531 ) ( CLEAR ?auto_136534 ) ( ON-TABLE ?auto_136537 ) ( ON ?auto_136535 ?auto_136537 ) ( ON ?auto_136536 ?auto_136535 ) ( ON ?auto_136533 ?auto_136536 ) ( ON ?auto_136534 ?auto_136533 ) ( not ( = ?auto_136537 ?auto_136535 ) ) ( not ( = ?auto_136537 ?auto_136536 ) ) ( not ( = ?auto_136537 ?auto_136533 ) ) ( not ( = ?auto_136537 ?auto_136534 ) ) ( not ( = ?auto_136537 ?auto_136531 ) ) ( not ( = ?auto_136535 ?auto_136536 ) ) ( not ( = ?auto_136535 ?auto_136533 ) ) ( not ( = ?auto_136535 ?auto_136534 ) ) ( not ( = ?auto_136535 ?auto_136531 ) ) ( not ( = ?auto_136536 ?auto_136533 ) ) ( not ( = ?auto_136536 ?auto_136534 ) ) ( not ( = ?auto_136536 ?auto_136531 ) ) ( not ( = ?auto_136533 ?auto_136534 ) ) ( not ( = ?auto_136533 ?auto_136531 ) ) ( not ( = ?auto_136534 ?auto_136531 ) ) ( not ( = ?auto_136529 ?auto_136534 ) ) ( not ( = ?auto_136529 ?auto_136537 ) ) ( not ( = ?auto_136529 ?auto_136535 ) ) ( not ( = ?auto_136529 ?auto_136536 ) ) ( not ( = ?auto_136529 ?auto_136533 ) ) ( not ( = ?auto_136532 ?auto_136534 ) ) ( not ( = ?auto_136532 ?auto_136537 ) ) ( not ( = ?auto_136532 ?auto_136535 ) ) ( not ( = ?auto_136532 ?auto_136536 ) ) ( not ( = ?auto_136532 ?auto_136533 ) ) ( not ( = ?auto_136530 ?auto_136534 ) ) ( not ( = ?auto_136530 ?auto_136537 ) ) ( not ( = ?auto_136530 ?auto_136535 ) ) ( not ( = ?auto_136530 ?auto_136536 ) ) ( not ( = ?auto_136530 ?auto_136533 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_136537 ?auto_136535 ?auto_136536 ?auto_136533 ?auto_136534 ?auto_136531 )
      ( MAKE-1PILE ?auto_136529 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_136538 - BLOCK
    )
    :vars
    (
      ?auto_136544 - BLOCK
      ?auto_136546 - BLOCK
      ?auto_136541 - BLOCK
      ?auto_136540 - BLOCK
      ?auto_136539 - BLOCK
      ?auto_136542 - BLOCK
      ?auto_136543 - BLOCK
      ?auto_136545 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_136544 ?auto_136538 ) ( ON-TABLE ?auto_136538 ) ( not ( = ?auto_136538 ?auto_136544 ) ) ( not ( = ?auto_136538 ?auto_136546 ) ) ( not ( = ?auto_136538 ?auto_136541 ) ) ( not ( = ?auto_136544 ?auto_136546 ) ) ( not ( = ?auto_136544 ?auto_136541 ) ) ( not ( = ?auto_136546 ?auto_136541 ) ) ( ON ?auto_136546 ?auto_136544 ) ( CLEAR ?auto_136540 ) ( ON-TABLE ?auto_136539 ) ( ON ?auto_136542 ?auto_136539 ) ( ON ?auto_136543 ?auto_136542 ) ( ON ?auto_136545 ?auto_136543 ) ( ON ?auto_136540 ?auto_136545 ) ( not ( = ?auto_136539 ?auto_136542 ) ) ( not ( = ?auto_136539 ?auto_136543 ) ) ( not ( = ?auto_136539 ?auto_136545 ) ) ( not ( = ?auto_136539 ?auto_136540 ) ) ( not ( = ?auto_136539 ?auto_136541 ) ) ( not ( = ?auto_136542 ?auto_136543 ) ) ( not ( = ?auto_136542 ?auto_136545 ) ) ( not ( = ?auto_136542 ?auto_136540 ) ) ( not ( = ?auto_136542 ?auto_136541 ) ) ( not ( = ?auto_136543 ?auto_136545 ) ) ( not ( = ?auto_136543 ?auto_136540 ) ) ( not ( = ?auto_136543 ?auto_136541 ) ) ( not ( = ?auto_136545 ?auto_136540 ) ) ( not ( = ?auto_136545 ?auto_136541 ) ) ( not ( = ?auto_136540 ?auto_136541 ) ) ( not ( = ?auto_136538 ?auto_136540 ) ) ( not ( = ?auto_136538 ?auto_136539 ) ) ( not ( = ?auto_136538 ?auto_136542 ) ) ( not ( = ?auto_136538 ?auto_136543 ) ) ( not ( = ?auto_136538 ?auto_136545 ) ) ( not ( = ?auto_136544 ?auto_136540 ) ) ( not ( = ?auto_136544 ?auto_136539 ) ) ( not ( = ?auto_136544 ?auto_136542 ) ) ( not ( = ?auto_136544 ?auto_136543 ) ) ( not ( = ?auto_136544 ?auto_136545 ) ) ( not ( = ?auto_136546 ?auto_136540 ) ) ( not ( = ?auto_136546 ?auto_136539 ) ) ( not ( = ?auto_136546 ?auto_136542 ) ) ( not ( = ?auto_136546 ?auto_136543 ) ) ( not ( = ?auto_136546 ?auto_136545 ) ) ( ON ?auto_136541 ?auto_136546 ) ( CLEAR ?auto_136541 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_136538 ?auto_136544 ?auto_136546 )
      ( MAKE-1PILE ?auto_136538 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_136547 - BLOCK
    )
    :vars
    (
      ?auto_136550 - BLOCK
      ?auto_136555 - BLOCK
      ?auto_136551 - BLOCK
      ?auto_136552 - BLOCK
      ?auto_136548 - BLOCK
      ?auto_136554 - BLOCK
      ?auto_136553 - BLOCK
      ?auto_136549 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_136550 ?auto_136547 ) ( ON-TABLE ?auto_136547 ) ( not ( = ?auto_136547 ?auto_136550 ) ) ( not ( = ?auto_136547 ?auto_136555 ) ) ( not ( = ?auto_136547 ?auto_136551 ) ) ( not ( = ?auto_136550 ?auto_136555 ) ) ( not ( = ?auto_136550 ?auto_136551 ) ) ( not ( = ?auto_136555 ?auto_136551 ) ) ( ON ?auto_136555 ?auto_136550 ) ( ON-TABLE ?auto_136552 ) ( ON ?auto_136548 ?auto_136552 ) ( ON ?auto_136554 ?auto_136548 ) ( ON ?auto_136553 ?auto_136554 ) ( not ( = ?auto_136552 ?auto_136548 ) ) ( not ( = ?auto_136552 ?auto_136554 ) ) ( not ( = ?auto_136552 ?auto_136553 ) ) ( not ( = ?auto_136552 ?auto_136549 ) ) ( not ( = ?auto_136552 ?auto_136551 ) ) ( not ( = ?auto_136548 ?auto_136554 ) ) ( not ( = ?auto_136548 ?auto_136553 ) ) ( not ( = ?auto_136548 ?auto_136549 ) ) ( not ( = ?auto_136548 ?auto_136551 ) ) ( not ( = ?auto_136554 ?auto_136553 ) ) ( not ( = ?auto_136554 ?auto_136549 ) ) ( not ( = ?auto_136554 ?auto_136551 ) ) ( not ( = ?auto_136553 ?auto_136549 ) ) ( not ( = ?auto_136553 ?auto_136551 ) ) ( not ( = ?auto_136549 ?auto_136551 ) ) ( not ( = ?auto_136547 ?auto_136549 ) ) ( not ( = ?auto_136547 ?auto_136552 ) ) ( not ( = ?auto_136547 ?auto_136548 ) ) ( not ( = ?auto_136547 ?auto_136554 ) ) ( not ( = ?auto_136547 ?auto_136553 ) ) ( not ( = ?auto_136550 ?auto_136549 ) ) ( not ( = ?auto_136550 ?auto_136552 ) ) ( not ( = ?auto_136550 ?auto_136548 ) ) ( not ( = ?auto_136550 ?auto_136554 ) ) ( not ( = ?auto_136550 ?auto_136553 ) ) ( not ( = ?auto_136555 ?auto_136549 ) ) ( not ( = ?auto_136555 ?auto_136552 ) ) ( not ( = ?auto_136555 ?auto_136548 ) ) ( not ( = ?auto_136555 ?auto_136554 ) ) ( not ( = ?auto_136555 ?auto_136553 ) ) ( ON ?auto_136551 ?auto_136555 ) ( CLEAR ?auto_136551 ) ( HOLDING ?auto_136549 ) ( CLEAR ?auto_136553 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_136552 ?auto_136548 ?auto_136554 ?auto_136553 ?auto_136549 )
      ( MAKE-1PILE ?auto_136547 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_136556 - BLOCK
    )
    :vars
    (
      ?auto_136563 - BLOCK
      ?auto_136558 - BLOCK
      ?auto_136559 - BLOCK
      ?auto_136562 - BLOCK
      ?auto_136564 - BLOCK
      ?auto_136560 - BLOCK
      ?auto_136557 - BLOCK
      ?auto_136561 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_136563 ?auto_136556 ) ( ON-TABLE ?auto_136556 ) ( not ( = ?auto_136556 ?auto_136563 ) ) ( not ( = ?auto_136556 ?auto_136558 ) ) ( not ( = ?auto_136556 ?auto_136559 ) ) ( not ( = ?auto_136563 ?auto_136558 ) ) ( not ( = ?auto_136563 ?auto_136559 ) ) ( not ( = ?auto_136558 ?auto_136559 ) ) ( ON ?auto_136558 ?auto_136563 ) ( ON-TABLE ?auto_136562 ) ( ON ?auto_136564 ?auto_136562 ) ( ON ?auto_136560 ?auto_136564 ) ( ON ?auto_136557 ?auto_136560 ) ( not ( = ?auto_136562 ?auto_136564 ) ) ( not ( = ?auto_136562 ?auto_136560 ) ) ( not ( = ?auto_136562 ?auto_136557 ) ) ( not ( = ?auto_136562 ?auto_136561 ) ) ( not ( = ?auto_136562 ?auto_136559 ) ) ( not ( = ?auto_136564 ?auto_136560 ) ) ( not ( = ?auto_136564 ?auto_136557 ) ) ( not ( = ?auto_136564 ?auto_136561 ) ) ( not ( = ?auto_136564 ?auto_136559 ) ) ( not ( = ?auto_136560 ?auto_136557 ) ) ( not ( = ?auto_136560 ?auto_136561 ) ) ( not ( = ?auto_136560 ?auto_136559 ) ) ( not ( = ?auto_136557 ?auto_136561 ) ) ( not ( = ?auto_136557 ?auto_136559 ) ) ( not ( = ?auto_136561 ?auto_136559 ) ) ( not ( = ?auto_136556 ?auto_136561 ) ) ( not ( = ?auto_136556 ?auto_136562 ) ) ( not ( = ?auto_136556 ?auto_136564 ) ) ( not ( = ?auto_136556 ?auto_136560 ) ) ( not ( = ?auto_136556 ?auto_136557 ) ) ( not ( = ?auto_136563 ?auto_136561 ) ) ( not ( = ?auto_136563 ?auto_136562 ) ) ( not ( = ?auto_136563 ?auto_136564 ) ) ( not ( = ?auto_136563 ?auto_136560 ) ) ( not ( = ?auto_136563 ?auto_136557 ) ) ( not ( = ?auto_136558 ?auto_136561 ) ) ( not ( = ?auto_136558 ?auto_136562 ) ) ( not ( = ?auto_136558 ?auto_136564 ) ) ( not ( = ?auto_136558 ?auto_136560 ) ) ( not ( = ?auto_136558 ?auto_136557 ) ) ( ON ?auto_136559 ?auto_136558 ) ( CLEAR ?auto_136557 ) ( ON ?auto_136561 ?auto_136559 ) ( CLEAR ?auto_136561 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_136556 ?auto_136563 ?auto_136558 ?auto_136559 )
      ( MAKE-1PILE ?auto_136556 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_136565 - BLOCK
    )
    :vars
    (
      ?auto_136573 - BLOCK
      ?auto_136571 - BLOCK
      ?auto_136568 - BLOCK
      ?auto_136572 - BLOCK
      ?auto_136567 - BLOCK
      ?auto_136566 - BLOCK
      ?auto_136569 - BLOCK
      ?auto_136570 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_136573 ?auto_136565 ) ( ON-TABLE ?auto_136565 ) ( not ( = ?auto_136565 ?auto_136573 ) ) ( not ( = ?auto_136565 ?auto_136571 ) ) ( not ( = ?auto_136565 ?auto_136568 ) ) ( not ( = ?auto_136573 ?auto_136571 ) ) ( not ( = ?auto_136573 ?auto_136568 ) ) ( not ( = ?auto_136571 ?auto_136568 ) ) ( ON ?auto_136571 ?auto_136573 ) ( ON-TABLE ?auto_136572 ) ( ON ?auto_136567 ?auto_136572 ) ( ON ?auto_136566 ?auto_136567 ) ( not ( = ?auto_136572 ?auto_136567 ) ) ( not ( = ?auto_136572 ?auto_136566 ) ) ( not ( = ?auto_136572 ?auto_136569 ) ) ( not ( = ?auto_136572 ?auto_136570 ) ) ( not ( = ?auto_136572 ?auto_136568 ) ) ( not ( = ?auto_136567 ?auto_136566 ) ) ( not ( = ?auto_136567 ?auto_136569 ) ) ( not ( = ?auto_136567 ?auto_136570 ) ) ( not ( = ?auto_136567 ?auto_136568 ) ) ( not ( = ?auto_136566 ?auto_136569 ) ) ( not ( = ?auto_136566 ?auto_136570 ) ) ( not ( = ?auto_136566 ?auto_136568 ) ) ( not ( = ?auto_136569 ?auto_136570 ) ) ( not ( = ?auto_136569 ?auto_136568 ) ) ( not ( = ?auto_136570 ?auto_136568 ) ) ( not ( = ?auto_136565 ?auto_136570 ) ) ( not ( = ?auto_136565 ?auto_136572 ) ) ( not ( = ?auto_136565 ?auto_136567 ) ) ( not ( = ?auto_136565 ?auto_136566 ) ) ( not ( = ?auto_136565 ?auto_136569 ) ) ( not ( = ?auto_136573 ?auto_136570 ) ) ( not ( = ?auto_136573 ?auto_136572 ) ) ( not ( = ?auto_136573 ?auto_136567 ) ) ( not ( = ?auto_136573 ?auto_136566 ) ) ( not ( = ?auto_136573 ?auto_136569 ) ) ( not ( = ?auto_136571 ?auto_136570 ) ) ( not ( = ?auto_136571 ?auto_136572 ) ) ( not ( = ?auto_136571 ?auto_136567 ) ) ( not ( = ?auto_136571 ?auto_136566 ) ) ( not ( = ?auto_136571 ?auto_136569 ) ) ( ON ?auto_136568 ?auto_136571 ) ( ON ?auto_136570 ?auto_136568 ) ( CLEAR ?auto_136570 ) ( HOLDING ?auto_136569 ) ( CLEAR ?auto_136566 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_136572 ?auto_136567 ?auto_136566 ?auto_136569 )
      ( MAKE-1PILE ?auto_136565 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_136574 - BLOCK
    )
    :vars
    (
      ?auto_136582 - BLOCK
      ?auto_136579 - BLOCK
      ?auto_136575 - BLOCK
      ?auto_136578 - BLOCK
      ?auto_136577 - BLOCK
      ?auto_136581 - BLOCK
      ?auto_136576 - BLOCK
      ?auto_136580 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_136582 ?auto_136574 ) ( ON-TABLE ?auto_136574 ) ( not ( = ?auto_136574 ?auto_136582 ) ) ( not ( = ?auto_136574 ?auto_136579 ) ) ( not ( = ?auto_136574 ?auto_136575 ) ) ( not ( = ?auto_136582 ?auto_136579 ) ) ( not ( = ?auto_136582 ?auto_136575 ) ) ( not ( = ?auto_136579 ?auto_136575 ) ) ( ON ?auto_136579 ?auto_136582 ) ( ON-TABLE ?auto_136578 ) ( ON ?auto_136577 ?auto_136578 ) ( ON ?auto_136581 ?auto_136577 ) ( not ( = ?auto_136578 ?auto_136577 ) ) ( not ( = ?auto_136578 ?auto_136581 ) ) ( not ( = ?auto_136578 ?auto_136576 ) ) ( not ( = ?auto_136578 ?auto_136580 ) ) ( not ( = ?auto_136578 ?auto_136575 ) ) ( not ( = ?auto_136577 ?auto_136581 ) ) ( not ( = ?auto_136577 ?auto_136576 ) ) ( not ( = ?auto_136577 ?auto_136580 ) ) ( not ( = ?auto_136577 ?auto_136575 ) ) ( not ( = ?auto_136581 ?auto_136576 ) ) ( not ( = ?auto_136581 ?auto_136580 ) ) ( not ( = ?auto_136581 ?auto_136575 ) ) ( not ( = ?auto_136576 ?auto_136580 ) ) ( not ( = ?auto_136576 ?auto_136575 ) ) ( not ( = ?auto_136580 ?auto_136575 ) ) ( not ( = ?auto_136574 ?auto_136580 ) ) ( not ( = ?auto_136574 ?auto_136578 ) ) ( not ( = ?auto_136574 ?auto_136577 ) ) ( not ( = ?auto_136574 ?auto_136581 ) ) ( not ( = ?auto_136574 ?auto_136576 ) ) ( not ( = ?auto_136582 ?auto_136580 ) ) ( not ( = ?auto_136582 ?auto_136578 ) ) ( not ( = ?auto_136582 ?auto_136577 ) ) ( not ( = ?auto_136582 ?auto_136581 ) ) ( not ( = ?auto_136582 ?auto_136576 ) ) ( not ( = ?auto_136579 ?auto_136580 ) ) ( not ( = ?auto_136579 ?auto_136578 ) ) ( not ( = ?auto_136579 ?auto_136577 ) ) ( not ( = ?auto_136579 ?auto_136581 ) ) ( not ( = ?auto_136579 ?auto_136576 ) ) ( ON ?auto_136575 ?auto_136579 ) ( ON ?auto_136580 ?auto_136575 ) ( CLEAR ?auto_136581 ) ( ON ?auto_136576 ?auto_136580 ) ( CLEAR ?auto_136576 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_136574 ?auto_136582 ?auto_136579 ?auto_136575 ?auto_136580 )
      ( MAKE-1PILE ?auto_136574 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_136583 - BLOCK
    )
    :vars
    (
      ?auto_136587 - BLOCK
      ?auto_136590 - BLOCK
      ?auto_136591 - BLOCK
      ?auto_136586 - BLOCK
      ?auto_136589 - BLOCK
      ?auto_136585 - BLOCK
      ?auto_136584 - BLOCK
      ?auto_136588 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_136587 ?auto_136583 ) ( ON-TABLE ?auto_136583 ) ( not ( = ?auto_136583 ?auto_136587 ) ) ( not ( = ?auto_136583 ?auto_136590 ) ) ( not ( = ?auto_136583 ?auto_136591 ) ) ( not ( = ?auto_136587 ?auto_136590 ) ) ( not ( = ?auto_136587 ?auto_136591 ) ) ( not ( = ?auto_136590 ?auto_136591 ) ) ( ON ?auto_136590 ?auto_136587 ) ( ON-TABLE ?auto_136586 ) ( ON ?auto_136589 ?auto_136586 ) ( not ( = ?auto_136586 ?auto_136589 ) ) ( not ( = ?auto_136586 ?auto_136585 ) ) ( not ( = ?auto_136586 ?auto_136584 ) ) ( not ( = ?auto_136586 ?auto_136588 ) ) ( not ( = ?auto_136586 ?auto_136591 ) ) ( not ( = ?auto_136589 ?auto_136585 ) ) ( not ( = ?auto_136589 ?auto_136584 ) ) ( not ( = ?auto_136589 ?auto_136588 ) ) ( not ( = ?auto_136589 ?auto_136591 ) ) ( not ( = ?auto_136585 ?auto_136584 ) ) ( not ( = ?auto_136585 ?auto_136588 ) ) ( not ( = ?auto_136585 ?auto_136591 ) ) ( not ( = ?auto_136584 ?auto_136588 ) ) ( not ( = ?auto_136584 ?auto_136591 ) ) ( not ( = ?auto_136588 ?auto_136591 ) ) ( not ( = ?auto_136583 ?auto_136588 ) ) ( not ( = ?auto_136583 ?auto_136586 ) ) ( not ( = ?auto_136583 ?auto_136589 ) ) ( not ( = ?auto_136583 ?auto_136585 ) ) ( not ( = ?auto_136583 ?auto_136584 ) ) ( not ( = ?auto_136587 ?auto_136588 ) ) ( not ( = ?auto_136587 ?auto_136586 ) ) ( not ( = ?auto_136587 ?auto_136589 ) ) ( not ( = ?auto_136587 ?auto_136585 ) ) ( not ( = ?auto_136587 ?auto_136584 ) ) ( not ( = ?auto_136590 ?auto_136588 ) ) ( not ( = ?auto_136590 ?auto_136586 ) ) ( not ( = ?auto_136590 ?auto_136589 ) ) ( not ( = ?auto_136590 ?auto_136585 ) ) ( not ( = ?auto_136590 ?auto_136584 ) ) ( ON ?auto_136591 ?auto_136590 ) ( ON ?auto_136588 ?auto_136591 ) ( ON ?auto_136584 ?auto_136588 ) ( CLEAR ?auto_136584 ) ( HOLDING ?auto_136585 ) ( CLEAR ?auto_136589 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_136586 ?auto_136589 ?auto_136585 )
      ( MAKE-1PILE ?auto_136583 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_136592 - BLOCK
    )
    :vars
    (
      ?auto_136600 - BLOCK
      ?auto_136595 - BLOCK
      ?auto_136594 - BLOCK
      ?auto_136598 - BLOCK
      ?auto_136596 - BLOCK
      ?auto_136593 - BLOCK
      ?auto_136599 - BLOCK
      ?auto_136597 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_136600 ?auto_136592 ) ( ON-TABLE ?auto_136592 ) ( not ( = ?auto_136592 ?auto_136600 ) ) ( not ( = ?auto_136592 ?auto_136595 ) ) ( not ( = ?auto_136592 ?auto_136594 ) ) ( not ( = ?auto_136600 ?auto_136595 ) ) ( not ( = ?auto_136600 ?auto_136594 ) ) ( not ( = ?auto_136595 ?auto_136594 ) ) ( ON ?auto_136595 ?auto_136600 ) ( ON-TABLE ?auto_136598 ) ( ON ?auto_136596 ?auto_136598 ) ( not ( = ?auto_136598 ?auto_136596 ) ) ( not ( = ?auto_136598 ?auto_136593 ) ) ( not ( = ?auto_136598 ?auto_136599 ) ) ( not ( = ?auto_136598 ?auto_136597 ) ) ( not ( = ?auto_136598 ?auto_136594 ) ) ( not ( = ?auto_136596 ?auto_136593 ) ) ( not ( = ?auto_136596 ?auto_136599 ) ) ( not ( = ?auto_136596 ?auto_136597 ) ) ( not ( = ?auto_136596 ?auto_136594 ) ) ( not ( = ?auto_136593 ?auto_136599 ) ) ( not ( = ?auto_136593 ?auto_136597 ) ) ( not ( = ?auto_136593 ?auto_136594 ) ) ( not ( = ?auto_136599 ?auto_136597 ) ) ( not ( = ?auto_136599 ?auto_136594 ) ) ( not ( = ?auto_136597 ?auto_136594 ) ) ( not ( = ?auto_136592 ?auto_136597 ) ) ( not ( = ?auto_136592 ?auto_136598 ) ) ( not ( = ?auto_136592 ?auto_136596 ) ) ( not ( = ?auto_136592 ?auto_136593 ) ) ( not ( = ?auto_136592 ?auto_136599 ) ) ( not ( = ?auto_136600 ?auto_136597 ) ) ( not ( = ?auto_136600 ?auto_136598 ) ) ( not ( = ?auto_136600 ?auto_136596 ) ) ( not ( = ?auto_136600 ?auto_136593 ) ) ( not ( = ?auto_136600 ?auto_136599 ) ) ( not ( = ?auto_136595 ?auto_136597 ) ) ( not ( = ?auto_136595 ?auto_136598 ) ) ( not ( = ?auto_136595 ?auto_136596 ) ) ( not ( = ?auto_136595 ?auto_136593 ) ) ( not ( = ?auto_136595 ?auto_136599 ) ) ( ON ?auto_136594 ?auto_136595 ) ( ON ?auto_136597 ?auto_136594 ) ( ON ?auto_136599 ?auto_136597 ) ( CLEAR ?auto_136596 ) ( ON ?auto_136593 ?auto_136599 ) ( CLEAR ?auto_136593 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_136592 ?auto_136600 ?auto_136595 ?auto_136594 ?auto_136597 ?auto_136599 )
      ( MAKE-1PILE ?auto_136592 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_136601 - BLOCK
    )
    :vars
    (
      ?auto_136604 - BLOCK
      ?auto_136603 - BLOCK
      ?auto_136606 - BLOCK
      ?auto_136602 - BLOCK
      ?auto_136605 - BLOCK
      ?auto_136607 - BLOCK
      ?auto_136609 - BLOCK
      ?auto_136608 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_136604 ?auto_136601 ) ( ON-TABLE ?auto_136601 ) ( not ( = ?auto_136601 ?auto_136604 ) ) ( not ( = ?auto_136601 ?auto_136603 ) ) ( not ( = ?auto_136601 ?auto_136606 ) ) ( not ( = ?auto_136604 ?auto_136603 ) ) ( not ( = ?auto_136604 ?auto_136606 ) ) ( not ( = ?auto_136603 ?auto_136606 ) ) ( ON ?auto_136603 ?auto_136604 ) ( ON-TABLE ?auto_136602 ) ( not ( = ?auto_136602 ?auto_136605 ) ) ( not ( = ?auto_136602 ?auto_136607 ) ) ( not ( = ?auto_136602 ?auto_136609 ) ) ( not ( = ?auto_136602 ?auto_136608 ) ) ( not ( = ?auto_136602 ?auto_136606 ) ) ( not ( = ?auto_136605 ?auto_136607 ) ) ( not ( = ?auto_136605 ?auto_136609 ) ) ( not ( = ?auto_136605 ?auto_136608 ) ) ( not ( = ?auto_136605 ?auto_136606 ) ) ( not ( = ?auto_136607 ?auto_136609 ) ) ( not ( = ?auto_136607 ?auto_136608 ) ) ( not ( = ?auto_136607 ?auto_136606 ) ) ( not ( = ?auto_136609 ?auto_136608 ) ) ( not ( = ?auto_136609 ?auto_136606 ) ) ( not ( = ?auto_136608 ?auto_136606 ) ) ( not ( = ?auto_136601 ?auto_136608 ) ) ( not ( = ?auto_136601 ?auto_136602 ) ) ( not ( = ?auto_136601 ?auto_136605 ) ) ( not ( = ?auto_136601 ?auto_136607 ) ) ( not ( = ?auto_136601 ?auto_136609 ) ) ( not ( = ?auto_136604 ?auto_136608 ) ) ( not ( = ?auto_136604 ?auto_136602 ) ) ( not ( = ?auto_136604 ?auto_136605 ) ) ( not ( = ?auto_136604 ?auto_136607 ) ) ( not ( = ?auto_136604 ?auto_136609 ) ) ( not ( = ?auto_136603 ?auto_136608 ) ) ( not ( = ?auto_136603 ?auto_136602 ) ) ( not ( = ?auto_136603 ?auto_136605 ) ) ( not ( = ?auto_136603 ?auto_136607 ) ) ( not ( = ?auto_136603 ?auto_136609 ) ) ( ON ?auto_136606 ?auto_136603 ) ( ON ?auto_136608 ?auto_136606 ) ( ON ?auto_136609 ?auto_136608 ) ( ON ?auto_136607 ?auto_136609 ) ( CLEAR ?auto_136607 ) ( HOLDING ?auto_136605 ) ( CLEAR ?auto_136602 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_136602 ?auto_136605 )
      ( MAKE-1PILE ?auto_136601 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_138780 - BLOCK
    )
    :vars
    (
      ?auto_138786 - BLOCK
      ?auto_138785 - BLOCK
      ?auto_138783 - BLOCK
      ?auto_138787 - BLOCK
      ?auto_138781 - BLOCK
      ?auto_138782 - BLOCK
      ?auto_138784 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_138786 ?auto_138780 ) ( ON-TABLE ?auto_138780 ) ( not ( = ?auto_138780 ?auto_138786 ) ) ( not ( = ?auto_138780 ?auto_138785 ) ) ( not ( = ?auto_138780 ?auto_138783 ) ) ( not ( = ?auto_138786 ?auto_138785 ) ) ( not ( = ?auto_138786 ?auto_138783 ) ) ( not ( = ?auto_138785 ?auto_138783 ) ) ( ON ?auto_138785 ?auto_138786 ) ( not ( = ?auto_138787 ?auto_138781 ) ) ( not ( = ?auto_138787 ?auto_138782 ) ) ( not ( = ?auto_138787 ?auto_138784 ) ) ( not ( = ?auto_138787 ?auto_138783 ) ) ( not ( = ?auto_138781 ?auto_138782 ) ) ( not ( = ?auto_138781 ?auto_138784 ) ) ( not ( = ?auto_138781 ?auto_138783 ) ) ( not ( = ?auto_138782 ?auto_138784 ) ) ( not ( = ?auto_138782 ?auto_138783 ) ) ( not ( = ?auto_138784 ?auto_138783 ) ) ( not ( = ?auto_138780 ?auto_138784 ) ) ( not ( = ?auto_138780 ?auto_138787 ) ) ( not ( = ?auto_138780 ?auto_138781 ) ) ( not ( = ?auto_138780 ?auto_138782 ) ) ( not ( = ?auto_138786 ?auto_138784 ) ) ( not ( = ?auto_138786 ?auto_138787 ) ) ( not ( = ?auto_138786 ?auto_138781 ) ) ( not ( = ?auto_138786 ?auto_138782 ) ) ( not ( = ?auto_138785 ?auto_138784 ) ) ( not ( = ?auto_138785 ?auto_138787 ) ) ( not ( = ?auto_138785 ?auto_138781 ) ) ( not ( = ?auto_138785 ?auto_138782 ) ) ( ON ?auto_138783 ?auto_138785 ) ( ON ?auto_138784 ?auto_138783 ) ( ON ?auto_138782 ?auto_138784 ) ( ON ?auto_138781 ?auto_138782 ) ( ON ?auto_138787 ?auto_138781 ) ( CLEAR ?auto_138787 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_138780 ?auto_138786 ?auto_138785 ?auto_138783 ?auto_138784 ?auto_138782 ?auto_138781 )
      ( MAKE-1PILE ?auto_138780 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_136619 - BLOCK
    )
    :vars
    (
      ?auto_136627 - BLOCK
      ?auto_136623 - BLOCK
      ?auto_136625 - BLOCK
      ?auto_136620 - BLOCK
      ?auto_136621 - BLOCK
      ?auto_136624 - BLOCK
      ?auto_136622 - BLOCK
      ?auto_136626 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_136627 ?auto_136619 ) ( ON-TABLE ?auto_136619 ) ( not ( = ?auto_136619 ?auto_136627 ) ) ( not ( = ?auto_136619 ?auto_136623 ) ) ( not ( = ?auto_136619 ?auto_136625 ) ) ( not ( = ?auto_136627 ?auto_136623 ) ) ( not ( = ?auto_136627 ?auto_136625 ) ) ( not ( = ?auto_136623 ?auto_136625 ) ) ( ON ?auto_136623 ?auto_136627 ) ( not ( = ?auto_136620 ?auto_136621 ) ) ( not ( = ?auto_136620 ?auto_136624 ) ) ( not ( = ?auto_136620 ?auto_136622 ) ) ( not ( = ?auto_136620 ?auto_136626 ) ) ( not ( = ?auto_136620 ?auto_136625 ) ) ( not ( = ?auto_136621 ?auto_136624 ) ) ( not ( = ?auto_136621 ?auto_136622 ) ) ( not ( = ?auto_136621 ?auto_136626 ) ) ( not ( = ?auto_136621 ?auto_136625 ) ) ( not ( = ?auto_136624 ?auto_136622 ) ) ( not ( = ?auto_136624 ?auto_136626 ) ) ( not ( = ?auto_136624 ?auto_136625 ) ) ( not ( = ?auto_136622 ?auto_136626 ) ) ( not ( = ?auto_136622 ?auto_136625 ) ) ( not ( = ?auto_136626 ?auto_136625 ) ) ( not ( = ?auto_136619 ?auto_136626 ) ) ( not ( = ?auto_136619 ?auto_136620 ) ) ( not ( = ?auto_136619 ?auto_136621 ) ) ( not ( = ?auto_136619 ?auto_136624 ) ) ( not ( = ?auto_136619 ?auto_136622 ) ) ( not ( = ?auto_136627 ?auto_136626 ) ) ( not ( = ?auto_136627 ?auto_136620 ) ) ( not ( = ?auto_136627 ?auto_136621 ) ) ( not ( = ?auto_136627 ?auto_136624 ) ) ( not ( = ?auto_136627 ?auto_136622 ) ) ( not ( = ?auto_136623 ?auto_136626 ) ) ( not ( = ?auto_136623 ?auto_136620 ) ) ( not ( = ?auto_136623 ?auto_136621 ) ) ( not ( = ?auto_136623 ?auto_136624 ) ) ( not ( = ?auto_136623 ?auto_136622 ) ) ( ON ?auto_136625 ?auto_136623 ) ( ON ?auto_136626 ?auto_136625 ) ( ON ?auto_136622 ?auto_136626 ) ( ON ?auto_136624 ?auto_136622 ) ( ON ?auto_136621 ?auto_136624 ) ( CLEAR ?auto_136621 ) ( HOLDING ?auto_136620 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_136620 )
      ( MAKE-1PILE ?auto_136619 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_136628 - BLOCK
    )
    :vars
    (
      ?auto_136634 - BLOCK
      ?auto_136636 - BLOCK
      ?auto_136631 - BLOCK
      ?auto_136635 - BLOCK
      ?auto_136630 - BLOCK
      ?auto_136633 - BLOCK
      ?auto_136629 - BLOCK
      ?auto_136632 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_136634 ?auto_136628 ) ( ON-TABLE ?auto_136628 ) ( not ( = ?auto_136628 ?auto_136634 ) ) ( not ( = ?auto_136628 ?auto_136636 ) ) ( not ( = ?auto_136628 ?auto_136631 ) ) ( not ( = ?auto_136634 ?auto_136636 ) ) ( not ( = ?auto_136634 ?auto_136631 ) ) ( not ( = ?auto_136636 ?auto_136631 ) ) ( ON ?auto_136636 ?auto_136634 ) ( not ( = ?auto_136635 ?auto_136630 ) ) ( not ( = ?auto_136635 ?auto_136633 ) ) ( not ( = ?auto_136635 ?auto_136629 ) ) ( not ( = ?auto_136635 ?auto_136632 ) ) ( not ( = ?auto_136635 ?auto_136631 ) ) ( not ( = ?auto_136630 ?auto_136633 ) ) ( not ( = ?auto_136630 ?auto_136629 ) ) ( not ( = ?auto_136630 ?auto_136632 ) ) ( not ( = ?auto_136630 ?auto_136631 ) ) ( not ( = ?auto_136633 ?auto_136629 ) ) ( not ( = ?auto_136633 ?auto_136632 ) ) ( not ( = ?auto_136633 ?auto_136631 ) ) ( not ( = ?auto_136629 ?auto_136632 ) ) ( not ( = ?auto_136629 ?auto_136631 ) ) ( not ( = ?auto_136632 ?auto_136631 ) ) ( not ( = ?auto_136628 ?auto_136632 ) ) ( not ( = ?auto_136628 ?auto_136635 ) ) ( not ( = ?auto_136628 ?auto_136630 ) ) ( not ( = ?auto_136628 ?auto_136633 ) ) ( not ( = ?auto_136628 ?auto_136629 ) ) ( not ( = ?auto_136634 ?auto_136632 ) ) ( not ( = ?auto_136634 ?auto_136635 ) ) ( not ( = ?auto_136634 ?auto_136630 ) ) ( not ( = ?auto_136634 ?auto_136633 ) ) ( not ( = ?auto_136634 ?auto_136629 ) ) ( not ( = ?auto_136636 ?auto_136632 ) ) ( not ( = ?auto_136636 ?auto_136635 ) ) ( not ( = ?auto_136636 ?auto_136630 ) ) ( not ( = ?auto_136636 ?auto_136633 ) ) ( not ( = ?auto_136636 ?auto_136629 ) ) ( ON ?auto_136631 ?auto_136636 ) ( ON ?auto_136632 ?auto_136631 ) ( ON ?auto_136629 ?auto_136632 ) ( ON ?auto_136633 ?auto_136629 ) ( ON ?auto_136630 ?auto_136633 ) ( ON ?auto_136635 ?auto_136630 ) ( CLEAR ?auto_136635 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_136628 ?auto_136634 ?auto_136636 ?auto_136631 ?auto_136632 ?auto_136629 ?auto_136633 ?auto_136630 )
      ( MAKE-1PILE ?auto_136628 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_136645 - BLOCK
      ?auto_136646 - BLOCK
      ?auto_136647 - BLOCK
      ?auto_136648 - BLOCK
      ?auto_136649 - BLOCK
      ?auto_136650 - BLOCK
      ?auto_136651 - BLOCK
      ?auto_136652 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_136652 ) ( CLEAR ?auto_136651 ) ( ON-TABLE ?auto_136645 ) ( ON ?auto_136646 ?auto_136645 ) ( ON ?auto_136647 ?auto_136646 ) ( ON ?auto_136648 ?auto_136647 ) ( ON ?auto_136649 ?auto_136648 ) ( ON ?auto_136650 ?auto_136649 ) ( ON ?auto_136651 ?auto_136650 ) ( not ( = ?auto_136645 ?auto_136646 ) ) ( not ( = ?auto_136645 ?auto_136647 ) ) ( not ( = ?auto_136645 ?auto_136648 ) ) ( not ( = ?auto_136645 ?auto_136649 ) ) ( not ( = ?auto_136645 ?auto_136650 ) ) ( not ( = ?auto_136645 ?auto_136651 ) ) ( not ( = ?auto_136645 ?auto_136652 ) ) ( not ( = ?auto_136646 ?auto_136647 ) ) ( not ( = ?auto_136646 ?auto_136648 ) ) ( not ( = ?auto_136646 ?auto_136649 ) ) ( not ( = ?auto_136646 ?auto_136650 ) ) ( not ( = ?auto_136646 ?auto_136651 ) ) ( not ( = ?auto_136646 ?auto_136652 ) ) ( not ( = ?auto_136647 ?auto_136648 ) ) ( not ( = ?auto_136647 ?auto_136649 ) ) ( not ( = ?auto_136647 ?auto_136650 ) ) ( not ( = ?auto_136647 ?auto_136651 ) ) ( not ( = ?auto_136647 ?auto_136652 ) ) ( not ( = ?auto_136648 ?auto_136649 ) ) ( not ( = ?auto_136648 ?auto_136650 ) ) ( not ( = ?auto_136648 ?auto_136651 ) ) ( not ( = ?auto_136648 ?auto_136652 ) ) ( not ( = ?auto_136649 ?auto_136650 ) ) ( not ( = ?auto_136649 ?auto_136651 ) ) ( not ( = ?auto_136649 ?auto_136652 ) ) ( not ( = ?auto_136650 ?auto_136651 ) ) ( not ( = ?auto_136650 ?auto_136652 ) ) ( not ( = ?auto_136651 ?auto_136652 ) ) )
    :subtasks
    ( ( !STACK ?auto_136652 ?auto_136651 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_136653 - BLOCK
      ?auto_136654 - BLOCK
      ?auto_136655 - BLOCK
      ?auto_136656 - BLOCK
      ?auto_136657 - BLOCK
      ?auto_136658 - BLOCK
      ?auto_136659 - BLOCK
      ?auto_136660 - BLOCK
    )
    :vars
    (
      ?auto_136661 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_136659 ) ( ON-TABLE ?auto_136653 ) ( ON ?auto_136654 ?auto_136653 ) ( ON ?auto_136655 ?auto_136654 ) ( ON ?auto_136656 ?auto_136655 ) ( ON ?auto_136657 ?auto_136656 ) ( ON ?auto_136658 ?auto_136657 ) ( ON ?auto_136659 ?auto_136658 ) ( not ( = ?auto_136653 ?auto_136654 ) ) ( not ( = ?auto_136653 ?auto_136655 ) ) ( not ( = ?auto_136653 ?auto_136656 ) ) ( not ( = ?auto_136653 ?auto_136657 ) ) ( not ( = ?auto_136653 ?auto_136658 ) ) ( not ( = ?auto_136653 ?auto_136659 ) ) ( not ( = ?auto_136653 ?auto_136660 ) ) ( not ( = ?auto_136654 ?auto_136655 ) ) ( not ( = ?auto_136654 ?auto_136656 ) ) ( not ( = ?auto_136654 ?auto_136657 ) ) ( not ( = ?auto_136654 ?auto_136658 ) ) ( not ( = ?auto_136654 ?auto_136659 ) ) ( not ( = ?auto_136654 ?auto_136660 ) ) ( not ( = ?auto_136655 ?auto_136656 ) ) ( not ( = ?auto_136655 ?auto_136657 ) ) ( not ( = ?auto_136655 ?auto_136658 ) ) ( not ( = ?auto_136655 ?auto_136659 ) ) ( not ( = ?auto_136655 ?auto_136660 ) ) ( not ( = ?auto_136656 ?auto_136657 ) ) ( not ( = ?auto_136656 ?auto_136658 ) ) ( not ( = ?auto_136656 ?auto_136659 ) ) ( not ( = ?auto_136656 ?auto_136660 ) ) ( not ( = ?auto_136657 ?auto_136658 ) ) ( not ( = ?auto_136657 ?auto_136659 ) ) ( not ( = ?auto_136657 ?auto_136660 ) ) ( not ( = ?auto_136658 ?auto_136659 ) ) ( not ( = ?auto_136658 ?auto_136660 ) ) ( not ( = ?auto_136659 ?auto_136660 ) ) ( ON ?auto_136660 ?auto_136661 ) ( CLEAR ?auto_136660 ) ( HAND-EMPTY ) ( not ( = ?auto_136653 ?auto_136661 ) ) ( not ( = ?auto_136654 ?auto_136661 ) ) ( not ( = ?auto_136655 ?auto_136661 ) ) ( not ( = ?auto_136656 ?auto_136661 ) ) ( not ( = ?auto_136657 ?auto_136661 ) ) ( not ( = ?auto_136658 ?auto_136661 ) ) ( not ( = ?auto_136659 ?auto_136661 ) ) ( not ( = ?auto_136660 ?auto_136661 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_136660 ?auto_136661 )
      ( MAKE-8PILE ?auto_136653 ?auto_136654 ?auto_136655 ?auto_136656 ?auto_136657 ?auto_136658 ?auto_136659 ?auto_136660 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_136662 - BLOCK
      ?auto_136663 - BLOCK
      ?auto_136664 - BLOCK
      ?auto_136665 - BLOCK
      ?auto_136666 - BLOCK
      ?auto_136667 - BLOCK
      ?auto_136668 - BLOCK
      ?auto_136669 - BLOCK
    )
    :vars
    (
      ?auto_136670 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_136662 ) ( ON ?auto_136663 ?auto_136662 ) ( ON ?auto_136664 ?auto_136663 ) ( ON ?auto_136665 ?auto_136664 ) ( ON ?auto_136666 ?auto_136665 ) ( ON ?auto_136667 ?auto_136666 ) ( not ( = ?auto_136662 ?auto_136663 ) ) ( not ( = ?auto_136662 ?auto_136664 ) ) ( not ( = ?auto_136662 ?auto_136665 ) ) ( not ( = ?auto_136662 ?auto_136666 ) ) ( not ( = ?auto_136662 ?auto_136667 ) ) ( not ( = ?auto_136662 ?auto_136668 ) ) ( not ( = ?auto_136662 ?auto_136669 ) ) ( not ( = ?auto_136663 ?auto_136664 ) ) ( not ( = ?auto_136663 ?auto_136665 ) ) ( not ( = ?auto_136663 ?auto_136666 ) ) ( not ( = ?auto_136663 ?auto_136667 ) ) ( not ( = ?auto_136663 ?auto_136668 ) ) ( not ( = ?auto_136663 ?auto_136669 ) ) ( not ( = ?auto_136664 ?auto_136665 ) ) ( not ( = ?auto_136664 ?auto_136666 ) ) ( not ( = ?auto_136664 ?auto_136667 ) ) ( not ( = ?auto_136664 ?auto_136668 ) ) ( not ( = ?auto_136664 ?auto_136669 ) ) ( not ( = ?auto_136665 ?auto_136666 ) ) ( not ( = ?auto_136665 ?auto_136667 ) ) ( not ( = ?auto_136665 ?auto_136668 ) ) ( not ( = ?auto_136665 ?auto_136669 ) ) ( not ( = ?auto_136666 ?auto_136667 ) ) ( not ( = ?auto_136666 ?auto_136668 ) ) ( not ( = ?auto_136666 ?auto_136669 ) ) ( not ( = ?auto_136667 ?auto_136668 ) ) ( not ( = ?auto_136667 ?auto_136669 ) ) ( not ( = ?auto_136668 ?auto_136669 ) ) ( ON ?auto_136669 ?auto_136670 ) ( CLEAR ?auto_136669 ) ( not ( = ?auto_136662 ?auto_136670 ) ) ( not ( = ?auto_136663 ?auto_136670 ) ) ( not ( = ?auto_136664 ?auto_136670 ) ) ( not ( = ?auto_136665 ?auto_136670 ) ) ( not ( = ?auto_136666 ?auto_136670 ) ) ( not ( = ?auto_136667 ?auto_136670 ) ) ( not ( = ?auto_136668 ?auto_136670 ) ) ( not ( = ?auto_136669 ?auto_136670 ) ) ( HOLDING ?auto_136668 ) ( CLEAR ?auto_136667 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_136662 ?auto_136663 ?auto_136664 ?auto_136665 ?auto_136666 ?auto_136667 ?auto_136668 )
      ( MAKE-8PILE ?auto_136662 ?auto_136663 ?auto_136664 ?auto_136665 ?auto_136666 ?auto_136667 ?auto_136668 ?auto_136669 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_136671 - BLOCK
      ?auto_136672 - BLOCK
      ?auto_136673 - BLOCK
      ?auto_136674 - BLOCK
      ?auto_136675 - BLOCK
      ?auto_136676 - BLOCK
      ?auto_136677 - BLOCK
      ?auto_136678 - BLOCK
    )
    :vars
    (
      ?auto_136679 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_136671 ) ( ON ?auto_136672 ?auto_136671 ) ( ON ?auto_136673 ?auto_136672 ) ( ON ?auto_136674 ?auto_136673 ) ( ON ?auto_136675 ?auto_136674 ) ( ON ?auto_136676 ?auto_136675 ) ( not ( = ?auto_136671 ?auto_136672 ) ) ( not ( = ?auto_136671 ?auto_136673 ) ) ( not ( = ?auto_136671 ?auto_136674 ) ) ( not ( = ?auto_136671 ?auto_136675 ) ) ( not ( = ?auto_136671 ?auto_136676 ) ) ( not ( = ?auto_136671 ?auto_136677 ) ) ( not ( = ?auto_136671 ?auto_136678 ) ) ( not ( = ?auto_136672 ?auto_136673 ) ) ( not ( = ?auto_136672 ?auto_136674 ) ) ( not ( = ?auto_136672 ?auto_136675 ) ) ( not ( = ?auto_136672 ?auto_136676 ) ) ( not ( = ?auto_136672 ?auto_136677 ) ) ( not ( = ?auto_136672 ?auto_136678 ) ) ( not ( = ?auto_136673 ?auto_136674 ) ) ( not ( = ?auto_136673 ?auto_136675 ) ) ( not ( = ?auto_136673 ?auto_136676 ) ) ( not ( = ?auto_136673 ?auto_136677 ) ) ( not ( = ?auto_136673 ?auto_136678 ) ) ( not ( = ?auto_136674 ?auto_136675 ) ) ( not ( = ?auto_136674 ?auto_136676 ) ) ( not ( = ?auto_136674 ?auto_136677 ) ) ( not ( = ?auto_136674 ?auto_136678 ) ) ( not ( = ?auto_136675 ?auto_136676 ) ) ( not ( = ?auto_136675 ?auto_136677 ) ) ( not ( = ?auto_136675 ?auto_136678 ) ) ( not ( = ?auto_136676 ?auto_136677 ) ) ( not ( = ?auto_136676 ?auto_136678 ) ) ( not ( = ?auto_136677 ?auto_136678 ) ) ( ON ?auto_136678 ?auto_136679 ) ( not ( = ?auto_136671 ?auto_136679 ) ) ( not ( = ?auto_136672 ?auto_136679 ) ) ( not ( = ?auto_136673 ?auto_136679 ) ) ( not ( = ?auto_136674 ?auto_136679 ) ) ( not ( = ?auto_136675 ?auto_136679 ) ) ( not ( = ?auto_136676 ?auto_136679 ) ) ( not ( = ?auto_136677 ?auto_136679 ) ) ( not ( = ?auto_136678 ?auto_136679 ) ) ( CLEAR ?auto_136676 ) ( ON ?auto_136677 ?auto_136678 ) ( CLEAR ?auto_136677 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_136679 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_136679 ?auto_136678 )
      ( MAKE-8PILE ?auto_136671 ?auto_136672 ?auto_136673 ?auto_136674 ?auto_136675 ?auto_136676 ?auto_136677 ?auto_136678 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_136680 - BLOCK
      ?auto_136681 - BLOCK
      ?auto_136682 - BLOCK
      ?auto_136683 - BLOCK
      ?auto_136684 - BLOCK
      ?auto_136685 - BLOCK
      ?auto_136686 - BLOCK
      ?auto_136687 - BLOCK
    )
    :vars
    (
      ?auto_136688 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_136680 ) ( ON ?auto_136681 ?auto_136680 ) ( ON ?auto_136682 ?auto_136681 ) ( ON ?auto_136683 ?auto_136682 ) ( ON ?auto_136684 ?auto_136683 ) ( not ( = ?auto_136680 ?auto_136681 ) ) ( not ( = ?auto_136680 ?auto_136682 ) ) ( not ( = ?auto_136680 ?auto_136683 ) ) ( not ( = ?auto_136680 ?auto_136684 ) ) ( not ( = ?auto_136680 ?auto_136685 ) ) ( not ( = ?auto_136680 ?auto_136686 ) ) ( not ( = ?auto_136680 ?auto_136687 ) ) ( not ( = ?auto_136681 ?auto_136682 ) ) ( not ( = ?auto_136681 ?auto_136683 ) ) ( not ( = ?auto_136681 ?auto_136684 ) ) ( not ( = ?auto_136681 ?auto_136685 ) ) ( not ( = ?auto_136681 ?auto_136686 ) ) ( not ( = ?auto_136681 ?auto_136687 ) ) ( not ( = ?auto_136682 ?auto_136683 ) ) ( not ( = ?auto_136682 ?auto_136684 ) ) ( not ( = ?auto_136682 ?auto_136685 ) ) ( not ( = ?auto_136682 ?auto_136686 ) ) ( not ( = ?auto_136682 ?auto_136687 ) ) ( not ( = ?auto_136683 ?auto_136684 ) ) ( not ( = ?auto_136683 ?auto_136685 ) ) ( not ( = ?auto_136683 ?auto_136686 ) ) ( not ( = ?auto_136683 ?auto_136687 ) ) ( not ( = ?auto_136684 ?auto_136685 ) ) ( not ( = ?auto_136684 ?auto_136686 ) ) ( not ( = ?auto_136684 ?auto_136687 ) ) ( not ( = ?auto_136685 ?auto_136686 ) ) ( not ( = ?auto_136685 ?auto_136687 ) ) ( not ( = ?auto_136686 ?auto_136687 ) ) ( ON ?auto_136687 ?auto_136688 ) ( not ( = ?auto_136680 ?auto_136688 ) ) ( not ( = ?auto_136681 ?auto_136688 ) ) ( not ( = ?auto_136682 ?auto_136688 ) ) ( not ( = ?auto_136683 ?auto_136688 ) ) ( not ( = ?auto_136684 ?auto_136688 ) ) ( not ( = ?auto_136685 ?auto_136688 ) ) ( not ( = ?auto_136686 ?auto_136688 ) ) ( not ( = ?auto_136687 ?auto_136688 ) ) ( ON ?auto_136686 ?auto_136687 ) ( CLEAR ?auto_136686 ) ( ON-TABLE ?auto_136688 ) ( HOLDING ?auto_136685 ) ( CLEAR ?auto_136684 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_136680 ?auto_136681 ?auto_136682 ?auto_136683 ?auto_136684 ?auto_136685 )
      ( MAKE-8PILE ?auto_136680 ?auto_136681 ?auto_136682 ?auto_136683 ?auto_136684 ?auto_136685 ?auto_136686 ?auto_136687 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_136689 - BLOCK
      ?auto_136690 - BLOCK
      ?auto_136691 - BLOCK
      ?auto_136692 - BLOCK
      ?auto_136693 - BLOCK
      ?auto_136694 - BLOCK
      ?auto_136695 - BLOCK
      ?auto_136696 - BLOCK
    )
    :vars
    (
      ?auto_136697 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_136689 ) ( ON ?auto_136690 ?auto_136689 ) ( ON ?auto_136691 ?auto_136690 ) ( ON ?auto_136692 ?auto_136691 ) ( ON ?auto_136693 ?auto_136692 ) ( not ( = ?auto_136689 ?auto_136690 ) ) ( not ( = ?auto_136689 ?auto_136691 ) ) ( not ( = ?auto_136689 ?auto_136692 ) ) ( not ( = ?auto_136689 ?auto_136693 ) ) ( not ( = ?auto_136689 ?auto_136694 ) ) ( not ( = ?auto_136689 ?auto_136695 ) ) ( not ( = ?auto_136689 ?auto_136696 ) ) ( not ( = ?auto_136690 ?auto_136691 ) ) ( not ( = ?auto_136690 ?auto_136692 ) ) ( not ( = ?auto_136690 ?auto_136693 ) ) ( not ( = ?auto_136690 ?auto_136694 ) ) ( not ( = ?auto_136690 ?auto_136695 ) ) ( not ( = ?auto_136690 ?auto_136696 ) ) ( not ( = ?auto_136691 ?auto_136692 ) ) ( not ( = ?auto_136691 ?auto_136693 ) ) ( not ( = ?auto_136691 ?auto_136694 ) ) ( not ( = ?auto_136691 ?auto_136695 ) ) ( not ( = ?auto_136691 ?auto_136696 ) ) ( not ( = ?auto_136692 ?auto_136693 ) ) ( not ( = ?auto_136692 ?auto_136694 ) ) ( not ( = ?auto_136692 ?auto_136695 ) ) ( not ( = ?auto_136692 ?auto_136696 ) ) ( not ( = ?auto_136693 ?auto_136694 ) ) ( not ( = ?auto_136693 ?auto_136695 ) ) ( not ( = ?auto_136693 ?auto_136696 ) ) ( not ( = ?auto_136694 ?auto_136695 ) ) ( not ( = ?auto_136694 ?auto_136696 ) ) ( not ( = ?auto_136695 ?auto_136696 ) ) ( ON ?auto_136696 ?auto_136697 ) ( not ( = ?auto_136689 ?auto_136697 ) ) ( not ( = ?auto_136690 ?auto_136697 ) ) ( not ( = ?auto_136691 ?auto_136697 ) ) ( not ( = ?auto_136692 ?auto_136697 ) ) ( not ( = ?auto_136693 ?auto_136697 ) ) ( not ( = ?auto_136694 ?auto_136697 ) ) ( not ( = ?auto_136695 ?auto_136697 ) ) ( not ( = ?auto_136696 ?auto_136697 ) ) ( ON ?auto_136695 ?auto_136696 ) ( ON-TABLE ?auto_136697 ) ( CLEAR ?auto_136693 ) ( ON ?auto_136694 ?auto_136695 ) ( CLEAR ?auto_136694 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_136697 ?auto_136696 ?auto_136695 )
      ( MAKE-8PILE ?auto_136689 ?auto_136690 ?auto_136691 ?auto_136692 ?auto_136693 ?auto_136694 ?auto_136695 ?auto_136696 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_136698 - BLOCK
      ?auto_136699 - BLOCK
      ?auto_136700 - BLOCK
      ?auto_136701 - BLOCK
      ?auto_136702 - BLOCK
      ?auto_136703 - BLOCK
      ?auto_136704 - BLOCK
      ?auto_136705 - BLOCK
    )
    :vars
    (
      ?auto_136706 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_136698 ) ( ON ?auto_136699 ?auto_136698 ) ( ON ?auto_136700 ?auto_136699 ) ( ON ?auto_136701 ?auto_136700 ) ( not ( = ?auto_136698 ?auto_136699 ) ) ( not ( = ?auto_136698 ?auto_136700 ) ) ( not ( = ?auto_136698 ?auto_136701 ) ) ( not ( = ?auto_136698 ?auto_136702 ) ) ( not ( = ?auto_136698 ?auto_136703 ) ) ( not ( = ?auto_136698 ?auto_136704 ) ) ( not ( = ?auto_136698 ?auto_136705 ) ) ( not ( = ?auto_136699 ?auto_136700 ) ) ( not ( = ?auto_136699 ?auto_136701 ) ) ( not ( = ?auto_136699 ?auto_136702 ) ) ( not ( = ?auto_136699 ?auto_136703 ) ) ( not ( = ?auto_136699 ?auto_136704 ) ) ( not ( = ?auto_136699 ?auto_136705 ) ) ( not ( = ?auto_136700 ?auto_136701 ) ) ( not ( = ?auto_136700 ?auto_136702 ) ) ( not ( = ?auto_136700 ?auto_136703 ) ) ( not ( = ?auto_136700 ?auto_136704 ) ) ( not ( = ?auto_136700 ?auto_136705 ) ) ( not ( = ?auto_136701 ?auto_136702 ) ) ( not ( = ?auto_136701 ?auto_136703 ) ) ( not ( = ?auto_136701 ?auto_136704 ) ) ( not ( = ?auto_136701 ?auto_136705 ) ) ( not ( = ?auto_136702 ?auto_136703 ) ) ( not ( = ?auto_136702 ?auto_136704 ) ) ( not ( = ?auto_136702 ?auto_136705 ) ) ( not ( = ?auto_136703 ?auto_136704 ) ) ( not ( = ?auto_136703 ?auto_136705 ) ) ( not ( = ?auto_136704 ?auto_136705 ) ) ( ON ?auto_136705 ?auto_136706 ) ( not ( = ?auto_136698 ?auto_136706 ) ) ( not ( = ?auto_136699 ?auto_136706 ) ) ( not ( = ?auto_136700 ?auto_136706 ) ) ( not ( = ?auto_136701 ?auto_136706 ) ) ( not ( = ?auto_136702 ?auto_136706 ) ) ( not ( = ?auto_136703 ?auto_136706 ) ) ( not ( = ?auto_136704 ?auto_136706 ) ) ( not ( = ?auto_136705 ?auto_136706 ) ) ( ON ?auto_136704 ?auto_136705 ) ( ON-TABLE ?auto_136706 ) ( ON ?auto_136703 ?auto_136704 ) ( CLEAR ?auto_136703 ) ( HOLDING ?auto_136702 ) ( CLEAR ?auto_136701 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_136698 ?auto_136699 ?auto_136700 ?auto_136701 ?auto_136702 )
      ( MAKE-8PILE ?auto_136698 ?auto_136699 ?auto_136700 ?auto_136701 ?auto_136702 ?auto_136703 ?auto_136704 ?auto_136705 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_136707 - BLOCK
      ?auto_136708 - BLOCK
      ?auto_136709 - BLOCK
      ?auto_136710 - BLOCK
      ?auto_136711 - BLOCK
      ?auto_136712 - BLOCK
      ?auto_136713 - BLOCK
      ?auto_136714 - BLOCK
    )
    :vars
    (
      ?auto_136715 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_136707 ) ( ON ?auto_136708 ?auto_136707 ) ( ON ?auto_136709 ?auto_136708 ) ( ON ?auto_136710 ?auto_136709 ) ( not ( = ?auto_136707 ?auto_136708 ) ) ( not ( = ?auto_136707 ?auto_136709 ) ) ( not ( = ?auto_136707 ?auto_136710 ) ) ( not ( = ?auto_136707 ?auto_136711 ) ) ( not ( = ?auto_136707 ?auto_136712 ) ) ( not ( = ?auto_136707 ?auto_136713 ) ) ( not ( = ?auto_136707 ?auto_136714 ) ) ( not ( = ?auto_136708 ?auto_136709 ) ) ( not ( = ?auto_136708 ?auto_136710 ) ) ( not ( = ?auto_136708 ?auto_136711 ) ) ( not ( = ?auto_136708 ?auto_136712 ) ) ( not ( = ?auto_136708 ?auto_136713 ) ) ( not ( = ?auto_136708 ?auto_136714 ) ) ( not ( = ?auto_136709 ?auto_136710 ) ) ( not ( = ?auto_136709 ?auto_136711 ) ) ( not ( = ?auto_136709 ?auto_136712 ) ) ( not ( = ?auto_136709 ?auto_136713 ) ) ( not ( = ?auto_136709 ?auto_136714 ) ) ( not ( = ?auto_136710 ?auto_136711 ) ) ( not ( = ?auto_136710 ?auto_136712 ) ) ( not ( = ?auto_136710 ?auto_136713 ) ) ( not ( = ?auto_136710 ?auto_136714 ) ) ( not ( = ?auto_136711 ?auto_136712 ) ) ( not ( = ?auto_136711 ?auto_136713 ) ) ( not ( = ?auto_136711 ?auto_136714 ) ) ( not ( = ?auto_136712 ?auto_136713 ) ) ( not ( = ?auto_136712 ?auto_136714 ) ) ( not ( = ?auto_136713 ?auto_136714 ) ) ( ON ?auto_136714 ?auto_136715 ) ( not ( = ?auto_136707 ?auto_136715 ) ) ( not ( = ?auto_136708 ?auto_136715 ) ) ( not ( = ?auto_136709 ?auto_136715 ) ) ( not ( = ?auto_136710 ?auto_136715 ) ) ( not ( = ?auto_136711 ?auto_136715 ) ) ( not ( = ?auto_136712 ?auto_136715 ) ) ( not ( = ?auto_136713 ?auto_136715 ) ) ( not ( = ?auto_136714 ?auto_136715 ) ) ( ON ?auto_136713 ?auto_136714 ) ( ON-TABLE ?auto_136715 ) ( ON ?auto_136712 ?auto_136713 ) ( CLEAR ?auto_136710 ) ( ON ?auto_136711 ?auto_136712 ) ( CLEAR ?auto_136711 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_136715 ?auto_136714 ?auto_136713 ?auto_136712 )
      ( MAKE-8PILE ?auto_136707 ?auto_136708 ?auto_136709 ?auto_136710 ?auto_136711 ?auto_136712 ?auto_136713 ?auto_136714 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_136716 - BLOCK
      ?auto_136717 - BLOCK
      ?auto_136718 - BLOCK
      ?auto_136719 - BLOCK
      ?auto_136720 - BLOCK
      ?auto_136721 - BLOCK
      ?auto_136722 - BLOCK
      ?auto_136723 - BLOCK
    )
    :vars
    (
      ?auto_136724 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_136716 ) ( ON ?auto_136717 ?auto_136716 ) ( ON ?auto_136718 ?auto_136717 ) ( not ( = ?auto_136716 ?auto_136717 ) ) ( not ( = ?auto_136716 ?auto_136718 ) ) ( not ( = ?auto_136716 ?auto_136719 ) ) ( not ( = ?auto_136716 ?auto_136720 ) ) ( not ( = ?auto_136716 ?auto_136721 ) ) ( not ( = ?auto_136716 ?auto_136722 ) ) ( not ( = ?auto_136716 ?auto_136723 ) ) ( not ( = ?auto_136717 ?auto_136718 ) ) ( not ( = ?auto_136717 ?auto_136719 ) ) ( not ( = ?auto_136717 ?auto_136720 ) ) ( not ( = ?auto_136717 ?auto_136721 ) ) ( not ( = ?auto_136717 ?auto_136722 ) ) ( not ( = ?auto_136717 ?auto_136723 ) ) ( not ( = ?auto_136718 ?auto_136719 ) ) ( not ( = ?auto_136718 ?auto_136720 ) ) ( not ( = ?auto_136718 ?auto_136721 ) ) ( not ( = ?auto_136718 ?auto_136722 ) ) ( not ( = ?auto_136718 ?auto_136723 ) ) ( not ( = ?auto_136719 ?auto_136720 ) ) ( not ( = ?auto_136719 ?auto_136721 ) ) ( not ( = ?auto_136719 ?auto_136722 ) ) ( not ( = ?auto_136719 ?auto_136723 ) ) ( not ( = ?auto_136720 ?auto_136721 ) ) ( not ( = ?auto_136720 ?auto_136722 ) ) ( not ( = ?auto_136720 ?auto_136723 ) ) ( not ( = ?auto_136721 ?auto_136722 ) ) ( not ( = ?auto_136721 ?auto_136723 ) ) ( not ( = ?auto_136722 ?auto_136723 ) ) ( ON ?auto_136723 ?auto_136724 ) ( not ( = ?auto_136716 ?auto_136724 ) ) ( not ( = ?auto_136717 ?auto_136724 ) ) ( not ( = ?auto_136718 ?auto_136724 ) ) ( not ( = ?auto_136719 ?auto_136724 ) ) ( not ( = ?auto_136720 ?auto_136724 ) ) ( not ( = ?auto_136721 ?auto_136724 ) ) ( not ( = ?auto_136722 ?auto_136724 ) ) ( not ( = ?auto_136723 ?auto_136724 ) ) ( ON ?auto_136722 ?auto_136723 ) ( ON-TABLE ?auto_136724 ) ( ON ?auto_136721 ?auto_136722 ) ( ON ?auto_136720 ?auto_136721 ) ( CLEAR ?auto_136720 ) ( HOLDING ?auto_136719 ) ( CLEAR ?auto_136718 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_136716 ?auto_136717 ?auto_136718 ?auto_136719 )
      ( MAKE-8PILE ?auto_136716 ?auto_136717 ?auto_136718 ?auto_136719 ?auto_136720 ?auto_136721 ?auto_136722 ?auto_136723 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_136725 - BLOCK
      ?auto_136726 - BLOCK
      ?auto_136727 - BLOCK
      ?auto_136728 - BLOCK
      ?auto_136729 - BLOCK
      ?auto_136730 - BLOCK
      ?auto_136731 - BLOCK
      ?auto_136732 - BLOCK
    )
    :vars
    (
      ?auto_136733 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_136725 ) ( ON ?auto_136726 ?auto_136725 ) ( ON ?auto_136727 ?auto_136726 ) ( not ( = ?auto_136725 ?auto_136726 ) ) ( not ( = ?auto_136725 ?auto_136727 ) ) ( not ( = ?auto_136725 ?auto_136728 ) ) ( not ( = ?auto_136725 ?auto_136729 ) ) ( not ( = ?auto_136725 ?auto_136730 ) ) ( not ( = ?auto_136725 ?auto_136731 ) ) ( not ( = ?auto_136725 ?auto_136732 ) ) ( not ( = ?auto_136726 ?auto_136727 ) ) ( not ( = ?auto_136726 ?auto_136728 ) ) ( not ( = ?auto_136726 ?auto_136729 ) ) ( not ( = ?auto_136726 ?auto_136730 ) ) ( not ( = ?auto_136726 ?auto_136731 ) ) ( not ( = ?auto_136726 ?auto_136732 ) ) ( not ( = ?auto_136727 ?auto_136728 ) ) ( not ( = ?auto_136727 ?auto_136729 ) ) ( not ( = ?auto_136727 ?auto_136730 ) ) ( not ( = ?auto_136727 ?auto_136731 ) ) ( not ( = ?auto_136727 ?auto_136732 ) ) ( not ( = ?auto_136728 ?auto_136729 ) ) ( not ( = ?auto_136728 ?auto_136730 ) ) ( not ( = ?auto_136728 ?auto_136731 ) ) ( not ( = ?auto_136728 ?auto_136732 ) ) ( not ( = ?auto_136729 ?auto_136730 ) ) ( not ( = ?auto_136729 ?auto_136731 ) ) ( not ( = ?auto_136729 ?auto_136732 ) ) ( not ( = ?auto_136730 ?auto_136731 ) ) ( not ( = ?auto_136730 ?auto_136732 ) ) ( not ( = ?auto_136731 ?auto_136732 ) ) ( ON ?auto_136732 ?auto_136733 ) ( not ( = ?auto_136725 ?auto_136733 ) ) ( not ( = ?auto_136726 ?auto_136733 ) ) ( not ( = ?auto_136727 ?auto_136733 ) ) ( not ( = ?auto_136728 ?auto_136733 ) ) ( not ( = ?auto_136729 ?auto_136733 ) ) ( not ( = ?auto_136730 ?auto_136733 ) ) ( not ( = ?auto_136731 ?auto_136733 ) ) ( not ( = ?auto_136732 ?auto_136733 ) ) ( ON ?auto_136731 ?auto_136732 ) ( ON-TABLE ?auto_136733 ) ( ON ?auto_136730 ?auto_136731 ) ( ON ?auto_136729 ?auto_136730 ) ( CLEAR ?auto_136727 ) ( ON ?auto_136728 ?auto_136729 ) ( CLEAR ?auto_136728 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_136733 ?auto_136732 ?auto_136731 ?auto_136730 ?auto_136729 )
      ( MAKE-8PILE ?auto_136725 ?auto_136726 ?auto_136727 ?auto_136728 ?auto_136729 ?auto_136730 ?auto_136731 ?auto_136732 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_136734 - BLOCK
      ?auto_136735 - BLOCK
      ?auto_136736 - BLOCK
      ?auto_136737 - BLOCK
      ?auto_136738 - BLOCK
      ?auto_136739 - BLOCK
      ?auto_136740 - BLOCK
      ?auto_136741 - BLOCK
    )
    :vars
    (
      ?auto_136742 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_136734 ) ( ON ?auto_136735 ?auto_136734 ) ( not ( = ?auto_136734 ?auto_136735 ) ) ( not ( = ?auto_136734 ?auto_136736 ) ) ( not ( = ?auto_136734 ?auto_136737 ) ) ( not ( = ?auto_136734 ?auto_136738 ) ) ( not ( = ?auto_136734 ?auto_136739 ) ) ( not ( = ?auto_136734 ?auto_136740 ) ) ( not ( = ?auto_136734 ?auto_136741 ) ) ( not ( = ?auto_136735 ?auto_136736 ) ) ( not ( = ?auto_136735 ?auto_136737 ) ) ( not ( = ?auto_136735 ?auto_136738 ) ) ( not ( = ?auto_136735 ?auto_136739 ) ) ( not ( = ?auto_136735 ?auto_136740 ) ) ( not ( = ?auto_136735 ?auto_136741 ) ) ( not ( = ?auto_136736 ?auto_136737 ) ) ( not ( = ?auto_136736 ?auto_136738 ) ) ( not ( = ?auto_136736 ?auto_136739 ) ) ( not ( = ?auto_136736 ?auto_136740 ) ) ( not ( = ?auto_136736 ?auto_136741 ) ) ( not ( = ?auto_136737 ?auto_136738 ) ) ( not ( = ?auto_136737 ?auto_136739 ) ) ( not ( = ?auto_136737 ?auto_136740 ) ) ( not ( = ?auto_136737 ?auto_136741 ) ) ( not ( = ?auto_136738 ?auto_136739 ) ) ( not ( = ?auto_136738 ?auto_136740 ) ) ( not ( = ?auto_136738 ?auto_136741 ) ) ( not ( = ?auto_136739 ?auto_136740 ) ) ( not ( = ?auto_136739 ?auto_136741 ) ) ( not ( = ?auto_136740 ?auto_136741 ) ) ( ON ?auto_136741 ?auto_136742 ) ( not ( = ?auto_136734 ?auto_136742 ) ) ( not ( = ?auto_136735 ?auto_136742 ) ) ( not ( = ?auto_136736 ?auto_136742 ) ) ( not ( = ?auto_136737 ?auto_136742 ) ) ( not ( = ?auto_136738 ?auto_136742 ) ) ( not ( = ?auto_136739 ?auto_136742 ) ) ( not ( = ?auto_136740 ?auto_136742 ) ) ( not ( = ?auto_136741 ?auto_136742 ) ) ( ON ?auto_136740 ?auto_136741 ) ( ON-TABLE ?auto_136742 ) ( ON ?auto_136739 ?auto_136740 ) ( ON ?auto_136738 ?auto_136739 ) ( ON ?auto_136737 ?auto_136738 ) ( CLEAR ?auto_136737 ) ( HOLDING ?auto_136736 ) ( CLEAR ?auto_136735 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_136734 ?auto_136735 ?auto_136736 )
      ( MAKE-8PILE ?auto_136734 ?auto_136735 ?auto_136736 ?auto_136737 ?auto_136738 ?auto_136739 ?auto_136740 ?auto_136741 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_136743 - BLOCK
      ?auto_136744 - BLOCK
      ?auto_136745 - BLOCK
      ?auto_136746 - BLOCK
      ?auto_136747 - BLOCK
      ?auto_136748 - BLOCK
      ?auto_136749 - BLOCK
      ?auto_136750 - BLOCK
    )
    :vars
    (
      ?auto_136751 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_136743 ) ( ON ?auto_136744 ?auto_136743 ) ( not ( = ?auto_136743 ?auto_136744 ) ) ( not ( = ?auto_136743 ?auto_136745 ) ) ( not ( = ?auto_136743 ?auto_136746 ) ) ( not ( = ?auto_136743 ?auto_136747 ) ) ( not ( = ?auto_136743 ?auto_136748 ) ) ( not ( = ?auto_136743 ?auto_136749 ) ) ( not ( = ?auto_136743 ?auto_136750 ) ) ( not ( = ?auto_136744 ?auto_136745 ) ) ( not ( = ?auto_136744 ?auto_136746 ) ) ( not ( = ?auto_136744 ?auto_136747 ) ) ( not ( = ?auto_136744 ?auto_136748 ) ) ( not ( = ?auto_136744 ?auto_136749 ) ) ( not ( = ?auto_136744 ?auto_136750 ) ) ( not ( = ?auto_136745 ?auto_136746 ) ) ( not ( = ?auto_136745 ?auto_136747 ) ) ( not ( = ?auto_136745 ?auto_136748 ) ) ( not ( = ?auto_136745 ?auto_136749 ) ) ( not ( = ?auto_136745 ?auto_136750 ) ) ( not ( = ?auto_136746 ?auto_136747 ) ) ( not ( = ?auto_136746 ?auto_136748 ) ) ( not ( = ?auto_136746 ?auto_136749 ) ) ( not ( = ?auto_136746 ?auto_136750 ) ) ( not ( = ?auto_136747 ?auto_136748 ) ) ( not ( = ?auto_136747 ?auto_136749 ) ) ( not ( = ?auto_136747 ?auto_136750 ) ) ( not ( = ?auto_136748 ?auto_136749 ) ) ( not ( = ?auto_136748 ?auto_136750 ) ) ( not ( = ?auto_136749 ?auto_136750 ) ) ( ON ?auto_136750 ?auto_136751 ) ( not ( = ?auto_136743 ?auto_136751 ) ) ( not ( = ?auto_136744 ?auto_136751 ) ) ( not ( = ?auto_136745 ?auto_136751 ) ) ( not ( = ?auto_136746 ?auto_136751 ) ) ( not ( = ?auto_136747 ?auto_136751 ) ) ( not ( = ?auto_136748 ?auto_136751 ) ) ( not ( = ?auto_136749 ?auto_136751 ) ) ( not ( = ?auto_136750 ?auto_136751 ) ) ( ON ?auto_136749 ?auto_136750 ) ( ON-TABLE ?auto_136751 ) ( ON ?auto_136748 ?auto_136749 ) ( ON ?auto_136747 ?auto_136748 ) ( ON ?auto_136746 ?auto_136747 ) ( CLEAR ?auto_136744 ) ( ON ?auto_136745 ?auto_136746 ) ( CLEAR ?auto_136745 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_136751 ?auto_136750 ?auto_136749 ?auto_136748 ?auto_136747 ?auto_136746 )
      ( MAKE-8PILE ?auto_136743 ?auto_136744 ?auto_136745 ?auto_136746 ?auto_136747 ?auto_136748 ?auto_136749 ?auto_136750 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_136752 - BLOCK
      ?auto_136753 - BLOCK
      ?auto_136754 - BLOCK
      ?auto_136755 - BLOCK
      ?auto_136756 - BLOCK
      ?auto_136757 - BLOCK
      ?auto_136758 - BLOCK
      ?auto_136759 - BLOCK
    )
    :vars
    (
      ?auto_136760 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_136752 ) ( not ( = ?auto_136752 ?auto_136753 ) ) ( not ( = ?auto_136752 ?auto_136754 ) ) ( not ( = ?auto_136752 ?auto_136755 ) ) ( not ( = ?auto_136752 ?auto_136756 ) ) ( not ( = ?auto_136752 ?auto_136757 ) ) ( not ( = ?auto_136752 ?auto_136758 ) ) ( not ( = ?auto_136752 ?auto_136759 ) ) ( not ( = ?auto_136753 ?auto_136754 ) ) ( not ( = ?auto_136753 ?auto_136755 ) ) ( not ( = ?auto_136753 ?auto_136756 ) ) ( not ( = ?auto_136753 ?auto_136757 ) ) ( not ( = ?auto_136753 ?auto_136758 ) ) ( not ( = ?auto_136753 ?auto_136759 ) ) ( not ( = ?auto_136754 ?auto_136755 ) ) ( not ( = ?auto_136754 ?auto_136756 ) ) ( not ( = ?auto_136754 ?auto_136757 ) ) ( not ( = ?auto_136754 ?auto_136758 ) ) ( not ( = ?auto_136754 ?auto_136759 ) ) ( not ( = ?auto_136755 ?auto_136756 ) ) ( not ( = ?auto_136755 ?auto_136757 ) ) ( not ( = ?auto_136755 ?auto_136758 ) ) ( not ( = ?auto_136755 ?auto_136759 ) ) ( not ( = ?auto_136756 ?auto_136757 ) ) ( not ( = ?auto_136756 ?auto_136758 ) ) ( not ( = ?auto_136756 ?auto_136759 ) ) ( not ( = ?auto_136757 ?auto_136758 ) ) ( not ( = ?auto_136757 ?auto_136759 ) ) ( not ( = ?auto_136758 ?auto_136759 ) ) ( ON ?auto_136759 ?auto_136760 ) ( not ( = ?auto_136752 ?auto_136760 ) ) ( not ( = ?auto_136753 ?auto_136760 ) ) ( not ( = ?auto_136754 ?auto_136760 ) ) ( not ( = ?auto_136755 ?auto_136760 ) ) ( not ( = ?auto_136756 ?auto_136760 ) ) ( not ( = ?auto_136757 ?auto_136760 ) ) ( not ( = ?auto_136758 ?auto_136760 ) ) ( not ( = ?auto_136759 ?auto_136760 ) ) ( ON ?auto_136758 ?auto_136759 ) ( ON-TABLE ?auto_136760 ) ( ON ?auto_136757 ?auto_136758 ) ( ON ?auto_136756 ?auto_136757 ) ( ON ?auto_136755 ?auto_136756 ) ( ON ?auto_136754 ?auto_136755 ) ( CLEAR ?auto_136754 ) ( HOLDING ?auto_136753 ) ( CLEAR ?auto_136752 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_136752 ?auto_136753 )
      ( MAKE-8PILE ?auto_136752 ?auto_136753 ?auto_136754 ?auto_136755 ?auto_136756 ?auto_136757 ?auto_136758 ?auto_136759 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_136761 - BLOCK
      ?auto_136762 - BLOCK
      ?auto_136763 - BLOCK
      ?auto_136764 - BLOCK
      ?auto_136765 - BLOCK
      ?auto_136766 - BLOCK
      ?auto_136767 - BLOCK
      ?auto_136768 - BLOCK
    )
    :vars
    (
      ?auto_136769 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_136761 ) ( not ( = ?auto_136761 ?auto_136762 ) ) ( not ( = ?auto_136761 ?auto_136763 ) ) ( not ( = ?auto_136761 ?auto_136764 ) ) ( not ( = ?auto_136761 ?auto_136765 ) ) ( not ( = ?auto_136761 ?auto_136766 ) ) ( not ( = ?auto_136761 ?auto_136767 ) ) ( not ( = ?auto_136761 ?auto_136768 ) ) ( not ( = ?auto_136762 ?auto_136763 ) ) ( not ( = ?auto_136762 ?auto_136764 ) ) ( not ( = ?auto_136762 ?auto_136765 ) ) ( not ( = ?auto_136762 ?auto_136766 ) ) ( not ( = ?auto_136762 ?auto_136767 ) ) ( not ( = ?auto_136762 ?auto_136768 ) ) ( not ( = ?auto_136763 ?auto_136764 ) ) ( not ( = ?auto_136763 ?auto_136765 ) ) ( not ( = ?auto_136763 ?auto_136766 ) ) ( not ( = ?auto_136763 ?auto_136767 ) ) ( not ( = ?auto_136763 ?auto_136768 ) ) ( not ( = ?auto_136764 ?auto_136765 ) ) ( not ( = ?auto_136764 ?auto_136766 ) ) ( not ( = ?auto_136764 ?auto_136767 ) ) ( not ( = ?auto_136764 ?auto_136768 ) ) ( not ( = ?auto_136765 ?auto_136766 ) ) ( not ( = ?auto_136765 ?auto_136767 ) ) ( not ( = ?auto_136765 ?auto_136768 ) ) ( not ( = ?auto_136766 ?auto_136767 ) ) ( not ( = ?auto_136766 ?auto_136768 ) ) ( not ( = ?auto_136767 ?auto_136768 ) ) ( ON ?auto_136768 ?auto_136769 ) ( not ( = ?auto_136761 ?auto_136769 ) ) ( not ( = ?auto_136762 ?auto_136769 ) ) ( not ( = ?auto_136763 ?auto_136769 ) ) ( not ( = ?auto_136764 ?auto_136769 ) ) ( not ( = ?auto_136765 ?auto_136769 ) ) ( not ( = ?auto_136766 ?auto_136769 ) ) ( not ( = ?auto_136767 ?auto_136769 ) ) ( not ( = ?auto_136768 ?auto_136769 ) ) ( ON ?auto_136767 ?auto_136768 ) ( ON-TABLE ?auto_136769 ) ( ON ?auto_136766 ?auto_136767 ) ( ON ?auto_136765 ?auto_136766 ) ( ON ?auto_136764 ?auto_136765 ) ( ON ?auto_136763 ?auto_136764 ) ( CLEAR ?auto_136761 ) ( ON ?auto_136762 ?auto_136763 ) ( CLEAR ?auto_136762 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_136769 ?auto_136768 ?auto_136767 ?auto_136766 ?auto_136765 ?auto_136764 ?auto_136763 )
      ( MAKE-8PILE ?auto_136761 ?auto_136762 ?auto_136763 ?auto_136764 ?auto_136765 ?auto_136766 ?auto_136767 ?auto_136768 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_136770 - BLOCK
      ?auto_136771 - BLOCK
      ?auto_136772 - BLOCK
      ?auto_136773 - BLOCK
      ?auto_136774 - BLOCK
      ?auto_136775 - BLOCK
      ?auto_136776 - BLOCK
      ?auto_136777 - BLOCK
    )
    :vars
    (
      ?auto_136778 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_136770 ?auto_136771 ) ) ( not ( = ?auto_136770 ?auto_136772 ) ) ( not ( = ?auto_136770 ?auto_136773 ) ) ( not ( = ?auto_136770 ?auto_136774 ) ) ( not ( = ?auto_136770 ?auto_136775 ) ) ( not ( = ?auto_136770 ?auto_136776 ) ) ( not ( = ?auto_136770 ?auto_136777 ) ) ( not ( = ?auto_136771 ?auto_136772 ) ) ( not ( = ?auto_136771 ?auto_136773 ) ) ( not ( = ?auto_136771 ?auto_136774 ) ) ( not ( = ?auto_136771 ?auto_136775 ) ) ( not ( = ?auto_136771 ?auto_136776 ) ) ( not ( = ?auto_136771 ?auto_136777 ) ) ( not ( = ?auto_136772 ?auto_136773 ) ) ( not ( = ?auto_136772 ?auto_136774 ) ) ( not ( = ?auto_136772 ?auto_136775 ) ) ( not ( = ?auto_136772 ?auto_136776 ) ) ( not ( = ?auto_136772 ?auto_136777 ) ) ( not ( = ?auto_136773 ?auto_136774 ) ) ( not ( = ?auto_136773 ?auto_136775 ) ) ( not ( = ?auto_136773 ?auto_136776 ) ) ( not ( = ?auto_136773 ?auto_136777 ) ) ( not ( = ?auto_136774 ?auto_136775 ) ) ( not ( = ?auto_136774 ?auto_136776 ) ) ( not ( = ?auto_136774 ?auto_136777 ) ) ( not ( = ?auto_136775 ?auto_136776 ) ) ( not ( = ?auto_136775 ?auto_136777 ) ) ( not ( = ?auto_136776 ?auto_136777 ) ) ( ON ?auto_136777 ?auto_136778 ) ( not ( = ?auto_136770 ?auto_136778 ) ) ( not ( = ?auto_136771 ?auto_136778 ) ) ( not ( = ?auto_136772 ?auto_136778 ) ) ( not ( = ?auto_136773 ?auto_136778 ) ) ( not ( = ?auto_136774 ?auto_136778 ) ) ( not ( = ?auto_136775 ?auto_136778 ) ) ( not ( = ?auto_136776 ?auto_136778 ) ) ( not ( = ?auto_136777 ?auto_136778 ) ) ( ON ?auto_136776 ?auto_136777 ) ( ON-TABLE ?auto_136778 ) ( ON ?auto_136775 ?auto_136776 ) ( ON ?auto_136774 ?auto_136775 ) ( ON ?auto_136773 ?auto_136774 ) ( ON ?auto_136772 ?auto_136773 ) ( ON ?auto_136771 ?auto_136772 ) ( CLEAR ?auto_136771 ) ( HOLDING ?auto_136770 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_136770 )
      ( MAKE-8PILE ?auto_136770 ?auto_136771 ?auto_136772 ?auto_136773 ?auto_136774 ?auto_136775 ?auto_136776 ?auto_136777 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_136779 - BLOCK
      ?auto_136780 - BLOCK
      ?auto_136781 - BLOCK
      ?auto_136782 - BLOCK
      ?auto_136783 - BLOCK
      ?auto_136784 - BLOCK
      ?auto_136785 - BLOCK
      ?auto_136786 - BLOCK
    )
    :vars
    (
      ?auto_136787 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_136779 ?auto_136780 ) ) ( not ( = ?auto_136779 ?auto_136781 ) ) ( not ( = ?auto_136779 ?auto_136782 ) ) ( not ( = ?auto_136779 ?auto_136783 ) ) ( not ( = ?auto_136779 ?auto_136784 ) ) ( not ( = ?auto_136779 ?auto_136785 ) ) ( not ( = ?auto_136779 ?auto_136786 ) ) ( not ( = ?auto_136780 ?auto_136781 ) ) ( not ( = ?auto_136780 ?auto_136782 ) ) ( not ( = ?auto_136780 ?auto_136783 ) ) ( not ( = ?auto_136780 ?auto_136784 ) ) ( not ( = ?auto_136780 ?auto_136785 ) ) ( not ( = ?auto_136780 ?auto_136786 ) ) ( not ( = ?auto_136781 ?auto_136782 ) ) ( not ( = ?auto_136781 ?auto_136783 ) ) ( not ( = ?auto_136781 ?auto_136784 ) ) ( not ( = ?auto_136781 ?auto_136785 ) ) ( not ( = ?auto_136781 ?auto_136786 ) ) ( not ( = ?auto_136782 ?auto_136783 ) ) ( not ( = ?auto_136782 ?auto_136784 ) ) ( not ( = ?auto_136782 ?auto_136785 ) ) ( not ( = ?auto_136782 ?auto_136786 ) ) ( not ( = ?auto_136783 ?auto_136784 ) ) ( not ( = ?auto_136783 ?auto_136785 ) ) ( not ( = ?auto_136783 ?auto_136786 ) ) ( not ( = ?auto_136784 ?auto_136785 ) ) ( not ( = ?auto_136784 ?auto_136786 ) ) ( not ( = ?auto_136785 ?auto_136786 ) ) ( ON ?auto_136786 ?auto_136787 ) ( not ( = ?auto_136779 ?auto_136787 ) ) ( not ( = ?auto_136780 ?auto_136787 ) ) ( not ( = ?auto_136781 ?auto_136787 ) ) ( not ( = ?auto_136782 ?auto_136787 ) ) ( not ( = ?auto_136783 ?auto_136787 ) ) ( not ( = ?auto_136784 ?auto_136787 ) ) ( not ( = ?auto_136785 ?auto_136787 ) ) ( not ( = ?auto_136786 ?auto_136787 ) ) ( ON ?auto_136785 ?auto_136786 ) ( ON-TABLE ?auto_136787 ) ( ON ?auto_136784 ?auto_136785 ) ( ON ?auto_136783 ?auto_136784 ) ( ON ?auto_136782 ?auto_136783 ) ( ON ?auto_136781 ?auto_136782 ) ( ON ?auto_136780 ?auto_136781 ) ( ON ?auto_136779 ?auto_136780 ) ( CLEAR ?auto_136779 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_136787 ?auto_136786 ?auto_136785 ?auto_136784 ?auto_136783 ?auto_136782 ?auto_136781 ?auto_136780 )
      ( MAKE-8PILE ?auto_136779 ?auto_136780 ?auto_136781 ?auto_136782 ?auto_136783 ?auto_136784 ?auto_136785 ?auto_136786 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_136924 - BLOCK
    )
    :vars
    (
      ?auto_136925 - BLOCK
      ?auto_136926 - BLOCK
      ?auto_136927 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_136924 ?auto_136925 ) ( CLEAR ?auto_136924 ) ( not ( = ?auto_136924 ?auto_136925 ) ) ( HOLDING ?auto_136926 ) ( CLEAR ?auto_136927 ) ( not ( = ?auto_136924 ?auto_136926 ) ) ( not ( = ?auto_136924 ?auto_136927 ) ) ( not ( = ?auto_136925 ?auto_136926 ) ) ( not ( = ?auto_136925 ?auto_136927 ) ) ( not ( = ?auto_136926 ?auto_136927 ) ) )
    :subtasks
    ( ( !STACK ?auto_136926 ?auto_136927 )
      ( MAKE-1PILE ?auto_136924 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_136928 - BLOCK
    )
    :vars
    (
      ?auto_136930 - BLOCK
      ?auto_136931 - BLOCK
      ?auto_136929 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_136928 ?auto_136930 ) ( not ( = ?auto_136928 ?auto_136930 ) ) ( CLEAR ?auto_136931 ) ( not ( = ?auto_136928 ?auto_136929 ) ) ( not ( = ?auto_136928 ?auto_136931 ) ) ( not ( = ?auto_136930 ?auto_136929 ) ) ( not ( = ?auto_136930 ?auto_136931 ) ) ( not ( = ?auto_136929 ?auto_136931 ) ) ( ON ?auto_136929 ?auto_136928 ) ( CLEAR ?auto_136929 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_136930 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_136930 ?auto_136928 )
      ( MAKE-1PILE ?auto_136928 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_136932 - BLOCK
    )
    :vars
    (
      ?auto_136935 - BLOCK
      ?auto_136934 - BLOCK
      ?auto_136933 - BLOCK
      ?auto_136937 - BLOCK
      ?auto_136940 - BLOCK
      ?auto_136938 - BLOCK
      ?auto_136939 - BLOCK
      ?auto_136936 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_136932 ?auto_136935 ) ( not ( = ?auto_136932 ?auto_136935 ) ) ( not ( = ?auto_136932 ?auto_136934 ) ) ( not ( = ?auto_136932 ?auto_136933 ) ) ( not ( = ?auto_136935 ?auto_136934 ) ) ( not ( = ?auto_136935 ?auto_136933 ) ) ( not ( = ?auto_136934 ?auto_136933 ) ) ( ON ?auto_136934 ?auto_136932 ) ( CLEAR ?auto_136934 ) ( ON-TABLE ?auto_136935 ) ( HOLDING ?auto_136933 ) ( CLEAR ?auto_136937 ) ( ON-TABLE ?auto_136940 ) ( ON ?auto_136938 ?auto_136940 ) ( ON ?auto_136939 ?auto_136938 ) ( ON ?auto_136936 ?auto_136939 ) ( ON ?auto_136937 ?auto_136936 ) ( not ( = ?auto_136940 ?auto_136938 ) ) ( not ( = ?auto_136940 ?auto_136939 ) ) ( not ( = ?auto_136940 ?auto_136936 ) ) ( not ( = ?auto_136940 ?auto_136937 ) ) ( not ( = ?auto_136940 ?auto_136933 ) ) ( not ( = ?auto_136938 ?auto_136939 ) ) ( not ( = ?auto_136938 ?auto_136936 ) ) ( not ( = ?auto_136938 ?auto_136937 ) ) ( not ( = ?auto_136938 ?auto_136933 ) ) ( not ( = ?auto_136939 ?auto_136936 ) ) ( not ( = ?auto_136939 ?auto_136937 ) ) ( not ( = ?auto_136939 ?auto_136933 ) ) ( not ( = ?auto_136936 ?auto_136937 ) ) ( not ( = ?auto_136936 ?auto_136933 ) ) ( not ( = ?auto_136937 ?auto_136933 ) ) ( not ( = ?auto_136932 ?auto_136937 ) ) ( not ( = ?auto_136932 ?auto_136940 ) ) ( not ( = ?auto_136932 ?auto_136938 ) ) ( not ( = ?auto_136932 ?auto_136939 ) ) ( not ( = ?auto_136932 ?auto_136936 ) ) ( not ( = ?auto_136935 ?auto_136937 ) ) ( not ( = ?auto_136935 ?auto_136940 ) ) ( not ( = ?auto_136935 ?auto_136938 ) ) ( not ( = ?auto_136935 ?auto_136939 ) ) ( not ( = ?auto_136935 ?auto_136936 ) ) ( not ( = ?auto_136934 ?auto_136937 ) ) ( not ( = ?auto_136934 ?auto_136940 ) ) ( not ( = ?auto_136934 ?auto_136938 ) ) ( not ( = ?auto_136934 ?auto_136939 ) ) ( not ( = ?auto_136934 ?auto_136936 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_136940 ?auto_136938 ?auto_136939 ?auto_136936 ?auto_136937 ?auto_136933 )
      ( MAKE-1PILE ?auto_136932 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_136941 - BLOCK
    )
    :vars
    (
      ?auto_136948 - BLOCK
      ?auto_136944 - BLOCK
      ?auto_136943 - BLOCK
      ?auto_136946 - BLOCK
      ?auto_136949 - BLOCK
      ?auto_136947 - BLOCK
      ?auto_136942 - BLOCK
      ?auto_136945 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_136941 ?auto_136948 ) ( not ( = ?auto_136941 ?auto_136948 ) ) ( not ( = ?auto_136941 ?auto_136944 ) ) ( not ( = ?auto_136941 ?auto_136943 ) ) ( not ( = ?auto_136948 ?auto_136944 ) ) ( not ( = ?auto_136948 ?auto_136943 ) ) ( not ( = ?auto_136944 ?auto_136943 ) ) ( ON ?auto_136944 ?auto_136941 ) ( ON-TABLE ?auto_136948 ) ( CLEAR ?auto_136946 ) ( ON-TABLE ?auto_136949 ) ( ON ?auto_136947 ?auto_136949 ) ( ON ?auto_136942 ?auto_136947 ) ( ON ?auto_136945 ?auto_136942 ) ( ON ?auto_136946 ?auto_136945 ) ( not ( = ?auto_136949 ?auto_136947 ) ) ( not ( = ?auto_136949 ?auto_136942 ) ) ( not ( = ?auto_136949 ?auto_136945 ) ) ( not ( = ?auto_136949 ?auto_136946 ) ) ( not ( = ?auto_136949 ?auto_136943 ) ) ( not ( = ?auto_136947 ?auto_136942 ) ) ( not ( = ?auto_136947 ?auto_136945 ) ) ( not ( = ?auto_136947 ?auto_136946 ) ) ( not ( = ?auto_136947 ?auto_136943 ) ) ( not ( = ?auto_136942 ?auto_136945 ) ) ( not ( = ?auto_136942 ?auto_136946 ) ) ( not ( = ?auto_136942 ?auto_136943 ) ) ( not ( = ?auto_136945 ?auto_136946 ) ) ( not ( = ?auto_136945 ?auto_136943 ) ) ( not ( = ?auto_136946 ?auto_136943 ) ) ( not ( = ?auto_136941 ?auto_136946 ) ) ( not ( = ?auto_136941 ?auto_136949 ) ) ( not ( = ?auto_136941 ?auto_136947 ) ) ( not ( = ?auto_136941 ?auto_136942 ) ) ( not ( = ?auto_136941 ?auto_136945 ) ) ( not ( = ?auto_136948 ?auto_136946 ) ) ( not ( = ?auto_136948 ?auto_136949 ) ) ( not ( = ?auto_136948 ?auto_136947 ) ) ( not ( = ?auto_136948 ?auto_136942 ) ) ( not ( = ?auto_136948 ?auto_136945 ) ) ( not ( = ?auto_136944 ?auto_136946 ) ) ( not ( = ?auto_136944 ?auto_136949 ) ) ( not ( = ?auto_136944 ?auto_136947 ) ) ( not ( = ?auto_136944 ?auto_136942 ) ) ( not ( = ?auto_136944 ?auto_136945 ) ) ( ON ?auto_136943 ?auto_136944 ) ( CLEAR ?auto_136943 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_136948 ?auto_136941 ?auto_136944 )
      ( MAKE-1PILE ?auto_136941 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_136950 - BLOCK
    )
    :vars
    (
      ?auto_136955 - BLOCK
      ?auto_136951 - BLOCK
      ?auto_136957 - BLOCK
      ?auto_136954 - BLOCK
      ?auto_136953 - BLOCK
      ?auto_136958 - BLOCK
      ?auto_136952 - BLOCK
      ?auto_136956 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_136950 ?auto_136955 ) ( not ( = ?auto_136950 ?auto_136955 ) ) ( not ( = ?auto_136950 ?auto_136951 ) ) ( not ( = ?auto_136950 ?auto_136957 ) ) ( not ( = ?auto_136955 ?auto_136951 ) ) ( not ( = ?auto_136955 ?auto_136957 ) ) ( not ( = ?auto_136951 ?auto_136957 ) ) ( ON ?auto_136951 ?auto_136950 ) ( ON-TABLE ?auto_136955 ) ( ON-TABLE ?auto_136954 ) ( ON ?auto_136953 ?auto_136954 ) ( ON ?auto_136958 ?auto_136953 ) ( ON ?auto_136952 ?auto_136958 ) ( not ( = ?auto_136954 ?auto_136953 ) ) ( not ( = ?auto_136954 ?auto_136958 ) ) ( not ( = ?auto_136954 ?auto_136952 ) ) ( not ( = ?auto_136954 ?auto_136956 ) ) ( not ( = ?auto_136954 ?auto_136957 ) ) ( not ( = ?auto_136953 ?auto_136958 ) ) ( not ( = ?auto_136953 ?auto_136952 ) ) ( not ( = ?auto_136953 ?auto_136956 ) ) ( not ( = ?auto_136953 ?auto_136957 ) ) ( not ( = ?auto_136958 ?auto_136952 ) ) ( not ( = ?auto_136958 ?auto_136956 ) ) ( not ( = ?auto_136958 ?auto_136957 ) ) ( not ( = ?auto_136952 ?auto_136956 ) ) ( not ( = ?auto_136952 ?auto_136957 ) ) ( not ( = ?auto_136956 ?auto_136957 ) ) ( not ( = ?auto_136950 ?auto_136956 ) ) ( not ( = ?auto_136950 ?auto_136954 ) ) ( not ( = ?auto_136950 ?auto_136953 ) ) ( not ( = ?auto_136950 ?auto_136958 ) ) ( not ( = ?auto_136950 ?auto_136952 ) ) ( not ( = ?auto_136955 ?auto_136956 ) ) ( not ( = ?auto_136955 ?auto_136954 ) ) ( not ( = ?auto_136955 ?auto_136953 ) ) ( not ( = ?auto_136955 ?auto_136958 ) ) ( not ( = ?auto_136955 ?auto_136952 ) ) ( not ( = ?auto_136951 ?auto_136956 ) ) ( not ( = ?auto_136951 ?auto_136954 ) ) ( not ( = ?auto_136951 ?auto_136953 ) ) ( not ( = ?auto_136951 ?auto_136958 ) ) ( not ( = ?auto_136951 ?auto_136952 ) ) ( ON ?auto_136957 ?auto_136951 ) ( CLEAR ?auto_136957 ) ( HOLDING ?auto_136956 ) ( CLEAR ?auto_136952 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_136954 ?auto_136953 ?auto_136958 ?auto_136952 ?auto_136956 )
      ( MAKE-1PILE ?auto_136950 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_136959 - BLOCK
    )
    :vars
    (
      ?auto_136964 - BLOCK
      ?auto_136962 - BLOCK
      ?auto_136963 - BLOCK
      ?auto_136967 - BLOCK
      ?auto_136965 - BLOCK
      ?auto_136960 - BLOCK
      ?auto_136961 - BLOCK
      ?auto_136966 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_136959 ?auto_136964 ) ( not ( = ?auto_136959 ?auto_136964 ) ) ( not ( = ?auto_136959 ?auto_136962 ) ) ( not ( = ?auto_136959 ?auto_136963 ) ) ( not ( = ?auto_136964 ?auto_136962 ) ) ( not ( = ?auto_136964 ?auto_136963 ) ) ( not ( = ?auto_136962 ?auto_136963 ) ) ( ON ?auto_136962 ?auto_136959 ) ( ON-TABLE ?auto_136964 ) ( ON-TABLE ?auto_136967 ) ( ON ?auto_136965 ?auto_136967 ) ( ON ?auto_136960 ?auto_136965 ) ( ON ?auto_136961 ?auto_136960 ) ( not ( = ?auto_136967 ?auto_136965 ) ) ( not ( = ?auto_136967 ?auto_136960 ) ) ( not ( = ?auto_136967 ?auto_136961 ) ) ( not ( = ?auto_136967 ?auto_136966 ) ) ( not ( = ?auto_136967 ?auto_136963 ) ) ( not ( = ?auto_136965 ?auto_136960 ) ) ( not ( = ?auto_136965 ?auto_136961 ) ) ( not ( = ?auto_136965 ?auto_136966 ) ) ( not ( = ?auto_136965 ?auto_136963 ) ) ( not ( = ?auto_136960 ?auto_136961 ) ) ( not ( = ?auto_136960 ?auto_136966 ) ) ( not ( = ?auto_136960 ?auto_136963 ) ) ( not ( = ?auto_136961 ?auto_136966 ) ) ( not ( = ?auto_136961 ?auto_136963 ) ) ( not ( = ?auto_136966 ?auto_136963 ) ) ( not ( = ?auto_136959 ?auto_136966 ) ) ( not ( = ?auto_136959 ?auto_136967 ) ) ( not ( = ?auto_136959 ?auto_136965 ) ) ( not ( = ?auto_136959 ?auto_136960 ) ) ( not ( = ?auto_136959 ?auto_136961 ) ) ( not ( = ?auto_136964 ?auto_136966 ) ) ( not ( = ?auto_136964 ?auto_136967 ) ) ( not ( = ?auto_136964 ?auto_136965 ) ) ( not ( = ?auto_136964 ?auto_136960 ) ) ( not ( = ?auto_136964 ?auto_136961 ) ) ( not ( = ?auto_136962 ?auto_136966 ) ) ( not ( = ?auto_136962 ?auto_136967 ) ) ( not ( = ?auto_136962 ?auto_136965 ) ) ( not ( = ?auto_136962 ?auto_136960 ) ) ( not ( = ?auto_136962 ?auto_136961 ) ) ( ON ?auto_136963 ?auto_136962 ) ( CLEAR ?auto_136961 ) ( ON ?auto_136966 ?auto_136963 ) ( CLEAR ?auto_136966 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_136964 ?auto_136959 ?auto_136962 ?auto_136963 )
      ( MAKE-1PILE ?auto_136959 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_136968 - BLOCK
    )
    :vars
    (
      ?auto_136970 - BLOCK
      ?auto_136971 - BLOCK
      ?auto_136975 - BLOCK
      ?auto_136973 - BLOCK
      ?auto_136974 - BLOCK
      ?auto_136969 - BLOCK
      ?auto_136972 - BLOCK
      ?auto_136976 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_136968 ?auto_136970 ) ( not ( = ?auto_136968 ?auto_136970 ) ) ( not ( = ?auto_136968 ?auto_136971 ) ) ( not ( = ?auto_136968 ?auto_136975 ) ) ( not ( = ?auto_136970 ?auto_136971 ) ) ( not ( = ?auto_136970 ?auto_136975 ) ) ( not ( = ?auto_136971 ?auto_136975 ) ) ( ON ?auto_136971 ?auto_136968 ) ( ON-TABLE ?auto_136970 ) ( ON-TABLE ?auto_136973 ) ( ON ?auto_136974 ?auto_136973 ) ( ON ?auto_136969 ?auto_136974 ) ( not ( = ?auto_136973 ?auto_136974 ) ) ( not ( = ?auto_136973 ?auto_136969 ) ) ( not ( = ?auto_136973 ?auto_136972 ) ) ( not ( = ?auto_136973 ?auto_136976 ) ) ( not ( = ?auto_136973 ?auto_136975 ) ) ( not ( = ?auto_136974 ?auto_136969 ) ) ( not ( = ?auto_136974 ?auto_136972 ) ) ( not ( = ?auto_136974 ?auto_136976 ) ) ( not ( = ?auto_136974 ?auto_136975 ) ) ( not ( = ?auto_136969 ?auto_136972 ) ) ( not ( = ?auto_136969 ?auto_136976 ) ) ( not ( = ?auto_136969 ?auto_136975 ) ) ( not ( = ?auto_136972 ?auto_136976 ) ) ( not ( = ?auto_136972 ?auto_136975 ) ) ( not ( = ?auto_136976 ?auto_136975 ) ) ( not ( = ?auto_136968 ?auto_136976 ) ) ( not ( = ?auto_136968 ?auto_136973 ) ) ( not ( = ?auto_136968 ?auto_136974 ) ) ( not ( = ?auto_136968 ?auto_136969 ) ) ( not ( = ?auto_136968 ?auto_136972 ) ) ( not ( = ?auto_136970 ?auto_136976 ) ) ( not ( = ?auto_136970 ?auto_136973 ) ) ( not ( = ?auto_136970 ?auto_136974 ) ) ( not ( = ?auto_136970 ?auto_136969 ) ) ( not ( = ?auto_136970 ?auto_136972 ) ) ( not ( = ?auto_136971 ?auto_136976 ) ) ( not ( = ?auto_136971 ?auto_136973 ) ) ( not ( = ?auto_136971 ?auto_136974 ) ) ( not ( = ?auto_136971 ?auto_136969 ) ) ( not ( = ?auto_136971 ?auto_136972 ) ) ( ON ?auto_136975 ?auto_136971 ) ( ON ?auto_136976 ?auto_136975 ) ( CLEAR ?auto_136976 ) ( HOLDING ?auto_136972 ) ( CLEAR ?auto_136969 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_136973 ?auto_136974 ?auto_136969 ?auto_136972 )
      ( MAKE-1PILE ?auto_136968 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_136977 - BLOCK
    )
    :vars
    (
      ?auto_136979 - BLOCK
      ?auto_136980 - BLOCK
      ?auto_136978 - BLOCK
      ?auto_136982 - BLOCK
      ?auto_136984 - BLOCK
      ?auto_136981 - BLOCK
      ?auto_136985 - BLOCK
      ?auto_136983 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_136977 ?auto_136979 ) ( not ( = ?auto_136977 ?auto_136979 ) ) ( not ( = ?auto_136977 ?auto_136980 ) ) ( not ( = ?auto_136977 ?auto_136978 ) ) ( not ( = ?auto_136979 ?auto_136980 ) ) ( not ( = ?auto_136979 ?auto_136978 ) ) ( not ( = ?auto_136980 ?auto_136978 ) ) ( ON ?auto_136980 ?auto_136977 ) ( ON-TABLE ?auto_136979 ) ( ON-TABLE ?auto_136982 ) ( ON ?auto_136984 ?auto_136982 ) ( ON ?auto_136981 ?auto_136984 ) ( not ( = ?auto_136982 ?auto_136984 ) ) ( not ( = ?auto_136982 ?auto_136981 ) ) ( not ( = ?auto_136982 ?auto_136985 ) ) ( not ( = ?auto_136982 ?auto_136983 ) ) ( not ( = ?auto_136982 ?auto_136978 ) ) ( not ( = ?auto_136984 ?auto_136981 ) ) ( not ( = ?auto_136984 ?auto_136985 ) ) ( not ( = ?auto_136984 ?auto_136983 ) ) ( not ( = ?auto_136984 ?auto_136978 ) ) ( not ( = ?auto_136981 ?auto_136985 ) ) ( not ( = ?auto_136981 ?auto_136983 ) ) ( not ( = ?auto_136981 ?auto_136978 ) ) ( not ( = ?auto_136985 ?auto_136983 ) ) ( not ( = ?auto_136985 ?auto_136978 ) ) ( not ( = ?auto_136983 ?auto_136978 ) ) ( not ( = ?auto_136977 ?auto_136983 ) ) ( not ( = ?auto_136977 ?auto_136982 ) ) ( not ( = ?auto_136977 ?auto_136984 ) ) ( not ( = ?auto_136977 ?auto_136981 ) ) ( not ( = ?auto_136977 ?auto_136985 ) ) ( not ( = ?auto_136979 ?auto_136983 ) ) ( not ( = ?auto_136979 ?auto_136982 ) ) ( not ( = ?auto_136979 ?auto_136984 ) ) ( not ( = ?auto_136979 ?auto_136981 ) ) ( not ( = ?auto_136979 ?auto_136985 ) ) ( not ( = ?auto_136980 ?auto_136983 ) ) ( not ( = ?auto_136980 ?auto_136982 ) ) ( not ( = ?auto_136980 ?auto_136984 ) ) ( not ( = ?auto_136980 ?auto_136981 ) ) ( not ( = ?auto_136980 ?auto_136985 ) ) ( ON ?auto_136978 ?auto_136980 ) ( ON ?auto_136983 ?auto_136978 ) ( CLEAR ?auto_136981 ) ( ON ?auto_136985 ?auto_136983 ) ( CLEAR ?auto_136985 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_136979 ?auto_136977 ?auto_136980 ?auto_136978 ?auto_136983 )
      ( MAKE-1PILE ?auto_136977 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_136986 - BLOCK
    )
    :vars
    (
      ?auto_136993 - BLOCK
      ?auto_136987 - BLOCK
      ?auto_136994 - BLOCK
      ?auto_136992 - BLOCK
      ?auto_136988 - BLOCK
      ?auto_136989 - BLOCK
      ?auto_136991 - BLOCK
      ?auto_136990 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_136986 ?auto_136993 ) ( not ( = ?auto_136986 ?auto_136993 ) ) ( not ( = ?auto_136986 ?auto_136987 ) ) ( not ( = ?auto_136986 ?auto_136994 ) ) ( not ( = ?auto_136993 ?auto_136987 ) ) ( not ( = ?auto_136993 ?auto_136994 ) ) ( not ( = ?auto_136987 ?auto_136994 ) ) ( ON ?auto_136987 ?auto_136986 ) ( ON-TABLE ?auto_136993 ) ( ON-TABLE ?auto_136992 ) ( ON ?auto_136988 ?auto_136992 ) ( not ( = ?auto_136992 ?auto_136988 ) ) ( not ( = ?auto_136992 ?auto_136989 ) ) ( not ( = ?auto_136992 ?auto_136991 ) ) ( not ( = ?auto_136992 ?auto_136990 ) ) ( not ( = ?auto_136992 ?auto_136994 ) ) ( not ( = ?auto_136988 ?auto_136989 ) ) ( not ( = ?auto_136988 ?auto_136991 ) ) ( not ( = ?auto_136988 ?auto_136990 ) ) ( not ( = ?auto_136988 ?auto_136994 ) ) ( not ( = ?auto_136989 ?auto_136991 ) ) ( not ( = ?auto_136989 ?auto_136990 ) ) ( not ( = ?auto_136989 ?auto_136994 ) ) ( not ( = ?auto_136991 ?auto_136990 ) ) ( not ( = ?auto_136991 ?auto_136994 ) ) ( not ( = ?auto_136990 ?auto_136994 ) ) ( not ( = ?auto_136986 ?auto_136990 ) ) ( not ( = ?auto_136986 ?auto_136992 ) ) ( not ( = ?auto_136986 ?auto_136988 ) ) ( not ( = ?auto_136986 ?auto_136989 ) ) ( not ( = ?auto_136986 ?auto_136991 ) ) ( not ( = ?auto_136993 ?auto_136990 ) ) ( not ( = ?auto_136993 ?auto_136992 ) ) ( not ( = ?auto_136993 ?auto_136988 ) ) ( not ( = ?auto_136993 ?auto_136989 ) ) ( not ( = ?auto_136993 ?auto_136991 ) ) ( not ( = ?auto_136987 ?auto_136990 ) ) ( not ( = ?auto_136987 ?auto_136992 ) ) ( not ( = ?auto_136987 ?auto_136988 ) ) ( not ( = ?auto_136987 ?auto_136989 ) ) ( not ( = ?auto_136987 ?auto_136991 ) ) ( ON ?auto_136994 ?auto_136987 ) ( ON ?auto_136990 ?auto_136994 ) ( ON ?auto_136991 ?auto_136990 ) ( CLEAR ?auto_136991 ) ( HOLDING ?auto_136989 ) ( CLEAR ?auto_136988 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_136992 ?auto_136988 ?auto_136989 )
      ( MAKE-1PILE ?auto_136986 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_136995 - BLOCK
    )
    :vars
    (
      ?auto_137002 - BLOCK
      ?auto_137003 - BLOCK
      ?auto_136998 - BLOCK
      ?auto_137000 - BLOCK
      ?auto_136997 - BLOCK
      ?auto_136996 - BLOCK
      ?auto_136999 - BLOCK
      ?auto_137001 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_136995 ?auto_137002 ) ( not ( = ?auto_136995 ?auto_137002 ) ) ( not ( = ?auto_136995 ?auto_137003 ) ) ( not ( = ?auto_136995 ?auto_136998 ) ) ( not ( = ?auto_137002 ?auto_137003 ) ) ( not ( = ?auto_137002 ?auto_136998 ) ) ( not ( = ?auto_137003 ?auto_136998 ) ) ( ON ?auto_137003 ?auto_136995 ) ( ON-TABLE ?auto_137002 ) ( ON-TABLE ?auto_137000 ) ( ON ?auto_136997 ?auto_137000 ) ( not ( = ?auto_137000 ?auto_136997 ) ) ( not ( = ?auto_137000 ?auto_136996 ) ) ( not ( = ?auto_137000 ?auto_136999 ) ) ( not ( = ?auto_137000 ?auto_137001 ) ) ( not ( = ?auto_137000 ?auto_136998 ) ) ( not ( = ?auto_136997 ?auto_136996 ) ) ( not ( = ?auto_136997 ?auto_136999 ) ) ( not ( = ?auto_136997 ?auto_137001 ) ) ( not ( = ?auto_136997 ?auto_136998 ) ) ( not ( = ?auto_136996 ?auto_136999 ) ) ( not ( = ?auto_136996 ?auto_137001 ) ) ( not ( = ?auto_136996 ?auto_136998 ) ) ( not ( = ?auto_136999 ?auto_137001 ) ) ( not ( = ?auto_136999 ?auto_136998 ) ) ( not ( = ?auto_137001 ?auto_136998 ) ) ( not ( = ?auto_136995 ?auto_137001 ) ) ( not ( = ?auto_136995 ?auto_137000 ) ) ( not ( = ?auto_136995 ?auto_136997 ) ) ( not ( = ?auto_136995 ?auto_136996 ) ) ( not ( = ?auto_136995 ?auto_136999 ) ) ( not ( = ?auto_137002 ?auto_137001 ) ) ( not ( = ?auto_137002 ?auto_137000 ) ) ( not ( = ?auto_137002 ?auto_136997 ) ) ( not ( = ?auto_137002 ?auto_136996 ) ) ( not ( = ?auto_137002 ?auto_136999 ) ) ( not ( = ?auto_137003 ?auto_137001 ) ) ( not ( = ?auto_137003 ?auto_137000 ) ) ( not ( = ?auto_137003 ?auto_136997 ) ) ( not ( = ?auto_137003 ?auto_136996 ) ) ( not ( = ?auto_137003 ?auto_136999 ) ) ( ON ?auto_136998 ?auto_137003 ) ( ON ?auto_137001 ?auto_136998 ) ( ON ?auto_136999 ?auto_137001 ) ( CLEAR ?auto_136997 ) ( ON ?auto_136996 ?auto_136999 ) ( CLEAR ?auto_136996 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_137002 ?auto_136995 ?auto_137003 ?auto_136998 ?auto_137001 ?auto_136999 )
      ( MAKE-1PILE ?auto_136995 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_137004 - BLOCK
    )
    :vars
    (
      ?auto_137008 - BLOCK
      ?auto_137011 - BLOCK
      ?auto_137006 - BLOCK
      ?auto_137005 - BLOCK
      ?auto_137012 - BLOCK
      ?auto_137009 - BLOCK
      ?auto_137007 - BLOCK
      ?auto_137010 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_137004 ?auto_137008 ) ( not ( = ?auto_137004 ?auto_137008 ) ) ( not ( = ?auto_137004 ?auto_137011 ) ) ( not ( = ?auto_137004 ?auto_137006 ) ) ( not ( = ?auto_137008 ?auto_137011 ) ) ( not ( = ?auto_137008 ?auto_137006 ) ) ( not ( = ?auto_137011 ?auto_137006 ) ) ( ON ?auto_137011 ?auto_137004 ) ( ON-TABLE ?auto_137008 ) ( ON-TABLE ?auto_137005 ) ( not ( = ?auto_137005 ?auto_137012 ) ) ( not ( = ?auto_137005 ?auto_137009 ) ) ( not ( = ?auto_137005 ?auto_137007 ) ) ( not ( = ?auto_137005 ?auto_137010 ) ) ( not ( = ?auto_137005 ?auto_137006 ) ) ( not ( = ?auto_137012 ?auto_137009 ) ) ( not ( = ?auto_137012 ?auto_137007 ) ) ( not ( = ?auto_137012 ?auto_137010 ) ) ( not ( = ?auto_137012 ?auto_137006 ) ) ( not ( = ?auto_137009 ?auto_137007 ) ) ( not ( = ?auto_137009 ?auto_137010 ) ) ( not ( = ?auto_137009 ?auto_137006 ) ) ( not ( = ?auto_137007 ?auto_137010 ) ) ( not ( = ?auto_137007 ?auto_137006 ) ) ( not ( = ?auto_137010 ?auto_137006 ) ) ( not ( = ?auto_137004 ?auto_137010 ) ) ( not ( = ?auto_137004 ?auto_137005 ) ) ( not ( = ?auto_137004 ?auto_137012 ) ) ( not ( = ?auto_137004 ?auto_137009 ) ) ( not ( = ?auto_137004 ?auto_137007 ) ) ( not ( = ?auto_137008 ?auto_137010 ) ) ( not ( = ?auto_137008 ?auto_137005 ) ) ( not ( = ?auto_137008 ?auto_137012 ) ) ( not ( = ?auto_137008 ?auto_137009 ) ) ( not ( = ?auto_137008 ?auto_137007 ) ) ( not ( = ?auto_137011 ?auto_137010 ) ) ( not ( = ?auto_137011 ?auto_137005 ) ) ( not ( = ?auto_137011 ?auto_137012 ) ) ( not ( = ?auto_137011 ?auto_137009 ) ) ( not ( = ?auto_137011 ?auto_137007 ) ) ( ON ?auto_137006 ?auto_137011 ) ( ON ?auto_137010 ?auto_137006 ) ( ON ?auto_137007 ?auto_137010 ) ( ON ?auto_137009 ?auto_137007 ) ( CLEAR ?auto_137009 ) ( HOLDING ?auto_137012 ) ( CLEAR ?auto_137005 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_137005 ?auto_137012 )
      ( MAKE-1PILE ?auto_137004 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_137013 - BLOCK
    )
    :vars
    (
      ?auto_137017 - BLOCK
      ?auto_137020 - BLOCK
      ?auto_137021 - BLOCK
      ?auto_137018 - BLOCK
      ?auto_137016 - BLOCK
      ?auto_137015 - BLOCK
      ?auto_137014 - BLOCK
      ?auto_137019 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_137013 ?auto_137017 ) ( not ( = ?auto_137013 ?auto_137017 ) ) ( not ( = ?auto_137013 ?auto_137020 ) ) ( not ( = ?auto_137013 ?auto_137021 ) ) ( not ( = ?auto_137017 ?auto_137020 ) ) ( not ( = ?auto_137017 ?auto_137021 ) ) ( not ( = ?auto_137020 ?auto_137021 ) ) ( ON ?auto_137020 ?auto_137013 ) ( ON-TABLE ?auto_137017 ) ( ON-TABLE ?auto_137018 ) ( not ( = ?auto_137018 ?auto_137016 ) ) ( not ( = ?auto_137018 ?auto_137015 ) ) ( not ( = ?auto_137018 ?auto_137014 ) ) ( not ( = ?auto_137018 ?auto_137019 ) ) ( not ( = ?auto_137018 ?auto_137021 ) ) ( not ( = ?auto_137016 ?auto_137015 ) ) ( not ( = ?auto_137016 ?auto_137014 ) ) ( not ( = ?auto_137016 ?auto_137019 ) ) ( not ( = ?auto_137016 ?auto_137021 ) ) ( not ( = ?auto_137015 ?auto_137014 ) ) ( not ( = ?auto_137015 ?auto_137019 ) ) ( not ( = ?auto_137015 ?auto_137021 ) ) ( not ( = ?auto_137014 ?auto_137019 ) ) ( not ( = ?auto_137014 ?auto_137021 ) ) ( not ( = ?auto_137019 ?auto_137021 ) ) ( not ( = ?auto_137013 ?auto_137019 ) ) ( not ( = ?auto_137013 ?auto_137018 ) ) ( not ( = ?auto_137013 ?auto_137016 ) ) ( not ( = ?auto_137013 ?auto_137015 ) ) ( not ( = ?auto_137013 ?auto_137014 ) ) ( not ( = ?auto_137017 ?auto_137019 ) ) ( not ( = ?auto_137017 ?auto_137018 ) ) ( not ( = ?auto_137017 ?auto_137016 ) ) ( not ( = ?auto_137017 ?auto_137015 ) ) ( not ( = ?auto_137017 ?auto_137014 ) ) ( not ( = ?auto_137020 ?auto_137019 ) ) ( not ( = ?auto_137020 ?auto_137018 ) ) ( not ( = ?auto_137020 ?auto_137016 ) ) ( not ( = ?auto_137020 ?auto_137015 ) ) ( not ( = ?auto_137020 ?auto_137014 ) ) ( ON ?auto_137021 ?auto_137020 ) ( ON ?auto_137019 ?auto_137021 ) ( ON ?auto_137014 ?auto_137019 ) ( ON ?auto_137015 ?auto_137014 ) ( CLEAR ?auto_137018 ) ( ON ?auto_137016 ?auto_137015 ) ( CLEAR ?auto_137016 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_137017 ?auto_137013 ?auto_137020 ?auto_137021 ?auto_137019 ?auto_137014 ?auto_137015 )
      ( MAKE-1PILE ?auto_137013 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_137022 - BLOCK
    )
    :vars
    (
      ?auto_137026 - BLOCK
      ?auto_137030 - BLOCK
      ?auto_137028 - BLOCK
      ?auto_137029 - BLOCK
      ?auto_137023 - BLOCK
      ?auto_137025 - BLOCK
      ?auto_137024 - BLOCK
      ?auto_137027 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_137022 ?auto_137026 ) ( not ( = ?auto_137022 ?auto_137026 ) ) ( not ( = ?auto_137022 ?auto_137030 ) ) ( not ( = ?auto_137022 ?auto_137028 ) ) ( not ( = ?auto_137026 ?auto_137030 ) ) ( not ( = ?auto_137026 ?auto_137028 ) ) ( not ( = ?auto_137030 ?auto_137028 ) ) ( ON ?auto_137030 ?auto_137022 ) ( ON-TABLE ?auto_137026 ) ( not ( = ?auto_137029 ?auto_137023 ) ) ( not ( = ?auto_137029 ?auto_137025 ) ) ( not ( = ?auto_137029 ?auto_137024 ) ) ( not ( = ?auto_137029 ?auto_137027 ) ) ( not ( = ?auto_137029 ?auto_137028 ) ) ( not ( = ?auto_137023 ?auto_137025 ) ) ( not ( = ?auto_137023 ?auto_137024 ) ) ( not ( = ?auto_137023 ?auto_137027 ) ) ( not ( = ?auto_137023 ?auto_137028 ) ) ( not ( = ?auto_137025 ?auto_137024 ) ) ( not ( = ?auto_137025 ?auto_137027 ) ) ( not ( = ?auto_137025 ?auto_137028 ) ) ( not ( = ?auto_137024 ?auto_137027 ) ) ( not ( = ?auto_137024 ?auto_137028 ) ) ( not ( = ?auto_137027 ?auto_137028 ) ) ( not ( = ?auto_137022 ?auto_137027 ) ) ( not ( = ?auto_137022 ?auto_137029 ) ) ( not ( = ?auto_137022 ?auto_137023 ) ) ( not ( = ?auto_137022 ?auto_137025 ) ) ( not ( = ?auto_137022 ?auto_137024 ) ) ( not ( = ?auto_137026 ?auto_137027 ) ) ( not ( = ?auto_137026 ?auto_137029 ) ) ( not ( = ?auto_137026 ?auto_137023 ) ) ( not ( = ?auto_137026 ?auto_137025 ) ) ( not ( = ?auto_137026 ?auto_137024 ) ) ( not ( = ?auto_137030 ?auto_137027 ) ) ( not ( = ?auto_137030 ?auto_137029 ) ) ( not ( = ?auto_137030 ?auto_137023 ) ) ( not ( = ?auto_137030 ?auto_137025 ) ) ( not ( = ?auto_137030 ?auto_137024 ) ) ( ON ?auto_137028 ?auto_137030 ) ( ON ?auto_137027 ?auto_137028 ) ( ON ?auto_137024 ?auto_137027 ) ( ON ?auto_137025 ?auto_137024 ) ( ON ?auto_137023 ?auto_137025 ) ( CLEAR ?auto_137023 ) ( HOLDING ?auto_137029 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_137029 )
      ( MAKE-1PILE ?auto_137022 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_137031 - BLOCK
    )
    :vars
    (
      ?auto_137033 - BLOCK
      ?auto_137037 - BLOCK
      ?auto_137039 - BLOCK
      ?auto_137038 - BLOCK
      ?auto_137034 - BLOCK
      ?auto_137036 - BLOCK
      ?auto_137032 - BLOCK
      ?auto_137035 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_137031 ?auto_137033 ) ( not ( = ?auto_137031 ?auto_137033 ) ) ( not ( = ?auto_137031 ?auto_137037 ) ) ( not ( = ?auto_137031 ?auto_137039 ) ) ( not ( = ?auto_137033 ?auto_137037 ) ) ( not ( = ?auto_137033 ?auto_137039 ) ) ( not ( = ?auto_137037 ?auto_137039 ) ) ( ON ?auto_137037 ?auto_137031 ) ( ON-TABLE ?auto_137033 ) ( not ( = ?auto_137038 ?auto_137034 ) ) ( not ( = ?auto_137038 ?auto_137036 ) ) ( not ( = ?auto_137038 ?auto_137032 ) ) ( not ( = ?auto_137038 ?auto_137035 ) ) ( not ( = ?auto_137038 ?auto_137039 ) ) ( not ( = ?auto_137034 ?auto_137036 ) ) ( not ( = ?auto_137034 ?auto_137032 ) ) ( not ( = ?auto_137034 ?auto_137035 ) ) ( not ( = ?auto_137034 ?auto_137039 ) ) ( not ( = ?auto_137036 ?auto_137032 ) ) ( not ( = ?auto_137036 ?auto_137035 ) ) ( not ( = ?auto_137036 ?auto_137039 ) ) ( not ( = ?auto_137032 ?auto_137035 ) ) ( not ( = ?auto_137032 ?auto_137039 ) ) ( not ( = ?auto_137035 ?auto_137039 ) ) ( not ( = ?auto_137031 ?auto_137035 ) ) ( not ( = ?auto_137031 ?auto_137038 ) ) ( not ( = ?auto_137031 ?auto_137034 ) ) ( not ( = ?auto_137031 ?auto_137036 ) ) ( not ( = ?auto_137031 ?auto_137032 ) ) ( not ( = ?auto_137033 ?auto_137035 ) ) ( not ( = ?auto_137033 ?auto_137038 ) ) ( not ( = ?auto_137033 ?auto_137034 ) ) ( not ( = ?auto_137033 ?auto_137036 ) ) ( not ( = ?auto_137033 ?auto_137032 ) ) ( not ( = ?auto_137037 ?auto_137035 ) ) ( not ( = ?auto_137037 ?auto_137038 ) ) ( not ( = ?auto_137037 ?auto_137034 ) ) ( not ( = ?auto_137037 ?auto_137036 ) ) ( not ( = ?auto_137037 ?auto_137032 ) ) ( ON ?auto_137039 ?auto_137037 ) ( ON ?auto_137035 ?auto_137039 ) ( ON ?auto_137032 ?auto_137035 ) ( ON ?auto_137036 ?auto_137032 ) ( ON ?auto_137034 ?auto_137036 ) ( ON ?auto_137038 ?auto_137034 ) ( CLEAR ?auto_137038 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_137033 ?auto_137031 ?auto_137037 ?auto_137039 ?auto_137035 ?auto_137032 ?auto_137036 ?auto_137034 )
      ( MAKE-1PILE ?auto_137031 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_137053 - BLOCK
      ?auto_137054 - BLOCK
      ?auto_137055 - BLOCK
      ?auto_137056 - BLOCK
      ?auto_137057 - BLOCK
      ?auto_137058 - BLOCK
    )
    :vars
    (
      ?auto_137059 - BLOCK
      ?auto_137060 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_137059 ?auto_137058 ) ( CLEAR ?auto_137059 ) ( ON-TABLE ?auto_137053 ) ( ON ?auto_137054 ?auto_137053 ) ( ON ?auto_137055 ?auto_137054 ) ( ON ?auto_137056 ?auto_137055 ) ( ON ?auto_137057 ?auto_137056 ) ( ON ?auto_137058 ?auto_137057 ) ( not ( = ?auto_137053 ?auto_137054 ) ) ( not ( = ?auto_137053 ?auto_137055 ) ) ( not ( = ?auto_137053 ?auto_137056 ) ) ( not ( = ?auto_137053 ?auto_137057 ) ) ( not ( = ?auto_137053 ?auto_137058 ) ) ( not ( = ?auto_137053 ?auto_137059 ) ) ( not ( = ?auto_137054 ?auto_137055 ) ) ( not ( = ?auto_137054 ?auto_137056 ) ) ( not ( = ?auto_137054 ?auto_137057 ) ) ( not ( = ?auto_137054 ?auto_137058 ) ) ( not ( = ?auto_137054 ?auto_137059 ) ) ( not ( = ?auto_137055 ?auto_137056 ) ) ( not ( = ?auto_137055 ?auto_137057 ) ) ( not ( = ?auto_137055 ?auto_137058 ) ) ( not ( = ?auto_137055 ?auto_137059 ) ) ( not ( = ?auto_137056 ?auto_137057 ) ) ( not ( = ?auto_137056 ?auto_137058 ) ) ( not ( = ?auto_137056 ?auto_137059 ) ) ( not ( = ?auto_137057 ?auto_137058 ) ) ( not ( = ?auto_137057 ?auto_137059 ) ) ( not ( = ?auto_137058 ?auto_137059 ) ) ( HOLDING ?auto_137060 ) ( not ( = ?auto_137053 ?auto_137060 ) ) ( not ( = ?auto_137054 ?auto_137060 ) ) ( not ( = ?auto_137055 ?auto_137060 ) ) ( not ( = ?auto_137056 ?auto_137060 ) ) ( not ( = ?auto_137057 ?auto_137060 ) ) ( not ( = ?auto_137058 ?auto_137060 ) ) ( not ( = ?auto_137059 ?auto_137060 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_137060 )
      ( MAKE-6PILE ?auto_137053 ?auto_137054 ?auto_137055 ?auto_137056 ?auto_137057 ?auto_137058 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_137178 - BLOCK
      ?auto_137179 - BLOCK
    )
    :vars
    (
      ?auto_137180 - BLOCK
      ?auto_137183 - BLOCK
      ?auto_137185 - BLOCK
      ?auto_137182 - BLOCK
      ?auto_137184 - BLOCK
      ?auto_137181 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_137178 ?auto_137179 ) ) ( ON ?auto_137179 ?auto_137180 ) ( not ( = ?auto_137178 ?auto_137180 ) ) ( not ( = ?auto_137179 ?auto_137180 ) ) ( ON ?auto_137178 ?auto_137179 ) ( CLEAR ?auto_137178 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_137183 ) ( ON ?auto_137185 ?auto_137183 ) ( ON ?auto_137182 ?auto_137185 ) ( ON ?auto_137184 ?auto_137182 ) ( ON ?auto_137181 ?auto_137184 ) ( ON ?auto_137180 ?auto_137181 ) ( not ( = ?auto_137183 ?auto_137185 ) ) ( not ( = ?auto_137183 ?auto_137182 ) ) ( not ( = ?auto_137183 ?auto_137184 ) ) ( not ( = ?auto_137183 ?auto_137181 ) ) ( not ( = ?auto_137183 ?auto_137180 ) ) ( not ( = ?auto_137183 ?auto_137179 ) ) ( not ( = ?auto_137183 ?auto_137178 ) ) ( not ( = ?auto_137185 ?auto_137182 ) ) ( not ( = ?auto_137185 ?auto_137184 ) ) ( not ( = ?auto_137185 ?auto_137181 ) ) ( not ( = ?auto_137185 ?auto_137180 ) ) ( not ( = ?auto_137185 ?auto_137179 ) ) ( not ( = ?auto_137185 ?auto_137178 ) ) ( not ( = ?auto_137182 ?auto_137184 ) ) ( not ( = ?auto_137182 ?auto_137181 ) ) ( not ( = ?auto_137182 ?auto_137180 ) ) ( not ( = ?auto_137182 ?auto_137179 ) ) ( not ( = ?auto_137182 ?auto_137178 ) ) ( not ( = ?auto_137184 ?auto_137181 ) ) ( not ( = ?auto_137184 ?auto_137180 ) ) ( not ( = ?auto_137184 ?auto_137179 ) ) ( not ( = ?auto_137184 ?auto_137178 ) ) ( not ( = ?auto_137181 ?auto_137180 ) ) ( not ( = ?auto_137181 ?auto_137179 ) ) ( not ( = ?auto_137181 ?auto_137178 ) ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_137183 ?auto_137185 ?auto_137182 ?auto_137184 ?auto_137181 ?auto_137180 ?auto_137179 )
      ( MAKE-2PILE ?auto_137178 ?auto_137179 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_137188 - BLOCK
      ?auto_137189 - BLOCK
    )
    :vars
    (
      ?auto_137190 - BLOCK
      ?auto_137191 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_137188 ?auto_137189 ) ) ( ON ?auto_137189 ?auto_137190 ) ( CLEAR ?auto_137189 ) ( not ( = ?auto_137188 ?auto_137190 ) ) ( not ( = ?auto_137189 ?auto_137190 ) ) ( ON ?auto_137188 ?auto_137191 ) ( CLEAR ?auto_137188 ) ( HAND-EMPTY ) ( not ( = ?auto_137188 ?auto_137191 ) ) ( not ( = ?auto_137189 ?auto_137191 ) ) ( not ( = ?auto_137190 ?auto_137191 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_137188 ?auto_137191 )
      ( MAKE-2PILE ?auto_137188 ?auto_137189 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_137192 - BLOCK
      ?auto_137193 - BLOCK
    )
    :vars
    (
      ?auto_137194 - BLOCK
      ?auto_137195 - BLOCK
      ?auto_137197 - BLOCK
      ?auto_137199 - BLOCK
      ?auto_137200 - BLOCK
      ?auto_137198 - BLOCK
      ?auto_137196 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_137192 ?auto_137193 ) ) ( not ( = ?auto_137192 ?auto_137194 ) ) ( not ( = ?auto_137193 ?auto_137194 ) ) ( ON ?auto_137192 ?auto_137195 ) ( CLEAR ?auto_137192 ) ( not ( = ?auto_137192 ?auto_137195 ) ) ( not ( = ?auto_137193 ?auto_137195 ) ) ( not ( = ?auto_137194 ?auto_137195 ) ) ( HOLDING ?auto_137193 ) ( CLEAR ?auto_137194 ) ( ON-TABLE ?auto_137197 ) ( ON ?auto_137199 ?auto_137197 ) ( ON ?auto_137200 ?auto_137199 ) ( ON ?auto_137198 ?auto_137200 ) ( ON ?auto_137196 ?auto_137198 ) ( ON ?auto_137194 ?auto_137196 ) ( not ( = ?auto_137197 ?auto_137199 ) ) ( not ( = ?auto_137197 ?auto_137200 ) ) ( not ( = ?auto_137197 ?auto_137198 ) ) ( not ( = ?auto_137197 ?auto_137196 ) ) ( not ( = ?auto_137197 ?auto_137194 ) ) ( not ( = ?auto_137197 ?auto_137193 ) ) ( not ( = ?auto_137199 ?auto_137200 ) ) ( not ( = ?auto_137199 ?auto_137198 ) ) ( not ( = ?auto_137199 ?auto_137196 ) ) ( not ( = ?auto_137199 ?auto_137194 ) ) ( not ( = ?auto_137199 ?auto_137193 ) ) ( not ( = ?auto_137200 ?auto_137198 ) ) ( not ( = ?auto_137200 ?auto_137196 ) ) ( not ( = ?auto_137200 ?auto_137194 ) ) ( not ( = ?auto_137200 ?auto_137193 ) ) ( not ( = ?auto_137198 ?auto_137196 ) ) ( not ( = ?auto_137198 ?auto_137194 ) ) ( not ( = ?auto_137198 ?auto_137193 ) ) ( not ( = ?auto_137196 ?auto_137194 ) ) ( not ( = ?auto_137196 ?auto_137193 ) ) ( not ( = ?auto_137192 ?auto_137197 ) ) ( not ( = ?auto_137192 ?auto_137199 ) ) ( not ( = ?auto_137192 ?auto_137200 ) ) ( not ( = ?auto_137192 ?auto_137198 ) ) ( not ( = ?auto_137192 ?auto_137196 ) ) ( not ( = ?auto_137195 ?auto_137197 ) ) ( not ( = ?auto_137195 ?auto_137199 ) ) ( not ( = ?auto_137195 ?auto_137200 ) ) ( not ( = ?auto_137195 ?auto_137198 ) ) ( not ( = ?auto_137195 ?auto_137196 ) ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_137197 ?auto_137199 ?auto_137200 ?auto_137198 ?auto_137196 ?auto_137194 ?auto_137193 )
      ( MAKE-2PILE ?auto_137192 ?auto_137193 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_137201 - BLOCK
      ?auto_137202 - BLOCK
    )
    :vars
    (
      ?auto_137207 - BLOCK
      ?auto_137209 - BLOCK
      ?auto_137205 - BLOCK
      ?auto_137203 - BLOCK
      ?auto_137204 - BLOCK
      ?auto_137208 - BLOCK
      ?auto_137206 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_137201 ?auto_137202 ) ) ( not ( = ?auto_137201 ?auto_137207 ) ) ( not ( = ?auto_137202 ?auto_137207 ) ) ( ON ?auto_137201 ?auto_137209 ) ( not ( = ?auto_137201 ?auto_137209 ) ) ( not ( = ?auto_137202 ?auto_137209 ) ) ( not ( = ?auto_137207 ?auto_137209 ) ) ( CLEAR ?auto_137207 ) ( ON-TABLE ?auto_137205 ) ( ON ?auto_137203 ?auto_137205 ) ( ON ?auto_137204 ?auto_137203 ) ( ON ?auto_137208 ?auto_137204 ) ( ON ?auto_137206 ?auto_137208 ) ( ON ?auto_137207 ?auto_137206 ) ( not ( = ?auto_137205 ?auto_137203 ) ) ( not ( = ?auto_137205 ?auto_137204 ) ) ( not ( = ?auto_137205 ?auto_137208 ) ) ( not ( = ?auto_137205 ?auto_137206 ) ) ( not ( = ?auto_137205 ?auto_137207 ) ) ( not ( = ?auto_137205 ?auto_137202 ) ) ( not ( = ?auto_137203 ?auto_137204 ) ) ( not ( = ?auto_137203 ?auto_137208 ) ) ( not ( = ?auto_137203 ?auto_137206 ) ) ( not ( = ?auto_137203 ?auto_137207 ) ) ( not ( = ?auto_137203 ?auto_137202 ) ) ( not ( = ?auto_137204 ?auto_137208 ) ) ( not ( = ?auto_137204 ?auto_137206 ) ) ( not ( = ?auto_137204 ?auto_137207 ) ) ( not ( = ?auto_137204 ?auto_137202 ) ) ( not ( = ?auto_137208 ?auto_137206 ) ) ( not ( = ?auto_137208 ?auto_137207 ) ) ( not ( = ?auto_137208 ?auto_137202 ) ) ( not ( = ?auto_137206 ?auto_137207 ) ) ( not ( = ?auto_137206 ?auto_137202 ) ) ( not ( = ?auto_137201 ?auto_137205 ) ) ( not ( = ?auto_137201 ?auto_137203 ) ) ( not ( = ?auto_137201 ?auto_137204 ) ) ( not ( = ?auto_137201 ?auto_137208 ) ) ( not ( = ?auto_137201 ?auto_137206 ) ) ( not ( = ?auto_137209 ?auto_137205 ) ) ( not ( = ?auto_137209 ?auto_137203 ) ) ( not ( = ?auto_137209 ?auto_137204 ) ) ( not ( = ?auto_137209 ?auto_137208 ) ) ( not ( = ?auto_137209 ?auto_137206 ) ) ( ON ?auto_137202 ?auto_137201 ) ( CLEAR ?auto_137202 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_137209 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_137209 ?auto_137201 )
      ( MAKE-2PILE ?auto_137201 ?auto_137202 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_137210 - BLOCK
      ?auto_137211 - BLOCK
    )
    :vars
    (
      ?auto_137213 - BLOCK
      ?auto_137216 - BLOCK
      ?auto_137218 - BLOCK
      ?auto_137215 - BLOCK
      ?auto_137217 - BLOCK
      ?auto_137214 - BLOCK
      ?auto_137212 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_137210 ?auto_137211 ) ) ( not ( = ?auto_137210 ?auto_137213 ) ) ( not ( = ?auto_137211 ?auto_137213 ) ) ( ON ?auto_137210 ?auto_137216 ) ( not ( = ?auto_137210 ?auto_137216 ) ) ( not ( = ?auto_137211 ?auto_137216 ) ) ( not ( = ?auto_137213 ?auto_137216 ) ) ( ON-TABLE ?auto_137218 ) ( ON ?auto_137215 ?auto_137218 ) ( ON ?auto_137217 ?auto_137215 ) ( ON ?auto_137214 ?auto_137217 ) ( ON ?auto_137212 ?auto_137214 ) ( not ( = ?auto_137218 ?auto_137215 ) ) ( not ( = ?auto_137218 ?auto_137217 ) ) ( not ( = ?auto_137218 ?auto_137214 ) ) ( not ( = ?auto_137218 ?auto_137212 ) ) ( not ( = ?auto_137218 ?auto_137213 ) ) ( not ( = ?auto_137218 ?auto_137211 ) ) ( not ( = ?auto_137215 ?auto_137217 ) ) ( not ( = ?auto_137215 ?auto_137214 ) ) ( not ( = ?auto_137215 ?auto_137212 ) ) ( not ( = ?auto_137215 ?auto_137213 ) ) ( not ( = ?auto_137215 ?auto_137211 ) ) ( not ( = ?auto_137217 ?auto_137214 ) ) ( not ( = ?auto_137217 ?auto_137212 ) ) ( not ( = ?auto_137217 ?auto_137213 ) ) ( not ( = ?auto_137217 ?auto_137211 ) ) ( not ( = ?auto_137214 ?auto_137212 ) ) ( not ( = ?auto_137214 ?auto_137213 ) ) ( not ( = ?auto_137214 ?auto_137211 ) ) ( not ( = ?auto_137212 ?auto_137213 ) ) ( not ( = ?auto_137212 ?auto_137211 ) ) ( not ( = ?auto_137210 ?auto_137218 ) ) ( not ( = ?auto_137210 ?auto_137215 ) ) ( not ( = ?auto_137210 ?auto_137217 ) ) ( not ( = ?auto_137210 ?auto_137214 ) ) ( not ( = ?auto_137210 ?auto_137212 ) ) ( not ( = ?auto_137216 ?auto_137218 ) ) ( not ( = ?auto_137216 ?auto_137215 ) ) ( not ( = ?auto_137216 ?auto_137217 ) ) ( not ( = ?auto_137216 ?auto_137214 ) ) ( not ( = ?auto_137216 ?auto_137212 ) ) ( ON ?auto_137211 ?auto_137210 ) ( CLEAR ?auto_137211 ) ( ON-TABLE ?auto_137216 ) ( HOLDING ?auto_137213 ) ( CLEAR ?auto_137212 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_137218 ?auto_137215 ?auto_137217 ?auto_137214 ?auto_137212 ?auto_137213 )
      ( MAKE-2PILE ?auto_137210 ?auto_137211 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_137219 - BLOCK
      ?auto_137220 - BLOCK
    )
    :vars
    (
      ?auto_137226 - BLOCK
      ?auto_137224 - BLOCK
      ?auto_137221 - BLOCK
      ?auto_137223 - BLOCK
      ?auto_137222 - BLOCK
      ?auto_137227 - BLOCK
      ?auto_137225 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_137219 ?auto_137220 ) ) ( not ( = ?auto_137219 ?auto_137226 ) ) ( not ( = ?auto_137220 ?auto_137226 ) ) ( ON ?auto_137219 ?auto_137224 ) ( not ( = ?auto_137219 ?auto_137224 ) ) ( not ( = ?auto_137220 ?auto_137224 ) ) ( not ( = ?auto_137226 ?auto_137224 ) ) ( ON-TABLE ?auto_137221 ) ( ON ?auto_137223 ?auto_137221 ) ( ON ?auto_137222 ?auto_137223 ) ( ON ?auto_137227 ?auto_137222 ) ( ON ?auto_137225 ?auto_137227 ) ( not ( = ?auto_137221 ?auto_137223 ) ) ( not ( = ?auto_137221 ?auto_137222 ) ) ( not ( = ?auto_137221 ?auto_137227 ) ) ( not ( = ?auto_137221 ?auto_137225 ) ) ( not ( = ?auto_137221 ?auto_137226 ) ) ( not ( = ?auto_137221 ?auto_137220 ) ) ( not ( = ?auto_137223 ?auto_137222 ) ) ( not ( = ?auto_137223 ?auto_137227 ) ) ( not ( = ?auto_137223 ?auto_137225 ) ) ( not ( = ?auto_137223 ?auto_137226 ) ) ( not ( = ?auto_137223 ?auto_137220 ) ) ( not ( = ?auto_137222 ?auto_137227 ) ) ( not ( = ?auto_137222 ?auto_137225 ) ) ( not ( = ?auto_137222 ?auto_137226 ) ) ( not ( = ?auto_137222 ?auto_137220 ) ) ( not ( = ?auto_137227 ?auto_137225 ) ) ( not ( = ?auto_137227 ?auto_137226 ) ) ( not ( = ?auto_137227 ?auto_137220 ) ) ( not ( = ?auto_137225 ?auto_137226 ) ) ( not ( = ?auto_137225 ?auto_137220 ) ) ( not ( = ?auto_137219 ?auto_137221 ) ) ( not ( = ?auto_137219 ?auto_137223 ) ) ( not ( = ?auto_137219 ?auto_137222 ) ) ( not ( = ?auto_137219 ?auto_137227 ) ) ( not ( = ?auto_137219 ?auto_137225 ) ) ( not ( = ?auto_137224 ?auto_137221 ) ) ( not ( = ?auto_137224 ?auto_137223 ) ) ( not ( = ?auto_137224 ?auto_137222 ) ) ( not ( = ?auto_137224 ?auto_137227 ) ) ( not ( = ?auto_137224 ?auto_137225 ) ) ( ON ?auto_137220 ?auto_137219 ) ( ON-TABLE ?auto_137224 ) ( CLEAR ?auto_137225 ) ( ON ?auto_137226 ?auto_137220 ) ( CLEAR ?auto_137226 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_137224 ?auto_137219 ?auto_137220 )
      ( MAKE-2PILE ?auto_137219 ?auto_137220 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_137228 - BLOCK
      ?auto_137229 - BLOCK
    )
    :vars
    (
      ?auto_137235 - BLOCK
      ?auto_137230 - BLOCK
      ?auto_137233 - BLOCK
      ?auto_137232 - BLOCK
      ?auto_137234 - BLOCK
      ?auto_137231 - BLOCK
      ?auto_137236 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_137228 ?auto_137229 ) ) ( not ( = ?auto_137228 ?auto_137235 ) ) ( not ( = ?auto_137229 ?auto_137235 ) ) ( ON ?auto_137228 ?auto_137230 ) ( not ( = ?auto_137228 ?auto_137230 ) ) ( not ( = ?auto_137229 ?auto_137230 ) ) ( not ( = ?auto_137235 ?auto_137230 ) ) ( ON-TABLE ?auto_137233 ) ( ON ?auto_137232 ?auto_137233 ) ( ON ?auto_137234 ?auto_137232 ) ( ON ?auto_137231 ?auto_137234 ) ( not ( = ?auto_137233 ?auto_137232 ) ) ( not ( = ?auto_137233 ?auto_137234 ) ) ( not ( = ?auto_137233 ?auto_137231 ) ) ( not ( = ?auto_137233 ?auto_137236 ) ) ( not ( = ?auto_137233 ?auto_137235 ) ) ( not ( = ?auto_137233 ?auto_137229 ) ) ( not ( = ?auto_137232 ?auto_137234 ) ) ( not ( = ?auto_137232 ?auto_137231 ) ) ( not ( = ?auto_137232 ?auto_137236 ) ) ( not ( = ?auto_137232 ?auto_137235 ) ) ( not ( = ?auto_137232 ?auto_137229 ) ) ( not ( = ?auto_137234 ?auto_137231 ) ) ( not ( = ?auto_137234 ?auto_137236 ) ) ( not ( = ?auto_137234 ?auto_137235 ) ) ( not ( = ?auto_137234 ?auto_137229 ) ) ( not ( = ?auto_137231 ?auto_137236 ) ) ( not ( = ?auto_137231 ?auto_137235 ) ) ( not ( = ?auto_137231 ?auto_137229 ) ) ( not ( = ?auto_137236 ?auto_137235 ) ) ( not ( = ?auto_137236 ?auto_137229 ) ) ( not ( = ?auto_137228 ?auto_137233 ) ) ( not ( = ?auto_137228 ?auto_137232 ) ) ( not ( = ?auto_137228 ?auto_137234 ) ) ( not ( = ?auto_137228 ?auto_137231 ) ) ( not ( = ?auto_137228 ?auto_137236 ) ) ( not ( = ?auto_137230 ?auto_137233 ) ) ( not ( = ?auto_137230 ?auto_137232 ) ) ( not ( = ?auto_137230 ?auto_137234 ) ) ( not ( = ?auto_137230 ?auto_137231 ) ) ( not ( = ?auto_137230 ?auto_137236 ) ) ( ON ?auto_137229 ?auto_137228 ) ( ON-TABLE ?auto_137230 ) ( ON ?auto_137235 ?auto_137229 ) ( CLEAR ?auto_137235 ) ( HOLDING ?auto_137236 ) ( CLEAR ?auto_137231 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_137233 ?auto_137232 ?auto_137234 ?auto_137231 ?auto_137236 )
      ( MAKE-2PILE ?auto_137228 ?auto_137229 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_137237 - BLOCK
      ?auto_137238 - BLOCK
    )
    :vars
    (
      ?auto_137244 - BLOCK
      ?auto_137245 - BLOCK
      ?auto_137240 - BLOCK
      ?auto_137239 - BLOCK
      ?auto_137243 - BLOCK
      ?auto_137242 - BLOCK
      ?auto_137241 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_137237 ?auto_137238 ) ) ( not ( = ?auto_137237 ?auto_137244 ) ) ( not ( = ?auto_137238 ?auto_137244 ) ) ( ON ?auto_137237 ?auto_137245 ) ( not ( = ?auto_137237 ?auto_137245 ) ) ( not ( = ?auto_137238 ?auto_137245 ) ) ( not ( = ?auto_137244 ?auto_137245 ) ) ( ON-TABLE ?auto_137240 ) ( ON ?auto_137239 ?auto_137240 ) ( ON ?auto_137243 ?auto_137239 ) ( ON ?auto_137242 ?auto_137243 ) ( not ( = ?auto_137240 ?auto_137239 ) ) ( not ( = ?auto_137240 ?auto_137243 ) ) ( not ( = ?auto_137240 ?auto_137242 ) ) ( not ( = ?auto_137240 ?auto_137241 ) ) ( not ( = ?auto_137240 ?auto_137244 ) ) ( not ( = ?auto_137240 ?auto_137238 ) ) ( not ( = ?auto_137239 ?auto_137243 ) ) ( not ( = ?auto_137239 ?auto_137242 ) ) ( not ( = ?auto_137239 ?auto_137241 ) ) ( not ( = ?auto_137239 ?auto_137244 ) ) ( not ( = ?auto_137239 ?auto_137238 ) ) ( not ( = ?auto_137243 ?auto_137242 ) ) ( not ( = ?auto_137243 ?auto_137241 ) ) ( not ( = ?auto_137243 ?auto_137244 ) ) ( not ( = ?auto_137243 ?auto_137238 ) ) ( not ( = ?auto_137242 ?auto_137241 ) ) ( not ( = ?auto_137242 ?auto_137244 ) ) ( not ( = ?auto_137242 ?auto_137238 ) ) ( not ( = ?auto_137241 ?auto_137244 ) ) ( not ( = ?auto_137241 ?auto_137238 ) ) ( not ( = ?auto_137237 ?auto_137240 ) ) ( not ( = ?auto_137237 ?auto_137239 ) ) ( not ( = ?auto_137237 ?auto_137243 ) ) ( not ( = ?auto_137237 ?auto_137242 ) ) ( not ( = ?auto_137237 ?auto_137241 ) ) ( not ( = ?auto_137245 ?auto_137240 ) ) ( not ( = ?auto_137245 ?auto_137239 ) ) ( not ( = ?auto_137245 ?auto_137243 ) ) ( not ( = ?auto_137245 ?auto_137242 ) ) ( not ( = ?auto_137245 ?auto_137241 ) ) ( ON ?auto_137238 ?auto_137237 ) ( ON-TABLE ?auto_137245 ) ( ON ?auto_137244 ?auto_137238 ) ( CLEAR ?auto_137242 ) ( ON ?auto_137241 ?auto_137244 ) ( CLEAR ?auto_137241 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_137245 ?auto_137237 ?auto_137238 ?auto_137244 )
      ( MAKE-2PILE ?auto_137237 ?auto_137238 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_137246 - BLOCK
      ?auto_137247 - BLOCK
    )
    :vars
    (
      ?auto_137252 - BLOCK
      ?auto_137249 - BLOCK
      ?auto_137253 - BLOCK
      ?auto_137248 - BLOCK
      ?auto_137250 - BLOCK
      ?auto_137254 - BLOCK
      ?auto_137251 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_137246 ?auto_137247 ) ) ( not ( = ?auto_137246 ?auto_137252 ) ) ( not ( = ?auto_137247 ?auto_137252 ) ) ( ON ?auto_137246 ?auto_137249 ) ( not ( = ?auto_137246 ?auto_137249 ) ) ( not ( = ?auto_137247 ?auto_137249 ) ) ( not ( = ?auto_137252 ?auto_137249 ) ) ( ON-TABLE ?auto_137253 ) ( ON ?auto_137248 ?auto_137253 ) ( ON ?auto_137250 ?auto_137248 ) ( not ( = ?auto_137253 ?auto_137248 ) ) ( not ( = ?auto_137253 ?auto_137250 ) ) ( not ( = ?auto_137253 ?auto_137254 ) ) ( not ( = ?auto_137253 ?auto_137251 ) ) ( not ( = ?auto_137253 ?auto_137252 ) ) ( not ( = ?auto_137253 ?auto_137247 ) ) ( not ( = ?auto_137248 ?auto_137250 ) ) ( not ( = ?auto_137248 ?auto_137254 ) ) ( not ( = ?auto_137248 ?auto_137251 ) ) ( not ( = ?auto_137248 ?auto_137252 ) ) ( not ( = ?auto_137248 ?auto_137247 ) ) ( not ( = ?auto_137250 ?auto_137254 ) ) ( not ( = ?auto_137250 ?auto_137251 ) ) ( not ( = ?auto_137250 ?auto_137252 ) ) ( not ( = ?auto_137250 ?auto_137247 ) ) ( not ( = ?auto_137254 ?auto_137251 ) ) ( not ( = ?auto_137254 ?auto_137252 ) ) ( not ( = ?auto_137254 ?auto_137247 ) ) ( not ( = ?auto_137251 ?auto_137252 ) ) ( not ( = ?auto_137251 ?auto_137247 ) ) ( not ( = ?auto_137246 ?auto_137253 ) ) ( not ( = ?auto_137246 ?auto_137248 ) ) ( not ( = ?auto_137246 ?auto_137250 ) ) ( not ( = ?auto_137246 ?auto_137254 ) ) ( not ( = ?auto_137246 ?auto_137251 ) ) ( not ( = ?auto_137249 ?auto_137253 ) ) ( not ( = ?auto_137249 ?auto_137248 ) ) ( not ( = ?auto_137249 ?auto_137250 ) ) ( not ( = ?auto_137249 ?auto_137254 ) ) ( not ( = ?auto_137249 ?auto_137251 ) ) ( ON ?auto_137247 ?auto_137246 ) ( ON-TABLE ?auto_137249 ) ( ON ?auto_137252 ?auto_137247 ) ( ON ?auto_137251 ?auto_137252 ) ( CLEAR ?auto_137251 ) ( HOLDING ?auto_137254 ) ( CLEAR ?auto_137250 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_137253 ?auto_137248 ?auto_137250 ?auto_137254 )
      ( MAKE-2PILE ?auto_137246 ?auto_137247 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_137255 - BLOCK
      ?auto_137256 - BLOCK
    )
    :vars
    (
      ?auto_137262 - BLOCK
      ?auto_137258 - BLOCK
      ?auto_137261 - BLOCK
      ?auto_137257 - BLOCK
      ?auto_137259 - BLOCK
      ?auto_137260 - BLOCK
      ?auto_137263 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_137255 ?auto_137256 ) ) ( not ( = ?auto_137255 ?auto_137262 ) ) ( not ( = ?auto_137256 ?auto_137262 ) ) ( ON ?auto_137255 ?auto_137258 ) ( not ( = ?auto_137255 ?auto_137258 ) ) ( not ( = ?auto_137256 ?auto_137258 ) ) ( not ( = ?auto_137262 ?auto_137258 ) ) ( ON-TABLE ?auto_137261 ) ( ON ?auto_137257 ?auto_137261 ) ( ON ?auto_137259 ?auto_137257 ) ( not ( = ?auto_137261 ?auto_137257 ) ) ( not ( = ?auto_137261 ?auto_137259 ) ) ( not ( = ?auto_137261 ?auto_137260 ) ) ( not ( = ?auto_137261 ?auto_137263 ) ) ( not ( = ?auto_137261 ?auto_137262 ) ) ( not ( = ?auto_137261 ?auto_137256 ) ) ( not ( = ?auto_137257 ?auto_137259 ) ) ( not ( = ?auto_137257 ?auto_137260 ) ) ( not ( = ?auto_137257 ?auto_137263 ) ) ( not ( = ?auto_137257 ?auto_137262 ) ) ( not ( = ?auto_137257 ?auto_137256 ) ) ( not ( = ?auto_137259 ?auto_137260 ) ) ( not ( = ?auto_137259 ?auto_137263 ) ) ( not ( = ?auto_137259 ?auto_137262 ) ) ( not ( = ?auto_137259 ?auto_137256 ) ) ( not ( = ?auto_137260 ?auto_137263 ) ) ( not ( = ?auto_137260 ?auto_137262 ) ) ( not ( = ?auto_137260 ?auto_137256 ) ) ( not ( = ?auto_137263 ?auto_137262 ) ) ( not ( = ?auto_137263 ?auto_137256 ) ) ( not ( = ?auto_137255 ?auto_137261 ) ) ( not ( = ?auto_137255 ?auto_137257 ) ) ( not ( = ?auto_137255 ?auto_137259 ) ) ( not ( = ?auto_137255 ?auto_137260 ) ) ( not ( = ?auto_137255 ?auto_137263 ) ) ( not ( = ?auto_137258 ?auto_137261 ) ) ( not ( = ?auto_137258 ?auto_137257 ) ) ( not ( = ?auto_137258 ?auto_137259 ) ) ( not ( = ?auto_137258 ?auto_137260 ) ) ( not ( = ?auto_137258 ?auto_137263 ) ) ( ON ?auto_137256 ?auto_137255 ) ( ON-TABLE ?auto_137258 ) ( ON ?auto_137262 ?auto_137256 ) ( ON ?auto_137263 ?auto_137262 ) ( CLEAR ?auto_137259 ) ( ON ?auto_137260 ?auto_137263 ) ( CLEAR ?auto_137260 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_137258 ?auto_137255 ?auto_137256 ?auto_137262 ?auto_137263 )
      ( MAKE-2PILE ?auto_137255 ?auto_137256 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_137264 - BLOCK
      ?auto_137265 - BLOCK
    )
    :vars
    (
      ?auto_137268 - BLOCK
      ?auto_137272 - BLOCK
      ?auto_137269 - BLOCK
      ?auto_137271 - BLOCK
      ?auto_137266 - BLOCK
      ?auto_137267 - BLOCK
      ?auto_137270 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_137264 ?auto_137265 ) ) ( not ( = ?auto_137264 ?auto_137268 ) ) ( not ( = ?auto_137265 ?auto_137268 ) ) ( ON ?auto_137264 ?auto_137272 ) ( not ( = ?auto_137264 ?auto_137272 ) ) ( not ( = ?auto_137265 ?auto_137272 ) ) ( not ( = ?auto_137268 ?auto_137272 ) ) ( ON-TABLE ?auto_137269 ) ( ON ?auto_137271 ?auto_137269 ) ( not ( = ?auto_137269 ?auto_137271 ) ) ( not ( = ?auto_137269 ?auto_137266 ) ) ( not ( = ?auto_137269 ?auto_137267 ) ) ( not ( = ?auto_137269 ?auto_137270 ) ) ( not ( = ?auto_137269 ?auto_137268 ) ) ( not ( = ?auto_137269 ?auto_137265 ) ) ( not ( = ?auto_137271 ?auto_137266 ) ) ( not ( = ?auto_137271 ?auto_137267 ) ) ( not ( = ?auto_137271 ?auto_137270 ) ) ( not ( = ?auto_137271 ?auto_137268 ) ) ( not ( = ?auto_137271 ?auto_137265 ) ) ( not ( = ?auto_137266 ?auto_137267 ) ) ( not ( = ?auto_137266 ?auto_137270 ) ) ( not ( = ?auto_137266 ?auto_137268 ) ) ( not ( = ?auto_137266 ?auto_137265 ) ) ( not ( = ?auto_137267 ?auto_137270 ) ) ( not ( = ?auto_137267 ?auto_137268 ) ) ( not ( = ?auto_137267 ?auto_137265 ) ) ( not ( = ?auto_137270 ?auto_137268 ) ) ( not ( = ?auto_137270 ?auto_137265 ) ) ( not ( = ?auto_137264 ?auto_137269 ) ) ( not ( = ?auto_137264 ?auto_137271 ) ) ( not ( = ?auto_137264 ?auto_137266 ) ) ( not ( = ?auto_137264 ?auto_137267 ) ) ( not ( = ?auto_137264 ?auto_137270 ) ) ( not ( = ?auto_137272 ?auto_137269 ) ) ( not ( = ?auto_137272 ?auto_137271 ) ) ( not ( = ?auto_137272 ?auto_137266 ) ) ( not ( = ?auto_137272 ?auto_137267 ) ) ( not ( = ?auto_137272 ?auto_137270 ) ) ( ON ?auto_137265 ?auto_137264 ) ( ON-TABLE ?auto_137272 ) ( ON ?auto_137268 ?auto_137265 ) ( ON ?auto_137270 ?auto_137268 ) ( ON ?auto_137267 ?auto_137270 ) ( CLEAR ?auto_137267 ) ( HOLDING ?auto_137266 ) ( CLEAR ?auto_137271 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_137269 ?auto_137271 ?auto_137266 )
      ( MAKE-2PILE ?auto_137264 ?auto_137265 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_137273 - BLOCK
      ?auto_137274 - BLOCK
    )
    :vars
    (
      ?auto_137280 - BLOCK
      ?auto_137276 - BLOCK
      ?auto_137279 - BLOCK
      ?auto_137275 - BLOCK
      ?auto_137277 - BLOCK
      ?auto_137281 - BLOCK
      ?auto_137278 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_137273 ?auto_137274 ) ) ( not ( = ?auto_137273 ?auto_137280 ) ) ( not ( = ?auto_137274 ?auto_137280 ) ) ( ON ?auto_137273 ?auto_137276 ) ( not ( = ?auto_137273 ?auto_137276 ) ) ( not ( = ?auto_137274 ?auto_137276 ) ) ( not ( = ?auto_137280 ?auto_137276 ) ) ( ON-TABLE ?auto_137279 ) ( ON ?auto_137275 ?auto_137279 ) ( not ( = ?auto_137279 ?auto_137275 ) ) ( not ( = ?auto_137279 ?auto_137277 ) ) ( not ( = ?auto_137279 ?auto_137281 ) ) ( not ( = ?auto_137279 ?auto_137278 ) ) ( not ( = ?auto_137279 ?auto_137280 ) ) ( not ( = ?auto_137279 ?auto_137274 ) ) ( not ( = ?auto_137275 ?auto_137277 ) ) ( not ( = ?auto_137275 ?auto_137281 ) ) ( not ( = ?auto_137275 ?auto_137278 ) ) ( not ( = ?auto_137275 ?auto_137280 ) ) ( not ( = ?auto_137275 ?auto_137274 ) ) ( not ( = ?auto_137277 ?auto_137281 ) ) ( not ( = ?auto_137277 ?auto_137278 ) ) ( not ( = ?auto_137277 ?auto_137280 ) ) ( not ( = ?auto_137277 ?auto_137274 ) ) ( not ( = ?auto_137281 ?auto_137278 ) ) ( not ( = ?auto_137281 ?auto_137280 ) ) ( not ( = ?auto_137281 ?auto_137274 ) ) ( not ( = ?auto_137278 ?auto_137280 ) ) ( not ( = ?auto_137278 ?auto_137274 ) ) ( not ( = ?auto_137273 ?auto_137279 ) ) ( not ( = ?auto_137273 ?auto_137275 ) ) ( not ( = ?auto_137273 ?auto_137277 ) ) ( not ( = ?auto_137273 ?auto_137281 ) ) ( not ( = ?auto_137273 ?auto_137278 ) ) ( not ( = ?auto_137276 ?auto_137279 ) ) ( not ( = ?auto_137276 ?auto_137275 ) ) ( not ( = ?auto_137276 ?auto_137277 ) ) ( not ( = ?auto_137276 ?auto_137281 ) ) ( not ( = ?auto_137276 ?auto_137278 ) ) ( ON ?auto_137274 ?auto_137273 ) ( ON-TABLE ?auto_137276 ) ( ON ?auto_137280 ?auto_137274 ) ( ON ?auto_137278 ?auto_137280 ) ( ON ?auto_137281 ?auto_137278 ) ( CLEAR ?auto_137275 ) ( ON ?auto_137277 ?auto_137281 ) ( CLEAR ?auto_137277 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_137276 ?auto_137273 ?auto_137274 ?auto_137280 ?auto_137278 ?auto_137281 )
      ( MAKE-2PILE ?auto_137273 ?auto_137274 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_137282 - BLOCK
      ?auto_137283 - BLOCK
    )
    :vars
    (
      ?auto_137290 - BLOCK
      ?auto_137286 - BLOCK
      ?auto_137285 - BLOCK
      ?auto_137284 - BLOCK
      ?auto_137289 - BLOCK
      ?auto_137287 - BLOCK
      ?auto_137288 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_137282 ?auto_137283 ) ) ( not ( = ?auto_137282 ?auto_137290 ) ) ( not ( = ?auto_137283 ?auto_137290 ) ) ( ON ?auto_137282 ?auto_137286 ) ( not ( = ?auto_137282 ?auto_137286 ) ) ( not ( = ?auto_137283 ?auto_137286 ) ) ( not ( = ?auto_137290 ?auto_137286 ) ) ( ON-TABLE ?auto_137285 ) ( not ( = ?auto_137285 ?auto_137284 ) ) ( not ( = ?auto_137285 ?auto_137289 ) ) ( not ( = ?auto_137285 ?auto_137287 ) ) ( not ( = ?auto_137285 ?auto_137288 ) ) ( not ( = ?auto_137285 ?auto_137290 ) ) ( not ( = ?auto_137285 ?auto_137283 ) ) ( not ( = ?auto_137284 ?auto_137289 ) ) ( not ( = ?auto_137284 ?auto_137287 ) ) ( not ( = ?auto_137284 ?auto_137288 ) ) ( not ( = ?auto_137284 ?auto_137290 ) ) ( not ( = ?auto_137284 ?auto_137283 ) ) ( not ( = ?auto_137289 ?auto_137287 ) ) ( not ( = ?auto_137289 ?auto_137288 ) ) ( not ( = ?auto_137289 ?auto_137290 ) ) ( not ( = ?auto_137289 ?auto_137283 ) ) ( not ( = ?auto_137287 ?auto_137288 ) ) ( not ( = ?auto_137287 ?auto_137290 ) ) ( not ( = ?auto_137287 ?auto_137283 ) ) ( not ( = ?auto_137288 ?auto_137290 ) ) ( not ( = ?auto_137288 ?auto_137283 ) ) ( not ( = ?auto_137282 ?auto_137285 ) ) ( not ( = ?auto_137282 ?auto_137284 ) ) ( not ( = ?auto_137282 ?auto_137289 ) ) ( not ( = ?auto_137282 ?auto_137287 ) ) ( not ( = ?auto_137282 ?auto_137288 ) ) ( not ( = ?auto_137286 ?auto_137285 ) ) ( not ( = ?auto_137286 ?auto_137284 ) ) ( not ( = ?auto_137286 ?auto_137289 ) ) ( not ( = ?auto_137286 ?auto_137287 ) ) ( not ( = ?auto_137286 ?auto_137288 ) ) ( ON ?auto_137283 ?auto_137282 ) ( ON-TABLE ?auto_137286 ) ( ON ?auto_137290 ?auto_137283 ) ( ON ?auto_137288 ?auto_137290 ) ( ON ?auto_137287 ?auto_137288 ) ( ON ?auto_137289 ?auto_137287 ) ( CLEAR ?auto_137289 ) ( HOLDING ?auto_137284 ) ( CLEAR ?auto_137285 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_137285 ?auto_137284 )
      ( MAKE-2PILE ?auto_137282 ?auto_137283 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_137291 - BLOCK
      ?auto_137292 - BLOCK
    )
    :vars
    (
      ?auto_137293 - BLOCK
      ?auto_137299 - BLOCK
      ?auto_137295 - BLOCK
      ?auto_137296 - BLOCK
      ?auto_137294 - BLOCK
      ?auto_137298 - BLOCK
      ?auto_137297 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_137291 ?auto_137292 ) ) ( not ( = ?auto_137291 ?auto_137293 ) ) ( not ( = ?auto_137292 ?auto_137293 ) ) ( ON ?auto_137291 ?auto_137299 ) ( not ( = ?auto_137291 ?auto_137299 ) ) ( not ( = ?auto_137292 ?auto_137299 ) ) ( not ( = ?auto_137293 ?auto_137299 ) ) ( ON-TABLE ?auto_137295 ) ( not ( = ?auto_137295 ?auto_137296 ) ) ( not ( = ?auto_137295 ?auto_137294 ) ) ( not ( = ?auto_137295 ?auto_137298 ) ) ( not ( = ?auto_137295 ?auto_137297 ) ) ( not ( = ?auto_137295 ?auto_137293 ) ) ( not ( = ?auto_137295 ?auto_137292 ) ) ( not ( = ?auto_137296 ?auto_137294 ) ) ( not ( = ?auto_137296 ?auto_137298 ) ) ( not ( = ?auto_137296 ?auto_137297 ) ) ( not ( = ?auto_137296 ?auto_137293 ) ) ( not ( = ?auto_137296 ?auto_137292 ) ) ( not ( = ?auto_137294 ?auto_137298 ) ) ( not ( = ?auto_137294 ?auto_137297 ) ) ( not ( = ?auto_137294 ?auto_137293 ) ) ( not ( = ?auto_137294 ?auto_137292 ) ) ( not ( = ?auto_137298 ?auto_137297 ) ) ( not ( = ?auto_137298 ?auto_137293 ) ) ( not ( = ?auto_137298 ?auto_137292 ) ) ( not ( = ?auto_137297 ?auto_137293 ) ) ( not ( = ?auto_137297 ?auto_137292 ) ) ( not ( = ?auto_137291 ?auto_137295 ) ) ( not ( = ?auto_137291 ?auto_137296 ) ) ( not ( = ?auto_137291 ?auto_137294 ) ) ( not ( = ?auto_137291 ?auto_137298 ) ) ( not ( = ?auto_137291 ?auto_137297 ) ) ( not ( = ?auto_137299 ?auto_137295 ) ) ( not ( = ?auto_137299 ?auto_137296 ) ) ( not ( = ?auto_137299 ?auto_137294 ) ) ( not ( = ?auto_137299 ?auto_137298 ) ) ( not ( = ?auto_137299 ?auto_137297 ) ) ( ON ?auto_137292 ?auto_137291 ) ( ON-TABLE ?auto_137299 ) ( ON ?auto_137293 ?auto_137292 ) ( ON ?auto_137297 ?auto_137293 ) ( ON ?auto_137298 ?auto_137297 ) ( ON ?auto_137294 ?auto_137298 ) ( CLEAR ?auto_137295 ) ( ON ?auto_137296 ?auto_137294 ) ( CLEAR ?auto_137296 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_137299 ?auto_137291 ?auto_137292 ?auto_137293 ?auto_137297 ?auto_137298 ?auto_137294 )
      ( MAKE-2PILE ?auto_137291 ?auto_137292 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_137300 - BLOCK
      ?auto_137301 - BLOCK
    )
    :vars
    (
      ?auto_137302 - BLOCK
      ?auto_137307 - BLOCK
      ?auto_137308 - BLOCK
      ?auto_137303 - BLOCK
      ?auto_137306 - BLOCK
      ?auto_137305 - BLOCK
      ?auto_137304 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_137300 ?auto_137301 ) ) ( not ( = ?auto_137300 ?auto_137302 ) ) ( not ( = ?auto_137301 ?auto_137302 ) ) ( ON ?auto_137300 ?auto_137307 ) ( not ( = ?auto_137300 ?auto_137307 ) ) ( not ( = ?auto_137301 ?auto_137307 ) ) ( not ( = ?auto_137302 ?auto_137307 ) ) ( not ( = ?auto_137308 ?auto_137303 ) ) ( not ( = ?auto_137308 ?auto_137306 ) ) ( not ( = ?auto_137308 ?auto_137305 ) ) ( not ( = ?auto_137308 ?auto_137304 ) ) ( not ( = ?auto_137308 ?auto_137302 ) ) ( not ( = ?auto_137308 ?auto_137301 ) ) ( not ( = ?auto_137303 ?auto_137306 ) ) ( not ( = ?auto_137303 ?auto_137305 ) ) ( not ( = ?auto_137303 ?auto_137304 ) ) ( not ( = ?auto_137303 ?auto_137302 ) ) ( not ( = ?auto_137303 ?auto_137301 ) ) ( not ( = ?auto_137306 ?auto_137305 ) ) ( not ( = ?auto_137306 ?auto_137304 ) ) ( not ( = ?auto_137306 ?auto_137302 ) ) ( not ( = ?auto_137306 ?auto_137301 ) ) ( not ( = ?auto_137305 ?auto_137304 ) ) ( not ( = ?auto_137305 ?auto_137302 ) ) ( not ( = ?auto_137305 ?auto_137301 ) ) ( not ( = ?auto_137304 ?auto_137302 ) ) ( not ( = ?auto_137304 ?auto_137301 ) ) ( not ( = ?auto_137300 ?auto_137308 ) ) ( not ( = ?auto_137300 ?auto_137303 ) ) ( not ( = ?auto_137300 ?auto_137306 ) ) ( not ( = ?auto_137300 ?auto_137305 ) ) ( not ( = ?auto_137300 ?auto_137304 ) ) ( not ( = ?auto_137307 ?auto_137308 ) ) ( not ( = ?auto_137307 ?auto_137303 ) ) ( not ( = ?auto_137307 ?auto_137306 ) ) ( not ( = ?auto_137307 ?auto_137305 ) ) ( not ( = ?auto_137307 ?auto_137304 ) ) ( ON ?auto_137301 ?auto_137300 ) ( ON-TABLE ?auto_137307 ) ( ON ?auto_137302 ?auto_137301 ) ( ON ?auto_137304 ?auto_137302 ) ( ON ?auto_137305 ?auto_137304 ) ( ON ?auto_137306 ?auto_137305 ) ( ON ?auto_137303 ?auto_137306 ) ( CLEAR ?auto_137303 ) ( HOLDING ?auto_137308 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_137308 )
      ( MAKE-2PILE ?auto_137300 ?auto_137301 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_137309 - BLOCK
      ?auto_137310 - BLOCK
    )
    :vars
    (
      ?auto_137312 - BLOCK
      ?auto_137317 - BLOCK
      ?auto_137315 - BLOCK
      ?auto_137316 - BLOCK
      ?auto_137313 - BLOCK
      ?auto_137314 - BLOCK
      ?auto_137311 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_137309 ?auto_137310 ) ) ( not ( = ?auto_137309 ?auto_137312 ) ) ( not ( = ?auto_137310 ?auto_137312 ) ) ( ON ?auto_137309 ?auto_137317 ) ( not ( = ?auto_137309 ?auto_137317 ) ) ( not ( = ?auto_137310 ?auto_137317 ) ) ( not ( = ?auto_137312 ?auto_137317 ) ) ( not ( = ?auto_137315 ?auto_137316 ) ) ( not ( = ?auto_137315 ?auto_137313 ) ) ( not ( = ?auto_137315 ?auto_137314 ) ) ( not ( = ?auto_137315 ?auto_137311 ) ) ( not ( = ?auto_137315 ?auto_137312 ) ) ( not ( = ?auto_137315 ?auto_137310 ) ) ( not ( = ?auto_137316 ?auto_137313 ) ) ( not ( = ?auto_137316 ?auto_137314 ) ) ( not ( = ?auto_137316 ?auto_137311 ) ) ( not ( = ?auto_137316 ?auto_137312 ) ) ( not ( = ?auto_137316 ?auto_137310 ) ) ( not ( = ?auto_137313 ?auto_137314 ) ) ( not ( = ?auto_137313 ?auto_137311 ) ) ( not ( = ?auto_137313 ?auto_137312 ) ) ( not ( = ?auto_137313 ?auto_137310 ) ) ( not ( = ?auto_137314 ?auto_137311 ) ) ( not ( = ?auto_137314 ?auto_137312 ) ) ( not ( = ?auto_137314 ?auto_137310 ) ) ( not ( = ?auto_137311 ?auto_137312 ) ) ( not ( = ?auto_137311 ?auto_137310 ) ) ( not ( = ?auto_137309 ?auto_137315 ) ) ( not ( = ?auto_137309 ?auto_137316 ) ) ( not ( = ?auto_137309 ?auto_137313 ) ) ( not ( = ?auto_137309 ?auto_137314 ) ) ( not ( = ?auto_137309 ?auto_137311 ) ) ( not ( = ?auto_137317 ?auto_137315 ) ) ( not ( = ?auto_137317 ?auto_137316 ) ) ( not ( = ?auto_137317 ?auto_137313 ) ) ( not ( = ?auto_137317 ?auto_137314 ) ) ( not ( = ?auto_137317 ?auto_137311 ) ) ( ON ?auto_137310 ?auto_137309 ) ( ON-TABLE ?auto_137317 ) ( ON ?auto_137312 ?auto_137310 ) ( ON ?auto_137311 ?auto_137312 ) ( ON ?auto_137314 ?auto_137311 ) ( ON ?auto_137313 ?auto_137314 ) ( ON ?auto_137316 ?auto_137313 ) ( ON ?auto_137315 ?auto_137316 ) ( CLEAR ?auto_137315 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_137317 ?auto_137309 ?auto_137310 ?auto_137312 ?auto_137311 ?auto_137314 ?auto_137313 ?auto_137316 )
      ( MAKE-2PILE ?auto_137309 ?auto_137310 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_137345 - BLOCK
      ?auto_137346 - BLOCK
      ?auto_137347 - BLOCK
      ?auto_137348 - BLOCK
      ?auto_137349 - BLOCK
    )
    :vars
    (
      ?auto_137351 - BLOCK
      ?auto_137350 - BLOCK
      ?auto_137352 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_137351 ?auto_137349 ) ( ON-TABLE ?auto_137345 ) ( ON ?auto_137346 ?auto_137345 ) ( ON ?auto_137347 ?auto_137346 ) ( ON ?auto_137348 ?auto_137347 ) ( ON ?auto_137349 ?auto_137348 ) ( not ( = ?auto_137345 ?auto_137346 ) ) ( not ( = ?auto_137345 ?auto_137347 ) ) ( not ( = ?auto_137345 ?auto_137348 ) ) ( not ( = ?auto_137345 ?auto_137349 ) ) ( not ( = ?auto_137345 ?auto_137351 ) ) ( not ( = ?auto_137346 ?auto_137347 ) ) ( not ( = ?auto_137346 ?auto_137348 ) ) ( not ( = ?auto_137346 ?auto_137349 ) ) ( not ( = ?auto_137346 ?auto_137351 ) ) ( not ( = ?auto_137347 ?auto_137348 ) ) ( not ( = ?auto_137347 ?auto_137349 ) ) ( not ( = ?auto_137347 ?auto_137351 ) ) ( not ( = ?auto_137348 ?auto_137349 ) ) ( not ( = ?auto_137348 ?auto_137351 ) ) ( not ( = ?auto_137349 ?auto_137351 ) ) ( not ( = ?auto_137345 ?auto_137350 ) ) ( not ( = ?auto_137345 ?auto_137352 ) ) ( not ( = ?auto_137346 ?auto_137350 ) ) ( not ( = ?auto_137346 ?auto_137352 ) ) ( not ( = ?auto_137347 ?auto_137350 ) ) ( not ( = ?auto_137347 ?auto_137352 ) ) ( not ( = ?auto_137348 ?auto_137350 ) ) ( not ( = ?auto_137348 ?auto_137352 ) ) ( not ( = ?auto_137349 ?auto_137350 ) ) ( not ( = ?auto_137349 ?auto_137352 ) ) ( not ( = ?auto_137351 ?auto_137350 ) ) ( not ( = ?auto_137351 ?auto_137352 ) ) ( not ( = ?auto_137350 ?auto_137352 ) ) ( ON ?auto_137350 ?auto_137351 ) ( CLEAR ?auto_137350 ) ( HOLDING ?auto_137352 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_137352 )
      ( MAKE-5PILE ?auto_137345 ?auto_137346 ?auto_137347 ?auto_137348 ?auto_137349 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_137458 - BLOCK
      ?auto_137459 - BLOCK
      ?auto_137460 - BLOCK
    )
    :vars
    (
      ?auto_137461 - BLOCK
      ?auto_137462 - BLOCK
      ?auto_137463 - BLOCK
      ?auto_137465 - BLOCK
      ?auto_137464 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_137458 ) ( not ( = ?auto_137458 ?auto_137459 ) ) ( not ( = ?auto_137458 ?auto_137460 ) ) ( not ( = ?auto_137459 ?auto_137460 ) ) ( ON ?auto_137460 ?auto_137461 ) ( not ( = ?auto_137458 ?auto_137461 ) ) ( not ( = ?auto_137459 ?auto_137461 ) ) ( not ( = ?auto_137460 ?auto_137461 ) ) ( CLEAR ?auto_137458 ) ( ON ?auto_137459 ?auto_137460 ) ( CLEAR ?auto_137459 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_137462 ) ( ON ?auto_137463 ?auto_137462 ) ( ON ?auto_137465 ?auto_137463 ) ( ON ?auto_137464 ?auto_137465 ) ( ON ?auto_137461 ?auto_137464 ) ( not ( = ?auto_137462 ?auto_137463 ) ) ( not ( = ?auto_137462 ?auto_137465 ) ) ( not ( = ?auto_137462 ?auto_137464 ) ) ( not ( = ?auto_137462 ?auto_137461 ) ) ( not ( = ?auto_137462 ?auto_137460 ) ) ( not ( = ?auto_137462 ?auto_137459 ) ) ( not ( = ?auto_137463 ?auto_137465 ) ) ( not ( = ?auto_137463 ?auto_137464 ) ) ( not ( = ?auto_137463 ?auto_137461 ) ) ( not ( = ?auto_137463 ?auto_137460 ) ) ( not ( = ?auto_137463 ?auto_137459 ) ) ( not ( = ?auto_137465 ?auto_137464 ) ) ( not ( = ?auto_137465 ?auto_137461 ) ) ( not ( = ?auto_137465 ?auto_137460 ) ) ( not ( = ?auto_137465 ?auto_137459 ) ) ( not ( = ?auto_137464 ?auto_137461 ) ) ( not ( = ?auto_137464 ?auto_137460 ) ) ( not ( = ?auto_137464 ?auto_137459 ) ) ( not ( = ?auto_137458 ?auto_137462 ) ) ( not ( = ?auto_137458 ?auto_137463 ) ) ( not ( = ?auto_137458 ?auto_137465 ) ) ( not ( = ?auto_137458 ?auto_137464 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_137462 ?auto_137463 ?auto_137465 ?auto_137464 ?auto_137461 ?auto_137460 )
      ( MAKE-3PILE ?auto_137458 ?auto_137459 ?auto_137460 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_137466 - BLOCK
      ?auto_137467 - BLOCK
      ?auto_137468 - BLOCK
    )
    :vars
    (
      ?auto_137473 - BLOCK
      ?auto_137469 - BLOCK
      ?auto_137472 - BLOCK
      ?auto_137470 - BLOCK
      ?auto_137471 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_137466 ?auto_137467 ) ) ( not ( = ?auto_137466 ?auto_137468 ) ) ( not ( = ?auto_137467 ?auto_137468 ) ) ( ON ?auto_137468 ?auto_137473 ) ( not ( = ?auto_137466 ?auto_137473 ) ) ( not ( = ?auto_137467 ?auto_137473 ) ) ( not ( = ?auto_137468 ?auto_137473 ) ) ( ON ?auto_137467 ?auto_137468 ) ( CLEAR ?auto_137467 ) ( ON-TABLE ?auto_137469 ) ( ON ?auto_137472 ?auto_137469 ) ( ON ?auto_137470 ?auto_137472 ) ( ON ?auto_137471 ?auto_137470 ) ( ON ?auto_137473 ?auto_137471 ) ( not ( = ?auto_137469 ?auto_137472 ) ) ( not ( = ?auto_137469 ?auto_137470 ) ) ( not ( = ?auto_137469 ?auto_137471 ) ) ( not ( = ?auto_137469 ?auto_137473 ) ) ( not ( = ?auto_137469 ?auto_137468 ) ) ( not ( = ?auto_137469 ?auto_137467 ) ) ( not ( = ?auto_137472 ?auto_137470 ) ) ( not ( = ?auto_137472 ?auto_137471 ) ) ( not ( = ?auto_137472 ?auto_137473 ) ) ( not ( = ?auto_137472 ?auto_137468 ) ) ( not ( = ?auto_137472 ?auto_137467 ) ) ( not ( = ?auto_137470 ?auto_137471 ) ) ( not ( = ?auto_137470 ?auto_137473 ) ) ( not ( = ?auto_137470 ?auto_137468 ) ) ( not ( = ?auto_137470 ?auto_137467 ) ) ( not ( = ?auto_137471 ?auto_137473 ) ) ( not ( = ?auto_137471 ?auto_137468 ) ) ( not ( = ?auto_137471 ?auto_137467 ) ) ( not ( = ?auto_137466 ?auto_137469 ) ) ( not ( = ?auto_137466 ?auto_137472 ) ) ( not ( = ?auto_137466 ?auto_137470 ) ) ( not ( = ?auto_137466 ?auto_137471 ) ) ( HOLDING ?auto_137466 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_137466 )
      ( MAKE-3PILE ?auto_137466 ?auto_137467 ?auto_137468 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_137474 - BLOCK
      ?auto_137475 - BLOCK
      ?auto_137476 - BLOCK
    )
    :vars
    (
      ?auto_137480 - BLOCK
      ?auto_137481 - BLOCK
      ?auto_137478 - BLOCK
      ?auto_137479 - BLOCK
      ?auto_137477 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_137474 ?auto_137475 ) ) ( not ( = ?auto_137474 ?auto_137476 ) ) ( not ( = ?auto_137475 ?auto_137476 ) ) ( ON ?auto_137476 ?auto_137480 ) ( not ( = ?auto_137474 ?auto_137480 ) ) ( not ( = ?auto_137475 ?auto_137480 ) ) ( not ( = ?auto_137476 ?auto_137480 ) ) ( ON ?auto_137475 ?auto_137476 ) ( ON-TABLE ?auto_137481 ) ( ON ?auto_137478 ?auto_137481 ) ( ON ?auto_137479 ?auto_137478 ) ( ON ?auto_137477 ?auto_137479 ) ( ON ?auto_137480 ?auto_137477 ) ( not ( = ?auto_137481 ?auto_137478 ) ) ( not ( = ?auto_137481 ?auto_137479 ) ) ( not ( = ?auto_137481 ?auto_137477 ) ) ( not ( = ?auto_137481 ?auto_137480 ) ) ( not ( = ?auto_137481 ?auto_137476 ) ) ( not ( = ?auto_137481 ?auto_137475 ) ) ( not ( = ?auto_137478 ?auto_137479 ) ) ( not ( = ?auto_137478 ?auto_137477 ) ) ( not ( = ?auto_137478 ?auto_137480 ) ) ( not ( = ?auto_137478 ?auto_137476 ) ) ( not ( = ?auto_137478 ?auto_137475 ) ) ( not ( = ?auto_137479 ?auto_137477 ) ) ( not ( = ?auto_137479 ?auto_137480 ) ) ( not ( = ?auto_137479 ?auto_137476 ) ) ( not ( = ?auto_137479 ?auto_137475 ) ) ( not ( = ?auto_137477 ?auto_137480 ) ) ( not ( = ?auto_137477 ?auto_137476 ) ) ( not ( = ?auto_137477 ?auto_137475 ) ) ( not ( = ?auto_137474 ?auto_137481 ) ) ( not ( = ?auto_137474 ?auto_137478 ) ) ( not ( = ?auto_137474 ?auto_137479 ) ) ( not ( = ?auto_137474 ?auto_137477 ) ) ( ON ?auto_137474 ?auto_137475 ) ( CLEAR ?auto_137474 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_137481 ?auto_137478 ?auto_137479 ?auto_137477 ?auto_137480 ?auto_137476 ?auto_137475 )
      ( MAKE-3PILE ?auto_137474 ?auto_137475 ?auto_137476 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_137485 - BLOCK
      ?auto_137486 - BLOCK
      ?auto_137487 - BLOCK
    )
    :vars
    (
      ?auto_137492 - BLOCK
      ?auto_137491 - BLOCK
      ?auto_137488 - BLOCK
      ?auto_137489 - BLOCK
      ?auto_137490 - BLOCK
      ?auto_137493 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_137485 ?auto_137486 ) ) ( not ( = ?auto_137485 ?auto_137487 ) ) ( not ( = ?auto_137486 ?auto_137487 ) ) ( ON ?auto_137487 ?auto_137492 ) ( not ( = ?auto_137485 ?auto_137492 ) ) ( not ( = ?auto_137486 ?auto_137492 ) ) ( not ( = ?auto_137487 ?auto_137492 ) ) ( ON ?auto_137486 ?auto_137487 ) ( CLEAR ?auto_137486 ) ( ON-TABLE ?auto_137491 ) ( ON ?auto_137488 ?auto_137491 ) ( ON ?auto_137489 ?auto_137488 ) ( ON ?auto_137490 ?auto_137489 ) ( ON ?auto_137492 ?auto_137490 ) ( not ( = ?auto_137491 ?auto_137488 ) ) ( not ( = ?auto_137491 ?auto_137489 ) ) ( not ( = ?auto_137491 ?auto_137490 ) ) ( not ( = ?auto_137491 ?auto_137492 ) ) ( not ( = ?auto_137491 ?auto_137487 ) ) ( not ( = ?auto_137491 ?auto_137486 ) ) ( not ( = ?auto_137488 ?auto_137489 ) ) ( not ( = ?auto_137488 ?auto_137490 ) ) ( not ( = ?auto_137488 ?auto_137492 ) ) ( not ( = ?auto_137488 ?auto_137487 ) ) ( not ( = ?auto_137488 ?auto_137486 ) ) ( not ( = ?auto_137489 ?auto_137490 ) ) ( not ( = ?auto_137489 ?auto_137492 ) ) ( not ( = ?auto_137489 ?auto_137487 ) ) ( not ( = ?auto_137489 ?auto_137486 ) ) ( not ( = ?auto_137490 ?auto_137492 ) ) ( not ( = ?auto_137490 ?auto_137487 ) ) ( not ( = ?auto_137490 ?auto_137486 ) ) ( not ( = ?auto_137485 ?auto_137491 ) ) ( not ( = ?auto_137485 ?auto_137488 ) ) ( not ( = ?auto_137485 ?auto_137489 ) ) ( not ( = ?auto_137485 ?auto_137490 ) ) ( ON ?auto_137485 ?auto_137493 ) ( CLEAR ?auto_137485 ) ( HAND-EMPTY ) ( not ( = ?auto_137485 ?auto_137493 ) ) ( not ( = ?auto_137486 ?auto_137493 ) ) ( not ( = ?auto_137487 ?auto_137493 ) ) ( not ( = ?auto_137492 ?auto_137493 ) ) ( not ( = ?auto_137491 ?auto_137493 ) ) ( not ( = ?auto_137488 ?auto_137493 ) ) ( not ( = ?auto_137489 ?auto_137493 ) ) ( not ( = ?auto_137490 ?auto_137493 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_137485 ?auto_137493 )
      ( MAKE-3PILE ?auto_137485 ?auto_137486 ?auto_137487 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_137494 - BLOCK
      ?auto_137495 - BLOCK
      ?auto_137496 - BLOCK
    )
    :vars
    (
      ?auto_137498 - BLOCK
      ?auto_137497 - BLOCK
      ?auto_137501 - BLOCK
      ?auto_137502 - BLOCK
      ?auto_137499 - BLOCK
      ?auto_137500 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_137494 ?auto_137495 ) ) ( not ( = ?auto_137494 ?auto_137496 ) ) ( not ( = ?auto_137495 ?auto_137496 ) ) ( ON ?auto_137496 ?auto_137498 ) ( not ( = ?auto_137494 ?auto_137498 ) ) ( not ( = ?auto_137495 ?auto_137498 ) ) ( not ( = ?auto_137496 ?auto_137498 ) ) ( ON-TABLE ?auto_137497 ) ( ON ?auto_137501 ?auto_137497 ) ( ON ?auto_137502 ?auto_137501 ) ( ON ?auto_137499 ?auto_137502 ) ( ON ?auto_137498 ?auto_137499 ) ( not ( = ?auto_137497 ?auto_137501 ) ) ( not ( = ?auto_137497 ?auto_137502 ) ) ( not ( = ?auto_137497 ?auto_137499 ) ) ( not ( = ?auto_137497 ?auto_137498 ) ) ( not ( = ?auto_137497 ?auto_137496 ) ) ( not ( = ?auto_137497 ?auto_137495 ) ) ( not ( = ?auto_137501 ?auto_137502 ) ) ( not ( = ?auto_137501 ?auto_137499 ) ) ( not ( = ?auto_137501 ?auto_137498 ) ) ( not ( = ?auto_137501 ?auto_137496 ) ) ( not ( = ?auto_137501 ?auto_137495 ) ) ( not ( = ?auto_137502 ?auto_137499 ) ) ( not ( = ?auto_137502 ?auto_137498 ) ) ( not ( = ?auto_137502 ?auto_137496 ) ) ( not ( = ?auto_137502 ?auto_137495 ) ) ( not ( = ?auto_137499 ?auto_137498 ) ) ( not ( = ?auto_137499 ?auto_137496 ) ) ( not ( = ?auto_137499 ?auto_137495 ) ) ( not ( = ?auto_137494 ?auto_137497 ) ) ( not ( = ?auto_137494 ?auto_137501 ) ) ( not ( = ?auto_137494 ?auto_137502 ) ) ( not ( = ?auto_137494 ?auto_137499 ) ) ( ON ?auto_137494 ?auto_137500 ) ( CLEAR ?auto_137494 ) ( not ( = ?auto_137494 ?auto_137500 ) ) ( not ( = ?auto_137495 ?auto_137500 ) ) ( not ( = ?auto_137496 ?auto_137500 ) ) ( not ( = ?auto_137498 ?auto_137500 ) ) ( not ( = ?auto_137497 ?auto_137500 ) ) ( not ( = ?auto_137501 ?auto_137500 ) ) ( not ( = ?auto_137502 ?auto_137500 ) ) ( not ( = ?auto_137499 ?auto_137500 ) ) ( HOLDING ?auto_137495 ) ( CLEAR ?auto_137496 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_137497 ?auto_137501 ?auto_137502 ?auto_137499 ?auto_137498 ?auto_137496 ?auto_137495 )
      ( MAKE-3PILE ?auto_137494 ?auto_137495 ?auto_137496 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_137503 - BLOCK
      ?auto_137504 - BLOCK
      ?auto_137505 - BLOCK
    )
    :vars
    (
      ?auto_137506 - BLOCK
      ?auto_137511 - BLOCK
      ?auto_137509 - BLOCK
      ?auto_137510 - BLOCK
      ?auto_137507 - BLOCK
      ?auto_137508 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_137503 ?auto_137504 ) ) ( not ( = ?auto_137503 ?auto_137505 ) ) ( not ( = ?auto_137504 ?auto_137505 ) ) ( ON ?auto_137505 ?auto_137506 ) ( not ( = ?auto_137503 ?auto_137506 ) ) ( not ( = ?auto_137504 ?auto_137506 ) ) ( not ( = ?auto_137505 ?auto_137506 ) ) ( ON-TABLE ?auto_137511 ) ( ON ?auto_137509 ?auto_137511 ) ( ON ?auto_137510 ?auto_137509 ) ( ON ?auto_137507 ?auto_137510 ) ( ON ?auto_137506 ?auto_137507 ) ( not ( = ?auto_137511 ?auto_137509 ) ) ( not ( = ?auto_137511 ?auto_137510 ) ) ( not ( = ?auto_137511 ?auto_137507 ) ) ( not ( = ?auto_137511 ?auto_137506 ) ) ( not ( = ?auto_137511 ?auto_137505 ) ) ( not ( = ?auto_137511 ?auto_137504 ) ) ( not ( = ?auto_137509 ?auto_137510 ) ) ( not ( = ?auto_137509 ?auto_137507 ) ) ( not ( = ?auto_137509 ?auto_137506 ) ) ( not ( = ?auto_137509 ?auto_137505 ) ) ( not ( = ?auto_137509 ?auto_137504 ) ) ( not ( = ?auto_137510 ?auto_137507 ) ) ( not ( = ?auto_137510 ?auto_137506 ) ) ( not ( = ?auto_137510 ?auto_137505 ) ) ( not ( = ?auto_137510 ?auto_137504 ) ) ( not ( = ?auto_137507 ?auto_137506 ) ) ( not ( = ?auto_137507 ?auto_137505 ) ) ( not ( = ?auto_137507 ?auto_137504 ) ) ( not ( = ?auto_137503 ?auto_137511 ) ) ( not ( = ?auto_137503 ?auto_137509 ) ) ( not ( = ?auto_137503 ?auto_137510 ) ) ( not ( = ?auto_137503 ?auto_137507 ) ) ( ON ?auto_137503 ?auto_137508 ) ( not ( = ?auto_137503 ?auto_137508 ) ) ( not ( = ?auto_137504 ?auto_137508 ) ) ( not ( = ?auto_137505 ?auto_137508 ) ) ( not ( = ?auto_137506 ?auto_137508 ) ) ( not ( = ?auto_137511 ?auto_137508 ) ) ( not ( = ?auto_137509 ?auto_137508 ) ) ( not ( = ?auto_137510 ?auto_137508 ) ) ( not ( = ?auto_137507 ?auto_137508 ) ) ( CLEAR ?auto_137505 ) ( ON ?auto_137504 ?auto_137503 ) ( CLEAR ?auto_137504 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_137508 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_137508 ?auto_137503 )
      ( MAKE-3PILE ?auto_137503 ?auto_137504 ?auto_137505 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_137512 - BLOCK
      ?auto_137513 - BLOCK
      ?auto_137514 - BLOCK
    )
    :vars
    (
      ?auto_137516 - BLOCK
      ?auto_137517 - BLOCK
      ?auto_137519 - BLOCK
      ?auto_137515 - BLOCK
      ?auto_137518 - BLOCK
      ?auto_137520 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_137512 ?auto_137513 ) ) ( not ( = ?auto_137512 ?auto_137514 ) ) ( not ( = ?auto_137513 ?auto_137514 ) ) ( not ( = ?auto_137512 ?auto_137516 ) ) ( not ( = ?auto_137513 ?auto_137516 ) ) ( not ( = ?auto_137514 ?auto_137516 ) ) ( ON-TABLE ?auto_137517 ) ( ON ?auto_137519 ?auto_137517 ) ( ON ?auto_137515 ?auto_137519 ) ( ON ?auto_137518 ?auto_137515 ) ( ON ?auto_137516 ?auto_137518 ) ( not ( = ?auto_137517 ?auto_137519 ) ) ( not ( = ?auto_137517 ?auto_137515 ) ) ( not ( = ?auto_137517 ?auto_137518 ) ) ( not ( = ?auto_137517 ?auto_137516 ) ) ( not ( = ?auto_137517 ?auto_137514 ) ) ( not ( = ?auto_137517 ?auto_137513 ) ) ( not ( = ?auto_137519 ?auto_137515 ) ) ( not ( = ?auto_137519 ?auto_137518 ) ) ( not ( = ?auto_137519 ?auto_137516 ) ) ( not ( = ?auto_137519 ?auto_137514 ) ) ( not ( = ?auto_137519 ?auto_137513 ) ) ( not ( = ?auto_137515 ?auto_137518 ) ) ( not ( = ?auto_137515 ?auto_137516 ) ) ( not ( = ?auto_137515 ?auto_137514 ) ) ( not ( = ?auto_137515 ?auto_137513 ) ) ( not ( = ?auto_137518 ?auto_137516 ) ) ( not ( = ?auto_137518 ?auto_137514 ) ) ( not ( = ?auto_137518 ?auto_137513 ) ) ( not ( = ?auto_137512 ?auto_137517 ) ) ( not ( = ?auto_137512 ?auto_137519 ) ) ( not ( = ?auto_137512 ?auto_137515 ) ) ( not ( = ?auto_137512 ?auto_137518 ) ) ( ON ?auto_137512 ?auto_137520 ) ( not ( = ?auto_137512 ?auto_137520 ) ) ( not ( = ?auto_137513 ?auto_137520 ) ) ( not ( = ?auto_137514 ?auto_137520 ) ) ( not ( = ?auto_137516 ?auto_137520 ) ) ( not ( = ?auto_137517 ?auto_137520 ) ) ( not ( = ?auto_137519 ?auto_137520 ) ) ( not ( = ?auto_137515 ?auto_137520 ) ) ( not ( = ?auto_137518 ?auto_137520 ) ) ( ON ?auto_137513 ?auto_137512 ) ( CLEAR ?auto_137513 ) ( ON-TABLE ?auto_137520 ) ( HOLDING ?auto_137514 ) ( CLEAR ?auto_137516 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_137517 ?auto_137519 ?auto_137515 ?auto_137518 ?auto_137516 ?auto_137514 )
      ( MAKE-3PILE ?auto_137512 ?auto_137513 ?auto_137514 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_137521 - BLOCK
      ?auto_137522 - BLOCK
      ?auto_137523 - BLOCK
    )
    :vars
    (
      ?auto_137529 - BLOCK
      ?auto_137527 - BLOCK
      ?auto_137528 - BLOCK
      ?auto_137524 - BLOCK
      ?auto_137526 - BLOCK
      ?auto_137525 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_137521 ?auto_137522 ) ) ( not ( = ?auto_137521 ?auto_137523 ) ) ( not ( = ?auto_137522 ?auto_137523 ) ) ( not ( = ?auto_137521 ?auto_137529 ) ) ( not ( = ?auto_137522 ?auto_137529 ) ) ( not ( = ?auto_137523 ?auto_137529 ) ) ( ON-TABLE ?auto_137527 ) ( ON ?auto_137528 ?auto_137527 ) ( ON ?auto_137524 ?auto_137528 ) ( ON ?auto_137526 ?auto_137524 ) ( ON ?auto_137529 ?auto_137526 ) ( not ( = ?auto_137527 ?auto_137528 ) ) ( not ( = ?auto_137527 ?auto_137524 ) ) ( not ( = ?auto_137527 ?auto_137526 ) ) ( not ( = ?auto_137527 ?auto_137529 ) ) ( not ( = ?auto_137527 ?auto_137523 ) ) ( not ( = ?auto_137527 ?auto_137522 ) ) ( not ( = ?auto_137528 ?auto_137524 ) ) ( not ( = ?auto_137528 ?auto_137526 ) ) ( not ( = ?auto_137528 ?auto_137529 ) ) ( not ( = ?auto_137528 ?auto_137523 ) ) ( not ( = ?auto_137528 ?auto_137522 ) ) ( not ( = ?auto_137524 ?auto_137526 ) ) ( not ( = ?auto_137524 ?auto_137529 ) ) ( not ( = ?auto_137524 ?auto_137523 ) ) ( not ( = ?auto_137524 ?auto_137522 ) ) ( not ( = ?auto_137526 ?auto_137529 ) ) ( not ( = ?auto_137526 ?auto_137523 ) ) ( not ( = ?auto_137526 ?auto_137522 ) ) ( not ( = ?auto_137521 ?auto_137527 ) ) ( not ( = ?auto_137521 ?auto_137528 ) ) ( not ( = ?auto_137521 ?auto_137524 ) ) ( not ( = ?auto_137521 ?auto_137526 ) ) ( ON ?auto_137521 ?auto_137525 ) ( not ( = ?auto_137521 ?auto_137525 ) ) ( not ( = ?auto_137522 ?auto_137525 ) ) ( not ( = ?auto_137523 ?auto_137525 ) ) ( not ( = ?auto_137529 ?auto_137525 ) ) ( not ( = ?auto_137527 ?auto_137525 ) ) ( not ( = ?auto_137528 ?auto_137525 ) ) ( not ( = ?auto_137524 ?auto_137525 ) ) ( not ( = ?auto_137526 ?auto_137525 ) ) ( ON ?auto_137522 ?auto_137521 ) ( ON-TABLE ?auto_137525 ) ( CLEAR ?auto_137529 ) ( ON ?auto_137523 ?auto_137522 ) ( CLEAR ?auto_137523 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_137525 ?auto_137521 ?auto_137522 )
      ( MAKE-3PILE ?auto_137521 ?auto_137522 ?auto_137523 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_137530 - BLOCK
      ?auto_137531 - BLOCK
      ?auto_137532 - BLOCK
    )
    :vars
    (
      ?auto_137538 - BLOCK
      ?auto_137534 - BLOCK
      ?auto_137533 - BLOCK
      ?auto_137537 - BLOCK
      ?auto_137536 - BLOCK
      ?auto_137535 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_137530 ?auto_137531 ) ) ( not ( = ?auto_137530 ?auto_137532 ) ) ( not ( = ?auto_137531 ?auto_137532 ) ) ( not ( = ?auto_137530 ?auto_137538 ) ) ( not ( = ?auto_137531 ?auto_137538 ) ) ( not ( = ?auto_137532 ?auto_137538 ) ) ( ON-TABLE ?auto_137534 ) ( ON ?auto_137533 ?auto_137534 ) ( ON ?auto_137537 ?auto_137533 ) ( ON ?auto_137536 ?auto_137537 ) ( not ( = ?auto_137534 ?auto_137533 ) ) ( not ( = ?auto_137534 ?auto_137537 ) ) ( not ( = ?auto_137534 ?auto_137536 ) ) ( not ( = ?auto_137534 ?auto_137538 ) ) ( not ( = ?auto_137534 ?auto_137532 ) ) ( not ( = ?auto_137534 ?auto_137531 ) ) ( not ( = ?auto_137533 ?auto_137537 ) ) ( not ( = ?auto_137533 ?auto_137536 ) ) ( not ( = ?auto_137533 ?auto_137538 ) ) ( not ( = ?auto_137533 ?auto_137532 ) ) ( not ( = ?auto_137533 ?auto_137531 ) ) ( not ( = ?auto_137537 ?auto_137536 ) ) ( not ( = ?auto_137537 ?auto_137538 ) ) ( not ( = ?auto_137537 ?auto_137532 ) ) ( not ( = ?auto_137537 ?auto_137531 ) ) ( not ( = ?auto_137536 ?auto_137538 ) ) ( not ( = ?auto_137536 ?auto_137532 ) ) ( not ( = ?auto_137536 ?auto_137531 ) ) ( not ( = ?auto_137530 ?auto_137534 ) ) ( not ( = ?auto_137530 ?auto_137533 ) ) ( not ( = ?auto_137530 ?auto_137537 ) ) ( not ( = ?auto_137530 ?auto_137536 ) ) ( ON ?auto_137530 ?auto_137535 ) ( not ( = ?auto_137530 ?auto_137535 ) ) ( not ( = ?auto_137531 ?auto_137535 ) ) ( not ( = ?auto_137532 ?auto_137535 ) ) ( not ( = ?auto_137538 ?auto_137535 ) ) ( not ( = ?auto_137534 ?auto_137535 ) ) ( not ( = ?auto_137533 ?auto_137535 ) ) ( not ( = ?auto_137537 ?auto_137535 ) ) ( not ( = ?auto_137536 ?auto_137535 ) ) ( ON ?auto_137531 ?auto_137530 ) ( ON-TABLE ?auto_137535 ) ( ON ?auto_137532 ?auto_137531 ) ( CLEAR ?auto_137532 ) ( HOLDING ?auto_137538 ) ( CLEAR ?auto_137536 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_137534 ?auto_137533 ?auto_137537 ?auto_137536 ?auto_137538 )
      ( MAKE-3PILE ?auto_137530 ?auto_137531 ?auto_137532 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_137539 - BLOCK
      ?auto_137540 - BLOCK
      ?auto_137541 - BLOCK
    )
    :vars
    (
      ?auto_137545 - BLOCK
      ?auto_137546 - BLOCK
      ?auto_137542 - BLOCK
      ?auto_137547 - BLOCK
      ?auto_137543 - BLOCK
      ?auto_137544 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_137539 ?auto_137540 ) ) ( not ( = ?auto_137539 ?auto_137541 ) ) ( not ( = ?auto_137540 ?auto_137541 ) ) ( not ( = ?auto_137539 ?auto_137545 ) ) ( not ( = ?auto_137540 ?auto_137545 ) ) ( not ( = ?auto_137541 ?auto_137545 ) ) ( ON-TABLE ?auto_137546 ) ( ON ?auto_137542 ?auto_137546 ) ( ON ?auto_137547 ?auto_137542 ) ( ON ?auto_137543 ?auto_137547 ) ( not ( = ?auto_137546 ?auto_137542 ) ) ( not ( = ?auto_137546 ?auto_137547 ) ) ( not ( = ?auto_137546 ?auto_137543 ) ) ( not ( = ?auto_137546 ?auto_137545 ) ) ( not ( = ?auto_137546 ?auto_137541 ) ) ( not ( = ?auto_137546 ?auto_137540 ) ) ( not ( = ?auto_137542 ?auto_137547 ) ) ( not ( = ?auto_137542 ?auto_137543 ) ) ( not ( = ?auto_137542 ?auto_137545 ) ) ( not ( = ?auto_137542 ?auto_137541 ) ) ( not ( = ?auto_137542 ?auto_137540 ) ) ( not ( = ?auto_137547 ?auto_137543 ) ) ( not ( = ?auto_137547 ?auto_137545 ) ) ( not ( = ?auto_137547 ?auto_137541 ) ) ( not ( = ?auto_137547 ?auto_137540 ) ) ( not ( = ?auto_137543 ?auto_137545 ) ) ( not ( = ?auto_137543 ?auto_137541 ) ) ( not ( = ?auto_137543 ?auto_137540 ) ) ( not ( = ?auto_137539 ?auto_137546 ) ) ( not ( = ?auto_137539 ?auto_137542 ) ) ( not ( = ?auto_137539 ?auto_137547 ) ) ( not ( = ?auto_137539 ?auto_137543 ) ) ( ON ?auto_137539 ?auto_137544 ) ( not ( = ?auto_137539 ?auto_137544 ) ) ( not ( = ?auto_137540 ?auto_137544 ) ) ( not ( = ?auto_137541 ?auto_137544 ) ) ( not ( = ?auto_137545 ?auto_137544 ) ) ( not ( = ?auto_137546 ?auto_137544 ) ) ( not ( = ?auto_137542 ?auto_137544 ) ) ( not ( = ?auto_137547 ?auto_137544 ) ) ( not ( = ?auto_137543 ?auto_137544 ) ) ( ON ?auto_137540 ?auto_137539 ) ( ON-TABLE ?auto_137544 ) ( ON ?auto_137541 ?auto_137540 ) ( CLEAR ?auto_137543 ) ( ON ?auto_137545 ?auto_137541 ) ( CLEAR ?auto_137545 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_137544 ?auto_137539 ?auto_137540 ?auto_137541 )
      ( MAKE-3PILE ?auto_137539 ?auto_137540 ?auto_137541 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_137548 - BLOCK
      ?auto_137549 - BLOCK
      ?auto_137550 - BLOCK
    )
    :vars
    (
      ?auto_137554 - BLOCK
      ?auto_137555 - BLOCK
      ?auto_137556 - BLOCK
      ?auto_137553 - BLOCK
      ?auto_137552 - BLOCK
      ?auto_137551 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_137548 ?auto_137549 ) ) ( not ( = ?auto_137548 ?auto_137550 ) ) ( not ( = ?auto_137549 ?auto_137550 ) ) ( not ( = ?auto_137548 ?auto_137554 ) ) ( not ( = ?auto_137549 ?auto_137554 ) ) ( not ( = ?auto_137550 ?auto_137554 ) ) ( ON-TABLE ?auto_137555 ) ( ON ?auto_137556 ?auto_137555 ) ( ON ?auto_137553 ?auto_137556 ) ( not ( = ?auto_137555 ?auto_137556 ) ) ( not ( = ?auto_137555 ?auto_137553 ) ) ( not ( = ?auto_137555 ?auto_137552 ) ) ( not ( = ?auto_137555 ?auto_137554 ) ) ( not ( = ?auto_137555 ?auto_137550 ) ) ( not ( = ?auto_137555 ?auto_137549 ) ) ( not ( = ?auto_137556 ?auto_137553 ) ) ( not ( = ?auto_137556 ?auto_137552 ) ) ( not ( = ?auto_137556 ?auto_137554 ) ) ( not ( = ?auto_137556 ?auto_137550 ) ) ( not ( = ?auto_137556 ?auto_137549 ) ) ( not ( = ?auto_137553 ?auto_137552 ) ) ( not ( = ?auto_137553 ?auto_137554 ) ) ( not ( = ?auto_137553 ?auto_137550 ) ) ( not ( = ?auto_137553 ?auto_137549 ) ) ( not ( = ?auto_137552 ?auto_137554 ) ) ( not ( = ?auto_137552 ?auto_137550 ) ) ( not ( = ?auto_137552 ?auto_137549 ) ) ( not ( = ?auto_137548 ?auto_137555 ) ) ( not ( = ?auto_137548 ?auto_137556 ) ) ( not ( = ?auto_137548 ?auto_137553 ) ) ( not ( = ?auto_137548 ?auto_137552 ) ) ( ON ?auto_137548 ?auto_137551 ) ( not ( = ?auto_137548 ?auto_137551 ) ) ( not ( = ?auto_137549 ?auto_137551 ) ) ( not ( = ?auto_137550 ?auto_137551 ) ) ( not ( = ?auto_137554 ?auto_137551 ) ) ( not ( = ?auto_137555 ?auto_137551 ) ) ( not ( = ?auto_137556 ?auto_137551 ) ) ( not ( = ?auto_137553 ?auto_137551 ) ) ( not ( = ?auto_137552 ?auto_137551 ) ) ( ON ?auto_137549 ?auto_137548 ) ( ON-TABLE ?auto_137551 ) ( ON ?auto_137550 ?auto_137549 ) ( ON ?auto_137554 ?auto_137550 ) ( CLEAR ?auto_137554 ) ( HOLDING ?auto_137552 ) ( CLEAR ?auto_137553 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_137555 ?auto_137556 ?auto_137553 ?auto_137552 )
      ( MAKE-3PILE ?auto_137548 ?auto_137549 ?auto_137550 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_137557 - BLOCK
      ?auto_137558 - BLOCK
      ?auto_137559 - BLOCK
    )
    :vars
    (
      ?auto_137561 - BLOCK
      ?auto_137562 - BLOCK
      ?auto_137563 - BLOCK
      ?auto_137565 - BLOCK
      ?auto_137560 - BLOCK
      ?auto_137564 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_137557 ?auto_137558 ) ) ( not ( = ?auto_137557 ?auto_137559 ) ) ( not ( = ?auto_137558 ?auto_137559 ) ) ( not ( = ?auto_137557 ?auto_137561 ) ) ( not ( = ?auto_137558 ?auto_137561 ) ) ( not ( = ?auto_137559 ?auto_137561 ) ) ( ON-TABLE ?auto_137562 ) ( ON ?auto_137563 ?auto_137562 ) ( ON ?auto_137565 ?auto_137563 ) ( not ( = ?auto_137562 ?auto_137563 ) ) ( not ( = ?auto_137562 ?auto_137565 ) ) ( not ( = ?auto_137562 ?auto_137560 ) ) ( not ( = ?auto_137562 ?auto_137561 ) ) ( not ( = ?auto_137562 ?auto_137559 ) ) ( not ( = ?auto_137562 ?auto_137558 ) ) ( not ( = ?auto_137563 ?auto_137565 ) ) ( not ( = ?auto_137563 ?auto_137560 ) ) ( not ( = ?auto_137563 ?auto_137561 ) ) ( not ( = ?auto_137563 ?auto_137559 ) ) ( not ( = ?auto_137563 ?auto_137558 ) ) ( not ( = ?auto_137565 ?auto_137560 ) ) ( not ( = ?auto_137565 ?auto_137561 ) ) ( not ( = ?auto_137565 ?auto_137559 ) ) ( not ( = ?auto_137565 ?auto_137558 ) ) ( not ( = ?auto_137560 ?auto_137561 ) ) ( not ( = ?auto_137560 ?auto_137559 ) ) ( not ( = ?auto_137560 ?auto_137558 ) ) ( not ( = ?auto_137557 ?auto_137562 ) ) ( not ( = ?auto_137557 ?auto_137563 ) ) ( not ( = ?auto_137557 ?auto_137565 ) ) ( not ( = ?auto_137557 ?auto_137560 ) ) ( ON ?auto_137557 ?auto_137564 ) ( not ( = ?auto_137557 ?auto_137564 ) ) ( not ( = ?auto_137558 ?auto_137564 ) ) ( not ( = ?auto_137559 ?auto_137564 ) ) ( not ( = ?auto_137561 ?auto_137564 ) ) ( not ( = ?auto_137562 ?auto_137564 ) ) ( not ( = ?auto_137563 ?auto_137564 ) ) ( not ( = ?auto_137565 ?auto_137564 ) ) ( not ( = ?auto_137560 ?auto_137564 ) ) ( ON ?auto_137558 ?auto_137557 ) ( ON-TABLE ?auto_137564 ) ( ON ?auto_137559 ?auto_137558 ) ( ON ?auto_137561 ?auto_137559 ) ( CLEAR ?auto_137565 ) ( ON ?auto_137560 ?auto_137561 ) ( CLEAR ?auto_137560 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_137564 ?auto_137557 ?auto_137558 ?auto_137559 ?auto_137561 )
      ( MAKE-3PILE ?auto_137557 ?auto_137558 ?auto_137559 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_137566 - BLOCK
      ?auto_137567 - BLOCK
      ?auto_137568 - BLOCK
    )
    :vars
    (
      ?auto_137571 - BLOCK
      ?auto_137569 - BLOCK
      ?auto_137570 - BLOCK
      ?auto_137572 - BLOCK
      ?auto_137574 - BLOCK
      ?auto_137573 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_137566 ?auto_137567 ) ) ( not ( = ?auto_137566 ?auto_137568 ) ) ( not ( = ?auto_137567 ?auto_137568 ) ) ( not ( = ?auto_137566 ?auto_137571 ) ) ( not ( = ?auto_137567 ?auto_137571 ) ) ( not ( = ?auto_137568 ?auto_137571 ) ) ( ON-TABLE ?auto_137569 ) ( ON ?auto_137570 ?auto_137569 ) ( not ( = ?auto_137569 ?auto_137570 ) ) ( not ( = ?auto_137569 ?auto_137572 ) ) ( not ( = ?auto_137569 ?auto_137574 ) ) ( not ( = ?auto_137569 ?auto_137571 ) ) ( not ( = ?auto_137569 ?auto_137568 ) ) ( not ( = ?auto_137569 ?auto_137567 ) ) ( not ( = ?auto_137570 ?auto_137572 ) ) ( not ( = ?auto_137570 ?auto_137574 ) ) ( not ( = ?auto_137570 ?auto_137571 ) ) ( not ( = ?auto_137570 ?auto_137568 ) ) ( not ( = ?auto_137570 ?auto_137567 ) ) ( not ( = ?auto_137572 ?auto_137574 ) ) ( not ( = ?auto_137572 ?auto_137571 ) ) ( not ( = ?auto_137572 ?auto_137568 ) ) ( not ( = ?auto_137572 ?auto_137567 ) ) ( not ( = ?auto_137574 ?auto_137571 ) ) ( not ( = ?auto_137574 ?auto_137568 ) ) ( not ( = ?auto_137574 ?auto_137567 ) ) ( not ( = ?auto_137566 ?auto_137569 ) ) ( not ( = ?auto_137566 ?auto_137570 ) ) ( not ( = ?auto_137566 ?auto_137572 ) ) ( not ( = ?auto_137566 ?auto_137574 ) ) ( ON ?auto_137566 ?auto_137573 ) ( not ( = ?auto_137566 ?auto_137573 ) ) ( not ( = ?auto_137567 ?auto_137573 ) ) ( not ( = ?auto_137568 ?auto_137573 ) ) ( not ( = ?auto_137571 ?auto_137573 ) ) ( not ( = ?auto_137569 ?auto_137573 ) ) ( not ( = ?auto_137570 ?auto_137573 ) ) ( not ( = ?auto_137572 ?auto_137573 ) ) ( not ( = ?auto_137574 ?auto_137573 ) ) ( ON ?auto_137567 ?auto_137566 ) ( ON-TABLE ?auto_137573 ) ( ON ?auto_137568 ?auto_137567 ) ( ON ?auto_137571 ?auto_137568 ) ( ON ?auto_137574 ?auto_137571 ) ( CLEAR ?auto_137574 ) ( HOLDING ?auto_137572 ) ( CLEAR ?auto_137570 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_137569 ?auto_137570 ?auto_137572 )
      ( MAKE-3PILE ?auto_137566 ?auto_137567 ?auto_137568 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_137575 - BLOCK
      ?auto_137576 - BLOCK
      ?auto_137577 - BLOCK
    )
    :vars
    (
      ?auto_137580 - BLOCK
      ?auto_137578 - BLOCK
      ?auto_137583 - BLOCK
      ?auto_137582 - BLOCK
      ?auto_137581 - BLOCK
      ?auto_137579 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_137575 ?auto_137576 ) ) ( not ( = ?auto_137575 ?auto_137577 ) ) ( not ( = ?auto_137576 ?auto_137577 ) ) ( not ( = ?auto_137575 ?auto_137580 ) ) ( not ( = ?auto_137576 ?auto_137580 ) ) ( not ( = ?auto_137577 ?auto_137580 ) ) ( ON-TABLE ?auto_137578 ) ( ON ?auto_137583 ?auto_137578 ) ( not ( = ?auto_137578 ?auto_137583 ) ) ( not ( = ?auto_137578 ?auto_137582 ) ) ( not ( = ?auto_137578 ?auto_137581 ) ) ( not ( = ?auto_137578 ?auto_137580 ) ) ( not ( = ?auto_137578 ?auto_137577 ) ) ( not ( = ?auto_137578 ?auto_137576 ) ) ( not ( = ?auto_137583 ?auto_137582 ) ) ( not ( = ?auto_137583 ?auto_137581 ) ) ( not ( = ?auto_137583 ?auto_137580 ) ) ( not ( = ?auto_137583 ?auto_137577 ) ) ( not ( = ?auto_137583 ?auto_137576 ) ) ( not ( = ?auto_137582 ?auto_137581 ) ) ( not ( = ?auto_137582 ?auto_137580 ) ) ( not ( = ?auto_137582 ?auto_137577 ) ) ( not ( = ?auto_137582 ?auto_137576 ) ) ( not ( = ?auto_137581 ?auto_137580 ) ) ( not ( = ?auto_137581 ?auto_137577 ) ) ( not ( = ?auto_137581 ?auto_137576 ) ) ( not ( = ?auto_137575 ?auto_137578 ) ) ( not ( = ?auto_137575 ?auto_137583 ) ) ( not ( = ?auto_137575 ?auto_137582 ) ) ( not ( = ?auto_137575 ?auto_137581 ) ) ( ON ?auto_137575 ?auto_137579 ) ( not ( = ?auto_137575 ?auto_137579 ) ) ( not ( = ?auto_137576 ?auto_137579 ) ) ( not ( = ?auto_137577 ?auto_137579 ) ) ( not ( = ?auto_137580 ?auto_137579 ) ) ( not ( = ?auto_137578 ?auto_137579 ) ) ( not ( = ?auto_137583 ?auto_137579 ) ) ( not ( = ?auto_137582 ?auto_137579 ) ) ( not ( = ?auto_137581 ?auto_137579 ) ) ( ON ?auto_137576 ?auto_137575 ) ( ON-TABLE ?auto_137579 ) ( ON ?auto_137577 ?auto_137576 ) ( ON ?auto_137580 ?auto_137577 ) ( ON ?auto_137581 ?auto_137580 ) ( CLEAR ?auto_137583 ) ( ON ?auto_137582 ?auto_137581 ) ( CLEAR ?auto_137582 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_137579 ?auto_137575 ?auto_137576 ?auto_137577 ?auto_137580 ?auto_137581 )
      ( MAKE-3PILE ?auto_137575 ?auto_137576 ?auto_137577 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_137584 - BLOCK
      ?auto_137585 - BLOCK
      ?auto_137586 - BLOCK
    )
    :vars
    (
      ?auto_137592 - BLOCK
      ?auto_137588 - BLOCK
      ?auto_137590 - BLOCK
      ?auto_137587 - BLOCK
      ?auto_137591 - BLOCK
      ?auto_137589 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_137584 ?auto_137585 ) ) ( not ( = ?auto_137584 ?auto_137586 ) ) ( not ( = ?auto_137585 ?auto_137586 ) ) ( not ( = ?auto_137584 ?auto_137592 ) ) ( not ( = ?auto_137585 ?auto_137592 ) ) ( not ( = ?auto_137586 ?auto_137592 ) ) ( ON-TABLE ?auto_137588 ) ( not ( = ?auto_137588 ?auto_137590 ) ) ( not ( = ?auto_137588 ?auto_137587 ) ) ( not ( = ?auto_137588 ?auto_137591 ) ) ( not ( = ?auto_137588 ?auto_137592 ) ) ( not ( = ?auto_137588 ?auto_137586 ) ) ( not ( = ?auto_137588 ?auto_137585 ) ) ( not ( = ?auto_137590 ?auto_137587 ) ) ( not ( = ?auto_137590 ?auto_137591 ) ) ( not ( = ?auto_137590 ?auto_137592 ) ) ( not ( = ?auto_137590 ?auto_137586 ) ) ( not ( = ?auto_137590 ?auto_137585 ) ) ( not ( = ?auto_137587 ?auto_137591 ) ) ( not ( = ?auto_137587 ?auto_137592 ) ) ( not ( = ?auto_137587 ?auto_137586 ) ) ( not ( = ?auto_137587 ?auto_137585 ) ) ( not ( = ?auto_137591 ?auto_137592 ) ) ( not ( = ?auto_137591 ?auto_137586 ) ) ( not ( = ?auto_137591 ?auto_137585 ) ) ( not ( = ?auto_137584 ?auto_137588 ) ) ( not ( = ?auto_137584 ?auto_137590 ) ) ( not ( = ?auto_137584 ?auto_137587 ) ) ( not ( = ?auto_137584 ?auto_137591 ) ) ( ON ?auto_137584 ?auto_137589 ) ( not ( = ?auto_137584 ?auto_137589 ) ) ( not ( = ?auto_137585 ?auto_137589 ) ) ( not ( = ?auto_137586 ?auto_137589 ) ) ( not ( = ?auto_137592 ?auto_137589 ) ) ( not ( = ?auto_137588 ?auto_137589 ) ) ( not ( = ?auto_137590 ?auto_137589 ) ) ( not ( = ?auto_137587 ?auto_137589 ) ) ( not ( = ?auto_137591 ?auto_137589 ) ) ( ON ?auto_137585 ?auto_137584 ) ( ON-TABLE ?auto_137589 ) ( ON ?auto_137586 ?auto_137585 ) ( ON ?auto_137592 ?auto_137586 ) ( ON ?auto_137591 ?auto_137592 ) ( ON ?auto_137587 ?auto_137591 ) ( CLEAR ?auto_137587 ) ( HOLDING ?auto_137590 ) ( CLEAR ?auto_137588 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_137588 ?auto_137590 )
      ( MAKE-3PILE ?auto_137584 ?auto_137585 ?auto_137586 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_137593 - BLOCK
      ?auto_137594 - BLOCK
      ?auto_137595 - BLOCK
    )
    :vars
    (
      ?auto_137599 - BLOCK
      ?auto_137601 - BLOCK
      ?auto_137597 - BLOCK
      ?auto_137600 - BLOCK
      ?auto_137596 - BLOCK
      ?auto_137598 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_137593 ?auto_137594 ) ) ( not ( = ?auto_137593 ?auto_137595 ) ) ( not ( = ?auto_137594 ?auto_137595 ) ) ( not ( = ?auto_137593 ?auto_137599 ) ) ( not ( = ?auto_137594 ?auto_137599 ) ) ( not ( = ?auto_137595 ?auto_137599 ) ) ( ON-TABLE ?auto_137601 ) ( not ( = ?auto_137601 ?auto_137597 ) ) ( not ( = ?auto_137601 ?auto_137600 ) ) ( not ( = ?auto_137601 ?auto_137596 ) ) ( not ( = ?auto_137601 ?auto_137599 ) ) ( not ( = ?auto_137601 ?auto_137595 ) ) ( not ( = ?auto_137601 ?auto_137594 ) ) ( not ( = ?auto_137597 ?auto_137600 ) ) ( not ( = ?auto_137597 ?auto_137596 ) ) ( not ( = ?auto_137597 ?auto_137599 ) ) ( not ( = ?auto_137597 ?auto_137595 ) ) ( not ( = ?auto_137597 ?auto_137594 ) ) ( not ( = ?auto_137600 ?auto_137596 ) ) ( not ( = ?auto_137600 ?auto_137599 ) ) ( not ( = ?auto_137600 ?auto_137595 ) ) ( not ( = ?auto_137600 ?auto_137594 ) ) ( not ( = ?auto_137596 ?auto_137599 ) ) ( not ( = ?auto_137596 ?auto_137595 ) ) ( not ( = ?auto_137596 ?auto_137594 ) ) ( not ( = ?auto_137593 ?auto_137601 ) ) ( not ( = ?auto_137593 ?auto_137597 ) ) ( not ( = ?auto_137593 ?auto_137600 ) ) ( not ( = ?auto_137593 ?auto_137596 ) ) ( ON ?auto_137593 ?auto_137598 ) ( not ( = ?auto_137593 ?auto_137598 ) ) ( not ( = ?auto_137594 ?auto_137598 ) ) ( not ( = ?auto_137595 ?auto_137598 ) ) ( not ( = ?auto_137599 ?auto_137598 ) ) ( not ( = ?auto_137601 ?auto_137598 ) ) ( not ( = ?auto_137597 ?auto_137598 ) ) ( not ( = ?auto_137600 ?auto_137598 ) ) ( not ( = ?auto_137596 ?auto_137598 ) ) ( ON ?auto_137594 ?auto_137593 ) ( ON-TABLE ?auto_137598 ) ( ON ?auto_137595 ?auto_137594 ) ( ON ?auto_137599 ?auto_137595 ) ( ON ?auto_137596 ?auto_137599 ) ( ON ?auto_137600 ?auto_137596 ) ( CLEAR ?auto_137601 ) ( ON ?auto_137597 ?auto_137600 ) ( CLEAR ?auto_137597 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_137598 ?auto_137593 ?auto_137594 ?auto_137595 ?auto_137599 ?auto_137596 ?auto_137600 )
      ( MAKE-3PILE ?auto_137593 ?auto_137594 ?auto_137595 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_137602 - BLOCK
      ?auto_137603 - BLOCK
      ?auto_137604 - BLOCK
    )
    :vars
    (
      ?auto_137605 - BLOCK
      ?auto_137606 - BLOCK
      ?auto_137607 - BLOCK
      ?auto_137610 - BLOCK
      ?auto_137608 - BLOCK
      ?auto_137609 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_137602 ?auto_137603 ) ) ( not ( = ?auto_137602 ?auto_137604 ) ) ( not ( = ?auto_137603 ?auto_137604 ) ) ( not ( = ?auto_137602 ?auto_137605 ) ) ( not ( = ?auto_137603 ?auto_137605 ) ) ( not ( = ?auto_137604 ?auto_137605 ) ) ( not ( = ?auto_137606 ?auto_137607 ) ) ( not ( = ?auto_137606 ?auto_137610 ) ) ( not ( = ?auto_137606 ?auto_137608 ) ) ( not ( = ?auto_137606 ?auto_137605 ) ) ( not ( = ?auto_137606 ?auto_137604 ) ) ( not ( = ?auto_137606 ?auto_137603 ) ) ( not ( = ?auto_137607 ?auto_137610 ) ) ( not ( = ?auto_137607 ?auto_137608 ) ) ( not ( = ?auto_137607 ?auto_137605 ) ) ( not ( = ?auto_137607 ?auto_137604 ) ) ( not ( = ?auto_137607 ?auto_137603 ) ) ( not ( = ?auto_137610 ?auto_137608 ) ) ( not ( = ?auto_137610 ?auto_137605 ) ) ( not ( = ?auto_137610 ?auto_137604 ) ) ( not ( = ?auto_137610 ?auto_137603 ) ) ( not ( = ?auto_137608 ?auto_137605 ) ) ( not ( = ?auto_137608 ?auto_137604 ) ) ( not ( = ?auto_137608 ?auto_137603 ) ) ( not ( = ?auto_137602 ?auto_137606 ) ) ( not ( = ?auto_137602 ?auto_137607 ) ) ( not ( = ?auto_137602 ?auto_137610 ) ) ( not ( = ?auto_137602 ?auto_137608 ) ) ( ON ?auto_137602 ?auto_137609 ) ( not ( = ?auto_137602 ?auto_137609 ) ) ( not ( = ?auto_137603 ?auto_137609 ) ) ( not ( = ?auto_137604 ?auto_137609 ) ) ( not ( = ?auto_137605 ?auto_137609 ) ) ( not ( = ?auto_137606 ?auto_137609 ) ) ( not ( = ?auto_137607 ?auto_137609 ) ) ( not ( = ?auto_137610 ?auto_137609 ) ) ( not ( = ?auto_137608 ?auto_137609 ) ) ( ON ?auto_137603 ?auto_137602 ) ( ON-TABLE ?auto_137609 ) ( ON ?auto_137604 ?auto_137603 ) ( ON ?auto_137605 ?auto_137604 ) ( ON ?auto_137608 ?auto_137605 ) ( ON ?auto_137610 ?auto_137608 ) ( ON ?auto_137607 ?auto_137610 ) ( CLEAR ?auto_137607 ) ( HOLDING ?auto_137606 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_137606 )
      ( MAKE-3PILE ?auto_137602 ?auto_137603 ?auto_137604 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_137611 - BLOCK
      ?auto_137612 - BLOCK
      ?auto_137613 - BLOCK
    )
    :vars
    (
      ?auto_137617 - BLOCK
      ?auto_137616 - BLOCK
      ?auto_137618 - BLOCK
      ?auto_137614 - BLOCK
      ?auto_137615 - BLOCK
      ?auto_137619 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_137611 ?auto_137612 ) ) ( not ( = ?auto_137611 ?auto_137613 ) ) ( not ( = ?auto_137612 ?auto_137613 ) ) ( not ( = ?auto_137611 ?auto_137617 ) ) ( not ( = ?auto_137612 ?auto_137617 ) ) ( not ( = ?auto_137613 ?auto_137617 ) ) ( not ( = ?auto_137616 ?auto_137618 ) ) ( not ( = ?auto_137616 ?auto_137614 ) ) ( not ( = ?auto_137616 ?auto_137615 ) ) ( not ( = ?auto_137616 ?auto_137617 ) ) ( not ( = ?auto_137616 ?auto_137613 ) ) ( not ( = ?auto_137616 ?auto_137612 ) ) ( not ( = ?auto_137618 ?auto_137614 ) ) ( not ( = ?auto_137618 ?auto_137615 ) ) ( not ( = ?auto_137618 ?auto_137617 ) ) ( not ( = ?auto_137618 ?auto_137613 ) ) ( not ( = ?auto_137618 ?auto_137612 ) ) ( not ( = ?auto_137614 ?auto_137615 ) ) ( not ( = ?auto_137614 ?auto_137617 ) ) ( not ( = ?auto_137614 ?auto_137613 ) ) ( not ( = ?auto_137614 ?auto_137612 ) ) ( not ( = ?auto_137615 ?auto_137617 ) ) ( not ( = ?auto_137615 ?auto_137613 ) ) ( not ( = ?auto_137615 ?auto_137612 ) ) ( not ( = ?auto_137611 ?auto_137616 ) ) ( not ( = ?auto_137611 ?auto_137618 ) ) ( not ( = ?auto_137611 ?auto_137614 ) ) ( not ( = ?auto_137611 ?auto_137615 ) ) ( ON ?auto_137611 ?auto_137619 ) ( not ( = ?auto_137611 ?auto_137619 ) ) ( not ( = ?auto_137612 ?auto_137619 ) ) ( not ( = ?auto_137613 ?auto_137619 ) ) ( not ( = ?auto_137617 ?auto_137619 ) ) ( not ( = ?auto_137616 ?auto_137619 ) ) ( not ( = ?auto_137618 ?auto_137619 ) ) ( not ( = ?auto_137614 ?auto_137619 ) ) ( not ( = ?auto_137615 ?auto_137619 ) ) ( ON ?auto_137612 ?auto_137611 ) ( ON-TABLE ?auto_137619 ) ( ON ?auto_137613 ?auto_137612 ) ( ON ?auto_137617 ?auto_137613 ) ( ON ?auto_137615 ?auto_137617 ) ( ON ?auto_137614 ?auto_137615 ) ( ON ?auto_137618 ?auto_137614 ) ( ON ?auto_137616 ?auto_137618 ) ( CLEAR ?auto_137616 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_137619 ?auto_137611 ?auto_137612 ?auto_137613 ?auto_137617 ?auto_137615 ?auto_137614 ?auto_137618 )
      ( MAKE-3PILE ?auto_137611 ?auto_137612 ?auto_137613 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_137643 - BLOCK
      ?auto_137644 - BLOCK
      ?auto_137645 - BLOCK
      ?auto_137646 - BLOCK
    )
    :vars
    (
      ?auto_137647 - BLOCK
      ?auto_137649 - BLOCK
      ?auto_137648 - BLOCK
      ?auto_137650 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_137647 ?auto_137646 ) ( ON-TABLE ?auto_137643 ) ( ON ?auto_137644 ?auto_137643 ) ( ON ?auto_137645 ?auto_137644 ) ( ON ?auto_137646 ?auto_137645 ) ( not ( = ?auto_137643 ?auto_137644 ) ) ( not ( = ?auto_137643 ?auto_137645 ) ) ( not ( = ?auto_137643 ?auto_137646 ) ) ( not ( = ?auto_137643 ?auto_137647 ) ) ( not ( = ?auto_137644 ?auto_137645 ) ) ( not ( = ?auto_137644 ?auto_137646 ) ) ( not ( = ?auto_137644 ?auto_137647 ) ) ( not ( = ?auto_137645 ?auto_137646 ) ) ( not ( = ?auto_137645 ?auto_137647 ) ) ( not ( = ?auto_137646 ?auto_137647 ) ) ( not ( = ?auto_137643 ?auto_137649 ) ) ( not ( = ?auto_137643 ?auto_137648 ) ) ( not ( = ?auto_137644 ?auto_137649 ) ) ( not ( = ?auto_137644 ?auto_137648 ) ) ( not ( = ?auto_137645 ?auto_137649 ) ) ( not ( = ?auto_137645 ?auto_137648 ) ) ( not ( = ?auto_137646 ?auto_137649 ) ) ( not ( = ?auto_137646 ?auto_137648 ) ) ( not ( = ?auto_137647 ?auto_137649 ) ) ( not ( = ?auto_137647 ?auto_137648 ) ) ( not ( = ?auto_137649 ?auto_137648 ) ) ( ON ?auto_137649 ?auto_137647 ) ( CLEAR ?auto_137649 ) ( HOLDING ?auto_137648 ) ( CLEAR ?auto_137650 ) ( ON-TABLE ?auto_137650 ) ( not ( = ?auto_137650 ?auto_137648 ) ) ( not ( = ?auto_137643 ?auto_137650 ) ) ( not ( = ?auto_137644 ?auto_137650 ) ) ( not ( = ?auto_137645 ?auto_137650 ) ) ( not ( = ?auto_137646 ?auto_137650 ) ) ( not ( = ?auto_137647 ?auto_137650 ) ) ( not ( = ?auto_137649 ?auto_137650 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_137650 ?auto_137648 )
      ( MAKE-4PILE ?auto_137643 ?auto_137644 ?auto_137645 ?auto_137646 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_137651 - BLOCK
      ?auto_137652 - BLOCK
      ?auto_137653 - BLOCK
      ?auto_137654 - BLOCK
    )
    :vars
    (
      ?auto_137655 - BLOCK
      ?auto_137657 - BLOCK
      ?auto_137656 - BLOCK
      ?auto_137658 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_137655 ?auto_137654 ) ( ON-TABLE ?auto_137651 ) ( ON ?auto_137652 ?auto_137651 ) ( ON ?auto_137653 ?auto_137652 ) ( ON ?auto_137654 ?auto_137653 ) ( not ( = ?auto_137651 ?auto_137652 ) ) ( not ( = ?auto_137651 ?auto_137653 ) ) ( not ( = ?auto_137651 ?auto_137654 ) ) ( not ( = ?auto_137651 ?auto_137655 ) ) ( not ( = ?auto_137652 ?auto_137653 ) ) ( not ( = ?auto_137652 ?auto_137654 ) ) ( not ( = ?auto_137652 ?auto_137655 ) ) ( not ( = ?auto_137653 ?auto_137654 ) ) ( not ( = ?auto_137653 ?auto_137655 ) ) ( not ( = ?auto_137654 ?auto_137655 ) ) ( not ( = ?auto_137651 ?auto_137657 ) ) ( not ( = ?auto_137651 ?auto_137656 ) ) ( not ( = ?auto_137652 ?auto_137657 ) ) ( not ( = ?auto_137652 ?auto_137656 ) ) ( not ( = ?auto_137653 ?auto_137657 ) ) ( not ( = ?auto_137653 ?auto_137656 ) ) ( not ( = ?auto_137654 ?auto_137657 ) ) ( not ( = ?auto_137654 ?auto_137656 ) ) ( not ( = ?auto_137655 ?auto_137657 ) ) ( not ( = ?auto_137655 ?auto_137656 ) ) ( not ( = ?auto_137657 ?auto_137656 ) ) ( ON ?auto_137657 ?auto_137655 ) ( CLEAR ?auto_137658 ) ( ON-TABLE ?auto_137658 ) ( not ( = ?auto_137658 ?auto_137656 ) ) ( not ( = ?auto_137651 ?auto_137658 ) ) ( not ( = ?auto_137652 ?auto_137658 ) ) ( not ( = ?auto_137653 ?auto_137658 ) ) ( not ( = ?auto_137654 ?auto_137658 ) ) ( not ( = ?auto_137655 ?auto_137658 ) ) ( not ( = ?auto_137657 ?auto_137658 ) ) ( ON ?auto_137656 ?auto_137657 ) ( CLEAR ?auto_137656 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_137651 ?auto_137652 ?auto_137653 ?auto_137654 ?auto_137655 ?auto_137657 )
      ( MAKE-4PILE ?auto_137651 ?auto_137652 ?auto_137653 ?auto_137654 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_137659 - BLOCK
      ?auto_137660 - BLOCK
      ?auto_137661 - BLOCK
      ?auto_137662 - BLOCK
    )
    :vars
    (
      ?auto_137666 - BLOCK
      ?auto_137664 - BLOCK
      ?auto_137663 - BLOCK
      ?auto_137665 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_137666 ?auto_137662 ) ( ON-TABLE ?auto_137659 ) ( ON ?auto_137660 ?auto_137659 ) ( ON ?auto_137661 ?auto_137660 ) ( ON ?auto_137662 ?auto_137661 ) ( not ( = ?auto_137659 ?auto_137660 ) ) ( not ( = ?auto_137659 ?auto_137661 ) ) ( not ( = ?auto_137659 ?auto_137662 ) ) ( not ( = ?auto_137659 ?auto_137666 ) ) ( not ( = ?auto_137660 ?auto_137661 ) ) ( not ( = ?auto_137660 ?auto_137662 ) ) ( not ( = ?auto_137660 ?auto_137666 ) ) ( not ( = ?auto_137661 ?auto_137662 ) ) ( not ( = ?auto_137661 ?auto_137666 ) ) ( not ( = ?auto_137662 ?auto_137666 ) ) ( not ( = ?auto_137659 ?auto_137664 ) ) ( not ( = ?auto_137659 ?auto_137663 ) ) ( not ( = ?auto_137660 ?auto_137664 ) ) ( not ( = ?auto_137660 ?auto_137663 ) ) ( not ( = ?auto_137661 ?auto_137664 ) ) ( not ( = ?auto_137661 ?auto_137663 ) ) ( not ( = ?auto_137662 ?auto_137664 ) ) ( not ( = ?auto_137662 ?auto_137663 ) ) ( not ( = ?auto_137666 ?auto_137664 ) ) ( not ( = ?auto_137666 ?auto_137663 ) ) ( not ( = ?auto_137664 ?auto_137663 ) ) ( ON ?auto_137664 ?auto_137666 ) ( not ( = ?auto_137665 ?auto_137663 ) ) ( not ( = ?auto_137659 ?auto_137665 ) ) ( not ( = ?auto_137660 ?auto_137665 ) ) ( not ( = ?auto_137661 ?auto_137665 ) ) ( not ( = ?auto_137662 ?auto_137665 ) ) ( not ( = ?auto_137666 ?auto_137665 ) ) ( not ( = ?auto_137664 ?auto_137665 ) ) ( ON ?auto_137663 ?auto_137664 ) ( CLEAR ?auto_137663 ) ( HOLDING ?auto_137665 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_137665 )
      ( MAKE-4PILE ?auto_137659 ?auto_137660 ?auto_137661 ?auto_137662 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_137679 - BLOCK
      ?auto_137680 - BLOCK
      ?auto_137681 - BLOCK
      ?auto_137682 - BLOCK
    )
    :vars
    (
      ?auto_137683 - BLOCK
      ?auto_137684 - BLOCK
      ?auto_137685 - BLOCK
      ?auto_137686 - BLOCK
      ?auto_137687 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_137683 ?auto_137682 ) ( ON-TABLE ?auto_137679 ) ( ON ?auto_137680 ?auto_137679 ) ( ON ?auto_137681 ?auto_137680 ) ( ON ?auto_137682 ?auto_137681 ) ( not ( = ?auto_137679 ?auto_137680 ) ) ( not ( = ?auto_137679 ?auto_137681 ) ) ( not ( = ?auto_137679 ?auto_137682 ) ) ( not ( = ?auto_137679 ?auto_137683 ) ) ( not ( = ?auto_137680 ?auto_137681 ) ) ( not ( = ?auto_137680 ?auto_137682 ) ) ( not ( = ?auto_137680 ?auto_137683 ) ) ( not ( = ?auto_137681 ?auto_137682 ) ) ( not ( = ?auto_137681 ?auto_137683 ) ) ( not ( = ?auto_137682 ?auto_137683 ) ) ( not ( = ?auto_137679 ?auto_137684 ) ) ( not ( = ?auto_137679 ?auto_137685 ) ) ( not ( = ?auto_137680 ?auto_137684 ) ) ( not ( = ?auto_137680 ?auto_137685 ) ) ( not ( = ?auto_137681 ?auto_137684 ) ) ( not ( = ?auto_137681 ?auto_137685 ) ) ( not ( = ?auto_137682 ?auto_137684 ) ) ( not ( = ?auto_137682 ?auto_137685 ) ) ( not ( = ?auto_137683 ?auto_137684 ) ) ( not ( = ?auto_137683 ?auto_137685 ) ) ( not ( = ?auto_137684 ?auto_137685 ) ) ( ON ?auto_137684 ?auto_137683 ) ( not ( = ?auto_137686 ?auto_137685 ) ) ( not ( = ?auto_137679 ?auto_137686 ) ) ( not ( = ?auto_137680 ?auto_137686 ) ) ( not ( = ?auto_137681 ?auto_137686 ) ) ( not ( = ?auto_137682 ?auto_137686 ) ) ( not ( = ?auto_137683 ?auto_137686 ) ) ( not ( = ?auto_137684 ?auto_137686 ) ) ( ON ?auto_137685 ?auto_137684 ) ( CLEAR ?auto_137685 ) ( ON ?auto_137686 ?auto_137687 ) ( CLEAR ?auto_137686 ) ( HAND-EMPTY ) ( not ( = ?auto_137679 ?auto_137687 ) ) ( not ( = ?auto_137680 ?auto_137687 ) ) ( not ( = ?auto_137681 ?auto_137687 ) ) ( not ( = ?auto_137682 ?auto_137687 ) ) ( not ( = ?auto_137683 ?auto_137687 ) ) ( not ( = ?auto_137684 ?auto_137687 ) ) ( not ( = ?auto_137685 ?auto_137687 ) ) ( not ( = ?auto_137686 ?auto_137687 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_137686 ?auto_137687 )
      ( MAKE-4PILE ?auto_137679 ?auto_137680 ?auto_137681 ?auto_137682 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_137688 - BLOCK
      ?auto_137689 - BLOCK
      ?auto_137690 - BLOCK
      ?auto_137691 - BLOCK
    )
    :vars
    (
      ?auto_137692 - BLOCK
      ?auto_137693 - BLOCK
      ?auto_137696 - BLOCK
      ?auto_137694 - BLOCK
      ?auto_137695 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_137692 ?auto_137691 ) ( ON-TABLE ?auto_137688 ) ( ON ?auto_137689 ?auto_137688 ) ( ON ?auto_137690 ?auto_137689 ) ( ON ?auto_137691 ?auto_137690 ) ( not ( = ?auto_137688 ?auto_137689 ) ) ( not ( = ?auto_137688 ?auto_137690 ) ) ( not ( = ?auto_137688 ?auto_137691 ) ) ( not ( = ?auto_137688 ?auto_137692 ) ) ( not ( = ?auto_137689 ?auto_137690 ) ) ( not ( = ?auto_137689 ?auto_137691 ) ) ( not ( = ?auto_137689 ?auto_137692 ) ) ( not ( = ?auto_137690 ?auto_137691 ) ) ( not ( = ?auto_137690 ?auto_137692 ) ) ( not ( = ?auto_137691 ?auto_137692 ) ) ( not ( = ?auto_137688 ?auto_137693 ) ) ( not ( = ?auto_137688 ?auto_137696 ) ) ( not ( = ?auto_137689 ?auto_137693 ) ) ( not ( = ?auto_137689 ?auto_137696 ) ) ( not ( = ?auto_137690 ?auto_137693 ) ) ( not ( = ?auto_137690 ?auto_137696 ) ) ( not ( = ?auto_137691 ?auto_137693 ) ) ( not ( = ?auto_137691 ?auto_137696 ) ) ( not ( = ?auto_137692 ?auto_137693 ) ) ( not ( = ?auto_137692 ?auto_137696 ) ) ( not ( = ?auto_137693 ?auto_137696 ) ) ( ON ?auto_137693 ?auto_137692 ) ( not ( = ?auto_137694 ?auto_137696 ) ) ( not ( = ?auto_137688 ?auto_137694 ) ) ( not ( = ?auto_137689 ?auto_137694 ) ) ( not ( = ?auto_137690 ?auto_137694 ) ) ( not ( = ?auto_137691 ?auto_137694 ) ) ( not ( = ?auto_137692 ?auto_137694 ) ) ( not ( = ?auto_137693 ?auto_137694 ) ) ( ON ?auto_137694 ?auto_137695 ) ( CLEAR ?auto_137694 ) ( not ( = ?auto_137688 ?auto_137695 ) ) ( not ( = ?auto_137689 ?auto_137695 ) ) ( not ( = ?auto_137690 ?auto_137695 ) ) ( not ( = ?auto_137691 ?auto_137695 ) ) ( not ( = ?auto_137692 ?auto_137695 ) ) ( not ( = ?auto_137693 ?auto_137695 ) ) ( not ( = ?auto_137696 ?auto_137695 ) ) ( not ( = ?auto_137694 ?auto_137695 ) ) ( HOLDING ?auto_137696 ) ( CLEAR ?auto_137693 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_137688 ?auto_137689 ?auto_137690 ?auto_137691 ?auto_137692 ?auto_137693 ?auto_137696 )
      ( MAKE-4PILE ?auto_137688 ?auto_137689 ?auto_137690 ?auto_137691 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_137770 - BLOCK
      ?auto_137771 - BLOCK
      ?auto_137772 - BLOCK
      ?auto_137773 - BLOCK
    )
    :vars
    (
      ?auto_137774 - BLOCK
      ?auto_137776 - BLOCK
      ?auto_137775 - BLOCK
      ?auto_137777 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_137770 ) ( ON ?auto_137771 ?auto_137770 ) ( not ( = ?auto_137770 ?auto_137771 ) ) ( not ( = ?auto_137770 ?auto_137772 ) ) ( not ( = ?auto_137770 ?auto_137773 ) ) ( not ( = ?auto_137771 ?auto_137772 ) ) ( not ( = ?auto_137771 ?auto_137773 ) ) ( not ( = ?auto_137772 ?auto_137773 ) ) ( ON ?auto_137773 ?auto_137774 ) ( not ( = ?auto_137770 ?auto_137774 ) ) ( not ( = ?auto_137771 ?auto_137774 ) ) ( not ( = ?auto_137772 ?auto_137774 ) ) ( not ( = ?auto_137773 ?auto_137774 ) ) ( CLEAR ?auto_137771 ) ( ON ?auto_137772 ?auto_137773 ) ( CLEAR ?auto_137772 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_137776 ) ( ON ?auto_137775 ?auto_137776 ) ( ON ?auto_137777 ?auto_137775 ) ( ON ?auto_137774 ?auto_137777 ) ( not ( = ?auto_137776 ?auto_137775 ) ) ( not ( = ?auto_137776 ?auto_137777 ) ) ( not ( = ?auto_137776 ?auto_137774 ) ) ( not ( = ?auto_137776 ?auto_137773 ) ) ( not ( = ?auto_137776 ?auto_137772 ) ) ( not ( = ?auto_137775 ?auto_137777 ) ) ( not ( = ?auto_137775 ?auto_137774 ) ) ( not ( = ?auto_137775 ?auto_137773 ) ) ( not ( = ?auto_137775 ?auto_137772 ) ) ( not ( = ?auto_137777 ?auto_137774 ) ) ( not ( = ?auto_137777 ?auto_137773 ) ) ( not ( = ?auto_137777 ?auto_137772 ) ) ( not ( = ?auto_137770 ?auto_137776 ) ) ( not ( = ?auto_137770 ?auto_137775 ) ) ( not ( = ?auto_137770 ?auto_137777 ) ) ( not ( = ?auto_137771 ?auto_137776 ) ) ( not ( = ?auto_137771 ?auto_137775 ) ) ( not ( = ?auto_137771 ?auto_137777 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_137776 ?auto_137775 ?auto_137777 ?auto_137774 ?auto_137773 )
      ( MAKE-4PILE ?auto_137770 ?auto_137771 ?auto_137772 ?auto_137773 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_137778 - BLOCK
      ?auto_137779 - BLOCK
      ?auto_137780 - BLOCK
      ?auto_137781 - BLOCK
    )
    :vars
    (
      ?auto_137784 - BLOCK
      ?auto_137785 - BLOCK
      ?auto_137782 - BLOCK
      ?auto_137783 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_137778 ) ( not ( = ?auto_137778 ?auto_137779 ) ) ( not ( = ?auto_137778 ?auto_137780 ) ) ( not ( = ?auto_137778 ?auto_137781 ) ) ( not ( = ?auto_137779 ?auto_137780 ) ) ( not ( = ?auto_137779 ?auto_137781 ) ) ( not ( = ?auto_137780 ?auto_137781 ) ) ( ON ?auto_137781 ?auto_137784 ) ( not ( = ?auto_137778 ?auto_137784 ) ) ( not ( = ?auto_137779 ?auto_137784 ) ) ( not ( = ?auto_137780 ?auto_137784 ) ) ( not ( = ?auto_137781 ?auto_137784 ) ) ( ON ?auto_137780 ?auto_137781 ) ( CLEAR ?auto_137780 ) ( ON-TABLE ?auto_137785 ) ( ON ?auto_137782 ?auto_137785 ) ( ON ?auto_137783 ?auto_137782 ) ( ON ?auto_137784 ?auto_137783 ) ( not ( = ?auto_137785 ?auto_137782 ) ) ( not ( = ?auto_137785 ?auto_137783 ) ) ( not ( = ?auto_137785 ?auto_137784 ) ) ( not ( = ?auto_137785 ?auto_137781 ) ) ( not ( = ?auto_137785 ?auto_137780 ) ) ( not ( = ?auto_137782 ?auto_137783 ) ) ( not ( = ?auto_137782 ?auto_137784 ) ) ( not ( = ?auto_137782 ?auto_137781 ) ) ( not ( = ?auto_137782 ?auto_137780 ) ) ( not ( = ?auto_137783 ?auto_137784 ) ) ( not ( = ?auto_137783 ?auto_137781 ) ) ( not ( = ?auto_137783 ?auto_137780 ) ) ( not ( = ?auto_137778 ?auto_137785 ) ) ( not ( = ?auto_137778 ?auto_137782 ) ) ( not ( = ?auto_137778 ?auto_137783 ) ) ( not ( = ?auto_137779 ?auto_137785 ) ) ( not ( = ?auto_137779 ?auto_137782 ) ) ( not ( = ?auto_137779 ?auto_137783 ) ) ( HOLDING ?auto_137779 ) ( CLEAR ?auto_137778 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_137778 ?auto_137779 )
      ( MAKE-4PILE ?auto_137778 ?auto_137779 ?auto_137780 ?auto_137781 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_137786 - BLOCK
      ?auto_137787 - BLOCK
      ?auto_137788 - BLOCK
      ?auto_137789 - BLOCK
    )
    :vars
    (
      ?auto_137793 - BLOCK
      ?auto_137792 - BLOCK
      ?auto_137791 - BLOCK
      ?auto_137790 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_137786 ) ( not ( = ?auto_137786 ?auto_137787 ) ) ( not ( = ?auto_137786 ?auto_137788 ) ) ( not ( = ?auto_137786 ?auto_137789 ) ) ( not ( = ?auto_137787 ?auto_137788 ) ) ( not ( = ?auto_137787 ?auto_137789 ) ) ( not ( = ?auto_137788 ?auto_137789 ) ) ( ON ?auto_137789 ?auto_137793 ) ( not ( = ?auto_137786 ?auto_137793 ) ) ( not ( = ?auto_137787 ?auto_137793 ) ) ( not ( = ?auto_137788 ?auto_137793 ) ) ( not ( = ?auto_137789 ?auto_137793 ) ) ( ON ?auto_137788 ?auto_137789 ) ( ON-TABLE ?auto_137792 ) ( ON ?auto_137791 ?auto_137792 ) ( ON ?auto_137790 ?auto_137791 ) ( ON ?auto_137793 ?auto_137790 ) ( not ( = ?auto_137792 ?auto_137791 ) ) ( not ( = ?auto_137792 ?auto_137790 ) ) ( not ( = ?auto_137792 ?auto_137793 ) ) ( not ( = ?auto_137792 ?auto_137789 ) ) ( not ( = ?auto_137792 ?auto_137788 ) ) ( not ( = ?auto_137791 ?auto_137790 ) ) ( not ( = ?auto_137791 ?auto_137793 ) ) ( not ( = ?auto_137791 ?auto_137789 ) ) ( not ( = ?auto_137791 ?auto_137788 ) ) ( not ( = ?auto_137790 ?auto_137793 ) ) ( not ( = ?auto_137790 ?auto_137789 ) ) ( not ( = ?auto_137790 ?auto_137788 ) ) ( not ( = ?auto_137786 ?auto_137792 ) ) ( not ( = ?auto_137786 ?auto_137791 ) ) ( not ( = ?auto_137786 ?auto_137790 ) ) ( not ( = ?auto_137787 ?auto_137792 ) ) ( not ( = ?auto_137787 ?auto_137791 ) ) ( not ( = ?auto_137787 ?auto_137790 ) ) ( CLEAR ?auto_137786 ) ( ON ?auto_137787 ?auto_137788 ) ( CLEAR ?auto_137787 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_137792 ?auto_137791 ?auto_137790 ?auto_137793 ?auto_137789 ?auto_137788 )
      ( MAKE-4PILE ?auto_137786 ?auto_137787 ?auto_137788 ?auto_137789 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_137794 - BLOCK
      ?auto_137795 - BLOCK
      ?auto_137796 - BLOCK
      ?auto_137797 - BLOCK
    )
    :vars
    (
      ?auto_137800 - BLOCK
      ?auto_137798 - BLOCK
      ?auto_137799 - BLOCK
      ?auto_137801 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_137794 ?auto_137795 ) ) ( not ( = ?auto_137794 ?auto_137796 ) ) ( not ( = ?auto_137794 ?auto_137797 ) ) ( not ( = ?auto_137795 ?auto_137796 ) ) ( not ( = ?auto_137795 ?auto_137797 ) ) ( not ( = ?auto_137796 ?auto_137797 ) ) ( ON ?auto_137797 ?auto_137800 ) ( not ( = ?auto_137794 ?auto_137800 ) ) ( not ( = ?auto_137795 ?auto_137800 ) ) ( not ( = ?auto_137796 ?auto_137800 ) ) ( not ( = ?auto_137797 ?auto_137800 ) ) ( ON ?auto_137796 ?auto_137797 ) ( ON-TABLE ?auto_137798 ) ( ON ?auto_137799 ?auto_137798 ) ( ON ?auto_137801 ?auto_137799 ) ( ON ?auto_137800 ?auto_137801 ) ( not ( = ?auto_137798 ?auto_137799 ) ) ( not ( = ?auto_137798 ?auto_137801 ) ) ( not ( = ?auto_137798 ?auto_137800 ) ) ( not ( = ?auto_137798 ?auto_137797 ) ) ( not ( = ?auto_137798 ?auto_137796 ) ) ( not ( = ?auto_137799 ?auto_137801 ) ) ( not ( = ?auto_137799 ?auto_137800 ) ) ( not ( = ?auto_137799 ?auto_137797 ) ) ( not ( = ?auto_137799 ?auto_137796 ) ) ( not ( = ?auto_137801 ?auto_137800 ) ) ( not ( = ?auto_137801 ?auto_137797 ) ) ( not ( = ?auto_137801 ?auto_137796 ) ) ( not ( = ?auto_137794 ?auto_137798 ) ) ( not ( = ?auto_137794 ?auto_137799 ) ) ( not ( = ?auto_137794 ?auto_137801 ) ) ( not ( = ?auto_137795 ?auto_137798 ) ) ( not ( = ?auto_137795 ?auto_137799 ) ) ( not ( = ?auto_137795 ?auto_137801 ) ) ( ON ?auto_137795 ?auto_137796 ) ( CLEAR ?auto_137795 ) ( HOLDING ?auto_137794 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_137794 )
      ( MAKE-4PILE ?auto_137794 ?auto_137795 ?auto_137796 ?auto_137797 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_137802 - BLOCK
      ?auto_137803 - BLOCK
      ?auto_137804 - BLOCK
      ?auto_137805 - BLOCK
    )
    :vars
    (
      ?auto_137808 - BLOCK
      ?auto_137807 - BLOCK
      ?auto_137806 - BLOCK
      ?auto_137809 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_137802 ?auto_137803 ) ) ( not ( = ?auto_137802 ?auto_137804 ) ) ( not ( = ?auto_137802 ?auto_137805 ) ) ( not ( = ?auto_137803 ?auto_137804 ) ) ( not ( = ?auto_137803 ?auto_137805 ) ) ( not ( = ?auto_137804 ?auto_137805 ) ) ( ON ?auto_137805 ?auto_137808 ) ( not ( = ?auto_137802 ?auto_137808 ) ) ( not ( = ?auto_137803 ?auto_137808 ) ) ( not ( = ?auto_137804 ?auto_137808 ) ) ( not ( = ?auto_137805 ?auto_137808 ) ) ( ON ?auto_137804 ?auto_137805 ) ( ON-TABLE ?auto_137807 ) ( ON ?auto_137806 ?auto_137807 ) ( ON ?auto_137809 ?auto_137806 ) ( ON ?auto_137808 ?auto_137809 ) ( not ( = ?auto_137807 ?auto_137806 ) ) ( not ( = ?auto_137807 ?auto_137809 ) ) ( not ( = ?auto_137807 ?auto_137808 ) ) ( not ( = ?auto_137807 ?auto_137805 ) ) ( not ( = ?auto_137807 ?auto_137804 ) ) ( not ( = ?auto_137806 ?auto_137809 ) ) ( not ( = ?auto_137806 ?auto_137808 ) ) ( not ( = ?auto_137806 ?auto_137805 ) ) ( not ( = ?auto_137806 ?auto_137804 ) ) ( not ( = ?auto_137809 ?auto_137808 ) ) ( not ( = ?auto_137809 ?auto_137805 ) ) ( not ( = ?auto_137809 ?auto_137804 ) ) ( not ( = ?auto_137802 ?auto_137807 ) ) ( not ( = ?auto_137802 ?auto_137806 ) ) ( not ( = ?auto_137802 ?auto_137809 ) ) ( not ( = ?auto_137803 ?auto_137807 ) ) ( not ( = ?auto_137803 ?auto_137806 ) ) ( not ( = ?auto_137803 ?auto_137809 ) ) ( ON ?auto_137803 ?auto_137804 ) ( ON ?auto_137802 ?auto_137803 ) ( CLEAR ?auto_137802 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_137807 ?auto_137806 ?auto_137809 ?auto_137808 ?auto_137805 ?auto_137804 ?auto_137803 )
      ( MAKE-4PILE ?auto_137802 ?auto_137803 ?auto_137804 ?auto_137805 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_137814 - BLOCK
      ?auto_137815 - BLOCK
      ?auto_137816 - BLOCK
      ?auto_137817 - BLOCK
    )
    :vars
    (
      ?auto_137821 - BLOCK
      ?auto_137820 - BLOCK
      ?auto_137818 - BLOCK
      ?auto_137819 - BLOCK
      ?auto_137822 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_137814 ?auto_137815 ) ) ( not ( = ?auto_137814 ?auto_137816 ) ) ( not ( = ?auto_137814 ?auto_137817 ) ) ( not ( = ?auto_137815 ?auto_137816 ) ) ( not ( = ?auto_137815 ?auto_137817 ) ) ( not ( = ?auto_137816 ?auto_137817 ) ) ( ON ?auto_137817 ?auto_137821 ) ( not ( = ?auto_137814 ?auto_137821 ) ) ( not ( = ?auto_137815 ?auto_137821 ) ) ( not ( = ?auto_137816 ?auto_137821 ) ) ( not ( = ?auto_137817 ?auto_137821 ) ) ( ON ?auto_137816 ?auto_137817 ) ( ON-TABLE ?auto_137820 ) ( ON ?auto_137818 ?auto_137820 ) ( ON ?auto_137819 ?auto_137818 ) ( ON ?auto_137821 ?auto_137819 ) ( not ( = ?auto_137820 ?auto_137818 ) ) ( not ( = ?auto_137820 ?auto_137819 ) ) ( not ( = ?auto_137820 ?auto_137821 ) ) ( not ( = ?auto_137820 ?auto_137817 ) ) ( not ( = ?auto_137820 ?auto_137816 ) ) ( not ( = ?auto_137818 ?auto_137819 ) ) ( not ( = ?auto_137818 ?auto_137821 ) ) ( not ( = ?auto_137818 ?auto_137817 ) ) ( not ( = ?auto_137818 ?auto_137816 ) ) ( not ( = ?auto_137819 ?auto_137821 ) ) ( not ( = ?auto_137819 ?auto_137817 ) ) ( not ( = ?auto_137819 ?auto_137816 ) ) ( not ( = ?auto_137814 ?auto_137820 ) ) ( not ( = ?auto_137814 ?auto_137818 ) ) ( not ( = ?auto_137814 ?auto_137819 ) ) ( not ( = ?auto_137815 ?auto_137820 ) ) ( not ( = ?auto_137815 ?auto_137818 ) ) ( not ( = ?auto_137815 ?auto_137819 ) ) ( ON ?auto_137815 ?auto_137816 ) ( CLEAR ?auto_137815 ) ( ON ?auto_137814 ?auto_137822 ) ( CLEAR ?auto_137814 ) ( HAND-EMPTY ) ( not ( = ?auto_137814 ?auto_137822 ) ) ( not ( = ?auto_137815 ?auto_137822 ) ) ( not ( = ?auto_137816 ?auto_137822 ) ) ( not ( = ?auto_137817 ?auto_137822 ) ) ( not ( = ?auto_137821 ?auto_137822 ) ) ( not ( = ?auto_137820 ?auto_137822 ) ) ( not ( = ?auto_137818 ?auto_137822 ) ) ( not ( = ?auto_137819 ?auto_137822 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_137814 ?auto_137822 )
      ( MAKE-4PILE ?auto_137814 ?auto_137815 ?auto_137816 ?auto_137817 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_137823 - BLOCK
      ?auto_137824 - BLOCK
      ?auto_137825 - BLOCK
      ?auto_137826 - BLOCK
    )
    :vars
    (
      ?auto_137830 - BLOCK
      ?auto_137829 - BLOCK
      ?auto_137828 - BLOCK
      ?auto_137831 - BLOCK
      ?auto_137827 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_137823 ?auto_137824 ) ) ( not ( = ?auto_137823 ?auto_137825 ) ) ( not ( = ?auto_137823 ?auto_137826 ) ) ( not ( = ?auto_137824 ?auto_137825 ) ) ( not ( = ?auto_137824 ?auto_137826 ) ) ( not ( = ?auto_137825 ?auto_137826 ) ) ( ON ?auto_137826 ?auto_137830 ) ( not ( = ?auto_137823 ?auto_137830 ) ) ( not ( = ?auto_137824 ?auto_137830 ) ) ( not ( = ?auto_137825 ?auto_137830 ) ) ( not ( = ?auto_137826 ?auto_137830 ) ) ( ON ?auto_137825 ?auto_137826 ) ( ON-TABLE ?auto_137829 ) ( ON ?auto_137828 ?auto_137829 ) ( ON ?auto_137831 ?auto_137828 ) ( ON ?auto_137830 ?auto_137831 ) ( not ( = ?auto_137829 ?auto_137828 ) ) ( not ( = ?auto_137829 ?auto_137831 ) ) ( not ( = ?auto_137829 ?auto_137830 ) ) ( not ( = ?auto_137829 ?auto_137826 ) ) ( not ( = ?auto_137829 ?auto_137825 ) ) ( not ( = ?auto_137828 ?auto_137831 ) ) ( not ( = ?auto_137828 ?auto_137830 ) ) ( not ( = ?auto_137828 ?auto_137826 ) ) ( not ( = ?auto_137828 ?auto_137825 ) ) ( not ( = ?auto_137831 ?auto_137830 ) ) ( not ( = ?auto_137831 ?auto_137826 ) ) ( not ( = ?auto_137831 ?auto_137825 ) ) ( not ( = ?auto_137823 ?auto_137829 ) ) ( not ( = ?auto_137823 ?auto_137828 ) ) ( not ( = ?auto_137823 ?auto_137831 ) ) ( not ( = ?auto_137824 ?auto_137829 ) ) ( not ( = ?auto_137824 ?auto_137828 ) ) ( not ( = ?auto_137824 ?auto_137831 ) ) ( ON ?auto_137823 ?auto_137827 ) ( CLEAR ?auto_137823 ) ( not ( = ?auto_137823 ?auto_137827 ) ) ( not ( = ?auto_137824 ?auto_137827 ) ) ( not ( = ?auto_137825 ?auto_137827 ) ) ( not ( = ?auto_137826 ?auto_137827 ) ) ( not ( = ?auto_137830 ?auto_137827 ) ) ( not ( = ?auto_137829 ?auto_137827 ) ) ( not ( = ?auto_137828 ?auto_137827 ) ) ( not ( = ?auto_137831 ?auto_137827 ) ) ( HOLDING ?auto_137824 ) ( CLEAR ?auto_137825 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_137829 ?auto_137828 ?auto_137831 ?auto_137830 ?auto_137826 ?auto_137825 ?auto_137824 )
      ( MAKE-4PILE ?auto_137823 ?auto_137824 ?auto_137825 ?auto_137826 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_137832 - BLOCK
      ?auto_137833 - BLOCK
      ?auto_137834 - BLOCK
      ?auto_137835 - BLOCK
    )
    :vars
    (
      ?auto_137840 - BLOCK
      ?auto_137836 - BLOCK
      ?auto_137839 - BLOCK
      ?auto_137837 - BLOCK
      ?auto_137838 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_137832 ?auto_137833 ) ) ( not ( = ?auto_137832 ?auto_137834 ) ) ( not ( = ?auto_137832 ?auto_137835 ) ) ( not ( = ?auto_137833 ?auto_137834 ) ) ( not ( = ?auto_137833 ?auto_137835 ) ) ( not ( = ?auto_137834 ?auto_137835 ) ) ( ON ?auto_137835 ?auto_137840 ) ( not ( = ?auto_137832 ?auto_137840 ) ) ( not ( = ?auto_137833 ?auto_137840 ) ) ( not ( = ?auto_137834 ?auto_137840 ) ) ( not ( = ?auto_137835 ?auto_137840 ) ) ( ON ?auto_137834 ?auto_137835 ) ( ON-TABLE ?auto_137836 ) ( ON ?auto_137839 ?auto_137836 ) ( ON ?auto_137837 ?auto_137839 ) ( ON ?auto_137840 ?auto_137837 ) ( not ( = ?auto_137836 ?auto_137839 ) ) ( not ( = ?auto_137836 ?auto_137837 ) ) ( not ( = ?auto_137836 ?auto_137840 ) ) ( not ( = ?auto_137836 ?auto_137835 ) ) ( not ( = ?auto_137836 ?auto_137834 ) ) ( not ( = ?auto_137839 ?auto_137837 ) ) ( not ( = ?auto_137839 ?auto_137840 ) ) ( not ( = ?auto_137839 ?auto_137835 ) ) ( not ( = ?auto_137839 ?auto_137834 ) ) ( not ( = ?auto_137837 ?auto_137840 ) ) ( not ( = ?auto_137837 ?auto_137835 ) ) ( not ( = ?auto_137837 ?auto_137834 ) ) ( not ( = ?auto_137832 ?auto_137836 ) ) ( not ( = ?auto_137832 ?auto_137839 ) ) ( not ( = ?auto_137832 ?auto_137837 ) ) ( not ( = ?auto_137833 ?auto_137836 ) ) ( not ( = ?auto_137833 ?auto_137839 ) ) ( not ( = ?auto_137833 ?auto_137837 ) ) ( ON ?auto_137832 ?auto_137838 ) ( not ( = ?auto_137832 ?auto_137838 ) ) ( not ( = ?auto_137833 ?auto_137838 ) ) ( not ( = ?auto_137834 ?auto_137838 ) ) ( not ( = ?auto_137835 ?auto_137838 ) ) ( not ( = ?auto_137840 ?auto_137838 ) ) ( not ( = ?auto_137836 ?auto_137838 ) ) ( not ( = ?auto_137839 ?auto_137838 ) ) ( not ( = ?auto_137837 ?auto_137838 ) ) ( CLEAR ?auto_137834 ) ( ON ?auto_137833 ?auto_137832 ) ( CLEAR ?auto_137833 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_137838 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_137838 ?auto_137832 )
      ( MAKE-4PILE ?auto_137832 ?auto_137833 ?auto_137834 ?auto_137835 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_137841 - BLOCK
      ?auto_137842 - BLOCK
      ?auto_137843 - BLOCK
      ?auto_137844 - BLOCK
    )
    :vars
    (
      ?auto_137849 - BLOCK
      ?auto_137848 - BLOCK
      ?auto_137846 - BLOCK
      ?auto_137847 - BLOCK
      ?auto_137845 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_137841 ?auto_137842 ) ) ( not ( = ?auto_137841 ?auto_137843 ) ) ( not ( = ?auto_137841 ?auto_137844 ) ) ( not ( = ?auto_137842 ?auto_137843 ) ) ( not ( = ?auto_137842 ?auto_137844 ) ) ( not ( = ?auto_137843 ?auto_137844 ) ) ( ON ?auto_137844 ?auto_137849 ) ( not ( = ?auto_137841 ?auto_137849 ) ) ( not ( = ?auto_137842 ?auto_137849 ) ) ( not ( = ?auto_137843 ?auto_137849 ) ) ( not ( = ?auto_137844 ?auto_137849 ) ) ( ON-TABLE ?auto_137848 ) ( ON ?auto_137846 ?auto_137848 ) ( ON ?auto_137847 ?auto_137846 ) ( ON ?auto_137849 ?auto_137847 ) ( not ( = ?auto_137848 ?auto_137846 ) ) ( not ( = ?auto_137848 ?auto_137847 ) ) ( not ( = ?auto_137848 ?auto_137849 ) ) ( not ( = ?auto_137848 ?auto_137844 ) ) ( not ( = ?auto_137848 ?auto_137843 ) ) ( not ( = ?auto_137846 ?auto_137847 ) ) ( not ( = ?auto_137846 ?auto_137849 ) ) ( not ( = ?auto_137846 ?auto_137844 ) ) ( not ( = ?auto_137846 ?auto_137843 ) ) ( not ( = ?auto_137847 ?auto_137849 ) ) ( not ( = ?auto_137847 ?auto_137844 ) ) ( not ( = ?auto_137847 ?auto_137843 ) ) ( not ( = ?auto_137841 ?auto_137848 ) ) ( not ( = ?auto_137841 ?auto_137846 ) ) ( not ( = ?auto_137841 ?auto_137847 ) ) ( not ( = ?auto_137842 ?auto_137848 ) ) ( not ( = ?auto_137842 ?auto_137846 ) ) ( not ( = ?auto_137842 ?auto_137847 ) ) ( ON ?auto_137841 ?auto_137845 ) ( not ( = ?auto_137841 ?auto_137845 ) ) ( not ( = ?auto_137842 ?auto_137845 ) ) ( not ( = ?auto_137843 ?auto_137845 ) ) ( not ( = ?auto_137844 ?auto_137845 ) ) ( not ( = ?auto_137849 ?auto_137845 ) ) ( not ( = ?auto_137848 ?auto_137845 ) ) ( not ( = ?auto_137846 ?auto_137845 ) ) ( not ( = ?auto_137847 ?auto_137845 ) ) ( ON ?auto_137842 ?auto_137841 ) ( CLEAR ?auto_137842 ) ( ON-TABLE ?auto_137845 ) ( HOLDING ?auto_137843 ) ( CLEAR ?auto_137844 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_137848 ?auto_137846 ?auto_137847 ?auto_137849 ?auto_137844 ?auto_137843 )
      ( MAKE-4PILE ?auto_137841 ?auto_137842 ?auto_137843 ?auto_137844 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_137850 - BLOCK
      ?auto_137851 - BLOCK
      ?auto_137852 - BLOCK
      ?auto_137853 - BLOCK
    )
    :vars
    (
      ?auto_137855 - BLOCK
      ?auto_137858 - BLOCK
      ?auto_137856 - BLOCK
      ?auto_137854 - BLOCK
      ?auto_137857 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_137850 ?auto_137851 ) ) ( not ( = ?auto_137850 ?auto_137852 ) ) ( not ( = ?auto_137850 ?auto_137853 ) ) ( not ( = ?auto_137851 ?auto_137852 ) ) ( not ( = ?auto_137851 ?auto_137853 ) ) ( not ( = ?auto_137852 ?auto_137853 ) ) ( ON ?auto_137853 ?auto_137855 ) ( not ( = ?auto_137850 ?auto_137855 ) ) ( not ( = ?auto_137851 ?auto_137855 ) ) ( not ( = ?auto_137852 ?auto_137855 ) ) ( not ( = ?auto_137853 ?auto_137855 ) ) ( ON-TABLE ?auto_137858 ) ( ON ?auto_137856 ?auto_137858 ) ( ON ?auto_137854 ?auto_137856 ) ( ON ?auto_137855 ?auto_137854 ) ( not ( = ?auto_137858 ?auto_137856 ) ) ( not ( = ?auto_137858 ?auto_137854 ) ) ( not ( = ?auto_137858 ?auto_137855 ) ) ( not ( = ?auto_137858 ?auto_137853 ) ) ( not ( = ?auto_137858 ?auto_137852 ) ) ( not ( = ?auto_137856 ?auto_137854 ) ) ( not ( = ?auto_137856 ?auto_137855 ) ) ( not ( = ?auto_137856 ?auto_137853 ) ) ( not ( = ?auto_137856 ?auto_137852 ) ) ( not ( = ?auto_137854 ?auto_137855 ) ) ( not ( = ?auto_137854 ?auto_137853 ) ) ( not ( = ?auto_137854 ?auto_137852 ) ) ( not ( = ?auto_137850 ?auto_137858 ) ) ( not ( = ?auto_137850 ?auto_137856 ) ) ( not ( = ?auto_137850 ?auto_137854 ) ) ( not ( = ?auto_137851 ?auto_137858 ) ) ( not ( = ?auto_137851 ?auto_137856 ) ) ( not ( = ?auto_137851 ?auto_137854 ) ) ( ON ?auto_137850 ?auto_137857 ) ( not ( = ?auto_137850 ?auto_137857 ) ) ( not ( = ?auto_137851 ?auto_137857 ) ) ( not ( = ?auto_137852 ?auto_137857 ) ) ( not ( = ?auto_137853 ?auto_137857 ) ) ( not ( = ?auto_137855 ?auto_137857 ) ) ( not ( = ?auto_137858 ?auto_137857 ) ) ( not ( = ?auto_137856 ?auto_137857 ) ) ( not ( = ?auto_137854 ?auto_137857 ) ) ( ON ?auto_137851 ?auto_137850 ) ( ON-TABLE ?auto_137857 ) ( CLEAR ?auto_137853 ) ( ON ?auto_137852 ?auto_137851 ) ( CLEAR ?auto_137852 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_137857 ?auto_137850 ?auto_137851 )
      ( MAKE-4PILE ?auto_137850 ?auto_137851 ?auto_137852 ?auto_137853 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_137859 - BLOCK
      ?auto_137860 - BLOCK
      ?auto_137861 - BLOCK
      ?auto_137862 - BLOCK
    )
    :vars
    (
      ?auto_137865 - BLOCK
      ?auto_137864 - BLOCK
      ?auto_137867 - BLOCK
      ?auto_137863 - BLOCK
      ?auto_137866 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_137859 ?auto_137860 ) ) ( not ( = ?auto_137859 ?auto_137861 ) ) ( not ( = ?auto_137859 ?auto_137862 ) ) ( not ( = ?auto_137860 ?auto_137861 ) ) ( not ( = ?auto_137860 ?auto_137862 ) ) ( not ( = ?auto_137861 ?auto_137862 ) ) ( not ( = ?auto_137859 ?auto_137865 ) ) ( not ( = ?auto_137860 ?auto_137865 ) ) ( not ( = ?auto_137861 ?auto_137865 ) ) ( not ( = ?auto_137862 ?auto_137865 ) ) ( ON-TABLE ?auto_137864 ) ( ON ?auto_137867 ?auto_137864 ) ( ON ?auto_137863 ?auto_137867 ) ( ON ?auto_137865 ?auto_137863 ) ( not ( = ?auto_137864 ?auto_137867 ) ) ( not ( = ?auto_137864 ?auto_137863 ) ) ( not ( = ?auto_137864 ?auto_137865 ) ) ( not ( = ?auto_137864 ?auto_137862 ) ) ( not ( = ?auto_137864 ?auto_137861 ) ) ( not ( = ?auto_137867 ?auto_137863 ) ) ( not ( = ?auto_137867 ?auto_137865 ) ) ( not ( = ?auto_137867 ?auto_137862 ) ) ( not ( = ?auto_137867 ?auto_137861 ) ) ( not ( = ?auto_137863 ?auto_137865 ) ) ( not ( = ?auto_137863 ?auto_137862 ) ) ( not ( = ?auto_137863 ?auto_137861 ) ) ( not ( = ?auto_137859 ?auto_137864 ) ) ( not ( = ?auto_137859 ?auto_137867 ) ) ( not ( = ?auto_137859 ?auto_137863 ) ) ( not ( = ?auto_137860 ?auto_137864 ) ) ( not ( = ?auto_137860 ?auto_137867 ) ) ( not ( = ?auto_137860 ?auto_137863 ) ) ( ON ?auto_137859 ?auto_137866 ) ( not ( = ?auto_137859 ?auto_137866 ) ) ( not ( = ?auto_137860 ?auto_137866 ) ) ( not ( = ?auto_137861 ?auto_137866 ) ) ( not ( = ?auto_137862 ?auto_137866 ) ) ( not ( = ?auto_137865 ?auto_137866 ) ) ( not ( = ?auto_137864 ?auto_137866 ) ) ( not ( = ?auto_137867 ?auto_137866 ) ) ( not ( = ?auto_137863 ?auto_137866 ) ) ( ON ?auto_137860 ?auto_137859 ) ( ON-TABLE ?auto_137866 ) ( ON ?auto_137861 ?auto_137860 ) ( CLEAR ?auto_137861 ) ( HOLDING ?auto_137862 ) ( CLEAR ?auto_137865 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_137864 ?auto_137867 ?auto_137863 ?auto_137865 ?auto_137862 )
      ( MAKE-4PILE ?auto_137859 ?auto_137860 ?auto_137861 ?auto_137862 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_137868 - BLOCK
      ?auto_137869 - BLOCK
      ?auto_137870 - BLOCK
      ?auto_137871 - BLOCK
    )
    :vars
    (
      ?auto_137874 - BLOCK
      ?auto_137875 - BLOCK
      ?auto_137876 - BLOCK
      ?auto_137872 - BLOCK
      ?auto_137873 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_137868 ?auto_137869 ) ) ( not ( = ?auto_137868 ?auto_137870 ) ) ( not ( = ?auto_137868 ?auto_137871 ) ) ( not ( = ?auto_137869 ?auto_137870 ) ) ( not ( = ?auto_137869 ?auto_137871 ) ) ( not ( = ?auto_137870 ?auto_137871 ) ) ( not ( = ?auto_137868 ?auto_137874 ) ) ( not ( = ?auto_137869 ?auto_137874 ) ) ( not ( = ?auto_137870 ?auto_137874 ) ) ( not ( = ?auto_137871 ?auto_137874 ) ) ( ON-TABLE ?auto_137875 ) ( ON ?auto_137876 ?auto_137875 ) ( ON ?auto_137872 ?auto_137876 ) ( ON ?auto_137874 ?auto_137872 ) ( not ( = ?auto_137875 ?auto_137876 ) ) ( not ( = ?auto_137875 ?auto_137872 ) ) ( not ( = ?auto_137875 ?auto_137874 ) ) ( not ( = ?auto_137875 ?auto_137871 ) ) ( not ( = ?auto_137875 ?auto_137870 ) ) ( not ( = ?auto_137876 ?auto_137872 ) ) ( not ( = ?auto_137876 ?auto_137874 ) ) ( not ( = ?auto_137876 ?auto_137871 ) ) ( not ( = ?auto_137876 ?auto_137870 ) ) ( not ( = ?auto_137872 ?auto_137874 ) ) ( not ( = ?auto_137872 ?auto_137871 ) ) ( not ( = ?auto_137872 ?auto_137870 ) ) ( not ( = ?auto_137868 ?auto_137875 ) ) ( not ( = ?auto_137868 ?auto_137876 ) ) ( not ( = ?auto_137868 ?auto_137872 ) ) ( not ( = ?auto_137869 ?auto_137875 ) ) ( not ( = ?auto_137869 ?auto_137876 ) ) ( not ( = ?auto_137869 ?auto_137872 ) ) ( ON ?auto_137868 ?auto_137873 ) ( not ( = ?auto_137868 ?auto_137873 ) ) ( not ( = ?auto_137869 ?auto_137873 ) ) ( not ( = ?auto_137870 ?auto_137873 ) ) ( not ( = ?auto_137871 ?auto_137873 ) ) ( not ( = ?auto_137874 ?auto_137873 ) ) ( not ( = ?auto_137875 ?auto_137873 ) ) ( not ( = ?auto_137876 ?auto_137873 ) ) ( not ( = ?auto_137872 ?auto_137873 ) ) ( ON ?auto_137869 ?auto_137868 ) ( ON-TABLE ?auto_137873 ) ( ON ?auto_137870 ?auto_137869 ) ( CLEAR ?auto_137874 ) ( ON ?auto_137871 ?auto_137870 ) ( CLEAR ?auto_137871 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_137873 ?auto_137868 ?auto_137869 ?auto_137870 )
      ( MAKE-4PILE ?auto_137868 ?auto_137869 ?auto_137870 ?auto_137871 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_137877 - BLOCK
      ?auto_137878 - BLOCK
      ?auto_137879 - BLOCK
      ?auto_137880 - BLOCK
    )
    :vars
    (
      ?auto_137881 - BLOCK
      ?auto_137884 - BLOCK
      ?auto_137883 - BLOCK
      ?auto_137882 - BLOCK
      ?auto_137885 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_137877 ?auto_137878 ) ) ( not ( = ?auto_137877 ?auto_137879 ) ) ( not ( = ?auto_137877 ?auto_137880 ) ) ( not ( = ?auto_137878 ?auto_137879 ) ) ( not ( = ?auto_137878 ?auto_137880 ) ) ( not ( = ?auto_137879 ?auto_137880 ) ) ( not ( = ?auto_137877 ?auto_137881 ) ) ( not ( = ?auto_137878 ?auto_137881 ) ) ( not ( = ?auto_137879 ?auto_137881 ) ) ( not ( = ?auto_137880 ?auto_137881 ) ) ( ON-TABLE ?auto_137884 ) ( ON ?auto_137883 ?auto_137884 ) ( ON ?auto_137882 ?auto_137883 ) ( not ( = ?auto_137884 ?auto_137883 ) ) ( not ( = ?auto_137884 ?auto_137882 ) ) ( not ( = ?auto_137884 ?auto_137881 ) ) ( not ( = ?auto_137884 ?auto_137880 ) ) ( not ( = ?auto_137884 ?auto_137879 ) ) ( not ( = ?auto_137883 ?auto_137882 ) ) ( not ( = ?auto_137883 ?auto_137881 ) ) ( not ( = ?auto_137883 ?auto_137880 ) ) ( not ( = ?auto_137883 ?auto_137879 ) ) ( not ( = ?auto_137882 ?auto_137881 ) ) ( not ( = ?auto_137882 ?auto_137880 ) ) ( not ( = ?auto_137882 ?auto_137879 ) ) ( not ( = ?auto_137877 ?auto_137884 ) ) ( not ( = ?auto_137877 ?auto_137883 ) ) ( not ( = ?auto_137877 ?auto_137882 ) ) ( not ( = ?auto_137878 ?auto_137884 ) ) ( not ( = ?auto_137878 ?auto_137883 ) ) ( not ( = ?auto_137878 ?auto_137882 ) ) ( ON ?auto_137877 ?auto_137885 ) ( not ( = ?auto_137877 ?auto_137885 ) ) ( not ( = ?auto_137878 ?auto_137885 ) ) ( not ( = ?auto_137879 ?auto_137885 ) ) ( not ( = ?auto_137880 ?auto_137885 ) ) ( not ( = ?auto_137881 ?auto_137885 ) ) ( not ( = ?auto_137884 ?auto_137885 ) ) ( not ( = ?auto_137883 ?auto_137885 ) ) ( not ( = ?auto_137882 ?auto_137885 ) ) ( ON ?auto_137878 ?auto_137877 ) ( ON-TABLE ?auto_137885 ) ( ON ?auto_137879 ?auto_137878 ) ( ON ?auto_137880 ?auto_137879 ) ( CLEAR ?auto_137880 ) ( HOLDING ?auto_137881 ) ( CLEAR ?auto_137882 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_137884 ?auto_137883 ?auto_137882 ?auto_137881 )
      ( MAKE-4PILE ?auto_137877 ?auto_137878 ?auto_137879 ?auto_137880 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_137886 - BLOCK
      ?auto_137887 - BLOCK
      ?auto_137888 - BLOCK
      ?auto_137889 - BLOCK
    )
    :vars
    (
      ?auto_137892 - BLOCK
      ?auto_137894 - BLOCK
      ?auto_137891 - BLOCK
      ?auto_137893 - BLOCK
      ?auto_137890 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_137886 ?auto_137887 ) ) ( not ( = ?auto_137886 ?auto_137888 ) ) ( not ( = ?auto_137886 ?auto_137889 ) ) ( not ( = ?auto_137887 ?auto_137888 ) ) ( not ( = ?auto_137887 ?auto_137889 ) ) ( not ( = ?auto_137888 ?auto_137889 ) ) ( not ( = ?auto_137886 ?auto_137892 ) ) ( not ( = ?auto_137887 ?auto_137892 ) ) ( not ( = ?auto_137888 ?auto_137892 ) ) ( not ( = ?auto_137889 ?auto_137892 ) ) ( ON-TABLE ?auto_137894 ) ( ON ?auto_137891 ?auto_137894 ) ( ON ?auto_137893 ?auto_137891 ) ( not ( = ?auto_137894 ?auto_137891 ) ) ( not ( = ?auto_137894 ?auto_137893 ) ) ( not ( = ?auto_137894 ?auto_137892 ) ) ( not ( = ?auto_137894 ?auto_137889 ) ) ( not ( = ?auto_137894 ?auto_137888 ) ) ( not ( = ?auto_137891 ?auto_137893 ) ) ( not ( = ?auto_137891 ?auto_137892 ) ) ( not ( = ?auto_137891 ?auto_137889 ) ) ( not ( = ?auto_137891 ?auto_137888 ) ) ( not ( = ?auto_137893 ?auto_137892 ) ) ( not ( = ?auto_137893 ?auto_137889 ) ) ( not ( = ?auto_137893 ?auto_137888 ) ) ( not ( = ?auto_137886 ?auto_137894 ) ) ( not ( = ?auto_137886 ?auto_137891 ) ) ( not ( = ?auto_137886 ?auto_137893 ) ) ( not ( = ?auto_137887 ?auto_137894 ) ) ( not ( = ?auto_137887 ?auto_137891 ) ) ( not ( = ?auto_137887 ?auto_137893 ) ) ( ON ?auto_137886 ?auto_137890 ) ( not ( = ?auto_137886 ?auto_137890 ) ) ( not ( = ?auto_137887 ?auto_137890 ) ) ( not ( = ?auto_137888 ?auto_137890 ) ) ( not ( = ?auto_137889 ?auto_137890 ) ) ( not ( = ?auto_137892 ?auto_137890 ) ) ( not ( = ?auto_137894 ?auto_137890 ) ) ( not ( = ?auto_137891 ?auto_137890 ) ) ( not ( = ?auto_137893 ?auto_137890 ) ) ( ON ?auto_137887 ?auto_137886 ) ( ON-TABLE ?auto_137890 ) ( ON ?auto_137888 ?auto_137887 ) ( ON ?auto_137889 ?auto_137888 ) ( CLEAR ?auto_137893 ) ( ON ?auto_137892 ?auto_137889 ) ( CLEAR ?auto_137892 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_137890 ?auto_137886 ?auto_137887 ?auto_137888 ?auto_137889 )
      ( MAKE-4PILE ?auto_137886 ?auto_137887 ?auto_137888 ?auto_137889 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_137895 - BLOCK
      ?auto_137896 - BLOCK
      ?auto_137897 - BLOCK
      ?auto_137898 - BLOCK
    )
    :vars
    (
      ?auto_137901 - BLOCK
      ?auto_137900 - BLOCK
      ?auto_137903 - BLOCK
      ?auto_137899 - BLOCK
      ?auto_137902 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_137895 ?auto_137896 ) ) ( not ( = ?auto_137895 ?auto_137897 ) ) ( not ( = ?auto_137895 ?auto_137898 ) ) ( not ( = ?auto_137896 ?auto_137897 ) ) ( not ( = ?auto_137896 ?auto_137898 ) ) ( not ( = ?auto_137897 ?auto_137898 ) ) ( not ( = ?auto_137895 ?auto_137901 ) ) ( not ( = ?auto_137896 ?auto_137901 ) ) ( not ( = ?auto_137897 ?auto_137901 ) ) ( not ( = ?auto_137898 ?auto_137901 ) ) ( ON-TABLE ?auto_137900 ) ( ON ?auto_137903 ?auto_137900 ) ( not ( = ?auto_137900 ?auto_137903 ) ) ( not ( = ?auto_137900 ?auto_137899 ) ) ( not ( = ?auto_137900 ?auto_137901 ) ) ( not ( = ?auto_137900 ?auto_137898 ) ) ( not ( = ?auto_137900 ?auto_137897 ) ) ( not ( = ?auto_137903 ?auto_137899 ) ) ( not ( = ?auto_137903 ?auto_137901 ) ) ( not ( = ?auto_137903 ?auto_137898 ) ) ( not ( = ?auto_137903 ?auto_137897 ) ) ( not ( = ?auto_137899 ?auto_137901 ) ) ( not ( = ?auto_137899 ?auto_137898 ) ) ( not ( = ?auto_137899 ?auto_137897 ) ) ( not ( = ?auto_137895 ?auto_137900 ) ) ( not ( = ?auto_137895 ?auto_137903 ) ) ( not ( = ?auto_137895 ?auto_137899 ) ) ( not ( = ?auto_137896 ?auto_137900 ) ) ( not ( = ?auto_137896 ?auto_137903 ) ) ( not ( = ?auto_137896 ?auto_137899 ) ) ( ON ?auto_137895 ?auto_137902 ) ( not ( = ?auto_137895 ?auto_137902 ) ) ( not ( = ?auto_137896 ?auto_137902 ) ) ( not ( = ?auto_137897 ?auto_137902 ) ) ( not ( = ?auto_137898 ?auto_137902 ) ) ( not ( = ?auto_137901 ?auto_137902 ) ) ( not ( = ?auto_137900 ?auto_137902 ) ) ( not ( = ?auto_137903 ?auto_137902 ) ) ( not ( = ?auto_137899 ?auto_137902 ) ) ( ON ?auto_137896 ?auto_137895 ) ( ON-TABLE ?auto_137902 ) ( ON ?auto_137897 ?auto_137896 ) ( ON ?auto_137898 ?auto_137897 ) ( ON ?auto_137901 ?auto_137898 ) ( CLEAR ?auto_137901 ) ( HOLDING ?auto_137899 ) ( CLEAR ?auto_137903 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_137900 ?auto_137903 ?auto_137899 )
      ( MAKE-4PILE ?auto_137895 ?auto_137896 ?auto_137897 ?auto_137898 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_137904 - BLOCK
      ?auto_137905 - BLOCK
      ?auto_137906 - BLOCK
      ?auto_137907 - BLOCK
    )
    :vars
    (
      ?auto_137911 - BLOCK
      ?auto_137908 - BLOCK
      ?auto_137912 - BLOCK
      ?auto_137909 - BLOCK
      ?auto_137910 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_137904 ?auto_137905 ) ) ( not ( = ?auto_137904 ?auto_137906 ) ) ( not ( = ?auto_137904 ?auto_137907 ) ) ( not ( = ?auto_137905 ?auto_137906 ) ) ( not ( = ?auto_137905 ?auto_137907 ) ) ( not ( = ?auto_137906 ?auto_137907 ) ) ( not ( = ?auto_137904 ?auto_137911 ) ) ( not ( = ?auto_137905 ?auto_137911 ) ) ( not ( = ?auto_137906 ?auto_137911 ) ) ( not ( = ?auto_137907 ?auto_137911 ) ) ( ON-TABLE ?auto_137908 ) ( ON ?auto_137912 ?auto_137908 ) ( not ( = ?auto_137908 ?auto_137912 ) ) ( not ( = ?auto_137908 ?auto_137909 ) ) ( not ( = ?auto_137908 ?auto_137911 ) ) ( not ( = ?auto_137908 ?auto_137907 ) ) ( not ( = ?auto_137908 ?auto_137906 ) ) ( not ( = ?auto_137912 ?auto_137909 ) ) ( not ( = ?auto_137912 ?auto_137911 ) ) ( not ( = ?auto_137912 ?auto_137907 ) ) ( not ( = ?auto_137912 ?auto_137906 ) ) ( not ( = ?auto_137909 ?auto_137911 ) ) ( not ( = ?auto_137909 ?auto_137907 ) ) ( not ( = ?auto_137909 ?auto_137906 ) ) ( not ( = ?auto_137904 ?auto_137908 ) ) ( not ( = ?auto_137904 ?auto_137912 ) ) ( not ( = ?auto_137904 ?auto_137909 ) ) ( not ( = ?auto_137905 ?auto_137908 ) ) ( not ( = ?auto_137905 ?auto_137912 ) ) ( not ( = ?auto_137905 ?auto_137909 ) ) ( ON ?auto_137904 ?auto_137910 ) ( not ( = ?auto_137904 ?auto_137910 ) ) ( not ( = ?auto_137905 ?auto_137910 ) ) ( not ( = ?auto_137906 ?auto_137910 ) ) ( not ( = ?auto_137907 ?auto_137910 ) ) ( not ( = ?auto_137911 ?auto_137910 ) ) ( not ( = ?auto_137908 ?auto_137910 ) ) ( not ( = ?auto_137912 ?auto_137910 ) ) ( not ( = ?auto_137909 ?auto_137910 ) ) ( ON ?auto_137905 ?auto_137904 ) ( ON-TABLE ?auto_137910 ) ( ON ?auto_137906 ?auto_137905 ) ( ON ?auto_137907 ?auto_137906 ) ( ON ?auto_137911 ?auto_137907 ) ( CLEAR ?auto_137912 ) ( ON ?auto_137909 ?auto_137911 ) ( CLEAR ?auto_137909 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_137910 ?auto_137904 ?auto_137905 ?auto_137906 ?auto_137907 ?auto_137911 )
      ( MAKE-4PILE ?auto_137904 ?auto_137905 ?auto_137906 ?auto_137907 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_137913 - BLOCK
      ?auto_137914 - BLOCK
      ?auto_137915 - BLOCK
      ?auto_137916 - BLOCK
    )
    :vars
    (
      ?auto_137918 - BLOCK
      ?auto_137917 - BLOCK
      ?auto_137920 - BLOCK
      ?auto_137919 - BLOCK
      ?auto_137921 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_137913 ?auto_137914 ) ) ( not ( = ?auto_137913 ?auto_137915 ) ) ( not ( = ?auto_137913 ?auto_137916 ) ) ( not ( = ?auto_137914 ?auto_137915 ) ) ( not ( = ?auto_137914 ?auto_137916 ) ) ( not ( = ?auto_137915 ?auto_137916 ) ) ( not ( = ?auto_137913 ?auto_137918 ) ) ( not ( = ?auto_137914 ?auto_137918 ) ) ( not ( = ?auto_137915 ?auto_137918 ) ) ( not ( = ?auto_137916 ?auto_137918 ) ) ( ON-TABLE ?auto_137917 ) ( not ( = ?auto_137917 ?auto_137920 ) ) ( not ( = ?auto_137917 ?auto_137919 ) ) ( not ( = ?auto_137917 ?auto_137918 ) ) ( not ( = ?auto_137917 ?auto_137916 ) ) ( not ( = ?auto_137917 ?auto_137915 ) ) ( not ( = ?auto_137920 ?auto_137919 ) ) ( not ( = ?auto_137920 ?auto_137918 ) ) ( not ( = ?auto_137920 ?auto_137916 ) ) ( not ( = ?auto_137920 ?auto_137915 ) ) ( not ( = ?auto_137919 ?auto_137918 ) ) ( not ( = ?auto_137919 ?auto_137916 ) ) ( not ( = ?auto_137919 ?auto_137915 ) ) ( not ( = ?auto_137913 ?auto_137917 ) ) ( not ( = ?auto_137913 ?auto_137920 ) ) ( not ( = ?auto_137913 ?auto_137919 ) ) ( not ( = ?auto_137914 ?auto_137917 ) ) ( not ( = ?auto_137914 ?auto_137920 ) ) ( not ( = ?auto_137914 ?auto_137919 ) ) ( ON ?auto_137913 ?auto_137921 ) ( not ( = ?auto_137913 ?auto_137921 ) ) ( not ( = ?auto_137914 ?auto_137921 ) ) ( not ( = ?auto_137915 ?auto_137921 ) ) ( not ( = ?auto_137916 ?auto_137921 ) ) ( not ( = ?auto_137918 ?auto_137921 ) ) ( not ( = ?auto_137917 ?auto_137921 ) ) ( not ( = ?auto_137920 ?auto_137921 ) ) ( not ( = ?auto_137919 ?auto_137921 ) ) ( ON ?auto_137914 ?auto_137913 ) ( ON-TABLE ?auto_137921 ) ( ON ?auto_137915 ?auto_137914 ) ( ON ?auto_137916 ?auto_137915 ) ( ON ?auto_137918 ?auto_137916 ) ( ON ?auto_137919 ?auto_137918 ) ( CLEAR ?auto_137919 ) ( HOLDING ?auto_137920 ) ( CLEAR ?auto_137917 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_137917 ?auto_137920 )
      ( MAKE-4PILE ?auto_137913 ?auto_137914 ?auto_137915 ?auto_137916 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_137922 - BLOCK
      ?auto_137923 - BLOCK
      ?auto_137924 - BLOCK
      ?auto_137925 - BLOCK
    )
    :vars
    (
      ?auto_137927 - BLOCK
      ?auto_137926 - BLOCK
      ?auto_137930 - BLOCK
      ?auto_137929 - BLOCK
      ?auto_137928 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_137922 ?auto_137923 ) ) ( not ( = ?auto_137922 ?auto_137924 ) ) ( not ( = ?auto_137922 ?auto_137925 ) ) ( not ( = ?auto_137923 ?auto_137924 ) ) ( not ( = ?auto_137923 ?auto_137925 ) ) ( not ( = ?auto_137924 ?auto_137925 ) ) ( not ( = ?auto_137922 ?auto_137927 ) ) ( not ( = ?auto_137923 ?auto_137927 ) ) ( not ( = ?auto_137924 ?auto_137927 ) ) ( not ( = ?auto_137925 ?auto_137927 ) ) ( ON-TABLE ?auto_137926 ) ( not ( = ?auto_137926 ?auto_137930 ) ) ( not ( = ?auto_137926 ?auto_137929 ) ) ( not ( = ?auto_137926 ?auto_137927 ) ) ( not ( = ?auto_137926 ?auto_137925 ) ) ( not ( = ?auto_137926 ?auto_137924 ) ) ( not ( = ?auto_137930 ?auto_137929 ) ) ( not ( = ?auto_137930 ?auto_137927 ) ) ( not ( = ?auto_137930 ?auto_137925 ) ) ( not ( = ?auto_137930 ?auto_137924 ) ) ( not ( = ?auto_137929 ?auto_137927 ) ) ( not ( = ?auto_137929 ?auto_137925 ) ) ( not ( = ?auto_137929 ?auto_137924 ) ) ( not ( = ?auto_137922 ?auto_137926 ) ) ( not ( = ?auto_137922 ?auto_137930 ) ) ( not ( = ?auto_137922 ?auto_137929 ) ) ( not ( = ?auto_137923 ?auto_137926 ) ) ( not ( = ?auto_137923 ?auto_137930 ) ) ( not ( = ?auto_137923 ?auto_137929 ) ) ( ON ?auto_137922 ?auto_137928 ) ( not ( = ?auto_137922 ?auto_137928 ) ) ( not ( = ?auto_137923 ?auto_137928 ) ) ( not ( = ?auto_137924 ?auto_137928 ) ) ( not ( = ?auto_137925 ?auto_137928 ) ) ( not ( = ?auto_137927 ?auto_137928 ) ) ( not ( = ?auto_137926 ?auto_137928 ) ) ( not ( = ?auto_137930 ?auto_137928 ) ) ( not ( = ?auto_137929 ?auto_137928 ) ) ( ON ?auto_137923 ?auto_137922 ) ( ON-TABLE ?auto_137928 ) ( ON ?auto_137924 ?auto_137923 ) ( ON ?auto_137925 ?auto_137924 ) ( ON ?auto_137927 ?auto_137925 ) ( ON ?auto_137929 ?auto_137927 ) ( CLEAR ?auto_137926 ) ( ON ?auto_137930 ?auto_137929 ) ( CLEAR ?auto_137930 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_137928 ?auto_137922 ?auto_137923 ?auto_137924 ?auto_137925 ?auto_137927 ?auto_137929 )
      ( MAKE-4PILE ?auto_137922 ?auto_137923 ?auto_137924 ?auto_137925 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_137931 - BLOCK
      ?auto_137932 - BLOCK
      ?auto_137933 - BLOCK
      ?auto_137934 - BLOCK
    )
    :vars
    (
      ?auto_137935 - BLOCK
      ?auto_137938 - BLOCK
      ?auto_137937 - BLOCK
      ?auto_137939 - BLOCK
      ?auto_137936 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_137931 ?auto_137932 ) ) ( not ( = ?auto_137931 ?auto_137933 ) ) ( not ( = ?auto_137931 ?auto_137934 ) ) ( not ( = ?auto_137932 ?auto_137933 ) ) ( not ( = ?auto_137932 ?auto_137934 ) ) ( not ( = ?auto_137933 ?auto_137934 ) ) ( not ( = ?auto_137931 ?auto_137935 ) ) ( not ( = ?auto_137932 ?auto_137935 ) ) ( not ( = ?auto_137933 ?auto_137935 ) ) ( not ( = ?auto_137934 ?auto_137935 ) ) ( not ( = ?auto_137938 ?auto_137937 ) ) ( not ( = ?auto_137938 ?auto_137939 ) ) ( not ( = ?auto_137938 ?auto_137935 ) ) ( not ( = ?auto_137938 ?auto_137934 ) ) ( not ( = ?auto_137938 ?auto_137933 ) ) ( not ( = ?auto_137937 ?auto_137939 ) ) ( not ( = ?auto_137937 ?auto_137935 ) ) ( not ( = ?auto_137937 ?auto_137934 ) ) ( not ( = ?auto_137937 ?auto_137933 ) ) ( not ( = ?auto_137939 ?auto_137935 ) ) ( not ( = ?auto_137939 ?auto_137934 ) ) ( not ( = ?auto_137939 ?auto_137933 ) ) ( not ( = ?auto_137931 ?auto_137938 ) ) ( not ( = ?auto_137931 ?auto_137937 ) ) ( not ( = ?auto_137931 ?auto_137939 ) ) ( not ( = ?auto_137932 ?auto_137938 ) ) ( not ( = ?auto_137932 ?auto_137937 ) ) ( not ( = ?auto_137932 ?auto_137939 ) ) ( ON ?auto_137931 ?auto_137936 ) ( not ( = ?auto_137931 ?auto_137936 ) ) ( not ( = ?auto_137932 ?auto_137936 ) ) ( not ( = ?auto_137933 ?auto_137936 ) ) ( not ( = ?auto_137934 ?auto_137936 ) ) ( not ( = ?auto_137935 ?auto_137936 ) ) ( not ( = ?auto_137938 ?auto_137936 ) ) ( not ( = ?auto_137937 ?auto_137936 ) ) ( not ( = ?auto_137939 ?auto_137936 ) ) ( ON ?auto_137932 ?auto_137931 ) ( ON-TABLE ?auto_137936 ) ( ON ?auto_137933 ?auto_137932 ) ( ON ?auto_137934 ?auto_137933 ) ( ON ?auto_137935 ?auto_137934 ) ( ON ?auto_137939 ?auto_137935 ) ( ON ?auto_137937 ?auto_137939 ) ( CLEAR ?auto_137937 ) ( HOLDING ?auto_137938 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_137938 )
      ( MAKE-4PILE ?auto_137931 ?auto_137932 ?auto_137933 ?auto_137934 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_137940 - BLOCK
      ?auto_137941 - BLOCK
      ?auto_137942 - BLOCK
      ?auto_137943 - BLOCK
    )
    :vars
    (
      ?auto_137948 - BLOCK
      ?auto_137947 - BLOCK
      ?auto_137945 - BLOCK
      ?auto_137946 - BLOCK
      ?auto_137944 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_137940 ?auto_137941 ) ) ( not ( = ?auto_137940 ?auto_137942 ) ) ( not ( = ?auto_137940 ?auto_137943 ) ) ( not ( = ?auto_137941 ?auto_137942 ) ) ( not ( = ?auto_137941 ?auto_137943 ) ) ( not ( = ?auto_137942 ?auto_137943 ) ) ( not ( = ?auto_137940 ?auto_137948 ) ) ( not ( = ?auto_137941 ?auto_137948 ) ) ( not ( = ?auto_137942 ?auto_137948 ) ) ( not ( = ?auto_137943 ?auto_137948 ) ) ( not ( = ?auto_137947 ?auto_137945 ) ) ( not ( = ?auto_137947 ?auto_137946 ) ) ( not ( = ?auto_137947 ?auto_137948 ) ) ( not ( = ?auto_137947 ?auto_137943 ) ) ( not ( = ?auto_137947 ?auto_137942 ) ) ( not ( = ?auto_137945 ?auto_137946 ) ) ( not ( = ?auto_137945 ?auto_137948 ) ) ( not ( = ?auto_137945 ?auto_137943 ) ) ( not ( = ?auto_137945 ?auto_137942 ) ) ( not ( = ?auto_137946 ?auto_137948 ) ) ( not ( = ?auto_137946 ?auto_137943 ) ) ( not ( = ?auto_137946 ?auto_137942 ) ) ( not ( = ?auto_137940 ?auto_137947 ) ) ( not ( = ?auto_137940 ?auto_137945 ) ) ( not ( = ?auto_137940 ?auto_137946 ) ) ( not ( = ?auto_137941 ?auto_137947 ) ) ( not ( = ?auto_137941 ?auto_137945 ) ) ( not ( = ?auto_137941 ?auto_137946 ) ) ( ON ?auto_137940 ?auto_137944 ) ( not ( = ?auto_137940 ?auto_137944 ) ) ( not ( = ?auto_137941 ?auto_137944 ) ) ( not ( = ?auto_137942 ?auto_137944 ) ) ( not ( = ?auto_137943 ?auto_137944 ) ) ( not ( = ?auto_137948 ?auto_137944 ) ) ( not ( = ?auto_137947 ?auto_137944 ) ) ( not ( = ?auto_137945 ?auto_137944 ) ) ( not ( = ?auto_137946 ?auto_137944 ) ) ( ON ?auto_137941 ?auto_137940 ) ( ON-TABLE ?auto_137944 ) ( ON ?auto_137942 ?auto_137941 ) ( ON ?auto_137943 ?auto_137942 ) ( ON ?auto_137948 ?auto_137943 ) ( ON ?auto_137946 ?auto_137948 ) ( ON ?auto_137945 ?auto_137946 ) ( ON ?auto_137947 ?auto_137945 ) ( CLEAR ?auto_137947 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_137944 ?auto_137940 ?auto_137941 ?auto_137942 ?auto_137943 ?auto_137948 ?auto_137946 ?auto_137945 )
      ( MAKE-4PILE ?auto_137940 ?auto_137941 ?auto_137942 ?auto_137943 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_137968 - BLOCK
      ?auto_137969 - BLOCK
      ?auto_137970 - BLOCK
    )
    :vars
    (
      ?auto_137971 - BLOCK
      ?auto_137973 - BLOCK
      ?auto_137972 - BLOCK
      ?auto_137975 - BLOCK
      ?auto_137974 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_137971 ?auto_137970 ) ( ON-TABLE ?auto_137968 ) ( ON ?auto_137969 ?auto_137968 ) ( ON ?auto_137970 ?auto_137969 ) ( not ( = ?auto_137968 ?auto_137969 ) ) ( not ( = ?auto_137968 ?auto_137970 ) ) ( not ( = ?auto_137968 ?auto_137971 ) ) ( not ( = ?auto_137969 ?auto_137970 ) ) ( not ( = ?auto_137969 ?auto_137971 ) ) ( not ( = ?auto_137970 ?auto_137971 ) ) ( not ( = ?auto_137968 ?auto_137973 ) ) ( not ( = ?auto_137968 ?auto_137972 ) ) ( not ( = ?auto_137969 ?auto_137973 ) ) ( not ( = ?auto_137969 ?auto_137972 ) ) ( not ( = ?auto_137970 ?auto_137973 ) ) ( not ( = ?auto_137970 ?auto_137972 ) ) ( not ( = ?auto_137971 ?auto_137973 ) ) ( not ( = ?auto_137971 ?auto_137972 ) ) ( not ( = ?auto_137973 ?auto_137972 ) ) ( ON ?auto_137973 ?auto_137971 ) ( CLEAR ?auto_137973 ) ( HOLDING ?auto_137972 ) ( CLEAR ?auto_137975 ) ( ON-TABLE ?auto_137974 ) ( ON ?auto_137975 ?auto_137974 ) ( not ( = ?auto_137974 ?auto_137975 ) ) ( not ( = ?auto_137974 ?auto_137972 ) ) ( not ( = ?auto_137975 ?auto_137972 ) ) ( not ( = ?auto_137968 ?auto_137975 ) ) ( not ( = ?auto_137968 ?auto_137974 ) ) ( not ( = ?auto_137969 ?auto_137975 ) ) ( not ( = ?auto_137969 ?auto_137974 ) ) ( not ( = ?auto_137970 ?auto_137975 ) ) ( not ( = ?auto_137970 ?auto_137974 ) ) ( not ( = ?auto_137971 ?auto_137975 ) ) ( not ( = ?auto_137971 ?auto_137974 ) ) ( not ( = ?auto_137973 ?auto_137975 ) ) ( not ( = ?auto_137973 ?auto_137974 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_137974 ?auto_137975 ?auto_137972 )
      ( MAKE-3PILE ?auto_137968 ?auto_137969 ?auto_137970 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_137976 - BLOCK
      ?auto_137977 - BLOCK
      ?auto_137978 - BLOCK
    )
    :vars
    (
      ?auto_137981 - BLOCK
      ?auto_137982 - BLOCK
      ?auto_137979 - BLOCK
      ?auto_137983 - BLOCK
      ?auto_137980 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_137981 ?auto_137978 ) ( ON-TABLE ?auto_137976 ) ( ON ?auto_137977 ?auto_137976 ) ( ON ?auto_137978 ?auto_137977 ) ( not ( = ?auto_137976 ?auto_137977 ) ) ( not ( = ?auto_137976 ?auto_137978 ) ) ( not ( = ?auto_137976 ?auto_137981 ) ) ( not ( = ?auto_137977 ?auto_137978 ) ) ( not ( = ?auto_137977 ?auto_137981 ) ) ( not ( = ?auto_137978 ?auto_137981 ) ) ( not ( = ?auto_137976 ?auto_137982 ) ) ( not ( = ?auto_137976 ?auto_137979 ) ) ( not ( = ?auto_137977 ?auto_137982 ) ) ( not ( = ?auto_137977 ?auto_137979 ) ) ( not ( = ?auto_137978 ?auto_137982 ) ) ( not ( = ?auto_137978 ?auto_137979 ) ) ( not ( = ?auto_137981 ?auto_137982 ) ) ( not ( = ?auto_137981 ?auto_137979 ) ) ( not ( = ?auto_137982 ?auto_137979 ) ) ( ON ?auto_137982 ?auto_137981 ) ( CLEAR ?auto_137983 ) ( ON-TABLE ?auto_137980 ) ( ON ?auto_137983 ?auto_137980 ) ( not ( = ?auto_137980 ?auto_137983 ) ) ( not ( = ?auto_137980 ?auto_137979 ) ) ( not ( = ?auto_137983 ?auto_137979 ) ) ( not ( = ?auto_137976 ?auto_137983 ) ) ( not ( = ?auto_137976 ?auto_137980 ) ) ( not ( = ?auto_137977 ?auto_137983 ) ) ( not ( = ?auto_137977 ?auto_137980 ) ) ( not ( = ?auto_137978 ?auto_137983 ) ) ( not ( = ?auto_137978 ?auto_137980 ) ) ( not ( = ?auto_137981 ?auto_137983 ) ) ( not ( = ?auto_137981 ?auto_137980 ) ) ( not ( = ?auto_137982 ?auto_137983 ) ) ( not ( = ?auto_137982 ?auto_137980 ) ) ( ON ?auto_137979 ?auto_137982 ) ( CLEAR ?auto_137979 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_137976 ?auto_137977 ?auto_137978 ?auto_137981 ?auto_137982 )
      ( MAKE-3PILE ?auto_137976 ?auto_137977 ?auto_137978 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_137984 - BLOCK
      ?auto_137985 - BLOCK
      ?auto_137986 - BLOCK
    )
    :vars
    (
      ?auto_137990 - BLOCK
      ?auto_137991 - BLOCK
      ?auto_137989 - BLOCK
      ?auto_137988 - BLOCK
      ?auto_137987 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_137990 ?auto_137986 ) ( ON-TABLE ?auto_137984 ) ( ON ?auto_137985 ?auto_137984 ) ( ON ?auto_137986 ?auto_137985 ) ( not ( = ?auto_137984 ?auto_137985 ) ) ( not ( = ?auto_137984 ?auto_137986 ) ) ( not ( = ?auto_137984 ?auto_137990 ) ) ( not ( = ?auto_137985 ?auto_137986 ) ) ( not ( = ?auto_137985 ?auto_137990 ) ) ( not ( = ?auto_137986 ?auto_137990 ) ) ( not ( = ?auto_137984 ?auto_137991 ) ) ( not ( = ?auto_137984 ?auto_137989 ) ) ( not ( = ?auto_137985 ?auto_137991 ) ) ( not ( = ?auto_137985 ?auto_137989 ) ) ( not ( = ?auto_137986 ?auto_137991 ) ) ( not ( = ?auto_137986 ?auto_137989 ) ) ( not ( = ?auto_137990 ?auto_137991 ) ) ( not ( = ?auto_137990 ?auto_137989 ) ) ( not ( = ?auto_137991 ?auto_137989 ) ) ( ON ?auto_137991 ?auto_137990 ) ( ON-TABLE ?auto_137988 ) ( not ( = ?auto_137988 ?auto_137987 ) ) ( not ( = ?auto_137988 ?auto_137989 ) ) ( not ( = ?auto_137987 ?auto_137989 ) ) ( not ( = ?auto_137984 ?auto_137987 ) ) ( not ( = ?auto_137984 ?auto_137988 ) ) ( not ( = ?auto_137985 ?auto_137987 ) ) ( not ( = ?auto_137985 ?auto_137988 ) ) ( not ( = ?auto_137986 ?auto_137987 ) ) ( not ( = ?auto_137986 ?auto_137988 ) ) ( not ( = ?auto_137990 ?auto_137987 ) ) ( not ( = ?auto_137990 ?auto_137988 ) ) ( not ( = ?auto_137991 ?auto_137987 ) ) ( not ( = ?auto_137991 ?auto_137988 ) ) ( ON ?auto_137989 ?auto_137991 ) ( CLEAR ?auto_137989 ) ( HOLDING ?auto_137987 ) ( CLEAR ?auto_137988 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_137988 ?auto_137987 )
      ( MAKE-3PILE ?auto_137984 ?auto_137985 ?auto_137986 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_137992 - BLOCK
      ?auto_137993 - BLOCK
      ?auto_137994 - BLOCK
    )
    :vars
    (
      ?auto_137996 - BLOCK
      ?auto_137998 - BLOCK
      ?auto_137999 - BLOCK
      ?auto_137997 - BLOCK
      ?auto_137995 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_137996 ?auto_137994 ) ( ON-TABLE ?auto_137992 ) ( ON ?auto_137993 ?auto_137992 ) ( ON ?auto_137994 ?auto_137993 ) ( not ( = ?auto_137992 ?auto_137993 ) ) ( not ( = ?auto_137992 ?auto_137994 ) ) ( not ( = ?auto_137992 ?auto_137996 ) ) ( not ( = ?auto_137993 ?auto_137994 ) ) ( not ( = ?auto_137993 ?auto_137996 ) ) ( not ( = ?auto_137994 ?auto_137996 ) ) ( not ( = ?auto_137992 ?auto_137998 ) ) ( not ( = ?auto_137992 ?auto_137999 ) ) ( not ( = ?auto_137993 ?auto_137998 ) ) ( not ( = ?auto_137993 ?auto_137999 ) ) ( not ( = ?auto_137994 ?auto_137998 ) ) ( not ( = ?auto_137994 ?auto_137999 ) ) ( not ( = ?auto_137996 ?auto_137998 ) ) ( not ( = ?auto_137996 ?auto_137999 ) ) ( not ( = ?auto_137998 ?auto_137999 ) ) ( ON ?auto_137998 ?auto_137996 ) ( ON-TABLE ?auto_137997 ) ( not ( = ?auto_137997 ?auto_137995 ) ) ( not ( = ?auto_137997 ?auto_137999 ) ) ( not ( = ?auto_137995 ?auto_137999 ) ) ( not ( = ?auto_137992 ?auto_137995 ) ) ( not ( = ?auto_137992 ?auto_137997 ) ) ( not ( = ?auto_137993 ?auto_137995 ) ) ( not ( = ?auto_137993 ?auto_137997 ) ) ( not ( = ?auto_137994 ?auto_137995 ) ) ( not ( = ?auto_137994 ?auto_137997 ) ) ( not ( = ?auto_137996 ?auto_137995 ) ) ( not ( = ?auto_137996 ?auto_137997 ) ) ( not ( = ?auto_137998 ?auto_137995 ) ) ( not ( = ?auto_137998 ?auto_137997 ) ) ( ON ?auto_137999 ?auto_137998 ) ( CLEAR ?auto_137997 ) ( ON ?auto_137995 ?auto_137999 ) ( CLEAR ?auto_137995 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_137992 ?auto_137993 ?auto_137994 ?auto_137996 ?auto_137998 ?auto_137999 )
      ( MAKE-3PILE ?auto_137992 ?auto_137993 ?auto_137994 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_138000 - BLOCK
      ?auto_138001 - BLOCK
      ?auto_138002 - BLOCK
    )
    :vars
    (
      ?auto_138003 - BLOCK
      ?auto_138006 - BLOCK
      ?auto_138007 - BLOCK
      ?auto_138004 - BLOCK
      ?auto_138005 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_138003 ?auto_138002 ) ( ON-TABLE ?auto_138000 ) ( ON ?auto_138001 ?auto_138000 ) ( ON ?auto_138002 ?auto_138001 ) ( not ( = ?auto_138000 ?auto_138001 ) ) ( not ( = ?auto_138000 ?auto_138002 ) ) ( not ( = ?auto_138000 ?auto_138003 ) ) ( not ( = ?auto_138001 ?auto_138002 ) ) ( not ( = ?auto_138001 ?auto_138003 ) ) ( not ( = ?auto_138002 ?auto_138003 ) ) ( not ( = ?auto_138000 ?auto_138006 ) ) ( not ( = ?auto_138000 ?auto_138007 ) ) ( not ( = ?auto_138001 ?auto_138006 ) ) ( not ( = ?auto_138001 ?auto_138007 ) ) ( not ( = ?auto_138002 ?auto_138006 ) ) ( not ( = ?auto_138002 ?auto_138007 ) ) ( not ( = ?auto_138003 ?auto_138006 ) ) ( not ( = ?auto_138003 ?auto_138007 ) ) ( not ( = ?auto_138006 ?auto_138007 ) ) ( ON ?auto_138006 ?auto_138003 ) ( not ( = ?auto_138004 ?auto_138005 ) ) ( not ( = ?auto_138004 ?auto_138007 ) ) ( not ( = ?auto_138005 ?auto_138007 ) ) ( not ( = ?auto_138000 ?auto_138005 ) ) ( not ( = ?auto_138000 ?auto_138004 ) ) ( not ( = ?auto_138001 ?auto_138005 ) ) ( not ( = ?auto_138001 ?auto_138004 ) ) ( not ( = ?auto_138002 ?auto_138005 ) ) ( not ( = ?auto_138002 ?auto_138004 ) ) ( not ( = ?auto_138003 ?auto_138005 ) ) ( not ( = ?auto_138003 ?auto_138004 ) ) ( not ( = ?auto_138006 ?auto_138005 ) ) ( not ( = ?auto_138006 ?auto_138004 ) ) ( ON ?auto_138007 ?auto_138006 ) ( ON ?auto_138005 ?auto_138007 ) ( CLEAR ?auto_138005 ) ( HOLDING ?auto_138004 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_138004 )
      ( MAKE-3PILE ?auto_138000 ?auto_138001 ?auto_138002 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_138019 - BLOCK
      ?auto_138020 - BLOCK
      ?auto_138021 - BLOCK
    )
    :vars
    (
      ?auto_138023 - BLOCK
      ?auto_138026 - BLOCK
      ?auto_138024 - BLOCK
      ?auto_138022 - BLOCK
      ?auto_138025 - BLOCK
      ?auto_138027 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_138023 ?auto_138021 ) ( ON-TABLE ?auto_138019 ) ( ON ?auto_138020 ?auto_138019 ) ( ON ?auto_138021 ?auto_138020 ) ( not ( = ?auto_138019 ?auto_138020 ) ) ( not ( = ?auto_138019 ?auto_138021 ) ) ( not ( = ?auto_138019 ?auto_138023 ) ) ( not ( = ?auto_138020 ?auto_138021 ) ) ( not ( = ?auto_138020 ?auto_138023 ) ) ( not ( = ?auto_138021 ?auto_138023 ) ) ( not ( = ?auto_138019 ?auto_138026 ) ) ( not ( = ?auto_138019 ?auto_138024 ) ) ( not ( = ?auto_138020 ?auto_138026 ) ) ( not ( = ?auto_138020 ?auto_138024 ) ) ( not ( = ?auto_138021 ?auto_138026 ) ) ( not ( = ?auto_138021 ?auto_138024 ) ) ( not ( = ?auto_138023 ?auto_138026 ) ) ( not ( = ?auto_138023 ?auto_138024 ) ) ( not ( = ?auto_138026 ?auto_138024 ) ) ( ON ?auto_138026 ?auto_138023 ) ( not ( = ?auto_138022 ?auto_138025 ) ) ( not ( = ?auto_138022 ?auto_138024 ) ) ( not ( = ?auto_138025 ?auto_138024 ) ) ( not ( = ?auto_138019 ?auto_138025 ) ) ( not ( = ?auto_138019 ?auto_138022 ) ) ( not ( = ?auto_138020 ?auto_138025 ) ) ( not ( = ?auto_138020 ?auto_138022 ) ) ( not ( = ?auto_138021 ?auto_138025 ) ) ( not ( = ?auto_138021 ?auto_138022 ) ) ( not ( = ?auto_138023 ?auto_138025 ) ) ( not ( = ?auto_138023 ?auto_138022 ) ) ( not ( = ?auto_138026 ?auto_138025 ) ) ( not ( = ?auto_138026 ?auto_138022 ) ) ( ON ?auto_138024 ?auto_138026 ) ( ON ?auto_138025 ?auto_138024 ) ( CLEAR ?auto_138025 ) ( ON ?auto_138022 ?auto_138027 ) ( CLEAR ?auto_138022 ) ( HAND-EMPTY ) ( not ( = ?auto_138019 ?auto_138027 ) ) ( not ( = ?auto_138020 ?auto_138027 ) ) ( not ( = ?auto_138021 ?auto_138027 ) ) ( not ( = ?auto_138023 ?auto_138027 ) ) ( not ( = ?auto_138026 ?auto_138027 ) ) ( not ( = ?auto_138024 ?auto_138027 ) ) ( not ( = ?auto_138022 ?auto_138027 ) ) ( not ( = ?auto_138025 ?auto_138027 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_138022 ?auto_138027 )
      ( MAKE-3PILE ?auto_138019 ?auto_138020 ?auto_138021 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_138028 - BLOCK
      ?auto_138029 - BLOCK
      ?auto_138030 - BLOCK
    )
    :vars
    (
      ?auto_138031 - BLOCK
      ?auto_138035 - BLOCK
      ?auto_138032 - BLOCK
      ?auto_138033 - BLOCK
      ?auto_138034 - BLOCK
      ?auto_138036 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_138031 ?auto_138030 ) ( ON-TABLE ?auto_138028 ) ( ON ?auto_138029 ?auto_138028 ) ( ON ?auto_138030 ?auto_138029 ) ( not ( = ?auto_138028 ?auto_138029 ) ) ( not ( = ?auto_138028 ?auto_138030 ) ) ( not ( = ?auto_138028 ?auto_138031 ) ) ( not ( = ?auto_138029 ?auto_138030 ) ) ( not ( = ?auto_138029 ?auto_138031 ) ) ( not ( = ?auto_138030 ?auto_138031 ) ) ( not ( = ?auto_138028 ?auto_138035 ) ) ( not ( = ?auto_138028 ?auto_138032 ) ) ( not ( = ?auto_138029 ?auto_138035 ) ) ( not ( = ?auto_138029 ?auto_138032 ) ) ( not ( = ?auto_138030 ?auto_138035 ) ) ( not ( = ?auto_138030 ?auto_138032 ) ) ( not ( = ?auto_138031 ?auto_138035 ) ) ( not ( = ?auto_138031 ?auto_138032 ) ) ( not ( = ?auto_138035 ?auto_138032 ) ) ( ON ?auto_138035 ?auto_138031 ) ( not ( = ?auto_138033 ?auto_138034 ) ) ( not ( = ?auto_138033 ?auto_138032 ) ) ( not ( = ?auto_138034 ?auto_138032 ) ) ( not ( = ?auto_138028 ?auto_138034 ) ) ( not ( = ?auto_138028 ?auto_138033 ) ) ( not ( = ?auto_138029 ?auto_138034 ) ) ( not ( = ?auto_138029 ?auto_138033 ) ) ( not ( = ?auto_138030 ?auto_138034 ) ) ( not ( = ?auto_138030 ?auto_138033 ) ) ( not ( = ?auto_138031 ?auto_138034 ) ) ( not ( = ?auto_138031 ?auto_138033 ) ) ( not ( = ?auto_138035 ?auto_138034 ) ) ( not ( = ?auto_138035 ?auto_138033 ) ) ( ON ?auto_138032 ?auto_138035 ) ( ON ?auto_138033 ?auto_138036 ) ( CLEAR ?auto_138033 ) ( not ( = ?auto_138028 ?auto_138036 ) ) ( not ( = ?auto_138029 ?auto_138036 ) ) ( not ( = ?auto_138030 ?auto_138036 ) ) ( not ( = ?auto_138031 ?auto_138036 ) ) ( not ( = ?auto_138035 ?auto_138036 ) ) ( not ( = ?auto_138032 ?auto_138036 ) ) ( not ( = ?auto_138033 ?auto_138036 ) ) ( not ( = ?auto_138034 ?auto_138036 ) ) ( HOLDING ?auto_138034 ) ( CLEAR ?auto_138032 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_138028 ?auto_138029 ?auto_138030 ?auto_138031 ?auto_138035 ?auto_138032 ?auto_138034 )
      ( MAKE-3PILE ?auto_138028 ?auto_138029 ?auto_138030 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_138037 - BLOCK
      ?auto_138038 - BLOCK
      ?auto_138039 - BLOCK
    )
    :vars
    (
      ?auto_138041 - BLOCK
      ?auto_138042 - BLOCK
      ?auto_138040 - BLOCK
      ?auto_138043 - BLOCK
      ?auto_138045 - BLOCK
      ?auto_138044 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_138041 ?auto_138039 ) ( ON-TABLE ?auto_138037 ) ( ON ?auto_138038 ?auto_138037 ) ( ON ?auto_138039 ?auto_138038 ) ( not ( = ?auto_138037 ?auto_138038 ) ) ( not ( = ?auto_138037 ?auto_138039 ) ) ( not ( = ?auto_138037 ?auto_138041 ) ) ( not ( = ?auto_138038 ?auto_138039 ) ) ( not ( = ?auto_138038 ?auto_138041 ) ) ( not ( = ?auto_138039 ?auto_138041 ) ) ( not ( = ?auto_138037 ?auto_138042 ) ) ( not ( = ?auto_138037 ?auto_138040 ) ) ( not ( = ?auto_138038 ?auto_138042 ) ) ( not ( = ?auto_138038 ?auto_138040 ) ) ( not ( = ?auto_138039 ?auto_138042 ) ) ( not ( = ?auto_138039 ?auto_138040 ) ) ( not ( = ?auto_138041 ?auto_138042 ) ) ( not ( = ?auto_138041 ?auto_138040 ) ) ( not ( = ?auto_138042 ?auto_138040 ) ) ( ON ?auto_138042 ?auto_138041 ) ( not ( = ?auto_138043 ?auto_138045 ) ) ( not ( = ?auto_138043 ?auto_138040 ) ) ( not ( = ?auto_138045 ?auto_138040 ) ) ( not ( = ?auto_138037 ?auto_138045 ) ) ( not ( = ?auto_138037 ?auto_138043 ) ) ( not ( = ?auto_138038 ?auto_138045 ) ) ( not ( = ?auto_138038 ?auto_138043 ) ) ( not ( = ?auto_138039 ?auto_138045 ) ) ( not ( = ?auto_138039 ?auto_138043 ) ) ( not ( = ?auto_138041 ?auto_138045 ) ) ( not ( = ?auto_138041 ?auto_138043 ) ) ( not ( = ?auto_138042 ?auto_138045 ) ) ( not ( = ?auto_138042 ?auto_138043 ) ) ( ON ?auto_138040 ?auto_138042 ) ( ON ?auto_138043 ?auto_138044 ) ( not ( = ?auto_138037 ?auto_138044 ) ) ( not ( = ?auto_138038 ?auto_138044 ) ) ( not ( = ?auto_138039 ?auto_138044 ) ) ( not ( = ?auto_138041 ?auto_138044 ) ) ( not ( = ?auto_138042 ?auto_138044 ) ) ( not ( = ?auto_138040 ?auto_138044 ) ) ( not ( = ?auto_138043 ?auto_138044 ) ) ( not ( = ?auto_138045 ?auto_138044 ) ) ( CLEAR ?auto_138040 ) ( ON ?auto_138045 ?auto_138043 ) ( CLEAR ?auto_138045 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_138044 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_138044 ?auto_138043 )
      ( MAKE-3PILE ?auto_138037 ?auto_138038 ?auto_138039 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_138046 - BLOCK
      ?auto_138047 - BLOCK
      ?auto_138048 - BLOCK
    )
    :vars
    (
      ?auto_138052 - BLOCK
      ?auto_138049 - BLOCK
      ?auto_138051 - BLOCK
      ?auto_138050 - BLOCK
      ?auto_138054 - BLOCK
      ?auto_138053 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_138052 ?auto_138048 ) ( ON-TABLE ?auto_138046 ) ( ON ?auto_138047 ?auto_138046 ) ( ON ?auto_138048 ?auto_138047 ) ( not ( = ?auto_138046 ?auto_138047 ) ) ( not ( = ?auto_138046 ?auto_138048 ) ) ( not ( = ?auto_138046 ?auto_138052 ) ) ( not ( = ?auto_138047 ?auto_138048 ) ) ( not ( = ?auto_138047 ?auto_138052 ) ) ( not ( = ?auto_138048 ?auto_138052 ) ) ( not ( = ?auto_138046 ?auto_138049 ) ) ( not ( = ?auto_138046 ?auto_138051 ) ) ( not ( = ?auto_138047 ?auto_138049 ) ) ( not ( = ?auto_138047 ?auto_138051 ) ) ( not ( = ?auto_138048 ?auto_138049 ) ) ( not ( = ?auto_138048 ?auto_138051 ) ) ( not ( = ?auto_138052 ?auto_138049 ) ) ( not ( = ?auto_138052 ?auto_138051 ) ) ( not ( = ?auto_138049 ?auto_138051 ) ) ( ON ?auto_138049 ?auto_138052 ) ( not ( = ?auto_138050 ?auto_138054 ) ) ( not ( = ?auto_138050 ?auto_138051 ) ) ( not ( = ?auto_138054 ?auto_138051 ) ) ( not ( = ?auto_138046 ?auto_138054 ) ) ( not ( = ?auto_138046 ?auto_138050 ) ) ( not ( = ?auto_138047 ?auto_138054 ) ) ( not ( = ?auto_138047 ?auto_138050 ) ) ( not ( = ?auto_138048 ?auto_138054 ) ) ( not ( = ?auto_138048 ?auto_138050 ) ) ( not ( = ?auto_138052 ?auto_138054 ) ) ( not ( = ?auto_138052 ?auto_138050 ) ) ( not ( = ?auto_138049 ?auto_138054 ) ) ( not ( = ?auto_138049 ?auto_138050 ) ) ( ON ?auto_138050 ?auto_138053 ) ( not ( = ?auto_138046 ?auto_138053 ) ) ( not ( = ?auto_138047 ?auto_138053 ) ) ( not ( = ?auto_138048 ?auto_138053 ) ) ( not ( = ?auto_138052 ?auto_138053 ) ) ( not ( = ?auto_138049 ?auto_138053 ) ) ( not ( = ?auto_138051 ?auto_138053 ) ) ( not ( = ?auto_138050 ?auto_138053 ) ) ( not ( = ?auto_138054 ?auto_138053 ) ) ( ON ?auto_138054 ?auto_138050 ) ( CLEAR ?auto_138054 ) ( ON-TABLE ?auto_138053 ) ( HOLDING ?auto_138051 ) ( CLEAR ?auto_138049 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_138046 ?auto_138047 ?auto_138048 ?auto_138052 ?auto_138049 ?auto_138051 )
      ( MAKE-3PILE ?auto_138046 ?auto_138047 ?auto_138048 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_138113 - BLOCK
      ?auto_138114 - BLOCK
      ?auto_138115 - BLOCK
      ?auto_138116 - BLOCK
      ?auto_138117 - BLOCK
    )
    :vars
    (
      ?auto_138118 - BLOCK
      ?auto_138119 - BLOCK
      ?auto_138120 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_138113 ) ( ON ?auto_138114 ?auto_138113 ) ( ON ?auto_138115 ?auto_138114 ) ( not ( = ?auto_138113 ?auto_138114 ) ) ( not ( = ?auto_138113 ?auto_138115 ) ) ( not ( = ?auto_138113 ?auto_138116 ) ) ( not ( = ?auto_138113 ?auto_138117 ) ) ( not ( = ?auto_138114 ?auto_138115 ) ) ( not ( = ?auto_138114 ?auto_138116 ) ) ( not ( = ?auto_138114 ?auto_138117 ) ) ( not ( = ?auto_138115 ?auto_138116 ) ) ( not ( = ?auto_138115 ?auto_138117 ) ) ( not ( = ?auto_138116 ?auto_138117 ) ) ( ON ?auto_138117 ?auto_138118 ) ( not ( = ?auto_138113 ?auto_138118 ) ) ( not ( = ?auto_138114 ?auto_138118 ) ) ( not ( = ?auto_138115 ?auto_138118 ) ) ( not ( = ?auto_138116 ?auto_138118 ) ) ( not ( = ?auto_138117 ?auto_138118 ) ) ( CLEAR ?auto_138115 ) ( ON ?auto_138116 ?auto_138117 ) ( CLEAR ?auto_138116 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_138119 ) ( ON ?auto_138120 ?auto_138119 ) ( ON ?auto_138118 ?auto_138120 ) ( not ( = ?auto_138119 ?auto_138120 ) ) ( not ( = ?auto_138119 ?auto_138118 ) ) ( not ( = ?auto_138119 ?auto_138117 ) ) ( not ( = ?auto_138119 ?auto_138116 ) ) ( not ( = ?auto_138120 ?auto_138118 ) ) ( not ( = ?auto_138120 ?auto_138117 ) ) ( not ( = ?auto_138120 ?auto_138116 ) ) ( not ( = ?auto_138113 ?auto_138119 ) ) ( not ( = ?auto_138113 ?auto_138120 ) ) ( not ( = ?auto_138114 ?auto_138119 ) ) ( not ( = ?auto_138114 ?auto_138120 ) ) ( not ( = ?auto_138115 ?auto_138119 ) ) ( not ( = ?auto_138115 ?auto_138120 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_138119 ?auto_138120 ?auto_138118 ?auto_138117 )
      ( MAKE-5PILE ?auto_138113 ?auto_138114 ?auto_138115 ?auto_138116 ?auto_138117 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_138121 - BLOCK
      ?auto_138122 - BLOCK
      ?auto_138123 - BLOCK
      ?auto_138124 - BLOCK
      ?auto_138125 - BLOCK
    )
    :vars
    (
      ?auto_138127 - BLOCK
      ?auto_138126 - BLOCK
      ?auto_138128 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_138121 ) ( ON ?auto_138122 ?auto_138121 ) ( not ( = ?auto_138121 ?auto_138122 ) ) ( not ( = ?auto_138121 ?auto_138123 ) ) ( not ( = ?auto_138121 ?auto_138124 ) ) ( not ( = ?auto_138121 ?auto_138125 ) ) ( not ( = ?auto_138122 ?auto_138123 ) ) ( not ( = ?auto_138122 ?auto_138124 ) ) ( not ( = ?auto_138122 ?auto_138125 ) ) ( not ( = ?auto_138123 ?auto_138124 ) ) ( not ( = ?auto_138123 ?auto_138125 ) ) ( not ( = ?auto_138124 ?auto_138125 ) ) ( ON ?auto_138125 ?auto_138127 ) ( not ( = ?auto_138121 ?auto_138127 ) ) ( not ( = ?auto_138122 ?auto_138127 ) ) ( not ( = ?auto_138123 ?auto_138127 ) ) ( not ( = ?auto_138124 ?auto_138127 ) ) ( not ( = ?auto_138125 ?auto_138127 ) ) ( ON ?auto_138124 ?auto_138125 ) ( CLEAR ?auto_138124 ) ( ON-TABLE ?auto_138126 ) ( ON ?auto_138128 ?auto_138126 ) ( ON ?auto_138127 ?auto_138128 ) ( not ( = ?auto_138126 ?auto_138128 ) ) ( not ( = ?auto_138126 ?auto_138127 ) ) ( not ( = ?auto_138126 ?auto_138125 ) ) ( not ( = ?auto_138126 ?auto_138124 ) ) ( not ( = ?auto_138128 ?auto_138127 ) ) ( not ( = ?auto_138128 ?auto_138125 ) ) ( not ( = ?auto_138128 ?auto_138124 ) ) ( not ( = ?auto_138121 ?auto_138126 ) ) ( not ( = ?auto_138121 ?auto_138128 ) ) ( not ( = ?auto_138122 ?auto_138126 ) ) ( not ( = ?auto_138122 ?auto_138128 ) ) ( not ( = ?auto_138123 ?auto_138126 ) ) ( not ( = ?auto_138123 ?auto_138128 ) ) ( HOLDING ?auto_138123 ) ( CLEAR ?auto_138122 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_138121 ?auto_138122 ?auto_138123 )
      ( MAKE-5PILE ?auto_138121 ?auto_138122 ?auto_138123 ?auto_138124 ?auto_138125 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_138129 - BLOCK
      ?auto_138130 - BLOCK
      ?auto_138131 - BLOCK
      ?auto_138132 - BLOCK
      ?auto_138133 - BLOCK
    )
    :vars
    (
      ?auto_138136 - BLOCK
      ?auto_138135 - BLOCK
      ?auto_138134 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_138129 ) ( ON ?auto_138130 ?auto_138129 ) ( not ( = ?auto_138129 ?auto_138130 ) ) ( not ( = ?auto_138129 ?auto_138131 ) ) ( not ( = ?auto_138129 ?auto_138132 ) ) ( not ( = ?auto_138129 ?auto_138133 ) ) ( not ( = ?auto_138130 ?auto_138131 ) ) ( not ( = ?auto_138130 ?auto_138132 ) ) ( not ( = ?auto_138130 ?auto_138133 ) ) ( not ( = ?auto_138131 ?auto_138132 ) ) ( not ( = ?auto_138131 ?auto_138133 ) ) ( not ( = ?auto_138132 ?auto_138133 ) ) ( ON ?auto_138133 ?auto_138136 ) ( not ( = ?auto_138129 ?auto_138136 ) ) ( not ( = ?auto_138130 ?auto_138136 ) ) ( not ( = ?auto_138131 ?auto_138136 ) ) ( not ( = ?auto_138132 ?auto_138136 ) ) ( not ( = ?auto_138133 ?auto_138136 ) ) ( ON ?auto_138132 ?auto_138133 ) ( ON-TABLE ?auto_138135 ) ( ON ?auto_138134 ?auto_138135 ) ( ON ?auto_138136 ?auto_138134 ) ( not ( = ?auto_138135 ?auto_138134 ) ) ( not ( = ?auto_138135 ?auto_138136 ) ) ( not ( = ?auto_138135 ?auto_138133 ) ) ( not ( = ?auto_138135 ?auto_138132 ) ) ( not ( = ?auto_138134 ?auto_138136 ) ) ( not ( = ?auto_138134 ?auto_138133 ) ) ( not ( = ?auto_138134 ?auto_138132 ) ) ( not ( = ?auto_138129 ?auto_138135 ) ) ( not ( = ?auto_138129 ?auto_138134 ) ) ( not ( = ?auto_138130 ?auto_138135 ) ) ( not ( = ?auto_138130 ?auto_138134 ) ) ( not ( = ?auto_138131 ?auto_138135 ) ) ( not ( = ?auto_138131 ?auto_138134 ) ) ( CLEAR ?auto_138130 ) ( ON ?auto_138131 ?auto_138132 ) ( CLEAR ?auto_138131 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_138135 ?auto_138134 ?auto_138136 ?auto_138133 ?auto_138132 )
      ( MAKE-5PILE ?auto_138129 ?auto_138130 ?auto_138131 ?auto_138132 ?auto_138133 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_138137 - BLOCK
      ?auto_138138 - BLOCK
      ?auto_138139 - BLOCK
      ?auto_138140 - BLOCK
      ?auto_138141 - BLOCK
    )
    :vars
    (
      ?auto_138144 - BLOCK
      ?auto_138143 - BLOCK
      ?auto_138142 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_138137 ) ( not ( = ?auto_138137 ?auto_138138 ) ) ( not ( = ?auto_138137 ?auto_138139 ) ) ( not ( = ?auto_138137 ?auto_138140 ) ) ( not ( = ?auto_138137 ?auto_138141 ) ) ( not ( = ?auto_138138 ?auto_138139 ) ) ( not ( = ?auto_138138 ?auto_138140 ) ) ( not ( = ?auto_138138 ?auto_138141 ) ) ( not ( = ?auto_138139 ?auto_138140 ) ) ( not ( = ?auto_138139 ?auto_138141 ) ) ( not ( = ?auto_138140 ?auto_138141 ) ) ( ON ?auto_138141 ?auto_138144 ) ( not ( = ?auto_138137 ?auto_138144 ) ) ( not ( = ?auto_138138 ?auto_138144 ) ) ( not ( = ?auto_138139 ?auto_138144 ) ) ( not ( = ?auto_138140 ?auto_138144 ) ) ( not ( = ?auto_138141 ?auto_138144 ) ) ( ON ?auto_138140 ?auto_138141 ) ( ON-TABLE ?auto_138143 ) ( ON ?auto_138142 ?auto_138143 ) ( ON ?auto_138144 ?auto_138142 ) ( not ( = ?auto_138143 ?auto_138142 ) ) ( not ( = ?auto_138143 ?auto_138144 ) ) ( not ( = ?auto_138143 ?auto_138141 ) ) ( not ( = ?auto_138143 ?auto_138140 ) ) ( not ( = ?auto_138142 ?auto_138144 ) ) ( not ( = ?auto_138142 ?auto_138141 ) ) ( not ( = ?auto_138142 ?auto_138140 ) ) ( not ( = ?auto_138137 ?auto_138143 ) ) ( not ( = ?auto_138137 ?auto_138142 ) ) ( not ( = ?auto_138138 ?auto_138143 ) ) ( not ( = ?auto_138138 ?auto_138142 ) ) ( not ( = ?auto_138139 ?auto_138143 ) ) ( not ( = ?auto_138139 ?auto_138142 ) ) ( ON ?auto_138139 ?auto_138140 ) ( CLEAR ?auto_138139 ) ( HOLDING ?auto_138138 ) ( CLEAR ?auto_138137 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_138137 ?auto_138138 )
      ( MAKE-5PILE ?auto_138137 ?auto_138138 ?auto_138139 ?auto_138140 ?auto_138141 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_138145 - BLOCK
      ?auto_138146 - BLOCK
      ?auto_138147 - BLOCK
      ?auto_138148 - BLOCK
      ?auto_138149 - BLOCK
    )
    :vars
    (
      ?auto_138152 - BLOCK
      ?auto_138151 - BLOCK
      ?auto_138150 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_138145 ) ( not ( = ?auto_138145 ?auto_138146 ) ) ( not ( = ?auto_138145 ?auto_138147 ) ) ( not ( = ?auto_138145 ?auto_138148 ) ) ( not ( = ?auto_138145 ?auto_138149 ) ) ( not ( = ?auto_138146 ?auto_138147 ) ) ( not ( = ?auto_138146 ?auto_138148 ) ) ( not ( = ?auto_138146 ?auto_138149 ) ) ( not ( = ?auto_138147 ?auto_138148 ) ) ( not ( = ?auto_138147 ?auto_138149 ) ) ( not ( = ?auto_138148 ?auto_138149 ) ) ( ON ?auto_138149 ?auto_138152 ) ( not ( = ?auto_138145 ?auto_138152 ) ) ( not ( = ?auto_138146 ?auto_138152 ) ) ( not ( = ?auto_138147 ?auto_138152 ) ) ( not ( = ?auto_138148 ?auto_138152 ) ) ( not ( = ?auto_138149 ?auto_138152 ) ) ( ON ?auto_138148 ?auto_138149 ) ( ON-TABLE ?auto_138151 ) ( ON ?auto_138150 ?auto_138151 ) ( ON ?auto_138152 ?auto_138150 ) ( not ( = ?auto_138151 ?auto_138150 ) ) ( not ( = ?auto_138151 ?auto_138152 ) ) ( not ( = ?auto_138151 ?auto_138149 ) ) ( not ( = ?auto_138151 ?auto_138148 ) ) ( not ( = ?auto_138150 ?auto_138152 ) ) ( not ( = ?auto_138150 ?auto_138149 ) ) ( not ( = ?auto_138150 ?auto_138148 ) ) ( not ( = ?auto_138145 ?auto_138151 ) ) ( not ( = ?auto_138145 ?auto_138150 ) ) ( not ( = ?auto_138146 ?auto_138151 ) ) ( not ( = ?auto_138146 ?auto_138150 ) ) ( not ( = ?auto_138147 ?auto_138151 ) ) ( not ( = ?auto_138147 ?auto_138150 ) ) ( ON ?auto_138147 ?auto_138148 ) ( CLEAR ?auto_138145 ) ( ON ?auto_138146 ?auto_138147 ) ( CLEAR ?auto_138146 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_138151 ?auto_138150 ?auto_138152 ?auto_138149 ?auto_138148 ?auto_138147 )
      ( MAKE-5PILE ?auto_138145 ?auto_138146 ?auto_138147 ?auto_138148 ?auto_138149 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_138153 - BLOCK
      ?auto_138154 - BLOCK
      ?auto_138155 - BLOCK
      ?auto_138156 - BLOCK
      ?auto_138157 - BLOCK
    )
    :vars
    (
      ?auto_138158 - BLOCK
      ?auto_138160 - BLOCK
      ?auto_138159 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_138153 ?auto_138154 ) ) ( not ( = ?auto_138153 ?auto_138155 ) ) ( not ( = ?auto_138153 ?auto_138156 ) ) ( not ( = ?auto_138153 ?auto_138157 ) ) ( not ( = ?auto_138154 ?auto_138155 ) ) ( not ( = ?auto_138154 ?auto_138156 ) ) ( not ( = ?auto_138154 ?auto_138157 ) ) ( not ( = ?auto_138155 ?auto_138156 ) ) ( not ( = ?auto_138155 ?auto_138157 ) ) ( not ( = ?auto_138156 ?auto_138157 ) ) ( ON ?auto_138157 ?auto_138158 ) ( not ( = ?auto_138153 ?auto_138158 ) ) ( not ( = ?auto_138154 ?auto_138158 ) ) ( not ( = ?auto_138155 ?auto_138158 ) ) ( not ( = ?auto_138156 ?auto_138158 ) ) ( not ( = ?auto_138157 ?auto_138158 ) ) ( ON ?auto_138156 ?auto_138157 ) ( ON-TABLE ?auto_138160 ) ( ON ?auto_138159 ?auto_138160 ) ( ON ?auto_138158 ?auto_138159 ) ( not ( = ?auto_138160 ?auto_138159 ) ) ( not ( = ?auto_138160 ?auto_138158 ) ) ( not ( = ?auto_138160 ?auto_138157 ) ) ( not ( = ?auto_138160 ?auto_138156 ) ) ( not ( = ?auto_138159 ?auto_138158 ) ) ( not ( = ?auto_138159 ?auto_138157 ) ) ( not ( = ?auto_138159 ?auto_138156 ) ) ( not ( = ?auto_138153 ?auto_138160 ) ) ( not ( = ?auto_138153 ?auto_138159 ) ) ( not ( = ?auto_138154 ?auto_138160 ) ) ( not ( = ?auto_138154 ?auto_138159 ) ) ( not ( = ?auto_138155 ?auto_138160 ) ) ( not ( = ?auto_138155 ?auto_138159 ) ) ( ON ?auto_138155 ?auto_138156 ) ( ON ?auto_138154 ?auto_138155 ) ( CLEAR ?auto_138154 ) ( HOLDING ?auto_138153 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_138153 )
      ( MAKE-5PILE ?auto_138153 ?auto_138154 ?auto_138155 ?auto_138156 ?auto_138157 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_138161 - BLOCK
      ?auto_138162 - BLOCK
      ?auto_138163 - BLOCK
      ?auto_138164 - BLOCK
      ?auto_138165 - BLOCK
    )
    :vars
    (
      ?auto_138167 - BLOCK
      ?auto_138168 - BLOCK
      ?auto_138166 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_138161 ?auto_138162 ) ) ( not ( = ?auto_138161 ?auto_138163 ) ) ( not ( = ?auto_138161 ?auto_138164 ) ) ( not ( = ?auto_138161 ?auto_138165 ) ) ( not ( = ?auto_138162 ?auto_138163 ) ) ( not ( = ?auto_138162 ?auto_138164 ) ) ( not ( = ?auto_138162 ?auto_138165 ) ) ( not ( = ?auto_138163 ?auto_138164 ) ) ( not ( = ?auto_138163 ?auto_138165 ) ) ( not ( = ?auto_138164 ?auto_138165 ) ) ( ON ?auto_138165 ?auto_138167 ) ( not ( = ?auto_138161 ?auto_138167 ) ) ( not ( = ?auto_138162 ?auto_138167 ) ) ( not ( = ?auto_138163 ?auto_138167 ) ) ( not ( = ?auto_138164 ?auto_138167 ) ) ( not ( = ?auto_138165 ?auto_138167 ) ) ( ON ?auto_138164 ?auto_138165 ) ( ON-TABLE ?auto_138168 ) ( ON ?auto_138166 ?auto_138168 ) ( ON ?auto_138167 ?auto_138166 ) ( not ( = ?auto_138168 ?auto_138166 ) ) ( not ( = ?auto_138168 ?auto_138167 ) ) ( not ( = ?auto_138168 ?auto_138165 ) ) ( not ( = ?auto_138168 ?auto_138164 ) ) ( not ( = ?auto_138166 ?auto_138167 ) ) ( not ( = ?auto_138166 ?auto_138165 ) ) ( not ( = ?auto_138166 ?auto_138164 ) ) ( not ( = ?auto_138161 ?auto_138168 ) ) ( not ( = ?auto_138161 ?auto_138166 ) ) ( not ( = ?auto_138162 ?auto_138168 ) ) ( not ( = ?auto_138162 ?auto_138166 ) ) ( not ( = ?auto_138163 ?auto_138168 ) ) ( not ( = ?auto_138163 ?auto_138166 ) ) ( ON ?auto_138163 ?auto_138164 ) ( ON ?auto_138162 ?auto_138163 ) ( ON ?auto_138161 ?auto_138162 ) ( CLEAR ?auto_138161 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_138168 ?auto_138166 ?auto_138167 ?auto_138165 ?auto_138164 ?auto_138163 ?auto_138162 )
      ( MAKE-5PILE ?auto_138161 ?auto_138162 ?auto_138163 ?auto_138164 ?auto_138165 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_138174 - BLOCK
      ?auto_138175 - BLOCK
      ?auto_138176 - BLOCK
      ?auto_138177 - BLOCK
      ?auto_138178 - BLOCK
    )
    :vars
    (
      ?auto_138180 - BLOCK
      ?auto_138181 - BLOCK
      ?auto_138179 - BLOCK
      ?auto_138182 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_138174 ?auto_138175 ) ) ( not ( = ?auto_138174 ?auto_138176 ) ) ( not ( = ?auto_138174 ?auto_138177 ) ) ( not ( = ?auto_138174 ?auto_138178 ) ) ( not ( = ?auto_138175 ?auto_138176 ) ) ( not ( = ?auto_138175 ?auto_138177 ) ) ( not ( = ?auto_138175 ?auto_138178 ) ) ( not ( = ?auto_138176 ?auto_138177 ) ) ( not ( = ?auto_138176 ?auto_138178 ) ) ( not ( = ?auto_138177 ?auto_138178 ) ) ( ON ?auto_138178 ?auto_138180 ) ( not ( = ?auto_138174 ?auto_138180 ) ) ( not ( = ?auto_138175 ?auto_138180 ) ) ( not ( = ?auto_138176 ?auto_138180 ) ) ( not ( = ?auto_138177 ?auto_138180 ) ) ( not ( = ?auto_138178 ?auto_138180 ) ) ( ON ?auto_138177 ?auto_138178 ) ( ON-TABLE ?auto_138181 ) ( ON ?auto_138179 ?auto_138181 ) ( ON ?auto_138180 ?auto_138179 ) ( not ( = ?auto_138181 ?auto_138179 ) ) ( not ( = ?auto_138181 ?auto_138180 ) ) ( not ( = ?auto_138181 ?auto_138178 ) ) ( not ( = ?auto_138181 ?auto_138177 ) ) ( not ( = ?auto_138179 ?auto_138180 ) ) ( not ( = ?auto_138179 ?auto_138178 ) ) ( not ( = ?auto_138179 ?auto_138177 ) ) ( not ( = ?auto_138174 ?auto_138181 ) ) ( not ( = ?auto_138174 ?auto_138179 ) ) ( not ( = ?auto_138175 ?auto_138181 ) ) ( not ( = ?auto_138175 ?auto_138179 ) ) ( not ( = ?auto_138176 ?auto_138181 ) ) ( not ( = ?auto_138176 ?auto_138179 ) ) ( ON ?auto_138176 ?auto_138177 ) ( ON ?auto_138175 ?auto_138176 ) ( CLEAR ?auto_138175 ) ( ON ?auto_138174 ?auto_138182 ) ( CLEAR ?auto_138174 ) ( HAND-EMPTY ) ( not ( = ?auto_138174 ?auto_138182 ) ) ( not ( = ?auto_138175 ?auto_138182 ) ) ( not ( = ?auto_138176 ?auto_138182 ) ) ( not ( = ?auto_138177 ?auto_138182 ) ) ( not ( = ?auto_138178 ?auto_138182 ) ) ( not ( = ?auto_138180 ?auto_138182 ) ) ( not ( = ?auto_138181 ?auto_138182 ) ) ( not ( = ?auto_138179 ?auto_138182 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_138174 ?auto_138182 )
      ( MAKE-5PILE ?auto_138174 ?auto_138175 ?auto_138176 ?auto_138177 ?auto_138178 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_138183 - BLOCK
      ?auto_138184 - BLOCK
      ?auto_138185 - BLOCK
      ?auto_138186 - BLOCK
      ?auto_138187 - BLOCK
    )
    :vars
    (
      ?auto_138191 - BLOCK
      ?auto_138188 - BLOCK
      ?auto_138189 - BLOCK
      ?auto_138190 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_138183 ?auto_138184 ) ) ( not ( = ?auto_138183 ?auto_138185 ) ) ( not ( = ?auto_138183 ?auto_138186 ) ) ( not ( = ?auto_138183 ?auto_138187 ) ) ( not ( = ?auto_138184 ?auto_138185 ) ) ( not ( = ?auto_138184 ?auto_138186 ) ) ( not ( = ?auto_138184 ?auto_138187 ) ) ( not ( = ?auto_138185 ?auto_138186 ) ) ( not ( = ?auto_138185 ?auto_138187 ) ) ( not ( = ?auto_138186 ?auto_138187 ) ) ( ON ?auto_138187 ?auto_138191 ) ( not ( = ?auto_138183 ?auto_138191 ) ) ( not ( = ?auto_138184 ?auto_138191 ) ) ( not ( = ?auto_138185 ?auto_138191 ) ) ( not ( = ?auto_138186 ?auto_138191 ) ) ( not ( = ?auto_138187 ?auto_138191 ) ) ( ON ?auto_138186 ?auto_138187 ) ( ON-TABLE ?auto_138188 ) ( ON ?auto_138189 ?auto_138188 ) ( ON ?auto_138191 ?auto_138189 ) ( not ( = ?auto_138188 ?auto_138189 ) ) ( not ( = ?auto_138188 ?auto_138191 ) ) ( not ( = ?auto_138188 ?auto_138187 ) ) ( not ( = ?auto_138188 ?auto_138186 ) ) ( not ( = ?auto_138189 ?auto_138191 ) ) ( not ( = ?auto_138189 ?auto_138187 ) ) ( not ( = ?auto_138189 ?auto_138186 ) ) ( not ( = ?auto_138183 ?auto_138188 ) ) ( not ( = ?auto_138183 ?auto_138189 ) ) ( not ( = ?auto_138184 ?auto_138188 ) ) ( not ( = ?auto_138184 ?auto_138189 ) ) ( not ( = ?auto_138185 ?auto_138188 ) ) ( not ( = ?auto_138185 ?auto_138189 ) ) ( ON ?auto_138185 ?auto_138186 ) ( ON ?auto_138183 ?auto_138190 ) ( CLEAR ?auto_138183 ) ( not ( = ?auto_138183 ?auto_138190 ) ) ( not ( = ?auto_138184 ?auto_138190 ) ) ( not ( = ?auto_138185 ?auto_138190 ) ) ( not ( = ?auto_138186 ?auto_138190 ) ) ( not ( = ?auto_138187 ?auto_138190 ) ) ( not ( = ?auto_138191 ?auto_138190 ) ) ( not ( = ?auto_138188 ?auto_138190 ) ) ( not ( = ?auto_138189 ?auto_138190 ) ) ( HOLDING ?auto_138184 ) ( CLEAR ?auto_138185 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_138188 ?auto_138189 ?auto_138191 ?auto_138187 ?auto_138186 ?auto_138185 ?auto_138184 )
      ( MAKE-5PILE ?auto_138183 ?auto_138184 ?auto_138185 ?auto_138186 ?auto_138187 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_138192 - BLOCK
      ?auto_138193 - BLOCK
      ?auto_138194 - BLOCK
      ?auto_138195 - BLOCK
      ?auto_138196 - BLOCK
    )
    :vars
    (
      ?auto_138200 - BLOCK
      ?auto_138198 - BLOCK
      ?auto_138199 - BLOCK
      ?auto_138197 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_138192 ?auto_138193 ) ) ( not ( = ?auto_138192 ?auto_138194 ) ) ( not ( = ?auto_138192 ?auto_138195 ) ) ( not ( = ?auto_138192 ?auto_138196 ) ) ( not ( = ?auto_138193 ?auto_138194 ) ) ( not ( = ?auto_138193 ?auto_138195 ) ) ( not ( = ?auto_138193 ?auto_138196 ) ) ( not ( = ?auto_138194 ?auto_138195 ) ) ( not ( = ?auto_138194 ?auto_138196 ) ) ( not ( = ?auto_138195 ?auto_138196 ) ) ( ON ?auto_138196 ?auto_138200 ) ( not ( = ?auto_138192 ?auto_138200 ) ) ( not ( = ?auto_138193 ?auto_138200 ) ) ( not ( = ?auto_138194 ?auto_138200 ) ) ( not ( = ?auto_138195 ?auto_138200 ) ) ( not ( = ?auto_138196 ?auto_138200 ) ) ( ON ?auto_138195 ?auto_138196 ) ( ON-TABLE ?auto_138198 ) ( ON ?auto_138199 ?auto_138198 ) ( ON ?auto_138200 ?auto_138199 ) ( not ( = ?auto_138198 ?auto_138199 ) ) ( not ( = ?auto_138198 ?auto_138200 ) ) ( not ( = ?auto_138198 ?auto_138196 ) ) ( not ( = ?auto_138198 ?auto_138195 ) ) ( not ( = ?auto_138199 ?auto_138200 ) ) ( not ( = ?auto_138199 ?auto_138196 ) ) ( not ( = ?auto_138199 ?auto_138195 ) ) ( not ( = ?auto_138192 ?auto_138198 ) ) ( not ( = ?auto_138192 ?auto_138199 ) ) ( not ( = ?auto_138193 ?auto_138198 ) ) ( not ( = ?auto_138193 ?auto_138199 ) ) ( not ( = ?auto_138194 ?auto_138198 ) ) ( not ( = ?auto_138194 ?auto_138199 ) ) ( ON ?auto_138194 ?auto_138195 ) ( ON ?auto_138192 ?auto_138197 ) ( not ( = ?auto_138192 ?auto_138197 ) ) ( not ( = ?auto_138193 ?auto_138197 ) ) ( not ( = ?auto_138194 ?auto_138197 ) ) ( not ( = ?auto_138195 ?auto_138197 ) ) ( not ( = ?auto_138196 ?auto_138197 ) ) ( not ( = ?auto_138200 ?auto_138197 ) ) ( not ( = ?auto_138198 ?auto_138197 ) ) ( not ( = ?auto_138199 ?auto_138197 ) ) ( CLEAR ?auto_138194 ) ( ON ?auto_138193 ?auto_138192 ) ( CLEAR ?auto_138193 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_138197 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_138197 ?auto_138192 )
      ( MAKE-5PILE ?auto_138192 ?auto_138193 ?auto_138194 ?auto_138195 ?auto_138196 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_138201 - BLOCK
      ?auto_138202 - BLOCK
      ?auto_138203 - BLOCK
      ?auto_138204 - BLOCK
      ?auto_138205 - BLOCK
    )
    :vars
    (
      ?auto_138208 - BLOCK
      ?auto_138209 - BLOCK
      ?auto_138207 - BLOCK
      ?auto_138206 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_138201 ?auto_138202 ) ) ( not ( = ?auto_138201 ?auto_138203 ) ) ( not ( = ?auto_138201 ?auto_138204 ) ) ( not ( = ?auto_138201 ?auto_138205 ) ) ( not ( = ?auto_138202 ?auto_138203 ) ) ( not ( = ?auto_138202 ?auto_138204 ) ) ( not ( = ?auto_138202 ?auto_138205 ) ) ( not ( = ?auto_138203 ?auto_138204 ) ) ( not ( = ?auto_138203 ?auto_138205 ) ) ( not ( = ?auto_138204 ?auto_138205 ) ) ( ON ?auto_138205 ?auto_138208 ) ( not ( = ?auto_138201 ?auto_138208 ) ) ( not ( = ?auto_138202 ?auto_138208 ) ) ( not ( = ?auto_138203 ?auto_138208 ) ) ( not ( = ?auto_138204 ?auto_138208 ) ) ( not ( = ?auto_138205 ?auto_138208 ) ) ( ON ?auto_138204 ?auto_138205 ) ( ON-TABLE ?auto_138209 ) ( ON ?auto_138207 ?auto_138209 ) ( ON ?auto_138208 ?auto_138207 ) ( not ( = ?auto_138209 ?auto_138207 ) ) ( not ( = ?auto_138209 ?auto_138208 ) ) ( not ( = ?auto_138209 ?auto_138205 ) ) ( not ( = ?auto_138209 ?auto_138204 ) ) ( not ( = ?auto_138207 ?auto_138208 ) ) ( not ( = ?auto_138207 ?auto_138205 ) ) ( not ( = ?auto_138207 ?auto_138204 ) ) ( not ( = ?auto_138201 ?auto_138209 ) ) ( not ( = ?auto_138201 ?auto_138207 ) ) ( not ( = ?auto_138202 ?auto_138209 ) ) ( not ( = ?auto_138202 ?auto_138207 ) ) ( not ( = ?auto_138203 ?auto_138209 ) ) ( not ( = ?auto_138203 ?auto_138207 ) ) ( ON ?auto_138201 ?auto_138206 ) ( not ( = ?auto_138201 ?auto_138206 ) ) ( not ( = ?auto_138202 ?auto_138206 ) ) ( not ( = ?auto_138203 ?auto_138206 ) ) ( not ( = ?auto_138204 ?auto_138206 ) ) ( not ( = ?auto_138205 ?auto_138206 ) ) ( not ( = ?auto_138208 ?auto_138206 ) ) ( not ( = ?auto_138209 ?auto_138206 ) ) ( not ( = ?auto_138207 ?auto_138206 ) ) ( ON ?auto_138202 ?auto_138201 ) ( CLEAR ?auto_138202 ) ( ON-TABLE ?auto_138206 ) ( HOLDING ?auto_138203 ) ( CLEAR ?auto_138204 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_138209 ?auto_138207 ?auto_138208 ?auto_138205 ?auto_138204 ?auto_138203 )
      ( MAKE-5PILE ?auto_138201 ?auto_138202 ?auto_138203 ?auto_138204 ?auto_138205 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_138210 - BLOCK
      ?auto_138211 - BLOCK
      ?auto_138212 - BLOCK
      ?auto_138213 - BLOCK
      ?auto_138214 - BLOCK
    )
    :vars
    (
      ?auto_138218 - BLOCK
      ?auto_138215 - BLOCK
      ?auto_138217 - BLOCK
      ?auto_138216 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_138210 ?auto_138211 ) ) ( not ( = ?auto_138210 ?auto_138212 ) ) ( not ( = ?auto_138210 ?auto_138213 ) ) ( not ( = ?auto_138210 ?auto_138214 ) ) ( not ( = ?auto_138211 ?auto_138212 ) ) ( not ( = ?auto_138211 ?auto_138213 ) ) ( not ( = ?auto_138211 ?auto_138214 ) ) ( not ( = ?auto_138212 ?auto_138213 ) ) ( not ( = ?auto_138212 ?auto_138214 ) ) ( not ( = ?auto_138213 ?auto_138214 ) ) ( ON ?auto_138214 ?auto_138218 ) ( not ( = ?auto_138210 ?auto_138218 ) ) ( not ( = ?auto_138211 ?auto_138218 ) ) ( not ( = ?auto_138212 ?auto_138218 ) ) ( not ( = ?auto_138213 ?auto_138218 ) ) ( not ( = ?auto_138214 ?auto_138218 ) ) ( ON ?auto_138213 ?auto_138214 ) ( ON-TABLE ?auto_138215 ) ( ON ?auto_138217 ?auto_138215 ) ( ON ?auto_138218 ?auto_138217 ) ( not ( = ?auto_138215 ?auto_138217 ) ) ( not ( = ?auto_138215 ?auto_138218 ) ) ( not ( = ?auto_138215 ?auto_138214 ) ) ( not ( = ?auto_138215 ?auto_138213 ) ) ( not ( = ?auto_138217 ?auto_138218 ) ) ( not ( = ?auto_138217 ?auto_138214 ) ) ( not ( = ?auto_138217 ?auto_138213 ) ) ( not ( = ?auto_138210 ?auto_138215 ) ) ( not ( = ?auto_138210 ?auto_138217 ) ) ( not ( = ?auto_138211 ?auto_138215 ) ) ( not ( = ?auto_138211 ?auto_138217 ) ) ( not ( = ?auto_138212 ?auto_138215 ) ) ( not ( = ?auto_138212 ?auto_138217 ) ) ( ON ?auto_138210 ?auto_138216 ) ( not ( = ?auto_138210 ?auto_138216 ) ) ( not ( = ?auto_138211 ?auto_138216 ) ) ( not ( = ?auto_138212 ?auto_138216 ) ) ( not ( = ?auto_138213 ?auto_138216 ) ) ( not ( = ?auto_138214 ?auto_138216 ) ) ( not ( = ?auto_138218 ?auto_138216 ) ) ( not ( = ?auto_138215 ?auto_138216 ) ) ( not ( = ?auto_138217 ?auto_138216 ) ) ( ON ?auto_138211 ?auto_138210 ) ( ON-TABLE ?auto_138216 ) ( CLEAR ?auto_138213 ) ( ON ?auto_138212 ?auto_138211 ) ( CLEAR ?auto_138212 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_138216 ?auto_138210 ?auto_138211 )
      ( MAKE-5PILE ?auto_138210 ?auto_138211 ?auto_138212 ?auto_138213 ?auto_138214 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_138219 - BLOCK
      ?auto_138220 - BLOCK
      ?auto_138221 - BLOCK
      ?auto_138222 - BLOCK
      ?auto_138223 - BLOCK
    )
    :vars
    (
      ?auto_138224 - BLOCK
      ?auto_138226 - BLOCK
      ?auto_138225 - BLOCK
      ?auto_138227 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_138219 ?auto_138220 ) ) ( not ( = ?auto_138219 ?auto_138221 ) ) ( not ( = ?auto_138219 ?auto_138222 ) ) ( not ( = ?auto_138219 ?auto_138223 ) ) ( not ( = ?auto_138220 ?auto_138221 ) ) ( not ( = ?auto_138220 ?auto_138222 ) ) ( not ( = ?auto_138220 ?auto_138223 ) ) ( not ( = ?auto_138221 ?auto_138222 ) ) ( not ( = ?auto_138221 ?auto_138223 ) ) ( not ( = ?auto_138222 ?auto_138223 ) ) ( ON ?auto_138223 ?auto_138224 ) ( not ( = ?auto_138219 ?auto_138224 ) ) ( not ( = ?auto_138220 ?auto_138224 ) ) ( not ( = ?auto_138221 ?auto_138224 ) ) ( not ( = ?auto_138222 ?auto_138224 ) ) ( not ( = ?auto_138223 ?auto_138224 ) ) ( ON-TABLE ?auto_138226 ) ( ON ?auto_138225 ?auto_138226 ) ( ON ?auto_138224 ?auto_138225 ) ( not ( = ?auto_138226 ?auto_138225 ) ) ( not ( = ?auto_138226 ?auto_138224 ) ) ( not ( = ?auto_138226 ?auto_138223 ) ) ( not ( = ?auto_138226 ?auto_138222 ) ) ( not ( = ?auto_138225 ?auto_138224 ) ) ( not ( = ?auto_138225 ?auto_138223 ) ) ( not ( = ?auto_138225 ?auto_138222 ) ) ( not ( = ?auto_138219 ?auto_138226 ) ) ( not ( = ?auto_138219 ?auto_138225 ) ) ( not ( = ?auto_138220 ?auto_138226 ) ) ( not ( = ?auto_138220 ?auto_138225 ) ) ( not ( = ?auto_138221 ?auto_138226 ) ) ( not ( = ?auto_138221 ?auto_138225 ) ) ( ON ?auto_138219 ?auto_138227 ) ( not ( = ?auto_138219 ?auto_138227 ) ) ( not ( = ?auto_138220 ?auto_138227 ) ) ( not ( = ?auto_138221 ?auto_138227 ) ) ( not ( = ?auto_138222 ?auto_138227 ) ) ( not ( = ?auto_138223 ?auto_138227 ) ) ( not ( = ?auto_138224 ?auto_138227 ) ) ( not ( = ?auto_138226 ?auto_138227 ) ) ( not ( = ?auto_138225 ?auto_138227 ) ) ( ON ?auto_138220 ?auto_138219 ) ( ON-TABLE ?auto_138227 ) ( ON ?auto_138221 ?auto_138220 ) ( CLEAR ?auto_138221 ) ( HOLDING ?auto_138222 ) ( CLEAR ?auto_138223 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_138226 ?auto_138225 ?auto_138224 ?auto_138223 ?auto_138222 )
      ( MAKE-5PILE ?auto_138219 ?auto_138220 ?auto_138221 ?auto_138222 ?auto_138223 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_138228 - BLOCK
      ?auto_138229 - BLOCK
      ?auto_138230 - BLOCK
      ?auto_138231 - BLOCK
      ?auto_138232 - BLOCK
    )
    :vars
    (
      ?auto_138233 - BLOCK
      ?auto_138234 - BLOCK
      ?auto_138235 - BLOCK
      ?auto_138236 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_138228 ?auto_138229 ) ) ( not ( = ?auto_138228 ?auto_138230 ) ) ( not ( = ?auto_138228 ?auto_138231 ) ) ( not ( = ?auto_138228 ?auto_138232 ) ) ( not ( = ?auto_138229 ?auto_138230 ) ) ( not ( = ?auto_138229 ?auto_138231 ) ) ( not ( = ?auto_138229 ?auto_138232 ) ) ( not ( = ?auto_138230 ?auto_138231 ) ) ( not ( = ?auto_138230 ?auto_138232 ) ) ( not ( = ?auto_138231 ?auto_138232 ) ) ( ON ?auto_138232 ?auto_138233 ) ( not ( = ?auto_138228 ?auto_138233 ) ) ( not ( = ?auto_138229 ?auto_138233 ) ) ( not ( = ?auto_138230 ?auto_138233 ) ) ( not ( = ?auto_138231 ?auto_138233 ) ) ( not ( = ?auto_138232 ?auto_138233 ) ) ( ON-TABLE ?auto_138234 ) ( ON ?auto_138235 ?auto_138234 ) ( ON ?auto_138233 ?auto_138235 ) ( not ( = ?auto_138234 ?auto_138235 ) ) ( not ( = ?auto_138234 ?auto_138233 ) ) ( not ( = ?auto_138234 ?auto_138232 ) ) ( not ( = ?auto_138234 ?auto_138231 ) ) ( not ( = ?auto_138235 ?auto_138233 ) ) ( not ( = ?auto_138235 ?auto_138232 ) ) ( not ( = ?auto_138235 ?auto_138231 ) ) ( not ( = ?auto_138228 ?auto_138234 ) ) ( not ( = ?auto_138228 ?auto_138235 ) ) ( not ( = ?auto_138229 ?auto_138234 ) ) ( not ( = ?auto_138229 ?auto_138235 ) ) ( not ( = ?auto_138230 ?auto_138234 ) ) ( not ( = ?auto_138230 ?auto_138235 ) ) ( ON ?auto_138228 ?auto_138236 ) ( not ( = ?auto_138228 ?auto_138236 ) ) ( not ( = ?auto_138229 ?auto_138236 ) ) ( not ( = ?auto_138230 ?auto_138236 ) ) ( not ( = ?auto_138231 ?auto_138236 ) ) ( not ( = ?auto_138232 ?auto_138236 ) ) ( not ( = ?auto_138233 ?auto_138236 ) ) ( not ( = ?auto_138234 ?auto_138236 ) ) ( not ( = ?auto_138235 ?auto_138236 ) ) ( ON ?auto_138229 ?auto_138228 ) ( ON-TABLE ?auto_138236 ) ( ON ?auto_138230 ?auto_138229 ) ( CLEAR ?auto_138232 ) ( ON ?auto_138231 ?auto_138230 ) ( CLEAR ?auto_138231 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_138236 ?auto_138228 ?auto_138229 ?auto_138230 )
      ( MAKE-5PILE ?auto_138228 ?auto_138229 ?auto_138230 ?auto_138231 ?auto_138232 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_138237 - BLOCK
      ?auto_138238 - BLOCK
      ?auto_138239 - BLOCK
      ?auto_138240 - BLOCK
      ?auto_138241 - BLOCK
    )
    :vars
    (
      ?auto_138242 - BLOCK
      ?auto_138243 - BLOCK
      ?auto_138244 - BLOCK
      ?auto_138245 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_138237 ?auto_138238 ) ) ( not ( = ?auto_138237 ?auto_138239 ) ) ( not ( = ?auto_138237 ?auto_138240 ) ) ( not ( = ?auto_138237 ?auto_138241 ) ) ( not ( = ?auto_138238 ?auto_138239 ) ) ( not ( = ?auto_138238 ?auto_138240 ) ) ( not ( = ?auto_138238 ?auto_138241 ) ) ( not ( = ?auto_138239 ?auto_138240 ) ) ( not ( = ?auto_138239 ?auto_138241 ) ) ( not ( = ?auto_138240 ?auto_138241 ) ) ( not ( = ?auto_138237 ?auto_138242 ) ) ( not ( = ?auto_138238 ?auto_138242 ) ) ( not ( = ?auto_138239 ?auto_138242 ) ) ( not ( = ?auto_138240 ?auto_138242 ) ) ( not ( = ?auto_138241 ?auto_138242 ) ) ( ON-TABLE ?auto_138243 ) ( ON ?auto_138244 ?auto_138243 ) ( ON ?auto_138242 ?auto_138244 ) ( not ( = ?auto_138243 ?auto_138244 ) ) ( not ( = ?auto_138243 ?auto_138242 ) ) ( not ( = ?auto_138243 ?auto_138241 ) ) ( not ( = ?auto_138243 ?auto_138240 ) ) ( not ( = ?auto_138244 ?auto_138242 ) ) ( not ( = ?auto_138244 ?auto_138241 ) ) ( not ( = ?auto_138244 ?auto_138240 ) ) ( not ( = ?auto_138237 ?auto_138243 ) ) ( not ( = ?auto_138237 ?auto_138244 ) ) ( not ( = ?auto_138238 ?auto_138243 ) ) ( not ( = ?auto_138238 ?auto_138244 ) ) ( not ( = ?auto_138239 ?auto_138243 ) ) ( not ( = ?auto_138239 ?auto_138244 ) ) ( ON ?auto_138237 ?auto_138245 ) ( not ( = ?auto_138237 ?auto_138245 ) ) ( not ( = ?auto_138238 ?auto_138245 ) ) ( not ( = ?auto_138239 ?auto_138245 ) ) ( not ( = ?auto_138240 ?auto_138245 ) ) ( not ( = ?auto_138241 ?auto_138245 ) ) ( not ( = ?auto_138242 ?auto_138245 ) ) ( not ( = ?auto_138243 ?auto_138245 ) ) ( not ( = ?auto_138244 ?auto_138245 ) ) ( ON ?auto_138238 ?auto_138237 ) ( ON-TABLE ?auto_138245 ) ( ON ?auto_138239 ?auto_138238 ) ( ON ?auto_138240 ?auto_138239 ) ( CLEAR ?auto_138240 ) ( HOLDING ?auto_138241 ) ( CLEAR ?auto_138242 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_138243 ?auto_138244 ?auto_138242 ?auto_138241 )
      ( MAKE-5PILE ?auto_138237 ?auto_138238 ?auto_138239 ?auto_138240 ?auto_138241 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_138246 - BLOCK
      ?auto_138247 - BLOCK
      ?auto_138248 - BLOCK
      ?auto_138249 - BLOCK
      ?auto_138250 - BLOCK
    )
    :vars
    (
      ?auto_138254 - BLOCK
      ?auto_138252 - BLOCK
      ?auto_138253 - BLOCK
      ?auto_138251 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_138246 ?auto_138247 ) ) ( not ( = ?auto_138246 ?auto_138248 ) ) ( not ( = ?auto_138246 ?auto_138249 ) ) ( not ( = ?auto_138246 ?auto_138250 ) ) ( not ( = ?auto_138247 ?auto_138248 ) ) ( not ( = ?auto_138247 ?auto_138249 ) ) ( not ( = ?auto_138247 ?auto_138250 ) ) ( not ( = ?auto_138248 ?auto_138249 ) ) ( not ( = ?auto_138248 ?auto_138250 ) ) ( not ( = ?auto_138249 ?auto_138250 ) ) ( not ( = ?auto_138246 ?auto_138254 ) ) ( not ( = ?auto_138247 ?auto_138254 ) ) ( not ( = ?auto_138248 ?auto_138254 ) ) ( not ( = ?auto_138249 ?auto_138254 ) ) ( not ( = ?auto_138250 ?auto_138254 ) ) ( ON-TABLE ?auto_138252 ) ( ON ?auto_138253 ?auto_138252 ) ( ON ?auto_138254 ?auto_138253 ) ( not ( = ?auto_138252 ?auto_138253 ) ) ( not ( = ?auto_138252 ?auto_138254 ) ) ( not ( = ?auto_138252 ?auto_138250 ) ) ( not ( = ?auto_138252 ?auto_138249 ) ) ( not ( = ?auto_138253 ?auto_138254 ) ) ( not ( = ?auto_138253 ?auto_138250 ) ) ( not ( = ?auto_138253 ?auto_138249 ) ) ( not ( = ?auto_138246 ?auto_138252 ) ) ( not ( = ?auto_138246 ?auto_138253 ) ) ( not ( = ?auto_138247 ?auto_138252 ) ) ( not ( = ?auto_138247 ?auto_138253 ) ) ( not ( = ?auto_138248 ?auto_138252 ) ) ( not ( = ?auto_138248 ?auto_138253 ) ) ( ON ?auto_138246 ?auto_138251 ) ( not ( = ?auto_138246 ?auto_138251 ) ) ( not ( = ?auto_138247 ?auto_138251 ) ) ( not ( = ?auto_138248 ?auto_138251 ) ) ( not ( = ?auto_138249 ?auto_138251 ) ) ( not ( = ?auto_138250 ?auto_138251 ) ) ( not ( = ?auto_138254 ?auto_138251 ) ) ( not ( = ?auto_138252 ?auto_138251 ) ) ( not ( = ?auto_138253 ?auto_138251 ) ) ( ON ?auto_138247 ?auto_138246 ) ( ON-TABLE ?auto_138251 ) ( ON ?auto_138248 ?auto_138247 ) ( ON ?auto_138249 ?auto_138248 ) ( CLEAR ?auto_138254 ) ( ON ?auto_138250 ?auto_138249 ) ( CLEAR ?auto_138250 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_138251 ?auto_138246 ?auto_138247 ?auto_138248 ?auto_138249 )
      ( MAKE-5PILE ?auto_138246 ?auto_138247 ?auto_138248 ?auto_138249 ?auto_138250 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_138255 - BLOCK
      ?auto_138256 - BLOCK
      ?auto_138257 - BLOCK
      ?auto_138258 - BLOCK
      ?auto_138259 - BLOCK
    )
    :vars
    (
      ?auto_138261 - BLOCK
      ?auto_138263 - BLOCK
      ?auto_138262 - BLOCK
      ?auto_138260 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_138255 ?auto_138256 ) ) ( not ( = ?auto_138255 ?auto_138257 ) ) ( not ( = ?auto_138255 ?auto_138258 ) ) ( not ( = ?auto_138255 ?auto_138259 ) ) ( not ( = ?auto_138256 ?auto_138257 ) ) ( not ( = ?auto_138256 ?auto_138258 ) ) ( not ( = ?auto_138256 ?auto_138259 ) ) ( not ( = ?auto_138257 ?auto_138258 ) ) ( not ( = ?auto_138257 ?auto_138259 ) ) ( not ( = ?auto_138258 ?auto_138259 ) ) ( not ( = ?auto_138255 ?auto_138261 ) ) ( not ( = ?auto_138256 ?auto_138261 ) ) ( not ( = ?auto_138257 ?auto_138261 ) ) ( not ( = ?auto_138258 ?auto_138261 ) ) ( not ( = ?auto_138259 ?auto_138261 ) ) ( ON-TABLE ?auto_138263 ) ( ON ?auto_138262 ?auto_138263 ) ( not ( = ?auto_138263 ?auto_138262 ) ) ( not ( = ?auto_138263 ?auto_138261 ) ) ( not ( = ?auto_138263 ?auto_138259 ) ) ( not ( = ?auto_138263 ?auto_138258 ) ) ( not ( = ?auto_138262 ?auto_138261 ) ) ( not ( = ?auto_138262 ?auto_138259 ) ) ( not ( = ?auto_138262 ?auto_138258 ) ) ( not ( = ?auto_138255 ?auto_138263 ) ) ( not ( = ?auto_138255 ?auto_138262 ) ) ( not ( = ?auto_138256 ?auto_138263 ) ) ( not ( = ?auto_138256 ?auto_138262 ) ) ( not ( = ?auto_138257 ?auto_138263 ) ) ( not ( = ?auto_138257 ?auto_138262 ) ) ( ON ?auto_138255 ?auto_138260 ) ( not ( = ?auto_138255 ?auto_138260 ) ) ( not ( = ?auto_138256 ?auto_138260 ) ) ( not ( = ?auto_138257 ?auto_138260 ) ) ( not ( = ?auto_138258 ?auto_138260 ) ) ( not ( = ?auto_138259 ?auto_138260 ) ) ( not ( = ?auto_138261 ?auto_138260 ) ) ( not ( = ?auto_138263 ?auto_138260 ) ) ( not ( = ?auto_138262 ?auto_138260 ) ) ( ON ?auto_138256 ?auto_138255 ) ( ON-TABLE ?auto_138260 ) ( ON ?auto_138257 ?auto_138256 ) ( ON ?auto_138258 ?auto_138257 ) ( ON ?auto_138259 ?auto_138258 ) ( CLEAR ?auto_138259 ) ( HOLDING ?auto_138261 ) ( CLEAR ?auto_138262 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_138263 ?auto_138262 ?auto_138261 )
      ( MAKE-5PILE ?auto_138255 ?auto_138256 ?auto_138257 ?auto_138258 ?auto_138259 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_138264 - BLOCK
      ?auto_138265 - BLOCK
      ?auto_138266 - BLOCK
      ?auto_138267 - BLOCK
      ?auto_138268 - BLOCK
    )
    :vars
    (
      ?auto_138272 - BLOCK
      ?auto_138271 - BLOCK
      ?auto_138269 - BLOCK
      ?auto_138270 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_138264 ?auto_138265 ) ) ( not ( = ?auto_138264 ?auto_138266 ) ) ( not ( = ?auto_138264 ?auto_138267 ) ) ( not ( = ?auto_138264 ?auto_138268 ) ) ( not ( = ?auto_138265 ?auto_138266 ) ) ( not ( = ?auto_138265 ?auto_138267 ) ) ( not ( = ?auto_138265 ?auto_138268 ) ) ( not ( = ?auto_138266 ?auto_138267 ) ) ( not ( = ?auto_138266 ?auto_138268 ) ) ( not ( = ?auto_138267 ?auto_138268 ) ) ( not ( = ?auto_138264 ?auto_138272 ) ) ( not ( = ?auto_138265 ?auto_138272 ) ) ( not ( = ?auto_138266 ?auto_138272 ) ) ( not ( = ?auto_138267 ?auto_138272 ) ) ( not ( = ?auto_138268 ?auto_138272 ) ) ( ON-TABLE ?auto_138271 ) ( ON ?auto_138269 ?auto_138271 ) ( not ( = ?auto_138271 ?auto_138269 ) ) ( not ( = ?auto_138271 ?auto_138272 ) ) ( not ( = ?auto_138271 ?auto_138268 ) ) ( not ( = ?auto_138271 ?auto_138267 ) ) ( not ( = ?auto_138269 ?auto_138272 ) ) ( not ( = ?auto_138269 ?auto_138268 ) ) ( not ( = ?auto_138269 ?auto_138267 ) ) ( not ( = ?auto_138264 ?auto_138271 ) ) ( not ( = ?auto_138264 ?auto_138269 ) ) ( not ( = ?auto_138265 ?auto_138271 ) ) ( not ( = ?auto_138265 ?auto_138269 ) ) ( not ( = ?auto_138266 ?auto_138271 ) ) ( not ( = ?auto_138266 ?auto_138269 ) ) ( ON ?auto_138264 ?auto_138270 ) ( not ( = ?auto_138264 ?auto_138270 ) ) ( not ( = ?auto_138265 ?auto_138270 ) ) ( not ( = ?auto_138266 ?auto_138270 ) ) ( not ( = ?auto_138267 ?auto_138270 ) ) ( not ( = ?auto_138268 ?auto_138270 ) ) ( not ( = ?auto_138272 ?auto_138270 ) ) ( not ( = ?auto_138271 ?auto_138270 ) ) ( not ( = ?auto_138269 ?auto_138270 ) ) ( ON ?auto_138265 ?auto_138264 ) ( ON-TABLE ?auto_138270 ) ( ON ?auto_138266 ?auto_138265 ) ( ON ?auto_138267 ?auto_138266 ) ( ON ?auto_138268 ?auto_138267 ) ( CLEAR ?auto_138269 ) ( ON ?auto_138272 ?auto_138268 ) ( CLEAR ?auto_138272 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_138270 ?auto_138264 ?auto_138265 ?auto_138266 ?auto_138267 ?auto_138268 )
      ( MAKE-5PILE ?auto_138264 ?auto_138265 ?auto_138266 ?auto_138267 ?auto_138268 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_138273 - BLOCK
      ?auto_138274 - BLOCK
      ?auto_138275 - BLOCK
      ?auto_138276 - BLOCK
      ?auto_138277 - BLOCK
    )
    :vars
    (
      ?auto_138281 - BLOCK
      ?auto_138278 - BLOCK
      ?auto_138280 - BLOCK
      ?auto_138279 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_138273 ?auto_138274 ) ) ( not ( = ?auto_138273 ?auto_138275 ) ) ( not ( = ?auto_138273 ?auto_138276 ) ) ( not ( = ?auto_138273 ?auto_138277 ) ) ( not ( = ?auto_138274 ?auto_138275 ) ) ( not ( = ?auto_138274 ?auto_138276 ) ) ( not ( = ?auto_138274 ?auto_138277 ) ) ( not ( = ?auto_138275 ?auto_138276 ) ) ( not ( = ?auto_138275 ?auto_138277 ) ) ( not ( = ?auto_138276 ?auto_138277 ) ) ( not ( = ?auto_138273 ?auto_138281 ) ) ( not ( = ?auto_138274 ?auto_138281 ) ) ( not ( = ?auto_138275 ?auto_138281 ) ) ( not ( = ?auto_138276 ?auto_138281 ) ) ( not ( = ?auto_138277 ?auto_138281 ) ) ( ON-TABLE ?auto_138278 ) ( not ( = ?auto_138278 ?auto_138280 ) ) ( not ( = ?auto_138278 ?auto_138281 ) ) ( not ( = ?auto_138278 ?auto_138277 ) ) ( not ( = ?auto_138278 ?auto_138276 ) ) ( not ( = ?auto_138280 ?auto_138281 ) ) ( not ( = ?auto_138280 ?auto_138277 ) ) ( not ( = ?auto_138280 ?auto_138276 ) ) ( not ( = ?auto_138273 ?auto_138278 ) ) ( not ( = ?auto_138273 ?auto_138280 ) ) ( not ( = ?auto_138274 ?auto_138278 ) ) ( not ( = ?auto_138274 ?auto_138280 ) ) ( not ( = ?auto_138275 ?auto_138278 ) ) ( not ( = ?auto_138275 ?auto_138280 ) ) ( ON ?auto_138273 ?auto_138279 ) ( not ( = ?auto_138273 ?auto_138279 ) ) ( not ( = ?auto_138274 ?auto_138279 ) ) ( not ( = ?auto_138275 ?auto_138279 ) ) ( not ( = ?auto_138276 ?auto_138279 ) ) ( not ( = ?auto_138277 ?auto_138279 ) ) ( not ( = ?auto_138281 ?auto_138279 ) ) ( not ( = ?auto_138278 ?auto_138279 ) ) ( not ( = ?auto_138280 ?auto_138279 ) ) ( ON ?auto_138274 ?auto_138273 ) ( ON-TABLE ?auto_138279 ) ( ON ?auto_138275 ?auto_138274 ) ( ON ?auto_138276 ?auto_138275 ) ( ON ?auto_138277 ?auto_138276 ) ( ON ?auto_138281 ?auto_138277 ) ( CLEAR ?auto_138281 ) ( HOLDING ?auto_138280 ) ( CLEAR ?auto_138278 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_138278 ?auto_138280 )
      ( MAKE-5PILE ?auto_138273 ?auto_138274 ?auto_138275 ?auto_138276 ?auto_138277 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_138282 - BLOCK
      ?auto_138283 - BLOCK
      ?auto_138284 - BLOCK
      ?auto_138285 - BLOCK
      ?auto_138286 - BLOCK
    )
    :vars
    (
      ?auto_138288 - BLOCK
      ?auto_138289 - BLOCK
      ?auto_138287 - BLOCK
      ?auto_138290 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_138282 ?auto_138283 ) ) ( not ( = ?auto_138282 ?auto_138284 ) ) ( not ( = ?auto_138282 ?auto_138285 ) ) ( not ( = ?auto_138282 ?auto_138286 ) ) ( not ( = ?auto_138283 ?auto_138284 ) ) ( not ( = ?auto_138283 ?auto_138285 ) ) ( not ( = ?auto_138283 ?auto_138286 ) ) ( not ( = ?auto_138284 ?auto_138285 ) ) ( not ( = ?auto_138284 ?auto_138286 ) ) ( not ( = ?auto_138285 ?auto_138286 ) ) ( not ( = ?auto_138282 ?auto_138288 ) ) ( not ( = ?auto_138283 ?auto_138288 ) ) ( not ( = ?auto_138284 ?auto_138288 ) ) ( not ( = ?auto_138285 ?auto_138288 ) ) ( not ( = ?auto_138286 ?auto_138288 ) ) ( ON-TABLE ?auto_138289 ) ( not ( = ?auto_138289 ?auto_138287 ) ) ( not ( = ?auto_138289 ?auto_138288 ) ) ( not ( = ?auto_138289 ?auto_138286 ) ) ( not ( = ?auto_138289 ?auto_138285 ) ) ( not ( = ?auto_138287 ?auto_138288 ) ) ( not ( = ?auto_138287 ?auto_138286 ) ) ( not ( = ?auto_138287 ?auto_138285 ) ) ( not ( = ?auto_138282 ?auto_138289 ) ) ( not ( = ?auto_138282 ?auto_138287 ) ) ( not ( = ?auto_138283 ?auto_138289 ) ) ( not ( = ?auto_138283 ?auto_138287 ) ) ( not ( = ?auto_138284 ?auto_138289 ) ) ( not ( = ?auto_138284 ?auto_138287 ) ) ( ON ?auto_138282 ?auto_138290 ) ( not ( = ?auto_138282 ?auto_138290 ) ) ( not ( = ?auto_138283 ?auto_138290 ) ) ( not ( = ?auto_138284 ?auto_138290 ) ) ( not ( = ?auto_138285 ?auto_138290 ) ) ( not ( = ?auto_138286 ?auto_138290 ) ) ( not ( = ?auto_138288 ?auto_138290 ) ) ( not ( = ?auto_138289 ?auto_138290 ) ) ( not ( = ?auto_138287 ?auto_138290 ) ) ( ON ?auto_138283 ?auto_138282 ) ( ON-TABLE ?auto_138290 ) ( ON ?auto_138284 ?auto_138283 ) ( ON ?auto_138285 ?auto_138284 ) ( ON ?auto_138286 ?auto_138285 ) ( ON ?auto_138288 ?auto_138286 ) ( CLEAR ?auto_138289 ) ( ON ?auto_138287 ?auto_138288 ) ( CLEAR ?auto_138287 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_138290 ?auto_138282 ?auto_138283 ?auto_138284 ?auto_138285 ?auto_138286 ?auto_138288 )
      ( MAKE-5PILE ?auto_138282 ?auto_138283 ?auto_138284 ?auto_138285 ?auto_138286 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_138291 - BLOCK
      ?auto_138292 - BLOCK
      ?auto_138293 - BLOCK
      ?auto_138294 - BLOCK
      ?auto_138295 - BLOCK
    )
    :vars
    (
      ?auto_138297 - BLOCK
      ?auto_138296 - BLOCK
      ?auto_138299 - BLOCK
      ?auto_138298 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_138291 ?auto_138292 ) ) ( not ( = ?auto_138291 ?auto_138293 ) ) ( not ( = ?auto_138291 ?auto_138294 ) ) ( not ( = ?auto_138291 ?auto_138295 ) ) ( not ( = ?auto_138292 ?auto_138293 ) ) ( not ( = ?auto_138292 ?auto_138294 ) ) ( not ( = ?auto_138292 ?auto_138295 ) ) ( not ( = ?auto_138293 ?auto_138294 ) ) ( not ( = ?auto_138293 ?auto_138295 ) ) ( not ( = ?auto_138294 ?auto_138295 ) ) ( not ( = ?auto_138291 ?auto_138297 ) ) ( not ( = ?auto_138292 ?auto_138297 ) ) ( not ( = ?auto_138293 ?auto_138297 ) ) ( not ( = ?auto_138294 ?auto_138297 ) ) ( not ( = ?auto_138295 ?auto_138297 ) ) ( not ( = ?auto_138296 ?auto_138299 ) ) ( not ( = ?auto_138296 ?auto_138297 ) ) ( not ( = ?auto_138296 ?auto_138295 ) ) ( not ( = ?auto_138296 ?auto_138294 ) ) ( not ( = ?auto_138299 ?auto_138297 ) ) ( not ( = ?auto_138299 ?auto_138295 ) ) ( not ( = ?auto_138299 ?auto_138294 ) ) ( not ( = ?auto_138291 ?auto_138296 ) ) ( not ( = ?auto_138291 ?auto_138299 ) ) ( not ( = ?auto_138292 ?auto_138296 ) ) ( not ( = ?auto_138292 ?auto_138299 ) ) ( not ( = ?auto_138293 ?auto_138296 ) ) ( not ( = ?auto_138293 ?auto_138299 ) ) ( ON ?auto_138291 ?auto_138298 ) ( not ( = ?auto_138291 ?auto_138298 ) ) ( not ( = ?auto_138292 ?auto_138298 ) ) ( not ( = ?auto_138293 ?auto_138298 ) ) ( not ( = ?auto_138294 ?auto_138298 ) ) ( not ( = ?auto_138295 ?auto_138298 ) ) ( not ( = ?auto_138297 ?auto_138298 ) ) ( not ( = ?auto_138296 ?auto_138298 ) ) ( not ( = ?auto_138299 ?auto_138298 ) ) ( ON ?auto_138292 ?auto_138291 ) ( ON-TABLE ?auto_138298 ) ( ON ?auto_138293 ?auto_138292 ) ( ON ?auto_138294 ?auto_138293 ) ( ON ?auto_138295 ?auto_138294 ) ( ON ?auto_138297 ?auto_138295 ) ( ON ?auto_138299 ?auto_138297 ) ( CLEAR ?auto_138299 ) ( HOLDING ?auto_138296 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_138296 )
      ( MAKE-5PILE ?auto_138291 ?auto_138292 ?auto_138293 ?auto_138294 ?auto_138295 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_138300 - BLOCK
      ?auto_138301 - BLOCK
      ?auto_138302 - BLOCK
      ?auto_138303 - BLOCK
      ?auto_138304 - BLOCK
    )
    :vars
    (
      ?auto_138306 - BLOCK
      ?auto_138305 - BLOCK
      ?auto_138308 - BLOCK
      ?auto_138307 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_138300 ?auto_138301 ) ) ( not ( = ?auto_138300 ?auto_138302 ) ) ( not ( = ?auto_138300 ?auto_138303 ) ) ( not ( = ?auto_138300 ?auto_138304 ) ) ( not ( = ?auto_138301 ?auto_138302 ) ) ( not ( = ?auto_138301 ?auto_138303 ) ) ( not ( = ?auto_138301 ?auto_138304 ) ) ( not ( = ?auto_138302 ?auto_138303 ) ) ( not ( = ?auto_138302 ?auto_138304 ) ) ( not ( = ?auto_138303 ?auto_138304 ) ) ( not ( = ?auto_138300 ?auto_138306 ) ) ( not ( = ?auto_138301 ?auto_138306 ) ) ( not ( = ?auto_138302 ?auto_138306 ) ) ( not ( = ?auto_138303 ?auto_138306 ) ) ( not ( = ?auto_138304 ?auto_138306 ) ) ( not ( = ?auto_138305 ?auto_138308 ) ) ( not ( = ?auto_138305 ?auto_138306 ) ) ( not ( = ?auto_138305 ?auto_138304 ) ) ( not ( = ?auto_138305 ?auto_138303 ) ) ( not ( = ?auto_138308 ?auto_138306 ) ) ( not ( = ?auto_138308 ?auto_138304 ) ) ( not ( = ?auto_138308 ?auto_138303 ) ) ( not ( = ?auto_138300 ?auto_138305 ) ) ( not ( = ?auto_138300 ?auto_138308 ) ) ( not ( = ?auto_138301 ?auto_138305 ) ) ( not ( = ?auto_138301 ?auto_138308 ) ) ( not ( = ?auto_138302 ?auto_138305 ) ) ( not ( = ?auto_138302 ?auto_138308 ) ) ( ON ?auto_138300 ?auto_138307 ) ( not ( = ?auto_138300 ?auto_138307 ) ) ( not ( = ?auto_138301 ?auto_138307 ) ) ( not ( = ?auto_138302 ?auto_138307 ) ) ( not ( = ?auto_138303 ?auto_138307 ) ) ( not ( = ?auto_138304 ?auto_138307 ) ) ( not ( = ?auto_138306 ?auto_138307 ) ) ( not ( = ?auto_138305 ?auto_138307 ) ) ( not ( = ?auto_138308 ?auto_138307 ) ) ( ON ?auto_138301 ?auto_138300 ) ( ON-TABLE ?auto_138307 ) ( ON ?auto_138302 ?auto_138301 ) ( ON ?auto_138303 ?auto_138302 ) ( ON ?auto_138304 ?auto_138303 ) ( ON ?auto_138306 ?auto_138304 ) ( ON ?auto_138308 ?auto_138306 ) ( ON ?auto_138305 ?auto_138308 ) ( CLEAR ?auto_138305 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_138307 ?auto_138300 ?auto_138301 ?auto_138302 ?auto_138303 ?auto_138304 ?auto_138306 ?auto_138308 )
      ( MAKE-5PILE ?auto_138300 ?auto_138301 ?auto_138302 ?auto_138303 ?auto_138304 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_138324 - BLOCK
      ?auto_138325 - BLOCK
    )
    :vars
    (
      ?auto_138328 - BLOCK
      ?auto_138326 - BLOCK
      ?auto_138327 - BLOCK
      ?auto_138331 - BLOCK
      ?auto_138330 - BLOCK
      ?auto_138329 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_138328 ?auto_138325 ) ( ON-TABLE ?auto_138324 ) ( ON ?auto_138325 ?auto_138324 ) ( not ( = ?auto_138324 ?auto_138325 ) ) ( not ( = ?auto_138324 ?auto_138328 ) ) ( not ( = ?auto_138325 ?auto_138328 ) ) ( not ( = ?auto_138324 ?auto_138326 ) ) ( not ( = ?auto_138324 ?auto_138327 ) ) ( not ( = ?auto_138325 ?auto_138326 ) ) ( not ( = ?auto_138325 ?auto_138327 ) ) ( not ( = ?auto_138328 ?auto_138326 ) ) ( not ( = ?auto_138328 ?auto_138327 ) ) ( not ( = ?auto_138326 ?auto_138327 ) ) ( ON ?auto_138326 ?auto_138328 ) ( CLEAR ?auto_138326 ) ( HOLDING ?auto_138327 ) ( CLEAR ?auto_138331 ) ( ON-TABLE ?auto_138330 ) ( ON ?auto_138329 ?auto_138330 ) ( ON ?auto_138331 ?auto_138329 ) ( not ( = ?auto_138330 ?auto_138329 ) ) ( not ( = ?auto_138330 ?auto_138331 ) ) ( not ( = ?auto_138330 ?auto_138327 ) ) ( not ( = ?auto_138329 ?auto_138331 ) ) ( not ( = ?auto_138329 ?auto_138327 ) ) ( not ( = ?auto_138331 ?auto_138327 ) ) ( not ( = ?auto_138324 ?auto_138331 ) ) ( not ( = ?auto_138324 ?auto_138330 ) ) ( not ( = ?auto_138324 ?auto_138329 ) ) ( not ( = ?auto_138325 ?auto_138331 ) ) ( not ( = ?auto_138325 ?auto_138330 ) ) ( not ( = ?auto_138325 ?auto_138329 ) ) ( not ( = ?auto_138328 ?auto_138331 ) ) ( not ( = ?auto_138328 ?auto_138330 ) ) ( not ( = ?auto_138328 ?auto_138329 ) ) ( not ( = ?auto_138326 ?auto_138331 ) ) ( not ( = ?auto_138326 ?auto_138330 ) ) ( not ( = ?auto_138326 ?auto_138329 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_138330 ?auto_138329 ?auto_138331 ?auto_138327 )
      ( MAKE-2PILE ?auto_138324 ?auto_138325 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_138332 - BLOCK
      ?auto_138333 - BLOCK
    )
    :vars
    (
      ?auto_138338 - BLOCK
      ?auto_138336 - BLOCK
      ?auto_138335 - BLOCK
      ?auto_138337 - BLOCK
      ?auto_138334 - BLOCK
      ?auto_138339 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_138338 ?auto_138333 ) ( ON-TABLE ?auto_138332 ) ( ON ?auto_138333 ?auto_138332 ) ( not ( = ?auto_138332 ?auto_138333 ) ) ( not ( = ?auto_138332 ?auto_138338 ) ) ( not ( = ?auto_138333 ?auto_138338 ) ) ( not ( = ?auto_138332 ?auto_138336 ) ) ( not ( = ?auto_138332 ?auto_138335 ) ) ( not ( = ?auto_138333 ?auto_138336 ) ) ( not ( = ?auto_138333 ?auto_138335 ) ) ( not ( = ?auto_138338 ?auto_138336 ) ) ( not ( = ?auto_138338 ?auto_138335 ) ) ( not ( = ?auto_138336 ?auto_138335 ) ) ( ON ?auto_138336 ?auto_138338 ) ( CLEAR ?auto_138337 ) ( ON-TABLE ?auto_138334 ) ( ON ?auto_138339 ?auto_138334 ) ( ON ?auto_138337 ?auto_138339 ) ( not ( = ?auto_138334 ?auto_138339 ) ) ( not ( = ?auto_138334 ?auto_138337 ) ) ( not ( = ?auto_138334 ?auto_138335 ) ) ( not ( = ?auto_138339 ?auto_138337 ) ) ( not ( = ?auto_138339 ?auto_138335 ) ) ( not ( = ?auto_138337 ?auto_138335 ) ) ( not ( = ?auto_138332 ?auto_138337 ) ) ( not ( = ?auto_138332 ?auto_138334 ) ) ( not ( = ?auto_138332 ?auto_138339 ) ) ( not ( = ?auto_138333 ?auto_138337 ) ) ( not ( = ?auto_138333 ?auto_138334 ) ) ( not ( = ?auto_138333 ?auto_138339 ) ) ( not ( = ?auto_138338 ?auto_138337 ) ) ( not ( = ?auto_138338 ?auto_138334 ) ) ( not ( = ?auto_138338 ?auto_138339 ) ) ( not ( = ?auto_138336 ?auto_138337 ) ) ( not ( = ?auto_138336 ?auto_138334 ) ) ( not ( = ?auto_138336 ?auto_138339 ) ) ( ON ?auto_138335 ?auto_138336 ) ( CLEAR ?auto_138335 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_138332 ?auto_138333 ?auto_138338 ?auto_138336 )
      ( MAKE-2PILE ?auto_138332 ?auto_138333 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_138340 - BLOCK
      ?auto_138341 - BLOCK
    )
    :vars
    (
      ?auto_138346 - BLOCK
      ?auto_138347 - BLOCK
      ?auto_138343 - BLOCK
      ?auto_138345 - BLOCK
      ?auto_138342 - BLOCK
      ?auto_138344 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_138346 ?auto_138341 ) ( ON-TABLE ?auto_138340 ) ( ON ?auto_138341 ?auto_138340 ) ( not ( = ?auto_138340 ?auto_138341 ) ) ( not ( = ?auto_138340 ?auto_138346 ) ) ( not ( = ?auto_138341 ?auto_138346 ) ) ( not ( = ?auto_138340 ?auto_138347 ) ) ( not ( = ?auto_138340 ?auto_138343 ) ) ( not ( = ?auto_138341 ?auto_138347 ) ) ( not ( = ?auto_138341 ?auto_138343 ) ) ( not ( = ?auto_138346 ?auto_138347 ) ) ( not ( = ?auto_138346 ?auto_138343 ) ) ( not ( = ?auto_138347 ?auto_138343 ) ) ( ON ?auto_138347 ?auto_138346 ) ( ON-TABLE ?auto_138345 ) ( ON ?auto_138342 ?auto_138345 ) ( not ( = ?auto_138345 ?auto_138342 ) ) ( not ( = ?auto_138345 ?auto_138344 ) ) ( not ( = ?auto_138345 ?auto_138343 ) ) ( not ( = ?auto_138342 ?auto_138344 ) ) ( not ( = ?auto_138342 ?auto_138343 ) ) ( not ( = ?auto_138344 ?auto_138343 ) ) ( not ( = ?auto_138340 ?auto_138344 ) ) ( not ( = ?auto_138340 ?auto_138345 ) ) ( not ( = ?auto_138340 ?auto_138342 ) ) ( not ( = ?auto_138341 ?auto_138344 ) ) ( not ( = ?auto_138341 ?auto_138345 ) ) ( not ( = ?auto_138341 ?auto_138342 ) ) ( not ( = ?auto_138346 ?auto_138344 ) ) ( not ( = ?auto_138346 ?auto_138345 ) ) ( not ( = ?auto_138346 ?auto_138342 ) ) ( not ( = ?auto_138347 ?auto_138344 ) ) ( not ( = ?auto_138347 ?auto_138345 ) ) ( not ( = ?auto_138347 ?auto_138342 ) ) ( ON ?auto_138343 ?auto_138347 ) ( CLEAR ?auto_138343 ) ( HOLDING ?auto_138344 ) ( CLEAR ?auto_138342 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_138345 ?auto_138342 ?auto_138344 )
      ( MAKE-2PILE ?auto_138340 ?auto_138341 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_138348 - BLOCK
      ?auto_138349 - BLOCK
    )
    :vars
    (
      ?auto_138353 - BLOCK
      ?auto_138352 - BLOCK
      ?auto_138354 - BLOCK
      ?auto_138351 - BLOCK
      ?auto_138355 - BLOCK
      ?auto_138350 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_138353 ?auto_138349 ) ( ON-TABLE ?auto_138348 ) ( ON ?auto_138349 ?auto_138348 ) ( not ( = ?auto_138348 ?auto_138349 ) ) ( not ( = ?auto_138348 ?auto_138353 ) ) ( not ( = ?auto_138349 ?auto_138353 ) ) ( not ( = ?auto_138348 ?auto_138352 ) ) ( not ( = ?auto_138348 ?auto_138354 ) ) ( not ( = ?auto_138349 ?auto_138352 ) ) ( not ( = ?auto_138349 ?auto_138354 ) ) ( not ( = ?auto_138353 ?auto_138352 ) ) ( not ( = ?auto_138353 ?auto_138354 ) ) ( not ( = ?auto_138352 ?auto_138354 ) ) ( ON ?auto_138352 ?auto_138353 ) ( ON-TABLE ?auto_138351 ) ( ON ?auto_138355 ?auto_138351 ) ( not ( = ?auto_138351 ?auto_138355 ) ) ( not ( = ?auto_138351 ?auto_138350 ) ) ( not ( = ?auto_138351 ?auto_138354 ) ) ( not ( = ?auto_138355 ?auto_138350 ) ) ( not ( = ?auto_138355 ?auto_138354 ) ) ( not ( = ?auto_138350 ?auto_138354 ) ) ( not ( = ?auto_138348 ?auto_138350 ) ) ( not ( = ?auto_138348 ?auto_138351 ) ) ( not ( = ?auto_138348 ?auto_138355 ) ) ( not ( = ?auto_138349 ?auto_138350 ) ) ( not ( = ?auto_138349 ?auto_138351 ) ) ( not ( = ?auto_138349 ?auto_138355 ) ) ( not ( = ?auto_138353 ?auto_138350 ) ) ( not ( = ?auto_138353 ?auto_138351 ) ) ( not ( = ?auto_138353 ?auto_138355 ) ) ( not ( = ?auto_138352 ?auto_138350 ) ) ( not ( = ?auto_138352 ?auto_138351 ) ) ( not ( = ?auto_138352 ?auto_138355 ) ) ( ON ?auto_138354 ?auto_138352 ) ( CLEAR ?auto_138355 ) ( ON ?auto_138350 ?auto_138354 ) ( CLEAR ?auto_138350 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_138348 ?auto_138349 ?auto_138353 ?auto_138352 ?auto_138354 )
      ( MAKE-2PILE ?auto_138348 ?auto_138349 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_138356 - BLOCK
      ?auto_138357 - BLOCK
    )
    :vars
    (
      ?auto_138360 - BLOCK
      ?auto_138359 - BLOCK
      ?auto_138362 - BLOCK
      ?auto_138358 - BLOCK
      ?auto_138363 - BLOCK
      ?auto_138361 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_138360 ?auto_138357 ) ( ON-TABLE ?auto_138356 ) ( ON ?auto_138357 ?auto_138356 ) ( not ( = ?auto_138356 ?auto_138357 ) ) ( not ( = ?auto_138356 ?auto_138360 ) ) ( not ( = ?auto_138357 ?auto_138360 ) ) ( not ( = ?auto_138356 ?auto_138359 ) ) ( not ( = ?auto_138356 ?auto_138362 ) ) ( not ( = ?auto_138357 ?auto_138359 ) ) ( not ( = ?auto_138357 ?auto_138362 ) ) ( not ( = ?auto_138360 ?auto_138359 ) ) ( not ( = ?auto_138360 ?auto_138362 ) ) ( not ( = ?auto_138359 ?auto_138362 ) ) ( ON ?auto_138359 ?auto_138360 ) ( ON-TABLE ?auto_138358 ) ( not ( = ?auto_138358 ?auto_138363 ) ) ( not ( = ?auto_138358 ?auto_138361 ) ) ( not ( = ?auto_138358 ?auto_138362 ) ) ( not ( = ?auto_138363 ?auto_138361 ) ) ( not ( = ?auto_138363 ?auto_138362 ) ) ( not ( = ?auto_138361 ?auto_138362 ) ) ( not ( = ?auto_138356 ?auto_138361 ) ) ( not ( = ?auto_138356 ?auto_138358 ) ) ( not ( = ?auto_138356 ?auto_138363 ) ) ( not ( = ?auto_138357 ?auto_138361 ) ) ( not ( = ?auto_138357 ?auto_138358 ) ) ( not ( = ?auto_138357 ?auto_138363 ) ) ( not ( = ?auto_138360 ?auto_138361 ) ) ( not ( = ?auto_138360 ?auto_138358 ) ) ( not ( = ?auto_138360 ?auto_138363 ) ) ( not ( = ?auto_138359 ?auto_138361 ) ) ( not ( = ?auto_138359 ?auto_138358 ) ) ( not ( = ?auto_138359 ?auto_138363 ) ) ( ON ?auto_138362 ?auto_138359 ) ( ON ?auto_138361 ?auto_138362 ) ( CLEAR ?auto_138361 ) ( HOLDING ?auto_138363 ) ( CLEAR ?auto_138358 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_138358 ?auto_138363 )
      ( MAKE-2PILE ?auto_138356 ?auto_138357 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_138364 - BLOCK
      ?auto_138365 - BLOCK
    )
    :vars
    (
      ?auto_138366 - BLOCK
      ?auto_138371 - BLOCK
      ?auto_138367 - BLOCK
      ?auto_138369 - BLOCK
      ?auto_138368 - BLOCK
      ?auto_138370 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_138366 ?auto_138365 ) ( ON-TABLE ?auto_138364 ) ( ON ?auto_138365 ?auto_138364 ) ( not ( = ?auto_138364 ?auto_138365 ) ) ( not ( = ?auto_138364 ?auto_138366 ) ) ( not ( = ?auto_138365 ?auto_138366 ) ) ( not ( = ?auto_138364 ?auto_138371 ) ) ( not ( = ?auto_138364 ?auto_138367 ) ) ( not ( = ?auto_138365 ?auto_138371 ) ) ( not ( = ?auto_138365 ?auto_138367 ) ) ( not ( = ?auto_138366 ?auto_138371 ) ) ( not ( = ?auto_138366 ?auto_138367 ) ) ( not ( = ?auto_138371 ?auto_138367 ) ) ( ON ?auto_138371 ?auto_138366 ) ( ON-TABLE ?auto_138369 ) ( not ( = ?auto_138369 ?auto_138368 ) ) ( not ( = ?auto_138369 ?auto_138370 ) ) ( not ( = ?auto_138369 ?auto_138367 ) ) ( not ( = ?auto_138368 ?auto_138370 ) ) ( not ( = ?auto_138368 ?auto_138367 ) ) ( not ( = ?auto_138370 ?auto_138367 ) ) ( not ( = ?auto_138364 ?auto_138370 ) ) ( not ( = ?auto_138364 ?auto_138369 ) ) ( not ( = ?auto_138364 ?auto_138368 ) ) ( not ( = ?auto_138365 ?auto_138370 ) ) ( not ( = ?auto_138365 ?auto_138369 ) ) ( not ( = ?auto_138365 ?auto_138368 ) ) ( not ( = ?auto_138366 ?auto_138370 ) ) ( not ( = ?auto_138366 ?auto_138369 ) ) ( not ( = ?auto_138366 ?auto_138368 ) ) ( not ( = ?auto_138371 ?auto_138370 ) ) ( not ( = ?auto_138371 ?auto_138369 ) ) ( not ( = ?auto_138371 ?auto_138368 ) ) ( ON ?auto_138367 ?auto_138371 ) ( ON ?auto_138370 ?auto_138367 ) ( CLEAR ?auto_138369 ) ( ON ?auto_138368 ?auto_138370 ) ( CLEAR ?auto_138368 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_138364 ?auto_138365 ?auto_138366 ?auto_138371 ?auto_138367 ?auto_138370 )
      ( MAKE-2PILE ?auto_138364 ?auto_138365 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_138372 - BLOCK
      ?auto_138373 - BLOCK
    )
    :vars
    (
      ?auto_138377 - BLOCK
      ?auto_138375 - BLOCK
      ?auto_138379 - BLOCK
      ?auto_138376 - BLOCK
      ?auto_138378 - BLOCK
      ?auto_138374 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_138377 ?auto_138373 ) ( ON-TABLE ?auto_138372 ) ( ON ?auto_138373 ?auto_138372 ) ( not ( = ?auto_138372 ?auto_138373 ) ) ( not ( = ?auto_138372 ?auto_138377 ) ) ( not ( = ?auto_138373 ?auto_138377 ) ) ( not ( = ?auto_138372 ?auto_138375 ) ) ( not ( = ?auto_138372 ?auto_138379 ) ) ( not ( = ?auto_138373 ?auto_138375 ) ) ( not ( = ?auto_138373 ?auto_138379 ) ) ( not ( = ?auto_138377 ?auto_138375 ) ) ( not ( = ?auto_138377 ?auto_138379 ) ) ( not ( = ?auto_138375 ?auto_138379 ) ) ( ON ?auto_138375 ?auto_138377 ) ( not ( = ?auto_138376 ?auto_138378 ) ) ( not ( = ?auto_138376 ?auto_138374 ) ) ( not ( = ?auto_138376 ?auto_138379 ) ) ( not ( = ?auto_138378 ?auto_138374 ) ) ( not ( = ?auto_138378 ?auto_138379 ) ) ( not ( = ?auto_138374 ?auto_138379 ) ) ( not ( = ?auto_138372 ?auto_138374 ) ) ( not ( = ?auto_138372 ?auto_138376 ) ) ( not ( = ?auto_138372 ?auto_138378 ) ) ( not ( = ?auto_138373 ?auto_138374 ) ) ( not ( = ?auto_138373 ?auto_138376 ) ) ( not ( = ?auto_138373 ?auto_138378 ) ) ( not ( = ?auto_138377 ?auto_138374 ) ) ( not ( = ?auto_138377 ?auto_138376 ) ) ( not ( = ?auto_138377 ?auto_138378 ) ) ( not ( = ?auto_138375 ?auto_138374 ) ) ( not ( = ?auto_138375 ?auto_138376 ) ) ( not ( = ?auto_138375 ?auto_138378 ) ) ( ON ?auto_138379 ?auto_138375 ) ( ON ?auto_138374 ?auto_138379 ) ( ON ?auto_138378 ?auto_138374 ) ( CLEAR ?auto_138378 ) ( HOLDING ?auto_138376 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_138376 )
      ( MAKE-2PILE ?auto_138372 ?auto_138373 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_138390 - BLOCK
      ?auto_138391 - BLOCK
    )
    :vars
    (
      ?auto_138395 - BLOCK
      ?auto_138394 - BLOCK
      ?auto_138393 - BLOCK
      ?auto_138396 - BLOCK
      ?auto_138392 - BLOCK
      ?auto_138397 - BLOCK
      ?auto_138398 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_138395 ?auto_138391 ) ( ON-TABLE ?auto_138390 ) ( ON ?auto_138391 ?auto_138390 ) ( not ( = ?auto_138390 ?auto_138391 ) ) ( not ( = ?auto_138390 ?auto_138395 ) ) ( not ( = ?auto_138391 ?auto_138395 ) ) ( not ( = ?auto_138390 ?auto_138394 ) ) ( not ( = ?auto_138390 ?auto_138393 ) ) ( not ( = ?auto_138391 ?auto_138394 ) ) ( not ( = ?auto_138391 ?auto_138393 ) ) ( not ( = ?auto_138395 ?auto_138394 ) ) ( not ( = ?auto_138395 ?auto_138393 ) ) ( not ( = ?auto_138394 ?auto_138393 ) ) ( ON ?auto_138394 ?auto_138395 ) ( not ( = ?auto_138396 ?auto_138392 ) ) ( not ( = ?auto_138396 ?auto_138397 ) ) ( not ( = ?auto_138396 ?auto_138393 ) ) ( not ( = ?auto_138392 ?auto_138397 ) ) ( not ( = ?auto_138392 ?auto_138393 ) ) ( not ( = ?auto_138397 ?auto_138393 ) ) ( not ( = ?auto_138390 ?auto_138397 ) ) ( not ( = ?auto_138390 ?auto_138396 ) ) ( not ( = ?auto_138390 ?auto_138392 ) ) ( not ( = ?auto_138391 ?auto_138397 ) ) ( not ( = ?auto_138391 ?auto_138396 ) ) ( not ( = ?auto_138391 ?auto_138392 ) ) ( not ( = ?auto_138395 ?auto_138397 ) ) ( not ( = ?auto_138395 ?auto_138396 ) ) ( not ( = ?auto_138395 ?auto_138392 ) ) ( not ( = ?auto_138394 ?auto_138397 ) ) ( not ( = ?auto_138394 ?auto_138396 ) ) ( not ( = ?auto_138394 ?auto_138392 ) ) ( ON ?auto_138393 ?auto_138394 ) ( ON ?auto_138397 ?auto_138393 ) ( ON ?auto_138392 ?auto_138397 ) ( CLEAR ?auto_138392 ) ( ON ?auto_138396 ?auto_138398 ) ( CLEAR ?auto_138396 ) ( HAND-EMPTY ) ( not ( = ?auto_138390 ?auto_138398 ) ) ( not ( = ?auto_138391 ?auto_138398 ) ) ( not ( = ?auto_138395 ?auto_138398 ) ) ( not ( = ?auto_138394 ?auto_138398 ) ) ( not ( = ?auto_138393 ?auto_138398 ) ) ( not ( = ?auto_138396 ?auto_138398 ) ) ( not ( = ?auto_138392 ?auto_138398 ) ) ( not ( = ?auto_138397 ?auto_138398 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_138396 ?auto_138398 )
      ( MAKE-2PILE ?auto_138390 ?auto_138391 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_138399 - BLOCK
      ?auto_138400 - BLOCK
    )
    :vars
    (
      ?auto_138404 - BLOCK
      ?auto_138401 - BLOCK
      ?auto_138403 - BLOCK
      ?auto_138407 - BLOCK
      ?auto_138402 - BLOCK
      ?auto_138406 - BLOCK
      ?auto_138405 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_138404 ?auto_138400 ) ( ON-TABLE ?auto_138399 ) ( ON ?auto_138400 ?auto_138399 ) ( not ( = ?auto_138399 ?auto_138400 ) ) ( not ( = ?auto_138399 ?auto_138404 ) ) ( not ( = ?auto_138400 ?auto_138404 ) ) ( not ( = ?auto_138399 ?auto_138401 ) ) ( not ( = ?auto_138399 ?auto_138403 ) ) ( not ( = ?auto_138400 ?auto_138401 ) ) ( not ( = ?auto_138400 ?auto_138403 ) ) ( not ( = ?auto_138404 ?auto_138401 ) ) ( not ( = ?auto_138404 ?auto_138403 ) ) ( not ( = ?auto_138401 ?auto_138403 ) ) ( ON ?auto_138401 ?auto_138404 ) ( not ( = ?auto_138407 ?auto_138402 ) ) ( not ( = ?auto_138407 ?auto_138406 ) ) ( not ( = ?auto_138407 ?auto_138403 ) ) ( not ( = ?auto_138402 ?auto_138406 ) ) ( not ( = ?auto_138402 ?auto_138403 ) ) ( not ( = ?auto_138406 ?auto_138403 ) ) ( not ( = ?auto_138399 ?auto_138406 ) ) ( not ( = ?auto_138399 ?auto_138407 ) ) ( not ( = ?auto_138399 ?auto_138402 ) ) ( not ( = ?auto_138400 ?auto_138406 ) ) ( not ( = ?auto_138400 ?auto_138407 ) ) ( not ( = ?auto_138400 ?auto_138402 ) ) ( not ( = ?auto_138404 ?auto_138406 ) ) ( not ( = ?auto_138404 ?auto_138407 ) ) ( not ( = ?auto_138404 ?auto_138402 ) ) ( not ( = ?auto_138401 ?auto_138406 ) ) ( not ( = ?auto_138401 ?auto_138407 ) ) ( not ( = ?auto_138401 ?auto_138402 ) ) ( ON ?auto_138403 ?auto_138401 ) ( ON ?auto_138406 ?auto_138403 ) ( ON ?auto_138407 ?auto_138405 ) ( CLEAR ?auto_138407 ) ( not ( = ?auto_138399 ?auto_138405 ) ) ( not ( = ?auto_138400 ?auto_138405 ) ) ( not ( = ?auto_138404 ?auto_138405 ) ) ( not ( = ?auto_138401 ?auto_138405 ) ) ( not ( = ?auto_138403 ?auto_138405 ) ) ( not ( = ?auto_138407 ?auto_138405 ) ) ( not ( = ?auto_138402 ?auto_138405 ) ) ( not ( = ?auto_138406 ?auto_138405 ) ) ( HOLDING ?auto_138402 ) ( CLEAR ?auto_138406 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_138399 ?auto_138400 ?auto_138404 ?auto_138401 ?auto_138403 ?auto_138406 ?auto_138402 )
      ( MAKE-2PILE ?auto_138399 ?auto_138400 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_138408 - BLOCK
      ?auto_138409 - BLOCK
    )
    :vars
    (
      ?auto_138412 - BLOCK
      ?auto_138416 - BLOCK
      ?auto_138411 - BLOCK
      ?auto_138415 - BLOCK
      ?auto_138410 - BLOCK
      ?auto_138414 - BLOCK
      ?auto_138413 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_138412 ?auto_138409 ) ( ON-TABLE ?auto_138408 ) ( ON ?auto_138409 ?auto_138408 ) ( not ( = ?auto_138408 ?auto_138409 ) ) ( not ( = ?auto_138408 ?auto_138412 ) ) ( not ( = ?auto_138409 ?auto_138412 ) ) ( not ( = ?auto_138408 ?auto_138416 ) ) ( not ( = ?auto_138408 ?auto_138411 ) ) ( not ( = ?auto_138409 ?auto_138416 ) ) ( not ( = ?auto_138409 ?auto_138411 ) ) ( not ( = ?auto_138412 ?auto_138416 ) ) ( not ( = ?auto_138412 ?auto_138411 ) ) ( not ( = ?auto_138416 ?auto_138411 ) ) ( ON ?auto_138416 ?auto_138412 ) ( not ( = ?auto_138415 ?auto_138410 ) ) ( not ( = ?auto_138415 ?auto_138414 ) ) ( not ( = ?auto_138415 ?auto_138411 ) ) ( not ( = ?auto_138410 ?auto_138414 ) ) ( not ( = ?auto_138410 ?auto_138411 ) ) ( not ( = ?auto_138414 ?auto_138411 ) ) ( not ( = ?auto_138408 ?auto_138414 ) ) ( not ( = ?auto_138408 ?auto_138415 ) ) ( not ( = ?auto_138408 ?auto_138410 ) ) ( not ( = ?auto_138409 ?auto_138414 ) ) ( not ( = ?auto_138409 ?auto_138415 ) ) ( not ( = ?auto_138409 ?auto_138410 ) ) ( not ( = ?auto_138412 ?auto_138414 ) ) ( not ( = ?auto_138412 ?auto_138415 ) ) ( not ( = ?auto_138412 ?auto_138410 ) ) ( not ( = ?auto_138416 ?auto_138414 ) ) ( not ( = ?auto_138416 ?auto_138415 ) ) ( not ( = ?auto_138416 ?auto_138410 ) ) ( ON ?auto_138411 ?auto_138416 ) ( ON ?auto_138414 ?auto_138411 ) ( ON ?auto_138415 ?auto_138413 ) ( not ( = ?auto_138408 ?auto_138413 ) ) ( not ( = ?auto_138409 ?auto_138413 ) ) ( not ( = ?auto_138412 ?auto_138413 ) ) ( not ( = ?auto_138416 ?auto_138413 ) ) ( not ( = ?auto_138411 ?auto_138413 ) ) ( not ( = ?auto_138415 ?auto_138413 ) ) ( not ( = ?auto_138410 ?auto_138413 ) ) ( not ( = ?auto_138414 ?auto_138413 ) ) ( CLEAR ?auto_138414 ) ( ON ?auto_138410 ?auto_138415 ) ( CLEAR ?auto_138410 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_138413 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_138413 ?auto_138415 )
      ( MAKE-2PILE ?auto_138408 ?auto_138409 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_138417 - BLOCK
      ?auto_138418 - BLOCK
    )
    :vars
    (
      ?auto_138421 - BLOCK
      ?auto_138425 - BLOCK
      ?auto_138423 - BLOCK
      ?auto_138420 - BLOCK
      ?auto_138419 - BLOCK
      ?auto_138424 - BLOCK
      ?auto_138422 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_138421 ?auto_138418 ) ( ON-TABLE ?auto_138417 ) ( ON ?auto_138418 ?auto_138417 ) ( not ( = ?auto_138417 ?auto_138418 ) ) ( not ( = ?auto_138417 ?auto_138421 ) ) ( not ( = ?auto_138418 ?auto_138421 ) ) ( not ( = ?auto_138417 ?auto_138425 ) ) ( not ( = ?auto_138417 ?auto_138423 ) ) ( not ( = ?auto_138418 ?auto_138425 ) ) ( not ( = ?auto_138418 ?auto_138423 ) ) ( not ( = ?auto_138421 ?auto_138425 ) ) ( not ( = ?auto_138421 ?auto_138423 ) ) ( not ( = ?auto_138425 ?auto_138423 ) ) ( ON ?auto_138425 ?auto_138421 ) ( not ( = ?auto_138420 ?auto_138419 ) ) ( not ( = ?auto_138420 ?auto_138424 ) ) ( not ( = ?auto_138420 ?auto_138423 ) ) ( not ( = ?auto_138419 ?auto_138424 ) ) ( not ( = ?auto_138419 ?auto_138423 ) ) ( not ( = ?auto_138424 ?auto_138423 ) ) ( not ( = ?auto_138417 ?auto_138424 ) ) ( not ( = ?auto_138417 ?auto_138420 ) ) ( not ( = ?auto_138417 ?auto_138419 ) ) ( not ( = ?auto_138418 ?auto_138424 ) ) ( not ( = ?auto_138418 ?auto_138420 ) ) ( not ( = ?auto_138418 ?auto_138419 ) ) ( not ( = ?auto_138421 ?auto_138424 ) ) ( not ( = ?auto_138421 ?auto_138420 ) ) ( not ( = ?auto_138421 ?auto_138419 ) ) ( not ( = ?auto_138425 ?auto_138424 ) ) ( not ( = ?auto_138425 ?auto_138420 ) ) ( not ( = ?auto_138425 ?auto_138419 ) ) ( ON ?auto_138423 ?auto_138425 ) ( ON ?auto_138420 ?auto_138422 ) ( not ( = ?auto_138417 ?auto_138422 ) ) ( not ( = ?auto_138418 ?auto_138422 ) ) ( not ( = ?auto_138421 ?auto_138422 ) ) ( not ( = ?auto_138425 ?auto_138422 ) ) ( not ( = ?auto_138423 ?auto_138422 ) ) ( not ( = ?auto_138420 ?auto_138422 ) ) ( not ( = ?auto_138419 ?auto_138422 ) ) ( not ( = ?auto_138424 ?auto_138422 ) ) ( ON ?auto_138419 ?auto_138420 ) ( CLEAR ?auto_138419 ) ( ON-TABLE ?auto_138422 ) ( HOLDING ?auto_138424 ) ( CLEAR ?auto_138423 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_138417 ?auto_138418 ?auto_138421 ?auto_138425 ?auto_138423 ?auto_138424 )
      ( MAKE-2PILE ?auto_138417 ?auto_138418 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_138426 - BLOCK
      ?auto_138427 - BLOCK
    )
    :vars
    (
      ?auto_138431 - BLOCK
      ?auto_138428 - BLOCK
      ?auto_138432 - BLOCK
      ?auto_138429 - BLOCK
      ?auto_138434 - BLOCK
      ?auto_138433 - BLOCK
      ?auto_138430 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_138431 ?auto_138427 ) ( ON-TABLE ?auto_138426 ) ( ON ?auto_138427 ?auto_138426 ) ( not ( = ?auto_138426 ?auto_138427 ) ) ( not ( = ?auto_138426 ?auto_138431 ) ) ( not ( = ?auto_138427 ?auto_138431 ) ) ( not ( = ?auto_138426 ?auto_138428 ) ) ( not ( = ?auto_138426 ?auto_138432 ) ) ( not ( = ?auto_138427 ?auto_138428 ) ) ( not ( = ?auto_138427 ?auto_138432 ) ) ( not ( = ?auto_138431 ?auto_138428 ) ) ( not ( = ?auto_138431 ?auto_138432 ) ) ( not ( = ?auto_138428 ?auto_138432 ) ) ( ON ?auto_138428 ?auto_138431 ) ( not ( = ?auto_138429 ?auto_138434 ) ) ( not ( = ?auto_138429 ?auto_138433 ) ) ( not ( = ?auto_138429 ?auto_138432 ) ) ( not ( = ?auto_138434 ?auto_138433 ) ) ( not ( = ?auto_138434 ?auto_138432 ) ) ( not ( = ?auto_138433 ?auto_138432 ) ) ( not ( = ?auto_138426 ?auto_138433 ) ) ( not ( = ?auto_138426 ?auto_138429 ) ) ( not ( = ?auto_138426 ?auto_138434 ) ) ( not ( = ?auto_138427 ?auto_138433 ) ) ( not ( = ?auto_138427 ?auto_138429 ) ) ( not ( = ?auto_138427 ?auto_138434 ) ) ( not ( = ?auto_138431 ?auto_138433 ) ) ( not ( = ?auto_138431 ?auto_138429 ) ) ( not ( = ?auto_138431 ?auto_138434 ) ) ( not ( = ?auto_138428 ?auto_138433 ) ) ( not ( = ?auto_138428 ?auto_138429 ) ) ( not ( = ?auto_138428 ?auto_138434 ) ) ( ON ?auto_138432 ?auto_138428 ) ( ON ?auto_138429 ?auto_138430 ) ( not ( = ?auto_138426 ?auto_138430 ) ) ( not ( = ?auto_138427 ?auto_138430 ) ) ( not ( = ?auto_138431 ?auto_138430 ) ) ( not ( = ?auto_138428 ?auto_138430 ) ) ( not ( = ?auto_138432 ?auto_138430 ) ) ( not ( = ?auto_138429 ?auto_138430 ) ) ( not ( = ?auto_138434 ?auto_138430 ) ) ( not ( = ?auto_138433 ?auto_138430 ) ) ( ON ?auto_138434 ?auto_138429 ) ( ON-TABLE ?auto_138430 ) ( CLEAR ?auto_138432 ) ( ON ?auto_138433 ?auto_138434 ) ( CLEAR ?auto_138433 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_138430 ?auto_138429 ?auto_138434 )
      ( MAKE-2PILE ?auto_138426 ?auto_138427 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_138484 - BLOCK
      ?auto_138485 - BLOCK
      ?auto_138486 - BLOCK
      ?auto_138487 - BLOCK
      ?auto_138488 - BLOCK
      ?auto_138489 - BLOCK
    )
    :vars
    (
      ?auto_138490 - BLOCK
      ?auto_138491 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_138484 ) ( ON ?auto_138485 ?auto_138484 ) ( ON ?auto_138486 ?auto_138485 ) ( ON ?auto_138487 ?auto_138486 ) ( not ( = ?auto_138484 ?auto_138485 ) ) ( not ( = ?auto_138484 ?auto_138486 ) ) ( not ( = ?auto_138484 ?auto_138487 ) ) ( not ( = ?auto_138484 ?auto_138488 ) ) ( not ( = ?auto_138484 ?auto_138489 ) ) ( not ( = ?auto_138485 ?auto_138486 ) ) ( not ( = ?auto_138485 ?auto_138487 ) ) ( not ( = ?auto_138485 ?auto_138488 ) ) ( not ( = ?auto_138485 ?auto_138489 ) ) ( not ( = ?auto_138486 ?auto_138487 ) ) ( not ( = ?auto_138486 ?auto_138488 ) ) ( not ( = ?auto_138486 ?auto_138489 ) ) ( not ( = ?auto_138487 ?auto_138488 ) ) ( not ( = ?auto_138487 ?auto_138489 ) ) ( not ( = ?auto_138488 ?auto_138489 ) ) ( ON ?auto_138489 ?auto_138490 ) ( not ( = ?auto_138484 ?auto_138490 ) ) ( not ( = ?auto_138485 ?auto_138490 ) ) ( not ( = ?auto_138486 ?auto_138490 ) ) ( not ( = ?auto_138487 ?auto_138490 ) ) ( not ( = ?auto_138488 ?auto_138490 ) ) ( not ( = ?auto_138489 ?auto_138490 ) ) ( CLEAR ?auto_138487 ) ( ON ?auto_138488 ?auto_138489 ) ( CLEAR ?auto_138488 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_138491 ) ( ON ?auto_138490 ?auto_138491 ) ( not ( = ?auto_138491 ?auto_138490 ) ) ( not ( = ?auto_138491 ?auto_138489 ) ) ( not ( = ?auto_138491 ?auto_138488 ) ) ( not ( = ?auto_138484 ?auto_138491 ) ) ( not ( = ?auto_138485 ?auto_138491 ) ) ( not ( = ?auto_138486 ?auto_138491 ) ) ( not ( = ?auto_138487 ?auto_138491 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_138491 ?auto_138490 ?auto_138489 )
      ( MAKE-6PILE ?auto_138484 ?auto_138485 ?auto_138486 ?auto_138487 ?auto_138488 ?auto_138489 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_138492 - BLOCK
      ?auto_138493 - BLOCK
      ?auto_138494 - BLOCK
      ?auto_138495 - BLOCK
      ?auto_138496 - BLOCK
      ?auto_138497 - BLOCK
    )
    :vars
    (
      ?auto_138499 - BLOCK
      ?auto_138498 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_138492 ) ( ON ?auto_138493 ?auto_138492 ) ( ON ?auto_138494 ?auto_138493 ) ( not ( = ?auto_138492 ?auto_138493 ) ) ( not ( = ?auto_138492 ?auto_138494 ) ) ( not ( = ?auto_138492 ?auto_138495 ) ) ( not ( = ?auto_138492 ?auto_138496 ) ) ( not ( = ?auto_138492 ?auto_138497 ) ) ( not ( = ?auto_138493 ?auto_138494 ) ) ( not ( = ?auto_138493 ?auto_138495 ) ) ( not ( = ?auto_138493 ?auto_138496 ) ) ( not ( = ?auto_138493 ?auto_138497 ) ) ( not ( = ?auto_138494 ?auto_138495 ) ) ( not ( = ?auto_138494 ?auto_138496 ) ) ( not ( = ?auto_138494 ?auto_138497 ) ) ( not ( = ?auto_138495 ?auto_138496 ) ) ( not ( = ?auto_138495 ?auto_138497 ) ) ( not ( = ?auto_138496 ?auto_138497 ) ) ( ON ?auto_138497 ?auto_138499 ) ( not ( = ?auto_138492 ?auto_138499 ) ) ( not ( = ?auto_138493 ?auto_138499 ) ) ( not ( = ?auto_138494 ?auto_138499 ) ) ( not ( = ?auto_138495 ?auto_138499 ) ) ( not ( = ?auto_138496 ?auto_138499 ) ) ( not ( = ?auto_138497 ?auto_138499 ) ) ( ON ?auto_138496 ?auto_138497 ) ( CLEAR ?auto_138496 ) ( ON-TABLE ?auto_138498 ) ( ON ?auto_138499 ?auto_138498 ) ( not ( = ?auto_138498 ?auto_138499 ) ) ( not ( = ?auto_138498 ?auto_138497 ) ) ( not ( = ?auto_138498 ?auto_138496 ) ) ( not ( = ?auto_138492 ?auto_138498 ) ) ( not ( = ?auto_138493 ?auto_138498 ) ) ( not ( = ?auto_138494 ?auto_138498 ) ) ( not ( = ?auto_138495 ?auto_138498 ) ) ( HOLDING ?auto_138495 ) ( CLEAR ?auto_138494 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_138492 ?auto_138493 ?auto_138494 ?auto_138495 )
      ( MAKE-6PILE ?auto_138492 ?auto_138493 ?auto_138494 ?auto_138495 ?auto_138496 ?auto_138497 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_138500 - BLOCK
      ?auto_138501 - BLOCK
      ?auto_138502 - BLOCK
      ?auto_138503 - BLOCK
      ?auto_138504 - BLOCK
      ?auto_138505 - BLOCK
    )
    :vars
    (
      ?auto_138507 - BLOCK
      ?auto_138506 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_138500 ) ( ON ?auto_138501 ?auto_138500 ) ( ON ?auto_138502 ?auto_138501 ) ( not ( = ?auto_138500 ?auto_138501 ) ) ( not ( = ?auto_138500 ?auto_138502 ) ) ( not ( = ?auto_138500 ?auto_138503 ) ) ( not ( = ?auto_138500 ?auto_138504 ) ) ( not ( = ?auto_138500 ?auto_138505 ) ) ( not ( = ?auto_138501 ?auto_138502 ) ) ( not ( = ?auto_138501 ?auto_138503 ) ) ( not ( = ?auto_138501 ?auto_138504 ) ) ( not ( = ?auto_138501 ?auto_138505 ) ) ( not ( = ?auto_138502 ?auto_138503 ) ) ( not ( = ?auto_138502 ?auto_138504 ) ) ( not ( = ?auto_138502 ?auto_138505 ) ) ( not ( = ?auto_138503 ?auto_138504 ) ) ( not ( = ?auto_138503 ?auto_138505 ) ) ( not ( = ?auto_138504 ?auto_138505 ) ) ( ON ?auto_138505 ?auto_138507 ) ( not ( = ?auto_138500 ?auto_138507 ) ) ( not ( = ?auto_138501 ?auto_138507 ) ) ( not ( = ?auto_138502 ?auto_138507 ) ) ( not ( = ?auto_138503 ?auto_138507 ) ) ( not ( = ?auto_138504 ?auto_138507 ) ) ( not ( = ?auto_138505 ?auto_138507 ) ) ( ON ?auto_138504 ?auto_138505 ) ( ON-TABLE ?auto_138506 ) ( ON ?auto_138507 ?auto_138506 ) ( not ( = ?auto_138506 ?auto_138507 ) ) ( not ( = ?auto_138506 ?auto_138505 ) ) ( not ( = ?auto_138506 ?auto_138504 ) ) ( not ( = ?auto_138500 ?auto_138506 ) ) ( not ( = ?auto_138501 ?auto_138506 ) ) ( not ( = ?auto_138502 ?auto_138506 ) ) ( not ( = ?auto_138503 ?auto_138506 ) ) ( CLEAR ?auto_138502 ) ( ON ?auto_138503 ?auto_138504 ) ( CLEAR ?auto_138503 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_138506 ?auto_138507 ?auto_138505 ?auto_138504 )
      ( MAKE-6PILE ?auto_138500 ?auto_138501 ?auto_138502 ?auto_138503 ?auto_138504 ?auto_138505 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_138508 - BLOCK
      ?auto_138509 - BLOCK
      ?auto_138510 - BLOCK
      ?auto_138511 - BLOCK
      ?auto_138512 - BLOCK
      ?auto_138513 - BLOCK
    )
    :vars
    (
      ?auto_138514 - BLOCK
      ?auto_138515 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_138508 ) ( ON ?auto_138509 ?auto_138508 ) ( not ( = ?auto_138508 ?auto_138509 ) ) ( not ( = ?auto_138508 ?auto_138510 ) ) ( not ( = ?auto_138508 ?auto_138511 ) ) ( not ( = ?auto_138508 ?auto_138512 ) ) ( not ( = ?auto_138508 ?auto_138513 ) ) ( not ( = ?auto_138509 ?auto_138510 ) ) ( not ( = ?auto_138509 ?auto_138511 ) ) ( not ( = ?auto_138509 ?auto_138512 ) ) ( not ( = ?auto_138509 ?auto_138513 ) ) ( not ( = ?auto_138510 ?auto_138511 ) ) ( not ( = ?auto_138510 ?auto_138512 ) ) ( not ( = ?auto_138510 ?auto_138513 ) ) ( not ( = ?auto_138511 ?auto_138512 ) ) ( not ( = ?auto_138511 ?auto_138513 ) ) ( not ( = ?auto_138512 ?auto_138513 ) ) ( ON ?auto_138513 ?auto_138514 ) ( not ( = ?auto_138508 ?auto_138514 ) ) ( not ( = ?auto_138509 ?auto_138514 ) ) ( not ( = ?auto_138510 ?auto_138514 ) ) ( not ( = ?auto_138511 ?auto_138514 ) ) ( not ( = ?auto_138512 ?auto_138514 ) ) ( not ( = ?auto_138513 ?auto_138514 ) ) ( ON ?auto_138512 ?auto_138513 ) ( ON-TABLE ?auto_138515 ) ( ON ?auto_138514 ?auto_138515 ) ( not ( = ?auto_138515 ?auto_138514 ) ) ( not ( = ?auto_138515 ?auto_138513 ) ) ( not ( = ?auto_138515 ?auto_138512 ) ) ( not ( = ?auto_138508 ?auto_138515 ) ) ( not ( = ?auto_138509 ?auto_138515 ) ) ( not ( = ?auto_138510 ?auto_138515 ) ) ( not ( = ?auto_138511 ?auto_138515 ) ) ( ON ?auto_138511 ?auto_138512 ) ( CLEAR ?auto_138511 ) ( HOLDING ?auto_138510 ) ( CLEAR ?auto_138509 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_138508 ?auto_138509 ?auto_138510 )
      ( MAKE-6PILE ?auto_138508 ?auto_138509 ?auto_138510 ?auto_138511 ?auto_138512 ?auto_138513 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_138516 - BLOCK
      ?auto_138517 - BLOCK
      ?auto_138518 - BLOCK
      ?auto_138519 - BLOCK
      ?auto_138520 - BLOCK
      ?auto_138521 - BLOCK
    )
    :vars
    (
      ?auto_138522 - BLOCK
      ?auto_138523 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_138516 ) ( ON ?auto_138517 ?auto_138516 ) ( not ( = ?auto_138516 ?auto_138517 ) ) ( not ( = ?auto_138516 ?auto_138518 ) ) ( not ( = ?auto_138516 ?auto_138519 ) ) ( not ( = ?auto_138516 ?auto_138520 ) ) ( not ( = ?auto_138516 ?auto_138521 ) ) ( not ( = ?auto_138517 ?auto_138518 ) ) ( not ( = ?auto_138517 ?auto_138519 ) ) ( not ( = ?auto_138517 ?auto_138520 ) ) ( not ( = ?auto_138517 ?auto_138521 ) ) ( not ( = ?auto_138518 ?auto_138519 ) ) ( not ( = ?auto_138518 ?auto_138520 ) ) ( not ( = ?auto_138518 ?auto_138521 ) ) ( not ( = ?auto_138519 ?auto_138520 ) ) ( not ( = ?auto_138519 ?auto_138521 ) ) ( not ( = ?auto_138520 ?auto_138521 ) ) ( ON ?auto_138521 ?auto_138522 ) ( not ( = ?auto_138516 ?auto_138522 ) ) ( not ( = ?auto_138517 ?auto_138522 ) ) ( not ( = ?auto_138518 ?auto_138522 ) ) ( not ( = ?auto_138519 ?auto_138522 ) ) ( not ( = ?auto_138520 ?auto_138522 ) ) ( not ( = ?auto_138521 ?auto_138522 ) ) ( ON ?auto_138520 ?auto_138521 ) ( ON-TABLE ?auto_138523 ) ( ON ?auto_138522 ?auto_138523 ) ( not ( = ?auto_138523 ?auto_138522 ) ) ( not ( = ?auto_138523 ?auto_138521 ) ) ( not ( = ?auto_138523 ?auto_138520 ) ) ( not ( = ?auto_138516 ?auto_138523 ) ) ( not ( = ?auto_138517 ?auto_138523 ) ) ( not ( = ?auto_138518 ?auto_138523 ) ) ( not ( = ?auto_138519 ?auto_138523 ) ) ( ON ?auto_138519 ?auto_138520 ) ( CLEAR ?auto_138517 ) ( ON ?auto_138518 ?auto_138519 ) ( CLEAR ?auto_138518 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_138523 ?auto_138522 ?auto_138521 ?auto_138520 ?auto_138519 )
      ( MAKE-6PILE ?auto_138516 ?auto_138517 ?auto_138518 ?auto_138519 ?auto_138520 ?auto_138521 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_138524 - BLOCK
      ?auto_138525 - BLOCK
      ?auto_138526 - BLOCK
      ?auto_138527 - BLOCK
      ?auto_138528 - BLOCK
      ?auto_138529 - BLOCK
    )
    :vars
    (
      ?auto_138530 - BLOCK
      ?auto_138531 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_138524 ) ( not ( = ?auto_138524 ?auto_138525 ) ) ( not ( = ?auto_138524 ?auto_138526 ) ) ( not ( = ?auto_138524 ?auto_138527 ) ) ( not ( = ?auto_138524 ?auto_138528 ) ) ( not ( = ?auto_138524 ?auto_138529 ) ) ( not ( = ?auto_138525 ?auto_138526 ) ) ( not ( = ?auto_138525 ?auto_138527 ) ) ( not ( = ?auto_138525 ?auto_138528 ) ) ( not ( = ?auto_138525 ?auto_138529 ) ) ( not ( = ?auto_138526 ?auto_138527 ) ) ( not ( = ?auto_138526 ?auto_138528 ) ) ( not ( = ?auto_138526 ?auto_138529 ) ) ( not ( = ?auto_138527 ?auto_138528 ) ) ( not ( = ?auto_138527 ?auto_138529 ) ) ( not ( = ?auto_138528 ?auto_138529 ) ) ( ON ?auto_138529 ?auto_138530 ) ( not ( = ?auto_138524 ?auto_138530 ) ) ( not ( = ?auto_138525 ?auto_138530 ) ) ( not ( = ?auto_138526 ?auto_138530 ) ) ( not ( = ?auto_138527 ?auto_138530 ) ) ( not ( = ?auto_138528 ?auto_138530 ) ) ( not ( = ?auto_138529 ?auto_138530 ) ) ( ON ?auto_138528 ?auto_138529 ) ( ON-TABLE ?auto_138531 ) ( ON ?auto_138530 ?auto_138531 ) ( not ( = ?auto_138531 ?auto_138530 ) ) ( not ( = ?auto_138531 ?auto_138529 ) ) ( not ( = ?auto_138531 ?auto_138528 ) ) ( not ( = ?auto_138524 ?auto_138531 ) ) ( not ( = ?auto_138525 ?auto_138531 ) ) ( not ( = ?auto_138526 ?auto_138531 ) ) ( not ( = ?auto_138527 ?auto_138531 ) ) ( ON ?auto_138527 ?auto_138528 ) ( ON ?auto_138526 ?auto_138527 ) ( CLEAR ?auto_138526 ) ( HOLDING ?auto_138525 ) ( CLEAR ?auto_138524 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_138524 ?auto_138525 )
      ( MAKE-6PILE ?auto_138524 ?auto_138525 ?auto_138526 ?auto_138527 ?auto_138528 ?auto_138529 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_138532 - BLOCK
      ?auto_138533 - BLOCK
      ?auto_138534 - BLOCK
      ?auto_138535 - BLOCK
      ?auto_138536 - BLOCK
      ?auto_138537 - BLOCK
    )
    :vars
    (
      ?auto_138538 - BLOCK
      ?auto_138539 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_138532 ) ( not ( = ?auto_138532 ?auto_138533 ) ) ( not ( = ?auto_138532 ?auto_138534 ) ) ( not ( = ?auto_138532 ?auto_138535 ) ) ( not ( = ?auto_138532 ?auto_138536 ) ) ( not ( = ?auto_138532 ?auto_138537 ) ) ( not ( = ?auto_138533 ?auto_138534 ) ) ( not ( = ?auto_138533 ?auto_138535 ) ) ( not ( = ?auto_138533 ?auto_138536 ) ) ( not ( = ?auto_138533 ?auto_138537 ) ) ( not ( = ?auto_138534 ?auto_138535 ) ) ( not ( = ?auto_138534 ?auto_138536 ) ) ( not ( = ?auto_138534 ?auto_138537 ) ) ( not ( = ?auto_138535 ?auto_138536 ) ) ( not ( = ?auto_138535 ?auto_138537 ) ) ( not ( = ?auto_138536 ?auto_138537 ) ) ( ON ?auto_138537 ?auto_138538 ) ( not ( = ?auto_138532 ?auto_138538 ) ) ( not ( = ?auto_138533 ?auto_138538 ) ) ( not ( = ?auto_138534 ?auto_138538 ) ) ( not ( = ?auto_138535 ?auto_138538 ) ) ( not ( = ?auto_138536 ?auto_138538 ) ) ( not ( = ?auto_138537 ?auto_138538 ) ) ( ON ?auto_138536 ?auto_138537 ) ( ON-TABLE ?auto_138539 ) ( ON ?auto_138538 ?auto_138539 ) ( not ( = ?auto_138539 ?auto_138538 ) ) ( not ( = ?auto_138539 ?auto_138537 ) ) ( not ( = ?auto_138539 ?auto_138536 ) ) ( not ( = ?auto_138532 ?auto_138539 ) ) ( not ( = ?auto_138533 ?auto_138539 ) ) ( not ( = ?auto_138534 ?auto_138539 ) ) ( not ( = ?auto_138535 ?auto_138539 ) ) ( ON ?auto_138535 ?auto_138536 ) ( ON ?auto_138534 ?auto_138535 ) ( CLEAR ?auto_138532 ) ( ON ?auto_138533 ?auto_138534 ) ( CLEAR ?auto_138533 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_138539 ?auto_138538 ?auto_138537 ?auto_138536 ?auto_138535 ?auto_138534 )
      ( MAKE-6PILE ?auto_138532 ?auto_138533 ?auto_138534 ?auto_138535 ?auto_138536 ?auto_138537 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_138540 - BLOCK
      ?auto_138541 - BLOCK
      ?auto_138542 - BLOCK
      ?auto_138543 - BLOCK
      ?auto_138544 - BLOCK
      ?auto_138545 - BLOCK
    )
    :vars
    (
      ?auto_138547 - BLOCK
      ?auto_138546 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_138540 ?auto_138541 ) ) ( not ( = ?auto_138540 ?auto_138542 ) ) ( not ( = ?auto_138540 ?auto_138543 ) ) ( not ( = ?auto_138540 ?auto_138544 ) ) ( not ( = ?auto_138540 ?auto_138545 ) ) ( not ( = ?auto_138541 ?auto_138542 ) ) ( not ( = ?auto_138541 ?auto_138543 ) ) ( not ( = ?auto_138541 ?auto_138544 ) ) ( not ( = ?auto_138541 ?auto_138545 ) ) ( not ( = ?auto_138542 ?auto_138543 ) ) ( not ( = ?auto_138542 ?auto_138544 ) ) ( not ( = ?auto_138542 ?auto_138545 ) ) ( not ( = ?auto_138543 ?auto_138544 ) ) ( not ( = ?auto_138543 ?auto_138545 ) ) ( not ( = ?auto_138544 ?auto_138545 ) ) ( ON ?auto_138545 ?auto_138547 ) ( not ( = ?auto_138540 ?auto_138547 ) ) ( not ( = ?auto_138541 ?auto_138547 ) ) ( not ( = ?auto_138542 ?auto_138547 ) ) ( not ( = ?auto_138543 ?auto_138547 ) ) ( not ( = ?auto_138544 ?auto_138547 ) ) ( not ( = ?auto_138545 ?auto_138547 ) ) ( ON ?auto_138544 ?auto_138545 ) ( ON-TABLE ?auto_138546 ) ( ON ?auto_138547 ?auto_138546 ) ( not ( = ?auto_138546 ?auto_138547 ) ) ( not ( = ?auto_138546 ?auto_138545 ) ) ( not ( = ?auto_138546 ?auto_138544 ) ) ( not ( = ?auto_138540 ?auto_138546 ) ) ( not ( = ?auto_138541 ?auto_138546 ) ) ( not ( = ?auto_138542 ?auto_138546 ) ) ( not ( = ?auto_138543 ?auto_138546 ) ) ( ON ?auto_138543 ?auto_138544 ) ( ON ?auto_138542 ?auto_138543 ) ( ON ?auto_138541 ?auto_138542 ) ( CLEAR ?auto_138541 ) ( HOLDING ?auto_138540 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_138540 )
      ( MAKE-6PILE ?auto_138540 ?auto_138541 ?auto_138542 ?auto_138543 ?auto_138544 ?auto_138545 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_138548 - BLOCK
      ?auto_138549 - BLOCK
      ?auto_138550 - BLOCK
      ?auto_138551 - BLOCK
      ?auto_138552 - BLOCK
      ?auto_138553 - BLOCK
    )
    :vars
    (
      ?auto_138554 - BLOCK
      ?auto_138555 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_138548 ?auto_138549 ) ) ( not ( = ?auto_138548 ?auto_138550 ) ) ( not ( = ?auto_138548 ?auto_138551 ) ) ( not ( = ?auto_138548 ?auto_138552 ) ) ( not ( = ?auto_138548 ?auto_138553 ) ) ( not ( = ?auto_138549 ?auto_138550 ) ) ( not ( = ?auto_138549 ?auto_138551 ) ) ( not ( = ?auto_138549 ?auto_138552 ) ) ( not ( = ?auto_138549 ?auto_138553 ) ) ( not ( = ?auto_138550 ?auto_138551 ) ) ( not ( = ?auto_138550 ?auto_138552 ) ) ( not ( = ?auto_138550 ?auto_138553 ) ) ( not ( = ?auto_138551 ?auto_138552 ) ) ( not ( = ?auto_138551 ?auto_138553 ) ) ( not ( = ?auto_138552 ?auto_138553 ) ) ( ON ?auto_138553 ?auto_138554 ) ( not ( = ?auto_138548 ?auto_138554 ) ) ( not ( = ?auto_138549 ?auto_138554 ) ) ( not ( = ?auto_138550 ?auto_138554 ) ) ( not ( = ?auto_138551 ?auto_138554 ) ) ( not ( = ?auto_138552 ?auto_138554 ) ) ( not ( = ?auto_138553 ?auto_138554 ) ) ( ON ?auto_138552 ?auto_138553 ) ( ON-TABLE ?auto_138555 ) ( ON ?auto_138554 ?auto_138555 ) ( not ( = ?auto_138555 ?auto_138554 ) ) ( not ( = ?auto_138555 ?auto_138553 ) ) ( not ( = ?auto_138555 ?auto_138552 ) ) ( not ( = ?auto_138548 ?auto_138555 ) ) ( not ( = ?auto_138549 ?auto_138555 ) ) ( not ( = ?auto_138550 ?auto_138555 ) ) ( not ( = ?auto_138551 ?auto_138555 ) ) ( ON ?auto_138551 ?auto_138552 ) ( ON ?auto_138550 ?auto_138551 ) ( ON ?auto_138549 ?auto_138550 ) ( ON ?auto_138548 ?auto_138549 ) ( CLEAR ?auto_138548 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_138555 ?auto_138554 ?auto_138553 ?auto_138552 ?auto_138551 ?auto_138550 ?auto_138549 )
      ( MAKE-6PILE ?auto_138548 ?auto_138549 ?auto_138550 ?auto_138551 ?auto_138552 ?auto_138553 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_138562 - BLOCK
      ?auto_138563 - BLOCK
      ?auto_138564 - BLOCK
      ?auto_138565 - BLOCK
      ?auto_138566 - BLOCK
      ?auto_138567 - BLOCK
    )
    :vars
    (
      ?auto_138568 - BLOCK
      ?auto_138569 - BLOCK
      ?auto_138570 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_138562 ?auto_138563 ) ) ( not ( = ?auto_138562 ?auto_138564 ) ) ( not ( = ?auto_138562 ?auto_138565 ) ) ( not ( = ?auto_138562 ?auto_138566 ) ) ( not ( = ?auto_138562 ?auto_138567 ) ) ( not ( = ?auto_138563 ?auto_138564 ) ) ( not ( = ?auto_138563 ?auto_138565 ) ) ( not ( = ?auto_138563 ?auto_138566 ) ) ( not ( = ?auto_138563 ?auto_138567 ) ) ( not ( = ?auto_138564 ?auto_138565 ) ) ( not ( = ?auto_138564 ?auto_138566 ) ) ( not ( = ?auto_138564 ?auto_138567 ) ) ( not ( = ?auto_138565 ?auto_138566 ) ) ( not ( = ?auto_138565 ?auto_138567 ) ) ( not ( = ?auto_138566 ?auto_138567 ) ) ( ON ?auto_138567 ?auto_138568 ) ( not ( = ?auto_138562 ?auto_138568 ) ) ( not ( = ?auto_138563 ?auto_138568 ) ) ( not ( = ?auto_138564 ?auto_138568 ) ) ( not ( = ?auto_138565 ?auto_138568 ) ) ( not ( = ?auto_138566 ?auto_138568 ) ) ( not ( = ?auto_138567 ?auto_138568 ) ) ( ON ?auto_138566 ?auto_138567 ) ( ON-TABLE ?auto_138569 ) ( ON ?auto_138568 ?auto_138569 ) ( not ( = ?auto_138569 ?auto_138568 ) ) ( not ( = ?auto_138569 ?auto_138567 ) ) ( not ( = ?auto_138569 ?auto_138566 ) ) ( not ( = ?auto_138562 ?auto_138569 ) ) ( not ( = ?auto_138563 ?auto_138569 ) ) ( not ( = ?auto_138564 ?auto_138569 ) ) ( not ( = ?auto_138565 ?auto_138569 ) ) ( ON ?auto_138565 ?auto_138566 ) ( ON ?auto_138564 ?auto_138565 ) ( ON ?auto_138563 ?auto_138564 ) ( CLEAR ?auto_138563 ) ( ON ?auto_138562 ?auto_138570 ) ( CLEAR ?auto_138562 ) ( HAND-EMPTY ) ( not ( = ?auto_138562 ?auto_138570 ) ) ( not ( = ?auto_138563 ?auto_138570 ) ) ( not ( = ?auto_138564 ?auto_138570 ) ) ( not ( = ?auto_138565 ?auto_138570 ) ) ( not ( = ?auto_138566 ?auto_138570 ) ) ( not ( = ?auto_138567 ?auto_138570 ) ) ( not ( = ?auto_138568 ?auto_138570 ) ) ( not ( = ?auto_138569 ?auto_138570 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_138562 ?auto_138570 )
      ( MAKE-6PILE ?auto_138562 ?auto_138563 ?auto_138564 ?auto_138565 ?auto_138566 ?auto_138567 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_138571 - BLOCK
      ?auto_138572 - BLOCK
      ?auto_138573 - BLOCK
      ?auto_138574 - BLOCK
      ?auto_138575 - BLOCK
      ?auto_138576 - BLOCK
    )
    :vars
    (
      ?auto_138577 - BLOCK
      ?auto_138578 - BLOCK
      ?auto_138579 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_138571 ?auto_138572 ) ) ( not ( = ?auto_138571 ?auto_138573 ) ) ( not ( = ?auto_138571 ?auto_138574 ) ) ( not ( = ?auto_138571 ?auto_138575 ) ) ( not ( = ?auto_138571 ?auto_138576 ) ) ( not ( = ?auto_138572 ?auto_138573 ) ) ( not ( = ?auto_138572 ?auto_138574 ) ) ( not ( = ?auto_138572 ?auto_138575 ) ) ( not ( = ?auto_138572 ?auto_138576 ) ) ( not ( = ?auto_138573 ?auto_138574 ) ) ( not ( = ?auto_138573 ?auto_138575 ) ) ( not ( = ?auto_138573 ?auto_138576 ) ) ( not ( = ?auto_138574 ?auto_138575 ) ) ( not ( = ?auto_138574 ?auto_138576 ) ) ( not ( = ?auto_138575 ?auto_138576 ) ) ( ON ?auto_138576 ?auto_138577 ) ( not ( = ?auto_138571 ?auto_138577 ) ) ( not ( = ?auto_138572 ?auto_138577 ) ) ( not ( = ?auto_138573 ?auto_138577 ) ) ( not ( = ?auto_138574 ?auto_138577 ) ) ( not ( = ?auto_138575 ?auto_138577 ) ) ( not ( = ?auto_138576 ?auto_138577 ) ) ( ON ?auto_138575 ?auto_138576 ) ( ON-TABLE ?auto_138578 ) ( ON ?auto_138577 ?auto_138578 ) ( not ( = ?auto_138578 ?auto_138577 ) ) ( not ( = ?auto_138578 ?auto_138576 ) ) ( not ( = ?auto_138578 ?auto_138575 ) ) ( not ( = ?auto_138571 ?auto_138578 ) ) ( not ( = ?auto_138572 ?auto_138578 ) ) ( not ( = ?auto_138573 ?auto_138578 ) ) ( not ( = ?auto_138574 ?auto_138578 ) ) ( ON ?auto_138574 ?auto_138575 ) ( ON ?auto_138573 ?auto_138574 ) ( ON ?auto_138571 ?auto_138579 ) ( CLEAR ?auto_138571 ) ( not ( = ?auto_138571 ?auto_138579 ) ) ( not ( = ?auto_138572 ?auto_138579 ) ) ( not ( = ?auto_138573 ?auto_138579 ) ) ( not ( = ?auto_138574 ?auto_138579 ) ) ( not ( = ?auto_138575 ?auto_138579 ) ) ( not ( = ?auto_138576 ?auto_138579 ) ) ( not ( = ?auto_138577 ?auto_138579 ) ) ( not ( = ?auto_138578 ?auto_138579 ) ) ( HOLDING ?auto_138572 ) ( CLEAR ?auto_138573 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_138578 ?auto_138577 ?auto_138576 ?auto_138575 ?auto_138574 ?auto_138573 ?auto_138572 )
      ( MAKE-6PILE ?auto_138571 ?auto_138572 ?auto_138573 ?auto_138574 ?auto_138575 ?auto_138576 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_138580 - BLOCK
      ?auto_138581 - BLOCK
      ?auto_138582 - BLOCK
      ?auto_138583 - BLOCK
      ?auto_138584 - BLOCK
      ?auto_138585 - BLOCK
    )
    :vars
    (
      ?auto_138588 - BLOCK
      ?auto_138587 - BLOCK
      ?auto_138586 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_138580 ?auto_138581 ) ) ( not ( = ?auto_138580 ?auto_138582 ) ) ( not ( = ?auto_138580 ?auto_138583 ) ) ( not ( = ?auto_138580 ?auto_138584 ) ) ( not ( = ?auto_138580 ?auto_138585 ) ) ( not ( = ?auto_138581 ?auto_138582 ) ) ( not ( = ?auto_138581 ?auto_138583 ) ) ( not ( = ?auto_138581 ?auto_138584 ) ) ( not ( = ?auto_138581 ?auto_138585 ) ) ( not ( = ?auto_138582 ?auto_138583 ) ) ( not ( = ?auto_138582 ?auto_138584 ) ) ( not ( = ?auto_138582 ?auto_138585 ) ) ( not ( = ?auto_138583 ?auto_138584 ) ) ( not ( = ?auto_138583 ?auto_138585 ) ) ( not ( = ?auto_138584 ?auto_138585 ) ) ( ON ?auto_138585 ?auto_138588 ) ( not ( = ?auto_138580 ?auto_138588 ) ) ( not ( = ?auto_138581 ?auto_138588 ) ) ( not ( = ?auto_138582 ?auto_138588 ) ) ( not ( = ?auto_138583 ?auto_138588 ) ) ( not ( = ?auto_138584 ?auto_138588 ) ) ( not ( = ?auto_138585 ?auto_138588 ) ) ( ON ?auto_138584 ?auto_138585 ) ( ON-TABLE ?auto_138587 ) ( ON ?auto_138588 ?auto_138587 ) ( not ( = ?auto_138587 ?auto_138588 ) ) ( not ( = ?auto_138587 ?auto_138585 ) ) ( not ( = ?auto_138587 ?auto_138584 ) ) ( not ( = ?auto_138580 ?auto_138587 ) ) ( not ( = ?auto_138581 ?auto_138587 ) ) ( not ( = ?auto_138582 ?auto_138587 ) ) ( not ( = ?auto_138583 ?auto_138587 ) ) ( ON ?auto_138583 ?auto_138584 ) ( ON ?auto_138582 ?auto_138583 ) ( ON ?auto_138580 ?auto_138586 ) ( not ( = ?auto_138580 ?auto_138586 ) ) ( not ( = ?auto_138581 ?auto_138586 ) ) ( not ( = ?auto_138582 ?auto_138586 ) ) ( not ( = ?auto_138583 ?auto_138586 ) ) ( not ( = ?auto_138584 ?auto_138586 ) ) ( not ( = ?auto_138585 ?auto_138586 ) ) ( not ( = ?auto_138588 ?auto_138586 ) ) ( not ( = ?auto_138587 ?auto_138586 ) ) ( CLEAR ?auto_138582 ) ( ON ?auto_138581 ?auto_138580 ) ( CLEAR ?auto_138581 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_138586 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_138586 ?auto_138580 )
      ( MAKE-6PILE ?auto_138580 ?auto_138581 ?auto_138582 ?auto_138583 ?auto_138584 ?auto_138585 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_138589 - BLOCK
      ?auto_138590 - BLOCK
      ?auto_138591 - BLOCK
      ?auto_138592 - BLOCK
      ?auto_138593 - BLOCK
      ?auto_138594 - BLOCK
    )
    :vars
    (
      ?auto_138595 - BLOCK
      ?auto_138597 - BLOCK
      ?auto_138596 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_138589 ?auto_138590 ) ) ( not ( = ?auto_138589 ?auto_138591 ) ) ( not ( = ?auto_138589 ?auto_138592 ) ) ( not ( = ?auto_138589 ?auto_138593 ) ) ( not ( = ?auto_138589 ?auto_138594 ) ) ( not ( = ?auto_138590 ?auto_138591 ) ) ( not ( = ?auto_138590 ?auto_138592 ) ) ( not ( = ?auto_138590 ?auto_138593 ) ) ( not ( = ?auto_138590 ?auto_138594 ) ) ( not ( = ?auto_138591 ?auto_138592 ) ) ( not ( = ?auto_138591 ?auto_138593 ) ) ( not ( = ?auto_138591 ?auto_138594 ) ) ( not ( = ?auto_138592 ?auto_138593 ) ) ( not ( = ?auto_138592 ?auto_138594 ) ) ( not ( = ?auto_138593 ?auto_138594 ) ) ( ON ?auto_138594 ?auto_138595 ) ( not ( = ?auto_138589 ?auto_138595 ) ) ( not ( = ?auto_138590 ?auto_138595 ) ) ( not ( = ?auto_138591 ?auto_138595 ) ) ( not ( = ?auto_138592 ?auto_138595 ) ) ( not ( = ?auto_138593 ?auto_138595 ) ) ( not ( = ?auto_138594 ?auto_138595 ) ) ( ON ?auto_138593 ?auto_138594 ) ( ON-TABLE ?auto_138597 ) ( ON ?auto_138595 ?auto_138597 ) ( not ( = ?auto_138597 ?auto_138595 ) ) ( not ( = ?auto_138597 ?auto_138594 ) ) ( not ( = ?auto_138597 ?auto_138593 ) ) ( not ( = ?auto_138589 ?auto_138597 ) ) ( not ( = ?auto_138590 ?auto_138597 ) ) ( not ( = ?auto_138591 ?auto_138597 ) ) ( not ( = ?auto_138592 ?auto_138597 ) ) ( ON ?auto_138592 ?auto_138593 ) ( ON ?auto_138589 ?auto_138596 ) ( not ( = ?auto_138589 ?auto_138596 ) ) ( not ( = ?auto_138590 ?auto_138596 ) ) ( not ( = ?auto_138591 ?auto_138596 ) ) ( not ( = ?auto_138592 ?auto_138596 ) ) ( not ( = ?auto_138593 ?auto_138596 ) ) ( not ( = ?auto_138594 ?auto_138596 ) ) ( not ( = ?auto_138595 ?auto_138596 ) ) ( not ( = ?auto_138597 ?auto_138596 ) ) ( ON ?auto_138590 ?auto_138589 ) ( CLEAR ?auto_138590 ) ( ON-TABLE ?auto_138596 ) ( HOLDING ?auto_138591 ) ( CLEAR ?auto_138592 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_138597 ?auto_138595 ?auto_138594 ?auto_138593 ?auto_138592 ?auto_138591 )
      ( MAKE-6PILE ?auto_138589 ?auto_138590 ?auto_138591 ?auto_138592 ?auto_138593 ?auto_138594 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_138598 - BLOCK
      ?auto_138599 - BLOCK
      ?auto_138600 - BLOCK
      ?auto_138601 - BLOCK
      ?auto_138602 - BLOCK
      ?auto_138603 - BLOCK
    )
    :vars
    (
      ?auto_138606 - BLOCK
      ?auto_138604 - BLOCK
      ?auto_138605 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_138598 ?auto_138599 ) ) ( not ( = ?auto_138598 ?auto_138600 ) ) ( not ( = ?auto_138598 ?auto_138601 ) ) ( not ( = ?auto_138598 ?auto_138602 ) ) ( not ( = ?auto_138598 ?auto_138603 ) ) ( not ( = ?auto_138599 ?auto_138600 ) ) ( not ( = ?auto_138599 ?auto_138601 ) ) ( not ( = ?auto_138599 ?auto_138602 ) ) ( not ( = ?auto_138599 ?auto_138603 ) ) ( not ( = ?auto_138600 ?auto_138601 ) ) ( not ( = ?auto_138600 ?auto_138602 ) ) ( not ( = ?auto_138600 ?auto_138603 ) ) ( not ( = ?auto_138601 ?auto_138602 ) ) ( not ( = ?auto_138601 ?auto_138603 ) ) ( not ( = ?auto_138602 ?auto_138603 ) ) ( ON ?auto_138603 ?auto_138606 ) ( not ( = ?auto_138598 ?auto_138606 ) ) ( not ( = ?auto_138599 ?auto_138606 ) ) ( not ( = ?auto_138600 ?auto_138606 ) ) ( not ( = ?auto_138601 ?auto_138606 ) ) ( not ( = ?auto_138602 ?auto_138606 ) ) ( not ( = ?auto_138603 ?auto_138606 ) ) ( ON ?auto_138602 ?auto_138603 ) ( ON-TABLE ?auto_138604 ) ( ON ?auto_138606 ?auto_138604 ) ( not ( = ?auto_138604 ?auto_138606 ) ) ( not ( = ?auto_138604 ?auto_138603 ) ) ( not ( = ?auto_138604 ?auto_138602 ) ) ( not ( = ?auto_138598 ?auto_138604 ) ) ( not ( = ?auto_138599 ?auto_138604 ) ) ( not ( = ?auto_138600 ?auto_138604 ) ) ( not ( = ?auto_138601 ?auto_138604 ) ) ( ON ?auto_138601 ?auto_138602 ) ( ON ?auto_138598 ?auto_138605 ) ( not ( = ?auto_138598 ?auto_138605 ) ) ( not ( = ?auto_138599 ?auto_138605 ) ) ( not ( = ?auto_138600 ?auto_138605 ) ) ( not ( = ?auto_138601 ?auto_138605 ) ) ( not ( = ?auto_138602 ?auto_138605 ) ) ( not ( = ?auto_138603 ?auto_138605 ) ) ( not ( = ?auto_138606 ?auto_138605 ) ) ( not ( = ?auto_138604 ?auto_138605 ) ) ( ON ?auto_138599 ?auto_138598 ) ( ON-TABLE ?auto_138605 ) ( CLEAR ?auto_138601 ) ( ON ?auto_138600 ?auto_138599 ) ( CLEAR ?auto_138600 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_138605 ?auto_138598 ?auto_138599 )
      ( MAKE-6PILE ?auto_138598 ?auto_138599 ?auto_138600 ?auto_138601 ?auto_138602 ?auto_138603 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_138607 - BLOCK
      ?auto_138608 - BLOCK
      ?auto_138609 - BLOCK
      ?auto_138610 - BLOCK
      ?auto_138611 - BLOCK
      ?auto_138612 - BLOCK
    )
    :vars
    (
      ?auto_138614 - BLOCK
      ?auto_138615 - BLOCK
      ?auto_138613 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_138607 ?auto_138608 ) ) ( not ( = ?auto_138607 ?auto_138609 ) ) ( not ( = ?auto_138607 ?auto_138610 ) ) ( not ( = ?auto_138607 ?auto_138611 ) ) ( not ( = ?auto_138607 ?auto_138612 ) ) ( not ( = ?auto_138608 ?auto_138609 ) ) ( not ( = ?auto_138608 ?auto_138610 ) ) ( not ( = ?auto_138608 ?auto_138611 ) ) ( not ( = ?auto_138608 ?auto_138612 ) ) ( not ( = ?auto_138609 ?auto_138610 ) ) ( not ( = ?auto_138609 ?auto_138611 ) ) ( not ( = ?auto_138609 ?auto_138612 ) ) ( not ( = ?auto_138610 ?auto_138611 ) ) ( not ( = ?auto_138610 ?auto_138612 ) ) ( not ( = ?auto_138611 ?auto_138612 ) ) ( ON ?auto_138612 ?auto_138614 ) ( not ( = ?auto_138607 ?auto_138614 ) ) ( not ( = ?auto_138608 ?auto_138614 ) ) ( not ( = ?auto_138609 ?auto_138614 ) ) ( not ( = ?auto_138610 ?auto_138614 ) ) ( not ( = ?auto_138611 ?auto_138614 ) ) ( not ( = ?auto_138612 ?auto_138614 ) ) ( ON ?auto_138611 ?auto_138612 ) ( ON-TABLE ?auto_138615 ) ( ON ?auto_138614 ?auto_138615 ) ( not ( = ?auto_138615 ?auto_138614 ) ) ( not ( = ?auto_138615 ?auto_138612 ) ) ( not ( = ?auto_138615 ?auto_138611 ) ) ( not ( = ?auto_138607 ?auto_138615 ) ) ( not ( = ?auto_138608 ?auto_138615 ) ) ( not ( = ?auto_138609 ?auto_138615 ) ) ( not ( = ?auto_138610 ?auto_138615 ) ) ( ON ?auto_138607 ?auto_138613 ) ( not ( = ?auto_138607 ?auto_138613 ) ) ( not ( = ?auto_138608 ?auto_138613 ) ) ( not ( = ?auto_138609 ?auto_138613 ) ) ( not ( = ?auto_138610 ?auto_138613 ) ) ( not ( = ?auto_138611 ?auto_138613 ) ) ( not ( = ?auto_138612 ?auto_138613 ) ) ( not ( = ?auto_138614 ?auto_138613 ) ) ( not ( = ?auto_138615 ?auto_138613 ) ) ( ON ?auto_138608 ?auto_138607 ) ( ON-TABLE ?auto_138613 ) ( ON ?auto_138609 ?auto_138608 ) ( CLEAR ?auto_138609 ) ( HOLDING ?auto_138610 ) ( CLEAR ?auto_138611 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_138615 ?auto_138614 ?auto_138612 ?auto_138611 ?auto_138610 )
      ( MAKE-6PILE ?auto_138607 ?auto_138608 ?auto_138609 ?auto_138610 ?auto_138611 ?auto_138612 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_138616 - BLOCK
      ?auto_138617 - BLOCK
      ?auto_138618 - BLOCK
      ?auto_138619 - BLOCK
      ?auto_138620 - BLOCK
      ?auto_138621 - BLOCK
    )
    :vars
    (
      ?auto_138624 - BLOCK
      ?auto_138623 - BLOCK
      ?auto_138622 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_138616 ?auto_138617 ) ) ( not ( = ?auto_138616 ?auto_138618 ) ) ( not ( = ?auto_138616 ?auto_138619 ) ) ( not ( = ?auto_138616 ?auto_138620 ) ) ( not ( = ?auto_138616 ?auto_138621 ) ) ( not ( = ?auto_138617 ?auto_138618 ) ) ( not ( = ?auto_138617 ?auto_138619 ) ) ( not ( = ?auto_138617 ?auto_138620 ) ) ( not ( = ?auto_138617 ?auto_138621 ) ) ( not ( = ?auto_138618 ?auto_138619 ) ) ( not ( = ?auto_138618 ?auto_138620 ) ) ( not ( = ?auto_138618 ?auto_138621 ) ) ( not ( = ?auto_138619 ?auto_138620 ) ) ( not ( = ?auto_138619 ?auto_138621 ) ) ( not ( = ?auto_138620 ?auto_138621 ) ) ( ON ?auto_138621 ?auto_138624 ) ( not ( = ?auto_138616 ?auto_138624 ) ) ( not ( = ?auto_138617 ?auto_138624 ) ) ( not ( = ?auto_138618 ?auto_138624 ) ) ( not ( = ?auto_138619 ?auto_138624 ) ) ( not ( = ?auto_138620 ?auto_138624 ) ) ( not ( = ?auto_138621 ?auto_138624 ) ) ( ON ?auto_138620 ?auto_138621 ) ( ON-TABLE ?auto_138623 ) ( ON ?auto_138624 ?auto_138623 ) ( not ( = ?auto_138623 ?auto_138624 ) ) ( not ( = ?auto_138623 ?auto_138621 ) ) ( not ( = ?auto_138623 ?auto_138620 ) ) ( not ( = ?auto_138616 ?auto_138623 ) ) ( not ( = ?auto_138617 ?auto_138623 ) ) ( not ( = ?auto_138618 ?auto_138623 ) ) ( not ( = ?auto_138619 ?auto_138623 ) ) ( ON ?auto_138616 ?auto_138622 ) ( not ( = ?auto_138616 ?auto_138622 ) ) ( not ( = ?auto_138617 ?auto_138622 ) ) ( not ( = ?auto_138618 ?auto_138622 ) ) ( not ( = ?auto_138619 ?auto_138622 ) ) ( not ( = ?auto_138620 ?auto_138622 ) ) ( not ( = ?auto_138621 ?auto_138622 ) ) ( not ( = ?auto_138624 ?auto_138622 ) ) ( not ( = ?auto_138623 ?auto_138622 ) ) ( ON ?auto_138617 ?auto_138616 ) ( ON-TABLE ?auto_138622 ) ( ON ?auto_138618 ?auto_138617 ) ( CLEAR ?auto_138620 ) ( ON ?auto_138619 ?auto_138618 ) ( CLEAR ?auto_138619 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_138622 ?auto_138616 ?auto_138617 ?auto_138618 )
      ( MAKE-6PILE ?auto_138616 ?auto_138617 ?auto_138618 ?auto_138619 ?auto_138620 ?auto_138621 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_138625 - BLOCK
      ?auto_138626 - BLOCK
      ?auto_138627 - BLOCK
      ?auto_138628 - BLOCK
      ?auto_138629 - BLOCK
      ?auto_138630 - BLOCK
    )
    :vars
    (
      ?auto_138631 - BLOCK
      ?auto_138633 - BLOCK
      ?auto_138632 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_138625 ?auto_138626 ) ) ( not ( = ?auto_138625 ?auto_138627 ) ) ( not ( = ?auto_138625 ?auto_138628 ) ) ( not ( = ?auto_138625 ?auto_138629 ) ) ( not ( = ?auto_138625 ?auto_138630 ) ) ( not ( = ?auto_138626 ?auto_138627 ) ) ( not ( = ?auto_138626 ?auto_138628 ) ) ( not ( = ?auto_138626 ?auto_138629 ) ) ( not ( = ?auto_138626 ?auto_138630 ) ) ( not ( = ?auto_138627 ?auto_138628 ) ) ( not ( = ?auto_138627 ?auto_138629 ) ) ( not ( = ?auto_138627 ?auto_138630 ) ) ( not ( = ?auto_138628 ?auto_138629 ) ) ( not ( = ?auto_138628 ?auto_138630 ) ) ( not ( = ?auto_138629 ?auto_138630 ) ) ( ON ?auto_138630 ?auto_138631 ) ( not ( = ?auto_138625 ?auto_138631 ) ) ( not ( = ?auto_138626 ?auto_138631 ) ) ( not ( = ?auto_138627 ?auto_138631 ) ) ( not ( = ?auto_138628 ?auto_138631 ) ) ( not ( = ?auto_138629 ?auto_138631 ) ) ( not ( = ?auto_138630 ?auto_138631 ) ) ( ON-TABLE ?auto_138633 ) ( ON ?auto_138631 ?auto_138633 ) ( not ( = ?auto_138633 ?auto_138631 ) ) ( not ( = ?auto_138633 ?auto_138630 ) ) ( not ( = ?auto_138633 ?auto_138629 ) ) ( not ( = ?auto_138625 ?auto_138633 ) ) ( not ( = ?auto_138626 ?auto_138633 ) ) ( not ( = ?auto_138627 ?auto_138633 ) ) ( not ( = ?auto_138628 ?auto_138633 ) ) ( ON ?auto_138625 ?auto_138632 ) ( not ( = ?auto_138625 ?auto_138632 ) ) ( not ( = ?auto_138626 ?auto_138632 ) ) ( not ( = ?auto_138627 ?auto_138632 ) ) ( not ( = ?auto_138628 ?auto_138632 ) ) ( not ( = ?auto_138629 ?auto_138632 ) ) ( not ( = ?auto_138630 ?auto_138632 ) ) ( not ( = ?auto_138631 ?auto_138632 ) ) ( not ( = ?auto_138633 ?auto_138632 ) ) ( ON ?auto_138626 ?auto_138625 ) ( ON-TABLE ?auto_138632 ) ( ON ?auto_138627 ?auto_138626 ) ( ON ?auto_138628 ?auto_138627 ) ( CLEAR ?auto_138628 ) ( HOLDING ?auto_138629 ) ( CLEAR ?auto_138630 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_138633 ?auto_138631 ?auto_138630 ?auto_138629 )
      ( MAKE-6PILE ?auto_138625 ?auto_138626 ?auto_138627 ?auto_138628 ?auto_138629 ?auto_138630 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_138634 - BLOCK
      ?auto_138635 - BLOCK
      ?auto_138636 - BLOCK
      ?auto_138637 - BLOCK
      ?auto_138638 - BLOCK
      ?auto_138639 - BLOCK
    )
    :vars
    (
      ?auto_138640 - BLOCK
      ?auto_138642 - BLOCK
      ?auto_138641 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_138634 ?auto_138635 ) ) ( not ( = ?auto_138634 ?auto_138636 ) ) ( not ( = ?auto_138634 ?auto_138637 ) ) ( not ( = ?auto_138634 ?auto_138638 ) ) ( not ( = ?auto_138634 ?auto_138639 ) ) ( not ( = ?auto_138635 ?auto_138636 ) ) ( not ( = ?auto_138635 ?auto_138637 ) ) ( not ( = ?auto_138635 ?auto_138638 ) ) ( not ( = ?auto_138635 ?auto_138639 ) ) ( not ( = ?auto_138636 ?auto_138637 ) ) ( not ( = ?auto_138636 ?auto_138638 ) ) ( not ( = ?auto_138636 ?auto_138639 ) ) ( not ( = ?auto_138637 ?auto_138638 ) ) ( not ( = ?auto_138637 ?auto_138639 ) ) ( not ( = ?auto_138638 ?auto_138639 ) ) ( ON ?auto_138639 ?auto_138640 ) ( not ( = ?auto_138634 ?auto_138640 ) ) ( not ( = ?auto_138635 ?auto_138640 ) ) ( not ( = ?auto_138636 ?auto_138640 ) ) ( not ( = ?auto_138637 ?auto_138640 ) ) ( not ( = ?auto_138638 ?auto_138640 ) ) ( not ( = ?auto_138639 ?auto_138640 ) ) ( ON-TABLE ?auto_138642 ) ( ON ?auto_138640 ?auto_138642 ) ( not ( = ?auto_138642 ?auto_138640 ) ) ( not ( = ?auto_138642 ?auto_138639 ) ) ( not ( = ?auto_138642 ?auto_138638 ) ) ( not ( = ?auto_138634 ?auto_138642 ) ) ( not ( = ?auto_138635 ?auto_138642 ) ) ( not ( = ?auto_138636 ?auto_138642 ) ) ( not ( = ?auto_138637 ?auto_138642 ) ) ( ON ?auto_138634 ?auto_138641 ) ( not ( = ?auto_138634 ?auto_138641 ) ) ( not ( = ?auto_138635 ?auto_138641 ) ) ( not ( = ?auto_138636 ?auto_138641 ) ) ( not ( = ?auto_138637 ?auto_138641 ) ) ( not ( = ?auto_138638 ?auto_138641 ) ) ( not ( = ?auto_138639 ?auto_138641 ) ) ( not ( = ?auto_138640 ?auto_138641 ) ) ( not ( = ?auto_138642 ?auto_138641 ) ) ( ON ?auto_138635 ?auto_138634 ) ( ON-TABLE ?auto_138641 ) ( ON ?auto_138636 ?auto_138635 ) ( ON ?auto_138637 ?auto_138636 ) ( CLEAR ?auto_138639 ) ( ON ?auto_138638 ?auto_138637 ) ( CLEAR ?auto_138638 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_138641 ?auto_138634 ?auto_138635 ?auto_138636 ?auto_138637 )
      ( MAKE-6PILE ?auto_138634 ?auto_138635 ?auto_138636 ?auto_138637 ?auto_138638 ?auto_138639 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_138643 - BLOCK
      ?auto_138644 - BLOCK
      ?auto_138645 - BLOCK
      ?auto_138646 - BLOCK
      ?auto_138647 - BLOCK
      ?auto_138648 - BLOCK
    )
    :vars
    (
      ?auto_138651 - BLOCK
      ?auto_138650 - BLOCK
      ?auto_138649 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_138643 ?auto_138644 ) ) ( not ( = ?auto_138643 ?auto_138645 ) ) ( not ( = ?auto_138643 ?auto_138646 ) ) ( not ( = ?auto_138643 ?auto_138647 ) ) ( not ( = ?auto_138643 ?auto_138648 ) ) ( not ( = ?auto_138644 ?auto_138645 ) ) ( not ( = ?auto_138644 ?auto_138646 ) ) ( not ( = ?auto_138644 ?auto_138647 ) ) ( not ( = ?auto_138644 ?auto_138648 ) ) ( not ( = ?auto_138645 ?auto_138646 ) ) ( not ( = ?auto_138645 ?auto_138647 ) ) ( not ( = ?auto_138645 ?auto_138648 ) ) ( not ( = ?auto_138646 ?auto_138647 ) ) ( not ( = ?auto_138646 ?auto_138648 ) ) ( not ( = ?auto_138647 ?auto_138648 ) ) ( not ( = ?auto_138643 ?auto_138651 ) ) ( not ( = ?auto_138644 ?auto_138651 ) ) ( not ( = ?auto_138645 ?auto_138651 ) ) ( not ( = ?auto_138646 ?auto_138651 ) ) ( not ( = ?auto_138647 ?auto_138651 ) ) ( not ( = ?auto_138648 ?auto_138651 ) ) ( ON-TABLE ?auto_138650 ) ( ON ?auto_138651 ?auto_138650 ) ( not ( = ?auto_138650 ?auto_138651 ) ) ( not ( = ?auto_138650 ?auto_138648 ) ) ( not ( = ?auto_138650 ?auto_138647 ) ) ( not ( = ?auto_138643 ?auto_138650 ) ) ( not ( = ?auto_138644 ?auto_138650 ) ) ( not ( = ?auto_138645 ?auto_138650 ) ) ( not ( = ?auto_138646 ?auto_138650 ) ) ( ON ?auto_138643 ?auto_138649 ) ( not ( = ?auto_138643 ?auto_138649 ) ) ( not ( = ?auto_138644 ?auto_138649 ) ) ( not ( = ?auto_138645 ?auto_138649 ) ) ( not ( = ?auto_138646 ?auto_138649 ) ) ( not ( = ?auto_138647 ?auto_138649 ) ) ( not ( = ?auto_138648 ?auto_138649 ) ) ( not ( = ?auto_138651 ?auto_138649 ) ) ( not ( = ?auto_138650 ?auto_138649 ) ) ( ON ?auto_138644 ?auto_138643 ) ( ON-TABLE ?auto_138649 ) ( ON ?auto_138645 ?auto_138644 ) ( ON ?auto_138646 ?auto_138645 ) ( ON ?auto_138647 ?auto_138646 ) ( CLEAR ?auto_138647 ) ( HOLDING ?auto_138648 ) ( CLEAR ?auto_138651 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_138650 ?auto_138651 ?auto_138648 )
      ( MAKE-6PILE ?auto_138643 ?auto_138644 ?auto_138645 ?auto_138646 ?auto_138647 ?auto_138648 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_138652 - BLOCK
      ?auto_138653 - BLOCK
      ?auto_138654 - BLOCK
      ?auto_138655 - BLOCK
      ?auto_138656 - BLOCK
      ?auto_138657 - BLOCK
    )
    :vars
    (
      ?auto_138658 - BLOCK
      ?auto_138660 - BLOCK
      ?auto_138659 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_138652 ?auto_138653 ) ) ( not ( = ?auto_138652 ?auto_138654 ) ) ( not ( = ?auto_138652 ?auto_138655 ) ) ( not ( = ?auto_138652 ?auto_138656 ) ) ( not ( = ?auto_138652 ?auto_138657 ) ) ( not ( = ?auto_138653 ?auto_138654 ) ) ( not ( = ?auto_138653 ?auto_138655 ) ) ( not ( = ?auto_138653 ?auto_138656 ) ) ( not ( = ?auto_138653 ?auto_138657 ) ) ( not ( = ?auto_138654 ?auto_138655 ) ) ( not ( = ?auto_138654 ?auto_138656 ) ) ( not ( = ?auto_138654 ?auto_138657 ) ) ( not ( = ?auto_138655 ?auto_138656 ) ) ( not ( = ?auto_138655 ?auto_138657 ) ) ( not ( = ?auto_138656 ?auto_138657 ) ) ( not ( = ?auto_138652 ?auto_138658 ) ) ( not ( = ?auto_138653 ?auto_138658 ) ) ( not ( = ?auto_138654 ?auto_138658 ) ) ( not ( = ?auto_138655 ?auto_138658 ) ) ( not ( = ?auto_138656 ?auto_138658 ) ) ( not ( = ?auto_138657 ?auto_138658 ) ) ( ON-TABLE ?auto_138660 ) ( ON ?auto_138658 ?auto_138660 ) ( not ( = ?auto_138660 ?auto_138658 ) ) ( not ( = ?auto_138660 ?auto_138657 ) ) ( not ( = ?auto_138660 ?auto_138656 ) ) ( not ( = ?auto_138652 ?auto_138660 ) ) ( not ( = ?auto_138653 ?auto_138660 ) ) ( not ( = ?auto_138654 ?auto_138660 ) ) ( not ( = ?auto_138655 ?auto_138660 ) ) ( ON ?auto_138652 ?auto_138659 ) ( not ( = ?auto_138652 ?auto_138659 ) ) ( not ( = ?auto_138653 ?auto_138659 ) ) ( not ( = ?auto_138654 ?auto_138659 ) ) ( not ( = ?auto_138655 ?auto_138659 ) ) ( not ( = ?auto_138656 ?auto_138659 ) ) ( not ( = ?auto_138657 ?auto_138659 ) ) ( not ( = ?auto_138658 ?auto_138659 ) ) ( not ( = ?auto_138660 ?auto_138659 ) ) ( ON ?auto_138653 ?auto_138652 ) ( ON-TABLE ?auto_138659 ) ( ON ?auto_138654 ?auto_138653 ) ( ON ?auto_138655 ?auto_138654 ) ( ON ?auto_138656 ?auto_138655 ) ( CLEAR ?auto_138658 ) ( ON ?auto_138657 ?auto_138656 ) ( CLEAR ?auto_138657 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_138659 ?auto_138652 ?auto_138653 ?auto_138654 ?auto_138655 ?auto_138656 )
      ( MAKE-6PILE ?auto_138652 ?auto_138653 ?auto_138654 ?auto_138655 ?auto_138656 ?auto_138657 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_138661 - BLOCK
      ?auto_138662 - BLOCK
      ?auto_138663 - BLOCK
      ?auto_138664 - BLOCK
      ?auto_138665 - BLOCK
      ?auto_138666 - BLOCK
    )
    :vars
    (
      ?auto_138668 - BLOCK
      ?auto_138669 - BLOCK
      ?auto_138667 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_138661 ?auto_138662 ) ) ( not ( = ?auto_138661 ?auto_138663 ) ) ( not ( = ?auto_138661 ?auto_138664 ) ) ( not ( = ?auto_138661 ?auto_138665 ) ) ( not ( = ?auto_138661 ?auto_138666 ) ) ( not ( = ?auto_138662 ?auto_138663 ) ) ( not ( = ?auto_138662 ?auto_138664 ) ) ( not ( = ?auto_138662 ?auto_138665 ) ) ( not ( = ?auto_138662 ?auto_138666 ) ) ( not ( = ?auto_138663 ?auto_138664 ) ) ( not ( = ?auto_138663 ?auto_138665 ) ) ( not ( = ?auto_138663 ?auto_138666 ) ) ( not ( = ?auto_138664 ?auto_138665 ) ) ( not ( = ?auto_138664 ?auto_138666 ) ) ( not ( = ?auto_138665 ?auto_138666 ) ) ( not ( = ?auto_138661 ?auto_138668 ) ) ( not ( = ?auto_138662 ?auto_138668 ) ) ( not ( = ?auto_138663 ?auto_138668 ) ) ( not ( = ?auto_138664 ?auto_138668 ) ) ( not ( = ?auto_138665 ?auto_138668 ) ) ( not ( = ?auto_138666 ?auto_138668 ) ) ( ON-TABLE ?auto_138669 ) ( not ( = ?auto_138669 ?auto_138668 ) ) ( not ( = ?auto_138669 ?auto_138666 ) ) ( not ( = ?auto_138669 ?auto_138665 ) ) ( not ( = ?auto_138661 ?auto_138669 ) ) ( not ( = ?auto_138662 ?auto_138669 ) ) ( not ( = ?auto_138663 ?auto_138669 ) ) ( not ( = ?auto_138664 ?auto_138669 ) ) ( ON ?auto_138661 ?auto_138667 ) ( not ( = ?auto_138661 ?auto_138667 ) ) ( not ( = ?auto_138662 ?auto_138667 ) ) ( not ( = ?auto_138663 ?auto_138667 ) ) ( not ( = ?auto_138664 ?auto_138667 ) ) ( not ( = ?auto_138665 ?auto_138667 ) ) ( not ( = ?auto_138666 ?auto_138667 ) ) ( not ( = ?auto_138668 ?auto_138667 ) ) ( not ( = ?auto_138669 ?auto_138667 ) ) ( ON ?auto_138662 ?auto_138661 ) ( ON-TABLE ?auto_138667 ) ( ON ?auto_138663 ?auto_138662 ) ( ON ?auto_138664 ?auto_138663 ) ( ON ?auto_138665 ?auto_138664 ) ( ON ?auto_138666 ?auto_138665 ) ( CLEAR ?auto_138666 ) ( HOLDING ?auto_138668 ) ( CLEAR ?auto_138669 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_138669 ?auto_138668 )
      ( MAKE-6PILE ?auto_138661 ?auto_138662 ?auto_138663 ?auto_138664 ?auto_138665 ?auto_138666 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_138670 - BLOCK
      ?auto_138671 - BLOCK
      ?auto_138672 - BLOCK
      ?auto_138673 - BLOCK
      ?auto_138674 - BLOCK
      ?auto_138675 - BLOCK
    )
    :vars
    (
      ?auto_138678 - BLOCK
      ?auto_138677 - BLOCK
      ?auto_138676 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_138670 ?auto_138671 ) ) ( not ( = ?auto_138670 ?auto_138672 ) ) ( not ( = ?auto_138670 ?auto_138673 ) ) ( not ( = ?auto_138670 ?auto_138674 ) ) ( not ( = ?auto_138670 ?auto_138675 ) ) ( not ( = ?auto_138671 ?auto_138672 ) ) ( not ( = ?auto_138671 ?auto_138673 ) ) ( not ( = ?auto_138671 ?auto_138674 ) ) ( not ( = ?auto_138671 ?auto_138675 ) ) ( not ( = ?auto_138672 ?auto_138673 ) ) ( not ( = ?auto_138672 ?auto_138674 ) ) ( not ( = ?auto_138672 ?auto_138675 ) ) ( not ( = ?auto_138673 ?auto_138674 ) ) ( not ( = ?auto_138673 ?auto_138675 ) ) ( not ( = ?auto_138674 ?auto_138675 ) ) ( not ( = ?auto_138670 ?auto_138678 ) ) ( not ( = ?auto_138671 ?auto_138678 ) ) ( not ( = ?auto_138672 ?auto_138678 ) ) ( not ( = ?auto_138673 ?auto_138678 ) ) ( not ( = ?auto_138674 ?auto_138678 ) ) ( not ( = ?auto_138675 ?auto_138678 ) ) ( ON-TABLE ?auto_138677 ) ( not ( = ?auto_138677 ?auto_138678 ) ) ( not ( = ?auto_138677 ?auto_138675 ) ) ( not ( = ?auto_138677 ?auto_138674 ) ) ( not ( = ?auto_138670 ?auto_138677 ) ) ( not ( = ?auto_138671 ?auto_138677 ) ) ( not ( = ?auto_138672 ?auto_138677 ) ) ( not ( = ?auto_138673 ?auto_138677 ) ) ( ON ?auto_138670 ?auto_138676 ) ( not ( = ?auto_138670 ?auto_138676 ) ) ( not ( = ?auto_138671 ?auto_138676 ) ) ( not ( = ?auto_138672 ?auto_138676 ) ) ( not ( = ?auto_138673 ?auto_138676 ) ) ( not ( = ?auto_138674 ?auto_138676 ) ) ( not ( = ?auto_138675 ?auto_138676 ) ) ( not ( = ?auto_138678 ?auto_138676 ) ) ( not ( = ?auto_138677 ?auto_138676 ) ) ( ON ?auto_138671 ?auto_138670 ) ( ON-TABLE ?auto_138676 ) ( ON ?auto_138672 ?auto_138671 ) ( ON ?auto_138673 ?auto_138672 ) ( ON ?auto_138674 ?auto_138673 ) ( ON ?auto_138675 ?auto_138674 ) ( CLEAR ?auto_138677 ) ( ON ?auto_138678 ?auto_138675 ) ( CLEAR ?auto_138678 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_138676 ?auto_138670 ?auto_138671 ?auto_138672 ?auto_138673 ?auto_138674 ?auto_138675 )
      ( MAKE-6PILE ?auto_138670 ?auto_138671 ?auto_138672 ?auto_138673 ?auto_138674 ?auto_138675 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_138679 - BLOCK
      ?auto_138680 - BLOCK
      ?auto_138681 - BLOCK
      ?auto_138682 - BLOCK
      ?auto_138683 - BLOCK
      ?auto_138684 - BLOCK
    )
    :vars
    (
      ?auto_138685 - BLOCK
      ?auto_138686 - BLOCK
      ?auto_138687 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_138679 ?auto_138680 ) ) ( not ( = ?auto_138679 ?auto_138681 ) ) ( not ( = ?auto_138679 ?auto_138682 ) ) ( not ( = ?auto_138679 ?auto_138683 ) ) ( not ( = ?auto_138679 ?auto_138684 ) ) ( not ( = ?auto_138680 ?auto_138681 ) ) ( not ( = ?auto_138680 ?auto_138682 ) ) ( not ( = ?auto_138680 ?auto_138683 ) ) ( not ( = ?auto_138680 ?auto_138684 ) ) ( not ( = ?auto_138681 ?auto_138682 ) ) ( not ( = ?auto_138681 ?auto_138683 ) ) ( not ( = ?auto_138681 ?auto_138684 ) ) ( not ( = ?auto_138682 ?auto_138683 ) ) ( not ( = ?auto_138682 ?auto_138684 ) ) ( not ( = ?auto_138683 ?auto_138684 ) ) ( not ( = ?auto_138679 ?auto_138685 ) ) ( not ( = ?auto_138680 ?auto_138685 ) ) ( not ( = ?auto_138681 ?auto_138685 ) ) ( not ( = ?auto_138682 ?auto_138685 ) ) ( not ( = ?auto_138683 ?auto_138685 ) ) ( not ( = ?auto_138684 ?auto_138685 ) ) ( not ( = ?auto_138686 ?auto_138685 ) ) ( not ( = ?auto_138686 ?auto_138684 ) ) ( not ( = ?auto_138686 ?auto_138683 ) ) ( not ( = ?auto_138679 ?auto_138686 ) ) ( not ( = ?auto_138680 ?auto_138686 ) ) ( not ( = ?auto_138681 ?auto_138686 ) ) ( not ( = ?auto_138682 ?auto_138686 ) ) ( ON ?auto_138679 ?auto_138687 ) ( not ( = ?auto_138679 ?auto_138687 ) ) ( not ( = ?auto_138680 ?auto_138687 ) ) ( not ( = ?auto_138681 ?auto_138687 ) ) ( not ( = ?auto_138682 ?auto_138687 ) ) ( not ( = ?auto_138683 ?auto_138687 ) ) ( not ( = ?auto_138684 ?auto_138687 ) ) ( not ( = ?auto_138685 ?auto_138687 ) ) ( not ( = ?auto_138686 ?auto_138687 ) ) ( ON ?auto_138680 ?auto_138679 ) ( ON-TABLE ?auto_138687 ) ( ON ?auto_138681 ?auto_138680 ) ( ON ?auto_138682 ?auto_138681 ) ( ON ?auto_138683 ?auto_138682 ) ( ON ?auto_138684 ?auto_138683 ) ( ON ?auto_138685 ?auto_138684 ) ( CLEAR ?auto_138685 ) ( HOLDING ?auto_138686 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_138686 )
      ( MAKE-6PILE ?auto_138679 ?auto_138680 ?auto_138681 ?auto_138682 ?auto_138683 ?auto_138684 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_138688 - BLOCK
      ?auto_138689 - BLOCK
      ?auto_138690 - BLOCK
      ?auto_138691 - BLOCK
      ?auto_138692 - BLOCK
      ?auto_138693 - BLOCK
    )
    :vars
    (
      ?auto_138694 - BLOCK
      ?auto_138696 - BLOCK
      ?auto_138695 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_138688 ?auto_138689 ) ) ( not ( = ?auto_138688 ?auto_138690 ) ) ( not ( = ?auto_138688 ?auto_138691 ) ) ( not ( = ?auto_138688 ?auto_138692 ) ) ( not ( = ?auto_138688 ?auto_138693 ) ) ( not ( = ?auto_138689 ?auto_138690 ) ) ( not ( = ?auto_138689 ?auto_138691 ) ) ( not ( = ?auto_138689 ?auto_138692 ) ) ( not ( = ?auto_138689 ?auto_138693 ) ) ( not ( = ?auto_138690 ?auto_138691 ) ) ( not ( = ?auto_138690 ?auto_138692 ) ) ( not ( = ?auto_138690 ?auto_138693 ) ) ( not ( = ?auto_138691 ?auto_138692 ) ) ( not ( = ?auto_138691 ?auto_138693 ) ) ( not ( = ?auto_138692 ?auto_138693 ) ) ( not ( = ?auto_138688 ?auto_138694 ) ) ( not ( = ?auto_138689 ?auto_138694 ) ) ( not ( = ?auto_138690 ?auto_138694 ) ) ( not ( = ?auto_138691 ?auto_138694 ) ) ( not ( = ?auto_138692 ?auto_138694 ) ) ( not ( = ?auto_138693 ?auto_138694 ) ) ( not ( = ?auto_138696 ?auto_138694 ) ) ( not ( = ?auto_138696 ?auto_138693 ) ) ( not ( = ?auto_138696 ?auto_138692 ) ) ( not ( = ?auto_138688 ?auto_138696 ) ) ( not ( = ?auto_138689 ?auto_138696 ) ) ( not ( = ?auto_138690 ?auto_138696 ) ) ( not ( = ?auto_138691 ?auto_138696 ) ) ( ON ?auto_138688 ?auto_138695 ) ( not ( = ?auto_138688 ?auto_138695 ) ) ( not ( = ?auto_138689 ?auto_138695 ) ) ( not ( = ?auto_138690 ?auto_138695 ) ) ( not ( = ?auto_138691 ?auto_138695 ) ) ( not ( = ?auto_138692 ?auto_138695 ) ) ( not ( = ?auto_138693 ?auto_138695 ) ) ( not ( = ?auto_138694 ?auto_138695 ) ) ( not ( = ?auto_138696 ?auto_138695 ) ) ( ON ?auto_138689 ?auto_138688 ) ( ON-TABLE ?auto_138695 ) ( ON ?auto_138690 ?auto_138689 ) ( ON ?auto_138691 ?auto_138690 ) ( ON ?auto_138692 ?auto_138691 ) ( ON ?auto_138693 ?auto_138692 ) ( ON ?auto_138694 ?auto_138693 ) ( ON ?auto_138696 ?auto_138694 ) ( CLEAR ?auto_138696 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_138695 ?auto_138688 ?auto_138689 ?auto_138690 ?auto_138691 ?auto_138692 ?auto_138693 ?auto_138694 )
      ( MAKE-6PILE ?auto_138688 ?auto_138689 ?auto_138690 ?auto_138691 ?auto_138692 ?auto_138693 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_138708 - BLOCK
    )
    :vars
    (
      ?auto_138709 - BLOCK
      ?auto_138711 - BLOCK
      ?auto_138710 - BLOCK
      ?auto_138714 - BLOCK
      ?auto_138715 - BLOCK
      ?auto_138713 - BLOCK
      ?auto_138712 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_138709 ?auto_138708 ) ( ON-TABLE ?auto_138708 ) ( not ( = ?auto_138708 ?auto_138709 ) ) ( not ( = ?auto_138708 ?auto_138711 ) ) ( not ( = ?auto_138708 ?auto_138710 ) ) ( not ( = ?auto_138709 ?auto_138711 ) ) ( not ( = ?auto_138709 ?auto_138710 ) ) ( not ( = ?auto_138711 ?auto_138710 ) ) ( ON ?auto_138711 ?auto_138709 ) ( CLEAR ?auto_138711 ) ( HOLDING ?auto_138710 ) ( CLEAR ?auto_138714 ) ( ON-TABLE ?auto_138715 ) ( ON ?auto_138713 ?auto_138715 ) ( ON ?auto_138712 ?auto_138713 ) ( ON ?auto_138714 ?auto_138712 ) ( not ( = ?auto_138715 ?auto_138713 ) ) ( not ( = ?auto_138715 ?auto_138712 ) ) ( not ( = ?auto_138715 ?auto_138714 ) ) ( not ( = ?auto_138715 ?auto_138710 ) ) ( not ( = ?auto_138713 ?auto_138712 ) ) ( not ( = ?auto_138713 ?auto_138714 ) ) ( not ( = ?auto_138713 ?auto_138710 ) ) ( not ( = ?auto_138712 ?auto_138714 ) ) ( not ( = ?auto_138712 ?auto_138710 ) ) ( not ( = ?auto_138714 ?auto_138710 ) ) ( not ( = ?auto_138708 ?auto_138714 ) ) ( not ( = ?auto_138708 ?auto_138715 ) ) ( not ( = ?auto_138708 ?auto_138713 ) ) ( not ( = ?auto_138708 ?auto_138712 ) ) ( not ( = ?auto_138709 ?auto_138714 ) ) ( not ( = ?auto_138709 ?auto_138715 ) ) ( not ( = ?auto_138709 ?auto_138713 ) ) ( not ( = ?auto_138709 ?auto_138712 ) ) ( not ( = ?auto_138711 ?auto_138714 ) ) ( not ( = ?auto_138711 ?auto_138715 ) ) ( not ( = ?auto_138711 ?auto_138713 ) ) ( not ( = ?auto_138711 ?auto_138712 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_138715 ?auto_138713 ?auto_138712 ?auto_138714 ?auto_138710 )
      ( MAKE-1PILE ?auto_138708 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_138716 - BLOCK
    )
    :vars
    (
      ?auto_138718 - BLOCK
      ?auto_138719 - BLOCK
      ?auto_138721 - BLOCK
      ?auto_138717 - BLOCK
      ?auto_138720 - BLOCK
      ?auto_138723 - BLOCK
      ?auto_138722 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_138718 ?auto_138716 ) ( ON-TABLE ?auto_138716 ) ( not ( = ?auto_138716 ?auto_138718 ) ) ( not ( = ?auto_138716 ?auto_138719 ) ) ( not ( = ?auto_138716 ?auto_138721 ) ) ( not ( = ?auto_138718 ?auto_138719 ) ) ( not ( = ?auto_138718 ?auto_138721 ) ) ( not ( = ?auto_138719 ?auto_138721 ) ) ( ON ?auto_138719 ?auto_138718 ) ( CLEAR ?auto_138717 ) ( ON-TABLE ?auto_138720 ) ( ON ?auto_138723 ?auto_138720 ) ( ON ?auto_138722 ?auto_138723 ) ( ON ?auto_138717 ?auto_138722 ) ( not ( = ?auto_138720 ?auto_138723 ) ) ( not ( = ?auto_138720 ?auto_138722 ) ) ( not ( = ?auto_138720 ?auto_138717 ) ) ( not ( = ?auto_138720 ?auto_138721 ) ) ( not ( = ?auto_138723 ?auto_138722 ) ) ( not ( = ?auto_138723 ?auto_138717 ) ) ( not ( = ?auto_138723 ?auto_138721 ) ) ( not ( = ?auto_138722 ?auto_138717 ) ) ( not ( = ?auto_138722 ?auto_138721 ) ) ( not ( = ?auto_138717 ?auto_138721 ) ) ( not ( = ?auto_138716 ?auto_138717 ) ) ( not ( = ?auto_138716 ?auto_138720 ) ) ( not ( = ?auto_138716 ?auto_138723 ) ) ( not ( = ?auto_138716 ?auto_138722 ) ) ( not ( = ?auto_138718 ?auto_138717 ) ) ( not ( = ?auto_138718 ?auto_138720 ) ) ( not ( = ?auto_138718 ?auto_138723 ) ) ( not ( = ?auto_138718 ?auto_138722 ) ) ( not ( = ?auto_138719 ?auto_138717 ) ) ( not ( = ?auto_138719 ?auto_138720 ) ) ( not ( = ?auto_138719 ?auto_138723 ) ) ( not ( = ?auto_138719 ?auto_138722 ) ) ( ON ?auto_138721 ?auto_138719 ) ( CLEAR ?auto_138721 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_138716 ?auto_138718 ?auto_138719 )
      ( MAKE-1PILE ?auto_138716 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_138724 - BLOCK
    )
    :vars
    (
      ?auto_138731 - BLOCK
      ?auto_138726 - BLOCK
      ?auto_138727 - BLOCK
      ?auto_138725 - BLOCK
      ?auto_138728 - BLOCK
      ?auto_138730 - BLOCK
      ?auto_138729 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_138731 ?auto_138724 ) ( ON-TABLE ?auto_138724 ) ( not ( = ?auto_138724 ?auto_138731 ) ) ( not ( = ?auto_138724 ?auto_138726 ) ) ( not ( = ?auto_138724 ?auto_138727 ) ) ( not ( = ?auto_138731 ?auto_138726 ) ) ( not ( = ?auto_138731 ?auto_138727 ) ) ( not ( = ?auto_138726 ?auto_138727 ) ) ( ON ?auto_138726 ?auto_138731 ) ( ON-TABLE ?auto_138725 ) ( ON ?auto_138728 ?auto_138725 ) ( ON ?auto_138730 ?auto_138728 ) ( not ( = ?auto_138725 ?auto_138728 ) ) ( not ( = ?auto_138725 ?auto_138730 ) ) ( not ( = ?auto_138725 ?auto_138729 ) ) ( not ( = ?auto_138725 ?auto_138727 ) ) ( not ( = ?auto_138728 ?auto_138730 ) ) ( not ( = ?auto_138728 ?auto_138729 ) ) ( not ( = ?auto_138728 ?auto_138727 ) ) ( not ( = ?auto_138730 ?auto_138729 ) ) ( not ( = ?auto_138730 ?auto_138727 ) ) ( not ( = ?auto_138729 ?auto_138727 ) ) ( not ( = ?auto_138724 ?auto_138729 ) ) ( not ( = ?auto_138724 ?auto_138725 ) ) ( not ( = ?auto_138724 ?auto_138728 ) ) ( not ( = ?auto_138724 ?auto_138730 ) ) ( not ( = ?auto_138731 ?auto_138729 ) ) ( not ( = ?auto_138731 ?auto_138725 ) ) ( not ( = ?auto_138731 ?auto_138728 ) ) ( not ( = ?auto_138731 ?auto_138730 ) ) ( not ( = ?auto_138726 ?auto_138729 ) ) ( not ( = ?auto_138726 ?auto_138725 ) ) ( not ( = ?auto_138726 ?auto_138728 ) ) ( not ( = ?auto_138726 ?auto_138730 ) ) ( ON ?auto_138727 ?auto_138726 ) ( CLEAR ?auto_138727 ) ( HOLDING ?auto_138729 ) ( CLEAR ?auto_138730 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_138725 ?auto_138728 ?auto_138730 ?auto_138729 )
      ( MAKE-1PILE ?auto_138724 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_138732 - BLOCK
    )
    :vars
    (
      ?auto_138736 - BLOCK
      ?auto_138734 - BLOCK
      ?auto_138733 - BLOCK
      ?auto_138735 - BLOCK
      ?auto_138737 - BLOCK
      ?auto_138738 - BLOCK
      ?auto_138739 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_138736 ?auto_138732 ) ( ON-TABLE ?auto_138732 ) ( not ( = ?auto_138732 ?auto_138736 ) ) ( not ( = ?auto_138732 ?auto_138734 ) ) ( not ( = ?auto_138732 ?auto_138733 ) ) ( not ( = ?auto_138736 ?auto_138734 ) ) ( not ( = ?auto_138736 ?auto_138733 ) ) ( not ( = ?auto_138734 ?auto_138733 ) ) ( ON ?auto_138734 ?auto_138736 ) ( ON-TABLE ?auto_138735 ) ( ON ?auto_138737 ?auto_138735 ) ( ON ?auto_138738 ?auto_138737 ) ( not ( = ?auto_138735 ?auto_138737 ) ) ( not ( = ?auto_138735 ?auto_138738 ) ) ( not ( = ?auto_138735 ?auto_138739 ) ) ( not ( = ?auto_138735 ?auto_138733 ) ) ( not ( = ?auto_138737 ?auto_138738 ) ) ( not ( = ?auto_138737 ?auto_138739 ) ) ( not ( = ?auto_138737 ?auto_138733 ) ) ( not ( = ?auto_138738 ?auto_138739 ) ) ( not ( = ?auto_138738 ?auto_138733 ) ) ( not ( = ?auto_138739 ?auto_138733 ) ) ( not ( = ?auto_138732 ?auto_138739 ) ) ( not ( = ?auto_138732 ?auto_138735 ) ) ( not ( = ?auto_138732 ?auto_138737 ) ) ( not ( = ?auto_138732 ?auto_138738 ) ) ( not ( = ?auto_138736 ?auto_138739 ) ) ( not ( = ?auto_138736 ?auto_138735 ) ) ( not ( = ?auto_138736 ?auto_138737 ) ) ( not ( = ?auto_138736 ?auto_138738 ) ) ( not ( = ?auto_138734 ?auto_138739 ) ) ( not ( = ?auto_138734 ?auto_138735 ) ) ( not ( = ?auto_138734 ?auto_138737 ) ) ( not ( = ?auto_138734 ?auto_138738 ) ) ( ON ?auto_138733 ?auto_138734 ) ( CLEAR ?auto_138738 ) ( ON ?auto_138739 ?auto_138733 ) ( CLEAR ?auto_138739 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_138732 ?auto_138736 ?auto_138734 ?auto_138733 )
      ( MAKE-1PILE ?auto_138732 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_138740 - BLOCK
    )
    :vars
    (
      ?auto_138746 - BLOCK
      ?auto_138743 - BLOCK
      ?auto_138744 - BLOCK
      ?auto_138745 - BLOCK
      ?auto_138747 - BLOCK
      ?auto_138742 - BLOCK
      ?auto_138741 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_138746 ?auto_138740 ) ( ON-TABLE ?auto_138740 ) ( not ( = ?auto_138740 ?auto_138746 ) ) ( not ( = ?auto_138740 ?auto_138743 ) ) ( not ( = ?auto_138740 ?auto_138744 ) ) ( not ( = ?auto_138746 ?auto_138743 ) ) ( not ( = ?auto_138746 ?auto_138744 ) ) ( not ( = ?auto_138743 ?auto_138744 ) ) ( ON ?auto_138743 ?auto_138746 ) ( ON-TABLE ?auto_138745 ) ( ON ?auto_138747 ?auto_138745 ) ( not ( = ?auto_138745 ?auto_138747 ) ) ( not ( = ?auto_138745 ?auto_138742 ) ) ( not ( = ?auto_138745 ?auto_138741 ) ) ( not ( = ?auto_138745 ?auto_138744 ) ) ( not ( = ?auto_138747 ?auto_138742 ) ) ( not ( = ?auto_138747 ?auto_138741 ) ) ( not ( = ?auto_138747 ?auto_138744 ) ) ( not ( = ?auto_138742 ?auto_138741 ) ) ( not ( = ?auto_138742 ?auto_138744 ) ) ( not ( = ?auto_138741 ?auto_138744 ) ) ( not ( = ?auto_138740 ?auto_138741 ) ) ( not ( = ?auto_138740 ?auto_138745 ) ) ( not ( = ?auto_138740 ?auto_138747 ) ) ( not ( = ?auto_138740 ?auto_138742 ) ) ( not ( = ?auto_138746 ?auto_138741 ) ) ( not ( = ?auto_138746 ?auto_138745 ) ) ( not ( = ?auto_138746 ?auto_138747 ) ) ( not ( = ?auto_138746 ?auto_138742 ) ) ( not ( = ?auto_138743 ?auto_138741 ) ) ( not ( = ?auto_138743 ?auto_138745 ) ) ( not ( = ?auto_138743 ?auto_138747 ) ) ( not ( = ?auto_138743 ?auto_138742 ) ) ( ON ?auto_138744 ?auto_138743 ) ( ON ?auto_138741 ?auto_138744 ) ( CLEAR ?auto_138741 ) ( HOLDING ?auto_138742 ) ( CLEAR ?auto_138747 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_138745 ?auto_138747 ?auto_138742 )
      ( MAKE-1PILE ?auto_138740 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_138748 - BLOCK
    )
    :vars
    (
      ?auto_138755 - BLOCK
      ?auto_138751 - BLOCK
      ?auto_138754 - BLOCK
      ?auto_138752 - BLOCK
      ?auto_138750 - BLOCK
      ?auto_138749 - BLOCK
      ?auto_138753 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_138755 ?auto_138748 ) ( ON-TABLE ?auto_138748 ) ( not ( = ?auto_138748 ?auto_138755 ) ) ( not ( = ?auto_138748 ?auto_138751 ) ) ( not ( = ?auto_138748 ?auto_138754 ) ) ( not ( = ?auto_138755 ?auto_138751 ) ) ( not ( = ?auto_138755 ?auto_138754 ) ) ( not ( = ?auto_138751 ?auto_138754 ) ) ( ON ?auto_138751 ?auto_138755 ) ( ON-TABLE ?auto_138752 ) ( ON ?auto_138750 ?auto_138752 ) ( not ( = ?auto_138752 ?auto_138750 ) ) ( not ( = ?auto_138752 ?auto_138749 ) ) ( not ( = ?auto_138752 ?auto_138753 ) ) ( not ( = ?auto_138752 ?auto_138754 ) ) ( not ( = ?auto_138750 ?auto_138749 ) ) ( not ( = ?auto_138750 ?auto_138753 ) ) ( not ( = ?auto_138750 ?auto_138754 ) ) ( not ( = ?auto_138749 ?auto_138753 ) ) ( not ( = ?auto_138749 ?auto_138754 ) ) ( not ( = ?auto_138753 ?auto_138754 ) ) ( not ( = ?auto_138748 ?auto_138753 ) ) ( not ( = ?auto_138748 ?auto_138752 ) ) ( not ( = ?auto_138748 ?auto_138750 ) ) ( not ( = ?auto_138748 ?auto_138749 ) ) ( not ( = ?auto_138755 ?auto_138753 ) ) ( not ( = ?auto_138755 ?auto_138752 ) ) ( not ( = ?auto_138755 ?auto_138750 ) ) ( not ( = ?auto_138755 ?auto_138749 ) ) ( not ( = ?auto_138751 ?auto_138753 ) ) ( not ( = ?auto_138751 ?auto_138752 ) ) ( not ( = ?auto_138751 ?auto_138750 ) ) ( not ( = ?auto_138751 ?auto_138749 ) ) ( ON ?auto_138754 ?auto_138751 ) ( ON ?auto_138753 ?auto_138754 ) ( CLEAR ?auto_138750 ) ( ON ?auto_138749 ?auto_138753 ) ( CLEAR ?auto_138749 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_138748 ?auto_138755 ?auto_138751 ?auto_138754 ?auto_138753 )
      ( MAKE-1PILE ?auto_138748 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_138756 - BLOCK
    )
    :vars
    (
      ?auto_138763 - BLOCK
      ?auto_138757 - BLOCK
      ?auto_138760 - BLOCK
      ?auto_138762 - BLOCK
      ?auto_138758 - BLOCK
      ?auto_138759 - BLOCK
      ?auto_138761 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_138763 ?auto_138756 ) ( ON-TABLE ?auto_138756 ) ( not ( = ?auto_138756 ?auto_138763 ) ) ( not ( = ?auto_138756 ?auto_138757 ) ) ( not ( = ?auto_138756 ?auto_138760 ) ) ( not ( = ?auto_138763 ?auto_138757 ) ) ( not ( = ?auto_138763 ?auto_138760 ) ) ( not ( = ?auto_138757 ?auto_138760 ) ) ( ON ?auto_138757 ?auto_138763 ) ( ON-TABLE ?auto_138762 ) ( not ( = ?auto_138762 ?auto_138758 ) ) ( not ( = ?auto_138762 ?auto_138759 ) ) ( not ( = ?auto_138762 ?auto_138761 ) ) ( not ( = ?auto_138762 ?auto_138760 ) ) ( not ( = ?auto_138758 ?auto_138759 ) ) ( not ( = ?auto_138758 ?auto_138761 ) ) ( not ( = ?auto_138758 ?auto_138760 ) ) ( not ( = ?auto_138759 ?auto_138761 ) ) ( not ( = ?auto_138759 ?auto_138760 ) ) ( not ( = ?auto_138761 ?auto_138760 ) ) ( not ( = ?auto_138756 ?auto_138761 ) ) ( not ( = ?auto_138756 ?auto_138762 ) ) ( not ( = ?auto_138756 ?auto_138758 ) ) ( not ( = ?auto_138756 ?auto_138759 ) ) ( not ( = ?auto_138763 ?auto_138761 ) ) ( not ( = ?auto_138763 ?auto_138762 ) ) ( not ( = ?auto_138763 ?auto_138758 ) ) ( not ( = ?auto_138763 ?auto_138759 ) ) ( not ( = ?auto_138757 ?auto_138761 ) ) ( not ( = ?auto_138757 ?auto_138762 ) ) ( not ( = ?auto_138757 ?auto_138758 ) ) ( not ( = ?auto_138757 ?auto_138759 ) ) ( ON ?auto_138760 ?auto_138757 ) ( ON ?auto_138761 ?auto_138760 ) ( ON ?auto_138759 ?auto_138761 ) ( CLEAR ?auto_138759 ) ( HOLDING ?auto_138758 ) ( CLEAR ?auto_138762 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_138762 ?auto_138758 )
      ( MAKE-1PILE ?auto_138756 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_138764 - BLOCK
    )
    :vars
    (
      ?auto_138766 - BLOCK
      ?auto_138771 - BLOCK
      ?auto_138768 - BLOCK
      ?auto_138767 - BLOCK
      ?auto_138769 - BLOCK
      ?auto_138765 - BLOCK
      ?auto_138770 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_138766 ?auto_138764 ) ( ON-TABLE ?auto_138764 ) ( not ( = ?auto_138764 ?auto_138766 ) ) ( not ( = ?auto_138764 ?auto_138771 ) ) ( not ( = ?auto_138764 ?auto_138768 ) ) ( not ( = ?auto_138766 ?auto_138771 ) ) ( not ( = ?auto_138766 ?auto_138768 ) ) ( not ( = ?auto_138771 ?auto_138768 ) ) ( ON ?auto_138771 ?auto_138766 ) ( ON-TABLE ?auto_138767 ) ( not ( = ?auto_138767 ?auto_138769 ) ) ( not ( = ?auto_138767 ?auto_138765 ) ) ( not ( = ?auto_138767 ?auto_138770 ) ) ( not ( = ?auto_138767 ?auto_138768 ) ) ( not ( = ?auto_138769 ?auto_138765 ) ) ( not ( = ?auto_138769 ?auto_138770 ) ) ( not ( = ?auto_138769 ?auto_138768 ) ) ( not ( = ?auto_138765 ?auto_138770 ) ) ( not ( = ?auto_138765 ?auto_138768 ) ) ( not ( = ?auto_138770 ?auto_138768 ) ) ( not ( = ?auto_138764 ?auto_138770 ) ) ( not ( = ?auto_138764 ?auto_138767 ) ) ( not ( = ?auto_138764 ?auto_138769 ) ) ( not ( = ?auto_138764 ?auto_138765 ) ) ( not ( = ?auto_138766 ?auto_138770 ) ) ( not ( = ?auto_138766 ?auto_138767 ) ) ( not ( = ?auto_138766 ?auto_138769 ) ) ( not ( = ?auto_138766 ?auto_138765 ) ) ( not ( = ?auto_138771 ?auto_138770 ) ) ( not ( = ?auto_138771 ?auto_138767 ) ) ( not ( = ?auto_138771 ?auto_138769 ) ) ( not ( = ?auto_138771 ?auto_138765 ) ) ( ON ?auto_138768 ?auto_138771 ) ( ON ?auto_138770 ?auto_138768 ) ( ON ?auto_138765 ?auto_138770 ) ( CLEAR ?auto_138767 ) ( ON ?auto_138769 ?auto_138765 ) ( CLEAR ?auto_138769 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_138764 ?auto_138766 ?auto_138771 ?auto_138768 ?auto_138770 ?auto_138765 )
      ( MAKE-1PILE ?auto_138764 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_138772 - BLOCK
    )
    :vars
    (
      ?auto_138778 - BLOCK
      ?auto_138774 - BLOCK
      ?auto_138775 - BLOCK
      ?auto_138777 - BLOCK
      ?auto_138776 - BLOCK
      ?auto_138779 - BLOCK
      ?auto_138773 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_138778 ?auto_138772 ) ( ON-TABLE ?auto_138772 ) ( not ( = ?auto_138772 ?auto_138778 ) ) ( not ( = ?auto_138772 ?auto_138774 ) ) ( not ( = ?auto_138772 ?auto_138775 ) ) ( not ( = ?auto_138778 ?auto_138774 ) ) ( not ( = ?auto_138778 ?auto_138775 ) ) ( not ( = ?auto_138774 ?auto_138775 ) ) ( ON ?auto_138774 ?auto_138778 ) ( not ( = ?auto_138777 ?auto_138776 ) ) ( not ( = ?auto_138777 ?auto_138779 ) ) ( not ( = ?auto_138777 ?auto_138773 ) ) ( not ( = ?auto_138777 ?auto_138775 ) ) ( not ( = ?auto_138776 ?auto_138779 ) ) ( not ( = ?auto_138776 ?auto_138773 ) ) ( not ( = ?auto_138776 ?auto_138775 ) ) ( not ( = ?auto_138779 ?auto_138773 ) ) ( not ( = ?auto_138779 ?auto_138775 ) ) ( not ( = ?auto_138773 ?auto_138775 ) ) ( not ( = ?auto_138772 ?auto_138773 ) ) ( not ( = ?auto_138772 ?auto_138777 ) ) ( not ( = ?auto_138772 ?auto_138776 ) ) ( not ( = ?auto_138772 ?auto_138779 ) ) ( not ( = ?auto_138778 ?auto_138773 ) ) ( not ( = ?auto_138778 ?auto_138777 ) ) ( not ( = ?auto_138778 ?auto_138776 ) ) ( not ( = ?auto_138778 ?auto_138779 ) ) ( not ( = ?auto_138774 ?auto_138773 ) ) ( not ( = ?auto_138774 ?auto_138777 ) ) ( not ( = ?auto_138774 ?auto_138776 ) ) ( not ( = ?auto_138774 ?auto_138779 ) ) ( ON ?auto_138775 ?auto_138774 ) ( ON ?auto_138773 ?auto_138775 ) ( ON ?auto_138779 ?auto_138773 ) ( ON ?auto_138776 ?auto_138779 ) ( CLEAR ?auto_138776 ) ( HOLDING ?auto_138777 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_138777 )
      ( MAKE-1PILE ?auto_138772 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_138789 - BLOCK
    )
    :vars
    (
      ?auto_138795 - BLOCK
      ?auto_138793 - BLOCK
      ?auto_138790 - BLOCK
      ?auto_138794 - BLOCK
      ?auto_138792 - BLOCK
      ?auto_138796 - BLOCK
      ?auto_138791 - BLOCK
      ?auto_138797 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_138795 ?auto_138789 ) ( ON-TABLE ?auto_138789 ) ( not ( = ?auto_138789 ?auto_138795 ) ) ( not ( = ?auto_138789 ?auto_138793 ) ) ( not ( = ?auto_138789 ?auto_138790 ) ) ( not ( = ?auto_138795 ?auto_138793 ) ) ( not ( = ?auto_138795 ?auto_138790 ) ) ( not ( = ?auto_138793 ?auto_138790 ) ) ( ON ?auto_138793 ?auto_138795 ) ( not ( = ?auto_138794 ?auto_138792 ) ) ( not ( = ?auto_138794 ?auto_138796 ) ) ( not ( = ?auto_138794 ?auto_138791 ) ) ( not ( = ?auto_138794 ?auto_138790 ) ) ( not ( = ?auto_138792 ?auto_138796 ) ) ( not ( = ?auto_138792 ?auto_138791 ) ) ( not ( = ?auto_138792 ?auto_138790 ) ) ( not ( = ?auto_138796 ?auto_138791 ) ) ( not ( = ?auto_138796 ?auto_138790 ) ) ( not ( = ?auto_138791 ?auto_138790 ) ) ( not ( = ?auto_138789 ?auto_138791 ) ) ( not ( = ?auto_138789 ?auto_138794 ) ) ( not ( = ?auto_138789 ?auto_138792 ) ) ( not ( = ?auto_138789 ?auto_138796 ) ) ( not ( = ?auto_138795 ?auto_138791 ) ) ( not ( = ?auto_138795 ?auto_138794 ) ) ( not ( = ?auto_138795 ?auto_138792 ) ) ( not ( = ?auto_138795 ?auto_138796 ) ) ( not ( = ?auto_138793 ?auto_138791 ) ) ( not ( = ?auto_138793 ?auto_138794 ) ) ( not ( = ?auto_138793 ?auto_138792 ) ) ( not ( = ?auto_138793 ?auto_138796 ) ) ( ON ?auto_138790 ?auto_138793 ) ( ON ?auto_138791 ?auto_138790 ) ( ON ?auto_138796 ?auto_138791 ) ( ON ?auto_138792 ?auto_138796 ) ( CLEAR ?auto_138792 ) ( ON ?auto_138794 ?auto_138797 ) ( CLEAR ?auto_138794 ) ( HAND-EMPTY ) ( not ( = ?auto_138789 ?auto_138797 ) ) ( not ( = ?auto_138795 ?auto_138797 ) ) ( not ( = ?auto_138793 ?auto_138797 ) ) ( not ( = ?auto_138790 ?auto_138797 ) ) ( not ( = ?auto_138794 ?auto_138797 ) ) ( not ( = ?auto_138792 ?auto_138797 ) ) ( not ( = ?auto_138796 ?auto_138797 ) ) ( not ( = ?auto_138791 ?auto_138797 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_138794 ?auto_138797 )
      ( MAKE-1PILE ?auto_138789 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_138798 - BLOCK
    )
    :vars
    (
      ?auto_138802 - BLOCK
      ?auto_138803 - BLOCK
      ?auto_138801 - BLOCK
      ?auto_138804 - BLOCK
      ?auto_138800 - BLOCK
      ?auto_138805 - BLOCK
      ?auto_138799 - BLOCK
      ?auto_138806 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_138802 ?auto_138798 ) ( ON-TABLE ?auto_138798 ) ( not ( = ?auto_138798 ?auto_138802 ) ) ( not ( = ?auto_138798 ?auto_138803 ) ) ( not ( = ?auto_138798 ?auto_138801 ) ) ( not ( = ?auto_138802 ?auto_138803 ) ) ( not ( = ?auto_138802 ?auto_138801 ) ) ( not ( = ?auto_138803 ?auto_138801 ) ) ( ON ?auto_138803 ?auto_138802 ) ( not ( = ?auto_138804 ?auto_138800 ) ) ( not ( = ?auto_138804 ?auto_138805 ) ) ( not ( = ?auto_138804 ?auto_138799 ) ) ( not ( = ?auto_138804 ?auto_138801 ) ) ( not ( = ?auto_138800 ?auto_138805 ) ) ( not ( = ?auto_138800 ?auto_138799 ) ) ( not ( = ?auto_138800 ?auto_138801 ) ) ( not ( = ?auto_138805 ?auto_138799 ) ) ( not ( = ?auto_138805 ?auto_138801 ) ) ( not ( = ?auto_138799 ?auto_138801 ) ) ( not ( = ?auto_138798 ?auto_138799 ) ) ( not ( = ?auto_138798 ?auto_138804 ) ) ( not ( = ?auto_138798 ?auto_138800 ) ) ( not ( = ?auto_138798 ?auto_138805 ) ) ( not ( = ?auto_138802 ?auto_138799 ) ) ( not ( = ?auto_138802 ?auto_138804 ) ) ( not ( = ?auto_138802 ?auto_138800 ) ) ( not ( = ?auto_138802 ?auto_138805 ) ) ( not ( = ?auto_138803 ?auto_138799 ) ) ( not ( = ?auto_138803 ?auto_138804 ) ) ( not ( = ?auto_138803 ?auto_138800 ) ) ( not ( = ?auto_138803 ?auto_138805 ) ) ( ON ?auto_138801 ?auto_138803 ) ( ON ?auto_138799 ?auto_138801 ) ( ON ?auto_138805 ?auto_138799 ) ( ON ?auto_138804 ?auto_138806 ) ( CLEAR ?auto_138804 ) ( not ( = ?auto_138798 ?auto_138806 ) ) ( not ( = ?auto_138802 ?auto_138806 ) ) ( not ( = ?auto_138803 ?auto_138806 ) ) ( not ( = ?auto_138801 ?auto_138806 ) ) ( not ( = ?auto_138804 ?auto_138806 ) ) ( not ( = ?auto_138800 ?auto_138806 ) ) ( not ( = ?auto_138805 ?auto_138806 ) ) ( not ( = ?auto_138799 ?auto_138806 ) ) ( HOLDING ?auto_138800 ) ( CLEAR ?auto_138805 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_138798 ?auto_138802 ?auto_138803 ?auto_138801 ?auto_138799 ?auto_138805 ?auto_138800 )
      ( MAKE-1PILE ?auto_138798 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_138807 - BLOCK
    )
    :vars
    (
      ?auto_138815 - BLOCK
      ?auto_138811 - BLOCK
      ?auto_138808 - BLOCK
      ?auto_138814 - BLOCK
      ?auto_138813 - BLOCK
      ?auto_138812 - BLOCK
      ?auto_138809 - BLOCK
      ?auto_138810 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_138815 ?auto_138807 ) ( ON-TABLE ?auto_138807 ) ( not ( = ?auto_138807 ?auto_138815 ) ) ( not ( = ?auto_138807 ?auto_138811 ) ) ( not ( = ?auto_138807 ?auto_138808 ) ) ( not ( = ?auto_138815 ?auto_138811 ) ) ( not ( = ?auto_138815 ?auto_138808 ) ) ( not ( = ?auto_138811 ?auto_138808 ) ) ( ON ?auto_138811 ?auto_138815 ) ( not ( = ?auto_138814 ?auto_138813 ) ) ( not ( = ?auto_138814 ?auto_138812 ) ) ( not ( = ?auto_138814 ?auto_138809 ) ) ( not ( = ?auto_138814 ?auto_138808 ) ) ( not ( = ?auto_138813 ?auto_138812 ) ) ( not ( = ?auto_138813 ?auto_138809 ) ) ( not ( = ?auto_138813 ?auto_138808 ) ) ( not ( = ?auto_138812 ?auto_138809 ) ) ( not ( = ?auto_138812 ?auto_138808 ) ) ( not ( = ?auto_138809 ?auto_138808 ) ) ( not ( = ?auto_138807 ?auto_138809 ) ) ( not ( = ?auto_138807 ?auto_138814 ) ) ( not ( = ?auto_138807 ?auto_138813 ) ) ( not ( = ?auto_138807 ?auto_138812 ) ) ( not ( = ?auto_138815 ?auto_138809 ) ) ( not ( = ?auto_138815 ?auto_138814 ) ) ( not ( = ?auto_138815 ?auto_138813 ) ) ( not ( = ?auto_138815 ?auto_138812 ) ) ( not ( = ?auto_138811 ?auto_138809 ) ) ( not ( = ?auto_138811 ?auto_138814 ) ) ( not ( = ?auto_138811 ?auto_138813 ) ) ( not ( = ?auto_138811 ?auto_138812 ) ) ( ON ?auto_138808 ?auto_138811 ) ( ON ?auto_138809 ?auto_138808 ) ( ON ?auto_138812 ?auto_138809 ) ( ON ?auto_138814 ?auto_138810 ) ( not ( = ?auto_138807 ?auto_138810 ) ) ( not ( = ?auto_138815 ?auto_138810 ) ) ( not ( = ?auto_138811 ?auto_138810 ) ) ( not ( = ?auto_138808 ?auto_138810 ) ) ( not ( = ?auto_138814 ?auto_138810 ) ) ( not ( = ?auto_138813 ?auto_138810 ) ) ( not ( = ?auto_138812 ?auto_138810 ) ) ( not ( = ?auto_138809 ?auto_138810 ) ) ( CLEAR ?auto_138812 ) ( ON ?auto_138813 ?auto_138814 ) ( CLEAR ?auto_138813 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_138810 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_138810 ?auto_138814 )
      ( MAKE-1PILE ?auto_138807 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_138816 - BLOCK
    )
    :vars
    (
      ?auto_138824 - BLOCK
      ?auto_138823 - BLOCK
      ?auto_138822 - BLOCK
      ?auto_138821 - BLOCK
      ?auto_138820 - BLOCK
      ?auto_138817 - BLOCK
      ?auto_138819 - BLOCK
      ?auto_138818 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_138824 ?auto_138816 ) ( ON-TABLE ?auto_138816 ) ( not ( = ?auto_138816 ?auto_138824 ) ) ( not ( = ?auto_138816 ?auto_138823 ) ) ( not ( = ?auto_138816 ?auto_138822 ) ) ( not ( = ?auto_138824 ?auto_138823 ) ) ( not ( = ?auto_138824 ?auto_138822 ) ) ( not ( = ?auto_138823 ?auto_138822 ) ) ( ON ?auto_138823 ?auto_138824 ) ( not ( = ?auto_138821 ?auto_138820 ) ) ( not ( = ?auto_138821 ?auto_138817 ) ) ( not ( = ?auto_138821 ?auto_138819 ) ) ( not ( = ?auto_138821 ?auto_138822 ) ) ( not ( = ?auto_138820 ?auto_138817 ) ) ( not ( = ?auto_138820 ?auto_138819 ) ) ( not ( = ?auto_138820 ?auto_138822 ) ) ( not ( = ?auto_138817 ?auto_138819 ) ) ( not ( = ?auto_138817 ?auto_138822 ) ) ( not ( = ?auto_138819 ?auto_138822 ) ) ( not ( = ?auto_138816 ?auto_138819 ) ) ( not ( = ?auto_138816 ?auto_138821 ) ) ( not ( = ?auto_138816 ?auto_138820 ) ) ( not ( = ?auto_138816 ?auto_138817 ) ) ( not ( = ?auto_138824 ?auto_138819 ) ) ( not ( = ?auto_138824 ?auto_138821 ) ) ( not ( = ?auto_138824 ?auto_138820 ) ) ( not ( = ?auto_138824 ?auto_138817 ) ) ( not ( = ?auto_138823 ?auto_138819 ) ) ( not ( = ?auto_138823 ?auto_138821 ) ) ( not ( = ?auto_138823 ?auto_138820 ) ) ( not ( = ?auto_138823 ?auto_138817 ) ) ( ON ?auto_138822 ?auto_138823 ) ( ON ?auto_138819 ?auto_138822 ) ( ON ?auto_138821 ?auto_138818 ) ( not ( = ?auto_138816 ?auto_138818 ) ) ( not ( = ?auto_138824 ?auto_138818 ) ) ( not ( = ?auto_138823 ?auto_138818 ) ) ( not ( = ?auto_138822 ?auto_138818 ) ) ( not ( = ?auto_138821 ?auto_138818 ) ) ( not ( = ?auto_138820 ?auto_138818 ) ) ( not ( = ?auto_138817 ?auto_138818 ) ) ( not ( = ?auto_138819 ?auto_138818 ) ) ( ON ?auto_138820 ?auto_138821 ) ( CLEAR ?auto_138820 ) ( ON-TABLE ?auto_138818 ) ( HOLDING ?auto_138817 ) ( CLEAR ?auto_138819 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_138816 ?auto_138824 ?auto_138823 ?auto_138822 ?auto_138819 ?auto_138817 )
      ( MAKE-1PILE ?auto_138816 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_138825 - BLOCK
    )
    :vars
    (
      ?auto_138831 - BLOCK
      ?auto_138827 - BLOCK
      ?auto_138833 - BLOCK
      ?auto_138830 - BLOCK
      ?auto_138826 - BLOCK
      ?auto_138829 - BLOCK
      ?auto_138832 - BLOCK
      ?auto_138828 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_138831 ?auto_138825 ) ( ON-TABLE ?auto_138825 ) ( not ( = ?auto_138825 ?auto_138831 ) ) ( not ( = ?auto_138825 ?auto_138827 ) ) ( not ( = ?auto_138825 ?auto_138833 ) ) ( not ( = ?auto_138831 ?auto_138827 ) ) ( not ( = ?auto_138831 ?auto_138833 ) ) ( not ( = ?auto_138827 ?auto_138833 ) ) ( ON ?auto_138827 ?auto_138831 ) ( not ( = ?auto_138830 ?auto_138826 ) ) ( not ( = ?auto_138830 ?auto_138829 ) ) ( not ( = ?auto_138830 ?auto_138832 ) ) ( not ( = ?auto_138830 ?auto_138833 ) ) ( not ( = ?auto_138826 ?auto_138829 ) ) ( not ( = ?auto_138826 ?auto_138832 ) ) ( not ( = ?auto_138826 ?auto_138833 ) ) ( not ( = ?auto_138829 ?auto_138832 ) ) ( not ( = ?auto_138829 ?auto_138833 ) ) ( not ( = ?auto_138832 ?auto_138833 ) ) ( not ( = ?auto_138825 ?auto_138832 ) ) ( not ( = ?auto_138825 ?auto_138830 ) ) ( not ( = ?auto_138825 ?auto_138826 ) ) ( not ( = ?auto_138825 ?auto_138829 ) ) ( not ( = ?auto_138831 ?auto_138832 ) ) ( not ( = ?auto_138831 ?auto_138830 ) ) ( not ( = ?auto_138831 ?auto_138826 ) ) ( not ( = ?auto_138831 ?auto_138829 ) ) ( not ( = ?auto_138827 ?auto_138832 ) ) ( not ( = ?auto_138827 ?auto_138830 ) ) ( not ( = ?auto_138827 ?auto_138826 ) ) ( not ( = ?auto_138827 ?auto_138829 ) ) ( ON ?auto_138833 ?auto_138827 ) ( ON ?auto_138832 ?auto_138833 ) ( ON ?auto_138830 ?auto_138828 ) ( not ( = ?auto_138825 ?auto_138828 ) ) ( not ( = ?auto_138831 ?auto_138828 ) ) ( not ( = ?auto_138827 ?auto_138828 ) ) ( not ( = ?auto_138833 ?auto_138828 ) ) ( not ( = ?auto_138830 ?auto_138828 ) ) ( not ( = ?auto_138826 ?auto_138828 ) ) ( not ( = ?auto_138829 ?auto_138828 ) ) ( not ( = ?auto_138832 ?auto_138828 ) ) ( ON ?auto_138826 ?auto_138830 ) ( ON-TABLE ?auto_138828 ) ( CLEAR ?auto_138832 ) ( ON ?auto_138829 ?auto_138826 ) ( CLEAR ?auto_138829 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_138828 ?auto_138830 ?auto_138826 )
      ( MAKE-1PILE ?auto_138825 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_138877 - BLOCK
      ?auto_138878 - BLOCK
      ?auto_138879 - BLOCK
      ?auto_138880 - BLOCK
      ?auto_138881 - BLOCK
      ?auto_138882 - BLOCK
      ?auto_138883 - BLOCK
    )
    :vars
    (
      ?auto_138884 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_138877 ) ( ON ?auto_138878 ?auto_138877 ) ( ON ?auto_138879 ?auto_138878 ) ( ON ?auto_138880 ?auto_138879 ) ( ON ?auto_138881 ?auto_138880 ) ( not ( = ?auto_138877 ?auto_138878 ) ) ( not ( = ?auto_138877 ?auto_138879 ) ) ( not ( = ?auto_138877 ?auto_138880 ) ) ( not ( = ?auto_138877 ?auto_138881 ) ) ( not ( = ?auto_138877 ?auto_138882 ) ) ( not ( = ?auto_138877 ?auto_138883 ) ) ( not ( = ?auto_138878 ?auto_138879 ) ) ( not ( = ?auto_138878 ?auto_138880 ) ) ( not ( = ?auto_138878 ?auto_138881 ) ) ( not ( = ?auto_138878 ?auto_138882 ) ) ( not ( = ?auto_138878 ?auto_138883 ) ) ( not ( = ?auto_138879 ?auto_138880 ) ) ( not ( = ?auto_138879 ?auto_138881 ) ) ( not ( = ?auto_138879 ?auto_138882 ) ) ( not ( = ?auto_138879 ?auto_138883 ) ) ( not ( = ?auto_138880 ?auto_138881 ) ) ( not ( = ?auto_138880 ?auto_138882 ) ) ( not ( = ?auto_138880 ?auto_138883 ) ) ( not ( = ?auto_138881 ?auto_138882 ) ) ( not ( = ?auto_138881 ?auto_138883 ) ) ( not ( = ?auto_138882 ?auto_138883 ) ) ( ON ?auto_138883 ?auto_138884 ) ( not ( = ?auto_138877 ?auto_138884 ) ) ( not ( = ?auto_138878 ?auto_138884 ) ) ( not ( = ?auto_138879 ?auto_138884 ) ) ( not ( = ?auto_138880 ?auto_138884 ) ) ( not ( = ?auto_138881 ?auto_138884 ) ) ( not ( = ?auto_138882 ?auto_138884 ) ) ( not ( = ?auto_138883 ?auto_138884 ) ) ( CLEAR ?auto_138881 ) ( ON ?auto_138882 ?auto_138883 ) ( CLEAR ?auto_138882 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_138884 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_138884 ?auto_138883 )
      ( MAKE-7PILE ?auto_138877 ?auto_138878 ?auto_138879 ?auto_138880 ?auto_138881 ?auto_138882 ?auto_138883 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_138885 - BLOCK
      ?auto_138886 - BLOCK
      ?auto_138887 - BLOCK
      ?auto_138888 - BLOCK
      ?auto_138889 - BLOCK
      ?auto_138890 - BLOCK
      ?auto_138891 - BLOCK
    )
    :vars
    (
      ?auto_138892 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_138885 ) ( ON ?auto_138886 ?auto_138885 ) ( ON ?auto_138887 ?auto_138886 ) ( ON ?auto_138888 ?auto_138887 ) ( not ( = ?auto_138885 ?auto_138886 ) ) ( not ( = ?auto_138885 ?auto_138887 ) ) ( not ( = ?auto_138885 ?auto_138888 ) ) ( not ( = ?auto_138885 ?auto_138889 ) ) ( not ( = ?auto_138885 ?auto_138890 ) ) ( not ( = ?auto_138885 ?auto_138891 ) ) ( not ( = ?auto_138886 ?auto_138887 ) ) ( not ( = ?auto_138886 ?auto_138888 ) ) ( not ( = ?auto_138886 ?auto_138889 ) ) ( not ( = ?auto_138886 ?auto_138890 ) ) ( not ( = ?auto_138886 ?auto_138891 ) ) ( not ( = ?auto_138887 ?auto_138888 ) ) ( not ( = ?auto_138887 ?auto_138889 ) ) ( not ( = ?auto_138887 ?auto_138890 ) ) ( not ( = ?auto_138887 ?auto_138891 ) ) ( not ( = ?auto_138888 ?auto_138889 ) ) ( not ( = ?auto_138888 ?auto_138890 ) ) ( not ( = ?auto_138888 ?auto_138891 ) ) ( not ( = ?auto_138889 ?auto_138890 ) ) ( not ( = ?auto_138889 ?auto_138891 ) ) ( not ( = ?auto_138890 ?auto_138891 ) ) ( ON ?auto_138891 ?auto_138892 ) ( not ( = ?auto_138885 ?auto_138892 ) ) ( not ( = ?auto_138886 ?auto_138892 ) ) ( not ( = ?auto_138887 ?auto_138892 ) ) ( not ( = ?auto_138888 ?auto_138892 ) ) ( not ( = ?auto_138889 ?auto_138892 ) ) ( not ( = ?auto_138890 ?auto_138892 ) ) ( not ( = ?auto_138891 ?auto_138892 ) ) ( ON ?auto_138890 ?auto_138891 ) ( CLEAR ?auto_138890 ) ( ON-TABLE ?auto_138892 ) ( HOLDING ?auto_138889 ) ( CLEAR ?auto_138888 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_138885 ?auto_138886 ?auto_138887 ?auto_138888 ?auto_138889 )
      ( MAKE-7PILE ?auto_138885 ?auto_138886 ?auto_138887 ?auto_138888 ?auto_138889 ?auto_138890 ?auto_138891 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_138893 - BLOCK
      ?auto_138894 - BLOCK
      ?auto_138895 - BLOCK
      ?auto_138896 - BLOCK
      ?auto_138897 - BLOCK
      ?auto_138898 - BLOCK
      ?auto_138899 - BLOCK
    )
    :vars
    (
      ?auto_138900 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_138893 ) ( ON ?auto_138894 ?auto_138893 ) ( ON ?auto_138895 ?auto_138894 ) ( ON ?auto_138896 ?auto_138895 ) ( not ( = ?auto_138893 ?auto_138894 ) ) ( not ( = ?auto_138893 ?auto_138895 ) ) ( not ( = ?auto_138893 ?auto_138896 ) ) ( not ( = ?auto_138893 ?auto_138897 ) ) ( not ( = ?auto_138893 ?auto_138898 ) ) ( not ( = ?auto_138893 ?auto_138899 ) ) ( not ( = ?auto_138894 ?auto_138895 ) ) ( not ( = ?auto_138894 ?auto_138896 ) ) ( not ( = ?auto_138894 ?auto_138897 ) ) ( not ( = ?auto_138894 ?auto_138898 ) ) ( not ( = ?auto_138894 ?auto_138899 ) ) ( not ( = ?auto_138895 ?auto_138896 ) ) ( not ( = ?auto_138895 ?auto_138897 ) ) ( not ( = ?auto_138895 ?auto_138898 ) ) ( not ( = ?auto_138895 ?auto_138899 ) ) ( not ( = ?auto_138896 ?auto_138897 ) ) ( not ( = ?auto_138896 ?auto_138898 ) ) ( not ( = ?auto_138896 ?auto_138899 ) ) ( not ( = ?auto_138897 ?auto_138898 ) ) ( not ( = ?auto_138897 ?auto_138899 ) ) ( not ( = ?auto_138898 ?auto_138899 ) ) ( ON ?auto_138899 ?auto_138900 ) ( not ( = ?auto_138893 ?auto_138900 ) ) ( not ( = ?auto_138894 ?auto_138900 ) ) ( not ( = ?auto_138895 ?auto_138900 ) ) ( not ( = ?auto_138896 ?auto_138900 ) ) ( not ( = ?auto_138897 ?auto_138900 ) ) ( not ( = ?auto_138898 ?auto_138900 ) ) ( not ( = ?auto_138899 ?auto_138900 ) ) ( ON ?auto_138898 ?auto_138899 ) ( ON-TABLE ?auto_138900 ) ( CLEAR ?auto_138896 ) ( ON ?auto_138897 ?auto_138898 ) ( CLEAR ?auto_138897 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_138900 ?auto_138899 ?auto_138898 )
      ( MAKE-7PILE ?auto_138893 ?auto_138894 ?auto_138895 ?auto_138896 ?auto_138897 ?auto_138898 ?auto_138899 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_138901 - BLOCK
      ?auto_138902 - BLOCK
      ?auto_138903 - BLOCK
      ?auto_138904 - BLOCK
      ?auto_138905 - BLOCK
      ?auto_138906 - BLOCK
      ?auto_138907 - BLOCK
    )
    :vars
    (
      ?auto_138908 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_138901 ) ( ON ?auto_138902 ?auto_138901 ) ( ON ?auto_138903 ?auto_138902 ) ( not ( = ?auto_138901 ?auto_138902 ) ) ( not ( = ?auto_138901 ?auto_138903 ) ) ( not ( = ?auto_138901 ?auto_138904 ) ) ( not ( = ?auto_138901 ?auto_138905 ) ) ( not ( = ?auto_138901 ?auto_138906 ) ) ( not ( = ?auto_138901 ?auto_138907 ) ) ( not ( = ?auto_138902 ?auto_138903 ) ) ( not ( = ?auto_138902 ?auto_138904 ) ) ( not ( = ?auto_138902 ?auto_138905 ) ) ( not ( = ?auto_138902 ?auto_138906 ) ) ( not ( = ?auto_138902 ?auto_138907 ) ) ( not ( = ?auto_138903 ?auto_138904 ) ) ( not ( = ?auto_138903 ?auto_138905 ) ) ( not ( = ?auto_138903 ?auto_138906 ) ) ( not ( = ?auto_138903 ?auto_138907 ) ) ( not ( = ?auto_138904 ?auto_138905 ) ) ( not ( = ?auto_138904 ?auto_138906 ) ) ( not ( = ?auto_138904 ?auto_138907 ) ) ( not ( = ?auto_138905 ?auto_138906 ) ) ( not ( = ?auto_138905 ?auto_138907 ) ) ( not ( = ?auto_138906 ?auto_138907 ) ) ( ON ?auto_138907 ?auto_138908 ) ( not ( = ?auto_138901 ?auto_138908 ) ) ( not ( = ?auto_138902 ?auto_138908 ) ) ( not ( = ?auto_138903 ?auto_138908 ) ) ( not ( = ?auto_138904 ?auto_138908 ) ) ( not ( = ?auto_138905 ?auto_138908 ) ) ( not ( = ?auto_138906 ?auto_138908 ) ) ( not ( = ?auto_138907 ?auto_138908 ) ) ( ON ?auto_138906 ?auto_138907 ) ( ON-TABLE ?auto_138908 ) ( ON ?auto_138905 ?auto_138906 ) ( CLEAR ?auto_138905 ) ( HOLDING ?auto_138904 ) ( CLEAR ?auto_138903 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_138901 ?auto_138902 ?auto_138903 ?auto_138904 )
      ( MAKE-7PILE ?auto_138901 ?auto_138902 ?auto_138903 ?auto_138904 ?auto_138905 ?auto_138906 ?auto_138907 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_138909 - BLOCK
      ?auto_138910 - BLOCK
      ?auto_138911 - BLOCK
      ?auto_138912 - BLOCK
      ?auto_138913 - BLOCK
      ?auto_138914 - BLOCK
      ?auto_138915 - BLOCK
    )
    :vars
    (
      ?auto_138916 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_138909 ) ( ON ?auto_138910 ?auto_138909 ) ( ON ?auto_138911 ?auto_138910 ) ( not ( = ?auto_138909 ?auto_138910 ) ) ( not ( = ?auto_138909 ?auto_138911 ) ) ( not ( = ?auto_138909 ?auto_138912 ) ) ( not ( = ?auto_138909 ?auto_138913 ) ) ( not ( = ?auto_138909 ?auto_138914 ) ) ( not ( = ?auto_138909 ?auto_138915 ) ) ( not ( = ?auto_138910 ?auto_138911 ) ) ( not ( = ?auto_138910 ?auto_138912 ) ) ( not ( = ?auto_138910 ?auto_138913 ) ) ( not ( = ?auto_138910 ?auto_138914 ) ) ( not ( = ?auto_138910 ?auto_138915 ) ) ( not ( = ?auto_138911 ?auto_138912 ) ) ( not ( = ?auto_138911 ?auto_138913 ) ) ( not ( = ?auto_138911 ?auto_138914 ) ) ( not ( = ?auto_138911 ?auto_138915 ) ) ( not ( = ?auto_138912 ?auto_138913 ) ) ( not ( = ?auto_138912 ?auto_138914 ) ) ( not ( = ?auto_138912 ?auto_138915 ) ) ( not ( = ?auto_138913 ?auto_138914 ) ) ( not ( = ?auto_138913 ?auto_138915 ) ) ( not ( = ?auto_138914 ?auto_138915 ) ) ( ON ?auto_138915 ?auto_138916 ) ( not ( = ?auto_138909 ?auto_138916 ) ) ( not ( = ?auto_138910 ?auto_138916 ) ) ( not ( = ?auto_138911 ?auto_138916 ) ) ( not ( = ?auto_138912 ?auto_138916 ) ) ( not ( = ?auto_138913 ?auto_138916 ) ) ( not ( = ?auto_138914 ?auto_138916 ) ) ( not ( = ?auto_138915 ?auto_138916 ) ) ( ON ?auto_138914 ?auto_138915 ) ( ON-TABLE ?auto_138916 ) ( ON ?auto_138913 ?auto_138914 ) ( CLEAR ?auto_138911 ) ( ON ?auto_138912 ?auto_138913 ) ( CLEAR ?auto_138912 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_138916 ?auto_138915 ?auto_138914 ?auto_138913 )
      ( MAKE-7PILE ?auto_138909 ?auto_138910 ?auto_138911 ?auto_138912 ?auto_138913 ?auto_138914 ?auto_138915 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_138917 - BLOCK
      ?auto_138918 - BLOCK
      ?auto_138919 - BLOCK
      ?auto_138920 - BLOCK
      ?auto_138921 - BLOCK
      ?auto_138922 - BLOCK
      ?auto_138923 - BLOCK
    )
    :vars
    (
      ?auto_138924 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_138917 ) ( ON ?auto_138918 ?auto_138917 ) ( not ( = ?auto_138917 ?auto_138918 ) ) ( not ( = ?auto_138917 ?auto_138919 ) ) ( not ( = ?auto_138917 ?auto_138920 ) ) ( not ( = ?auto_138917 ?auto_138921 ) ) ( not ( = ?auto_138917 ?auto_138922 ) ) ( not ( = ?auto_138917 ?auto_138923 ) ) ( not ( = ?auto_138918 ?auto_138919 ) ) ( not ( = ?auto_138918 ?auto_138920 ) ) ( not ( = ?auto_138918 ?auto_138921 ) ) ( not ( = ?auto_138918 ?auto_138922 ) ) ( not ( = ?auto_138918 ?auto_138923 ) ) ( not ( = ?auto_138919 ?auto_138920 ) ) ( not ( = ?auto_138919 ?auto_138921 ) ) ( not ( = ?auto_138919 ?auto_138922 ) ) ( not ( = ?auto_138919 ?auto_138923 ) ) ( not ( = ?auto_138920 ?auto_138921 ) ) ( not ( = ?auto_138920 ?auto_138922 ) ) ( not ( = ?auto_138920 ?auto_138923 ) ) ( not ( = ?auto_138921 ?auto_138922 ) ) ( not ( = ?auto_138921 ?auto_138923 ) ) ( not ( = ?auto_138922 ?auto_138923 ) ) ( ON ?auto_138923 ?auto_138924 ) ( not ( = ?auto_138917 ?auto_138924 ) ) ( not ( = ?auto_138918 ?auto_138924 ) ) ( not ( = ?auto_138919 ?auto_138924 ) ) ( not ( = ?auto_138920 ?auto_138924 ) ) ( not ( = ?auto_138921 ?auto_138924 ) ) ( not ( = ?auto_138922 ?auto_138924 ) ) ( not ( = ?auto_138923 ?auto_138924 ) ) ( ON ?auto_138922 ?auto_138923 ) ( ON-TABLE ?auto_138924 ) ( ON ?auto_138921 ?auto_138922 ) ( ON ?auto_138920 ?auto_138921 ) ( CLEAR ?auto_138920 ) ( HOLDING ?auto_138919 ) ( CLEAR ?auto_138918 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_138917 ?auto_138918 ?auto_138919 )
      ( MAKE-7PILE ?auto_138917 ?auto_138918 ?auto_138919 ?auto_138920 ?auto_138921 ?auto_138922 ?auto_138923 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_138925 - BLOCK
      ?auto_138926 - BLOCK
      ?auto_138927 - BLOCK
      ?auto_138928 - BLOCK
      ?auto_138929 - BLOCK
      ?auto_138930 - BLOCK
      ?auto_138931 - BLOCK
    )
    :vars
    (
      ?auto_138932 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_138925 ) ( ON ?auto_138926 ?auto_138925 ) ( not ( = ?auto_138925 ?auto_138926 ) ) ( not ( = ?auto_138925 ?auto_138927 ) ) ( not ( = ?auto_138925 ?auto_138928 ) ) ( not ( = ?auto_138925 ?auto_138929 ) ) ( not ( = ?auto_138925 ?auto_138930 ) ) ( not ( = ?auto_138925 ?auto_138931 ) ) ( not ( = ?auto_138926 ?auto_138927 ) ) ( not ( = ?auto_138926 ?auto_138928 ) ) ( not ( = ?auto_138926 ?auto_138929 ) ) ( not ( = ?auto_138926 ?auto_138930 ) ) ( not ( = ?auto_138926 ?auto_138931 ) ) ( not ( = ?auto_138927 ?auto_138928 ) ) ( not ( = ?auto_138927 ?auto_138929 ) ) ( not ( = ?auto_138927 ?auto_138930 ) ) ( not ( = ?auto_138927 ?auto_138931 ) ) ( not ( = ?auto_138928 ?auto_138929 ) ) ( not ( = ?auto_138928 ?auto_138930 ) ) ( not ( = ?auto_138928 ?auto_138931 ) ) ( not ( = ?auto_138929 ?auto_138930 ) ) ( not ( = ?auto_138929 ?auto_138931 ) ) ( not ( = ?auto_138930 ?auto_138931 ) ) ( ON ?auto_138931 ?auto_138932 ) ( not ( = ?auto_138925 ?auto_138932 ) ) ( not ( = ?auto_138926 ?auto_138932 ) ) ( not ( = ?auto_138927 ?auto_138932 ) ) ( not ( = ?auto_138928 ?auto_138932 ) ) ( not ( = ?auto_138929 ?auto_138932 ) ) ( not ( = ?auto_138930 ?auto_138932 ) ) ( not ( = ?auto_138931 ?auto_138932 ) ) ( ON ?auto_138930 ?auto_138931 ) ( ON-TABLE ?auto_138932 ) ( ON ?auto_138929 ?auto_138930 ) ( ON ?auto_138928 ?auto_138929 ) ( CLEAR ?auto_138926 ) ( ON ?auto_138927 ?auto_138928 ) ( CLEAR ?auto_138927 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_138932 ?auto_138931 ?auto_138930 ?auto_138929 ?auto_138928 )
      ( MAKE-7PILE ?auto_138925 ?auto_138926 ?auto_138927 ?auto_138928 ?auto_138929 ?auto_138930 ?auto_138931 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_138933 - BLOCK
      ?auto_138934 - BLOCK
      ?auto_138935 - BLOCK
      ?auto_138936 - BLOCK
      ?auto_138937 - BLOCK
      ?auto_138938 - BLOCK
      ?auto_138939 - BLOCK
    )
    :vars
    (
      ?auto_138940 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_138933 ) ( not ( = ?auto_138933 ?auto_138934 ) ) ( not ( = ?auto_138933 ?auto_138935 ) ) ( not ( = ?auto_138933 ?auto_138936 ) ) ( not ( = ?auto_138933 ?auto_138937 ) ) ( not ( = ?auto_138933 ?auto_138938 ) ) ( not ( = ?auto_138933 ?auto_138939 ) ) ( not ( = ?auto_138934 ?auto_138935 ) ) ( not ( = ?auto_138934 ?auto_138936 ) ) ( not ( = ?auto_138934 ?auto_138937 ) ) ( not ( = ?auto_138934 ?auto_138938 ) ) ( not ( = ?auto_138934 ?auto_138939 ) ) ( not ( = ?auto_138935 ?auto_138936 ) ) ( not ( = ?auto_138935 ?auto_138937 ) ) ( not ( = ?auto_138935 ?auto_138938 ) ) ( not ( = ?auto_138935 ?auto_138939 ) ) ( not ( = ?auto_138936 ?auto_138937 ) ) ( not ( = ?auto_138936 ?auto_138938 ) ) ( not ( = ?auto_138936 ?auto_138939 ) ) ( not ( = ?auto_138937 ?auto_138938 ) ) ( not ( = ?auto_138937 ?auto_138939 ) ) ( not ( = ?auto_138938 ?auto_138939 ) ) ( ON ?auto_138939 ?auto_138940 ) ( not ( = ?auto_138933 ?auto_138940 ) ) ( not ( = ?auto_138934 ?auto_138940 ) ) ( not ( = ?auto_138935 ?auto_138940 ) ) ( not ( = ?auto_138936 ?auto_138940 ) ) ( not ( = ?auto_138937 ?auto_138940 ) ) ( not ( = ?auto_138938 ?auto_138940 ) ) ( not ( = ?auto_138939 ?auto_138940 ) ) ( ON ?auto_138938 ?auto_138939 ) ( ON-TABLE ?auto_138940 ) ( ON ?auto_138937 ?auto_138938 ) ( ON ?auto_138936 ?auto_138937 ) ( ON ?auto_138935 ?auto_138936 ) ( CLEAR ?auto_138935 ) ( HOLDING ?auto_138934 ) ( CLEAR ?auto_138933 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_138933 ?auto_138934 )
      ( MAKE-7PILE ?auto_138933 ?auto_138934 ?auto_138935 ?auto_138936 ?auto_138937 ?auto_138938 ?auto_138939 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_138941 - BLOCK
      ?auto_138942 - BLOCK
      ?auto_138943 - BLOCK
      ?auto_138944 - BLOCK
      ?auto_138945 - BLOCK
      ?auto_138946 - BLOCK
      ?auto_138947 - BLOCK
    )
    :vars
    (
      ?auto_138948 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_138941 ) ( not ( = ?auto_138941 ?auto_138942 ) ) ( not ( = ?auto_138941 ?auto_138943 ) ) ( not ( = ?auto_138941 ?auto_138944 ) ) ( not ( = ?auto_138941 ?auto_138945 ) ) ( not ( = ?auto_138941 ?auto_138946 ) ) ( not ( = ?auto_138941 ?auto_138947 ) ) ( not ( = ?auto_138942 ?auto_138943 ) ) ( not ( = ?auto_138942 ?auto_138944 ) ) ( not ( = ?auto_138942 ?auto_138945 ) ) ( not ( = ?auto_138942 ?auto_138946 ) ) ( not ( = ?auto_138942 ?auto_138947 ) ) ( not ( = ?auto_138943 ?auto_138944 ) ) ( not ( = ?auto_138943 ?auto_138945 ) ) ( not ( = ?auto_138943 ?auto_138946 ) ) ( not ( = ?auto_138943 ?auto_138947 ) ) ( not ( = ?auto_138944 ?auto_138945 ) ) ( not ( = ?auto_138944 ?auto_138946 ) ) ( not ( = ?auto_138944 ?auto_138947 ) ) ( not ( = ?auto_138945 ?auto_138946 ) ) ( not ( = ?auto_138945 ?auto_138947 ) ) ( not ( = ?auto_138946 ?auto_138947 ) ) ( ON ?auto_138947 ?auto_138948 ) ( not ( = ?auto_138941 ?auto_138948 ) ) ( not ( = ?auto_138942 ?auto_138948 ) ) ( not ( = ?auto_138943 ?auto_138948 ) ) ( not ( = ?auto_138944 ?auto_138948 ) ) ( not ( = ?auto_138945 ?auto_138948 ) ) ( not ( = ?auto_138946 ?auto_138948 ) ) ( not ( = ?auto_138947 ?auto_138948 ) ) ( ON ?auto_138946 ?auto_138947 ) ( ON-TABLE ?auto_138948 ) ( ON ?auto_138945 ?auto_138946 ) ( ON ?auto_138944 ?auto_138945 ) ( ON ?auto_138943 ?auto_138944 ) ( CLEAR ?auto_138941 ) ( ON ?auto_138942 ?auto_138943 ) ( CLEAR ?auto_138942 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_138948 ?auto_138947 ?auto_138946 ?auto_138945 ?auto_138944 ?auto_138943 )
      ( MAKE-7PILE ?auto_138941 ?auto_138942 ?auto_138943 ?auto_138944 ?auto_138945 ?auto_138946 ?auto_138947 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_138949 - BLOCK
      ?auto_138950 - BLOCK
      ?auto_138951 - BLOCK
      ?auto_138952 - BLOCK
      ?auto_138953 - BLOCK
      ?auto_138954 - BLOCK
      ?auto_138955 - BLOCK
    )
    :vars
    (
      ?auto_138956 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_138949 ?auto_138950 ) ) ( not ( = ?auto_138949 ?auto_138951 ) ) ( not ( = ?auto_138949 ?auto_138952 ) ) ( not ( = ?auto_138949 ?auto_138953 ) ) ( not ( = ?auto_138949 ?auto_138954 ) ) ( not ( = ?auto_138949 ?auto_138955 ) ) ( not ( = ?auto_138950 ?auto_138951 ) ) ( not ( = ?auto_138950 ?auto_138952 ) ) ( not ( = ?auto_138950 ?auto_138953 ) ) ( not ( = ?auto_138950 ?auto_138954 ) ) ( not ( = ?auto_138950 ?auto_138955 ) ) ( not ( = ?auto_138951 ?auto_138952 ) ) ( not ( = ?auto_138951 ?auto_138953 ) ) ( not ( = ?auto_138951 ?auto_138954 ) ) ( not ( = ?auto_138951 ?auto_138955 ) ) ( not ( = ?auto_138952 ?auto_138953 ) ) ( not ( = ?auto_138952 ?auto_138954 ) ) ( not ( = ?auto_138952 ?auto_138955 ) ) ( not ( = ?auto_138953 ?auto_138954 ) ) ( not ( = ?auto_138953 ?auto_138955 ) ) ( not ( = ?auto_138954 ?auto_138955 ) ) ( ON ?auto_138955 ?auto_138956 ) ( not ( = ?auto_138949 ?auto_138956 ) ) ( not ( = ?auto_138950 ?auto_138956 ) ) ( not ( = ?auto_138951 ?auto_138956 ) ) ( not ( = ?auto_138952 ?auto_138956 ) ) ( not ( = ?auto_138953 ?auto_138956 ) ) ( not ( = ?auto_138954 ?auto_138956 ) ) ( not ( = ?auto_138955 ?auto_138956 ) ) ( ON ?auto_138954 ?auto_138955 ) ( ON-TABLE ?auto_138956 ) ( ON ?auto_138953 ?auto_138954 ) ( ON ?auto_138952 ?auto_138953 ) ( ON ?auto_138951 ?auto_138952 ) ( ON ?auto_138950 ?auto_138951 ) ( CLEAR ?auto_138950 ) ( HOLDING ?auto_138949 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_138949 )
      ( MAKE-7PILE ?auto_138949 ?auto_138950 ?auto_138951 ?auto_138952 ?auto_138953 ?auto_138954 ?auto_138955 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_138957 - BLOCK
      ?auto_138958 - BLOCK
      ?auto_138959 - BLOCK
      ?auto_138960 - BLOCK
      ?auto_138961 - BLOCK
      ?auto_138962 - BLOCK
      ?auto_138963 - BLOCK
    )
    :vars
    (
      ?auto_138964 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_138957 ?auto_138958 ) ) ( not ( = ?auto_138957 ?auto_138959 ) ) ( not ( = ?auto_138957 ?auto_138960 ) ) ( not ( = ?auto_138957 ?auto_138961 ) ) ( not ( = ?auto_138957 ?auto_138962 ) ) ( not ( = ?auto_138957 ?auto_138963 ) ) ( not ( = ?auto_138958 ?auto_138959 ) ) ( not ( = ?auto_138958 ?auto_138960 ) ) ( not ( = ?auto_138958 ?auto_138961 ) ) ( not ( = ?auto_138958 ?auto_138962 ) ) ( not ( = ?auto_138958 ?auto_138963 ) ) ( not ( = ?auto_138959 ?auto_138960 ) ) ( not ( = ?auto_138959 ?auto_138961 ) ) ( not ( = ?auto_138959 ?auto_138962 ) ) ( not ( = ?auto_138959 ?auto_138963 ) ) ( not ( = ?auto_138960 ?auto_138961 ) ) ( not ( = ?auto_138960 ?auto_138962 ) ) ( not ( = ?auto_138960 ?auto_138963 ) ) ( not ( = ?auto_138961 ?auto_138962 ) ) ( not ( = ?auto_138961 ?auto_138963 ) ) ( not ( = ?auto_138962 ?auto_138963 ) ) ( ON ?auto_138963 ?auto_138964 ) ( not ( = ?auto_138957 ?auto_138964 ) ) ( not ( = ?auto_138958 ?auto_138964 ) ) ( not ( = ?auto_138959 ?auto_138964 ) ) ( not ( = ?auto_138960 ?auto_138964 ) ) ( not ( = ?auto_138961 ?auto_138964 ) ) ( not ( = ?auto_138962 ?auto_138964 ) ) ( not ( = ?auto_138963 ?auto_138964 ) ) ( ON ?auto_138962 ?auto_138963 ) ( ON-TABLE ?auto_138964 ) ( ON ?auto_138961 ?auto_138962 ) ( ON ?auto_138960 ?auto_138961 ) ( ON ?auto_138959 ?auto_138960 ) ( ON ?auto_138958 ?auto_138959 ) ( ON ?auto_138957 ?auto_138958 ) ( CLEAR ?auto_138957 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_138964 ?auto_138963 ?auto_138962 ?auto_138961 ?auto_138960 ?auto_138959 ?auto_138958 )
      ( MAKE-7PILE ?auto_138957 ?auto_138958 ?auto_138959 ?auto_138960 ?auto_138961 ?auto_138962 ?auto_138963 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_138972 - BLOCK
      ?auto_138973 - BLOCK
      ?auto_138974 - BLOCK
      ?auto_138975 - BLOCK
      ?auto_138976 - BLOCK
      ?auto_138977 - BLOCK
      ?auto_138978 - BLOCK
    )
    :vars
    (
      ?auto_138979 - BLOCK
      ?auto_138980 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_138972 ?auto_138973 ) ) ( not ( = ?auto_138972 ?auto_138974 ) ) ( not ( = ?auto_138972 ?auto_138975 ) ) ( not ( = ?auto_138972 ?auto_138976 ) ) ( not ( = ?auto_138972 ?auto_138977 ) ) ( not ( = ?auto_138972 ?auto_138978 ) ) ( not ( = ?auto_138973 ?auto_138974 ) ) ( not ( = ?auto_138973 ?auto_138975 ) ) ( not ( = ?auto_138973 ?auto_138976 ) ) ( not ( = ?auto_138973 ?auto_138977 ) ) ( not ( = ?auto_138973 ?auto_138978 ) ) ( not ( = ?auto_138974 ?auto_138975 ) ) ( not ( = ?auto_138974 ?auto_138976 ) ) ( not ( = ?auto_138974 ?auto_138977 ) ) ( not ( = ?auto_138974 ?auto_138978 ) ) ( not ( = ?auto_138975 ?auto_138976 ) ) ( not ( = ?auto_138975 ?auto_138977 ) ) ( not ( = ?auto_138975 ?auto_138978 ) ) ( not ( = ?auto_138976 ?auto_138977 ) ) ( not ( = ?auto_138976 ?auto_138978 ) ) ( not ( = ?auto_138977 ?auto_138978 ) ) ( ON ?auto_138978 ?auto_138979 ) ( not ( = ?auto_138972 ?auto_138979 ) ) ( not ( = ?auto_138973 ?auto_138979 ) ) ( not ( = ?auto_138974 ?auto_138979 ) ) ( not ( = ?auto_138975 ?auto_138979 ) ) ( not ( = ?auto_138976 ?auto_138979 ) ) ( not ( = ?auto_138977 ?auto_138979 ) ) ( not ( = ?auto_138978 ?auto_138979 ) ) ( ON ?auto_138977 ?auto_138978 ) ( ON-TABLE ?auto_138979 ) ( ON ?auto_138976 ?auto_138977 ) ( ON ?auto_138975 ?auto_138976 ) ( ON ?auto_138974 ?auto_138975 ) ( ON ?auto_138973 ?auto_138974 ) ( CLEAR ?auto_138973 ) ( ON ?auto_138972 ?auto_138980 ) ( CLEAR ?auto_138972 ) ( HAND-EMPTY ) ( not ( = ?auto_138972 ?auto_138980 ) ) ( not ( = ?auto_138973 ?auto_138980 ) ) ( not ( = ?auto_138974 ?auto_138980 ) ) ( not ( = ?auto_138975 ?auto_138980 ) ) ( not ( = ?auto_138976 ?auto_138980 ) ) ( not ( = ?auto_138977 ?auto_138980 ) ) ( not ( = ?auto_138978 ?auto_138980 ) ) ( not ( = ?auto_138979 ?auto_138980 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_138972 ?auto_138980 )
      ( MAKE-7PILE ?auto_138972 ?auto_138973 ?auto_138974 ?auto_138975 ?auto_138976 ?auto_138977 ?auto_138978 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_138981 - BLOCK
      ?auto_138982 - BLOCK
      ?auto_138983 - BLOCK
      ?auto_138984 - BLOCK
      ?auto_138985 - BLOCK
      ?auto_138986 - BLOCK
      ?auto_138987 - BLOCK
    )
    :vars
    (
      ?auto_138988 - BLOCK
      ?auto_138989 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_138981 ?auto_138982 ) ) ( not ( = ?auto_138981 ?auto_138983 ) ) ( not ( = ?auto_138981 ?auto_138984 ) ) ( not ( = ?auto_138981 ?auto_138985 ) ) ( not ( = ?auto_138981 ?auto_138986 ) ) ( not ( = ?auto_138981 ?auto_138987 ) ) ( not ( = ?auto_138982 ?auto_138983 ) ) ( not ( = ?auto_138982 ?auto_138984 ) ) ( not ( = ?auto_138982 ?auto_138985 ) ) ( not ( = ?auto_138982 ?auto_138986 ) ) ( not ( = ?auto_138982 ?auto_138987 ) ) ( not ( = ?auto_138983 ?auto_138984 ) ) ( not ( = ?auto_138983 ?auto_138985 ) ) ( not ( = ?auto_138983 ?auto_138986 ) ) ( not ( = ?auto_138983 ?auto_138987 ) ) ( not ( = ?auto_138984 ?auto_138985 ) ) ( not ( = ?auto_138984 ?auto_138986 ) ) ( not ( = ?auto_138984 ?auto_138987 ) ) ( not ( = ?auto_138985 ?auto_138986 ) ) ( not ( = ?auto_138985 ?auto_138987 ) ) ( not ( = ?auto_138986 ?auto_138987 ) ) ( ON ?auto_138987 ?auto_138988 ) ( not ( = ?auto_138981 ?auto_138988 ) ) ( not ( = ?auto_138982 ?auto_138988 ) ) ( not ( = ?auto_138983 ?auto_138988 ) ) ( not ( = ?auto_138984 ?auto_138988 ) ) ( not ( = ?auto_138985 ?auto_138988 ) ) ( not ( = ?auto_138986 ?auto_138988 ) ) ( not ( = ?auto_138987 ?auto_138988 ) ) ( ON ?auto_138986 ?auto_138987 ) ( ON-TABLE ?auto_138988 ) ( ON ?auto_138985 ?auto_138986 ) ( ON ?auto_138984 ?auto_138985 ) ( ON ?auto_138983 ?auto_138984 ) ( ON ?auto_138981 ?auto_138989 ) ( CLEAR ?auto_138981 ) ( not ( = ?auto_138981 ?auto_138989 ) ) ( not ( = ?auto_138982 ?auto_138989 ) ) ( not ( = ?auto_138983 ?auto_138989 ) ) ( not ( = ?auto_138984 ?auto_138989 ) ) ( not ( = ?auto_138985 ?auto_138989 ) ) ( not ( = ?auto_138986 ?auto_138989 ) ) ( not ( = ?auto_138987 ?auto_138989 ) ) ( not ( = ?auto_138988 ?auto_138989 ) ) ( HOLDING ?auto_138982 ) ( CLEAR ?auto_138983 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_138988 ?auto_138987 ?auto_138986 ?auto_138985 ?auto_138984 ?auto_138983 ?auto_138982 )
      ( MAKE-7PILE ?auto_138981 ?auto_138982 ?auto_138983 ?auto_138984 ?auto_138985 ?auto_138986 ?auto_138987 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_138990 - BLOCK
      ?auto_138991 - BLOCK
      ?auto_138992 - BLOCK
      ?auto_138993 - BLOCK
      ?auto_138994 - BLOCK
      ?auto_138995 - BLOCK
      ?auto_138996 - BLOCK
    )
    :vars
    (
      ?auto_138997 - BLOCK
      ?auto_138998 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_138990 ?auto_138991 ) ) ( not ( = ?auto_138990 ?auto_138992 ) ) ( not ( = ?auto_138990 ?auto_138993 ) ) ( not ( = ?auto_138990 ?auto_138994 ) ) ( not ( = ?auto_138990 ?auto_138995 ) ) ( not ( = ?auto_138990 ?auto_138996 ) ) ( not ( = ?auto_138991 ?auto_138992 ) ) ( not ( = ?auto_138991 ?auto_138993 ) ) ( not ( = ?auto_138991 ?auto_138994 ) ) ( not ( = ?auto_138991 ?auto_138995 ) ) ( not ( = ?auto_138991 ?auto_138996 ) ) ( not ( = ?auto_138992 ?auto_138993 ) ) ( not ( = ?auto_138992 ?auto_138994 ) ) ( not ( = ?auto_138992 ?auto_138995 ) ) ( not ( = ?auto_138992 ?auto_138996 ) ) ( not ( = ?auto_138993 ?auto_138994 ) ) ( not ( = ?auto_138993 ?auto_138995 ) ) ( not ( = ?auto_138993 ?auto_138996 ) ) ( not ( = ?auto_138994 ?auto_138995 ) ) ( not ( = ?auto_138994 ?auto_138996 ) ) ( not ( = ?auto_138995 ?auto_138996 ) ) ( ON ?auto_138996 ?auto_138997 ) ( not ( = ?auto_138990 ?auto_138997 ) ) ( not ( = ?auto_138991 ?auto_138997 ) ) ( not ( = ?auto_138992 ?auto_138997 ) ) ( not ( = ?auto_138993 ?auto_138997 ) ) ( not ( = ?auto_138994 ?auto_138997 ) ) ( not ( = ?auto_138995 ?auto_138997 ) ) ( not ( = ?auto_138996 ?auto_138997 ) ) ( ON ?auto_138995 ?auto_138996 ) ( ON-TABLE ?auto_138997 ) ( ON ?auto_138994 ?auto_138995 ) ( ON ?auto_138993 ?auto_138994 ) ( ON ?auto_138992 ?auto_138993 ) ( ON ?auto_138990 ?auto_138998 ) ( not ( = ?auto_138990 ?auto_138998 ) ) ( not ( = ?auto_138991 ?auto_138998 ) ) ( not ( = ?auto_138992 ?auto_138998 ) ) ( not ( = ?auto_138993 ?auto_138998 ) ) ( not ( = ?auto_138994 ?auto_138998 ) ) ( not ( = ?auto_138995 ?auto_138998 ) ) ( not ( = ?auto_138996 ?auto_138998 ) ) ( not ( = ?auto_138997 ?auto_138998 ) ) ( CLEAR ?auto_138992 ) ( ON ?auto_138991 ?auto_138990 ) ( CLEAR ?auto_138991 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_138998 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_138998 ?auto_138990 )
      ( MAKE-7PILE ?auto_138990 ?auto_138991 ?auto_138992 ?auto_138993 ?auto_138994 ?auto_138995 ?auto_138996 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_138999 - BLOCK
      ?auto_139000 - BLOCK
      ?auto_139001 - BLOCK
      ?auto_139002 - BLOCK
      ?auto_139003 - BLOCK
      ?auto_139004 - BLOCK
      ?auto_139005 - BLOCK
    )
    :vars
    (
      ?auto_139006 - BLOCK
      ?auto_139007 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_138999 ?auto_139000 ) ) ( not ( = ?auto_138999 ?auto_139001 ) ) ( not ( = ?auto_138999 ?auto_139002 ) ) ( not ( = ?auto_138999 ?auto_139003 ) ) ( not ( = ?auto_138999 ?auto_139004 ) ) ( not ( = ?auto_138999 ?auto_139005 ) ) ( not ( = ?auto_139000 ?auto_139001 ) ) ( not ( = ?auto_139000 ?auto_139002 ) ) ( not ( = ?auto_139000 ?auto_139003 ) ) ( not ( = ?auto_139000 ?auto_139004 ) ) ( not ( = ?auto_139000 ?auto_139005 ) ) ( not ( = ?auto_139001 ?auto_139002 ) ) ( not ( = ?auto_139001 ?auto_139003 ) ) ( not ( = ?auto_139001 ?auto_139004 ) ) ( not ( = ?auto_139001 ?auto_139005 ) ) ( not ( = ?auto_139002 ?auto_139003 ) ) ( not ( = ?auto_139002 ?auto_139004 ) ) ( not ( = ?auto_139002 ?auto_139005 ) ) ( not ( = ?auto_139003 ?auto_139004 ) ) ( not ( = ?auto_139003 ?auto_139005 ) ) ( not ( = ?auto_139004 ?auto_139005 ) ) ( ON ?auto_139005 ?auto_139006 ) ( not ( = ?auto_138999 ?auto_139006 ) ) ( not ( = ?auto_139000 ?auto_139006 ) ) ( not ( = ?auto_139001 ?auto_139006 ) ) ( not ( = ?auto_139002 ?auto_139006 ) ) ( not ( = ?auto_139003 ?auto_139006 ) ) ( not ( = ?auto_139004 ?auto_139006 ) ) ( not ( = ?auto_139005 ?auto_139006 ) ) ( ON ?auto_139004 ?auto_139005 ) ( ON-TABLE ?auto_139006 ) ( ON ?auto_139003 ?auto_139004 ) ( ON ?auto_139002 ?auto_139003 ) ( ON ?auto_138999 ?auto_139007 ) ( not ( = ?auto_138999 ?auto_139007 ) ) ( not ( = ?auto_139000 ?auto_139007 ) ) ( not ( = ?auto_139001 ?auto_139007 ) ) ( not ( = ?auto_139002 ?auto_139007 ) ) ( not ( = ?auto_139003 ?auto_139007 ) ) ( not ( = ?auto_139004 ?auto_139007 ) ) ( not ( = ?auto_139005 ?auto_139007 ) ) ( not ( = ?auto_139006 ?auto_139007 ) ) ( ON ?auto_139000 ?auto_138999 ) ( CLEAR ?auto_139000 ) ( ON-TABLE ?auto_139007 ) ( HOLDING ?auto_139001 ) ( CLEAR ?auto_139002 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_139006 ?auto_139005 ?auto_139004 ?auto_139003 ?auto_139002 ?auto_139001 )
      ( MAKE-7PILE ?auto_138999 ?auto_139000 ?auto_139001 ?auto_139002 ?auto_139003 ?auto_139004 ?auto_139005 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_139008 - BLOCK
      ?auto_139009 - BLOCK
      ?auto_139010 - BLOCK
      ?auto_139011 - BLOCK
      ?auto_139012 - BLOCK
      ?auto_139013 - BLOCK
      ?auto_139014 - BLOCK
    )
    :vars
    (
      ?auto_139015 - BLOCK
      ?auto_139016 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_139008 ?auto_139009 ) ) ( not ( = ?auto_139008 ?auto_139010 ) ) ( not ( = ?auto_139008 ?auto_139011 ) ) ( not ( = ?auto_139008 ?auto_139012 ) ) ( not ( = ?auto_139008 ?auto_139013 ) ) ( not ( = ?auto_139008 ?auto_139014 ) ) ( not ( = ?auto_139009 ?auto_139010 ) ) ( not ( = ?auto_139009 ?auto_139011 ) ) ( not ( = ?auto_139009 ?auto_139012 ) ) ( not ( = ?auto_139009 ?auto_139013 ) ) ( not ( = ?auto_139009 ?auto_139014 ) ) ( not ( = ?auto_139010 ?auto_139011 ) ) ( not ( = ?auto_139010 ?auto_139012 ) ) ( not ( = ?auto_139010 ?auto_139013 ) ) ( not ( = ?auto_139010 ?auto_139014 ) ) ( not ( = ?auto_139011 ?auto_139012 ) ) ( not ( = ?auto_139011 ?auto_139013 ) ) ( not ( = ?auto_139011 ?auto_139014 ) ) ( not ( = ?auto_139012 ?auto_139013 ) ) ( not ( = ?auto_139012 ?auto_139014 ) ) ( not ( = ?auto_139013 ?auto_139014 ) ) ( ON ?auto_139014 ?auto_139015 ) ( not ( = ?auto_139008 ?auto_139015 ) ) ( not ( = ?auto_139009 ?auto_139015 ) ) ( not ( = ?auto_139010 ?auto_139015 ) ) ( not ( = ?auto_139011 ?auto_139015 ) ) ( not ( = ?auto_139012 ?auto_139015 ) ) ( not ( = ?auto_139013 ?auto_139015 ) ) ( not ( = ?auto_139014 ?auto_139015 ) ) ( ON ?auto_139013 ?auto_139014 ) ( ON-TABLE ?auto_139015 ) ( ON ?auto_139012 ?auto_139013 ) ( ON ?auto_139011 ?auto_139012 ) ( ON ?auto_139008 ?auto_139016 ) ( not ( = ?auto_139008 ?auto_139016 ) ) ( not ( = ?auto_139009 ?auto_139016 ) ) ( not ( = ?auto_139010 ?auto_139016 ) ) ( not ( = ?auto_139011 ?auto_139016 ) ) ( not ( = ?auto_139012 ?auto_139016 ) ) ( not ( = ?auto_139013 ?auto_139016 ) ) ( not ( = ?auto_139014 ?auto_139016 ) ) ( not ( = ?auto_139015 ?auto_139016 ) ) ( ON ?auto_139009 ?auto_139008 ) ( ON-TABLE ?auto_139016 ) ( CLEAR ?auto_139011 ) ( ON ?auto_139010 ?auto_139009 ) ( CLEAR ?auto_139010 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_139016 ?auto_139008 ?auto_139009 )
      ( MAKE-7PILE ?auto_139008 ?auto_139009 ?auto_139010 ?auto_139011 ?auto_139012 ?auto_139013 ?auto_139014 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_139017 - BLOCK
      ?auto_139018 - BLOCK
      ?auto_139019 - BLOCK
      ?auto_139020 - BLOCK
      ?auto_139021 - BLOCK
      ?auto_139022 - BLOCK
      ?auto_139023 - BLOCK
    )
    :vars
    (
      ?auto_139024 - BLOCK
      ?auto_139025 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_139017 ?auto_139018 ) ) ( not ( = ?auto_139017 ?auto_139019 ) ) ( not ( = ?auto_139017 ?auto_139020 ) ) ( not ( = ?auto_139017 ?auto_139021 ) ) ( not ( = ?auto_139017 ?auto_139022 ) ) ( not ( = ?auto_139017 ?auto_139023 ) ) ( not ( = ?auto_139018 ?auto_139019 ) ) ( not ( = ?auto_139018 ?auto_139020 ) ) ( not ( = ?auto_139018 ?auto_139021 ) ) ( not ( = ?auto_139018 ?auto_139022 ) ) ( not ( = ?auto_139018 ?auto_139023 ) ) ( not ( = ?auto_139019 ?auto_139020 ) ) ( not ( = ?auto_139019 ?auto_139021 ) ) ( not ( = ?auto_139019 ?auto_139022 ) ) ( not ( = ?auto_139019 ?auto_139023 ) ) ( not ( = ?auto_139020 ?auto_139021 ) ) ( not ( = ?auto_139020 ?auto_139022 ) ) ( not ( = ?auto_139020 ?auto_139023 ) ) ( not ( = ?auto_139021 ?auto_139022 ) ) ( not ( = ?auto_139021 ?auto_139023 ) ) ( not ( = ?auto_139022 ?auto_139023 ) ) ( ON ?auto_139023 ?auto_139024 ) ( not ( = ?auto_139017 ?auto_139024 ) ) ( not ( = ?auto_139018 ?auto_139024 ) ) ( not ( = ?auto_139019 ?auto_139024 ) ) ( not ( = ?auto_139020 ?auto_139024 ) ) ( not ( = ?auto_139021 ?auto_139024 ) ) ( not ( = ?auto_139022 ?auto_139024 ) ) ( not ( = ?auto_139023 ?auto_139024 ) ) ( ON ?auto_139022 ?auto_139023 ) ( ON-TABLE ?auto_139024 ) ( ON ?auto_139021 ?auto_139022 ) ( ON ?auto_139017 ?auto_139025 ) ( not ( = ?auto_139017 ?auto_139025 ) ) ( not ( = ?auto_139018 ?auto_139025 ) ) ( not ( = ?auto_139019 ?auto_139025 ) ) ( not ( = ?auto_139020 ?auto_139025 ) ) ( not ( = ?auto_139021 ?auto_139025 ) ) ( not ( = ?auto_139022 ?auto_139025 ) ) ( not ( = ?auto_139023 ?auto_139025 ) ) ( not ( = ?auto_139024 ?auto_139025 ) ) ( ON ?auto_139018 ?auto_139017 ) ( ON-TABLE ?auto_139025 ) ( ON ?auto_139019 ?auto_139018 ) ( CLEAR ?auto_139019 ) ( HOLDING ?auto_139020 ) ( CLEAR ?auto_139021 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_139024 ?auto_139023 ?auto_139022 ?auto_139021 ?auto_139020 )
      ( MAKE-7PILE ?auto_139017 ?auto_139018 ?auto_139019 ?auto_139020 ?auto_139021 ?auto_139022 ?auto_139023 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_139026 - BLOCK
      ?auto_139027 - BLOCK
      ?auto_139028 - BLOCK
      ?auto_139029 - BLOCK
      ?auto_139030 - BLOCK
      ?auto_139031 - BLOCK
      ?auto_139032 - BLOCK
    )
    :vars
    (
      ?auto_139033 - BLOCK
      ?auto_139034 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_139026 ?auto_139027 ) ) ( not ( = ?auto_139026 ?auto_139028 ) ) ( not ( = ?auto_139026 ?auto_139029 ) ) ( not ( = ?auto_139026 ?auto_139030 ) ) ( not ( = ?auto_139026 ?auto_139031 ) ) ( not ( = ?auto_139026 ?auto_139032 ) ) ( not ( = ?auto_139027 ?auto_139028 ) ) ( not ( = ?auto_139027 ?auto_139029 ) ) ( not ( = ?auto_139027 ?auto_139030 ) ) ( not ( = ?auto_139027 ?auto_139031 ) ) ( not ( = ?auto_139027 ?auto_139032 ) ) ( not ( = ?auto_139028 ?auto_139029 ) ) ( not ( = ?auto_139028 ?auto_139030 ) ) ( not ( = ?auto_139028 ?auto_139031 ) ) ( not ( = ?auto_139028 ?auto_139032 ) ) ( not ( = ?auto_139029 ?auto_139030 ) ) ( not ( = ?auto_139029 ?auto_139031 ) ) ( not ( = ?auto_139029 ?auto_139032 ) ) ( not ( = ?auto_139030 ?auto_139031 ) ) ( not ( = ?auto_139030 ?auto_139032 ) ) ( not ( = ?auto_139031 ?auto_139032 ) ) ( ON ?auto_139032 ?auto_139033 ) ( not ( = ?auto_139026 ?auto_139033 ) ) ( not ( = ?auto_139027 ?auto_139033 ) ) ( not ( = ?auto_139028 ?auto_139033 ) ) ( not ( = ?auto_139029 ?auto_139033 ) ) ( not ( = ?auto_139030 ?auto_139033 ) ) ( not ( = ?auto_139031 ?auto_139033 ) ) ( not ( = ?auto_139032 ?auto_139033 ) ) ( ON ?auto_139031 ?auto_139032 ) ( ON-TABLE ?auto_139033 ) ( ON ?auto_139030 ?auto_139031 ) ( ON ?auto_139026 ?auto_139034 ) ( not ( = ?auto_139026 ?auto_139034 ) ) ( not ( = ?auto_139027 ?auto_139034 ) ) ( not ( = ?auto_139028 ?auto_139034 ) ) ( not ( = ?auto_139029 ?auto_139034 ) ) ( not ( = ?auto_139030 ?auto_139034 ) ) ( not ( = ?auto_139031 ?auto_139034 ) ) ( not ( = ?auto_139032 ?auto_139034 ) ) ( not ( = ?auto_139033 ?auto_139034 ) ) ( ON ?auto_139027 ?auto_139026 ) ( ON-TABLE ?auto_139034 ) ( ON ?auto_139028 ?auto_139027 ) ( CLEAR ?auto_139030 ) ( ON ?auto_139029 ?auto_139028 ) ( CLEAR ?auto_139029 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_139034 ?auto_139026 ?auto_139027 ?auto_139028 )
      ( MAKE-7PILE ?auto_139026 ?auto_139027 ?auto_139028 ?auto_139029 ?auto_139030 ?auto_139031 ?auto_139032 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_139035 - BLOCK
      ?auto_139036 - BLOCK
      ?auto_139037 - BLOCK
      ?auto_139038 - BLOCK
      ?auto_139039 - BLOCK
      ?auto_139040 - BLOCK
      ?auto_139041 - BLOCK
    )
    :vars
    (
      ?auto_139043 - BLOCK
      ?auto_139042 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_139035 ?auto_139036 ) ) ( not ( = ?auto_139035 ?auto_139037 ) ) ( not ( = ?auto_139035 ?auto_139038 ) ) ( not ( = ?auto_139035 ?auto_139039 ) ) ( not ( = ?auto_139035 ?auto_139040 ) ) ( not ( = ?auto_139035 ?auto_139041 ) ) ( not ( = ?auto_139036 ?auto_139037 ) ) ( not ( = ?auto_139036 ?auto_139038 ) ) ( not ( = ?auto_139036 ?auto_139039 ) ) ( not ( = ?auto_139036 ?auto_139040 ) ) ( not ( = ?auto_139036 ?auto_139041 ) ) ( not ( = ?auto_139037 ?auto_139038 ) ) ( not ( = ?auto_139037 ?auto_139039 ) ) ( not ( = ?auto_139037 ?auto_139040 ) ) ( not ( = ?auto_139037 ?auto_139041 ) ) ( not ( = ?auto_139038 ?auto_139039 ) ) ( not ( = ?auto_139038 ?auto_139040 ) ) ( not ( = ?auto_139038 ?auto_139041 ) ) ( not ( = ?auto_139039 ?auto_139040 ) ) ( not ( = ?auto_139039 ?auto_139041 ) ) ( not ( = ?auto_139040 ?auto_139041 ) ) ( ON ?auto_139041 ?auto_139043 ) ( not ( = ?auto_139035 ?auto_139043 ) ) ( not ( = ?auto_139036 ?auto_139043 ) ) ( not ( = ?auto_139037 ?auto_139043 ) ) ( not ( = ?auto_139038 ?auto_139043 ) ) ( not ( = ?auto_139039 ?auto_139043 ) ) ( not ( = ?auto_139040 ?auto_139043 ) ) ( not ( = ?auto_139041 ?auto_139043 ) ) ( ON ?auto_139040 ?auto_139041 ) ( ON-TABLE ?auto_139043 ) ( ON ?auto_139035 ?auto_139042 ) ( not ( = ?auto_139035 ?auto_139042 ) ) ( not ( = ?auto_139036 ?auto_139042 ) ) ( not ( = ?auto_139037 ?auto_139042 ) ) ( not ( = ?auto_139038 ?auto_139042 ) ) ( not ( = ?auto_139039 ?auto_139042 ) ) ( not ( = ?auto_139040 ?auto_139042 ) ) ( not ( = ?auto_139041 ?auto_139042 ) ) ( not ( = ?auto_139043 ?auto_139042 ) ) ( ON ?auto_139036 ?auto_139035 ) ( ON-TABLE ?auto_139042 ) ( ON ?auto_139037 ?auto_139036 ) ( ON ?auto_139038 ?auto_139037 ) ( CLEAR ?auto_139038 ) ( HOLDING ?auto_139039 ) ( CLEAR ?auto_139040 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_139043 ?auto_139041 ?auto_139040 ?auto_139039 )
      ( MAKE-7PILE ?auto_139035 ?auto_139036 ?auto_139037 ?auto_139038 ?auto_139039 ?auto_139040 ?auto_139041 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_139044 - BLOCK
      ?auto_139045 - BLOCK
      ?auto_139046 - BLOCK
      ?auto_139047 - BLOCK
      ?auto_139048 - BLOCK
      ?auto_139049 - BLOCK
      ?auto_139050 - BLOCK
    )
    :vars
    (
      ?auto_139051 - BLOCK
      ?auto_139052 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_139044 ?auto_139045 ) ) ( not ( = ?auto_139044 ?auto_139046 ) ) ( not ( = ?auto_139044 ?auto_139047 ) ) ( not ( = ?auto_139044 ?auto_139048 ) ) ( not ( = ?auto_139044 ?auto_139049 ) ) ( not ( = ?auto_139044 ?auto_139050 ) ) ( not ( = ?auto_139045 ?auto_139046 ) ) ( not ( = ?auto_139045 ?auto_139047 ) ) ( not ( = ?auto_139045 ?auto_139048 ) ) ( not ( = ?auto_139045 ?auto_139049 ) ) ( not ( = ?auto_139045 ?auto_139050 ) ) ( not ( = ?auto_139046 ?auto_139047 ) ) ( not ( = ?auto_139046 ?auto_139048 ) ) ( not ( = ?auto_139046 ?auto_139049 ) ) ( not ( = ?auto_139046 ?auto_139050 ) ) ( not ( = ?auto_139047 ?auto_139048 ) ) ( not ( = ?auto_139047 ?auto_139049 ) ) ( not ( = ?auto_139047 ?auto_139050 ) ) ( not ( = ?auto_139048 ?auto_139049 ) ) ( not ( = ?auto_139048 ?auto_139050 ) ) ( not ( = ?auto_139049 ?auto_139050 ) ) ( ON ?auto_139050 ?auto_139051 ) ( not ( = ?auto_139044 ?auto_139051 ) ) ( not ( = ?auto_139045 ?auto_139051 ) ) ( not ( = ?auto_139046 ?auto_139051 ) ) ( not ( = ?auto_139047 ?auto_139051 ) ) ( not ( = ?auto_139048 ?auto_139051 ) ) ( not ( = ?auto_139049 ?auto_139051 ) ) ( not ( = ?auto_139050 ?auto_139051 ) ) ( ON ?auto_139049 ?auto_139050 ) ( ON-TABLE ?auto_139051 ) ( ON ?auto_139044 ?auto_139052 ) ( not ( = ?auto_139044 ?auto_139052 ) ) ( not ( = ?auto_139045 ?auto_139052 ) ) ( not ( = ?auto_139046 ?auto_139052 ) ) ( not ( = ?auto_139047 ?auto_139052 ) ) ( not ( = ?auto_139048 ?auto_139052 ) ) ( not ( = ?auto_139049 ?auto_139052 ) ) ( not ( = ?auto_139050 ?auto_139052 ) ) ( not ( = ?auto_139051 ?auto_139052 ) ) ( ON ?auto_139045 ?auto_139044 ) ( ON-TABLE ?auto_139052 ) ( ON ?auto_139046 ?auto_139045 ) ( ON ?auto_139047 ?auto_139046 ) ( CLEAR ?auto_139049 ) ( ON ?auto_139048 ?auto_139047 ) ( CLEAR ?auto_139048 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_139052 ?auto_139044 ?auto_139045 ?auto_139046 ?auto_139047 )
      ( MAKE-7PILE ?auto_139044 ?auto_139045 ?auto_139046 ?auto_139047 ?auto_139048 ?auto_139049 ?auto_139050 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_139053 - BLOCK
      ?auto_139054 - BLOCK
      ?auto_139055 - BLOCK
      ?auto_139056 - BLOCK
      ?auto_139057 - BLOCK
      ?auto_139058 - BLOCK
      ?auto_139059 - BLOCK
    )
    :vars
    (
      ?auto_139061 - BLOCK
      ?auto_139060 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_139053 ?auto_139054 ) ) ( not ( = ?auto_139053 ?auto_139055 ) ) ( not ( = ?auto_139053 ?auto_139056 ) ) ( not ( = ?auto_139053 ?auto_139057 ) ) ( not ( = ?auto_139053 ?auto_139058 ) ) ( not ( = ?auto_139053 ?auto_139059 ) ) ( not ( = ?auto_139054 ?auto_139055 ) ) ( not ( = ?auto_139054 ?auto_139056 ) ) ( not ( = ?auto_139054 ?auto_139057 ) ) ( not ( = ?auto_139054 ?auto_139058 ) ) ( not ( = ?auto_139054 ?auto_139059 ) ) ( not ( = ?auto_139055 ?auto_139056 ) ) ( not ( = ?auto_139055 ?auto_139057 ) ) ( not ( = ?auto_139055 ?auto_139058 ) ) ( not ( = ?auto_139055 ?auto_139059 ) ) ( not ( = ?auto_139056 ?auto_139057 ) ) ( not ( = ?auto_139056 ?auto_139058 ) ) ( not ( = ?auto_139056 ?auto_139059 ) ) ( not ( = ?auto_139057 ?auto_139058 ) ) ( not ( = ?auto_139057 ?auto_139059 ) ) ( not ( = ?auto_139058 ?auto_139059 ) ) ( ON ?auto_139059 ?auto_139061 ) ( not ( = ?auto_139053 ?auto_139061 ) ) ( not ( = ?auto_139054 ?auto_139061 ) ) ( not ( = ?auto_139055 ?auto_139061 ) ) ( not ( = ?auto_139056 ?auto_139061 ) ) ( not ( = ?auto_139057 ?auto_139061 ) ) ( not ( = ?auto_139058 ?auto_139061 ) ) ( not ( = ?auto_139059 ?auto_139061 ) ) ( ON-TABLE ?auto_139061 ) ( ON ?auto_139053 ?auto_139060 ) ( not ( = ?auto_139053 ?auto_139060 ) ) ( not ( = ?auto_139054 ?auto_139060 ) ) ( not ( = ?auto_139055 ?auto_139060 ) ) ( not ( = ?auto_139056 ?auto_139060 ) ) ( not ( = ?auto_139057 ?auto_139060 ) ) ( not ( = ?auto_139058 ?auto_139060 ) ) ( not ( = ?auto_139059 ?auto_139060 ) ) ( not ( = ?auto_139061 ?auto_139060 ) ) ( ON ?auto_139054 ?auto_139053 ) ( ON-TABLE ?auto_139060 ) ( ON ?auto_139055 ?auto_139054 ) ( ON ?auto_139056 ?auto_139055 ) ( ON ?auto_139057 ?auto_139056 ) ( CLEAR ?auto_139057 ) ( HOLDING ?auto_139058 ) ( CLEAR ?auto_139059 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_139061 ?auto_139059 ?auto_139058 )
      ( MAKE-7PILE ?auto_139053 ?auto_139054 ?auto_139055 ?auto_139056 ?auto_139057 ?auto_139058 ?auto_139059 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_139062 - BLOCK
      ?auto_139063 - BLOCK
      ?auto_139064 - BLOCK
      ?auto_139065 - BLOCK
      ?auto_139066 - BLOCK
      ?auto_139067 - BLOCK
      ?auto_139068 - BLOCK
    )
    :vars
    (
      ?auto_139069 - BLOCK
      ?auto_139070 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_139062 ?auto_139063 ) ) ( not ( = ?auto_139062 ?auto_139064 ) ) ( not ( = ?auto_139062 ?auto_139065 ) ) ( not ( = ?auto_139062 ?auto_139066 ) ) ( not ( = ?auto_139062 ?auto_139067 ) ) ( not ( = ?auto_139062 ?auto_139068 ) ) ( not ( = ?auto_139063 ?auto_139064 ) ) ( not ( = ?auto_139063 ?auto_139065 ) ) ( not ( = ?auto_139063 ?auto_139066 ) ) ( not ( = ?auto_139063 ?auto_139067 ) ) ( not ( = ?auto_139063 ?auto_139068 ) ) ( not ( = ?auto_139064 ?auto_139065 ) ) ( not ( = ?auto_139064 ?auto_139066 ) ) ( not ( = ?auto_139064 ?auto_139067 ) ) ( not ( = ?auto_139064 ?auto_139068 ) ) ( not ( = ?auto_139065 ?auto_139066 ) ) ( not ( = ?auto_139065 ?auto_139067 ) ) ( not ( = ?auto_139065 ?auto_139068 ) ) ( not ( = ?auto_139066 ?auto_139067 ) ) ( not ( = ?auto_139066 ?auto_139068 ) ) ( not ( = ?auto_139067 ?auto_139068 ) ) ( ON ?auto_139068 ?auto_139069 ) ( not ( = ?auto_139062 ?auto_139069 ) ) ( not ( = ?auto_139063 ?auto_139069 ) ) ( not ( = ?auto_139064 ?auto_139069 ) ) ( not ( = ?auto_139065 ?auto_139069 ) ) ( not ( = ?auto_139066 ?auto_139069 ) ) ( not ( = ?auto_139067 ?auto_139069 ) ) ( not ( = ?auto_139068 ?auto_139069 ) ) ( ON-TABLE ?auto_139069 ) ( ON ?auto_139062 ?auto_139070 ) ( not ( = ?auto_139062 ?auto_139070 ) ) ( not ( = ?auto_139063 ?auto_139070 ) ) ( not ( = ?auto_139064 ?auto_139070 ) ) ( not ( = ?auto_139065 ?auto_139070 ) ) ( not ( = ?auto_139066 ?auto_139070 ) ) ( not ( = ?auto_139067 ?auto_139070 ) ) ( not ( = ?auto_139068 ?auto_139070 ) ) ( not ( = ?auto_139069 ?auto_139070 ) ) ( ON ?auto_139063 ?auto_139062 ) ( ON-TABLE ?auto_139070 ) ( ON ?auto_139064 ?auto_139063 ) ( ON ?auto_139065 ?auto_139064 ) ( ON ?auto_139066 ?auto_139065 ) ( CLEAR ?auto_139068 ) ( ON ?auto_139067 ?auto_139066 ) ( CLEAR ?auto_139067 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_139070 ?auto_139062 ?auto_139063 ?auto_139064 ?auto_139065 ?auto_139066 )
      ( MAKE-7PILE ?auto_139062 ?auto_139063 ?auto_139064 ?auto_139065 ?auto_139066 ?auto_139067 ?auto_139068 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_139071 - BLOCK
      ?auto_139072 - BLOCK
      ?auto_139073 - BLOCK
      ?auto_139074 - BLOCK
      ?auto_139075 - BLOCK
      ?auto_139076 - BLOCK
      ?auto_139077 - BLOCK
    )
    :vars
    (
      ?auto_139078 - BLOCK
      ?auto_139079 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_139071 ?auto_139072 ) ) ( not ( = ?auto_139071 ?auto_139073 ) ) ( not ( = ?auto_139071 ?auto_139074 ) ) ( not ( = ?auto_139071 ?auto_139075 ) ) ( not ( = ?auto_139071 ?auto_139076 ) ) ( not ( = ?auto_139071 ?auto_139077 ) ) ( not ( = ?auto_139072 ?auto_139073 ) ) ( not ( = ?auto_139072 ?auto_139074 ) ) ( not ( = ?auto_139072 ?auto_139075 ) ) ( not ( = ?auto_139072 ?auto_139076 ) ) ( not ( = ?auto_139072 ?auto_139077 ) ) ( not ( = ?auto_139073 ?auto_139074 ) ) ( not ( = ?auto_139073 ?auto_139075 ) ) ( not ( = ?auto_139073 ?auto_139076 ) ) ( not ( = ?auto_139073 ?auto_139077 ) ) ( not ( = ?auto_139074 ?auto_139075 ) ) ( not ( = ?auto_139074 ?auto_139076 ) ) ( not ( = ?auto_139074 ?auto_139077 ) ) ( not ( = ?auto_139075 ?auto_139076 ) ) ( not ( = ?auto_139075 ?auto_139077 ) ) ( not ( = ?auto_139076 ?auto_139077 ) ) ( not ( = ?auto_139071 ?auto_139078 ) ) ( not ( = ?auto_139072 ?auto_139078 ) ) ( not ( = ?auto_139073 ?auto_139078 ) ) ( not ( = ?auto_139074 ?auto_139078 ) ) ( not ( = ?auto_139075 ?auto_139078 ) ) ( not ( = ?auto_139076 ?auto_139078 ) ) ( not ( = ?auto_139077 ?auto_139078 ) ) ( ON-TABLE ?auto_139078 ) ( ON ?auto_139071 ?auto_139079 ) ( not ( = ?auto_139071 ?auto_139079 ) ) ( not ( = ?auto_139072 ?auto_139079 ) ) ( not ( = ?auto_139073 ?auto_139079 ) ) ( not ( = ?auto_139074 ?auto_139079 ) ) ( not ( = ?auto_139075 ?auto_139079 ) ) ( not ( = ?auto_139076 ?auto_139079 ) ) ( not ( = ?auto_139077 ?auto_139079 ) ) ( not ( = ?auto_139078 ?auto_139079 ) ) ( ON ?auto_139072 ?auto_139071 ) ( ON-TABLE ?auto_139079 ) ( ON ?auto_139073 ?auto_139072 ) ( ON ?auto_139074 ?auto_139073 ) ( ON ?auto_139075 ?auto_139074 ) ( ON ?auto_139076 ?auto_139075 ) ( CLEAR ?auto_139076 ) ( HOLDING ?auto_139077 ) ( CLEAR ?auto_139078 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_139078 ?auto_139077 )
      ( MAKE-7PILE ?auto_139071 ?auto_139072 ?auto_139073 ?auto_139074 ?auto_139075 ?auto_139076 ?auto_139077 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_139080 - BLOCK
      ?auto_139081 - BLOCK
      ?auto_139082 - BLOCK
      ?auto_139083 - BLOCK
      ?auto_139084 - BLOCK
      ?auto_139085 - BLOCK
      ?auto_139086 - BLOCK
    )
    :vars
    (
      ?auto_139087 - BLOCK
      ?auto_139088 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_139080 ?auto_139081 ) ) ( not ( = ?auto_139080 ?auto_139082 ) ) ( not ( = ?auto_139080 ?auto_139083 ) ) ( not ( = ?auto_139080 ?auto_139084 ) ) ( not ( = ?auto_139080 ?auto_139085 ) ) ( not ( = ?auto_139080 ?auto_139086 ) ) ( not ( = ?auto_139081 ?auto_139082 ) ) ( not ( = ?auto_139081 ?auto_139083 ) ) ( not ( = ?auto_139081 ?auto_139084 ) ) ( not ( = ?auto_139081 ?auto_139085 ) ) ( not ( = ?auto_139081 ?auto_139086 ) ) ( not ( = ?auto_139082 ?auto_139083 ) ) ( not ( = ?auto_139082 ?auto_139084 ) ) ( not ( = ?auto_139082 ?auto_139085 ) ) ( not ( = ?auto_139082 ?auto_139086 ) ) ( not ( = ?auto_139083 ?auto_139084 ) ) ( not ( = ?auto_139083 ?auto_139085 ) ) ( not ( = ?auto_139083 ?auto_139086 ) ) ( not ( = ?auto_139084 ?auto_139085 ) ) ( not ( = ?auto_139084 ?auto_139086 ) ) ( not ( = ?auto_139085 ?auto_139086 ) ) ( not ( = ?auto_139080 ?auto_139087 ) ) ( not ( = ?auto_139081 ?auto_139087 ) ) ( not ( = ?auto_139082 ?auto_139087 ) ) ( not ( = ?auto_139083 ?auto_139087 ) ) ( not ( = ?auto_139084 ?auto_139087 ) ) ( not ( = ?auto_139085 ?auto_139087 ) ) ( not ( = ?auto_139086 ?auto_139087 ) ) ( ON-TABLE ?auto_139087 ) ( ON ?auto_139080 ?auto_139088 ) ( not ( = ?auto_139080 ?auto_139088 ) ) ( not ( = ?auto_139081 ?auto_139088 ) ) ( not ( = ?auto_139082 ?auto_139088 ) ) ( not ( = ?auto_139083 ?auto_139088 ) ) ( not ( = ?auto_139084 ?auto_139088 ) ) ( not ( = ?auto_139085 ?auto_139088 ) ) ( not ( = ?auto_139086 ?auto_139088 ) ) ( not ( = ?auto_139087 ?auto_139088 ) ) ( ON ?auto_139081 ?auto_139080 ) ( ON-TABLE ?auto_139088 ) ( ON ?auto_139082 ?auto_139081 ) ( ON ?auto_139083 ?auto_139082 ) ( ON ?auto_139084 ?auto_139083 ) ( ON ?auto_139085 ?auto_139084 ) ( CLEAR ?auto_139087 ) ( ON ?auto_139086 ?auto_139085 ) ( CLEAR ?auto_139086 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_139088 ?auto_139080 ?auto_139081 ?auto_139082 ?auto_139083 ?auto_139084 ?auto_139085 )
      ( MAKE-7PILE ?auto_139080 ?auto_139081 ?auto_139082 ?auto_139083 ?auto_139084 ?auto_139085 ?auto_139086 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_139089 - BLOCK
      ?auto_139090 - BLOCK
      ?auto_139091 - BLOCK
      ?auto_139092 - BLOCK
      ?auto_139093 - BLOCK
      ?auto_139094 - BLOCK
      ?auto_139095 - BLOCK
    )
    :vars
    (
      ?auto_139097 - BLOCK
      ?auto_139096 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_139089 ?auto_139090 ) ) ( not ( = ?auto_139089 ?auto_139091 ) ) ( not ( = ?auto_139089 ?auto_139092 ) ) ( not ( = ?auto_139089 ?auto_139093 ) ) ( not ( = ?auto_139089 ?auto_139094 ) ) ( not ( = ?auto_139089 ?auto_139095 ) ) ( not ( = ?auto_139090 ?auto_139091 ) ) ( not ( = ?auto_139090 ?auto_139092 ) ) ( not ( = ?auto_139090 ?auto_139093 ) ) ( not ( = ?auto_139090 ?auto_139094 ) ) ( not ( = ?auto_139090 ?auto_139095 ) ) ( not ( = ?auto_139091 ?auto_139092 ) ) ( not ( = ?auto_139091 ?auto_139093 ) ) ( not ( = ?auto_139091 ?auto_139094 ) ) ( not ( = ?auto_139091 ?auto_139095 ) ) ( not ( = ?auto_139092 ?auto_139093 ) ) ( not ( = ?auto_139092 ?auto_139094 ) ) ( not ( = ?auto_139092 ?auto_139095 ) ) ( not ( = ?auto_139093 ?auto_139094 ) ) ( not ( = ?auto_139093 ?auto_139095 ) ) ( not ( = ?auto_139094 ?auto_139095 ) ) ( not ( = ?auto_139089 ?auto_139097 ) ) ( not ( = ?auto_139090 ?auto_139097 ) ) ( not ( = ?auto_139091 ?auto_139097 ) ) ( not ( = ?auto_139092 ?auto_139097 ) ) ( not ( = ?auto_139093 ?auto_139097 ) ) ( not ( = ?auto_139094 ?auto_139097 ) ) ( not ( = ?auto_139095 ?auto_139097 ) ) ( ON ?auto_139089 ?auto_139096 ) ( not ( = ?auto_139089 ?auto_139096 ) ) ( not ( = ?auto_139090 ?auto_139096 ) ) ( not ( = ?auto_139091 ?auto_139096 ) ) ( not ( = ?auto_139092 ?auto_139096 ) ) ( not ( = ?auto_139093 ?auto_139096 ) ) ( not ( = ?auto_139094 ?auto_139096 ) ) ( not ( = ?auto_139095 ?auto_139096 ) ) ( not ( = ?auto_139097 ?auto_139096 ) ) ( ON ?auto_139090 ?auto_139089 ) ( ON-TABLE ?auto_139096 ) ( ON ?auto_139091 ?auto_139090 ) ( ON ?auto_139092 ?auto_139091 ) ( ON ?auto_139093 ?auto_139092 ) ( ON ?auto_139094 ?auto_139093 ) ( ON ?auto_139095 ?auto_139094 ) ( CLEAR ?auto_139095 ) ( HOLDING ?auto_139097 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_139097 )
      ( MAKE-7PILE ?auto_139089 ?auto_139090 ?auto_139091 ?auto_139092 ?auto_139093 ?auto_139094 ?auto_139095 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_139098 - BLOCK
      ?auto_139099 - BLOCK
      ?auto_139100 - BLOCK
      ?auto_139101 - BLOCK
      ?auto_139102 - BLOCK
      ?auto_139103 - BLOCK
      ?auto_139104 - BLOCK
    )
    :vars
    (
      ?auto_139106 - BLOCK
      ?auto_139105 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_139098 ?auto_139099 ) ) ( not ( = ?auto_139098 ?auto_139100 ) ) ( not ( = ?auto_139098 ?auto_139101 ) ) ( not ( = ?auto_139098 ?auto_139102 ) ) ( not ( = ?auto_139098 ?auto_139103 ) ) ( not ( = ?auto_139098 ?auto_139104 ) ) ( not ( = ?auto_139099 ?auto_139100 ) ) ( not ( = ?auto_139099 ?auto_139101 ) ) ( not ( = ?auto_139099 ?auto_139102 ) ) ( not ( = ?auto_139099 ?auto_139103 ) ) ( not ( = ?auto_139099 ?auto_139104 ) ) ( not ( = ?auto_139100 ?auto_139101 ) ) ( not ( = ?auto_139100 ?auto_139102 ) ) ( not ( = ?auto_139100 ?auto_139103 ) ) ( not ( = ?auto_139100 ?auto_139104 ) ) ( not ( = ?auto_139101 ?auto_139102 ) ) ( not ( = ?auto_139101 ?auto_139103 ) ) ( not ( = ?auto_139101 ?auto_139104 ) ) ( not ( = ?auto_139102 ?auto_139103 ) ) ( not ( = ?auto_139102 ?auto_139104 ) ) ( not ( = ?auto_139103 ?auto_139104 ) ) ( not ( = ?auto_139098 ?auto_139106 ) ) ( not ( = ?auto_139099 ?auto_139106 ) ) ( not ( = ?auto_139100 ?auto_139106 ) ) ( not ( = ?auto_139101 ?auto_139106 ) ) ( not ( = ?auto_139102 ?auto_139106 ) ) ( not ( = ?auto_139103 ?auto_139106 ) ) ( not ( = ?auto_139104 ?auto_139106 ) ) ( ON ?auto_139098 ?auto_139105 ) ( not ( = ?auto_139098 ?auto_139105 ) ) ( not ( = ?auto_139099 ?auto_139105 ) ) ( not ( = ?auto_139100 ?auto_139105 ) ) ( not ( = ?auto_139101 ?auto_139105 ) ) ( not ( = ?auto_139102 ?auto_139105 ) ) ( not ( = ?auto_139103 ?auto_139105 ) ) ( not ( = ?auto_139104 ?auto_139105 ) ) ( not ( = ?auto_139106 ?auto_139105 ) ) ( ON ?auto_139099 ?auto_139098 ) ( ON-TABLE ?auto_139105 ) ( ON ?auto_139100 ?auto_139099 ) ( ON ?auto_139101 ?auto_139100 ) ( ON ?auto_139102 ?auto_139101 ) ( ON ?auto_139103 ?auto_139102 ) ( ON ?auto_139104 ?auto_139103 ) ( ON ?auto_139106 ?auto_139104 ) ( CLEAR ?auto_139106 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_139105 ?auto_139098 ?auto_139099 ?auto_139100 ?auto_139101 ?auto_139102 ?auto_139103 ?auto_139104 )
      ( MAKE-7PILE ?auto_139098 ?auto_139099 ?auto_139100 ?auto_139101 ?auto_139102 ?auto_139103 ?auto_139104 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_139123 - BLOCK
      ?auto_139124 - BLOCK
      ?auto_139125 - BLOCK
      ?auto_139126 - BLOCK
      ?auto_139127 - BLOCK
      ?auto_139128 - BLOCK
      ?auto_139129 - BLOCK
      ?auto_139130 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_139129 ) ( ON-TABLE ?auto_139123 ) ( ON ?auto_139124 ?auto_139123 ) ( ON ?auto_139125 ?auto_139124 ) ( ON ?auto_139126 ?auto_139125 ) ( ON ?auto_139127 ?auto_139126 ) ( ON ?auto_139128 ?auto_139127 ) ( ON ?auto_139129 ?auto_139128 ) ( not ( = ?auto_139123 ?auto_139124 ) ) ( not ( = ?auto_139123 ?auto_139125 ) ) ( not ( = ?auto_139123 ?auto_139126 ) ) ( not ( = ?auto_139123 ?auto_139127 ) ) ( not ( = ?auto_139123 ?auto_139128 ) ) ( not ( = ?auto_139123 ?auto_139129 ) ) ( not ( = ?auto_139123 ?auto_139130 ) ) ( not ( = ?auto_139124 ?auto_139125 ) ) ( not ( = ?auto_139124 ?auto_139126 ) ) ( not ( = ?auto_139124 ?auto_139127 ) ) ( not ( = ?auto_139124 ?auto_139128 ) ) ( not ( = ?auto_139124 ?auto_139129 ) ) ( not ( = ?auto_139124 ?auto_139130 ) ) ( not ( = ?auto_139125 ?auto_139126 ) ) ( not ( = ?auto_139125 ?auto_139127 ) ) ( not ( = ?auto_139125 ?auto_139128 ) ) ( not ( = ?auto_139125 ?auto_139129 ) ) ( not ( = ?auto_139125 ?auto_139130 ) ) ( not ( = ?auto_139126 ?auto_139127 ) ) ( not ( = ?auto_139126 ?auto_139128 ) ) ( not ( = ?auto_139126 ?auto_139129 ) ) ( not ( = ?auto_139126 ?auto_139130 ) ) ( not ( = ?auto_139127 ?auto_139128 ) ) ( not ( = ?auto_139127 ?auto_139129 ) ) ( not ( = ?auto_139127 ?auto_139130 ) ) ( not ( = ?auto_139128 ?auto_139129 ) ) ( not ( = ?auto_139128 ?auto_139130 ) ) ( not ( = ?auto_139129 ?auto_139130 ) ) ( ON-TABLE ?auto_139130 ) ( CLEAR ?auto_139130 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_139130 )
      ( MAKE-8PILE ?auto_139123 ?auto_139124 ?auto_139125 ?auto_139126 ?auto_139127 ?auto_139128 ?auto_139129 ?auto_139130 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_139131 - BLOCK
      ?auto_139132 - BLOCK
      ?auto_139133 - BLOCK
      ?auto_139134 - BLOCK
      ?auto_139135 - BLOCK
      ?auto_139136 - BLOCK
      ?auto_139137 - BLOCK
      ?auto_139138 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_139131 ) ( ON ?auto_139132 ?auto_139131 ) ( ON ?auto_139133 ?auto_139132 ) ( ON ?auto_139134 ?auto_139133 ) ( ON ?auto_139135 ?auto_139134 ) ( ON ?auto_139136 ?auto_139135 ) ( not ( = ?auto_139131 ?auto_139132 ) ) ( not ( = ?auto_139131 ?auto_139133 ) ) ( not ( = ?auto_139131 ?auto_139134 ) ) ( not ( = ?auto_139131 ?auto_139135 ) ) ( not ( = ?auto_139131 ?auto_139136 ) ) ( not ( = ?auto_139131 ?auto_139137 ) ) ( not ( = ?auto_139131 ?auto_139138 ) ) ( not ( = ?auto_139132 ?auto_139133 ) ) ( not ( = ?auto_139132 ?auto_139134 ) ) ( not ( = ?auto_139132 ?auto_139135 ) ) ( not ( = ?auto_139132 ?auto_139136 ) ) ( not ( = ?auto_139132 ?auto_139137 ) ) ( not ( = ?auto_139132 ?auto_139138 ) ) ( not ( = ?auto_139133 ?auto_139134 ) ) ( not ( = ?auto_139133 ?auto_139135 ) ) ( not ( = ?auto_139133 ?auto_139136 ) ) ( not ( = ?auto_139133 ?auto_139137 ) ) ( not ( = ?auto_139133 ?auto_139138 ) ) ( not ( = ?auto_139134 ?auto_139135 ) ) ( not ( = ?auto_139134 ?auto_139136 ) ) ( not ( = ?auto_139134 ?auto_139137 ) ) ( not ( = ?auto_139134 ?auto_139138 ) ) ( not ( = ?auto_139135 ?auto_139136 ) ) ( not ( = ?auto_139135 ?auto_139137 ) ) ( not ( = ?auto_139135 ?auto_139138 ) ) ( not ( = ?auto_139136 ?auto_139137 ) ) ( not ( = ?auto_139136 ?auto_139138 ) ) ( not ( = ?auto_139137 ?auto_139138 ) ) ( ON-TABLE ?auto_139138 ) ( CLEAR ?auto_139138 ) ( HOLDING ?auto_139137 ) ( CLEAR ?auto_139136 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_139131 ?auto_139132 ?auto_139133 ?auto_139134 ?auto_139135 ?auto_139136 ?auto_139137 )
      ( MAKE-8PILE ?auto_139131 ?auto_139132 ?auto_139133 ?auto_139134 ?auto_139135 ?auto_139136 ?auto_139137 ?auto_139138 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_139139 - BLOCK
      ?auto_139140 - BLOCK
      ?auto_139141 - BLOCK
      ?auto_139142 - BLOCK
      ?auto_139143 - BLOCK
      ?auto_139144 - BLOCK
      ?auto_139145 - BLOCK
      ?auto_139146 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_139139 ) ( ON ?auto_139140 ?auto_139139 ) ( ON ?auto_139141 ?auto_139140 ) ( ON ?auto_139142 ?auto_139141 ) ( ON ?auto_139143 ?auto_139142 ) ( ON ?auto_139144 ?auto_139143 ) ( not ( = ?auto_139139 ?auto_139140 ) ) ( not ( = ?auto_139139 ?auto_139141 ) ) ( not ( = ?auto_139139 ?auto_139142 ) ) ( not ( = ?auto_139139 ?auto_139143 ) ) ( not ( = ?auto_139139 ?auto_139144 ) ) ( not ( = ?auto_139139 ?auto_139145 ) ) ( not ( = ?auto_139139 ?auto_139146 ) ) ( not ( = ?auto_139140 ?auto_139141 ) ) ( not ( = ?auto_139140 ?auto_139142 ) ) ( not ( = ?auto_139140 ?auto_139143 ) ) ( not ( = ?auto_139140 ?auto_139144 ) ) ( not ( = ?auto_139140 ?auto_139145 ) ) ( not ( = ?auto_139140 ?auto_139146 ) ) ( not ( = ?auto_139141 ?auto_139142 ) ) ( not ( = ?auto_139141 ?auto_139143 ) ) ( not ( = ?auto_139141 ?auto_139144 ) ) ( not ( = ?auto_139141 ?auto_139145 ) ) ( not ( = ?auto_139141 ?auto_139146 ) ) ( not ( = ?auto_139142 ?auto_139143 ) ) ( not ( = ?auto_139142 ?auto_139144 ) ) ( not ( = ?auto_139142 ?auto_139145 ) ) ( not ( = ?auto_139142 ?auto_139146 ) ) ( not ( = ?auto_139143 ?auto_139144 ) ) ( not ( = ?auto_139143 ?auto_139145 ) ) ( not ( = ?auto_139143 ?auto_139146 ) ) ( not ( = ?auto_139144 ?auto_139145 ) ) ( not ( = ?auto_139144 ?auto_139146 ) ) ( not ( = ?auto_139145 ?auto_139146 ) ) ( ON-TABLE ?auto_139146 ) ( CLEAR ?auto_139144 ) ( ON ?auto_139145 ?auto_139146 ) ( CLEAR ?auto_139145 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_139146 )
      ( MAKE-8PILE ?auto_139139 ?auto_139140 ?auto_139141 ?auto_139142 ?auto_139143 ?auto_139144 ?auto_139145 ?auto_139146 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_139147 - BLOCK
      ?auto_139148 - BLOCK
      ?auto_139149 - BLOCK
      ?auto_139150 - BLOCK
      ?auto_139151 - BLOCK
      ?auto_139152 - BLOCK
      ?auto_139153 - BLOCK
      ?auto_139154 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_139147 ) ( ON ?auto_139148 ?auto_139147 ) ( ON ?auto_139149 ?auto_139148 ) ( ON ?auto_139150 ?auto_139149 ) ( ON ?auto_139151 ?auto_139150 ) ( not ( = ?auto_139147 ?auto_139148 ) ) ( not ( = ?auto_139147 ?auto_139149 ) ) ( not ( = ?auto_139147 ?auto_139150 ) ) ( not ( = ?auto_139147 ?auto_139151 ) ) ( not ( = ?auto_139147 ?auto_139152 ) ) ( not ( = ?auto_139147 ?auto_139153 ) ) ( not ( = ?auto_139147 ?auto_139154 ) ) ( not ( = ?auto_139148 ?auto_139149 ) ) ( not ( = ?auto_139148 ?auto_139150 ) ) ( not ( = ?auto_139148 ?auto_139151 ) ) ( not ( = ?auto_139148 ?auto_139152 ) ) ( not ( = ?auto_139148 ?auto_139153 ) ) ( not ( = ?auto_139148 ?auto_139154 ) ) ( not ( = ?auto_139149 ?auto_139150 ) ) ( not ( = ?auto_139149 ?auto_139151 ) ) ( not ( = ?auto_139149 ?auto_139152 ) ) ( not ( = ?auto_139149 ?auto_139153 ) ) ( not ( = ?auto_139149 ?auto_139154 ) ) ( not ( = ?auto_139150 ?auto_139151 ) ) ( not ( = ?auto_139150 ?auto_139152 ) ) ( not ( = ?auto_139150 ?auto_139153 ) ) ( not ( = ?auto_139150 ?auto_139154 ) ) ( not ( = ?auto_139151 ?auto_139152 ) ) ( not ( = ?auto_139151 ?auto_139153 ) ) ( not ( = ?auto_139151 ?auto_139154 ) ) ( not ( = ?auto_139152 ?auto_139153 ) ) ( not ( = ?auto_139152 ?auto_139154 ) ) ( not ( = ?auto_139153 ?auto_139154 ) ) ( ON-TABLE ?auto_139154 ) ( ON ?auto_139153 ?auto_139154 ) ( CLEAR ?auto_139153 ) ( HOLDING ?auto_139152 ) ( CLEAR ?auto_139151 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_139147 ?auto_139148 ?auto_139149 ?auto_139150 ?auto_139151 ?auto_139152 )
      ( MAKE-8PILE ?auto_139147 ?auto_139148 ?auto_139149 ?auto_139150 ?auto_139151 ?auto_139152 ?auto_139153 ?auto_139154 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_139155 - BLOCK
      ?auto_139156 - BLOCK
      ?auto_139157 - BLOCK
      ?auto_139158 - BLOCK
      ?auto_139159 - BLOCK
      ?auto_139160 - BLOCK
      ?auto_139161 - BLOCK
      ?auto_139162 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_139155 ) ( ON ?auto_139156 ?auto_139155 ) ( ON ?auto_139157 ?auto_139156 ) ( ON ?auto_139158 ?auto_139157 ) ( ON ?auto_139159 ?auto_139158 ) ( not ( = ?auto_139155 ?auto_139156 ) ) ( not ( = ?auto_139155 ?auto_139157 ) ) ( not ( = ?auto_139155 ?auto_139158 ) ) ( not ( = ?auto_139155 ?auto_139159 ) ) ( not ( = ?auto_139155 ?auto_139160 ) ) ( not ( = ?auto_139155 ?auto_139161 ) ) ( not ( = ?auto_139155 ?auto_139162 ) ) ( not ( = ?auto_139156 ?auto_139157 ) ) ( not ( = ?auto_139156 ?auto_139158 ) ) ( not ( = ?auto_139156 ?auto_139159 ) ) ( not ( = ?auto_139156 ?auto_139160 ) ) ( not ( = ?auto_139156 ?auto_139161 ) ) ( not ( = ?auto_139156 ?auto_139162 ) ) ( not ( = ?auto_139157 ?auto_139158 ) ) ( not ( = ?auto_139157 ?auto_139159 ) ) ( not ( = ?auto_139157 ?auto_139160 ) ) ( not ( = ?auto_139157 ?auto_139161 ) ) ( not ( = ?auto_139157 ?auto_139162 ) ) ( not ( = ?auto_139158 ?auto_139159 ) ) ( not ( = ?auto_139158 ?auto_139160 ) ) ( not ( = ?auto_139158 ?auto_139161 ) ) ( not ( = ?auto_139158 ?auto_139162 ) ) ( not ( = ?auto_139159 ?auto_139160 ) ) ( not ( = ?auto_139159 ?auto_139161 ) ) ( not ( = ?auto_139159 ?auto_139162 ) ) ( not ( = ?auto_139160 ?auto_139161 ) ) ( not ( = ?auto_139160 ?auto_139162 ) ) ( not ( = ?auto_139161 ?auto_139162 ) ) ( ON-TABLE ?auto_139162 ) ( ON ?auto_139161 ?auto_139162 ) ( CLEAR ?auto_139159 ) ( ON ?auto_139160 ?auto_139161 ) ( CLEAR ?auto_139160 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_139162 ?auto_139161 )
      ( MAKE-8PILE ?auto_139155 ?auto_139156 ?auto_139157 ?auto_139158 ?auto_139159 ?auto_139160 ?auto_139161 ?auto_139162 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_139163 - BLOCK
      ?auto_139164 - BLOCK
      ?auto_139165 - BLOCK
      ?auto_139166 - BLOCK
      ?auto_139167 - BLOCK
      ?auto_139168 - BLOCK
      ?auto_139169 - BLOCK
      ?auto_139170 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_139163 ) ( ON ?auto_139164 ?auto_139163 ) ( ON ?auto_139165 ?auto_139164 ) ( ON ?auto_139166 ?auto_139165 ) ( not ( = ?auto_139163 ?auto_139164 ) ) ( not ( = ?auto_139163 ?auto_139165 ) ) ( not ( = ?auto_139163 ?auto_139166 ) ) ( not ( = ?auto_139163 ?auto_139167 ) ) ( not ( = ?auto_139163 ?auto_139168 ) ) ( not ( = ?auto_139163 ?auto_139169 ) ) ( not ( = ?auto_139163 ?auto_139170 ) ) ( not ( = ?auto_139164 ?auto_139165 ) ) ( not ( = ?auto_139164 ?auto_139166 ) ) ( not ( = ?auto_139164 ?auto_139167 ) ) ( not ( = ?auto_139164 ?auto_139168 ) ) ( not ( = ?auto_139164 ?auto_139169 ) ) ( not ( = ?auto_139164 ?auto_139170 ) ) ( not ( = ?auto_139165 ?auto_139166 ) ) ( not ( = ?auto_139165 ?auto_139167 ) ) ( not ( = ?auto_139165 ?auto_139168 ) ) ( not ( = ?auto_139165 ?auto_139169 ) ) ( not ( = ?auto_139165 ?auto_139170 ) ) ( not ( = ?auto_139166 ?auto_139167 ) ) ( not ( = ?auto_139166 ?auto_139168 ) ) ( not ( = ?auto_139166 ?auto_139169 ) ) ( not ( = ?auto_139166 ?auto_139170 ) ) ( not ( = ?auto_139167 ?auto_139168 ) ) ( not ( = ?auto_139167 ?auto_139169 ) ) ( not ( = ?auto_139167 ?auto_139170 ) ) ( not ( = ?auto_139168 ?auto_139169 ) ) ( not ( = ?auto_139168 ?auto_139170 ) ) ( not ( = ?auto_139169 ?auto_139170 ) ) ( ON-TABLE ?auto_139170 ) ( ON ?auto_139169 ?auto_139170 ) ( ON ?auto_139168 ?auto_139169 ) ( CLEAR ?auto_139168 ) ( HOLDING ?auto_139167 ) ( CLEAR ?auto_139166 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_139163 ?auto_139164 ?auto_139165 ?auto_139166 ?auto_139167 )
      ( MAKE-8PILE ?auto_139163 ?auto_139164 ?auto_139165 ?auto_139166 ?auto_139167 ?auto_139168 ?auto_139169 ?auto_139170 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_139171 - BLOCK
      ?auto_139172 - BLOCK
      ?auto_139173 - BLOCK
      ?auto_139174 - BLOCK
      ?auto_139175 - BLOCK
      ?auto_139176 - BLOCK
      ?auto_139177 - BLOCK
      ?auto_139178 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_139171 ) ( ON ?auto_139172 ?auto_139171 ) ( ON ?auto_139173 ?auto_139172 ) ( ON ?auto_139174 ?auto_139173 ) ( not ( = ?auto_139171 ?auto_139172 ) ) ( not ( = ?auto_139171 ?auto_139173 ) ) ( not ( = ?auto_139171 ?auto_139174 ) ) ( not ( = ?auto_139171 ?auto_139175 ) ) ( not ( = ?auto_139171 ?auto_139176 ) ) ( not ( = ?auto_139171 ?auto_139177 ) ) ( not ( = ?auto_139171 ?auto_139178 ) ) ( not ( = ?auto_139172 ?auto_139173 ) ) ( not ( = ?auto_139172 ?auto_139174 ) ) ( not ( = ?auto_139172 ?auto_139175 ) ) ( not ( = ?auto_139172 ?auto_139176 ) ) ( not ( = ?auto_139172 ?auto_139177 ) ) ( not ( = ?auto_139172 ?auto_139178 ) ) ( not ( = ?auto_139173 ?auto_139174 ) ) ( not ( = ?auto_139173 ?auto_139175 ) ) ( not ( = ?auto_139173 ?auto_139176 ) ) ( not ( = ?auto_139173 ?auto_139177 ) ) ( not ( = ?auto_139173 ?auto_139178 ) ) ( not ( = ?auto_139174 ?auto_139175 ) ) ( not ( = ?auto_139174 ?auto_139176 ) ) ( not ( = ?auto_139174 ?auto_139177 ) ) ( not ( = ?auto_139174 ?auto_139178 ) ) ( not ( = ?auto_139175 ?auto_139176 ) ) ( not ( = ?auto_139175 ?auto_139177 ) ) ( not ( = ?auto_139175 ?auto_139178 ) ) ( not ( = ?auto_139176 ?auto_139177 ) ) ( not ( = ?auto_139176 ?auto_139178 ) ) ( not ( = ?auto_139177 ?auto_139178 ) ) ( ON-TABLE ?auto_139178 ) ( ON ?auto_139177 ?auto_139178 ) ( ON ?auto_139176 ?auto_139177 ) ( CLEAR ?auto_139174 ) ( ON ?auto_139175 ?auto_139176 ) ( CLEAR ?auto_139175 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_139178 ?auto_139177 ?auto_139176 )
      ( MAKE-8PILE ?auto_139171 ?auto_139172 ?auto_139173 ?auto_139174 ?auto_139175 ?auto_139176 ?auto_139177 ?auto_139178 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_139179 - BLOCK
      ?auto_139180 - BLOCK
      ?auto_139181 - BLOCK
      ?auto_139182 - BLOCK
      ?auto_139183 - BLOCK
      ?auto_139184 - BLOCK
      ?auto_139185 - BLOCK
      ?auto_139186 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_139179 ) ( ON ?auto_139180 ?auto_139179 ) ( ON ?auto_139181 ?auto_139180 ) ( not ( = ?auto_139179 ?auto_139180 ) ) ( not ( = ?auto_139179 ?auto_139181 ) ) ( not ( = ?auto_139179 ?auto_139182 ) ) ( not ( = ?auto_139179 ?auto_139183 ) ) ( not ( = ?auto_139179 ?auto_139184 ) ) ( not ( = ?auto_139179 ?auto_139185 ) ) ( not ( = ?auto_139179 ?auto_139186 ) ) ( not ( = ?auto_139180 ?auto_139181 ) ) ( not ( = ?auto_139180 ?auto_139182 ) ) ( not ( = ?auto_139180 ?auto_139183 ) ) ( not ( = ?auto_139180 ?auto_139184 ) ) ( not ( = ?auto_139180 ?auto_139185 ) ) ( not ( = ?auto_139180 ?auto_139186 ) ) ( not ( = ?auto_139181 ?auto_139182 ) ) ( not ( = ?auto_139181 ?auto_139183 ) ) ( not ( = ?auto_139181 ?auto_139184 ) ) ( not ( = ?auto_139181 ?auto_139185 ) ) ( not ( = ?auto_139181 ?auto_139186 ) ) ( not ( = ?auto_139182 ?auto_139183 ) ) ( not ( = ?auto_139182 ?auto_139184 ) ) ( not ( = ?auto_139182 ?auto_139185 ) ) ( not ( = ?auto_139182 ?auto_139186 ) ) ( not ( = ?auto_139183 ?auto_139184 ) ) ( not ( = ?auto_139183 ?auto_139185 ) ) ( not ( = ?auto_139183 ?auto_139186 ) ) ( not ( = ?auto_139184 ?auto_139185 ) ) ( not ( = ?auto_139184 ?auto_139186 ) ) ( not ( = ?auto_139185 ?auto_139186 ) ) ( ON-TABLE ?auto_139186 ) ( ON ?auto_139185 ?auto_139186 ) ( ON ?auto_139184 ?auto_139185 ) ( ON ?auto_139183 ?auto_139184 ) ( CLEAR ?auto_139183 ) ( HOLDING ?auto_139182 ) ( CLEAR ?auto_139181 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_139179 ?auto_139180 ?auto_139181 ?auto_139182 )
      ( MAKE-8PILE ?auto_139179 ?auto_139180 ?auto_139181 ?auto_139182 ?auto_139183 ?auto_139184 ?auto_139185 ?auto_139186 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_139187 - BLOCK
      ?auto_139188 - BLOCK
      ?auto_139189 - BLOCK
      ?auto_139190 - BLOCK
      ?auto_139191 - BLOCK
      ?auto_139192 - BLOCK
      ?auto_139193 - BLOCK
      ?auto_139194 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_139187 ) ( ON ?auto_139188 ?auto_139187 ) ( ON ?auto_139189 ?auto_139188 ) ( not ( = ?auto_139187 ?auto_139188 ) ) ( not ( = ?auto_139187 ?auto_139189 ) ) ( not ( = ?auto_139187 ?auto_139190 ) ) ( not ( = ?auto_139187 ?auto_139191 ) ) ( not ( = ?auto_139187 ?auto_139192 ) ) ( not ( = ?auto_139187 ?auto_139193 ) ) ( not ( = ?auto_139187 ?auto_139194 ) ) ( not ( = ?auto_139188 ?auto_139189 ) ) ( not ( = ?auto_139188 ?auto_139190 ) ) ( not ( = ?auto_139188 ?auto_139191 ) ) ( not ( = ?auto_139188 ?auto_139192 ) ) ( not ( = ?auto_139188 ?auto_139193 ) ) ( not ( = ?auto_139188 ?auto_139194 ) ) ( not ( = ?auto_139189 ?auto_139190 ) ) ( not ( = ?auto_139189 ?auto_139191 ) ) ( not ( = ?auto_139189 ?auto_139192 ) ) ( not ( = ?auto_139189 ?auto_139193 ) ) ( not ( = ?auto_139189 ?auto_139194 ) ) ( not ( = ?auto_139190 ?auto_139191 ) ) ( not ( = ?auto_139190 ?auto_139192 ) ) ( not ( = ?auto_139190 ?auto_139193 ) ) ( not ( = ?auto_139190 ?auto_139194 ) ) ( not ( = ?auto_139191 ?auto_139192 ) ) ( not ( = ?auto_139191 ?auto_139193 ) ) ( not ( = ?auto_139191 ?auto_139194 ) ) ( not ( = ?auto_139192 ?auto_139193 ) ) ( not ( = ?auto_139192 ?auto_139194 ) ) ( not ( = ?auto_139193 ?auto_139194 ) ) ( ON-TABLE ?auto_139194 ) ( ON ?auto_139193 ?auto_139194 ) ( ON ?auto_139192 ?auto_139193 ) ( ON ?auto_139191 ?auto_139192 ) ( CLEAR ?auto_139189 ) ( ON ?auto_139190 ?auto_139191 ) ( CLEAR ?auto_139190 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_139194 ?auto_139193 ?auto_139192 ?auto_139191 )
      ( MAKE-8PILE ?auto_139187 ?auto_139188 ?auto_139189 ?auto_139190 ?auto_139191 ?auto_139192 ?auto_139193 ?auto_139194 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_139195 - BLOCK
      ?auto_139196 - BLOCK
      ?auto_139197 - BLOCK
      ?auto_139198 - BLOCK
      ?auto_139199 - BLOCK
      ?auto_139200 - BLOCK
      ?auto_139201 - BLOCK
      ?auto_139202 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_139195 ) ( ON ?auto_139196 ?auto_139195 ) ( not ( = ?auto_139195 ?auto_139196 ) ) ( not ( = ?auto_139195 ?auto_139197 ) ) ( not ( = ?auto_139195 ?auto_139198 ) ) ( not ( = ?auto_139195 ?auto_139199 ) ) ( not ( = ?auto_139195 ?auto_139200 ) ) ( not ( = ?auto_139195 ?auto_139201 ) ) ( not ( = ?auto_139195 ?auto_139202 ) ) ( not ( = ?auto_139196 ?auto_139197 ) ) ( not ( = ?auto_139196 ?auto_139198 ) ) ( not ( = ?auto_139196 ?auto_139199 ) ) ( not ( = ?auto_139196 ?auto_139200 ) ) ( not ( = ?auto_139196 ?auto_139201 ) ) ( not ( = ?auto_139196 ?auto_139202 ) ) ( not ( = ?auto_139197 ?auto_139198 ) ) ( not ( = ?auto_139197 ?auto_139199 ) ) ( not ( = ?auto_139197 ?auto_139200 ) ) ( not ( = ?auto_139197 ?auto_139201 ) ) ( not ( = ?auto_139197 ?auto_139202 ) ) ( not ( = ?auto_139198 ?auto_139199 ) ) ( not ( = ?auto_139198 ?auto_139200 ) ) ( not ( = ?auto_139198 ?auto_139201 ) ) ( not ( = ?auto_139198 ?auto_139202 ) ) ( not ( = ?auto_139199 ?auto_139200 ) ) ( not ( = ?auto_139199 ?auto_139201 ) ) ( not ( = ?auto_139199 ?auto_139202 ) ) ( not ( = ?auto_139200 ?auto_139201 ) ) ( not ( = ?auto_139200 ?auto_139202 ) ) ( not ( = ?auto_139201 ?auto_139202 ) ) ( ON-TABLE ?auto_139202 ) ( ON ?auto_139201 ?auto_139202 ) ( ON ?auto_139200 ?auto_139201 ) ( ON ?auto_139199 ?auto_139200 ) ( ON ?auto_139198 ?auto_139199 ) ( CLEAR ?auto_139198 ) ( HOLDING ?auto_139197 ) ( CLEAR ?auto_139196 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_139195 ?auto_139196 ?auto_139197 )
      ( MAKE-8PILE ?auto_139195 ?auto_139196 ?auto_139197 ?auto_139198 ?auto_139199 ?auto_139200 ?auto_139201 ?auto_139202 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_139203 - BLOCK
      ?auto_139204 - BLOCK
      ?auto_139205 - BLOCK
      ?auto_139206 - BLOCK
      ?auto_139207 - BLOCK
      ?auto_139208 - BLOCK
      ?auto_139209 - BLOCK
      ?auto_139210 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_139203 ) ( ON ?auto_139204 ?auto_139203 ) ( not ( = ?auto_139203 ?auto_139204 ) ) ( not ( = ?auto_139203 ?auto_139205 ) ) ( not ( = ?auto_139203 ?auto_139206 ) ) ( not ( = ?auto_139203 ?auto_139207 ) ) ( not ( = ?auto_139203 ?auto_139208 ) ) ( not ( = ?auto_139203 ?auto_139209 ) ) ( not ( = ?auto_139203 ?auto_139210 ) ) ( not ( = ?auto_139204 ?auto_139205 ) ) ( not ( = ?auto_139204 ?auto_139206 ) ) ( not ( = ?auto_139204 ?auto_139207 ) ) ( not ( = ?auto_139204 ?auto_139208 ) ) ( not ( = ?auto_139204 ?auto_139209 ) ) ( not ( = ?auto_139204 ?auto_139210 ) ) ( not ( = ?auto_139205 ?auto_139206 ) ) ( not ( = ?auto_139205 ?auto_139207 ) ) ( not ( = ?auto_139205 ?auto_139208 ) ) ( not ( = ?auto_139205 ?auto_139209 ) ) ( not ( = ?auto_139205 ?auto_139210 ) ) ( not ( = ?auto_139206 ?auto_139207 ) ) ( not ( = ?auto_139206 ?auto_139208 ) ) ( not ( = ?auto_139206 ?auto_139209 ) ) ( not ( = ?auto_139206 ?auto_139210 ) ) ( not ( = ?auto_139207 ?auto_139208 ) ) ( not ( = ?auto_139207 ?auto_139209 ) ) ( not ( = ?auto_139207 ?auto_139210 ) ) ( not ( = ?auto_139208 ?auto_139209 ) ) ( not ( = ?auto_139208 ?auto_139210 ) ) ( not ( = ?auto_139209 ?auto_139210 ) ) ( ON-TABLE ?auto_139210 ) ( ON ?auto_139209 ?auto_139210 ) ( ON ?auto_139208 ?auto_139209 ) ( ON ?auto_139207 ?auto_139208 ) ( ON ?auto_139206 ?auto_139207 ) ( CLEAR ?auto_139204 ) ( ON ?auto_139205 ?auto_139206 ) ( CLEAR ?auto_139205 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_139210 ?auto_139209 ?auto_139208 ?auto_139207 ?auto_139206 )
      ( MAKE-8PILE ?auto_139203 ?auto_139204 ?auto_139205 ?auto_139206 ?auto_139207 ?auto_139208 ?auto_139209 ?auto_139210 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_139211 - BLOCK
      ?auto_139212 - BLOCK
      ?auto_139213 - BLOCK
      ?auto_139214 - BLOCK
      ?auto_139215 - BLOCK
      ?auto_139216 - BLOCK
      ?auto_139217 - BLOCK
      ?auto_139218 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_139211 ) ( not ( = ?auto_139211 ?auto_139212 ) ) ( not ( = ?auto_139211 ?auto_139213 ) ) ( not ( = ?auto_139211 ?auto_139214 ) ) ( not ( = ?auto_139211 ?auto_139215 ) ) ( not ( = ?auto_139211 ?auto_139216 ) ) ( not ( = ?auto_139211 ?auto_139217 ) ) ( not ( = ?auto_139211 ?auto_139218 ) ) ( not ( = ?auto_139212 ?auto_139213 ) ) ( not ( = ?auto_139212 ?auto_139214 ) ) ( not ( = ?auto_139212 ?auto_139215 ) ) ( not ( = ?auto_139212 ?auto_139216 ) ) ( not ( = ?auto_139212 ?auto_139217 ) ) ( not ( = ?auto_139212 ?auto_139218 ) ) ( not ( = ?auto_139213 ?auto_139214 ) ) ( not ( = ?auto_139213 ?auto_139215 ) ) ( not ( = ?auto_139213 ?auto_139216 ) ) ( not ( = ?auto_139213 ?auto_139217 ) ) ( not ( = ?auto_139213 ?auto_139218 ) ) ( not ( = ?auto_139214 ?auto_139215 ) ) ( not ( = ?auto_139214 ?auto_139216 ) ) ( not ( = ?auto_139214 ?auto_139217 ) ) ( not ( = ?auto_139214 ?auto_139218 ) ) ( not ( = ?auto_139215 ?auto_139216 ) ) ( not ( = ?auto_139215 ?auto_139217 ) ) ( not ( = ?auto_139215 ?auto_139218 ) ) ( not ( = ?auto_139216 ?auto_139217 ) ) ( not ( = ?auto_139216 ?auto_139218 ) ) ( not ( = ?auto_139217 ?auto_139218 ) ) ( ON-TABLE ?auto_139218 ) ( ON ?auto_139217 ?auto_139218 ) ( ON ?auto_139216 ?auto_139217 ) ( ON ?auto_139215 ?auto_139216 ) ( ON ?auto_139214 ?auto_139215 ) ( ON ?auto_139213 ?auto_139214 ) ( CLEAR ?auto_139213 ) ( HOLDING ?auto_139212 ) ( CLEAR ?auto_139211 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_139211 ?auto_139212 )
      ( MAKE-8PILE ?auto_139211 ?auto_139212 ?auto_139213 ?auto_139214 ?auto_139215 ?auto_139216 ?auto_139217 ?auto_139218 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_139219 - BLOCK
      ?auto_139220 - BLOCK
      ?auto_139221 - BLOCK
      ?auto_139222 - BLOCK
      ?auto_139223 - BLOCK
      ?auto_139224 - BLOCK
      ?auto_139225 - BLOCK
      ?auto_139226 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_139219 ) ( not ( = ?auto_139219 ?auto_139220 ) ) ( not ( = ?auto_139219 ?auto_139221 ) ) ( not ( = ?auto_139219 ?auto_139222 ) ) ( not ( = ?auto_139219 ?auto_139223 ) ) ( not ( = ?auto_139219 ?auto_139224 ) ) ( not ( = ?auto_139219 ?auto_139225 ) ) ( not ( = ?auto_139219 ?auto_139226 ) ) ( not ( = ?auto_139220 ?auto_139221 ) ) ( not ( = ?auto_139220 ?auto_139222 ) ) ( not ( = ?auto_139220 ?auto_139223 ) ) ( not ( = ?auto_139220 ?auto_139224 ) ) ( not ( = ?auto_139220 ?auto_139225 ) ) ( not ( = ?auto_139220 ?auto_139226 ) ) ( not ( = ?auto_139221 ?auto_139222 ) ) ( not ( = ?auto_139221 ?auto_139223 ) ) ( not ( = ?auto_139221 ?auto_139224 ) ) ( not ( = ?auto_139221 ?auto_139225 ) ) ( not ( = ?auto_139221 ?auto_139226 ) ) ( not ( = ?auto_139222 ?auto_139223 ) ) ( not ( = ?auto_139222 ?auto_139224 ) ) ( not ( = ?auto_139222 ?auto_139225 ) ) ( not ( = ?auto_139222 ?auto_139226 ) ) ( not ( = ?auto_139223 ?auto_139224 ) ) ( not ( = ?auto_139223 ?auto_139225 ) ) ( not ( = ?auto_139223 ?auto_139226 ) ) ( not ( = ?auto_139224 ?auto_139225 ) ) ( not ( = ?auto_139224 ?auto_139226 ) ) ( not ( = ?auto_139225 ?auto_139226 ) ) ( ON-TABLE ?auto_139226 ) ( ON ?auto_139225 ?auto_139226 ) ( ON ?auto_139224 ?auto_139225 ) ( ON ?auto_139223 ?auto_139224 ) ( ON ?auto_139222 ?auto_139223 ) ( ON ?auto_139221 ?auto_139222 ) ( CLEAR ?auto_139219 ) ( ON ?auto_139220 ?auto_139221 ) ( CLEAR ?auto_139220 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_139226 ?auto_139225 ?auto_139224 ?auto_139223 ?auto_139222 ?auto_139221 )
      ( MAKE-8PILE ?auto_139219 ?auto_139220 ?auto_139221 ?auto_139222 ?auto_139223 ?auto_139224 ?auto_139225 ?auto_139226 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_139227 - BLOCK
      ?auto_139228 - BLOCK
      ?auto_139229 - BLOCK
      ?auto_139230 - BLOCK
      ?auto_139231 - BLOCK
      ?auto_139232 - BLOCK
      ?auto_139233 - BLOCK
      ?auto_139234 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_139227 ?auto_139228 ) ) ( not ( = ?auto_139227 ?auto_139229 ) ) ( not ( = ?auto_139227 ?auto_139230 ) ) ( not ( = ?auto_139227 ?auto_139231 ) ) ( not ( = ?auto_139227 ?auto_139232 ) ) ( not ( = ?auto_139227 ?auto_139233 ) ) ( not ( = ?auto_139227 ?auto_139234 ) ) ( not ( = ?auto_139228 ?auto_139229 ) ) ( not ( = ?auto_139228 ?auto_139230 ) ) ( not ( = ?auto_139228 ?auto_139231 ) ) ( not ( = ?auto_139228 ?auto_139232 ) ) ( not ( = ?auto_139228 ?auto_139233 ) ) ( not ( = ?auto_139228 ?auto_139234 ) ) ( not ( = ?auto_139229 ?auto_139230 ) ) ( not ( = ?auto_139229 ?auto_139231 ) ) ( not ( = ?auto_139229 ?auto_139232 ) ) ( not ( = ?auto_139229 ?auto_139233 ) ) ( not ( = ?auto_139229 ?auto_139234 ) ) ( not ( = ?auto_139230 ?auto_139231 ) ) ( not ( = ?auto_139230 ?auto_139232 ) ) ( not ( = ?auto_139230 ?auto_139233 ) ) ( not ( = ?auto_139230 ?auto_139234 ) ) ( not ( = ?auto_139231 ?auto_139232 ) ) ( not ( = ?auto_139231 ?auto_139233 ) ) ( not ( = ?auto_139231 ?auto_139234 ) ) ( not ( = ?auto_139232 ?auto_139233 ) ) ( not ( = ?auto_139232 ?auto_139234 ) ) ( not ( = ?auto_139233 ?auto_139234 ) ) ( ON-TABLE ?auto_139234 ) ( ON ?auto_139233 ?auto_139234 ) ( ON ?auto_139232 ?auto_139233 ) ( ON ?auto_139231 ?auto_139232 ) ( ON ?auto_139230 ?auto_139231 ) ( ON ?auto_139229 ?auto_139230 ) ( ON ?auto_139228 ?auto_139229 ) ( CLEAR ?auto_139228 ) ( HOLDING ?auto_139227 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_139227 )
      ( MAKE-8PILE ?auto_139227 ?auto_139228 ?auto_139229 ?auto_139230 ?auto_139231 ?auto_139232 ?auto_139233 ?auto_139234 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_139235 - BLOCK
      ?auto_139236 - BLOCK
      ?auto_139237 - BLOCK
      ?auto_139238 - BLOCK
      ?auto_139239 - BLOCK
      ?auto_139240 - BLOCK
      ?auto_139241 - BLOCK
      ?auto_139242 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_139235 ?auto_139236 ) ) ( not ( = ?auto_139235 ?auto_139237 ) ) ( not ( = ?auto_139235 ?auto_139238 ) ) ( not ( = ?auto_139235 ?auto_139239 ) ) ( not ( = ?auto_139235 ?auto_139240 ) ) ( not ( = ?auto_139235 ?auto_139241 ) ) ( not ( = ?auto_139235 ?auto_139242 ) ) ( not ( = ?auto_139236 ?auto_139237 ) ) ( not ( = ?auto_139236 ?auto_139238 ) ) ( not ( = ?auto_139236 ?auto_139239 ) ) ( not ( = ?auto_139236 ?auto_139240 ) ) ( not ( = ?auto_139236 ?auto_139241 ) ) ( not ( = ?auto_139236 ?auto_139242 ) ) ( not ( = ?auto_139237 ?auto_139238 ) ) ( not ( = ?auto_139237 ?auto_139239 ) ) ( not ( = ?auto_139237 ?auto_139240 ) ) ( not ( = ?auto_139237 ?auto_139241 ) ) ( not ( = ?auto_139237 ?auto_139242 ) ) ( not ( = ?auto_139238 ?auto_139239 ) ) ( not ( = ?auto_139238 ?auto_139240 ) ) ( not ( = ?auto_139238 ?auto_139241 ) ) ( not ( = ?auto_139238 ?auto_139242 ) ) ( not ( = ?auto_139239 ?auto_139240 ) ) ( not ( = ?auto_139239 ?auto_139241 ) ) ( not ( = ?auto_139239 ?auto_139242 ) ) ( not ( = ?auto_139240 ?auto_139241 ) ) ( not ( = ?auto_139240 ?auto_139242 ) ) ( not ( = ?auto_139241 ?auto_139242 ) ) ( ON-TABLE ?auto_139242 ) ( ON ?auto_139241 ?auto_139242 ) ( ON ?auto_139240 ?auto_139241 ) ( ON ?auto_139239 ?auto_139240 ) ( ON ?auto_139238 ?auto_139239 ) ( ON ?auto_139237 ?auto_139238 ) ( ON ?auto_139236 ?auto_139237 ) ( ON ?auto_139235 ?auto_139236 ) ( CLEAR ?auto_139235 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_139242 ?auto_139241 ?auto_139240 ?auto_139239 ?auto_139238 ?auto_139237 ?auto_139236 )
      ( MAKE-8PILE ?auto_139235 ?auto_139236 ?auto_139237 ?auto_139238 ?auto_139239 ?auto_139240 ?auto_139241 ?auto_139242 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_139251 - BLOCK
      ?auto_139252 - BLOCK
      ?auto_139253 - BLOCK
      ?auto_139254 - BLOCK
      ?auto_139255 - BLOCK
      ?auto_139256 - BLOCK
      ?auto_139257 - BLOCK
      ?auto_139258 - BLOCK
    )
    :vars
    (
      ?auto_139259 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_139251 ?auto_139252 ) ) ( not ( = ?auto_139251 ?auto_139253 ) ) ( not ( = ?auto_139251 ?auto_139254 ) ) ( not ( = ?auto_139251 ?auto_139255 ) ) ( not ( = ?auto_139251 ?auto_139256 ) ) ( not ( = ?auto_139251 ?auto_139257 ) ) ( not ( = ?auto_139251 ?auto_139258 ) ) ( not ( = ?auto_139252 ?auto_139253 ) ) ( not ( = ?auto_139252 ?auto_139254 ) ) ( not ( = ?auto_139252 ?auto_139255 ) ) ( not ( = ?auto_139252 ?auto_139256 ) ) ( not ( = ?auto_139252 ?auto_139257 ) ) ( not ( = ?auto_139252 ?auto_139258 ) ) ( not ( = ?auto_139253 ?auto_139254 ) ) ( not ( = ?auto_139253 ?auto_139255 ) ) ( not ( = ?auto_139253 ?auto_139256 ) ) ( not ( = ?auto_139253 ?auto_139257 ) ) ( not ( = ?auto_139253 ?auto_139258 ) ) ( not ( = ?auto_139254 ?auto_139255 ) ) ( not ( = ?auto_139254 ?auto_139256 ) ) ( not ( = ?auto_139254 ?auto_139257 ) ) ( not ( = ?auto_139254 ?auto_139258 ) ) ( not ( = ?auto_139255 ?auto_139256 ) ) ( not ( = ?auto_139255 ?auto_139257 ) ) ( not ( = ?auto_139255 ?auto_139258 ) ) ( not ( = ?auto_139256 ?auto_139257 ) ) ( not ( = ?auto_139256 ?auto_139258 ) ) ( not ( = ?auto_139257 ?auto_139258 ) ) ( ON-TABLE ?auto_139258 ) ( ON ?auto_139257 ?auto_139258 ) ( ON ?auto_139256 ?auto_139257 ) ( ON ?auto_139255 ?auto_139256 ) ( ON ?auto_139254 ?auto_139255 ) ( ON ?auto_139253 ?auto_139254 ) ( ON ?auto_139252 ?auto_139253 ) ( CLEAR ?auto_139252 ) ( ON ?auto_139251 ?auto_139259 ) ( CLEAR ?auto_139251 ) ( HAND-EMPTY ) ( not ( = ?auto_139251 ?auto_139259 ) ) ( not ( = ?auto_139252 ?auto_139259 ) ) ( not ( = ?auto_139253 ?auto_139259 ) ) ( not ( = ?auto_139254 ?auto_139259 ) ) ( not ( = ?auto_139255 ?auto_139259 ) ) ( not ( = ?auto_139256 ?auto_139259 ) ) ( not ( = ?auto_139257 ?auto_139259 ) ) ( not ( = ?auto_139258 ?auto_139259 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_139251 ?auto_139259 )
      ( MAKE-8PILE ?auto_139251 ?auto_139252 ?auto_139253 ?auto_139254 ?auto_139255 ?auto_139256 ?auto_139257 ?auto_139258 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_139260 - BLOCK
      ?auto_139261 - BLOCK
      ?auto_139262 - BLOCK
      ?auto_139263 - BLOCK
      ?auto_139264 - BLOCK
      ?auto_139265 - BLOCK
      ?auto_139266 - BLOCK
      ?auto_139267 - BLOCK
    )
    :vars
    (
      ?auto_139268 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_139260 ?auto_139261 ) ) ( not ( = ?auto_139260 ?auto_139262 ) ) ( not ( = ?auto_139260 ?auto_139263 ) ) ( not ( = ?auto_139260 ?auto_139264 ) ) ( not ( = ?auto_139260 ?auto_139265 ) ) ( not ( = ?auto_139260 ?auto_139266 ) ) ( not ( = ?auto_139260 ?auto_139267 ) ) ( not ( = ?auto_139261 ?auto_139262 ) ) ( not ( = ?auto_139261 ?auto_139263 ) ) ( not ( = ?auto_139261 ?auto_139264 ) ) ( not ( = ?auto_139261 ?auto_139265 ) ) ( not ( = ?auto_139261 ?auto_139266 ) ) ( not ( = ?auto_139261 ?auto_139267 ) ) ( not ( = ?auto_139262 ?auto_139263 ) ) ( not ( = ?auto_139262 ?auto_139264 ) ) ( not ( = ?auto_139262 ?auto_139265 ) ) ( not ( = ?auto_139262 ?auto_139266 ) ) ( not ( = ?auto_139262 ?auto_139267 ) ) ( not ( = ?auto_139263 ?auto_139264 ) ) ( not ( = ?auto_139263 ?auto_139265 ) ) ( not ( = ?auto_139263 ?auto_139266 ) ) ( not ( = ?auto_139263 ?auto_139267 ) ) ( not ( = ?auto_139264 ?auto_139265 ) ) ( not ( = ?auto_139264 ?auto_139266 ) ) ( not ( = ?auto_139264 ?auto_139267 ) ) ( not ( = ?auto_139265 ?auto_139266 ) ) ( not ( = ?auto_139265 ?auto_139267 ) ) ( not ( = ?auto_139266 ?auto_139267 ) ) ( ON-TABLE ?auto_139267 ) ( ON ?auto_139266 ?auto_139267 ) ( ON ?auto_139265 ?auto_139266 ) ( ON ?auto_139264 ?auto_139265 ) ( ON ?auto_139263 ?auto_139264 ) ( ON ?auto_139262 ?auto_139263 ) ( ON ?auto_139260 ?auto_139268 ) ( CLEAR ?auto_139260 ) ( not ( = ?auto_139260 ?auto_139268 ) ) ( not ( = ?auto_139261 ?auto_139268 ) ) ( not ( = ?auto_139262 ?auto_139268 ) ) ( not ( = ?auto_139263 ?auto_139268 ) ) ( not ( = ?auto_139264 ?auto_139268 ) ) ( not ( = ?auto_139265 ?auto_139268 ) ) ( not ( = ?auto_139266 ?auto_139268 ) ) ( not ( = ?auto_139267 ?auto_139268 ) ) ( HOLDING ?auto_139261 ) ( CLEAR ?auto_139262 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_139267 ?auto_139266 ?auto_139265 ?auto_139264 ?auto_139263 ?auto_139262 ?auto_139261 )
      ( MAKE-8PILE ?auto_139260 ?auto_139261 ?auto_139262 ?auto_139263 ?auto_139264 ?auto_139265 ?auto_139266 ?auto_139267 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_139269 - BLOCK
      ?auto_139270 - BLOCK
      ?auto_139271 - BLOCK
      ?auto_139272 - BLOCK
      ?auto_139273 - BLOCK
      ?auto_139274 - BLOCK
      ?auto_139275 - BLOCK
      ?auto_139276 - BLOCK
    )
    :vars
    (
      ?auto_139277 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_139269 ?auto_139270 ) ) ( not ( = ?auto_139269 ?auto_139271 ) ) ( not ( = ?auto_139269 ?auto_139272 ) ) ( not ( = ?auto_139269 ?auto_139273 ) ) ( not ( = ?auto_139269 ?auto_139274 ) ) ( not ( = ?auto_139269 ?auto_139275 ) ) ( not ( = ?auto_139269 ?auto_139276 ) ) ( not ( = ?auto_139270 ?auto_139271 ) ) ( not ( = ?auto_139270 ?auto_139272 ) ) ( not ( = ?auto_139270 ?auto_139273 ) ) ( not ( = ?auto_139270 ?auto_139274 ) ) ( not ( = ?auto_139270 ?auto_139275 ) ) ( not ( = ?auto_139270 ?auto_139276 ) ) ( not ( = ?auto_139271 ?auto_139272 ) ) ( not ( = ?auto_139271 ?auto_139273 ) ) ( not ( = ?auto_139271 ?auto_139274 ) ) ( not ( = ?auto_139271 ?auto_139275 ) ) ( not ( = ?auto_139271 ?auto_139276 ) ) ( not ( = ?auto_139272 ?auto_139273 ) ) ( not ( = ?auto_139272 ?auto_139274 ) ) ( not ( = ?auto_139272 ?auto_139275 ) ) ( not ( = ?auto_139272 ?auto_139276 ) ) ( not ( = ?auto_139273 ?auto_139274 ) ) ( not ( = ?auto_139273 ?auto_139275 ) ) ( not ( = ?auto_139273 ?auto_139276 ) ) ( not ( = ?auto_139274 ?auto_139275 ) ) ( not ( = ?auto_139274 ?auto_139276 ) ) ( not ( = ?auto_139275 ?auto_139276 ) ) ( ON-TABLE ?auto_139276 ) ( ON ?auto_139275 ?auto_139276 ) ( ON ?auto_139274 ?auto_139275 ) ( ON ?auto_139273 ?auto_139274 ) ( ON ?auto_139272 ?auto_139273 ) ( ON ?auto_139271 ?auto_139272 ) ( ON ?auto_139269 ?auto_139277 ) ( not ( = ?auto_139269 ?auto_139277 ) ) ( not ( = ?auto_139270 ?auto_139277 ) ) ( not ( = ?auto_139271 ?auto_139277 ) ) ( not ( = ?auto_139272 ?auto_139277 ) ) ( not ( = ?auto_139273 ?auto_139277 ) ) ( not ( = ?auto_139274 ?auto_139277 ) ) ( not ( = ?auto_139275 ?auto_139277 ) ) ( not ( = ?auto_139276 ?auto_139277 ) ) ( CLEAR ?auto_139271 ) ( ON ?auto_139270 ?auto_139269 ) ( CLEAR ?auto_139270 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_139277 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_139277 ?auto_139269 )
      ( MAKE-8PILE ?auto_139269 ?auto_139270 ?auto_139271 ?auto_139272 ?auto_139273 ?auto_139274 ?auto_139275 ?auto_139276 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_139278 - BLOCK
      ?auto_139279 - BLOCK
      ?auto_139280 - BLOCK
      ?auto_139281 - BLOCK
      ?auto_139282 - BLOCK
      ?auto_139283 - BLOCK
      ?auto_139284 - BLOCK
      ?auto_139285 - BLOCK
    )
    :vars
    (
      ?auto_139286 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_139278 ?auto_139279 ) ) ( not ( = ?auto_139278 ?auto_139280 ) ) ( not ( = ?auto_139278 ?auto_139281 ) ) ( not ( = ?auto_139278 ?auto_139282 ) ) ( not ( = ?auto_139278 ?auto_139283 ) ) ( not ( = ?auto_139278 ?auto_139284 ) ) ( not ( = ?auto_139278 ?auto_139285 ) ) ( not ( = ?auto_139279 ?auto_139280 ) ) ( not ( = ?auto_139279 ?auto_139281 ) ) ( not ( = ?auto_139279 ?auto_139282 ) ) ( not ( = ?auto_139279 ?auto_139283 ) ) ( not ( = ?auto_139279 ?auto_139284 ) ) ( not ( = ?auto_139279 ?auto_139285 ) ) ( not ( = ?auto_139280 ?auto_139281 ) ) ( not ( = ?auto_139280 ?auto_139282 ) ) ( not ( = ?auto_139280 ?auto_139283 ) ) ( not ( = ?auto_139280 ?auto_139284 ) ) ( not ( = ?auto_139280 ?auto_139285 ) ) ( not ( = ?auto_139281 ?auto_139282 ) ) ( not ( = ?auto_139281 ?auto_139283 ) ) ( not ( = ?auto_139281 ?auto_139284 ) ) ( not ( = ?auto_139281 ?auto_139285 ) ) ( not ( = ?auto_139282 ?auto_139283 ) ) ( not ( = ?auto_139282 ?auto_139284 ) ) ( not ( = ?auto_139282 ?auto_139285 ) ) ( not ( = ?auto_139283 ?auto_139284 ) ) ( not ( = ?auto_139283 ?auto_139285 ) ) ( not ( = ?auto_139284 ?auto_139285 ) ) ( ON-TABLE ?auto_139285 ) ( ON ?auto_139284 ?auto_139285 ) ( ON ?auto_139283 ?auto_139284 ) ( ON ?auto_139282 ?auto_139283 ) ( ON ?auto_139281 ?auto_139282 ) ( ON ?auto_139278 ?auto_139286 ) ( not ( = ?auto_139278 ?auto_139286 ) ) ( not ( = ?auto_139279 ?auto_139286 ) ) ( not ( = ?auto_139280 ?auto_139286 ) ) ( not ( = ?auto_139281 ?auto_139286 ) ) ( not ( = ?auto_139282 ?auto_139286 ) ) ( not ( = ?auto_139283 ?auto_139286 ) ) ( not ( = ?auto_139284 ?auto_139286 ) ) ( not ( = ?auto_139285 ?auto_139286 ) ) ( ON ?auto_139279 ?auto_139278 ) ( CLEAR ?auto_139279 ) ( ON-TABLE ?auto_139286 ) ( HOLDING ?auto_139280 ) ( CLEAR ?auto_139281 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_139285 ?auto_139284 ?auto_139283 ?auto_139282 ?auto_139281 ?auto_139280 )
      ( MAKE-8PILE ?auto_139278 ?auto_139279 ?auto_139280 ?auto_139281 ?auto_139282 ?auto_139283 ?auto_139284 ?auto_139285 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_139287 - BLOCK
      ?auto_139288 - BLOCK
      ?auto_139289 - BLOCK
      ?auto_139290 - BLOCK
      ?auto_139291 - BLOCK
      ?auto_139292 - BLOCK
      ?auto_139293 - BLOCK
      ?auto_139294 - BLOCK
    )
    :vars
    (
      ?auto_139295 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_139287 ?auto_139288 ) ) ( not ( = ?auto_139287 ?auto_139289 ) ) ( not ( = ?auto_139287 ?auto_139290 ) ) ( not ( = ?auto_139287 ?auto_139291 ) ) ( not ( = ?auto_139287 ?auto_139292 ) ) ( not ( = ?auto_139287 ?auto_139293 ) ) ( not ( = ?auto_139287 ?auto_139294 ) ) ( not ( = ?auto_139288 ?auto_139289 ) ) ( not ( = ?auto_139288 ?auto_139290 ) ) ( not ( = ?auto_139288 ?auto_139291 ) ) ( not ( = ?auto_139288 ?auto_139292 ) ) ( not ( = ?auto_139288 ?auto_139293 ) ) ( not ( = ?auto_139288 ?auto_139294 ) ) ( not ( = ?auto_139289 ?auto_139290 ) ) ( not ( = ?auto_139289 ?auto_139291 ) ) ( not ( = ?auto_139289 ?auto_139292 ) ) ( not ( = ?auto_139289 ?auto_139293 ) ) ( not ( = ?auto_139289 ?auto_139294 ) ) ( not ( = ?auto_139290 ?auto_139291 ) ) ( not ( = ?auto_139290 ?auto_139292 ) ) ( not ( = ?auto_139290 ?auto_139293 ) ) ( not ( = ?auto_139290 ?auto_139294 ) ) ( not ( = ?auto_139291 ?auto_139292 ) ) ( not ( = ?auto_139291 ?auto_139293 ) ) ( not ( = ?auto_139291 ?auto_139294 ) ) ( not ( = ?auto_139292 ?auto_139293 ) ) ( not ( = ?auto_139292 ?auto_139294 ) ) ( not ( = ?auto_139293 ?auto_139294 ) ) ( ON-TABLE ?auto_139294 ) ( ON ?auto_139293 ?auto_139294 ) ( ON ?auto_139292 ?auto_139293 ) ( ON ?auto_139291 ?auto_139292 ) ( ON ?auto_139290 ?auto_139291 ) ( ON ?auto_139287 ?auto_139295 ) ( not ( = ?auto_139287 ?auto_139295 ) ) ( not ( = ?auto_139288 ?auto_139295 ) ) ( not ( = ?auto_139289 ?auto_139295 ) ) ( not ( = ?auto_139290 ?auto_139295 ) ) ( not ( = ?auto_139291 ?auto_139295 ) ) ( not ( = ?auto_139292 ?auto_139295 ) ) ( not ( = ?auto_139293 ?auto_139295 ) ) ( not ( = ?auto_139294 ?auto_139295 ) ) ( ON ?auto_139288 ?auto_139287 ) ( ON-TABLE ?auto_139295 ) ( CLEAR ?auto_139290 ) ( ON ?auto_139289 ?auto_139288 ) ( CLEAR ?auto_139289 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_139295 ?auto_139287 ?auto_139288 )
      ( MAKE-8PILE ?auto_139287 ?auto_139288 ?auto_139289 ?auto_139290 ?auto_139291 ?auto_139292 ?auto_139293 ?auto_139294 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_139296 - BLOCK
      ?auto_139297 - BLOCK
      ?auto_139298 - BLOCK
      ?auto_139299 - BLOCK
      ?auto_139300 - BLOCK
      ?auto_139301 - BLOCK
      ?auto_139302 - BLOCK
      ?auto_139303 - BLOCK
    )
    :vars
    (
      ?auto_139304 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_139296 ?auto_139297 ) ) ( not ( = ?auto_139296 ?auto_139298 ) ) ( not ( = ?auto_139296 ?auto_139299 ) ) ( not ( = ?auto_139296 ?auto_139300 ) ) ( not ( = ?auto_139296 ?auto_139301 ) ) ( not ( = ?auto_139296 ?auto_139302 ) ) ( not ( = ?auto_139296 ?auto_139303 ) ) ( not ( = ?auto_139297 ?auto_139298 ) ) ( not ( = ?auto_139297 ?auto_139299 ) ) ( not ( = ?auto_139297 ?auto_139300 ) ) ( not ( = ?auto_139297 ?auto_139301 ) ) ( not ( = ?auto_139297 ?auto_139302 ) ) ( not ( = ?auto_139297 ?auto_139303 ) ) ( not ( = ?auto_139298 ?auto_139299 ) ) ( not ( = ?auto_139298 ?auto_139300 ) ) ( not ( = ?auto_139298 ?auto_139301 ) ) ( not ( = ?auto_139298 ?auto_139302 ) ) ( not ( = ?auto_139298 ?auto_139303 ) ) ( not ( = ?auto_139299 ?auto_139300 ) ) ( not ( = ?auto_139299 ?auto_139301 ) ) ( not ( = ?auto_139299 ?auto_139302 ) ) ( not ( = ?auto_139299 ?auto_139303 ) ) ( not ( = ?auto_139300 ?auto_139301 ) ) ( not ( = ?auto_139300 ?auto_139302 ) ) ( not ( = ?auto_139300 ?auto_139303 ) ) ( not ( = ?auto_139301 ?auto_139302 ) ) ( not ( = ?auto_139301 ?auto_139303 ) ) ( not ( = ?auto_139302 ?auto_139303 ) ) ( ON-TABLE ?auto_139303 ) ( ON ?auto_139302 ?auto_139303 ) ( ON ?auto_139301 ?auto_139302 ) ( ON ?auto_139300 ?auto_139301 ) ( ON ?auto_139296 ?auto_139304 ) ( not ( = ?auto_139296 ?auto_139304 ) ) ( not ( = ?auto_139297 ?auto_139304 ) ) ( not ( = ?auto_139298 ?auto_139304 ) ) ( not ( = ?auto_139299 ?auto_139304 ) ) ( not ( = ?auto_139300 ?auto_139304 ) ) ( not ( = ?auto_139301 ?auto_139304 ) ) ( not ( = ?auto_139302 ?auto_139304 ) ) ( not ( = ?auto_139303 ?auto_139304 ) ) ( ON ?auto_139297 ?auto_139296 ) ( ON-TABLE ?auto_139304 ) ( ON ?auto_139298 ?auto_139297 ) ( CLEAR ?auto_139298 ) ( HOLDING ?auto_139299 ) ( CLEAR ?auto_139300 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_139303 ?auto_139302 ?auto_139301 ?auto_139300 ?auto_139299 )
      ( MAKE-8PILE ?auto_139296 ?auto_139297 ?auto_139298 ?auto_139299 ?auto_139300 ?auto_139301 ?auto_139302 ?auto_139303 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_139305 - BLOCK
      ?auto_139306 - BLOCK
      ?auto_139307 - BLOCK
      ?auto_139308 - BLOCK
      ?auto_139309 - BLOCK
      ?auto_139310 - BLOCK
      ?auto_139311 - BLOCK
      ?auto_139312 - BLOCK
    )
    :vars
    (
      ?auto_139313 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_139305 ?auto_139306 ) ) ( not ( = ?auto_139305 ?auto_139307 ) ) ( not ( = ?auto_139305 ?auto_139308 ) ) ( not ( = ?auto_139305 ?auto_139309 ) ) ( not ( = ?auto_139305 ?auto_139310 ) ) ( not ( = ?auto_139305 ?auto_139311 ) ) ( not ( = ?auto_139305 ?auto_139312 ) ) ( not ( = ?auto_139306 ?auto_139307 ) ) ( not ( = ?auto_139306 ?auto_139308 ) ) ( not ( = ?auto_139306 ?auto_139309 ) ) ( not ( = ?auto_139306 ?auto_139310 ) ) ( not ( = ?auto_139306 ?auto_139311 ) ) ( not ( = ?auto_139306 ?auto_139312 ) ) ( not ( = ?auto_139307 ?auto_139308 ) ) ( not ( = ?auto_139307 ?auto_139309 ) ) ( not ( = ?auto_139307 ?auto_139310 ) ) ( not ( = ?auto_139307 ?auto_139311 ) ) ( not ( = ?auto_139307 ?auto_139312 ) ) ( not ( = ?auto_139308 ?auto_139309 ) ) ( not ( = ?auto_139308 ?auto_139310 ) ) ( not ( = ?auto_139308 ?auto_139311 ) ) ( not ( = ?auto_139308 ?auto_139312 ) ) ( not ( = ?auto_139309 ?auto_139310 ) ) ( not ( = ?auto_139309 ?auto_139311 ) ) ( not ( = ?auto_139309 ?auto_139312 ) ) ( not ( = ?auto_139310 ?auto_139311 ) ) ( not ( = ?auto_139310 ?auto_139312 ) ) ( not ( = ?auto_139311 ?auto_139312 ) ) ( ON-TABLE ?auto_139312 ) ( ON ?auto_139311 ?auto_139312 ) ( ON ?auto_139310 ?auto_139311 ) ( ON ?auto_139309 ?auto_139310 ) ( ON ?auto_139305 ?auto_139313 ) ( not ( = ?auto_139305 ?auto_139313 ) ) ( not ( = ?auto_139306 ?auto_139313 ) ) ( not ( = ?auto_139307 ?auto_139313 ) ) ( not ( = ?auto_139308 ?auto_139313 ) ) ( not ( = ?auto_139309 ?auto_139313 ) ) ( not ( = ?auto_139310 ?auto_139313 ) ) ( not ( = ?auto_139311 ?auto_139313 ) ) ( not ( = ?auto_139312 ?auto_139313 ) ) ( ON ?auto_139306 ?auto_139305 ) ( ON-TABLE ?auto_139313 ) ( ON ?auto_139307 ?auto_139306 ) ( CLEAR ?auto_139309 ) ( ON ?auto_139308 ?auto_139307 ) ( CLEAR ?auto_139308 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_139313 ?auto_139305 ?auto_139306 ?auto_139307 )
      ( MAKE-8PILE ?auto_139305 ?auto_139306 ?auto_139307 ?auto_139308 ?auto_139309 ?auto_139310 ?auto_139311 ?auto_139312 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_139314 - BLOCK
      ?auto_139315 - BLOCK
      ?auto_139316 - BLOCK
      ?auto_139317 - BLOCK
      ?auto_139318 - BLOCK
      ?auto_139319 - BLOCK
      ?auto_139320 - BLOCK
      ?auto_139321 - BLOCK
    )
    :vars
    (
      ?auto_139322 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_139314 ?auto_139315 ) ) ( not ( = ?auto_139314 ?auto_139316 ) ) ( not ( = ?auto_139314 ?auto_139317 ) ) ( not ( = ?auto_139314 ?auto_139318 ) ) ( not ( = ?auto_139314 ?auto_139319 ) ) ( not ( = ?auto_139314 ?auto_139320 ) ) ( not ( = ?auto_139314 ?auto_139321 ) ) ( not ( = ?auto_139315 ?auto_139316 ) ) ( not ( = ?auto_139315 ?auto_139317 ) ) ( not ( = ?auto_139315 ?auto_139318 ) ) ( not ( = ?auto_139315 ?auto_139319 ) ) ( not ( = ?auto_139315 ?auto_139320 ) ) ( not ( = ?auto_139315 ?auto_139321 ) ) ( not ( = ?auto_139316 ?auto_139317 ) ) ( not ( = ?auto_139316 ?auto_139318 ) ) ( not ( = ?auto_139316 ?auto_139319 ) ) ( not ( = ?auto_139316 ?auto_139320 ) ) ( not ( = ?auto_139316 ?auto_139321 ) ) ( not ( = ?auto_139317 ?auto_139318 ) ) ( not ( = ?auto_139317 ?auto_139319 ) ) ( not ( = ?auto_139317 ?auto_139320 ) ) ( not ( = ?auto_139317 ?auto_139321 ) ) ( not ( = ?auto_139318 ?auto_139319 ) ) ( not ( = ?auto_139318 ?auto_139320 ) ) ( not ( = ?auto_139318 ?auto_139321 ) ) ( not ( = ?auto_139319 ?auto_139320 ) ) ( not ( = ?auto_139319 ?auto_139321 ) ) ( not ( = ?auto_139320 ?auto_139321 ) ) ( ON-TABLE ?auto_139321 ) ( ON ?auto_139320 ?auto_139321 ) ( ON ?auto_139319 ?auto_139320 ) ( ON ?auto_139314 ?auto_139322 ) ( not ( = ?auto_139314 ?auto_139322 ) ) ( not ( = ?auto_139315 ?auto_139322 ) ) ( not ( = ?auto_139316 ?auto_139322 ) ) ( not ( = ?auto_139317 ?auto_139322 ) ) ( not ( = ?auto_139318 ?auto_139322 ) ) ( not ( = ?auto_139319 ?auto_139322 ) ) ( not ( = ?auto_139320 ?auto_139322 ) ) ( not ( = ?auto_139321 ?auto_139322 ) ) ( ON ?auto_139315 ?auto_139314 ) ( ON-TABLE ?auto_139322 ) ( ON ?auto_139316 ?auto_139315 ) ( ON ?auto_139317 ?auto_139316 ) ( CLEAR ?auto_139317 ) ( HOLDING ?auto_139318 ) ( CLEAR ?auto_139319 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_139321 ?auto_139320 ?auto_139319 ?auto_139318 )
      ( MAKE-8PILE ?auto_139314 ?auto_139315 ?auto_139316 ?auto_139317 ?auto_139318 ?auto_139319 ?auto_139320 ?auto_139321 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_139323 - BLOCK
      ?auto_139324 - BLOCK
      ?auto_139325 - BLOCK
      ?auto_139326 - BLOCK
      ?auto_139327 - BLOCK
      ?auto_139328 - BLOCK
      ?auto_139329 - BLOCK
      ?auto_139330 - BLOCK
    )
    :vars
    (
      ?auto_139331 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_139323 ?auto_139324 ) ) ( not ( = ?auto_139323 ?auto_139325 ) ) ( not ( = ?auto_139323 ?auto_139326 ) ) ( not ( = ?auto_139323 ?auto_139327 ) ) ( not ( = ?auto_139323 ?auto_139328 ) ) ( not ( = ?auto_139323 ?auto_139329 ) ) ( not ( = ?auto_139323 ?auto_139330 ) ) ( not ( = ?auto_139324 ?auto_139325 ) ) ( not ( = ?auto_139324 ?auto_139326 ) ) ( not ( = ?auto_139324 ?auto_139327 ) ) ( not ( = ?auto_139324 ?auto_139328 ) ) ( not ( = ?auto_139324 ?auto_139329 ) ) ( not ( = ?auto_139324 ?auto_139330 ) ) ( not ( = ?auto_139325 ?auto_139326 ) ) ( not ( = ?auto_139325 ?auto_139327 ) ) ( not ( = ?auto_139325 ?auto_139328 ) ) ( not ( = ?auto_139325 ?auto_139329 ) ) ( not ( = ?auto_139325 ?auto_139330 ) ) ( not ( = ?auto_139326 ?auto_139327 ) ) ( not ( = ?auto_139326 ?auto_139328 ) ) ( not ( = ?auto_139326 ?auto_139329 ) ) ( not ( = ?auto_139326 ?auto_139330 ) ) ( not ( = ?auto_139327 ?auto_139328 ) ) ( not ( = ?auto_139327 ?auto_139329 ) ) ( not ( = ?auto_139327 ?auto_139330 ) ) ( not ( = ?auto_139328 ?auto_139329 ) ) ( not ( = ?auto_139328 ?auto_139330 ) ) ( not ( = ?auto_139329 ?auto_139330 ) ) ( ON-TABLE ?auto_139330 ) ( ON ?auto_139329 ?auto_139330 ) ( ON ?auto_139328 ?auto_139329 ) ( ON ?auto_139323 ?auto_139331 ) ( not ( = ?auto_139323 ?auto_139331 ) ) ( not ( = ?auto_139324 ?auto_139331 ) ) ( not ( = ?auto_139325 ?auto_139331 ) ) ( not ( = ?auto_139326 ?auto_139331 ) ) ( not ( = ?auto_139327 ?auto_139331 ) ) ( not ( = ?auto_139328 ?auto_139331 ) ) ( not ( = ?auto_139329 ?auto_139331 ) ) ( not ( = ?auto_139330 ?auto_139331 ) ) ( ON ?auto_139324 ?auto_139323 ) ( ON-TABLE ?auto_139331 ) ( ON ?auto_139325 ?auto_139324 ) ( ON ?auto_139326 ?auto_139325 ) ( CLEAR ?auto_139328 ) ( ON ?auto_139327 ?auto_139326 ) ( CLEAR ?auto_139327 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_139331 ?auto_139323 ?auto_139324 ?auto_139325 ?auto_139326 )
      ( MAKE-8PILE ?auto_139323 ?auto_139324 ?auto_139325 ?auto_139326 ?auto_139327 ?auto_139328 ?auto_139329 ?auto_139330 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_139332 - BLOCK
      ?auto_139333 - BLOCK
      ?auto_139334 - BLOCK
      ?auto_139335 - BLOCK
      ?auto_139336 - BLOCK
      ?auto_139337 - BLOCK
      ?auto_139338 - BLOCK
      ?auto_139339 - BLOCK
    )
    :vars
    (
      ?auto_139340 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_139332 ?auto_139333 ) ) ( not ( = ?auto_139332 ?auto_139334 ) ) ( not ( = ?auto_139332 ?auto_139335 ) ) ( not ( = ?auto_139332 ?auto_139336 ) ) ( not ( = ?auto_139332 ?auto_139337 ) ) ( not ( = ?auto_139332 ?auto_139338 ) ) ( not ( = ?auto_139332 ?auto_139339 ) ) ( not ( = ?auto_139333 ?auto_139334 ) ) ( not ( = ?auto_139333 ?auto_139335 ) ) ( not ( = ?auto_139333 ?auto_139336 ) ) ( not ( = ?auto_139333 ?auto_139337 ) ) ( not ( = ?auto_139333 ?auto_139338 ) ) ( not ( = ?auto_139333 ?auto_139339 ) ) ( not ( = ?auto_139334 ?auto_139335 ) ) ( not ( = ?auto_139334 ?auto_139336 ) ) ( not ( = ?auto_139334 ?auto_139337 ) ) ( not ( = ?auto_139334 ?auto_139338 ) ) ( not ( = ?auto_139334 ?auto_139339 ) ) ( not ( = ?auto_139335 ?auto_139336 ) ) ( not ( = ?auto_139335 ?auto_139337 ) ) ( not ( = ?auto_139335 ?auto_139338 ) ) ( not ( = ?auto_139335 ?auto_139339 ) ) ( not ( = ?auto_139336 ?auto_139337 ) ) ( not ( = ?auto_139336 ?auto_139338 ) ) ( not ( = ?auto_139336 ?auto_139339 ) ) ( not ( = ?auto_139337 ?auto_139338 ) ) ( not ( = ?auto_139337 ?auto_139339 ) ) ( not ( = ?auto_139338 ?auto_139339 ) ) ( ON-TABLE ?auto_139339 ) ( ON ?auto_139338 ?auto_139339 ) ( ON ?auto_139332 ?auto_139340 ) ( not ( = ?auto_139332 ?auto_139340 ) ) ( not ( = ?auto_139333 ?auto_139340 ) ) ( not ( = ?auto_139334 ?auto_139340 ) ) ( not ( = ?auto_139335 ?auto_139340 ) ) ( not ( = ?auto_139336 ?auto_139340 ) ) ( not ( = ?auto_139337 ?auto_139340 ) ) ( not ( = ?auto_139338 ?auto_139340 ) ) ( not ( = ?auto_139339 ?auto_139340 ) ) ( ON ?auto_139333 ?auto_139332 ) ( ON-TABLE ?auto_139340 ) ( ON ?auto_139334 ?auto_139333 ) ( ON ?auto_139335 ?auto_139334 ) ( ON ?auto_139336 ?auto_139335 ) ( CLEAR ?auto_139336 ) ( HOLDING ?auto_139337 ) ( CLEAR ?auto_139338 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_139339 ?auto_139338 ?auto_139337 )
      ( MAKE-8PILE ?auto_139332 ?auto_139333 ?auto_139334 ?auto_139335 ?auto_139336 ?auto_139337 ?auto_139338 ?auto_139339 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_139341 - BLOCK
      ?auto_139342 - BLOCK
      ?auto_139343 - BLOCK
      ?auto_139344 - BLOCK
      ?auto_139345 - BLOCK
      ?auto_139346 - BLOCK
      ?auto_139347 - BLOCK
      ?auto_139348 - BLOCK
    )
    :vars
    (
      ?auto_139349 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_139341 ?auto_139342 ) ) ( not ( = ?auto_139341 ?auto_139343 ) ) ( not ( = ?auto_139341 ?auto_139344 ) ) ( not ( = ?auto_139341 ?auto_139345 ) ) ( not ( = ?auto_139341 ?auto_139346 ) ) ( not ( = ?auto_139341 ?auto_139347 ) ) ( not ( = ?auto_139341 ?auto_139348 ) ) ( not ( = ?auto_139342 ?auto_139343 ) ) ( not ( = ?auto_139342 ?auto_139344 ) ) ( not ( = ?auto_139342 ?auto_139345 ) ) ( not ( = ?auto_139342 ?auto_139346 ) ) ( not ( = ?auto_139342 ?auto_139347 ) ) ( not ( = ?auto_139342 ?auto_139348 ) ) ( not ( = ?auto_139343 ?auto_139344 ) ) ( not ( = ?auto_139343 ?auto_139345 ) ) ( not ( = ?auto_139343 ?auto_139346 ) ) ( not ( = ?auto_139343 ?auto_139347 ) ) ( not ( = ?auto_139343 ?auto_139348 ) ) ( not ( = ?auto_139344 ?auto_139345 ) ) ( not ( = ?auto_139344 ?auto_139346 ) ) ( not ( = ?auto_139344 ?auto_139347 ) ) ( not ( = ?auto_139344 ?auto_139348 ) ) ( not ( = ?auto_139345 ?auto_139346 ) ) ( not ( = ?auto_139345 ?auto_139347 ) ) ( not ( = ?auto_139345 ?auto_139348 ) ) ( not ( = ?auto_139346 ?auto_139347 ) ) ( not ( = ?auto_139346 ?auto_139348 ) ) ( not ( = ?auto_139347 ?auto_139348 ) ) ( ON-TABLE ?auto_139348 ) ( ON ?auto_139347 ?auto_139348 ) ( ON ?auto_139341 ?auto_139349 ) ( not ( = ?auto_139341 ?auto_139349 ) ) ( not ( = ?auto_139342 ?auto_139349 ) ) ( not ( = ?auto_139343 ?auto_139349 ) ) ( not ( = ?auto_139344 ?auto_139349 ) ) ( not ( = ?auto_139345 ?auto_139349 ) ) ( not ( = ?auto_139346 ?auto_139349 ) ) ( not ( = ?auto_139347 ?auto_139349 ) ) ( not ( = ?auto_139348 ?auto_139349 ) ) ( ON ?auto_139342 ?auto_139341 ) ( ON-TABLE ?auto_139349 ) ( ON ?auto_139343 ?auto_139342 ) ( ON ?auto_139344 ?auto_139343 ) ( ON ?auto_139345 ?auto_139344 ) ( CLEAR ?auto_139347 ) ( ON ?auto_139346 ?auto_139345 ) ( CLEAR ?auto_139346 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_139349 ?auto_139341 ?auto_139342 ?auto_139343 ?auto_139344 ?auto_139345 )
      ( MAKE-8PILE ?auto_139341 ?auto_139342 ?auto_139343 ?auto_139344 ?auto_139345 ?auto_139346 ?auto_139347 ?auto_139348 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_139350 - BLOCK
      ?auto_139351 - BLOCK
      ?auto_139352 - BLOCK
      ?auto_139353 - BLOCK
      ?auto_139354 - BLOCK
      ?auto_139355 - BLOCK
      ?auto_139356 - BLOCK
      ?auto_139357 - BLOCK
    )
    :vars
    (
      ?auto_139358 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_139350 ?auto_139351 ) ) ( not ( = ?auto_139350 ?auto_139352 ) ) ( not ( = ?auto_139350 ?auto_139353 ) ) ( not ( = ?auto_139350 ?auto_139354 ) ) ( not ( = ?auto_139350 ?auto_139355 ) ) ( not ( = ?auto_139350 ?auto_139356 ) ) ( not ( = ?auto_139350 ?auto_139357 ) ) ( not ( = ?auto_139351 ?auto_139352 ) ) ( not ( = ?auto_139351 ?auto_139353 ) ) ( not ( = ?auto_139351 ?auto_139354 ) ) ( not ( = ?auto_139351 ?auto_139355 ) ) ( not ( = ?auto_139351 ?auto_139356 ) ) ( not ( = ?auto_139351 ?auto_139357 ) ) ( not ( = ?auto_139352 ?auto_139353 ) ) ( not ( = ?auto_139352 ?auto_139354 ) ) ( not ( = ?auto_139352 ?auto_139355 ) ) ( not ( = ?auto_139352 ?auto_139356 ) ) ( not ( = ?auto_139352 ?auto_139357 ) ) ( not ( = ?auto_139353 ?auto_139354 ) ) ( not ( = ?auto_139353 ?auto_139355 ) ) ( not ( = ?auto_139353 ?auto_139356 ) ) ( not ( = ?auto_139353 ?auto_139357 ) ) ( not ( = ?auto_139354 ?auto_139355 ) ) ( not ( = ?auto_139354 ?auto_139356 ) ) ( not ( = ?auto_139354 ?auto_139357 ) ) ( not ( = ?auto_139355 ?auto_139356 ) ) ( not ( = ?auto_139355 ?auto_139357 ) ) ( not ( = ?auto_139356 ?auto_139357 ) ) ( ON-TABLE ?auto_139357 ) ( ON ?auto_139350 ?auto_139358 ) ( not ( = ?auto_139350 ?auto_139358 ) ) ( not ( = ?auto_139351 ?auto_139358 ) ) ( not ( = ?auto_139352 ?auto_139358 ) ) ( not ( = ?auto_139353 ?auto_139358 ) ) ( not ( = ?auto_139354 ?auto_139358 ) ) ( not ( = ?auto_139355 ?auto_139358 ) ) ( not ( = ?auto_139356 ?auto_139358 ) ) ( not ( = ?auto_139357 ?auto_139358 ) ) ( ON ?auto_139351 ?auto_139350 ) ( ON-TABLE ?auto_139358 ) ( ON ?auto_139352 ?auto_139351 ) ( ON ?auto_139353 ?auto_139352 ) ( ON ?auto_139354 ?auto_139353 ) ( ON ?auto_139355 ?auto_139354 ) ( CLEAR ?auto_139355 ) ( HOLDING ?auto_139356 ) ( CLEAR ?auto_139357 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_139357 ?auto_139356 )
      ( MAKE-8PILE ?auto_139350 ?auto_139351 ?auto_139352 ?auto_139353 ?auto_139354 ?auto_139355 ?auto_139356 ?auto_139357 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_139359 - BLOCK
      ?auto_139360 - BLOCK
      ?auto_139361 - BLOCK
      ?auto_139362 - BLOCK
      ?auto_139363 - BLOCK
      ?auto_139364 - BLOCK
      ?auto_139365 - BLOCK
      ?auto_139366 - BLOCK
    )
    :vars
    (
      ?auto_139367 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_139359 ?auto_139360 ) ) ( not ( = ?auto_139359 ?auto_139361 ) ) ( not ( = ?auto_139359 ?auto_139362 ) ) ( not ( = ?auto_139359 ?auto_139363 ) ) ( not ( = ?auto_139359 ?auto_139364 ) ) ( not ( = ?auto_139359 ?auto_139365 ) ) ( not ( = ?auto_139359 ?auto_139366 ) ) ( not ( = ?auto_139360 ?auto_139361 ) ) ( not ( = ?auto_139360 ?auto_139362 ) ) ( not ( = ?auto_139360 ?auto_139363 ) ) ( not ( = ?auto_139360 ?auto_139364 ) ) ( not ( = ?auto_139360 ?auto_139365 ) ) ( not ( = ?auto_139360 ?auto_139366 ) ) ( not ( = ?auto_139361 ?auto_139362 ) ) ( not ( = ?auto_139361 ?auto_139363 ) ) ( not ( = ?auto_139361 ?auto_139364 ) ) ( not ( = ?auto_139361 ?auto_139365 ) ) ( not ( = ?auto_139361 ?auto_139366 ) ) ( not ( = ?auto_139362 ?auto_139363 ) ) ( not ( = ?auto_139362 ?auto_139364 ) ) ( not ( = ?auto_139362 ?auto_139365 ) ) ( not ( = ?auto_139362 ?auto_139366 ) ) ( not ( = ?auto_139363 ?auto_139364 ) ) ( not ( = ?auto_139363 ?auto_139365 ) ) ( not ( = ?auto_139363 ?auto_139366 ) ) ( not ( = ?auto_139364 ?auto_139365 ) ) ( not ( = ?auto_139364 ?auto_139366 ) ) ( not ( = ?auto_139365 ?auto_139366 ) ) ( ON-TABLE ?auto_139366 ) ( ON ?auto_139359 ?auto_139367 ) ( not ( = ?auto_139359 ?auto_139367 ) ) ( not ( = ?auto_139360 ?auto_139367 ) ) ( not ( = ?auto_139361 ?auto_139367 ) ) ( not ( = ?auto_139362 ?auto_139367 ) ) ( not ( = ?auto_139363 ?auto_139367 ) ) ( not ( = ?auto_139364 ?auto_139367 ) ) ( not ( = ?auto_139365 ?auto_139367 ) ) ( not ( = ?auto_139366 ?auto_139367 ) ) ( ON ?auto_139360 ?auto_139359 ) ( ON-TABLE ?auto_139367 ) ( ON ?auto_139361 ?auto_139360 ) ( ON ?auto_139362 ?auto_139361 ) ( ON ?auto_139363 ?auto_139362 ) ( ON ?auto_139364 ?auto_139363 ) ( CLEAR ?auto_139366 ) ( ON ?auto_139365 ?auto_139364 ) ( CLEAR ?auto_139365 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_139367 ?auto_139359 ?auto_139360 ?auto_139361 ?auto_139362 ?auto_139363 ?auto_139364 )
      ( MAKE-8PILE ?auto_139359 ?auto_139360 ?auto_139361 ?auto_139362 ?auto_139363 ?auto_139364 ?auto_139365 ?auto_139366 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_139368 - BLOCK
      ?auto_139369 - BLOCK
      ?auto_139370 - BLOCK
      ?auto_139371 - BLOCK
      ?auto_139372 - BLOCK
      ?auto_139373 - BLOCK
      ?auto_139374 - BLOCK
      ?auto_139375 - BLOCK
    )
    :vars
    (
      ?auto_139376 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_139368 ?auto_139369 ) ) ( not ( = ?auto_139368 ?auto_139370 ) ) ( not ( = ?auto_139368 ?auto_139371 ) ) ( not ( = ?auto_139368 ?auto_139372 ) ) ( not ( = ?auto_139368 ?auto_139373 ) ) ( not ( = ?auto_139368 ?auto_139374 ) ) ( not ( = ?auto_139368 ?auto_139375 ) ) ( not ( = ?auto_139369 ?auto_139370 ) ) ( not ( = ?auto_139369 ?auto_139371 ) ) ( not ( = ?auto_139369 ?auto_139372 ) ) ( not ( = ?auto_139369 ?auto_139373 ) ) ( not ( = ?auto_139369 ?auto_139374 ) ) ( not ( = ?auto_139369 ?auto_139375 ) ) ( not ( = ?auto_139370 ?auto_139371 ) ) ( not ( = ?auto_139370 ?auto_139372 ) ) ( not ( = ?auto_139370 ?auto_139373 ) ) ( not ( = ?auto_139370 ?auto_139374 ) ) ( not ( = ?auto_139370 ?auto_139375 ) ) ( not ( = ?auto_139371 ?auto_139372 ) ) ( not ( = ?auto_139371 ?auto_139373 ) ) ( not ( = ?auto_139371 ?auto_139374 ) ) ( not ( = ?auto_139371 ?auto_139375 ) ) ( not ( = ?auto_139372 ?auto_139373 ) ) ( not ( = ?auto_139372 ?auto_139374 ) ) ( not ( = ?auto_139372 ?auto_139375 ) ) ( not ( = ?auto_139373 ?auto_139374 ) ) ( not ( = ?auto_139373 ?auto_139375 ) ) ( not ( = ?auto_139374 ?auto_139375 ) ) ( ON ?auto_139368 ?auto_139376 ) ( not ( = ?auto_139368 ?auto_139376 ) ) ( not ( = ?auto_139369 ?auto_139376 ) ) ( not ( = ?auto_139370 ?auto_139376 ) ) ( not ( = ?auto_139371 ?auto_139376 ) ) ( not ( = ?auto_139372 ?auto_139376 ) ) ( not ( = ?auto_139373 ?auto_139376 ) ) ( not ( = ?auto_139374 ?auto_139376 ) ) ( not ( = ?auto_139375 ?auto_139376 ) ) ( ON ?auto_139369 ?auto_139368 ) ( ON-TABLE ?auto_139376 ) ( ON ?auto_139370 ?auto_139369 ) ( ON ?auto_139371 ?auto_139370 ) ( ON ?auto_139372 ?auto_139371 ) ( ON ?auto_139373 ?auto_139372 ) ( ON ?auto_139374 ?auto_139373 ) ( CLEAR ?auto_139374 ) ( HOLDING ?auto_139375 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_139375 )
      ( MAKE-8PILE ?auto_139368 ?auto_139369 ?auto_139370 ?auto_139371 ?auto_139372 ?auto_139373 ?auto_139374 ?auto_139375 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_139377 - BLOCK
      ?auto_139378 - BLOCK
      ?auto_139379 - BLOCK
      ?auto_139380 - BLOCK
      ?auto_139381 - BLOCK
      ?auto_139382 - BLOCK
      ?auto_139383 - BLOCK
      ?auto_139384 - BLOCK
    )
    :vars
    (
      ?auto_139385 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_139377 ?auto_139378 ) ) ( not ( = ?auto_139377 ?auto_139379 ) ) ( not ( = ?auto_139377 ?auto_139380 ) ) ( not ( = ?auto_139377 ?auto_139381 ) ) ( not ( = ?auto_139377 ?auto_139382 ) ) ( not ( = ?auto_139377 ?auto_139383 ) ) ( not ( = ?auto_139377 ?auto_139384 ) ) ( not ( = ?auto_139378 ?auto_139379 ) ) ( not ( = ?auto_139378 ?auto_139380 ) ) ( not ( = ?auto_139378 ?auto_139381 ) ) ( not ( = ?auto_139378 ?auto_139382 ) ) ( not ( = ?auto_139378 ?auto_139383 ) ) ( not ( = ?auto_139378 ?auto_139384 ) ) ( not ( = ?auto_139379 ?auto_139380 ) ) ( not ( = ?auto_139379 ?auto_139381 ) ) ( not ( = ?auto_139379 ?auto_139382 ) ) ( not ( = ?auto_139379 ?auto_139383 ) ) ( not ( = ?auto_139379 ?auto_139384 ) ) ( not ( = ?auto_139380 ?auto_139381 ) ) ( not ( = ?auto_139380 ?auto_139382 ) ) ( not ( = ?auto_139380 ?auto_139383 ) ) ( not ( = ?auto_139380 ?auto_139384 ) ) ( not ( = ?auto_139381 ?auto_139382 ) ) ( not ( = ?auto_139381 ?auto_139383 ) ) ( not ( = ?auto_139381 ?auto_139384 ) ) ( not ( = ?auto_139382 ?auto_139383 ) ) ( not ( = ?auto_139382 ?auto_139384 ) ) ( not ( = ?auto_139383 ?auto_139384 ) ) ( ON ?auto_139377 ?auto_139385 ) ( not ( = ?auto_139377 ?auto_139385 ) ) ( not ( = ?auto_139378 ?auto_139385 ) ) ( not ( = ?auto_139379 ?auto_139385 ) ) ( not ( = ?auto_139380 ?auto_139385 ) ) ( not ( = ?auto_139381 ?auto_139385 ) ) ( not ( = ?auto_139382 ?auto_139385 ) ) ( not ( = ?auto_139383 ?auto_139385 ) ) ( not ( = ?auto_139384 ?auto_139385 ) ) ( ON ?auto_139378 ?auto_139377 ) ( ON-TABLE ?auto_139385 ) ( ON ?auto_139379 ?auto_139378 ) ( ON ?auto_139380 ?auto_139379 ) ( ON ?auto_139381 ?auto_139380 ) ( ON ?auto_139382 ?auto_139381 ) ( ON ?auto_139383 ?auto_139382 ) ( ON ?auto_139384 ?auto_139383 ) ( CLEAR ?auto_139384 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_139385 ?auto_139377 ?auto_139378 ?auto_139379 ?auto_139380 ?auto_139381 ?auto_139382 ?auto_139383 )
      ( MAKE-8PILE ?auto_139377 ?auto_139378 ?auto_139379 ?auto_139380 ?auto_139381 ?auto_139382 ?auto_139383 ?auto_139384 ) )
  )

)

